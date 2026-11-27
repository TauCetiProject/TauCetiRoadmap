# Roadmap: scattered data interpolation with kernels

**Summary.** To interpolate data `f(x₁), …, f(x_N)` at scattered centres in `ℝᵈ` one takes a
function `Φ` on `ℝᵈ` and looks for `s = ∑ⱼ αⱼ Φ(· − xⱼ)` with `s(xᵢ) = f(xᵢ)`. The linear system
is uniquely solvable for every choice of distinct centres in every dimension exactly when `Φ` is
strictly positive definite, and this roadmap builds the theory that makes that question
decidable and the resulting interpolation quantitatively controlled:
- strictly positive definite functions: the strict half of Bochner's theorem (a function whose
  spectral measure has an interior point in its support is strictly positive definite), the
  characterization of continuous integrable ones by a nonnegative, nonzero Fourier transform,
  Askey's theorem on truncated powers `(1 − ‖x‖)₊^ℓ`, Schoenberg's theorem that
  `ψ(‖x‖²)` is strictly positive definite in every dimension iff `ψ` is completely monotone and not
  constant, and the Gaussian and inverse multiquadric kernels;
- Wendland's compactly supported functions `φ_{d,k}`: piecewise polynomials of degree
  `⌊d/2⌋ + 3k + 1`, of class `C^{2k}`, strictly positive definite on `ℝᵈ`, of minimal degree and
  unique up to a factor, with Fourier transforms decaying exactly like `‖ξ‖^{−d−2k−1}`;
- conditionally positive definite functions of order `m`, Micchelli's theorem
  (`φ(‖x‖²)` is conditionally positive semidefinite of order `m` in every dimension iff
  `(−1)^m φ^{(m)}` is completely monotone), the multiquadrics, powers and thin-plate splines, and
  interpolation with polynomial augmentation;
- the interpolant, its cardinal functions and the power function, which is the norm of the error
  functional in the native reproducing kernel Hilbert space and bounds the pointwise error by
  `P(x) ‖f‖`; local polynomial reproduction on domains with an interior cone condition and the
  error estimate `C h^{k+1/2−|α|} ‖f‖` in terms of the fill distance `h` for Wendland's functions;
- the separation distance and the lower bound for the smallest eigenvalue of the interpolation
  matrix, with its instances for the Gaussian (`e^{−c/q²}`) and for Wendland's functions
  (`q^{2k+1}`): the stability counterpart of the error estimates.

The roadmap rests on Tau Ceti's Bochner theorem and its Gaussian example, the
Hausdorff–Bernstein–Widder theorem for completely monotone functions, and Tau Ceti's Kolmogorov
space of a positive semidefinite kernel (Mathlib's reproducing kernel Hilbert space built from
the kernel), which is the native space. It takes the Gaussian and inverse multiquadric kernels
from [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md), which owns their
positive semidefiniteness and characteristic-kernel property and leaves strictness to this
roadmap; it takes the recurrences, half-odd orders, bounds and large-argument behaviour of J_ν
from [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md), and the Fourier transform of a
radial function as a Bessel integral from the roadmap on Euclidean motion groups and Bessel
functions, SpecialFunctionsMotionGroupsBessel (open PR #2933) §5.3; Askey's theorem and the
positive definiteness of Wendland's functions need both. The representer theorem of
[MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) is
the regularized relative of the projection property of Layer 4. The roadmap is a synthesis of
Wendland's monograph *Scattered Data Approximation*, the Acta Numerica survey of Fornberg and
Flyer, and the multidimensional Fourier analysis of Plonka, Potts, Steidl and Tasche; it follows
none of them section by section.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it; it is not an exhaustive
acceptance test, and the other headlines are targets of the same standing, stated in prose.

Suggested home: `TauCeti/Analysis/PositiveDefinite/Strict/` for Layer 1,
`TauCeti/Analysis/PositiveDefinite/Wendland/` for Layer 2,
`TauCeti/Analysis/PositiveDefinite/Conditional/` for Layer 3, and
`TauCeti/NumericalAnalysis/KernelInterpolation/` for Layers 4–6.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names, a source locator for a headline that restates a source result and a proof route
for a corollary or adaptation, and Checks, which are sanity checks of the key definitions and
theorems.

Layer 1 rests on Tau Ceti's Bochner theorem: positive semidefiniteness is already there, and every
result of Layer 1 is a strict version. 1.1 turns an interior point of the spectral support into
strictness through the linear independence of exponentials; 1.2 specializes to integrable
functions; 1.3 writes Fourier transforms of radial functions through Bessel functions (consumed
from SpecialFunctionsMotionGroupsBessel §5.3) and proves Askey's theorem; 1.4 combines strictness
of the Gaussian with the Hausdorff–Bernstein–Widder representation. Layer 2 uses 1.2–1.3:
Wendland's operator `I` lowers the dimension of a radial Fourier transform by two, which carries
Askey's truncated powers in dimension `d + 2k` to `φ_{d,k}` in
dimension `d`. Layer 3 uses 1.4 and the Hausdorff–Bernstein–Widder theorem; it is independent of
Layer 2. Layer 4 is linear algebra and Hilbert space geometry over an arbitrary kernel and needs
none of Layers 1–3. Layer 5 uses Layer 4, Layer 2 (smoothness of `φ_{d,k}`) and a piece of
approximation theory on cone domains (5.2). Layer 6 uses 1.2 and, for its last result, 2.4.

## Conventions

- **Points and functions.** Points live in `EuclideanSpace ℝ (Fin d)`, or in a finite-dimensional
  real inner product space `V` where no coordinates are needed. A function `Φ : V → ℂ` is
  *positive semidefinite* when `(x, y) ↦ Φ(x − y)` is Mathlib's `Matrix.PosSemidef`, and *strictly
  positive definite* when it is `Matrix.PosDef`. Mathlib's definitions quantify over finitely
  supported coefficient vectors `V →₀ ℂ`, so the centres are pairwise distinct by construction
  and the definitions apply to infinite index types; this is Wendland's Definition 6.1, p. 65.
  Tau Ceti's `TauCeti.IsPositiveDefiniteSub` is the semidefinite notion with families
  `Fin n → V`, equivalent by `TauCeti.IsPositiveDefiniteSub.posSemidef`. A real kernel
  `K : X → X → ℝ` is strictly positive definite when `Matrix.PosDef K` holds over `ℝ`; this
  includes symmetry. For a real `Φ` the real and complex notions agree (1.1), so every real
  example is stated over `ℝ`.
- **Radial functions.** Mathlib's `Function.IsRadial` functions are those of the form `φ ∘ ‖·‖`.
  Layers 1.3, 2, 5 and 6 write a radial function as `φ(‖x‖)` with a profile `φ : ℝ → ℝ`
  (Wendland's convention, Definition 6.15, p. 78); 1.4 and Layer 3 write it as `ψ(‖x‖²)`
  (Schoenberg's and Micchelli's convention). A profile is evaluated only at nonnegative arguments.
- **Fourier transform.** `𝓕` is Mathlib's, `𝓕 f(ξ) = ∫ f(x) e^{−2πi⟪x, ξ⟫} dx`, and Bochner's
  representation is Tau Ceti's `F(v) = ∫ fourierAtom v q dμ(q)` with
  `fourierAtom v q = e^{−2πi⟪v, q⟫}`. Wendland uses `(2π)^{−d/2} ∫ f(x) e^{−i⟪x, ω⟫} dx`, which is
  `(2π)^{−d/2} 𝓕 f(ω/2π)`; Plonka–Potts–Steidl–Tasche use `∫ f(x) e^{−i⟪x, ω⟫} dx`. Every
  statement here is in Mathlib's normalization, and the translation of a source formula is
  stated where it changes constants (1.3, 2.1, 6.2). Supports with nonempty interior, positivity
  and decay exponents are unaffected.
- **Radial Fourier transform.**
  `radialFourier d φ r = 2π r^{−(d−2)/2} ∫₀^∞ φ(t) t^{d/2} J_{(d−2)/2}(2πrt) dt`
  with Mathlib's `Complex.besselJ` and principal complex powers (Wendland's `F_d` of
  Theorem 5.26, p. 60, in Mathlib's normalization); it is `𝓕(φ ∘ ‖·‖)(ξ)` at `r = ‖ξ‖ > 0`
  (1.3). It is not the order-`ν` Hankel transform `∫₀^∞ φ(r) J_ν(Rr) r dr` of
  SpecialFunctionsMotionGroupsBessel §5.2, which this roadmap does not use.
- **Completely monotone functions** are Tau Ceti's: `TauCeti.IsCompletelyMonotoneOnIoi f` is
  `ContDiffOn ℝ ∞ f (Ioi 0)` with `(−1)ⁿ f⁽ⁿ⁾ ≥ 0` there (Wendland's Definition 7.1, p. 86), and
  `TauCeti.IsContinuousCompletelyMonotoneOnIoi` adds continuity on `[0, ∞)`. Smoothness is
  `C^∞`, written `((⊤ : ℕ∞) : WithTop ℕ∞)`, never the analytic `⊤ = ω` of `WithTop ℕ∞`.
- **Polynomials on `ℝᵈ`** are `MvPolynomial (Fin d) ℝ`, evaluated at the coordinates of a point;
  "degree" is `totalDegree`, so `π_{m−1}(ℝᵈ)` is `totalDegree < m`.
- **Conditional positive definiteness** is stated for real kernels and real coefficient vectors.
  For an even real `Φ` this is equivalent to Wendland's Definition 8.1, p. 97, with complex
  coefficients (the real and imaginary parts of a complex coefficient vector satisfy the
  side conditions separately and the cross terms cancel).
- **Interpolation.** `gramMatrix K x = (K(xᵢ, xⱼ))ᵢⱼ`; the interpolant and the cardinal functions
  are written with `(gramMatrix K x)⁻¹`, and every theorem about them assumes an invertible
  (or positive definite) Gram matrix, since Mathlib's inverse of a singular matrix is `0`.
- **Native space.** For a positive semidefinite real kernel `K`, `hK : Matrix.PosSemidef K`, the
  native space is Tau Ceti's Kolmogorov space `hK.KolmogorovSpace`
  (`Matrix.PosSemidef.KolmogorovSpace`), which is Mathlib's `RKHS.OfKernel` of
  `TauCeti.positiveDefiniteKernelOperator K`, the kernel with values `K(x, y) · id` in
  `ℝ →L[ℝ] ℝ`; the kernel section at `x` is `hK.kolmogorovFeature x`, the function
  `w ↦ K(w, x)`. This is the convention of
  [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md). Wendland's native space of a
  subset `Ω` is the space of restrictions, with the minimal norm of an extension (Theorems 10.46
  and 10.47, pp. 169–170); statements here use the native space of `ℝᵈ`, which bounds the same
  errors with the same constants.
- **Distances.** The fill distance `fillDistance Ω X = sup_{z ∈ Ω} dist(z, X)` is `ℝ≥0∞`-valued,
  `∞` for an empty `X` and a nonempty `Ω`; statements bound it by `ENNReal.ofReal h₀` before
  taking `toReal`. The separation distance is half the minimal distance between distinct centres
  and assumes at least two centres. The smallest eigenvalue of the interpolation matrix is stated
  as the quadratic-form bound `λ ‖α‖² ≤ αᵀ A α`, which avoids the ordering of
  `Matrix.IsHermitian.eigenvalues`.
- **Namespace.** The implementation is in the namespace `TauCeti`; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.ScatteredDataKernelInterpolation`.

## Layer 1: strictly positive definite functions

### 1.1 Strictness from the spectral support

- **Real and complex coefficients** (`posDef_ofReal_iff`; Wendland, Theorem 6.3, p. 66): for a real
  function `Φ` on an additive group, `(x, y) ↦ Φ(x − y)` is strictly positive definite with complex
  coefficients iff it is with real ones; the real condition includes that `Φ` is even. Proof: a
  complex coefficient vector `a + ib` gives the form `aᵀAa + bᵀAb` when `A` is real symmetric, and
  evenness is the symmetry of `A`.
- **Exponentials are independent on open sets** (`eq_zero_of_sum_fourierAtom_eq_zero`; Wendland,
  Lemma 6.7, p. 72): if `∑ⱼ cⱼ e^{−2πi⟪xⱼ, ω⟫} = 0` for all `ω` in a nonempty open set and the
  `xⱼ` are distinct, then `c = 0`. Proof: the sum is a real-analytic function of `ω` vanishing on
  an open set, hence everywhere; integrate it against a compactly supported bump translated
  by `−xₖ`, or use the uniqueness of Fourier transforms of finite measures.
- **Strict Bochner** (`posDef_of_interior_support_nonempty`; Wendland, Theorem 6.8, p. 73): if the
  support of a finite Borel measure `μ` on `V` has an interior point, then
  `v ↦ ∫ fourierAtom v q dμ(q)` is strictly positive definite. Proof:
  the form equals `∫ |∑ⱼ cⱼ e^{2πi⟪xⱼ, q⟫}|² dμ(q)`; if it vanishes, the continuous integrand
  vanishes on the support of `μ`, hence on an open set, and the previous bullet gives `c = 0`.

**Checks.**
- A Dirac measure at `0` has support `{0}`, with empty interior for `d ≥ 1`: the constant function
  `1` is positive semidefinite but not strictly positive definite (the vector `(1, −1)` at two
  centres gives `0`). This is the hypothesis a strictness statement must not drop.
- `sin(2πx)/(πx)` on `ℝ` is the transform of the uniform measure on `[−1, 1]`, whose support has
  interior, so it is strictly positive definite, although its kernel is not characteristic in the
  sense of [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) §8.1 (the support
  is not all of `ℝ`): strict positive definiteness and characteristicness are different
  conditions.
- `posDef_ofReal_iff`: `Φ(x) = sin x` on `ℝ` is odd, so neither side holds.

### 1.2 Integrable functions and the Gaussian

- **Integrable functions** (`posDef_iff_of_integrable`; Wendland, Theorem 6.11, p. 74): a continuous
  integrable `Φ : V → ℂ` is strictly positive definite iff it is bounded, `𝓕Φ(ξ) ≥ 0` for every
  `ξ` (in particular real) and `𝓕Φ ≠ 0`. Proof: one direction from Tau Ceti's
  `TauCeti.fourier_re_nonneg_of_posSemidef`, the bound `|Φ(x)| ≤ Φ(0)` and the injectivity of
  `𝓕` on `L¹`; for the other, a bounded continuous integrable `Φ` with nonnegative transform has
  `𝓕Φ ∈ L¹` (Wendland's Corollary 6.12, p. 76), so `Φ` is the Bochner transform of `𝓕Φ dξ`, whose
  support has interior since `𝓕Φ` is continuous and not zero; apply 1.1.
- **The Gaussian** (`posDef_gaussianKernel`; Wendland, Theorem 6.10, p. 74; Fornberg–Flyer,
  §2.2.1, pp. 220–222): `exp(−‖x − y‖²/(2σ²))` is strictly positive definite on every `ℝᵈ` for
  `σ > 0`. Proof: its Fourier transform is a positive Gaussian (Mathlib's
  `fourier_gaussian_innerProductSpace`); apply the previous bullet.

**Checks.**
- The triangle `(1 − |x|)₊` on `ℝ` has `𝓕` equal to `(sin πξ / πξ)²`, nonnegative and not zero, so
  it is strictly positive definite on `ℝ`; this is also the case `d = 1`, `ℓ = 1` of 1.3.
- The indicator of `[−1, 1]` is integrable and bounded, but discontinuous and with transform
  `sin(2πξ)/(πξ)` of both signs: the theorem needs continuity and the sign condition.
- `posDef_gaussianKernel` at one centre: the form is `c² > 0`; at two centres at distance `σ` the
  Gram matrix is `[[1, e^{−1/2}], [e^{−1/2}, 1]]`, with determinant `1 − e^{−1} > 0`.

### 1.3 Radial functions and truncated powers

- **Radial Fourier transform** (`radialFourier`): the profile transform of the Conventions.
- **Fourier transforms of radial functions** (consumed from SpecialFunctionsMotionGroupsBessel,
  open PR #2933, §5.3; Wendland, Theorem 5.26, p. 60; Plonka–Potts–Steidl–Tasche,
  Corollary 4.30, p. 181, and Remark 4.32, p. 182): for `d ≥ 1`, `φ(‖·‖)` integrable on `ℝᵈ` and
  `ξ ≠ 0`, `𝓕(φ ∘ ‖·‖)(ξ) = radialFourier d φ ‖ξ‖`. That roadmap states it with the hypothesis
  `∫₀^∞ |φ(t)| t^{d−1} dt < ∞`, which is the integrability of `φ(‖·‖)` by polar coordinates
  (Mathlib's `MeasureTheory.integral_fun_norm_addHaar`); this roadmap does not restate it. In
  Wendland's normalization the formula reads F_d φ(r) = r^{−(d−2)/2} ∫ φ(t) t^{d/2} J_{(d−2)/2}(rt)
  dt; Remark 4.32 of Plonka–Potts–Steidl–Tasche prints the power `t^{d/2−1}`, a misprint for
  `t^{d/2}` (their own case `d = 2`, (4.27), has `t¹`).
- **Truncated powers** (`truncatedPower`): `truncatedPower ℓ r = max (1 − r) 0 ^ ℓ`.
- **Askey's theorem** (`posDef_truncatedPower`; Wendland, Theorem 6.20, p. 80): `(1 − ‖x‖)₊^ℓ` is
  strictly positive definite on `ℝᵈ` for every integer `ℓ ≥ ⌊d/2⌋ + 1`. Proof route of Wendland,
  pp. 80–81: for odd `d = 2n + 1` and `ℓ = n + 1` the radial transform is
  `r^{−(3n+2)} ∫₀^r (r − s)^{n+1} s^{n+1/2} J_{n−1/2}(s) ds` up to a positive factor and a rescaling
  of `r`, which is nonnegative and not zero by Lemma 6.19, p. 79, an induction on `n` through the
  ladder relation `d/ds (s^ν J_ν(s)) = s^ν J_{ν−1}(s)` and the closed forms of `J_{±1/2}`
  ([SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) §§1.5, 2.3); conclude by 1.2.
  For general `d` and `ℓ` put `d' = 2ℓ − 1`: then `ℓ = ⌊d'/2⌋ + 1` and `d' ≥ d`, the odd case gives
  strict positive definiteness on `ℝ^{d'}`, and it passes to `ℝᵈ` (Lemma 6.17, p. 78; `ℝᵈ` embeds
  isometrically in `ℝ^{d'}`).

**Checks.**
- `radialFourier` for the Gaussian profile `e^{−at²}`: it equals `(π/a)^{d/2} e^{−π²r²/a}`, the
  Fourier transform of `e^{−a‖x‖²}` (Mathlib's `fourier_gaussian_innerProductSpace`); for
  `a = 1.3`, `r = 0.7` and `d = 3` both are `0.0910329976…`. With the misprinted power
  `t^{d/2−1}` the value in the normalization of Plonka–Potts–Steidl–Tasche at `‖ω‖ = 1.1` is
  `4.1488…` instead of `2.9768…`.
- `radialFourier` at `d = 1`: `J_{−1/2}(z) = (2/(πz))^{1/2} cos z`, and
  `radialFourier 1 φ r = 2 ∫₀^∞ φ(t) cos(2πrt) dt`, the cosine transform of the even extension.
- `radialFourier` at `d = 3`: `J_{1/2}(z) = (2/(πz))^{1/2} sin z` gives
  `radialFourier 3 φ r = (2/r) ∫₀^∞ φ(t) t sin(2πrt) dt`; the exponent `t^{d/2−1}` in place of
  `t^{d/2}` would give `(2/r) ∫ φ(t) sin(2πrt) dt` instead, which is not the transform.
- Askey's bound is sharp in the first case: `(1 − ‖x‖)₊` (`ℓ = 1 < ⌊3/2⌋ + 1`) is not positive
  semidefinite on `ℝ³`; its transform `(2/ρ) ∫₀¹ (1 − t) t sin(2πρt) dt` takes the value
  `−0.0233…` at `ρ ≈ 1.164`, and a Gaussian-windowed wave packet of that frequency on a `27³`
  grid of spacing `0.12` gives the quadratic form `−1209.6…`.
- `truncatedPower`: `truncatedPower 2 (1/2) = 1/4`, and `truncatedPower ℓ r = 0` for `r ≥ 1` and
  `ℓ ≥ 1`; without the `max`, `(1 − r)²` at `r = 3` would be `4`, not `0`.

### 1.4 Completely monotone profiles

- **Schoenberg's theorem, strict form** (`posDef_sq_norm_iff`; Wendland, Theorems 7.13–7.14,
  pp. 93–95): for `ψ` continuous on `[0, ∞)`, `ψ(‖x − y‖²)` is strictly positive definite on every
  `ℝᵈ` iff `ψ` is completely monotone on `(0, ∞)` and not constant. Wendland's positive definite
  functions are continuous by definition (Definition 6.1, p. 65); here continuity is a
  hypothesis. Proof: by Tau Ceti's
  `TauCeti.hausdorff_bernstein_widder`, `ψ(t) = ∫ e^{−st} dμ(s)` for a finite measure `μ` on
  `[0, ∞)`; `ψ` is not constant iff `μ` is not concentrated at `0`; the form is then
  `∫ (αᵀ (e^{−s‖xᵢ − xⱼ‖²})ᵢⱼ α) dμ(s)`, positive by 1.2 on the set `s > 0` of positive measure.
  Conversely, Schoenberg's Theorem 7.13, p. 93, shows that positive semidefiniteness in every
  dimension makes `ψ` a Laplace transform of a finite measure on `[0, ∞)` (by Bochner in each
  dimension and the limit `d → ∞` of the spherical means of `fourierAtom`, which tend to
  Gaussians); a constant `ψ` gives the form `0` at `(1, −1)`.
- **Inverse multiquadrics** (`posDef_imqKernel`; Wendland, Theorem 7.15, p. 95; Fornberg–Flyer,
  §2.2.2, p. 222): `(c² + ‖x − y‖²)^{−β}` is strictly positive definite on every `ℝᵈ` for `c > 0`,
  `β > 0`. Proof: `ψ(t) = (c² + t)^{−β} = Γ(β)⁻¹ ∫₀^∞ s^{β−1} e^{−c²s} e^{−ts} ds` is completely
  monotone and not constant; apply the previous bullet. Wendland's earlier Theorem 6.13, p. 76,
  proves the case `β > d/2` from the transform `K_{d/2−β}`; the case `β ≤ d/2` needs this route.

**Checks.**
- `posDef_sq_norm_iff`: `ψ(t) = e^{−t}` qualifies; `ψ ≡ 1` is completely monotone but constant and
  fails at `(1, −1)`; `ψ(t) = 1/(1 + t)` qualifies; `ψ(t) = 1 − t` is not completely monotone, and
  at two centres at distance `2` the Gram matrix `[[1, −3], [−3, 1]]` is indefinite.
- Continuity cannot be dropped: `ψ = 1` at `0` and `0` elsewhere gives the identity Gram matrix
  at distinct centres, strictly positive definite in every dimension, but it is not completely
  monotone.
- `posDef_imqKernel` with `c = 1`, `β = 1/2` at distance `1` has entry `1/√2`; with `β < 0` the
  function is the multiquadric `(c² + r²)^{|β|}`, which is conditionally positive definite of
  order `⌈|β|⌉` but not positive definite (3.3).

## Layer 2: compactly supported functions of minimal degree

### 2.1 Wendland's operator and the dimension walk

- **Wendland's operator** (`radialIntegral`; Wendland, Definition 9.4, p. 121):
  `(Iφ)(r) = ∫_r^∞ t φ(t) dt`.
- **Dimension walk** (`radialFourier_radialIntegral`; Wendland, Theorem 9.6 (1), p. 121): for
  `d ≥ 3`, a continuous `φ` with `t^{d−1} φ(t)` integrable on `(0, ∞)`, and `r > 0`,
  `radialFourier d φ r = 2π · radialFourier (d − 2) (Iφ) r`. Wendland's identity
  F_d φ = F_{d−2}(Iφ) carries the factor `2π` in Mathlib's normalization. Proof: integrate by
  parts in `t` with the ladder relation `d/dt (t^ν J_ν(t)) = t^ν J_{ν−1}(t)` of
  [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) §1.5, the boundary terms vanishing
  by the behaviour of J_ν at `0` and `∞` (§§2.2, 6.2 there).

**Checks.**
- For the Gaussian profile `e^{−1.3t²}` both sides agree to ten digits at `d = 3, 4, 5` and
  `r = 0.3, 0.9` (`d = 3`, `r = 0.3`: `1.8969894459`).
- `I` maps `(1 − r)₊^ℓ` to `(1 − r)₊^{ℓ+1} ((ℓ + 1) r + 1) / ((ℓ + 1)(ℓ + 2))` on `[0, ∞)`; at
  `ℓ = 1`, `r = 0` both sides are `∫₀¹ t(1 − t) dt = 1/6`.
- `radialIntegral` of `φ ≡ 1` is the junk `0`, since `t ↦ t` is not integrable on `(r, ∞)`: the
  dimension walk carries the integrability of `t^{d−1} φ(t)`, which also makes `t φ(t)`
  integrable on `(r, ∞)` for `r > 0`.

### 2.2 The functions `φ_{d,k}`

- **Definition** (`wendland`; Wendland, Definition 9.11, p. 128):
  `φ_{d,k} = I^k (1 − r)₊^{⌊d/2⌋ + k + 1}`, iterating `radialIntegral` on `truncatedPower`.
- **Piecewise polynomial** (`wendland_eq_polynomial`; Wendland, Theorems 9.12–9.13, p. 128): on
  `[0, 1]` the function `φ_{d,k}` agrees with a polynomial of degree exactly `⌊d/2⌋ + 3k + 1`, and
  it vanishes on `[1, ∞)`. Proof: `I` raises the degree of a polynomial vanishing at `1` by two and
  keeps it vanishing at `1`; induction on `k`.
- **Smoothness** (`contDiff_wendland`; Wendland, Theorem 9.13, p. 128, and Lemma 9.8, p. 124):
  `r ↦ φ_{d,k}(|r|)` is `C^{2k}` on `ℝ`, and `x ↦ φ_{d,k}(‖x‖)` is `C^{2k}` on `ℝᵐ` for every `m`.
  Proof: the polynomial has a zero of order `⌊d/2⌋ + 2k + 1 ≥ 2k + 1` at `1`, and its odd
  coefficients of degree `< 2k` vanish (Theorem 9.12), so the even extension is `C^{2k}` at `0` and
  at `±1`. On `ℝᵐ`, near `0` the function is a polynomial in `‖x‖²` plus terms `cⱼ ‖x‖^j` with odd
  `j ≥ 2k + 1`, each `C^{j−1}`; near the sphere `‖x‖ = 1` the norm is smooth and the zero of order
  `2k + 1` at `1` gives `C^{2k}`.
- **Positive definiteness** (`posDef_wendland`; Wendland, Theorem 9.13, p. 128): `φ_{d,k}(‖x − y‖)`
  is strictly positive definite on `ℝᵈ`. Proof: by 2.1 applied `k` times, the radial transform of
  `φ_{d,k}` in dimension `d` is `(2π)^k` times that of `(1 − r)₊^{⌊d/2⌋+k+1}` in dimension
  `d + 2k`, which is nonnegative and not zero by 1.3 since `⌊(d + 2k)/2⌋ + 1 = ⌊d/2⌋ + k + 1`;
  conclude by 1.2 and 1.3. For `d ≤ 2` the walk starts from dimension `d + 2k ≥ 3` only when
  `k ≥ 1`; for `k = 0` the statement is Askey's theorem itself.
- **The case `k = 1`** (`wendland_one`; Wendland, Corollary 9.14, p. 129): with `ℓ = ⌊d/2⌋ + 2`,
  `φ_{d,1}(r) = (1 − r)₊^{ℓ+1} ((ℓ + 1) r + 1) / ((ℓ + 1)(ℓ + 2))` for `r ≥ 0`. Wendland's table
  lists the forms up to a positive factor; the factor here is exact.

**Checks.**
- `wendland_zero` (proved): `φ_{d,0} = (1 − r)₊^{⌊d/2⌋+1}`.
- `φ_{3,1}(r) = (1 − r)₊⁴ (4r + 1)/20` and `φ_{3,2}(r) = (1 − r)₊⁶ (35r² + 18r + 3)/1680` on
  `[0, ∞)`, matching Wendland's Table 9.1, p. 129, up to the factors `1/20` and `1/1680`.
- The degree `⌊d/2⌋ + 3k + 1` holds for `d = 1, …, 5` and `k = 0, …, 3` (exact computation); the
  degree `⌊d/2⌋ + 3k` would already fail at `φ_{1,0} = (1 − r)₊`.
- Smoothness is not more than `C^{2k}` in general: `φ_{1,0}(|r|) = (1 − |r|)₊` is continuous but
  not differentiable at `0` or at `±1`.

### 2.3 Minimal degree and uniqueness

- **Minimality** (`wendland_minimal_degree`; Wendland, Theorem 9.13, p. 128): let `d ≥ 1` and `p` a
  polynomial such that the profile equal to `p` on `[0, 1]` and to `0` on `(1, ∞)` has a `C^{2k}`
  even extension and gives a strictly positive definite function on `ℝᵈ`. Then
  `deg p ≥ ⌊d/2⌋ + 3k + 1`, and if equality holds the profile is a positive multiple of `φ_{d,k}`
  on `[0, ∞)`. Proof route of Wendland, p. 129: Wendland's operator `D = −r⁻¹ d/dr` inverts `I`
  (Lemma 9.5, p. 121) and walks up in dimension (Theorem 9.6 (2), p. 121), so `D^k` of the profile
  is a continuous compactly supported profile that is positive definite on `ℝ^{d+2k}`; such a
  profile has `⌊d/2⌋ + k` continuous derivatives at `1` (Theorem 9.9, p. 124), hence a zero of
  order `⌊d/2⌋ + k + 1` there, which bounds its degree below and, at equality, makes it a multiple
  of the truncated power.

**Checks.**
- `d = 3`, `k = 0`: the only degree-one candidate vanishing at `1` is `a(1 − r)`, which fails on
  `ℝ³` (1.3, Checks), consistent with the minimal degree `2`. At degree `2` the candidates
  `(1 − r)(1 + br)` have a transform with negative values on `ℝ³` for
  `b ∈ {−1.5, −1.1, −0.9, −0.5, 0, 0.5}` and a nonnegative one at `b = −1`, the multiple `(1 − r)²`
  of `φ_{3,0}`: the uniqueness clause.
- `d = 1`, `k = 1`: a `C²` even profile vanishing to third order at `1` with `p'(0) = 0` is a
  multiple of `(1 − r)³(3r + 1)`, of degree `4`, which is `φ_{1,1}` up to the factor `1/12`.

### 2.4 Fourier decay

- **Two-sided decay** (`fourier_wendland_bounds`; Wendland, Theorem 10.35, p. 160): for `k ≥ 1`, or
  `k = 0` and `d ≥ 3`, there are `c₁, c₂ > 0` with
  `c₁ (1 + ‖ξ‖)^{−(d+2k+1)} ≤ 𝓕(φ_{d,k} ∘ ‖·‖)(ξ) ≤ c₂ (1 + ‖ξ‖)^{−(d+2k+1)}` for every `ξ`, the
  transform being real. Proof route of Wendland, pp. 157–160 (Lemmas 10.31–10.34): by 2.1 the
  transform is that of a truncated power in dimension `d + 2k`, an integral of J_ν against a
  polynomial weight whose asymptotics for large `‖ξ‖` follow from the large-argument expansion of
  J_ν ([SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) §6.2); continuity and
  positivity (2.2) give the bounds on compact sets. The constants depend on Mathlib's
  normalization; the exponent does not.

**Checks.**
- `d = 1`, `k = 0` is excluded: `𝓕` of `(1 − |x|)₊` is `(sin πξ/πξ)²`, which vanishes at every
  nonzero integer, so no lower bound holds.
- Numerically, `(1 + r)^{d+2k+1}` times the radial transform stays between positive constants
  on `r ∈ [0.5, 40]` for `(d, k) = (1, 1), (2, 1), (3, 0), (3, 1)`, while for the excluded
  `(1, 0)` its minimum on a grid drops to `3.5·10⁻¹³`.

## Layer 3: conditionally positive definite functions

### 3.1 Definitions

- **Side conditions** (`AnnihilatesPolynomials`): a finitely supported `c : ℝᵈ →₀ ℝ` annihilates
  the polynomials of degree `< m` when `∑ₓ c(x) p(x) = 0` for every `p` with `totalDegree p < m`.
- **Conditional positive (semi)definiteness** (`IsCondPosSemidef`, `IsCondPosDef`; Wendland,
  Definition 8.1, p. 97): the form `∑ₓ ∑_y c(x) K(x, y) c(y)` is nonnegative, respectively positive
  for `c ≠ 0`, on every `c` that annihilates the polynomials of degree `< m`.

**Checks.**
- `isCondPosSemidef_zero_iff` (proved): order `0` is Mathlib's `Matrix.PosSemidef` for a symmetric
  kernel.
- `−‖x − y‖²` is conditionally positive semidefinite of order `1` but not definite: the form is
  `2‖∑ c(x) x‖²`, which vanishes at the centres `0, 1, 2` of `ℝ` with `c = (1, −2, 1)`; this is
  the polynomial case excluded in 3.2.
- Order `m` implies order `m + 1` (fewer coefficient vectors). `−‖x − y‖` is conditionally
  positive definite of order `1` (3.3) but not positive semidefinite: at two centres at distance
  `1` the form is `−2 < 0` for `c = (1, 1)`, a vector that order `1` excludes, and `2 > 0` for
  `c = (1, −1)`.
- `AnnihilatesPolynomials`: order `0` holds for every `c`, order `1` means `∑ c(x) = 0`; on `ℝ`
  the vector `(1, −1)` at `0, 1` annihilates the constants but not the linear polynomials
  (`∑ c(x) x = −1`), so it is admissible for order `1` and not for order `2`.

### 3.2 Micchelli's theorem

- **Micchelli** (`micchelli`; Wendland, Theorem 8.19, p. 113): let `φ` be continuous on `[0, ∞)` and
  `C^∞` on `(0, ∞)`. Then `φ(‖x − y‖²)` is conditionally positive semidefinite of order `m` on every
  `ℝᵈ` iff `(−1)^m φ^{(m)}` is completely monotone on `(0, ∞)`. Proof route of Wendland,
  pp. 113–115: for "if", Tau Ceti's `TauCeti.hausdorff_bernstein_widder_onIoi` represents
  `(−1)^m φ^{(m)}` as a Laplace transform of a measure on `[0, ∞)` that need not be finite;
  integrating `m` times writes `φ` as a polynomial of degree `≤ m` plus
  `∫ (e^{−st} − T_{m−1}(e^{−st}))(−s)^{−m} dμ(s)` with the Taylor polynomial `T_{m−1}`; the
  polynomial part and the Taylor terms are killed by the side conditions, and the Gaussians are
  positive semidefinite (1.2). For "only if", induction on `m` with the case `m = 0` from 1.4.
- **Strictness** (`isCondPosDef_of_completelyMonotone`; Wendland, Corollary 8.20, p. 115): if
  moreover `φ` agrees on `[0, ∞)` with no polynomial of degree `≤ m`, the kernel is conditionally
  positive definite of order `m` on every `ℝᵈ`. Proof: the measure above is then not concentrated
  at `0`, and the Gaussians are strictly positive definite (1.2).

**Checks.**
- `m = 0`, `φ(t) = −t`: `(−1)⁰ φ = −t` is not completely monotone, and two centres at distance `1`
  with `c = (1, 1)` give `−2`.
- `m = 1`, `φ(t) = −t`: `(−1) φ' = 1` is completely monotone, but `φ` is a polynomial of degree `1`,
  and the form is only semidefinite (3.1, Checks).
- The hypothesis is `C^∞` on `(0, ∞)`, not real analyticity: the analytic reading `ContDiffOn ℝ ⊤`
  of `WithTop ℕ∞` would exclude no example here but would be a stronger hypothesis than the
  theorem needs.

### 3.3 Multiquadrics, powers and thin-plate splines

- **Multiquadrics** (`isCondPosDef_multiquadric`; Wendland, Corollary 8.18 (1), p. 113):
  `(−1)^{⌈β⌉} (c² + ‖x − y‖²)^β`, `c > 0`, `β > 0`, `β ∉ ℕ`, is conditionally positive definite of
  order `⌈β⌉`.
- **Powers** (`isCondPosDef_power`; Wendland, Corollary 8.18 (2), p. 113): `(−1)^{⌈β/2⌉} ‖x − y‖^β`,
  `β > 0`, `β ∉ 2ℕ`, is conditionally positive definite of order `⌈β/2⌉`.
- **Thin-plate splines** (`isCondPosDef_thinPlate`; Wendland, Corollary 8.18 (3), p. 113):
  `(−1)^{k+1} ‖x − y‖^{2k} log ‖x − y‖`, `k ≥ 1`, is conditionally positive definite of order
  `k + 1`; Mathlib's `Real.log 0 = 0` gives the correct value `0` on the diagonal.
- Proof route (Wendland proves Corollary 8.18 through generalized Fourier transforms,
  Theorems 8.15–8.17, pp. 109–112, and again through Micchelli's theorem in the Examples after
  Corollary 8.20, pp. 115–116; Fornberg–Flyer, §2.2.2, p. 223, for the multiquadric): apply 3.2 to
  `φ(t) = (−1)^{⌈β⌉}(c² + t)^β`, `(−1)^{⌈β/2⌉} t^{β/2}` and `(−1)^{k+1} t^k log(t)/2`, whose
  `m`-th derivatives are `(−1)^m` times a positive multiple of `(c² + t)^{β−m}`, `t^{β/2−m}` and
  `1/t`, completely monotone because the exponents are negative; none is a polynomial.

**Checks.**
- The orders are sharp numerically: for 25 random centres in `[0, 2]ᵈ`, `d = 2, 3`, the form
  restricted to the side conditions of order `m` has positive minimal eigenvalue and that of order
  `m − 1` a negative one, for the multiquadrics `β = 0.5, 1.5, 2.3`, the powers `β = 0.7, 1, 3` and
  the thin-plate splines `k = 1, 2`; for `d = 1` the multiquadric minima at six centres are
  positive, of order `10⁻³` (50-digit arithmetic).
- `β ∈ 2ℕ` is excluded from the powers: `‖x‖²` is a polynomial and only semidefinite (3.1,
  Checks).

### 3.4 Interpolation with polynomial augmentation

- **Unique solvability** (`existsUnique_augmentedInterpolant`; Wendland, Theorem 8.21, p. 117): if
  `K` is conditionally positive definite of order `m` and the distinct centres are unisolvent for
  the polynomials of degree `< m` (such a polynomial vanishing at all centres is `0`), then for
  every data vector `y` there is exactly one pair `(α, p)` with `p` of degree `< m` (and `p = 0`
  for `m = 0`), `α` annihilating the polynomials of degree `< m`, and
  `∑ⱼ αⱼ K(xᵢ, xⱼ) + p(xᵢ) = yᵢ` for all `i`. Proof: a null vector `(α, β)` of the square system
  satisfies `αᵀ A α = −(Pᵀα)ᵀ β = 0`, so `α = 0` by conditional positive definiteness, and then
  `Pβ = 0` gives `β = 0` by unisolvence; the symmetry of `K` is not used.
- **Polynomial reproduction** (prose target): under the same hypotheses, for data `y = q(x)` with
  `q` of degree `< m` the solution is `(0, q)`, so the augmented interpolant reproduces
  `π_{m−1}(ℝᵈ)`. Proof: `(0, q)` solves the system; apply uniqueness.

**Checks.**
- `m = 0` is plain interpolation with a strictly positive definite kernel.
- Unisolvence cannot be dropped: for the thin-plate spline in `ℝ²` (`m = 2`) and three collinear
  centres, the linear polynomial vanishing on the line is a nonzero null direction.

## Layer 4: interpolation, cardinal functions and the power function

### 4.1 The interpolant and the cardinal functions

- **Definitions** (`gramMatrix`, `kernelInterpolant`, `cardinalFunction`; Fornberg–Flyer,
  (2.3)–(2.4), p. 218; Wendland, (11.2), p. 173): `s = ∑ⱼ αⱼ K(·, xⱼ)` with `α = A⁻¹y`, and the
  cardinal functions `u*(z) = A⁻¹ (K(xᵢ, z))ᵢ`.
- **Interpolation** (`kernelInterpolant_spec`; Wendland, (6.1)–(6.2), p. 64, and Theorem 11.1 with
  (11.2), p. 173): for a symmetric kernel with invertible Gram matrix, `s(xᵢ) = yᵢ`; every
  combination of kernel sections that interpolates `y` is `s`; `s = ∑ⱼ yⱼ u_j*`; and
  `u_j*(x_k) = δ_{jk}`. Proof: linear algebra with `A⁻¹A = 1` and the symmetry of `A`.

**Checks.**
- One centre: `s = y₁ K(·, x₁)/K(x₁, x₁)` and `u₁* = K(·, x₁)/K(x₁, x₁)`.
- With a singular Gram matrix (the constant kernel and two centres) Mathlib's `A⁻¹ = 0` makes
  `s = 0`, which does not interpolate `y = (1, 1)`: the invertibility hypothesis is needed.

### 4.2 The power function

- **Definitions** (`powerQuadraticForm`, `powerFunction`; Wendland, Definition 11.2, p. 174, with
  `α = 0`): `Q_z(u) = K(z, z) − 2 ∑ⱼ uⱼ K(z, xⱼ) + ∑ᵢⱼ uᵢuⱼ K(xᵢ, xⱼ)` and `P(z) = √(Q_z(u*(z)))`.
- **Minimization** (`powerFunction_sq_le`; Wendland, Theorem 11.5, p. 177, with `α = 0` and no
  polynomial space): for a positive semidefinite kernel with positive definite Gram matrix,
  `P(z)² = Q_z(u*(z)) = min_u Q_z(u)`. Proof: `Q_z` is a strictly convex quadratic with gradient
  `2(Au − r(z))`, which vanishes at `u*(z)`; `Q_z ≥ 0` because it is the kernel form at the
  coefficient vector `δ_z − ∑ uⱼ δ_{xⱼ}`.

**Checks.**
- `P(xⱼ) = 0` at every centre (take `u = eⱼ`), and `P(z)² = K(z, z) − r(z)ᵀ A⁻¹ r(z)` (checked to
  `10⁻¹⁰` for the Gaussian at 12 random centres in `[0, 1]²`).
- For the Gaussian at those centres, `|f(z) − s(z)| ≤ P(z) ‖f‖` holds with ratio at most `0.041`
  over 200 random points `z` for `f = ∑ cᵢ K(·, yᵢ)` with 7 random `yᵢ` (4.3).
- One centre: `P(z)² = K(z, z) − K(z, x₁)²/K(x₁, x₁)`; for the Gaussian with `σ = 1` at distance
  `1` this is `1 − e^{−1} = 0.6321…`. With the cardinal vector replaced by `0`, `Q_z(0) = K(z, z)`,
  which is not the power function unless `K(z, x₁) = 0`.

### 4.3 The native space and the error bound

- **Native space** (Tau Ceti, consumed): for `hK : Matrix.PosSemidef K`, `H = hK.KolmogorovSpace`
  with kernel sections `kₓ`, given by `hK.kolmogorovFeature x`, and `⟪kₓ, k_y⟫ = K(x, y)`
  (`Matrix.PosSemidef.inner_kolmogorovFeature`), dense span (`kolmogorovFeature_dense`) and the
  reproducing property `⟪f, k_x⟫ = f(x)` (Mathlib's `RKHS.inner_kerFun`).
- **Projection and error bound** (`abs_sub_kernelInterpolant_le`; Wendland, Lemma 11.3, p. 174,
  and Theorem 11.4, p. 176, with `α = 0`): in `H`, with `S` the span of the kernel sections
  `k_{xⱼ}`, the orthogonal projection of `f` onto `S` is the interpolant of `(f(xⱼ))ⱼ`;
  `P(z) = ‖k_z − Π_S k_z‖`; and `|f(z) − s_{f,X}(z)| ≤ P(z) ‖f‖_H` for every `f ∈ H`.
  Proof: the reproducing property shows that `Π_S f` agrees with `f` at the centres, so it is the
  interpolant by 4.1; then `f(z) − s(z) = ⟪f, k_z − Π_S k_z⟫`, and the Cauchy–Schwarz inequality
  and the expansion of `‖k_z − ∑ uⱼ k_{xⱼ}‖²` as `Q_z(u)` finish.
- **Minimal norm** (prose target): among all `g ∈ H` with `g(xⱼ) = f(xⱼ)` for every `j`, the
  interpolant `Π_S f` has the least norm, uniquely. Proof: `g − Π_S f` vanishes at the centres, so
  it is orthogonal to `S`.

**Checks.**
- `f = k_{x₁}` is interpolated exactly, and the bound gives `0` at the centres.
- Without the positive definite Gram matrix the projection still exists, but `kernelInterpolant`
  is the junk `0`: the hypothesis is used.

## Layer 5: error estimates in terms of the fill distance

### 5.1 Fill distance and the interior cone condition

- **Fill distance** (`fillDistance`; Wendland, Definition 1.4, p. 14): `⨆_{z ∈ Ω} infEDist z X`
  in `ℝ≥0∞`.
- **Cones** (`cone`, `InteriorConeCondition`; Wendland, Definition 3.6, p. 28): `Ω` satisfies an
  interior cone condition with angle `θ ∈ (0, π/2)` and radius `r > 0` if every `x ∈ Ω` is the
  vertex of a cone `C(x, ξ, θ, r) = {x + λy : ‖y‖ = 1, ⟪y, ξ⟫ ≥ cos θ, 0 ≤ λ ≤ r} ⊆ Ω` with axis a
  unit vector `ξ`; the cone contains the points at distance exactly `r` from its vertex.
- **Balls** (`interiorConeCondition_closedBall`; Wendland, Lemma 3.10, p. 31): a closed ball of
  radius `δ > 0` satisfies the condition with angle `π/3` and radius `δ`, in dimension `d ≥ 1` (in
  `ℝ⁰` there is no unit axis). Proof (Wendland's): for `x` in the ball centred at `0` take the axis
  `−x/‖x‖` (any axis at `x = 0`); then `‖x + λy‖² ≤ ‖x‖² − λ‖x‖ + λ²`, which is at most `δ²` for
  `‖x‖ ≤ δ` and `0 ≤ λ ≤ δ` because it is convex in `λ` and at most `δ²` at `λ = 0` and `λ = δ`.

**Checks.**
- `fillDistance Ω ∅ = ∞` for nonempty `Ω`; for `Ω = [0, 1]` and `X = {0, 1}` it is `1/2`; it is
  `0` for `X ⊇ Ω`.
- A nonempty finite set satisfies no interior cone condition (a cone of positive radius is
  infinite); the empty set satisfies every one.
- The open ball does not satisfy the condition with radius `δ`: at the centre every cone of
  radius `δ` reaches the boundary sphere. With radius `δ/2` it does.

### 5.2 Local polynomial reproduction

- **Local polynomial reproduction** (`exists_localPolynomialReproduction`; Wendland,
  Theorem 3.14, p. 33, and Theorem 11.8, p. 179): for bounded `Ω` with an interior cone condition,
  a degree `ℓ` and a derivative order `n`, there are `h₀, C₁, C₂ > 0` such that for all centres in
  `Ω` with fill distance `h ≤ h₀`, every `z ∈ Ω` and all directions `v₁, …, vₙ` of norm `≤ 1`
  there are weights `uⱼ` with `∑ⱼ uⱼ p(xⱼ) = Dⁿp(z)[v₁, …, vₙ]` for all polynomials of degree `≤ ℓ`,
  `∑ⱼ |uⱼ| ≤ C₁ h^{−n}` and `uⱼ = 0` when `‖z − xⱼ‖ > C₂ h`. Proof route of Wendland, pp. 26–33
  and 178–179: norming sets (Theorem 3.4, p. 27) and the duality between norming constants and
  reproduction weights; Bernstein's inequality on segments in a cone (Theorem 3.8, p. 29) gives
  the case `n = 0`; Markov's inequality on cone domains (Proposition 11.6, p. 178) gives
  derivatives with the factor `h^{−n}`; directions enter multilinearly from the coordinate
  derivatives `D^α`, `|α| = n`.

**Checks.**
- `ℓ = 0`, `n = 0`: the weight `1` at a nearest centre reproduces constants, with `C₁ = 1`,
  `C₂ = 1`.
- The bound `h^{−n}` cannot be improved to a constant for `n = 1`: two centres at distance `h`
  reproduce the derivative of linear functions only with weights `±1/h`.

### 5.3 Smoothness of the native space

- **Native-space functions are smooth** (`contDiff_of_mem_nativeSpace`; Wendland, Theorem 10.45,
  p. 168): if `K` is positive semidefinite and `C^{2k}` on `ℝᵈ × ℝᵈ`, every element of its native
  space is `C^k`. Proof: induction on `|α|`, the difference quotients of `K(·, x)` converging in
  the native space by the `C^{2k}` bound on `K`; the induction carries the next bullet.
- **Derivative reproduction** (prose target; Wendland, (10.15), p. 168): under the same
  hypotheses, for `|α| ≤ k` the function `D₂^α K(·, x)` lies in the native space and
  `D^α f(x) = ⟪f, D₂^α K(·, x)⟫` for every `f` in it.

**Checks.**
- The Gaussian kernel gives `C^∞` functions for every `k`; `φ_{1,0}(|x − y|) = (1 − |x − y|)₊` is
  only continuous (`k = 0`), and its native space contains k_0 = (1 − |x|)₊, not differentiable at
  `0`.

### 5.4 Error estimates for Wendland's functions

- **Fill-distance estimate** (`norm_iteratedFDeriv_sub_kernelInterpolant_wendland_le`; Wendland,
  Theorem 11.17, p. 184): let `Ω ⊆ ℝᵈ` be bounded with an interior cone condition and
  `n ≤ k`. There are `C, h₀ > 0` such that for all distinct centres in `Ω` with fill distance
  `h ≤ h₀`, all `f` in the native space of `φ_{d,k}(‖x − y‖)` and all `z ∈ Ω`,
  `‖Dⁿ(f − s_{f,X})(z)‖ ≤ C h^{k+1/2−n} ‖f‖`. Proof route of Wendland, pp. 179–185: by 4.3 and 5.3
  in the form of Theorem 11.4 the error is bounded by the power function of the derivative
  functional; Theorem 11.9, p. 179, bounds that power function through 5.2 and a Taylor
  polynomial of `φ_{d,k}(‖·‖)` at `0`, whose remainder is `O(h^{2k+1})` since the even extension of
  `φ_{d,k}` is `C^{2k}` with `φ_{d,k}(r) − p(r) = O(r^{2k+1})` near `0` (2.2); the kernel is
  `C^{2k}` on `ℝᵈ × ℝᵈ` by 2.2, so 5.3 applies. The derivatives are those of functions on `ℝᵈ`,
  so `Ω` need not be open (Wendland's remark before Theorem 11.9, p. 179). The native space of
  `ℝᵈ` replaces that of `Ω` by Theorems 10.46–10.47.

**Checks.**
- `k = 0`, `d = 1`: the estimate reads `|f(z) − s(z)| ≤ C h^{1/2} ‖f‖` for interpolation with
  `(1 − |x − y|)₊`, the case `n = 0` only.
- The exponent `k + 1/2 − n` is positive for every `n ≤ k`, so the bound tends to `0` with `h`.

## Layer 6: separation distance and stability

### 6.1 Separation distance

- **Separation distance** (`separationDistance`; Wendland, Definition 4.6, p. 41):
  `q_X = ½ min_{i ≠ j} ‖xᵢ − xⱼ‖`, for at least two centres.
- **Spectral infimum** (`fourierInfOnBall`): `inf_{‖ξ‖ ≤ R} 𝓕Φ(ξ)`, the infimum of a continuous
  function over a compact ball, written as `sInf` of the image so that no empty index set occurs.

**Checks.**
- Centres `0, 1, 3` on `ℝ`: `q = 1/2`.
- For one centre the value is the junk `0`; the theorems assume `N ≥ 2`.
- `fourierInfOnBall` for the Gaussian `e^{−a‖x‖²}` is `(π/a)^{d/2} e^{−π²R²/a}`, the value on the
  boundary sphere; at `a = 1`, `d = 1`, `R = 1` it is `√π e^{−π²} = 9.1677…·10⁻⁵`. For `R < 0` the
  ball is empty and the value is the junk `sInf ∅ = 0`; the theorems use `R = M/π > 0`.

### 6.2 The lower bound for the smallest eigenvalue

- **Ball–bump bound** (`quadraticForm_ge_of_separation`; Wendland, Theorem 12.3, p. 210): let
  `Φ` be continuous, integrable and even with `𝓕Φ > 0`, and the centres distinct with separation
  distance `q`. For every `M ≥ (12/q) (π Γ(d/2 + 1)²/9)^{1/(d+1)}`,
  `αᵀAα ≥ λ ‖α‖²` with `λ = (2π)^{−d/2} inf_{‖ξ‖ ≤ M/π} 𝓕Φ(ξ) / (2Γ(d/2 + 1)) · (M/2^{3/2})^d`.
  This is Wendland's bound `φ₀(M)/(2Γ(d/2 + 1)) (M/2^{3/2})^d` with
  `φ₀(M) = inf_{‖ω‖ ≤ 2M} Φ̂(ω)` translated through `Φ̂(ω) = (2π)^{−d/2} 𝓕Φ(ω/2π)`. Proof route of
  Wendland, pp. 209–212: compare `Φ` with the function whose transform is `φ₀(M)` times the
  self-convolution of the indicator of the ball of radius `M` (Lemma 12.2, p. 209); its form is
  bounded below by its diagonal, and its off-diagonal terms are summed over shells of centres using
  the separation distance and the decay of `J_{d/2}`.
- **The threshold** (`threshold_le`; Wendland, Theorem 12.3, (12.3), p. 210): for `d ≥ 1`,
  `12 (π Γ(d/2 + 1)²/9)^{1/(d+1)} ≤ 6.38 d`, so `M ≥ 6.38 d/q` is admissible. Proof: Stirling's
  bounds for `Γ`; the ratio of the two sides is `2π/6.38 < 1` at `d = 1` and decreases to about
  `2.21/6.38`.

**Checks.**
- `M_d = 12 (π Γ(d/2 + 1)²/9)^{1/(d+1)}` is `2π = 6.283…` at `d = 1` (since `Γ(3/2) = √π/2`), and
  `8.449`, `10.635`, `12.829`, `15.027` for `d = 2, …, 5`, all below `6.38 d`; at `d = 10⁴` the
  ratio `M_d/d` is `2.208`.
- `threshold_le` fails at `d = 0` (the left side is `4π/3 > 0`): the hypothesis `d ≥ 1` is used.
- For the Gaussian with `a ∈ {0.02, 0.1, 0.5}` and jittered grids in `d = 1, 2, 3`, the smallest
  eigenvalue always exceeds the bound (by many orders of magnitude: the bound is pessimistic but
  dimension-correct).

### 6.3 The Gaussian and Wendland's functions

- **Gaussian** (`quadraticForm_ge_gaussian`; Wendland, Corollary 12.4, p. 213): for `e^{−a‖x‖²}`,
  `λ ≥ M_d^d/(2^{3d/2+1} Γ(d/2 + 1)) · (2a)^{−d/2} e^{−M_d²/(a q²)} q^{−d}`. Proof: 6.2 with
  `M = M_d/q` and `𝓕Φ(ξ) = (π/a)^{d/2} e^{−π²‖ξ‖²/a}`, whose infimum on `‖ξ‖ ≤ M/π` is attained
  at the boundary.
- **Wendland's functions** (`quadraticForm_ge_wendland`; Wendland, Corollary 12.8, p. 214): for
  `k ≥ 1` or `d ≥ 3` and every `Q > 0` there is `C > 0`, depending on `d`, `k` and `Q`, with
  `λ ≥ C q^{2k+1}` for all centre sets with `q ≤ Q`. Proof: 6.2 with `M = M_d/q` and the lower
  bound of 2.4, `inf_{‖ξ‖ ≤ M/π} 𝓕Φ ≥ c₁(1 + M_d/(πq))^{−(d+2k+1)} ≥ c₁ (πq/(πQ + M_d))^{d+2k+1}`;
  multiplied by `M^d = M_d^d q^{−d}` this is a constant times `q^{2k+1}`. Wendland prints the bound
  without `Q`; the restriction `q ≤ Q` is what makes the constant uniform.

**Checks.**
- In the Gaussian case the general bound of 6.2 and the corollary agree (`4.997·10⁻²⁰⁶` for
  `a = 10` and 30 random centres in `[0, 3]³`), so the conversion of normalizations is
  consistent; for `d = 1`, `a = 0.5` and a jittered grid with `q = 2.76` the bound is `1.38·10⁻⁵`
  against a smallest eigenvalue `1.000`.
- `quadraticForm_ge_wendland` needs `q ≤ Q`: for two centres at distance `2q > 2` the form of
  `φ_{d,k}` is `φ_{d,k}(0) ‖α‖²`, independent of `q`, while `q^{2k+1}` is unbounded.

## Downstream consumers

- Kernel-based quadrature and quasi-Monte Carlo error analysis in reproducing kernel Hilbert spaces,
  which use the power function of 4.3 as the worst-case error of an interpolatory rule.
- Meshless (radial basis function) collocation and Galerkin methods for partial differential
  equations, which need the strict positive definiteness of Layers 1–3 for solvability and the
  error and stability bounds of Layers 5–6.
- High-dimensional approximation and surrogate modelling with Gaussian kernels, and Gaussian
  process regression, whose posterior variance is the square of the power function.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Strictly positive definite functions.** The real–complex comparison, the independence of
   exponentials on open sets, strict Bochner, the integrable characterization, the Gaussian, the
   radial Fourier transform of a profile, Askey's theorem, the strict Schoenberg theorem and the
   inverse multiquadrics.
2. **Wendland's functions.** Wendland's operator and the dimension walk; `φ_{d,k}` with its
   polynomial form and degree, smoothness, strict positive definiteness, the closed form for
   `k = 1`, minimality and uniqueness, and the two-sided Fourier decay.
3. **Conditionally positive definite functions.** The definitions, Micchelli's theorem and its
   strict form, the multiquadrics, powers and thin-plate splines, and interpolation with
   polynomial augmentation and its polynomial reproduction.
4. **Interpolation and the power function.** The interpolant and cardinal functions, the
   minimization property of the power function, the projection form of the interpolant in the
   native space, its minimal norm and the error bound `P(z) ‖f‖`.
5. **Fill-distance estimates.** The interior cone condition, local polynomial reproduction with
   derivatives, the smoothness of native-space functions with derivative reproduction and the
   error estimate for Wendland's functions.
6. **Stability.** The separation distance, the general lower bound for the smallest eigenvalue
   with its admissible threshold, and its Gaussian and Wendland instances.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:
- positive semidefiniteness: Bochner's theorem, the nonnegativity of the Fourier transform of an
  integrable positive semidefinite function and the Gaussian example are Tau Ceti's
  (`TauCeti.bochner`, `TauCeti.fourier_re_nonneg_of_posSemidef`,
  `TauCeti.posSemidef_cexp_neg_mul_sq_norm`);
- the Hausdorff–Bernstein–Widder theorem and completely monotone functions: Tau Ceti's;
- the Gaussian and inverse multiquadric kernels, their positive semidefiniteness, characteristic
  kernels and scale mixtures of Gaussians:
  [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) §§8.1–8.2;
- Bessel functions: Mathlib's `Complex.besselJ` and the theory of
  [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) §§1.5, 2.2, 2.3, 6.2, 6.5;
- the Fourier transform of a radial function on `ℝᵈ` as a Bessel integral, and the order-`ν`
  Hankel transform with its inversion: SpecialFunctionsMotionGroupsBessel (open PR #2933)
  §§5.2–5.3;
- reproducing kernel Hilbert spaces and `RKHS.OfKernel`: Mathlib's; the Kolmogorov space of a
  positive semidefinite kernel with its feature map: Tau Ceti's; the representer theorem:
  [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md)
  §5.8;
- kernel ridge regression and its closed form `(K + 2nλ I) a = y`:
  [StatisticalLearningTheory](../StatisticalLearningTheory/README.md) §4.3; the regularized
  weights `(K + nλ I)⁻¹ (k(x, xᵢ))ᵢ` of conditional mean embeddings:
  [KernelsAndSpectralMethods](../KernelsAndSpectralMethods/README.md) §11.3. Interpolation here is
  the unregularized problem with a positive definite Gram matrix;
- universality of the Gaussian kernel on compact sets and kernel support vector machines: the
  open roadmap KernelSupportVectorMachines (PR #3008), not used here;
- univariate polynomial interpolation and the Mairhuber–Curtis obstruction to interpolation from
  a fixed space in dimension `d ≥ 2`, which motivates centre-dependent kernels: approximation
  theory outside this roadmap;
- univariate splines, B-splines and wavelets: outside this roadmap; the thin-plate splines and
  powers of 3.3 are treated here only as kernels.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Positive definiteness:** `Matrix.PosDef`, `Matrix.PosSemidef` (finitely supported
  coefficients), `Matrix.IsHermitian`.
- **Fourier analysis:** `𝓕` on functions of a finite-dimensional inner product space,
  `fourier_gaussian_innerProductSpace`, `MeasureTheory.integral_fun_norm_addHaar`,
  `MeasureTheory.Measure.support`, `Function.IsRadial`.
- **Special functions:** `Complex.besselJ`, `Real.Gamma`.
- **Reproducing kernels** (`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`): `RKHS`,
  `RKHS.OfKernel`, `RKHS.OfKernel.kernel_ofKernel`, `RKHS.kerFun`, `RKHS.inner_kerFun`,
  `RKHS.kerFun_dense`, `Submodule.starProjection`, `Submodule.topologicalClosure`.
- **Polynomials and calculus:** `MvPolynomial.totalDegree`, `MvPolynomial.restrictTotalDegree`,
  `Polynomial.natDegree`, `iteratedFDeriv`, `iteratedDeriv`, `ContDiff`, `ContDiffOn`.
- **Distances:** `Metric.infEDist`, `Bornology.IsBounded`.

### From Tau Ceti

- **Bochner's theorem** (`TauCeti/Analysis/Bochner/BochnerTheorem.lean`,
  `TauCeti/Analysis/PositiveDefinite/FourierAtom.lean`,
  `TauCeti/Analysis/PositiveDefinite/AddGroup.lean`):
  `TauCeti.bochner`, `TauCeti.fourierAtom`, `TauCeti.IsPositiveDefiniteSub`,
  `TauCeti.IsPositiveDefiniteSub.posSemidef`.
- **Fourier positivity and the Gaussian** (`TauCeti/Analysis/Bochner/Fourier/Nonneg.lean`,
  `TauCeti/Analysis/Bochner/Gaussian/Basic.lean`): `TauCeti.fourier_re_nonneg_of_posSemidef`,
  `TauCeti.posSemidef_cexp_neg_mul_sq_norm`.
- **Completely monotone functions** (`TauCeti/Analysis/CompletelyMonotone/Basic.lean`,
  `TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean`,
  `TauCeti/Analysis/CompletelyMonotone/Bernstein/OpenHalfLine.lean`):
  `TauCeti.IsCompletelyMonotoneOnIoi`, `TauCeti.IsContinuousCompletelyMonotoneOnIoi`,
  `TauCeti.hausdorff_bernstein_widder`, `TauCeti.hausdorff_bernstein_widder_onIoi`,
  `TauCeti.RepresentsLaplace`.
- **Kolmogorov space of a kernel** (`TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`):
  `TauCeti.positiveDefiniteKernelOperator`, `TauCeti.posSemidef_positiveDefiniteKernelOperator`,
  `Matrix.PosSemidef.KolmogorovSpace`, `Matrix.PosSemidef.kolmogorovFeature`,
  `Matrix.PosSemidef.inner_kolmogorovFeature`, `Matrix.PosSemidef.kolmogorovFeature_dense`; the
  native space of 4.3, 5.3 and 5.4.

### From KernelsAndSpectralMethods

- §8.2: the definitions `gaussianKernel` and `imqKernel`, copied verbatim in `Suggested.lean`
  (the strict statements 1.2 and 1.4 strengthen its positive semidefiniteness of the Gaussian
  kernel and its characteristic-kernel statement for scale mixtures, which this roadmap does not
  restate).
- §8.1: the notion of a characteristic kernel, used only in the Checks of 1.1.
- Conventions ("Kernels"): a kernel is a function `X → X → ℝ` with a proof of `Matrix.PosSemidef`,
  and its Hilbert space is the Kolmogorov space; this roadmap uses the same convention for the
  native space (`hK.KolmogorovSpace`).

### From SpecialFunctionsBessel

- §1.5: the ladder relations `(z⁻¹ d/dz)^k (z^{±ν} J_ν)`, for the dimension walk (2.1) and Askey's
  theorem (1.3).
- §§2.2–2.3: the behaviour at `0` and the half-odd orders `J_{±1/2}`, for the radial transform in
  odd dimension (1.3) and the boundary terms of the dimension walk (2.1).
- §§6.2, 6.5: the large-argument form and the bounds `|J_ν(x)| ≤ 1` (`ν ≥ 0`) and DLMF 10.14.4
  (`ν ≥ −1/2`), for integrability of the radial-transform integrand, for 2.4 and for the decay of
  `J_{d/2}` in 6.2.

### From SpecialFunctionsMotionGroupsBessel (open PR #2933)

- §5.3 `fourier_radial`: for `n ≥ 1`, `∫₀^∞ |φ(r)| r^{n−1} dr < ∞` and `ξ ≠ 0`,
  `𝓕(φ ∘ ‖·‖)(ξ) = 2π ‖ξ‖^{1−n/2} ∫₀^∞ φ(r) J_{n/2−1}(2π‖ξ‖r) r^{n/2} dr`, which is
  `radialFourier n φ ‖ξ‖`; consumed in 1.3 (Askey's theorem), 2.2 (positive definiteness), 2.4
  and 6.2 (Lemma 12.2). Its order-`ν` Hankel transform of §5.2 is not used.

### From MathematicalStatisticsNonparametric

- §5.8: the representer theorem, cited in 4.3 for the relation between interpolation and
  regularized fitting; nothing is restated.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Native spaces as function spaces**: the Fourier description
  `‖f‖² = ∫ |𝓕f|²/𝓕Φ` of the native space of a translation-invariant kernel, its identification
  with the Sobolev (Bessel potential) space `H^{d/2+k+1/2}(ℝᵈ)` for `φ_{d,k}` (Wendland, Theorem
  10.35, second part, and Corollary 10.13), restriction and extension to Lipschitz domains, the
  Beppo Levi native spaces of conditionally positive definite functions, and Mercer expansions.
- **Further error estimates**: spectral convergence for Gaussians and multiquadrics, the generic
  estimate for conditionally positive definite kernels with polynomial parts, the
  power-function estimates for thin-plate splines, sampling inequalities and error estimates for
  functions outside the native space, the uncertainty (trade-off) principle and upper bounds for
  condition numbers.
- **Further function classes**: Buhmann's and Gneiting's compactly supported functions, Wu's
  functions, radial functions on spheres and Riemannian manifolds, positive definiteness on
  other norms (Wendland's §6.4, p. 82), the general smoothness constraints at the boundary of the
  support (Wendland's Theorem 9.10).
- **Approximation schemes**: moving least squares, quasi-interpolation, Hermite–Birkhoff
  interpolation with kernels, and multilevel and partition-of-unity methods.

## Prior formalization

The lean-NASC project ([github.com/bjbraams/lean-NASC](https://github.com/bjbraams/lean-NASC),
commit 8efdbf7, module NASC/SplinesAndKernels) proves without `sorry` an abstract form of the
error bound of 4.3, NASC.abs_kernelInterpolation_error_le: for a feature map into a Hilbert space
and the orthogonal projection onto the closed span of the features at the centres, the
Cauchy–Schwarz bound by the distance of the feature at `z` from that span. The same module states
strict Bochner, the positive definiteness of Wendland's functions and Micchelli's theorem with
`sorry`. The other targets have no counterpart there.

Related work: Mathlib's `RKHS` (Mathlib commit 1b1ccf4,
`Mathlib/Analysis/InnerProductSpace/Reproducing.lean`) and the open Mathlib pull requests
extending it (mathlib4 PR 38584, a submodule constructor; mathlib4 PRs 42003 and 43465, the
integral operator and bilinear form for Mercer's theorem), which concern the native space but not
interpolation; Mathlib's radial functions (`Mathlib/Analysis/Normed/Group/RadialFunction.lean`).

## References

The locators refer to these editions; page numbers are printed page numbers.

- B. Fornberg and N. Flyer, "Solving PDEs with radial basis functions", *Acta Numerica* 24
  (2015), 215–258.
- G. Plonka, D. Potts, G. Steidl and M. Tasche, *Numerical Fourier Analysis*, Applied and
  Numerical Harmonic Analysis, Birkhäuser, 2018.
- H. Wendland, *Scattered Data Approximation*, Cambridge Monographs on Applied and Computational
  Mathematics 17, Cambridge University Press, 2004.
