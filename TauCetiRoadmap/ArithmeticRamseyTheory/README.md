# Roadmap: arithmetic Ramsey theory

**Summary.** A configuration in the positive integers is *partition regular* when every colouring
of the positive integers with finitely many colours has a copy of it in one colour. This roadmap
develops the classical finite theory of partition regularity in the positive integers, with
bounds: every theorem holds for colourings of `{1, …, N}` once `N` exceeds a number defined here,
and each such number is bounded recursively by van der Waerden numbers, hypergraph Ramsey numbers
and Hales–Jewett numbers.

The headline theorems are these.

- *Deuber's (m, p, c)-sets.* For positive integers `x₁, …, x_m`, the `(m, p, c)`-set they generate
  is the set of all `c xⱼ + λⱼ₊₁ xⱼ₊₁ + ⋯ + λ_m x_m` with `1 ≤ j ≤ m` and integers `|λᵢ| ≤ p`.
  For all `m, p, c ≥ 1` and every number of colours there is `N` such that every colouring of
  `{1, …, N}` has a monochromatic `(m, p, c)`-set inside `{1, …, N}`. In particular (Brauer) there
  are `a, d` with `d, a, a + d, …, a + (k − 1)d` all of one colour.
- *Folkman's theorem.* For every `m` and every number of colours there is `N` such that every
  colouring of `{1, …, N}` has `m` distinct positive integers all of whose `2ᵐ − 1` nonempty
  subset sums are at most `N` and have one colour; the integers may be taken so that each exceeds
  the sum of the smaller ones. Through `n ↦ 2ⁿ`, the same holds for subset products.
- *The finite unions theorem and products of blocks.* For every `m` and number of colours there is
  `n` such that every colouring of the nonempty subsets of `{1, …, n}` has nonempty sets
  `D₁ < D₂ < ⋯ < D_m` all of whose nonempty unions have one colour. Consequently, for every
  sequence `a₁, …, a_n` in an arbitrary monoid and every colouring of the monoid, the products
  `bⱼ = ∏_{i ∈ Dⱼ} aᵢ` (taken in increasing order of `i`) have all their ordered nonempty
  subproducts in one colour.
- *Rado's theorem.* A system `Ax = 0` with rational coefficients has a monochromatic solution in
  positive integers for every finite colouring if and only if the columns of `A` can be split into
  blocks `B₁, …, B_t` such that the columns of `B₁` sum to zero and, for each `s`, the columns of
  `B_s` sum to a rational combination of the columns of the earlier blocks. A single equation
  `a₁x₁ + ⋯ + a_nx_n = 0` with nonzero coefficients is partition regular exactly when some
  nonempty set of the coefficients sums to zero. Partition regular systems can be solved
  simultaneously, and one colour class solves every partition regular system.

The roadmap sits among these neighbours:

- **RamseyNumbers** supplies the finite Ramsey theorem for hypergraphs. Layer 1 turns it into the
  simultaneous and ordered forms that Layer 4 uses to pass from sums of integers to unions of sets.
- **Mathlib's Hales–Jewett theorem** supplies the finite dimension in which combinatorial lines are
  monochromatic. Layer 2 turns it into van der Waerden numbers for colourings of `{1, …, N}`.
- **Mathlib's Hindman theorem** (infinite finite-sums sets through idempotent ultrafilters) is the
  infinite neighbour of Folkman's theorem. Folkman's theorem without a bound follows from it by
  compactness; here it is proved combinatorially, with a bound, and nothing depends on it.
- **SidonSetsAndLinearEquations** treats the density question for a single linear
  equation, the counterpart of the colouring question of Layer 5; neither uses the other.

Layer 1 proves the simultaneous and ordered Ramsey theorems. Layer 2 defines Hales–Jewett and van
der Waerden numbers. Layer 3 defines `(m, p, c)`-sets and proves Deuber's colouring theorem for
them in the positive integers, with Brauer's theorem. Layer 4 derives Folkman's theorem, its
product form, the finite unions theorem and products of ordered blocks in monoids. Layer 5 proves
Rado's theorem and its corollaries. Layer 2 uses no other layer, Layer 3 uses Layer 2, Layer 4
uses Layers 1 and 3, and Layer 5 uses Layer 3.

## Conventions

- **Colourings.** A colouring with colours in `κ` is a function `χ : ℕ → κ`, where `κ` is a type
  with `[Finite κ]`; "`r` colours" means `κ = Fin r`. A statement "inside `{1, …, N}`" asks that
  every element of the configuration lie in `Finset.Icc 1 N`, so only the values of `χ` on
  `1, …, N` matter. If `κ` is empty there is no colouring and every such statement holds
  vacuously, for every `N`. Positive integers are natural numbers `x` with `0 < x`.
- **Numbers.** Each finite property `P n` ("every colouring of `{1, …, n}` has the configuration")
  comes with a number defined as `sInf {n | P n}`, as in RamseyNumbers. Each layer proves that the
  property is upward closed and holds for some `n`, so that `P n ↔ number ≤ n`
  (`Nat.sInf_mem`, `Nat.sInf_le`), and then bounds the number. The number is `0` when the property
  holds at `0`, in particular when `κ` is empty. The finite unions property of 4.3, a property of
  colourings of sets rather than of integers, is stated with an explicit `n` and no number.
- **Integers in (m, p, c)-sets.** Generators and elements of `(m, p, c)`-sets are integers, since
  coefficients `λᵢ` may be negative; colours are applied through `Int.toNat` to elements already
  known to lie in `[1, N]`.
- **Ordered products.** For a monoid `M`, `a : Fin n → M` and `A : Finset (Fin n)`, the ordered
  product `orderedProd a A` is the product of `a i` over `i ∈ A` in increasing order of `i`, that
  is `((List.finRange n).filter (· ∈ A)).map a |>.prod`. In a commutative monoid it is
  `∏ i ∈ A, a i`. Statements are made for monoids; a semigroup `S` embeds in the monoid
  `WithOne S`, and every product of a nonempty family lies in its image, so nothing is lost.
  Additive forms are produced by `@[to_additive]`.
- **Blocks.** Finsets `D₁, …, D_m` of a linear order are *ordered blocks* when each is nonempty
  and every element of `Dᵢ` is less than every element of `Dⱼ` for `i < j`. Unions over an index
  set `J` are `J.biUnion D`.
- **Matrices.** Systems have rational coefficients, `A : Matrix ι κ ℚ` with `[Fintype ι]`,
  `[Fintype κ]`; the `i`-th column is `Aᵀ i : ι → ℚ`, and a solution `x : κ → ℕ` means
  `A *ᵥ (fun i ↦ (x i : ℚ)) = 0`. Spans of columns are `Submodule.span ℚ`.
- **Namespaces.** Declarations named here use Mathlib-style names: `Finset.*` and `Fin.*` for the
  Ramsey forms of Layer 1, `Matrix.*` for Rado's theorem, and root names (`vdWNumber`, `mpcSet`,
  `folkmanNumber`, …) for the arithmetic numbers and sets. `Suggested.lean` declares the headline
  targets in its own namespace, without these prefixes. A name in code font that `Suggested.lean`
  does not declare is the proposed name of a README target.

## Layer 1: simultaneous and ordered Ramsey theorems

### 1.1 Ramsey's theorem on an arbitrary finite set

Prove `Finset.exists_isHomogeneous_of_hypergraphRamseyNumber_le`: let `K` be a finite type, `m` a
uniformity, `f : K → ℕ` a demand, `α` a type with decidable equality and `S : Finset α` with
`hypergraphRamseyNumber m f ≤ #S`. Then every `χ : Finset α → K` has a colour `k` and `H ⊆ S`
with `#H = f k` such that `χ A = k` for every `A ⊆ H` with `#A = m`. Only the values of `χ` on
`m`-element subsets of `S` matter.

Route: RamseyNumbers 2.2 gives `HypergraphRamseyProp m f #S`; transport the colouring along
`S.equivFin` to the `m`-element subsets of `Fin #S` and map the homogeneous set back.

**Checks.**
- `m = 1`, `K = Fin r`, constant demand `t ≥ 1`: the hypothesis reads `r (t − 1) + 1 ≤ #S` (the
  value of RamseyNumbers 2.1's second Check), the pigeonhole principle.
- `m > f k` for some `k`: every set of `f k` elements is homogeneous in colour `k`, in agreement
  with the third Check of RamseyNumbers 2.1.

*Needs:* RamseyNumbers 2.1, 2.2; Mathlib `Finset.equivFin`, `Finset.map`.

### 1.2 The simultaneous Ramsey theorem

Prove `Finset.exists_simultaneous_ramsey`: for all `k, t : ℕ` and every family of finite colour
types `κ : ℕ → Type*`, there is `B` such that for every type `α` with decidable equality, every
`S : Finset α` with `B ≤ #S` and every family of colourings `χ : (j : ℕ) → Finset α → κ j`, some
`H ⊆ S` with `#H = t` has, for each `j ≤ k`, `χ j A = χ j D` whenever `A, D ⊆ H` and
`#A = #D = j`. That is, on `H` the colour of a set of at most `k` elements depends only on its
size. This is Sanders' iterated Ramsey theorem (Sanders, Lemma 1), there stated for one colouring
of all nonempty subsets and uniformities `1, …, r`.

Route: induction on `k`, following Sanders' proof. Uniformity `0` is trivial (the only set is
`∅`). For `k + 1`, put `M = max t (hypergraphRamseyNumber (k + 1) (fun _ : κ (k + 1) ↦ t))`, take
`B` given by the induction hypothesis for `k` and target `M`, find `H₀ ⊆ S` of size `M` homogeneous
for uniformities `≤ k`, and apply 1.1 inside `H₀` at uniformity `k + 1` to get `H` of size `t`;
homogeneity for smaller uniformities passes to subsets. The recursion
`B(k + 1, t) = B(k, max t R⁽ᵏ⁺¹⁾(t))`, `B(0, t) = t`, with `R⁽ʲ⁾(t)` the hypergraph Ramsey number
of uniformity `j` for constant demand `t` in `κ j`, is the bound, and RamseyNumbers bounds each
`R⁽ʲ⁾` recursively.

**Checks.**
- `k = 1`, `κ 1 = Fin r` with `r ≥ 1`, every `κ j` nonempty, `t ≥ 1`: the least admissible `B` is
  `r (t − 1) + 1`.
- If some `κ j` with `j ≤ k` is empty, no family of colourings exists and every `B` works.
- The restriction to uniformities `j ≤ k` cannot be dropped in an infinite form: colouring a
  finite set `A ⊆ ℕ` by whether `#A ∈ A` leaves no infinite `H` on which the colour depends only on
  the size (Sanders, §1.2). For finite `H` of size `t`, `k = t` is allowed.

*Needs:* 1.1; RamseyNumbers 2.2.

### 1.3 The ordered simultaneous Ramsey theorem

Prove `Fin.exists_orderEmbedding_simultaneous_ramsey`: for all `k, t` and finite colour types
`κ : ℕ → Type*` there is `B ≥ t` such that for every family
`χ : (j : ℕ) → (Fin j ↪o Fin B) → κ j` there is `e : Fin t ↪o Fin B` with
`χ j (s.trans e) = χ j (s'.trans e)` for all `j ≤ k` and all `s, s' : Fin j ↪o Fin t`. Colourings
of increasing `j`-tuples are thus constant on the increasing tuples of the image of `e`.

Route: an order embedding `Fin j ↪o Fin B` is determined by its image, a `j`-element subset, and
every such subset arises (`Finset.orderEmbOfFin`, `Finset.orderEmbOfFin_unique'`). Colour each
`j`-element subset `A ⊆ Fin B` by `χ j (A.orderEmbOfFin _)`, apply 1.2 to `Finset.univ`, and let
`e` enumerate `H`.

**Checks.**
- `t = 0`: `e` is the empty embedding and the conclusion is vacuous except for `j = 0`, where
  `Fin 0 ↪o Fin 0` has one element.
- The statement for `j`-tuples that are merely injective is false: colouring an injective pair
  `(u, v)` by whether `u < v` is not constant on the pairs of any two-element set.

*Needs:* 1.2; Mathlib `Finset.orderEmbOfFin`, `Finset.orderEmbOfFin_unique'`,
`OrderEmbedding.trans`.

## Layer 2: Hales–Jewett and van der Waerden numbers

### 2.1 Hales–Jewett numbers

Define `IsHJBound k κ n`: every colouring `C : (Fin n → Fin k) → κ` has a monochromatic
combinatorial line, `∃ l : Combinatorics.Line (Fin k) (Fin n), l.IsMono C`. Define
`hjNumber k κ = sInf {n | IsHJBound k κ n}`. Prove `isHJBound_iff_hjNumber_le` for `[Finite κ]`
and `1 ≤ k`: upward closure by extending a line of `Fin n → Fin k` to `Fin n' → Fin k` with the
new coordinates fixed at `0` and pulling the colouring back, and existence from Mathlib's
`Combinatorics.Line.exists_mono_in_high_dimension` transported along `Fintype.equivFin`. Prove
`hjNumber_congr`: the number depends on `κ` only through `Nat.card κ`.

**Checks.**
- `k = 2`, `κ` nonempty: `hjNumber 2 κ = Nat.card κ`. In `Fin r → Fin 2` the `r + 1` points
  `0ʳ, 10ʳ⁻¹, …, 1ʳ` contain two of one colour, which form a line; in `Fin (r − 1) → Fin 2`
  colouring a word by its number of `1`s uses `r` colours and separates the two points of every
  line.
- `k = 1`: every `n ≥ 1` works (the single point is a line), so `hjNumber 1 κ = 1` for nonempty
  `κ`.

*Needs:* Mathlib `Combinatorics.Line`, `Combinatorics.Line.IsMono`,
`Combinatorics.Line.exists_mono_in_high_dimension`, `Fintype.equivFin`.

### 2.2 Van der Waerden numbers

Define `IsVdWBound k κ n`: every colouring `χ : ℕ → κ` has `a` and `d ≥ 1` such that
`a + j d ∈ [1, n]` for all `j < k` and `χ (a + j d) = χ (a + j' d)` for all `j, j' < k`. Define
`vdWNumber k κ = sInf {n | IsVdWBound k κ n}`. Prove:

- `isVdWBound_iff_vdWNumber_le` for `[Finite κ]` (upward closure is immediate; existence from
  the next item);
- `isVdWBound_of_isHJBound`: `IsHJBound (k + 1) κ n → IsVdWBound (k + 1) κ (k n + 1)`; hence
  `vdWNumber (k + 1) κ ≤ k · hjNumber (k + 1) κ + 1`. Route: colour `v : Fin n → Fin (k + 1)` by
  `χ (1 + Σᵢ v i)`; a monochromatic line with active set `I` gives the progression with
  `a = 1 + Σ_{i ∉ I} (fixed value at i)` and `d = #I ≥ 1`, inside `[1, k n + 1]`, exactly as in
  Mathlib's proof of `Combinatorics.exists_mono_homothetic_copy`;
- monotonicity in `k` and in `κ` (along an injection of colour types), and `vdWNumber_congr` for
  `Nat.card κ = Nat.card κ'`.

This is van der Waerden's theorem in finite form (Chua, §2, p. 18, where `W(m, k)` is the number
for progressions of length `m` in `k` colours); the infinite form for commutative monoids is
Mathlib's `Combinatorics.exists_mono_homothetic_copy`.

**Checks.**
- For nonempty `κ`: `vdWNumber 0 κ = 0`, `vdWNumber 1 κ = 1` and `vdWNumber 2 κ = Nat.card κ + 1`
  (pigeonhole; this is also the bound `1 · hjNumber 2 κ + 1` of 2.1's first Check, so the bound
  is sharp there).
- `vdWNumber 3 (Fin 2) = 9`: the colouring `1, 2, 5, 6 ↦ 0`, `3, 4, 7, 8 ↦ 1` of `{1, …, 8}` has no
  monochromatic three-term progression, and every two-colouring of `{1, …, 9}` has one
  (exhaustive search).
- The condition `d ≥ 1` is needed: with `d = 0` the constant progression `a, a, …, a` would make
  every number `1` for `k ≥ 1`.

*Needs:* 2.1; Mathlib `Combinatorics.exists_mono_homothetic_copy` (as a model for the route).

## Layer 3: (m, p, c)-sets and Deuber's theorem in the positive integers

### 3.1 (m, p, c)-sets

For `p, c : ℕ` and generators `x : Fin m → ℤ`, define the `j`-th row

    mpcRow p c x j = {Σᵢ λᵢ xᵢ | λ : Fin m → ℤ, λᵢ = 0 for i < j, λⱼ = c, |λᵢ| ≤ p for i > j}

and `mpcSet p c x = ⋃ j, mpcRow p c x j` (Chua, §3, p. 34). Prove:

- `mpcSet_comp_orderEmbedding`: for `e : Fin m' ↪o Fin m`, every row of `x ∘ e` is contained in
  the row `e j` of `x`, so `mpcSet p c (x ∘ e) ⊆ mpcSet p c x`;
- `mpcSet_smul`: `mpcSet p c (d • x) = d • mpcSet p c x` for `d : ℤ`, and the same for rows;
- monotonicity: `mpcSet p c x ⊆ mpcSet p' c x` for `p ≤ p'`;
- `lt_of_mpcSet_pos`: if every element of `mpcSet p c x` is positive and `c ≥ 1`, then
  every `xᵢ > 0` and `p Σ_{i > j} xᵢ < c xⱼ` for every `j`. Route: the element of row `j` with
  `λᵢ = −p` for all `i > j` is positive, and downward induction on `j` gives `xⱼ > 0`;
- `finsetSum_mem_mpcRow`: for `p ≥ 1`, every nonempty subset sum `Σ_{i ∈ I} xᵢ` lies in the row
  `I.min'` of `mpcSet p 1 x` (coefficient `1` at the least index, `0` or `1` after it).

**Checks.**
- A `(2, p, 1)`-set is `{x₁ + λ x₂ : |λ| ≤ p} ∪ {x₂}`, an arithmetic progression of length `2p + 1`
  together with its common difference (Chua, p. 34).
- With `c = 0`, every row contains `0` (take all `λᵢ = 0`), so no `(m, p, 0)`-set with `m ≥ 1` lies
  in the positive integers. The colouring theorems of 3.2 and 3.3 assume `c ≥ 1`.
- For `p = c = 1`, positivity forces `x₁ > x₂ + ⋯ + x_m`, and `{3, 1}` generates
  `{2, 3, 4, 1}`.

*Needs:* Mathlib `Finset.sum`, `OrderEmbedding`.

### 3.2 Row-monochromatic (m, p, c)-sets

Define `IsMPCRowMonoBound m p c κ n`: every colouring `χ : ℕ → κ` has `x : Fin m → ℤ` with
`mpcSet p c x ⊆ [1, n]` and `χ` constant on each row (through `Int.toNat`). Define
`mpcRowMonoNumber m p c κ` as the infimum. Prove:

- `isMPCRowMonoBound_iff` for `[Finite κ]` and `1 ≤ c`;
- `mpcRowMonoNumber_one`: `mpcRowMonoNumber 1 p c κ = c` for nonempty `κ` and `c ≥ 1` (the set is
  `{c x₁}`, and `x₁ = 1` is optimal);
- `mpcRowMonoNumber_succ_le`: for `[Finite κ]`,

      mpcRowMonoNumber (m + 1) p c κ ≤ c · vdWNumber (2 m p M + 1) κ,
      where M = mpcRowMonoNumber m p c κ.

Route (Chua, §3, proof of the Proposition on p. 34, made finite). If `p = 0` the number is `c` for
every `m ≥ 1` (second Check), and `m = 0` is `mpcRowMonoNumber_one`; so let `m, p ≥ 1`. Put
`N = m p M` and `n = c · vdWNumber (2N + 1) κ`. By 2.2 applied to `t ↦ χ (c t)` there are `u, e ≥ 1`
with `c (u + j e) ∈ [1, n]` of one colour for `0 ≤ j ≤ 2N`. Put `x₀ = u + N e` and `d = c e`. Apply
the property for `m` to `t ↦ χ (d t)`, giving generators `y` of a row-monochromatic set inside
`[1, M]`, and set `x = (x₀, d y₁, …, d y_m)`. Rows `j ≥ 1` are `d` times rows of the inner set,
inside `[1, d M] ⊆ [1, n]`: from `2 N e ≤ n / c` follows `d M ≤ n M / (2N) = n / (2mp)`. The first
row is `c x₀ + d s` with `|s| ≤ p Σ yᵢ ≤ N`, which lies in the monochromatic progression.

**Checks.**
- `mpcRowMonoNumber 2 1 1 (Fin 2) = 9 = vdWNumber 3 (Fin 2)` (exhaustive search), so the
  recursion is sharp at `m = 1`, `p = c = 1`, two colours.
- For `p = 0` the rows are singletons `{c xⱼ}` and the number is `c` for every `m ≥ 1`; the
  recursion gives `c · vdWNumber 1 κ = c`.

*Needs:* 2.2, 3.1.

### 3.3 Deuber's theorem in the positive integers

Define `IsMPCBound m p c κ n` like `IsMPCRowMonoBound` but with `χ` constant on the whole of
`mpcSet p c x`, and `mpcNumber m p c κ`. Prove `isMPCBound_iff` for `[Finite κ]`, `1 ≤ c`, and

    mpcNumber m p c κ ≤ mpcRowMonoNumber (Nat.card κ · m + 1) p c κ.

Route (Chua, p. 34): among the `Nat.card κ · m + 1` rows of a row-monochromatic set, `m + 1` have
one colour (Mathlib's `Fintype.exists_lt_card_fiber_of_mul_lt_card`); the generators of `m` of
them, listed in increasing order, generate a monochromatic `(m, p, c)`-set by
`mpcSet_comp_orderEmbedding`. Corollary `exists_mono_mpcSet`: every colouring of the positive
integers with finitely many colours has a monochromatic `(m, p, c)`-set of positive integers.

**Checks.**
- `mpcNumber 2 1 1 (Fin 2) = 17` (exhaustive search over `x₁ > x₂ ≥ 1` with
  `{x₁ − x₂, x₁, x₁ + x₂, x₂}` monochromatic), against the bound
  `mpcRowMonoNumber 5 1 1 (Fin 2)` given by the theorem.
- `mpcNumber 1 p c κ = c` for nonempty `κ` and `c ≥ 1`.

*Needs:* 3.2; Mathlib `Fintype.exists_lt_card_fiber_of_mul_lt_card`.

### 3.4 Brauer's theorem

Prove `exists_mono_ap_and_diff`: for every `k` and finite `κ`, every colouring `χ : ℕ → κ` has
`a, d ≥ 1` with `a + k d ≤ mpcNumber 2 k 1 κ` and `χ d = χ (a + j d)` for all `j < k`; the bound
on `a + k d` constrains `d` for every `k ≥ 1`.
Route: a monochromatic `(2, k, 1)`-set with generators `x₁, x₂` contains `x₂` and `x₁ + j x₂` for
`0 ≤ j ≤ k`; take `a = x₁`, `d = x₂`. This is the strengthening of van der Waerden's theorem in
Chua, §3, p. 27.

**Checks.**
- `k = 2`: the configuration `{d, a, a + d}` is a monochromatic solution of Schur's equation.
- Forgetting `d` gives van der Waerden's theorem (2.2) with the bound `mpcNumber 2 k 1 κ`.

*Needs:* 3.1, 3.3.

## Layer 4: Folkman's theorem and finite unions

### 4.1 Folkman's theorem

Define `IsFolkmanBound m κ n`: every colouring `χ : ℕ → κ` has an injective `x : Fin m → ℕ` with
all `xᵢ > 0`, `Σᵢ xᵢ ≤ n`, and `χ (Σ_{i ∈ I} xᵢ) = χ (Σ_{i ∈ J} xᵢ)` for all nonempty
`I, J ⊆ Fin m`. Define `folkmanNumber m κ`. Prove:

- `isFolkmanBound_iff_folkmanNumber_le` for `[Finite κ]`;
- `folkmanNumber_le_mpcNumber`: `folkmanNumber m κ ≤ mpcNumber m 1 1 κ`;
- the strong form `exists_superincreasing_finsetSum_mono`: every `χ` has `x` as above with, in
  addition, `Σ_{j > i} xⱼ < xᵢ` for every `i`, so that the `2ᵐ − 1` subset sums are pairwise
  distinct, and `Σ xᵢ ≤ mpcNumber m 1 1 κ`;
- the min-colour form `exists_finsetSum_color_eq_of_min_eq`: every `χ` has superincreasing
  positive `x` with `Σ xᵢ ≤ mpcRowMonoNumber m 1 1 κ` such that the colour of `Σ_{i ∈ I} xᵢ` depends
  only on `min I`.

Route: a monochromatic (row-monochromatic) `(m, 1, 1)`-set of positive integers inside `[1, n]`
contains every nonempty subset sum of its generators in the row of the least index (3.1), and
positivity makes the generators superincreasing (3.1), hence distinct (Chua, §3, Corollary "Finite
sum theorem", p. 35, where the theorem is credited to Folkman, Rado and Sanders independently;
Sanders, Theorem 2 and Corollary 1.1, with a proof by alternating sums and 1.2).

**Checks.**
- `folkmanNumber 1 κ = 1` for nonempty `κ`; `folkmanNumber 2 (Fin 1) = 3` (`1, 2, 3`) and
  `folkmanNumber 2 (Fin 2) = 9` (exhaustive search).
- Injectivity matters: without it, `x = (1, 1)` would give `2` for `m = 2` and one colour.
- Two colours, `m = 2`: the recursion gives `mpcRowMonoNumber 2 1 1 (Fin 2) ≤ vdWNumber 3 (Fin 2)`,
  and the min-colour form holds from `9` on, the computed value of 3.2.

*Needs:* 3.1, 3.2, 3.3.

### 4.2 Finite products

Prove `exists_injective_finsetProd_mono`: every colouring `χ : ℕ → κ` has injective
`x : Fin m → ℕ` with every `xᵢ` a power of `2` greater than `1`, `∏ᵢ xᵢ ≤ 2 ^ folkmanNumber m κ`,
and `χ (∏_{i ∈ I} xᵢ) = χ (∏_{i ∈ J} xᵢ)` for nonempty `I, J`. Route: apply 4.1 to `t ↦ χ (2 ^ t)`
and put `xᵢ = 2 ^ yᵢ` (Chua, p. 35).

**Checks.**
- `m = 1`: `x₁ = 2`, and `2 ≤ 2 ^ folkmanNumber 1 κ = 2`.

*Needs:* 4.1.

### 4.3 The finite unions theorem

Define `IsFinUnionsBound m κ n`: every `χ : Finset (Fin n) → κ` has ordered blocks
`D : Fin m → Finset (Fin n)` with `χ (I.biUnion D) = χ (J.biUnion D)` for all nonempty
`I, J ⊆ Fin m`. Prove upward closure (restrict along `Fin.castLE`) and `exists_isFinUnionsBound`
for `[Finite κ]`, with the bound `n = B(F, F)` of 1.2, where `F = folkmanNumber m κ` and every
uniformity carries the colour type `κ`.

Route (the method of Sanders' proof of his Theorem 2, where colours of sets are first made to
depend on size only): by 1.2 find `H ⊆ Fin n` with `#H = F` on which the colour of every set of at
most `F` elements depends only on its size, say `κ' j` for `#A = j`. Apply 4.1 to `κ'` (extended
arbitrarily beyond `F`): sizes `s₁, …, s_m ≥ 1` with all nonempty subset sums at most `F` and of
one colour under `κ'`. Since `Σ sⱼ ≤ F = #H`, cut `H`, listed in increasing order, into consecutive
blocks of sizes `s₁, …, s_m`; a union over `J` has `Σ_{j ∈ J} sⱼ` elements and colour
`κ' (Σ_{j ∈ J} sⱼ)`.

**Checks.**
- `m = 1`: any single nonempty set works, so `n = 1` suffices.
- The blocks cannot be required to be singletons: colouring a set by the parity of its size makes
  `{a}` and `{a, b}` differ.

*Needs:* 1.2, 4.1; Mathlib `Fin.castLE`, `Finset.orderEmbOfFin`.

### 4.4 Products of ordered blocks in monoids

Define `orderedProd a A` as in Conventions (with `@[to_additive orderedSum]`) and prove
`orderedProd_biUnion`: for ordered blocks `D` and `J : Finset (Fin m)`,
`orderedProd a (J.biUnion D) = orderedProd (fun j ↦ orderedProd a (D j)) J`. Prove:

- `exists_orderedProd_blocks_mono`: for every `n` with `IsFinUnionsBound m κ n`,
  for every monoid `M`, every `a : Fin n → M` and every `χ : M → κ`, there are ordered blocks
  `D : Fin m → Finset (Fin n)` such that, with `bⱼ = orderedProd a (D j)`,
  `χ (orderedProd b I) = χ (orderedProd b J)` for all nonempty `I, J`. Route: colour `A` by
  `χ (orderedProd a A)` and apply 4.3 with `orderedProd_biUnion`;
- the commutative form `exists_finsetProd_blocks_mono` with `∏ i ∈ D j, a i` and `∏ j ∈ I, bⱼ`,
  and the additive forms (sums of disjoint blocks of any sequence in an additive commutative
  monoid).

**Checks.**
- In `(ℕ, +)` with `aᵢ = 1` for all `i`, the block sums are the sizes `#Dⱼ` and the theorem
  becomes Folkman's theorem without distinctness.
- In the free monoid on `n` letters (`List (Fin n)` with `aᵢ = [i]`) the ordered product
  `orderedProd a A` is the increasing list of `A`, so the theorem is 4.3 itself.

*Needs:* 4.3; Mathlib `List.finRange`, `List.prod`, `Finset.prod`.

## Layer 5: Rado's theorem

### 5.1 Partition regularity and the columns condition

Define `Matrix.IsPartitionRegular A`: for every `r` and every `χ : ℕ → Fin r` there is
`x : κ → ℕ` with all `x i > 0`, `A *ᵥ (fun i ↦ (x i : ℚ)) = 0` and `χ (x i) = χ (x j)` for all
`i, j` (Chua, §3, p. 27). Define `Matrix.ColumnsCondition A`: there are `t : ℕ` and
`b : κ → Fin t` such that for every `s : Fin t`,

    Σ_{i : b i = s} Aᵀ i ∈ Submodule.span ℚ (Aᵀ '' {i | b i < s})

(Chua, p. 28). Empty blocks are allowed; they change nothing, and the first nonempty block has
column sum `0` because the span of the empty family is `0`. Prove that both properties are
invariant under multiplying `A` on the left by an invertible matrix, under permuting the columns,
and under deleting a zero row, and that the columns condition is decidable (finitely many `b` with
`t ≤ #κ` suffice; state `columnsCondition_iff_exists_le_card`).

**Checks.**
- Schur: `!![1, 1, -1]` satisfies the condition with blocks `{1, 3}`, `{2}` (Chua, p. 28).
- `!![2, -1]` fails it, and is not partition regular: colour `x` by the parity of the exponent of
  `2` in `x`; then `x` and `2x` differ (Chua, p. 28). More generally `!![λ, -1]` satisfies the
  condition exactly when `λ = 1`.
- Brauer's system in the variables `a, d, x₁, …, x_k`, with rows `a + j d − xⱼ = 0`, has the
  condition with `B₁` all columns except that of `d` and `B₂` the column of `d`, which the columns
  of the `xⱼ` span (Chua, p. 29).
- With no columns both properties hold.
- Partition regularity in the positive integers is equivalent to partition regularity in
  `ℤ ∖ {0}`: colour `x ≠ 0` by the pair (colour of `|x|`, sign of `x`); a monochromatic solution
  has all entries of one sign, and a homogeneous system can be negated.

*Needs:* Mathlib `Matrix.mulVec`, `Matrix.transpose`, `Submodule.span`.

### 5.2 Necessity: last-digit colourings

Define `lastDigit p n = n / p ^ padicValNat p n % p`, the last nonzero digit of `n` in base `p`.
For prime `p` and `n ≥ 1` it lies in `[1, p − 1]`. Prove
`Matrix.columnsCondition_of_frequently_lastDigit`: if for infinitely many primes `p` the colouring
`n ↦ lastDigit p n` (in `Fin p`) admits a monochromatic positive solution of `A x = 0`, then `A`
satisfies the columns condition. Hence `Matrix.IsPartitionRegular.columnsCondition`.

Route (Chua, §3, Proposition on p. 32): clear denominators. A monochromatic solution of colour `d`
for the prime `p` orders the columns by the `p`-adic valuation of `x i` and gives a partition
`B₁, …, B_t`; finitely many partitions exist, so one occurs for infinitely many `p`. Reducing
`Σ xᵢ Aᵀ i = 0` modulo `p^(L+1)` at the least valuation `L` gives `Σ_{B₁} Aᵀ i ≡ 0 (mod p)` for
infinitely many `p`, hence `= 0`. For `s ≥ 2`, the same reduction gives
`p^L Σ_{B_s} Aᵀ i + Σ_{B₁ ∪ ⋯ ∪ B_{s−1}} (d⁻¹ xᵢ) Aᵀ i ≡ 0 (mod p^(L+1))`, with `L` the valuation on
`B_s` and `d⁻¹` an inverse of `d` modulo `p^(L+1)`; if `Σ_{B_s} Aᵀ i` were
outside the span of the earlier columns, an integer vector `v` orthogonal to the earlier columns
and not to that sum would give `⟨v, Σ_{B_s} Aᵀ i⟩ ≡ 0 (mod p)` for infinitely many `p`, a
contradiction.

**Checks.**
- `lastDigit 5 75 = 3` (`75 = 3 · 5²`) and `lastDigit 7 1 = 1`.
- Single equation with integer coefficients: for one prime `p > Σ |aᵢ|` a monochromatic solution
  already gives a nonempty `I` with `Σ_{i ∈ I} aᵢ = 0` (Chua, p. 30).

*Needs:* 5.1; Mathlib `padicValNat`, `Nat.exists_infinite_primes`, `dotProduct`.

### 5.3 Sufficiency: (m, p, c)-sets contain solutions

Prove `Matrix.ColumnsCondition.exists_mpc`: if `A` satisfies the columns condition with `t`
blocks, then there are `p, c ≥ 1` such that for every `x : Fin t → ℤ` some `y : κ → ℤ` has all
entries in `mpcSet p c x` and `A *ᵥ (fun i ↦ (y i : ℚ)) = 0`. Then prove

- `Matrix.ColumnsCondition.exists_mono_solution_le`: for finite `κ'` and every `χ : ℕ → κ'` there
  is a monochromatic positive solution with entries at most `mpcNumber t p c κ'`;
- `Matrix.isPartitionRegular_iff_columnsCondition` (Rado's theorem; Chua, pp. 29 and 36).

Route (Chua, p. 35–36): write `Σ_{B_s} Aᵀ i = Σ_{i ∈ B₁ ∪ ⋯ ∪ B_{s−1}} q_{is} Aᵀ i` and put
`d_{is} = 1` on `B_s`, `−q_{is}` on earlier blocks and `0` on later ones, so that
`Σᵢ d_{is} Aᵀ i = 0` for each `s`. For `i ∈ B_s` the vector `(d_{is'})_{s'}` vanishes before `s`
and equals `1` at `s`. Choose `c` clearing the denominators of all `d_{is}` and
`p = max |c d_{is}|`; then `yᵢ = Σ_s c d_{is} x_s` lies in row `s` of `mpcSet p c x` and
`A y = 0`. With the blocks indexed in increasing order no reordering of columns is needed.

**Checks.**
- Schur's matrix with blocks `{1, 3}`, `{2}` has `q = (1, 0)` for the second block, `t = 2`,
  `c = p = 1`, and `y = (x₁ − x₂, x₂, x₁)`: `y₁, y₃` lie in row `1` and `y₂` in row `2`, and
  `y₁ + y₂ − y₃ = 0`.
- The bound of the second item for Schur's matrix with `r` colours is `mpcNumber 2 1 1 (Fin r)`;
  for `r = 2` it is `17`, against the value `5` of RamseyNumbers 6.1's Check: here all four of
  `x₁ − x₂, x₂, x₁, x₁ + x₂` must have one colour, not only the three entries of the solution.

*Needs:* 3.1, 3.3, 5.1, 5.2.

### 5.4 One equation

Prove `isPartitionRegular_single_iff`: for nonempty `κ` and `a : κ → ℚ` with every `a i ≠ 0`, the
one-row matrix `Matrix.of fun (_ : Fin 1) i ↦ a i` is partition regular if and only if
`Σ_{i ∈ I} a i = 0` for some nonempty `I` (Rado; Chua, Theorems on pp. 29 and 31). Route: the
columns condition for one row with nonzero entries reduces to this: the first nonempty block sums to
`0`; conversely, blocks `I` and its complement work because `I` contains a nonzero column spanning
`ℚ`.

**Checks.**
- The nonzero hypothesis is needed: `a = (0, 1)` has `I = {1}`, but `x₂ = 0` has no positive
  solution.
- Nonemptiness of `κ` is needed: with no variables the empty matrix is partition regular, while no
  nonempty `I` exists.
- `(1, λ, −1)` is partition regular for every `λ ≠ 0` (`I = {1, 3}`; Chua, p. 30); `(2, 3, −6)` is
  not (no nonempty subset of `{2, 3, −6}` sums to `0`).

*Needs:* 5.3.

### 5.5 Consistency

Prove `Matrix.IsPartitionRegular.fromBlocks`: if `A` and `B` are partition regular, so is
`Matrix.fromBlocks A 0 0 B`, and more generally `Matrix.blockDiagonal'` of finitely many partition
regular matrices (Rado's consistency theorem; Chua, p. 37). Then prove
`exists_color_forall_isPartitionRegular`: for every `χ : ℕ → κ` with `κ` finite there is a colour
`c` such that every partition regular `A : Matrix (Fin k) (Fin n) ℚ` has a positive solution all of
whose entries have colour `c` (Chua, Corollary on p. 37).

Route: by 5.3 it suffices to merge the block partitions of `A` and `B` index by index. For the
second item, if every colour `c` had a partition regular `A_c` without solution in colour `c`, the
block diagonal of the `A_c` would be partition regular by the first item, and its monochromatic
solution, of some colour `c`, would restrict to a solution of `A_c` in colour `c`.

**Checks.**
- `Matrix.fromBlocks !![1, 1, -1] 0 0 !![2, -1]` is not partition regular, since a solution
  restricts to a solution of `!![2, -1]`; the converse direction of the first item holds in this
  way for every pair.
- For the colouring `1, 4 ↦ 0`, `2, 3 ↦ 1`, `n ↦ 0` for `n ≥ 5`, Schur's system has no solution
  in colour `1` and the solution `4 + 4 = 8` in colour `0`, the colour that the second item
  produces.

*Needs:* 5.1, 5.3; Mathlib `Matrix.fromBlocks`, `Matrix.blockDiagonal'`.

## Worked examples

- Schur's theorem: `!![1, 1, -1]` satisfies the columns condition, so 5.3 gives a monochromatic
  `x + y = z`. RamseyNumbers 6.1 gives the bound `R(3, …, 3) − 1` with `x = y` allowed;
  4.1 gives `x ≠ y` with the bound `folkmanNumber 2 κ`.
- Van der Waerden with the common difference (Brauer, 3.4), and geometric progressions with their
  ratio from 3.4 applied to `t ↦ χ (2 ^ t)`.
- The equation `x + 2y = 4z` is not partition regular, since no nonempty subset of
  `{1, 2, −4}` sums to `0` (5.4); `x + 2y = 3z` is, through `{1, 2, −3}`.

## Downstream consumers

Alweiss's proof of Hindman's finite sums-and-products theorem in `ℚ` deduces its conclusion from a
structural proposition together with 1.2 and 4.1: one colours the products of the variables over
sets of indices, makes the colour depend only on the number of indices by 1.2, and chooses the sizes
of disjoint consecutive blocks by Folkman's theorem applied to the size colouring. That is the
argument of 4.3, run with blocks of a more specific shape than those of 4.3 and 4.4.

## Scope and ownership

This roadmap owns:
- the simultaneous Ramsey theorem for all uniformities up to a bound, on arbitrary finite sets,
  and its ordered form for order embeddings `Fin j ↪o Fin B`;
- Hales–Jewett numbers and van der Waerden numbers for colourings of `{1, …, N}`, and the bound of
  the second by the first;
- `(m, p, c)`-sets, their basic algebra, and Deuber's colouring theorem for them in the positive
  integers, with row-monochromatic and monochromatic numbers and the recursive bound by van der
  Waerden numbers; Brauer's theorem;
- Folkman's theorem with Folkman numbers, its superincreasing and min-colour forms, its product
  form, the finite unions theorem for ordered blocks, and products of ordered blocks of a sequence
  in an arbitrary monoid (sums in additive monoids);
- partition regularity of rational linear systems, the columns condition, last-digit colourings,
  Rado's theorem, the single-equation theorem, the consistency theorem and the colour class
  solving every partition regular system.

It does not own:
- **RamseyNumbers:** Ramsey numbers of graphs and hypergraphs, their existence and bounds, and
  Schur's theorem with the bound `R(3, …, 3) − 1`. Layer 1 consumes its 2.2 and restates nothing.
- **Mathlib:** the Hales–Jewett theorem, its multidimensional form and van der Waerden's theorem
  for commutative monoids (`Combinatorics.exists_mono_homothetic_copy`), consumed by Layer 2;
  Hindman's theorem on infinite finite-sums and finite-products sets in semigroups
  (`Hindman.FS_partition_regular`, `Hindman.FP_partition_regular`,
  `Hindman.exists_FS_of_finite_cover`) and the Rado selection lemma (`Finset.rado_selection`),
  which together give the finite forms of 4.1 and 4.3 without a bound. This roadmap proves those
  finite forms combinatorially, with bounds, and does not use either.
- **SidonSetsAndLinearEquations:** sets without solutions of one linear equation,
  sum-free sets and Sidon sets, which are density statements. Layer 5 treats colourings and states
  nothing about density.
- **BanachSpaceTheory, §B4.1:** the infinite Ramsey theorem for finite colourings of `[ℕ]^k`.
  Nothing here needs it.

Tau Ceti contains no material on these subjects at the pin.

Outside this roadmap: Hindman's finite sums-and-products problem (an `m`-set all of whose nonempty
subset sums and subset products have one colour) and Alweiss's solution of it over `ℚ`, which
consumes Layers 1 and 4 (Downstream consumers); the algebra of the Stone–Čech compactification
beyond Mathlib's idempotent ultrafilters (minimal ideals, central sets and the central sets
theorem); Deuber's theorem that every finite colouring of a large `(n, q, d)`-set contains a
monochromatic `(m, p, c)`-set, and Rado's conjecture that it implies; partition regularity over
rings other than `ℤ`, and of nonlinear equations; explicit closed-form or primitive recursive bounds
for Hales–Jewett and van der Waerden numbers; lower bounds for van der Waerden and Folkman numbers;
density theorems (Roth, Szemerédi).

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- `Mathlib/Combinatorics/HalesJewett.lean`: `Combinatorics.Line` (a combinatorial line
  `l : Line α ι`, with `l.idxFun : ι → Option α` and at least one active coordinate),
  `Combinatorics.Line.IsMono`, `Combinatorics.Line.exists_mono_in_high_dimension` (for finite `α`
  and `κ` some finite type `ι` has a monochromatic line in every colouring of `ι → α`),
  `Combinatorics.exists_mono_homothetic_copy` (every finitely coloured commutative monoid contains
  a monochromatic `a • S + b` with `a > 0` for each finite `S`).
- `Mathlib/Combinatorics/Hindman.lean`: `Hindman.FS`, `Hindman.FP`, `Hindman.FS_partition_regular`,
  `Hindman.FP_partition_regular`, `Hindman.exists_FS_of_finite_cover` (cited in Scope, not used).
- `Mathlib/Combinatorics/Compactness.lean`: `Finset.rado_selection` (cited in Scope, not used).
- `Mathlib/Combinatorics/Pigeonhole.lean`: `Fintype.exists_lt_card_fiber_of_mul_lt_card`.
- `Mathlib/Data/Finset/Sort.lean`: `Finset.orderEmbOfFin`, `Finset.orderEmbOfFin_unique'`.
- `Mathlib/Order/Fin/Basic.lean`: `Fin.castLEOrderEmb`. `Mathlib/Order/Lattice/Nat.lean`:
  `Nat.sInf_mem`, `Nat.sInf_le`.
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.mulVec`, `dotProduct` (root namespace);
  `Mathlib/Data/Matrix/Block.lean`: `Matrix.fromBlocks`, `Matrix.blockDiagonal'`;
  `Submodule.span`.
- `padicValNat`; `Nat.exists_infinite_primes` (`Mathlib/Data/Nat/Prime/Infinite.lean`).
- Core and basic Mathlib: `Finset.Icc`, `Finset.biUnion`, `Finset.equivFin`, `Fintype.equivFin`,
  `List.finRange`, `List.prod`, `Int.toNat`, `WithOne`.

### From TauCetiRoadmap.RamseyNumbers

- 2.1: `HypergraphRamseyProp m f n` (every colouring of the `m`-element subsets of `Fin n` with
  colours in `K` has a colour `k` and a set of `f k` elements all of whose `m`-element subsets have
  colour `k`) and `hypergraphRamseyNumber m f` (its infimum).
- 2.2: `hypergraphRamseyProp_iff` (for finite `K`, the property holds exactly from the number on).
- 6.1 and its Checks, cited for comparison in 5.3 and in the Worked examples.

## Provenance

The simultaneous Ramsey theorem (1.2) and its ordered form (1.3) were formalized, with Ramsey's
theorem for arbitrary finite sets and a demand per colour, in openai/math (Apache-2.0, commit
`adc7f124`, `OAI/Analysis/MarkovType/FiniteRamsey.lean`). That source is not prescriptive: Layers 2,
3 and 5 have no formal precursor there, and the bounds of Layers 3 and 4 replace compactness
arguments.

## References

- Dexter Chua, *Part III — Ramsey Theory*, notes of lectures by B. P. Narayanan, University of
  Cambridge, Lent 2017 (`dec41.user.srcf.net/notes/III_L/ramsey_theory.pdf`). Section and page
  numbers are those of these notes: §2 (van der Waerden, Gallai, Hales–Jewett, pp. 18–23), §3
  (partition regularity, Rado's theorem and `(m, p, c)`-sets, pp. 27–37). Its results are
  unnumbered and are cited by page.
- J. H. Sanders, *A generalization of Schur's theorem*, excerpt from a 1968 Yale University Ph.D.
  dissertation, arXiv:1712.03620v1 (Lemma 1, the iterated Ramsey theorem; Theorem 2 and
  Corollary 1.1, the finite sums theorem; §1.2).
- R. L. Graham, B. L. Rothschild and J. H. Spencer, *Ramsey Theory*, Wiley (1980; second edition
  1990), which names the finite sums theorem after J. Folkman.
- The papers of R. Rado (*Studien zur Kombinatorik*, Math. Z. 36 (1933)), R. Rado (*Some partition
  theorems*, 1970), W. Deuber (*Partitionen und lineare Gleichungssysteme*, Math. Z. 133 (1973)),
  A. Brauer (1928) and B. L. van der Waerden (1927), to whom Chua and Sanders attribute the
  results.
- R. Alweiss, *Monochromatic sums and products over ℚ*, arXiv:2307.08901 (Downstream consumers).
- N. Hindman, *Partitions and sums and products of integers*, Trans. Amer. Math. Soc. 247 (1979),
  227–245 (the finite sums-and-products question; Scope).
