# Roadmap: equivariant layers and convolutional networks

**Summary.** This roadmap states the structure theorems behind three kinds of layers built from
a symmetry: linear maps between tensors that commute with relabelling the index set, continuous
functions of a list of real numbers that ignore its order, and stacks of one-dimensional
convolutions. Two maps are equal when they agree at every input.

- Let `K` be a field and `n, k, l` natural numbers. The linear maps from functions on `[n]^k` to
  functions on `[n]^l` that commute with every permutation of `[n]` have a basis indexed by the set
  partitions of a `(k + l)`-element set into at most `n` blocks. Their dimension is
  `Σ_(j ≤ n) S(k + l, j)` (Stirling numbers of the second kind), which is the Bell number
  `B(k + l)` exactly when `k + l ≤ n`; Maron, Ben-Hamu, Shamir and Lipman give `B(k + l)` for
  every `n`.
- For every `M`, a continuous `f : ℝ^M → ℝ` is invariant under permutations of the coordinates if
  and only if `f(x) = ρ(Σ_i (x_i, x_i², …, x_i^M))` for a continuous `ρ : ℝ^M → ℝ`. If `N < M`,
  the maximum of `M` reals is not `ρ(Σ_i φ(x_i))` for any continuous `φ : ℝ → ℝ^N` and any `ρ`. A
  continuous `F : ℝ^n → ℝ^n` commutes with permutations of the coordinates if and only if
  `F(x)_i = ρ(x_i, Σ_(j ≠ i) (x_j, x_j², …, x_j^(n−1)))` for one continuous `ρ`.
- A linear convolutional network (valid convolutions, no biases, identity activations) with
  filter sizes at least one and a nonempty output is one convolution, whose stride is the product
  of the strides and whose filter polynomial is an explicit product of the layers' filter
  polynomials. Such a network with real filters, stride one and `L ≥ 1` layers of sizes
  `k_1, …, k_L` realizes exactly the convolutions of filter size `k = 1 + Σ (k_i − 1)` whose
  filter is zero or has, as a binary form of degree `k − 1`, at least `e` real roots on the
  projective line, with `e` the number of even `k_i`; it realizes every convolution of filter
  size `k` if and only if `e ≤ 1`.

The networks of the last layer are the convolutional chains of the Tau Ceti library that realizes
the roadmap Neuromanifolds, with their bias-free realization. Tau Ceti also supplies the orbit-sum
basis of permutation modules, Newton's identities for multisets and invariance of dimension;
Mathlib supplies Vieta's formulas and the Tietze extension theorem. The translation-equivariant
maps on a cyclic group and the Hom spaces between induced representations are treated in the
roadmaps SamplingAndDiscreteFourierAnalysis and InductionRestriction and are not restated here;
group convolution appears below only as background.

Layer 1 treats equivariant linear maps between tensor spaces, Layer 2 continuous invariant and
equivariant functions of tuples, Layer 3 linear convolutional networks; the three are independent.

## Conventions

- **Tensors and the symmetric group.** `[n] = Fin n`. An order-`k` tensor over `[n]` with values
  in a field `K` is a function `x : (Fin k → Fin n) → K` on `k`-tuples of indices. A permutation
  `σ` of `[n]` acts by `(σ • x)(a) = x(σ⁻¹ ∘ a)`; this is `tensorPerm K n k σ`. A linear map
  `T` from order-`k` to order-`l` tensors is *equivariant* when `T ∘ (σ •) = (σ •) ∘ T` for every
  `σ`; these maps form the subspace `equivariantMaps K n k l`. Order `0` tensors are the scalars
  (`Fin 0 → Fin n` has one element), so `k = 0` gives the equivariant "bias" vectors of order `l`
  and `l = 0` the invariant linear functionals.
- **Equality patterns.** For `a : Fin k → Fin n` and `b : Fin l → Fin n` the pair `(a, b)` is the
  tuple `Fin.append a b : Fin (k + l) → Fin n`; its *equality pattern* is the kernel setoid
  `Setoid.ker (Fin.append a b)`, the set partition of `Fin (k + l)` into the classes on which the
  tuple is constant. A pattern has at most `n` blocks, since the tuple takes at most `n` values.
- **Tuples of reals.** `ℝ^M = Fin M → ℝ`, with the product (sup-norm) topology. A permutation
  `σ` of `Fin M` acts by `x ↦ x ∘ σ`; *invariant* means `f(x ∘ σ) = f(x)` and *equivariant*
  means `F(x ∘ σ) = F(x) ∘ σ`, for all `σ` and `x`. Since `σ` ranges over a group, this is the
  same as the convention `(σ • x)_i = x_(σ⁻¹ i)` of the sources. The *power-sum map* is
  `powerSum M x = (Σ_i x_i, Σ_i x_i², …, Σ_i x_i^M)`, coordinate `q : Fin M` being
  `Σ_i x_i^(q + 1)`. There is no `0`-th power sum: the sources' extra coordinate `Σ_i x_i^0 = M`
  is constant and is dropped.
- **Convolutions.** Convolutions are those of the Tau Ceti Neuromanifold library:
  `convolution h w x i = Σ_(j < k) w_j x_(s i + j)` for a filter `w : Fin k → K`, stride `s`,
  input length `n` and output length `m`, with `h : n = s * (m - 1) + k`. Indices start at `0`;
  there is no padding, no filter reversal (this is the cross-correlation of the machine-learning
  literature) and no wrap-around. A convolutional network is a `ConvolutionSpec K L`: widths
  `d_0, …, d_L`, filter lengths `k_i`, strides `s_i` with `d_i = s_i (d_(i+1) − 1) + k_i`, and
  hidden activations; it is *linear* when every hidden activation is the identity. Its bias-free
  realization `realizeWeights` takes one filter per layer. The *function space* of the network is
  the set `realizedFunctions A.realizeWeights` of the maps it realizes.
- **Filter polynomials.** The filter polynomial of `w : Fin k → K` is
  `filterPoly w = Σ_j w_j X^j`. Kohn, Merkh, Montúfar and Trager use the binary form
  `Σ_j w_j x^(k−1−j) y^j` of degree `k − 1`; the two determine each other, and the roots of the
  form on the projective line are the roots of `filterPoly w` together with the point at infinity
  counted `k − 1 − natDegree (filterPoly w)` times. For a real filter this count is
  `realRootCount u`. The zero filter is treated separately in every statement, so the value of
  the count at `u = 0` plays no role.
- **Scalars.** Layer 1 is stated over an arbitrary field and the composition theorem 3.1 over an
  arbitrary commutative ring, because their proofs use no more; Layer 2 and the function-space
  theorem 3.2 are over `ℝ`, where continuity and real roots are meant.

## Layer 1: equivariant linear layers on tensors

### 1.1 The pattern basis

Define `tensorPerm`, `equivariantMaps` and, for a set partition `γ` of `Fin (k + l)`, the
*pattern map* `patternMap K n k l γ`, the linear map whose matrix entry at output index `b` and
input index `a` is `1` if the equality pattern of `(a, b)` is `γ` and `0` otherwise. Prove
`exists_basis_patternMap`: for every field `K` and all `n, k, l`, the pattern maps of the set
partitions of `Fin (k + l)` with at most `n` blocks lie in `equivariantMaps K n k l` and form a
basis of it.

This is Maron–Ben-Hamu–Shamir–Lipman, Prop. 1 (p. 4) and Prop. 2 (p. 5), with the index set
corrected: the paragraph before their Prop. 2 identifies the equality-pattern classes of `[n]^ℓ`
with all partitions of `[ℓ]`, and Prop. 2 states the dimension `b(ℓ)`; the identification holds
only when `n ≥ ℓ`. The general order `k → l` is the claim on their
p. 2; their Thm 1 (p. 5) is the case `l = k` and the invariant case `l = 0`.

*Route.* (i) A linear map `T` is determined by its matrix `M(b, a) = (T δ_a)(b)`, and
`σ • δ_a = δ_(σ ∘ a)`; so `T` is equivariant if and only if `M(σ ∘ b, σ ∘ a) = M(b, a)` for all
`σ, a, b`, that is, if and only if the function `M` on `(Fin l → Fin n) × (Fin k → Fin n)` is
constant on the orbits of the diagonal action of the permutation group. The invariant functions
on a finite set with a group action have the orbit indicators as a basis (Tau Ceti
`TauCeti.invariantOrbitSumBasis`, for the permutation representation on that product, read on
functions through `MonoidAlgebra.coeffLinearEquiv` and `Finsupp.linearEquivFunOnFinite`). (ii) Two
tuples `c, c' : Fin (k + l) → Fin n` lie in one orbit if and only if `Setoid.ker c = Setoid.ker c'`:
if `c' = σ ∘ c` the kernels agree; conversely equal kernels give a well-defined bijection from the
range of `c` to the range of `c'` sending `c i` to `c' i`, and since the complements of the two
ranges in `Fin n` have the same cardinality it extends to a permutation `σ` with `σ ∘ c = c'`
(Mathlib `Equiv.extendSubtype`). (iii) A set partition `γ` is the kernel of some tuple with values
in `Fin n` if and only if it has at most `n` blocks (compose the quotient map with an injection of
the quotient into `Fin n`). So the orbits correspond bijectively to the partitions with at most `n`
blocks, and the orbit indicator of the orbit with pattern `γ` is the matrix of `patternMap γ`.
*Needs:* Tau Ceti `TauCeti.invariantOrbitSumBasis`; Mathlib `MonoidAlgebra.coeffLinearEquiv`,
`Finsupp.linearEquivFunOnFinite`, `Setoid.ker`, `Fin.append`, `Equiv.extendSubtype`,
`LinearMap.funLeft`, `Matrix.mulVecLin`.

**Checks.**
- `n = 1`, `k = l = 1`: both index sets are one point, the equivariant maps are all maps `K → K`,
  dimension `1`; one partition of `Fin 2` (the one-block partition) has at most one block, while
  there are `B(2) = 2` partitions in all. This contradicts the dimension `b(2k)` of Maron et al.'s
  Thm 1 (`b(2) = 2` for `k = 1`); so is the invariant case `n = 1`, `k = 2`, `l = 0` (dimension
  `1`, `b(2) = 2`).
- `n = 0`: for `k + l ≥ 1` the space is zero and no partition of `Fin (k + l)` has `0` blocks;
  for `k = l = 0` the space is `End(K)`, of dimension `1`, and the empty partition of `Fin 0` has
  `0` blocks.
- `n = 2`, `k = 1`, `l = 2`: dimension `4` (exact rank computation), not `B(3) = 5`: the partition
  of `Fin 3` into three singletons needs three distinct values, so its pattern map is zero and is
  not part of the basis.

### 1.2 The dimension and the Bell number

Prove `finrank_equivariantMaps`: the dimension of `equivariantMaps K n k l` is
`Σ_(j ∈ {0, …, n}) S(k + l, j)` with `S = Nat.stirlingSecond`, and it equals `Nat.bell (k + l)`
if and only if `k + l ≤ n`. In particular it does not depend on `K`. (Maron et al., p. 2 and Thm 1,
p. 5, state `B(k + l)` without the condition `k + l ≤ n`; corrected and proved here.)

*Route.* By 1.1 and `Module.finrank_eq_card_basis` the dimension is the number of set partitions
of `Fin (k + l)` with at most `n` blocks. The number of partitions of `Fin m` with exactly `j`
blocks is `S(m, j)`: removing the last element either removes a singleton block or leaves a
partition with `j` blocks into one of which it was put, which is the recursion
`Nat.stirlingSecond_succ_succ`, with the same values at `m = 0` or `j = 0`. The number of all
partitions of `Fin m` is `Nat.bell m`: the block of the last element of `Fin (m + 1)` consists of it
and `i` of the other `m` elements, and the rest is any partition of the remaining `m − i`, which is
the recursion `Nat.bell_succ`. So `Σ_(j ≤ m) S(m, j) = B(m)`; since `S(m, j) = 0` for `j > m`
(`Nat.stirlingSecond_eq_zero_of_lt`) and `S(m, m) = 1` (`Nat.stirlingSecond_self`), the truncated
sum `Σ_(j ≤ n) S(m, j)` equals `B(m)` if `n ≥ m` and is at most `B(m) − 1` if `n < m`.
*Needs:* 1.1; Mathlib `Module.finrank_eq_card_basis`, `Nat.stirlingSecond`,
`Nat.stirlingSecond_succ_succ`, `Nat.stirlingSecond_eq_zero_of_lt`, `Nat.stirlingSecond_self`,
`Nat.bell`, `Nat.bell_succ`.

**Checks.**
- Computed by exact Gaussian elimination of the equivariance equations over `ℚ` for the triples
  `(n, k, l)` = `(0,0,0)`, `(0,1,0)`, `(0,0,1)`, `(0,1,1)`, `(1,0,0)`, `(1,1,1)`, `(1,2,0)`,
  `(1,0,3)`, `(2,0,0)`, `(2,1,1)`, `(2,1,2)`, `(2,2,0)`, `(2,0,2)`, `(2,2,2)`, `(3,0,1)`, `(3,1,1)`,
  `(3,1,2)`, `(3,2,1)`, `(3,0,3)`, `(3,2,2)`, `(4,1,2)`, `(4,0,2)`: the dimension equals
  `Σ_(j ≤ n) S(k + l, j)` in each, and equals `B(k + l)` exactly when `k + l ≤ n`. For example
  `(3, 2, 2)` gives `14`, not `B(4) = 15`; `(3, 1, 2)` and `(4, 1, 2)` give `B(3) = 5`.
- The dimension is the same over `ℚ`, `𝔽₂` and `𝔽₃` in all cases with `n ≤ 3`: no hypothesis on
  the characteristic is needed, which is why none is made.
- Bias terms: `k = 0`, `l = 2`, `n = 3` gives `2` (the constant tensor and the diagonal), and
  `k = 0`, `l = 1`, `n = 0` gives `0` (the zero space).

### Remark: group convolutions on finite groups

Let `G` be a finite group, `H` and `K` subgroups and `k` a field. For `χ : G → k` with
`χ(h g κ) = χ(g)` for `h ∈ H`, `κ ∈ K`, put `(f ⋆ χ)(xK) = Σ_(Hy ∈ H\G) f(x y⁻¹ H) χ(y)` for
`f : G/H → k`. The summand depends only on the coset `Hy`, the value only on `xK` (replace `y` by
`yκ`), and `f ↦ f ⋆ χ` commutes with left translation by `G`. The map `χ ↦ (f ↦ f ⋆ χ)` is a
linear bijection onto the `G`-equivariant maps `k^(G/H) → k^(G/K)`, over every field: since
`δ_(gH) ⋆ χ` is `xK ↦ χ(g⁻¹x)`, the map is injective; and an equivariant `T` is `f ↦ f ⋆ χ` for
`χ(x) = (T δ_H)(xK)`, which is left `H`-invariant because `h • δ_H = δ_H`; the two maps agree on
each `δ_(gH) = g • δ_H` by equivariance. This is the finite case of Kondor–Trivedi, Def. 4,
Case III and eq. (12) (p. 5) and Thm 1 (p. 6); for `H = K = 1` it says that the left-equivariant
maps of `k^G` are the right convolutions, the group correlations of Cohen–Welling (eqs. (10)–(11),
p. 5), which is also Mathlib's `Rep.leftRegularHomEquiv`. The dimension, `#(H\G/K)`, follows from
Frobenius reciprocity (Mathlib `Rep.indResHomEquiv` with Tau Ceti `TauCeti.indTrivialIso`), the
orbit-sum basis and Tau Ceti's `TauCeti.doubleCosetEquivOrbitQuotient`. No target is made of it
here: the proof above is three lines, and the Hom spaces between induced representations belong to
InductionRestriction.

**Checks.**
- `G = S₃`, `H = K = ⟨(0 1)⟩`: the double cosets are two, and over `𝔽₂`, `𝔽₃` and `𝔽₅` the map
  above has rank `2`, equal to the dimension of the equivariant maps. Kondor–Trivedi, working over
  `ℂ`, put a factor `|H|` in front of the sum in eq. (12); over `𝔽₂` that factor is `0` and the
  map has rank `0`, so the normalization without the factor is the one that works in every
  characteristic.
- `H = K = 1` gives dimension `6 = |S₃|`; `H = ⟨(0 1)⟩`, `K = 1` gives `3 = #(H\G)`.
- Only finite groups are meant. On `G = ℝ/ℤ` the identity of `L²` commutes with translations but is
  convolution with no integrable function (its Fourier coefficients would all be `1`, against the
  Riemann–Lebesgue lemma), so on an infinite compact group an equivariant map need not be
  convolution with an integrable function.

### Examples

- Deep Sets (Zaheer et al., Lemma 3, p. 2): for `k = l = 1` and `n ≥ 2` the basis of 1.1 has two
  elements, the identity (the one-block pattern, `a = b`) and `x ↦ (Σ_a x_a) 𝟙 − x` (the
  two-block pattern, `a ≠ b`); so the equivariant `n × n` matrices are `λI + γ𝟙𝟙ᵀ`. For `n = 1`
  the dimension is `1`. Zaheer et al. state the lemma for the layer
  `x ↦ σ(Θx)` with a nonlinearity `σ` applied coordinatewise. If `σ` is injective,
  `σ(Θ(x ∘ s)) = σ(Θx) ∘ s` for all `x` and all permutations `s` holds if and only if `Θ` commutes
  with every permutation matrix, which is the case just described. For a constant `σ` the layer
  is equivariant for every `Θ`, and the "only if" fails.
- `k = 2`, `l = 2`, `n ≥ 4`: the fifteen basis maps of Maron et al.'s Figure 1.

### Dependencies

1.1 uses Tau Ceti's orbit-sum basis and Mathlib. 1.2 uses 1.1 and Mathlib's Stirling and Bell
numbers. The remark uses nothing beyond the definitions.

## Layer 2: continuous functions of sets

### 2.1 The power-sum embedding

Define `powerSum`. Prove `isClosedEmbedding_powerSum_monotone`: for every `M`, the restriction
of `powerSum M` to the closed cone of nondecreasing tuples (`Monotone x`, that is
`x_0 ≤ x_1 ≤ … ≤ x_(M−1)`) is a closed embedding into `ℝ^M`.

Zaheer et al. prove injectivity (Lemma 4, pp. 12–13, by Newton–Girard and the roots of
`Π_m (X − u_m)`) and continuity of the inverse (Lemma 6, p. 13, by continuity of roots) on the
compact cone in `[0, 1]^M`, with the extra coordinate `Σ_m u_m^0`. The statement on all of `ℝ^M`
is more general; its route below is complete. Tau Ceti's `TauCeti.Sym.coeffHomeomorph` is the
complex counterpart for elementary symmetric functions (the `M`-th symmetric power of `ℂ` is
homeomorphic to `ℂ^M`, by the same properness argument); the real cone with power-sum coordinates
is not in the libraries, and the route below does not pass through `ℂ`.

*Route.* Injectivity: if `powerSum M x = powerSum M y`, Newton's identities
(Tau Ceti `Multiset.mul_esymm_eq_sum`, divided by `k ≠ 0` in `ℝ`) show by induction on `k ≤ M`
that the `k`-th elementary symmetric functions of the multisets of coordinates of `x` and `y`
agree; by Vieta (`Multiset.prod_X_sub_X_eq_sum_esymm`) the polynomials `Π_i (X − x_i)` and
`Π_i (X − y_i)` coincide, hence so do their multisets of roots
(`Polynomial.roots_multiset_prod_X_sub_C`), and two nondecreasing tuples with the same multiset
of values are equal. Properness: the coordinate `Σ_i x_i²` (for `M ≥ 2`; for `M = 1` the map is
the identity and for `M = 0` the space is a point) bounds `max_i x_i²`, so preimages of bounded
sets are bounded and `powerSum M` is proper (`isProperMap_iff_tendsto_cocompact`); the cone is
closed, so the restriction is proper too (`IsProperMap.restrict`), hence a closed map
(`IsProperMap.isClosedMap`), and a continuous injective closed map is a closed embedding
(`Topology.IsClosedEmbedding.of_continuous_injective_isClosedMap`). *Needs:* Tau Ceti
`Multiset.mul_esymm_eq_sum`; Mathlib `Multiset.prod_X_sub_X_eq_sum_esymm`,
`Polynomial.roots_multiset_prod_X_sub_C`, `isProperMap_iff_tendsto_cocompact`,
`IsProperMap.restrict`, `IsProperMap.isClosedMap`,
`Topology.IsClosedEmbedding.of_continuous_injective_isClosedMap`.

**Checks.**
- Exact search over `{−2, …, 2}^M` for `M = 1, 2, 3`: equal power sums occur only for tuples that
  are permutations of each other.
- Fewer power sums do not suffice: `(0, 0)` and `(1, −1)` have the same first power sum;
  `(−1, −1, 2)` and `(1, 1, −2)` have the same first two power sums (`0` and `6`) but third
  power sums `6` and `−6`.

### 2.2 Continuous invariant functions are sum-decomposable

Prove `invariant_iff_exists_continuous_comp_powerSum`: for every `M` and continuous
`f : ℝ^M → ℝ`, `f` is invariant under all permutations of the coordinates if and only if there is
a continuous `ρ : ℝ^M → ℝ` with `f = ρ ∘ powerSum M`, that is,
`f(x) = ρ(Σ_i φ(x_i))` with `φ(t) = (t, t², …, t^M)` (Wagstaff–Fuchs–Engelcke–Posner–Osborne,
Thm 4.3, p. 5; Zaheer et al., Thm 7, p. 14, on `[0, 1]^M` with `ℝ^(M+1)`).

Both printed proofs define `ρ` only on the image of the power-sum map (Zaheer et al., proof of
Thm 7, pp. 14–15; Wagstaff et al., App. B.4, p. 11, which reduces to Zaheer's map); the extension
to all of `ℝ^M` below is part of the route.

*Route.* "If" is the invariance of `powerSum M`. "Only if": let `C` be the cone of 2.1 and `e` the
restriction of `powerSum M` to it. By 2.1, `e` is a homeomorphism onto its range `Z`, which is
closed in `ℝ^M`. The function `g = f ∘ e⁻¹ : Z → ℝ` is continuous, and by Tietze
(`ContinuousMap.exists_extension'`, for the closed embedding of `Z` into the normal space `ℝ^M`)
it extends to a continuous `ρ` on `ℝ^M`. For any `x`, sorting gives a permutation `τ` with
`x ∘ τ ∈ C` (`Tuple.sort`, `Tuple.monotone_sort`), so
`f(x) = f(x ∘ τ) = ρ(powerSum M (x ∘ τ)) = ρ(powerSum M x)`. *Needs:* 2.1; Mathlib
`ContinuousMap.exists_extension'`, `Tuple.sort`, `Tuple.monotone_sort`.

**Checks.**
- `M = 0`: `ℝ^0` is a point and both sides hold. `M = 1`: `ρ = f`.
- The continuity hypothesis on `f` is needed for "only if": the indicator of `{0}` in `ℝ^2` is
  invariant but is not `ρ ∘ powerSum 2` with `ρ` continuous, since that composite is continuous.
- `max(x_0, x_1) = ρ(x_0 + x_1, x_0² + x_1²)` with
  `ρ(p, q) = (p + √(max(2q − p², 0)))/2`, continuous on `ℝ²`.

### 2.3 The latent dimension must be at least the set size

Prove `not_exists_sum_decomposition_iSup`: if `N < M`, there is no continuous `φ : ℝ → ℝ^N` and
no function `ρ : ℝ^N → ℝ` (continuous or not) with `max_i x_i = ρ(Σ_i φ(x_i))` for all
`x ∈ ℝ^M`. Together with 2.2 (where `N = M` suffices for every continuous invariant function) this
says that the latent dimension `M` is the least that works for all continuous invariant functions
(Wagstaff et al., Thm 4.1 and Lemma 4.2, p. 4, proofs pp. 4–5).

Wagstaff et al. state the theorem for continuous decompositions; the statement here allows any
`ρ`, and their argument does not use the continuity of `ρ`. Their Lemma 4.2 assumes the
decomposition on sets of every size, while Thm 4.1 supplies it only for `M` points; the padding
step below works with `M` points alone.

*Route.* Write `Φ(x) = Σ_i φ(x_i)`, continuous. (i) `Φ` is injective on the open cone
`U = {x : x_0 < x_1 < … < x_(M−1)}`: let `x, y ∈ U` with `Φ(x) = Φ(y)`, and show `x_(j−1) = y_(j−1)`
for `j = M, M − 1, …, 1` in turn. Suppose `x_i = y_i` for all `i ≥ j` (nothing is assumed when
`j = M`). Subtracting these equal terms from `Φ(x) = Φ(y)` shows that `φ` has the same sum over
the first `j` coordinates of `x` and of `y`. Complete these first `j` coordinates by `M − j` copies
of a number `t < min(x_0, y_0)`: the two completed tuples have equal `Φ`, hence equal maxima, and
these maxima are `x_(j−1)` and `y_(j−1)`.
(ii) Take a closed ball `B̄ ⊂ U` of positive radius. `Φ` is continuous and injective on the
compact `B̄`, hence an embedding there, and so on the open ball `B`; the inclusion of `B` in
`ℝ^M` is an open embedding. Tau Ceti's invariance of dimension
(`Topology.IsOpenEmbedding.finrank_le_of_isEmbedding`, with `X = B`) gives `M ≤ N`, using
`Module.finrank_fin_fun`. *Needs:* Tau Ceti
`Topology.IsOpenEmbedding.finrank_le_of_isEmbedding`; Mathlib `Module.finrank_fin_fun`.

**Checks.**
- `M = 1`, `N = 0`: `Σ_i φ(x_i) = 0` is constant while `max` is the identity.
- The continuity of `φ` is needed: an injection of `ℝ` into a Hamel basis of `ℝ` over `ℚ` gives
  `φ : ℝ → ℝ` (so `N = 1`) whose sums over `M` points determine the multiset of points (the
  coefficients are the multiplicities), so `max = ρ ∘ Φ` for some `ρ`, for every `M`.
- For `N = M` the maximum is decomposable continuously: 2.2, and for `M = 2` the explicit `ρ` in
  the Checks of 2.2.

### 2.4 Continuous equivariant maps

Prove `equivariant_iff_exists_continuous`: for every `n` and continuous `F : ℝ^n → ℝ^n`, `F` is
equivariant if and only if there is a continuous `ρ : ℝ × ℝ^(n−1) → ℝ` with
`F(x)_i = ρ(x_i, Σ_(j ≠ i) (x_j, x_j², …, x_j^(n−1)))` for all `x` and `i`
(Sannai–Takai–Cordonnier, Cor. 3.1, p. 6, and Cor. 3.2, p. 7). The source states Cor. 3.2 on a
compact set, with the extra constant coordinate, as a consequence of Zaheer et al.'s theorem; the
global statement is more general, and its route below is complete and does not use the source's
appendix.

*Route.* "If": `F(x ∘ σ)_i = ρ(x_(σ i), Σ_(j ≠ σ i) φ(x_j)) = F(x)_(σ i)`, reindexing the sum.
"Only if", for `n ≥ 1` (`n = 0` is empty): (i) put `G(t, y) = F(Fin.cons t y)_0` for `t ∈ ℝ`,
`y ∈ ℝ^(n−1)`; equivariance under the permutations fixing `0` gives `G(t, y ∘ σ') = G(t, y)` for
every permutation `σ'` of `Fin (n − 1)`. (ii) The map `(t, y) ↦ (t, powerSum (n−1) y)`, restricted
to `ℝ × C` with `C` the cone of 2.1, is a closed embedding (2.1 and
`Topology.IsClosedEmbedding.prodMap`); as in the route of 2.2, `G` composed with its inverse is
continuous on the closed range, extends by Tietze to a continuous `ρ` on `ℝ × ℝ^(n−1)`, and
sorting `y` gives `G(t, y) = ρ(t, powerSum (n−1) y)` for all `(t, y)`. (iii) For `i`, let `τ` be the
transposition of `0` and `i`; then `F(x)_i = F(x ∘ τ)_0 = G(x_i, y)` where `y` lists the `x_j` with
`j ≠ i` in some order, and `powerSum (n−1) y = Σ_(j ≠ i) φ(x_j)`. *Needs:* 2.1; Mathlib
`Topology.IsClosedEmbedding.prodMap`, `ContinuousMap.exists_extension'`, `Tuple.sort`,
`Tuple.monotone_sort`, `Fin.cons`, `Equiv.swap`.

**Checks.**
- `n = 1`: `ℝ^0` is a point and `ρ(t, ·) = F(t)_0`. `n = 2`: `F(x) = (x_0 x_1², x_1 x_0²)` is
  equivariant, with `ρ(t, p) = t p²`.
- Coordinatewise maps `F(x)_i = g(x_i)` are the case `ρ(t, p) = g(t)`, and the swap
  `F(x) = (x_1, x_0)` on `ℝ²` is the case `ρ(t, p) = p`. The map `F(x) = (x_1, x_1)` is not
  equivariant: with `σ` the swap, `F(x ∘ σ) = (x_0, x_0)` while `F(x) ∘ σ = (x_1, x_1)`.
- The continuity hypothesis is needed for "only if": the map with every coordinate equal to the
  indicator of the origin is equivariant and discontinuous, while every map of the stated form
  with continuous `ρ` is continuous.

### Remark: countable universes and multisets

For a countable set `𝒳` with an injection `c : 𝒳 → ℕ`, every function `f` of finite subsets of
`𝒳` is `f(S) = ρ(Σ_(x ∈ S) φ(x))` with `φ(x) = 4^(−c(x))`, because the sum determines `S` by its
base-4 digits (Zaheer et al., Thm 2, p. 2, proof App. A.1, p. 12; Wagstaff et al., Thm 2.8, p. 2).
It is not a target: with `φ(x) = 2^(c(x))` the injectivity is Mathlib's `Finset.equivBitIndices`.
For multisets this `φ` fails: four copies of a point with `c = 1` and one point with `c = 0` have
the same sum `1` (Wagstaff et al., remark after Thm 2.8, p. 2, who extend the theorem to
multisets with another `φ` in their App. A.3, p. 9).

### Examples

- `f(x) = Σ_i x_i³` is `ρ ∘ powerSum M` with `ρ` the coordinate projection on `q = 2` (for
  `M ≥ 3`), and the mean is `ρ(p) = p_0 / M` for `M ≥ 1`: some functions need fewer coordinates,
  which 2.3 does not contradict: 2.3 concerns one particular function, the maximum.

### Dependencies

2.1 uses Tau Ceti's Newton identities and Mathlib. 2.2 and 2.4 use 2.1 and Mathlib's Tietze
extension. 2.3 uses Tau Ceti's invariance of dimension and does not use 2.1–2.2.

## Layer 3: linear convolutional networks

### 3.1 A linear convolutional network is a convolution

Define `filterPoly`, `compositeLength A = 1 + Σ_i (k_i − 1) Π_(j < i) s_j` and
`compositeFilterPoly A w = Π_i (filterPoly (w i))(X^(Π_(j < i) s_j))`. Prove
`realizeWeights_eq_convolution`: for a commutative ring `K` and `A : ConvolutionSpec K L` with
every hidden activation the identity, every filter length at least `1` and output length at
least `1`, and for all filters `w`, the realization `A.realizeWeights w` is the valid convolution
with stride `Π_i s_i`, filter length `compositeLength A` and filter the coefficients `u_j` of
`compositeFilterPoly A w` for `j < compositeLength A`; the input length satisfies
`d_0 = (Π_i s_i)(d_L − 1) + compositeLength A`.

This is Kohn–Merkh–Montúfar–Trager, Prop. 2.2 with eqs. (6)–(7) (p. 5) for the stride and filter
length, Prop. 2.6 (p. 7) for the product of filter polynomials at stride one, and Remark 2.8
(p. 7) for the factor `π(w_2)(X^(s_1))` at two layers of general stride. The `L`-layer product
formula, the statement over any commutative ring and the strides equal to `0` (which the source,
with positive strides, does not consider) are proved by the route below.

*Route.* Induction on the prefixes: for `i ≤ L`, the prefix evaluation
`A.evalPrefix (A.zeroBias w) x i` is the convolution of `x` with stride `Π_(j < i) s_j` and filter
the coefficients of `Π_(j < i) (filterPoly (w j))(X^(Π_(r < j) s_r))`. At `i = 0` this is the
identity, the convolution with filter `(1)`, stride `1` and filter length `1`, which needs
`d_0 ≥ 1`. The step from `i` to `i + 1` is `ConvolutionSpec.evalPrefix_succ` with zero bias and
identity layer activation (`MLPSpec.layerActivation_of_lt` for the hidden layers; the output layer
has none by the definition of `MLPSpec.layerActivation`), followed by the two-layer identity of
eq. (6): with filters `v` (stride `s`, applied first) and `w` (stride `t`),
`Σ_j w_j Σ_ℓ v_ℓ x_(s(t i + j) + ℓ) = Σ_m u_m x_(s t i + m)` with `u_m = Σ_(s j + ℓ = m) w_j v_ℓ`,
i.e. `Σ_m u_m X^m = v(X) · w(X^s)`. This is an identity in any commutative ring and holds for
`s = 0` and `t = 0` as well. At `i = L` the prefix is `A.realizeWeights w`
(`ConvolutionSpec.realizeWeights_def`, `ConvolutionSpec.realize_def`). The degree of
`compositeFilterPoly A w` is at most `compositeLength A − 1`, so the listed coefficients carry all
of it. The length equations for the prefixes follow from the `length_eq` fields, since each width
`d_i` with `i < L` is at least the filter length `k_i ≥ 1`, and `d_L ≥ 1` by hypothesis.
*Needs:* Tau Ceti `ConvolutionSpec.evalPrefix_succ`, `ConvolutionSpec.evalPrefix_zero`,
`ConvolutionSpec.realizeWeights_def`, `ConvolutionSpec.realize_def`,
`MLPSpec.layerActivation_of_lt`, `convolution_apply`, `convolutionIndex_val`; Mathlib
`Polynomial.coeff_mul`, `Polynomial.comp`.

**Checks.**
- Exact integer computation of the matrix of the network and of the formula, for filter sizes and
  strides `(2, 3; 1, 1)`, `(3, 2; 2, 1)`, `(2, 4; 2, 3)`, `(3, 3; 1, 2)`, `(1, 4; 3, 1)`, `(4; 3)`
  and with zero strides `(3, 2; 0, 2)`, `(2, 3; 3, 0)`, `(2, 2; 0, 0)`, for every choice of filters
  with entries in `{−1, 0, 1}`, and for `(2, 2, 3; 2, 1, 3)` with the filters
  `w_(i,j) = ((i + 1)(j + 2) mod 5) − 2`, each at output lengths `0, 1, 2, 3`: the matrices and the
  input lengths agree.
- Filter sizes `(3, 2)` with strides `(2, 1)`: filter length `3 + 1 · 2 = 5`, polynomial
  `w_1(X) w_2(X²)`, stride `2`.
- The hypothesis on the output length is needed only for `L = 0`: the empty network with
  `d_0 = 0` has `0 ≠ 1 · (0 − 1) + 1 = 1` in natural numbers. The hypothesis on filter lengths is
  needed: sizes `(0, 2)`, strides `(1, 1)`, `d_2 = 2` give `d_0 = 2`, while the formula, with
  `0 − 1 = 0`, gives `3`.

### 3.2 The function space at stride one and the filling criterion

Define `evenFilterCount A` (the number of layers with even filter length) and `realRootCount`.
Prove `realizedFunctions_realizeWeights_of_stride_one`: for `A : ConvolutionSpec ℝ L` with
`L ≥ 1`, identity hidden activations, all strides `1`, all filter lengths at least `1` and output
length at least `1`, with `k = compositeLength A = 1 + Σ_i (k_i − 1)`:

- the function space `realizedFunctions A.realizeWeights` is the set of convolutions
  `convolution h u` with `u : Fin k → ℝ` such that `u = 0` or
  `evenFilterCount A ≤ realRootCount u`;
- it is the set of all convolutions with filter length `k` (the network is *filling*, KMMT
  Def. 2.3, p. 6) if and only if `evenFilterCount A ≤ 1`.

This is Kohn–Merkh–Montúfar–Trager, Cor. 2.7 (p. 7), Lemma 4.2 (p. 9, proof p. 10) and the filling
part of Thm 4.1 (p. 9, proof p. 10); their further claim that the function space is a
full-dimensional semi-algebraic set is not stated here.

*Route.* By 3.1 with unit strides, `A.realizeWeights w` is the convolution whose filter polynomial
is `Π_i filterPoly (w i)`, and every `w` is allowed; so the function space is the set of
convolutions whose filter polynomial is a product of real polynomials of degrees at most
`k_i − 1`, read as binary forms of degrees exactly `k_i − 1` (Cor. 2.7). A real binary form
factors into real linear forms and irreducible quadratic forms (Mathlib
`Irreducible.natDegree_le_two`; the linear factors at infinity are the powers of the second
variable); a form of odd degree has a real root (`IsRealClosed.exists_isRoot_of_odd_natDegree` and
the point at infinity). So a product with `e` factors of odd degree `k_i − 1` has at least `e` real
roots; conversely, if a nonzero form of degree `k − 1` has `r ≥ e` real roots, give one linear
factor to each of the `e` odd-degree slots and distribute the remaining `r − e` linear factors
(an even number, since `r ≡ k − 1 ≡ e` modulo `2`) in pairs together with the quadratic factors to
fill every slot to its degree (Lemma 4.2). The zero filter is the product with `w_1 = 0`. For the
second claim, with output length at least `1` the filter is determined by the convolution
(`u_j` is the coefficient of `x_j` in output `0`), so filling means that every filter is reached:
if `e = 0` there is nothing to check, if `e = 1` the degree `k − 1` is odd and every nonzero form
has a real root, and if `e ≥ 2` the form `(x² + y²)^((k−1)/2)` (for odd `k`) or
`y (x² + y²)^((k−2)/2)` (for even `k`) has `0` or `1 < e` real roots. *Needs:* 3.1; Tau Ceti
`realizedFunctions`; Mathlib `Irreducible.natDegree_le_two`,
`IsRealClosed.exists_isRoot_of_odd_natDegree`, `Polynomial.roots_mul`, `Polynomial.natDegree_mul`,
`UniqueFactorizationMonoid.prod_normalizedFactors`.

**Checks.**
- Filter sizes `(2, 2)`: `e = 2`, `k = 3`. The filter `(1, 0, 1)`, polynomial `1 + X²`, has `0` real
  roots and is not realized: `(a + bX)(c + dX) = 1 + X²` forces `ad + bc = 0` and `ad · bc = 1`,
  so `ad` would be a real root of `t² + 1`. The filter `(1, 0, 0)` (polynomial `1`) has two roots
  at infinity and is realized as `(1, 0) · (1, 0)`; `(0, 1, 0)` is `X · 1`; `(0, 0, 1)` is `X · X`.
  A count of affine roots alone would wrongly exclude `(1, 0, 0)` and `(0, 1, 0)`.
- Filter sizes `(3, 2)`: `e = 1`, filling (KMMT Example 2.5); each of the filters `(1, 0, 1, 0)`,
  `(1, 0, 0, 1)`, `(1, 1, 1, 1)`, `(0, 0, 0, 1)`, `(1, 0, 0, 0)` has at least one real root on the
  projective line. Sizes `(3, 3)`: `e = 0`, filling. Sizes `(1, 2)`: size `1` is odd, `e = 1`.
- Sizes `(2, 2, 2)`: `X + X³` has `1 < 3` real roots and is not realized; sizes `(2, 4)`:
  `(1 + X²)²` has `0 < 2`.
- `L = 0` is excluded: the empty network realizes only the identity, while every filter of length
  `1` has `0 ≥ 0` roots. Output length `0` is excluded from the second claim: with sizes `(2, 2)`
  and output length `0` every map has the empty output, so the network is filling although `e = 2`.
- Over `ℂ` every architecture is filling (every complex form splits into linear factors, Mathlib
  `IsAlgClosed.splits`); the real field is essential to the criterion.

### Examples

- Two layers of size `2` realize exactly the real quadratics with a real root on the projective
  line, i.e. with nonnegative discriminant or with vanishing leading coefficient (KMMT Example 2.4,
  p. 6).
- Sizes `(4, 2)` and `(3, 2, 2)` have the same function space (quartic forms with at least two real
  roots) and different parametrizations (KMMT Example 4.3, p. 10); sizes `(2, 2, 2, 2)` realize
  exactly the quartic forms with all roots real.

### Dependencies

3.1 uses Tau Ceti's convolutional chains and Mathlib's polynomials. 3.2 uses 3.1, Tau Ceti's
`realizedFunctions` and Mathlib's real factorization.

## Scope and ownership

This roadmap owns: the pattern basis and the dimension of the permutation-equivariant linear maps
between tensor spaces for every `n` (1.1–1.2); the power-sum embedding, the continuous
sum-decomposition of invariant functions, the lower bound on the latent dimension and the
continuous decomposition of equivariant maps on all of `ℝ^M` (2.1–2.4); the reduction of a linear
convolutional network to one convolution with the explicit filter polynomial, and the function
space and filling criterion at stride one (3.1–3.2).

Stated elsewhere and not restated here:

- Tau Ceti's `TauCeti/Geometry/Neuromanifold/` library, which realizes the roadmap Neuromanifolds,
  owns realization maps, `realizedFunctions`, the valid convolution `convolution` and the
  convolutional chains `ConvolutionSpec` with their recursive evaluation (Neuromanifolds, the
  section on constructors of realisation maps). Layer 3 uses them and states nothing about the
  coefficient presentations, neurovarieties, semialgebraicity, fibres or symmetries of that roadmap.
  Neuromanifolds lists "dimension, degree, singularities, optimisation" among the subjects outside
  its contribution; the end-to-end composition and the function-space characterization of Layer 3
  are not stated there.
- SamplingAndDiscreteFourierAnalysis, Layer 2, states, among other results, that the matrices
  on `ℤ/N` commuting with the cyclic shift (the translation-equivariant linear maps of
  `ℂ^(ℤ/N)`) are exactly the circulant matrices, that these are diagonalized by the discrete
  Fourier transform, and that they form a subalgebra isomorphic to the group algebra `ℂ[ℤ/N]`;
  none of it is restated here. This roadmap does not depend on that one.
- InductionRestriction, Layer 4, owns the Hom spaces between induced representations of a finite
  group (`End_G(Ind_H^G V)` as a sum over double cosets) and the intertwining numbers; the group
  convolution of Layer 1 is a remark, and its dimension count is the library's.
- Already in the libraries, not targets: the equivariant endomorphisms of the regular
  representation (Mathlib `Rep.leftRegularHomEquiv`); Frobenius reciprocity
  (`Rep.indResHomEquiv`); the orbit-sum basis of permutation invariants and the double-coset
  orbit bijection (Tau Ceti `TauCeti.invariantOrbitSumBasis`,
  `TauCeti.doubleCosetEquivOrbitQuotient`); the commutant of the bilateral shift on the circle
  (Tau Ceti `TauCeti.commute_multiplicationOperator_fourierLp_one_iff`); the Peter–Weyl theory of
  compact groups (Tau Ceti `TauCeti/RepresentationTheory/Compact/`).
- StatisticalLearningTheory, a roadmap by another contributor (pull request
  [#2515](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2515)), treats the
  distribution-free theory of learning from examples (among other topics, risk and its
  minimization, Rademacher complexity, VC dimension and PAC learning, stability, kernels,
  conformal prediction, boosting, differential privacy); in its list "Beyond this roadmap", under
  "Deep learning theory", it names equivariant layers among the topics that need a roadmap of
  their own. This roadmap treats
  permutation-equivariant linear layers, continuous functions of sets and the function spaces of
  linear convolutional networks. It does not depend on that roadmap, and nothing in it is used or
  restated here.

Not treated here: group convolutions on infinite or compact groups and steerable filters;
equivariant layers for groups other than the symmetric groups; universal approximation by
equivariant networks; uniqueness of parameter sharing (Ravanbakhsh–Schneider–Póczos); the
decomposition on sets of varying size (Wagstaff et al., Thm 4.4); the function spaces of linear
convolutional networks with strides other than one (KMMT §4.2), and the dimension, boundary,
singularities and critical points of these function spaces (KMMT §§4–6, beyond Thm 4.1 and
Lemma 4.2); convolutions with padding or biases.

## Exact supplier contracts

### From Mathlib

- `Setoid.ker` (`Mathlib/Order/Setoid/Basic.lean`); `Fin.append`
  (`Mathlib/Data/Fin/Tuple/Basic.lean`); `Fin.cons`; `Equiv.extendSubtype`
  (`Mathlib/Logic/Equiv/Fintype.lean`: an equivalence between two
  subtypes of a finite type extends to a permutation); `Equiv.swap`.
- `MonoidAlgebra.coeffLinearEquiv` (`Mathlib/Algebra/MonoidAlgebra/Module.lean`: an element of
  `k[X]` is its finitely supported coefficient function);
  `Finsupp.linearEquivFunOnFinite` (`Mathlib/LinearAlgebra/Finsupp/Defs.lean`: finitely
  supported functions on a finite type are all functions);
  `LinearMap.funLeft` (`Mathlib/Algebra/Module/Equiv/Basic.lean`, precomposition as a linear map),
  `Matrix.mulVecLin` (`Mathlib/LinearAlgebra/Matrix/ToLin.lean`),
  `Module.finrank_eq_card_basis`, `Module.finrank_fin_fun` (`finrank R (Fin n → R) = n`).
- `Nat.stirlingSecond`, `Nat.stirlingSecond_succ_succ`, `Nat.stirlingSecond_eq_zero_of_lt`,
  `Nat.stirlingSecond_self` (`Mathlib/Combinatorics/Enumerative/Stirling.lean`); `Nat.bell`,
  `Nat.bell_succ` (`Mathlib/Combinatorics/Enumerative/Bell.lean`:
  `B(n+1) = Σ_(i ≤ n) C(n, i) B(n − i)`).
- `Multiset.prod_X_sub_X_eq_sum_esymm` (`Mathlib/RingTheory/Polynomial/Vieta.lean`: Vieta's formula
  for `Π (X − t)` over a multiset); `Polynomial.roots_multiset_prod_X_sub_C`
  (`Mathlib/Algebra/Polynomial/Roots.lean`); `Polynomial.roots_mul` (for `p q ≠ 0`),
  `Polynomial.natDegree_mul`, `Polynomial.coeff_mul`, `Polynomial.comp`.
- `isProperMap_iff_tendsto_cocompact` (`Mathlib/Topology/Maps/Proper/CompactlyGenerated.lean`),
  `IsProperMap.restrict` (restriction to a closed subset), `IsProperMap.isClosedMap`
  (`Mathlib/Topology/Maps/Proper/Basic.lean`);
  `Topology.IsClosedEmbedding.of_continuous_injective_isClosedMap`
  (`Mathlib/Topology/Maps/Basic.lean`);
  `Topology.IsClosedEmbedding.prodMap` (`Mathlib/Topology/Constructions/SumProd.lean`);
  `ContinuousMap.exists_extension'` (`Mathlib/Topology/TietzeExtension.lean`: a continuous map on a
  closed embedded subspace of a normal space extends, for targets such as `ℝ`).
- `Tuple.sort`, `Tuple.monotone_sort` (`Mathlib/Data/Fin/Tuple/Sort.lean`: a permutation sorting a
  tuple).
- `Irreducible.natDegree_le_two` (`Mathlib/Analysis/Complex/Polynomial/Basic.lean`: irreducible real
  polynomials have degree at most two); `IsRealClosed.exists_isRoot_of_odd_natDegree`
  (`Mathlib/FieldTheory/IsRealClosed/Basic.lean`, with the instance for `ℝ` in
  `Mathlib/FieldTheory/IsRealClosed/Real.lean`);
  `UniqueFactorizationMonoid.prod_normalizedFactors`
  (`Mathlib/RingTheory/UniqueFactorizationDomain/NormalizedFactors.lean`);
  `IsAlgClosed.splits` (for the Check over `ℂ`).
- `Rep.leftRegularHomEquiv` (`Mathlib/RepresentationTheory/Rep/Basic.lean`) and
  `Rep.indResHomEquiv` (`Mathlib/RepresentationTheory/Induced.lean`), for the remark of Layer 1
  only.
- `Finset.equivBitIndices` (`Mathlib/Combinatorics/Colex.lean`), for the remark of Layer 2 only.

### From Tau Ceti

- `TauCeti.invariantOrbitSumBasis` (`TauCeti/RepresentationTheory/OfMulAction.lean`): for a group
  acting on a finite set `X` and a commutative ring `k`, the invariants of `k[X]` have the basis of
  orbit sums, indexed by the orbits.
- `TauCeti.indTrivialIso` (`TauCeti/RepresentationTheory/Induction/Permutation.lean`) and
  `TauCeti.doubleCosetEquivOrbitQuotient` (`TauCeti/GroupTheory/DoubleCoset/Orbits.lean`), for the
  remark of Layer 1 only.
- `Multiset.mul_esymm_eq_sum` (`TauCeti/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean`):
  Newton's identities for the elements of a multiset in any commutative ring.
- `TauCeti.Sym.coeffHomeomorph` (`TauCeti/Analysis/Polynomial/SymmetricPower.lean`): for a proper
  algebraically closed normed field `K`, `Sym K n ≃ₜ (Fin n → K)` by the lower coefficients of
  `Π (X − t)`; named in 2.1 as related work, not used.
- `Topology.IsOpenEmbedding.finrank_le_of_isEmbedding`
  (`TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean`): if a nonempty space has an open
  embedding into a finite-dimensional real normed space `F` and an embedding into another such
  space `E`, then `finrank F ≤ finrank E`.
- From the Neuromanifold library, which realizes the roadmap Neuromanifolds:
  `TauCeti.Neuromanifold.convolution`, `convolution_apply`, `convolutionIndex_val`
  (`TauCeti/Geometry/Neuromanifold/Convolution/Basic.lean`: zero-based valid convolution
  `Σ_j w_j x_(s i + j)` with `h : n = s * (m - 1) + k`, no positivity hypotheses);
  `ConvolutionSpec`, `ConvolutionSpec.realizeWeights`, `ConvolutionSpec.realizeWeights_def`,
  `ConvolutionSpec.realize_def`, `ConvolutionSpec.evalPrefix_zero`,
  `ConvolutionSpec.evalPrefix_succ`
  (`TauCeti/Geometry/Neuromanifold/Convolution/Chain.lean`: the chain extends `MLPSpec` with filter
  lengths, strides and the length equations; the output layer has no activation; the bias-free
  realization is the affine one with every shared bias zero, and the realization is the last
  prefix evaluation); `MLPSpec.layerActivation`, `MLPSpec.layerActivation_of_lt`
  (`TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`: layer `i < L − 1` applies `activation i`);
  `realizedFunctions` (`TauCeti/Geometry/Neuromanifold/Basic.lean`, the range of a realization
  map).

## References

- H. Maron, H. Ben-Hamu, N. Shamir, Y. Lipman, *Invariant and equivariant graph networks*, ICLR
  2019, arXiv:1812.09902v2: p. 2 (dimension `b(k + l)`), Prop. 1 (p. 4), Prop. 2 and Thm 1 (p. 5),
  Figure 1 (p. 2).
- M. Zaheer, S. Kottur, S. Ravanbakhsh, B. Póczos, R. Salakhutdinov, A. Smola, *Deep sets*, NIPS
  2017, arXiv:1703.06114v3: Thm 2 and Lemma 3 (p. 2); App. A.1 (p. 12); Lemma 4 (pp. 12–13),
  Lemma 6 (p. 13), Thm 7 (p. 14) and its proof (pp. 14–15).
- E. Wagstaff, F. B. Fuchs, M. Engelcke, I. Posner, M. A. Osborne, *On the limitations of
  representing functions on sets*, ICML 2019, arXiv:1901.09006v2: Thm 2.8 and its remark (p. 2),
  Thm 4.1 and Lemma 4.2 (pp. 4–5), Thm 4.3 (p. 5), App. A.3 (p. 9), App. B.4 (p. 11).
- A. Sannai, Y. Takai, M. Cordonnier, *Universal approximations of permutation
  invariant/equivariant functions by deep neural networks*, arXiv:1903.01939v3: Cor. 3.1 (p. 6),
  Cor. 3.2 (p. 7).
- K. Kohn, T. Merkh, G. Montúfar, M. Trager, *Geometry of linear convolutional networks*,
  arXiv:2108.01538v2 (2022): eqs. (6)–(7) and Prop. 2.2 (p. 5), Examples 2.4–2.5
  (p. 6), Prop. 2.6, Cor. 2.7 and Remark 2.8 (p. 7), Thm 4.1 and Lemma 4.2 (p. 9), their proofs and
  Example 4.3 (p. 10).
- R. Kondor, S. Trivedi, *On the generalization of equivariance and convolution in neural networks
  to the action of compact groups*, ICML 2018, arXiv:1802.03690v3: Def. 4 (p. 4), Case III and
  eq. (12) (p. 5), Thm 1 (p. 6).
- T. S. Cohen, M. Welling, *Group equivariant convolutional networks*, ICML 2016,
  arXiv:1602.07576v3: §6.1, eqs. (10)–(11) (p. 5).
