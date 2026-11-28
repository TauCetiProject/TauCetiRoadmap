# Roadmap: max-plus spectral theory

**Summary.** In the max-plus semiring the sum of two numbers is their maximum and the product is
their ordinary sum, with `ε = −∞` as zero. A square matrix `A` with entries in `ℝ ∪ {ε}`, indexed by
a finite set of size `n`, acts on vectors by `(A ⊗ x)_i = max_j (A_ij + x_j)`, its powers record
the heaviest walks of each length in the weighted digraph with an arc `i → j` of weight `A_ij` for
every finite entry, and it is called irreducible when in that digraph every node, itself included,
is reached from every node by a walk of at least one arc. The mean of a closed walk is its weight
divided by its length. When some closed walk has finite weight, the largest mean exists: it is the
maximum cycle mean `λ`, the closed walks of mean `λ` are critical, and their arcs form the critical
graph. This roadmap develops the max-plus analogue of Perron–Frobenius theory: eigenvalues,
eigenvectors and the eventual behaviour of the powers.

The headline theorems are these.

- *The eigenvalue.* Every real eigenvalue (with an eigenvector having some finite entry) is the
  mean of a closed walk, and `λ`, when it exists, is the largest eigenvalue. An irreducible matrix
  on a nonempty index set has exactly one eigenvalue, `λ`, and all entries of its eigenvectors are
  finite.
- *The eigenspace.* Every closed walk of the critical graph is critical. If `λ = 0`, walks of the
  critical graph with the same endpoints have the same weight, and every eigenvector for the
  eigenvalue `0` is a max-plus combination of the columns of `A⁺ = A ⊕ A² ⊕ ⋯ ⊕ Aⁿ` at critical
  nodes; those columns are eigenvectors, and two of them are proportional when their nodes are
  joined in the critical graph.
- *Cyclicity.* Let `σ` be the cyclicity of the critical graph: the lcm over its strongly connected
  components of the gcd of their closed-walk lengths. If `A` is irreducible, then
  `A^(k+σ) = σλ + A^k` entrywise for all large `k`. For every matrix, every `p` such that
  `A^(k+p) = pμ + A^k` for all large `k` and some real `μ` is a multiple of `σ`.
- *Convergence.* If `A` is irreducible with `λ = 0`, the powers are eventually equal to the
  spectral projector `Q_jl = max_i (A⁺_ji + A⁺_il)`, `i` over the critical nodes, if and only if
  `σ = 1`.

The period of a nonnegative real matrix and its cyclic classes come from the roadmap
PeriodicNonnegativeMatrices, applied to the `0/1` pattern of finite entries; irreducibility is
Mathlib's notion for that pattern, and Tau Ceti's lemma on additively closed sets of natural
numbers turns gcd conditions on walk lengths into the existence of long walks.

Layer 1 sets up the operations, walks, cycle means and the Kleene plus; Layer 2 proves the
eigenvalue theorems, Layer 3 those on the critical graph and the eigenspace, and Layer 4 the
cyclicity, divisibility and convergence theorems.

## Conventions

- **Carrier.** `A : Matrix n n (WithBot ℝ)` with `[Fintype n] [DecidableEq n]`; `⊥` is `ε`.
  Mathlib's `MaxTropical (WithBot ℝ)` has a multiplication and an addition but no `Semiring`
  instance at the pin, so matrix powers over it do not exist; the max-plus product `mpMul`, the
  identity `mpOne`, the powers `mpPow` and the action `mpMulVec` are defined directly on
  `WithBot ℝ`, where `⊥ + a = ⊥` and the maximum of an empty family is `⊥`.
- **Graph and direction.** The arc `i → j` exists when `A i j ≠ ⊥` and has weight `A i j`, so
  `(A^k) i j` is the heaviest walk of length `k` from `i` to `j`. Baccelli–Cohen–Olsder–Quadrat
  (BCOQ below) and van der Woude–Olsder draw the arc `j → i` for the entry `A_ij`. Reversing all
  arcs changes neither cycle means, nor critical nodes, nor strongly connected components, nor
  gcds of cycle lengths, and the matrix statements (powers, eigenvectors, columns of `A⁺`) are the
  same in both conventions; a "path from `j` to `i`" there is a walk from `i` to `j` here.
- **Walks and cycles.** A walk of length `k` is `w : Fin (k + 1) → n`. A closed walk of length
  `k + 1` is `c : Fin (k + 1) → n`, read cyclically (`c k → c 0`, through the addition of
  `Fin (k + 1)`). Closed walks may repeat nodes; the maximum of their means is attained at a cycle
  without repeated nodes. Means are compared without division: the mean of a closed walk of length
  `k + 1` and weight `w` is at least that of one of length `k' + 1` and weight `w'` when
  `(k + 1) • w' ≤ (k' + 1) • w`.
- **Eigenvalues.** Eigenvalues are real numbers `μ`, and an eigenvector `x : n → WithBot ℝ` has
  some finite entry with `A ⊗ x = μ + x`. The value `ε` is excluded as an eigenvalue: a matrix with
  a column of `ε` entries would otherwise have it, with no cycle behind it.
- **Normalization.** Subtracting `μ` from every finite entry turns a matrix with maximum cycle mean
  `μ` into one with maximum cycle mean `0` and changes `A^k` into `A^k − kμ`; critical arcs,
  critical nodes and the critical cyclicity are unchanged. Layer 3 and the convergence criterion of
  4.4 are stated, as in BCOQ §3.7, for normalized matrices.
- **Irreducibility.** `pattern A : Matrix n n ℝ` is `1` at finite entries and `0` at `⊥`, and
  `A` is irreducible when `(pattern A).IsIrreducible` (Mathlib: nonnegative entries and every
  ordered pair of indices, equal or not, joined by a path of positive length). On the empty index
  type every matrix is irreducible, vacuously; the `1 × 1` matrix `(ε)` is not irreducible, and
  `(a)` with `a` finite is.
- **Degenerate cases.** On the empty index type there are no closed walks, no eigenvectors and no
  critical nodes; 2.3 assumes a nonempty index type, and the theorems that assume a maximum cycle
  mean exclude the empty type through that hypothesis. A matrix
  with no closed walk of finite weight has no cycle mean, no real eigenvalue and no critical node,
  and its critical cyclicity is `1`.

## Layer 1: Max-plus matrices, walks and cycle means

### 1.1 Product, identity, powers and action

Define `mpMul A B` with entries `max_k (A i k + B k j)` (`Finset.sup` over the index type),
`mpOne` with `0` on the diagonal and `⊥` elsewhere, `mpPow A 0 = mpOne`,
`mpPow A (k + 1) = mpMul (mpPow A k) A`, and `mpMulVec A x` with entries `max_j (A i j + x j)`.

- The product is associative, `mpOne` is a two-sided identity, and `mpPow A (k + l)` is
  `mpMul (mpPow A k) (mpPow A l)`; `mpMulVec` is monotone in both arguments and
  `mpMulVec (mpMul A B) x = mpMulVec A (mpMulVec B x)`.
- Adding a constant `c` to every finite entry of `A` adds `kc` to every finite entry of
  `mpPow A k`.

**Checks.**
- For `A = [[0, 1], [1, ε]]` the powers are `A² = [[2, 1], [1, 2]]`, `A³ = [[2, 3], [3, 2]]`,
  `A⁴ = [[4, 3], [3, 4]]`, recomputed entry by entry: the entry `(2, 2)` of `A²` is
  `max(1 + 1, ε + ε) = 2`; a product taking the minimum instead would give `min(0 + 0, 1 + 1) = 0`
  at `(1, 1)`, where the max-plus value is `2`.
- `mpOne` is not the ordinary identity matrix: its off-diagonal entries are `⊥`, the zero of the
  max-plus semiring, and `mpMul mpOne A = A` for every `A`.

*Needs:* Mathlib `Finset.sup`, `WithBot`. (Proved here.)

### 1.2 Powers are heaviest walks

Define `walkWeight A w`, the sum of `A (w t) (w (t + 1))` along a walk `w : Fin (k + 1) → n`.

Prove `mpPow_apply`: `mpPow A k i j` is the maximum of `walkWeight A w` over the walks `w` of
length `k` with `w 0 = i` and `w k = j`, the maximum of the empty family being `⊥` (BCOQ §2.3.1,
the display for `(A^p)_ji`, p. 43, and §2.3.2, p. 46, where it is stated for the reversed graph).

Route: induction on `k`; the walks of length `k + 1` from `i` to `j` are the walks of length `k`
from `i` to some `l` followed by the arc `l → j`, and `Finset.sup` distributes over `+` on
`WithBot ℝ` (addition is monotone and `⊥` absorbing).

- Consequence used below: `mpPow A k i j ≠ ⊥` if and only if `0 < (pattern A ^ k) i j`, both
  saying that a walk of length `k` from `i` to `j` along finite entries exists (Mathlib's
  `Matrix.pow_apply_pos_iff_nonempty_path` for the nonnegative matrix `pattern A`).

**Checks.**
- For `k = 0` the only walk is the constant one, of weight `0`, so the formula gives `mpOne`.
- For `A = [[ε, 0], [0, ε]]` the walks alternate between the two indices, so `A^k` is `mpOne` for
  even `k` and `A` for odd `k`, as the recursion gives; the pattern powers are the permutation
  matrices with the same zeros.

*Needs:* 1.1; Mathlib `Finset.sup`, `Finset.sum`, `Matrix.pow_apply_pos_iff_nonempty_path`.

### 1.3 Cycle means

Define `cycleWeight A c`, the weight of the closed walk `c 0 → c 1 → ⋯ → c k → c 0`, and
`cycleMeans A`, the set of real `m` such that some closed walk of length `k + 1` has weight
`(k + 1) m`.

- A closed walk splits into cycles without repeated nodes, and its mean is a weighted average of
  theirs. Hence, if `cycleMeans A` is nonempty, it has a greatest element, the maximum cycle mean,
  attained by a cycle of length at most the number of indices, and it equals the largest
  `(A^k) i i / k` over `1 ≤ k ≤ |n|` and `i`. This is the existence part of the second statement of
  2.2.

**Checks.**
- `A = [[0, 1], [1, ε]]` has the loop at the first index (mean 0), the cycle `1 → 2 → 1` (mean 1)
  and closed walks mixing them with means `1/2` and `2/3`; the closed walks of length at most 4
  give exactly `{0, 1/2, 2/3, 1}`, and the maximum `1` is attained by the 2-cycle. A definition by
  cycles without repeated nodes would give `{0, 1}`, with the same maximum.
- For `(ε)` and for every matrix on the empty index type `cycleMeans A` is empty.

*Needs:* 1.2. (Proved here.)

### 1.4 The pattern matrix

Define `pattern A`: the real matrix with `1` at the finite entries of `A` and `0` elsewhere.

**Checks.**
- `pattern [[0, 1], [1, ε]] = [[1, 1], [1, 0]]`, irreducible and primitive; the finite entry `0`
  of `A` becomes `1`, not `0`, so a definition keeping the values of `A` would lose the loop.
- `pattern [[−1, ε], [ε, 0]]` is the identity matrix, which is not irreducible.

*Needs:* Mathlib `Matrix.IsIrreducible`. (Proved here.)

### 1.5 The Kleene plus

Define `kleenePlus A`, the entrywise maximum of `mpPow A k` over `1 ≤ k ≤ |n|` (the max-plus
`A⁺ = A ⊕ A² ⊕ ⋯ ⊕ Aⁿ`).

- If no closed walk has positive weight, `kleenePlus A i j` is the heaviest walk of positive length
  from `i` to `j` (a longer walk contains a closed walk, whose removal does not lower the weight),
  `kleenePlus A i i` is the largest weight of a closed walk through `i`, and
  `mpMul (kleenePlus A) (kleenePlus A) ≤ kleenePlus A` entrywise.

**Checks.**
- The Kleene plus is the heaviest walk only without positive closed walks: for `(3)` it is `(3)`
  while `A² = (6)`.
- For the swap, `kleenePlus` has all entries `0`, although no power of the swap has a finite entry
  everywhere.

*Needs:* 1.1, 1.2, 1.3. (Proved here.)

### Examples

`[[0, 1], [1, ε]]` (van der Woude–Olsder, Example 4.1), the swap `[[ε, 0], [0, ε]]`, `(ε)`, `(3)`,
the empty index type.

### Dependencies

Mathlib `Finset.sup`, `Finset.sum`, `WithBot`, `Matrix.IsIrreducible`,
`Matrix.pow_apply_pos_iff_nonempty_path`. No other layer.

## Layer 2: The eigenvalue

### 2.1 Eigenpairs

Define `IsEigenpair A μ x`: some entry of `x` is finite and `mpMulVec A x = μ + x` entrywise.

**Checks.**
- For `A = (ε)` and `x = (0)` one has `A ⊗ x = (ε)`; with `ε` admitted as an eigenvalue this would
  be an eigenpair although `A` has no closed walk of finite weight. It is not an eigenpair for any
  real `μ`.
- The condition that some entry is finite is needed: the vector of `⊥` entries satisfies the
  equation for every `μ` and every `A`.

### 2.2 Eigenvalues are cycle means

- `mem_cycleMeans_of_isEigenpair`: every real eigenvalue of any max-plus matrix lies in
  `cycleMeans A`.
- `exists_isGreatest_cycleMeans_eigenvalues`: if `cycleMeans A` is nonempty, it has a greatest
  element `μ`, and `μ` is the greatest eigenvalue of `A`.

(BCOQ, Remark 3.24, p. 112, from the paragraph "Graph interpretation of λ" of the proof of
Theorem 3.23, p. 112, which does not use irreducibility; the existence of an eigenvector for the
maximum cycle mean is the paragraph "Existence of x and λ" of the same proof, p. 111, which does
not use irreducibility either.)

Route. If `A ⊗ x = μ + x` and `x i₁` is finite, the maximum in row `i₁` is attained at some `i₂`
with `x i₂` and `A i₁ i₂` finite and `A i₁ i₂ + x i₂ = μ + x i₁`; repeating gives a sequence of
indices that returns to an earlier one, and summing the equations along the closed walk so formed
shows that its mean is `μ`. For the second statement, 1.3 gives the greatest element `μ`.
Subtracting `μ` gives a matrix `B` with no closed walk of positive weight, so `B⁺` (1.5) is the
heaviest walk of positive length, and for a node `k` on a cycle of mean `μ` in `A`, `B⁺ k k = 0`;
the column
`B⁺_{·k}` then satisfies `B ⊗ B⁺_{·k} = B⁺_{·k}` and has the finite entry at `k`, an eigenvector of
`A` for `μ`. Every eigenvalue is a cycle mean, hence at most `μ`.

**Checks.**
- `diag(0, 1) = [[0, ε], [ε, 1]]` has the eigenpairs `(0, (0, ε))` and `(1, (ε, 0))`; the cycle
  means are `0` and `1`, and the greatest eigenvalue is `1`. Eigenvectors of a reducible matrix
  may have entries `⊥`.
- BCOQ Example 3.26: `[[1, ε], [ε, 2]]` has the eigenvalues `1` and `2`, the two loop weights.
- For `(ε)` there is no real eigenvalue and `cycleMeans` is empty, so the hypothesis of the second
  statement is needed for the existence of a greatest element.

*Needs:* 1.1, 1.2, 1.3, 1.5, 2.1; Mathlib `IsGreatest`.

### 2.3 The eigenvalue of an irreducible matrix

Prove `eigenvalue_eq_maxCycleMean`: if `n` is nonempty and `A` is irreducible, then the maximum
cycle mean `μ` exists, the set of real eigenvalues of `A` is `{μ}`, and every eigenvector has all
its entries finite (BCOQ, Theorem 3.23 with its proof, pp. 111–112).

Route. Irreducibility gives a closed walk of finite weight at any index, so 2.2 applies. If
`A ⊗ x = ν + x` and the set of indices with finite `x` were nonempty but not everything, an arc
`i → j` from an index `i` outside it to an index `j` inside it, which exists by irreducibility,
would give `(A ⊗ x) i ≥ A i j + x j > ⊥ = ν + x i`, a contradiction; so `x` is finite
everywhere. Then along any closed walk `i₁ → ⋯ → i_p → i₁` the inequalities
`A i_t i_(t+1) + x i_(t+1) ≤ ν + x i_t` sum to "the mean is at most `ν`", so `ν` is at least the
maximum cycle mean, and by
2.2 it is at most it.

**Checks.**
- `(3)`: eigenvalue `3`, eigenvector `(0)`.
- The swap `[[ε, 0], [0, ε]]` and `[[0, 1], [1, ε]]` are irreducible with eigenvalues `0` and `1`.
  For `A = [[1, −2, ε], [ε, ε, 3], [0, ε, −1]]` (irreducible; cycle means `1` for the loop at the
  first index, `−1` for the loop at the third, `1/3` for the 3-cycle) the eigenvalue is `1`, with
  eigenvector `(0, 1, −1)`: the three rows give `max(1 + 0, −2 + 1) = 1`, `3 − 1 = 2` and
  `max(0 + 0, −1 − 1) = 0`.
- Irreducibility is needed: `diag(0, 1)` of 2.2 has two eigenvalues and eigenvectors with `⊥`
  entries.
- A nonempty index type is needed: on the empty type the pattern is irreducible, vacuously, but
  there is no cycle mean and no eigenvector.

*Needs:* 1.2, 1.3, 1.4, 2.1, 2.2; Mathlib `Matrix.IsIrreducible`, `IsGreatest`.

### Examples

`diag(0, 1)`, `[[1, ε], [ε, 2]]`, `(3)`, `(ε)`, the swap, the irreducible `3 × 3` matrix of 2.3.

### Dependencies

Layer 1 (including the Kleene plus of 1.5 for the eigenvector of 2.2); Mathlib `IsGreatest`,
`Matrix.IsIrreducible`.

## Layer 3: The critical graph and the eigenspace

### 3.1 Critical cycles, the critical graph and the spectral projector

Define `IsCriticalCycle A c` (finite weight, and mean at least that of every closed walk),
`IsCriticalArc A i j` (some critical closed walk traverses `i → j`), `IsCriticalNode A i` (the tail
of a critical arc), and, with the Kleene plus of 1.5, `spectralProjector A`, the matrix
`Q j l = max_i (kleenePlus A j i + kleenePlus A i l)`, `i` over
the critical nodes. The critical graph has the critical arcs as arcs (BCOQ, Definition 3.94,
p. 143); for a normalized matrix `Q` is BCOQ's spectral projector (Theorems 3.104 and 3.105,
p. 147, where it is shown to satisfy `AQ = QA = Q²`).

- A node is critical exactly when it lies on a critical closed walk, equivalently when it is the
  head of a critical arc.
- When the maximum cycle mean is `0`, `kleenePlus A i i = 0` exactly at the critical nodes (1.5).

**Checks.**
- BCOQ Example 3.95: `A = [[0, 0, ε, ε], [−1, −2, ε, ε], [ε, −1, −1, 0], [ε, ε, 0, 0]]` has
  maximum cycle mean `0`, critical arcs `1 → 1`, `3 → 4`, `4 → 3`, `4 → 4` and critical nodes
  `{1, 3, 4}`; its Kleene plus is `[[0, 0, ε, ε], [−1, −1, ε, ε], [−2, −1, 0, 0], [−2, −1, 0, 0]]`,
  the matrix printed in BCOQ Example 3.102.

*Needs:* 1.2, 1.3, 1.5. (Proved here.)

### 3.2 Closed walks of the critical graph

Prove `isCriticalCycle_of_isCriticalArc`: a closed walk all of whose arcs are critical is
critical (BCOQ, Theorem 3.96 with its proof, p. 144, for a normalized matrix; the statement here
is unnormalized, which is equivalent by subtracting the maximum cycle mean).

Route. Normalize. For each of the `k + 1` arcs of the closed walk `ζ` choose a critical closed walk
through it, of weight `0`. Counting arcs with multiplicity, remove from the union of these closed
walks one copy of each arc of `ζ`: what remains has, at every node, as many arcs in as out, so it
splits into closed walks (or is empty), each of weight at most `0`. The weight of `ζ` plus the
weight of the remainder is `0`, so the weight of `ζ` is at least `0`, hence equal to `0`, the
maximum.

**Checks.**
- In BCOQ Example 3.95 the closed walk `3 → 4 → 4 → 3` uses only critical arcs and has weight
  `0 + 0 + 0 = 0`, mean `0`.
- The closed walk `1 → 2 → 1` of the same matrix has weight `−1` and uses the non-critical arc
  `1 → 2`.

*Needs:* 1.3, 3.1. (BCOQ's proof, p. 144.)

### 3.3 Walks of the critical graph

Prove `walkWeight_eq_of_isCriticalArc`: if the maximum cycle mean is `0`, two walks, of any
lengths, all of whose arcs are critical and which have the same first and the same last node,
have the same weight (BCOQ, Corollary 3.97 with its proof, p. 144).

Route. If both walks have length `0` there is nothing to prove. Otherwise one of them, say `p`,
has an arc. Every arc `u → v` of `p` lies on a critical closed walk, which contains a walk of
critical arcs from `v` back to `u`; chaining these walks for the arcs of `p` in reverse order
gives a walk `r` of critical arcs, of positive length, from the last node back to the first.
Closing `p` and `q` with `r` gives two closed walks of critical arcs, both of weight `0` by 3.2,
and the weight of `r` is finite, so `p` and `q` have the same weight.

**Checks.**
- Normalization is needed: for `(3)` the critical walks `1 → 1` and `1 → 1 → 1` have weights `3`
  and `6`.
- Criticality of the arcs is needed: in BCOQ Example 3.95 the walk of length `0` at `1` and the
  walk `1 → 2 → 1` have weights `0` and `−1`.

*Needs:* 1.2, 3.1, 3.2.

### 3.4 Eigenvectors are combinations of critical columns

Prove `eq_sup_kleenePlus_of_isEigenpair`: if the maximum cycle mean is `0` and `x` is an
eigenvector for the eigenvalue `0`, then `x l = max_i (kleenePlus A l i + x i)` for every `l`, the
maximum over the critical nodes `i` (BCOQ, Theorem 3.100 with its proof, p. 145, formula (3.27)).

Route (BCOQ's). Iterating, `A^k ⊗ x = x` for every `k ≥ 1`, so `x ≥ kleenePlus A ⊗ x` entrywise,
and `x l` is at least the right-hand side. Conversely, for an index `l` with `x l` finite choose
`j` attaining the maximum in row `l`, so `x l = A l j + x j` with `x j` finite, and repeat from `j`.
The walk so obtained runs in the saturation graph and returns to a node already visited (BCOQ,
Theorem 3.98, p. 144); the equalities sum to `0` around the closed walk so formed, which is
therefore critical, and a node `i` on it satisfies `x l = w + x i ≤ kleenePlus A l i + x i`, `w`
the weight of the walk from `l` to `i` (with `kleenePlus A i i = 0` when `l = i`). For `l` with
`x l = ⊥` both sides are `⊥`, because `kleenePlus A ⊗ x ≤ x`.

**Checks.**
- In BCOQ Example 3.95 the eigenvector `(0, −1, −2, −2)` (BCOQ, p. 144) is the maximum of
  `0 + A⁺_{·1} = (0, −1, −2, −2)` and `−2 + A⁺_{·3} = −2 + A⁺_{·4} = (ε, ε, −2, −2)`.
- The normalization is needed: `diag(0, 1)` has the eigenpair `(0, (0, ε))`, its only critical
  node is `2`, and `kleenePlus A l 2 + x 2 = ⊥` for both `l`, so the formula would give `(ε, ε)`.

*Needs:* 1.1, 1.2, 1.5, 2.1, 3.1, 3.2.

### 3.5 Critical columns

- `isEigenpair_kleenePlus_col`: if the maximum cycle mean is `0` and `i` is a critical node, the
  column `l ↦ kleenePlus A l i` is an eigenvector for the eigenvalue `0`.
- `kleenePlus_col_eq_of_reflTransGen`: if moreover `j` is reached from `i` by a walk of critical
  arcs, then `kleenePlus A l j = kleenePlus A l i + kleenePlus A i j` for every `l`: the two columns
  are proportional.

(BCOQ, Theorem 3.101, items 1 and 2, with their proof, p. 146; item 1 refers to the proof of
Theorem 3.23. Item 3, the independence of columns from different components, is not stated here.)

Route. For the first, `A ⊗ A⁺ ⊕ A = A⁺ ⊕ A^(|n|+1)` entrywise, and the last term is dominated by
`A⁺` without positive cycles, so `A ⊗ A⁺ ⊕ A = A⁺`. At a critical `i`, `kleenePlus A i i = 0`, so
`(A ⊗ A⁺) l i ≥ A l i + A⁺ i i = A l i` and the column of `A` at `i` is dominated; hence the column
of `A⁺` at `i` is fixed by `A ⊗`, and its entry at `i` is finite. For the second,
`A⁺ i j + A⁺ j i = 0` when `i` and `j` lie on a common critical closed walk (3.3 and the closing
walk), and `A⁺ l j ≥ A⁺ l i + A⁺ i j`, `A⁺ l i ≥ A⁺ l j + A⁺ j i` force equality.

**Checks.**
- In BCOQ Example 3.102 the columns at `3` and `4` coincide and `A⁺ 3 4 = 0`; the column at `1` is
  not proportional to them (its first entry is finite, theirs is `ε`).
- Criticality is needed: for `A = [[−2, −2], [−2, 0]]` (irreducible, maximum cycle mean `0`, the
  only critical node is `2`) the column of `A⁺` at the non-critical node `1` is `(−2, −2)` and
  `A ⊗ (−2, −2) = (−4, −2)`.

*Needs:* 1.1, 1.2, 1.5, 2.1, 3.1, 3.3.

### Examples

BCOQ Examples 3.95 and 3.102; `diag(0, 1)`; `(3)`; `[[−2, −2], [−2, 0]]`.

### Dependencies

Layers 1 and 2; Mathlib `Relation.ReflTransGen`, `Finset.sup`.

## Layer 4: Cyclicity and convergence of the powers

### 4.1 The critical cyclicity

Define `period` (copied verbatim from PeriodicNonnegativeMatrices 1.1): the gcd of the `k ≥ 1`
with `0 < (P ^ k) i i` for a real matrix `P`. Define `criticalPattern A`, the real `0/1` matrix of
the critical arcs, and `criticalCyclicity A`, the lcm over the critical nodes `i` of
`period (criticalPattern A) i`.

- At a critical node, `period (criticalPattern A) i` is the gcd of the lengths of the closed walks
  of critical arcs through `i`; it is positive, and it is the same for all nodes of one strongly
  connected component of the critical graph (PeriodicNonnegativeMatrices 1.1,
  `period_eq_period_of_isIrreducible`, applied to the restriction of the critical pattern to the
  component, which is irreducible since every critical arc lies on a critical closed walk). So
  `criticalCyclicity A` is the cyclicity of the critical graph in the sense of BCOQ,
  Definition 3.94, p. 143, and the matrix cyclicity of van der Woude–Olsder, §IV.B, p. 7805.
- `criticalCyclicity A ≥ 1`, and it is `1` when there is no critical node.

**Checks.**
- `[[0, 1], [1, ε]]` (van der Woude–Olsder, Example 4.1, p. 7805): the pattern has period
  `gcd(1, 2) = 1`, but the only critical cycle is `1 → 2 → 1`, so the critical cyclicity is `2`.
  The period of the pattern is the wrong number: `A³ = [[2, 3], [3, 2]]` differs from
  `1 + A² = [[3, 2], [2, 3]]`.
- BCOQ Example 3.95: components `{1}` and `{3, 4}` of the critical graph, with gcds `1` and
  `gcd(1, 2) = 1`, critical cyclicity `1`. The swap has critical cyclicity `2`.
- The lcm runs over critical nodes only: for the irreducible `3 × 3` matrix of 2.3 the node `2`
  lies on no critical closed walk, its period in the critical pattern is `Nat.setGcd ∅ = 0`, and an
  lcm over all nodes would be `0`.

*Needs:* 3.1; PeriodicNonnegativeMatrices 1.1 (`period`, `period_eq_period_of_isIrreducible`);
Mathlib `Nat.setGcd`, `Finset.lcm`, `Matrix.pow_apply_pos_iff_nonempty_path`.

### 4.2 The cyclicity theorem

Prove `cyclicity`: if `A` is irreducible with maximum cycle mean `μ` and
`σ = criticalCyclicity A`, then `σ ≥ 1` and there is `N` with `mpPow A (k + σ) = σμ + mpPow A k`
entrywise for all `k ≥ N` (van der Woude–Olsder, Theorem 5.1, p. 7806, with the complete proof of
§§V–VIII, pp. 7806–7809; BCOQ, Theorem 3.112, p. 150, asserts exact periodicity only under the
additional hypothesis that the graphs of `A` and `A^σ` are connected, and its route through `A^σ`
needs that hypothesis).

Route (van der Woude–Olsder's). Normalize to `μ = 0`.

1. *Special case.* Let `σ = 1` and `Q = spectralProjector A` (3.1). (a) At a critical `i`,
   `(A^k) i i = 0` for all large `k`: the lengths of the critical closed walks at `i` are closed
   under addition with gcd `1`, so they contain every large number (Tau Ceti
   `Nat.eventually_mem_of_setGcd_eq_one`), and no closed walk has positive weight. (b) For critical
   `i` and every `j`, `(A^k) i j = A⁺ i j` for all large `k`: take `l ≤ |n|` with
   `(A^l) i j = A⁺ i j`, then `(A^(k+l)) i j ≥ (A^k) i i + (A^l) i j`, and no walk of positive
   length weighs more than `A⁺ i j`; dually for critical `j`. (c) For all `i, j` and large `k`,
   (b) on both sides of a critical `l` gives `(A^k) i j ≥ A⁺ i l + A⁺ l j`, hence `≥ Q i j`; a walk
   through a critical `l` weighs at most `A⁺ i l + A⁺ l j` (with `A⁺ l l = 0` for a segment of
   length `0`); a walk of length `k` avoiding the critical nodes splits into a walk without repeated
   nodes, of length less than `|n|`, and cycles without repeated nodes of total length more than
   `k − |n|`. If no cycle avoids the critical nodes, such walks have length less than `|n|`;
   otherwise each of these cycles has mean at most the largest mean `δ < 0` of a cycle avoiding the
   critical nodes, so the weight of the walk is at most `C + (k − |n|)δ`, with `C` the largest
   weight of a walk of length less than `|n|`, which is below every entry of `Q` (all finite for
   irreducible `A`) once `k` is large. So `A^k = Q` for all large `k` (van der Woude–Olsder,
   Special case 5.3 and its proof, p. 7807, the number-theoretic input being their Lemma 5.2).
2. *The graph cyclicity.* Let `ρ = period (pattern A) i`, the same for all `i` by
   PeriodicNonnegativeMatrices 1.1. By 1.3–1.4 of that roadmap (`exists_cyclicClasses`,
   `pow_period_block`) the indices split into `ρ` cyclic classes, `(pattern A)^ρ` vanishes between
   classes and its restriction to each class is primitive, hence irreducible of period `1`
   (`isPrimitive_iff_period_eq_one`). By the consequence of 1.2 the same holds for the finite
   entries of `A^ρ`: up to relabelling, `A^ρ` is block diagonal with irreducible blocks whose
   patterns have period `1`, each block with maximum cycle mean `0` (van der Woude–Olsder,
   Lemma 6.1 and Proposition 6.2, pp. 7807–7808). The power `A^ρ` itself need not be
   irreducible: for the swap, `ρ = 2` and `A² = mpOne`, with two `1 × 1` blocks.
3. *The matrix cyclicity of powers.* Let `k ≥ 1`. A closed walk of `A^k` of length `l` and
   finite weight unfolds, through 1.2, into a closed walk of `A` of length `kl` and the same
   weight, at most `0`; a critical closed walk of `A` of length `L`, run `k` times and read in
   steps of `k`, is a closed walk of `A^k` of length `L` and weight at least `0`. So the maximum
   cycle mean of `A^k` is `0`. The critical arcs of `A^k` are the pairs `(u, v)` joined by a walk
   of length `k` of critical arcs of `A`. If `(u, v)` lies on a critical closed walk of `A^k`, its
   unfolding has weight `0`, so it is critical and all its arcs are critical. Conversely, let `w`
   be a walk of length `k` of critical arcs from `u` to `v`, in a strongly connected component of
   the critical graph whose closed walks have gcd `g`. The walks of critical arcs from `v` to `u`
   have lengths `≡ −k` modulo `g` (followed by `w` they close up), and fixing one of them and
   inserting closed walks at `v` (Tau Ceti `Nat.eventually_mem_of_setGcd_dvd`) gives every large
   length `≡ −k` modulo `g`, in particular a length `(tg − 1)k` with `t` large. Then `w` followed
   by such a walk is a closed walk of critical arcs of length `tgk`, of weight `0` by 3.2, and read
   in steps of `k` it is a closed walk of `A^k` of weight at least `0`, hence critical, through the
   arc `(u, v)`. Every closed walk of `A` has length divisible by `ρ`, so each such gcd `g` is a
   multiple of `ρ`, and `ρ ∣ σ` (van der Woude–Olsder, Lemma 4.2, p. 7806, and Proposition 7.1,
   pp. 7808–7809). Hence `A^σ = (A^ρ)^(σ/ρ)` has the block form of step 2, with blocks that are
   powers of primitive patterns, hence primitive. A critical closed walk of `A` has length `L`
   divisible by `ρ` and moves to the next cyclic class at each step, so it meets every class; run
   `σ` times from a node `u` of a class, it is a closed walk of length `L` and weight `0` of the
   block of `A^σ` at that class, so every block has maximum cycle mean `0`. Finally, a critical
   node `u` of `A^σ` is critical for `A` by the description of the critical arcs, its component of
   the critical graph of `A` has a gcd `g ∣ σ`, so the closed walks of critical arcs of `A` at `u`
   have every length `σm` with `m` large, and read in steps of `σ` they are closed walks of length
   `m` of the critical graph of `A^σ` at `u`: the period of `u` there is `1`. So `A^σ` is, up to
   relabelling, block diagonal with irreducible blocks of maximum cycle mean `0` and critical
   cyclicity `1` (their Lemmas 7.2 and 7.3, p. 7809).
4. *Conclusion.* Step 1 applied to each block gives `M` with `A^(σ(l+1)) = A^(σl)` for `l ≥ M`;
   multiplying by `A^j`, `0 ≤ j < σ`, gives `A^(k+σ) = A^k` for `k ≥ σM` (§VIII, p. 7809).

**Checks.**
- `[[0, 1], [1, ε]]`, `μ = 1`, `σ = 2`: `A^(k+2) = 2 + A^k` holds for all `k ≥ 2`, the powers
  being `A^(2m) = [[2m, 2m − 1], [2m − 1, 2m]]` and `A^(2m+1) = [[2m, 2m + 1], [2m + 1, 2m]]` for
  `m ≥ 1`; it fails for `k = 1`, the entry `(2, 2)` being `ε` in `A` and `2` in `A³`, and for
  `k = 0`, where `A²` has the entry `1` at `(1, 2)`.
- The swap, `μ = 0`, `σ = 2`: `A^(k+2) = A^k` for every `k`, while `A²` is not irreducible.
- Irreducibility is needed: `[[−1, ε], [ε, 0]]` (BCOQ, Example 3.110, second item, p. 150) has
  `μ = 0` and `σ = 1`, but `A^k = diag(−k, 0)` is never periodic; BCOQ Example 3.113,
  `[[−1, ε, ε], [ε, ε, 0], [ε, 0, ε]]`, has `σ = 2` and the entry `(1, 1)` equal to `−k`.

*Needs:* 1.1, 1.2, 1.4, 1.5, 3.1 (including the matrix `spectralProjector`), 3.2, 3.3, 4.1;
PeriodicNonnegativeMatrices 1.1, 1.3, 1.4 (`period`, `period_eq_period_of_isIrreducible`,
`exists_cyclicClasses`, `isPrimitive_iff_period_eq_one`, `pow_period_block`); Tau Ceti
`Nat.eventually_mem_of_setGcd_eq_one`, `Nat.eventually_mem_of_setGcd_dvd`; Mathlib
`Matrix.pow_apply_pos_iff_nonempty_path`, `Matrix.IsPrimitive.isIrreducible`.

### 4.3 Every period is a multiple of the critical cyclicity

Prove `criticalCyclicity_dvd`: for every max-plus matrix, every real `μ` and every `p`, if
`mpPow A (k + p) = pμ + mpPow A k` for all large `k`, then `criticalCyclicity A` divides `p`.
Together with 4.2, for an irreducible matrix the eventual periods are exactly the multiples of the
critical cyclicity, which is the least of them.

(BCOQ, proof of Theorem 3.112, second paragraph, p. 151, proves this divisibility for the
asymptotic cyclicity of a matrix with maximum cycle mean `0` and states that the exact case is
similar; van der Woude–Olsder, §IX, p. 7809, leave the minimality out. The exact case, with an
arbitrary real `μ`, is written out here.)

Route. If `p = 0` or there is no critical node there is nothing to prove (`σ ∣ 0`, and `σ = 1`).
Otherwise let `p ≥ 1` and let `i` be critical. Then a critical closed walk exists, so by 2.2 the
maximum cycle mean `λ` exists; subtracting `λ` (Conventions) reduces to `λ = 0`, the hypothesis
then holding with `μ − λ` in place of `μ`, so assume `λ = 0`. Let `ρ_i = period (criticalPattern A) i`. The lengths of the critical closed walks at `i` are closed
under addition with gcd `ρ_i`, so they contain `mρ_i` for every large `m` (Tau Ceti
`Nat.eventually_mem_of_setGcd_dvd`); with no closed walk of positive weight this gives
`(A^(mρ_i)) i i = 0` for all large `m`. Iterating the hypothesis `ρ_i` times gives
`A^(k + pρ_i) = pρ_i μ + A^k` for large `k`, and at `k = mρ_i`, `(i, i)` both sides are known:
`0 = pρ_i μ`, so `μ = 0`. Now for `m` large the hypothesis gives `(A^(mρ_i + p)) i i = 0`, so by 1.2
some closed walk at `i` of length `mρ_i + p` has weight `0`; it is critical, so all its arcs are
critical and it is a closed walk at `i` in the critical graph. Hence `ρ_i` divides `mρ_i + p`
(`Nat.setGcd_dvd_of_mem`), so
`ρ_i ∣ p`, for every critical `i`; therefore the lcm `σ` divides `p`. Only the diagonal entries
at critical nodes are used, so no irreducibility is needed.

**Checks.**
- For `[[0, 1], [1, ε]]` the period `p = 2` holds (4.2) and `p = 1` fails for every real `μ`: for
  every `k ≥ 2` the entries `(1, 1)` and `(1, 2)` of `A^(k+1)` exceed those of `A^k` by `0` and `2`
  or by `2` and `0` (4.2), never by one constant.
- The statement is not restricted to irreducible matrices: the block matrix
  `[[ε, 0, ε], [0, ε, ε], [ε, ε, 0]]` (the swap beside a loop of weight `0`) has
  `σ = lcm(2, 1) = 2`, `A^(k+2) = A^k` for all `k`, and `A^(k+1) ≠ A^k`.
- `p = 0` always satisfies the hypothesis, and `σ ∣ 0`. A matrix without closed walks of finite
  weight, such as `[[ε, 0], [ε, ε]]`, has `A^k` equal to `⊥` everywhere for `k ≥ 2`, so the
  hypothesis holds for every `p` and every `μ`, and `σ = 1`.

*Needs:* 1.1, 1.2, 2.2, 3.1, 3.2, 4.1; Tau Ceti `Nat.eventually_mem_of_setGcd_dvd`; Mathlib
`Nat.setGcd_dvd_of_mem`, `Finset.lcm_dvd_iff`, `Matrix.pow_apply_pos_iff_nonempty_path`.
(Proved here, completing BCOQ's argument.)

### 4.4 The convergence criterion

Prove `eventually_eq_spectralProjector_iff`: if `A` is irreducible with maximum
cycle mean `0`, then `mpPow A k = spectralProjector A` for all large `k` if and only if
`criticalCyclicity A = 1` (BCOQ, Theorem 3.109 with its proof, p. 149).

Route. If `σ = 1`, step 1 of the route of 4.2 is exactly `A^k = Q` for large `k` (van der
Woude–Olsder, Special case 5.3 and its proof, p. 7807; BCOQ's proofs of Theorems 3.108 and 3.109,
pp. 148–149, which give the same). Conversely, `A^k = Q` for all large `k` gives `A^(k+1) = A^k`, so
`σ ∣ 1` by 4.3.

**Checks.**
- BCOQ Example 3.110, third item (p. 150), with `η = 1/4`: `A = [[−1/4, −1], [0, 0]]` is
  irreducible with critical node `2` only, `σ = 1`, `Q = [[−1, −1], [0, 0]]`, and `A^k = Q` exactly
  for `k ≥ 4`
  (the entry `(1, 1)` of `A^k` is `max(−k/4, −1)`).
- For the irreducible `3 × 3` matrix of 2.3, normalized by subtracting `1`, the powers equal `Q`
  from `k = 4` on and differ from it at `k = 3` in the entry `(2, 3)`.
- The swap has `σ = 2` and its powers alternate between `A` and `mpOne`, never equal to `Q`, whose
  entries are all `0`.
- Irreducibility is needed for the identification of the limit: `[[−1, ε], [ε, 0]]` has `σ = 1`
  and `Q = diag(ε, 0)`, but `A^k = diag(−k, 0) ≠ Q` for every `k`.

*Needs:* 1.2, 1.5, 3.1, 4.1, 4.3, step 1 of the route of 4.2.

### Examples

`[[0, 1], [1, ε]]`, the swap, `[[−1, ε], [ε, 0]]`, BCOQ Examples 3.95, 3.110 and 3.113, the block
matrix of 4.3, the irreducible `3 × 3` matrix of 2.3.

### Dependencies

Layers 1–3; PeriodicNonnegativeMatrices 1.1, 1.3, 1.4; Tau Ceti
`Nat.eventually_mem_of_setGcd_eq_one`, `Nat.eventually_mem_of_setGcd_dvd`; Mathlib `Nat.setGcd`,
`Nat.setGcd_dvd_of_mem`, `Finset.lcm`, `Matrix.IsPrimitive.isIrreducible`,
`Matrix.pow_apply_pos_iff_nonempty_path`.

## Scope and ownership

This roadmap owns the targets stated above: the max-plus product, powers and action on
`WithBot ℝ`; the walk description of the powers; cycle means; eigenvalues as cycle means and the
maximum cycle mean as the greatest eigenvalue; the unique eigenvalue of an irreducible matrix and
the finiteness of its eigenvectors; the critical graph, the critical closed walks and walks; the
eigenspace for the maximum eigenvalue through the critical columns of the Kleene plus; the
critical cyclicity, the cyclicity theorem for irreducible matrices, the divisibility of every
eventual period by the critical cyclicity, and the convergence criterion.

Already in the libraries and therefore not targets:

- Mathlib's tropical semirings `MinTropical` and `MaxTropical`
  (`Mathlib/Algebra/Tropical/Basic.lean`), of which only `MinTropical R` carries a semiring
  structure; the max-plus operations here are the operations of `MaxTropical (WithBot ℝ)` written on
  `WithBot ℝ`.
- Mathlib's irreducible and primitive matrices with the quiver of positive entries and the path
  description of the entries of powers of a nonnegative matrix.
- Tau Ceti's lemma that an additively closed set of natural numbers contains every large multiple
  of its gcd.

Stated by other roadmaps:

- PeriodicNonnegativeMatrices, Layer 1 (the period and the cyclic classes): the period of an index,
  its independence of the index for irreducible matrices (1.1), the cyclic classes (1.3), and the
  primitive blocks of `A ^ d` together with the characterization of primitivity (1.4). They are
  applied above to the pattern matrices, and `period` is copied verbatim.
- Min-plus matrix powers over `MinTropical (WithTop R)` and their description by lightest walks of
  at most `k` arcs (shortest paths) are not treated here; 1.2 is a different statement, about
  heaviest walks of exactly `k` arcs.
- TensorProductCombinatorics uses a max-plus convolution for hives and
  TropicalAndBerkovichArithmetic treats tropical geometry; neither concerns max-plus matrices.

Outside the scope: Karp's formula for the maximum cycle mean; the independence of critical
columns from different components (BCOQ, Theorem 3.101, item 3) and max-plus linear independence;
transient bounds; the spectral theory of reducible matrices (several eigenvalues, the asymptotic
cyclicity of BCOQ, Theorem 3.112); max-plus linear systems and event graphs; every algorithm.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.IsIrreducible` (for
  `[Ring R] [LinearOrder R]`: nonnegative entries and `Quiver.IsSStronglyConnected` for
  `Matrix.toQuiver A`, every ordered pair joined by a path of positive length);
  `Matrix.IsPrimitive`; `Matrix.pow_apply_pos_iff_nonempty_path` (for nonnegative `A` over an
  ordered ring, `0 < (A ^ k) i j` iff there is a path of length `k` from `i` to `j`);
  `Matrix.IsPrimitive.isIrreducible`.
- `Mathlib/NumberTheory/FrobeniusNumber.lean`: `Nat.setGcd`, `Nat.setGcd_dvd_of_mem`.
- `Mathlib/Algebra/Tropical/Basic.lean`: `MaxTropical`, `MinTropical` (named in the Conventions;
  not used in a statement).
- Basic Mathlib: `WithBot`, `Finset.sup`, `Finset.sum`, `Finset.lcm`, `Finset.lcm_dvd_iff`,
  `IsGreatest`, `Relation.ReflTransGen`.

### From Tau Ceti

- `TauCeti/NumberTheory/FrobeniusNumber.lean`: `Nat.eventually_mem_of_setGcd_dvd` (a set of
  naturals closed under addition contains every sufficiently large multiple of its gcd) and
  `Nat.eventually_mem_of_setGcd_eq_one` (with gcd `1`, every sufficiently large natural).

### From TauCetiRoadmap.PeriodicNonnegativeMatrices

For a real matrix `A : Matrix n n ℝ` with `[Fintype n] [DecidableEq n]`:

- 1.1 `period A i := Nat.setGcd {k | 0 < k ∧ 0 < (A ^ k) i i}` (copied verbatim) and
  `period_eq_period_of_isIrreducible` (`A.IsIrreducible`: `period A i = period A j`).
- 1.3 `exists_cyclicClasses` (`A.IsIrreducible`: a surjective `c : n → ZMod (period A i)` with
  `c k = c j + 1` whenever `0 < A j k`, unique up to translation).
- 1.4 `isPrimitive_iff_period_eq_one` (`A.IsPrimitive ↔ A.IsIrreducible ∧ period A i = 1`) and
  `pow_period_block` (`A.IsIrreducible`, `c` a cyclic labelling: `A ^ period A i` vanishes between
  different classes and its restriction to each class is primitive).

## References

- F. Baccelli, G. Cohen, G. J. Olsder and J.-P. Quadrat, *Synchronization and Linearity: An
  Algebra for Discrete Event Systems*, Wiley, 1992; the authors' free web edition
  (`www.rocq.inria.fr/metalau/cohen/documents/BCOQ-book.pdf`). The page numbers are those printed
  in the web edition, whose preface says that its pagination may differ from the 1992 Wiley
  printing while the numbering of theorems, examples and equations is unchanged. Locators:
  §2.3.1–2.3.2, pp. 43–46; §3.2.4, Theorem 3.23, Remark 3.24, Example 3.26, pp. 111–113;
  §3.7, Definition 3.94 to Example 3.113, pp. 143–151.
- J. van der Woude and G. J. Olsder, "On a proof of the general version of the spectral theorem in
  max-plus algebra", *Proceedings of the 44th IEEE Conference on Decision and Control and the
  European Control Conference 2005*, pp. 7804–7809, doi:10.1109/CDC.2005.1583423: Example 4.1,
  Lemma 4.2, Theorem 5.1, Special case 5.3, Lemma 6.1, Proposition 6.2, Proposition 7.1, Lemmas
  7.2–7.3 and §§VIII–IX.
