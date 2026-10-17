import Mathlib

/-!
# Reusable infrastructure for torsion in arithmetic cohomology: representative target signatures

The mathematical roadmap is `README.md`. This file records the definitions and theorem
signatures of the roadmap that can already be stated against the pinned Mathlib API. It is not an
exhaustive list of the targets of any layer. The geometric layers (formal models, perfectoid
compactifications, completed cohomology, Borel–Serre boundaries) and every statement about
determinants of Galois groups are stated in the README only, because their carriers are built by
the roadmaps the README names.

Design choices.
* The twisted product `weightedProduct P Q u = P(u⁻¹X) · Q(uX)` is ordinary substitution through
  `Polynomial.comp`; no new polynomial carrier is introduced.
* A series `F(T^m X)` with Laurent coefficients is `PowerSeries.rescale (T m)` applied to the
  coefficientwise image of `F` in `R[T;T⁻¹]`.
* The substitution `T ↦ T ^ a` on `R[T;T⁻¹]` is the map induced by multiplication by `a` on `ℤ`.
* Scholze's Levi polynomial is written with the standard double cosets `U i` (with `U 0 = 1`), so
  that its coefficients `(-1)^i q^(i(i+1)/2) U i` are integral. The normalised reciprocal of a
  polynomial of degree at most `n` uses `Polynomial.reflect n`, not the degree-dependent
  `Polynomial.reverse`.
* The classical Hecke topology is the initial topology of a family of ring maps into topological
  rings; it need not be Hausdorff.
-/

namespace TauCetiRoadmap.TorsionCohomologyInfrastructure

open Polynomial

/-! ## Layer 1: period-lattice chart validation -/

/-- The displayed integral plane is isotropic and has both Plücker minors equal to one. -/
example :
    let v : Fin 4 → ℤ := ![1, 0, 0, 1]
    let w : Fin 4 → ℤ := ![0, 1, 1, 0]
    let A : Matrix (Fin 2) (Fin 4) ℤ := ![v, w]
    v 0 * w 2 + v 1 * w 3 - v 2 * w 0 - v 3 * w 1 = 0 ∧
      Matrix.det (A.submatrix id ![0, 2]) = 1 ∧
      Matrix.det (A.submatrix id ![0, 1]) = 1 := by
  sorry

/-! ## Layer 2: coherent, completed and torsion cohomology -/

section HeckeTopology

/-- The initial topology on `T` defined by a family of ring maps `ρ i : T →+* E i` into
topological rings: the weakest topology for which every `ρ i` is continuous. When the `E i` are the
endomorphism rings of the classical cusp spaces `H⁰(X*_K, ω^{ak} ⊗ I)` with their `p`-adic
topology, this is the classical Hecke topology `T_cl` of Layer 2 (Scholze, Theorem 4.3.1 and
footnote 18, p.1025). -/
abbrev heckeInitialTopology {T ι : Type*} [Ring T] {E : ι → Type*} [∀ i, Ring (E i)]
    [∀ i, TopologicalSpace (E i)] (ρ : ∀ i, T →+* E i) : TopologicalSpace T :=
  ⨅ i, TopologicalSpace.induced (ρ i) inferInstance

/-- A map into `T_cl` is continuous exactly when its composite with every defining action is. -/
theorem continuous_heckeInitialTopology_iff {T ι : Type*} [Ring T] {E : ι → Type*}
    [∀ i, Ring (E i)] [∀ i, TopologicalSpace (E i)] (ρ : ∀ i, T →+* E i) {B : Type*}
    [TopologicalSpace B] (f : B → T) :
    @Continuous B T _ (heckeInitialTopology ρ) f ↔ ∀ i, Continuous fun b => ρ i (f b) := by
  sorry

/-- Restriction of the defining ring actions gives a continuous map from their restricted initial
topology to the full initial topology. This restricts classical Hecke continuity to the
commutative unramified algebra used for ambient determinants. -/
theorem continuous_heckeInitialTopology_restrict {T T' ι : Type*} [Ring T] [Ring T']
    {E : ι → Type*} [∀ i, Ring (E i)] [∀ i, TopologicalSpace (E i)]
    (ρ : ∀ i, T →+* E i) (f : T' →+* T) :
    @Continuous T' T (heckeInitialTopology (fun i => (ρ i).comp f))
      (heckeInitialTopology ρ) f := by
  sorry

/-- An element killed by every defining action lies in every neighbourhood of `0`, so `T_cl` need
not be Hausdorff. -/
example {T ι : Type*} [Ring T] {E : ι → Type*} [∀ i, Ring (E i)]
    [∀ i, TopologicalSpace (E i)] (ρ : ∀ i, T →+* E i) (t : T) (ht : ∀ i, ρ i t = 0) :
    ∀ U ∈ @nhds T (heckeInitialTopology ρ) 0, t ∈ U := by
  sorry

/-- Two actions `ℤ → ℤ/2` and `ℤ → ℤ/3` with discrete targets: the neighbourhoods come from the
intersection `6ℤ` of the kernels, so `6ℤ` is open and `4ℤ` is not. -/
example :
    let ρ : ∀ b : Bool, ℤ →+* ZMod (if b then 2 else 3) := fun _ => Int.castRingHom _
    @IsOpen ℤ (heckeInitialTopology ρ) {x : ℤ | (6 : ℤ) ∣ x} ∧
      ¬ @IsOpen ℤ (heckeInitialTopology ρ) {x : ℤ | (4 : ℤ) ∣ x} := by
  sorry

/-- With the `p`-adic topology on the target, `p ^ r → 0` in `T_cl`, although no power of `p` lies
in the kernel of the action; with the discrete topology on the target this would fail. -/
example (p : ℕ) [Fact p.Prime] :
    let ρ : ∀ _ : Unit, ℤ →+* ℤ_[p] := fun _ => Int.castRingHom ℤ_[p]
    Filter.Tendsto (fun r : ℕ => (p : ℤ) ^ r) Filter.atTop
      (@nhds ℤ (heckeInitialTopology ρ) 0) := by
  sorry

/-- The second projection prevents powers of `(p, 1)` from converging to zero in the initial
topology defined by both projections. -/
example (p : ℕ) [Fact p.Prime] :
    let ρ : Bool → (ℤ_[p] × ℤ_[p] →+* ℤ_[p]) := fun b =>
      if b then RingHom.fst _ _ else RingHom.snd _ _
    ¬ Filter.Tendsto (fun r : ℕ => ((p, 1) : ℤ_[p] × ℤ_[p]) ^ r) Filter.atTop
      (@nhds (ℤ_[p] × ℤ_[p]) (heckeInitialTopology ρ) 0) := by
  sorry

end HeckeTopology

/-! ## Layer 3a: weighted-determinant algebra -/

section WeightedProduct

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The twisted product `P(u⁻¹X) · Q(uX)`, which records the opposite character weights by which a
Levi factor and its dual are separated (Scholze, proof of Lemma 5.3.4, pp.1048–1049). -/
noncomputable def weightedProduct (P Q : R[X]) (u : Rˣ) : R[X] :=
  P.comp (C (↑(u⁻¹) : R) * X) * Q.comp (C (↑u : R) * X)

/-- At the trivial twist the twisted product is the ordinary product. -/
theorem weightedProduct_one (P Q : R[X]) : weightedProduct P Q 1 = P * Q := by
  sorry

/-- The constant coefficient keeps both constant coefficients. -/
theorem weightedProduct_coeff_zero (P Q : R[X]) (u : Rˣ) :
    (weightedProduct P Q u).coeff 0 = P.coeff 0 * Q.coeff 0 := by
  sorry

/-- Coefficient change carries the twisted product to the twisted product of the mapped factors and
the mapped unit. -/
theorem weightedProduct_map (f : R →+* S) (P Q : R[X]) (u : Rˣ) :
    (weightedProduct P Q u).map f = weightedProduct (P.map f) (Q.map f) (Units.map f u) := by
  sorry

/-- Exchanging the factors inverts the weight. -/
theorem weightedProduct_swap (P Q : R[X]) (u : Rˣ) :
    weightedProduct P Q u = weightedProduct Q P u⁻¹ := by
  sorry

/-- **Twisted-product separation.** Over any commutative ring, two factorisations into polynomials
of degree at most `n` with constant term `1` that agree untwisted and twisted by `u` are equal,
provided every `1 - u ^ (2j)`, `1 ≤ j ≤ n`, is a unit (Scholze, proof of Lemma 5.3.4,
pp.1048–1049). -/
theorem twisted_product_separation (n : ℕ) (u : Rˣ) (P Q P' Q' : R[X])
    (hP : P.natDegree ≤ n) (hQ : Q.natDegree ≤ n) (hP' : P'.natDegree ≤ n)
    (hQ' : Q'.natDegree ≤ n) (hcP : P.coeff 0 = 1) (hcQ : Q.coeff 0 = 1)
    (hcP' : P'.coeff 0 = 1) (hcQ' : Q'.coeff 0 = 1) (hprod : P * Q = P' * Q')
    (htwist : weightedProduct P Q u = weightedProduct P' Q' u)
    (hsep : ∀ j : ℕ, 1 ≤ j → j ≤ n → IsUnit (1 - (↑u : R) ^ (2 * j))) :
    P = P' ∧ Q = Q' := by
  sorry

/-- Constant factors ignore the twist. -/
example : weightedProduct (C (2 : ℤ)) (C 3) (-1) = C 6 := by
  sorry

/-- Opposite scaling: `(1 - 2X)` and `(1 - 3X)` at `u = 2` give `(1 - X)(1 - 6X)`. -/
example : weightedProduct (1 - C (2 : ℚ) * X) (1 - C 3 * X) (Units.mk0 (2 : ℚ) (by norm_num)) =
    1 - C 7 * X + C 6 * X ^ 2 := by
  sorry

/-- Swapping the two factors at the same nontrivial twist changes the linear coefficient. -/
example :
    let u : ℚˣ := Units.mk0 2 (by norm_num)
    weightedProduct (1 - C (3 : ℚ) * X) (1 - C 2 * X) u =
        1 - C (11 / 2 : ℚ) * X + C 6 * X ^ 2 ∧
      weightedProduct (1 - C (3 : ℚ) * X) (1 - C 2 * X) u ≠
        (1 - C (7 : ℚ) * X + C 6 * X ^ 2) := by
  sorry

/-- Collision at the trivial twist: the factors can be interchanged. -/
example : weightedProduct (1 - C (2 : ℚ) * X) (1 - C 3 * X) 1 =
    weightedProduct (1 - C (3 : ℚ) * X) (1 - C 2 * X) 1 := by
  sorry

/-- Over `ℤ/9` with `u = 2`, `1 - u²` is nonzero but not a unit, and separation fails:
`1 + 3X` can be moved from one factor to the other. -/
example :
    let u : (ZMod 9)ˣ := ⟨2, 5, by decide, by decide⟩
    (1 - (↑u : ZMod 9) ^ 2 ≠ 0) ∧ ¬ IsUnit (1 - (↑u : ZMod 9) ^ 2) ∧
      weightedProduct (1 + C (3 : ZMod 9) * X) 1 u = weightedProduct 1 (1 + C (3 : ZMod 9) * X) u ∧
      (1 + C (3 : ZMod 9) * X : (ZMod 9)[X]) ≠ 1 := by
  sorry

/-- Degree zero with constant term one forces both factors to be one over any ring. -/
example (P Q : R[X]) (hP : P.natDegree ≤ 0) (hQ : Q.natDegree ≤ 0)
    (hcP : P.coeff 0 = 1) (hcQ : Q.coeff 0 = 1) : P = 1 ∧ Q = 1 := by
  sorry

end WeightedProduct

section FiniteWeight

variable {S : Type*} [CommRing S]

/-- `weightSubst m F` is the series `F(T^m X)`, with coefficients in `S[T;T⁻¹]`. -/
noncomputable def weightSubst (m : ℤ) (F : PowerSeries S) : PowerSeries (LaurentPolynomial S) :=
  PowerSeries.rescale (LaurentPolynomial.T m) (PowerSeries.map LaurentPolynomial.C F)

/-- Weight zero changes only the coefficient ring. -/
example (F : PowerSeries S) : weightSubst 0 F = PowerSeries.map LaurentPolynomial.C F := by
  sorry

/-- The weight acts on the variable: `(1 - X)(T^2 X) = 1 - T^2 X`. -/
example :
    weightSubst 2 (1 - PowerSeries.X : PowerSeries ℤ) =
      1 - PowerSeries.C (LaurentPolynomial.T 2 : LaurentPolynomial ℤ) * PowerSeries.X := by
  sorry

/-- Weights one and two give distinct series on the same input. -/
example :
    weightSubst 1 (1 + PowerSeries.X : PowerSeries ℤ) =
        1 + PowerSeries.C (LaurentPolynomial.T 1 : LaurentPolynomial ℤ) * PowerSeries.X ∧
      weightSubst 2 (1 + PowerSeries.X : PowerSeries ℤ) =
        1 + PowerSeries.C (LaurentPolynomial.T 2 : LaurentPolynomial ℤ) * PowerSeries.X ∧
      weightSubst 1 (1 + PowerSeries.X : PowerSeries ℤ) ≠
        weightSubst 2 (1 + PowerSeries.X : PowerSeries ℤ) := by
  sorry

/-- **Uniqueness of finite-weight factorisations** (Scholze, Lemma 5.3.10, pp.1053–1054): for a
finite set of distinct weights, the factors `Q m` with constant term `1` are determined by the
product of the `Q m (T^m X)`. -/
theorem finiteWeight_factorization_unique (M : Finset ℤ) (Q Q' : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hQ' : ∀ m ∈ M, PowerSeries.constantCoeff (Q' m) = 1)
    (h : ∏ m ∈ M, weightSubst m (Q m) = ∏ m ∈ M, weightSubst m (Q' m)) :
    ∀ m ∈ M, Q m = Q' m := by
  sorry

/-- **Polynomiality** (Scholze, Lemma 5.3.10, pp.1053–1054): if the product is a polynomial in `X`
with Laurent coefficients, every factor is a polynomial. -/
theorem finiteWeight_factorization_polynomial (M : Finset ℤ) (Q : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hpoly : ∃ F : Polynomial (LaurentPolynomial S),
      (F : PowerSeries (LaurentPolynomial S)) = ∏ m ∈ M, weightSubst m (Q m)) :
    ∀ m ∈ M, ∃ q : Polynomial S, (q : PowerSeries S) = Q m := by
  sorry

end FiniteWeight

section LaurentCoefficientIdeal

variable {R : Type*} [CommRing R]

/-- The substitution `T ↦ T ^ a` on Laurent polynomials. -/
noncomputable def laurentSubst (a : ℤ) : LaurentPolynomial R →+* LaurentPolynomial R :=
  AddMonoidAlgebra.mapDomainRingHom R (AddMonoidHom.mulLeft a)

/-- The largest ideal `I' = ⋂_a {f | f(T^a) ∈ I}` whose substitutions all lie in `I`. -/
noncomputable def substStableIdeal (I : Ideal (LaurentPolynomial R)) :
    Ideal (LaurentPolynomial R) :=
  ⨅ a : ℤ, I.comap (laurentSubst a)

/-- The ideal of `R` generated by the Laurent coefficients of the elements of `I'`. -/
def laurentCoeffIdeal (I : Ideal (LaurentPolynomial R)) : Ideal R :=
  Ideal.span {c | ∃ f ∈ substStableIdeal I, ∃ k : ℤ, f.coeff k = c}

/-- **Laurent coefficient-ideal bound** (Scholze, proof of Lemma 5.3.7, pp.1051–1052): the
coefficient ideal keeps the nilpotence exponent of `I`. -/
theorem laurentCoeffIdeal_pow_eq_bot (I : Ideal (LaurentPolynomial R)) {N : ℕ} (hN : 1 ≤ N)
    (hI : I ^ N = ⊥) : laurentCoeffIdeal I ^ N = ⊥ := by
  sorry

/-- The substitution-stable ideal is contained in the extension of its coefficient ideal, so characteristic identities
modulo `I'` descend to `(R ⧸ J)[T;T⁻¹]`. -/
theorem substStableIdeal_le_map (I : Ideal (LaurentPolynomial R)) :
    substStableIdeal I ≤ (laurentCoeffIdeal I).map LaurentPolynomial.C := by
  sorry

/-- The substitution multiplies exponents: `T ^ k ↦ T ^ (a * k)`. -/
example (a k : ℤ) :
    laurentSubst a (LaurentPolynomial.T k : LaurentPolynomial R) = LaurentPolynomial.T (a * k) := by
  sorry

/-- At `a = 0` every monomial goes to `1`, so `f ↦ f(1)`. -/
example (k : ℤ) : laurentSubst 0 (LaurentPolynomial.T k : LaurentPolynomial R) = 1 := by
  sorry

/-- The zero ideal has zero coefficient ideal. -/
example : laurentCoeffIdeal (⊥ : Ideal (LaurentPolynomial R)) = ⊥ := by
  sorry

/-- Substitution doubles exponents and preserves coefficients. -/
example :
    laurentSubst 2 (LaurentPolynomial.C (3 : ℤ) * LaurentPolynomial.T (-1) + LaurentPolynomial.T 2) =
      LaurentPolynomial.C 3 * LaurentPolynomial.T (-2) + LaurentPolynomial.T 4 := by
  sorry

/-- Zero evaluates at one, the identity fixes the polynomial, and minus one reverses exponents. -/
example :
    let f : LaurentPolynomial ℤ := LaurentPolynomial.C 3 * LaurentPolynomial.T (-1) + LaurentPolynomial.T 2
    laurentSubst 0 f = LaurentPolynomial.C 4 ∧ laurentSubst 1 f = f ∧
      laurentSubst (-1) f = LaurentPolynomial.C 3 * LaurentPolynomial.T 1 + LaurentPolynomial.T (-2) := by
  sorry

/-- Composing Laurent substitutions multiplies their exponent multipliers. -/
example (a b : ℤ) (f : LaurentPolynomial R) :
    laurentSubst a (laurentSubst b f) = laurentSubst (a * b) f := by
  sorry

/-- Opposite exponent multipliers compose in the same order on a monomial. -/
example : laurentSubst 2 (laurentSubst (-3) (LaurentPolynomial.T 1 : LaurentPolynomial ℤ)) =
    LaurentPolynomial.T (-6) := by
  sorry

/-- The coefficient ideal retains the square-zero ideal over `ℤ/4`, while a single preimage
at zero also contains `T - 1`. -/
example :
    let I : Ideal (LaurentPolynomial (ZMod 4)) := Ideal.span {LaurentPolynomial.C 2}
    I ^ 2 = ⊥ ∧ substStableIdeal I = I ∧
      laurentCoeffIdeal I = Ideal.span {(2 : ZMod 4)} ∧ laurentCoeffIdeal I ^ 2 = ⊥ ∧
      LaurentPolynomial.T 1 - 1 ∈ I.comap (laurentSubst 0) ∧
      LaurentPolynomial.T 1 - 1 ∉ I := by
  sorry

/-- A proper substitution-stable ideal can have unit coefficient ideal. -/
example :
    let I : Ideal (LaurentPolynomial ℤ) := Ideal.span {LaurentPolynomial.T 1 - 1}
    substStableIdeal I = I ∧ laurentCoeffIdeal I = ⊤ ∧ I ≠ ⊤ := by
  sorry

/-- In the quotient `𝔽₂[a,b]/(a²,b²)`, the raw coefficients of a square-zero Laurent ideal
need not generate a square-zero ideal; the substitution-stable intersection excludes `a+bT`. -/
example :
    let J : Ideal (MvPolynomial (Fin 2) (ZMod 2)) :=
      Ideal.span {MvPolynomial.X (0 : Fin 2) ^ 2, MvPolynomial.X (1 : Fin 2) ^ 2}
    let B := MvPolynomial (Fin 2) (ZMod 2) ⧸ J
    let a : B := Ideal.Quotient.mk J (MvPolynomial.X 0)
    let b : B := Ideal.Quotient.mk J (MvPolynomial.X 1)
    let f : LaurentPolynomial B := LaurentPolynomial.C a + LaurentPolynomial.C b * LaurentPolynomial.T 1
    let I : Ideal (LaurentPolynomial B) := Ideal.span {f}
    I ^ 2 = ⊥ ∧ a * b ≠ 0 ∧ (Ideal.span {a, b}) ^ 2 ≠ ⊥ ∧
      f ∉ I.comap (laurentSubst 2) := by
  sorry

end LaurentCoefficientIdeal

/-! ## Layer 3b: arithmetic Levi realisation -/

section LeviPolynomial

variable {R : Type*} [CommRing R]

/-- Scholze's Levi polynomial `P_v(X) = Σ_{i ≤ n} (-1)^i q^(i(i+1)/2) U_i X^i` at an unramified
place with residue cardinality `q`, written with the standard double cosets `U i` (and `U 0 = 1`)
so that its coefficients are integral (Scholze, §5.4, p.1057; Lemma 5.2.5, pp.1042–1043). -/
noncomputable def scholzeLeviPolynomial (n : ℕ) (q : R) (U : ℕ → R) : R[X] :=
  ∑ i ∈ Finset.range (n + 1), C ((-1) ^ i * q ^ (i * (i + 1) / 2) * U i) * X ^ i

/-- The Levi polynomial is the reciprocal of the monic standard polynomial
`Σ (-1)^i q^(i(i-1)/2) U_i Y^(n-i)` evaluated at `qX`; the substitution adds the twist `ε⁻¹`. -/
theorem scholzeLeviPolynomial_eq_reverse_comp (n : ℕ) (q : R) (U : ℕ → R) (hU : U 0 = 1) :
    scholzeLeviPolynomial n q U =
      (∑ i ∈ Finset.range (n + 1),
        C ((-1) ^ i * q ^ (i * (i - 1) / 2) * U i) * X ^ (n - i)).reverse.comp (C q * X) := by
  sorry

/-- The normalised reciprocal `c⁻¹ · X^n P(1/X)` of a polynomial of degree at most `n` whose
coefficient of `X^n` is the unit `c`; for the Levi polynomial it is the dual polynomial `P_v^∨`. -/
noncomputable def normalizedReciprocal (n : ℕ) (P : R[X]) (c : Rˣ) : R[X] :=
  C (↑(c⁻¹) : R) * P.reflect n

/-- The normalised reciprocal has constant term `1`. -/
theorem normalizedReciprocal_coeff_zero (n : ℕ) (P : R[X]) (c : Rˣ) (hc : P.coeff n = c) :
    (normalizedReciprocal n P c).coeff 0 = 1 := by
  sorry

/-- Taking the normalised reciprocal twice returns the polynomial. -/
theorem normalizedReciprocal_normalizedReciprocal (n : ℕ) (P : R[X]) (c : Rˣ) :
    normalizedReciprocal n (normalizedReciprocal n P c) c⁻¹ = P := by
  sorry

/-- The degree-zero normalized reciprocal fixes the constant one. -/
example : normalizedReciprocal 0 (1 : ℤ[X]) 1 = 1 := by
  sorry

/-- The normalized reciprocal preserves this nonreduced quadratic and reduces coefficientwise. -/
example :
    let P : (ZMod 4)[X] := 1 + C 2 * X + C 3 * X ^ 2
    let c : (ZMod 4)ˣ := ⟨3, 3, by decide, by decide⟩
    normalizedReciprocal 2 P c = P ∧
      (normalizedReciprocal 2 P c).map (ZMod.castHom (by decide : 2 ∣ 4) (ZMod 2)) =
        1 + X ^ 2 := by
  sorry

/-- Rank zero gives the constant one whenever `U 0 = 1`. -/
example (q : R) (U : ℕ → R) (hU : U 0 = 1) : scholzeLeviPolynomial 0 q U = 1 := by
  sorry

/-- The dual of the rank-one Levi polynomial `1 - 6X` (top coefficient `c = -6`) is
`1 - X/6 = 1 - q⁻¹U₁⁻¹X` for `q = 3`, `U₁ = 2`. -/
example : normalizedReciprocal 1 (1 - C (6 : ℚ) * X) (Units.mk0 (-6) (by norm_num)) =
    1 - C (1 / 6 : ℚ) * X := by
  sorry

/-- Rank one: `n = 1`, `q = 3`, `U₁ = 2` gives `1 - 6X`, not the standard reciprocal `1 - 2X`. -/
example : scholzeLeviPolynomial 1 (3 : ℤ) (fun i => if i = 0 then 1 else 2) = 1 - C 6 * X := by
  sorry

/-- Rank two: `n = 2`, `q = 2`, `U₁ = 3`, `U₂ = 5` gives `1 - 6X + 40X²`. -/
example :
    scholzeLeviPolynomial 2 (2 : ℤ) (fun i => if i = 0 then 1 else if i = 1 then 3 else 5) =
      1 - C 6 * X + C 40 * X ^ 2 := by
  sorry

/-- The same polynomial as the standard reciprocal `1 - 3X + 10X²` evaluated at `2X`. -/
example : (1 - C (3 : ℤ) * X + C 10 * X ^ 2).comp (C 2 * X) = 1 - C 6 * X + C 40 * X ^ 2 := by
  sorry

/-- Unitary top sign: two degree-one factors `P(X)` and `P^∨_{v^c}(qX)` give a positive top
coefficient. -/
example (q a b : R) :
    (1 - C a * X) * (1 - C b * X).comp (C q * X) = 1 - C (a + q * b) * X + C (q * a * b) * X ^ 2 := by
  sorry

/-- The real rank-one ambient polynomial has degree three, while its extracted Levi factor
has degree one. -/
example :
    let P : ℚ[X] := 1 - C 2 * X
    let A : ℚ[X] := (1 - X) * P * normalizedReciprocal 1 P (Units.mk0 (-2) (by norm_num))
    A.natDegree = 3 ∧ P.natDegree = 1 ∧ A ≠ P := by
  sorry

/-- In the trivial CM rank-one system, conjugate reciprocity includes substitution by `qX`. -/
example :
    let P : ℚ[X] := 1 - C 7 * X
    let Q : ℚ[X] := normalizedReciprocal 1 P (Units.mk0 (-7) (by norm_num))
    Q.comp (C 7 * X) = 1 - X ∧
      P * Q.comp (C 7 * X) = (1 - C 7 * X) * (1 - X) ∧
      P * Q.comp (C 7 * X) ≠ P * Q := by
  sorry

end LeviPolynomial

/-! ## Layer 4: assembly, compatibility and validation -/

section Nonlifting

/-- The stabiliser `{±1}` of `[pt/{±1}]` (`GL₁/ℚ` at level `ℤ̂ˣ`) has `H¹(ℤˣ, ℤ₂) = 0`. -/
example : Subsingleton (groupCohomology (Rep.trivial ℤ_[2] ℤˣ ℤ_[2]) 1) := by
  sorry

/-- ... while `H¹(ℤˣ, 𝔽₂) ≠ 0`: this mod-`2` class has no integral lift. -/
example : Nontrivial (groupCohomology (Rep.trivial ℤ ℤˣ (ZMod 2)) 1) := by
  sorry

/-- The algebraic diagnostic: in the complex `ℤ →(2) ℤ`, the degree-zero class `1` modulo `2` has
no integral degree-zero lift. -/
example : ¬ ∃ x : ℤ, 2 * x = 0 ∧ (x : ZMod 2) = 1 := by
  sorry

end Nonlifting

/-!
## Targets stated in the README only

Layer 0 (integral section models, integral boundary ideals, the bounded lattice extension, the
closed-quotient sequence, the almost support comparison, trace integrality, boundary traces),
Layer 2a (the boundary-ideal colimit), Layer 1 (period lattices, the approximation atlas, sections
over non-vanishing loci, Serre vanishing over an arbitrary base, integral cuspidal lifting, classical
section approximation), the constructible primitive comparison (`constructiblePrimitiveComparison`), amplitude, Iwasawa,
continuity and descent targets of
Layer 2 (including the classical cusp action over a finite extension), the homogeneous decomposition, weighted unit law and weighted determinant factors of
Layer 3a, the cohomological trace input and unitary-similitude base change (`unitarySimilitudeBaseChange`), finite-coefficient descent for each character pair, and determinant targets of Layer 3b, and the compact-support product comparison (`compactSupportProductComparison`), boundary filtration, finite torsion,
integral, four-route, residual and normalisation targets of Layer 4.
-/

end TauCetiRoadmap.TorsionCohomologyInfrastructure
