<!--tauceti-status:v1 {"roadmap":"MorseNovikov","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
# Status: MorseNovikov

This file documents the status of the MorseNovikov roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the algebraic foundations have begun. The scalar Reidemeister torsion of a based complex over a field is defined, with its basic invariance laws, and the Novikov series carrier exists as an additive group without multiplication. The geometric layers, from closed one-forms and lifted moduli through the Novikov complex, periodic orbits, the dynamical torsion theorem and Euler structures, have not begun.

### Named results

- **Independence of choices for torsion.** For a bounded acyclic complex, the alternating product of brackets is the same for every choice of boundary bases and lifts: [`reidemeisterTorsion_eq_finprod`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_finprod).
- **The graded basis-change formula.** Replacing the chain bases multiplies the torsion by the alternating product of the transition determinants, with permutation signs and unit rescalings as special cases: [`reidemeisterTorsion_eq_mul_finprod_det`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det).
- **Torsion detects acyclicity.** The torsion of a bounded based complex vanishes exactly when the complex is not acyclic: [`reidemeisterTorsion_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_zero_iff).
- **Two-term torsion.** An acyclic complex in two consecutive degrees has torsion a signed power of the determinant of its differential, which fixes the roadmap's a⁻¹ convention: [`reidemeisterTorsion_eq_det_zpow`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_det_zpow).

### Notable definitions and infrastructure

- **Based scalar torsion**, [`reidemeisterTorsion`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion), for ℤ-graded complexes of vector spaces with ordered bases, set to zero off the bounded acyclic case. It is the scalar that N4's multiplicativity, total-quotient and cellular-torsion statements are built on.
- **Novikov series**, [`NovikovSeries`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/Basic.html#TauCeti.NovikovSeries), over an arbitrary abelian exponent group with a possibly noninjective period map, using the exact "finite below every cutoff" support condition. The finite-fibre and uniform cutoff lemmas for convolution are already in place, so the ring structure is the next step.
- **Bases adapted to a short exact sequence**, [`ofExactLift`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Basis/Exact.html#Module.Basis.ofExactLift), with a block-triangular transition matrix whose determinant does not depend on the lifts. This is the linear algebra under the bracket calculus.

### Roadmap coverage

N1 is partial: the carrier, the support-condition equivalence, least periods, the additive and module structure, and the embedding of finitely supported functions (onto exactly when N=0) are proved. Convolution, the ring and algebra laws, monomial units, the period topology and completion, functoriality, geometric series and exp/log, and the Laurent and Hahn comparisons are not. N4 is partial: scalar torsion with independence of boundary bases and lifts, basis change and sign rules is proved. The homology determinant line, scalar extension, direct sums, multiplicativity, the square-minor formula, total quotient rings, the period-order topology, cyclic-cover norms and componentwise torsion are not. N2, N3, N5, N6 and N7 are untouched.

## The frontier

- **Novikov ring structure (N1)** — define convolution from the finite-fibre lemma and prove the commutative-ring and R-algebra laws, monomial units and the group-ring embedding as a ring map. Everything downstream in N1 depends on this.
- **Period-filtration topology and completion (N1)** — the neighbourhoods U_C, completeness, density of truncations and the universal completion property, followed by the coefficient/exponent pushforwards.
- **Torsion multiplicativity and the determinant line (N4)** — the homology-basis determinant line, multiplicativity for based short exact sequences of acyclic complexes with the Koszul sign, and the long-exact-sequence correction for general complexes. `ofExactLift` is the natural input.
- **Square-minor formula and scalar extension (N4)** — the projected-minor expression for torsion and its compatibility with field extension and direct sums, needed before torsion can be taken componentwise over total quotient rings.
- **Closed one-forms and period covers (N2)** — the zero locus, Morse condition and period homomorphism. This depends on the DifferentialGeometry and MorseTheory suppliers named in the README rather than on anything built here.
