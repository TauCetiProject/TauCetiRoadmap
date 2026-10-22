<!--tauceti-status:v1 {"roadmap":"RigidAnalyticGeometry","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"weak stability of the Gauss fraction field and finiteness of normalisation of Tate algebras","state":"untouched"},{"id":"Layer 1","remaining":"relative series algebra, Japanese and height results, excellence, tensor products, fraction algebras, strict polyradii","state":"partial"},{"id":"Layer 2","remaining":"maximum modulus, power-bounded elements via the sup norm, Banach function algebras, reduction functor","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b01a4bce31ac0b696201efcc2397dbdbc1739c3607d5433f39af4107caedc77b","roadmap":"RigidAnalyticGeometry","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5"}-->
# Status: RigidAnalyticGeometry

This file documents the status of the RigidAnalyticGeometry roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The basic algebra of affinoid algebras is in place: presentations, noetherianity, maximal spectra, Noether normalisation and independence of the topology from the presentation. The theory of the supremum seminorm is about half done. Weak stability, the later sections of Layer 1, and all of the geometry from affinoid spaces onwards have not begun.

### Named results

- **Affinoid Noether normalisation** — every nonzero affinoid algebra is finite over a Tate algebra embedded injectively in it ([`exists_finite_injective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/NoetherNormalization.html#TauCeti.IsAffinoidAlgebra.exists_finite_injective)). The source also shows that the number of variables is the Krull dimension.
- **Automatic continuity** — every algebra homomorphism from a noetherian ultrametric Banach algebra into a completely normed affinoid algebra is continuous ([`continuous_algHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Continuity.html#TauCeti.IsAffinoidAlgebra.continuous_algHom)). This is the closed-graph argument of BGR 3.7.5, and it rests on the Krull intersection theorem over all maximal ideals ([`Ideal.iInf_isMaximal_pow_eq_bot`](https://taucetiproject.org/docs/TauCeti/RingTheory/Ideal/KrullIntersection.html#Ideal.iInf_isMaximal_pow_eq_bot)).
- **Equivalence of complete affinoid norms** — any algebra isomorphism between completely normed affinoid algebras is a homeomorphism ([`toContinuousAlgEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/QuotientNorm.html#TauCeti.IsAffinoidAlgebra.toContinuousAlgEquiv)). In particular, two Tate presentations give the same topology ([`presentationContinuousAlgEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/QuotientNorm.html#TauCeti.IsAffinoidAlgebra.presentationContinuousAlgEquiv)).
- **Finite injective maps are closed embeddings** — a finite injective homomorphism into an affinoid algebra is a closed topological embedding, with continuity as a conclusion ([`isClosedEmbedding_of_finite_injective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/FiniteMap.html#TauCeti.IsAffinoidAlgebra.isClosedEmbedding_of_finite_injective)).
- **The integral-equation bound** — if `f` satisfies a monic equation with coefficients `aᵢ`, then `|f|sup ≤ max |aᵢ|sup^(1/(d−i))` ([`supSeminorm_le_iSup_coeff_rpow_of_eval_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/SupSeminorm.html#TauCeti.IsAffinoidAlgebra.supSeminorm_le_iSup_coeff_rpow_of_eval_eq_zero)). It comes from a general root bound for power-multiplicative seminorms.

### Notable definitions and infrastructure

- [`IsAffinoidAlgebra`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Basic.html#TauCeti.IsAffinoidAlgebra) is a proposition: some Tate algebra surjects onto `A`. It is stable under quotients and finite extensions, and the norm results above make it safe to use without choosing a norm.
- The [supremum seminorm](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/SupSeminorm.html#TauCeti.supSeminorm) is built from [point norms](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/SupSeminorm.html#TauCeti.pointNorm), which take the spectral norm on the actual residue field. It is bounded, ultrametric and power-multiplicative. Its kernel is the nilradical, it is unchanged by reduction, and it is computed on minimal-prime quotients. These are the inputs that maximum modulus needs.
- The [contravariant map on maximal spectra](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/MaximalSpectrum.html#TauCeti.IsAffinoidAlgebra.maximalSpectrumComap), together with the result that maximal ideals contract to maximal ideals, gives classical points their functoriality.

### Roadmap coverage

**Layer 0** is untouched. Nothing on weak stability of the Gauss fraction field or on finiteness of normalisation has landed.

**Layer 1** is partial. §1.1 is done except for the relative algebra `A⟨X⟩` and contractive renorming. In §1.2, normalisation, `d = dim A`, finite residue fields and the finite-dimensionality of quotients with maximal radical are done. The Japanese property, the height of maximal ideals in domains, and excellence are not. §§1.3–1.5 (tensor products, fraction algebras and strict polyradii) are untouched.

**Layer 2** is partial. §2.1 is done except for equality for minimal monic equations and the spectral value of an integral affinoid map. §2.2 (maximum modulus and Banach function algebras) and §2.3 (reduction and presentation rings) are untouched.

**Layers 3–4 and Layers 5–8** are untouched.

## The frontier

- **Maximum modulus** — show that `|f|sup` is attained at a classical point, and prove the uniform value-group statement. The tools are normalisation and the minimal-prime reduction, both already present.
- **Power-bounded elements and the spectral radius** — prove `A° = {|f|sup ≤ 1}`, `A°° = {|f|sup < 1}` and `|f|sup = inf ‖fⁿ‖^(1/n)`. All of these depend on maximum modulus.
- **Weak stability (Layer 0.2)** — prove that the Gauss fraction field is weakly stable and that normalisation is finite. This is needed for the Japanese property in §1.2 and for the Banach function algebra theorem in §2.2.
- **Fraction algebras (§1.4)** — construct Weierstrass, Laurent and rational fractions with their universal properties. These are the entry point to affinoid subdomains and to every geometric layer.
- **Affinoid tensor products (§1.3)** — construct the pushout `A⟨X,Y⟩/(I,J)`, which also requires the relative algebra `A⟨X⟩` still missing from §1.1.
