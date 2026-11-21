<!--tauceti-status:v1 {"roadmap":"ECM","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"dee033bc9d3fd082582e658791a30c2fb3bc02c4116251a49b9c7e738e7516cc","roadmap":"ECM","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ECM

This file documents the status of the ECM roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. All five end theorems are proved (correctness of Montgomery doubling and differential addition on the native point group, the cross-difference criterion, Suyama's ellipticity criterion, and stage-1 detection), and the last open item, the description of the stage-1 multiplier `M(B₁)` as an lcm, is now covered.

### Named results

- **Correctness of Montgomery's x-only formulas** — for every native point of the monic model, [doubling](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Double.html#TauCeti.Montgomery.double_coordinates) with scaled constants `4N = (A + 2)D` gives a nonzero pair representing `[2]P`, with no hypothesis on `A`. From the pairs of `P`, `Q` and `P − Q`, [differential addition](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/DiffAdd.html#TauCeti.Montgomery.diffAdd_coordinates) represents `P + Q`, and its output is zero exactly when `P − Q` is infinity or `T₀`.
- **The binary ladder invariant** — any run of Montgomery's ladder from a nonzero representative of `P` produces representatives of `[n]P` and `[n + 1]P` ([`LadderRel.coordinates`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Ladder/Relations.html#TauCeti.Montgomery.LadderRel.coordinates)). The degenerate case `P = T₀`, where the odd step collapses to `(0, 0)`, has [its own statement](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Ladder.html#TauCeti.Montgomery.diffAdd_nsmul_ne_zero_iff_of_cross_eq_zero).
- **The cross-difference criterion** — the coordinate pairs of `[m]Q` and `[n]Q` have vanishing cross difference exactly when `[m − n]Q = 0` or `[m + n]Q = 0`, which is what makes stage 2 work ([`cross_coordinates_zsmul_eq_zero_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.cross_coordinates_zsmul_eq_zero_iff)).
- **Suyama's ellipticity criterion** — away from `σ = 0` and `σ² = 5`, Suyama's curve is elliptic exactly when `(σ² − 1)(σ² − 9)(σ² − 25)(9σ² − 25)(σ² + 5) ≠ 0`, characteristic 3 included ([`isElliptic_model_suyama_iff`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Suyama/Basic.html#TauCeti.Montgomery.isElliptic_model_suyama_iff)).
- **Stage-1 detection** — if a pair over `ZMod n` reduces modulo a prime `p ∣ n` to a representative of `[m]P` with `m` a multiple of the group order, then `p` divides `gcd(Z, n)`. It also holds with the point order, or the point count on an elliptic model, in place of the group order ([`prime_dvd_gcd_of_card_dvd`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Detection.html#TauCeti.Montgomery.prime_dvd_gcd_of_card_dvd)).

### Notable definitions and infrastructure

- **The monic model and its coordinate pairs** — [`model`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Basic.html#TauCeti.Montgomery.model) puts `B y² = x³ + A x² + x` into Weierstrass form, so every statement lives on Mathlib's own point group. [`coordinates`](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/Coordinates.html#TauCeti.Montgomery.coordinates) attaches to each point the raw pair that the x-only formulas act on.
- **Gcds of finite products** — a prime divides the gcd of a product of residues with `n` exactly when it divides some leaf gcd ([`List.prime_dvd_gcd_val_prod_iff`](https://taucetiproject.org/docs/TauCeti/Data/ZMod/ProductGCD.html#List.prime_dvd_gcd_val_prod_iff)). This needs no elliptic-curve input, and it yields the batched stage-2 result that a batch detected at one prime divisor and missed at another gives a [proper factor](https://taucetiproject.org/docs/TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/StageTwo/Product.html#TauCeti.Montgomery.one_lt_gcd_prod_cross_and_lt_of_addOrderOf_dvd_mul).
- **Powersmoothness for `lcm(1, …, n)`** — `d` divides `Nat.lcmUpto n` exactly when every prime-power divisor of `d` is at most `n` ([`Nat.dvd_lcmUpto_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LcmUpto.html#Nat.dvd_lcmUpto_iff)). This states exactly which orders the stage-1 multiplier annihilates, and is of independent use for `p − 1` methods.

### Roadmap coverage

All six layers are done. Layers 1 (the monic model, its discriminant, base change and the Montgomery equation), 2 (raw pairs, coordinate pairs, the projective x-coordinate and its fibres), 3 (doubling and differential addition with exact exceptional sets, also for arbitrary representatives) and 5 (Suyama's family) were already done. Layer 4 is done, with the ladder relations, the alternation at `T₀`, the cross-difference criterion and the decomposition `q = iw ± j`. Layer 6 is now done as well. It covers reduction along `ZMod.castHom`, the gcd classification, finite products, stage-1 and stage-2 detection, and the 6.4 statements on `M(B₁)`: [every `k ≤ B₁` divides it](https://taucetiproject.org/docs/TauCeti/NumberTheory/LcmUpto.html#Nat.dvd_lcmUpto), and its expansion as a product of maximal prime powers, which the source takes from Mathlib (`Nat.lcmUpto_eq_prod_pow_log`) instead of reproving.

## The frontier

- **No open milestones** — every target the README lists is proved. The procedure itself, its running time and its success probability are out of scope by the README's own terms.
- **Downstream consumers** — the README names factorization by elliptic curves, x-only arithmetic over finite fields and Pollard-type `p − 1` methods as users of Layers 3, 4 and 6.3. Any further work belongs to those developments, not to this roadmap.
