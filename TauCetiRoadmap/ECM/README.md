# Roadmap: elliptic-curve factorization and Montgomery arithmetic

**Summary.** This roadmap builds the algebraic theory behind Lenstra's elliptic-curve method
(ECM) in Montgomery's form. It starts from Mathlib's `WeierstrassCurve` and its native point
group `W.toAffine.Point`, defines the monic model of a Montgomery curve `B y² = x³ + A x² + x`,
raw projective `x`-coordinate pairs and the Montgomery doubling and differential-addition
formulas, and proves that these formulas compute the `x`-coordinates of `[2]P` and `P + Q` on
the native group, with their exact exceptional sets. It then proves the scalar-multiple
relations behind the Montgomery ladder, the stage-2 cross-difference criterion, Suyama's
ellipticity criterion, and the comparison with arithmetic modulo a composite `n`: a prime
divisor `p` of `n` divides `gcd(Z, n)` whenever the reduction of a coordinate pair modulo `p`
represents a multiple of a point by a multiple of the group order. The end theorems are
`double_coordinates`, `diffAdd_coordinates`, `coordinates_cross_eq_zero_iff`,
`isElliptic_model_suyama_iff` and `prime_dvd_gcd_of_card_dvd`.

## Scope and ownership

This roadmap owns: the monic model of a Montgomery curve and its coefficient API; raw
coordinate pairs and the coordinate pair of a native point; the Montgomery doubling and
differential-addition formulas and their correctness on the native point group; the
projective `x`-coordinate map into `Projectivization K (Fin 2 → K)` and its fibres; the
scalar-multiple relations of the Montgomery ladder; Suyama's parametrization and its exceptional
set; the stage-2 cross-difference criterion; and the comparison of all of these with arithmetic
in `ZMod n` through reduction modulo a prime divisor, including the gcd classification of
residues and its behaviour under finite products.

It does not own, and does not restate:

- abstract elliptic-curve theory, the Hasse bound and the quadratic degree form, which the
  [elliptic-curves roadmap](../EllipticCurves/README.md) owns (its Layer 3 and Layer 1). No
  target here needs them: the detection theorems are conditional on divisibility of the group
  order and use only Lagrange's theorem;
- the group law on `W.toAffine.Point`, divisibility of point orders, `Prime.dvd_prod_iff`,
  `Finset.lcm` and the elementary theory of `ZMod`, all already in Mathlib (exact names under
  supplier contracts);
- `WeierstrassCurve.pointCount` and its comparison with `Nat.card W.toAffine.Point`, already in
  Tau Ceti.

Out of scope altogether: running-time statements, smooth-number estimates, distributions of
group orders, success probabilities, fast polynomial stage-2 continuations, and any procedure,
search or implementation. The roadmap states mathematics about scalar multiples, coordinate
pairs and finite products; the factoring method appears only as motivation.

## Conventions

- A Montgomery curve is `B y² = x³ + A x² + x`. Its monic model is
  `y'² = x'³ + AB x'² + B² x'`, reached by `x' = Bx`, `y' = B²y`, with Weierstrass coefficients
  `(a₁, a₂, a₃, a₄, a₆) = (0, AB, 0, B², 0)` and discriminant `16 B⁶ (A² − 4)`. Over a field the
  model is elliptic exactly when `2`, `B` and `A² − 4` are nonzero. Points are the native points
  of the monic model; no second group law is introduced.
- Statements about points carry `B ≠ 0`. Statements about the coordinate formulas carry
  `(2 : K) ≠ 0` where the formulas need it; characteristic `3` is included throughout.
  Nonsingularity of the model (`A² ≠ 4`) is carried only where a statement needs it: the
  coordinate formulas are correct on the native points of a singular model as well, since those
  points are nonsingular by construction.
- A raw pair `(X, Z)` stands for `x = X/Z`; infinity is `(1, 0)`. A pair denotes a point of the
  projective line only when it is nonzero; `(0, 0)` is a possible value of a formula and never a
  point. Two nonzero pairs represent the same point when `X₁ Z₂ = X₂ Z₁`.
- The coordinate pair of a native point of the monic model sends infinity to `(1, 0)` and the
  affine point `(x', y')` to `(x', B)`, which represents the Montgomery coordinate `x = x'/B`.
- Doubling uses `A24 = (A + 2)/4` in scaled form: scalars `N, D` with `D ≠ 0` and
  `4N = (A + 2) D`. The `(A − 2)/4` convention gives a different doubling and is not used.
- The stage-1 bound is `M(B₁) = (Finset.Icc 1 B₁).lcm id`, the product of the largest prime
  powers at most `B₁`, with `M(0) = M(1) = 1`. "Smooth enough" always means `addOrderOf P ∣ m`
  or `Nat.card E ∣ m` for the multiplier `m`, never that the prime divisors of the order are at
  most `B₁`.
- A gcd `g = gcd(t, n)` has three outcomes: `g = 1`, a proper factor `1 < g < n`, and `g = n`.
  Only the second is a factor; nothing is concluded about primality from the other two.

## Exact supplier contracts

### From Mathlib

- `WeierstrassCurve` and its invariants `WeierstrassCurve.b₂`, `b₄`, `b₆`, `b₈`,
  `WeierstrassCurve.Δ` (`Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean`), and
  `WeierstrassCurve.IsElliptic`, which asks that `Δ` be a unit.
- `WeierstrassCurve.map` for change of base ring.
- `WeierstrassCurve.Affine.Point` with constructors `zero` and `some x y h`, `h` a proof of
  `Nonsingular`; the `AddCommGroup` instance on it, which needs `DecidableEq` on the field and
  no ellipticity; and `WeierstrassCurve.Affine.Point.X_eq_iff`: two affine points have equal
  `x`-coordinate exactly when they are equal or negatives
  (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean`).
- `Projectivization`, `Projectivization.mk` (a nonzero vector) and
  `Projectivization.mk_eq_mk_iff` (equality up to a unit multiple)
  (`Mathlib/LinearAlgebra/Projectivization/Basic.lean`).
- `ZMod.castHom` (needs `m ∣ n` and `CharP R m`), `ZMod.val`, `ZMod.val_natCast`,
  `ZMod.natCast_eq_zero_iff`, `ZMod.intCast_zmod_eq_zero_iff_dvd`
  (`Mathlib/Data/ZMod/Basic.lean`), and `Nat.gcd` with its divisibility lemmas.
- `addOrderOf_dvd_iff_nsmul_eq_zero` (an additive monoid) and `addOrderOf_dvd_natCard`
  (an additive group; `Nat.card` is `0` for an infinite group)
  (`Mathlib/GroupTheory/OrderOfElement.lean`).
- `Prime.dvd_prod_iff`: a prime divides a list product exactly when it divides some entry, in
  any commutative monoid with zero, the empty list included (`Mathlib/Data/List/Prime.lean`).
- `Finset.lcm` with its divisibility API (`Mathlib/Algebra/GCDMonoid/Finset.lean`) and
  `Finset.lcm_eq_prod` for pairwise coprime natural-number entries
  (`Mathlib/Algebra/GCDMonoid/FinsetLemmas.lean`).

### From Tau Ceti

- `WeierstrassCurve.pointCount`, the projective count over a field, singular point included,
  and `WeierstrassCurve.pointCount_eq_card_point`, which identifies it with
  `Nat.card W.toAffine.Point` when the solution set of the affine equation is finite and
  `W.IsElliptic` holds (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`). Over `ZMod p`
  the finiteness is automatic.

### From other roadmaps

None. The [elliptic-curves roadmap](../EllipticCurves/README.md) is named under scope only.

## How to read the build

Layer 1 fixes the monic model and its coefficient API. Layer 2 introduces raw pairs, the
coordinate pair of a native point and the projective `x`-coordinate map with its fibres.
Layer 3 defines doubling and differential addition and proves their correctness, with exact
exceptional sets, on the native point group. Layer 4 derives the ladder relations for scalar
multiples and the stage-2 cross-difference criterion. Layer 5 treats Suyama's family and needs
only Layer 1. Layer 6 compares everything with `ZMod n` through reduction modulo a prime divisor
and proves the gcd classification, its behaviour under finite products, and the stage-1 and
stage-2 detection theorems.

## Layer 1: Montgomery models

### 1.1 The monic model

Define `model A B` over a commutative ring as the Weierstrass curve with coefficients
`(0, AB, 0, B², 0)` (Montgomery 1987, §10.3.1, equation (10.3.1.1), p. 260, for the curve;
the monic change of variables is elementary). *Needs:* Mathlib `WeierstrassCurve`.

- The discriminant of `model A B` is `16 B⁶ (A² − 4)` over every commutative ring, with no
  hypothesis.
- Over a commutative ring, `model A B` is elliptic exactly when `16 B⁶ (A² − 4)` is a unit; over
  a field, exactly when `(2 : K) ≠ 0`, `B ≠ 0` and `A² ≠ 4`.
- For a ring homomorphism `f`, the base change of `model A B` along `f` is `model (f A) (f B)`.
- Two models are equal exactly when their `AB` and `B²` coefficients agree; over a domain with
  `B ≠ 0` this determines `A` and `B` up to `(A, B) ↦ (−A, −B)`.
- When `B ≠ 0`, the affine point `(0, 0)` is a nonsingular point of `model A B` (the partial
  derivative in `x'` there is `B²`), and it has order `2` in the native group. Call it the
  distinguished `2`-torsion point `T₀`.

**Checks.**

- `(A, B) = (0, 1)` over `ℚ`: the discriminant is `16 · 1 · (0 − 4) = −64 ≠ 0`, so the model is
  elliptic. A sign error in `A² − 4` would give `+64`.
- `(A, B) = (2, 1)` over `ℚ`: the discriminant is `0`, and the cubic is `x(x + 1)²` with singular
  point at `x = −1`. `(A, B) = (0, 0)`: the discriminant is `0` because `B = 0`.
- The coefficients of `model 3 2` are `(0, 6, 0, 4, 0)`. Taking `x' = x` instead of `x' = Bx`
  would give `a₂ = 3`, `a₄ = 1`, which is not a Weierstrass model of `2y² = x³ + 3x² + x`.
- Over `𝔽₇` with `(A, B) = (0, 1)` the native group has `8` elements: infinity, `(0, 0)`,
  `(1, ±3)`, `(3, ±3)`, `(5, ±2)`; over `𝔽₅` with the same coefficients it has `4` elements:
  infinity and the three points `(0, 0)`, `(2, 0)`, `(3, 0)` of order `2`.

### 1.2 The Montgomery equation

Prove that, for `B ≠ 0` over a field, `(x, y)` satisfies `B y² = x³ + A x² + x` exactly when
`(Bx, B²y)` satisfies the equation of `model A B`, and that this correspondence preserves and
reflects nonsingularity. No square root of `B` is needed. *Needs:* 1.1; Mathlib
`WeierstrassCurve.Affine.Equation`, `WeierstrassCurve.Affine.Nonsingular`.

**Checks.**

- Over `𝔽₇` with `(A, B) = (0, 2)`, the Montgomery point `(1, 1)` of `2y² = x³ + x` goes to
  `(2, 4)`, and `4² = 16 = 2 = 2³ + 4 · 2` in `𝔽₇`.
- Multiplying the model's equation at `(Bx, B²y)` out gives `B⁴y² = B³(x³ + A x² + x)`, so the
  equivalence fails at `B = 0`: then every `(x, y)` goes to `(0, 0)`, which satisfies the model's
  equation, while `(1, 0)` does not satisfy the Montgomery equation `0 = 1 + 0 + 1` for `A = 0`.
- The singular point `(−1, 0)` of `y² = x³ + 2x² + x` goes to the singular point `(−1, 0)` of
  `model 2 1`, so the correspondence does not create nonsingular points.

### Examples

The curve `y² = x³ + x` over `𝔽₇` (group of order `8`, cyclic, generated by `(3, 3)`) and over
`𝔽₅` (group `(ℤ/2)²`) are the running examples of Layers 2–6.

### Dependencies

Mathlib `WeierstrassCurve` and its affine equations. No earlier layer.

## Layer 2: raw pairs, coordinate pairs and the projective x-coordinate

### 2.1 Raw pairs

Define `Pair R` as a structure with two fields `x` and `z` of type `R`, standing for `X/Z`, and
`Pair.map f` for a ring homomorphism `f`, applying `f` to both fields. *Needs:* nothing.

- `Pair.map` respects identities and composition of ring homomorphisms.
- Over a field, two nonzero pairs satisfy `X₁ Z₂ = X₂ Z₁` exactly when one is a nonzero scalar
  multiple of the other, and then they define the same element of
  `Projectivization K (Fin 2 → K)` (`Projectivization.mk_eq_mk_iff`). The relation is
  transitive on nonzero pairs and fails to be transitive once `(0, 0)` is admitted.
- Over a commutative ring, scaling by a unit preserves the relation `X₁ Z₂ = X₂ Z₁`.

**Checks.**

- `(2, 4)` and `(1, 2)` over `ℚ` satisfy `2 · 2 = 1 · 4` and differ by the scalar `2`.
- `(0, 0)` satisfies `X₁ Z₂ = X₂ Z₁` with every pair, so `(1, 0)` and `(0, 1)` would be related
  through it; this is the reason `(0, 0)` is excluded from the projective line.
- Over `ZMod 15`, scaling `(1, 1)` by the non-unit `5` gives `(5, 5)`, whose reduction modulo `5`
  is `(0, 0)`: projective equivalence over a ring needs a unit.

### 2.2 The coordinate pair of a native point

Define `coordinates A B`, sending infinity to `(1, 0)` and the affine point `(x', y')` of
`model A B` to `(x', B)`. *Needs:* 1.1, 2.1.

- For `B ≠ 0`, `coordinates A B P` is nonzero for every native point `P`.
- Its second field vanishes exactly at infinity, and for `B ≠ 0` its first field vanishes
  exactly at `T₀`, the affine point `(0, 0)`.
- `coordinates A B (−P) = coordinates A B P` for every `P`.
- For a field embedding `f`, the coordinate pair of the image of `P` is the image under
  `Pair.map f` of the coordinate pair of `P`.

**Checks.**

- Over `𝔽₇` with `(A, B) = (0, 1)`: `(1, 3) ↦ (1, 1)`, infinity `↦ (1, 0)`, `(0, 0) ↦ (0, 1)`.
- Over `𝔽₇` with `(A, B) = (0, 2)`: the point `(2, 4)` goes to `(2, 2)`, which represents the
  Montgomery coordinate `x = 1`. The plausible wrong choice `(x', 1)` would represent `2`.
- Negation: `(1, 4) = −(1, 3)` over `𝔽₇` also goes to `(1, 1)`.

### 2.3 The projective x-coordinate and its fibres

Define the projective `x`-coordinate of a native point of `model A B` over a field with
`B ≠ 0` as the element of `Projectivization K (Fin 2 → K)` given by its coordinate pair.
Prove that two native points have the same projective `x`-coordinate exactly when they are
equal or negatives, including when one of them is infinity, and that the map is compatible with
field embeddings. Do not assert that every `K`-rational point of the projective line is the
image of a `K`-rational point of the curve: `(r : 1)` lifts exactly when `(r³ + A r² + r)/B` is
a square in `K`. Identify the quotient of the point group by negation with the image of this
map. *Needs:* 2.2; Mathlib `Projectivization.mk`, `Projectivization.mk_eq_mk_iff`,
`WeierstrassCurve.Affine.Point.X_eq_iff`.

**Checks.**

- Over `𝔽₇` with `(A, B) = (0, 1)`, the eight native points have five projective
  `x`-coordinates: `(1 : 0)`, `(0 : 1)`, `(1 : 1)`, `(3 : 1)`, `(5 : 1)`.
- The point `(2 : 1)` of the projective line over `𝔽₇` is not in the image: `2³ + 2 = 3` is not a
  square modulo `7`.
- Infinity and `(0, 0)` are their own negatives and are the only fibres of size one in this
  example; the other fibres `{(1, 3), (1, 4)}`, `{(3, 3), (3, 4)}`, `{(5, 2), (5, 5)}` have size
  two.

### Examples

Over `𝔽₅` with `(A, B) = (0, 1)` every native point has order dividing `2`, so the projective
`x`-coordinate is injective on the native points there: `(1 : 0)`, `(0 : 1)`, `(2 : 1)`,
`(3 : 1)`.

### Dependencies

Layer 1; Mathlib `Projectivization`, `WeierstrassCurve.Affine.Point`.

## Layer 3: doubling and differential addition

### 3.1 Doubling

Define `double N D (X, Z)` as `(D U V, C (D V + N C))` with `U = (X + Z)²`, `V = (X − Z)²`,
`C = U − V` (Montgomery 1987, §10.3.1, p. 261, the duplication display; Bernstein–Lange EFD,
entry `dbl-1987-m-3`, efd line 166, after multiplying both coordinates by `D`). *Needs:* 2.1.

- `double N D` is homogeneous of degree `4`: scaling the input by `λ` scales the output by `λ⁴`.
- It commutes with ring homomorphisms: the image under `Pair.map f` of `double N D P` is
  `double (f N) (f D) (Pair.map f P)`.
- It sends `(1, 0)` to `(D, 0)` and `(0, 1)` to `(D, 0)`.
- **`double_coordinates`.** Over a field with `(2 : K) ≠ 0`, `B ≠ 0`, `D ≠ 0` and
  `4N = (A + 2) D`, for every native point `P` of `model A B`, `double N D` of the coordinate
  pair of `P` is nonzero and represents the coordinate pair of `P + P`. No hypothesis on `A` is
  needed.

**Checks.**

- Over `𝔽₇` with `(A, B, N, D) = (0, 1, 2, 4)`: `P = (1, 3)` has `P + P = (0, 0)`, and
  `double 2 4 (1, 1) = (0, 4)`, which represents `0`. Infinity doubles to `(4, 0)`.
- Over `ℚ` with `(A, N, D) = (0, 2, 4)`, `double 2 4 (2, 1) = (36, 160)`, representing
  `9/40 = (2² − 1)² / (4 · 2 · (2² + 1))`. The wrong convention `N = −2`, from `(A − 2)/4`, gives
  `(36, −96)`, and the cross difference `36 · (−96) − 36 · 160 = −9216` is not zero.
- Singular negative control: with `A = 2`, `N = D = 1`, the pair `(−1, 1)` of the singular point
  of `y² = x(x + 1)²` doubles to `(0, 0)`. That point is not a native point, so this does not
  contradict `double_coordinates`; it shows why the theorem is stated on native points.
- With `D = 0` (so `N = 0`) every pair doubles to `(0, 0)`: the hypothesis `D ≠ 0` is needed.

### 3.2 Differential addition

Define `diffAdd P Q S` as `(Z_S (a + b)², X_S (a − b)²)` with `a = (X_P + Z_P)(X_Q − Z_Q)` and
`b = (X_P − Z_P)(X_Q + Z_Q)`, where `S` is meant to represent `P − Q` (Montgomery 1987,
§10.3.1, p. 261, the addition display; EFD, entry `dadd-1987-m-3`, efd line 247). *Needs:* 2.1.

- `diffAdd` is homogeneous of degree `2` in `P`, `2` in `Q` and `1` in `S`, and symmetric in
  `P` and `Q` (exchanging them exchanges `a` and `b`).
- It commutes with ring homomorphisms through `Pair.map`.
- **`diffAdd_coordinates`.** Over a field with `(2 : K) ≠ 0` and `B ≠ 0`, for native points
  `P, Q` of `model A B`, `diffAdd` of the coordinate pairs of `P`, `Q` and `P − Q` represents the
  coordinate pair of `P + Q`, and its output is nonzero exactly when `P − Q` is neither infinity
  nor `T₀` (equivalently, both fields of the coordinate pair of `P − Q` are nonzero).
- Every other point of order `2` is non-exceptional: if `T = (r, 0)` is a native point with
  `r ≠ 0`, then `diffAdd` of the pairs of `T`, infinity and `T` is nonzero and represents `T`.
- Prove both theorems for arbitrary nonzero representatives in place of the coordinate pairs,
  using homogeneity; these are the forms Layer 4 uses.

**Checks.**

- Over `𝔽₇` with `(A, B) = (0, 1)`: `P = (3, 3)`, `Q = (1, 3)`, `P − Q = (5, 5)`,
  `P + Q = (3, 4)`; the output `(2, 3)` represents `2 · 3⁻¹ = 3`, the `x`-coordinate of `P + Q`.
- Exceptional at `T₀`: with `P = (1, 3)` and `Q = (1, 4) = P + T₀`, `P − Q = T₀` and the output is
  `(0, 0)`. Exceptional at infinity: `P = Q` gives `a = b` and output `(0, 0)`.
- Non-distinguished `2`-torsion over `𝔽₅` with `(A, B) = (0, 1)`: `T = (2, 0)`, `Q` infinity,
  `P − Q = T`; `a = 3`, `b = 1`, output `(16, 8) = (1, 3)`, representing `3⁻¹ = 2`, the
  `x`-coordinate of `T`. A statement making every `2`-torsion difference exceptional is refuted.

### Examples

Modulo `35` with `(A, B, N, D) = (0, 1, 2, 4)`, `double` sends `(22, 1)` to `(21, 25)`. Modulo `5`
this is `(1, 0)`, infinity, as `(2, 0)` has order `2` over `𝔽₅`; modulo `7` it is `(0, 4)`,
representing `T₀ = 2 · (1, 3)` over `𝔽₇`. So `gcd(25, 35) = 5`.

### Dependencies

Layers 1 and 2; Mathlib's group law on `W.toAffine.Point` and `X_eq_iff`.

## Layer 4: scalar multiples and the stage-2 criterion

### 4.1 Ladder relations

Prove, for a native point `P` of `model A B` over a field with `(2 : K) ≠ 0` and `B ≠ 0`, and
nonzero pairs `S_k`, `S_{k+1}`, `S_1` representing the coordinate pairs of `[k]P`, `[k+1]P` and
`P`:

- `double N D S_k` is nonzero and represents the coordinate pair of `[2k]P` (from
  `double_coordinates` and homogeneity);
- if `P` is neither infinity nor `T₀`, then `diffAdd S_{k+1} S_k S_1` is nonzero and represents
  the coordinate pair of `[2k+1]P` (from `diffAdd_coordinates`);
- consequently, for every `k`, any pair obtained from `S_1` by applying these two relations along
  the binary expansion of `k` represents the coordinate pair of `[k]P`
  (Montgomery 1987, §10.3.1, p. 261);
- if `P = T₀`, the multiples alternate between `T₀` and infinity, and the relation for odd
  multiples degenerates to `(0, 0)`; record this case with its own statement.

*Needs:* 3.1, 3.2; Mathlib `nsmul` on `W.toAffine.Point`.

**Checks.**

- Over `𝔽₇` with `(A, B) = (0, 1)` and `P = (3, 3)` of order `8`: the multiples `[1..8]P` have
  `x`-coordinates `3, 1, 5, 0, 5, 1, 3, ∞`, and `diffAdd` of the pairs of `[2]P`, `P`, `P`
  represents `5`.
- `P = T₀` over `𝔽₇`: `diffAdd` of the pairs of `[1]T₀ = T₀`, `[0]T₀ =` infinity and `T₀` is
  `(0, 0)`, while `[1]T₀ + [0]T₀ = T₀`; the odd-step relation needs `P ≠ T₀`.
- Modulo `35`, `diffAdd` of `(21, 25)`, `(22, 1)`, `(22, 1)` is `(1, 8)`, and `gcd(8, 35) = 1`,
  matching `[3](2, 0) = (2, 0)` over `𝔽₅` and `[3](1, 3) = (1, 4)` over `𝔽₇`.

### 4.2 The stage-2 cross-difference criterion

- **`coordinates_cross_eq_zero_iff`.** Over a field with `B ≠ 0`, for a native point `Q` and
  integers `m, n`, the cross difference `X_m Z_n − X_n Z_m` of the coordinate pairs of `[m]Q`
  and `[n]Q` vanishes exactly when `[m − n]Q = 0` or `[m + n]Q = 0`.
- For an even positive integer `w`, every integer `q` can be written as `q = iw + j` or
  `q = iw − j` with integers `i` and `0 ≤ j ≤ w/2`, and `j = 0` only when `w ∣ q`.
- If `[q]Q = 0` and `q = iw ± j`, then the cross difference of the pairs of `[iw]Q` and `[j]Q`
  vanishes. Signs are handled in `ℤ` before scalar multiplication.

*Needs:* 2.2, 2.3; Mathlib `zsmul`, `WeierstrassCurve.Affine.Point.X_eq_iff`.

**Checks.**

- Over `𝔽₇`, `Q = (3, 3)` of order `8`: `(m, n) = (5, 3)` gives `x([5]Q) = x([3]Q) = 5`, cross
  difference `0`, and `[8]Q = 0`. `(m, n) = (3, 1)` gives `x = 5` and `3`, cross difference
  `5 − 3 ≠ 0`, and neither `[2]Q` nor `[4]Q` vanishes.
- `w = 6`: `13 = 2 · 6 + 1` and `17 = 3 · 6 − 1`. A representation demanding `0 < j < w/2`
  strictly would miss `q = 15 = 2 · 6 + 3`.
- `m = n = 0` gives cross difference `1 · 0 − 1 · 0 = 0` and `[0]Q = 0`, consistent with both
  sides.

### Examples

Over `𝔽₇` with `Q = (3, 3)` and `w = 6`: `q = 7 = 6 + 1`, `[7]Q = −Q ≠ 0`; `q = 8 = 6 + 2`,
`[8]Q = 0`, and the pairs of `[6]Q = (1, 3)` and `[2]Q = (1, 4)` have cross difference
`1 · 1 − 1 · 1 = 0`.

### Dependencies

Layer 3 for 4.1; Layer 2 for 4.2.

## Layer 5: Suyama's family

### 5.1 The parametrization

For a parameter `σ` in a field, put `u = σ² − 5`, `v = 4σ`, define `suyamaA σ` as
`(v − u)³ (3u + v) / (4 u³ v) − 2` and `suyamaB σ` as `x³ + A x² + x` at `x = u³/v³`, so that
`(x, 1)` lies on `B y² = x³ + A x² + x` (Zimmermann 2006, §1, p. 3, zimmermann2006 lines 94–102).
*Needs:* 1.1.

- With `σ ≠ 0`, `σ² ≠ 5` and `(2 : K) ≠ 0`: `A + 2 = (v − u)³ (3u + v) / (4 u³ v)` and
  `A − 2 = (v + u)³ (v − 3u) / (4 u³ v)`.
- With the same hypotheses, `B = u (σ² − 1)² (σ² − 25)² (σ⁴ − 25)² / v⁹`.
- The linear factors: `v − u = −(σ − 5)(σ + 1)`, `v + u = (σ + 5)(σ − 1)`,
  `3u + v = (3σ − 5)(σ + 3)`, `v − 3u = −(3σ + 5)(σ − 3)`.
- The scaled doubling constants `N = (v − u)³ (3u + v)` and `D = 16 u³ v` satisfy
  `4N = (A + 2) D`.
- `(u³ : v³)` is the projective `x`-coordinate of the point of the Montgomery curve with `y = 1`.
- **`isElliptic_model_suyama_iff`.** Over a field with `(2 : K) ≠ 0`, for `σ ≠ 0` and
  `σ² ≠ 5`, the model `model (suyamaA σ) (suyamaB σ)` is elliptic exactly when
  `(σ² − 1)(σ² − 9)(σ² − 25)(9σ² − 25)(σ² + 5) ≠ 0`.

**Checks.**

- `σ = 5` over `ℚ`: `u = v = 20`, so `A = −2` and `B = x(x − 1)² = 0` at `x = 1`; the model is
  singular although `4 u³ v = 640000 ≠ 0`. The criterion's factor `σ² − 25` vanishes.
- `σ = 2` over `𝔽₇`: `u = 6`, `v = 1`, the denominator is a unit, but `B = 0` and `A² = 4`; the
  factor `σ² − 25 = 4 − 4` vanishes. Over `𝔽₇` every `σ ≠ 0` is exceptional.
- `σ = 2` over `𝔽₁₁`: `σ² ≠ 25` but `9σ² − 25 = 11 = 0`, and indeed `A² = 4` there while
  `B = 9 ≠ 0`; a criterion omitting `9σ² − 25` is refuted.
- `σ = 6` over `ℚ`: `u = 31`, `v = 24`, and every factor of the criterion is nonzero, so the
  model is elliptic.

### Examples

Characteristic `3`: `9σ² − 25 = −1 ≠ 0` and `σ² − 9 = σ²`, so the criterion reduces to
`σ (σ² − 1)(σ² − 25)(σ² + 5) ≠ 0` together with the standing hypotheses; no small odd
characteristic is excluded.

### Dependencies

Layer 1 only.

## Layer 6: reduction modulo a prime divisor and detection

### 6.1 Reduction

For `p ∣ n`, use `ZMod.castHom` from `ZMod n` to `ZMod p`. Prove that `model`, `double`,
`diffAdd`, and finite products of residues commute with it (through `Pair.map` for pairs), and
that for a natural number `t` the image of `(t : ZMod n)` is `(t : ZMod p)`. No field structure
on `ZMod n` is used; geometric statements are made only over `ZMod p` with `p` prime.
*Needs:* 3.1, 3.2; Mathlib `ZMod.castHom`, `ZMod.val_natCast`.

**Checks.**

- `(22, 1)` over `ZMod 35` maps to `(2, 1)` over `𝔽₅` and `(1, 1)` over `𝔽₇`; doubling commutes:
  `(21, 25) ↦ (1, 0)` and `(0, 4)`.
- Subtraction: `(3 : ZMod 35) − 5 = 33`, mapping to `3 = −2` in `𝔽₅` and `5 = −2` in `𝔽₇`; the
  natural subtraction `3 − 5 = 0` in `ℕ` would map to `0`.
- `ZMod.castHom` needs `p ∣ n` and not primality: `ZMod 35 → ZMod 5` and `ZMod 9 → ZMod 3` exist,
  `ZMod 35 → ZMod 3` does not.

### 6.2 The gcd classification

- For every `n`, a prime `p ∣ n` and `t : ZMod n`: `p ∣ gcd(t.val, n)` exactly when the image of
  `t` in `ZMod p` is `0`.
- `gcd(t, n)` is a proper factor exactly when `1 < gcd(t, n) < n`; a sufficient condition is that
  `t` vanishes modulo one prime divisor of `n` and not modulo another.
- For `n` a prime power the sufficient condition never applies, yet proper gcds occur; reduction
  modulo primes does not see multiplicities.

*Needs:* 6.1; Mathlib `ZMod.natCast_eq_zero_iff`, `Nat.gcd`.

**Checks.**

- `n = 35`, `t = 25`: `t ≡ 0` modulo `5`, `t ≢ 0` modulo `7`, `gcd = 5`.
- `n = 35`, `t = 0`: `gcd = 35 = n`, the inconclusive outcome; `t = 1`: `gcd = 1`.
- `n = 9`, `t = 3`: `gcd = 3` is proper, although `t` and `0` have the same image in `𝔽₃`.

### 6.3 Finite products

For a finite list of residues `t_i` in `ZMod n` and a prime `p ∣ n`, prove that `p` divides
`gcd` of the natural representative of the product with `n` exactly when `p` divides `gcd` of
some `t_i` with `n`, the empty list included (product `1`, never divisible by `p`).
Consequently, if primes `p, q ∣ n` are such that `p` divides `gcd` of some `t_i` with `n` and `q`
divides none of them, the gcd of the product with `n` is a proper factor. A product gcd equal to
`n` can hide proper leaf gcds, and a single zero leaf gives `n` with no proper factor at all.
*Needs:* 6.2; Mathlib `Prime.dvd_prod_iff`.

**Checks.**

- Leaves `[3, 5]` modulo `15`: the product has `gcd = 15`, the leaves have `gcd` `3` and `5`.
- The empty list modulo `15`: product `1`, `gcd = 1`, and `3` divides no leaf.
- Leaves `[1, 5]` modulo `15`: the leaf gcds are `1` and `5`, the product gcd is `5`, and `3`
  divides none of them; `5` divides the leaf gcd `5`, `3` divides no leaf, so the product gcd is
  proper. The single leaf `[0]` modulo `15` gives `gcd = 15` with no proper leaf.

### 6.4 Stage-1 detection

- **`prime_dvd_gcd_of_card_dvd`.** For a prime `p ∣ n`, a native point `P` of `model A B` over
  `ZMod p`, a multiple `m` of `Nat.card` of the native points, and a raw pair `R` over `ZMod n`
  whose reduction modulo `p` represents the coordinate pair of `[m]P`: `p ∣ gcd(Z, n)` for the
  natural representative `Z` of the second field of `R` (Lenstra 1987, §2; Zimmermann 2006,
  §1.1, p. 3).
- The same with `addOrderOf P ∣ m` in place of `Nat.card ∣ m`, and the corollary with
  `WeierstrassCurve.pointCount (model A B) ∣ m` when the model is elliptic.
- For `M(B₁) = (Finset.Icc 1 B₁).lcm id`: `M(B₁)` equals the product over primes `ℓ ≤ B₁` of the
  largest power of `ℓ` at most `B₁`, and `k ∣ M(B₁)` for every `1 ≤ k ≤ B₁`.
- A proper factor follows only with the conditions of 6.2: annihilation modulo every prime
  divisor gives `gcd = n`.

*Needs:* 2.2, 6.1, 6.2; Mathlib `addOrderOf_dvd_natCard`, `addOrderOf_dvd_iff_nsmul_eq_zero`,
`Finset.lcm`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`.

**Checks.**

- `n = 35`, `(A, B) = (0, 1)`, `R = (21, 25)` from Layer 3, `m = 2`, in the `addOrderOf` form:
  over `𝔽₅`, `(2, 0)` has order `2` and `[2](2, 0)` is infinity, so `5 ∣ gcd(25, 35) = 5`; and
  `7 ∤ 5`, since over `𝔽₇` the order of `(1, 3)` is `4 ∤ 2`.
- `m = 4` (the group order over `𝔽₅`): doubling `(21, 25)` again modulo `35` gives `(9, 0)`, and
  `gcd(0, 35) = 35 = n`: both primes are annihilated and the outcome is inconclusive.
- `M(10) = 2520 = 8 · 9 · 5 · 7`; `M(0) = M(1) = 1`. An order `16` has all prime divisors `≤ 10`
  but `16 ∤ 2520`, so prime-divisor smoothness is weaker than the hypothesis used here.

### 6.5 Stage-2 detection

Let `Q = [M]P` over `ZMod p`, `q` a prime with `addOrderOf P ∣ M q`, and `q = iw ± j` as in 4.2.
Prove that if raw pairs over `ZMod n` reduce modulo `p` to representatives of the coordinate
pairs of `[iw]Q` and `[j]Q`, then `p` divides `gcd` of the natural representative of their cross
difference with `n`, and of every finite product of cross differences containing it. When
`Q = 0`, stage 1 already applies. *Needs:* 4.2, 6.3, 6.4.

**Checks.**

- Over `𝔽₇` with `P = (1, 4)` of order `4`, `M = 2` and `q = 2`: the stage-1 hypothesis
  `4 ∣ 2` fails, `Q = [2]P = (0, 0) ≠ 0`, `addOrderOf P = 4 ∣ M q`, and `q = 1 · 2 + 0` with
  `w = 2`; the cross difference of the pairs of `[2]Q` and `[0]Q` (both infinity) is
  `1 · 0 − 1 · 0 = 0`.
- A cross difference that does not vanish modulo `p` (Layer 4 Check `(m, n) = (3, 1)`) gives no
  divisibility by `p`: the converse direction requires `[iw ± j]Q = 0`.
- An empty product of cross differences is `1`, with `gcd = 1`.

### Examples

Modulo `35` with `(A, B, N, D) = (0, 1, 2, 4)` and starting pair `(22, 1)`: `m = 2` gives
`gcd = 5`; `m = 3` gives `gcd = 1`; `m = 4` gives `gcd = 35`. These are the three gcd outcomes
on one curve.

### Dependencies

Layers 2, 3 and 4; Mathlib `ZMod`, `Nat.gcd`, `Prime.dvd_prod_iff`, `addOrderOf`; Tau Ceti
`PointCount`.

## Downstream consumers

Any development of integer factorization by elliptic curves, of `x`-only arithmetic on
Montgomery curves over finite fields, or of Pollard-type `p − 1` methods consumes Layer 6.3
(finite products and gcds), which uses no elliptic-curve hypothesis, and Layers 3–4 (correctness
of `x`-only arithmetic on the native point group).

## References

- [montgomery1987] P. L. Montgomery, *Speeding the Pollard and elliptic curve methods of
  factorization*, Math. Comp. 48 (1987), 243–264,
  [doi:10.1090/S0025-5718-1987-0866113-7](https://doi.org/10.1090/S0025-5718-1987-0866113-7):
  §10.3.1, equation (10.3.1.1), p. 260 (the curve); pp. 260–261 (the relations
  `x(P₁ + P₂) x(P₁ − P₂) (x₁ − x₂)² = (x₁ x₂ − 1)²` and `4 x₁ x₃ (x₁² + A x₁ + 1) = (x₁² − 1)²`);
  p. 261 (the projective addition and duplication displays and the binary ladder).
- [zimmermann2006] P. Zimmermann, *20 years of ECM*, ANTS VII, Lecture Notes in Computer
  Science 4076 (2006); read in the author's submitted version: §1, p. 3 (Suyama's
  parametrization; stage 1 and stage 2 of the method), §1.1, p. 3 (why the method detects `p`).
- [efd] D. J. Bernstein and T. Lange, *Explicit-Formulas Database*, Montgomery curves in `XZ`
  coordinates, <https://www.hyperelliptic.org/EFD/g1p/auto-montgom-xz.html>: entries
  `dbl-1987-m-3` and `dadd-1987-m-3`, both citing Montgomery 1987, p. 261.
- [lenstra1987] H. W. Lenstra Jr., *Factoring integers with elliptic curves*, Ann. of Math. 126
  (1987), 649–673, [doi:10.2307/1971363](https://doi.org/10.2307/1971363): §2 (projective
  arithmetic compatible with reduction modulo prime divisors); cited by locator only.
