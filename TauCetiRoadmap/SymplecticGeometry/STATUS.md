<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01+00:00"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `e583e15` (2026-11-07T20:34:01+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space and the basic layer of contact geometry are in place. Contact forms, Reeb and contact Hamiltonian dynamics, contactization and Legendrians are all built. The matrix polar package, positive-period circles and the suspension carrier are well advanced. Moment maps, reduction, most convexity, Liouville–Arnold and every neighbourhood or stability theorem have not begun, or exist only as ingredients.

### Named results

- **The cotangent bundle is symplectic**: ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm).
- **The contact criteria**: a one-form on a (2n+1)-manifold is contact exactly when [α ∧ (dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero), and exactly when [the Levi form of its kernel is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Levi.html#TauCeti.SmoothForm.isContactForm_iff_forall_bijective_distributionLeviForm).
- **Contactization**: on W × ℝ the form dz − θ [is contact exactly when −dθ is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothForm.isContactForm_contactization_iff). On the one-jet space T*M × ℝ, [one-jets of functions are Legendrian embeddings](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/OneJet.html#TauCeti.CotangentBundle.isLegendrianEmbedding_contactization_liouvilleForm).
- **Connectedness of Sp(2n, ℝ)**: the positive polar factor of a symplectic matrix contracts inside the group, so [the real symplectic group is path connected](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#Matrix.isPathConnected_symplecticGroup).
- **The Schur–Horn theorem**: the diagonals of the unitary conjugates of diag(w) are [exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star). Majorization, via [Rado's theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/PermutationOrbit.html#TauCeti.mem_convexHull_range_comp_perm_iff), gives an equivalent form.

### Notable definitions and infrastructure

- **Contact Hamiltonian vector fields** [`contactHamiltonianVectorField`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Hamiltonian.html#TauCeti.SmoothForm.contactHamiltonianVectorField) invert the contact flat map; the Reeb field is the case f = 1. Contact flows and the Jacobi bracket rest on this.
- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) carries its suspension flow, time and fibre forms, orientation and embedded closed orbits, which is the carrier S0–S2 need.
- **The positive-period circle package** starts from the [time form dt_p](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/AddCircle.html#AddCircle.timeForm) and extends to tori and the [total family of circles](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/CircleFamily.html#TauCeti.CircleFamily) with its forms β, η and dp ∧ η.

### Roadmap coverage

The evidence for the latest window was truncated, so some layers may be further along than stated.

- **CotangentLagrangian.**
  - C1: items 1–2 are done, and item 3 now includes the equivariant cotangent-lifted action. General pullback relations, open restriction and T*(M×N) are missing.
  - C2: only the linear algebra is done.
  - C2.0: largely done. The ambient polar-coordinate diffeomorphisms and the SL(2,ℂ) ±I equivariance are not in evidence.
  - C2.1: partial. Connectedness, Sp-polar preservation, the Killing form and the Cartan involution are in. Realification, the intersection identities, maximal compactness and the adjoint comparison are not.
  - C2.2: partial. It has only Kodaira–Thurston topology.
  - C3: untouched.
  - C4: only a relative Poincaré lemma on convex neighbourhoods.
- **ContactGeometry.**
  - CG1: essentially done.
  - CG2: done except the worked eˣ example and the separation of the contactomorphism notions.
  - CG3: ingredients only.
  - CG4–CG6: partial. Contactization, the sphere, the Legendrian API, conformal symplectic normal spaces and the Jacobi bracket are in. Symplectization, the neighbourhood theorems and the symplectization comparison are missing.
- **HamiltonianReduction.**
  - R1: partial. It has fundamental vector fields and stabilizers, but no moment maps.
  - R2: partial. It has the algebraic KKS form and the so(3) and Heisenberg models, but no orbit manifold.
  - R1a and R2a–R5: untouched.
- **ConvexityToric.**
  - T3: only the U(n) Schur–Horn cases are done.
  - T1, T2, T4 and T5: untouched.
- **IntegrableSystems.**
  - I2.0: largely done. The uniform Cᵏ estimates on compact period sectors are not in evidence.
  - I1–I4: untouched, beyond rank tools and Kronecker's density theorem.
- **Suspensions.**
  - S0: partial. Ω is not yet shown symplectic.
  - S1: partial. Closed orbits and their homology classes are in, but not the block structure or the areas.
  - S2: untouched.

## The frontier

- **Contact Darboux and Gray stability (CG3).** The contact-Moser vector field and the pointwise linear normal form are in place. What remains is integrating the Moser flow on a shrunken chart, and the relative Gray theorem.
- **The suspension symplectic form (S0).** Prove Ω = ds∧dt + ω_v closed and nondegenerate on S¹ × Y_φ. This opens S1's block structure and the orbit-torus areas.
- **Group-level moment maps (R1).** Fundamental vector fields and smooth cotangent-lifted actions are ready. Next come equivariant moment maps and the cotangent-lift example μ(q,p)(ξ) = p(ξ_Q q).
- **Maximal compactness and realification (C2.1).** The lemma that a compact subgroup's only positive-definite element is the identity already exists. Still needed are the realify map, the intersection identities, and the maximality of U(n) in GL(n,ℂ) and in Sp(2n,ℝ).
- **Kodaira–Thurston as a symplectic non-Kähler manifold (C2.2).** The topology is done. Still needed are the symplectic form, and the odd-b₁ obstruction, which depends on ComplexKahlerGeometry's Hodge parity theorem.
