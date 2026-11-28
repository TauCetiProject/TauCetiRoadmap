# Roadmap: Sidon sets and linear equations

**Summary.** A Sidon set is a set of integers, or of elements of an abelian group, whose pairwise
sums are all different: `a + b = c + d` inside the set happens only when `{a, b} = {c, d}`. The
basic question, asked by Sidon in the 1930s, is how large a Sidon subset of `{1, …, N}` can be.
Counting differences shows that it has roughly at most `√N` elements, and constructions from
finite fields show that this is the right order. This roadmap proves both halves with explicit
constants, and then treats two neighbouring questions of the same kind: sets without solutions of
`x + y = z`, and sets without nontrivial solutions of a single linear equation.

The main theorems are these.

- *The Erdős–Turán–Lindström bound.* A Sidon set contained in `{1, …, N}` has fewer than
  `√N + N^(1/4) + 1` elements.
- *Singer's theorem.* For every finite field with `q` elements, the residues modulo `q² + q + 1`
  contain a set of `q + 1` elements such that every nonzero residue is the difference of exactly
  one ordered pair of its elements. Together with the prime number theorem and the bound above,
  it shows that the largest Sidon subset of `{1, …, N}` has asymptotically `√N` elements; for
  every `N` it has at least `√N / 2`.
- *Sum-free sets.* Every set of `n ≥ 1` nonzero integers has a subset of at least `(n + 1)/3`
  elements in which `x + y = z` has no solution, `x = y` allowed. Every finite abelian group with
  at least two elements has such a subset of at least `2|G|/7` elements, with equality for the
  cyclic group of order `7`.
- *One linear equation.* If `k ≥ 2` and the integers `a₁, …, a_k` are nonzero, a subset `A` of
  `{1, …, N}` in which `a₁x₁ + ⋯ + a_kx_k = a₁y₁ + ⋯ + a_ky_k` has no solution in `2k` distinct
  elements satisfies `|A|² ≤ C(2k, 2) (|a₁| + ⋯ + |a_k|) N`. On the other side, Behrend's sphere
  construction gives, for positive `aᵢ` with sum `b`, subsets of `{0, …, N − 1}` of at least
  `N exp(−3 √(2 log 2b) √(log N))` elements in which every solution of `a₁x₁ + ⋯ + a_kx_k = b y`
  has all variables equal.

The roadmap builds on Mathlib's additive energy, its digit map and sphere count from Behrend's
construction, its finite fields, and its theorems of Bertrand and Dirichlet on primes. From Tau
Ceti it uses the prime number theorem for the asymptotic size of the largest Sidon set.
FourierAnalyticAdditiveCombinatorics treats three-term progressions in finite groups and is not
used; RamseyNumbers proves Schur's theorem on `x + y = z` for colourings, which is not
restated.

Layer 1 defines Sidon sets and proves the upper bounds. Layer 2 builds the sets of Erdős and
Turán, of Bose and of Singer and concludes the asymptotic size. Layer 3 treats sum-free sets and
Layer 4 a single linear equation; neither uses the other layers.

## Conventions

- **Sets.** Sets are finite (`Finset`). `[a, b]` is the set of integers from `a` to `b`,
  `{1, …, N}` is `Finset.Icc 1 N` and `{0, …, N − 1}` is `Finset.range N`. `|A|` is the number
  of elements.
- **Sidon sets.** `A` is a Sidon set when `a + b = c + d` with `a, b, c, d ∈ A` forces
  `(a, b) = (c, d)` or `(a, b) = (d, c)`. This is the strong form: in a group with an element of
  order two it also forbids `a + a = b + b` with `a ≠ b`, so in `(ℤ/2)ⁿ` only sets of at most one
  element are Sidon. O'Bryant's survey defines a Sidon set by asking that every element have at
  most two ordered representations `a + b`; the two definitions agree in groups without elements
  of order two (in particular in `ℤ` and in `ℤ/m` for odd `m`), and `{0, 1} ⊆ ℤ/2` satisfies
  the survey's condition but not ours.
- **Sum-free sets.** `A` is sum-free when `x + y ∉ A` for all `x, y ∈ A`; `x = y` is allowed, so
  `0` lies in no nonempty sum-free set of a group.
- **Linear equations.** Coefficients are integers. Which solutions are called trivial is fixed in
  each statement of Layer 4: in 4.1 a solution is excluded only when its `2k` values are pairwise
  distinct, in 4.2 every solution must have all its variables equal, and in 4.3 no solution at all
  is allowed.
- **Finite fields.** `k` is a finite field with `q` elements and `L` a field containing `k`
  (an algebra over `k`). An element `θ ∈ L` of multiplicative order `q² − 1` (or `q³ − 1`)
  generates the multiplicative group of the subfield `k(θ)`, which then has `q²` (or `q³`)
  elements: `0` and the powers of `θ` are `q²` (or `q³`) roots of `X^(q²) − X` (or
  `X^(q³) − X`), hence all of its roots in `L`, and these roots form a subfield containing the
  image of `k`. So no degree hypothesis on `L` is needed. Residues modulo `m` are `ZMod m`, and the
  exponent `a` of `θ^a` is sent to its residue.
- **Numbers.** Counts are natural numbers; bounds with square roots, real powers and logarithms
  are in `ℝ`, where `√N = N^(1/2)` and `Real.log 0 = 0`.

## Layer 1: Sidon sets and the upper bounds

### 1.1 Sidon sets and their differences

Define `IsSidon` on finite subsets of a type with an addition, as in the Conventions.
Prove `isSidon_iff_sub`: in an abelian group, `A` is a Sidon set if and only if for all
`a, b, c, d ∈ A` with `a ≠ b`, `a − b = c − d` forces `a = c` and `b = d` (O'Bryant, §2,
Definition 1 and the paragraph after it, p. 3, for subsets of `ℤ` and the counting form of the
definition).

Route: if `a − b = c − d`, then `a + d = c + b`, so `(a, d) = (c, b)` or `a = b`. Conversely, if
`a + b = c + d`, then `a − c = d − b`, and either `a = c` (so `b = d`) or `a = d` and `c = b`.
Both directions hold in every abelian group, elements of order two included.

**Checks.**
- `∅` and every one-point set are Sidon sets; `{1, 2, 5, 7} ⊆ ℤ` is one (its six positive
  differences `1, 4, 6, 3, 5, 2` are distinct), and `{1, 2, 3}` is not (`1 + 3 = 2 + 2`).
- In `ℤ/2`, `{0, 1}` is not a Sidon set: `0 + 0 = 1 + 1`; in the difference form,
  `0 − 1 = 1 − 0`. The counting definition of the survey accepts it (Conventions), so the two
  definitions differ here.
- In `(ℤ/2)²` every two-point set fails in the same way, while in `ℤ/7` the set `{0, 1, 3}` is a
  Sidon set: its six differences `±1, ±2, ±3` are the six nonzero residues.

*Needs:* nothing. (Proved here.)

### 1.2 The energy identity

Prove `isSidon_iff_addEnergy`: in a commutative additive monoid with decidable equality, `A` is a
Sidon set if and only if `E(A, A) + |A| = 2|A|²`, where `E(A, A)` is Mathlib's additive energy,
the number of quadruples `(a₁, a₂, b₁, b₂) ∈ A⁴` with `a₁ + b₁ = a₂ + b₂`.

Route: the quadruples with `(a₂, b₂) = (a₁, b₁)` or `(a₂, b₂) = (b₁, a₁)` are always counted, by
commutativity, and there are `2|A|² − |A|` of them (the two kinds overlap when `a₁ = b₁`). `A`
is a Sidon set exactly when there are no others.

**Checks.**
- `A = ∅`: `0 + 0 = 0`; a one-point set: `1 + 1 = 2`.
- `{1, 2, 5, 7}`: the energy is `28 = 2 · 16 − 4`. `{1, 2, 3}`: the energy is `19`, above
  `2 · 9 − 3 = 15`.
- `{0, 1} ⊆ ℤ/2`: the energy is `8`, above `6`, matching 1.1.

*Needs:* Mathlib `Finset.addEnergy`. (Proved here.)

### 1.3 The counting bound in a finite abelian group

Prove `card_mul_card_sub_one_le`: a Sidon set `A` in a finite abelian group `G` satisfies
`|A| (|A| − 1) ≤ |G| − 1`.

Route: by 1.1, the `|A| (|A| − 1)` ordered pairs of distinct elements of `A` have distinct
differences, and these are nonzero.

**Checks.**
- Equality holds for `{0, 1, 3} ⊆ ℤ/7`, and in general for Singer's sets (2.3), which have
  `q + 1` elements in a group of `q² + q + 1` elements.
- In `(ℤ/2)²` the bound allows two elements, but the largest Sidon sets have one (1.1): the bound
  is not attained there.
- In the trivial group the bound reads `0 ≤ 0` for the one-point set.

*Needs:* 1.1. (Proved here.)

### 1.4 The Erdős–Turán–Lindström bound

Prove `card_lt_sqrt_add_rpow_add_one`: a Sidon set `A ⊆ {1, …, N}` of natural numbers has
`|A| < √N + N^(1/4) + 1` (O'Bryant, Theorem 5 and the first part of its proof, pp. 10–11, which
gives this inequality and attributes the argument to Erdős and Turán, simplified by Lindström;
the source ends with "calculus", and the choice of `u` and the last estimate are made here).

Route: list `A` as `a₁ < ⋯ < a_r`. For `N = 0` the set is empty. Otherwise let `u = ⌈N^(1/4)⌉`,
so `u ≥ 1`. If `r ≤ u`, then `r < N^(1/4) + 1`. If `r > u`, the differences `a_(i+j) − a_i` with
`1 ≤ j ≤ u` and `1 ≤ i ≤ r − j` are `D = ru − u(u + 1)/2` distinct positive integers by 1.1, so
their sum is at least `D(D + 1)/2`. For fixed `j` the differences add up to the sum of the `j`
largest elements minus the sum of the `j` smallest, at most `j(N − 1)`; so the total is at most
`(N − 1) u (u + 1)/2`. Hence `D² < D(D + 1) ≤ (N − 1) u (u + 1) < N (u + 1/2)²`, which gives
`r < √N + √N/(2u) + (u + 1)/2`. Now `√N/(2u) ≤ N^(1/4)/2` because `u ≥ N^(1/4)`, and
`(u + 1)/2 < N^(1/4)/2 + 1` because `u < N^(1/4) + 1`.

**Checks.**
- The largest Sidon subsets of `{1, …, N}` have `4, 5, 6, 7, 8, 9` elements for
  `N = 7, 12, 18, 26, 35, 45` (exhaustive search; for instance `{1, 2, 5, 7}`), against the
  bounds `5.27, 6.33, 7.30, 8.36, 9.35, 10.30`.
- For `N = 0` the bound is `0 < 1`; for `N = 1` it is `1 < 3`.
- For every `N ≤ 200000` and every `r > ⌈N^(1/4)⌉`, the inequality `D(D + 1) ≤ (N − 1)u(u + 1)`
  of the route forces `r < √N + N^(1/4) + 1` (checked by computer); the last step has room.
- Counting the positive differences alone gives `|A| (|A| − 1) ≤ 2(N − 1)` for `N ≥ 1`, which
  allows about `√(2N)` elements: the bound above is sharper by the factor `√2`.

*Needs:* 1.1; Mathlib `Real.sqrt`, `Real.rpow`. (Proved here, following the cited proof.)

### Examples

`{1, 2, 5, 7}` and `{1, 2, 3}` in `ℤ`; `{0, 1}` in `ℤ/2`; `{0, 1, 3}` in `ℤ/7`; the largest Sidon
subsets of `{1, …, N}` for small `N`.

### Dependencies

Mathlib `Finset.addEnergy`, `Real.sqrt`, `Real.rpow`. No other layer.

## Layer 2: constructions and the size of the largest Sidon set

### 2.1 The Erdős–Turán set

Define `erdosTuranSet`, with `erdosTuranSet p = {2pk + (k² mod p) : 0 ≤ k < p}`. Prove
`erdosTuranSet_spec`: for a prime `p` it is a Sidon set of `p` natural numbers, all less than
`2p²` (O'Bryant, §3.5, pp. 7–8, and the annotation of Erdős–Turán 1941, p. 18, with
`1 ≤ k < p`; including `k = 0` adds the element `0`).

Route: write `rₖ = k² mod p`, so `0 ≤ rₖ < p`. If two sums of elements agree, comparing quotients
and remainders on division by `2p` gives `k₁ + k₂ = k₃ + k₄` and `r₁ + r₂ = r₃ + r₄`, so
`k₁² + k₂² ≡ k₃² + k₄²` modulo `p`. For odd `p`, dividing by `2` gives `k₁k₂ ≡ k₃k₄`, so
`(X − k₁)(X − k₂) = (X − k₃)(X − k₄)` over `ℤ/p`; evaluating at `k₃` and cancelling shows
`{k₁, k₂} = {k₃, k₄}` modulo `p`, hence as integers in `[0, p)`. For `p = 2` the set is `{0, 5}`.
The elements are distinct because their quotients by `2p` are, and the largest is at most
`2p(p − 1) + p − 1 < 2p²`.

**Checks.**
- `p = 5`: the set is `{0, 11, 24, 34, 41}`, a Sidon set (checked by hand and by computer).
- Primality is needed: for `p = 4` the formula gives `{0, 9, 16, 25}` and `0 + 25 = 9 + 16`; for
  `p = 9` the set is not a Sidon set either (checked by computer).
- For every prime `p < 60` the set is a Sidon set of `p` elements below `2p²` (checked by
  computer).

*Needs:* Mathlib `ZMod p` as a field for prime `p`. (Proved here, following the cited
construction.)

### 2.2 Bose's sets

Define `boseSet`: for `θ ∈ L`, the residues modulo `q² − 1` of the exponents `0 ≤ a < q² − 1`
with `θ^a − θ ∈ k`. Prove `boseSet_spec`: if `θ` has multiplicative order `q² − 1`, then
`boseSet k θ` has `q` elements and is a Sidon set in `ℤ/(q² − 1)` (O'Bryant, annotation of Bose
1942, p. 18; §3.3, pp. 5–6, for the same set with representatives in `[1, q² − 1]`), and every
residue whose representative in `[0, q² − 1)` is not divisible by `q + 1` is the difference of
exactly one ordered pair of its elements.

Route: `F = {0} ∪ {θ^a}` is the subfield `k(θ)` with `q²` elements (Conventions), and `θ ∉ k`
because nonzero elements of `k` have order dividing `q − 1`. So `1, θ` is a basis of `F` over `k`,
every `θ + c` with `c ∈ k` is a nonzero element of `F`, hence a unique power `θ^a` with
`0 ≤ a < q² − 1`: the set has `q` elements. If `a + b ≡ c + d` modulo `q² − 1` for exponents with
`θ^a = θ + α` and so on, then `(θ + α)(θ + β) = (θ + γ)(θ + δ)`; the difference of the two
polynomials `(X + α)(X + β)` and `(X + γ)(X + δ)` has degree at most one and vanishes at
`θ ∉ k`, so it is zero, and evaluating at `−γ` gives `{α, β} = {γ, δ}`. For the last claim:
`θ^g ∈ k` exactly when `q + 1` divides `g`, since `kˣ` is the subgroup of order `q − 1`; and
`(θ + α)/(θ + β) ∈ k` forces `α = β`. So the `q (q − 1)` differences of distinct elements avoid
the multiples of `q + 1`; they are distinct by 1.1, and there are exactly `q² − q` residues not
divisible by `q + 1`.

**Checks.**
- `q = 2`, `θ` a root of `X² + X + 1`: the set is `{1, 2}` modulo `3`.
- `q = 3`, `θ` a root of `X² + X − 1` (of order `8`): the set is `{1, 6, 7}` modulo `8`. Its
  differences of distinct elements are `1, 2, 3, 5, 6, 7`, each once, and `4` is not one.
- The order hypothesis is needed: for `θ = 1` every exponent qualifies and the set is all of
  `ℤ/(q² − 1)`, which for `q = 2` is `{0, 1, 2}`, not a Sidon set (`0 + 2 = 1 + 1`).
- For `q = 2, 3, 4, 5, 7, 8, 9` and one generator `θ` each, the three conclusions hold
  (checked by computer, including `q² − 1` even, where the strong form of 1.1 matters).

*Needs:* 1.1; Mathlib `orderOf_dvd_iff_pow_eq_one`, `FiniteField.pow_card_sub_one_eq_one`,
`ZMod.val`. (Proved here, following the cited construction.)

### 2.3 Singer's perfect difference sets

Define `singerSet`: for `θ ∈ L`, the residue `0` together with the residues modulo
`q² + q + 1` of the exponents `0 ≤ a < q³ − 1` with `θ^a − θ ∈ k`. Prove `singerSet_spec`: if
`θ` has multiplicative order `q³ − 1`, then `singerSet k θ` has `q + 1` elements and every
nonzero residue modulo `q² + q + 1` is the difference of exactly one ordered pair of its
elements; in particular it is a Sidon set, by 1.1 (O'Bryant, annotation of Singer 1938, p. 17,
for the set and the inequality it witnesses; §3.4, pp. 6–7, for its `B_h` form). Prove
`exists_perfect_difference_set`: for every finite field with `q` elements there is such a set
of `q + 1` residues modulo `q² + q + 1` (Singer's theorem).

Route: `F = k(θ)` has `q³` elements and `1, θ, θ²` is a basis of it over `k`: a nonzero
polynomial of degree at most two vanishing at `θ` would put `θ` in a field of at most `q²`
elements (`IntermediateField.adjoin.finrank`, `minpoly.dvd`), where its order divides `q² − 1`.
Put `m = q² + q + 1 = (q³ − 1)/(q − 1)`; then `θ^a ∈ k` exactly when `m` divides `a`, so the
residue of `a` modulo `m` is the point of the projective plane `(F ∖ 0)/kˣ` spanned by `θ^a`.
The `q + 1` elements `1, θ + c` (`c ∈ k`) are pairwise non-proportional, so their exponents
have `q + 1` distinct residues: these are the points of the line spanned by `1` and `θ`. Let
`x + y ≡ z + w` modulo `m` with `x, y, z, w` in the set, and let `uₓ, u_y, u_z, u_w` be the
corresponding elements among `1, θ + c`. Then `uₓ u_y = λ u_z u_w` for some `λ ∈ kˣ`. Both
products are values at `θ` of polynomials of degree at most two, each a product of two factors
equal to `1` or to `X + c`; by the independence of `1, θ, θ²` the polynomial identity holds in
`k[X]`, and unique factorization there gives `{x, y} = {z, w}`. The `q (q + 1)`
differences of distinct elements are therefore distinct and nonzero, and `q (q + 1) = m − 1`.
For the existence statement take `L = FiniteField.Extension k p 3` with `p` the characteristic
of `k`, which has `q³` elements, and a generator of its cyclic multiplicative group.

**Checks.**
- `q = 2`, `θ` a root of `X³ + X + 1`: `θ³ = θ + 1`, and the set is `{0, 1, 3}` modulo `7`,
  whose seven translates are the lines of the Fano plane.
- `q = 3`, `θ` a root of `X³ − X + 1` (of order `26`): the set is `{0, 1, 3, 9}` modulo `13`.
- The order hypothesis is needed: for `θ = 1` every exponent qualifies and the set is all of
  `ℤ/(q² + q + 1)`, which has `7` elements for `q = 2`, not `3`.
- Equality holds in 1.3 for every such set. For `q = 2, 3, 4, 5, 7, 8, 9` and one generator
  each, the set has `q + 1` elements and is a perfect difference set (checked by computer).

*Needs:* 1.1; Mathlib `orderOf_dvd_iff_pow_eq_one`, `FiniteField.pow_card_sub_one_eq_one`,
`IntermediateField.adjoin.finrank`, `minpoly.dvd`, `FiniteField.Extension`,
`FiniteField.natCard_extension`, `IsCyclic.exists_generator`,
`orderOf_eq_card_of_forall_mem_zpowers`, the cyclicity of the units of a finite field. (Proved
here, following the cited construction.)

### 2.4 The size of the largest Sidon set

Prove `exists_isSidon_sqrt_div_two_le`: for every `N`, `{1, …, N}` contains a Sidon set of at
least `√N / 2` elements. Define `sidonNumber N`, the largest number of elements of a Sidon subset
of `{1, …, N}`, and prove `sidonNumber_isEquivalent`: `sidonNumber N` is asymptotic to `√N` as
`N → ∞` (O'Bryant, Theorem 5 and its proof, pp. 10–11, where the lower half uses Ruzsa's
construction and the fact that consecutive primes have ratio tending to `1`; the annotations of
Chowla 1944 and Erdős 1944, p. 18, note that Singer's sets with the upper bound give the same
asymptotic; the explicit bound and the route below are derived here).

Route: a Sidon set of residues modulo `m`, taken through its representatives in `[0, m)` and
shifted by `1`, is a Sidon set of integers in `{1, …, m}`, since `a + b = c + d` in `ℤ` implies
it modulo `m`. For the explicit bound: for `N ≤ 8` the sets `∅`, `{1}`, `{1, 2}` suffice. For
`N ≥ 9` let `s = ⌊√N⌋ ≥ 3` and `n = ⌊(s − 1)/2⌋ ≥ 1`; Bertrand's postulate gives a prime `q`
with `n < q ≤ 2n ≤ s − 1`, so `q² + q + 1 ≤ s² − s + 1 ≤ N`, and 2.3 for `ℤ/q` gives `q + 1`
elements, while `q ≥ n + 1 ≥ s/2` gives `q + 1 > √N/2`. For the asymptotic: 1.4 gives
`sidonNumber N < √N + N^(1/4) + 1`. Given `ε > 0`, the prime number theorem (Tau Ceti's count
of primes in residue classes, modulo `1`, with the primes of `𝓞 ℚ` matched to the rational
primes through `Rat.ringOfIntegersEquiv`) gives, for all large `N`, a prime `q` with
`(1 − ε)(√N − 1) < q ≤ √N − 1`; then `q² + q + 1 ≤ N` and 2.3 gives
`sidonNumber N ≥ q + 1 > (1 − ε)√N`.

**Checks.**
- `sidonNumber N` for `N = 0, …, 12` is `0, 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5` (exhaustive
  search), at least `√N/2` throughout.
- For every `N` from `9` to `10⁶` the prime of the route exists and satisfies both inequalities
  (checked by computer).
- For `N = 10⁴, 10⁶, 10⁸, 10¹⁰`, Singer's sets for the largest prime `q` with
  `q² + q + 1 ≤ N` give `(q + 1)/√N = 0.98, 0.998, 0.9974, 0.99992`.

*Needs:* 1.4, 2.3; Mathlib `Nat.exists_prime_lt_and_le_two_mul`, `Rat.ringOfIntegersEquiv`,
`Asymptotics.IsEquivalent`; Tau Ceti `NumberField.Chebotarev.tendsto_primeCount_primesCongruent`,
`TauCeti.primeCount`. (Proved here.)

### Examples

The Erdős–Turán set for `p = 5`; Bose's sets `{1, 2}` modulo `3` and `{1, 6, 7}` modulo `8`;
Singer's sets `{0, 1, 3}` modulo `7` and `{0, 1, 3, 9}` modulo `13`; `sidonNumber` for small `N`.

### Dependencies

Layer 1 (1.1, 1.4). Mathlib `ZMod`, `orderOf_dvd_iff_pow_eq_one`,
`FiniteField.pow_card_sub_one_eq_one`, `IntermediateField.adjoin.finrank`, `minpoly.dvd`,
`FiniteField.Extension`, `FiniteField.natCard_extension`, `IsCyclic.exists_generator`,
`orderOf_eq_card_of_forall_mem_zpowers`, `Nat.exists_prime_lt_and_le_two_mul`,
`Rat.ringOfIntegersEquiv`, `Asymptotics.IsEquivalent`. Tau Ceti
`NumberField.Chebotarev.tendsto_primeCount_primesCongruent`.

## Layer 3: sum-free sets

### 3.1 Sum-free sets

Define `IsSumFree`, as in the Conventions (Green–Ruzsa, §1, p. 1).

**Checks.**
- `{1}` is sum-free in `ℤ` (`1 + 1 = 2`), `{1, 2}` is not (`1 + 1 = 2`), and the odd integers in
  any range are.
- `{0}` is not sum-free: `0 + 0 = 0`. The variant that forbids only `x + y = z` with `x ≠ y`
  (Eberhard–Green–Manners, p. 2, after Theorem 1.1) would accept `{1, 2}`.

*Needs:* nothing. (Proved here.)

### 3.2 Erdős's theorem

Prove `exists_isSumFree_card_add_one_le`: a nonempty set `A` of `n` nonzero integers has a
sum-free subset `B` with `3|B| ≥ n + 1`, that is `|B| > n/3` (Eberhard–Green–Manners, §1, p. 1,
for Erdős's argument with `|B| ≥ n/3` and the refinement to `(n + 1)/3` attributed to Alon and
Kleitman).

Route: the source averages over a uniform point of the circle; this route stays finite. By
Dirichlet's theorem take a prime `p = 3j + 2` larger than every `|a|`, `a ∈ A`. The middle third
`M = {j + 1, …, 2j + 1}` of `ℤ/p` is sum-free (its sums lie in `{2j + 2, …, 4j + 2}`, which
modulo `p` misses `M`) and has `j + 1` elements. Each `a ∈ A` is nonzero modulo `p`, so as `t`
runs over the `3j + 1` nonzero residues, `ta` meets `M` exactly `j + 1` times; summing over
`a ∈ A`, some `t` has at least `n (j + 1)/(3j + 1) > n/3` elements `a` with `ta ∈ M`. Those
elements form a sum-free subset of `A`, because `x + y = z` in it would give
`tx + ty = tz` in `M`.

**Checks.**
- `A = {1, 2, 3}`: `{2, 3}` is sum-free and `3 · 2 ≥ 4`.
- Klarner's set `{2, 3, 4, 5, 6, 8, 10}` (Eberhard–Green–Manners, p. 2) has no sum-free subset of
  more than `3` elements (exhaustive search), and `3 · 3 ≥ 8`: the bound is attained, and the
  constant `1/3` cannot be replaced by `1/2`.
- The hypotheses are needed: `A = {0}` has no nonempty sum-free subset, and `A = ∅` would require
  `1 ≤ 0`.
- For every nonempty `A ⊆ [−6, 6] ∖ {0}` with at most `8` elements the bound holds (exhaustive
  search).

*Needs:* 3.1; Mathlib `Nat.forall_exists_prime_gt_and_eq_mod`. (Proved here.)

### 3.3 Sum-free sets in finite abelian groups

Prove `exists_isSumFree_two_mul_card_le`: every finite abelian group `G` with at least two
elements has a sum-free subset `A` with `7|A| ≥ 2|G|` (Green–Ruzsa, §1, p. 1, which derives
`µ(G) ≥ 2/7` from `µ(ℤ/m) ≥ ⌊(m + 1)/3⌋/m` and quotients, and reports Rhemtulla and Street's
equality for the elementary abelian `7`-groups).

Route: `G` has a quotient `ℤ/p` for some prime `p`, by the structure theorem
(`AddCommGroup.equiv_directSum_zmod_of_finite`). The preimage of a sum-free subset of `ℤ/p` is
sum-free. In `ℤ/p` take `{1}` for `p = 2, 3`, `{j + 1, …, 2j + 1}` for `p = 3j + 2` and
`{j + 1, …, 2j}` for `p = 3j + 1 ≥ 7`; each has `⌊(p + 1)/3⌋` elements, and
`⌊(p + 1)/3⌋/p ≥ 2/7` for every prime `p`, with equality only at `p = 7`
(`(j + 1)/(3j + 2) > 1/3` and `j/(3j + 1) ≥ 2/7` for `j ≥ 2`).

**Checks.**
- `ℤ/7`: the largest sum-free sets have `2` elements, for instance `{2, 3}` (exhaustive
  search), so equality holds.
- The hypothesis `|G| ≥ 2` is needed: in the trivial group the only sum-free set is `∅`.
- For every abelian group of order at most `14` or equal to `16`, the largest sum-free sets have
  at least `2|G|/7` elements (exhaustive search); for `ℤ/13` there are `4 ≥ 26/7`.

*Needs:* 3.1; Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`, `ZMod`. (Proved here,
following the cited argument.)

### Examples

`{2, 3}` in `ℤ/7`; Klarner's set and its sum-free subsets of three elements; the odd integers.

### Dependencies

Mathlib `Nat.forall_exists_prime_gt_and_eq_mod`, `AddCommGroup.equiv_directSum_zmod_of_finite`,
`ZMod`. No other layer.

## Layer 4: a single linear equation

### 4.1 Ruzsa's bound for symmetric equations

Prove `card_sq_le_of_forall_not_injective`: let `k ≥ 2` and `a₁, …, a_k` be nonzero integers,
and let `A ⊆ {1, …, N}` be such that `a₁x₁ + ⋯ + a_kx_k = a₁y₁ + ⋯ + a_ky_k` has no solution
with `x₁, …, x_k, y₁, …, y_k ∈ A` pairwise distinct. Then
`|A|² ≤ C(2k, 2) (|a₁| + ⋯ + |a_k|) N` (Bukh, Introduction, equations (1) and (3)–(5),
pp. 1–2, reproducing Ruzsa's argument of 1993).

Route: let `M = |A|` and `r(m)` the number of `x ∈ Aᵏ` with `∑ aᵢxᵢ = m`. The values `m` lie in
an interval of `‖a‖₁ (N − 1) + 1 ≤ ‖a‖₁ N` integers, so by Cauchy–Schwarz the number `E` of
solutions is `∑ r(m)² ≥ M^(2k)/(‖a‖₁ N)`. Every solution has two equal variables among the `2k`;
for a fixed pair of positions, choose a third position, whose variable the equation determines
from the others because its coefficient is nonzero: at most `M^(2k−2)` solutions. So
`E ≤ C(2k, 2) M^(2k−2)`, and the two bounds give the claim (for `M = 0` it is trivial).

**Checks.**
- `k = 2`, `a = (1, 1)`: a set in which `x₁ + x₂ = y₁ + y₂` has no solution in four distinct
  elements satisfies `|A|² ≤ 12N`; 1.4 is the sharp bound for the stronger Sidon condition.
- `k ≥ 2` is needed: for `k = 1`, `a₁x₁ = a₁y₁` forces `x₁ = y₁`, so `A = {1, …, N}` qualifies,
  and `N² ≤ N` fails for `N ≥ 2` when `a₁ = 1`.
- Nonzero coefficients are needed: for `a = (1, 0)` every solution has `x₁ = y₁`, so
  `A = {1, …, N}` qualifies, and `N² ≤ 6N` fails for `N ≥ 7`.
- For `a = (1, 1), (1, 2), (1, −1), (2, 3), (1, −2)` and `N ≤ 14`, and for `a = (1, 1, 1)` and
  `N ≤ 9`, the largest admissible sets satisfy the bound (exhaustive search).

*Needs:* Mathlib `sq_sum_le_card_mul_sum_sq`. (Proved here, following the cited proof.)

### 4.2 Behrend's construction for convex equations

Prove `exists_forall_eq_of_sum_mul_eq`: let `a₁, …, a_k` be positive integers with sum `b`. For
every `N` there is `A ⊆ {0, …, N − 1}` such that `a₁x₁ + ⋯ + a_kx_k = b y` with all variables in
`A` forces `x₁ = ⋯ = x_k = y`, and
`|A| ≥ N exp(−3 √(2 log 2b) √(log N))`. Behrend's sphere argument (Zhao, Theorem 2.5.1 and its
proof, pp. 70–71, for `x + z = 2y`) extends to these equations, as Schoen and Sisask observe
(Schoen–Sisask, §1, p. 2, after (1.1)); the case `x + y + z = 3w` is posed as Zhao's
Exercise 2.5.4, p. 71. The constant `3 √(2 log 2b)` and the route below are derived here.

Route: for `k = 0` take `A = {0, …, N − 1}`; for `b = 1` the equation is `x₁ = y`. Let `b ≥ 2`,
`β = log 2b > 1` and `C = 3 √(2β)`. If `log N < C²` the bound is at most `1` (it equals `1` at
`N = 1`) and a one-point set (or `∅` for `N = 0`) suffices. Otherwise put
`n = ⌈√(2 log N/β)⌉ ≥ 6`, `d = ⌊N^(1/n)/b⌋` and `D = b(d − 1) + 1`. Then `N^(1/n)/b ≥ 2`
(because `n ≤ log N/β`), so `d ≥ N^(1/n)/(2b)` and `D ≤ bd ≤ N^(1/n)`. By pigeonhole some
sphere `|v|² = s` contains at least `dⁿ/(n d²)` points
`v ∈ {0, …, d − 1}ⁿ` (`Behrend.exists_large_sphere`); let `A` be their images under the base-`D`
digit map `Behrend.map D`, which is injective on these points (`Behrend.map_injOn`) and sends
them below `Dⁿ ≤ N`. If `∑ aᵢ xᵢ = b y` in `A`, with `xᵢ` and `y` the images of `vᵢ` and `w`,
the digit vectors `∑ aᵢ vᵢ` and `b w` have entries at most `b(d − 1) < D`, so the map, being
additive and injective on such vectors, gives `∑ aᵢ vᵢ = b w`. Coordinatewise, strict convexity
of `t ↦ t²` gives `b w_j² ≤ ∑ aᵢ (vᵢ)_j²`; summing over `j`, both sides equal `b s`, so equality
holds in every coordinate and all `vᵢ = w`. Finally
`log |A| ≥ (n − 2) log d − log n ≥ log N − 2 log N/n − (n − 2)β − log n`, and with the choice of
`n` this exceeds `log N − 2√(2β log N) + β − √(2 log N/β)` (using `2 log N/n ≤ √(2β log N)`,
`(n − 2)β ≤ √(2β log N) − β` and `log n ≤ n − 1 ≤ √(2 log N/β)`), which is at least
`log N − C √(log N)` because `√(2/β) < √(2β)` for `β > 1`.

**Checks.**
- `b = 2` (`x₁ + x₂ = 2y`): the constant is `3 √(2 log 4) ≈ 4.995`, weaker than Mathlib's
  `Behrend.roth_lower_bound` with `4`; `b = 3`: `≈ 5.679`. The bound exceeds `1` only for
  `log N ≥ C²`, about `N ≥ e^25` for `b = 2`.
- Positivity of the coefficients is needed: for `a = (1, 0)` (`b = 1`), `x₁ = y` with `x₂`
  free has a solution with `x₂ ≠ y` in every set of two elements, while the claimed bound exceeds
  `1` for `log N ≥ 18 log 2 ≈ 12.5`.
- For `a = (1, 2), (1, 1, 1), (2, 3), (1, 1, 2), (1, 3)`, every sphere in `{0, …, d − 1}ⁿ` with
  `(n, d) = (2, 3), (3, 3), (2, 4), (3, 2), (4, 2)` maps under the base-`D` digit map to a set
  with only trivial solutions (exhaustive search). For instance, for `x + 2y = 3z`, `d = 3`,
  `D = 7`, the sphere `|v|² = 5` in `{0, 1, 2}²` gives `{9, 15}`.
- For `b` from `2` to `40` and `b = 100, 1000, 10⁶`, over a grid of `log N ≥ C²`, the bound
  `(n − 2) log d − log n` with the actual `d = ⌊N^(1/n)/b⌋` exceeds `log N − C √(log N)` by at
  least `2.38 √(log N)`, while the last inequality of the route, which uses only
  `d ≥ N^(1/n)/(2b)`, has room `(√(2β) − √(2/β)) √(log N) + β`, about `0.46 √(log N) + 1.39` for
  `b = 2` (checked by computer).

*Needs:* Mathlib `Behrend.sphere`, `Behrend.exists_large_sphere`, `Behrend.map`,
`Behrend.map_injOn`, `strictConvexOn_pow`, `StrictConvexOn.map_sum_eq_iff`. (Proved here.)

### 4.3 Equations that are not invariant

Prove `exists_forall_sum_mul_ne`: let `a₁, …, a_k, c` be integers with `s = a₁ + ⋯ + a_k ≠ 0`
or `c ≠ 0`, and `m = |s| + |c| + 1`. For every `N` there is `A ⊆ {1, …, N}` with at least
`⌊N/m⌋` elements in which `a₁x₁ + ⋯ + a_kx_k = c` has no solution at all.

Route: take `A` the elements of `{1, …, N}` congruent to `r` modulo `m`, with `r ∈ {0, 1}`. A
solution would give `s r ≡ c` modulo `m`. If `s ≠ 0`, then `m ∤ s`, so `0` and `s` differ
modulo `m` and one choice of `r` avoids `c`; if `s = 0`, then `c ≢ 0` because `m > |c| ≥ 1`, and
`r = 0` works. Both classes have at least `⌊N/m⌋` elements in `{1, …, N}`.

**Checks.**
- `x₁ + x₂ = x₃` (`s = 1`, `c = 0`, `m = 2`): the odd numbers, `⌈N/2⌉` of them, form a sum-free
  set, as in 3.1.
- The hypothesis is needed: for `x₁ − x₂ = 0` every nonempty set has the solution `x₁ = x₂`.
- For all `k ≤ 2`, coefficients and `c` in `[−3, 3]` and `N ≤ 12`, one of the two classes works
  (exhaustive search).

*Needs:* nothing. (Proved here.)

### Examples

The sets without distinct solutions of `x₁ + x₂ = y₁ + y₂`; the set `{9, 15}` for `x + 2y = 3z`;
the odd numbers for `x₁ + x₂ = x₃`.

### Dependencies

Mathlib `sq_sum_le_card_mul_sum_sq`, `Behrend.sphere`, `Behrend.exists_large_sphere`,
`Behrend.map`, `Behrend.map_injOn`, `strictConvexOn_pow`, `StrictConvexOn.map_sum_eq_iff`. No
other layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: Sidon sets with their difference
form, the energy identity and the counting bound in finite abelian groups; the
Erdős–Turán–Lindström bound; the sets of Erdős and Turán, of Bose (with its exact differences)
and of Singer (as perfect difference sets of residues), Singer's theorem, the explicit lower
bound and the asymptotic size of the largest Sidon subset of `{1, …, N}`; sum-free sets with
Erdős's theorem and the bound `2|G|/7`; Ruzsa's bound for symmetric equations, Behrend's
construction for convex equations and the solution-free sets of equations that are not
invariant.

Already in the libraries and therefore not targets:

- Mathlib's additive energy (`Finset.addEnergy` in `Mathlib/Combinatorics/Additive/Energy.lean`),
  used in 1.2; the energy identity of 1.2 is not in Mathlib.
- Mathlib's sets free of three-term progressions and Behrend's bound for them
  (`ThreeAPFree`, `rothNumberNat` in `Mathlib/Combinatorics/Additive/AP/Three/Defs.lean`;
  `Behrend.roth_lower_bound` in `.../AP/Three/Behrend.lean`), and the qualitative theorem of Roth
  (`rothNumberNat_isLittleO_id` in `Mathlib/Combinatorics/Additive/Corner/Roth.lean`). For
  `x₁ + x₂ = 2y`, 4.2 is a weaker form of `Behrend.roth_lower_bound` and is not a separate
  target; 4.2 reuses the sphere count and digit map of that file.
- Mathlib's dissociated sets (`AddDissociated` in
  `Mathlib/Combinatorics/Additive/Dissociation.lean`), in which distinct finite subsets have
  distinct sums: a different condition, on sums of subsets rather than of pairs, not used here.
- Mathlib's finite fields, the extensions `FiniteField.Extension`, and the cyclicity of the units
  of a finite field, used in 2.2 and 2.3.

Left to other roadmaps:

- FourierAnalyticAdditiveCombinatorics owns quantitative bounds for sets without three-term
  progressions in finite abelian groups and the Ellenberg–Gijswijt theorem for three-variable
  equations in `𝔽_qⁿ` (its Layer 1, character sums and the count of three-term progressions;
  Layer 2, Meshulam's theorem; Layer 3, the polynomial method). Nothing here concerns
  three-variable equations with coefficient sum zero in `𝔽_qⁿ` or upper bounds for sets without
  three-term progressions; the only statement touching progressions is the case `x₁ + x₂ = 2y`
  of 4.2, a lower bound in the integers that is weaker than Mathlib's `Behrend.roth_lower_bound`
  (above). This roadmap does not depend on that one.
- RamseyNumbers, Layer 6, Schur's theorem (6.1), proves that a colouring of `{1, …, N}` with
  finitely many colours has a monochromatic solution of `x + y = z` when `N + 1` is at least the
  Ramsey number `R(3, …, 3)`; equivalently, `{1, …, N}` is then not a union of that many sum-free
  sets. That statement is not restated here, and this roadmap does not depend on that one.

Not treated here: `B_h` sets for `h ≥ 3` and the extensions of Bose's and Singer's constructions
to them, Ruzsa's construction modulo `p² − p`, sets with at most `g` representations, infinite
Sidon sequences, improvements of the lower-order term in 1.4, finite projective planes as
incidence structures (Singer's sets appear only as sets of residues), the exact value of the
largest sum-free density of every finite abelian group (Green–Ruzsa, Theorem 1.5), the number of
sum-free sets, the optimality of `1/3` in 3.2 (Eberhard–Green–Manners, Theorem 1.1), upper bounds
of order `o(N)` for invariant equations, Ruzsa's genus of an equation, and Bukh's improvement of
4.1 for `k ≥ 3`. Additive energy is used only through the identity 1.2.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/Additive/Energy.lean`: `Finset.addEnergy` (`s.addEnergy t` is the number
  of `((a₁, a₂), (b₁, b₂)) ∈ (s × s) × (t × t)` with `a₁ + b₁ = a₂ + b₂`).
- `Mathlib/Combinatorics/Additive/AP/Three/Behrend.lean`: `Behrend.sphere n d s` (the points of
  `{0, …, d − 1}ⁿ` with `∑ vⱼ² = s`), `Behrend.exists_large_sphere` (for all `n, d` some sphere
  has at least `dⁿ/(n d²)` points), `Behrend.map D` (the additive map `v ↦ ∑ vⱼ Dʲ` from
  `Fin n → ℕ` to `ℕ`), `Behrend.map_injOn` (it is injective on vectors with entries below `D`).
- `Mathlib/Analysis/Convex/SpecificFunctions/Deriv.lean`: `strictConvexOn_pow` (`t ↦ tⁿ` is
  strictly convex on `[0, ∞)` for `n ≥ 2`). `Mathlib/Analysis/Convex/Jensen.lean`:
  `StrictConvexOn.map_sum_eq_iff` (equality in Jensen's inequality for a strictly convex function
  and positive weights forces all points equal).
- `Mathlib/Algebra/Order/Chebyshev.lean`: `sq_sum_le_card_mul_sum_sq` (Cauchy–Schwarz for a
  finite sum).
- `Mathlib/GroupTheory/OrderOfElement.lean`: `orderOf_dvd_iff_pow_eq_one`.
  `Mathlib/GroupTheory/SpecificGroups/Cyclic/Subgroup.lean`: `IsCyclic.exists_generator`,
  `orderOf_eq_card_of_forall_mem_zpowers`. `Mathlib/RingTheory/IntegralDomain.lean`: the
  instance making the units of a domain with finitely many units cyclic.
- `Mathlib/FieldTheory/Finite/Basic.lean`: `FiniteField.pow_card_sub_one_eq_one` (`a^(q − 1) = 1`
  for `a ≠ 0` in a field with `q` elements). `Mathlib/FieldTheory/Finite/Extension.lean`:
  `FiniteField.Extension k p n` (an extension of degree `n` of a finite field `k` of
  characteristic `p`), `FiniteField.natCard_extension` (it has `|k|ⁿ` elements).
- `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean`: `IntermediateField.adjoin.finrank`
  (the degree of `k(θ)` is the degree of the minimal polynomial).
  `Mathlib/FieldTheory/Minpoly/Field.lean`: `minpoly.dvd` (a polynomial vanishing at `θ` is
  divisible by the minimal polynomial).
- `Mathlib/Data/ZMod/Defs.lean` and `Mathlib/Data/ZMod/Basic.lean`: `ZMod`, `ZMod.val`, the field
  structure of `ZMod p` for prime `p`. `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`:
  `AddCommGroup.equiv_directSum_zmod_of_finite` (a finite abelian group is a direct sum of cyclic
  groups of prime-power order).
- `Mathlib/NumberTheory/Bertrand.lean`: `Nat.exists_prime_lt_and_le_two_mul` (a prime in
  `(n, 2n]` for `n ≠ 0`). `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`:
  `Nat.forall_exists_prime_gt_and_eq_mod` (Dirichlet: arbitrarily large primes in every unit
  residue class). `Mathlib/NumberTheory/NumberField/Basic.lean`: `Rat.ringOfIntegersEquiv`
  (`𝓞 ℚ ≃+* ℤ`).
- `Mathlib/Analysis/Asymptotics/AsymptoticEquivalent.lean`: `Asymptotics.IsEquivalent`.
  `Real.sqrt`, `Real.rpow`, `Real.log`, `Real.exp`.

### From Tau Ceti

- `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean`:
  `NumberField.Chebotarev.tendsto_primeCount_primesCongruent` (for `m ≥ 1` and a unit residue
  `a`, the number of primes of `𝓞 ℚ` of norm at most `x` congruent to `a` modulo `m`, divided by
  `x / log x`, tends to `1/φ(m)`); used with `m = 1` as the prime number theorem in 2.4.
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/Counting.lean`: `TauCeti.primeCount` (the
  number of primes of a set of primes of `𝓞 K` of absolute norm at most `x`).

## References

- Kevin O'Bryant, *A complete annotated bibliography of work related to Sidon sequences*,
  Electronic Journal of Combinatorics, Dynamic Survey DS11 (2004), open access; the version
  published July 26, 2004, whose page numbers are used above.
- Ben Green and Imre Z. Ruzsa, *Sum-free sets in abelian groups*, arXiv:math/0307142v4 (2004);
  the numbering is that of this version.
- Sean Eberhard, Ben Green and Freddie Manners, *Sets of integers with no large sum-free subset*,
  arXiv:1301.4579v3; the numbering is that of this version.
- Boris Bukh, *Non-trivial solutions to a linear equation in integers*, arXiv:math/0703767v2
  (2007).
- Tomasz Schoen and Olof Sisask, *Roth's theorem for four variables and additive structures in
  sums of sparse sets*, arXiv:1408.2568v1 (2014).
- Yufei Zhao, *Graph Theory and Additive Combinatorics: Exploring Structure and Randomness*,
  Cambridge University Press, 2023; the author's version on the author's page (last updated
  June 18, 2024), whose page numbers are used above.
- Attributions made in prose without a locator, as the sources above report them: S. Sidon (1932),
  P. Erdős and P. Turán (1941), J. Singer (1938), R. C. Bose (1942), B. Lindström (1969),
  P. Erdős (1965), N. Alon and D. J. Kleitman (1990), A. H. Rhemtulla and A. P. Street,
  I. Z. Ruzsa (*Solving a linear equation in a set of integers I*, Acta Arithmetica 65, 1993),
  F. Behrend (1946).
