# Roadmap: the Malliavin–Stein method and the fourth moment theorem

**Summary.** This roadmap builds the quantitative central limit theory for functionals of a
Gaussian process that comes from combining Stein's method with the Malliavin calculus.

- Stein bounds for the total variation and Kolmogorov distances to a centred Gaussian law,
  stated through classes of continuously differentiable test functions so that they need no
  density for the law being compared, and the total variation between two centred Gaussian laws.
- The Malliavin–Stein bounds: for a functional F of an isonormal Gaussian process that is a
  divergence, or centred and once differentiable, the total variation, Kolmogorov and
  Wasserstein distances from F to a Gaussian law are bounded by the mean distance between the
  variance and a random variance built from the Malliavin derivative. With them come the
  multivariate integration-by-parts formula, the nonnegativity of the conditional random
  variance, its Mehler representation and the multivariate smart-path bound.
- Absolute continuity: the Bouleau–Hirsch criterion, and the existence of a density for every
  nonzero element of a Wiener chaos of positive order.
- The fourth moment theorem on a fixed chaos: the contraction formulas for the norm of the
  derivative and for the fourth cumulant, the two-sided comparison of the two, explicit
  total-variation and Kolmogorov rates in terms of the fourth cumulant, the theorem of Nualart and
  Peccati that convergence in law to a Gaussian is equivalent to convergence of the fourth moment,
  and the fact that no nonzero element of a chaos of order at least two is Gaussian.
- Vectors and expansions: the variance of the inner product of two derivatives on chaoses, the
  Peccati–Tudor theorem that componentwise Gaussian convergence of chaotic vectors gives joint
  convergence, and the central limit theorem through chaos expansions.
- The Breuer–Major theorem for nonlinear functionals of stationary Gaussian sequences, the
  total-variation rate for quadratic variations, the covariance of fractional Gaussian noise, and
  the central limit theorem for its Hermite variations.
- Second-order Poincaré inequalities for smooth functions of finitely many independent standard
  Gaussian variables, in total variation and in Wasserstein distance.

The roadmap is a synthesis of several sources and follows none of them in order. Nourdin–Peccati
(2012, Chapters 3 and 5–7) and Nualart–Nualart (2018, Chapter 8) are the main sources for Layers
2 and 4–6; Nualart (2006, §2.1) supplies the absolute-continuity layer; Chen–Goldstein–Shao (2011,
Chapter 2) supplies the bounds on Stein solutions of Layer 1, alongside Nourdin–Peccati Chapter 3.
Several statements are adaptations: the bounds of Layers 1–2 are stated without the density
hypotheses of the sources, several orders and indices are allowed beyond the sources' ranges, and
Layer 7 is the finite-dimensional case of the infinite-dimensional second-order Poincaré
inequality, with its own covariance representation.

The nearest roadmaps, and what passes between them:

- WienerChaosAndMalliavinCalculus supplies everything Malliavin: isonormal processes, the chaos
  and its projections, multiple integrals and contractions, the derivative and 𝔻¹,², the
  divergence relation, the Ornstein–Uhlenbeck semigroup and the pseudo-inverse of its generator,
  together with the chain rule, the chaos description of 𝔻¹,², Mehler's formula and the
  integration-by-parts formula that this roadmap turns into Stein bounds. Nothing passes back.
- SteinsMethodForNormalApproximation supplies the Stein solution of the standard normal law and
  the bound of the Wasserstein distance through its Stein class, which is the Wasserstein half
  of Layer 2. It excludes the total variation and Kolmogorov distances; their Stein bounds are
  owned here, in Layer 1.
- [MathematicalStatisticsHigherOrderAndResampling](../MathematicalStatisticsHigherOrderAndResampling/README.md)
  owns the Berry–Esseen theorem for sums of independent variables, with its own Kolmogorov distance;
  this roadmap states its Kolmogorov bounds pointwise in the distribution function instead, and
  nothing passes between the two.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) supplies
  Stein's identity for Gaussian vectors, used to compare two Gaussian laws and in the
  multivariate smart path.
- OrnsteinUhlenbeckSemigroup owns the finite-dimensional Ornstein–Uhlenbeck semigroup; nothing
  passes between the two, since Layer 7 writes the Mehler average it needs explicitly.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other targets of this README are of the same standing, stated in prose with
their locators or proof routes.

Suggested home: `TauCeti/Probability/Malliavin/Stein/` for Layers 1–5 and 7, and
`TauCeti/Probability/BreuerMajor/` for Layer 6.

## How to read the build

Layer 1 is pure Stein's method in one dimension: it turns a distance to N(0, v) into a supremum
of |E[v f'(X) − X f(X)]| over a class of C¹ functions with explicit bounds, for total variation
and for the Kolmogorov distance. Layer 2 evaluates that expectation for a functional of an
isonormal process by the integration-by-parts formula of WienerChaosAndMalliavinCalculus, which
replaces X f(X) by f'(X) times a random variance; every bound in total variation of the
following layers goes through Layer 2. Layer 3 is independent of Layers 1–2 and gives densities.
Layer 4 specializes to a single chaos, where the random variance is computed through
contractions of the kernel and its variance is comparable with the fourth cumulant; Layer 4
combined with Layer 2 gives the fourth moment theorem. Layer 5 passes to vectors through the
multivariate smart path of §2.3 and to infinite chaos expansions. Layer 6 applies Layer 5 to
stationary Gaussian sequences. Layer 7 is a finite-dimensional companion of Layer 2 that bounds
the random variance by second derivatives.

Each subsection states its targets, locators in the sources with printed pages, a proof route for
statements that adapt a source, and a *Needs:* line. Each layer ends with **Checks.**, *Examples*
where they add something, and *Dependencies*.

## Conventions

- Total variation is Mathlib's `tvDist`, the total variation norm of the difference, with values
  in `[0, 2]`. It is twice the distance d_TV of Nourdin–Peccati and Nualart–Nualart, so every
  total-variation constant of those sources is doubled here: their 2/σ² becomes 4/v.
- The Kolmogorov distance is not defined here: its bounds are stated at every point,
  |`cdf` μ z − `cdf` (N(0, v)) z| ≤ …, for all z. The Wasserstein distance of order one is
  `TauCeti.wassersteinEDist` at exponent 1, with values in `ℝ≥0∞`; Wasserstein bounds are stated
  against N(0, 1), as in Nualart–Nualart, Theorem 8.2.1.
- Centred Gaussian laws are `gaussianReal` 0 v with a variance `v : ℝ≥0`, and N(0, 0) is the
  Dirac mass at 0. Statements that compare with N(0, v) assume `v ≠ 0` where they need it; the
  others are true at v = 0 as stated, and say so. Laws of vectors are `multivariateGaussian` 0 C
  and laws of standard Gaussian vectors on Euclidean space are `stdGaussian`.
- Convergence in law is `TendstoInDistribution`, with the identity map on the limit law.
- `H` is a real inner product space and W an isonormal process on a probability space (Ω, P), in
  the sense of WienerChaosAndMalliavinCalculus §1.1. Layers 2–3 take `H` complete, as that
  roadmap's statements about the derivative do. The derivative D, the space 𝔻¹,², the divergence
  relation, the semigroup P_t and the pseudo-inverse L⁻¹ are those of its §§4.2, 5.1, 6.1 and
  6.2; `Suggested.lean` carries verbatim copies, and this roadmap owns none of them.
- The random variance of a centred F ∈ 𝔻¹,² is ⟪DF, −DL⁻¹F⟫, and that of a divergence
  F = δ(u) is ⟪DF, u⟫; their expectation is E F².
- Layers 4–5 take H = L²(T, μ) for a σ-finite measure μ, with the kernels of order q, the
  symmetric kernels, the multiple integrals I_q and the contractions f ⊗ᵣ g of
  WienerChaosAndMalliavinCalculus §§3.1 and 3.3. The symmetrized contraction f ⊗̃ᵣ g is owned
  here, as the orthogonal projection of f ⊗ᵣ g onto the symmetric kernels
  (`Submodule.starProjection`).
- Hermite polynomials are Mathlib's `Polynomial.hermite`, the monic probabilists' He_q, and the
  Hermite coefficients are a_q = (1/q!) ∫ f He_q dγ, so that f = ∑_q a_q He_q in L²(γ) for the
  standard Gaussian γ; this is the normalization of Nourdin–Peccati, (7.2.1), p. 129. The expansion
  is Tau Ceti's `TauCeti.hasSum_gaussianHermite_expansion`, in the orthonormal basis He_q/√(q!) of
  `TauCeti.gaussianHermiteHilbertBasis`; its q-th coordinate is ∫ f He_q/√(q!) dγ, so a_q is that
  coordinate divided by √(q!).
- In Layer 6 the letter H is the Hurst index, a real number in (0, 1].
- The implementation namespace is `TauCeti`; the prototypes in `Suggested.lean` live in this
  roadmap's namespace.

## Layer 1: Stein bounds for total variation and Kolmogorov distances

### 1.1 Stein solutions for bounded test functions

The Stein solution f_h(w) = exp(w²/2) ∫_(t ≤ w) (h(t) − E h(N)) exp(−t²/2) dt of the standard
normal law is the one of SteinsMethodForNormalApproximation §1.1.

- **The Stein equation in integrated form** (`steinSolution_sub_eq_integral`): for every h
  integrable against N(0, 1), f_h(y) − f_h(x) = ∫ from x to y of (w f_h(w) + h(w) − E h(N)) dw
  for all real x, y. So f_h is locally absolutely continuous, with the version
  f_h' = w f_h + h − E h(N) of its derivative (Nourdin–Peccati, Proposition 3.2.2, (3.2.3), and
  Remark 3.2.3, p. 62).
- **Indicator-type test functions** (`abs_steinSolution_le_of_mem_Icc`): for a measurable h with
  values in [0, 1], |f_h| ≤ √(π/2) and f_h is 2-Lipschitz (Nourdin–Peccati, Theorem 3.3.1,
  (3.3.1), p. 63; Nualart–Nualart, Proposition 8.1.6, (8.8), p. 134; Chen–Goldstein–Shao, Lemma
  2.4, (2.12), p. 16).
- **Half-lines** (`steinSolution_indicator_Iic`): for h the indicator of (−∞, z], |f_h| ≤ √(2π)/4
  and f_h is 1-Lipschitz (Nourdin–Peccati, Theorem 3.4.2, p. 65; Nualart–Nualart, Proposition
  8.1.7, p. 134; Chen–Goldstein–Shao, Lemma 2.3, (2.8), p. 16).

*Proof route.* Integrated form: with g(t) = (h(t) − E h(N)) exp(−t²/2) and
G(w) = ∫_(t ≤ w) g(t) dt, G(w) = G(x) + ∫ from x to w of g. Substituting this into
∫ from x to y of w exp(w²/2) G(w) dw and exchanging the order of integration
(`MeasureTheory.integral_integral_swap`) gives
G(x)(exp(y²/2) − exp(x²/2)) + ∫ from x to y of g(t)(exp(y²/2) − exp(t²/2)) dt, by
`intervalIntegral.integral_deriv_eq_sub` applied to exp(w²/2). Adding ∫ from x to y of
exp(t²/2) g(t) dt leaves exp(y²/2) G(y) − exp(x²/2) G(x). For continuous h this is the Stein
equation of SteinsMethodForNormalApproximation §1.1. The sources bound the version
w f_h + h − E h(N) of f_h'; by the integrated form, a bound c on it makes f_h c-Lipschitz. The
bounds themselves are the Gaussian tail estimate
exp(w²/2) ∫_(|w|)^∞ exp(−y²/2) dy ≤ √(π/2) and its weighted form
|w| exp(w²/2) ∫_(|w|)^∞ exp(−y²/2) dy ≤ 1 (Nourdin–Peccati, proof of Theorem 3.3.1, p. 64). For the
half-line, the closed form f_z(w) = √(2π) exp(w²/2) Φ(min(w, z))(1 − Φ(max(w, z)))
(Nourdin–Peccati, (3.4.1), p. 65).

*Needs:* SteinsMethodForNormalApproximation §1.1.

### 1.2 The Stein classes and the bounds without densities

- **Stein classes** (`tvSteinClass`, `kolSteinClass`): for a variance v > 0, the C¹ functions with
  |f| ≤ √(π/2)/√v and |f'| ≤ 2/v, and those with |f| ≤ √(2π)/(4√v) and |f'| ≤ 1/v.
- **Total variation** (`tvDist_le_iSup_tvSteinClass`): for a probability measure μ on ℝ with
  finite first moment, `tvDist` (μ, N(0, v)) ≤ 2 sup over the total-variation class of
  |∫ (v f'(x) − x f(x)) dμ(x)|.
- **Kolmogorov** (`abs_cdf_sub_le_iSup_kolSteinClass`): under the same hypotheses, at every z,
  |`cdf` μ z − `cdf` N(0, v) z| ≤ sup over the Kolmogorov class of the same quantity.

For v = 1 these are Nualart–Nualart, (8.12)–(8.13), pp. 135–136, with the C¹ classes justified by
the remark on p. 136. Nourdin–Peccati, Theorem 3.3.1, (3.3.2), p. 63, and Theorem 3.4.2, p. 65,
with (3.4.3), p. 66, use classes of functions that are only absolutely continuous, so that
E f'(F) needs a density for F (Nourdin–Peccati, Remark 3.3.2, p. 64); the C¹ classes remove that
hypothesis.

*Proof route.* By Tau Ceti's `MeasureTheory.etvDist_eq_two_mul_iSup_sub`, `tvDist` is twice the
supremum of |μ(A) − N(0, v)(A)| over Borel sets. Approximate the indicator of A in L¹(μ + N(0, v))
by continuous h with values in [0, 1]. For continuous h, the function f(x) = f_(h̃)(x/√v)/√v
with h̃(y) = h(√v y) solves v f' − x f = h − E h(N(0, v)) and is C¹ by the Stein equation of
SteinsMethodForNormalApproximation §1.1; §1.1 bounds it, the change of variables being Mathlib's
`gaussianReal_map_const_mul`. For the Kolmogorov bound, average the half-line solutions of §1.1
over z' ∈ [z, z + ε]: the average solves the Stein equation for a continuous piecewise-linear h
between the indicators of (−∞, z] and (−∞, z + ε], is C¹ with the bounds of the Kolmogorov class,
and the error E h − P(X ≤ z) is at most the mass of (z, z + ε], which tends to 0 for N(0, v) and
is handled for μ by the same comparison at z − ε; then let ε → 0. A piecewise-linear smoothing
with the same effect is Chen–Goldstein–Shao, Lemma 2.5, p. 17.

*Needs:* §1.1.

### 1.3 Two centred Gaussian laws

- **Gaussian comparison** (`tvDist_gaussianReal_le`): `tvDist` (N(0, v₁), N(0, v₂)) ≤
  4 |v₁ − v₂| / max(v₁, v₂), for all variances, including 0 (Nourdin–Peccati, Proposition 3.6.1,
  p. 69, for positive variances).

*Proof route.* By symmetry take v₂ ≥ v₁ and v₂ > 0. Apply §1.2 to μ = N(0, v₁) and v = v₂:
Stein's identity for N(0, v₁) (MathematicalStatisticsFoundations §4.4, in dimension one) turns
∫ (v₂ f' − x f) dN(0, v₁) into (v₂ − v₁) ∫ f' dN(0, v₁), of size at most 2|v₂ − v₁|/v₂. If v₁ = 0
the left side is 2 and the right side 4.

*Needs:* §1.2; MathematicalStatisticsFoundations §4.4.

**Checks.**

- Integrated form of §1.1 for a discontinuous h: for h the indicator of [0, 1] and
  (x, y) = (−1, 2), both sides equal 0.367645; for h the indicator of (−∞, 0.7] and
  (x, y) = (0.3, 0.9), both equal 0.132338.
- Negative control for the sign of h in the integrated form: with h − E h(N) replaced by
  E h(N) − h, the right side for the indicator of [0, 1] and (x, y) = (−1, 2) is 0.415713, not
  0.367645.
- The half-line bound is attained: f_0(0) = √(2π) Φ(0)(1 − Φ(0)) = √(2π)/4 ≈ 0.626657.
- The half-line solution is not differentiable at z: at z = 0.7 its one-sided derivatives at z
  are 0.65314 and −0.34686, which differ by 1, the jump of the indicator. This is why the
  Kolmogorov class is reached by averaging over z, and why Lipschitz, not C¹, is the conclusion of
  §1.1.
- Negative control for measurability in §1.1: let h be 1 except on a non-measurable subset of
  [5, 6), where it is 0. Then ∫ h dγ is the junk value 0 while the integral over (−∞, 4] is
  genuine, and f_h(4) = e⁸ √(2π) Φ(4) ≈ 7.47 × 10³ > √(π/2).
- Gaussian comparison at (v₁, v₂) = (1, 2): `tvDist` = 0.33213 ≤ 2; at (1, 1.1): 0.04612 ≤ 0.36364;
  at (1, 100): 1.59643 ≤ 3.96, with `tvDist` → 2 and the bound → 4 as v₂ → ∞.

### Examples

- The clipped Gaussian F = max(−1, min(1, Z)) has atoms of total mass 2(1 − Φ(1)) ≈ 0.31731, so no
  density, and §1.2 still applies: with the random variance of §2.2, E F² = 0.516059,
  `tvDist` (F, N(0, E F²)) = 0.645082 ≤ 2.538484, the bound of §2.2.

### Dependencies

SteinsMethodForNormalApproximation §1.1; MathematicalStatisticsFoundations §4.4; Tau Ceti's
total-variation supremum formula; Mathlib's `tvDist`, `cdf` and `gaussianReal`.

## Layer 2: the Malliavin–Stein bounds

Throughout, `H` is complete and W is isonormal.

### 2.1 Integration by parts and the random variance

- **Multivariate integration by parts** (`IsIsonormal.integral_mul_comp_euclidean`): for
  F₁, …, Fₘ ∈ 𝔻¹,², G a functional of W and φ of class C¹ on ℝᵐ with bounded derivative,
  E[G φ(F)] = E G · E φ(F) + ∑ᵢ E[∂ᵢφ(F) ⟪DFᵢ, −DL⁻¹G⟫] (Nourdin–Peccati, Theorem 2.9.1, p. 53,
  for m = 1; it is applied to second partial derivatives of a function of a vector in the proof
  of Theorem 6.1.1, p. 117).
- **Conditional positivity** (`IsIsonormal.condExp_inner_nonneg`): for F ∈ 𝔻¹,²,
  E[⟪DF, −DL⁻¹F⟫ | F] ≥ 0 almost surely (Nourdin–Peccati, Proposition 2.9.4, p. 54, for centred
  F).
- **Mehler representation** (`IsIsonormal.inner_malliavinDeriv_ouPseudoInverse`): for
  F ∈ 𝔻¹,² and h ∈ H, ⟪−DL⁻¹F, h⟫ = ∫₀^∞ e⁻ᵗ P_t ⟪DF, h⟫ dt in L² (Nourdin–Peccati,
  Proposition 2.9.3, (2.9.2), p. 53, for centred F).

*Proof route.* Integration by parts: WienerChaosAndMalliavinCalculus §6.3 with g the identity
gives E[(G − E G) Φ] = E⟪DΦ, −DL⁻¹G⟫ for every Φ ∈ 𝔻¹,²; take Φ = φ(F) and expand DΦ by the
chain rule of its §4.3. The centring hypotheses of the sources are not needed, since D and L⁻¹
do not see constants. Positivity: for g ≥ 0 smooth with primitive G vanishing at 0, x G(x) ≥ 0,
so E[F G(F)] ≥ 0, and integration by parts writes it as E[g(F) E[⟪DF, −DL⁻¹F⟫ | F]]
(Nourdin–Peccati, proof of Proposition 2.9.4, p. 54). Mehler: on the chaos of order n,
−DL⁻¹F = DF/n and P_t acts on ⟪DF, h⟫, which lies in the chaos of order n − 1 by
WienerChaosAndMalliavinCalculus §4.4, as exp(−(n−1)t); ∫₀^∞ e⁻ⁿᵗ dt = 1/n, and the chaos
description of §4.4 there sums the chaoses.

*Needs:* WienerChaosAndMalliavinCalculus §§4.3, 4.4, 6.1–6.3.

### 2.2 Bounds for divergences and for centred functionals

- **Divergences** (`IsIsonormal.tvDist_map_le_of_isDivergence`): if F ∈ 𝔻¹,² is a divergence
  F = δ(u), then for every v > 0, `tvDist` (F, N(0, v)) ≤ (4/v) E|v − ⟪DF, u⟫|, at every z the
  Kolmogorov difference is at most (1/v) E|v − ⟪DF, u⟫|, and W₁(F, N(0, 1)) ≤
  √(2/π) E|1 − ⟪DF, u⟫| (Nualart–Nualart, Theorem 8.2.1, p. 136, for v = 1, and (8.16), p. 138,
  for general v).
- **Centred functionals** (`IsIsonormal.tvDist_map_le_of_mem_sobolev12`): the same three bounds
  for a centred F ∈ 𝔻¹,² with ⟪DF, −DL⁻¹F⟫ in place of ⟪DF, u⟫ (Nourdin–Peccati, Theorem
  5.1.3, p. 91, which assumes a density for the total-variation and Kolmogorov bounds and
  v = E F²; Nualart–Nualart, the case u = −DL⁻¹F after Example 8.2.2, p. 137).

*Proof route.* For f in a Stein class of §1.2, f(F) ∈ 𝔻¹,² with D f(F) = f'(F) DF
(WienerChaosAndMalliavinCalculus §4.3), so the divergence relation of its §5.1 gives
E[F f(F)] = E[f'(F) ⟪DF, u⟫] and E[v f'(F) − F f(F)] = E[f'(F)(v − ⟪DF, u⟫)], of size at most
sup|f'| · E|v − ⟪DF, u⟫|; conclude by §1.2. For W₁, the class of SteinsMethodForNormalApproximation
§3.1 consists of C¹ functions with |f'| ≤ √(2/π), and its bound of W₁ by that class applies.
For centred F, WienerChaosAndMalliavinCalculus §6.3 with G = F gives the same identity with
u replaced by −DL⁻¹F. The values of v are arbitrary: no relation between v and E F² is needed.

*Needs:* §§1.2, 2.1; WienerChaosAndMalliavinCalculus §§4.3, 5.1, 6.3;
SteinsMethodForNormalApproximation §3.1.

### 2.3 The multivariate smart path

- **Smart-path bound** (`IsIsonormal.abs_integral_sub_multivariateGaussian_le`): for centred
  F₁, …, F_d ∈ 𝔻¹,², a positive semidefinite d × d matrix C, N ~ N(0, C), and h of class C²
  with every second partial derivative bounded by K,
  |E h(F) − E h(N)| ≤ (K/2) ∑ᵢⱼ E|C(i, j) − ⟪DFⱼ, −DL⁻¹Fᵢ⟫| (Nourdin–Peccati, Theorem 6.1.2,
  pp. 117–118).

*Proof route.* Interpolate Ψ(t) = E h(√(1 − t) F + √t N) with N independent of W; differentiate
under the integral, apply Stein's identity E[Nᵢ ψ(N)] = ∑ⱼ C(i, j) E[∂ⱼψ(N)] to the N-part and
§2.1 to the F-part with φ = ∂ᵢh(√(1 − t) · + √t y), whose derivative is bounded by the
hypothesis; the difference is
½ ∫₀¹ ∑ᵢⱼ E[∂ᵢ∂ⱼh(…)(C(i, j) − ⟪DFⱼ, −DL⁻¹Fᵢ⟫)] dt (Nourdin–Peccati, proof of Theorem
6.1.2, p. 118). The source takes d ≥ 2; d = 1 is the same proof. Stein's identity for N(0, C)
with C only positive semidefinite follows from the isotropic case N(0, I) of
MathematicalStatisticsFoundations §4.4: write N = C^(1/2) Z with Z standard
(`TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`) and apply that case to
z ↦ ψ(C^(1/2) z), whose partial derivatives are ∑ⱼ C^(1/2)(j, i) ∂ⱼψ(C^(1/2) z).

*Needs:* §2.1; MathematicalStatisticsFoundations §4.4; Mathlib's `multivariateGaussian`;
`TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`.

**Checks.**

- For F = Z + a He₂(Z) with Z = W(e), ‖e‖ = 1: DF = (1 + 2aZ) e, −DL⁻¹F = (1 + aZ) e, and the
  random variance (1 + 2aZ)(1 + aZ) has mean 1 + 2a² = E F². At a = 0.2, `tvDist` (F, N(0, 1.08)) =
  0.3617 ≤ 1.7886, the Kolmogorov difference is at most 0.0815 ≤ 0.4472, and W₁(F, N(0, 1)) =
  0.1936 ≤ 0.3820 (computed by quadrature against the closed-form density of F).
- Smart path with d = 1, C = 1 and h = cos (K = 1) on the same F: at a = 0.2,
  |E cos F − e⁻¹ᐟ²| = 0.00928 ≤ 0.23937.
- Convention check for the factor 4: the clipped Gaussian max(−0.3, min(0.3, Z)) has atoms of
  total mass 0.764177 at ±0.3, so `tvDist` to any Gaussian law is at least 2 · 0.764177; its value
  against N(0, E F²) is 1.528354, below the bound 6.113418 of §2.2 (v = E F² = 0.075766).

### Dependencies

Layer 1; WienerChaosAndMalliavinCalculus §§4.3, 4.4, 5.1, 6.1–6.3;
SteinsMethodForNormalApproximation §3.1; MathematicalStatisticsFoundations §4.4.

## Layer 3: absolute continuity

### 3.1 The Bouleau–Hirsch criterion

- **Bouleau–Hirsch** (`IsIsonormal.absolutelyContinuous_map_restrict`): for F ∈ 𝔻¹,², the
  law of F restricted to the event {DF ≠ 0} is absolutely continuous with respect to Lebesgue
  measure: P(F ∈ B, DF ≠ 0) = 0 for every Lebesgue-null Borel B (Nualart, Corollary 2.1.2, p. 99,
  for 𝔻¹,¹_loc).
- Target in prose: if DF ≠ 0 almost surely then the law of F is absolutely continuous (Nualart,
  Theorem 2.1.3, p. 98), the case of a full event.

*Proof route.* Nualart's proof of Theorem 2.1.3, pp. 98–99, works in 𝔻¹,²: reduce to |F| < 1
by composing with a C¹ diffeomorphism onto (−1, 1) with bounded derivative; for a Borel g with
values in [0, 1] and Lebesgue integral 0, approximate g by continuous gₙ almost everywhere for
the law of F plus Lebesgue measure, apply the chain rule of WienerChaosAndMalliavinCalculus §4.3
to the primitives ψₙ of gₙ, and pass to the limit in the closed graph of §4.2 there: ψ(F) = 0,
so g(F) DF = 0 almost surely.

*Needs:* WienerChaosAndMalliavinCalculus §§4.2, 4.3.

### 3.2 Densities on a chaos

- **Chaos elements** (`IsIsonormal.absolutelyContinuous_map_of_mem_wienerChaos`): a nonzero
  element of the chaos of order q ≥ 1 has an absolutely continuous law (Nourdin–Peccati, Theorem
  2.10.1, p. 54).

*Proof route.* Induction on q, as in Nourdin–Peccati, proof of Theorem 2.10.1, pp. 54–55, with
the last step taken from §3.1. For q = 1, F is a nonzero centred Gaussian. For q ≥ 2,
E‖DF‖² = q E F² > 0 (WienerChaosAndMalliavinCalculus §4.4), so ⟪DF, h⟫ ≠ 0 in L² for some
h ∈ H; ⟪DF, h⟫ is in the chaos of order q − 1 (the same section, chaos by chaos), so by
induction it vanishes only on a null event, hence DF ≠ 0 almost surely, and §3.1 applies.

*Needs:* §3.1; WienerChaosAndMalliavinCalculus §4.4.

**Checks.**

- He₂(W h) for ‖h‖ = 1 has the density of χ²₁ − 1, and D He₂(W h) = 2 W(h) h vanishes only on the
  null event W(h) = 0.
- Negative control for q ≥ 1 in §3.2: the chaos of order 0 consists of constants, whose laws are
  Dirac masses.
- Negative control for restricting to {DF ≠ 0}: F = max(W(h), 0) is in 𝔻¹,² with
  DF = 1{W(h) > 0} h and an atom of mass 1/2 at 0, carried by {DF = 0}.

### Dependencies

WienerChaosAndMalliavinCalculus §§4.2–4.4.

## Layer 4: the fourth moment theorem on a fixed chaos

Throughout, H = L²(T, μ), I is a family of multiple integrals of W, and F = I_q(f) for a symmetric
kernel f of order q.

### 4.1 Contractions

- **Symmetrized contraction** (`symContraction`): f ⊗̃ᵣ g, the orthogonal projection of f ⊗ᵣ g
  onto the symmetric kernels of order p + q − 2r (Nourdin–Peccati, p. 41, with (B.4.6),
  p. 208).
- **Contraction inequality** (`norm_contraction_sq_le`): for symmetric f, g of orders p, q and
  r ≤ min(p, q), ‖f ⊗ᵣ g‖² ≤ ‖f ⊗_(p−r) f‖ ‖g ⊗_(q−r) g‖ (Nourdin–Peccati, p. 121, the display
  after (6.2.3), and (6.2.5)).
- Target in prose: ‖f ⊗ᵣ g‖² = ⟪f ⊗_(p−r) f, g ⊗_(q−r) g⟫ for symmetric f and g (Nourdin–Peccati,
  (6.2.4), p. 121), and ‖f ⊗̃ᵣ g‖ ≤ ‖f ⊗ᵣ g‖.

*Proof route.* Expand both squared norms as integrals over T^(2r) × T^(p−r) × T^(q−r) and use
Fubini and the symmetry of f and g to move the contracted variables; Cauchy–Schwarz. The
projection does not increase norms.

*Needs:* WienerChaosAndMalliavinCalculus §§3.1, 3.3; Mathlib's `Measure.pi`.

### 4.2 The norm of the derivative and the fourth cumulant

- **Norm of the derivative** (`IsMultipleWienerIntegral.norm_malliavinDeriv_sq`): for q ≥ 1,
  ‖DF‖²/q = E F² + q ∑ᵣ₌₁^(q−1) (r − 1)! C(q − 1, r − 1)² I_(2q−2r)(f ⊗ᵣ f) (Nourdin–Peccati,
  Lemma 5.2.4, (5.2.2), p. 95).
- **Its variance** (`IsMultipleWienerIntegral.variance_norm_malliavinDeriv_sq`):
  Var(‖DF‖²/q) = ∑ᵣ₌₁^(q−1) (r²/q²) r!² C(q, r)⁴ (2q − 2r)! ‖f ⊗̃ᵣ f‖² (Nourdin–Peccati,
  (5.2.3), p. 96; Nualart–Nualart, Proposition 8.3.2, Step 1, p. 138).
- **Fourth cumulant** (`IsMultipleWienerIntegral.fourth_cumulant_eq`): for q ≥ 1,
  κ₄(F) = E F⁴ − 3(E F²)² = (3/q) ∑ᵣ₌₁^(q−1) r r!² C(q, r)⁴ (2q − 2r)! ‖f ⊗̃ᵣ f‖², and also
  = ∑ᵣ₌₁^(q−1) q!² C(q, r)² (‖f ⊗ᵣ f‖² + C(2q − 2r, q − r) ‖f ⊗̃ᵣ f‖²) (Nourdin–Peccati,
  (5.2.5)–(5.2.6), p. 96).
- **Comparison** (`IsMultipleWienerIntegral.variance_le_fourth_cumulant`):
  Var(‖DF‖²/q) ≤ ((q − 1)/(3q)) κ₄(F) ≤ (q − 1) Var(‖DF‖²/q) (Nourdin–Peccati, (5.2.7), p. 96;
  Nualart–Nualart, Proposition 8.3.2, p. 138). The sources take q ≥ 2; at q = 1 both sides are 0,
  and at q = 0 Lean's division by 0 makes all three terms 0.

*Proof route.* WienerChaosAndMalliavinCalculus §4.4 in its white-noise form,
D I_q(f) = q I_(q−1)(f(·, t)), and its product formula of §3.3 give (5.2.2); the isometry of its
§3.1 gives (5.2.3). For (5.2.5): F³ ∈ 𝔻¹,² with D(F³) = 3F² DF by the product rule (a prose
target of WienerChaosAndMalliavinCalculus §4.3) applied to F · F and F² · F, whose
integrability hypotheses hold on a chaos because F and ‖DF‖², a finite sum of chaoses by
(5.2.2), have moments of every order (its §6.4, equivalence of moments). Its §6.3 with g the
identity gives E[F Φ] = E⟪DΦ, −DL⁻¹F⟫ for every Φ ∈ 𝔻¹,², and −DL⁻¹F = DF/q on the chaos, so
E F⁴ = E[F · F³] = (3/q) E[F² ‖DF‖²]; then (5.2.2) and the isometry. (5.2.6) follows by the
product formula for F² directly (Nourdin–Peccati, proof of Lemma 5.2.4, pp. 95–96). (5.2.7)
compares the two series term by term, using r ≤ q − 1.

*Needs:* WienerChaosAndMalliavinCalculus §§3.1, 3.3, 4.3, 4.4, 6.3, 6.4.

### 4.3 Bounds and non-Gaussianity

- **Fourth-moment bounds** (`IsMultipleWienerIntegral.tvDist_map_le`): for q ≥ 1 and v = E F²,
  `tvDist` (F, N(0, v)) ≤ (4/v) √(((q − 1)/(3q)) κ₄(F)), and at every z the Kolmogorov difference
  is at most (1/v) √(((q − 1)/(3q)) κ₄(F)); for f = 0 both sides are 0 (Nourdin–Peccati,
  Theorem 5.2.6, (5.2.13)–(5.2.14), p. 99, for q ≥ 2).
- Target in prose: for E F² = 1, W₁(F, N(0, 1)) ≤ √(((2q − 2)/(3πq)) κ₄(F)) (Nourdin–Peccati,
  (5.2.15), p. 99).
- **No Gaussian on a higher chaos** (`IsMultipleWienerIntegral.three_mul_sq_lt_integral_pow_four`):
  for q ≥ 2 and f ≠ 0, E F⁴ > 3 (E F²)² (Nourdin–Peccati, Corollary 5.2.11, p. 101).

*Proof route.* On a chaos, −DL⁻¹F = DF/q, so §2.2 bounds the distances by E|v − ‖DF‖²/q|, at
most √Var(‖DF‖²/q) by Cauchy–Schwarz since E‖DF‖²/q = v; conclude by §4.2. No density is used.
Non-Gaussianity: κ₄ = 0 forces f ⊗̃_(q−1) f = 0 by (5.2.5); f ⊗_(q−1) f is already symmetric,
and ‖f ⊗_(q−1) f‖² bounds the squares of the coordinates of f along an orthonormal basis
(Nourdin–Peccati, proof of Corollary 5.2.11, p. 101), so f = 0.

*Needs:* §§2.2, 4.1, 4.2.

### 4.4 The fourth moment theorem

- **Fourth moment theorem** (`IsMultipleWienerIntegral.fourth_moment_tfae`): for q ≥ 1 and
  Fₙ = I_q(fₙ) with E Fₙ² → σ² > 0, the following are equivalent: Fₙ converges in law to
  N(0, σ²); E Fₙ⁴ → 3σ⁴; Var ‖DFₙ‖² → 0; ‖fₙ ⊗̃ᵣ fₙ‖ → 0 for r = 1, …, q − 1; ‖fₙ ⊗ᵣ fₙ‖ → 0
  for r = 1, …, q − 1; `tvDist` (Fₙ, N(0, σ²)) → 0 (Nourdin–Peccati, Theorem 5.2.7, pp. 99–100,
  and Corollary 5.2.8, p. 100; Nualart–Nualart, Theorem 8.3.4, p. 140; Nualart–Peccati 2005).
- Target in prose: the same with orders q(n) ≥ 1 varying with n, for the implication from the
  second and fourth moments to convergence in total variation (Nourdin–Peccati, Corollary 5.2.10,
  pp. 100–101).

*Proof route.* Convergence in law implies convergence of fourth moments because all moments
are bounded on a chaos (WienerChaosAndMalliavinCalculus §6.4, equivalence of moments, and
uniform integrability); the rest is Nourdin–Peccati's cycle, p. 100: (5.2.7), (5.2.3), (5.2.5)
with (5.2.6), and §4.3 with §1.3 to pass from N(0, E Fₙ²) to N(0, σ²). Total variation implies
convergence in law. The source takes q ≥ 2; for q = 1 every condition holds.

*Needs:* §§1.3, 4.1–4.3; WienerChaosAndMalliavinCalculus §6.4.

**Checks.**

- F = He₂(W h), ‖h‖ = 1 (q = 2, f = h ⊗ h): ‖DF‖²/2 = 2 W(h)², Var = 8, κ₄ = E He₂⁴ − 3 · 4 =
  60 − 12 = 48, and (5.2.7) reads 8 ≤ 8 ≤ 8: on the second chaos it is an equality.
- F = He₃(W h), ‖h‖ = 1: E F² = 6, E F⁴ = 3348, κ₄ = 3240 > 0; Var(‖DF‖²/3) = 9 Var(He₂²) = 504,
  and (5.2.7) reads 504 ≤ 720 ≤ 1008.
- F = W(e₁) W(e₂) for orthonormal e₁, e₂ (q = 2, f = (e₁ ⊗ e₂ + e₂ ⊗ e₁)/2): E F² = 1,
  E F⁴ = 9, κ₄ = 6; ‖f ⊗₁ f‖² = ‖f ⊗̃₁ f‖² = 1/8, so (5.2.3) gives Var(‖DF‖²/2) =
  (1/4) · 16 · 2 · 1/8 = 1, which is Var((W(e₁)² + W(e₂)²)/2), and (5.2.5) gives
  (3/2) · 16 · 2 · 1/8 = 6.
- Fourth-moment bound on the centred χ²_m, F = ∑_(i ≤ m) (Zᵢ² − 1) (q = 2, v = 2m, κ₄ = 48m): the
  bound is 4√2/√m; at m = 10, `tvDist` = 0.2371 ≤ 1.7889 and the Kolmogorov difference is at most
  0.0596 ≤ 0.4472; at m = 200, 0.0505 ≤ 0.4 and 0.0133 ≤ 0.1.
- Negative control for q ≥ 2 in §4.3: on the first chaos F is Gaussian and κ₄ = 0.
- Negative control for σ² > 0 in §4.4: for q = 1 and fₙ = h/n with ‖h‖ = 1, E Fₙ² → 0, Fₙ
  converges in law to N(0, 0) = δ₀, E Fₙ⁴ = 3/n⁴ → 0 and DFₙ = h/n is deterministic, but
  `tvDist` (Fₙ, δ₀) = 2 for every n, since Fₙ has a density: at σ² = 0 the last condition fails
  while the others hold.
- Negative control for q ≥ 1 in §4.4: on the chaos of order 0, Fₙ = σ is constant, Var ‖DFₙ‖² = 0
  for every n, but E Fₙ⁴ = σ⁴ ≠ 3σ⁴.

### Dependencies

Layers 1–2; WienerChaosAndMalliavinCalculus §§3.1, 3.3, 4.3, 4.4, 6.3, 6.4.

## Layer 5: vectors and chaos expansions

### 5.1 Covariances of derivatives

- **Variance of ⟪DF, DG⟫** (`IsMultipleWienerIntegral.variance_inner_malliavinDeriv`): for
  F = I_p(f), G = I_q(g) with p ≤ q, Var⟪DF, DG⟫ = p² q² ∑_r (r − 1)!² C(p − 1, r − 1)²
  C(q − 1, r − 1)² (p + q − 2r)! ‖f ⊗̃ᵣ g‖², summed over 1 ≤ r ≤ min(p, q − 1).

This adapts Nourdin–Peccati, (6.2.3), p. 121, which states E[(α − ⟪DF, DG⟫/q)²] for a constant α;
the variance form is the case α = E⟪DF, DG⟫/q.

*Proof route.* D I_p(f) = p I_(p−1)(f(·, t)) (WienerChaosAndMalliavinCalculus §4.4), the
product formula of its §3.3 for I_(p−1) I_(q−1), integration in t, and the isometry of its §3.1.

*Needs:* WienerChaosAndMalliavinCalculus §§3.1, 3.3, 4.4.

### 5.2 The Peccati–Tudor theorem

- **Peccati–Tudor** (`IsMultipleWienerIntegral.peccati_tudor`): for vectors
  Fₙ = (I_(q₁)(f_(1,n)), …, I_(q_d)(f_(d,n))) with all qᵢ ≥ 1 and E[F_(i,n) F_(j,n)] → C(i, j), Fₙ
  converges in law to N(0, C) exactly when each component F_(i,n) converges in law to
  N(0, C(i, i)) (Nourdin–Peccati, Theorem 6.2.3, pp. 123–124; Nualart–Nualart, Theorem 8.3.5,
  p. 141, for distinct orders; Peccati–Tudor 2005).

*Proof route.* One direction is the continuous mapping theorem. For the other, apply §2.3 to
h(x) = cos⟪t, x⟫ and sin⟪t, x⟫: on chaoses −DL⁻¹F_i = DF_i/qᵢ, and E|C(i, j) −
⟪DF_j, DF_i⟫/qᵢ| is at most |C(i, j) − E[F_i F_j]| plus √Var⟪DF_i, DF_j⟫/qᵢ. Write p = qᵢ ≤ q = qⱼ
(swap i and j otherwise). §5.1, the bound ‖f ⊗̃ᵣ g‖ ≤ ‖f ⊗ᵣ g‖ and the contraction inequality of
§4.1 bound that variance by a sum of products ‖f_(i,n) ⊗_(p−r) f_(i,n)‖ ‖f_(j,n) ⊗_(q−r) f_(j,n)‖
over 1 ≤ r ≤ min(p, q − 1). In each, the first factor is at most ‖f_(i,n)‖², which is bounded,
and the second has order q − r between 1 and q − 1 (q − r ≥ q − p ≥ 1 when p < q). These second
factors tend to 0: by §4.4 for the components with C(j, j) > 0, and for those with C(j, j) = 0
because ‖f ⊗ₛ f‖ ≤ ‖f‖² and qⱼ! ‖f_(j,n)‖² = E F_(j,n)² → 0. §4.4 cannot
be used there, since at σ² = 0 its total-variation condition fails (Checks of Layer 4).
Characteristic functions converge, and Mathlib's
`TendstoInDistribution.of_tendsto_charFun` concludes.

*Needs:* §§2.3, 4.1, 4.4, 5.1; Mathlib's Lévy continuity theorem.

### 5.3 Central limit theorems through chaos expansions

- **Chaotic CLT** (`IsMultipleWienerIntegral.tendstoInDistribution_of_chaos`): let Fₙ = ∑_q
  I_q(f_(n,q)) be centred, with q! ‖f_(n,q)‖² → σ_q² for each q, ∑_q σ_q² < ∞, contractions
  ‖f_(n,q) ⊗ᵣ f_(n,q)‖ → 0 for 1 ≤ r < q, and tails ∑_(q>N) q! ‖f_(n,q)‖² small uniformly in n
  for large N. Then Fₙ converges in law to N(0, ∑_q σ_q²) (Nourdin–Peccati, Theorem 6.3.1,
  p. 125; Nualart–Nualart, Theorem 8.4.1, p. 143; Hu–Nualart 2005).

*Proof route.* Nourdin–Peccati, proof of Theorem 6.3.1, p. 125: truncate at N, apply §5.2 to the
vector of the first N chaotic components (orthogonal, so its covariance tends to diag(σ_q²);
components with σ_q = 0 are allowed in §5.2),
and control the tail in characteristic functions by the uniform tail hypothesis; Mathlib's
`TendstoInDistribution.of_tendsto_charFun` concludes. The uniform tail hypothesis is stated with
an explicit ε and N; a supremum over n in ℝ would be the junk 0 when the tails are unbounded.

*Needs:* §5.2; Mathlib's Lévy continuity theorem.

**Checks.**

- F = W(e₁) W(e₂) and G = He₃(W(e₁)) for orthonormal e₁, e₂ (p = 2, q = 3): ⟪DF, DG⟫ =
  3 W(e₂) He₂(W(e₁)) has variance 9 · 1 · 2 = 18, and the formula gives
  36 (3! ‖f ⊗̃₁ g‖² + 4 ‖f ⊗̃₂ g‖²) = 18. For p = q = 1, ⟪DF, DG⟫ = ⟪f, g⟫ is constant and the sum
  over r is empty.
- Negative control for the covariance hypothesis in §5.2: for F_(1,n) = W(h) and
  F_(2,n) = (−1)ⁿ W(h) with ‖h‖ = 1, each component has law N(0, 1), but the covariance alternates
  between 1 and −1 and the pair does not converge in law.

### Dependencies

Layers 2 and 4; WienerChaosAndMalliavinCalculus §§3.1, 3.3, 4.4.

## Layer 6: the Breuer–Major theorem

Throughout, (X_k)_(k ≥ 0) is a centred Gaussian sequence with E[X_k X_l] = ρ(k − l) and ρ(0) = 1.

### 6.1 Hermite rank and the Breuer–Major theorem

- **Hermite coefficients and rank** (`hermiteCoeff`, `hermiteRank`): a_q = (1/q!) ∫ f He_q dγ, and
  the rank, the least q ≥ 1 with a_q ≠ 0 (Nourdin–Peccati, (7.2.1) and Definition 7.2.1, p. 129;
  Nualart–Nualart, p. 143). The rank is 0 when every a_q with q ≥ 1 vanishes.
- **Sanity checks** (`hermiteRank_hermite`, `hermiteRank_abs_sub`): He_q has rank q for q ≥ 1, and
  |x| − √(2/π) has rank 2 (Nourdin–Peccati, Example 7.2.2, p. 129, with p = 1).
- **Breuer–Major** (`tendstoInDistribution_breuerMajor`): for a centred f ∈ L²(γ) of Hermite rank
  d with ∑_(v∈ℤ) |ρ(v)|^d < ∞, n⁻¹ᐟ² ∑_(k<n) f(X_k) converges in law to N(0, σ²) with
  σ² = ∑_q q! a_q² ∑_(v∈ℤ) ρ(v)^q (Nourdin–Peccati, Theorem 7.2.4, p. 131; Nualart–Nualart,
  Theorem 8.4.2, p. 144; Breuer–Major 1983).

*Proof route.* The conclusion depends only on the law of (X_k). Take H = L²(Ω, P) and
εₖ = X_k ∈ H, so ⟪εₖ, εₗ⟫ = ρ(k − l) and ‖εₖ‖ = 1; WienerChaosAndMalliavinCalculus §1.1 gives an
isonormal process W' on H, and (W'(εₖ)) has the law of (X_k), both being centred Gaussian with
the same covariance (Mathlib's `IsGaussian.charFunDual_eq` and `Measure.ext_of_charFunDual`). By
the definition of multiple integrals (WienerChaosAndMalliavinCalculus §3.1), He_q(W'(εₖ)) =
I_q(εₖ^(⊗q)), so the sum has kernels f_(n,q) = a_q n⁻¹ᐟ² ∑_(k<n) εₖ^(⊗q). Then §5.3:
q! ‖f_(n,q)‖² = q! a_q² ∑_(|v|<n) (1 − |v|/n) ρ(v)^q → σ_q² by dominated convergence, the
contractions of tensor powers are εₖ^(⊗q) ⊗ᵣ εₗ^(⊗q) = ρ(k − l)^r εₖ^(⊗(q−r)) ⊗ εₗ^(⊗(q−r))
(Fubini, Mathlib's `integral_fintype_prod_eq_prod`) and tend to 0 as in Nourdin–Peccati, proof
of Theorem 7.2.4, condition (c), pp. 132–133, and the tails are at most
∑_v |ρ(v)|^d ∑_(q>N) q! a_q², since |ρ| ≤ 1 (there, condition (d), p. 133).

*Needs:* §5.3; WienerChaosAndMalliavinCalculus §§1.1, 3.1; Mathlib's characteristic functions
of Gaussian measures; Tau Ceti's `TauCeti.hasSum_gaussianHermite_expansion` (the expansion
f = ∑_q a_q He_q in L²(γ)).

### 6.2 Quadratic variations in total variation

- **Quadratic rate** (`tvDist_map_quadratic_le`): for n ≥ 1 and S = ∑_(k<n) (X_k² − 1),
  `tvDist` (S/√(E S²), N(0, 1)) ≤ (8√2 √n / E S²) (∑_(|k|<n) |ρ(k)|⁴ᐟ³)³ᐟ²
  (Nourdin–Peccati, Theorem 7.3.1, p. 133, in its form d_TV(Vₙ/vₙ, N) ≤
  (4√2/(vₙ² √n))(∑_(|k|<n) |ρ(k)|⁴ᐟ³)³ᐟ² with Vₙ = S/√n, vₙ² = E S²/n).
- Target in prose: Young's inequality on ℤ with exponents (4/3, 4/3; 2): for u, v : ℤ → ℝ,
  ‖u ∗ v‖_(ℓ²) ≤ ‖u‖_(ℓ⁴ᐟ³) ‖v‖_(ℓ⁴ᐟ³), where (u ∗ v)(j) = ∑ₖ u(k) v(j − k)
  (Nourdin–Peccati, (7.3.2), p. 135, for all exponents with 1/p + 1/q = 1 + 1/s).

*Proof route.* In the realization of §6.1, S/√(E S²) = I₂(fₙ) with fₙ = ∑_(k<n) εₖ^(⊗2)/√(E S²),
of unit variance, so §2.2 and Cauchy–Schwarz bound `tvDist` by 4 √Var(‖DF‖²/2), and §4.2 gives
Var(‖DF‖²/2) = 8 ‖fₙ ⊗₁ fₙ‖² = (8/(E S²)²) ∑_(i,j,k,l<n) ρ(k − l)ρ(i − j)ρ(k − i)ρ(l − j). Bound
the sum by n ‖ρₙ ∗ ρₙ‖²_(ℓ²(ℤ)) with ρₙ = |ρ| 1_(|k|<n), and that by n ‖ρₙ‖⁴_(ℓ⁴ᐟ³) by Young's
inequality for convolution with exponents (4/3, 4/3; 2) (Nourdin–Peccati, proof of Theorem
7.3.1, pp. 134–135). E S² = 2 ∑_(k,l<n) ρ(k − l)² ≥ 2n > 0, so no variance hypothesis is needed.
Young's inequality in this case is Hölder's inequality with exponents (2, 4, 4) applied to
|u(k)| |v(j − k)| = (|u(k)| |v(j − k)|)²ᐟ³ · |u(k)|¹ᐟ³ · |v(j − k)|¹ᐟ³: it gives
|(u ∗ v)(j)|² ≤ (∑ₖ |u(k)|⁴ᐟ³ |v(j − k)|⁴ᐟ³) ‖u‖_(ℓ⁴ᐟ³)²ᐟ³ ‖v‖_(ℓ⁴ᐟ³)²ᐟ³, and summing
over j (Tonelli) gives ‖u‖_(ℓ⁴ᐟ³)² ‖v‖_(ℓ⁴ᐟ³)².

*Needs:* §§2.2, 4.2, 6.1; Young's inequality on ℤ (the prose target above).

### 6.3 Fractional Gaussian noise and its Hermite variations

- **Covariance** (`fgnCov`): ρ_H(v) = (|v + 1|²ᴴ + |v − 1|²ᴴ − 2|v|²ᴴ)/2, the covariance of
  the increments of fractional Brownian motion of Hurst index H (Nourdin–Peccati, (7.4.2),
  p. 138; Nualart–Nualart, (8.28), p. 146; Nualart, p. 274).
- **White noise** (`fgnCov_half`): ρ_(1/2)(v) is 1 at v = 0 and 0 otherwise.
- **Positive semidefiniteness** (`fgnCov_posSemidef`): for 0 < H ≤ 1, ∑ᵢⱼ cᵢcⱼ ρ_H(tᵢ − tⱼ) ≥ 0.
- **Summability** (`summable_abs_fgnCov_pow_iff`): for 0 < H < 1 and q ≥ 1,
  ∑_v |ρ_H(v)|^q < ∞ exactly when H < 1 − 1/(2q) or H = 1/2.
- **Hermite variations** (`tendstoInDistribution_hermiteVariation`): if (X_k) has covariance
  ρ_H, q ≥ 1 and H < 1 − 1/(2q) or H = 1/2, then n⁻¹ᐟ² ∑_(k<n) He_q(X_k) converges in law to
  N(0, q! ∑_v ρ_H(v)^q) (Nourdin–Peccati, Theorem 7.4.1, (7.4.5), p. 139, for q ≥ 2 and
  H < 1 − 1/(2q); Nualart–Nualart, Section 8.5, p. 147, for q ≥ 2 and H < 1 − 1/(2q)).

*Proof route.* Positive semidefiniteness: ρ_H(k − l) is the covariance of the increments Bₖ₊₁ − B_k
of the kernel r_H(t, s) = (|t|²ᴴ + |s|²ᴴ − |t − s|²ᴴ)/2, which is nonnegative definite: for H < 1 by
the representation |t|²ᴴ = c_H⁻¹ ∫₀^∞ (1 − e^(−u²t²)) u^(−1−2H) du in Nourdin–Peccati, proof of
Proposition D.1.3, p. 216, and for H = 1 because r₁(t, s) = ts, as there; expand the increments.
Summability: ρ_H(v) = H(2H − 1)|v|²ᴴ⁻²(1 + O(v⁻²)) by Taylor's formula applied to the second
difference of x ↦ |x|²ᴴ, and ρ_(1/2) vanishes off 0; compare with Mathlib's
`Real.summable_abs_int_rpow`. Hermite variations: §6.1 with f = He_q, whose rank is q by
`hermiteRank_hermite`.

*Needs:* §6.1.

**Checks.**

- Hermite coefficients of |x| − √(2/π): a₀ = a₁ = a₃ = 0 and a₂ = √(2/π)/2 ≈ 0.39894, so the rank
  is 2. Negative control for "rank = lowest degree of the polynomial part": x³ has rank 1, since
  ∫ x³ He₁ dγ = 3.
- ρ_H(v)/v²ᴴ⁻² at v = 10⁴ equals H(2H − 1) to five digits: −0.125 at H = 0.25, 0.12 at H = 0.6
  and 0.375 at H = 0.75.
- For H < 1/2 the partial sums ∑_(|v|≤N) ρ_H(v) = (N + 1)²ᴴ − N²ᴴ tend to 0: 0.00112 at
  H = 0.25, N = 2 · 10⁵. So for q = 1 and H < 1/2 the Hermite-variation limit is N(0, 0).
- q! ∑_v ρ_H(v)^q ≈ 2.1642 at (H, q) = (0.6, 2), 2.2504 at (0.3, 2) and 6.6305 at (0.7, 3).
- Thresholds 1 − 1/(2q): 1/2, 3/4 and 5/6 for q = 1, 2, 3.
- Positive semidefiniteness on {0, …, 59}: least eigenvalues 0.0208 at H = 0.1 and 0.0877 at
  H = 0.95; at H = 1, ρ₁ ≡ 1 and the matrix has rank one. Negative control for H ≤ 1: at H = 1.2
  the 10 × 10 matrix has eigenvalue −7.005.
- Young's bound behind §6.2, tr(R⁴) ≤ n (∑_(|k|<n) |ρ(k)|⁴ᐟ³)³ for the Toeplitz matrix R of
  ρ_H: 748.05 ≤ 1953.35 at H = 0.6, n = 400, and 111852.63 ≤ 403159.62 at H = 0.74, n = 400.

### Dependencies

Layer 5; WienerChaosAndMalliavinCalculus §§1.1, 3.1; Mathlib's Gaussian characteristic functions
and `IsGaussianProcess`.

## Layer 7: second-order Poincaré inequalities in finite dimension

Throughout, Z is standard Gaussian on Euclidean space ℝⁿ (`stdGaussian`) and g : ℝⁿ → ℝ.

### 7.1 The Stein factor and the covariance representation

- **Stein factor** (`gaussianSteinFactor`): T_g(x) = ∫₀^∞ e⁻ᵗ E⟪∇g(x), ∇g(e⁻ᵗx +
  √(1 − e⁻²ᵗ) Y)⟫ dt with Y standard Gaussian (`gradient`), the finite-dimensional
  ⟪DF, −DL⁻¹F⟫ for F = g(Z) (Nourdin–Peccati, proof of Proposition 1.6.1, p. 17, for n = 1).
- **Linear functions** (`gaussianSteinFactor_inner`): for g = ⟪a, ·⟫, T_g ≡ ‖a‖².
- **Covariance representation** (`integral_mul_comp_stdGaussian`): for a centred C¹ g with
  polynomially growing gradient and φ of class C¹ with bounded derivative,
  E[g(Z) φ(g(Z))] = E[φ'(g(Z)) T_g(Z)] (Nourdin–Peccati, proof of Proposition 1.6.1, pp. 17–18, for
  n = 1).

*Proof route.* Realize Z through the isonormal process h ↦ ⟪h, Z⟫ on ℝⁿ (the sanity check of
WienerChaosAndMalliavinCalculus, Layer 1). For g with polynomial growth of all derivatives this is
WienerChaosAndMalliavinCalculus §6.3 with F = G = g(Z), where §2.1 here and Mehler's formula of
§6.1 there write ⟪Dg(Z), −DL⁻¹g(Z)⟫ as T_g(Z). For C¹ g with polynomially growing gradient,
approximate by mollified and cut-off g (Mathlib's `ContDiffBump`) in the graph norm and use that
the graph of D is closed (WienerChaosAndMalliavinCalculus §4.2).

*Needs:* §2.1; WienerChaosAndMalliavinCalculus Layer 1 and §§4.1, 4.2, 6.1, 6.3.

### 7.2 Second-order Poincaré inequalities

For g of class C² whose second derivative grows at most polynomially, with E g(Z) = 0 and
v = E g(Z)², write A = (E‖∇²g(Z)‖⁴)¹ᐟ⁴ (E‖∇g(Z)‖⁴)¹ᐟ⁴, with the operator norm of the Hessian.

- **Variance of the Stein factor** (`integral_abs_sub_gaussianSteinFactor_le`):
  E|v − T_g(Z)| ≤ (3/2) A (Nourdin–Peccati, Proposition 5.3.10, (5.3.9), p. 107, for F = G
  in finite dimension).
- **Total variation** (`tvDist_map_stdGaussian_le`): `tvDist` (g(Z), N(0, v)) ≤ (6/v) A; if
  v = 0 both sides are 0 (Nourdin–Peccati, Theorem 5.3.3, (5.3.2), p. 103, which assumes a
  density; Chatterjee 2009 and Nourdin–Peccati–Reinert 2009 for the finite-dimensional form).
- **Wasserstein** (`wassersteinEDist_map_stdGaussian_le`): for v = 1, W₁(g(Z), N(0, 1)) ≤
  (3/√(2π)) A (Nourdin–Peccati, Proposition 1.6.1, (1.6.2), p. 17, for n = 1).

*Proof route.* E T_g(Z) = v by §7.1 with φ the identity, so E|v − T_g| ≤ √Var T_g(Z), and the
Gaussian Poincaré inequality (WienerChaosAndMalliavinCalculus §4.4, for the isonormal process
of §7.1) bounds Var T_g by E‖∇T_g‖². Differentiating under the integrals, ∇T_g(x) is
∇²g(x) applied to ∫ e⁻ᵗ P_t∇g dt plus ∫ e⁻²ᵗ P_t(∇²g)(x) applied to ∇g(x); Jensen for
the Mehler average and Hölder give √E‖∇T_g‖² ≤ (1 + 1/2) A (Nourdin–Peccati, proof of
Proposition 5.3.10, pp. 107–108). Then §2.2 with F = g(Z): (4/v)(3/2) A and √(2/π)(3/2) A.

*Needs:* §§2.2, 7.1; WienerChaosAndMalliavinCalculus §4.4.

**Checks.**

- For g(x) = x + a(x² − 1) on ℝ, T_g(x) = (1 + 2ax)(1 + ax), v = 1 + 2a², ‖∇²g‖ = 2a and
  E g'(Z)⁴ = 1 + 24a² + 48a⁴. At a = 0.2: E|v − T_g| = 0.48293 ≤ 0.71678, and `tvDist`
  (g(Z), N(0, v)) = 0.36172 ≤ 2.65476; at a = 0.05: 0.07586 ≤ 0.60582.
- W₁ form, for the normalized g = (x + a(x² − 1))/√(1 + 2a²), which has v = 1: at a = 0.2,
  W₁(g(Z), N(0, 1)) = 0.18805 ≤ 0.52955, and at a = 0.05, 0.04830 ≤ 0.12084.
- `gaussianSteinFactor_inner` is the equality case: for linear g, T_g − v = 0 and A = 0.
- Negative control for the weight e⁻ᵗ: with e⁻²ᵗ in place of e⁻ᵗ, the linear g = x would
  have T_g ≡ 1/2 ≠ v = 1, and with no weight the integral diverges.

### Dependencies

Layer 2; WienerChaosAndMalliavinCalculus §§1.1, 4.1, 4.2, 4.4, 6.1, 6.3.

## Downstream consumers

No roadmap consumes this one. Natural consumers are central limit theorems for linear
statistics of random matrices through §7.2, limit theorems for variations of fractional Brownian
motion and of other Gaussian fields through Layer 6, and quantitative limit theorems for
U-statistics of Gaussian sequences through Layers 4–5.

## Scope and ownership

Completion means:

1. Stein bounds in total variation and Kolmogorov distance through C¹ classes, and the total
   variation between centred Gaussian laws (Layer 1).
2. The multivariate integration-by-parts formula, conditional positivity and Mehler
   representation of the random variance, the Malliavin–Stein bounds for divergences and centred
   functionals, and the multivariate smart-path bound (Layer 2).
3. The Bouleau–Hirsch criterion and densities on a chaos (Layer 3).
4. Contractions, the fourth-cumulant formulas and comparison, the fourth-moment bounds,
   non-Gaussianity of higher chaoses and the fourth moment theorem (Layer 4).
5. The covariance of derivatives, the Peccati–Tudor theorem and the chaotic central limit
   theorem (Layer 5).
6. Hermite rank, the Breuer–Major theorem, the quadratic total-variation rate, the covariance of
   fractional Gaussian noise with its positivity and summability, and Hermite variations
   (Layer 6).
7. The finite-dimensional Stein factor, covariance representation and second-order Poincaré
   inequalities (Layer 7).

**Not owned here.**

- Isonormal processes, the chaos, multiple integrals and contractions, the derivative and
  𝔻¹,², the divergence, the infinite-dimensional Ornstein–Uhlenbeck semigroup and the
  pseudo-inverse of its generator, with the chain rule, Mehler's formula, the integration-by-parts
  formula, the Poincaré inequality and hypercontractivity, are owned by
  WienerChaosAndMalliavinCalculus. This roadmap consumes its §§1.1, 3.1, 3.3, 4.1–4.4, 5.1 and
  6.1–6.4 and a sanity check of its Layer 1, and is named there as the intended consumer of its
  Malliavin–Stein items.
- The Stein solution of the standard normal law, its Stein equation, its bounds for Lipschitz and
  smooth test functions, the Wasserstein bound through the Stein class and Stein's method for sums
  of independent or locally dependent variables are owned by SteinsMethodForNormalApproximation;
  this roadmap consumes its §§1.1 and 3.1. That roadmap excludes total variation, the Kolmogorov
  distance and the Malliavin–Stein method, which are the subject here.
- The Berry–Esseen theorem and a named Kolmogorov distance belong to
  [MathematicalStatisticsHigherOrderAndResampling](../MathematicalStatisticsHigherOrderAndResampling/README.md),
  which takes the Kolmogorov distance from
  [ArithmeticStatisticsPartVIII](../ArithmeticStatisticsPartVIII/README.md) §5.14; they are not
  consumed, and Kolmogorov bounds here are pointwise.
- The finite-dimensional Ornstein–Uhlenbeck semigroup with its Mehler kernel and Hermite
  eigenfunctions belongs to OrnsteinUhlenbeckSemigroup; Layer 7 writes the Mehler average inside
  its own definition and does not define a semigroup.
- Stein's identity for Gaussian vectors is owned by MathematicalStatisticsFoundations §4.4 and the
  finite-dimensional Gaussian Poincaré inequality by [RandomMatrices](../RandomMatrices/README.md)
  §2.2; the first is consumed, the second is replaced by its Wiener-space form.
- Poisson approximation in total variation belongs to
  [PoissonApproximation](../PoissonApproximation/README.md), and the martingale central limit
  theorem to MartingaleCentralLimitTheorem; neither is used.
- Gaussian integration by parts, Mehler's formula and the Gaussian Poincaré inequality in finite
  dimension are not targets here: the routes use their Wiener-space forms from
  WienerChaosAndMalliavinCalculus §§6.1, 6.3 and 4.4, and Stein's identity from
  MathematicalStatisticsFoundations §4.4. Young's inequality for convolution is in Tau Ceti only
  for an L¹ kernel, ‖k ⋆ f‖_p ≤ ‖k‖₁ ‖f‖_p, which does not give the exponents (4/3, 4/3; 2) of
  §6.2; that case is a prose target of §6.2. Later work may supply the general inequality.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.tvDist`, `ProbabilityTheory.cdf`, `ProbabilityTheory.gaussianReal` with
  `ProbabilityTheory.gaussianReal_map_const_mul`, `ProbabilityTheory.stdGaussian` and
  `ProbabilityTheory.multivariateGaussian`.
- `MeasureTheory.TendstoInDistribution`, with Lévy's continuity theorem
  `MeasureTheory.TendstoInDistribution.of_tendsto_charFun`;
  `ProbabilityTheory.IsGaussian.charFunDual_eq` and `MeasureTheory.Measure.ext_of_charFunDual` for
  laws of Gaussian vectors.
- `ProbabilityTheory.IsGaussianProcess`, `ProbabilityTheory.variance` and
  `MeasureTheory.condExp`.
- `MeasureTheory.Lp`, `Submodule.starProjection`, `MeasureTheory.Measure.pi` and
  `MeasureTheory.integral_fintype_prod_eq_prod`.
- `Polynomial.hermite`, `gradient`, `ContDiffBump` and `Real.summable_abs_int_rpow`.
- Mathlib has no Stein bound for total variation or Kolmogorov distance, no Malliavin calculus and
  no fourth moment theorem.

### From Tau Ceti

- `TauCeti.wassersteinEDist`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`): the Wasserstein distance,
  used at exponent 1 in §§2.2 and 7.2.
- `MeasureTheory.etvDist_eq_two_mul_iSup_sub` (`TauCeti/MeasureTheory/Measure/TotalVariation.lean`):
  total variation as twice the supremum over measurable sets, used in §1.2.
- `TauCeti.Probability.multivariateGaussian_zero_eq_map_stdGaussian_sqrt`
  (`TauCeti/Probability/Distributions/Gaussian/Multivariate.lean`): N(0, C) is the image of the
  standard Gaussian under C^(1/2), used in §2.3.
- `TauCeti.hasSum_gaussianHermite_expansion`
  (`TauCeti/Probability/Distributions/Gaussian/Hermite/Parseval.lean`): every element of L²(γ)
  is the sum of its expansion in the orthonormal basis `TauCeti.gaussianHermiteHilbertBasis`,
  whose q-th element is He_q/√(q!); with the normalization of the Conventions, a_q is the q-th
  coordinate divided by √(q!). Used in the route of §6.1.

### From other roadmaps

- WienerChaosAndMalliavinCalculus:
  - §1.1: isonormal processes and their existence on every real Hilbert space, for §6.1; and the
    sanity check of its Layer 1 that the coordinates ⟪h, ·⟫ of a standard Gaussian vector form an
    isonormal process, for §7.1.
  - §3.1: kernels, symmetric kernels, multiple integrals with their isometry; §3.3: contractions
    and the product formula; for Layers 4–6.
  - §4.1: smooth cylinder functionals and their gradient formula, for §7.1.
  - §4.2: 𝔻¹,² and the closed derivative; §4.3: the chain rule for C¹ functions with bounded
    derivative, and its prose target the product rule, used in §4.2 here; §4.4: the chaos
    description of 𝔻¹,², the Poincaré inequality, and the prose targets D Jₙ = Jₙ₋₁ D and
    D I_q(f) = q I_(q−1)(f(·, t)).
  - §5.1: the divergence relation; §6.1: the semigroup and Mehler's formula on cylinder
    functionals; §6.2: the pseudo-inverse L⁻¹; §6.3: the commutation and the integration-by-parts
    formula E[F g(G)] = E F E g(G) + E[g'(G) ⟪DG, −DL⁻¹F⟫] for F a functional of W and
    G ∈ 𝔻¹,²; §6.4: the equivalence of moments on a chaos.
- SteinsMethodForNormalApproximation:
  - §1.1: the Stein solution f_h and its Stein equation for continuous integrable h.
  - §3.1: the Stein class (differentiable, |f| ≤ 1, |f'| ≤ √(2/π), f' 2-Lipschitz) and the bound
    of W₁(μ, N(0, 1)) by the supremum of |∫ (f' − x f) dμ| over it.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md):
  - §4.4: Stein's identity E[(Xᵢ − θᵢ) gᵢ(X)] = v E[∂ᵢgᵢ(X)] for X ~ N(θ, v I), for §§1.3 and 2.3
    (in §2.3 through N = C^(1/2) Z).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Multivariate Stein bounds in Wasserstein distance** for positive definite covariance
  (Nourdin–Peccati, Theorem 6.1.1, p. 116, and Theorem 6.2.2, p. 121), which need the
  multivariate Stein solution.
- **Higher derivatives**: the infinite-dimensional second-order Poincaré inequality for F ∈ 𝔻²,⁴
  (Nourdin–Peccati, Theorem 5.3.3, p. 103) and the bounds ‖DL⁻¹F‖_p ≤ ‖DF‖_p and
  ‖D²L⁻¹F‖_p ≤ ½‖D²F‖_p (Nourdin–Peccati, Lemma 5.3.7, p. 104), which need the Hilbert-valued
  derivative listed in the Beyond section of WienerChaosAndMalliavinCalculus.
- **Multivariate densities**: absolute continuity of the law of a vector with almost surely
  invertible Malliavin matrix (Nualart, Theorem 2.1.2, p. 97), and Shigekawa's theorem on finite
  chaos sums (Nourdin–Peccati, Remark 2.10.2, p. 55).
- **Optimal rates and cumulants**: the optimal fourth-moment rate and the Berry–Esseen-type
  bounds on a chaos (Nourdin–Peccati, Chapter 9), and the cumulant formulas through Gamma
  operators (Nourdin–Peccati, Chapter 8).
- **Non-central limits**: Hermite variations of fractional Brownian motion at H = 1 − 1/(2q) with
  logarithmic normalization and for H > 1 − 1/(2q) with Hermite-distribution limits
  (Nourdin–Peccati, Theorem 7.4.1, p. 139), and convergence to Gamma laws on the second chaos.
- **Universality** of the fourth moment theorem for homogeneous sums of independent variables,
  and the fourth moment theorem on Poisson space and in free probability.

## References

- I. Nourdin and G. Peccati, *Normal Approximations with Malliavin Calculus: From Stein's Method
  to Universality*, Cambridge Tracts in Mathematics 192, Cambridge University Press, 2012.
  Chapters 1–3 and 5–7, Appendix D.
- D. Nualart and E. Nualart, *Introduction to Malliavin Calculus*, Institute of Mathematical
  Statistics Textbooks 9, Cambridge University Press, 2018. Chapter 8.
- D. Nualart, *The Malliavin Calculus and Related Topics*, 2nd ed., Probability and Its
  Applications, Springer, 2006. §§2.1 and 5.1.
- L. H. Y. Chen, L. Goldstein and Q.-M. Shao, *Normal Approximation by Stein's Method*,
  Probability and Its Applications, Springer, 2011. Chapter 2.
- P. Breuer and P. Major, Central limit theorems for non-linear functionals of Gaussian fields,
  *J. Multivariate Anal.* 13 (1983), 425–441.
- D. Nualart and G. Peccati, Central limit theorems for sequences of multiple stochastic
  integrals, *Ann. Probab.* 33 (2005), 177–193.
- G. Peccati and C. A. Tudor, Gaussian limits for vector-valued multiple stochastic integrals, in
  *Séminaire de Probabilités XXXVIII*, Lecture Notes in Math. 1857, Springer, 2005, 247–262.
- Y. Hu and D. Nualart, Renormalized self-intersection local time for fractional Brownian
  motion, *Ann. Probab.* 33 (2005), 948–983.
- S. Chatterjee, Fluctuations of eigenvalues and second order Poincaré inequalities, *Probab.
  Theory Related Fields* 143 (2009), 1–40.
- I. Nourdin, G. Peccati and G. Reinert, Second order Poincaré inequalities and CLTs on Wiener
  space, *J. Funct. Anal.* 257 (2009), 593–609.
