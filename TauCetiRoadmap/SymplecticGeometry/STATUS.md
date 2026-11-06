<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16","ts":"2026-11-05T21:11:17Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `6b391d7` (2026-11-05T21:11:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space is essentially complete, including the classification of cotangent lifts. The matrix polar package is nearly done, and contact geometry has a solid floor through contactization. The symplectic suspension, the circle foundations, coadjoint orbits and convexity are partial. Embedded Lagrangians, generating functions, reduction proper, toric classification and Liouville–Arnold have not begun.

### Named results

- **Classification of cotangent lifts** — a diffeomorphism T*M → T*N between boundaryless Hausdorff manifolds is a cotangent lift [exactly when it pulls λ_N back to λ_M](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Classification.html#Diffeomorph.exists_cotangent_eq_iff_mpullback_liouvilleForm), and the base diffeomorphism [is unique](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Classification.html#Diffeomorph.existsUnique_cotangent_eq_of_mpullback_liouvilleForm).
- **Connectedness of the real symplectic group** — the polar contraction t ↦ P^(1−t)U [stays among symplectic matrices](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Polar/Symplectic.html#SymplecticGroup.joinedIn_polarUnitary), so [Sp(2n,ℝ) is path connected](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#Matrix.isPathConnected_symplecticGroup).
- **The Schur–Horn theorem** — the diagonals of the unitary conjugates of diag(w) [are exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star), with [Rado's majorization criterion](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/PermutationOrbit.html#TauCeti.mem_convexHull_range_comp_perm_iff) as the combinatorial half.
- **The Levi criterion for contact forms** — a one-form is contact [exactly when it vanishes nowhere and the Levi form of its kernel is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Levi.html#TauCeti.SmoothForm.isContactForm_iff_forall_bijective_distributionLeviForm), so contact manifolds [have odd dimension](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Distribution.html#TauCeti.IsContactDistribution.odd_finrank).
- **Contactization** — dz − θ on W × ℝ is [contact exactly when −dθ is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothForm.isContactForm_contactization_iff). On J¹M = T*M × ℝ, one-jets of functions are [Legendrian embeddings](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Legendrian.html#TauCeti.CotangentBundle.isLegendrianEmbedding_oneJet).

### Notable definitions and infrastructure

- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) carries its suspension flow, time form, [fibre form](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/MappingTorus.html#TauCeti.SmoothMappingTorus.fiberForm) and [closed orbits](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.closedOrbit).
- **The positive-period circle** `AddCircle p` is now a Lie group with a [time form](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/AddCircle.html#AddCircle.timeForm) and [orientation](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Orientation/AddCircle.html#AddCircle.orientation), and these assemble into the [total circle family](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/CircleFamily.html#TauCeti.CircleFamily) over varying periods.
- **The Kirillov–Kostant–Souriau form** [`kksSymplecticForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Coadjoint.html#Module.Dual.kksSymplecticForm) on the algebraic tangent model 𝔤/𝔤_ν is [nondegenerate](https://taucetiproject.org/docs/TauCeti/Algebra/Lie/Coadjoint.html#Module.Dual.kksForm_nondegenerate), and is computed for so(3) and the Heisenberg algebra.

### Roadmap coverage

**CotangentLagrangian.** C1 items 1–3 are done. Item 4 has the open-restriction and product diffeomorphisms, but not visibly their compatibility with λ and ω. C2 is done only at the linear level: there are no tangent-image Lagrangian embeddings or immersions. C2.0 is nearly done: polar decomposition with uniqueness, smooth dependence and equivariance, plus a smooth matrix logarithm. C2.1 is partial: connectedness, symplectic polar preservation and the Cartan involution of sp are in; realification, the intersections and maximal compactness are not. C2.2 has the Liouville field and the lift classification. Exact Lagrangians, graphs, conormals and the cosphere are missing; the Kodaira–Thurston manifold is only a compact quotient so far, without its symplectic form. C3 is untouched. C4 has only a relative Poincaré lemma on convex neighbourhoods.

**ContactGeometry.** CG1 and CG2 are largely done, through the standard and sphere models, Reeb rescaling, contact Hamiltonian fields and their flows; noncooriented contact lines are not visible. CG3 has only the pointwise linear normal form and the contact-Moser field. CG4 has contactization but not symplectization. CG5 has Legendrian immersions and embeddings, the dimension bound and Legendrian lifts, but no neighbourhood theorems. CG6 has the cooriented Jacobi bracket only.

**IntegrableSystems.** I2.0 is mostly done; uniform parameter estimates are not visible. I1 and I2–I4 are untouched.

**HamiltonianReduction.** R1 has fundamental vector fields and their flows but no moment maps. R2 has Lie-group coadjoint stabilizers and the algebraic KKS form, but not orbit manifolds. R1a, R2a and R3–R5 are untouched.

**ConvexityToric.** T3 has Schur–Horn. T1, T2, T4 and T5 are untouched.

**Root S0–S2.** S0 has the mapping torus, its forms and the splitting TY = ℝT ⊕ V, but not Ω on X_φ. S1 has closed orbits and orbit tori with their counting and naturality laws, but not the block structure. S2 has only the lemma that [compact immersed curves tangent to T lie on closed orbits](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorField/MappingTorus/Orbit.html#TauCeti.SmoothMappingTorus.minimalPeriod_pos_of_mfderiv_ne_zero).

## The frontier

- **The suspension form (S0):** construct Ω = ds∧dt + ω_v on (ℝ/ℤ) × Y_φ and prove it closed, nondegenerate and correctly oriented. Every ingredient is in place.
- **Contact Darboux and Gray stability (CG3):** the contact-Moser field and the time-dependent flow identities for forms exist. What remains is integrating the Moser path and the relative Gray isotopy fixing K.
- **Lagrangian embeddings (C2, C2.2):** tangent-image predicates, then the zero section, graphs of closed one-forms and conormals. C1's λ and ω compatibilities for open restrictions and products belong here too.
- **Maximal compactness (C2.1):** realification, the three intersections with U(n), and the trace-growth proofs. The key step, that a compact subgroup's only positive semidefinite element [is the identity](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/Compact.html#Matrix.PosSemidef.eq_one_of_mem_isCompact_subgroup), is already proved.
- **Moment maps and coadjoint orbit manifolds (R1, R2):** no moment map exists yet, and the KKS form awaits a smooth structure on orbits.
