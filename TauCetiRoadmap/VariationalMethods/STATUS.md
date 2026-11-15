<!--tauceti-status:v1 {"roadmap":"VariationalMethods","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"sublevel and sequential weak lsc, Eberlein-Smulian closure form, real/complex dictionary, convex energies, compact maps on bounded sets, sequential direct method","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"3e1960f3575ff888e9a9ff35bccd7a592b929ceaf30c0c7545c25d4ba10f02fc","roadmap":"VariationalMethods","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: VariationalMethods

This file documents the status of the VariationalMethods roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The topological direct method, the first end theorem, is proved together with its bounded-sublevel API. The rest of Layer 1 (the sequential route, weak lower semicontinuity of convex energies, compact maps on bounded sets and the real/complex dictionary) is open, and nothing from Layers 2–6 has landed yet.

### Named results

- **The direct method** — a weakly lower semicontinuous energy with norm-bounded sublevels on a nonempty weakly closed set in a reflexive space attains its minimum, with no lower bound assumed on the energy ([`exists_isMinOn_of_weak_closed`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/DirectMethod.html#TauCeti.exists_isMinOn_of_weak_closed)). It is proved over any proper nontrivially normed field, for energies valued in a linear order, and a single nonempty bounded sublevel is enough ([`exists_isMinOn_of_weak_closed_of_isBounded_sublevel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/DirectMethod.html#TauCeti.exists_isMinOn_of_weak_closed_of_isBounded_sublevel)).
- **Weak compactness of the minimizers** — under the same hypotheses the set of minimizers is weakly compact, and so is every bounded sublevel ([`isCompact_toWeakSpace_minimizers`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/DirectMethod.html#TauCeti.isCompact_toWeakSpace_minimizers)).

### Notable definitions and infrastructure

- **Bounded sublevels relative to an admissible set** ([`HasBoundedSublevelsOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/BoundedSublevels.html#TauCeti.HasBoundedSublevelsOn)) — this is the coercivity hypothesis of the direct method. It is shown equivalent to its sequence form ([`hasBoundedSublevelsOn_iff_seq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Variational/BoundedSublevels.html#TauCeti.hasBoundedSublevelsOn_iff_seq)) and to divergence of the energy along points escaping every bounded set. It is stable under shrinking the set, positive scaling and adding an energy bounded below on the set.
- **The sublevel transfer lemma** — a minimum on a sublevel below its threshold is a minimum on the whole set ([`isMinOn_sublevel_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Order/Filter/Extr.html#TauCeti.isMinOn_sublevel_iff)). The direct method reduces to a compact sublevel through this lemma.

### Roadmap coverage

Layer 1 is partial. In 1.1 the bounded-sublevel predicate is done, apart from stability under affine translation and change of variable by a linear equivalence, which were not found. The rest of 1.1 is open: the sublevel characterization of weak lower semicontinuity, its sequential version, the sequential-closure form of Eberlein–Šmulian, the real/complex weak-topology dictionary and reflexivity of Hilbert spaces. Sections 1.2 (convex energies) and 1.3 (compact maps on bounded sets) are untouched. In 1.4 the topological direct method is done, but the sequential version with a bounded minimizing sequence is not. Layers 2–6 are untouched: first variations and quadratic energies, the compact form pair and constrained spheres, successive minima and Courant–Fischer on the form domain, the represented operator and the differential-energy adapter, and Ritz–Galerkin. The real coercive solution operator, its eigenbasis and a real min–max principle already exist in Tau Ceti as suppliers that these layers are meant to extend.

## The frontier

- **Sublevel characterization of weak lower semicontinuity (1.1)** — prove that weak lower semicontinuity on `S` is equivalent to every sublevel being weakly closed in `S`, and that it implies the sequential version. This is the remaining input that makes the direct method usable on concrete energies.
- **Convex energies (1.2)** — show that norm-lower-semicontinuous convex functions are weakly lower semicontinuous, using closed convex sublevels and Mathlib's `Convex.toWeakSpace_closure`. Norms, norm powers and `‖D u‖²` follow as instances.
- **Compact maps on bounded sets (1.3)** — prove that a compact operator is weak-to-norm continuous on bounded sets, and give the counterexample showing the sphere `{‖j u‖ = 1}` is not weakly closed. Layer 3's constrained minima depend on this.
- **The sequential direct method (1.4)** — show that a bounded minimizing sequence on a sequentially weakly closed set gives a minimizer. This needs BanachSpaceTheory B2's Eberlein–Šmulian, and the sequential-closure form of Eberlein–Šmulian on weakly compact sets also depends on B2's finite norming sets.
- **The real/complex dictionary (1.1)** — identify the weak topology and reflexivity of a complex space with those of its real restriction, and prove complete inner-product spaces reflexive. Every complex-scalar statement from Layer 2 onward goes through this.
