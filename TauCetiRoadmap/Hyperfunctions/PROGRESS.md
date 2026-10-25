# Progress log: Hyperfunctions

An append-only record of what landed on the Hyperfunctions roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"8827df0a9aa78095eca6832c0a54aec37ada829a","prs":[18807,19083,19305],"roadmap":"Hyperfunctions","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
## Hyperfunctions: 2026-10-19 to 2026-10-21 (`8827df0` to `273ea28`)

The first piece of HF0 has landed: sheaf cohomology with closed supports, for sheaves of abelian groups. The group [`supportedH`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedH) H_Sⁿ(W, F) is defined as the relative cohomology of the inclusion W ∖ S ⊆ W, that is, Ext out of the cokernel of the map of free abelian sheaves, the construction the roadmap prescribes (TauCeti#18807). It comes with the facts one expects. In degree zero it is the sections supported in S ([`supportedHZeroEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedHZeroEquiv)). The long exact sequence of the pair gives the support sequence, as in `exact_toH'_cohomologyPresheaf_map`. A flasque sheaf has no supported cohomology in positive degrees. Excision ([`supportedHExcisionEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/Sheaves/SupportedCohomology.html#CategoryTheory.Sheaf.supportedHExcisionEquiv)) says that restricting to a smaller open which still contains S ∩ W is an isomorphism. Underneath all of this sits an identification of Mathlib's sheaf cohomology with Ext out of the free abelian sheaf, `H'AddEquivExt`.

For HF1, one-dimensional hyperfunctions now exist as the presheaf U ↦ O(ℂ ∖ ℝ)/O(W(U)) on ℝ ([`oneDimBoundaryPresheaf`](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.oneDimBoundaryPresheaf)). Its restriction maps are surjective, and it is [separated](https://taucetiproject.org/docs/TauCeti/Analysis/Hyperfunction/OneDimensional.html#TauCeti.Hyperfunction.oneDimBoundaryPresheaf_isSeparated), because a function on ℂ ∖ ℝ extends across a union of real opens exactly when it extends across each one. Gluing, which needs a Cousin-type vanishing of H¹ for holomorphic functions, is not proved, so this is not yet a sheaf.

What is missing: the supported theory has only abelian-group coefficients so far, with no complex-module version and no sheafified local cohomology sheaves. Nothing has landed for HF2 through HF5.
