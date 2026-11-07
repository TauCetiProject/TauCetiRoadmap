module

public import Mathlib
public import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Basic
public import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Genus
public import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic
public import TauCeti.RingTheory.Localization.AtPrime
public import TauCeti.RingTheory.DedekindDomain.LocalizationAtPrime

/-!
# Hyperelliptic curves: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states its headline
theorems against the pinned Mathlib and Tau Ceti APIs, with `sorry` proofs.
The headlines represented here are binary-discriminant covariance and integrality,
the discriminant criterion and elliptic discriminant comparison, the function-field
bridge and genus formula, the coordinate-change isomorphism theorem, discriminant
covariance and twisting, and existence and invariance of minimal models.
Definitions have real bodies and are retained only for these statements.

The following headlines are not statable at the pins without substantial new
constructions, so no substitute signatures are supplied:
- The geometric smoothness comparison (0.3) needs the two-chart projective curve
  attached to a model and its comparison with the function field.
- Geometric automorphism classification and twist descent (1.4, 1.5, 2.6) need the
  curve automorphism group and its descent action.
- Igusa classification and Mestre's obstruction (2.4, 2.7) need the integral Igusa
  polynomials, their weighted projective moduli point, and the Mestre conic and cubic.
- The Dedekind-domain obstruction (3.4) needs the hyperelliptic Weierstrass class.
- Good-reduction comparison, conductor–discriminant inequality and Liu's dictionary
  (3.5–3.7) need the model-to-stable-curve and model-to-Jacobian constructions.
- Cluster semistability, the reduction dictionary, the special fibre and its lattice,
  Galois representation, Tamagawa, conductor, minimal discriminant, deficiency,
  root numbers and reduction-type classification (4.4–4.13) need a valued root
  cluster picture with inertia and the comparison to the geometric special fibre;
  an abstract laminar family alone is not that object.
- Jacobian two-torsion, descent and Euler-factor bridges (5.1–5.4) need the Jacobian
  of the model and its torsion and cohomological Galois representations.
- Local solubility (5.5) needs points of the projective two-chart curve.
- The conductor, period and BSD interfaces (5.6–5.7) need that Jacobian's Néron
  model, invariant-differential lattice and compatible-system L-function.

The carrier is `Model R g`, a pair of polynomials `f, h` over a commutative ring `R` with
`natDegree f ≤ 2g + 2` and `natDegree h ≤ g + 1`, the equation `y² + h(x) y = f(x)` of a curve of
genus `g`; it is deliberately parallel to Mathlib's `WeierstrassCurve`, and `ofWeierstrass`
embeds Weierstrass curves as the genus-1 models with `f` monic cubic and `natDegree h ≤ 1`; a
general genus-1 model, such as `y² = −(x⁴ + 1)` over `ℝ`, need not be one (`README.md`,
conventions 1 and 5, Layer 0.5). A curve is a
model with `IsSmooth`, i.e. `IsUnit Δ`; the `k`-isomorphism class of the curve is the orbit of
the model under the changes of coordinates `CoordChange k g` of Layer 1 (convention 7).

Three conventions are visible in the signatures. First, the discriminant is the integer
polynomial `universalΔ g` with `2^{4(g+1)} · Δ = disc_{2g+2}(4f + h²)`, where `disc_n` is the
discriminant of a binary form of degree `n` (`formDiscr`), so that it is defined in
characteristic 2 and agrees with `WeierstrassCurve.Δ` at `g = 1` (convention 3; `Δ_ofWeierstrass`).
Second, a change of coordinates is a triple `(M, e, t)` acting on the coordinates by
`x = (ax' + b)/(cx' + d)`, `y = (e y' + t(x'))/(cx' + d)^{g+1}`, and the discriminant transforms by
`e^{-4(2g+1)} det(M)^{(2g+1)(2g+2)}` (convention 5; `Δ_smul`). Third, minimality over a discrete
valuation ring is stated division-free, as the existence of `r ∈ R` with `Δ(C • W) = r · Δ(W)` for
every integral `C • W`, and global minimality over a Dedekind domain is minimality at every
height-one prime (convention 11).

The function field of a model is `AdjoinRoot (X² + h X − f)` over `RatFunc k`, so that Tau Ceti's
`IsHyperellipticFunctionField`, `genus` and the Layer-10/11 theorems of the algebraic curves
roadmap apply to it directly; `genus_functionField` is the contract (Layer 0.4).
-/

@[expose] public section

namespace TauCetiRoadmap.HyperellipticCurves

open Polynomial

/-! ## Layer 0: models, discriminants and function fields -/

/-- The universal discriminant of a binary form of degree `n`: Mathlib's `Polynomial.discr` of
the universal polynomial `Σ aᵢ Tⁱ` over `ℤ[a₀, …, aₙ]` (`README.md`, Layer 0, 0.1). -/
noncomputable def universalDiscr (n : ℕ) : MvPolynomial (Fin (n + 1)) ℤ :=
  Polynomial.discr
    (∑ i : Fin (n + 1), Polynomial.C (MvPolynomial.X i) * Polynomial.X ^ (i : ℕ))

/-- The discriminant of `G`, viewed as a binary form of degree `n` (`README.md`, Layer 0, 0.1).
When `natDegree G = n` it is `Polynomial.discr G`. For `n ≥ 2`, degree `n - 1`
gives `lc(G)² · discr G`, and degree at most `n - 2` gives `0`. At `n = 1`
it is always `1`, including on constant polynomials. -/
noncomputable def formDiscr {R : Type*} [CommRing R] (n : ℕ) (G : R[X]) : R :=
  MvPolynomial.aeval (fun i : Fin (n + 1) => G.coeff i) (universalDiscr n)

variable {R : Type*} [CommRing R]

/-- The homogeneous substitution `(G ∘ M)(X) = Σ Gᵢ (aX + b)ⁱ (cX + d)^{n-i}`, the action of a
`2 × 2` matrix on binary forms of degree `n` written without division (`README.md`, Layer 0, 0.1
and Layer 1, 1.1). It is Tau Ceti's `linearSubstRep (Fin 2) R n` on the binary form with these
coefficients, transported to `R[X]` by dehomogenisation; the comparison is a target of 0.1. -/
noncomputable def homogSubst (n : ℕ) (M : Matrix (Fin 2) (Fin 2) R) (p : R[X]) : R[X] :=
  ∑ i ∈ Finset.range (n + 1),
    C (p.coeff i) * (C (M 0 0) * X + C (M 0 1)) ^ i * (C (M 1 0) * X + C (M 1 1)) ^ (n - i)

/-- `README.md`, Layer 0, 0.1: the homogeneous substitution of degree `n` has degree at most `n`. -/
theorem natDegree_homogSubst_le (n : ℕ) (M : Matrix (Fin 2) (Fin 2) R) (p : R[X]) :
    (homogSubst n M p).natDegree ≤ n := by
  refine natDegree_sum_le_of_forall_le _ _ fun i hi => ?_
  have hi : i ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)
  have h₁ : (C (M 0 0) * X + C (M 0 1)).natDegree ≤ 1 := by compute_degree
  have h₂ : (C (M 1 0) * X + C (M 1 1)).natDegree ≤ 1 := by compute_degree
  refine natDegree_mul_le.trans ?_
  have := add_le_add ((natDegree_C_mul_le (p.coeff i) _).trans (natDegree_pow_le_of_le i h₁))
    (natDegree_pow_le_of_le (n - i) h₂)
  omega

/-- `README.md`, Layer 0, 0.1: `GL₂`-covariance of the binary-form discriminant, weight
`n(n-1)`. -/
theorem formDiscr_homogSubst (n : ℕ) (M : Matrix (Fin 2) (Fin 2) R) {p : R[X]}
    (hp : p.natDegree ≤ n) :
    formDiscr n (homogSubst n M p) = M.det ^ (n * (n - 1)) * formDiscr n p := sorry

/-! ### Layer 0.2–0.3: the model and its discriminant -/

/-- A Weierstrass model `y² + h(x) y = f(x)` of a curve of genus `g` over `R`
(`README.md`, convention 1, Layer 0, 0.2). -/
structure Model (R : Type*) [CommRing R] (g : ℕ) where
  /-- The right-hand side `f`, of degree at most `2g + 2`. -/
  f : R[X]
  /-- The cross term `h`, of degree at most `g + 1`. -/
  h : R[X]
  f_natDegree_le : f.natDegree ≤ 2 * g + 2
  h_natDegree_le : h.natDegree ≤ g + 1

namespace Model

variable {g : ℕ}

/-- The binary form `4f + h²` of degree `≤ 2g + 2` whose roots are the finite Weierstrass points
away from characteristic 2 (`README.md`, convention 6). -/
noncomputable def weierstrassForm (W : Model R g) : R[X] := 4 * W.f + W.h ^ 2

/-- The universal model, whose coefficients are the variables `a₀, …, a_{2g+2}, b₀, …, b_{g+1}`
(`README.md`, Layer 0, 0.3). -/
noncomputable def universal (g : ℕ) : Model (MvPolynomial (Fin (2 * g + 3) ⊕ Fin (g + 2)) ℤ) g where
  f := ∑ i : Fin (2 * g + 3), C (MvPolynomial.X (Sum.inl i)) * X ^ (i : ℕ)
  h := ∑ j : Fin (g + 2), C (MvPolynomial.X (Sum.inr j)) * X ^ (j : ℕ)
  f_natDegree_le := natDegree_sum_le_of_forall_le _ _ fun i _ =>
    (natDegree_C_mul_X_pow_le _ _).trans (by omega)
  h_natDegree_le := natDegree_sum_le_of_forall_le _ _ fun j _ =>
    (natDegree_C_mul_X_pow_le _ _).trans (by omega)

/-- The universal discriminant of a genus-`g` model: the integer polynomial in the coefficients
with `2 ^ (4 * (g + 1)) * universalΔ g = disc_{2g+2}(4f + h²)` (`README.md`, convention 3, Layer 0,
0.3), obtained by dividing every integer coefficient of `disc_{2g+2}(4f + h²)` by `2 ^ (4 * (g + 1))`.
That this division is exact is the integrality theorem `two_pow_mul_universalΔ`. -/
noncomputable def universalΔ (g : ℕ) : MvPolynomial (Fin (2 * g + 3) ⊕ Fin (g + 2)) ℤ :=
  let D : MvPolynomial (Fin (2 * g + 3) ⊕ Fin (g + 2)) ℤ :=
    formDiscr (2 * g + 2) (universal g).weierstrassForm
  ∑ m ∈ D.support, MvPolynomial.monomial m (D.coeff m / 2 ^ (4 * (g + 1)))

/-- `README.md`, Layer 0, 0.3: the defining property of `universalΔ`. -/
theorem two_pow_mul_universalΔ (g : ℕ) :
    (2 : MvPolynomial (Fin (2 * g + 3) ⊕ Fin (g + 2)) ℤ) ^ (4 * (g + 1)) * universalΔ g =
      formDiscr (2 * g + 2) (universal g).weierstrassForm := sorry

/-- The discriminant of a model (`README.md`, convention 3, Layer 0, 0.3). -/
noncomputable def Δ (W : Model R g) : R :=
  MvPolynomial.aeval (Sum.elim (fun i : Fin (2 * g + 3) => W.f.coeff i)
    (fun j : Fin (g + 2) => W.h.coeff j)) (universalΔ g)

/-- A model is **smooth** (defines a hyperelliptic curve, for `g ≥ 2`) when its discriminant is
a unit (`README.md`, convention 4, Layer 0, 0.3). -/
class IsSmooth (W : Model R g) : Prop where
  isUnit_Δ : IsUnit W.Δ

/-- `README.md`, Layer 0, 0.3: over a field of characteristic `≠ 2`, smoothness is separability
of the Weierstrass form together with full degree `2g + 1` or `2g + 2` (a simple root at infinity).
`Separable`, not `Squarefree`: over `𝔽₅(t)` the form `x⁵ − t` is squarefree and `Δ = 0`. -/
theorem isSmooth_iff_separable {k : Type*} [Field k] (h2 : (2 : k) ≠ 0) (W : Model k g) :
    W.IsSmooth ↔ W.weierstrassForm.Separable ∧ 2 * g + 1 ≤ W.weierstrassForm.natDegree := sorry

/-! ### Layer 0.4: the function field -/

section FunctionField

variable {k : Type*} [Field k]

/-- The equation `Y² + h Y − f` over `k(x)` (`README.md`, Layer 0, 0.4). -/
noncomputable def equationPolynomial (W : Model k g) : (RatFunc k)[X] :=
  X ^ 2 + C (algebraMap k[X] (RatFunc k) W.h) * X - C (algebraMap k[X] (RatFunc k) W.f)

/-- The function field `k(x)[Y]/(Y² + hY − f)` of a model (`README.md`, Layer 0, 0.4). It is a
field once `equationPolynomial` is irreducible (`irreducible_equationPolynomial`). -/
abbrev FunctionField (W : Model k g) : Type _ := AdjoinRoot W.equationPolynomial

/-- `README.md`, Layer 0, 0.4: for a smooth model of genus `≥ 1` the equation is irreducible. -/
theorem irreducible_equationPolynomial (W : Model k g) [W.IsSmooth] (hg : 1 ≤ g) :
    Irreducible W.equationPolynomial := sorry

/-- `README.md`, Layer 0, 0.4: the function field of a model is an algebraic function field over
`k` with exact constants. -/
theorem isFunctionField_functionField (W : Model k g) [Fact (Irreducible W.equationPolynomial)]
    [W.IsSmooth] :
    TauCeti.IsFunctionField k W.FunctionField ∧ IsIntegrallyClosedIn k W.FunctionField :=
  sorry

/-- `README.md`, Layer 0, 0.4: **the genus of the function field of a smooth model is `g`**, in
every characteristic. This is the contract with the algebraic curves roadmap. -/
theorem genus_functionField (W : Model k g) [Fact (Irreducible W.equationPolynomial)]
    [W.IsSmooth] : TauCeti.genus k W.FunctionField = g := sorry

/-- `README.md`, Layer 0, 0.4: for `g ≥ 2` the function field is hyperelliptic in Tau Ceti's
sense (the index-2 subfield is `k(x)`, separable because the model is smooth). -/
theorem isHyperellipticFunctionField (W : Model k g) [Fact (Irreducible W.equationPolynomial)]
    [W.IsSmooth] (hg : 2 ≤ g) : TauCeti.IsHyperellipticFunctionField k W.FunctionField := sorry

end FunctionField

/-! ### Layer 0.5: Weierstrass curves as genus-1 models (bridge check) -/

/-- A Weierstrass curve as a genus-1 model, the sub-case `f` monic cubic, `natDegree h ≤ 1`
(`README.md`, Layer 0, 0.5). This is a real definition: the degree bounds are checked by the
elaborator. -/
noncomputable def ofWeierstrass (E : WeierstrassCurve R) : Model R 1 where
  f := X ^ 3 + C E.a₂ * X ^ 2 + C E.a₄ * X + C E.a₆
  h := C E.a₁ * X + C E.a₃
  f_natDegree_le := by compute_degree!
  h_natDegree_le := by compute_degree!

/-- `README.md`, Layer 0, 0.5: the two discriminants agree, an identity of integer polynomials in
`a₁, …, a₆` (`2^{-8} disc_4(4f + h²) = Δ_W`). -/
theorem Δ_ofWeierstrass (E : WeierstrassCurve R) : (ofWeierstrass E).Δ = E.Δ := sorry

end Model

/-! ## Layer 1: changes of coordinates -/

/-- A change of coordinates `(M, e, t)`: `x = (ax' + b)/(cx' + d)`,
`y = (e y' + t(x'))/(cx' + d)^{g+1}` (`README.md`, convention 5, Layer 1, 1.1). -/
structure CoordChange (R : Type*) [CommRing R] (g : ℕ) where
  /-- The Möbius part. -/
  M : GL (Fin 2) R
  /-- The scaling of `y`. -/
  e : Rˣ
  /-- The shear `t`, of degree at most `g + 1`. -/
  t : R[X]
  t_natDegree_le : t.natDegree ≤ g + 1

namespace CoordChange

variable {g : ℕ}

/-- The model obtained by the change of coordinates `C` (`README.md`, convention 5, Layer 1,
1.2): `h' = e⁻¹(2t + H)`, `f' = e⁻²(F − t² − Ht)` with `F = f ∘_{2g+2} M`, `H = h ∘_{g+1} M`. -/
noncomputable def act (γ : CoordChange R g) (W : Model R g) : Model R g where
  f := C (↑γ.e⁻¹) ^ 2 *
    (homogSubst (2 * g + 2) (γ.M : Matrix (Fin 2) (Fin 2) R) W.f - γ.t ^ 2 -
      homogSubst (g + 1) (γ.M : Matrix (Fin 2) (Fin 2) R) W.h * γ.t)
  h := C (↑γ.e⁻¹) * (2 * γ.t + homogSubst (g + 1) (γ.M : Matrix (Fin 2) (Fin 2) R) W.h)
  f_natDegree_le := by
    have hF := natDegree_homogSubst_le (2 * g + 2) (γ.M : Matrix (Fin 2) (Fin 2) R) W.f
    have hH := natDegree_homogSubst_le (g + 1) (γ.M : Matrix (Fin 2) (Fin 2) R) W.h
    have ht := γ.t_natDegree_le
    refine natDegree_mul_le.trans ?_
    have hc : (C (↑γ.e⁻¹ : R) ^ 2).natDegree = 0 := by rw [← C_pow, natDegree_C]
    rw [hc, zero_add]
    refine (natDegree_sub_le _ _).trans (max_le ((natDegree_sub_le _ _).trans (max_le hF ?_)) ?_)
    · exact natDegree_pow_le.trans (by omega)
    · exact natDegree_mul_le.trans (by omega)
  h_natDegree_le := by
    have hH := natDegree_homogSubst_le (g + 1) (γ.M : Matrix (Fin 2) (Fin 2) R) W.h
    refine (natDegree_C_mul_le _ _).trans ((natDegree_add_le _ _).trans (max_le ?_ hH))
    exact natDegree_mul_le.trans (by simpa using γ.t_natDegree_le)

/-- `README.md`, Layer 1, 1.2: the action of `𝒢_g(R)` on models, `C • W := act C W`. That it is a
left action for the group law of 1.1 is a target of 1.2. -/
noncomputable instance : SMul (CoordChange R g) (Model R g) := ⟨act⟩

/-- `README.md`, Layer 1, 1.2: **the transformation law of the discriminant**,
`Δ(C • W) = e^{-4(2g+1)} det(M)^{(2g+1)(2g+2)} Δ(W)`. -/
theorem Δ_smul (C : CoordChange R g) (W : Model R g) :
    (C • W).Δ = ((C.e⁻¹ : Rˣ) : R) ^ (4 * (2 * g + 1)) *
      ((Matrix.GeneralLinearGroup.det C.M : Rˣ) : R) ^ ((2 * g + 1) * (2 * g + 2)) * W.Δ := sorry

end CoordChange

namespace Model

variable {g : ℕ} {k : Type*} [Field k]

/-- `README.md`, Layer 1, 1.3: **isomorphisms of hyperelliptic curves are changes of
coordinates**. For smooth models of genus `g ≥ 2`, the function fields are `k`-isomorphic iff
the models lie in one `𝒢_g(k)`-orbit. -/
theorem nonempty_algEquiv_functionField_iff (W₁ W₂ : Model k g) [W₁.IsSmooth] [W₂.IsSmooth]
    [Fact (Irreducible W₁.equationPolynomial)] [Fact (Irreducible W₂.equationPolynomial)]
    (hg : 2 ≤ g) :
    Nonempty (W₁.FunctionField ≃ₐ[k] W₂.FunctionField) ↔ ∃ C : CoordChange k g, C • W₁ = W₂ :=
  sorry

/-- The quadratic twist of a model by the quadratic algebra `R[θ]/(θ² − tθ + n)`, with
`D = t² − 4n`: the model `(D f − n h², t h)`, whose Weierstrass form is `D · (4f + h²)`
(`README.md`, convention 15, Layer 1, 1.5). A real definition, the shape of Tau Ceti's
`WeierstrassCurve.quadraticTwistOf t n`; `t = 0, n = −d` is the classical twist by `d` away from
characteristic 2, `t = 1, n = c` the Artin–Schreier twist in characteristic 2. -/
noncomputable def quadraticTwist (W : Model R g) (t n : R) : Model R g where
  f := C (t ^ 2 - 4 * n) * W.f - C n * W.h ^ 2
  h := C t * W.h
  f_natDegree_le := (natDegree_sub_le _ _).trans (max_le
    ((natDegree_C_mul_le _ _).trans W.f_natDegree_le)
    ((natDegree_C_mul_le _ _).trans (natDegree_pow_le.trans
      (by have := W.h_natDegree_le; omega))))
  h_natDegree_le := (natDegree_C_mul_le _ _).trans W.h_natDegree_le

/-- `README.md`, Layer 1, 1.5: the discriminant of a quadratic twist, `D^{2(2g+1)} Δ`, an identity
of integer polynomials (at `g = 1`, Tau Ceti's `Δ_quadraticTwistOf : D⁶ Δ`). -/
theorem Δ_quadraticTwist (W : Model R g) (t n : R) :
    (W.quadraticTwist t n).Δ = (t ^ 2 - 4 * n) ^ (2 * (2 * g + 1)) * W.Δ := sorry

/-- `README.md`, Layer 1, 1.5: the `g = 1` bridge. Tau Ceti's `quadraticTwistOf` is the model
above after the integral rescaling `([[1, 0], [0, D]], D, 0)`, a change of coordinates when
`D ≠ 0`. -/
theorem exists_smul_quadraticTwist_ofWeierstrass (E : WeierstrassCurve k) (t n : k)
    (hD : t ^ 2 - 4 * n ≠ 0) :
    ∃ C : CoordChange k 1,
      C • (ofWeierstrass E).quadraticTwist t n = ofWeierstrass (E.quadraticTwistOf t n) := sorry

/-! ## Layer 3: integral and minimal models -/

section Local

variable (R) {K : Type*} [Field K] [Algebra R K]

/-- A model over `K` is integral over `R` when its coefficients lie in `R` (`README.md`,
convention 11, Layer 3, 3.1). -/
class IsIntegral (W : Model K g) : Prop where
  f_coeff_mem : ∀ i, W.f.coeff i ∈ (algebraMap R K).range
  h_coeff_mem : ∀ i, W.h.coeff i ∈ (algebraMap R K).range

/-- A model is minimal over the discrete valuation ring `R` when it is integral and every
integral change of coordinates does not decrease `v(Δ)`, stated division-free
(`README.md`, convention 11, Layer 3, 3.2). -/
class IsMinimal [IsDomain R] [IsDiscreteValuationRing R] [IsFractionRing R K] (W : Model K g) :
    Prop extends IsIntegral R W where
  minimal : ∀ C : CoordChange K g, IsIntegral R (C • W) →
    ∃ r : R, (C • W).Δ = algebraMap R K r * W.Δ

variable [IsDomain R] [IsDiscreteValuationRing R] [IsFractionRing R K]

/-- `README.md`, Layer 3, 3.2: every smooth model has a minimal model. -/
theorem exists_isMinimal (W : Model K g) [W.IsSmooth] :
    ∃ C : CoordChange K g, IsMinimal R (C • W) := sorry

/-- `README.md`, Layer 3, 3.3: at `g = 1`, minimality is Mathlib's `WeierstrassCurve.IsMinimal`. -/
theorem isMinimal_ofWeierstrass_iff (E : WeierstrassCurve K) [E.IsElliptic] :
    IsMinimal R (ofWeierstrass E) ↔ WeierstrassCurve.IsMinimal R E := sorry

end Local

section Global

open IsDedekindDomain

variable (O : Type*) [CommRing O] [IsDedekindDomain O] {K : Type*} [Field K] [Algebra O K]
  [IsFractionRing O K]

/-- A model over the fraction field `K` of a Dedekind domain `O` is **globally minimal** when it is
minimal over the discrete valuation ring `Localization.AtPrime v.asIdeal` at every height-one
prime `v` (`README.md`, convention 11, Layer 3, 3.4), the shape of Tau Ceti's
`WeierstrassCurve.IsGlobalMinimal`; over `ℚ` this is minimality at every prime. -/
def IsGlobalMinimal (W : Model K g) : Prop :=
  ∀ v : HeightOneSpectrum O, IsMinimal (Localization.AtPrime v.asIdeal) W

/-- `README.md`, Layer 3, 3.4: **global minimal models exist over a principal ideal domain**. -/
theorem exists_isGlobalMinimal [IsPrincipalIdealRing O] (W : Model K g) [W.IsSmooth] :
    ∃ C : CoordChange K g, IsGlobalMinimal O (C • W) := sorry

/-- `README.md`, Layer 3, 3.4: two global minimal models over `ℤ` of one curve have the same
discriminant, sign included: the ratio is a `p`-adic unit at every prime, hence `±1`, and it is
the positive rational `e^{−4(2g+1)} det(M)^{(2g+1)(2g+2)}`. In genus `≥ 2` the two models need not
be related by an element of `𝒢_g(ℤ)`. -/
theorem Δ_eq_of_isGlobalMinimal (W : Model ℚ g) [W.IsSmooth] (C : CoordChange ℚ g)
    (hW : IsGlobalMinimal ℤ W) (hC : IsGlobalMinimal ℤ (C • W)) : (C • W).Δ = W.Δ := sorry

end Global

end Model

end TauCetiRoadmap.HyperellipticCurves

end
