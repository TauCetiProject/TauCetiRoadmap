import Mathlib

/-!
# Arithmetic heights and Siegel's lemma: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones whose names and shapes are most likely
to drift, so that contributors and reviewers converge on them; discharging all of them finishes
neither a layer nor the roadmap.

Everything below is stated against Mathlib's `Mathlib/NumberTheory/Height/` (M. Stoll): the
`Height.AdmissibleAbsValues` class, `Height.mulHeight₁`, `Height.mulHeight`,
`Projectivization.mulHeight`, `NumberField.absMulHeight₁`, and the `Northcott` typeclass. None of
that is restated here; this roadmap consumes it. The declarations elaborate against the pinned
Mathlib and are stated with `sorry` (allowed in this human-owned roadmap library); what lands in
`TauCeti/` must be proved.

Names here are unqualified inside `TauCetiRoadmap.ArithmeticHeights` so that the prototype does not
occupy Mathlib's root namespaces. In `TauCeti/` they take the names `README.md` pins:
`polyMulHeight` is `Polynomial.mulHeight`, `matrixMulHeight` is `Matrix.mulHeight`,
`subspaceMulHeight` is `Submodule.mulHeight`, `pluckerPoint` is `Submodule.pluckerPoint`, and the
`absMulHeight`/`arakelovMulHeight` families sit in `NumberField`.

The Layer 0.3 signatures below are those of
[mathlib4#41606](https://github.com/leanprover-community/mathlib4/pull/41606) and deliberately
carry its names, so that adopting Mathlib's version is a deletion plus an import. Likewise Layer
6.5 follows [mathlib4#40791](https://github.com/leanprover-community/mathlib4/pull/40791).
-/

namespace TauCetiRoadmap.ArithmeticHeights

open Height NumberField Real Module Pointwise IntermediateField

noncomputable section

/-! ## Layer 0: normalizations and the extension dictionary -/

section Arakelov

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 0.1.** The Arakelov height: the ℓ² norm at the archimedean places, weighted by
`InfinitePlace.mult`, and the sup norm at the finite places. This is the normalization in which
the Bombieri–Vaaler constant of Layer 5.4 is stated; `Height.mulHeight` uses the sup norm
everywhere. Both live in the library and every bound says which one it is in. -/
def arakelovMulHeight (x : ι → K) : ℝ :=
  (∏ v : InfinitePlace K, (∑ i, v (x i) ^ 2) ^ (v.mult / 2 : ℝ)) *
    ∏ᶠ v : FinitePlace K, ⨆ i, v (x i)

/-- **Layer 0.1.** The logarithmic Arakelov height. As everywhere in this development, the
logarithmic height is *defined* as the logarithm of the multiplicative one and never
independently. -/
def arakelovLogHeight (x : ι → K) : ℝ := log (arakelovMulHeight x)

/-- **Layer 0.1.** The Arakelov height is invariant under scaling, by the product formula, so it
descends to projective space exactly as `Height.mulHeight` does. -/
theorem arakelovMulHeight_smul_eq (x : ι → K) {c : K} (hc : c ≠ 0) :
    arakelovMulHeight (c • x) = arakelovMulHeight x :=
  sorry

/-- **Layer 0.2, lower comparison.** The sup norm is at most the ℓ² norm at every place. -/
theorem mulHeight_le_arakelovMulHeight (x : ι → K) :
    Height.mulHeight x ≤ arakelovMulHeight x :=
  sorry

/-- **Layer 0.2, upper comparison — the lemma that transports the literature's constants into
Mathlib's normalization.** The exponent is `totalWeight K = finrank ℚ K`, the sum of the local
degrees at the archimedean places. -/
theorem arakelovMulHeight_le_mulHeight (x : ι → K) :
    arakelovMulHeight x ≤
      (Fintype.card ι : ℝ) ^ ((Height.totalWeight K : ℝ) / 2) * Height.mulHeight x :=
  sorry

/-- **Layer 0.2.** On a single coordinate the two normalizations agree, so there is no separate
`arakelovMulHeight₁`. -/
theorem arakelovMulHeight_eq_mulHeight_of_subsingleton [Subsingleton ι] (x : ι → K) :
    arakelovMulHeight x = Height.mulHeight x :=
  sorry

end Arakelov

section Extension

variable {K L : Type*} [Field K] [Field L] [NumberField K] [NumberField L] [Algebra K L]

/-- **Layer 0.3 (mathlib4#41606).** The relative height over `L` is the `[L : K]`-th power of the
relative height over `K`. This and the three statements after it carry that PR's names. -/
theorem mulHeight₁_pow_finrank (x : K) :
    Height.mulHeight₁ x ^ Module.finrank K L = Height.mulHeight₁ (algebraMap K L x) :=
  sorry

/-- **Layer 0.3 (mathlib4#41606).** The tuple form. -/
theorem mulHeight_pow_finrank {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight x ^ Module.finrank K L = Height.mulHeight (algebraMap K L ∘ x) :=
  sorry

/-- **Layer 0.3 (mathlib4#41606).** The logarithmic form. -/
theorem finrank_nsmul_logHeight₁ (x : K) :
    Module.finrank K L • Height.logHeight₁ x = Height.logHeight₁ (algebraMap K L x) :=
  sorry

/-- **Layer 0.3 (mathlib4#41606).** The logarithmic tuple form. -/
theorem finrank_nsmul_logHeight {ι : Type*} [Finite ι] (x : ι → K) :
    Module.finrank K L • Height.logHeight x = Height.logHeight (algebraMap K L ∘ x) :=
  sorry

end Extension

section Absolute

/-- **Layer 0.4.** The absolute multiplicative height of a tuple of algebraic numbers: the
relative height computed over the field generated by the coordinates, normalized by the inverse of
its degree. This is the tuple analogue of Mathlib's `NumberField.absMulHeight₁`, which handles the
one-variable case through `ℚ⟮x⟯`; the junk value `1` off the algebraic numbers is inherited. -/
def absMulHeight {K : Type*} [Field K] [CharZero K] {ι : Type*} [Fintype ι] (x : ι → K) : ℝ :=
  sorry

/-- **Layer 0.4.** The absolute logarithmic height of a tuple. -/
def absLogHeight {K : Type*} [Field K] [CharZero K] {ι : Type*} [Fintype ι] (x : ι → K) : ℝ :=
  log (absMulHeight x)

/-- **Layer 0.4 — field-extension invariance, the statement the layer exists for.** Over *any*
number field containing the coordinates, the absolute height is the relative height taken to the
power `1 / [K : ℚ]`. With `mulHeight_pow_finrank`, this says the absolute height does not depend on
the field of definition. Mathlib's `NumberField.absMulHeight₁_eq` is the one-variable case
(mathlib4#41606). -/
theorem absMulHeight_eq {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] (x : ι → K) :
    absMulHeight x = Height.mulHeight x ^ ((Module.finrank ℚ K : ℝ))⁻¹ :=
  sorry

/-- **Layer 0.4.** The absolute height of a tuple restricts to Mathlib's absolute height of an
element, so the two agree where both are defined. -/
theorem absMulHeight_eq_absMulHeight₁ {K : Type*} [Field K] [CharZero K] (x : K) :
    absMulHeight ![x, 1] = NumberField.absMulHeight₁ x :=
  sorry

end Absolute

/-! ## Layer 1: Northcott, Kronecker, and the Mahler-measure bridge -/

section Northcott

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 1.1.** The Northcott property on projective space, which
`Mathlib/NumberTheory/Height/Northcott.lean` records as its own TODO. The instance for
`Projectivization.logHeight` then follows from Mathlib's `Northcott.comp_of_bddAbove`, exactly as
it does for `logHeight₁`. -/
instance instNorthcottProjectivizationMulHeight {ι : Type*} [Finite ι] :
    Northcott (Projectivization.mulHeight (K := K) (ι := ι)) :=
  sorry

/-- **Layer 1.1.** The Northcott property for tuples over a fixed number field. -/
instance instNorthcottMulHeight {ι : Type*} [Finite ι] :
    Northcott (Height.mulHeight (K := K) (ι := ι)) :=
  sorry

/-- **Layer 1.2 — the bridge to Mathlib's Mahler measure.** For an algebraic number `x`, the
absolute height is the `deg`-th root of the Mahler measure of the minimal polynomial. Stated as an
equality of `deg`-th powers so that no real exponentiation appears. This identity is what makes
Northcott's theorem and Kronecker's theorem cheap. -/
theorem absMulHeight₁_pow_natDegree {x : ℂ} (hx : IsIntegral ℤ x) :
    NumberField.absMulHeight₁ x ^ (minpoly ℤ x).natDegree =
      ((minpoly ℤ x).map (Int.castRingHom ℂ)).mahlerMeasure :=
  sorry

/-- **Layer 1.3 — Northcott's theorem, in the form with varying degree.** Mathlib's
`NumberField.finite_setOfPred_mulHeight₁_le` fixes the field; this is the statement that the
literature calls Northcott's theorem, and it is what the elliptic-curve and Diophantine
applications need. -/
theorem finite_setOf_absMulHeight₁_le_of_finrank_le (B : ℝ) (D : ℕ) :
    {x : ℂ | IsIntegral ℚ x ∧ NumberField.absMulHeight₁ x ≤ B ∧
      Module.finrank ℚ ℚ⟮x⟯ ≤ D}.Finite :=
  sorry

/-- **Layer 1.4 — Kronecker's theorem.** An algebraic number has absolute height one exactly when
it is zero or a root of unity. The algebraicity hypothesis is not decorative: `absMulHeight₁` takes
the junk value `1` on every transcendental, so the statement without it is false. -/
theorem absMulHeight₁_eq_one_iff {x : ℂ} (hx : IsIntegral ℚ x) :
    NumberField.absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1 :=
  sorry

/-- **Layer 1.5.** The lower bound away from one, in the shape Diophantine arguments consume: for
each degree bound there is a uniform positive gap. -/
theorem exists_pos_forall_le_absLogHeight₁ (D : ℕ) :
    ∃ c > 0, ∀ x : ℂ, IsIntegral ℚ x → x ≠ 0 → Module.finrank ℚ ℚ⟮x⟯ ≤ D →
      (¬ ∃ n, 0 < n ∧ x ^ n = 1) → c ≤ NumberField.absLogHeight₁ x :=
  sorry

end Northcott

/-! ## Layer 2: heights of polynomials, linear forms, and matrices -/

section Polynomials

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- **Layer 2.1.** The height of a univariate polynomial is the height of its coefficient
`Finsupp`. `Polynomial` is a wrapper around `ℕ →₀ K`, so Mathlib's `Finsupp.mulHeight` *is* the
definition and no new construction is made. -/
def polyMulHeight (p : Polynomial K) : ℝ := Finsupp.mulHeight p.toFinsupp.coeff

/-- **Layer 2.1.** The logarithmic height of a polynomial. -/
def polyLogHeight (p : Polynomial K) : ℝ := log (polyMulHeight p)

/-- **Layer 2.1.** A constant polynomial has the height of its constant. -/
theorem polyMulHeight_C (a : K) : polyMulHeight (Polynomial.C a) = Height.mulHeight₁ a :=
  sorry

/-- **Layer 2.2 — Gauss's lemma for heights.** At a nonarchimedean place the local factor is
exactly multiplicative. This is the only place where the ultrametric inequality is used sharply,
and it is what makes the loss in Gelfond's inequality purely archimedean. -/
theorem iSup_nonarch_coeff_mul {v : AbsoluteValue K ℝ} (hv : IsNonarchimedean v)
    (p q : Polynomial K) :
    (⨆ n : ℕ, v ((p * q).coeff n)) = (⨆ n : ℕ, v (p.coeff n)) * ⨆ n : ℕ, v (q.coeff n) :=
  sorry

/-- **Layer 2.3 — Gelfond's inequality, upper half.** -/
theorem polyMulHeight_mul_le (p q : Polynomial K) :
    polyMulHeight (p * q) ≤
      2 ^ (p.natDegree + q.natDegree) * (polyMulHeight p * polyMulHeight q) :=
  sorry

/-- **Layer 2.3 — Gelfond's inequality, lower half.** Together with the upper half this bounds the
height of a factor, which is the direction transcendence arguments use. -/
theorem polyMulHeight_mul_polyMulHeight_le (p q : Polynomial K) :
    polyMulHeight p * polyMulHeight q ≤
      2 ^ (p.natDegree + q.natDegree) * polyMulHeight (p * q) :=
  sorry

end Polynomials

section Matrices

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {m n : Type*} [Fintype m] [Fintype n]

/-- **Layer 2.5.** The height of a matrix is the height of the tuple of its **entries**. The height
of its row space — the height of the tuple of maximal minors, `H(A)` in Bombieri–Vaaler — is
`subspaceMulHeight (rowSpace A)` and is never called the height of `A`. The classical literature
uses one symbol for both; this library does not. -/
def matrixMulHeight (A : Matrix m n K) : ℝ := Height.mulHeight fun p : m × n ↦ A p.1 p.2

/-- **Layer 2.5.** The height of a matrix is invariant under transpose. -/
theorem matrixMulHeight_transpose (A : Matrix m n K) :
    matrixMulHeight A.transpose = matrixMulHeight A :=
  sorry

/-- **Layer 2.5.** The submatrix bound. -/
theorem matrixMulHeight_submatrix_le {m' n' : Type*} [Fintype m'] [Fintype n']
    (A : Matrix m n K) (f : m' → m) (g : n' → n) :
    matrixMulHeight (A.submatrix f g) ≤ matrixMulHeight A :=
  sorry

/-- **Layer 2.5.** The product bound; the cardinality factor is the archimedean loss. -/
theorem matrixMulHeight_mul_le {p : Type*} [Fintype p] (A : Matrix m n K) (B : Matrix n p K) :
    matrixMulHeight (A * B) ≤ (Fintype.card n : ℝ) * (matrixMulHeight A * matrixMulHeight B) :=
  sorry

end Matrices

/-! ## Layer 3: Plücker coordinates and the height of a subspace -/

section Plucker

variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- **Layer 3.1 — the Plücker point.** The wedge of a basis of `V`, read in the basis
`(Pi.basisFun K ι).exteriorPower k` of `⋀[K]^k (ι → K)`, is a nonzero tuple indexed by
`Set.powersetCard ι k`; a change of basis multiplies it by a determinant, hence a unit, so the
induced point of projective space depends only on `V`. Build this the way Mathlib builds
`Projectivization.mulHeight`: a private well-definedness lemma feeding `Projectivization.lift`,
with the body left unexposed. -/
def pluckerPoint (k : ℕ) (V : Submodule K (ι → K)) (hV : Module.finrank K V = k) :
    Projectivization K (Set.powersetCard ι k → K) :=
  sorry

/-- **Layer 3.1.** The Plücker map is injective on subspaces of a fixed rank — what entitles it to
be called an embedding, and the input to Northcott for subspaces (3.6). -/
theorem pluckerPoint_injective (k : ℕ) :
    Function.Injective fun V : {V : Submodule K (ι → K) // Module.finrank K V = k} ↦
      pluckerPoint k V.val V.prop :=
  sorry

variable [Height.AdmissibleAbsValues K]

/-- **Layer 3.2 — Schmidt's height of a subspace.** -/
def subspaceMulHeight (k : ℕ) (V : Submodule K (ι → K)) (hV : Module.finrank K V = k) : ℝ :=
  Projectivization.mulHeight (pluckerPoint k V hV)

/-- **Layer 3.2.** The height of a subspace is at least one. -/
theorem one_le_subspaceMulHeight (k : ℕ) (V : Submodule K (ι → K)) (hV : Module.finrank K V = k) :
    1 ≤ subspaceMulHeight k V hV :=
  sorry

/-- **Layer 3.2 — the compatibility that makes the definition the right one.** The height of a
line is the projective height of the point it defines. -/
theorem subspaceMulHeight_span_singleton {x : ι → K} (hx : x ≠ 0)
    (hV : Module.finrank K (Submodule.span K {x}) = 1) :
    subspaceMulHeight 1 (Submodule.span K {x}) hV = Height.mulHeight x :=
  sorry

/-- **Layer 3.3.** The maximal minor of `A` on the columns indexed by `s`. The order isomorphism
`Set.powersetCard.orderIsoOfFin` is the index identification, pinned here once and for all so that
no later statement has to re-choose it. -/
def minorDet {m : ℕ} (A : Matrix (Fin m) ι K) (s : Set.powersetCard ι m) : K :=
  (A.submatrix id fun i ↦ (Set.powersetCard.orderIsoOfFin s i : ι)).det

/-- **Layer 3.3 — the matrix dictionary (Bombieri–Gubler, Remark 2.8.7).** The Plücker coordinates
of the row space of a full-rank matrix are its maximal minors. This is what lets Layer 5 pass
between a subspace and a matrix cutting it out. -/
theorem pluckerPoint_range_vecMulLinear {m : ℕ} (A : Matrix (Fin m) ι K)
    (hV : Module.finrank K (LinearMap.range A.vecMulLinear) = m)
    (hm : minorDet A ≠ 0) :
    pluckerPoint m (LinearMap.range A.vecMulLinear) hV =
      Projectivization.mk K (minorDet A) hm :=
  sorry

/-- **Layer 3.3 (Bombieri–Gubler, Remark 2.8.7).** Invariance under row operations: the height of
the row space is unchanged by left multiplication by an invertible matrix. This is the invariance
that the naïve Siegel bound of 5.1 lacks and that Bombieri–Vaaler achieves. -/
theorem subspaceMulHeight_range_vecMulLinear_mul {m : ℕ} (U : Matrix (Fin m) (Fin m) K)
    (hU : IsUnit U.det) (A : Matrix (Fin m) ι K)
    (h₁ : Module.finrank K (LinearMap.range (U * A).vecMulLinear) = m)
    (h₂ : Module.finrank K (LinearMap.range A.vecMulLinear) = m) :
    subspaceMulHeight m (LinearMap.range (U * A).vecMulLinear) h₁ =
      subspaceMulHeight m (LinearMap.range A.vecMulLinear) h₂ :=
  sorry

/-- **Layer 3.3 — the Cauchy–Binet identity (Bombieri–Gubler, Proposition 2.8.8).** At an
archimedean place the ℓ² local factor of the minor vector is the square root of a determinant.
This is exactly where the `√(det (Aᵀ A))` of the Bombieri–Vaaler bound comes from, so it is a
named milestone rather than a step inside a proof. -/
theorem sum_minorDet_sq_eq_det {m : ℕ} (A : Matrix (Fin m) ι ℝ) :
    ∑ s : Set.powersetCard ι m, minorDet A s ^ 2 = (A * A.transpose).det :=
  sorry

/-- **Layer 3.4 — the duality theorem (Bombieri–Gubler, Proposition 2.8.10; W. M. Schmidt).** The
height of a subspace equals the height of its annihilator in the dual, identified with `ι → K`
through the standard basis. Equivalently (Corollary 2.8.12): the height of a subspace equals the
height of any matrix cutting it out. The route is that the complementation isomorphism
`⋀^k V ≅ ⋀^n V ⊗ ⋀^(n-k) V*` carries basis vectors to basis vectors up to sign, so the two
coordinate tuples agree up to a signed reindexing, and `Height.mulHeight_comp_equiv` together with
`Height.mulHeight_neg` finishes it. -/
theorem subspaceMulHeight_dualAnnihilator (k : ℕ) (V : Submodule K (ι → K))
    (hV : Module.finrank K V = k)
    (hVd : Module.finrank K
      (V.dualAnnihilator.map (Module.piEquiv ι K K).symm.toLinearMap) = Fintype.card ι - k) :
    subspaceMulHeight (Fintype.card ι - k)
        (V.dualAnnihilator.map (Module.piEquiv ι K K).symm.toLinearMap) hVd =
      subspaceMulHeight k V hV :=
  sorry

/-- **Layer 3.4 — submodularity (Bombieri–Gubler, Theorem 2.8.13; Schmidt, Struppeck–Vaaler).**
The height of a subspace is submodular in the subspace lattice. -/
theorem subspaceMulHeight_sup_add_inf_le (j k l m : ℕ) (V W : Submodule K (ι → K))
    (hV : Module.finrank K V = j) (hW : Module.finrank K W = k)
    (hsup : Module.finrank K ↥(V ⊔ W) = l) (hinf : Module.finrank K ↥(V ⊓ W) = m) :
    subspaceMulHeight l (V ⊔ W) hsup * subspaceMulHeight m (V ⊓ W) hinf ≤
      subspaceMulHeight j V hV * subspaceMulHeight k W hW :=
  sorry

/-- **Layer 3.5 — monotonicity (the form Layer 5.4 consumes).** The span of part of a basis has
height at most that of the whole space; in particular every basis vector has height at most
`H(V)`. -/
theorem subspaceMulHeight_span_subset_le (k j : ℕ) (V : Submodule K (ι → K))
    (hV : Module.finrank K V = k) (b : Basis (Fin k) K V) (I : Finset (Fin k))
    (hW : Module.finrank K (Submodule.span K (Set.image (fun i ↦ (b i : ι → K)) I)) = j)
    (hj : I.card = j) :
    subspaceMulHeight j (Submodule.span K (Set.image (fun i ↦ (b i : ι → K)) I)) hW ≤
      subspaceMulHeight k V hV :=
  sorry

/-- **Layer 3.6.** Northcott for subspaces over a number field, immediate from injectivity of the
Plücker map (3.1) and Northcott on projective space (1.1). -/
theorem finite_setOf_subspaceMulHeight_le {K : Type*} [Field K] [NumberField K] (k : ℕ) (B : ℝ) :
    {V : {V : Submodule K (ι → K) // Module.finrank K V = k} |
      subspaceMulHeight k V.val V.prop ≤ B}.Finite :=
  sorry

end Plucker

/-! ## Layer 4: successive minima, Minkowski's second theorem, extraction, and cube slicing -/

section SuccessiveMinima

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureTheory.MeasureSpace E] [BorelSpace E]

/-- **Layer 4.1.** The `i`-th successive minimum of a symmetric convex body with respect to a
lattice: the least dilation of the body containing `i + 1` linearly independent lattice points.
The `i = 0` case is the quantity in Minkowski's convex-body theorem, which Mathlib has. -/
def successiveMinimum (L : Submodule ℤ E) (B : Set E) (i : ℕ) : ℝ :=
  sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i + 1) → E,
    (∀ j, v j ∈ (t • B) ∩ (L : Set E)) ∧ LinearIndependent ℝ v}

/-- **Layer 4.1.** The successive minima are positive. Monotonicity in `i` and the scaling law in
`B` belong to the same milestone. -/
theorem successiveMinimum_pos (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty) (i : ℕ) :
    0 < successiveMinimum L B i :=
  sorry

/-- **Layer 4.2 — Minkowski's second theorem, the easy half.** -/
theorem measure_mul_prod_successiveMinimum_le (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B)
    (hB₂ : (interior B).Nonempty) :
    (2 : ℝ) ^ Module.finrank ℝ E / (Nat.factorial (Module.finrank ℝ E)) *
        ZLattice.covolume L ≤
      (∏ i ∈ Finset.range (Module.finrank ℝ E), successiveMinimum L B i) *
        (MeasureTheory.volume B).toReal :=
  sorry

/-- **Layer 4.2 — Minkowski's second theorem, the substantial half.** This is the direction Layer
5 consumes; the proof is the compression argument along a basis realizing the minima. -/
theorem prod_successiveMinimum_mul_measure_le (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] {B : Set E} (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B)
    (hB₂ : (interior B).Nonempty) :
    (∏ i ∈ Finset.range (Module.finrank ℝ E), successiveMinimum L B i) *
        (MeasureTheory.volume B).toReal ≤
      (2 : ℝ) ^ Module.finrank ℝ E * ZLattice.covolume L :=
  sorry

end SuccessiveMinima

section Extraction

variable {F K E V W : Type*}
variable [Field F] [Field K] [Field E]
variable [Algebra F K] [Algebra F E] [FiniteDimensional F K]
variable [AddCommGroup V] [Module F V] [Module K V] [IsScalarTower F K V]
variable [AddCommGroup W] [Module F W] [Module E W] [IsScalarTower F E W]

/-- **Layer 4.4 — the counting half of the extraction lemma.** A family of vectors of a
`K`-vector space whose image under an `F`-linear map is linearly independent over a field
`E ⊇ F` has size at most `[K : F]` times the `K`-dimension of its span. With `F = ℚ`, `E = ℝ`
and the mixed embedding as the map: `ℝ`-independent lattice vectors of a `K`-subspace span, over
`K`, a subspace of dimension at least their number divided by the degree. -/
theorem fintype_card_le_finrank_mul_finrank_span
    (f : V →ₗ[F] W) {ι : Type*} [Fintype ι] {u : ι → V}
    (h : LinearIndependent E (f ∘ u)) :
    Fintype.card ι ≤ finrank F K * finrank K (Submodule.span K (Set.range u)) :=
  sorry

/-- **Layer 4.4 — the selection half.** From `d · k` vectors with `E`-independent images, a
`K`-linearly independent subfamily of size `k` whose `j`-th member (zero-indexed) is among the
first `d · j + 1` — members of the family, never linear combinations, so each keeps the norm
bound of the successive minimum it realizes. -/
theorem exists_linearIndependent_comp_finrank_mul
    (f : V →ₗ[F] W) {k : ℕ} {u : Fin (finrank F K * k) → V}
    (h : LinearIndependent E (f ∘ u)) :
    ∃ s : Fin k → Fin (finrank F K * k), LinearIndependent K (u ∘ s) ∧
      ∀ j : Fin k, (s j).val ≤ finrank F K * j.val :=
  sorry

end Extraction

section CubeSlicing

/-- **Layer 4.5 — Vaaler's cube-slicing theorem** (Vaaler 1979; Bombieri–Gubler, Appendix C.3).
Every central slice of the cube `[−1, 1]ᴺ` by a `k`-dimensional subspace has `k`-volume at least
`2 ^ k`. The volume on the subspace is the canonical one of its inner-product structure
(Mathlib's `measureSpaceOfInnerProductSpace`), which is what makes `k`-dimensional volume
well-posed. Coordinate subspaces give equality, so the bound is sharp. The complex places of
Layer 5 consume it through the inscribed cube of half-side `1 / √2` in the unit polydisc; no
polydisc-slicing statement is needed. -/
theorem two_pow_finrank_le_volume_inter_cube {N : ℕ}
    (V : Submodule ℝ (EuclideanSpace ℝ (Fin N))) :
    (2 : ENNReal) ^ finrank ℝ V ≤
      MeasureTheory.volume {x : V | ∀ i, |(x : EuclideanSpace ℝ (Fin N)) i| ≤ 1} :=
  sorry

end CubeSlicing

/-! ## Layer 5: Siegel's lemma and Bombieri–Vaaler (the summit) -/

section Siegel

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-! ### Layer 5 over `ℤ`

Bombieri–Vaaler 1983, Theorems 1 and 2. The Gram matrix is `A * Aᵀ`, the `M × M` determinant of the
rows; `Aᵀ * A` is `N × N` and singular whenever `M < N`, and stating it that way is the standard
slip these signatures exist to prevent. -/

section SiegelInt

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n] [LinearOrder n]

/-- The greatest common divisor of the maximal minors of `A` — the `D` of Bombieri–Vaaler. -/
def minorGcd (A : Matrix m n ℤ) : ℤ :=
  (Finset.univ.image fun s : Set.powersetCard n (Fintype.card m) ↦
    (A.submatrix (Fintype.equivFin m).symm
      fun i ↦ (Set.powersetCard.orderIsoOfFin s i : n)).det).gcd id

/-- **Layer 5.2, Bombieri–Vaaler Theorem 1 — one small solution.** -/
theorem exists_ne_zero_mulVec_eq_zero_norm_le (A : Matrix m n ℤ) (hA : A ≠ 0)
    (hrank : A.rank = Fintype.card m) (hmn : Fintype.card m < Fintype.card n) :
    ∃ x : n → ℤ, x ≠ 0 ∧ A.mulVec x = 0 ∧
      (⨆ i, |(x i : ℝ)|) ≤
        (Real.sqrt |((A * A.transpose).det : ℝ)| / |(minorGcd A : ℝ)|) ^
          ((Fintype.card n - Fintype.card m : ℝ)⁻¹) :=
  sorry

/-- **Layer 5.2, Bombieri–Vaaler Theorem 2 — a small basis.** The statement Layer 5.3 generalizes
to a number field. Over `ℤ` the extraction 4.4 is vacuous — the minima vectors of 4.2 are already
the basis — and the constant is 3.4's Cauchy–Binet determinant with 4.5's slice bound; the
adele-free assembly is written out in Aliev–Henk §6. -/
theorem exists_linearIndependent_mulVec_eq_zero_prod_norm_le (A : Matrix m n ℤ) (hA : A ≠ 0)
    (hrank : A.rank = Fintype.card m) (hmn : Fintype.card m < Fintype.card n) :
    ∃ x : Fin (Fintype.card n - Fintype.card m) → (n → ℤ),
      LinearIndependent ℤ x ∧ (∀ l, A.mulVec (x l) = 0) ∧
      (∏ l, ⨆ i, |((x l i : ℤ) : ℝ)|) ≤
        Real.sqrt |((A * A.transpose).det : ℝ)| / |(minorGcd A : ℝ)| :=
  sorry

end SiegelInt

/-- **Layer 3.2, Arakelov form** (Bombieri–Gubler, Definition 2.8.5). `H_Ar(W)`: the Arakelov
height of the Plücker point. This, not the sup-norm subspace height, is the quantity on the
right-hand side of Bombieri–Vaaler; the two are related by the Layer 0.2 comparison. -/
def arakelovSubspaceMulHeight (k : ℕ) (V : Submodule K (ι → K))
    (hV : Module.finrank K V = k) : ℝ :=
  sorry

/-- **Layer 5.3 — Bombieri–Vaaler over a number field: the summit** (Bombieri–Gubler, Theorem
2.9.4; Bombieri–Vaaler 1983).

For `A` an `M × N` matrix of rank `M` over a number field `K` of degree `d` and discriminant
`D_{K/ℚ}`, the solution space of `A x = 0` has a basis `x₁, …, x_{N−M}` with

`∏ l, H(x l) ≤ |D_{K/ℚ}| ^ ((N − M) / (2 d)) * H_Ar(A)`,

where `H` is the absolute multiplicative height and `H_Ar(A)` is the Arakelov height of the row
space — the subspace height of Layer 3, not the height of the entries of `A`. Stated here for the
kernel of a matrix; the equivalent subspace form follows from the duality theorem 3.4. -/
theorem exists_basis_prod_absMulHeight_le {m : ℕ} (A : Matrix (Fin m) ι K)
    (hrank : Module.finrank K (LinearMap.range A.vecMulLinear) = m)
    (k : ℕ) (hk : Module.finrank K (LinearMap.ker A.mulVecLin) = k) :
    ∃ b : Module.Basis (Fin k) K (LinearMap.ker A.mulVecLin),
      (∏ l, absMulHeight (fun j ↦ (b l : ι → K) j)) ≤
        |(NumberField.discr K : ℝ)| ^ ((k : ℝ) / (2 * Module.finrank ℚ K)) *
          arakelovSubspaceMulHeight m (LinearMap.range A.vecMulLinear) hrank :=
  sorry

/-- **Layer 5.4 — the entry-height corollary** (Bombieri–Gubler, Corollary 2.9.9). Bounding the
Arakelov height of the row space by the height of the entries through `H_Ar(Aₘ) ≤ √N · H(A)` gives
the form applications actually quote, and over `ℚ` it improves the `N` of the classical Siegel
lemma (5.1) to `√N`. -/
theorem exists_ne_zero_mem_ker_absMulHeight_le {m : ℕ} (A : Matrix (Fin m) ι K)
    (hrank : Module.finrank K (LinearMap.range A.vecMulLinear) = m)
    (hm : m < Fintype.card ι) :
    ∃ x : ι → K, x ≠ 0 ∧ A.mulVec x = 0 ∧
      absMulHeight x ≤
        |(NumberField.discr K : ℝ)| ^ (2 * Module.finrank ℚ K : ℝ)⁻¹ *
          (Real.sqrt (Fintype.card ι) * matrixMulHeight A) ^
            ((m : ℝ) / (Fintype.card ι - m)) :=
  sorry

/-- **Layer 5.5 — the relative version** (Bombieri–Gubler, Theorem 2.9.19): the entries lie in a
finite extension `F/K` while the solutions are required to lie in `K`. This is the form
transcendence arguments use when the auxiliary construction and the field of definition differ. -/
theorem exists_linearIndependent_mem_ker_of_extension
    (F : Type*) [Field F] [NumberField F] [Algebra K F] {m : ℕ} (A : Matrix (Fin m) ι F)
    (hmn : Module.finrank K F * m < Fintype.card ι) :
    ∃ x : Fin (Fintype.card ι - Module.finrank K F * m) → (ι → K),
      LinearIndependent K x ∧ ∀ l, A.mulVec (fun j ↦ algebraMap K F (x l j)) = 0 :=
  sorry

end Siegel

/-! ## Layer 6: heights and the unit group

Mathlib proves Dirichlet's unit theorem in full (`NumberField.Units.logEmbedding`, `unitLattice`,
`unitLattice_span_eq_top`, `rank`, `fundSystem`, `regulator`). This layer builds the height-side
dictionary around it and the `S`-adic generalization Mathlib does not have; it re-proves none of
the unit theorem. -/

section Units

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 6.2 — units of height one.** The height-theoretic identification of the torsion
subgroup, from Kronecker (1.4) and Mathlib's `logEmbedding_ker`. -/
theorem absMulHeight₁_eq_one_iff_mem_torsion (u : (𝓞 K)ˣ) :
    NumberField.absMulHeight₁ ((u : 𝓞 K) : K) = 1 ↔ u ∈ NumberField.Units.torsion K :=
  sorry

/-- **Layer 6.3.** The regulator and the heights of a fundamental system bound each other: a unit
basis of small height and a small regulator are the same statement. -/
theorem exists_bounds_regulator_prod_absMulHeight₁ :
    ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧
      c₁ * NumberField.Units.regulator K ≤
        ∏ i, NumberField.absLogHeight₁ ((NumberField.Units.fundSystem K i : 𝓞 K) : K) ∧
      ∏ i, NumberField.absLogHeight₁ ((NumberField.Units.fundSystem K i : 𝓞 K) : K) ≤
        c₂ * NumberField.Units.regulator K :=
  sorry

/-- **Layer 6.4.** The height characterization of `S`-units: an element is an `S`-unit exactly when
its height is supported on `S` together with the infinite places. The carrier
`Set (HeightOneSpectrum (𝓞 K))` follows `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` and
mathlib4#40791. -/
def IsSUnit (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) (x : K) : Prop :=
  x ≠ 0 ∧ ∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K), v ∉ S → v.valuation K x = 1

/-- **Layer 6.5 — the `S`-unit theorem (mathlib4#40791).** The `S`-units form a finitely generated
group of rank `r₁ + r₂ - 1 + |S|`; `S = ∅` recovers Mathlib's `NumberField.Units.rank`. -/
theorem sUnit_rank_eq (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) :
    ∃ r : ℕ, r = NumberField.Units.rank K + S.card :=
  sorry

end Units

/-! ## Worked examples (acceptance criteria)

These are cheap checks that the definitions mean what they should; they belong in the `TauCeti/`
files as `example`s. See the "Worked examples" section of `README.md` for what each one rejects. -/

section Examples

/-- The rational height, from Mathlib's `Rat.mulHeight₁_eq_max`. A definition that does not give
`4` here has numerator and denominator confused. -/
example : Height.mulHeight₁ (3 / 4 : ℚ) = 4 := sorry

/-- The two normalizations genuinely differ, so the `n ^ (k / 2)` factor in Layer 5.4 is not
cosmetic: a proof that silently interchanges them is wrong. -/
example : arakelovMulHeight ![(1 : ℚ), 1] = Real.sqrt 2 := sorry

/-- …while the sup-norm height of the same tuple is `1`. -/
example : Height.mulHeight ![(1 : ℚ), 1] = 1 := sorry

/-- **Rejection test for Layer 1.4.** A transcendental has absolute height one by the junk value,
not by Kronecker, so a statement of Kronecker's theorem without an algebraicity hypothesis is
false. -/
example : NumberField.absMulHeight₁ (Real.pi : ℂ) = 1 := sorry

end Examples

end

end TauCetiRoadmap.ArithmeticHeights
