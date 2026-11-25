<!--tauceti-status:v1 {"roadmap":"ShimuraVarieties","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2","ts":"2026-11-25T12:15:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"untouched"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"rest of 3.4b (first-order bridge, closure and interior, semialgebraic sets definable in expansions), then 3.4c onward through Borel algebraicity","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"reflex field is CM, product compositum, reflex norm and type-norm identities, then 5.0 and 5.2 onward","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"norm transition maps and the Serre protorus limit in 7.0a, then 7.0b onward","state":"partial"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"db51f925c07081eeb4bf1f9fe81048a71ae2e961e5384253bc7311673de32cad","roadmap":"ShimuraVarieties","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2"}-->
# Status: ShimuraVarieties

This file documents the status of the ShimuraVarieties roadmap up until `58174b5` (2026-11-25T12:15:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only foundations exist so far. The Hodge-theoretic prerequisites, Mumford–Tate groups included, are well advanced. The first pieces of three layers have landed: o-minimal structures in Layer 3, CM types and reflex fields in Layer 5, and the Serre torus in Layer 7. No Shimura datum has been defined yet, so the complex theory of Layers 0–2, canonical models (Layer 4), the Hodge and abelian-type existence results (Layer 6) and the arithmetic towers (Layer 8) have not begun.

### Named results

- **Geometric connectedness of the Mumford–Tate group** — the smallest rational subgroup through which a homomorphism from the Deligne torus factors is geometrically connected, with no polarization assumed ([`geometricallyConnectedCommHopfAlgProperty_quotient_mumfordTateHopfIdeal`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DeligneTorus/MumfordTate/Connected.html#TauCeti.DeligneTorus.geometricallyConnectedCommHopfAlgProperty_quotient_mumfordTateHopfIdeal)).
- **The Hodge decomposition of a representation of the Deligne torus** — the complexification of a real representation is the direct sum of its Hodge components `V^{p,q}`, which are compatible with conjugation, tensor products, duals and Tate twists ([`isInternal_hodgeComponent`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DeligneTorus/Hodge.html#TauCeti.DeligneTorus.isInternal_hodgeComponent)).
- **The reflex field is the field of definition of a CM type** — an automorphism of ℂ fixes the reflex field pointwise exactly when it preserves the type ([`mem_fixingSubgroup_reflexField_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CMType/ReflexField.html#TauCeti.CMType.mem_fixingSubgroup_reflexField_iff)).
- **Reduction to primitive CM types** — every CM type on a number field is induced from a primitive type on a subfield ([`exists_isPrimitive_induced_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CMType/Primitive.html#TauCeti.CMType.exists_isPrimitive_induced_eq)).
- **The universal property of the Serre torus** — morphisms from `S^L` to a torus correspond to cocharacters satisfying the Serre relation, through the universal cocharacter ([`existsUnique_universalCocharacter_comp_homEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/SerreTorus/Basic.html#TauCeti.SerreTorus.existsUnique_universalCocharacter_comp_homEquiv)).

### Notable definitions and infrastructure

- **The Mumford–Tate group as a Hopf ideal** ([`mumfordTateHopfIdeal`](https://taucetiproject.org/docs/TauCeti/Algebra/AlgebraicGroup/DeligneTorus/MumfordTate/Basic.html#TauCeti.DeligneTorus.mumfordTateHopfIdeal)): it is minimal, finitely generated, and moves under conjugation. It is also specialised to rational Hodge structures ([`HodgeStructureOn.mumfordTateHopfIdeal`](https://taucetiproject.org/docs/TauCeti/Geometry/Hodge/MumfordTate.html#TauCeti.Hodge.HodgeStructureOn.mumfordTateHopfIdeal)), which is the form in which the Hodge-type layers will use it.
- **CM types and reflex fields** ([`CMType`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CMType/Basic.html#TauCeti.CMType), [`reflexField`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/CMType/ReflexField.html#TauCeti.CMType.reflexField)), defined for any commutative ring, with the action of Aut(ℂ), induction and complementary types. The reflex field is a number field, and ℚ(i) is computed as an example. These are the inputs to the reflex norm and the main theorem of complex multiplication.
- **O-minimal structures** ([`OMinimalStructure`](https://taucetiproject.org/docs/TauCeti/ModelTheory/OMinimal/Basic.html#TauCeti.OMinimalStructure)), with definable maps and the [semialgebraic structure](https://taucetiproject.org/docs/TauCeti/Geometry/RealAlgebraic/Semialgebraic/OMinimal.html#TauCeti.OMinimalStructure.semialgebraic) on ℝ. This is the carrier for the definable route to Borel algebraicity.

### Roadmap coverage

Among the prerequisites, the Hodge dictionary of §P.3 is largely in place, and so is the construction of Mumford–Tate groups in §P.3a. The reflex field of a datum is not, though fields of definition of torus cocharacters exist. Of §P.3a's properties, only connectedness is proved; the stability criterion for sub-Hodge structures, the scalar clause and reductivity under polarizability remain. §P.1's pure datum, the Hermitian components of §P.2 and §§P.5–P.6 are not established here. Layers 3, 5 and 7 are partial. In Layer 3, only the opening of §3.4b is done: the axioms, the basic closure properties and the semialgebraic structure. In Layer 5, the CM-type and reflex-field part of §5.1 is done, but not the CM property of the reflex field, the reflex norm, or anything from §5.2 on. In Layer 7, §7.0a is done at each finite level. Layers 0, 1, 2, 4, 6 and 8 are untouched.

## The frontier

- **The pure Shimura datum (§P.1)** — the definition of a datum with axioms SV1–SV3, and its morphisms and special pairs, has not been written. Every layer from 0 to 2 waits on it, and so does the canonical-model theory from Layer 4 on.
- **The reflex norm (§5.1)** — the reflex field still has to be shown to be a CM field, and compatible with products. Then come the type norm `N_Φ` and its identities.
- **The rest of §P.3a** — a rational subspace is a sub-Hodge structure exactly when it is Mumford–Tate stable. The Mumford–Tate group contains the scalars in nonzero pure weight, and it is reductive when the structure is polarizable.
- **The Serre protorus (§7.0a)** — what remains is the norm transition maps between Serre tori of nested CM fields, and the inverse limit with its universal cocharacter. The Taniyama extension of §7.0b depends on these.
- **O-minimal geometry (§§3.4b–3.4e)** — the comparison with first-order definability, the definability of closures and interiors, and the fact that every semialgebraic set is definable in an expansion of the field are all still open. The monotonicity theorem and cell decomposition of §3.4c come after.
