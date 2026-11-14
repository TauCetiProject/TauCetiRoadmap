import Mathlib

/-!
# Vector bundles and isocrystals, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`.

A finite extension `K` of `ℚ_p` is realised as a finite intermediate field of the fixed algebraic
closure `PadicAlgCl p`, its absolute Galois group `G_K` is `PadicAlgCl p ≃ₐ[K] PadicAlgCl p` with
the Krull topology, and `σ ∈ G_K` acts on `ℂ_[p]` by its extension by continuity
`UniformSpace.Completion.map σ` (it is an isometry of the spectral norm,
`spectralNorm_eq_of_equiv`). This action and its laws are those of the roadmap PadicPeriodRings,
§1.1; the statements below write the completion map directly. With these, two headlines of
Layer 0 are statable:

* Fontaine's full faithfulness for finite-dimensional semilinear `ℂ_p`-representations
  (README §0.2, first half);
* the fundamental theorem for an extension of a `ℂ_p`-line by a finite-dimensional
  representation (README §0.10).

The other headline theorems are not statable at the pins:

* Fontaine's full faithfulness for finite-length semilinear `B_dR⁺`-representations (README §0.2,
  second half): Mathlib's `BDeRhamPlus` carries no Galois action and no canonical topology.
* The structure theorem and Euler–Poincaré duality for almost `C`-representations (README §§0.5,
  1.5): there is no category of Banach Galois representations, no category of almost
  `C`-representations and no `Ext` in it.
* The disc extension isomorphism `Ext¹_TVS(V₁, V₁) ≅ C` (README §3.7) and full faithfulness of
  reasonable quasi-Banach–Colmez spaces (README §5.4): there is no category of sympathetic
  algebras, no left heart of nonarchimedean locally convex spaces, and no Topological Vector
  Space, period Pair or qBC carrier.
* The height–rank formula `rank h(W) = ht(W) + rank Ext¹_VS(W, B_dR)` (README §6.7): there is no
  category of sympathetic Vector Spaces, no Banach–Colmez space and no period-valued functor
  `B_dR` on sympathetic algebras.
-/

namespace TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII

/-! ## Layer 0: Almost C-representations and period rigidity -/

/-- A continuous semilinear `ℂ_p`-representation of `G_K = Gal(ℚ̄_p/K)` on a `ℂ_p`-module `W`:
an action by additive maps, semilinear over the action of `G_K` on `ℂ_p` (each `σ` acting by its
extension by continuity `UniformSpace.Completion.map σ`) and jointly continuous for the
Krull topology on `G_K` (Fontaine, *Presque C_p-représentations*, §1.3, p. 289). -/
structure SemilinearRep (p : ℕ) [Fact p.Prime] (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    (W : Type*) [AddCommGroup W] [Module ℂ_[p] W] [TopologicalSpace W] where
  /-- The action of `G_K` on `W` by additive endomorphisms (invertible, as `G_K` is a group). -/
  act : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) →* AddMonoid.End W
  /-- Semilinearity: `σ (c w) = σ(c) σ(w)`. -/
  act_smul : ∀ (σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p) (c : ℂ_[p]) (w : W),
    act σ (c • w) = UniformSpace.Completion.map σ c • act σ w
  /-- Joint continuity of `G_K × W → W`. -/
  continuous_act : Continuous fun x : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) × W => act x.1 x.2

/-- **Fontaine's full faithfulness for `ℂ_p`-representations** (README §0.2). For a finite
extension `K/ℚ_p` and finite-dimensional continuous semilinear `ℂ_p`-representations `W₁`, `W₂`
of `G_K` with their canonical topologies, every continuous additive (equivalently, continuous
`ℚ_p`-linear) `G_K`-equivariant map `W₁ → W₂` is `ℂ_p`-linear. (Fontaine, *Presque
C_p-représentations*, Théorème A, p. 290, and §3.3; Colmez–Nizioł, *C_st-conjecture*, Theorem 2.1,
p. 9.) -/
theorem semilinearRep_equivariant_map_smul (p : ℕ) [Fact p.Prime]
    (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    {W₁ W₂ : Type*} [AddCommGroup W₁] [Module ℂ_[p] W₁] [FiniteDimensional ℂ_[p] W₁]
    [TopologicalSpace W₁] [IsModuleTopology ℂ_[p] W₁]
    [AddCommGroup W₂] [Module ℂ_[p] W₂] [FiniteDimensional ℂ_[p] W₂]
    [TopologicalSpace W₂] [IsModuleTopology ℂ_[p] W₂]
    (ρ₁ : SemilinearRep p K W₁) (ρ₂ : SemilinearRep p K W₂)
    (f : W₁ →+ W₂) (hf : Continuous f)
    (hequiv : ∀ (σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p) (w : W₁),
      f (ρ₁.act σ w) = ρ₂.act σ (f w))
    (c : ℂ_[p]) (w : W₁) :
    f (c • w) = c • f w := by
  sorry

/-- **The fundamental theorem for an extension of a `ℂ_p`-line** (README §0.10). Let `K/ℚ_p` be
finite, `E` a `ℚ_p`-Banach space with a jointly continuous linear action of `G_K`, `V ⊂ E` a
finite-dimensional subspace, and `q : E → W` a continuous equivariant surjection with kernel `V`
onto a one-dimensional continuous semilinear `ℂ_p`-representation `W` (so `V` is `G_K`-stable). If
`η : E → ℂ_p` is continuous, `ℚ_p`-linear and `G_K`-equivariant with `η(E) ≠ η(V)`, then `η` is
surjective and its kernel is a finite-dimensional `ℚ_p`-space of dimension `dim V`.
(Fontaine, *Presque C_p-représentations*, Théorème 4.1, p. 329, proof completed p. 340.) -/
theorem fundamental_extension_surjective (p : ℕ) [Fact p.Prime]
    (K : IntermediateField ℚ_[p] (PadicAlgCl p)) [FiniteDimensional ℚ_[p] K]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℚ_[p] E] [CompleteSpace E]
    (ρ : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) →* (E →L[ℚ_[p]] E))
    (hρ : Continuous fun x : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) × E => ρ x.1 x.2)
    (V : Submodule ℚ_[p] E) [FiniteDimensional ℚ_[p] V]
    {W : Type*} [AddCommGroup W] [Module ℂ_[p] W] [TopologicalSpace W]
    [IsModuleTopology ℂ_[p] W] (hW : Module.finrank ℂ_[p] W = 1) (ρW : SemilinearRep p K W)
    (q : E →+ W) (hq : Continuous q) (hq_surj : Function.Surjective q)
    (hq_ker : q.ker = V.toAddSubgroup)
    (hq_equiv : ∀ (σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p) (x : E), q (ρ σ x) = ρW.act σ (q x))
    (η : E →L[ℚ_[p]] ℂ_[p])
    (hη : ∀ (σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p) (x : E),
      η (ρ σ x) = UniformSpace.Completion.map σ (η x))
    (hne : LinearMap.range (η : E →ₗ[ℚ_[p]] ℂ_[p]) ≠ V.map (η : E →ₗ[ℚ_[p]] ℂ_[p])) :
    Function.Surjective η ∧
      FiniteDimensional ℚ_[p] (LinearMap.ker (η : E →ₗ[ℚ_[p]] ℂ_[p])) ∧
      Module.finrank ℚ_[p] (LinearMap.ker (η : E →ₗ[ℚ_[p]] ℂ_[p])) =
        Module.finrank ℚ_[p] V := by
  sorry

end TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII
