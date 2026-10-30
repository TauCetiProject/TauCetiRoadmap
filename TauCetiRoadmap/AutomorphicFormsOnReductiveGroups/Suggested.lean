import Mathlib

/-!
# Automorphic forms on reductive groups: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

README §2.1's locally convex compact-finite density is stated for continuous representations
of compact Hausdorff groups on complete Hausdorff locally convex complex spaces with jointly
continuous action, the finite-orbit-span condition being written out on the native carrier.
Local convexity is expressed on the underlying real space. The topology-free orbit-span
predicate, its submodule and the Banach density theorem that this extends are a
CompactGroups Layer 5 gap and are not restated here.

README §2.2 consumes the reductive centre and Harish-Chandra isomorphisms recorded as a
LieHighestWeight Layer 9 gap, with Layer 7's raw/dot and translated/ordinary invariant
conventions; they are not restated here.

The following headline theorems are not statable at the pins, because the named carriers
are absent:
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
-/

namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

/-- README §2.1: for a continuous representation of a compact Hausdorff group on a complete
Hausdorff locally convex complex space with jointly continuous action, the vectors whose orbit
has finite-dimensional linear span are dense. -/
theorem compactFinite_dense_locallyConvex {K E : Type*} [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K]
    [AddCommGroup E] [UniformSpace E] [IsUniformAddGroup E] [T2Space E]
    [Module ℂ E] [ContinuousSMul ℂ E] [Module ℝ E] [IsScalarTower ℝ ℂ E]
    [LocallyConvexSpace ℝ E] [CompleteSpace E]
    (π : ContRepresentation ℂ K E)
    (hπ : Continuous fun p : K × E => π p.1 p.2) :
    Dense {v : E | FiniteDimensional ℂ (Submodule.span ℂ (Set.range fun k : K => π k v))} := by
  sorry

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
