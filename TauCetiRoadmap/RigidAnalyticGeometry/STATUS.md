<!--tauceti-status:v1 {"roadmap":"RigidAnalyticGeometry","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"weak stability of the Gauss fraction field and finiteness of normalisation of Tate algebras","state":"untouched"},{"id":"Layer 1","remaining":"contractive renorming, Japanese property, excellence, tensor products, fraction algebras, strict polyradii","state":"partial"},{"id":"Layer 2","remaining":"value group, power-bounded elements via the sup norm, spectral radius, Banach function algebras, reduction functor","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","remaining":"continuous maps, induced G-topologies, G0-G2 completions, pasting, RigidSpace and Kiehl properness","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b01a4bce31ac0b696201efcc2397dbdbc1739c3607d5433f39af4107caedc77b","roadmap":"RigidAnalyticGeometry","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: RigidAnalyticGeometry

This file documents the status of the RigidAnalyticGeometry roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The basic algebra of affinoid algebras is in place: presentations, noetherianity, Noether normalisation, independence of the topology from the presentation, and now the maximum modulus principle and the heights of maximal ideals. Layer 2 is partial: the rest of its supremum-norm theory and all of the reduction theory remain. The geometry has only just begun, with the general definition of a G-topology and its site. Weak stability, fraction algebras, tensor products, affinoid spaces, Čech acyclicity, coherent cohomology and analytification have not begun.

### Named results

- **The maximum modulus principle** — on a nonzero affinoid algebra, the supremum seminorm of every element is attained at a classical point ([`exists_pointNorm_eq_supSeminorm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/MaximumModulus.html#TauCeti.IsAffinoidAlgebra.exists_pointNorm_eq_supSeminorm)). On a Tate algebra the supremum seminorm is the Gauss norm ([`supSeminorm_eq_norm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/MaximumModulus.html#TauCeti.MvPowerSeries.supSeminorm_eq_norm)).
- **Affinoid Noether normalisation** — every nonzero affinoid algebra is finite over a Tate algebra embedded injectively in it, and the number of variables is the Krull dimension ([`exists_finite_injective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/NoetherNormalization.html#TauCeti.IsAffinoidAlgebra.exists_finite_injective)).
- **Automatic continuity** — every algebra map from a noetherian ultrametric Banach algebra into an affinoid is continuous ([`continuous_algHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Continuity.html#TauCeti.IsAffinoidAlgebra.continuous_algHom)). It follows that all complete algebra norms on an affinoid are equivalent ([`toContinuousAlgEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/QuotientNorm.html#TauCeti.IsAffinoidAlgebra.toContinuousAlgEquiv)).
- **Heights of maximal ideals in affinoid domains** — every maximal ideal of an affinoid domain has height `dim A` ([`height_eq_ringKrullDim_of_isDomain`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/KrullDimension.html#TauCeti.IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain)). For general affinoids the height is the dimension of some irreducible component through the point.
- **The supremum seminorm as a spectral value** — over an integrally closed domain, the supremum seminorm of an integral element is `max |aᵢ|sup^(1/(d−i))` over the coefficients of its minimal polynomial, even when the target is not a domain ([`supSeminorm_eq_iSup_minpoly_coeff_rpow`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/MinimalPolynomial.html#TauCeti.IsAffinoidAlgebra.supSeminorm_eq_iSup_minpoly_coeff_rpow)). This is BGR 3.8.1/7, and it is the key step from Tate algebras to general affinoids in maximum modulus.

### Notable definitions and infrastructure

- The [supremum seminorm](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/SupSeminorm.html#TauCeti.supSeminorm) is built from point norms on the finite residue fields. It is power-multiplicative, its kernel is the nilradical, and it is computed on minimal-prime quotients. Maximum modulus now makes it a maximum rather than a supremum.
- The relative algebra `A⟨X₁, …, Xₘ⟩` over an affinoid [is again affinoid](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Restricted.html#TauCeti.IsAffinoidAlgebra.isRestricted_subring). It comes with iteration and the [universal property](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Restricted.html#TauCeti.IsAffinoidAlgebra.existsUnique_algHom_isRestricted_subring) at power-bounded images, which is what tensor products and fraction algebras are built from.
- A [G-topology](https://taucetiproject.org/docs/TauCeti/Topology/GTopology/Basic.html#TauCeti.GTopology) has a site on its admissible opens, and [its sheaves are exactly the presheaves with unique gluing on admissible covers](https://taucetiproject.org/docs/TauCeti/Topology/GTopology/Basic.html#TauCeti.GTopology.isSheaf_iff). The construction uses Mathlib's sheaf categories, and ordinary open covers recover the usual open-set site.

### Roadmap coverage

**Layer 0** is untouched: neither weak stability of the Gauss fraction field nor finiteness of normalisation has landed. **Layer 1** is partial. §1.1 is done except for contractive renorming. In §1.2, normalisation, `d = dim A`, finite residue fields and the heights of maximal ideals (domains and componentwise) are done. Regularity of Tate algebras at maximal ideals is the only excellence input so far, and the Japanese property and excellence itself are missing. §§1.3–1.5 are untouched. **Layer 2** is partial. §2.1 is done except for the spectral value of an integral affinoid map (BGR 6.2.2/4). In §2.2 only maximum modulus is proved, and §2.3 is untouched. **Layer 6** is partial: §6.1 has the G-topology, its site and the sheaf criterion, but not continuous maps, induced topologies, the G0–G2 completions or pasting. §§6.2–6.3 are untouched. **Layers 3–4, 5, 7 and 8** are untouched.

## The frontier

- **Value group and power-bounded elements (§2.2)** — prove that some fixed power of `|f|sup` lies in `|K|`, and that `A° = {|f|sup ≤ 1}`, `A°° = {|f|sup < 1}` and `|f|sup = inf ‖fⁿ‖^(1/n)`. Maximum modulus, the prerequisite, is now proved.
- **Weak stability (Layer 0.2)** — prove that the Gauss fraction field is weakly stable and that normalisation is finite. This blocks the Japanese property in §1.2 and the Banach function algebra theorem in §2.2.
- **Fraction algebras (§1.4)** — construct Weierstrass, Laurent and rational fractions with their universal properties. They are the entry point to affinoid subdomains and to every later geometric layer.
- **Affinoid tensor products (§1.3)** — identify the pushout with `A⟨X,Y⟩/(I,J)`. The relative algebra and its universal property, which were the missing input, are now available.
- **The rest of §6.1** — continuous maps, induced G-topologies, the G0–G2 completeness results and pasting, on top of the new G-site.
