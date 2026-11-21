# Roadmap: bounds on codes

**Summary.** This roadmap proves the classical bounds that relate the length, the size and the
minimum distance of a block code, and constructs the codes that attain them. A code is a set of
words of length `n` over a finite alphabet with `q` letters, compared by Hamming distance; a
linear code is a subspace of `F^n` over a field `F`. No decoding procedure, encoder or running
time is a target. Each statement carries the hypotheses it needs for codes with fewer than two
words, for an empty alphabet and for lengths and distances out of range.

The headline theorems are these.

- *The sphere-packing bound and perfect codes.* If any two distinct words of a code `C` are at
  distance more than `2t`, then `|C| · V_q(n, t) ≤ q^n`, where `V_q(n, t)` is the number of words
  within distance `t` of a fixed word; equality holds exactly when every word lies within
  distance `t` of exactly one word of `C`. The `q`-ary Hamming codes attain it with `t = 1`, the
  binary Golay code of length 23 with `t = 3`, and the ternary Golay code of length 11 with
  `t = 2`.
- *The Gilbert–Varshamov bound.* For every radius `r` there is a code whose distinct words are at
  distance more than `r` and with `|C| · V_q(n, r) ≥ q^n`. Over a field with `q` elements, if
  `(q^k − 1) · V_q(n, r) < q^n` there is a linear code of dimension `k` all of whose nonzero words
  have weight more than `r`.
- *The Singleton bound and Reed–Solomon codes.* A code with at least two words and minimum
  distance `d` has at most `q^(n − d + 1)` words, and a linear code of dimension `k` has
  `k + d ≤ n + 1`. Generalized Reed–Solomon codes with distinct evaluation points, nonzero
  multipliers and `1 ≤ k ≤ n` attain it, and the dual of such a code is the generalized
  Reed–Solomon code on the same points of dimension `n − k` with explicit multipliers.
- *Delsarte's linear-programming bound.* For every code and every `k`, the Krawtchouk transform
  `∑_i A_i K_k(i)` of its distance distribution is nonnegative. Consequently, if
  `f = ∑_k f_k K_k` has `f_0 > 0`, `f_k ≥ 0` for `k ≥ 1` and `f(i) ≤ 0` for `d ≤ i ≤ n`, every
  nonempty code with minimum distance at least `d` has `|C| · f_0 ≤ f(0)`.

The roadmap builds on Mathlib's Hamming distance and weight and on Tau Ceti's coding library,
the formalization of the completed roadmap AlgebraicCodingTheory, which supplies linear codes,
minimum distance, puncturing, duals, the Krawtchouk values and the Golay codes. That roadmap
leaves general bounds, Reed–Solomon codes and BCH codes aside; this one supplies them.
MathematicalStatisticsNonparametric has its own binary Gilbert–Varshamov packing for lower
bounds in estimation; the general statement here is independent of it.

Layer 1 below counts Hamming balls and proves the sphere-packing and Gilbert–Varshamov bounds;
Layer 2, which uses it, shows that the Hamming and Golay codes are perfect. Layer 3 proves the
Singleton, Plotkin and Griesmer bounds; Layer 4, which uses it, treats codes attaining the
Singleton bound, generalized Reed–Solomon codes and the BCH bound. Layer 5 proves Delsarte's
inequalities and the linear-programming bound. Layers 1, 3 and 5 use no other layer.

## Conventions

- **Words and codes.** The coordinates form a finite type `ι` with `n = Fintype.card ι` elements
  and the alphabet a finite type `α` with `q = Fintype.card α` elements and decidable equality.
  Words are functions `ι → α`. A code whose size is counted is a `Finset (ι → α)`; a linear code
  is Tau Ceti's `TauCeti.LinearCode F ι`, a `Submodule F (ι → F)`, over a field `F`.
- **Distance and weight.** Distance is Mathlib's `hammingDist`, the number of coordinates where
  two words differ, and weight is `hammingNorm`, the number of nonzero coordinates.
- **Minimum distance.** The minimum distance of a set of words is Tau Ceti's
  `Set.hammingMinDist`: the least distance between two distinct words, and `0` when the set has
  at most one word. Statements about codes that need not be linear express a separation by a
  condition on all pairs of distinct words (for instance `2t < hammingDist x y` for `x ≠ y`), so
  that they hold for codes with fewer than two words without appeal to that convention; the
  statements that use `Set.hammingMinDist` say what happens for such codes.
- **Ball volumes.** `V_q(n, t)` is `hammingBallVolume q n t`, the sum over `i ≤ t` of
  `(n choose i)(q − 1)^i`, with natural-number subtraction in `q − 1`.
- **Natural numbers.** Lengths, distances, dimensions and radii are natural numbers.
  Natural-number subtraction occurs in `q − 1` and `q^k − 1`, which are exact for `q ≥ 1`; in
  `n − d + 1` in 3.1, where `d ≤ n`; and in `n − k` in 4.3, where `n − k = 0` for `k ≥ n` is the
  intended value. The Plotkin bound is stated in the real numbers.
- **Krawtchouk values.** `K_k(i)` is Tau Ceti's `TauCeti.krawtchouk q n k i`, the integer
  `∑_a (−1)^a (q − 1)^(k − a) (i choose a)((n − i) choose (k − a))`, the coefficient of `Z^k` in
  `(1 + (q − 1)Z)^(n − i) (1 − Z)^i` for `i ≤ n`. Here `q − 1` is computed in the integers, so it
  is `−1` for an empty alphabet. The first index is the degree and the second the point of
  evaluation.
- **Fields.** Over a field `F`, `q` is `Nat.card F`, which is `0` for an infinite field. The
  Gilbert–Varshamov bound 1.4 and the Hamming codes of 2.1 assume `[Finite F]`. The Griesmer
  bound 3.3 needs no such assumption: for an infinite field its terms with `i ≥ 1` are `0` and,
  for `k ≥ 1`, it reduces to `d ≤ n`. The Singleton bound for linear codes, the characterization of MDS codes,
  their duals, generalized Reed–Solomon codes and the BCH bound hold over any field.

## Layer 1: balls, the sphere-packing bound and the Gilbert–Varshamov bound

### 1.1 Hamming balls

Define `hammingBallVolume q n t` as `∑_{i ≤ t} (n choose i)(q − 1)^i`. Prove `card_hammingBall`:
for every word `x : ι → α` and every `t`, the number of words `y` with `hammingDist x y ≤ t` is
`hammingBallVolume q n t` (Guruswami–Rudra–Sudan, proof of Theorem 1.7.2, equation (1.18),
p. 21, for `q ≥ 2`; Definition 3.3.2, p. 62).

- The words at distance exactly `i` from `x` are chosen by a set of `i` coordinates and, at each
  of them, one of the `q − 1` other letters.
- For `q ≥ 1` and `t ≥ n` the volume is `q^n`, by the binomial theorem. For `q = 0` and `n ≥ 1`
  it is `1` while `q^n = 0`.

**Checks.**
- `V_2(7, 1) = 8`, `V_2(23, 3) = 1 + 23 + 253 + 1771 = 2048` and `V_3(11, 2) = 1 + 22 + 220 = 243`.
- `V_3(2, 5) = 1 + 4 + 4 = 9 = 3^2`: radii beyond the length count every word.
- For `q = 1` the volume is `1` for every `n` and `t`: the only word is the centre.
- With an empty alphabet and `n ≥ 1` there is no word to serve as a centre and the statement is
  vacuous; the formula would give `1` there, so it is not a count of words without a centre.

*Needs:* Mathlib `hammingDist`, `Fintype.card_pi`, `Finset.card_powersetCard`.

### 1.2 The sphere-packing bound and perfect codes

Define `IsPerfect C t` for a set `C` of words: every word lies within distance `t` of exactly one
word of `C`. Let `C` be a code whose distinct words are at distance more than `2t`.

- `card_mul_hammingBallVolume_le`: `|C| · V_q(n, t) ≤ q^n` (Guruswami–Rudra–Sudan, Theorem 1.7.2,
  p. 21, stated there for `|C| = q^k`).
- `card_mul_hammingBallVolume_eq_iff`: equality holds if and only if `IsPerfect C t`
  (Guruswami–Rudra–Sudan, Definition 1.7.3, p. 22, where a perfect code is defined as one meeting
  the bound).
- A perfect code of radius `t` has its distinct words at distance more than `2t`: two words at
  distance at most `2t` have a common word within distance `t` of both.

Route: the balls of radius `t` about the words of `C` are pairwise disjoint by the triangle
inequality, each has `V_q(n, t)` elements by 1.1, and their union lies in the set of all words;
equality of the counts says that the union is everything.

**Checks.**
- The binary repetition code `{000, 111}` is perfect of radius `1`: `2 · 4 = 8`. The binary
  repetition code of length `5` is perfect of radius `2`: `2 · 16 = 32`. The binary repetition
  code of length `4` is not perfect for `t = 1` (`2 · 5 = 10 < 16`) and does not satisfy the
  separation for `t = 2`.
- The whole word space is perfect of radius `0`.
- The separation is needed: the four binary words of length `2` with `t = 1` give
  `4 · 3 = 12 > 4`.
- With an empty alphabet and `n ≥ 1` the only code is empty, both sides of the equality are `0`,
  and the empty code is perfect because there are no words.

*Needs:* 1.1; Mathlib `hammingDist_triangle`, `hammingDist_comm`, `Finset.card_biUnion`. (Proved
here.)

### 1.3 The Gilbert–Varshamov bound

Prove `exists_card_mul_hammingBallVolume_ge`: for every `r` there is a code `C` whose distinct
words are at distance more than `r` and with `q^n ≤ |C| · V_q(n, r)` (Guruswami–Rudra–Sudan,
Lemma 4.2.2, p. 77, with `d = r + 1`; its proof in §4.2.1, pp. 75–77). The statement assumes
nothing about `q`, `n` or `r`.

Route: a code of greatest size among those with the separation exists, since there are finitely
many codes. No word is at distance more than `r` from all its words, since it could be added; so
the balls of radius `r` about its words cover all `q^n` words, and 1.1 counts them.

**Checks.**
- For `q = 2`, `n = 7`, `r = 2`: `V_2(7, 2) = 29` and `4 · 29 = 116 < 128`, so the bound gives a
  binary code of length `7` with minimum distance at least `3` and at least `5` words. The
  Hamming code of 2.1 has `16`.
- For `q ≥ 1` and `r ≥ n` the volume is `q^n`, the bound asks for one word, and any one-word code
  serves. For an empty alphabet and `n ≥ 1` the bound reads `0 ≤ |C|` and the empty code serves.
- For `r = 0` the volume is `1` and the only code with `q^n` words is the whole space.

*Needs:* 1.1; Mathlib `Finset.exists_max_image`. (Proved here, following the cited proof.)

### 1.4 The Gilbert–Varshamov bound for linear codes

Prove `exists_linearCode_finrank_eq`: let `F` be a finite field with `q` elements. If
`(q^k − 1) · V_q(n, r) < q^n`, there is a linear code `C` of dimension `k` all of whose nonzero
words have weight more than `r` (Guruswami–Rudra–Sudan, proof of Theorem 4.2.1 in §4.2.2,
pp. 77–78, where the union bound runs over the `q^k − 1` nonzero messages). Theorem 4.2.1 there
states the asymptotic form; this is the finite inequality its proof establishes.

Route: count the pairs `(G, m)` of a `k × n` matrix and a nonzero `m ∈ F^k` with
`hammingNorm (m ᵥ* G) ≤ r`. For fixed `m ≠ 0`, the map `G ↦ m ᵥ* G` is onto `F^n` with fibres
of equal size `q^((k − 1) n)`, so there are `(q^k − 1) q^((k − 1) n) V_q(n, r)` such pairs, fewer
than the `q^(kn)` matrices. A matrix in no such pair has `m ᵥ* G ≠ 0` for `m ≠ 0`, so its rows
are independent and its row space has dimension `k`.

**Checks.**
- For `q = 2`, `n = 7`, `r = 2`: `3 · 29 = 87 < 128` gives a binary `[7, 2]` code with minimum
  distance at least `3`, while `7 · 29 = 203 ≥ 128` gives nothing for `k = 3`.
- For `k = 0` the hypothesis `0 < q^n` always holds and the zero code serves.
- For `k > n` the hypothesis fails, since `q^k − 1 ≥ q^n` for `q ≥ 2`.
- Finiteness of the field is needed: for an infinite field `Nat.card F = 0`, and with `n = 0` and
  `k = 1` the hypothesis reads `0 < 1` while no subspace of `F^0` has dimension `1`.

*Needs:* 1.1; Mathlib `Matrix.vecMulLinear`, `Matrix.vecMul`, `LinearMap.finrank_range_of_inj`.
(Proved here, following the cited proof.)

### Examples

The binary repetition codes of lengths `3`, `4` and `5` against the sphere-packing bound; the
binary codes of length `7` that the two Gilbert–Varshamov bounds guarantee.

### Dependencies

Mathlib `hammingDist`, `hammingDist_triangle`, `hammingDist_comm`, `Fintype.card_pi`,
`Finset.card_powersetCard`, `Finset.card_biUnion`, `Finset.exists_max_image`,
`Matrix.vecMulLinear`, `Matrix.vecMul`, `LinearMap.finrank_range_of_inj`; Tau Ceti
`TauCeti.LinearCode`. No other layer.

## Layer 2: perfect codes

### 2.1 Hamming codes

Let `F` be a finite field with `q` elements and `r` a natural number. Define `HammingPoint F r`
as the type of vectors `v : Fin r → F` with a first nonzero entry equal to `1`: there is `i` with
`v i = 1` and `v j = 0` for `j < i`. These are one nonzero vector on each line through the origin
of `F^r`; they form a finite type, made a coordinate type through `Fintype.ofFinite`. Define
`hammingCode F r`, a linear code with coordinates `HammingPoint F r`, as the code
checked by the matrix whose columns are the points, through Tau Ceti's `Matrix.checkedBy`: its
words are the `x` with `∑_p x p • p = 0` (Guruswami–Rudra–Sudan, Definition 2.4.1, p. 40, for
`q = 2`, where the columns are all nonzero vectors; Exercise 2.21, p. 49, for general `q`).

- `card_hammingPoint`: there are `1 + q + ⋯ + q^(r − 1)` points, that is `(q^r − 1)/(q − 1)`.
- `finrank_hammingCode_add`: the dimension plus `r` is the length.
- `hammingMinDist_hammingCode`: for `r ≥ 2` the minimum distance is `3` (Guruswami–Rudra–Sudan,
  Proposition 2.4.2, p. 40, for `q = 2`; Exercise 2.21, p. 49). Exercise 2.21 is posed for
  `r ≥ 1`; for `r = 1` the code is the zero code of length `1`, which has no two distinct words
  and minimum distance `0` under the convention here, so the statement assumes `r ≥ 2`.
- `isPerfect_hammingCode`: the Hamming code is perfect of radius `1`, for every `r`
  (Guruswami–Rudra–Sudan, p. 40, for `q = 2`).

Route: the unit vectors are points, so the checking matrix has rank `r` when `r ≥ 1`. A word of
weight `1` or `2` in the code would make a point zero or two points proportional, and two distinct
points are never proportional, because both have first nonzero entry `1`; for `r ≥ 2` the points
`e₁`, `e₂` and `e₁ + e₂` carry a word of weight `3`. Perfection follows from 1.2: the code has
`q^(n − r)` words, `V_q(n, 1) = 1 + n(q − 1) = q^r`, and distinct words are at distance at least
`3` (vacuously when `r ≤ 1`, where the code has one word).

**Checks.**
- `q = 2`, `r = 3`: seven points and the `[7, 4, 3]` code; `16 · 8 = 128`.
- `q = 3`, `r = 2`: the points are `(1, 0)`, `(1, 1)`, `(1, 2)` and `(0, 1)`, and the code is a
  `[4, 2, 3]` code, the parameters of Tau Ceti's tetracode (`TauCeti.tetracode`,
  `TauCeti.hammingMinDist_tetracode`); `9 · 9 = 81`.
- A plausible wrong definition takes all nonzero vectors as columns. For `q = 3`, `r = 2` the
  columns `v` and `2v` then carry the word with `1` at both, since `v + 2v = 0`, and the minimum
  distance drops to `2`.
- `r = 1`: one point, the code is zero, its minimum distance is `0` by convention, and it is
  perfect of radius `1` because every word of length `1` is within distance `1` of `0`. `r = 0`:
  no points, and the code is the single word of length `0`.

*Needs:* 1.1, 1.2; Mathlib `Fintype.ofFinite`, `Matrix.mulVec`, `Matrix.rank`,
`Module.natCard_eq_pow_finrank`; Tau Ceti `Matrix.checkedBy`, `Set.hammingMinDist`,
`Set.le_hammingMinDist_iff_hammingNorm`.
(Proved here.)

### 2.2 The binary Golay code of length 23

Prove `isPerfect_punctureAt_binaryGolay`: for every coordinate `i` of the extended binary Golay
code `TauCeti.BinaryGolay.code`, the code `TauCeti.punctureAt TauCeti.BinaryGolay.code i`
obtained by deleting `i` is perfect of radius `3`. Golay found the code; Guruswami–Rudra–Sudan
list it among the perfect binary codes (p. 40).

Route: Tau Ceti proves that the punctured code has `4096` words
(`TauCeti.BinaryGolay.natCard_punctureAt_code`) and minimum distance `7`
(`TauCeti.BinaryGolay.hammingMinDist_punctureAt_code`). So distinct words are at distance more
than `6`, and `4096 · V_2(23, 3) = 2^12 · 2^11 = 2^23`; 1.2 gives perfection.

**Checks.**
- `V_2(23, 3) = 2048 = 2^11`.
- The extended code of length `24` is not perfect of radius `3`: it has minimum distance `8`, and
  `4096 · V_2(24, 3) = 4096 · 2325 < 2^24`.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.BinaryGolay.code`, `TauCeti.punctureAt`,
`TauCeti.BinaryGolay.natCard_punctureAt_code`, `TauCeti.BinaryGolay.hammingMinDist_punctureAt_code`.
(Proved here.)

### 2.3 The ternary Golay code of length 11

Prove, for every coordinate `i` of the extended ternary Golay code `TauCeti.TernaryGolay.code`:

- `hammingMinDist_punctureAt_ternaryGolay`: deleting `i` gives minimum distance `5`;
- `isPerfect_punctureAt_ternaryGolay`: the punctured code is perfect of radius `2`.

The code is Golay's (attributed in prose, without a locator).

Route: the extended code has minimum distance `6` (`TauCeti.TernaryGolay.hammingMinDist_code`)
and dimension `6` (`TauCeti.TernaryGolay.finrank_code`). Every coordinate is nonzero in some word
of weight `6`, so `TauCeti.hammingMinDist_punctureAt_add_one_eq` gives distance `5`, and
`TauCeti.finrank_punctureAt_eq` keeps the dimension `6`. Then `729 · V_3(11, 2) = 3^6 · 3^5 = 3^11`
and 1.2 applies.

**Checks.**
- `V_3(11, 2) = 243 = 3^5`.
- The weights of the extended code are `0`, `6`, `9` and `12`.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.TernaryGolay.code`, `TauCeti.TernaryGolay.hammingMinDist_code`,
`TauCeti.TernaryGolay.finrank_code`, `TauCeti.punctureAt`,
`TauCeti.hammingMinDist_punctureAt_add_one_eq`,
`TauCeti.finrank_punctureAt_eq`, `Module.natCard_eq_pow_finrank`. (Proved here.)

### Examples

The binary `[7, 4, 3]` and ternary `[4, 2, 3]` Hamming codes; the Golay codes of lengths `23`
and `11` with the arithmetic of their perfection.

### Dependencies

Layer 1 (1.1, 1.2). Mathlib `Fintype.ofFinite`, `Matrix.mulVec`, `Matrix.rank`,
`Module.natCard_eq_pow_finrank`;
Tau Ceti `Matrix.checkedBy`, `Set.hammingMinDist`, `Set.le_hammingMinDist_iff_hammingNorm`,
`TauCeti.punctureAt`, `TauCeti.hammingMinDist_punctureAt_add_one_eq`,
`TauCeti.finrank_punctureAt_eq`, `TauCeti.BinaryGolay.code`,
`TauCeti.BinaryGolay.natCard_punctureAt_code`, `TauCeti.BinaryGolay.hammingMinDist_punctureAt_code`,
`TauCeti.TernaryGolay.code`, `TauCeti.TernaryGolay.hammingMinDist_code`,
`TauCeti.TernaryGolay.finrank_code`.

## Layer 3: the Singleton, Plotkin and Griesmer bounds

### 3.1 The Singleton bound

- `card_le_pow_of_nontrivial`: a code `C` with at least two words and minimum distance `d` has
  `|C| ≤ q^(n − d + 1)` (Guruswami–Rudra–Sudan, Theorem 4.3.1, p. 79).
- `finrank_add_hammingMinDist_le`: a linear code of dimension `k` over any field has
  `k + d ≤ n + 1`. The zero code satisfies it with `0 + 0`.

Route: `d ≤ n` by `Set.hammingMinDist_le_card`. Deleting `d − 1` coordinates is injective on `C`,
since two words agreeing on the rest would be at distance at most `d − 1`. For a nonzero linear
code over any field the same holds for the linear restriction of `C` to `n − d + 1` retained
coordinates: a nonzero word in its kernel would have weight at most `d − 1`. An injective linear
map into `F^(n − d + 1)` gives `k ≤ n − d + 1`; the zero code has `k = d = 0`.

**Checks.**
- For `n ≥ 2` the binary repetition code `[n, 1, n]` and the even-weight code `[n, n − 1, 2]`
  attain both forms; for `n = 1` the even-weight code is the zero code, with `0 + 0 < 2`.
- The two-word hypothesis is needed for degenerate alphabets: with `n = 0` and an empty alphabet
  the single word forms a code with minimum distance `0` by convention, and `1 > 0^1 = 0`.
- The binary Hamming code `[7, 4, 3]` has `4 + 3 = 7 < 8`.

*Needs:* Mathlib `hammingDist`, `Fintype.card_pi`, `LinearMap.finrank_le_finrank_of_injective`,
`Module.finrank_fintype_fun_eq_card`; Tau Ceti `Set.hammingMinDist`, `Set.hammingMinDist_le_card`,
`Set.exists_hammingDist_eq_hammingMinDist`, `Set.le_hammingMinDist_iff_hammingNorm`.

### 3.2 The Plotkin bound

Prove `card_le_plotkin`: if distinct words of `C` are at distance at least `d` and
`(q − 1) n < q d` (that is, `d > (1 − 1/q) n` when `q ≥ 1`), then
`|C| ≤ q d / (q d − (q − 1) n)`, in the real numbers (Guruswami–Rudra–Sudan, Theorem 4.4.1,
part 2, p. 81; the counting proof is Exercise 4.17, p. 92).

Route: sum the distance over ordered pairs of distinct words. Each pair contributes at least `d`,
so the sum is at least `|C|(|C| − 1) d`. A coordinate in which letter `a` occurs `m_a` times
contributes `|C|^2 − ∑_a m_a^2 ≤ (1 − 1/q)|C|^2` by Cauchy–Schwarz, so the sum is at most
`(1 − 1/q) n |C|^2`. Compare and divide by `|C|`. For an empty alphabet the hypothesis forces
`n ≥ 1`, so `C` is empty.

**Checks.**
- Binary, `n = 3`, `d = 2`: the bound is `4/(4 − 3) = 4`, attained by the even-weight code.
- Ternary, `n = 3`, `d = 3`: the bound is `9/(9 − 6) = 3`, attained by `{000, 111, 222}`.
- The strict inequality is needed: binary, `n = 4`, `d = 2` has `(q − 1) n = q d = 4`, the
  even-weight code has `8` words, and the right-hand side has denominator `0`.
- For `q = 1` the hypothesis is `0 < d` and the bound is `1`, the number of words.

*Needs:* Mathlib `hammingDist`, `Finset.sum_mul_sq_le_sq_mul_sq`. (Proved here.)

### 3.3 The Griesmer bound

Prove `sum_ceil_div_pow_le`: a linear code of dimension `k` and minimum distance `d` over a
field with `q` elements has `∑_{i < k} ⌈d / q^i⌉ ≤ n` (Guruswami–Rudra–Sudan,
Exercise 4.18, p. 92).

Route: for an infinite field the statement is `d ≤ n`, which is `Set.hammingMinDist_le_card`. For
a finite field argue by induction on `k`. For `k ≥ 1` take a word `c` of weight `d`. Deleting the
coordinates of its support gives the residual code of length `n − d` and dimension `k − 1`: a
word of `C`
vanishing off the support of `c` is a multiple of `c`, since otherwise `x − λc`, with `λ` chosen to
cancel one coordinate of the support, would be a nonzero word of weight below `d`. Its minimum
distance is at least `⌈d/q⌉`: for a word `x` of `C` that is not a multiple of `c`, some `λ` makes
`x − λc` vanish on at least `d/q` coordinates of the support, by the pigeonhole principle over the
`q` values of `λ`; as `x − λc` is nonzero it has weight at least `d`, so `x` has at least `d/q`
nonzero coordinates off the support. Apply the induction hypothesis to the residual code and use
`⌈⌈d/q⌉/q^i⌉ = ⌈d/q^(i + 1)⌉`.

**Checks.**
- The binary Hamming code `[7, 4, 3]`: `3 + 2 + 1 + 1 = 7`, attained. The binary simplex code
  `[7, 3, 4]`: `4 + 2 + 1 = 7`, attained.
- The binary Golay codes: `[23, 12, 7]` gives `22 ≤ 23` and `[24, 12, 8]` gives `23 ≤ 24`.
- For `k = 0` the sum is empty. For `k ≥ 1` every term is at least `1` and the first is `d`, so
  the bound implies `k + d − 1 ≤ n`, the Singleton bound for linear codes over finite fields.

*Needs:* Mathlib `Nat.ceil`; Tau Ceti `Set.exists_hammingNorm_eq_hammingMinDist`,
`Set.hammingMinDist_le_card`, `TauCeti.puncture`, `Set.hammingMinDist`. (Proved here, following the
hint of the cited exercise.)

### Examples

The binary and ternary repetition and even-weight codes against the Singleton and Plotkin bounds;
the Hamming, simplex and Golay codes against the Griesmer bound.

### Dependencies

Mathlib `hammingDist`, `Fintype.card_pi`, `LinearMap.finrank_le_finrank_of_injective`,
`Module.finrank_fintype_fun_eq_card`, `Nat.ceil`, `Finset.sum_mul_sq_le_sq_mul_sq`; Tau Ceti
`Set.hammingMinDist`, `Set.hammingMinDist_le_card`, `Set.exists_hammingDist_eq_hammingMinDist`,
`Set.exists_hammingNorm_eq_hammingMinDist`, `Set.le_hammingMinDist_iff_hammingNorm`,
`TauCeti.puncture`. No other layer.

## Layer 4: MDS codes, Reed–Solomon codes and the BCH bound

### 4.1 Maximum distance separable codes

Define `IsMDS C` for a linear code `C` over a field: `k + d = n + 1`, with `k` its dimension and
`d` its minimum distance (Guruswami–Rudra–Sudan, Definition 5.3.1, p. 101). The zero code has
`d = 0` by convention and is not MDS.

- `isMDS_iff_forall_isInformationSet`: a linear code of dimension `k ≥ 1` is MDS if and only if
  every set of `k` coordinates is an information set in Tau Ceti's sense
  (`TauCeti.IsInformationSet`: restriction to those coordinates is a bijection from the code onto
  `F^k`) (Guruswami–Rudra–Sudan, Proposition 5.3.3, p. 101, for the direction from MDS).
- `IsMDS.euclideanDual`: the Euclidean dual of an MDS code of dimension `k < n` is MDS. The
  theorem is in MacWilliams and Sloane's book; it is attributed here in prose.

Route: a set of `k` coordinates fails to be an information set exactly when a nonzero word
vanishes on it, that is when some nonzero word has weight at most `n − k`; with 3.1 this is the
first statement. For the dual, which has dimension `n − k` by
`Submodule.finrank_add_finrank_euclideanDual`: if a nonzero word `y` of the dual had weight at
most `k`, extend its support to a set `S` of `k` coordinates; `S` is an information set of `C`,
so some word of `C` equals `1` at one coordinate of the support of `y` and `0` at the rest of `S`,
and its dot product with `y` is nonzero.

**Checks.**
- The whole space `F^n` with `n ≥ 1` is MDS (`n + 1 = n + 1`) and its dual, the zero code, is not:
  the hypothesis `k < n` is needed.
- For `k = 0` the code is zero and the empty set is an information set of it, but the code is not
  MDS: the hypothesis `k ≥ 1` is needed.
- For `n ≥ 2` the binary repetition code `[n, 1, n]` is MDS and its dual is the even-weight code
  `[n, n − 1, 2]`, also MDS.

*Needs:* 3.1; Tau Ceti `TauCeti.IsInformationSet`,
`TauCeti.IsInformationSet.ncard_eq_finrank`,
`TauCeti.isInformationSet_iff_puncture_eq_top_and_shorten_compl_eq_bot`,
`Submodule.euclideanDual`, `Submodule.mem_euclideanDual`,
`Submodule.finrank_add_finrank_euclideanDual`. (Proved here.)

### 4.2 Generalized Reed–Solomon codes

For a field `F`, evaluation points `a : ι → F`, multipliers `v : ι → F` and `k : ℕ`, define
`grsCode a v k` as the image of the polynomials of degree less than `k` (Mathlib's
`Polynomial.degreeLT F k`) under `p ↦ (v i * p(a i))_i`, built from `Polynomial.leval`. The
Reed–Solomon code is the case `v = 1` (Guruswami–Rudra–Sudan, Definition 5.2.1, pp. 98–99;
Exercise 5.10, p. 104, for general `v`). Assume `a` injective and every `v i` nonzero.

- `finrank_grsCode`: for `k ≤ n` the code has dimension `k`.
- `isMDS_grsCode`: for `1 ≤ k ≤ n` the code is MDS, that is, has minimum distance `n − k + 1`
  (Guruswami–Rudra–Sudan, Theorem 5.2.4, p. 100, for `v = 1`; Exercise 5.10, part 1, p. 104).

Route: a nonzero polynomial of degree less than `k` has fewer than `k` roots among the distinct
points (`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`), so the evaluation is injective
for `k ≤ n` and every nonzero word has weight at least `n − k + 1`; 3.1 gives equality.

**Checks.**
- Over `𝔽₃` with points `(0, 1, 2)` and `k = 2` the code has nine words and minimum distance `2`
  (Guruswami–Rudra–Sudan list its words on p. 99).
- Repeated points break it: with points `(0, 0, 1)` and `k = 2`, the polynomial `X` gives the
  word `(0, 0, 1)`, of weight `1 < 2`.
- A zero multiplier breaks it: with `v = (1, 1, 0)` and `k = 1` every word has the form
  `(c, c, 0)`, of weight `2 < 3`.
- For `k > n` the code is the whole space, of dimension `n`; for `k = 0` it is zero.

*Needs:* 3.1; Mathlib `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `Polynomial.leval`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`, `LinearMap.finrank_range_of_inj`.
(Proved here.)

### 4.3 The dual of a generalized Reed–Solomon code

Prove `euclideanDual_grsCode`: with `a` injective and every `v i` nonzero, for every `k`, the
Euclidean dual of `grsCode a v k` is `grsCode a u (n − k)`, where
`u i = (v i ∏_{j ≠ i} (a i − a j))⁻¹` (Guruswami–Rudra–Sudan, Exercise 5.10, part 2,
pp. 104–105).

Route: for `p` of degree less than `k` and `r` of degree less than `n − k`, the product `p r` has
degree less than `n − 1`, so its coefficient of `X^(n − 1)` vanishes. By Lagrange interpolation
that coefficient is `∑_i p(a i) r(a i) / ∏_{j ≠ i} (a i − a j)`, which is the dot product of the
two words. So `grsCode a u (n − k)` lies in the dual; the dimensions agree by 4.2 and
`Submodule.finrank_add_finrank_euclideanDual` when `k ≤ n`. For `k ≥ n` the code is the whole
space, the dual is zero, and `n − k = 0`.

**Checks.**
- Over `𝔽₅` with the five elements as points, `∏_{j ≠ i} (a i − a j) = −1` for every `i`, so
  `u = −1/v`; with `v = 1` the dual of the Reed–Solomon code with parameter `k` is the
  Reed–Solomon code with parameter `5 − k` (Guruswami–Rudra–Sudan, Exercise 5.8, p. 104).
- `k = 0`: the dual of the zero code is the whole space, `grsCode a u n`.

*Needs:* 4.2; Mathlib `Lagrange.interpolate`, `Lagrange.eq_interpolate_of_eval_eq`,
`Polynomial.degreeLT`; Tau Ceti `Submodule.euclideanDual`, `Submodule.mem_euclideanDual`,
`Submodule.finrank_add_finrank_euclideanDual`. (Proved here.)

### 4.4 The BCH bound

Prove `le_hammingNorm_of_isPrimitiveRoot`: let `β` be a primitive `n`-th root of unity in a field
`K`, `b` and `δ` natural numbers, and `c : Fin n → K` a nonzero word with
`∑_i c i β^(i (b + j)) = 0` for `j = 0, 1, …, δ − 2`. Then `c` has weight at least `δ`. The
bound is due to Bose and Ray-Chaudhuri and to Hocquenghem; it is attributed here in prose. For
`b = 1` and `β` a generator of the multiplicative group of a finite field, it is the distance of
the Reed–Solomon code in the form of Guruswami–Rudra–Sudan, Exercises 5.9 and 5.11, part 1,
pp. 104–105.

Route: `c ≠ 0` forces `n ≥ 1`, so `β ≠ 0` and the word `x i = c i β^(i b)` has the weight of
`c`. The hypothesis says that `x` is orthogonal to the words `(β^(i j))_i` for `j < δ − 1`, which
span the Reed–Solomon code with points `β^i` and parameter `δ − 1`; the points are distinct because
`β` is primitive (`IsPrimitiveRoot.injOn_pow`). So `x` lies in the dual of that code, which by 4.3
is a generalized Reed–Solomon code with parameter `n − δ + 1`. By 4.2 that code has minimum
distance `δ` when `2 ≤ δ ≤ n`, and it is zero when `δ > n`, which contradicts `x ≠ 0`. For
`δ ≤ 1` the claim is `c ≠ 0`.

**Checks.**
- In `𝔽₈` with `β` a root of `X^3 + X + 1`, the binary words of length `7` with `c(β) = 0` also
  have `c(β^2) = 0`, by the Frobenius map; the bound with `b = 1`, `δ = 3` gives weight at least
  `3`. These `16` words form the binary Hamming code of 2.1 with `r = 3`, its coordinates
  ordered by the powers of `β`, since `β^0, …, β^6` are the seven nonzero vectors of `𝔽₈` over
  `𝔽₂`.
- Primitivity is needed: for `β = 1` and `n = 3` over `𝔽₇`, the word `(1, 6, 0)` satisfies every
  equation and has weight `2`, below `δ = 3`.

*Needs:* 4.2, 4.3; Mathlib `IsPrimitiveRoot`, `IsPrimitiveRoot.injOn_pow`, `hammingNorm`.
(Proved here.)

### Examples

The repetition and even-weight codes as a dual pair of MDS codes; Reed–Solomon codes over `𝔽₃`
and `𝔽₅`; the binary Hamming code of length `7` as a code with consecutive roots.

### Dependencies

Layer 3 (3.1). Mathlib `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `Polynomial.leval`,
`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`, `LinearMap.finrank_range_of_inj`,
`Lagrange.interpolate`, `Lagrange.eq_interpolate_of_eval_eq`,
`IsPrimitiveRoot`, `IsPrimitiveRoot.injOn_pow`, `hammingNorm`; Tau Ceti `TauCeti.IsInformationSet`,
`TauCeti.IsInformationSet.ncard_eq_finrank`,
`TauCeti.isInformationSet_iff_puncture_eq_top_and_shorten_compl_eq_bot`,
`Submodule.euclideanDual`, `Submodule.mem_euclideanDual`,
`Submodule.finrank_add_finrank_euclideanDual`.

## Layer 5: Delsarte's linear-programming bound

### 5.1 Distance distributions and Delsarte's inequalities

Define `distanceDistribution C i`, the number of ordered pairs of words of `C`, equal or not, at
distance `i`. Divided by `|C|` it is the distance distribution `A_i` of the literature, with
`A_0 = 1`; the inequalities below are invariant under that positive factor.

Prove `sum_distanceDistribution_mul_krawtchouk_nonneg`: for every code `C` and every `k`,
`∑_{i ≤ n} distanceDistribution C i · K_k(i) ≥ 0` (Guruswami–Rudra–Sudan, §8.2, constraint (8.4)
and its verification on p. 165, for `q = 2`). For general `q` the inequalities are Delsarte's,
attributed here in prose.

Route: for an empty alphabet the code is empty or `n = 0`, and the claim is direct. Otherwise
identify the alphabet with `ZMod q` and take the additive character
`AddChar.primitiveZModChar`. For a word `x` of weight `i`, the sum of `ψ(x ⬝ᵥ z)` over the words
`z` of weight `k` is `K_k(i)`, by the product over the coordinates. Hence the left side is
`∑_{wt z = k} |∑_{x ∈ C} ψ(x ⬝ᵥ z)|²`, a sum of squares of absolute values.

**Checks.**
- For `k = 0` the sum is `|C|^2`.
- For the binary Hamming code `[7, 4, 3]` the values of `distanceDistribution` are
  `(16, 0, 0, 112, 112, 0, 0, 16)` and the transforms for `k = 0, …, 7` are
  `(256, 0, 0, 0, 1792, 0, 0, 0)`, that is `|C|^2` times the weight distribution of its dual, the
  simplex code. For linear codes this is the MacWilliams identity in Tau Ceti's Krawtchouk form,
  `TauCeti.natCard_mul_weightDistribution_euclideanDual`, since the distance distribution is
  `|C|` times the weight distribution `Set.weightDistribution`.
- The order of the indices matters. For the binary code `{00, 01}` the values are `(2, 2, 0)`;
  at `k = 2` the sum is `2 · 1 + 2 · (−1) = 0`, while with the Krawtchouk indices exchanged it
  would be `2 · 1 + 2 · (−2) = −2`.

*Needs:* Mathlib `AddChar.primitiveZModChar`, `Fintype.equivFin`; Tau Ceti `TauCeti.krawtchouk`.
(Proved here.)

### 5.2 The linear-programming bound

Prove `card_mul_le_of_krawtchouk`: let `C` be a nonempty code whose distinct words are at
distance at least `d`, and `f : ℕ → ℝ` with `f 0 > 0` and `f k ≥ 0` for `1 ≤ k ≤ n`. Write
`f(i) = ∑_{k ≤ n} f k · K_k(i)`. If `f(i) ≤ 0` for `d ≤ i ≤ n`, then `|C| · f 0 ≤ f(0)`
(Guruswami–Rudra–Sudan, §8.2.1, inequalities (8.8)–(8.10) and the polynomial (8.11), pp. 165–166,
for `q = 2` with `f 0 = 1`).

Route: multiply the inequality of 5.1 for each `k ≥ 1` by `f k` and add `f 0` times the case
`k = 0`, which is `|C|^2`. The result is `∑_i distanceDistribution C i · f(i) ≥ f 0 · |C|^2`.
On the left, `i = 0` contributes `|C| · f(0)`, the values `1 ≤ i < d` do not occur, and the values
`i ≥ d` contribute at most `0`. Divide by `|C| > 0`.

**Checks.**
- Binary, `2d > n`, `f = K_0 + K_1/(2d − n)`: `K_1(i) = n − 2i`, so `f(i) = (2d − 2i)/(2d − n) ≤ 0`
  for `i ≥ d` and `f(0) = 2d/(2d − n)`. The bound is the binary case of the Plotkin bound 3.2.
- Nonemptiness is needed: over an empty alphabet with `n = 1`, take `f 0 = 1`, `f 1 = 2`. Then
  `K_0 = 1` and `K_1(0) = K_1(1) = −1`, so `f(1) = −1 ≤ 0` but `f(0) = −1`, and the empty code
  would give `0 ≤ −1`. This is the only case where it matters: for `q ≥ 1` every
  `K_k(0) = (n choose k)(q − 1)^k` is nonnegative, so `f(0) ≥ f 0 > 0`.
- For `d > n` there is no condition on `f`, the code has at most one word, and the bound reads
  `f 0 ≤ f(0) = f 0 + ∑_{k ≥ 1} f k (n choose k)(q − 1)^k`.

*Needs:* 5.1; Tau Ceti `TauCeti.krawtchouk`. (Proved here.)

### Examples

The binary Hamming code of length `7` with its distance distribution and its Krawtchouk
transform; the Plotkin bound as the linear-programming bound with a polynomial of degree one.

### Dependencies

Mathlib `AddChar.primitiveZModChar`, `Fintype.equivFin`; Tau Ceti `TauCeti.krawtchouk`. No
other layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the volume of Hamming balls, perfect
codes, the sphere-packing bound and both Gilbert–Varshamov bounds; the Hamming codes and the
perfection of the Golay codes of lengths 23 and 11, with the minimum distance of the second; the
Singleton, Plotkin and Griesmer bounds; MDS codes, generalized Reed–Solomon codes with their
duals, and the BCH bound; distance distributions, Delsarte's inequalities and the
linear-programming bound.

Already in the libraries and therefore not targets:

- Hamming distance and weight with their metric properties and the Hamming space
  (`Mathlib/InformationTheory/Hamming.lean`).
- From Tau Ceti's coding library (`TauCeti/InformationTheory/Coding/`), the formalization of the
  completed roadmap AlgebraicCodingTheory: linear codes, the minimum distance of a set of words
  with its attainment and its characterization by weights, puncturing and shortening with their
  effect on minimum distance and dimension, information sets, the Euclidean dual with its
  dimension, weight distributions, the MacWilliams identity and the Krawtchouk values, the
  tetracode, the extended binary Golay code with its punctured `[23, 12, 7]` codes, and the
  extended ternary Golay code `[12, 6, 6]`. 2.2 and 2.3 add only perfection and, for the ternary
  code, the minimum distance after puncturing.

Left to other roadmaps:

- MathematicalStatisticsNonparametric owns, in its 2.3, the binary Varshamov–Gilbert packing in
  Tsybakov's form: a family of more than `2^(m/8)` binary words of length `m ≥ 8` at pairwise
  distance at least `m/8`, with the ball estimated through Hoeffding's inequality. It is not
  restated here. 1.3 is the exact finite bound for every alphabet, length and radius, without an
  estimate of the ball; that packing is its binary case at radius `⌊m/8⌋` combined with that
  estimate. MathematicalStatisticsHighDimensional owns the sparse packing of its own scope.
- BanachSpaceTheory uses binary Krawtchouk values of length `2n` as Walsh layer sums for its own
  estimates; no statement here is about them.

Outside the scope: decoding, list decoding and every algorithm; asymptotic rate–distance bounds
(the asymptotic Hamming, Elias–Bassalygo, Johnson and McEliece–Rodemich–Rumsey–Welch bounds); the
classification of perfect codes by Tietäväinen and van Lint; the MDS conjecture; cyclic codes as
ideals and the dimension of BCH codes; Reed–Muller, algebraic-geometry and concatenated codes;
the optimal values of Delsarte's linear program for particular parameters.

## Exact supplier contracts

### From Mathlib

- `Mathlib/InformationTheory/Hamming.lean`: `hammingDist` (the number of coordinates where two
  words differ), `hammingNorm` (the number of nonzero coordinates), `hammingDist_comm`,
  `hammingDist_triangle`.
- `Mathlib/Data/Fintype/BigOperators.lean`: `Fintype.card_pi` (the number of functions is the
  product of the numbers of values). `Mathlib/Data/Finset/Powerset.lean`:
  `Finset.card_powersetCard` (a finite set `s` has `(|s| choose k)` subsets with `k` elements).
  `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.card_biUnion` (for pairwise
  disjoint pieces the cardinality of the union is the sum). `Mathlib/Data/Finset/Max.lean`:
  `Finset.exists_max_image` (a function on a nonempty finite set attains a greatest value).
  `Mathlib/Data/Fintype/EquivFin.lean`: `Fintype.equivFin` and `Fintype.ofFinite` (a noncomputable
  `Fintype` structure on a finite type).
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums). `Mathlib/Algebra/Order/Floor/Defs.lean`: `Nat.ceil`.
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMul`, `Matrix.mulVec`.
  `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.vecMulLinear`.
  `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank`.
  `Mathlib/LinearAlgebra/Dimension/Finrank.lean`: `LinearMap.finrank_range_of_inj` (an injective
  linear map preserves dimension).
  `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean`:
  `LinearMap.finrank_le_finrank_of_injective` (an injective linear map into a finite-dimensional
  space does not raise dimension). `Mathlib/LinearAlgebra/Dimension/Constructions.lean`:
  `Module.finrank_fintype_fun_eq_card` (`ι → F` has dimension `#ι`).
  `Mathlib/FieldTheory/Finiteness.lean`:
  `Module.natCard_eq_pow_finrank` (a space of dimension `k` over a finite field with `q` elements
  has `q^k` elements).
- `Mathlib/RingTheory/Polynomial/Basic.lean`: `Polynomial.degreeLT` (the polynomials of degree
  less than `k`) and `Polynomial.degreeLTEquiv` (its coefficient isomorphism with `Fin k → R`).
  `Mathlib/Algebra/Polynomial/Eval/SMul.lean`: `Polynomial.leval` (evaluation at a point as a
  linear map). `Mathlib/Algebra/Polynomial/Roots.lean`:
  `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero` (over a domain, a polynomial vanishing
  at more distinct points than its degree is zero). `Mathlib/LinearAlgebra/Lagrange.lean`:
  `Lagrange.interpolate` and `Lagrange.eq_interpolate_of_eval_eq` (a polynomial of degree less
  than the number of nodes is its own interpolant).
- `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`: `IsPrimitiveRoot` and
  `IsPrimitiveRoot.injOn_pow` (the powers `β^i` with `i < n` are distinct).
- `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`: `AddChar.primitiveZModChar` (a
  primitive additive character of `ZMod q` with values in a cyclotomic field).

### From Tau Ceti

- `TauCeti/InformationTheory/Coding/Basic.lean`: `TauCeti.LinearCode F ι`, an abbreviation of
  `Submodule F (ι → F)`.
- `TauCeti/InformationTheory/Coding/MinimumDistance/Basic.lean`: `Set.hammingMinDist` (the least
  distance between distinct words, `0` for at most one word); `Set.hammingMinDist_le_card`
  (`d ≤ n`); `Set.exists_hammingDist_eq_hammingMinDist` (a set with two distinct words attains
  its minimum distance); `Set.exists_hammingNorm_eq_hammingMinDist` (a nonzero additive code
  attains it at a nonzero word); `Set.le_hammingMinDist_iff_hammingNorm` (for a nonzero additive
  code, `d' ≤ d` if and only if every nonzero word has weight at least `d'`).
- `TauCeti/InformationTheory/Coding/Puncture/Basic.lean`: `TauCeti.puncture` and
  `TauCeti.punctureAt` (restriction to a set of retained coordinates, and deletion of one).
  `TauCeti/InformationTheory/Coding/MinimumDistance/Operations.lean`:
  `TauCeti.finrank_punctureAt_eq` (for `d ≥ 2`,
  deleting a coordinate keeps the dimension); `TauCeti.hammingMinDist_punctureAt_add_one_eq` (for
  `d ≥ 2` and a word of weight `d` nonzero at `i`, deleting `i` lowers `d` by exactly one).
- `TauCeti/InformationTheory/Coding/InformationSet.lean`: `TauCeti.IsInformationSet`,
  `TauCeti.IsInformationSet.ncard_eq_finrank` (a finite information set has as many coordinates as
  the dimension), `TauCeti.isInformationSet_iff_puncture_eq_top_and_shorten_compl_eq_bot`.
- `TauCeti/InformationTheory/Coding/EuclideanDual.lean`: `Submodule.euclideanDual`,
  `Submodule.mem_euclideanDual` (orthogonality to every word for the dot product),
  `Submodule.finrank_add_finrank_euclideanDual` (over a field, the dimensions of a code and its
  dual add up to `n`).
- `TauCeti/InformationTheory/Coding/Matrix.lean`: `Matrix.checkedBy` (the kernel of `x ↦ H *ᵥ x`).
- `TauCeti/InformationTheory/Coding/Krawtchouk.lean`: `TauCeti.krawtchouk` (the convention above)
  and `TauCeti.natCard_mul_weightDistribution_euclideanDual` (the MacWilliams identity in
  Krawtchouk form, used in a Check of 5.1).
  `TauCeti/InformationTheory/Coding/Weight/Enumerator.lean`: `Set.weightDistribution`.
- `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean` and `Punctured.lean`:
  `TauCeti.BinaryGolay.code` (the extended binary Golay code on `Fin 24`),
  `TauCeti.BinaryGolay.natCard_punctureAt_code` (`4096` words after deleting a coordinate),
  `TauCeti.BinaryGolay.hammingMinDist_punctureAt_code` (minimum distance `7` after deleting a
  coordinate).
- `TauCeti/InformationTheory/Coding/TernaryGolay.lean`: `TauCeti.TernaryGolay.code` (the extended
  ternary Golay code on `Fin 12`), `TauCeti.TernaryGolay.finrank_code` (dimension `6`),
  `TauCeti.TernaryGolay.hammingMinDist_code` (minimum distance `6`).
- `TauCeti/InformationTheory/Coding/Tetracode.lean`: `TauCeti.tetracode` and
  `TauCeti.hammingMinDist_tetracode`, named in a Check of 2.1 only.

## References

- Venkatesan Guruswami, Atri Rudra and Madhu Sudan, *Essential Coding Theory*, draft of the book,
  version of August 2025 (566 pages), available from the authors' pages at the University at
  Buffalo; the theorem, exercise and page numbers above are those of that version.
- Attributions made in prose without a locator: Marcel J. E. Golay (the Golay codes, 1949);
  Richard W. Hamming (the Hamming codes and the sphere-packing bound, 1950); Edgar N. Gilbert
  (1952) and Rom R. Varshamov (1957) for the two Gilbert–Varshamov bounds; Richard C. Singleton
  (1964); Morris Plotkin (1960); James H. Griesmer (1960); Irving S. Reed and Gustave Solomon
  (1960); R. C. Bose and D. K. Ray-Chaudhuri (1960) and Alexis Hocquenghem (1959) for the BCH
  bound; Philippe Delsarte (the inequalities for every alphabet and the linear-programming bound,
  1972 and 1973); F. Jessie MacWilliams and Neil J. A. Sloane, *The Theory of Error-Correcting
  Codes* (1977), for the duality of MDS codes.
