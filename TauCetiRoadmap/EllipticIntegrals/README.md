# Roadmap: elliptic integrals, the AGM and Jacobi elliptic functions

**Summary.** This roadmap builds the classical real theory of elliptic integrals as a library:
Legendre's integrals F(φ, k), E(φ, k) and Π(φ, k, α²) and their complete values K(k), E(k) and
Π(k, α²), for a real modulus k with k² < 1 and a real characteristic α² < 1; the
arithmetic–geometric mean M(a, b); Carlson's symmetric integrals R_F, R_D, R_J, R_C and R_G on the
slit plane ℂ ∖ (−∞, 0]; and the Jacobi amplitude am(u, k), the inverse of φ ↦ F(φ, k), with
sn = sin ∘ am, cn = cos ∘ am and dn = √(1 − k² sn²) of a real variable. Its applications are part
of it: the perimeter of an ellipse, the nonlinear pendulum, the Gauss–Brent–Salamin formula for π
and the real period of an elliptic curve over ℝ.

The headline theorems are these.

- *The Gauss–Brent–Salamin formula.* Run the AGM from a₀ = 1 and g₀ = 1/√2 by
  aₙ₊₁ = (aₙ + gₙ)/2 and gₙ₊₁ = √(aₙgₙ), and put cₙ² = aₙ² − gₙ². Then π = 4M(1, 1/√2)²/(1 − S),
  where S is the sum over n ≥ 1 of 2ⁿ⁺¹cₙ². It rests on the AGM series
  E(k) = K(k)(1 − Σₙ 2ⁿ⁻¹cₙ²), summed over n ≥ 0, for k² < 1 with g₀ = √(1 − k²) and c₀ = k.
- *Carlson's duplication theorem.* If x, y and z lie in the slit plane or at 0, at most one of
  them 0, and λ = √x√y + √y√z + √z√x with principal square roots, then
  R_F(x, y, z) = R_F((x + λ)/4, (y + λ)/4, (z + λ)/4).
- *Jacobi's addition theorem and the pendulum.* For k² < 1 and real u, v,
  sn(u + v) = (sn u cn v dn v + sn v cn u dn u)/(1 − k² sn²u sn²v). For ω > 0 and 0 < θ₀ < π the
  unique solution of θ″ = −ω² sin θ with θ(0) = θ₀ and θ′(0) = 0 is
  θ(t) = 2 arcsin(k sn(ωt + K(k), k)), k = sin(θ₀/2), and its least period is 4K(k)/ω.
- *The real period by the AGM.* Let W be a Weierstrass curve over ℝ and
  P(x) = 4x³ + b₂x² + 2b₄x + b₆, so that its real period is Ω(W) = 2∫ dx/√P(x) over the set where
  P > 0. If P(x) = 4(x − e₁)(x − e₂)(x − e₃) with e₃ < e₂ < e₁, then
  Ω(W) = 2π/M(√(e₁ − e₃), √(e₁ − e₂)); if P(x) = 4(x − e₁)((x − a)² + b²) with b ≠ 0, then
  Ω(W) = 2π/M(2√A, √(2A + 2(e₁ − a))) with A = √((e₁ − a)² + b²). The AGM converges
  quadratically, so this computes the period of the Birch–Swinnerton-Dyer quotient.

Tau Ceti's library of elliptic integrals supplies the objects with their basic theory, Gauss's AGM
evaluation of K, Landen's transformations and Legendre's relation; Mathlib supplies the AGM.
[EllipticCurves](../EllipticCurves/README.md) owns the real period and the Birch–Swinnerton-Dyer
quotient, and Layer 5 evaluates that period. The lattice side (the σ function, the quasi-periods,
the lattice form of Legendre's relation, ℂ/Λ ≅ E(ℂ)) belongs to
[ModularCurvesPartII](../ModularCurvesPartII/README.md), and the theta functions and the modular
function λ to [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md); nothing here uses them.

Layer 1 finds K and E as k → 1⁻. Layer 2 proves the AGM series for E and the Gauss–Brent–Salamin
formula. Layer 3 gives Carlson's integrals holomorphy in each variable, R_F holomorphy in its three
variables jointly, the duplication theorem and E(k) as an R_G value. Layer 4 gives the least period
of sn, the addition theorem, the limits as k → 1⁻ and the pendulum. Layer 5 treats the ellipse
with its axes exchanged, the real cubic integrals and the real period. The layers depend on one
another only through the library.

## Conventions

1. **Modulus, not parameter.** Every integral takes the modulus `k : ℝ`, as in DLMF Chapter 19
   and Carlson. The parameter m = k² never appears as an argument. The complementary modulus
   k′ = √(1 − k²) is written out, and K′(k) means `legendreK √(1 - k ^ 2)`; neither gets its own
   definition.
2. **Legendre integrals** (DLMF 19.2.4, 19.2.5, 19.2.7) are Tau Ceti's, in the namespace
   `TauCeti.Real`:

   ```text
   legendreF  φ k    = ∫₀^φ (1 − k² sin²θ)^(−1/2) dθ
   legendreE  φ k    = ∫₀^φ (1 − k² sin²θ)^(1/2) dθ
   legendrePi φ k α² = ∫₀^φ (1 − α² sin²θ)⁻¹ (1 − k² sin²θ)^(−1/2) dθ
   legendreK  k      = legendreF (π/2) k
   legendreEc k      = legendreE (π/2) k
   legendrePic k α²  = legendrePi (π/2) k α²
   ```

   The integrals are `intervalIntegral`s and the powers are `Real.rpow` with exponents
   `-1/2 : ℝ` and `1/2 : ℝ`. These are total functions of real arguments. Their values are
   meaningful under `k ^ 2 < 1` and `α2 < 1`, which every statement states explicitly; the
   statements at k = 1 carry `|φ| < π/2` instead. The positivity and integrability theorems of the
   library come first, so that a junk value is never mistaken for a result.
3. **Third kind.** The characteristic `α2` is a real number, written α² in prose and allowed to be
   negative. Only `α2 < 1` is in scope: for `α2 > 1` the integral is a Cauchy principal value,
   which this roadmap does not treat.
4. **Carlson integrals** (DLMF 19.16.1, 19.16.2, 19.16.3, 19.16.5, 19.2.17) are Tau Ceti's, in the
   namespace `Complex`, defined by these integrals with the principal power
   `(t + x) ^ (-(1/2) : ℂ)` of each factor:

   ```text
   carlsonRF x y z   = ½ ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½) dt
   carlsonRJ x y z p = (3/2) ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½) (t+p)⁻¹ dt
   carlsonRD x y z   = carlsonRJ x y z z
   carlsonRC x y     = carlsonRF x y y
   carlsonRG x y z   = ¼ ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½)
                           · (x/(t+x) + y/(t+y) + z/(t+z)) · t dt
   ```

   The domain is: `x, y, z ∈ slitPlane ∪ {0}` with at most one of them `0`, and `p ∈ slitPlane`;
   for `carlsonRD` the repeated argument `z` and for `carlsonRC` the repeated argument `y` lie in
   `slitPlane`. The library states its domain hypotheses with the possible zero in the first
   argument; the symmetry of the functions moves it to any other.
5. **AGM.** Mathlib's `NNReal.agm` is the AGM. Statements about real numbers coerce through
   `Real.toNNReal` or `NNReal` literals rather than introducing a real-valued copy. For
   a₀, g₀ ≥ 0 the AGM sequences are aₙ₊₁ = (aₙ + gₙ)/2, gₙ₊₁ = √(aₙgₙ) and cₙ₊₁ = (aₙ − gₙ)/2, so
   that cₙ² = aₙ² − gₙ² for n ≥ 1; each statement fixes c₀. Mathlib's `NNReal.agmSequences a₀ g₀ n`
   is the pair (gₙ₊₁, aₙ₊₁): its index 0 is already one step in.
6. **Jacobi functions** are Tau Ceti's `jacobiAm k`, `jacobiSn k`, `jacobiCn k` and `jacobiDn k`
   in `TauCeti.Real`, functions `ℝ → ℝ` with the modulus first, so that
   `Function.Periodic (jacobiSn k) (4 * legendreK k)` reads directly. For `k ^ 2 < 1`,
   `jacobiAm k` is the inverse of `fun φ ↦ legendreF φ k`, that is the inverse of the order
   isomorphism `legendreFOrderIso`; for `k ^ 2 ≥ 1` it is the junk value `id`. Then
   `jacobiSn k = sin ∘ jacobiAm k`, `jacobiCn k = cos ∘ jacobiAm k` and
   `jacobiDn k u = √(1 − k² (jacobiSn k u)²)`. Complex-variable versions are not part of this
   roadmap (Scope and ownership).
7. **Lemniscate constant.** Tau Ceti's `TauCeti.Real.lemniscateConstant = 2 ∫₀¹ (1 − t⁴)^(−1/2) dt`
   (ϖ ≈ 2.62206).
8. **Real cubic and real period.** For `W : WeierstrassCurve ℝ`, Mathlib's `W.Ψ₂Sq` is the cubic
   4x³ + b₂x² + 2b₄x + b₆, the square of 2y + a₁x + a₃ on the curve. Tau Ceti's
   `WeierstrassCurve.realPeriod W` is twice the real value of the Lebesgue integral
   `∫⁻ x in {x | 0 < W.Ψ₂Sq.eval x}, ENNReal.ofReal (√(W.Ψ₂Sq.eval x))⁻¹`
   (`WeierstrassCurve.realPeriodLIntegral`). In Layer 5 the roots of `Ψ₂Sq` are given as explicit
   real numbers, or as a real root and a pair a ± bi, together with a factorization hypothesis
   `∀ x, W.Ψ₂Sq.eval x = …`. No root-selection function is introduced.
9. **Homes and names.** The suggested homes are
   `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/` (Layers 1–3 and 5) and
   `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/` (Layer 4), beside Mathlib's
   `Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` and
   `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`. Statements about the integrals
   are in `TauCeti.Real` or `Complex` as their objects are; statements about the real period are
   in `WeierstrassCurve`. The acceptance file `Suggested.lean` states the headline theorems in
   `TauCetiRoadmap.EllipticIntegrals`.

## Layer 1: the complete integrals at the singular modulus

### 1.1 The logarithmic singularity of K

Prove `tendsto_legendreK_sub_log`: as k → 1⁻, `legendreK k − log (4 / √(1 − k ^ 2))` tends to 0
(DLMF 19.12.1). Prove also that `legendreEc k` tends to 1 as k → 1⁻. With Tau Ceti's
`TauCeti.Real.tendsto_one_sub_sq_mul_legendreK_nhdsLT_one`, which says that (1 − k²) K(k) → 0,
these are the three limits of the complete integrals at k = 1.

*Route.* Substituting θ = π/2 − φ writes K(k) as the integral over [0, π/2] of
(sin²φ + k′² cos²φ)^(−1/2). The companion integral J(k) of cos φ (sin²φ + k′² cos²φ)^(−1/2) over
the same interval is (1/k) arsinh(k/k′) = (1/k) log((1 + k)/k′), by the substitution u = sin φ, and
J(k) − log(2/k′) → 0. The integrand of K − J is (1 − cos φ)(sin²φ + k′² cos²φ)^(−1/2), bounded by
(1 − cos φ)/sin φ = tan(φ/2), so dominated convergence gives K − J → ∫₀^(π/2) tan(φ/2) dφ = log 2.
Hence K(k) − log(4/k′) → 0. The limit of E is the continuity of `legendreEc` at 1 with its value
there.
*Needs:* Tau Ceti `TauCeti.Real.legendreK_def`, `TauCeti.Real.legendreF_def`,
`TauCeti.Real.continuous_legendreEc`, `TauCeti.Real.legendreEc_one`; Mathlib `Real.arsinh`,
`intervalIntegral.tendsto_integral_filter_of_dominated_convergence`.

**Checks.**
- At k′ = 10⁻³, K(k) = 8.2940514636… and log 4000 = 8.2940496401…, a difference of 1.8 · 10⁻⁶.
  With log(2/k′) in place of log(4/k′) the difference tends to log 2 instead of 0: at k′ = 10⁻³ it
  is 0.693149….
- The route's companion integral at k = 0.9 is J = 1.63579943287…, equal to
  (1/k) arsinh(k/k′); a route that dropped the bounded difference K − J would miss the constant
  log 2 = ∫₀^(π/2) tan(φ/2) dφ.

### Examples

- K(k) − log(4/k′) is 6.758 · 10⁻³, 1.248 · 10⁻⁴ and 1.824 · 10⁻⁶ at k′ = 10⁻¹, 10⁻² and 10⁻³.
- At the same moduli E(k) = 1.0159935…, 1.0002746… and 1.0000039…, tending to 1, while
  (1 − k²) K(k) = 3.70 · 10⁻², 5.99 · 10⁻⁴ and 8.29 · 10⁻⁶ tends to 0.

### Dependencies

Tau Ceti's Legendre integrals with the continuity of E in the modulus and the value E(1) = 1.
Mathlib's dominated convergence for interval integrals and `Real.arsinh`.

## Layer 2: the AGM evaluation of E and the Gauss–Brent–Salamin formula

### 2.1 The AGM series for E

Prove `legendreEc_eq_agm_tsum` (DLMF 19.8.6): for `k ^ 2 < 1`, run the AGM from a₀ = 1 and
g₀ = k′ = √(1 − k²), with c₀ = k and cₙ₊₁ = (aₙ − gₙ)/2 (Convention 5). Then Σₙ 2ⁿ⁻¹cₙ², summed
over n ≥ 0, converges and `legendreEc k = legendreK k * (1 − Σₙ 2ⁿ⁻¹ cₙ²)`. In Mathlib's indexing
cₙ₊₁² is the difference of the squares of the two entries of `NNReal.agmSequences 1 k′ n`, so the
statement sums 2ⁿcₙ₊₁² over n ≥ 0 and writes the term c₀²/2 = k²/2 separately; summability is part
of the statement.

*Route.* Put kₙ = cₙ/aₙ, so that kₙ′ = gₙ/aₙ for n ≥ 1 and kₙ₊₁ = (1 − kₙ′)/(1 + kₙ′). Tau Ceti's
descending Landen transformations K(kₙ) = (1 + kₙ₊₁) K(kₙ₊₁) and
E(kₙ) = (1 + kₙ′) E(kₙ₊₁) − kₙ′ K(kₙ) (DLMF 19.8.12), with 1 + kₙ′ = 2aₙ₊₁/aₙ and
1 + kₙ₊₁ = aₙ/aₙ₊₁, give aₙ² tₙ = 2aₙ₊₁² tₙ₊₁ − aₙgₙ for tₙ = E(kₙ)/K(kₙ). Since
2aₙ₊₁² − aₙ² − aₙgₙ = −cₙ²/2, the quantities uₙ = 2ⁿaₙ²(tₙ − 1) satisfy uₙ₊₁ − uₙ = 2ⁿ⁻¹cₙ², and
uₙ → 0 because 1 − tₙ is at most a constant times kₙ², which tends to 0 quadratically (Tau Ceti's
quadratic bound on aₙ − gₙ). Summing from u₀ = E(k)/K(k) − 1 gives the series; the same bound gives
its convergence.
*Needs:* Tau Ceti `TauCeti.Real.legendreK_eq_one_add_mul_legendreK`,
`TauCeti.Real.legendreEc_eq_one_add_mul_legendreEc`, `TauCeti.Real.legendreK_pos`,
`TauCeti.Real.pi_div_two_le_legendreK`, `TauCeti.Real.legendreEc_le_pi_div_two`,
`NNReal.agmSequences_snd_sub_fst_le`; Mathlib `NNReal.agmSequences`, `NNReal.agmSequences_succ'`,
`NNReal.tendsto_agmSequences_snd_agm`.

**Checks.**
- At k = 0.6 the series gives E(0.6) = 1.4180833944…, the value of the defining integral. With
  the weights 2ⁿ in place of 2ⁿ⁻¹, K(0.6)(1 − Σₙ 2ⁿcₙ²) = 1.0854130….
- At k = 0 every cₙ vanishes and the identity reads E(0) = K(0) = π/2; with c₀ = 1 in place of
  c₀ = k it would read E(0) = π/4.

### 2.2 The Gauss–Brent–Salamin formula

Prove `pi_eq_four_mul_agm_sq_div_one_sub_tsum` (Salamin 1976, Theorem 1b, p. 567): run the AGM
from a₀ = 1 and g₀ = 1/√2, with cₙ² = aₙ² − gₙ² for n ≥ 1. Then the sum over n ≥ 1 of 2ⁿ⁺¹cₙ²
converges and
`π = 4 M(1, 1/√2)² / (1 − Σ_{n ≥ 1} 2^(n+1) cₙ²)`. In Mathlib's indexing the n-th summand is
2ⁿ⁺²cₙ₊₁², read off `NNReal.agmSequences 1 (√2)⁻¹ n`.

*Route.* At k = 1/√2, k = k′ and c₀² = 1/2, so §2.1 gives `E = K (3/4 − Σ_{n ≥ 1} 2^(n−1) cₙ²)`.
Legendre's relation at k = k′, 2EK − K² = π/2 (Tau Ceti `TauCeti.Real.legendreEc_one_div_sqrt_two`),
then gives `π/2 = K² (1/2 − Σ_{n ≥ 1} 2^n cₙ²)`, and Gauss's K(1/√2) = π/(2M(1, 1/√2)) gives the
formula.
*Needs:* §2.1; Tau Ceti `TauCeti.Real.legendreEc_one_div_sqrt_two`,
`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`, `TauCeti.Real.legendreK_pos`; Mathlib `NNReal.agm`.

**Checks.**
- Replacing M(1, 1/√2) by aₙ₊₁ and keeping the terms up to cₙ gives 3.140579250…,
  3.141592646… and 3.141592653589794 for n = 1, 2, 3: the number of correct digits roughly
  doubles at each step, as quadratic convergence predicts.
- With 2ⁿcₙ² in place of 2ⁿ⁺¹cₙ² the right side is 3.000251…, not π.

### Examples

- For k = 1/√2: c₀² = 1/2, c₁ = (1 − 1/√2)/2 = 0.1464466…, c₂ = 0.0063284…, and the weighted
  terms 2ⁿ⁻¹cₙ² are 0.25, 0.0214466…, 0.0000801…, 5.6 · 10⁻¹⁰, …, with sum 0.2715267…. Then
  E(1/√2) = 0.7284733… · K(1/√2) = 0.7284733… × 1.8540747… = 1.3506439…, which is Tau Ceti's
  `TauCeti.Real.legendreEc_one_div_sqrt_two` evaluated with K(1/√2) = Γ(1/4)²/(4√π).
- M(1, 1/√2) = 0.8472130847…, so 4M² = 2.8710800…, and 1 − 4c₁² − 8c₂² − … = 0.9138932…; the
  quotient is 3.14159265358979….

### Dependencies

Tau Ceti: Landen's descending transformations of K and E, Gauss's AGM evaluation of K, Legendre's
relation at k = 1/√2, and the quadratic bound for the AGM. Mathlib: `NNReal.agm` and
`NNReal.agmSequences`.

## Layer 3: Carlson's symmetric integrals

### 3.1 Holomorphy

Prove that each Carlson function is holomorphic in each of its variables separately on the slit
plane, the other arguments being fixed in the domain of Convention 4 (Carlson 1977, Chapter 9):
`DifferentiableOn ℂ (fun x ↦ carlsonRF x y z) slitPlane` for `y ∈ slitPlane ∪ {0}` and
`z ∈ slitPlane`, and the same for `carlsonRG`, for `carlsonRJ` in each of its first three
arguments (with `p ∈ slitPlane`), for `carlsonRD` in each argument (its repeated last argument
included), and for `carlsonRC` in each argument (the second being repeated). By the symmetries of
the library the first argument suffices for `carlsonRF` and `carlsonRG`; holomorphy of
`carlsonRJ` in `p` is Tau Ceti's `Complex.differentiableOn_carlsonRJ_fourth`.

Prove also that R_F is holomorphic in its three variables jointly on the product of three slit
planes:
`DifferentiableOn ℂ (fun w : ℂ × ℂ × ℂ ↦ carlsonRF w.1 w.2.1 w.2.2) (slitPlane ×ˢ slitPlane ×ˢ slitPlane)`.
§3.2 composes R_F with a map that moves all three arguments at once, and holomorphy in each
variable separately gives no chain rule for such a composite.

*Route.* Differentiate under the integral sign, as Tau Ceti does in `p`: on a compact
neighbourhood of a point of the slit plane, the derivative −(t + x)^(−3/2)/2 of the moving factor
is bounded by a constant times (1 + t)^(−3/2), and the other factors are bounded by the
integrability estimates of the library. For `carlsonRD` and `carlsonRC` in their repeated argument
use `Complex.carlsonRD_eq_integral` and `Complex.carlsonRC_eq_integral`, whose integrands contain
that argument once. For the joint statement, differentiate in the three variables at once: on a
compact subset C of the slit plane there is c > 0 with |t + w| ≥ c(1 + t) for all w ∈ C and
t ≥ 0, so on C × C × C the integrand of R_F is bounded by a constant times (1 + t)^(−3/2) and its
derivative, a linear map on ℂ³, by a constant times (1 + t)^(−5/2).
*Needs:* Tau Ceti `Complex.carlsonRF_def`, `Complex.carlsonRG_def`, `Complex.carlsonRJ_def`,
`Complex.carlsonRD_eq_integral`, `Complex.carlsonRC_eq_integral`,
`Complex.integrableOn_carlsonRF_integrand`, `Complex.integrableOn_carlsonRJ_integrand`,
`Complex.integrableOn_carlsonRGIntegrand`, `Complex.carlsonRF_comm_left`,
`Complex.carlsonRF_comm_right`, `Complex.carlsonRG_comm_left`, `Complex.carlsonRG_comm_right`;
Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `Complex.slitPlane`.

**Checks.**
- The slit plane cannot be enlarged across the negative real axis: as x tends to −2 from the upper
  and from the lower half-plane, R_C(x, 1) tends to π/(2√3) ∓ i artanh(√(2/3))/√3
  ≈ 0.90690 ∓ 0.66177 i, so no function holomorphic near −2 agrees with x ↦ R_C(x, 1) on the slit
  plane. A statement on ℂ ∖ {0} would be false.

### 3.2 The duplication theorem

Prove the duplication theorem (DLMF 19.26.18, which states it for nonnegative arguments) first
for real x, y, z ≥ 0, at most one of them 0: with λ = √(xy) + √(yz) + √(zx),
R_F(x, y, z) = R_F((x + λ)/4, (y + λ)/4, (z + λ)/4). Then prove `carlsonRF_duplication` on the
whole domain (Carlson 1995, §2, equations (8)–(11), with square roots of nonnegative real part):
for `x ∈ slitPlane ∪ {0}` and `y, z ∈ slitPlane`, with λ = √x√y + √y√z + √z√x and principal
square roots `w ^ (1/2 : ℂ)`, the same identity. By the symmetry of R_F and of λ this covers every
triple of the domain.

*Route.* The real case is DLMF's; Braams' `lean-codes` proves it for its R_F (Provenance). For the
extension, x + λ = (√x + √y)(√x + √z) is a product of two numbers of positive real part, hence in
the slit plane (also when x = 0), and likewise for y + λ and z + λ. The left side is holomorphic
in each variable separately by §3.1. On the right side one variable moves all three arguments at
once: with the other two variables fixed it is the jointly holomorphic R_F of §3.1 composed with a
map into the product of three slit planes, holomorphic by the holomorphy of the principal square
root on the slit plane, so it is holomorphic by the chain rule. The identity then propagates from
nonnegative reals one variable at a time by the identity theorem on the connected slit plane.
*Needs:* §3.1 (holomorphy in each variable, and the joint holomorphy of R_F); Tau Ceti
`Complex.carlsonRF`, `Complex.carlsonRF_comm_left`, `Complex.carlsonRF_comm_right`,
`Complex.carlsonRF_ofReal_mul`; Mathlib `Complex.slitPlane`, `Complex.cpow`,
`DifferentiableOn.comp`, `DifferentiableOn.analyticOnNhd`,
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.

**Checks.**
- x = 0, y = z = 1: λ = 1, and both R_F(0, 1, 1) = R_C(0, 1) and
  R_F(1/4, 1/2, 1/2) = R_C(1/4, 1/2) equal π/2 by Tau Ceti's `Complex.carlsonRC_ofReal_eq_arccos`.
  Dividing by 2 instead of 4 gives R_C(1/2, 1) = π√2/4 ≈ 1.1107.
- x = y = e^(3πi/4), z = 1: here √x√y = e^(3πi/4) while √(xy) = e^(−πi/4). With principal roots
  of each argument both sides are 0.8012606 − 0.8091666 i; with √(xy), √(yz), √(zx) in λ the
  right side becomes 1.2195926 − 0.5959131 i. The roots are of the arguments, not of their
  products.

### 3.3 The complete integral of the second kind as R_G

Prove `legendreEc_eq_carlsonRG` (DLMF 19.25.1): for `k ^ 2 < 1`, `(legendreEc k : ℂ)` equals
`2 * carlsonRG 0 (1 − k ^ 2) 1`, the Carlson value being taken at real arguments coerced to ℂ.
This completes the dictionary between the Legendre and the Carlson integrals, whose other entries
are Tau Ceti's.

*Route.* Tau Ceti has E(k) = R_F(0, k′², 1) − (k²/3) R_D(0, k′², 1)
(`TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`). It remains to prove
2R_G(0, y, 1) = R_F(0, y, 1) − ((1 − y)/3) R_D(0, y, 1) for y ∈ slitPlane, the zero-argument case
of the relation between R_G, R_F and R_D; on the integrals it is an integration by parts in t.
*Needs:* Tau Ceti `TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`,
`Complex.carlsonRG_def`, `Complex.carlsonRF_def`, `Complex.carlsonRD_eq_integral`,
`Complex.integrableOn_carlsonRGIntegrand`.

**Checks.**
- k = 0.6: 2R_G(0, 0.64, 1) = 1.4180834… = E(0.6). Putting k² in place of 1 − k² gives
  2R_G(0, 0.36, 1) = E(0.8) = 1.2763499….
- k = 0: R_G(0, 1, 1) = π/4, so the factor 2 is needed for E(0) = π/2.

### Examples

- K(1/√2) = R_F(0, 1/2, 1) = 1.8540747… and E(1/√2) = 2R_G(0, 1/2, 1) = 1.3506439….
- By homogeneity and the dictionary, R_F(0, 1, 2) = 2^(−1/2) R_F(0, 1/2, 1) = K(1/√2)/√2 =
  1.3110288…, which is ϖ/2. One duplication step gives λ = √2 and the closer triple
  (√2/4, (1 + √2)/4, (2 + √2)/4), at which R_F takes the same value 1.3110288….

### Dependencies

Tau Ceti's Carlson integrals with their integrability, symmetry, homogeneity, diagonal values and
the Legendre dictionary. Mathlib's parametric differentiation of integrals, the principal power
`Complex.cpow` and the identity theorem for analytic functions.

## Layer 4: the Jacobi elliptic functions of a real variable

Fix `k ^ 2 < 1` and write K = `legendreK k`.

### 4.1 The least period of sn

Prove that 4K is the least positive period of sn(·, k): sn is 4K-periodic (Tau Ceti
`TauCeti.Real.jacobiSn_periodic`), and for 0 < p < 4K the function sn(·, k) is not p-periodic
(DLMF Table 22.4.1). At k = 0 this is the period 2π of sin.

*Route.* The zeros of sn are exactly the points 2nK, n ∈ ℤ, because am(u) ∈ πℤ exactly when
u ∈ 2Kℤ (`TauCeti.Real.jacobiAm_add_two_mul_int_mul_legendreK`, the strict monotonicity of the
amplitude and `TauCeti.Real.jacobiAm_zero`). A period p > 0 sends the zero 0 to a zero, so
p = 2nK with n ≥ 1, and sn(K + 2K) = −1 ≠ 1 = sn(K) rules out odd n.
*Needs:* Tau Ceti `TauCeti.Real.jacobiSn_periodic`, `TauCeti.Real.jacobiSn_antiperiodic`,
`TauCeti.Real.jacobiSn_legendreK`, `TauCeti.Real.jacobiAm_add_two_mul_int_mul_legendreK`,
`TauCeti.Real.strictMono_jacobiAm`, `TauCeti.Real.jacobiAm_zero`, `TauCeti.Real.legendreK_pos`;
Mathlib `Function.Periodic`.

**Checks.**
- 2K is an antiperiod, not a period: sn(K + 2K) = −1 while sn(K) = 1. A claimed least period 2K
  fails here, as π fails for sin at k = 0.

### 4.2 The addition theorem

Prove `jacobiSn_add` (DLMF 22.8.1): for real u and v,
`sn(u + v) = (sn u cn v dn v + sn v cn u dn u) / (1 − k² sn²u sn²v)`, and its companions
(DLMF 22.8.2, 22.8.3):

```text
cn(u + v) = (cn u cn v − sn u dn u sn v dn v) / (1 − k² sn²u sn²v)
dn(u + v) = (dn u dn v − k² sn u cn u sn v cn v) / (1 − k² sn²u sn²v)
```

together with the positivity of the denominator 1 − k² sn²u sn²v, which is at least 1 − k² > 0.

*Route* (Euler's). Fix s and put v = s − u. The right side, as a function of u, has derivative 0
by Tau Ceti's derivatives of sn, cn and dn and the identities sn² + cn² = 1 and dn² + k² sn² = 1;
at u = 0 it equals sn(s). The same argument gives the companions.
*Needs:* Tau Ceti `TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.hasDerivAt_jacobiCn`,
`TauCeti.Real.hasDerivAt_jacobiDn`, `TauCeti.Real.jacobiSn_sq_add_jacobiCn_sq`,
`TauCeti.Real.jacobiDn_sq_add_sq_mul_jacobiSn_sq`, `TauCeti.Real.jacobiSn_zero`,
`TauCeti.Real.jacobiCn_zero`, `TauCeti.Real.jacobiDn_zero`; Mathlib `is_const_of_deriv_eq_zero`.

**Checks.**
- v = K gives sn(u + K) = cn u dn u/(1 − k² sn²u) = cn u/dn u. At k² = 1/2 and u = 0.4 both
  sn(u + K) and cn u/dn u are 0.9592196…; with 1 + k² sn²u sn²v in the denominator the formula
  would give 0.8270594….
- u = v = K gives sn(2K) = (0 + 0)/(1 − k²) = 0, in agreement with the antiperiod 2K.

### 4.3 The degeneration as k → 1⁻

Prove that for every real u, as k → 1⁻, `jacobiSn k u` tends to tanh u, `jacobiCn k u` to
1/cosh u and `jacobiDn k u` to 1/cosh u (DLMF Table 22.5.4). The values at k = 0 are Tau Ceti's
`TauCeti.Real.jacobiSn_zero_modulus`, `TauCeti.Real.jacobiCn_zero_modulus` and
`TauCeti.Real.jacobiDn_zero_modulus` (DLMF Table 22.5.3).

*Route.* For |φ| < π/2, F(φ, k) increases to F(φ, 1) = artanh(sin φ) as k → 1⁻ (monotone
convergence of the integrand, Tau Ceti `TauCeti.Real.monotoneOn_legendreF_modulus` and
`TauCeti.Real.legendreF_one_modulus`). Inverting, am(u, k) tends to arcsin(tanh u), the inverse of
φ ↦ artanh(sin φ) on (−π/2, π/2); then sin, cos and √(1 − k² sin²) of the limit are tanh u,
1/cosh u and 1/cosh u.
*Needs:* Tau Ceti `TauCeti.Real.legendreF_one_modulus`, `TauCeti.Real.monotoneOn_legendreF_modulus`,
`TauCeti.Real.legendreF_jacobiAm`, `TauCeti.Real.jacobiAm_eq_iff`, `TauCeti.Real.legendreF_neg`;
Mathlib `Real.artanh`, `Real.tanh`, `intervalIntegral.tendsto_integral_filter_of_dominated_convergence`.

**Checks.**
- At u = 1: tanh 1 = 0.7615942 and 1/cosh 1 = 0.6480543. At k = 0.999999 the three functions are
  0.7615943, 0.6480541 and 0.6480550; at k = 0.9 they are 0.77764, 0.62871 and 0.71426, so cn and
  dn, which differ for k < 1, merge only in the limit.

### 4.4 The nonlinear pendulum

Let ω > 0 and 0 < θ₀ < π, and set k = sin(θ₀/2) and θ(t) = 2 arcsin(k sn(ωt + K(k), k))
(DLMF 22.19.1–22.19.2, with time rescaled by ω). Prove:
- `pendulum_solution`: θ is C², θ″ = −ω² sin θ, θ(0) = θ₀ and θ′(0) = 0; θ is the only solution,
  in that every pair of functions (φ, ψ) differentiable on ℝ with φ′ = ψ, ψ′ = −ω² sin φ,
  φ(0) = θ₀ and ψ(0) = 0 has φ = θ (Mathlib's `ODE_solution_unique_univ` for the globally
  Lipschitz field (φ, ψ) ↦ (ψ, −ω² sin φ)); and the least positive period of θ is 4K(k)/ω;
- this period tends to 2π/ω as θ₀ → 0⁺ and to +∞ as θ₀ → π⁻.

*Route.* θ′ = 2kω cn dn/√(1 − k² sn²) = 2kω cn(ωt + K) since dn > 0, and
θ″ = −2kω² sn dn = −ω² sin θ, by sin θ = 2 sin(θ/2) cos(θ/2) = 2k sn · dn. The values at 0 are
sn K = 1 and cn K = 0. Since |k sn| ≤ k < 1 and arcsin is injective, θ is p-periodic exactly when
sn(·, k) is ωp-periodic, so §4.1 gives the least period. The limits are the continuity of K at 0
with K(0) = π/2, and K(k) → +∞ as k → 1⁻.
*Needs:* §4.1; Tau Ceti `TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.hasDerivAt_jacobiCn`,
`TauCeti.Real.hasDerivAt_jacobiDn`, `TauCeti.Real.jacobiDn_pos`,
`TauCeti.Real.jacobiDn_sq_add_sq_mul_jacobiSn_sq`, `TauCeti.Real.jacobiSn_legendreK`,
`TauCeti.Real.jacobiCn_legendreK`, `TauCeti.Real.jacobiSn_periodic`,
`TauCeti.Real.continuousOn_legendreK`, `TauCeti.Real.legendreK_zero`,
`TauCeti.Real.tendsto_legendreK_nhdsLT_one`; Mathlib `Real.arcsin`, `Real.arcsin_sin`,
`ODE_solution_unique_univ`.

**Checks.**
- θ₀ = π/2: k = 1/√2 and the period is 4K(1/√2)/ω = 7.41630/ω, which is 1.180341 times the
  small-oscillation period 2π/ω. Reading the modulus as the parameter (k = sin²(θ₀/2) = 1/2) would
  give 1.073182 times.
- Without the shift by K(k), θ(t) = 2 arcsin(k sn(ωt, k)) starts at the bottom, θ(0) = 0, with
  velocity 2kω: the shift is what makes θ(0) = θ₀ and θ′(0) = 0.

### Examples

- At k = 0 the addition theorem is the addition formula for sin, and sn(·, 0) = sin has least
  period 4K(0) = 2π.
- For θ₀ = π/3 the pendulum has k = 1/2 and period 4K(1/2)/ω = 6.74300/ω, 1.07318 times 2π/ω.

### Dependencies

Tau Ceti's real Jacobi functions with their derivatives, identities, antiperiods and values at
K, the Legendre integral at k = 1 and the monotonicity of F in the modulus, and the continuity and
divergence of K. Mathlib's uniqueness of ODE solutions, `Real.arcsin`, `Real.artanh` and
`Real.tanh`.

## Layer 5: geometry and the real period

### 5.1 The perimeter of an ellipse with the axes exchanged

With γ(t) = a cos t + (b sin t) i, Tau Ceti's `TauCeti.Green.Examples.eVariationOn_ellipse` gives
the length `eVariationOn γ (Set.Icc 0 (2π)) = ENNReal.ofReal (4 a · legendreEc √(1 − b²/a²))` for
0 < a and b² ≤ a² (DLMF 19.30.5). Prove the case of the exchanged axes: for 0 < b and a² ≤ b²,
`eVariationOn γ (Set.Icc 0 (2π)) = ENNReal.ofReal (4 b · legendreEc √(1 − a²/b²))`.

*Route.* γ(t) = i · conj(δ(π/2 − t)), where δ(s) = b cos s + (a sin s) i is the ellipse with the
semi-axes exchanged; the map
z ↦ i · conj z is an isometry of ℂ, so it preserves `eVariationOn`; the antitone reparametrization
t ↦ π/2 − t is `eVariationOn.comp_eq_of_antitoneOn`; and 2π-periodicity with
`eVariationOn.Icc_add_Icc` moves the window [−3π/2, π/2] to [0, 2π].
*Needs:* Tau Ceti `TauCeti.Green.Examples.ellipse`, `TauCeti.Green.Examples.eVariationOn_ellipse`;
Mathlib `eVariationOn`, `eVariationOn.comp_eq_of_antitoneOn`, `eVariationOn.Icc_add_Icc`.

**Checks.**
- a = 1, b = 2: the length is 8 E(√3/2) = 9.6884482…, the same as for a = 2, b = 1, as it must be.
  The formula of the case b² ≤ a², applied to a = 1, b = 2, would give 4 E(0) = 2π ≈ 6.2832,
  because Mathlib's square root of the negative 1 − b²/a² is 0: the exchanged case is a separate
  statement.

### 5.2 Cubic integrals

Let e₃ < e₂ < e₁ be real, k = √((e₂ − e₃)/(e₁ − e₃)), D(x) = 4(x − e₁)(x − e₂)(x − e₃) and
κ = K(k). Prove (Byrd and Friedman, formulas 236.00 and 239.00):
- the integral over (e₁, ∞) of D(x)^(−1/2) is κ/√(e₁ − e₃);
- the integral over (e₃, e₂) of D(x)^(−1/2) is κ/√(e₁ − e₃).

Let e₁, a, b be real with b ≠ 0, A = √((e₁ − a)² + b²), k = √((A + a − e₁)/(2A)) and
D(x) = 4(x − e₁)((x − a)² + b²). Prove that the integral over (e₁, ∞) of D(x)^(−1/2) is K(k)/√A.

All three are stated as `lintegral`s of `ENNReal.ofReal (√(D x))⁻¹` over the open interval, equal
to `ENNReal.ofReal` of the right side, so that finiteness is part of the statement.

*Route.* The substitutions x = e₃ + (e₁ − e₃)/sin²φ on (e₁, ∞) and x = e₃ + (e₂ − e₃) sin²φ on
(e₃, e₂), φ ∈ (0, π/2), turn the first two integrals into κ/√(e₁ − e₃). The substitution
cos φ = (A − (x − e₁))/(A + (x − e₁)), φ ∈ (0, π), turns the third into F(π, k)/(2√A) = K(k)/√A.
*Needs:* Tau Ceti `TauCeti.Real.legendreF_def`, `TauCeti.Real.legendreF_int_mul_pi`,
`TauCeti.Real.legendreK_def`, `TauCeti.Real.intervalIntegrable_legendreF_integrand`; Mathlib
`MeasureTheory.lintegral`, `MeasureTheory.integral_comp_mul_deriv_Ioi`,
`intervalIntegral.integral_comp_mul_deriv`.

**Checks.**
- e = (1, 0, −1): k = 1/√2 and both integrals are K(1/√2)/√2 = 1.3110288…, which is half the
  lemniscate constant, ϖ/2, by Tau Ceti's `TauCeti.Real.lemniscateConstant_eq_sqrt_two_mul_legendreK`.
- e₁ = 2, a = −1, b = 3: A = 3√2, k = 0.3826834…, and the integral is K(k)/√A = 0.7930927…;
  exchanging k and k′ (k² = (A − a + e₁)/(2A)) gives 1.1652261….

### 5.3 The real period

Let `W : WeierstrassCurve ℝ`.
- If `∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * (x - e₂) * (x - e₃)` with e₃ < e₂ < e₁, prove
  `realPeriod_eq_of_three_real_roots`, `W.realPeriod = 4 legendreK k / √(e₁ − e₃)` with
  k = √((e₂ − e₃)/(e₁ − e₃)), and `realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots`,
  `W.realPeriod = 2π / agm √(e₁ − e₃) √(e₁ − e₂)`.
- If `∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * ((x - a) ^ 2 + b ^ 2)` with b ≠ 0, and A and k are as
  in §5.2, prove `realPeriod_eq_of_one_real_root`, `W.realPeriod = 2 legendreK k / √A`, and
  `realPeriod_eq_two_mul_pi_div_agm_of_one_real_root`,
  `W.realPeriod = 2π / agm (2√A) √(2A + 2(e₁ − a))`.

The AGM arguments are reals coerced through `Real.toNNReal` (Convention 5). These pin the period
of the Birch–Swinnerton-Dyer quotient to an AGM that converges quadratically (Cremona §3.7).

*Route.* The set where `Ψ₂Sq` is positive is (e₃, e₂) ∪ (e₁, ∞) in the first case and (e₁, ∞) in
the second, and §5.2 evaluates the integral of `WeierstrassCurve.realPeriodLIntegral` over it,
which is finite. For the AGM forms, Tau Ceti's `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`
with k′ = √((e₁ − e₂)/(e₁ − e₃)), respectively k′² = (A + e₁ − a)/(2A), and the homogeneity
`NNReal.agm_mul_distrib` give 4K/√(e₁ − e₃) = 2π/M(√(e₁ − e₃), √(e₁ − e₂)) and
2K/√A = π/M(√A, √((A + e₁ − a)/2)) = 2π/M(2√A, √(2A + 2(e₁ − a))).
*Needs:* §5.2; Tau Ceti `WeierstrassCurve.realPeriod_def`, `WeierstrassCurve.realPeriodLIntegral_def`,
`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`; Mathlib `WeierstrassCurve.Ψ₂Sq`, `NNReal.agm`,
`NNReal.agm_mul_distrib`.

**Checks.**
- y² = x³ − x, for which `Ψ₂Sq` is 4x³ − 4x = 4(x − 1)x(x + 1): the real period is
  4K(1/√2)/√2 = 2ϖ = 5.2441151086…, and 2π/M(√2, 1) gives the same number. Counting only the
  component over (e₁, ∞) would give ϖ, half of it.
- y² = x³ + 1, for which `Ψ₂Sq` is 4x³ + 4 = 4(x + 1)((x − 1/2)² + 3/4): e₁ = −1, a = 1/2,
  b = √3/2, A = √3, k² = 1/2 + √3/4 (k = sin 75°), and the real period is
  2K(sin 75°)/3^(1/4) = 4.2065463160…, which is also 2π/M(2 · 3^(1/4), √(2√3 − 3)). Exchanging k
  and k′ would give 2.4286506….

### Examples

- e = (3, 1, −2): k² = 3/5, and the real period is 4K(√(3/5))/√5 = 3.4874928… =
  2π/M(√5, √2).
- The ellipse with semi-axes 2 and 1 has perimeter 8E(√3/2) = 9.6884482…, and the circle of radius
  r has 4rE(0) = 2πr from either case of §5.1.

### Dependencies

Tau Ceti: the ellipse and its length for b² ≤ a², the Legendre integrals with their quasi-period
in φ, Gauss's AGM evaluation of K, and the real period with its defining integral. Mathlib:
`eVariationOn` and its reparametrization lemmas, Lebesgue integrals and changes of variables,
`WeierstrassCurve.Ψ₂Sq`, and `NNReal.agm` with its homogeneity.

## Downstream consumers

- [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) takes DLMF
  15.9.24–15.9.25 for real k with k² < 1 from Tau Ceti's
  `TauCeti.Real.legendreK_eq_ordinaryHypergeometric` and
  `TauCeti.Real.legendreEc_eq_ordinaryHypergeometric`.
- [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) Layer 6 (§§6.3–6.4) uses Tau Ceti's
  `TauCeti.Real.legendreK` with its AGM, hypergeometric and Carlson forms.

## Provenance

This section is secondary; it maps the roadmap to an existing formalization and prescribes
nothing. B. Braams' [`lean-codes`](https://github.com/bjbraams/lean-codes) (Apache-2.0) formalizes
B. C. Carlson's *Special Functions of Applied Mathematics* on top of Mathlib and Tau Ceti. Its
`Carlson/Elliptic/` directory covers much of the mathematics of this roadmap: the Legendre
integrals, R_F and the other symmetric integrals, Landen's transformation, the duplication
theorem, Euler's addition theorem, the AGM evaluation of the complete integral of the second kind,
the pendulum and ellipse integrals, and a complex Jacobi sn built as a Schwarz–Christoffel map.
Its foundation is Carlson's general R-function, a Dirichlet average over the standard simplex;
that machinery is much larger than this roadmap needs and is not part of it.

This roadmap specifies the mathematics intrinsically. It adopts that formalization's conventions
(modulus k; `legendreF`, `legendreE`, `legendrePi`, `legendreK`, `legendreEc` with argument order
`(φ, k)` and `(φ, k, α²)`), so the two developments stay interoperable. Its author has agreed to
this use of it (Lean Zulip, channel Tau Ceti, topic "Getting started: roadmaps"). Implementers
treat `lean-codes` as the first source to port from, with attribution, before proving anything
from scratch; its proofs rest on Carlson's general R-function, so a port re-bases them on Tau
Ceti's direct integral definitions (Convention 4) rather than copying that layer. The table
records counterparts in `lean-codes` (files under `Carlson/Elliptic/`, at commit `2b8cba1`) of the
material of this roadmap, both the targets above and the library it rests on.

| Material | Counterpart in `lean-codes` | Not covered there |
|---|---|---|
| Legendre integrals | `LegendreStandard`, `LegendreThird`, `ZeroVariable` | |
| Complete integrals in the modulus | `CompleteK` (imaginary modulus, Landen for K) | derivatives in k, Legendre's differential equations, the ₂F₁ series |
| Singularity at k = 1, Legendre's relation (Layer 1) | `Asymptotic` (logarithmic asymptotics in Carlson form) | Legendre's relation |
| AGM (Layer 2) | `AGMSecondKind`, `LandenAlgorithm`, `Landen` | Gauss's formula for K through the AGM integral, Brent–Salamin |
| Special values | lemniscate arc-length exercises in `ArcLengthExercises` | K(1/√2), E(1/√2), the lemniscate constant |
| Carlson integrals (Layer 3) | `RF`, `Standard`, `Addition`, `ReductionTables` | |
| Real Jacobi functions (Layer 4) | `Inversion`; a complex sn via `SchwarzChristoffel` | real am, sn, cn, dn and the explicit pendulum solution |
| Geometry and the real period (Layer 5) | `Applications` (pendulum, ellipse) | the AGM formula for `WeierstrassCurve.realPeriod` |

## Scope and ownership

**This roadmap owns** real-variable statements about the Legendre integrals, the AGM and the
Jacobi functions of a real argument, plus Carlson's integrals on slit-plane nodes. Its targets are
Layers 1–5 above.

**Already in the library and consumed here.** The pinned Tau Ceti proves the basic theory these
targets rest on, and the README does not plan it again; the declarations, with their hypotheses,
are in the supplier contracts below.
- *The Legendre integrals*: their definitions; continuity, positivity and explicit bounds of the
  integrands and interval-integrability on every interval; positivity of F, E, Π, K, E(k) and
  Π(k, α²); the algebraic forms for |φ| ≤ π/2 with integrability at the improper endpoint; oddness
  in φ, evenness in k and quasi-periodicity F(φ + nπ) = F(φ) + 2nK (and likewise for E and Π); the
  derivatives in φ, strict monotonicity, and F(·, k) as an order isomorphism of ℝ; the degenerate
  moduli k = 0 and k = 1, with F(φ, 1) = artanh(sin φ) for |φ| < π/2, E(φ, 1) = sin φ for
  |φ| ≤ π/2, E(1) = 1 and K(k) → +∞ as k → 1⁻; the third-kind reductions Π(φ, k, 0) = F(φ, k),
  Π(φ, 0, α²) = arctan(√(1 − α²) tan φ)/√(1 − α²) and Π(φ, k, k²) in terms of E; monotonicity in k,
  E(k) ≤ π/2 ≤ K(k) with equality only at k = 0; and the imaginary modulus.
- *The complete integrals in the modulus*: continuity, the derivatives of K and E (DLMF 19.4.1)
  and their second derivatives, Legendre's differential equations, the hypergeometric series
  (DLMF 19.5.1, 19.5.2), analyticity on (−1, 1), (1 − k²)K(k) → 0 as k → 1⁻, and Legendre's
  relation (DLMF 19.7.1).
- *The AGM*: the quadratic bound for one AGM step and for the AGM sequences, the AGM integral
  `TauCeti.agmIntegral` with its integrability, symmetry, invariance under an AGM step and
  evaluation π/(2M(a, b)) (the name and statement of Mathlib's proposal mathlib4#34397, which
  Tau Ceti follows so that adopting Mathlib's version is a deletion), its trigonometric form,
  Gauss's theorem K(k) = π/(2M(1, k′)), and Landen's transformations of K and E in descending
  (DLMF 19.8.12) and ascending form.
- *Special values*: K(1/√2) = Γ(1/4)²/(4√π), E(1/√2) = K(1/√2)/2 + π/(4K(1/√2)), and the
  lemniscate constant with ϖ = √2 K(1/√2), ϖ = Γ(1/4)²/(2√(2π)) and Gauss's identity
  ϖ = π/M(1, √2).
- *Carlson's integrals*: their definitions, absolute convergence on the domain, positivity at
  positive real arguments, holomorphy of R_J in its fourth argument, symmetry, homogeneity, the
  diagonal values, the elementary R_C (DLMF 19.2.19, 19.2.20) and the Legendre dictionary
  (DLMF 19.25.5, 19.25.7, 19.25.14) except the R_G form of E(k), which is §3.3.
- *The real Jacobi functions*: the amplitude as the inverse of F, its oddness,
  am(u + 2K) = am(u) + π, am(K) = π/2, am′ = dn and am(·, 0) = id; sn² + cn² = 1,
  dn² + k² sn² = 1, dn > 0 and the parities; the derivatives of sn, cn, dn and
  (sn′)² = (1 − sn²)(1 − k² sn²); the periods 4K of sn and cn and 2K of dn, the antiperiod 2K of
  sn and cn, and the values at K; the degeneration at k = 0.
- *The ellipse*: its length 4aE(√(1 − b²/a²)) for 0 < a and b² ≤ a², the case 0 < b ≤ a and more.
- *The real period*: `WeierstrassCurve.realPeriod`, its defining integral, finiteness and
  positivity.

**Owned elsewhere.**
- [EllipticCurves](../EllipticCurves/README.md) Layer 7 owns the real period of the global minimal
  model and the Birch–Swinnerton-Dyer quotient that uses it; the real period itself, its
  definition by an explicit integral, finiteness, positivity and behaviour under change of
  variables are Tau Ceti's at the pin. Layer 5 here evaluates that integral by K and by the AGM. It
  consumes the definition and changes nothing in it.
- *Lattice functions*: ℘ beyond Mathlib, the Weierstrass ζ and σ functions, the quasi-periods, the
  lattice form of Legendre's relation (η₁ω₂ − η₂ω₁ = 2πi) and the uniformization ℂ/Λ ≅ E(ℂ)
  belong to the lattice roadmaps; on main, [ModularCurvesPartII](../ModularCurvesPartII/README.md)
  states the uniformization (§1.1) and σ, the quasi-periods and the lattice Legendre relation
  (§1.4a). Nothing here uses them. Legendre's relation here is the identity between the real
  functions K and E; identifying it with the lattice relation is a statement about lattices and
  belongs there.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) (Layer 6) owns Schwarz–Christoffel
  maps. The map of the upper half-plane onto a rectangle is an incomplete integral of the first
  kind. This roadmap constructs no conformal maps.
- [DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)
  (Layer 3) owns transcendence statements. Values such as K(1/√2) and ϖ are computed here, and
  their transcendence is not.
- [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) Layer 6 owns the modular function λ,
  the nome q = exp(−πK′/K) and the theta-function expressions for K.

**The boundary in one sentence.** A real-variable statement about the Legendre or Carlson
integrals, the AGM, or a Jacobi function of a real argument is here; a statement about a lattice
in ℂ or a meromorphic function on ℂ/Λ is in the lattice roadmaps; a statement about a Weierstrass
equation over a field is in EllipticCurves.

**Outside this roadmap.** The following are not targets here, and contributors do not attempt them
under this roadmap: the Jacobi functions of a complex variable as elliptic functions with periods
4K and 2iK′; their identification with ℘ for the rectangular lattice,
℘(z) = e₃ + (e₁ − e₃)/sn²(√(e₁ − e₃) z); the analytic continuation of K and E in k² to
ℂ ∖ [1, ∞); principal-value integrals of the third kind; and incomplete integrals of complex
amplitude. The complex Jacobi functions are left by
[SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) (Downstream consumers) to a roadmap
built on its theta quotients (§6.6), and their identification with ℘ needs the lattice functions
as well. The continuation of K and E is (π/2) F(½, ½; 1; k²) and (π/2) F(−½, ½; 1; k²) with the
principal Gauss function of
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md), the complex K that
SpecialFunctionsTheta §6.4 uses. Carlson's general theory is outside this roadmap too: the
R-function R_t(b; z) as a Dirichlet average over the standard simplex, with the measure theory on
the simplex and the multivariable holomorphy it needs, the identification of the integral
definitions here as special cases (for example
`R_F(x, y, z) = R_{−1/2}(1/2, 1/2, 1/2; x, y, z)`), and the transport of the reduction tables and
contiguous relations to them. `lean-codes` contains a full formalization of this theory
(Provenance), so it would be a port, a roadmap of its own.

**Former milestone numbering.** A citation of this roadmap by Milestones 1–8 refers to its former
numbering. The table gives where each item now is: a section above, or a group of the Tau Ceti
supplier contracts below.

| Former numbering | Now |
|---|---|
| Milestone 1 (the Legendre integrals) | Tau Ceti: *Legendre integrals*, *Algebraic forms*, *Elementary values*, *Monotonicity in the modulus*, *Imaginary modulus* |
| Milestone 2 (the complete integrals in the modulus) | Tau Ceti: *The modulus*, *Hypergeometric series* |
| Milestone 3 (k = 1 and Legendre's relation) | 3.1: §1.1 and Tau Ceti's `TauCeti.Real.tendsto_one_sub_sq_mul_legendreK_nhdsLT_one`; 3.2: Tau Ceti's `TauCeti.Real.legendre_relation` |
| Milestone 4 (the AGM) | 4.1–4.5: Tau Ceti: *Quadratic convergence*, *The AGM integral*, *Gauss and Landen*; 4.6: §2.1; 4.7: §2.2 |
| Milestone 5 (special values) | Tau Ceti: *Special values* |
| Milestone 6 (Carlson's integrals) | 6.1: §3.1 and Tau Ceti; 6.2–6.4: Tau Ceti; 6.5: §3.2; 6.6: Tau Ceti's *Legendre dictionary* and §3.3 |
| Milestone 7 (the Jacobi functions) | 7.1–7.3: Tau Ceti; 7.4: Tau Ceti and §4.1; 7.5: §4.2; 7.6: Tau Ceti (k = 0) and §4.3; 7.7: §4.4 |
| Milestone 8 (geometry and the real period) | 8.1: Tau Ceti (b² ≤ a²) and §5.1; 8.2–8.3: §5.2; 8.4: §5.3 |

## Exact supplier contracts

### From Mathlib

- *The AGM* (`Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`, namespace
  `NNReal`): `agm`, `agmSequences` (its `n`-th term is the pair (geometric mean, arithmetic mean)
  after n + 1 steps; `agmSequences_zero`, `agmSequences_succ'`), `agm_comm`, `agm_self`,
  `agm_mul_distrib`, `agm_eq_agm_gm_am`, `agm_pos`, `min_le_agm`, `agm_le_max`,
  `agmSequences_fst_monotone`, `agmSequences_snd_antitone`, `agmSequences_fst_le_snd`,
  `tendsto_agmSequences_fst_agm`, `tendsto_agmSequences_snd_agm` and
  `tendsto_dist_agmSequences_atTop_zero`. Mathlib proves only the halving bound on `dist`; the
  quadratic bound is Tau Ceti's.
- *Hypergeometric series*: `ordinaryHypergeometric` (notation `₂F₁`),
  `ordinaryHypergeometric_eq_tsum`, `ordinaryHypergeometricSeries_radius_eq_one`.
- *Gamma and Beta*: `Real.Gamma`, `Real.Gamma_one_half_eq`, `Complex.betaIntegral`,
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`.
- *Integration*: `intervalIntegral` with `intervalIntegral.integral_hasDerivAt_right` and
  `intervalIntegral.integral_comp_mul_deriv`; improper integrals on `Set.Ioi`
  (`integrableOn_Ioi_rpow_of_lt`, `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`,
  `MeasureTheory.integral_comp_mul_deriv_Ioi`); parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
  `hasFDerivAt_integral_of_dominated_of_fderiv_le`); dominated convergence
  (`intervalIntegral.tendsto_integral_filter_of_dominated_convergence`); `MeasureTheory.lintegral`.
- *Elementary functions*: `Real.arcsin` with `Real.arcsin_sin`, `Real.arctan`, `Real.artanh`,
  `Real.arcosh`, `Real.arsinh`, `Real.tanh`, `Complex.slitPlane`, `Complex.cpow`.
- *Analytic functions*: `AnalyticOnNhd`, `DifferentiableOn`, `DifferentiableOn.comp`,
  `DifferentiableOn.analyticOnNhd`, `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`,
  `is_const_of_deriv_eq_zero`.
- *ODEs*: `ODE_solution_unique_univ` and `ODE_solution_unique_of_mem_Icc`.
- *Arc length*: `eVariationOn`, the length of a curve, with `eVariationOn.Icc_add_Icc` and
  `eVariationOn.comp_eq_of_antitoneOn`.
- *Weierstrass curves*: `WeierstrassCurve` and `WeierstrassCurve.Ψ₂Sq`.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved at the pin.

- *Legendre integrals* (`Analysis/SpecialFunctions/EllipticIntegral/Legendre.lean`, namespace
  `TauCeti.Real`): `legendreF`, `legendreE`, `legendrePi`, `legendreK`, `legendreEc`, `legendrePic`
  with `legendreF_def`, `legendreE_def`, `legendrePi_def`, `legendreK_def`, `legendreEc_def`,
  `legendrePic_def` (Convention 2). Integrands, for `k ^ 2 < 1` and `α2 < 1` where needed:
  `continuous_legendreF_integrand`, `one_le_legendreF_integrand`, `legendreF_integrand_le` (the
  integrand of F lies between 1 and `(1 - k ^ 2) ^ (-1/2)`); `continuous_legendreE_integrand`,
  `legendreE_integrand_pos`, `le_legendreE_integrand`, `legendreE_integrand_le_one` (between
  `(1 - k ^ 2) ^ (1/2)` and 1); `continuous_legendrePi_integrand`, `legendrePi_integrand_pos`,
  `inv_max_le_legendrePi_integrand`, `legendrePi_integrand_le` (between `(max 1 (1 - α2))⁻¹` and
  `(min 1 (1 - α2))⁻¹ * (1 - k ^ 2) ^ (-1/2)`); `intervalIntegrable_legendreF_integrand`,
  `intervalIntegrable_legendreE_integrand`, `intervalIntegrable_legendrePi_integrand` (every
  interval). Positivity: `legendreF_pos` (`k ^ 2 < 1`, `0 < φ`), `legendreE_pos` (`0 < φ`),
  `legendrePi_pos`, `legendreK_pos` (`k ^ 2 < 1`), `legendreEc_pos` (every k), `legendrePic_pos`;
  with `self_le_legendreF`, `legendreF_le_div_sqrt`, `legendreK_le_pi_div_two_div_sqrt`.
  Symmetries: `legendreF_neg`, `legendreE_neg`, `legendrePi_neg`, `legendreF_neg_modulus`,
  `legendreE_neg_modulus`, `legendrePi_neg_modulus`, `legendreK_neg`, `legendreEc_neg`,
  `legendrePic_neg_modulus` (no hypotheses). Quasi-periodicity: `legendreF_add_pi`,
  `legendreF_add_int_mul_pi`, `legendreF_int_mul_pi` (`k ^ 2 < 1`, `n : ℤ`), `legendreE_add_pi`,
  `legendreE_add_int_mul_pi`, `legendreE_int_mul_pi` (no hypotheses), `legendrePi_add_pi`,
  `legendrePi_add_int_mul_pi`, `legendrePi_int_mul_pi` (`k ^ 2 < 1`, `α2 < 1`). In φ:
  `hasDerivAt_legendreF` (`k ^ 2 < 1`), `hasDerivAt_legendreE` (every k), `hasDerivAt_legendrePi`
  (`k ^ 2 < 1`, `α2 < 1`), `continuous_legendreF`, `continuous_legendreE`, `continuous_legendrePi`,
  `strictMono_legendreF` (`k ^ 2 < 1`), `strictMono_legendreE` (`k ^ 2 ≤ 1`),
  `strictMono_legendrePi`, `tendsto_legendreF_atTop`, `tendsto_legendreF_atBot`, and the order
  isomorphism `legendreFOrderIso hk : ℝ ≃o ℝ` with `coe_legendreFOrderIso`. Values:
  `legendreF_zero_modulus`, `legendreE_zero_modulus`, `legendreK_zero`, `legendreEc_zero`,
  `legendrePi_zero_characteristic`, `legendrePic_zero_characteristic`, and the comparisons
  `legendreE_eq_legendreF_sub`, `legendrePi_eq_legendreF_add`.
- *Algebraic forms* (`…/EllipticIntegral/Algebraic.lean`): `legendreF_eq_integral_algebraic`,
  `legendreE_eq_integral_algebraic`, `legendrePi_eq_integral_algebraic` (`|φ| ≤ π/2`, every k and
  α2), `legendreK_eq_integral_algebraic`, `legendreEc_eq_integral_algebraic`,
  `legendrePic_eq_integral_algebraic`, and integrability of the algebraic integrands on [−1, 1]:
  `integrableOn_legendreF_algebraic_integrand` (`k ^ 2 < 1`),
  `integrableOn_legendreE_algebraic_integrand`, `integrableOn_legendrePi_algebraic_integrand`
  (`k ^ 2 < 1`, `α2 < 1`).
- *Elementary values* (`…/EllipticIntegral/Elementary.lean`): `legendreF_one_modulus`
  (`|φ| < π/2`: F(φ, 1) = artanh(sin φ)), `legendreE_one_modulus` (`|φ| ≤ π/2`: E(φ, 1) = sin φ),
  `legendreEc_one`, `tendsto_legendreK_nhdsLT_one` (`Tendsto legendreK (𝓝[<] 1) atTop`),
  `legendrePi_zero_modulus` (`α2 < 1`, `|φ| < π/2`), `legendrePic_zero_modulus`,
  `legendrePi_modulus_sq` (`k ^ 2 < 1`, every φ; DLMF 19.6.13), `legendrePic_modulus_sq`.
- *Monotonicity in the modulus* (`…/EllipticIntegral/Monotonicity.lean`):
  `monotoneOn_legendreF_modulus` (`0 ≤ φ`, on [0, 1)), `antitoneOn_legendreE_modulus` (`0 ≤ φ`, on
  [0, ∞)), `legendreF_le_of_sq_le`, `legendreE_le_of_sq_le`, `legendreF_lt_of_sq_lt`,
  `legendreE_lt_of_sq_lt`, `legendreK_lt_of_sq_lt`, `legendreEc_lt_of_sq_lt`,
  `strictMonoOn_legendreK` (on [0, 1)), `strictAntiOn_legendreEc` (on [0, ∞)),
  `pi_div_two_le_legendreK` (`k ^ 2 < 1`), `legendreEc_le_pi_div_two`,
  `legendreK_eq_pi_div_two_iff` (`k ^ 2 < 1`: K(k) = π/2 iff k = 0),
  `legendreEc_eq_pi_div_two_iff`.
- *Imaginary modulus* (`…/EllipticIntegral/ImaginaryModulus.lean`):
  `integral_one_add_mul_sin_sq_rpow_neg_half_eq_legendreK_div_sqrt` (every real c; DLMF 19.7.5,
  complete case) and `intervalIntegrable_one_add_mul_sin_sq_rpow_neg_half`.
- *The modulus* (`…/EllipticIntegral/ModulusDerivative.lean`): `continuousOn_legendreF_modulus`,
  `continuous_legendreE_modulus`, `continuousOn_legendrePi_modulus` (`α2 < 1`),
  `continuousOn_legendreK` (on `{k | k ^ 2 < 1}`), `continuous_legendreEc` (everywhere, so also at
  ±1), `continuousOn_legendrePic` (`α2 < 1`); `hasDerivAt_legendreK` and `hasDerivAt_legendreEc`
  (`k ≠ 0`, `k ^ 2 < 1`; DLMF 19.4.1), `hasDerivAt_legendreK_zero`, `hasDerivAt_legendreEc_zero`
  (derivative 0 at k = 0), `deriv_legendreK`, `deriv_legendreEc`, `deriv_legendreK_zero`,
  `deriv_legendreEc_zero`, `hasDerivAt_deriv_legendreK`, `hasDerivAt_deriv_legendreEc` (second
  derivatives, `k ≠ 0`, `k ^ 2 < 1`), `legendreK_differential_equation` and
  `legendreEc_differential_equation` (`k ^ 2 < 1`, with `deriv` and `deriv^[2]`), and the
  incomplete `hasDerivAt_legendreF_modulus`, `hasDerivAt_legendreE_modulus`.
- *Hypergeometric series* (`…/EllipticIntegral/Hypergeometric.lean`):
  `legendreK_eq_ordinaryHypergeometric`, `legendreEc_eq_ordinaryHypergeometric` (`k ^ 2 < 1`,
  Mathlib's `₂F₁` over ℝ), `analyticOnNhd_legendreK`, `analyticOnNhd_legendreEc` (on (−1, 1)),
  which give twice-differentiability of K and E on (−1, 1).
- *At k = 1 and Legendre's relation*: `tendsto_one_sub_sq_mul_legendreK_nhdsLT_one`
  (`…/EllipticIntegral/Asymptotic.lean`); `legendre_relation` (`0 < k < 1`; DLMF 19.7.1) and
  `legendreEc_one_div_sqrt_two` (`…/EllipticIntegral/Relation.lean`).
- *The AGM integral* (`…/EllipticIntegral/AGM.lean`, namespace `TauCeti`): `agmIntegral`, with
  `agmIntegral a b = ∫ x in Set.Ioi 0, (√((x ^ 2 + a ^ 2) * (x ^ 2 + b ^ 2)))⁻¹`
  (`agmIntegral_def`); `integrableOn_agmIntegrand_Ioi_of_pos` (`0 < a`, `0 < b`),
  `agmIntegral_comm`, `agmIntegral_eq_agmIntegral_gm_am` (`0 ≤ a`, `0 ≤ b`),
  `agmIntegral_eq_agmIntegral_agmSequences`, `agmIntegral_eq_pi_div_two_div_agm`
  (`a b : ℝ≥0`: `agmIntegral a b = π / 2 / agm a b`), `agmIntegral_pos`, `agmIntegral_self`,
  `agmIntegral_mul_left`, `continuousOn_agmIntegral`. Its trigonometric form
  (`…/EllipticIntegral/Trigonometric.lean`): `integral_rpow_cos_sq_add_sin_sq_eq_integral_Ioi`
  (`a ≠ 0`, `b ≠ 0`), whose right side is `agmIntegral a b`.
- *Quadratic convergence* (`Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`):
  `Real.half_add_sub_sqrt_mul_le` (`0 < y ≤ x`: (x + y)/2 − √(xy) ≤ (x − y)²/(8y)),
  `NNReal.half_add_sub_sqrt_mul_le`, and `NNReal.agmSequences_snd_sub_fst_le` (`0 < y ≤ x`:
  `(agmSequences x y n).2 - (agmSequences x y n).1 ≤ 8 * y * ((x - y) / (8 * y)) ^ (2 ^ (n + 1))`).
- *Gauss and Landen* (`…/EllipticIntegral/Gauss.lean`, `…/EllipticIntegral/Landen.lean`,
  namespace `TauCeti.Real`): `legendreK_eq_agmIntegral` and `legendreK_eq_pi_div_two_mul_agm`
  (`k ^ 2 < 1`: `legendreK k = π / (2 * agm 1 (√(1 - k ^ 2)).toNNReal)`);
  `legendreK_eq_one_add_mul_legendreK` and `legendreEc_eq_one_add_mul_legendreEc` (`k ^ 2 < 1`;
  descending Landen with k₁ = (1 − k′)/(1 + k′), DLMF 19.8.12);
  `legendreK_two_mul_sqrt_div_one_add` and `legendreEc_two_mul_sqrt_div_one_add` (`0 ≤ k < 1`;
  the ascending forms, K and E at 2√k/(1 + k)).
- *Special values* (`…/EllipticIntegral/Lemniscate.lean`): `lemniscateConstant` with
  `lemniscateConstant_def` (Convention 7), `lemniscateConstant_pos`, `lemniscateConstant_eq_beta`,
  `legendreK_one_div_sqrt_two`, `lemniscateConstant_eq_sqrt_two_mul_legendreK`,
  `lemniscateConstant_eq_Gamma`, `lemniscateConstant_eq_pi_div_agm`
  (`lemniscateConstant = π / NNReal.agm 1 (NNReal.sqrt 2)`).
- *Carlson's integrals* (`…/EllipticIntegral/Carlson/Basic.lean`, `…/Carlson/RJ.lean`,
  `…/Carlson/RG.lean`, `…/Carlson/FourthArgument.lean`, namespace `Complex`): `carlsonRF`,
  `carlsonRC`, `carlsonRJ`, `carlsonRD`, `carlsonRG` (with `carlsonRGIntegrand`) and
  `carlsonRF_def`, `carlsonRC_def`, `carlsonRJ_def`, `carlsonRD_def`, `carlsonRG_def`,
  `carlsonRC_eq_integral`, `carlsonRD_eq_integral` (Convention 4); convergence
  `integrableOn_carlsonRF_integrand`, `integrableOn_carlsonRJ_integrand`,
  `integrableOn_carlsonRGIntegrand` (`x ∈ slitPlane ∪ {0}`, the other arguments in `slitPlane`);
  symmetry `carlsonRF_comm_left`, `carlsonRF_comm_right`, `carlsonRG_comm_left`,
  `carlsonRG_comm_right`, `carlsonRJ_comm_left`, `carlsonRJ_comm_right`, `carlsonRD_comm`;
  homogeneity `carlsonRF_ofReal_mul`, `carlsonRJ_ofReal_mul`, `carlsonRD_ofReal_mul`,
  `carlsonRG_ofReal_mul` (real `0 < l`, every complex argument; exponents −1/2, −3/2, −3/2, 1/2);
  diagonal values `carlsonRF_self`, `carlsonRC_self`, `carlsonRJ_self`, `carlsonRD_self`,
  `carlsonRG_self` (`x ∈ slitPlane`); positivity `carlsonRF_pos`, `carlsonRJ_pos`,
  `carlsonRD_pos`, `carlsonRG_pos` (real `0 ≤ x`, `0 < y`, `0 < z`, and `0 < p`, in `ComplexOrder`;
  for R_C through `carlsonRC_def`); the elementary R_C `carlsonRC_ofReal_eq_arccos`
  (`0 ≤ x < y`) and `carlsonRC_ofReal_eq_arcosh` (`0 < y < x`); holomorphy of R_J in its fourth
  argument `hasDerivAt_carlsonRJ_fourth`, `differentiableOn_carlsonRJ_fourth`,
  `analyticOnNhd_carlsonRJ_fourth`.
- *The Legendre dictionary* (`…/EllipticIntegral/Carlson/Legendre.lean`, namespace
  `TauCeti.Real`), identities in ℂ at real arguments: `ofReal_legendreF_eq_carlsonRF`,
  `ofReal_legendreE_eq_carlsonRF_sub_carlsonRD` (`|φ| ≤ π/2`, `k ^ 2 * sin φ ^ 2 < 1`),
  `ofReal_legendrePi_eq_carlsonRF_add_carlsonRJ` (also `α2 * sin φ ^ 2 < 1`),
  `ofReal_legendreK_eq_carlsonRF`, `ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD` (`k ^ 2 < 1`),
  `ofReal_legendrePic_eq_carlsonRF_add_carlsonRJ` (`k ^ 2 < 1`, `α2 < 1`).
- *Jacobi functions* (`Analysis/SpecialFunctions/JacobiElliptic/Basic.lean`, namespace
  `TauCeti.Real`): `jacobiAm`, `jacobiSn`, `jacobiCn`, `jacobiDn` (Convention 6) with
  `jacobiSn_def`, `jacobiCn_def`, `jacobiDn_def`, `coe_legendreFOrderIso_symm`,
  `jacobiAm_of_one_le_sq`; the amplitude `legendreF_jacobiAm`, `jacobiAm_legendreF`,
  `jacobiAm_eq_iff` (`k ^ 2 < 1`), `strictMono_jacobiAm`, `continuous_jacobiAm`, `jacobiAm_zero`,
  `jacobiAm_neg`, `jacobiAm_neg_modulus`, `jacobiAm_zero_modulus`,
  `jacobiAm_add_two_mul_legendreK`, `jacobiAm_add_two_mul_int_mul_legendreK`,
  `jacobiAm_legendreK`, `hasDerivAt_jacobiAm` (`k ^ 2 < 1`); identities
  `jacobiSn_sq_add_jacobiCn_sq`, `jacobiDn_sq`, `jacobiDn_sq_add_sq_mul_jacobiSn_sq`
  (`k ^ 2 ≤ 1`), `jacobiDn_nonneg`, `jacobiDn_pos` (`k ^ 2 < 1`), `jacobiDn_le_one`,
  `jacobiSn_neg`, `jacobiCn_neg`, `jacobiDn_neg`, the parities in the modulus and the values at 0;
  `continuous_jacobiSn`, `continuous_jacobiCn`, `continuous_jacobiDn`; derivatives
  `hasDerivAt_jacobiSn`, `hasDerivAt_jacobiCn`, `hasDerivAt_jacobiDn` (`k ^ 2 < 1`) and
  `deriv_jacobiSn_sq`; periods `jacobiSn_periodic`, `jacobiCn_periodic` (4K),
  `jacobiDn_periodic` (2K), `jacobiSn_antiperiodic`, `jacobiCn_antiperiodic` (2K); values
  `jacobiSn_legendreK`, `jacobiCn_legendreK`, `jacobiDn_legendreK`; and the degeneration
  `jacobiSn_zero_modulus`, `jacobiCn_zero_modulus`, `jacobiDn_zero_modulus`.
- *The ellipse* (`Analysis/Green/Examples/CurveArea/Ellipse.lean`,
  `…/EllipticIntegral/Ellipse.lean`, namespace `TauCeti.Green.Examples`): `ellipse`
  (`ellipse a b t = (a cos t : ℝ) + (b sin t : ℝ) * I`), `integral_norm_deriv_ellipse` and
  `eVariationOn_ellipse` (`0 < a`, `b ^ 2 ≤ a ^ 2`:
  `eVariationOn (ellipse a b) (Set.Icc 0 (2 * π)) = ENNReal.ofReal (4 * a * legendreEc √(1 - b ^ 2 / a ^ 2))`).
- *Arc length* (`Analysis/Calculus/MetricVariation.lean`):
  `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` (the variation of a C¹ curve is `∫⁻ ‖γ′‖ₑ`).
- *The real period* (`AlgebraicGeometry/EllipticCurve/RealPeriod.lean`, namespace
  `WeierstrassCurve`): `realPeriodLIntegral`, `realPeriod` (Convention 8),
  `realPeriodLIntegral_def`, `realPeriod_def`, `realPeriodLIntegral_eq_lintegral`,
  `realPeriodLIntegral_pos`, `realPeriodLIntegral_lt_top` (`[W.IsElliptic]`), `ofReal_realPeriod`,
  `realPeriod_pos`, `realPeriod_variableChange`.

## References

- NIST *Digital Library of Mathematical Functions*, Chapters 19 (elliptic integrals) and 22
  (Jacobian elliptic functions), <https://dlmf.nist.gov/19>, <https://dlmf.nist.gov/22>.
- B. C. Carlson, *Special Functions of Applied Mathematics*, Academic Press, 1977, Chapter 9.
- B. C. Carlson, Numerical computation of real or complex elliptic integrals, *Numer. Algorithms*
  10 (1995), 13–26, arXiv:math/9409227 (equation numbers as in the arXiv version).
- P. F. Byrd and M. D. Friedman, *Handbook of Elliptic Integrals for Engineers and Scientists*,
  2nd ed., Springer, 1971, formulas 236.00 and 239.00.
- E. Salamin, Computation of π using arithmetic-geometric mean, *Math. Comp.* 30 (1976), 565–570.
- J. E. Cremona, *Algorithms for Modular Elliptic Curves*, 2nd ed., Cambridge, 1997, §3.7.
- B. Braams, `lean-codes`, <https://github.com/bjbraams/lean-codes>, directory `Carlson/Elliptic/`
  at commit `2b8cba1` (Apache-2.0).
