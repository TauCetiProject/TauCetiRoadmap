/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Basic.Complex.Basic
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Algebra.FreeAlgebra
import Mathlib.Order.Partition.Finpartition
import Mathlib.Data.Finset.Sort
import Mathlib.GroupTheory.Perm.List
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.Analysis.CStarAlgebra.PositiveLinearMap
import Mathlib.Analysis.Complex.Order
import Mathlib.MeasureTheory.Function.AEEqFun
import Mathlib.Combinatorics.Enumerative.Catalan.Basic
import Mathlib.Combinatorics.Enumerative.IncidenceAlgebra
import Mathlib.RingTheory.PowerSeries.Substitution

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
These prototypes use native subalgebras, ordered words and
finite partitions; it makes no positivity assumption on algebraic expectations.
-/

noncomputable section

open scoped ComplexOrder

namespace FreeProbability

variable {A ι : Type*} [Ring A] [Algebra ℂ A]

/-- Adjacent labels differ; repeated nonadjacent labels are allowed. -/
def IsAlternating {n : ℕ} (i : Fin n → ι) : Prop :=
  ∀ j k, j.val + 1 = k.val → i j ≠ i k

/-- Scalar freeness is a centered ordered-word identity. -/
def IsFree (φ : A →ₗ[ℂ] ℂ) (B : ι → Subalgebra ℂ A) : Prop :=
  ∀ (n : ℕ), 0 < n → ∀ (i : Fin n → ι) (a : Fin n → A),
    IsAlternating i → (∀ j, a j ∈ B (i j)) → (∀ j, φ (a j) = 0) →
      φ (List.ofFn a).prod = 0

/-- A genuine noncommutative polynomial distribution uses the free algebra. -/
def jointDistribution (φ : A →ₗ[ℂ] ℂ) (a : ι → A) :
    FreeAlgebra ℂ ι →ₗ[ℂ] ℂ :=
  φ.comp (FreeAlgebra.lift ℂ a).toLinearMap

@[simp] theorem jointDistribution_generator (φ : A →ₗ[ℂ] ℂ) (a : ι → A) (i : ι) :
    jointDistribution φ a (FreeAlgebra.ι ℂ i) = φ (a i) := by
  simp [jointDistribution]

/-- Freeness gives the first mixed moment factorization for distinct subalgebras. -/
theorem free_pair_moment (φ : A →ₗ[ℂ] ℂ) (hφ : φ 1 = 1)
    {B : ι → Subalgebra ℂ A} (hfree : IsFree φ B)
    {i j : ι} (hij : i ≠ j) {a b : A} (ha : a ∈ B i) (hb : b ∈ B j) :
    φ (a * b) = φ a * φ b := by
  sorry

/-- The full moment condition, including zero variance, on an algebraic expectation. -/
def HasSemicircularMoments (φ : A →ₗ[ℂ] ℂ) (a : A) (v : ℝ) : Prop :=
  0 ≤ v ∧ ∀ n : ℕ,
    φ (a ^ (2 * n)) = (catalan n : ℂ) * (v : ℂ) ^ n ∧
    φ (a ^ (2 * n + 1)) = 0

/-- The standard four-position crossing criterion on an existing finite partition. -/
def IsNoncrossing {n : ℕ} (P : Finpartition (Finset.univ : Finset (Fin n))) : Prop :=
  ∀ B ∈ P.parts, ∀ C ∈ P.parts, ∀ a b c d : Fin n,
    a < b → b < c → c < d → a ∈ B → c ∈ B → b ∈ C → d ∈ C → B = C

abbrev NoncrossingPartition (n : ℕ) :=
  {P : Finpartition (Finset.univ : Finset (Fin n)) // IsNoncrossing P}

instance (n : ℕ) : Fintype (NoncrossingPartition n) := Fintype.ofFinite _

/-- Disjoint increasing block cycles; their product is independent of block enumeration. -/
def partitionPermutation {n : ℕ} (π : NoncrossingPartition n) : Equiv.Perm (Fin n) := by
  classical
  exact (π.val.parts.toList.map (fun B => (B.sort (· ≤ ·)).formPerm)).prod

/-- The right interlaced complement convention, with the rightmost permutation acting first. -/
theorem exists_kreweras {n : ℕ} (π : NoncrossingPartition n) :
    ∃ κ : NoncrossingPartition n,
      partitionPermutation κ = (partitionPermutation π)⁻¹ * finRotate n := by
  sorry

def kreweras {n : ℕ} (π : NoncrossingPartition n) : NoncrossingPartition n :=
  (exists_kreweras π).choose

theorem kreweras_permutation {n : ℕ} (π : NoncrossingPartition n) :
    partitionPermutation (kreweras π) = (partitionPermutation π)⁻¹ * finRotate n :=
  (exists_kreweras π).choose_spec

/-- The one-block partition, including the empty partition at arity zero. -/
def noncrossingTop (n : ℕ) : NoncrossingPartition n := by
  refine ⟨⊤, ?_⟩
  intro B hB C hC a b c d hab hbc hcd ha hc hb hd
  exact Finpartition.parts_top_subsingleton Finset.univ hB hC

/-- Block moments retain the increasing order inside each block. -/
def partitionMoment {n : ℕ} (φ : A →ₗ[ℂ] ℂ) (a : Fin n → A)
    (P : Finpartition (Finset.univ : Finset (Fin n))) : ℂ := by
  classical
  exact ∏ B ∈ P.parts, φ ((B.sort (· ≤ ·)).map a).prod

/-- Canonical cumulants are Möbius inversion on the noncrossing refinement order. -/
def cumulant (φ : A →ₗ[ℂ] ℂ) (n : ℕ) (_hn : 0 < n) (a : Fin n → A) : ℂ := by
  classical
  letI : LocallyFiniteOrder (NoncrossingPartition n) := Fintype.toLocallyFiniteOrder
  exact ∑ π : NoncrossingPartition n,
    IncidenceAlgebra.mu ℂ π (noncrossingTop n) * partitionMoment φ a π.val

/-- The arity-two evaluation is derived from the canonical definition. -/
theorem cumulant_two (φ : A →ₗ[ℂ] ℂ) (a b : A) :
    cumulant φ 2 (by decide) (fun i => if i = 0 then a else b) =
      φ (a * b) - φ a * φ b := by
  sorry

theorem free_cumulant_two_eq_zero (φ : A →ₗ[ℂ] ℂ) (hφ : φ 1 = 1)
    {B : ι → Subalgebra ℂ A} (hfree : IsFree φ B)
    {i j : ι} (hij : i ≠ j) {a b : A} (ha : a ∈ B i) (hb : b ∈ B j) :
    cumulant φ 2 (by decide) (fun i => if i = 0 then a else b) = 0 := by
  rw [cumulant_two]
  exact sub_eq_zero.mpr (free_pair_moment φ hφ hfree hij ha hb)

/-- Empty NC(0) consists of its empty partition and has cardinality one. -/
theorem card_noncrossing (n : ℕ) : Fintype.card (NoncrossingPartition n) = catalan n := by
  sorry

/-- Removing a zero constant coefficient by shifting coefficients is actual division by X. -/
def sSeries (Ψ : PowerSeries ℂ) (hmean : IsUnit (Ψ.coeff 1)) : PowerSeries ℂ :=
  (1 + PowerSeries.X) *
    PowerSeries.mk (fun n => (Ψ.substInvOfIsUnit hmean).coeff (n + 1))

theorem sSeries_constantCoeff (Ψ : PowerSeries ℂ)
    (hmean : IsUnit (Ψ.coeff 1)) :
    (sSeries Ψ hmean).constantCoeff = ((hmean.unit⁻¹ : ℂˣ) : ℂ) := by
  simp [sSeries]

/-- A synonym has its own conjugate-linear involution, independent of FreeAlgebra's star. -/
def StarPolynomial (ι : Type*) := FreeAlgebra ℂ (ι × Bool)

instance : Ring (StarPolynomial ι) := inferInstanceAs (Ring (FreeAlgebra ℂ (ι × Bool)))
instance : Algebra ℂ (StarPolynomial ι) :=
  inferInstanceAs (Algebra ℂ (FreeAlgebra ℂ (ι × Bool)))

def starPolynomialGenerator (i : ι) (b : Bool) : StarPolynomial ι :=
  FreeAlgebra.ι ℂ (i, b)

/-- Reverse words, conjugate coefficients, and interchange each generator and its adjoint. -/
theorem exists_polynomial_star (ι : Type*) :
    ∃ S : StarPolynomial ι → StarPolynomial ι,
      Function.Involutive S ∧
      (∀ x y, S (x + y) = S x + S y) ∧
      (∀ x y, S (x * y) = S y * S x) ∧
      (∀ c : ℂ, S (algebraMap ℂ (StarPolynomial ι) c) =
        algebraMap ℂ (StarPolynomial ι) (star c)) ∧
      (∀ i b, S (starPolynomialGenerator i b) = starPolynomialGenerator i (!b)) := by
  sorry

instance : StarRing (StarPolynomial ι) where
  star := (exists_polynomial_star ι).choose
  star_involutive := (exists_polynomial_star ι).choose_spec.1
  star_add := (exists_polynomial_star ι).choose_spec.2.1
  star_mul := (exists_polynomial_star ι).choose_spec.2.2.1

@[simp] theorem starPolynomial_algebraMap (c : ℂ) :
    star (algebraMap ℂ (StarPolynomial ι) c) =
      algebraMap ℂ (StarPolynomial ι) (star c) :=
  (exists_polynomial_star ι).choose_spec.2.2.2.1 c

@[simp] theorem starPolynomial_generator (i : ι) (b : Bool) :
    star (starPolynomialGenerator i b) = starPolynomialGenerator i (!b) :=
  (exists_polynomial_star ι).choose_spec.2.2.2.2 i b

instance : StarModule ℂ (StarPolynomial ι) where
  star_smul c x := by
    rw [Algebra.smul_def, star_mul, starPolynomial_algebraMap, Algebra.smul_def]
    exact (Algebra.commutes (star c) (star x)).symm

section CStarState
variable {C : Type*} [CStarAlgebra C] [PartialOrder C] [StarOrderedRing C]

/-- Use the native positive-linear map as state data; normalization is an explicit hypothesis. -/
theorem normalized_state_bound (φ : C →ₚ[ℂ] ℂ) (hφ : φ 1 = 1) (a : C) :
    ‖φ a‖ ≤ ‖a‖ := by
  sorry
end CStarState

/-- Random matrices use the native almost-everywhere quotient, not bounded random functions. -/
abbrev RandomMatrix (Ω : Type*) [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (N : ℕ) :=
  MeasureTheory.AEEqFun Ω (Matrix (Fin N) (Fin N) ℂ) μ

end FreeProbability
