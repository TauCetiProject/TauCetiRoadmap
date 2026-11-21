import Mathlib
import TauCeti.LinearAlgebra.ExteriorPower.Plucker
import TauCeti.NumberTheory.Height.Arakelov.Subspace.Basic
import TauCeti.NumberTheory.NumberField.CanonicalEmbedding.MixedImage
import TauCeti.NumberTheory.NumberField.Global.Adeles.Extension
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Basic

/-!
# Adelic heights and successive minima: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Both headlines
are statable at the pins, and every clause of them that the README's overview states is stated
here.

* Adelic heights (2.5a). The height `H_A` is DiophantineApproximationAndTranscendence §2.5's; this
  roadmap writes it out under two names. For an adelic matrix `A` over a number field `K`, a
  finite extension `L` of `K` and `x ∈ L^n`, `adelicHeight A x` multiplies the Euclidean norms of
  `A_{v(w)} x` at the infinite places `w` of `L`, with exponent `mult(w)/[L:ℚ]`, and the max norms
  at the finite places, with exponent `1/[L:ℚ]`, reading the components of `A` above the places of
  `L` through Tau Ceti's extension map of adele rings `NumberField.adeleExtension`;
  `adelicSubspaceHeight A U` is the height, for the action of `A` on Plücker coordinates, of the
  Plücker vector of a basis of `U`. For `A ∈ GL_n(𝔸_K)` the file states the value at `A = 1` on
  `K`-subspaces, Tau Ceti's `Submodule.subspaceHeight`, and the value `|det A|_𝔸` on the whole
  space, the idele norm `TauCeti.GlobalNumberFields.ideleNorm` of `det A` raised to the power
  `1/[K:ℚ]`.
* Minkowski's second theorem over `K` for balanced bodies (3.1). For a finitely generated
  `𝓞 K`-module `Λ ⊆ ι → K` spanning it, read through the mixed image `Submodule.mixedImage` as in
  SubspaceTheorem §4.2, the minima over `K` of SubspaceTheorem §4.2, and a compact convex
  symmetric body `B ⊆ ι → mixedSpace K`: the upper bound for every such body, and the lower bound,
  with the constant `c_K` of an integral basis, when `0` is an interior point of `B` and `B` is
  balanced over the completions.

The theorems of DiophantineApproximationAndTranscendence §2.5 that 2.5a cites in its names are not
stated: the invariance of both heights under finite extension, the absolute Siegel lemma of Roy
and Thunder and the dual-height identity. Nor are the elementary clauses of 2.5a that are not
headlines: the independence of the scalar and of the Plücker vector, the height of vectors at
`A = 1`, change of basis, the height of a line and the case `n = 1`. The attainment of the minima
over `K` by one family and their three comparisons with the real minima are steps of the route to
Minkowski's theorem over `K` and are not stated either.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.AdelicHeightsAndSuccessiveMinima

open NumberField IsDedekindDomain Module TauCeti Set.powersetCard
open scoped NNReal Pointwise Matrix

/-! ## Layer 2: Adelic heights of vectors and subspaces -/

/-- The **adelic height** of a vector `x ∈ L^ι` for an adelic matrix `A` over `K` (2.5a), the
height `H_A` of DiophantineApproximationAndTranscendence §2.5 written out over `L`: the product
over the infinite places `w` of `L` of the Euclidean norm of `A_{v(w)} x`, with exponent
`mult(w)/[L:ℚ]`, and over the finite places of `L` of the max norm of `A_{v(w)} x` for the
ideal-normalised absolute value, with exponent `1/[L:ℚ]`. The component `A_{v(w)}` acts on `L_w`
through `K_{v(w)} ⊂ L_w`, the image of `A` under the extension map `𝔸_K → 𝔸_L`. For `A = 1` and
`L = K` this is `TauCeti.height2`. -/
noncomputable def adelicHeight {K L ι ι' : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] [Fintype ι] [Fintype ι']
    (A : Matrix ι' ι (AdeleRing (𝓞 K) K)) (x : ι → L) : ℝ :=
  (∏ w : InfinitePlace L,
      (∑ i, ‖∑ j, (adeleExtension (𝓞 K) K (𝓞 L) L (A i j)).1 w * (x j : w.Completion)‖ ^ 2) ^
        ((w.mult : ℝ) / (2 * finrank ℚ L))) *
    ∏ᶠ v : HeightOneSpectrum (𝓞 L),
      (⨆ i, ‖∑ j, (adeleExtension (𝓞 K) K (𝓞 L) L (A i j)).2 v *
        algebraMap L (v.adicCompletion L) (x j)‖) ^ ((1 : ℝ) / finrank ℚ L)

/-- The **adelic subspace height** of a subspace `U ⊆ L^ι` for an adelic matrix `A` over `K`
(2.5a): the adelic height, for the matrix `Λ^p A` of the `p × p` minors of `A` acting on Plücker
coordinates (`p = dim U`), of the Plücker vector of a basis of `U`. The zero subspace has height
`1`. For `A ∈ GL_n(𝔸_K)` the value does not depend on the basis, by the product formula. -/
noncomputable def adelicSubspaceHeight {K L ι : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] [Fintype ι] [LinearOrder ι]
    (A : Matrix ι ι (AdeleRing (𝓞 K) K)) (U : Submodule L (ι → L)) : ℝ :=
  adelicHeight
    (Matrix.of fun I J : Set.powersetCard ι (finrank L U) ↦
      (Matrix.of fun a b ↦ A (ofFinEmbEquiv.symm I a) (ofFinEmbEquiv.symm J b)).det)
    (plucker fun i ↦ (Module.finBasis L U i : ι → L))

/-- **Standard data** (2.5a). At `A = 1` the adelic subspace height of a subspace of `K^ι` is its
absolute Euclidean height `Submodule.subspaceHeight` (DiophantineApproximationAndTranscendence
§2.5). -/
theorem adelicSubspaceHeight_one {K ι : Type*} [Field K] [NumberField K] [Fintype ι]
    [LinearOrder ι] (U : Submodule K (ι → K)) :
    adelicSubspaceHeight (L := K) (1 : Matrix ι ι (AdeleRing (𝓞 K) K)) U = U.subspaceHeight := by
  sorry

/-- **The whole space** (2.5a). For `A ∈ GL_n(𝔸_K)` and every finite extension `L` of `K`, the
adelic subspace height of `L^ι` is `|det A|_𝔸 = ∏_v |det A_v|_v^(w_v)`, with `w_v = mult(v)/[K:ℚ]`
at the infinite and `1/[K:ℚ]` at the finite places: the idele norm of `det A` raised to the power
`1/[K:ℚ]`. -/
theorem adelicSubspaceHeight_top {K L ι : Type*} [Field K] [NumberField K] [Field L]
    [NumberField L] [Algebra K L] [Fintype ι] [LinearOrder ι]
    (A : GL ι (AdeleRing (𝓞 K) K)) :
    adelicSubspaceHeight (A : Matrix ι ι (AdeleRing (𝓞 K) K)) (⊤ : Submodule L (ι → L)) =
      ((GlobalNumberFields.ideleNorm (Matrix.GeneralLinearGroup.det A) : ℝ≥0) : ℝ) ^
        ((finrank ℚ K : ℝ)⁻¹) := by
  sorry

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
convex symmetric body with `0` in its interior, balanced over the completions, `μ` a Haar measure,
`d = [K:ℚ]`, `n = card ι`, and `c_K` the largest house of a member of an integral basis `b` of
`𝓞 K`. Then `c_K^(−d·n) · 2^(d·n)/(d·n)! · covol Λ ≤ (∏_l μ_l)^d · vol B`. -/
theorem covolume_le_prod_successiveMinimum_pow_mul_measure_of_isBalancedOverCompletions
    {K ι ι' : Type*} [Field K] [NumberField K] [Fintype ι] [Fintype ι'] (b : Basis ι' ℤ (𝓞 K))
    (Λ : Submodule (𝓞 K) (ι → K)) [DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]
    (B : Set (ι → mixedEmbedding.mixedSpace K)) (hBc : IsCompact B) (hBconv : Convex ℝ B)
    (hBsymm : ∀ x ∈ B, -x ∈ B) (hB0 : (0 : ι → mixedEmbedding.mixedSpace K) ∈ interior B)
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
