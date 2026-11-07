<!--tauceti-status:v1 {"roadmap":"EtaleCohomologyFoundations","to_sha":"315040461dd16f4333a14977d01a661f2c11e50a","ts":"2026-10-23T17:09:14Z"}-->
# Status: EtaleCohomologyFoundations

This file documents the status of the EtaleCohomologyFoundations roadmap up until `3150404` (2026-10-23T17:09:14Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work has started on the two foundational entry points: the compactification package (§§G.1, G.3) and the finite étale Galois category (§F.0.2). Both are partial. Nagata existence (§G.2) has not started. Neither have étale module sheaves, base change, finiteness, adic realization, duality or the trace sections, as far as the library source shows.

### Named results

- **Common refinement as a product** — [the common refinement](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Refinement.html#TauCeti.Compactification.commonRefinement) of two compactifications is the schematic closure of the source in the fibre product of their ambient schemes. It is [the binary product in dense compactifications](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Refinement.html#TauCeti.DenseCompactification.isLimitCommonRefinementFan).
- **Finite refinement** — [every nonempty finite family of compactifications has a dense common refinement](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Refinement.html#TauCeti.Compactification.exists_forall_nonempty_hom).
- **Uniqueness of refinement maps** — [maps from a compactification with schematically dense interior to a fixed compactification are unique](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Uniqueness.html#TauCeti.Compactification.hom_unique), so dense compactifications form a thin category.
- **Monomorphisms are summands** — [a monomorphism of finite étale schemes is the inclusion of a direct summand](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/Limits.html#TauCeti.FiniteEtaleScheme.exists_isColimit_binaryCofanMk_of_mono), and [epimorphisms are exactly the surjections](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/Limits.html#TauCeti.FiniteEtaleScheme.epi_iff_surjective).
- **Étale invariants** — [the invariants of a finite étale algebra under a finite monoid of endomorphisms form an étale algebra](https://taucetiproject.org/docs/TauCeti/RingTheory/Etale/Equalizer.html#TauCeti.FixedPoints.etale_subalgebra). This is the algebraic input for quotients by finite groups.

### Notable definitions and infrastructure

- [Compactifications](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Basic.html#TauCeti.Compactification) of a morphism and their [dense](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Compactification/Basic.html#TauCeti.DenseCompactification) full subcategory. Every morphism between compactifications is proper, and base change works along any map of bases, keeping density for flat base change. The identity compactification of a proper morphism is initial. This is the carrier that the coherent and étale proper-support functors will use.
- The [geometric fibre functor](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.html#TauCeti.FiniteEtaleScheme.fiber) at a separably closed point, sending a finite étale scheme to the finite set classifying its fibre. It is corepresented by the point and compatible with base change. It preserves finite limits, finite coproducts and epimorphisms, which are most of the fibre-functor axioms.
- Finite étale schemes over a base have finite limits and are finitary extensive. They also have the existing anti-equivalence with finite étale algebras on affines and splitting over a field.

### Roadmap coverage

§G.1 is partial. The carrier, morphisms, identity compactification and base change are in place. Dense replacement with its base-change comparison is missing, as are transport, products over the base, and restriction to base opens. §G.3 is partial. The common refinement, binary products, finite refinement and uniqueness of maps are in place. Cofilteredness is not stated as such, and the canonical cones with their base-change compatibility and the categorical comparison principle are missing. §G.2 (Nagata) is untouched. §F.0.2 is partial: most of the Galois-category axioms hold, but finite-group quotients, conservativity, the `GaloisCategory` instance, `π₁`, paths and lisse monodromy are missing. The source shows nothing for §F.0.1 (constructible étale module sheaves) or for §§F.0.3–F.10 and §§0.5–0.11.

## The frontier

- **Galois category of finite étale covers** — quotients by finite groups (via the étale-invariants result above) and conservativity of the fibre functor. With those, the `PreGaloisCategory` and `GaloisCategory` instances and the `FiberFunctor` structure for connected nonempty schemes are within reach. After that come `π₁` and paths.
- **Dense replacement** — schematic closure of the interior in an arbitrary compactification, with its canonical map, functoriality and the base-change comparison. §G.3's treatment of nondense sources and arbitrary base change depends on it.
- **Refinement comparison principle** — canonical comparisons between compactification choices, independent of the refining cone, satisfying the cocycle and base-change laws. It needs the cofiltered statement and canonical cones.
- **Nagata compactification** — existence of a dense compactification for separated finite-type morphisms over a qcqs base. It is blocked on admissible-blowup geometry and Noetherian approximation from SchemeAndStackFoundations and StableReduction.
- **Constructible étale module sheaves (§F.0.1)** — not started. This is the prerequisite for lisse monodromy and for everything from §F.0.3 onward.
