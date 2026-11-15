<!--tauceti-status:v1 {"roadmap":"RigidAnalyticGeometry","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e","ts":"2026-11-12T09:51:59+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"finiteness of the integral closure of Tate algebras in finite extensions of the Gauss fraction field","state":"partial"},{"id":"Layer 1","remaining":"Japanese property, excellence, and the completed-field-extension contract of §1.3","state":"partial"},{"id":"Layer 2","remaining":"norm equivalence on reduced affinoids, BGR 3.8.3/7, finite type of canonical reductions, almost noetherianity","state":"partial"},{"id":"Layer 5","remaining":"acyclicity of general rational covers, strict exactness for finite modules, Cech-to-derived comparison","state":"partial"},{"id":"Layer 6","remaining":"strong affinoid topology, RigidSpace, gluing and fibre products, and the properness predicates of §6.3","state":"partial"},{"id":"Layer 7","remaining":"the Kiehl, coherence, quasi-Stein, proper-cohomology and formal-functions supplier contracts","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"b01a4bce31ac0b696201efcc2397dbdbc1739c3607d5433f39af4107caedc77b","roadmap":"RigidAnalyticGeometry","to_sha":"941bb58ae04c2464c632a44d715f17b21b6bea5e"}-->
# Status: RigidAnalyticGeometry

This file documents the status of the RigidAnalyticGeometry roadmap up until `941bb58` (2026-11-12T09:51:59+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The algebra of affinoid algebras is nearly complete. What remains there is the Japanese property, excellence, completed field extension and the Banach function algebra theorem. Affinoid subdomains, rational and Laurent localisation, and the general theory of G-topologies are largely in place. Tate acyclicity is proved only for the two-piece Laurent cover, rigid spaces have not begun, and neither has analytification.

### Named results

- **The maximum modulus principle** — on a nonzero affinoid algebra, the supremum seminorm of every element is attained at a classical point ([`exists_pointNorm_eq_supSeminorm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/MaximumModulus.html#TauCeti.IsAffinoidAlgebra.exists_pointNorm_eq_supSeminorm)).
- **Power-bounded elements are the unit ball of the supremum seminorm** — for any complete algebra norm, `f` is power-bounded iff `|f|sup ≤ 1` ([`isPowerBounded_iff_supSeminorm_le_one`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/PowerBounded.html#TauCeti.IsAffinoidAlgebra.isPowerBounded_iff_supSeminorm_le_one)), and topologically nilpotent iff `|f|sup < 1`. The spectral-radius formula `|f|sup = lim ‖fⁿ‖^(1/n)` holds as well ([`pow_norm_pow_one_div_tendsto_nhds_supSeminorm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/SpectralRadius.html#TauCeti.IsAffinoidAlgebra.pow_norm_pow_one_div_tendsto_nhds_supSeminorm)).
- **The value-group theorem** — one exponent `m ≥ 1`, depending only on `A`, puts every `|f|sup^m` in `|K|` ([`exists_supSeminorm_pow_eq_norm`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/ValueGroup.html#TauCeti.IsAffinoidAlgebra.exists_supSeminorm_pow_eq_norm)).
- **Tate acyclicity for a Laurent cover** — for the cover by `|f| ≤ 1` and `|f| ≥ 1`, the augmented Čech sequence is exact for every algebraic module, flat or not, finite or not ([`exact_moduleAugmentation_moduleDiff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/Rigid/Affinoid/LaurentCover/Module.html#TauCeti.LaurentCover.exact_moduleAugmentation_moduleDiff)).
- **Affinoid Noether normalisation** — every nonzero affinoid algebra is finite over an injectively embedded Tate algebra in `dim A` variables ([`exists_finite_injective`](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/NoetherNormalization.html#TauCeti.IsAffinoidAlgebra.exists_finite_injective)).

### Notable definitions and infrastructure

- [Affinoid subdomains](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/Subdomain/Basic.html#TauCeti.IsAffinoidSubdomainMap) are characterised by their universal property among affinoid test algebras. The library has uniqueness, transitivity, intersections and inverse images for them, and their restrictions are flat. These are the objects the affinoid site and every gluing argument are built on.
- [Rational fraction algebras](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/RationalFraction.html#TauCeti.RationalFraction) represent rational domains and are [identified with Huber's rational localisations](https://taucetiproject.org/docs/TauCeti/RingTheory/Affinoid/RationalFraction.html#TauCeti.RationalFraction.completionLocEquiv), which is the bridge to the adic-space programme.
- Every sheaf on a G-topology [extends uniquely to the finest slightly finer topology](https://taucetiproject.org/docs/TauCeti/Topology/GTopology/SlightlyFiner.html#TauCeti.GTopology.sheafEquivFinestSlightlyFiner). This is the mechanism that will pass from the weak to the strong affinoid topology.

### Roadmap coverage

**Layer 0** is partial. Weak stability is defined and proved for complete fields and for perfect fields. The Gauss fraction field is built, and the library also proves it weakly stable, for countably many variables over a complete field. Finiteness of normalisation for Tate algebras has not landed. **Layer 1** is partial. §1.1, §1.4 and the strict-polyradius criterion of §1.5 are done. §1.2 lacks only the Japanese property and excellence; regular Tate algebras and universal catenarity are proved. §1.3 has the pushout, its universal property, density and the completed-tensor comparison, but not the completed-field-extension contract. **Layer 2** is partial. §2.1 is done. §2.2 is done up to the norm equivalence `|f|sup ≤ ‖f‖ ≤ C|f|sup` on reduced affinoids and BGR 3.8.3/7. §2.3 has the reduction functor, BGR 6.3.1/4–6 and the reduced-quotient criterion, but not finite type of `Ã` or almost noetherianity. **Layers 3–4**, which are not tracked as a layer below, are well advanced. Gerritzen–Grauert, immersions and analytic excellence are still missing. **Layer 5** has only the Laurent cover. **Layer 6** is partial. §6.1 is done except the plus-construction comparison, which was not found. §6.2 has only the weak affinoid G-topology, and §6.3 is untouched. In **Layer 7**, §7.2's slope interfaces are done and the supplier contracts have not begun. **Layer 8** is untouched.

## The frontier

- **Banach function algebras (§2.2)** — prove `|f|sup ≤ ‖f‖ ≤ C|f|sup` for reduced affinoids and BGR 3.8.3/7. Weak stability of the Gauss fraction field, the stated prerequisite, is now in the library.
- **Japanese property and excellence (§§0.2, 1.2)** — prove that normalisation of `Tₙ` in finite extensions is finite, then excellence. The remaining inputs are a nonempty regular locus and regular formal fibres.
- **General Tate acyclicity (Layer 5)** — pass from the Laurent cover to all finite rational covers, then prove strict exactness for finite modules and the Čech-to-derived comparison.
- **The strong G-topology and `RigidSpace` (§6.2)** — build the strong affinoid topology on top of the weak site and the slightly-finer extension, then the rigid category.
- **Reduction finiteness (§2.3)** — show that `Ã` is of finite type and that finite maps induce finite maps on reductions. Integrality on reductions is already proved.
