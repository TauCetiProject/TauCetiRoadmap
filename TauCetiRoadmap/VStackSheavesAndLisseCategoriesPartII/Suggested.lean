import Mathlib

/-!
# Artin v-stacks, solid and lisse coefficient categories, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with only the
simple definitions those statements need.

At the pins no headline theorem of this roadmap is statable, so the file states nothing. Every
headline is a statement about small v-stacks over the v-site of perfectoid spaces of
characteristic p and about Scholze's étale derived categories `D_ét(X, Λ)` on them. Neither
pinned library has perfectoid spaces, the v-topology, diamonds or small v-stacks: Mathlib has
pretilts (`Mathlib/RingTheory/Perfection.lean`), the untilt map and Fontaine's θ
(`Mathlib/RingTheory/Perfectoid/`), and Tau Ceti has perfectoid Tate rings and perfectoid fields
(`TauCeti.Perfectoid`, in `TauCeti/RingTheory/Perfectoid/`) and pre-adic spaces
(`TauCeti.PreAdicSpace`, in `TauCeti/AlgebraicGeometry/AdicSpace/`), but neither has perfectoid
spaces, their v-site or étale sheaves on it. In detail:

* Existence of the exceptional functors `Rf_!`, `Rf^!` for fine maps of decent v-stacks, with
  agreement with Scholze's functors, pseudo-functoriality, the projection formula and proper
  base change (README VS7.5): lacks decent v-stacks, fine maps, `D_ét(X, Λ)` with its
  symmetric monoidal ∞-categorical enhancement, and Liu–Zheng enhanced operation maps.
* Dualizable objects of the 2-category of cohomological correspondences `CoCorr_S` are exactly
  the universally locally acyclic objects (README VS8.9): lacks symmetric monoidal
  bicategories (Mathlib has `CategoryTheory.Bicategory` without a monoidal structure),
  `CoCorr_S`, and universal local acyclicity on Artin v-stacks.
* The relative Lefschetz–Verdier trace formula for v-stacks, and its consequence that
  characteristic classes commute with proper pushforward (README VS9.1, VS9.2): lacks
  `CoCorr_S`, cohomologically proper maps of decent v-stacks and relative dualizing complexes.
* The Lefschetz trace formula for proper diamonds over `Spd C` (README VS9.3), and the
  compatibility of local terms with base change and with the local terms of perfect schemes
  (README VS9.6, VS9.8): lack diamonds, `D_ét` and local terms; the scheme side also lacks
  cohomological correspondences of étale sheaves on schemes.
* The characteristic class of an admissible object on the classifying stack `[S/G_S]` of a
  locally pro-p group is its trace distribution (README VS11.4): lacks the classifying v-stack,
  its inertia stack and `D_ét([S/G_S], Λ)`; the trace distribution alone is a definition, not a
  headline.
* The Künneth formula for characteristic classes over a base with smooth structure map and
  diagonal (README VS11.9), and the identification of characteristic classes on quotient stacks
  `[X/G]` with universal local terms (README VS11.12): lack quotient v-stacks, inertia stacks,
  based cohomological correspondences and `D_ét`.
-/

namespace TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII

end TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII
