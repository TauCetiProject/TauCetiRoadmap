# Roadmap: combinatorics of words

**Summary.** This roadmap develops the basic structure theory of finite words: borders and
the failure function as a function on words, Lyndon words and the Chen–Fox–Lyndon
factorization, the number of Lyndon words of each length, and the de Bruijn sequence obtained by
concatenating Lyndon words. A word is a finite list over an alphabet; borders need no structure
on the alphabet, Lyndon words need a linear order on it, and the counting and de Bruijn
statements take the alphabet `{0, …, k − 1}`. Words are compared lexicographically, a proper
prefix of a word coming before the word. Every target is a theorem about words; no procedure, and
no running time, is a target.

The headline theorems are these.

- *Borders of borders.* The borders of a nonempty word, the words that are at once a proper
  prefix and a suffix of it, are exactly the borders obtained by iterating the failure function
  (the map sending a word to its longest border) from the word itself; and the failure function of
  `wa` is one more than the length of the longest border `u` of `w` that is followed in `w` by the
  letter `a`, or `0` if there is none.
- *Lyndon words.* A nonempty word strictly smaller than all its nonempty proper suffixes is
  equivalently a word strictly smaller than all its nontrivial rotations, and equivalently one with
  `u < v` for every splitting into two nonempty words `uv`. If `u < v` are Lyndon words, so is
  `uv`; a Lyndon word of length at least two splits as `uv` with `v` its smallest nonempty
  proper suffix, and then `u` and `v` are Lyndon words with `u < uv < v`.
- *The Chen–Fox–Lyndon theorem.* Every word is, in exactly one way, a product `ℓ₁ ⋯ ℓₘ` of Lyndon
  words with `ℓ₁ ≥ ⋯ ≥ ℓₘ`.
- *Counting and de Bruijn sequences.* For `n ≥ 1` the words of length `n` on `k` letters are the
  `|ℓ|` distinct rotations of the powers `ℓ^(n/|ℓ|)`, over the Lyndon words `ℓ` whose length
  divides `n`, each word arising once, so that the numbers `L(k, d)` of Lyndon words of length
  `d` satisfy `∑_{d ∣ n} d · L(k, d) = kⁿ`; by Möbius inversion,
  `L(k, n) = (1/n) ∑_{d ∣ n} μ(d) k^(n/d)`. The concatenation, in increasing order, of the Lyndon
  words on `k` letters whose length divides `n` is a de Bruijn sequence of order `n`: a
  word of length `kⁿ` in which every word of length `n` occurs exactly once as a cyclic factor
  (Fredricksen and Maiorana).

The roadmap builds on Mathlib's lists, which supply prefixes, suffixes, rotations, the
lexicographic order and periods of words with the Fine–Wilf theorem, and on Mathlib's Möbius
inversion. DirectedMatrixTreeAndBEST counts the de Bruijn sequences through the BEST theorem; this
roadmap uses its notion of a de Bruijn sequence and gives one explicitly.

## How to read the build

Layer 1 below treats borders and the failure function and depends on no other layer.
Layer 2 defines Lyndon words, proves their characterizations, the product rule and the standard
factorization; it depends on no other layer. Layer 3 proves the Chen–Fox–Lyndon theorem from
Layer 2. Layer 4 counts Lyndon words; it uses Layer 2 and Mathlib's Fine–Wilf theorem. Layer 5
proves the Fredricksen–Maiorana theorem from Layers 2 and 4.

## Conventions

- **Words.** A word over an alphabet `α` is a `List α`; `|w|` is its length, `uv` is `u ++ v`, and
  `wⁱ` is the concatenation of `i` copies of `w`. A prefix and a suffix are Mathlib's `<+:` and
  `<:+`; `w.take i` and `w.drop i` are the prefix of length `i` and the suffix after it. The
  rotation `w.rotate i` moves the first `i mod |w|` letters to the end. Positions are numbered from
  `0`.
- **Order.** Over a linearly ordered alphabet, words carry Mathlib's linear order on `List α`, the
  lexicographic order in which `[] < a :: v` and `a :: u < b :: v` when `a < b`, or when `a = b`
  and `u < v`. A proper prefix of a word is smaller than the word.
  - Check: `[0] < [0, 1] < [1]`. Under the length-first order (shorter words first), `[1]` would
    come before `[0, 1]`, and the word `01`, a Lyndon word below, would not be one, since its
    suffix `1` would be smaller.
- **Borders.** A border of `w` is a word that is a prefix and a suffix of `w` and is shorter than
  `w`; the empty word is a border of every nonempty word, and the empty word has no border. The
  prefix of length `i` is a border of `w` exactly when `i < |w|` and `w.take i <:+ w`.
- **Periods.** A period of `w` is Mathlib's `List.HasPeriod w p`, `w <+: w.take p ++ w`, which says
  that `w[i] = w[i + p]` whenever `i + p < |w|` (`List.hasPeriod_iff_getElem?`). Every `p ≥ |w|`,
  and `p = 0`, is a period. Since `w = w.take p ++ w.drop p`, the definition says exactly that
  `w.drop p` is a prefix of `w`; Mathlib states one direction as `List.HasPeriod.drop_prefix`. So
  for `0 < p < |w|`, `p` is a period exactly when `w` has a border of length `|w| − p`.
  - Check: `w = 0100101001`, `|w| = 10`: the borders have lengths `0, 2, 5`, and the periods below
    `10` that are positive are `5` and `8`, that is `10 − 5` and `10 − 2`.
- **Alphabets of size `k`.** For counting and de Bruijn sequences the alphabet is `Fin k` with its
  natural order, and the words of length `d` are the `List.ofFn f` for `f : Fin d → Fin k`. The
  case `k = 0` is allowed: there is then no nonempty word.

## Layer 1: borders and the failure function

### 1.1 The failure function and the borders of borders

Define `borderLength w`, the failure function: the largest `i < |w|` such that `w.take i` is a
suffix of `w`, that is, the length of the longest border of `w`; it is `0` for the empty word (the
supremum of the empty set of natural numbers). The failure function of a pattern `P` in the
string-matching literature is the sequence of the values of `borderLength` on the prefixes of `P`
(Erickson, §7.6, p. 8, defines `fail[j]` as one more than the length of the longest border of the
prefix of length `j − 1`, and `fail[1] = 0`).

Prove `take_isSuffix_iff_exists_iterate`: let `w` be nonempty and let
`f j = borderLength (w.take j)`. A natural number `i` is the length of a border of `w` if and
only if `i = f^[c] |w|` for some `c ≥ 1`. So the borders of `w` are its longest border, the
longest border of that border, and so on down to the empty word (Erickson, §7.6, p. 10, states
this with a sketch). (Proved here.)

Route: the prefixes of `w` that are suffixes of a border of `w` are borders of `w`, so every value
`f^[c] |w|` with `c ≥ 1` is a border length; the values decrease strictly while positive and then
stay at `0`, which they reach after at most `|w|` steps. Conversely let `i` be a border length. If
`i = 0`, take any `c ≥ 1` at which the values have reached `0`. If `i > 0`, let `c` be the
largest index with `f^[c] |w| ≥ i`; it exists because `f^[0] |w| = |w| > i` and the values reach
`0 < i`. If
`f^[c] |w| > i`, then `w.take i` is a border of `w.take (f^[c] |w|)`, since the shorter of two
suffixes of `w` is a suffix of the longer, so `f^[c + 1] |w| ≥ i`, against the choice of `c`.
Hence `f^[c] |w| = i`, and `c ≥ 1`.

**Checks.**
- On `0100101001` the iterates are `5, 2, 0, 0, …`, and the border lengths are `0, 2, 5`.
- On the prefixes of `0010001` of lengths `1` to `7` the failure function takes the values
  `0, 1, 0, 1, 2, 2, 3`, and the border lengths of `0010001` are `0` and `3`, the iterates being
  `3, 0, 0, …`. By Erickson's definition, his `fail[2], …, fail[7]` for this word are the values
  on the prefixes of lengths `1` to `6` plus one: `1, 2, 1, 2, 3, 3`.
- The hypothesis `w ≠ []` is needed: the empty word has no border, while
  `f^[1] 0 = borderLength [] = 0`.

*Needs:* Mathlib `List.take`, `List.IsSuffix`, `Finset.sup`, `Nat.iterate`.

### 1.2 The failure-function recurrence

Prove `borderLength_append_singleton`: for every word `w` and letter `a`, `borderLength (w ++ [a])`
is the largest `i + 1` over the border lengths `i` of `w` with `w[i] = a`, and `0` when there is no
such `i` (Erickson, §7.6, p. 10, gives this recursion for `fail`). Together with 1.1, the
candidates `i` are the iterates `f^[c] |w|`, tried from the largest down. (Proved here.)

Route: a nonempty border of `wa` has the form `ua`, and since it is shorter than `wa`, `u` is
shorter than `w`; then `u = w.take |u|` is a suffix of `w`, so a border of `w`, and the letter of
`w` after `u` is `a`. Conversely, if `u = w.take i` is a border of `w` with `i < |w|` and
`w[i] = a`, then `w.take (i + 1) = ua` is a suffix of `wa` of length `i + 1 < |wa|`.

**Checks.**
- `w = 0100101001`: appending `0` gives `borderLength = 6` (the border `01001` of `w` is followed
  by `0`), and appending `1` gives `0`, since the letters of `w` after its borders of lengths `0`,
  `2`, `5` are all `0`.
- `w = 00100`: appending `0` gives `2`; the longest border `00` is followed by `1`, and the next
  border `0` by `0`.
- The empty word: `borderLength [a] = 0`, and the right side is the supremum of the empty set.

*Needs:* 1.1; Mathlib `List.take_append_of_le_length`, `List.IsSuffix`, `Finset.sup`.

### Examples

The words `0100101001`, `0010001` and `00100` in the Checks above; every word of length at most
`7` on at most three letters satisfies 1.1 and 1.2 by direct computation.

### Dependencies

Mathlib's lists, `Finset.sup` and iteration. No other layer.

## Layer 2: Lyndon words

The alphabet `α` is linearly ordered throughout this layer and the next.

### 2.1 Lyndon words and their characterizations

Define `IsLyndon w`: `w` is nonempty and `w < w.drop i` for every `0 < i < |w|`, that is, `w` is
strictly smaller than each of its nonempty proper suffixes (Grinberg–Reiner, Definition 6.1.13,
p. 167).

- `isLyndon_iff_lt_rotate`: `w` is a Lyndon word if and only if it is nonempty and
  `w < w.rotate i` for every `0 < i < |w|`, that is, `uv < vu` whenever `w = uv` with `u` and `v`
  nonempty (Grinberg–Reiner, Theorem 6.1.20, assertions A and D, pp. 169–170).
- `isLyndon_iff_take_lt_drop`: `w` is a Lyndon word if and only if it is nonempty and
  `w.take i < w.drop i` for every `0 < i < |w|` (Grinberg–Reiner, Theorem 6.1.20, assertions A and
  C, pp. 169–170).

Route: the implications from the definition use only that a nonempty suffix `v` of `w = uv`
satisfies `v ≥ w > u` and that `vu > v` (Proposition 6.1.14, p. 167). For the converses, take the
smallest nonempty suffix `v` of a word `w = uv` that is not Lyndon; then `u` is nonempty, `u ≥ v`
and `uv ≥ vu` (Proposition 6.1.19, p. 169), which contradicts assertions C and D.

**Checks.**
- `001`, `0011`, `0010111` and `01011` are Lyndon words; `00`, `0101` and `0110` are not.
- Strictness matters in both characterizations: `0101` is smaller than or equal to each of its
  rotations (it equals its rotation by `2`), and `00` has `w.take 1 ≤ w.drop 1`, but neither is a
  Lyndon word.
- A Lyndon word has no nonempty border (Layer 5 uses this): a nonempty border would be a
  proper suffix, hence larger than `w`, and a prefix, hence not larger. The word `0110` has border
  `0` and is not Lyndon.

*Needs:* Mathlib `List.rotate`, `List.drop`, `List.take`, the linear order on `List α`
(`Mathlib/Data/List/Lex.lean`).

### 2.2 Products of Lyndon words

Prove `IsLyndon.append`: if `u` and `v` are Lyndon words with `u < v`, then `uv` is a Lyndon word
(Grinberg–Reiner, Proposition 6.1.16(a), pp. 167–168).

**Checks.**
- `0 < 01` gives the Lyndon word `001`, and `01 < 011` gives `01011`.
- The hypothesis `u < v` is needed: `1 > 0` and `10` is not Lyndon; `0 = 0` and `00` is not.
  Among Lyndon words of length at most `4` on three letters, `uv` is Lyndon exactly when `u < v`.

*Needs:* 2.1 (the definition); the linear order on `List α`.

### 2.3 The standard factorization

Prove `IsLyndon.standard_factorization`: let `w` be a Lyndon word and `w = uv` with `u` and `v`
nonempty, where `v` is the smallest nonempty proper suffix of `w`. Then `u` and `v` are Lyndon
words and `u < w < v` (Grinberg–Reiner, Theorem 6.1.30, pp. 172–173). Such a splitting exists
exactly when `|w| ≥ 2`, and `v` is then unique.

**Checks.**
- `01011 = 01 · 011`: the nonempty proper suffixes are `1011, 011, 11, 1`, the smallest is `011`,
  and `01 < 01011 < 011`.
- `0010111 = 0 · 010111`, with both factors Lyndon.
- Every Lyndon word of length `2` to `7` on at most three letters satisfies the statement.
- Both parts must be nonempty: for `w = 0`, the splittings `[] · 0` and `0 · []` satisfy the
  minimality condition (there is no nonempty proper suffix), and `[]` is not a Lyndon word.

*Needs:* 2.1; the linear order on `List α`.

### Examples

The Lyndon words of length `n` on `{0, 1}` for `n = 1, …, 5`: `0, 1`; `01`; `001, 011`;
`0001, 0011, 0111`; `00001, 00011, 00101, 00111, 01011, 01111`.

### Dependencies

Mathlib's lists, rotations and the lexicographic order. No other layer.

## Layer 3: the Chen–Fox–Lyndon factorization

### 3.1 Existence and uniqueness

Define `IsCFLFactorization w l` for a list `l` of words: every entry of `l` is a Lyndon word, the
entries are in nonincreasing order (`l.Pairwise (· ≥ ·)`), and their concatenation is `w`
(Grinberg–Reiner, Definition 6.1.25, p. 170). Prove `existsUnique_isCFLFactorization`: every
word has exactly one Chen–Fox–Lyndon factorization (Grinberg–Reiner, Theorem 6.1.27, p. 171,
proved on pp. 171–172). The empty word has the empty factorization.

Route: existence: among the factorizations of `w` into Lyndon words, which exist since letters are
Lyndon words, take one with fewest factors; two adjacent factors `ℓᵢ < ℓᵢ₊₁` would merge into one
by 2.2. Uniqueness: in a factorization `ℓ₁ ≥ ⋯ ≥ ℓₘ` of a nonempty word, every nonempty suffix of
`w` is at least `ℓₘ` (Lemma 6.1.28, p. 171), so the last factor of any two factorizations is the
same word, the smallest nonempty suffix of `w`; cancel it and induct on `|w|`.

**Checks.**
- `1011010010 = 1 · 011 · 01 · 001 · 0`, `0110100110 = 011 · 01 · 0011 · 0`, and
  `2120102 = 2 · 12 · 0102` over `{0, 1, 2}`.
- The last factor is the smallest nonempty suffix: for `1011010010` it is `0`.
- With nondecreasing order in place of nonincreasing, uniqueness fails: `0 · 1` and `01` are both
  factorizations of `01` into Lyndon words in nondecreasing order.
- By enumeration of all factorizations, every word of length at most `7` on at most three letters
  has exactly one.

*Needs:* 2.1, 2.2; Mathlib `List.flatten`, `List.Pairwise`.

### Examples

The factorizations in the Checks above.

### Dependencies

Layer 2 (2.1 and 2.2).

## Layer 4: counting Lyndon words

The alphabet is `Fin k`, and `L(k, d)` denotes the number of Lyndon words of length `d`, that is,
`Nat.card {f : Fin d → Fin k // IsLyndon (List.ofFn f)}`.

### 4.1 Words as rotations of powers of Lyndon words, and the number of Lyndon words

Prove `sum_divisors_mul_card_lyndon`: for `n ≥ 1`, `∑_{d ∣ n} d · L(k, d) = kⁿ`. (Proved here;
Grinberg–Reiner, Exercise 6.1.34(c), (e), pp. 174–175, poses the underlying bijection between
Lyndon words and aperiodic necklaces as an exercise.)

By Möbius inversion this identity, for all `n ≥ 1`, is equivalent to
`n · L(k, n) = ∑_{d ∣ n} μ(d) k^(n/d)` in the integers for all `n ≥ 1`, which counts the Lyndon
words (Grinberg–Reiner, Exercise 6.1.29, p. 172, states it as an exercise and notes that it
appears in the paper of Chen, Fox and Lyndon). The passage is Mathlib's
`ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` with `f d = d · L(k, d)` and `g n = kⁿ`,
followed by `Nat.sum_divisorsAntidiagonal` to write the sum over pairs `(d, n/d)` as a sum over
divisors; it takes a few lines, so it is not stated as a separate target.

Route. Call a nonempty word primitive if it is not `tᵐ` with `m ≥ 2`.

- (a) For a nonempty word `t`, every `m` and every `i`, `(tᵐ).rotate i = (t.rotate i)ᵐ`.
- (b) Every nonempty word is `tᵐ` with `t` primitive, and `t` is unique. Existence: take for `t`
  the shortest prefix of which the word is a power. Uniqueness: let `tᵃ = sᵇ` with `t`, `s`
  primitive. If `a = 1`, primitivity of `t` gives `b = 1`; likewise if `b = 1`. If `a, b ≥ 2`, the
  word has the periods `|t|` and `|s|` and length at least `|t| + |s|`, so by the Fine–Wilf theorem
  (`List.HasPeriod.gcd`) it has the period `g = gcd(|t|, |s|)`; as `g` divides `|t|`, `t` is a
  power of its prefix of length `g`, so `g = |t|`, and likewise `g = |s|`; then `t` and `s` are
  the prefix of the same length.
- (c) The rotations `t.rotate i`, `0 ≤ i < |t|`, of a primitive word are distinct. Otherwise
  `t.rotate r = t` for some `0 < r < |t|`; writing `t = xy` with `|x| = r` gives `xy = yx` with `x`
  and `y` nonempty, so `x` and `y` are powers of one word (Grinberg–Reiner, Proposition 6.1.4,
  p. 165), and `t` is a power with exponent at least two.
- (d) A Lyndon word is primitive, since `t^m` with `m ≥ 2` equals its own rotation by `|t|`,
  against 2.1. A rotation of a primitive word is primitive, by (a). A primitive word that is
  smaller than or equal to all its rotations is a Lyndon word, by (c) and 2.1.
- The map `(ℓ, i) ↦ (ℓ^(n/|ℓ|)).rotate i`, over Lyndon words `ℓ` with `|ℓ|` dividing `n` and
  `0 ≤ i < |ℓ|`, is a bijection onto the words of length `n`. Injective: the image is
  `(ℓ.rotate i)^(n/|ℓ|)` with `ℓ.rotate i` primitive, so by (b) equal images give
  `ℓ.rotate i = ℓ'.rotate i'`; then `ℓ'` is a rotation of `ℓ`, and two Lyndon words that are
  rotations of each other are equal, each being strictly smaller than its other rotations (2.1);
  finally `i = i'` by (c). Surjective: write a word of length `n` as `tᵃ` with `t` primitive by
  (b), let `ℓ` be the smallest rotation of `t`, a Lyndon word by (d), and `t = ℓ.rotate j` for some
  `j < |ℓ|`; then the word is `(ℓᵃ).rotate j` by (a). Counting the domain gives the identity.

**Checks.**
- `k = 2`, `n = 6`: `1 · 2 + 2 · 1 + 3 · 2 + 6 · 9 = 64`.
- `k = 0`: both sides are `0`. `k = 1`: only `[0]` is a Lyndon word, and both sides are `1`.
- The hypothesis `n ≥ 1` is needed: for `n = 0` the sum is empty, `0`, while `k⁰ = 1`.
- The bijection, and the identity, hold by enumeration for `k ≤ 3`, `n ≤ 6`.
- The Möbius form: for `k = 2`, `L = 2, 1, 2, 3, 6, 9, 18, 30` for `n = 1, …, 8`, and for
  `n = 6`, `(64 − 8 − 4 + 2)/6 = 9`; for `k = 3`, `L = 3, 3, 8, 18, 48, 116` for `n = 1, …, 6`;
  for `k = 0` both sides are `0` for every `n ≥ 1`, every term `μ(d) · 0^(n/d)` vanishing because
  `n/d ≥ 1`.

*Needs:* 2.1; Mathlib `List.HasPeriod.gcd`, `List.rotate`, `List.ofFn`, `Nat.divisors`,
`Nat.card`; Grinberg–Reiner Proposition 6.1.4 (proved here as a step). For the Möbius form:
`ArithmeticFunction.moebius`, `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`,
`Nat.sum_divisorsAntidiagonal`.

### Examples

The tables of `L(2, n)` and `L(3, n)` in the Checks above.

### Dependencies

Layer 2 (2.1); Mathlib's Fine–Wilf theorem and Möbius inversion.

## Layer 5: the Fredricksen–Maiorana de Bruijn word

### 5.1 The Fredricksen–Maiorana theorem

Define `IsDeBruijn k n s` for `s : Fin (kⁿ) → Fin k` exactly as DirectedMatrixTreeAndBEST 5.2
does (copied verbatim): every word `u : Fin n → Fin k` occurs at exactly one position `i`, in the
sense that `s ((i + j) mod kⁿ) = u j` for every `j < n`. Define `fkmWord k n`, the
Fredricksen–Maiorana word: the concatenation, in increasing lexicographic order, of the Lyndon
words on `Fin k` whose length divides `n`.

Prove `isDeBruijn_fkmWord`: for `n ≥ 1`, `fkmWord k n` has length `kⁿ` and, read as a function on
`Fin (kⁿ)`, is a de Bruijn sequence of order `n` on `k` letters (Sawada, Williams and Wong,
Theorem 4, p. 14, applied to the set of all words of length `n`; this set satisfies their closure
conditions by their Definition 3, p. 8, and Lemma 1, p. 6). (Proved here, along the lines of their
proof, pp. 12–15.)

Route. The length is `∑_{d ∣ n} d · L(k, d) = kⁿ` by 4.1. For `k = 0` there is no word of
length `n`, so there is nothing more to prove. For `k = 1` the only Lyndon word is `0`, so
`fkmWord 1 n = 0`, of length `1 = 1ⁿ`, and the only word of length `n`, `0ⁿ`, occurs at the only
position. Let `k ≥ 2`, and let `K = k − 1` be the largest letter. Since the word has length `kⁿ`,
it suffices that every word of length `n` occurs at some position, read cyclically: a map onto
from the `kⁿ` positions to the `kⁿ` words is one to one, which is the uniqueness in `IsDeBruijn`.
A necklace is a word of length `n` that is smallest among its rotations, and its aperiodic prefix
is its primitive root (4.1(b)).

(a) The word as a concatenation over necklaces. Sawada, Williams and Wong state without proof
(pp. 2–3) that the word is the concatenation, over the necklaces in increasing order, of their
aperiodic prefixes; this is proved as follows.

- The aperiodic prefix of a necklace `α` of length `n` is its primitive root `t` (4.1(b)), with
  `α = t^(n/|t|)`; `t` is smaller than or equal to its rotations, because the rotations of `α` are
  the powers `(t.rotate i)^(n/|t|)` and two powers with the same exponent of words of the same
  length compare as the words do; so `t` is a Lyndon word by 4.1(d). Conversely, for a Lyndon word
  `ℓ` with `|ℓ|` dividing `n`, `ℓ^(n/|ℓ|)` is a necklace whose aperiodic prefix is `ℓ`. So the
  aperiodic prefixes of the necklaces of length `n` are exactly the Lyndon words whose length
  divides `n`, each once.
- For Lyndon words `u`, `v` with lengths dividing `n`, `u < v` if and only if
  `u^(n/|u|) < v^(n/|v|)`. If neither is a prefix of the other, both sides are decided at the first
  difference of `u` and `v`. If `u` is a proper prefix of `v`, write `v = uʳz` with `r ≥ 1` largest;
  `z` is nonempty, because `v` is primitive and `v ≠ u`; `z` is not a prefix of `u`, because a
  Lyndon word has no nonempty border (2.1); and `u` is not a prefix of `z`, by the choice of `r`.
  So `z` and `u` first differ at a position `q < min(|z|, |u|)`, and `v < z` (a proper suffix of
  the Lyndon word `v`) gives `u[q] < z[q]`. Then `u^(n/|u|)` and `v^(n/|v|)` agree before position
  `r|u| + q < |v| ≤ n` and differ there as `u[q] < z[q]`. As both orders are linear and equal
  powers have equal roots by 4.1(b), the equivalence follows. So increasing order of the necklaces
  is increasing order of their aperiodic prefixes.

So `fkmWord k n = W`, where `W = ap(α₁) ⋯ ap(α_m)` for the necklaces `α₁ < ⋯ < α_m`, `ap` denotes
the aperiodic prefix, and the block of `αᵢ` is the factor `ap(αᵢ)` of `W`. Here `α₁ = 0ⁿ` and
`α_m = Kⁿ`.

(b) An extension lemma. The first letter of a necklace, and of a Lyndon word, is its smallest
letter, since a rotation, or a suffix, starting with a smaller letter would be smaller. Let `u`
be a Lyndon word, `m ≥ 0`, `u'` a proper prefix of `u` followed in `u` by the letter `c`, and
`z > c` a letter; then `B = uᵐu'z` is a Lyndon word. Let `S` be a nonempty proper suffix of
`B`. If `S = uᵐ'u'z` with `m' < m`, then `S` and `B` agree on `uᵐ'u'`, after which `B` has `c`
and `S` has `z`. If `S` starts inside a copy of `u` in `uᵐ`, at a position other than its first,
then `S` begins with a proper nonempty suffix `s` of `u`; `s > u`, and `s` is not a prefix of
`u` (2.1: no nonempty border), so `s` exceeds `u`, and hence `S` exceeds `B`, at a position
inside `s`. Otherwise `S = sz` with `s` the suffix of `u'` after its first `o ≥ 1` letters; as
`|s| < |u'|`, the first `|s| + 1` letters of `B` are those of `u`, also when `m = 0`; the suffix
of `u` after its first `o` letters is `sc⋯`, larger than `u` and not a prefix of it, so it exceeds
`u` at some position `h`; if `h` lies inside `s`, then `S` exceeds `B` there; otherwise `s` is a
prefix of `u` and the letter of `u` after it is at most `c < z`, so `S` exceeds `B` at the letter
`z`. In each case `S > B`. Consequence: if `v` is a Lyndon word other than the one-letter word
`K`, then its first letter is below `K` (a word `Kˡ` with `l ≥ 2` is larger than its suffix
`K^(l − 1)`), and `vK` is a Lyndon word (take `u = v`, `m = 1`, `u'` empty). Also, a
Lyndon word of length `n` is a necklace (2.1).

(c) The necklace after a given one. Let `α ≠ Kⁿ` be a necklace, with letters `a₁ ⋯ aₙ`, and
write `α = P x Kʲ` with `x < K` and `|P| = n − j − 1`; let `p = |ap(α)|`, so that `α` has
period `p` and `p` divides `n`. Then `j < p`, since otherwise `ap(α) = Kᵖ` and `α = Kⁿ`; and
`ap(α)` ends with `xKʲ`. Writing the prefix `P` of `α = ap(α)^(n/p)` as `ap(α)ᵉu'` with `u'` a
proper prefix of `ap(α)`, the letter after `u'` in `ap(α)` is `x`; so by (b) `Py` is a Lyndon word
for every letter `y > x`.

- (c1) The necklace `β` after `α` has prefix `P`, and its letter at position `n − j − 1` (counted
  from `0`) is larger than `x`. Indeed `PK` is a Lyndon word, so `PK^(j + 1)` is a Lyndon word by
  the consequence of (b), applied `j` times, when `P` is nonempty, and is `Kⁿ` otherwise;
  it is a necklace larger than `α`, so `α < β ≤ PK^(j + 1)`, and `β` has the common prefix `P`
  of the two bounds. The next letter of `β` is at least `x`, and equality would leave `β ≤ α`.
- (c2) If `α` is periodic (`p < n`), then `β` is aperiodic. By (b) the prefix `B` of `β` of
  length `n − j` is a Lyndon word, and `|B| = n − j > n − p ≥ n/2`. If `β = vˢ` with `s ≥ 2`,
  then `|v| ≤ n/2 < |B|`, and `B`, a prefix of `vˢ`, has the nonempty border of length
  `|B| − |v|`, which a Lyndon word does not have (2.1). (This is their Lemma 5, p. 13, whose last
  step, that the prefix of `β` is not a prefix of a periodic necklace, is stated there without
  proof.)
- (c3) For every necklace `γ ≠ Kⁿ`, the factor of `W` of length `n` starting at the block of `γ`
  is `γ`. If `γ` is aperiodic, its block is `γ`. Otherwise the necklace `δ` after `γ` is
  aperiodic by (c2), so its block `δ` follows `ap(γ)`; by (c1) `δ` has the prefix of `γ` of
  length `n − j − 1 ≥ n − |ap(γ)|`, with `j` as in (c) for `γ`, and `ap(γ)` followed by the
  first `n − |ap(γ)|` letters of `γ` is `γ`, by the period.
- (c4) The factor of `W` starting at the block of `α` is `α a₁ ⋯ a_(p − j − 1)`. If `α` is
  periodic, its block `a₁ ⋯ a_p` is followed by the block `β` (by (c2)), which begins with
  `P = a₁ ⋯ a_(n − j − 1)`, and `a₁ ⋯ a_p a₁ ⋯ a_(n − j − 1) = α a₁ ⋯ a_(p − j − 1)` by the
  period. If `α` is aperiodic (`p = n`), its block `α` is followed by the block of `β`; if
  `β ≠ Kⁿ`, `W` reads `β` there by (c3), and `β` begins with `P`; if `β = Kⁿ`, then `P` consists
  of letters `K`, so `P` is empty (a necklace other than `Kⁿ` begins with a letter below `K`),
  `j = n − 1`, and there is nothing to add to `α`.
- (c5) `W` ends with `Kⁿ`: the last two necklaces are `(K − 1)K^(n − 1)`, a Lyndon word by the
  consequence of (b) applied `n − 1` times to `K − 1`, so its own block, and `Kⁿ`, whose block
  is `K`, since a necklace larger than `(K − 1)K^(n − 1)` begins with `K` and so is `Kⁿ`.

(d) Every word `w` of length `n` occurs in `W`, read cyclically. Let `α` be the smallest rotation
of `w`, a necklace. If `α = Kⁿ`, use (c5). Otherwise, with the notation of (c), `w = α.rotate s`
for some `0 ≤ s < p`, since rotation by `p` fixes `α`. If `s ≤ p − j − 1`, then `w` is a factor of
`α a₁ ⋯ a_(p − j − 1)`, which occurs by (c4). If `p − j ≤ s < p`, let `r = p − s`, so
`1 ≤ r ≤ j`; then `w = a_(s + 1) ⋯ aₙ a₁ ⋯ a_s` is `K^r` followed by `Q = a₁ ⋯ a_(n − r)`,
because `a_(s + 1) ⋯ a_p = K^r` and, by the period `p`,
`a_(p + 1) ⋯ aₙ a₁ ⋯ a_s = a₁ ⋯ a_(n − r)`. Let `γ` be the smallest necklace with prefix `Q` (`α` is
one); `γ ≠ Kⁿ`, since `a₁ < K`. By (c3), `W` reads `Q` from the start of the block of `γ`. The `r`
letters before that block, cyclically, are `K^r`: if `γ = α₁`, they are the last letters of `W`
(c5); otherwise let `γ'` be the necklace before `γ`, written `γ' = P'x'K^(j')` as in (c). By (c1),
`γ` has prefix `P'`; if `j' < r`, then `|P'| ≥ n − r`, so `γ'` would have prefix `Q`, against the
choice of `γ`. Hence `j' ≥ r`, and the block `ap(γ')` ends with `x'K^(j')`, so with `K^r`. Thus `w`
occurs.

Their printed second case (p. 15) differs from this in two respects: the rotation starting at
`aᵢ` is printed as `k^(n − i)` followed by `a₁ ⋯ a_(i − 1)`, a word of length `n − 1`, where it is
`k^(p − i + 1)` followed by `a₁ ⋯ a_(n − p + i − 1)`, and the rest of that case uses the printed
lengths; and its range `p − j − 1 < i ≤ p` includes `i = p − j`, where the rotation begins with
`x` (in the letters used here, `α = 001` and `i = 2` give `010`). Case (d) above covers that
rotation in its first case.

**Checks.**
- `k = 2`: `n = 3` gives `0 · 001 · 011 · 1 = 00010111`, whose cyclic factors of length `3` are
  `000, 001, 010, 101, 011, 111, 110, 100`; `n = 4` gives `0000100110101111`. `k = 3`, `n = 2`:
  `0 · 01 · 02 · 1 · 12 · 2 = 001021122`.
- The order matters: concatenating the same Lyndon words for `k = 2`, `n = 3` in decreasing order
  gives `10110010`, in which `010` and `101` occur twice and `000`, `111` not at all; ordering them
  by length first gives `01001011`, which fails in the same way.
- Only lengths dividing `n` are used: for `k = 2`, `n = 4`, adding the Lyndon words `001` and
  `011` of length `3` would give length `22 > 16`.
- `k = 1`: the word is `0`, of length `1`. `k = 0`: the empty word, and the statement holds
  vacuously, as there is no word of length `n ≥ 1`.
- The hypothesis `n ≥ 1` is needed: `Nat.divisors 0` is empty, so `fkmWord k 0` is the empty word,
  of length `0 ≠ k⁰ = 1`.
- By direct computation the statement holds for `k ≤ 2`, `n ≤ 6` and for `k = 3`, `n ≤ 4`.

*Needs:* 2.1, 4.1; DirectedMatrixTreeAndBEST 5.2 (`IsDeBruijn`); Mathlib `Finset.sort`,
`List.flatten`, `Nat.divisors`, `List.ofFn`.

### Examples

The Fredricksen–Maiorana words in the Checks above.

### Dependencies

Layer 2 (2.1, through the fact that Lyndon words are unbordered), Layer 4 (4.1); the definition of
a de Bruijn sequence from DirectedMatrixTreeAndBEST, Layer 5, de Bruijn sequences (5.2).

## Scope and ownership

This roadmap owns the targets stated above: the failure
function with its iteration and its recurrence, Lyndon words with their characterizations, the
product rule and the standard factorization, the Chen–Fox–Lyndon theorem, the count of Lyndon
words, and the Fredricksen–Maiorana theorem.

Already in the libraries and therefore not targets:

- Mathlib's periods of words and the Fine–Wilf theorem (`List.HasPeriod`, `List.HasPeriod.gcd`);
  4.1 uses the Fine–Wilf theorem. The duality of periods and borders is Mathlib's definition of a
  period read through `w = w.take p ++ w.drop p` (Conventions), with one direction stated as
  `List.HasPeriod.drop_prefix`; it is not a target.
- Mathlib's rotations of lists, prefixes and suffixes, the lexicographic order on lists, and
  Möbius inversion.

Left to other roadmaps:

- DirectedMatrixTreeAndBEST, Layer 5, de Bruijn sequences (5.2), owns the definition of a de
  Bruijn sequence and the number `(k!)^(k^(n − 1))` of de Bruijn sequences of order `n ≥ 1` on `k`
  letters, which for `k ≥ 1` already gives their existence. Its definition is copied verbatim
  here; the count is not restated. The theorem here is the explicit construction, which that
  roadmap leaves outside its scope.
- AnabelianGeometryAndNonabelianChabauty, in its section on the Witt character and the surface
  relation, proves Witt's character formula for the graded pieces of a free Lie algebra; for the
  identity map on a `k`-dimensional space it gives the dimension of the degree-`n` piece as the
  number `(1/n) ∑_{d ∣ n} μ(d) k^(n/d)`, which here, by 4.1 and Möbius inversion, is the number of
  Lyndon words of length `n` on `k` letters. That roadmap counts dimensions and this one counts
  words; neither uses the other.

Outside the scope: the string-matching procedures that use the failure function and their running
times; the Burrows–Wheeler transform; the bijection of Lyndon words with a basis of the free Lie
algebra; the count of all necklaces; the Fredricksen–Maiorana word as the lexicographically
smallest de Bruijn sequence and the greedy constructions; infinite words (Sturmian words,
square-free and overlap-free words); and combinatorics of words with relations (free groups,
equations in words).

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/List/PeriodicityLemma.lean`: `List.HasPeriod w p` (`w <+: take p w ++ w`);
  `List.hasPeriod_iff_getElem?` (`HasPeriod w p ↔ ∀ i < w.length - p, w[i]? = w[i + p]?`);
  `List.HasPeriod.drop_prefix` (`HasPeriod w p → drop p w <+: w`); `List.HasPeriod.gcd`
  (periods `p` and `q` with `p + q − gcd p q ≤ |w|` give the period `gcd p q`).
- `Mathlib/Data/List/Lex.lean`: the instance `LinearOrder (List α)` for `[LinearOrder α]`, the
  lexicographic order `List.Lex (· < ·)`.
- Batteries `Batteries/Data/List/Basic.lean`: `List.rotate`. Core: `List.take`, `List.drop`,
  `List.flatten`, `List.ofFn`, `List.Pairwise`, `List.IsPrefix` (`<+:`), `List.IsSuffix` (`<:+`),
  `List.take_append_of_le_length`.
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup` (with value `0` on the empty set in `ℕ`).
  `Mathlib/Data/Finset/Sort.lean`: `Finset.sort` (the sorted list of a finite set, for a decidable
  linear order relation). `Mathlib/SetTheory/Cardinal/Finite.lean`: `Nat.card`.
- `Mathlib/NumberTheory/Divisors.lean`: `Nat.divisors` (empty for `0`),
  `Nat.sum_divisorsAntidiagonal` (`∑ over (a, b) ∈ n.divisorsAntidiagonal of f a b` equals
  `∑ over i ∈ n.divisors of f i (n / i)`).
- `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`: `ArithmeticFunction.moebius`;
  `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` (for `f g : ℕ → R` over a nonassociative
  ring, `∀ n > 0, ∑_{i ∣ n} f i = g n` if and only if
  `∀ n > 0, ∑_{(a, b) ∈ n.divisorsAntidiagonal} μ a · g b = f n`).

### From TauCetiRoadmap.DirectedMatrixTreeAndBEST

- 5.2: the definition `IsDeBruijn k n s` of a de Bruijn sequence of order `n` on `k` letters, as a
  function `s : Fin (k ^ n) → Fin k`, copied verbatim into this roadmap's `Suggested.lean`. Nothing
  else of that roadmap is used.

## References

- Darij Grinberg and Victor Reiner, *Hopf Algebras in Combinatorics*, arXiv:1409.8356, version 7
  (28 July 2020), §6.1, pp. 163–176: the lexicographic order (p. 164), Proposition 6.1.4 (p. 165),
  Definition 6.1.13 and Propositions 6.1.14 and 6.1.16 (pp. 167–168), Proposition 6.1.19 and
  Theorem 6.1.20 (pp. 169–170), Definition 6.1.25, Theorem 6.1.27 and Lemma 6.1.28 (pp. 170–172),
  Exercise 6.1.29 and Theorem 6.1.30 (pp. 172–173), Exercise 6.1.34 (pp. 174–175).
- Jeff Erickson, *Algorithms*, lecture notes, Lecture 7 "String Matching" (Spring 2017 revision),
  on the author's site (`jeffe.cs.illinois.edu/teaching/algorithms/`), §7.6, pp. 8–10, licensed
  CC BY-NC-SA 4.0.
- Joe Sawada, Aaron Williams and Dennis Wong, Generalizing the classic greedy and necklace
  constructions of de Bruijn sequences and universal cycles, *Electronic Journal of
  Combinatorics* 23(1) (2016), #P1.24, on the journal's open site: the Lyndon-word form of the
  construction (p. 3), Definition 1 and Lemma 1
  (p. 6), Definition 3 (p. 8), Section 4 with Lemmas 4–9 and Theorem 4 (pp. 12–15).
- The Chen–Fox–Lyndon theorem (Chen, Fox and Lyndon), Lyndon words (Lyndon; Shirshov) and
  the de Bruijn sequence built from Lyndon words (Fredricksen and Maiorana; Fredricksen and
  Kessler for two letters) are named as Grinberg–Reiner and Sawada, Williams and Wong attribute
  them.
