import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic
import TauCeti.RingTheory.Huber.PowerBounded
import Mathlib.LinearAlgebra.Projection
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.RingTheory.MvPowerSeries.Restricted
import Mathlib.RingTheory.MvPowerSeries.GaussNorm
import Mathlib.RingTheory.Jacobson.Ring
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Spectrum.Maximal.Basic
import Mathlib.RingTheory.KrullDimension.LocalRing
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Defs
import Mathlib.Analysis.Normed.Unbundled.SpectralNorm
import Mathlib.Analysis.Normed.Algebra.Basic
import Mathlib.Topology.Algebra.Module.Basic

/-!
# Rigid analytic geometry: representative interfaces

The README is definitive. All definitions below have bodies; `sorry` occurs only in theorem
targets. No admitted instances, opaque geometric carriers or roadmap imports are used.

`weightedTate` abbreviates the native restricted subring. Its coefficient algebra, Gauss norm,
completeness and normed-algebra structures come from Tau Ceti, not a private construction.
Production code consumes the shared RestrictedPowerSeries interfaces.
The point seminorm uses Mathlib's spectral norm on the actual maximal-ideal quotient. Affinoid
hypotheses are explicit propositions; they do not install a norm or assume reducedness.

The geometric constructions, completed tensors and Kiehl operators are specified in the README
with their owners, without axiomatic substitutes here. The numerical slope predicates are actual
conditions on polynomials and native submodules, supplied to LAD §4.16.
The filtration helper at the end only states an algebraic implication; it does not pretend to
prove the geometric stability or uniform cokernel assertion of formal functions.
-/

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

open scoped Topology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- The native carrier, with Tau Ceti's existing algebra and norm instances. -/
abbrev weightedTate (n : ℕ) (ρ : Fin n → ℝ) :=
  MvPowerSeries.IsRestricted.subring (R := K) ρ

abbrev TateAlgebra (n : ℕ) := weightedTate K n (fun _ ↦ 1)

local instance unitRadius_pos : Fact (0 < (1 : ℝ)) := ⟨zero_lt_one⟩

def gaussNorm {n : ℕ} (f : TateAlgebra K n) : ℝ :=
  MvPowerSeries.gaussNorm norm (fun _ : Fin n ↦ 1) (f : MvPowerSeries (Fin n) K)

omit [CompleteSpace K] in
/-- The prototype's Gauss value is the native norm. -/
theorem gaussNorm_eq_norm {n : ℕ} (f : TateAlgebra K n) : gaussNorm K f = ‖f‖ :=
  (MvPowerSeries.norm_eq_gaussNorm f).symm

/-- This predicate makes no choice of topology (README Convention 3). -/
def IsAffinoidAlgebra (A : Type*) [CommRing A] [Algebra K A] : Prop :=
  ∃ (n : ℕ) (π : TateAlgebra K n →ₐ[K] A), Function.Surjective π

/-- Positive divisible value-group radii. Positivity excludes zero. -/
def IsStrictRadius (r : ℝ) : Prop :=
  0 < r ∧ ∃ (m : ℕ) (c : K), 0 < m ∧ c ≠ 0 ∧ r ^ m = ‖c‖

section Algebra

variable {A : Type*} [CommRing A] [Algebra K A]

theorem isNoetherianRing (hA : IsAffinoidAlgebra K A) : IsNoetherianRing A := by
  sorry

theorem isJacobsonRing (hA : IsAffinoidAlgebra K A) : IsJacobsonRing A := by
  sorry

/-- Nontriviality is necessary for the injective normalisation map. -/
theorem exists_finite_injective [Nontrivial A] (hA : IsAffinoidAlgebra K A) :
    ∃ (d : ℕ) (π : TateAlgebra K d →ₐ[K] A), Function.Injective π ∧
      (letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A) := by
  sorry

theorem finite_residue (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    FiniteDimensional K (A ⧸ x.asIdeal) := by
  sorry

/-- The domain hypothesis cannot be weakened to arbitrary reduced affinoids. -/
theorem height_eq_ringKrullDim_of_isDomain [IsDomain A]
    (hA : IsAffinoidAlgebra K A) (x : MaximalSpectrum A) :
    x.asIdeal.height = ringKrullDim A := by
  sorry

theorem weightedTate_isAffinoid_iff (n : ℕ) (ρ : Fin n → ℝ) (hρ : ∀ i, 0 < ρ i) :
    IsAffinoidAlgebra K (weightedTate K n ρ) ↔ ∀ i, IsStrictRadius K (ρ i) := by
  sorry

end Algebra

section Points

variable {A : Type*} [CommRing A] [Algebra K A]

/-- This raw value becomes an evaluation norm after finite-residue-field theorems. -/
def pointNorm (x : MaximalSpectrum A) (f : A) : ℝ :=
  letI := x.isMaximal
  letI := Ideal.Quotient.field x.asIdeal
  spectralNorm K (A ⧸ x.asIdeal) (Ideal.Quotient.mk x.asIdeal f)

/-- The real supremum has empty value zero; its boundedness is a separate target. -/
def supSeminorm (f : A) : ℝ := ⨆ x : MaximalSpectrum A, pointNorm K x f

theorem bddAbove_pointNorm (hA : IsAffinoidAlgebra K A) (f : A) :
    BddAbove (Set.range (fun x : MaximalSpectrum A ↦ pointNorm K x f)) := by
  sorry

theorem exists_pointNorm_eq_supSeminorm [Nontrivial A]
    (hA : IsAffinoidAlgebra K A) (f : A) :
    ∃ x : MaximalSpectrum A, pointNorm K x f = supSeminorm K f := by
  sorry

theorem supSeminorm_pow (hA : IsAffinoidAlgebra K A) (f : A) (n : ℕ) (hn : 0 < n) :
    supSeminorm K (f ^ n) = supSeminorm K f ^ n := by
  sorry

theorem supSeminorm_eq_zero_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    supSeminorm K f = 0 ↔ IsNilpotent f := by
  sorry

/-- One exponent for the whole affinoid, including elements of supremum zero. -/
theorem exists_uniform_valueGroup_exponent (hA : IsAffinoidAlgebra K A) :
    ∃ m : ℕ, 0 < m ∧ ∀ f : A, ∃ c : K, supSeminorm K f ^ m = ‖c‖ := by
  sorry

theorem supSeminorm_eq_zero_of_subsingleton [Subsingleton A] (f : A) :
    supSeminorm K f = 0 := by
  sorry

end Points

section Normed

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A]
  [IsUltrametricDist A] [CompleteSpace A]

theorem powerBounded_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    TauCeti.Huber.IsPowerBounded f ↔ supSeminorm K f ≤ 1 := by
  sorry

theorem topologicallyNilpotent_iff (hA : IsAffinoidAlgebra K A) (f : A) :
    IsTopologicallyNilpotent f ↔ supSeminorm K f < 1 := by
  sorry

theorem banachFunctionAlgebra [IsReduced A] (hA : IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A,
      supSeminorm K f ≤ ‖f‖ ∧ ‖f‖ ≤ C * supSeminorm K f := by
  sorry

/-- The affinoid ring-of-definition criterion supplied to Part II R0.9.
The unit is an element of the ring of definition, not necessarily a scalar in K. -/
theorem mem_iff_supSeminorm_le_one_of_isReduced (hA : IsAffinoidAlgebra K A)
    (B : Subring A) (hBo : IsOpen (B : Set A)) (hBb : Bornology.IsBounded (B : Set A))
    (ϖ : B) (hϖu : IsUnit (ϖ : A))
    (hϖ : IsTopologicallyNilpotent (ϖ : A))
    (hred : IsReduced (B ⧸ Ideal.span {ϖ})) (f : A) :
    f ∈ B ↔ supSeminorm K f ≤ 1 := by
  sorry

end Normed

section IntegralModels

variable {A : Type*} [CommRing A] [Algebra K A]

/-- Membership characterisation of the actual presentation ring; no norm instance is invented. -/
def IsPresentationRing {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (S : Subring A) : Prop :=
  ∀ a : A, a ∈ S ↔ ∃ t, gaussNorm K t ≤ 1 ∧ π t = a

theorem integral_iff_supSeminorm_le_one {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S) (a : A) :
    IsIntegral S a ↔ supSeminorm K a ≤ 1 := by
  sorry

/-- One finite submodule works uniformly for all small scalar elements of S. -/
theorem exists_fg_smul_le_of_presentation {n : ℕ} (π : TateAlgebra K n →ₐ[K] A)
    (hπ : Function.Surjective π) (S : Subring A) (hS : IsPresentationRing K π S)
    {M : Type*} [AddCommGroup M] [Module S M] [Module.Finite S M]
    (N : Submodule S M) (ε : ℝ) (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ N' : Submodule S M, N'.FG ∧ N' ≤ N ∧
      ∀ s : S, (∃ c : K, ‖c‖ ≤ ε ∧ (s : A) = algebraMap K A c) →
        ∀ x ∈ N, s • x ∈ N' := by
  sorry

theorem isNoetherian_of_presentation_of_discrete
    (hK : ∃ ρ : ℝ, ρ < 1 ∧ ∀ c : K, ‖c‖ < 1 → ‖c‖ ≤ ρ)
    {n : ℕ} (π : TateAlgebra K n →ₐ[K] A) (hπ : Function.Surjective π)
    (S : Subring A) (hS : IsPresentationRing K π S) : IsNoetherianRing S := by
  sorry

end IntegralModels

section NumericalSlopes

universe u

variable {K : Type u} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- A positive norm cutoff for annihilator roots, not Fredholm-series roots. -/
def IsSlopeLE {A : Type u} [CommRing A] [Algebra K A] (r : ℝ) (Q : Polynomial A) : Prop :=
  0 < r ∧ ∀ (L : Type u) [Field L] [Algebra K L] [Algebra.IsAlgebraic K L]
    (χ : A →ₐ[K] L) (α : L),
    (Q.map (χ : A →+* L)).IsRoot α → r ≤ spectralNorm K L α

/-- The common module-level condition consumed by LocallyAnalyticDistributions §4.16. -/
def IsSlopeDecomposition {A : Type u} [NormedCommRing A] [NormedAlgebra K A]
    {M : Type*} [NormedAddCommGroup M] [Module A M] (U : M →L[A] M) (r : ℝ)
    (M₁ M₂ : Submodule A M) : Prop :=
  0 < r ∧
    (∃ h : IsCompl M₁ M₂, Continuous (Submodule.projectionOnto M₁ M₂ h)) ∧
    (∀ x ∈ M₁, U x ∈ M₁) ∧ (∀ x ∈ M₂, U x ∈ M₂) ∧
    Module.Finite A M₁ ∧ Module.Projective A M₁ ∧
    (∃ Q : Polynomial A, Q.Monic ∧ IsUnit (Q.coeff 0) ∧ IsSlopeLE (K := K) r Q ∧
      ∀ x ∈ M₁, Polynomial.aeval (U : M →ₗ[A] M) Q x = 0) ∧
    ∀ P : Polynomial A, P.Monic → IsUnit (P.coeff 0) → IsSlopeLE (K := K) r P →
      Set.BijOn (Polynomial.aeval (U : M →ₗ[A] M) P) M₂ M₂

theorem IsSlopeDecomposition.exists_projection {A : Type u} [NormedCommRing A]
    [NormedAlgebra K A] {M : Type*} [NormedAddCommGroup M] [Module A M]
    {U : M →L[A] M} {r : ℝ} {M₁ M₂ : Submodule A M}
    (h : IsSlopeDecomposition (K := K) U r M₁ M₂) :
    ∃ P : M →L[A] M, P.comp P = P ∧ LinearMap.range (P : M →ₗ[A] M) = M₁ ∧
      LinearMap.ker (P : M →ₗ[A] M) = M₂ ∧ P.comp U = U.comp P := by
  sorry

end NumericalSlopes

section PrincipalFiltration

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The actual image aN, not scalar multiplication of a predicate. -/
def scalarImage (a : R) (N : Submodule R M) : Submodule R M :=
  N.map (a • LinearMap.id)

/-- Algebraic cofinality once the geometric stable-filtration theorem is supplied.
The proper-cohomology theorem must separately prove stability and the uniform cokernel shift. -/
theorem stable_filtration_cofinal (a : R) (F : ℕ → Submodule R M)
    (hstable : ∃ d : ℕ, ∀ n, d ≤ n → F (n + 1) = scalarImage a (F n)) :
    ∃ d : ℕ, ∀ n, F (n + d) ≤ LinearMap.range ((a ^ n) • (LinearMap.id : M →ₗ[R] M)) := by
  sorry

end PrincipalFiltration

end

end TauCetiRoadmap.RigidAnalyticGeometry
