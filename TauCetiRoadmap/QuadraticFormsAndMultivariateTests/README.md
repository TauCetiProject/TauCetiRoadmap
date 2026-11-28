# Roadmap: quadratic forms in Gaussian vectors and multivariate tests

**Summary.** This roadmap treats the classical distribution theory of quadratic forms in a
Gaussian vector and two procedures built on it: Hotelling's test for a mean vector and
Fieller's confidence sets for a ratio of means. A Gaussian vector here has a mean `μ` and a
positive semidefinite covariance matrix `C`, which may be singular; the quadratic form of a
symmetric matrix `A` is `x ↦ xᵀ A x`.

The headline theorems are these.

- **The Craig–Sakamoto identity.** For real symmetric matrices `A` and `B`,
  `det(1 − sA − tB) = det(1 − sA) det(1 − tB)` for all `(s, t)` near `(0, 0)` if and only if
  `AB = 0`.
- **Craig's theorem.** For a centred Gaussian vector with covariance `C ⪰ 0`, the quadratic forms
  of symmetric `A` and `B` are independent if and only if `CACBC = 0`; for `C` invertible this
  is `ACB = 0`. A linear form `aᵀx` and the form of `A` are independent if and only if
  `CACa = 0` (Kac). The forms of `A` that are chi-squared with `r` degrees of freedom are those
  with `CACAC = CAC` and `tr(AC) = r`.
- **Hotelling's theorem.** For `n` independent observations with law `N(μ, S)`, `S` positive
  definite and `n > p ≥ 1` (where `p` is the dimension), the statistic `T²` built from the
  sample mean and the sample covariance matrix satisfies: `((n − p)/(p(n − 1))) T²` has the
  noncentral `F` law with degrees `p` and `n − p` and noncentrality
  `n (μ − μ₀)ᵀ S⁻¹ (μ − μ₀)`. Its inputs are the multivariate Student theorem (the sample mean
  and the scatter matrix are independent, Gaussian and Wishart) and the law of `yᵀ W⁻¹ y` for a
  Gaussian `y` independent of a Wishart `W`.
- **Fieller's theorem.** For a bivariate Gaussian observation with covariance `σ² V`, `V`
  positive definite, an independent variance estimate with `ν ≥ 1` degrees of freedom, and
  means with `μ₀ = ρ μ₁`, Fieller's set contains `ρ` with probability exactly the Student mass
  of `[−|q|, |q|]`, also when `μ₁ = 0`. The set is a bounded interval, two half-lines, one
  half-line or the whole line, according to two explicit inequalities.

The covariance `2 tr(ACBC) + 4 μᵀ A C B μ` of two quadratic forms completes the second layer.

The roadmap rests on Tau Ceti's Gaussian, chi-squared, Student, noncentral `F` and Wishart laws:
the moment-generating function of a Gaussian quadratic form, the independence criterion for
linear images, the Wick moments and the reciprocal diagonal entries of an inverted Wishart
matrix. It uses GaussianLinearModels (the standard-Gaussian chi-squared characterisation) and
sits beside MathematicalStatisticsFoundations and MathematicalStatisticsAsymptotic.

Layer 1 is matrix algebra. Layer 2 uses Layer 1 and the Gaussian laws. Layer 3 (Hotelling) and
Layer 4 (Fieller) use only the library and are independent of Layers 1 and 2.

## Conventions

- Vectors live in `EuclideanSpace ℝ ι` for a finite type `ι` (`Fin p` in Layer 3, `Fin 2` in
  Layer 4). A matrix acts by `Matrix.toEuclideanLin`, and the quadratic form of `A` is
  `x ↦ ⟪x, A.toEuclideanLin x⟫`. "Symmetric" is `Matrix.IsHermitian` over `ℝ`.
- `N(μ, C)` is Mathlib's `multivariateGaussian μ C`, the image of the standard Gaussian under
  `x ↦ μ + √C x` with `√C = CFC.sqrt C`. For `C` not positive semidefinite it is the point mass
  at `μ`, so every theorem assumes `C.PosSemidef`. We write `K = √C`; it is symmetric and
  positive semidefinite, `K² = C`, and `ker K = ker C`, `range K = range C`.
- `χ²(k)`, `t(ν)`, `F(m, n; λ)` are Tau Ceti's `chiSquaredMeasure k`, `studentTMeasure ν`,
  `noncentralFMeasure m n λ` (the law of `(X/m)/(Y/n)` for independent `X` of law
  `noncentralChiSquaredMeasure m λ` and `Y` of law `χ²(n)`; the zero measure unless `m, n > 0`).
  `W(ν, S)` is Tau Ceti's `wishartGramMeasure ν S`, the law of the Gram sum `∑ₖ zₖ zₖᵀ` of `ν`
  independent `N(0, S)` vectors; `wishartGram` is that Gram sum of a family of vectors, so the
  scatter matrix of a sample is `wishartGram` of its deviations from the sample mean.
- Matrix inverses are Mathlib's `Matrix.inv` (`0` for a singular matrix); `Real.toNNReal` turns
  a noncentrality into `ℝ≥0`.

## Layer 1: the Craig–Sakamoto identity

### 1.1 The determinant identity

**Statement** (`eventually_det_eq_mul_det_iff_mul_eq_zero`). Let `A`, `B` be real symmetric
`ι × ι` matrices. Then `det(1 − sA − tB) = det(1 − sA) det(1 − tB)` holds for all `(s, t)` in
a neighbourhood of `(0, 0)` if and only if `AB = 0`. (Ogawa–Olkin 2008, §2, identity (C) and
condition (O), stated there for all `s` and `t`; the identity on a neighbourhood is what the
moment-generating functions of Layer 2 give.)

Route, "if": `(1 − sA)(1 − tB) = 1 − sA − tB + st AB = 1 − sA − tB`, and the determinant is
multiplicative; symmetry is not used, and the identity then holds for all real `s`, `t`.

Route, "only if" (proved here).
1. Choose `ε > 0` with the identity on `|s|, |t| < ε` and `1 − tB` invertible for `|t| < ε`.
   For such `t` both sides are polynomials in `s` that agree on an interval, so they agree for
   every `s` (`Polynomial.eq_zero_of_infinite_isRoot`).
2. With `R_t = (1 − tB)⁻¹`, `det(1 − sA − tB) = det(1 − tB) det(1 − s R_t A)`, and
   `det(1 − tB) ≠ 0`, so `det(1 − s R_t A) = det(1 − sA)` for all `s`.
3. For any square `X`, the coefficients of `s` and `s²` in `det(1 − sX)` are `−tr X` and
   `((tr X)² − tr(X²))/2`. Comparing them gives `tr(R_t A) = tr A` and
   `h(t) := tr((R_t A)²) = tr(A²)` for `|t| < ε`.
4. `R_0 = 1`, `R' = R B R`, `R'' = 2 R B R B R`, so `h''(0) = 4 tr(A²B²) + 2 tr(ABAB)`, and
   `h''(0) = 0` since `h` is constant near `0`.
5. This is the identity `2 tr(A²B²) + tr(ABAB) = 0` of Ogawa–Olkin 2008, §3, (3.2), which
   they reach from moments. Put `G = AB`, so `Gᵀ = BA`, `tr(A²B²) = tr(G Gᵀ)` and
   `tr(ABAB) = tr(G²)`. Then
   `0 = 2 tr(G Gᵀ) + tr(G²) = tr(G Gᵀ) + ½ tr((G + Gᵀ)²)`; both terms are sums of squares of
   entries (the second of the symmetric matrix `G + Gᵀ`), so `G = 0`.

*Needs:* Mathlib `Matrix.det_mul`, `Polynomial.eq_zero_of_infinite_isRoot`,
`Matrix.trace_mul_comm`.

**Checks.**

- `A = [[0, −1], [−1, 0]]`, `B = diag(1, −1)`: `AB = [[0, 1], [−1, 0]] ≠ 0` while
  `tr(AB) = 0`, and `det(1 − sA − tB) − det(1 − sA) det(1 − tB) = −s²t²`. A vanishing
  first-order term does not suffice (Ogawa–Olkin 2008, §3).
- Symmetry is needed: `A = diag(1, 0)` and `B = [[0, 1], [0, 0]]` satisfy the identity for all
  `s`, `t` (both sides are `1 − s`), but `AB = B ≠ 0`.
- For the symmetric `A = [[1, 2, 0], [2, −1, 1], [0, 1, 3]]` and
  `B = [[2, 1, 1], [1, 0, −1], [1, −1, 1]]`, `h''(0) = 314 = 4 tr(A²B²) + 2 tr(ABAB)` and
  `2 tr(G Gᵀ) + tr(G²) = 157`.

### Examples

- `A = diag(1, 0)`, `B = diag(0, 2)`: `AB = 0` and the identity holds for all `s`, `t`.

### Dependencies

Mathlib only.

## Layer 2: quadratic forms in a Gaussian vector

In 2.1–2.3 the mean is `0`. Throughout, `C ⪰ 0`, `K = √C`, and `A' = K A K`, `B' = K B K`. The standard fact used in every
route: `N(0, C)` is the image of the standard Gaussian `z` under `K`, and
`⟪K z, A K z⟫ = ⟪z, A' z⟫`, so the form of `A` under `N(0, C)` has the law of the form of the
symmetric `A'` under the standard Gaussian. The matrix lemma (proved here): for every `M`,
`K M K = 0` if and only if `C M C = 0`. Indeed `CMC = K (KMK) K`; conversely, if `CMC = 0`
then `N = KMK` satisfies `K N K = 0`, so `N K u ∈ ker K ∩ range K = 0` for every `u`; `N`
vanishes on `range K` and, being `KMK`, on `ker K`, hence on `range K ⊕ ker K`, the whole space.

### 2.1 Chi-squared forms

**Statement** (`map_inner_multivariateGaussian_eq_chiSquared_iff`). For `C ⪰ 0`, symmetric `A`
and `r : ℕ`, the form of `A` under `N(0, C)` has law `χ²(r)` if and only if `CACAC = CAC` and
`tr(AC) = r`. (Styan 1969, §1, Theorem 2, p. 2, there with `rank(CAC) = tr(AC) = r`; under
`CACAC = CAC` the rank equals the trace.)

Route: by the standard fact and GaussianLinearModels 3.3 (`hasLaw_inner_apply_chiSquared_iff`,
in `EuclideanSpace ℝ ι` for the operator of `A'`), the law is `χ²(r)` if and only if `A'` is
idempotent of rank `r`. Now `A'² − A' = K(ACA − A)K`, which vanishes if and only if
`C(ACA − A)C = CACAC − CAC` does, by the matrix lemma. For idempotent `A'`, its rank is its trace
(`LinearMap.IsProj.trace`), and `tr A' = tr(AK²) = tr(AC)`.

*Needs:* GaussianLinearModels 3.3; Mathlib `multivariateGaussian`, `CFC.sqrt_mul_sqrt_self`,
`LinearMap.IsProj.trace`, `Matrix.trace_mul_comm`.

**Checks.**

- `C = diag(1, 0)`, `A = [[1, 5], [5, 7]]`: `CACAC = CAC = diag(1, 0)` and `tr(AC) = 1`; the
  form is `x₁²` almost surely, of law `χ²(1)`, although `A² ≠ A`.
- `C = diag(1, 0)`, `A = [[0, 1], [1, 0]]`: the form `2x₁x₂` is `0` almost surely, of law
  `χ²(0)`; `CAC = 0` and `tr(AC) = 0`, while `(AC)² = 0 ≠ AC`: idempotence of `AC` is
  sufficient but not necessary (compare Styan 1969, §1, Theorem 3, p. 2).
- `A = C⁺`, the Moore–Penrose inverse: `CC⁺CC⁺C = C = CC⁺C` and `tr(C⁺C) = rank C`, so the form
  is `χ²(rank C)`; this is the singular form of MathematicalStatisticsAsymptotic 1.3.
- `C = 0`: the form is `0`, the conditions read `0 = 0` and `0 = r`, and `χ²(0)` is the point
  mass at `0`.

### 2.2 Craig's theorem

**Statement** (`indepFun_inner_multivariateGaussian_iff`). For `C ⪰ 0` and symmetric `A`, `B`,
the forms of `A` and `B` are independent under `N(0, C)` if and only if `CACBC = 0`. (Styan
1969, §3, Theorem 5, p. 6, with mean `0`, attributed there to Khatri 1963; Ogawa–Olkin 2008, §2 and §5
for `C = 1` and `C` positive definite.)

Route, "if" (proved here). By the matrix lemma with `M = ACB`, `CACBC = 0` gives
`A'B' = KACBK = 0`. As `A'`, `B'` are symmetric, `range B' ⊆ ker A' = (range A')ᗮ`. The form
of `A'` is a function of the orthogonal projection of `z` onto `range A'` (since
`A' = P A' P` for that projection `P`), and likewise for `B'`; the two projections are
independent by Tau Ceti's `iIndepFun_orthogonalProjectionOnto_stdGaussian`.

Route, "only if" (proved here). Let `qA`, `qB` be the two forms. For `(s, t)` near `0`,
`1 − 2(sA' + tB')`, `1 − 2sA'` and `1 − 2tB'` are positive definite. Independence of `s qA` and
`t qB` and Mathlib's `IndepFun.mgf_add` at `1` give
`mgf(q_(sA+tB))(1) = mgf(qA)(s) mgf(qB)(t)`, and Tau Ceti's
`mgf_inner_toEuclideanLin_multivariateGaussian` evaluates the three as
`det(1 − 2(sA + tB)C)^(−1/2)`, `det(1 − 2sAC)^(−1/2)`, `det(1 − 2tBC)^(−1/2)`. Raising to the
power `−2` and using `det(1 − XC) = det(1 − KXK)` (`Matrix.det_one_sub_mul_comm` with `C = KK`)
gives the identity of 1.1 for `A'`, `B'` near `(0, 0)` after rescaling `(s, t)` by `2`. So
`A'B' = KACBK = 0`, and `CACBC = K(KACBK)K = 0`.

*Needs:* 1.1; Tau Ceti `mgf_inner_toEuclideanLin_multivariateGaussian`,
`iIndepFun_orthogonalProjectionOnto_stdGaussian`; Mathlib `IndepFun.mgf_add`,
`Matrix.det_one_sub_mul_comm`, `multivariateGaussian`.

**Checks.**

- `C = 1`, `A = [[0, −1], [−1, 0]]`, `B = diag(1, −1)`: the forms `−2x₁x₂` and `x₁² − x₂²` are
  uncorrelated (`tr(AB) = 0`) but dependent, since `AB ≠ 0`.
- `C = diag(1, 0)`, `A = diag(1, 0)`, `B = [[0, 1], [1, 0]]`: `AB ≠ 0` but `CACBC = 0`, and
  indeed the form `2x₁x₂` of `B` is `0` almost surely. The condition `AB = 0` is not necessary
  for singular `C`.

### 2.3 Kac's theorem

**Statement** (`indepFun_inner_inner_multivariateGaussian_iff`). For `C ⪰ 0`, symmetric `A` and
a vector `a`, `⟪a, x⟫` and the form of `A` are independent under `N(0, C)` if and only if
`CACa = 0`. (Ogawa–Olkin 2008, §7, for `C = 1`: `Aa = 0`, after Kac 1945.)

Route (proved here). "Only if": `⟪a, x⟫²` is the form of `aaᵀ` and is independent of the form
of `A`, so 2.2 gives `C a aᵀ C A C = (Ca)(CACa)ᵀ = 0`; if `Ca = 0` then `CACa = 0`, otherwise
`CACa = 0` from the outer product. "If": `⟪a, Kz⟫ = ⟪Ka, z⟫`, and `A'(Ka) = KACa`; since
`K(KACa) = CACa = 0`, `KACa ∈ ker K ∩ range K = 0`. So `Ka ⊥ range A'`, and the projections
of `z` onto the line of `Ka` and onto `range A'` are independent, as in 2.2.

*Needs:* 2.2; Tau Ceti `iIndepFun_orthogonalProjectionOnto_stdGaussian`.

**Checks.**

- `C = 1`, `a = e₁`: `x₁` is independent of `x₂²` (`A = e₂e₂ᵀ`, `Aa = 0`) and not of `x₁²`
  (`Aa = e₁`).
- `a = 0`: both sides hold.

### 2.4 Covariance of two quadratic forms

**Statement** (`covariance_inner_multivariateGaussian`). For `C ⪰ 0`, symmetric `A`, `B` and any
mean `μ`, under `N(μ, C)` the covariance of the forms of `A` and `B` is
`2 tr(ACBC) + 4 ⟪μ, ACBμ⟫`. (Proved here; the case `C = 1`, `μ = 0` is `F₁₁ = 2 tr AB` in
Ogawa–Olkin 2008, §3, (3.1).)

Route (proved here). Write `x = μ + y`, `y` centred. The form of `A` is
`⟪μ, Aμ⟫ + 2⟪Aμ, y⟫ + ⟪y, Ay⟫`. In the covariance, the constants drop; the mixed terms are
centred third moments, which vanish (`integral_prod_sub_multivariateGaussian_eq_zero_of_odd`);
`4 Cov(⟪Aμ, y⟫, ⟪Bμ, y⟫) = 4 ⟪Aμ, C Bμ⟫ = 4 ⟪μ, ACBμ⟫`; and by the fourth-moment formula
`E[yᵢyⱼyₖyₗ] = CᵢⱼCₖₗ + CᵢₖCⱼₗ + CᵢₗCⱼₖ` (`integral_mul_mul_mul_sub_multivariateGaussian`),
`Cov(⟪y, Ay⟫, ⟪y, By⟫) = ∑ AᵢⱼBₖₗ(CᵢₖCⱼₗ + CᵢₗCⱼₖ) = 2 tr(ACBC)`, using `Bᵀ = B`. All
moments are finite (`integrable_prod_pow_sub_multivariateGaussian`).

*Needs:* Tau Ceti `integral_mul_mul_mul_sub_multivariateGaussian`,
`integral_prod_sub_multivariateGaussian_eq_zero_of_odd`,
`integrable_prod_pow_sub_multivariateGaussian`; Mathlib `covariance`.

**Checks.**

- `C = LLᵀ` with `L = [[2, 0], [1, 3]]`, `μ = (1, −2)`, `A = [[1, 2], [2, −3]]`,
  `B = [[1/2, 1], [1, 4]]`: both sides equal `−3644`, computed from the moments of independent
  standard coordinates. With the singular `L = [[1, 0], [2, 0]]` and `μ = (3, 1)` both sides
  equal `603`.
- Symmetry of `A` is needed: `A = [[0, 1], [−1, 0]]` has form `0`, so the covariance is `0`,
  while for `C = 1`, `B = [[0, 1], [1, 0]]`, `μ = (1, 0)` the right side is `4`.

### Examples

- One-way analysis of variance: for `C = 1` and the within-group and between-group projections,
  `AB = 0`, so the two sums of squares are independent by 2.2 and chi-squared by 2.1.

### Dependencies

Layer 1; GaussianLinearModels 3.3; Tau Ceti's Gaussian quadratic-form, projection and moment
files.

## Layer 3: Hotelling's `T²`

For a sample `x : Fin n → ℝᵖ`, `x̄ = n⁻¹ ∑ xᵢ` and the scatter matrix is
`wishartGram (fun i ↦ xᵢ − x̄) = ∑ (xᵢ − x̄)(xᵢ − x̄)ᵀ`.

### 3.1 The multivariate Student theorem

**Statement** (`map_pi_multivariateGaussian_sampleMean_wishartGram`). Let `n ≥ 1` and `S ⪰ 0`.
Under the product of `n` copies of `N(μ, S)`, the pair `(x̄, scatter)` has the product law
`N(μ, S/n) ⊗ W(n − 1, S)`. (Wilkinson, MATH3030 notes, §7.1, Proposition 7.4, for the
independence and the law of the mean, and §7.2, Proposition 7.10, for the scatter law; `S` may be
singular here.)

Route.
1. Write `xᵢ = μ + K zᵢ` with `K = √S` and `z = (z₁, …, zₙ)` of law the product of `n` standard
   Gaussians on `ℝᵖ` (definition of `multivariateGaussian`, `Measure.pi_map_pi`). Through
   `WithLp.toLp` this product is the standard Gaussian of the Euclidean space
   `E = PiLp 2 (fun _ : Fin n ↦ ℝᵖ)`: both are images of the product of `np` standard normal
   coordinates under an orthonormal basis (`stdGaussian_eq_map_pi_orthonormalBasis`).
2. Extend `n^(−1/2)(1, …, 1)` to an orthonormal basis of `ℝⁿ` and let `H` be the orthogonal
   matrix with these rows, first row the constant one. The map `z ↦ w`, `wₖ = ∑ᵢ Hₖᵢ zᵢ`, is a
   linear isometry equivalence of `E`, since `‖w‖² = ∑ₖ ‖wₖ‖² = ∑ᵢ ‖zᵢ‖²` by `HᵀH = 1`; so `w`
   is again standard Gaussian on `E` (`stdGaussian_map`), and `w₁` and `(wₖ)_(k ≥ 2)` are
   independent, each with the product law.
3. `w₁ = √n z̄`, and `HᵀH = 1` gives `∑ₖ wₖwₖᵀ = ∑ᵢ zᵢzᵢᵀ`, hence
   `∑ᵢ (zᵢ − z̄)(zᵢ − z̄)ᵀ = ∑ᵢ zᵢzᵢᵀ − n z̄z̄ᵀ = ∑_(k ≥ 2) wₖwₖᵀ`.
4. So `x̄ = μ + K w₁/√n` has law `N(μ, S/n)`, and the scatter matrix is
   `K (∑_(k ≥ 2) wₖwₖᵀ) K`, the congruence by `K` of the Gram sum of `n − 1` independent standard
   vectors (`wishartGram_toEuclideanLin`), of law `W(n − 1, S)` by `wishartGramMeasure_eq_map_pi`
   and `wishartGramMeasure_eq_map_sqrt`. The two are functions of the independent blocks `w₁`
   and `(wₖ)_(k ≥ 2)`, so their joint law is the product.

*Needs:* Tau Ceti `wishartGram`, `wishartGram_toEuclideanLin`, `wishartGramMeasure_eq_map_pi`,
`wishartGramMeasure_eq_map_sqrt`; Mathlib `stdGaussian_map`,
`stdGaussian_eq_map_pi_orthonormalBasis`, `Orthonormal.exists_orthonormalBasis_extension`,
`multivariateGaussian`.

**Checks.**

- `n = 1`: the scatter is `0`, `W(0, S)` is the point mass at `0`, and `x̄ = x₁` has law
  `N(μ, S)`. For `n = 0` and `μ ≠ 0` the formula fails: `x̄ = 0` while `N(μ, 0)` is the point mass at
  `μ`.
- `n = p = 2`, `x = ((1, 2), (0, −1))`: the scatter `½ (1, 3)(1, 3)ᵀ` has determinant `0`.

### 3.2 A Gaussian vector against an independent Wishart matrix

**Statement** (`hasLaw_noncentralF_inner_inv_wishartGram`). Let `1 ≤ p ≤ m`, `S ≻ 0`, `y` of law
`N(δ, S)` and `W` of law `W(m, S)`, independent. Then `((m − p + 1)/p) ⟪y, W⁻¹y⟫` has law
`F(p, m − p + 1; ⟪δ, S⁻¹δ⟫)`. (Proved here; the central case `δ = 0` with `m = n − 1` is
Wilkinson, MATH3030 notes, §7.3, Definition 7.4, Proposition 7.11 and Proposition 7.12.)

Route.
1. Reduce to `S = 1`: with `K = √S`, `u = K⁻¹y` has law `N(K⁻¹δ, 1)`, and `V = K⁻¹WK⁻¹` has
   law `W(m, K⁻¹SK⁻¹) = W(m, 1)` (`map_symmetricCongruenceLinearMap_wishartGramMeasure` with
   `M = K⁻¹`); `u` and `V` are independent, `⟪y, W⁻¹y⟫ = ⟪u, V⁻¹u⟫` (both sides are `0` when `W`
   is singular), and `‖K⁻¹δ‖² = ⟪δ, S⁻¹δ⟫`.
2. `V` is positive definite almost surely (`ae_posDef_wishartGramMeasure`, `p ≤ m`) and `u ≠ 0`
   almost surely (`p ≥ 1`, and `N(K⁻¹δ, 1)` has no atom).
3. For `u ∈ ℝᵖ` put `v = u − ‖u‖e₀` and let `H_u = 1 − 2vvᵀ/‖v‖²` if `v ≠ 0` and `H_u = 1`
   otherwise. `H_u` is symmetric and orthogonal, `H_u u = ‖u‖e₀`, and `u ↦ H_u` is measurable
   (a piecewise definition on the measurable set `{v = 0}`). Then
   `⟪u, V⁻¹u⟫ = ⟪H_u u, (H_uVH_u)⁻¹ H_u u⟫ = ‖u‖² ((H_uVH_u)⁻¹)₀₀`. For each fixed orthogonal `H`,
   `V ↦ HVHᵀ` maps `W(m, 1)` to `W(m, HHᵀ) = W(m, 1)`
   (`map_symmetricCongruenceLinearMap_wishartGramMeasure`). As `u` and `V` are independent, the
   joint law of `(u, H_uVH_u)` is `∫ δ_u ⊗ (W(m, 1) mapped by H_u) dN(u) = N(K⁻¹δ, 1) ⊗ W(m, 1)`
   (Fubini, using the joint measurability of `(u, V) ↦ H_uVH_u`).
4. By Tau Ceti's `map_inv_inv_apply_nonsingularWishartMeasure` at scale `1⁻¹ = 1` (with
   `wishartGramMeasure_eq_nonsingularWishartMeasure`), `R = 1/((H_uVH_u)⁻¹)₀₀` has law
   `χ²(m − p + 1)`, and by step 3 it is independent of `u`; `‖u‖²` has law
   `noncentralChiSquaredMeasure p ‖K⁻¹δ‖²` (`map_norm_sq_multivariateGaussian_noncentral`).
5. `((m − p + 1)/p) ⟪u, V⁻¹u⟫ = (‖u‖²/p)/(R/(m − p + 1))`; conclude by
   `hasLaw_noncentralF_of_noncentralChiSquared`.

*Needs:* Tau Ceti `map_symmetricCongruenceLinearMap_wishartGramMeasure`,
`ae_posDef_wishartGramMeasure`, `map_inv_inv_apply_nonsingularWishartMeasure`,
`wishartGramMeasure_eq_nonsingularWishartMeasure`, `map_norm_sq_multivariateGaussian_noncentral`,
`hasLaw_noncentralF_of_noncentralChiSquared`; Mathlib `multivariateGaussian`.

**Checks.**

- `p ≤ m` is needed: for `m < p`, `W` is singular almost surely, `W⁻¹ = 0`, the statistic is
  `0`, while `F(p, m − p + 1; λ)` is the zero measure for `m − p + 1 ≤ 0`.
- Means: for `k = m − p + 1 > 2`, `E[⟪y, W⁻¹y⟫] = (p + λ)/(m − p − 1)` from the inverse-Wishart
  mean `S⁻¹/(m − p − 1)`, so the statistic has mean `k(p + λ)/(p(k − 2))`, the mean of
  `F(p, k; λ)`; for `p = 2`, `k = 5`, `λ = 3` both are `25/6`.
- `p = 1`: `S = (v)`, `W = v χ²(m)`, and the statistic is `m y²/W`, the square of a noncentral
  `t` variable with `m` degrees of freedom: `F(1, m; λ)`.

### 3.3 Hotelling's theorem

`hotellingTSq μ₀ x = n ⟪x̄ − μ₀, S_x⁻¹(x̄ − μ₀)⟫`, where `S_x = scatter/(n − 1)` is the sample
covariance matrix.

**Statement** (`hasLaw_noncentralF_hotellingTSq`). Let `1 ≤ p < n`, `S ≻ 0`, and let `X` have the
law of `n` independent `N(μ, S)` observations. Then `((n − p)/(p(n − 1))) T²` has law
`F(p, n − p; n ⟪μ − μ₀, S⁻¹(μ − μ₀)⟫)`; for `μ₀ = μ` it is the central `F(p, n − p)`.
(Wilkinson, MATH3030 notes, §7.3, Corollary 7.4, for `μ₀ = μ`, with divisor `n` in the
sample covariance; the noncentral law is proved here.)

Route. Put `y = √n(x̄ − μ₀)` and `W` the scatter matrix. By 3.1, `y` has law
`N(√n(μ − μ₀), S)`, `W` has law `W(n − 1, S)`, and they are independent; `n − 1 ≥ p`. On the
almost sure event where `W` is invertible, `T² = n ⟪x̄ − μ₀, (n − 1) W⁻¹ (x̄ − μ₀)⟫ =
(n − 1) ⟪y, W⁻¹y⟫`, so `((n − p)/(p(n − 1))) T² = (((n − 1) − p + 1)/p) ⟪y, W⁻¹y⟫`, and
3.2 with `m = n − 1` and `δ = √n(μ − μ₀)` gives the law.

*Needs:* 3.1, 3.2; Mathlib `Matrix.inv_smul`.

**Checks.**

- For the sample `(1, 2), (0, −1), (3, 1), (2, 5), (−1, 0)` and `μ₀ = (1, 1)`:
  `T² = 8/37`, and `((n − p)/(p(n − 1))) T² = 3/37 = ((m − p + 1)/p) ⟪y, W⁻¹y⟫`. The direction
  `a = S_x⁻¹(x̄ − μ₀)` gives the univariate `n (aᵀ(x̄ − μ₀))²/(aᵀ S_x a) = 8/37 = T²`.
- `n ≤ p`: the scatter has rank at most `n − 1 < p`, the inverse is `0`, `T² = 0`, and
  `F(p, n − p; λ)` is the zero measure.
- `p = 1`: `T² = t²` for the one-sample Student statistic and `F(1, n − 1)` is its law.

### Examples

- Two-sample Hotelling test: for samples of sizes `n₁`, `n₂` with common `S`, the pooled
  scatter has law `W(n₁ + n₂ − 2, S)` by 3.1 twice, and 3.2 applies to
  `y = (n₁n₂/(n₁ + n₂))^(1/2) (x̄₁ − x̄₂)`.

### Dependencies

Tau Ceti's Gaussian, Wishart, inverse-Wishart, chi-squared and noncentral `F` files.

## Layer 4: Fieller's confidence sets for a ratio

`fiellerSet y V c = {r | (y₀ − r y₁)² ≤ c (V₀₀ − 2r V₀₁ + r² V₁₁)}` for `y ∈ ℝ²`, a matrix `V`
and a threshold `c`. With `c = q² s²` it is the set of `r` at which the two-sided `t` test of
`μ₀ − r μ₁ = 0` with critical value `|q|` does not reject.

### 4.1 Fieller's theorem

**Statement** (`measure_mem_fiellerSet`). Let `V ≻ 0`, `σ > 0`, `ν ≥ 1`, `Y` of law
`N(μ, σ² V)`, `s` independent of `Y` with `ν s²/σ²` of law `χ²(ν)`, and `μ₀ = ρ μ₁`. Then for
every real `q`, `P(ρ ∈ fiellerSet Y V (q² s²)) = t(ν)([−|q|, |q|])`. (von Luxburg–Franz 2007,
§2.2, Definition 2 and Theorem 3, pp. 8–9, for a paired normal sample; Fieller 1954.)

Route (in our setting). Let `w = (1, −ρ)` and `D = ⟪w, Y⟫ = Y₀ − ρY₁`. By Tau Ceti's
`map_inner_multivariateGaussian`, `D` has law `N(⟪w, μ⟫, σ² ⟪w, Vw⟫) = N(0, σ² v)` with
`v = V₀₀ − 2ρV₀₁ + ρ²V₁₁ = ⟪w, Vw⟫ > 0`, since `w ≠ 0`; this holds also for `μ₁ = 0`, where
`μ = 0`. So `Z = D/(σ√v)` is standard normal, independent of `U = ν s²/σ²`, and
`T = Z/√(U/ν) = D/(|s|√v)` has law `t(ν)` (`hasLaw_studentT_of_gaussian_chiSquared`). Where
`s ≠ 0`, `ρ ∈ fiellerSet Y V (q²s²)` if and only if `T² ≤ q²`, that is `|T| ≤ |q|`. The event
`s = 0` is null, because `χ²(ν)` has no atom at `0` for `ν ≥ 1`.

*Needs:* Tau Ceti `map_inner_multivariateGaussian`, `hasLaw_studentT_of_gaussian_chiSquared`,
`chiSquaredMeasure_eq_gammaMeasure`.

**Checks.**

- `μ = 0` (so `μ₁ = 0` and every `ρ` qualifies): the coverage is the same for every `ρ`.
- `V ≻ 0` gives `v > 0` for every `ρ`: for `V = [[2, 1], [1, 1]]`,
  `min_r (2 − 2r + r²) = 1`.

### 4.2 The shape of Fieller's set

**Statement** (`fiellerSet_cases`). Let `V ≻ 0`, `c > 0`, `a = y₁² − c V₁₁` and
`Q = ⟪y, V⁻¹y⟫`. Then:
- if `a > 0`, the set is `[l₁, l₂]` with `l₁ < l₂`;
- if `a < 0` and `Q > c`, it is `(−∞, l₁] ∪ [l₂, ∞)` with `l₁ < l₂`;
- if `a = 0` and `Q > c`, it is a closed half-line;
- if `Q ≤ c`, it is the whole line.

(von Luxburg–Franz 2007, Definition 2, for the three cases `a > 0`, `a < 0 < Q − c` and
`Q ≤ c`; the case `a = 0` is added here.)

Route (proved here). The defining inequality is `a r² − 2b r + e ≤ 0` with
`b = y₀y₁ − cV₀₁` and `e = y₀² − cV₀₀`. Its reduced discriminant is
`b² − ae = c det(V) (Q − c)`, by expanding `Q = (y₀²V₁₁ − 2y₀y₁V₀₁ + y₁²V₀₀)/det V`. Also
`Q − y₁²/V₁₁ = (y₀V₁₁ − y₁V₀₁)²/(V₁₁ det V) ≥ 0`, so `a > 0` forces `Q > y₁²/V₁₁ > c` and a
positive discriminant: a closed bounded interval between distinct roots. For `a < 0` and a
positive discriminant the quadratic is `≤ 0` outside the open interval between its roots. For
`a = 0` and `Q > c`, `b ≠ 0` (else the discriminant `b²` would be `0`), and the set is a
half-line. For `Q ≤ c`: if `a < 0` the discriminant is `≤ 0` and the quadratic is `≤ 0`
everywhere; if `a = 0` then `Q = y₁²/V₁₁ = c`, so `y₀V₁₁ = y₁V₀₁`, which gives `b = 0` and
`e = −c det(V)/V₁₁ < 0`; and `a > 0` is impossible.

*Needs:* Mathlib `Matrix.inv_def`, `Matrix.det_fin_two`.

**Checks.** For `V = [[2, 1], [1, 1]]` and `c = 1`:
- `y = (3, 4)`: `a = 15`, `Q = 17`, set `[7/15, 1]`, discriminant `16 = c det V (Q − c)`;
- `y = (3, 1/2)`: `a = −3/4`, `Q = 13/2`, set `(−∞, −2/3 − 2√22/3] ∪ [−2/3 + 2√22/3, ∞)`;
- `y = (3, 1)`: `a = 0`, `Q = 5`, set `[7/4, ∞)`;
- `y = (1/2, 1/4)`: `Q = 1/8 ≤ 1`, the whole line; `y = (1, 1)`: `a = 0`, `Q = 1 = c`, the
  whole line.
- `c > 0` is needed for strict ends: at `c = 0` and `y = (3, 4)`, `a = 16 > 0` and the set is
  `{3/4}`.

### Examples

- Bioassay potency `ρ = μ₀/μ₁`: when the slope estimate `y₁` is not significantly different
  from `0` at the chosen level (`y₁² ≤ c V₁₁`), the set is unbounded.

### Dependencies

Tau Ceti's Gaussian, chi-squared and Student files.

## Scope and ownership

Owned here: the Craig–Sakamoto identity (1.1); the chi-squared criterion for a singular centred
covariance (2.1); Craig's (2.2) and Kac's (2.3) independence criteria; the covariance of two
Gaussian quadratic forms (2.4); the multivariate Student theorem (3.1); the Gaussian–Wishart
ratio law (3.2); Hotelling's theorem (3.3) and its statistic `hotellingTSq`; Fieller's theorem,
its set `fiellerSet` and the shape of the set (4.1, 4.2).

Left to others:
- GaussianLinearModels states the chi-squared characterisation for the standard Gaussian (3.3),
  used in 2.1, which adds the singular covariance; it also states Cochran's theorem and the
  means of quadratic forms (2.2 there), which are not restated.
- MathematicalStatisticsAsymptotic 1.3 states the noncentral chi-squared law of the Mahalanobis
  form `xᵀS⁻¹x` under `N(m, S)`, and its singular form `xᵀC⁺x`, which is the case `A = C⁺` of
  2.1 (a Check there); MathematicalStatisticsFoundations 9.5 states the algebraic
  properties of the scatter matrix. Neither is restated.
- Already in the library: the moment-generating function of a Gaussian quadratic form, the
  independence criterion for linear images of a Gaussian vector, the projection laws, the Wick
  moments, the Wishart laws and the reciprocal diagonal law of an inverted Wishart matrix.
- Not treated: noncentral forms of Craig's theorem, canonical correlations, Wilks' Λ and other
  likelihood-ratio tests, and quadratic forms in non-Gaussian vectors.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.multivariateGaussian μ S` (`Probability/Distributions/Gaussian/Multivariate`):
  the image of `stdGaussian` under `x ↦ μ + √S x`; the point mass at `μ` off `S ⪰ 0`.
- `ProbabilityTheory.stdGaussian_eq_map_pi_orthonormalBasis (b : OrthonormalBasis ι ℝ E)`, and
  `ProbabilityTheory.stdGaussian_map (f : E ≃ₗᵢ[ℝ] F)`: a linear isometry equivalence carries the
  standard Gaussian of `E` to that of `F`.
- `ProbabilityTheory.IndepFun.mgf_add`: for independent `X`, `Y` with `exp(tX)`, `exp(tY)` a.e.
  strongly measurable, `mgf (X + Y) μ t = mgf X μ t * mgf Y μ t`.
- `Matrix.det_one_sub_mul_comm (A : Matrix m n α) (B : Matrix n m α)`:
  `det (1 - A * B) = det (1 - B * A)`.
- `Polynomial.eq_zero_of_infinite_isRoot`: a polynomial with infinitely many roots is `0`.

### From Tau Ceti

- `TauCeti.Probability.mgf_inner_toEuclideanLin_multivariateGaussian`
  (`Probability/Distributions/Gaussian/QuadraticForm`): for `S ⪰ 0`, `Θ` symmetric and
  `1 − 2t √S Θ √S ≻ 0`, the mgf of `⟪x, Θx⟫` under `N(0, S)` at `t` is
  `det(1 − 2tΘS)^(−1/2)`.
- `TauCeti.Probability.iIndepFun_orthogonalProjectionOnto_stdGaussian`
  (`Probability/Distributions/Gaussian/Projection`): pairwise orthogonal subspaces give
  independent projections of the standard Gaussian.
- `TauCeti.Probability.map_inner_multivariateGaussian` (`Gaussian/Transforms`): for `S ⪰ 0`,
  `⟪q, x⟫` under `N(m, S)` has law `gaussianReal ⟪q, m⟫ ⟪q, Sq⟫`.
- `TauCeti.Probability.integral_mul_mul_mul_sub_multivariateGaussian` (`Gaussian/MixedMoments`),
  for `S ⪰ 0`; `integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (`Gaussian/OddMoments`);
  `integrable_prod_pow_sub_multivariateGaussian` (`Gaussian/MixedMoments`).
- `TauCeti.Probability.wishartGram`, `wishartGramMeasure`, `wishartGramMeasure_eq_map_pi`,
  `wishartGram_toEuclideanLin` (the Gram sum of `Mxᵣ` is `M (∑ xᵣxᵣᵀ) Mᵀ`),
  `wishartGramMeasure_eq_map_sqrt` (for `S ⪰ 0`) and
  `map_symmetricCongruenceLinearMap_wishartGramMeasure` (for `S ⪰ 0` and any `M`, the image of
  `W(ν, S)` under `X ↦ MXMᵀ` is `W(ν, MSMᵀ)`), all in `Wishart/Basic`;
  `ae_posDef_wishartGramMeasure` and `wishartGramMeasure_eq_nonsingularWishartMeasure`
  (`Wishart/Agreement`, for `S ≻ 0` and `p ≤ ν`).
- `TauCeti.Probability.map_inv_inv_apply_nonsingularWishartMeasure` (`Wishart/Inverse/Marginal`):
  for `S ≻ 0` and `p − 1 < n`, `1/(W⁻¹)ᵢᵢ` under `nonsingularWishartMeasure n S⁻¹` has the law
  of `(Sᵢᵢ)⁻¹ χ²(n − p + 1)`.
- `TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral`
  (`NoncentralChiSquared/Gaussian`): `‖x‖²` under `N(m, 1)` has law
  `noncentralChiSquaredMeasure (card ι) ‖m‖²`.
- `TauCeti.Probability.hasLaw_noncentralF_of_noncentralChiSquared` (`NoncentralF/Basic`), for
  `m, n > 0` and independent noncentral and central chi-squared variables.
- `TauCeti.Probability.hasLaw_studentT_of_gaussian_chiSquared` (`StudentT/ChiSquared`), for `ν > 0` and
  independent `N(0, 1)` and `χ²(ν)` variables; `chiSquaredMeasure_eq_gammaMeasure`
  (`ChiSquared/Basic`), for `k > 0`.

### From TauCetiRoadmap.GaussianLinearModels

- `hasLaw_inner_apply_chiSquared_iff` (3.3): for `Z` of law `stdGaussian F`, symmetric
  `A : F →ₗ[ℝ] F` and `r : ℕ`, `⟪Z, AZ⟫` has law `χ²(r)` if and only if `A` is idempotent and
  `finrank (range A) = r`.

## References

- J. Ogawa and I. Olkin, *A tale of two countries: the Craig–Sakamoto–Matusita theorem*,
  J. Statist. Plann. Inference 138 (2008) 3419–3428, doi:10.1016/j.jspi.2005.09.010.
- G. P. H. Styan, *Notes on the distribution of quadratic forms in singular normal variables*,
  Technical Report 122, School of Statistics, University of Minnesota, 1969 (University of
  Minnesota Digital Conservancy).
- U. von Luxburg and V. H. Franz, *A geometric approach to confidence sets for ratios: Fieller's
  theorem, generalizations, and bootstrap*, arXiv:0711.0198v1 (2007).
- R. Wilkinson, *MATH3030 Multivariate Statistics*, lecture notes, §7.1–§7.3,
  rich-d-wilkinson.github.io/MATH3030.
