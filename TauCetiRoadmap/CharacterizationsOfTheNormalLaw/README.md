# Roadmap: characterizations of the normal law

**Summary.** This roadmap proves the classical theorems that single out the normal law on the
real line among all laws by a property of independent random variables, with no moment
assumption unless one is stated. "Normal" includes the point masses (variance zero), as in
Mathlib. The headline results:

- *Cramér's decomposition theorem.* If `X` and `Y` are independent, then `X + Y` is normal if
  and only if both `X` and `Y` are normal.
- *The Darmois–Skitovich theorem.* If `X₁, …, Xₙ` are independent and two linear forms
  `∑ aᵢ Xᵢ` and `∑ bᵢ Xᵢ` with all coefficients nonzero are independent, then every `Xᵢ` is
  normal. The Kac–Bernstein theorem is its sharper two-variable case: for independent `X₁, X₂`,
  the sum and the difference are independent exactly when both are normal with equal variances.
- *Independence of the sample mean and the sample variance.* For `n ≥ 2` independent identically
  distributed observations, if the sample mean is independent of the sum of squared deviations,
  the common law is normal.
- *Lukacs' characterization of the gamma law.* For independent positive `X` and `Y`, `X` not
  almost surely constant, the ratio `X/(X + Y)` is independent of `X + Y` exactly when `X` and `Y`
  are gamma laws with a common rate.

Alongside these: Pólya's theorem (two independent copies whose normalized sum `(X₁ + X₂)/√2`
has the law of `X₁` are centered normal) and the Herschel–Maxwell theorem (a random vector in
`ℝⁿ`, `n ≥ 2`, with independent coordinates has a law invariant under all orthogonal maps
exactly when its coordinates are centered normal with a common variance).

Layer 1 proves Cramér's theorem by complex analysis (a summand of a normal law has an entire
moment generating function without zeros, of order two). Layer 2 turns smoothness of a
characteristic function into moments and analyticity into exponential moments, and proves
Marcinkiewicz's theorem (a characteristic function equal to `exp` of a polynomial near `0` is
normal). Layers 3–5 treat stability and rotations, independent linear forms, and independent
statistics. Known converse directions (normal samples, gamma–beta factorization) are cited from
the roadmaps on mathematical statistics and standard distributions.

## Conventions

- `Ω` carries a measure `P` (a probability measure where needed); random variables are real
  valued and a.e. measurable. Independence is `IndepFun` / `iIndepFun`, identical distribution
  `IdentDistrib`, variance `Var[X; P]`.
- *Normal* means Mathlib's `HasGaussianLaw X P` for a random variable and `IsGaussian μ` for a law
  on `ℝ`. On `ℝ` these are exactly the laws `gaussianReal m v` with `m : ℝ` and `v : ℝ≥0`
  (`IsGaussian.eq_gaussianReal`); `gaussianReal m 0` is the point mass at `m`. The words
  "centered normal with variance `v`" mean `HasLaw X (gaussianReal 0 v) P`.
- The characteristic function of a law `μ` on `ℝ` is Mathlib's `charFun μ t = ∫ exp(i t x) dμ`;
  the complex moment generating function is `complexMGF X P z = E exp(z X)` (Mathlib's junk
  value `0` where `exp(Re z · X)` is not integrable), and `mgf` is its real version.
- For a law `μ` on `ℝ`, its tail is `N(x) = μ{y : x ≤ |y|}` (as `μ.real`).
- The sample mean of `X : Fin n → Ω → ℝ` is `(∑ i, X i) / n` and the sum of squared deviations
  is `∑ i, (X i − (∑ j, X j) / n) ^ 2`.

## Layer 1: Cramér's decomposition theorem

### 1.1 Cramér's decomposition theorem

For independent almost everywhere measurable `X, Y : Ω → ℝ`, `X + Y` is normal if and only if
`X` and `Y` are both normal (`hasGaussianLaw_add_iff_of_indepFun`). There is no moment or
nondegeneracy hypothesis; a point mass counts as normal (Bryc, Thm 2.5.2, p. 29, for the forward
direction; H. Cramér, 1936).

Route. The backward direction is Mathlib's `iIndepFun.hasGaussianLaw_fun_add`. Forward, let
`S = X + Y` have law `gaussianReal m v`.

1. *Gaussian tails pass to the summands.* Choose `c ≥ 0` with `P(Y ≥ −c) ≥ 1/2` and
   `P(Y ≤ c) ≥ 1/2`. By independence `P(X ≥ x) P(Y ≥ −c) ≤ P(S ≥ x − c)`, and symmetrically for
   the lower tail, so `P(|X| ≥ x) ≤ 2 P(|S| + c ≥ x)` for all `x`. Integrating this tail bound
   against the increasing function `h(x) = exp(a x²)` (layer-cake formula) gives
   `E h(|X|) ≤ 2 E h(|S| + c)`, finite once `4 a v < 1` (any `a > 0` if `v = 0`, where `S` is
   constant). The same holds for `Y`.
2. *Entire, without zeros.* With `a > 0` from step 1, `t x ≤ a x² + t²/(4a)` gives
   `mgf X t ≤ C exp(t²/(4a))` for all real `t`, so `integrableExpSet X P = ℝ` and
   `complexMGF X P` is entire (`analyticOnNhd_complexMGF`); likewise for `Y`. On the real line
   `mgf (X + Y) = mgf X · mgf Y` (`IndepFun.mgf_add`), so by the identity theorem
   `complexMGF X · complexMGF Y = complexMGF S = exp(m z + v z²/2)` on `ℂ`
   (`complexMGF_gaussianReal`). Hence `complexMGF X` has no zeros.
3. *A logarithm of order two.* As `ℂ` is convex, hence simply connected (Tau Ceti
   `Convex.isSimplyConnected`), `complexMGF X = exp ∘ g` for an entire `g` (Tau Ceti
   `TauCeti.exists_differentiableOn_eqOn_exp_comp`), normalized by `g 0 = 0`. Then
   `Re g z = log ‖complexMGF X z‖ ≤ log (mgf X (Re z)) ≤ log C + ‖z‖²/(4a)`
   (`norm_complexMGF_le_mgf`). The Borel–Carathéodory inequality on the disc of radius `2r`
   (`Complex.borelCaratheodory`) bounds `‖g z‖` by a constant times `1 + r²` on the disc of
   radius `r`, so `g = O(z²)` and `g` is a polynomial of degree at most two
   (`Differentiable.exists_eq_polynomial_eval_of_isBigO_pow`): `g z = β z + γ z²`.
4. *Identification.* On real `x`, `exp(β x + γ x²) = mgf X x > 0` and the exponent is continuous
   and `0` at `0`, so `β x + γ x²` is real and `β, γ ∈ ℝ`. Then
   `charFun (P.map X) t = complexMGF X (t i) = exp(i β t − γ t²)` (`complexMGF_mul_I`), and
   `‖charFun‖ ≤ 1` forces `γ ≥ 0`. So `P.map X = gaussianReal β (2γ)` by `charFun_gaussianReal`
   and `Measure.ext_of_charFun`, and `X` is normal; the same for `Y`.

*Needs:* Mathlib `iIndepFun.hasGaussianLaw_fun_add`, `IndepFun.mgf_add`,
`analyticOnNhd_complexMGF`, `norm_complexMGF_le_mgf`, `complexMGF_gaussianReal`,
`complexMGF_mul_I`, `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`,
`Complex.borelCaratheodory`, `Differentiable.exists_eq_polynomial_eval_of_isBigO_pow`,
`charFun_gaussianReal`, `Measure.ext_of_charFun`; Tau Ceti `Convex.isSimplyConnected`,
`TauCeti.exists_differentiableOn_eqOn_exp_comp`.

**Checks.**

- Independence cannot be dropped. Let `ε = ±1` with probability `1/2` each and `Z ∼ N(0, 1)`
  independent of `ε`; then `X = ε` and `Y = Z − ε` have the normal sum `Z`, and `X` has two atoms.

### Examples

- A Poisson law with positive mean, or a uniform law on an interval of positive length, is
  never a summand of a normal law.

### Dependencies

Mathlib Gaussian laws, complex mgfs, Borel–Carathéodory, Liouville; Tau Ceti's logarithm.

## Layer 2: moments, analytic characteristic functions and Marcinkiewicz's theorem

### 2.1 A tail recursion gives all moments

Let `μ` be a probability measure on `ℝ` and `C > 1`. If for every `q ∈ (0, 1)` there is `x₀`
with `N(C x) ≤ q N(x)` for all `x > x₀`, then `μ` has finite moments of every finite order:
`MemLp id p μ` for every `p ≠ ∞` (`memLp_of_tail_le_mul`) (Bryc, Cor 1.3.3, p. 8).

Route. Fix `q ∈ (0, 1)`, take `x₀` from the hypothesis and `x₁ > max x₀ 0`. By induction
`N(Cʲ x₁) ≤ qʲ` for all `j`. For `x ≥ x₁` pick `j` with `Cʲ x₁ ≤ x < Cʲ⁺¹ x₁`; then
`N(x) ≤ qʲ ≤ q⁻¹ (x/x₁)^(−β)` with `β = log(1/q)/log C`. The layer-cake formula
`E|X|^p = ∫₀^∞ p x^(p−1) N(x) dx` is then finite for `p < β`, and `β` is as large as we like.

*Needs:* Mathlib `MeasureTheory.lintegral_rpow_eq_lintegral_meas_le_mul` (layer cake).

**Checks.**

- The standard Cauchy law has `N(x) = 1 − (2/π) arctan x` and `N(Cx)/N(x) → 1/C`, so the
  hypothesis fails for `q < 1/C`; it has no first moment.

### 2.2 Even derivatives of a characteristic function give even moments

For a probability measure `μ` on `ℝ` and `k : ℕ`, if `charFun μ` is `C^(2k)` near `0`
(`ContDiffAt ℝ (2k) (charFun μ) 0`), then `MemLp id (2k) μ` (`memLp_of_contDiffAt_charFun`)
(Bryc, Thm 1.5.1(iii), p. 12, assumes `2k` derivatives; the hypothesis here is the slightly
stronger `C^(2k)` near `0`).

Route. Induction on `k`; `k = 0` is trivial. Suppose `MemLp id (2k) μ` and `charFun μ` is
`C^(2k+2)` near `0`. The finite measure `ν = x^(2k) · μ` has characteristic function
`χ(t) = (−1)^k (charFun μ)^(2k)(t)` (`iteratedDeriv_charFun`), which is `C²` near `0`. For
`h ≠ 0`, `(2 − 2 cos(h x))/h² ≥ 0` tends to `x²`, and its `ν`-integral is
`(2 χ(0) − χ(h) − χ(−h))/h²`, which tends to `−χ''(0)`. Fatou's lemma
(`MeasureTheory.lintegral_liminf_le`) gives `∫ x² dν ≤ −χ''(0) < ∞`, that is
`∫ x^(2k+2) dμ < ∞`.

*Needs:* Mathlib `iteratedDeriv_charFun`, `MeasureTheory.lintegral_liminf_le`.

**Checks.**

- The Cauchy law has characteristic function `exp(−|t|)`, not differentiable at `0`, and no first
  moment.

### 2.3 Analytic characteristic functions have exponential moments

Let `μ` be a probability measure on `ℝ`, `R` real and `f : ℂ → ℂ` holomorphic on the disc
`‖z‖ < R` with `charFun μ t = f t` for real `|t| < R`. Then `∫ exp(a|x|) dμ < ∞` for every
`0 ≤ a < R`, and `f z = ∫ exp(i z x) dμ` for every `‖z‖ < R`
(`integrable_exp_mul_abs_of_charFun_eqOn`) (Bryc, Thm 2.3.5, p. 28, and Cor 2.3.6, p. 28). For
`R ≤ 0` both conclusions are empty.

Route. `charFun μ` is smooth on `(−R, R)`, so by 2.2 all moments `m_j` are finite and
`m_{2k} = (−1)^k f^(2k)(0)`. Fix `a < A < R` and let `M` be the maximum of `‖f‖` on the circle
of radius `A`; the Cauchy estimates give `m_{2k} ≤ (2k)! M / A^(2k)`. By monotone convergence
`E exp(a|X|) ≤ 2 E cosh(a X) = 2 ∑ a^(2k) m_{2k}/(2k)! ≤ 2M ∑ (a/A)^(2k) < ∞`. For
`‖z‖ < R` the integrand `exp(i z x)` has modulus `exp(−(Im z) x) ≤ exp(|Im z| |x|)`, so
`z ↦ ∫ exp(i z x) dμ` is holomorphic on the strip `|Im z| < R` (it is
`complexMGF id μ (i z)`, `analyticOnNhd_complexMGF`); it agrees with `f` on the real segment,
hence on the disc by the identity theorem.

*Needs:* 2.2; Mathlib `analyticOnNhd_complexMGF`,
`Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Cauchy estimates),
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`.

**Checks.**

- Sharpness of the radius: the Laplace law's `1/(1 + t²)` extends holomorphically to `‖z‖ < 1`
  (poles at `±i`), and `∫ exp(a|x|) exp(−|x|)/2 dx = 1/(1 − a)` is finite exactly for `a < 1`.

### 2.4 Marcinkiewicz's theorem

Let `μ` be a probability measure on `ℝ` and `Q` a complex polynomial with
`charFun μ t = exp(Q(t))` for real `|t| < ε`, some `ε > 0`. Then `Q` has degree at most two and
`μ` is normal (`isGaussian_of_charFun_eq_exp_polynomial`) (Bryc, Thm 2.5.3, pp. 29–30;
J. Marcinkiewicz, 1938).

Route. Let `X` have law `μ` and `φ(z) = ∫ exp(i z x) dμ`.

0. *Extension to `ℂ`.* By 2.3 with radius `ε`, `E exp(a|X|) < ∞` for `a < ε`; let `R₀` be the
   supremum of such `a`. On the strip `|Im z| < R₀`, `φ` is holomorphic
   (`analyticOnNhd_complexMGF`) and equals `exp(Q(z))` near `0`, hence on the whole strip.
   Suppose `R₀ < ∞` and take `0 < y < R₀`, `0 ≤ h < R₀`. With `F(w) = exp(Q(−i w))`, entire,
   `E[X^k e^(yX)] = F^(k)(y)` (`iteratedDeriv_mgf`), and `|X^k e^(yX)| ≤ |X|^k` on `{X < 0}`,
   so monotone convergence gives `E[e^((y+h)X); X ≥ 0] = ∑ hᵏ E[X^k e^(yX); X ≥ 0]/k!`
   `≤ ∑ |F^(k)(y)| hᵏ/k! + E exp(h|X|) < ∞`, the Taylor series of `F` at `y` converging
   absolutely. The same for `−X` (with `Q(−z)`) bounds `E[e^((y+h)|X|); X < 0]`, and `y + h`
   exceeds `R₀` for `y, h` near `R₀`, a contradiction. So `R₀ = ∞` and `φ = exp ∘ Q` on `ℂ`.

Write `z = x + i y` and `U = Re Q`.

1. *The ridge inequality.* `‖exp(i z u)‖ = exp(−y u)`, so `‖φ(x + i y)‖ ≤ φ(i y)`, and
   `φ(i y) = ∫ exp(−y u) dμ(u)` is real and positive. Hence `Im Q(i y) ∈ 2πℤ` for all real `y`;
   being continuous, `Q(i y) − Q(0)` is real, and `exp(Q(0)) = φ(0) = 1`. Taking logarithms,
   `U(x, y) ≤ U(0, y)` for all real `x, y`.
2. *Degree at most two.* Let `c z^m` be the leading term of `Q` and suppose `m ≥ 3`. Its real
   part `H(x, y) = Re(c (x + i y)^m)` is the leading homogeneous part of `U`; scaling
   `(x, y) ↦ (λx, λy)` in step 1, dividing by `λ^m` and letting `λ → ∞` gives
   `H(x, y) ≤ H(0, y)`. In polar form `H = ‖c‖ ρ^m cos(mθ + arg c)`, which reaches its maximum
   `‖c‖ ρ^m` at `m` distinct angles `θ` modulo `2π`, while `H(0, y) ≤ ‖c‖ |y|^m = ‖c‖ ρ^m |sin θ|^m`.
   So every maximizing angle has `|sin θ| = 1`, that is `θ = ±π/2`, impossible for `m ≥ 3`
   angles.
3. *Identification.* So `Q(z) = Q(0) + q₁ z + q₂ z²`. By step 1, `q₁ i y − q₂ y²` is real for
   all real `y`, so `q₁ = i β` and `q₂ = −γ` with `β, γ ∈ ℝ`; and `‖φ(t)‖ = exp(−γ t²) ≤ 1` on
   the real line gives `γ ≥ 0`. Then `charFun μ t = exp(i β t − γ t²)` for all real `t`, which
   is the characteristic function of `gaussianReal β (2γ)` (`charFun_gaussianReal`), and
   `Measure.ext_of_charFun` gives `μ = gaussianReal β (2γ)`.

*Needs:* 2.3; Mathlib `analyticOnNhd_complexMGF`, `iteratedDeriv_mgf`,
`AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`, `charFun_gaussianReal`,
`Measure.ext_of_charFun`.

**Checks.**

- `exp(−t⁴)` is not a characteristic function: its first two derivatives vanish at `0`, which
  would force variance `0`, a point mass, and the function `1`.

### Examples

- `exp(i t − t²)` near `0` identifies `N(1, 2)`; `exp(Q(t))` with `deg Q = 3` or `4` is never a
  characteristic function, even near the origin.

### Dependencies

No other layer; Mathlib characteristic functions, complex mgfs, Fatou, layer cake, Cauchy
estimates.

## Layer 3: stability and rotation invariance

### 3.1 Pólya's theorem

Let `P` be a probability measure and `X₁, X₂ : Ω → ℝ` independent and identically distributed
with `(X₁ + X₂)/√2` distributed as `X₁`. Then `X₁` is centered normal:
`HasLaw X₁ (gaussianReal 0 v) P` for some `v`
(`exists_hasLaw_gaussianReal_of_identDistrib_add_div_sqrt_two`) (Bryc, Thm 3.1.1, p. 35;
G. Pólya, 1923). No moment is assumed.

Route. With `φ` the characteristic function of `X₁`, the hypothesis reads `φ(√2 t) = φ(t)²`.
Then `D = X₁ − X₂` has the real characteristic function `ρ = |φ|²`, with `ρ(√2 t) = ρ(t)²`.

1. `ρ > 0`: if `ρ(t₀) = 0` then `ρ(t₀ 2^(−j/2)) = 0` for all `j`, against `ρ(0) = 1` and
   continuity. So `ψ = −log ρ ≥ 0` is continuous with `ψ(√2 t) = 2 ψ(t)`.
2. *Finite variance.* For `t ≠ 0` and `t_j = t 2^(−j/2)`,
   `E[(1 − cos(t_j D))/t_j²] = (1 − ρ(t_j))/t_j² ≤ ψ(t_j)/t_j² = ψ(t)/t²`. Fatou's lemma gives
   `E D² ≤ 2ψ(t)/t² < ∞`.
3. *Identification.* `D` is symmetric with variance `σ²`. If `σ² = 0` then `D = 0` and `ψ = 0`.
   Otherwise `ρ(u) = 1 − σ² u²/2 + o(u²)` (Mathlib `taylor_charFun_two` applied to `D/σ`) and
   `ψ(u)/u² → σ²/2`. As `ψ(t)/t² = ψ(t_j)/t_j²` for all `j`, `ψ(t) = σ² t²/2`: `D` is normal.
4. Since `X₁ ⟂ −X₂` and `D = X₁ + (−X₂)`, Cramér's theorem 1.1 makes `X₁` normal, say
   `N(m, v)`; the hypothesis compares means, `√2 m = m`, so `m = 0`.

*Needs:* 1.1; Mathlib `taylor_charFun_two`, `MeasureTheory.lintegral_liminf_le`,
`Measure.ext_of_charFun`.

**Checks.**

- The `√2` is the normal one: for the standard Cauchy law, `(X₁ + X₂)/2` has the law of `X₁`,
  but `(X₁ + X₂)/√2` has characteristic function `exp(−√2 |t|)`, not `exp(−|t|)`.
- The mean must vanish: for `N(1, 1)`, `(X₁ + X₂)/√2` has mean `√2`.

### 3.2 The Herschel–Maxwell theorem

Let `P` be a probability measure, `n ≥ 2`, and `X : Ω → EuclideanSpace ℝ (Fin n)` almost
everywhere measurable with independent coordinates. The law of `X` is invariant under every
linear isometry of `EuclideanSpace ℝ (Fin n)` if and only if there is `v` with every coordinate
`HasLaw (X · i) (gaussianReal 0 v) P` (`map_linearIsometryEquiv_comp_eq_iff`) (Bryc, Thm 0.0.1,
pp. 1–2, for `n = 2`, stated there without proof and attributed to Herschel and Maxwell).

Route. Forward: the transposition of coordinates `1, 2` is an isometry, so `X₁` and `X₂` are
identically distributed (and independent). The rotation by `π/4` in the plane of the first two
coordinates sends the first coordinate to `(X₁ + X₂)/√2`, which therefore has the law of `X₁`.
Pólya's theorem 3.1 makes `X₁` centered normal with some variance `v`, and every coordinate has
the law of `X₁` by a transposition. Backward: by independence the law of the coordinate vector is
the product of the laws `gaussianReal 0 v` (`iIndepFun_iff_map_fun_eq_pi_map`), which is the
image of `stdGaussian` under `x ↦ √v x` (`gaussianReal_map_const_mul`, `map_pi_eq_stdGaussian`).
Linear isometries commute with scaling and preserve `stdGaussian` (`stdGaussian_map`).

*Needs:* 3.1; Mathlib `iIndepFun_iff_map_fun_eq_pi_map`, `gaussianReal_map_const_mul`,
`map_pi_eq_stdGaussian`, `stdGaussian_map`.

**Checks.**

- `n ≥ 2` is needed: for `n = 1` the isometries are `±1`, and the law with mass `1/2` at `±1` is
  invariant but not normal.

### Examples

- Maxwell's velocity law: isotropic with independent components forces `N(0, v)` components.

### Dependencies

Layer 1; Mathlib `stdGaussian` and product measures.

## Layer 4: independent linear forms

### 4.1 The Darmois–Skitovich theorem

Let `P` be a probability measure, `ι` a finite type, `X : ι → Ω → ℝ` independent and almost
everywhere measurable, and `a, b : ι → ℝ` with `a i ≠ 0` and `b i ≠ 0` for all `i`. If
`∑ aᵢ Xᵢ` and `∑ bᵢ Xᵢ` are independent, then every `Xᵢ` is normal
(`hasGaussianLaw_of_indepFun_sum_mul`) (Bryc, Thm 5.3.1, p. 65; G. Darmois, 1953, and
V. P. Skitovich, 1953, as attributed there).

Route. Write `L = ∑ aᵢ Xᵢ`, `M = ∑ bᵢ Xᵢ`, `n = card ι`.

1. *The maximum has all moments.* Let `T = maxᵢ |Xᵢ|`, `N` the tail of its law, and choose
   `0 < ε ≤ |aᵢ|, |bᵢ| ≤ K` and `C = 2nK/ε`. If `T ≥ C x` with `x > 0`, either two of the
   `|Xᵢ|` are at least `x`, which has probability at most `n² N(x)²`, or exactly one is, and
   then it is at least `C x` while the others are below `x`; in that case `|L|` and `|M|` are
   both at least `(εC − nK) x = nK x`. Since `|L| ≥ nK x` forces `T ≥ x`, independence of
   `L` and `M` gives `N(C x) ≤ N(x) (P(|M| ≥ nK x) + n² N(x))`, and the bracket tends to `0`.
   So 2.1 applies to the law of `T`, and every `Xᵢ`, being dominated by `T`, has all moments.
2. *Annihilating the other summands.* Replace `Xᵢ` by `aᵢ Xᵢ` and `bᵢ` by `bᵢ/aᵢ`, so that
   `L = ∑ Xᵢ`, and merge the indices with equal `bᵢ` into one variable, their sum: the merged
   variables are independent, have all moments, and carry distinct nonzero coefficients
   `b₁, …, b_m`. Their characteristic functions `φₖ` are smooth (`contDiff_charFun'`) and
   independence of `L` and `M` says `∏ₖ φₖ(t + bₖ s) = φ_L(t) φ_M(s)`. Near the origin every
   factor is close to `1`, so taking principal logarithms,
   `∑ₖ Qₖ(t + bₖ s) = w₁(t) + w₂(s)` with all functions smooth. Fix `k`. The operator
   `∂_s − bⱼ ∂_t` annihilates every function of `t + bⱼ s`, `∂_s` annihilates `w₁(t)` and
   `∂_t` annihilates `w₂(s)`. Applying `∂_t ∂_s ∏_{j ≠ k} (∂_s − bⱼ ∂_t)` to the identity
   leaves `bₖ ∏_{j ≠ k} (bₖ − bⱼ) · Qₖ^(m+1)(t + bₖ s) = 0`, and the factor in front is not
   zero. So `Qₖ` is a polynomial of degree at most `m` near `0`.
3. *Conclusion.* Each merged variable has characteristic function `exp` of a polynomial near
   `0`, hence is normal by Marcinkiewicz's theorem 2.4; a merged variable is a sum of
   independent rescaled ones `aᵢ Xᵢ`, each of which is then normal by Cramér's theorem 1.1,
   applied to one summand against the sum of the others; so is `Xᵢ`, as `aᵢ ≠ 0`.

*Needs:* 1.1, 2.1, 2.4; Mathlib `contDiff_charFun'`.

**Checks.**

- The coefficients must be nonzero: for `a = (1, 0)` and `b = (0, 1)` the forms are `X₁` and
  `X₂`, independent for any laws.
- The constants of step 1: with `|Xⱼ| ≥ Cx` and `|Xₖ| < x` for the other `n − 1` indices,
  `|L| ≥ ε C x − (n − 1) K x ≥ 2nK x − nK x = nK x`.

### Examples

- For independent `X₁ ∼ N(0, 1)` and `X₂ ∼ N(0, 4)`, the forms `2X₁ + X₂` and `2X₁ − X₂` have
  covariance `4 − 4 = 0` and are independent, so the hypothesis of 4.1 can be met by normal
  laws with unequal variances.

### 4.2 The Kac–Bernstein theorem

Let `P` be a probability measure and `X₁, X₂` independent and almost everywhere measurable. Then
`X₁ + X₂` and `X₁ − X₂` are independent if and only if `X₁` and `X₂` are normal with
`Var[X₁] = Var[X₂]` (`indepFun_add_sub_iff`) (Bryc, Thm 5.1.1, p. 61, for normality, attributed
there to S. N. Bernstein, 1941; M. Kac, 1939, as attributed on p. 2).

Route. Once `X₁, X₂` are known to be normal, they are square integrable
(`HasGaussianLaw.memLp_two`), and by bilinearity (`covariance_add_left`,
`covariance_sub_left`, `covariance_add_right`, `covariance_sub_right`, `covariance_self`) and
`cov[X₁, X₂] = 0` (`IndepFun.covariance_eq_zero`),
`cov[X₁ + X₂, X₁ − X₂] = Var[X₁] − Var[X₂]`.

- Forward: normality is the Darmois–Skitovich theorem 4.1 for `ι = Fin 2`, `a = (1, 1)`,
  `b = (1, −1)`; independence of the sum and the difference makes their covariance `0`
  (`IndepFun.covariance_eq_zero`), so the variances agree.
- Backward: `(X₁, X₂)` is jointly normal (`IndepFun.hasGaussianLaw`), hence so is its linear
  image `(X₁ + X₂, X₁ − X₂)`, whose covariance is `0` by the equal variances; Mathlib's
  `HasGaussianLaw.indepFun_of_covariance_eq_zero` concludes.

*Needs:* 4.1; Mathlib `IndepFun.hasGaussianLaw`, `HasGaussianLaw.indepFun_of_covariance_eq_zero`,
`IndepFun.covariance_eq_zero`, `covariance_add_left`, `covariance_sub_left`,
`covariance_add_right`, `covariance_sub_right`, `covariance_self`, `HasGaussianLaw.memLp_two`.

**Checks.**

- Independence of `X₁, X₂` is needed: `X₁ = X₂ = ε = ±1` gives `X₁ + X₂ = 2ε` and `X₁ − X₂ = 0`,
  independent, and `ε` is not normal.
- The equal variances are needed in the backward direction: for independent `N(0, v₁)` and
  `N(0, v₂)`, the covariance of the sum and the difference is `v₁ − v₂`.
- A point mass is allowed on both sides: for `X₁ = 1` and `X₂ ∼ N(0, 1)` the sum and the
  difference `1 ± X₂` are not independent, and the variances `0` and `1` differ.

### Dependencies

Layers 1 and 2; Mathlib two-dimensional Gaussian laws and covariances.

## Layer 5: independent statistics

### 5.1 Independence of the sample mean and the sum of squared deviations

Let `P` be a probability measure, `n ≥ 2`, and `X : Fin n → Ω → ℝ` independent and identically
distributed (`IdentDistrib`, which includes measurability). If the sample mean is independent of
`∑ (Xᵢ − X̄)²`, every `Xᵢ` is normal (`hasGaussianLaw_of_indepFun_sampleMean_sumSq`) (Bryc,
Thm 7.4.1, p. 85, where no moment hypothesis is made either).

Route.

1. *Moments, through the maximum.* Write `X̄` for the sample mean and `SS` for the sum of
   squared deviations. Let `T = maxᵢ |Xᵢ|` and `N` the tail of its law. If `T ≥ 2n x` with
   `x > 0`, either two of the `|Xᵢ|` are at least `x` (probability at most `n² N(x)²`), or
   exactly one, `|Xⱼ| ≥ 2n x`, while the others are below `x`. In the second case
   `|X̄| ≥ (n + 1) x / n ≥ x` and
   `|Xⱼ − X̄| ≥ ((n − 1)/n) (2n x − x) = (n − 1)(2n − 1) x / n ≥ 3x/2`, so `SS ≥ 9x²/4`. Since
   `|X̄| ≥ x` forces `T ≥ x`, independence of `X̄` and `SS` gives
   `N(2n x) ≤ N(x) (P(SS ≥ 9x²/4) + n² N(x))`, and the bracket tends to `0`. By 2.1 the law
   of `T` has all moments, hence so has `X₁`.
2. *The equation.* Let `φ` be the characteristic function of `X₁`, `σ² = Var[X₁]`. Expanding
   `SS = (1 − 1/n) ∑ Xᵢ² − (1/n) ∑_{i≠j} Xᵢ Xⱼ` and using independence,
   `E[SS exp(i t ∑ Xᵢ)] = (n − 1)(φ'(t)² φ(t)^(n−2) − φ''(t) φ(t)^(n−1))`. Independence of `SS`
   and `X̄` makes the left side `E[SS] φ(t)^n = (n − 1) σ² φ(t)^n`.
3. *Solution.* On the largest open interval `I ∋ 0` where `φ ≠ 0`, dividing by `(n − 1)φⁿ`
   gives `(φ'/φ)' = −σ²`, so `φ'/φ = i m − σ² t` with `m = E X₁`, and
   `φ(t) exp(−(i m t − σ² t²/2))` has derivative `0`: `φ(t) = exp(i m t − σ² t²/2)` on `I`. Its
   modulus is bounded below on bounded sets, so by continuity `φ` cannot vanish at a finite
   endpoint of `I`; hence `I = ℝ` and `X₁ ∼ N(m, σ²)`.

*Needs:* 2.1; Mathlib `iteratedDeriv_charFun`, `contDiff_charFun`, `Measure.ext_of_charFun`,
`charFun_gaussianReal`.

**Checks.**

- `n ≥ 2` is needed: for `n = 1`, `SS = 0` is independent of everything.
- The identity of step 2, as a polynomial identity in `exp(i t)`, holds for the law with masses
  `1/2, 1/3, 1/6` at `0, 1, 3` and `n = 2, 3` (exact expansion over all `3ⁿ` samples).

### 5.2 Lukacs' characterization of the gamma law

Let `P` be a probability measure and `X, Y` independent, almost everywhere measurable and almost
surely positive, with `X` not almost surely constant. Then `X/(X + Y)` is independent of `X + Y`
if and only if there are `a, b, r > 0` with `HasLaw X (gammaMeasure a r) P` and
`HasLaw Y (gammaMeasure b r) P` (`indepFun_div_add_add_iff`) (Ger, Misiewicz and Wesołowski,
§1, p. 1, with both variables non-degenerate; E. Lukacs, 1955). Only `X` is assumed
non-degenerate here; the route shows that this suffices.

Route. Backward: Tau Ceti `TauCeti.Probability.indepFun_div_add_of_hasLaw_gammaMeasure`.
Forward, let `U = X + Y`, `V = X/U ∈ (0, 1)`, `c = E V`, `d = E V²`, and `L_X(s) = mgf X (−s)`,
`L_Y` likewise, for `s > 0`.

1. *Two equations.* For `s > 0`, `X exp(−sU) = V · U exp(−sU)` and `X² exp(−sU) = V² · U² exp(−sU)`
   with bounded factors; independence of `V` and `U`, of `X` and `Y`, and the derivatives of the
   mgf (`hasDerivAt_mgf`, `iteratedDeriv_mgf`) give `L_X' L_Y = c (L_X L_Y)'` and
   `L_X'' L_Y = d (L_X L_Y)''`.
2. *Non-degeneracy.* If `Var V = 0` then `X = (c/(1 − c)) Y` a.s. is independent of itself, so
   constant, which is excluded. Hence `Var V > 0`, and `d < c` because `V² < V`.
3. *Solution.* With `f = −L_X'/L_X > 0` and `g = −L_Y'/L_Y`, the first equation gives
   `f = c (f + g)`; the second, through `L''/L = f² − f'`, gives `f' = −κ f²` with
   `κ = (d/c² − 1)/(1 − d/c) > 0`. So `1/f(s) = κ s + α`. If `α = 0`, `log L_X` would be
   `−(1/κ) log s + const`, unbounded as `s → 0`, against `L_X ≤ 1`; so `α > 0`. Integrating with
   `L_X(0⁺) = 1` gives `L_X(s) = (1 + s/r)^(−a)` with `a = 1/κ`, `r = α/κ`, and similarly
   `L_Y(s) = (1 + s/r)^(−b)` with `b = a(1 − c)/c`.
4. *Identification.* These are the gamma Laplace transforms (Tau Ceti
   `TauCeti.Probability.mgf_id_gammaMeasure`). Both complex mgfs are holomorphic on `Re z < 0`
   and agree on `(−∞, 0)`, hence on the half plane; letting `Re z → 0⁻` (dominated convergence,
   `‖exp(z x)‖ ≤ 1` for `x ≥ 0`) the characteristic functions agree, and `Measure.ext_of_charFun`
   concludes.

*Needs:* Mathlib `hasDerivAt_mgf`, `iteratedDeriv_mgf`, `analyticOnNhd_complexMGF`,
`complexMGF_mul_I`, `Measure.ext_of_charFun`; Tau Ceti
`TauCeti.Probability.indepFun_div_add_of_hasLaw_gammaMeasure`,
`TauCeti.Probability.mgf_id_gammaMeasure`, `TauCeti.Probability.complexMGF_id_gammaMeasure`.

**Checks.**

- Non-degeneracy is needed: two positive constants have independent ratio and sum.
- A common rate is needed: for independent `Exp(1)` and `Exp(2)`, `E V = 2 − 2 log 2`,
  `E U = 3/2` and `E[VU] = E X = 1`, so `cov(V, U) = 3 log 2 − 2 ≠ 0`.
- For `V ∼ Beta(p, q)`, `c = p/(p + q)` and `d = p(p + 1)/((p + q)(p + q + 1))` give `κ = 1/p`,
  the shape found in step 3.

### Examples

- For `X ∼ Gamma(2, 1)` and `Y ∼ Gamma(3, 1)` the ratio is `Beta(2, 3)` and independent of the
  sum (StandardDistributions, §4.3).

### Dependencies

Layer 2; Tau Ceti gamma laws.

## Scope and ownership

This roadmap owns the characterization directions listed above and the analytic lemmas 2.1–2.4.
The converse directions are already in the libraries or on main and are cited: Mathlib proves
that independent normal variables have a normal sum and that uncorrelated jointly normal
variables are independent; MathematicalStatisticsFoundations, §5.2 (Gaussian samples), states
that for a normal sample the residual sum of squares is independent of the sample mean; Tau Ceti
proves the gamma–beta factorization, stated in StandardDistributions, §4.3. Not treated:
stability estimates for these characterizations, decomposition theorems for other laws, the
Skitovich–Darmois theorem with zero coefficients or in several dimensions, characterizations
by regression or conditional moments, Linnik's theorems on identically distributed linear
forms, and the matrix (Wishart) forms of Lukacs' theorem.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.HasGaussianLaw` (`Probability/Distributions/Gaussian/HasGaussianLaw/Def.lean`),
  `ProbabilityTheory.IsGaussian`, `IsGaussian.eq_gaussianReal` (`…/Gaussian/Basic.lean`).
- `iIndepFun.hasGaussianLaw_fun_add`, `IndepFun.hasGaussianLaw`,
  `HasGaussianLaw.indepFun_of_covariance_eq_zero`, `IndepFun.hasGaussianLaw_sub_of_sub`
  (`Probability/Distributions/Gaussian/HasGaussianLaw/Independence.lean`);
  `HasGaussianLaw.memLp_two`.
- `charFun_gaussianReal`, `complexMGF_gaussianReal`, `gaussianReal_map_const_mul`
  (`Probability/Distributions/Gaussian/Real.lean`); `stdGaussian_map` (for a linear isometry
  equivalence), `map_pi_eq_stdGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean`).
- `Measure.ext_of_charFun` (finite measures,
  `MeasureTheory/Measure/CharacteristicFunction/Basic.lean`);
  `iteratedDeriv_charFun`, `contDiff_charFun`, `contDiff_charFun'` (under `MemLp id n μ`),
  `taylor_charFun_two` (centered, unit variance)
  (`MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean`).
- `complexMGF_mul_I`, `norm_complexMGF_le_mgf`, `analyticOnNhd_complexMGF` (on
  `{z | Re z ∈ interior (integrableExpSet X μ)}`) (`Probability/Moments/ComplexMGF.lean`);
  `hasDerivAt_mgf`, `iteratedDeriv_mgf` (at interior points of `integrableExpSet`)
  (`Probability/Moments/MGFAnalytic.lean`); `IndepFun.mgf_add` (`Probability/Moments/Basic.lean`).
- `iIndepFun_iff_map_fun_eq_pi_map` (probability measure, a.e. measurable coordinates);
  `IndepFun.covariance_eq_zero`, `covariance_add_left`, `covariance_sub_right` (square-integrable
  variables).
- `Complex.borelCaratheodory` (`Analysis/Complex/BorelCaratheodory.lean`: `f` holomorphic on
  `ball 0 R`, `Re f ≤ M`, `0 < M`, `0 < R`);
  `Differentiable.exists_eq_polynomial_eval_of_isBigO_pow` (`Analysis/Complex/Liouville.lean`);
  `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Cauchy estimates);
  `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` (identity theorem).
- `MeasureTheory.lintegral_liminf_le` (Fatou),
  `MeasureTheory.lintegral_rpow_eq_lintegral_meas_le_mul` (layer cake), `Matrix.det_vandermonde`.

### From Tau Ceti

- `Convex.isSimplyConnected` (`TauCeti/Analysis/Convex/SimplyConnected.lean`): a nonempty convex
  subset of a real topological vector space is simply connected.
- `TauCeti.exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean`):
  a holomorphic nowhere-zero function on a simply connected open set is `exp ∘ f` with `f`
  holomorphic.
- `TauCeti.Probability.indepFun_div_add_of_hasLaw_gammaMeasure`
  (`TauCeti/Probability/Distributions/Gamma/Beta.lean`): for `a, b, r > 0`, independent `X, Y`
  with laws `gammaMeasure a r` and `gammaMeasure b r`, `X/(X + Y)` is independent of `X + Y`.
- `TauCeti.Probability.mgf_id_gammaMeasure` (`…/Gamma/Basic.lean`, `t < r`) and
  `TauCeti.Probability.complexMGF_id_gammaMeasure` (`…/Gamma/CharFun.lean`, `Re z < r`):
  `(1 − t/r)^(−a)`.

## References

- W. Bryc, *The Normal Distribution: Characterizations with Applications*, Lecture Notes in
  Statistics 100, Springer, 1995; revised online version of 29 October 2008 from the author's
  page (homepages.uc.edu/~brycwz). Page numbers are those of the revised version.
- R. Ger, J. Misiewicz, J. Wesołowski, *The Lukacs theorem and the Olkin–Baker equation*,
  arXiv:1112.1226v2 (2012).
- Attributed through Bryc's bibliography, without locators: H. Cramér, Math. Z. 41 (1936)
  405–414; J. Marcinkiewicz, Math. Z. 44 (1938) 612–618; G. Pólya, Math. Z. 18 (1923); M. Kac,
  Amer. J. Math. 61 (1939) 726–728; S. N. Bernstein (1941); G. Darmois, Rev. Inst. Internat.
  Statist. 21 (1953) 2–8; V. P. Skitovich, Dokl. Akad. Nauk SSSR 89 (1953). Through Ger,
  Misiewicz and Wesołowski: E. Lukacs, Ann. Math. Statist. 26 (1955) 319–324.
