import TauCeti.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Topology.VectorBundle.Basic
import Mathlib.Topology.VectorBundle.Constructions
import Mathlib.Topology.VectorBundle.Hom
import Mathlib.Topology.PartitionOfUnity
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.Grassmannian
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Analysis.InnerProductSpace.Orthonormal
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic

/-!
**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These forms check actual bundle maps, compact embedding, finite matrix
spectral splitting and the monoid exercise. `sorry` denotes a mathematical target.
The topological bundle category, K-groups and Thom maps are specified in the README;
they are not simulated by empty proposition fields or opaque replacement carriers.
-/

noncomputable section
open Topology
open scoped Matrix.Norms.Operator
namespace TauCetiRoadmap.TopologicalKTheory

universe u v

/-- A small variable-rank atlas using the existing cocycle construction.
T1 proves comparison with arbitrary topological-module fibre universes. -/
structure FiniteRankAtlas (X : Type u) [TopologicalSpace X] where
  rank : LocallyConstant X ℕ
  charts : ∀ n : ℕ, VectorBundleCore ℂ {x : X // rank x = n} (Fin n → ℂ)
    {x : X // rank x = n}

section Presentation
open CategoryTheory CategoryTheory.Limits

/-- T1 supplies the genuine bundle category, Whitney biproducts and smallness.
The K-group carrier then uses the existing split presentation, with no arbitrary
sum operation or new relation engine. -/
abbrev BundleCategoryK0 (C : Type*) [Category C] [HasZeroMorphisms C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] : Type u :=
  TauCeti.SplitK0.{u} C

/-- The actual monoidal/braided category hypotheses give its K-ring. -/
example {C : Type*} [Category C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] [MonoidalCategory C]
    [MonoidalPreadditive C] [BraidedCategory C] : CommRing (BundleCategoryK0 C) :=
  inferInstance
end Presentation

section NumerableClassifierColours
variable {X : Type u} [TopologicalSpace X] {ι : Type v}

/-- The finite-subset gap of a native partition of unity. Empty `E` has
zero gap, and an empty outside index set has supremum zero. -/
noncomputable def partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) (x : X) : ℝ := by
  classical
  exact if hE : E.Nonempty then
    max 0 (sInf (Set.range fun i : {j // j ∈ E} => P i.1 x) -
      if hOutside : ∃ j, j ∉ E then
        sSup (Set.range fun i : {j // j ∉ E} => P i.1 x)
      else 0)
  else 0

/-- Local finiteness of the input reduces each gap to finite continuous
minima and maxima, including the zero outside value. -/
theorem continuous_partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) : Continuous (partitionGap P E) := by
  sorry

/-- At a point, only subsets of the finite active chart family can have
nonzero gap. This is finite support even when `ι` is uncountable. -/
theorem finite_support_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (Function.support (fun E : Finset ι => partitionGap P E x)).Finite := by
  sorry

/-- The prescribed colour indexed by `n : ℕ` has size `n+1`. Native `finsum`
is used; finite support, not an extra summability hypothesis, controls it. -/
noncomputable def prescribedPartitionColourWeight
    (P : PartitionOfUnity ι X Set.univ) (n : ℕ) (x : X) : ℝ :=
  (n + 1 : ℝ) * ∑ᶠ E : {F : Finset ι // F.card = n + 1}, partitionGap P E.1 x

/-- The sorted positive-weight gap identity, including ties and zero entries. -/
theorem sum_card_mul_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (∑ᶠ E : Finset ι, (E.card : ℝ) * partitionGap P E x) = 1 := by
  sorry

/-- Original native chart subordination is retained wherever a gap is positive.
No subordination of an output weight to its own positive set is assumed. -/
theorem partitionGap_pos_imp_chart_mem
    (P : PartitionOfUnity ι X Set.univ) (U : ι → Set X)
    (hsub : P.IsSubordinate U) (E : Finset ι) (x : X)
    (hgap : 0 < partitionGap P E x) : ∀ i ∈ E, x ∈ U i := by
  sorry

/-- A native countable partition with the prescribed finite-subset gap formula.
Continuity, nonnegativity, finite-sum normalization and local finiteness are the
fields of `PartitionOfUnity`, not a parallel partition record. -/
structure CountablePartitionColouring (P : PartitionOfUnity ι X Set.univ) where
  partition : PartitionOfUnity ℕ X Set.univ
  weight_eq : ∀ n x, partition n x = prescribedPartitionColourWeight P n x

/-- The finite-subset gap construction on the native carrier. It needs no
countability assumption on `ι` and no separation axiom once `P` is supplied. -/
theorem countablePartitionColouring (P : PartitionOfUnity ι X Set.univ) :
    Nonempty (CountablePartitionColouring P) := by
  sorry
end NumerableClassifierColours

/-- The monoid exercise used to turn a stabilized sequence monoid into a group. -/
theorem bijective_of_surjective_trivial_identity_fiber
    {S G : Type*} [Monoid S] [Group G] (f : S →* G)
    (hsurj : Function.Surjective f) (hone : ∀ s, f s = 1 → s = 1) :
    Function.Bijective f := by
  sorry

/-- Integral logarithmic-derivative coefficient of a unit λ-series.
Index n gives ψ^(n+1); no rational logarithm or division is involved. -/
def adamsValueOfLambdaSeries {R : Type*} [CommRing R]
    (lambdaSeries : (PowerSeries R)ˣ) (n : ℕ) : R :=
  (-1 : R) ^ n * PowerSeries.coeff n
    (PowerSeries.derivative (lambdaSeries : PowerSeries R) *
      (↑(lambdaSeries⁻¹) : PowerSeries R))

/-- The signed derivative coefficient is additive on multiplication of unit series.
T2.5 compares it with the integral Newton definition after the exterior-sum identity. -/
theorem adamsValueOfLambdaSeries_mul {R : Type*} [CommRing R]
    (a b : (PowerSeries R)ˣ) (n : ℕ) :
    adamsValueOfLambdaSeries (a * b) n =
      adamsValueOfLambdaSeries a n + adamsValueOfLambdaSeries b n := by
  have hd : PowerSeries.derivative ((a : PowerSeries R) * (b : PowerSeries R)) *
      (((↑(b⁻¹) : PowerSeries R) : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) =
      PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R) +
        PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R) := by
    simp only [Derivation.leibniz, smul_eq_mul]
    calc
      _ = (PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) *
          ((b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) +
        (PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) *
          ((a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) := by ring
      _ = _ := by simp
  unfold adamsValueOfLambdaSeries
  simp only [mul_inv_rev, Units.val_mul]
  rw [hd, map_add, mul_add]

/-- The integral unit expression agrees with the existing rational logarithm API. -/
theorem adamsValueOfLambdaSeries_eq_coeff_logDeriv
    {A : Type*} [CommRing A] [Algebra ℚ A]
    (a : (PowerSeries A)ˣ) (ha : PowerSeries.constantCoeff (a : PowerSeries A) = 1)
    (n : ℕ) :
    adamsValueOfLambdaSeries a n =
      (-1 : A) ^ n * PowerSeries.coeff n (PowerSeries.logDeriv (a : PowerSeries A)) := by
  unfold adamsValueOfLambdaSeries
  have hd := PowerSeries.logDeriv_mul (a : PowerSeries A) ha
  have h := congrArg (fun f : PowerSeries A => f * ↑(a⁻¹)) hd
  simpa [mul_assoc] using congrArg
    (fun f : PowerSeries A => (-1 : A) ^ n * PowerSeries.coeff n f) h.symm

section Bundles
variable {X : Type u} [TopologicalSpace X]
  {F₁ F₂ : Type v} [NormedAddCommGroup F₁] [NormedSpace ℂ F₁]
  [NormedAddCommGroup F₂] [NormedSpace ℂ F₂]
  {E₁ E₂ : X → Type v}
  [∀ x, AddCommGroup (E₁ x)] [∀ x, Module ℂ (E₁ x)]
  [∀ x, TopologicalSpace (E₁ x)] [∀ x, IsTopologicalAddGroup (E₁ x)]
  [∀ x, ContinuousSMul ℂ (E₁ x)]
  [∀ x, AddCommGroup (E₂ x)] [∀ x, Module ℂ (E₂ x)]
  [∀ x, TopologicalSpace (E₂ x)] [∀ x, IsTopologicalAddGroup (E₂ x)]
  [∀ x, ContinuousSMul ℂ (E₂ x)]
  [TopologicalSpace (Bundle.TotalSpace F₁ E₁)]
  [TopologicalSpace (Bundle.TotalSpace F₂ E₂)]
  [FiberBundle F₁ E₁] [FiberBundle F₂ E₂]
  [VectorBundle ℂ F₁ E₁] [VectorBundle ℂ F₂ E₂]

/-- A relative symbol represented by a global morphism invertible on the relative set.
T3 also constructs the extension/comparison with maps initially defined only on Y. -/
structure RelativeSymbol (Y : Set X)
    [finiteDimensionalSource : FiniteDimensional ℂ F₁]
    [finiteDimensionalTarget : FiniteDimensional ℂ F₂]
    [sourceBundle : FiberBundle F₁ E₁]
    [targetBundle : FiberBundle F₂ E₂]
    [sourceVectorBundle : VectorBundle ℂ F₁ E₁]
    [targetVectorBundle : VectorBundle ℂ F₂ E₂] where
  toLinear : ∀ x, E₁ x →L[ℂ] E₂ x
  continuous_total : Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦
    (⟨p.proj, toLinear p.proj p.2⟩ : Bundle.TotalSpace F₂ E₂))
  invertible_on : ∀ x ∈ Y, Function.Bijective (toLinear x)

/-- A compact base permits one finite trivial embedding, with fibre injectivity. -/
theorem exists_finite_trivial_embedding [CompactSpace X] [T2Space X]
    [FiniteDimensional ℂ F₁] :
    ∃ (N : ℕ) (j : ∀ x, E₁ x →L[ℂ] (Fin N → ℂ)),
      Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦ (p.proj, j p.proj p.2)) ∧
      ∀ x, Function.Injective (j x) := by
  sorry
end Bundles

section SpectralSplitting
variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {n : ℕ}

/-- The actual spectral projection for an arbitrary finite matrix family.
This does not assume the matrices are self-adjoint. The generalized-eigenvector
condition fixes which spectral subspace is selected, in addition to idempotence. -/
theorem exists_continuous_inside_projection (B : C(X, Matrix (Fin n) (Fin n) ℂ))
    (hcircle : ∀ (x : X) (z : ℂ), ‖z‖ = 1 → IsUnit (z • (1 : Matrix (Fin n) (Fin n) ℂ) - B x)) :
    ∃ P : C(X, Matrix (Fin n) (Fin n) ℂ),
      (∀ x, P x * P x = P x) ∧
      (∀ x, P x * B x = B x * P x) ∧
      ∀ (x : X) (z : ℂ) (k : ℕ) (v : Fin n → ℂ),
        Matrix.mulVec ((B x - z • (1 : Matrix (Fin n) (Fin n) ℂ)) ^ k) v = 0 →
          Matrix.mulVec (P x) v = if ‖z‖ < 1 then v else 0 := by
  sorry

/-- Uniform Laurent approximation preserves invertibility along the straight segment. -/
theorem isUnit_segment_of_uniform_inverse_bound
    (u : (Matrix (Fin n) (Fin n) ℂ)ˣ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hsmall : ‖(↑(u⁻¹) : Matrix (Fin n) (Fin n) ℂ) * (B - ↑u)‖ < 1)
    (t : unitInterval) :
    IsUnit ((1 - (t : ℝ)) • (↑u : Matrix (Fin n) (Fin n) ℂ) + (t : ℝ) • B) := by
  sorry
end SpectralSplitting

/-! ### T1.5: the single finite real/complex Grassmannian and frame-span topology -/

abbrev finiteGrassmannian (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {V : Submodule 𝕜 (Fin N → 𝕜) // Module.finrank 𝕜 V = r}

abbrev finiteFullRankFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // LinearIndependent 𝕜 f}

/-- Span of the actual coordinate columns, with its dimension proved from independence. -/
def finiteGrassmannianFrameSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteFullRankFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by sorry⟩

instance finiteGrassmannianTopology (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    TopologicalSpace (finiteGrassmannian 𝕜 r N) :=
  TopologicalSpace.coinduced (finiteGrassmannianFrameSpan 𝕜 r N) inferInstance

theorem finiteGrassmannianFrameSpan_surjective (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Function.Surjective (finiteGrassmannianFrameSpan 𝕜 r N) := by
  sorry

theorem finiteGrassmannianFrameSpan_isQuotientMap (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Topology.IsQuotientMap (finiteGrassmannianFrameSpan 𝕜 r N) := by
  sorry

/-- Orthonormality uses the native Euclidean coordinate inner product, not the sup norm. -/
abbrev finiteOrthonormalFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // Orthonormal 𝕜 (fun j => WithLp.toLp 2 (f j))}

def finiteGrassmannianOrthonormalSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteOrthonormalFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by sorry⟩

/-- Gram–Schmidt compares this quotient with the same full-rank-frame span topology. -/
theorem finiteGrassmannianOrthonormalSpan_isQuotientMap
    (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Topology.IsQuotientMap (finiteGrassmannianOrthonormalSpan 𝕜 r N) := by
  sorry

theorem finiteGrassmannian_isEmpty_of_rank_gt
    (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) (h : N < r) :
    IsEmpty (finiteGrassmannian 𝕜 r N) := by
  sorry

/-- Field subspaces recover Mathlib's quotient-rank convention, on the same submodule. -/
def finiteGrassmannianQuotientConventionEquiv (𝕜 : Type*) [RCLike 𝕜]
    (r N : ℕ) (hr : r ≤ N) :
    finiteGrassmannian 𝕜 r N ≃ Module.Grassmannian 𝕜 (Fin N → 𝕜) (N - r) := by
  sorry

theorem finiteGrassmannianQuotientConventionEquiv_submodule (𝕜 : Type*) [RCLike 𝕜]
    (r N : ℕ) (hr : r ≤ N) (V : finiteGrassmannian 𝕜 r N) :
    (finiteGrassmannianQuotientConventionEquiv 𝕜 r N hr V).toSubmodule = V.1 := by
  sorry

end TauCetiRoadmap.TopologicalKTheory
