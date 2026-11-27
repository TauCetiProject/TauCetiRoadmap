# Roadmap: lumpability and kemeny's constant

**Summary.** This roadmap treats two classical topics for a Markov chain on a finite state space:
when a function of the chain is again a Markov chain, and Kemeny's constant. A map `f` from the
states onto a finite set of blocks lumps the chain when the image path `f(X_0), f(X_1), …` is itself
a homogeneous Markov chain. Kemeny's constant is the trace of the fundamental matrix
`Z = (I − P + Π)⁻¹ − Π`, where `P` is the transition matrix and `Π` is the matrix all of whose rows
are a probability vector `π`; for an irreducible chain and its stationary law it is the mean time to
hit a target state drawn from `π`, whatever the starting state.

The headline theorems are these.

- *The Kemeny–Snell criterion.* The image path is, for every initial law, the chain of one fixed
  kernel on the blocks exactly when any two states of a block have the same probability of stepping
  into each block. The lumped chain then inherits stationary laws and reversibility. For an onto
  map it also inherits irreducibility, and the characteristic polynomial of its transition matrix
  divides that of `P`, so its eigenvalues are eigenvalues of `P` with at most their multiplicities.
- *Lumping from the stationary law.* If the time reversal of a stationary chain satisfies the block
  condition, the stationary chain lumps, although the chain itself may not. Conversely, for a chain
  reversible with respect to a law of full support (Burke and Rosenblatt), lumping from that law
  forces the block condition.
- *The eigenvalue formula.* For an irreducible chain, periodic or not, reversible or not, `1` is a
  simple root of the characteristic polynomial of `P`, and for any probability `π` the trace of `Z`
  is `Σ 1/(1 − λ)` over the other complex roots `λ`, counted with multiplicity. Hence the trace is
  at least `(n − 1)/2` on `n` states, with equality exactly for a chain that moves deterministically
  by a permutation of the states.
- *Lumping lowers Kemeny's constant.* Lumping an irreducible chain on `n` states along an onto map
  to `m` blocks lowers the trace of the fundamental matrix by at least `(n − m)/2`.

The roadmap builds on Tau Ceti's path law of a Markov chain, its prefix laws and the matrix of a
kernel, and on Mathlib's characteristic polynomials, Gershgorin discs and block determinants.
MarkovChainMixing supplies the transition matrix, MCMCAsymptoticVariance the fundamental matrix,
MarkovChainsAndRenewal the stationary law of an irreducible chain, and HittingAndCoverTimes the
reading of the trace of `Z` as a mean hitting time.

Layer 1 is strong lumpability, Layer 2 lumping from one initial law, Layer 3 Kemeny's constant.

## Conventions

- **States and blocks.** `S` and `T` are finite types whose σ-algebras have measurable singletons,
  so every subset and every map `f : S → T` is measurable. A chain is a kernel `κ : Kernel S S` with
  `[IsMarkovKernel κ]`, and `P(x, A) = κ x A`. A block is a fibre `f⁻¹ {t}`; a block may be empty
  unless `f` is onto.
- **Path laws.** `markovChainLaw ν κ` is Tau Ceti's law on `ℕ → S` of the chain with initial law
  `ν`. The image path is `ω ↦ (n ↦ f (ω n))`, and `ν.map f` is the image law on `T`.
- **Lumpings.** `IsLumping κ f κ'` says `κ x (f⁻¹ {t}) = κ' (f x) {t}` for all `x` and `t`: the
  kernel `κ'` on `T` records the block probabilities. It constrains `κ'` only on the image of `f`.
  `IsStronglyLumpable κ f` (Kemeny and Snell's lumpability) asks for one Markov kernel `κ'` on `T`
  with `(markovChainLaw ν κ).map (image path) = markovChainLaw (ν.map f) κ'` for every probability
  `ν`; `IsLumpableFrom κ f ν` asks for this for the one law `ν`, the kernel being allowed to depend
  on `ν`.
- **Stationarity and reversibility** are Mathlib's `κ.Invariant π` and `κ.IsReversible π`, for any
  measure `π` unless a statement says otherwise. Irreducibility is Mathlib's
  `Kernel.IsIrreducible Measure.count κ`: every state reaches every state in some `n ≥ 0` steps.
- **Matrices.** `P = transitionMatrix κ` (MarkovChainMixing 2.1), `Π = stationaryMatrix π` and
  `Z = fundamentalMatrix κ π` (MCMCAsymptoticVariance 1.1), with Mathlib's matrix inverse, which is
  `0` at a singular matrix. `χ_A` is `A.charpoly`, and `X` is the polynomial variable. Kemeny's
  constant is `trace Z`; for the stationary law it is the target time of HittingAndCoverTimes 2.3.
  In Layer 3 the law `π` may be any probability, not only the stationary one: the trace does not
  depend on it.
- **Roots.** Complex roots of a real polynomial are the roots of its image under `ℝ → ℂ`, as a
  multiset with multiplicities; `Multiset.erase` removes one copy of `1`.

## Layer 1: strong lumpability

### 1.1 The Kemeny–Snell criterion

Define `IsLumping` and `IsStronglyLumpable` as in the Conventions. Prove `isStronglyLumpable_iff`:
`κ` is strongly lumpable along `f` exactly when `κ x (f⁻¹ {t}) = κ x' (f⁻¹ {t})` for all `x`, `x'`
with `f x = f x'` and every `t`.

This is LPW, Lemma 2.5, p. 25, for the direction from the block condition (stated there for an
equivalence relation, with the classes as blocks), and the definition is Kemeny and Snell's (GT,
Definition 7, p. 7, which extends their Definition 6.3.1). CGRW, Definition 2.18, p. 25, call it
Dynkin's condition.

Route. If the block condition holds, define `κ'` on `T`: at a block `t = f x` in the image, the
image under `f` of `κ x`, which does not depend on the choice of `x`; at a `t` outside the image,
the point mass at `t`. It is a Markov kernel and `IsLumping κ f κ'` holds, so 1.2 gives the path law
identity for every `ν`. Conversely, let `κ'` witness strong lumpability and take `ν` the point mass
at `x`. The mass of the word `(f x, t)` in the law of `(f(X_0), f(X_1))` is `κ x (f⁻¹ {t})` on the
left, by the prefix formula `markovChainLaw_map_prefix_apply_singleton` summed over the words of `S`
above it, and `κ' (f x) {t}` on the right, by the same formula for `κ'`. So
`κ x (f⁻¹ {t}) = κ' (f x) {t}` for every `x`, which gives the block condition.

**Checks.**
- The lazy walk on `{0, 1}²` (stay with probability `1/2`, else flip a uniform coordinate) lumps by
  the number of ones onto `{0, 1, 2}`, with lumped matrix
  `[[1/2, 1/2, 0], [1/4, 1/2, 1/4], [0, 1/2, 1/2]]`, the lazy Ehrenfest chain.
- The chain `P = [[0, 1/2, 1/2], [1/2, 0, 1/2], [0, 3/4, 1/4]]` on `{0, 1, 2}` with blocks `{0}`
  and `{1, 2}` fails the condition: `P(1, {0}) = 1/2` and `P(2, {0}) = 0`.

*Needs:* 1.2; Tau Ceti `markovChainLaw_map_prefix_apply_singleton`. (Proved here.)

### 1.2 The lumped path law

Prove `map_markovChainLaw_of_isLumping`: if `IsLumping κ f κ'` with `κ'` Markov, then for every
finite measure `ν` on `S`, `(markovChainLaw ν κ).map (image path) = markovChainLaw (ν.map f) κ'`.

Route. By Tau Ceti `hasLaw_markovChainLaw_iff_prefixLaw_singleton`, applied to the process
`n ↦ f (ω n)` under `markovChainLaw ν κ`, it suffices that for every `n` and every word
`w = (w_0, …, w_n)` of `T` the probability that `f(X_i) = w_i` for `i ≤ n` is
`ν(f⁻¹ {w_0}) Π_{i<n} κ' (w_i) {w_(i+1)}`. By `markovChainLaw_map_prefix_apply_singleton` that
probability is the finite sum, over words `u` of `S` with `f(u_i) = w_i`, of
`ν {u_0} Π_{i<n} κ (u_i) {u_(i+1)}`. Sum over the last letter first: for fixed `u_0, …, u_(n−1)` the
sum over `u_n` in `f⁻¹ {w_n}` is `κ (u_(n−1)) (f⁻¹ {w_n})`, which is `κ' (w_(n−1)) {w_n}` because
`f(u_(n−1)) = w_(n−1)`. This factor does not depend on the remaining letters; repeat down to `u_1`,
and the sum over `u_0` in `f⁻¹ {w_0}` leaves `ν(f⁻¹ {w_0}) = (ν.map f) {w_0}`.
If some `w_j` is not a value of `f`, there is no such word `u` and the sum is `0`; the product is
`0` as well: take the least such `j`; either `j = 0` and `ν(f⁻¹ {w_0}) = 0`, or `w_(j−1) = f x` for
some `x` and `κ' (w_(j−1)) {w_j} = κ x (f⁻¹ {w_j}) = 0`.

**Checks.**
- On the lazy walk of 1.1 started at `(0, 0)`, the masses of all words of length at most four agree
  with the lazy Ehrenfest chain started at `0`.

*Needs:* Tau Ceti `hasLaw_markovChainLaw_iff_prefixLaw_singleton`,
`markovChainLaw_map_prefix_apply_singleton`. (Proved here, after LPW, Lemma 2.5.)

### 1.3 What a lumping inherits

Prove `isLumping_invariant_isReversible_isIrreducible`: if `IsLumping κ f κ'` with `κ'` Markov, then
(a) `κ.Invariant π` implies `κ'.Invariant (π.map f)`, (b) `κ.IsReversible π` implies
`κ'.IsReversible (π.map f)`, for every measure `π` on `S`, and (c) if `κ` is irreducible and `f` is
onto, `κ'` is irreducible.

Route. (a) On a finite type, `(μ.bind η) {t} = Σ_s μ {s} η s {t}`. So
`((π.map f).bind κ') {t} = Σ_x π {x} κ' (f x) {t} = Σ_x π {x} κ x (f⁻¹ {t})`, which is
`(π.bind κ) (f⁻¹ {t}) = π (f⁻¹ {t}) = (π.map f) {t}`; two measures on `T` that agree on singletons
are equal. (b) By the singleton test (MarkovChainsAndRenewal §3.1, `isReversible_iff_singletons`),
detailed balance `π {x} κ x {y} = π {y} κ y {x}` holds for all states. Then
`(π.map f) {a} · κ' a {b} = Σ_{x ∈ f⁻¹{a}, y ∈ f⁻¹{b}} π {x} κ x {y}` (both sides `0` when `f⁻¹ {a}`
is empty), and this is symmetric in `a`, `b`; the singleton test on `T` gives (b). (c) For
`a = f x`, the law of `f(X_n)` under the chain from `x` is `(κ' ^ n) a` by 1.2 and Tau Ceti
`markovChainLaw_map_eval`, so `(κ' ^ n) a {b} = (κ ^ n) x (f⁻¹ {b}) ≥ (κ ^ n) x {y}` for `y` with
`f y = b`. As `f` is onto, choose such `x` and `y`; irreducibility of `κ` (Tau Ceti
`isIrreducible_count_iff_forall_reaches`, `reaches_def`) gives `n` with `(κ ^ n) x {y} > 0`.

**Checks.**
- (c) needs `f` onto: lump the uniform chain on `{0, 1}` by the inclusion into `{0, 1, 2}`, with
  `κ' 2` the point mass at `2`. Then `IsLumping` holds and `2` reaches nothing else.

*Needs:* 1.2; MarkovChainsAndRenewal §3.1 (`isReversible_iff_singletons`); Tau Ceti
`markovChainLaw_map_eval`, `isIrreducible_count_iff_forall_reaches`, `reaches_def`. (Proved here.)

### 1.4 The spectrum of a lumped chain

Copy verbatim `transitionMatrix` (MarkovChainMixing 2.1). Prove `charpoly_dvd_of_isLumping`: if
`IsLumping κ f κ'` with `κ'` Markov and `f` onto, then `χ_(P̂)` divides `χ_P` in `ℝ[X]`, where
`P̂ = transitionMatrix κ'`. LPW, Lemma 12.9, p. 167, gives the inclusion of eigenvalues by lifting
eigenfunctions; the divisibility counts multiplicities.

Route. Let `U` be the `S × T` matrix with `U x t = 1` when `f x = t` and `0` otherwise. Entry
`(x, t)` of `P U` is `κ x (f⁻¹ {t})` and that of `U P̂` is `κ' (f x) {t}`, so `IsLumping` reads
`P U = U P̂`. Pick a section `s : T → S` of `f` and let `S'` be the states not in its range. The
columns of `U` together with the unit vectors `e_x`, `x ∈ S'`, form a basis of `ℝ^S`: in the
coordinates `s(T)` and `S'`, the matrix `M` with these columns, reindexed along `S ≃ T ⊕ S'`, is
block lower unitriangular, so `det M = ±1`. Since `M⁻¹ U` is the first `T` columns of the identity,
`M⁻¹ P M = fromBlocks P̂ B 0 D` for some `B` and `D`. The characteristic polynomial is invariant
under conjugation and reindexing, and `det_fromBlocks_zero₂₁` applied to `X · 1 − M⁻¹ P M` gives
`χ_P = χ_(P̂) · χ_D`.

**Checks.**
- The walk on the cube `{0, 1}³` (flip a uniform coordinate; period `2`) lumps by the number of
  ones onto the Ehrenfest chain on `{0, 1, 2, 3}`. The quotient `χ_P / χ_(P̂)` is `(X² − 1/9)²`: the
  cube has eigenvalues `1, 1/3, −1/3, −1` with multiplicities `1, 3, 3, 1`.
- The walk on the cycle of length `6` lumps by `x ↦ min(x, 6 − x)` onto the path `0 — 1 — 2 — 3`
  with reflection at both ends; the quotient is `X² − 1/4`.
- `f` must be onto: for the example of 1.3, `χ_P = X (X − 1)` and `χ_(P̂) = X (X − 1)²`.

*Needs:* Mathlib `Matrix.det_fromBlocks_zero₂₁`, `Matrix.charpoly_units_conj`,
`Matrix.charpoly_reindex`; Tau Ceti `Kernel.coe_toMatrix_apply`. (Proved here.)

### Examples

The square and the cube lumped onto Ehrenfest chains; the cycle of length `6` onto a path.

### Dependencies

MarkovChainMixing 2.1 (the definition of `transitionMatrix`); MarkovChainsAndRenewal §3.1; Tau Ceti
`markovChainLaw_map_prefix_apply_singleton`, `hasLaw_markovChainLaw_iff_prefixLaw_singleton`,
`markovChainLaw_map_eval`, `isIrreducible_count_iff_forall_reaches`, `reaches_def`,
`Kernel.coe_toMatrix_apply`; Mathlib `Matrix.det_fromBlocks_zero₂₁`, `Matrix.charpoly_units_conj`,
`Matrix.charpoly_reindex`.

## Layer 2: lumping from one initial law

### 2.1 A sufficient condition through the time reversal

Define `IsLumpableFrom`. Prove `isLumpableFrom_of_reversal`: let `π` be a stationary probability of
`κ`, and suppose that for all `y`, `y'` with `f y = f y'` and every `t`,
`π {y'} · ∫_{f⁻¹{t}} κ(·, {y}) dπ = π {y} · ∫_{f⁻¹{t}} κ(·, {y'}) dπ`. Then `IsLumpableFrom κ f π`.
When `π` charges `y` and `y'`, the condition says that the time reversal
`P*(y, x) = π {x} κ x {y} / π {y}` gives `y` and `y'` the same probability of stepping into the
block `t`; at a state with `π {y} = 0` both sides vanish. CGRW, Corollary 10.2, p. 67, show for `π`
of full support that strong lumping of the reversal makes the stationary chain lump exactly, which
is a case of lumping from `π` (their Definition 2.19, p. 25); their Theorem 2.23, p. 27, credits the
reversible case to Burke and Rosenblatt.

Route. Let `S₊` be the states charged by `π`. Stationarity gives `π {y} = Σ_x π {x} κ x {y}`, so
`κ x {y} = 0` for `x ∈ S₊` and `y ∉ S₊`, and in the sum below only words inside `S₊` contribute. For
a word `a_0, …, a_n` of blocks, the probability that `f(X_i) = a_i` for `i ≤ n` is the sum over
words `x` in `S₊` with `f(x_i) = a_i` of `π {x_0} Π κ x_i {x_(i+1)}`. Rewrite each factor by
`π {x_i} κ x_i {x_(i+1)} = π {x_(i+1)} P*(x_(i+1), x_i)`, working from the left; the summand becomes
`π {x_n} Π P*(x_(i+1), x_i)`. Now sum over `x_0` first: it gives `c(a_1, a_0) = P*(x_1, f⁻¹{a_0})`,
which by the hypothesis depends only on the block `a_1` of `x_1`. Repeat up to `x_(n−1)`; what
remains is `π̂(a_n) Π_{i<n} c(a_(i+1), a_i)`, with `π̂ = π.map f`. Define
`κ' a {b} = π̂(b) c(b, a) / π̂(a)` when `π̂(a) > 0`, and the point mass at `a` otherwise. It is
Markov: `Σ_b π̂(b) c(b, a) = Σ_{y} Σ_{x ∈ f⁻¹{a}} π {x} κ x {y} = π̂(a)`. The product
`π̂(a_n) Π c(a_(i+1), a_i)` telescopes to `π̂(a_0) Π κ' a_i {a_(i+1)}` when every `π̂(a_i)` is
positive; when one is zero both sides are `0`, the left because a block not charged by `π` contains
no state of `S₊`, the right because the first such factor `κ' a_(j−1) {a_j}` has `π̂(a_j) = 0`. Tau
Ceti `hasLaw_markovChainLaw_iff_prefixLaw_singleton` concludes.

**Checks.**
- `P = [[0, 1/2, 1/2], [1/2, 0, 1/2], [0, 3/4, 1/4]]`, blocks `{0}` and `{1, 2}`:
  `π = (1/5, 2/5, 2/5)`, the reversal is `[[0, 1, 0], [1/4, 0, 3/4], [1/4, 1/2, 1/4]]`, which
  satisfies the block condition, while `P` does not (1.1). The stationary lumped process is the
  chain of `[[0, 1], [1/4, 3/4]]` started from `(1/5, 4/5)`: the masses of all block words of length
  at most six agree. So lumping from `π` does not imply strong lumpability.
- In that example `P` is not reversible: `π {0} P(0, 1) = 1/10` and `π {1} P(1, 0) = 1/5`.

*Needs:* Tau Ceti `hasLaw_markovChainLaw_iff_prefixLaw_singleton`,
`markovChainLaw_map_prefix_apply_singleton`. (Proved here.)

### 2.2 Reversible chains: the theorem of Burke and Rosenblatt

Prove `lumping_condition_of_isLumpableFrom`: if `κ` is reversible with respect to a probability `π`
with `π {x} > 0` for every state and `IsLumpableFrom κ f π`, then `κ` satisfies the block condition
of 1.1, and so is strongly lumpable. This is CGRW, Theorem 2.23, p. 27, after Burke and Rosenblatt.

Route. Write `π̂ = π.map f`, `g_a(y) = κ y (f⁻¹ {a})`, and for a block `b` charged by `π` let `E_b`
be the average over `f⁻¹ {b}` with weights `π {y} / π̂(b)`. Let `κ'` witness lumping from `π`, and
write `p(a_0, …, a_n)` for the probability of a block word. Reversibility holds pointwise
(MarkovChainsAndRenewal §3.1), and gives three identities. From words of length two,
`p(b, c) = π̂(b) E_b g_c` and `p(a, b) = p(b, a)`. From words of length three,
`p(a, b, c) = Σ_{y ∈ f⁻¹{b}} (Σ_{x ∈ f⁻¹{a}} π {x} κ x {y}) g_c(y) = π̂(b) E_b (g_a g_c)`, replacing
`π {x} κ x {y}` by `π {y} κ y {x}`. Lumping from `π` with kernel `κ'` gives
`p(a, b, c) = p(a, b) κ' b {c}` and `p(b, c) = π̂(b) κ' b {c}`; so `E_b g_c = κ' b {c}` and
`π̂(b) E_b (g_a g_c) = p(b, a) κ' b {c} = π̂(b) E_b g_a · E_b g_c`. With `c = a` the variance of
`g_a` under the weights of `E_b` vanishes; all weights are positive, so `g_a` is constant on
`f⁻¹ {b}`. This is the block condition; 1.1 gives strong lumpability.

**Checks.**
- Full support is needed: `P = [[1/2, 1/2, 0], [1/2, 1/2, 0], [1, 0, 0]]`, `π = (1/2, 1/2, 0)`,
  blocks `{0}` and `{1, 2}`. The chain is reversible for `π`, the stationary lumped process is
  independent and uniform on the two blocks, hence lumps from `π`, but `P(1, {0}) = 1/2` and
  `P(2, {0}) = 1`.
- Reversibility is needed: the chain of 2.1 lumps from its stationary law of full support and fails
  the block condition.

*Needs:* 1.1; MarkovChainsAndRenewal §3.1 (`isReversible_iff_singletons`); Tau Ceti
`markovChainLaw_map_prefix_apply_singleton`. (Proved here.)

### Examples

A chain whose reversal, but not itself, meets the block condition; a reversible counterexample.

### Dependencies

1.1; MarkovChainsAndRenewal §3.1; Tau Ceti `hasLaw_markovChainLaw_iff_prefixLaw_singleton`,
`markovChainLaw_map_prefix_apply_singleton`.

## Layer 3: Kemeny's constant and the spectrum

### 3.1 The spectrum of `P − Π`

Copy verbatim `stationaryMatrix` and `fundamentalMatrix` (MCMCAsymptoticVariance 1.1). Prove
`charpoly_sub_stationaryMatrix`: for a Markov kernel `κ` and any probability `π`,
`(X − 1) · χ_(P − Π) = X · χ_P`. Stationarity is not needed.

Route. Work over the field of rational functions `ℝ(X)`. The matrix `A = X · 1 − P` is invertible
there, its determinant being the monic polynomial `χ_P`. Write `Π = 𝟙 πᵀ`, with `𝟙` the constant
vector. The determinant lemma for a rank one perturbation (`det_add_replicateCol_mul_replicateRow`)
gives `χ_(P − Π) = det(A + 𝟙 πᵀ) = χ_P · (1 + πᵀ A⁻¹ 𝟙)`. Row sums of `P` are `1`, so
`A 𝟙 = (X − 1) 𝟙` and `A⁻¹ 𝟙 = (X − 1)⁻¹ 𝟙`; as `πᵀ 𝟙 = 1`, the factor is `X / (X − 1)`. Clear the
denominator and use that `ℝ[X] → ℝ(X)` is injective.

**Checks.**
- The two-state chain `P = [[2/3, 1/3], [1/2, 1/2]]`: `χ_P = (X − 1)(X − 1/6)`. For the stationary
  `π = (3/5, 2/5)` and for the point mass `π = (1, 0)` alike, `P − Π` has trace `1/6` and
  determinant `0`, so `χ_(P − Π) = X (X − 1/6)`.

*Needs:* MCMCAsymptoticVariance 1.1 (definitions); Mathlib
`Matrix.det_add_replicateCol_mul_replicateRow`, `Matrix.charpoly_monic`. (Proved here.)

### 3.2 The eigenvalue formula

Prove `trace_fundamentalMatrix_eq_sum_roots`: for an irreducible chain and any probability `π`, `1`
is a root of `χ_P` of multiplicity exactly `1`, and `trace Z = Σ 1/(1 − λ)`, the sum over the
complex roots `λ` of `χ_P` with one copy of `1` removed. With the stationary law this is Hunter,
(9), p. 5, written there for `trace (I − P + Π)⁻¹ = 1 + trace Z`, and attributed by him to Levene
and Loizou, to his 2006 paper and to Doyle.

Route. `P 𝟙 = 𝟙`, so `χ_P = (X − 1) q` for a monic `q`, and by 3.1 `χ_(P − Π) = X q` for every
probability `π`. Simplicity: by MarkovChainsAndRenewal §3.2 (`existsUnique_invariant_probability`)
the chain has a stationary probability `π₀`. Then `I − P + Π₀` has trivial kernel: if
`(I − P + Π₀) v = 0`, multiplying by `π₀ᵀ` on the left gives `π₀ᵀ v = 0`, so `P v = v`; a function
with `P v = v` attains its maximum on a set that is closed under the transitions, which is
everything by irreducibility, so `v` is constant, and its `π₀`-mean is `0`, so `v = 0`. (This
argument is the one listed in MCMCAsymptoticVariance 1.1.) Hence
`0 ≠ det(I − P + Π₀) = χ_(P − Π₀)(1) = q(1)`, and `1` is a simple root of `χ_P`. For any probability
`π`, `M = I − P + Π` then has `det M = q(1) ≠ 0`, and `χ_M(X) = (−1)^n χ_(P − Π)(1 − X)`, so the
complex roots of `χ_M` are `1` and the numbers `1 − λ`, `λ` a root of `q`. The roots of `χ_(M⁻¹)`
are their inverses (`Matrix.charpoly_inv`: it is a multiple of the reversed polynomial), and
`Matrix.trace_eq_sum_roots_charpoly` over `ℂ` gives `trace M⁻¹ = 1 + Σ_λ 1/(1 − λ)`. Finally
`trace Π = Σ_y π {y} = 1`.

**Checks.**
- The two-state chain of 3.1: the other root is `1/6` and `trace Z = 6/5 = 1/(1 − 1/6)`, for the
  stationary `π` and for `π = (1, 0)` alike.
- The exchange chain on two states (period `2`): the other root is `−1`, and `trace Z = 1/2`.
- The non-reversible walk on a triangle stepping clockwise with probability `2/3` and
  counterclockwise with probability `1/3`: the other roots are a conjugate pair and `trace Z = 9/7`.
- Irreducibility is needed: for the identity on two states and uniform `π`, `1` is a double root,
  `Z = −Π` (junk) has trace `−1`, and the sum is `1/(1 − 1) = 0`.

*Needs:* 3.1; MarkovChainsAndRenewal §3.2 (`existsUnique_invariant_probability`); Mathlib
`Matrix.charpoly_inv`, `Matrix.trace_eq_sum_roots_charpoly`, `Polynomial.roots_mul`. (Proved here.)

### 3.3 Hunter's lower bound

Prove `card_sub_one_div_two_le_trace`: for an irreducible chain on `n` states and any probability
`π`, `(n − 1)/2 ≤ trace Z`, with equality exactly when there is a permutation `σ` of the states with
`κ x {σ x} = 1` for every `x`. Hunter, pp. 5–6, proves the bound in the form
`trace (I − P + Π)⁻¹ ≥ (n + 1)/2` and notes, p. 9, that a periodic chain of period `n` attains it;
BHLMT, Remark 4.2, p. 7, restate it as `Σ_j π_j E_i τ_j ≥ (n − 1)/2`, with hitting times counted
from time `0`. The characterization of equality is proved here.

Route. Every complex root `λ` of `χ_P` has `|λ| ≤ 1`: it is an eigenvalue of `P` over `ℂ`
(`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.spectrum_toLin'`,
`Module.End.hasEigenvalue_iff_mem_spectrum`), and the Gershgorin disc of row `x`
(`eigenvalue_mem_ball`) has centre `P(x, x) ≥ 0` and radius `1 − P(x, x)`. For `λ ≠ 1` with
`|λ| ≤ 1`, writing `λ = a + b i`, the real part of `1/(1 − λ)` is `(1 − a)/((1 − a)² + b²)`, which
is at least `1/2` because `(1 − a)² + b² ≤ 2(1 − a)` is `a² + b² ≤ 1`; equality holds exactly when
`|λ| = 1`. By 3.2 the `n − 1` roots in the sum all differ from `1`, and `trace Z` is real, so taking
real parts gives the bound, with equality exactly when every root of `χ_P` has modulus `1`. If `κ`
moves by a permutation `σ`, `P` is a permutation matrix and `χ_P` is the product of `X^k − 1` over
the cycles of `σ`, so every root is a root of unity. Conversely, if every root has modulus `1`, then
`|det P| = 1`. Expand `det P` and `1 = Π_x Σ_y P(x, y)` as sums over maps `g` of the states, with
terms `Π_x P(x, g x)`; the first sum runs over bijections only, with signs, so
`1 = |det P| ≤ Σ_{g bijective} Π_x P(x, g x) ≤ 1`, and every non-bijective `g` has a zero term. Take
a bijection `σ` with positive term. If some row `x` had a second positive entry `y ≠ σ x`, the map
equal to `σ` except `x ↦ y` would be non-bijective with positive term. So row `x` is the point mass
at `σ x`.

**Checks.**
- Equality: the rotation `x ↦ x + 1` on `ℤ/n` has `trace Z = (n − 1)/2` (checked for
  `n = 3, 4, 5`), and by HittingAndCoverTimes 2.3 (`sum_mul_meanHittingTime_eq_trace`) this is the
  target time `(1/n) Σ_{k<n} k` of the rotation. The exchange chain gives `1/2`.
- Strict inequality: the two-state chain of 3.1 (`6/5 > 1/2`), the triangle walk of 3.2
  (`9/7 > 1`).
- Irreducibility is needed: the identity kernel on two states gives `−1 < 1/2`.

*Needs:* 3.2; HittingAndCoverTimes 2.3 (in a Check); Mathlib `eigenvalue_mem_ball`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.spectrum_toLin'`,
`Module.End.hasEigenvalue_iff_mem_spectrum`. (Proved here, after Hunter.)

### 3.4 Lumping lowers Kemeny's constant

Prove `trace_fundamentalMatrix_add_le_of_isLumping`: let `κ` be irreducible on `n` states,
`IsLumping κ f κ'` with `κ'` Markov and `f` onto `m` blocks, and `π` any probability. Then
`trace Z(κ', π.map f) + (n − m)/2 ≤ trace Z(κ, π)`. The case `m = 1`, with `trace Z = 0` on one
state, is the bound of 3.3.

Route. By 1.3(c), `κ'` is irreducible, and `π.map f` is a probability. By 1.4, `χ_P = χ_(P̂) · R`
with `R` monic of degree `n − m`, so over `ℂ` the roots of `χ_P` are those of `χ_(P̂)` together with
those of `R` (`Polynomial.roots_mul`). `1` is a root of `χ_(P̂)` (`P̂ 𝟙 = 𝟙`) and a simple root of
`χ_P` (3.2), so it is not a root of `R`, and removing one copy of `1` from both sides leaves
`roots(χ_P).erase 1 = roots(χ_(P̂)).erase 1 + roots(R)`. By 3.2 for `κ` and for `κ'`,
`trace Z(κ, π) − trace Z(κ', π.map f) = Σ_{roots λ of R} 1/(1 − λ)`. Each such `λ` is a root of
`χ_P` other than `1`, so `|λ| ≤ 1` by Gershgorin and the real part of its term is at least `1/2`
(the computation in the route of 3.3, repeated here); there are `n − m` of them.

**Checks.**
- The cycle of length `6` lumped onto the path (1.4): `35/6` and `19/6`, difference `8/3 ≥ 1`.
- The cube lumped onto the Ehrenfest chain (1.4): `29/4` and `11/4`, difference `9/2 ≥ 2`.
- A periodic, non-reversible example: the walk on `ℤ/4` stepping `+1` with probability `2/3` and
  `−1` with probability `1/3`, lumped by parity onto the exchange chain: `23/10` and `1/2`,
  difference `9/5 ≥ 1`.
- `f` must be onto: the uniform chain on `{0, 1}` (`trace Z = 1`) and the inclusion into
  `{0, 1, 2}` with `κ' 2 = (1/4, 0, 3/4)`: `IsLumping` holds, `trace Z(κ', π.map f) = 5`, and
  `5 − 1/2 > 1`.
- Irreducibility is needed: the identity kernel on two states lumped onto one point gives `0 + 1/2`
  on the left and `−1` on the right.

*Needs:* 1.3, 1.4, 3.2; Mathlib `Polynomial.roots_mul`, `Multiset.erase_add_left_pos`,
`eigenvalue_mem_ball`, `Matrix.mem_spectrum_iff_isRoot_charpoly`. (Proved here.)

### Examples

Two-state, exchange, rotation and triangle chains; the cycle, the cube and a biased walk on `ℤ/4`
lumped, with the constants before and after.

### Dependencies

1.3, 1.4; MCMCAsymptoticVariance 1.1; MarkovChainsAndRenewal §3.2; HittingAndCoverTimes 2.3 (in a
Check); Mathlib `Matrix.det_add_replicateCol_mul_replicateRow`, `Matrix.charpoly_monic`,
`Matrix.charpoly_inv`, `Matrix.trace_eq_sum_roots_charpoly`,
`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.spectrum_toLin'`,
`Module.End.hasEigenvalue_iff_mem_spectrum`, `eigenvalue_mem_ball`, `Polynomial.roots_mul`,
`Multiset.erase_add_left_pos`.

## Scope and ownership

This roadmap owns, for finite chains, the theorems 1.1–3.4: strong lumpability and what a lumped
chain inherits, lumping from the stationary law, simplicity of the eigenvalue `1`, the eigenvalue
formula for `trace Z`, Hunter's bound with its equality case, and the effect of lumping on it.

Already in the libraries and therefore not targets: Tau Ceti's path law, its prefix laws, the matrix
of a kernel and reachability; Mathlib's kernels, characteristic polynomials, Gershgorin discs and
block determinants. Nothing at the pins treats lumping or the fundamental matrix.

Left to other roadmaps:

- MarkovChainMixing owns the transition matrix, copied verbatim, the spectral decomposition of a
  reversible chain and mixing times.
- MCMCAsymptoticVariance owns the fundamental matrix with its identities and its series form; its
  definitions are copied verbatim in 3.1, and the invertibility argument listed in its 1.1 is kept
  inline in 3.2.
- HittingAndCoverTimes owns mean hitting times, the mean hitting time formula through `Z` and the
  random target lemma `Σ_y π {y} E_x τ_y = trace Z`, which makes `trace Z` Kemeny's constant; it is
  quoted in a Check of 3.3 and not restated.
- MarkovChainsAndRenewal owns stationary laws of irreducible chains and the singleton test for
  detailed balance, consumed in 1.3, 2.2 and 3.2.

EquitableOperatorReduction (an open roadmap, not on main) plans equitable partitions of general
real and complex matrices, with lifted eigenvectors and the inclusion of the quotient spectrum in
the spectrum of the matrix, and an adapter to stochastic matrices. This roadmap works with kernels
and path laws, and its 1.4 is the divisibility of characteristic polynomials, with algebraic
multiplicities, for the transition matrix of a lumping; this roadmap does not depend on that one.

Not treated here: exact lumpability as a property in its own right, the characterization of all
initial laws from which a chain lumps (Gurvits and Ledoux, as presented by CGRW), lumpings to
higher-order chains, lumpability of continuous-time chains, perturbation bounds for Kemeny's
constant and its relation to the Kirchhoff index of graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`: `Matrix.det_fromBlocks_zero₂₁`
  (`det (fromBlocks A B 0 D) = det A * det D`).
- `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`:
  `Matrix.det_add_replicateCol_mul_replicateRow` (for `IsUnit A.det`,
  `det (A + col u * row v) = det A * det (1 + row v * A⁻¹ * col u)`).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`: `Matrix.charpoly_units_conj`,
  `Matrix.charpoly_reindex`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`:
  `Matrix.charpoly_monic`, `Matrix.charpoly_inv` (for a unit `A`, `A⁻¹.charpoly` is a constant
  multiple of `A.charpolyRev`); `Matrix.spectrum_toLin'`,
  `Module.End.hasEigenvalue_iff_mem_spectrum`.
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean`: `Matrix.trace_eq_sum_roots_charpoly` (over an
  algebraically closed field), `Matrix.mem_spectrum_iff_isRoot_charpoly`.
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (an eigenvalue lies in the
  disc of some row: centre `A k k`, radius `Σ_{j ≠ k} ‖A k j‖`).
- `Polynomial.roots_mul` (for `p * q ≠ 0` over a domain), `Multiset.erase_add_left_pos`;
  `Kernel.Invariant`, `Kernel.IsReversible`, `Kernel.IsIrreducible`.

### From Tau Ceti

- `TauCeti/Probability/Process/MarkovChain.lean`: `TauCeti.Probability.markovChainLaw`;
  `markovChainLaw_map_prefix_apply_singleton` (for s-finite `ν`, the mass of the word `w_0, …, w_n`
  is `ν {w_0} Π κ (w_i) {w_(i+1)}`); `hasLaw_markovChainLaw_iff_prefixLaw_singleton` (for a finite
  `ν` and a countable state space, a process has the path law of the chain exactly when its prefix
  laws are given by that formula); `Measure.markovChainLaw_map_eval` (the law at time `n` is
  `(κ ^ n) ∘ₘ ν`).
- `TauCeti/Probability/Kernel/Matrix.lean`: `Kernel.toMatrix`, `Kernel.coe_toMatrix_apply` (for a
  finite kernel, the entry is `κ a {b}`).
- `TauCeti/Probability/Kernel/Reachability.lean`: `Kernel.isIrreducible_count_iff_forall_reaches`,
  `Kernel.reaches_def` (`x` reaches `y` when `(κ ^ n) x {y} > 0` for some `n`).

### From TauCetiRoadmap.MarkovChainMixing

- 2.1: the definition `transitionMatrix κ = κ.toMatrix.map (↑)`, copied verbatim.

### From TauCetiRoadmap.MCMCAsymptoticVariance

- 1.1: the definitions `stationaryMatrix` and `fundamentalMatrix`, copied verbatim; the
  invertibility argument of its 1.1 list, with its proof kept in 3.2.

### From TauCetiRoadmap.MarkovChainsAndRenewal

- §3.1 `isReversible_iff_singletons` (countable state space, any measure `π`: reversibility is
  `π {x} κ x {y} = π {y} κ y {x}` for all states), used in 1.3 and 2.2.
- §3.2 `existsUnique_invariant_probability` (a finite irreducible chain has exactly one invariant
  probability), used in 3.2.

### From TauCetiRoadmap.HittingAndCoverTimes

- 2.3 `sum_mul_meanHittingTime_eq_trace` (irreducible finite chain, stationary probability `π`:
  `Σ_y π {y} E_x τ_y = trace Z` for every `x`), used in a Check of 3.3.

## References

- [BHLMT] D. Bini, J. J. Hunter, G. Latouche, B. Meini and P. Taylor, *Why is Kemeny's constant a
  constant?*, arXiv:1711.03313v2: Theorem 3.2, p. 4; Remark 4.2, p. 7.
- [CGRW] E. Crane, Á. Gutiérrez, E. Russell and M. Wildon, *Weak lumping of left-invariant random
  walks on left cosets of finite groups*, arXiv:2412.19742v1: Definitions 2.2 and 2.3, p. 16;
  Definitions 2.18 and 2.19, p. 25; Theorem 2.23, p. 27; Theorem 10.1, p. 65; Corollary 10.2, p. 67.
- [GT] B. C. Geiger and C. Temmel, *Lumpings of Markov chains, entropy rate preservation, and
  higher-order lumpability*, arXiv:1212.4375v6: Definition 7, p. 7.
- [Hunter] J. J. Hunter, *The role of Kemeny's constant in properties of Markov chains*,
  arXiv:1208.4716 (Comm. Statist. Theory Methods 43 (2014), 1309–1321): (9), p. 5; the lower bound,
  pp. 5–6; the minimal value, p. 9.
- [LPW] D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov Chains and Mixing
  Times*, 2nd ed., AMS, 2017 (authors' PDF): Lemma 2.5, p. 25; Lemma 12.9, p. 167.
- C. J. Burke and M. Rosenblatt, *A Markovian function of a Markov chain*, Ann. Math. Statist. 29
  (1958), 1112–1122, and J. G. Kemeny and J. L. Snell, *Finite Markov Chains*, Van Nostrand, 1960,
  are cited through CGRW and GT.
