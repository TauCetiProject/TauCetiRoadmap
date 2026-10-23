import Mathlib

/-!
# Automorphic forms on reductive groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for headline milestones;
discharging them finishes neither a layer nor the roadmap.

README §2.1's compact-finite density is stated for strongly continuous complex Banach
representations of arbitrary compact Hausdorff groups and for continuous representations
on complete Hausdorff locally convex complex spaces. Both use the same algebraic
finite-orbit-span submodule. Local convexity is expressed on the underlying real space.

README §2.2 consumes the reductive centre and Harish-Chandra isomorphisms from
LieHighestWeight Layer 9, reductive enveloping centers, with Layer 7's raw/dot and
translated/ordinary invariant conventions.

The other headline signatures require objects absent at the pins:
* Layer 0's smoothing theorem needs the smooth adelic function and group Schwartz spaces.
* Layer 1's van Est isomorphism needs compatible Lie/group pairs and their all-degree
  relative cochain complex, together with smooth group cochains.
* The embedding, Langlands and archimedean GLₙ classifications and Casselman–Wallach
  equivalence in Layer 2 need Harish-Chandra modules, normalized smooth induction,
  real Weil parameters and smooth Fréchet representation categories. The general
  Dixmier–Malliavin theorem also needs Lie-group test functions and their integrated action.
* Layer 3's automorphic induction criterion and Flath factorization need the automorphic
  carrier, archimedean Hecke distribution algebra and restricted tensor products.
* Layer 4's cuspidal realization, GLₙ Whittaker theorem, SL₂ Fourier vanishing and Maass
  dictionary need the arithmetic quotient, cusp-form and Fourier/Hecke carriers.
* Layer 5's tempered cohomology range, Vogan–Zuckerman formula, Clozel purity, rationality
  and Galois conjugation need the compatible relative complex, cohomologically induced
  modules and cuspidal representations with their finite parts and algebraic coefficients.
* Layer 6's coherent discrete-series, limit, large-weight and Siegel-packet theorems need
  the Hermitian group datum, coherent cohomology and actual discrete occurrences.
* Layer 7's GL₁, GL₂ and definite-group dictionaries and transport theorems need the
  automorphic carrier and the common coefficient-valued level-form carrier.

These signatures are deferred until those carriers can express the stated mathematics.
-/

namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

section CompactOrbits

variable {𝕜 K V : Type*} [Field 𝕜] [Group K] [AddCommGroup V] [Module 𝕜 V]

/-- A vector whose orbit has finite-dimensional linear span (README §2.1). -/
def IsGFinite (ρ : Representation 𝕜 K V) (v : V) : Prop :=
  FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => ρ k v))

/-- The common algebraic submodule used by both compact-finite density theorems. -/
def gFiniteSubmodule (ρ : Representation 𝕜 K V) : Submodule 𝕜 V where
  carrier := {v | IsGFinite ρ v}
  zero_mem' := by
    apply Submodule.finiteDimensional_of_le (S₂ := (⊥ : Submodule 𝕜 V))
    refine Submodule.span_le.mpr ?_
    rintro _ ⟨k, rfl⟩
    change ρ k 0 ∈ (⊥ : Submodule 𝕜 V)
    rw [(ρ k).map_zero]
    exact Submodule.zero_mem _
  add_mem' := by
    intro v w hv hw
    have : FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => ρ k v)) := hv
    have : FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => ρ k w)) := hw
    apply Submodule.finiteDimensional_of_le (S₂ :=
      Submodule.span 𝕜 (Set.range fun k : K => ρ k v) ⊔
        Submodule.span 𝕜 (Set.range fun k : K => ρ k w))
    refine Submodule.span_le.mpr ?_
    rintro _ ⟨k, rfl⟩
    simp only [LinearMap.map_add]
    exact Submodule.add_mem_sup (Submodule.subset_span ⟨k, rfl⟩)
      (Submodule.subset_span ⟨k, rfl⟩)
  smul_mem' := by
    intro a v hv
    have : FiniteDimensional 𝕜 (Submodule.span 𝕜 (Set.range fun k : K => ρ k v)) := hv
    apply Submodule.finiteDimensional_of_le (S₂ :=
      Submodule.span 𝕜 (Set.range fun k : K => ρ k v))
    refine Submodule.span_le.mpr ?_
    rintro _ ⟨k, rfl⟩
    simp only [LinearMap.map_smul]
    exact Submodule.smul_mem _ a (Submodule.subset_span ⟨k, rfl⟩)

end CompactOrbits

/-- README §2.1: compact-finite vectors are dense for every strongly continuous complex
Banach representation of a compact Hausdorff group. -/
theorem gFiniteSubmodule_dense {K E : Type*} [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    (π : ContRepresentation ℂ K E) (hπ : ∀ v : E, Continuous fun k : K => π k v) :
    Dense (gFiniteSubmodule π.toRepresentation : Set E) := by
  sorry

/-- README §2.1: compact-finite density on complete Hausdorff locally convex complex
spaces, for a jointly continuous action. -/
theorem gFiniteSubmodule_dense_locallyConvex {K E : Type*} [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K]
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [T2Space E]
    [Module ℂ E] [ContinuousSMul ℂ E] [Module ℝ E] [IsScalarTower ℝ ℂ E]
    [LocallyConvexSpace ℝ E] [CompleteSpace E]
    (π : ContRepresentation ℂ K E)
    (hπ : Continuous fun p : K × E => π p.1 p.2) :
    Dense (gFiniteSubmodule π.toRepresentation : Set E) := by
  sorry

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
