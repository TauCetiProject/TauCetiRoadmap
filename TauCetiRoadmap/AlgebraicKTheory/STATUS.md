<!--tauceti-status:v1 {"roadmap":"AlgebraicKTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"kZeroMap and its functoriality, products and matrix Morita, the idempotent model V(R), and the sphere and Mobius examples of 0.5-0.7","state":"partial"},{"id":"Layer 1","remaining":"GL-infinity of a ring map, perfectness of E-infinity, corner embeddings, filtered colimits and the finitary-automorphism comparison","state":"partial"},{"id":"Layer 2","remaining":"the automorphism presentation, Morita invariance, the Dieudonne determinant and kOne_divisionRing","state":"partial"},{"id":"Layer 3","remaining":"relative K1(R,I), the relative triple group, the boundary and exact sequences, reduced K0; only reduced K1 of a unitization exists","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"8e989363c1f6e19056f523252518a7aafe398e137d8bdc7a83665c8d3b3b1f66","roadmap":"AlgebraicKTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AlgebraicKTheory

This file documents the status of the AlgebraicKTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The first three layers are under way. K₀ is defined and computed for rings whose projectives are stably free. K₁ has its determinant, the splitting off of SK₁ and the value K₁(ℤ) = {±1}. The elementary-matrix layer has its ring-map and lifting statements. Nothing from relative groups onward (Layers 3–8) has begun, apart from one fragment noted below. None of the end theorems is proved: Milnor patching, the Mayer–Vietoris sequence, Vaserstein's formulas, the Steinberg extension and Matsumoto's theorem are all still open.

### Named results

- **K₁ of the integers** — [K₁(ℤ) ≅ ℤˣ = {±1}](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.AlgebraicK1.detEquivInt), via the determinant, with the class of (−1) the element of order two.
- **The determinant splitting of K₁** — for a commutative ring, [K₁(R) ≅ Rˣ × SK₁(R)](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.AlgebraicK1.equivUnitsProdSpecial). A class goes to its determinant and to its correction by a 1×1 matrix. A [general criterion](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.specialAlgebraicK1_eq_bot_of_ker_det_le) kills SK₁ whenever every determinant-one matrix is elementary.
- **Elementary means determinant one, over ℤ and over fields** — an invertible matrix is a product of elementary matrices exactly when its determinant is 1, [over ℤ](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Elementary.html#TauCeti.elementarySubgroup_int_eq_ker_det) and [over a field](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Elementary.html#TauCeti.elementarySubgroup_eq_ker_det_of_field).
- **K₀ is ℤ when projectives are stably free** — over a ring with invariant basis number whose finitely generated projectives are stably free, [K₀ ≅ ℤ](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Rank.html#TauCeti.FiniteProjectiveModules.rankEquiv), with [R] ↦ 1. This gives the roadmap's [K₀ of a division ring](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Rank.html#TauCeti.kZero_divisionRing) and [K₀(ℤ)](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Rank.html#TauCeti.kZero_int).
- **Lifting elementary matrices through surjections** — an elementary matrix [lifts to an elementary matrix of the same size](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Elementary.html#RingHom.exists_mem_elementarySubgroup_unitsMap_mapMatrix_eq) through any surjective ring map. In particular u ⊕ u⁻¹ lifts even when u does not.

### Notable definitions and infrastructure

- [`KZero`](https://taucetiproject.org/docs/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/KZero/Defs.html#TauCeti.KZero) — the projective K₀, built on the split Grothendieck group of finitely generated projective right modules.
- [`AlgebraicK1.det`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.AlgebraicK1.det) with [`specialAlgebraicK1`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/DeterminantK1.html#TauCeti.specialAlgebraicK1) — the determinant K₁(R) → Rˣ and its kernel SK₁(R), for commutative R.
- [`RingHom.elementarySubgroupMap`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Elementary.html#RingHom.elementarySubgroupMap) — the functorial action of a ring map on Eₙ, for arbitrary (noncommutative) rings. It is surjective for surjective maps, which is what the boundary of Milnor patching will need.

### Roadmap coverage

Layers 0, 1 and 2 are partial.

- **Layer 0:** K₀ is defined and computed for division rings, ℤ and principal ideal domains. Still missing are `kZeroMap` with its functoriality and the extension isomorphisms of 0.3, the product and matrix Morita formulas, the right-module transport of 0.2, the idempotent model of 0.4, and the three function-ring examples of 0.5–0.7.
- **Layer 1:** 1.1 (the ring-map formula and the SL comparison) and 1.4 (lifting) are done. Missing are the corner and injection embeddings, the map GL∞(f), the filtered-colimit and finitary-automorphism comparisons, and perfectness of E∞.
- **Layer 2:** K₁ already has an induced map along ring maps in Tau Ceti, with its identity and composition laws (`AlgebraicK1.map`). This window added the determinant, SK₁, the splitting and K₁(ℤ). Missing are the automorphism presentation K₁ᴮ of 2.2, Morita invariance, the Dieudonné determinant, K₁ of fields and division rings as named statements, and the product, colimit and block-sum laws of 2.1.
- **Layer 3:** only one fragment exists. Tau Ceti has reduced K₁ of a unitization, `relativeAlgebraicK1`, functorial in nonunital maps. There are no relative groups of ideals, no relative triple group, and no boundary.
- **Layers 4–8:** untouched (stable range, Steinberg groups and K₂, Milnor patching, gluing calculations, and the topological comparison).

## The frontier

- **K₁ of fields** — K₁(F) = Fˣ needs only the SK₁ criterion combined with the field case of "elementary = determinant one", both now in place. `kOne_divisionRing` additionally needs the Dieudonné determinant, which has not been started.
- **`kZeroMap` and its functoriality** — the induced map of K₀ along ring maps, with `extendScalarsιIso` and `extendScalarsCompIso`. Tau Ceti's extension functor on finite projectives is available; the work is the transport to right modules through opposite rings. The K₀ half of Mayer–Vietoris depends on it.
- **The rest of Layer 1** — the map GL∞(f), perfectness of E∞ as a `Group.IsPerfect` statement, and the lower-right and injective corner embeddings. All of these are short consequences of Tau Ceti's Whitehead lemmas.
- **The automorphism presentation K₁ᴮ** — the Bass presentation for an additive category and its comparison K₁ᴮ(Proj(R)) ≅ K₁(R). It is the source of the boundary map in Layer 3.
- **Steinberg groups** — Layer 5 depends only on Tau Ceti and Layer 0, so St(R) and the universal-central-extension theorem can start now, in parallel with Layers 2–3.
