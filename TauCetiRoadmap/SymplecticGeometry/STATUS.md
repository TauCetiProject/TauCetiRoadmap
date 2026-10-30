<!--tauceti-status:v1 {"roadmap":"SymplecticGeometry","to_sha":"ddc3f9753f417f1da50c6e93cc2df70a735752ea","ts":"2026-10-23T22:40:07+11:00"}-->
# Status: SymplecticGeometry

This file documents the status of the SymplecticGeometry roadmap up until `ddc3f97` (2026-10-23T22:40:07+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The cotangent phase space is in place: on the cotangent bundle of any manifold, the Liouville form and ω = −dλ are built, along with cotangent lifts and fibre translations, and the linear Lagrangian algebra is complete. Embedded Lagrangians, generating functions, reduction, convexity, integrable systems, contact geometry and the symplectic suspension S0–S2 have not begun. The one exception is the positive-period circle, whose manifold structure has started.

### Named results

- **The cotangent bundle is symplectic** — ω = −dλ on T*M is [closed and nondegenerate](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.isSymplectic_symplecticForm), and [in each bundle chart it is the existing linear cotangent form](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.inChartAt_symplecticForm_apply). This is the evidence the roadmap asks for that the conventions agree.
- **The tautological property of the Liouville form** — pulling λ back along the section of T*M defined by a one-form α [gives back α](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Liouville.html#TauCeti.CotangentBundle.mpullback_liouvilleForm).
- **Cotangent lifts are symplectic** — the lift (q,p) ↦ (h q, p∘(dh)⁻¹) of a diffeomorphism [pulls ω back to ω](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Lift.html#Diffeomorph.mpullback_cotangent_symplecticForm), preserves λ, and respects identity, composition and inverses.
- **Closed one-forms give symplectic fibre translations** — translating fibres by α changes λ by π*α, and [preserves ω exactly when dα = 0](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Cotangent/Bundle/Fiberwise.html#TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm_eq_self_iff).
- **Lagrangian means maximal isotropic** — in any finite-dimensional symplectic vector space, [a subspace is Lagrangian exactly when it is maximal isotropic](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Lagrangian/Basic.html#TauCeti.SymplecticForm.isLagrangian_iff_maximal_isIsotropic), including the zero-dimensional cases.

### Notable definitions and infrastructure

- **The cotangent bundle** [`CotangentBundle`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Cotangent.html#TauCeti.CotangentBundle) is the total space of the continuous-dual tangent bundle, with its native charts, and its transition maps are [(q,p) ↦ (φ q, p∘(dφ_q)⁻¹)](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Cotangent.html#TauCeti.CotangentBundle.extChartAt_extChartAt_symm). Bundle projections are [submersions](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/Submersion.html#Bundle.isSubmersion_proj). Everything above is built on this.
- **Symplectic subspaces** [`IsSymplectic`](https://taucetiproject.org/docs/TauCeti/Geometry/Symplectic/Lagrangian/Basic.html#TauCeti.SymplecticForm.IsSymplectic) complete the four linear predicates that C2's tangent-image definitions are meant to specialise.
- **The circle as a manifold**: `AddCircle p` is [a smooth manifold](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/AddCircle.html#AddCircle.instIsManifold), obtained as the quotient of a period line by ℤ, and the projection from ℝ is [a local diffeomorphism](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Instances/AddCircle.html#AddCircle.isLocalDiffeomorph_coe). I2.0 and S0 both start from this.

### Roadmap coverage

The roadmap has five sub-roadmaps plus the root suspension layers S0–S2. In **CotangentLagrangian**, C1 is partial. Items 1–2 (the bundle, λ, ω and the chart identification) are done. Item 3 has the lift and its preservation laws but no group-action equivariance and no pullback relation along general maps. Item 4 has fibre translation and dilation (dilation covers negation), but not open restriction or the product T*(M×N). The library also proves that the radial Euler field Z satisfies ι_Zω = −λ and L_Zω = ω, which is part of C2.2. Of C2, only the linear-algebra paragraph is done. Tangent-image predicates for embeddings and immersions, the matrix polar packages C2.0–C2.1, exact Lagrangians, conormals and examples are all missing, as are C3 and C4. In **IntegrableSystems**, I2.0 is partial: the quotient atlas and local diffeomorphism are there, but the group structure, the time form dt_p, orientation and families are not. I1 and I2–I4 are untouched. **HamiltonianReduction**, **ConvexityToric**, **ContactGeometry** and S0–S2 are untouched.

## The frontier

- **Finish C1** — the open-restriction identification T*U ≅ π⁻¹(U), the product T*(M×N) ≅ T*M × T*N with λ a sum and ω a product, equivariance of cotangent lifts under group actions, and cotangent pullback along a general smooth map as a relation.
- **Tangent-image Lagrangian predicates (C2)** — define symplectic, isotropic, coisotropic and Lagrangian embeddings through their tangent images, using the linear predicates now available, together with Lagrangian immersions. Then do the basic examples: the zero section, graphs of closed one-forms, and conormals.
- **Exact Lagrangians and the cotangent-lift classification (C2.2)** — the Liouville field is in hand. What remains is its flow-rescaling laws and the theorem that every λ-preserving symplectomorphism of T*M is a cotangent lift.
- **Circle group and time form (I2.0)** — smoothness of the group operations and translations, the form dt_p with q_p*dt_p = dt, and the oriented atlas. These are prerequisites for S0's mapping torus and for the I2 action-angle charts.
- **First moment-map layer (R1)** — nothing has landed. It consumes the HamiltonianSystems API that the root README names, not machinery from this roadmap.
