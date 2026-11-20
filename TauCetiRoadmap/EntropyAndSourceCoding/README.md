# Roadmap: entropy and source coding

**Summary.** This roadmap proves the basic theorems of Shannon's theory of lossless data
compression for finite sources, together with the entropy inequalities for families of random
variables that they and their combinatorial applications need. A source is a random variable with
values in a finite set, its entropy is measured in nats, and a code assigns to each value a word
over a finite alphabet of `D` letters. Every target is an equality or inequality about entropies,
probabilities, sets of words or codes; no procedure for constructing a code is a target, and in
particular the Huffman algorithm is not.

The headline theorems are these.

- *Shearer's lemma.* If every coordinate of a finite family of random variables lies in at least
  `k` of the sets `F₁, …, Fₘ`, then `k` times the entropy of the whole family is at most the sum
  of the entropies of the subfamilies indexed by the `Fⱼ`. In counting form, for `k ≥ 1`, a finite
  set `T` of families satisfies `|T|^k ≤ ∏ⱼ |Tⱼ|`, where `Tⱼ` is the set of restrictions of the
  members of `T` to `Fⱼ`.
- *Fano's inequality.* If `X` takes values in a set with `M` elements and `g(Y)` is any estimate
  of `X` from `Y`, with error probability `Pₑ`, then `H(X | Y) ≤ h(Pₑ) + Pₑ log(M − 1)`, where `h`
  is the binary entropy.
- *The source coding theorem for prefix codes.* Lengths `ℓ₁, …, ℓₘ` are the lengths of a prefix
  code over `D ≥ 1` letters whenever `∑ D^(−ℓᵢ) ≤ 1`. For `D ≥ 2` the least expected length `L*` of
  a prefix code for a source `X` satisfies `H(X) ≤ L* log D ≤ H(X) + log D`, the second inequality
  is strict when every value has positive probability, and uniquely decodable codes do no better
  than prefix codes. Over two letters, if `a ≠ b` are two values of least probability, then `L*`
  equals the least expected length for the source in which `b` is merged into `a`, plus the
  probabilities of `a` and `b`.
- *The asymptotic equipartition property.* For independent identically distributed letters with
  entropy `H` and `ε > 0`, the words of length `n` whose probability lies between `e^(−n(H+ε))` and
  `e^(−n(H−ε))` number at most `e^(n(H+ε))`, carry probability tending to `1`, and eventually
  number at least `(1 − δ) e^(n(H−ε))` for every `δ > 0`. For `0 < δ < 1`, the smallest set of words
  of probability at least `1 − δ` has `e^(n(H + o(1)))` elements, and the least expected length per
  letter of a prefix code for blocks of `n` letters tends to `H / log D`.

The entropy and conditional entropy of a variable with finitely many values, the chain rule, the
bound by the logarithm of the number of values, additivity for independent variables and the
nonnegativity of mutual information come from the roadmap ProbabilisticAndMetricNumberTheory.
Mathlib supplies prefix-free and uniquely decodable sets of words with the Kraft and Kraft–McMillan
inequalities, the binary entropy function, independence and the strong law of large numbers.

## How to read the build

Layer 1 below proves submodularity of entropy, Shearer's lemma in both forms, and Fano's
inequality; it uses no other layer. Layer 2 proves the converse of Kraft's inequality, the entropy
bounds on the optimal expected length, the comparison with uniquely decodable codes, and the
sibling property and merge identity for binary codes; from Layer 1 it uses only the definition of
entropy. Layer 3 treats independent identically distributed sources: typical sets, smallest sets of
high probability and block codes. It uses the definitions and the relabelling statement of 1.1,
and its last section uses 2.2.

## Conventions

- **Labels and entropy.** `(Ω, μ)` is a probability space. A source, or label, is a measurable map
  `X : Ω → A` into a finite type with a measurable space in which singletons are measurable, and
  `μ.real (X ⁻¹' {a})` is the probability that `X = a`. Its entropy is `labelEntropy μ X`, the sum
  of `Real.negMulLog (μ.real (X ⁻¹' {a}))` over `a`, and the conditional entropy is
  `condLabelEntropy μ X Y`, the sum over `a, b` of `p_ab · log (p_b / p_ab)` with
  `p_ab = μ (X = a, Y = b)` and `p_b = μ (Y = b)`. These are the finite-label entropy and
  conditional entropy of ProbabilisticAndMetricNumberTheory §5.1a, copied into `Suggested.lean`
  with that citation; values of probability zero contribute `0` through Mathlib's conventions
  `log 0 = 0` and division by zero.
- **Logarithms.** Logarithms are natural. Base-`D` quantities appear as `L* · log D`, so that a
  fair bit has entropy `log 2` and its optimal binary code has length `1`.
- **Families of labels.** For a family `X i : Ω → A i` indexed by a type `ι` with decidable
  equality and a finite set `S` of indices, `subLabel X S` is the joint label `ω ↦ (X i ω)_{i ∈ S}`
  with values in `(i : S) → A i`. For `S = ∅` it has one value, so its entropy is `0`.
- **Words and codes.** The code alphabet is a finite type `α` with `D = Fintype.card α` letters;
  words are `List α`. A code for a source with values in `ι` is a map `c : ι → List α`. A prefix
  code is `IsPrefixCode c`: `c` is injective and its set of codewords is prefix-free in Mathlib's
  sense `InformationTheory.IsPrefixFree`, where distinct codewords are never prefixes of each
  other. The empty word is allowed: `{[]}` is prefix-free, so a source with one value has a prefix
  code of length `0`, and a set of at least two codewords never contains the empty word. Unique
  decodability is Mathlib's `InformationTheory.IsUniquelyDecodable`, which excludes the empty
  word.
- **Expected and optimal length.** `expectedLength μ X c` is the sum over `a` of
  `μ (X = a) · |c a|`, and `minExpectedLength μ X α` is the infimum `L*` of the expected lengths of
  prefix codes over `α`. For `D ≥ 2` prefix codes exist and the infimum is attained (2.2); for
  `D = 1` and at least two values there is none, and the real infimum of the empty set is `0`, so
  the statements of 2.2, 2.4 and 3.3 about `L*` assume `D ≥ 2`. The comparison 2.3 assumes only
  `D ≥ 1`: for `D = 1` and at least two values no injective code is uniquely decodable either,
  since two distinct words over one letter commute under concatenation.
- **Memoryless sources.** A memoryless source is a sequence `X : ℕ → Ω → ι` of measurable labels
  that are independent (Mathlib `ProbabilityTheory.iIndepFun`) and each distributed as `X 0`
  (Mathlib `ProbabilityTheory.IdentDistrib`). `blockLabel X n` is the label
  `ω ↦ (X 0 ω, …, X (n − 1) ω)` with values in `Fin n → ι`, and `H` is `labelEntropy μ (X 0)`.

## Layer 1: entropy of families of labels

### 1.1 Joint labels and submodularity

Define `labelEntropy` and `condLabelEntropy` as in the conventions (copied from
ProbabilisticAndMetricNumberTheory §5.1a) and `subLabel X S` as the joint label of the members of
the family indexed by `S`. Prove `labelEntropy_subLabel_union_add_inter_le`: for a family of
measurable labels into finite types and finite sets `S`, `T` of indices,

`H(X_(S ∪ T)) + H(X_(S ∩ T)) ≤ H(X_S) + H(X_T)`

(Polyanskiy–Wu, Theorem 1.6, p. 16).

API, proved here:

- Relabelling: if `f` is injective on the values of `X`, then `H(f ∘ X) = H(X)`; in particular the
  joint label of a family does not depend on how its index set is listed.
- Nonnegativity of conditional entropy: each term of `H(X | Y)` is `p_ab log (p_b / p_ab) ≥ 0`,
  since `p_ab ≤ p_b`.
- Monotonicity: `H(X_S) ≤ H(X_T)` for `S ⊆ T`, by the chain rule and nonnegativity of conditional
  entropy.
- Conditioning on more reduces entropy: `H(X | (Y, Z)) ≤ H(X | Y)` for labels `X`, `Y`, `Z`.
- Conditional entropy as an average: `H(X | Y)` is the sum, over the values `b` with
  `μ (Y = b) > 0`, of `μ (Y = b)` times the entropy of `X` under the conditional probability
  `μ[· | Y = b]`, since `μ (X = a | Y = b) = p_ab / p_b`.

Route: write `A`, `B`, `C` for the joint labels of `S \ T`, `S ∩ T`, `T \ S`. By relabelling the
claim is `H(A, B, C) + H(B) ≤ H(A, B) + H(B, C)`, and by the chain rule it is
`H((A, C) | B) ≤ H(A | B) + H(C | B)`. For each value `b` with `μ (B = b) > 0`, apply the
subadditivity `H(A, C) ≤ H(A) + H(C)` (nonnegativity of mutual information) under the conditional
measure `μ[· | B = b]`, and average with weights `μ (B = b)`, using that `H(X | B)` is the average
of the entropies of `X` under these conditional measures.

**Checks.**
- For a fair bit `X₁` and `X₂ = X₁`, with `S = {1}` and `T = {2}`, the left side is
  `log 2 + 0` and the right side `2 log 2`: the inequality is strict, so the reverse inequality
  (supermodularity) is false.
- For two independent fair bits and the same `S`, `T`, both sides are `2 log 2`.
- For `S ⊆ T` both sides are `H(X_T) + H(X_S)`.

*Needs:* ProbabilisticAndMetricNumberTheory §5.1a (finite-label entropy, conditional entropy and
the chain rule) and §5.2 (finite mutual information and its nonnegativity); Mathlib
`Real.negMulLog`, `ProbabilityTheory.cond`.

### 1.2 Shearer's lemma

Let `X` be a family of measurable labels into finite types indexed by a finite type `ι`, let
`F₁, …, Fₘ` be finite sets of indices, and let `k` be a natural number such that every index lies
in at least `k` of the `Fⱼ`.

- `mul_labelEntropy_le_sum_labelEntropy_subLabel`: `k · H(X) ≤ ∑ⱼ H(X_(Fⱼ))`, where `X` is the
  joint label of the whole family (Polyanskiy–Wu, Theorem 1.8 in the form (1.18), p. 18; Galvin,
  Lemma 2.8, p. 5).
- `card_pow_le_prod_card_image_restrict`: for `k ≥ 1`, any index type with decidable equality and
  any types `A i` with decidable equality, every finite set `T` of families `(i : ι) → A i`
  satisfies `|T|^k ≤ ∏ⱼ |{x restricted to Fⱼ : x ∈ T}|` (Galvin, Lemma 2.9, p. 6, for families of
  subsets of `[n]`, that is `A i` with two elements; the proof given there applies to any `A i`).

Route: for the entropy form, argue by uncrossing (the roadmap's own route; Galvin's proof of
Lemma 2.8 goes through the chain rule with dropped conditioning instead). Replacing two sets
`Fⱼ`, `Fₗ` that are not comparable by `Fⱼ ∪ Fₗ` and `Fⱼ ∩ Fₗ` keeps every count of sets containing
an index, does not increase the right side by 1.1, and decreases the number of incomparable pairs;
when the sets form a chain, either some index lies in no set, so that `k = 0`, or `k` is at most
the number of sets equal to `ι`, and monotonicity (1.1) bounds the other terms below by `0`. For the
counting form, note first that `k ≥ 1` puts every index in some `Fⱼ`, so the index type is
finite; put the uniform probability on `T`, replace each `A i` by the finite set of values
at `i` of the members of `T`, and let `X` be the identity: `H(X) = log |T|`, and the restriction to
`Fⱼ` is a label into the finite set `Tⱼ`, so its entropy is at most `log |Tⱼ|`; apply the entropy
form and exponentiate.

**Checks.**
- Han's inequality is the case `Fⱼ = ι \ {j}` with `k = |ι| − 1`: for three variables,
  `2 H(X₁, X₂, X₃) ≤ H(X₁, X₂) + H(X₁, X₃) + H(X₂, X₃)`. For `X` uniform on the four binary words
  of length `3` with an even number of ones, the two sides are `4 log 2` and `6 log 2`; for `X`
  uniform on all eight words both are `6 log 2`.
- Subadditivity is the case of the singletons with `k = 1`.
- The counting form with the three coordinate planes of the cube `{0, 1}³` and `T` the whole cube
  reads `8² ≤ 4 · 4 · 4`, with equality.
- The hypothesis `k ≥ 1` is needed in the counting form: with `k = 0`, `T` empty and a single set
  `F₁`, the left side is `0^0 = 1` and the right side is `0`.

*Needs:* 1.1; ProbabilisticAndMetricNumberTheory §5.1a (the bound of the entropy by the logarithm
of the number of values; the entropy `log |T|` of a uniform label is computed directly); Mathlib
`Finset.restrict`, `ProbabilityTheory.uniformOn`.

### 1.3 Fano's inequality

Prove `condLabelEntropy_le_binEntropy_add_mul_log`: let `X : Ω → A` and `Y : Ω → B` be measurable
labels into finite types, `g : B → A` any map and `Pₑ = μ (g(Y) ≠ X)`. Then

`H(X | Y) ≤ h(Pₑ) + Pₑ · log (|A| − 1)`,

where `h` is Mathlib's `Real.binEntropy`, `h(p) = p log p⁻¹ + (1 − p) log (1 − p)⁻¹`
(Polyanskiy–Wu, Theorem 3.12, inequality (3.18), p. 57, there for randomized estimates). For
`|A| = 1` the last term is `Pₑ · log 0 = 0`, and indeed `Pₑ = 0` and `H(X | Y) = 0`.

Route: let `E` be the indicator of `g(Y) ≠ X`. Then `H(X | Y) ≤ H((X, E) | Y) = H(E | Y) +
H(X | (E, Y))` by the chain rule, `H(E | Y) ≤ H(E) = h(Pₑ)` by nonnegativity of mutual
information, and given `E = 0` and `Y = y` the label `X` equals `g(y)`, while given `E = 1` and
`Y = y` it takes values in `A \ {g(y)}`, so the alphabet bound gives
`H(X | (E, Y)) ≤ Pₑ log (|A| − 1)`.

**Checks.**
- Equality: for `X` uniform on three values, `Y` constant and `g` constant, `H(X | Y) = log 3`,
  `Pₑ = 2/3` and `h(2/3) + (2/3) log 2 = log 3 ≈ 1.0986`. Without the term `Pₑ log (|A| − 1)` the
  right side would be `h(2/3) ≈ 0.6365 < log 3`.
- For `|A| = 2` the inequality reads `H(X | Y) ≤ h(Pₑ)`; for `Pₑ = 0` it gives `H(X | Y) = 0`.

*Needs:* 1.1; ProbabilisticAndMetricNumberTheory §5.1a (chain rule, alphabet bound) and §5.2
(nonnegativity of mutual information); Mathlib `Real.binEntropy`, `Real.negMulLog`.

### Examples

The uniform law on the even-weight binary words of length three for Han's inequality; the cube
`{0, 1}³` and its three coordinate planes for the counting form of Shearer's lemma; a uniform
variable on three values with a constant estimate, which attains Fano's inequality.

### Dependencies

ProbabilisticAndMetricNumberTheory §5.1a and §5.2; Mathlib `Real.negMulLog`, `Real.binEntropy`,
`ProbabilityTheory.cond`, `ProbabilityTheory.uniformOn`, `Finset.restrict`. No other layer.

## Layer 2: prefix codes and the optimal expected length

### 2.1 Prefix codes and the converse of Kraft's inequality

Define `IsPrefixCode c` for `c : ι → List α`: `c` is injective and its set of codewords is
prefix-free. Prove `exists_isPrefixCode_length_eq`: for a finite type `ι`, a nonempty finite code
alphabet `α` with `D` letters and lengths `ℓ : ι → ℕ` with `∑ᵢ (1/D)^(ℓ i) ≤ 1`, there is a prefix
code `c` with `|c i| = ℓ i` for every `i` (Gallager, Theorem 2.3.1, p. 22, for `D = 2`;
Polyanskiy–Wu, Theorem 10.9, part 2, pp. 207–208, for `D = 2` and countable alphabets).

Route: list the symbols by increasing length and give the `i`-th symbol the first `ℓᵢ` digits of
the base-`D` expansion of `∑_(j < i) D^(−ℓⱼ)`, which is less than `1`; two such words cannot be
prefixes of each other because the partial sums differ by at least `D^(−ℓᵢ)`. For `D = 1` the
hypothesis allows at most one symbol.

The direct inequality, that the lengths of a prefix-free or uniquely decodable set of words have
Kraft sum at most `1`, is Mathlib's.

**Checks.**
- Binary lengths `(1, 2, 2)` have Kraft sum `1` and are the lengths of `{0, 10, 11}`; lengths
  `(1, 1, 2)` have Kraft sum `5/4` and are the lengths of no prefix code.
- A single length `0` gives the code `{[]}`; two lengths `0` and `1` have Kraft sum `3/2`.
- The alphabet must be nonempty: over an empty alphabet `1/D` is `1/0 = 0`, so two symbols with
  length `1` have Kraft sum `0`, but there is no word of length `1`.

*Needs:* Mathlib `InformationTheory.IsPrefixFree`. (Proved here, following the cited proof.)

### 2.2 Optimal expected length and the entropy bounds

Define `expectedLength μ X c` and `minExpectedLength μ X α` as in the conventions. Let `X` be a
measurable label into a finite type and `α` a code alphabet with `D ≥ 2` letters.

- The infimum `L*` is attained: some prefix code has expected length `L*`.
- `labelEntropy_le_log_mul_minExpectedLength`: `H(X) ≤ L* log D ≤ H(X) + log D` (Polyanskiy–Wu,
  Theorem 10.10, p. 209, for `D = 2`).
- `log_mul_minExpectedLength_lt`: if every value of `X` has positive probability, then
  `L* log D < H(X) + log D` (Gallager, Theorem 2.5.1, p. 28, for `D = 2`, where every symbol has
  positive probability by the standing assumption on p. 26).

Route: for the lower bound, a prefix code has Kraft sum at most `1` (Mathlib), and Jensen's
inequality for the concave logarithm with weights `μ (X = a)` over the values of positive
probability gives `H(X) − log D · ∑ μ (X = a) |c a| ≤ log ∑ D^(−|c a|) ≤ 0`. For the upper bounds,
take the lengths `⌈− log_D μ (X = a)⌉` on the values of positive probability; their Kraft sum is at
most `1`, and their expected length is less than `H(X)/log D + 1`, which proves the strict bound
by 2.1 when every value has positive probability. Otherwise the values of probability zero need
room: if the Kraft sum is less than `1` they get long enough words, and if it equals `1`, every
positive probability is a power of `D⁻¹`, the expected length is exactly `H(X)/log D`, and adding
one letter to a longest word of positive probability `p ≤ 1` costs `p` and frees room for them.
Attainment holds because only finitely many choices of lengths on the values of positive
probability give expected length below that of a fixed code.

**Checks.**
- Binary codes for `(1/2, 1/4, 1/4)`: `L* = 3/2` and `L* log 2 = H`, with the code `{0, 10, 11}`.
  For the uniform law on three values, `L* = 5/3` over two letters (`L* log 2 ≈ 1.1552`,
  `H = log 3 ≈ 1.0986`, `H + log 2 ≈ 1.7918`) and `L* = 1` over three letters, where
  `L* log 3 = H`.
- One value: `L* = 0` through the empty codeword, and `H = 0`. If the empty word were excluded,
  `L*` would be `1 = H/log D + 1` and the strict bound would fail.
- Positive probabilities are needed for the strict bound: for the law `(1, 0)` over two letters a
  prefix code for two values has no empty codeword, so `L* = 1` and `L* log 2 = H + log 2`.
- With a value of probability zero and no such equality: for `(1/2, 1/2, 0)` over two letters,
  `L* = 3/2` (lengths `1, 2, 2`), above the value `1` that the two values of positive probability
  alone would need; `L* log 2 ≈ 1.0397 < H + log 2 ≈ 1.3863`.

*Needs:* 1.1 (the definition of `labelEntropy`), 2.1; Mathlib
`InformationTheory.IsPrefixFree.finsetSum_one_div_card_pow_length_le_one`,
`ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`, `Nat.ceil`. (Proved here, following the cited
proofs.)

### 2.3 Uniquely decodable codes

Prove `minExpectedLength_le_expectedLength`: for a nonempty finite code alphabet and every
injective `c : ι → List α` whose set of codewords is uniquely decodable,
`L* ≤ expectedLength μ X c`. The statement uses only that the weights `μ.real (X ⁻¹' {a})` are
nonnegative, so it holds for every measure `μ` and every map `X`. With 2.2, for a measurable label
on a probability space and `D ≥ 2`, every such code has `H(X) ≤ log D · expectedLength μ X c`
(Polyanskiy–Wu, Remark 10.4, p. 208).

Route: by Kraft–McMillan (Mathlib) the lengths of `c` have Kraft sum at most `1`, the sum over the
codewords being the sum over the symbols by injectivity; 2.1 gives a prefix code with the same
lengths and so the same expected length.

**Checks.**
- The binary code `{0, 01, 011}` is uniquely decodable and not prefix-free; for `(1/2, 1/4, 1/4)`
  its expected length is `7/4 ≥ L* = 3/2`.
- Unique decodability is needed: the code `{0, 1, 10}` is injective and not uniquely decodable
  (`1` followed by `0` is `10`), and for the uniform law on three values its expected length
  `4/3` is less than `L* = 5/3`.
- Injectivity is needed: sending three equally likely values to the word `0` gives a uniquely
  decodable set `{0}` and expected length `1 < 5/3`.

*Needs:* 2.1; Mathlib `InformationTheory.IsUniquelyDecodable`,
`InformationTheory.IsUniquelyDecodable.finsetSum_one_div_card_pow_length_le_one`. (Proved here.)

### 2.4 Binary codes: siblings and the merge identity

Let `α` have exactly two letters, and let `a ≠ b` be values of `X` of least probability: every
other value `c` has `μ (X = a) ≤ μ (X = c)` and `μ (X = b) ≤ μ (X = c)`.

- `exists_isPrefixCode_optimal_siblings`: some optimal prefix code `c` (expected length `L*`) has
  `c a = w ++ [x]` and `c b = w ++ [y]` with `x ≠ y`, and no codeword longer than `c b`
  (Gallager, Lemma 2.5.4, p. 31). As in 2.3, only the nonnegativity of the weights is used, so the
  statement holds for every measure and every map `X`.
- Define `mergeLabel X hab : Ω → {c // c ≠ b}`, equal to `a` where `X = b` and to `X` elsewhere.
  `minExpectedLength_eq_minExpectedLength_mergeLabel_add`: for a probability measure and measurable
  `X`, `L*(X) = L*(mergeLabel X hab) + μ (X = a) + μ (X = b)` (Gallager, §2.5.3, p. 32, the identity
  stated after Figure 2.13).

Route: the sibling property is the exchange argument of the cited proof (Gallager, Lemmas 2.5.1 to
2.5.3, pp. 30–31, where every symbol has positive probability). Among the optimal codes take one
of least total codeword length; in it a longest codeword has its sibling as a codeword, since
otherwise it could be shortened without increasing the expected length. (The choice matters when
a value has probability zero: for `(1/2, 1/2, 0)` the code `0, 10, 110` is optimal and the
sibling `111` of its longest codeword is not a codeword.) Swapping codewords between a value of
least probability and a value of larger probability with a longer codeword does not increase the
expected length. For the
merge identity, a prefix code for the merged label with codeword `w` at `a` extends to a prefix
code for `X` with `w ++ [x]` at `a` and `w ++ [y]` at `b`, adding `μ (X = a) + μ (X = b)` to the
expected length. Conversely, in the code of the sibling property the only words extending `w` that
can be codewords are `w ++ [x]` and `w ++ [y]`, since the alphabet has two letters and no codeword
is longer, so replacing them by `w` gives a prefix code for the merged label. Iterating the
identity computes `L*` as the sum of the probabilities created by successive merges.

**Checks.**
- For `(0.4, 0.3, 0.2, 0.1)`: `L* = 1.9` with lengths `1, 2, 3, 3`; merging the two least likely
  gives `(0.4, 0.3, 0.3)` with `L* = 1.6`, and `1.6 + 0.3 = 1.9`.
- Two values: the merged source has one value and `L* = 0` by the empty codeword, so the identity
  gives `L* = 1`. If the empty word were excluded the merged value would be `1` and the identity
  would fail.
- A value of probability zero: for `(1/2, 1/2, 0)`, with `a` a value of probability `1/2` and `b`
  the value of probability `0`, the merged law `(1/2, 1/2)` has `L* = 1` and the identity gives
  `3/2`, the value of 2.2.
- The least-probability hypothesis is needed: merging the values of probability `1/2` and `1/4`
  in `(1/2, 1/4, 1/4)` gives `(3/4, 1/4)` with `L* = 1`, and `1 + 3/4 = 7/4 ≠ 3/2`.
- For four equally likely values every pair is a least pair; the code `{00, 01, 10, 11}` has
  `00` and `11` not siblings, but relabelling it gives an optimal code in which any chosen pair is.

*Needs:* 2.1, 2.2. (Proved here, following the cited proofs.)

### Examples

The binary codes for `(1/2, 1/4, 1/4)` and for the uniform law on three values, the degenerate laws
`(1)`, `(1, 0)` and `(1/2, 1/2, 0)`, and the four-value law `(0.4, 0.3, 0.2, 0.1)` with its merges.

### Dependencies

1.1 (the definition of `labelEntropy` only); Mathlib `InformationTheory.IsPrefixFree`,
`InformationTheory.IsUniquelyDecodable`, Kraft's and the Kraft–McMillan inequality,
`ConcaveOn.le_map_sum`, `strictConcaveOn_log_Ioi`, `Nat.ceil`. No other layer.

## Layer 3: memoryless sources

### 3.1 Typical sets and the asymptotic equipartition property

Define `blockLabel X n` and `typicalSet μ X₀ ε n`, the finite set of words `x : Fin n → ι` with

`exp (−n (H + ε)) ≤ ∏ᵢ μ (X₀ = x i) ≤ exp (−n (H − ε))`,

where `H = labelEntropy μ X₀` (Gallager, (2.25), p. 39, with strict inequalities and base `2`).

- `card_typicalSet_le`: for a measurable label `X₀` on a probability space, every `ε` and every
  `n`, the typical set has at most `exp (n (H + ε))` words.
- `tendsto_measureReal_typicalSet`: for a memoryless source and `ε > 0`, the probability that
  `blockLabel X n` lies in `typicalSet μ (X 0) ε n` tends to `1`.
- `eventually_card_typicalSet_ge`: for a memoryless source, `ε > 0` and `δ > 0`, the typical set
  eventually has at least `(1 − δ) exp (n (H − ε))` words.

(Gallager, Theorem 2.7.1, p. 40, and the estimates (2.26) before it.)

Route: the probability that `blockLabel X n = x` is `∏ᵢ μ (X 0 = x i)`, by independence and
identical distribution. Summing over all words gives `(∑ₐ μ (X 0 = a))^n = 1`, and every typical
word contributes at least `exp (−n (H + ε))`, which gives the first bound. The variables
`Zᵢ = −log μ (X 0 = Xᵢ)` are independent, identically distributed and bounded, with mean `H`; the
strong law of large numbers and the passage from almost sure convergence to convergence in
probability show that `|n⁻¹ ∑_(i < n) Zᵢ − H| ≤ ε` with probability tending to `1`. On that event,
outside the null event that some `Xᵢ` takes a value of probability zero, the block is typical. The
third bound follows, since each typical word has probability at most `exp (−n (H − ε))`.

**Checks.**
- For the law `(3/4, 1/4)`, `H ≈ 0.5623`, `ε = 0.1` and `n = 10`, the typical words are those with
  two or three letters of probability `1/4`: there are `45 + 120 = 165` of them, of total
  probability `≈ 0.5318`, and `exp (10 · 0.6623) ≈ 752.5`. For `n = 1` and `n = 2` the typical set
  is empty, so the lower bound holds only eventually.
- Words containing a value of probability zero are never typical, since their probability `0` is
  below `exp (−n (H + ε))`. A definition through the sample average `−n⁻¹ ∑ᵢ log μ (X 0 = x i)`
  with Lean's `log 0 = 0` would get this wrong: for the law `(1, 0)` every word would be typical,
  and there are `2^n > exp (n ε)` of them for `ε < log 2`.
- For a constant source `H = 0` and the typical set is the single constant word.

*Needs:* 1.1 (the definition of `labelEntropy`); Mathlib `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.iIndepFun.measure_inter_preimage_eq_mul`, `ProbabilityTheory.IdentDistrib`,
`ProbabilityTheory.IdentDistrib.measure_mem_eq`, `ProbabilityTheory.IdentDistrib.comp`,
`ProbabilityTheory.iIndepFun.indepFun`, `ProbabilityTheory.IndepFun.comp`,
`ProbabilityTheory.strong_law_ae`, `MeasureTheory.tendstoInMeasure_of_tendsto_ae`,
`Finset.prod_univ_sum`. (Proved here, following the cited proof.)

### 3.2 Smallest sets of high probability

Prove `eventually_exists_card_le_and_forall_card_ge`: for a memoryless source, `0 < δ < 1` and
`ε > 0`, for all large `n` some set of at most `exp (n (H + ε))` words of length `n` has
probability at least `1 − δ`, and every set of words of probability at least `1 − δ` has at least
`exp (n (H − ε))` elements. Equivalently, `n⁻¹ log` of the size of a smallest set of probability at
least `1 − δ` tends to `H` (MacKay, Theorem 4.1, p. 78, with the smallest `δ`-sufficient subset
and essential bit content of (4.18) and (4.19), p. 75; Gallager, Theorem 2.7.3, p. 41).

Route: the typical set with parameter `ε` serves for the first part, by 3.1. For the second, let
`B` have probability at least `1 − δ`; by 3.1 with `ε/2` the set `B` meets the typical set in
probability at least `(1 − δ)/2` for large `n`, and each typical word has probability at most
`exp (−n (H − ε/2))`, so `|B| ≥ ((1 − δ)/2) exp (n (H − ε/2)) ≥ exp (n (H − ε))` for large `n`.

**Checks.**
- The bound `δ < 1` is needed: for `δ = 1` the empty set has probability at least `0`.
- For the uniform law on `m` values every word has probability `m^(−n)`, a smallest set of
  probability at least `1 − δ` has `⌈(1 − δ) m^n⌉` words, and `n⁻¹ log ⌈(1 − δ) m^n⌉ → log m = H`.
- For a constant source `H = 0` and a single word suffices for every `n`.

*Needs:* 3.1. (Proved here.)

### 3.3 Block codes

Prove `tendsto_minExpectedLength_blockLabel_div`: for a memoryless source and a code alphabet with
`D ≥ 2` letters, the optimal expected length of prefix codes for `blockLabel X n`, divided by `n`,
tends to `H / log D` (Gallager, Theorem 2.6.1, p. 36, for `D = 2`).

Route: by independence `H(blockLabel X n) = n H`, from the additivity for independent labels by
induction on `n`, with relabelling (1.1). By 2.2,
`n H ≤ L*ₙ log D ≤ n H + log D`; divide by `n log D`.

**Checks.**
- For the law `(3/4, 1/4)` over two letters, `H/log 2 ≈ 0.8113`; `L*₁ = 1` and `L*₂ = 27/16`, so
  `L*₂ / 2 ≈ 0.8438`, within `1/2` of `0.8113`.
- For the uniform law on `D` values and a code alphabet of `D` letters, `L*ₙ = n` and
  `H / log D = 1` for every `n`.

*Needs:* 1.1, 2.2; ProbabilisticAndMetricNumberTheory §5.1a (additivity of entropy for independent
labels); Mathlib `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.IdentDistrib.measure_mem_eq` (each letter has the entropy of `X 0`). (Proved
here, following the cited proof.)

### Examples

The law `(3/4, 1/4)` with `ε = 0.1` and `n = 10` for typical sets, and with blocks of two letters
for block codes; uniform and constant sources for smallest sets.

### Dependencies

1.1 (definitions and relabelling), 2.2; ProbabilisticAndMetricNumberTheory §5.1a; Mathlib
`ProbabilityTheory.iIndepFun`, `ProbabilityTheory.IdentDistrib`,
`ProbabilityTheory.IdentDistrib.measure_mem_eq`, `ProbabilityTheory.IdentDistrib.comp`,
`ProbabilityTheory.iIndepFun.measure_inter_preimage_eq_mul`,
`ProbabilityTheory.iIndepFun.indepFun`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.IndepFun.comp`, `ProbabilityTheory.strong_law_ae`,
`MeasureTheory.tendstoInMeasure_of_tendsto_ae`, `Finset.prod_univ_sum`.

## Scope and ownership

This roadmap owns the statements above: submodularity of the entropy of subfamilies, Shearer's
lemma in its entropy and counting forms, Fano's inequality in conditional-entropy form; prefix
codes, the converse of Kraft's inequality, the optimal expected length with its entropy bounds, the
comparison with uniquely decodable codes, the sibling property and the merge identity for binary
codes; typical sets, the asymptotic equipartition property for memoryless sources, smallest sets of
high probability and the source coding theorem for blocks.

Already in the libraries and therefore not targets:

- Prefix-free and uniquely decodable sets of words, the fact that a prefix-free set without the
  empty word is uniquely decodable, Kraft's inequality and the Kraft–McMillan inequality
  (`Mathlib/InformationTheory/Coding/`).
- The binary entropy function and the function `x ↦ −x log x` with its concavity
  (`Mathlib/Analysis/SpecialFunctions/`); Kullback–Leibler divergence (Mathlib's
  `InformationTheory.klDiv` and Tau Ceti's `TauCeti/InformationTheory/KullbackLeibler/`), which no
  statement here uses; Tau Ceti's von Neumann entropy (`TauCeti/Analysis/Matrix/Entropy.lean`),
  outside the scope.
- Two subadditivity statements of Tau Ceti that are close to, but not, the label form used here:
  for a real transport plan `f` with marginals `μ` and `ν` (probability vectors on finite types),
  `TauCeti.relEntropy_vecMulVec_nonneg_of_mem_realPlans` and
  `TauCeti.relEntropy_vecMulVec_eq_of_mem_realPlans`
  (`TauCeti/MeasureTheory/OptimalTransport/Finite/Entropy.lean`) together give
  `∑ negMulLog f ≤ ∑ negMulLog μ + ∑ negMulLog ν`, and
  `Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft`
  (`TauCeti/Analysis/Matrix/Entropy.lean`) is subadditivity of the von Neumann entropy of a
  bipartite density matrix. Neither is stated for labels on a probability space, and neither is
  strong subadditivity; 1.1 takes subadditivity for labels from the roadmap on main named below.

Stated by roadmaps on main and consumed here:

- ProbabilisticAndMetricNumberTheory §5.1a defines the entropy and the conditional entropy of a
  label with finitely many values and proves the chain rule, the bounds `0 ≤ H(X) ≤ log |A|` and
  additivity for independent labels; the paragraph on finite mutual information in its §5.2 proves
  that mutual information is nonnegative, that is `H(X | Y) ≤ H(X)` and
  `H(X, Y) ≤ H(X) + H(Y)`. None of these is restated; the two definitions are copied into
  `Suggested.lean` with that citation.
- GeometryOfNumbersAndQuadraticArithmetic §4.2 owns the entropy of labels with countably many
  values and measure-theoretic entropy; nothing here concerns them.
- MathematicalStatisticsNonparametric §2.4 owns Fano's method: a lower bound on the error of
  estimating a uniformly distributed index from an observation, in terms of the mutual information
  written as an average Kullback–Leibler divergence. 1.3 is a different statement: an upper bound
  on the conditional entropy of an arbitrary label in terms of the error probability of an
  arbitrary estimate. Neither is used for the other.

Different statements in open roadmaps (not on main); this roadmap does not depend on any of them:

- ArithmeticDynamics §2.7 (an open roadmap, not on main) states the Shannon–McMillan–Breiman
  theorem for finite partitions of measure-preserving maps, and ClassicalErgodicTheory (an open
  roadmap, not on main) states an amenable form. Applied to a Bernoulli shift, these give the
  almost sure convergence of `−n⁻¹ log` of the probability of the first `n` letters. 3.1 and 3.2
  are statements about the counting and the probability of typical and high-probability sets for
  independent identically distributed labels on any probability space, proved from the strong law
  of large numbers. ClassicalErgodicTheory §4.6 also states strong subadditivity and a finite-set
  Shearer inequality for the window labels of a group action, the translates of one label with
  countably many values of finite entropy; 1.1 and 1.2 here are for an arbitrary finite family of
  finite-valued labels, and contain the finite-valued case of that statement.
- MeansMajorizationAndDiscreteInequalities §5.4 (an open roadmap, not on main) defines the entropy
  of a vector and proves its Schur-concavity and its maximum at the uniform vector; nothing here
  uses or restates them.
- ComparisonSortingAndSelection §1.3 (an open roadmap, not on main) proves, through Kraft's
  inequality for comparison trees, that the total cost over `|A|` rankings is at least
  `|A| log₂ |A|`. Read through the prefix code formed by the branches of the tree, that bound is the
  case of the uniform law and `D = 2` of the lower bound in 2.2; it is stated there for comparison
  trees, and neither roadmap depends on the other.

Outside the scope: channel coding and capacity; rate–distortion theory; universal, arithmetic and
Lempel–Ziv coding and every coding procedure; sources with memory, entropy rates and the
Shannon–McMillan–Breiman theorem; differential entropy; Rényi entropies; Huffman codes over
alphabets of more than two letters; non-Shannon information inequalities; quantum entropy.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`: `Real.negMulLog` (`x ↦ −x log x`).
  `Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`: `Real.binEntropy`
  (`p log p⁻¹ + (1 − p) log (1 − p)⁻¹`).
- `Mathlib/InformationTheory/Coding/PrefixFree.lean`: `InformationTheory.IsPrefixFree` (distinct
  members are never prefixes of each other).
  `Mathlib/InformationTheory/Coding/UniquelyDecodable.lean`: `InformationTheory.IsUniquelyDecodable`
  (distinct lists of codewords have distinct concatenations).
  `Mathlib/InformationTheory/Coding/Kraft.lean`:
  `InformationTheory.IsPrefixFree.finsetSum_one_div_card_pow_length_le_one` (a finite prefix-free
  set over a nonempty finite alphabet has Kraft sum at most `1`).
  `Mathlib/InformationTheory/Coding/KraftMcMillan.lean`:
  `InformationTheory.IsUniquelyDecodable.finsetSum_one_div_card_pow_length_le_one` (the same for a
  finite uniquely decodable set).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConcaveOn.le_map_sum` (Jensen's inequality for finite
  sums). `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi`.
  `Mathlib/Algebra/Order/Floor/Defs.lean`: `Nat.ceil`.
- `Mathlib/Data/Finset/Pi.lean`: `Finset.restrict` (restriction of a family to a finite set of
  indices). `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Finset.prod_univ_sum` (a product of
  sums over a finite type is a sum of products).
- `Mathlib/Probability/ConditionalProbability.lean`: `ProbabilityTheory.cond` (the conditional
  measure `μ[· | s]`). `Mathlib/Probability/UniformOn.lean`: `ProbabilityTheory.uniformOn` (the
  uniform probability on a finite set).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun` (mutual
  independence of a family of random variables),
  `ProbabilityTheory.iIndepFun.measure_inter_preimage_eq_mul` (the probability of an intersection
  of preimages of measurable sets is the product), `ProbabilityTheory.iIndepFun.indepFun` (two
  members of an independent family are independent), `ProbabilityTheory.iIndepFun.indepFun_finset`
  (the subfamilies on disjoint finite sets of measurable variables are independent),
  `ProbabilityTheory.IndepFun.comp` (independence is preserved by measurable maps).
  `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib` (equality of laws),
  `ProbabilityTheory.IdentDistrib.measure_mem_eq` (the two laws agree on measurable sets) and
  `ProbabilityTheory.IdentDistrib.comp` (equality of laws is preserved by measurable maps).
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (for pairwise
  independent identically distributed integrable variables, the averages converge almost surely to
  the mean). `Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`:
  `MeasureTheory.tendstoInMeasure_of_tendsto_ae` (on a finite measure, almost sure convergence of
  almost everywhere strongly measurable functions implies convergence in measure).

### From Tau Ceti

Nothing is consumed.

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

- §5.1a: the finite-label entropy and conditional entropy (copied as `labelEntropy` and
  `condLabelEntropy`), the chain rule `H((X, Y)) = H(Y) + H(X | Y)` (its target
  labelEntropy_pair_eq_add), the bounds `0 ≤ H(X) ≤ log |A|` for a nonempty alphabet (its target
  labelEntropy_nonneg_le_log_card), and `H((X, Y)) = H(X) + H(Y)` for independent labels (its target
  labelEntropy_pair_of_indepFun). These are stated for measurable labels into finite types on a
  probability space with natural logarithms, as here.
- §5.2, the paragraph defining finite mutual information `I(X, Y) = H(X) + H(Y) − H((X, Y))`: it
  is nonnegative and equals `H(X) − H(X | Y)`.

## References

- Yury Polyanskiy and Yihong Wu, *Information Theory: From Coding to Learning*, prepublication
  version of 16 August 2024 (730 pages), free to view and download from the first author's page at
  MIT; the theorem, equation and page numbers above are those of that version.
- Robert G. Gallager, *Principles of Digital Communication I*, course notes for MIT 6.450, Fall
  2006, Chapter 2, "Coding for discrete sources", MIT OpenCourseWare; the page numbers above are
  the printed ones of that chapter.
- David J. C. MacKay, *Information Theory, Inference, and Learning Algorithms*, Cambridge
  University Press, 2003, the edition viewable on the author's page.
- David Galvin, *Three tutorial lectures on entropy and counting*, arXiv:1406.7872v1, 2014.
- Attributions made in prose without a locator: Claude E. Shannon (entropy, the source coding
  theorem and the asymptotic equipartition property, 1948); Leon G. Kraft (1949) and Brockway
  McMillan (1956) for the two Kraft inequalities and the converse; David A. Huffman (1952) for
  optimal codes; Robert M. Fano (his inequality, 1961); F. R. K. Chung, R. L. Graham, P. Frankl and
  J. B. Shearer (Shearer's lemma, 1986); Te Sun Han (1978) for Han's inequality.
