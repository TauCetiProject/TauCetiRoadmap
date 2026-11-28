# Roadmap: quantitative equidistribution and factorisation of polynomial nilsequences

**Summary.** Let `G/Γ` be a nilmanifold of dimension `d` and complexity at most `M`, with a
filtration of degree `s`, and let `g : ℤ^ℓ → G` be a polynomial sequence. Leibman's theorem says
when the orbit `g(n)Γ` is equidistributed as `n` runs to infinity. This roadmap proves the
quantitative theory, in which `n` runs over a single box `[N₁] × ⋯ × [N_ℓ]` and every constant is
explicit in `δ`, `M` and `d`. The bounds have the form `(M/δ)^{C d^E}` with `C` and `E` depending
only on `s` and `ℓ`: polynomial in `M/δ`, and only singly exponential in a power of the dimension.
These are the bounds that the quasi-polynomial inverse theorem for the Gowers norms needs.

The headline theorems are the following.

- **Efficient equidistribution (Leng).** Let `G` have step `t` and let `F : G/Γ → ℂ` be
  `M`-Lipschitz with a nonzero frequency `ξ`, `|ξ| ≤ M/δ`, along the last term `G_(t)` of the
  lower central series. If `|E_{n ∈ [N⃗]} F(g(n)Γ)| ≥ δ`, then either some `N_i` is at most
  `(M/δ)^{C d^E}`, or there are horizontal characters `η₁, …, η_r` (`r ≥ 1`) of size at most
  `(M/δ)^{C d^E}`, each with `η_j ∘ g` of smoothness norm at most `(M/δ)^{C d^E}`, such that
  `ξ` kills every `t`-fold commutator of elements of `⋂_j ker η_j`. The subgroup `⋂_j ker η_j`
  is then of step `t − 1` modulo `ker ξ`, so the step drops in one move.
- **Quantitative Leibman theorem (Green–Tao, efficient form).** If `(g(n)Γ)_{n ∈ [N]}` is not
  `δ`-equidistributed, some nontrivial horizontal character `η` of size at most `(M/δ)^{C d^E}`
  has `‖η ∘ g‖_{C^∞[N]} ≤ (M/δ)^{C d^E}`. This makes the ineffective single-scale theorem of
  PolynomialOrbitsAndCubeGroups explicit.
- **Factorisation along a central frequency (Leng–Sah–Sawhney).** Under the same hypothesis, for
  a function with a nonzero frequency along a rational central subgroup `T`, the sequence factors
  as `g = ε g′ γ` on a cube `[N]^ℓ`. Here `ε` is `((M/δ)^{C d^E}, N)`-smooth, `γ` is
  `(M/δ)^{C d^E}`-rational, and `g′` takes values in a rational subgroup `H` on which the
  frequency vanishes on `H ∩ T`.
- **Factorisation theorem (Green–Tao).** Every polynomial sequence factors as
  `g = ε g′ γ`, where `ε` is smooth, `γ` is rational and periodic, and `g′` is totally
  `M^{−A}`-equidistributed in a rational sub-nilmanifold. The complexity bound is
  `M₀ ≤ M ≤ C M₀^E`, with `C` and `E` depending on `A`, `d`, `s` and `ℓ`.

The roadmap sits between these neighbours:

- **NilmanifoldsAndNilsequences** supplies Mal'cev presentations, metrics, Lipschitz functions,
  polynomial sequences in coordinates, rational points, horizontal and vertical characters,
  nilcharacters and all complexity bookkeeping. This roadmap measures and factorises orbits in
  those terms.
- **PolynomialOrbitsAndCubeGroups** supplies the invariant probability on a nilmanifold and its
  sub-nilmanifolds, the Leibman square `G ×_{G₂} G` with its filtration, level characters and the
  van der Corput lemma. It proves the qualitative theorems, of which the ones here are the
  effective forms.
- **ProbabilisticAndMetricNumberTheory** §2.5a supplies the single-scale inverse theorems for
  Weyl sums of polynomial phases, the abelian base case.
- **NilpotentLieHeightsAndFiltrations** supplies effective linear algebra over `ℚ` (Cramer
  bounds, kernels, annihilators, quotients). **SuccessiveMinima** (through Tau Ceti) supplies
  Minkowski's second theorem.
- **GowersInverseTheorem** consumes everything here.

**How to read the build.** Layer 0 is the abelian theory: polynomial phases on `ℤ^ℓ` with
values in `ℝ/ℤ`, their smoothness norms, Vinogradov-type lemmas and the Weyl theorem for Lipschitz
functions on tori, all with explicit dimension dependence. Layer 1 is diophantine geometry:
generalised progressions in lattice points of convex bodies, and Leng's refined bracket
polynomial lemma. Layer 2 sets up the quantitative notions on a nilmanifold: equidistribution at
a scale, smooth and rational sequences, the standard normalisations, factorisations produced by
horizontal characters, and the complexity of Leibman squares. Layer 3 proves Leng's efficient
equidistribution theorem and deduces the quantitative Leibman theorem. Layer 4 proves the
factorisation theorems.

## Conventions

1. **Nilmanifolds.** A nilmanifold is given by a Mal'cev presentation `P` of degree `s` and
   dimension `d` in the sense of NilmanifoldsAndNilsequences 2.4 (`MalcevPresentation G d s`).
   It consists of coordinates of the second kind `ψ : G ≃ₜ ℝ^d`, a full `ℕ`-filtration `G_•` of
   degree at most `s` cut out by weights, the lattice `Γ = ψ⁻¹(ℤ^d)`, and the triangular product
   polynomials. Its *complexity* is at most `M` (`ComplexityLE M`, with `M ≥ 2` a natural
   number). By NilmanifoldsAndNilsequences 2.3–2.6, every rational filtered nilmanifold, and so
   every nilmanifold with a filtration by rational subgroups, has such a presentation. The metric
   `d_G = malcevDist`, the quotient metric `d_{G/Γ} = nilDist` and
   `‖F‖_Lip = ‖F‖_∞ + Lip(F)` are those of NilmanifoldsAndNilsequences 3.2, 3.3 and its
   Convention 7. A function on `G/Γ` is a function `F : G ⧸ Γ → ℂ`, and the Lipschitz condition
   is read through representatives. `μ_{G/Γ}` is the `G`-invariant probability of
   PolynomialOrbitsAndCubeGroups 2.1. The *step* `t` of `G` is the least `t` with
   `(⊤ : Subgroup G).lowerCentralSeries t = ⊥`, and
   `G_(t) = (⊤ : Subgroup G).lowerCentralSeries (t − 1)` (Mathlib's indexing starts at `0`).
   `t ≤ s` because the filtration is full.
2. **Boxes and averages.** `ℓ ≥ 1` is the number of parameters. A box is
   `[N⃗] = ∏_i {0, …, N_i − 1} ⊆ ℤ^ℓ` with all `N_i ≥ 1`, `|N⃗| = ∏_i N_i`, and
   `E_{n ∈ P} f(n) = |P|⁻¹ Σ_{n ∈ P} f(n)` for a finite nonempty `P`. Green and Tao use
   `[N] = {1, …, N}`. The translate `n ↦ g(n + 1)` is a polynomial sequence with the same
   filtration (NilmanifoldsAndNilsequences 0.3), and its smoothness norms differ by a factor
   depending only on `s` and `ℓ` (0.1). So every statement transfers between the two
   conventions at the cost of the constants. An *arithmetic progression* in `[N]` is a set
   `{a + b k | 0 ≤ k < m}` contained in `[N]` with `b ≥ 1`.
3. **Polynomial sequences.** `g ∈ poly(ℤ^ℓ, G_•)` means polynomial for the degree filtration on
   `ℤ^ℓ` (`weightedFiltration 1`) and the filtration `G_•` (NilmanifoldsAndNilsequences 0.2).
   Degree–rank and multidegree sequences enter through their associated degree filtrations
   (4.5).
4. **Bounds.** δ is a real number with `0 < δ < 1/2`. An *efficient bound* is a quantity
   `(M/δ)^{C d^E}`, or `(1/δ)^{C m^E}` on a torus `T^m`, where `C` and `E` are natural numbers
   depending only on `s` and `ℓ`. A *polynomial bound* is `C (M/δ)^E` with `C` and `E` depending
   on `d`, `s` and `ℓ` (Green–Tao's `δ^{−O_{m,d}(1)}`). Theorems are stated `∃ C E, ∀ …`.
   Composing boundedly many efficient bounds, with the number of steps depending on `s` and `ℓ`,
   gives an efficient bound. This is the bookkeeping rule used throughout.
5. **Circle.** `‖x‖_{ℝ/ℤ}` is Mathlib's norm on `UnitAddCircle`, the distance to the nearest
   integer. `e(x) = exp(2πix)`. `{x} = x − ⌈x − 1/2⌉ ∈ (−1/2, 1/2]` is the signed fractional
   part, as in LSS §2.5.
6. **Characters.** A horizontal character is a continuous homomorphism `η : G → ℝ/ℤ` that is
   trivial on `Γ` (NilmanifoldsAndNilsequences 4.4, PolynomialOrbitsAndCubeGroups Convention 6).
   It is `η(x) = k · ψ(x) mod 1` for a unique `k ∈ ℤ^d`, and its *size* is `|η| = |k|_∞` (GT,
   Definition 2.6; LSS, Definition 3.11). LSS and Leng use real-valued characters with
   `η(Γ) ⊆ ℤ`. Since `G` is simply connected these lift uniquely, with the same `k`. A
   `T`-vertical frequency, for a rational connected subgroup `T` of the centre, is a continuous
   homomorphism `ξ : T → ℝ` with `ξ(T ∩ Γ) ⊆ ℤ`, and `F` has it when `F(ux) = e(ξ(u)) F(x)` for
   `u ∈ T` (LSS, Definition 2.15). Its size `|ξ|` is LSS's height (Definition 3.13). For
   `T = G_s` this is NilmanifoldsAndNilsequences' `HasVerticalFrequency`. Level-`i`
   characters (LSS's `i`-th horizontal characters, Definition 2.11) are
   PolynomialOrbitsAndCubeGroups' `IsLevelCharacter`, with size as in LSS, Definition 3.12.
7. **Rational subgroups.** A closed connected subgroup `G′` is `Q`-rational when its Lie algebra
   has a basis of `Q`-height rational combinations of the Mal'cev basis (GT, Definition 2.5;
   LSS, Definition 3.6). By NilmanifoldsAndNilsequences 2.2, it then carries a Mal'cev
   presentation of complexity at most `C (MQ)^E`, with `Γ ∩ G′` as lattice.
8. **Names.** Names in code font are declarations of Mathlib, of the pinned Tau Ceti, of
   [`Suggested.lean`](Suggested.lean) (namespace `TauCetiRoadmap.NilsequenceEquidistribution`),
   or of the Suggested files of cited roadmaps, named there. Italic names are proposed names of
   targets not prototyped. This README is the specification.

## Layer 0: polynomial phases at a single scale

The abelian case: maps `p : ℤ^ℓ → ℝ/ℤ` and `p : ℤ^ℓ → T^m` that are polynomial.

### 0.1 Binomial coefficients and smoothness norms

For `j ∈ ℕ^ℓ` write `binom(n, j) = ∏_i Ring.choose (n_i) (j_i)` and `N⃗^j = ∏_i N_i^{j_i}`. A
polynomial map `p : ℤ^ℓ → ℝ/ℤ` of degree at most `s` in each variable is
`p(n) = Σ_j binom(n, j) α_j` (`binomPhase`) for unique Taylor coefficients `α_j ∈ ℝ/ℤ`, namely
`α_j = ∂^j p(0)` (GT, Definition 8.1). The *smoothness norm* is
`‖p‖_{C^∞[N⃗]} = max_{j ≠ 0} N⃗^j ‖α_j‖_{ℝ/ℤ}` (`cInftyNorm`; GT, Definitions 2.7 and 8.2;
LSS, Definition 3.15; Leng, Definition 2.2). Prove:

- uniqueness of the coefficients (`binomPhase_injective`), by finite differences;
- `‖p + q‖ ≤ ‖p‖ + ‖q‖`, `‖k p‖ ≤ |k| ‖p‖` for `k ∈ ℤ`, and independence of the constant term;
- **slow variation** (GT, Lemmas 2.8 and 8.3): `‖p(n + e_i) − p(n)‖_{ℝ/ℤ} ≤ C ‖p‖_{C^∞[N⃗]}/N_i`
  for `n ∈ [N⃗]`, with `C` depending on `s` and `ℓ` (`norm_binomPhase_sub_le`);
- **restriction and monotonicity:** `‖p‖_{C^∞[N⃗′]} ≤ ‖p‖_{C^∞[N⃗]}` when `N⃗′ ≤ N⃗`; translates
  `n ↦ p(n + a)` with `a ∈ [N⃗]` have smoothness norm at most `C` times that of `p`;
- **representation change** (Leng, Lemma A.10): if `p(n) = Σ_j β_j n^j` in the monomial basis,
  some nonzero integer `q` depending only on `s` and `ℓ` has
  `‖q β_j‖_{ℝ/ℤ} ≤ C N⃗^{−j} ‖p‖_{C^∞[N⃗]}` for all `j ≠ 0`;
- **extrapolation** (GT, Lemma 8.4; Leng, Lemma A.12): for `p̃(n) = p(a₁ + b₁n₁, …, a_ℓ + b_ℓn_ℓ)`
  with integers `0 < |b_i| ≤ Q` and `|a_i| ≤ Q N_i`, some nonzero integer `|q| ≤ C Q^E` has
  `‖q p‖_{C^∞[N⃗]} ≤ C Q^E ‖p̃‖_{C^∞[N⃗]}`, with `C` and `E` depending on `s` and `ℓ`. The
  hypotheses are Leng's. GT's version allows rational `a_i`, `b_i` of height at most `Q`.

**Checks.**

- `p(n) = n²/2 mod 1` has binomial coefficients `α₁ = 1/2` and `α₂ = 1 ≡ 0`, so
  `‖p‖_{C^∞[N]} = N/2`. Indeed `n² ≡ n mod 2`, so `p` is the linear phase `n/2`. A norm read off
  the monomial coefficient of `n²` would give `N²/2` and see a quadratic phase.
- `p(n) = binom(n, 2) mod 1` is identically `0`, so `‖p‖_{C^∞[N]} = 0`, while its monomial
  coefficients are `β₂ = 1/2` and `β₁ = −1/2`. The representation change fails with `q = 1` and
  holds with `q = 2`, which is why a multiplier depending on `s` is needed.

*Needs:* Mathlib `Ring.choose`, `UnitAddCircle`; Tau Ceti `TauCeti.binomialPolynomialBasis`.

### 0.2 Vinogradov-type lemmas

Prove, with `C` and `E` depending only on `s` and `ℓ`:

- **recurrence forces structure** (GT, Lemma 4.5 for `ℓ = 1`; Leng, Lemma A.11): let
  `0 ≤ ε < δ/10` and `min_i N_i ≥ C δ^{−E}`. If `‖p(n)‖_{ℝ/ℤ} ≤ ε` for at least `δ|N⃗|` points
  `n ∈ [N⃗]`, then some integer `1 ≤ q ≤ C δ^{−E}` has `‖q p‖_{C^∞[N⃗]} ≤ C δ^{−E} ε` and
  `‖q p(0)‖_{ℝ/ℤ} ≤ C δ^{−E} ε` (`exists_mul_cInftyNorm_le_of_many_small`). The lower bound on
  the `N_i` cannot be dropped. With `N = 1`, `ε = 0` and `p(n) = α₀ + α₁ n` with `α₀ = 0` and
  `α₁` irrational, the hypothesis holds and no `q` makes `q α₁` vanish.
- **many shifts** (Leng, Lemma 4.2, the analogue of GT, Lemma 7.6): let `P`, `Q` be real
  polynomials on `ℤ^ℓ` of degree at most `s`, with `P(0) = Q(0) = 0` and `Q(e_i) = 0`, and
  `σ : ℤ^ℓ → ℝ^ℓ` arbitrary. Suppose that for at least `ρ|N⃗|` shifts `h ∈ [N⃗]`,
  `‖P(n) + Q(n + h) − Q(n) + σ(h) · n‖_{C^∞[N⃗]} ≤ ρ^{−1}`. Then some nonzero `|q| ≤ C ρ^{−E}`
  has `‖q(σ(h) · n + Σ_i P(e_i) n_i + Σ_{i,j} ∂_{e_i}∂_{e_j}Q(0) n_i h_j)‖_{C^∞[N⃗]} ≤ C ρ^{−E}`
  for at least `ρ^E |N⃗| / C` of these shifts. When `σ = 0`, the same `q` controls
  `‖q P(e_i)‖_{ℝ/ℤ} ≤ C ρ^{−E}/N_i` and `‖q ∂_{e_i}∂_{e_j}Q(0)‖_{ℝ/ℤ} ≤ C ρ^{−E}/(N_i N_j)`.

*Route:* the one-variable recurrence lemma is ProbabilisticAndMetricNumberTheory
`vinogradov_lemma` for the linear term, combined with `weyl_sum_coefficients_inverse` applied to
the dilates `λp`, `λ ≤ δ/(2ε)`, pigeonholing the resulting moduli (GT's proof of Lemma 4.5). The
multiparameter case fibres over the last variable and uses extrapolation (0.1).

*Needs:* 0.1; ProbabilisticAndMetricNumberTheory §2.5a (`vinogradov_lemma`,
`weyl_sum_coefficients_inverse`).

### 0.3 Fourier approximation on tori with explicit dimension

Prove (Leng, Lemma A.5): there is an absolute `C ≥ 1` such that for every `L`-Lipschitz
`f : T^m → ℂ` and `0 < δ < 1/4` there are coefficients `a_k`, `k ∈ ℤ^m`,
`|k| ≤ (Cδ)^{−2m−1}`, with `Σ_k |a_k| ≤ (δ/(CL))^{−3m²}` and
`|f(x) − Σ_k a_k e(k · x)| ≤ 3 L m δ` for every `x` (*exists_trigPoly_approx*). *Route:*
convolve with the self-convolution of a product bump of width `δ`; Lipschitz gives the
approximation, and decay of the bump's Fourier coefficients gives the truncation.

*Needs:* Mathlib `UnitAddTorus.mFourier`, `fourierCoeff`, `MeasureTheory.convolution`.

### 0.4 Weyl's theorem for Lipschitz functions on tori

Let `p = (p₁, …, p_m) : ℤ^ℓ → T^m` be polynomial of degree at most `s` in each variable and
`F : T^m → ℂ` Lipschitz. Prove (GT, Proposition 3.1 for linear `p` and Proposition 4.3 for
`m = 1`, in multiparameter and torus-valued form): if
`|E_{n ∈ [N⃗]} F(p(n)) − ∫ F| ≥ δ ‖F‖_Lip`, then either `min_i N_i ≤ (1/δ)^{C m^E}` or some
`k ∈ ℤ^m` with `0 < |k| ≤ (1/δ)^{C m^E}` has `‖k · p‖_{C^∞[N⃗]} ≤ (1/δ)^{C m^E}`
(`exists_frequency_of_not_equidistributed_torus`). For `ℓ = 1` the first alternative is absorbed
into the second, since `‖p_1‖_{C^∞[N]} ≤ N^s/2`.

*Route:* 0.3 at scale `δ/(6m)`, pigeonhole a frequency `k ≠ 0` with
`|E e(k · p(n))| ≥ (δ/(Cm))^{C m²}`, and apply `weyl_sum_coefficients_inverse` to the phase
`k · p` (fibrewise for `ℓ ≥ 2`, then 0.1 extrapolation).

**Checks.**

- `p(n) = n/2` on `T¹`: `|E_{n<N} e(n/2)| ≤ 1/N`, so the character `e(x)` does not detect
  `p`. But `F(x) = cos(4πx)`, with `‖F‖_Lip = 1 + 4π`, has average `1` along `p` and integral
  `0`. The theorem returns `k = 2`, with `‖2p‖_{C^∞[N]} = 0`, and not `k = 1`.

*Needs:* 0.1–0.3; ProbabilisticAndMetricNumberTheory §2.5a.

### 0.5 Large averages have many large lag correlations

Prove the counting form of van der Corput on boxes. For `b : ℤ^ℓ → ℂ` with `|b| ≤ 1` and
`|E_{n ∈ [N⃗]} b(n)| ≥ δ`, at least `c δ^{C} |N⃗|` shifts `h ∈ [N⃗]` satisfy
`|E_{n ∈ [N⃗]} b(n + h) conj b(n)| ≥ c δ^{C}`, where `b` is extended by `0` outside `[N⃗]` and
`c`, `C` depend only on `ℓ`.

*Route:* the finite lag inequality on `ℤ^ℓ` of PolynomialOrbitsAndCubeGroups 5.1, with lags in
a box of sides comparable to `δ² N_i`, then counting as in ProbabilisticAndMetricNumberTheory
`weyl_sum_lag_count`, which is the case `ℓ = 1` in exponential-sum form.

*Needs:* PolynomialOrbitsAndCubeGroups 5.1; ProbabilisticAndMetricNumberTheory §2.5a.

## Layer 1: lattice points in convex bodies and refined bracket polynomials

### 1.1 Progressions in lattice points of convex bodies

Prove:

- **Ruzsa covering for bodies** (Leng, Lemma 3.3, which cites Tao–Vu for it): for bounded
  measurable `A, B ⊆ ℝ^m` of positive measure, `B` is covered by at most
  `min(vol(A + B), vol(A − B))/vol(A)` translates of `A − A`. *Route:* a maximal family of
  disjoint translates `b + A`, `b ∈ B`, as in Mathlib's finite `Finset.ruzsa_covering_add`.
- **Progressions in `B ∩ Λ`** (Leng, Proposition 3.1, which cites Tao–Vu for it): for a
  symmetric convex body `B` and a lattice `Λ ⊆ ℝ^m`, there are linearly independent
  `v₁, …, v_{m′} ∈ Λ` and lengths `L_i` such that the proper progression
  `{Σ_i l_i v_i | 0 ≤ l_i < L_i}` lies in `B ∩ Λ` and has at least `(Cm)^{−7m/2} |B ∩ Λ|`
  elements, `C` absolute. *Route:* successive minima `λ_i` of `Λ` in `B` with independent
  vectors `v_i ∈ λ_i B`. Minkowski's second theorem (upper half from Tau Ceti, lower half
  `2^m/m! · covol ≤ ∏ λ_i vol B`) compares `∏ λ_i⁻¹` with `vol B / covol Λ`. Ruzsa covering then
  compares that with `|B ∩ Λ|`. Take `L_i ≈ 1/(m λ_i)` for the `λ_i ≤ 1`.

*Needs:* Tau Ceti `ZLattice.successiveMin`,
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin`,
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`; SuccessiveMinima Layer 2
(the lower inequality); Mathlib `Finset.ruzsa_covering_add`, `ConvexBody`.

### 1.2 The refined bracket polynomial lemma

Prove (Leng, Lemma 3.1; `refined_bracket_polynomial`): let `0 < δ < 1/10`, `K ≥ 2`, `M ≥ 1`,
`N ≥ 2`, `α, a ∈ ℝ^d` with `|a| ≤ M`, and `β ∈ ℝ`. If `‖β + a · {α h}‖_{ℝ/ℤ} < K/N` for at
least `δN` integers `h ∈ [N]`, with `{·}` taken coordinatewise, then one of the following holds:

- `N ≤ C (δ/(d^d M))^{−C}`, or `K/N > 1/100`;
- there are linearly independent `w₁, …, w_r ∈ ℤ^d` with `∏_i |w_i| ≤ C (δ/(d^d M))^{−C}`, and
  linearly independent `η₁, …, η_{d−r} ∈ ℤ^d` of size at most `C (δ/(d^d M))^{−C}`, with
  `⟨w_i, η_j⟩ = 0` and `‖η_j · α‖_{ℝ/ℤ}, |w_i · a| ≤ C (δ/M)^{−C} d^{Cd} K/N`.

Here `C` is absolute. Prove also the multiparameter form (Leng, Lemma 3.2). The hypothesis there
is that `β · n + Σ_j n_j a_j · {Σ_i α_i h_i}` has `C^∞[N⃗]`-norm at most `K` for `δ|N⃗|` shifts
`h ∈ [N⃗]`, with `a_j, α_i ∈ ℝ^d`, and the conclusion bounds `‖η_k · α_j‖_{ℝ/ℤ}` and
`|w_i · a_j|` by `(δ/(dℓM))^{−C(d+ℓ)} K/N_j`. Prove further its corollary with an additional
bilinear term `Σ_{i,j} γ_{ij} n_i h_j` (Leng, Corollary 3.1).

*Route:* (Leng §3.2–3.4.) The set of `h` with `{α h}` in a small box near a recurrent value is
a Bohr set in `ℤ`. Lifted to `ℤ × ℤ^d`, it is the set of lattice points of a convex body, and
1.1 finds a large progression in it. Along the progression, `a · {α h}` is linear in the
progression coordinates. 0.2 applied coordinatewise gives the `w_i`, and the dual lattice gives
the `η_j`.

**Checks.**

- `d = 1`, `a = 1`, `β = 0`, `α = 0`: the hypothesis holds for every `h` and the conclusion holds
  with `r = 0`, `η₁ = 1`, `‖η₁ · α‖ = 0`.
- `d = 1`, `a = 0`: the hypothesis says `‖β‖ < K/N`, and `r = 1`, `w₁ = 1`, `|w₁ · a| = 0`
  works with no condition on `α`. Without the alternative `r = d`, `α` would have to be
  diophantine, which the hypothesis does not force.

*Needs:* 1.1, 0.2.

## Layer 2: quantitative notions on nilmanifolds

Fix a Mal'cev presentation of degree `s`, dimension `d` and complexity at most `M`.

### 2.1 Equidistribution at a scale

Define, for a finite nonempty `P ⊆ ℤ^ℓ` and `g : ℤ^ℓ → G`:

- `(g(n)Γ)_{n ∈ P}` is *`δ`-equidistributed* if
  `|E_{n ∈ P} F(g(n)Γ) − ∫ F dμ_{G/Γ}| ≤ δ ‖F‖_Lip` for every Lipschitz `F : G/Γ → ℂ`
  (`IsEquidistributedOn`; GT, Definitions 1.2 (iii) and 8.5);
- `(g(n)Γ)_{n ∈ [N⃗]}` is *totally `δ`-equidistributed* if this holds on every product
  `P₁ × ⋯ × P_ℓ` of arithmetic progressions `P_i ⊆ [N_i]` with `|P_i| ≥ δ N_i`
  (`IsTotallyEquidistributed`; GT, Definitions 1.2 (iv) and 8.5);
- *`δ`-equidistributed along a vertical frequency `ξ`*: the same, tested only on `F` with
  `G_s`-vertical frequency `ξ` (GT, Definition 3.6).

Prove: every finite sequence is `2`-equidistributed; equidistribution passes to quotients by
rational normal subgroups, with the Lipschitz norm of the descended function controlled as in
LSS, Lemma 3.10; and `(g(n)Γ)_{n ∈ ℕ}` is equidistributed in the sense of
PolynomialOrbitsAndCubeGroups Convention 5 if and only if, for every `δ > 0`, `(g(n)Γ)_{n ∈ [N]}`
is `δ`-equidistributed for all large `N`. The proof uses density of Lipschitz functions in
`C(G/Γ)`.

**Checks.**

- The constant sequence `g = 1` on the circle (`G = ℝ`, `Γ = ℤ`): `F(x) = 1/2 − ‖x‖_{ℝ/ℤ}` has
  `‖F‖_Lip = 1/2 + 1` and `F(0) − ∫ F = 1/2 − 1/4 = (1/6) ‖F‖_Lip`. So the sequence is not
  `δ`-equidistributed for `δ < 1/6`, although it is `2`-equidistributed, as is every sequence.

*Needs:* PolynomialOrbitsAndCubeGroups 2.1–2.2; NilmanifoldsAndNilsequences 2.5, 3.3, 3.4.

### 2.2 Smooth and rational sequences

- `ε : ℤ^ℓ → G` is *`(K, N⃗)`-smooth* if `d_G(ε(0), 1) ≤ K` and
  `d_G(ε(n + e_i), ε(n)) ≤ K/N_i` for `n ∈ [N⃗]` and every `i` (`IsSmooth`; LSS, Definition 3.16;
  Leng, Definition 2.6). GT, Definitions 1.18 and 9.1 ask for `d_G(ε(n), 1) ≤ K` on all of
  `[N⃗]`. Prove that the two notions agree up to replacing `K` by `(ℓ + 1)K`, by summing steps
  along a monotone lattice path.
- `γ : ℤ^ℓ → G` is *`Q`-rational* if some `1 ≤ q ≤ Q` has `ψ(γ(n)) ∈ q⁻¹ ℤ^d` for all `n`
  (`IsRationalSeq`; LSS, Definition 3.16). By NilmanifoldsAndNilsequences 4.3, this agrees with
  GT's pointwise notion (Definition 1.17: each `γ(n)^r ∈ Γ` for some `r ≤ Q`) up to replacing `Q`
  by `C (MQ)^E`.

Prove:

- **products** (GT, Lemma 10.1): products of `(K, N⃗)`-smooth sequences are
  `(C (MK)^{C d^E}, N⃗)`-smooth (`IsSmooth.mul`), by right invariance of `d_G` and approximate
  left invariance (NilmanifoldsAndNilsequences 3.2);
- smooth polynomial sequences have `|ψ(ε(n))| ≤ (MK)^{C d^E}` on `[N⃗]`, and a
  `(K, N⃗)`-smooth `ε` moves a Lipschitz `F` by at most `(MK)^{C d^E} ‖F‖_Lip · L/N_i` over `L`
  steps in direction `i`;
- **rational sequences are periodic:** a `Q`-rational polynomial sequence has `(g(n)Γ)_n`
  periodic in each variable with period at most `(MQ)^{C d^E}` (NilmanifoldsAndNilsequences 4.3
  with efficient constants). Products of a rational element with `Q`-rational ones, and the
  conjugates `γ g γ⁻¹` of `Q`-rational `g` by rational `γ`, are rational with efficient bounds.

**Checks.**

- On the circle, `ε(n) = n/N` is `(1, N)`-smooth (`d(ε(0), 1) = 0`, steps `1/N`), and `n ↦ n/2`
  is `2`-rational and not `(1/4, N)`-smooth for `N ≥ 1`: its first step has length `1/2`.

*Needs:* NilmanifoldsAndNilsequences 3.2, 4.1, 4.3.

### 2.3 Rational subgroups produced by characters

Prove, with efficient bounds in the rationality:

- the kernel `⋂_j ker η_j` of horizontal characters of size at most `L`, and the kernel of a
  `T`-vertical frequency of size at most `L` on a `Q`-rational central `T`, are
  `(MLQ)^{C d^E}`-rational (NilpotentLieHeightsAndFiltrations 1.2, annihilators);
- the terms `G_(i)` of the lower central series are `M^{C d^E}`-rational (LSS, Remark 5.3);
- the join of `Q`-rational normal subgroups is `(MQ)^{C d^E}`-rational (LSS, Fact 3.7, from
  NilpotentLieHeightsAndFiltrations 2.3, generated subalgebras);
- **rational conjugates** (GT, Lemma A.13): for a `Q`-rational subgroup `H` and a `Q`-rational
  element `τ`, `τ⁻¹ H τ` is `(MQ)^{C d^E}`-rational, and `τ⁻¹ H τ ∩ Γ` is cocompact in it.

*Needs:* NilmanifoldsAndNilsequences 2.2, 4.3; NilpotentLieHeightsAndFiltrations 1.2, 2.3.

### 2.4 Normalisations

Prove:

- **basepoint** (Leng, Lemma 2.1): every nilsequence `F(g(n)Γ)` equals `F̃(g̃(n)Γ)` with
  `g̃(0) = 1`, `|ψ(g̃(e_i))| ≤ 1/2`, `‖F̃‖_Lip ≤ M^{C d^E} ‖F‖_Lip`. Moreover `η ∘ g` and `η ∘ g̃`
  have equal smoothness norms for every horizontal character `η`, and vertical frequencies are
  kept. *Route:* `g̃(n) = {g(0)}⁻¹ g(n) [g(0)]⁻¹ ∏_i [g(e_i)]^{−n_i}` with the fundamental domain
  of NilmanifoldsAndNilsequences 2.4 (Lemma A.14 there) and 4.2.
- **one-dimensional vertical torus** (Leng, Lemma 2.2): for a nonzero `G_(t)`-frequency `ξ` of
  size at most `L`, the nilsequence descends to `G/ker ξ`. This quotient has one-dimensional
  `G_(t)`-image, complexity at most `(ML)^{C d^E}`, the same horizontal torus when `t ≥ 2`, and
  horizontal characters of size `Q` there have size at most `(LQM)^{C d^E}` on `G`. The descended
  function is `(ML)^{C d^E}`-Lipschitz (LSS, Lemma 3.10; NilmanifoldsAndNilsequences 2.5).
- **efficient vertical expansion** (Leng, Lemma A.6): for a `Q`-rational central subgroup `H`,
  an `L`-Lipschitz `F` and `0 < δ < 1/100`, `F` is within `δ` everywhere of
  `Σ_{|ξ| ≤ (δ/(QL))^{−C d^E}} F_ξ`, where each `F_ξ` has `H`-vertical frequency `ξ` and Lipschitz
  norm at most `(δ/(QML))^{−C d^E}`. This is the efficient form of NilmanifoldsAndNilsequences
  5.3, which is stated for `H = G_s` with constants depending on `d`. *Route:* 0.3 on the torus
  `H/(H ∩ Γ)` in a Mal'cev basis of `H` (Convention 7).
- **vertical oscillation reduction** (GT, Lemma 3.7, efficient form): if `(g(n)Γ)_{n ∈ [N⃗]}` is
  not `δ`-equidistributed, then for some `G_s`-frequency `|ξ| ≤ (M/δ)^{C d^E}` it is not
  `(δ/M)^{C d^E}`-equidistributed along `ξ`. Here `ξ = 0` is allowed.

*Needs:* 0.3, 2.1, 2.3; NilmanifoldsAndNilsequences 2.4, 2.5, 4.2, 5.3.

### 2.5 Factorisation from horizontal characters

Prove:

- **linear algebra** (LSS, Lemma B.1): for `v₁, …, v_k ∈ ℤ^m` with entries at most `H ≥ 2` and
  `w ∈ ℝ^m` with `‖v_i · w‖_{ℝ/ℤ} ≤ ρ`, `w = w_small + w_rat + w′` with
  `|w_small| ≤ ρ H^{C m^E}`, `w_rat ∈ q⁻¹ ℤ^m` for some `q ≤ H^{C m^E}`, and `v_i · w′ = 0`.
  *Route:* NilpotentLieHeightsAndFiltrations 1.1 (Cramer).
- **factorisation lemma I** (Leng, Lemma A.1): for linearly independent nontrivial horizontal
  characters `η₁, …, η_r` of size at most `L` with `‖η_j ∘ g‖_{C^∞[N⃗]} ≤ δ⁻¹`, `g = ε g₁ γ`
  with `ε` `((ML/δ)^{C d^E}, N⃗)`-smooth, `γ` `(ML)^{C d^E}`-rational, and `g₁` taking values in
  `G̃ = ⋂_j ker η_j`, a subgroup of complexity at most `(ML)^{C d^E}`. The factors are polynomial
  for `G_•` and its restriction to `G̃`, and if `g(0) = 1` one may take `ε(0) = γ(0) = 1`.
  *Route:* the Taylor coefficients of `g` in Mal'cev coordinates (NilmanifoldsAndNilsequences
  4.1), split by the previous item level by level.
- **factorisation lemma II** (Leng, Lemma A.2): the same for characters on `G₂` that annihilate
  `[G, G]`, controlling the nonlinear part `g₂(n) = g(n) g_lin(n)⁻¹`, where
  `g_lin(n) = ∏_i g(e_i)^{n_i}`. The output `g₁` is polynomial for the filtration
  `G̃₀ = G̃₁ = G`, `G̃₂ = ⋂_j ker η_j`, `G̃_i = G_i ∩ G̃₂` for `i ≥ 2`.
- **degree–rank Taylor factorisation** (LSS, Lemma B.2): for a degree–rank `(s, r)` filtration,
  `g(0) = 1` and level-`i` characters `ψ_{i,j}` of size at most `H` with
  `‖ψ_{i,j}(Taylor_i(g))‖_{ℝ/ℤ} ≤ H N^{−i}`, `g = ε g′ γ` with `ε(0) = g′(0) = γ(0) = 1`,
  `ψ_{i,j}(Taylor_i(g′)) = 0`, `γ` `(MH)^{C d^E}`-rational and
  `d_G(ε(n), ε(n − 1)) ≤ (MH)^{C d^E}/N` on `[N]`. All three factors are polynomial for the
  degree–rank filtration. `Taylor_i` is NilmanifoldsAndNilsequences 0.5.

*Needs:* 2.2, 2.3; NilmanifoldsAndNilsequences 0.5, 4.1; NilpotentLieHeightsAndFiltrations 1.1;
PolynomialOrbitsAndCubeGroups 3.2 (level characters).

### 2.6 Leibman squares with complexity

PolynomialOrbitsAndCubeGroups 0.4 and 4.1 supply the Leibman square
`G^□ = G ×_{G₂} G = {(g′, g) | g′ g⁻¹ ∈ G₂}` with filtration `G^□_i = G_i ×_{G_{i+1}} G_i`, its
lattice `Γ^□ = (Γ × Γ) ∩ G^□`, a Mal'cev basis, and the quotient `G^□/Δ(G_s)` of degree `s − 1`
modulo the diagonal. Prove the quantitative facts (Leng, Lemma A.3; GT, Proposition 7.2 and
Lemma 7.4):

- `G^□` and `G^□/Δ(G_s)` have complexity at most `M^{C d^E}`;
- for `F` with `‖F‖_Lip ≤ L` and `|ψ(a)| ≤ 1/2`, `F^□(x, y) = F(a x) conj F(y)` has
  `‖F^□‖_Lip ≤ (ML)^{C d^E}`. If `F` has `G_s`-frequency `ξ`, `F^□` is `Δ(G_s)`-invariant and
  descends to `G^□/Δ(G_s)`;
- **horizontal characters of the square** (GT, Lemma 7.5): every horizontal character of `G^□`
  is uniquely `η(g′, g) = η₁(g) + η₂(g′ g⁻¹)`, with `η₁` a horizontal character of `G` and `η₂`
  a character of `G₂` trivial on `[G, G₂]` and on `Γ ∩ G₂`. If `|η| ≤ Q` then
  `|η₁|, |η₂| ≤ (MQ)^{C d^E}`;
- **derivative sequences** (Leng, Lemma A.4): for `g` with `g(0) = 1` and `h ∈ ℤ^ℓ`, the
  sequence `g_h(n) = ({g_lin(h)}⁻¹ g₂(n + h) g_lin(n + h) [g_lin(h)]⁻¹, g(n))` lies in
  `poly(ℤ^ℓ, G^□_•)`, and `F(g(n + h)Γ) conj F(g(n)Γ) = F^□(g_h(n)Γ^□)` with `a = {g_lin(h)}`.
  For `η = (η₁, η₂)` as above, compute `η(g_h(n))` as `η₁(g(n)) + η₂(g₂(n + h)) − η₂(g₂(n))`
  plus the bracket terms `Σ_i n_i η₂([g(e_i), {g_lin(h)}]) + Σ_{i<j} h_i n_j η₂([g(e_i), g(e_j)])`
  (Leng §4.1);
- **commutators with one entry in `G₂`** (Leng, Lemma 4.1): for `G₂ ⊇ [G, G]`, every
  `(u − 1)`-fold commutator with `u − 1` entries in `G` and one in `G₂` lies in
  `[G₂, G, …, G]`, by the Hall–Witt identity.

*Needs:* 2.3, 2.4; PolynomialOrbitsAndCubeGroups 0.4, 4.1; NilmanifoldsAndNilsequences 0.3, 2.4.

## Layer 3: efficient equidistribution

### 3.1 Leng's theorem

**Theorem** (Leng, Theorem 4 of arXiv:2312.10772v5, stated as LSS, Theorem 5.2;
`exists_horizontalCharacters_of_verticalFrequency`). Let `G` have step `t ≥ 1`, and let
`F : G/Γ → ℂ` be `M`-Lipschitz with a nonzero `G_(t)`-vertical frequency `ξ`, `|ξ| ≤ M/δ`
(`0 < δ < 1/10`). Let `g ∈ poly(ℤ^ℓ, G_•)` satisfy `|E_{n ∈ [N⃗]} F(g(n)Γ)| ≥ δ`. Then either
`min_i N_i ≤ (M/δ)^{C d^E}`, or there are `1 ≤ r ≤ dim G/[G, G]` and horizontal characters
`η₁, …, η_r` of size at most `(M/δ)^{C d^E}` with `‖η_j ∘ g‖_{C^∞[N⃗]} ≤ (M/δ)^{C d^E}`, such that
`ξ([[[w₁, w₂], w₃], …, w_t]) = 0` for all `w₁, …, w_t ∈ ⋂_j ker η_j`. LSS states the conclusion
with `0 ≤ r` and absorbs the case in which `G` has step less than its nominal step (LSS,
Remark after Theorem 5.2).

*Route* (Leng §4), by induction on the step `t`, and within a step on the degree `s`:

1. `t = 1`: `F(x) = c · e(ξ(x))` and the claim is 0.4 for one character, with `η = qξ`.
2. Reductions: 2.4 basepoint and one-dimensional `G_(t)`. Replace `G_i` by `G_i G_(t)` for
   `i ≥ t`, which keeps a full filtration of complexity `M^{C d^E}` (NilmanifoldsAndNilsequences
   2.3). Expand `F` along the central `G_s` by 2.4 and pigeonhole one frequency `ζ` with
   `ζ − ξ` trivial on `G_(t)`.
3. van der Corput (0.5): for `(M/δ)^{−C d^E} |N⃗|` shifts `h`, the derivative nilsequence
   `F^□(g_h(n)Γ^□)` of 2.6 has a large average on `G^□/Δ(G_s)`.
4. *Case 1*, `ξ([G₂, G, …, G]) = 0` (`t − 1` entries `G`): by 2.6 (commutators with one entry
   in `G₂`), the quotient of `G^□` has step `t − 1` with vertical frequency `ξ ⊗ ξ̄`. The
   induction hypothesis gives `h`-dependent horizontal characters of `G^□`. Their components
   (2.6) have bracket terms linear in `n` with coefficients `{g_lin(h)}`. The multiparameter
   refined bracket polynomial lemma (1.2, corollary form) and 0.2 (many shifts) turn these into
   `h`-independent horizontal characters of `G` with the conclusion.
5. *Case 2*, `ξ([G₂, G, …, G]) ≠ 0`: the step stays `t` and the degree drops to `s − 1` on
   `G^□/Δ(G_s)`. The phases between brackets are genuine polynomials in `h`, and 0.2
   (Vinogradov) with the induction on the degree concludes.

Each induction step composes boundedly many efficient bounds (Convention 4).

**Checks.**

- If `G` is abelian (`t = 1`), the conclusion says that `ξ` vanishes on `⋂ ker η_j`, so `ξ` lies
  in the real span of the lifts of the `η_j`. For `G = ℝ`, `Γ = ℤ`, `F = e(x)` and
  `g(n) = αn`, the conclusion holds with `r = 1` and `η = x`, by
  ProbabilisticAndMetricNumberTheory `weyl_sum_linear_inverse`: `‖α‖_{ℝ/ℤ} ≤ 1/(2δN)`.

*Needs:* Layers 0–2.

### 3.2 The quantitative Leibman theorem

**Theorem** (GT, Theorems 1.16, 2.9 and 8.6, with efficient bounds;
`exists_horizontalCharacter_of_not_equidistributed`). If `(g(n)Γ)_{n ∈ [N⃗]}` is not
`δ`-equidistributed, then either `min_i N_i ≤ (M/δ)^{C d^E}`, or some nontrivial horizontal
character `η` with `|η| ≤ (M/δ)^{C d^E}` has `‖η ∘ g‖_{C^∞[N⃗]} ≤ (M/δ)^{C d^E}`. For `ℓ = 1` the
first alternative is absorbed into the second.

*Route:* induction on the step. Expand along the central rational `G_(t)` (2.3, 2.4) and
pigeonhole one frequency `ξ`. If `ξ = 0`, the piece descends to `G/G_(t)`, of step `t − 1` and
the same horizontal torus when `t ≥ 2` (2.4), and the induction hypothesis applies. If `ξ ≠ 0`,
its integral vanishes and 3.1 gives `r ≥ 1` characters, of which `η₁` is nontrivial. When
`t = 1` the piece with `ξ = 0` is constant and has no discrepancy. For `ℓ = 1` and
`N ≤ (M/δ)^{C d^E}`, the first Mal'cev coordinate gives a horizontal character of size `1`
(NilmanifoldsAndNilsequences 4.4), whose smoothness norm is at most `N^s/2`. If `d = 0` every
sequence is `0`-equidistributed.

**Relation to PolynomialOrbitsAndCubeGroups 5.2.** The ineffective single-scale theorem there
gives, for a compact family of continuous test functions, a finite set `U` of horizontal
characters and a constant `A` with no bound. For the family of `F` with `‖F‖_Lip ≤ 1`, this
theorem makes both explicit: `U` is the set of nontrivial horizontal characters of size at most
`(M/δ)^{C d^E}`, `A = (M/δ)^{C d^E}` works, and both depend on `G/Γ` only through `d`, `s` and
`M`. The coefficients `α_j` of 5.2 there are the binomial coefficients of `η ∘ g` in 0.1.

**Checks.**

- The circle of degree `s` with `F = e(x)` recovers the Weyl inverse theorem: if
  `|E_{n<N} e(P(n))| ≥ δ` for a real polynomial `P` of degree `s`, some `1 ≤ q ≤ (1/δ)^{C}`
  has `‖q P‖_{C^∞[N]} ≤ (1/δ)^C`, matching ProbabilisticAndMetricNumberTheory
  `weyl_sum_coefficients_inverse` through 0.1 (representation change).
- On the Heisenberg nilmanifold, a horizontal character is `η = a x + b y` and the linear orbit
  `g(n) = exp(n(αX + βY))` has `‖η ∘ g‖_{C^∞[N]} = N ‖aα + bβ‖_{ℝ/ℤ}`. So the theorem says that
  the orbit is `δ`-equidistributed as soon as `‖aα + bβ‖_{ℝ/ℤ} > B/N` for all
  `0 < |(a, b)| ≤ B`, `B = (M/δ)^{C}`: the horizontal torus alone decides, as in GT,
  Proposition 5.1. For `α = 0` the character `η = x` has `η ∘ g ≡ 0`, and the orbit indeed stays
  in the sub-nilmanifold `x = 0`.

*Needs:* 3.1, 2.4.

## Layer 4: factorisation theorems

### 4.1 Factorisation along a central frequency

**Theorem** (LSS, Theorem 5.4 for one-dimensional `T`, Corollary 5.5 in general;
`exists_factorization_of_verticalFrequency`). Let `T ≤ Z(G)` be an `M`-rational connected
subgroup, `F` with `‖F‖_Lip ≤ M` and a nonzero `T`-vertical frequency `ξ`, `|ξ| ≤ M/δ`
(`0 < δ < 1/10`), and `N ≥ (M/δ)^{C d^E}`. If `|E_{n ∈ [N]^ℓ} F(g(n)Γ)| ≥ δ`, then
`g = ε g′ γ` with factors in `poly(ℤ^ℓ, G_•)` such that:

- `g′` takes values in an `(M/δ)^{C d^E}`-rational subgroup `H` with `ξ(H ∩ T) = 0`, and with
  `H ∩ T = 1` when `T` is one-dimensional;
- `γ` is `(M/δ)^{C d^E}`-rational and `ε` is `((M/δ)^{C d^E}, N)`-smooth on the cube `[N]^ℓ`;
- if `g(0) = 1`, then `ε(0) = g′(0) = γ(0) = 1`.

The statement is for cubes, as in LSS. Leng's theorem 3.1 allows boxes, but the lifting
argument below is only carried out in LSS for cubes.

*Route:* LSS §5. For one-dimensional `T`, iterate 3.1 at most `s` times. At stage `k` pass to
`G^{k}/ker ξ_k`, whose step is smaller. 2.5 (lemma I) turns the characters into a factorisation
on a sub-progression of `[N]^ℓ`. Lift the factors back along the quotient maps with Mal'cev lifts
of efficient height, and conjugate the output subgroup by a rational element (2.3, rational
conjugates). For general `T`, quotient by `ker ξ` (LSS, Lemma 3.10), apply the one-dimensional
case, and lift as in LSS's proof of Corollary 5.5. The discrepancy `ker ξ ≤ H′` is central and
is moved into `g′`.

*Needs:* 3.1, 2.2–2.5.

### 4.2 Poorly distributed sequences factor

**Theorem** (GT, Proposition 9.2, efficient form;
*exists_factorization_of_not_totallyEquidistributed*).
If `(g(n)Γ)_{n ∈ [N⃗]}` is not totally `δ`-equidistributed and `min_i N_i ≥ (M/δ)^{C d^E}`, then
`g = ε g′ γ` with `ε` `((M/δ)^{C d^E}, N⃗)`-smooth, `γ` `(M/δ)^{C d^E}`-rational, and `g′`
taking values in a proper connected `(M/δ)^{C d^E}`-rational subgroup.

*Route:* a product of progressions `P_i ⊆ [N_i]` of length `≥ δN_i` on which equidistribution
fails is the image of a box under `n ↦ a + b n`, and the reparametrised sequence is polynomial
(NilmanifoldsAndNilsequences 0.3). 3.2 gives a character with small smoothness norm on the small
box, extrapolation (0.1) brings it back to `[N⃗]`, and 2.5 (lemma I) gives the factorisation. The
basepoint reduction of 2.4 removes `g(0)`.

*Needs:* 3.2, 2.4, 2.5, 0.1.

### 4.3 The factorisation theorem

**Theorem** (GT, Theorems 1.19 and 10.2; `exists_factorization`). Let `A > 0`, let the
presentation have complexity at most `M₀`, and let `C` and `E` be the constants below, which
depend on `A`, `d`, `s` and `ℓ`. Assume `min_i N_i ≥ C M₀^E` when `ℓ ≥ 2`. Then there are `M`
with `M₀ ≤ M ≤ C M₀^E`, an `M`-rational subgroup `G′ ≤ G` with a Mal'cev
presentation of complexity at most `M` whose lattice is `Γ ∩ G′`, and a factorisation
`g = ε g′ γ` in `poly(ℤ^ℓ, G_•)` with:

- `ε` `(M, N⃗)`-smooth;
- `g′` taking values in `G′`, with `(g′(n)Γ′)` `M^{−A}`-equidistributed in `G′/Γ′` on every
  product of progressions `P_i ⊆ [N_i]` with `|P_i| ≥ N_i/M^A`, for the metric of the
  presentation of `G′`;
- `γ` `M`-rational, with `(γ(n)Γ)` periodic of period at most `M` in each variable.

*Route:* GT §10. Iterate 4.2 with a decreasing sequence of tolerances `δ₁ > δ₂ > ⋯`. Each step
replaces `G` by a proper rational subgroup (with the Mal'cev presentation of
NilmanifoldsAndNilsequences 2.2), so there are at most `d` steps. Products of smooth sequences
are smooth (2.2), and rational factors are moved across with rational conjugates (2.3). The
dimension-dependent number of steps is why the bound here is polynomial and not efficient. The
lower bound on the `N_i` for `ℓ ≥ 2` feeds the first alternative of 3.2 at every step. GT's
Theorem 10.2 has no such hypothesis, and for `ℓ = 1` none is needed.

*Needs:* 4.2, 2.2, 2.3; NilmanifoldsAndNilsequences 2.2, 4.3.

### 4.4 Ratner-type decomposition

**Theorem** (GT, Corollary 1.20). Let the presentation have complexity at most `1/δ` and
`ℓ = 1`. Then `[N]` is a union of arithmetic progressions `P₁, …, P_k` of common difference
`1 ≤ q ≤ δ^{−C}` and lengths at least `δ^C N`, with `C` depending on `d` and `s`. Each orbit
`(g(n)Γ)_{n ∈ P_i}` is within `δ` of equidistributed on the sub-nilmanifold `x_i G′ y_i Γ/Γ`,
for the Haar measure of PolynomialOrbitsAndCubeGroups 2.3. Here `x_i ∈ G`, `y_i` is
`δ^{−C}`-rational, and `G′` is `δ^{−C}`-rational. *Route:* 4.3 with `A` large. On progressions
of difference the period of `γ` and length `δ^C N`, `γ` is constant and `ε` moves by at most `δ`
(2.2).

*Needs:* 4.3, 2.2; PolynomialOrbitsAndCubeGroups 2.3.

### 4.5 Degree–rank and multidegree filtrations

Prove the transfer statements that let the theorems of Layers 3–4 be applied to the nilmanifolds
of GowersInverseTheorem:

- a degree–rank `(s, r)` nilmanifold of complexity `M` (Mal'cev basis adapted to the
  lexicographically ordered layers) is a degree-`s` nilmanifold of complexity `M` for the
  associated degree filtration `G_{(i,0)}` (LSS, Remark after Definition 3.5). Its polynomial
  sequences are polynomial for that filtration (NilmanifoldsAndNilsequences 0.2);
- a multidegree-`J` nilmanifold of complexity `M` (LSS, Definition 3.8) is a nilmanifold of
  complexity `M` for its associated degree filtration on `G`, and multidegree polynomial
  sequences on `ℤ^k` are polynomial for the degree filtration of `ℤ^k` (NilmanifoldsAndNilsequences
  0.2). The layers `G_v⃗` are `M`-rational, so the subgroups of 2.3 built from them are rational
  with efficient bounds;
- products of nilmanifolds of the same kind (LSS, Fact 3.9) keep complexity, and the product
  of `M`-Lipschitz functions is `3M²`-Lipschitz;
- 2.5 (degree–rank Taylor factorisation) keeps degree–rank polynomiality of all factors.

*Needs:* 2.5, 3.2, 4.1; NilmanifoldsAndNilsequences 0.2, 2.1, 2.5.

## Worked examples

- **Tori.** For `G = ℝ^m`, `Γ = ℤ^m`, `s = 1`, every statement of Layers 3–4 reduces to Layer 0:
  3.2 is 0.4, the factorisation of 4.3 is Leng's Proposition 1.1 (`α = ε + α′ + γ` with `ε`
  small, `γ` rational and `α′` totally equidistributed in a rational subtorus), and 4.4 is the
  decomposition of `[N]` into progressions on which a linear orbit equidistributes in a coset of
  a subtorus.
- **Polynomial phases.** The circle of degree `s` (NilmanifoldsAndNilsequences 2.1) with
  `F = e`: 3.2 is the Weyl inverse theorem with efficient bounds, and the factorisation of
  `n ↦ P(n)` is `P = P_small + P_rat + P′` with `P_rat` having coefficients in `q⁻¹ℤ`.

## Downstream consumers

**GowersInverseTheorem** takes from this roadmap: the notions of 2.1–2.2 (equidistribution at a
scale, smooth and rational sequences, `IsSmooth`, `IsRationalSeq`, `cInftyNorm`); Leng's theorem
3.1 and the quantitative Leibman theorem 3.2; the factorisations 4.1 (along a central frequency)
and 2.5 (degree–rank Taylor factorisation, factorisation lemmas I and II); the refined bracket
polynomial lemma 1.2 and the many-shifts lemma 0.2; the Leibman-square complexity of 2.6; and the
transfer statements of 4.5. **PolynomialOrbitsAndCubeGroups** proves its theorems qualitatively
and does not depend on this roadmap. Its 5.2 is the ineffective shadow of 3.2.

## Scope and ownership

This roadmap owns:

- smoothness norms of polynomial phases on `ℤ^ℓ` with their extrapolation and representation
  change, multiparameter Vinogradov-type lemmas, the many-shifts lemma, efficient Fourier
  approximation on tori, and the Weyl theorem for Lipschitz functions on tori at a single scale;
- the counting form of van der Corput on boxes;
- Ruzsa covering for bodies in `ℝ^m`, large progressions in lattice points of convex bodies, and
  the refined bracket polynomial lemmas;
- `δ`-equidistribution and total `δ`-equidistribution at a scale, smooth and rational sequences,
  rational subgroups produced by characters and rational conjugates, the normalisations of 2.4
  (including the efficient vertical expansion along rational central subgroups), factorisations
  from horizontal and level characters, and the complexity bounds of Leibman squares and their
  derivative sequences;
- Leng's efficient equidistribution theorem, the quantitative Leibman theorem, the factorisation
  along a central frequency, the factorisation of poorly distributed sequences, the Green–Tao
  factorisation theorem and its Ratner-type corollary, and the transfer to degree–rank and
  multidegree filtrations.

It does not own:

- **NilmanifoldsAndNilsequences:** filtrations, polynomial maps and Taylor expansions,
  horizontal Taylor coefficients, Mal'cev presentations and rational nilmanifolds, their
  quotients, products and rational subgroups, metrics and Lipschitz functions, partitions of
  unity, rational points and periodicity, horizontal and vertical characters, the vertical
  Fourier decomposition with constants depending on `d` (its 5.3), nilsequences and
  nilcharacters. 2.4 here adds only the efficient dependence on `d` and arbitrary rational
  central subgroups.
- **PolynomialOrbitsAndCubeGroups:** invariant probabilities on nilmanifolds and
  sub-nilmanifolds, cube groups, the Leibman square with its filtration, lattice and Mal'cev
  basis, level characters, the van der Corput lemma (its 5.1, including the finite form on
  `ℤ^m`), the ineffective single-scale theorem and every qualitative equidistribution statement.
- **ProbabilisticAndMetricNumberTheory §2.5a:** the lag-counting inequality, Vinogradov's lemma
  and the inverse theorems for Weyl sums of polynomial phases (exponential sums only).
  Lipschitz test functions on tori are owned here (0.4).
- **NilpotentLieHeightsAndFiltrations:** Cramer bounds, kernels, annihilators, quotients,
  generated subalgebras and the degree–rank and multidegree filtrations of Lie algebras.
- **SuccessiveMinima** and **Tau Ceti:** successive minima and Minkowski's second theorem.
- **GowersInverseTheorem:** the induction on the degree and the inverse theorem, symbols and
  equivalence of nilcharacters, the converse inverse theorem (LSS, Lemma B.5), the existence of
  nilcharacters (owned by NilmanifoldsAndNilsequences 5.4; LSS, Lemma B.4), and every
  construction used only in the inverse theorem. LSS, Lemma B.3 (partitions of unity) is
  NilmanifoldsAndNilsequences 3.4.
- **AlmostPeriodicityAndBohrSets:** Bohr sets and coset progressions in abelian groups. 1.1 here
  concerns lattice points of convex bodies in `ℝ^m` and is not stated for Bohr sets.

Outside this roadmap: equidistribution on homogeneous spaces of non-nilpotent groups,
quantitative Ratner theory beyond nilmanifolds, and Möbius orthogonality to nilsequences.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib: `Ring.choose`, `UnitAddCircle` and its norm, `UnitAddTorus`,
`UnitAddTorus.mFourier`, `fourierCoeff`, `MeasureTheory.convolution`, `ConvexBody`,
`Finset.ruzsa_covering_add`, `Subgroup.lowerCentralSeries`, `commutatorElement`, `QuotientGroup`,
`MeasureTheory.integral`, `Fintype.piFinset`.

### From Tau Ceti

At the pinned Tau Ceti: `ZLattice.successiveMin`,
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin`
(TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean),
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`
(TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean), in 1.1;
`TauCeti.binomialPolynomialBasis` (TauCeti/RingTheory/Polynomial/BinomialBasis.lean), in 0.1.

### From TauCetiRoadmap.NilmanifoldsAndNilsequences

Names of its `Suggested.lean`: `GroupFiltration`, `AddGroupFiltration`, `IsPolynomialMap`,
`weightedFiltration`, `horizKernel`, `taylorCoeff`, `MalcevPresentation`,
`MalcevPresentation.ComplexityLE`, `MalcevPresentation.existsUnique_fundamentalDomain`,
`chainDist`, `MalcevPresentation.malcevDist`, `MalcevPresentation.nilDist`,
`malcevDist_comparison`, `malcevDist_mul_left_le`, `isPolynomialMap_iff_coord`,
`HasVerticalFrequency`, `exists_verticalFrequency_decomposition`. Sections: 0.2–0.5 (polynomial
maps, Lazard–Leibman, Taylor coefficients, horizontal Taylor coefficients), 2.1–2.6 (rational
nilmanifolds of degree, degree–rank and multidegree; rational subgroups with Mal'cev bases;
Mal'cev presentations and the fundamental domain; quotients and products), 3.2–3.4 (metrics,
Lipschitz norms, partitions of unity), 4.1–4.4 (coordinates of polynomial sequences, basepoint
normalisation, rational points and periodicity, characters), 5.3 (vertical decomposition).

### From TauCetiRoadmap.PolynomialOrbitsAndCubeGroups

Names of its `Suggested.lean`: `existsUnique_smulInvariant_probabilityMeasure`,
`IsHorizontalCharacter`, `IsLevelCharacter`, `mem_hkCube_unit_iff`,
`exists_finset_horizontalCharacter_of_discrepancy`. Sections: 0.4 and 4.1 (the Leibman square,
its filtration, lattice and Mal'cev basis, the square of a polynomial sequence), 2.1–2.3 (Haar
measures on nilmanifolds and sub-nilmanifolds), 3.2 (level characters), 5.1 (van der Corput,
finite form on `ℤ^m`), 5.2 (the ineffective single-scale theorem, which 3.2 strengthens).

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

Names of its `Suggested.lean`, §2.5a: `circlePolynomial`, `weyl_sum_lag_count`,
`vinogradov_lemma`, `weyl_sum_linear_inverse`, `weyl_sum_coefficients_inverse`.

### From TauCetiRoadmap.NilpotentLieHeightsAndFiltrations

Sections 1.1–1.3 (Cramer bounds, kernels, annihilators, quotients), 2.3 (generated subalgebras,
quotients), 4.2–4.3 (degree–rank and multidegree filtrations).

### From TauCetiRoadmap.SuccessiveMinima

Layer 2: the lower inequality of Minkowski's second theorem, in 1.1.

## Provenance

This roadmap was extracted from a Lean development of Hindman's finite sums-and-products
theorem, part of whose code is derived from openai/math (Apache-2.0, commit `adc7f124`). That
development does not use Green–Tao or Leng equidistribution.
It contains the following related factorisation tools, with complexity tracked through
logarithmic height budgets:

- the finiteness, with an explicit count, of rational Lie subalgebras spanned by vectors of
  bounded height, and the pigeonholing of a common subalgebra over a large family;
- Lipschitz partitions of unity on products of nilmanifolds with controlled diameters;
- factorisations of polynomial orbits into smooth corrections, orbits in rational subgroups and
  periodic parts, built from height-bounded subalgebras and integral models.

The statements of this roadmap are specified from GT, Leng and LSS. The source is not
prescriptive.

## References

- [GT] B. Green and T. Tao, *The quantitative behaviour of polynomial orbits on nilmanifolds*,
  Ann. of Math. 175 (2012) 465–540, arXiv:0709.3562 (v6): Definitions 1.2, 1.17, 1.18, 2.5–2.7,
  3.6, 8.1, 8.2, 8.5, 9.1; Theorems 1.16, 1.19, 2.9, 8.6, 10.2; Corollary 1.20; Propositions 3.1,
  4.3, 5.1, 7.2, 9.2; Lemmas 2.8, 3.7, 4.5, 7.4, 7.5, 7.6, 8.3, 8.4, 10.1, A.13.
- [Leng] J. Leng, *Efficient equidistribution of nilsequences*, arXiv:2312.10772 (v5):
  Theorem 4 (cited by LSS as Theorem 3 of an earlier version), Proposition 1.1, Definitions 2.2,
  2.6, Lemmas 2.1, 2.2, 3.1, 3.2, 3.3, 4.1, 4.2, Corollary 3.1, Proposition 3.1, Lemmas A.1–A.6,
  A.10–A.12, §§3–4.
- [LSS] J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds on the inverse theorem for the
  Gowers U^{s+1}[N]-norm*, arXiv:2402.17994: Definitions 2.11, 2.15, 3.5, 3.6, 3.8, 3.11–3.13,
  3.15, 3.16; Fact 3.7, Fact 3.9, Lemma 3.10; Theorem 5.2, Remark 5.3, Theorem 5.4,
  Corollary 5.5; Lemmas B.1–B.5; §2.5.
- T. Tao and V. Vu, *Additive combinatorics*, Cambridge Studies in Advanced Mathematics 105,
  Cambridge University Press 2006 (Ruzsa covering and progressions in convex bodies, as cited by
  Leng).
- OpenAI, openai/math at commit `adc7f124` (Apache-2.0): the formalization summarised under
  Provenance.
