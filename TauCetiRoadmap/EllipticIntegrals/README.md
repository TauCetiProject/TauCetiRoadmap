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

- *Gauss's theorem, Legendre's relation and the Gauss–Brent–Salamin formula.* For k² < 1 and
  k′ = √(1 − k²), K(k) = π/(2M(1, k′)); for 0 < k < 1, E(k)K(k′) + E(k′)K(k) − K(k)K(k′) = π/2.
  Run the AGM from a₀ = 1 and g₀ = 1/√2 by aₙ₊₁ = (aₙ + gₙ)/2 and gₙ₊₁ = √(aₙgₙ), and put
  cₙ² = aₙ² − gₙ². Then π = 4M(1, 1/√2)²/(1 − S), where S is the sum over n ≥ 1 of 2ⁿ⁺¹cₙ². It
  combines the two identities before it with the AGM series E(k) = K(k)(1 − Σₙ 2ⁿ⁻¹cₙ²), summed
  over n ≥ 0, for k² < 1 with g₀ = k′ and c₀ = k.
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

Mathlib supplies the arithmetic–geometric mean, the Gauss hypergeometric series and the Gamma and
Beta functions. [EllipticCurves](../EllipticCurves/README.md) owns the real period and the
Birch–Swinnerton-Dyer quotient, and Milestone 8 evaluates that period. The lattice side (the σ
function, the quasi-periods, the lattice form of Legendre's relation, ℂ/Λ ≅ E(ℂ)) belongs to
[ModularCurvesPartII](../ModularCurvesPartII/README.md), and the theta functions and the modular
function λ to [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md); nothing here uses them,
while SpecialFunctionsTheta uses K with its AGM, hypergeometric and Carlson forms.
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) takes the
hypergeometric forms of K and E from Milestone 2.

Milestones 1 and 2 give the Legendre integrals their theory in the amplitude and in the modulus.
Milestone 3 finds K and E as k → 1⁻ and proves Legendre's relation; Milestone 4 treats the AGM,
from quadratic convergence and Gauss's theorem to Landen's transformations and the
Gauss–Brent–Salamin formula; Milestone 5 computes K(1/√2), E(1/√2) and the lemniscate constant.
Milestone 6 builds Carlson's integrals, their duplication theorem and their dictionary with
Legendre's; Milestone 7 inverts F to the Jacobi functions and solves the pendulum; Milestone 8
computes the perimeter of an ellipse, the real cubic integrals and the real period.

## Conventions

1. **Modulus, not parameter.** Every integral takes the modulus `k : ℝ`, as in DLMF Chapter 19
   and Carlson. The parameter m = k² never appears as an argument. The complementary modulus
   k′ = √(1 − k²) is written out, and K′(k) means `legendreK √(1 - k ^ 2)`; neither gets its own
   definition.
2. **Legendre integrals** (DLMF 19.2.4, 19.2.5, 19.2.7), in the namespace `TauCeti.Real`:

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
   meaningful under `k ^ 2 < 1` and `α2 < 1`; every statement that needs these hypotheses states
   them, and the statements at k = 1 carry a bound on |φ| instead. The positivity and
   integrability theorems of Milestone 1 come first, so that a junk value is never mistaken for a
   result.
   *In Tau Ceti:* `TauCeti.Real.legendreF`, `TauCeti.Real.legendreE`, `TauCeti.Real.legendrePi`, `TauCeti.Real.legendreK`, `TauCeti.Real.legendreEc`, `TauCeti.Real.legendrePic`, `TauCeti.Real.legendreF_def`, `TauCeti.Real.legendreE_def`, `TauCeti.Real.legendrePi_def`, `TauCeti.Real.legendreK_def`, `TauCeti.Real.legendreEc_def`, `TauCeti.Real.legendrePic_def`.
3. **Third kind.** The characteristic `α2` is a real number, written α² in prose and allowed to be
   negative. Only `α2 < 1` is in scope: for `α2 > 1` the integral is a Cauchy principal value,
   which this roadmap does not treat.
4. **Carlson integrals** (DLMF 19.16.1, 19.16.2, 19.16.2_5, 19.16.5, 19.2.17), in the namespace
   `Complex`, defined by these integrals with the principal power `(t + x) ^ (-(1/2) : ℂ)` of each
   factor:

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
   `slitPlane`. Statements put the possible zero in the first argument; the symmetry of the
   functions (§6.2) moves it to any other.
   *In Tau Ceti:* `Complex.carlsonRF`, `Complex.carlsonRC`, `Complex.carlsonRJ`, `Complex.carlsonRD`, `Complex.carlsonRG`, `Complex.carlsonRGIntegrand`, `Complex.carlsonRF_def`, `Complex.carlsonRC_def`, `Complex.carlsonRJ_def`, `Complex.carlsonRD_def`, `Complex.carlsonRG_def`, `Complex.carlsonRGIntegrand_def`, `Complex.carlsonRC_eq_integral`, `Complex.carlsonRD_eq_integral`.
5. **AGM.** Mathlib's `NNReal.agm` is the AGM. Statements about real numbers coerce through
   `Real.toNNReal` or `NNReal` literals rather than introducing a real-valued copy. For
   a₀, g₀ ≥ 0 the AGM sequences are aₙ₊₁ = (aₙ + gₙ)/2, gₙ₊₁ = √(aₙgₙ) and cₙ₊₁ = (aₙ − gₙ)/2, so
   that cₙ² = aₙ² − gₙ² for n ≥ 1; each statement fixes c₀. Mathlib's `NNReal.agmSequences a₀ g₀ n`
   is the pair (gₙ₊₁, aₙ₊₁): its index 0 is already one step in.
6. **Jacobi functions.** The amplitude `jacobiAm k` and `jacobiSn k`, `jacobiCn k` and
   `jacobiDn k`, in `TauCeti.Real`, are functions `ℝ → ℝ` with the modulus first, so that
   `Function.Periodic (jacobiSn k) (4 * legendreK k)` reads directly. For `k ^ 2 < 1`,
   `jacobiAm k` is the inverse of `fun φ ↦ legendreF φ k`, that is the inverse of the order
   isomorphism of §1.4; for `k ^ 2 ≥ 1` it is the junk value `id`. Then
   `jacobiSn k = sin ∘ jacobiAm k`, `jacobiCn k = cos ∘ jacobiAm k` and
   `jacobiDn k u = √(1 − k² (jacobiSn k u)²)`. Complex-variable versions are not part of this
   roadmap (Scope and ownership).
   *In Tau Ceti:* `TauCeti.Real.jacobiAm`, `TauCeti.Real.jacobiSn`, `TauCeti.Real.jacobiCn`, `TauCeti.Real.jacobiDn`, `TauCeti.Real.jacobiSn_def`, `TauCeti.Real.jacobiCn_def`, `TauCeti.Real.jacobiDn_def`, `TauCeti.Real.jacobiAm_of_one_le_sq`.
7. **Lemniscate constant.** `TauCeti.Real.lemniscateConstant = 2 ∫₀¹ (1 − t⁴)^(−1/2) dt`
   (ϖ ≈ 2.62206).
   *In Tau Ceti:* `TauCeti.Real.lemniscateConstant`, `TauCeti.Real.lemniscateConstant_def`.
8. **Real cubic and real period.** For `W : WeierstrassCurve ℝ`, Mathlib's `W.Ψ₂Sq` is the cubic
   4x³ + b₂x² + 2b₄x + b₆, the square of 2y + a₁x + a₃ on the curve. Tau Ceti's
   `WeierstrassCurve.realPeriod W` is twice the real value of the Lebesgue integral
   `∫⁻ x in {x | 0 < W.Ψ₂Sq.eval x}, ENNReal.ofReal (√(W.Ψ₂Sq.eval x))⁻¹`
   (`WeierstrassCurve.realPeriodLIntegral`). In Milestone 8 the roots of `Ψ₂Sq` are given as
   explicit real numbers, or as a real root and a pair a ± bi, together with a factorization
   hypothesis `∀ x, W.Ψ₂Sq.eval x = …`. No root-selection function is introduced.
9. **Homes and names.** The suggested homes are
   `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/` (Milestones 1–6 and 8) and
   `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/` (Milestone 7), beside Mathlib's
   `Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` and
   `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`. Statements about the integrals
   are in `TauCeti.Real` or `Complex` as their objects are, the AGM integral is in `TauCeti`, and
   statements about the real period are in `WeierstrassCurve`. The acceptance file
   `Suggested.lean` states, in `TauCetiRoadmap.EllipticIntegrals`, the headline theorems that the
   pinned Tau Ceti does not prove.

## Milestone 1: the Legendre integrals

### 1.1 Integrands and positivity

For `k ^ 2 < 1` and `α2 < 1` the three integrands of Convention 2 are continuous on ℝ and lie
between explicit positive constants: the integrand of F between 1 and (1 − k²)^(−1/2), that of E
between (1 − k²)^(1/2) and 1, and that of Π between (max(1, 1 − α²))⁻¹ and
(min(1, 1 − α²))⁻¹ (1 − k²)^(−1/2). All three are interval-integrable on every bounded interval.
The integrals are positive for positive amplitude: F(φ, k), E(φ, k) and Π(φ, k, α²) are positive
for φ > 0, and K(k), E(k) and Π(k, α²) are positive. More precisely φ ≤ F(φ, k) ≤ φ/√(1 − k²) for
φ ≥ 0, and π/2 ≤ K(k) ≤ π/(2√(1 − k²)) (the lower bound is §1.7).

*Needs:* Convention 2; Mathlib `intervalIntegral`, `Real.rpow`.

**Checks.**
- K(0.6) = 1.7507538…, the value of the defining integral. A definition with the parameter in
  place of the modulus, the integrand (1 − k sin²θ)^(−1/2), would give 1.9495677… at the argument
  0.6, which is K(√0.6).

*In Tau Ceti:* `TauCeti.Real.continuous_legendreF_integrand`, `TauCeti.Real.one_le_legendreF_integrand`, `TauCeti.Real.legendreF_integrand_le`, `TauCeti.Real.continuous_legendreE_integrand`, `TauCeti.Real.legendreE_integrand_pos`, `TauCeti.Real.le_legendreE_integrand`, `TauCeti.Real.legendreE_integrand_le_one`, `TauCeti.Real.continuous_legendrePi_integrand`, `TauCeti.Real.legendrePi_integrand_pos`, `TauCeti.Real.inv_max_le_legendrePi_integrand`, `TauCeti.Real.legendrePi_integrand_le`, `TauCeti.Real.intervalIntegrable_legendreF_integrand`, `TauCeti.Real.intervalIntegrable_legendreE_integrand`, `TauCeti.Real.intervalIntegrable_legendrePi_integrand`, `TauCeti.Real.legendreF_pos`, `TauCeti.Real.legendreE_pos`, `TauCeti.Real.legendrePi_pos`, `TauCeti.Real.legendreK_pos`, `TauCeti.Real.legendreEc_pos`, `TauCeti.Real.legendrePic_pos`, `TauCeti.Real.self_le_legendreF`, `TauCeti.Real.legendreF_le_div_sqrt`, `TauCeti.Real.legendreK_le_pi_div_two_div_sqrt`.

### 1.2 Algebraic form

For |φ| ≤ π/2 (DLMF 19.2.4, second forms; the substitution t = sin θ):
- F(φ, k) = ∫₀^(sin φ) ((1 − t²)(1 − k²t²))^(−1/2) dt;
- E(φ, k) = ∫₀^(sin φ) (1 − k²t²)^(1/2) (1 − t²)^(−1/2) dt;
- Π(φ, k, α²) = ∫₀^(sin φ) (1 − α²t²)⁻¹ ((1 − t²)(1 − k²t²))^(−1/2) dt.

At φ = π/2 these write K(k), E(k) and Π(k, α²) as integrals over [0, 1], improper at t = 1, and
integrability there is part of the statement: for `k ^ 2 < 1`, and `α2 < 1` for Π, the three
algebraic integrands are integrable on [−1, 1].

*Needs:* §1.1; Mathlib `intervalIntegral.integral_comp_mul_deriv`, `Real.arcsin`.

*In Tau Ceti:* `TauCeti.Real.legendreF_eq_integral_algebraic`, `TauCeti.Real.legendreE_eq_integral_algebraic`, `TauCeti.Real.legendrePi_eq_integral_algebraic`, `TauCeti.Real.legendreK_eq_integral_algebraic`, `TauCeti.Real.legendreEc_eq_integral_algebraic`, `TauCeti.Real.legendrePic_eq_integral_algebraic`, `TauCeti.Real.integrableOn_legendreF_algebraic_integrand`, `TauCeti.Real.integrableOn_legendreE_algebraic_integrand`, `TauCeti.Real.integrableOn_legendrePi_algebraic_integrand`.

### 1.3 Symmetries and quasi-periodicity

- F, E and Π are odd in φ and even in k; hence K, E(k) and Π(k, α²) are even in k.
- For `k ^ 2 < 1`, every real φ and every integer n,
  `legendreF (φ + n * π) k = legendreF φ k + 2 * n * legendreK k`, in particular
  `legendreF (φ + π) k = legendreF φ k + 2 * legendreK k` and
  `legendreF (n * π) k = 2 * n * legendreK k`; likewise for E with `legendreEc` and, for
  `α2 < 1`, for Π with `legendrePic`.

*Needs:* §1.1; the π-periodicity of sin².

*In Tau Ceti:* `TauCeti.Real.legendreF_neg`, `TauCeti.Real.legendreE_neg`, `TauCeti.Real.legendrePi_neg`, `TauCeti.Real.legendreF_neg_modulus`, `TauCeti.Real.legendreE_neg_modulus`, `TauCeti.Real.legendrePi_neg_modulus`, `TauCeti.Real.legendreK_neg`, `TauCeti.Real.legendreEc_neg`, `TauCeti.Real.legendrePic_neg_modulus`, `TauCeti.Real.legendreF_add_pi`, `TauCeti.Real.legendreF_add_int_mul_pi`, `TauCeti.Real.legendreF_int_mul_pi`, `TauCeti.Real.legendreE_add_pi`, `TauCeti.Real.legendreE_add_int_mul_pi`, `TauCeti.Real.legendreE_int_mul_pi`, `TauCeti.Real.legendrePi_add_pi`, `TauCeti.Real.legendrePi_add_int_mul_pi`, `TauCeti.Real.legendrePi_int_mul_pi`.

### 1.4 Derivatives and monotonicity in φ

For `k ^ 2 < 1` (and `α2 < 1` for Π):
- `HasDerivAt (legendreF · k) ((1 − k² sin²φ)^(−1/2)) φ`, and likewise for E with derivative
  (1 − k² sin²φ)^(1/2) and for Π with derivative (1 − α² sin²φ)⁻¹ (1 − k² sin²φ)^(−1/2);
- F(·, k), E(·, k) and Π(·, k, α²) are continuous and strictly increasing;
- F(·, k) tends to +∞ at +∞ and to −∞ at −∞, and is an order isomorphism `ℝ ≃o ℝ`. This is the
  input to Milestone 7.

*Route.* The fundamental theorem of calculus; the unboundedness is the quasi-periodicity of §1.3.
*Needs:* §1.1, §1.3; Mathlib `intervalIntegral.integral_hasDerivAt_right`.

*In Tau Ceti:* `TauCeti.Real.hasDerivAt_legendreF`, `TauCeti.Real.hasDerivAt_legendreE`, `TauCeti.Real.hasDerivAt_legendrePi`, `TauCeti.Real.continuous_legendreF`, `TauCeti.Real.continuous_legendreE`, `TauCeti.Real.continuous_legendrePi`, `TauCeti.Real.strictMono_legendreF`, `TauCeti.Real.strictMono_legendreE`, `TauCeti.Real.strictMono_legendrePi`, `TauCeti.Real.tendsto_legendreF_atTop`, `TauCeti.Real.tendsto_legendreF_atBot`, `TauCeti.Real.legendreFOrderIso`, `TauCeti.Real.coe_legendreFOrderIso`.

### 1.5 Degenerate moduli

- F(φ, 0) = φ and E(φ, 0) = φ; K(0) = E(0) = π/2.
- For |φ| < π/2, F(φ, 1) = artanh(sin φ); for |φ| ≤ π/2, E(φ, 1) = sin φ; E(1) = 1.
- K(k) tends to +∞ as k → 1⁻. The statement is `Tendsto legendreK (𝓝[<] 1) atTop`, not a value
  at 1.

*Needs:* Convention 2, §1.2; Mathlib `Real.artanh`.

*In Tau Ceti:* `TauCeti.Real.legendreF_zero_modulus`, `TauCeti.Real.legendreE_zero_modulus`, `TauCeti.Real.legendreK_zero`, `TauCeti.Real.legendreEc_zero`, `TauCeti.Real.legendreF_one_modulus`, `TauCeti.Real.legendreE_one_modulus`, `TauCeti.Real.legendreEc_one`, `TauCeti.Real.tendsto_legendreK_nhdsLT_one`.

### 1.6 Elementary third-kind reductions

(DLMF 19.6.11, 19.6.13.)
- Π(φ, k, 0) = F(φ, k), and Π(k, 0) = K(k).
- For `α2 < 1` and |φ| < π/2, Π(φ, 0, α²) = arctan(√(1 − α²) tan φ)/√(1 − α²), and
  Π(0, α²) = π/(2√(1 − α²)).
- For `k ^ 2 < 1` and every φ,
  Π(φ, k, k²) = (E(φ, k) − k² sin φ cos φ/√(1 − k² sin²φ))/(1 − k²), and Π(k, k²) = E(k)/(1 − k²).

*Needs:* §1.4 (the derivatives in φ), §1.5; Mathlib `Real.arctan`.

*In Tau Ceti:* `TauCeti.Real.legendrePi_zero_characteristic`, `TauCeti.Real.legendrePic_zero_characteristic`, `TauCeti.Real.legendrePi_zero_modulus`, `TauCeti.Real.legendrePic_zero_modulus`, `TauCeti.Real.legendrePi_modulus_sq`, `TauCeti.Real.legendrePic_modulus_sq`.

### 1.7 Monotonicity in k

- On [0, 1), K is strictly increasing; E(k) is strictly decreasing on [0, ∞).
- E(k) ≤ π/2 ≤ K(k) for `k ^ 2 < 1`, with equality in either only at k = 0.
- For φ ≥ 0, F(φ, k) is increasing in k ∈ [0, 1) and E(φ, k) decreasing in k ≥ 0; more
  generally, for φ ≥ 0 and k² ≤ l² < 1, F(φ, k) ≤ F(φ, l) and E(φ, l) ≤ E(φ, k), strictly when
  φ > 0 and k² < l².

*Needs:* Convention 2, §1.1.

*In Tau Ceti:* `TauCeti.Real.strictMonoOn_legendreK`, `TauCeti.Real.strictAntiOn_legendreEc`, `TauCeti.Real.pi_div_two_le_legendreK`, `TauCeti.Real.legendreEc_le_pi_div_two`, `TauCeti.Real.legendreK_eq_pi_div_two_iff`, `TauCeti.Real.legendreEc_eq_pi_div_two_iff`, `TauCeti.Real.monotoneOn_legendreF_modulus`, `TauCeti.Real.antitoneOn_legendreE_modulus`, `TauCeti.Real.legendreF_le_of_sq_le`, `TauCeti.Real.legendreE_le_of_sq_le`, `TauCeti.Real.legendreF_lt_of_sq_lt`, `TauCeti.Real.legendreE_lt_of_sq_lt`, `TauCeti.Real.legendreK_lt_of_sq_lt`, `TauCeti.Real.legendreEc_lt_of_sq_lt`.

### 1.8 Imaginary modulus

(DLMF 19.7.5, complete case.) For real c,
∫₀^(π/2) (1 + c² sin²θ)^(−1/2) dθ = K(c/√(1 + c²))/√(1 + c²), the integrand being
interval-integrable on every interval.

*Needs:* Convention 2; the substitution θ ↦ π/2 − θ.

*In Tau Ceti:* `TauCeti.Real.integral_one_add_mul_sin_sq_rpow_neg_half_eq_legendreK_div_sqrt`, `TauCeti.Real.intervalIntegrable_one_add_mul_sin_sq_rpow_neg_half`.

### Examples

- At k = 1 and φ = π/4, F(π/4, 1) = artanh(1/√2) = log(1 + √2) = 0.8813736…, while
  E(π/4, 1) = sin(π/4) = 0.7071068….
- K(0.6) = 1.7507538… and E(0.6) = 1.4180834… lie on either side of π/2 = 1.5707963…, and
  F(π, 0.6) = 2K(0.6) = 3.5015076….
- Π(π/4, 0, −3) = arctan(2 tan(π/4))/2 = arctan(2)/2 = 0.5535744….
- With c = 1 in §1.8, ∫₀^(π/2) (1 + sin²θ)^(−1/2) dθ = K(1/√2)/√2 = 1.3110288….

### Dependencies

Mathlib: interval integrals with the fundamental theorem of calculus and changes of variables,
`Real.rpow`, `Real.arcsin`, `Real.arctan` and `Real.artanh`. No earlier milestone.

## Milestone 2: the complete integrals as functions of the modulus

### 2.1 Continuity

K, E(k) and, for `α2 < 1`, Π(k, α²) are continuous on {k | k² < 1}; E(k) is continuous on all
of ℝ, in particular at ±1. For each φ, the incomplete F(φ, ·) and Π(φ, ·, α²) (`α2 < 1`) are
continuous on {k | k² < 1} and E(φ, ·) on ℝ.

*Needs:* §1.1; Mathlib `intervalIntegral.tendsto_integral_filter_of_dominated_convergence`.

*In Tau Ceti:* `TauCeti.Real.continuousOn_legendreK`, `TauCeti.Real.continuous_legendreEc`, `TauCeti.Real.continuousOn_legendrePic`, `TauCeti.Real.continuousOn_legendreF_modulus`, `TauCeti.Real.continuous_legendreE_modulus`, `TauCeti.Real.continuousOn_legendrePi_modulus`.

### 2.2 Derivatives

(DLMF 19.4.1.) For 0 < |k| < 1:
- `HasDerivAt legendreK ((legendreEc k − (1 − k²) legendreK k) / (k (1 − k²))) k`;
- `HasDerivAt legendreEc ((legendreEc k − legendreK k) / k) k`.

At k = 0 both derivatives are 0. The incomplete integrals have the companion derivatives in k:
for 0 < |k| < 1, ∂E(φ, k)/∂k = (E(φ, k) − F(φ, k))/k and
∂F(φ, k)/∂k = (E(φ, k) − (1 − k²)F(φ, k))/(k(1 − k²)) − k sin φ cos φ/((1 − k²)√(1 − k² sin²φ)),
both 0 at k = 0.

*Route.* Differentiation under the integral sign, followed by one integration by parts.
*Needs:* §1.1, §1.5; Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.

**Checks.**
- At k = 0.6 the formula gives K′(0.6) = (1.4180834… − 0.64 × 1.7507538…)/(0.6 × 0.64) =
  0.7750025…, which a difference quotient of K reproduces. The derivative in the parameter m = k²
  is this divided by 2k, 0.6458354…: a formula in m read as one in k is wrong by that factor.

*In Tau Ceti:* `TauCeti.Real.hasDerivAt_legendreK`, `TauCeti.Real.hasDerivAt_legendreEc`, `TauCeti.Real.hasDerivAt_legendreK_zero`, `TauCeti.Real.hasDerivAt_legendreEc_zero`, `TauCeti.Real.deriv_legendreK`, `TauCeti.Real.deriv_legendreEc`, `TauCeti.Real.deriv_legendreK_zero`, `TauCeti.Real.deriv_legendreEc_zero`, `TauCeti.Real.hasDerivAt_legendreF_modulus`, `TauCeti.Real.hasDerivAt_legendreE_modulus`, `TauCeti.Real.hasDerivAt_legendreF_modulus_zero`, `TauCeti.Real.hasDerivAt_legendreE_modulus_zero`.

### 2.3 Legendre's differential equations

For `k ^ 2 < 1`, stated with `deriv` and `deriv^[2]`:
- k(1 − k²)K″ + (1 − 3k²)K′ − kK = 0;
- k(1 − k²)E″ + (1 − k²)E′ + kE = 0.

K and E are twice differentiable on (−1, 1) (by §2.5), and for 0 < |k| < 1
K″ = ((1 − k²)(1 − 2k²)K − (1 − 3k²)E)/(k²(1 − k²)²) and E″ = −(E − (1 − k²)K)/(k²(1 − k²)).

*Route.* Differentiate the formulas of §2.2 once more; at k = 0 both equations read 0 = 0 with
K′(0) = E′(0) = 0.
*Needs:* §2.2.

*In Tau Ceti:* `TauCeti.Real.legendreK_differential_equation`, `TauCeti.Real.legendreEc_differential_equation`, `TauCeti.Real.hasDerivAt_deriv_legendreK`, `TauCeti.Real.hasDerivAt_deriv_legendreEc`.

### 2.4 Hypergeometric series

(DLMF 19.5.1, 19.5.2.) For `k ^ 2 < 1`:
- `legendreK k = π/2 * ₂F₁ (1/2) (1/2) 1 (k ^ 2)`;
- `legendreEc k = π/2 * ₂F₁ (-1/2) (1/2) 1 (k ^ 2)`.

Both use Mathlib's `ordinaryHypergeometric` over ℝ. More generally, for real a and |m| < 1,
∫₀^(π/2) (1 − m sin²θ)^(−a) dθ = (π/2) ₂F₁(a, 1/2; 1; m).

*Route.* Expand the integrand binomially and integrate term by term with the Wallis integrals.
*Needs:* Convention 2; Mathlib `ordinaryHypergeometric`, `ordinaryHypergeometric_eq_tsum`,
`ordinaryHypergeometricSeries_radius_eq_one`.

*In Tau Ceti:* `TauCeti.Real.legendreK_eq_ordinaryHypergeometric`, `TauCeti.Real.legendreEc_eq_ordinaryHypergeometric`, `TauCeti.integral_one_sub_mul_sin_sq_rpow_neg_eq_ordinaryHypergeometric`.

### 2.5 Analyticity

K and E are `AnalyticOnNhd ℝ` on `Set.Ioo (-1) 1`, a consequence of §2.4.

*Needs:* §2.4.

*In Tau Ceti:* `TauCeti.Real.analyticOnNhd_legendreK`, `TauCeti.Real.analyticOnNhd_legendreEc`, `TauCeti.analyticOnNhd_integral_one_sub_mul_sin_sq_rpow_neg`, `TauCeti.analyticOnNhd_integral_one_sub_sq_mul_sin_sq_rpow_neg`.

### Examples

- At k = 0.6: K′(0.6) = 0.7750025… and E′(0.6) = (E − K)/k = −0.5544507….
- At k = 0.6 the partial sums (π/2)(1 + k²/4) = 1.7121680… and
  (π/2)(1 + k²/4 + 9k⁴/64) = 1.7407958… of the series for K approach K(0.6) = 1.7507538….

### Dependencies

Milestone 1: the integrands with their bounds and the value at k = 0. Mathlib: parametric
differentiation of integrals, `ordinaryHypergeometric` with its radius of convergence, and analytic
functions.

## Milestone 3: the logarithmic singularity and Legendre's relation

### 3.1 The logarithmic singularity of K

Prove `tendsto_legendreK_sub_log`: as k → 1⁻, `legendreK k − log (4 / √(1 − k ^ 2))` tends to 0
(DLMF 19.12.1). Prove also that `legendreEc k` tends to 1 as k → 1⁻. With the limit
(1 − k²)K(k) → 0 as k → 1⁻, these are the three limits of the complete integrals at k = 1.

*Route.* Substituting θ = π/2 − φ writes K(k) as the integral over [0, π/2] of
(sin²φ + k′² cos²φ)^(−1/2). The companion integral J(k) of cos φ (sin²φ + k′² cos²φ)^(−1/2) over
the same interval is (1/k) arsinh(k/k′) = (1/k) log((1 + k)/k′), by the substitution u = sin φ, and
J(k) − log(2/k′) → 0. The integrand of K − J is (1 − cos φ)(sin²φ + k′² cos²φ)^(−1/2), bounded by
(1 − cos φ)/sin φ = tan(φ/2), so dominated convergence gives K − J → ∫₀^(π/2) tan(φ/2) dφ = log 2.
Hence K(k) − log(4/k′) → 0. The limit of E is the continuity of E at 1 (§2.1) with its value
there (§1.5).
*Needs:* Convention 2 (`TauCeti.Real.legendreK_def`, `TauCeti.Real.legendreF_def`); §2.1
(`TauCeti.Real.continuous_legendreEc`); §1.5 (`TauCeti.Real.legendreEc_one`); Mathlib
`Real.arsinh`, `intervalIntegral.tendsto_integral_filter_of_dominated_convergence`.

**Checks.**
- At k′ = 10⁻³, K(k) = 8.2940514636… and log 4000 = 8.2940496401…, a difference of 1.8 · 10⁻⁶.
  With log(2/k′) in place of log(4/k′) the difference tends to log 2 instead of 0: at k′ = 10⁻³ it
  is 0.693149….
- The route's companion integral at k = 0.9 is J = 1.63579943287…, equal to
  (1/k) arsinh(k/k′); a route that dropped the bounded difference K − J would miss the constant
  log 2 = ∫₀^(π/2) tan(φ/2) dφ.

*In Tau Ceti:* `TauCeti.Real.tendsto_one_sub_sq_mul_legendreK_nhdsLT_one` (the limit (1 − k²)K(k) → 0).

### 3.2 Legendre's relation

(DLMF 19.7.1.) For 0 < k < 1, with k′ = √(1 − k²):

`legendreEc k * legendreK k′ + legendreEc k′ * legendreK k − legendreK k * legendreK k′ = π/2`.

*Route.* By §2.2 the left side has derivative 0 on (0, 1). As k → 0⁺ it tends to π/2: write it as
K(k′)(E(k) − K(k)) + E(k′)K(k), where E(k) − K(k) = O(k²) by the series of §2.4 and
k²K(k′) = (1 − k′²)K(k′) → 0 by the third limit of §3.1, while E(k′) → 1 and K(k) → π/2.
*Needs:* §1.5, §2.1, §2.2, §2.4, the third limit of §3.1.

*In Tau Ceti:* `TauCeti.Real.legendre_relation`.

### Examples

- K(k) − log(4/k′) is 6.758 · 10⁻³, 1.248 · 10⁻⁴ and 1.824 · 10⁻⁶ at k′ = 10⁻¹, 10⁻² and 10⁻³.
- At the same moduli E(k) = 1.0159935…, 1.0002746… and 1.0000039…, tending to 1, while
  (1 − k²) K(k) = 3.70 · 10⁻², 5.99 · 10⁻⁴ and 8.29 · 10⁻⁶ tends to 0.
- At k = 0.6, k′ = 0.8: E(0.6)K(0.8) + E(0.8)K(0.6) − K(0.6)K(0.8) =
  1.4180834… × 1.9953028… + 1.2763499… × 1.7507538… − 1.7507538… × 1.9953028… = 1.5707963… = π/2.

### Dependencies

Milestones 1 and 2: the Legendre integrals, the value E(1) = 1, the continuity of E in the modulus,
the derivatives in k and the series. Mathlib's dominated convergence for interval integrals and
`Real.arsinh`.

## Milestone 4: the arithmetic–geometric mean

### 4.1 Quadratic convergence

For real 0 < y ≤ x, one AGM step shrinks the gap quadratically:
(x + y)/2 − √(xy) ≤ (x − y)²/(8y), and the same holds in ℝ≥0. Since the geometric means increase,
for x, y in ℝ≥0 with 0 < y ≤ x and every n,
`(agmSequences x y n).2 − (agmSequences x y n).1 ≤ 8 * y * ((x − y) / (8 * y)) ^ (2 ^ (n + 1))`.
Mathlib's `agmSequences x y 0` is already one step in. This complements Mathlib's halving bound.

*Needs:* Mathlib `NNReal.agmSequences`, `NNReal.agmSequences_succ'`, `NNReal.agmSequences_fst_monotone`.

*In Tau Ceti:* `Real.half_add_sub_sqrt_mul_le`, `NNReal.half_add_sub_sqrt_mul_le`, `NNReal.agmSequences_snd_sub_fst_le`.

### 4.2 The AGM integral

For real a and b the AGM integral is
`agmIntegral a b = ∫ x in Set.Ioi 0, (√((x ^ 2 + a ^ 2) * (x ^ 2 + b ^ 2)))⁻¹`, in the namespace
`TauCeti`. Its integrand is integrable on (0, ∞) for a, b > 0; it is symmetric in a and b; it is
invariant under one AGM step, agmIntegral a b = agmIntegral √(ab) ((a + b)/2) for a, b ≥ 0, hence
under every term of the AGM sequences; and for a, b in ℝ≥0,

`agmIntegral a b = π / 2 / agm a b`.

Further, agmIntegral a a = π/(2a) for a ≥ 0, agmIntegral a b > 0 for a, b > 0,
agmIntegral (ca) (cb) = agmIntegral a b/|c|, and the AGM integral is continuous on (0, ∞)². The
name and statement of the definition and of the evaluation are those of Mathlib's proposal
[mathlib4#34397](https://github.com/leanprover-community/mathlib4/pull/34397), so that adopting
Mathlib's version is a deletion plus an import.

*Route.* The invariance is the substitution t = (x − ab/x)/2, which carries the integral for
(a, b) over (0, ∞) to half the integral for (√(ab), (a + b)/2) over ℝ. The evaluation
passes to the limit along the AGM sequences, whose two entries tend to M(a, b), with
agmIntegral c c = π/(2c) and the continuity of the AGM integral.
*Needs:* Mathlib `NNReal.agm`, `NNReal.tendsto_agmSequences_fst_agm`,
`NNReal.tendsto_agmSequences_snd_agm`, `integrableOn_Ioi_rpow_of_lt`,
`MeasureTheory.integral_comp_mul_deriv_Ioi`.

*In Tau Ceti:* `TauCeti.agmIntegral`, `TauCeti.agmIntegral_def`, `TauCeti.integrableOn_agmIntegrand_Ioi_of_pos`, `TauCeti.agmIntegral_comm`, `TauCeti.agmIntegral_eq_agmIntegral_gm_am`, `TauCeti.agmIntegral_eq_agmIntegral_agmSequences`, `TauCeti.agmIntegral_eq_pi_div_two_div_agm`, `TauCeti.agmIntegral_self`, `TauCeti.agmIntegral_pos`, `TauCeti.agmIntegral_mul_left`, `TauCeti.continuousOn_agmIntegral`.

### 4.3 Trigonometric form

For real a ≠ 0 and b ≠ 0,
∫₀^(π/2) (a² cos²θ + b² sin²θ)^(−1/2) dθ = agmIntegral a b, the integrand being continuous and
interval-integrable.

*Route.* The substitution x = |b| tan θ.
*Needs:* §4.2; Mathlib `MeasureTheory.integral_comp_mul_deriv_Ioi`.

*In Tau Ceti:* `TauCeti.integral_rpow_cos_sq_add_sin_sq_eq_integral_Ioi`, `TauCeti.continuous_rpow_cos_sq_add_sin_sq`, `TauCeti.intervalIntegrable_rpow_cos_sq_add_sin_sq`.

### 4.4 Gauss's theorem

For `k ^ 2 < 1`, K(k) = agmIntegral 1 √(1 − k²) and

`legendreK k = π / (2 * agm 1 (√(1 - k ^ 2)).toNNReal)`.

*Route.* §4.3 with a = 1 and b = k′, since cos²θ + k′² sin²θ = 1 − k² sin²θ, then §4.2.
*Needs:* Convention 2, §4.2, §4.3.

**Checks.**
- At k = 0, M(1, 1) = 1 and the formula gives K(0) = π/2. At k = 0.6, M(1, 0.8) = 0.8972114… and
  π/(2M(1, 0.8)) = 1.7507538… = K(0.6); with M(1, k) in place of M(1, k′) it would give
  π/(2M(1, 0.6)) = 1.9953028…, which is K(0.8).

*In Tau Ceti:* `TauCeti.Real.legendreK_eq_agmIntegral`, `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`.

### 4.5 Landen's transformation

(DLMF 19.8.12, descending form.) For `k ^ 2 < 1`, with k′ = √(1 − k²) and k₁ = (1 − k′)/(1 + k′):
- K(k) = (1 + k₁)K(k₁);
- E(k) = (1 + k′)E(k₁) − k′K(k).

The ascending forms, obtained by solving for k₁: for 0 ≤ k < 1,
K(2√k/(1 + k)) = (1 + k)K(k) and E(2√k/(1 + k)) = (2E(k) − (1 − k²)K(k))/(1 + k).

*Route.* For K, Gauss's theorem §4.4 and the invariance of the AGM under one step with its
homogeneity; for E, differentiate the transformation of K in the modulus with the derivatives of
§2.2.
*Needs:* §4.4, §2.2; Mathlib `NNReal.agm_eq_agm_gm_am`, `NNReal.agm_mul_distrib`.

*In Tau Ceti:* `TauCeti.Real.legendreK_eq_one_add_mul_legendreK`, `TauCeti.Real.legendreEc_eq_one_add_mul_legendreEc`, `TauCeti.Real.legendreK_two_mul_sqrt_div_one_add`, `TauCeti.Real.legendreEc_two_mul_sqrt_div_one_add`.

### 4.6 The AGM series for E

Prove `legendreEc_eq_agm_tsum` (DLMF 19.8.6): for `k ^ 2 < 1`, run the AGM from a₀ = 1 and
g₀ = k′ = √(1 − k²), with c₀ = k and cₙ₊₁ = (aₙ − gₙ)/2 (Convention 5). Then Σₙ 2ⁿ⁻¹cₙ², summed
over n ≥ 0, converges and `legendreEc k = legendreK k * (1 − Σₙ 2ⁿ⁻¹ cₙ²)`. In Mathlib's indexing
cₙ₊₁² is the difference of the squares of the two entries of `NNReal.agmSequences 1 k′ n`, so the
statement sums 2ⁿcₙ₊₁² over n ≥ 0 and writes the term c₀²/2 = k²/2 separately; summability is part
of the statement.

*Route.* Put kₙ = cₙ/aₙ, so that kₙ′ = gₙ/aₙ for n ≥ 1 and kₙ₊₁ = (1 − kₙ′)/(1 + kₙ′). The
descending Landen transformations of §4.5, K(kₙ) = (1 + kₙ₊₁) K(kₙ₊₁) and
E(kₙ) = (1 + kₙ′) E(kₙ₊₁) − kₙ′ K(kₙ), with 1 + kₙ′ = 2aₙ₊₁/aₙ and
1 + kₙ₊₁ = aₙ/aₙ₊₁, give aₙ² tₙ = 2aₙ₊₁² tₙ₊₁ − aₙgₙ for tₙ = E(kₙ)/K(kₙ). Since
2aₙ₊₁² − aₙ² − aₙgₙ = −cₙ²/2, the quantities uₙ = 2ⁿaₙ²(tₙ − 1) satisfy uₙ₊₁ − uₙ = 2ⁿ⁻¹cₙ², and
uₙ → 0 because 1 − tₙ is at most a constant times kₙ², and 2ⁿaₙ²kₙ² = 2ⁿcₙ² ≤ 2⁻ⁿ by Mathlib's
halving bound aₙ − gₙ ≤ 2⁻ⁿ(1 − k′). Summing from u₀ = E(k)/K(k) − 1 gives the series; the same
bound gives its convergence.
*Needs:* §4.5 (`TauCeti.Real.legendreK_eq_one_add_mul_legendreK`,
`TauCeti.Real.legendreEc_eq_one_add_mul_legendreEc`); §1.1 (`TauCeti.Real.legendreK_pos`); §1.7
(`TauCeti.Real.pi_div_two_le_legendreK`, `TauCeti.Real.legendreEc_le_pi_div_two`); Mathlib
`NNReal.agmSequences`, `NNReal.agmSequences_succ'`, `NNReal.dist_agmSequences_fst_snd`,
`NNReal.tendsto_agmSequences_snd_agm`.

**Checks.**
- At k = 0.6 the series gives E(0.6) = 1.4180833944…, the value of the defining integral. With
  the weights 2ⁿ in place of 2ⁿ⁻¹, K(0.6)(1 − Σₙ 2ⁿcₙ²) = 1.0854130….
- At k = 0 every cₙ vanishes and the identity reads E(0) = K(0) = π/2; with c₀ = 1 in place of
  c₀ = k it would read E(0) = π/4.

### 4.7 The Gauss–Brent–Salamin formula

Prove `pi_eq_four_mul_agm_sq_div_one_sub_tsum` (Salamin 1976, Theorem 1b, p. 567): run the AGM
from a₀ = 1 and g₀ = 1/√2, with cₙ² = aₙ² − gₙ² for n ≥ 1. Then the sum over n ≥ 1 of 2ⁿ⁺¹cₙ²
converges and
`π = 4 M(1, 1/√2)² / (1 − Σ_{n ≥ 1} 2^(n+1) cₙ²)`. In Mathlib's indexing the n-th summand is
2ⁿ⁺²cₙ₊₁², read off `NNReal.agmSequences 1 (√2)⁻¹ n`.

*Route.* At k = 1/√2, k = k′ and c₀² = 1/2, so §4.6 gives `E = K (3/4 − Σ_{n ≥ 1} 2^(n−1) cₙ²)`.
Legendre's relation (§3.2) at k = k′, 2EK − K² = π/2, then gives
`π/2 = K² (1/2 − Σ_{n ≥ 1} 2^n cₙ²)`, and Gauss's K(1/√2) = π/(2M(1, 1/√2)) (§4.4) gives the
formula.
*Needs:* §4.6; §3.2 (`TauCeti.Real.legendre_relation`, whose case k = 1/√2 is
`TauCeti.Real.legendreEc_one_div_sqrt_two`); §4.4 (`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`);
§1.1 (`TauCeti.Real.legendreK_pos`); Mathlib `NNReal.agm`.

**Checks.**
- Replacing M(1, 1/√2) by aₙ₊₁ and keeping the terms up to cₙ gives 3.140579250…,
  3.141592646… and 3.141592653589794 for n = 1, 2, 3: the number of correct digits roughly
  doubles at each step, as quadratic convergence predicts.
- With 2ⁿcₙ² in place of 2ⁿ⁺¹cₙ² the right side is 3.000251…, not π.

### Examples

- One AGM step from x = 1, y = 0.8 leaves the gap 0.9 − √0.8 = 0.0055728…, under the bound
  (x − y)²/(8y) = 0.00625 of §4.1; the next two gaps, 4.33 · 10⁻⁶ and 2.6 · 10⁻¹², lie under the
  bounds 6.10 · 10⁻⁶ and 5.82 · 10⁻¹².
- Landen at k = 0.6: k′ = 0.8 and k₁ = 1/9, and K(1/9) = 1.5756784…, so that
  (1 + 1/9) K(1/9) = 1.7507538… = K(0.6).
- For k = 1/√2: c₀² = 1/2, c₁ = (1 − 1/√2)/2 = 0.1464466…, c₂ = 0.0063284…, and the weighted
  terms 2ⁿ⁻¹cₙ² are 0.25, 0.0214466…, 0.0000801…, 5.6 · 10⁻¹⁰, …, with sum 0.2715267…. Then
  E(1/√2) = 0.7284733… · K(1/√2) = 0.7284733… × 1.8540747… = 1.3506439…, the value of §5.2.
- M(1, 1/√2) = 0.8472130847…, so 4M² = 2.8710800…, and 1 − 4c₁² − 8c₂² − … = 0.9138932…; the
  quotient is 3.14159265358979….

### Dependencies

Milestone 1 (positivity and bounds of K and E) and Milestone 3 (Legendre's relation). Mathlib:
`NNReal.agm`, `NNReal.agmSequences` with its monotonicity and the halving bound, improper integrals
on `Set.Ioi` and their changes of variables.

## Milestone 5: special values

### 5.1 The complete integral at 1/√2

`legendreK (1/√2) = Γ(1/4)² / (4 √π)`.

*Route.* The substitution t² = 2s²/(1 + s²) in the algebraic form of §1.2 gives
K(1/√2) = √2 ∫₀¹ (1 − s⁴)^(−1/2) ds; the substitution u = s⁴ makes this a Beta integral,
B(1/4, 1/2)/(2√2), and the reflection formula Γ(1/4)Γ(3/4) = π√2 gives the value.
*Needs:* §1.2; Mathlib `Real.Gamma`, `Real.Gamma_one_half_eq`, `Complex.betaIntegral`,
`Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`.

*In Tau Ceti:* `TauCeti.Real.legendreK_one_div_sqrt_two`.

### 5.2 The complete integral of the second kind at 1/√2

`legendreEc (1/√2) = legendreK (1/√2) / 2 + π / (4 legendreK (1/√2))`, from Legendre's relation
(§3.2) with k = k′ = 1/√2.

*Needs:* §3.2, §1.1.

*In Tau Ceti:* `TauCeti.Real.legendreEc_one_div_sqrt_two`.

### 5.3 The lemniscate constant

The lemniscate constant ϖ = `lemniscateConstant` (Convention 7) is positive, ϖ = B(1/4, 1/2)/2, and:
- ϖ = √2 · K(1/√2);
- ϖ = Γ(1/4)²/(2√(2π));
- **Gauss's identity** ϖ = π/M(1, √2).

*Route.* The first identity is the substitution of §5.1; the second is §5.1; Gauss's identity
combines the first with Gauss's theorem (§4.4) at k = 1/√2 and the homogeneity
M(√2, 1) = √2 M(1, 1/√2) of the AGM.
*Needs:* §1.2, §4.4, §5.1; Mathlib `Complex.betaIntegral`, `NNReal.agm_mul_distrib`, `NNReal.agm_comm`.

*In Tau Ceti:* `TauCeti.Real.lemniscateConstant_pos`, `TauCeti.Real.lemniscateConstant_eq_beta`, `TauCeti.Real.lemniscateConstant_eq_sqrt_two_mul_legendreK`, `TauCeti.Real.lemniscateConstant_eq_Gamma`, `TauCeti.Real.lemniscateConstant_eq_pi_div_agm`.

### Examples

- Γ(1/4) = 3.6256099…, and K(1/√2) = Γ(1/4)²/(4√π) = 1.8540746773….
- E(1/√2) = 1.8540746…/2 + π/(4 × 1.8540746…) = 1.3506438810….
- ϖ = √2 × 1.8540746… = 2.6220575543…, and M(1, √2) = 1.1981402347… with
  π/1.1981402347… = 2.6220575543….

### Dependencies

Milestone 1 (the algebraic form), Milestone 3 (Legendre's relation) and Milestone 4 (Gauss's
theorem). Mathlib: the Gamma and Beta functions with the reflection formula, and the homogeneity of
`NNReal.agm`.

## Milestone 6: Carlson's symmetric integrals

### 6.1 Convergence and holomorphy

On the domain of Convention 4 each defining integral converges absolutely: for
`x ∈ slitPlane ∪ {0}` and `y, z, p ∈ slitPlane` the integrands of R_F, R_J and R_G are integrable
on (0, ∞). Each function takes positive real values at positive real arguments: for real x ≥ 0
and y, z, p > 0, R_F(x, y, z), R_J(x, y, z, p), R_D(x, y, z) and R_G(x, y, z) are positive reals
(in `ComplexOrder`), and so is R_C(x, y) = R_F(x, y, y). R_J is holomorphic in its fourth
argument: for x, y, z in the domain, p ↦ R_J(x, y, z, p) is holomorphic on the slit plane, with
derivative −(3/2) ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½) (t+p)⁻² dt.

*In Tau Ceti:* `Complex.integrableOn_carlsonRF_integrand`, `Complex.integrableOn_carlsonRJ_integrand`, `Complex.integrableOn_carlsonRGIntegrand`, `Complex.carlsonRF_pos`, `Complex.carlsonRJ_pos`, `Complex.carlsonRD_pos`, `Complex.carlsonRG_pos`, `Complex.hasDerivAt_carlsonRJ_fourth`, `Complex.differentiableOn_carlsonRJ_fourth`, `Complex.analyticOnNhd_carlsonRJ_fourth`.

Prove that each Carlson function is holomorphic in each of its variables separately on the slit
plane, the other arguments being fixed in the domain of Convention 4 (Carlson 1977, Chapter 9):
`DifferentiableOn ℂ (fun x ↦ carlsonRF x y z) slitPlane` for `y ∈ slitPlane ∪ {0}` and
`z ∈ slitPlane`, and the same for `carlsonRG`, for `carlsonRJ` in each of its first three
arguments (with `p ∈ slitPlane`), for `carlsonRD` in each argument (its repeated last argument
included), and for `carlsonRC` in each argument (the second being repeated). By the symmetries of
§6.2 the first argument suffices for `carlsonRF` and `carlsonRG`.

Prove also that R_F is holomorphic in its three variables jointly on the product of three slit
planes:
`DifferentiableOn ℂ (fun w : ℂ × ℂ × ℂ ↦ carlsonRF w.1 w.2.1 w.2.2) (slitPlane ×ˢ slitPlane ×ˢ slitPlane)`.
§6.5 composes R_F with a map that moves all three arguments at once, and the chain rule for such a
composite needs differentiability in the three variables jointly. Holomorphy in each variable
separately implies it by Hartogs' theorem on separately holomorphic functions; the route below
proves it directly.

*Route.* Differentiate under the integral sign, as for R_J in p: on a compact neighbourhood of a
point of the slit plane, the derivative −(t + x)^(−3/2)/2 of the moving factor is bounded by a
constant times (1 + t)^(−3/2), and the other factors are bounded by the integrability estimates
above. For `carlsonRD` and `carlsonRC` in their repeated argument use
`Complex.carlsonRD_eq_integral` and `Complex.carlsonRC_eq_integral`, whose integrands contain that
argument once. For the joint statement, differentiate in the three variables at once: on a
compact subset C of the slit plane there is c > 0 with |t + w| ≥ c(1 + t) for all w ∈ C and
t ≥ 0, so on C × C × C the integrand of R_F is bounded by a constant times (1 + t)^(−3/2) and its
derivative, a linear map on ℂ³, by a constant times (1 + t)^(−5/2).
*Needs:* Convention 4 (`Complex.carlsonRF_def`, `Complex.carlsonRG_def`, `Complex.carlsonRJ_def`,
`Complex.carlsonRD_eq_integral`, `Complex.carlsonRC_eq_integral`); the integrability above
(`Complex.integrableOn_carlsonRF_integrand`, `Complex.integrableOn_carlsonRJ_integrand`,
`Complex.integrableOn_carlsonRGIntegrand`); §6.2 (`Complex.carlsonRF_comm_left`,
`Complex.carlsonRF_comm_right`, `Complex.carlsonRG_comm_left`, `Complex.carlsonRG_comm_right`);
Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`,
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `Complex.slitPlane`.

**Checks.**
- The slit plane cannot be enlarged across the negative real axis: as x tends to −2 from the upper
  and from the lower half-plane, R_C(x, 1) tends to π/(2√3) ∓ i artanh(√(2/3))/√3
  ≈ 0.90690 ∓ 0.66177 i, so no function holomorphic near −2 agrees with x ↦ R_C(x, 1) on the slit
  plane. A statement on ℂ ∖ {0} would be false.

### 6.2 Symmetry and homogeneity

- R_F and R_G are symmetric in x, y, z; R_J is symmetric in its first three arguments; R_D is
  symmetric in its first two.
- For real λ > 0 and all complex arguments, R_F(λx, λy, λz) = λ^(−1/2) R_F(x, y, z), and
  correspondingly with exponent −3/2 for R_J (all four arguments scaled) and for R_D, and 1/2 for
  R_G.

*Needs:* Convention 4; the substitution t ↦ λt.

*In Tau Ceti:* `Complex.carlsonRF_comm_left`, `Complex.carlsonRF_comm_right`, `Complex.carlsonRG_comm_left`, `Complex.carlsonRG_comm_right`, `Complex.carlsonRJ_comm_left`, `Complex.carlsonRJ_comm_right`, `Complex.carlsonRD_comm`, `Complex.carlsonRF_ofReal_mul`, `Complex.carlsonRJ_ofReal_mul`, `Complex.carlsonRD_ofReal_mul`, `Complex.carlsonRG_ofReal_mul`.

### 6.3 Diagonal values

For x ∈ slitPlane, with principal powers: R_F(x, x, x) = x^(−1/2), R_C(x, x) = x^(−1/2),
R_J(x, x, x, x) = R_D(x, x, x) = x^(−3/2) and R_G(x, x, x) = x^(1/2).

*Needs:* Convention 4; Mathlib `Complex.cpow`.

*In Tau Ceti:* `Complex.carlsonRF_self`, `Complex.carlsonRC_self`, `Complex.carlsonRJ_self`, `Complex.carlsonRD_self`, `Complex.carlsonRG_self`.

### 6.4 Elementary R_C

(DLMF 19.2.18, 19.2.19.) At real arguments coerced to ℂ:
- for real 0 ≤ x < y, R_C(x, y) = arccos(√(x/y))/√(y − x);
- for real 0 < y < x, R_C(x, y) = arcosh(√(x/y))/√(x − y).

*Needs:* Convention 4; Mathlib `Real.arccos`, `Real.arcosh`,
`MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`.

*In Tau Ceti:* `Complex.carlsonRC_ofReal_eq_arccos`, `Complex.carlsonRC_ofReal_eq_arcosh`.

### 6.5 The duplication theorem

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
in each variable separately by §6.1. On the right side one variable moves all three arguments at
once: with the other two variables fixed it is the jointly holomorphic R_F of §6.1 composed with a
map into the product of three slit planes, holomorphic by the holomorphy of the principal square
root on the slit plane, so it is holomorphic by the chain rule. The identity then propagates from
nonnegative reals one variable at a time by the identity theorem on the connected slit plane.
*Needs:* §6.1 (holomorphy in each variable, and the joint holomorphy of R_F); §6.2
(`Complex.carlsonRF_comm_left`, `Complex.carlsonRF_comm_right`, `Complex.carlsonRF_ofReal_mul`);
Convention 4 (`Complex.carlsonRF`); Mathlib `Complex.slitPlane`, `Complex.cpow`,
`DifferentiableOn.comp`, `DifferentiableOn.analyticOnNhd`,
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.

**Checks.**
- x = 0, y = z = 1: λ = 1, and both R_F(0, 1, 1) = R_C(0, 1) and
  R_F(1/4, 1/2, 1/2) = R_C(1/4, 1/2) equal π/2 by §6.4. Dividing by 2 instead of 4 gives
  R_C(1/2, 1) = π√2/4 ≈ 1.1107.
- x = y = e^(3πi/4), z = 1: here √x√y = e^(3πi/4) while √(xy) = e^(−πi/4). With principal roots
  of each argument both sides are 0.8012606 − 0.8091666 i; with √(xy), √(yz), √(zx) in λ the
  right side becomes 1.2195926 − 0.5959131 i. The roots are of the arguments, not of their
  products.

### 6.6 The Legendre dictionary

(DLMF 19.25.5, 19.25.7, 19.25.14.) For |φ| ≤ π/2 with k² sin²φ < 1 (in particular for
`k ^ 2 < 1`), write c = cos²φ, Δ = 1 − k² sin²φ and s = sin φ. Then, as identities in ℂ with each
Carlson value taken at real arguments coerced to ℂ, so that its imaginary part is 0:
- F(φ, k) = s · R_F(c, Δ, 1);
- E(φ, k) = s · R_F(c, Δ, 1) − (k²/3) s³ · R_D(c, Δ, 1);
- Π(φ, k, α²) = s · R_F(c, Δ, 1) + (α²/3) s³ · R_J(c, Δ, 1, 1 − α² s²), when also α² sin²φ < 1;
- in particular, for `k ^ 2 < 1` (and `α2 < 1`), K(k) = R_F(0, 1 − k², 1),
  E(k) = R_F(0, 1 − k², 1) − (k²/3) R_D(0, 1 − k², 1) and
  Π(k, α²) = R_F(0, 1 − k², 1) + (α²/3) R_J(0, 1 − k², 1, 1 − α²).

*Route.* A change of variables between the defining integrals of Conventions 2 and 4.
*Needs:* Conventions 2 and 4, §1.1, §6.1 (the integrability).

*In Tau Ceti:* `TauCeti.Real.ofReal_legendreF_eq_carlsonRF`, `TauCeti.Real.ofReal_legendreE_eq_carlsonRF_sub_carlsonRD`, `TauCeti.Real.ofReal_legendrePi_eq_carlsonRF_add_carlsonRJ`, `TauCeti.Real.ofReal_legendreK_eq_carlsonRF`, `TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`, `TauCeti.Real.ofReal_legendrePic_eq_carlsonRF_add_carlsonRJ`.

Prove `legendreEc_eq_carlsonRG` (DLMF 19.25.1): for `k ^ 2 < 1`, `(legendreEc k : ℂ)` equals
`2 * carlsonRG 0 (1 − k ^ 2) 1`, the Carlson value being taken at real arguments coerced to ℂ.
This is the last entry of the dictionary between the Legendre and the Carlson integrals.

*Route.* The entry for E(k) above gives E(k) = R_F(0, k′², 1) − (k²/3) R_D(0, k′², 1). It remains
to prove 2R_G(0, y, 1) = R_F(0, y, 1) − ((1 − y)/3) R_D(0, y, 1) for y ∈ slitPlane, the
zero-argument case of the relation between R_G, R_F and R_D; on the integrals it is an
integration by parts in t.
*Needs:* the entry for E(k) above (`TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD`);
Convention 4 (`Complex.carlsonRG_def`, `Complex.carlsonRF_def`, `Complex.carlsonRD_eq_integral`);
§6.1 (`Complex.integrableOn_carlsonRGIntegrand`).

**Checks.**
- k = 0.6: 2R_G(0, 0.64, 1) = 1.4180834… = E(0.6). Putting k² in place of 1 − k² gives
  2R_G(0, 0.36, 1) = E(0.8) = 1.2763499….
- k = 0: R_G(0, 1, 1) = π/4, so the factor 2 is needed for E(0) = π/2.

### Examples

- R_C(0, 1) = arccos(0) = π/2, R_C(2, 1) = arcosh(√2) = log(1 + √2) = 0.8813736…, and
  R_F(4, 4, 4) = 4^(−1/2) = 1/2.
- K(1/√2) = R_F(0, 1/2, 1) = 1.8540747… and E(1/√2) = 2R_G(0, 1/2, 1) = 1.3506439….
- By homogeneity and the dictionary, R_F(0, 1, 2) = 2^(−1/2) R_F(0, 1/2, 1) = K(1/√2)/√2 =
  1.3110288…, which is ϖ/2. One duplication step gives λ = √2 and the closer triple
  (√2/4, (1 + √2)/4, (2 + √2)/4), at which R_F takes the same value 1.3110288….

### Dependencies

Milestone 1 (the Legendre integrals, for the dictionary). Mathlib: improper integrals on
`Set.Ioi`, parametric differentiation of integrals, the principal power `Complex.cpow`, and the
identity theorem for analytic functions.

## Milestone 7: Jacobi elliptic functions of a real variable

Fix `k ^ 2 < 1` and write K = `legendreK k`.

### 7.1 Amplitude

The amplitude `jacobiAm k` is the inverse of the order isomorphism φ ↦ F(φ, k) of §1.4:
F(am(u), k) = u, am(F(φ, k)) = φ, and am(u) = φ exactly when F(φ, k) = u. It satisfies:
- it is continuous, strictly increasing and odd, with am(0) = 0, and even in the modulus;
- am(u + 2nK) = am(u) + nπ for every integer n, in particular am(u + 2K) = am(u) + π, and
  am(K) = π/2;
- `HasDerivAt (jacobiAm k) (jacobiDn k u) u`;
- `jacobiAm 0 = id`.

*Needs:* §1.3, §1.4, §1.5.

*In Tau Ceti:* `TauCeti.Real.coe_legendreFOrderIso_symm`, `TauCeti.Real.legendreF_jacobiAm`, `TauCeti.Real.jacobiAm_legendreF`, `TauCeti.Real.jacobiAm_eq_iff`, `TauCeti.Real.continuous_jacobiAm`, `TauCeti.Real.strictMono_jacobiAm`, `TauCeti.Real.jacobiAm_zero`, `TauCeti.Real.jacobiAm_neg`, `TauCeti.Real.jacobiAm_neg_modulus`, `TauCeti.Real.jacobiAm_add_two_mul_int_mul_legendreK`, `TauCeti.Real.jacobiAm_add_two_mul_legendreK`, `TauCeti.Real.jacobiAm_legendreK`, `TauCeti.Real.hasDerivAt_jacobiAm`, `TauCeti.Real.jacobiAm_zero_modulus`.

### 7.2 Identities

- sn² + cn² = 1 and dn² + k² sn² = 1.
- dn is positive and at most 1.
- sn is odd; cn and dn are even; sn(0) = 0 and cn(0) = dn(0) = 1.
- sn, cn and dn are continuous, and even in the modulus.

*Needs:* Convention 6, §7.1.

*In Tau Ceti:* `TauCeti.Real.jacobiSn_sq_add_jacobiCn_sq`, `TauCeti.Real.jacobiDn_sq`, `TauCeti.Real.jacobiDn_sq_add_sq_mul_jacobiSn_sq`, `TauCeti.Real.jacobiDn_pos`, `TauCeti.Real.jacobiDn_nonneg`, `TauCeti.Real.jacobiDn_le_one`, `TauCeti.Real.jacobiSn_neg`, `TauCeti.Real.jacobiCn_neg`, `TauCeti.Real.jacobiDn_neg`, `TauCeti.Real.jacobiSn_zero`, `TauCeti.Real.jacobiCn_zero`, `TauCeti.Real.jacobiDn_zero`, `TauCeti.Real.continuous_jacobiSn`, `TauCeti.Real.continuous_jacobiCn`, `TauCeti.Real.continuous_jacobiDn`, `TauCeti.Real.jacobiSn_neg_modulus`, `TauCeti.Real.jacobiCn_neg_modulus`, `TauCeti.Real.jacobiDn_neg_modulus`.

### 7.3 Derivatives

sn′ = cn · dn, cn′ = −sn · dn and dn′ = −k² sn · cn, as `HasDerivAt` statements. The first-order
equation (sn′)² = (1 − sn²)(1 − k² sn²) follows.

*Needs:* §7.1, §7.2; Mathlib `HasDerivAt.comp`.

*In Tau Ceti:* `TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.hasDerivAt_jacobiCn`, `TauCeti.Real.hasDerivAt_jacobiDn`, `TauCeti.Real.deriv_jacobiSn_sq`.

### 7.4 Periods and values

- sn and cn are 4K-periodic, and dn is 2K-periodic; sn and cn are 2K-antiperiodic:
  sn(u + 2K) = −sn u and cn(u + 2K) = −cn u.
- sn K = 1, cn K = 0 and dn K = √(1 − k²).

*Needs:* §7.1.

*In Tau Ceti:* `TauCeti.Real.jacobiSn_periodic`, `TauCeti.Real.jacobiCn_periodic`, `TauCeti.Real.jacobiDn_periodic`, `TauCeti.Real.jacobiSn_antiperiodic`, `TauCeti.Real.jacobiCn_antiperiodic`, `TauCeti.Real.jacobiSn_legendreK`, `TauCeti.Real.jacobiCn_legendreK`, `TauCeti.Real.jacobiDn_legendreK`.

Prove that 4K is the least positive period of sn(·, k): sn is 4K-periodic, and for 0 < p < 4K the
function sn(·, k) is not p-periodic (DLMF Table 22.4.1). At k = 0 this is the period 2π of sin.

*Route.* The zeros of sn are exactly the points 2nK, n ∈ ℤ, because am(u) ∈ πℤ exactly when
u ∈ 2Kℤ (§7.1: the quasi-periodicity, the strict monotonicity and am(0) = 0). A period p > 0 sends
the zero 0 to a zero, so p = 2nK with n ≥ 1, and sn(K + 2K) = −1 ≠ 1 = sn(K) rules out odd n.
*Needs:* the periods and values above (`TauCeti.Real.jacobiSn_periodic`,
`TauCeti.Real.jacobiSn_antiperiodic`, `TauCeti.Real.jacobiSn_legendreK`); §7.1
(`TauCeti.Real.jacobiAm_add_two_mul_int_mul_legendreK`, `TauCeti.Real.strictMono_jacobiAm`,
`TauCeti.Real.jacobiAm_zero`); §1.1 (`TauCeti.Real.legendreK_pos`); Mathlib `Function.Periodic`.

**Checks.**
- 2K is an antiperiod, not a period: sn(K + 2K) = −1 while sn(K) = 1. A claimed least period 2K
  fails here, as π fails for sin at k = 0.

### 7.5 The addition theorem

Prove `jacobiSn_add` (DLMF 22.8.1): for real u and v,
`sn(u + v) = (sn u cn v dn v + sn v cn u dn u) / (1 − k² sn²u sn²v)`, and its companions
(DLMF 22.8.2, 22.8.3):

```text
cn(u + v) = (cn u cn v − sn u dn u sn v dn v) / (1 − k² sn²u sn²v)
dn(u + v) = (dn u dn v − k² sn u cn u sn v cn v) / (1 − k² sn²u sn²v)
```

together with the positivity of the denominator 1 − k² sn²u sn²v, which is at least 1 − k² > 0.

*Route* (Euler's). Fix s and put v = s − u. The right side, as a function of u, has derivative 0
by the derivatives of §7.3 and the identities sn² + cn² = 1 and dn² + k² sn² = 1 of §7.2; at
u = 0 it equals sn(s). The same argument gives the companions.
*Needs:* §7.3 (`TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.hasDerivAt_jacobiCn`,
`TauCeti.Real.hasDerivAt_jacobiDn`); §7.2 (`TauCeti.Real.jacobiSn_sq_add_jacobiCn_sq`,
`TauCeti.Real.jacobiDn_sq_add_sq_mul_jacobiSn_sq`, `TauCeti.Real.jacobiSn_zero`,
`TauCeti.Real.jacobiCn_zero`, `TauCeti.Real.jacobiDn_zero`); Mathlib `is_const_of_deriv_eq_zero`.

**Checks.**
- v = K gives sn(u + K) = cn u dn u/(1 − k² sn²u) = cn u/dn u. At k² = 1/2 and u = 0.4 both
  sn(u + K) and cn u/dn u are 0.9592196…; with 1 + k² sn²u sn²v in the denominator the formula
  would give 0.8270594….
- u = v = K gives sn(2K) = (0 + 0)/(1 − k²) = 0, in agreement with the antiperiod 2K.

### 7.6 Degenerations

At k = 0, sn(·, 0) = sin, cn(·, 0) = cos and dn(·, 0) = 1 (DLMF Table 22.5.3).

*Needs:* §7.1 (`jacobiAm 0 = id`).

*In Tau Ceti:* `TauCeti.Real.jacobiSn_zero_modulus`, `TauCeti.Real.jacobiCn_zero_modulus`, `TauCeti.Real.jacobiDn_zero_modulus`.

Prove that for every real u, as k → 1⁻, `jacobiSn k u` tends to tanh u, `jacobiCn k u` to
1/cosh u and `jacobiDn k u` to 1/cosh u (DLMF Table 22.5.4).

*Route.* For |φ| < π/2, F(φ, k) increases to F(φ, 1) = artanh(sin φ) as k → 1⁻ (monotone
convergence of the integrand, §1.7 and §1.5). Inverting, am(u, k) tends to arcsin(tanh u), the
inverse of φ ↦ artanh(sin φ) on (−π/2, π/2); then sin, cos and √(1 − k² sin²) of the limit are
tanh u, 1/cosh u and 1/cosh u.
*Needs:* §1.5 (`TauCeti.Real.legendreF_one_modulus`); §1.7
(`TauCeti.Real.monotoneOn_legendreF_modulus`); §7.1 (`TauCeti.Real.legendreF_jacobiAm`,
`TauCeti.Real.jacobiAm_eq_iff`); §1.3 (`TauCeti.Real.legendreF_neg`); Mathlib `Real.artanh`,
`Real.tanh`, `intervalIntegral.tendsto_integral_filter_of_dominated_convergence`.

**Checks.**
- At u = 1: tanh 1 = 0.7615942 and 1/cosh 1 = 0.6480543. At k = 0.999999 the three functions are
  0.7615943, 0.6480541 and 0.6480550; at k = 0.9 they are 0.77764, 0.62871 and 0.71426, so cn and
  dn, which differ for k < 1, merge only in the limit.

### 7.7 The nonlinear pendulum

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
sn(·, k) is ωp-periodic, so §7.4 gives the least period. The limits are the continuity of K at 0
with K(0) = π/2, and K(k) → +∞ as k → 1⁻.
*Needs:* §7.4 (the least period, `TauCeti.Real.jacobiSn_periodic`,
`TauCeti.Real.jacobiSn_legendreK`, `TauCeti.Real.jacobiCn_legendreK`); §7.3
(`TauCeti.Real.hasDerivAt_jacobiSn`, `TauCeti.Real.hasDerivAt_jacobiCn`,
`TauCeti.Real.hasDerivAt_jacobiDn`); §7.2 (`TauCeti.Real.jacobiDn_pos`,
`TauCeti.Real.jacobiDn_sq_add_sq_mul_jacobiSn_sq`); §2.1 (`TauCeti.Real.continuousOn_legendreK`);
§1.5 (`TauCeti.Real.legendreK_zero`, `TauCeti.Real.tendsto_legendreK_nhdsLT_one`); Mathlib
`Real.arcsin`, `Real.arcsin_sin`, `ODE_solution_unique_univ`.

**Checks.**
- θ₀ = π/2: k = 1/√2 and the period is 4K(1/√2)/ω = 7.41630/ω, which is 1.180341 times the
  small-oscillation period 2π/ω. Reading the modulus as the parameter (k = sin²(θ₀/2) = 1/2) would
  give 1.073182 times.
- Without the shift by K(k), θ(t) = 2 arcsin(k sn(ωt, k)) starts at the bottom, θ(0) = 0, with
  velocity 2kω: the shift is what makes θ(0) = θ₀ and θ′(0) = 0.

### Examples

- At k = 0.6, sn(K/2) = 1/√(1 + k′) = 0.7453560…, cn(K/2) = √(k′/(1 + k′)) = 2/3 and
  dn(K/2) = √k′ = 0.8944272…, which satisfy sn² + cn² = 1 and dn² + k² sn² = 1.
- At k = 0 the addition theorem is the addition formula for sin, and sn(·, 0) = sin has least
  period 4K(0) = 2π.
- For θ₀ = π/3 the pendulum has k = 1/2 and period 4K(1/2)/ω = 6.74300/ω, 1.07318 times 2π/ω.

### Dependencies

Milestone 1 (the order isomorphism φ ↦ F(φ, k), the Legendre integral at k = 1 and the
monotonicity of F in the modulus, the value K(0) and the divergence of K) and Milestone 2 (the
continuity of K). Mathlib's uniqueness of ODE solutions, `Real.arcsin`, `Real.artanh` and
`Real.tanh`.

## Milestone 8: geometry and the Weierstrass bridge

### 8.1 Perimeter of an ellipse

Let γ(t) = a cos t + (b sin t) i, the curve `TauCeti.Green.Examples.ellipse a b`. For 0 < a and
b² ≤ a² (in particular for 0 < b ≤ a), with e = √(1 − b²/a²),
`eVariationOn γ (Set.Icc 0 (2π)) = ENNReal.ofReal (4 a · legendreEc e)` (DLMF 19.30.5), and
∫₀^(2π) ‖γ′(t)‖ dt = 4a E(e).

*Route.* `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` and the change of variables
t ↦ π/2 − t, which turns ‖γ′‖ = √(a² sin²t + b² cos²t) into a √(1 − e² sin²t).
*Needs:* Convention 2; Tau Ceti `TauCeti.Green.Examples.ellipse`,
`TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin`; Mathlib `eVariationOn`.

*In Tau Ceti:* `TauCeti.Green.Examples.eVariationOn_ellipse`, `TauCeti.Green.Examples.integral_norm_deriv_ellipse`.

Prove the case of the exchanged axes: for 0 < b and a² ≤ b²,
`eVariationOn γ (Set.Icc 0 (2π)) = ENNReal.ofReal (4 b · legendreEc √(1 − a²/b²))`.

*Route.* γ(t) = i · conj(δ(π/2 − t)), where δ(s) = b cos s + (a sin s) i is the ellipse with the
semi-axes exchanged; the map z ↦ i · conj z is an isometry of ℂ, so it preserves `eVariationOn`;
the antitone reparametrization t ↦ π/2 − t is `eVariationOn.comp_eq_of_antitoneOn`; and
2π-periodicity with `eVariationOn.Icc_add_Icc` moves the window [−3π/2, π/2] to [0, 2π].
*Needs:* the case above (`TauCeti.Green.Examples.eVariationOn_ellipse`); Tau Ceti
`TauCeti.Green.Examples.ellipse`; Mathlib `eVariationOn`, `eVariationOn.comp_eq_of_antitoneOn`,
`eVariationOn.Icc_add_Icc`.

**Checks.**
- a = 1, b = 2: the length is 8 E(√3/2) = 9.6884482…, the same as for a = 2, b = 1, as it must be.
  The formula of the case b² ≤ a², applied to a = 1, b = 2, would give 4 E(0) = 2π ≈ 6.2832,
  because Mathlib's square root of the negative 1 − b²/a² is 0: the exchanged case is a separate
  statement.

### 8.2 Cubic integrals, three real roots

Let e₃ < e₂ < e₁ be real, k = √((e₂ − e₃)/(e₁ − e₃)), D(x) = 4(x − e₁)(x − e₂)(x − e₃) and
κ = K(k). Prove (Byrd and Friedman, formula 236.00):
- the integral over (e₁, ∞) of D(x)^(−1/2) is κ/√(e₁ − e₃);
- the integral over (e₃, e₂) of D(x)^(−1/2) is κ/√(e₁ − e₃).

Both are stated as `lintegral`s of `ENNReal.ofReal (√(D x))⁻¹` over the open interval, equal to
`ENNReal.ofReal` of the right side, so that finiteness is part of the statement.

*Route.* The substitutions x = e₃ + (e₁ − e₃)/sin²φ on (e₁, ∞) and x = e₃ + (e₂ − e₃) sin²φ on
(e₃, e₂), φ ∈ (0, π/2), turn the two integrals into κ/√(e₁ − e₃).
*Needs:* Convention 2 (`TauCeti.Real.legendreF_def`, `TauCeti.Real.legendreK_def`); §1.1
(`TauCeti.Real.intervalIntegrable_legendreF_integrand`); Mathlib `MeasureTheory.lintegral`,
`MeasureTheory.integral_comp_mul_deriv_Ioi`, `intervalIntegral.integral_comp_mul_deriv`.

**Checks.**
- e = (1, 0, −1): k = 1/√2 and both integrals are K(1/√2)/√2 = 1.3110288…, which is half the
  lemniscate constant, ϖ/2, by §5.3.

### 8.3 Cubic integrals, one real root

Let e₁, a, b be real with b ≠ 0, A = √((e₁ − a)² + b²), k = √((A + a − e₁)/(2A)) and
D(x) = 4(x − e₁)((x − a)² + b²). Prove that the integral over (e₁, ∞) of D(x)^(−1/2) is K(k)/√A
(Byrd and Friedman, formula 239.00), stated as in §8.2 as a `lintegral` of
`ENNReal.ofReal (√(D x))⁻¹` over the open interval, equal to `ENNReal.ofReal` of the right side.

*Route.* The substitution cos φ = (A − (x − e₁))/(A + (x − e₁)), φ ∈ (0, π), turns the integral
into F(π, k)/(2√A) = K(k)/√A.
*Needs:* Convention 2 (`TauCeti.Real.legendreF_def`, `TauCeti.Real.legendreK_def`); §1.3
(`TauCeti.Real.legendreF_int_mul_pi`); §1.1 (`TauCeti.Real.intervalIntegrable_legendreF_integrand`);
Mathlib `MeasureTheory.lintegral`, `MeasureTheory.integral_comp_mul_deriv_Ioi`,
`intervalIntegral.integral_comp_mul_deriv`.

**Checks.**
- e₁ = 2, a = −1, b = 3: A = 3√2, k = 0.3826834…, and the integral is K(k)/√A = 0.7930927…;
  exchanging k and k′ (k² = (A − a + e₁)/(2A)) gives 1.1652261….

### 8.4 The real period

Let `W : WeierstrassCurve ℝ`.
- If `∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * (x - e₂) * (x - e₃)` with e₃ < e₂ < e₁, prove
  `realPeriod_eq_of_three_real_roots`, `W.realPeriod = 4 legendreK k / √(e₁ − e₃)` with
  k = √((e₂ − e₃)/(e₁ − e₃)), and `realPeriod_eq_two_mul_pi_div_agm_of_three_real_roots`,
  `W.realPeriod = 2π / agm √(e₁ − e₃) √(e₁ − e₂)`.
- If `∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * ((x - a) ^ 2 + b ^ 2)` with b ≠ 0, and A and k are as
  in §8.3, prove `realPeriod_eq_of_one_real_root`, `W.realPeriod = 2 legendreK k / √A`, and
  `realPeriod_eq_two_mul_pi_div_agm_of_one_real_root`,
  `W.realPeriod = 2π / agm (2√A) √(2A + 2(e₁ − a))`.

The AGM arguments are reals coerced through `Real.toNNReal` (Convention 5). These pin the period
of the Birch–Swinnerton-Dyer quotient to an AGM that converges quadratically (§4.1; Cremona §3.7).

*Route.* The set where `Ψ₂Sq` is positive is (e₃, e₂) ∪ (e₁, ∞) in the first case and (e₁, ∞) in
the second, and §8.2 and §8.3 evaluate the integral of `WeierstrassCurve.realPeriodLIntegral`
over it, which is finite. For the AGM forms, Gauss's theorem (§4.4) with
k′ = √((e₁ − e₂)/(e₁ − e₃)), respectively k′² = (A + e₁ − a)/(2A), and the homogeneity
`NNReal.agm_mul_distrib` give 4K/√(e₁ − e₃) = 2π/M(√(e₁ − e₃), √(e₁ − e₂)) and
2K/√A = π/M(√A, √((A + e₁ − a)/2)) = 2π/M(2√A, √(2A + 2(e₁ − a))).
*Needs:* §8.2, §8.3; §4.4 (`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`); Tau Ceti
`WeierstrassCurve.realPeriod_def`, `WeierstrassCurve.realPeriodLIntegral_def`; Mathlib
`WeierstrassCurve.Ψ₂Sq`, `NNReal.agm`, `NNReal.agm_mul_distrib`.

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
  r has 4rE(0) = 2πr from either case of §8.1.

### Dependencies

Milestone 1 (the Legendre integrals with their integrability and quasi-period in φ) and
Milestone 4 (Gauss's theorem and quadratic convergence). Tau Ceti: the ellipse curve, the arc
length of a C¹ curve, and the real period with its defining integral. Mathlib: `eVariationOn` and
its reparametrization lemmas, Lebesgue integrals and changes of variables,
`WeierstrassCurve.Ψ₂Sq`, and `NNReal.agm` with its homogeneity.

## Downstream consumers

- [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) takes DLMF
  15.9.24–15.9.25 for real k with k² < 1 from §2.4, `TauCeti.Real.legendreK_eq_ordinaryHypergeometric`
  and `TauCeti.Real.legendreEc_eq_ordinaryHypergeometric`.
- [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) Layer 6 (§§6.3–6.4) uses
  `TauCeti.Real.legendreK` with its AGM, hypergeometric and Carlson forms (§4.4, §2.4, §6.6).

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
from scratch; its proofs rest on Carlson's general R-function, so a port re-bases them on the
direct integral definitions of Convention 4 rather than copying that layer. The table records,
for each milestone, its counterparts in `lean-codes` (files under `Carlson/Elliptic/`, at commit
`2b8cba1`) and what is not covered there.

| Milestone | Counterpart in `lean-codes` | Not covered there |
|---|---|---|
| 1. Legendre integrals | `LegendreStandard`, `LegendreThird`, `ZeroVariable` | |
| 2. Complete integrals in the modulus | `CompleteK` (imaginary modulus, Landen for K) | derivatives in k, Legendre's differential equations, the ₂F₁ series |
| 3. Singularity at k = 1, Legendre's relation | `Asymptotic` (logarithmic asymptotics in Carlson form) | Legendre's relation |
| 4. AGM | `AGMSecondKind`, `LandenAlgorithm`, `Landen` | Gauss's formula for K through the AGM integral, Brent–Salamin |
| 5. Special values | lemniscate arc-length exercises in `ArcLengthExercises` | K(1/√2), E(1/√2), the lemniscate constant |
| 6. Carlson integrals | `RF`, `Standard`, `Addition`, `ReductionTables` | |
| 7. Real Jacobi functions | `Inversion`; a complex sn via `SchwarzChristoffel` | real am, sn, cn, dn and the explicit pendulum solution |
| 8. Geometry and the real period | `Applications` (pendulum, ellipse) | the AGM formula for `WeierstrassCurve.realPeriod` |

## Scope and ownership

**This roadmap owns** real-variable statements about the Legendre integrals, the AGM and the
Jacobi functions of a real argument, plus Carlson's integrals on slit-plane nodes. Its targets are
Milestones 1–8 above; the items that the pinned Tau Ceti proves name the declarations that realise
them.

**Owned elsewhere.**
- [EllipticCurves](../EllipticCurves/README.md) Layer 7 owns the real period of the global minimal
  model and the Birch–Swinnerton-Dyer quotient that uses it; the real period itself, its
  definition by an explicit integral, finiteness, positivity and behaviour under change of
  variables are Tau Ceti's at the pin. Milestone 8 here evaluates that integral by K and by the
  AGM. It consumes the definition and changes nothing in it.
- *Lattice functions*: ℘ beyond Mathlib, the Weierstrass ζ and σ functions, the quasi-periods, the
  lattice form of Legendre's relation (η₁ω₂ − η₂ω₁ = 2πi) and the uniformization ℂ/Λ ≅ E(ℂ)
  belong to the lattice roadmaps; [ModularCurvesPartII](../ModularCurvesPartII/README.md) states
  the uniformization (§1.1) and σ, the quasi-periods and the lattice Legendre relation (§1.4a).
  Nothing here uses them. Legendre's relation here (§3.2) is the identity between the real
  functions K and E; identifying it with the lattice relation is a statement about lattices and
  belongs there.
- [ConformalMapping](../../Completed/ConformalMapping/README.md) (Layer 6) owns Schwarz–Christoffel
  maps. The map of the upper half-plane onto a rectangle is an incomplete integral of the first
  kind, and it may consume Milestone 1. This roadmap constructs no conformal maps.
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

## Exact supplier contracts

### From Mathlib

- *The AGM* (`Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`, namespace
  `NNReal`): `agm`, `agmSequences` (its `n`-th term is the pair (geometric mean, arithmetic mean)
  after n + 1 steps; `agmSequences_zero`, `agmSequences_succ'`), `agm_comm`, `agm_self`,
  `agm_mul_distrib`, `agm_eq_agm_gm_am`, `agm_pos`, `min_le_agm`, `agm_le_max`,
  `agmSequences_fst_monotone`, `agmSequences_snd_antitone`, `agmSequences_fst_le_snd`,
  `tendsto_agmSequences_fst_agm`, `tendsto_agmSequences_snd_agm`, `dist_agmSequences_fst_snd` and
  `tendsto_dist_agmSequences_atTop_zero`. Mathlib proves only the halving bound on `dist`; the
  quadratic bound is §4.1.
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
- *Elementary functions*: `Real.arcsin` with `Real.arcsin_sin`, `Real.arccos`, `Real.arctan`,
  `Real.artanh`, `Real.arcosh`, `Real.arsinh`, `Real.tanh`, `Complex.slitPlane`, `Complex.cpow`.
- *Analytic functions*: `AnalyticOnNhd`, `DifferentiableOn`, `DifferentiableOn.comp`,
  `DifferentiableOn.analyticOnNhd`, `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`,
  `is_const_of_deriv_eq_zero`.
- *ODEs*: `ODE_solution_unique_univ` and `ODE_solution_unique_of_mem_Icc`.
- *Arc length*: `eVariationOn`, the length of a curve, with `eVariationOn.Icc_add_Icc` and
  `eVariationOn.comp_eq_of_antitoneOn`.
- *Weierstrass curves*: `WeierstrassCurve` and `WeierstrassCurve.Ψ₂Sq`.

### From Tau Ceti

Paths are under `TauCeti/`. The declarations that realise this roadmap's own items, in
`Analysis/SpecialFunctions/EllipticIntegral/`, `Analysis/SpecialFunctions/JacobiElliptic/` and
`Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`, are named in the milestones above. The
roadmap also consumes the following declarations, which it does not own; all are proved at the pin.

- *The ellipse curve* (`Analysis/Green/Examples/CurveArea/Ellipse.lean`, namespace
  `TauCeti.Green.Examples`): `ellipse` (`ellipse a b t = (a cos t : ℝ) + (b sin t : ℝ) * I`), with
  `ellipse_apply` and `hasDerivAt_ellipse`.
- *Arc length* (`Analysis/Calculus/MetricVariation.lean`):
  `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` (the variation of a C¹ curve is `∫⁻ ‖γ′‖ₑ`).
- *The real period* (`AlgebraicGeometry/EllipticCurve/RealPeriod.lean`, namespace
  `WeierstrassCurve`, owned by EllipticCurves): `realPeriodLIntegral`, `realPeriod`
  (Convention 8), `realPeriodLIntegral_def`, `realPeriod_def`, `realPeriodLIntegral_eq_lintegral`,
  `realPeriodLIntegral_pos`, `realPeriodLIntegral_lt_top` (`[W.IsElliptic]`), `ofReal_realPeriod`,
  `realPeriod_pos`, `realPeriod_variableChange`.

## References

- NIST *Digital Library of Mathematical Functions*, Chapters 19 (elliptic integrals) and 22
  (Jacobian elliptic functions), <https://dlmf.nist.gov/19>, <https://dlmf.nist.gov/22>.
- B. C. Carlson, *Special Functions of Applied Mathematics*, Academic Press, 1977, Chapter 9.
- B. C. Carlson, Numerical computation of real or complex elliptic integrals, *Numer. Algorithms*
  10 (1995), 13–26, arXiv:math/9409227 (equation numbers as in the arXiv version).
- J. M. Borwein and P. B. Borwein, *Pi and the AGM*, Wiley, 1987, Chapters 1–2.
- P. F. Byrd and M. D. Friedman, *Handbook of Elliptic Integrals for Engineers and Scientists*,
  2nd ed., Springer, 1971, formulas 236.00 and 239.00.
- E. Salamin, Computation of π using arithmetic-geometric mean, *Math. Comp.* 30 (1976), 565–570.
- J. E. Cremona, *Algorithms for Modular Elliptic Curves*, 2nd ed., Cambridge, 1997, §3.7.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, Chapter XXII.
- B. Braams, `lean-codes`, <https://github.com/bjbraams/lean-codes>, directory `Carlson/Elliptic/`
  at commit `2b8cba1` (Apache-2.0).
