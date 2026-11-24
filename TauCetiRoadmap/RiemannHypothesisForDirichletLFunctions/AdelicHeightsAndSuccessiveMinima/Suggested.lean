import Mathlib
import TauCeti.NumberTheory.NumberField.CanonicalEmbedding.MixedImage

/-!
# Adelic heights and successive minima: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's two headline theorems against the pinned Mathlib and Tau Ceti. Both are
statable at the pins, and every clause of them that the README's overview states is stated here.

* The subspace height of a lattice with a frame over a CM field (2.5b). For a CM field `E`, a CM
  type `Φ`, a lattice `Λ ⊆ Fin n → E` and a frame `F`, the product over `Φ` of the Gram
  determinants of the vectors `F_τ⁻¹ τ(z_i)` divided by the index of the `𝓞 E`-span of the `z_i`
  in `Λ ∩ span_E z`: it depends only on the `E`-span of the independent family `z` of vectors of
  `Λ`, and it does not change when an automorphism of `Λ` is applied to the frame and to the
  family together.
* Minkowski's second theorem over `K` for balanced bodies (3.1). For a finitely generated
  `𝓞 K`-module `Λ ⊆ ι → K` spanning it, read through the mixed image `Submodule.mixedImage` as in
  SubspaceTheorem §4.2, the minima over `K` of SubspaceTheorem §4.2, and a compact convex
  symmetric body `B ⊆ ι → mixedSpace K`: the upper bound for every such body, and the lower bound,
  with the constant `c_K` of an integral basis, when `0` is an interior point of `B` and `B` is
  balanced over the completions.

The adelic heights of 2.5a and their elementary properties are statements of
DiophantineApproximationAndTranscendence §2.5a and are not restated here; the identity of the
height of 2.5b with the adelic subspace height raised to the power `[E:ℚ]` is a step of the route
to 2.5b and is not stated either. The attainment of the minima over `K` by one family and their
three comparisons with the real minima are steps of the route to Minkowski's theorem over `K` and
are not stated.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.AdelicHeightsAndSuccessiveMinima

open NumberField IsDedekindDomain Module Set.powersetCard
open scoped NNReal Pointwise Matrix

/-! ## Layer 2: Adelic heights of vectors and subspaces -/

/-- A **CM type** of a number field `E` (2.5b; the partition condition of a CM type in
ShimuraVarieties §5.1): a finite set `Φ` of complex embeddings of `E` containing exactly one of
each pair of complex conjugate embeddings. A field with a real embedding has none. -/
def IsCMType {E : Type*} [Field E] (Φ : Finset (E →+* ℂ)) : Prop :=
  ∀ τ : E →+* ℂ, ComplexEmbedding.conjugate τ ∈ Φ ↔ τ ∉ Φ

/-- The **subspace height of a lattice with a frame** (2.5b), computed on a family
`z_1, …, z_p` of vectors of `E^n`: the product over `τ ∈ Φ` of the Gram determinants
`det(⟨F_τ⁻¹ τ(z_i), F_τ⁻¹ τ(z_j)⟩)` for the standard Hermitian product of `ℂ^n`, divided by the
index of the `𝓞 E`-span of the `z_i` in `Λ ∩ U`, `U` the `E`-span of the `z_i`. Only the values
of the frame `F` at `τ ∈ Φ` enter. The empty family has the value `1`. -/
noncomputable def latticeFrameHeight {E : Type*} [Field E] [NumberField E] {n p : ℕ}
    (Φ : Finset (E →+* ℂ)) (Λ : Submodule (𝓞 E) (Fin n → E)) (F : (E →+* ℂ) → GL (Fin n) ℂ)
    (z : Fin p → Fin n → E) : ℝ :=
  (∏ τ ∈ Φ, (Matrix.of fun i j : Fin p ↦
      star ((↑(F τ)⁻¹ : Matrix (Fin n) (Fin n) ℂ) *ᵥ fun k ↦ τ (z i k)) ⬝ᵥ
        ((↑(F τ)⁻¹ : Matrix (Fin n) (Fin n) ℂ) *ᵥ fun k ↦ τ (z j k))).det.re) /
    ((Submodule.span (𝓞 E) (Set.range z)).toAddSubgroup.relIndex
      (Λ ⊓ (Submodule.span E (Set.range z)).restrictScalars (𝓞 E)).toAddSubgroup : ℝ)

/-- **The height of a lattice with a frame is well defined** (2.5b). Let `E` be a CM field with a
CM type `Φ`, `Λ ⊆ E^n` a lattice (a finitely generated `𝓞 E`-submodule spanning `E^n`) and `F` a
frame. Two families `z`, `z'` of vectors of `Λ`, each linearly independent over `E`, with the same
`E`-span, give the same height. -/
theorem latticeFrameHeight_eq_of_span_eq {E : Type*} [Field E] [NumberField E] [IsCMField E]
    {n p : ℕ} (Φ : Finset (E →+* ℂ)) (hΦ : IsCMType Φ) (Λ : Submodule (𝓞 E) (Fin n → E))
    (hΛ : Λ.FG) (hspan : Submodule.span E (Λ : Set (Fin n → E)) = ⊤)
    (F : (E →+* ℂ) → GL (Fin n) ℂ) (z z' : Fin p → Fin n → E) (hz : LinearIndependent E z)
    (hz' : LinearIndependent E z') (hzΛ : ∀ i, z i ∈ Λ) (hz'Λ : ∀ i, z' i ∈ Λ)
    (hzz' : Submodule.span E (Set.range z) = Submodule.span E (Set.range z')) :
    latticeFrameHeight Φ Λ F z = latticeFrameHeight Φ Λ F z' := by
  sorry

/-- **Automorphisms of the lattice** (2.5b). Let `E`, `Φ`, `Λ` and `F` be as in
`latticeFrameHeight_eq_of_span_eq`, and `g ∈ GL_n(E)` with `g(Λ) = Λ`. Applying `g` to the
family and replacing the frame by `G_τ = τ(g)·F_τ` does not change the height:
`h_{Λ,G}(g(U)) = h_{Λ,F}(U)`. -/
theorem latticeFrameHeight_map {E : Type*} [Field E] [NumberField E] [IsCMField E] {n p : ℕ}
    (Φ : Finset (E →+* ℂ)) (hΦ : IsCMType Φ) (Λ : Submodule (𝓞 E) (Fin n → E)) (hΛ : Λ.FG)
    (hspan : Submodule.span E (Λ : Set (Fin n → E)) = ⊤) (F : (E →+* ℂ) → GL (Fin n) ℂ)
    (g : GL (Fin n) E) (hg : ∀ x, (g : Matrix (Fin n) (Fin n) E) *ᵥ x ∈ Λ ↔ x ∈ Λ)
    (z : Fin p → Fin n → E) (hz : LinearIndependent E z) (hzΛ : ∀ i, z i ∈ Λ) :
    latticeFrameHeight Φ Λ (fun τ ↦ Matrix.GeneralLinearGroup.map τ g * F τ)
        (fun i ↦ (g : Matrix (Fin n) (Fin n) E) *ᵥ z i) =
      latticeFrameHeight Φ Λ F z := by
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
