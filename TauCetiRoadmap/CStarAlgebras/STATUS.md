<!--tauceti-status:v1 {"roadmap":"CStarAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"C[0,1] maximal-ideal example, nonunital Gelfand duality, quasicentral approximate units, Pedersen ideal and Calkin algebra, strict topology","state":"partial"},{"id":"Layer 2","remaining":"pure-state extension and the nonunital case of C2.1; Kadison transitivity, primitive ideals and the bidual","state":"partial"},{"id":"Layer 3","remaining":"abstract operator spaces and Ruan's theorem, CB(E,F) and Smith's lemma, row and column spaces, MIN and MAX","state":"partial"},{"id":"Layer 4","remaining":"cb norm of CP maps, multiplicative domain, Stinespring and Radon-Nikodym, Choi's criterion, Wittstock and Paulsen","state":"partial"},{"id":"Layer 5","remaining":"maximal C*-norm, tensoring maps, operator-space tensor products, inductive limits, C*(F_inf), cones and mapping cones","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"8a8fbc6233d4fa9fb85af43392a828d6fe0d3f0b2017574c4cc1d66413b0515a","roadmap":"CStarAlgebras","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: CStarAlgebras

This file documents the status of the CStarAlgebras roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the opening target, C1.1, is complete. Layers 1–5 are now partial: Layer 1 has its compression criterion and the left-action unitization. Each of Layers 2 to 5 has its first theorems: state extension, the cb norm, the Kadison–Schwarz inequality, and the bounded product with its `c₀` ideal. Nuclearity, exactness, quasidiagonality and local reflexivity (Layers 6–9) have not begun.

### Named results

- **The Kadison–Schwarz inequality** — a unital 2-positive map between C⋆-algebras satisfies `φ(a)*φ(a) ≤ φ(a*a)` ([`TauCeti.IsNPositive.star_map_mul_map_le_of_map_one`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CompletelyPositiveMap.html#TauCeti.IsNPositive.star_map_mul_map_le_of_map_one)). The transpose on `M₂(ℂ)` is positive but [not 2-positive](https://taucetiproject.org/docs/TauCeti/Examples/Analysis/CStarAlgebra/CompletelyPositiveMap.html#TauCeti.CompletelyPositiveMapExample.not_isNPositive_two_transpose), so positivity alone is not enough.
- **Extension of states** — every state of a unital closed star subalgebra is the restriction of a state of the ambient C⋆-algebra ([`StarSubalgebra.exists_mem_stateSpace_forall_apply_coe_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/State/Extension.html#StarSubalgebra.exists_mem_stateSpace_forall_apply_coe_eq)).
- **The compression criterion** — for positive `T` and a star projection `p`, `pTp ≤ T` exactly when `p` commutes with `T`. It is proved without a unit ([`IsStarProjection.conjugate_le_iff_commute`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/Compression.html#IsStarProjection.conjugate_le_iff_commute)).
- **The left-action unitization** — for a complete star algebra without an identity, `(λ, a) ↦ λ·id + L_a` is an isometry onto a closed set of operators ([`Unitization.isometry_lift_Lmul`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Algebra/Unitization/LeftAction.html#Unitization.isometry_lift_Lmul)).
- **The transpose has cb norm `n`** — on `M_n(ℂ)` the transpose is an isometry but its cb norm is `n` ([`CStarMatrix.cbNorm_transposeₗ`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CompletelyBounded.html#CStarMatrix.cbNorm_transposeₗ)). This is the standard example separating bounded from completely bounded maps.

### Notable definitions and infrastructure

- **The cb norm** ([`LinearMap.cbNorm`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CompletelyBounded.html#LinearMap.cbNorm)) of a linear map between C⋆-algebras is the supremum of the norms of its matrix amplifications. It already has the triangle inequality, submultiplicativity, and the fact that star homomorphisms are complete contractions. It is the object that Wittstock theory and the Paulsen similarity theorem are stated in terms of.
- **`n`-positivity** ([`TauCeti.IsNPositive`](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/CompletelyPositiveMap.html#TauCeti.IsNPositive)) interpolates between positive and completely positive maps, so results like Kadison–Schwarz can be stated at the level where they are actually true.
- **The bounded product modulo `c₀`.** The bounded product `lp A ∞` of unital C⋆-algebras [is a C⋆-algebra](https://taucetiproject.org/docs/TauCeti/Analysis/CStarAlgebra/BoundedProduct.html#lp.inftyCStarAlgebra). Its quotient by the `c₀` ideal has [quotient norm `limsup ‖aᵢ‖`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Lp/C0Ideal.html#lp.norm_mk_c0Ideal). This sets up the `ℓ^∞/c₀` examples of Layer 7.

### Roadmap coverage

**Layer 1** is partial. C1.1 is done. In C1.2 the left-action unitization is done, but the `C[0,1]` maximal-ideal example is not. C1.3 has closed ideals and C⋆-quotients but lacks nonunital Gelfand duality, and C1.7 has only the extension of nondegenerate representations to multipliers. C1.4–C1.6 and C1.8 are absent. **Layer 2** is partial: only the unital half of C2.1 is in. Pure-state extension, the nonunital case and all of C2.2–C2.10 remain. **Layer 3** is partial: C3.2 has the cb norm for maps between C⋆-algebras, but abstract operator spaces, Ruan's theorem, Smith's lemma, row and column spaces, and MIN and MAX are absent. **Layer 4** is partial. From C4.1 there are Kadison–Schwarz and `‖φ‖ = ‖φ(1)‖`. The cb-norm identity, the commutative-domain criterion, the multiplicative domain, and Stinespring, Choi and Wittstock (C4.2–C4.4) are not there. **Layer 5** is partial: C5.4 has the bounded product and its `c₀` quotient, and nothing else in the layer has landed. **Layers 6–9** are untouched.

## The frontier

- **The multiplicative domain (C4.1).** With Kadison–Schwarz in place, what remains of C4.1 is `‖φ‖_cb = ‖φ(1)‖`, the commutative-domain and commutative-range criteria, and the multiplicative domain. The roadmap's route to the multiplicative domain goes through a Stinespring dilation.
- **Stinespring dilation (C4.2).** Build the dilation from the positive form on `A ⊙ H`, then the minimal dilation and Arveson's Radon–Nikodym theorem. It needs the GNS construction from VonNeumannAlgebras and the approximate units of C1.4.
- **Pure-state extension (C2.1).** Show that a pure state has a pure extension by taking an extreme point of the face of extensions, and add the nonunital case through unitizations. Kadison transitivity (C2.2) is the next target.
- **Operator spaces and Smith's lemma (C3.1–C3.2).** The cb norm currently lives only on C⋆-algebras. Ruan's axioms, the normed space `CB(E, F)` and Smith's lemma need the abstract setting.
- **The rest of C1.2 and C5.4.** The `C[0,1]` maximal-ideal example remains for C1.2. C5.4 still needs `c₀` direct sums, inductive limits and `C*(F_∞)`.
