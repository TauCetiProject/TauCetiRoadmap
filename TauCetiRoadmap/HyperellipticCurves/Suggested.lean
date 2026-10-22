import Mathlib
import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Basic
import TauCeti.FieldTheory.FunctionField.Hyperelliptic.Genus
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic

/-!
# Hyperelliptic curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
carrier, the binary-form and model discriminants, the action of changes of coordinates, the
function-field bridge, integral and minimal models, and the cluster-picture carrier with its
vocabulary. Every definition here has its real body. The other targets — the group law on
changes of coordinates and the automorphism group (1.1, 1.4), the genus-2 invariants (Layer 2),
the cluster picture of a polynomial (4.1), the two-torsion rank (5.1) and everything after them —
are specified, with their definitions and Checks, in `README.md` only. Theorem proofs are
`sorry`; the bridge checks (`ofWeierstrass`, `involution`, `simplified`, `quadraticTwist`, the
non-vacuity models `model3125`, `model169`) are real terms so that the elaborator checks the
degree bounds the README promises.

The carrier is `Model R g`, a pair of polynomials `f, h` over a commutative ring `R` with
`natDegree f ≤ 2g + 2` and `natDegree h ≤ g + 1`, the equation `y² + h(x) y = f(x)` of a curve of
genus `g`; it is deliberately parallel to Mathlib's `WeierstrassCurve`, and `ofWeierstrass`
exhibits genus 1 as a special case (`README.md`, conventions 1 and 5, Layer 0.5). A curve is a
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
every integral `C • W` (convention 11).

The function field of a model is `AdjoinRoot (X² + h X − f)` over `RatFunc k`, so that Tau Ceti's
`IsHyperellipticFunctionField`, `genus` and the Layer-10/11 theorems of the algebraic curves
roadmap apply to it directly; `genus_functionField` is the contract (Layer 0.4). Cluster pictures
are an abstract combinatorial carrier `ClusterPicture X` (DDMM Definition 1.26); the picture of
the roots of a polynomial is README 4.1's target.
-/

namespace TauCetiRoadmap.HyperellipticCurves

open Polynomial

/-! ### Layer 0.1: the discriminant of a binary form -/

/-- The universal discriminant of a binary form of degree `n`: Mathlib's `Polynomial.discr` of
the universal polynomial `Σ aᵢ Tⁱ` over `ℤ[a₀, …, aₙ]` (`README.md`, Layer 0, 0.1). -/
noncomputable def universalDiscr (n : ℕ) : MvPolynomial (Fin (n + 1)) ℤ :=
  Polynomial.discr
    (∑ i : Fin (n + 1), Polynomial.C (MvPolynomial.X i) * Polynomial.X ^ (i : ℕ))

/-- The discriminant of `G`, viewed as a binary form of degree `n` (`README.md`, Layer 0, 0.1).
When `natDegree G = n` it is `Polynomial.discr G`; when `natDegree G = n - 1` it is
`lc(G)² · discr G`; when `natDegree G ≤ n - 2` it is `0`. -/
noncomputable def formDiscr {R : Type*} [CommRing R] (n : ℕ) (G : R[X]) : R :=
  MvPolynomial.aeval (fun i : Fin (n + 1) => G.coeff i) (universalDiscr n)

variable {R : Type*} [CommRing R]

/-- `README.md`, Layer 0, 0.1: the binary-form discriminant of a form of full degree. -/
theorem formDiscr_eq_discr_of_natDegree_eq {n : ℕ} {G : R[X]} (hG : G.natDegree = n) :
    formDiscr n G = Polynomial.discr G := sorry

/-- `README.md`, Layer 0, 0.1: one root at infinity contributes the square of the leading
coefficient. -/
theorem formDiscr_eq_of_natDegree_eq_pred {n : ℕ} (hn : 1 ≤ n) {G : R[X]}
    (hG : G.natDegree = n - 1) :
    formDiscr n G = G.leadingCoeff ^ 2 * Polynomial.discr G := sorry

/-- `README.md`, Layer 0, 0.1: a double root at infinity. -/
theorem formDiscr_eq_zero_of_natDegree_le {n : ℕ} (hn : 2 ≤ n) {G : R[X]}
    (hG : G.natDegree ≤ n - 2) : formDiscr n G = 0 := sorry

/-- `README.md`, Layer 0, 0.1: homogeneity of degree `2n - 2`. -/
theorem formDiscr_C_mul (n : ℕ) (c : R) (G : R[X]) :
    formDiscr n (C c * G) = c ^ (2 * n - 2) * formDiscr n G := sorry

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

/-- `README.md`, convention 1: the Weierstrass form is a binary form of degree `2g + 2`. -/
theorem weierstrassForm_natDegree_le (W : Model R g) : W.weierstrassForm.natDegree ≤ 2 * g + 2 := by
  unfold weierstrassForm
  refine (natDegree_add_le _ _).trans (max_le ?_ ?_)
  · calc (4 * W.f).natDegree ≤ (4 : R[X]).natDegree + W.f.natDegree := natDegree_mul_le
      _ ≤ 0 + (2 * g + 2) := Nat.add_le_add (by simp) W.f_natDegree_le
      _ = 2 * g + 2 := by simp
  · calc (W.h ^ 2).natDegree ≤ 2 * W.h.natDegree := natDegree_pow_le
      _ ≤ 2 * (g + 1) := Nat.mul_le_mul_left 2 W.h_natDegree_le
      _ = 2 * g + 2 := by ring

/-- The simplified equation `y² = 4f + h²` as a model (`README.md`, Layer 1, 1.2). A real
definition: over `ℤ[1/2]` it is `(1, 1/2, −h/2) • W`, and over `ℤ` it is never minimal at `2`
(`Δ_simplified`). -/
noncomputable def simplified (W : Model R g) : Model R g :=
  ⟨W.weierstrassForm, 0, W.weierstrassForm_natDegree_le, by simp⟩

/-- Base change of a model along a ring homomorphism (`README.md`, Layer 0, 0.2). -/
noncomputable def map {S : Type*} [CommRing S] (φ : R →+* S) (W : Model R g) : Model S g where
  f := W.f.map φ
  h := W.h.map φ
  f_natDegree_le := natDegree_map_le.trans W.f_natDegree_le
  h_natDegree_le := natDegree_map_le.trans W.h_natDegree_le

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

/-- `README.md`, Layer 0, 0.3: `2^{4(g+1)} Δ = disc_{2g+2}(4f + h²)`; over a ring in which `2` is
a unit this determines `Δ`. -/
theorem two_pow_mul_Δ (W : Model R g) :
    (2 : R) ^ (4 * (g + 1)) * W.Δ = formDiscr (2 * g + 2) W.weierstrassForm := sorry

/-- `README.md`, Layer 0, 0.3: `Δ(f, 0) = 2^{4g} disc_{2g+2} f`. -/
theorem Δ_of_h_eq_zero (W : Model R g) (hW : W.h = 0) :
    W.Δ = 2 ^ (4 * g) * formDiscr (2 * g + 2) W.f := sorry

/-- `README.md`, Layer 1, 1.2: the discriminant of the simplified equation `y² = 4f + h²` is
`2^{4(2g+1)} Δ(W)` (`2^{20} Δ(W)` at `g = 2`), so the simplified model is never minimal at `2`. -/
theorem Δ_simplified (W : Model R g) : W.simplified.Δ = 2 ^ (4 * (2 * g + 1)) * W.Δ := sorry

/-- `README.md`, Layer 0, 0.3: the discriminant commutes with base change. -/
theorem Δ_map {S : Type*} [CommRing S] (φ : R →+* S) (W : Model R g) : (W.map φ).Δ = φ W.Δ :=
  sorry

/-- A model is **smooth** (defines a hyperelliptic curve, for `g ≥ 2`) when its discriminant is
a unit (`README.md`, convention 4, Layer 0, 0.3). -/
class IsSmooth (W : Model R g) : Prop where
  isUnit_Δ : IsUnit W.Δ

/-- `README.md`, Layer 0, 0.3: over a field of characteristic `≠ 2`, smoothness is separability
of the Weierstrass form together with full degree `2g + 1` or `2g + 2` (a simple root at infinity).
`Separable`, not `Squarefree`: over `𝔽₅(t)` the form `x⁵ − t` is squarefree and `Δ = 0`. -/
theorem isSmooth_iff_separable {k : Type*} [Field k] (h2 : (2 : k) ≠ 0) (W : Model k g) :
    W.IsSmooth ↔ W.weierstrassForm.Separable ∧ 2 * g + 1 ≤ W.weierstrassForm.natDegree := sorry

/-! ### Layer 0.5: genus 1 is Mathlib's Weierstrass curve (bridge check) -/

/-- A Weierstrass curve as a genus-1 model (`README.md`, Layer 0, 0.5). This is a real
definition: the degree bounds are checked by the elaborator. -/
noncomputable def ofWeierstrass (E : WeierstrassCurve R) : Model R 1 where
  f := X ^ 3 + C E.a₂ * X ^ 2 + C E.a₄ * X + C E.a₆
  h := C E.a₁ * X + C E.a₃
  f_natDegree_le := by compute_degree!
  h_natDegree_le := by compute_degree!

/-- `README.md`, Layer 0, 0.5: the two discriminants agree, an identity of integer polynomials in
`a₁, …, a₆` (`2^{-8} disc_4(4f + h²) = Δ_W`). -/
theorem Δ_ofWeierstrass (E : WeierstrassCurve R) : (ofWeierstrass E).Δ = E.Δ := sorry

/-- `README.md`, Layer 0, 0.5: smooth genus-1 models are elliptic curves. -/
theorem isSmooth_ofWeierstrass_iff (E : WeierstrassCurve R) :
    (ofWeierstrass E).IsSmooth ↔ E.IsElliptic := sorry

/-- Non-vacuity: `y² + y = x⁵` (LMFDB 3125.a.3125.1) is a genus-2 model over `ℚ`
(`README.md`, worked examples). -/
noncomputable def model3125 : Model ℚ 2 :=
  ⟨X ^ 5, 1, (natDegree_X_pow_le 5).trans (by norm_num), natDegree_one.le.trans (by norm_num)⟩

/-- Non-vacuity: `y² + (x³ + x + 1) y = x⁵ + x⁴` (LMFDB 169.a.169.1, the curve `X₁(13)`;
`README.md`, worked examples). -/
noncomputable def model169 : Model ℚ 2 where
  f := X ^ 5 + X ^ 4
  h := X ^ 3 + X + 1
  f_natDegree_le := by compute_degree!
  h_natDegree_le := by compute_degree!

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

/-! ### Layer 0.6: affine points and the hyperelliptic involution (bridge check) -/

/-- An affine point of a model (`README.md`, Layer 0, 0.6). -/
structure AffinePoint (W : Model R g) where
  /-- The `x`-coordinate. -/
  x : R
  /-- The `y`-coordinate. -/
  y : R
  equation : y ^ 2 + W.h.eval x * y = W.f.eval x

/-- The hyperelliptic involution `(x, y) ↦ (x, −y − h(x))` on affine points (`README.md`,
convention 6, Layer 0, 0.6). A real definition: the equation is checked. -/
def involution (W : Model R g) : W.AffinePoint ≃ W.AffinePoint where
  toFun P := ⟨P.x, -P.y - W.h.eval P.x, by linear_combination P.equation⟩
  invFun P := ⟨P.x, -P.y - W.h.eval P.x, by linear_combination P.equation⟩
  left_inv P := by
    obtain ⟨x, y, hP⟩ := P
    simp only [AffinePoint.mk.injEq, true_and]
    ring
  right_inv P := by
    obtain ⟨x, y, hP⟩ := P
    simp only [AffinePoint.mk.injEq, true_and]
    ring

/-- The number of `k`-rational Weierstrass points of a smooth model, the LMFDB's `num_rat_wpts`
(`README.md`, convention 6, Layer 0, 0.6): the affine points fixed by the involution, plus the
points at infinity `y² + h_{g+1} y = f_{2g+2}` fixed by `y ↦ −y − h_{g+1}`. -/
noncomputable def numRationalWeierstrassPoints {k : Type*} [Field k] (W : Model k g) : ℕ :=
  Nat.card {P : W.AffinePoint // W.involution P = P} +
    Nat.card {y : k // y ^ 2 + W.h.coeff (g + 1) * y = W.f.coeff (2 * g + 2) ∧
      -y - W.h.coeff (g + 1) = y}

open Classical in
/-- `README.md`, Layer 0, 0.6: away from characteristic 2 the rational Weierstrass points are the
rational roots of `4f + h²`, plus the point at infinity when the form has degree `2g + 1`. -/
theorem numRationalWeierstrassPoints_eq {k : Type*} [Field k] (h2 : (2 : k) ≠ 0) (W : Model k g)
    [W.IsSmooth] :
    W.numRationalWeierstrassPoints =
      W.weierstrassForm.roots.toFinset.card +
        if W.weierstrassForm.natDegree = 2 * g + 1 then 1 else 0 := sorry

end Model

/-! ### Layer 1: changes of coordinates -/

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

/-- The hyperelliptic involution as the change of coordinates `(1, −1, −h)` (`README.md`,
convention 6). -/
noncomputable def involution (W : Model R g) : CoordChange R g where
  M := 1
  e := -1
  t := -W.h
  t_natDegree_le := (natDegree_neg W.h).le.trans W.h_natDegree_le

/-- `README.md`, Layer 1, 1.2: **the transformation law of the discriminant**,
`Δ(C • W) = e^{-4(2g+1)} det(M)^{(2g+1)(2g+2)} Δ(W)`. -/
theorem Δ_smul (C : CoordChange R g) (W : Model R g) :
    (C • W).Δ = ((C.e⁻¹ : Rˣ) : R) ^ (4 * (2 * g + 1)) *
      ((Matrix.GeneralLinearGroup.det C.M : Rˣ) : R) ^ ((2 * g + 1) * (2 * g + 2)) * W.Δ := sorry

/-- `README.md`, Layer 1, 1.2: smoothness is invariant. -/
theorem isSmooth_smul (C : CoordChange R g) (W : Model R g) [W.IsSmooth] : (C • W).IsSmooth :=
  sorry

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

/-! ### Layer 3: integral and minimal models -/

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

/-- `README.md`, Layer 3, 3.3: two minimal models of one curve have discriminants differing by a
unit of `R`, so the minimal discriminant valuation is an invariant of the curve. -/
theorem exists_unit_Δ_eq_of_isMinimal (W : Model K g) [W.IsSmooth] (C : CoordChange K g)
    [IsMinimal R W] [IsMinimal R (C • W)] :
    ∃ u : Rˣ, (C • W).Δ = algebraMap R K u * W.Δ := sorry

/-- `README.md`, Layer 3, 3.3: at `g = 1`, minimality is Mathlib's `WeierstrassCurve.IsMinimal`. -/
theorem isMinimal_ofWeierstrass_iff (E : WeierstrassCurve K) [E.IsElliptic] :
    IsMinimal R (ofWeierstrass E) ↔ WeierstrassCurve.IsMinimal R E := sorry

/-- `README.md`, Layer 3, 3.5: a minimal model has good reduction iff `Δ` is a unit of `R`. -/
def HasGoodReduction (W : Model K g) : Prop :=
  ∃ C : CoordChange K g, IsMinimal R (C • W) ∧ ∃ u : Rˣ, (C • W).Δ = algebraMap R K u

end Local

section Global

/-- A model over `ℚ` is a **global minimal model** when it is integral over `ℤ` and `|Δ|` is
minimal among integral models of its curve (`README.md`, convention 11, Layer 3, 3.4); over `ℤ`
this is equivalent to minimality at every prime. -/
def IsGlobalMinimal (W : Model ℚ g) : Prop :=
  IsIntegral ℤ W ∧ ∀ C : CoordChange ℚ g, IsIntegral ℤ (C • W) → |W.Δ| ≤ |(C • W).Δ|

/-- `README.md`, Layer 3, 3.4: global minimal models exist over `ℤ`. -/
theorem exists_isGlobalMinimal (W : Model ℚ g) [W.IsSmooth] :
    ∃ C : CoordChange ℚ g, IsGlobalMinimal (C • W) := sorry

/-- `README.md`, Layer 3, 3.4: two global minimal models are related by `𝒢_g(ℤ)` and have the
same discriminant, sign included (the units of `ℤ` enter through even powers). -/
theorem Δ_eq_of_isGlobalMinimal (W : Model ℚ g) [W.IsSmooth] (C : CoordChange ℚ g)
    (hW : IsGlobalMinimal W) (hC : IsGlobalMinimal (C • W)) : (C • W).Δ = W.Δ := sorry

open Classical in
/-- The minimal discriminant of a curve over `ℚ`, with its sign: the discriminant of a chosen
global minimal model, an integer since that model is integral (`README.md`, Layer 3, 3.4);
`abs_disc = |minimalDiscriminant|`. It does not depend on the choice by
`Δ_eq_of_isGlobalMinimal`; the value `0` when no global minimal model exists is junk, excluded by
`exists_isGlobalMinimal`. -/
noncomputable def minimalDiscriminant (W : Model ℚ g) : ℤ :=
  if h : ∃ C : CoordChange ℚ g, IsGlobalMinimal (C • W) then (h.choose • W).Δ.num else 0

/-- `README.md`, Layer 3, 3.4: the defining property of `minimalDiscriminant`. -/
theorem minimalDiscriminant_spec (W : Model ℚ g) [W.IsSmooth] (C : CoordChange ℚ g)
    (hC : IsGlobalMinimal (C • W)) : ((W.minimalDiscriminant : ℤ) : ℚ) = (C • W).Δ := sorry

end Global

end Model

/-! ### Layer 4.1–4.2: cluster pictures -/

/-- An abstract cluster picture on a finite set `X` (DDMM Definition 1.26; `README.md`,
convention 12, Layer 4, 4.1): a laminar family of nonempty subsets containing the singletons
and `X`, with a depth on the proper clusters that increases strictly along inclusion. -/
structure ClusterPicture (X : Type*) [Fintype X] [DecidableEq X] where
  /-- The clusters. -/
  clusters : Finset (Finset X)
  /-- The depth `d_𝔰` (its value on improper clusters is junk). -/
  depth : Finset X → ℚ
  singleton_mem : ∀ x : X, {x} ∈ clusters
  univ_mem : (Finset.univ : Finset X) ∈ clusters
  nonempty_of_mem : ∀ s ∈ clusters, s.Nonempty
  laminar : ∀ s ∈ clusters, ∀ t ∈ clusters, s ⊆ t ∨ t ⊆ s ∨ Disjoint s t
  depth_lt_of_ssubset : ∀ s ∈ clusters, ∀ t ∈ clusters, 1 < t.card → t ⊂ s → depth s < depth t

namespace ClusterPicture

variable {X : Type*} [Fintype X] [DecidableEq X] (Ψ : ClusterPicture X)

/-- A proper cluster has more than one element (`README.md`, Layer 4, 4.2). -/
def IsProper (s : Finset X) : Prop := s ∈ Ψ.clusters ∧ 1 < s.card

/-- The children of a cluster: its maximal proper subclusters (DDMM Definition 1.3). -/
def children (s : Finset X) : Finset (Finset X) :=
  Ψ.clusters.filter fun t => t ⊂ s ∧ ∀ u ∈ Ψ.clusters, t ⊂ u → ¬ u ⊂ s

/-- The parent of a cluster `s ≠ X`: the unique cluster of which it is a child, as the meet of
the clusters having `s` as a child (the value `X` at `s = X`, which has no parent, is junk). -/
noncomputable def parent (s : Finset X) : Finset X :=
  (Ψ.clusters.filter fun u => s ∈ Ψ.children u).inf id

/-- The smallest cluster containing `s` and `t` (DDMM Definition 1.3, `𝔰 ∧ 𝔰'`). -/
noncomputable def meet (s t : Finset X) : Finset X :=
  (Ψ.clusters.filter fun u => s ⊆ u ∧ t ⊆ u).inf'
    ⟨Finset.univ, Finset.mem_filter.2 ⟨Ψ.univ_mem, Finset.subset_univ _, Finset.subset_univ _⟩⟩ id

/-- Relative depth `δ_𝔰 = d_𝔰 − d_{P(𝔰)}` (DDMM Definition 1.5). -/
noncomputable def relDepth (s : Finset X) : ℚ := Ψ.depth s - Ψ.depth (Ψ.parent s)

/-- `ν_𝔰 = v(c_f) + Σ_{r ∈ ℛ} d_{r ∧ 𝔰}` (DDMM Definition 1.6), given `v(c_f)`. -/
noncomputable def nu (vcf : ℚ) (s : Finset X) : ℚ :=
  vcf + ∑ r : X, Ψ.depth (Ψ.meet {r} s)

/-- A twin is a cluster of size 2 (DDMM Definition 1.4). -/
def IsTwin (s : Finset X) : Prop := s ∈ Ψ.clusters ∧ s.card = 2

/-- An even cluster has even size. -/
def IsEven (s : Finset X) : Prop := s ∈ Ψ.clusters ∧ Even s.card

/-- An übereven cluster is a proper cluster all of whose children are even (DDMM
Definition 1.4). -/
def IsUbereven (s : Finset X) : Prop := Ψ.IsProper s ∧ ∀ t ∈ Ψ.children s, Even t.card

/-- A cotwin is a non-übereven cluster with a child of size `2g` (DDMM Definition 1.11). -/
def IsCotwin (g : ℕ) (s : Finset X) : Prop :=
  s ∈ Ψ.clusters ∧ ¬ Ψ.IsUbereven s ∧ ∃ t ∈ Ψ.children s, t.card = 2 * g

/-- A principal cluster: proper, not a twin, not a cotwin, and with at least three children when
it is `ℛ` of even size `2g + 2` (DDMM Definition 1.4). -/
def IsPrincipal (g : ℕ) (s : Finset X) : Prop :=
  Ψ.IsProper s ∧ ¬ Ψ.IsTwin s ∧ ¬ Ψ.IsCotwin g s ∧
    (s = Finset.univ → Even s.card → 3 ≤ (Ψ.children s).card)

open Classical in
/-- The potential toric rank read off the picture: the number of even non-übereven clusters
other than `ℛ`, less one if `ℛ` is übereven (DDMM Theorem 1.8 (7); `README.md`, Layer 4, 4.5).
It is also the conductor exponent of a semistable curve (Theorem 1.20 (iii); 4.9). -/
noncomputable def potentialToricRank : ℕ :=
  (Ψ.clusters.filter fun s => s ≠ Finset.univ ∧ Even s.card ∧ ¬ Ψ.IsUbereven s).card -
    if Ψ.IsUbereven Finset.univ then 1 else 0

/-- The combinatorial half of the semistability criterion (DDMM Definition 1.7 (2)–(3)), for an
inertia action `I` on the roots and `v(c_f)`: proper clusters are inertia-invariant, principal
clusters have integral depth and even `ν` (`README.md`, Layer 4, 4.4). The ramification-degree
condition (1) is a hypothesis of the theorems, not a field of this structure. -/
structure SemistabilityCriterion (g : ℕ) (vcf : ℚ) (I : Subgroup (Equiv.Perm X)) : Prop where
  inertia_invariant : ∀ s, Ψ.IsProper s → ∀ σ ∈ I, s.map σ.toEmbedding = s
  depth_int : ∀ s, Ψ.IsPrincipal g s → ∃ n : ℤ, Ψ.depth s = n
  nu_even : ∀ s, Ψ.IsPrincipal g s → ∃ n : ℤ, Ψ.nu vcf s = 2 * n

end ClusterPicture

/-! ### Layer 5.1: two-torsion -/

namespace Model

variable {g : ℕ} {k : Type*} [Field k]

/-- The two-torsion field of the Jacobian: the splitting field of the Weierstrass form
(`README.md`, Layer 5, 5.1; the identification with `k(J[2])` needs characteristic `≠ 2`). -/
abbrev twoTorsionField (W : Model k g) : Type _ := W.weierstrassForm.SplittingField

end Model

end TauCetiRoadmap.HyperellipticCurves
