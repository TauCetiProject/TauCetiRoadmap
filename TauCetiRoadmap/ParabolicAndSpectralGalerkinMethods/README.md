# Roadmap: parabolic and spectral Galerkin methods

**Summary.** This roadmap builds the error analysis of Galerkin methods for the heat equation in
space and time, and of spectral Galerkin methods built on trigonometric and Jacobi polynomials:
- an abstract parabolic Galerkin theory: the Ritz and pivot projections, existence of the
  spatially semidiscrete solution, its error in terms of the Ritz defect, and the same bound for
  the backward Euler and Crank–Nicolson time discretizations;
- the heat equation on a domain with a family of trial spaces of approximation order `r`: the
  elliptic projection error and the rates `h^r`, `h^r + k` and `h^r + k²` for smooth solutions;
- nonsmooth initial data: the smoothing estimate for the error equation and the rate
  `h² / t` for data that are only square integrable;
- the discontinuous Galerkin method in time: unique solvability, its first two members
  (backward Euler and a Padé approximant), stability, and the nodal superconvergence of order
  `2q - 1`;
- Fourier approximation of periodic functions: Bernstein's inequality in `L²`, the truncation
  error in the maximum norm, and trigonometric interpolation with real orders of smoothness;
- Jacobi weights: the Gram–Schmidt polynomials of the Jacobi weight identified with the Jacobi
  polynomials, their derivatives, and the error of the weighted `L²` projection and of the `H¹₀`
  projection in weighted Sobolev norms;
- Legendre–Gauss–Lobatto interpolation and the Legendre–Galerkin method for a two-point
  boundary value problem, with its `H¹` error.

The nearest roadmaps are the roadmap on conforming finite elements for elliptic problems, which
supplies the abstract quasi-optimality and duality lemmas and the elliptic regularity hypothesis
used in space; [PDE](../PDE/README.md), whose parabolic layer supplies the weak solution that is
approximated; SpecialFunctionsOrthogonalPolynomialsGeneral
([README](../SpecialFunctionsOrthogonalPolynomialsGeneral/README.md)), which supplies
orthogonality measures, the monic orthogonal polynomials and their zeros;
[LaguerreJacobi](../LaguerreJacobi/README.md), which supplies the Jacobi polynomials, the Jacobi
measure, the derivative relation and the orthogonality relation; and
PolynomialInterpolationAndBestApproximation
([README](../PolynomialInterpolationAndBestApproximation/README.md)), whose interpolation
conventions are used for the Lobatto interpolant. The roadmap is a multi-source synthesis of
Thomée, Ern–Guermond (third volume), Bartels, Shen–Tang–Wang and Canuto et al. (see
[References](#references)). Headlines that restate a source result cite a theorem, lemma,
section or equation number with its printed page; corollaries and adaptations carry a proof
route.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry a
Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test; the headlines without a Lean name are
targets of the same standing, stated in prose.

Suggested home: `TauCeti/NumericalAnalysis/Parabolic/` for Layers 1–4 and
`TauCeti/NumericalAnalysis/Spectral/` for Layers 5–7.

## How to read the build

Layers 1–4 treat time. Layer 1 is functional analysis: a trial space `V`, a pivot space `H`, a
continuous map `ι` from `V` to `H` and a bilinear form `a` on `V`. The semidiscrete error is split
as `θ + ρ` with `ρ` the Ritz defect, and an energy argument on the finite-dimensional trial space
bounds `θ` by the time derivative of `ρ`; the θ-schemes repeat the argument with a discrete
derivative and add a Taylor remainder. Layer 2 specializes `V` to `H¹₀(Ω)`, `H` to `L²(Ω)` and
`a` to the Dirichlet form, so that every rate is a Layer 1 bound followed by the Ritz projection
error, which is Céa's lemma and the duality argument of GalerkinMethodsAndLagrangeFiniteElements
§1.3–1.4. Layer 3 replaces the energy argument by a weighted one that trades regularity of the
data for a negative power of `t`. Layer 4 is linear algebra on polynomials in time: on an
eigenvector of a self-adjoint operator the discontinuous Galerkin step is a scalar rational
function, and all statements about the operator reduce to statements about that function.

Layers 5–7 treat polynomial approximation in space. Layer 5 is Fourier analysis on the circle
and needs only Parseval's identity and the aliasing formula. Layer 6 is the Jacobi family: the
weight, the derivative relation that turns derivatives of Jacobi polynomials into Jacobi
polynomials of shifted parameters, and the projection estimates that follow from it. Layer 7
combines Layer 6 with interpolation at the Lobatto nodes into the error estimate for the
Legendre–Galerkin method, the spectral counterpart of Céa's lemma.

The layers are in build order: each layer needs only earlier layers and the suppliers.

## Conventions

- **Abstract parabolic problems.** `V` is a real normed space (the trial space), `H` a real inner
  product space (the pivot space), `ι : V →L[ℝ] H` and `a : V →L[ℝ] V →L[ℝ] ℝ`, the shape
  GalerkinMethodsAndLagrangeFiniteElements uses for a form on `V × V`. Trial spaces are
  `S : Submodule ℝ V` with `[FiniteDimensional ℝ S]`. The strong solution `u : ℝ → V` and the
  discrete solutions take values in `V`; the equation is tested in `H` through `ι`.
- **Predicates, not chosen maps.** The Ritz projection, the pivot projection, the semidiscrete
  solution, the θ-scheme and the discontinuous Galerkin step are predicates
  (`IsRitzProjection`, `IsPivotProjection`, `IsSemidiscreteSolution`, `IsThetaSchemeSolution`,
  `IsDGStep`); existence and uniqueness are separate headlines.
- **Time derivatives.** A time derivative is `derivWithin u (Ici 0) t` under a differentiability
  hypothesis on `Ici 0` (or on `Ioi 0` for nonsmooth data), and higher derivatives are explicit
  functions with `HasDerivWithinAt` hypotheses. Polynomial derivatives are
  `Polynomial.derivative`; `iteratedDeriv` is used only under a `ContDiff` or `ContDiffOn`
  hypothesis on an open set.
- **Errors in `ℝ≥0∞`.** Error bounds that involve integrals of derivatives or Sobolev seminorms
  that may be infinite are stated with `‖·‖ₑ`, `∫⁻` and `ENNReal.ofReal`, so a bound with an
  infinite right side is true and there is no integrability hypothesis.
- **The heat equation.** `Ω : Opens (E d)` with `[NeZero d]`; the trial space is Tau Ceti's
  `TauCeti.W1p0` with exponent `2` and its local inner product instances, the pivot space is
  `L²(Ω)`, `ι` is `TauCeti.W1p0.valueL`, and the form is `dirichletForm`, Tau Ceti's bundled
  energy form `TauCeti.PDE.energyFormH1L0` with coefficient matrix `1`. A function of `H¹₀(Ω)`
  has Sobolev regularity `s` when some `ws : Wkp volume Ω 2 s` has the same value
  (`TauCeti.Wkp.value`), and `|w|_{H^s}` is the seminorm `seminorm s s` of
  SobolevPolynomialApproximation §1.3 (local copy, as in GalerkinMethodsAndLagrangeFiniteElements).
- **Approximation order.** `HasApproximationOrder Ω r C S` is the approximation property of a
  family `S h ⊆ H¹₀(Ω)`, `0 < h < 1`, with seminorms on the right side; Thomée's (1.10), p. 4, has
  the full `H^s` norm, so this is a strengthening of the hypothesis that the Lagrange spaces of
  GalerkinMethodsAndLagrangeFiniteElements satisfy (its §5.2). The family is abstract: no mesh
  appears in Layers 2–3.
- **Elliptic regularity** is the hypothesis `HasAdjointH2Regularity Ω (fun _ => 1) Creg` of
  GalerkinMethodsAndLagrangeFiniteElements §6.3 (local copy); it holds for convex and for smooth
  domains and is not proved here.
- **Circle.** Periodic functions live on `AddCircle (2 * π)` with Mathlib's normalized Haar
  measure `AddCircle.haarAddCircle`, so the Fourier coefficients `fourierCoeff` and
  `fourierBasis` agree with the normalization `(2π)⁻¹ ∫₀^{2π}` of Shen–Tang–Wang (2.3) and
  Parseval's identity has no factor `2π`. Periodic Sobolev seminorms are coefficient sums
  `∑ |k|^{2m} |û_k|²` in `ℝ≥0∞`, real `m`.
- **Jacobi weights.** `jacobiMeasure α β` is LaguerreJacobi's Jacobi measure (§4.1, local
  copy), the `withDensity` of `ENNReal.ofReal ((1 - x)^α (1 + x)^β)` on `Ioo (-1) 1`, and
  `jacobi α β n` its Jacobi polynomial (§3.2, local copy); `weightedNormSq α β g` is `∫⁻ |g|²`
  against the measure. Negative parameters (`α = β = -1`) give an infinite measure, which
  `weightedNormSq` handles. The monic Jacobi polynomials are `monic (jacobiMeasure α β) n`, the
  Gram–Schmidt polynomials of SpecialFunctionsOrthogonalPolynomialsGeneral §2.2 (local copy);
  6.1 identifies them with the rescaled `jacobi α β n`.
- **Functions on the interval** are `u : ℝ → ℝ` with `ContDiffOn ℝ m u (Ioo (-1) 1)` and finite
  weighted norms; the sources' weighted spaces `B^m_{α,β}` contain these, so the statements are
  the sources' estimates restricted to classically differentiable functions.
- **Fixed-order constants.** Spectral estimates are stated for fixed orders `m` and `k`, with a
  constant depending on them, as `N^{2(m - l)} · error² ≤ C · seminorm²` with natural powers.
  Shen–Tang–Wang's Theorems 3.38, 3.44 and 4.1 state constants independent of `m` (and `k`), and
  their Theorem 3.35 gives an explicit factorial factor with an unspecified constant; none of these
  constants can be uniform in `m` up to `m = N + 1` (Checks of 6.2, 6.3, 7.1 and 7.2). The
  fixed-order form is the one of their Remark 3.7 and Remark 4.14.

## Layer 1: abstract parabolic Galerkin approximation

### 1.1 The Ritz and pivot projections

- `IsRitzProjection a S w r`: `r ∈ S` and `a r χ = a w χ` for `χ ∈ S`; Thomée (1.22), p. 8, for
  the Dirichlet form.
- `IsPivotProjection ι S g p`: `p ∈ S` and `⟪ι p, ι χ⟫ = ⟪g, ι χ⟫` for `χ ∈ S`, the `L²`
  projection P_h of Thomée, p. 40.
- **Ritz projection** (`existsUnique_isRitzProjection`): for `S` finite-dimensional and
  `a χ χ > 0` for `χ ∈ S \ {0}`, every `w` has a unique Ritz projection. Proof route: the Gram
  matrix of `a` on `S` is positive definite, hence invertible; symmetry is not needed.
- **Pivot projection** (`existsUnique_isPivotProjection`): for `ι` injective on `S`, every `g` has
  a unique pivot projection. Proof route: the Gram matrix of `ι` on `S`.
- **Stability** (`norm_le_of_isPivotProjection`): `‖ι p‖ ≤ ‖g‖`. Proved in `Suggested.lean`.

*Needs:* Mathlib linear algebra.

**Checks.**

- `V = H = ℝ²`, `ι = id`, `S = span e₁`, `a = diag(1, 2)` plus the off-diagonal entry `1` in
  `a(e₂, e₁)`: the Ritz projection of `e₂` is `e₁` (`a(r, e₁) = a(e₂, e₁) = 1`), while the pivot
  projection of `e₂` is `0`; the two projections differ.
- Negative control: `a = 0` on `S ≠ ⊥` violates positivity and every element of `S` is a Ritz
  projection of every `w`, so uniqueness fails.

### 1.2 The spatially semidiscrete problem

- `IsSemidiscreteSolution ι a S f uh`: `uh t ∈ S`, `uh` differentiable within `Ici 0`, and
  `⟪ι uh', ι χ⟫ + a(uh, χ) = ⟪f, ι χ⟫` for `χ ∈ S`, `t ≥ 0`; Thomée (1.21), p. 7.
- `IsStrongSolution ι a f I u`: the same equation for every `χ ∈ V`, on the time set `I`.
- **Existence and uniqueness** (`existsUnique_isSemidiscreteSolution`): for `S`
  finite-dimensional, `ι` injective on `S`, `f` continuous and `x ∈ S`, there is a solution with
  `uh 0 = x`, unique on `Ici 0`. Proof route: Tau Ceti's
  `TauCeti.PDE.existsUnique_galerkinSolution` with a basis map `e : Fin n → S`, restricted to
  `Ici 0`; uniqueness on `Ici 0` by Grönwall's inequality for the difference of two solutions,
  since `|a(χ, χ)| ≤ c ‖ι χ‖²` on the finite-dimensional `S`.
- **Error bound** (`semidiscrete_error_le`): with `Ru t` and `Rdu t` the Ritz projections of
  `u t` and `u'(t)`, and `a` positive on `S`,
  `‖ι(uh t - u t)‖ ≤ ‖ι(uh 0 - Ru 0)‖ + ‖ι(Ru t - u t)‖ + ∫₀ᵗ ‖ι(Rdu - u')‖`. Thomée, proof of
  Theorem 1.2, (1.23)–(1.29), pp. 8–9; Ern–Guermond III, Theorem 66.9, (66.15), p. 141, in the
  `V'` norm. Proof route: `θ = uh - Ru` satisfies `⟪ι θ', ι χ⟫ + a(θ, χ) = -⟪ι ρ', ι χ⟫` on `S`,
  and `d/dt ‖ι θ‖² ≤ 2 ‖ι ρ'‖ ‖ι θ‖`.
- **Decay** (`semidiscrete_error_le_exp`): if moreover `λ ‖ι χ‖² ≤ a(χ, χ)` on `S`, the initial
  term carries `e^{-λt}` and the integrand `e^{-λ(t-s)}`. Thomée (1.30), p. 9, and (1.31), p. 10;
  Ern–Guermond III, Remark 66.10, p. 141, and (66.16), p. 141.

*Needs:* 1.1; Tau Ceti `TauCeti.PDE.existsUnique_galerkinSolution`.

**Checks.**

- Scalar model `V = H = ℝ`, `S = V`, `a(u, v) = λuv`: `uh = u` when `uh 0 = u 0`, and both sides
  of the error bound are `0`.
- Negative control for the positivity hypothesis: `V = H = S = ℝ`, `a = 0`, `u' = uh' = f`. With
  `Ru t = u t` for `t > 0`, `Ru 0 = uh 0` and `Rdu = u'` (all Ritz projections, since `a = 0`)
  the right side is `0`, the left side is `|uh 0 - u 0|`. The bound fails without positivity.
- Decay, `V = H = S = ℝ`, `a(u, v) = 2uv`, `f = 0`: `Ru = u`, the error is
  `e^{-2t} |uh 0 - u 0|`, and the decay bound with `λ = 2` is an equality. Negative control: with
  `λ = 3`, which violates `λ ‖ι χ‖² ≤ a(χ, χ)`, the bound would give `e^{-3} = 0.0498` times the
  initial error at `t = 1`, below the actual `e^{-2} = 0.1353` times it.

### 1.3 The θ-scheme in time

- `IsThetaSchemeSolution ι a S θ k F U`: `U n ∈ S` and
  `⟪ι(U^{n+1} - U^n), ι χ⟫ + k a(θ U^{n+1} + (1 - θ) U^n, χ) = k ⟪F n, ι χ⟫` for `χ ∈ S`. The
  backward Euler method is `θ = 1`, `F n = f((n+1)k)` (Thomée (1.47), p. 14); Crank–Nicolson is
  `θ = 1/2`, `F n = f((n + 1/2)k)` (Thomée (1.54), p. 16).
- **Unique solvability** (`existsUnique_isThetaSchemeSolution`): for `ι` injective on `S`,
  `a χ χ ≥ 0` on `S`, `θ ≥ 0` and `k ≥ 0`. Proof route: `‖ι χ‖² + kθ a(χ, χ) > 0` for `χ ≠ 0`.
- **Backward Euler** (`backwardEuler_error_le`): with `u2` the second derivative of `ι ∘ u`,
  `‖ι(U^n - u(nk))‖` is at most `‖ι(U^0 - Ru 0)‖ + ‖ι(Ru(nk) - u(nk))‖`
  `+ ∫₀^{nk} ‖ι(Rdu - u')‖ + k ∫₀^{nk} ‖u2‖`.
  Thomée, Theorem 1.5 and its proof, (1.49)–(1.52), p. 15; Ern–Guermond III, Theorem 67.9,
  p. 153.
- **Crank–Nicolson** (`crankNicolson_error_le`): with `u3` the third derivative of `ι ∘ u` and
  `w` with `a(u, χ) = ⟪w, ι χ⟫` (`w = -Δu` for the heat equation) twice differentiable,
  the last term is replaced by `(k²/8) ∫ ‖u3‖ + (k²/4) ∫ ‖w2‖`. Thomée, Theorem 1.6 and its
  proof, (1.55)–(1.57), pp. 16–17, which gives `C k²`; the constants are those of the Peano
  kernels of the two consistency errors, `max (s²/2) = k²/8` for the difference quotient against
  the midpoint derivative and `max (s/2) = k/4` for the trapezoid average against the midpoint
  value.

*Needs:* 1.1, 1.2 (the same splitting).

**Checks.**

- Scalar `u' + u = 0`, `u(0) = 1`, `t = 1`: backward Euler errors `0.017664`, `0.00901`,
  `0.0045512` for `k = 0.1, 0.05, 0.025`, against the bound `k ∫₀¹ |u''|`, which is `0.0632`,
  `0.0316`, `0.0158`; Crank–Nicolson errors `3.069e-4`, `7.666e-5`, `1.916e-5` (ratio `4`), against
  `0.00237`, `5.93e-4`, `1.48e-4`.
- Stiff mode `λ = 10`, `k = 0.1`: Crank–Nicolson error `2.85e-5` against the bound `0.375`;
  the bound is not uniform in `λ`, which is why the heat-equation form carries `‖w2‖ = ‖Δu_tt‖`.
- Peano kernels on `[0, 1]`: the difference quotient of `s³` minus `3·(1/2)²` is `0.25`, and
  `∫ K₂ · 6 = 0.25`; the trapezoid-minus-midpoint value of `s²` is `0.25 = ∫ K₃ · 2`.

## Layer 2: the heat equation with an approximation family of order `r`

### 2.1 The Dirichlet form, approximation order and the Ritz projection

- `dirichletForm Ω`, with `dirichletForm_apply`: it is `TauCeti.PDE.energyFormH1` with matrix `1`
  and no lower-order terms, the weak form of `-Δ` (Thomée (1.5), p. 2). Proved in
  `Suggested.lean`.
- `HasApproximationOrder Ω r C S` (Conventions).
- **Ritz projection error** (`exists_ritz_error_le`): for `r ≥ 2`, elliptic regularity and
  approximation order `r`, there is `C'` with
  `‖R w - w‖ + h ‖∇(R w - w)‖ ≤ C' h^s |w|_{H^s}` for `1 ≤ s ≤ r` and `0 < h < 1`. Thomée,
  Theorem 1.1, p. 5, and Lemma 1.1, p. 8. Proof route: `‖∇(R w - w)‖ ≤ ‖∇(w - χ)‖` (Céa,
  GalerkinMethodsAndLagrangeFiniteElements §1.3, with constant `1` since the form is the inner
  product of the seminorm); the `L²` bound by the abstract Aubin–Nitsche lemma of
  GalerkinMethodsAndLagrangeFiniteElements §1.4 with the dual solution of
  `HasAdjointH2Regularity` approximated at order `s = 2`. No bound on `Ω` is needed because only
  seminorms appear.

*Needs:* 1.1; GalerkinMethodsAndLagrangeFiniteElements §1.3, §1.4, §6.3; PDE §4.1.

**Checks.**

- `d = 1`, `Ω = (0, 1)`, continuous piecewise linears, `w = sin πx`: the Ritz projection is the
  nodal interpolant; `L²` errors `9.92e-3`, `2.49e-3`, `6.22e-4`, `1.555e-4` for `n = 8, …, 64`
  (`h⁻² × error = 0.637`), and `H¹`-seminorm errors with `h⁻¹ × error = 2.01`.
- Negative control: the rate stops at `s = r`. For the same piecewise linears (`r = 2`) and
  `s = 3`, `h⁻³ × L² error` is `5.08`, `10.2`, `20.4`, `40.8` for `n = 8, …, 64`, unbounded,
  while `|w|_{H³} = π³/√2` is fixed.

### 2.2 Semidiscrete and fully discrete error estimates

- **Semidiscrete, smooth data** (`exists_semidiscrete_error_le`): for a strong solution `u` with
  lifts `ur t`, `urt t` of `u(t)`, `u'(t)` to `H^r`,
  `‖uh(t) - u(t)‖ ≤ ‖uh(0) - u(0)‖ + C' h^r (|u(0)|_r + |u(t)|_r + ∫₀ᵗ |u_t|_r)`. Thomée,
  Theorem 1.2, p. 8, with (1.25), p. 9, where `|u(t)|_r` is bounded by `|v|_r + ∫ |u_t|_r`;
  Ern–Guermond III, Corollary 66.13, p. 142. Proof route: 1.2 with 2.1.
- **Backward Euler** (`exists_backwardEuler_error_le`): the same with `u(nk)` and the extra term
  `k ∫₀^{nk} ‖u_tt‖`. Thomée, Theorem 1.5, p. 15; Bartels, Theorem 3.10, p. 72, for piecewise
  linears. Proof route: 1.3 with 2.1.
- **Crank–Nicolson** (`exists_crankNicolson_error_le`): the extra terms are
  `(k²/8) ∫ ‖u_ttt‖ + (k²/4) ∫ ‖Δu_tt‖`. Thomée, Theorem 1.6, p. 16. Proof route: 1.3 with 2.1.
- **Lagrange elements.** The Lagrange spaces of degree `r - 1` on a shape-regular family of
  meshes of a polyhedral domain satisfy `HasApproximationOrder`
  (GalerkinMethodsAndLagrangeFiniteElements §5.2, Scott–Zhang interpolation preserving the
  boundary condition), so the three rates hold for them; Thomée, (1.11), p. 4.

*Needs:* 1.2, 1.3, 2.1.

**Checks.**

- `d = 1`, piecewise linears, `u = e^{-π² t} sin πx`, `uh(0)` the Ritz projection, `t = 0.1`:
  `L²` errors `6.83e-3`, `1.72e-3`, `4.31e-4` for `n = 8, 16, 32`, `h⁻² × error = 0.44`.
- Negative control: the initial-error term cannot be dropped. With `uh(0) = 0` the semidiscrete
  solution is `0` and the error at `t = 0.1` is `‖u(0.1)‖ = e^{-π²/10}/√2 = 0.2635` for every `h`,
  while the other terms of the bound are `O(h²)`.

## Layer 3: nonsmooth initial data

### 3.1 The smoothing estimate for the error equation

- **Error-equation estimate** (`norm_sq_le_of_errorEquation`): for `T` self-adjoint and positive
  semidefinite on `H`, `e` continuous on `[0, ∞)`, `T e' + e = ρ` for `t > 0` and `T e(0) = 0`,
  `‖e(t)‖² ≤ 8 (‖ρ(t)‖² + t⁻¹ ∫₀ᵗ (‖ρ‖² + s² ‖ρ'‖²))` for `t > 0`. Thomée, Lemma 3.3, p. 41, with
  `C` unspecified; the constant `8` comes from the proof: `2 t ‖ρ‖ ‖e‖ ≤ (t/2) ‖e‖² + 2t ‖ρ‖²` in
  (3.8) and `∫ ‖e‖² ≤ ∫ ‖ρ‖²` from (2.29), recalled on p. 41. Self-adjointness is used in the
  latter step, which Thomée's framework (i), p. 40, supplies.

*Needs:* Mathlib calculus.

**Checks.**

- Scalar `T = τ > 0`, `e(0) = 0`, `ρ` a random sum of four cosines, 300 trials with
  `τ ∈ [10⁻³, 10²]`: the largest ratio of `‖e(t)‖²` to the bracket is `0.604 ≤ 8`.
- Negative control: `H = ℝ`, `T = -1` (not positive semidefinite), `ρ = 1`: the solution of
  `-e' + e = 1`, `e(0) = 0`, is `e = 1 - eᵗ`, and at `t = 3` the left side `(e³ - 1)² = 364.4`
  exceeds the right side `8 (1 + 1) = 16`.

### 3.2 The heat equation with data in `L²`

- **Nonsmooth data** (`exists_nonsmooth_error_le`): for bounded `Ω`, elliptic regularity,
  approximation order `2`, `u` a strong solution on `Ioi 0` with `u(t) → v` in `L²` and
  `uh(0)` the `L²` projection of `v`,
  `‖uh(t) - u(t)‖ ≤ C' h² / (t + h²) ‖v‖` for `t > 0`. Thomée, Theorem 3.2, p. 43, with `r = 2`
  and the remark on p. 44 that `t` may be replaced by `t + h²`. Proof route: 3.1 with
  `ρ = R u - u` and the spectral bounds of Thomée, Lemma 3.2, p. 39, for the first-order estimate
  `C h t^{-1/2} ‖v‖` (Thomée (3.12), p. 43), then the iteration
  `F(t) = F(t/2) E(t/2) + E(t/2) F(t/2) + F(t/2)²` of p. 43 with the smooth-data estimate of
  Thomée, Theorem 3.1, p. 41. The heat semigroup `E(t)` and the Dirichlet eigenbasis are those of
  PDE §6.3 and §4.4.
- **Higher order.** Under elliptic regularity of order `r - 2` and approximation order `r`, the
  rate is `h^r t^{-r/2} ‖v‖`. Thomée, Theorem 3.2, p. 43, and Theorem 3.3, p. 44.

*Needs:* 1.2, 2.1, 3.1; PDE §4.4, §6.3.

**Checks.**

- `d = 1`, piecewise linears, `v = 1` on `(0, 1)` (not in `H¹₀`): `t h⁻² × error` is
  `0.0120, 0.0124, 0.0125` at `t = 0.01` and `0.0302, 0.0300, 0.0299` at `t = 0.1` for
  `n = 8, 16, 32`, the rate `h² / t`.
- Negative control: with `uh(0) = 0` instead of the `L²` projection of `v`, the error is
  `‖u(t)‖`, `0.3356` at `t = 0.1` for `v = 1` and every `h`, while the bound tends to `0` with
  `h`; the hypothesis on `uh(0)` is needed (Thomée uses that the discrete solution operator
  annihilates `e(0)`, which holds for `uh(0) = P_h v`, p. 41).

## Layer 4: discontinuous Galerkin time stepping

### 4.1 The scalar step

- `IsDGHeatStep q z U`: `deg U < q` and `∫₀¹ (U' + zU) p + (U(0) - 1) p(0) = 0` for `deg p < q`;
  Thomée (12.4), p. 204, for `u' + λu = 0` from the value `1` on an interval of length `k`,
  rescaled, `z = kλ`.
- **Unique solvability** (`existsUnique_isDGHeatStep`): `q ≥ 1`, `z ≥ 0`. Thomée, p. 205, by the
  energy identity (12.5).
- **Backward Euler** (`isDGHeatStep_one`): `IsDGHeatStep 1 z (C (1 + z)⁻¹)` for `1 + z ≠ 0`.
  Thomée (12.6), p. 205.
- **Padé** (`eval_one_of_isDGHeatStep_two`): for `q = 2`,
  `U(1) = (1 - z/3) / (1 + 2z/3 + z²/6)`, the subdiagonal `(2, 1)` Padé approximant of `e^{-z}`.
  Thomée, p. 206. The denominator has no real zero, so no hypothesis on `z` is needed.
- **Stability** (`abs_eval_one_le_of_isDGHeatStep`): `|U(1)| ≤ 1` for `z ≥ 0`. Proof route:
  testing with `p = U` gives `U(1)² + U(0)² + 2z ∫ U² = 2U(0) ≤ U(0)² + 1` (Thomée (12.5),
  p. 205).
- **Nodal superconvergence** (`exists_dgHeatStep_error_le_pow`): `|U(1) - e^{-z}| ≤ C z^{2q}` for
  `0 ≤ z ≤ 1`. Proof route: the duality argument of the proof of Thomée, Theorem 12.3,
  pp. 211–213, for the scalar equation, where both the error of the interpolant (12.9) and that of
  the dual solution are orthogonal to polynomials of degree `q - 2`; equivalently `U(1)` is the
  `(q, q - 1)` Padé approximant of `e^{-z}`, as Thomée notes for `q = 2` on p. 211.

*Needs:* Mathlib polynomials and interval integrals.

**Checks.**

- Solving the `q × q` system symbolically: `U(1) = 1/(1 + z)`, `(6 - 2z)/(z² + 4z + 6)`,
  `3(z² - 8z + 20)/(z³ + 9z² + 36z + 60)` and
  `-4(z³ - 15z² + 90z - 210)/(z⁴ + 16z³ + 120z² + 480z + 840)` for `q = 1, …, 4`, with
  `U(1) - e^{-z}` equal to `z²/2`, `-z⁴/72`, `z⁶/7200`, `-z⁸/1411200` at leading order.
- `max |U(1)| = 1` over `z ∈ [0, 10⁶]` for `q = 1, …, 4`, attained at `z = 0`.
- Negative control: for `z = -1` and `q = 1` the system `(1 + z) U = 1` has no solution, so the
  hypothesis `1 + z ≠ 0` in `isDGHeatStep_one` and `z ≥ 0` in the existence statement are needed.

### 4.2 The step for a self-adjoint operator

- `dgPoly c τ = ∑ τ^i c_i` and `dgPolyDeriv c` (with `hasDerivAt_dgPoly`, proved);
  `IsDGStep A k g U₀ c`: the step (12.4) of Thomée, p. 204, on an interval of length `k` rescaled
  to `[0, 1]`, tested against `τ^l ψ`, `l < q`, `ψ ∈ S`; `dgNodal v c` lists the nodal values and
  `IsDGSolution A k f v c` asks every step to hold with uniform step `k`.
- **Unique solvability** (`existsUnique_isDGStep`): for `S` finite-dimensional, `A` symmetric and
  positive semidefinite, `k ≥ 0` and `g` interval integrable. Thomée, p. 205, by reduction to the
  eigenspaces of `A`.
- **Reduction** (`isDGStep_of_isDGHeatStep`): if `A x = λx` and `P` is the scalar step for
  `z = kλ`, the coefficients `P.coeff i • x` solve the step from `x` with `g = 0`; so
  `U^n = r(kA)^n v` for the homogeneous equation. Thomée, p. 206.
- **Variable steps.** With steps k_n the same statements hold with `k` replaced by k_n on
  J_n; Thomée treats variable steps throughout chapter 12.

*Needs:* 4.1; Mathlib spectral theorem for symmetric operators in finite dimension.

**Checks.**

- `q = 1`: the step is `(I + kA) U^n = U^{n-1} + k ∫ g`, Thomée (12.6), p. 205; for `A = 0` it is
  exact at the nodes, `U^n - U^{n-1} = ∫_{J_n} f`.
- Negative control: `A = diag(1, -1)` is not positive semidefinite, and for `k = 1` the
  eigenvalue `-1` gives `1 + z = 0` with `q = 1`, so the step is not solvable.

### 4.3 Error estimates

- **Global error** (`exists_dg_error_sq_le`): for `q ≥ 1` there is `C` such that for every finite
  dimensional `S`, symmetric positive semidefinite `A`, `k > 0` and `u` of class `C^q` solving
  `u' + Au = f`, `‖U^N - u(Nk)‖² ≤ C k^{2q} ∫₀^{Nk} ⟪A u^{(q)}, u^{(q)}⟫`. Thomée, Theorem 12.1,
  (12.8), p. 207, with `|v|₁² = ⟪Av, v⟫`.
- **Nodal superconvergence** (`exists_dg_nodal_superconvergence`): for `q ≥ 2`,
  `‖U^N - u(Nk)‖² ≤ C k^{4q-2} ∫₀^{Nk} ⟪A^{2q-1} u^{(q)}, u^{(q)}⟫`. Thomée, Theorem 12.3,
  p. 211, for uniform steps.
- **Between the nodes.** `‖U - u‖` on J_n is bounded by the nodal errors at both ends and
  `C k^q sup_{J_n} ‖u^{(q)}‖`. Thomée, Theorem 12.2, p. 209.

*Needs:* 4.1, 4.2.

**Checks.**

- Scalar `A = λ`, `u = e^{-λt}`, `q = 2`: the nodal error after one step is
  `|r(kλ) - e^{-kλ}| ≈ (kλ)⁴/72`, consistent with order `2q - 1 = 3` globally over `1/k` steps.
- `C` does not depend on `A` or on the dimension: the bound for a diagonal `A` is the sum of the
  scalar bounds, and every scalar bound has the same constant.

## Layer 5: Fourier approximation of periodic functions

### 5.1 Bernstein's inequality in `L²`

- `fourierPoly N c x = ∑_{|j| ≤ N} c_j e^{ijx}`.
- **Bernstein** (`bernstein_fourierPoly`): `∫₀^{2π} |φ^{(m)}|² ≤ N^{2m} ∫₀^{2π} |φ|²`.
  Shen–Tang–Wang, Lemma 2.5, (2.44), p. 33; Canuto et al., (5.1.5), p. 268. Proof route:
  Parseval, `∫ |φ^{(m)}|² = 2π ∑ j^{2m} |c_j|²`. This is the `L²` form; the maximum-norm form
  for real trigonometric polynomials is PolynomialInterpolationAndBestApproximation §4.1.

*Needs:* Mathlib `iteratedDeriv` and interval integrals.

**Checks.**

- `φ = e^{iNx}`: equality for every `m`.
- `N = 0`: `φ` is constant, both sides vanish for `m ≥ 1`.
- Negative control: `fourierPoly` keeps only the band `|j| ≤ N`. With `N = 1` and `c_j = 1` for
  `j = 2` only, `fourierPoly 1 c = 0`; a definition summing all `j` would give `φ = e^{2ix}`, for
  which `∫ |φ'|² = 8π` exceeds `N² ∫ |φ|² = 2π`.

### 5.2 Truncation of the Fourier series

- **Sobolev norms.** The truncation error `‖∂^l (P_N u - u)‖ ≤ N^{l-m} |u|_m` (Shen–Tang–Wang,
  Theorem 2.1, (2.48), pp. 34–35; Canuto et al., (5.1.9)–(5.1.10), p. 270) is
  FastAndNonequispacedFourierTransforms §5.3; in Fourier coefficients it is the termwise bound
  `|k|^{2l} ≤ N^{2(l-m)} |k|^{2m}` for `|k| > N`, and it is not restated here.
- **Maximum norm** (`norm_sub_truncation_sq_le`): for `u` continuous and `m > 1/2`,
  `|u(x) - P_N u(x)|² ≤ 2/(2m - 1) N^{1-2m} ∑ |k|^{2m} |û_k|²`. Shen–Tang–Wang, Theorem 2.2,
  (2.49), p. 35, which prints the constant `1/(2m - 1)` under the square root: the proof bounds
  the sum over `|k| > N` of `|k|^{-2m}`, which counts both signs of `k`, by one integral
  `∫_N^∞ x^{-2m}`. Pointwise convergence of the Fourier series:
  `has_pointwise_sum_fourier_series_of_summable`.

*Needs:* Mathlib Fourier coefficients on `AddCircle` and Parseval's identity.

**Checks.**

- Misprint: `m = 1`, `N = 1`, `û_k = |k|^{-2}` for `|k| > 1` and `û_k = 0` otherwise: at `x = 0`
  the error is `∑_{|k|>1} k^{-2} = π²/3 - 2 = 1.2899`, which is also `|u|_1²`, so the ratio of the
  error to `|u|_1` is `√1.2899 = 1.1357`, above the printed constant `1` and below the corrected
  `√2 = 1.4142`. With `m = 3/4`, `N = 2` and `û_k = |k|^{-3/2}` for `|k| > 2` the ratio is
  `1.5867`, above the printed `√2 · 2^{-1/4} = 1.1892` and below the corrected `1.6818`.
- Negative control: `N = 0` is excluded: `0^{1-2m} = 0` for `m > 1/2` would make the right side
  `0` while `u = e^{ix}` has error `1` at every `x`.

### 5.3 Trigonometric interpolation

- `trigNode N j = πj/N`, `discreteCoeff N u k = (2N)⁻¹ ∑_{j<2N} u(x_j) e^{-ikx_j}` and
  `trigInterpolant N u = ∑_{|k| ≤ N} c_k⁻¹ discreteCoeff N u k e^{ikx}`, `c_{±N} = 2`, c_k = 1
  otherwise. Shen–Tang–Wang, (2.50)–(2.51), pp. 35–36.
- **Interpolation** (`trigInterpolant_trigNode`): `I_N u(x_j) = u(x_j)` for `j < 2N`, `N ≥ 1`.
  Proof route: the halved coefficients at `±N` coincide at the nodes, and the remaining sum is
  the inverse discrete Fourier transform over `2N` consecutive frequencies.
- **Error** (`exists_trigInterpolant_error_le`): for `m > 1/2` there is `C` with
  `‖I_N u - u‖² ≤ C N^{-2m} ∑ |k|^{2m} |û_k|²`. Shen–Tang–Wang, Theorem 2.3, (2.52), p. 36, with
  the aliasing formula (2.53), p. 36; Canuto et al., (5.1.16), p. 272, for `m ≥ 1`. The
  derivative estimates `‖∂^l (I_N u - u)‖ ≤ C N^{l-m} |u|_m`, `l ≤ m`, follow with 5.1 and the
  termwise truncation bound (Shen–Tang–Wang, p. 37).

*Needs:* 5.1; Mathlib `fourier` and `AddCircle.haarAddCircle`.

**Checks.**

- `u = |sin x|³`, `N = 4, …, 64`: node errors below `1.2e-14`; normalized `L²` errors with
  `N^{3.5} × error` between `1.18` and `2.01`, the rate `N^{-m}` for every `m < 3.5`.
- Negative control: without the halving at `k = ±N` the node property fails, since
  `e^{iNx_j} = e^{-iNx_j}` doubles that coefficient.

## Layer 6: Jacobi weights and polynomial projections

### 6.1 The Jacobi measure and the Jacobi polynomials

- `jacobi`, `jacobiMeasure` (LaguerreJacobi §§3.2, 4.1, local copies) and `weightedNormSq α β g`
  (Conventions).
- **Orthogonality measure** (`isOrthogonalityMeasure_jacobiMeasure`): for `α, β > -1`.
  Shen–Tang–Wang, §3.2, p. 70, where the weight is integrable exactly for `α, β > -1`. Proof
  route: the moments are finite because the measure is finite and supported in `[-1, 1]`
  (LaguerreJacobi §§4.1–4.2), and the support is `[-1, 1]` because the density is positive on
  `(-1, 1)`.
- **Identification** (`monic_jacobiMeasure_eq`): for `α, β > -1`, the Gram–Schmidt polynomial
  `monic (jacobiMeasure α β) n` of SpecialFunctionsOrthogonalPolynomialsGeneral §2.2 is
  `jacobi α β n` divided by its leading coefficient. Proof route: `jacobi α β n` has degree `n`
  (LaguerreJacobi §3.2) and is orthogonal to lower degrees (LaguerreJacobi §4.3), so the
  uniqueness of the monic orthogonal polynomial (eq_monic of
  SpecialFunctionsOrthogonalPolynomialsGeneral §2.2) applies.
- **Derivative relation** (`derivative_monic_jacobiMeasure`):
  `(p_{n+1}^{α,β})' = (n + 1) p_n^{α+1,β+1}` for the monic polynomials. Shen–Tang–Wang,
  (3.98)–(3.100), p. 72, in the normalization `J_n^{α,β}`, where
  `∂J_n^{α,β} = (n + α + β + 1)/2 · J_{n-1}^{α+1,β+1}`. Proof route: the identification with
  the derivative relation of LaguerreJacobi §3.3 and a comparison of leading coefficients.
- **Norms of derivatives** (`pairing_derivative_monic_jacobiMeasure`):
  `∫ (p_n')² ω^{α+1,β+1} = n(n + α + β + 1) ∫ p_n² ω^{α,β}`. Shen–Tang–Wang, Corollary 3.5,
  (3.97), p. 71, with the eigenvalue (3.91) of Theorem 3.16, p. 70. Proof route: the derivative
  relation and the norm sequence of LaguerreJacobi §4.3 for the parameters `(α, β)` and
  `(α + 1, β + 1)`.

*Needs:* SpecialFunctionsOrthogonalPolynomialsGeneral §2.1, §2.2; LaguerreJacobi §§3.2, 3.3,
4.1–4.3.

**Checks.**

- `α = β = 0`, `n = 2`: `jacobi 0 0 2 = (3X² - 1)/2` and `monic (jacobiMeasure 0 0) 2 = X² - 1/3`.
  `(α, β) = (0, 1)`, `n = 1`: `jacobi 0 1 1 = (3X - 1)/2` and Gram–Schmidt for the weight `1 + x`
  gives `X - (2/3)/2 = X - 1/3`. Negative control: the orientation with `α` and `β` exchanged
  gives `X + 1/3`, and `∫ (x + 1/3)(1 + x) dx = 4/3 ≠ 0` over `(-1, 1)`.
- `α = 1/2`, `β = -1/3`, Gram–Schmidt at 30 digits: `p_{n+1}' - (n + 1) q_n` vanishes to
  `4e-23` for `n + 1 = 1, …, 4`, and both sides of the norm identity agree (`1.45112638`,
  `1.07851457`, `0.53616130`, `0.22255137`).
- `n = 0`: both sides of the norm identity are `0`.

### 6.2 The weighted `L²` projection

- `IsWeightedProjection α β N u p`: `deg p ≤ N` and `u - p` is orthogonal to polynomials of
  degree `≤ N` in `L²_{ω^{α,β}}`.
- **Projection error** (`exists_weightedProjection_error_le`): for `α, β > -1` and fixed `m` there
  is `C` with `N^{2(m-l)} ‖∂^l (u - π_N u)‖²_{ω^{α+l,β+l}} ≤ C ‖∂^m u‖²_{ω^{α+m,β+m}}` for
  `0 ≤ l ≤ m ≤ N + 1` and `u` with finite weighted norms of all derivatives up to `m` (the space
  `B^m_{α,β}` of Shen–Tang–Wang (3.251), p. 117). Shen–Tang–Wang, Theorem 3.35, p. 118, in the
  fixed-`m` form of Remark 3.7, p. 119; Canuto et al., (5.4.11), p. 283, for `α = β = 0`.
- **Suboptimality in `H¹`.** For `α = β = 0`, `‖(u - π_N u)'‖ ≤ C N^{3/2-m} |u|_m` and the
  exponent cannot be improved. Canuto et al., (5.4.18), p. 285.

*Needs:* 6.1.

**Checks.**

- Negative control for an `m`-independent constant: for `α = β = 0`, `l = 0`, `u = L_{N+1}` and
  `m = N + 1`, `π_N u = 0`, and the inequality (3.256) of Theorem 3.35 with its factor
  `√((N - m + 1)!/(N - l + 1)!) (N + m)^{(l-m)/2}` holds only for
  `c² ≥ (N + 1)! (2N + 1)^{N+1} / (2N + 2)!`, that is `c ≥ 0.866`, `1.021`, `1.632`, `3.527`,
  `16.39`, `352.9` for `N = 1, 2, 5, 10, 20, 40`. The fixed-`m` form has no such constraint.
- Suboptimality: `u = L_{N+1} - L_{N-1}` has `π_N u = -L_{N-1}`; the ratio of
  `‖(u - π_N u)'‖` to the best `H¹`-seminorm approximation error is
  `√((N+1)(N+2)/(2(2N+1)))`, `1.29, 2.15, 4.08, 8.04` for `N = 4, 16, 64, 256` (`≈ √N / 2`).

### 6.3 The `H¹₀` projection

- `IsH10Projection N u p`: `deg p ≤ N`, `p(±1) = 0` and `∫ (u' - p') q' = 0` for `deg q ≤ N`,
  `q(±1) = 0`; Shen–Tang–Wang (3.282), p. 124, with `α = β = 0`; Canuto et al., (5.4.29), p. 288.
- **Error** (`exists_H10Projection_error_le`): for fixed `m ≥ 1`, `m ≤ N + 1`, `u(±1) = 0`,
  `N^{2(m-1)} ‖(u - p)'‖² ≤ C ‖u^{(m)}‖²_{ω^{m-1,m-1}}` and `N^{2m} ‖u - p‖² ≤ C ‖u^{(m)}‖²`.
  Shen–Tang–Wang, Theorem 3.38, (3.283), p. 124, for the first (proof pp. 124–125); Canuto et
  al., (5.4.30), p. 288, with `|u|_{H^{m;N}} = ‖u^{(m)}‖` for `N ≥ m - 1` ((5.4.10), p. 283), for
  the second.

*Needs:* 6.2.

**Checks.**

- Negative control for `m ≤ N + 1`: for `N = 1` the only admissible `p` is `0`; with
  `u = 1 - x²` and `m = 3`, `u''' = 0` makes the right side `0` while `‖u'‖² = 8/3 > 0`.
- `u = 1 - x²`, `N = 2`: `p = u` and both errors vanish, as the bound with `m = 3 ≤ N + 1`
  requires.
- Theorem 3.38 states its constant independent of `m`. For `u = (1 - x²) L_N'` (degree `N + 1`,
  vanishing at `±1`) and `m = N + 1`, the error `u' - p'` is the `L_N` component of `u'`, and
  (3.283) with its factor `√((N - m + 1)!/N!) (N + m)^{(1-m)/2}` needs `c ≥ 1.225`, `1.443`,
  `2.308`, `4.988`, `23.18` for `N = 1, 2, 5, 10, 20`.

## Layer 7: Legendre–Gauss–Lobatto interpolation and the Legendre–Galerkin method

### 7.1 Legendre–Gauss–Lobatto interpolation

- `lglNodes n`: the `N + 1 = n + 2` nodes `-1`, the zeros of L_N' and `1`, where the interior
  nodes are `zeros (jacobiMeasure 1 1) n` of SpecialFunctionsOrthogonalPolynomialsGeneral §5.1
  (local copy), since L_N' is a multiple of `p_{N-1}^{1,1}` by 6.1. `lglInterpolant n u` is
  `Lagrange.interpolate` at these nodes, the convention of
  PolynomialInterpolationAndBestApproximation (Conventions). These are the `N + 1` points of
  Shen–Tang–Wang, Theorem 3.44, p. 137.
- **Increasing nodes** (`lglNodes_strictMono`). Proof route: zeros_spec and zeros_mem_Ioo of
  SpecialFunctionsOrthogonalPolynomialsGeneral §5.1.
- **Interpolation error** (`exists_lglInterpolant_error_le`): for fixed `m ≥ 1`, `m ≤ N + 1`,
  `N^{2(m-1)} (‖(I_N u - u)'‖² + N² ‖I_N u - u‖²_{ω^{-1,-1}}) ≤ C ‖u^{(m)}‖²_{ω^{m-1,m-1}}`.
  Shen–Tang–Wang, Theorem 3.44, (3.320), p. 137, with its proof in §6.5, pp. 222–223, which uses
  Theorem 6.1, p. 221. The proof reduces to `u - u*` with `u*` linear and needs only `u ∈ H¹`, so
  no `ω^{-1,-1}` hypothesis on `u` is imposed; when the right side is finite and `m ≥ 2`,
  `u ∈ H¹` follows by a Hardy inequality.

*Needs:* 6.1, 6.2; SpecialFunctionsOrthogonalPolynomialsGeneral §5.1.

**Checks.**

- `u = eˣ sin πx + |x|^{7/2}` (`u^{(m)}` weighted square integrable for `m < 4`):
  `‖(I_N u - u)'‖ = 0.574, 9.43e-3, 1.08e-3, 1.40e-4` for `N = 4, 8, 16, 32`, with
  `N³ × error = 4.83, 4.41, 4.59` for `N = 8, 16, 32`, and `N ‖I_N u - u‖_{ω^{-1,-1}}` between
  `0.88` and `0.97` times the derivative error.
- Negative control for an `m`-independent constant, which Theorem 3.44 states: `u = (1 - x²) L_N'`
  vanishes at all `N + 1` nodes, so `I_N u = 0`, and with `m = N + 1` the inequality (3.320) needs
  `c ≥ 2.091, 2.622, 4.414, 9.744, 45.80, 992.0` for `N = 1, 2, 5, 10, 20, 40`.

### 7.2 The Legendre–Galerkin method

- `IsLegendreGalerkinSolution α n f U`: `deg U ≤ N`, `U(±1) = 0` and
  `∫ (U'v' + αUv) = ∫ (I_N f) v` for `deg v ≤ N`, `v(±1) = 0`. Shen–Tang–Wang, (4.18), p. 145,
  for the problem `-u'' + αu = f`, `u(±1) = 0`, of (4.10), p. 143, with `α ≥ 0`.
- **Unique solvability** (`existsUnique_legendreGalerkin`): for `α ≥ 0`. Proof route: the form is
  positive on polynomials vanishing at `±1`, as `∫ U'² = 0` forces `U` constant and hence `0`.
  No condition on `N` is needed; for `N ≤ 1` the trial space is `{0}`.
- **`H¹` error** (`exists_legendreGalerkin_H1_error_bound`): for fixed `m, k ≥ 1`, `m, k ≤ N + 1`,
  `‖u - U‖²_{H¹} ≤ C (N^{-2(m-1)} ‖u^{(m)}‖²_{ω^{m-1,m-1}} + N^{-2k} ‖f^{(k)}‖²_{ω^{k-1,k-1}})`.
  Shen–Tang–Wang, Theorem 4.1, (4.76), pp. 165–166, and Remark 4.14, (4.77), p. 166. Proof route:
  the first Strang lemma of GalerkinMethodsAndLagrangeFiniteElements §1.4 (Shen–Tang–Wang apply
  their Theorem 1.3, p. 165), with 6.3 for the best approximation and 7.1 for
  `‖f - I_N f‖ ≤ ‖f - I_N f‖_{ω^{-1,-1}}`.

*Needs:* 6.3, 7.1; GalerkinMethodsAndLagrangeFiniteElements §1.4.

**Checks.**

- `α = 1`, `u = eˣ sin πx`: `H¹` errors `5.0e-2`, `3.1e-6`, `5.8e-12`, `8.1e-13` for
  `N = 6, 12, 18, 24` (spectral convergence to rounding level).
- Negative control for `α ≥ 0`: for `N = 2` the trial space is spanned by `1 - x²`, and
  `∫ (4x²) + α ∫ (1 - x²)² = 8/3 + 16α/15` vanishes at `α = -5/2`, where uniqueness fails.
- Negative control for an `m`-independent constant, which Theorem 4.1 states: `α = 0`,
  `u = (1 - x²) L_N' + w` with `w` of degree `≤ N`, vanishing at `±1`, chosen so that `f = -u''`
  vanishes at `±1`; then `f` has degree `N - 1`, `I_N f = f`, the `f`-term of (4.76) is `0` for
  `k = N`, and with `m = N + 1` the bound needs `c ≥ 2.327, 4.999, 23.19, 499.1` for
  `N = 5, 10, 20, 40`.

## Downstream consumers

- Proper orthogonal decomposition and reduced-order models for parabolic problems: the
  semidiscrete error bound of 1.2 with the reduced space in place of `S`.
- Space–time multilevel and parallel-in-time methods: the discontinuous Galerkin step of 4.2 and
  its stability.
- Stiff time integration: the rational functions of 4.1 are the stability functions of the
  Radau IIA methods.
- Spectral collocation and spectral element methods: the Fourier estimates of Layer 5 and the
  Jacobi and Lobatto estimates of Layers 6–7.
- Finite element methods for evolution problems with adaptivity in time: the abstract bounds of
  Layer 1 with variable steps.

## Scope and ownership

This roadmap owns the error analysis of Galerkin methods for linear parabolic problems (Layers
1–4) and the approximation theory of Fourier, Jacobi and Legendre spectral methods with the
Legendre–Galerkin method (Layers 5–7). The Jacobi polynomials, the Jacobi measure, their
derivative relation and orthogonality are LaguerreJacobi (§§3.2–3.3, 4.1–4.3), copied or
consumed; 6.1 owns only the identification of SpecialFunctionsOrthogonalPolynomialsGeneral's
Gram–Schmidt polynomials of the Jacobi measure with them and its monic corollaries.

It does not build Sobolev spaces (`TauCeti.W1p0`, `TauCeti.Wkp` are Tau Ceti's), the weak
parabolic solution (PDE §6.2), the heat semigroup (PDE §6.3) or the Dirichlet eigenbasis (PDE
§4.4). Meshes, Lagrange finite elements, Céa's lemma and the abstract Aubin–Nitsche lemma are
GalerkinMethodsAndLagrangeFiniteElements (§§1.3–1.4, 4–6); its elliptic regularity hypothesis is
copied, not proved. Orthogonality measures, the monic orthogonal polynomials, their zeros and
Gauss quadrature are SpecialFunctionsOrthogonalPolynomialsGeneral (§§2.1, 2.2, 5.1, 5.3);
Bernstein's inequality in the maximum norm is PolynomialInterpolationAndBestApproximation §4.1.
The trigonometric interpolant on the band −N ≤ k < N and the truncation and interpolation errors
in the periodic Sobolev norms of integer order m ≥ 1 are FastAndNonequispacedFourierTransforms
(§§5.2–5.3); Layer 5 uses the symmetric band with halved coefficients at ±N and real orders
m > 1/2, and consumes nothing from it. KrylovMethodsAndOrthogonalPolynomials treats Gauss
quadrature through the spectral measure of a symmetric matrix and states no estimate used here;
Gauss–Radau and Gauss–Lobatto quadrature errors are outside both.

## Exact supplier contracts

### From Mathlib

- **Calculus and integration:** `derivWithin`, `HasDerivWithinAt`, `iteratedDeriv`,
  `MeasureTheory.Measure.withDensity`, `MeasureTheory.memLp_top_const`.
- **Fourier analysis:** `fourierBasis`, `fourierBasis_repr`, `fourierCoeff`, `fourier`,
  `AddCircle.haarAddCircle`, `hasSum_sq_fourierCoeff`,
  `has_pointwise_sum_fourier_series_of_summable`.
- **Polynomials and linear algebra:** `Lagrange.interpolate`, `Polynomial.derivative`,
  `LinearMap.IsSymmetric`, `ContinuousLinearMap.gelfandDual` (Tau Ceti).

### From Tau Ceti

- **Sobolev spaces** (`TauCeti/Analysis/Sobolev/`): `TauCeti.W1p0`, `TauCeti.W1p0.valueL`,
  `TauCeti.W1p.value`, `TauCeti.W1p.gradient`, `TauCeti.Wkp`, `TauCeti.Wkp.value`,
  `TauCeti.Wkp.firstOrder`, `TauCeti.Wkp.lowerOrderL`, `TauCeti.Wkp.iteratedGradient`.
- **Energy forms** (`TauCeti/Analysis/PDE/`): `TauCeti.PDE.energyFormH1`,
  `TauCeti.PDE.energyFormH1L0`, `TauCeti.PDE.energyFormH1L0_apply`,
  `TauCeti.PDE.IsWeakSolutionDirichlet`.
- **Parabolic Galerkin systems** (`TauCeti/Analysis/PDE/Parabolic/Galerkin.lean`):
  `TauCeti.PDE.existsUnique_galerkinSolution`, the unique global `C¹` solution of the projected
  equation for a finite-dimensional trial map injective into the pivot space (1.2).

### From PDE

- §4.1: the weak form of `-Δ` with homogeneous Dirichlet conditions (2.1).
- §4.4: the Dirichlet eigenbasis, for the spectral bounds in the proof route of 3.2.
- §6.2: the weak parabolic solution and its energy identity, of which the strong solution of
  Layer 2 is the regular case.
- §6.3: the heat semigroup, the exact solution operator `E(t)` of 3.2.

### From GalerkinMethodsAndLagrangeFiniteElements

- Conventions and §6.3: `E`, `toOrderL`, `seminorm` (as copied from SobolevPolynomialApproximation)
  and `HasAdjointH2Regularity`, copied verbatim.
- §1.3: Céa's lemma, in the proof route of 2.1.
- §1.4: the abstract Aubin–Nitsche lemma (2.1) and the first Strang lemma (7.2).
- §5.2: the Scott–Zhang estimate, which gives `HasApproximationOrder` for Lagrange spaces (2.2).

### From SpecialFunctionsOrthogonalPolynomialsGeneral

- §2.1: `IsOrthogonalityMeasure` and `pairing`, copied verbatim.
- §2.2: `monic`, copied verbatim, and its uniqueness eq_monic in the proof route of 6.1.
- §5.1: `zeros`, copied verbatim, with zeros_spec and zeros_mem_Ioo in the proof route of 7.1.

### From LaguerreJacobi

- §3.2: `jacobi`, copied verbatim, and its degree for `α, β > -1` (6.1).
- §3.3: the derivative relation (6.1).
- §§4.1–4.2: `jacobiMeasure`, copied verbatim, its finiteness and its exponential moment (6.1).
- §4.3: the orthogonality relation and the norm sequence (6.1).

### From PolynomialInterpolationAndBestApproximation

- Conventions: interpolation is `Lagrange.interpolate` at injectively labelled nodes (7.1).

## Beyond this roadmap

- Parabolic problems with time-dependent or nonsymmetric forms, and maximum-norm and
  superconvergence estimates for the semidiscrete problem, which need discrete Green's functions.
- Nonsmooth data for fully discrete schemes, which need the smoothing properties of rational
  approximations of `e^{-λ}` beyond the stability of 4.1.
- Chebyshev spectral methods: the weight `ω^{-1/2,-1/2}` fits 6.1–6.2, but the
  Chebyshev–Galerkin method needs a coercivity estimate for the weighted form.
- Spectral methods in several dimensions and spectral element methods, which need tensor-product
  interpolation and the mortar or continuity constraints between elements.
- Fully discrete error estimates for the discontinuous Galerkin method in space and time, which
  combine Layers 2 and 4 under the compatibility conditions Thomée notes after Theorem 12.3,
  p. 211.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) at commit 92a6dba, in
`NASC/TimeDependentGalerkin.lean`, proves without `sorry` fourier_tail_sobolev_sq_le, the
coefficient form of the Sobolev truncation estimate that 5.2 refers to, with the full weights
`(1 + k²)^μ`. It states with `sorry` a semidiscrete error bound for an operator on the pivot space
(1.2; ritz_parabolic_error_le is proved there from a lemma with `sorry`), a θ-scheme error
accumulation (1.3), a smoothing bound for finite-dimensional semigroups (3.2), the endpoint error
of the scalar discontinuous Galerkin step (4.1, with the same definition `IsDGHeatStep`), and the
Legendre–Galerkin problem and its `H¹` bound (7.2, existsUnique_legendreGalerkin and
exists_legendreGalerkin_sobolev_error_bound). Mathlib at commit `1b1ccf4` has the Fourier basis
of `L²` of the circle, Parseval's identity and pointwise convergence of Fourier series with
summable coefficients; it has no Jacobi polynomials and no Galerkin approximation. Tau Ceti at
commit `2fd255d` has the zero-boundary Sobolev spaces, the energy forms and the existence of
parabolic Galerkin approximations used in 1.2.

## References

- V. Thomée, *Galerkin Finite Element Methods for Parabolic Problems*, 2nd ed., Springer Series
  in Computational Mathematics 25, Springer, 2006.
- A. Ern and J.-L. Guermond, *Finite Elements III: First-Order and Time-Dependent PDEs*, Texts in
  Applied Mathematics 74, Springer, 2021. Cited as Ern–Guermond III.
- S. Bartels, *Numerical Methods for Nonlinear Partial Differential Equations*, Springer Series
  in Computational Mathematics 47, Springer, 2015.
- J. Shen, T. Tang and L.-L. Wang, *Spectral Methods: Algorithms, Analysis and Applications*,
  Springer Series in Computational Mathematics 41, Springer, 2011.
- C. Canuto, M. Y. Hussaini, A. Quarteroni and T. A. Zang, *Spectral Methods: Fundamentals in
  Single Domains*, Scientific Computation, Springer, 2006. Cited as Canuto et al.
