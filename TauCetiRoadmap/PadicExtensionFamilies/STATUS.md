<!--tauceti-status:v1 {"roadmap":"PadicExtensionFamilies","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the discriminant square class and root field (0.4); automorphism count and subfield multiset (0.5)","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"b557ae0b43b1bb1d194d723c96a0c4457073b4f2f2da52f23ad804038988ced6","roadmap":"PadicExtensionFamilies","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PadicExtensionFamilies

This file documents the status of the PadicExtensionFamilies roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is half done: the tame/wild splitting of the ramification index (§0.1) and the height and mean (§0.3) are proved, but the discriminant square class (§0.4) and the automorphism and subfield data (§0.5) are not. Layers 1–7, from the ramification polygon through the Galois root discriminant, have not begun.

### Named results

- **The height extends Serre's wild exponent** — on a totally ramified subextension of the separable closure, the height `H(L/K)` equals the wild exponent `c(L) = d(L) + 1 − [L : K]` of Tau Ceti's mass formula ([`IntermediateField.wildExponent_eq_height`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/MassFormula/Basic.html#IntermediateField.wildExponent_eq_height)).
- **The discriminant exponent through the height** — `c = f(e − 1) + fH`, so the height loses nothing of the discriminant ([`TauCeti.discriminantExponent_eq_inertiaDegree_mul_add_height`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Discriminant/Height.html#TauCeti.discriminantExponent_eq_inertiaDegree_mul_add_height)); the different-exponent form `d = e − 1 + H` is also proved.
- **The tame criterion for the height** — `H(L/K) = 0` exactly when `L/K` is tamely ramified, and likewise for the mean ([`TauCeti.height_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Discriminant/Height.html#TauCeti.height_eq_zero_iff)).
- **The wild upper bound** — `H(L/K) ≤ v_L(e)` when `e` is nonzero in `L`, with the matching bound `m ≤ v_K(e)` for the mean ([`TauCeti.height_le_natCastValuation`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Discriminant/Height.html#TauCeti.height_le_natCastValuation)).
- **The tame index divides `q^f − 1`** — for a Galois extension the prime-to-`p` part of `e` divides the order of the residue field's multiplicative group, and it is the index of wild inertia in inertia ([`TauCeti.tameRamificationIndex_dvd_natCard_pow_inertiaDegree_sub_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/TamelyRamified/Basic.html#TauCeti.tameRamificationIndex_dvd_natCard_pow_inertiaDegree_sub_one)).

### Notable definitions and infrastructure

- **Height and mean** — [`TauCeti.height`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Discriminant/Height.html#TauCeti.height) and [`TauCeti.mean`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Discriminant/Height.html#TauCeti.mean) are the LMFDB header invariants. Both are invariant under `K`-isomorphism and unchanged by passing to the totally ramified step of the canonical tower, which is the reduction Layer 1 will rely on.
- **Tame index and wild ramification exponent** — [`TauCeti.tameRamificationIndex`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/RamificationIndex.html#TauCeti.tameRamificationIndex) and [`TauCeti.wildRamificationExponent`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/RamificationIndex.html#TauCeti.wildRamificationExponent) give `e = ε p^w` with uniqueness, the tower laws (`ε` multiplies, `w` adds) and invariance under algebra equivalence.

### Roadmap coverage

Layer 0 is partial: §0.1 and §0.3 are proved, with the `ℚ₂(i)` check (height one, mean one half) formalized. §0.4, the discriminant square class and root field, and §0.5, the automorphism count and subfield multiset, have no declarations yet. Layers 1 (ramification polygon and residual polynomials), 2 (breaks and the slope polygon), 3 (Galois-closure invariants), 4 (indices of inseparability and jump sets), 5 (Krasner's count), 6 (families and masses) and 7 (the Galois root discriminant) are all untouched.

## The frontier

- **The discriminant square class (§0.4)** — define the class of `Algebra.discr` in `Kˣ/(Kˣ)²` and the root field `K(√disc)`, show both are independent of the basis and of the chosen square root, and give the LMFDB `rf` encoding over `ℚ_p`.
- **Automorphisms and subfields (§0.5)** — `#Aut(L/K)` divides `n`, with equality exactly for Galois extensions, and the subfield multiset is empty exactly when `L/K` has no proper intermediate field. This closes Layer 0.
- **The ramification polynomial (§1.1)** — define `ρ(x) = α^{-n} φ(αx + α)`, prove its exact coefficient-valuation formula and `v_L(ρ_1) = H`, and identify its roots with the normalised root differences. This opens Layer 1 and, through it, the polygon-to-break dictionary of Layer 2.
- **Krasner's count (Layer 5)** — according to the roadmap this is independent of Layers 1–4 and can start now from the pinned mass-formula API: Ore's conditions, the discriminant box, and the count of totally ramified extensions by degree and discriminant.
