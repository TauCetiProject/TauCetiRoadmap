<!--tauceti-status:v1 {"roadmap":"PeripheralActions","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"the defect level sets, the central-series correction step, and the compactness limit with c 0 = 1","state":"untouched"},{"id":"Layer 2","remaining":"the peripheral-power theorem itself (needs Layer 1) and the transfer to other conjugates of the cusp","state":"partial"},{"id":"Layer 3","remaining":"peripheralAut and its exponent, closedness, the reflection, permutation symmetries, the principal-unit section","state":"untouched"},{"id":"Layer 4","remaining":"the dyadic specialization of Layers 1, 2 and 3.5 in both conventions","state":"untouched"},{"id":"Layer 5","remaining":"not a target here; it belongs to the arithmetic successor of BelyiMaps","state":"untouched"}],"readme_sha":"8c021ac61ad9bfe9be447af6c451d309c5ff67884b49e4524d06106b690778b5","roadmap":"PeripheralActions","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: PeripheralActions

This file documents the status of the PeripheralActions roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the peripheral system and its predicate, is done. The automorphism criterion from Layer 2 is proved, but the roadmap's mathematical core has not started: the peripheral product identity (Layer 1), the peripheral-power theorem, the group of peripheral automorphisms, and the dyadic instance.

### Named results

- **The automorphism criterion for conjugated unit powers** — in a free pro-`p` group of finite rank, sending each basis element `x i` to a conjugate `(c i)⁻¹ x i ^ u i c i` of a unit power always defines a continuous automorphism ([`exists_continuousAut_apply_eq_conj_padicPow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.html#TauCeti.IsProP.exists_continuousAut_apply_eq_conj_padicPow)). This is the step of Layer 2.2 that turns a solution of the product identity into an automorphism, and it is what the reflection and permutation symmetries of Layer 3 need.
- **Generating families come from automorphisms** — a family that topologically generates a free pro-`p` group of finite rank is the image of the basis under a continuous automorphism ([`exists_continuousAut_of_topologicallyGenerates`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.html#TauCeti.freeProP.exists_continuousAut_of_topologicallyGenerates)). This is the Hopf-type input behind the criterion.
- **Uniqueness of the exponent** — in positive rank, a peripheral automorphism determines its exponent `u` ([`IsPeripheralAut.exponent_unique`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Basic.html#TauCeti.Peripheral.IsPeripheralAut.exponent_unique)). So the exponent character of Layer 3 will be well defined.

### Notable definitions and infrastructure

- **Peripheral of exponent `u`** ([`IsPeripheralAut`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Basic.html#TauCeti.Peripheral.IsPeripheralAut)) — a continuous automorphism sends each element of the peripheral tuple to a conjugate of its `p`-adic `u`-th power. It is stated with `IsConj` so that it will be closed under composition and inversion. Inner automorphisms and the identity satisfy it with exponent one.
- **The cusp and the peripheral tuple** ([`cusp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Basic.html#TauCeti.Peripheral.cusp), [`peripheralTuple`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Basic.html#TauCeti.Peripheral.peripheralTuple)) — the inverse of the ordered product of the basis, and the `r + 1` elements it completes, whose ordered product is `1`. Both are natural under homomorphisms.
- **The transported basis** ([`basis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Peripheral/Basic.html#TauCeti.Peripheral.basis)) — the basis of an abstract `F` with a marked isomorphism to the standard model. It generates `F` topologically, and continuous homomorphisms out of `F` are determined by their values on it. Every statement therefore applies to any group presented as free pro-`p` on `r` generators.

### Roadmap coverage

Layer 0 is done: basis, cusp, tuple, predicate, inner automorphisms and exponent uniqueness are all proved. Layer 2 is partial: the automorphism criterion of 2.2 is proved, but the peripheral-power theorem itself and the convention transfer of 2.3 are not, because they need Layer 1. Layers 1, 3 and 4 are untouched. Layer 5 is by design not a target here.

## The frontier

- **The reflection and the permutation symmetries (Layer 3.3, 3.4)** — these need only Layer 0 and the automorphism criterion, both now in place, so they can proceed alongside Layer 1. Still to do: the reflection of exponent `-1` with explicit conjugators, the rank-two inversion, the proved rank-three failure of plain inversion, and `IsPeripheralPermAut` with `permData` for `r ≥ 2`.
- **The peripheral product identity (Layer 1)** — the level sets of the defect, the correction step through the closed lower central series (the only place the unit hypothesis is used), and the compactness limit that keeps `c 0 = 1`. None of this exists yet. It depends on ProfiniteArithmetic's graded pieces, bracket and spanning theorem.
- **The peripheral-power theorem (Layer 2)** — once Layer 1 lands, this should be a short assembly of the identity with the criterion already proved, followed by transfer to other conjugates of the cusp via BelyiMaps' `conjugation_transfer`.
- **The group of peripheral automorphisms (Layer 3.1, 3.2, 3.5)** — the subgroup, its exponent homomorphism, closedness, continuity of the exponent, and the section over the principal units. All wait on Layer 2 for surjectivity, and the section also needs ProfiniteArithmetic 1.2.
- **The dyadic instance (Layer 4)** — the specialization to `p = 2`, `r = 2` in consumer shape, in both conventions for the third element. It follows once Layers 1, 2 and 3.5 are in place.
