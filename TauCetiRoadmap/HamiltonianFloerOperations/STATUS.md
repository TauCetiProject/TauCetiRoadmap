<!--tauceti-status:v1 {"roadmap":"HamiltonianFloerOperations","to_sha":"b257e0ff255355b2b692c1311d061d2b4dc84e53","ts":"2026-10-26T06:42:33Z"}-->
# Status: HamiltonianFloerOperations

This file documents the status of the HamiltonianFloerOperations roadmap up until `b257e0f` (2026-10-26T06:42:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebra of H1 is mostly in place, but only in abstract form. That covers the period group, cap classes, the Floer Novikov ring and the coefficient comparison with quantum coefficients. Two pieces reach beyond H1: H3's pointwise and rectangle energy identity, and H6's bilinear product built from a supported kernel. Nothing is yet attached to an actual closed symplectic manifold. There are no punctured domains, no moduli spaces and no counts, and H4, H5 and H7 have not begun.

### Named results

- **The Floer energy identity** — for a perturbation K = K_s ds + K_t dt, the energy of a map over a rectangle is its symplectic area, plus the boundary integral of K, minus the integral of the curvature R_K. It is proved for maps into a symplectic vector space ([`integral_floerEnergyDensity`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Energy.html#TauCeti.SymplecticForm.integral_floerEnergyDensity)).
- **Caps are determined by action and grading** — two cap classes of an orbit coincide exactly when they have the same action and the same grading. This is why Γ is the quotient by the joint kernel of area and Chern number ([`CapClass.mk_eq_mk_iff_action_eq_and_index_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap.html#TauCeti.Floer.CapClass.mk_eq_mk_iff_action_eq_and_index_eq)).
- **Cap independence of the product index** — μ₁ + μ₂ − μ₀ + 2c₁(A), with A = D₀ + u − D₁ − D₂, does not depend on the caps ([`add_sub_add_two_mul_chern_productClass_eq`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/Cap.html#TauCeti.Floer.add_sub_add_two_mul_chern_productClass_eq)).
- **The monotone Laurent model** — for a positively monotone pair, a coefficient function is a Floer Novikov series exactly when its degrees are bounded above ([`NovikovRing.forall_finite_lt_iff_bddAbove_degree`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/NovikovRing.html#TauCeti.Floer.NovikovRing.forall_finite_lt_iff_bddAbove_degree)).
- **Descent of q^A ↦ e^(−A)** — the comparison from a common class group to the joint-period quotient is continuous and surjective. Two monomials become equal exactly when their areas and Chern numbers agree, so classes with equal area and different degree stay apart ([`periodGroupComparison_single_eq_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/CoefficientComparison.html#TauCeti.Floer.periodGroupComparison_single_eq_iff)).

### Notable definitions and infrastructure

- **The Floer Novikov ring** — [`NovikovRing`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/NovikovRing.html#TauCeti.Floer.NovikovRing) is the ring of series ∑ a_γ e^γ over the [period group](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/PeriodGroup.html#TauCeti.Floer.PeriodGroup), with valuation −ω and degree 2c₁. Its homogeneous pieces give H1's graded model rather than an integer direct sum.
- **The coefficient comparison** — [`coefficientComparison`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Floer/CoefficientComparison.html#TauCeti.Floer.coefficientComparison) is the completed map q^A ↦ e^(−A). It works for any area-preserving class-group map, with finite coefficient sums even for infinite kernels or dense periods.
- **Kernel products on completed modules** — [`kernelProduct`](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelProduct) turns a coefficient kernel n(p₁, p₂, p₀) into a bilinear map on completed combinations, provided n obeys an action bound F₀ ≤ F₁ + F₂ + C. Its [matrix entries](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.kernelMatrix_mem_periodFiltration) have the lower valuation bound H6 requires, and for an invariant kernel it is [Novikov-bilinear](https://taucetiproject.org/docs/TauCeti/RingTheory/NovikovModule/Bilinear.html#TauCeti.NovikovModule.novikovKernelProduct). Rigid pair-of-pants counts are meant to be its kernel.

### Roadmap coverage

H1 is partial. It has the period group, cap classes as Γ-torsors with recapping and the product class, the graded Floer Novikov ring with its monotone and c1-zero specialisations, and the descended coefficient comparison. H1 still lacks three things: the spherical Hurewicz image and Chern class of an actual manifold, the identification with G7's own class group, and the cochain regrading C^k = CF_(n−k) with its orientation lines. H3 is partial only in its first formula: the energy identity, curvature, Poisson bracket and coordinate Floer equation hold on rectangles in a vector-space target. The pair-of-pants version on a manifold, curvature bounds over families and all compactness are missing. H6 has only the algebraic bilinear product; there are no counts, no m2 and no unit or sewing homotopies. H2, H4, H5 and H7 are untouched, and no H8 check has been done.

## The frontier

- **Cochain regrading** — define C^k = CF_(n−k) together with the sign and shift identities, so that the product has degree zero. This is purely algebraic.
- **Attaching Γ and caps to a manifold** — take S to be the spherical image of π₂ → H₂ and the raw caps to be actual disc classes, with the true area and first Chern class. This waits on the Hurewicz and Chern-class interfaces from lower geometry roadmaps.
- **The coefficient map to G7** — instantiate the common class group with G7's chosen class group and energy and Chern maps.
- **The energy identity on a pair of pants** — globalise the rectangle identity to the punctured domain with strip-like ends and a manifold target. Then bound the integrated curvature uniformly over stretched families, using the vanishing of curvature on cylindrical necks.
- **Punctured pair-of-pants data (H2)** — the three-ended domain, its ends and collars, and the perturbation data K and J that agree with the end Hamiltonians on the tails. It consumes DGFloer 7.C and HeegaardFloer F0–F2.
