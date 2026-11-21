# Roadmap: Kesten's amenability criterion and the spectral radius of random walks on groups

**Summary.** A symmetric random walk on a group `G` starts at the identity and at each step
multiplies its position on the left by an independent element drawn from a fixed probability `μ`.
Here `μ` is finitely supported and symmetric (`μ(g⁻¹) = μ(g)`); no countability, finiteness or
generation hypothesis is standing. The probability `p_n` of being back at the identity after `n`
steps decays at an exponential rate `ρ(μ) = limsup p_n^(1/n)`, the spectral radius of the walk.
Kesten showed in 1959 that this rate detects amenability. This roadmap proves his criterion in
quantitative form, computes the rate on free groups, and links it to the growth of the kernel of
a presentation.

The headline theorems are these.

- *The rate is an operator norm.* For every nonnegative symmetric finitely supported `μ`,
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
the basic example. Mathlib supplies the monoid algebra, whose product is convolution, free groups
with reduced words, and the radius of convergence of a power series. The roadmap
FreeProbability uses the value `2√3` of the norm of the adjacency operator of the free group of
rank two to separate its full and reduced C*-algebras, and OperatorAlgebraDynamics recalls
Kesten's theorem for the same purpose; at rank two the free-group value here gives that norm.

Layer 1 below defines step measures, return probabilities and the spectral radius and identifies
the radius with an `ℓ²` norm. Layer 2 defines the expansion constant, proves the two inequalities
and deduces Kesten's criterion through Følner sets. Layer 3 treats the free group: the tree value,
the lower bound for images, the cogrowth formula and Grigorchuk's criterion.

## Conventions

These choices fix the objects of every layer; each has a Check below.

- **Step measures.** `G` is a group (`[Group G]`, no topology unless amenability is mentioned).
  A finitely supported real function on `G` is an element `μ` of Mathlib's `MonoidAlgebra ℝ G`,
  with coefficients `μ.coeff g` and finite support `μ.coeff.support`. A *symmetric step measure*
  has nonnegative coefficients summing to `1` with `μ(g⁻¹) = μ(g)`. *Generating* means
  `Subgroup.closure (support μ) = ⊤`; then `G` is finitely generated, hence countable, so no
  countability hypothesis appears.
- **The walk.** The product in `MonoidAlgebra ℝ G` is convolution,
  `(μ * ν)(g) = Σ_(ab = g) μ(a) ν(b)`, so `μ ^ n` is the law of `s_n ⋯ s_1` for independent
  `s_i` of law `μ`: the walk that moves from `x` to `sx`. The return probability is
  `p_n = (μ ^ n)(1)`; it is also that of the walk `x ↦ xs`, whose law at time `n` is again
  `μ ^ n`.
- **Spectral radius.** `ρ(μ) = limsup_n p_n^(1/n)`, the real `limsup` of real powers; the
  sequence is bounded by the total mass, and the term `n = 0` (exponent `0⁻¹ = 0`) does not affect
  the `limsup`. For periodic walks `p_n = 0` for all odd `n`, which is why the even times are
  used in 1.2. This is the source's definition of the spectral radius of a walk; it is not
  Mathlib's spectral radius of an element of a Banach algebra, and no statement below uses the
  spectrum of an operator.
- **The operator.** The walk operator is `f ↦ μ * f` on finitely supported `f`, with
  `(μ * f)(x) = Σ_s μ(s) f(s⁻¹x)`, which for symmetric `μ` is `Σ_s μ(s) f(sx)`, the source's
  transition operator `Pf(x) = Σ_y p(x, y) f(y)` with `p(x, y) = μ(yx⁻¹)`. The norm is
  `‖f‖₂ = (Σ_x f(x)²)^(1/2)`. Finitely supported functions are dense in `ℓ²(G)`, so the supremum
  of `‖μ * f‖₂ / ‖f‖₂` over them is the norm of the bounded extension to `ℓ²(G)`.
- **Expansion.** The walk is the network on `G` with conductance `μ(s)` on the edge `{x, sx}` (a
  loop at `x` when `s = 1`) and vertex weight `1`; its edge boundary of a finite `K` is
  `Σ_s μ(s) |sK ∖ K|`, and `x ↦ sx` maps `{x ∈ K : sx ∉ K}` onto `sK ∖ K`. Left translates `sK`
  match Tau Ceti's Følner sets, which use `gF`. Loops never leave `K`.
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
- Non-generating support: the point mass at `1` on the free group of rank two has `ρ = 1` and
  `Φ = 0`, while that group is not amenable (AmenableGroups Layer 3); generation is needed in 2.3
  and 2.4.
- Symmetry: `μ = δ₁` on `ℤ` generates, has mass one and `ρ = 0`, while convolution by it is a
  translation with `‖μ * f‖₂ = ‖f‖₂`; `ℤ` is amenable. So 1.3 and 2.4 fail without symmetry.
- Mass: `δ₁ + δ₋₁` on `ℤ` is symmetric and generating with `ρ = 2`; 2.4 needs total mass one.

## Layer 1: The spectral radius as an operator norm

### 1.1 Step measures, return probabilities and the spectral radius

Define `IsSymmetricStep μ` (nonnegative coefficients, sum `1`, `μ(g⁻¹) = μ(g)`), the return
probability `returnProb μ n = (μ ^ n)(1)`, the spectral radius
`walkSpectralRadius μ = limsup_n (returnProb μ n)^(1/n)`, and the norm `l2Norm f` of a finitely
supported `f`, all as in the Conventions.

- For nonnegative `μ`, `p_(m+n) ≥ p_m p_n`; for symmetric `μ`, `μ^n(g⁻¹) = μ^n(g)` (inversion
  reverses products), so `p_(2n) = Σ_g μ^n(g)² = ‖μ^n‖₂²` and `p_n² ≤ p_(2n)`.
- For a symmetric step measure, `μ^n` is again one, `0 ≤ p_n ≤ 1` and `0 ≤ ρ(μ) ≤ 1`.

**Checks.**
- Free group of rank two, simple walk: `p₂ = 1/4` (the four letters, each followed by its
  inverse) and `p₄ = 28/256 = 7/64`: the `16` walks that step out and back twice and the `12` that
  go two steps out and return. In general `p₂ = 1/d` and `p₄ = (2d − 1)/d³` for `d = 2k`.
- The coefficient of `μ ^ n` at `1` is a return probability, not the total mass: the total mass
  of `μ ^ n` is `1` for every `n`, which would give `ρ = 1` for every walk.

### 1.2 Even return probabilities

Prove `tendsto_returnProb_two_mul_rpow`: if `μ` has nonnegative coefficients and `μ(g⁻¹) = μ(g)`,
then `p_(2n)^(1/(2n)) → ρ(μ)` (Lyons–Peres, Proposition 6.6 and its proof, pp. 184–185, for the
network random walk of a connected network; there `ρ` is also shown to be `lim sup p_n(x, y)^(1/n)`
for every pair of vertices. The statement here has neither a mass-one nor a generating
hypothesis, and the route below uses neither).

Route. If `μ = 0` both sides are `0` from `n = 1` on. Otherwise `p₂ = Σ μ(g)² > 0` and
`p_(2n) ≥ p₂ⁿ > 0`. Put `a_n = ‖μ^n‖₂ = √p_(2n)`. Since convolution by a symmetric `μ` is
symmetric for the `ℓ²` pairing, `a_(n+1)² = ⟨μ^n, μ^(n+2)⟩ ≤ a_n a_(n+2)` (Cauchy–Schwarz), so
the ratios `a_(n+1)/a_n` increase; they are at most `Σ μ` (the bound `‖μ * f‖₂ ≤ ‖μ‖₁ ‖f‖₂`), so
they converge to some `L`, and then `a_n^(1/n) → L` because `log a_n / n` is an average of the
logarithms of the ratios (`a₀ = 1`). Thus `p_(2n)^(1/(2n)) → L`. From `p_n² ≤ p_(2n)`,
`p_n^(1/n) ≤ p_(2n)^(1/(2n))`, so the `limsup` of `p_n^(1/n)` is at most `L`, and the even terms
give at least `L`; hence `ρ(μ) = L`.

*Needs:* 1.1; Mathlib `MonoidAlgebra.coeff_mul`, `Filter.limsup`, `Filter.Tendsto.limsup_eq`,
`Real.rpow`.

### 1.3 The operator norm

Prove `isLUB_l2Norm_mul_div`: under the hypotheses of 1.2, `ρ(μ)` is the least upper bound of
`‖μ * f‖₂ / ‖f‖₂` over nonzero finitely supported `f` (Lyons–Peres, Proposition 6.6 and its
proof, pp. 184–185, where the norm is that of the transition operator on `ℓ²(V, π)`; same
generality remark as in 1.2).

Route. The values at `f = μ^n` are the ratios `a_(n+1)/a_n` of 1.2, which tend to `ρ`, so no
number below `ρ` is an upper bound. Conversely let `f ≥ 0` be nonzero and `b_n = ‖μ^n * f‖₂`. By
symmetry `b_(n+1)² ≤ b_n b_(n+2)`, and `b_n > 0` because `b_n² = ⟨μ^(2n) * f, f⟩ ≥ f(x)² p_(2n)`
for any `x`. Hence `b₁/b₀ ≤ lim b_(n+1)/b_n = lim b_n^(1/n)`. By Cauchy–Schwarz and symmetry
`μ^(2n)(z) = Σ_g μ^n(g) μ^n(g⁻¹z) ≤ p_(2n)` for every `z`, so
`b_n² = Σ_(x,y) f(x) f(y) μ^(2n)(xy⁻¹) ≤ p_(2n) (Σ_x f(x))²`, and `lim b_n^(1/n) ≤ ρ` by 1.2.
For general `f`, `|μ * f| ≤ μ * |f|` pointwise since `μ ≥ 0`, so `‖μ * f‖₂ ≤ ρ ‖|f|‖₂ = ρ ‖f‖₂`.
For `μ = 0` every value is `0 = ρ`.

*Needs:* 1.1, 1.2; Mathlib `MonoidAlgebra.coeff_mul`, `IsLUB`.

**Checks.**
- On the free group of rank two with the simple walk, `f = δ₁` gives `‖μ‖₂ = 1/2`, below
  `ρ = √3/2` (3.1); on `ℤ` with the simple walk, `f` the indicator of `{0, …, n − 1}` gives
  `√((n − 1)/n)` for `n ≥ 2` (and `√(1/2)` for `n = 1`), tending to `ρ = 1`.
- The adjacency sum `A = 4μ` of the free group of rank two has norm `4 · √3/2 = 2√3` on
  finitely supported functions, the value that FreeProbability uses (Scope and ownership below).

### Examples

- `ρ` of a finite group, of `ℤ` and of `ℤᵈ` with any symmetric generating step measure is `1`
  (by 2.4, these groups being amenable); `ρ` of the free group of rank `k` is `√(2k − 1)/k` (3.1).

### Dependencies

Mathlib only.

## Layer 2: Expansion and Kesten's criterion

### 2.1 The expansion constant

Define `edgeBoundary μ K = Σ_(s ∈ support μ) μ(s) |sK ∖ K|` for a finite `K ⊆ G` and
`expansionConst μ`, the infimum over finite nonempty `K` of `edgeBoundary μ K / |K|` (a real
infimum over a nonempty index set; for nonnegative `μ` the values are nonnegative, so it is
bounded below). For a symmetric step measure `0 ≤ Φ(μ) ≤ 1`, since `|sK ∖ K| ≤ |K|`. It is the
source's `Φ_E(G, c, π)` for the network of the Conventions, whose vertex weight `π`, the sum of
the conductances at a vertex, is `1` (Lyons–Peres, §6.1, p. 177, and §6.2, p. 183).

- For a finitely supported `f`, the Dirichlet form `E(f) = (1/2) Σ_x Σ_s μ(s) (f(sx) − f(x))²`
  satisfies `‖f‖₂² − ⟨μ * f, f⟩ = E(f)` when `μ` is a symmetric step measure, and
  `E(1_K) = edgeBoundary μ K` (the steps from `K` out and the steps from outside into `K`
  contribute `|sK ∖ K|` and `|s⁻¹K ∖ K|`, which symmetry makes equal after weighting).

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
for a connected infinite network. The statement here has no connectedness and no infinitude
hypothesis; on a finite group both sides vanish, and the route below uses neither).

Route.
1. (Right inequality.) For finite nonempty `K`, `⟨μ * 1_K, 1_K⟩ ≤ ‖μ * 1_K‖₂ ‖1_K‖₂ ≤ ρ |K|` by
   Cauchy–Schwarz and 1.3, so by 2.1 `1 − ρ ≤ E(1_K)/|K| = edgeBoundary μ K / |K|`; take the
   infimum.
2. (Rayleigh quotient.) Let `R` be the supremum of `⟨μ * f, f⟩ / ‖f‖₂²` over nonzero `f ≥ 0`.
   Since `μ ≥ 0`, `|⟨μ * h, h⟩| ≤ ⟨μ * |h|, |h|⟩ ≤ R ‖h‖₂²` for all `h`. By symmetry,
   `4⟨μ * f, g⟩ = ⟨μ * (f + g), f + g⟩ − ⟨μ * (f − g), f − g⟩ ≤ 2R(‖f‖₂² + ‖g‖₂²)`; with
   `‖f‖₂ = 1` and `g = μ * f / ‖μ * f‖₂` this gives `‖μ * f‖₂ ≤ R`, so `ρ ≤ R` by 1.3. (The
   source leaves this to Exercise 6.7, p. 184; this is a complete proof.)
3. (Coarea, Lyons–Peres Lemma 6.8, p. 186.) For nonnegative finitely supported `g`,
   `Φ Σ_x g(x) ≤ Σ_x Σ_s μ(s) (g(x) − g(sx))⁺`. List the positive values `t₁ < ⋯ < t_m` of
   `g`, `t₀ = 0`, and put `K_j = {g ≥ t_j}` (finite, nonempty). Then
   `Σ_x g(x) = Σ_j (t_j − t_(j−1)) |K_j|`, and the pair `(x, s)` is counted in
   `{x ∈ K_j : sx ∉ K_j}` exactly when `g(sx) < t_j ≤ g(x)`, so
   `Σ_j (t_j − t_(j−1)) edgeBoundary μ K_j = Σ_(x,s) μ(s) (g(x) − g(sx))⁺`. Apply
   `edgeBoundary μ K_j ≥ Φ |K_j|`. By the substitution `(x, s) ↦ (sx, s⁻¹)` and symmetry the
   right side is `(1/2) Σ_(x,s) μ(s) |g(sx) − g(x)|`. (The identity is the counting-measure case
   of Tau Ceti's `TauCeti.lintegral_ofReal_sub_eq_lintegral_measure`, which writes `∫ (g − f)⁺` as
   the integral over levels `s` of the measure of `{f ≤ s < g}`;
   `TauCeti.exists_finset_sum_card_smul_symmDiff_lt_of_sum_tsum_lt` uses superlevel sets in the
   same way, with unit weights, to select a single level.)
4. (Cauchy–Schwarz.) For nonzero `f ≥ 0` apply step 3 to `g = f²`:
   `Φ ‖f‖₂² ≤ (1/2) Σ μ(s) |f(sx) − f(x)| (f(sx) + f(x)) ≤ √E(f) · √(2‖f‖₂² − E(f))`, because
   `(1/2) Σ μ(s) (f(sx) + f(x))² = ‖f‖₂² + ⟨μ * f, f⟩` (mass one, and `x ↦ sx` preserves
   `Σ f²`). With `t = E(f)/‖f‖₂²` this is `Φ² ≤ t(2 − t)`, i.e. `(1 − t)² ≤ 1 − Φ²`, so
   `⟨μ * f, f⟩ / ‖f‖₂² = 1 − t ≤ √(1 − Φ²)`. By step 2, `ρ ≤ √(1 − Φ²)`.

Loops (`s = 1`) contribute `0` to `E` and to every edge boundary. *Needs:* 1.1, 1.3, 2.1; Mathlib
`ciInf_le`, `le_ciInf`, `Real.sqrt`.

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

Prove `expansionConst_eq_zero_iff_hasFoelnerSets`: if `μ` has nonnegative coefficients and its
support generates `G`, then `Φ(μ) = 0` if and only if `G` has Følner sets (`TauCeti.HasFoelnerSets
G`). (Proved here. Lyons–Peres, §6.1, pp. 180–181, explain the comparison for Cayley graphs of
finitely generated groups and refer to Paterson for Følner's converse; the converse is the Tau
Ceti theorem cited in 2.4.)

Route. Use `TauCeti.hasFoelnerSets_iff`, the finite-test form `|gF △ F| < ε|F|`, and
`|gF △ F| = 2|gF ∖ F|` (`Finset.card_smul_finset_symmDiff`).
- If `G` has Følner sets: for `ε > 0` take `F` passing the test for the support of `μ`; then
  `edgeBoundary μ F / |F| < (ε/2) Σ μ`, so `0 ≤ Φ ≤ (ε/2) Σ μ` for every `ε`.
- If `Φ = 0`: if the support is empty then `G` is trivial; otherwise let `m > 0` be the least
  coefficient on the support. For `δ > 0` take `F` with `edgeBoundary μ F < δ m |F|`; then
  `|sF △ F| < 2δ|F|` for each `s` in the support, and also for `s⁻¹`, since translation by `s`
  preserves cardinalities and symmetric differences. Every `g` is a product of at most `L_g`
  elements of the support and their inverses (`Subgroup.closure_toSubmonoid`,
  `Submonoid.closure_induction`), and `|ghF △ F| ≤ |hF △ F| + |gF △ F|` by the triangle
  inequality for `△` and translation invariance. For a finite test set `K` and `ε > 0` choose
  `δ` with `2δ max_(g ∈ K) L_g < ε`.

*Needs:* 2.1; Tau Ceti `TauCeti.HasFoelnerSets`, `TauCeti.hasFoelnerSets_iff`,
`Finset.card_smul_finset_symmDiff`; Mathlib `Subgroup.closure_toSubmonoid`,
`Submonoid.closure_induction`, `symmDiff_triangle`, `Finset.card_smul_finset`, `ciInf_le`.

**Checks.**
- The point mass at `1` on the free group of rank two has `Φ = 0` but generates only `{1}`, and
  that group has no Følner sets (AmenableGroups Layers 3 and 5).
- Symmetry and total mass play no role: `δ₁` on `ℤ` has `Φ = 0`, and `ℤ` has Følner sets.

### 2.4 Kesten's criterion

Prove `walkSpectralRadius_eq_one_iff_amenable`: for a symmetric step measure whose support
generates the discrete group `G`, `ρ(μ) = 1` if and only if `G` is amenable (Kesten 1959, as
stated in Lyons–Peres, §6.10 Notes, p. 224; the network form, `ρ < 1` exactly for nonamenable
networks, follows Theorem 6.7 on p. 186).

Route. If `ρ = 1`, the first inequality of 2.2 gives `√(1 − Φ²) ≥ 1`, so `Φ = 0`; if `Φ = 0`,
the second gives `ρ ≥ 1`, and `ρ ≤ 1` by 1.1. So `ρ = 1 ⇔ Φ = 0 ⇔ HasFoelnerSets G` by 2.3, and
`TauCeti.amenable_iff_hasFoelnerSets` (the realization of AmenableGroups Layer 5) finishes.

*Needs:* 1.1, 2.2, 2.3; Tau Ceti `TauCeti.Amenable`, `TauCeti.amenable_iff_hasFoelnerSets`.

**Checks.**
- The free group of rank two is not amenable (AmenableGroups Layer 3; Tau Ceti
  `TauCeti.not_amenable_freeGroup`), and its simple walk has `ρ = √3/2 < 1` (3.1).
- Every finite group is amenable (AmenableGroups Layer 2), and its symmetric generating walks
  have `ρ = 1` by the Cauchy–Schwarz bound of the Conventions.

### Examples

- For any finitely generated group, `ρ` is `1` for one symmetric generating step measure exactly
  when it is `1` for all of them, since both conditions say that the group is amenable.

### Dependencies

Layer 1; Tau Ceti's amenability library (AmenableGroups Layer 5).

## Layer 3: Free groups and cogrowth

### 3.1 The free group

Define `freeGroupStep k`, mass `1/(2k)` on each `FreeGroup.of i` and its inverse. Prove
`walkSpectralRadius_freeGroupStep`: for `k ≥ 1`, `ρ = √(2k − 1)/k`, that is `2√b/d` with `d = 2k`
and `b = 2k − 1` (Lyons–Peres, §6.3, formulas (6.21)–(6.25) with their derivation, pp. 188–189,
for the `d`-regular tree, whose closed walks at the root are the words reducing to `1`; also
Exercise 6.9, p. 187).

Route. Let `A = Σ_σ σ` over the `2k` letters in `MonoidAlgebra ℝ F_k` and `A_m` the sum of the
reduced words of length `m`. Left multiplication by a letter lengthens a reduced word unless it
cancels its first letter, so `A·A₁ = A₂ + d·1` and `A·A_m = A_(m+1) + b·A_(m−1)` for `m ≥ 2`
(the source's (6.21)). Summing `Σ_m A_m z^m` as an absolutely convergent series for `|z| < 1/d`
gives `(1 + bz²)Σ_m A_m z^m − zA Σ_m A_m z^m = 1 − z²`. The coefficient of `A^n` at `1` is the
number `c_n = dⁿ p_n` of words of length `n` reducing to `1`, while `A_m` has coefficient `0` at
`1` for `m ≥ 1`. Expanding `((1 + bz²) − zA)⁻¹` as a geometric series in `zA/(1 + bz²)` and
reading the coefficient at `1` gives `1 = ((1 − z²)/(1 + bz²)) Σ_n c_n wⁿ` with
`w = z/(1 + bz²)` ((6.23)); solving for `z` near `0` gives
`Σ_n c_n wⁿ = 2b / (b − 1 + (b + 1)√(1 − 4bw²))` for small `w` ((6.24)). The right
side is analytic on `|w| < 1/(2√b)` (the principal root has positive real part there, so the
denominator does not vanish), so the radius of convergence `R` is at least `1/(2√b)`. On
`[0, 1/(2√b))` the series has nonnegative coefficients and equals the right side; as
`w → 1/(2√b)` the right side tends to `+∞` when `b = 1` and its derivative does when `b ≥ 2`,
which a series converging at some point beyond `1/(2√b)` would forbid. So `R = 1/(2√b)`, and
Cauchy–Hadamard (`FormalMultilinearSeries.radius_inv_eq_limsup`) gives
`limsup c_n^(1/n) = 2√b`, hence `ρ = 2√b/d`.

*Needs:* 1.1; Mathlib `MonoidAlgebra.single`, `MonoidAlgebra.coeff_mul`, `FreeGroup.of`,
`FreeGroup.toWord`, `FreeGroup.norm`, `FormalMultilinearSeries.radius_inv_eq_limsup`.

**Checks.**
- `k = 1`: `ℤ` with the simple walk, `ρ = 1 = √1/1`.
- `k = 2`: `ρ = √3/2`; the coefficients of (6.24) for `b = 3` begin `1, 0, 4, 0, 28, 0, 232`,
  agreeing with the walk counts `c₀, …, c₆` (`c₂ = d`, `c₄ = 2d² − d`), and the same agreement
  holds through `w¹⁶` for `k = 1, 2, 3`.

### 3.2 Images of the free walk

Prove `walkSpectralRadius_freeGroupStep_le_map`: for `k ≥ 1` and every homomorphism
`φ : F_k → Γ` into any group, `√(2k − 1)/k ≤ ρ(φ_* μ)`, where `μ` is the simple walk (Lyons–Peres,
proof of Theorem 6.10, last paragraph, p. 190, by coupling with the covering tree).

Route. `MonoidAlgebra.mapDomain φ` is a ring homomorphism (`MonoidAlgebra.mapDomainRingHom`), so
`(φ_* μ)^n = φ_*(μ^n)`, whose coefficient at `1` is `Σ_(g ∈ ker φ) μ^n(g) ≥ μ^n(1)` because the
coefficients are nonnegative (`Finsupp.mapDomain_apply`). Real powers and `limsup` of bounded
sequences are monotone; apply 3.1.

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

Route. Push the recursion of 3.1 forward by `φ` (a ring homomorphism) and read coefficients at
`1 ∈ Γ`: with `b_n` the kernel counts and `c_n = dⁿ p_n` the counts of words of length `n` with
image `1`, the source's identity (6.23) holds as an identity of power series near `0`:
`Σ_n b_n zⁿ = ((1 − z²)/(1 + bz²)) Σ_n c_n ψ(z)ⁿ` with `ψ(z) = z/(1 + bz²)`. The two series have
nonnegative coefficients and radii `1/c` (infinite when `c = 0`) and `1/(dρ)` by
Cauchy–Hadamard. The source's comparison of the first real singularities, through the
monotonicity of `ψ` on `[0, 1/√b]` and Pringsheim's theorem, gives the first two clauses; the
third follows from the first and 3.2. Pringsheim's theorem (Exercise 6.58 of the source) needs a
proof: if `Σ aₙ zⁿ` has `aₙ ≥ 0` and radius `R` with `0 < R < ∞` and its sum extends analytically
to a neighbourhood of `R`, then for `r < R` near `R` the Taylor coefficients at `r`,
`Σ_n C(n, j) aₙ r^(n−j)`, are nonnegative and the Taylor series converges at `R + δ` for some
`δ > 0`; summing the double series of nonnegative terms in the other order gives
`Σ aₙ (R + δ)ⁿ < ∞`, contradicting the radius.

*Needs:* 3.1, 3.2; Mathlib `MonoidAlgebra.mapDomainRingHom`, `FreeGroup.norm`, `Nat.card`,
`FormalMultilinearSeries.radius_inv_eq_limsup`, `Filter.limsup`.

**Checks.**
- `φ` trivial (`Γ = 1`): every reduced word is in the kernel, `c = 2k − 1`, and the formula gives
  `2kρ = 1 + (2k − 1)`, i.e. `ρ = 1`. Counting all words instead of reduced ones would give
  `2k`, and `2kρ = (2k − 1)/(2k) + 2k > 2k` would contradict `ρ ≤ 1`.
- `φ` injective: `c = 0 ≤ √b` and `ρ = √b/k` (3.1). For `k = 1` every `φ` has `c ≤ 1 = √b`
  (at most two reduced words of each length) and `ρ = 1`.
- For `φ : F₂ → ℤ/5` with `a ↦ 1`, `b ↦ 2`, the kernel counts are `b₁, …, b₆ = 0, 0, 12, 24,
  48, 204`, and the identity (6.23) holds exactly through `z¹⁸`; it also holds for `b ↦ 0`, where
  `b^(±1)` are loops of the Cayley graph (`b₁ = 2`), and for two transpositions in `S₃`.

### 3.4 Grigorchuk's criterion

Prove `amenable_iff_cogrowth_eq`: for `k ≥ 2` and a surjective `φ : F_k → Γ` onto a discrete
group, `Γ` is amenable if and only if `cogrowth φ = 2k − 1`. (Proved here. Lyons–Peres pose the
spectral form, `ρ = 1` exactly when the cogrowth is `d − 1`, for `d`-regular multigraphs as
Exercise 6.10, p. 191; see the Checks for the case `d = 2`.)

Route. `φ_* μ` is a symmetric step measure supported on the images of the letters, which
generate `Γ`, so by 2.4 `Γ` is amenable iff `ρ = 1`. For `k ≥ 2`, `√b < b` and
`√b/k < 1` (as `2k − 1 < k²`). If `c = b`, then `c > √b` and 3.3 gives `2kρ = 1 + b = 2k`. If
`ρ = 1 > √b/k`, then 3.3 gives `c > √b` and `2k = b/c + c`, so `c² − 2kc + b = 0`, `c ∈ {1, b}`,
and `c > √b > 1` leaves `c = b`.

*Needs:* 2.4, 3.3; Mathlib `MonoidAlgebra.mapDomain`.

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

Layers 1 and 2 (and, through 2.4, Tau Ceti's amenability library); Mathlib's free groups and
Cauchy–Hadamard.

## Scope and ownership

This roadmap owns the spectral radius of symmetric finitely supported random walks on groups,
its identification with the `ℓ²` norm, the expansion inequalities for such walks, Kesten's
criterion, the free-group value, the lower bound for images of the free walk, the cogrowth
formula and Grigorchuk's criterion, all stated above.

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
  (Cayley graphs of free products of copies of `ℤ/2`), non-symmetric walks, measures with
  infinite support, the speed of the walk and the spectral measure (Kesten–McKay law).

## Exact supplier contracts

### From Mathlib

- `MonoidAlgebra ℝ G` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean`): a structure with field
  `coeff : G →₀ ℝ`; its product is convolution, `MonoidAlgebra.coeff_mul`
  (`(x * y).coeff m` is the sum of `x.coeff a * y.coeff b` over `a * b = m`, with
  `[DecidableEq G]`); `MonoidAlgebra.single`.
- `MonoidAlgebra.mapDomain`, `MonoidAlgebra.mapDomain_mul` (for a multiplicative map)
  (`Mathlib/Algebra/MonoidAlgebra/MapDomain.lean`), `MonoidAlgebra.mapDomainRingHom` (same file;
  a ring homomorphism for a monoid homomorphism), `Finsupp.mapDomain_apply`
  (`Mathlib/Data/Finsupp/Basic.lean`).
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
  (`Mathlib/Topology/Order/LiminfLimsup.lean`), `ciInf_le`, `le_ciInf`
  (`Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`; bounded below, nonempty index),
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
  weights), both named in 2.2, step 3; the weighted finite-sum identity used there is proved in the
  route.

### From TauCetiRoadmap.AmenableGroups

- Layer 5 (Følner criteria for arbitrary discrete groups): the characterization of amenable
  discrete groups by Følner sets, realized by the Tau Ceti declarations above and used in 2.3 and
  2.4. Layer 3 (equidecompositions and the free-group obstruction) and Layers 2 and 6 (finite and
  abelian groups) are used only in Checks.

## References

- Russell Lyons and Yuval Peres, *Probability on Trees and Networks*, Cambridge University Press,
  2016; corrected version of 19 August 2026 on the first author's page,
  https://rdlyons.pages.iu.edu/prbtree/book.pdf. Used: §6.1 (pp. 176–181), Proposition 6.6
  (p. 184), Theorem 6.7 and Lemma 6.8 (p. 186), Exercises 6.7 and 6.9 (pp. 184, 187), §6.3 with
  (6.21)–(6.25) (pp. 188–189), Theorem 6.10 (p. 190), Exercise 6.10 (p. 191), Notes §6.10
  (p. 224). Page numbers are those printed in that version.
