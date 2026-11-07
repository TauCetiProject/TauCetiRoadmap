<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46Z"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `c9dbc67` (2026-11-07T17:18:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space is in place, and contact geometry now has its basic theory: contact forms and structures, Reeb and contact Hamiltonian dynamics, contactization and Legendrian one-jets. The matrix polar package, the positive-period circle and the opening of the symplectic suspension are well advanced. Darboux-type theorems, reduction, convexity beyond the Schur–Horn case, and integrable systems proper have not begun.

### Named results

- **The Schur–Horn theorem** — the diagonals of U A Uᴴ over unitary U are [exactly the convex hull of the rearrangements of the eigenvalues](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star), and by [Rado's theorem](https://taucetiproject.org/docs/TauCeti/Analysis/Convex/PermutationOrbit.html#TauCeti.mem_convexHull_range_comp_perm_iff) that hull is the set of majorized tuples.
- **The contact volume criterion** — on a (2n+1)-manifold a one-form is contact [exactly when α ∧ (dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero), equivalently when the Levi form of its kernel is nondegenerate.
- **One-jets are Legendrian** — on J¹M = T*M × ℝ the form dz − λ [is contact](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.CotangentBundle.isContactForm_contactization_liouvilleForm), and the section (α, g) is Legendrian [exactly when α = dg](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/OneJet.html#TauCeti.CotangentBundle.isLegendrianEmbedding_contactization_liouvilleForm).
- **The real symplectic group is connected** — the polar factors of a symplectic matrix stay symplectic, so contracting the positive factor gives [path-connectedness of Sp(2n, ℝ)](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#SymplecticGroup.instPathConnectedSpace).
- **The cotangent bundle is symplectic** — ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm) and agrees in charts with the linear cotangent form.

### Notable definitions and infrastructure

- **Contact structures** [`IsContactDistribution`](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Distribution.html#TauCeti.IsContactDistribution) are hyperplane fields with nondegenerate line-valued Levi form, locally cut out by contact forms. Legendrian maps and the conformal symplectic normal space sit on this.
- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) of a diffeomorphism φ, with its suspension flow, time and fibre forms, and [closed orbits](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.closedOrbit) with their integral homology classes.
- **The circle time form** [`AddCircle.timeForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/AddCircle.html#AddCircle.timeForm), together with circle and torus orientations and the [varying-period family](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/CircleFamily.html#TauCeti.CircleFamily) with its non-closed form η and [total form dp ∧ η](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/CircleFamily.html#TauCeti.CircleFamily.totalForm). Action-angle charts and the suspension both consume these.

### Roadmap coverage

In **ContactGeometry**, CG1 and CG2 are essentially done. CG3 is partial: only the linear normal form at a point and the pointwise contact-Moser equation are in. CG4 has contactization but not the symplectization of the contact line. CG5 has the isotropic dimension bound, the conformal symplectic normal space and the J¹ graph criterion, but no neighbourhood theorem. CG6 has the Jacobi bracket but not the symplectization comparison. In **CotangentLagrangian**, C1 is partial: cotangent lifts are now equivariant under group actions; open restriction, products and pullback along general maps were not seen. C2.0 is largely done, including the smooth matrix logarithm. C2.1 is partial: connectedness, Sp-preservation of polar factors, the Cartan involution of sp and the trace-growth lemma are in; maximal compactness and realification are not. C2.2 has the Kodaira–Thurston manifold with π₁ and b₁ = 3 but no symplectic form. C3 and C4 are untouched. **IntegrableSystems** I2.0 is close to done; I1 and I2–I4 are untouched. **HamiltonianReduction** R1 has fundamental vector fields and stabilizers; R2 has the algebraic KKS form, its so(3) and Heisenberg examples, and coadjoint stabilizers as Lie subgroups. Moment maps and orbit manifolds are missing; R3–R5 are untouched. **ConvexityToric** has only the U(n) Schur–Horn case of T3. The root suspension has S0's carrier and forms and S1's periodic-orbit images, but not Ω or the block structure; S2 is untouched. This window's changes under the symplectic namespace were not surveyed, so C1 and C2 may be further along than stated.

## The frontier

- **The suspension's symplectic form (S0)**: the splitting TY_φ = ℝT ⊕ V and Ω = ds∧dt + ω_v on S¹ × Y_φ with closedness, nondegeneracy and orientation. Then S1's seam-compatible block structure, which needs HeegaardFloer F2.1's compatible-structure family.
- **Contact Darboux and Gray stability (CG3)**: integrate the contact-Moser field. The flow-derivative identities for time-dependent vector fields are now available, so what remains is the flow-domain and relative-neighbourhood argument.
- **Symplectization and Legendrian neighbourhoods (CG4, CG5)**: dθ on the punctured dual contact line, the Liouville collar of a transverse hypersurface, and the form-level Legendrian neighbourhood theorem modelled on J¹Λ.
- **Moment maps and coadjoint orbit manifolds (R1, R2)**: group-level moment maps with equivariance and the cotangent-lift example, then G/G_ν as a manifold carrying the smooth KKS form.
- **Maximal compact subgroups and Kodaira–Thurston (C2.1, C2.2)**: U(n) maximal compact in GL(n, ℂ) and Sp(2n, ℝ) from the trace-growth lemma, and Kodaira–Thurston's symplectic form with its odd-b₁ obstruction, which needs ComplexKahlerGeometry's Hodge parity theorem.
