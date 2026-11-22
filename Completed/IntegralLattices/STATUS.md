<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers of the integral-lattice foundation are complete, through the ADE discriminant forms and the explicit gluing of $D_8$ to $E_8$. Beyond those layers, the genus determines the discriminant form, while the converse for even lattices of fixed signature and Nikulin’s general existence criterion remain open.

### Named results

- **The isometry between $D_8^+$ and $E_8$** — adjoining a spinor class to $D_8$ gives an index-two overlattice explicitly isometric to the $E_8$ root lattice. [`typeE₈IsometryD8Plus`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)
- **Nikulin’s even-overlattice correspondence** — the even overlattices of a nondegenerate even lattice correspond, in inclusion order, to the subgroups on which its discriminant quadratic form vanishes. [`evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)
- **Milgram’s theorem** — the normalized Gauss sum of the discriminant form of an even nondegenerate lattice determines its signature difference modulo eight. [`gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Milgram.html#TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg)
- **Unimodular classification through rank nine** — every positive definite unimodular lattice of rank at most nine is isometric to the standard lattice of its rank, to $E_8$, or to $\mathbb Z\perp E_8$ with the standard norm on $\mathbb Z$. [`nonempty_isometry_of_isUnimodular_of_finrank_le_nine`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)

### Notable definitions and infrastructure

- An [integral lattice](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) carries a symmetric form on a rational space and a full integral lattice in that space. Taking the quotient by the radical lets a degenerate form enter the duality theory.
- The [discriminant quadratic module](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) of an even nondegenerate lattice records half the norm modulo the integers on the dual quotient. This distinguishes the subgroups that give even glue.

### Roadmap coverage

Layers 1–3 give lattices with forms, duality and finite bilinear and quadratic modules. In particular, the Smith factors of a nonsingular Gram matrix describe the discriminant group. Layer 4 computes the discriminant form after gluing along an isotropic subgroup $H$ as the induced form on $H^\perp/H$, bilinear for integral glue and quadratic for even glue. Layer 5 identifies the rank-one and ADE discriminant forms, including their values on explicit generators.

## The frontier

- **The mixed 2-adic isometry criterion** — assemble sign walking and oddity fusion into a canonical symbol for arbitrary Jordan splittings over $\mathbb Z_2$. The unimodular case and splittings with only type II constituents are settled.
- **Nikulin’s existence theorem** — determine which prescribed signatures and finite quadratic forms occur together on an even lattice. The general primitive embedding criteria also remain open.
- **The lattice mass formula** — the rank-two good-prime factors are explicit. A general dyadic density formula and the adelic volume comparison for the special orthogonal group remain for the mass-formula successor.
- **Completeness in rank 24** — the 24 reference lattices are pairwise non-isometric. It remains to prove that every positive definite even unimodular lattice of rank 24 occurs in the table.
