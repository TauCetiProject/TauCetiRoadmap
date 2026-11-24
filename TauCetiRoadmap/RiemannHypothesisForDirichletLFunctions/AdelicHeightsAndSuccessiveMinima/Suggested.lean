import Mathlib
import TauCeti.NumberTheory.NumberField.CanonicalEmbedding.MixedImage

/-!
# Adelic heights and successive minima: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorem (2) against the pinned Mathlib and Tau Ceti. It is statable
at the pins, and every clause of it that the README's overview states is stated here.

* Minkowski's second theorem over `K` for balanced bodies (3.1). For a finitely generated
  `𝓞 K`-module `Λ ⊆ ι → K` spanning it, read through the mixed image `Submodule.mixedImage` as in
  SubspaceTheorem §4.2, the minima over `K` of SubspaceTheorem §4.2, and a compact convex
  symmetric body `B ⊆ ι → mixedSpace K`: the upper bound for every such body, and the lower bound,
  with the constant `c_K` of an integral basis, when `0` is an interior point of `B` and `B` is
  balanced over the completions.

Headline (1), the subspace height of a lattice with a frame over a CM field (2.5a), is not
stated. The attainment of the minima over `K` by one family and their three comparisons with the
real minima are steps of the route to Minkowski's theorem over `K` and are not stated either.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.AdelicHeightsAndSuccessiveMinima

open NumberField IsDedekindDomain Module Set.powersetCard
open scoped NNReal Pointwise Matrix

/-! ## Layer 3: Minkowski's second theorem over number fields for balanced bodies -/

open scoped Classical

/-- The `l`-th **successive minimum over `K`** (indexed from `0`) of an `𝓞 K`-module
`Λ ⊆ ι → K` with respect to a set `B ⊆ ι → mixedSpace K`, as SubspaceTheorem §4.2 defines it and
3.1 uses it: the infimum of the `t > 0` such that `t • B` contains the mixed images of `l + 1`
vectors of `Λ` linearly independent over `K`. It is `0` for `l ≥ card ι`, where no such vectors
exist. -/
noncomputable def successiveMinimum {K ι : Type*} [Field K] [NumberField K] [Fintype ι]
    (Λ : Submodule (𝓞 K) (ι → K)) (B : Set (ι → mixedEmbedding.mixedSpace K)) (l : ℕ) : ℝ :=
  sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (l + 1) → ι → K, LinearIndependent K v ∧
    ∀ j, v j ∈ Λ ∧ (fun i ↦ mixedEmbedding K (v j i)) ∈ t • B}

/-- A set `B ⊆ ι → mixedSpace K` is **balanced over the completions** (3.1) if `a • x ∈ B` for every
`x ∈ B` and every `a ∈ mixedSpace K` of norm at most `1` at every infinite place. -/
def IsBalancedOverCompletions {K ι : Type*} [Field K] [NumberField K]
    (B : Set (ι → mixedEmbedding.mixedSpace K)) : Prop :=
  ∀ x ∈ B, ∀ a : mixedEmbedding.mixedSpace K,
    (∀ w : InfinitePlace K, mixedEmbedding.normAtPlace w a ≤ 1) → (fun i ↦ a * x i) ∈ B

/-- **Minkowski's second theorem over `K`, lower bound** (3.1). Let `Λ ⊆ ι → K` be a finitely
generated `𝓞 K`-module spanning `ι → K` (so that its mixed image is a full lattice), `B` a compact
convex body with `0` in its interior, balanced over the completions (hence symmetric, `−1` having
norm `1` at every infinite place), `μ` a Haar measure, `d = [K:ℚ]`, `n = card ι`, and `c_K` the
largest house of a member of an integral basis `b` of `𝓞 K`. Then
`c_K^(−d·n) · 2^(d·n)/(d·n)! · covol Λ ≤ (∏_l μ_l)^d · vol B`. -/
theorem covolume_le_prod_successiveMinimum_pow_mul_measure_of_isBalancedOverCompletions
    {K ι ι' : Type*} [Field K] [NumberField K] [Fintype ι] [Fintype ι'] (b : Basis ι' ℤ (𝓞 K))
    (Λ : Submodule (𝓞 K) (ι → K)) [DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]
    (B : Set (ι → mixedEmbedding.mixedSpace K)) (hBc : IsCompact B) (hBconv : Convex ℝ B)
    (hB0 : (0 : ι → mixedEmbedding.mixedSpace K) ∈ interior B)
    (hBbal : IsBalancedOverCompletions B)
    (μ : MeasureTheory.Measure (ι → mixedEmbedding.mixedSpace K)) [μ.IsAddHaarMeasure] :
    ((⨆ j, house ((b j : 𝓞 K) : K)) ^ (finrank ℚ K * Fintype.card ι))⁻¹ *
        (2 ^ (finrank ℚ K * Fintype.card ι) / (finrank ℚ K * Fintype.card ι).factorial) *
        ZLattice.covolume Λ.mixedImage μ ≤
      (∏ l : Fin (Fintype.card ι), successiveMinimum Λ B l) ^ finrank ℚ K * μ.real B := by
  sorry

/-- **Minkowski's second theorem over `K`, upper bound** (3.1). Let `Λ ⊆ ι → K` be a finitely
generated `𝓞 K`-module spanning `ι → K`, `B` a compact convex symmetric body, `μ` a Haar measure,
`d = [K:ℚ]` and `n = card ι`. Then `(∏_l μ_l)^d · vol B ≤ 2^(d·n) · covol Λ`; balancedness is not
needed. -/
theorem prod_successiveMinimum_pow_mul_measure_le_of_convex {K ι : Type*} [Field K]
    [NumberField K] [Fintype ι] (Λ : Submodule (𝓞 K) (ι → K)) [DiscreteTopology Λ.mixedImage]
    [IsZLattice ℝ Λ.mixedImage] (B : Set (ι → mixedEmbedding.mixedSpace K)) (hBc : IsCompact B)
    (hBconv : Convex ℝ B) (hBsymm : ∀ x ∈ B, -x ∈ B)
    (μ : MeasureTheory.Measure (ι → mixedEmbedding.mixedSpace K)) [μ.IsAddHaarMeasure] :
    (∏ l : Fin (Fintype.card ι), successiveMinimum Λ B l) ^ finrank ℚ K * μ.real B ≤
      2 ^ (finrank ℚ K * Fintype.card ι) * ZLattice.covolume Λ.mixedImage μ := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.AdelicHeightsAndSuccessiveMinima
