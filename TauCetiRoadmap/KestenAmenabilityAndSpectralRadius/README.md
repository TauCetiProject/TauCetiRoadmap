# Roadmap: Kesten's amenability criterion and the spectral radius of random walks on groups

**Summary.** A symmetric random walk on a group `G` starts at the identity and at each step
multiplies its position on the left by an independent element drawn from a fixed probability `μ`
on `G`, with `μ(g⁻¹) = μ(g)`. The support of `μ` may be infinite and the group is arbitrary;
where a theorem asks that the support generate `G`, the group is countable. The probability `p_n`
of being back at the identity after `n` steps decays at an exponential rate
`ρ(μ) = limsup p_n^(1/n)`, the spectral radius of the walk. Kesten showed in 1959 that this rate
detects amenability. This roadmap proves his criterion in quantitative form, computes the rate on
free groups, and links it to the growth of the kernel of a presentation.

The headline theorems are these.

- *The rate is an operator norm.* For every nonnegative, summable, symmetric function `μ` on `G`,
  `p_(2n)^(1/(2n))` converges to `ρ(μ)`, and `ρ(μ)` is the norm of convolution by `μ` on `ℓ²(G)`.
- *Expansion and spectral radius.* Let `Φ(μ)` be the infimum over finite nonempty `K ⊆ G` of
  `Σ_s μ(s) |sK ∖ K| / |K|`, the chance that one step from a uniform point of `K` leaves `K`.
  Then `1 − √(1 − Φ²) ≤ 1 − ρ(μ) ≤ Φ`.
- *Kesten's criterion.* If the support of `μ` generates `G`, then `ρ(μ) = 1` if and only if `G` is
  amenable as a discrete group.
- *Free groups and cogrowth.* The simple random walk on the free group of rank `k ≥ 1` has
  `ρ = √(2k − 1)/k`, and its image in any group has at least this spectral radius. For a
  homomorphism `φ` out of that free group, the growth rate `c` of the reduced words in its kernel
  determines `ρ` of the image walk: `2kρ = (2k − 1)/c + c` when `c > √(2k − 1)`, and
  `ρ = √(2k − 1)/k` otherwise. For `k ≥ 2` and `φ` onto, the target group is amenable exactly
  when `c = 2k − 1` (Grigorchuk's criterion).

The roadmap rests on Tau Ceti's amenability library, which realizes the roadmap AmenableGroups:
its characterization of amenable discrete groups by Følner sets is the bridge between the
spectral side and amenability, and its proof that the free group of rank two is not amenable is
the basic example. Mathlib supplies summation of families, the monoid algebra, free groups with
reduced words, and formal and convergent power series. The roadmap FreeProbability uses the
value `2√3` of the norm of the adjacency operator of the free group of rank two, and
OperatorAlgebraDynamics recalls Kesten's theorem; at rank two the free-group value here gives
that norm.

Layer 1 below defines convolution, return probabilities and the spectral radius and identifies
the radius with an `ℓ²` norm. Layer 2 defines the expansion constant, proves the two inequalities
and deduces Kesten's criterion through Følner sets. Layer 3 treats the free group: the tree value,
the lower bound for images, the cogrowth formula and Grigorchuk's criterion.

## Conventions

These choices fix the objects of every layer; each has a Check below.

- **Design of the carrier.** A step distribution on a group `G` (`[Group G]`, no topology unless
  amenability is mentioned) is a real function `μ : G → ℝ` with arbitrary support. Each statement
  carries the hypotheses it uses: `∀ g, 0 ≤ μ g`, `Summable μ` and `∀ g, μ g⁻¹ = μ g` in 1.2 and
  1.3, the first two in 2.3; a *symmetric step measure* (`IsSymmetricStep`) is nonnegative,
  symmetric and has `HasSum μ 1`, which contains summability. Mathlib's `PMF G` was not used: its
  values lie in `ℝ≥0∞` and its mass is `1`, while 1.2 and 1.3 hold for every total mass and 1.3 is a
  statement about signed `f`. Mathlib's `MeasureTheory.mlconvolution` convolves `ℝ≥0∞`-valued
  functions against a measure, so it has no signed `f` either; `MeasureTheory.Measure.mconv`
  convolves measures; Mathlib's `lp` spaces carry no convolution product. So the convolution `conv`
  and its powers `convPow` are defined here with a `tsum`. Their junk value: the `tsum` of a family
  that is not summable is `0` (`tsum_eq_zero_of_not_summable`); summability of `μ` excludes it
  (1.1), and a Check of 1.3 shows the statements fail without it.
- **Finitely supported walks.** Layer 3 works in Mathlib's `MonoidAlgebra ℝ F_k`, whose product is
  convolution of finitely supported functions (`MonoidAlgebra.coeff_mul`), and applies Layers 1
  and 2 to the coefficient function `⇑x.coeff : G → ℝ` of an element `x`. The bridge is the
  identity `convPow ⇑x.coeff n = ⇑(x ^ n).coeff` of 1.1, so ring powers and
  `MonoidAlgebra.mapDomainRingHom` remain available there. For a finitely supported `μ` each
  `tsum` below is a finite sum (`tsum_eq_sum`), and every statement of Layers 1 and 2 specializes
  to the same statement for an element of the monoid algebra.
- **The walk.** `conv μ ν g = Σ_a μ(a) ν(a⁻¹g)`, the sum over `ab = g` of `μ(a) ν(b)`, and
  `convPow μ n` is `μ^{*n}`: the point mass at `1` for `n = 0` and `μ * μ^{*n}` after it, the law
  of `s_n ⋯ s_1` for independent `s_i` of law `μ`, the walk that moves from `x` to `sx`. The
  return probability is `p_n = μ^{*n}(1)`; it is also that of the walk `x ↦ xs`.
- **Spectral radius.** `ρ(μ) = limsup_n p_n^(1/n)`, the real `limsup` of real powers; for
  nonnegative summable `μ` the sequence is bounded by the total mass (1.1), and the term `n = 0`
  (exponent `0⁻¹ = 0`) does not affect the `limsup`. The real `limsup` of a sequence that is not
  bounded above is `0` (`Real.sInf_empty`). For periodic walks `p_n = 0` for all odd `n`, which is
  why the even times are used in 1.2. This is the source's definition of the spectral radius of a
  walk; it is not Mathlib's spectral radius of an element of a Banach algebra, and no statement
  below uses the spectrum of an operator.
- **The operator.** The walk operator is `f ↦ μ * f` on finitely supported `f : G →₀ ℝ`, with
  `(μ * f)(x) = Σ_s μ(s) f(s⁻¹x)`, which for symmetric `μ` is `Σ_s μ(s) f(sx)`, the source's
  transition operator `Pf(x) = Σ_y p(x, y) f(y)` with `p(x, y) = μ(yx⁻¹)`. The norm is
  `‖f‖₂ = (Σ_x f(x)²)^(1/2)` (`l2Norm`, a `tsum`). Finitely supported functions are dense in
  `ℓ²(G)`, so the supremum of `‖μ * f‖₂ / ‖f‖₂` over them is the norm of the bounded extension to
  `ℓ²(G)`.
- **Expansion.** The walk is the network on `G` with conductance `μ(s)` on the edge `{x, sx}` (a
  loop at `x` when `s = 1`) and vertex weight `Σ_s μ(s)`, which is `1` for a symmetric step
  measure; the conductances at a vertex are summable, the source's condition (6.1). Its edge
  boundary of a finite `K` is the sum `Σ_s μ(s) |sK ∖ K|` over all `s ∈ G`, summable since
  `|sK ∖ K| ≤ |K|`, and `x ↦ sx` maps `{x ∈ K : sx ∉ K}` onto `sK ∖ K`. Left translates `sK`
  match Tau Ceti's Følner sets, which use `gF`. Loops never leave `K`.
- **Generation.** *Generating* means `Subgroup.closure (Function.support μ) = ⊤`. The support of a
  summable real function is countable (`Summable.countable_support`), so a group generated by it
  is countable, and no countability hypothesis appears.
- **Amenability.** `TauCeti.Amenable G` for the discrete topology on `G`, and
  `TauCeti.HasFoelnerSets G`, which needs no topology.
- **Free groups.** `F_k = FreeGroup (Fin k)` with generators `FreeGroup.of i`; `|w|` is
  `FreeGroup.norm w`, the length of the reduced word. The simple random walk puts mass `1/(2k)` on
  each of the `2k` letters `a_i^(±1)`; `k ≥ 1` so that it is a probability (for `k = 0` it is
  `0`). A homomorphism `φ : F_k → Γ` pushes it forward by Mathlib's `MonoidAlgebra.mapDomain φ`.

**Checks.**
- Trivial group: the only symmetric step measure is the point mass at `1`; `p_n = 1`, `ρ = 1`,
  the set `K = {1}` has empty boundary, so `Φ = 0`, and the group is amenable.
- Finite groups: on `ℤ/3` with `μ = (δ₁ + δ₂)/2`, `p_n = (1 + 2(−1/2)ⁿ)/3`, so `p₁ = 0`,
  `p₂ = 1/2`, `p₃ = 1/4` and `ρ = 1`. In every finite group `p_(2n) = Σ_g μ^n(g)² ≥ 1/|G|` by
  Cauchy–Schwarz, so `ρ = 1`, and `K = G` gives `Φ = 0`.
- Periodicity: for the simple walk on `ℤ`, `p_(2n+1) = 0` and `p_(2n) = C(2n, n)/4ⁿ`, so
  `p_n^(1/n)` has no limit while `ρ = lim p_(2n)^(1/(2n)) = 1`.
- Lazy walks: for `δ₀/2 + (δ₁ + δ₋₁)/4` on `ℤ`, `p_n = C(2n, n)/4ⁿ` for every `n` (the measure is
  the convolution of `(δ₀ + δ₁)/2` and `(δ₀ + δ₋₁)/2`), with no zero terms and `ρ = 1`.
- Infinite support: on `ℤ` let `μ(k) = 2^(−|k|−1)` for `k ≠ 0` and `μ(0) = 0`, a symmetric step
  measure whose support generates `ℤ`. Its Laurent series is `(x/(2 − x) + 1/(2x − 1))/2` on
  `1/2 < |x| < 2`, and the constant terms of its powers give `p₁ = 0`, `p₂ = 1/6`, `p₃ = 1/12` and
  `p₄ = 19/216` (`p₂ = Σ_k μ(k)² = 2 Σ_(k ≥ 1) 4^(−k−1)`). For `K = {0, …, n − 1}`,
  `|(s + K) ∖ K| = min(|s|, n)` and `edgeBoundary μ K = 2 − 2^(1−n)`, so `Φ = 0`; by 2.2 `ρ = 1`.
- Non-generating support: the point mass at `1` on the free group of rank two has `ρ = 1` and
  `Φ = 0`, while that group is not amenable (AmenableGroups Layer 3); generation is needed in 2.3
  and 2.4.
- Symmetry: `μ = δ₁` on `ℤ` generates, has mass one and `ρ = 0`, while convolution by it is a
  translation with `‖μ * f‖₂ = ‖f‖₂`; `ℤ` is amenable. So 1.3 and 2.4 fail without symmetry.
- Mass: `δ₁ + δ₋₁` on `ℤ` is symmetric and generating with `ρ = 2`; 2.4 needs total mass one.

## Layer 1: The spectral radius as an operator norm

### 1.1 Convolution, return probabilities and the spectral radius

Define the convolution `conv`, the convolution powers `convPow`, `IsSymmetricStep μ` (nonnegative,
`HasSum μ 1`, `μ(g⁻¹) = μ(g)`), the return probability `returnProb μ n = convPow μ n 1`, the
spectral radius `walkSpectralRadius μ = limsup_n (returnProb μ n)^(1/n)`, and the norm `l2Norm f`
of a real function, all as in the Conventions.

- Let `μ` be nonnegative and summable with sum `m`. By induction every `μ^{*n}` is nonnegative and
  summable with sum `mⁿ`, and every family in the definition of `μ * μ^{*n}` is summable: the
  double family `(a, b) ↦ μ(a) μ^{*n}(b)` has nonnegative terms and iterated sum `m · mⁿ`
  (`summable_prod_of_nonneg`), and `(a, b) ↦ (a, ab)` reindexes it (`Equiv.tsum_eq`). The same
  exchange of sums of nonnegative terms (`Summable.tsum_comm'`) gives associativity, so
  `μ^{*(j+n)} = μ^{*j} * μ^{*n}`. Hence `p_(j+n) ≥ p_j p_n` (keep the term `a = 1`,
  `Summable.le_tsum`) and `0 ≤ p_n ≤ mⁿ`, so `p_n^(1/n) ≤ m` and the `limsup` is over a bounded
  sequence.
- For `f, h` with summable squares, `‖μ * f‖₂ ≤ m ‖f‖₂`: by Cauchy–Schwarz for the weights `μ(s)`
  (`Real.inner_le_Lp_mul_Lq_tsum_of_nonneg` with exponents `2, 2`),
  `(Σ_s μ(s) |f(s⁻¹x)|)² ≤ m Σ_s μ(s) f(s⁻¹x)²`, and summing over `x` and exchanging the sums gives
  `m² ‖f‖₂²`. The double sum `Σ_x Σ_s μ(s) |f(s⁻¹x)| |h(x)|` is at most `m ‖f‖₂ ‖h‖₂`, so for
  symmetric `μ` the substitution `x = sy` gives `⟨μ * f, h⟩ = ⟨f, μ * h⟩`.
- For symmetric `μ`, `μ^{*n}(g⁻¹) = μ^{*n}(g)` (inversion reverses products, and the powers of
  `μ` commute by associativity), so `p_(2n) = Σ_g μ^{*n}(g)² = ‖μ^{*n}‖₂²`, and `p_n² ≤ p_(2n)`
  since `p_n = μ^{*n}(1)` is one of the terms.
- For a symmetric step measure, `μ^{*n}` is again one, `0 ≤ p_n ≤ 1` and `0 ≤ ρ(μ) ≤ 1`.
- For every `x : MonoidAlgebra ℝ G`, `convPow ⇑x.coeff n = ⇑(x ^ n).coeff`: by induction on
  `n`, since at each step the `tsum` runs over the finite support of `x` (`tsum_eq_sum`) and
  `MonoidAlgebra.coeff_mul`, summed over the second factor, is `Σ_a x(a) y(a⁻¹g)`; the case
  `n = 0` is `MonoidAlgebra.one_def`.

**Checks.**
- Free group of rank two, simple walk: `p₂ = 1/4` (the four letters, each followed by its
  inverse) and `p₄ = 28/256 = 7/64`: the `16` walks that step out and back twice and the `12` that
  go two steps out and return. In general `p₂ = 1/d` and `p₄ = (2d − 1)/d³` for `d = 2k`.
- The value of `μ^{*n}` at `1` is a return probability, not the total mass: the total mass of
  `μ^{*n}` is `1` for every `n`, which would give `ρ = 1` for every walk.
- Convolution order: `conv μ ν g` is `Σ_a μ(a) ν(a⁻¹g)`, not `Σ_a μ(a) ν(g a⁻¹)`; on a
  nonabelian group the two differ, and only the first agrees with `MonoidAlgebra.coeff_mul`
  (`δ_a * δ_b = δ_(ab)`).

### 1.2 Even return probabilities

Prove `tendsto_returnProb_two_mul_rpow`: if `μ` is nonnegative, summable and `μ(g⁻¹) = μ(g)`,
then `p_(2n)^(1/(2n)) → ρ(μ)` (Lyons–Peres, Proposition 6.6 and its proof, pp. 184–185, for the
network random walk of a connected network with condition (6.1); there `ρ` is also shown to be
`lim sup p_n(x, y)^(1/n)` for every pair of vertices. The statement here has neither a mass-one
nor a generating hypothesis, and the route below uses neither).

Route. If `μ = 0` both sides are `0` from `n = 1` on. Otherwise `p₂ = Σ μ(g)² > 0` and
`p_(2n) ≥ p₂ⁿ > 0` (1.1). Put `a_n = ‖μ^{*n}‖₂ = √p_(2n)`. Since convolution by `μ` is symmetric
for the `ℓ²` pairing (1.1), `a_(n+1)² = ⟨μ^{*n}, μ^{*(n+2)}⟩ ≤ a_n a_(n+2)` (Cauchy–Schwarz), so
the ratios `a_(n+1)/a_n` increase; they are at most the total mass `m` (the bound
`‖μ * f‖₂ ≤ m ‖f‖₂` of 1.1), so they converge to some `L`, and then `a_n^(1/n) → L` because
`log a_n / n` is an average of the logarithms of the ratios (`a₀ = 1`). Thus
`p_(2n)^(1/(2n)) → L`. From `p_n² ≤ p_(2n)`, `p_n^(1/n) ≤ p_(2n)^(1/(2n))`, so the `limsup` of
`p_n^(1/n)` is at most `L`, and the even terms give at least `L`; hence `ρ(μ) = L`.

*Needs:* 1.1; Mathlib `Filter.limsup`, `Filter.Tendsto.limsup_eq`, `Real.rpow`.

### 1.3 The operator norm

Prove `isLUB_l2Norm_mul_div`: under the hypotheses of 1.2, `ρ(μ)` is the least upper bound of
`‖μ * f‖₂ / ‖f‖₂` over nonzero finitely supported `f` (Lyons–Peres, Proposition 6.6 and its
proof, pp. 184–185, where the norm is that of the transition operator on `ℓ²(V, π)`; same
generality remark as in 1.2).

Route. The function `μ^{*n}` has summable squares but need not be finitely supported. Its
restrictions `f_j` to an increasing sequence of finite sets exhausting its countable support
satisfy `‖f_j − μ^{*n}‖₂ → 0`, hence `‖μ * f_j − μ^{*(n+1)}‖₂ → 0` by the bound of 1.1, so the
values at `f_j` tend to `a_(n+1)/a_n`, which tend to `ρ` (1.2); no number below `ρ` is an upper
bound. Conversely let `f ≥ 0` be nonzero and finitely supported, and `b_n = ‖μ^{*n} * f‖₂`. By
symmetry `b_(n+1)² ≤ b_n b_(n+2)`, and `b_n > 0` because `b_n² = ⟨μ^{*2n} * f, f⟩ ≥ f(x)² p_(2n)`
for any `x`. Hence `b₁/b₀ ≤ lim b_(n+1)/b_n = lim b_n^(1/n)`. By Cauchy–Schwarz and symmetry
`μ^{*2n}(z) = Σ_g μ^{*n}(g) μ^{*n}(g⁻¹z) ≤ p_(2n)` for every `z`, so
`b_n² = Σ_(x,y) f(x) f(y) μ^{*2n}(xy⁻¹) ≤ p_(2n) (Σ_x f(x))²`, and `lim b_n^(1/n) ≤ ρ` by 1.2.
For general `f`, `|μ * f| ≤ μ * |f|` pointwise since `μ ≥ 0`, so `‖μ * f‖₂ ≤ ρ ‖|f|‖₂ = ρ ‖f‖₂`.
For `μ = 0` every value is `0 = ρ`.

*Needs:* 1.1, 1.2; Mathlib `IsLUB`.

**Checks.**
- On the free group of rank two with the simple walk, `f = δ₁` gives `‖μ‖₂ = 1/2`, below
  `ρ = √3/2` (3.1); on `ℤ` with the simple walk, `f` the indicator of `{0, …, n − 1}` gives
  `√((n − 1)/n)` for `n ≥ 2` (and `√(1/2)` for `n = 1`), tending to `ρ = 1`.
- The adjacency sum `A = 4μ` of the free group of rank two has norm `4 · √3/2 = 2√3` on
  finitely supported functions, the value that FreeProbability uses (Scope and ownership below).
- Summability is needed in 1.2 and 1.3. Let `G = ⊕_(i ≥ 1) ℤ/2` with basis `e_i` and
  `μ(e_i) = 1/i`, `μ = 0` elsewhere: nonnegative, symmetric (`e_i` has order two), not summable.
  `μ^{*n}(g)` is the sum over index sequences `(i_1, …, i_n)` with `e_(i_1) + ⋯ + e_(i_n) = g` of
  `Π 1/i_j`: in such a sequence an index occurs an odd number of times exactly when it lies in
  the support of `g`, so grouping the sequences by their pattern of equal indices bounds the sum
  by `n^n · n^n · (Σ 1/i²)^n`; the terms are nonnegative, so every `tsum` in the recursion that
  defines `convPow μ` is over a summable family and equals this sum. Restricting to indices
  `≤ N` and averaging over signs, `p_(2n) ≥ E[(Σ_(i ≤ N) ε_i / i)^(2n)] ≥ 2^(−N) H_N^(2n)` for
  independent uniform signs `ε_i` and the harmonic number `H_N`, so `p_(2n)^(1/(2n)) → ∞`; the
  sequence `p_n^(1/n)` is unbounded, its real `limsup` is `0`, and 1.2 fails. For `f` the
  indicator of the span of `e_1, …, e_N`, `μ * f = H_N` on that span and `1/j` on its translate
  by `e_j` for `j > N` (so its squares are summable), the ratio of 1.3 is at least `H_N`, and the
  set of 1.3 has no upper bound.

### Examples

- `ρ` of a finite group, of `ℤ`, of `ℤᵈ` and of `ℚ` with any symmetric generating step measure is
  `1` (by 2.4, these groups being amenable); `ρ` of the free group of rank `k` is `√(2k − 1)/k`
  (3.1).

### Dependencies

Mathlib only.

## Layer 2: Expansion and Kesten's criterion

### 2.1 The expansion constant

Define `edgeBoundary μ K = Σ_s μ(s) |sK ∖ K|`, a `tsum` over `s ∈ G`, for a finite `K ⊆ G`, and
`expansionConst μ`, the infimum over finite nonempty `K` of `edgeBoundary μ K / |K|` (a real
infimum over a nonempty index set; for nonnegative `μ` the values are nonnegative, so it is
bounded below). For a symmetric step measure `0 ≤ Φ(μ) ≤ 1`, since `|sK ∖ K| ≤ |K|`. It is the
source's `Φ_E(G, c, π)` for the network of the Conventions, whose vertex weight `π`, the sum of
the conductances at a vertex, is `1` (Lyons–Peres, §6.1, p. 177, and §6.2, p. 183).

- For a finitely supported `f`, the Dirichlet form `E(f) = (1/2) Σ_x Σ_s μ(s) (f(sx) − f(x))²`
  converges absolutely (for each `s` only `x` in `supp f ∪ s⁻¹ supp f` contribute, and the inner
  sum is at most `4 ‖f‖₂²`) and satisfies `‖f‖₂² − ⟨μ * f, f⟩ = E(f)` when `μ` is a symmetric
  step measure (expand the square; `x ↦ sx` preserves `Σ_x f(x)²`, and the total mass is `1`).
  Also `E(1_K) = edgeBoundary μ K`: the steps from `K` out and the steps from outside into `K`
  contribute `|sK ∖ K|` and `|s⁻¹K ∖ K|`, and reindexing by `s ↦ s⁻¹` (`Equiv.tsum_eq`) and
  symmetry make the two weighted sums equal.

**Checks.**
- Free group of rank two, simple walk: `K = {1}` gives `1` (every step leaves). The ball of
  radius `r` has `2·3^r − 1` elements and `4·3^r` boundary edges of weight `1/4`, so the ratio is
  `3^r/(2·3^r − 1)`, decreasing to `1/2`. For rank `k`, `Φ = (k − 1)/k`: a finite `K` spans at
  most `|K| − 1` edges of the tree, so at least `2k|K| − 2(|K| − 1)` of the `2k|K|` steps from
  `K` leave it, and the ratio exceeds `(k − 1)/k`; balls approach it.
- With `|sK △ K| = 2|sK ∖ K|` in place of `|sK ∖ K|` the free group of rank two would get
  `Φ = 1`, and the first inequality of 2.2 would read `1 ≤ 1 − √3/2`, which is false.

### 2.2 Expansion and spectral radius

Prove `walkSpectralRadius_expansion_bounds`: for every symmetric step measure on every group,
`1 − √(1 − Φ²) ≤ 1 − ρ ≤ Φ` (Lyons–Peres, Theorem 6.7, p. 186, with its proof on pp. 186–187,
for a connected infinite network with condition (6.1). The statement here has no connectedness
and no infinitude hypothesis; on a finite group both sides vanish, and the route below uses
neither).

Route. Below `f`, `g`, `h` are finitely supported, and every double sum over `(x, s) ∈ G × G`
converges absolutely, by the bound `Σ_s μ(s) Σ_x |u(x)| |v(sx)| ≤ ‖u‖₂ ‖v‖₂` for the
factors that occur, so sums may be exchanged and reindexed.
1. (Right inequality.) For finite nonempty `K`, `⟨μ * 1_K, 1_K⟩ ≤ ‖μ * 1_K‖₂ ‖1_K‖₂ ≤ ρ |K|` by
   Cauchy–Schwarz and 1.3, so by 2.1 `1 − ρ ≤ E(1_K)/|K| = edgeBoundary μ K / |K|`; take the
   infimum.
2. (Rayleigh quotient.) Let `R` be the supremum of `⟨μ * f, f⟩ / ‖f‖₂²` over nonzero `f ≥ 0`.
   Since `μ ≥ 0`, `|⟨μ * h, h⟩| ≤ ⟨μ * |h|, |h|⟩ ≤ R ‖h‖₂²` for all `h`. By symmetry,
   `4⟨μ * f, g⟩ = ⟨μ * (f + g), f + g⟩ − ⟨μ * (f − g), f − g⟩ ≤ 2R(‖f‖₂² + ‖g‖₂²)`, so
   `⟨μ * f, g⟩ ≤ R` when `‖f‖₂ = ‖g‖₂ = 1`. Take `‖f‖₂ = 1`, `u = μ * f` (summable squares, by
   1.1) and `g = u_j / ‖u_j‖₂` for the restrictions `u_j` of `u` to an increasing exhaustion of
   `G` by finite sets (for `u ≠ 0`): `⟨u, g⟩ = ‖u_j‖₂ → ‖u‖₂`. So `‖μ * f‖₂ ≤ R`, and `ρ ≤ R` by
   1.3. (The source leaves this to Exercise 6.7, p. 184; this is a complete proof.)
3. (Coarea, Lyons–Peres Lemma 6.8, p. 186.) For nonnegative `g`,
   `Φ Σ_x g(x) ≤ Σ_x Σ_s μ(s) (g(x) − g(sx))⁺`. List the positive values `t₁ < ⋯ < t_m` of
   `g`, `t₀ = 0`, and put `K_j = {g ≥ t_j}` (finite, nonempty). Then
   `Σ_x g(x) = Σ_j (t_j − t_(j−1)) |K_j|`, and the pair `(x, s)` is counted in
   `{x ∈ K_j : sx ∉ K_j}` exactly when `g(sx) < t_j ≤ g(x)`, so (a finite sum over `j` of sums of
   nonnegative terms) `Σ_j (t_j − t_(j−1)) edgeBoundary μ K_j = Σ_(x,s) μ(s) (g(x) − g(sx))⁺`.
   Apply `edgeBoundary μ K_j ≥ Φ |K_j|`. By the bijection `(x, s) ↦ (sx, s⁻¹)` of `G × G` and
   symmetry the right side equals `Σ_(x,s) μ(s) (g(sx) − g(x))⁺`, hence is
   `(1/2) Σ_(x,s) μ(s) |g(sx) − g(x)|`. (The identity is the counting-measure case of Tau Ceti's
   `TauCeti.lintegral_ofReal_sub_eq_lintegral_measure`, which writes `∫ (g − f)⁺` as the integral
   over levels `s` of the measure of `{f ≤ s < g}`;
   `TauCeti.exists_finset_sum_card_smul_symmDiff_lt_of_sum_tsum_lt` uses superlevel sets in the
   same way, with unit weights, to select a single level.)
4. (Cauchy–Schwarz.) For nonzero `f ≥ 0` apply step 3 to `g = f²`:
   `Φ ‖f‖₂² ≤ (1/2) Σ μ(s) |f(sx) − f(x)| (f(sx) + f(x)) ≤ √E(f) · √(2‖f‖₂² − E(f))`, because
   `(1/2) Σ μ(s) (f(sx) + f(x))² = ‖f‖₂² + ⟨μ * f, f⟩` (mass one, and `x ↦ sx` preserves
   `Σ f²`). With `t = E(f)/‖f‖₂²` this is `Φ² ≤ t(2 − t)`, i.e. `(1 − t)² ≤ 1 − Φ²`, so
   `⟨μ * f, f⟩ / ‖f‖₂² = 1 − t ≤ √(1 − Φ²)`. By step 2, `ρ ≤ √(1 − Φ²)`.

Loops (`s = 1`) contribute `0` to `E` and to every edge boundary. *Needs:* 1.1, 1.3, 2.1; Mathlib
`ciInf_le`, `le_ciInf`, `Real.sqrt`, `Summable.tsum_comm'`, `Equiv.tsum_eq`.

**Checks.**
- Free groups: with `Φ = (k − 1)/k` (2.1) and `ρ = √(2k − 1)/k` (3.1),
  `√(1 − Φ²) = √(2k − 1)/k = ρ`, so the middle inequality is an equality, and
  `1 − ρ ≤ Φ` reads `1 − √3/2 ≤ 1/2` for `k = 2`.
- Lazy walk on the free group of rank two, `δ₁/2 + μ/2`: `Φ = 1/4` and `ρ = 1/2 + √3/4` (the
  Rayleigh quotient of step 2 is affine in the measure, and the quotient for `μ` has supremum
  `ρ(μ)` by steps 1–2), and indeed `1 − √15/4 ≤ 1/2 − √3/4 ≤ 1/4`.
- The source's further inequality `Φ²/2 ≤ 1 − √(1 − Φ²)` follows from `√(1 − x) ≤ 1 − x/2`.
- Mass one is needed: `δ₁/2` on the trivial group has `ρ = 1/2` and `Φ = 0`, and
  `1 − ρ = 1/2 > 0`. Symmetry is needed: `δ₁` on `ℤ` has `ρ = 0` and `Φ = 0` (the ratio for
  `{0, …, n − 1}` is `1/n`), and `1 − ρ = 1 > 0`.

### 2.3 Expansion and Følner sets

Prove `expansionConst_eq_zero_iff_hasFoelnerSets`: if `μ` is nonnegative and summable and its
support generates `G`, then `Φ(μ) = 0` if and only if `G` has Følner sets
(`TauCeti.HasFoelnerSets G`). (Proved here. Lyons–Peres, §6.1, pp. 180–181, explain the comparison
for Cayley graphs of finitely generated groups and refer to Paterson for Følner's converse; the
converse is the Tau Ceti theorem cited in 2.4.)

Route. Use `TauCeti.hasFoelnerSets_iff`, the finite-test form `|gF △ F| < ε|F|`, and
`|gF △ F| = 2|gF ∖ F|` (`Finset.card_smul_finset_symmDiff`). Let `m = Σ_s μ(s)`.
- If `G` has Følner sets: for `ε > 0` choose a finite `S ⊆ G` with `Σ_(s ∉ S) μ(s) < ε`
  (`tendsto_tsum_compl_atTop_zero`), and `F` passing the test for `S` and `ε`. Split the sum
  defining `edgeBoundary μ F` over `S` and its complement, using `|sF ∖ F| < (ε/2)|F|` on `S` and
  `|sF ∖ F| ≤ |F|` off it: `edgeBoundary μ F / |F| ≤ (ε/2) m + ε`. So `0 ≤ Φ ≤ ε(m/2 + 1)` for
  every `ε > 0`.
- If `Φ = 0`: if the support is empty then `G = Subgroup.closure ∅` is trivial and `F = {1}`
  passes every test. Otherwise let `K` be a finite test set and `ε > 0`. Every `g ∈ K` is a
  product of `L_g` elements of the support and their inverses (`Subgroup.closure_toSubmonoid`,
  `Submonoid.closure_induction`); let `S` be the finite set of support elements used for all
  `g ∈ K`, and `c > 0` the least value of `μ` on `S`. For `δ > 0` take `F` with
  `edgeBoundary μ F < δ c |F|` (`exists_lt_of_ciInf_lt`); since every term of the sum is
  nonnegative (`Summable.le_tsum`), `|sF △ F| < 2δ|F|` for each `s ∈ S`, and also for `s⁻¹`,
  since translation by `s` preserves cardinalities and symmetric differences. Then
  `|ghF △ F| ≤ |hF △ F| + |gF △ F|` by the triangle inequality for `△` and translation
  invariance; choose `δ` with `2δ max_(g ∈ K) L_g < ε`.

*Needs:* 2.1; Tau Ceti `TauCeti.HasFoelnerSets`, `TauCeti.hasFoelnerSets_iff`,
`Finset.card_smul_finset_symmDiff`; Mathlib `Subgroup.closure_toSubmonoid`,
`Submonoid.closure_induction`, `symmDiff_triangle`, `Finset.card_smul_finset`, `ciInf_le`,
`exists_lt_of_ciInf_lt`, `tendsto_tsum_compl_atTop_zero`, `Summable.le_tsum`.

**Checks.**
- The point mass at `1` on the free group of rank two has `Φ = 0` but generates only `{1}`, and
  that group has no Følner sets (AmenableGroups Layers 3 and 5).
- Summability is needed: `μ ≡ 1` on the free group of rank two is symmetric with generating
  support. For finite nonempty `K`, `sK` meets `K` only for the finitely many `s ∈ KK⁻¹`, so
  `|sK ∖ K| = |K|` for all other `s`, the family is not summable, `edgeBoundary μ K = 0` and
  `Φ = 0`, while that group has no Følner sets.
- Nonnegativity is needed: `−(δ₁ + δ₋₁)/2` on `ℤ` has `Φ = −1`, attained at `K = {0}` (every
  ratio is at least `−1`, as `|sK ∖ K| ≤ |K|`), while `ℤ` has Følner sets.
- Symmetry and total mass play no role: `δ₁` on `ℤ` has `Φ = 0`, and `ℤ` has Følner sets.

### 2.4 Kesten's criterion

Prove `walkSpectralRadius_eq_one_iff_amenable`: for a symmetric step measure whose support
generates the discrete group `G`, `ρ(μ) = 1` if and only if `G` is amenable (Kesten 1959, as
stated in Lyons–Peres, §6.10 Notes, p. 224, for countable groups and symmetric walks whose
support generates the group; the network form, `ρ < 1` exactly for nonamenable networks, follows
Theorem 6.7 on p. 186).

Route. If `ρ = 1`, the first inequality of 2.2 gives `√(1 − Φ²) ≥ 1`, so `Φ = 0`; if `Φ = 0`,
the second gives `ρ ≥ 1`, and `ρ ≤ 1` by 1.1. So `ρ = 1 ⇔ Φ = 0 ⇔ HasFoelnerSets G` by 2.3
(summability is part of `HasSum μ 1`), and `TauCeti.amenable_iff_hasFoelnerSets` (the
realization of AmenableGroups Layer 5) finishes.

*Needs:* 1.1, 2.2, 2.3; Tau Ceti `TauCeti.Amenable`, `TauCeti.amenable_iff_hasFoelnerSets`.

**Checks.**
- The free group of rank two is not amenable (AmenableGroups Layer 3; Tau Ceti
  `TauCeti.not_amenable_freeGroup`), and its simple walk has `ρ = √3/2 < 1` (3.1). With infinite
  support: `μ = Σ_(n ≥ 1) 2^(−n) ν^{*n}`, for the simple walk `ν`, is a symmetric step measure
  whose support is the whole group, and `μ * f = Σ_n 2^(−n) ν^{*n} * f`, so by 1.3 for `ν` and
  then for `μ`, `ρ(μ) ≤ Σ_n 2^(−n) (√3/2)ⁿ = (3 + 4√3)/13 < 1`.
- Every finite group is amenable (AmenableGroups Layer 2), and its symmetric generating walks
  have `ρ = 1` by the Cauchy–Schwarz bound of the Conventions.
- `ℚ` is not finitely generated, so no finitely supported walk generates it. Let
  `μ(±1/n!) = 2^(−n−1)` for `n ≥ 1`: a symmetric step measure, generating since
  `p/q = p (q − 1)! · (1/q!)`. For `K = {j/m! : 0 ≤ j < N}`, a step `±1/n!` with `n ≤ m` moves
  `min(m!/n!, N)` points out of `K`, and one with `n > m` moves all `N` (as `1/n! ∉ (1/m!)ℤ`), so
  `edgeBoundary μ K / N ≤ m · m!/N + 2^(−m)`; with `N = m · m! · 2^m` this is at most `2^(1−m)`.
  So `Φ = 0` and `ρ = 1` by 2.2, as 2.4 gives for the amenable group `ℚ`.

### Examples

- For any countable group, `ρ` is `1` for one symmetric generating step measure exactly when it is
  `1` for all of them, since both conditions say that the group is amenable.

### Dependencies

Layer 1; Tau Ceti's amenability library (AmenableGroups Layer 5).

## Layer 3: Free groups and cogrowth

### 3.1 The free group

Define `freeGroupStep k`, mass `1/(2k)` on each `FreeGroup.of i` and its inverse, an element of
`MonoidAlgebra ℝ F_k`. Prove `walkSpectralRadius_freeGroupStep`: for `k ≥ 1`, the spectral radius
of its coefficient function is `√(2k − 1)/k`, that is `2√b/d` with `d = 2k` and `b = 2k − 1`
(Lyons–Peres, §6.3, formulas (6.21)–(6.25) with their derivation, pp. 188–189, for the
`d`-regular tree, whose closed walks at the root are the words reducing to `1`; also Exercise 6.9,
p. 187).

Route. Write `R = MonoidAlgebra ℝ F_k`, `A = Σ_σ σ ∈ R` over the `2k` letters and `A_m ∈ R` the
sum of the reduced words of length `m`. By 1.1, `p_n` is the coefficient of `(A/d)ⁿ` at `1`, so
`p_n = c_n/dⁿ` with `c_n` the number of words of length `n` reducing to `1`.
1. (Recursion, the source's (6.21).) Left multiplication by a letter lengthens a reduced word
   unless it cancels its first letter, so `A·A₁ = A₂ + d·1` and `A·A_m = A_(m+1) + b·A_(m−1)` for
   `m ≥ 2`, with `A₀ = 1` and `A₁ = A`.
2. (Carrier.) Work in the formal power series ring `PowerSeries R` (coefficients in the
   noncommutative ring `R`, variable `z` central). With `S = PowerSeries.mk (fun m => A_m)` and
   `u = 1 + b z² − z · PowerSeries.C A`, step 1 says, coefficient by coefficient, `u S = 1 − z²`.
   The constant coefficient of `u` is `1`, so `v = PowerSeries.invOfUnit u 1` satisfies
   `v u = 1` (`PowerSeries.invOfUnit_mul`), and `S = v (1 − z²)`.
3. (Geometric expansion.) Let `q = (1 + bz²)⁻¹` and `W = zq` in `ℝ⟦z⟧`, mapped into `PowerSeries R`
   as central scalars. The series `v' = Σ_n q Wⁿ Aⁿ` has, in degree `m`, only the terms `n ≤ m`,
   and `u v' = Σ_n (Wⁿ Aⁿ − W^(n+1) A^(n+1)) = 1`; so `v' = v u v' = v`.
4. (Coefficient at `1`.) The map `τ : R → ℝ`, `x ↦ x.coeff 1`, is `ℝ`-linear, so applying it to
   each coefficient commutes with multiplication by series in `ℝ⟦z⟧`. It sends `A_0` to `1`,
   `A_m` to `0` for `m ≥ 1`, and `Aⁿ` to `c_n`. Hence, in `ℝ⟦z⟧`,
   `1 = ((1 − z²)/(1 + bz²)) · C(W)`, where `C(W) = Σ_n c_n Wⁿ` is the substitution
   `PowerSeries.subst W (PowerSeries.mk c)` (`W` has constant coefficient `0`,
   `PowerSeries.HasSubst.of_constantCoeff_zero'`): the source's (6.23).
5. (Closed form, (6.24).) As `0 ≤ c_n ≤ dⁿ` and `W` converges near `0`, the double series behind
   `C(W(z))` converges absolutely for small real `z`, so `C(W(z)) = (1 + bz²)/(1 − z²)` there.
   For small real `w` put `z = (1 − √(1 − 4bw²))/(2bw)` (`z = 0` at `w = 0`), the root near `0` of
   `W(z) = w`; then `C(w) = (1 + bz²)/(1 − z²) = 2b / (b − 1 + (b + 1)√(1 − 4bw²))`.
6. (Radius.) The right side is analytic on `|w| < 1/(2√b)` (the principal root has positive real
   part there, so the denominator does not vanish), so the radius of convergence `R₀` of `C` is
   at least `1/(2√b)`. On `[0, 1/(2√b))` the series has nonnegative coefficients and equals the
   right side; as `w → 1/(2√b)` the right side tends to `+∞` when `b = 1` and its derivative does
   when `b ≥ 2`, which a series converging at some point beyond `1/(2√b)` would forbid. So
   `R₀ = 1/(2√b)`, and Cauchy–Hadamard (`FormalMultilinearSeries.radius_inv_eq_limsup`) gives
   `limsup c_n^(1/n) = 2√b`, hence `ρ = 2√b/d`.

*Needs:* 1.1; Mathlib `MonoidAlgebra.single`, `MonoidAlgebra.coeff_mul`, `FreeGroup.of`,
`FreeGroup.toWord`, `FreeGroup.norm`, `PowerSeries.mk`, `PowerSeries.C`, `PowerSeries.invOfUnit`,
`PowerSeries.invOfUnit_mul`, `PowerSeries.subst`, `PowerSeries.HasSubst.of_constantCoeff_zero'`,
`FormalMultilinearSeries.radius_inv_eq_limsup`.

**Checks.**
- `k = 1`: `ℤ` with the simple walk, `ρ = 1 = √1/1`.
- `k = 2`: `ρ = √3/2`; the coefficients of (6.24) for `b = 3` begin `1, 0, 4, 0, 28, 0, 232`,
  agreeing with the walk counts `c₀, …, c₆` (`c₂ = d`, `c₄ = 2d² − d`), and the same agreement
  holds through `w¹⁶` for `k = 1, 2, 3`.
- Steps 1–4 in exact arithmetic: `A_m = P_m(A)` for the polynomials `P₀ = 1`, `P₁ = Y`,
  `P₂ = Y² − d`, `P_(m+1) = Y P_m − b P_(m−1)` (checked in the group algebra for `k = 1, 2`,
  `m ≤ 6`); `(1 + bz² − zY) Σ_m P_m z^m = 1 − z²` through `z¹⁴`; and
  `((1 − z²)/(1 + bz²)) Σ_n c_n Wⁿ = 1` through `z¹⁴`, for `k = 1, 2, 3`.

### 3.2 Images of the free walk

Prove `walkSpectralRadius_freeGroupStep_le_map`: for `k ≥ 1` and every homomorphism
`φ : F_k → Γ` into any group, `√(2k − 1)/k ≤ ρ(φ_* μ)`, where `μ` is the simple walk and `ρ` is
taken of the coefficient function of `φ_* μ` (Lyons–Peres, proof of Theorem 6.10, last
paragraph, p. 190, by coupling with the covering tree).

Route. `MonoidAlgebra.mapDomain φ` is a ring homomorphism (`MonoidAlgebra.mapDomainRingHom`), so
`(φ_* μ)ⁿ = φ_*(μⁿ)`, and by 1.1 the return probability of `φ_* μ` is its coefficient at `1`,
`Σ_(g ∈ ker φ) μⁿ(g) ≥ μⁿ(1)` because the coefficients are nonnegative
(`Finsupp.mapDomain_apply`). Real powers and `limsup` of bounded sequences are monotone; apply
3.1.

*Needs:* 1.1, 3.1; Mathlib `MonoidAlgebra.mapDomain`, `MonoidAlgebra.mapDomainRingHom`,
`MonoidAlgebra.mapDomain_mul`, `Finsupp.mapDomain_apply`.

**Checks.**
- For `Γ` trivial, or finite, `ρ = 1`, above `√(2k − 1)/k`, which is `< 1` for `k ≥ 2`.

### 3.3 Cogrowth

Define `cogrowth φ = limsup_n |{w ∈ ker φ : |w| = n}|^(1/n)` for `φ : F_k → Γ`, counting reduced
words of length `n` in the kernel (Mathlib's `Nat.card` of a finite set). It is at most `2k − 1`,
since there are `2k(2k − 1)^(n−1)` reduced words of length `n ≥ 1`, and it is `0` when `φ` is
injective. Prove `cogrowth_formula`: for `k ≥ 1`, with `b = 2k − 1`, `c = cogrowth φ` and
`ρ = ρ(φ_* μ)`,

```text
c > √b  ⟺  ρ > √b / k ;      if c > √b then 2kρ = b/c + c ;      if c ≤ √b then ρ = √b / k
```

(Lyons–Peres, Theorem 6.10, p. 190, with its proof, for a `d`-regular connected multigraph;
due to Grigorchuk (1980) for Cayley graphs and Northshield (1992) in general, as attributed on
p. 189). The statement here has no surjectivity hypothesis: the walk only sees the image of `φ`.

Route. Apply the ring homomorphism `PowerSeries.map (MonoidAlgebra.mapDomainRingHom ℝ φ)` to the
identities `u S = 1 − z²` and `v' = v` of 3.1, steps 2–3; they become the same identities in
`PowerSeries (MonoidAlgebra ℝ Γ)` with `φ_* A` and `φ_* A_m` in place of `A` and `A_m`. Apply the
coefficient at `1 ∈ Γ` to each coefficient, as in 3.1, step 4: with `b_m` the kernel counts (the
coefficient of `φ_* A_m` at `1`) and `c_n = dⁿ p_n` the counts of words of length `n` with image
`1`, the source's identity (6.23) holds in `ℝ⟦z⟧`:
`Σ_m b_m z^m = ((1 − z²)/(1 + bz²)) Σ_n c_n ψ(z)ⁿ` with `ψ(z) = z/(1 + bz²)`, and, by the
convergence remark of 3.1, step 5, as an identity of convergent series for small real `z`. The
two series have nonnegative coefficients and radii `1/c` (infinite when `c = 0`) and `1/(dρ)` by
Cauchy–Hadamard. The source's comparison of the first real singularities, through the
monotonicity of `ψ` on `[0, 1/√b]` and Pringsheim's theorem, gives the first two clauses; the
third follows from the first and 3.2. Pringsheim's theorem (Exercise 6.58 of the source) needs a
proof: if `Σ aₙ zⁿ` has `aₙ ≥ 0` and radius `R` with `0 < R < ∞` and its sum extends analytically
to a neighbourhood of `R`, then for `r < R` near `R` the Taylor coefficients at `r`,
`Σ_n C(n, j) aₙ r^(n−j)`, are nonnegative and the Taylor series converges at `R + δ` for some
`δ > 0`; summing the double series of nonnegative terms in the other order gives
`Σ aₙ (R + δ)ⁿ < ∞`, contradicting the radius.

*Needs:* 3.1, 3.2; Mathlib `MonoidAlgebra.mapDomainRingHom`, `PowerSeries.map`, `FreeGroup.norm`,
`Nat.card`, `FormalMultilinearSeries.radius_inv_eq_limsup`, `Filter.limsup`.

**Checks.**
- `φ` trivial (`Γ = 1`): every reduced word is in the kernel, `c = 2k − 1`, and the formula gives
  `2kρ = 1 + (2k − 1)`, i.e. `ρ = 1`. Counting all words instead of reduced ones would give
  `2k`, and `2kρ = (2k − 1)/(2k) + 2k > 2k` would contradict `ρ ≤ 1`.
- `φ` injective: `c = 0 ≤ √b` and `ρ = √b/k` (3.1). For `k = 1` every `φ` has `c ≤ 1 = √b`
  (at most two reduced words of each length) and `ρ = 1`.
- For `φ : F₂ → ℤ/5` with `a ↦ 1`, `b ↦ 2`, the kernel counts are `b₁, …, b₆ = 0, 0, 12, 24,
  48, 204`, and the identity (6.23) holds exactly through `z¹⁸`, as does `b_m = τ'(P_m)` for the
  polynomials `P_m` of 3.1 and the functional `τ'(Yⁿ) = c_n`. Both also hold for `b ↦ 0`, where
  `b^(±1)` are loops of the Cayley graph (`b₁ = 2`), for `F₂ → 1`, and for two transpositions in
  `S₃`.

### 3.4 Grigorchuk's criterion

Prove `amenable_iff_cogrowth_eq`: for `k ≥ 2` and a surjective `φ : F_k → Γ` onto a discrete
group, `Γ` is amenable if and only if `cogrowth φ = 2k − 1`. (Proved here. Lyons–Peres pose the
spectral form, `ρ = 1` exactly when the cogrowth is `d − 1`, for `d`-regular multigraphs as
Exercise 6.10, p. 191; see the Checks for the case `d = 2`.)

Route. The coefficient function of `φ_* μ` is a symmetric step measure whose support is the set
of images of the letters (`Finsupp.fun_support_eq`; the coefficients are sums of positive
terms), which generates `Γ`, so by 2.4 `Γ` is amenable iff `ρ = 1`. For `k ≥ 2`, `√b < b` and
`√b/k < 1` (as `2k − 1 < k²`). If `c = b`, then `c > √b` and 3.3 gives `2kρ = 1 + b = 2k`. If
`ρ = 1 > √b/k`, then 3.3 gives `c > √b` and `2k = b/c + c`, so `c² − 2kc + b = 0`, `c ∈ {1, b}`,
and `c > √b > 1` leaves `c = b`.

*Needs:* 2.4, 3.3; Mathlib `MonoidAlgebra.mapDomain`, `Finsupp.fun_support_eq`.

**Checks.**
- `k = 1` is excluded: `φ = id : F₁ → F₁ ≅ ℤ` has amenable target and `c = 0 ≠ 1`. For `d = 2`
  the source's Exercise 6.10 fails in the same way on the line `ℤ`.
- Surjectivity is needed: the trivial homomorphism `F₂ → F₂` has `c = 3`, while `F₂` is not
  amenable.
- `F₂ → ℤ²` (abelianization) is onto an amenable group, so its kernel has cogrowth `3`.

### Examples

- Free groups of rank `k ≥ 2` and their nontrivial images: `ρ ≥ √(2k − 1)/k`, with equality for
  the free group itself.

### Dependencies

Layers 1 and 2 (and, through 2.4, Tau Ceti's amenability library); Mathlib's free groups, formal
power series and Cauchy–Hadamard.

## Scope and ownership

This roadmap owns the spectral radius of symmetric random walks on groups with summable step
distributions of arbitrary support, its identification with the `ℓ²` norm, the expansion
inequalities for such walks, Kesten's criterion, the free-group value, the lower bound for images
of the free walk, the cogrowth formula and Grigorchuk's criterion, all stated above.

- **AmenableGroups** (realized in Tau Ceti) owns amenability, Følner sets and their equivalence
  for discrete groups (Layer 5) and the nonamenability of the free group of rank two (Layer 3);
  they are cited, never restated. It mentions no random walk.
- **OperatorAlgebraDynamics**, D2, recalls Kesten's theorem, through de la Harpe, in a Check on
  the free group of rank two (the spectrum of `λ(h)/4` lies in `[−1, 1 − ε]`), to show that the
  regular representation is not injective on the full group C*-algebra. It states no theorem on
  random walks and no criterion; this roadmap states no C*-algebra and does not depend on it.
- **FreeProbability**, F3, asks in its prose, for its full-versus-reduced example, that the
  adjacency sum of the four generators and inverses of the free group of rank two be shown to
  have norm `2√3` on `ℓ²(F₂)`, by a shift operator and radial vectors, using the reduced-word
  interface of OperatorKTheory K7.FreeGroups; its `Suggested.lean` declares no statement about
  free groups.
  No target here is that norm statement: 3.1 is the decay rate of return probabilities for every
  rank, computed from generating functions, and 1.3 identifies such rates with norms of
  convolution operators on finitely supported real functions; together they give `2√3` at rank
  two (Check of 1.3). Neither roadmap depends on the other.
- Not treated here: convergence to uniformity and mixing times of walks on finite groups (where
  `ρ = 1`); the Alon–Boppana bound for finite `d`-regular graphs, whose constant `2√(d − 1)` is
  `d` times the tree value of 3.1 when `d = 2k`; branching processes.
- Not treated here: Kesten's strict inequality `ρ > √(2k − 1)/k` for proper quotients of free
  groups of rank `k ≥ 2` (Lyons–Peres, Theorem 6.11, p. 191), regular trees of odd degree
  (Cayley graphs of free products of copies of `ℤ/2`), non-symmetric walks, the speed of the walk
  and the spectral measure (Kesten–McKay law).

## Exact supplier contracts

### From Mathlib

- Summation (`Mathlib/Topology/Algebra/InfiniteSum/`): `tsum_eq_zero_of_not_summable`
  (`Defs.lean`); `tsum_eq_sum` (a `tsum` over a family vanishing off a finite set) and
  `Equiv.tsum_eq` (`Basic.lean`); `Summable.le_tsum` (a term of a summable family whose other
  terms are nonnegative is at most the sum; `Order.lean`); `Summable.tsum_comm'` (exchange of an
  iterated sum when the uncurried family and its sections are summable; `Constructions.lean`);
  `Summable.countable_support` and `tendsto_tsum_compl_atTop_zero` (the sum over the complement
  of a finite set tends to `0` along finite sets; `Group.lean`); `summable_prod_of_nonneg` (a
  nonnegative family on a product is summable iff its sections and the sums of its sections are;
  `Real.lean`).
- `Real.inner_le_Lp_mul_Lq_tsum_of_nonneg` (`Mathlib/Analysis/MeanInequalities.lean`: Hölder's
  inequality for `tsum`s of nonnegative functions with summable powers).
- `MonoidAlgebra ℝ G` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean`): a structure with field
  `coeff : G →₀ ℝ`; its product is convolution, `MonoidAlgebra.coeff_mul`
  (`(x * y).coeff m` is the sum of `x.coeff a * y.coeff b` over `a * b = m`, with
  `[DecidableEq G]`); `MonoidAlgebra.single`, `MonoidAlgebra.one_def`.
- `MonoidAlgebra.mapDomain`, `MonoidAlgebra.mapDomain_mul` (for a multiplicative map)
  (`Mathlib/Algebra/MonoidAlgebra/MapDomain.lean`), `MonoidAlgebra.mapDomainRingHom` (same file;
  a ring homomorphism for a monoid homomorphism), `Finsupp.mapDomain_apply`
  (`Mathlib/Data/Finsupp/Basic.lean`), `Finsupp.fun_support_eq`
  (`Mathlib/Data/Finsupp/Defs.lean`).
- Formal power series (`Mathlib/RingTheory/PowerSeries/`): `PowerSeries.mk`, `PowerSeries.C`,
  `PowerSeries.map` (`Basic.lean`; for a semiring, commutative or not); `PowerSeries.invOfUnit`
  and `PowerSeries.invOfUnit_mul` (`Inverse.lean`: for a ring `R` and a unit `u` equal to the
  constant coefficient of `φ`, `invOfUnit φ u * φ = 1`); `PowerSeries.subst` and
  `PowerSeries.HasSubst.of_constantCoeff_zero'` (`Substitution.lean`: substitution of a series
  with constant coefficient `0`, over commutative rings).
- `FreeGroup.of` (`Mathlib/GroupTheory/FreeGroup/Basic.lean`), `FreeGroup.toWord` and
  `FreeGroup.norm` (`Mathlib/GroupTheory/FreeGroup/Reduce.lean`; `norm` is the length of
  `toWord`, with `[DecidableEq α]`).
- `Subgroup.closure`, `Subgroup.closure_toSubmonoid`
  (`Mathlib/Algebra/Group/Subgroup/Pointwise.lean`: the closure as a submonoid is the submonoid
  closure of `S ∪ S⁻¹`), `Submonoid.closure_induction`
  (`Mathlib/Algebra/Group/Submonoid/Basic.lean`).
- `symmDiff_triangle` (`Mathlib/Order/SymmDiff.lean`), `Finset.card_smul_finset`
  (`Mathlib/Algebra/Group/Action/Pointwise/Finset.lean`, for a left-cancellative action).
- `Filter.limsup` (`Mathlib/Order/LiminfLimsup.lean`), `Filter.Tendsto.limsup_eq`
  (`Mathlib/Topology/Order/LiminfLimsup.lean`), `ciInf_le`, `le_ciInf`, `exists_lt_of_ciInf_lt`
  (`Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`; bounded below, nonempty index),
  `Real.sInf_empty` (`Mathlib/Algebra/Order/Archimedean/Real/Basic.lean`: `sInf ∅ = 0` in `ℝ`),
  `IsLUB`, `Real.sqrt`, `Real.rpow`, `Nat.card`.
- `FormalMultilinearSeries.radius_inv_eq_limsup` (`Mathlib/Analysis/Analytic/RadiusLiminf.lean`):
  the inverse radius of convergence is the `limsup` of the `n`-th roots of the coefficient norms.

### From Tau Ceti

- `TauCeti.Amenable G` (`TauCeti/GroupTheory/Amenable/Basic.lean`): a left-invariant mean on
  `UCB G`, for `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`; with the discrete
  topology the instance `IsTopologicalGroup` is inferred.
- `TauCeti.HasFoelnerSets G` and `TauCeti.hasFoelnerSets_iff` (`[DecidableEq G]`: Følner sets
  exactly when every finite `K` and `ε > 0` admit a finite nonempty `F` with `|gF △ F| < ε|F|` for
  `g ∈ K`) (`TauCeti/GroupTheory/Amenable/Foelner.lean`).
- `TauCeti.amenable_iff_hasFoelnerSets` (`TauCeti/GroupTheory/Amenable/DiscreteFoelner.lean`,
  `[DiscreteTopology G]`).
- `Finset.card_smul_finset_symmDiff` (`TauCeti/Algebra/Group/Action/Pointwise/Finset.lean`:
  `|gF △ F| = 2 |gF ∖ F|` for a left-cancellative action).
- `TauCeti.not_amenable_freeGroup` (`TauCeti/GroupTheory/Amenable/FreeGroup.lean`: a free group
  on a nontrivial type with the discrete topology is not amenable), used only in Checks.
- `TauCeti.lintegral_ofReal_sub_eq_lintegral_measure`
  (`TauCeti/MeasureTheory/Integral/LayerCake.lean`: for an s-finite measure, `∫ (g − f)⁺` is the
  integral over `s` of the measure of `{f ≤ s < g}`) and
  `TauCeti.exists_finset_sum_card_smul_symmDiff_lt_of_sum_tsum_lt`
  (`TauCeti/GroupTheory/Amenable/Reiter.lean`: a superlevel set with small total boundary for unit
  weights), both named in 2.2, step 3; the weighted identity used there is proved in the route.

### From TauCetiRoadmap.AmenableGroups

- Layer 5 (Følner criteria for arbitrary discrete groups): the characterization of amenable
  discrete groups by Følner sets, realized by the Tau Ceti declarations above and used in 2.3 and
  2.4. Layer 3 (equidecompositions and the free-group obstruction) and Layers 2 and 6 (finite and
  abelian groups) are used only in Checks.

## References

- Russell Lyons and Yuval Peres, *Probability on Trees and Networks*, Cambridge University Press,
  2016; corrected version of 19 August 2026 on the first author's page,
  https://rdlyons.pages.iu.edu/prbtree/book.pdf. Used: §6.1 (pp. 176–181) with condition (6.1),
  Proposition 6.6 (p. 184), Theorem 6.7 and Lemma 6.8 (p. 186), Exercises 6.7 and 6.9
  (pp. 184, 187), §6.3 with (6.21)–(6.25) (pp. 188–189), Theorem 6.10 (p. 190), Exercise 6.10
  (p. 191), Notes §6.10 (p. 224). Page numbers are those printed in that version.
- Harry Kesten, Symmetric random walks on groups, *Trans. Amer. Math. Soc.* 92 (1959), no. 2,
  336–354, https://doi.org/10.1090/S0002-9947-1959-0109367-6. Named for attribution, not
  consulted.
- Harry Kesten, Full Banach mean values on countable groups, *Math. Scand.* 7 (1959), 146–156,
  https://doi.org/10.7146/math.scand.a-10568. Named for attribution, not consulted.
- R. I. Grigorchuk, Symmetrical random walks on discrete groups (1980). No DOI is registered for
  it; Lyons–Peres list it in *Multicomponent Random Systems*, Adv. Probab. Related Topics 6,
  Dekker, New York, pp. 285–325. Named for attribution, not consulted.
- S. Northshield, Cogrowth of regular graphs, *Proc. Amer. Math. Soc.* 116 (1992), no. 1,
  203–205, https://doi.org/10.1090/S0002-9939-1992-1120509-0. Named for attribution, not
  consulted.
