# Roadmap: Glauber dynamics of the Ising model

**Summary.** This roadmap studies the Glauber dynamics (heat-bath dynamics) of the ferromagnetic
Ising model on a finite simple graph `G` with `n` vertices and maximum degree `Δ`. A
configuration gives each vertex a spin `±1`; the Ising law at inverse temperature `β ≥ 0` gives
`σ` a probability proportional to `exp(β Σ σ(v)σ(w))`, the sum running over the edges, with no
external field. The dynamics picks a uniform vertex and redraws its spin from the law conditioned
on all other spins. Distances are total variation distances in `[0, 1]`, `d(t)` is the largest
distance to the Ising law after `t` steps, `t_mix(ε)` the first `t` with `d(t) ≤ ε`, and the
relaxation time `t_rel` is the reciprocal of the absolute spectral gap.

The headline theorems are these.

- *Fast mixing at high temperature.* If `β ≥ 0` and `Δ tanh β < 1`, put `c = 1 − Δ tanh β`. Then
  `t_rel ≤ n/c`, `d(t) ≤ n (1 − c/n)^t` for every `t`, and
  `t_mix(ε) ≤ ⌈n (log n + log(1/ε))/c⌉` for every `ε > 0`. When every degree is even the same
  holds with `c = 1 − (Δ/2) tanh 2β` under `(Δ/2) tanh 2β < 1`. On the complete graph at
  `β = α/n` with `0 ≤ α < 1` this gives `t_mix(ε) ≤ ⌈n (log n + log(1/ε))/(1 − α)⌉`.
- *Chen's theorem.* If one step of a Markov chain on a finite metric space contracts the
  transportation distance between any two rows by a factor `θ`, every eigenvalue `λ ≠ 1` of its
  transition matrix has `|λ| ≤ θ`.
- *The cycle and the tree.* On the `n`-cycle, `n ≥ 3`, the relaxation time is exactly
  `n/(1 − tanh 2β)` for every `β ≥ 0`. On the rooted `b`-ary tree of depth `k` with `n` vertices,
  if `β ≥ 0` and `2 tanh β √b < 1` then
  `t_mix(ε) ≤ ⌈(n/(1 − 2 tanh β √b)) ((3/2) log n + log(1/ε))⌉`.
- *Exact sampling.* The heat-bath update driven by a uniform vertex and a uniform number in
  `[0, 1]` is monotone for `β ≥ 0`, and the coalescence time `T` of coupling from the past
  satisfies `P(T > t) ≤ 2n² (1 − c/n)^t`.

The roadmap is a bridge. MarkovChainMixing supplies the Glauber dynamics of an arbitrary law with
its reversibility, mixing times, spectral gaps, path coupling and the comparison of Dirichlet
forms; SimulatedAnnealing supplies Gibbs laws, QuantumOptimization the Ising energy, and
CouplingFromThePast the theorem on monotone updates; Tau Ceti supplies transportation distances.

Layer 1 identifies the Glauber dynamics of the Ising law and its monotone update. Layer 2 proves
Chen's theorem and the one-step coupling bound. Layer 3 proves fast mixing at high temperature on
any graph, on the complete graph, and for coupling from the past. Layer 4 treats the cycle, the
tree, and the effect of removing `r` edges, which divides the spectral gap by at most
`exp(2β(Δ + 2r))`.

## Conventions

- **Graphs and configurations.** `V` is a finite type with decidable equality, `n = Fintype.card V`,
  `G : SimpleGraph V` has decidable adjacency, `Δ = G.maxDegree` and `deg v = G.degree v`. A
  configuration is `x : V → Bool`; its spin at `v` is `spin x v`, equal to `−1` when `x v` is
  true and `1` otherwise (the convention of QuantumOptimization 1.1). So the value `false` is the
  spin `+1`. The order on `V → Bool` is the coordinatewise order with `false < true`: a larger
  configuration has more spins `−1`, the least one is all `+1` and the greatest all `−1`.
- **Measurability.** `V → Bool` carries any σ-algebra with measurable singletons
  (`[MeasurableSpace (V → Bool)] [MeasurableSingletonClass (V → Bool)]`), as in MarkovChainMixing
  6.1; since the type is finite every set is then measurable. Where a uniform vertex is drawn, `V`
  carries such a σ-algebra too.
- **The Ising law.** `isingGibbs G β` is the Gibbs law `gibbs U β` of SimulatedAnnealing 3.1 for
  the energy `U = ising (−½ A) 0` of QuantumOptimization 1.1, where `A = G.adjMatrix ℝ`. The
  energy `ising` sums `J i j · spin x i · spin x j` over ORDERED pairs, so with `J = −½ A` it is
  `U(σ) = −Σ_{{v,w} ∈ E} σ(v)σ(w)`, the energy of (LPW, Section 3.3.5, (3.8)), and
  `isingGibbs G β (σ) ∝ exp(β Σ_{{v,w} ∈ E} σ(v)σ(w))`. The coupling matrix `−A` would count each
  edge twice and give the law at `2β`. There is no external field.
- **Temperature.** `β` is real in the definitions and in 1.2; the theorems about mixing assume
  `β ≥ 0`, the ferromagnetic case, as in (LPW, Section 3.3.5), where `β ≥ 0` is standing. Checks
  below show that the monotonicity of 1.3, the coupling bound of 2.2 and the theorems of Layers 3
  and 4 fail for some `β < 0`.
- **Local field.** `neighbourSum G x v = Σ_{w ∼ v} spin x w` is the quantity `S(σ, v)` of the
  source, and `p(x, v) = (1 + tanh(β S(x, v)))/2`.
- **Chains.** The Glauber dynamics of the Ising law is `glauber (isingGibbs G β)`, the kernel of
  MarkovChainMixing 6.1. Distances, mixing times and gaps are those of MarkovChainMixing:
  `tvToStationary κ π t = max_x tvDist ((κ ^ t) x) π / 2` (1.2), `mixingTime κ π ε ∈ ℕ∞` (1.3),
  `transitionMatrix κ` (2.1), `absSpectralGap κ = 1 − λ⋆` with `λ⋆` the largest modulus of a
  complex eigenvalue other than `1` (2.2), and `spectralGap κ π`, the infimum of the Dirichlet
  form `dirichletForm κ π f` over `Var_π f` (2.4). The relaxation time of the source is
  `t_rel = 1/γ⋆` (LPW, Section 12.2, p. 163), and a bound `t_rel ≤ n/c` is stated as
  `(absSpectralGap κ)⁻¹ ≤ n/c`.
- **Transportation distance.** On a finite metric space `W₁(μ, ν)` is Tau Ceti's
  `TauCeti.wassersteinEDist 1 μ ν`, the infimum over couplings (`TauCeti.IsCoupling`) of the
  expected distance. Statements about the Ising chain itself avoid putting a metric on
  `V → Bool`: they give a coupling and an expected Hamming distance `hammingDist`. Routes that
  apply path coupling equip `V → Bool` with a metric locally, as said where it happens.
- **Copied definitions.** A roadmap's Lean file cannot import another's, so `Suggested.lean`
  repeats, byte for byte, `spin` and `ising` (QuantumOptimization 1.1), `gibbs`
  (SimulatedAnnealing 3.1), `tvToStationary`, `mixingTime`, `transitionMatrix`, `absSpectralGap`,
  `dirichletForm`, `spectralGap` and `glauber` (MarkovChainMixing 1.2, 1.3, 2.1, 2.2, 2.4, 6.1),
  and `backwardMap` and `backwardCoalescenceTime` (CouplingFromThePast 1.1 and 2.1). Those
  roadmaps own them.
- **Source.** `LPW` is the book of Levin and Peres listed under References, second edition, with
  its printed page numbers.

## Layer 1: the Ising law and its heat-bath dynamics

### 1.1 The Ising law

Define `isingGibbs G β = gibbs (ising (−½ • G.adjMatrix ℝ) 0) β` and
`neighbourSum G x v = Σ_{w ∈ G.neighborFinset v} spin x w`, with the conventions above.

- `isingGibbs G β` is a probability measure giving every configuration positive mass; the mass of
  `σ` is `exp(β Σ_{{v,w} ∈ E} σ(v)σ(w)) / Z(β)`.
- `neighbourSum G x v` does not depend on `x v`, because a simple graph has no loops, and
  `|neighbourSum G x v| ≤ deg v ≤ Δ`, with `neighbourSum G x v ≡ deg v (mod 2)`.

**Checks.**

- One edge (`n = 2`): `Z(β) = 2e^β + 2e^{−β}`, and the two spins agree with probability
  `e^β/(e^β + e^{−β})`. At `e^β = 2` this is `Z = 5` and `4/5`. With the coupling matrix `−A` in
  place of `−½ A` the partition function would be `2e^{2β} + 2e^{−2β}`, which is `17/2` at
  `e^β = 2`: the factor `½` is what makes `ising` count each edge once.
- `β = 0`: the law is uniform on the `2^n` configurations.

### 1.2 The heat-bath formula

Prove `glauber_isingGibbs_apply`: for every real `β` and every configuration `x`, the row
`glauber (isingGibbs G β) x` equals `n⁻¹ Σ_v (p(x, v) δ_{x[v ↦ +1]} + (1 − p(x, v)) δ_{x[v ↦ −1]})`
with `p(x, v) = (1 + tanh(β S(x, v)))/2`, where `x[v ↦ +1]` is `Function.update x v false` and
`x[v ↦ −1]` is `Function.update x v true` (LPW, (15.1), p. 215, and the transition matrix printed
after it).

Route: the Ising law gives every configuration positive mass, so the branch of `glauber` with a
null conditioning event never occurs. The configurations that agree with `x` off `v` are the two
updates of `x` at `v`; by 1.1 the energy of the update with spin `s` at `v` is
`−s S(x, v)` plus a quantity that does not depend on `s`. So the conditional law gives the spin
`s` the probability `e^{βsS}/(e^{βS} + e^{−βS}) = (1 + s tanh(βS))/2`.

**Checks.**

- One edge, `x` with spin `+1` at the other vertex: the probability of `+1` at `v` is
  `(1 + tanh β)/2 = e^β/(e^β + e^{−β})`, the conditional probability of agreement in 1.1.
- `β = 0`: every row is `n⁻¹ Σ_v (½ δ_{x[v ↦ +1]} + ½ δ_{x[v ↦ −1]})` whatever the graph: a
  uniform coordinate is replaced by a uniform bit, which for `V = Fin n` is the kernel
  `hypercubeWalk n` of MarkovChainMixing 5.3.
- The formula was compared exactly with `glauber` of the Ising law, computed from its definition
  as a conditional law, on one edge, the path with three vertices, the cycle on four vertices,
  the triangle, the star with three leaves, the complete graph on four vertices and the graph with
  two vertices and
  no edge, at `e^β ∈ {1, 3/2, 2, 1/2}`.

*Needs:* 1.1; MarkovChainMixing 6.1 (`glauber`); SimulatedAnnealing 3.1 (`gibbs`);
QuantumOptimization 1.1 (`spin`, `ising`); Mathlib `ProbabilityTheory.cond`, `Real.tanh_eq`.

### 1.3 The monotone grand coupling

Define the heat-bath update `isingUpdate G β x (v, u)` for a vertex `v` and `u ∈ [0, 1]`
(Mathlib's `unitInterval`): it sets the spin at `v` to `+1` if `u ≤ p(x, v)` and to `−1`
otherwise, and keeps the other spins. Prove:

- `map_isingUpdate`: if the pair `(v, u)` has the law `ρ`, the product of the uniform law on `V`
  (`Measure.uniformOfFinset univ`) and the Lebesgue measure on `[0, 1]`, then `isingUpdate G β x`
  has law `glauber (isingGibbs G β) x`, for every real `β`. So `isingUpdate G β` is a random
  mapping representation of the Glauber dynamics in the sense of CouplingFromThePast
  (Conventions there): the map is jointly measurable, since every set of configurations is
  measurable and `u ↦ isingUpdate G β x (v, u)` takes two values on two intervals.
- `monotone_isingUpdate`: for `β ≥ 0` and every `(v, u)`, `x ↦ isingUpdate G β x (v, u)` is
  monotone for the order of the Conventions (LPW, Example 22.2, pp. 305–306, and Section 25.2,
  pp. 350–351, where the update is used for coupling from the past).

Route: the first item is 1.2 and `volume {u ∈ [0, 1] | u ≤ p} = p` for `p ∈ [0, 1]`. For the
second, if `x ≤ y` then `y` has spin `−1` wherever `x` has, so `S(y, v) ≤ S(x, v)`, and
`p(y, v) ≤ p(x, v)` because `tanh` is nondecreasing and `β ≥ 0`. Hence the new spin of `y` at `v`
is `−1` whenever that of `x` is, and the other coordinates keep their order. That `tanh` is
nondecreasing follows from `tanh t = 1 − 2/(e^{2t} + 1)`.

**Checks.**

- `β ≥ 0` is needed for monotonicity: on one edge with `β < 0`, the vertex `v` and `u` with
  `p(x, v) < u ≤ p(y, v)`, where `x` is all `+1` and `y` has spin `−1` at the other vertex only,
  the update gives `x` the spin `−1` at `v` and `y` the spin `+1`, so the images are not
  comparable. Such `u` exist since `p(x, v) = (1 + tanh β)/2 < (1 − tanh β)/2 = p(y, v)`.
- `β = 0`: `p = ½` everywhere, and the update is the coupling of the hypercube walk that refreshes
  the same coordinate with the same bit (LPW, Example 13.4, p. 181).

*Needs:* 1.2; CouplingFromThePast Conventions (random mapping representations); Mathlib
`Measure.uniformOfFinset`, the measure space `unitInterval`, `Monotone`.

### Examples

- On the complete graph on two vertices at `β = log 2`, `p` is `4/5` next to a `+1` spin and
  `1/5` next to a `−1` spin.

### Dependencies

1.1 uses SimulatedAnnealing 3.1 and QuantumOptimization 1.1; 1.2 uses 1.1 and MarkovChainMixing
6.1; 1.3 uses 1.2.

## Layer 2: contraction of the transportation distance

### 2.1 Chen's theorem

Let `S` be a finite metric space (`[Fintype S] [MetricSpace S]`, measurable singletons) and `κ` a
Markov kernel on `S`. Prove `norm_le_of_wassersteinEDist_le`: if `θ ≥ 0` and
`W₁(κ x, κ y) ≤ θ · dist(x, y)` for all `x`, `y`, then every complex eigenvalue `z ≠ 1` of
`transitionMatrix κ` satisfies `|z| ≤ θ` (LPW, Theorem 13.1, p. 180, proof printed there).

The source assumes `θ < 1`; its proof does not use it, and the statement here is given without
it. Consequently `absSpectralGap κ ≥ 1 − θ`: the set of moduli in the definition of
`absSpectralGap` is finite and bounded by `θ`, and is empty exactly when `1` is the only
eigenvalue, in which case `absSpectralGap κ = 1`.

Route (the source's): for a complex function `f` on `S` let `Lip(f)` be the largest ratio
`|f x − f y| / dist(x, y)` over `x ≠ y`. For every coupling `γ` of `κ x` and `κ y`,
`|Pf(x) − Pf(y)| = |∫ (f a − f b) dγ| ≤ Lip(f) ∫ dist dγ`; taking the infimum over couplings,
`Lip(Pf) ≤ θ Lip(f)`. A complex eigenvector `φ` for `z ≠ 1` is not constant, because a constant
vector has eigenvalue `1` for a Markov matrix; so `Lip(φ) > 0` and
`|z| Lip(φ) = Lip(Pφ) ≤ θ Lip(φ)`.

**Checks.**

- The hypercube walk of MarkovChainMixing 5.3 with the Hamming metric and the coupling that
  refreshes the same coordinate with the same bit gives `θ = 1 − 1/n`, and its absolute spectral
  gap is `1/n`: the bound is attained (LPW, Example 13.4, p. 181).
- Two points at distance `d`: the kernel with both rows `(½, ½)` has `W₁ = 0` between its rows,
  so `θ = 0`, and its eigenvalues are `1` and `0`; the kernel swapping the two points has
  `W₁(δ_y, δ_x) = d`, so it needs `θ ≥ 1`, and its eigenvalue `−1` shows that `θ` cannot be
  smaller.

*Needs:* MarkovChainMixing 2.1 (`transitionMatrix`), 2.2 (`absSpectralGap`, for the consequence);
Tau Ceti `TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_le`, `TauCeti.IsCoupling`; Mathlib
`spectrum`.

### 2.2 The one-step coupling of the Ising heat bath

Let `β ≥ 0`, `x` a configuration, `v` a vertex and `y` the configuration `x` with the spin at `v`
reversed. Prove:

- `exists_isCoupling_integral_hammingDist_le`: there is a coupling `γ` of
  `glauber (isingGibbs G β) x` and `glauber (isingGibbs G β) y` with
  `∫ hammingDist dγ ≤ 1 − (1 − Δ tanh β)/n` (LPW, Theorem 15.1, proof of (i), (15.10)–(15.12),
  pp. 216–217, with Lemma 15.3, p. 216);
- `exists_isCoupling_integral_hammingDist_le_of_even`: if every vertex of `G` has even degree, the
  bound improves to `1 − (1 − (Δ/2) tanh 2β)/n` (LPW, Theorem 15.1, proof of (ii), p. 217).

Route: `γ` is the law of `(isingUpdate G β x (w, U), isingUpdate G β y (w, U))` for a uniform
vertex `w` and an independent uniform `U`, which is a coupling by 1.3. Say `x` has spin `−1` at
`v` (otherwise exchange the roles). If `w = v` both images have the same spin at `v`, since
`S(x, v) = S(y, v)`, and the distance is `0`. If `w` is neither `v` nor a neighbour of `v` the two
updates agree at `w` and the distance stays `1`. If `w ∼ v` the distance is `2` exactly when
`p(x, w) < U ≤ p(y, w)`, an event of probability `p(y, w) − p(x, w)`. With `s = S(y, w) − 1 =
S(x, w) + 1` this difference is `½ φ(s)`, where `φ(t) = tanh(β(t + 1)) − tanh(β(t − 1))`. Hence
`E[distance] ≤ (n − 1)/n + n⁻¹ Σ_{w ∼ v} ½ φ(s_w)`. Lemma 15.3: for `β ≥ 0`, `φ` is even and
nonincreasing on `[0, ∞)`, because `ψ(t) = tanh(βt)` has the even derivative
`β/cosh²(βt)`, nonincreasing on `[0, ∞)`; so `φ ≤ φ(0) = 2 tanh β`, and on odd integers
`φ ≤ φ(1) = tanh 2β`. When every degree is even, `S(x, w)` is even and `s` odd. Since
`deg v ≤ Δ` this gives the two bounds. (For `β = 0`, `φ = 0` and both bounds read `1 − 1/n`.)

**Checks.**

- `β ≥ 0` is needed. On one edge with `e^β = 1/2`, so `tanh β = −3/5`, the rows of a
  configuration and of its flip at either vertex are at total variation distance `1/2`, exactly
  computed for all four configurations; every coupling therefore has expected Hamming distance
  at least `1/2`, while the claimed bound is `1 − (1 + 3/5)/2 = 1/5`.
- Two vertices and no edge: `Δ = 0` and the bound `1/2` is the expected distance of the coupling
  of the hypercube walk.
- On one edge the first bound is attained. At `e^β = 6/5`, `tanh β = 11/61`; for a configuration
  and its flip at one vertex, the other vertex `w` has `s = 0`, so the coupling has expected
  Hamming distance exactly `(1 + tanh β)/2 = 36/61`, the bound. No coupling does better: the
  function `σ ↦ −#{u : σ(u) = −1}` is `1`-Lipschitz for the Hamming distance, and its means under
  the two rows differ by `36/61`; so the transportation distance between the rows is `36/61`.

*Needs:* 1.2, 1.3; Tau Ceti `TauCeti.IsCoupling`; Mathlib `hammingDist`, `SimpleGraph.maxDegree`,
`SimpleGraph.degree_le_maxDegree`, `Real.tanh_eq`.

### Examples

- On the cycle (`Δ = 2`, all degrees even) the first bound needs `tanh β < 1/2`, that is
  `e^{2β} < 3`, while the second, `1 − (1 − tanh 2β)/n`, is below `1` for every `β ≥ 0`.

### Dependencies

2.1 uses MarkovChainMixing 2.1 and 2.2 and Tau Ceti only. 2.2 uses Layer 1.

## Layer 3: fast mixing at high temperature

### 3.1 The Dobrushin regime of the Ising model

Let `V` be nonempty, `β ≥ 0`, and write `π = isingGibbs G β` and `κ = glauber π`. Prove:

- `glauber_isingGibbs_fastMixing`: if `Δ tanh β < 1` and `c = 1 − Δ tanh β`, then
  `(absSpectralGap κ)⁻¹ ≤ n/c`, `tvToStationary κ π t ≤ n (1 − c/n)^t` for every `t`, and
  `mixingTime κ π ε ≤ ⌈n (log n + log(1/ε))/c⌉₊` for every `ε > 0` (LPW, Theorem 15.1(i),
  (15.2)–(15.4), pp. 215–216, proof pp. 216–217);
- `glauber_isingGibbs_fastMixing_of_even`: if every vertex has even degree,
  `(Δ/2) tanh 2β < 1` and `c_e = 1 − (Δ/2) tanh 2β`, the same three bounds hold with `c_e`
  (LPW, Theorem 15.1(ii), (15.5)–(15.7), p. 216, proof p. 217).

Each is stated with the source's hypotheses. The second bound would also hold, for a trivial
reason, when `c ≤ 0` (its right side is then at least `n ≥ 1`). The first and the third need
`c > 0`: for `c ≤ 0` the right side of the first is at most `0`, and that of the third is `0` as
soon as `ε < 1/n` (division by `0` included, whose value is `0`).

Route, for the first item (the second is the same with 2.2's second bound). Equip `V → Bool` with
the Hamming metric as a local instance (Mathlib's metric on `Hamming`,
`Hamming.dist_eq_hammingDist`).
Let `E` be the pairs that differ at one vertex; a pair at Hamming distance `m ≥ 2` has a third
configuration on a geodesic (reverse one of the differing spins), so the hypothesis `hE` of
MarkovChainMixing 4.2 holds, and distinct configurations are at distance at least `1`. By 2.2 and
`TauCeti.wassersteinEDist_le`, `W₁(κ x, κ y) ≤ (1 − c/n) dist(x, y)` on `E`, where
`0 ≤ 1 − c/n < 1` because `0 < c ≤ 1 ≤ n`. MarkovChainMixing 4.2 (`wassersteinEDist_comp_le`),
applied to point masses, extends this to all pairs (`κ ∘ₘ δ_x = κ x` by
`Measure.dirac_bind`, and `W₁(δ_x, δ_y) = dist(x, y)` by
`TauCeti.wassersteinEDist_dirac_dirac`). Then:

- 2.1 gives `absSpectralGap κ ≥ c/n > 0`, hence `(absSpectralGap κ)⁻¹ ≤ n/c`;
- `π` is stationary: `κ` is a Markov kernel (`isMarkovKernel_glauber`, `V` nonempty) reversible
  for `π` (`isReversible_glauber`), so `Kernel.IsReversible.invariant` applies; the diameter of
  `V → Bool` is `n`, and `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam` gives
  `d(t) ≤ n (1 − c/n)^t`;
- `1 − c/n ≤ e^{−c/n}` (`Real.add_one_le_exp`), so `d(t) ≤ n e^{−ct/n} ≤ ε` at
  `t = ⌈n (log n + log(1/ε))/c⌉₊` (when `log n + log(1/ε) < 0`, `ε > n ≥ 1 ≥ d(0)`), and
  `TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff` concludes.

**Checks.**

- `β ≥ 0` is needed. On one edge with `e^β = 1/3`, `tanh β = −4/5`, `Δ tanh β < 1` and
  `c = 9/5`; the claimed `d(1) ≤ 2 (1 − 9/10) = 1/5` fails, since `d(1) = 9/20` exactly. The
  absolute spectral gap of this chain is `1/10` (its eigenvalues are `1, 9/10, 1/10, 0`), below
  the claimed `c/n = 9/10`.
- `Δ tanh β < 1` is needed for the first bound: if `Δ tanh β > 1` its right side `n/c` is
  negative while `(absSpectralGap κ)⁻¹ ≥ 0`.
- `β ≥ 0` is needed for the even-degree form as well: on the cycle on four vertices at
  `e^β = 1/2`, `tanh 2β = −15/17`, so `(Δ/2) tanh 2β < 1` and `c_e = 32/17`; but the staggered
  magnetization `Σ_i (−1)^i σ(i)` is an eigenfunction with eigenvalue `33/34`, so the absolute
  spectral gap is at most `1/34`, below the claimed `c_e/n = 8/17`.
- `β = 0`: `c = 1` and the second bound is `n (1 − 1/n)^t`, the same expression as the bound of
  MarkovChainMixing 5.3 on the separation distance of the hypercube walk, which is the chain here
  (1.2).
- On the path with three vertices, the triangle, the star with three leaves, the cycle and the
  complete graph on four vertices, at the values `e^β ∈ {1, 11/10, 5/4}` (where `Δ tanh β < 1`),
  the transition matrix is rational, every root of its characteristic polynomial other than the
  root `1` lies in `[−(1 − c/n), 1 − c/n]` (counted exactly with Sturm sequences), and
  `d(t) ≤ n (1 − c/n)^t` holds exactly for `t ≤ 5`. The cycle on four vertices satisfies the first
  two even-degree bounds in the same exact sense at `e^β ∈ {2, 3, 5}`, where `Δ tanh β ≥ 1`.

*Needs:* 2.1, 2.2; MarkovChainMixing 1.2 (`tvToStationary`), 1.3 (`mixingTime`,
`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`), 2.2 (`absSpectralGap`), 4.2
(`wassersteinEDist_comp_le`, `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam`),
6.1 (`glauber`, `isMarkovKernel_glauber`, `isReversible_glauber`); Tau Ceti
`TauCeti.wassersteinEDist_le`,
`TauCeti.wassersteinEDist_dirac_dirac`; Mathlib `Hamming`, `Hamming.dist_eq_hammingDist`,
`Kernel.IsReversible.invariant`, `Measure.dirac_bind`, `Real.add_one_le_exp`, `Metric.diam`.

### 3.2 The complete graph

Prove `mixingTime_glauber_isingGibbs_top_le`: on the complete graph `⊤` on a nonempty `V`, at
`β = α/n` with `0 ≤ α < 1`, `t_mix(ε) ≤ ⌈n (log n + log(1/ε))/(1 − α)⌉₊` for every `ε > 0`
(LPW, Theorem 15.4(i), (15.13), p. 218, proof there).

Route: `Δ = n − 1` and `tanh t ≤ t` for `t ≥ 0` (the derivative of `t − tanh t` is
`tanh² t ≥ 0`), so `Δ tanh β = (n − 1) tanh(α/n) ≤ α (n − 1)/n ≤ α < 1`, and 3.1 applies with
`c ≥ 1 − α > 0`. The bound of 3.1 is at most the one stated, because `⌈·⌉₊` is monotone and the
numerator `log n + log(1/ε)`, when positive, is divided by the smaller number `1 − α`.

**Checks.**

- `n = 2`: the inequality used is `tanh(α/2) ≤ α`. At `e^{α/2} = 5/4`, that is
  `α = 2 log(5/4) < 1`, it reads `9/41 ≤ 2 log(5/4)`, and `c = 32/41 ≥ 1 − α`.
- `α = 0` is the hypercube walk, with the bound `⌈n (log n + log(1/ε))⌉₊`.
- `α ≥ 0` is needed: for `n = 2` and `e^β = 1/3`, that is `α = −2 log 3`, the bound at `ε = 1/4`
  is `⌈2 log 8/(1 + 2 log 3)⌉₊ = 2`, while `d(2) = 81/200 > 1/4` exactly.

*Needs:* 3.1; Mathlib `SimpleGraph.maxDegree`.

### 3.3 Exact sampling at high temperature

Let `β ≥ 0`, `ρ` the noise law of 1.3, and `U₀, U₁, …` independent random pairs with law `ρ`
(`iIndepFun U P`, `HasLaw (U i) ρ P`). Prove
`measureReal_lt_backwardCoalescenceTime_isingUpdate_le`: the backward coalescence time `T` of
`isingUpdate G β` (CouplingFromThePast 2.1) satisfies `P(T > t) ≤ 2 n² (1 − c/n)^t` for every `t`,
with `c = 1 − Δ tanh β`. (Proved here.)

Route: if `V` is empty there is one configuration, so `T = 0` and both sides are `0`. Otherwise
`P` is a probability measure, since `P.map (U 0) = ρ` is one, and if `c ≤ 0` the right side is at
least `2n² ≥ 1`. For `c > 0`:

- by 1.3, `isingUpdate G β` is a monotone random mapping representation of `κ`, so
  CouplingFromThePast 3.2 (`measureReal_lt_backwardCoalescenceTime_le_height_mul`) gives
  `P(T > t) ≤ ℓ · d̄(t)`, where `ℓ` is the height of the greatest configuration;
- `ℓ = n`: a strict chain of configurations increases the number of spins `−1` at each step, and
  reversing the spins one at a time gives a chain of length `n`;
- `d̄(t) ≤ 2 d(t)` by the triangle inequality for `tvDist` through `π`, and
  `d(t) ≤ n (1 − c/n)^t` by 3.1.

**Checks.**

- `β ≥ 0` is needed: on one edge with `e^β = 1/3`, a single update changes one spin only, so it
  cannot make the backward composition constant and `P(T > 1) = 1`, while the bound is
  `2 · 4 · (1 − 9/10) = 4/5`.
- One vertex: `Δ = 0`, `c = 1`, the bound is `0` for `t ≥ 1`, and indeed one update sets the spin
  from `u` alone, so `T ≤ 1`.

*Needs:* 1.3, 3.1; CouplingFromThePast 1.1 (`backwardMap`), 2.1 (`backwardCoalescenceTime`), 3.2;
MarkovChainMixing 1.2 (`tvToStationary` and the distance between starting points); Mathlib
`tvDist_triangle`, `Order.height`, `iIndepFun`, `HasLaw`.

### Examples

- The cycle on `n` vertices: 3.1 gives `t_mix(ε) ≤ ⌈n (log n + log(1/ε))/(1 − tanh 2β)⌉₊` at every
  `β ≥ 0`, through its even-degree form.

### Dependencies

3.1 uses Layer 2 and MarkovChainMixing; 3.2 uses 3.1; 3.3 uses 1.3, 3.1 and CouplingFromThePast.

## Layer 4: the cycle, the tree and the removal of edges

### 4.1 The cycle

Prove `absSpectralGap_glauber_isingGibbs_cycleGraph`: for `n ≥ 3` and `β ≥ 0`, the absolute
spectral gap of the Glauber dynamics on Mathlib's `SimpleGraph.cycleGraph n` is exactly
`(1 − tanh 2β)/n`, that is, `t_rel = n/(1 − tanh 2β)` (LPW, Theorem 15.5, (15.15), p. 219, with
the eigenfunction (15.17), proof pp. 219–220). The source states it for `β > 0`; its proof covers
`β = 0` unchanged, and the statement includes it.

Route: every vertex has degree `2`, so 3.1 (even degrees) gives `absSpectralGap ≥ (1 − tanh 2β)/n`.
Conversely, by 1.2 the function `φ_i(σ) = σ(i)` satisfies
`Pφ_i(σ) = (1 − 1/n) σ(i) + n⁻¹ tanh(β (σ(i − 1) + σ(i + 1)))`; on `{−2, 0, 2}` the odd function
`tanh(β ·)` equals `(tanh 2β / 2) ·`, so the magnetization `Φ = Σ_i φ_i` satisfies
`PΦ = (1 − (1 − tanh 2β)/n) Φ`. Since `Φ ≠ 0` and `tanh 2β < 1`, this is a real eigenvalue
`λ ≠ 1` with `λ ≥ 0`, so `λ⋆ ≥ λ` and `absSpectralGap ≤ (1 − tanh 2β)/n`.

**Checks.**

- `n = 3`, `tanh β = 1/2` (that is `e^{2β} = 3`): `tanh 2β = 4/5` and the eigenvalue of `Φ` is
  `14/15`.
- The eigenvalue identity holds exactly, in rational arithmetic, for `n ∈ {3, 4, 5}` at
  `e^β ∈ {1, 2, 3}` (for example `49/51` at `n = 3`, `e^β = 2`), and in each case no other root of
  the characteristic polynomial except `1` has a larger modulus (counted exactly with Sturm
  sequences), so the absolute spectral gap is exactly `(1 − tanh 2β)/n` there.
- `β = 0`: the gap is `1/n`, that of the hypercube walk.
- `β ≥ 0` is needed: on the triangle at `e^β = 1/2`, where `tanh 2β = −15/17`, the formula gives
  `32/51`, while `σ(0) − σ(1)` is an eigenfunction with eigenvalue `83/102`, so the absolute
  spectral gap is at most `19/102`.
- `n ≥ 3` is needed: Mathlib's `cycleGraph 2` is a single edge, where the gap at `e^β = 3` is
  `1/10` while `(1 − tanh 2β)/2 = 1/82`.

*Needs:* 1.2, 2.1, 3.1; MarkovChainMixing 2.1, 2.2; Mathlib `SimpleGraph.cycleGraph`,
`SimpleGraph.cycleGraph_neighborSet`, `Real.tanh_lt_one`.

### 4.2 The tree

Define `baryTree b k`, the complete rooted `b`-ary tree of depth `k` on the vertices
`0, …, N − 1` with `N = Σ_{d ≤ k} b^d`, numbered level by level: the parent of `j > 0` is
`(j − 1)/b` (integer division), and the children of `i` are `b i + 1, …, b i + b`. The graph is
`SimpleGraph.fromRel` of the parent relation. The depth `|j|` of a vertex is the number of
parent steps to the root `0`.

Prove `mixingTime_glauber_isingGibbs_baryTree_le`: for `β ≥ 0` with `2 tanh β √b < 1` and every
`ε > 0`, the Glauber dynamics on `baryTree b k` satisfies
`t_mix(ε) ≤ ⌈(N/(1 − 2 tanh β √b)) ((3/2) log N + log(1/ε))⌉₊` (LPW, Theorem 15.6, pp. 220–221,
proof p. 221). The source prints the bound without the integer part; with it the statement is
weaker and follows from the proof, which runs through the mixing-time bound of path coupling.

Route (the source's for `b ≥ 2`, where `0 < α < 1`; for `b = 1` the same argument with `α = 1`
and the Hamming distance): put `α = 1/√b ≤ 1` and give the vertex `v` the weight
`α^{|v| − k}`. Since `|v| ≤ k` every weight is at least `1`, and the weights are at most
`α^{−k} = b^{k/2}`. Let `ρ(σ, τ)` be the sum of the weights of the vertices where `σ` and `τ`
differ: a metric (a local instance on configurations) with distinct configurations at distance at
least `1`, for which the pairs differing at one vertex satisfy the hypothesis `hE` of
MarkovChainMixing 4.2 (reverse one differing spin), and with diameter
`Σ_v α^{|v| − k} ≤ N b^{k/2} ≤ N^{3/2}` since `b^k ≤ N`. For `σ`, `τ` differing at `v`, the
coupling of 2.2 gives
`E ρ(X, Y) ≤ ρ(σ, τ) (1 − 1/N + (α^{−1} + bα) tanh β / N)`: a failed update at a child of `v`
adds `α ρ(σ, τ)`, at the parent `α^{−1} ρ(σ, τ)`, each failure having probability at most
`tanh β` (the bound `½ φ ≤ tanh β` of 2.2), and choosing `v` itself gives `0` (LPW, (15.19)). With
`α = 1/√b`, `α^{−1} + bα = 2√b`, so the contraction factor is `1 − c_θ/N` with
`c_θ = 1 − 2 tanh β √b > 0`. Then
`TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam` gives
`d(t) ≤ N^{3/2} (1 − c_θ/N)^t ≤ N^{3/2} e^{−c_θ t/N}`, and
`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff` concludes as in 3.1. For `b = 0` the tree is
one vertex, `c_θ = 1`, and the bound follows from 3.1 with `Δ = 0`.

**Checks.**

- `b = 2`, `k = 1`: `N = 3`, the edges are `{0, 1}` and `{0, 2}`, a path with the root in the
  middle; `b = 2`, `k = 2`: `N = 7` with edges `{0,1}, {0,2}, {1,3}, {1,4}, {2,5}, {2,6}`;
  `b = 1`, `k = 3` is the path `0 − 1 − 2 − 3`.
- The weights `α^{|v| − k}` are at least `1`, not at most `1`: the leaves have weight `1` and the
  root `b^{k/2}`. So the hypothesis `dist ≥ 1` of MarkovChainMixing 4.2 holds for `ρ` without
  rescaling.
- The mixing time, computed exactly from the rational transition matrix, is below the bound: on
  `baryTree 2 1` at `e^β = 1, 6/5, 5/4` it is `3, 4, 4` at `ε = 1/4` (bounds `10, 19, 25`) and
  `11, 15, 16` at `ε = 1/100` (bounds `19, 39, 50`); on `baryTree 2 2` at `β = 0`, where the chain
  is the hypercube walk on seven coordinates, it is `10` at `ε = 1/4` (bound `31`).
- `β ≥ 0` is needed: on `baryTree 2 1` at `e^β = 1/3` the hypothesis holds (`tanh β = −4/5`) and
  the bound at `ε = 1/4` is `⌈(3/(1 + (8/5)√2)) ((3/2) log 3 + log 4)⌉₊ = 3`, while the mixing
  time, computed exactly, is `19`.

*Needs:* 1.2, 1.3, 2.2 (its coupling), 3.1 (for `b = 0` and the last step); MarkovChainMixing 1.3
(`TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff`), 4.2
(`TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam`), 6.1; Mathlib
`SimpleGraph.fromRel`, `Real.sqrt`.

### 4.3 Removing edges

Let `G' ≤ G` be graphs on `V`, `r` the number of edges of `G` that are not edges of `G'`
(`(G.edgeFinset \ G'.edgeFinset).card`), `Δ` the maximum degree of `G` and `β ≥ 0`. Prove
`spectralGap_glauber_isingGibbs_le_of_le`:
`spectralGap (glauber π') π' ≤ exp(2β(Δ + 2r)) · spectralGap (glauber π) π`, where `π` and `π'`
are the Ising laws of `G` and `G'` at `β` (LPW, Proposition 15.8, pp. 221–222, proof printed
there, where it is stated as `1/γ ≤ e^{2β(Δ + 2r)}/γ'` and proved in this form).

Route: removing `r` edges changes the exponent `β Σ σσ` by at most `βr`, so
`e^{−2βr} π'(σ) ≤ π(σ) ≤ e^{2βr} π'(σ)`. By 1.2, for configurations `σ ≠ τ` differing at one
vertex, `κ(σ, τ) ≥ n⁻¹ (1 + e^{2βΔ})⁻¹` and `κ'(σ, τ) ≤ n⁻¹ e^{2βΔ} (1 + e^{2βΔ})⁻¹` (the degrees
of `G'` are at most those of `G`); both vanish on other pairs `σ ≠ τ`. Hence
`π'(σ) κ'(σ, τ) ≤ e^{2β(Δ + r)} π(σ) κ(σ, τ)` for `σ ≠ τ`, and since the Dirichlet form ignores
the diagonal, `dirichletForm κ' π' f ≤ e^{2β(Δ + r)} dirichletForm κ π f` for every `f`.
MarkovChainMixing 2.4 (`TauCetiRoadmap.MarkovChainMixing.spectralGap_le_of_dirichletForm_le`),
with `π` stationary for `κ` (as in 3.1) and `π'` positive, gives the claim with the factor
`max_σ π(σ)/π'(σ) ≤ e^{2βr}`. When `V` is
empty both gaps are `0`, the infimum over an empty family in the definition of `spectralGap`.

**Checks.**

- `G' = G`: the claim reads `γ ≤ e^{2βΔ} γ`. With `β < 0` this fails: on one edge with
  `e^β = 1/3` the gap is `1/10` and `e^{2βΔ} γ = 1/90`.
- `G` one edge and `G'` its two vertices with no edge (`Δ = 1`, `r = 1`) at `e^β = 2`: the
  one-edge chain has the eigenvalues `1, 4/5, 1/5, 0`, so `γ = 1/5`; the chain of `G'` is the
  hypercube walk with `γ' = 1/2`; and `1/2 ≤ e^{6β}/5 = 64/5`. At `β = 0` the chains of `G` and
  `G'` are the same hypercube walk and the inequality is an equality.

*Needs:* 1.1, 1.2; MarkovChainMixing 2.4 (`dirichletForm`, `spectralGap`,
`TauCetiRoadmap.MarkovChainMixing.spectralGap_le_of_dirichletForm_le`), 6.1
(`isMarkovKernel_glauber`, `isReversible_glauber`);
Mathlib `SimpleGraph.edgeFinset`, `Kernel.IsReversible.invariant`.

### Examples

- Removing the two edges at the root of `baryTree 2 1` leaves three isolated vertices, whose
  Glauber dynamics is the hypercube walk with gap `1/3`; so the path on three vertices has
  `γ ≥ e^{−2β(2 + 4)}/3`.

### Dependencies

4.1 uses 1.2, 2.1 and 3.1; 4.2 uses Layers 1 and 2 and 3.1; 4.3 uses Layer 1.

## Scope and ownership

This roadmap owns: the Ising law of a finite simple graph as a Gibbs law of QuantumOptimization's
energy, the heat-bath formula for its Glauber dynamics, the monotone heat-bath update, Chen's
theorem, the one-step coupling bounds, fast mixing in the regime `Δ tanh β < 1` and its
even-degree form, the complete graph at `α < 1`, the coalescence bound for coupling from the past,
the exact relaxation time of the cycle, the tree bound, and the comparison under removal of
edges.

Left to other roadmaps and to the libraries:

- the Glauber dynamics of an arbitrary law on configurations with its Markov property and
  reversibility, mixing times, spectral gaps and their comparison, path coupling, the hypercube
  walk, and the Glauber dynamics for colourings are MarkovChainMixing (1.2, 1.3, 2.1–2.4, 4.2, 5.3,
  6.1, 6.2); this roadmap applies them and restates none;
- Gibbs laws of an energy on a finite set and Dobrushin's ergodicity coefficient are
  SimulatedAnnealing (Layers 1 and 3); spins, the Ising energy and quadratic binary optimization
  are QuantumOptimization (1.1); the Hopfield energy and its dynamics are not treated here;
- random mapping representations, coalescence times and the theorem on monotone updates are
  CouplingFromThePast (Layers 1–3), whose scope leaves the Ising model as an example, treated
  here;
- Markov random fields and the Hammersley–Clifford theorem, canonical paths and the comparison
  of chains by path flows, and log-Sobolev constants are not treated here and not used;
- infinite-volume Gibbs specifications are DimerModelsAndLozengeTilings (Layer 4), and quantum
  spin systems are OperatorAlgebraDynamics; both are different objects.

Not treated here: external fields; antiferromagnetic couplings (`β < 0`); general spin systems
under a Dobrushin uniqueness condition; the low-temperature slow mixing on the complete graph
(`α > 1`) and the mean-field free energy; the lower bound for the cycle by Wilson's
method; polynomial relaxation on trees at every temperature; block dynamics and the ladder graph;
the square lattice at low temperature, contour (Peierls) arguments, correlation inequalities,
Lee–Yang theory and infinite-volume Ising states.

## Exact supplier contracts

### From Mathlib

- `SimpleGraph.adjMatrix` (`Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`);
  `SimpleGraph.maxDegree`, `SimpleGraph.degree`, `SimpleGraph.degree_le_maxDegree`,
  `SimpleGraph.neighborFinset`, `SimpleGraph.edgeFinset`
  (`Mathlib/Combinatorics/SimpleGraph/Finite.lean`); `SimpleGraph.fromRel`
  (`Mathlib/Combinatorics/SimpleGraph/Basic.lean`), the symmetric irreflexive closure of a
  relation; `SimpleGraph.cycleGraph` and `SimpleGraph.cycleGraph_neighborSet` (for `n + 2`
  vertices the neighbours of `v` are `v − 1` and `v + 1`)
  (`Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`).
- `hammingDist`, `Hamming` with its metric and `Hamming.dist_eq_hammingDist`
  (`Mathlib/InformationTheory/Hamming.lean`).
- `MeasureTheory.tvDist` and `MeasureTheory.tvDist_triangle`
  (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`); `ProbabilityTheory.cond`
  (`Mathlib/Probability/ConditionalProbability.lean`); `Kernel.IsReversible` and
  `Kernel.IsReversible.invariant` (a Markov kernel reversible for `π` leaves `π` invariant)
  (`Mathlib/Probability/Kernel/Invariance.lean`); `Measure.dirac_bind` (for a measurable `f`,
  `(dirac a).bind f = f a`) (`Mathlib/MeasureTheory/Measure/GiryMonad.lean`).
- `Measure.uniformOfFinset` (`Mathlib/Probability/Distributions/Uniform.lean`); the probability
  measure `volume` on `unitInterval` (`Mathlib/MeasureTheory/Constructions/UnitInterval.lean`);
  `ProbabilityTheory.iIndepFun` (`Mathlib/Probability/Independence/Basic.lean`);
  `ProbabilityTheory.HasLaw` (`Mathlib/Probability/HasLaw.lean`).
- `spectrum`; `Metric.diam`; `Order.height` (`Mathlib/Order/KrullDimension.lean`); `Real.tanh`,
  `Real.tanh_eq` (`tanh x = (e^x − e^{−x})/(e^x + e^{−x})`) and `Real.tanh_lt_one`
  (`Mathlib/Analysis/Complex/Trigonometric.lean`); `Real.add_one_le_exp`.

### From Tau Ceti

- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`): a measure on the
  product with the two given marginals.
- `TauCeti.wassersteinEDist`, `TauCeti.wassersteinEDist_le` (the distance is at most the
  `L^p` norm of the distance under any coupling) and `TauCeti.wassersteinEDist_dirac_dirac`
  (for `p ≠ 0` and measurable singletons, `W_p(δ_x, δ_y) = edist x y`)
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`).
- `Kernel.toMatrix` (`TauCeti/Probability/Kernel/Matrix.lean`), inside `transitionMatrix`.

### From TauCetiRoadmap.MarkovChainMixing

- 1.2 `tvToStationary` and the distance between starting points `d̄`; 1.3 `mixingTime` and
  `TauCetiRoadmap.MarkovChainMixing.mixingTime_le_iff` (`t_mix(ε) ≤ t` iff `d(t) ≤ ε`, for a Markov
  kernel).
- 2.1 `transitionMatrix`; 2.2 `absSpectralGap`; 2.4 `dirichletForm`, `spectralGap` and
  `TauCetiRoadmap.MarkovChainMixing.spectralGap_le_of_dirichletForm_le` (for `π` stationary for `κ`,
  `π'` positive and
  `dirichletForm κ' π' f ≤ a · dirichletForm κ π f` for all `f`,
  `spectralGap κ' π' ≤ max_x (π(x)/π'(x)) · a · spectralGap κ π`).
- 4.2 `wassersteinEDist_comp_le` (path coupling on a finite metric space, for a relation `E`
  such that every other pair of distinct points has a third point on a geodesic, with
  `c : ℝ≥0`) and `TauCetiRoadmap.MarkovChainMixing.tvToStationary_le_pow_mul_diam` (adding
  `dist x y ≥ 1` for `x ≠ y` and a
  stationary `π`: `d(t) ≤ c^t · diam`).
- 5.3 `hypercubeWalk`, in Checks only.
- 6.1 `glauber`, `isMarkovKernel_glauber` (for nonempty `V`) and `isReversible_glauber`.

### From TauCetiRoadmap.SimulatedAnnealing

- 3.1 `gibbs`, the Gibbs law `π_β(x) = exp(−β U x)/Σ_y exp(−β U y)` of an energy on a finite set.

### From TauCetiRoadmap.QuantumOptimization

- 1.1 `spin` (`−1` on `true`, `1` on `false`) and `ising` (couplings summed over ordered pairs,
  plus fields).

### From TauCetiRoadmap.CouplingFromThePast

- 1.1 `backwardMap`; 2.1 `backwardCoalescenceTime`; the Conventions (random mapping
  representations: a jointly measurable `f` with `ρ.map (f x) = κ x`); 3.2
  `measureReal_lt_backwardCoalescenceTime_le_height_mul` (for a monotone random mapping
  representation on a finite partial order with least and greatest elements,
  `P(T > t) ≤ ℓ · d̄(t)`, `ℓ` the height of the greatest element).

## References

- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017; the edition made available by the authors
  at pages.uoregon.edu/dlevin/MARKOV/. Used: Section 3.3.5; Section 12.2; Theorem 13.1 and
  Example 13.4; Chapter 15, Sections 15.1–15.4, Theorems 15.1, 15.4(i), 15.5, 15.6, Lemma 15.3
  and Proposition 15.8; Example 22.2; Section 25.2. Theorem 13.1 is attributed there to M.-F. Chen
  (1998), path coupling to Bubley and Dyer (1997), and coupling from the past to Propp and Wilson.
