import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Places.Extension
import TauCeti.RingTheory.KrullDimension.FiniteType

/-!
# DiophantineApproximationAndTranscendence: representative target signatures

The roadmap is README.md. This file suggests definitions and theorem signatures
statable against the pinned APIs, with discriminating examples. It is not
exhaustive. Primitive polynomials have positive leading coefficient, heights
retain their relative or absolute normalization, derivatives are divided when
specified, and logarithms carry their branches. The declarations state layer milestones; the README also specifies the full APIs
and the constructions whose mathematical existence is a target.

The height and Siegel foundation is owned by README §§0.2–0.3,1.3,2.5,2.8.
Relative heights use Mathlib's Height carriers; Euclidean and absolute heights
are their stated normalization adapters. The real minima, Minkowski product
bounds and Gram bounds are supplied by GeometryOfNumbersAndQuadraticArithmetic
§§0.1,1.2–1.5. The scalar-restriction core below applies to arbitrary field towers.
-/

/-! Formula carrier for isolated signatures. This definition has no provider ownership;
provider import compatibility and the comparison with the provider declaration are README targets. -/

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendence.SignatureModel

open Classical in
/-- The analytic coefficient of multi-order α at x, with value zero off analyticity. -/
noncomputable def taylorCoeff {n : ℕ} (f : (Fin n → ℂ) → ℂ)
    (x : Fin n → ℂ) (α : Fin n → ℕ) : ℂ :=
  if h : AnalyticAt ℂ f x then
    ∑ g ∈ Finset.univ.filter (fun g : Fin (∑ i, α i) → Fin n =>
      ∀ i, (Finset.univ.filter fun j => g j = i).card = α i),
      h.choose (∑ i, α i) (fun j => Pi.single (g j) (1 : ℂ))
  else 0

end TauCetiRoadmap.DiophantineApproximationAndTranscendence.SignatureModel

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendence

#check TauCeti.GlobalNumberFields.Place
#check TauCeti.GlobalNumberFields.normalizedAbsValue
#check TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one
#check Set.unit
#check Submodule.orthogonalBilin
#check TauCeti.ringKrullDim_eq_toNat_trdeg
#check NumberField.finite_setOfPred_mulHeight₁_le
#check NumberField.house_eq_sup'
#check NumberField.isUnit_iff_norm
#check NumberField.mulHeight_eq
#check NumberField.prod_abs_eq_one
#check Polynomial.isPrimitive_iff_forall_gaussNorm_eq_one
#check Polynomial.gaussNorm_mul
#check Polynomial.gaussNorm_C
#check TauCeti.height_eq_ringKrullDim_of_isMaximal
#check TauCeti.ringKrullDim_eq_of_isIntegral_of_faithfulSMul

noncomputable section

open TauCeti.GlobalNumberFields

/-! ## Layer 0: heights and approximation exponents -/

open Polynomial NumberField Filter
open scoped ENNReal NNReal Topology

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

/-- Plücker coordinates on the native finite-subset index: the maximal minors in increasing
column order, over any commutative ring. -/
def plucker {R ι : Type*} [CommRing R] [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → R) : Set.powersetCard ι p → R :=
  fun s ↦ Matrix.det (Matrix.of fun i j ↦ x i (Set.powersetCard.ofFinEmbEquiv.symm s j))

/-- The maximal minors are the coordinates of the wedge in the standard exterior-power basis. -/
theorem plucker_eq_exteriorPower_coordinates {R ι : Type*} [CommRing R] [Fintype ι]
    [LinearOrder ι] {p : ℕ} (x : Fin p → ι → R) :
    plucker x = fun s ↦ ((Pi.basisFun R ι).exteriorPower p).repr
      (exteriorPower.ιMulti R p x) s := by sorry

/-- Cauchy–Binet computes a rectangular product determinant from the same Plücker coordinates. -/
theorem plucker_cauchyBinet {R ι : Type*} [CommRing R] [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x y : Fin p → ι → R) :
    (Matrix.of x * (Matrix.of y).transpose).det = ∑ s, plucker x s * plucker y s := by sorry

/-- The basis-independent Plücker point of a subspace, including its empty wedge in rank zero. -/
def relativePluckerPoint {K ι : Type*} [Field K] [Fintype ι] [LinearOrder ι]
    (T : Submodule K (ι → K)) :
    Projectivization K (Set.powersetCard ι (Module.finrank K T) → K) :=
  Projectivization.mk K (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K)) (by sorry)

/-- The relative sup height of the native Plücker point over a field with admissible values. -/
def relativeSubspaceHeight {K ι : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Fintype ι] [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  Projectivization.mulHeight (relativePluckerPoint T)

/-- A spanning independent family computes the relative subspace height through its minors. -/
theorem relativeSubspaceHeight_span_range {K ι : Type*} [Field K]
    [Height.AdmissibleAbsValues K] [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → K) (hx : LinearIndependent K x) :
    relativeSubspaceHeight (Submodule.span K (Set.range x)) = Height.mulHeight (plucker x) :=
  by sorry

/-- Relative sup height is invariant under dual annihilation transported by the standard basis. -/
theorem relativeSubspaceHeight_dualAnnihilator {K ι : Type*} [Field K]
    [Height.AdmissibleAbsValues K] [Fintype ι] [LinearOrder ι]
    (T : Submodule K (ι → K)) :
    relativeSubspaceHeight (T.dualAnnihilator.comap (Module.piEquiv ι K K).toLinearMap) =
      relativeSubspaceHeight T := by sorry

/-- The transported dual annihilator is the dot-product perpendicular over any field. -/
theorem orthogonalBilin_eq_dualAnnihilator_comap {K ι : Type*} [Field K]
    [Fintype ι] (U : Submodule K (ι → K)) :
    U.orthogonalBilin (dotProductBilin K K) =
      U.dualAnnihilator.comap (Module.piEquiv ι K K).toLinearMap := by sorry

section Heights

variable {F : Type*} [Field F] [CharZero F]
variable {F' : Type*} [Field F'] [CharZero F']

open Classical in
/-- The primitive minimal polynomial `F_x ∈ ℤ[X]` of `x` over `ℚ` (Evertse ch. 3, p. 41):
primitive, positive leading coefficient, a `ℚ`-multiple of `minpoly ℚ x`.
Junk value `1` when `x` is transcendental. -/
def primitiveMinpoly (x : F) : ℤ[X] :=
  if IsAlgebraic ℚ x then
    (if 0 < (IsLocalization.integerNormalization (nonZeroDivisors ℤ)
          (minpoly ℚ x)).primPart.leadingCoeff then
        (IsLocalization.integerNormalization (nonZeroDivisors ℤ) (minpoly ℚ x)).primPart
      else -(IsLocalization.integerNormalization (nonZeroDivisors ℤ) (minpoly ℚ x)).primPart)
  else 1

/-- Layer 0 map primitive minpoly: `F_x = a₀ · minpoly ℚ x`; its complex roots are the conjugates. -/
theorem map_primitiveMinpoly (x : F) (hx : IsAlgebraic ℚ x) :
    (primitiveMinpoly x).map (Int.castRingHom ℚ) =
      C ((primitiveMinpoly x).leadingCoeff : ℚ) * minpoly ℚ x := by sorry

/-- A primitive irreducible P ∈ ℤ[X] with positive leading coefficient and P(x) = 0 equals F_x. -/
theorem primitiveMinpoly_eq_of_isPrimitive {x : F} {P : ℤ[X]} (hP : P.IsPrimitive)
    (hlc : 0 < P.leadingCoeff) (hirr : Irreducible P) (hPx : aeval x P = 0) :
    primitiveMinpoly x = P := by sorry

/-- F_{p/q} = qX − p for q ∈ ℚ written in lowest terms (den q)X − num q. -/
theorem primitiveMinpoly_ratCast (q : ℚ) :
    primitiveMinpoly (q : F) = C (q.den : ℤ) * X - C q.num := by sorry

/-- Test `test_primitiveMinpoly_twoThirds` (computation). -/
example : primitiveMinpoly (((2 : ℚ) / 3 : ℚ) : ℝ) = C 3 * X - C 2 := by sorry
/-- Test `test_primitiveMinpoly_evertseExample` (computation). -/
example : primitiveMinpoly ((1 + 2 * Real.sqrt 3) / 5) = C 25 * X ^ 2 - C 10 * X - C 11 := by
  sorry
/-- Test `test_primitiveMinpoly_transcendental_denominator` (non-example): the junk
polynomial cannot provide unconditional integrality or denominator divisibility. -/
example : ¬ IsIntegral ℤ (liouvilleNumber 10) ∧
    Algebra.natDenominator (liouvilleNumber 10) = 0 := by sorry

/-- Test `test_primitiveMinpoly_half_ne_minpolyInt` (non-example). -/
example : primitiveMinpoly (((1 : ℚ) / 2 : ℚ) : ℝ) ≠ minpoly ℤ (((1 : ℚ) / 2 : ℚ) : ℝ) := by sorry

/-- The naive height `H(x)`: the maximum of the absolute values of the coefficients of the
primitive minimal polynomial (Evertse ch. 3, p. 41), as Mathlib's `Polynomial.supNorm`. -/
def naiveHeight (x : F) : ℝ := (primitiveMinpoly x).supNorm

/-- Test `test_naiveHeight_evertseExample` (computation). -/
example : naiveHeight ((1 + 2 * Real.sqrt 3) / 5) = 25 := by sorry
/-- Test `test_naiveHeight_zero` (degenerate). -/
example : naiveHeight (0 : ℝ) = 1 := by sorry

/-- Test `test_naiveHeight_sqrtTwo_ne_absHeight` (non-example). -/
example : naiveHeight (Real.sqrt 2) ≠ NumberField.absMulHeight₁ (Real.sqrt 2) := by sorry

/-- Layer 0 naive height of rational: `H(p/q) = max(|p|, q)`, equal to Mathlib's height of a
rational number. -/
theorem naiveHeight_ratCast (q : ℚ) :
    naiveHeight (q : F) = max |(q.num : ℝ)| (q.den : ℝ) ∧
      naiveHeight (q : F) = Height.mulHeight₁ q := by sorry

/-- The Mahler measure `M(x) = a₀ ∏ max(1, |x⁽ⁱ⁾|)` of an algebraic number
(Evertse ch. 6, p. 108): Mathlib's Mahler measure of `F_x` mapped to `ℂ`. -/
def mahlerMeasure (x : F) : ℝ := (primitiveMinpoly x).mapMahlerMeasure (Int.castRingHom ℂ)

/-- For algebraic x: M(x) = 1 ↔ x = 0 or x is a root of unity (Kronecker). -/
theorem mahlerMeasure_eq_one_iff {x : F} (hx : IsAlgebraic ℚ x) :
    mahlerMeasure x = 1 ↔ x = 0 ∨ ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := by sorry

/-- Finitely many algebraic z ∈ ℂ of degree ≤ d with M(z) ≤ B (Northcott for M). -/
theorem finite_setOf_mahlerMeasure_le (d : ℕ) (B : ℝ) :
    {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ mahlerMeasure z ≤ B}.Finite := by
  sorry

/-- Test `test_mahlerMeasure_half` (computation). -/
example : mahlerMeasure (((1 : ℚ) / 2 : ℚ) : ℝ) = 2 := by sorry
/-- Test `test_mahlerMeasure_sqrtTwo` (computation). -/
example : mahlerMeasure (Real.sqrt 2) = 2 := by sorry

/-- Test `test_mahlerMeasure_half_ne_norm` (non-example). -/
example : mahlerMeasure (((1 : ℚ) / 2 : ℚ) : ℝ) ≠ |Algebra.norm ℚ ((1 : ℚ) / 2)| := by sorry

/-- The house `⌈x⌉`: the largest absolute value of a complex conjugate of `x`
(Evertse ch. 3, p. 52), independent of any number field; junk value `0` for
transcendental `x`. -/
def house (x : F) : ℝ := ⨆ z : (minpoly ℚ x).rootSet ℂ, ‖(z : ℂ)‖

/-- Layer 0 house eq numberField house (Evertse (3.2)). -/
theorem house_eq_numberField_house {K : Type*} [Field K] [NumberField K] (x : K) :
    house x = NumberField.house x := by sorry

/-- For a nonzero algebraic integer: ⌈x⌉ = 1 ↔ x is a root of unity (Kronecker). -/
theorem house_eq_one_iff {x : F} (hx : IsIntegral ℤ x) (h0 : x ≠ 0) :
    house x = 1 ↔ ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := by sorry

/-- Test `test_house_sqrtTwo` (computation). -/
example : house (Real.sqrt 2) = Real.sqrt 2 := by sorry
/-- Test `test_house_conjugateGolden` (computation). -/
example : house ((1 - Real.sqrt 5) / 2) = (1 + Real.sqrt 5) / 2 := by sorry
/-- Test `test_house_ne_abs` (non-example). -/
example : |(1 - Real.sqrt 5) / 2| < house ((1 - Real.sqrt 5) / 2) := by sorry

end Heights

section Comparison

/-- Regrouping a product over the infinite places of `L` along the places of `K` below them:
the multiplicities above `v` add up to `mult v * [L : K]`. -/
theorem prod_infinitePlace_comap_pow_mult {K L : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] {M : Type*} [CommMonoid M] (g : InfinitePlace K → M) :
    ∏ w : InfinitePlace L, g (w.comap (algebraMap K L)) ^ w.mult =
      ∏ v : InfinitePlace K, g v ^ (v.mult * Module.finrank K L) := by sorry

-- The restriction of a finite place along `K → L` is Mathlib's
-- `NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap`; it is consumed, not restated.

/-- Under a finite extension of number fields the relative height of a tuple is raised to the
degree `[L : K]`; the zero tuple has value one in both fields. -/
theorem mulHeight_algebraMap {K L : Type*} [Field K] [NumberField K] [Field L] [NumberField L]
    [Algebra K L] {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight (algebraMap K L ∘ x) = Height.mulHeight x ^ Module.finrank K L := by sorry

/-- Relative heights are invariant under isomorphisms of number fields. -/
theorem mulHeight_ringEquiv {K K' : Type*} [Field K] [NumberField K] [Field K']
    [NumberField K'] (e : K ≃+* K') {ι : Type*} [Finite ι] (x : ι → K) :
    Height.mulHeight (e ∘ x) = Height.mulHeight x := by sorry

/-- Mathlib's absolute height of an element of a number field `K` is the `[K : ℚ]`-th root of
its relative height in `K`. -/
theorem absMulHeight₁_eq_rpow {K : Type*} [Field K] [NumberField K] (x : K) :
    NumberField.absMulHeight₁ x = Height.mulHeight₁ x ^ ((Module.finrank ℚ K : ℝ)⁻¹) := by sorry

/-- The absolute height depends only on the minimal polynomial over `ℚ`, so conjugates and
images under field embeddings have the same height. -/
theorem absMulHeight₁_eq_of_minpoly_eq {F F' : Type*} [Field F] [CharZero F] [Field F']
    [CharZero F'] {x : F} {y : F'} (h : minpoly ℚ x = minpoly ℚ y) :
    NumberField.absMulHeight₁ x = NumberField.absMulHeight₁ y := by sorry

open Classical IntermediateField in
/-- The absolute projective height of a finite tuple in a characteristic-zero field: the relative
height in the number field generated by the coordinates, with its degree root. The zero tuple
has value one, and a tuple with a transcendental coordinate has junk value one. -/
def absoluteProjectiveTupleHeight {K : Type*} [Field K] [CharZero K]
    {ι : Type*} [Fintype ι] (x : ι → K) : ℝ :=
  if hx : ∀ i, IsIntegral ℚ (x i) then
    let E := IntermediateField.adjoin ℚ (Set.range x)
    haveI : FiniteDimensional ℚ E := IntermediateField.finiteDimensional_adjoin
      (by rintro y ⟨i, rfl⟩; exact hx i)
    haveI : NumberField E := {}
    Height.mulHeight (fun i => (⟨x i, IntermediateField.subset_adjoin ℚ _
      (Set.mem_range_self i)⟩ : E)) ^ (Module.finrank ℚ E : ℝ)⁻¹
  else 1

/-- Computing the absolute tuple height in any number field containing the coordinates gives
the degree root of the relative height there. -/
theorem absoluteProjectiveTupleHeight_eq {K : Type*} [Field K] [NumberField K]
    {ι : Type*} [Fintype ι] (x : ι → K) :
    absoluteProjectiveTupleHeight x =
      Height.mulHeight x ^ ((Module.finrank ℚ K : ℝ)⁻¹) := by sorry

/-- The absolute tuple height is invariant under homomorphisms of characteristic-zero fields. -/
theorem absoluteProjectiveTupleHeight_comp {K K' : Type*} [Field K] [CharZero K] [Field K']
    [CharZero K'] (f : K →+* K') {ι : Type*} [Fintype ι] (x : ι → K) :
    absoluteProjectiveTupleHeight (f ∘ x) = absoluteProjectiveTupleHeight x := by sorry

/-- An algebraic nonzero scalar preserves the absolute tuple height in any characteristic-zero
field, including its projective zero convention. -/
theorem absoluteProjectiveTupleHeight_smul {F : Type*} [Field F] [CharZero F]
    {ι : Type*} [Fintype ι] (x : ι → F) {c : F} (hc : c ≠ 0) (hcalg : IsAlgebraic ℚ c) :
    absoluteProjectiveTupleHeight (c • x) = absoluteProjectiveTupleHeight x := by sorry

/-- The absolute scalar height of `x` is the absolute tuple height of the pair `(x, 1)`. -/
theorem absMulHeight₁_eq_absoluteProjectiveTupleHeight {K : Type*} [Field K] [CharZero K]
    (x : K) : NumberField.absMulHeight₁ x = absoluteProjectiveTupleHeight ![x, 1] := by sorry

/-- The zero tuple keeps the projective value one. -/
example : absoluteProjectiveTupleHeight (0 : Fin 2 → ℚ) = 1 := by sorry

/-- The tuple `(1/3, 1/3)` has absolute height one, while appending a coordinate one gives three. -/
example : absoluteProjectiveTupleHeight (![1 / 3, 1 / 3] : Fin 2 → ℚ) = 1 ∧
    absoluteProjectiveTupleHeight (![1, 1 / 3, 1 / 3] : Fin 3 → ℚ) = 3 := by sorry

variable {F : Type*} [Field F] [CharZero F]

/-- Layer 0 height comparisons: `M(x) = H_abs(x)^d` with `d = deg x`
(both sides are `1` for transcendental `x`). -/
theorem mahlerMeasure_eq_absMulHeight₁_pow (x : F) :
    mahlerMeasure x = NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree := by sorry

/-- Layer 0 naive height abs height comparison. -/
theorem naiveHeight_absMulHeight₁_comparison (x : F) :
    (2 : ℝ)⁻¹ ^ (minpoly ℚ x).natDegree * naiveHeight x ≤
        NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree ∧
      NumberField.absMulHeight₁ x ^ (minpoly ℚ x).natDegree ≤
        Real.sqrt ((minpoly ℚ x).natDegree + 1) * naiveHeight x := by sorry

/-- Layer 0 northcott naive height (with Evertse's count, Theorem 1.7 proof). -/
theorem finite_setOf_naiveHeight_le (d : ℕ) (B : ℝ) :
    {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ naiveHeight z ≤ B}.Finite ∧
      {z : ℂ | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ naiveHeight z ≤ B}.ncard ≤
        d * (2 * ⌊B⌋₊ + 1) ^ (d + 1) := by sorry

/-- Bounded-degree Northcott for algebraic elements in any characteristic-zero field,
using Mathlib's absolute scalar height. -/
theorem finite_setOf_absMulHeight₁_le {F : Type*} [Field F] [CharZero F] (d : ℕ) (B : ℝ) :
    {z : F | IsAlgebraic ℚ z ∧ (minpoly ℚ z).natDegree ≤ d ∧
      NumberField.absMulHeight₁ z ≤ B}.Finite := by sorry

/-- Layer 0 gelfond inequality: heights of the factors of a product of complex polynomials. -/
theorem gelfond_inequality (s : Multiset ℂ[X]) :
    (s.map Polynomial.supNorm).prod ≤ 2 ^ s.prod.natDegree * s.prod.supNorm ∧
      s.prod.supNorm ≤ 2 ^ s.prod.natDegree * (s.map Polynomial.supNorm).prod := by sorry

/-- Layer 0 finite algebraic integers house le (Evertse, Exercise 3.6(iii)). -/
theorem finite_setOf_isIntegral_house_le (d : ℕ) (C : ℝ) :
    {z : ℂ | IsIntegral ℤ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ house z ≤ C}.Finite ∧
      {z : ℂ | IsIntegral ℤ z ∧ (minpoly ℚ z).natDegree ≤ d ∧ house z ≤ C}.ncard ≤
        ∑ k ∈ Finset.range (d + 1), k * (2 * ⌊(2 * max C 1) ^ k⌋₊ + 1) ^ k := by sorry

/-- Minimal-field/primitive-denominator consumer adapter of LinearFormsInLogarithms §§3.1–3.2.
Use the native denominator and field-independent house, retaining the element degree. -/
theorem natDenominator_zpow_mul_house_zpow_le_norm {z : ℂ} (hz : IsAlgebraic ℚ z) (h0 : z ≠ 0) :
    (Algebra.natDenominator z : ℝ) ^ (-((minpoly ℚ z).natDegree : ℤ)) *
      house z ^ (1 - ((minpoly ℚ z).natDegree : ℤ)) ≤ ‖z‖ := by sorry

end Comparison

section Siegel

variable {K : Type*} [Field K] [NumberField K]

/-- Layer 0 siegel theorem number field (Evertse, Theorem 3.20). -/
theorem exists_ne_zero_int_vec_abs_le_of_house_le {M N : ℕ} (a : Fin M → Fin N → 𝓞 K)
    {A : ℝ} (hA : 1 ≤ A) (hM : 0 < M) (hMN : Module.finrank ℚ K * M < N)
    (ha : ∀ i j, NumberField.house (a i j : K) ≤ A) :
    ∃ x : Fin N → ℤ, x ≠ 0 ∧ (∀ i, ∑ j, (x j : 𝓞 K) * a i j = 0) ∧
      ∀ j, (|x j| : ℝ) ≤ (3 * N * A) ^
        (((Module.finrank ℚ K * M : ℕ) : ℝ) / ((N : ℝ) - (Module.finrank ℚ K * M : ℕ))) := by
  sorry

end Siegel

section Dirichlet

/-- Layer 0 dirichlet approximation from minkowski: Dirichlet's theorem for a system of `m`
linear forms in `n` variables, finite-`Q` form (Evertse, Exercise 2.6 / proof of
Corollary 2.7). -/
theorem dirichlet_linearForms {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (A : Matrix (Fin m) (Fin n) ℝ)
    {Q : ℝ} (hQ : 1 < Q) :
    ∃ (y : Fin n → ℤ) (x : Fin m → ℤ), y ≠ 0 ∧ (∀ j, (|y j| : ℝ) ≤ Q) ∧
      ∀ i, |∑ j, A i j * y j - x i| ≤ Q ^ (-(n : ℝ) / m) := by sorry

/-- Layer 0 dirichlet linear forms infinitely many (Evertse, Exercise 2.6). -/
theorem dirichlet_linearForms_infinite {m n : ℕ} (hm : 0 < m) (hn : 0 < n)
    (A : Matrix (Fin m) (Fin n) ℝ)
    (hA : ∀ y : Fin n → ℤ, (∀ i, ∃ k : ℤ, ∑ j, A i j * y j = k) → y = 0) :
    {p : (Fin n → ℤ) × (Fin m → ℤ) | p.1 ≠ 0 ∧
      ∀ i, |∑ j, A i j * p.1 j - p.2 i| ≤ ‖p.1‖ ^ (-(n : ℝ) / m)}.Infinite := by sorry

/-- Layer 0 simultaneous dirichlet theorem (Evertse, Theorem 1.4(i)). -/
theorem simultaneous_dirichlet {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ) {Q : ℝ} (hQ : 1 < Q) :
    ∃ (x : Fin n → ℤ) (y : ℤ), 0 < y ∧ (y : ℝ) ≤ Q ^ n ∧
      ∀ i, |(x i : ℝ) - α i * y| ≤ Q⁻¹ := by sorry

/-- Layer 0 simultaneous dirichlet infinitely many (Evertse, Theorem 1.4(ii), Corollary 2.7(i)). -/
theorem simultaneous_dirichlet_infinite {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ)
    (hα : ∃ i, Irrational (α i)) :
    {p : (Fin n → ℤ) × ℤ | 0 < p.2 ∧ gcd (Finset.univ.gcd p.1) p.2 = 1 ∧
      ∀ i, |α i - p.1 i / p.2| ≤ (p.2 : ℝ) ^ (-1 - 1 / (n : ℝ))}.Infinite := by sorry

/-- Layer 0 dirichlet linear form infinitely many (Evertse, Corollary 2.7(ii); the input of
Lemma 7.6). -/
theorem dirichlet_linearForm_infinite {n : ℕ} (hn : 0 < n) (α : Fin n → ℝ)
    (hα : ∀ y : Fin n → ℤ, (∃ k : ℤ, ∑ j, α j * y j = k) → y = 0) :
    {p : ℤ × (Fin n → ℤ) | p.2 ≠ 0 ∧
      |∑ j, α j * p.2 j - p.1| ≤ ‖p.2‖ ^ (-(n : ℝ))}.Infinite := by sorry

/-- Layer 0 kronecker approximation theorem (Evertse, Theorem 2.22). -/
theorem kronecker_approximation {n : ℕ} (α θ : Fin n → ℝ)
    (hα : LinearIndependent ℚ (Fin.cons (1 : ℝ) α : Fin (n + 1) → ℝ)) {ε : ℝ} (hε : 0 < ε) :
    {p : (Fin n → ℤ) × ℤ | ∀ i, |α i * p.2 - p.1 i - θ i| ≤ ε}.Infinite := by sorry

end Dirichlet

section Exponents

/-- The irrationality exponent `μ(ξ) ∈ [1, ∞]`: the supremum of the `p` with
`LiouvilleWith p ξ`. -/
def irrationalityExponent (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (p : ℝ) (_ : LiouvilleWith p ξ), ENNReal.ofReal p

/-- For irrational ξ: μ(ξ) = sup of the p such that |ξ − r| < den(r)^{-p} for infinitely many r ∈ ℚ. -/
theorem irrationalityExponent_eq_iSup_infinite {ξ : ℝ} (hξ : Irrational ξ) :
    irrationalityExponent ξ =
      ⨆ (p : ℝ) (_ : {r : ℚ | |ξ - r| < (r.den : ℝ) ^ (-p)}.Infinite), ENNReal.ofReal p := by
  sorry

/-- μ(ξ) = ⊤ ↔ Liouville ξ. -/
theorem irrationalityExponent_eq_top_iff (ξ : ℝ) :
    irrationalityExponent ξ = ⊤ ↔ Liouville ξ := by sorry

/-- 2 ≤ μ(ξ) ↔ ξ irrational. -/
theorem two_le_irrationalityExponent_iff (ξ : ℝ) :
    2 ≤ irrationalityExponent ξ ↔ Irrational ξ := by sorry

/-- μ(ξ) = 2 for Lebesgue-almost every ξ. -/
theorem ae_irrationalityExponent_eq_two : ∀ᵐ ξ : ℝ, irrationalityExponent ξ = 2 := by sorry

/-- Test `test_irrationalityExponent_half` (degenerate). -/
example : irrationalityExponent (1 / 2) = 1 := by sorry
/-- Test `test_irrationalityExponent_sqrtTwo` (computation). -/
example : irrationalityExponent (Real.sqrt 2) = 2 := by sorry

/-- Test `test_irrationalityExponent_zero_ne_top` (non-example). -/
example : irrationalityExponent 0 ≠ ⊤ := by sorry

/-- The exponent `w(θ)` of approximation of zero by the linear form
`x₀ + x₁θ₁ + ⋯ + xₙθₙ` (Bugeaud, Definition 2.1, for a general vector). -/
def linearFormExponent {n : ℕ} (θ : Fin n → ℝ) : ℝ≥0∞ :=
  ⨆ (w : ℝ) (_ : {x : Fin (n + 1) → ℤ |
      0 < |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ∧
      |∑ j, (x j : ℝ) * (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ) j| ≤ ‖x‖ ^ (-w)}.Infinite),
    ENNReal.ofReal w

/-- Mahler's exponent `w_n(ξ) = w(ξ, ξ², …, ξⁿ)`. -/
abbrev mahlerExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  linearFormExponent (fun j : Fin n => ξ ^ ((j : ℕ) + 1))

/-- For irrational ξ: w(ξ) + 1 = μ(ξ). -/
theorem linearFormExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    linearFormExponent ![ξ] + 1 = irrationalityExponent ξ := by sorry

/-- Test `test_linearFormExponent_sqrtTwo` (computation). -/
example : linearFormExponent ![Real.sqrt 2] = 1 := by sorry
/-- Test `test_linearFormExponent_half` (non-example). -/
example : linearFormExponent ![(1 / 2 : ℝ)] = 0 := by sorry

/-- The exponent `λ(θ)` of simultaneous rational approximation to `θ₁, …, θₙ`
(Bugeaud, Definition 2.2, for a general vector). -/
def simultaneousExponent {n : ℕ} (θ : Fin n → ℝ) : ℝ≥0∞ :=
  ⨆ (l : ℝ) (_ : {x : ℤ × (Fin n → ℤ) | x.1 ≠ 0 ∧
      ∀ j, |(x.1 : ℝ) * θ j - x.2 j| ≤ |(x.1 : ℝ)| ^ (-l)}.Infinite), ENNReal.ofReal l

/-- For irrational ξ: λ(ξ) + 1 = μ(ξ). -/
theorem simultaneousExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    simultaneousExponent ![ξ] + 1 = irrationalityExponent ξ := by sorry

/-- Test `test_simultaneousExponent_sqrtTwo` (computation). -/
example : simultaneousExponent ![Real.sqrt 2] = 1 := by sorry
/-- Test `test_simultaneousExponent_rationals` (degenerate). -/
example : simultaneousExponent ![(1 / 2 : ℝ), 1 / 3] = ⊤ := by sorry

/-- The exponent `w*_n(ξ)` of approximation by algebraic numbers of degree at most `n`,
measured with the naive height (Bugeaud, Definition 2.1). -/
def algebraicApproximationExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (w : ℝ) (_ : {α : ℂ | IsAlgebraic ℚ α ∧ (minpoly ℚ α).natDegree ≤ n ∧
      0 < ‖(ξ : ℂ) - α‖ ∧ ‖(ξ : ℂ) - α‖ ≤ naiveHeight α ^ (-w - 1)}.Infinite), ENNReal.ofReal w

/-- For irrational ξ: w*_1(ξ) + 1 = μ(ξ). -/
theorem algebraicApproximationExponent_one_add {ξ : ℝ} (hξ : Irrational ξ) :
    algebraicApproximationExponent 1 ξ + 1 = irrationalityExponent ξ := by sorry

/-- Test `test_algebraicApproximationExponent_sqrtTwo` (computation). -/
example : algebraicApproximationExponent 1 (Real.sqrt 2) = 1 := by sorry
/-- Test `test_algebraicApproximationExponent_zero` (degenerate). -/
example (ξ : ℝ) : algebraicApproximationExponent 0 ξ = 0 := by sorry

/-- Test `test_algebraicApproximation_exact_point_not_infinite` (non-example).
An exact algebraic approximant contributes one point to the set. -/
example : ¬ {α : ℂ | IsAlgebraic ℚ α ∧ (minpoly ℚ α).natDegree ≤ 1 ∧
    ‖(1 / 2 : ℂ) - α‖ ≤ naiveHeight α ^ (-2 : ℝ)}.Infinite := by sorry

/-- Layer 0 simultaneous exponent dirichlet bound (Bugeaud, Theorem 2.5, lower bound). -/
theorem inv_le_simultaneousExponent {n : ℕ} (hn : 0 < n) (θ : Fin n → ℝ) :
    ENNReal.ofReal (1 / n) ≤ simultaneousExponent θ := by sorry

/-- Layer 0 linear form exponent dirichlet bound (Bugeaud, Theorem 2.5, lower bound). -/
theorem natCast_le_linearFormExponent {n : ℕ} (hn : 0 < n) (θ : Fin n → ℝ)
    (hθ : LinearIndependent ℚ (Fin.cons (1 : ℝ) θ : Fin (n + 1) → ℝ)) :
    (n : ℝ≥0∞) ≤ linearFormExponent θ := by sorry

/-- Layer 0 algebraic exponent le mahler exponent (Bugeaud, Theorem 2.5, `w*_n ≤ w_n`). -/
theorem algebraicApproximationExponent_le_mahlerExponent {n : ℕ} (hn : 0 < n) {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    algebraicApproximationExponent n ξ ≤ mahlerExponent n ξ := by sorry

/-- Layer 0 irrationality exponent continued fraction (Sondow, Theorem 1). -/
theorem irrationalityExponent_eq_one_add_limsup {ξ : ℝ} (hξ : Irrational ξ) :
    irrationalityExponent ξ = 1 + limsup (fun k : ℕ => ENNReal.ofReal
      (Real.log (ξ.convergent (k + 1)).den / Real.log (ξ.convergent k).den)) atTop := by sorry

/-- An irrational number `ξ` is badly approximable if `q‖qξ‖ ≥ c > 0` for all `q ≥ 1`
(Evertse ch. 2, p. 23). -/
def BadlyApproximable (ξ : ℝ) : Prop :=
  Irrational ξ ∧ ∃ c : ℝ, 0 < c ∧ ∀ q : ℕ, 0 < q → c ≤ q * |q * ξ - round (q * ξ)|

/-- Irrational real algebraic numbers of degree 2 are badly approximable. -/
theorem badlyApproximable_of_natDegree_minpoly_eq_two {ξ : ℝ} (hξ : Irrational ξ)
    (halg : IsAlgebraic ℚ ξ) (hdeg : (minpoly ℚ ξ).natDegree = 2) : BadlyApproximable ξ := by
  sorry

namespace BadlyApproximable

/-- `BadlyApproximable.irrationalityExponent_eq`: badly approximable ⇒ `μ(ξ) = 2`. -/
theorem irrationalityExponent_eq {ξ : ℝ} (h : BadlyApproximable ξ) :
    irrationalityExponent ξ = 2 := by sorry

end BadlyApproximable

/-- Test `test_badlyApproximable_sqrtTwo` (computation). -/
example : BadlyApproximable (Real.sqrt 2) := by sorry
/-- Test `test_not_badlyApproximable_rat` (degenerate). -/
example (q : ℚ) : ¬ BadlyApproximable q := by sorry
/-- Test `test_not_badlyApproximable_liouvilleNumber` (non-example). -/
example : ¬ BadlyApproximable (liouvilleNumber 10) := by sorry

/-- Littlewood's conjecture (Evertse ch. 2, p. 23), as a statement. -/
def LittlewoodConjecture : Prop :=
  ∀ α β : ℝ, ∀ ε > 0, ∃ y : ℕ, 0 < y ∧
    (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| < ε

/-- For α not badly approximable, every β and ε > 0, some y ≥ 1 has y‖yα‖‖yβ‖ < ε. -/
theorem littlewood_of_not_badlyApproximable {α : ℝ} (hα : ¬ BadlyApproximable α) (β : ℝ)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| < ε := by sorry

/-- For all α, β, infinitely many y ≥ 1 satisfy y‖yα‖‖yβ‖ ≤ 1. -/
theorem infinite_setOf_mul_le_one (α β : ℝ) :
    {y : ℕ | 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| * |y * β - round (y * β)| ≤ 1}.Infinite := by
  sorry

/-- Test `test_littlewood_rat` (degenerate). -/
example (q : ℚ) (β : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * (q : ℝ) - round (y * (q : ℝ))| * |y * β - round (y * β)| < ε := by
  sorry
/-- Test `test_littlewood_liouvilleNumber` (computation). -/
example (β : ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * liouvilleNumber 10 - round (y * liouvilleNumber 10)| *
      |y * β - round (y * β)| < ε := by sorry
/-- Test `test_littlewood_oneDimensional_false` (non-example). -/
example : ¬ ∀ α : ℝ, ∀ ε > 0, ∃ y : ℕ, 0 < y ∧ (y : ℝ) * |y * α - round (y * α)| < ε := by sorry

/-- The degree-one Mahler exponent of a quadratic irrational fixes the height convention. -/
example : mahlerExponent 1 (Real.sqrt 2) = 1 := by sorry

/-- No positive approximation exponent comes from a polynomial with no variable. -/
example (ξ : ℝ) : mahlerExponent 0 ξ = 0 := by sorry

end Exponents

end DiophantineApproximation

/-! ## Layer 1: auxiliary polynomials and Roth’s theorem -/

open scoped ENNReal

namespace Polynomial

open _root_.Polynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial

section l1Norm

variable {A : Type*} [SeminormedRing A]

/-- The `ℓ¹`-norm `‖p‖ = ∑ᵢ ‖pᵢ‖` of a polynomial (Mahler's *length*). -/
noncomputable def l1Norm (p : A[X]) : ℝ := p.sum fun _ a => ‖a‖

/-- (6.14), submultiplicativity. -/
theorem l1Norm_mul_le (p q : A[X]) : l1Norm (p * q) ≤ l1Norm p * l1Norm q := sorry

end l1Norm

section l1NormField

variable {𝕜 : Type*} [NormedField 𝕜]

/-- (6.13) -/
theorem norm_eval_le_l1Norm_mul (p : 𝕜[X]) (z : 𝕜) :
    ‖p.eval z‖ ≤ l1Norm p * max 1 ‖z‖ ^ p.natDegree := sorry

end l1NormField

/-- Unit test `Polynomial.l1Norm.test_X_sub_one_sq`: ‖(X − 1)^2‖ = 4 in ℤ[X]. -/
example : l1Norm ((_root_.Polynomial.X - 1) ^ 2 : ℤ[X]) = 4 := sorry
/-- Unit test `Polynomial.l1Norm.test_one`: ‖1‖ = 1 in ℤ[X]. -/
example : l1Norm (1 : ℤ[X]) = 1 := sorry

section hasseWronskian

variable {R : Type*} [CommRing R]

/-- The Wronskian of a family of one-variable polynomials, built from divided derivatives:
`det (hasseDeriv k (g l))`. -/
noncomputable def hasseWronskian {m : ℕ} (g : Fin m → R[X]) : R[X] :=
  Matrix.det (Matrix.of fun (k l : Fin m) => _root_.Polynomial.hasseDeriv (k : ℕ) (g l))

end hasseWronskian

/-- Dependence over an integral domain forces the divided-derivative Wronskian to vanish. -/
theorem hasseWronskian_eq_zero_of_not_linearIndependent {R : Type*} [CommRing R]
    [IsDomain R] {m : ℕ} (g : Fin m → R[X]) (hg : ¬ LinearIndependent R g) :
    hasseWronskian g = 0 := by sorry

/-- A zero divisor gives a dependent singleton with a nonzero Wronskian. -/
example : ¬ LinearIndependent (ZMod 4)
      (fun _ : Fin 1 => (_root_.Polynomial.C 2 : Polynomial (ZMod 4))) ∧
    hasseWronskian (fun _ : Fin 1 => (_root_.Polynomial.C 2 : Polynomial (ZMod 4))) =
      _root_.Polynomial.C 2 ∧
    (_root_.Polynomial.C 2 : Polynomial (ZMod 4)) ≠ 0 := by sorry

/-- Unit test `Polynomial.hasseWronskian.test_one_X_X_sq`: W(1, X, X^2) = 1 over ℚ. -/
example : hasseWronskian ![1, _root_.Polynomial.X, _root_.Polynomial.X ^ 2] = (1 : ℚ[X]) := sorry
/-- Unit test `Polynomial.hasseWronskian.test_dependent`: W(X, 2X) = 0. -/
example : hasseWronskian ![_root_.Polynomial.X, 2 * _root_.Polynomial.X] = (0 : ℚ[X]) := sorry

/-- In characteristic two, the independent polynomials 1 and X² have zero Wronskian. -/
example : LinearIndependent (ZMod 2) ![1, (_root_.Polynomial.X ^ 2 : Polynomial (ZMod 2))] ∧
    hasseWronskian ![1, (_root_.Polynomial.X ^ 2 : Polynomial (ZMod 2))] = 0 := sorry

/-- The Wronskian criterion (Pottmeyer, Proposition 3.3.3), characteristic zero. -/
theorem linearIndependent_iff_hasseWronskian_ne_zero {K : Type*} [Field K] [CharZero K] {m : ℕ}
    (g : Fin m → K[X]) : LinearIndependent K g ↔ hasseWronskian g ≠ 0 := sorry

section logHeight

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- The relative projective height of a polynomial is the native height of its coefficients. -/
noncomputable def mulHeight (p : K[X]) : ℝ := Finsupp.mulHeight p.coeff

/-- The logarithm of the relative multiplicative coefficient height. -/
noncomputable def logHeight (p : K[X]) : ℝ := Real.log (mulHeight p)

/-- The logarithmic coefficient height agrees with Mathlib's finitely supported height. -/
theorem logHeight_eq_finsupp (p : K[X]) : logHeight p = Finsupp.logHeight p.coeff := by sorry

/-- The coefficient height of a product has the convolution bound at every admissible value. -/
theorem mulHeight_mul_le (f g : K[X]) :
    mulHeight (f * g) ≤ (min f.natDegree g.natDegree + 1 : ℕ) ^ Height.totalWeight K *
      mulHeight f * mulHeight g := by sorry

end logHeight

/-- Unit test `Polynomial.logHeight.test_X_sub_two`: h(X − 2) = log 2 over ℚ. -/
example : TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial.logHeight (_root_.Polynomial.X - _root_.Polynomial.C (2 : ℚ)) = Real.log 2 := sorry
/-- Unit test `Polynomial.logHeight.test_C_seven`: h(7) = 0. -/
example : TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial.logHeight (_root_.Polynomial.C (7 : ℚ)) = 0 := sorry

/-- Gelfond's theorem in one variable (Pottmeyer, Proposition 3.2.12), relative heights over a
number field `K`. -/
theorem logHeight_add_logHeight_le {K : Type*} [Field K] [NumberField K] (f g : K[X])
    (hf : f ≠ 0) (hg : g ≠ 0) :
    TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial.logHeight f + TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial.logHeight g ≤
      TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial.logHeight (f * g) + Module.finrank ℚ K * (f * g).natDegree * Real.log 2 := sorry

/-- Roth's theorem in one variable (Pottmeyer, Lemma 3.4.3). -/
theorem rootMultiplicity_mul_logHeight₁_le {K : Type*} [Field K] [NumberField K] (P : K[X])
    (hP : P ≠ 0) (r : ℕ) (hr : P.natDegree ≤ r) (β : K) :
    (P.rootMultiplicity β : ℝ) * Height.logHeight₁ β ≤
      Polynomial.logHeight P + Module.finrank ℚ K * r * Real.log 2 := sorry

end Polynomial

namespace MvPolynomial

open _root_.MvPolynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial

section hasseDeriv

variable {R σ : Type*} [CommSemiring R]

/-- The divided (Hasse) partial derivative `∂^d`, sending `X^m` to
`(∏ⱼ (mⱼ choose dⱼ)) X^(m - d)` (Pottmeyer, (2.34)). -/
noncomputable def hasseDeriv (d : σ →₀ ℕ) : MvPolynomial σ R →ₗ[R] MvPolynomial σ R :=
  (Finsupp.lsum R fun m : σ →₀ ℕ =>
    (d.prod fun j dj => ((m j).choose dj : R)) •
      (_root_.MvPolynomial.monomial (m - d) : R →ₗ[R] MvPolynomial σ R)).comp
    (AddMonoidAlgebra.coeffLinearEquiv R).toLinearMap

/-- Taylor expansion with divided derivatives (Pottmeyer, (3.35)). -/
theorem eval_add_eq_finsum_hasseDeriv (P : MvPolynomial σ R) (a y : σ → R) :
    _root_.MvPolynomial.eval (a + y) P = ∑ᶠ d : σ →₀ ℕ, _root_.MvPolynomial.eval a (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv d P) * d.prod fun j k => y j ^ k := sorry

end hasseDeriv

/-- Unit test `MvPolynomial.hasseDeriv.test_X0_cube_X1`: ∂^{(2,0)}(x_0^3 x_1) = 3 x_0 x_1 over ℤ. -/
example : TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv (Finsupp.single 0 2) (_root_.MvPolynomial.X 0 ^ 3 * _root_.MvPolynomial.X 1 : MvPolynomial (Fin 2) ℤ) =
    3 * (_root_.MvPolynomial.X 0 * _root_.MvPolynomial.X 1) := sorry
/-- Unit test `MvPolynomial.hasseDeriv.test_one`: ∂^d 1 = 0 for d ≠ 0. -/
example (d : Fin 2 →₀ ℕ) (hd : d ≠ 0) : TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv d (1 : MvPolynomial (Fin 2) ℤ) = 0 := sorry
/-- Unit test `MvPolynomial.hasseDeriv.test_divided_not_ordinary`: ∂^{(2)}(x_0^2) = 1 while
(∂/∂x_0)^2 x_0^2 = 2: the divided derivative is not the ordinary one. -/
example : TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv (Finsupp.single 0 2) (_root_.MvPolynomial.X 0 ^ 2 : MvPolynomial (Fin 1) ℚ) = 1 ∧
    (_root_.MvPolynomial.pderiv 0)^[2] (_root_.MvPolynomial.X 0 ^ 2 : MvPolynomial (Fin 1) ℚ) = 2 := sorry

section weightedIndex

variable {R σ : Type*} [CommRing R]

/-- The index of `P` at the point `a` with respect to the weights `r` (Pottmeyer, Definition
2.6.2): the least value of `∑ⱼ iⱼ / rⱼ` over the `i` with `(∂^i P)(a) ≠ 0`; it is `⊤` at `P = 0`. -/
noncomputable def weightedIndex (r : σ → ℕ) (a : σ → R) (P : MvPolynomial σ R) : ℝ≥0∞ :=
  ⨅ (i : σ →₀ ℕ) (_ : _root_.MvPolynomial.eval a (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv i P) ≠ 0), ∑ j ∈ i.support, ((i j : ℝ≥0∞) / (r j : ℝ≥0∞))

/-- An index lower bound is equivalent to vanishing of all Taylor coefficients of smaller weight. -/
theorem le_weightedIndex_iff (r : σ → ℕ) (a : σ → R) (P : MvPolynomial σ R) (t : ℝ≥0∞) :
    t ≤ weightedIndex r a P ↔
      ∀ i : σ →₀ ℕ, (∑ j ∈ i.support, ((i j : ℝ≥0∞) / (r j : ℝ≥0∞))) < t →
        _root_.MvPolynomial.eval a (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv i P) = 0 := sorry

/-- Additivity of the index (Pottmeyer, Exercise 2.19). -/
theorem weightedIndex_mul [IsDomain R] (r : σ → ℕ) (hr : ∀ j, r j ≠ 0) (a : σ → R)
    (P Q : MvPolynomial σ R) :
    weightedIndex r a (P * Q) = weightedIndex r a P + weightedIndex r a Q := sorry

/-- One variable: the index is the order of vanishing divided by the weight. -/
theorem weightedIndex_toMvPolynomial (r : σ → ℕ) (a : σ → R) (i : σ) {p : Polynomial R}
    (hp : p ≠ 0) :
    weightedIndex r a (p.toMvPolynomial i) = (p.rootMultiplicity (a i) : ℝ≥0∞) / (r i : ℝ≥0∞) :=
  sorry

end weightedIndex

/-- Unit test `MvPolynomial.weightedIndex.test_X0_cube_sub_X1_sq`: Ind_{(0,0),(3,3)}(x_0^3 − x_1^2)
= 2/3 over ℚ. -/
example : weightedIndex ![3, 3] 0 (_root_.MvPolynomial.X 0 ^ 3 - _root_.MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℚ) = 2 / 3 := sorry
/-- Unit test `MvPolynomial.weightedIndex.test_one`: Ind_{a,r}(1) = 0 for all a, r. -/
example (r : Fin 2 → ℕ) (a : Fin 2 → ℚ) : weightedIndex r a (1 : MvPolynomial (Fin 2) ℚ) = 0 :=
  sorry
/-- Unit test `MvPolynomial.weightedIndex.test_X0_X1`: Ind_{(0,0),(1,2)}(x_0 x_1) = 3/2, not the
total order of vanishing 2: the index is weighted. -/
example : weightedIndex ![1, 2] 0 (_root_.MvPolynomial.X 0 * _root_.MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) = 3 / 2 := sorry

section logHeight

variable {σ K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- The relative projective height of a multivariate polynomial is its coefficient height. -/
noncomputable def mulHeight (P : MvPolynomial σ K) : ℝ := Finsupp.mulHeight P.coeff

/-- The logarithm of the relative multiplicative coefficient height. -/
noncomputable def logHeight (P : MvPolynomial σ K) : ℝ := Real.log (mulHeight P)

/-- The logarithmic coefficient height agrees with Mathlib's finitely supported height. -/
theorem logHeight_eq_finsupp (P : MvPolynomial σ K) :
    logHeight P = Finsupp.logHeight P.coeff := by sorry

/-- Heights of products in disjoint sets of variables (Pottmeyer, Exercise 3.3). -/
theorem logHeight_mul_of_disjoint_vars [DecidableEq σ] {P Q : MvPolynomial σ K} (hP : P ≠ 0)
    (hQ : Q ≠ 0) (hPQ : Disjoint P.vars Q.vars) :
    logHeight (P * Q) = logHeight P + logHeight Q := sorry

end logHeight

/-- Unit test `MvPolynomial.logHeight.test_two_X_add_four`: h(2x_0 + 4) = log 2 over ℚ. -/
example : logHeight (2 * _root_.MvPolynomial.X 0 + 4 : MvPolynomial (Fin 1) ℚ) = Real.log 2 := sorry
/-- Unit test `MvPolynomial.logHeight.test_C_five`: h(5) = 0. -/
example : logHeight (_root_.MvPolynomial.C 5 : MvPolynomial (Fin 1) ℚ) = 0 := sorry

section genWronskian

variable {R σ : Type*} [CommRing R]

/-- A generalized Wronskian `W_D(f) = det (∂^{D k} (f l))` (Pottmeyer, Definition 3.3.5); the
admissibility condition `(D k).degree ≤ k` is a hypothesis of the theorems, not of the
definition. -/
noncomputable def genWronskian {m : ℕ} (D : Fin m → σ →₀ ℕ) (f : Fin m → MvPolynomial σ R) :
    MvPolynomial σ R :=
  Matrix.det (Matrix.of fun k l => TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv (D k) (f l))

end genWronskian

/-- Dependence over an integral domain makes every generalized Wronskian vanish,
without a characteristic or row-admissibility assumption. -/
theorem genWronskian_eq_zero_of_not_linearIndependent {R σ : Type*} [CommRing R]
    [IsDomain R] {m : ℕ} (D : Fin m → σ →₀ ℕ) (f : Fin m → MvPolynomial σ R)
    (hf : ¬ LinearIndependent R f) : genWronskian D f = 0 := by sorry

/-- The order-zero generalized Wronskian of a dependent constant can be nonzero over ℤ/4ℤ. -/
example : ¬ LinearIndependent (ZMod 4)
      (fun _ : Fin 1 => (_root_.MvPolynomial.C 2 : MvPolynomial (Fin 1) (ZMod 4))) ∧
    genWronskian (fun _ : Fin 1 => (0 : Fin 1 →₀ ℕ))
      (fun _ : Fin 1 => (_root_.MvPolynomial.C 2 : MvPolynomial (Fin 1) (ZMod 4))) =
        _root_.MvPolynomial.C 2 ∧
    (_root_.MvPolynomial.C 2 : MvPolynomial (Fin 1) (ZMod 4)) ≠ 0 := by sorry

/-- Unit test `MvPolynomial.genWronskian.test_X0_X1`: W_{(0, e_0)}(x_0, x_1) = −x_1. -/
example : genWronskian ![0, Finsupp.single 0 1] ![_root_.MvPolynomial.X 0, _root_.MvPolynomial.X 1] = -(_root_.MvPolynomial.X 1 : MvPolynomial (Fin 2) ℚ) :=
  sorry
/-- Unit test `MvPolynomial.genWronskian.test_empty`: For m = 0 the generalized Wronskian is 1. -/
example (D : Fin 0 → Fin 2 →₀ ℕ) (f : Fin 0 → MvPolynomial (Fin 2) ℚ) : genWronskian D f = 1 :=
  sorry
/-- Unit test `MvPolynomial.genWronskian.test_dependent`: W_D(x_0, x_0) = 0 for every D. -/
example (D : Fin 2 → Fin 2 →₀ ℕ) : genWronskian D ![_root_.MvPolynomial.X 0, _root_.MvPolynomial.X 0] = (0 : MvPolynomial (Fin 2) ℚ) :=
  sorry

/-- The generalized Wronskian criterion (Pottmeyer, Theorem 3.3.7). -/
theorem linearIndependent_iff_exists_genWronskian_ne_zero {K : Type*} [Field K] [CharZero K]
    {n m : ℕ} (f : Fin m → MvPolynomial (Fin n) K) :
    LinearIndependent K f ↔
      ∃ D : Fin m → Fin n →₀ ℕ, (∀ k, (D k).degree ≤ k) ∧ genWronskian D f ≠ 0 := sorry

/-- Separation of one variable (Pottmeyer, Lemma 3.3.8). -/
theorem exists_sum_mul_linearIndependent {K σ : Type*} [Field K] [DecidableEq σ]
    {P : MvPolynomial σ K} (hP : P ≠ 0) (i₀ : σ) :
    ∃ s : ℕ, s ≤ P.degreeOf i₀ ∧ ∃ f g : Fin (s + 1) → MvPolynomial σ K,
      (∀ k, i₀ ∉ (f k).vars) ∧ (∀ k, (g k).vars ⊆ {i₀}) ∧ LinearIndependent K f ∧
        LinearIndependent K g ∧ P = ∑ k, f k * g k := sorry

end MvPolynomial

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

open Polynomial

/-- **Roth's theorem** (Pottmeyer, Theorem 3.4.1), relative heights over a number field `K`. -/
theorem roth_lemma {K : Type*} [Field K] [NumberField K] {n : ℕ} (hn : 0 < n)
    (P : MvPolynomial (Fin n) K) (hP : P ≠ 0) (β : Fin n → K) (σ : ℝ) (hσ₀ : 0 < σ)
    (hσ : σ ≤ 1 / 2) (r : Fin n → ℕ) (hr : ∀ i, 0 < r i)
    (h₁ : ∀ i, P.degreeOf i ≤ r i)
    (h₂ : ∀ i j : Fin n, (j : ℕ) = i + 1 → (r j : ℝ) ≤ σ * r i)
    (h₃ : ∀ i, σ⁻¹ * (MvPolynomial.logHeight P + 4 * n * r ⟨0, hn⟩ * Module.finrank ℚ K) ≤
      r i * Height.logHeight₁ (β i)) :
    MvPolynomial.weightedIndex r β P ≤ ENNReal.ofReal (2 * n * σ ^ ((1 : ℝ) / 2 ^ (n - 1))) :=
  sorry

/-- **Liouville's inequality** with the explicit constant `2^(1-d) M(α)⁻¹` (Evertse,
Theorem 6.1); `f` is the primitive minimal polynomial of `α`, so `M(f) = M(α)`. -/
theorem liouville_explicit (f : ℤ[X]) (hprim : f.IsPrimitive) (hirr : Irreducible f)
    (hlead : 0 < f.leadingCoeff) (α : ℂ) (hα : aeval α f = 0) (ξ : ℚ) (hξ : (ξ : ℂ) ≠ α) :
    (2 : ℝ) ^ (1 - (f.natDegree : ℤ)) * ((f.map (Int.castRingHom ℂ)).mahlerMeasure)⁻¹ *
        Height.mulHeight₁ ξ ^ (-(f.natDegree : ℤ)) ≤ ‖(ξ : ℂ) - α‖ := sorry

/-- Evertse, Lemma 6.10: Thue's auxiliary polynomials. The constant can be taken to be
`C₁ = (48 b max(1, house α))^(d (1 + 1/ε))`, `b` a denominator of `α`. -/
theorem exists_thue_auxiliary_polynomials (α : ℂ) (hα : IsAlgebraic ℚ α) (ε : ℝ) (hε₀ : 0 < ε)
    (hε : ε < 1 / 2) :
    ∃ C₁ : ℝ, 0 < C₁ ∧ ∀ r : ℕ, 0 < r → ∃ P Q : ℤ[X], (P ≠ 0 ∨ Q ≠ 0) ∧
      (P.natDegree : ℝ) ≤ ⌊(1 / 2 + ε) * (minpoly ℚ α).natDegree * r⌋₊ ∧
      (Q.natDegree : ℝ) ≤ ⌊(1 / 2 + ε) * (minpoly ℚ α).natDegree * r⌋₊ ∧
      (X - C α) ^ r ∣ P.map (Int.castRingHom ℂ) - C α * Q.map (Int.castRingHom ℂ) ∧
      l1Norm P ≤ C₁ ^ r ∧ l1Norm Q ≤ C₁ ^ r := sorry

/-- Evertse, Theorem 6.14: an effective gap principle for the solutions of `|ξ - α| ≤ H(ξ)^(-κ)`,
for `κ > d/2 + 1`. -/
theorem thue_gap_principle (α : ℂ) (hα : IsAlgebraic ℚ α) (hd : 2 ≤ (minpoly ℚ α).natDegree)
    (κ : ℝ) (hκ : (minpoly ℚ α).natDegree / 2 + 1 < κ) :
    ∃ C lam : ℝ, 1 ≤ C ∧ 1 ≤ lam ∧ ∀ ξ₁ ξ : ℚ,
      ‖(ξ₁ : ℂ) - α‖ ≤ Height.mulHeight₁ ξ₁ ^ (-κ) → C ≤ Height.mulHeight₁ ξ₁ →
      ‖(ξ : ℂ) - α‖ ≤ Height.mulHeight₁ ξ ^ (-κ) → ξ ≠ ξ₁ →
      Height.mulHeight₁ ξ ≤ Height.mulHeight₁ ξ₁ ^ lam := sorry

/-- **Thue's approximation theorem** (Evertse, Theorem 6.9). -/
theorem thue_approximation (α : ℝ) (hα : IsAlgebraic ℚ α) (hd : 3 ≤ (minpoly ℚ α).natDegree)
    (κ : ℝ) (hκ : (minpoly ℚ α).natDegree / 2 + 1 < κ) :
    {ξ : ℚ | |(ξ : ℝ) - α| ≤ Height.mulHeight₁ ξ ^ (-κ)}.Finite := sorry

/-- Roth's auxiliary polynomial (Pottmeyer, Theorem 2.6.5, with Siegel's theorem in Evertse's form):
`C` depends only on `α` (one may take `C = 12 b max(1, house α)`, `b` a denominator of `α`). -/
theorem exists_roth_auxiliary_polynomial (α : ℝ) (hα : IsAlgebraic ℚ α) (ε : ℝ) (hε₀ : 0 < ε)
    (hε : ε < 1) (n : ℕ) (hn : 2 * ((minpoly ℚ α).natDegree : ℝ) ≤ Real.exp (ε ^ 2 * n / 4)) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ r : Fin n → ℕ, (∀ i, 0 < r i) →
      ∃ P : MvPolynomial (Fin n) ℤ, P ≠ 0 ∧ (∀ i, P.degreeOf i ≤ r i) ∧
        ENNReal.ofReal (n / 2 * (1 - ε)) ≤
          MvPolynomial.weightedIndex r (fun _ => α) (P.map (Int.castRingHom ℝ)) ∧
        ∀ m, (|P.coeff m| : ℝ) ≤ C ^ (∑ i, r i) := sorry

/-- **Roth's theorem** (Roth 1955): for a real algebraic irrational `α` and `κ > 2`, only finitely
many rationals satisfy `|α - ξ| ≤ H(ξ)^(-κ)`. The proof gives no way to list them. -/
theorem roth (α : ℝ) (hα : IsAlgebraic ℚ α) (hirr : Irrational α) (κ : ℝ) (hκ : 2 < κ) :
    {ξ : ℚ | |(ξ : ℝ) - α| ≤ Height.mulHeight₁ ξ ^ (-κ)}.Finite := sorry

/-- Roth's theorem in the form of Evertse, Theorem 6.2. -/
theorem roth_lower_bound (α : ℝ) (hα : IsAlgebraic ℚ α) (hirr : Irrational α) (κ : ℝ)
    (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ ξ : ℚ, c * Height.mulHeight₁ ξ ^ (-κ) ≤ |(ξ : ℝ) - α| := sorry

/-- Roth's lower bound for every algebraic number (Evertse, remarks after Theorem 6.2). -/
theorem roth_lower_bound_of_isAlgebraic (α : ℂ) (hα : IsAlgebraic ℚ α) (κ : ℝ) (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ ξ : ℚ, (ξ : ℂ) ≠ α → c * Height.mulHeight₁ ξ ^ (-κ) ≤ ‖(ξ : ℂ) - α‖ :=
  sorry

/-- Roth's theorem in Mathlib's vocabulary: a real algebraic number is not `LiouvilleWith p`
for any `p > 2`. -/
theorem not_liouvilleWith_of_isAlgebraic (α : ℝ) (hα : IsAlgebraic ℚ α) {p : ℝ} (hp : 2 < p) :
    ¬ LiouvilleWith p α := sorry

/-- Evertse, Exercise 6.5: `∑ₖ b^(-3^k)` is transcendental. -/
theorem transcendental_tsum_inv_pow_three_pow (b : ℕ) (hb : 2 ≤ b) :
    Transcendental ℚ (∑' k : ℕ, ((b : ℝ)⁻¹) ^ (3 ^ (k + 1))) := sorry

/-- Evertse, Theorem 6.3. -/
theorem binary_form_lower_bound (F : MvPolynomial (Fin 2) ℤ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hd : 3 ≤ d)
    (hsq : ∀ a b : ℂ, (a, b) ≠ (0, 0) →
      ¬ (MvPolynomial.C a * MvPolynomial.X 0 + MvPolynomial.C b * MvPolynomial.X 1) ^ 2 ∣
        MvPolynomial.map (Int.castRingHom ℂ) F)
    (κ : ℝ) (hκ : 2 < κ) :
    ∃ c : ℝ, 0 < c ∧ ∀ x y : ℤ, MvPolynomial.eval ![x, y] F ≠ 0 →
      c * max |(x : ℝ)| |(y : ℝ)| ^ ((d : ℝ) - κ) ≤ |(MvPolynomial.eval ![x, y] F : ℝ)| := sorry

/-- **Thue's theorem on Thue equations** (Evertse, Corollary 6.4); ineffective. -/
theorem thue_equation_finite (F : MvPolynomial (Fin 2) ℤ) (d : ℕ) (hF : F.IsHomogeneous d)
    (hroots : 3 ≤
      ((MvPolynomial.aeval ![Polynomial.X, 1] F : ℤ[X]).map (Int.castRingHom ℂ)).roots.toFinset.card)
    (m : ℤ) (hm : m ≠ 0) :
    {p : ℤ × ℤ | MvPolynomial.eval ![p.1, p.2] F = m}.Finite := sorry

end DiophantineApproximation

namespace MvPolynomial

open _root_.MvPolynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial
section BlockLinearJets

variable {R : Type*} [CommSemiring R] {m N r : ℕ}
variable (A : Fin m → Fin N → Fin r → R)
local notation "ℒ" => (fun p : Fin m × Fin N =>
  (∑ a : Fin r, _root_.MvPolynomial.C (A (Prod.fst p) (Prod.snd p) a) * _root_.MvPolynomial.X (Prod.fst p, a) :
    MvPolynomial (Fin m × Fin r) R))

/-- Layer 1 nonzero block linear jet extraction. -/
theorem exists_nonzero_hasseDeriv_of_blockLinear
    (F : MvPolynomial (Fin m × Fin N) R)
    (i : Fin m × Fin N →₀ ℕ) (k : Fin m × Fin r →₀ ℕ)
    (y : Fin m × Fin r → R)
    (hn : _root_.MvPolynomial.eval y (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv k (_root_.MvPolynomial.eval₂ _root_.MvPolynomial.C ℒ (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv i F))) ≠ 0) :
    ∃ e : Fin m × Fin N →₀ ℕ,
      (∀ h, ∑ l : Fin N, e (h, l) = ∑ a : Fin r, k (h, a)) ∧
      _root_.MvPolynomial.eval (fun p => ∑ a : Fin r, A p.1 p.2 a * y (p.1, a))
        (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv (i + e) F) ≠ 0 := by sorry

end BlockLinearJets

end MvPolynomial

namespace MvPolynomial

open _root_.MvPolynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial

/-- MvPolynomial.test_linear_support_wrong_degree -/
example : ((_root_.MvPolynomial.X (0 : Fin 2) + _root_.MvPolynomial.X 1)^2 : MvPolynomial (Fin 2) ℚ).coeff
    (Finsupp.single 0 1) = 0 := by sorry

end MvPolynomial

/-! ## Layer 2: subspace theorems and multiplicative groups -/

open NumberField Matrix

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

section GeneralPosition

variable {F : Type*} [Field F] {ι : Type*} {n : ℕ}

/-- A family of linear forms (coefficient vectors) is in general position if every
`n`-element subfamily is linearly independent. -/
def InGeneralPosition (L : ι → Fin n → F) : Prop :=
  ∀ s : Finset ι, s.card = n → LinearIndependent F (fun i : s ↦ L i)

/-- InGeneralPosition L ↔ for every injective e : Fin n → ι, det (fun k j ↦ L (e k) j) ≠ 0. -/
theorem inGeneralPosition_iff_det_ne_zero (L : ι → Fin n → F) :
    InGeneralPosition L ↔
      ∀ e : Fin n → ι, Function.Injective e → (Matrix.of fun k j ↦ L (e k) j).det ≠ 0 := by
  sorry

/-- The forms `X_1, …, X_n, X_1 + ⋯ + X_n`. -/
theorem inGeneralPosition_coords_add_sum :
    InGeneralPosition (fun i : Option (Fin n) ↦
      (i.elim (fun _ ↦ (1 : F)) (fun k ↦ Pi.single k 1) : Fin n → F)) := by
  sorry

/-- The forms X,Y,X+Y are in general position over ℚ. -/
example : InGeneralPosition (F := ℚ) ![![1, 0], ![0, 1], ![1, 1]] := by sorry

/-- Repeating X among X,Y,X destroys general position. -/
example : ¬ InGeneralPosition (F := ℚ) ![![1, 0], ![0, 1], ![1, 0]] := by sorry

/-- The forms X,Y,X+Y in three coordinates are dependent, although a fourth form supplies the missing coordinate. -/
example : ¬ InGeneralPosition (F := ℚ) ![![1, 0, 0], ![0, 1, 0], ![1, 1, 0], ![0, 0, 1]] := by
  sorry

/-- The three quadratic-irrational forms are independent. -/
example : InGeneralPosition (F := ℝ)
    ![![1, √2, √3], ![1, -√2, √3], ![1, -√2, -√3]] := by
  sorry

/-- Swapping the last two rows reverses the determinant sign. -/
example : (!![1, Real.sqrt 2, Real.sqrt 3; 1, -Real.sqrt 2, -Real.sqrt 3;
    1, -Real.sqrt 2, Real.sqrt 3] : Matrix (Fin 3) (Fin 3) ℝ).det =
    -4 * Real.sqrt 6 := sorry

end GeneralPosition

/-- `Layer 2 absolute value extension exists`, part (a). -/
theorem exists_absoluteValue_eq_padicNorm (K : Type*) [Field K] [NumberField K]
    (p : ℕ) [Fact p.Prime] : ∃ v : AbsoluteValue K ℝ, ∀ q : ℚ, v (q : K) = padicNorm p q := by
  sorry

/-- `Layer 2 absolute value extension exists`, part (b). -/
theorem exists_absoluteValue_eq_abs (K : Type*) [Field K] [NumberField K] :
    ∃ v : AbsoluteValue K ℝ, ∀ q : ℚ, v (q : K) = |(q : ℝ)| := by
  sorry

/-- `Layer 2 absolute value extends to algebraic closure`, non-archimedean case. -/
theorem exists_ringHom_padicAlgCl_of_eq_padicNorm (K : Type*) [Field K] [NumberField K]
    (p : ℕ) [Fact p.Prime] (v : AbsoluteValue K ℝ) (hv : ∀ q : ℚ, v (q : K) = padicNorm p q) :
    ∃ τ : AlgebraicClosure K →+* PadicAlgCl p,
      ∀ x : K, v x = ‖τ (algebraMap K (AlgebraicClosure K) x)‖ := by
  sorry

/-- `Layer 2 absolute value extends to algebraic closure`, archimedean case. -/
theorem exists_ringHom_complex_of_eq_abs (K : Type*) [Field K] [NumberField K]
    (v : AbsoluteValue K ℝ) (hv : ∀ q : ℚ, v (q : K) = |(q : ℝ)|) :
    ∃ τ : AlgebraicClosure K →+* ℂ, ∀ x : K, v x = ‖τ (algebraMap K (AlgebraicClosure K) x)‖ := by
  sorry

/-- `Layer 2 subspace theorem and its exceptional subspaces` (Schmidt; Evertse Theorem 7.1). -/
theorem subspace_theorem {n : ℕ} (hn : 2 ≤ n) (L : Fin n → Fin n → ℂ)
    (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : LinearIndependent ℂ L) {C δ : ℝ}
    (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- `Layer 2 subspace theorem general position` (Evertse Theorem 7.4). -/
theorem subspace_theorem_general_position {n r : ℕ} (hn : 2 ≤ n) (hr : n ≤ r)
    (L : Fin r → Fin n → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : InGeneralPosition L)
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ ((r : ℝ) - n - δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

section PAdic

variable {K : Type*} [Field K] [NumberField K]

/-- `Layer 2 p adic subspace theorem` (Schlickewei; Evertse Theorem 8.7). The index `none`
stands for the infinite place, `some p` for the prime `p ∈ S`; `v` are the chosen
extensions (notation (8.4)). -/
theorem padic_subspace_theorem {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime)
    (v : Option S → AbsoluteValue K ℝ) (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (L : Option S → Fin n → Fin n → K) (hL : ∀ p, LinearIndependent K (L p))
    {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ,
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ (-ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- `Layer 2 p adic subspace theorem general position` (Evertse Theorem 8.8). -/
theorem padic_subspace_theorem_general_position {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (v : Option S → AbsoluteValue K ℝ)
    (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (r : Option S → ℕ) (hr : ∀ p, n ≤ r p) (L : (p : Option S) → Fin (r p) → Fin n → K)
    (hL : ∀ p, InGeneralPosition (L p)) {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, Finset.univ.gcd x = 1 →
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ ((r none : ℝ) - n - ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

end PAdic

/-- `Layer 2 vojta effective exceptional subspaces` (Evertse Theorem 7.14); the effectivity of
the subspaces is not expressible here and is omitted. -/
theorem exists_exceptional_subspaces_general_position {n r : ℕ} (hn : 2 ≤ n) (hr : n ≤ r)
    (L : Fin r → Fin n → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : InGeneralPosition L) :
    ∃ U : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ U, V ≠ ⊤) ∧
      ∀ C δ : ℝ, 0 < C → 0 < δ →
        {x : Fin n → ℤ | ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ ((r : ℝ) - n - δ) ∧
          ∀ V ∈ U, (fun j ↦ (x j : ℚ)) ∉ V}.Finite := by
  sorry

/-- `Layer 2 two form strict inequality finite` (Evertse Lemma 7.3). -/
theorem finite_two_forms_strict (L : Fin 2 → Fin 2 → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j))
    (hL : LinearIndependent ℂ L) {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    {x : Fin 2 → ℤ | 0 < ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ∧
      ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ)}.Finite := by
  sorry

/-- `Layer 2 roth from subspace theorem` (Evertse Corollary 7.2). -/
theorem roth_of_subspace_theorem (α : ℂ) (hα : IsAlgebraic ℚ α) {C κ : ℝ} (hC : 0 < C)
    (hκ : 2 < κ) : {ξ : ℚ | ‖(ξ : ℂ) - α‖ ≤ C * Height.mulHeight₁ ξ ^ (-κ)}.Finite := by
  sorry

/-- `Layer 2 linear form dirichlet exponent` (Evertse Lemma 7.6). -/
theorem exists_infinite_small_linear_form {n : ℕ} (hn : 2 ≤ n) (α : Fin n → ℝ)
    (hα : LinearIndependent ℚ α) :
    ∃ C > 0, {x : Fin n → ℤ | |∑ i, α i * x i| ≤ C * ‖x‖ ^ (1 - (n : ℝ))}.Infinite := by
  sorry

/-- `Layer 2 single linear form inequality finite` (Evertse Theorem 7.7). -/
theorem finite_small_linear_form {n : ℕ} (α : Fin n → ℂ) (hα : ∀ i, IsAlgebraic ℚ (α i))
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    {x : Fin n → ℤ | 0 < ‖∑ i, α i * x i‖ ∧
      ‖∑ i, α i * x i‖ ≤ C * ‖x‖ ^ (1 - (n : ℝ) - δ)}.Finite := by
  sorry

/-- `Layer 2 approximation by algebraic numbers of bounded degree` (Evertse Theorem 7.8), in the
equivalent form counting the primitive minimal polynomials `F` (the height of a root of `F` is
the maximum of the absolute values of the coefficients of `F`). -/
theorem finite_approximation_bounded_degree (α : ℂ) (hα : IsAlgebraic ℚ α) (d : ℕ)
    {C κ : ℝ} (hC : 0 < C) (hκ : (d : ℝ) + 1 < κ) :
    {F : Polynomial ℤ | F.IsPrimitive ∧ Irreducible F ∧ 0 < F.leadingCoeff ∧ F.natDegree ≤ d ∧
      ∃ ξ : ℂ, Polynomial.aeval ξ F = 0 ∧
        ‖ξ - α‖ ≤ C * ((F.support.sup fun i ↦ (F.coeff i).natAbs : ℕ) : ℝ) ^ (-κ)}.Finite := by
  sorry

section NormForm

variable {K : Type*} [Field K] [NumberField K]

/-- `Layer 2 norm form linear factors general position` (Evertse Lemma 7.11). -/
theorem inGeneralPosition_normFormFactors (θ : K) (hθ : IntermediateField.adjoin ℚ {θ} = ⊤)
    [Fact (((minpoly ℚ θ).map (algebraMap ℚ ℂ)).Splits)]
    (hS : Function.Surjective (Polynomial.Gal.galActionHom (minpoly ℚ θ) ℂ)) {n : ℕ}
    (α : Fin n → K) (hα : LinearIndependent ℚ α) :
    InGeneralPosition (fun σ : K →+* ℂ ↦ fun j ↦ σ (α j)) := by
  sorry

/-- `Layer 2 norm form equation finite full symmetric group` (Evertse Theorem 7.9). -/
theorem finite_normForm_of_symmetric (θ : K) (hθ : IntermediateField.adjoin ℚ {θ} = ⊤)
    [Fact (((minpoly ℚ θ).map (algebraMap ℚ ℂ)).Splits)]
    (hS : Function.Surjective (Polynomial.Gal.galActionHom (minpoly ℚ θ) ℂ)) {n : ℕ}
    (hn : n < Module.finrank ℚ K) (α : Fin n → K) (hα : LinearIndependent ℚ α) (c : ℚ) :
    {x : Fin n → ℤ | Algebra.norm ℚ (∑ i, (x i : K) * α i) = c}.Finite := by
  sorry

/-- `Layer 2 degenerate module norm form infinitely many solutions` (Evertse 7.13, (ii) ⇒ (i)). -/
theorem infinite_normForm_of_containsScaledOrder {n : ℕ} (α : Fin n → K)
    (hα : LinearIndependent ℚ α) (μ : K) (hμ : μ ≠ 0) (L : IntermediateField ℚ K)
    (hL : L ≠ ⊥) (hLq : ¬ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L))
    (hM : ∀ y : 𝓞 L, μ * ((y : L) : K) ∈ Submodule.span ℤ (Set.range α)) :
    {ξ : K | ξ ∈ Submodule.span ℤ (Set.range α) ∧
      Algebra.norm ℚ ξ = Algebra.norm ℚ μ}.Infinite := by
  sorry

/-- `Layer 2 schmidt norm form theorem` (Schmidt 1972; Evertse 7.13, (i) ⇒ (ii)). -/
theorem schmidt_normForm {n : ℕ} (α : Fin n → K) (hα : LinearIndependent ℚ α)
    (h : ¬ ∃ μ : K, μ ≠ 0 ∧ ∃ L : IntermediateField ℚ K, L ≠ ⊥ ∧
      ¬ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L) ∧
        ∀ y : 𝓞 L, μ * ((y : L) : K) ∈ Submodule.span ℤ (Set.range α))
    (c : ℚ) (hc : c ≠ 0) :
    {ξ : K | ξ ∈ Submodule.span ℤ (Set.range α) ∧ Algebra.norm ℚ ξ = c}.Finite := by
  sorry

end NormForm

/-- `Layer 2 thue mahler finiteness` (Mahler; Evertse Theorem 8.10). -/
theorem finite_thueMahler (F : MvPolynomial (Fin 2) ℤ) {n : ℕ} (hn : 3 ≤ n)
    (hF : F.IsHomogeneous n) (hsq : Squarefree (MvPolynomial.map (Int.castRingHom ℚ) F))
    (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    {xz : (ℤ × ℤ) × (S → ℤ) | IsCoprime xz.1.1 xz.1.2 ∧
      ((|MvPolynomial.eval ![xz.1.1, xz.1.2] F| : ℤ) : ℚ) =
        ∏ p : S, ((p : ℕ) : ℚ) ^ xz.2 p}.Finite := by
  sorry

/-- `Layer 2 two term unit equation over rationals` (Lang; Evertse Theorem 8.12 for `Γ ⊂ ℚ^*`). -/
theorem finite_two_term_unit_equation_rat (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0)
    (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    {xy : Γ × Γ | a * ((xy.1 : ℚˣ) : ℚ) + b * ((xy.2 : ℚˣ) : ℚ) = 1}.Finite := by
  sorry

section Nondegenerate

variable {K : Type*} [Field K] {ι : Type*} [Fintype ι]

/-- `Layer 2 nondegenerate solution`: `Σ αᵢ xᵢ = 1` with no vanishing non-empty subsum. -/
def IsNondegenerateSolution (α x : ι → K) : Prop :=
  ∑ i, α i * x i = 1 ∧ ∀ I : Finset ι, I.Nonempty → ∑ i ∈ I, α i * x i ≠ 0

/-- The two terms 1/2 and 1/2 give a nondegenerate sum one. -/
example : IsNondegenerateSolution (K := ℚ) ![1, 1] ![1 / 2, 1 / 2] := by
  sorry

/-- The sum 2−2+1=1 has a vanishing nonempty subsum. -/
example : ¬ IsNondegenerateSolution (K := ℚ) ![1, -1, 1] ![2, 2, 1] := by
  sorry

/-- `Layer 2 nondegenerate homogeneous solution`: `Σ αᵢ xᵢ = 0` with no vanishing proper
non-empty subsum. -/
def IsNondegenerateHomogeneousSolution (α x : ι → K) : Prop :=
  ∑ i, α i * x i = 0 ∧
    ∀ I : Finset ι, I.Nonempty → I ≠ Finset.univ → ∑ i ∈ I, α i * x i ≠ 0

/-- The relation 1+1−2=0 has no vanishing proper nonempty subsum. -/
example : IsNondegenerateHomogeneousSolution (K := ℚ) ![1, 1, -1] ![1, 1, 2] := by
  sorry

/-- The relation 1−1+1−1=0 has a vanishing proper subsum. -/
example : ¬ IsNondegenerateHomogeneousSolution (K := ℚ) ![1, -1, 1, -1] ![1, 1, 1, 1] := by
  sorry

/-- Two homogeneous unit terms can give infinitely many solutions on their entire
solution line; a covering by proper subspaces of that line requires at least three terms. -/
example : {x : Fin 2 → ℚ | (∃ k : ℤ, x = ![(2 : ℚ) ^ k, (2 : ℚ) ^ k]) ∧
    IsNondegenerateHomogeneousSolution ![1, -1] x}.Infinite := sorry

end Nondegenerate

/-- `Layer 2 nondegenerate solutions have finitely many ratios` (Evertse Theorem 8.14). -/
theorem exists_ratio_set_of_nondegenerate {n : ℕ} (hn : 1 ≤ n) (α : Fin (n + 1) → ℚ)
    (hα : ∀ i, α i ≠ 0) (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    ∃ U : Finset ℚ, ∀ x : Fin (n + 1) → Γ,
      IsNondegenerateHomogeneousSolution α (fun i ↦ ((x i : ℚˣ) : ℚ)) →
        ∀ i j, ((x i : ℚˣ) : ℚ) / ((x j : ℚˣ) : ℚ) ∈ U := by
  sorry

/-- `Layer 2 s unit equation over rationals` (Evertse Theorem 8.13 for `Γ ⊂ ℚ^*`). -/
theorem finite_nondegenerate_solutions_rat {n : ℕ} (α : Fin n → ℚ) (hα : ∀ i, α i ≠ 0)
    (Γ : Subgroup ℚˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | IsNondegenerateSolution α (fun i ↦ ((x i : ℚˣ) : ℚ))}.Finite := by
  sorry

/-- `Layer 2 specialization to algebraic numbers` (Evertse–Schlickewei–Schmidt Lemma 3.1). -/
theorem nonempty_specialization {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    [Algebra (AlgebraicClosure ℚ) K] (U : Finset K) :
    Nonempty (Algebra.adjoin (AlgebraicClosure ℚ) (U : Set K) →ₐ[AlgebraicClosure ℚ]
      AlgebraicClosure ℚ) := by
  sorry

/-- The absolute affine logarithmic height of an algebraic tuple is log H(1,x). -/
def absoluteLogHeightAff {n : ℕ} (x : Fin n → AlgebraicClosure ℚ) : ℝ :=
  Real.log (absoluteProjectiveTupleHeight (Fin.cons 1 x))

/-- Absolute affine tuple height is nonnegative. -/
theorem absoluteLogHeightAff_nonneg {n : ℕ} (x : Fin n → AlgebraicClosure ℚ) :
    0 ≤ absoluteLogHeightAff x := by sorry

/-- A tuple of ones has absolute affine logarithmic height zero. -/
theorem absoluteLogHeightAff_one (n : ℕ) :
    absoluteLogHeightAff (fun _ : Fin n => (1 : AlgebraicClosure ℚ)) = 0 := by sorry

/-- The scalar-sum height adds the absolute logarithmic heights of the coordinates. -/
def scalarSumHeight {n : ℕ} (x : Fin n → AlgebraicClosure ℚ) : ℝ :=
  ∑ i, NumberField.absLogHeight₁ (x i)

/-- Affine tuple height and scalar-sum height differ by at most the dimension factor. -/
theorem scalarSumHeight_affine {n : ℕ} (x : Fin n → AlgebraicClosure ℚ) :
    absoluteLogHeightAff x ≤ scalarSumHeight x ∧
      scalarSumHeight x ≤ n * absoluteLogHeightAff x := by sorry

/-- Over any containing number field the absolute affine height is the relative logarithmic
height of `(1, x)` divided by the degree. -/
theorem absoluteLogHeightAff_eq {K : Type*} [Field K] [NumberField K] {n : ℕ}
    (f : K →+* AlgebraicClosure ℚ) (x : Fin n → K) :
    absoluteLogHeightAff (f ∘ x) =
      Height.logHeight (Fin.cons (1 : K) x : Fin (n + 1) → K) / Module.finrank ℚ K := by sorry

/-- Small nondegenerate hyperplane points have a degree-independent count (ESS02 Proposition 11.1). -/
theorem smallHeightHyperplaneBound {n : ℕ} (hn : 2 ≤ n)
    (b : Fin n → (AlgebraicClosure ℚ)ˣ) (M : Finset (Fin n → (AlgebraicClosure ℚ)ˣ))
    (hM : ∀ w ∈ M,
      IsNondegenerateSolution (fun i => (b i : AlgebraicClosure ℚ))
        (fun i => (w i : AlgebraicClosure ℚ)) ∧
      scalarSumHeight (fun i => (w i : AlgebraicClosure ℚ)) <
        Real.exp (-((4 * n : ℝ) ^ (3 * n)))) :
    (M.card : ℝ) ≤ Real.exp ((4 * n : ℝ) ^ (3 * n)) := by sorry

/-- The affine height of a repeated rational scalar is its absolute scalar height. -/
example (t : ℚ) :
    absoluteLogHeightAff (![t, t] : Fin 2 → AlgebraicClosure ℚ) =
      NumberField.absLogHeight₁ t := by sorry

/-- Rational diagonal perturbations have positive affine height despite projective height one. -/
example (k : ℕ) :
    absoluteLogHeightAff
      (![(1 : AlgebraicClosure ℚ) / (2 ^ k + 1), 1 / (2 ^ k + 1)] :
        Fin 2 → AlgebraicClosure ℚ) = Real.log (2 ^ k + 1) ∧
    absoluteProjectiveTupleHeight
      (![(1 : AlgebraicClosure ℚ) / (2 ^ k + 1), 1 / (2 ^ k + 1)] :
        Fin 2 → AlgebraicClosure ℚ) = 1 := by sorry

/-- Perturbed finite-rank unit solutions admit a uniform proper-subspace cover,
using affine heights and the small-error budget of ESS02 equation (11.19). -/
theorem absolutePerturbedUnitEquation {n : ℕ} (hn : 2 ≤ n)
    (Γ : Subgroup (Fin n → (AlgebraicClosure ℚ)ˣ)) (r : ℕ)
    (hΓ : Module.rank ℤ (Additive Γ) ≤ r) :
    ∃ T : Finset (Submodule (AlgebraicClosure ℚ) (Fin n → AlgebraicClosure ℚ)),
      (T.card : ℝ) ≤ Real.exp ((5 * n : ℝ) ^ (3 * n) * (r + 1)) ∧
      (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x ∈ Γ, ∀ z : Fin n → (AlgebraicClosure ℚ)ˣ,
        absoluteLogHeightAff (fun i => (z i : AlgebraicClosure ℚ)) ≤
          (n : ℝ)⁻¹ * Real.exp (-((5 * n : ℝ) ^ (3 * n))) *
            (1 + absoluteLogHeightAff (fun i => (x i : AlgebraicClosure ℚ))) →
        (∑ i, (x i : AlgebraicClosure ℚ) * (z i : AlgebraicClosure ℚ)) = 1 →
        ∃ V ∈ T, (fun i => (x i : AlgebraicClosure ℚ) * (z i : AlgebraicClosure ℚ)) ∈ V :=
  by sorry

/-- The unperturbed restriction of the uniform finite-rank proper-subspace cover. -/
theorem exists_subspaces_unit_equation_algebraic {n : ℕ} (hn : 2 ≤ n)
    (Γ : Subgroup (Fin n → (AlgebraicClosure ℚ)ˣ)) (r : ℕ)
    (hΓ : Module.rank ℤ (Additive Γ) ≤ r) :
    ∃ T : Finset (Submodule (AlgebraicClosure ℚ) (Fin n → AlgebraicClosure ℚ)),
      (T.card : ℝ) ≤ Real.exp ((5 * n : ℝ) ^ (3 * n) * (r + 1)) ∧ (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x ∈ Γ, ∑ i, ((x i : (AlgebraicClosure ℚ)ˣ) : AlgebraicClosure ℚ) = 1 →
        ∃ V ∈ T, (fun i ↦ ((x i : (AlgebraicClosure ℚ)ˣ) : AlgebraicClosure ℚ)) ∈ V := by
  obtain ⟨T, hcard, hproper, hT⟩ := absolutePerturbedUnitEquation hn Γ r hΓ
  refine ⟨T, hcard, hproper, ?_⟩
  intro x hx hsum
  have hz : absoluteLogHeightAff (fun _ : Fin n => (1 : AlgebraicClosure ℚ)) ≤
      (n : ℝ)⁻¹ * Real.exp (-((5 * n : ℝ) ^ (3 * n))) *
        (1 + absoluteLogHeightAff (fun i => (x i : AlgebraicClosure ℚ))) := by
    rw [absoluteLogHeightAff_one]
    have hh := absoluteLogHeightAff_nonneg (fun i => (x i : AlgebraicClosure ℚ))
    positivity
  simpa only [Units.val_one, mul_one] using
    hT x hx (fun _ => 1) hz (by simpa only [Units.val_one, mul_one] using hsum)

/-- `Layer 2 uniform bound nondegenerate solutions` (Evertse–Schlickewei–Schmidt Theorem 1.1). -/
theorem card_nondegenerate_solutions_le {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (Γ : Subgroup (Fin n → Kˣ)) (r : ℕ) (hΓ : Module.rank ℤ (Additive Γ) ≤ r)
    (a : Fin n → Kˣ) (M : Finset (Fin n → Kˣ))
    (hM : ∀ x ∈ M, x ∈ Γ ∧ IsNondegenerateSolution (fun i ↦ (a i : K)) (fun i ↦ (x i : K))) :
    (M.card : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n) * (r + 1)) := by
  sorry

/-- `Layer 2 s unit equation finiteness` (Evertse Theorem 8.13). -/
theorem finite_nondegenerate_solutions {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (α : Fin n → K) (hα : ∀ i, α i ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | IsNondegenerateSolution α (fun i ↦ ((x i : Kˣ) : K))}.Finite := by
  sorry

/-- `Layer 2 s unit equation finiteness`, the case `n = 2` (Lang; Evertse Theorem 8.12). -/
theorem finite_two_term_unit_equation {K : Type*} [Field K] [CharZero K] (a b : K)
    (ha : a ≠ 0) (hb : b ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {xy : Γ × Γ | a * ((xy.1 : Kˣ) : K) + b * ((xy.2 : Kˣ) : K) = 1}.Finite := by
  sorry

namespace LinearRecurrence

/-- `Layer 2 nondegenerate linear recurrence`. -/
def IsNondegenerate (E : _root_.LinearRecurrence ℂ) : Prop :=
  E.charPoly.coeff 0 ≠ 0 ∧
    ∀ θ ∈ E.charPoly.roots, ∀ θ' ∈ E.charPoly.roots, θ ≠ θ' → ¬ IsOfFinOrder (θ / θ')

end LinearRecurrence

/-- The Fibonacci roots have no root-of-unity quotient. -/
example : LinearRecurrence.IsNondegenerate ⟨2, ![1, 1]⟩ := by sorry

/-- The recurrence with roots ±i is degenerate. -/
example : ¬ LinearRecurrence.IsNondegenerate ⟨2, ![-1, 0]⟩ := by
  sorry

/-- Repeated roots alone do not violate nondegeneracy: the sole distinct root is one. -/
example : LinearRecurrence.IsNondegenerate ⟨2, ![-1, 2]⟩ := by sorry

/-- `Layer 2 skolem mahler lech simple roots` (Evertse Theorem 8.18, simple roots). -/
theorem finite_zeros_simple_exponential_polynomial {m : ℕ} (g θ : Fin m → ℂ) (hg : g ≠ 0)
    (hθ : ∀ i, θ i ≠ 0) (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (θ i / θ j)) :
    {h : ℕ | ∑ i, g i * θ i ^ h = 0}.Finite := by
  sorry

/-- `Layer 2 skolem mahler lech simple roots`, recurrence form. -/
theorem skolem_mahler_lech_simple (E : _root_.LinearRecurrence ℂ)
    (hE : LinearRecurrence.IsNondegenerate E) (hsep : E.charPoly.Separable) (u : ℕ → ℂ)
    (hu : E.IsSolution u) (hu₀ : u ≠ 0) : {h : ℕ | u h = 0}.Finite := by
  sorry

/-- `Layer 2 uniform bound zeros simple recurrence` (Evertse–Schlickewei–Schmidt Theorem 1.2):
the zero set of a simple recurrence of order `n ≥ 3` is a union of at most `exp((6n)^{3n})`
points and arithmetic progressions. -/
theorem zeros_simple_recurrence_eq_union {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hinj : Function.Injective α) :
    ∃ (q₁ q₂ : ℕ) (k : Fin q₁ → ℤ) (b v : Fin q₂ → ℤ), (∀ i, v i ≠ 0) ∧
      ((q₁ + q₂ : ℕ) : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) ∧
      {m : ℤ | ∑ i, a i * α i ^ m = 0} =
        Set.range k ∪ ⋃ i, {m : ℤ | ∃ t : ℤ, m = b i + t * v i} := by
  sorry

/-- `Layer 2 uniform bound zeros simple recurrence`, non-degenerate case. -/
theorem ncard_zeros_simple_recurrence_le {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (α i / α j)) :
    {m : ℤ | ∑ i, a i * α i ^ m = 0}.Finite ∧
      ({m : ℤ | ∑ i, a i * α i ^ m = 0}.ncard : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) := by
  sorry

/-- A recurrence with nonzero constant characteristic coefficient has an exponential-polynomial
closed form, with polynomial degree below each root multiplicity (Evertse §8.4). -/
theorem closedFormRecurrence (E : _root_.LinearRecurrence ℂ)
    (hE : E.charPoly.coeff 0 ≠ 0) (u : ℕ → ℂ) (hu : E.IsSolution u) :
    ∃ P : ℂ → ℂ[X],
      (∀ θ ∈ E.charPoly.roots, (P θ).degree < (E.charPoly.rootMultiplicity θ : WithBot ℕ)) ∧
      ∀ n : ℕ, u n = ∑ θ ∈ E.charPoly.roots.toFinset, (P θ).eval (n : ℂ) * θ ^ n := sorry

/-- Relative matrix height is the tuple height of the entries, rather than of the maximal minors. -/
def matrixMulHeight {K m n : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Finite m] [Finite n] (A : Matrix m n K) : ℝ :=
  Height.mulHeight (fun ij : m × n ↦ A ij.1 ij.2)

/-- Over any admissible field, multiplying matrices with finite outer indices costs the
inner dimension at each archimedean value. -/
theorem matrixMulHeight_mul_le {K m n p : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Finite m] [Fintype n] [Finite p] [Nonempty n] (A : Matrix m n K)
    (B : Matrix n p K) :
    matrixMulHeight (A * B) ≤ (Fintype.card n : ℝ) ^ Height.totalWeight K *
      matrixMulHeight A * matrixMulHeight B := by sorry

section TwistedHeight

variable {K : Type*} [Field K] [NumberField K]

/-- The normalised absolute value `‖x‖_v` of Evertse–Ferretti §1.1. -/
def normAbs (v : Place K) (x : K) : ℝ :=
  normalizedAbsValue v x ^ ((1 : ℝ) / Module.finrank ℚ K)

/-- In degree two, a real place gives the square roots √2 and 2 on the rational scalars 2 and 4. -/
example (w : InfinitePlace K) (hd : Module.finrank ℚ K = 2) (hw : w.mult = 1) :
    normAbs (.inr w) (2 : K) = Real.sqrt 2 ∧ normAbs (.inr w) (4 : K) = 2 := sorry

/-- In degree two, a complex place's multiplicity cancels the degree root on 2 and 4. -/
example (w : InfinitePlace K) (hd : Module.finrank ℚ K = 2) (hw : w.mult = 2) :
    normAbs (.inr w) (2 : K) = 2 ∧ normAbs (.inr w) (4 : K) = 4 := sorry

variable {n : ℕ}

open Classical in
/-- `Layer 2 twisted height`: `H_{L,c,Q}(x) = ∏_v max_i ‖L_i^{(v)}(x)‖_v Q^{-c_{iv}}` on `K^n`,
with `H(0) = 0` (Evertse–Ferretti's convention; the `finprod` would give the junk value `1`). -/
def twistedHeight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (x : Fin n → K) : ℝ :=
  if x = 0 then 0 else ∏ᶠ v, ⨆ i, normAbs v (L v i ⬝ᵥ x) * Q ^ (-(c v i))

/-- The coordinate forms at every place. -/
def coordForms (K : Type*) [Field K] [NumberField K] (n : ℕ) : Place K → Fin n → Fin n → K :=
  fun _ i ↦ Pi.single i 1

/-- If L v i = X_i for all v, i and c = 0 then twistedHeight L 0 Q x = (Height.mulHeight x)^{1/[K:ℚ]}, the absolute multiplicative height. -/
theorem twistedHeight_coords_zero (Q : ℝ) {x : Fin n → K} (hx : x ≠ 0) :
    twistedHeight (coordForms K n) 0 Q x =
      Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) := by
  sorry

/-- Exponents of the unit tests over `ℚ`: `c_∞ = (1/2, -1/2)`, `0` at the primes. -/
def cExample (a : ℝ) : Place ℚ → Fin 2 → ℝ
  | .inr _, i => if i = 0 then a else -a
  | .inl _, _ => 0

/-- At (1,0), weights (1/2,−1/2) give twisted height Q^(−1/2). -/
example {Q : ℝ} (hQ : 1 ≤ Q) :
    twistedHeight (coordForms ℚ 2) (cExample (1 / 2)) Q ![1, 0] = Q ^ (-(1 / 2 : ℝ)) := by
  sorry

/-- At Q=1 the twisted height is independent of all weights. -/
example (L : Place K → Fin n → Fin n → K) (c c' : Place K → Fin n → ℝ) (x : Fin n → K) :
    twistedHeight L c 1 x = twistedHeight L c' 1 x := by
  sorry

/-- `Layer 2 successive infima of twisted height` (the `K`-rational version of Evertse–Ferretti §9). -/
def rationalSuccessiveInfimum (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (i : ℕ) : ℝ :=
  sInf {t : ℝ | 0 ≤ t ∧
    i ≤ Module.finrank K (Submodule.span K {x | twistedHeight L c Q x ≤ t})}

/-- The space `T_i(Q) = ⋂_{t > λ_i(Q)} span {x | H(x) ≤ t}`. -/
def rationalInfimumSpace (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ)
    (i : ℕ) : Submodule K (Fin n → K) :=
  ⨅ (t : ℝ) (_ : rationalSuccessiveInfimum L c Q i < t), Submodule.span K {x | twistedHeight L c Q x ≤ t}

/-- A strict gap at k gives the rational infimum space dimension k. -/
theorem finrank_rationalInfimumSpace_of_lt (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (Q : ℝ) {k : ℕ} (hk : k < n)
    (hlt : rationalSuccessiveInfimum L c Q k < rationalSuccessiveInfimum L c Q (k + 1)) :
    Module.finrank K (rationalInfimumSpace L c Q k) = k := by
  sorry

/-- Every coordinate successive infimum is one. -/
example (Q : ℝ) {i : ℕ} (hi₁ : 1 ≤ i) (hi : i ≤ n) :
    rationalSuccessiveInfimum (coordForms ℚ n) 0 Q i = 1 := by sorry

/-- The zeroth rational successive infimum is zero. -/
example (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (Q : ℝ) :
    rationalSuccessiveInfimum L c Q 0 = 0 := by sorry

/-- Unweighted coordinate thresholds give the zero and whole infimum spaces. -/
example (Q : ℝ) : rationalInfimumSpace (coordForms ℚ 2) 0 Q 0 = ⊥ ∧
    rationalInfimumSpace (coordForms ℚ 2) 0 Q 1 = ⊤ := by sorry

/-- The strict weighted gap selects only the first coordinate line. -/
example {Q : ℝ} (hQ : 1 < Q) :
    rationalInfimumSpace (coordForms ℚ 2) (cExample (1 / 2)) Q 1 =
      ℚ ∙ (![1, 0] : Fin 2 → ℚ) := by sorry

/-- The absolute Euclidean height `H_2` of a `K`-rational vector: Euclidean norms at the infinite
places and max norms at the finite places, with degree-normalized exponents. The zero vector has
value zero. -/
def height2 {ι : Type*} [Fintype ι] (y : ι → K) : ℝ :=
  (∏ w : InfinitePlace K,
      (∑ i, ‖w.embedding (y i)‖ ^ 2) ^ ((w.mult : ℝ) / (2 * Module.finrank ℚ K))) *
    ∏ᶠ v : FinitePlace K, (⨆ i, v (y i)) ^ ((1 : ℝ) / Module.finrank ℚ K)

open Classical in
/-- The relative Euclidean projective height, with the projective value one at zero. -/
def arakelovMulHeight {ι : Type*} [Fintype ι] (y : ι → K) : ℝ :=
  if y = 0 then 1 else height2 y ^ Module.finrank ℚ K

open Classical in
/-- The degree-normalized relative height agrees with the Euclidean height on nonzero tuples;
its value at zero is one. -/
theorem arakelovMulHeight_eq_height2 {ι : Type*} [Fintype ι] (y : ι → K) :
    arakelovMulHeight y ^ ((1 : ℝ) / Module.finrank ℚ K) =
      if y = 0 then 1 else height2 y := by sorry

/-- Relative sup and Euclidean projective heights compare with the field-degree exponent. -/
theorem arakelovMulHeight_sup_comparison {ι : Type*} [Fintype ι] [Nonempty ι] (y : ι → K) :
    Height.mulHeight y ≤ arakelovMulHeight y ∧
      arakelovMulHeight y ≤ (Fintype.card ι : ℝ) ^ ((Module.finrank ℚ K : ℝ) / 2) *
        Height.mulHeight y := by sorry

/-- The relative Euclidean height of a subspace uses the same Plücker coordinates as the sup height. -/
def relativeSubspaceArakelovHeight {ι : Type*} [Fintype ι] [LinearOrder ι]
    (T : Submodule K (ι → K)) : ℝ :=
  arakelovMulHeight (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K))

/-- The absolute sup and Euclidean heights compare on nonzero finite tuples. -/
theorem height2_sup_comparison {ι : Type*} [Fintype ι] (y : ι → K) (hy : y ≠ 0) :
    absoluteProjectiveTupleHeight y ≤ height2 y ∧
      height2 y ≤ Real.sqrt (Fintype.card ι) * absoluteProjectiveTupleHeight y := by sorry

/-- Multiplication by a nonzero number-field scalar preserves Euclidean height. -/
theorem height2_smul {ι : Type*} [Fintype ι] (y : ι → K) {c : K} (hc : c ≠ 0) :
    height2 (c • y) = height2 y := by sorry

/-- The absolute Euclidean height is invariant under number-field extension. -/
theorem height2_baseExtension {E : Type*} [Field E] [NumberField E]
    {ι : Type*} [Fintype ι] (f : K →+* E) (y : ι → K) :
    height2 (f ∘ y) = height2 y := by sorry

/-- The zero convention differs from Mathlib's projective value one at the zero tuple. -/
example : height2 (0 : Fin 2 → ℚ) = 0 ∧ Height.mulHeight (0 : Fin 2 → ℚ) = 1 := by sorry

/-- In a degree-two field the vector (√2,1) has absolute Euclidean height √3. -/
example (a : K) (ha : a ^ 2 = 2) (hK : Module.finrank ℚ K = 2) :
    height2 (![a, 1] : Fin 2 → K) = Real.sqrt 3 := by sorry

/-- Base extension to a degree-four field keeps the absolute Euclidean height √3. -/
example {E : Type*} [Field E] [NumberField E] (f : K →+* E)
    (a : K) (ha : a ^ 2 = 2) (hK : Module.finrank ℚ K = 2)
    (hE : Module.finrank ℚ E = 4) :
    height2 (![f a, 1] : Fin 2 → E) = Real.sqrt 3 := by sorry

/-- The zero vector has Euclidean projective height zero. -/
example : height2 (0 : Fin 2 → ℚ) = 0 := sorry

/-- The vector (1,1) has Euclidean projective height √2. -/
example : height2 (![1, 1] : Fin 2 → ℚ) = √2 := sorry

/-- Scaling (1,1) to (2,2) does not double Euclidean projective height. -/
example : height2 (![2, 2] : Fin 2 → ℚ) = √2 := sorry

/-- Swapping the identity rows reverses the Plücker sign. -/
example : plucker (!![(0 : ℚ), 1; 1, 0]) ⟨Finset.univ, by simp⟩ = -1 := sorry

/-- The absolute Euclidean subspace height is the degree root of the relative Plücker height;
zero and whole subspaces both have height one. -/
def subspaceHeight {ι : Type*} [Fintype ι] [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  relativeSubspaceArakelovHeight T ^ ((Module.finrank ℚ K : ℝ)⁻¹)

/-- The absolute sup height of the minors is the degree root of the relative subspace height. -/
theorem relativeSubspaceHeight_eq_absoluteProjectiveTupleHeight {ι : Type*} [Fintype ι]
    [LinearOrder ι] {p : ℕ} (x : Fin p → ι → K) (hx : LinearIndependent K x) :
    relativeSubspaceHeight (Submodule.span K (Set.range x)) ^ ((Module.finrank ℚ K : ℝ)⁻¹) =
      absoluteProjectiveTupleHeight (plucker x) := by sorry

/-- Sup and Euclidean Plücker heights compare on any finite coordinate type. -/
theorem subspaceHeight_sup_le {ι : Type*} [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → K)
    (hx : LinearIndependent K x) :
    absoluteProjectiveTupleHeight (plucker x) ≤ subspaceHeight (Submodule.span K (Set.range x)) ∧
      subspaceHeight (Submodule.span K (Set.range x)) ≤
        Real.sqrt ((Fintype.card ι).choose p) * absoluteProjectiveTupleHeight (plucker x) := by sorry

/-- EF (6.11): for linearly independent x_1, …, x_p spanning T, subspaceHeight T ≤ ∏_i height2 (x_i). -/
theorem subspaceHeight_le_prod {ι : Type*} [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → K) (hx : LinearIndependent K x) :
    subspaceHeight (Submodule.span K (Set.range x)) ≤ ∏ i, height2 (x i) := by
  sorry

/-- EF (6.13): subspaceHeight T^⊥ = subspaceHeight T, where T^⊥ = {y | ∀ x ∈ T, y ⬝ᵥ x = 0}. -/
theorem subspaceHeight_orthogonal {ι : Type*} [Fintype ι] [LinearOrder ι]
    (T : Submodule K (ι → K)) :
    subspaceHeight (T.orthogonalBilin (dotProductBilin K K)) = subspaceHeight T := by
  sorry

/-- Struppeck–Vaaler (EF (6.12)): subspaceHeight (T₁ ⊓ T₂) · subspaceHeight (T₁ ⊔ T₂) ≤ subspaceHeight T₁ · subspaceHeight T₂. -/
theorem subspaceHeight_inf_mul_sup_le {ι : Type*} [Fintype ι] [LinearOrder ι]
    (T₁ T₂ : Submodule K (ι → K)) :
    subspaceHeight (T₁ ⊓ T₂) * subspaceHeight (T₁ ⊔ T₂) ≤
      subspaceHeight T₁ * subspaceHeight T₂ := by
  sorry

/-- Northcott for subspaces of a fixed finite coordinate space over a number field. -/
theorem finite_subspaceHeight_le {ι : Type*} [Fintype ι] [LinearOrder ι] (B : ℝ) :
    {T : Submodule K (ι → K) | subspaceHeight T ≤ B}.Finite := by
  sorry

/-- For a rational subspace, `H_2(T)` is the Euclidean norm of the wedge of a `ℤ`-basis of
`T ∩ ℤ^n`, i.e. the covolume of that lattice (Evertse–Ferretti §6.1 and Mathlib's lattice carrier). -/
theorem subspaceHeight_rat_eq_covolume {ι : Type*} [Fintype ι] [LinearOrder ι]
    (T : Submodule ℚ (ι → ℚ)) (hT : T ≠ ⊥) (p : ℕ)
    (b : Fin p → ι → ℤ) (hb : ∀ y : ι → ℤ, (fun j ↦ (y j : ℚ)) ∈ T ↔
      ∃ c : Fin p → ℤ, y = ∑ i, c i • b i) (hbi : LinearIndependent ℤ b) :
    subspaceHeight T =
      Real.sqrt (∑ s, ((plucker fun i j ↦ (b i j : ℚ)) s : ℝ) ^ 2) := by
  sorry

/-- Zero and whole subspaces both have height one. -/
example : subspaceHeight (⊥ : Submodule ℚ (Fin 2 → ℚ)) = 1 ∧
    subspaceHeight (⊤ : Submodule ℚ (Fin 2 → ℚ)) = 1 := by sorry

/-- A nonprimitive spanning vector gives the same line height √2. -/
example : subspaceHeight (ℚ ∙ (![2, 2] : Fin 2 → ℚ)) = Real.sqrt 2 := by sorry

/-- `Layer 2 weight and exceptional subspace`: the local weight `w_v(U)`. -/
def localWeight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) (v : Place K)
    (U : Submodule K (Fin n → K)) : ℝ :=
  sInf ((fun s : Finset (Fin n) ↦ ∑ i ∈ s, c v i) ''
    {s | s.card = Module.finrank K U ∧
      LinearIndependent K (fun i : s ↦ (Fintype.linearCombination K (L v i)).domRestrict U)})

/-- Restricting coordinate forms to the second line picks its positive weight. -/
example (v : InfinitePlace ℚ) :
    localWeight (coordForms ℚ 2) (cExample (-1)) (.inr v)
      (ℚ ∙ (![0, 1] : Fin 2 → ℚ)) = 1 := by sorry

/-- The zero subspace uses the empty basis of restrictions. -/
example (v : Place ℚ) :
    localWeight (coordForms ℚ 2) (cExample (-1)) v ⊥ = 0 := by sorry

/-- The weight `w(U) = Σ_v w_v(U)`. -/
def weight (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (U : Submodule K (Fin n → K)) : ℝ :=
  ∑ᶠ v, localWeight L c v U

/-- The normalised weight `(w(U) - w(K^n)) / (n - dim U)` maximised by the exceptional
subspace; it is `-µ(K^n, U)` in the notation of Evertse–Ferretti §15 and equals
`w(U) / (n - dim U)` under the normalisation (2.8). -/
def weightRatio (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (U : Submodule K (Fin n → K)) : ℝ :=
  (weight L c U - weight L c ⊤) / ((n : ℝ) - Module.finrank K U)

/-- Equal weights of a line and a plane have different codimension-normalized ratios. -/
example :
    let c : Place ℚ → Fin 3 → ℝ := fun v i =>
      match v with | .inr _ => (i : ℝ) - 1 | .inl _ => 0
    weightRatio (coordForms ℚ 3) c (ℚ ∙ (![0, 0, 1] : Fin 3 → ℚ)) = 1 / 2 ∧
    weightRatio (coordForms ℚ 3) c
      (Submodule.span ℚ {(![0, 1, 0] : Fin 3 → ℚ), ![0, 0, 1]}) = 1 := by sorry

/-- For n≥1, independent local systems and finite support of c, there exists a proper T maximising weightRatio among proper subspaces and of minimal dimension among maximisers. Supermodularity gives uniqueness. These data hypotheses cannot be dropped. -/
theorem exists_exceptionalSubspace [NeZero n] (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hL : ∀ v, LinearIndependent K (L v))
    (hc : {v | c v ≠ 0}.Finite) :
    ∃ T : Submodule K (Fin n → K), T ≠ ⊤ ∧
      (∀ U, U ≠ ⊤ → weightRatio L c U ≤ weightRatio L c T) ∧
      ∀ T', T' ≠ ⊤ → (∀ U, U ≠ ⊤ → weightRatio L c U ≤ weightRatio L c T') →
        Module.finrank K T ≤ Module.finrank K T' := by
  sorry

/-- EF Lemma 15.1: weight (U₁ ⊓ U₂) + weight (U₁ ⊔ U₂) ≥ weight U₁ + weight U₂. -/
theorem weight_inf_add_weight_sup (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hL : ∀ v, LinearIndependent K (L v))
    (hc : {v | c v ≠ 0}.Finite) (U₁ U₂ : Submodule K (Fin n → K)) :
    weight L c U₁ + weight L c U₂ ≤ weight L c (U₁ ⊓ U₂) + weight L c (U₁ ⊔ U₂) := by
  sorry

/-- Exponents `c_∞ = (-1, 1)` over `ℚ`. -/
def cExample' : Place ℚ → Fin 2 → ℝ := cExample (-1)

/-- Weights (−1,1) give weight −1 on (1,1) and +1 on (0,1). -/
example : weight (coordForms ℚ 2) cExample' (ℚ ∙ (![1, 1] : Fin 2 → ℚ)) = -1 ∧
    weight (coordForms ℚ 2) cExample' (ℚ ∙ (![0, 1] : Fin 2 → ℚ)) = 1 := by
  sorry

/-- `Δ_L = ∏_v ‖det(L^{(v)})‖_v`. -/
def deltaL (L : Place K → Fin n → Fin n → K) : ℝ :=
  ∏ᶠ v, normAbs v (Matrix.of fun i j ↦ L v i j).det

/-- Coordinate determinants contribute one at every place. -/
example : deltaL (coordForms ℚ 2) = 1 := by sorry

/-- Scaling the first coordinate form only at infinity gives determinant product two. -/
example : deltaL (fun v : Place ℚ => match v with
    | .inr _ => (![![2, 0], ![0, 1]] : Fin 2 → Fin 2 → ℚ)
    | .inl _ => coordForms ℚ 2 v) = 2 := by sorry

/-- The absolute height of all maximal minors of a finite collection of forms.
Ordered injective selections repeat each unordered minor only up to sign. -/
def formSystemHeight {R : ℕ} (A : Fin R → Fin n → K) : ℝ :=
  absoluteProjectiveTupleHeight (fun f : Fin n ↪ Fin R =>
    Matrix.det (Matrix.of fun i j => A (f i) j))

/-- Enumerating the same collection in another order preserves its determinant-tuple height. -/
theorem formSystemHeight_reindex {R : ℕ} (A : Fin R → Fin n → K)
    (e : Equiv.Perm (Fin R)) : formSystemHeight (A ∘ e) = formSystemHeight A := by sorry

/-- A nonzero maximal minor makes the determinant tuple nonzero and its height at least one. -/
theorem one_le_formSystemHeight {R : ℕ} (A : Fin R → Fin n → K)
    (hA : ∃ f : Fin n ↪ Fin R, Matrix.det (Matrix.of fun i j => A (f i) j) ≠ 0) :
    1 ≤ formSystemHeight A := by sorry

/-- The product of local selected determinants is bounded by the height of the full minor tuple. -/
theorem deltaL_le_formSystemHeight {R : ℕ} (A : Fin R → Fin n → K)
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v, LinearIndependent K (L v))
    (hA : ∀ v i, L v i ∈ Set.range A) : deltaL L ≤ formSystemHeight A := by sorry

/-- Hadamard bounds the height of all minors by the product of augmented row heights. -/
theorem formSystemHeight_augmented_le {R : ℕ} (hn : 1 ≤ n)
    (A : Fin R → Fin n → K) :
    formSystemHeight A ≤ (n : ℝ) ^ ((n : ℝ) / 2) *
      ∏ i, absoluteProjectiveTupleHeight (Fin.cons 1 (A i)) := by sorry

/-- The minor height for X,Y,X+Y is one, while the last Euclidean row height is √2. -/
example : formSystemHeight (![![1, 0], ![0, 1], ![1, 1]] : Fin 3 → Fin 2 → ℚ) = 1 ∧
    height2 (![1, 1] : Fin 2 → ℚ) = Real.sqrt 2 := by sorry

/-- Inserting H_L=1 into the semistable interval threshold gives the corresponding power of two. -/
example (m₂ : ℕ) :
    (2 * formSystemHeight (![![1, 0], ![0, 1], ![1, 1]] : Fin 3 → Fin 2 → ℚ)) ^
      (m₂ ^ (2 * m₂)) = (2 : ℝ) ^ (m₂ ^ (2 * m₂)) := by sorry

/-- Compound forms have coefficients given by minors of exterior degree p. -/
def compoundForms (p : ℕ) (L : Fin n → Fin n → K) :
    {s : Finset (Fin n) // s.card = p} → {s : Finset (Fin n) // s.card = p} → K :=
  fun a b => Matrix.det (Matrix.of fun i j =>
    L (a.1.orderEmbOfFin a.2 i) (b.1.orderEmbOfFin b.2 j))

/-- Compound weights sum over the same exterior index as the compound form. -/
def compoundWeights (p : ℕ) (c : Fin n → ℝ) :
    {s : Finset (Fin n) // s.card = p} → ℝ := fun s => ∑ i ∈ s.1, c i

/-- The coordinates of a wedge of basis vectors are the corresponding minors. -/
def compoundVectors (p : ℕ) (h : Fin n → Fin n → K) := compoundForms p h

/-- Each compound infimum product uses the same lexicographic exterior index. -/
def compoundInfimaProducts (p : ℕ) (lambdas : Fin n → ℝ) :
    {s : Finset (Fin n) // s.card = p} → ℝ := fun s => ∏ i ∈ s.1, lambdas i

/-- The distinguished-place weights replace the largest product by the second largest. -/
def compoundSpecialWeights {N : ℕ} (hN : 2 ≤ N) (ν : Fin N → ℝ)
    (π : Equiv.Perm (Fin N)) (Q : ℝ) (l : Fin N) : ℝ :=
  Real.log ((3 : ℝ) ^ (n ^ 3) *
    (if (π.symm l).val + 1 = N then ν ⟨N - 2, by omega⟩ else ν (π.symm l))) / Real.log Q

/-- A residual exponent has the block degree remaining after a specified derivative order. -/
def residualBlockExponents {m N : ℕ} (r : Fin m → ℕ) (i : Fin m × Fin N →₀ ℕ) :
    Set (Fin m × Fin N →₀ ℕ) := {j | ∀ h, ∑ l, (i (h, l) + j (h, l)) = r h}

/-- The coefficient after differentiating in the original coordinates and expanding in compound forms. -/
def compoundDerivativeCoeff {m N : ℕ} (A : Place K → Matrix (Fin N) (Fin N) K)
    (F : MvPolynomial (Fin m × Fin N) K) (v : Place K)
    (i j : Fin m × Fin N →₀ ℕ) : K :=
  (MvPolynomial.eval₂ MvPolynomial.C
    (fun p => ∑ l, MvPolynomial.C ((A v)⁻¹ p.2 l) * MvPolynomial.X (p.1, l))
    (MvPolynomial.hasseDeriv i F)).coeff j

open Classical in
/-- The absolute product of coefficient max norms uses the compound expansion,
with value zero when the derivative is zero. -/
def compoundCoefficientProductNorm {m N : ℕ}
    (A : Place K → Matrix (Fin N) (Fin N) K) (r : Fin m → ℕ)
    (F : MvPolynomial (Fin m × Fin N) K) (i : Fin m × Fin N →₀ ℕ) : ℝ :=
  if MvPolynomial.hasseDeriv i F = 0 then 0 else
    ∏ᶠ v, ⨆ j ∈ residualBlockExponents r i,
      normAbs v (compoundDerivativeCoeff A F v i j)

/-- Derivative order one and residual exponent two are distinct for X³. -/
example : MvPolynomial.hasseDeriv (Finsupp.single () 1)
    ((MvPolynomial.X () : MvPolynomial Unit ℚ) ^ 3) = 3 * MvPolynomial.X () ^ 2 := by sorry

/-- At derivative order zero residual exponents still carry the full, possibly nonzero block degree. -/
example : Finsupp.single (0, 0) 3 ∈
    residualBlockExponents (![3] : Fin 1 → ℕ) (0 : Fin 1 × Fin 1 →₀ ℕ) := by sorry

/-- A nonconstant coefficient survives at derivative order zero before the auxiliary constraints are imposed. -/
example (v : Place ℚ) :
    compoundDerivativeCoeff (fun _ : Place ℚ => (1 : Matrix (Fin 1) (Fin 1) ℚ))
      ((MvPolynomial.X (0, 0) : MvPolynomial (Fin 1 × Fin 1) ℚ) ^ 3)
      v 0 (Finsupp.single (0, 0) 3) = 1 := by sorry

/-- The modified special-place weights have a negative sum in the three-coordinate gap regression. -/
example {Q : ℝ} (hQ : (3 : ℝ) ^ 81 ≤ Q) :
    (∑ i : Fin 3, compoundSpecialWeights (n := 3) (by norm_num : 2 ≤ 3)
      ![Q ^ (-(1 / 2 : ℝ)), Q ^ (-(1 / 2 : ℝ)), Q] 1 Q i) ≤ -(1 / 3 : ℝ) := by sorry

/-- The two-fold exterior products preserve the last gap for n=3,k=1. -/
example {Q : ℝ} (hQ : 1 < Q) :
    (Q ^ (-(1 / 2 : ℝ))) / Q = Q ^ (-(3 / 2 : ℝ)) ∧
    Q ^ (-(1 : ℝ)) / Q ^ ((1 / 2 : ℝ)) = Q ^ (-(3 / 2 : ℝ)) ∧
    Q ^ ((1 / 2 : ℝ)) / Q ^ ((1 / 2 : ℝ)) = 1 := by sorry

/-- The conditions (2.4)–(2.9) on `(L, c)`. -/
structure IsTwistedData (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) : Prop where
  two_le : 2 ≤ n
  linearIndependent : ∀ v, LinearIndependent K (L v)
  finite_forms : (Set.range L).Finite
  finite_support : {v | c v ≠ 0}.Finite
  sum_eq_zero : ∀ v, ∑ i, c v i = 0
  sum_max_le_one : ∑ᶠ v, (⨆ i, c v i) ≤ 1

/-- Unweighted coordinate forms satisfy all normalized data conditions. -/
example : IsTwistedData (coordForms ℚ 2) 0 := by sorry

/-- Locally balanced weights of size two fail the global maximum-weight bound. -/
example : ¬ IsTwistedData (coordForms ℚ 2) (cExample 2) := by sorry

open Classical in
/-- A constructed nonzero block polynomial has controlled height and independently indexed
vanishing coefficients. The special weights and inverse-height bounds are outputs of the
compound gap construction and determinant-height bridge (EF13 Proposition 13.6). -/
theorem exists_compound_auxiliary_polynomial {k N m R : ℕ}
    (hk : 1 ≤ k) (hkn : k < n) (hN : 2 ≤ N) (hNm : N = n.choose (n - k))
    (e : Fin N ≃ {s : Finset (Fin n) // s.card = n - k})
    (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ)
    (hLc : IsTwistedData L c) (A₀ : Fin R → Fin n → K)
    (hA₀ : Set.range A₀ = Set.range fun p : Place K × Fin n => L p.1 p.2)
    (v₀ : Place K) (hv₀ : ∃ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K), v₀ = .inl v)
    (hcoord : L v₀ = fun i => Pi.single i 1) (hc₀ : c v₀ = 0)
    (δ ε : ℝ) (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hm : 2 * n * ε ^ (-2 : ℝ) * Real.log (4 * R / ε) ≤ m)
    (r : Fin m → ℕ) (hr : ∀ h, 0 < r h)
    (Q : Fin m → ℝ) (hQ : ∀ h, 1 < Q h)
    (ν : Fin m → Fin N → ℝ) (π : Fin m → Equiv.Perm (Fin N))
    (hν : ∀ h l, 0 < ν h l)
    (hneg : ∀ h, ∑ l, compoundSpecialWeights (n := n) hN (ν h) (π h) (Q h) l ≤ -δ / n)
    (habs : ∀ h l, |compoundSpecialWeights (n := n) hN (ν h) (π h) (Q h) l| ≤ n)
    (hInv : ∀ V : Finset (Place K),
      absoluteProjectiveTupleHeight
        (fun o : Option (V × Fin N × Fin N) => o.elim 1
          (fun p => ((Matrix.of fun a b =>
            compoundForms (n - k) (L p.1.1) (e a) (e b)) : Matrix (Fin N) (Fin N) K)⁻¹
              p.2.1 p.2.2)) ≤ formSystemHeight A₀ ^ (R ^ n)) :
    ∃ F : MvPolynomial (Fin m × Fin N) K, F ≠ 0 ∧
      (∀ u ∈ F.support, ∀ h, ∑ l, u (h, l) = r h) ∧
      height2 (fun u : F.support => F.coeff u) ≤
        |(NumberField.discr K : ℝ)| ^ ((1 : ℝ) / (2 * Module.finrank ℚ K)) *
          ((2 : ℝ) ^ (3 * n) * formSystemHeight A₀ ^ (R ^ n)) ^ (∑ h, r h) ∧
      (∀ i : Fin m × Fin N →₀ ℕ,
        (∑ h, (∑ l, (i (h, l) : ℝ)) / r h) ≤ 2 * m * ε →
        ∀ j ∈ residualBlockExponents r i, ∀ v : Place K,
          ((v ≠ v₀ ∧
            (∑ h, (∑ l, compoundWeights (n - k) (c v) (e l) * j (h, l)) / r h) >
              4 * m * n * ε * (⨆ a, c v a)) ∨
           (v = v₀ ∧
            (∑ h, (∑ l, compoundSpecialWeights (n := n) hN (ν h) (π h) (Q h) l *
              j (h, l)) / r h) > -m * δ / (n * N) + 4 * m * n * ε)) →
          compoundDerivativeCoeff
            (fun v => Matrix.of fun a b => compoundForms (n - k) (L v) (e a) (e b))
            F v i j = 0) ∧
      ∀ i : Fin m × Fin N →₀ ℕ,
        compoundCoefficientProductNorm
          (fun v => Matrix.of fun a b => compoundForms (n - k) (L v) (e a) (e b)) r F i ≤
          |(NumberField.discr K : ℝ)| ^ ((1 : ℝ) / (2 * Module.finrank ℚ K)) *
            ((2 : ℝ) ^ (6 * n) * formSystemHeight A₀ ^ (2 * R ^ n)) ^ (∑ h, r h) := by sorry

/-- `Layer 2 twisted height gap principle` (Evertse–Ferretti Proposition 4.2), `K`-rational. -/
theorem exists_subspace_gap_principle (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ A : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (hA : (n : ℝ) ^ (1 / δ) ≤ A) :
    ∃ T₀ : Submodule K (Fin n → K), T₀ ≠ ⊤ ∧ ∀ Q, A ≤ Q → Q < A ^ (1 + δ / 2) →
      {x | twistedHeight L c Q x ≤ deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ T₀ := by
  sorry

/-- `Layer 2 parametric subspace theorem` (Evertse–Ferretti Theorem 2.1), `K`-rational and
qualitative in `Q_0`. -/
theorem parametric_subspace_theorem (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R) :
    ∃ (Q₀ : ℝ) (T : Finset (Submodule K (Fin n → K))), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 6 * 2 ^ (2 * n) * (n : ℝ) ^ 10 * δ ^ (-3 : ℝ) *
        Real.log (3 * R / δ) * Real.log (Real.log (3 * R) / δ) ∧
      ∀ Q, Q₀ ≤ Q → ∃ V ∈ T,
        {x | twistedHeight L c Q x ≤ deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ V := by
  sorry

/-- `Layer 2 sharp roths theorem` (Evertse 1995), `K`-rational, with absolute heights
`H = height2` (Euclidean at infinite places): `F` has index `< mΘ` at `x`, i.e.
some partial derivative `∂^i F` with `Σ_h (i_{h0} + i_{h1}) / d_h < mΘ` does not vanish at `x`
(dividing by factorials does not affect non-vanishing in characteristic zero). -/
theorem sharp_roths_lemma {m : ℕ} (hm : 2 ≤ m) (d : Fin m → ℕ) (hd : ∀ h, 0 < d h) {Θ : ℝ}
    (hΘ : 0 < Θ) (hΘ1 : Θ ≤ 1)
    (hdd : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ) ^ 2 / Θ ≤ (d h : ℝ) / d h')
    (F : MvPolynomial (Fin m × Fin 2) K) (hF : F ≠ 0)
    (hFh : ∀ μ ∈ F.support, ∀ h, μ (h, 0) + μ (h, 1) = d h) (x : Fin m → Fin 2 → K)
    (hx : ∀ h, x h ≠ 0)
    (hH : ∀ h, (Real.exp (∑ h, (d h : ℝ)) *
        height2 (fun μ : F.support ↦ F.coeff μ)) ^
          ((3 * (m : ℝ) ^ 2 / Θ) ^ m) ≤
        height2 (x h) ^ d h) :
    ∃ i : Fin m × Fin 2 → ℕ, ∑ h, ((i (h, 0) + i (h, 1) : ℕ) : ℝ) / d h < m * Θ ∧
      MvPolynomial.eval (fun p ↦ x p.1 p.2)
        (((Finset.univ : Finset (Fin m × Fin 2)).toList.map fun p ↦
          (MvPolynomial.pderiv p).toLinearMap ^ i p).prod F) ≠ 0 := by
  sorry

/-- Four binary blocks at Θ=1/2 admit degree ratio 64 and demand index below 2;
the elementary four-block bound at separation 1/64 is larger than 2. -/
example : (2 * (4 : ℝ) ^ 2 / (1 / 2) = 64) ∧
    (4 : ℝ) * (1 / 2) = 2 ∧ 2 < 2 * (4 : ℝ) * (1 / 64) ^ ((1 : ℝ) / 8) := by sorry

/-- The fixed-field Siegel lemma in the absolute Euclidean normalization (EF13 Lemma 13.1). -/
theorem exists_ne_zero_height2_le {U V : ℕ} (hUV : U < V) (hU : 0 < U)
    (L : Fin U → Fin V → K) (hL : ∀ i, L i ≠ 0) :
    ∃ x : Fin V → K, x ≠ 0 ∧ (∀ i, L i ⬝ᵥ x = 0) ∧
      height2 x ≤ Real.sqrt V * |(NumberField.discr K : ℝ)| ^ ((1 : ℝ) / (2 * Module.finrank ℚ K)) *
        (∏ i, height2 (L i)) ^ ((1 : ℝ) / (V - U)) := by
  sorry

/-- `Layer 2 nonvanishing on grids` (Evertse–Ferretti Proposition 12.1; Evertse 1996 Lemma 26),
`K`-rational: some divided derivative with small weighted order does not vanish at grid points of
the hyperplanes `T_h` (for any choice of bases of the `T_h`). -/
theorem nonvanishing_on_grids {m N : ℕ} (hm : 2 ≤ m) (hN : 2 ≤ N) {ε : ℝ} (hε : 0 < ε)
    (hε1 : ε ≤ 1) (r : Fin m → ℕ) (hr : ∀ h, 0 < r h)
    (hrr : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ) ^ 2 / ε ≤ (r h : ℝ) / r h')
    (P : MvPolynomial (Fin m × Fin N) K) (hP : P ≠ 0)
    (hPh : ∀ μ ∈ P.support, ∀ h, ∑ l, μ (h, l) = r h)
    (T : Fin m → Submodule K (Fin N → K)) (hT : ∀ h, Module.finrank K (T h) = N - 1)
    (hH : ∀ h, (Real.exp (∑ h, (r h : ℝ)) * height2 (fun μ : P.support ↦ P.coeff μ)) ^
        ((N - 1 : ℝ) * (3 * (m : ℝ) ^ 2 / ε) ^ m) ≤ subspaceHeight (T h) ^ r h)
    (b : (h : Fin m) → Fin (N - 1) → Fin N → K)
    (hb : ∀ h, LinearIndependent K (b h) ∧ Submodule.span K (Set.range (b h)) = T h) :
    ∃ (z : Fin m → Fin (N - 1) → ℤ) (i : Fin m × Fin N → ℕ),
      (∀ h, z h ≠ 0 ∧ ∀ j, ((z h j).natAbs : ℝ) ≤ N / ε) ∧
      ∑ h, (∑ l, (i (h, l) : ℝ)) / r h ≤ 2 * m * ε ∧
      MvPolynomial.eval (fun p ↦ ∑ j, (z p.1 j : K) * b p.1 j p.2)
        (((Finset.univ : Finset (Fin m × Fin N)).toList.map fun p ↦
          (MvPolynomial.pderiv p).toLinearMap ^ i p).prod P) ≠ 0 := by
  sorry

open Classical in
/-- The exponents `c` of Evertse–Ferretti (5.2) attached to a system with exponents `d` on the
set of places `S` (base field `K' = K`, forms over `K`). -/
def systemExponents (S : Finset (Place K)) (d : Place K → Fin n → ℝ) (ε : ℝ) :
    Place K → Fin n → ℝ :=
  fun v i ↦ if v ∈ S then (n / (n + ε)) * (d v i - (1 / n) * ∑ j, d v j) else 0

open Classical in
/-- The forms of Evertse–Ferretti (5.1): `L` on `S`, the coordinates elsewhere. -/
def systemForms (S : Finset (Place K)) (L : Place K → Fin n → Fin n → K) :
    Place K → Fin n → Fin n → K :=
  fun v ↦ if v ∈ S then L v else coordForms K n v

/-- An empty system contributes zero weights and coordinate forms. -/
example (d : Place ℚ → Fin 2 → ℝ) (ε : ℝ)
    (L : Place ℚ → Fin 2 → Fin 2 → ℚ) :
    systemExponents ∅ d ε = 0 ∧ systemForms ∅ L = coordForms ℚ 2 := by sorry

/-- Centering a two-coordinate exponent system fixes its sign and factor. -/
example (v : Place ℚ) :
    systemExponents {v} (fun _ => (![-3, 0] : Fin 2 → ℝ)) 1 v = ![-1, 1] := by sorry

/-- `Layer 2 absolute subspace theorem for systems` (Evertse–Ferretti Theorem 3.1), for forms and
points over `K` (`D = 1`); `H^*` bounds the absolute heights of `(1, α_1, …, α_n)`. -/
theorem subspace_theorem_for_systems [NeZero n] (hn : 2 ≤ n) (S : Finset (Place K))
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v ∈ S, LinearIndependent K (L v))
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0)
    (R : ℕ) (hR : Nat.card (Set.range fun p : S × Fin n ↦ L p.1 p.2) ≤ R) (Hs : ℝ)
    (hHs : ∀ v ∈ S, ∀ i, Height.mulHeight (Fin.cons 1 (L v i) : Fin (n + 1) → K) ^
      ((1 : ℝ) / Module.finrank ℚ K) ≤ Hs) :
    ∃ T : Finset (Submodule K (Fin n → K)), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 9 * 2 ^ (2 * n) * (n : ℝ) ^ 14 * ε ^ (-3 : ℝ) *
        Real.log (3 * R / ε) * Real.log (Real.log (3 * R) / ε) ∧
      ∀ x : Fin n → K, x ≠ 0 →
        max (Hs ^ ((1 : ℝ) / (3 * R))) ((n : ℝ) ^ ((n : ℝ) / ε)) ≤
          Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) →
        (∀ v ∈ S, ∀ i, normAbs v (L v i ⬝ᵥ x) ≤
          (⨆ j, normAbs v (x j)) * normAbs v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
            (Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d v i) →
        ∃ V ∈ T, x ∈ V := by
  sorry

/-- `Layer 2 faltings wustholz interval refinement` (Evertse–Ferretti Theorem 3.3), for forms and
points over `K`. -/
theorem exists_subspace_interval_refinement [NeZero n] (hn : 2 ≤ n) (S : Finset (Place K))
    (L : Place K → Fin n → Fin n → K) (hL : ∀ v ∈ S, LinearIndependent K (L v))
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0) :
    ∃ (T : Submodule K (Fin n → K)) (C₁ : ℝ) (m : ℕ) (Hs : Fin m → ℝ), T ≠ ⊤ ∧
      ∀ x : Fin n → K, x ≠ 0 →
        (∀ v ∈ S, ∀ i, normAbs v (L v i ⬝ᵥ x) ≤
          (⨆ j, normAbs v (x j)) * normAbs v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
            (Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K)) ^ d v i) →
        x ∈ T ∨ Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) < C₁ ∨
          ∃ h, Hs h ≤ Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) ∧
            Height.mulHeight x ^ ((1 : ℝ) / Module.finrank ℚ K) <
              Hs h ^ (3 * n / ε * Real.log (3 * Nat.card (Set.range fun p : S × Fin n ↦ L p.1 p.2))) := by
  sorry

end TwistedHeight

section ScalarRestrictionExtraction

/-- Prefix spans of sufficient dimension provide an independent subfamily whose indices
satisfy the prescribed bounds, without requiring those bounds to be monotone. -/
theorem exists_linearIndependent_comp_of_lt_finrank_span {K V : Type*} [Field K]
    [AddCommGroup V] [Module K V] {n k : ℕ} (u : Fin n → V) (m : Fin k → ℕ)
    (hm : ∀ j : Fin k, j.val < Module.finrank K
      (Submodule.span K (u '' {i : Fin n | i.val ≤ m j}))) :
    ∃ s : Fin k → Fin n, LinearIndependent K (u ∘ s) ∧
      ∀ j : Fin k, (s j).val ≤ m j := by sorry

variable {F K E V W : Type*} [Field F] [Field K] [Field E]
  [Algebra F K] [Algebra F E] [FiniteDimensional F K]
  [AddCommGroup V] [Module F V] [Module K V] [IsScalarTower F K V]
  [AddCommGroup W] [Module F W] [Module E W] [IsScalarTower F E W]

/-- Independent images under a base-field-linear map bound the size of a finite family
by the extension degree times the dimension of its span over the larger field. -/
theorem linearIndependent_card_le_finrank_mul (f : V →ₗ[F] W)
    {ι : Type*} [Finite ι] {u : ι → V} (h : LinearIndependent E (f ∘ u)) :
    Nat.card ι ≤ Module.finrank F K *
      Module.finrank K (Submodule.span K (Set.range u)) := by sorry

/-- From degree times k vectors with independent images, select k independent original
vectors over the extension field, with zero-based index bound degree times j. -/
theorem exists_linearIndependent_comp_finrank_mul (f : V →ₗ[F] W) {k : ℕ}
    {u : Fin (Module.finrank F K * k) → V} (h : LinearIndependent E (f ∘ u)) :
    ∃ s : Fin k → Fin (Module.finrank F K * k), LinearIndependent K (u ∘ s) ∧
      ∀ j : Fin k, (s j).val ≤ Module.finrank F K * j.val := by sorry

end ScalarRestrictionExtraction

end DiophantineApproximation

namespace Polynomial

open _root_.Polynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.Polynomial

/-- Polynomial.test_grid_values_insufficient: a value-only conclusion fails: every point of the B = 1 grid is a root. -/
example : (∀ z ∈ ({-1, 0, 1} : Finset ℤ),
    (_root_.Polynomial.X * (_root_.Polynomial.X - 1) * (_root_.Polynomial.X + 1) : Polynomial ℚ).eval (z : ℚ) = 0) ∧
    (_root_.Polynomial.hasseDeriv 1 (_root_.Polynomial.X * (_root_.Polynomial.X - 1) * (_root_.Polynomial.X + 1) : Polynomial ℚ)).eval 0 = -1 := by
  sorry

/-- Polynomial.test_grid_radius_below_one: for B = 1/2 and X^3 the only point is zero, and a higher jet is necessary. -/
example : (∀ i < 3, (_root_.Polynomial.hasseDeriv i (_root_.Polynomial.X ^ 3 : Polynomial ℚ)).eval 0 = 0) ∧
    (_root_.Polynomial.hasseDeriv 3 (_root_.Polynomial.X ^ 3 : Polynomial ℚ)).eval 0 = 1 ∧
    (3 : ℝ) ≤ 3 / (1 / 2) := by
  sorry

end Polynomial

namespace MvPolynomial

open _root_.MvPolynomial
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial

/-- Layer 2 rectangular integer grid jet: Evertse's Lemma 25 in divided-derivative
form; includes constants and the zero-variable case. -/
theorem exists_rectangular_int_grid_jet {R : Type*}
    [CommRing R] [IsDomain R] [CharZero R] {n : ℕ}
    (P : MvPolynomial (Fin n) R) (hP : P ≠ 0)
    (s : Fin n → ℕ) (hs : ∀ j, P.degreeOf j ≤ s j)
    (B : Fin n → ℝ) (hB : ∀ j, 0 < B j) :
    ∃ (z : Fin n → ℤ) (d : Fin n →₀ ℕ),
      (∀ j, (z j).natAbs ≤ B j) ∧
      (∀ j, (d j : ℝ) ≤ (s j : ℝ) / B j) ∧
      _root_.MvPolynomial.eval (fun j => (z j : R)) (TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.hasseDeriv d P) ≠ 0 := by
  sorry

end MvPolynomial

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

/-- A nonzero block-homogeneous restriction admits a nonzero jet on a bounded
integer grid, with the displayed weighted-order bound (Evertse Lemma 26). -/
theorem exists_nonzero_block_grid_jet_of_restriction {K : Type*} [Field K] [CharZero K]
    {m N : ℕ} (hm : 0 < m) (hN : 2 ≤ N)
    (d : Fin m → ℕ) (hd : ∀ h, 0 < d h) (ε : ℝ) (hε : 0 < ε) (hε1 : ε ≤ 1)
    (F : MvPolynomial (Fin m × Fin N) K)
    (hF : ∀ μ ∈ F.support, ∀ h, ∑ l : Fin N, μ (h, l) = d h)
    (b : Fin m → Fin (N - 1) → Fin N → K)
    (hb : ∀ h, LinearIndependent K (b h))
    (i : Fin m × Fin N →₀ ℕ)
    (hi : (∑ h, (∑ l : Fin N, (i (h, l) : ℝ)) / d h) < m * ε)
    (hn : MvPolynomial.eval₂ MvPolynomial.C
      (fun p : Fin m × Fin N => ∑ a : Fin (N - 1),
        MvPolynomial.C (b p.1 a p.2) * MvPolynomial.X (p.1, a))
      (MvPolynomial.hasseDeriv i F) ≠ 0) :
    ∃ (z : Fin m → Fin (N - 1) → ℤ) (j : Fin m × Fin N →₀ ℕ),
      (∀ h a, ((z h a).natAbs : ℝ) ≤ N / ε) ∧
      (∀ h, (fun l => ∑ a, (z h a : K) * b h a l) ≠ 0) ∧
      (∑ h, (∑ l : Fin N, (j (h, l) : ℝ)) / d h) <
        (2 - 1 / (N : ℝ)) * m * ε ∧
      MvPolynomial.eval (fun p => ∑ a, (z p.1 a : K) * b p.1 a p.2)
        (MvPolynomial.hasseDeriv j F) ≠ 0 := by sorry

end DiophantineApproximation

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation
section HyperplaneNonvanishing
variable {K : Type*} [Field K] [NumberField K]

open Classical in
/-- Layer 2 hyperplane nonvanishing. Evertse Lemma 24, through the sharp Roth node. -/
theorem nonvanishing_on_hyperplanes {m N : ℕ} (hm : 2 ≤ m) (hN : 2 ≤ N)
    (d : Fin m → ℕ) (hd : ∀ h, 0 < d h) {Θ : ℝ} (hΘ : 0 < Θ) (hΘ1 : Θ ≤ 1)
    (hdd : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ)^2 / Θ ≤ (d h : ℝ) / d h')
    (F : MvPolynomial (Fin m × Fin N) K) (hF : F ≠ 0)
    (hFh : ∀ u ∈ F.support, ∀ h, ∑ l, u (h, l) = d h)
    (b : Fin m → Fin N → K) (hb : ∀ h, b h ≠ 0)
    (hH : ∀ h, (Real.exp (∑ h, (d h : ℝ)) * height2 (fun u : F.support => F.coeff u)) ^
      (((N : ℝ) - 1) * (3 * (m : ℝ)^2 / Θ)^m) ≤ height2 (b h)^d h) :
    ∃ (x : Fin m → Fin N → K) (i : Fin m × Fin N →₀ ℕ),
      (∀ h, ∑ l, b h l * x h l = 0) ∧
      (∑ h, (∑ l, (i (h,l) : ℝ)) / d h) < m * Θ ∧
      MvPolynomial.eval (fun p => x p.1 p.2) (MvPolynomial.hasseDeriv i F) ≠ 0 := by sorry

end HyperplaneNonvanishing
end DiophantineApproximation

/-! ## Layer 3: transcendence and logarithmic forms -/

open Complex Polynomial

namespace Transcendence

/-- The `ℚ`-vector space `𝓛 = {λ : exp λ is algebraic}` of logarithms of algebraic numbers
(any branch). -/
def algebraicLogs : Submodule ℚ ℂ :=
  Submodule.span ℚ {l : ℂ | IsAlgebraic ℚ (exp l)}

/-- The retained algebraic-logarithm membership dictionary used at supplier boundaries. -/
theorem mem_algebraicLogs {l : ℂ} : l ∈ algebraicLogs ↔ IsAlgebraic ℚ (exp l) := by sorry

/-- λ ∈ 𝓛 ↔ ∃ α ≠ 0 algebraic, ∃ k : ℤ, λ = Complex.log α + k·2πi. -/
theorem mem_algebraicLogs_iff_exists_int {l : ℂ} :
    l ∈ algebraicLogs ↔
      ∃ α : ℂ, IsAlgebraic ℚ α ∧ α ≠ 0 ∧ ∃ k : ℤ, l = Complex.log α + k * (2 * Real.pi * I) :=
  sorry

/-- Unit test `Transcendence.zero_mem_algebraicLogs`: (degenerate) 0 ∈ algebraicLogs. -/
example : (0 : ℂ) ∈ algebraicLogs := sorry

/-- Unit test `Transcendence.pi_mul_I_mem_algebraicLogs`: (computation) π·i ∈ algebraicLogs, since
exp(πi) = −1. -/
example : (Real.pi : ℂ) * I ∈ algebraicLogs := sorry

/-- Unit test `Transcendence.two_pi_I_mem_algebraicLogs_not_mem_range_log`: (non-example) 2πi ∈
algebraicLogs but 2πi ∉ Set.range Complex.log: a definition by principal logarithms only is
wrong. -/
example : 2 * (Real.pi : ℂ) * I ∈ algebraicLogs ∧ 2 * (Real.pi : ℂ) * I ∉ Set.range Complex.log :=
  sorry

/-- Unit test `Transcendence.one_not_mem_algebraicLogs`: (non-example) 1 ∉ algebraicLogs (exp 1 = e
is supplied by LinearFormsInLogarithms §6.3 / transcendental_e): 𝓛 is
not the set of algebraic numbers. -/
example : (1 : ℂ) ∉ algebraicLogs := sorry

/-- A finite set of algebraic numbers lies in a finite Galois subfield of `ℂ`. -/
theorem exists_isGalois_superset (S : Finset ℂ) (hS : ∀ s ∈ S, IsAlgebraic ℚ s) :
    ∃ L : IntermediateField ℚ ℂ, FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ ∀ s ∈ S, s ∈ L :=
  sorry

end Transcendence

namespace LindemannWeierstrass

/-- Hermite's integral `F_f(z) = ∫₀^z e^{z-u} f(u) du` along the segment. -/
def hermiteIntegral (f : ℂ[X]) (z : ℂ) : ℂ :=
  z * ∫ t in (0 : ℝ)..1, exp (z * (1 - t)) * f.eval (z * t)

/-- The Hermite kernel integral, obtained by integration by parts (§3.1, E19 Lemma 4.2). -/
theorem hermiteIntegral_eq_sumIDeriv (f : ℂ[X]) (z : ℂ) :
    hermiteIntegral f z = exp z * (sumIDeriv f).eval 0 - (sumIDeriv f).eval z := by sorry

#check intervalIntegral.integral_eq_sub_of_hasDerivAt
#check Polynomial.sumIDeriv_eq_self_add
#check LindemannWeierstrass.exp_polynomial_approx

/-- A uniform bound on the disc of radius ‖z‖ bounds the Hermite transform by ‖z‖exp(‖z‖)C. -/
theorem norm_hermiteIntegral_le (f : ℂ[X]) (z : ℂ) {C : ℝ}
    (hC : ∀ u : ℂ, ‖u‖ ≤ ‖z‖ → ‖f.eval u‖ ≤ C) :
    ‖hermiteIntegral f z‖ ≤ ‖z‖ * Real.exp ‖z‖ * C := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_one`: (computation) hermiteIntegral 1 z = exp z
− 1. -/
example (z : ℂ) : hermiteIntegral 1 z = exp z - 1 := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_X_one`: (computation) hermiteIntegral X 1 = exp
1 − 2. -/
example : hermiteIntegral X 1 = exp 1 - 2 := sorry

/-- Unit test `LindemannWeierstrass.hermiteIntegral_X_one_ne`: (non-example) hermiteIntegral X 1 ≠ ∫
u in 0..1, exp u * u (= 1): the kernel is e^{z−u}, not e^u. -/
example : hermiteIntegral X 1 ≠ ∫ u in (0 : ℝ)..1, exp (u : ℂ) * u := sorry

variable (L : IntermediateField ℚ ℂ)

/-- Evaluation of formal exponential sums: `[γ] ↦ e^γ`. -/
def expEval : AddMonoidAlgebra L L →ₐ[L] ℂ :=
  AddMonoidAlgebra.lift L ℂ L
    (Complex.expMonoidHom.comp (AddMonoidHom.toMultiplicative (algebraMap L ℂ).toAddMonoidHom))

variable {L}

/-- Unit test `LindemannWeierstrass.expEval_single_zero`: (degenerate) expEval L (single 0 c) =
c. -/
example (c : L) : expEval L (AddMonoidAlgebra.single 0 c) = (c : ℂ) := sorry

/-- Unit test `LindemannWeierstrass.expEval_single_mul_single`: (computation) expEval L (single γ 1
* single γ' 1) = exp γ * exp γ' = exp (γ + γ'). -/
example (γ γ' : L) :
    expEval L (AddMonoidAlgebra.single γ 1 * AddMonoidAlgebra.single γ' 1) =
        exp (γ : ℂ) * exp (γ' : ℂ) ∧
      expEval L (AddMonoidAlgebra.single γ 1 * AddMonoidAlgebra.single γ' 1) =
        exp ((γ : ℂ) + γ') := sorry

/-- Unit test `LindemannWeierstrass.expEval_top_not_injective`: (non-example) For L = ⊤: single 0 1
− single (2π I) 1 ≠ 0 but its image is 0; injectivity of expEval (the Lindemann-Weierstrass theorem)
needs L ⊆ ℚ̄. -/
example :
    (AddMonoidAlgebra.single (0 : (⊤ : IntermediateField ℚ ℂ)) (1 : (⊤ : IntermediateField ℚ ℂ)) -
        AddMonoidAlgebra.single ⟨2 * (Real.pi : ℂ) * I, trivial⟩ 1) ≠ 0 ∧
      expEval ⊤ (AddMonoidAlgebra.single (0 : (⊤ : IntermediateField ℚ ℂ))
        (1 : (⊤ : IntermediateField ℚ ℂ)) -
          AddMonoidAlgebra.single ⟨2 * (Real.pi : ℂ) * I, trivial⟩ 1) = 0 := sorry

/-- Galois conjugation `Σ δ_γ [γ] ↦ Σ τ(δ_γ) [τ γ]`. -/
def galConj (τ : L ≃ₐ[ℚ] L) : AddMonoidAlgebra L L ≃+* AddMonoidAlgebra L L :=
  (AddMonoidAlgebra.mapDomainRingEquiv L τ.toRingEquiv.toAddEquiv).trans
    (AddMonoidAlgebra.mapRingEquiv L τ.toRingEquiv)

/-- Unit test `LindemannWeierstrass.galConj_single_ratCast`: (degenerate) galConj τ (single 0 (q :
L)) = single 0 (q : L) for q ∈ ℚ. -/
example (τ : L ≃ₐ[ℚ] L) (q : ℚ) :
    galConj τ (AddMonoidAlgebra.single 0 (q : L)) = AddMonoidAlgebra.single 0 (q : L) := sorry

/-- Unit test `LindemannWeierstrass.galConj_single_I`: (computation) If I ∈ L and τ I = −I then
galConj τ (single I I) = single (−I) (−I). -/
example (hI : I ∈ L) (τ : L ≃ₐ[ℚ] L) (hτ : τ ⟨I, hI⟩ = -⟨I, hI⟩) :
    galConj τ (AddMonoidAlgebra.single ⟨I, hI⟩ ⟨I, hI⟩) =
      AddMonoidAlgebra.single (-⟨I, hI⟩) (-⟨I, hI⟩) := sorry

/-- Unit test `LindemannWeierstrass.expEval_galConj_ne`: (non-example) If √2 ∈ L and τ √2 = −√2 then
expEval L (galConj τ (single √2 1)) = e^{−√2} ≠ e^{√2} = expEval L (single √2 1): evaluation is not
Galois-equivariant. -/
example (s : L) (hs : (s : ℂ) = Real.sqrt 2) (τ : L ≃ₐ[ℚ] L) (hτ : τ s = -s) :
    expEval L (galConj τ (AddMonoidAlgebra.single s 1)) = exp (-(Real.sqrt 2 : ℂ)) ∧
      exp (-(Real.sqrt 2 : ℂ)) ≠ exp (Real.sqrt 2 : ℂ) ∧
      exp (Real.sqrt 2 : ℂ) = expEval L (AddMonoidAlgebra.single s 1) := sorry

/-- The weak Lindemann-Weierstrass theorem (Evertse Theorem 4.11). -/
theorem expEval_ne_zero_of_forall_galConj_eq [FiniteDimensional ℚ L] [IsGalois ℚ L]
    {x : AddMonoidAlgebra L L} (hx : x ≠ 0) (hfix : ∀ τ : L ≃ₐ[ℚ] L, galConj τ x = x) :
    expEval L x ≠ 0 := sorry

end LindemannWeierstrass

/-- The Lindemann-Weierstrass theorem in Baker's form (Evertse Theorem 4.8); name and signature
in the algebraic-coefficient formulation. -/
theorem linearIndependent_exp {ι : Type*} (u : ι → integralClosure ℚ ℂ) (u_inj : u.Injective) :
    LinearIndependent (integralClosure ℚ ℂ) fun i ↦ exp (u i) := sorry

/-- Lindemann-Weierstrass, algebraic independence form (Evertse Corollary 4.10). -/
theorem algebraicIndependent_exp {ι : Type*} (u : ι → integralClosure ℚ ℂ)
    (hu : LinearIndependent ℕ u) :
    AlgebraicIndependent (integralClosure ℚ ℂ) fun i ↦ exp (u i) := sorry

namespace Transcendence

/-- Schanuel's conjecture, as a proposition (never assumed). -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))

/-- Unit test `Transcendence.schanuelConjecture_zero`: (degenerate) The n = 0 instance of the
inequality holds trivially (0 ≤ trdeg). -/
example (x : Fin 0 → ℂ) :
    ((0 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i)))) := sorry

/-- Unit test `Transcendence.schanuelConjecture_one_variable_unconditional`: (computation)
Unconditionally, for x = 1: 1 ≤ Algebra.trdeg ℚ ℚ(1, e) (e is transcendental). -/
example : (1 : Cardinal) ≤ Algebra.trdeg ℚ
    (IntermediateField.adjoin ℚ ({(1 : ℂ), exp 1} : Set ℂ)) := sorry

/-- Unit test `Transcendence.schanuelConjecture_algebraic_unconditional`: (compatibility)
Unconditionally, for x = (1, √2): 2 ≤ trdeg ℚ ℚ(1, √2, e, e^{√2}) (agreement with
algebraicIndependent_exp). -/
example : ((2 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range ![(1 : ℂ), Real.sqrt 2] ∪ Set.range (fun i ↦ exp (![(1 : ℂ), Real.sqrt 2] i)))) :=
  sorry

/-- Unit test `Transcendence.not_schanuel_of_distinct`: (non-example) The variant with 'pairwise
distinct' instead of 'linearly independent over ℚ' is false: x = (0) gives trdeg ℚ(0, 1) = 0 < 1
(Evertse Exercise 4.4). -/
example :
    ¬ (∀ (n : ℕ) (x : Fin n → ℂ), Function.Injective x →
        (n : Cardinal) ≤ Algebra.trdeg ℚ
          (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))) ∧
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
        (Set.range ![(0 : ℂ)] ∪ Set.range (fun i ↦ exp (![(0 : ℂ)] i)))) = 0 := sorry

/-- The proposition. -/
theorem SchanuelConjecture.algebraicIndependent_exp_one_pi (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![exp 1, (Real.pi : ℂ)] := sorry

/-- The proposition. -/
theorem SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs (h : SchanuelConjecture)
    {n : ℕ} {l : Fin n → ℂ} (hl : ∀ i, l i ∈ algebraicLogs) (hind : LinearIndependent ℚ l) :
    AlgebraicIndependent ℚ l := sorry

end Transcendence

namespace Transcendence

/-- Evertse Lemma 4.23: a real exponential polynomial `Σ p_k(x) e^{γ_k x}` has at most
`Σ (1 + deg p_k) - 1` real zeros. -/
theorem card_zeros_expPoly_le {r : ℕ} (hr : 0 < r) (γ : Fin r → ℝ) (hγ : Function.Injective γ)
    (p : Fin r → ℝ[X]) (hp : ∀ k, p k ≠ 0) (S : Finset ℝ)
    (hS : ∀ x ∈ S, ∑ k, (p k).eval x * Real.exp (γ k * x) = 0) :
    S.card + 1 ≤ ∑ k, ((p k).natDegree + 1) := sorry

/-- Evertse Lemma 4.26 with multiplicities. -/
theorem norm_le_of_zeros (f : ℂ → ℂ) (hf : Differentiable ℂ f) (a : Finset ℂ) (k : ℂ → ℕ)
    (hk : ∀ x ∈ a, ∀ j < k x, iteratedDeriv j f x = 0) {R T M : ℝ} (hR : 0 < R)
    (hRT : 3 * R ≤ T) (ha : ∀ x ∈ a, ‖x‖ ≤ R) (hM : ∀ w : ℂ, ‖w‖ = T → ‖f w‖ ≤ M) :
    ∀ z : ℂ, ‖z‖ ≤ R → ‖f z‖ ≤ M * (3 * R / T) ^ (∑ x ∈ a, k x) := sorry

end Transcendence

namespace GelfondSchneider

open NumberField

variable {K : Type*} [Field K] [NumberField K] (σ : K →+* ℂ)

/-- Schneider’s nonzero integral-coefficient auxiliary exponential polynomial,
vanishing on the L by L grid, with an exponential house bound (Evertse Lemma 4.22). -/
theorem exists_schneider_auxiliary (l : ℂ) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) :
    ∃ c₁ : ℝ, 0 < c₁ ∧ ∀ L D₁ D₂ : ℕ, 3 ≤ L → 2 * Module.finrank ℚ K * L ^ 2 ≤ D₁ * D₂ →
      ∃ a : Fin D₁ → Fin D₂ → K, a ≠ 0 ∧ (∀ i j, IsIntegral ℤ (a i j)) ∧
        (∀ i j, house (a i j) ≤ Real.exp (c₁ * ((D₁ : ℝ) * Real.log L + (D₂ : ℝ) * L))) ∧
        ∀ u v : ℕ, 1 ≤ u → u ≤ L → 1 ≤ v → v ≤ L →
          ∑ i, ∑ j, σ (a i j) * ((u : ℂ) + v * σ β') ^ (i : ℕ) *
            exp ((j : ℂ) * l * ((u : ℂ) + v * σ β')) = 0 := sorry

/-- Evertse Theorem 4.21 (Schneider's proof in the real case). -/
theorem transcendental_rpow {α β : ℝ} (hα : IsAlgebraic ℚ α) (hβ : IsAlgebraic ℚ β)
    (h0 : 0 < α) (h1 : α ≠ 1) (hirr : Irrational β) : Transcendental ℚ (α ^ β) := sorry

/-- Gelfond's auxiliary function via Siegel's theorem over `𝓞 K` (Setting G, `m = 2h + 2`). -/
theorem exists_gelfond_auxiliary (l : ℂ) (hl : l ≠ 0) (α' β' γ' : K) (hα : σ α' = exp l)
    (hγ : σ γ' = exp (σ β' * l)) (hβ : ∀ q : ℚ, σ β' ≠ q) :
    ∃ c₁ : ℝ, 1 ≤ c₁ ∧ ∀ n q : ℕ, 0 < n → q ^ 2 = 2 * (2 * Module.finrank ℚ K + 2) * n →
      ∃ η : Fin q → Fin q → K, η ≠ 0 ∧ (∀ a b, IsIntegral ℤ (η a b)) ∧
        (∀ a b, house (η a b) ≤ c₁ ^ n * (n : ℝ) ^ (((n : ℝ) + 1) / 2)) ∧
        ∀ k < n, ∀ t : ℕ, 1 ≤ t → t ≤ 2 * Module.finrank ℚ K + 2 →
          iteratedDeriv k (fun z : ℂ ↦ ∑ a : Fin q, ∑ b : Fin q,
            σ (η a b) * exp (((a : ℂ) + 1 + ((b : ℂ) + 1) * σ β') * l * z)) t = 0 := sorry

end GelfondSchneider

namespace Transcendence

/-- `e^{πα}` is transcendental for algebraic `α ∉ ℚ i` (Evertse Corollary 4.17). -/
theorem transcendental_exp_pi_mul {α : ℂ} (hα : IsAlgebraic ℚ α) (h : ∀ q : ℚ, α ≠ q * I) :
    Transcendental ℚ (exp (Real.pi * α)) := sorry

/-- Two `ℚ`-linearly independent logarithms are `ℚ̄`-linearly independent (Evertse
Corollary 4.18, Waldschmidt Theorem 1.4). -/
theorem linearIndependent_integralClosure_of_two (l : Fin 2 → ℂ) (hl : ∀ i, l i ∈ algebraicLogs)
    (hind : LinearIndependent ℚ l) : LinearIndependent (integralClosure ℚ ℂ) l := sorry

end Transcendence

namespace Baker

open Metric

variable {n : ℕ}

/-- Multi-index partial derivative `D^σ f = ∂₁^{σ₁} ⋯ ∂ₙ^{σₙ} f` on `ℂⁿ = Fin n → ℂ`. -/
def mDeriv (σ : Fin n → ℕ) (f : (Fin n → ℂ) → ℂ) : (Fin n → ℂ) → ℂ :=
  (List.finRange n).foldr
    (fun i g ↦ (fun (g' : (Fin n → ℂ) → ℂ) (z : Fin n → ℂ) ↦ fderiv ℂ g' z (Pi.single i 1))^[σ i] g) f

/-- An analytic ordinary partial derivative is the factorial product times its isolated Taylor coefficient formula. -/
theorem mDeriv_eq_factorial_mul_mvTaylorCoeff (σ : Fin n → ℕ)
    (f : (Fin n → ℂ) → ℂ) (z : Fin n → ℂ) (hf : AnalyticAt ℂ f z) :
    mDeriv σ f z = (∏ i, ((σ i).factorial : ℂ)) * SignatureModel.taylorCoeff f z σ := by sorry

/-- The mixed order (2,3) has factorial product twelve. -/
example : mDeriv ![2, 3] (fun z : Fin 2 → ℂ => z 0 ^ 2 * z 1 ^ 3) 0 = 12 ∧
    SignatureModel.taylorCoeff (fun z : Fin 2 → ℂ => z 0 ^ 2 * z 1 ^ 3) 0 ![2, 3] = 1 := by sorry

/-- Unit test `Baker.mDeriv_zero_example`: (degenerate) mDeriv 0 f = f. -/
example (f : (Fin n → ℂ) → ℂ) : mDeriv 0 f = f := by sorry

/-- Unit test `Baker.mDeriv_single_mul`: (computation) For f(z) = z_0 z_1 on ℂ^2: mDeriv (Pi.single
0 1) f = fun z ↦ z 1. -/
example : mDeriv (Pi.single 0 1) (fun z : Fin 2 → ℂ ↦ z 0 * z 1) = fun z ↦ z 1 := sorry

/-- Unit test `Baker.mDeriv_ne_total_derivative`: (non-example) For f(z) = z_0^2 on ℂ^2, mDeriv ![1,
1] f = 0 while iteratedFDeriv ℂ 2 f z ![e_0, e_0] = 2: D^σ is a mixed partial of multi-order σ, not
the total derivative of order ‖σ‖ along one direction. -/
example : mDeriv ![1, 1] (fun z : Fin 2 → ℂ ↦ z 0 ^ 2) = 0 ∧
    ∀ z : Fin 2 → ℂ, iteratedFDeriv ℂ 2 (fun z : Fin 2 → ℂ ↦ z 0 ^ 2) z
      ![Pi.single 0 1, Pi.single 0 1] = 2 := sorry

/-- Cauchy's inequalities on polydiscs. -/
theorem norm_mDeriv_le (f : (Fin n → ℂ) → ℂ) (hf : Differentiable ℂ f) {r M : ℝ} (hr : 0 < r)
    (hM : ∀ z ∈ closedBall (0 : Fin n → ℂ) r, ‖f z‖ ≤ M) (σ : Fin n → ℕ) :
    ‖mDeriv σ f 0‖ ≤ (∏ i, ((σ i).factorial : ℝ)) * M / r ^ (∑ i, σ i) ∧
      ∀ ζ : Fin n → ℂ, 1 + ‖ζ‖ ≤ r →
        ‖mDeriv σ f ζ‖ ≤ (∏ i, ((σ i).factorial : ℝ)) * M / (r - ‖ζ‖) ^ (∑ i, σ i) := sorry

section SchneiderLang

variable {d₀ d₁ : ℕ} (hd₀ : d₀ ≤ n) (x : Fin d₁ → Fin n → ℂ) (y : Fin n → Fin n → ℂ)
  {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ)

end SchneiderLang

/-- Waldschmidt, Corollary 4.3. -/
theorem schneiderLang_homogeneous {d ℓ : ℕ} (x : Fin d → Fin n → ℂ)
    (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν))
    (hrank : n + 1 ≤ Module.finrank ℚ (Submodule.span ℚ (Set.range x)))
    (y : Fin ℓ → Fin n → ℂ) (hy : Submodule.span ℂ (Set.range y) = ⊤) :
    ∃ i j, (∑ ν, x i ν * y j ν) ∉ Transcendence.algebraicLogs := sorry

end Baker

namespace Transcendence

/-- Local restatement of LinearFormsInLogarithms §7.3, to be replaced by the import once that roadmap is merged.
Local consumer restatement for the `algebraicLogs` carrier and the retained log 2+√2 log 3
example. In this isolated signature the named §7.2 affine coefficient-vanishing and §7.3
nonzero-sum supplier interfaces are explicit arguments; the proof only translates membership
and obtains nonvanishing from coefficient vanishing, without another endpoint proof. -/
theorem transcendental_sum_mul_of_linearIndependent {m : ℕ} (_hm : 0 < m) (l : Fin m → ℂ)
    (hl : ∀ i, l i ∈ algebraicLogs) (hind : LinearIndependent ℚ l) (β : Fin m → ℂ)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβ0 : β ≠ 0)
    (hAffine : (∀ i, IsAlgebraic ℚ (exp (l i))) → LinearIndependent ℚ l →
      ∀ (β₀ : ℂ) (b : Fin m → ℂ), IsAlgebraic ℚ β₀ → (∀ i, IsAlgebraic ℚ (b i)) →
        β₀ + ∑ i, b i * l i = 0 → β₀ = 0 ∧ ∀ i, b i = 0)
    (hSum : (∀ i, IsAlgebraic ℚ (exp (l i))) →
      ∀ b : Fin m → ℂ, (∀ i, IsAlgebraic ℚ (b i)) →
        ∑ i, b i * l i ≠ 0 → Transcendental ℚ (∑ i, b i * l i)) :
    Transcendental ℚ (∑ i, β i * l i) := by
  have hlogs : ∀ i, IsAlgebraic ℚ (exp (l i)) := fun i => mem_algebraicLogs.mp (hl i)
  apply hSum hlogs β hβ
  intro hzero
  have hcoeff := (hAffine hlogs hind 0 β isAlgebraic_zero hβ (by simpa using hzero)).2
  exact hβ0 (funext hcoeff)

/-- Evertse Corollary 4.20. -/
theorem transcendental_exp_sum_mul {m : ℕ} (l : Fin m → ℂ) (hl : ∀ i, l i ∈ algebraicLogs)
    (hmul : ∀ k : Fin m → ℤ, ∏ i, exp (l i) ^ k i = 1 → k = 0) (β : Fin m → ℂ)
    (hβ : ∀ i, IsAlgebraic ℚ (β i)) (hβq : ¬ ∀ i, ∃ q : ℚ, β i = q) :
    Transcendental ℚ (exp (∑ i, β i * l i)) := sorry

/-- The shared qualitative Baker interface makes log 2+√2 log 3 transcendental. -/
example : Transcendental ℚ ((Real.log 2 : ℂ) + (Real.sqrt 2 : ℂ) * (Real.log 3 : ℂ)) := by
  have hlogs : ∀ i : Fin 2,
      (![Real.log 2, Real.log 3] : Fin 2 → ℂ) i ∈ algebraicLogs := by sorry
  have hli : LinearIndependent ℚ (![Real.log 2, Real.log 3] : Fin 2 → ℂ) := by sorry
  have hβ : ∀ i : Fin 2, IsAlgebraic ℚ ((![1, Real.sqrt 2] : Fin 2 → ℂ) i) := by sorry
  have hnβ : (![1, Real.sqrt 2] : Fin 2 → ℂ) ≠ 0 := by sorry
  simpa using transcendental_sum_mul_of_linearIndependent (by norm_num : 0 < 2)
    (![Real.log 2, Real.log 3] : Fin 2 → ℂ) hlogs hli
    (![1, Real.sqrt 2] : Fin 2 → ℂ) hβ hnβ
    (by
      -- Supplied by LinearFormsInLogarithms §7.2 / Baker.eq_zero_of_add_sum_mul_eq_zero.
      sorry)
    (by
      -- Supplied by LinearFormsInLogarithms §7.3 / Baker.transcendental_sum_mul.
      sorry)

end Transcendence

namespace LogarithmicForms

open NumberField Transcendence

/-- Waldschmidt's measure (DALAG Theorem 9.1 with `C(m) = 2^{m+25} m^{3m+9}`, Proposition 9.18);
`β₀` is the constant term and `k = m - 1` indexes `λ_m`. -/
theorem waldschmidt_measure {m : ℕ} (hm : 1 ≤ m) (l : Fin m → ℂ) (hl : ∀ j, l j ∈ algebraicLogs)
    (hind : LinearIndependent ℚ l) (β₀ : ℂ) (β : Fin m → ℂ) (hβ₀ : IsAlgebraic ℚ β₀)
    (hβ : ∀ j, IsAlgebraic ℚ (β j)) (hne : β₀ ≠ 0 ∨ β ≠ 0) (D : ℕ)
    (hD : D = Module.finrank ℚ (IntermediateField.adjoin ℚ
      (Set.range (fun j ↦ exp (l j)) ∪ Set.range β ∪ {β₀})))
    (B E Estar : ℝ) (A : Fin m → ℝ) (hB : Real.exp 1 ≤ B) (hE : Real.exp 1 ≤ E)
    (hEstar : Real.exp 1 ≤ Estar)
    (hA : ∀ j, max (absLogHeight₁ (exp (l j))) (max (E * ‖l j‖ / D) (Real.log E / D)) ≤
      Real.log (A j))
    (hEs : max (Real.log E / D) (Real.log (D / Real.log E)) ≤ Real.log Estar) (hBE : Estar ≤ B)
    (hcase : ((∀ j, D * Real.log (A j) / Real.log E ≤ B) ∧ absLogHeight₁ β₀ ≤ Real.log B ∧
        ∀ j, absLogHeight₁ (β j) ≤ Real.log B) ∨
      (β₀ = 0 ∧ (∀ j, ∃ b : ℤ, β j = b) ∧ β ⟨m - 1, by omega⟩ ≠ 0 ∧
        ∀ j : Fin m, (j : ℕ) < m - 1 → (‖β ⟨m - 1, by omega⟩‖ / Real.log (A j) +
          ‖β j‖ / Real.log (A ⟨m - 1, by omega⟩)) * Real.log E / D ≤ B)) :
    β₀ + ∑ j, β j * l j ≠ 0 ∧
      Real.exp (-(2 ^ (m + 25) * (m : ℝ) ^ (3 * m + 9)) * (D : ℝ) ^ (m + 2) * Real.log B *
          (∏ j, Real.log (A j)) * Real.log Estar * Real.log E ^ (-((m : ℤ) + 1))) <
        ‖β₀ + ∑ j, β j * l j‖ := sorry

/-- Baker's lower bound (Evertse Theorem 5.2), with the absolute multiplicative height. -/
theorem baker_lower_bound {m : ℕ} (l : Fin m → ℂ) (hl : ∀ j, l j ∈ algebraicLogs) (D : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (γ : ℂ) (β : Fin m → ℂ) (B : ℝ), IsAlgebraic ℚ γ →
      (∀ i, IsAlgebraic ℚ (β i)) → (minpoly ℚ γ).natDegree ≤ D →
      (∀ i, (minpoly ℚ (β i)).natDegree ≤ D) → 1 ≤ B → absMulHeight₁ γ ≤ B →
      (∀ i, absMulHeight₁ (β i) ≤ B) → γ + ∑ i, β i * l i ≠ 0 →
      (Real.exp 1 * B) ^ (-C) ≤ ‖γ + ∑ i, β i * l i‖ := sorry

/-- Evertse Corollary 5.3. -/
theorem baker_lower_bound_prod_sub_one {m : ℕ} (α : Fin m → ℂ) (hα : ∀ i, IsAlgebraic ℚ (α i))
    (h0 : ∀ i, α i ≠ 0) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin m → ℤ, ∏ i, α i ^ b i ≠ 1 →
      (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ‖∏ i, α i ^ b i - 1‖ := sorry

open Classical in
/-- Matveev's Corollary 2.3 (Izv. Math. 64 (2000)); `κ = 1` for a real field, `2` otherwise. -/
theorem matveev {n : ℕ} (hn : 1 ≤ n) {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ)
    (α : Fin n → K) (l : Fin n → ℂ) (hl : ∀ j, exp (l j) = ι (α j)) (hl0 : ∀ j, l j ≠ 0)
    (b : Fin n → ℤ) (hΛ : ∑ j, (b j : ℂ) * l j ≠ 0) (A : Fin n → ℝ)
    (hA : ∀ j, max (Module.finrank ℚ K * absLogHeight₁ (α j)) (max ‖l j‖ 0.16) ≤ A j)
    (κ : ℕ) (hκ : κ = if ∀ x : K, (ι x).im = 0 then 1 else 2) :
    -(min ((1 / (κ : ℝ)) * (Real.exp 1 * n / 2) ^ κ * 30 ^ (n + 3) * (n : ℝ) ^ (3.5 : ℝ))
          (2 ^ (6 * n + 20))) * (Module.finrank ℚ K : ℝ) ^ 2 * (∏ j, A j) *
        Real.log (Real.exp 1 * Module.finrank ℚ K) *
        Real.log (Real.exp 1 * ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)) <
      Real.log ‖∑ j, (b j : ℂ) * l j‖ := sorry

/-- A product near one has a nonzero small logarithmic form after a bounded principal-branch
correction by an even multiple of πi. -/
theorem logarithm_product_branch_reduction {n : ℕ} (hn : 1 ≤ n) (α : Fin n → ℂ)
    (hα : ∀ j, α j ≠ 0) (b : Fin n → ℤ) (hne : ∏ j, α j ^ b j ≠ 1)
    (hsmall : ‖∏ j, α j ^ b j - 1‖ < 1 / 3) :
    ∃ k : ℤ, Even k ∧ k.natAbs ≤ n * (Finset.univ.sup fun j ↦ (b j).natAbs) ∧
      0 < ‖(k : ℂ) * Real.pi * Complex.I + ∑ j, (b j : ℂ) * Complex.log (α j)‖ ∧
      ‖(k : ℂ) * Real.pi * Complex.I + ∑ j, (b j : ℂ) * Complex.log (α j)‖ ≤
        2 * ‖∏ j, α j ^ b j - 1‖ := by sorry

/-- Evertse Theorem 5.4 (Matveev for rationals), with the factor `2/3` of the derivation. -/
theorem matveev_rat {m : ℕ} (a : Fin m → ℚ) (ha : ∀ i, a i ≠ 0) (b : Fin m → ℤ)
    (h : ∏ i, (a i : ℝ) ^ b i ≠ 1) :
    2 / 3 * (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^
        (-(Real.exp 1 / 2 * (m : ℝ) ^ (4.5 : ℝ) * 30 ^ (m + 3) *
          ∏ i, max 1 (Real.log (max (a i).num.natAbs (a i).den)))) ≤
      |∏ i, (a i : ℝ) ^ b i - 1| := sorry

/-- Matveev for `α₁^{b₁} ⋯ αₙ^{bₙ} - 1` over a number field (Bugeaud-Mignotte-Siksek,
Theorem 9.4); principal logarithms. -/
theorem matveev_prod_sub_one {n : ℕ} (hn : 1 ≤ n) {K : Type*} [Field K] [NumberField K]
    (ι : K →+* ℂ) (α : Fin n → K) (hα : ∀ j, α j ≠ 0) (b : Fin n → ℤ)
    (hΛ : ∏ j, ι (α j) ^ b j ≠ 1) (A : Fin n → ℝ)
    (hA : ∀ j, max (Module.finrank ℚ K * absLogHeight₁ (α j))
      (max ‖Complex.log (ι (α j))‖ 0.16) ≤ A j) :
    let D : ℝ := Module.finrank ℚ K
    let B : ℝ := ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)
    (-(3 * 30 ^ (n + 4) * ((n : ℝ) + 1) ^ (5.5 : ℝ)) * D ^ 2 * (1 + Real.log D) *
        (1 + Real.log (n * B)) * ∏ j, A j < Real.log ‖∏ j, ι (α j) ^ b j - 1‖) ∧
      ((∀ x : K, (ι x).im = 0) →
        -(1.4 * 30 ^ (n + 3) * (n : ℝ) ^ (4.5 : ℝ)) * D ^ 2 * (1 + Real.log D) *
          (1 + Real.log B) * ∏ j, A j < Real.log ‖∏ j, ι (α j) ^ b j - 1‖) := sorry

/-- Laurent-Mignotte-Nesterenko (Evertse Exercise 5.4). -/
theorem laurent_mignotte_nesterenko (a₁ a₂ : ℚ) (h₁ : 0 < a₁) (h₂ : 0 < a₂) (h₁' : a₁ ≠ 1)
    (h₂' : a₂ ≠ 1) (b₁ b₂ : ℤ) (hb₁ : b₁ ≠ 0) (hb₂ : b₂ ≠ 0)
    (hΛ : b₁ * Real.log a₁ - b₂ * Real.log a₂ ≠ 0) :
    let H₁ : ℝ := max a₁.num.natAbs a₁.den
    let H₂ : ℝ := max a₂.num.natAbs a₂.den
    (-24.34) * (max (Real.log (abs (b₁ : ℝ) / Real.log H₂ + abs (b₂ : ℝ) / Real.log H₁) + 0.14) 21) ^ 2 *
        Real.log H₁ * Real.log H₂ ≤ Real.log (abs (b₁ * Real.log a₁ - b₂ * Real.log a₂)) := sorry

/-- Yu's explicit `𝔭`-adic bound (Compositio 91 (1994), §0.1), stated through the `𝔭`-adic
absolute value with base `N𝔭 = p^{f_𝔭}`: `ord_𝔭(Λ) < Φ log(dB)`. -/
theorem yu {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ) {n : ℕ} (hn : 2 ≤ n)
    (α : Fin n → K) (hα : ∀ j, α j ≠ 0) (hgen : IntermediateField.adjoin ℚ (Set.range α) = ⊤)
    (p : ℕ) [Fact p.Prime] (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K))
    (hv : (p : 𝓞 K) ∈ v.asIdeal) (hb1 : 1 < ((Ideal.absNorm v.asIdeal : ℕ) : NNReal))
    (b : Fin n → ℤ) (hΛ : ∏ j, α j ^ b j ≠ 1) (h : Fin n → ℝ)
    (hh : ∀ j, max (absLogHeight₁ (α j))
      (max (‖Complex.log (ι (α j))‖ / (10 * Module.finrank ℚ K)) (Real.log p)) ≤ h j) :
    let d : ℝ := Module.finrank ℚ K
    let B : ℝ := max ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ) 3
    let h' : ℝ := max (Finset.univ.sup' ⟨⟨0, by omega⟩, Finset.mem_univ _⟩ h) 1
    let Φ : ℝ := 22000 * (9.5 * (n + 1) * d / Real.sqrt (Real.log p)) ^ (2 * (n + 1)) *
      ((Ideal.absNorm v.asIdeal : ℝ) - 1) * (∏ j, h j) * Real.log (10 * n * d * h')
    ((Ideal.absNorm v.asIdeal : ℕ) : ℝ) ^ (-(Φ * Real.log (d * B))) <
      v.adicAbv hb1 (∏ j, α j ^ b j - 1) := sorry

/-- Yu's generated-field estimate and prime-extension transport give a power-law bound
for a fixed algebraic tuple at an ideal-normalized place of any containing number field. -/
theorem yu_fixedField_powerLaw {K : Type*} [Field K] [NumberField K] {n : ℕ}
    (α : Fin n → K) (hα : ∀ j, α j ≠ 0)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K))
    (hb1 : 1 < ((Ideal.absNorm v.asIdeal : ℕ) : NNReal)) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin n → ℤ, ∏ j, α j ^ b j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        v.adicAbv hb1 (∏ j, α j ^ b j - 1) := by sorry

/-- For p=2, a=2 and b=2 violate the lifting identity; divisibility by four is needed. -/
example : padicNorm 2 (((1 + (2 : ℤ)) ^ 2 - 1 : ℤ) : ℚ) ≠
    padicNorm 2 (((2 : ℤ) * 2 : ℤ) : ℚ) := sorry

/-- Evertse Exercise 5.9(i): lifting the exponent. -/
theorem padicNorm_one_add_pow_sub_one (p : ℕ) [Fact p.Prime] (a : ℤ) (ha : a ≠ 0)
    (hpa : (Odd p ∧ (p : ℤ) ∣ a) ∨ (p = 2 ∧ 4 ∣ a)) (b : ℕ) (hb : 1 ≤ b) :
    padicNorm p ((1 + a) ^ b - 1) = padicNorm p (a * b) ∧
      1 / |((a * b : ℤ) : ℚ)| ≤ padicNorm p (a * b) := sorry

/-- Yu's `p`-adic lower bound for rationals (Evertse Theorem 5.16). -/
theorem yu_rat (p : ℕ) [Fact p.Prime] {m : ℕ} (a : Fin m → ℚ) (ha : ∀ i, padicNorm p (a i) = 1) :
    ∃ C : ℝ, 0 < C ∧ ∀ b : Fin m → ℤ, ∏ i, a i ^ b i ≠ 1 →
      (Real.exp 1 * ((Finset.univ.sup fun i ↦ (b i).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        (padicNorm p (∏ i, a i ^ b i - 1) : ℝ) := sorry

end LogarithmicForms

/-! ## Layer 4: effective Diophantine equations -/

open NumberField NumberField.Units NumberField.InfinitePlace
open NumberField.Units.dirichletUnitTheorem
open scoped NumberField Classical

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

/-- Assuming every p∈S is prime: x ∈ U_S ↔ |num x| and den x lie in Nat.factoredNumbers S. -/
theorem mem_sUnits_rat_iff_num_den {S : Finset ℕ} (hS : ∀ p ∈ S, p.Prime) {x : ℚˣ} :
    x ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ) ↔
      (x : ℚ).num.natAbs ∈ Nat.factoredNumbers S ∧ (x : ℚ).den ∈ Nat.factoredNumbers S := sorry

/-- If S consists of primes: x ∈ U_S ↔ x = ε·∏_{p∈S} p^{z_p} for some sign ε and z ∈ ℤ^S (Evertse's definition). -/
theorem mem_sUnits_rat_iff_eq_sign_mul_prod {S : Finset ℕ} (hS : ∀ p ∈ S, p.Prime) {x : ℚˣ} :
    x ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ) ↔
      ∃ (ε : ℤˣ) (z : S → ℤ), (x : ℚ) = (ε : ℚ) * ∏ p : S, ((p : ℕ) : ℚ) ^ z p := sorry

/-- If S consists of primes, U_S ≃* ℤˣ × Multiplicative (S → ℤ) via x ↦ (sign x, (v_p(x))_p); in particular U_S is finitely generated of rank |S|. -/
theorem sUnits_rat_mulEquiv (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    Nonempty ((Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ) ≃* (ℤˣ × Multiplicative (S → ℤ))) := sorry

/-- Assuming every p∈S is prime: For x ∈ U_S: H(x) = max(∏_{p∈S} p^{max(v_p x,0)}, ∏_{p∈S} p^{max(−v_p x,0)}), with H = Height.mulHeight₁ = max(|num|, den). -/
theorem mulHeight₁_sUnits_rat (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) (x : ℚˣ) (hx : x ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ)) :
    Height.mulHeight₁ (x : ℚ) =
      max (∏ p ∈ S, (p : ℝ) ^ (padicValRat p (x : ℚ)).toNat)
        (∏ p ∈ S, (p : ℝ) ^ (-padicValRat p (x : ℚ)).toNat) := sorry

/-- Unit test `ratSUnits.test_twelve_fifths`: 12/5 ∈ U_{2,3,5}. -/
example : (Units.mk0 (12 / 5 : ℚ) (by norm_num)) ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ ({2, 3, 5} : Finset ℕ)} ℚ) := sorry

/-- Unit test `ratSUnits.test_seven`: 7 ∉ U_{2,3}; testing that x is a unit only at primes
of S would accept it; the defining condition tests primes outside S. -/
example : (Units.mk0 (7 : ℚ) (by norm_num)) ∉ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ ({2, 3} : Finset ℕ)} ℚ) := sorry

/-- Evertse, Lemma 5.10, with the explicit constant `rank K * ∑ ‖logEmbedding (u j)‖`. -/
theorem exists_unit_mul_balanced {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) {α : 𝓞 K} (hα : α ≠ 0) :
    ∃ n : Fin (rank K) → ℤ, ∀ w : InfinitePlace K,
      |Real.log (w (((∏ j, u j ^ n j : (𝓞 K)ˣ) : K) * (α : K))) -
          Real.log |Algebra.norm ℚ (α : K)| / Module.finrank ℚ K| ≤
        rank K * ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖ := sorry

/-- The finite set of representatives of the divisors of `α` up to units (Evertse,
Corollary 5.11): divisors whose house is at most `exp c₁ · |N(α)|^{1/d}`. -/
def boundedDivisors {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) (α : 𝓞 K) : Set (𝓞 K) :=
  {γ | γ ∣ α ∧ house (γ : K) ≤
    Real.exp (rank K * ∑ j, ‖logEmbedding K (Additive.ofMul (u j))‖) *
      |(Algebra.norm ℚ (α : K) : ℝ)| ^ (1 / (Module.finrank ℚ K : ℝ))}

/-- α ≠ 0 ⟹ D_u. -/
theorem boundedDivisors_finite {K : Type*} [Field K] [NumberField K]
    (u : Fin (rank K) → (𝓞 K)ˣ) {α : 𝓞 K} (hα : α ≠ 0) :
    (boundedDivisors u α).Finite := sorry

/-- u of maximal rank, α ≠ 0, β ∣ α ⟹ β = ε·γ with γ ∈ D_u(α), ε a unit. -/
theorem exists_mem_boundedDivisors_of_dvd {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) {α β : 𝓞 K} (hα : α ≠ 0) (hβ : β ∣ α) :
    ∃ γ ∈ boundedDivisors u α, ∃ ε : (𝓞 K)ˣ, β = ε * γ := sorry

/-- Unit test `boundedDivisors.test_rat`: For K = ℚ and m ≠ 0: D(m) = {γ : γ ∣ m ∧ |γ| ≤ |m|}. -/
example (u : Fin (rank ℚ) → (𝓞 ℚ)ˣ) (m : 𝓞 ℚ) (hm : m ≠ 0) :
    boundedDivisors u m = {γ | γ ∣ m ∧ |((γ : ℚ) : ℝ)| ≤ |((m : ℚ) : ℝ)|} := sorry

/-- Unit test `boundedDivisors.test_six`: For K = ℚ: D(6) = {±1, ±2, ±3, ±6}. -/
example (u : Fin (rank ℚ) → (𝓞 ℚ)ˣ) :
    ((↑) : 𝓞 ℚ → ℚ) '' boundedDivisors u 6 = {1, -1, 2, -2, 3, -3, 6, -6} := sorry

/-- Evertse, Corollary 5.5, made explicit with Matveev's constant (Theorem 5.4, `m = 2`). -/
theorem pow_sub_pow_eq_finite {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) {k : ℤ} (hk : k ≠ 0) :
    {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k}.Finite ∧
      ∀ mn ∈ {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k},
        let C₁ : ℝ := 1 + Real.exp 1 / 2 * 2 ^ (4.5 : ℝ) * 30 ^ 5 *
          max 1 (Real.log a) * max 1 (Real.log b)
        (max mn.1 mn.2 : ℝ) ≤ 2 * (Real.log |(k : ℝ)| + C₁) / Real.log 2 +
          2 * (C₁ / Real.log 2) * (Real.log (2 * C₁ / Real.log 2) - 1) := sorry

/-- Evertse, Theorem 5.6 (Tijdeman). -/
theorem tijdeman_gap (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ ∀ x ∈ Nat.factoredNumbers S, ∀ y ∈ Nat.factoredNumbers S,
      x < y → (y : ℝ) / (c₁ * Real.log y ^ c₂) ≤ y - x := sorry

/-- Uniform bounds for logarithmic forms give an explicit exponent bound for a rank-positive unit equation. -/
theorem unitEquation_exponent_bound {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) (hr : 1 ≤ rank K)
    {α β : K} (hα : α ≠ 0) (hβ : β ≠ 0) {C' : ℝ} (hC' : 0 < C')
    (hLB : ∀ (σ : K →+* ℂ) (γ : K), (∃ ζ ∈ torsion K, γ = α * (ζ : K) ∨ γ = β * (ζ : K)) →
      ∀ e : Fin (rank K) → ℤ, σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) ≠ 1 →
        (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (e j).natAbs : ℕ) : ℝ)) ^ (-C') ≤
          ‖σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) - 1‖)
    (x y : (𝓞 K)ˣ) (hxy : α * (x : K) + β * (y : K) = 1)
    (ζx ζy : (𝓞 K)ˣ) (hζx : ζx ∈ torsion K) (hζy : ζy ∈ torsion K)
    (ex ey : Fin (rank K) → ℤ) (hx : x = ζx * ∏ j, u j ^ ex j) (hy : y = ζy * ∏ j, u j ^ ey j) :
    let d : ℝ := Module.finrank ℚ K
    let κ : ℝ := 2 * (d - 1) *
      ‖((basisOfIsMaxRank hu).equivFunL : logSpace K →L[ℝ] (Fin (rank K) → ℝ))‖
    let A : ℝ := κ * (d - 1) * (Real.log (max (house α) (house β)) + C')
    let B : ℝ := κ * (d - 1) * C'
    ((Finset.univ.sup fun j => max (ex j).natAbs (ey j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

/-- Evertse, Theorem 5.12: the unit equation has finitely many solutions, with exponent vectors
(with respect to `fundSystem K`) bounded by the bound of `unitEquation_exponent_bound` for a
constant supplied by Corollary 5.3. -/
theorem unitEquation_finite {K : Type*} [Field K] [NumberField K] {α β : K}
    (hα : α ≠ 0) (hβ : β ≠ 0) :
    {p : (𝓞 K)ˣ × (𝓞 K)ˣ | α * (p.1 : K) + β * (p.2 : K) = 1}.Finite := sorry

/-- Evertse, Theorem 5.13 (Thue equations; the effective box is assembled from
`thue_reduction_to_unitEquation`, `unitEquation_exponent_bound`, `mulHeight₁_ratCast` and
`logHeight₁_le_finrank_mul_log_house`). -/
theorem thueEquation_finite {f : Polynomial ℤ} {d : ℕ} (hd : f.natDegree = d)
    (h3 : 3 ≤ (f.aroots ℂ).toFinset.card) {m : ℤ} (hm : m ≠ 0) :
    {p : ℤ × ℤ | MvPolynomial.eval ![p.1, p.2] (f.homogenize d) = m}.Finite := sorry

/-- Evertse, Theorem 5.14 (Baker, 1968). -/
theorem baker_superelliptic {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    {n : ℕ} (hn : 2 ≤ n) (hdeg : (3 ≤ n → 2 ≤ f.natDegree) ∧ (n = 2 → 3 ≤ f.natDegree))
    {b : ℤ} (hb : b ≠ 0) :
    {p : ℤ × ℤ | b * p.2 ^ n = f.eval p.1}.Finite := sorry

/-- Evertse, Theorem 5.15 (Schinzel–Tijdeman, 1976). -/
theorem schinzel_tijdeman {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    (hdeg : 2 ≤ f.natDegree) {b : ℤ} (hb : b ≠ 0) :
    ∃ C : ℕ, ∀ (n : ℕ) (x y : ℤ), b * y ^ n = f.eval x → y ≠ 0 → y ≠ 1 → y ≠ -1 → n ≤ C :=
  sorry

/-- Tijdeman (1976), as reported in Evertse §5.1: Catalan's equation has effectively bounded
solutions. -/
theorem tijdeman_catalan :
    ∃ C : ℕ, ∀ x y m n : ℕ, 2 ≤ x → 2 ≤ y → 2 ≤ m → 2 ≤ n →
      (x : ℤ) ^ m - (y : ℤ) ^ n = 1 → x ^ m ≤ C ∧ y ^ n ≤ C := sorry

/-- Uniform prime-adic logarithmic bounds bound all valuations of solutions to the rational S-unit equation. -/
theorem sUnitEquation_exponent_bound (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) {C : ℝ}
    (hC : 0 < C)
    (hLB : ∀ p ∈ S, ∀ (ε : ℤˣ) (b : S → ℤ), (∀ hp : p ∈ S, b ⟨p, hp⟩ = 0) →
      (ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun q => (b q).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ((padicNorm p ((ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q - 1) : ℚ) : ℝ))
    (x y : ℚˣ) (hx : x ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ)) (hy : y ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ)) (hxy : (x : ℚ) + y = 1)
    (p : ℕ) :
    (|padicValRat p (x : ℚ)| : ℝ) ≤ max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) ∧
      (|padicValRat p (y : ℚ)| : ℝ) ≤
        max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) := sorry

/-- Evertse, Theorem 5.17. -/
theorem sUnitEquation_finite (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    {xy : ℚˣ × ℚˣ | xy.1 ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ) ∧ xy.2 ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ) ∧ (xy.1 : ℚ) + xy.2 = 1}.Finite :=
  sorry

/-- Archimedean and finite-place lower bounds give an explicit exponent bound for a finitely generated S-unit equation. -/
theorem gyoryEquation_exponent_bound {K : Type*} [Field K] [NumberField K] {t : ℕ}
    (γ : Fin t → K) (hγ0 : ∀ j, γ j ≠ 0) (S : Finset (FinitePlace K))
    (hS : ∀ j, ∀ v : FinitePlace K, v ∉ S → v (γ j) = 1) {κ : ℝ} (hκ : 0 < κ)
    (hκbound : ∀ (ζ : K), (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) → ∀ (z : Fin t → ℤ) (j : Fin t),
      |(z j : ℝ)| ≤ κ * Height.logHeight₁ (ζ * ∏ i, γ i ^ z i))
    {a b : K} (ha : a ≠ 0) (hb : b ≠ 0) {C : ℝ} (hC : 0 < C)
    (hLBinf : ∀ (σ : K →+* ℂ) (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ‖σ (c * ∏ j, γ j ^ z j) - 1‖)
    (hLBfin : ∀ v ∈ S, ∀ (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        v (c * ∏ j, γ j ^ z j - 1))
    (ζx ζy : K) (hζx : ∃ n : ℕ, 0 < n ∧ ζx ^ n = 1) (hζy : ∃ n : ℕ, 0 < n ∧ ζy ^ n = 1)
    (zx zy : Fin t → ℤ)
    (hxy : a * (ζx * ∏ j, γ j ^ zx j) + b * (ζy * ∏ j, γ j ^ zy j) = 1) :
    let s : ℝ := S.card + Fintype.card (InfinitePlace K)
    let M : ℝ := max (max (house a) (house b)) (⨆ v ∈ S, max (v a) (v b))
    let A : ℝ := 2 * κ * s * (Real.log M + C)
    let B : ℝ := 2 * κ * s * C
    ((Finset.univ.sup fun j => max (zx j).natAbs (zy j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

/-- Evertse, Theorem 5.18 (Győry, 1979). -/
theorem gyoryEquation_finite {K : Type*} [Field K] [NumberField K] (Γ : Subgroup Kˣ)
    (hΓ : Γ.FG) {a b : K} (ha : a ≠ 0) (hb : b ≠ 0) :
    {p : Kˣ × Kˣ | p.1 ∈ Γ ∧ p.2 ∈ Γ ∧ a * (p.1 : K) + b * (p.2 : K) = 1}.Finite := sorry

/-- Elements whose principal ideal divides (m) outside P have finitely many representatives modulo a finitely generated subgroup containing the units. -/
theorem exists_mem_smul_of_dvd_sUnit {K : Type*} [Field K] [NumberField K]
    (P : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) {m : 𝓞 K} (hm : m ≠ 0) :
    ∃ (M : Finset (𝓞 K)) (Γ : Subgroup Kˣ), Γ.FG ∧
      (∀ ε : (𝓞 K)ˣ, Units.map (algebraMap (𝓞 K) K : 𝓞 K →* K) ε ∈ Γ) ∧
      ∀ β : 𝓞 K, β ≠ 0 →
        (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K), v ∉ P →
          v.intValuation m ≤ v.intValuation β) →
        ∃ μ ∈ M, ∃ g ∈ Γ, (β : K) = μ * (g : K) := sorry

/-- A binary form with at least three distinct complex roots has finitely many primitive Thue–Mahler solutions for nonzero right-hand coefficient. -/
theorem thueMahler_finite {f : Polynomial ℤ} {d : ℕ} (hd : f.natDegree = d)
    (h3 : 3 ≤ (f.aroots ℂ).toFinset.card) {m : ℤ} (hm : m ≠ 0) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) :
    {p : ℤ × ℤ × (S → ℕ) | IsCoprime p.1 p.2.1 ∧
      MvPolynomial.eval ![p.1, p.2.1] (f.homogenize d) = m * ∏ q : S, (q : ℤ) ^ p.2.2 q}.Finite :=
  sorry

end DiophantineApproximation

/-! ## Layer 5: special functions and functional transcendence -/

open scoped RatFunc LaurentSeries Classical
open PowerSeries

namespace DiophantineApproximation

open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

/-- Cauchy's theorem for linear systems with holomorphic coefficients on a disc. -/
theorem existsUnique_analytic_solution_linearSystem {n : ℕ} (A : Matrix (Fin n) (Fin n) (ℂ → ℂ))
    (z₀ : ℂ) (r : ℝ) (hr : 0 < r)
    (hA : ∀ i j, AnalyticOnNhd ℂ (A i j) (Metric.ball z₀ r)) (y₀ : Fin n → ℂ) :
    ∃ y : Fin n → ℂ → ℂ,
      ((∀ i, AnalyticOnNhd ℂ (y i) (Metric.ball z₀ r)) ∧ (∀ i, y i z₀ = y₀ i) ∧
        ∀ z ∈ Metric.ball z₀ r, ∀ i, deriv (y i) z = ∑ j, A i j z * y j z) ∧
      ∀ y' : Fin n → ℂ → ℂ,
        (∀ i, AnalyticOnNhd ℂ (y' i) (Metric.ball z₀ r)) → (∀ i, y' i z₀ = y₀ i) →
        (∀ z ∈ Metric.ball z₀ r, ∀ i, deriv (y' i) z = ∑ j, A i j z * y' j z) →
        ∀ i, Set.EqOn (y i) (y' i) (Metric.ball z₀ r) := sorry

/-- Kähler differentials of a finitely generated extension in characteristic zero. -/
theorem rank_kaehlerDifferential_eq_trdeg (C E : Type*) [Field C] [Field E] [Algebra C E]
    [CharZero C] [Algebra.EssFiniteType C E] :
    Module.rank E (Ω[E⁄C]) = Algebra.trdeg C E := sorry

/-- Fibre-comparison adapter for a torsion-free finite-type domain over the affine line:
Mathlib's quotient dimension theorem and Tau Ceti's maximal-ideal height theorem apply. -/
theorem ringKrullDim_quotient_add_one_eq (K : Type*) [Field K] (A : Type*) [CommRing A] [IsDomain A]
    [Algebra (Polynomial K) A] [Algebra.FiniteType (Polynomial K) A]
    [Module.IsTorsionFree (Polynomial K) A] (ξ : K)
    (h : Ideal.span {algebraMap (Polynomial K) A (Polynomial.X - Polynomial.C ξ)} ≠ ⊤) :
    ringKrullDim (A ⧸ Ideal.span {algebraMap (Polynomial K) A (Polynomial.X - Polynomial.C ξ)}) + 1 =
      ringKrullDim A := sorry

/-- `f` is D-finite (holonomic) over the subfield `k ⊆ ℂ`: it satisfies a nonzero linear
differential equation with polynomial coefficients in `k[z]`. -/
def IsDFinite (k : Subfield ℂ) (f : PowerSeries ℂ) : Prop :=
  ∃ (n : ℕ) (p : Fin (n + 1) → Polynomial ℂ), (∀ i m, (p i).coeff m ∈ k) ∧
    p (Fin.last n) ≠ 0 ∧ ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative (R := ℂ)))^[i] f = 0

/-- For f with coefficients in k: D-finite over k iff the coefficient sequence is P-recursive with polynomial coefficients in k[X]. -/
theorem isDFinite_iff_pRecursive {k : Subfield ℂ} {f : PowerSeries ℂ}
    (hf : ∀ m, coeff m f ∈ k) :
    IsDFinite k f ↔ ∃ (r : ℕ) (q : Fin (r + 1) → Polynomial ℂ), (∀ i m, (q i).coeff m ∈ k) ∧
      q (Fin.last r) ≠ 0 ∧ ∀ n : ℕ, ∑ i : Fin (r + 1), (q i).eval (n : ℂ) * coeff (n + i) f = 0 :=
  sorry

/-- Unit test `IsDFinite.test_exp`: PowerSeries.exp ℂ is D-finite over ℚ (f′ − f = 0). -/
example : IsDFinite ⊥ (PowerSeries.exp ℂ) := sorry

/-- Unit test `IsDFinite.test_polynomial`: Every polynomial with coefficients in Q̄ is D-finite over
Q̄ (p f′ − p′ f = 0). -/
example (p : Polynomial ℂ) (hp : ∀ m, p.coeff m ∈ ((algebraicClosure ℚ ℂ).toSubfield)) : IsDFinite ((algebraicClosure ℚ ℂ).toSubfield) (p : PowerSeries ℂ) := by sorry

/-- The order of the minimal differential equation of a D-finite power series. -/
def dfiniteOrder (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f) : ℕ := Nat.find hf

/-- A point `ξ` is a singular point of the minimal equation of `f` if the leading coefficient
of every minimal-order equation vanishes at `ξ`. -/
def IsMinimalSingularPoint (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f)
    (ξ : ℂ) : Prop :=
  ∀ p : Fin (dfiniteOrder k f hf + 1) → Polynomial ℂ, (∀ i m, (p i).coeff m ∈ k) →
    p (Fin.last _) ≠ 0 → ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative (R := ℂ)))^[i] f = 0 →
      (p (Fin.last _)).eval ξ = 0

/-- For coefficient tuples p,p′ over the same field k, both with nonzero leading coefficients and annihilating f at the minimal order ord_k(f), one has p′_n p_i = p_n p′_i for all i. The coefficient-field hypotheses are essential. -/
theorem minimal_equation_unique (k : Subfield ℂ) (f : PowerSeries ℂ) (hf : IsDFinite k f)
    (p p' : Fin (dfiniteOrder k f hf + 1) → Polynomial ℂ)
    (hpk : ∀ i m, (p i).coeff m ∈ k)
    (hpk' : ∀ i m, (p' i).coeff m ∈ k)
    (hplead : p (Fin.last _) ≠ 0) (hplead' : p' (Fin.last _) ≠ 0)
    (hp : ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative (R := ℂ)))^[i] f = 0)
    (hp' : ∑ i, (p' i : PowerSeries ℂ) * (⇑(PowerSeries.derivative (R := ℂ)))^[i] f = 0) :
    ∀ i, p' (Fin.last _) * p i = p (Fin.last _) * p' i := sorry

/-- Unit test `dfiniteOrder.test_exp`: exp has minimal order 1. -/
example (h : IsDFinite ⊥ (PowerSeries.exp ℂ)) : dfiniteOrder ⊥ (PowerSeries.exp ℂ) h = 1 := sorry

/-- Unit test `dfiniteOrder.test_apparent`: (z − 1)eᶻ has order 1 and 1 is a singular point of its
minimal equation (an apparent one). -/
example (h : IsDFinite ⊥ ((Polynomial.X - 1 : Polynomial ℂ) * PowerSeries.exp ℂ)) :
    dfiniteOrder ⊥ _ h = 1 ∧ IsMinimalSingularPoint ⊥ _ h 1 := sorry

/-- Unit test `dfiniteOrder.test_no_singularity_exp`: exp has no finite singular point; a definition
of 'singular point' using an arbitrary (non-minimal) equation such as (z − 1)(f′ − f) = 0 would
wrongly report z = 1. -/
example (h : IsDFinite ⊥ (PowerSeries.exp ℂ)) (ξ : ℂ) :
    ¬ IsMinimalSingularPoint ⊥ (PowerSeries.exp ℂ) h ξ := sorry

/-- The power series `∑ a n zⁿ / n!`. -/
def ePowerSeries (a : ℕ → ℂ) : PowerSeries ℂ := PowerSeries.mk fun n => a n / n.factorial

/-- The entire function `z ↦ ∑ a n zⁿ / n!`. -/
def eFun (a : ℕ → ℂ) (z : ℂ) : ℂ := ∑' n, a n * z ^ n / n.factorial

/-- Siegel's E-functions (in the geometric normalisation of Shidlovskii, André and Beukers):
algebraic coefficients, a linear differential equation over `Q̄(z)`, and coefficients whose
conjugates and common denominators grow at most geometrically. -/
structure IsEFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : IsDFinite ((algebraicClosure ℚ ℂ).toSubfield) (ePowerSeries a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- The Hurwitz (binomial) product of coefficient sequences: `ePowerSeries (hurwitzMul a b)` is
the product of the two power series. -/
def hurwitzMul (a b : ℕ → ℂ) (n : ℕ) : ℂ := ∑ k ∈ Finset.range (n + 1), (n.choose k : ℂ) * a k * b (n - k)

namespace IsEFunction

/-- An E-function is entire. -/
theorem differentiable {a : ℕ → ℂ} (ha : IsEFunction a) :
    Differentiable ℂ (eFun a) := sorry

/-- The series `∑ aₙ zⁿ / n!` converges to `eFun a z` for every `z`. -/
theorem hasSum {a : ℕ → ℂ} (ha : IsEFunction a) (z : ℂ) :
    HasSum (fun n => a n * z ^ n / n.factorial) (eFun a z) := sorry

/-- All coefficients of an E-function lie in one number field. -/
theorem exists_numberField {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧ ∀ n, a n ∈ K := sorry

end IsEFunction

/-- Unit test `IsEFunction.test_exp`: The constant sequence 1 (the exponential) is an E-function. -/
example : IsEFunction fun _ => 1 := sorry

/-- Unit test `IsEFunction.test_linear_factor`: a_n = n − 1 ((z − 1)eᶻ) is an E-function. -/
example : IsEFunction fun n => (n : ℂ) - 1 := sorry

/-- Unit test `IsEFunction.test_exp_sq`: e^{z²} (a_{2k} = (2k)!/k!, a_{odd} = 0) is not an
E-function in this normalisation; Siegel's (n!)^ε definition would also reject it, but a definition
bounding |a_n/n!| instead of |a_n| would accept it. -/
example : ¬ IsEFunction fun n => if Even n then ((n.factorial : ℂ) / (n / 2).factorial) else 0 :=
  sorry

/-- Unit test `IsEFunction.test_geometric`: a_n = n! (the series 1/(1 − z)) is not an E-function;
forgetting the factorial normalisation would accept it. -/
example : ¬ IsEFunction fun n => (n.factorial : ℂ) := sorry

/-- Siegel's G-functions: `∑ a n zⁿ` with the same arithmetic conditions (no factorials). -/
structure IsGFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : IsDFinite ((algebraicClosure ℚ ℂ).toSubfield) (PowerSeries.mk a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- IsGFunction a ↔ IsEFunction a (Borel transform). -/
theorem isGFunction_iff_isEFunction (a : ℕ → ℂ) :
    IsGFunction a ↔ IsEFunction a := sorry

namespace IsGFunction

/-- A G-function converges on a disc of positive radius. -/
theorem hasRadius {a : ℕ → ℂ} (ha : IsGFunction a) :
    ∃ ρ : ℝ, 0 < ρ ∧ ∀ z : ℂ, ‖z‖ < ρ → Summable fun n => a n * z ^ n := sorry

end IsGFunction

/-- Unit test `IsGFunction.test_log`: Σ_{n≥1} zⁿ/n = −log(1 − z) is a G-function. -/
example : IsGFunction fun n => if n = 0 then 0 else 1 / (n : ℂ) := sorry

/-- Unit test `IsGFunction.test_geometric`: Σ zⁿ (a_n = 1) is a G-function. -/
example : IsGFunction fun _ => 1 := sorry

/-- Unit test `IsGFunction.test_exp`: a_n = 1/n! is not a G-function (its denominators n! grow
faster than Dⁿ); a definition without the denominator condition would accept exp. -/
example : ¬ IsGFunction fun n => 1 / (n.factorial : ℂ) := sorry

/-- Factorial-divided coefficients put a factor 1/2 at degree two. -/
example : PowerSeries.coeff 2 (ePowerSeries fun _ => 1) = (1 / 2 : ℂ) := by sorry

/-- Zero coefficient data give the zero factorial-divided series. -/
example : ePowerSeries (fun _ => 0) = 0 := by sorry

/-- The constant coefficient sequence one sums to the exponential. -/
example (z : ℂ) : eFun (fun _ => 1) z = Complex.exp z := by sorry

/-- A single first-order coefficient sums to the identity function. -/
example (z : ℂ) : eFun (fun n => if n = 1 then 1 else 0) z = z := by sorry

/-- Hurwitz multiplication of exponentials doubles the argument. -/
example (n : ℕ) : hurwitzMul (fun _ => 1) (fun _ => 1) n = (2 : ℂ) ^ n := by sorry

/-- Squaring the first-order basis sequence gives coefficient two at order two. -/
example : hurwitzMul (fun n => if n = 1 then 1 else 0)
    (fun n => if n = 1 then 1 else 0) 2 = 2 := by sorry

/-- For power series with algebraic coefficients, algebraic independence over `ℂ(z)` is
algebraic independence over `Q̄[z]`. -/
theorem algebraicIndependent_ratFunc_iff_of_isAlgebraic_coeff {n : ℕ}
    (f : Fin n → PowerSeries ℂ) (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) :
    AlgebraicIndependent (RatFunc ℂ) (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) ↔
      ∀ P : MvPolynomial (Fin n) (Polynomial ℂ), (∀ e j, IsAlgebraic ℚ ((P.coeff e).coeff j)) →
        MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom f P = 0 → P = 0 := sorry

/-- The vector of power series `F` solves `T F' = M F` with polynomial `T`, `M`. -/
def SolvesSystem {ι : Type*} [Fintype ι] (T : Polynomial ℂ) (M : Matrix ι ι (Polynomial ℂ))
    (F : ι → PowerSeries ℂ) : Prop :=
  ∀ i, (T : PowerSeries ℂ) * PowerSeries.derivative (R := ℂ) (F i) =
    ∑ j, (M i j : PowerSeries ℂ) * F j

/-- The exponential solves the scalar identity system. -/
example : SolvesSystem 1 (!![1] : Matrix (Fin 1) (Fin 1) (Polynomial ℂ))
    (fun _ => PowerSeries.exp ℂ) := by sorry

/-- The exponential fails the scalar system with zero right-hand side. -/
example : ¬ SolvesSystem 1 (!![0] : Matrix (Fin 1) (Fin 1) (Polynomial ℂ))
    (fun _ => PowerSeries.exp ℂ) := by sorry

/-- Homogeneous monomials in solutions of a differential system solve the induced symmetric-power system. -/
theorem isEFunction_monomials_solveSystem {n : ℕ} (a : Fin n → ℕ → ℂ) (T : Polynomial ℂ)
    (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) (N : ℕ) :
    ∃ M' : Matrix {e : Fin n → Fin (N + 1) // ∑ i, (e i : ℕ) = N}
        {e : Fin n → Fin (N + 1) // ∑ i, (e i : ℕ) = N} (Polynomial ℂ),
      SolvesSystem T M' fun e => ∏ i, ePowerSeries (a i) ^ (e.1 i : ℕ) := sorry

/-- Dividing a rational-coefficient E-function vanishing at one by 1−z preserves the E-function conditions. -/
theorem isEFunction_div_one_sub {a : ℕ → ℂ} (ha : IsEFunction a) (hq : ∀ n, ∃ q : ℚ, a n = q)
    (h1 : eFun a 1 = 0) :
    IsEFunction (fun n => (n.factorial : ℂ) * ∑ k ∈ Finset.range (n + 1), a k / k.factorial) :=
  sorry

/-- The minimal equation of a G-function satisfies the regular-singularity order inequalities at zero. -/
theorem minimal_equation_regularSingular_of_isGFunction {a : ℕ → ℂ} (ha : IsGFunction a)
    (hf : IsDFinite ((algebraicClosure ℚ ℂ).toSubfield) (PowerSeries.mk a))
    (p : Fin (dfiniteOrder ((algebraicClosure ℚ ℂ).toSubfield) _ hf + 1) → Polynomial ℂ)
    (hpk : ∀ i m, IsAlgebraic ℚ ((p i).coeff m))
    (hp : ∑ i, (p i : PowerSeries ℂ) * (⇑(PowerSeries.derivative (R := ℂ)))^[i] (PowerSeries.mk a) = 0)
    (hlast : p (Fin.last _) ≠ 0) (i : Fin (dfiniteOrder ((algebraicClosure ℚ ℂ).toSubfield) _ hf + 1)) (hi : p i ≠ 0) :
    (p (Fin.last _)).natTrailingDegree ≤
      (p i).natTrailingDegree + (dfiniteOrder ((algebraicClosure ℚ ℂ).toSubfield) _ hf - (i : ℕ)) :=
  sorry

/-- The Laplace transform of an E-function is x⁻¹ times the associated G-series at x⁻¹ for sufficiently large real x. -/
theorem laplace_eFun_eq {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ R : ℝ, 0 < R ∧ ∀ x : ℝ, R < x →
      ∫ t in Set.Ioi (0 : ℝ), Complex.exp (-(x : ℂ) * t) * eFun a t =
        (1 / (x : ℂ)) * ∑' n, a n * (1 / (x : ℂ)) ^ n :=
  sorry

/-- André's theorem: an E-function satisfies a differential equation whose only singularities
are `0` and `∞`. -/
theorem andre_eFunction_equation {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ (m : ℕ) (q : Fin m → Polynomial ℂ), (∀ k, (q k).natDegree ≤ m - (k : ℕ)) ∧
      (∀ k j, IsAlgebraic ℚ ((q k).coeff j)) ∧
      (PowerSeries.X ^ m * (⇑(PowerSeries.derivative (R := ℂ)))^[m] (ePowerSeries a) +
        ∑ k : Fin m, (PowerSeries.X ^ (k : ℕ) * (q k : PowerSeries ℂ)) *
          (⇑(PowerSeries.derivative (R := ℂ)))^[k] (ePowerSeries a) = 0) := sorry

/-- Rational E-function division by 1−z and holomorphic local bases imply that every local
solution of the minimal equation of a nonzero rational E-function vanishing at one vanishes there. -/
theorem eFunction_rational_minimal_equation_zero {a : ℕ → ℂ} (ha : IsEFunction a)
    (hq : ∀ m, ∃ q : ℚ, a m = q) (ha0 : ePowerSeries a ≠ 0) (h1 : eFun a 1 = 0)
    (hf : IsDFinite ⊥ (ePowerSeries a))
    (p : Fin (dfiniteOrder ⊥ (ePowerSeries a) hf + 1) → Polynomial ℂ)
    (hpk : ∀ i m, (p i).coeff m ∈ (⊥ : Subfield ℂ))
    (hlast : p (Fin.last _) ≠ 0)
    (hp : ∑ i, (p i : PowerSeries ℂ) *
      (⇑(PowerSeries.derivative (R := ℂ)))^[i] (ePowerSeries a) = 0)
    (g : ℂ → ℂ) (hg : AnalyticAt ℂ g 1)
    (hsol : ∀ᶠ z in nhds (1 : ℂ), ∑ i, (p i).eval z * iteratedDeriv i g z = 0) :
    g 1 = 0 := by sorry

/-- Every holomorphic local solution of an E-function's minimal equation vanishes at
its nonzero algebraic zero, by the identity-component and conjugate-compositum transfer. -/
theorem eFunction_minimal_equation_zero {a : ℕ → ℂ} (ha : IsEFunction a)
    (ha0 : ePowerSeries a ≠ 0) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ) (hξ0 : ξ ≠ 0)
    (hzero : eFun a ξ = 0)
    (p : Fin (dfiniteOrder ((algebraicClosure ℚ ℂ).toSubfield)
      (ePowerSeries a) ha.isDFinite + 1) → Polynomial ℂ)
    (hpk : ∀ i m, IsAlgebraic ℚ ((p i).coeff m))
    (hlast : p (Fin.last _) ≠ 0)
    (hp : ∑ i, (p i : PowerSeries ℂ) *
      (⇑(PowerSeries.derivative (R := ℂ)))^[i] (ePowerSeries a) = 0)
    (g : ℂ → ℂ) (hg : AnalyticAt ℂ g ξ)
    (hsol : ∀ᶠ z in nhds ξ, ∑ i, (p i).eval z * iteratedDeriv i g z = 0) :
    g ξ = 0 := by sorry

/-- The analytic equation y″+y=0 has a solution vanishing at one and another nonvanishing there. -/
example :
    (∀ z : ℂ, iteratedDeriv 2 (fun w => Complex.sin (w - 1)) z + Complex.sin (z - 1) = 0) ∧
    Complex.sin ((1 : ℂ) - 1) = 0 ∧
    (∀ z : ℂ, iteratedDeriv 2 (fun w => Complex.cos (w - 1)) z + Complex.cos (z - 1) = 0) ∧
    Complex.cos ((1 : ℂ) - 1) = 1 := by sorry

/-- Holomorphic solutions of (z−1)y′−zy=0 vanish at one. -/
example (g : ℂ → ℂ) (hg : AnalyticAt ℂ g 1)
    (hsol : ∀ᶠ z in nhds (1 : ℂ), (z - 1) * deriv g z - z * g z = 0) :
    g 1 = 0 := by sorry

/-- Polynomial functional relations admit a basis retaining full row rank at every complex specialization. -/
theorem exists_relation_basis_full_rank_specialisation {n : ℕ} (f : Fin n → PowerSeries ℂ) :
    ∃ (r : ℕ) (C : Fin r → Fin n → Polynomial ℂ),
      (∀ j, ∑ i, (C j i : PowerSeries ℂ) * f i = 0) ∧
      (∀ c : Fin n → Polynomial ℂ, ∑ i, (c i : PowerSeries ℂ) * f i = 0 →
        c ∈ Submodule.span (Polynomial ℂ) (Set.range C)) ∧
      ∀ ξ : ℂ, LinearIndependent ℂ (fun j => fun i => (C j i).eval ξ) := sorry

/-- Beukers, Theorem 3.2: every linear relation over `Q̄` between values at a regular algebraic
point comes from a functional relation. -/
theorem beukers_linear_relation {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsEFunction (a i))
    (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) (lam : Fin n → ℂ) (hlam : ∀ i, IsAlgebraic ℚ (lam i))
    (hrel : ∑ i, lam i * eFun (a i) ξ = 0) :
    ∃ c : Fin n → Polynomial ℂ, (∀ i j, IsAlgebraic ℚ ((c i).coeff j)) ∧
      ∑ i, (c i : PowerSeries ℂ) * ePowerSeries (a i) = 0 ∧ ∀ i, (c i).eval ξ = lam i := sorry

/-- Beukers' refined Siegel–Shidlovskii theorem (Theorem 1.3). -/
theorem beukers_refined_siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ)
    (ha : ∀ i, IsEFunction (a i)) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) (P : MvPolynomial (Fin n) ℂ) (hPalg : ∀ e, IsAlgebraic ℚ (P.coeff e))
    {d : ℕ} (hPhom : MvPolynomial.IsHomogeneous P d) (hP : MvPolynomial.eval (fun i => eFun (a i) ξ) P = 0) :
    ∃ Q : MvPolynomial (Fin n) (Polynomial ℂ),
      (∀ e j, IsAlgebraic ℚ ((Q.coeff e).coeff j)) ∧ MvPolynomial.IsHomogeneous Q d ∧
      MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom (fun i => ePowerSeries (a i)) Q = 0 ∧
      MvPolynomial.map (Polynomial.evalRingHom ξ) Q = P := sorry

/-- The Siegel–Shidlovskii theorem. -/
theorem siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsEFunction (a i))
    (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => eFun (a i) ξ)) =
      let E : IntermediateField (RatFunc ℂ) ℂ⸨X⸩ := IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩))
      letI : Algebra (RatFunc ℂ) E := E.toSubalgebra.algebra
      Algebra.trdeg (RatFunc ℂ) E := sorry

/-- The general minimal-equation zero theorem supplies conjugate vanishing, so division
by a linear factor at a nonzero algebraic zero preserves the E-function conditions. -/
theorem isEFunction_div_linear {a : ℕ → ℂ} (ha : IsEFunction a) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξ0 : ξ ≠ 0) (h : eFun a ξ = 0) :
    ∃ b : ℕ → ℂ, IsEFunction b ∧ ∀ z, eFun a z = (z - ξ) * eFun b z := sorry

/-- Nonzero singularities are removed by polynomial factors over the algebraic numbers;
the transformed E-function system has coefficients over the same algebraic constant field. -/
theorem beukers_removal_of_singularities {n : ℕ} (a : Fin n → ℕ → ℂ)
    (ha : ∀ i, IsEFunction (a i)) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT0 : T ≠ 0) (hT : ∀ j, IsAlgebraic ℚ (T.coeff j))
    (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ (e : Fin n → ℕ → ℂ) (B : Matrix (Fin n) (Fin n) (Polynomial ℂ)) (k : ℕ)
      (N : Matrix (Fin n) (Fin n) (Polynomial ℂ)),
      (∀ i, IsEFunction (e i)) ∧ B.det ≠ 0 ∧
      (∀ i j m, IsAlgebraic ℚ ((B i j).coeff m)) ∧
      (∀ i j m, IsAlgebraic ℚ ((N i j).coeff m)) ∧
      (∀ i, ePowerSeries (a i) = ∑ j, (B i j : PowerSeries ℂ) * ePowerSeries (e j)) ∧
      SolvesSystem (Polynomial.X ^ k) N fun i => ePowerSeries (e i) := sorry

/-- Differentiating F=B E gives the gauge coefficient B⁻¹ A B−B⁻¹ B′. -/
theorem solvesSystem_gauge_transform {n : ℕ} (F E : ℂ → Fin n → ℂ)
    (B : ℂ → Matrix (Fin n) (Fin n) ℂ) (A : Matrix (Fin n) (Fin n) ℂ) (ξ : ℂ)
    (hE : ∀ i, DifferentiableAt ℂ (fun z => E z i) ξ)
    (hB : ∀ i j, DifferentiableAt ℂ (fun z => B z i j) ξ)
    (hdet : (B ξ).det ≠ 0) (hF : ∀ᶠ z in nhds ξ, F z = (B z).mulVec (E z))
    (hsys : (fun i => deriv (fun z => F z i) ξ) = A.mulVec (F ξ)) :
    (fun i => deriv (fun z => E z i) ξ) =
      ((B ξ)⁻¹ * A * B ξ - (B ξ)⁻¹ *
        Matrix.of (fun i j => deriv (fun z => B z i j) ξ)).mulVec (E ξ) := by sorry

/-- Removing the scalar factor z−1 from (z−1)exp z gives coefficient one. -/
example {z : ℂ} (hz : z ≠ 1) :
    (z - 1)⁻¹ * (1 + (z - 1)⁻¹) * (z - 1) - (z - 1)⁻¹ * 1 = 1 := by
  have h : z - 1 ≠ 0 := sub_ne_zero.mpr hz
  field_simp
  ring

/-- Galochkin–Chudnovsky: values of G-functions at rationals very close to `0`. -/
theorem galochkin_chudnovsky {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsGFunction (a i))
    (hrat : ∀ i m, ∃ q : ℚ, a i m = q) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT0 : T ≠ 0) (hT : ∀ j, IsAlgebraic ℚ (T.coeff j))
    (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => PowerSeries.mk (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((PowerSeries.mk (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ C : ℝ, 0 < C ∧ ∀ p q : ℤ, 0 < q → p ≠ 0 → C * |(p : ℝ)| ^ (n + 1) < q →
      LinearIndependent ℚ fun i => ∑' m, a i m * ((p : ℂ) / q) ^ m := sorry

#check PowerSeries.expand
#check PowerSeries.expand_apply
#check PowerSeries.coeff_expand

/-- `f` is a `q`-Mahler function: algebraic coefficients and a nontrivial linear relation
`∑ pᵢ(z) f(z^{qⁱ}) = 0` with polynomial coefficients over `Q̄`. -/
def IsMahlerFunction (q : ℕ) (f : PowerSeries ℂ) : Prop :=
  2 ≤ q ∧ (∀ m, IsAlgebraic ℚ (coeff m f)) ∧
    ∃ (n : ℕ) (p : Fin (n + 1) → Polynomial ℂ), (∀ i m, IsAlgebraic ℚ ((p i).coeff m)) ∧
      (∃ i, p i ≠ 0) ∧ ∑ i, (p i : PowerSeries ℂ) * PowerSeries.subst (PowerSeries.X ^ (q ^ (i : ℕ))) f = 0

/-- f is q-Mahler iff it is the first coordinate of a solution of F(z) = A(z)F(z^q) with A invertible over ℂ(z) (and algebraic entries). -/
theorem isMahlerFunction_iff_system (q : ℕ) (hq : 2 ≤ q) (f : PowerSeries ℂ) :
    IsMahlerFunction q f ↔ ∃ (n : ℕ) (F : Fin (n + 1) → PowerSeries ℂ)
      (A : Matrix (Fin (n + 1)) (Fin (n + 1)) (RatFunc ℂ)),
      (∀ i m, IsAlgebraic ℚ (coeff m (F i))) ∧
      (∀ i j m, IsAlgebraic ℚ ((A i j).num.coeff m) ∧
        IsAlgebraic ℚ ((A i j).denom.coeff m)) ∧ IsUnit A.det ∧ F 0 = f ∧
        (fun i => ((F i : PowerSeries ℂ) : ℂ⸨X⸩)) =
          (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec
            (fun i => ((PowerSeries.subst (PowerSeries.X ^ q) (F i) : PowerSeries ℂ) : ℂ⸨X⸩)) := sorry

/-- Unit test `IsMahlerFunction.test_transcendental_constant`: a transcendental
constant solves an identity system but fails the algebraic coefficient condition. -/
example (c : ℂ) (hc : Transcendental ℚ c) :
    ¬ IsMahlerFunction 2 (PowerSeries.C c) := sorry

/-- Unit test `IsMahlerFunction.test_fredholm`: Σ z^{2^n} is 2-Mahler. -/
example : IsMahlerFunction 2 (PowerSeries.mk fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) :=
  sorry

/-- For q≥2 and an invertible rational matrix A, a point of the punctured unit disc
is regular if no `α^{q^ℓ}` is a pole of an entry of A or A⁻¹. Invalid q and singular
matrices fail the predicate. -/
def IsMahlerRegularPoint {n : ℕ} (q : ℕ) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ)) (α : ℂ) : Prop :=
  2 ≤ q ∧ IsUnit A.det ∧ 0 < ‖α‖ ∧ ‖α‖ < 1 ∧ ∀ ℓ : ℕ, ∀ i j,
    (A i j).denom.eval (α ^ q ^ ℓ) ≠ 0 ∧ (A⁻¹ i j).denom.eval (α ^ q ^ ℓ) ≠ 0

/-- The Fredholm system matrix [[1,z],[0,1]] is regular throughout the punctured unit disc. -/
example (α : ℂ) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    IsMahlerRegularPoint 2 (!![1, RatFunc.X; 0, 1] : Matrix (Fin 2) (Fin 2) (RatFunc ℂ)) α := sorry

/-- A singular scalar matrix fails regularity even though the reduced denominators
of it and its total inverse have no zeros. -/
example : ¬ IsMahlerRegularPoint 2 (0 : Matrix (Fin 1) (Fin 1) (RatFunc ℂ)) (1 / 2 : ℂ) := sorry

/-- Unit test `IsMahlerRegularPoint.test_iterate`: For A = (1 − 2z)⁻¹, α = 2^{−1/2} is not regular;
a definition testing only ℓ = 0 would call it regular. -/
example : ¬ IsMahlerRegularPoint 2 (!![(1 - 2 * RatFunc.X)⁻¹] : Matrix (Fin 1) (Fin 1) (RatFunc ℂ))
    ((Real.sqrt 2)⁻¹ : ℂ) := sorry

/-- An algebraic Mahler series is a rational function with algebraic coefficients. -/
theorem algebraic_mahler_rational {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) (halg : IsAlgebraic (RatFunc ℂ) (f : ℂ⸨X⸩)) :
    ∃ p r : Polynomial ℂ, r ≠ 0 ∧
      (∀ m, IsAlgebraic ℚ (p.coeff m) ∧ IsAlgebraic ℚ (r.coeff m)) ∧
      (r : PowerSeries ℂ) * f = (p : PowerSeries ℂ) := by sorry

/-- A convergent Mahler germ has a meromorphic continuation in normal form on the unit disc. -/
theorem exists_mahler_meromorphic {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m) :
    ∃ g : ℂ → ℂ, MeromorphicNFOn g (Metric.ball 0 1) ∧
      ∀ z : ℂ, ‖z‖ < min ρ 1 → g z = ∑' m, coeff m f * z ^ m := by sorry

open Classical in
/-- The continuation of a convergent q-Mahler germ, with removable singularities filled
and the normal-form value zero at poles; invalid data have value zero. -/
def mahlerMeromorphic (q : ℕ) (f : PowerSeries ℂ) : ℂ → ℂ :=
  if h : ∃ g : ℂ → ℂ, IsMahlerFunction q f ∧ MeromorphicNFOn g (Metric.ball 0 1) ∧
      ∃ ρ : ℝ, 0 < ρ ∧
        (∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m) ∧
        ∀ z : ℂ, ‖z‖ < min ρ 1 → g z = ∑' m, coeff m f * z ^ m
  then h.choose else 0

/-- The chosen continuation is in normal form and agrees with the original convergent germ. -/
theorem mahlerMeromorphic_spec {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m) :
    MeromorphicNFOn (mahlerMeromorphic q f) (Metric.ball 0 1) ∧
      ∀ z : ℂ, ‖z‖ < min ρ 1 → mahlerMeromorphic q f z = ∑' m, coeff m f * z ^ m := by sorry

/-- Normal-form continuations of the same Taylor germ agree throughout the unit disc. -/
theorem mahlerMeromorphic_unique {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m)
    (g : ℂ → ℂ) (hg : MeromorphicNFOn g (Metric.ball 0 1))
    (hgf : ∀ z : ℂ, ‖z‖ < min ρ 1 → g z = ∑' m, coeff m f * z ^ m) :
    Set.EqOn g (mahlerMeromorphic q f) (Metric.ball 0 1) := by sorry

/-- A summable Taylor value in the unit disc is a nonpole value of the continuation,
including on the Taylor convergence circle by Abel's theorem. -/
theorem mahlerMeromorphic_eq_tsum {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m)
    {α : ℂ} (hα : ‖α‖ < 1) (hsum : Summable fun m => coeff m f * α ^ m) :
    AnalyticAt ℂ (mahlerMeromorphic q f) α ∧
      mahlerMeromorphic q f α = ∑' m, coeff m f * α ^ m := by sorry

/-- A rational Mahler germ can have a nonpole value beyond its Taylor convergence disc. -/
example :
    mahlerMeromorphic 2 (PowerSeries.mk fun m => (2 : ℂ) ^ m) (3 / 4) = -2 ∧
      AnalyticAt ℂ (mahlerMeromorphic 2 (PowerSeries.mk fun m => (2 : ℂ) ^ m)) (3 / 4) ∧
      ¬ Summable (fun m : ℕ => (2 : ℂ) ^ m * (3 / 4 : ℂ) ^ m) := by sorry

/-- A holomorphic zero can be singular for its scalar Mahler system. -/
example :
    mahlerMeromorphic 2 ((1 - 2 * Polynomial.X : Polynomial ℂ) : PowerSeries ℂ) (1 / 2) = 0 ∧
      AnalyticAt ℂ (mahlerMeromorphic 2
        ((1 - 2 * Polynomial.X : Polynomial ℂ) : PowerSeries ℂ)) (1 / 2) ∧
      ¬ IsMahlerRegularPoint 2
        (!![(1 - 2 * RatFunc.X) / (1 - 2 * RatFunc.X ^ 2)] :
          Matrix (Fin 1) (Fin 1) (RatFunc ℂ)) (1 / 2) := by sorry

/-- Nishioka specialization for a convergent algebraic-coefficient Mahler system at
an algebraic regular point inside its initial convergence disc. -/
theorem nishioka {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hAalg : ∀ i j m, IsAlgebraic ℚ ((A i j).num.coeff m) ∧
      IsAlgebraic ℚ ((A i j).denom.coeff m)) (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((PowerSeries.subst (PowerSeries.X ^ q) (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (ρ : ℝ) (hρ : 0 < ρ) (hconv : ∀ i (z : ℂ), ‖z‖ < ρ → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hαρ : ‖α‖ < ρ) (hreg : IsMahlerRegularPoint q A α) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => ∑' m, coeff m (f i) * α ^ m)) =
      let E : IntermediateField (RatFunc ℂ) ℂ⸨X⸩ := IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩))
      letI : Algebra (RatFunc ℂ) E := E.toSubalgebra.algebra
      Algebra.trdeg (RatFunc ℂ) E := sorry

/-- At an algebraic regular point, homogeneous relations of meromorphic Mahler values
lift to polynomial functional relations of the same degree. -/
theorem mahler_homogeneous_lifting {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hAalg : ∀ i j m, IsAlgebraic ℚ ((A i j).num.coeff m) ∧
      IsAlgebraic ℚ ((A i j).denom.coeff m)) (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((PowerSeries.subst (PowerSeries.X ^ q) (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (ρ : ℝ) (hρ : 0 < ρ)
    (hconv : ∀ i (z : ℂ), ‖z‖ < ρ → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hreg : IsMahlerRegularPoint q A α)
    (P : MvPolynomial (Fin n) ℂ) (hPalg : ∀ e, IsAlgebraic ℚ (P.coeff e)) {d : ℕ}
    (hPhom : MvPolynomial.IsHomogeneous P d)
    (hP : MvPolynomial.eval (fun i => mahlerMeromorphic q (f i) α) P = 0) :
    ∃ Q : MvPolynomial (Fin n) (Polynomial ℂ),
      (∀ e j, IsAlgebraic ℚ ((Q.coeff e).coeff j)) ∧ MvPolynomial.IsHomogeneous Q d ∧
      MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom f Q = 0 ∧
      MvPolynomial.map (Polynomial.evalRingHom α) Q = P := sorry

/-- At an algebraic regular point, linear relations of meromorphic Mahler values
are evaluations of polynomial functional relations. -/
theorem mahler_linear_relation {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hAalg : ∀ i j m, IsAlgebraic ℚ ((A i j).num.coeff m) ∧
      IsAlgebraic ℚ ((A i j).denom.coeff m)) (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((PowerSeries.subst (PowerSeries.X ^ q) (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (ρ : ℝ) (hρ : 0 < ρ)
    (hconv : ∀ i (z : ℂ), ‖z‖ < ρ → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hreg : IsMahlerRegularPoint q A α) (lam : Fin n → ℂ)
    (hlam : ∀ i, IsAlgebraic ℚ (lam i)) (hrel : ∑ i, lam i * mahlerMeromorphic q (f i) α = 0) :
    ∃ c : Fin n → Polynomial ℂ, (∀ i j, IsAlgebraic ℚ ((c i).coeff j)) ∧
      ∑ i, (c i : PowerSeries ℂ) * f i = 0 ∧ ∀ i, (c i).eval α = lam i := sorry

/-- A summable Taylor value of a Mahler function is transcendental or lies in the
number field of its coefficients and argument, via nonpole value descent. -/
theorem mahler_value_transcendental_or_mem {q : ℕ} (hq : 2 ≤ q) {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1)
    (hconv : Summable fun m => coeff m f * α ^ m) (K : IntermediateField ℚ ℂ)
    (hK : FiniteDimensional ℚ K) (hαK : α ∈ K) (hfK : ∀ m, coeff m f ∈ K) :
    Transcendental ℚ (∑' m, coeff m f * α ^ m) ∨ (∑' m, coeff m f * α ^ m) ∈ K := sorry

/-- At any nonpole algebraic point of the punctured unit disc, a continued Mahler value
is transcendental or lies in the number field of the coefficients and argument. -/
theorem mahler_value_transcendental_or_mem_meromorphic {q : ℕ} {f : PowerSeries ℂ}
    (hf : IsMahlerFunction q f) {ρ : ℝ} (hρ : 0 < ρ)
    (hconv : ∀ z : ℂ, ‖z‖ < ρ → Summable fun m => coeff m f * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1)
    (hnonpole : AnalyticAt ℂ (mahlerMeromorphic q f) α) (K : IntermediateField ℚ ℂ)
    (hK : FiniteDimensional ℚ K) (hαK : α ∈ K) (hfK : ∀ m, coeff m f ∈ K) :
    Transcendental ℚ (mahlerMeromorphic q f α) ∨ mahlerMeromorphic q f α ∈ K := by sorry

/-- The series supported on powers of two is not a rational function. -/
theorem lacunary_not_rational :
    ¬ ∃ p r : Polynomial ℂ, r ≠ 0 ∧
      (r : PowerSeries ℂ) * PowerSeries.mk (fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) =
        (p : PowerSeries ℂ) := sorry

/-- Algebraic Mahler rationality upgrades Fredholm nonrationality to functional transcendence. -/
theorem transcendental_fredholm_function :
    Transcendental (RatFunc ℂ)
      ((PowerSeries.mk fun m => if ∃ k : ℕ, m = 2 ^ k then (1 : ℂ) else 0) : ℂ⸨X⸩) := by sorry

/-- Mahler (1929): `∑ α^{2ⁿ}` is transcendental for algebraic `0 < |α| < 1`. -/
theorem transcendental_fredholm {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    Transcendental ℚ (∑' n : ℕ, α ^ 2 ^ n) := sorry

/-- The normalized q-expansions of q,E₂,E₄,E₆ on the unit disc. -/
def modularQSeries (q : ℂ) : Fin 4 → ℂ :=
  ![q,
    1 - 24 * ∑' m : ℕ, ((∑ d ∈ m.divisors, d : ℕ) : ℂ) * q ^ m,
    1 + 240 * ∑' m : ℕ, ((∑ d ∈ m.divisors, d ^ 3 : ℕ) : ℂ) * q ^ m,
    1 - 504 * ∑' m : ℕ, ((∑ d ∈ m.divisors, d ^ 5 : ℕ) : ℂ) * q ^ m]

/-- The q-expansion interface agrees with the library normalization on the upper half-plane. -/
theorem modularQSeries_eq (τ : UpperHalfPlane) :
    modularQSeries (Function.Periodic.qParam 1 τ) =
      ![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :=
  by sorry

/-- Transport of Mathlib’s `Derivative.normalizedDerivOfComplex_E₂`,
`Derivative.normalizedDerivOfComplex_E₄` and `Derivative.normalizedDerivOfComplex_E₆`
through q=exp(2πiτ), with θ=q d/dq and analytic extension at q=0. -/
theorem ramanujanQEquations {q : ℂ} (hq : ‖q‖ < 1) :
    q * deriv (fun z => modularQSeries z 1) q =
      ((modularQSeries q 1) ^ 2 - modularQSeries q 2) / 12 ∧
    q * deriv (fun z => modularQSeries z 2) q =
      (modularQSeries q 1 * modularQSeries q 2 - modularQSeries q 3) / 3 ∧
    q * deriv (fun z => modularQSeries z 3) q =
      (modularQSeries q 1 * modularQSeries q 3 - (modularQSeries q 2) ^ 2) / 2 := by sorry

/-- A nonzero polynomial along the Ramanujan curve has order bounded by a fourth power of degree. -/
theorem modularZeroEstimate :
    ∃ C : ℝ, 0 < C ∧ ∀ P : MvPolynomial (Fin 4) ℂ, P ≠ 0 →
      analyticOrderAt (fun q => MvPolynomial.eval (modularQSeries q) P) 0 ≤
        (⌈C * (P.totalDegree : ℝ) ^ 4⌉₊ : ℕ∞) := by sorry

/-- Reserving half the monomial variables bounds the Siegel exponent by one and
supplies an integral kernel vector with logarithmic coefficient bound log 2+log(2NB). -/
theorem modularSiegelHalfNullity (d : ℕ) (hd : 1 ≤ d)
    (A : Matrix (Fin (((d + 4).choose 4) / 2)) (Fin ((d + 4).choose 4)) ℤ)
    {B : ℝ} (hB : 1 ≤ B) (hA : ∀ i j, |(A i j : ℝ)| ≤ B) :
    let N := (d + 4).choose 4
    let M := N / 2
    0 < M ∧ M < N ∧ (N : ℝ) / 2 ≤ (N - M : ℕ) ∧
      (M : ℝ) / (N - M : ℕ) ≤ 1 ∧
      ∃ v : Fin N → ℤ, v ≠ 0 ∧ (∀ i, ∑ j, A i j * v j = 0) ∧
        (∀ j, |(v j : ℝ)| ≤ 2 * (2 * N * B) ^ ((M : ℝ) / (N - M : ℕ))) ∧
        Real.log (⨆ j, |(v j : ℝ)|) ≤ Real.log 2 + Real.log (2 * N * B) := by sorry

/-- At degree two, the half-nullity monomial system has fifteen variables and seven equations. -/
example : (2 + 4).choose 4 = 15 ∧ ((2 + 4).choose 4) / 2 = 7 ∧
    (7 : ℝ) / (15 - 7) = 7 / 8 := by
  refine ⟨by decide, by decide, ?_⟩
  norm_num

/-- Integral auxiliary polynomials from a half-nullity system have controlled coefficients
and order comparable to d⁴. -/
theorem modularAuxiliaryPolynomial :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∃ d₀ : ℕ, ∀ d : ℕ, d₀ ≤ d → 2 ≤ d →
      ∃ P : MvPolynomial (Fin 4) ℤ, P ≠ 0 ∧ P.totalDegree ≤ d ∧
        Real.log (⨆ u ∈ P.support, |(P.coeff u : ℝ)|) ≤ C * d * Real.log d ∧
        (⌈c * (d : ℝ) ^ 4⌉₊ : ℕ∞) ≤
          analyticOrderAt (fun q => MvPolynomial.eval₂ (Int.castRingHom ℂ) (modularQSeries q) P) 0 ∧
        analyticOrderAt (fun q => MvPolynomial.eval₂ (Int.castRingHom ℂ) (modularQSeries q) P) 0 ≤
          (⌈C * (d : ℝ) ^ 4⌉₊ : ℕ∞) := by sorry

/-- The order of the coordinate polynomial q is one. -/
example : analyticOrderAt
    (fun q => MvPolynomial.eval (modularQSeries q) (MvPolynomial.X (0 : Fin 4))) 0 = 1 := by sorry

/-- The integral falling-factorial operator of order two is 144w(w−1), not 144w². -/
example (w : MvPolynomial (Fin 4) ℚ →ₗ[ℚ] MvPolynomial (Fin 4) ℚ)
    (P : MvPolynomial (Fin 4) ℚ) :
    (144 : ℚ) • (w ((w - (LinearMap.id : MvPolynomial (Fin 4) ℚ →ₗ[ℚ] MvPolynomial (Fin 4) ℚ)) P)) =
      (144 : ℚ) • (w (w P) - w P) := by sorry

/-- Nesterenko (1996): for `q = e^{2πiτ}`, three of `q, E₂(τ), E₄(τ), E₆(τ)` are algebraically
independent. -/
theorem nesterenko (τ : UpperHalfPlane) :
    ∃ s : Finset (Fin 4), s.card = 3 ∧ AlgebraicIndependent ℚ fun i : s =>
      (![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :
        Fin 4 → ℂ) i := sorry

/-- At i, E₂=3/π, E₆=0 and the Fourier parameter is exp(−2π). -/
theorem eisenstein_values_at_i :
    EisensteinSeries.E2 UpperHalfPlane.I = 3 / Real.pi ∧ ModularForm.E₆ UpperHalfPlane.I = 0 ∧
      Function.Periodic.qParam 1 (UpperHalfPlane.I : ℂ) = (Real.exp (-2 * Real.pi) : ℂ) := sorry

/-- The real numbers π and exp π are algebraically independent. -/
theorem algebraicIndependent_pi_exp_pi :
    AlgebraicIndependent ℚ ![Real.pi, Real.exp Real.pi] := sorry

section AlgebraicCartan

variable {C F : Type*} [Field C] [Field F] [Algebra C F] [CharZero C]

/-- Provides the unique C-linear Lie derivative on one-forms in the field specialization of
the supplied ordinary-form Cartan calculus, with its rule on a·db (Kirby §3.3, Lemma 3.2). -/
theorem exists_lieDerivativeOneForm (D : Derivation C F F) :
    ∃! L : Ω[F⁄C] →ₗ[C] Ω[F⁄C], ∀ a b : F,
      L (a • KaehlerDifferential.D C F b) =
        D a • KaehlerDifferential.D C F b + a • KaehlerDifferential.D C F (D b) := sorry

/- The ordinary differential and its laws are supplied by DerivedDeRhamCohomology
§§2.1–2.11: DeRham.Forms, DeRham.d, DeRham.d_elementary, DeRham.d_unique,
DeRham.d_squared and DeRham.d_leibniz. The joint-import target
lieDerivativeOneForm_eq_cartan uses that imported DeRham.d C F, contraction by
Derivation.liftKaehlerDifferential D, and exteriorPower.zeroEquiv/oneEquiv.
It identifies the unique map above with i_D d_1 + d_0 i_D on degree one.
No local ordinary differential is defined here. -/

end AlgebraicCartan

/- The exponential-case geometric construction contracts are owned by README §5.6:
axConstantFieldClosure extends the derivations to an algebraic closure, identifies its
common constants and transports differentials, independence, transcendence degree and rank.
axGeneratedSubgroupForms supplies finite-product generation and vanishing-form transport
on the native affine group and Kähler carriers. axAdditiveTorusSeparation supplies the
vector/torus splitting. ReductiveGroups Layers 0, 3 and 4 supply group/subgroup carriers
and the diagonalizable anti-equivalence used to extract integral characters. -/

/-- A nonzero constant monomial value and the exponential differential equations put the
corresponding integral sum of arguments in the common constant field. -/
theorem axTorusCharacterRelation {F : Type*} [Field F] [CharZero F] {k : ℕ}
    (D : Fin k → Derivation ℤ F F) (C : Subfield F)
    (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ} (x y : Fin n → F)
    (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (z : Fin n → ℤ) (a : C) (ha : (a : F) ≠ 0)
    (hcharacter : ∏ i, y i ^ z i = (a : F)) :
    (∑ i, (z i : F) * x i) ∈ C := by sorry

/-- A nonzero common-constant relation between logarithmic-minus-exact one-forms gives a
nonzero integral relation between arguments modulo constants, over arbitrary constants. -/
theorem axIntegerRelation {F : Type*} [Field F] [CharZero F] {k : ℕ}
    (D : Fin k → Derivation ℤ F F) (C : Subfield F)
    (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ} (x y : Fin n → F)
    (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (c : Fin n → C) (hc : c ≠ 0)
    (hrelation : ∑ i, (c i : F) •
      ((y i)⁻¹ • KaehlerDifferential.D C F (y i) - KaehlerDifferential.D C F (x i)) = 0) :
    ∃ z : Fin n → ℤ, z ≠ 0 ∧ (∑ i, (z i : F) * x i) ∈ C := by sorry

/-- Ax–Schanuel over an arbitrary common constant field, using constant-form dependence,
integral-character extraction and algebraic-closure descent. -/
theorem ax_schanuel {F : Type*} [Field F] [CharZero F] {k : ℕ} (D : Fin k → Derivation ℤ F F)
    (C : Subfield F) (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ} (x y : Fin n → F)
    (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (hlin : ∀ z : Fin n → ℚ, (∑ i, (z i : F) * x i) ∈ C → z = 0) :
    ((n + (Matrix.of fun j i => D j (x i)).rank : ℕ) : Cardinal) ≤
      Algebra.trdeg C (IntermediateField.adjoin C (Set.range x ∪ Set.range y)) := sorry

/-- Ax–Schanuel for formal power series in one variable. -/
theorem ax_schanuel_powerSeries {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f) :
    ((n + 1 : ℕ) : Cardinal) ≤
      Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f ∪ Set.range fun i => (exp ℂ).subst (f i))) :=
  sorry

/-- For independent zero-constant formal arguments, the sum of argument and exponential transcendence degrees is at least n+1. -/
theorem weak_ax_schanuel_powerSeries {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f) :
    ((n + 1 : ℕ) : Cardinal) ≤ Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) +
      Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range fun i => (exp ℂ).subst (f i))) := sorry

/-- Ax–Lindemann–Weierstrass: if the `fᵢ` generate a field of transcendence degree one (an
algebraic curve germ) and are `ℚ`-linearly independent, their exponentials are algebraically
independent. -/
theorem ax_lindemann_weierstrass {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f)
    (hcurve : Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) = 1) :
    AlgebraicIndependent ℂ fun i => (exp ℂ).subst (f i) := sorry

/-- Layer 5 notation for Schanuel’s proposition from Layer 3. -/
abbrev SchanuelConjecture : Prop := Transcendence.SchanuelConjecture

/-- The conjecture on algebraic independence of logarithms of algebraic numbers. -/
def LogarithmsAlgebraicIndependenceConjecture : Prop :=
  ∀ (n : ℕ) (ℓ : Fin n → ℂ), (∀ i, IsAlgebraic ℚ (Complex.exp (ℓ i))) →
    LinearIndependent ℚ ℓ → AlgebraicIndependent ℚ ℓ

/-- The Schanuel inequality holds unconditionally for algebraic arguments (Lindemann–Weierstrass, Layer 3). -/
theorem schanuel_inequality_of_isAlgebraic (n : ℕ) (z : Fin n → ℂ)
    (hz : ∀ i, IsAlgebraic ℚ (z i)) (hlin : LinearIndependent ℚ z) :
    (n : Cardinal) ≤
      Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range z ∪ Set.range (Complex.exp ∘ z))) :=
  sorry

/-- Unit test `SchanuelConjecture.test_hermite`: For n = 1, z = 1 the inequality says e is
transcendental, which holds unconditionally. -/
example : ((1 : ℕ) : Cardinal) ≤ Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range (fun _ : Fin 1 => (1 : ℂ)) ∪ Set.range (Complex.exp ∘ fun _ : Fin 1 => (1 : ℂ)))) :=
  sorry

/-- Unit test `SchanuelConjecture.test_dependent`: For the ℚ-dependent z = (1, 2): trdeg ℚ(1, 2, e,
e²) = 1 < 2; dropping linear independence makes the statement false. -/
example : Algebra.trdeg ℚ (IntermediateField.adjoin ℚ
    (Set.range ![(1 : ℂ), 2] ∪ Set.range (Complex.exp ∘ ![(1 : ℂ), 2]))) = 1 := sorry

/-- The case n = 1 holds unconditionally (a nonzero logarithm of an algebraic number is transcendental). -/
theorem logarithmsConjecture_one (ℓ : Fin 1 → ℂ) (hℓ : IsAlgebraic ℚ (Complex.exp (ℓ 0)))
    (hlin : LinearIndependent ℚ ℓ) : AlgebraicIndependent ℚ ℓ := sorry

/-- Unit test `LogarithmsAlgebraicIndependenceConjecture.test_dependent`: log 2 and log 4 are
algebraically dependent, so ℚ-linear independence cannot be dropped. -/
example : ¬ AlgebraicIndependent ℚ ![(Real.log 2 : ℂ), (Real.log 4 : ℂ)] := sorry

/-- Unit test `LogarithmsAlgebraicIndependenceConjecture.test_log2_log3`: The conjecture implies
that log 2 and log 3 are algebraically independent. -/
example (h : LogarithmsAlgebraicIndependenceConjecture) :
    AlgebraicIndependent ℚ ![(Real.log 2 : ℂ), (Real.log 3 : ℂ)] := sorry

/-- SchanuelConjecture → e and π algebraically independent. -/
theorem algebraicIndependent_e_pi_of_schanuel (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![Real.exp 1, Real.pi] := sorry

/-- Schanuel's conjecture implies it. -/
theorem logarithmsConjecture_of_schanuel (h : SchanuelConjecture) :
    LogarithmsAlgebraicIndependenceConjecture := by sorry
end DiophantineApproximation

/- The supplier contract of §0.0 uses hermitian_gram_hadamard.
The construction targets specified with full mathematical hypotheses in the README are:
adelicSymmetricPowerHeight, absoluteBinarySmallBasis, absoluteAdelicMinima,
absoluteMinimaRealScales, absoluteCompoundGapData,
smallHeightHyperplaneSeparation, finiteRankHeightPacking, unitEquationHeightAssembly,
finiteRankUnitEquationReduction, ramanujanDProperty,
modularValueDerivativeSelection and modularValueIndependenceCriterion.
The differential-Galois construction targets are picardVessiotAnalyticComparison,
picardVessiotFixedField, eFunction_identityOrbit_span, picardVessiotConjugateCompositum,
identityComponent_projection_surjective and eFunction_conjugate_zero_transfer.
Their field, constant, analytic-germ, orbit and compositum hypotheses are specified in §5.4.
The coefficient product norm in the compound theorem uses the same
compoundDerivativeCoeff expansion for every order, with value zero for a zero derivative. -/

/- The README also specifies absoluteTwistedHeight, absoluteHeight2,
absoluteSuccessiveInfimum, absoluteInfimumSpace, absoluteTwistedFiltration,
absoluteDavenportBasis, absoluteExceptionalSubspaceDescends,
absolutePerturbedUnitEquation, absoluteMinkowskiSecondTheorem, absoluteGapPrinciple,
absoluteFiltrationAsymptotics, absoluteAlgebraicSystemTransport,
absoluteSubspaceTheoremForSystems, absoluteSystemIntervalRefinement,
absoluteParametricSubspaceTheorem,
absoluteIntervalSemistable, absoluteIntervalResult,
formalLaplaceOperatorTransfer, IsApparentSingularity,
algebraicCartanDegreeShift and axSchanuelMultivariateSeries.
Their full signatures use the place-extension, analytic solution-basis and graded
algebraic differential-form constructions of Layers 2 and 5. -/

/-
Construction contracts with their mathematical hypotheses, normalization, source locators
and checks are specified in the README:

§2.5: plucker_reindex, subspaceHeight_reindex; the relative Euclidean logarithm,
affine scalar height, projective descent and bounded-degree Plücker finiteness.

§2.6: binaryIndexLoci, binaryIntersectionMultiplicity, binaryPersistentComponent,
binaryProjectionMultidegrees, binaryArithmeticCycleHeight,
binaryArithmeticIntersectionBound and binaryIndexHeightObstruction.
These construct the sharp binary estimate before hyperplane and grid nonvanishing.

§2.8: siegelProductBallSlice, siegelBasisExtraction, siegelKernelBasis,
siegelRelativeKernelBasis and siegelCoefficientConditions.

§3.6: waldschmidtInterpolationData, waldschmidtInterpolationRank,
waldschmidtDeterminantBounds, waldschmidtParameterChoice, matveevAuxiliaryData,
matveevArithmeticExtrapolation, matveevMultiplicityEstimate, matveevParameterChoice
and twoLogInterpolationEstimate.

§3.7: yuLocalEstimates, yuOneFactorBound, yuAuxiliaryConstruction,
yuQuantitativeExtrapolation, yuKummerDescent, yuParameterChoice and yuValuationAdapter.
-/

/-
The complete definition APIs and construction contracts are specified in the README.
The following proposed names belong to those contracts; they are not declarations
in this file. Their hypotheses, source locators and checks are in the named subsections.

§0.6:
BadlyApproximable.add_ratCast, BadlyApproximable.not_liouville, BadlyApproximable.ratCast_mul

§2.1:
InGeneralPosition.comp_injective, InGeneralPosition.comp_matrix,
inGeneralPosition_iff_linearIndependent, inGeneralPosition_two_iff

§5.2:
IsEFunction.exists_numberField, IsEFunction.map_ringEquiv, ePowerSeries_hurwitzMul

§2.3:
IsNondegenerateHomogeneousSolution.ne_zero, IsNondegenerateSolution.ne_zero,
IsNondegenerateSolution.subsum_ne_zero, IsNondegenerateSolution.sum_eq_one,
Polynomial.nodup_roots, isNondegenerateHomogeneousSolution_iff_cons,
isNondegenerateSolution_of_subsingleton

§2.4:
LinearRecurrence.IsNondegenerate.not_isOfFinOrder_div, LinearRecurrence.IsNondegenerate.of_dvd,
LinearRecurrence.IsNondegenerate.root_ne_zero, LinearRecurrence.isNondegenerate_iff_pow,
LinearRecurrence.isNondegenerate_of_order_le_one,
MvPolynomial.vanishingIdeal_zeroLocus_eq_radical

§5.7:
LogarithmsAlgebraicIndependenceConjecture.transcendental_div

§2.7:
MvPolynomial.blockHomogenize_C, MvPolynomial.blockHomogenize_add,
MvPolynomial.blockHomogenize_degree_zero, MvPolynomial.blockHomogenize_map,
MvPolynomial.blockHomogenize_monomial, MvPolynomial.blockHomogenize_one,
MvPolynomial.blockHomogenize_smul, MvPolynomial.blockHomogenize_zero,
MvPolynomial.rename_blockHomogenize_unique

§1.2:
MvPolynomial.degreeOf_hasseDeriv_le, MvPolynomial.factorial_smul_hasseDeriv_single,
MvPolynomial.hasseDeriv_eq_zero_of_degreeOf_lt, MvPolynomial.hasseDeriv_monomial,
MvPolynomial.hasseDeriv_zero, MvPolynomial.weightedIndex_eq_zero_iff,
MvPolynomial.weightedIndex_map, MvPolynomial.weightedIndex_ne_top,
MvPolynomial.weightedIndex_zero

§1.4:
MvPolynomial.genWronskian_fin_one,
MvPolynomial.genWronskian_fin_zero, MvPolynomial.genWronskian_single_toMvPolynomial,
MvPolynomial.map_genWronskian, Polynomial.hasseWronskian_comp_perm,
Polynomial.hasseWronskian_fin_one,
Polynomial.hasseWronskian_fin_two, Polynomial.hasseWronskian_fin_zero,
Polynomial.hasseWronskian_map, Polynomial.prod_factorial_mul_hasseWronskian

§1.3:
MvPolynomial.logHeight_C, MvPolynomial.logHeight_C_mul, MvPolynomial.logHeight_eq_of_numberField,
MvPolynomial.logHeight_nonneg, MvPolynomial.logHeight_rename, MvPolynomial.logHeight_zero,
Polynomial.logHeight_C_mul, Polynomial.logHeight_X_sub_C, Polynomial.logHeight_nonneg,
Polynomial.logHeight_zero

§5.4:
MvPolynomial.ringKrullDim_of_isNoetherianRing

§3.3:
NumberField.house.exists_ne_zero_int_vec_house_le, house_pow_le

§0.5:
Polynomial.card_roots', algebraicApproximationExponent_mono, irrationalityExponent_add_ratCast,
irrationalityExponent_neg, irrationalityExponent_ratCast, irrationalityExponent_ratCast_mul,
mahlerExponent_mono, simultaneousExponent_eq_top_of_forall_rat, simultaneousExponent_le_comp

§1.1:
Polynomial.l1Norm_C, Polynomial.l1Norm_eq_sum_range, Polynomial.l1Norm_eq_zero_iff,
Polynomial.l1Norm_le_mul_supNorm, Polynomial.l1Norm_monomial, Polynomial.l1Norm_neg,
Polynomial.l1Norm_nonneg, Polynomial.l1Norm_zero, Polynomial.mahlerMeasure_le_l1Norm,
Polynomial.norm_coeff_le_l1Norm, Polynomial.supNorm_le_l1Norm, hasseDeriv_coeff, hasseDeriv_mul,
mahlerMeasure_le_sum_norm_coeff

§3.8:
SchanuelConjecture.le_trdeg

§4.1:
boundedDivisors_mul_unit, boundedDivisors_subset_dvd

§2.5:
coordForms_apply, coordForms_independent, deltaL_coords, deltaL_pos, localWeight_bot,
localWeight_top, subspaceHeight_bot, subspaceHeight_span_singleton, subspaceHeight_top,
twistedHeight_comp, twistedHeight_one, twistedHeight_pos, twistedHeight_shift,
twistedHeight_smul, twistedHeight_zero, weightRatio_eq_of_local_sum_zero, weight_bot, weight_top

§5.1:
dfiniteOrder_eq_zero_iff, dfiniteOrder_le, isDFinite_polynomial

§3.2:
expEval_algebraMap, expEval_apply, expEval_mul, expEval_single, galConj_prod_galConj,
galConj_refl, galConj_single, galConj_trans

§3.1:
hermiteIntegral_C, hermiteIntegral_add, hermiteIntegral_smul, hermiteIntegral_zero_right,
house_nat_mul

§0.2:
house_add_le, house_eq_of_minpoly_eq, house_eq_sup', house_le_mahlerMeasure, house_map,
house_mul_le, house_nonneg, house_pow, house_ratCast, mahlerMeasure_eq_leadingCoeff_mul_prod,
mahlerMeasure_eq_leadingCoeff_mul_prod_roots, mahlerMeasure_eq_of_minpoly_eq, mahlerMeasure_inv,
mahlerMeasure_le_leadingCoeff_mul_max_one_house_pow,
mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm, mahlerMeasure_le_sqrt_sum_sq_norm_coeff,
mahlerMeasure_map, mahlerMeasure_ratCast

§2.8:
kernelLattice_covolume

§5.5:
mahler_iterate_independent, mahler_function_field_regular, mahler_orbit_relation_matrix,
mahler_auxiliary_relation_identity, mahler_monomial_dimension_growth, relationIdeal_specialization,
mahler_local_relation_lifting, mahler_relation_transport, mahler_polynomial_relation_basis,
mahler_remove_system_poles, mahler_regular_system_extension,
isMahlerFunction_of_polynomial, isMahlerRegularPoint_iff, isMahlerRegularPoint_of_polynomial

§3.4:
differentiable_mDeriv, mDeriv_add, mDeriv_add_single, mDeriv_exp_dotProduct, mDeriv_monomial_mul_exp, mDeriv_zero

§0.3:
mahlerMeasure_mul

§0.1:
naiveHeight_eq_iSup, naiveHeight_eq_of_minpoly_eq, naiveHeight_intCast, naiveHeight_inv,
naiveHeight_map, primitiveMinpoly_dvd_iff, primitiveMinpoly_eq_minpoly_int,
primitiveMinpoly_eq_of_minpoly_eq, primitiveMinpoly_map, primitiveMinpoly_of_not_isAlgebraic
-/

end

end TauCetiRoadmap.DiophantineApproximationAndTranscendence
