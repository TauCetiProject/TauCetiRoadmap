<!--tauceti-status:v1 {"roadmap":"MorseNovikov","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: MorseNovikov

This file documents the status of the MorseNovikov roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebraic foundations are well advanced. N1's period-controlled completion is nearly complete: Nov is a complete topological ring with functoriality, exp/log, infinite products and the Laurent comparison. N4's based scalar torsion now has multiplicativity and scalar extension. Every geometric layer (N2, N3, N5, N6, N7) is still untouched.

### Named results

- **Nov is the period completion of the group ring.** The Novikov series are complete and separated for the period filtration, and the finitely supported series are a dense, uniformly embedded copy of R[H]: [`completionPkg`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/Topology.html#TauCeti.NovikovSeries.completionPkg).
- **Novikov rings of torsion-free groups are domains.** Over a domain, for finitely generated torsion-free H and any period map, injective or not, the leading-term argument rules out zero divisors: [`isDomain_of_fg`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/LeadingTerm.html#TauCeti.NovikovSeries.isDomain_of_fg).
- **Exponential and logarithm.** Over a ℚ-algebra, exp is an isomorphism from the positive ideal onto its group of principal units, with inverse log. This is the step from the log series of periodic orbits to the zeta function: [`expMulEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/ExpLog.html#TauCeti.NovikovSeries.expMulEquiv).
- **Multiplicativity of torsion.** For a short exact sequence of based complexes with acyclic ends and compatible bases, τ(C₂) = ε·τ(C₁)·τ(C₃), with the explicit Koszul sign ε: [`reidemeisterTorsion_eq_mul_of_shortExact`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_mul_of_shortExact).
- **Torsion detects acyclicity, and is independent of choices.** Torsion is nonzero exactly on bounded acyclic complexes, does not depend on the boundary bases or lifts, and transforms by the alternating determinant under a change of basis: [`reidemeisterTorsion_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_zero_iff), [`reidemeisterTorsion_eq_mul_finprod_det`](https://taucetiproject.org/docs/TauCeti/Algebra/Homology/ReidemeisterTorsion.html#HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det).

### Notable definitions and infrastructure

- **The pushforward of Novikov series**, [`mapRingHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/Functoriality.html#TauCeti.NovikovSeries.mapRingHom), along a coefficient map and an exponent map that rescales periods by a positive constant. It sums coefficients over fibres, is continuous, and restricts to the nonnegative subrings and positive ideals. Restriction along a map with finite kernel accompanies it. These are the maps that the finite cyclic cover and norm arguments in N4–N6 need.
- **The Laurent comparison**, [`toLaurentSeries`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/LaurentSeries.html#TauCeti.NovikovSeries.toLaurentSeries). For H=ℤ it is a coefficient-preserving ring isomorphism with Mathlib's Laurent series, extending the inclusion of Laurent polynomials. Over a field it is a uniform equivalence of the period and X-adic topologies. The circle and mapping-torus calculations will run through it.
- **Completed free modules over Nov.** Completed combinations of lifted generators are coordinatised by chosen orbit lifts, and a change of lift acts by monomials. Finite Novikov matrices get uniform cutoff and truncation estimates, so group-ring matrices extend uniquely to continuous maps: [`continuous_mulVec_extension_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovSeries/Matrix.html#Matrix.continuous_mulVec_extension_iff). This is the carrier for the Novikov complex.

### Roadmap coverage

N1 is partial, but only a little remains. Proved: the carrier and its ring and algebra structure, monomial units, the group-ring embedding (onto exactly when N=0), the period topology with completeness, the completion property and continuity, pushforward and restriction functoriality, rescaling and reversal, geometric series, exp/log, filtered infinite products, the Laurent comparison, the torsion-free domain theorem, and the completed free modules with their matrix estimates. Still missing: the Hahn-series comparison through a period-kernel splitting, and the irrational noninjective acceptance example. N4 is partial. Proved: scalar torsion with basis-independence, basis change, two-term torsion, multiplicativity for acyclic sequences, and scalar extension. Still missing: the homology determinant line and its long-exact-sequence correction, direct sums, the square-minor formula, mapping-cone transformation, total quotient rings and their period-order topology, cyclic-cover norms, and componentwise torsion. N2, N3, N5, N6 and N7 are untouched.

## The frontier

- **Hahn-series comparison (N1)**: for a supplied splitting of the period kernel, compare Nov with the locally finite Hahn series whose coefficients lie in the kernel group ring, and prove the coefficient and topology formulas. Then add the ℤ³, N(a,b,c)=a+√2b acceptance example.
- **Determinant line and general multiplicativity (N4)**: the homology-basis determinant line for non-acyclic complexes, and multiplicativity through the long exact homology sequence with its torsion correction. The acyclic case is proved and is the base for this.
- **Square-minor formula and direct sums (N4)**: torsion as an alternating product of projected minors, and additivity under direct sums. Both are needed before torsion can be taken componentwise.
- **Total quotient rings (N4)**: show that the total quotients of ℤ[H] and Nov(ℤ,H,N) are finite products of characteristic-zero fields, then build the period-order topology and cyclic-cover norms. These use the pushforward and domain results above.
- **Closed one-forms and period covers (N2)**: the zero locus, the Morse condition, the period homomorphism and the period-kernel cover. These depend on the DifferentialGeometry, MorseTheory and UniversalCovers suppliers rather than on anything built here.
