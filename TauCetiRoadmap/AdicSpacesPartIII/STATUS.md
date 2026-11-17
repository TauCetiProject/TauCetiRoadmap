<!--tauceti-status:v1 {"roadmap":"AdicSpacesPartIII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer F0","remaining":"fullness of Spf on morphisms; F0.3 ideals of definition, thickenings, gluing and fibre products; F0.4 to F0.9","state":"partial"},{"id":"Layer R2","remaining":"flat-tft-is-tfp and tfp coherence in R2.1; admissible formal schemes, generic fibres, Raynaud's theorem; R2.10 section and Hasse domains","state":"partial"},{"id":"Layer R3","remaining":"everything except the projective trace and its cyclicity: Tate and Kiehl, vector bundles, Kiehl-properness, GAGA, algebra traces","state":"partial"}],"readme_sha":"4fc411b7967a071573a281a658f57b0d516fdb7038c9c27e0fd15d2b0bad2fbf","roadmap":"AdicSpacesPartIII","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: AdicSpacesPartIII

This file documents the status of the AdicSpacesPartIII roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The adic-ring constructions of F0.1 are in place, and the affine formal spectrum of F0.2 is built and mostly characterised. Formal schemes exist only as a first definition, and F0.4 to F0.9 have not begun. R2 and R3 each have a few early targets: algebras topologically of finite presentation and fractional valuation bounds in R2, and projective traces in R3.

### Named results

- **The formal spectrum of an adic ring** — [`Spf A`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Spf/Basic.html#TauCeti.FormalScheme.Spf) is a locally ringed space with global sections `A` ([`globalSectionsIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.html#TauCeti.FormalScheme.Spf.globalSectionsIso)), with local stalks whose residue field at `p` is `Frac(A/p)` ([`stalkResidueFieldEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Spf/Basic.html#TauCeti.FormalScheme.Spf.stalkResidueFieldEquiv)), and it is independent of the ideal of definition ([`structureSheafIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Spf/IdealIndependence.html#TauCeti.FormalScheme.Spf.structureSheafIso)) (EGA I 10.1.3, 10.1.6).
- **Basic opens of a formal spectrum** — the open `D(f)` of `Spf A` is the formal spectrum of the completed localisation `A_{f}` ([`restrictBasicOpenIso`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Spf/Restrict.html#TauCeti.FormalScheme.Spf.restrictBasicOpenIso)) (EGA I 10.1.4).
- **Finite modules as adic systems** — over a noetherian `I`-adically complete ring, `M ↦ (M/I^{n+1}M)ₙ` is an equivalence from finite modules to `I`-adic systems with finite bottom term ([`finiteReduction_isEquivalence`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/Tower/Reduction.html#TauCeti.ModuleTower.finiteReduction_isEquivalence)) (EGA I 0.7.2.9 and 0.7.2.10).
- **The criterion for topologically finite type** — over a noetherian adic ring, being a quotient of restricted power series is equivalent to being noetherian, adic for the extended ideal, and of finite type modulo it ([`isStrictlyTopologicallyFiniteType_algebraMap_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TopologicallyFiniteType/Adic.html#TauCeti.Huber.isStrictlyTopologicallyFiniteType_algebraMap_iff)) (EGA I 0.7.5.5).
- **Admissible means flat** — over a separated rank-one valuation base, an algebra topologically of finite presentation has no `ϖ`-torsion exactly when it is flat ([`isAdmissibleAlgebra_iff_flat`](https://taucetiproject.org/docs/TauCeti/RingTheory/Huber/TopologicallyFiniteType/FinitePresentation.html#TauCeti.Huber.isAdmissibleAlgebra_iff_flat)).

### Notable definitions and infrastructure

- **The completed localisation** [`AdicRing.CompletedAway`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicRing/CompletedAway.html#TauCeti.AdicRing.CompletedAway) has its universal property, noetherianity and flatness, and is identified with Huber's rational localisation `A⟨1/f⟩` ([`completionLocEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicRing/CompletedAway/RationalLocalization.html#TauCeti.AdicRing.CompletedAway.completionLocEquiv)). It supplies the sections of `Spf A` over basic opens and links the formal side to Part II's adic spaces.
- **The completed tensor product** [`AdicRing.CompletedTensorProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicRing/CompletedTensorProduct.html#TauCeti.AdicRing.CompletedTensorProduct) has its universal property, functoriality, a [noetherianity theorem](https://taucetiproject.org/docs/TauCeti/RingTheory/AdicRing/CompletedTensorProduct/Noetherian.html#TauCeti.AdicRing.CompletedTensorProduct.isNoetherianRing) and base change of restricted power series. Together these are the affine input for formal fibre products.
- **Formal schemes** [`FormalScheme`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/FormalScheme/Basic.html#TauCeti.FormalScheme) are locally ringed spaces covered by formal spectra. Ordinary schemes embed fully faithfully, and affine formal opens form a basis. Everything later in F0 is stated on this carrier.

### Roadmap coverage

F0.1 is done for the targets this roadmap owns: completed localisation, restricted power series (adic and noetherian), the topologically-finite-type criterion, the completed tensor product, and finite modules as compatible systems, including strictness of linear maps. F0.2 is done except *spf-morphism-correspondence*: `Spf.map` is defined and faithful, but fullness and the description of morphisms from a general formal scheme into `Spf A` are missing. F0.3 has the `FormalScheme` carrier and open subschemes, but no ideals of definition, thickenings, gluing, colimits of thickenings, fibre products or carrier comparison. F0.4 to F0.9 are untouched. R2 is partial: R2.1 has its definitions and the flatness characterisation, and R2.10 has *fractional-valuation-bound*; everything else is untouched. R3 is partial only through R3.8, where *projective-module-trace* and *projective-trace-cyclicity* are proved. The other R3 targets, from Kiehl glueing to proper GAGA, have no new results.

## The frontier

- **Morphisms into `Spf A`**: prove that every morphism of locally ringed spaces `Spf B → Spf A` is `Spf.map` of a continuous homomorphism, and extend this to a general formal scheme as the source. This completes F0.2.
- **Ideals of definition and thickenings**: the F0.3 targets *ideal-of-definition*, *colimit-of-thickenings* and *formal-scheme-gluing* come next on the `FormalScheme` carrier. The completed tensor product is ready for *formal-fibre-product*.
- **Coherent formal modules on `Spf A`**: F0.6's *affine-coherent-equivalence* can build on the finite-module/adic-system equivalence that is already proved.
- **Flat and topologically finite type implies finite presentation**: R2.1's *flat-tft-is-tfp* (Raynaud–Gruson) and *tfp-algebra-coherent* remain. The coherent-ring theory, including coherence of polynomial rings in infinitely many variables over a noetherian ring, is the groundwork.
- **Traces of finite locally free algebras**: R3.8's `Algebra.projectiveTrace`, transitivity, the trace-form criterion for étaleness, and the categorical realization, which needs PivotalSpherical's trace API.
