import Mathlib
import TauCeti.Analysis.Hyperfunction.CauchyTransform
import TauCeti.Analysis.Hyperfunction.OneDimensional
import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Basic
import TauCeti.Topology.Sheaves.LocalCohomology.Module

/-!
# Hyperfunctions: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each admitted with `sorry`.

The headlines stated here are the flat and one-dimensional cases of the roadmap's main theorems,
on Tau Ceti's carriers: the sheaf of holomorphic functions on `ℂⁿ`
(`TauCeti.holomorphicStructureSheafModules`), its local cohomology sheaves with supports in a
closed set (`CategoryTheory.Sheaf.supportedModuleHSheaf`), the one-dimensional quotient presheaf
`U ↦ O(ℂ ∖ ℝ) / O(W(U))` (`TauCeti.Hyperfunction.oneDimBoundaryPresheaf`) and the Cauchy transform
of a distribution on `ℝ` (`Distribution.cauchyTransform`):

* Sato's purity theorem for `ℝⁿ ⊆ ℂⁿ` (README §2.1c) and the flabbiness of `𝓗ⁿ_{ℝⁿ}(O)`
  (README §2.2);
* Malgrange's top-degree vanishing on an arbitrary open subset of `ℂⁿ` (README §2.0a), in the
  equivalent form that the top-degree `∂̄` operator on smooth forms is onto;
* the sheaf property of the one-dimensional quotient presheaf (README §1.3);
* the Sokhotski–Plemelj jump formula for the Cauchy transform (README §4.2);
* existence, uniqueness and injectivity of the distribution embedding in dimension one,
  characterized by naturality and the Cauchy transform (README §4.2).

The following headline theorems are not statable at the pins, and nothing is stated in their
place:

* the Sato sheaf `B_M` of a real-analytic manifold, its flabbiness and its bundle and hyperform
  versions (README Layers 1 and 2): the pins have no complexification of a real-analytic
  manifold;
* compact analytic duality `H_Kⁿ(V, O) ≃ A[K]′` and its manifold and bundle forms (README §§2.1,
  2.3): the pins have no locally convex space of analytic germs along a compact set;
* Stein bundle duality (README §2.0f): the pins have no compactly supported Dolbeault cohomology
  with its strong-dual topology;
* microfunctions, the analytic wavefront set and analytic noncharacteristic pullback and products
  (README Layer 3a): the pins have no Fourier–Sato transform and no specialization functor;
* the distribution embedding in dimension `n ≥ 2` and on manifolds (README Layer 4): the pins
  have `𝓗ⁿ_{ℝⁿ}(O)` but no map from analytic functions or distributions into it (no Thom class,
  boundary-value map or relative Dolbeault representative) to pin the embedding down, and no Sato
  sheaf on a real-analytic manifold.
-/

open CategoryTheory CategoryTheory.Limits TopologicalSpace Filter Complex
open scoped Manifold ContDiff Topology Distributions

namespace TauCetiRoadmap.Hyperfunctions

/-! ## Layer 1: Sato sheaves and analytic coefficients -/

/-- **Gluing of one-dimensional hyperfunctions.** The presheaf `U ↦ O(ℂ ∖ ℝ) / O(W(U))` on `ℝ`,
with `W(U) = ℂ ∖ (ℝ ∖ U)`, is a sheaf of complex vector spaces. Tau Ceti proves that it is
separated; the existence half of gluing rests on the vanishing of `H¹(U, O)` for open
`U ⊆ ℂ`. -/
theorem oneDimBoundaryPresheaf_isSheaf :
    TauCeti.Hyperfunction.oneDimBoundaryPresheaf.IsSheaf := by
  sorry

/-! ## Layer 2: purity, flabbiness and compact duality -/

/-- The real locus `ℝⁿ = {z | ∀ i, Im zᵢ = 0}` of `ℂⁿ`, as a closed set. -/
def realLocus (n : ℕ) : Closeds (TopCat.of (Fin n → ℂ)) :=
  ⟨{z | ∀ i, (z i).im = 0}, by
    simp only [Set.ofPred_forall]
    exact isClosed_iInter fun i ↦
      isClosed_eq (continuous_im.comp (continuous_apply i)) continuous_const⟩

/-- The sheaf `O` of holomorphic functions on `ℂⁿ`, as a sheaf of complex vector spaces. -/
noncomputable abbrev holomorphicSheaf (n : ℕ) :
    TopCat.Sheaf (ModuleCat ℂ) (TopCat.of (Fin n → ℂ)) :=
  TauCeti.holomorphicStructureSheafModules 𝓘(ℂ, Fin n → ℂ) (Fin n → ℂ)

/-- **Sato's purity theorem** for `ℝⁿ ⊆ ℂⁿ`: the local cohomology sheaves `𝓗^q_{ℝⁿ}(O)` of the
sheaf of holomorphic functions vanish in every degree `q ≠ n` (the fundamental theorem quoted in
Honda–Izawa–Suwa, Theorem 2.14). -/
theorem isZero_supportedModuleHSheaf_realLocus (n q : ℕ) (hq : q ≠ n) :
    IsZero ((holomorphicSheaf n).supportedModuleHSheaf (realLocus n) q) := by
  sorry

/-- **Flabbiness** of `𝓗ⁿ_{ℝⁿ}(O)`: every section of the sheaf of hyperfunctions on an open
subset of `ℝⁿ` extends to every larger open subset. The sheaf is supported on `ℝⁿ`, so its
flabbiness on `ℂⁿ` is the flabbiness of its restriction to `ℝⁿ`, Sato's sheaf `B_{ℝⁿ}`. -/
theorem isFlasque_supportedModuleHSheaf_realLocus (n : ℕ) :
    TopCat.Presheaf.IsFlasque ((holomorphicSheaf n).supportedModuleHSheaf (realLocus n) n).obj := by
  sorry

/-- **Malgrange's top-degree vanishing** `Hⁿ(Ω, O) = 0` for every open `Ω ⊆ ℂⁿ`, `n ≥ 1`, in
Dolbeault form: for every smooth `f` on `Ω` there are smooth `g₁, …, gₙ` on `Ω` with
`∑ⱼ ∂gⱼ/∂z̄ⱼ = f`. Here `∂/∂z̄ⱼ = (∂/∂xⱼ + i ∂/∂yⱼ)/2`, written with the real derivative in the
directions `eⱼ` and `i eⱼ`; the `(0, n − 1)`-form `∑ⱼ (−1)^(j−1) gⱼ dz̄_[j]` then has `∂̄` equal to
`f dz̄₁ ∧ ⋯ ∧ dz̄ₙ`. -/
theorem exists_sum_dbar_eq {n : ℕ} (hn : 1 ≤ n) {Ω : Set (Fin n → ℂ)} (hΩ : IsOpen Ω)
    {f : (Fin n → ℂ) → ℂ} (hf : ContDiffOn ℝ ∞ f Ω) :
    ∃ g : Fin n → (Fin n → ℂ) → ℂ, (∀ j, ContDiffOn ℝ ∞ (g j) Ω) ∧
      ∀ z ∈ Ω, ∑ j, (2 : ℂ)⁻¹ * (fderiv ℝ (g j) z (Pi.single j 1) +
        I * fderiv ℝ (g j) z (Pi.single j I)) = f z := by
  sorry

/-! ## Layer 4: canonical distribution and density embedding -/

/-- Restriction of distributions on `ℝ` from `V` to a smaller open `U`: precomposition with the
inclusion of test functions, Mathlib's `TestFunction.monoCLM`, which extends a test function on
`U` by zero to `V` because `U ≤ V`. -/
noncomputable def restrictDistribution {U V : Opens ℝ} (_h : U ≤ V) :
    Distribution V ℂ ⊤ →L[ℝ] Distribution U ℂ ⊤ :=
  ContinuousLinearMap.precompCompactConvergenceCLM ℂ
    (TestFunction.monoCLM ℝ : TestFunction U ℝ ⊤ →L[ℝ] TestFunction V ℝ ⊤)

/-- **The Sokhotski–Plemelj jump formula.** Let `u` be a complex-valued distribution on `ℝ`
supported in a compact `K`, and `χ` a real test function equal to `1` on an open neighbourhood
of `K`. For every real test function `φ`, the pairing of `φ` with the jump
`C_u(x + iγ) − C_u(x − iγ)` of the Cauchy transform tends to `u(φ)` as `γ → 0⁺`; that is,
`bv₊ C_u − bv₋ C_u = u`. -/
theorem tendsto_integral_cauchyTransform_sub (u : Distribution (⊤ : Opens ℝ) ℂ ⊤)
    (K : Compacts ℝ)
    (hu : ∀ φ : TestFunction (⊤ : Opens ℝ) ℝ ⊤, Disjoint (tsupport φ) (K : Set ℝ) → u φ = 0)
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤)
    (hχ : ∃ W : Opens ℝ, (K : Set ℝ) ⊆ W ∧ ∀ t ∈ W, χ t = 1)
    (φ : TestFunction (⊤ : Opens ℝ) ℝ ⊤) :
    Tendsto (fun γ : ℝ ↦ ∫ x : ℝ, (φ x : ℂ) *
        (u.cauchyTransform χ (x + γ * I) - u.cauchyTransform χ (x - γ * I)))
      (𝓝[>] 0) (𝓝 (u φ)) := by
  sorry

/-- A family `ι_U : 𝓓′(U) → O(ℂ ∖ ℝ) / O(W(U))` of complex-linear maps, one for each open
`U ⊆ ℝ`, is a **Cauchy embedding** if it commutes with restriction and sends every compactly
supported distribution `u` on `ℝ` to the class of its Cauchy transform `C_u`, computed with any
cutoff `χ` equal to `1` on an open neighbourhood of a compact set containing the support. -/
def IsCauchyEmbedding
    (ι : ∀ U : Opens ℝ,
      Distribution U ℂ ⊤ →ₗ[ℂ] TauCeti.Hyperfunction.OneDimBoundaryQuotient U) : Prop :=
  (∀ {U V : Opens ℝ} (h : U ≤ V) (u : Distribution V ℂ ⊤),
      ι U (restrictDistribution h u) =
        TauCeti.Hyperfunction.oneDimBoundaryRestrict h (ι V u)) ∧
    ∀ (u : Distribution (⊤ : Opens ℝ) ℂ ⊤) (K : Compacts ℝ),
      (∀ φ : TestFunction (⊤ : Opens ℝ) ℝ ⊤, Disjoint (tsupport φ) (K : Set ℝ) → u φ = 0) →
      ∀ χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤, (∃ W : Opens ℝ, (K : Set ℝ) ⊆ W ∧ ∀ t ∈ W, χ t = 1) →
        ι ⊤ u = Submodule.Quotient.mk
          ⟨u.cauchyTransform χ, u.cauchyTransform_mem_holomorphicSections χ⟩

/-- **The distribution embedding in dimension one exists and is unique.** There is exactly one
Cauchy embedding: naturality and the compact Cauchy characterization determine it, because the
quotient presheaf is separated and every distribution agrees near each point with a compactly
supported one. Existence uses the sheaf property `oneDimBoundaryPresheaf_isSheaf`. -/
theorem existsUnique_isCauchyEmbedding :
    ∃! ι : ∀ U : Opens ℝ,
        Distribution U ℂ ⊤ →ₗ[ℂ] TauCeti.Hyperfunction.OneDimBoundaryQuotient U,
      IsCauchyEmbedding ι := by
  sorry

/-- **The distribution embedding is injective**: a distribution whose hyperfunction class
vanishes is zero. -/
theorem IsCauchyEmbedding.injective
    {ι : ∀ U : Opens ℝ,
      Distribution U ℂ ⊤ →ₗ[ℂ] TauCeti.Hyperfunction.OneDimBoundaryQuotient U}
    (hι : IsCauchyEmbedding ι) (U : Opens ℝ) : Function.Injective (ι U) := by
  sorry

end TauCetiRoadmap.Hyperfunctions
