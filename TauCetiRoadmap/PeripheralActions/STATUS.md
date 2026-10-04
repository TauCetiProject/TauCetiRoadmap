<!--tauceti-status:v1 {"roadmap":"PeripheralActions","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the permutation symmetries of 3.4: IsPeripheralPermAut, its subgroup, permData for r at least 2, and the rank-two swap and rotation","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"not a target here; it belongs to the arithmetic successor of BelyiMaps","state":"untouched"}],"readme_sha":"8c021ac61ad9bfe9be447af6c451d309c5ff67884b49e4524d06106b690778b5","roadmap":"PeripheralActions","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: PeripheralActions

This file documents the status of the PeripheralActions roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached. The peripheral product identity and the peripheral-power theorem are proved for every `p`-adic unit, the group of peripheral automorphisms has its exponent character, closedness and principal-unit section, and the dyadic instance is stated in consumer shape. The one piece of the roadmap not yet begun is the permutation symmetries of Layer 3.4.

### Named results

- **The peripheral product identity** — for every unit `u` there are conjugators, the first one trivial, such that the conjugated `u`-th powers of the basis and of the cusp multiply to `1` in order ([`exists_defect_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Identity.html#TauCeti.Peripheral.exists_defect_eq_one)). It is proved by lifting through the closed lower central series and passing to the limit by compactness, with no Galois group involved.
- **The peripheral-power theorem** — for every unit `u`, a continuous automorphism of a free pro-`p` group of finite rank sends each basis element and the cusp to a conjugate of its `u`-th power, fixing the first basis element's power on the nose ([`exists_peripheralAut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Automorphism.html#TauCeti.Peripheral.exists_peripheralAut)). It also holds for every conjugate of the cusp ([`exists_peripheralAut_conj_cusp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Automorphism.html#TauCeti.Peripheral.exists_peripheralAut_conj_cusp)).
- **The section over the principal units** — in positive rank, the exponent character has a continuous homomorphic section over `1 + p^k ℤ_p`, for `k ≥ 1`, with `k ≥ 2` when `p = 2` ([`exists_section_principalUnits`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Section.html#TauCeti.Peripheral.exists_section_principalUnits)). No section over all of `ℤ_pˣ` is claimed.
- **Closedness of the peripheral automorphisms** — they form a closed subgroup of the continuous automorphisms in the congruence topology ([`isClosed_peripheralAut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Topology.html#TauCeti.Peripheral.isClosed_peripheralAut)), and the exponent is continuous on it ([`continuous_exponent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Topology.html#TauCeti.Peripheral.continuous_exponent)).
- **Inversion fails in rank three** — for `r ≥ 3`, inverting every generator is peripheral of no exponent ([`not_isPeripheralAut_of_apply_basis_eq_inv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Reflection.html#TauCeti.Peripheral.not_isPeripheralAut_of_apply_basis_eq_inv)). The [reflection](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Reflection.html#TauCeti.Peripheral.isPeripheralAut_reflect), an explicit involution of exponent `-1` in every rank, is the correct replacement.

### Notable definitions and infrastructure

- **The peripheral automorphism group and its exponent** ([`peripheralAut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Group.html#TauCeti.Peripheral.peripheralAut), [`exponent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Group.html#TauCeti.Peripheral.exponent)) — the automorphisms that are peripheral of some unit exponent, with the exponent as a surjective homomorphism to `ℤ_pˣ` whose kernel holds the inner automorphisms. All of Layer 3 is phrased through these.
- **The peripheral levels** ([`level`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Lifting.html#TauCeti.Peripheral.level)) — the closed sets of conjugators whose defect lies in the `n`-th term of the closed lower central series. With the [correction step](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Lifting.html#TauCeti.Peripheral.exists_mem_level_succ), they are the machinery of the identity.
- **The principal units as a copy of `ℤ_p`** ([`principalUnitsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicUnits.html#TauCeti.principalUnitsEquiv)) — the `p`-adic power map of a unit of exact level `f` is a topological isomorphism onto `1 + p^f ℤ_p`. This parameterizes the section.

### Roadmap coverage

Layers 0, 1, 2 and 4 are done: the peripheral system, the product identity with its separate correction and compactness steps, the peripheral-power theorem with transfer to conjugates of the cusp, and the dyadic identity form, automorphism in both conventions for the third element, and dyadic section over `1 + 4ℤ_2`. Layer 3 is done except for 3.4: the subgroup, exponent, closedness, continuity, reflection, rank-two inversion and principal-unit section are proved, but the permutation predicate `IsPeripheralPermAut`, its subgroup, `permData` and the rank-two swap and rotation do not exist yet. Layer 5 is by design not a target here.

## The frontier

- **Permutation symmetries (Layer 3.4)** — the predicate `IsPeripheralPermAut` and the subgroup it defines. Still to do: uniqueness of the permutation and exponent for `r ≥ 2`, the homomorphism `permData`, the stated rank-one failure, and the rank-two swap and rotation. Everything it needs is in place.
