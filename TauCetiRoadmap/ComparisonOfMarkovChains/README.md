# Roadmap: comparison of markov chains

**Summary.** This roadmap compares two Markov chains on the same finite state space through their
Dirichlet forms. A chain is a kernel `κ` on a finite set with a measure `π`, and the edge weight
of a transition is `Q(x, y) = π(x) κ(x, y)`; the Dirichlet form is
`E(f) = ½ Σ_{x,y} (f(x) − f(y))² Q(x, y)` and the spectral gap `γ` is the least value of
`E(f)/Var_π(f)`. The method routes every transition of a second chain `κ'` (with law `π'`)
through paths of transitions of `κ`, and bounds the load that this routing puts on each edge of
`κ`.

The headline theorems are these.

- *Comparison by paths.* Let a probability weight on paths of `κ` from `x` to `y` be chosen for
  every transition `(x, y)` of `κ'`, and let `B` bound, for every edge `e` of `κ`, the quotient by
  `Q(e)` of `Σ_{x,y} Q'(x, y) Σ_Γ ν_{xy}(Γ) N(e, Γ) |Γ|`, where `N(e, Γ)` counts the passages of
  `Γ` through `e` and `|Γ|` is its length. Then `E'(f) ≤ B E(f)` for every `f`, for any two
  kernels. Combined with the comparison of spectral gaps of MarkovChainMixing, this gives
  `γ' ≤ max_x (π(x)/π'(x)) · B · γ` when both kernels are Markov, `π` is a stationary
  probability for `κ` and `π'` a positive probability.
- *Canonical paths.* If the probability measure `π` charges two states and the pairs `(x, y)`,
  weighted by `π(x) π(y)`, are routed through paths of `κ` with every edge load at most
  `B Q(e)`, then `γ ≥ 1/B`.
- *Walks on groups.* For random walks on a finite group driven by probability measures `μ` and
  `μ'`, let each `a` charged by `μ'` carry a probability weight `ν_a` on words with product `a`
  in elements charged by `μ`. If `Σ_a μ'(a) Σ_w ν_a(w) N(s, w) |w| ≤ B μ(s)` for every `s`
  charged by `μ` (`N(s, w)` counts the letters `s` of `w`), then `γ' ≤ B γ`. For random
  transpositions against lazy random adjacent transpositions on `n` cards this gives
  `γ_rt ≤ 4 n² γ_adj`.
- *Eigenvalues one by one.* If the Markov kernels `κ` and `κ'` are reversible for positive
  probability laws `π` and `π'` and `E' ≤ a E`, both transition matrices have real spectra, and
  their `k`-th largest eigenvalues satisfy `1 − λ'_k ≤ max_x (π(x)/π'(x)) · a · (1 − λ_k)` for
  every `k`. The logarithmic Sobolev constants compare in the same way when `π` is stationary for
  `κ` and `π'` is positive.

The Dirichlet form, the spectral gap, the transition matrix and the comparison of gaps are
those of MarkovChainMixing. RandomWalksOnFiniteGroups supplies
the random walk of a measure on a group and the random transposition measure, and
LogSobolevForMarkovChains the entropy and the logarithmic Sobolev constant. Tau Ceti's
Courant–Fischer theorem gives the variational form of the eigenvalues.

Layer 1 below defines paths, flows and edge loads, proves the comparison of Dirichlet forms,
derives from it the comparison of spectral gaps, and proves the canonical-path bound. Layer 2
specializes the method to random walks on finite groups and compares adjacent with random
transpositions. Layer 3, which uses no other layer, compares the eigenvalues one by one and the
logarithmic Sobolev constants.

## Conventions

- **State spaces.** `S` is a finite type with a σ-algebra in which singletons are measurable
  (`[Fintype S] [MeasurableSpace S] [MeasurableSingletonClass S]`). `[DecidableEq S]` is assumed
  where edges are counted or a characteristic polynomial is taken, and `[Nonempty S]` where a
  maximum over states is taken.
- **Chains and weights.** A chain is a kernel `κ : Kernel S S`; `κ(x, y)` abbreviates
  `(κ x).real {y}` and `π(x)` abbreviates `π.real {x}`. The edge weight is
  `Q(x, y) = π(x) κ(x, y)`, and an edge of `(κ, π)` is a pair with `Q(x, y) > 0`. The second chain
  is `(κ', π')` with weights `Q'`. Stationarity is Mathlib's `κ.Invariant π` and reversibility
  `κ.IsReversible π`. Statements say where a Markov kernel, a probability measure or a positive
  law is needed; several hold for all kernels and measures.
- **Copied definitions.** `transitionMatrix` (the real matrix `P x y = κ(x, y)`), `dirichletForm`
  and `spectralGap` are those of MarkovChainMixing 2.1 and 2.4:
  `E(f) = ½ Σ_{x,y} (f x − f y)² Q(x, y)`
  and `γ` the infimum of `E(f)/Var_π(f)` over the `f` with `Var_π f ≠ 0`, which is `0` when there
  is no such `f`. `randomWalk` and `randomTransposition` are those of RandomWalksOnFiniteGroups
  1.1 and 4.2, and `funEntropy` and `logSobolevConstant` those of LogSobolevForMarkovChains 1.1
  and 1.2. All are copied verbatim into `Suggested.lean`.
- **Groups.** `G` is a finite group with measurable singletons; the walk driven by `μ` moves from
  `x` to `x ξ` with `ξ` of law `μ`, so its transition probability from `x` to `y` is `μ(x⁻¹ y)`.
  `U` is the uniform law `Measure.uniformOfFinset univ`. Permutations of `Fin n` multiply by
  composition, `(σ τ) i = σ (τ i)`.
- **Paths.** A path is a list of states `[x₀, …, x_m]`; its steps are the consecutive pairs, its
  length `|Γ|` is the number `m` of steps, and `N((z, w), Γ)` is the number of steps equal to
  `(z, w)`, counted with multiplicity. The list `[x]` is a path of length `0` from `x` to `x`.
- **Junk values.** Real division by zero is `0`, and an infimum of an empty set of reals is `0`.
  So `γ` is `0` on one state and when `π` is a point mass, and a quotient `π(x)/π'(x)` is `0`
  where `π'(x) = 0`. Each statement either holds in these cases or carries the hypothesis that
  excludes them.

## Layer 1: comparison of Dirichlet forms by paths

### 1.1 Paths, flows and edge loads

Define:

- `IsChainPath κ π x y l`: the list `l` starts at `x`, ends at `y`, and each step `(u, v)` of `l`
  is an edge of `(κ, π)` (`List.IsChain` of the relation `Q(u, v) > 0`);
- `IsPathFlow κ π κ' π' ν`, for `ν : S → S → List S →₀ ℝ`: for every edge `(x, y)` of `(κ', π')`,
  every list in the support of `ν x y` is a path of `(κ, π)` from `x` to `y` with nonnegative
  weight, and the weights of `ν x y` sum to `1`;
- `edgeLoad κ' π' ν z w`, the load of the directed edge `(z, w)`:
  `Σ_{x,y} Q'(x, y) Σ_Γ ν x y Γ · N((z, w), Γ) · |Γ|`.

A single path `Γ_xy` per edge is the flow with `ν x y` the point mass at `Γ_xy`; then the largest
quotient `edgeLoad κ' π' ν z w / Q(z, w)` over the edges of `(κ, π)` is, when no path steps
twice along the same edge, the congestion ratio of Levin and Peres (LPW, (13.13), p. 188), and for
random paths their (13.16), p. 190. Those count a path once at each edge it uses; here each
passage through an edge is counted, as in the congestion of Dyer, Goldberg, Jerrum and Martin
(DGJM, Section 2.1, p. 92). Prove that for a flow `ν` the load is nonnegative and vanishes at
every pair that is not an edge of `(κ, π)`, since no admissible path steps there.

**Checks.**

- The path `[a, b, a, b]` passes three times along an edge, twice from `a` to `b`: its term in the
  load of `(a, b)` is `ν · 2 · 3 = 6ν`. Counting the edge once per path, as "`e ∈ Γ`" reads for
  paths without repeated edges, would give `3ν`.
- A transition `(x, x)` of `κ'` is routed through `[x]`, which adds nothing to any load.
- A list that steps along a pair with `Q(u, v) = 0` is not a path, even if `κ(u, v) > 0`, since
  then `π(u) = 0`.

*Needs:* Mathlib `List.IsChain`, `Finsupp`, `Finsupp.sum`. (Proved here.)

### 1.2 Comparison of Dirichlet forms

Prove `dirichletForm_le_of_edgeLoad_le`: for kernels `κ`, `κ'` and measures `π`, `π'` on `S`,
if `ν` is a flow (`IsPathFlow κ π κ' π' ν`) and `edgeLoad κ' π' ν z w ≤ B · Q(z, w)` for every
edge `(z, w)` of `(κ, π)`, then `E'(f) ≤ B E(f)` for every `f : S → ℝ`. No reversibility,
stationarity or normalization is assumed. Route: for an admissible path `Γ` from `x` to `y`,
`f(y) − f(x)` is the sum of the increments `f(w) − f(z)` over its steps, so by the Cauchy–Schwarz
inequality `(f(y) − f(x))² ≤ |Γ| Σ_{steps} (f(w) − f(z))²`; average over `ν x y` (weights
nonnegative with sum `1`), multiply by `Q'(x, y)`, sum, and exchange the sums, so that each step
`(z, w)` collects `edgeLoad κ' π' ν z w (f(w) − f(z))² ≤ B Q(z, w) (f(w) − f(z))²`. (LPW,
Theorem 13.20, (13.14), p. 188, for one path per pair and reversible chains, with the proof on
p. 189; the random-path form is LPW, Corollary 13.23, p. 190, whose proof the source leaves as
Exercise 13.3. DGJM, Theorem 1 and the remark after it, p. 93, state the form with multiplicities
and note that reversibility is not used; Aldous and Fill, Chapter 8, Theorem 8.1, with proof, for
one path per pair. The notes of LPW, p. 199, credit this form of the comparison theorem to
Diaconis and Saloff-Coste, 1993.)

**Checks.**

- Two states `a`, `b`: `κ(a, b) = 3/10`, `κ(b, a) = 1/10`, `π = (1/4, 3/4)`, so
  `Q(a, b) = Q(b, a) = 3/40`; `κ'` redraws from the uniform law `π'`, so `Q'(a, b) = 1/4`. One-step
  paths give the loads `1/4` on both edges and `B = 10/3`; `E(f) = (3/40)(f a − f b)²` and
  `E'(f) = (1/4)(f a − f b)²`, so the comparison is an equality.
- Direct paths: if `Q'(x, y) ≤ β Q(x, y)` for all `x ≠ y`, routing each such edge along itself
  gives `B = β`. For the lazy chain `(I + P)/2` and `κ`, with the same `π`, this gives
  `E_lazy ≤ ½ E` and `E ≤ 2 E_lazy`, both equalities.
- `B` may be taken negative only when no edge of `κ'` joins distinct states: then `E' = 0`, and
  the hypothesis at an edge of `κ` forces `B ≥ 0` unless `κ` has none, in which case `E = 0`.

*Needs:* 1.1; MarkovChainMixing 2.4 (`dirichletForm`); Mathlib
`Finset.sum_mul_sq_le_sq_mul_sq` (Cauchy–Schwarz for finite sums).

### 1.3 Consequence for spectral gaps

Let `κ` be Markov with a stationary probability measure `π`, let `κ'` be Markov and `π'` a
probability measure with `π'(x) > 0` for all `x`. For a flow as in 1.2 with constant `B`, 1.2
gives `E' ≤ B E`, and the comparison of spectral gaps from a comparison of Dirichlet forms
(MarkovChainMixing 2.4, its last item), whose hypotheses are exactly these, then gives
`γ' ≤ max_x (π(x)/π'(x)) · B · γ`. This one-step combination is not a separate target; 2.1
uses it. (LPW, Theorem 13.20, (13.15), p. 188, and Corollary 13.23, (13.17), p. 190; Aldous and
Fill, Chapter 8, Corollary 8.2.)

**Checks.**

- The two-state pair of 1.2: `γ = 3/10 + 1/10 = 2/5`, `γ' = 1`, `max_x π(x)/π'(x) = 3/2`, and the
  bound reads `1 ≤ (3/2)(10/3)(2/5) = 2`.
- Stationarity is needed: on two states `u`, `v` let `π` be the point mass at `u` and `κ` send
  both states to `v`, so that `(u, v)` is the only edge of `(κ, π)`; let `π'` be uniform, `κ'(u, ·)`
  uniform and `κ'(v, ·)` the point mass at `v`. The paths `[u, v]`, `[u]` and `[v]` form a flow
  with `B = Q'(u, v)/Q(u, v) = 1/4`, and `E(f) = ½ (f u − f v)²`, `E'(f) = ⅛ (f u − f v)²`;
  but `γ' = 1/2` while `γ = 0`.

*Needs:* 1.2; MarkovChainMixing 2.4 (`spectralGap` and the comparison of spectral gaps).

### 1.4 Canonical paths

Prove `inv_le_spectralGap_of_edgeLoad_le`: let `π` be a probability measure that charges two
distinct states, and `ν` a flow of paths of `(κ, π)` for the chain `Kernel.const S π`, which
redraws from `π` and has weights `Q'(x, y) = π(x) π(y)`. If
`edgeLoad (Kernel.const S π) π ν z w ≤ B · Q(z, w)` for every edge `(z, w)` of `(κ, π)`, then
`1/B ≤ γ`. Route: the Dirichlet form of the redrawing chain is
`½ Σ_{x,y} π(x) π(y) (f(x) − f(y))² = Var_π f`, so 1.2 gives `Var_π f ≤ B E(f)` for every `f`;
the two charged states give an `f` with `Var_π f ≠ 0`, which forces `B > 0`, and the infimum
defining `γ` is at least `1/B`. `κ` need not be Markov, reversible or irreducible. (LPW,
Corollary 13.21, p. 188, for one path per pair and a reversible irreducible chain, with its
proof on p. 189; Aldous and Fill, Chapter 8, Remark (a) after Theorem 8.1. The notes of LPW,
p. 199, credit the method to Jerrum and Sinclair, 1989, developed further by Diaconis and Stroock,
1991.)

**Checks.**

- The lazy walk on the `n`-cycle (`P(x, x) = 1/2`, `P(x, x ± 1) = 1/4`, uniform `π`) with
  shortest paths, the two arcs taking weight `1/2` each when `n` is even and `y = x + n/2`:
  `B = 4/3, 3, 4, 19/3, 8, 11` for `n = 3, …, 8`. For `n = 3` the bound `γ ≥ 3/4` is an equality;
  for `n = 6` it reads `3/19 ≤ 1/4 = (1 − cos(2π/6))/2`.
- Two charged states are needed: if `π` is a point mass at `u`, the only pair is `(u, u)`, routed
  through `[u]` with no load, so every `B > 0` satisfies the hypothesis while `γ` is the junk
  value `0`.
- A chain that does not connect two charged states admits no flow, and the statement is
  vacuous there, as it must be: the gap of the identity kernel on two states is `0`.

*Needs:* 1.2; MarkovChainMixing 2.4 (`spectralGap`); Mathlib `Kernel.const`,
`ProbabilityTheory.variance`.

### Examples

The two-state chain against the chain that redraws from the uniform law; the lazy cycle with
geodesic paths; the lazy chain against the chain itself.

### Dependencies

Layer 1 uses MarkovChainMixing 2.4 and Mathlib's lists, finitely supported functions, constant
kernels and variance.

## Layer 2: random walks on finite groups

### 2.1 Comparison of walks on a group

Let `μ`, `μ'` be probability measures on `G`, and let `ν : G → List G →₀ ℝ` give every `a` with
`μ' {a} ≠ 0` a finitely supported probability weight `ν a` on words: every word `w` in its
support has nonnegative weight, product `a`, and letters `s` with `μ {s} ≠ 0`, and the weights
sum to `1`. One word per element is the case where `ν a` is a point mass. Prove
`spectralGap_randomWalk_le`: if `Σ_a μ'(a) Σ_w ν a w · N(s, w) |w| ≤ B μ(s)` for every `s` with
`μ {s} ≠ 0`, where `N(s, w)` is the number of occurrences of `s` in `w` and `|w|` its length,
then `γ' ≤ B γ` for `randomWalk μ'` and `randomWalk μ` under `U`. Route: `U` is stationary for
every walk and positive (RandomWalksOnFiniteGroups 1.1); the edge `(x, x a)` of the walk of `μ'`
is routed, with weight `ν a w`, along `x, x s₁, x s₁ s₂, …, x a` for `w = [s₁, …, s_k]`, whose
steps `(g, g s)` are edges because `κ(g, g s) = μ(s)`; for a fixed step `(g, g s)` and a fixed
word `w`, each occurrence of `s` in `w` is passed from exactly one start `x`, so the load of
`(g, g s)` is `|G|⁻¹ Σ_a μ'(a) Σ_w ν a w · N(s, w) |w|` and `Q(g, g s) = |G|⁻¹ μ(s)`; 1.2, and
the comparison of spectral gaps of MarkovChainMixing 2.4 with `π = π' = U` (as in 1.3), conclude.
Neither measure need be symmetric, nor its support generate `G`. (LPW, Corollary 13.24, (13.18)
and (13.19), p. 190, for irreducible reversible walks and one word per element, with the proof
on pp. 190–191; the weighted form is LPW, Remark 13.25, (13.21), p. 191, whose proof the source
leaves as Exercise 13.4. DGJM, p. 90, attributes the comparison inequalities to Diaconis and
Saloff-Coste, 1993.)

**Checks.**

- The cyclic group of order `4` (in Lean `Multiplicative (ZMod 4)`), written additively: `μ` the
  lazy walk (`1/2` at `0`, `1/4` at `±1`), `μ'` uniform, with the single words `[]`, `[1]`,
  `[1, 1]`, `[3]` for `0, 1, 2, 3`: the sums are `5/4` at `s = 1` and `1/4` at `s = 3`, so
  `B = 5`; `γ' = 1` and `γ = 1/2`, and `1 ≤ 5/2`.
- Splitting the word of `2` evenly between `[1, 1]` and `[3, 3]` gives the sums `3/4` at both
  `s = 1` and `s = 3`, so `B = 3`: weights on several words lower the constant.
- The identity, when charged by `μ'`, takes the empty word and contributes nothing.
- On the trivial group both gaps are the junk value `0`.

*Needs:* 1.2; MarkovChainMixing 2.4 (the comparison of spectral gaps); RandomWalksOnFiniteGroups
1.1 (`randomWalk`, stationarity of `U`); Mathlib `List.prod`, `List.count`, `Finsupp`,
`Measure.uniformOfFinset`.

### 2.2 Random adjacent transpositions

Define `adjacentTransposition n`, the measure on permutations of `Fin n` with mass `1/2` at the
identity and `1/(2(n − 1))` at each of the `n − 1` transpositions `(i i+1)`: the lazy random
adjacent transposition shuffle (LPW, §16.1, p. 232). For `n ≤ 1` there is no transposition and
the measure is half the point mass at the identity, which the statement below does not mind,
since the state space is then a single point. Prove `spectralGap_randomTransposition_le`: for
every `n`,

    γ(randomWalk (randomTransposition n), U) ≤ 4 n² · γ(randomWalk (adjacentTransposition n), U).

Route: 2.1 with the single words `(a b) = (a a+1) ⋯ (b−2 b−1) (b−1 b) (b−2 b−1) ⋯ (a a+1)` for
`a < b` (product of `2(b − a) − 1` adjacent transpositions) and the empty word for the identity. The
transposition `(i i+1)` occurs in the word of `(a b)` only if `a ≤ i < b`, at most twice, in
`(i + 1)(n − 1 − i)` words of length at most `2n − 3`, so
`Σ_a μ'(a) N(s, a) |a| ≤ (2/n²) · 2 (i + 1)(n − 1 − i)(2n − 3) ≤ (2/n²) n³`, and dividing by
`μ(s) = 1/(2(n − 1))` gives `B ≤ 4 (n − 1) n ≤ 4 n²`. For `n ≤ 1` the group is trivial and both
gaps are `0`. (LPW, Section 16.1.1, (16.2) and (16.3), p. 233.)

**Checks.**

- The exact congestion of these words is `B = 1, 56/9, 15, 704/25` for `n = 2, 3, 4, 5`, below
  `4 n² = 16, 36, 64, 100`.
- `n = 3`: `γ_rt = 2/3` and `γ_adj = 1/4`, and `2/3 ≤ (56/9)(1/4) = 14/9 ≤ 9`. `n = 4`:
  `γ_rt = 1/2` and `γ_adj = (2 − √2)/6 ≈ 0.0976`.
- The measure is lazy: for `n = 2` it is uniform on `S_2`, so `γ_adj = 1`; without the mass `1/2`
  at the identity the walk would exchange the two cards at every step and have `γ = 2`.

*Needs:* 2.1; RandomWalksOnFiniteGroups 4.2 (`randomTransposition`, the two measurable-space
instances on permutations); Mathlib `Equiv.swap`, `Measure.dirac`, `Measure.uniformOfFinset`.

### Examples

With the eigenvalue `1 − 2/n` of the random transposition walk at the shape `(n − 1, 1)`, the
largest other than `1` (RandomWalksOnFiniteGroups 4.2, route), and MarkovChainMixing 2.4,
`γ_rt = 2/n`, so 2.2 gives `γ_adj ≥ 1/(2 n³)` for `n ≥ 2`: `1/54` against `1/4` for `n = 3`.

### Dependencies

Layer 2 uses 1.2, MarkovChainMixing 2.4 (the comparison of spectral gaps), RandomWalksOnFiniteGroups
1.1 and 4.2, and Mathlib's lists, finitely supported functions, permutations and uniform measures.

## Layer 3: eigenvalues one by one and logarithmic Sobolev constants

### 3.1 Comparison of eigenvalues

Define `transitionEigenvalues κ`, the roots in `ℝ` of the characteristic polynomial of
`transitionMatrix κ`, with multiplicity, sorted in decreasing order (`Multiset.sort` with
`≥`). Prove `one_sub_transitionEigenvalues_le`: let `κ`, `κ'` be Markov kernels reversible with
respect to probability measures `π`, `π'` with `π(x) > 0` and `π'(x) > 0` for all `x`, and let
`E'(f) ≤ a E(f)` for every `f`. Then both lists have `|S|` entries, and for every `k < |S|`, with
`λ_k` and `λ'_k` the `k`-th entries (from `0`),

    1 − λ'_k ≤ max_x (π(x)/π'(x)) · a · (1 − λ_k).

Route: by MarkovChainMixing 2.1 the matrix `A = D^(1/2) P D^(−1/2)`, `D` the diagonal of `π`, is
symmetric, and it is conjugate to `P`, so they have the same characteristic polynomial (Mathlib
`Matrix.charpoly_units_conj`), whose sorted real roots are the eigenvalues of `A` in decreasing
order (Mathlib `Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`); this gives the
lengths. With `g = D^(1/2) f`, `⟨A g, g⟩ = ‖f‖²_π − E(f)` by the identity of MarkovChainMixing
2.4, so by Tau Ceti's Courant–Fischer formula `1 − λ_k` is the least, over the subspaces `V` of
functions of dimension `k + 1`, of the largest `E(f)/‖f‖²_π` over `f ∈ V ∖ {0}`. The subspaces do
not depend on `π`, and `‖f‖²_π ≤ max_x (π(x)/π'(x)) ‖f‖²_π'`; for `a > 0` this compares the
quotients pointwise. For `a ≤ 0` the hypothesis forces `E' = 0`, so `κ'` is the identity and
every `λ'_k = 1`; if `a < 0` it forces `E = 0` as well, so every `λ_k = 1` and both sides vanish.
At `k = 1` this is the comparison of gaps of MarkovChainMixing 2.4 for these chains. (Aldous and
Fill, Chapter 8, (8.18), (8.22) and Corollary 8.4, stated for the eigenvalues of the
continuous-time chains, which are the numbers `1 − λ_k`, with `a` the constant of their
Theorem 8.1; there the min–max formula (8.22) is derived in a sketch only, and the route above
proves the statement from the Courant–Fischer formula. DGJM, p. 90, attributes the eigenvalue
bounds to Diaconis and Saloff-Coste, 1993.)

**Checks.**

- The two-state chain of 1.2 has `transitionEigenvalues = [1, 3/5]`, the redrawing chain
  `[1, 0]`, and `a = 10/3`: at `k = 0` both sides are `0`, at `k = 1` the statement reads
  `1 ≤ (3/2)(10/3)(2/5) = 2`.
- The exchange chain on two states has `transitionEigenvalues = [1, −1]`.
- Positivity is needed: on four states with `π` the point mass at the first, the kernel that
  fixes the first state and permutes the other three cyclically is reversible for `π`, and its
  characteristic polynomial `(x − 1)(x³ − 1)` has two non-real roots, so the list has `2 < 4`
  entries.
- `κ` must be Markov: for the zero kernel, `κ'` the identity, any positive `π`, `π'` and
  `a = −1`, the hypothesis holds (`E = E' = 0`) and at `k = 0` the statement reads
  `0 ≤ −max_x (π(x)/π'(x))`.

*Needs:* MarkovChainMixing 2.1 (`transitionMatrix`, the symmetric matrix `A`) and 2.4 (the
identity `E(f) = ⟨f, f⟩_π − ⟨f, P f⟩_π`); Tau Ceti
`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`; Mathlib `Matrix.charpoly`,
`Matrix.charpoly_units_conj`, `Matrix.IsHermitian.eigenvalues₀`,
`Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`, `Polynomial.roots`, `Multiset.sort`.

### 3.2 Comparison of logarithmic Sobolev constants

Let `π`, `π'` be probability measures with `π'(x) > 0` for all `x`, and `c = max_x π(x)/π'(x)`.
Prove first that `Ent_π(g) ≤ c Ent_π'(g)` for every `g ≥ 0`, with `Ent` the `funEntropy` of
LogSobolevForMarkovChains 1.1: for `t > 0` the quantity `Σ_x π(x) (g log g − g log t − g + t)(x)`
has a nonnegative summand and, when `m = Σ_x π(x) g(x) > 0`, is least at `t = m`, where it equals
`Ent_π(g)`; when `m = 0`, `g` vanishes where `π` charges, so `Ent_π(g) = 0`, while `Ent_π'(g) ≥ 0`
by Jensen's inequality. Compare the two sums at `t = Σ_x π'(x) g(x)`, which is positive unless
`g = 0`, since `π'` is positive. (Aldous and Fill, Chapter 8, Lemma 8.38, with proof, for
`g = f²`.)

Then prove `logSobolevConstant_le_of_dirichletForm_le`: if moreover `π` is stationary for a
kernel `κ` and `E'(f) ≤ a E(f)` for every `f`, then `α' ≤ c · a · α`, `α` being the
`logSobolevConstant` of LogSobolevForMarkovChains 1.2. Route: when `π` charges two states, every
`f` with `Ent_π(f²) ≠ 0` has `Ent_π'(f²) ≥ Ent_π(f²)/c > 0`, so it enters the infimum defining
`α'`, and `E'(f)/Ent_π'(f²) ≤ c a E(f)/Ent_π(f²)` for `a ≥ 0`; for `a < 0` both forms vanish.
When `π` is a point mass at `u`, `α` is the junk value `0`; stationarity makes `κ(u, ·)` the point
mass at `u`, so `E = 0`, hence `E' ≤ 0` and `α' = 0`. (Aldous and Fill, Chapter 8, Corollary
8.39, for reversible chains and the log-Sobolev time `τ_l`, which is `1/(2α)`.)

**Checks.**

- The two-state pair of 1.2: by the two-point formula of LogSobolevForMarkovChains 2.1,
  `α = (2/5) c(1/4) = 1/(5 log 3) ≈ 0.182` and `α' = c(1/2) = 1/2`, and the bound reads
  `1/2 ≤ (3/2)(10/3)/(5 log 3) = 1/log 3 ≈ 0.910`.
- The entropy comparison: for `g` the indicator of `a`, `π = (1/4, 3/4)` and `π'` uniform, both
  entropies are `(log 2)/2 ≈ 0.347`, and `c = 3/2`.
- Stationarity is needed, with the pair of `κ`, `π` of the second Check of 1.3 and `κ'` the
  chain that redraws from the uniform law `π'`: `E(f) = ½ (f u − f v)²`,
  `E'(f) = ¼ (f u − f v)²`, so `a = 1/2`; `c = 2`, `α = 0` and `α' = c(1/2) = 1/2`, and the
  bound would read `1/2 ≤ 0`.
- Positivity of `π'` is needed: on `{x, y, z}` let `κ` redraw uniformly from `{x, y}` at `x` and
  at `y` and fix `z`, let `π` be uniform (it is stationary), `κ' = κ` and `π' = (1/2, 1/2, 0)`.
  Then `E' = (3/2) E`, `c = 2/3` (the quotient at `z` being the junk value `0`), `α = 0`, since
  the indicator of `z` has `E = 0` and positive entropy, and `α' = c(1/2) = 1/2`: the bound
  would read `1/2 ≤ 0`. The same pair has `γ = 0` and `γ' = 1`.

*Needs:* LogSobolevForMarkovChains 1.1 (`funEntropy`) and 1.2 (`logSobolevConstant`);
MarkovChainMixing 2.4 (`dirichletForm`); Mathlib `Real.log`, `Kernel.Invariant`.

### Examples

The two-state chain against the redrawing chain, for eigenvalues and for logarithmic Sobolev
constants; the lazy chain `(I + P)/2`, whose `E` is `½ E(P)`, so that `1 − λ_k` halves.

### Dependencies

Layer 3 uses MarkovChainMixing 2.1 and 2.4, LogSobolevForMarkovChains 1.1 and 1.2, Tau Ceti's
Courant–Fischer formula and Mathlib's characteristic polynomials and spectral theorem.

## Downstream consumers

Comparison with a chain whose spectrum is known is the standard way to bound the spectral gap,
and through MarkovChainMixing 2.3 the mixing time, of Glauber dynamics and of card shuffles; 2.2
is the model case. The eigenvalue comparison of 3.1 feeds bounds that use the whole spectrum,
such as the bound of MarkovChainMixing 2.3 by the return probability.

## Scope and ownership

This roadmap owns: paths, flows and edge loads for a pair of chains; the comparison of Dirichlet
forms by paths and its consequence for spectral gaps; the canonical-path bound; the comparison of
random walks on a finite group by words and the comparison of adjacent with random
transpositions; the comparison of the eigenvalues one by one; the comparison of entropies and of
logarithmic Sobolev constants between two chains.

Left to other roadmaps and to the libraries:

- MarkovChainMixing owns the transition matrix and the symmetric matrix `A` (2.1), the Dirichlet
  form, the spectral gap, the Poincaré inequality, the characterization of `1 − γ` as an
  eigenvalue and the comparison of spectral gaps from a comparison of Dirichlet forms (2.4), the
  bottleneck ratio and Cheeger's inequality (Layer 3), and the bounds relating the gap and the
  mixing time (2.3). Its definitions are copied verbatim and none of its theorems is restated:
  1.3, 2.1 and 3.1 above consume its 2.4. That roadmap leaves comparison by canonical paths and
  congestion outside its scope.
- RandomWalksOnFiniteGroups owns random walks on finite groups, their Fourier analysis, the
  random transposition measure and its walk (Layers 1 and 4); its definitions are copied, and it
  leaves the comparison of walks outside its scope.
- LogSobolevForMarkovChains owns the entropy, the logarithmic Sobolev constant and its relation
  to the spectral gap; its definitions are copied, and it leaves the comparison of logarithmic
  Sobolev constants between chains outside its scope.
- MCMCAsymptoticVariance, Layer 4, orders asymptotic variances of ergodic averages by Dirichlet
  forms (Peskun's ordering); that is a comparison of a different quantity, and nothing of it is
  used here.
- SpectralGraphBounds bounds eigenvalues of adjacency matrices of graphs, in particular through
  the diameter (its Layer 5); ElectricalNetworksAndRandomWalks treats walks on networks with
  Rayleigh monotonicity and the Dirichlet and Thomson principles. Neither is used here.
- Mathlib supplies kernels, stationarity, reversibility, characteristic polynomials and the
  spectral theorem for Hermitian matrices; Tau Ceti supplies the kernel–matrix dictionary and the
  Courant–Fischer formula. Neither library has Dirichlet forms of chains, paths of a chain or
  congestion.

Not treated here: the comparison of the smallest eigenvalue through paths of odd length,
comparison of mixing times, chains on different state spaces and induced chains, the diameter
bound for transitive graphs, Wilson's lower bound, Nash inequalities, and chains on infinite
state spaces.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.Kernel.const` (`Mathlib/Probability/Kernel/Basic.lean`), the kernel that
  ignores its argument; `Kernel.Invariant` and `Kernel.IsReversible`
  (`Mathlib/Probability/Kernel/Invariance.lean`); `Kernel.ofFunOfCountable`
  (`Mathlib/Probability/Kernel/Basic.lean`), used by the copied `randomWalk`.
- `ProbabilityTheory.variance` (`Mathlib/Probability/Moments/Variance.lean`), used by the copied
  `spectralGap`; `MeasureTheory.Measure.uniformOfFinset`
  (`Mathlib/Probability/Distributions/Uniform.lean`), which gives mass `1/|s|` to each point of
  `s` and is the zero measure for `s = ∅`; `Measure.dirac`; `Equiv.swap`.
- `List.IsChain` (`Mathlib/Data/List/Chain.lean`), `List.count`, `List.prod`, `List.zip`;
  `Finsupp` and `Finsupp.sum`; `Finset.sum_mul_sq_le_sq_mul_sq`
  (`Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`), the Cauchy–Schwarz inequality for
  finite sums.
- `Matrix.charpoly`, `Matrix.charpoly_units_conj` (conjugate matrices have the same
  characteristic polynomial), `Polynomial.roots`, `Multiset.sort`;
  `Matrix.IsHermitian.eigenvalues₀` and `Matrix.IsHermitian.sort_roots_charpoly_eq_eigenvalues₀`
  (for a Hermitian matrix the roots of the characteristic polynomial sorted in decreasing order
  are its eigenvalues `eigenvalues₀`) (`Mathlib/Analysis/Matrix/Spectrum.lean`).

### From Tau Ceti

- `ProbabilityTheory.Kernel.toMatrix` (`TauCeti/Probability/Kernel/Matrix.lean`), used by the
  copied `transitionMatrix`.
- `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`): on a finite-dimensional inner
  product space the `k`-th largest eigenvalue of a symmetric map is the supremum over subspaces
  of dimension `k + 1` of the infimum of the Rayleigh quotient over their unit vectors.

### From TauCetiRoadmap.MarkovChainMixing

- 2.1: `transitionMatrix`, copied verbatim; the matrix `A = D^(1/2) P D^(−1/2)` of a reversible
  chain is symmetric.
- 2.4: `dirichletForm` and `spectralGap`, copied verbatim; the identity
  `E(f) = ⟨f, f⟩_π − ⟨f, P f⟩_π` for a stationary `π`;
  the comparison of spectral gaps (its last item): for
  `κ` Markov with stationary probability `π`, `κ'` Markov and `π'` a positive probability, if
  `E' ≤ a E` then `γ' ≤ max_x (π(x)/π'(x)) · a · γ`.

### From TauCetiRoadmap.RandomWalksOnFiniteGroups

- 1.1: `randomWalk`, copied verbatim; for a probability measure `μ` it is a Markov kernel with
  stationary law `U`.
- 4.2: `randomTransposition` and the instances `instMeasurableSpacePermFin` and
  `instMeasurableSingletonClassPermFin`, copied verbatim; the eigenvalue `1 − 2/n` at the shape
  `(n − 1, 1)`, used in the Examples of Layer 2 only.

### From TauCetiRoadmap.LogSobolevForMarkovChains

- 1.1: `funEntropy`, copied verbatim. 1.2: `logSobolevConstant`, copied verbatim. 2.1: the
  two-point formula, used in a Check of 3.2 only.

## References

- [LPW] D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing
  times*, second edition, American Mathematical Society, 2017, made available by the authors.
  Chapter 13, Lemma 13.18, Theorem 13.20, Corollaries 13.21, 13.23 and 13.24, Remark 13.25,
  and the notes on pp. 199–200; Section 16.1.
- D. Aldous and J. A. Fill, *Reversible Markov chains and random walks on graphs*, Chapter 8,
  "Advanced L² techniques for bounding mixing times", draft of May 19, 1999, made available by
  the authors. Section 8.1 (Theorem 8.1, Corollaries 8.2 and 8.4) and Section 8.4.5 (Lemma 8.38,
  Corollary 8.39).
- [DGJM] M. Dyer, L. A. Goldberg, M. Jerrum and R. Martin, *Markov chain comparison*, Probability
  Surveys 3 (2006), 89–111, arXiv:math/0410331. Section 2 (Theorem 1).
- P. Diaconis and L. Saloff-Coste, *Comparison theorems for reversible Markov chains*, Annals of
  Applied Probability 3 (1993), 696–730; *Comparison techniques for random walk on finite
  groups*, Annals of Probability 21 (1993), 2131–2156. Named for attribution, as LPW's notes and
  DGJM cite them; not consulted.
- M. Jerrum and A. Sinclair, *Approximating the permanent*, SIAM Journal on Computing 18 (1989),
  1149–1178, and P. Diaconis and D. Stroock, *Geometric bounds for eigenvalues of Markov
  chains*, Annals of Applied Probability 1 (1991), 36–61, for the method of canonical paths.
  Named for attribution, as LPW's notes cite them; not consulted.
