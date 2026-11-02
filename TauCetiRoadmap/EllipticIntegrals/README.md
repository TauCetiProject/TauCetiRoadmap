# Elliptic integrals, the AGM, and Jacobi elliptic functions

This roadmap builds the classical real theory of elliptic integrals as a library:
- Legendre's incomplete and complete integrals of the first, second and third kinds.
- Their dependence on the modulus.
- Their evaluation by the arithmetic–geometric mean (AGM) and by Landen's transformation.
- Legendre's relation and the classical special values.
- Carlson's symmetric integrals.
- The Jacobi elliptic functions of a real variable, obtained by inverting the integral of the
  first kind.

Its applications are part of the roadmap:
- The arc length of an ellipse.
- The exact motion and period of the nonlinear pendulum.
- The Gauss–Brent–Salamin formula for `π`.
- An exact AGM formula for the real period `WeierstrassCurve.realPeriod` of an elliptic curve
  over `ℝ`. That formula is how the period in the Birch–Swinnerton-Dyer quotient is actually
  computed.

Suggested homes are `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/` (Milestones 1–6 and 8)
and `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/` (Milestone 7). Both sit beside Mathlib's
`Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` and
`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti proves all of the following.

1. **Legendre integrals.** `F(φ, k)`, `E(φ, k)`, `Π(φ, k, α²)` and their complete values `K(k)`,
   `E(k)`, `Π(k, α²)` are defined for real arguments. Each has full basic API: integrability,
   parity, quasi-periodicity in `φ`, the algebraic substitution, monotonicity, the degenerate
   moduli `k = 0` and `k = 1`, and the elementary reductions of the third kind.
2. **The complete integrals as functions of `k`.** This covers continuity, the derivative
   formulas, Legendre's differential equations, the hypergeometric series, the logarithmic
   singularity at `k = 1`, and **Legendre's relation** `E K′ + E′ K − K K′ = π/2`.
3. **The AGM.** This covers quadratic convergence, Gauss's theorem `K(k) = π / (2 M(1, k′))`,
   Landen's transformation of `K` and `E`, the AGM evaluation of `E`, and the
   Gauss–Brent–Salamin formula for `π`.
4. **Special values.** These are `K(1/√2) = Γ(1/4)² / (4√π)`, the companion value of `E(1/√2)`,
   and the lemniscate constant `ϖ` with its three classical evaluations.
5. **Carlson's symmetric integrals** `R_F, R_D, R_J, R_C, R_G` on the complex slit plane, with
   their symmetry, homogeneity, holomorphy, duplication theorem, elementary `R_C`, and the
   dictionary with the Legendre integrals.
6. **Jacobi elliptic functions of a real variable.** These are the amplitude `am` as an order
   isomorphism of `ℝ`, and `sn`, `cn`, `dn` with derivatives, periods, the addition theorem and
   the degenerations at `k = 0` and `k → 1`. They are applied to the nonlinear pendulum: an
   explicit solution, uniqueness, and the period `4K(sin(θ₀/2))/ω`.
7. **Geometry and the Weierstrass bridge.** The perimeter of an ellipse is `4aE(e)`. A real
   cubic integral evaluates in terms of `K`. Hence `WeierstrassCurve.realPeriod` is given by
   explicit `K` and AGM formulas, in both the one-component and the two-component cases.

**What this roadmap owns:** real-variable statements about the Legendre integrals, the AGM, and
the Jacobi functions of a real argument, plus Carlson's integrals on slit-plane nodes.

**What it does not own:**
- Anything about a lattice in `ℂ`.
- Analytic continuation in the modulus.
- The complex Jacobi functions as elliptic functions.
- Theta functions and the modular `λ`.
- Cauchy principal values.

## Ownership and dependencies

- **[EllipticCurves](../EllipticCurves/README.md)** owns `WeierstrassCurve.realPeriod` (its
  definition by an explicit integral, finiteness, positivity, and behaviour under change of
  variables) and the Birch–Swinnerton-Dyer quotient that uses it. Milestone 8 here proves the
  evaluation of that integral by `K` and by the AGM. It consumes the definition and changes
  nothing in it.
- **Lattice functions.** These are ℘ beyond Mathlib, the Weierstrass `ζ` and `σ` functions,
  quasi-periods, the lattice form of Legendre's relation (`η₁ω₂ − η₂ω₁ = 2πi`), and the
  uniformisation `ℂ/Λ ≅ E(ℂ)`. They belong to the lattice roadmaps:
  [GrothendieckPeriodConjecture](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1059)
  and [ModularCurves part II](https://github.com/TauCetiProject/TauCetiRoadmap/pull/913).
  Nothing here uses them. Legendre's relation here is the identity between the real functions
  `K` and `E`, proved by differentiation (Milestone 3). Identifying it with the lattice relation
  is a statement about lattices and belongs there.
- **[ConformalMapping](../../Completed/ConformalMapping/README.md)** owns Schwarz–Christoffel maps. The map
  of the upper half-plane onto a rectangle is an incomplete integral of the first kind, and it
  may consume Milestone 1. This roadmap constructs no conformal maps.
- **[DiophantineApproximationAndTranscendence](../DiophantineApproximationAndTranscendence/README.md)**
  owns transcendence statements. Values such as `K(1/√2)` and `ϖ` are computed here, and their
  transcendence is not.

**The boundary in one sentence:**
- A real-variable statement about the Legendre or Carlson integrals, the AGM, or a Jacobi
  function of a real argument is here.
- A statement about a lattice in `ℂ` or a meromorphic function on `ℂ/Λ` is in the lattice
  roadmaps.
- A statement about a Weierstrass equation over a field is in EllipticCurves.

## Mathlib and Tau Ceti inventory

Consume these; do not rebuild them.

- **AGM.** [`NNReal.agm`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/ArithmeticGeometricMean.html),
  `NNReal.agmSequences` (whose `n`-th term is the pair (geometric mean, arithmetic mean)),
  `agm_comm`, `agm_self`, `agm_mul_distrib`, `agm_eq_agm_gm_am`, `min_le_agm`, `agm_le_max`, the
  monotonicity and convergence lemmas of `agmSequences`, and `tendsto_dist_agmSequences_atTop_zero`.
  Mathlib proves only the halving bound on `dist`. Quadratic convergence is Milestone 4.
- **Hypergeometric series.** `ordinaryHypergeometric` (notation `₂F₁`),
  `ordinaryHypergeometric_eq_tsum`, `ordinaryHypergeometricSeries_radius_eq_one`.
- **Gamma and Beta.** `Real.Gamma`, `Real.Gamma_one_half_eq`, `Complex.betaIntegral`,
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`.
- **Integration.** `intervalIntegral` and its fundamental theorem (`integral_hasDerivAt_right`,
  `integral_comp_mul_deriv`), improper integrals on `Set.Ioi` (`integrableOn_Ioi_rpow_of_lt`,
  `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`), and parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`).
- **Elementary functions.** `Real.arcsin`, `Real.arctan`, `Real.artanh`, `Real.arcosh`,
  `Real.tanh`, `Complex.slitPlane`, `Complex.cpow`.
- **ODEs.** `ODE_solution_unique_univ` and `ODE_solution_unique_of_mem_Icc`.
- **Arc length.** Mathlib's `eVariationOn` is the length of a curve. Tau Ceti's
  `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin`
  (`TauCeti/Analysis/Calculus/MetricVariation.lean`) evaluates it for a `C¹` curve as
  `∫⁻ ‖γ′‖ₑ`.
- **Real period.** Tau Ceti's `WeierstrassCurve.realPeriodLIntegral` and
  `WeierstrassCurve.realPeriod` (`TauCeti/AlgebraicGeometry/EllipticCurve/RealPeriod.lean`), with
  `realPeriodLIntegral_eq_lintegral`, `realPeriodLIntegral_lt_top`, `ofReal_realPeriod`,
  `realPeriod_pos`, and Mathlib's `WeierstrassCurve.Ψ₂Sq`.

**Mathlib has none of the following:**
- elliptic integrals, Carlson's integrals, or Jacobi elliptic functions;
- the lemniscate constant;
- the integral representation of the AGM.

That integral representation is
[mathlib4#34397](https://github.com/leanprover-community/mathlib4/pull/34397). It defines

```lean
noncomputable def agmIntegral (a b : ℝ) : ℝ :=
  ∫ x in Set.Ioi 0, (√((x ^ 2 + a ^ 2) * (x ^ 2 + b ^ 2)))⁻¹
```

and proves `agmIntegral_eq_pi_div_two_div_agm : agmIntegral a b = π / 2 / agm a b` for
`a b : ℝ≥0`. Milestone 4 builds exactly this definition and theorem, under these names in the
`TauCeti` namespace, so that adopting Mathlib's version is a deletion plus an import.

## Prior formalization

B. Braams' [`lean-codes`](https://github.com/bjbraams/lean-codes) (Apache-2.0) formalizes
B. C. Carlson's *Special Functions of Applied Mathematics* on top of Mathlib and Tau Ceti. Its
`Carlson/Elliptic/` directory covers much of the mathematics of this roadmap: the Legendre
integrals, `R_F` and the other symmetric integrals, Landen's transformation, the duplication
theorem, Euler's addition theorem, the AGM evaluation of the complete integral of the second
kind, the pendulum and ellipse integrals, and a complex Jacobi `sn` built as a
Schwarz–Christoffel map. Its foundation is Carlson's general `R`-function, a Dirichlet average
over the standard simplex. That machinery is much larger than this roadmap needs, and it is not
part of this roadmap.

This roadmap specifies the mathematics intrinsically. It adopts that formalization's
conventions (modulus `k`; `legendreF`, `legendreE`, `legendrePi`, `legendreK`, `legendreEc`
with argument order `(φ, k)` and `(φ, k, α²)`), so the two developments stay interoperable.

The author has endorsed this roadmap on Zulip (`#Tau Ceti > Getting started: roadmaps`).
Implementers should treat `lean-codes` as the first source to port from, with attribution, before
proving anything from scratch. Its proofs rest on Carlson's general `R`-function, so a port
re-bases them on this roadmap's direct integral definitions (Milestone 6) rather than copying
that layer. The table records where each milestone already has a counterpart there (files under
`Carlson/Elliptic/`, checked at commit `2b8cba1`) and what is new.

| Milestone | Counterpart in `lean-codes` | Not covered there |
|---|---|---|
| 1. Legendre integrals | `LegendreStandard`, `LegendreThird`, `ZeroVariable` | |
| 2. Complete integrals | `CompleteK` (imaginary modulus, Landen for `K`) | derivatives in `k`, Legendre's differential equations, `₂F₁` series |
| 3. Singularity, Legendre's relation | `Asymptotic` (logarithmic asymptotics in Carlson form) | Legendre's relation |
| 4. AGM | `AGMSecondKind`, `LandenAlgorithm`, `Landen` | Gauss's `K` formula in this form (see mathlib4#34397), Brent–Salamin |
| 5. Special values | lemniscate arc-length exercises in `ArcLengthExercises` | `K(1/√2)`, `E(1/√2)`, the lemniscate constant |
| 6. Carlson integrals | `RF`, `Standard`, `Addition`, `ReductionTables` | |
| 7. Real Jacobi functions | `Inversion`; a complex `sn` via `SchwarzChristoffel` | real `am/sn/cn/dn` and the explicit pendulum solution |
| 8. Geometry, Weierstrass | `Applications` (pendulum, ellipse) | the AGM formula for `WeierstrassCurve.realPeriod` |

## Conventions (pinned)

- **Modulus, not parameter.** Every integral takes the **modulus** `k : ℝ`, as in DLMF Chapter 19
  and Carlson. The parameter `m = k²` never appears as an argument. The complementary modulus
  is `k′ = √(1 − k²)`, written out, and `K′(k)` means `legendreK √(1 − k²)`; neither gets its own
  definition.
- **Legendre integrals** (DLMF 19.2.4, 19.2.5, 19.2.7), in the namespace `TauCeti.Real`:

  ```text
  legendreF  φ k    = ∫₀^φ (1 − k² sin²θ)^(−1/2) dθ
  legendreE  φ k    = ∫₀^φ (1 − k² sin²θ)^(1/2) dθ
  legendrePi φ k α² = ∫₀^φ (1 − α² sin²θ)⁻¹ (1 − k² sin²θ)^(−1/2) dθ
  legendreK  k      = legendreF (π/2) k
  legendreEc k      = legendreE (π/2) k
  legendrePic k α²  = legendrePi (π/2) k α²
  ```

  The integrals are `intervalIntegral`s, and the powers are `Real.rpow` with exponents
  `-1/2 : ℝ` and `1/2 : ℝ`. These are total functions of real arguments. Their values are
  meaningful under the hypotheses `k ^ 2 < 1` and `α2 < 1`, which every theorem states
  explicitly. The one exception is the `k = 1` statements of Milestone 1, which carry
  `|φ| < π/2` instead. Positivity and integrability theorems come first, so that a junk value
  is never mistaken for a result.
- **Third kind.** `α2` is a real number, written `α²` in prose and allowed to be negative. Only
  `α2 < 1` is in scope: for `α2 > 1` the integral is a Cauchy principal value, which this roadmap
  does not treat.
- **Carlson integrals** (DLMF 19.16.1, 19.16.2, 19.16.3, 19.16.5, 19.2.17), in the namespace
  `TauCeti.Complex`, with principal powers `(t + x) ^ (-(1/2) : ℂ)` of each factor:

  ```text
  carlsonRF x y z   = ½ ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½) dt
  carlsonRJ x y z p = (3/2) ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½) (t+p)⁻¹ dt
  carlsonRD x y z   = carlsonRJ x y z z
  carlsonRC x y     = carlsonRF x y y
  carlsonRG x y z   = ¼ ∫₀^∞ (t+x)^(−½) (t+y)^(−½) (t+z)^(−½)
                          · (x/(t+x) + y/(t+y) + z/(t+z)) · t dt
  ```

  The domain is: `x, y, z ∈ slitPlane ∪ {0}` with at most one of them `0`, and
  `p ∈ slitPlane`. For `carlsonRD` the repeated argument `z` lies in `slitPlane`. These
  definitions are the specification. An implementation may define the functions differently,
  for instance through Carlson's `R`-function, provided it proves these integral formulas on
  this domain.
- **AGM.** Mathlib's `NNReal.agm` is the AGM. Statements about real numbers coerce through
  `Real.toNNReal` or `NNReal` literals rather than introducing a real-valued copy.
- **Jacobi functions.** In the namespace `TauCeti.Real`, `jacobiAm k`, `jacobiSn k`, `jacobiCn k`
  and `jacobiDn k` are functions `ℝ → ℝ`, with the modulus first, so that
  `Function.Periodic (jacobiSn k) (4 * legendreK k)` reads directly. They are defined for
  `k ^ 2 < 1`:
  - `jacobiAm k` is the inverse of `fun φ ↦ legendreF φ k`;
  - `jacobiSn k = sin ∘ jacobiAm k` and `jacobiCn k = cos ∘ jacobiAm k`;
  - `jacobiDn k u = √(1 − k² (jacobiSn k u)²)`.

  Complex-variable versions belong to the `TauCeti.Complex` namespace and to a later roadmap
  (see the last section).
- **Lemniscate constant.** `TauCeti.Real.lemniscateConstant = 2 ∫₀¹ (1 − t⁴)^(−1/2) dt`
  (`ϖ ≈ 2.62206`).
- **Real cubic.** In Milestone 8 the roots of `Ψ₂Sq` are given as explicit real or complex
  numbers together with a factorization hypothesis `∀ x, W.Ψ₂Sq.eval x = …`. No root-selection
  function is introduced.

## Milestone 1: the Legendre integrals

1. **Integrands.**
   - For `k ^ 2 < 1` and `α2 < 1`, the three integrands are continuous and positive on `ℝ`, and
     bounded above and below by explicit constants. All three integrals are interval-integrable
     on every bounded interval.
   - `legendreF φ k` and `legendreE φ k` are positive for `φ > 0`. `legendreK k` and
     `legendreEc k` are positive.
2. **Algebraic form** (DLMF 19.2.4, second forms). For `|φ| ≤ π/2`:
   - `legendreF φ k = ∫₀^{sin φ} ((1 − t²)(1 − k²t²))^(−1/2) dt`;
   - the analogous formulas hold for `legendreE` and `legendrePi`.

   At `φ = π/2` the integral is improper at `t = 1`, and integrability there is part of the
   statement.
3. **Symmetries and periodicity.**
   - `F`, `E` and `Π` are odd in `φ` and even in `k`.
   - `legendreF (φ + π) k = legendreF φ k + 2 * legendreK k`, and likewise for `E` with
     `legendreEc` and for `Π` with `legendrePic`. Hence also `legendreF (n * π) k = 2 * n * legendreK k`.
4. **Derivatives and monotonicity in `φ`.**
   - `HasDerivAt (legendreF · k) ((1 − k² sin²φ)^(−1/2)) φ`, and likewise for `E` and `Π`.
   - `legendreF · k` and `legendreE · k` are strictly increasing.
   - `legendreF · k` is an order isomorphism `ℝ ≃o ℝ` (unbounded by step 3). This is the input
     to Milestone 7.
5. **Degenerate moduli.**
   - `legendreF φ 0 = φ` and `legendreE φ 0 = φ`.
   - `legendreK 0 = legendreEc 0 = π/2`.
   - For `|φ| < π/2`: `legendreF φ 1 = artanh (sin φ)` and `legendreE φ 1 = sin φ`.
   - `legendreEc 1 = 1`.
   - `legendreK` tends to `+∞` as `k → 1⁻`. The statement is a `Tendsto` to `atTop`, not a
     value at `1`.
6. **Elementary third-kind reductions** (DLMF 19.6.11, 19.6.13):
   - `legendrePi φ k 0 = legendreF φ k`.
   - For `α2 < 1` and `|φ| < π/2`,
     `legendrePi φ 0 α2 = arctan (√(1 − α2) tan φ) / √(1 − α2)`.
   - For `k ^ 2 < 1`,
     `legendrePi φ k (k²) = (legendreE φ k − k² sin φ cos φ / √(1 − k² sin² φ)) / (1 − k²)`.
7. **Monotonicity in `k`.**
   - On `[0, 1)`, `legendreK` is strictly increasing and `legendreEc` strictly decreasing.
   - `legendreEc k ≤ π/2 ≤ legendreK k`, with equality only at `k = 0`.
   - `legendreF φ k` is increasing in `k ∈ [0, 1)` for `φ ≥ 0`.
8. **Imaginary modulus** (DLMF 19.7.5, complete case). For real `c`,
   `∫₀^{π/2} (1 + c² sin²θ)^(−1/2) dθ = legendreK (c / √(1 + c²)) / √(1 + c²)`.

## Milestone 2: the complete integrals as functions of the modulus

1. `legendreK`, `legendreEc` and `legendrePic · α2` are continuous on `{k | k ^ 2 < 1}`.
   `legendreEc` is also continuous at `±1`.
2. **Derivatives** (DLMF 19.4.1). For `0 < k < 1`:
   - `HasDerivAt legendreK ((legendreEc k − (1 − k²) legendreK k) / (k (1 − k²))) k`;
   - `HasDerivAt legendreEc ((legendreEc k − legendreK k) / k) k`.

   At `k = 0` both derivatives are `0`. The proof route is differentiation under the integral
   sign, followed by one integration by parts.
3. **Legendre's differential equations.** For `0 < k < 1`:
   - `k(1 − k²) K″ + (1 − 3k²) K′ − k K = 0`;
   - `k(1 − k²) E″ + (1 − k²) E′ + k E = 0`.

   They are stated with `deriv` and `deriv^[2]`, together with the twice-differentiability
   of `K` and `E`.
4. **Hypergeometric series** (DLMF 19.5.1, 19.5.2). For `k ^ 2 < 1`:
   - `legendreK k = π/2 * ₂F₁ (1/2) (1/2) 1 (k ^ 2)`;
   - `legendreEc k = π/2 * ₂F₁ (-1/2) (1/2) 1 (k ^ 2)`.

   Both use Mathlib's `ordinaryHypergeometric` over `ℝ`. The proof expands the integrand
   binomially and integrates term by term with the Wallis integrals.
5. **Analyticity.** `legendreK` and `legendreEc` are `AnalyticOnNhd ℝ` on `Set.Ioo (-1) 1`, a
   consequence of step 4.

## Milestone 3: the logarithmic singularity and Legendre's relation

1. **Behaviour at `k = 1`** (DLMF 19.12.1). As `k → 1⁻`:
   - `legendreK k − log (4 / √(1 − k²)) → 0`;
   - `legendreEc k → 1`;
   - `(1 − k²) * legendreK k → 0`.
2. **Legendre's relation** (DLMF 19.7.1). For `0 < k < 1`, with `k′ = √(1 − k²)`:

   `legendreEc k * legendreK k′ + legendreEc k′ * legendreK k − legendreK k * legendreK k′ = π/2`.

   Proof route: by Milestone 2 the left side has derivative `0` on `(0, 1)`. Evaluate its limit
   as `k → 0⁺` using step 1 applied at `k′ → 1⁻` and the series of Milestone 2.

## Milestone 4: the arithmetic–geometric mean

1. **Quadratic convergence.** For `0 < y ≤ x`, one AGM step shrinks the gap quadratically:
   `(x + y)/2 − √(xy) ≤ (x − y)² / (8y)`. Since the geometric means increase, it follows that
   `(agmSequences x y n).2 − (agmSequences x y n).1 ≤ 8y · ((x − y) / (8y)) ^ 2 ^ (n + 1)` for
   all `n`. Mathlib's `agmSequences x y 0` is already one step in. This complements Mathlib's
   halving bound.
2. **The AGM integral.** Build `TauCeti.agmIntegral` and
   `TauCeti.agmIntegral_eq_pi_div_two_div_agm` exactly as specified in the inventory, together
   with the integrability, symmetry and invariance `agmIntegral a b = agmIntegral √(ab) ((a+b)/2)`
   on which the proof rests.
3. **Trigonometric form.** For `a, b > 0`,
   `∫₀^{π/2} (a² cos²θ + b² sin²θ)^(−1/2) dθ = agmIntegral a b`.
4. **Gauss's theorem.** For `k ^ 2 < 1`, `legendreK k = π / (2 * agm 1 √(1 − k²))`.
5. **Landen's transformation** (DLMF 19.8.12, descending form). For `0 ≤ k < 1`, with
   `k′ = √(1 − k²)` and `k₁ = (1 − k′)/(1 + k′)`:
   - `legendreK k = (1 + k₁) * legendreK k₁`;
   - `legendreEc k = (1 + k′) * legendreEc k₁ − k′ * legendreK k`.

   Also prove the ascending forms obtained by solving for `k₁`.
6. **The AGM evaluation of `E`** (DLMF 19.8.6). Run the AGM from `a₀ = 1`, `g₀ = k′`, with
   `c₀ = k` and `cₙ₊₁ = (aₙ − gₙ)/2`. Then `∑ 2^(n−1) cₙ²` is summable and
   `legendreEc k = legendreK k * (1 − ∑' n, 2^(n−1) cₙ²)`.
7. **The Gauss–Brent–Salamin formula.** Run the AGM from `a₀ = 1`, `g₀ = 1/√2`, with
   `cₙ² = aₙ² − gₙ²`. Then `π = 4 agm(1, 1/√2)² / (1 − ∑'_{n ≥ 1} 2^(n+1) cₙ²)`. The proof
   combines step 6 at `k = 1/√2` with Legendre's relation.

## Milestone 5: special values

1. `legendreK (1/√2) = Γ(1/4)² / (4 √π)`. The route is the algebraic form, the substitution
   `t ↦ t⁴`, a Beta integral, and the reflection formula.
2. `legendreEc (1/√2) = legendreK (1/√2) / 2 + π / (4 legendreK (1/√2))`, from Legendre's
   relation with `k = k′`.
3. **The lemniscate constant** `ϖ = lemniscateConstant`:
   - `ϖ = √2 · legendreK (1/√2)`;
   - `ϖ = Γ(1/4)² / (2 √(2π))`;
   - **Gauss's identity** `ϖ = π / agm 1 √2`, which combines step 1 with Milestone 4.

## Milestone 6: Carlson's symmetric integrals

1. **Convergence and holomorphy.** On the domain fixed in the conventions:
   - each defining integral converges absolutely;
   - each function is holomorphic in each variable separately on `slitPlane`, the others being
     fixed;
   - each takes positive real values at positive real arguments.
2. **Symmetry and homogeneity.**
   - `carlsonRF` and `carlsonRG` are symmetric in `x, y, z`. `carlsonRJ` is symmetric in its
     first three arguments.
   - For real `λ > 0`: `carlsonRF (λx) (λy) (λz) = λ^(−1/2) carlsonRF x y z`, and
     correspondingly with exponent `−3/2` for `carlsonRJ` and `carlsonRD`, and `1/2` for
     `carlsonRG`.
3. **Diagonal values.**
   - `carlsonRF x x x = x^(−1/2)`, `carlsonRC x x = x^(−1/2)`, and
     `carlsonRJ x x x x = carlsonRD x x x = x^(−3/2)`, for `x ∈ slitPlane`.
4. **Elementary `R_C`** (DLMF 19.2.19, 19.2.20). For real `0 ≤ x < y`:
   - `carlsonRC x y = arccos (√(x/y)) / √(y − x)`.

   For real `0 < y < x`:
   - `carlsonRC x y = arcosh (√(x/y)) / √(x − y)`.
5. **Duplication theorem** (DLMF 19.26.18). For `x, y, z` in the domain, with
   `λ = √x√y + √y√z + √z√x` (principal roots):
   - `carlsonRF x y z = carlsonRF ((x+λ)/4) ((y+λ)/4) ((z+λ)/4)`.

   State it first for nonnegative reals, then on the whole domain.
6. **The Legendre dictionary** (DLMF 19.25.5, 19.25.7, 19.25.14). For `k ^ 2 < 1`, `α2 < 1` and
   `|φ| ≤ π/2`, write `c = cos²φ`, `Δ = 1 − k² sin²φ` and `s = sin φ`. Then:
   - `legendreF φ k = s · R_F(c, Δ, 1)`;
   - `legendreE φ k = s · R_F(c, Δ, 1) − (k²/3) s³ · R_D(c, Δ, 1)`;
   - `legendrePi φ k α2 = s · R_F(c, Δ, 1) + (α2/3) s³ · R_J(c, Δ, 1, 1 − α2 s²)`;
   - in particular `legendreK k = R_F(0, 1 − k², 1)` and `legendreEc k = 2 R_G(0, 1 − k², 1)`.

   Each Carlson value is taken at real arguments coerced to `ℂ`, and the identity holds for its
   real part, the imaginary part being `0`.

## Milestone 7: Jacobi elliptic functions of a real variable

Fix `k ^ 2 < 1` and write `K = legendreK k`.

1. **Amplitude.** `jacobiAm k : ℝ ≃o ℝ` is the inverse of the order isomorphism of
   Milestone 1.4. It satisfies:
   - it is odd, with `jacobiAm k (u + 2K) = jacobiAm k u + π` and `jacobiAm k K = π/2`;
   - `HasDerivAt (jacobiAm k) (jacobiDn k u) u`;
   - `jacobiAm 0 = id`.
2. **Identities.**
   - `sn² + cn² = 1` and `dn² + k² sn² = 1`.
   - `dn` is positive.
   - `sn` is odd; `cn` and `dn` are even.
3. **Derivatives.** `sn′ = cn · dn`, `cn′ = −sn · dn` and `dn′ = −k² sn · cn`, as `HasDerivAt`
   statements. The first-order equation `(sn′)² = (1 − sn²)(1 − k² sn²)` follows.
4. **Periods and values.**
   - `sn` and `cn` are `4K`-periodic, and `dn` is `2K`-periodic.
   - `sn (u + 2K) = −sn u`, `sn K = 1`, `cn K = 0`, `dn K = √(1 − k²)`.
   - `4K` is the least positive period of `sn`. At `k = 0` this is `2π`.
5. **Addition theorem** (DLMF 22.8.1):
   - `sn (u + v) = (sn u · cn v · dn v + sn v · cn u · dn u) / (1 − k² sn²u · sn²v)`.

   The companion formulas for `cn` and `dn` are part of this item. The denominator is positive.
6. **Degenerations.**
   - `jacobiSn 0 = sin`, `jacobiCn 0 = cos`, `jacobiDn 0 = 1`.
   - As `k → 1⁻`, pointwise in `u`: `jacobiSn k u → tanh u`, `jacobiCn k u → 1/cosh u` and
     `jacobiDn k u → 1/cosh u`.
7. **The nonlinear pendulum.** Let `ω > 0` and `0 < θ₀ < π`, and set `k = sin (θ₀/2)` and
   `θ(t) = 2 arcsin (k · jacobiSn k (ω t + legendreK k))`. Then:
   - `θ` is `C²`, `θ″ = −ω² sin θ`, `θ 0 = θ₀` and `θ′ 0 = 0`;
   - every `C¹` solution of the first-order system for `(θ, θ′)` with these initial values
     equals `θ` (Mathlib's `ODE_solution_unique_univ`);
   - `θ` is periodic with least positive period `4 legendreK (sin (θ₀/2)) / ω`;
   - that period tends to `2π/ω` as `θ₀ → 0⁺` and to `+∞` as `θ₀ → π⁻`.

## Milestone 8: geometry and the Weierstrass bridge

1. **Perimeter of an ellipse.** For `0 < b ≤ a`, with `γ t = a cos t + (b sin t) · I` in `ℂ`
   and `e = √(1 − b²/a²)`:

   `eVariationOn γ (Set.Icc 0 (2π)) = ENNReal.ofReal (4 a · legendreEc e)`.

   The route is `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` and a change of variables.
   The case `b > a` follows by symmetry.
2. **Cubic integrals, three real roots.** For real `e₃ < e₂ < e₁`, with
   `k = √((e₂ − e₃)/(e₁ − e₃))`, `D(x) = 4(x − e₁)(x − e₂)(x − e₃)` and `κ = legendreK k`:
   - `∫_{(e₁, ∞)} D(x)^(−1/2) dx = κ / √(e₁ − e₃)`;
   - `∫_{(e₃, e₂)} D(x)^(−1/2) dx = κ / √(e₁ − e₃)`.

   Both are stated as `lintegral`s of `ENNReal.ofReal`, equal to `ENNReal.ofReal` of the right
   side.
3. **Cubic integrals, one real root.** For real `e₁, a, b` with `b ≠ 0`, set
   `A = √((e₁ − a)² + b²)`, `k = √((A + a − e₁) / (2A))` and `D(x) = 4(x − e₁)((x − a)² + b²)`.
   Then `∫_{(e₁, ∞)} D(x)^(−1/2) dx = legendreK k / √A`.
4. **The real period** (`W : WeierstrassCurve ℝ`).
   - If `∀ x, W.Ψ₂Sq.eval x = 4 (x − e₁)(x − e₂)(x − e₃)` with `e₃ < e₂ < e₁`, then:
     - `W.realPeriod = 4 legendreK k / √(e₁ − e₃)`;
     - `W.realPeriod = 2π / agm √(e₁ − e₃) √(e₁ − e₂)`.
   - If `∀ x, W.Ψ₂Sq.eval x = 4 (x − e₁)((x − a)² + b²)` with `b ≠ 0`, then, with `A` and `k` as
     in step 3:
     - `W.realPeriod = 2 legendreK k / √A`;
     - `W.realPeriod = 2π / agm (2√A) √(2A + 2(e₁ − a))`.

   These pin the period of the Birch–Swinnerton-Dyer quotient to an AGM that converges
   quadratically (Milestone 4.1). The suggested form:

   ```lean
   open TauCeti.Real in
   theorem WeierstrassCurve.realPeriod_eq_of_three_real_roots (W : WeierstrassCurve ℝ)
       {e₁ e₂ e₃ : ℝ} (h₃₂ : e₃ < e₂) (h₂₁ : e₂ < e₁)
       (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * (x - e₂) * (x - e₃)) :
       W.realPeriod = 4 * legendreK √((e₂ - e₃) / (e₁ - e₃)) / √(e₁ - e₃) := sorry

   open TauCeti.Real in
   theorem WeierstrassCurve.realPeriod_eq_of_one_real_root (W : WeierstrassCurve ℝ)
       {e₁ a b : ℝ} (hb : b ≠ 0)
       (hW : ∀ x, W.Ψ₂Sq.eval x = 4 * (x - e₁) * ((x - a) ^ 2 + b ^ 2)) :
       W.realPeriod = 2 * legendreK √((√((e₁ - a) ^ 2 + b ^ 2) + a - e₁) /
         (2 * √((e₁ - a) ^ 2 + b ^ 2))) / √(√((e₁ - a) ^ 2 + b ^ 2)) := sorry
   ```

   They are given here rather than in `Suggested.lean` because the Tau Ceti dependency pinned
   by this repository predates `RealPeriod.lean`.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.
- The Jacobi functions of a complex variable as elliptic functions with periods `4K` and `2iK′`.
- Their identification with ℘ for the rectangular lattice, `℘(z) = e₃ + (e₁ − e₃) / sn²(√(e₁ − e₃) z)`.
- The analytic continuation of `K` and `E` in `k²` to `ℂ ∖ [1, ∞)`.
- The nome `q = exp(−πK′/K)` and the theta-function expressions.
- The modular function `λ`.
- Principal-value third-kind integrals.
- Incomplete integrals of complex amplitude.

All of these need the lattice roadmaps listed under ownership.

A second, independent continuation is Carlson's general theory. It would build the
`R`-function `R_t(b; z)` as a Dirichlet average over the standard simplex, together with the
measure theory on the simplex and the multivariable holomorphy it needs. It would then identify
this roadmap's integral definitions as special cases, for example
`carlsonRF x y z = R_{−1/2}(1/2, 1/2, 1/2; x, y, z)`, and transport the reduction tables and
contiguous relations to them. `lean-codes` contains a full formalization of this theory (see
Prior formalization), so it would be a port. That makes it a natural roadmap of its own. Parts
of the simplex measure theory may go to Mathlib first; check there before starting.

## References

- NIST *Digital Library of Mathematical Functions*, Chapters 19 (elliptic integrals) and 22
  (Jacobian elliptic functions), <https://dlmf.nist.gov/19>, <https://dlmf.nist.gov/22>.
- B. C. Carlson, *Special Functions of Applied Mathematics*, Academic Press, 1977, Chapter 9.
- B. C. Carlson, Numerical computation of real or complex elliptic integrals, *Numer. Algorithms*
  10 (1995), 13–26.
- J. M. Borwein and P. B. Borwein, *Pi and the AGM*, Wiley, 1987, Chapters 1–2.
- P. F. Byrd and M. D. Friedman, *Handbook of Elliptic Integrals for Engineers and Scientists*,
  2nd ed., Springer, 1971, formulas 236.00 and 239.00.
- E. Salamin, Computation of π using arithmetic-geometric mean, *Math. Comp.* 30 (1976), 565–570.
- J. E. Cremona, *Algorithms for Modular Elliptic Curves*, 2nd ed., Cambridge, 1997, §3.7.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, Chapter XXII.
