<!--tauceti-status:v1 {"roadmap":"ECM","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the lcm description of M(B1) as a product of maximal prime powers at most B1, and that every k at most B1 divides it","state":"partial"}],"readme_sha":"74e570d796afd7ac793c711801ec3a443787f9b6bb19ed2db409ffd37d8a750e","roadmap":"ECM","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: ECM

This file documents the status of the ECM roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five end theorems are proved: correctness of Montgomery doubling and differential addition on the native point group, the cross-difference criterion, Suyama's ellipticity criterion, and stage-1 detection. Layers 1–5 are done, and Layer 6 is done except for the description of the stage-1 multiplier `M(B₁)` as an lcm of prime powers.

### Named results

- **Correctness of Montgomery doubling** — for every native point `P` of the monic model, doubling its coordinate pair with scaled constants `4N = (A + 2)D` gives a nonzero pair representing `[2]P`, with no hypothesis on `A` ([`double_coordinates`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Double.html#TauCeti.Montgomery.double_coordinates)).
- **Correctness of differential addition** — from the pairs of `P`, `Q` and `P − Q` the formula represents `P + Q`, and its output is zero exactly when `P − Q` is infinity or the distinguished point `(0, 0)` ([`diffAdd_coordinates`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/DiffAdd.html#TauCeti.Montgomery.diffAdd_coordinates)).
- **The cross-difference criterion** — the coordinate pairs of `[m]Q` and `[n]Q` have vanishing cross difference exactly when `[m − n]Q = 0` or `[m + n]Q = 0`, which is what makes stage 2 work ([`cross_coordinates_zsmul_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.cross_coordinates_zsmul_eq_zero_iff)).
- **Suyama's ellipticity criterion** — away from `σ = 0` and `σ² = 5`, Suyama's curve is elliptic exactly when `(σ² − 1)(σ² − 9)(σ² − 25)(9σ² − 25)(σ² + 5) ≠ 0`, characteristic 3 included ([`isElliptic_model_suyama_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Suyama/Basic.html#TauCeti.Montgomery.isElliptic_model_suyama_iff)).
- **Stage-1 detection** — if a pair over `ZMod n` reduces modulo a prime `p ∣ n` to a representative of `[m]P` with `m` a multiple of the group order, then `p` divides `gcd(Z, n)`; it also holds with the point order or, on an elliptic model, the [point count](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Detection.html#TauCeti.Montgomery.prime_dvd_gcd_of_pointCount_dvd) in place of the group order ([`prime_dvd_gcd_of_card_dvd`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Detection.html#TauCeti.Montgomery.prime_dvd_gcd_of_card_dvd)).

### Notable definitions and infrastructure

- **The monic model and its coordinate pairs** — [`model`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Basic.html#TauCeti.Montgomery.model) puts `B y² = x³ + A x² + x` into Weierstrass form, so every statement lives on Mathlib's own point group, and [`coordinates`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.coordinates) attaches to each point the raw pair that the x-only formulas act on.
- **The projective x-coordinate** — [`projectiveX`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.projectiveX) maps points to the projective line with fibres `{P, −P}`; its image is [identified with the quotient by negation](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.orbitRelQuotientEquivRangeProjectiveX), and a point `(r : 1)` [lifts](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.toProj_mem_range_projectiveX_iff) exactly when the expected square condition holds.
- **Gcds of finite products** — a prime divides the gcd of a product of residues with `n` exactly when it divides some leaf gcd ([`List.prime_dvd_gcd_val_prod_iff`](https://taucetiproject.org/docs/TauCeti/Data/ZMod/ProductGCD.html#List.prime_dvd_gcd_val_prod_iff)), which is how batched stage-2 tests are justified and needs no elliptic-curve input.

### Roadmap coverage

Layers 1 (the monic model, its discriminant, base change and the Montgomery equation), 2 (raw pairs, coordinate pairs, the projective x-coordinate and its fibres), 3 (doubling and differential addition with exact exceptional sets) and 5 (Suyama's family, including the point `(u³ : v³)`) are done. Layer 4 is done too: besides the cross-difference criterion and the nearest-multiple decomposition `q = iw ± j`, the source contains the binary ladder invariant `LadderRel.coordinates` and the alternation at the distinguished point of order two. Layer 6 is partial: reduction along `ZMod.castHom`, the gcd classification, finite products, stage-1 detection and stage-2 detection (for a single cross difference and for batched products of them) are all in the source, but the 6.4 statements that `M(B₁) = lcm(1, …, B₁)` is the product of the largest prime powers `≤ B₁` and that every `k ≤ B₁` divides it were not found.

## The frontier

- **The stage-1 multiplier `M(B₁)`** — prove that `(Finset.Icc 1 B₁).lcm id` equals the product over primes `ℓ ≤ B₁` of the largest power of `ℓ` at most `B₁`, and that `k ∣ M(B₁)` for `1 ≤ k ≤ B₁`. This is elementary number theory with no dependence on the elliptic-curve layers, and is the last item the README lists.
