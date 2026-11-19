<!--tauceti-status:v1 {"roadmap":"LocalPurity","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"completion and hypersurface comparisons 0BLH, 0BLI, 0EL8, 0EKS, 0BM6, 0BLJ; 0BLL beyond depth two; local Lefschetz 0BLM","state":"partial"},{"id":"Layer 2","remaining":"0BMA in dimension at least three; spreading out 0BQ5/0EY3; extension across points where purity holds 0EY7; regular codimension-two corollary","state":"partial"}],"readme_sha":"763a91b7c90c4be9907db9a19a560d834bab1afc54712ab09a4f1e94336afd2d","roadmap":"LocalPurity","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e"}-->
# Status: LocalPurity

This file documents the status of the LocalPurity roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. Purity for regular local rings is proved in dimension two, together with the Layer 1 machinery it uses: punctured spectra, the extension criterion and the finite normal anti-equivalence. Dimension three and up, the completion and hypersurface comparisons, the local Lefschetz theorem and the global extension theorem 0EY7 are not yet proved.

### Named results

- **Purity in dimension two** — every finite étale cover of the punctured spectrum of a two-dimensional regular local ring extends across the closed point ([`purityHolds_of_ringKrullDim_eq_two`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/Purity.html#TauCeti.IsLocalRing.purityHolds_of_ringKrullDim_eq_two)). Its algebraic form is also proved, with the torsion-freeness correction ([`etale_of_finiteNormal_of_ringKrullDim_eq_two`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/Purity.html#TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two)).
- **Miracle flatness** — a local homomorphism from a regular local ring to a Cohen–Macaulay local ring that satisfies the dimension formula is flat, with no finiteness assumption, exactly as in Stacks 00R4 ([`flat_of_isCohenMacaulay`](https://taucetiproject.org/docs/TauCeti/RingTheory/RegularLocalRing/MiracleFlatness.html#TauCeti.Algebra.flat_of_isCohenMacaulay)).
- **Covers of the punctured spectrum as finite normal algebras** — over a normal local domain of dimension at least two, finite étale covers of the punctured spectrum are anti-equivalent to finite normal torsion-free algebras étale off the closed point. This is Stacks 0BM9, corrected ([`finiteNormalEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/FiniteNormal.html#TauCeti.IsLocalRing.finiteNormalEquiv)).
- **The discriminant criterion** — a finite free algebra is étale iff the discriminant of a basis is a unit, over any commutative base ([`etale_iff_isUnit_discr`](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Discriminant.html#TauCeti.Algebra.etale_iff_isUnit_discr)).
- **Extension is detected on the completion** — for a Noetherian local ring of depth at least two, a cover extends across the closed point iff its base change to the completion does. This is 0BLL in depth at least two ([`extends_iff_completion_extends_of_two_le_depth`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/Completion.html#TauCeti.IsLocalRing.extends_iff_completion_extends_of_two_le_depth)).

### Notable definitions and infrastructure

- **Purity for a local ring** — the punctured spectrum and the predicate that every finite étale cover of it extends ([`PurityHolds`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.html#TauCeti.IsLocalRing.PurityHolds)). Every statement of Layers 1 and 2 is phrased through it.
- **Full faithfulness across a depth-two locus** — on a locally Noetherian scheme, restricting finite étale schemes to an open set is fully faithful when every local ring off that set has depth at least two ([`fullyFaithfulPullbackιOfTwoLeDepthStalk`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/FullyFaithful.html#TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepthStalk)). This is the §2.2 target `restrictOpen_fullyFaithful_of_depth` under another name, and it is what glues local extensions together.
- **Formal gluing** — homomorphisms of modules glue uniquely along a faithfully flat map that is an isomorphism modulo an ideal (Stacks 05ER; [`existsUnique_formalGlueing_lift`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGlueing/Morphisms.html#LinearMap.existsUnique_formalGlueing_lift)). Finiteness detection and torsion comparisons come with it, and this is the route to 0BLH.

### Roadmap coverage

Layer 0 is done: both miracle-flatness targets and all of §0.2. Layer 1 is partial. §1.1 and §1.2 are done, with 0BM8 in affine form. In §1.3 only 0BLL has landed, and only for depth at least two; 0BLH, 0BLI, 0EL8, 0EKS, 0BM6 and 0BLJ are missing. §1.4 has only a conditional reduction. A cover extends from a henselian section once restriction to that section is fully faithful, but 0BLM itself is not proved. Layer 2 is partial. §2.1 is proved in dimension two only. In §2.2 only the depth-two full-faithfulness result has landed; spreading out, 0EY7 and the regular codimension-two corollary are missing.

## The frontier

- **Restriction to a hypersurface section** (0BLJ, through 0BM6 and 0EKS) — full faithfulness of restriction from the punctured spectrum of `A` to that of `A/(f)` in depth at least three. This hypothesis is all that the existing henselian reduction lacks to give the local Lefschetz theorem 0BLM. It needs SchemeAndStackFoundations' local cohomology and formal completion.
- **Purity in dimension at least three** (0BMA) — the induction via a regular parameter `f`, passing to the completion so that `(Â, f)` is henselian. It waits on 0BLM.
- **Finite extension from the completion** (0BLH) — specialize the formal-gluing machinery to finite algebras over a principal-open cover of the punctured spectrum.
- **Spreading out from a local scheme** (0BQ5, 0EY3) — needs SchemeAndStackFoundations' finite-presentation limits. Together with purity, it gives the extension across points where purity holds, 0EY7.
- **Extension across regular codimension-two loci** — once 0BMA and 0EY7 land, this is a gluing argument with the full-faithfulness result already in place.
