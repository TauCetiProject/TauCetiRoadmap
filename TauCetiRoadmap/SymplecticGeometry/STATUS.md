<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46+00:00"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `c9dbc67` (2026-11-07T17:18:46+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space and the foundations of contact geometry (contact forms and structures, Reeb and contact Hamiltonian dynamics, contactization, Legendrians) are in place. The matrix polar package, the positive-period circles and the smooth mapping torus are largely built. None of the main existence theorems has landed: Darboux, Gray, neighbourhood theorems, moment maps, reduction, convexity and Liouville–Arnold.

### Named results

- **The cotangent bundle is symplectic**: ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm), and in charts it is the linear cotangent form.
- **The contact volume criterion**: on a (2n+1)-manifold, a one-form α is contact [exactly when α ∧ (dα)ⁿ vanishes nowhere](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Volume.html#TauCeti.SmoothForm.isContactForm_iff_wedge_wedgePow_apply_ne_zero).
- **Contactization**: dz − θ on W × ℝ is contact [exactly when −dθ is nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Contactization.html#TauCeti.SmoothForm.isContactForm_contactization_iff). For W = T*M this gives the one-jet space, in which [one-jets of functions are Legendrian](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/OneJet.html#TauCeti.CotangentBundle.isLegendrianEmbedding_contactization_liouvilleForm).
- **The Schur–Horn theorem**: the diagonals of the unitary conjugates of diag(w) [form exactly the convex hull of the rearrangements of w](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/UnitaryGroup/SchurHorn.html#Matrix.range_re_diag_unitary_mul_diagonal_mul_star). Rado's majorization criterion is also proved.
- **Connectedness of the real symplectic group**: polar factors of symplectic matrices are symplectic, so [Sp(2n,ℝ) is path connected](https://taucetiproject.org/docs/TauCeti/Analysis/Matrix/SymplecticGroup/Connected.html#Matrix.isPathConnected_symplecticGroup).

### Notable definitions and infrastructure

- **The smooth mapping torus** [`SmoothMappingTorus`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus.html#TauCeti.SmoothMappingTorus) carries its suspension flow, interval charts, time and fibre forms and an orientation. It has [closed orbits](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/MappingTorus/ClosedOrbit.html#TauCeti.SmoothMappingTorus.closedOrbit) through periodic points with their embedding criterion and homology classes.
- **The Levi form of a distribution** [`distributionLeviForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Distribution/Levi.html#TauCeti.distributionLeviForm) is the bracket modulo the distribution. It defines [contact structures](https://taucetiproject.org/docs/TauCeti/Geometry/Contact/Distribution.html#TauCeti.IsContactDistribution) intrinsically, without a global contact form.
- **Positive-period circles**: `AddCircle p` is [a Lie group](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/AddCircle.html#AddCircle.instLieAddGroup) with a time form and orientation. The family of all positive-period circles has its [total form dp ∧ η](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/DifferentialForm/CircleFamily.html#TauCeti.CircleFamily.totalForm). S0 and I2 build on this.

### Roadmap coverage

The latest window's declaration list was truncated, so smaller items may be missing.

- **CotangentLagrangian.** C1 is partial: cotangent-lifted group actions are now done, but open restriction, the product T*(M×N) and pullback along general maps are not. C2.0 is substantially done: polar decomposition with uniqueness, equivariance, smooth dependence and contraction, and a smooth matrix logarithm. C2.1 is partial: it has Sp-preservation of polar factors, connectedness, the trace-growth lemma and the Cartan involution of sp, but not maximal compactness or the realification identities. C2.2 is partial: it has the Liouville field and a Kodaira–Thurston manifold with π₁, H₁ and b₁ = 3, but no symplectic form on it, and no embedded Lagrangian examples. C3 is untouched. C4 has only a relative Poincaré lemma on convex neighbourhoods.
- **HamiltonianReduction.** R1 has fundamental vector fields, exponential flows, stabilizers and isotropy algebras, but no moment maps. R2 has coadjoint stabilizers as Lie subgroups and the nondegenerate algebraic KKS form, but not the orbit manifold or the smooth KKS form. R1a, R2a and R3–R5 are untouched.
- **ConvexityToric.** Only the Schur–Horn part of T3 is done. T1, T2, T4, T5 and the convexity theorems of T3 are untouched.
- **IntegrableSystems.** I2.0 is largely built. I4 has Kronecker's density theorem and Weyl equidistribution for linear torus flows. I1, I2 and I3 are untouched.
- **ContactGeometry.** CG1 and CG2 are substantially done. CG3 has only the linear normal form and the pointwise contact-Moser equation. In CG4, contactization is done but symplectization of the contact line is not established. CG5 has Legendrians, the dimension bound and conformal symplectic normal spaces, but no neighbourhood theorem. CG6 has the cooriented Jacobi bracket.
- **Suspensions.** S0 is partial: Ω = ds∧dt + ω_v on the circle times Y_φ is missing. S1 has only periodic images. S2 is untouched.

## The frontier

- **Contact Darboux and Gray stability (CG3)**: the contact-Moser field is solved pointwise. Integrating it along time-dependent flows to get the Darboux chart and the relative Gray isotopy remains.
- **The suspension form (S0)**: build Ω = ds∧dt + ω_v on (ℝ/ℤ) × Y_φ, prove it is closed and nondegenerate, and fix its orientation. S1's block almost-complex structure then needs HeegaardFloer F2.1's compatible-structure family.
- **Coadjoint orbits as symplectic manifolds (R2)**: build the smooth orbit G/G_ν, then descend the algebraic KKS form to a smooth, closed, invariant symplectic form. Moment maps (R1) are still entirely absent and gate R3.
- **Finish C1 and the C2.2 examples**: open restriction and products of cotangent bundles, the zero section and closed-one-form graphs as Lagrangians, and a symplectic form on the Kodaira–Thurston manifold together with its odd-b₁ obstruction to being Kähler.
- **Maximal compact subgroups (C2.1)**: the ingredients are present, but the direct maximality theorems for U(n) in GL(n,ℂ) and in Sp(2n,ℝ) remain.
