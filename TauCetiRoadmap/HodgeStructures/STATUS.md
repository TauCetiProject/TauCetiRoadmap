<!--tauceti-status:v1 {"roadmap":"HodgeStructures","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"L0","state":"done"},{"id":"L1","state":"done"},{"id":"L2","state":"done"},{"id":"L3","state":"done"}],"readme_sha":"11ab7306fedb91d80b4035283d0a436e9fc5bdb76e52d1ea6316cbb9735351ff","roadmap":"HodgeStructures","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: HodgeStructures

This file documents the status of the HodgeStructures roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four milestones are proved, and so is everything the previous report left partial: the fine conjugation relation, the abelian category of mixed Hodge structures, the effective weight-one instance and the internal Hom. On the evidence here, no target the README sets remains open. What is left lies beyond the README: the successor roadmap on variations, and a few natural extensions.

### Named results

- **Semisimplicity of polarizable rational Hodge structures, categorically** — polarizable rational Hodge structures of weight n form an abelian category, and every object in it is isomorphic to a finite biproduct of simple objects ([`PolarizableHodgeStructureCat.exists_iso_biproduct_simple`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Semisimple.html#TauCeti.Hodge.PolarizableHodgeStructureCat.exists_iso_biproduct_simple)). This rests on the orthogonal-complement theorem ([`exists_isCompl_of_isPolarizable`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Orthogonal.html#TauCeti.Hodge.exists_isCompl_of_isPolarizable)).
- **The Hodge decomposition** — the components H^{p,n−p} = F^p ∩ conj F^{n−p} of a bounded n-opposed filtration form an internal direct sum, and conversely ([`HodgeStructureOn.isInternal_piece`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Decomposition.html#TauCeti.Hodge.HodgeStructureOn.isInternal_piece)). The Hodge numbers then partition the dimension, which is the L3 milestone ([`finsum_hodgeNumber_eq_finrank`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Dimension.html#TauCeti.Hodge.HodgeStructureOn.finsum_hodgeNumber_eq_finrank)).
- **Deligne's bigrading and strictness** — Deligne's closed-formula I^{p,q} form an internal direct sum that recovers both filtrations ([`isInternal_deligneSplittingFamily`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Decomposition.html#TauCeti.Hodge.MixedHodgeStructure.isInternal_deligneSplittingFamily)). As a consequence, morphisms of mixed Hodge structures are strict for F and W ([`Hom.range_inf_F_eq_map_F`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Strictness.html#TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F)), and mixed Hodge structures form an [abelian category](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Abelian.html#TauCeti.Hodge.MixedHodgeStructureCat.abelian).
- **Deligne's fine conjugation relation** — conjugation exchanges I^{p,q} and I^{q,p} modulo the sum of the I^{r,s} with r < q and s < p, exactly as Peters–Steenbrink state it ([`map_latticeConj_deligneSplitting_sup_below`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Mixed/Conjugation.html#TauCeti.Hodge.MixedHodgeStructure.map_latticeConj_deligneSplitting_sup_below)).
- **Riemann forms are polarizations** — for a complex structure J on the realification of a flat lattice, the Riemann forms of J are exactly the forms that polarize its effective weight-one Hodge structure ([`isRiemannForm_iff_isPolarization`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/WeightOne/RiemannForm.html#TauCeti.AlmostComplexStructure.isRiemannForm_iff_isPolarization)). This is the abelian-variety case of the theory.

### Notable definitions and infrastructure

- [`TauCeti.Hodge.HodgeStructureOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Structure.html#TauCeti.Hodge.HodgeStructureOn) — a single pure object, parametric in its conjugation. Graded pieces, substructures, quotients, duals, tensor products and the internal Hom are all built on it once.
- [`TauCeti.Hodge.PolarizableHodgeStructureCat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/Category.html#TauCeti.Hodge.PolarizableHodgeStructureCat) — the bundled category of polarizable rational Hodge structures with ordinary morphisms, the category the README names. It embeds fully and faithfully into mixed Hodge structures, and it has rational and complex realizations.
- [`TauCeti.AlmostComplexStructure.latticeHodgeStructureEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Hodge/WeightOne/Lattice.html#TauCeti.AlmostComplexStructure.latticeHodgeStructureEquiv) — complex structures on ℝ ⊗ V are equivalent to effective integral weight-one Hodge structures on V. Weight-one examples can therefore be produced from either side.

### Roadmap coverage

All four layers are done. **L0** has both directions of the decomposition, and every companion is in place: morphisms, conjugation symmetry, dual, tensor product, internal Hom, and the Tate twist identified with tensoring by ℤ(m). The effective weight-one bridge is proved in both directions, with the real form V_ℝ first-class. **L1** has the Weil operator, the positive-definite Hodge form, and semisimplicity both as the complement theorem and as a statement about the abelian category. **L2** has the bigrading with its full API, including the fine conjugation relation, and strictness for both filtrations, with the abelian category the README asks for. **L3** has Hodge types, period-domain points with a fixed form, the dimension partition and the isometry group. Among the worked instances, Tate ℤ(m), pure-as-mixed and effective weight one are all built.

## The frontier

- **Variations of Hodge structure** — the successor roadmap: period domains as complex manifolds, Griffiths transversality, period maps and monodromy. It consumes the fiber datum, the period-domain points and the isometry group built here.
- **Polarizations of duals and internal Homs** — tensor products and direct sums of polarizations exist, but the dual and the internal Hom carry no polarization yet. This goes beyond the README.
- **Tensor products and duals of mixed Hodge structures** — the mixed category has products, kernels and cokernels, but no monoidal structure. This also goes beyond the README.
- **Specializing onto Mathlib's filtration API** — the README's hook for `opposed`, `gradedF` and `gradedComplexEquiv` applies only if that in-progress Mathlib work lands.
