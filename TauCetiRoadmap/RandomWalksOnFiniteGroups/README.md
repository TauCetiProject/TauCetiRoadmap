# Roadmap: random walks on finite groups

**Summary.** A random walk on a finite group `G` multiplies its current position by an
independent element drawn from a fixed probability measure `μ`. After `t` steps from the identity
its law is the convolution power `μ^{*t}`, and the question is how fast this law approaches the
uniform law `U` of the group, in total variation normalized to lie in `[0, 1]`. This roadmap
bounds the distance to uniformity by the irreducible complex characters of `G`, and for two
classical walks it locates the time at which the walk becomes mixed, up to a window of the order
of the number of coordinates or cards.

The headline theorems are these.

- *Convergence.* `μ^{*t}` tends to `U` if and only if the support of `μ` generates `G` and lies
  in no coset of a proper normal subgroup.
- *The upper bound lemma.* For every probability measure `ν` on `G`,
  `4 ‖ν − U‖² ≤ |G| Σ_g (ν(g) − 1/|G|)²`, and the right side equals the sum over the nontrivial
  irreducible characters `χ` of `χ(1) Σ_{h,k} ν(h) ν(k) χ(h k⁻¹)`. If `μ` is constant on
  conjugacy classes, the right side for `ν = μ^{*t}` is `Σ_{χ ≠ 1} χ(1)² |r_χ|^(2t)` with
  `r_χ = Σ_g μ(g) χ(g)/χ(1)`.
- *The hypercube.* For the lazy walk on `{0, 1}ⁿ` with `n ≥ 1`, which holds with probability
  `1/2` and otherwise flips a uniform coordinate, the distance to stationarity after
  `(1/2) n log n + c n` steps is at most `(1/2) √(exp(e^(−2c)) − 1)`, and after at most
  `(1/2) n log n − α n` steps it is at least `1 − 8 e^(2 − 2α)`. Hence for each `0 < ε < 1` the
  mixing time is `(1/2) n log n` up to a bounded multiple of `n`.
- *Random transpositions.* For the walk on the symmetric group `S_n` that transposes two
  independent uniform cards (and does nothing when they coincide), there is a constant `A` with
  `2 ‖μ^{*k} − U‖ ≤ A e^(−c)` whenever `c > 0` and `k = (n/2)(log n + c)`, and for `ε < 1` the
  mixing time is at least `((n − 1)/2) log((1 − ε) n / 6)`. Hence it too is `(1/2) n log n` up to
  a bounded multiple of `n`. The upper bound rests on Frobenius's formula for the characters of
  `S_n` at a transposition, in terms of the contents of the cells of a Young diagram.

The roadmap builds on Tau Ceti's character table of a finite group (the enumeration of the
irreducible complex characters with column orthogonality) and on its Specht modules for the
symmetric group with the Murnaghan–Nakayama rule. MarkovChainMixing supplies the distance to
stationarity `d(t)`, the mixing time and the lazy hypercube walk, and MarkovChainsAndRenewal the
convergence theorem for irreducible aperiodic chains.

Layer 1 below defines convolution powers and the walk and proves the convergence criterion.
Layer 2 proves the upper bound lemma with Plancherel's identity and its form for measures constant
on conjugacy classes. Layers 3 and 4 treat the hypercube and random transpositions; both use
Layers 1 and 2.

## Conventions

- **Groups and laws.** `G` is a finite group with `[Fintype G]` and a σ-algebra in which
  singletons are measurable (`[MeasurableSpace G] [MeasurableSingletonClass G]`), so
  every set is measurable. Laws are measures; `ν(g)` abbreviates `ν.real {g}`. `U` is
  `Measure.uniformOfFinset univ`, which gives mass `1/|G|` to each element.
- **Total variation.** Mathlib's `tvDist μ ν` is the total variation norm of `μ − ν` and takes
  values in `[0, 2]` on probability measures. The distance `‖μ − ν‖ = max_A |μ A − ν A|` of the
  source is `tvDist μ ν / 2`, and every statement is written with that expression. Both sources
  cited below use this distance: Levin–Peres in their (4.1) and Saloff-Coste in his (2.6).
- **Convolution and the walk.** Convolution is Mathlib's `Measure.mconv`, the image of `μ ⊗ ν`
  under multiplication, so that `(μ ∗ₘ ν)(g) = Σ_h μ(h) ν(h⁻¹ g)`. The walk driven by `μ` moves
  from `x` to `x ξ` with `ξ` of law `μ`, so its transition probability from `x` to `y` is
  `μ(x⁻¹ y)`. This is Saloff-Coste's left-invariant walk; Levin–Peres call it the right random
  walk (their Remark 2.9). Their left walk, from `g` to `ξ g`, has the same distance to `U` at
  every time, since both have law `μ^{*t}` translated by the starting point.
- **Distance to stationarity and mixing time.** These are MarkovChainMixing's `d(t)` and
  `t_mix(ε)`, copied verbatim into `Suggested.lean` as `tvToStationary` and `mixingTime` (see
  1.1): `d(t)` is the largest of the distances `tvDist ((κ ^ t) x) π / 2` over starting states
  `x`, and `t_mix(ε) : ℕ∞` is the least `t` with `d(t) ≤ ε`, and `⊤` if there is none. A real
  lower bound `r ≤ t_mix(ε)` is written `⌈r⌉₊ ≤ t_mix(ε)`, which is the same assertion.
- **Characters.** The irreducible complex characters of `G` are Tau Ceti's
  `TauCeti.irreducibleCharacter ℂ i`, for `i` in `Fin (Nat.card (ConjClasses G))`; each
  irreducible character occurs exactly once, the trivial one is the constant function `1`, and
  `χ_i(1)` is the degree `TauCeti.characterDegree ℂ i`. "`χ ≠ 1`" means the nontrivial ones.
- **The symmetric group.** `S_n` is `Equiv.Perm (Fin n)`, with `(σ * τ) x = σ (τ x)`, and
  `Equiv.swap i j` is the transposition of `i` and `j`. Every set of permutations is measurable
  (two instances in `Suggested.lean`). A partition `λ` of `n` is a `Nat.Partition n`; its Young
  diagram `YoungDiagram.ofPartition λ` has cells `(r, c)`, row `r` and column `c` counted from
  `0`, with rows of lengths the parts in decreasing order; the content of a cell is `c − r`, Tau
  Ceti's `YoungDiagram.cellContent`. The
  character of the Specht module of shape `λ` is Tau Ceti's integer-valued `TauCeti.spechtChar λ`;
  shape `(n)` gives the trivial character and shape `(1ⁿ)` the sign.
- **Logarithms and junk values.** `log` is the natural logarithm. Mathlib's `Real.log` has
  `log 0 = 0` and `log x = log |x|`; the statements that contain `log` say where this matters. The
  uniform law on an empty set is the zero measure, so the walks of Layers 3 and 4 are the zero
  kernel for `n = 0`; each statement says whether it needs `n ≥ 1`.

## Layer 1: random walks and convergence to the uniform law

### 1.1 Convolution powers and the walk

Define `convPow μ t`, written `μ^{*t}`, by `μ^{*0} = δ₁` and `μ^{*(t+1)} = μ^{*t} ∗ₘ μ`, and
`randomWalk μ`, the kernel `x ↦ μ.map (x * ·)`. Tau Ceti's `MeasureTheory.Measure.convolutionPower`
is the same recursion for the additive convolution on an additive monoid; `convPow` is its
multiplicative counterpart, needed because the groups here are not commutative. The distance to stationarity and the mixing time
are `tvToStationary` and `mixingTime` of MarkovChainMixing 1.2 and 1.3, copied verbatim. For a
probability measure `μ`, prove:

- `randomWalk μ` is a Markov kernel, `μ^{*t}` is a probability measure, and
  `(randomWalk μ ^ t) x = (μ^{*t}).map (x * ·)` for every `x` and `t` (Saloff-Coste, p. 270,
  `K_n(x, y) = p^(n)(x⁻¹ y)`);
- `U` is stationary for `randomWalk μ` (Levin–Peres, Proposition 2.12, p. 28);
- `tvDist ((randomWalk μ ^ t) x) U = tvDist (μ^{*t}) U` for every `x`, because left translation
  by `x` preserves `U` and total variation; hence the distance to stationarity of the walk is
  `tvDist (μ^{*t}) U / 2` (Saloff-Coste, p. 271, where the distances are observed not to depend
  on the starting point).

**Checks.**

- `μ^{*1} = δ₁ ∗ₘ μ = μ`.
- A point mass `μ = δ_σ` has `μ^{*t} = δ_{σ^t}`, and the distance to `U` is `1 − 1/|G|` at every
  time: a point mass is uniform only on the trivial group.
- On the trivial group every distance is `0`.

*Needs:* Mathlib `Measure.mconv`, `Measure.dirac_mconv`, `Measure.mconv_assoc`, `Measure.map`,
`Kernel.ofFunOfCountable`, `Measure.uniformOfFinset`, `tvDist`; MarkovChainMixing 1.2 and 1.3
(the definitions of `d(t)` and `t_mix(ε)`). Mathlib's `Measure.dirac_mconv` and
`Measure.mconv_assoc` ask for `MeasurableMul₂ G`, which holds here because every subset of the
finite set `G × G` is measurable.

### 1.2 Convergence to the uniform law

Let `μ` be a probability measure on `G` with support `Σ = {g | μ {g} ≠ 0}`. Prove
`tendsto_tvDist_convPow_iff`: `tvDist (μ^{*t}) U / 2 → 0` as `t → ∞` if and only if
`Subgroup.closure Σ = ⊤` and, for every normal subgroup `N ≠ ⊤` and every `g`, `Σ` is not
contained in the coset `g N` (Saloff-Coste, Proposition 2.3, p. 271, which characterizes
irreducibility by generation and, under generation, aperiodicity by the coset condition, with his
Theorem 2.1, p. 268, for the convergence; Levin–Peres, Proposition 2.13, p. 28, for the first
characterization).

Route. If `Σ` generates `G` and lies in no coset of a proper normal subgroup, the walk is
irreducible (in the sense of MarkovChainsAndRenewal 2.1) and aperiodic (in the sense of its 3.3)
by the two characterizations, positive recurrent because it is finite (its 2.3), and
stationary for `U` by 1.1; MarkovChainsAndRenewal 3.5 gives `tvDist ((randomWalk μ ^ t) 1) U → 0`,
which is the claim by 1.1. Conversely, if `Σ` lies in a
proper subgroup `H`, every `μ^{*t}` is carried by `H`, and if `Σ ⊆ g N` with `N` normal and
proper, `μ^{*t}` is carried by the coset `g^t N`; in both cases a set of uniform mass at most
`1/2` has mass `1`, so `tvDist (μ^{*t}) U / 2 ≥ 1/2` for every `t`.

**Checks.**

- `S_3` with `μ` uniform on the three transpositions: `Σ` generates `S_3` but lies in the coset
  of the alternating group `A_3` consisting of the odd permutations, and `μ^{*t}` is uniform on
  the odd permutations for odd `t` and on the even ones for even `t ≥ 2`, so the distance is
  `1/2` at every `t ≥ 1` (Saloff-Coste, p. 271, for the transposition walk on `S_n`).
- Normality is needed in the coset condition: in `S_3`, `Σ = {(1 2), (1 2 3)}` generates and lies
  in the coset `(1 2) H` of the subgroup `H = {1, (2 3)}`, since `(1 2)(2 3) = (1 2 3)`; `H` is not
  normal, `Σ` lies in no coset of `A_3`, and the walk converges (with `μ` uniform on `Σ`, the
  distance at `t = 29` is below `3 · 10⁻⁹`).
- If `μ {1} > 0` and `Σ` generates `G`, the walk converges: a coset containing `1` is the subgroup
  itself, which would then contain `Σ` and be all of `G`.
- On the trivial group the condition holds and the distance is `0` throughout.

*Needs:* 1.1; Mathlib `Subgroup.closure`, `Subgroup.Normal`, `ProbabilityTheory.Kernel.IsIrreducible`;
Tau Ceti `ProbabilityTheory.Kernel.period`, `ProbabilityTheory.Kernel.IsAperiodic`;
MarkovChainsAndRenewal 2.1, 2.3, 3.3 and 3.5.

### Examples

The transposition walk on `S_3` and the walk on `S_3` driven by `{(1 2), (1 2 3)}`; a point mass.

### Dependencies

Layer 1 uses MarkovChainMixing 1.2 and 1.3 (definitions), MarkovChainsAndRenewal 2.1, 2.3, 3.3
and 3.5, and Mathlib's convolution of measures, kernels, subgroups and total variation.

## Layer 2: the upper bound lemma

### 2.1 Plancherel's identity and the upper bound lemma

Define `plancherelSum ν`, for a measure `ν` on `G`, as the sum over the nontrivial irreducible
characters `χ` of `χ(1) Σ_{h,k} ν(h) ν(k) χ(h k⁻¹)`. If `ρ` is a unitary representation affording
`χ` and `ν̂(ρ) = Σ_g ν(g) ρ(g)`, the term of `χ` is `χ(1) tr(ν̂(ρ) ν̂(ρ)*)`, the term of
Saloff-Coste's (8.2) and Theorem 8.1; it is also `χ(1) tr(ν̂(ρ) ν̂'(ρ))` with `ν'(g) = ν(g⁻¹)`,
which needs no unitarity. Prove `upper_bound_lemma`: for every probability measure `ν`,

- `|G| Σ_g (ν(g) − 1/|G|)² = plancherelSum ν` (Saloff-Coste, Theorem 8.1, p. 317, at `k = 1`,
  which applies to every probability measure; the inversion and Plancherel formulas are on
  p. 316);
- `4 (tvDist ν U / 2)² ≤ (plancherelSum ν).re`, the upper bound lemma of Diaconis and
  Shahshahani (Saloff-Coste, (2.9), p. 269, with the identity above).

Route. Cauchy–Schwarz gives `(Σ_g |ν(g) − 1/|G||)² ≤ |G| Σ_g (ν(g) − 1/|G|)²`, and
`Σ_g |ν(g) − 1/|G|| = tvDist ν U` by the formula of total variation as a sum over points. Column
orthogonality at the identity, `Σ_χ χ(1) χ(g) = |G|` for `g = 1` and `0` otherwise, turns the sum
of `χ(1) Σ_{h,k} ν(h) ν(k) χ(h k⁻¹)` over all irreducible `χ` into `|G| Σ_h ν(h)²`; the trivial
character contributes `(Σ_h ν(h))² = 1`, and `|G| Σ_h ν(h)² − 1 = |G| Σ_h (ν(h) − 1/|G|)²`.

**Checks.**

- `ν = U`: both sides of the identity vanish.
- `ν = δ₁`: the identity reads `|G| − 1 = Σ_{χ ≠ 1} χ(1)²`, which is the sum of the squared
  degrees less the trivial one. On `ℤ/2` the inequality is an equality: `4 (1/2)² = 1`.
- The cyclic group of order `3` with generator `g`, characters `χ_j(g) = ω^j` (`ω = e^(2πi/3)`)
  and `ν = δ_g`: the identity reads `3 (4/9 + 1/9 + 1/9) = 2`, each nontrivial character
  contributing `χ_j(g g⁻¹) = 1`, and the inequality reads `4 (2/3)² = 16/9 ≤ 2`. With `h k` in
  place of `h k⁻¹` the two terms would be `ω² + ω = −1`: the inverse is needed.

*Needs:* Tau Ceti `TauCeti.irreducibleCharacter`, `TauCeti.characterTable_apply`,
`TauCeti.sum_characterTable_mul_characterTable_inv`, `TauCeti.irreducibleCharacter_one`,
`TauCeti.exists_irreducibleCharacter_eq_one`, `TauCeti.irreducibleCharacter_injective`; Mathlib
`Finset.sum_mul_sq_le_sq_mul_sq`, `tvDist`; MarkovChainsAndRenewal 3.5 (total variation on a
countable space as a sum over points).

### 2.2 Measures constant on conjugacy classes

Let `μ` be a probability measure with `μ {h g h⁻¹} = μ {g}` for all `g`, `h`, and write
`r_χ = Σ_g μ(g) χ(g) / χ(1)`. Prove `card_mul_sum_sq_convPow_eq`: for every `t`,

- `|G| Σ_g (μ^{*t}(g) − 1/|G|)² = Σ_{χ ≠ 1} χ(1)² |r_χ|^(2t)`, and hence
- `4 (tvDist (μ^{*t}) U / 2)² ≤ Σ_{χ ≠ 1} χ(1)² |r_χ|^(2t)`

(Saloff-Coste, Theorem 9.1, p. 326, with the scalar form of `p̂(ρ)` for a central measure on
p. 325; there the measure is written through the masses of the classes in its support, and the
power `2k` is applied to the number `r_χ` itself, which agrees with `|r_χ|^(2k)` when `r_χ` is
real; the modulus is needed in general, as a Check below shows).

Route. The element `Σ_g μ(g) g` of the group algebra is central, so it acts on an irreducible
representation affording `χ` as a scalar, whose trace identifies it as `r_χ`. Its `t`-th power is
`Σ_g μ^{*t}(g) g` and acts as `r_χ^t`, and the element built from `g ↦ μ^{*t}(g⁻¹)` acts as the
conjugate scalar. Hence the term of `χ` in `plancherelSum (μ^{*t})` is
`χ(1) · χ(1) |r_χ|^(2t)`, and 2.1 gives both items.

**Checks.**

- `t = 0`: both sides of the identity are `|G| − 1`.
- `S_3` with `μ` uniform on the transpositions: `r` is `−1` for the sign and `0` for the
  two-dimensional character, so the right side is `1` for every `t ≥ 1`, in agreement with the
  computation of 1.2 (`6 (3 (1/3 − 1/6)² + 3 (1/6)²) = 1`).
- Constancy on classes is needed: on `S_3` with `μ = δ_{(1 2)}` and `t = 1`, the left side is
  `6 ((5/6)² + 5 (1/6)²) = 5` and the right side is `1 · 1 + 4 · 0 = 1`.
- The modulus is needed: on the cyclic group of order `3` with `μ = δ_g` and `t = 1`, the left
  side is `2` (2.1), the two nontrivial characters have `|r_χ| = 1`, and the squares `r_χ²` would
  give `ω² + ω = −1`.
- On an abelian group every measure is constant on classes, every irreducible character is a
  homomorphism to the unit circle, and the identity reads
  `|G| Σ_g (μ^{*t}(g) − 1/|G|)² = Σ_{χ ≠ 1} |μ̂(χ)|^(2t)` with `μ̂(χ) = Σ_g μ(g) χ(g)`
  (Saloff-Coste, (8.3), p. 317).

*Needs:* 1.1, 2.1; Tau Ceti `TauCeti.irreducibleRepresentation`,
`TauCeti.character_irreducibleRepresentation`, `TauCeti.Representation.asAlgebraHom_center_apply`;
Mathlib `Representation.asAlgebraHom`, `Representation.character`.

### Examples

The cyclic group of order `3`; the transposition walk on `S_3` and the point mass at a
transposition.

### Dependencies

Layer 2 uses 1.1, MarkovChainsAndRenewal 3.5, Tau Ceti's character table, irreducible
representations and central characters, and Mathlib's group algebra.

## Layer 3: the lazy random walk on the hypercube

### 3.1 The walk and its Fourier coefficients

The walk is `hypercubeWalk n` of MarkovChainMixing 5.3, copied verbatim: on `Fin n → Bool`, a
uniform pair `(j, b)` is drawn and coordinate `j` is set to `b`. Through `Bool ≃ ZMod 2` it is
the walk driven by `μ_n = (1/2) δ_0 + Σ_j (1/(2n)) δ_{e_j}` on the group `(ℤ/2)ⁿ` (Levin–Peres,
Example 2.11, p. 28, for the lazy walk). The characters of `(ℤ/2)ⁿ` are
`χ_S(x) = (−1)^(Σ_{j ∈ S} x_j)` for `S ⊆ Fin n`. Prove:

- `μ̂_n(χ_S) = 1 − |S|/n`, with `(n choose k)` characters for each `|S| = k`;
- by 2.2 and 1.1, for `n ≥ 1` and every `t`,
  `4 d(t)² ≤ Σ_{k=1}^n (n choose k) (1 − k/n)^(2t) ≤ (1 + e^(−2t/n))ⁿ − 1` (Levin–Peres,
  Example 12.19 and (12.28), p. 173, where the bound is derived from the eigenvalues).

**Checks.**

- `μ̂_n(χ_S) = 1/2 + (1/(2n)) (n − 2|S|) = 1 − |S|/n`; the value `0` occurs only for `S = Fin n`.
- The holding probability matters. The walk that holds with probability `1/(n + 1)` and moves to
  each neighbour with probability `1/(n + 1)` has coefficients `1 − 2|S|/(n + 1)` and mixes about
  twice as fast: for `n = 100`, `t_mix(1/4)` is `275` for the lazy walk and `139` for that walk,
  against `(1/2) n log n ≈ 230.3` and `(1/4) n log n ≈ 115.1`.
- `n = 1`: `d(0) = 1/2` and `d(t) = 0` for `t ≥ 1`. `n = 2`: `d = 3/4, 1/4, 1/8, 1/16` at
  `t = 0, 1, 2, 3`. `n = 3`: `d = 7/8, 1/2, 1/3, 2/9`.

*Needs:* 1.1, 2.2; MarkovChainMixing 5.3 (the kernel); Mathlib `ZMod`.

### 3.2 The upper bound

Prove `four_mul_sq_tvToStationary_hypercubeWalk_le`: for `n ≥ 1`, every real `c` and every `t`
with `(1/2) n log n + c n ≤ t`, `4 d(t)² ≤ exp(e^(−2c)) − 1` (Levin–Peres, Example 12.19,
p. 173, the display after (12.28)). Route: 3.1, with `e^(−2t/n) ≤ e^(−2c)/n` and
`(1 + x/n)ⁿ ≤ eˣ`.

**Checks.**

- `n = 2`, `t = 1`: `c = (1 − log 2)/2 ≈ 0.153`, the bound is `exp(e^(−0.307)) − 1 ≈ 1.087` and
  `4 d(1)² = 1/4`.
- `n = 10⁴`: at `t = 56052` (`c ≈ 1`) the bound gives `d ≤ 0.190` and the distance is `0.146`; at
  `t = 66052` (`c ≈ 2`) it gives `0.068` against `0.054`.
- `n ≥ 1` is needed: for `n = 0` the kernel is zero, `d(1) = 1/2`, and with `c = 1` the right
  side is `exp(e^(−2)) − 1 ≈ 0.145 < 1`.

*Needs:* 3.1.

### 3.3 The lower bound

Prove `le_tvToStationary_hypercubeWalk`: for `n ≥ 1`, every real `α` and every `t` with
`t ≤ (1/2) n log n − α n`, `1 − 8 e^(2 − 2α) ≤ d(t)` (Levin–Peres, Proposition 7.14 and (7.20),
p. 95, where `d` is evaluated at the real number `(1/2) n log n − α n`; the proof there bounds
`d(t)` for every time `t` up to `(1/2)(n − 1) log n − (α − 1) n`, which is larger). The route is
the source's, with two inputs proved here:

- the distinguishing-statistic bound: for probability measures `μ`, `ν` on a finite set, a real
  function `f`, `r > 0` and `σ⋆² = max(Var_μ f, Var_ν f)`, if `|E_μ f − E_ν f| ≥ r σ⋆` then
  `‖μ − ν‖ ≥ 1 − 8/r²` (Levin–Peres, Proposition 7.9, p. 93);
- the number `R_t` of coordinates not yet drawn after `t` steps has mean `n (1 − 1/n)^t` and
  variance at most its mean (Levin–Peres, Lemma 7.13, p. 95).

Applied to the Hamming weight `W` from the all-ones start, `E_π W = n/2`, `Var_π W = n/4`,
`E W(X_t) = (n/2)(1 + (1 − 1/n)^t)` and `Var W(X_t) ≤ n/4`, so `r = √n (1 − 1/n)^t`. For
`α ≤ 1 + (1/2) log 8` the bound is negative and there is nothing to prove. For larger `α` some
`t` satisfies the hypothesis only if `n ≥ 2`, and then `(1 − 1/n)^(n − 1) > e^(−1)` gives
`r ≥ √n e^(−t/(n − 1)) ≥ e^(α − 1)`, the last step because `t ≤ (1/2) n log n − α n` and
`α + n − 1 ≥ (1/2) log n`.

**Checks.**

- `n = 10⁴`, `α = 3`: the hypothesis allows `t ≤ 16051`, the bound is `1 − 8 e^(−4) ≈ 0.853`,
  and `d(16051)` exceeds `1 − 10⁻¹¹`.
- `n ≥ 1` is needed: for `n = 0`, `t = 0` satisfies the hypothesis for every `α`, `d(0) = 0`, and
  for `α = 3` the bound is `0.853`.
- For `n = 1` and `α > 1` no `t` satisfies the hypothesis.

*Needs:* 3.1; Mathlib `ProbabilityTheory.variance`, `ProbabilityTheory.meas_ge_le_variance_div_sq`.

### 3.4 Cutoff

Prove `mixingTime_hypercubeWalk_window`: for `0 < ε < 1` there is `C` such that for every `n`,
`⌈(1/2) n log n − C n⌉₊ ≤ t_mix(ε) ≤ ⌈(1/2) n log n + C n⌉₊`. This is the cutoff at
`(1/2) n log n` with a window of order `n` (Levin–Peres, Theorem 18.3, p. 265, with the
definitions of §18.1, pp. 261–262). Route: 3.2 with `c = C` for the upper bound and 3.3 with
`α = C` for the lower bound, each for `C` large in terms of `ε`, and MarkovChainMixing 1.3
(`t_mix(ε) ≤ t` exactly when `d(t) ≤ ε`). For `n = 0` both bounds are `0` and `t_mix(ε) = 0`.

**Checks.**

- `(t_mix(ε) − (1/2) n log n)/n` over `n = 1, …, 30, 50, 100, 200, 400` lies in `[0.15, 1]` for
  `ε = 1/4`, in `[−1.18, 0]` for `ε = 9/10` and in `[1, 3.68]` for `ε = 1/100`; for example
  `t_mix(1/4) = 12, 29, 64, 275, 1378` for `n = 8, 16, 30, 100, 400`.
- `ε < 1` is needed: `d(0) = 1 − 2⁻ⁿ < 1`, so `t_mix(ε) = 0` for `ε ≥ 1`, while
  `(1/2) n log n − C n` is unbounded. `ε > 0` is needed: for `n ≥ 2`, `d(t) > 0` for every `t`
  (the coefficient `1 − 1/n` is not `0`), so `t_mix(0) = ⊤`.

*Needs:* 3.2, 3.3; MarkovChainMixing 1.3.

### Examples

The hypercube of dimensions `1`, `2`, `3` with exact distances; the dimension `10⁴` against both
bounds; the walk with holding probability `1/(n + 1)` as the contrasting convention.

### Dependencies

Layer 3 uses 1.1, 2.2, MarkovChainMixing 1.3 and 5.3, and Mathlib's variance.

## Layer 4: random transpositions

### 4.1 Frobenius's formula at a transposition

Prove `mul_spechtChar_swap`: for a partition `λ` of `n` and `i ≠ j` in `Fin n`,
`n (n − 1) χ^λ((i j)) = 2 (Σ_{(r, c)} (c − r)) χ^λ(1)`, the sum over the cells of the Young
diagram of `λ` (Saloff-Coste, §9.2, p. 327, in the form
`χ_λ(t)/χ_λ(e) = Σ_j (λ_j² − (2j − 1) λ_j) / (n (n − 1))` with rows indexed from `1`; the row
`j` contributes `2 Σ_{c < λ_j} (c − (j − 1)) = λ_j² − (2j − 1) λ_j` here). The formula is due to
Frobenius.

Route, by induction on `n ≥ 2`. For `n ≥ 3` the cycle type `(2, 1, …, 1)` of a transposition
has a part `1`, and the Murnaghan–Nakayama rule with that part gives
`χ^λ(τ_n) = Σ_b χ^(λ∖b)(τ_(n−1))` and `χ^λ(1) = Σ_b χ^(λ∖b)(1)`, the sums over the removable
corners `b` of `λ`, where `τ_m` is a transposition of `S_m`. The induction step
reduces to the identity `Σ_b c(b) χ^(λ∖b)(1) = (2/n) C(λ) χ^λ(1)`, `C(λ)` the content sum and
`c(b)` the content of `b`, which follows from the hook-length formula. For `n = 2` the rule with
a part `2` gives the trivial and the sign characters directly.

**Checks.**

- `λ = (n)`: the contents `0, …, n − 1` sum to `n(n − 1)/2`, and the formula gives the trivial
  value `1`. `λ = (1ⁿ)`: the contents sum to `−n(n − 1)/2`, giving the sign `−1`.
- `λ = (n − 1, 1)`: the content sum is `(n − 1)(n − 2)/2 − 1` and the degree `n − 1`, so the value
  is `n − 3`, the number of fixed points of a transposition less one.
- The content is column minus row: with `r − c` the formula would give `−1` for `λ = (3, 1)`,
  which is the value of `(2, 1, 1)`, instead of `1`.
- The formula and the identity of the route agree with the Murnaghan–Nakayama values for every
  partition of every `n ≤ 12`.

*Needs:* Tau Ceti `TauCeti.spechtChar`, `TauCeti.spechtChar_one`, `TauCeti.spechtCharValue`,
`TauCeti.spechtCharValue_eq_spechtChar`, `TauCeti.spechtCharValue_eq_sum_rimHook`,
`TauCeti.finrank_spechtModule_mul_prod_hookLength`, `YoungDiagram.cellContent`,
`YoungDiagram.IsCorner`, `YoungDiagram.erase`; Mathlib `YoungDiagram.ofPartition`, `Equiv.swap`.

### 4.2 The random transposition walk and the Diaconis–Shahshahani bound

Define `randomTransposition n` as the image of the uniform law on `Fin n × Fin n` under
`(i, j) ↦ Equiv.swap i j`, so that the identity has mass `1/n` and each transposition `2/n²`
(Saloff-Coste, (4.1), p. 283; Levin–Peres, (8.3), p. 102). Prove
`exists_tvDist_convPow_randomTransposition_le`: there is a constant `A` such that for every `n`,
every `c > 0` and every `k` with `k = (n/2)(log n + c)`,

- `2 (tvDist (μ^{*k}) U / 2) ≤ A e^(−c)`, and
- `n! Σ_σ (μ^{*k}(σ) − 1/n!)² ≤ (A e^(−c))²`

(Saloff-Coste, Theorem 9.2, p. 327, where the two bounds are `2 ‖p^(k) − u‖ ≤ d_2 ≤ A e^(−c)`;
the theorem is Diaconis and Shahshahani's).

Route. By 2.2 and 4.1, `n! Σ_σ (μ^{*k}(σ) − 1/n!)² = Σ_{λ ≠ (n)} d_λ² r_λ^(2k)` with
`r_λ = 1/n + ((n − 1)/n) χ^λ((1 2))/d_λ`, which is real; for `n ≥ 2` the largest `r_λ` with
`λ ≠ (n)` is `1 − 2/n`, at `(n − 1, 1)`, and the smallest is `−1 + 2/n`, at `(1ⁿ)`
(Saloff-Coste, p. 327). Here the irreducible complex characters of `S_n` are the Specht
characters read in `ℂ`. What remains is Diaconis and Shahshahani's estimate of this sum, whose
inputs are 4.1 and the hook-length formula. The first item follows from the second by 2.1.

**Checks.**

- `n = 2`: `μ` is uniform on `S_2` and every distance vanishes from `t = 1` on. `n = 3`: the
  distances `d(t)` are `5/6, 1/3, 5/54, 1/27, 5/486` for `t = 0, …, 4`.
- The eigenvalues `r_λ`: `1` for `(n)`, `1 − 2/n` for `(n − 1, 1)`, `−1 + 2/n` for `(1ⁿ)`.
- `c > 0` is needed in the second item: `k = 0` is `c = −log n`, the left side is `n! − 1` and the
  right side `A² n²`, which is smaller for large `n`. (In the first item it is not: the left side
  is at most `2`.)
- Over `n ≤ 12` and `c > 0` the largest value of `e^c (n! Σ_σ (μ^{*k}(σ) − 1/n!)²)^(1/2)` is
  about `0.78`, at `n = 12`, `k = 15`.
- `n = 0` and `n = 1`: the group is trivial and both left sides vanish.

*Needs:* 2.1, 2.2, 4.1; Tau Ceti `TauCeti.irreducibleCharacter`,
`TauCeti.partitionEquivSimpleFDRepClassesℂ`, `TauCeti.character_spechtModuleℂ_intCast`,
`TauCeti.finrank_spechtModule_mul_prod_hookLength`; Mathlib `Measure.uniformOfFinset`,
`Equiv.swap`.

### 4.3 The lower bound

Prove `ceil_le_mixingTime_randomTransposition`: for every `n` and every `ε < 1`,
`⌈((n − 1)/2) log((1 − ε) n / 6)⌉₊ ≤ t_mix(ε)` for `randomWalk (randomTransposition n)`
(Levin–Peres, Proposition 8.4, p. 103, stated for `0 < ε < 1`). Route, as in the source: a card
touched by none of the first `t` transpositions is a fixed point; the number of untouched cards
has the law of the number of coupon types missed by `2t` draws, of mean `μ_t = n (1 − 1/n)^(2t)`
and variance at most `μ_t` (Lemma 7.13, as in 3.3); a uniform permutation has mean number of
fixed points `1`; Markov's and Chebyshev's inequalities on the event "at least `μ_t/2` fixed
points" give `d(t) ≥ 1 − 6/μ_t`.

**Checks.**

- `n = 10`, `ε = 1/4`: the bound is `⌈4.5 log 1.25⌉₊ = 2`, and `t_mix(1/4) = 12`.
- The bound holds without `ε > 0`, which is why the statement omits it: for `ε < 0` the mixing
  time is `⊤`; for `ε = 0` it is `⊤` when `n ≥ 3`, since `d(t) > 0` for every `t`, and for
  `n ≤ 2` the bound is `0`.
- `ε < 1` is needed: for `ε = 3` and `n = 12`, `Real.log` of `−4` is `log 4`, the bound is
  `⌈5.5 log 4⌉₊ = 8`, and `t_mix(3) = 0`.
- `n = 1`: the factor `n − 1` vanishes. `n = 0`: the argument of the logarithm is `0` and
  `Real.log 0 = 0`. In both cases the bound is `0`.
- Over `n = 2, …, 10` the inequality `d(t) ≥ 1 − 6/(n (1 − 1/n)^(2t))` holds at every `t`.

*Needs:* 1.1, 4.2 (the measure); MarkovChainMixing 1.3; Mathlib
`ProbabilityTheory.variance`, `ProbabilityTheory.meas_ge_le_variance_div_sq` (Chebyshev) and
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg` (Markov).

### 4.4 Cutoff

Prove `mixingTime_randomTransposition_window`: for `0 < ε < 1` there is `C` such that for every
`n`, `⌈(1/2) n log n − C n⌉₊ ≤ t_mix(ε) ≤ ⌈(1/2) n log n + C n⌉₊` for
`randomWalk (randomTransposition n)`. Route: for the upper bound, 4.2 with
`k = ⌈(1/2) n log n + C n⌉₊`, that is `c = 2k/n − log n ≥ 2C`, and `C` with `A e^(−2C) ≤ 2ε`;
for the lower bound, 4.3 and `(1/2) n log n − ((n − 1)/2) log n = (1/2) log n ≤ n/2`, with
`C ≥ 1/2 + (1/2) log(6/(1 − ε))`; MarkovChainMixing 1.3. For `n = 0` the group is trivial,
`t_mix(ε) = 0` and both bounds are `0`. The cutoff at `(1/2) n log n` is
Diaconis and Shahshahani's (Saloff-Coste, p. 328, after Theorem 9.2; Levin–Peres, p. 102, state
`t_mix(ε) = (1/2 + o(1)) n log n`).

**Checks.**

- For `ε = 1/4`, `(t_mix(ε) − (1/2) n log n)/n` lies in `[−0.01, 0.16]` for `n = 1, …, 11`;
  for `ε = 9/10` it lies in `[−0.66, 0]`.
- `ε < 1` and `ε > 0` are needed for the same reasons as in 3.4: `t_mix(ε) = 0` for `ε ≥ 1`, and
  `t_mix(0) = ⊤` for `n ≥ 3`.

*Needs:* 4.2, 4.3; MarkovChainMixing 1.3.

### Examples

`S_2`, `S_3` and `S_4` with exact distances; `n = 10` against the lower bound.

### Dependencies

Layer 4 uses 1.1, 2.1, 2.2, MarkovChainMixing 1.3, Tau Ceti's Specht characters, the
Murnaghan–Nakayama rule and the hook-length formula, and Mathlib's variance and Chebyshev's
inequality.

## Scope and ownership

This roadmap owns: convolution powers and the random walk of a probability measure on a finite
group, with the identification of its distance to stationarity; the criterion for convergence of
`μ^{*t}` to the uniform law; the Plancherel sum, Plancherel's identity in character form and the
upper bound lemma for every probability measure; their form for measures constant on conjugacy
classes; the Fourier coefficients, the upper and lower bounds and the cutoff of the lazy
hypercube walk; Frobenius's formula for the character of the symmetric group at a transposition;
the random transposition measure, the Diaconis–Shahshahani bound, the fixed-point lower bound and
the cutoff of random transpositions.

Already in the libraries and therefore not targets: convolution of measures (Mathlib) and the
convolution powers of a measure on an additive monoid (Tau Ceti), of which 1.1 defines the
multiplicative form; irreducibility of kernels (Mathlib) and periods and aperiodicity (Tau Ceti),
which 1.2 uses through MarkovChainsAndRenewal; the content of a cell, the corners of a Young
diagram and their removal (Tau Ceti); the
irreducible complex characters with their enumeration, both orthogonality relations, the degrees
and the central characters (Tau Ceti's character table); the Specht modules, their integer
characters, the Murnaghan–Nakayama rule and the hook-length formula (Tau Ceti). Mathlib's
discrete Fourier analysis on finite abelian groups (`Mathlib/Analysis/Fourier/FiniteAbelian/`)
is not used: the abelian case is read off 2.2. On `ZMod N` the identity of 2.1 is the case
`Φ = ν − U` of the Parseval identity stated in SamplingAndDiscreteFourierAnalysis, section 1.1
(an open roadmap, not on main); 2.1 holds on every finite group, and this roadmap does not depend
on that one.

On main:

- MarkovChainsAndRenewal owns irreducibility, periods, positive recurrence, the convergence in
  total variation of an irreducible aperiodic positive recurrent chain (its 3.5) and the formula
  of total variation as a sum over points; 1.2 uses them and characterizes, for a random walk on a
  group, when they apply.
- The RepresentationTheory family plans the character theory of finite groups (its
  CharacterTheory) and of the symmetric group (its SchurWeyl); this roadmap uses only the Tau Ceti
  declarations cited above and restates nothing of theirs. TypeAHeckeAlgebras treats
  Jucys–Murphy elements of Hecke algebras, whose eigenvalues on the Specht basis are powers of `Q`
  given by contents; 4.1 is a statement about the characters of the symmetric group, which none
  of these roadmaps states.

Open roadmaps (not on main) that border this one:

- MarkovChainMixing (an open roadmap, not on main) is a supplier: this roadmap uses the
  definitions of `d(t)` and `t_mix(ε)` of its 1.2 and 1.3, the equivalence `t_mix(ε) ≤ t` exactly
  when `d(t) ≤ ε` of its 1.3, and the kernel `hypercubeWalk` of its 5.3, and copies the three
  definitions verbatim into `Suggested.lean`. Its 5.3 bounds the separation distance of the
  hypercube walk by `n (1 − 1/n)^t` through a strong stationary time, which gives
  `t_mix(ε) ≤ ⌈n log n + n log(1/ε)⌉₊`; 3.2 and 3.3 above are a different, sharper pair of bounds
  at `(1/2) n log n`, and cutoff is outside that roadmap's scope. Its 2.3 bounds
  `(tvDist ((κ ^ t) x) π)²` for a reversible chain through the return probability `κ^(2t)(x, x)`;
  for a symmetric `μ` this is the bound of 2.1 applied to `μ^{*t}`, while 2.1 holds for every
  measure, symmetric or not, and is written with characters. Its 2.3 also bounds `|z|^t ≤ 2 d(t)`
  for eigenvalues `z`, which is not restated.
- BooleanFunctionAnalysis (an open roadmap, not on main) develops the Walsh characters of
  `(ℤ/2)ⁿ` with their Plancherel identity; 3.1 uses only the characters as an instance of 2.2,
  and this roadmap does not depend on that one.

Outside the scope: comparison of walks, walks on infinite groups, continuous-time walks, the
top-to-random and riffle shuffles, separation and `ℓ^∞` cutoffs, lower bounds for general walks
from a single character, the limit profile of random transpositions, walks on other families of
groups, and every algorithm.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Measure.mconv`, `Measure.dirac_mconv` (for an s-finite measure, `δ_x ∗ₘ μ` is
  the translate of `μ` by `x`) and `Measure.mconv_assoc`
  (`Mathlib/MeasureTheory/Group/Convolution.lean`): the convolution of measures on a monoid as
  the image of the product under multiplication.
- `MeasureTheory.tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean`): the total
  variation norm of the difference, in `[0, 2]` on probability measures.
- `MeasureTheory.Measure.uniformOfFinset` (`Mathlib/Probability/Distributions/Uniform.lean`):
  mass `1/|s|` at each point of a nonempty finset `s`, the zero measure for `s = ∅`.
- `ProbabilityTheory.Kernel.ofFunOfCountable` (`Mathlib/Probability/Kernel/Basic.lean`): the
  kernel of a function on a countable space with measurable singletons.
- `Subgroup.closure`, `Subgroup.Normal` (`Mathlib/Algebra/Group/Subgroup/`); `Equiv.swap`;
  `ZMod`.
- `ProbabilityTheory.Kernel.IsIrreducible` (`Mathlib/Probability/Kernel/Irreducible.lean`):
  irreducibility of a kernel with respect to a measure, with the counting measure on a finite set.
- `YoungDiagram.ofPartition` (`Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean`):
  the diagram whose row lengths are the parts in decreasing order.
- `Representation.asAlgebraHom` (`Mathlib/RepresentationTheory/Basic.lean`) and
  `Representation.character` (`Mathlib/RepresentationTheory/Character.lean`).
- `Finset.sum_mul_sq_le_sq_mul_sq` (`Mathlib/Algebra/Order/BigOperators/Ring/Finset.lean`):
  Cauchy–Schwarz for finite sums. `ProbabilityTheory.variance` and
  `ProbabilityTheory.meas_ge_le_variance_div_sq` (`Mathlib/Probability/Moments/Variance.lean`):
  Chebyshev's inequality. `MeasureTheory.mul_meas_ge_le_integral_of_nonneg`: Markov's inequality.

### From Tau Ceti

- `TauCeti/RepresentationTheory/CharacterTable/Table.lean`: `TauCeti.irreducibleCharacter`
  (the `i`-th irreducible character over an algebraically closed field in which `|G|` is
  invertible, for an enumeration of the set of irreducible characters by
  `Fin (Nat.card (ConjClasses G))`), `TauCeti.irreducibleCharacter_injective`,
  `TauCeti.exists_irreducibleCharacter_eq_one` (the trivial character is enumerated),
  `TauCeti.characterDegree`, `TauCeti.irreducibleCharacter_one` (the value at `1` is the degree),
  `TauCeti.irreducibleRepresentation` and `TauCeti.character_irreducibleRepresentation` (an
  irreducible representation affording the `i`-th character), `TauCeti.characterTable_apply`,
  and `TauCeti.sum_characterTable_mul_characterTable_inv` (column orthogonality: the sum over `i`
  of `χ_i(g) χ_i(h⁻¹)` is `|G|/|class of g|` if `g` and `h` are conjugate and `0` otherwise).
- `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean`:
  `TauCeti.Representation.asAlgebraHom_center_apply` (a central element of the group algebra acts
  on an irreducible representation over an algebraically closed field by the scalar of its
  central character).
- `TauCeti/RepresentationTheory/Symmetric/Specht/Character.lean`: `TauCeti.spechtChar` (the
  integer character of the Specht module `S^λ`), `TauCeti.spechtChar_one` (its value at `1` is
  `dim S^λ`), `TauCeti.spechtCharValue` and `TauCeti.spechtCharValue_eq_spechtChar` (the value on
  a cycle type).
- `TauCeti/RepresentationTheory/Symmetric/Specht/Complex.lean`:
  `TauCeti.partitionEquivSimpleFDRepClassesℂ` (the complex Specht modules are, up to
  isomorphism, exactly the simple complex representations of `S_n`, one for each partition) and
  `TauCeti.character_spechtModuleℂ_intCast` (the complex character is the integer character
  `TauCeti.spechtChar` read in `ℂ`).
- `TauCeti/RepresentationTheory/Symmetric/Specht/MurnaghanNakayama.lean`:
  `TauCeti.spechtCharValue_eq_sum_rimHook` (the Murnaghan–Nakayama rule: removing a part `r` from
  the cycle type sums over the rim hooks of size `r`, with signs).
- `TauCeti/RepresentationTheory/Symmetric/Specht/HookLength.lean`:
  `TauCeti.finrank_spechtModule_mul_prod_hookLength` (the hook-length formula).
- `TauCeti/Combinatorics/Young/Diagram.lean`: `YoungDiagram.cellContent` (the content `j − i` of
  the cell `(i, j)`). `TauCeti/Combinatorics/Young/Corner.lean`: `YoungDiagram.IsCorner` and
  `YoungDiagram.erase` (the removable corners of a diagram and the diagram with one removed).
- `TauCeti/Probability/MarkovChain/Period.lean`: `ProbabilityTheory.Kernel.period` and
  `ProbabilityTheory.Kernel.IsAperiodic` (the period of a state as the gcd of its return
  lengths, and period one at every state).
- `TauCeti/MeasureTheory/Group/Convolution/Power.lean`: `MeasureTheory.Measure.convolutionPower`,
  the convolution powers on an additive monoid; not used by the statements, whose groups are not
  commutative, and named here because `convPow` is its multiplicative form.

### From TauCetiRoadmap.MarkovChainsAndRenewal

Items are cited as "layer.item" of [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md).

- 2.3: a finite closed communicating class is positive recurrent.
- 3.3: periods and aperiodicity.
- 3.5: `tvDist μ ν = Σ_y |μ {y} − ν {y}|` on a countable space, and
  `tvDist (νκⁿ) π → 0` for an irreducible aperiodic positive recurrent chain with invariant law
  `π` and every initial law `ν`.

### From TauCetiRoadmap.MarkovChainMixing

MarkovChainMixing is an open roadmap, not on main.

- 1.2: `tvToStationary κ π t`, the maximum over `x` of `tvDist ((κ ^ t) x) π / 2`, copied
  verbatim.
- 1.3: `mixingTime κ π ε`, the infimum in `ℕ∞` of the `t` with `tvToStationary κ π t ≤ ε`,
  copied verbatim; and `mixingTime κ π ε ≤ t` exactly when `tvToStationary κ π t ≤ ε`, for a
  Markov kernel and every measure `π`.
- 5.3: `hypercubeWalk n`, copied verbatim.

## References

- D. A. Levin and Y. Peres, with contributions by E. L. Wilmer, *Markov chains and mixing times*,
  second edition, American Mathematical Society, 2017. Numbering and pages as in the second
  edition made available by the authors.
- L. Saloff-Coste, "Random walks on finite groups", in H. Kesten (ed.), *Probability on discrete
  structures*, Encyclopaedia of Mathematical Sciences 110, Springer, 2004, pp. 263–346; the
  version on the author's page at Cornell, with the printed page numbers.
- Attributions made in prose without a locator: P. Diaconis and M. Shahshahani, "Generating a
  random permutation with random transpositions", *Z. Wahrsch. Verw. Gebiete* 57 (1981), for the
  upper bound lemma and the bound of 4.2; P. Diaconis, *Group representations in probability and
  statistics*, IMS Lecture Notes 11 (1988), Chapter 3; G. Frobenius (1900) for the formula of
  4.1.
