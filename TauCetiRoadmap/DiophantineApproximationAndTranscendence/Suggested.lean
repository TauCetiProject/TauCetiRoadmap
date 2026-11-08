import Mathlib
import TauCeti.Algebra.LinearRecurrence.Nondegenerate
import TauCeti.LinearAlgebra.LinearIndependent.GeneralPosition
import TauCeti.NumberTheory.DiophantineApproximation.Dirichlet
import TauCeti.NumberTheory.DiophantineApproximation.Exponent
import TauCeti.NumberTheory.DiophantineApproximation.Kronecker
import TauCeti.NumberTheory.DiophantineApproximation.Roth.BinaryForm
import TauCeti.NumberTheory.DiophantineApproximation.Roth.Theorem
import TauCeti.NumberTheory.DiophantineApproximation.Thue.GapPrinciple
import TauCeti.NumberTheory.Height.Absolute
import TauCeti.NumberTheory.Height.Arakelov.Basic
import TauCeti.NumberTheory.Height.House
import TauCeti.NumberTheory.Height.MahlerMeasure
import TauCeti.NumberTheory.Height.Naive
import TauCeti.NumberTheory.Height.ProjectiveTuple
import TauCeti.NumberTheory.Height.Twisted.Basic
import TauCeti.NumberTheory.Height.Twisted.Determinant
import TauCeti.NumberTheory.NumberField.Global.Places.Extension
import TauCeti.NumberTheory.Transcendental.AlgebraicLogs
import TauCeti.NumberTheory.Transcendental.GelfondSchneider.Theorem
import TauCeti.NumberTheory.Transcendental.Lindemann.Theorem
import TauCeti.NumberTheory.UnitEquation.Nondegenerate
import TauCeti.RingTheory.Polynomial.HasseWronskian
import TauCeti.RingTheory.PowerSeries.DFinite

/-!
# DiophantineApproximationAndTranscendence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need. The README carries every construction, API list and Check.

The definitions of Layers 0–2 below (approximation exponents, the weighted index, polynomial and
matrix heights, absolute, affine, Euclidean and subspace heights, general position and
nondegenerate solutions) are carriers that the target signatures of the SubspaceTheorem and
HeightsAndUnits roadmaps import from this file; several have equal Tau Ceti counterparts, which
the headline statements below use where no importing roadmap depends on the local name.

Headline theorems that the pinned Tau Ceti already proves are not restated: they are pinned below
by `#check`. These are bounded-degree Northcott finiteness, Kronecker's theorem on Mahler measure
one, the den/house lower bound, Dirichlet's theorem for systems of linear forms, Kronecker's
approximation theorem, the almost-everywhere irrationality exponent, Roth's theorem in its real and
complex forms, the Thue–Roth inequality for binary forms, Thue's approximation and Thue-equation
theorems, the Lindemann–Weierstrass theorem in both forms and the real Gelfond–Schneider theorem.

Headline theorems of the README that are not statable at the pins, and what each lacks:
* the effectivity of the Layer 4 bounds (a computable constant) is not expressible in a `Prop`; the
  Layer 4 statements below give the explicit exponent bounds that carry it;
* the Picard–Vessiot and differential-Galois comparisons of README §5.4 need a Picard–Vessiot
  extension and its differential Galois group, which neither library has;
* the generated-subgroup and torus-separation statements of README §5.6 need algebraic subgroups
  of `Gₐⁿ × Gₘⁿ` with their character lattices, which neither library has;
* the absolute (`ℚ̄`-rational) forms of the parametric Subspace theorem in README §2.5 need the
  twisted height on `ℚ̄ⁿ`, which neither library has; the `K`-rational forms are stated below.
-/

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendence

/-! Headline theorems proved in the pinned Tau Ceti. -/

#check @TauCeti.finite_setOf_absMulHeight₁_le
#check @TauCeti.mahlerMeasure_eq_one_iff
#check @TauCeti.inv_norm_le_natDenominator_pow_mul_house_pow
#check @Matrix.dirichlet_linearForms
#check @TauCeti.kronecker_approximation
#check @TauCeti.ae_irrationalityExponent_eq_two
#check @IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg
#check @IsAlgebraic.exists_pos_mul_mulHeight₁_rpow_neg_le_norm_sub
#check @MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval
#check @TauCeti.thue_approximation_real
#check @MvPolynomial.IsHomogeneous.finite_setOf_eval_eq_of_three_le_card_roots
#check @TauCeti.linearIndependent_exp
#check @TauCeti.algebraicIndependent_exp
#check @TauCeti.transcendental_rpow

noncomputable section

open Polynomial NumberField Filter
open scoped ENNReal NNReal Topology

/-! ## Layer 0: heights and approximation exponents -/

namespace DiophantineApproximation

/-- The irrationality exponent `μ(ξ) ∈ [1, ∞]`: the supremum of the `p` with
`LiouvilleWith p ξ` (README §0.5). The target signatures of the SubspaceTheorem roadmap use this
carrier. -/
def irrationalityExponent (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (p : ℝ) (_ : LiouvilleWith p ξ), ENNReal.ofReal p

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

/-- The exponent `w*_n(ξ)` of approximation by algebraic numbers of degree at most `n`,
measured with the naive height (Bugeaud, Definition 2.1). -/
def algebraicApproximationExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  ⨆ (w : ℝ) (_ : {α : ℂ | IsAlgebraic ℚ α ∧ (minpoly ℚ α).natDegree ≤ n ∧
      0 < ‖(ξ : ℂ) - α‖ ∧ ‖(ξ : ℂ) - α‖ ≤ TauCeti.naiveHeight α ^ (-w - 1)}.Infinite),
    ENNReal.ofReal w

open Classical in
/-- The absolute projective height of a finite tuple in a characteristic-zero field: the relative
height in the number field generated by the coordinates, with its degree root (README §0.2). The
zero tuple has value one, and a tuple with a transcendental coordinate has junk value one. The
HeightsAndUnits target signatures use this carrier. -/
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

/-- The absolute affine logarithmic height of an algebraic tuple is `log H(1, x)` (README §2.4). -/
def absoluteLogHeightAff {n : ℕ} (x : Fin n → AlgebraicClosure ℚ) : ℝ :=
  Real.log (absoluteProjectiveTupleHeight (Fin.cons 1 x))

end DiophantineApproximation

/-! ## Layer 1: auxiliary polynomials and Roth’s theorem -/

namespace DiophantineApproximation

/-- The sum `∑ₖ b^(-3^(k+1))` is transcendental for every integer base `b ≥ 2`: its partial sums
approximate it to an order exceeding Roth's exponent (E19, ch. 6, Exercise 6.5). -/
theorem transcendental_tsum_inv_pow_three_pow (b : ℕ) (hb : 2 ≤ b) :
    Transcendental ℚ (∑' k : ℕ, ((b : ℝ)⁻¹) ^ (3 ^ (k + 1))) := sorry

/-- The relative height of a matrix is the projective height of its entries, rather than of its
maximal minors (README §1.3). -/
def matrixMulHeight {K m n : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Finite m] [Finite n] (A : Matrix m n K) : ℝ :=
  Height.mulHeight (fun ij : m × n ↦ A ij.1 ij.2)

end DiophantineApproximation

namespace MvPolynomial

/-- The divided (Hasse) partial derivative `∂^d`, sending `X^m` to
`(∏ⱼ (mⱼ choose dⱼ)) X^(m - d)` (Pottmeyer, (2.34)). -/
noncomputable def hasseDeriv {R σ : Type*} [CommSemiring R] (d : σ →₀ ℕ) :
    MvPolynomial σ R →ₗ[R] MvPolynomial σ R :=
  (Finsupp.lsum R fun m : σ →₀ ℕ =>
    (d.prod fun j dj => ((m j).choose dj : R)) •
      (_root_.MvPolynomial.monomial (m - d) : R →ₗ[R] MvPolynomial σ R)).comp
    (AddMonoidAlgebra.coeffLinearEquiv R).toLinearMap

/-- The index of `P` at the point `a` with respect to the weights `r` (Pottmeyer, Definition
2.6.2): the least value of `∑ⱼ iⱼ / rⱼ` over the `i` with `(∂^i P)(a) ≠ 0`; it is `⊤` at `P = 0`. -/
noncomputable def weightedIndex {R σ : Type*} [CommRing R] (r : σ → ℕ) (a : σ → R)
    (P : MvPolynomial σ R) : ℝ≥0∞ :=
  ⨅ (i : σ →₀ ℕ) (_ : _root_.MvPolynomial.eval a (hasseDeriv i P) ≠ 0),
    ∑ j ∈ i.support, ((i j : ℝ≥0∞) / (r j : ℝ≥0∞))

/-- The relative projective height of a multivariate polynomial is its coefficient height. -/
noncomputable def mulHeight {σ K : Type*} [Field K] [Height.AdmissibleAbsValues K]
    (P : MvPolynomial σ K) : ℝ :=
  Finsupp.mulHeight P.coeff

/-- The logarithm of the relative multiplicative coefficient height. -/
noncomputable def logHeight {σ K : Type*} [Field K] [Height.AdmissibleAbsValues K]
    (P : MvPolynomial σ K) : ℝ :=
  Real.log (mulHeight P)

end MvPolynomial

namespace WronskianBounds

/-- The degree estimate for a nonzero Hasse Wronskian over any field: the Wronskian has degree at
most the sum of the degrees of the family minus `0 + 1 + ⋯ + (ℓ - 1)`, because the `k`-th Hasse
derivative lowers the degree by at least `k` (derived in README §1.4 from the Leibniz expansion of
the determinant; Mathlib's `Polynomial.natDegree_wronskian_lt_add` is the case `ℓ = 2`). -/
theorem natDegree_add_derivative_orders_le {K : Type*} [Field K] {ℓ : ℕ}
    (g : Fin ℓ → K[X]) (hg : Polynomial.hasseWronskian g ≠ 0) :
    (Polynomial.hasseWronskian g).natDegree + ∑ k : Fin ℓ, (k : ℕ) ≤
      ∑ j, (g j).natDegree := by
  sorry

/-- The summed multiplicity bound for a polynomial space `V` of dimension `ℓ` over a field of
characteristic zero: for distinct points `a ∈ S` and nonzero members `f a ∈ V`, the excesses
`(mult_a (f a) + 1) - ℓ` sum to at most the degree of the Hasse Wronskian of any basis of `V`
(derived in README §1.4; characteristic zero makes that Wronskian nonzero). -/
theorem sum_multiplicity_lower_bounds_le_natDegree {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b : Module.Basis (Fin ℓ) K V)
    (S : Finset K) (f : K → V) (hf : ∀ a ∈ S, f a ≠ 0) :
    ∑ a ∈ S, (((f a : K[X]).rootMultiplicity a + 1) - ℓ) ≤
      (Polynomial.hasseWronskian (fun j => (b j : K[X]))).natDegree := by
  sorry

end WronskianBounds

/-! ## Layer 2: subspace theorems and multiplicative groups -/

open Matrix TauCeti.GlobalNumberFields

namespace DiophantineApproximation

/-- Plücker coordinates on the native finite-subset index: the maximal minors in increasing
column order, over any commutative ring. -/
def plucker {R ι : Type*} [CommRing R] [Fintype ι] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → R) : Set.powersetCard ι p → R :=
  fun s ↦ Matrix.det (Matrix.of fun i j ↦ x i (Set.powersetCard.ofFinEmbEquiv.symm s j))

/-- The relative sup height of a subspace `T ≤ K^ι` over a field with admissible absolute
values: the height of the Plücker vector of a basis of `T`. That vector is nonzero, so this is the
height of the Plücker point of `T`; it does not depend on the basis, and the zero subspace has
the empty minor `1` and height `1` (README §2.5). -/
def relativeSubspaceHeight {K ι : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Fintype ι] [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  Height.mulHeight (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K))

/-- The absolute Euclidean height `H₂` of a `K`-rational vector: Euclidean norms at the infinite
places and max norms at the finite places, with degree-normalized exponents. The zero vector has
value zero (README §2.5). -/
def height2 {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] (y : ι → K) : ℝ :=
  (∏ w : InfinitePlace K,
      (∑ i, ‖w.embedding (y i)‖ ^ 2) ^ ((w.mult : ℝ) / (2 * Module.finrank ℚ K))) *
    ∏ᶠ v : FinitePlace K, (⨆ i, v (y i)) ^ ((1 : ℝ) / Module.finrank ℚ K)

open Classical in
/-- The relative Euclidean projective height, with the projective value one at zero. -/
def arakelovMulHeight {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]
    (y : ι → K) : ℝ :=
  if y = 0 then 1 else height2 y ^ Module.finrank ℚ K

/-- The relative Euclidean height of a subspace, from the same Plücker coordinates as the sup
height. -/
def relativeSubspaceArakelovHeight {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]
    [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  arakelovMulHeight (plucker fun i ↦ ((Module.finBasis K T i : T) : ι → K))

/-- The absolute Euclidean subspace height is the degree root of the relative Plücker height;
the zero and the whole subspace both have height one. -/
def subspaceHeight {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]
    (T : Submodule K (ι → K)) : ℝ :=
  relativeSubspaceArakelovHeight T ^ ((Module.finrank ℚ K : ℝ)⁻¹)

/-- A family of linear forms (coefficient vectors) is in general position if every
`n`-element subfamily is linearly independent. -/
def InGeneralPosition {F ι : Type*} [Field F] {n : ℕ} (L : ι → Fin n → F) : Prop :=
  ∀ s : Finset ι, s.card = n → LinearIndependent F (fun i : s ↦ L i)

/-- A nondegenerate solution of `Σ αᵢ xᵢ = 1`: no nonempty subsum vanishes. -/
def IsNondegenerateSolution {K ι : Type*} [Field K] [Fintype ι] (α x : ι → K) : Prop :=
  ∑ i, α i * x i = 1 ∧ ∀ I : Finset ι, I.Nonempty → ∑ i ∈ I, α i * x i ≠ 0

/-- A nondegenerate solution of `Σ αᵢ xᵢ = 0`: no proper nonempty subsum vanishes. -/
def IsNondegenerateHomogeneousSolution {K ι : Type*} [Field K] [Fintype ι] (α x : ι → K) :
    Prop :=
  ∑ i, α i * x i = 0 ∧
    ∀ I : Finset ι, I.Nonempty → I ≠ Finset.univ → ∑ i ∈ I, α i * x i ≠ 0

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

/-- `Layer 2 s unit equation finiteness` (Evertse Theorem 8.13). -/
theorem finite_nondegenerate_solutions {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (α : Fin n → K) (hα : ∀ i, α i ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | IsNondegenerateSolution α (fun i ↦ ((x i : Kˣ) : K))}.Finite := by
  sorry

/-- `Layer 2 uniform bound nondegenerate solutions` (Evertse–Schlickewei–Schmidt Theorem 1.1). -/
theorem card_nondegenerate_solutions_le {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (Γ : Subgroup (Fin n → Kˣ)) (r : ℕ) (hΓ : Module.rank ℤ (Additive Γ) ≤ r)
    (a : Fin n → Kˣ) (M : Finset (Fin n → Kˣ))
    (hM : ∀ x ∈ M, x ∈ Γ ∧ IsNondegenerateSolution (fun i ↦ (a i : K)) (fun i ↦ (x i : K))) :
    (M.card : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n) * (r + 1)) := by
  sorry

/-- `Layer 2 skolem mahler lech simple roots`, recurrence form. -/
theorem skolem_mahler_lech_simple (E : _root_.LinearRecurrence ℂ)
    (hE : LinearRecurrence.IsNondegenerate E) (hsep : E.charPoly.Separable) (u : ℕ → ℂ)
    (hu : E.IsSolution u) (hu₀ : u ≠ 0) : {h : ℕ | u h = 0}.Finite := by
  sorry

/-- `Layer 2 uniform bound zeros simple recurrence`, non-degenerate case. -/
theorem ncard_zeros_simple_recurrence_le {K : Type*} [Field K] [IsAlgClosed K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (α i / α j)) :
    {m : ℤ | ∑ i, a i * α i ^ m = 0}.Finite ∧
      ({m : ℤ | ∑ i, a i * α i ^ m = 0}.ncard : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) := by
  sorry

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

section TwistedHeight

variable {K : Type*} [Field K] [NumberField K] {n : ℕ}

/-- The conditions (2.4)–(2.9) on `(L, c)`. -/
structure IsTwistedData (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) : Prop where
  two_le : 2 ≤ n
  linearIndependent : ∀ v, LinearIndependent K (L v)
  finite_forms : (Set.range L).Finite
  finite_support : {v | c v ≠ 0}.Finite
  sum_eq_zero : ∀ v, ∑ i, c v i = 0
  sum_max_le_one : ∑ᶠ v, (⨆ i, c v i) ≤ 1

/-- `Layer 2 parametric subspace theorem` (Evertse–Ferretti Theorem 2.1), `K`-rational and
qualitative in `Q_0`. -/
theorem parametric_subspace_theorem (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R) :
    ∃ (Q₀ : ℝ) (T : Finset (Submodule K (Fin n → K))), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 6 * 2 ^ (2 * n) * (n : ℝ) ^ 10 * δ ^ (-3 : ℝ) *
        Real.log (3 * R / δ) * Real.log (Real.log (3 * R) / δ) ∧
      ∀ Q, Q₀ ≤ Q → ∃ V ∈ T,
        {x | TauCeti.twistedHeight L c Q x ≤ TauCeti.deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ V := by
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

end TwistedHeight

end DiophantineApproximation

/-! ## Layer 3: transcendence and logarithmic forms -/

section Transcendence

open Complex

namespace Transcendence

/-- **The Hermite–Lindemann theorem** (E19, ch. 4, Corollary 4.9(i); W00, Theorem 1.2): the
exponential of a nonzero algebraic number is transcendental. -/
theorem transcendental_exp_of_isAlgebraic {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : α ≠ 0) :
    Transcendental ℚ (exp α) := sorry

/-- **Lindemann's theorem** (E19, ch. 4, Corollary 4.9(ii)): `π` is transcendental. -/
theorem transcendental_pi : Transcendental ℚ Real.pi := sorry

end Transcendence

namespace GelfondSchneider

/-- **The Gelfond–Schneider theorem** for an arbitrary nonzero logarithm (E19, ch. 4,
Theorem 4.16; W00, Theorem 1.4 in its exponential form): if `exp l` is algebraic, `l ≠ 0` and `β`
is algebraic but not rational, then `exp (β l)` is transcendental. The branch of the logarithm is
arbitrary, so `exp l = 1` with `l = 2πi` is allowed. -/
theorem transcendental_exp_mul {l : ℂ} (hl : l ∈ TauCeti.algebraicLogs) (hl0 : l ≠ 0) {β : ℂ}
    (hβ : IsAlgebraic ℚ β) (hβq : ∀ q : ℚ, β ≠ q) : Transcendental ℚ (exp (β * l)) := sorry

end GelfondSchneider

namespace Baker

/-- **The criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}`** (W00, Corollary 4.2): let
`d₀ ≤ n < d₀ + d₁`, let `x₁, …, x_{d₁}` be `ℚ`-linearly independent vectors of algebraic numbers
in `ℂⁿ` and let `y₁, …, yₙ` be a basis of `ℂⁿ`. Then one of the coordinates `y_{hj}` with
`h < d₀`, or one of the exponentials `exp (xᵢ · yⱼ)`, is transcendental. -/
theorem schneiderLang {n d₀ d₁ : ℕ} (hd₀ : d₀ ≤ n) (hn : n < d₀ + d₁)
    (x : Fin d₁ → Fin n → ℂ) (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν))
    (hx : LinearIndependent ℚ x) (y : Fin n → Fin n → ℂ) (hy : LinearIndependent ℂ y) :
    (∃ (h j : Fin n), (h : ℕ) < d₀ ∧ Transcendental ℚ (y j h)) ∨
      ∃ (i : Fin d₁) (j : Fin n), Transcendental ℚ (exp (∑ ν, x i ν * y j ν)) := sorry

/-- **Baker's theorem**, general case (W00, Theorem 1.6): if the logarithms `l₁, …, lₙ` of
algebraic numbers are linearly independent over `ℚ`, then `1, l₁, …, lₙ` are linearly
independent over the algebraic numbers `integralClosure ℚ ℂ`. -/
theorem linearIndependent_cons_one_of_linearIndependent_rat {n : ℕ} (l : Fin n → ℂ)
    (hl : ∀ i, l i ∈ TauCeti.algebraicLogs) (hind : LinearIndependent ℚ l) :
    LinearIndependent (integralClosure ℚ ℂ) (Fin.cons (1 : ℂ) l : Fin (n + 1) → ℂ) := sorry

end Baker

namespace LogarithmicForms

/-- Waldschmidt's measure (DALAG Theorem 9.1 with `C(m) = 2^{m+25} m^{3m+9}`, Proposition 9.18);
`β₀` is the constant term and `k = m - 1` indexes `λ_m`. -/
theorem waldschmidt_measure {m : ℕ} (hm : 1 ≤ m) (l : Fin m → ℂ) (hl : ∀ j, l j ∈ TauCeti.algebraicLogs)
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
theorem baker_lower_bound {m : ℕ} (l : Fin m → ℂ) (hl : ∀ j, l j ∈ TauCeti.algebraicLogs) (D : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (γ : ℂ) (β : Fin m → ℂ) (B : ℝ), IsAlgebraic ℚ γ →
      (∀ i, IsAlgebraic ℚ (β i)) → (minpoly ℚ γ).natDegree ≤ D →
      (∀ i, (minpoly ℚ (β i)).natDegree ≤ D) → 1 ≤ B → absMulHeight₁ γ ≤ B →
      (∀ i, absMulHeight₁ (β i) ≤ B) → γ + ∑ i, β i * l i ≠ 0 →
      (Real.exp 1 * B) ^ (-C) ≤ ‖γ + ∑ i, β i * l i‖ := sorry

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

end LogarithmicForms

namespace Transcendence

/-- Schanuel's conjecture, as a proposition (never assumed). -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))

/-- The proposition. -/
theorem SchanuelConjecture.algebraicIndependent_exp_one_pi (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![exp 1, (Real.pi : ℂ)] := sorry

/-- The proposition. -/
theorem SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs (h : SchanuelConjecture)
    {n : ℕ} {l : Fin n → ℂ} (hl : ∀ i, l i ∈ TauCeti.algebraicLogs) (hind : LinearIndependent ℚ l) :
    AlgebraicIndependent ℚ l := sorry

end Transcendence

end Transcendence

/-! ## Layer 4: effective Diophantine equations -/

section Effective

open NumberField.Units NumberField.InfinitePlace NumberField.Units.dirichletUnitTheorem
open scoped Classical

namespace DiophantineApproximation

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
    let A : ℝ := κ * (d - 1) * (Real.log (max (TauCeti.house α) (TauCeti.house β)) + C')
    let B : ℝ := κ * (d - 1) * C'
    ((Finset.univ.sup fun j => max (ex j).natAbs (ey j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

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
    let M : ℝ := max (max (TauCeti.house a) (TauCeti.house b)) (⨆ v ∈ S, max (v a) (v b))
    let A : ℝ := 2 * κ * s * (Real.log M + C)
    let B : ℝ := 2 * κ * s * C
    ((Finset.univ.sup fun j => max (zx j).natAbs (zy j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

end DiophantineApproximation

end Effective

/-! ## Layer 5: special functions and functional transcendence -/

section SpecialFunctions

open scoped RatFunc LaurentSeries Classical
open PowerSeries

namespace DiophantineApproximation

/-- The power series `∑ a n zⁿ / n!`. -/
def ePowerSeries (a : ℕ → ℂ) : PowerSeries ℂ := PowerSeries.mk fun n => a n / n.factorial

/-- The entire function `z ↦ ∑ a n zⁿ / n!`. -/
def eFun (a : ℕ → ℂ) (z : ℂ) : ℂ := ∑' n, a n * z ^ n / n.factorial

/-- Siegel's E-functions (in the geometric normalisation of Shidlovskii, André and Beukers):
algebraic coefficients, a linear differential equation over `Q̄(z)`, and coefficients whose
conjugates and common denominators grow at most geometrically. -/
structure IsEFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : PowerSeries.IsDFinite (algebraicClosure ℚ ℂ) (ePowerSeries a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- Siegel's G-functions: `∑ a n zⁿ` with the same arithmetic conditions (no factorials). -/
structure IsGFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : PowerSeries.IsDFinite (algebraicClosure ℚ ℂ) (PowerSeries.mk a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- The `ℂ(z)`-algebra structure of the subfield of `ℂ⸨X⸩` generated over `ℂ(z)` by a set of
Laurent series, read off from its subalgebra. It names the instance used by the transcendence
degree over `ℂ(z)` in `siegel_shidlovskii` and `nishioka`, where generic instance search on the
intermediate field does not terminate within the default budget. -/
instance instAlgebraRatFuncAdjoin (S : Set ℂ⸨X⸩) :
    Algebra (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ) S) :=
  (IntermediateField.adjoin (RatFunc ℂ) S).toSubalgebra.algebra

/-- The vector of power series `F` solves `T F' = M F` with polynomial `T`, `M`. -/
def SolvesSystem {ι : Type*} [Fintype ι] (T : Polynomial ℂ) (M : Matrix ι ι (Polynomial ℂ))
    (F : ι → PowerSeries ℂ) : Prop :=
  ∀ i, (T : PowerSeries ℂ) * PowerSeries.derivative (R := ℂ) (F i) =
    ∑ j, (M i j : PowerSeries ℂ) * F j

/-- André's theorem: an E-function satisfies a differential equation whose only singularities
are `0` and `∞`. -/
theorem andre_eFunction_equation {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ (m : ℕ) (q : Fin m → Polynomial ℂ), (∀ k, (q k).natDegree ≤ m - (k : ℕ)) ∧
      (∀ k j, IsAlgebraic ℚ ((q k).coeff j)) ∧
      (PowerSeries.X ^ m * (⇑(PowerSeries.derivative (R := ℂ)))^[m] (ePowerSeries a) +
        ∑ k : Fin m, (PowerSeries.X ^ (k : ℕ) * (q k : PowerSeries ℂ)) *
          (⇑(PowerSeries.derivative (R := ℂ)))^[k] (ePowerSeries a) = 0) := sorry

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
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

/-- Galochkin–Chudnovsky: values of G-functions at rationals very close to `0`. -/
theorem galochkin_chudnovsky {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsGFunction (a i))
    (hrat : ∀ i m, ∃ q : ℚ, a i m = q) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT0 : T ≠ 0) (hT : ∀ j, IsAlgebraic ℚ (T.coeff j))
    (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => PowerSeries.mk (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((PowerSeries.mk (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ C : ℝ, 0 < C ∧ ∀ p q : ℤ, 0 < q → p ≠ 0 → C * |(p : ℝ)| ^ (n + 1) < q →
      LinearIndependent ℚ fun i => ∑' m, a i m * ((p : ℂ) / q) ^ m := sorry

/-- For q≥2 and an invertible rational matrix A, a point of the punctured unit disc
is regular if no `α^{q^ℓ}` is a pole of an entry of A or A⁻¹. Invalid q and singular
matrices fail the predicate. -/
def IsMahlerRegularPoint {n : ℕ} (q : ℕ) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ)) (α : ℂ) : Prop :=
  2 ≤ q ∧ IsUnit A.det ∧ 0 < ‖α‖ ∧ ‖α‖ < 1 ∧ ∀ ℓ : ℕ, ∀ i j,
    (A i j).denom.eval (α ^ q ^ ℓ) ≠ 0 ∧ (A⁻¹ i j).denom.eval (α ^ q ^ ℓ) ≠ 0

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
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

/-- Mahler (1929): `∑ α^{2ⁿ}` is transcendental for algebraic `0 < |α| < 1`. -/
theorem transcendental_fredholm {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    Transcendental ℚ (∑' n : ℕ, α ^ 2 ^ n) := sorry

/-- Nesterenko (1996): for `q = e^{2πiτ}`, three of `q, E₂(τ), E₄(τ), E₆(τ)` are algebraically
independent. -/
theorem nesterenko (τ : UpperHalfPlane) :
    ∃ s : Finset (Fin 4), s.card = 3 ∧ AlgebraicIndependent ℚ fun i : s =>
      (![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :
        Fin 4 → ℂ) i := sorry

/-- The real numbers π and exp π are algebraically independent. -/
theorem algebraicIndependent_pi_exp_pi :
    AlgebraicIndependent ℚ ![Real.pi, Real.exp Real.pi] := sorry

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

/-- Ax–Lindemann–Weierstrass: if the `fᵢ` generate a field of transcendence degree one (an
algebraic curve germ) and are `ℚ`-linearly independent, their exponentials are algebraically
independent. -/
theorem ax_lindemann_weierstrass {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f)
    (hcurve : Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) = 1) :
    AlgebraicIndependent ℂ fun i => (exp ℂ).subst (f i) := sorry

end DiophantineApproximation

end SpecialFunctions

end

end TauCetiRoadmap.DiophantineApproximationAndTranscendence
