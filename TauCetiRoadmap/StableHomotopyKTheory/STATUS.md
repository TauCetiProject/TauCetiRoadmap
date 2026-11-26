<!--tauceti-status:v1 {"roadmap":"StableHomotopyKTheory","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9","ts":"2026-11-25T18:48:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"realisation geometry 1.2-1.6, homotopies from transformations 1.10-1.12, pi1 and coverings of BC, derived colim 1.25, local coefficients","state":"partial"},{"id":"Layer 2","remaining":"quasifibrations, Dold-Lashof criteria, realisation of simplicial spaces, Quillen's Theorems A and B","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"pi0 of B(Core S) as the iso-class monoid; S^-1 S and everything after 4.1","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"bcebee3830977b1efd4e721c5d11a6c84002716ea518cfc9c2e467cf1857ab76","roadmap":"StableHomotopyKTheory","to_sha":"7433fc3695f4fbf5a07041090628c5c94067c0b9"}-->
# Status: StableHomotopyKTheory

This file documents the status of the StableHomotopyKTheory roadmap up until `7433fc3` (2026-11-25T18:48:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 2 have their foundations: classifying spaces of categories, category homology with functor coefficients, and homotopy pullbacks with homotopy-cartesian squares. Quillen's Theorems A and B are not yet proved. Layer 4 has only its first section; the plus construction, the spectrum comparisons, the K-theory spectrum and the coefficient layer have not begun.

### Named results

- **Nerves are the strict Segal simplicial sets** — a simplicial set is isomorphic to the nerve of a category exactly when every simplex is determined by its spine ([`SSet.mem_essImage_nerveFunctor_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Nerve/EssImage.html#SSet.mem_essImage_nerveFunctor_iff)).
- **The nerve commutes with filtered colimits** — Quillen's observation that finite strings of arrows live at a common stage, stated as preservation of filtered colimits of categories ([`nerveFunctor.preservesFilteredColimitsOfSize`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Nerve/FilteredColimit.html#CategoryTheory.nerveFunctor.preservesFilteredColimitsOfSize)).
- **H₀ of a category is the colimit** — degree-zero category homology is naturally isomorphic to the colimit functor on coefficient diagrams ([`categoryHomology₀NatIsoColim`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Nerve/Homology/Zero.html#TauCeti.categoryHomology₀NatIsoColim)).
- **Strict fibres of Serre fibrations are homotopy fibres** — the constant-path inclusion of the fibre into the mapping-path fibre is a weak homotopy equivalence ([`TopCat.isWeakHomotopyEquivalence_ofFiber`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/SerreFibration/MappingPath.html#TauCeti.TopCat.isWeakHomotopyEquivalence_ofFiber)).
- **Pullbacks of Serre fibrations are homotopy-cartesian** — any strict pullback square along a Serre fibration compares weakly equivalently to the path-space homotopy pullback ([`IsPullback.isHomotopyCartesian_of_right`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HomotopyPullback/Cartesian.html#CategoryTheory.IsPullback.isHomotopyCartesian_of_right)).

### Notable definitions and infrastructure

- **The classifying space of a small category** ([`classifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Category.html#TauCeti.CategoryTheory.classifyingSpace)), the realised nerve, with vertex and edge paths and a functor from the category into the fundamental groupoid of its classifying space; this is the carrier every later layer realises.
- **Category homology** ([`categoryHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialSet/Nerve/Homology/Basic.html#TauCeti.categoryHomology)) with coefficients in a functor, its long exact sequence and normalised complex, the homological input to Theorem A and to the local-coefficient comparisons.
- **Homotopy pullbacks** ([`HomotopyPullback`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HomotopyPullback/Basic.html#TauCeti.HomotopyPullback)) and homotopy-cartesian squares, strict or with a chosen homotopy ([`IsHomotopyCartesian`](https://taucetiproject.org/docs/TauCeti/Topology/Homotopy/HomotopyPullback/Cartesian.html#ContinuousMap.Homotopy.IsHomotopyCartesian)), the language in which Theorem B and the group-completion fibrations are stated.

### Roadmap coverage

Layer 1 is partial: §1.1 (classifying spaces), §1.13 (nerves and filtered colimits) and §1.24 (category homology, with its checks) are in place, the nerve of a groupoid is a Kan complex (§1.33), and §1.25 has its projective resolutions and acyclicity of free corepresentables but not the comparison with derived colimits. The realisation geometry of §§1.2–1.6, homotopies from natural transformations and contractibility (§§1.10–1.12), π₁ and coverings of BC, and the local-coefficient sections remain. Layer 2 is partial: weak equivalences, strict versus homotopy fibres and homotopy-cartesian squares (§§2.1, 2.3, 2.8) are there; quasifibrations, the Dold–Lashof criteria, realisation of simplicial spaces and Theorems A and B are not. Layer 4 is partial: §4.1's symmetric monoidal core is done except the identification of π₀ of its classifying space with the iso-class monoid. Layers 3, 5, 6 and 7 are untouched; the tower algebra Layer 7 cites is supplied, but none of its spectral statements exist.

## The frontier

- **Category homology as derived colimits (§1.25)** — enough projectives in diagram categories and acyclicity of free corepresentables are proved; what remains is the natural isomorphism of Hₙ(C, −) with the left derived functors of colim.
- **Realisation geometry (§§1.2–1.6)** — the disk comparison, the CW structure, local contractibility, closed embeddings and compact containment, all to be derived from AlgebraicTopology 4.7's realisation CW structure.
- **Quillen's Theorem A (§2.31)** — needs homotopies from natural transformations (§1.10), the comma-category-to-homotopy-fibre comparison (§2.11) and the realisation and homotopy-colimit machinery of §§2.17–2.29.
- **Group completion (§§4.1–4.5)** — finish §4.1 by identifying π₀ of the classifying space of the core with the iso-class monoid, then build Quillen's S⁻¹S and its π₀.
- **Acyclic maps and the plus construction (Layer 3)** — not begun; the first targets are acyclic spaces and maps (§§3.1–3.4).
