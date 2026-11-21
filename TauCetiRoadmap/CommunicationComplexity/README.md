# Roadmap: communication complexity

**Summary.** Alice holds `x` in a finite set `X`, Bob holds `y` in a set `Y`, and they want
to learn the bit `f(x, y)` by exchanging bits according to a plan fixed in advance. This roadmap
treats such a plan, a deterministic protocol, as a mathematical object: a finite binary tree
whose internal nodes belong to one player and carry a bit-valued function of that player's
input, and whose leaves carry an output. Its cost is the depth of the tree, and the
communication complexity `D(f)` is the least depth of a protocol whose output is `f(x, y)` on
every input. The output is read off the leaf, so both players learn it and the last bit
announced counts. No procedure or running time is a target.

The headline theorems are these.

- *Rectangle and rank bounds.* The inputs reaching one leaf form a rectangle `A × B`, so for
  finite `X` and `Y` the least number `χ(f)` of rectangles on which `f` is constant needed to
  partition `X × Y` satisfies `χ(f) ≤ 2^D(f)`. Over every field, the rank of the 0–1 matrix of
  `f` plus that of its negation is at most `χ(f)`, and so is the size of a fooling set.
- *Exact values.* For `n ≥ 1`, equality, disjointness and the inner product modulo `2` of two
  `n`-bit strings each have communication complexity `n + 1`.
- *Discrepancy.* Let `μ` be a probability distribution on the finite set `X × Y`. If a random
  choice among protocols of depth at most `d` errs with probability at most `ε` on every input,
  then `1 − 2ε` is at most `2^d` times the discrepancy of `f` under `μ`, the largest absolute
  `μ`-weighted sum of the signs `±1` of `f` over a rectangle.
- *Lindsey's lemma.* For sets `A`, `B` of `n`-bit strings, the sum of `(−1)^⟨x, y⟩` over `A × B`
  has absolute value at most `√(|A| · |B| · 2^n)`. Hence the inner product has discrepancy at
  most `2^(−n/2)` under the uniform distribution, and a random choice among protocols of depth
  at most `d` computing it with error at most `ε` on every input has `(1 − 2ε) · 2^(n/2) ≤ 2^d`.

The roadmap builds on Mathlib's matrix rank, finite partitions and Hadamard matrices; the sign
matrix of the inner product is a Hadamard matrix. The roadmaps on Fourier analysis of Boolean
functions and on the linear algebra method in combinatorics are neighbours that state none of
these results. Decision trees and query complexity are not treated here.

Layer 1 below defines protocols, transcripts and `D(f)`, proves the trivial upper bound and the
rectangle property. Layer 2, which uses it, proves the partition, rank and fooling-set bounds
and the values for equality and disjointness. Layer 3, which uses Layer 1, proves the
discrepancy bounds. Layer 4, which uses Layers 1 to 3, treats the inner product.

## Conventions

- **Inputs and functions.** `X` is Alice's set of inputs and `Y` is Bob's. A function to be
  computed is `f : X → Y → Bool`, with `true` playing the role of `1`. Statements about
  partitions, matrices and discrepancy assume `[Fintype X] [Fintype Y]` and decidable equality
  on both; the trivial upper bound of 1.1 assumes only that `X` is finite.
- **Protocols.** `Protocol X Y Z` is the inductive type of finite binary trees with three
  constructors: a leaf `leaf z` with an output `z : Z`; a node `alice a p₀ p₁` with
  `a : X → Bool`, where Alice sends the bit `a x`; a node `bob b p₀ p₁` with `b : Y → Bool`, where
  Bob sends `b y`. After the bit `false` the protocol continues with `p₀` and after `true` with
  `p₁`. The tree is part of the data: two protocols with the same outputs on all inputs may
  differ in depth.
- **Cost.** The cost of a protocol is its depth `Protocol.depth`, the number of bits sent along a
  longest path from the root to a leaf, whether or not any input follows that path. The output is
  the label of the leaf reached, so it is known to both players and the last bit sent counts.
  Under the convention in which only one player must learn the answer, the trivial protocol for
  `n`-bit strings costs `n` instead of `n + 1`, and the two conventions differ by at most one bit
  (Lee–Shraibman, p. 2).
- **Communication complexity.** `commComplexity f` is the infimum `sInf` of the set of `d` such
  that some protocol of depth at most `d` outputs `f x y` on every pair `(x, y)`. When `X` is
  finite the set is nonempty by 1.1, so the infimum is attained and is the least depth of a
  protocol computing `f`. When `X` and `Y` are infinite the set may be empty, and then Lean's
  convention `sInf ∅ = 0` gives the junk value `0`. Every statement about `commComplexity`
  therefore assumes `X` finite.
- **Rectangles and partitions.** A rectangle is a finite set of pairs of the form `A ×ˢ B`. A
  partition of `X × Y` is Mathlib's `Finpartition` of `Finset.univ`, whose parts are nonempty,
  pairwise disjoint and cover all pairs; so empty rectangles are never counted.
- **Rank.** Ranks are Mathlib's `Matrix.rank` over a field `K` chosen in each statement. The
  0–1 matrix of a function does not depend on `K`, but its rank does (Check of 2.2).
- **Signs and weights.** The sign of a bit is `boolSign b`, equal to `−1` for `true` and `1` for
  `false`, so the sign of `innerProduct n x y` is `(−1)^⟨x, y⟩`. A weighting is any function
  `μ : X × Y → ℝ`; it is a probability distribution when it is nonnegative with total `1`. A
  random choice of protocols is a finite family `ps : ι → Protocol X Y Bool` with weights
  `w : ι → ℝ` forming a probability distribution, the public-coin model.
- **Strings.** An `n`-bit string is a function `Fin n → Bool`; `n = 0` is allowed, and then
  there is exactly one string.
- **Logarithms.** Statements are written in exponential form (`χ(f) ≤ 2^D(f)`), which needs no
  convention for the logarithm of `0`; `log₂` appears only in prose.

## Layer 1: protocols and the rectangle property

### 1.1 Protocols and communication complexity

Define `Protocol X Y Z` as in the Conventions, with `Protocol.eval p x y`, the output of the leaf
reached on `(x, y)`, and `Protocol.depth p`. Define `commComplexity f` as above
(Lee–Shraibman, Definition 2.1, p. 14, where the cost is the number of edges on a longest path
and `D(f)` the least cost of a protocol computing `f`).

Prove `commComplexity_le`: if `X` is finite, then for every `Y` and every `f`,
`commComplexity f ≤ ⌈log₂ |X|⌉ + 1`, where `⌈log₂ |X|⌉` is `Nat.clog 2 (Fintype.card X)`
(Lee–Shraibman, p. 2, the trivial protocol; Arora–Barak, p. 12.2).

Route: by `Nat.le_pow_clog` there is an injection of `X` into the numbers below `2^k` with
`k = ⌈log₂ |X|⌉`. Alice sends the `k` binary digits of the number of her input along a complete
binary tree of depth `k`; at the end of the path for the number of `x`, Bob sends the bit
`f x y` and the two leaves below carry `false` and `true`. Paths for numbers that are not used
end in any leaf. The tree has depth `k + 1`, and `Nat.sInf_le` concludes.

- With `X` finite the set in the definition is nonempty, so by `Nat.sInf_mem` some protocol
  computing `f` has depth exactly `commComplexity f`.
- The same bound holds with `Y` in place of `X`, by letting Bob speak first.

**Checks.**
- A constant function has complexity `0`: the single leaf carrying the constant computes it.
  When `X` or `Y` is empty every function is computed by a leaf and has complexity `0`.
- For equality on a three-element set the bound gives `2 + 1 = 3`, and a search over all
  protocols shows that `3` is the exact value. For equality of `n`-bit strings it gives `n + 1`,
  the exact value of 2.4.
- Finiteness is needed for the definition to mean anything: no protocol computes equality on
  `ℕ`. The inputs reaching one leaf form a rectangle (1.2), a rectangle containing `(k, k)` and
  `(m, m)` contains `(k, m)`, so the diagonal would need infinitely many leaves; a tree of depth
  `d` has at most `2^d`. The defining set is empty and `commComplexity` returns the junk value
  `0`.

*Needs:* Mathlib `Nat.clog`, `Nat.le_pow_clog`, `Nat.sInf_le`, `Nat.sInf_mem`,
`Fintype.equivFin`.

### 1.2 Transcripts and the rectangle property

Define `Protocol.transcript p x y`, the list of bits sent on `(x, y)`, in order. Prove
`Protocol.transcript_eq_of_transcript_eq`: if `(x, y)` and `(x', y')` have the same transcript,
then `(x, y')` has that transcript too (Lee–Shraibman, proof of Theorem 2.1, p. 15; Arora–Barak,
p. 12.2).

Route: induction on the tree. At an Alice node the first bit is `a x`, which is the same for
`(x, y)` and `(x, y')` and, by hypothesis, the same for `(x, y)` and `(x', y')`; so all three
pairs go to the same subtree, where the induction hypothesis applies to the rest of the lists.
Bob nodes are symmetric.

- Applying the statement twice, `(x', y)` has the same transcript as well. So for every list
  `t` the set of pairs with transcript `t` is the product of the `x` that occur in it with the
  `y` that occur in it.
- Two pairs with the same transcript reach the same leaf and have the same output.

**Checks.**
- For the protocol in which Alice sends `x` and then Bob sends `y`, on `X = Y = Bool`, the
  transcript of `(x, y)` is `[x, y]`, and every set of pairs with one transcript is a single pair.
- The property is not shared by arbitrary functions of both inputs: the "transcript"
  `[x && y]` puts `(true, false)` and `(false, true)` together and leaves out `(true, true)`.

*Needs:* nothing beyond the definitions. (Lee–Shraibman, proof of Theorem 2.1.)

### 1.3 The leaves of a protocol form a partition into rectangles

Define `IsMonoRectangle f R`: the finite set `R` of pairs is a product `A ×ˢ B` and `f` takes a
single value on it. Prove `Protocol.exists_finpartition_isMonoRectangle`: for finite `X`, `Y`,
every protocol `p` with outputs in `Bool` has a partition of `X × Y` into at most `2^depth p`
nonempty parts, each a rectangle on which `Protocol.eval p` is constant (Lee–Shraibman, proof of
Theorem 2.1, p. 15; Arora–Barak, discussion before Theorem 12.7, pp. 12.3–12.4).

Route: the parts are the nonempty sets of pairs with a given transcript; they are rectangles by
1.2 and the output is constant on each by the second bullet of 1.2. Different leaves have
different transcripts, and a tree of depth `d` has at most `2^d` leaves, by induction on the tree.

**Checks.**
- The bound counts leaves, not reachable leaves: for nonempty `X`, `Y` and `p` an Alice node with
  `a = fun _ => false` above two leaves, the depth is `1`, the partition has one part, and
  `1 ≤ 2`.
- For `X = Y = Bool`, let Alice send `x`; after `false` the protocol stops at a leaf `false`, and
  after `true` Bob sends `y` and the leaves carry `false` and `true`. It computes `x && y` with
  depth `2`, and its parts are `{false} ×ˢ {false, true}`, `{true} ×ˢ {false}` and
  `{true} ×ˢ {true}`: three parts, below the bound `4`.

*Needs:* 1.2; Mathlib `Finpartition`, `Finset.product`.

### Examples

Constant functions; equality on a three-element set; the protocol computing `x && y` with two
bits and its three rectangles.

### Dependencies

Mathlib `Nat.clog`, `Nat.le_pow_clog`, `Nat.sInf_le`, `Nat.sInf_mem`, `Fintype.equivFin`,
`Finpartition`, `Finset.product`. No other layer.

## Layer 2: partitions, rank and fooling sets

### 2.1 The partition bound

For finite `X` and `Y` define `partitionNumber f`, the partition number `χ(f)`: the least number
of parts of a partition of `X × Y` into monochromatic rectangles, in the sense of 1.3
(Lee–Shraibman, Definition 2.2, p. 14; Arora–Barak, Definition 12.6, p. 12.4, where it is
written `χ(f)`). The partition `⊥` into singletons is such a partition, so the infimum is
attained and `χ(f) ≤ |X| · |Y|` (`Finpartition.card_bot`).

Prove `partitionNumber_le_two_pow_commComplexity`: `χ(f) ≤ 2^D(f)`, that is
`D(f) ≥ log₂ χ(f)` (Lee–Shraibman, Theorem 2.1, p. 15; Arora–Barak, Theorem 12.7, p. 12.4).

Route: take a protocol of depth `D(f)` computing `f` (first bullet of 1.1) and apply 1.3; since
`Protocol.eval p = f`, its parts are monochromatic rectangles of `f`.

**Checks.**
- Equality of `1`-bit strings: the two pairs `(x, x)` lie in no common monochromatic rectangle,
  nor do the two pairs `(x, ¬x)`, so `χ = 4 = 2^2`, and `D = 2`.
- The function `x && y` on `Bool × Bool` has `χ = 3`; its complexity is `2`, and `3 ≤ 4`.
- A constant function has `χ = 1` when `X` and `Y` are nonempty and `χ = 0` when one is empty.

*Needs:* 1.1, 1.3; Mathlib `Finpartition`, `Finpartition.card_bot`, `Nat.sInf_le`,
`Nat.sInf_mem`.

### 2.2 The rank bound

Define `commMatrix K f`, the `X × Y` matrix over the field `K` with entry `1` where `f` is true
and `0` where it is false. Prove `rank_add_rank_le_partitionNumber`: for every field `K`,
`rank (commMatrix K f) + rank (commMatrix K (¬f)) ≤ χ(f)`, with `¬f` the function
`fun x y => !f x y`. With 2.1 this gives `D(f) ≥ log₂ (rank M_f + rank M_¬f)`, and in particular
`D(f) ≥ log₂ rank M_f` (Lee–Shraibman, Theorem 2.3, p. 16, with ranks over the reals; Arora–Barak,
Theorem 12.10, p. 12.4, for the first rank only; the bound is due to Mehlhorn and Schmidt).

Route: in an optimal partition, the indicator matrix of a part `A ×ˢ B` is the outer product
`vecMulVec` of the indicator vectors of `A` and `B`, of rank at most `1`
(`Matrix.rank_vecMulVec_le`). `commMatrix K f` is the sum of the indicator matrices of the parts
on which `f` is true, and `commMatrix K (¬f)` the sum over the other parts. The rank of a sum is
at most the sum of the ranks, by `LinearMap.rank_finsetSum_le` applied to `Matrix.mulVecLin`,
since `Matrix.rank` is the dimension of the range of `Matrix.mulVecLin`.

**Checks.**
- A constant function on nonempty `X`, `Y`: one matrix is `0` and the other is the all-ones
  matrix, so the ranks add up to `0 + 1 = 1 = χ`, and `rank 0 = 0` causes no difficulty.
- Equality of `n`-bit strings: the identity and the matrix `J − I` with zero diagonal both have
  rank `2^n` over the reals for `n ≥ 1`, so `2^(n+1) ≤ χ`. With the first rank alone the bound
  gives only `D ≥ n`.
- The field matters. For equality on a three-element set, `J − I` has rank `3` over `ℝ` and rank
  `2` over `𝔽₂`, where its three rows add up to `0`, so the bound is `6` over `ℝ` and `5` over
  `𝔽₂`; here `χ = 6`. For the inner product of `3`-bit strings the two ranks are `7` and `8`
  over `ℝ` but `3` and `4` over `𝔽₂`.

*Needs:* 2.1; Mathlib `Matrix.rank`, `Matrix.vecMulVec`, `Matrix.rank_vecMulVec_le`,
`Matrix.mulVecLin`, `LinearMap.rank_finsetSum_le`, `Nat.sInf_mem`.

### 2.3 Fooling sets

Define `IsFoolingSet f b S` for a finite set `S` of pairs and a bit `b`: `f = b` at every pair of
`S`, and for two distinct pairs `(x, y)` and `(x', y')` of `S`, `f x y' ≠ b` or `f x' y ≠ b`.
Prove `card_le_partitionNumber_of_isFoolingSet`: a fooling set has at most `χ(f)` elements, so
`D(f) ≥ log₂ |S|` (Arora–Barak, Definition 12.3 and Lemma 12.4, p. 12.3, and Lemma 12.8,
p. 12.4).

Route: two distinct pairs of `S` in one monochromatic rectangle `A ×ˢ B` would put `(x, y')` and
`(x', y)` in it as well, with the value `b` of the rectangle; so the map from `S` to the parts of
an optimal partition is injective (`Finset.card_le_card_of_injOn`).

- If moreover `f` takes the value `!b` somewhere, the part containing such a pair contains no
  pair of `S`, and `|S| + 1 ≤ χ(f)`.

**Checks.**
- For equality of `n`-bit strings the diagonal is a fooling set with `b = true` and `2^n`
  elements, and `f` is false off the diagonal for `n ≥ 1`, so `2^n + 1 ≤ χ` and `D ≥ n + 1`.
- For disjointness the pairs `(x, ¬x)`, `x` and its complement, form a fooling set with
  `b = true`: for `x ≠ x'` some position has `x i ≠ x' i`, and then `x` meets `¬x'` or `x'` meets
  `¬x` there. The diagonal pairs `(x, x)` do not form one: disjointness is false at `(x, x)` as
  soon as `x` has a `true` entry.
- For `x && y` on `Bool × Bool` the pairs `(false, true)` and `(true, false)` form a fooling set
  with `b = false`, since the function is `true` at `(true, true)`; with the bullet above,
  `3 ≤ χ`, and `χ = 3`. The pairs `(false, false)` and `(false, true)` do not form one: the
  function is `false` at both crossed pairs.

*Needs:* 2.1; Mathlib `Finset.card_le_card_of_injOn`, `Nat.sInf_mem`.

### 2.4 Equality and disjointness

Define `equality n x y`, true when the `n`-bit strings `x` and `y` are equal, and
`disjointness n x y`, true when no position carries `true` in both. Prove, for `n ≥ 1`:

- `commComplexity_equality`: `D(EQ_n) = n + 1` (Lee–Shraibman, p. 44, for the lower bound by
  rank, and p. 2 for the upper bound);
- `commComplexity_disjointness`: `D(DISJ_n) = n + 1` (Lee–Shraibman, pp. 17–18, where the
  0–1 matrix of disjointness is the `n`-fold Kronecker power of a `2 × 2` matrix of rank `2`).

Route: the upper bound is 1.1 with `|X| = 2^n` and `Nat.clog 2 (2^n) = n`. For the lower bound,
the fooling sets of the first two Checks of 2.3 have `2^n` elements with `b = true`, and both
functions take the value `false` somewhere when `n ≥ 1`; the bullet of 2.3 gives
`2^n + 1 ≤ χ`. Then `2^n < χ ≤ 2^D` by 2.1, so `D ≥ n + 1`. The rank bound 2.2 gives the same
conclusion, through `rank I = 2^n` for equality and the Kronecker structure for disjointness.

**Checks.**
- `n = 0`: there is one string, both functions are constantly `true`, and the complexity is `0`,
  not `1`; this is why `n ≥ 1` is assumed.
- `n = 1, 2, 3`: a search over all protocols on all rectangles confirms the values `2, 3, 4` for
  both functions.
- The rank of the 0–1 matrix of disjointness is `2^n` and that of its negation is `2^n − 1` for
  `n ≤ 3`.

*Needs:* 1.1, 2.1, 2.3; Mathlib `Nat.clog`.

### Examples

Equality and disjointness of strings of length `1` to `3`; equality on a three-element set over
`ℝ` and over `𝔽₂`; the function `x && y`.

### Dependencies

Layer 1 (1.1, 1.3). Mathlib `Finpartition`, `Finpartition.card_bot`, `Nat.sInf_le`,
`Nat.sInf_mem`, `Nat.clog`, `Matrix.rank`, `Matrix.vecMulVec`, `Matrix.rank_vecMulVec_le`,
`Matrix.mulVecLin`, `LinearMap.rank_finsetSum_le`, `Finset.card_le_card_of_injOn`.

## Layer 3: discrepancy

### 3.1 Discrepancy

Define `boolSign b` (`−1` for `true`, `1` for `false`) and, for finite `X`, `Y` and a weighting
`μ`, `discrepancy μ f`: the largest value, over all pairs `(A, B)` of finite sets, of
`|∑_{x ∈ A, y ∈ B} μ(x, y) · boolSign (f x y)|`, written with `Finset.sup'` over the nonempty
finite set of such pairs (Lee–Shraibman, pp. 56–57; Bun, Definition 1, p. 1, in the equivalent form
`|μ(R ∩ f⁻¹(0)) − μ(R ∩ f⁻¹(1))|` for a probability distribution `μ`).

- The empty rectangle gives `0`, so the discrepancy is nonnegative.
- For a probability distribution it is at most `1`, and it is `1` for a constant function.

**Checks.**
- The function `x && y` on `Bool × Bool` under the uniform distribution: the whole square gives
  `|3 − 1| / 4 = 1/2`, and no rectangle gives more, so the discrepancy is `1/2`.
- The absolute value makes the definition independent of which bit has sign `−1`. Without it,
  the largest signed sum for `x && y` under the uniform distribution would be `1/2` with the
  convention here and `1/4` with the reversed one, attained at `{(true, true)}`.

*Needs:* Mathlib `Finset.sup'`, `Finset.le_sup'`.

### 3.2 The distributional bound

Prove `one_sub_two_mul_le_two_pow_depth_mul_discrepancy`: let `μ` be a weighting with
`∑ μ = 1` and `p` a protocol with outputs in `Bool`. If the weight of the set of pairs where
`Protocol.eval p` differs from `f` is at most `ε`, then `1 − 2ε ≤ 2^depth p · discrepancy μ f`
(Lee–Shraibman, derivation of Theorem 4.9, pp. 56–57, for a probability distribution and
`0 ≤ ε < 1/2`; Bun, Theorem 2, pp. 1–2, for a probability distribution). For `ε < 1/2` and positive discrepancy this reads
`depth p ≥ log₂ ((1 − 2ε)/disc_μ(f))`.

Route: the sum of `μ(x, y) · boolSign (Protocol.eval p x y) · boolSign (f x y)` over all pairs
is the weight where `p` agrees with `f` minus the weight where it does not, that is
`1 − 2·(weight of disagreement) ≥ 1 − 2ε`. Split the sum over the parts of the partition of 1.3:
on each part `Protocol.eval p` is constant, so the part contributes at most the absolute value
of its `μ`-weighted sum of signs of `f`, which is at most the discrepancy. There are at most
`2^depth p` parts.

- The route uses only `∑ μ = 1`, not the nonnegativity of `μ`, so the statement is made for all
  real weightings with total `1`.
- With `ε = 0` and `p` computing `f` it gives `1 ≤ 2^D(f) · disc_μ(f)`. The same argument run on
  a partition of `X × Y` into monochromatic rectangles, in place of the leaves, gives
  `1 ≤ χ(f) · disc_μ(f)`, which is Arora–Barak, Lemma 12.11, p. 12.5, for the uniform
  distribution.

**Checks.**
- The total weight `1` is needed: for `μ = 0` the discrepancy is `0`, and a protocol computing
  `f` exactly has `ε = 0`, while `1 ≤ 0` fails.
- `x && y` with the uniform distribution and the protocol of depth `0` answering `false`: it
  errs on weight `1/4`, and `1 − 1/2 = 1/2 = 2^0 · 1/2`, so the bound is attained.
- Random protocols of depth at most `3` on `3 × 3` inputs, with random weightings of total `1`
  including negative ones, satisfy the inequality with the exact error weight as `ε`.

*Needs:* 1.3, 3.1; Mathlib `Finset.sum_partition`, `Finset.abs_sum_le_sum_abs`,
`Finset.le_sup'`.

### 3.3 Public-coin protocols

Prove `one_sub_two_mul_le_two_pow_mul_discrepancy_of_publicCoin`: let `ps : ι → Protocol X Y Bool`
be a finite family of protocols of depth at most `d`, `w` a probability distribution on `ι`, and
suppose that for every input `(x, y)` the total weight of the `i` with `(ps i).eval x y ≠ f x y`
is at most `ε`. Then for every probability distribution `μ` on `X × Y`,
`1 − 2ε ≤ 2^d · discrepancy μ f` (Lee–Shraibman, pp. 41–42 for the public-coin model as a
probability distribution over deterministic protocols, and Theorem 4.9, p. 57; Bun, p. 1 and
Theorem 8, p. 6).

Route: let `e i` be the `μ`-weight of the pairs where `ps i` errs. By 3.2,
`1 − 2 e i ≤ 2^d · discrepancy μ f` for each `i`, since the depth is at most `d` and the
discrepancy is nonnegative. Multiply by `w i ≥ 0` and add: as `∑ w = 1`, the left side becomes
`1 − 2 ∑_i w i · e i`. Exchanging the sums, `∑_i w i · e i` is the `μ`-average of the error
probability at each pair, at most `ε` because `μ` is nonnegative with total `1`. Only this
averaging direction of Yao's principle is used; the minimax equality is not needed.

**Checks.**
- The nonnegativity of `w` is needed: on a one-point `X × Y` with `f = false`, two protocols of
  depth `0` answering `true` and `false` with weights `−1` and `2` have error weight `−1` at the
  only input, and `1 − 2·(−1) = 3 > 1 = 2^0 · 1`.
- The total weight of `w` is needed: with `X = Bool`, `Y` a point, `f x = x` and `μ` uniform,
  the discrepancy is `1/2`; the empty family has error weight `0` everywhere, and `1 ≤ 1/2`
  fails.
- A single protocol with weight `1` recovers 3.2 for probability distributions.

*Needs:* 3.2; Mathlib `Finset.sum_comm`, `Finset.sum_le_sum`.

### Examples

The function `x && y` under the uniform distribution, where 3.2 is attained by the constant
protocol `false`; the families of protocols of depth `0`.

### Dependencies

Layer 1 (1.3). Mathlib `Finset.sup'`, `Finset.le_sup'`, `Finset.sum_partition`,
`Finset.abs_sum_le_sum_abs`, `Finset.sum_comm`, `Finset.sum_le_sum`.

## Layer 4: the inner product function

### 4.1 The sign matrix is a Hadamard matrix

Define `innerProduct n x y`, true when the number of positions where both `x` and `y` are `true`
is odd. Prove `isHadamard_innerProduct`: the real matrix with entries
`boolSign (innerProduct n x y)`, indexed by `n`-bit strings, satisfies Mathlib's
`Matrix.IsHadamard`: its entries are `±1` and `H * Hᴴ = Hᴴ * H = 2^n • 1` (Lee–Shraibman, p. 23,
where it is the Sylvester matrix `H₁^⊗n`; Bun, Claim 4, p. 4).

Route: either by `Matrix.IsHadamard.kronecker` from the `2 × 2` case, after identifying strings
of length `n + 1` with pairs (`Matrix.isHadamard_submatrix_equiv_iff`), or directly: the entry
of `H * Hᵀ` at `(x, x')` is a sum over `y` of a product over positions, which factors by
`Finset.prod_univ_sum` into `∏_i (1 + s_i)` with `s_i = −1` exactly where `x i ≠ x' i`; then
`Matrix.isHadamard_iff_mul_conjTranspose` gives the second identity. Equivalently, that entry is
the sum over `y` of the additive character `y ↦ (−1)^⟨x + x', y⟩` of `(ZMod 2)ⁿ`, which Mathlib's
`AddChar.sum_eq_ite` evaluates as `2^n` or `0`; this orthogonality of characters is the library's,
and 4.1 is its form as a statement about the real matrix indexed by Boolean strings.

**Checks.**
- `n = 1`: in the order `false, true` the matrix is `[[1, 1], [1, −1]]`, and its square is
  `2 • 1`.
- `n = 0`: the matrix is `[[1]]`, Hadamard of order `1`.
- The 0–1 matrix of the inner product is not Hadamard: for `n = 1` it is `[[0, 0], [0, 1]]`.

*Needs:* Mathlib `Matrix.IsHadamard`, `Matrix.IsHadamard.kronecker`,
`Matrix.isHadamard_submatrix_equiv_iff`, `Matrix.isHadamard_iff_mul_conjTranspose`,
`Finset.prod_univ_sum`, `Unitary.mem_iff_eq_one_or_eq_neg_one`, `AddChar.sum_eq_ite`.

### 4.2 Lindsey's lemma

Prove `abs_sum_boolSign_innerProduct_le`: for all finite sets `A`, `B` of `n`-bit strings,
`|∑_{x ∈ A, y ∈ B} boolSign (innerProduct n x y)| ≤ √(|A| · |B| · 2^n)` (Bun, Lemma 5, p. 4,
stated as a bound on discrepancy; Arora–Barak, Example 12.14, pp. 12.5–12.6). The lemma is
Lindsey's; it is attributed here in prose.

Route: with `1_A`, `1_B` the indicator vectors, the sum is `1_A ⬝ᵥ (H *ᵥ 1_B)`. By Cauchy–Schwarz
(`Finset.sum_mul_sq_le_sq_mul_sq`) its square is at most `|A| · ‖H *ᵥ 1_B‖²`, and
`‖H *ᵥ 1_B‖² = 1_B ⬝ᵥ (Hᵀ * H) *ᵥ 1_B = 2^n |B|` by 4.1.

**Checks.**
- `n = 0`: `A = B` the one string gives `1 ≤ √1`, attained.
- Exhaustive search over all `A`, `B` for `n ≤ 3` finds no violation; the largest values of the
  absolute sum are `2`, `5` and `11` for `n = 1, 2, 3`.
- For `A` and `B` the whole cube the sum is `2^n` (only `x = 0` contributes a full row), well
  below the bound `2^(3n/2)` when `n ≥ 1`.

*Needs:* 4.1; Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`, `Matrix.dotProduct_mulVec`,
`Real.sqrt_le_sqrt`.

### 4.3 Discrepancy of the inner product and public-coin protocols

- `discrepancy_innerProduct_le`: under the uniform distribution, weight `1/4^n` on each pair, the
  discrepancy of `innerProduct n` is at most `1/√(2^n)`, that is `2^(−n/2)` (Bun, p. 4, after
  Lemma 5; Arora–Barak, Example 12.14, p. 12.6, whose last sentence omits the division by
  `2^(2n)`). The result is Chor and Goldreich's; it is
  attributed here in prose.
- `one_sub_two_mul_mul_sqrt_le_of_innerProduct`: if a probability distribution on a finite
  family of protocols of depth at most `d` errs with probability at most `ε` on every input of
  `innerProduct n`, then `(1 − 2ε) · √(2^n) ≤ 2^d` (Lee–Shraibman, Theorem 4.9, p. 57, applied
  with this discrepancy).

Route: by 4.2 every rectangle sum is at most `√(2^n · 2^n · 2^n) = 2^(3n/2)` in absolute value;
divide by `4^n`. The second statement is 3.3 with the uniform distribution and the first.

**Checks.**
- The exact uniform discrepancies are `1/2`, `5/16` and `11/64` for `n = 1, 2, 3`, below
  `0.707`, `0.5` and `0.354`.
- For `n = 2` and `d = 0` the second statement asks `ε ≥ 1/4`; a mixture of the two constant
  protocols has error probability `max(w_false, w_true) ≥ 1/2` at some input.
- The uniform weights add up to `2^n · 2^n / 4^n = 1`.

*Needs:* 3.1, 3.3, 4.2; Mathlib `Real.sqrt`, `Real.sqrt_le_sqrt`, `Finset.sup'_le`.

### 4.4 The inner product needs n + 1 bits

Prove `commComplexity_innerProduct`: `D(IP_n) = n + 1` for `n ≥ 1`. Lee–Shraibman, p. 23 and
its second footnote, derive the lower bound `n` from the sign matrix; the exact value is proved
here.

Route: the upper bound is 1.1. Over `ℝ` the 0–1 matrix of the inner product is `(J − H)/2` and
that of its negation is `(J + H)/2`, with `J` the all-ones matrix of rank `1` and `H` of rank
`2^n` by 4.1 (`Matrix.IsHadamard.det_ne_zero`). Subadditivity of rank gives rank at least
`2^n − 1` for each, so `χ ≥ 2^(n+1) − 2 > 2^n` for `n ≥ 2` by 2.2; for `n = 1` the function is
`x && y`, with ranks `1` and `2` and `3 > 2`. Then 2.1 gives `D ≥ n + 1`.

**Checks.**
- The ranks over `ℝ` are `2^n − 1` and `2^n` for `n = 1, 2, 3` (`1, 2`; `3, 4`; `7, 8`).
- `n = 0`: the inner product of the empty strings is `false`, a constant, of complexity `0`.
- A search over all protocols confirms `D = 2, 3, 4` for `n = 1, 2, 3`.

*Needs:* 1.1, 2.1, 2.2, 4.1; Mathlib `Matrix.IsHadamard.det_ne_zero`,
`Matrix.rank_of_det_ne_zero`, `Matrix.rank_vecMulVec_le`, `LinearMap.rank_finsetSum_le`.

### Examples

The Sylvester matrices of orders `1`, `2`, `4`, `8`; the exact discrepancies `1/2`, `5/16`,
`11/64`; the function `x && y` as the inner product of `1`-bit strings.

### Dependencies

Layer 1 (1.1), Layer 2 (2.1, 2.2), Layer 3 (3.1, 3.3). Mathlib `Matrix.IsHadamard`,
`Matrix.IsHadamard.kronecker`, `Matrix.isHadamard_submatrix_equiv_iff`,
`Matrix.isHadamard_iff_mul_conjTranspose`, `Matrix.IsHadamard.det_ne_zero`,
`Matrix.rank_of_det_ne_zero`, `Matrix.rank_vecMulVec_le`, `LinearMap.rank_finsetSum_le`,
`Finset.prod_univ_sum`, `Unitary.mem_iff_eq_one_or_eq_neg_one`, `AddChar.sum_eq_ite`,
`Finset.sum_mul_sq_le_sq_mul_sq`,
`Matrix.dotProduct_mulVec`, `Real.sqrt`, `Real.sqrt_le_sqrt`, `Finset.sup'_le`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: deterministic protocols as trees,
their transcripts and depth, the communication complexity, the rectangle property and the
partition of the inputs by the leaves, the partition number with the partition, rank and
fooling-set bounds, the exact values for equality, disjointness and the inner product,
discrepancy with the distributional and public-coin bounds, the Hadamard property of the sign
matrix of the inner product, and Lindsey's lemma with its consequence for discrepancy.

Already in the library and therefore not targets: matrix rank and its behaviour under products
and outer products (`Mathlib/LinearAlgebra/Matrix/Rank.lean`); the rank of a sum of linear maps
(`Mathlib/LinearAlgebra/Dimension/LinearMap.lean`); Hadamard matrices with their Kronecker
products, transposes and determinants (`Mathlib/LinearAlgebra/Matrix/HadamardMatrix.lean`),
of which 4.1 uses the definition and the closure under Kronecker products; finite partitions
(`Mathlib/Order/Partition/Finpartition.lean`). Neither Mathlib nor Tau Ceti has protocols,
combinatorial rectangles as such, or any statement of communication complexity at the pins.

Neighbouring roadmaps, none of them a supplier:

- BooleanFunctionAnalysis (an open roadmap, not on main) states, in its Layer 1, the Walsh
  characters of the cube `ι → ZMod 2`, the expansion of real functions in them and Plancherel's
  identity. In its notation the entry `boolSign (innerProduct n x y)` is the Walsh character of
  the support of `y` evaluated at `x`. The statements of 4.1 to 4.3 are about the matrix of these
  values on Boolean strings and sums over rectangles, which that roadmap does not state; 4.1 is
  read off Mathlib's Hadamard matrices or proved by a direct product formula, without its
  expansion. This roadmap does not depend on that one.
- LinearAlgebraMethodInCombinatorics (an open roadmap, not on main) uses rank to bound families
  of sets and, in its Layer 4, proves the Graham–Pollak theorem on decompositions of the edges of
  a complete graph into complete bipartite graphs. Those are symmetric decompositions of a
  graph, not partitions of a matrix into monochromatic rectangles; no statement is shared, and
  this roadmap does not depend on that one.
- Decision trees, query complexity, certificate complexity, sensitivity and the degree of
  Boolean functions are not treated here; no statement here concerns a single input queried bit
  by bit.

Outside the scope: randomized protocols beyond the public-coin model as a probability
distribution over deterministic protocols; private coins and Newman's theorem; the minimax
equality of Yao's principle; nondeterministic and multiparty protocols; the log-rank conjecture
and the bound of Aho, Ullman and Yannakakis; lower bounds for disjointness against randomized
protocols; norm-based bounds such as the trace and `γ₂` norms; information complexity and
lifting theorems; and every application to circuits, data structures or streaming.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Lattice/Nat.lean`: `Nat.sInf_le` (an element of a set of natural numbers is
  at least its infimum) and `Nat.sInf_mem` (a nonempty set of natural numbers contains its
  infimum).
- `Mathlib/Data/Nat/Log.lean`: `Nat.clog` (the ceiling of the logarithm) and `Nat.le_pow_clog`
  (for `1 < b`, `x ≤ b ^ Nat.clog b x`). `Mathlib/Data/Fintype/EquivFin.lean`:
  `Fintype.equivFin`.
- `Mathlib/Order/Partition/Finpartition.lean`: `Finpartition` (a set of nonempty, pairwise
  disjoint parts whose supremum is the given element) and `Finpartition.card_bot` (the
  partition into singletons of `s` has `|s|` parts). `Mathlib/Data/Finset/Prod.lean`:
  `Finset.product`, written `A ×ˢ B`.
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup'` (the supremum of a function over a
  nonempty finite set), `Finset.le_sup'` and `Finset.sup'_le`.
- `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.sum_partition` (a sum split
  over the classes of a setoid); `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`:
  `Finset.abs_sum_le_sum_abs`; `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean`:
  `Finset.sum_comm`; `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`:
  `Finset.sum_le_sum` (termwise comparison of finite sums); `Mathlib/Data/Finset/Card.lean`:
  `Finset.card_le_card_of_injOn`;
  `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Finset.prod_univ_sum` (a product of sums is
  the sum over choice functions of products).
- `Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`: `Finset.sum_mul_sq_le_sq_mul_sq`
  (Cauchy–Schwarz for finite sums in an ordered commutative semiring).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank` (the dimension of the range of
  `Matrix.mulVecLin`), `Matrix.rank_vecMulVec_le` (an outer product has rank at most `1`),
  `Matrix.rank_of_det_ne_zero` (over a domain, a square matrix with nonzero determinant has full
  rank).
  `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.mulVecLin`.
  `Mathlib/LinearAlgebra/Dimension/LinearMap.lean`: `LinearMap.rank_finsetSum_le` (the rank of a
  finite sum of linear maps over a ring with rank–nullity is at most the sum of the ranks).
  `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMulVec`, `Matrix.dotProduct_mulVec`.
- `Mathlib/LinearAlgebra/Matrix/HadamardMatrix.lean`: `Matrix.IsHadamard` (entries unitary,
  `A * Aᴴ = n • 1` and `Aᴴ * A = n • 1` with `n` the order), `Matrix.IsHadamard.kronecker` (the
  Kronecker product of Hadamard matrices is Hadamard), `Matrix.isHadamard_submatrix_equiv_iff`
  (invariance under reindexing), `Matrix.isHadamard_iff_mul_conjTranspose` (over a commutative
  ring in which the order is regular, the one-sided identity suffices),
  `Matrix.IsHadamard.det_ne_zero` (over a reduced commutative ring in which the order is
  nonzero, a Hadamard matrix has nonzero determinant).
  `Mathlib/Algebra/Star/Unitary.lean`: `Unitary.mem_iff_eq_one_or_eq_neg_one` (in a ring with
  trivial star and no zero divisors, the unitary elements are `1` and `−1`).
- `Mathlib/Algebra/Group/AddChar.lean`: `AddChar.sum_eq_ite` (over a finite additive group with
  values in a domain, the sum of a character is the order of the group for the trivial character
  and `0` otherwise).
- `Mathlib/Analysis/Real/Sqrt.lean`: `Real.sqrt` and `Real.sqrt_le_sqrt`.

### From Tau Ceti

Nothing is consumed from Tau Ceti.

## References

- Troy Lee and Adi Shraibman, *Lower Bounds in Communication Complexity*, Foundations and
  Trends in Theoretical Computer Science 3(4), 2009; the version on the second author's web page
  at the Academic College of Tel Aviv–Yaffo, with pages numbered from the introduction. The page
  numbers above are those of that version.
- Sanjeev Arora and Boaz Barak, *Computational Complexity: A Modern Approach*, draft of the book
  dated January 2007, from the authors' page at Princeton, Chapter 12; the page numbers above
  are the chapter-relative ones of that draft.
- Mark Bun, *Lecture Notes 5: Discrepancy*, course CAS CS 591 B, Communication Complexity,
  Boston University, Fall 2019, from the author's course page.
- Attributions made in prose without a locator: Andrew Chi-Chih Yao (the two-party model, 1979,
  and distributional complexity, 1983); Kurt Mehlhorn and Erik M. Schmidt (the rank bound,
  1982); J. H. Lindsey (Lindsey's lemma, as recorded by Erdős and Spencer, 1974); Benny Chor and
  Oded Goldreich (the discrepancy of the inner product, 1988); James Joseph Sylvester (the
  matrices `H₁^⊗n`, 1867); Eyal Kushilevitz and Noam Nisan, *Communication Complexity* (1997),
  the standard monograph.
