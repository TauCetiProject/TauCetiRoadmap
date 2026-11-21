<!--tauceti-status:v1 {"roadmap":"DiamondsAndVStacks","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer D0","remaining":"D0.1, spectral submersions, pro-objects, Hochster realization, cohomology of coherent topoi, cutoff cardinals, v-site stacks","state":"partial"},{"id":"Layer D1","state":"untouched"},{"id":"Layer D2","state":"untouched"},{"id":"Layer D3","state":"untouched"},{"id":"Layer D4","state":"untouched"},{"id":"Layer D5","state":"untouched"},{"id":"Layer D6","state":"untouched"}],"readme_sha":"851d5022f0cf0bdae2780acff340400a7377cd330f2f39b04fa7fafbdbff5866","roadmap":"DiamondsAndVStacks","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: DiamondsAndVStacks

This file documents the status of the DiamondsAndVStacks roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** In the foundations layer D0, the spectral-quotient and Hochster-duality targets are proved, which is roughly the first third of D0's spectral strand. The rest of D0 has not begun: submersions, pro-objects, cohomology of topoi, size bounds and stacks. Nothing in the perfectoid layers D1–D6 has landed yet. Diamonds themselves, the v-site and diamondification are all still ahead.

### Named results

- **Scholze's spectral quotient criterion** — the quotient of a spectral space by an equivalence relation is spectral, with a spectral and generalizing quotient map, if three things hold: the graph of the relation is pro-constructible, its projections are generalizing, and the quotient has a basis of opens with quasi-compact preimages ([ECD] Lemma 2.9); [`spectralSpace_quotient`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Quotient.html#TauCeti.spectralSpace_quotient).
- **The open-projection quotient theorem** — if the projection from the relation is open, the quotient of a locally spectral space is [locally spectral](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Quotient.html#TauCeti.isLocallySpectralSpace_quotient_of_isOpenMap) and [quasi-separated](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Quotient.html#TauCeti.quasiSeparatedSpace_quotient_of_isOpenMap), and it is spectral when the source is ([ECD] Lemma 2.10). This is the form later needed to show that the underlying space of a spatial diamond is spectral.
- **Invariant neighbourhoods for pro-constructible relations** — the quotient is [T₀](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Quotient.html#TauCeti.t0Space_quotient), and every quasi-compact open sits inside an invariant open, which in turn lies in a quasi-compact open whose saturation is an intersection of quasi-compact opens ([ECD] Lemma 2.7); [`exists_isOpen_preimage_image_quotientMk_subset_sInter`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Quotient.html#TauCeti.exists_isOpen_preimage_image_quotientMk_subset_sInter).
- **Hochster duality** — the inverse topology of a spectral space is spectral and reverses specialization; [`spectralSpace_inverseTopology`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/InverseTopology.html#TauCeti.spectralSpace_inverseTopology). Applying it twice gives back the original topology ([`inverseTopology_inverseTopology`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/InverseTopology.html#TauCeti.inverseTopology_inverseTopology)), and it leaves the constructible topology and spectral maps unchanged.
- **Profiniteness of the component space** — the space of connected components of a spectral space is Hausdorff, hence profinite; [`ConnectedComponents.t2Space_of_prespectralSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/ConnectedComponents.html#ConnectedComponents.t2Space_of_prespectralSpace). Its clopens correspond to those of the space ([`clopensEquiv`](https://taucetiproject.org/docs/TauCeti/Topology/ConnectedComponents.html#ConnectedComponents.clopensEquiv)), and components are intersections of clopens.

### Notable definitions and infrastructure

- **Locally pro-constructible subsets** — the local form of pro-constructibility. They are stable under pullback and slicing, and they make the projections spectral ([`IsLocallyProConstructible.isLocallySpectralSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/LocallyProConstructible.html#TauCeti.IsLocallyProConstructible.isLocallySpectralSpace)). This is what lets Lemmas 2.7 and 2.10 be stated without global quasi-compactness, as the later diamond arguments require.
- **Products of spectral spaces** — [binary products](https://taucetiproject.org/docs/TauCeti/Topology/Spectral/Limits/Basic.html#TauCeti.spectralSpace_prod) are spectral, and so are products of locally spectral spaces. These are needed to treat the graph of a relation as a subspace of `X × X`.

### Roadmap coverage

D0 is partial. Done: the inverse topology (D0.5), the component space (D0.6), and pro-constructible and spectral quotients (D0.8–D0.9). The roadmap's suggested names differ from the ones used in Lean, for instance `Spectral.inverseTopology_inverse` is `inverseTopology_inverseTopology`. Not started: local spectrality of perfectoid spaces (D0.1), spectral submersions and their limits (D0.11–D0.12), bounded pro-objects and ordinal assembly, Hochster realization, profinite presentations, the cohomology of coherent topoi and profinite sets (D0.18–D0.22), cutoff cardinals, and stackification and quotient stacks. D1 through D6 are untouched. None of their suggested carriers exist in the source, including `OpenCoversSplit`, `IsWLocalSpace`, `BerkovichSpectrum` and `IsSeminormalRing`.

## The frontier

- **Spectral submersions (D0.11–D0.12)** — define `IsSpectralSubmersion`, prove its constructible-set criterion and that composites are again submersions, then prove stability under cofiltered limits. These are purely topological, and the products and pro-constructible tools now in place should cover what they need.
- **Hochster realization and profinite presentations (D0.15–D0.16)** — show that every spectral space is homeomorphic to the spectrum of a ring, and prove the Hausdorff quotient of a profinite set by a closed relation. Both are independent of perfectoid input.
- **Cutoff cardinals and flasque constant sheaves (D0.20, D0.23)** — small, self-contained `Suggested.lean` targets that the size and cohomology strands start from.
- **Split covers and w-local spaces (D1.2, D1.7)** — the purely topological `OpenCoversSplit` and `IsWLocalSpace` statements can be done now. Their perfectoid counterparts, and everything else in D1–D3, wait on PerfectoidSpaces' perfectoid spaces and pro-étale morphisms.
- **Local spectrality of perfectoid spaces (D0.1)** — blocked on PerfectoidSpaces P2 (affinoid charts and their gluing).
