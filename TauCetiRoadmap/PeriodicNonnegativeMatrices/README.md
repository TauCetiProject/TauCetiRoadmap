# Roadmap: periodic nonnegative matrices

**Summary.** An irreducible nonnegative matrix need not have a positive power: the matrix of a
directed cycle of length at least two permutes the indices and every power of it has zeros. This
roadmap develops the part of Perron–Frobenius theory that measures and explains this failure.
The matrices are real square matrices with nonnegative entries on a finite index set, irreducible in
the sense that the directed graph of their positive entries is strongly connected. The period of
an index is the gcd of the lengths of the closed walks through it in that graph, and the theory is
built on it.

The headline theorems are these.

- *The period and the cyclic classes.* All indices of an irreducible matrix have the same period
  `d`, which is also the gcd of the lengths of the cycles of its graph, and `1 ≤ d ≤ n`. The
  indices split into `d` nonempty classes, unique up to a cyclic relabelling, such that every
  positive entry leads from one class to the next; such a splitting into `m` classes exists
  exactly when `m` divides `d`. The matrix is primitive, some power being entrywise positive, if and
  only if `d = 1`, and the restriction of `A^d` to each class is primitive.
- *The rotation of the spectrum.* An irreducible matrix of period `d` is similar, by a diagonal
  matrix with entries of modulus one, to its own multiple by `exp(2πi/d)`. So its spectrum, with
  algebraic multiplicities, is invariant under the rotation by the angle `2π/d`.
- *The peripheral spectrum.* If the period is `d ≥ 2` and `r` is the Perron root, the eigenvalues
  of modulus `r` are exactly the `d` numbers `r exp(2πij/d)`, and each is a simple root of the
  characteristic polynomial.
- *Graphs.* A connected graph with at least two vertices has an adjacency matrix of period 2 if it
  is bipartite and of period 1 otherwise. A connected graph is bipartite if and only if minus its
  largest adjacency eigenvalue is an eigenvalue, and any finite graph is bipartite if and only if
  its adjacency spectrum is symmetric about zero with multiplicities.

The roadmap builds on Mathlib's irreducible and primitive matrices, defined through the quiver of
positive entries, and on Tau Ceti's Perron–Frobenius theorem for irreducible matrices, which
supplies the positive Perron eigenvector, the subinvariance theorem and the simplicity of the
Perron root; the spectral statements here are derived from these. Tau Ceti's Frobenius-number
lemmas turn gcd conditions on return times into eventual positivity. The primitive case of the
peripheral statement, that a primitive matrix has no other eigenvalue of modulus `r`, belongs to
the roadmap ClassicalErgodicTheory and is not stated here.

Layer 1 below defines the period and proves the combinatorial theorems: the period is a class
invariant, it is the gcd of the cycle lengths, the cyclic classes exist and characterize it, and
it detects primitivity. Layer 2 derives the rotation and the peripheral spectrum from Layer 1 and
Tau Ceti. Layer 3 specializes both to adjacency matrices of graphs.

## Conventions

- **Matrices.** `A : Matrix n n ℝ` with `[Fintype n] [DecidableEq n]`. Irreducibility is
  Mathlib's `Matrix.IsIrreducible`: the entries are nonnegative and the quiver `Matrix.toQuiver A`,
  with an arrow `i ⟶ j` when `0 < A i j`, joins every ordered pair of indices, equal or not, by a
  path of positive length. Primitivity is Mathlib's `Matrix.IsPrimitive`: nonnegative entries and
  `0 < (A ^ k) i j` for all `i, j` for some `k > 0`. A closed walk of length `k` at `i` is a path
  from `i` to `i` of length `k` in that quiver; for a nonnegative `A`, by Mathlib's
  `Matrix.pow_apply_pos_iff_nonempty_path`, one exists exactly when `0 < (A ^ k) i i`.
- **Degenerate index types.** On the empty index type every matrix is irreducible and primitive,
  vacuously, and no statement with a chosen index applies. The `1 × 1` zero matrix is not
  irreducible, since there is no path of positive length from the index to itself; every `1 × 1`
  matrix `(a)` with `a > 0` is irreducible and primitive, of period 1.
- **Cycles.** A cycle of length `k ≥ 1` is an injective `c : Fin k → n` with
  `0 < A (c t) (c (t + 1))` for every `t`, the index `t + 1` taken modulo `k` (Mathlib's
  `finRotate k`). A loop `0 < A i i` is a cycle of length 1.
- **Labellings.** A cyclic labelling of `A` by `ZMod m` is a map `c : n → ZMod m` with
  `c k = c j + 1` whenever `0 < A j k`. For `m = 0` the target `ZMod 0` is `ℤ`.
- **Spectra.** Eigenvalues are complex: those of `A.map (↑) : Matrix n n ℂ`, as in Tau Ceti's
  Perron–Frobenius files. The spectrum is Mathlib's `spectrum ℂ`, which for a matrix over a field
  is the set of roots of `Matrix.charpoly` (`Matrix.mem_spectrum_iff_isRoot_charpoly`), and the
  algebraic multiplicity of `μ` is `Polynomial.rootMultiplicity μ` of the characteristic
  polynomial. A Perron root of an irreducible `A` is given, as in Tau Ceti, by a real `r` and a
  vector `v` with `0 < v j` for all `j` and `A *ᵥ v = r • v`; on a nonempty index type `r > 0`
  and `r` is the spectral radius (Tau Ceti `Matrix.spectralRadius_eq_of_mulVec_eq_smul`).
- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]`, `[DecidableEq V]` and
  `[DecidableRel G.Adj]`; its adjacency matrix is `G.adjMatrix ℝ`, and bipartite means Mathlib's
  `G.IsBipartite`, that is `G.Colorable 2`. For a connected graph the Perron root of the adjacency
  matrix is its largest eigenvalue.
- **Notation.** `d` is the period, `ζ = exp(2πi/d)`, written `Complex.exp (2 * π * I / d)`; for
  `d = 1` it is `1`.

## Layer 1: The period and the cyclic classes

### 1.1 The period of an index

Define `period`: `period A i` is the gcd (Mathlib's `Nat.setGcd`) of the set of `k ≥ 1` with
`0 < (A ^ k) i i`; for a nonnegative `A` these are the lengths of the closed walks at `i`. It is
`0` when there is no such `k`, and its definition assumes neither nonnegativity nor
irreducibility.

Prove `period_eq_period_of_isIrreducible`: for an irreducible `A`, `period A i = period A j` for
all indices `i`, `j` (Brouwer–Haemers, §2.2, p. 30, where it is stated without proof).

Route: take paths from `i` to `j` and from `j` to `i`, of lengths `a, b ≥ 1`. For every closed
walk at `j` of length `m`, the numbers `a + b` and `a + m + b` are lengths of closed walks at `i`,
since `(A ^ (a + m + b)) i i ≥ (A ^ a) i j * (A ^ m) j j * (A ^ b) j i` for a nonnegative matrix.
So `period A i` divides `m` for every such `m`, hence divides `period A j` by Mathlib's
`Nat.dvd_setGcd_iff`; exchange `i` and `j`. This is the argument of Tau Ceti's
`ProbabilityTheory.Kernel.period_dvd_period_of_pos` for the period of a Markov kernel, carried out
for the powers of a nonnegative matrix.

For a nonnegative `A`, `period A i` is the period of the vertex `i` of the quiver
`Matrix.toQuiver A` (the gcd of the lengths of its closed paths at `i`), by
`Matrix.pow_apply_pos_iff_nonempty_path`.

**Checks.**
- The matrix `[[0, 1], [1, 0]]` has closed walks of every even length and of no odd length at both
  indices: period 2. The matrix `[[1, 1], [1, 0]]` has a loop at the first index and closed walks
  of lengths 2 and 3 at the second: period 1 at both.
- The period is a gcd, not the least return time: `A = [[0, 1, 0], [1, 0, 1], [1, 0, 0]]` has the
  cycles `0 → 1 → 0` and `0 → 1 → 2 → 0`, so the shortest closed walk at `0` has length 2 while
  the period is `gcd(2, 3) = 1` at every index.
- Irreducibility is needed: `[[1, 0], [0, 0]]` has period 1 at the first index and period 0 at the
  second, which has no closed walk. The block matrix `[[1, 0, 0], [0, 0, 1], [0, 1, 0]]` has
  periods 1, 2, 2, all positive.
- The `1 × 1` zero matrix has period 0, and it is not irreducible.
- Nonnegativity is needed for the description by closed walks: for the `1 × 1` matrix `A = (−1)`,
  `Matrix.toQuiver A` has no arrow, so there is no closed walk, but `(A ^ k) 0 0 = (−1) ^ k` is
  positive exactly for even `k`, and `period A 0 = Nat.setGcd {2, 4, 6, …} = 2`.

*Needs:* Mathlib `Nat.setGcd`, `Nat.dvd_setGcd_iff`, `Nat.setGcd_dvd_of_mem`,
`Matrix.IsIrreducible`, `Matrix.isIrreducible_iff_exists_pow_pos`. (Proved here.)

### 1.2 Cycles and the size of the period

- `period_eq_setGcd_cycleLengths`: for an irreducible `A` and every index `i`, `period A i` is the
  gcd of the lengths of all cycles of `A`, in the sense of the Conventions.
- `period_mem_Icc`: for an irreducible `A`, `1 ≤ period A i ≤ Fintype.card n`.

(Boyle, Definition 3.2, p. 3, defines the period of an irreducible matrix as the gcd of the lengths
of all closed walks of its graph, at all vertices; by 1.1 and the first statement this is
`period A i` for every `i`.)

Route: a cycle through `j` of length `k` is a closed walk at `j`, so `period A j = period A i`
divides `k`. Conversely, every closed walk `v₀ → v₁ → ⋯ → v_m = v₀` of positive length splits into
cycles: if `v_a = v_b` for some `0 ≤ a < b < m`, cutting out the closed walk from `v_a` to `v_b`
leaves two shorter closed walks of positive length, and if `v₀, …, v_(m−1)` are distinct the walk
is a cycle. So every closed-walk length at `i` is a sum of cycle lengths and is divisible by their
gcd. For the bounds, the closed walks at `i` form a nonempty set of positive numbers
(irreducibility gives one), so the gcd is at least 1; the decomposition gives a cycle, whose
length is at most `Fintype.card n` because `c` is injective, and the period divides it.

**Checks.**
- For `[[0, 1, 0], [1, 0, 1], [1, 0, 0]]` the cycle lengths are 2 and 3, with gcd 1, the period
  of 1.1.
- Irreducibility is needed: for `[[1, 0], [0, 0]]` the only cycle is the loop at the first index,
  so the gcd of the cycle lengths is 1, while the period at the second index is 0.
- The upper bound is attained by the matrix of the directed `n`-cycle, `A i (i + 1) = 1` on
  `ZMod n` and all other entries 0, whose period is `n`; the lower bound by every positive matrix.

*Needs:* 1.1; Mathlib `Nat.setGcd`, `Nat.dvd_setGcd_iff`, `finRotate`,
`Matrix.pow_apply_pos_iff_nonempty_path`, `Matrix.isIrreducible_iff_exists_pow_pos`. (Proved
here.)

### 1.3 Cyclic classes

- `exists_cyclicClasses`: for an irreducible `A` and an index `i`, with `d = period A i`, there is
  a cyclic labelling `c : n → ZMod d` that is surjective, and every cyclic labelling by `ZMod d`
  is `c + a` for a constant `a`.
- `dvd_period_iff`: for an irreducible `A`, an index `i` and every natural number `m`, a cyclic
  labelling by `ZMod m` exists if and only if `m ∣ period A i`.

The classes `{j | c j = a}` are the cyclic classes of `A`. Listing the indices class by class
brings `A` to the cyclic block form, in which the only nonzero blocks are those from class `a` to
class `a + 1`; the statements are made on the labelling, not on a reordered matrix (Boyle, the
paragraph after Definition 3.2, p. 3, where the partition and the block form are stated without a
proof; Brouwer–Haemers, proof of Theorem 2.2.1 (iii), p. 31, uses the same ordering).

Route: set `c j` to the length, modulo `d`, of any path from `i` to `j`. Two such paths, of
lengths `a` and `a'`, followed by one path back from `j` to `i` of length `b`, give closed walks
at `i` of lengths `a + b` and `a' + b`, so `d` divides `a − a'` and `c` is well defined; extending
a path by one arrow shows that `c` is a cyclic labelling. A closed walk at `i` of positive length
`m` has `d ∣ m`, so `m ≥ d`, and its first `d` vertices carry the labels `0, 1, …, d − 1`, so `c`
is surjective. Another cyclic labelling `c'` increases by one along every arrow, so
`c' j = c' i + c j` along a path from `i` to `j`. For the second statement: if `m ∣ d`, compose
`c` with the ring map `ZMod d → ZMod m` (Mathlib's `ZMod.castHom`); conversely a cyclic labelling
by `ZMod m` returns to its value after a closed walk at `i` of length `k`, so `(k : ZMod m) = 0`,
that is `m ∣ k`, for every such `k`, and `m ∣ d` by `Nat.dvd_setGcd_iff`. For `m = 0` both sides
are false: `0 ∣ d` fails because `d ≥ 1` by 1.2, and an integer labelling would increase strictly
around a closed walk.

**Checks.**
- The directed 4-cycle `0 → 1 → 2 → 3 → 0` with the extra arrow `0 → 3` has cycles of lengths 4
  and 2, so period 2. Its cyclic labelling by `ZMod 2` is `(0, 1, 0, 1)`, with classes `{0, 2}`
  and `{1, 3}`, and the only other one is `(1, 0, 1, 0)`. There is no labelling by `ZMod 3` or by
  `ZMod 4`, although 4 is the length of a cycle, since the cycle of length 2 has a length not
  divisible by them.
- A primitive matrix, of period 1, has no cyclic labelling by `ZMod 2`, as `dvd_period_iff`
  requires since `2 ∤ 1`: for `[[1, 1], [1, 0]]` the loop `0 < A 0 0` would force
  `c 0 = c 0 + 1` in `ZMod 2`.
- The matrix of the directed 3-cycle has the labellings `j ↦ j + a` on `ZMod 3`, three in all.
- Uniqueness up to translation needs irreducibility: the matrix of two disjoint 2-cycles,
  `0 ⇄ 1` and `2 ⇄ 3`, has period 2 at every index and the labellings `(0, 1, 0, 1)` and
  `(0, 1, 1, 0)`, which do not differ by a constant.
- The characterization of the divisors needs irreducibility: at the second index of
  `[[1, 0], [0, 0]]` the period is 0, which every `m` divides, but the loop at the first index
  rules out every labelling by `ZMod 2`.

*Needs:* 1.1, 1.2; Mathlib `ZMod`, `ZMod.castHom`, `Nat.dvd_setGcd_iff`,
`Matrix.pow_apply_pos_iff_nonempty_path`. (Proved here.)

### 1.4 Primitivity and the power `A ^ d`

- `isPrimitive_iff_period_eq_one`: for every index `i`, `A` is primitive if and only if `A` is
  irreducible and `period A i = 1` (Boyle, Proposition 3.3, p. 4, where the proof is left as an
  exercise).
- `pow_period_block`: let `A` be irreducible, `d = period A i`, and `c` a cyclic labelling by
  `ZMod d`. Then `(A ^ d) j k = 0` whenever `c j ≠ c k`, and for every class `a` the restriction of
  `A ^ d` to `{j | c j = a}` is primitive (Boyle, Proposition 3.5, p. 4, for the cyclic block form,
  where the primitivity of the blocks is asserted from their irreducibility and period one;
  Brouwer–Haemers, proof of Theorem 2.2.1 (iii), p. 31).

Route for the first statement. If `A ^ k` is entrywise positive with `k > 0`, then `A` is
irreducible (Mathlib's `Matrix.IsPrimitive.isIrreducible`). Irreducibility gives every index `j`
an arrow `l ⟶ j`, so `A ^ (k + 1) = A ^ k * A` is entrywise positive as well; hence `k` and
`k + 1` are closed-walk lengths at `i` and the period is 1. Conversely, the closed-walk lengths at
any index `j` are closed under addition and have gcd 1 by 1.1, so they contain every sufficiently
large number (Tau Ceti's `Nat.eventually_mem_of_setGcd_eq_one`); a path from `j` to `k` of length
`a` then gives `0 < (A ^ N) j k` for every large `N`, and one `N` serves all pairs.

Route for the second statement. A path of length `d` from `j` to `k` raises the label by `d = 0`,
so `(A ^ d) j k`, which is positive exactly when such a path exists, vanishes between different
classes. Hence `A ^ d` is block diagonal and the `m`-th power of its block on a class is the block
of `A ^ (d m)`. Every path between two indices of one class has length divisible by `d`, and the
closed-walk lengths at `j` are closed under addition with gcd `d`, so by Tau Ceti's
`Nat.eventually_mem_of_setGcd_dvd` they contain every large multiple of `d`; as before one `m`
makes every entry of the block of `A ^ (d m)` positive. The classes are nonempty by 1.3.

**Checks.**
- `[[0, 1], [1, 0]]` is irreducible of period 2 and not primitive: its powers alternate between it
  and the identity. `[[1, 1], [1, 0]]` is primitive, its square `[[2, 1], [1, 1]]` being positive.
- Irreducibility is needed in both statements: `[[1, 0], [0, 0]]` has period 1 at its first
  index and is not primitive, and with the constant labelling by `ZMod 1` the restriction of
  `A ^ 1` to its single class is `A` itself.
- For the 4-cycle with the arrow `0 → 3` of 1.3, `A ^ 2` has the block `[[1, 1], [1, 0]]` on the
  class `{0, 2}` and `[[0, 1], [1, 1]]` on `{1, 3}` and vanishes between the classes; both blocks
  are primitive, with positive squares `[[2, 1], [1, 1]]` and `[[1, 1], [1, 2]]`.
- For the directed `n`-cycle `A ^ n` is the identity and every class is a single index, whose
  `1 × 1` block `(1)` is primitive.

*Needs:* 1.1, 1.3; Mathlib `Matrix.IsPrimitive`, `Matrix.IsPrimitive.isIrreducible`,
`Matrix.pow_apply_pos_iff_nonempty_path`, `Matrix.submatrix`; Tau Ceti
`Nat.eventually_mem_of_setGcd_eq_one`, `Nat.eventually_mem_of_setGcd_dvd`. (Proved here.)

### Examples

The two 2 × 2 matrices `[[0, 1], [1, 0]]` and `[[1, 1], [1, 0]]`; the 3 × 3 matrix with cycles of
lengths 2 and 3; the directed `n`-cycle; the directed 4-cycle with the arrow `0 → 3`, of period 2;
the reducible matrices `[[1, 0], [0, 0]]` and `[[1, 0, 0], [0, 0, 1], [0, 1, 0]]`.

### Dependencies

Mathlib `Matrix.IsIrreducible`, `Matrix.IsPrimitive`, `Matrix.IsPrimitive.isIrreducible`,
`Matrix.toQuiver`, `Matrix.pow_apply_pos_iff_nonempty_path`,
`Matrix.isIrreducible_iff_exists_pow_pos`, `Matrix.submatrix`, `Nat.setGcd`,
`Nat.dvd_setGcd_iff`, `Nat.setGcd_dvd_of_mem`, `ZMod`, `ZMod.castHom`, `finRotate`; Tau Ceti
`Nat.eventually_mem_of_setGcd_eq_one`, `Nat.eventually_mem_of_setGcd_dvd`. No other layer.

## Layer 2: The peripheral spectrum

### 2.1 Rotation of the spectrum

- `exists_diagonal_conj_eq_exp_smul`: for an irreducible `A` and an index `i`, with
  `d = period A i` and `ζ = exp(2πi/d)`, there is `D : n → ℂ` with `‖D j‖ = 1` for every `j` and
  `diagonal D * A * diagonal D⁻¹ = ζ • A`, with `A` viewed as a complex matrix.
- `rootMultiplicity_charpoly_exp_mul`: for every `μ : ℂ`, `ζ μ` and `μ` have the same multiplicity
  as roots of the characteristic polynomial of `A`.

(Boyle, Proposition 3.6, p. 4, with the similarity written out for period 3 in the proof;
Brouwer–Haemers, Theorem 2.2.1 (iii), p. 30, for the invariance of the spectrum.)

Route: take a cyclic labelling `c` from 1.3 and `D j = ζ ^ (−(c j).val)`, well defined since
`ζ ^ d = 1`. The `(j, k)` entry of `diagonal D * A * diagonal D⁻¹` is `ζ ^ (val (c k) − val (c j))`
times `A j k`; it is `ζ A j k` when `A j k > 0`, since then `c k = c j + 1`, and `0` otherwise.
So `ζ • A` and `A` are conjugate and have the same characteristic polynomial (Mathlib's
`Matrix.charpoly_units_conj`). The characteristic polynomial of `ζ • B` is that of `B` with `X`
replaced by `ζ⁻¹ X` and multiplied by `ζ ^ n`, so its roots are those of `B` multiplied by `ζ`,
with the same multiplicities.

**Checks.**
- `[[0, 2], [8, 0]]` has period 2 and characteristic polynomial `X² − 16`, eigenvalues `4` and
  `−4`; `D = (1, −1)` conjugates it to its negative.
- The weighted 3-cycle with entries `A 0 1 = 1`, `A 1 2 = 2`, `A 2 0 = 4` has period 3 and
  characteristic polynomial `X³ − 8 = (X − 2)(X² + 2X + 4)`, with eigenvalues `2`, `−1 + i√3` and
  `−1 − i√3`, a single orbit of the rotation by `2π/3`. The rotation by `π` does not preserve the
  spectrum, since `−2` is not an eigenvalue.
- Zero eigenvalues are allowed: the adjacency matrix of the path on three vertices has period 2
  and eigenvalues `√2, 0, −√2`.
- Irreducibility is needed: `[[0, 1, 0], [1, 0, 0], [0, 0, 1]]` has period 2 at its first index
  and characteristic polynomial `(X − 1)² (X + 1)`, so the rotation by `π` exchanges eigenvalues of
  multiplicities 2 and 1.

*Needs:* 1.3; Mathlib `Matrix.diagonal`, `Matrix.charpoly`, `Matrix.charpoly_units_conj`,
`Polynomial.rootMultiplicity`, `Complex.exp`, `ZMod.val`. (Proved here.)

### 2.2 The peripheral eigenvalues

Prove `peripheral_spectrum`: let `A` be irreducible with `d = period A i ≥ 2`, and let `r` be its
Perron root, `A *ᵥ v = r • v` with `v` entrywise positive. Then the set of eigenvalues of modulus
`r` is `{μ : ℂ | μ ^ d = r ^ d}`, it has exactly `d` elements, and each of them is a simple root
of the characteristic polynomial (Brouwer–Haemers, Theorem 2.2.1 (iii), p. 30, for the `d`
eigenvalues of modulus `r`; Boyle, Theorem 3.9 (2), p. 5, also for their simplicity).

The hypothesis `d ≥ 2` is not used by the route below; it only excludes the case `d = 1`. For
`d = 1` the statement says that the Perron root is the only eigenvalue of modulus `r` of a
primitive matrix, and that it is simple, which is part of the roadmap ClassicalErgodicTheory, §8.6
item 1 (the finite Perron–Frobenius theorem for primitive matrices), and is not restated here.

Route. By Tau Ceti every complex eigenvalue has modulus at most `r`
(`Matrix.norm_le_of_mulVec_le_smul`), and `r > 0`, since `r` is the eigenvalue of the positive
eigenvector given by `Matrix.IsIrreducible.exists_mulVec_eq_smul`
(`Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg`). Let `A z = θ z` with `z ≠ 0` and
`‖θ‖ = r`, and let `y` be the vector of moduli `‖z j‖`. The triangle inequality gives
`r • y ≤ A *ᵥ y`, so `A *ᵥ y = r • y` by Tau Ceti's subinvariance theorem
`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`, and `y` is entrywise positive by
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`. So each sum `∑ₖ A j k z k = θ z j` is a case of
equality in the triangle inequality, and every `z k` with `A j k > 0` has the argument of
`θ z j`: with `u j = z j / ‖z j‖` and `ω = θ / r`, `u k = ω u j` along every arrow. Along a
closed walk at `i` of length `m` this gives `ω ^ m = 1`; so the order of `ω` divides every
closed-walk length, hence divides `d` (`Nat.dvd_setGcd_iff`), and `θ ^ d = r ^ d`. Conversely
the solutions of `μ ^ d = r ^ d` are `r ζ ^ j` for `0 ≤ j < d`, which are `d` distinct numbers
since `r > 0`; by 2.1, applied `j` times, each has the multiplicity of `r`, which is 1 by Tau
Ceti's `Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one`, transferred from the real to the
complex characteristic polynomial by `Matrix.charpoly_map` and
`Polynomial.eq_rootMultiplicity_map`. A root of positive multiplicity is an eigenvalue
(`Matrix.mem_spectrum_iff_isRoot_charpoly`).

**Checks.**
- The 4-cycle with the arrow `0 → 3` of 1.3, all positive entries `1`, has characteristic
  polynomial `X⁴ − X² − 1`, so `r² = (1 + √5)/2`. Its eigenvalues of modulus `r` are `r` and `−r`,
  both simple; the two others are `±i √((√5 − 1)/2)`, of modulus `r⁻¹ < r`.
- The weighted 3-cycle of 2.1: `r = 2`, and the three eigenvalues `2`, `−1 ± i√3` all have modulus
  2 and cube `8`.
- The adjacency matrix of the star with three leaves has period 2, `r = √3`, eigenvalues
  `√3, 0, 0, −√3`: the peripheral eigenvalues are simple while `0` is a double eigenvalue.
- Irreducibility is needed: the block matrix `[[0, 1, 0], [1, 0, 0], [0, 0, 1]]` has the positive
  eigenvector `(1, 1, 1)` for `r = 1` and period 2 at its first index, but `1` is a double root.
- Positivity of `v` is needed: `[[0, 1], [1, 0]]` has period 2 and the eigenvector `(1, −1)` for
  `−1`; with `r = −1` no eigenvalue has modulus `r`, while `μ ^ 2 = 1` has two solutions.

*Needs:* 1.1, 2.1; Mathlib `Matrix.charpoly_map`, `Polynomial.eq_rootMultiplicity_map`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Polynomial.rootMultiplicity_pos`,
`Nat.dvd_setGcd_iff`, `orderOf`; Tau Ceti `Matrix.norm_le_of_mulVec_le_smul`,
`Matrix.IsIrreducible.exists_mulVec_eq_smul`, `Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg`,
`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`,
`Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one`. (Proved here, following the cited
statements.)

### Examples

The matrix `[[0, 2], [8, 0]]`, the weighted 3-cycle with entries `1, 2, 4`, the 4-cycle with the
arrow `0 → 3`, the path on three vertices and the star with three leaves, and the reducible
`[[0, 1, 0], [1, 0, 0], [0, 0, 1]]`.

### Dependencies

Layer 1 (1.1 and 1.3); Mathlib `Matrix.diagonal`, `Matrix.charpoly`, `Matrix.charpoly_units_conj`,
`Matrix.charpoly_map`, `Polynomial.rootMultiplicity`, `Polynomial.eq_rootMultiplicity_map`,
`Polynomial.rootMultiplicity_pos`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Complex.exp`,
`ZMod.val`, `orderOf`, `Nat.dvd_setGcd_iff`; Tau Ceti `Matrix.norm_le_of_mulVec_le_smul`,
`Matrix.IsIrreducible.exists_mulVec_eq_smul`, `Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg`,
`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`,
`Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one`.

## Layer 3: Adjacency matrices of graphs

### 3.1 The period of a connected graph

Prove `period_adjMatrix`: if `G` is connected and `V` has at least two elements, then for every
vertex `v` the period of `G.adjMatrix ℝ` at `v` is 2 when `G` is bipartite and 1 otherwise
(Brouwer–Haemers, §3.4, p. 46, the sentence before Proposition 3.4.1).

Route: the adjacency matrix is irreducible, since connected vertices are joined by a walk, of
positive length when they differ, and a vertex `u` has a neighbour `w`, so `u → w → u` is a closed
walk of length 2. So the period divides 2. By Mathlib's
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk` the closed-walk lengths at `v` in the quiver are
the lengths of closed walks of `G` at `v`. By Mathlib's
`SimpleGraph.two_colorable_iff_forall_loop_even`, `G` is bipartite exactly when every closed walk
at every vertex has even length; a closed walk of odd length at `u` gives one at `v`, going to `u`
and back along the same walk. So the period is 2 for bipartite `G`, and an odd
closed-walk length at `v` forces period 1 otherwise.

**Checks.**
- `K₂` and the 4-cycle have period 2; the triangle and the 5-cycle have period 1.
- The hypothesis on the number of vertices is needed: on one vertex the adjacency matrix is the
  `1 × 1` zero matrix, of period 0, and the graph is bipartite.
- Connectedness is needed: the disjoint union of `K₂` and a triangle is not bipartite, and its
  adjacency matrix has period 2 at either vertex of `K₂`.

*Needs:* 1.1; Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`,
`SimpleGraph.two_colorable_iff_forall_loop_even`, `SimpleGraph.Connected`,
`Matrix.isIrreducible_iff_exists_pow_pos`. (Proved here.)

### 3.2 The smallest eigenvalue of a connected graph

Prove `isBipartite_iff_neg_mem_spectrum`: let `G` be connected and let `r` be the Perron root of
its adjacency matrix, `A *ᵥ x = r • x` with `x` entrywise positive. Then `G` is bipartite if and
only if `−r` is an eigenvalue of `G.adjMatrix ℝ` (Brouwer–Haemers, Proposition 3.4.1 (ii), p. 46,
where it is derived from Theorem 2.2.1 (iii)).

Route: on one vertex `A = 0`, `r = 0` and both sides hold. Otherwise `A` is irreducible, by the
first step of the route of 3.1, and `r > 0`, since `(A *ᵥ x) v > 0` at every vertex `v`, which has
a neighbour. If `G` is bipartite with a colouring `s : V → {1, −1}`, the vector `s • x` satisfies
`A (s • x) = −r (s • x)`, because every edge joins vertices of different colours. Conversely let
`A z = −r z` with `z` real and nonzero. As in 2.2 the vector `|z|` is entrywise positive and
`A |z| = r |z|`, so each sum `∑ₖ A j k z k = −r z j` is a case of equality in the triangle
inequality; as `r > 0` and `z j ≠ 0`, every neighbour `k` of `j` has `z k` of the sign opposite
to `z j`. The sign of `z` is then a proper 2-colouring.

**Checks.**
- The star with three leaves: `r = √3`, and `−√3` is an eigenvalue. The 5-cycle: `r = 2`, the
  eigenvalues are `2` and `(√5 − 1)/2` and `−(√5 + 1)/2`, each of the last two twice, and `−2` is
  not one.
- On one vertex `r = 0` is an eigenvalue of the zero matrix, and the graph is bipartite.
- Positivity of `x` is needed: `K₄` with one edge `ab` deleted is connected and not bipartite, and
  `x = e_a − e_b` satisfies `A *ᵥ x = 0`; with `r = 0` the number `−r = 0` is an eigenvalue.
- Connectedness is needed: the disjoint union of a 4-cycle and a triangle is 2-regular, so the
  all-ones vector is a positive eigenvector with `r = 2`; its characteristic polynomial is
  `X² (X − 2)² (X + 1)² (X + 2)`, so `−2` is an eigenvalue, and the graph is not bipartite.

*Needs:* 3.1; Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.IsBipartite`,
`SimpleGraph.Connected`, `Matrix.mem_spectrum_iff_isRoot_charpoly`; Tau Ceti
`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`. (Proved here.)

### 3.3 Symmetric spectra

Prove `isBipartite_iff_rootMultiplicity_neg`: a finite graph `G` is bipartite if and only if
`−μ` and `μ` have the same multiplicity as roots of the characteristic polynomial of
`G.adjMatrix ℝ` for every real `μ` (Brouwer–Haemers, Proposition 3.4.1 (i), p. 46).

Route: if `G` is bipartite with colouring `s`, the diagonal matrix `S` with entries `s v = ±1`
satisfies `S A S = −A`, so `A` and `−A` have the same characteristic polynomial
(`Matrix.charpoly_units_conj`), and the roots of the characteristic polynomial of `−A` are those
of `A` negated. Conversely, the characteristic polynomial of the real symmetric matrix `A` has
the eigenvalues of `A` as its roots (Mathlib's `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues`),
and the spectral theorem (`Matrix.IsHermitian.spectral_theorem`) gives
`trace (A ^ k) = ∑ λ ^ k` over the eigenvalues listed with multiplicity. For odd `k` a spectrum
symmetric with multiplicities gives `trace (A ^ k) = 0`; but `trace (A ^ k)` is the number of
closed walks of length `k` (`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`), so there is none,
and `G` is bipartite by `SimpleGraph.two_colorable_iff_forall_loop_even`. This route uses neither
connectedness nor Layer 2; Brouwer–Haemers argue instead component by component from 3.2.

**Checks.**
- The path on three vertices has eigenvalues `√2, 0, −√2`; the triangle has `2, −1, −1` and is not
  bipartite.
- Multiplicities are needed: the disjoint union of a triangle and a 6-cycle is not bipartite, and
  its characteristic polynomial `(X − 2)² (X − 1)² (X + 1)⁴ (X + 2)` has the symmetric set of roots
  `{2, 1, −1, −2}`, with `2` double and `−2` simple.
- On the empty vertex type the characteristic polynomial is `1`, every multiplicity is `0`, and
  the graph is bipartite.

*Needs:* Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `SimpleGraph.two_colorable_iff_forall_loop_even`,
`Matrix.charpoly_units_conj`, `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues`,
`Matrix.IsHermitian.spectral_theorem`, `Polynomial.rootMultiplicity`. (Proved here.)

### Examples

`K₂`, the path on three vertices, the triangle, the 4-cycle, the 5-cycle, the star with three
leaves, the one-vertex and the empty graph, and the disjoint unions of a 4-cycle with a triangle
and of a triangle with a 6-cycle.

### Dependencies

1.1 (3.1), and 3.1 (3.2); Mathlib `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `SimpleGraph.two_colorable_iff_forall_loop_even`,
`SimpleGraph.Connected`, `SimpleGraph.IsBipartite`, `Matrix.charpoly_units_conj`,
`Matrix.IsHermitian.roots_charpoly_eq_eigenvalues`, `Matrix.IsHermitian.spectral_theorem`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.isIrreducible_iff_exists_pow_pos`; Tau Ceti
`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`,
`Matrix.IsIrreducible.pos_of_mulVec_eq_smul`.

## Downstream consumers

The roadmap ClassicalErgodicTheory, §8.4 item 3, splits the shift space of an irreducible
subshift of finite type of period `d` into `d` clopen sets cyclically permuted by the shift; the
cylinders over the cyclic classes of 1.3 of its transition matrix are such sets.

## Scope and ownership

This roadmap owns the targets stated above: the period of an index of a nonnegative matrix and its
independence of the index for irreducible matrices; the period as the gcd of the cycle lengths and
its bounds; the cyclic classes, their uniqueness and the characterization of the divisors of the
period by cyclic labellings; primitivity as irreducibility with period one, and the primitive
blocks of `A ^ d`; the diagonal similarity of `A` and `ζ A`, the rotation of the spectrum with
multiplicities and the peripheral spectrum for period at least two; the period of a connected
graph, the eigenvalue `−r` of a connected bipartite graph, and the symmetric spectrum of a
bipartite graph.

Already in the libraries and therefore not targets:

- Mathlib's irreducible and primitive matrices with the quiver of positive entries, the
  path description of the entries of powers, the equivalence of irreducibility with positivity of
  some power at every pair, and primitivity implying irreducibility.
- Tau Ceti's Perron–Frobenius theorem: for a nonnegative matrix a nonnegative eigenvector for the
  spectral radius (`Matrix.exists_mulVec_eq_smul_of_nonneg`) and the Collatz–Wielandt bounds; for
  an irreducible matrix the positive Perron vector and its eigenvalue
  (`Matrix.IsIrreducible.exists_mulVec_eq_smul`), the positivity and uniqueness of nonnegative
  eigenvectors, the one-dimensional Perron eigenspace, the simplicity of the Perron root
  (`Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one`), subinvariance
  (`Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec`) and the primitivity of `1 + A`
  (`Matrix.IsIrreducible.isPrimitive_one_add`); the identification of the Perron root with the
  spectral radius (`Matrix.spectralRadius_eq_of_mulVec_eq_smul`).
- Tau Ceti's period of a state of a Markov kernel (`ProbabilityTheory.Kernel.period`), constant on
  communicating classes (`ProbabilityTheory.Kernel.period_eq_period_of_pos`), with its
  aperiodicity results; these realize the period and aperiodicity of the roadmap
  MarkovChainsAndRenewal, Layer 3 (equilibrium and coupling). The period of 1.1 is a different
  object: it is defined for a nonnegative real matrix, whose entries need not be transition
  probabilities, through the powers of the matrix.

Left to other roadmaps:

- ClassicalErgodicTheory, §8.6 item 1, states the primitive case of the Perron–Frobenius
  theorem: the spectral radius of a primitive matrix is a simple eigenvalue with positive left and
  right eigenvectors, every other eigenvalue has smaller modulus, and the normalized powers
  converge. That is the case `d = 1` of 2.2, which is therefore stated here only for `d ≥ 2`;
  2.1 and 2.2 do not use it. Its §8.4 calls a 0–1 transition matrix aperiodic when some power is
  positive and uses the period of an irreducible one; this roadmap does not depend on that one.
- SpectralGraphBounds, §1.3, proves `|λᵢ| ≤ λ₁` and the monotonicity of `λ₁` for adjacency
  eigenvalues; 3.2 is a different statement, characterizing equality `λₙ = −λ₁` for connected
  graphs, and it is stated with the Perron root, which for a connected graph is `λ₁`. This roadmap
  does not depend on that one.
- KernelsAndSpectralMethods, §1.4, proves that `2` is an eigenvalue of the normalized Laplacian of
  a weighted graph without loops exactly when a component is bipartite. 3.2 and 3.3 concern the
  adjacency matrix and are different statements; this roadmap does not depend on that one.

Outside the scope: Wielandt's bound `(n − 1)² + 1` on the exponent of a primitive matrix;
Wielandt's comparison lemma for complex matrices dominated by an irreducible one and the strict
monotonicity of the spectral radius; the Collatz–Wielandt min–max formula; the Frobenius normal
form of a reducible matrix; the convergence of powers; Markov kernels.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean`: `Matrix.toQuiver` (an arrow `i ⟶ j` when
  `0 < A i j`); `Matrix.IsIrreducible` (nonnegative entries and `Quiver.IsSStronglyConnected` for
  that quiver); `Matrix.IsPrimitive` (for `[Fintype n] [DecidableEq n]`: nonnegative entries and
  `∃ k > 0, ∀ i j, 0 < (A ^ k) i j`); `Matrix.pow_apply_pos_iff_nonempty_path` (for nonnegative
  `A`, `0 < (A ^ k) i j` iff there is a path of length `k` from `i` to `j`);
  `Matrix.isIrreducible_iff_exists_pow_pos` (for nonnegative `A`, irreducible iff
  `∀ i j, ∃ k > 0, 0 < (A ^ k) i j`); `Matrix.IsPrimitive.isIrreducible`.
- `Mathlib/NumberTheory/FrobeniusNumber.lean`: `Nat.setGcd` (the nonnegative generator of the
  ideal of `ℤ` spanned by a set of naturals, `0` for the empty set); `Nat.setGcd_dvd_of_mem`;
  `Nat.dvd_setGcd_iff` (`m ∣ Nat.setGcd s ↔ ∀ k ∈ s, m ∣ k`).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly`, `Matrix.charpoly_map`
  (the characteristic polynomial of `A.map f` for a ring map `f` is that of `A` mapped by `f`),
  `Matrix.charpoly_units_conj` (conjugation by a unit preserves it).
  `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.mem_spectrum_iff_isRoot_charpoly`
  (over a field). `Mathlib/Algebra/Polynomial/Roots.lean`: `Polynomial.eq_rootMultiplicity_map`
  (an injective ring map preserves root multiplicities). `Mathlib/Algebra/Polynomial/Div.lean`:
  `Polynomial.rootMultiplicity`, `Polynomial.rootMultiplicity_pos` (for `p ≠ 0`, positive
  multiplicity iff root).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.spectral_theorem` and
  `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues` (for a Hermitian matrix over `RCLike 𝕜`, the
  roots of the characteristic polynomial are the eigenvalues, with multiplicity).
- `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`: `SimpleGraph.adjMatrix`,
  `SimpleGraph.adjMatrix_pow_apply_eq_card_walk` (the `(u, v)` entry of the `k`-th power counts
  the walks of length `k` from `u` to `v`). `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean`:
  `SimpleGraph.isHermitian_adjMatrix`.
  `Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean`:
  `SimpleGraph.two_colorable_iff_forall_loop_even` (`G.Colorable 2` iff every closed walk has even
  length). `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`: `SimpleGraph.IsBipartite`
  (`G.Colorable 2`).
- Basic Mathlib: `Matrix.diagonal`, `Matrix.submatrix`, `ZMod`, `ZMod.castHom` (the ring map
  `ZMod d → ZMod m` for `m ∣ d`), `ZMod.val`, `finRotate`, `Complex.exp`, `orderOf`, `spectrum`,
  `SimpleGraph.Connected`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Irreducible.lean`, for `A : Matrix n n ℝ`
  irreducible: `Matrix.IsIrreducible.exists_mulVec_eq_smul` (for `[Nonempty n]`, some `r > 0` and
  entrywise positive `v` with `A *ᵥ v = r • v`);
  `Matrix.IsIrreducible.pos_of_mulVec_eq_smul` (a nonzero nonnegative eigenvector is entrywise
  positive); `Matrix.IsIrreducible.eq_of_mulVec_eq_smul_of_nonneg` (a nonzero nonnegative
  eigenvector has the eigenvalue of any positive one);
  `Matrix.IsIrreducible.mulVec_eq_smul_of_smul_le_mulVec` (with a positive eigenvector for `r`,
  `r • y ≤ A *ᵥ y` forces `A *ᵥ y = r • y`);
  `Matrix.IsIrreducible.rootMultiplicity_charpoly_eq_one` (for `[DecidableEq n] [Nonempty n]`
  and a positive eigenvector for `r`, `A.charpoly.rootMultiplicity r = 1`).
- `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Positive.lean`: `Matrix.norm_le_of_mulVec_le_smul`
  (for nonnegative `A` and positive `v` with `A *ᵥ v ≤ r • v`, every complex eigenvalue of
  `A.map (↑)` has modulus at most `r`); `Matrix.spectralRadius_eq_of_mulVec_eq_smul` (the
  eigenvalue of a positive eigenvector is `spectralRadius ℂ (A.map (↑))`).
- `TauCeti/NumberTheory/FrobeniusNumber.lean`: `Nat.eventually_mem_of_setGcd_dvd` (a set of
  naturals closed under addition contains every sufficiently large multiple of its gcd) and
  `Nat.eventually_mem_of_setGcd_eq_one`.
- `TauCeti/Probability/MarkovChain/Period.lean`: `ProbabilityTheory.Kernel.period_dvd_period_of_pos`
  and `ProbabilityTheory.Kernel.period_eq_period_of_pos`, cited for the argument of 1.1 and for the
  boundary of the scope; no statement here uses kernels.

## References

- Andries E. Brouwer and Willem H. Haemers, *Spectra of Graphs*, the authors' text on the first
  author's page (`homepages.cwi.nl/~aeb/math/ipm/ipm.pdf`, file of 4 May 2025), published as a book
  by Springer in the series Universitext. Locators are to the numbered results and printed page
  numbers of that file: §2.2 and Theorem 2.2.1 with its proof, pp. 29–31; §3.4 and
  Proposition 3.4.1, p. 46.
- Mike Boyle, *Notes on the Perron–Frobenius theory of nonnegative matrices*, posted on the
  author's page (`math.umd.edu/~mboyle/courses/405sp10/specmay2011.pdf`, 7 pages): Definition 3.2
  and the paragraph after it, p. 3; Propositions 3.3, 3.5 and 3.6, p. 4; Theorem 3.9, p. 5.
