<!--tauceti-status:v1 {"roadmap":"SmoothRepresentationsOfLocalGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer SR.0","remaining":"is-smooth, smooth vectors, SmoothRep and its abelian structure, the discrete comparison, compact open invariants, admissibility","state":"partial"},{"id":"Layer SR.1","state":"untouched"},{"id":"Layer SR.0d","state":"untouched"},{"id":"Layer SR.2","state":"untouched"},{"id":"Layer SR.3a","state":"untouched"},{"id":"Layer SR.3","state":"untouched"},{"id":"Layer SR.2a","state":"untouched"},{"id":"Layer SR.4","state":"untouched"},{"id":"Layer SR.5","state":"untouched"},{"id":"Layer SR.6","state":"untouched"}],"readme_sha":"3b5e62d0ffa145a301d3c1ccd8fa95af615d839d15b3514bb177b30f5cea747e","roadmap":"SmoothRepresentationsOfLocalGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SmoothRepresentationsOfLocalGroups

This file documents the status of the SmoothRepresentationsOfLocalGroups roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just started. The topological foundation of Layer SR.0, van Dantzig's theorem characterising locally profinite groups, is proved. The rest of SR.0, from the smoothness predicate onwards, has not landed, and nothing exists yet for any later layer.

### Named results

- **Van Dantzig's theorem** — for a Hausdorff topological group, being locally compact and totally disconnected, being locally compact and nonarchimedean, and having compact open subgroups arbitrarily close to the identity are equivalent conditions, so "locally profinite" means the same thing whichever definition one starts from ([`IsTopologicalGroup.locallyCompact_totallyDisconnected_tfae`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#TauCeti.IsTopologicalGroup.locallyCompact_totallyDisconnected_tfae); additive version [here](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#TauCeti.IsTopologicalAddGroup.locallyCompact_totallyDisconnected_tfae)).
- **Locally profinite groups are nonarchimedean** — instance search derives the nonarchimedean property from zero-dimensionality and weak local compactness, so later layers can assume the familiar hypotheses ([`nonarchimedeanGroup_of_weaklyLocallyCompactSpace`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#TauCeti.IsTopologicalGroup.nonarchimedeanGroup_of_weaklyLocallyCompactSpace)).
- **Compact open subgroups inside compact open sets** — a compact open set containing the identity contains a compact open subgroup, namely its translation stabilizer. This is the key step of the proof ([`IsCompact.exists_openSubgroup_subset`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#IsCompact.exists_openSubgroup_subset)).

### Notable definitions and infrastructure

- **The compact open neighbourhood basis** — in a weakly locally compact nonarchimedean group, the compact open subgroups form a basis at the identity ([`nhds_one_hasBasis_isCompact_openSubgroup`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#NonarchimedeanGroup.nhds_one_hasBasis_isCompact_openSubgroup)), and they are directed under intersection ([`OpenSubgroup.directedOn_isCompact`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/OpenSubgroup/Compact.html#OpenSubgroup.directedOn_isCompact)). This makes "fixed by an open subgroup" and "fixed by a compact open subgroup" interchangeable, which is what *is-smooth* and *smooth-vectors* need.
- **Compact subgroups as profinite groups** — a compact subgroup of a totally disconnected group, bundled as an object of the category of profinite groups ([`ProfiniteGrp.ofCompactSubgroup`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Category/ProfiniteGrp/Basic.html#ProfiniteGrp.ofCompactSubgroup)). This lets compact open subgroups use the profinite-group results from supplier roadmaps.

### Roadmap coverage

SR.0 is partial: its first target, *van-dantzig*, is in place, and nothing else in it has landed. The other SR.0 targets are not in the library: `Representation.IsSmooth`, `smoothVectors`, `SmoothRep` and its abelian structure, the comparison with discrete topological representations, compact open invariants and averaging, and `IsAdmissible`. SR.1 (Hecke algebras), SR.0d (the derived category), SR.2 (induction and Jacquet functors), SR.3a, SR.3, SR.2a, SR.4 (Satake), SR.5 (integral families for GL_n and Weil–Deligne parameters) and SR.6 are all untouched.

## The frontier

- **Smooth representations (*is-smooth*, *smooth-vectors*)** — define `Representation.IsSmooth` and the subrepresentation of smooth vectors. Then prove that, for a locally profinite group, a vector is smooth exactly when some compact open subgroup fixes it. With van Dantzig in hand, nothing blocks this.
- **The smooth category (*smooth-rep-category*, *smooth-rep-abelian*)** — `SmoothRep A G` as a full subcategory of `Rep A G`, together with the smooth-part coreflection and the proof that the category is abelian with all limits and colimits. This depends on the item above.
- **Comparison with discrete representations (*smooth-discrete-comparison*)** — an equivalence with ProfiniteCohomology's `SmoothDiscreteTopRep`, which already exists in Tau Ceti. Once the equivalence is built, that roadmap's closure properties can be transported here.
- **Compact open invariants and averaging (SR.0.3)** — invariants under compact open subgroups, and averaging over a compact open subgroup whose pro-order is invertible in the coefficients. These come before admissibility and the level Hecke algebras of SR.1.
