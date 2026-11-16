# Roadmap: Dirac scattering and the non-linear Fourier transform

**Summary.** Build the theory of one-dimensional Dirac systems on the half-line and of the SU(1,1)
non-linear Fourier transform, from Mathlib's Bochner integration, absolutely continuous functions
and complex analysis and from Tau Ceti's Carathéodory, Grönwall, maximal-function and Nevanlinna–Pick
modules, up to the pointwise convergence of the non-linear Fourier transform at
resonance-free points, the conditional form of Poltoratski's non-linear Carleson theorem. The roadmap first
extends Carathéodory's theory of linear differential equations to integrable coefficients
depending holomorphically on a parameter. It then develops the function theory of the upper
half-plane that the scattering theory consumes: Poisson integrals, Fatou's theorem, bounded
holomorphic functions, the Hardy spaces `H^p(ℂ₊)` with the Hilbert space `H²(ℂ₊)`, Paley–Wiener spaces and
outer functions. On this
base it defines the Dirac system `ΩX′ = zX − Q_q X` with a locally integrable complex potential
`q`, its fundamental matrix, its Hermite–Biehler functions `E`, `Ẽ` and its scattering functions
`a`, `b`. It proves the SU(1,1) structure, the half-plane bounds `|a| ≥ 1` and `|b| < |a|`,
outerness of `a` and the non-linear Plancherel identity `∫_ℝ log|a(t,x)| dx = (π/2)∫₀ᵗ |q|²`.
For square-integrable `q` it constructs the scattering limit and the non-linear Fourier transform
`q⌃ = b(∞,·)/a(∞,·)`, with its boundary values, its Plancherel identity at `t = ∞`, the
`L²(ℝ)`-convergence of truncations and the elementary rules it shares with the linear transform.
The spectral side follows: de Branges spaces, Weyl functions, the Neumann and Dirichlet spectral
measures with the isometric embeddings `B(E(t,·)) → L²(μ)`, and the Szegő condition
`log w ∈ L¹(Π)` for square-integrable potentials. For real potentials the last three layers develop
meromorphic inner functions and resonances, universality of reproducing kernels and the
approximation of `E` by sines and exponentials near almost every real point, and prove the pointwise
convergence `q⌃_T(s) → q⌃(s)` at almost every resonance-free point `s ∈ ℝ`: a point such that, for every
`C > 0`, neither `E(t, ·)` nor `Ẽ(t, ·)` has a zero in the square of side `2C/t` centred at `s` once `t` is
large.

`Suggested.lean` states the headline theorems against the pinned Mathlib and Tau Ceti: the linear
Carathéodory theorem (§1.2), the existence and uniqueness of the Dirac fundamental system (§3.1), the
finite non-linear Plancherel identity (§4.4), the non-linear Fourier transform on `ℝ` with its Plancherel
identity and the convergence of truncations (§5.4–§5.5), the existence, the isometric embedding and the
uniqueness of the spectral measures (§6.5–§6.6), the Szegő condition (§6.8) and the pointwise convergence
at resonance-free points (§9.6). Every headline theorem is statable at the pins, and the few definitions
these statements need are named in the sections that introduce their objects.

## Scope and ownership

This roadmap owns, by layer:

- Layer 1: the integral Grönwall inequality with an integrable kernel, the linear Carathéodory
  theorem with an integrable coefficient in a Banach space, the two-parameter propagator, Liouville's
  formula, continuous dependence on the coefficient in `L¹`, holomorphic dependence on a
  parameter, and the nonlinear Carathéodory theorem with an integrable Lipschitz modulus;
- Layer 2: Poisson integrals of Poisson-finite measures on `ℝ` (Tau Ceti's half-space Poisson
  integral takes bounded data only), positive harmonic functions on `ℂ₊`, nontangential maximal
  functions, Fatou's theorem for Poisson integrals, boundary values and uniqueness for bounded
  holomorphic functions on `ℂ₊`, the Hardy spaces `H^p(ℂ₊)` for `1 < p < ∞` with the Hilbert space `H²(ℂ₊)`,
  the Paley–Wiener spaces `PW_t`, and outer functions on `ℂ₊`;
- Layer 3: the Dirac system with a locally integrable complex potential, its fundamental matrix,
  its Hermite–Biehler functions and the Hermite–Biehler property;
- Layer 4: the scattering matrix `G`, the scattering functions `a`, `b` on a finite interval,
  their algebraic identities and composition laws, the Dyson bounds, the half-plane bounds,
  outerness and the finite-interval non-linear Plancherel identity, and the Riccati representation;
- Layer 5: the scattering limit for square-integrable potentials, the non-linear Fourier
  transform, its boundary behaviour, its Plancherel identity, convergence of truncations and
  its elementary rules;
- Layer 6: de Branges spaces of Hermite–Biehler functions, the de Branges spaces of a Dirac
  system, the isometric chain, Weyl functions, the Neumann and Dirichlet spectral measures, the
  entropy of the Poisson measure relative to a spectral measure and the Szegő condition for
  square-integrable potentials;
- Layer 7: meromorphic inner functions and their Blaschke representation, the phase-derivative
  representation of a Hermite–Biehler function, Poltoratski's zero-localisation lemma, and the Dirac inner
  functions with their Riccati equation and the motion of resonances;
- Layer 8: universality of reproducing kernels at almost every real point and the
  approximation of the Hermite–Biehler functions near a real point;
- Layer 9: scattering data of subintervals, the lemma that resonances near a point occupy little
  time, resonance-free points, and the pointwise convergence of the non-linear Fourier transform at
  almost every resonance-free point, with its strong form and the boundedness of generalised
  eigenfunctions there.

It leaves to named owners:

- Picard–Lindelöf with continuous time, `ODE_solution_unique_of_mem_Ioo`, absolutely continuous
  functions, the Lebesgue differentiation theorem, the `L²` Fourier transform, the Poisson kernel
  and the Poisson formula of a disc, Phragmén–Lindelöf in a half-plane, and the relative entropy
  of finite measures (`InformationTheory.klDiv`) with its lower bound by the total masses to
  Mathlib, consumed as listed in the supplier contracts;
- the essentially-bounded Carathéodory theorem, the constant-kernel integral Grönwall inequality, the
  absolute continuity of indefinite integrals with values in a normed space, the Dyson series of a
  continuous path, Jacobi's formula for the derivative of the determinant, the identity
  `det(exp A) = exp(tr A)`, Young's inequality for an integrable kernel, the duality
  `L^∞(μ) ≃ L¹(μ)*` of a finite measure, the Hardy–Littlewood maximal function with its weak
  and strong type bounds, the Herglotz representation on the disc with the Herglotz transform of a
  finite measure on the circle, the Nevanlinna representation with a finite measure, the Cayley transform of
  the half-plane, the half-space Poisson kernel with its mass, positivity, harmonicity in the pole and
  kernel comparison, the half-space Poisson integral of bounded data with its harmonicity and boundary
  values, the converse mean-value theorem for harmonic functions, the F. and M. Riesz uniqueness
  theorem on discs, and the variational formula of the relative entropy of finite measures with its
  joint weak lower semicontinuity to Tau Ceti; Layer 1 states the integrable-coefficient
  generalisations and records the pinned essentially-bounded, continuous and constant-coefficient
  cases as Checks, Layer 2 states the Poisson integral of a Poisson-finite measure and records the
  pinned bounded-data case as a Check, and §6.7 computes the relative entropy of the Poisson measure
  with respect to a spectral measure;
- the subtracted-kernel Herglotz representation of a holomorphic `F` on `ℂ₊` with `Im F ≥ 0`,
  `F(z) = a + bz + ∫ ((x − z)⁻¹ − x/(1 + x²)) dν_F(x)` with its unique triple `(a, b, ν_F)`, to
  AutomorphicSpectralTheory §0.5, consumed in §2.2 and §6.5; §2.2 states the form for nonnegative
  harmonic functions, which differs by the passage from `u` to a holomorphic `F` with `Im F = u`, the
  normalisation `ν = πν_F` of the Poisson integral and the mass and vague-limit descriptions of `ν`;
- the disc Hardy space `H²(𝔻)` to Tau Ceti (`TauCeti.HardySpace`, `Analysis/Fourier/Hardy/Basic.lean`
  line 43, with its disc functions, reproducing kernel, boundary uniqueness and the Toeplitz operators
  of bounded symbols in `Analysis/Fourier/Hardy/`), and the further theory of those Toeplitz operators
  to OperatorTheory/ToeplitzOperators, Layers 2–5; harmonic Hardy spaces on Euclidean balls and the
  circle maximal function of a finite measure to StochasticCalculus S6.5; none of these is consumed,
  since Layer 2 works on the half-plane with Lebesgue measure, holomorphic `H^p(ℂ₊)`, and the maximal
  function of a density, reaching Poisson-finite measures in §2.3 by smoothing them into densities;
- the minimal and maximal operators of the Dirac expression in `L²(ℝ₊; ℂ²)`, Green's formula, Weyl's
  limit-point/limit-circle alternative with its independence of the spectral parameter, and the
  self-adjoint realisations by boundary conditions to OperatorTheory/UnboundedOperators §4.8 (UO-D07),
  whose expression `Ju′ + Vu = λu` with `J = [[0, −1], [1, 0]]` and locally integrable Hermitian `V` is
  the Dirac system here under `J = −Ω`, `V = −Q_q`, `λ = −z` (Conventions). None of this is consumed: §6.4
  proves from `det M = 1` (§3.1) that `∞` is a limit-point endpoint for every potential, and builds the Weyl
  discs and the Weyl function.
  §1.2 is the integral-equation theorem with values in a Banach space, an inhomogeneous term and explicit
  bounds; its case `E = ℂ²` at a fixed parameter is the local integral-equation existence and uniqueness
  stated there. The eigenfunction expansion of a self-adjoint Dirac operator, its unitary equivalence with
  multiplication by `x` in `L²(μ_q)`, is outside this roadmap: Layer 6 builds the spectral measures from
  Weyl functions and Herglotz representations and needs no unbounded operator;
- inverse scattering, the Riemann–Hilbert approach, the `ℓ^p` and `L^p` theory of Christ and Kiselev,
  the discrete SU(1,1) model, the Schrödinger reduction and integrable systems are outside this roadmap;
  they consume Layers 3–6 and are listed under Downstream consumers.

AsymptoticExpansions §10.1 states the scalar Volterra equation `h(x) = ∫_x^b K(x, v)(J(v) + ψ(v)h(v)) dv`
with a continuous kernel bounded by a separable product, on which its asymptotic expansions rest. §1.2 is
the linear equation with an integrable operator-valued coefficient on a Banach space, whose coefficient need
not be continuous; neither statement contains the other, and this roadmap uses only its own.

AutomorphicSpectralTheory §1.6 records the Euclidean Paley–Wiener theorem (`euclidean_paley_wiener`): the
Fourier–Laplace transform `ĥ(λ) = ∫ h(H) e^{−λ(H)} dH` maps the smooth functions supported in the closed
ball of radius `R` onto the entire functions `ĥ` with `(1 + ‖λ‖)^N e^{−R‖Re λ‖} |ĥ(λ)|` bounded for every `N`.
§2.7 states the `L²` theorem on `ℝ`: `PW_t` is the image of `L²(−t, t)`, and an entire function of
exponential type at most `t` that is square-integrable on `ℝ` lies in it. The density `1_{[−t,t]}` gives
`2 sin(tz)/z ∈ PW_t`, which is only `O(1/|x|)` on `ℝ`, so the smooth theorem does not reach it; and the
`L²` theorem does not characterise smooth densities. Neither statement contains the other, and this roadmap
uses only its own.

The headline theorem of Layer 9 is stated for real potentials, the generality of poltoratski2024
Theorem 1 (line 579–581), and at resonance-free points (§9.4): it proves convergence at almost every
point `s` such that, for every `C > 0`, the box `Q(s, C/t)` contains no zero of `E(t, ·)` or of `Ẽ(t, ·)`
for large `t`. That almost every point is resonance-free for every real square-integrable potential, which
together with §9.6 gives poltoratski2024 Theorem 1, is not a target of this roadmap. mnatsakanyan2022
reports an error in the proof of Lemma 11 of an earlier arXiv version of poltoratski2024, which it cites as
the e-print arXiv:2103.13349 of 2021 (line 9–13, 135–137, 1812–1813). Version 14 has no Lemma 11; its §9
(line 1482–1533) compares the moduli at `s` of the transforms of `f` and of potentials with inserted zero
intervals on three subintervals. These moduli are pseudo-hyperbolic distances that the insertion does not
change (§9.4, fourth Check), and this roadmap does not use that comparison. denisov2026 poses as a
question (Q2R, line 211–212) whether, for a square-integrable potential on `ℝ` truncated to `(−T, T)`, the
quotient `b/a#` of its scattering coefficients (in its normalisation, line 165–195) converges almost
everywhere as `T → ∞`, and proves that for some square-integrable potential its coefficients `a` and `b`
themselves diverge at every real point (Theorem 1.4, line 215–216); of `a` and `b` themselves, §9.5 and
§9.6 assert only that the moduli converge. Layers 1–6 are stated for complex potentials `q = f + ig` (the
system with `Q_q = [[g, f], [f, −g]]`), and Layers 7–9 for real `f`.

## Conventions

- **Potentials.** A potential is `q : ℝ → ℂ`, integrable on every `[0, t]`; only its values on
  `[0, ∞)` matter. Write `f = Re q`, `g = Im q`; the potential is real when `g = 0`. A
  square-integrable potential is one with `∫₀^∞ |q|² < ∞`; `q_T := q · 1_{(0,T)}` is the truncation.
- **The Dirac system.** `Ω = [[0, 1], [−1, 0]]` and `Q_q(t) = [[g(t), f(t)], [f(t), −g(t)]]`. The
  system is `ΩX′ = zX − Q_q X`, equivalently `X′ = −Ω(z − Q_q)X`, with spectral parameter
  `z ∈ ℂ` (poltoratski2024 line 136–148). This is Denisov's `D = J d/dr + Q` with `J = Ω`
  (denisov2006 line 4245–4258) up to the sign of `Q`. Romanov's `JX′ + QX = λX` (romanov2014 line 231)
  has `J = [[0, −1], [1, 0]] = −Ω` (romanov2014 line 160–164), so it is the present system for
  `Q = −Q_q` and `λ = −z`, the dictionary below for OperatorTheory/UnboundedOperators §4.8; the identities
  this roadmap cites from romanov2014 are stated here in the present `z`. Sign witness: for the real
  constant potential `f = c` at `z = 0` the Neumann solution is `(e^{ct}, 0)`, so `A(t, 0) = e^{ct}`; the
  opposite sign `ΩX′ = zX + QX` gives `e^{−ct}`.
  OperatorTheory/UnboundedOperators §4.8 writes the expression as `Ju′ + Vu = λu` with
  `J = [[0, −1], [1, 0]] = −Ω`; since `J⁻¹ = Ω`, this is `u′ = Ω(λ − V)u`, the present system for
  `V = −Q_q` and `λ = −z`, so `z ∈ ℂ₊` corresponds to `λ ∈ ℂ₋`. Dictionary witness: for `V = 0`, `λ = −z`
  the solution from `(1, 0)` is `(cos tz, sin tz) = Θ(t, z)` of the free system; reading `λ = z` gives
  `(cos tz, −sin tz) = Θ(t, −z)`.
- **Fundamental matrix.** `M(t, z) = [[A, B], [C, D]]` with `M(0, z) = 1`; its first column
  `Θ = (A, C)ᵀ` is the Neumann solution and its second column `Φ = (B, D)ᵀ` the Dirichlet solution.
  Free case `q = 0`: `A = D = cos tz`, `C = −B = sin tz` (poltoratski2024 line 192–195).
- **Reflection.** `H#(z) = conj(H(conj z))`. A matrix or function is real entire when it equals its
  reflection.
- **Hermite–Biehler functions.** `E = A − iC` and `Ẽ = B − iD`; free case `E = e^{−itz}`,
  `Ẽ = −i e^{−itz}`.
- **Scattering functions.** `a = e^{itz}(E + iẼ)/2`, `b = e^{itz}(E − iẼ)/2`, so that
  `G = [[a#, b#], [b, a]]` solves `∂ₜG = [[0, e^{−2izt} conj q], [e^{2izt} q, 0]] G`, `G(0) = 1`.
  The potential `q` stands in the lower left entry: this is forced by the Dirac system with
  `Q_q`, as the computed check in §4.1 shows. Tao and Thiele's `a` is the present `a#`
  (poltoratski2024 line 490–491). Witness: for `q = 1` on `[0, 1]`, `|a(1, 5i)| ≈ 1.093` while
  `|a#(1, 5i)| = |a(1, −5i)| ≈ 237.0`; for a constant `q` on `[0, T]` and `z = 0`,
  `a = cosh(|q|T)` and `b = (q/|q|) sinh(|q|T)`.
- **Non-linear Plancherel constant.** In these normalisations
  `∫_ℝ log|a(t, x)| dx = (π/2) ∫₀ᵗ |q|²`. Witness: for `q = 1` on `[0, 1]`,
  `|a(1, x)|² = 1 + sin²(√(x² − 1))/(x² − 1)` and the integral of half its logarithm is
  `π/2 ≈ 1.5708` (numerically `1.5707` on `[−4000, 4000]`); equivalently `y(a(t, iy) − 1) → ½∫₀ᵗ|q|²`
  as `y → ∞` (numerically `0.4987` at `y = 100`). The sources print the constant `1`
  (poltoratski2024 (5.5) line 545–548, mauth2022 (4) line 206–207); Denisov's Krein-system
  identity with constant `π` (denisov2006 (194) line 3250–3255) becomes `π/2` under the
  dictionary `a(r) = 2 Re A(2r)` (denisov2006 line 4230). Only the value `π/2` is used.
- **The half-plane.** `ℂ₊ = {Im z > 0}` is Mathlib's `UpperHalfPlane.upperHalfPlaneSet`; the closed
  half-plane is `{Im z ≥ 0}`. The Poisson kernel is `P(z, x) = Im z / (π |x − z|²)`, Tau Ceti's
  half-space Poisson kernel in dimension `2` (§2.1), the Poisson measure is `dΠ = dx/(1 + x²)` with
  `Π(ℝ) = π` (poltoratski2024 line 250), and a positive Borel measure `ν` on `ℝ` is Poisson-finite
  when `∫ dν/(1 + x²) < ∞`.
- **Fourier transform.** Mathlib's `𝓕 g (w) = ∫ e^{−2πi v w} g(v) dv` (`Real.fourier_real_eq`).
  The Paley–Wiener space is `PW_t = {∫_{−t}^{t} φ(s) e^{isz} ds : φ ∈ L²(−t, t)}`, with
  `‖F‖²_{L²(ℝ)} = 2π ‖φ‖²` and reproducing kernel `sin(t(z − conj λ))/(π(z − conj λ))`.
- **The non-linear Fourier transform.** `q⌃ = b(∞, ·)/a(∞, ·)` on `ℂ₊` and its nontangential
  boundary function on `ℝ`; its first-order term is `∫₀^∞ q(s) e^{2izs} ds`, which at real `x`
  equals `𝓕(q · 1_{[0,∞)})(−x/π)`.
- **de Branges spaces.** `‖F‖²_{B(E)} = ∫ |F(x)/E(x)|² dx` with reproducing kernel
  `K(w, z) = (E(z) conj E(w) − E#(z) conj E#(w)) / (2πi (conj w − z))` (poltoratski2024 line
  213–233); for `E = e^{−itz}` this is the Paley–Wiener kernel.
- **Spectral measures.** The Weyl function is `m = lim_{t→∞} −Ẽ(t, ·)/E(t, ·)` on `ℂ₊`, and the
  Neumann spectral measure `μ` is the Poisson-finite measure with
  `m(z) = c + βz + (1/π)∫ (1/(x − z) − x/(1 + x²)) dμ(x)`, so that `Im m(x + i0) = w(x)` is the
  density of its absolutely continuous part; that is, `(c, β, μ/π)`, with `c = Re m(i)`, is the triple of
  `m` in the Herglotz representation of AutomorphicSpectralTheory §0.5. The Dirichlet spectral measure `μ̃` has Weyl function
  `−1/m`. Free case: `m = i`, `μ = μ̃ = dx`.
- **Boxes.** `Q(s, C) = {z : |Re z − s| ≤ C, |Im z| ≤ C}` (poltoratski2024 line 625), and
  `γ(p) = √2/√(sinh 2p)` (poltoratski2024 (7.4) line 849).
- **Convergence.** "Almost every" refers to Lebesgue measure. Convergence in measure is Mathlib's
  `MeasureTheory.TendstoInMeasure`. Locally uniform convergence is Mathlib's
  `TendstoLocallyUniformlyOn`.
- **Scalars and carriers.** Banach spaces in Layer 1 are over `𝕜 ∈ {ℝ, ℂ}` (`RCLike 𝕜`) and may live
  in any universe; `2 × 2` matrices are `Matrix (Fin 2) (Fin 2) ℂ`.
- **Solutions as characterised functions.** `Suggested.lean` does not construct the fundamental matrix:
  its `DiracFundamentalSystem` bundles the Neumann and Dirichlet solutions with their integral
  equations, and the headline theorems hold for every such system. §3.1 proves that one exists and
  that any two agree at every `t ≥ 0`, so this is the fundamental matrix of §3.1 and nothing else.
- **Norms on `ℂ²`.** The Dirac system and the scattering matrix act on `ℂ² = EuclideanSpace ℂ (Fin 2)`
  with the Euclidean norm `|(u, v)|² = |u|² + |v|²`. A `2 × 2` matrix acts on it through Mathlib's
  `Matrix.toEuclideanCLM`, with the Euclidean operator norm (Mathlib's scoped `Matrix.Norms.L2Operator`).
  Hence `|Θ|² = |A|² + |C|²`, `‖Ω‖ = 1` and `‖Q_q(t)‖ = |q(t)|`, because `Q_q(t)` is real symmetric with
  `Q_q(t)² = |q(t)|² · 1`, so its eigenvalues are `±|q(t)|`. Norm witness: for `q = 1 + i` the Dirac
  coefficient at `z = 0` is `ΩQ_q = [[1, −1], [−1, −1]]`. Its Euclidean operator norm is `√2 = |q|`, while
  its maximum-row-sum norm, which is the operator norm of `Fin 2 → ℂ` with the sup norm, is `2`. The
  bounds on the Dirac coefficient and on `M` in §1.6 and §3.1 hold for the Euclidean norm, not for the
  sup norm.

## Exact supplier contracts

### From Mathlib

All at the pinned Mathlib; paths under `Mathlib/`.

- `AbsolutelyContinuousOnInterval` (`MeasureTheory/Function/AbsolutelyContinuous.lean` line 155),
  defined for maps into any pseudo-metric space through the total-length filter, with
  `AbsolutelyContinuousOnInterval.continuousOn`, `.add`, `.smul`, `.boundedVariationOn`;
  `AbsolutelyContinuousOnInterval.const_of_ae_hasDerivAt_zero`
  (`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean` line 171) for maps into a
  normed space; `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (line 227) and
  `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`
  (`MeasureTheory/Function/AbsolutelyContinuous.lean` line 451) only for real-valued maps. For maps into
  a real Banach space, `IntervalIntegrable.ae_hasDerivAt_integral`
  (`MeasureTheory/Integral/IntervalIntegral/LebesgueDifferentiationThm.lean` line 67): if `f : ℝ → E` is
  interval integrable on `a..b`, then at almost every `x` between `a` and `b`, and for every base point `c`
  between them, `t ↦ ∫_c^t f` has derivative `f(x)` at `x`. With Tau Ceti's absolute continuity of
  vector-valued indefinite integrals (below) this is the vector-valued fundamental theorem that Layer 1
  consumes: an indefinite integral is absolutely continuous with the integrand as its derivative almost
  everywhere, and by the constancy theorem an absolutely continuous curve is determined by its value at one
  point and its derivative almost everywhere.
- `IsPicardLindelof` and `ODE.picard` (`Analysis/ODE/PicardLindelof.lean` lines 80, 106), which
  require a field continuous in time; `ODE_solution_unique_of_mem_Ioo`
  (`Analysis/ODE/ExistUnique.lean` line 279). Used only in compatibility Checks.
- `VitaliFamily.ae_tendsto_lintegral_enorm_sub_div` (`MeasureTheory/Covering/Differentiation.lean`
  line 819, Lebesgue points of a locally integrable function) and `VitaliFamily.ae_tendsto_rnDeriv`
  (line 658), applied to the Vitali family of closed balls in `ℝ`, in §2.4.
- `MeasureTheory.TendstoInMeasure` (`MeasureTheory/Function/ConvergenceInMeasure.lean` line 57),
  `MeasureTheory.tendstoInMeasure_of_tendsto_eLpNorm` (line 445),
  `MeasureTheory.TendstoInMeasure.exists_seq_tendsto_ae` (line 266).
- `Real.fourier_real_eq` (`Analysis/Fourier/FourierTransform.lean` line 483, the kernel
  `e^{−2πi v w}`) and `MeasureTheory.Lp.fourierTransformₗᵢ` (`Analysis/Fourier/LpSpace.lean` line 51,
  the `L²` Fourier transform as a linear isometry equivalence); `MeasureTheory.Measure.ext_of_charFun`
  (`MeasureTheory/Measure/CharacteristicFunction/Basic.lean` line 257, finite measures with equal
  characteristic functions are equal).
- `PhragmenLindelof.right_half_plane_of_bounded_on_real` (`Analysis/Complex/PhragmenLindelof.lean`
  line 717); `TendstoLocallyUniformlyOn.differentiableOn`
  (`Analysis/Complex/LocallyUniformLimit.lean` line 136); `hasFDerivAt_integral_of_dominated_of_fderiv_le`
  (`Analysis/Calculus/ParametricIntegral.lean` line 222).
- `InnerProductSpace.HarmonicOnNhd`, `HarmonicAt.differentiableAt_complex_partial`
  (`Analysis/Complex/Harmonic/Analytic.lean` line 35: the complex partial `∂u/∂x − i ∂u/∂y` of a
  harmonic function is holomorphic), `InnerProductSpace.HarmonicOnNhd.exists_analyticOnNhd_ball_re_eq`
  (line 74, on balls only) and `InnerProductSpace.bounded_harmonic_on_complex_plane_is_constant`
  (`Analysis/Complex/Harmonic/Liouville.lean` line 52).
- `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean` line 270, Banach–Alaoglu:
  closed balls of the dual of a normed space over a proper field are weak-* compact), in §2.5.
- `ContractingWith` (`Topology/MetricSpace/Contracting.lean` line 42, a Lipschitz self-map with constant
  `K < 1`) for the Picard scheme of §1.2; `MeasureTheory.Measure.rnDeriv` and
  `MeasureTheory.Measure.singularPart` (`MeasureTheory/Measure/Decomposition/Lebesgue.lean` lines 80, 73,
  the Lebesgue decomposition `ν = (dν/dx) dx + ν_s` when `ν` has one with respect to Lebesgue measure) in
  §2.4 and §6.7; `MeasureTheory.measure_limsup_atTop_eq_zero`
  (`MeasureTheory/OuterMeasure/BorelCantelli.lean` line 62: if `Σ μ(sᵢ) < ∞` then `limsup sᵢ` is null) in
  §9.3.
- `Real.tendsto_integral_exp_smul_cocompact` (`Analysis/Fourier/RiemannLebesgueLemma.lean` line 205): the
  Riemann–Lebesgue lemma on `ℝ`, `∫ e^{−2πivw} f(v) dv → 0` as `|w| → ∞` for `f : ℝ → E` (the Bochner integral
  of a non-integrable `f` is `0`, so the content is for integrable `f`), in §4.2.
- For the matching of §8.9: `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`
  (`Analysis/Calculus/InverseFunctionTheorem/ApproximatesLinearOn.lean` line 143): over a complete space, if
  `‖f x − f y − f′(x − y)‖ ≤ c‖x − y‖` on a set containing `closedBall b ε`, `ε ≥ 0`, and `f′` has a right
  inverse bounded by `N`, then `f(closedBall b ε)` contains `closedBall (f b) ((N⁻¹ − c)ε)`;
  `ContinuousLinearEquiv.toNonlinearRightInverse` (`Analysis/Normed/Operator/Banach.lean` line 66: the inverse of
  a continuous linear equivalence as such a right inverse, bounded by its norm), applied to multiplication by
  `g′(s) ≠ 0` on `ℂ`; and `Convex.norm_image_sub_le_of_norm_fderiv_le'` (`Analysis/Calculus/MeanValue.lean`
  line 550: on a convex set where `f` is differentiable with `‖Df(x) − φ‖ ≤ C`,
  `‖f y − f x − φ(y − x)‖ ≤ C‖y − x‖`), which gives the hypothesis on a disc whose radius is explicit.
- `Matrix.det_fin_two` (`LinearAlgebra/Matrix/Determinant/Basic.lean` line 815), `NormedSpace.exp`
  for the constant-coefficient Check, `UpperHalfPlane.upperHalfPlaneSet`.
- For the entropy in §6.7 and §6.8: `InformationTheory.klDiv` (`InformationTheory/KullbackLeibler/Basic.lean`
  line 56), the relative entropy of measures with values in `ℝ≥0∞`. For `σ ≪ ν` with the log-likelihood
  ratio `MeasureTheory.llr σ ν = log (dσ/dν)` (`MeasureTheory/Measure/LogLikelihoodRatio.lean` line 37)
  integrable against `σ` it is `ENNReal.ofReal (∫ llr σ ν dσ + ν(X) − σ(X))`, and it is `∞` otherwise. For
  finite measures the real expression is already nonnegative
  (`InformationTheory.integral_llr_add_sub_measure_univ_nonneg`, line 147), so `ENNReal.ofReal` truncates
  nothing. `InformationTheory.mul_log_le_klDiv` (line 355): for finite `σ`, `ν`,
  `σ(X) log(σ(X)/ν(X)) + ν(X) − σ(X) ≤ klDiv σ ν`, the left side read through `ENNReal.ofReal`. The circle
  carries Mathlib's Borel structure (`MeasureTheory/Group/Circle.lean` lines 32, 34) and is a compact
  metric space.
- For the convergence of truncated spectral measures in §6.5: `span_fourier_closure_eq_top`
  (`Analysis/Fourier/AddCircle.lean` line 244: the span of the monomials `fourier n`, `n ∈ ℤ`, is dense in
  the continuous complex functions on `AddCircle T`), `AddCircle.homeomorphCircle'`
  (`Analysis/SpecialFunctions/Complex/Circle.lean` line 421: the homeomorphism `AddCircle (2π) ≃ₜ Circle`,
  `θ ↦ e^{iθ}`) and `MeasureTheory.FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto`
  (`MeasureTheory/Measure/FiniteMeasure.lean` line 748: weak convergence of finite measures is convergence
  of the integrals of every bounded continuous `𝕜`-valued function, `𝕜 = ℝ` or `ℂ`).
- For Liouville's formula in §1.4: `Matrix.det_apply` (`LinearAlgebra/Matrix/Determinant/Basic.lean`
  line 66, the Leibniz expansion of `det` as a signed sum over permutations of products of entries),
  `Matrix.trace_mul_comm` (`LinearAlgebra/Matrix/Trace.lean` line 156, `tr(AB) = tr(BA)`),
  `Matrix.mul_nonsing_inv` (`LinearAlgebra/Matrix/NonsingularInverse.lean` line 209, `AA⁻¹ = 1` when
  `det A` is a unit), `HasFDerivAt.comp_hasDerivAt` (`Analysis/Calculus/Deriv/Comp.lean` line 375, the
  chain rule along a curve) and `HasFDerivAt.restrictScalars`
  (`Analysis/Calculus/FDeriv/RestrictScalars.lean` line 54). Also
  `LipschitzWith.comp_absolutelyContinuousOnInterval` (`MeasureTheory/Function/AbsolutelyContinuous.lean`
  line 344: a Lipschitz map into a pseudo-metric space composed with an absolutely continuous curve is
  absolutely continuous), applied to the entry maps of the matrix, and `EuclideanSpace.equiv`
  (`Analysis/InnerProductSpace/PiL2.lean` line 296, the continuous linear equivalence
  `EuclideanSpace 𝕜 ι ≃L[𝕜] (ι → 𝕜)` that is the identity on coordinates), for the transport to the
  Euclidean carrier. The derivative of `det` is Tau Ceti's (below).
- For the Euclidean carrier of the Dirac system: `Matrix.toEuclideanCLM` (`Analysis/CStarAlgebra/Matrix.lean`
  line 101, the star-algebra equivalence of `Matrix n n 𝕜` with `EuclideanSpace 𝕜 n →L[𝕜] EuclideanSpace 𝕜 n`
  given by the standard basis, for `RCLike 𝕜`), with the scoped Euclidean operator norm
  `Matrix.Norms.L2Operator` and `Matrix.l2_opNorm_toEuclideanCLM` (line 240, the two norms agree).
- For the Hardy space in §2.6 and §2.8: `ConvexOn.map_integral_le` (`Analysis/Convex/Integral.lean` line
  196, Jensen's inequality for a probability measure, with `f` and `g ∘ f` integrable and `g` continuous
  and convex on a closed convex set), `convexOn_exp` (`Analysis/Convex/SpecificFunctions/Basic.lean` line
  62), `MeasureTheory.lintegral_liminf_le` (`MeasureTheory/Integral/Lebesgue/Add.lean` line 237, Fatou's
  lemma for measurable `ℝ≥0∞`-valued functions) and `MeasureTheory.lintegral_lintegral_swap`
  (`MeasureTheory/Measure/Prod.lean` line 1102, Tonelli for s-finite measures); for the point bound of
  `H^p(ℂ₊)`, `DiffContOnCl.circleAverage` (`Analysis/Complex/MeanValue.lean` line 108: a function complex
  differentiable on an open disc and continuous on its closure has circle average its value at the centre)
  and `Complex.lintegral_comp_polarCoord_symm` (`Analysis/SpecialFunctions/PolarCoord.lean` line 215: the
  lower Lebesgue integral over `ℂ` in polar coordinates, with the weight `r`).
- For the isometric chain in §6.3: `MeasureTheory.intervalIntegral_integral_swap`
  (`MeasureTheory/Integral/Prod.lean` line 486: for an s-finite measure `μ` and `f : ℝ → α → E` integrable
  for the product of Lebesgue measure on the interval between `a` and `b` with `μ`,
  `∫_a^b ∫ f(x, y) dμ(y) dx = ∫ ∫_a^b f(x, y) dx dμ(y)`), with `LipschitzWith.comp_absolutelyContinuousOnInterval`
  and `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` above.
- For the half-plane Poisson kernel in §2.1: `Complex.orthonormalBasisOneI`
  (`Analysis/InnerProductSpace/PiL2.lean` line 853, the orthonormal basis `1, i` of `ℂ` over `ℝ`, whose
  coordinate map `ℂ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 2)` is `z ↦ (Re z, Im z)`),
  `EuclideanSpace.volume_ball_fin_two` (`MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean` line 395, the
  ball of radius `r` in `EuclideanSpace ℝ (Fin 2)` has volume `πr²`), `LinearIsometryEquiv.measurePreserving`
  (`MeasureTheory/Measure/Haar/InnerProductSpace.lean` line 151, a linear isometry of finite-dimensional
  real inner product spaces preserves volume), `DifferentiableOn.analyticAt` (`Analysis/Complex/CauchyIntegral.lean`
  line 723, a function complex differentiable on a neighbourhood of a point is analytic there) and
  `AnalyticAt.harmonicAt_re` (`Analysis/InnerProductSpace/Harmonic/Constructions.lean` line 55, the real part of
  a complex-analytic function is harmonic).
- The disc Poisson kernel `poissonKernel c w ζ = (|ζ − c|² − |w − c|²)/|ζ − w|²` (`Analysis/Complex/Poisson.lean`
  line 54, in the root namespace and without the factor `1/(2π)`, which Mathlib's `Real.circleAverage`
  carries), so that `poissonKernel 0 w ζ = (1 − |w|²)/|ζ − w|²` for `|ζ| = 1`, in §2.1's Cayley comparison
  and §2.5; and the Poisson formula `InnerProductSpace.HarmonicOnNhd.circleAverage_poissonKernel_smul`
  (`Analysis/Complex/Harmonic/Poisson.lean` line 92: a real function harmonic on a neighbourhood of the
  closed disc `closedBall c R` is, at every `w` of the open disc, the circle average of
  `poissonKernel c w` times it), used in a §2.1 Check.

### From Tau Ceti

All at the pinned Tau Ceti; paths under `TauCeti/`.

- `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` and
  `TauCeti.eqOn_of_forall_mem_Icc_eq_picard` (`Analysis/ODE/Caratheodory.lean` lines 196, 219):
  existence and uniqueness for `x′ = M(t)x + F(t)` on `[a, b]` over `ℝ` when `M` is strongly
  measurable and **essentially bounded** and `F` integrable. Layer 1 replaces essential
  boundedness by integrability of `‖M‖` and adds the parameter; the bounded case is a Check.
- `TauCeti.le_mul_exp_of_le_add_mul_integral` (`Analysis/ODE/Gronwall.lean` line 59): Grönwall for
  continuous `φ` with `φ(t) ≤ c + K∫ₐᵗ φ`, `K ≥ 0` constant. Layer 1 states the integrable-kernel
  form; the constant kernel is a Check.
- `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`
  (`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean` line 240): for `f : ℝ → V`
  interval integrable on `a..b`, `V` a real normed space, and a base point `c` between `a` and `b`, the
  indefinite integral `t ↦ ∫_c^t f` is absolutely continuous on the interval. §1.2 applies it to
  `s ↦ P(s)Y(s) + F(s)` in `E`, and §1.3 through §1.2 in `E →L[𝕜] E`.
- `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`
  (`MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean` line 41): for a measure `μ`, a topological
  space `X` and a pseudo-metrizable space `G`, if `g : α → X → G` has almost everywhere strongly measurable
  sections `t ↦ g t x` for every `x` and `g t` is continuous for every `t`, then `t ↦ g t (u t)` is almost
  everywhere strongly measurable for every almost everywhere strongly measurable `u : α → X`; no
  separability of `X` is asked. §1.7 applies it with `X = E` or a closed ball of `E`.
- `TauCeti.dysonSeriesLeft` and `TauCeti.hasDerivAt_dysonSeriesLeft`
  (`Analysis/ODE/DysonSeries.lean` lines 165, 281): the time-ordered exponential of a
  **continuous** path in a Banach algebra; compatibility Check for the propagator.
- `Matrix.hasFDerivAt_det` (`Analysis/Calculus/FDeriv/Det.lean` line 110): Jacobi's formula. Over a
  nontrivially normed field, with Mathlib's `L∞` operator norm on matrices
  (`open scoped Matrix.Norms.Operator`), `det` has Fréchet derivative `H ↦ det A · tr(A⁻¹H)` at
  every square matrix `A` whose determinant is a unit; the same file has the adjugate form
  `tr(adj A · H)` at every matrix (`Matrix.fderiv_det_apply_adjugate`, line 75). §1.4 consumes the
  invertible form. `Matrix.det_exp` (`Analysis/Normed/Algebra/MatrixExponential.lean` line 75):
  `det(exp A) = exp(tr A)` for a square matrix over an `RCLike` field, the constant-coefficient case
  of §1.4 and its compatibility Check.
- `TauCeti.maximalFunction` (`MeasureTheory/Integral/MaximalFunction.lean` line 125, the centred
  maximal function `sup_{r>0} ⨍_{B(x,r)} ‖f‖` with values in `ℝ≥0∞`),
  `TauCeti.mul_measure_lt_maximalFunction_le` (line 353, weak type `(1,1)` with constant `4^{dim}`
  for an additive Haar measure) and `TauCeti.lintegral_rpow_maximalFunction_le` (line 439, strong
  type `(p,p)` for `1 < p`), applied on `ℝ` with Lebesgue measure.
- `TauCeti.norm_convolutionLp_le` and `TauCeti.convolutionLp_ae_eq_convolution`
  (`MeasureTheory/Function/Lp/Convolution.lean` lines 117, 197): Young's inequality. On a
  finite-dimensional real normed space with an additive Haar measure, for `1 ≤ p < ∞` and a real
  integrable kernel `k`, convolution with `k` is a continuous linear operator on `Lᵖ` of norm at most
  `∫ |k|`, represented almost everywhere by the pointwise convolution `∫ k(y) f(x − y) dy` for a
  Banach-space-valued `f`. §5.1 applies it on `ℝ` with `p = 2`.
- `MeasureTheory.Lp.dualOneEquiv` (`MeasureTheory/Function/L1Space/Dual.lean` line 102): for a
  **finite** measure `μ` and `𝕜 = ℝ` or `ℂ`, integration against an essentially bounded function is a
  linear isometric equivalence `L^∞(μ) ≃ L¹(μ)*`. §2.5 applies it to the finite Poisson measure `Π`.
- `MeasureTheory.Measure.herglotzTransform` (`Analysis/Complex/Herglotz.lean` line 138): the Herglotz
  transform `H_ν(ξ) = ∫ (ζ + ξ)/(ζ − ξ) dν(ζ)` of a measure `ν` on Mathlib's `Circle`;
  `MeasureTheory.Measure.herglotzTransform_zero` (line 150): `H_ν(0)` is the total mass of `ν`, as a real
  number. `TauCeti.I_mul_herglotzTransform_cayley_eq` (`Analysis/Complex/Pick/Nevanlinna.lean` line 404): for
  a finite measure `ν` on `Circle` and `z ∈ ℂ₊`, `i H_ν((z − i)/(z + i)) = ν({1}) z + ∫ (1 + xz)/(x − z) dν_C(x)`,
  with `ν_C` the Cayley pushforward below. §6.5 uses them to write a Weyl function as a Herglotz transform
  in the Cayley coordinate. The Nevanlinna representation `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`
  (same file, line 436: `F(z) = βz + ∫ (1 + xz)/(x − z) dρ(x) + Re F(i)` with `ρ` finite and `β ≥ 0`) is
  consumed through AutomorphicSpectralTheory §0.5, which converts it to the subtracted kernel.
- `TauCeti.integral_circle_eq_atom_add_integral_cayleyPushforward` and
  `MeasureTheory.Measure.cayleyPushforward` (`Analysis/Complex/Pick/Nevanlinna.lean` lines 188, 176): for a
  finite measure `ν` on Mathlib's `Circle` and a continuous `f` from `Circle` to a real Banach space,
  `∫ f dν = ν({1}) f(1) + ∫_ℝ f((x − i)/(x + i)) dν_C(x)`, where `ν_C` is the Cayley pushforward: the
  restriction of `ν` to the punctured circle carried to `ℝ` by the inverse of the boundary Cayley map
  `TauCeti.boundaryCayley`, `x ↦ (x − i)/(x + i)`. §6.6 uses it to read weak convergence of the Cayley
  images of the measures `μ_T` on the circle as convergence of integrals over `ℝ` plus the atoms at `1`.
- The relative entropy, in `InformationTheory/KullbackLeibler/Variational.lean`.
  `TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_integral_exp_sub_one` (line 457): on a
  normal Borel space, for finite `σ`, `ν` with `σ + ν` weakly regular, `klDiv σ ν` is the supremum of
  `∫ f dσ − ∫ (e^f − 1) dν` over bounded continuous real `f`. `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure`
  (line 499): on a pseudometrizable Borel space, `(σ, ν) ↦ klDiv σ ν` is jointly lower semicontinuous on
  pairs of finite measures with the topology of weak convergence (Mathlib's `MeasureTheory.FiniteMeasure`).
  §6.7 and §6.8 apply them on the circle.
- `TauCeti.rouche_exists_eq_zero_iff` (`Analysis/Complex/Conformal/Rouche.lean` line 359): Rouché's theorem
  as a zero-detection principle; for `f`, `g` holomorphic on a neighbourhood of the closed disc
  `closedBall c R`, `R > 0`, with `‖f z − g z‖ < ‖f z‖` on the bounding circle, `f` has a zero in the open disc
  if and only if `g` has one. §8.7 applies it on discs of radius `1/(2t)` to a two-term trigonometric form and
  `E(t, ·)`.
- The half-space Poisson kernel, in `Analysis/PDE/GreenFunction/HalfSpace.lean`: for a unit inward
  normal `v` of `EuclideanSpace ℝ (Fin n)`, `TauCeti.halfSpacePoissonKernel n v x y`
  (line 122) is `2⟨v, x⟩/(n ωₙ ‖y − x‖ⁿ)`, with pole `x`, point `y` and `ωₙ` the volume of the unit
  ball. `TauCeti.halfSpacePoissonKernel_pos` (line 147): positive for `0 < ⟨v, x⟩` and `y ≠ x`.
  `TauCeti.harmonicOnNhd_halfSpacePoissonKernel_left` (line 177): for `y` on the hyperplane
  `⟨v, y⟩ = 0`, harmonic in the pole on the open half-space `0 < ⟨v, x⟩`.
  `TauCeti.halfSpacePoissonKernel_le_mul` (line 198): for `y` on the hyperplane, `0 ≤ ⟨v, x⟩`,
  `0 < ⟨v, x₁⟩` and `‖y − x₁‖ ≤ A‖y − x‖`, the bound `K(x, y) ≤ (⟨v, x⟩/⟨v, x₁⟩) Aⁿ K(x₁, y)`.
- The half-space Poisson integral, in `Analysis/PDE/PoissonIntegral/HalfSpace.lean`, against the
  Lebesgue measure of the hyperplane `(ℝ ∙ v)ᗮ`. `TauCeti.integral_halfSpacePoissonKernel` (line 135):
  mass one, `∫ K(x, y) dy = 1`, for `0 < ⟨v, x⟩`. `TauCeti.halfSpacePoissonIntegral` (line 179): the
  Poisson integral `∫ K(x, y) g(y) dy` of real data `g` on the hyperplane.
  `TauCeti.harmonicOnNhd_halfSpacePoissonIntegral` (line 419): harmonic on the open half-space for
  bounded, almost everywhere strongly measurable `g`. `TauCeti.tendsto_halfSpacePoissonIntegral`
  (line 297): for such `g` continuous at a point `ξ` of the hyperplane, `P[g](x) → g(ξ)` as `x → ξ`
  through the open half-space, without restriction on the approach.
- Layer 2 uses these at `n = 2` with `v = (0, 1)`, identifying `ℂ` with `EuclideanSpace ℝ (Fin 2)`
  through `Complex.orthonormalBasisOneI` (Mathlib, above). Then `⟨v, z⟩ = Im z` and `ω₂ = π`, so the kernel
  is `Im z/(π|x − z|²)`. The hyperplane is the real axis, with Lebesgue measure. Complex data are
  treated through their real and imaginary parts.
- `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane`
  (`Analysis/Complex/UpperHalfPlane/Primitive.lean` line 118): every holomorphic function on `ℂ₊`
  has a primitive there; with Mathlib's complex partial this gives harmonic conjugates and
  logarithms of zero-free holomorphic functions on `ℂ₊`.
- `TauCeti.harmonicOnNhd_of_setAverage_ball_eq`
  (`Analysis/InnerProductSpace/Harmonic/MeanValue/Converse.lean` line 69): a continuous function with
  the mean-value property on small balls is harmonic (used for reflection of harmonic functions
  across `ℝ`).
- `TauCeti.eqOn_const_ball_of_tendsto_circleMap` and `AnalyticOnNhd.le_circleAverage_log_norm`
  (`Analysis/Complex/RadialUniqueness.lean` lines 198, 76): a bounded holomorphic function on a disc
  with radial limit `a` on a set of angles of positive measure is the constant `a`, and Jensen's
  lower bound for circle averages of `log‖f‖`; transported to `ℂ₊` by the Cayley transform
  `TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet` and `TauCeti.boundaryCayley`
  (`Analysis/Complex/UpperHalfPlane/Cayley.lean`).

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §0.5 (Herglotz representation): a function `F` holomorphic on `ℂ₊` with `Im F ≥ 0` is
  `F(z) = a + bz + ∫ ((t − z)⁻¹ − t/(1 + t²)) dν_F(t)` for a unique triple with `a = Re F(i)`, `b ≥ 0` and
  `ν_F` a positive Borel measure with `∫ dν_F/(1 + t²) < ∞`, obtained from the finite measure `ρ` of Tau
  Ceti `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` by `dν_F = (1 + t²) dρ`. Since
  `Im (t − z)⁻¹ = π P(z, t)`, on `ℂ₊` this gives `Im F = b Im z + P[πν_F]` with the Poisson integral of §2.1.
  §2.2 consumes it for a holomorphic `F` with `Im F = u`, and §6.5 for the Weyl function `m`, whose triple is
  `(Re m(i), β, μ_q/π)`.

## How to read the build

Layer 1 is the analytic engine: integrable-coefficient linear systems, their propagators and their
holomorphic dependence on a parameter. Layer 2 is the function theory of the upper half-plane. Layer 3
applies Layer 1 to the Dirac system and proves the
algebra and the Hermite–Biehler property of `E` and `Ẽ`. Layer 4 passes to the scattering
functions `a`, `b` and proves, on a finite interval, the SU(1,1) structure, the composition laws, the
half-plane bounds, outerness of `a` and the non-linear Plancherel identity. Layer 5 takes the limit
`t → ∞` for square-integrable potentials, defines the non-linear Fourier transform and proves its
boundary theory. Layer 6 is the spectral theory: de Branges spaces, Weyl functions, spectral measures
and the Szegő condition. Layers 7–9 prove, for real potentials, the pointwise convergence of the
non-linear Fourier transform at almost every resonance-free point: Layer 7 the meromorphic-inner-function
tools, Layer 8 the universality and approximation results, Layer 9 the subinterval calculus, the bound on
the time resonances spend near a point, and the conclusion. Every layer uses only
earlier layers and the suppliers above. Layers 3–5 do not use Layer 6, and Layer 6 does not use Layer 5:
the Szegő condition needs only the finite Plancherel identity of §4.4 and the truncations of §6.5.

## Layer 1: Carathéodory linear systems with a holomorphic parameter

Throughout, `𝕜 ∈ {ℝ, ℂ}`, `E` is a Banach space over `𝕜`, `I ⊆ ℝ` is an interval, and a coefficient
is a map `P : ℝ → (E →L[𝕜] E)` that is almost everywhere strongly measurable on `I` with `‖P‖`
integrable on every compact subinterval of `I`.

### 1.1 The integral Grönwall inequality with an integrable kernel

Let `a ≤ b`, let `β : ℝ → ℝ` be nonnegative and integrable on `[a, b]`, let `α ∈ ℝ`, and let
`u : ℝ → ℝ` be measurable and bounded on `[a, b]` with `u(t) ≤ α + ∫ₐᵗ β u` for every `t ∈ [a, b]`.
Prove that `u(t) ≤ α exp(∫ₐᵗ β)` for every `t ∈ [a, b]`, and the backward form on `[a, b]` with
`∫ₜᵇ`. Route: `v(t) = ∫ₐᵗ β u` is absolutely continuous with `v′ = βu ≤ αβ + βv` almost everywhere,
so `(v e^{−∫ₐᵗβ})′ ≤ αβ e^{−∫ₐᵗβ}` almost everywhere; integrate with the constancy theorem
(coddingtonlevinson1955, Ch. 1, waived; the constant-kernel case is Tau Ceti
`TauCeti.le_mul_exp_of_le_add_mul_integral`).

*Needs:* Mathlib `AbsolutelyContinuousOnInterval.const_of_ae_hasDerivAt_zero`,
`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral`,
`IntervalIntegrable.ae_hasDerivAt_integral`.

**Checks.**

- Constant kernel `β = K ≥ 0` on `[a, b]` and continuous `u`: the conclusion is
  `u(t) ≤ α e^{K(t−a)}`, which is Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`.
- Equality case: `α = 2`, `β = 1_{[0,1]}` on `[0, 2]` and `u(t) = 2e^{min(t,1)}` satisfy the hypothesis
  with equality, and the bound `2e^{min(t,1)}` is attained, so no smaller constant is possible.
- Negative kernels are excluded: `u ≡ 1/2`, `β ≡ −1`, `α = 1` on `[0, 1]` satisfy
  `1/2 ≤ 1 − t/2`, yet `1/2 > e^{−1} ≈ 0.368`; a statement without `β ≥ 0` is false.
- Degenerate kernel `β = 0`: the conclusion is `u ≤ α`.

### 1.2 The linear Carathéodory theorem

Let `a ≤ b`, `t₀ ∈ [a, b]`, `y₀ ∈ E`, let `P` be a coefficient on `[a, b]` and let `F : ℝ → E` be
integrable on `[a, b]`. Prove that there is a `Y : ℝ → E`, continuous on `[a, b]`, with
`Y(t) = y₀ + ∫_{t₀}^{t} (P(s)Y(s) + F(s)) ds` for every `t ∈ [a, b]`, and that any two such functions
agree on `[a, b]` (`linear_caratheodory` in `Suggested.lean`). The statement is made over `ℝ`: a complex
Banach space is a real one, a complex-linear coefficient is real-linear, and the integral equation does
not involve the scalars, so the case `𝕜 = ℂ` is the real statement for the underlying space. A
coefficient on `[a, b]` is a `P` integrable on `[a, b]` in Mathlib's sense (`MeasureTheory.IntegrableOn`).
Prove that every such `Y` is absolutely continuous on `[a, b]`, has derivative
`P(t)Y(t) + F(t)` at almost every `t ∈ (a, b)`, and satisfies
`‖Y(t)‖ ≤ (‖y₀‖ + |∫_{t₀}^{t} ‖F‖|) exp|∫_{t₀}^{t} ‖P‖|` for `t ∈ [a, b]`; conversely a `Y` that is
absolutely continuous on `[a, b]` with `Y(t₀) = y₀` and derivative `P Y + F` at almost every
`t ∈ (a, b)` agrees on `[a, b]` with these solutions. Route: Picard
iteration in `C([a, b], E)`, where the `n`-th iterate moves two curves at time `t` by at most
`(∫_{t₀}^{t}‖P‖)ⁿ/n!` times their distance, so that some iterate is a contraction; uniqueness by 1.1
(coddingtonlevinson1955, Ch. 2 §1, waived; romanov2014 line 212–224 for the canonical-system case).

*Needs:* §1.1; Mathlib Bochner interval integrals, `ContractingWith`,
`AbsolutelyContinuousOnInterval.const_of_ae_hasDerivAt_zero`, `IntervalIntegrable.ae_hasDerivAt_integral`;
Tau Ceti `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral'`.

**Checks.**

- Zero data `P = 0`, `F = 0`: `Y ≡ y₀`.
- Unbounded integrable coefficient: `E = ℂ`, `P(t) = t^{−1/2}` on `(0, 1]`, `t₀ = 0`, `F = 0` gives
  `Y(t) = y₀ e^{2√t}`; `‖P‖` is integrable but not essentially bounded, so Tau Ceti
  `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` does not apply while the theorem does.
- Agreement with Tau Ceti: for `𝕜 = ℝ` and essentially bounded `P`, the solution is the one of
  `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard`, by `TauCeti.eqOn_of_forall_mem_Icc_eq_picard`.
- Fixed parameter on `ℂ²`: for `E = EuclideanSpace ℂ (Fin 2)`, `F = 0` and `P(t) = Ω(λ − V(t))` with `V`
  Hermitian and integrable on `[a, b]`, the theorem is the local integral-equation existence and uniqueness
  of OperatorTheory/UnboundedOperators §4.8 for `Ju′ + Vu = λu`. For `V = 0`, `λ = −z` and `t₀ = 0` the
  solutions from `(1, 0)` and `(0, 1)` are the columns of `[[cos tz, −sin tz], [sin tz, cos tz]]`, the free
  fundamental matrix of §3.1; the sign `λ = z` gives the transpose `[[cos tz, sin tz], [−sin tz, cos tz]]`.
- Integrability is necessary: `P(t) = 1/t` on `(0, 1]` is not integrable at `0`; from `t₀ = 0` every
  `Y(t) = ct` solves `Y′ = Y/t` with `Y(0) = 0`, so uniqueness fails, and no solution has
  `Y(0) = y₀ ≠ 0`.
- Uniqueness holds on `[a, b]` only: for `[a, b] = [0, 1]`, `P = 0`, `F = 0`, `y₀ = 0`, both `Y ≡ 0` and
  the indicator function of `(2, 3)` are continuous on `[0, 1]` and solve the equation there. They agree
  on `[0, 1]` and differ at `5/2`, so a uniqueness claim for functions on all of `ℝ` is false.

### 1.3 The propagator

For a coefficient `P` on `I` and `s, t ∈ I`, define the propagator `N_P(t, s) ∈ E →L[𝕜] E` as the
value at `t` of the solution of 1.2 in the Banach space `E →L[𝕜] E` with coefficient
`X ↦ P(r) ∘ X` and initial value `1` at `s`; equivalently `N_P(t, s) y` is the value at `t` of the
solution with value `y` at `s` (romanov2014 line 213–224 for the chain rule).

- `N_P(t, s) = 1 + ∫_s^t P(r) N_P(r, s) dr`, and `N_P(t, s) y` solves 1.2 with `F = 0`.
- `N_P(t, t) = 1`, `N_P(t, r) N_P(r, s) = N_P(t, s)`, so `N_P(t, s)` is invertible with inverse
  `N_P(s, t)`.
- `‖N_P(t, s)‖ ≤ exp|∫_s^t ‖P‖|` and `‖N_P(t, s) − 1‖ ≤ exp|∫_s^t ‖P‖| − 1`.
- `(t, s) ↦ N_P(t, s)` is continuous in operator norm, and `s ↦ N_P(t, s)` has derivative
  `−N_P(t, s) P(s)` at almost every `s`.
- Variation of constants: the solution of 1.2 is `N_P(t, t₀) y₀ + ∫_{t₀}^{t} N_P(t, s) F(s) ds`.
- Dyson expansion: `N_P(t, s) = Σₙ ∫_{s<r₁<⋯<rₙ<t} P(rₙ)⋯P(r₁)` for `s ≤ t`, norm-convergent,
  the `n`-th term bounded by `(∫_s^t ‖P‖)ⁿ/n!`.
- Locality: `N_P(t, s)` depends only on `P` almost everywhere on the interval between `s` and `t`.

*Needs:* §1.2; Mathlib `ContinuousLinearMap` composition and Bochner integrals in `E →L[𝕜] E`.

**Checks.**

- Constant coefficient `P = A`: `N_P(t, s) = exp((t − s)A)` (Mathlib `NormedSpace.exp`).
- Agreement with Tau Ceti: for continuous `P` on `ℝ`, `N_P(t, 0) = TauCeti.dysonSeriesLeft P t`.
- Time ordering: with `A = [[0,1],[0,0]]` on `[0, 1)` and `B = [[0,0],[1,0]]` on `[1, 2]`,
  `N_P(2, 0) = exp(B) exp(A) = [[1,1],[1,2]]`; the reversed product `exp(A) exp(B) = [[2,1],[1,1]]`
  and the exponential of the integral `exp(A + B) = [[cosh 1, sinh 1],[sinh 1, cosh 1]]` both differ.
- Degenerate coefficient `P = 0`: `N_P ≡ 1`.

### 1.4 Liouville's formula

For `E = Fin n → 𝕜` or `E = EuclideanSpace 𝕜 (Fin n)` and a matrix coefficient `P`, prove
`det N_P(t, s) = exp(∫_s^t tr P)` for `s, t ∈ I`, with `N_P(t, s)` and `P(r)` identified with their
matrices in the standard basis (coddingtonlevinson1955, Ch. 1 §7, waived; romanov2014 line 218–219 for
`det ≡ 1`). Route: fix `s`. At almost every `t` the curve `N_P(·, s)` has derivative `P(t)N` at `t`, where
`N = N_P(t, s)` is invertible (§1.2, §1.3). The chain rule and Jacobi's formula at an invertible matrix
(Tau Ceti `Matrix.hasFDerivAt_det`, restricted to real scalars when `𝕜 = ℂ`) then give
`∂ₜ det N_P(t, s) = det N · tr(N⁻¹P(t)N) = det N · tr P(t)`. Each entry `N ↦ (N e_j)_i` is `1`-Lipschitz
on `E →L[𝕜] E`, since `|(N e_j)_i| ≤ ‖N e_j‖ ≤ ‖N‖`. So the entries of the absolutely continuous curve
`N_P(·, s)` (§1.2) are absolutely continuous (Mathlib
`LipschitzWith.comp_absolutelyContinuousOnInterval`). The function `det N_P(·, s)` is then absolutely
continuous, being a finite sum of products of these entries (the Leibniz expansion). It is therefore an
absolutely continuous solution of the scalar equation `y′ = (tr P) y`, `y(s) = 1`, whose coefficient is
integrable because `|tr P| ≤ n‖P‖`. By the uniqueness clause of §1.2 it equals `exp(∫_s^t tr P)`, which
solves the same equation. The same formula holds for `E = EuclideanSpace 𝕜 (Fin n)`, the carrier of §3.1.
Mathlib's `EuclideanSpace.equiv` is a continuous linear equivalence with `Fin n → 𝕜` that is the identity
on coordinates. Conjugation by it carries a coefficient to a coefficient, and so, by the uniqueness clause
of §1.2, the propagator to the propagator. It changes neither the matrices in the standard basis nor their
determinants and traces.

*Needs:* §1.2 (absolute continuity, the derivative almost everywhere, the uniqueness clause), §1.3
(invertibility); Tau Ceti `Matrix.hasFDerivAt_det`; Mathlib `Matrix.det_apply`,
`Matrix.trace_mul_comm`, `Matrix.mul_nonsing_inv`, `HasFDerivAt.comp_hasDerivAt`,
`HasFDerivAt.restrictScalars`, `LipschitzWith.comp_absolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.add`, `AbsolutelyContinuousOnInterval.smul`, `EuclideanSpace.equiv`.

**Checks.**

- Diagonal `P = diag(p₁, p₂)`: `N = diag(e^{∫p₁}, e^{∫p₂})` and both sides are `e^{∫(p₁ + p₂)}`.
- The time-ordered example of 1.3: `det [[1,1],[1,2]] = 1 = e^{tr A + tr B}`.
- Trace-free Dirac coefficient: `−Ω(z − Q_q)` has trace `0`, so `det = 1` (used in §3.1).
- Agreement with Tau Ceti: for a constant coefficient `P = A`, `N_P(t, s) = exp((t − s)A)` (§1.3), and
  the formula is Tau Ceti `Matrix.det_exp` at `(t − s)A`. For `A = [[1, 1], [0, 1]]`,
  `exp(tA) = e^t [[1, t], [0, 1]]` has determinant `e^{2t} = e^{t tr A}`; a formula with the sum of
  the entries (`e^{3t}`) or with `det A` (`e^t`) in place of the trace gives the wrong value.

### 1.5 Continuous dependence on the coefficient

For coefficients `P, P′` on `[a, b]` and `s, t ∈ [a, b]`, prove
`‖N_{P′}(t, s) − N_P(t, s)‖ ≤ ‖P′ − P‖_{L¹} exp(‖P′‖_{L¹} + ‖P‖_{L¹})`, all norms over the interval
between `s` and `t`; hence `P_n → P` in `L¹([a, b])` implies `N_{P_n} → N_P` uniformly on
`[a, b]²`. Route: subtract the integral equations and apply 1.1 (coddingtonlevinson1955, Ch. 1 §7,
waived).

*Needs:* §1.1, §1.3.

**Checks.**

- Scalar constants `p = 0`, `p′ = 1` on `[0, 1]`: `|e − 1| ≈ 1.718 ≤ 1 · e¹ ≈ 2.718`.
- `P′ = P`: the bound is `0`.
- Locality: `P′ = P` off a null set gives `N_{P′} = N_P`.

### 1.6 Holomorphic dependence on a parameter

Let `E` be a complex Banach space, `U ⊆ ℂ` open, and `P : ℝ × ℂ → (E →L[ℂ] E)` such that
`t ↦ P(t, z)` is a coefficient on `I` for each `z ∈ U`, `z ↦ P(t, z)` is holomorphic on `U` for almost
every `t ∈ I`, and for every compact `K ⊆ U` there is `m_K` integrable on compact subintervals of
`I` with `‖P(t, z)‖ ≤ m_K(t)` for `z ∈ K` and almost every `t`. Prove that for `s, t ∈ I` the map
`z ↦ N_{P(·,z)}(t, s)` is holomorphic on `U`, that `(t, s, z) ↦ N_{P(·,z)}(t, s)` is continuous on
`I × I × U`, that `z ↦ N_{P(·,z)}(·, s)` is holomorphic from `U` into `C(J, E →L[ℂ] E)` for every compact
`J ⊆ I`, with `‖N_{P(·,z)}(t, s)‖ ≤ exp|∫_s^t m_K|` for `z ∈ K`, and that
`∂_z N(t, s) = ∫_s^t N(t, r) ∂_z P(r, z) N(r, s) dr`. In particular an entire coefficient (`U = ℂ`)
gives entire propagators (romanov2014 line 220–222; coddingtonlevinson1955, Ch. 1 §7, waived).
Route: each Dyson term is a parametric integral of a holomorphic integrand dominated on compacts,
hence holomorphic, and the series converges locally uniformly.

*Needs:* §1.3; Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`,
`TendstoLocallyUniformlyOn.differentiableOn`.

**Checks.**

- `P(t, z) = zA`: `N(t, s) = exp((t − s)zA)`, entire in `z`.
- The domination hypothesis is needed: `E = ℂ`, `I = [0, 1]`, `P(t, z) = 1/(z − t)`, `N(t, 0) = z/(z − t)`
  is holomorphic on `U = {Re z > 2}` where the bound holds, and has a pole at `z = t` for every
  `t ∈ (0, 1]`, so no statement on a `U` meeting `[0, 1]` holds.
- The Dirac coefficient `P(t, z) = −Ω(z − Q_q(t)) = [[f(t), −z − g(t)], [z − g(t), −f(t)]]` on
  `EuclideanSpace ℂ (Fin 2)` is entire with `m_K(t) = sup_K |z| + |q(t)|` in the Euclidean operator norm.
  In the maximum-row-sum norm of `Fin 2 → ℂ` the coefficient at `z = 0` has norm `|f(t)| + |g(t)|`, which
  exceeds `|q(t)|` whenever `f(t)g(t) ≠ 0`: for `q = 1 + i` it is `2 > √2 = |q|`. At a fixed `z` the conclusion
  is the fixed-parameter existence statement of 1.2.

### 1.7 The nonlinear Carathéodory theorem

Let `t₀ ∈ I`, `x₀ ∈ E` and `F : ℝ × E → E` with `t ↦ F(t, x)` strongly measurable on `I` for each
`x`, `‖F(t, x) − F(t, y)‖ ≤ L(t)‖x − y‖` and `‖F(t, x₀)‖ ≤ m(t)` for almost every `t ∈ I` and all
`x, y`, where `L, m ≥ 0` are integrable on compact subintervals of `I`. Prove that there is a
`Y : ℝ → E`, continuous on `I`, with `Y(t) = x₀ + ∫_{t₀}^{t} F(s, Y(s)) ds` for `t ∈ I`, and that any two
such functions agree on `I`; that every such `Y` is absolutely continuous on compact subintervals of `I`
with `‖Y(t) − x₀‖ ≤ |∫_{t₀}^{t} m| exp|∫_{t₀}^{t} L|`; and that two initial values give solutions at
distance at most `‖x₀ − x₀′‖ exp|∫_{t₀}^{t} L|` at every `t ∈ I`. Prove the local form. Let `B` be the
closed ball of radius `r` about `x₀`, suppose the two bounds hold only for `x, y ∈ B` and almost every
`t ∈ [t₀, t₀ + δ] ⊆ I`, and let `τ ≤ δ` satisfy `(∫_{t₀}^{t₀+τ} m) exp(∫_{t₀}^{t₀+τ} L) ≤ r`. Call a
solution on `[t₀, t₀ + τ]` a `Y` continuous there with `s ↦ F(s, Y(s))` integrable on `[t₀, t₀ + τ]` and
the integral equation for `t ∈ [t₀, t₀ + τ]`. Then there is a solution on `[t₀, t₀ + τ]` with values in
`B`, and any two solutions with values in `B` agree on `[t₀, t₀ + τ]`. If the inequality is strict,
every solution on `[t₀, t₀ + τ]` has values in `B`, so any two solutions agree there: a solution leaving
`B` meets the sphere `‖x − x₀‖ = r` at a first time `t*`, and 1.1 on `[t₀, t*]` bounds `‖Y(t*) − x₀‖`
by `(∫_{t₀}^{t₀+τ} m) exp(∫_{t₀}^{t₀+τ} L) < r`. The composite `s ↦ F(s, Y(s))` is almost everywhere
strongly measurable for every continuous `Y`, and in the local form for every continuous `Y` with values
in `B`: after `F(t, ·)` is replaced by `0` for the `t` of a null set outside which the Lipschitz bound
holds, every `F(t, ·)` is continuous on `E` (on `B` in the local form) and every section `t ↦ F(t, x)` is
unchanged almost everywhere, so Tau Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`
applies with the parameter space `E` (the ball `B`) (coddingtonlevinson1955, Ch. 2 §1, waived).

*Needs:* §1.1, §1.2's Picard scheme; Tau Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`.

**Checks.**

- Agreement with Mathlib: a field satisfying `IsPicardLindelof` with constant Lipschitz bound gives the
  same solution, by `ODE_solution_unique_of_mem_Ioo`.
- The linear field `F(t, x) = P(t)x + G(t)` satisfies the hypotheses with `L = ‖P‖`,
  `m = ‖P‖‖x₀‖ + ‖G‖`, and the solution is that of 1.2.
- Lipschitz bound needed: `F(t, x) = 2√|x|` on `ℝ` from `x₀ = 0` has the two solutions `0` and `t²`.
- Global Lipschitz bound needed for the global statement: `F(t, x) = x²`, `x₀ = 1` gives `1/(1 − t)`,
  which leaves every ball before `t = 1`. On the ball of radius `r = 1` the local bounds are
  `L = 2(1 + r) = 4` and `m = 1`, and `τ = 0.1` satisfies `τ e^{4τ} ≈ 0.149 ≤ 1`; the local form
  gives the solution on `[0, 0.1]`, where indeed `1/(1 − t) ≤ 1.12` stays in the ball.
- The local uniqueness clause needs the ball or the strict inequality: `E = ℝ`, `I = [0, 2]`, `t₀ = 0`,
  `x₀ = 0`, `r = 1`, `δ = τ = 2`, `F(t, x) = 1` for `t < 1` and `F(t, x) = 2√(max(x − 1, 0))` for
  `t ≥ 1`. On `B = [−1, 1]` the bounds hold with `L = 0` and `m = 1_{[0, 1)}`, and
  `(∫₀² m) e⁰ = 1 = r`. Both `min(t, 1)` and the function equal to `t` on `[0, 1]` and to `1 + (t − 1)²`
  on `[1, 2]` solve the equation on `[0, 2]`; the second leaves `B` after `t = 1`. For `τ < 1` the
  inequality is strict and `Y(t) = t` is the only solution on `[0, τ]`.

### Examples

- The scalar equation `y′ = p(t) y` with `p ∈ L¹_loc` has propagator `exp(∫_s^t p)`.
- The Dirac fundamental matrix of §3.1 is the propagator on `EuclideanSpace ℂ (Fin 2)` of an entire,
  trace-free coefficient with `m_K(t) = sup_K |z| + |q(t)|` in the Euclidean operator norm.
- The scattering matrix of §4.1 is the propagator of an entire coefficient with
  `m_K(t) = |q(t)| e^{2t sup_K |Im z|}`.

### Dependencies

Mathlib (Bochner integration, absolutely continuous functions, Lebesgue differentiation, the contraction
mapping principle, parametric integrals, locally uniform limits of holomorphic functions, determinants and
traces of matrices, the chain rule along a curve, the coordinate equivalence of `EuclideanSpace`); Tau Ceti's
absolute continuity of vector-valued indefinite integrals
(`MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean`) for §1.2, Tau Ceti
Jacobi's formula (`Analysis/Calculus/FDeriv/Det.lean`) for §1.4, Tau Ceti's measurability of Carathéodory
compositions (`MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean`) for §1.7, and Tau Ceti
`Analysis/ODE` and `Matrix.det_exp` for the compatibility Checks; OperatorTheory/UnboundedOperators §4.8 for
the fixed-parameter Check of §1.2.

## Layer 2: Function theory of the upper half-plane

### 2.1 Poisson-finite measures, Poisson and Schwarz integrals

Define the Poisson kernel `P(z, x)` for `z ∈ ℂ₊`, `x ∈ ℝ` as Tau Ceti's `TauCeti.halfSpacePoissonKernel 2 v`
with unit inward normal `v = (0, 1)`, pole `z` and boundary point `x`, read through Mathlib's
`Complex.orthonormalBasisOneI`; since `⟨v, z⟩ = Im z` and `2ω₂ = 2π` (Mathlib `EuclideanSpace.volume_ball_fin_two`),
it is `P(z, x) = Im z/(π|x − z|²)`, the notation used below. Define the Poisson measure
`Π = dx/(1 + x²)`; a positive Borel measure `ν` on `ℝ` is Poisson-finite when
`∫ dν/(1 + x²) < ∞`. Define the Poisson integral `P[ν](z) = ∫ P(z, x) dν(x)`, and for a complex
`h ∈ L¹(Π)` write `P[h] = P[h dx]` (componentwise). For a Poisson-finite `ν` (or a real `h ∈ L¹(Π)`)
define the Schwarz integral `S[ν](z) = (1/(πi)) ∫ (1/(x − z) − x/(1 + x²)) dν(x)`, and for
`h ∈ L¹(ℝ)` the integral normalised at infinity `S⁰[h](z) = (1/(πi)) ∫ h(x)/(x − z) dx`
(poltoratski2024 line 250–254 and 610–614; mauth2022 line 378–392).

- `∫ P(z, x) dx = 1` (Tau Ceti `TauCeti.integral_halfSpacePoissonKernel`; the hyperplane carries the
  Lebesgue measure of `ℝ` by Mathlib `LinearIsometryEquiv.measurePreserving`), and `P(z, x) ≤ C(z)/(1 + x²)`
  with `C(z) = 2(1 + (Re z)²) max(Im z, 1/Im z)/π`, so `P[ν]` is finite on `ℂ₊` for Poisson-finite `ν`.
- `P[ν]` is harmonic on `ℂ₊` (mauth2022 Lemma 3 line 390–392), nonnegative, and `P[ν] = Re S[ν]`;
  `S[ν]` is holomorphic on `ℂ₊` and real at `z = i`; `S⁰[h] − S[h]` is the imaginary constant
  `−(i/π) ∫ x h(x)/(1 + x²) dx`. Route: on a compact subset of `ℂ₊` the `z`-derivative `(x − z)^{−2}` of
  the Schwarz integrand is bounded by a constant times `1/(1 + x²)`, so `S[ν]` is holomorphic (Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le`),
  hence analytic (Mathlib `DifferentiableOn.analyticAt`). Its real part `P[ν]` is then harmonic (Mathlib
  `AnalyticAt.harmonicAt_re`). It is nonnegative because the kernel is positive (Tau Ceti
  `TauCeti.halfSpacePoissonKernel_pos`).
- `P(i, x) = 1/(π(1 + x²))`, so `h ∈ L¹(Π)` exactly when `P[|h|](i) < ∞`.
- Cayley comparison: with `w = (z − i)/(z + i)` and `ζ = (x − i)/(x + i)`,
  `P(z, x) = poissonKernel 0 w ζ · 1/(π(1 + x²))`, where Mathlib's disc Poisson kernel is
  `poissonKernel 0 w ζ = (1 − |w|²)/|ζ − w|²` for `|ζ| = 1`. So `P[ν](z) = ∫ poissonKernel 0 w ζ dσ(ζ)` is the
  disc Poisson integral at `w` of the image `σ` of `dν/(π(1 + x²))` under Tau Ceti `TauCeti.boundaryCayley`.
- Translation and dilation covariance: for the translate `ν_u` of `ν` by `u ∈ ℝ`,
  `P[ν_u](z) = P[ν](z − u)`; for `λ > 0` and the image `ν^λ` of `ν` under `x ↦ x/λ`,
  `P[ν^λ](z) = λ P[ν](λz)`.

*Needs:* Mathlib Bochner integrals, `InnerProductSpace.HarmonicOnNhd`, `Complex.orthonormalBasisOneI`,
`EuclideanSpace.volume_ball_fin_two`, `LinearIsometryEquiv.measurePreserving`,
`hasFDerivAt_integral_of_dominated_of_fderiv_le`, `DifferentiableOn.analyticAt`, `AnalyticAt.harmonicAt_re`,
`poissonKernel`; Tau Ceti `TauCeti.halfSpacePoissonKernel`, `TauCeti.halfSpacePoissonKernel_pos`,
`TauCeti.integral_halfSpacePoissonKernel`, `TauCeti.boundaryCayley`.

**Checks.**

- Identification with the pinned kernel: at `z = 1 + i` and `x = 3`, Tau Ceti's kernel at `n = 2`,
  `v = (0, 1)`, with pole `z` is `2 · 1/(2π · 5) = 1/(5π)`, which is `Im z/(π|x − z|²)`. With the two
  arguments exchanged (pole `x`) it is `0`, because `⟨v, x⟩ = 0` for real `x`.
- Lebesgue measure: `P[dx] ≡ 1`; a kernel without the factor `1/π` would give `π`.
- `ν = δ₀`: `P[δ₀](z) = Im z/(π|z|²) = Im(−1/(πz))`, with value `1/π` at `z = i`. It is harmonic on `ℂ₊`, as
  Tau Ceti's `TauCeti.harmonicOnNhd_halfSpacePoissonKernel_left` states for the kernel in its pole.
- `h = 1/(1 + x²)`: `P[h](z) = Re(i/(z + i))` and `S[h](z) = i/(z + i)`; at `z = 2i`, the direct integral
  `(2/π)∫ dx/((x² + 4)(x² + 1)) = 1/3 = i/(3i)`. This `h` is real, bounded and continuous, so `P[h]` is
  also Tau Ceti's `TauCeti.halfSpacePoissonIntegral` at `n = 2`, harmonic by
  `TauCeti.harmonicOnNhd_halfSpacePoissonIntegral`.
- Cayley comparison at `z = 2i`, `x = 1`: `w = 1/3`, `ζ = −i`, `poissonKernel 0 (1/3) (−i) = (8/9)/(10/9) = 4/5`
  and `(4/5)/(2π) = 2/(5π) = P(2i, 1)`. For `h(x) = (x² − 1)/(x² + 1) = Re ζ`, Mathlib's Poisson formula
  on the unit disc (`InnerProductSpace.HarmonicOnNhd.circleAverage_poissonKernel_smul` for the harmonic
  function `Re`) gives `P[h](z) = Re w`. At `z = 2i` the direct integral is
  `(2/π)∫ (x² − 1)/((x² + 1)(x² + 4)) dx = 1/3 = Re(1/3)`. A kernel that also carried the circle-average
  factor `1/(2π)` would give `1/(6π)`.
- `ν = |x| dx` is not Poisson-finite (`∫ |x|/(1 + x²) = ∞`) and `P[ν] ≡ ∞`.

### 2.2 Positive harmonic functions on the half-plane

Prove that a nonnegative harmonic `u` on `ℂ₊` is `u(z) = c Im z + P[ν](z)` for a unique `c ≥ 0` and a
unique Poisson-finite `ν`, that `πy u(iy) − πc y² = ∫ y²/(x² + y²) dν(x)` increases to `ν(ℝ)` as `y → ∞`,
that `c = lim u(iy)/y` as `y → ∞`, and that `ν` is the vague limit of the measures `u(x + iy) dx` as
`y → 0` (garnett2007, Ch. I §3, uncertified). This is the harmonic form of the Herglotz representation of
AutomorphicSpectralTheory §0.5: if `F` is holomorphic on `ℂ₊` with `Im F = u` and `(a, b, ν_F)` is its
triple there, then `c = b` and `ν = πν_F`, because `Im (x − z)⁻¹ = π P(z, x)`. Route: the function
`i(∂ₓu − i∂ᵧu)`, `i` times the complex partial of `u`, is holomorphic on `ℂ₊` by Mathlib's
`HarmonicAt.differentiableAt_complex_partial`; it has a primitive by Tau Ceti
`DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane`, whose imaginary part has the gradient of `u`,
so after subtracting an imaginary constant the primitive is an `F` with `Im F = u` and
`F′ = i(∂ₓu − i∂ᵧu)`, and §0.5 applies to it. Uniqueness: for each representation,
`cz + (1/π)∫ ((x − z)⁻¹ − x/(1 + x²)) dν(x)` is holomorphic with imaginary part `u` and real part `0` at
`i`; two holomorphic functions on `ℂ₊` with the same imaginary part differ by a real constant, so the two
functions coincide and the uniqueness of the triple in §0.5 gives that of `(c, ν)`. Mass: `πy P[ν](iy)`
is `∫ y²/(x² + y²) dν(x)`, which increases to `ν(ℝ)` by monotone convergence, and `P[ν](iy)/y → 0`. Vague
limit: for `φ` continuous with compact support, `∫ φ(x) P[ν](x + iy) dx = ∫ (∫ P(x + iy, t) φ(x) dx) dν(t)`
by Tonelli, the inner integral tends to `φ(t)` with a bound `C_φ/(1 + t²)` for `y ≤ 1`, and the term
`cy ∫ φ` tends to `0`.

*Needs:* §2.1; AutomorphicSpectralTheory §0.5; Mathlib `HarmonicAt.differentiableAt_complex_partial`;
Tau Ceti `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane`.

**Checks.**

- `u = Im z`: `c = 1`, `ν = 0`. The complex partial of `u` is `∂ₓu − i∂ᵧu = −i`, and `F′ = i · (−i) = 1` is
  the derivative of `F = z`; the conjugate partial `∂ₓu + i∂ᵧu = i` is not `F′`.
- `u = P[δ₀]`: `c = 0`, `ν = δ₀`, and `πy u(iy) = 1 = ν(ℝ)` for every `y`. Here `F = −1/(πz)` has the triple
  `(0, 0, δ₀/π)` of AutomorphicSpectralTheory §0.5, and `ν = π · δ₀/π = δ₀`; reading `ν = ν_F` would give
  mass `1/π`, while `πy u(iy) = 1`. The derivative `F′ = 1/(πz²)` equals `i(∂ₓu − i∂ᵧu)` with
  `∂ₓu − i∂ᵧu = −i/(πz²)`.
- `u ≡ 1 = P[dx]`: `ν(ℝ) = ∞` and `πy u(iy) = πy → ∞`.
- `u = Re z` is harmonic but takes the value `−1` at `−1 + i`; positivity is a hypothesis.

### 2.3 Nontangential approach and maximal bounds

For `x ∈ ℝ` and `0 < h ≤ ∞` define the cone `Γ_h(x) = {z ∈ ℂ₊ : |Re z − x| < Im z < h}` and, for
`u : ℂ₊ → ℂ`, the nontangential maximal function `M_h u(x) = sup_{z ∈ Γ_h(x)} |u(z)|` with values in
`[0, ∞]`. A function has nontangential limit `L` at `x` when it tends to `L` along the filter of
`Γ_∞(x)` at `x` (poltoratski2024 line 615–622; mauth2022 line 411–420; garnett2007, Ch. I §§4–5,
pp. 27, 55–56, uncertified). Its API:

- Cone comparison: for `x′ + iy ∈ Γ_∞(x)` and every `s ∈ ℝ`, `P(x′ + iy, s) ≤ 3 P(x + iy, s)`; hence for
  `g` locally integrable with `P[|g|]` finite, `M_∞ P[g](x) ≤ 3 · TauCeti.maximalFunction volume g x`.
  The kernel inequality is Tau Ceti's `TauCeti.halfSpacePoissonKernel_le_mul` at `n = 2` with the poles
  `x′ + iy` and `x + iy` of equal height and `A = √3`, so that `Aⁿ = 3`.
- Aperture independence: cones `|Re z − x| < α Im z`, `α > 0`, give the same nontangential limits, by
  the same comparison with `A² = max(2, 1 + 2α²)`, which is `3` for `α = 1`.
- Localisation: for `h ∈ L¹(Π)` and `R > 0` there is `C_R`, depending only on `R`, with
  `M_1 P[h](x) ≤ 3 · TauCeti.maximalFunction volume (h · 1_{[−R−2, R+2]}) x + C_R ‖h‖_{L¹(Π)}` for `|x| ≤ R`.
- Weak type: for `R > 0` there is `C′_R`, depending only on `R`, with
  `|{x ∈ [−R, R] : M_1 P[h](x) > λ}| ≤ C′_R ‖h‖_{L¹(Π)}/λ` for `h ∈ L¹(Π)` and `λ > 0`, and
  `|{x ∈ [−R, R] : M_1 P[ν](x) > λ}| ≤ 2C′_R (∫ dν/(1 + x²))/λ` for every Poisson-finite `ν`; so `√(M_1 P[ν])` is
  integrable on every bounded interval (mauth2022 Lemma 5 and Corollary 1, line 421–427, for Poisson-finite
  measures).
- Strong type: for `1 < p < ∞` and `g ∈ L^p(ℝ)`, `‖M_∞ P[g]‖_{L^p} ≤ C_p ‖g‖_{L^p}`, with `C_p = 3K_p^{1/p}` for the
  constant `K_p` of Tau Ceti's strong type bound on `ℝ`, `∫ (M g)^p ≤ K_p ∫ |g|^p` (mauth2022 Lemma 6 line
  430–432 states it for `M_∞ F` with `F ∈ H^p(ℂ₊)`, which is this bound for `g = F*` by §2.6).
- Route: `|s − x| ≤ |s − x′| + y` gives `(s − x)² + y² ≤ 3((s − x′)² + y²)`, which is the distance
  hypothesis `|s − (x + iy)| ≤ √3 |s − (x′ + iy)|` of the pinned comparison. `P(x + iy, ·)` is radially
  decreasing about `x` with integral `1` (§2.1), so its integral against `|g|` is at most the maximal
  function by the layer-cake formula; then Tau Ceti's weak and strong type bounds, and for `g ∈ L^p(ℝ)` the
  integral `P[|g|]` is finite because `P(z, ·) ∈ L^{p′}`. The weak type for a density follows from the
  localisation bullet and Tau Ceti's weak type `(1,1)` bound applied to `h · 1_{[−R−2, R+2]}`, whose `L¹` norm is at
  most `(1 + (R + 2)²)‖h‖_{L¹(Π)}`. For a measure `ν`, let `0 < ε ≤ 1` and
  `h_ε(x) = P[ν](x + iε)`. The function `z ↦ P[ν](z + iε)` is nonnegative and harmonic on `ℂ₊` and continuous
  up to `ℝ`, so by §2.2 its measure is `h_ε dx` (the vague limit of its horizontal slices) and its linear
  coefficient is `lim P[ν](i(y + ε))/y = 0`: `P[h_ε](z) = P[ν](z + iε)`. Then
  `‖h_ε‖_{L¹(Π)} = πP[ν](i(1 + ε)) = ∫ (1 + ε)/(x² + (1 + ε)²) dν ≤ 2∫ dν/(1 + x²)`. The cones are open, so
  if `P[ν](z) > λ` at some `z ∈ Γ_1(x)`, then `z − iε ∈ Γ_1(x)` and `P[h_ε](z − iε) > λ` for all small `ε`; hence
  `{M_1 P[ν] > λ}` lies in the lower limit of the sets `{M_1 P[h_{1/n}] > λ}`, whose measure in `[−R, R]` is at
  most the lower limit of theirs.

*Needs:* §2.1, §2.2; Tau Ceti `TauCeti.halfSpacePoissonKernel_le_mul`, `TauCeti.maximalFunction`,
`TauCeti.mul_measure_lt_maximalFunction_le`, `TauCeti.lintegral_rpow_maximalFunction_le`.

**Checks.**

- `h = 1_{[0,1]}` and `x = 2`: `P[h](2 + i) = (arctan 2 − π/4)/π ≈ 0.102`, while the maximal function of
  `h` at `2` is `1/4` (attained at radius `2`), and `0.102 ≤ 3 · 1/4`.
- The constant `3`: at `x = 0`, `z = 0.99 + i ∈ Γ_∞(0)` and `s = 1`, `P(0.99 + i, 1) = 1/(1.0001π)` and
  `3P(i, 1) = 3/(2π)`, so the inequality holds; at `s = 2` the ratio is
  `P(0.99 + i, 2)/P(i, 2) = 5/2.0201 ≈ 2.475`. Over the open cone the ratio `P(x′ + iy, s)/P(iy, s)` has
  supremum `(s² + y²)/((s − y)² + y²)` for `s ≥ y`, largest at `s = y(1 + √5)/2` with value
  `((1 + √5)/2)² ≈ 2.618`, not attained; so no constant below `2.618` works, and `3` is not sharp. The
  point `1 + i` lies on the boundary of `Γ_∞(0)`, not in it.
- `h = 0`: both maximal functions vanish; `h ≡ 1` (in `L¹(Π)`, not in `L¹`): `P[h] ≡ 1` and `M_1 P[h] ≡ 1`.
- The global maximal function of `h ∈ L¹(Π)` can be infinite (for `h ≡ 1` the averages over
  `B(x, r)` stay `1`, but for `h(x) = |x|^{1/2}` they grow like `√r`), which is why the bound is
  localised to `[−R − 2, R + 2]` with a tail term.
- A measure without density, `ν = δ₀` (`∫ dν/(1 + x²) = 1`): for `0 < |x| < √2` the supremum of
  `P[δ₀](x′ + iy) = y/(π(x′² + y²))` over `Γ_1(x)` is approached at `|x′| = |x| − y`, `y = |x|/√2`, so
  `M_1 P[δ₀](x) = (1 + √2)/(2π|x|) ≈ 0.384/|x|`, above the value `1/(π|x|)` reached along `x′ = 0`. It is weak
  `L¹` near `0` (`|{|x| ≤ 1 : 0.384/|x| > λ}| = 0.768/λ` for `λ ≥ 0.384`), not integrable, and its square root is
  integrable; the weak-type bound for densities alone does not reach it.
- `p > 1` is needed in the strong type: for `g = 1_{[0,1]}`, `M_∞ P[g](x) ≥ P[g](x + i|x|)`, which is
  `≈ 1/(2π|x|)` for large `|x|` (`0.00160` against `1/(200π) ≈ 0.00159` at `x = 100`); this lies in `L^p` near infinity
  for every `p > 1` but not in `L¹`, although `‖g‖_{L¹} = 1`.

### 2.4 Fatou's theorem for Poisson integrals

Let `ν` be Poisson-finite with Lebesgue decomposition `ν = w dx + ν_s`. Prove that for almost every
`x ∈ ℝ`, `P[ν](z) → w(x)` as `z → x` nontangentially; in particular `P[ν_s] → 0` nontangentially
almost everywhere, and `P[h] → h(x)` nontangentially at almost every `x` for complex `h ∈ L¹(Π)`
(mauth2022 Lemmas 4 and 7, line 404–436; garnett2007, Ch. I §§3–5, pp. 16, 30, uncertified). Route:
at a Lebesgue point of `w` where `ν_s(B(x, r))/2r → 0` (Mathlib
`VitaliFamily.ae_tendsto_lintegral_enorm_sub_div` and `VitaliFamily.ae_tendsto_rnDeriv`), split
`ν − w(x)dx` near and far from `x` and use the cone domination of §2.3.

*Needs:* §2.1, §2.3; Mathlib `VitaliFamily.ae_tendsto_lintegral_enorm_sub_div`,
`VitaliFamily.ae_tendsto_rnDeriv`, `MeasureTheory.Measure.rnDeriv`, `MeasureTheory.Measure.singularPart`.

**Checks.**

- `ν = δ₀`: the limit is `0` at every `x ≠ 0`, and `w = 0`.
- `h = 1_{[0,1]}`: the limit is `1` on `(0, 1)` and `0` off `[0, 1]`; at the jump `x = 0` there is no
  nontangential limit, since `P[h](iy) → 1/2` while `P[h](−y/2 + iy) → 1/2 − arctan(1/2)/π ≈ 0.352`.
- Continuous bounded `h`: the limit exists at every point and equals `h(x)`, even without restriction
  on the approach; this is Tau Ceti's `TauCeti.tendsto_halfSpacePoissonIntegral` at `n = 2`, applied to
  `Re h` and `Im h`.

### 2.5 Bounded holomorphic functions on the half-plane

For `F` holomorphic and bounded on `ℂ₊` define its boundary function `F* ∈ L^∞(ℝ)` as the
nontangential limit of `F`, which exists almost everywhere (garnett2007, Ch. II §§1–4, pp. 55, 64,
uncertified). Its API:

- `‖F*‖_∞ ≤ sup_{ℂ₊} |F|` and `F = P[F*]` on `ℂ₊`; `F ↦ F*` is linear and multiplicative.
- If `F` extends continuously to the closed half-plane then `F* = F` on `ℝ`.
- Uniqueness: if `F*` vanishes on a set of positive measure then `F ≡ 0`.
- If `F ≢ 0` then `log|F*| ∈ L¹(Π)` and `log|F(z)| ≤ P[log|F*|](z)` on `ℂ₊`.
- Route: the bounded functions `F(· + iε)` are continuous up to `ℝ`. The Poisson integral of their
  restriction to `ℝ` is harmonic and tends to `F(x + iε)` at every `x ∈ ℝ` (Tau Ceti
  `TauCeti.harmonicOnNhd_halfSpacePoissonIntegral` and `TauCeti.tendsto_halfSpacePoissonIntegral`, for the
  real and imaginary parts). So `F(· + iε) − P[F(· + iε)|_ℝ]`, reflected oddly across `ℝ`, is continuous,
  has the mean-value property (Tau Ceti `TauCeti.harmonicOnNhd_of_setAverage_ball_eq`) and is bounded,
  hence constant by `InnerProductSpace.bounded_harmonic_on_complex_plane_is_constant`, hence `0`. A weak-* limit point of
  `F(· + iε)` in `L^∞(Π) = L¹(Π)^*` gives the Poisson representation, because `x ↦ (1 + x²)P(z, x)` is
  bounded and so lies in `L¹(Π)`; as a space of classes `L^∞(Π)` is `L^∞(ℝ)`, since `Π` and Lebesgue
  measure have the same null sets. §2.4 then gives the nontangential limits.
  Uniqueness and the logarithmic bound transport Tau Ceti `TauCeti.eqOn_const_ball_of_tendsto_circleMap`
  and `AnalyticOnNhd.le_circleAverage_log_norm` through the Cayley transform, under which a disc radius
  ending at `ζ ≠ 1` becomes an arc ending at `x` inside every cone at `x`. Jensen's bound is stated at
  the centre of the disc, for a function analytic on a neighbourhood of the closed disc. The transported
  function `g`, holomorphic on the open unit disc and bounded by `S = sup|F|`, is analytic on the closed
  disc of every radius `r < 1`, where the bound reads `k log r + log|τ| ≤` the circle average of `log|g|`
  at radius `r`, with `k` the order of `g` at `0` and `τ ≠ 0` its trailing coefficient (`F ≢ 0`). Along
  radii `rₙ → 1`, `g(rₙζ) → g*(ζ)` for almost every `ζ` (§2.4 through the Cayley comparison of §2.1), and
  the functions `log⁺ S − log|g(rₙζ)|` are nonnegative. Fatou's lemma for them (Mathlib
  `MeasureTheory.lintegral_liminf_le`), with `k log rₙ → 0`, gives `log|τ| ≤ ∫ log|g*| dθ/(2π)`. Since
  `log|g*| ≤ log⁺ S`, it is integrable on the circle, which is `log|F*| ∈ L¹(Π)`; when `F(i) ≠ 0` (so `k = 0`
  and `τ = F(i)`) the inequality is the logarithmic bound at `z = i`, because the Cayley transform carries
  `P(i, x) dx` to `dθ/(2π)`: this is §2.1's Cayley comparison at `w = 0`, where `poissonKernel 0 0 ζ = 1`.
  §2.1's translation and dilation covariance, applied to `F(Re z + (Im z) ·)`, then give the bound at every
  `z ∈ ℂ₊`.

*Needs:* §2.1, §2.4; Mathlib `InnerProductSpace.bounded_harmonic_on_complex_plane_is_constant`,
`WeakDual.isCompact_closedBall`, `poissonKernel`, `MeasureTheory.lintegral_liminf_le`; Tau Ceti
`MeasureTheory.Lp.dualOneEquiv`, `TauCeti.harmonicOnNhd_halfSpacePoissonIntegral`,
`TauCeti.tendsto_halfSpacePoissonIntegral`, `TauCeti.harmonicOnNhd_of_setAverage_ball_eq`,
`TauCeti.eqOn_const_ball_of_tendsto_circleMap`, `AnalyticOnNhd.le_circleAverage_log_norm`,
`TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet`.

**Checks.**

- `F(z) = e^{iz}`: `F* = e^{ix}`, `|F(x + iy)| = e^{−y}`, and `P[F*] = F`.
- `F(z) = e^{−i/z}` is bounded by `1` (`|F| = e^{−Im z/|z|²}`), not continuous at `0`, and
  `F* = e^{−i/x}` still has `P[F*] = F`. Its Cayley transform `g(w) = exp(−(1 − w)/(1 + w))` has an essential
  singularity at `w = −1`, so Jensen's bound applies only on circles of radius `r < 1`; there
  `log|g(re^{iθ})| ≤ 0`, and the logarithmic bound at `i` is strict, `log|F(i)| = −1 < 0 = P[log|F*|](i)`, as
  it must be for a function that is not outer (§2.8).
- `F` constant `c`: `F* = c`; `F = (z − i)/(z + i)`: `|F*| = 1`, `log|F*| = 0`, and
  `log|F(i)| = −∞ ≤ 0`.

### 2.6 Hardy spaces of the half-plane

For `1 < p < ∞` define `H^p(ℂ₊)` as the holomorphic `F` on `ℂ₊` with
`‖F‖_p^p = sup_{y>0} ∫ |F(x + iy)|^p dx < ∞`, and write `H²(ℂ₊)` for `p = 2`, with `‖F‖ = ‖F‖_2`
(mauth2022 line 337–358). Its API:

- Boundary values: for `F ∈ H^p(ℂ₊)`, `F(· + iy) → F*` in `L^p(ℝ)` as `y → 0`, `‖F*‖_{L^p} = ‖F‖_p`,
  `y ↦ ‖F(· + iy)‖_{L^p}` is nonincreasing, `F → F*` nontangentially almost everywhere, and `F = P[F*]`
  (mauth2022 Lemma 1 line 359–369; garnett2007, Ch. II p. 55, uncertified).
- Point bound: `|F(z)|^p ≤ 2‖F‖_p^p/(π Im z)` for `F ∈ H^p(ℂ₊)` and `z ∈ ℂ₊` (mauth2022 Lemma 2 line
  370–377). Route: for `0 < ρ < Im z`, `F(z)` is the circle average of `F` on the circle of radius `ρ` about `z`
  (Mathlib `DiffContOnCl.circleAverage`), so Jensen's inequality for the convex function `|·|^p` gives
  `|F(z)|^p ≤` the circle average of `|F|^p` there. Averaging over `ρ ∈ (0, r)` against `2ρ dρ/r²` (Mathlib
  `Complex.lintegral_comp_polarCoord_symm`) bounds `|F(z)|^p` by the mean of `|F|^p` over the disc of radius
  `r < Im z` about `z`. That disc lies in the strip `|Im ζ − Im z| < r`, on which `∫ |F|^p ≤ 2r‖F‖_p^p`, so
  `|F(z)|^p ≤ 2‖F‖_p^p/(πr)`; let `r → Im z`.
- Maximal bound: `‖M_∞ F‖_{L^p} ≤ C_p ‖F‖_p` for `F ∈ H^p(ℂ₊)`, with the constant `C_p` of §2.3, since
  `M_∞ F = M_∞ P[F*]` (mauth2022 Lemma 6 line 430–432).
- Paley–Wiener: the boundary map is an isometry of `H²(ℂ₊)` onto
  `{g ∈ L²(ℝ) : 𝓕g = 0 almost everywhere on (−∞, 0)}` (Mathlib's `𝓕`), and
  `F(z) = ∫₀^∞ φ(s) e^{isz} ds` with `φ ∈ L²(0, ∞)`, `‖F‖² = 2π‖φ‖²` (mauth2022 Lemma 9 line 469–471,
  which states the inclusion of that space in the boundary values;
  garnett2007 p. 84, uncertified); in particular `H²(ℂ₊)` is a Hilbert space.
- Cauchy formula: for `F ∈ H²(ℂ₊)`, `F(z) = (1/(2πi)) ∫ F*(x)/(x − z) dx` and `∫ F*(x)/(x − conj z) dx = 0`
  for `z ∈ ℂ₊`; hence `|F(z)|² ≤ ‖F‖²/(4π Im z)`, sharper at `p = 2` than the point bound, whose constant
  is `2/π`.
- Products: `∫ F*(x) G*(x) dx = 0` for `F, G ∈ H²(ℂ₊)`; bounded multipliers: `GF ∈ H²(ℂ₊)` with
  `‖GF‖ ≤ sup|G| ‖F‖` for bounded holomorphic `G`.
- Logarithmic bound: if `F ∈ H²(ℂ₊)` and `F ≢ 0`, then `log|F*| ∈ L¹(Π)`, so `F* ≠ 0` almost everywhere,
  and `log|F(z)| ≤ P[log|F*|](z)` for every `z ∈ ℂ₊` (garnett2007, Ch. II §4, uncertified). Route: for
  `ε > 0` the translate `F(· + iε)` is holomorphic near the closed half-plane and bounded there by
  `‖F‖/√(4πε)` (the bound of the Cauchy formula above). So §2.5 gives the bound for it, with boundary function
  `F(· + iε)` on `ℝ`. As `ε → 0`, `log⁺|F(· + iε)| → log⁺|F*|` in `L¹(P(z, x) dx)`. This is because
  `|log⁺a − log⁺b| ≤ |a − b|` for `a, b ≥ 0`, `F(· + iε) → F*` in `L²(ℝ)`, and `∫ P(z, x)² dx = 1/(2π Im z)`.
  Take a sequence `εₙ → 0` along which `F(· + iεₙ) → F*` almost everywhere. Fatou's lemma for
  `log⁻|F(· + iεₙ)|` then gives the bound in the limit at every `z` with `F(z) ≠ 0`. At one such `z` it
  also gives the integrability of `log⁻|F*|`, while `log⁺|F*| ≤ |F*|²` is integrable.
- Weak convergence `Fₙ ⇀ F` in `H²(ℂ₊)` implies locally uniform convergence on `ℂ₊`
  (mauth2022 Lemma 11 line 487).
- `H²(ℂ₋)` is defined by reflection, and its boundary values are the complex conjugates of those of
  `H²(ℂ₊)`, orthogonal to them in `L²(ℝ)`.

*Needs:* §2.1–§2.5; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`, `Real.fourier_real_eq`,
`MeasureTheory.lintegral_liminf_le`, `MeasureTheory.tendstoInMeasure_of_tendsto_eLpNorm`,
`MeasureTheory.TendstoInMeasure.exists_seq_tendsto_ae`, `DiffContOnCl.circleAverage`, `ConvexOn.map_integral_le`,
`Complex.lintegral_comp_polarCoord_symm`.

**Checks.**

- `F(z) = 1/(z + i)`: `F(z) = −i∫₀^∞ e^{−s} e^{isz} ds`, `‖F‖² = π`, and the point bound at `z = i` is
  attained: `|F(i)|² = 1/4 = π/(4π)`.
- `∫ dx/(x + i)² = 0`: the product of `1/(z + i)` with itself, as the product law requires.
- Logarithmic bound, equality and strict cases: for `F = 1/(z + i)`, `log|F*| = −log|x + i|` and
  `P[log|F*|](z) = −log|z + i| = log|F(z)|` (the outer case of §2.8; at `z = i` both sides are
  `−log 2 ≈ −0.693`). For `F = e^{iz}/(z + i)` the boundary modulus is the same, but `log|F(z)|` is smaller
  by `Im z`: at `z = i` it is `−1 − log 2 ≈ −1.693 < −0.693`. For `F ≡ 0` the boundary function `log|F*|` is
  identically `−∞`, so `F ≢ 0` is needed.
- `F ≡ 1` is not in `H²(ℂ₊)` (the integrals are infinite), and `1/(z − i)` is not holomorphic on `ℂ₊`.
- `p ≠ 2`: `F(z) = (z + i)^{−1/2}` (principal branch, holomorphic on `ℂ₊` since `Im(z + i) > 1`) lies in `H³(ℂ₊)`
  and not in `H²(ℂ₊)`. Substituting `x = (1 + y)u`, `∫ |F(x + iy)|³ dx = (1 + y)^{−1/2} ∫ (1 + u²)^{−3/4} du`, so
  `‖F‖_3³ = √π Γ(1/4)/Γ(3/4) ≈ 5.244`, while `∫ (1 + u²)^{−1/2} du = ∞`. The point bound at `z = i` reads
  `|F(i)|³ = 2^{−3/2} ≈ 0.354 ≤ 2 · 5.244/π ≈ 3.338`; at `p = 2` and `F = 1/(z + i)` it gives `|F(i)|² ≤ 2`, against
  the attained Cauchy-formula value `1/4`.
- Mathlib-convention witness: for `g(x) = 1/(x + i)`, closing the contour in the lower half-plane
  gives `𝓕g(w) = −2πi e^{−2πw}` for `w > 0`, and `𝓕g(w) = 0` for `w < 0`; the vanishing condition is
  on the negative frequencies, and a statement with `(0, ∞)` describes `H²(ℂ₋)`.

### 2.7 Paley–Wiener spaces

For `t ≥ 0` define `PW_t` as the set of `F : ℂ → ℂ` with `F(z) = ∫_{−t}^{t} φ(s) e^{isz} ds` for some
`φ ∈ L²(−t, t)` (poltoratski2024 line 236–244; mauth2022 Lemma 10 line 472–484). The function of a given
density `φ` is `paleyWienerFunction` in `Suggested.lean`. Its API:

- `F` is entire, `|F(z)| ≤ √(2t) ‖φ‖ e^{t|Im z|}`, `‖F‖²_{L²(ℝ)} = 2π‖φ‖²`, `PW_t` is a closed subspace
  of `L²(ℝ)`, `PW_s ⊆ PW_t` for `s ≤ t`, and `F ∈ PW_t` implies `F# ∈ PW_t`.
- `e^{itz}F ∈ H²(ℂ₊)` and `e^{−itz}F ∈ H²(ℂ₋)`; conversely an entire `H` with `e^{itz}H ∈ H²(ℂ₊)` and
  `e^{−itz}H ∈ H²(ℂ₋)` belongs to `PW_t` (mauth2022 Lemma 10).
- Paley–Wiener theorem: an entire `F` of exponential type at most `t` (`|F(z)| ≤ C_ε e^{(t+ε)|z|}` for
  every `ε > 0`) whose restriction to `ℝ` is square-integrable belongs to `PW_t`.
- Reproducing kernel: `F(λ) = ∫ F(x) conj(k_t(λ, x)) dx` with `k_t(λ, z) = sin(t(z − conj λ))/(π(z − conj λ))`,
  and `‖k_t(λ, ·)‖² = k_t(λ, λ) = sinh(2t Im λ)/(2π Im λ)`, equal to `t/π` for real `λ`
  (poltoratski2024 (2.3)–(2.4) line 241–249).
- `zF ∈ PW_t` exactly when `φ` is absolutely continuous on `[−t, t]` with `φ′ ∈ L²` and `φ(±t) = 0`
  (then `zF(z) = i∫ φ′(s) e^{isz} ds`); these `F` are dense in `PW_t`.

*Needs:* §2.6; Mathlib `MeasureTheory.Lp.fourierTransformₗᵢ`,
`PhragmenLindelof.right_half_plane_of_bounded_on_real`.

**Checks.**

- `φ = 1_{[−t,t]}`: `F(z) = 2 sin(tz)/z`, and `‖F‖² = ∫ 4 sin²(tx)/x² dx = 4πt = 2π · 2t`.
- `t = 0`: `PW_0 = {0}`.
- `e^{itz}` is entire of exponential type `t` but not square-integrable on `ℝ`, and `sin(tz)/z` lies in
  `PW_t` but not in `PW_s` for `s < t`.
- Kernel norm: `∫ sin²(t(y − x))/(π²(y − x)²) dy = t/π` (numerically `0.63657` for `t = 2` against
  `2/π ≈ 0.63662`).

### 2.8 Outer functions

For real `h ∈ L¹(Π)` define the outer function `O_h = exp(S[h])`, and for real `h ∈ L¹(ℝ)` the outer
function normalised at infinity `O⁰_h = exp(S⁰[h])`. A holomorphic `F` on `ℂ₊` is outer when
`F = c O_h` with `|c| = 1` and `h ∈ L¹(Π)`; `h` is its boundary log-modulus (mauth2022 line 454–468;
garnett2007, Ch. II §4, p. 64, uncertified). Its API:

- `O_h` is holomorphic and zero-free on `ℂ₊` with `|O_h| = exp P[h]`; by §2.4 its nontangential
  boundary modulus is `e^{h(x)}` for almost every `x` (mauth2022 Lemma 8 line 463).
- `O_{h+k} = O_h O_k`, `O_0 = 1`, `O⁰_h = e^{−(i/π)∫ x h/(1+x²)} O_h`, and `O⁰_h(iy) → 1` as `y → ∞`.
- `O_h` is bounded exactly when `h` is essentially bounded above, with `sup |O_h| = e^{ess sup h}`.
- A zero-free holomorphic `F` on `ℂ₊` with `log|F| = P[h]` is `c O_h` with `|c| = 1`; two outer
  functions with the same boundary modulus differ by a unimodular constant.
- For even `h`, `O_h` is real and positive on the imaginary axis.
- Outer multipliers: let `F ∈ H²(ℂ₊)` and let `G = c O_h` be outer with `|F*| e^h ∈ L²(ℝ)`. Then
  `FG ∈ H²(ℂ₊)`, `|(FG)*| = |F*| e^h` almost everywhere, and `‖FG‖ = ‖F* e^h‖_{L²}` (garnett2007, Ch. II
  §4, uncertified; poltoratski2024 line 685–687 and line 766 and mauth2022 line 945 and line 1137 use it
  without proof). Route: the case `F ≡ 0` is trivial. Otherwise the logarithmic bound of §2.6 and
  `log|G| = P[h]` give `2 log|FG(z)| ≤ P[k](z)` with `k = 2 log|F*| + 2h ∈ L¹(Π)`. Jensen's inequality for
  the probability measure `P(z, x) dx` and the convex function `exp` gives `|FG(z)|² ≤ P[|F*|² e^{2h}](z)`.
  Integrating in `x` at height `y`, with `∫ P(x + iy, u) dx = 1` and Tonelli, gives
  `∫ |FG(x + iy)|² dx ≤ ‖F* e^h‖²`. The boundary modulus follows from the nontangential limits of `F`
  (§2.6) and of `|G| = e^{P[h]}` (§2.4), and the norm identity from `‖FG‖ = ‖(FG)*‖_{L²}` (§2.6).
- Boundary values of outer functions: if the measure `e^{2h} dx` is Poisson-finite (`∫ e^{2h} dΠ < ∞`), then
  `O_h/(z + i) ∈ H²(ℂ₊)` by the previous bullet with `F = 1/(z + i)`. So `O_h` has a nontangential limit at
  almost every `x ∈ ℝ` (§2.6), of modulus `e^{h(x)}`.

*Needs:* §2.1, §2.4, §2.6; Mathlib `ConvexOn.map_integral_le`, `convexOn_exp`,
`MeasureTheory.lintegral_lintegral_swap`.

**Checks.**

- `h(x) = log|x + i|`: `(1/π)∫ log(1 + x²)/(1 + x²) dx = 2 log 2`, so `O_h(i) = 2` and `O_h(z) = −i(z + i)`;
  `h` is even and `O_h(iy) = y + 1 > 0`.
- `e^{iz}` has boundary modulus `1` but is not `c O_0 = c`, and `(z − i)/(z + i)` has a zero; neither is
  outer.
- `h = 0`: `O_0 = 1`, and the outer-multiplier bullet reduces to `FG = cF` with `‖FG‖ = ‖F‖`.
- Outer multipliers: for `F = 1/(z + i)²` and `h = log|x + i|` (`G = −i(z + i)`), `FG = −i/(z + i) ∈ H²(ℂ₊)`
  with `‖FG‖² = π`, and `‖F* e^h‖² = ∫ |x + i|²/|x + i|⁴ dx = ∫ dx/(1 + x²) = π`.
- The boundary condition is needed: `F = 1/(z + i)` with the same `G` has `|F*| e^h = |x + i|/|x + i| = 1`,
  not in `L²(ℝ)`, and indeed `FG = −i` is not in `H²(ℂ₊)`.
- Outerness is needed: `G = e^{−iz}` is zero-free with `|G| = 1` on `ℝ`, but `log|G(z)| = Im z > 0 = P[0](z)`,
  so it is not outer. For `F = 1/(z + i)`, `|F*| · 1 ∈ L²(ℝ)`, while `FG = e^{−iz}/(z + i)` has
  `∫ |FG(x + iy)|² dx = πe^{2y}/(y + 1)`, unbounded in `y`.

### Examples

- `1/(z + i)` lies in `H²(ℂ₊)`, `z + i` is outer, `e^{iz}` and `(z − i)/(z + i)` are bounded and not outer.
- `P[dx/(1 + x²)]` is `Re(i/(z + i))`, a bounded positive harmonic function with boundary values
  `1/(1 + x²)` everywhere (Tau Ceti `TauCeti.tendsto_halfSpacePoissonIntegral` for continuous bounded data).
- `2 sin(tz)/z` spans the kernel direction at `0` of `PW_t`.

### Dependencies

Mathlib (Bochner integration, harmonic functions, analyticity of holomorphic functions, the Euclidean
model of `ℂ` and the area of the disc, differentiation under the integral, the disc Poisson kernel and
Poisson formula, Lebesgue differentiation and the Lebesgue decomposition, the `L²` Fourier transform,
convergence in measure, Phragmén–Lindelöf, Banach–Alaoglu, Jensen's inequality, Fatou's lemma, Tonelli's
theorem, the mean value property of holomorphic functions, polar coordinates); Tau Ceti (the half-space Poisson kernel and Poisson integral, maximal function, half-plane
primitives, mean-value converse, F. and M. Riesz uniqueness, Jensen's bound for circle averages, Cayley
transform, the dual of `L¹` of a finite measure); AutomorphicSpectralTheory §0.5 (the Herglotz
representation) for §2.2.

## Layer 3: Dirac systems and their Hermite–Biehler functions

Throughout, `q` is a potential (integrable on every `[0, t]`), `f = Re q`, `g = Im q`.

### 3.1 The Dirac system and its fundamental matrix

Define `Q_q(t) = [[g(t), f(t)], [f(t), −g(t)]]` and the fundamental matrix `M_q(t, z)`, `t ≥ 0`,
`z ∈ ℂ`, as the propagator `N(t, 0)` (§1.3) on `E = EuclideanSpace ℂ (Fin 2)` of the coefficient
`−Ω(z − Q_q(t))`, acting through `Matrix.toEuclideanCLM`. The coefficient is entire in `z`, with Euclidean
operator norm `‖−Ω(z − Q_q(t))‖ ≤ ‖Ω‖(|z| + ‖Q_q(t)‖) = |z| + |q(t)|` (§1.6, Conventions). `M` is the matrix
of `N(t, 0)` in the standard basis. Write `M = [[A, B], [C, D]]`, `Θ = (A, C)ᵀ`, `Φ = (B, D)ᵀ`
(poltoratski2024 line 136–166; mauth2022 (5)–(6) line 546–563).

In `Suggested.lean` the coefficient `−Ω(z − Q_q(t))` is `diracCoeff`. A function `X : ℝ → (Fin 2 → ℂ)`
solves the system at `z` (`IsDiracSolution`) when it is continuous on `[0, ∞)` and
`X(t) = X(0) + ∫₀ᵗ −Ω(z − Q_q(s)) X(s) ds` for every `t ≥ 0`. A `DiracFundamentalSystem` of `q` consists
of two functions `DiracFundamentalSystem.neumann` and `DiracFundamentalSystem.dirichlet` of `(t, z)` that
solve the system at every `z` (`DiracFundamentalSystem.isDiracSolution_neumann`,
`DiracFundamentalSystem.isDiracSolution_dirichlet`) with the initial values `(1, 0)` and `(0, 1)`
(`DiracFundamentalSystem.neumann_zero`, `DiracFundamentalSystem.dirichlet_zero`): they are `Θ` and `Φ` on
`[0, ∞)`. The carrier `Fin 2 → ℂ` carries the sup norm, but the integral equation and continuity do not
depend on the norm, and Mathlib's `EuclideanSpace.equiv` is the identity on coordinates; so these are the
coordinate vectors of the columns of `N(t, 0)` on `EuclideanSpace ℂ (Fin 2)`. The Euclidean norm matters
only for the bounds below, which `Suggested.lean` does not state. Prove that for a potential `q` a
fundamental system exists, that its solutions are entire in `z` at every `t ≥ 0`, and that any two
fundamental systems agree at every `t ≥ 0` (`existsUnique_diracFundamentalSystem`; §1.2 and §1.6).

- `ΩM(t, z) = Ω + ∫₀ᵗ (z − Q_q(s)) M(s, z) ds`, `M(0, z) = 1`, and `M(t, ·)` is entire, jointly continuous
  in `(t, z)`.
- `det M(t, z) = 1` (§1.4, the coefficient is trace-free; poltoratski2024 (2.1) line 204; mauth2022
  Lemma 14 line 565).
- `M(t, conj z) = conj M(t, z)`: `A, B, C, D` are real entire, for every complex potential, because
  `Q_q` has real entries.
- Chain rule: `M_q(t, z) = M_{q(s+·)}(t − s, z) M_q(s, z)` for `0 ≤ s ≤ t` (romanov2014 line 223–224),
  and locality: `M_q(t, ·)` depends only on `q` almost everywhere on `[0, t]`.
- In the Euclidean operator norm, `‖M(t, z)‖ ≤ exp(t|z| + ∫₀ᵗ |q|)`, with equality for a constant
  potential at `z = 0`; in particular every entry is entire of order at most one and of exponential
  type at most `t`.
- Christoffel–Darboux identity: `M(t, λ)* Ω M(t, z) − Ω = (z − conj λ) ∫₀ᵗ M(s, λ)* M(s, z) ds`
  (romanov2014 (12) line 758).
- For a real potential, `A(t, −z) = A(t, z)`, `D(t, −z) = D(t, z)`, `B(t, −z) = −B(t, z)`,
  `C(t, −z) = −C(t, z)`, and `M(t, 0) = diag(e^{F(t)}, e^{−F(t)})` with `F(t) = ∫₀ᵗ f`.
- Conjugation by `Ω` changes the sign of the potential: `Ω Q_q Ω⁻¹ = −Q_q = Q_{−q}`, so `ΩX` solves the
  system of `−q` whenever `X` solves that of `q`, and `M_{−q}(t, z) = Ω M_q(t, z) Ω⁻¹`; that is,
  `A_{−q} = D_q`, `B_{−q} = −C_q`, `C_{−q} = −B_q`, `D_{−q} = A_q`, so `Θ_{−q} = ΩΦ_q` and `Φ_{−q} = −ΩΘ_q`.

*Needs:* §1.2, §1.3, §1.4, §1.6; Mathlib `Matrix.det_fin_two`, `Matrix.toEuclideanCLM`,
`EuclideanSpace.equiv`.

**Checks.**

- Free case `q = 0`: `M(t, z) = [[cos tz, −sin tz], [sin tz, cos tz]]`, `det = 1`.
- Real constant `f = c` at `z = 0`: `M = diag(e^{ct}, e^{−ct})`; the opposite sign convention
  `ΩX′ = zX + QX` gives `diag(e^{−ct}, e^{ct})`.
- Purely imaginary constant `q = ic` at `z = 0`: `Θ = (cosh ct, −sinh ct)`, `Φ = (−sinh ct, cosh ct)`,
  `det = cosh² − sinh² = 1`.
- A smooth complex potential (`f(t) = 0.8 cos 3t + 0.3`, `g(t) = 0.5 sin 2t`, `t = 1.7`,
  `z = 0.6 + 0.25i`) gives `det M = 1` to twelve digits under numerical integration.
- Norm convention: for `q = 1 + i` on `[0, 1]` at `z = 0`,
  `M(1, 0) = exp(ΩQ_q) = cosh(√2) · 1 + (sinh(√2)/√2) ΩQ_q ≈ [[3.5465, −1.3683], [−1.3683, 0.8099]]`.
  Its Euclidean operator norm is `e^{√2} ≈ 4.1133`, so the bound `exp(t|z| + ∫|q|)` is attained. Its
  maximum-row-sum norm is `≈ 4.9148`, so the bound fails for the sup-norm carrier `Fin 2 → ℂ`.
- Conjugation by `Ω`: for `f = c` at `z = 0`, `Ω diag(e^{ct}, e^{−ct}) Ω⁻¹ = diag(e^{−ct}, e^{ct})`, the matrix of
  the potential `−c` in the second Check. In the free case `M(t, z)` is a rotation and commutes with `Ω`,
  as `−0 = 0` requires; reading the sign change as `M_{−q} = M_q⁻¹` would give the inverse rotation
  `[[cos tz, sin tz], [−sin tz, cos tz]]` at `q = 0` instead.

### 3.2 The Hermite–Biehler functions `E` and `Ẽ`

Define `E(t, z) = A(t, z) − iC(t, z)` and `Ẽ(t, z) = B(t, z) − iD(t, z)` (poltoratski2024 line 186–190;
mauth2022 line 182–183); for a fundamental system these are `DiracFundamentalSystem.hermiteBiehler` and
`DiracFundamentalSystem.hermiteBiehlerDirichlet` in `Suggested.lean`.

- `A = (E + E#)/2`, `C = (E# − E)/(2i)`, `B = (Ẽ + Ẽ#)/2`, `D = (Ẽ# − Ẽ)/(2i)`.
- `det [[E, Ẽ], [E#, Ẽ#]] = E Ẽ# − Ẽ E# = 2i` (poltoratski2024 (2.2) line 205–208; mauth2022
  Corollary 2 line 596).
- `E(0, ·) = 1`, `Ẽ(0, ·) = −i`, and `E(t, z) = 1 + ∫₀ᵗ (−izE(s, z) + q(s)E#(s, z)) ds`, and the same
  for `Ẽ` (poltoratski2024 (2.5) line 293; mauth2022 Lemma 15 line 612).
- On `ℝ`: `e^{−∫₀ᵗ|q|} ≤ |E(t, x)|, |Ẽ(t, x)| ≤ e^{∫₀ᵗ|q|}` (poltoratski2024 line 273–275).
- Modulus and argument: with the continuous branch `φ(t, x)` of `arg E(t, x)` in `(t, x)` normalised by
  `φ(0, x) = 0`, `∂ₜ log|E| = f cos 2φ + g sin 2φ` and `∂ₜ φ = −x + g cos 2φ − f sin 2φ` almost
  everywhere; for real potentials these are poltoratski2024 (2.6)–(2.7) (line 295–306) and
  mauth2022 Lemma 17 (line 646), and `φ(t, 0) = 0`.
- Kernel identity: `(A(t, z) conj C(t, w) − C(t, z) conj A(t, w))/(conj w − z) = ∫₀ᵗ Θ(s, w)* Θ(s, z) ds`.
- Sign of the potential: `E_{−q} = iẼ_q` and `Ẽ_{−q} = −iE_q`, by the conjugation by `Ω` of §3.1
  (`E_{−q} = D_q + iB_q`, `Ẽ_{−q} = −C_q − iA_q`).

*Needs:* §3.1.

**Checks.**

- Free case: `E = e^{−itz}`, `Ẽ = −i e^{−itz}`, and `E Ẽ# − Ẽ E# = e^{−itz}(i e^{itz}) + i e^{−itz}e^{itz} = 2i`.
- Real constant `f = c` at `z = 0`: `E(t, 0) = e^{ct}`, `Ẽ(t, 0) = −i e^{−ct}`, and the upper bound
  `e^{∫|q|} = e^{ct}` is attained, so the bound is sharp.
- The reflection is needed in the equation: `∂ₜE = −izE + qE` (without `#`) would give
  `E(t, 0) = e^{ict}` for `q = ic`, while the solution of §3.1 gives `cosh ct + i sinh ct`.
- Sign of the potential, `f = c` at `z = 0`: `E_{−c}(t, 0) = e^{−ct}` (the second Check, for `−c`) equals
  `iẼ_c(t, 0) = i(−i e^{−ct})`, and `Ẽ_{−c}(t, 0) = −i e^{ct} = −iE_c(t, 0)`; the relation without the factor `i`,
  `E_{−q} = Ẽ_q`, would give `−i e^{−ct}`.

### 3.3 The Hermite–Biehler property

Call an entire `H` Hermite–Biehler when `|H#(z)| < |H(z)|` for every `z ∈ ℂ₊` (poltoratski2024 line
175–180; mauth2022 line 491–493). Its API:

- A Hermite–Biehler function has no zeros in `ℂ₊`, and `H#/H` is bounded by `1` on `ℂ₊`.
- For `t > 0`, `E(t, ·)` and `Ẽ(t, ·)` are Hermite–Biehler, with
  `|E(t, z)|² − |E#(t, z)|² = 4 Im z ∫₀ᵗ |Θ(s, z)|² ds` and
  `|Ẽ(t, z)|² − |Ẽ#(t, z)|² = 4 Im z ∫₀ᵗ |Φ(s, z)|² ds` (mauth2022 Lemma 13 line 531; romanov2014
  Proposition 4 line 780, identity (15)).
- `E(t, ·)` and `Ẽ(t, ·)` have no zeros in the closed upper half-plane (on `ℝ` by §3.2), and are entire of
  order at most one and exponential type at most `t` (§3.1).
- Route: the Christoffel–Darboux identity at `λ = z` and `|u − iv|² − |u + iv|² = 4 Im(conj(u) v)`.

*Needs:* §3.1, §3.2.

**Checks.**

- Free case: `|E|² − |E#|² = e^{2ty} − e^{−2ty} = 2 sinh 2ty`, and
  `4y ∫₀ᵗ (|cos sz|² + |sin sz|²) ds = 4y ∫₀ᵗ cosh 2sy ds = 2 sinh 2ty`.
- `t = 0`: `E = 1` has `|E#| = |E|`, so `t > 0` is needed.
- `H(z) = z − i` is not Hermite–Biehler (`|z + i| > |z − i|` on `ℂ₊`), while `z + i` is.
- The smooth complex potential of §3.1 gives `|E(t, z)| ≈ 1.841 > 0.573 ≈ |E#(t, z)|`.

### Examples

- For `q = c · 1_{[0, T]}` with a complex constant `c`, `M(t, z)` for `t ≤ T` is
  `exp(−tΩ(z − Q_c))`, explicit through `cos(t√(z² − |c|²))`.
- For real `f`, `E(t, iy) = A(t, iy) − iC(t, iy)` with `A(t, iy)` real and `C(t, iy)` purely imaginary,
  so `E(t, iy)` is real.

### Dependencies

Layer 1 (§1.2, §1.3, §1.4, §1.6); Mathlib (`2 × 2` determinants, matrices as operators on
`EuclideanSpace ℂ (Fin 2)`).

## Layer 4: Scattering data on a finite interval

Throughout, `q` is a potential and `t ≥ 0`.

### 4.1 The scattering matrix and the scattering functions

Define the scattering matrix `G_q(t, z)` as the propagator `N(t, 0)` (§1.3) on `EuclideanSpace ℂ (Fin 2)`
of the coefficient `[[0, e^{−2izt} conj q(t)], [e^{2izt} q(t), 0]]`, entire in `z` with operator norm
`max(|e^{−2izt}|, |e^{2izt}|) |q(t)| = |q(t)| e^{2t|Im z|}` (§1.6), and the scattering functions
`a = (G_q)₂₂`, `b = (G_q)₂₁`
(poltoratski2024 (5.3) line 492–501).

- Structure: `G_q = [[a#, b#], [b, a]]` and `det G_q = a a# − b b# = 1`; on `ℝ`,
  `|a(t, x)|² − |b(t, x)|² = 1`, so `G_q(t, x) ∈ SU(1,1)` (poltoratski2024 line 501–503).
- Dictionary with §3.2: `a = e^{itz}(E + iẼ)/2`, `b = e^{itz}(E − iẼ)/2`, equivalently
  `E = e^{−itz}(a + b)` and `Ẽ = −i e^{−itz}(a − b)` (poltoratski2024 (5.2) line 484–488; mauth2022
  line 187–189). `Suggested.lean` defines `a` and `b` of a fundamental system by these formulas, as
  `DiracFundamentalSystem.scatteringA` and `DiracFundamentalSystem.scatteringB`; the dictionary is what
  makes them the entries of `G_q`.
- Volterra form: `a(t, z) = 1 + ∫₀ᵗ q(s) e^{2izs} b#(s, z) ds` and
  `b(t, z) = ∫₀ᵗ q(s) e^{2izs} a#(s, z) ds` (poltoratski2024 (5.4) line 508–517).
- Locality: `G_q(t, ·)` depends only on `q` almost everywhere on `[0, t]`; if `q = 0` on `(T, t)` then
  `G_q(t, ·) = G_q(T, ·)`.
- Concatenation: for `0 ≤ s ≤ t`, with `(a₁, b₁) = (a_q(s, ·), b_q(s, ·))` and `(a₂, b₂)` the scattering
  functions of `q(s + ·)` at time `t − s`, `b_q(t) = e^{2izs} b₂ a₁# + a₂ b₁` and
  `a_q(t) = e^{2izs} b₂ b₁# + a₂ a₁`.
- Translation of the potential: for `t₀ ≥ 0` and `q^{t₀}(s) = q(s − t₀) 1_{s ≥ t₀}`,
  `a_{q^{t₀}}(t + t₀, z) = a_q(t, z)` and `b_{q^{t₀}}(t + t₀, z) = e^{2izt₀} b_q(t, z)`.
- Modulation of the potential: for `ξ ∈ ℝ`, `G_{q e^{2iξ·}}(t, z) = G_q(t, z + ξ)`.
- Dilation: for `λ > 0`, `G_{λ q(λ·)}(t, z) = G_q(λt, z/λ)`.
- Real potentials: `a(t, −conj z) = conj a(t, z)` and `b(t, −conj z) = conj b(t, z)`; `a(t, iy)` and
  `b(t, iy)` are real, and `a(t, 0) = cosh F(t)`, `b(t, 0) = sinh F(t)` with `F(t) = ∫₀ᵗ f`.

*Needs:* §1.3, §1.6, §3.1, §3.2.

**Checks.**

- Free case: `G = 1`, `a = 1`, `b = 0`.
- Constant `q = c` on `[0, T]` at `z = 0`: `a = cosh(|c|T)`, `b = (c/|c|) sinh(|c|T)`; for `c = 0.7 + 0.4i`,
  `T = 1.3` this is `a ≈ 1.6014`, `b ≈ 1.0860 + 0.6206i`.
- Position of `q`: for the smooth complex potential of §3.1 the dictionary values
  `a ≈ 1.0632 + 0.1443i`, `b ≈ 0.0750 + 0.2463i` agree with the solution of the defining system to
  twelve digits, while the system with `conj q` in the lower left entry gives
  `a ≈ 1.2589 − 0.1142i`, `b ≈ 0.6221 − 0.2396i`; the first-order term of `b` is `∫ q e^{2izs}`, not
  `∫ conj q e^{2izs}`.
- Tao–Thiele convention: for `q = 1` on `[0, 1]`, `|a(1, 5i)| ≈ 1.093 ≤ cosh 1`, while
  `|a(1, −5i)| ≈ 237.0`; the function bounded on `ℂ₊` is the present `a`, whose reflection is Tao and
  Thiele's `a`.
- Translation: for `q(s) = 0.4 cos 5s + 0.3i` on `[0, 1]`, `t₀ = 0.6`, `z = 0.3 + 0.1i`, the translated
  potential gives `a` equal to `a_q(1, z)` and `b` equal to `e^{2izt₀} b_q(1, z)` up to the discretisation
  error.

### 4.2 Dyson bounds and decay

Let `L = ∫₀ᵗ |q|`. Prove that for `z` in the closed upper half-plane `|a(t, z)| ≤ cosh L`,
`|a(t, z) − 1| ≤ cosh L − 1`, `|b(t, z)| ≤ sinh L` and `|b(t, z) − ∫₀ᵗ q(s) e^{2izs} ds| ≤ sinh L − L`; that
`a(t, z) → 1` and `b(t, z) → 0` as `|z| → ∞` in the closed half-plane; and that for `q` integrable on
`[0, ∞)` the functions `a(t, ·)`, `b(t, ·)` converge uniformly on the closed half-plane as `t → ∞`. Route:
the `n`-th Dyson term of `a` or `b` is an integral over the simplex `s₁ < ⋯ < sₙ < t` of
`q(sₙ) conj q(sₙ₋₁) ⋯` times `e^{2izσ}` with an alternating sum `σ ≥ 0`, so it is bounded by `Lⁿ/n!`;
decay is the Riemann–Lebesgue lemma for the image of the simplex integrand under `σ`, uniform over the
compact family `e^{−2σ Im z}`. For the discrete analogue on `ℓ¹`, see taothiele2012 Lecture 1 §3: Lemma 5
(line 430–433) gives the uniform convergence of truncations, and line 460–465 gives the bound
`sup arccosh|a| ≤ Σ arccosh((1 − |F_n|²)^{−1/2})` on the circle.

*Needs:* §1.3 (Dyson expansion), §4.1; Mathlib `Real.tendsto_integral_exp_smul_cocompact` (the Riemann–Lebesgue
lemma on `ℝ`).

**Checks.**

- `q = 1` on `[0, 1]`: `|a(1, 5i)| ≈ 1.093 ≤ cosh 1 ≈ 1.543` and `|b(1, 5i)| ≈ 0.108 ≤ sinh 1`.
- For `q(s) = 0.4 cos 5s + 0.3i` on `[0, 1]` (`L ≈ 0.4006`), at `z = 0.5 + 0.2i`, `−2` and `1.5i` the
  first-order errors of `b` are `0.0059`, `0.0075`, `0.0025`, below `sinh L − L ≈ 0.0108`, and
  `|a − 1|` is `0.044`, `0.057`, `0.030`, below `cosh L − 1 ≈ 0.081`.
- On the open lower half-plane no bound holds: `|a(1, −5i)| ≈ 237`.

### 4.3 The half-plane inequality

Prove that `|a(t, z)|² − |b(t, z)|² ≥ 1` for every `z` in the closed upper half-plane, with equality on
`ℝ`; hence `|a(t, z)| ≥ 1`, `|b(t, z)| < |a(t, z)|`, `a(t, ·)` has no zeros in the closed half-plane,
and `ρ(t, ·) = b(t, ·)/a(t, ·)` is holomorphic on a neighbourhood of the closed half-plane with
`1 − |ρ(t, z)|² ≥ 1/|a(t, z)|²` (poltoratski2024 line 503–507; taothiele2012 Lemma 3 line 296 for the
discrete model). Route: for `X = M(·, z)c`, `h(X) = Im(conj u · v)` satisfies `∂ₜh = Im z |X|² ≥ 2 Im z h`
and `|u − iv|² − |u + iv|² = 4h`. For `c = c₁(1, i) + c₂(1, −i)` one has `h(c) = |c₁|² − |c₂|²`,
`u − iv = 2e^{−itz}(c₁a + c₂b)` and `u + iv = 2e^{itz}(c₁b# + c₂a#)`, so
`|c₁ a + c₂ b|² ≥ |c₁|² − |c₂|²` whenever `|c₂| ≤ |c₁|`; minimising over `c₂` gives `|a|² ≥ 1 + |b|²`.

*Needs:* §3.1 (Christoffel–Darboux identity), §3.3, §4.1.

**Checks.**

- Constant potentials `q ∈ {1, 0.3 + 2i, 3}` on `[0, 1]` and `z` on a grid of the closed half-plane
  give `min(|a|² − |b|²) = 1.0000` (attained on `ℝ`) and `min |a| ≈ 1.006`.
- Real `f` at `z = 0`: `|a|² − |b|² = cosh² F − sinh² F = 1`.
- The inequality fails in the lower half-plane: `q = 1` on `[0, 1]` at `z = −5i` gives
  `|a| ≈ 237 < |b| ≈ 2385`.

### 4.4 Outerness and the finite non-linear Plancherel identity

Let `q` be square-integrable on `[0, t]`. Prove that `log a(t, ·)` (the logarithm vanishing at `i∞`) is a
bounded holomorphic function on `ℂ₊`, that `y(a(t, iy) − 1) → ½∫₀ᵗ |q|²` as `y → ∞`, and the non-linear
Plancherel identity `∫_ℝ log|a(t, x)| dx = (π/2) ∫₀ᵗ |q|²`; hence `log|a(t, ·)| ∈ L¹(ℝ)`,
`a(t, ·) = O⁰_{log|a(t,·)|}` is outer, `log(1 − |ρ(t, x)|²) = −2 log|a(t, x)|` on `ℝ`, and
`∫ −log(1 − |ρ(t, x)|²) dx = π ∫₀ᵗ |q|²`. For real potentials `a(t, iy) > 0` (poltoratski2024 (5.5)
line 545–548 and line 503–507, printed with constant `1`; denisov2006 (194) line 3250–3255;
taothiele2012 Lemma 6 line 680–683 for the discrete model). The integrability of `log|a(t, ·)|` and the
identity are `nonlinear_plancherel` in `Suggested.lean`. Route: `log a(t, ·)` is a primitive of
`∂_z a/a` on `ℂ₊` (Tau Ceti `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane`), bounded and
continuous to `ℝ` by §4.2–§4.3; §2.5 gives `log|a(t, z)| = P[log|a(t, ·)|](z)`; §2.2 gives
`πy log|a(t, iy)| ↑ ∫ log|a(t, x)| dx`; the Volterra form with the approximate identity
`y e^{−2yu} 1_{u>0}` (mass `1/2`) gives the limit at `i∞`.

*Needs:* §2.2, §2.5, §2.8, §4.1–§4.3; Tau Ceti `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane`.

**Checks.**

- `q = 1` on `[0, 1]`: `|a(1, x)|² = 1 + sin²(√(x² − 1))/(x² − 1)`, and `∫ log|a(1, x)| dx ≈ 1.5707`
  numerically against `π/2 ≈ 1.5708`; `y(a(1, iy) − 1) ≈ 0.4853` at `y = 10` and `0.4987` at `y = 100`.
- `q = 0.5 + 1.2i` on `[0, 0.7]`: `1.8580` numerically against `(π/2)(1.69)(0.7) ≈ 1.8583`.
- First order: for small `q`, `log|a| ≈ ½|b|²` and `∫ |∫₀ᵗ q e^{2ixs} ds|² dx = π∫₀ᵗ|q|²`, giving `π/2`
  again; the constant `1` printed in the sources fails this computation.

### 4.5 The Riccati representation

For `z` in the closed upper half-plane define `r(t, z) = e^{2izt} b#(t, z)/a(t, z)`. Prove that
`|r(t, z)| < 1`, that `∂ₜ r = 2iz r + conj q − q r²` with `r(0, z) = 0`, that
`a(t, z) = exp(∫₀ᵗ q(s) r(s, z) ds)`, that `|r(t, z)| ≤ 2∫₀ᵗ e^{−2 Im z (t − s)} |q(s)| ds`, and that
`ρ(t, z) = ∫₀ᵗ q(s) e^{2izs} a(s, z)^{−2} ds`. Route: with `β = e^{2izt} b#`, the pair `(a, β)` solves
`a′ = qβ`, `β′ = 2izβ + conj q a`, so `∂ₜ(|a|² − |β|²) = 4 Im z |β|² ≥ 0`, and `r = β/a` satisfies the
Riccati equation; `∂ₜ ρ = q e^{2izt}/a²` follows from `det G = 1`. For the Krein-system analogue, the
Riccati equation of the Schur function of the system restricted to a tail `[s, ∞)`, see denisov2006
§9 Lemma 9.1 (157)–(158) line 2510–2521, and Lemma 9.2 line 2544–2556 for its solution as the ratio of
the two components of a linear system.

*Needs:* §4.1, §4.3.

**Checks.**

- Free case: `r = 0`, `a = 1`, `ρ = 0`.
- For the smooth complex potential of §3.1, `ρ(1.7, 0.6 + 0.25i) ≈ 0.10010 + 0.21808i` both from
  `b/a` and from the integral formula.
- Real `f` at `z = 0`: `r = tanh F`, `a = exp∫ f tanh F = cosh F`.

### Examples

- `q = c · 1_{[0, T]}`: `G = diag(e^{−izt}, e^{izt}) exp(t N)` for `t ≤ T`, with
  `N = [[iz, conj c], [c, −iz]]`, `N² = (|c|² − z²) 1`.
- A delta-like pair of kicks of sizes `c₁` at `0` and `c₂` at `s` (limits of narrow rectangles) gives
  `|a|² − |b|² = cosh² c₂ − |e^{2izs}|² sinh² c₂ ≥ 1` on the closed half-plane.

### Dependencies

Layer 1 (§1.3, §1.6), Layer 2 (§2.2, §2.5, §2.8), Layer 3; Tau Ceti (half-plane primitives); Mathlib (the
Riemann–Lebesgue lemma).

## Layer 5: The square-integrable scattering limit and the non-linear Fourier transform

Throughout, `q` is square-integrable on `[0, ∞)`, `‖q‖ = (∫₀^∞ |q|²)^{1/2}`, and for `T ≥ 0` the tail
potential is `q_{>T} = q(T + ·)`.

### 5.1 The scattering limit in the half-plane

Prove that for `z ∈ ℂ₊` with `y = Im z`: `log|a(t, z)| ≤ ‖q‖²/y` and
`|ρ(t, z) − ρ(t′, z)| ≤ ‖q‖_{L²(t, ∞)} e^{−2yt}/(2√y)` for `t ≤ t′`; that `a(t, ·)`, `b(t, ·)` and
`ρ(t, ·)` converge, as `t → ∞`, uniformly on every half-plane `{Im z ≥ y₀}`, `y₀ > 0`, to holomorphic
limits `a(∞, ·)`, `b(∞, ·)`, `ρ(∞, ·) = b(∞, ·)/a(∞, ·)`; that `a(∞, z) = exp(∫₀^∞ q(s) r(s, z) ds)`,
`ρ(∞, z) = ∫₀^∞ q(s) e^{2izs} a(s, z)^{−2} ds`, `|a(∞, z)|² − |b(∞, z)|² ≥ 1` and `|ρ(∞, z)| < 1` on `ℂ₊`;
that `y log a(∞, iy) → ½‖q‖²` as `y → ∞`; and that for real potentials `a(∞, iy) ≥ 1`
(denisov2006 Theorem 11.1 line 3246–3255 for Krein systems and §13 (245)–(248) line 4219–4258 for
the dictionary; poltoratski2024 line 518–529). Route: §4.5 gives
`|r(t, z)| ≤ 2(e^{−2y·} * |q|)(t)`, so `‖r(·, z)‖_{L²} ≤ ‖q‖/y` by Young's inequality for the kernel
`e^{−2ys} 1_{s ≥ 0}` of `L¹` norm `1/(2y)`, and
`|log a(t, z)| ≤ ∫|q||r| ≤ ‖q‖²/y`; the tails of `∫ q r` and of `∫ q e^{2izs} a^{−2}` are bounded by
Cauchy–Schwarz.

*Needs:* §4.3, §4.5; Mathlib `TendstoLocallyUniformlyOn.differentiableOn`; Tau Ceti
`TauCeti.norm_convolutionLp_le` and `TauCeti.convolutionLp_ae_eq_convolution` (Young's inequality on
`ℝ` with `p = 2`).

**Checks.**

- `q ∈ L¹ ∩ L²`: the limits agree with the uniform limits of §4.2 on the closed half-plane.
- `q = 1_{[0,1]}`: `a(∞, ·) = a(1, ·)`, and `log a(1, 5i) ≈ 0.0893 ≤ ‖q‖²/5 = 0.2`.
- The bound degenerates as `y → 0`: for `q = 1_{[0,T]}`, `log|a(T, x)|` at `x = 0` is `log cosh T`, which
  is unbounded in `T` although `log|a(T, iy)| ≤ T/y` holds for each `y > 0`.

### 5.2 The non-linear Fourier transform

Define the non-linear Fourier transform of `q` as `q⌃ = ρ(∞, ·)`, a holomorphic function on `ℂ₊` with
`|q⌃| < 1`, together with its boundary function `q⌃*` on `ℝ` given by §2.5 (poltoratski2024 line
550–560; mauth2022 line 190–201). Its API:

- Truncations: `(q_T)⌃ = ρ(T, ·)` on `ℂ₊`; it extends continuously to the closed half-plane and its
  boundary function is `x ↦ b(T, x)/a(T, x)` (poltoratski2024 line 556–560).
- For `q` integrable on `[0, ∞)`, `q⌃` is continuous on the closed half-plane, `q⌃* = lim ρ(T, ·)` uniformly
  on `ℝ`, and `q⌃*(x) → 0` as `|x| → ∞`.

*Needs:* §2.5, §5.1.

**Checks.**

- `q = 0`: `q⌃ = 0`, `a(∞, ·) = 1`.
- `q = c 1_{[0, T]}` with `c` constant: `q⌃*(x) = b(T, x)/a(T, x)` explicitly, with
  `|q⌃*(x)|² = |c|² sin²(κT)/(κ² + |c|² sin²(κT))`, `κ = √(x² − |c|²)`; at `x = 0`, `q⌃*(0) = (c/|c|) tanh(|c|T)`.
- `|q⌃| < 1` is strict on `ℂ₊`: the boundary function of `ρ(T, ·)` for `q = 1_{[0,1]}` has supremum
  `tanh 1 ≈ 0.762`, attained at `x = 0`.

### 5.3 Boundary values, the Plancherel inequality and the concatenation law at the boundary

Prove that `a(∞, ·)` has nontangential boundary values `a(∞, x) ≠ 0` and `b(∞, ·)` has boundary values
`b(∞, x) = q⌃*(x) a(∞, x)` at almost every `x`; the non-linear Plancherel inequality
`∫_ℝ log|a(∞, x)| dx ≤ (π/2)‖q‖²`; that for every `T ≥ 0`, with `(a₁, b₁, ρ₁)` the data of `q` at time `T`,
`ρ₂ = (q_{>T})⌃*` and `u(x) = e^{2ixT} conj(a₁(x))/a₁(x)`, one has for almost every `x`
`q⌃*(x) = (u ρ₂ + ρ₁)/(1 + u ρ₂ conj ρ₁)`, `a(∞, x) = a₂(x) a₁(x)(1 + u ρ₂ conj ρ₁)` and
`|a(∞, x)|² − |b(∞, x)|² = |a₂(x)|² − |b₂(x)|²`, where `(a₂, b₂)` are the boundary values of the
limits for `q_{>T}`; and that `|a(∞, x)|² − |b(∞, x)|² = 1` almost everywhere, so
`−log(1 − |q⌃*(x)|²) = 2 log|a(∞, x)|` (poltoratski2024 line 518–548, 569–577). Route: `1/a(∞, ·)` is
bounded by `1` and not zero, so by §2.5 its boundary values exist and are nonzero almost everywhere.
Plancherel inequality: `log|a(∞, ·)| ≥ 0` is harmonic, so §2.2 gives `c Im z + P[ν]`, and
`πy log|a(∞, iy)| → (π/2)‖q‖²` (§5.1) forces `c = 0` and `ν(ℝ) = (π/2)‖q‖²`, while §2.4 identifies the
absolutely continuous part `ν_ac = log|a(∞, x)| dx`. The concatenation law of §4.1 passes to the limit
in `ℂ₊` and then to the boundary. For the identity, `δ = |a(∞)|² − |b(∞)|² − 1 ≥ 0` equals the
corresponding quantity of the tail, which satisfies `log(1 + δ) ≤ 2 log|a₂|`; integrate and apply the
Plancherel inequality to the tail, whose right side is `π‖q‖²_{L²(T,∞)} → 0`.

*Needs:* §2.2, §2.4, §2.5, §4.1, §4.3, §5.1.

**Checks.**

- `q = q_T` (compact support) and the tail zero: `ρ₂ = 0`, `u` arbitrary, and the formula gives
  `q⌃* = ρ₁`, `a(∞) = a₁`.
- Pseudo-hyperbolic identity: `1 − |q⌃*|² = (1 − |ρ₁|²)(1 − |ρ₂|²)/|1 + uρ₂ conj ρ₁|²`; for
  `ρ₁ = ρ₂ = 1/2`, `u = 1`: `q⌃* = 1/(1 + 1/4) = 4/5`, and both sides equal `9/25`.
- Real `f` with the symmetric data: `q⌃*(−x) = conj q⌃*(x)` is consistent with the formula, since
  `u(−x) = conj u(x)` and `ρ_j(−x) = conj ρ_j(x)`.

### 5.4 The non-linear Plancherel identity at infinity and outerness

Prove that `∫_ℝ log|a(∞, x)| dx = (π/2)‖q‖²` and `∫_ℝ −log(1 − |q⌃*(x)|²) dx = π‖q‖²`; that
`|q⌃*| < 1` almost everywhere; that `a(∞, ·)` is outer, `a(∞, ·) = O⁰_{log|a(∞, ·)|}`, so that
`a(∞, z) = exp(−(1/(2πi)) ∫ log(1 − |q⌃*(x)|²)/(x − z) dx)` and `b(∞, ·) = q⌃ a(∞, ·)`, so that `q⌃` determines
`a(∞, ·)` and `b(∞, ·)`, and `q⌃ = 0` only when `q = 0` almost everywhere; and that for real `q` the value
`a(∞, iy)` is positive (poltoratski2024 (5.5) line 545–548 and line 567–577, printed with
constant `1`; mauth2022 line 206–210; denisov2006 Theorem 11.1 line 3246–3255). Route: the reverse of
§5.3's inequality comes from the pseudo-hyperbolic identity of §5.3,
`∫ −log(1 − |q⌃*|²) ≥ π‖q‖²_{L²(0,T)} − 2∫|log|1 + uρ₂ conj ρ₁||` (§4.4 for the first term), where the
last integral tends to `0`: with `L(r) = −log(1 − r²)` and `|u| = 1` on `ℝ`,
`|log|1 + uρ₂ conj ρ₁|| ≤ −log(1 − |ρ₁||ρ₂|) ≤ (L(|ρ₁|) L(|ρ₂|))^{1/2}` (Cauchy–Schwarz on the series
`Σₙ (|ρ₁||ρ₂|)ⁿ/n`), so by Cauchy–Schwarz in `x` the integral is at most
`(∫ L(|ρ₁|) · ∫ L(|ρ₂|))^{1/2} ≤ π‖q‖_{L²(0,T)} ‖q‖_{L²(T,∞)}`, by §4.4 for `ρ₁` and by §5.3 applied to the
tail for `ρ₂`; equality with `ν(ℝ)` forces the singular part of the measure of §5.3 to vanish, so
`log|a(∞, ·)| = P[log|a(∞, ·)|]` and §2.8 applies.

*Needs:* §2.2, §2.4, §2.8, §4.4, §5.1, §5.3.

**Checks.**

- `q = 1_{[0,1]}`: `a(∞, ·) = a(1, ·)` and the identity is §4.4's value `π/2`.
- Scaling: for `q_λ = λ q(λ·)`, `(q_λ)⌃(x) = q⌃(x/λ)` (the dilation rule of §4.1 in the limit), and
  `∫ −log(1 − |q⌃(x/λ)|²) dx = λ π‖q‖² = π‖q_λ‖²`.
- Normalisation: `O⁰` is the right outer function, since `a(∞, iy) → 1`; the outer function `O_h`
  normalised at `i` differs from it by `e^{−(i/π)I}` with `I = ∫ x h/(1+x²) dx`, which is `1` exactly when
  `I` is an integer multiple of `2π²`. For real `q`, `I = 0`, since `log|a(∞, ·)|` is even. For
  `q = 0.3 e^{2iξs} 1_{[0,400]}`, `h(x) = h₀(x + ξ)` with `h₀` the boundary log-modulus at `ξ = 0`
  (modulation rule of §4.1), and `I ≈ 12.54` at `ξ = −0.25`, where the factor `e^{−3.992i}` is not `1`
  and `O_h ≠ a(∞, ·)`, while `I ≈ 21.71` at `ξ = −0.5`. As `I` is continuous in `ξ`, it equals
  `2π² ≈ 19.74` for some `ξ` in between, where the two outer functions coincide although `I ≠ 0`.
- Cross term: the `L²` norms of `ρ₁`, `ρ₂` do not control `∫|log|1 + uρ₂ conj ρ₁||`, since at
  `|ρ₁| = |ρ₂| = 0.999` with `uρ₂ conj ρ₁ = −0.998001` the integrand is `6.2151` although `|ρ₁ρ₂| < 1`; the
  logarithmic bound is attained there, `−log(1 − 0.998001) = 6.2151 = (L(0.999) L(0.999))^{1/2}`, and at
  `(|ρ₁|, |ρ₂|) = (0.999, 0.3)` and `(0.1, 0.9)` it reads `0.3562 ≤ 0.7656` and `0.0943 ≤ 0.1292`.

### 5.5 Convergence of truncations

Prove that `‖q⌃* − (q_T)⌃*‖²_{L²(ℝ)} ≤ 4π ‖q‖²_{L²(T,∞)}`; hence `(q_T)⌃*` converges to `q⌃*` in `L²(ℝ)`,
in measure on every bounded interval and in `Π`-measure (`MeasureTheory.TendstoInMeasure` for the
finite measure `Π`); that `log|a(T, ·)| → log|a(∞, ·)|` in `L¹(ℝ)`; and that `a(T, ·) → a(∞, ·)` and
`b(T, ·) → b(∞, ·)` in `Π`-measure on `ℝ` (poltoratski2024 line 518–544 and 577; mauth2022 Lemma 19
line 711 for the measure-convergence pattern). With §5.4, this gives the form stated in `Suggested.lean`
as `exists_nonlinearFourier_plancherel`: for square-integrable `q` there is a measurable `F : ℝ → ℂ` with
`|F| < 1` almost everywhere, `‖F − b(T, ·)/a(T, ·)‖²_{L²(ℝ)} ≤ 4π ‖q‖²_{L²(T,∞)}` for every `T ≥ 0` and
`∫ −log(1 − |F|²) dx = π‖q‖²`. The bound makes `F` the `L²(ℝ)` limit of the truncations, so `F = q⌃*`
almost everywhere, and the statement determines `F` without naming the half-plane. Route: by §5.3,
`|q⌃* − ρ₁| ≤ |ρ₂|(1 + |ρ₁|) ≤ 2|ρ₂|`
and `‖ρ₂‖²_{L²} ≤ π‖q‖²_{L²(T,∞)}`; for `a`, the boundary function of `1/a₂` satisfies
`∫ |1 − 1/a₂|² dΠ ≤ 2π Re(1 − 1/a₂(i))`, and `a₂(i) → 1` by §5.1 applied to the tail; the `L¹`
statement follows from convergence in measure and convergence of the integrals (§4.4, §5.4).

*Needs:* §2.5, §4.4, §5.1, §5.3, §5.4; Mathlib `MeasureTheory.tendstoInMeasure_of_tendsto_eLpNorm`,
`MeasureTheory.TendstoInMeasure.exists_seq_tendsto_ae`.

**Checks.**

- Compact support `q = q_T₀`: for `T ≥ T₀` the bound is `0` and `(q_T)⌃* = q⌃*`.
- `q(s) = (1 + s)^{−1}` (square-integrable, not integrable): `‖q‖²_{L²(T,∞)} = 1/(1 + T)`, so
  `‖q⌃* − (q_T)⌃*‖²_{L²} ≤ 4π/(1 + T)`.
- Convergence in `L²(ℝ)` does not give convergence at a given point; the pointwise statement, at almost
  every resonance-free point, is §9.6.

### 5.6 Elementary rules of the non-linear Fourier transform

Prove, for square-integrable `q` and `z ∈ ℂ₊`: translation `(q^{t₀})⌃ = e^{2izt₀} q⌃` for `t₀ ≥ 0`;
modulation `(q e^{2iξ·})⌃(z) = q⌃(z + ξ)` for `ξ ∈ ℝ`; dilation `(λ q(λ·))⌃(z) = q⌃(z/λ)` for `λ > 0`;
for real potentials `q⌃(−conj z) = conj q⌃(z)` and `q⌃*(−x) = conj q⌃*(x)` almost everywhere; and the
first-order approximation: for `q` integrable on `[0, ∞)` with `L = ∫₀^∞ |q|`,
`|q⌃(z) − ∫₀^∞ q(s) e^{2izs} ds| ≤ sinh L − L + L(cosh L − 1)` on the closed half-plane, where at real
`x` the linear term is `𝓕(q · 1_{[0,∞)})(−x/π)` with Mathlib's `𝓕` (poltoratski2024 line 561–567;
taothiele2012 Lecture 1 Lemma 1 (5), (7) line 225–240 and line 210–220 for the discrete model). Route:
§4.1's rules pass to the limit; the first-order bound combines §4.2 with `|1/a − 1| ≤ |a − 1|` from §4.3.

*Needs:* §4.1, §4.2, §4.3, §5.1, §5.2; Mathlib `Real.fourier_real_eq`.

**Checks.**

- For `q(s) = 0.4 cos 5s + 0.3i` on `[0, 1]` (`L ≈ 0.4006`, bound `≈ 0.0434`) the first-order errors at
  `z = 0.5 + 0.2i`, `−2` and `1.5i` are `0.0084`, `0.0096` and `0.0011`.
- Fourier convention: `e^{2ixs} = e^{−2πi s w}` exactly when `w = −x/π`; the frequency `−2x` corresponds to
  the kernel `e^{−ixs}` and is wrong for Mathlib's transform.
- Translation and Plancherel: `|e^{2ixt₀}| = 1` on `ℝ`, so `∫ −log(1 − |q⌃*|²)` is translation invariant,
  matching `‖q^{t₀}‖ = ‖q‖`.
- Real `q = 1_{[0,1]}` at `z = 0`: `q⌃(0) = tanh 1`, real, as the reflection rule requires.

### Examples

- `q = c 1_{[0,T]}`: from §4.1's constant-coefficient solution, `b(T, x) = e^{ixT} c sin(κT)/κ` and
  `a(T, x) = e^{ixT}(cos κT − ix sin(κT)/κ)` with `κ = √(x² − |c|²)`, so
  `q⌃*(x) = c sin κT/(κ cos κT − ix sin κT)`; at `x = 0` this is `(c/|c|) tanh(|c|T)`.
- `q(s) = (1 + s)^{−1}`: square-integrable, not integrable; `q⌃` is defined by §5.2 and its truncations
  converge in `L²(ℝ)` at the rate of §5.5.

### Dependencies

Layer 2 (§2.2, §2.4, §2.5, §2.8), Layer 4; Tau Ceti (Young's inequality); Mathlib (locally uniform limits of
holomorphic functions, convergence in measure, the Fourier kernel).

## Layer 6: de Branges spaces, Weyl functions and spectral measures

### 6.1 The de Branges space of a Hermite–Biehler function

For a Hermite–Biehler `E` define `B(E)` as the set of entire `F` with `F/E` and `F#/E` in `H²(ℂ₊)`, with
`‖F‖²_{B(E)} = ‖F/E‖²_{H²}`, which is `∫ |F(x)/E(x)|² dx` when `E` has no real zeros
(poltoratski2024 line 209–235; mauth2022 line 490–524; debranges1968 §19, waived). Its API:

- `B(E)` is a Hilbert space and `F ↦ F#` is an isometric involution of it.
- Point evaluations are bounded, with reproducing kernel
  `K(w, z) = (E(z) conj E(w) − E#(z) conj E#(w))/(2πi(conj w − z))` (continuous extension at `z = conj w`),
  and for `E = A − iC` with `A, C` real entire,
  `K(w, z) = (A(z) conj C(w) − C(z) conj A(w))/(π(conj w − z))` (mauth2022 Lemma 20 line 735; romanov2014
  Theorem 5 and (18), line 812–821).
- `‖K(w, ·)‖² = K(w, w) = sup{|F(w)|² : ‖F‖_{B(E)} ≤ 1}` (poltoratski2024 (2.4) line 245–249; mauth2022
  Lemma 12 line 509).
- Route for the kernel: the `H²` Cauchy formulas of §2.6 applied to `F/E` at `w` and to `F#/E` at
  `conj w`.

*Needs:* §2.6, §3.3 (definition of Hermite–Biehler).

**Checks.**

- `E = e^{−itz}`: `B(E) = PW_t` with the `L²(ℝ)` norm and `K(w, z) = sin(t(z − conj w))/(π(z − conj w))`.
- `E(z) = z + i`: `B(E)` is the constants, `‖1‖² = ∫ dx/(1 + x²) = π`, and the formula gives
  `K(w, z) = 2i(conj w − z)/(2πi(conj w − z)) = 1/π`, with `‖1/π‖² = 1/π = K(w, w)`.
- `E = 1` is not Hermite–Biehler (`|E#| = |E|`), and the kernel formula degenerates to `0/0`.

### 6.2 The de Branges spaces of a Dirac system

Let `t > 0`. Prove that `B(E(t, ·)) = PW_t` and `B(Ẽ(t, ·)) = PW_t` as sets, with
`e^{−∫₀ᵗ|q|} ‖F‖_{L²} ≤ ‖F‖_{B(E(t,·))} ≤ e^{∫₀ᵗ|q|} ‖F‖_{L²}`, and that the reproducing kernels are
`K_t(w, z) = (1/π) ∫₀ᵗ Θ(s, w)* Θ(s, z) ds` and `K̃_t(w, z) = (1/π) ∫₀ᵗ Φ(s, w)* Φ(s, z) ds`
(poltoratski2024 line 269–285; mauth2022 Lemma 18 line 659–691; romanov2014 Theorem 5 (16) line 812).
Route: `e^{itz}E = a + b` and `|a + b| ≥ |a| − |b| ≥ 1/(|a| + |b|) ≥ 1/(2 cosh ∫₀ᵗ|q|)` on the closed
half-plane (§4.2–§4.3), so `F/E = e^{itz}F/(a + b) ∈ H²(ℂ₊)` for `F ∈ PW_t`; conversely
`e^{itz}F = (a + b)(F/E) ∈ H²(ℂ₊)` and likewise in `ℂ₋`, so §2.7 gives `F ∈ PW_t`; the kernel is §3.2's
identity divided by `π`.

*Needs:* §2.7, §3.2, §3.3, §4.1–§4.3, §6.1.

**Checks.**

- Free case: `B(E(t, ·)) = PW_t` isometrically, `K_t(x, x) = (1/π)∫₀ᵗ (cos² + sin²) = t/π`, the sinc value.
- Real constant `f = c`: at `x = 0`, `|E(t, 0)| = e^{ct}`, so the weight `|E(t, x)|^{−2}` is `e^{−2ct}` there,
  inside the stated bounds `e^{∓2ct}`.
- `t = 0`: `E = 1` is not Hermite–Biehler and `PW_0 = {0}`; the statement is for `t > 0`.

### 6.3 The isometric chain

Prove that for `0 < s ≤ t` and `F ∈ PW_s`, `‖F‖_{B(E(t,·))} = ‖F‖_{B(E(s,·))}`, and the same for `Ẽ`
(poltoratski2024 line 255–262; romanov2014 §8 Theorem 16 line 2283 by an operator-theoretic route).
Route: fix `x ∈ ℝ`. The map `r ↦ E(r, x)` is absolutely continuous on `[s, t]` (§1.2, applied to
`Θ(·, x)` and followed by the linear map `(u, v) ↦ u − iv`), and `|E(r, x)| ≥ c = e^{−∫₀ᵗ|q|}` there (§3.2).
So `r ↦ |E(r, x)|^{−2}`, which is `E(·, x)` followed by the Lipschitz map `w ↦ max(|w|, c)^{−2}`, is
absolutely continuous on `[s, t]` (Mathlib `LipschitzWith.comp_absolutelyContinuousOnInterval`), with
derivative `−2 Re(q(r)/E(r, x)²)` at almost every `r` (§3.2). Mathlib
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` gives, for every `x`,
`|E(t, x)|^{−2} − |E(s, x)|^{−2} = −2∫_s^t Re(q(r)/E(r, x)²) dr`. Multiply by `|F(x)|² = F(x)F#(x)` and
integrate over `ℝ`. The integrand is bounded by `2|F(x)|²|q(r)| e^{2∫₀ʳ|q|}`, which is integrable on
`[s, t] × ℝ`, so the two integrals may be exchanged (Mathlib `MeasureTheory.intervalIntegral_integral_swap`):
`‖F‖²_{B(E(t,·))} − ‖F‖²_{B(E(s,·))} = −2∫_s^t Re(q(r) ∫ (F/E(r, ·))(F#/E(r, ·)) dx) dr`. For every
`r ∈ [s, t]`, `F ∈ PW_s ⊆ PW_r`, so `F/E(r, ·)` and `F#/E(r, ·)` lie in `H²(ℂ₊)` (§6.2) and the inner
integral vanishes by the product law of §2.6. The same argument with `Ẽ`, which satisfies the same
equation and the same bounds (§3.2), gives the identity for `Ẽ`.

*Needs:* §1.2, §2.6, §3.2, §6.2; Mathlib `LipschitzWith.comp_absolutelyContinuousOnInterval`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `MeasureTheory.intervalIntegral_integral_swap`.

**Checks.**

- The time derivative of the norm cannot be taken under the integral at every `t`: for `q = 1_{[0,1]}` and
  `x = 0`, `|E(t, 0)|^{−2} = e^{−2 min(t, 1)}` has one-sided derivatives `−2e^{−2}` and `0` at `t = 1`. The
  integrated identity holds there: `e^{−2t} − e^{−2s} = −2∫_s^t e^{−2r} dr` for `0 ≤ s ≤ t ≤ 1`, and both
  sides are constant in `t` beyond `1`, where `q = 0`.
- For real constant `f = c` and `x = 0` the weights differ: `|E(t, 0)|^{−2} = e^{−2ct} ≠ e^{−2cs}`; only the
  integrals against `|F|²`, `F ∈ PW_s`, agree.
- For `q = 0` on `(s, t)` the weights coincide, since `∂ₜ log|E(t, x)| = 0` there.
- The reproducing kernel `K_s(w, ·)` lies in `B(E(t, ·))` with norm `K_s(w, w)^{1/2}`, which is at most
  `K_t(w, w)^{1/2}`, consistent with `K_t(w, w) − K_s(w, w) = (1/π)∫_s^t |Θ(r, w)|² dr ≥ 0`.

### 6.4 The Weyl function

For `z ∈ ℂ₊` and `t ≥ 0` define the Weyl disc
`D_t(z) = {w ∈ ℂ : Im z ∫₀ᵗ |Φ(s, z) + wΘ(s, z)|² ds ≤ Im w}` and the Weyl function `m(z)` as the
point of `⋂_t D_t(z)` (romanov2014 §8 Theorem 15 line 2217–2261, Lemma 23 line 2370; remling2018,
Ch. 2, waived). Its API:

- For `t > 0`, `D_t(z)` is a closed disc of radius `1/(2 Im z ∫₀ᵗ |Θ(s, z)|² ds)`, decreasing in `t`.
  Writing `(u, v) = Φ(t, z) + wΘ(t, z)`, its boundary circle consists of the `w` with `u/v ∈ ℝ ∪ {∞}`,
  among them `−D(t, z)/C(t, z)` and `−B(t, z)/A(t, z)` (`A(t, z)` and `C(t, z)` do not vanish, since
  `Im(conj A(t, z) · C(t, z)) = Im z ∫₀ᵗ |Θ(s, z)|² ds > 0`), while `−Ẽ(t, z)/E(t, z)`, the point where
  `u − iv` vanishes, lies in its interior. Equivalently,
  `D_t(z) = {w : |Ẽ(t, z) + wE(t, z)| ≤ |Ẽ#(t, z) + wE#(t, z)|}`.
- Limit point: `∫₀^∞ |Θ(s, z)|² ds = ∞` for `z ∈ ℂ₊`, so the intersection is a single point.
- `m(z)` is the unique `w` with `Φ(·, z) + wΘ(·, z) ∈ L²(ℝ₊; ℂ²)`.
- Compact support: if `q = 0` almost everywhere on `(T, ∞)` for some `T ≥ 0`, then `m = −Ẽ(T, ·)/E(T, ·)` on
  `ℂ₊`. Beyond `T` the system is free, so `E(t, z) = e^{−i(t−T)z} E(T, z)` and likewise for `Ẽ` (§3.2), and for
  `t ≥ T` the solution `(u, v) = Φ + wΘ` has `(u − iv)(t) = e^{−i(t−T)z}(Ẽ(T, z) + wE(T, z))`, of modulus growing
  like `e^{(t−T) Im z}` unless it vanishes, and `(u + iv)(t) = e^{i(t−T)z}(Ẽ#(T, z) + wE#(T, z))`, which decays.
  As `|u|² + |v|² = (|u − iv|² + |u + iv|²)/2`, `Φ + wΘ` is square-integrable exactly when
  `Ẽ(T, z) + wE(T, z) = 0`, and `E(T, z) ≠ 0` on `ℂ₊` (§3.3).
- `m` is holomorphic on `ℂ₊` with `Im m > 0`, and `−Ẽ(t, ·)/E(t, ·) → m` locally uniformly on `ℂ₊`, with
  error at most twice the radius.
- The Dirichlet Weyl function is `−1/m = lim E(t, ·)/Ẽ(t, ·)`.
- Route: `Im(conj u · v)` of `Φ + wΘ` at time `t` is `−Im w + Im z ∫₀ᵗ|Φ + wΘ|²` by the
  Christoffel–Darboux identity; nesting is monotonicity in `t`; since `A, B, C, D` are real entire (§3.1),
  `(u − iv)(t) = Ẽ(t, z) + wE(t, z)` and `(u + iv)(t) = Ẽ#(t, z) + wE#(t, z)`, and
  `Im(conj u · v) = (|u − iv|² − |u + iv|²)/4` gives the second description, a disc because
  `|E(t, z)| > |E#(t, z)|` (§3.3); `u − iv` vanishes at `w = −Ẽ/E`, where `u + iv ≠ 0` because
  `(u, v) ≠ 0`, so that point lies inside the disc. Limit point: if `Θ(·, z₀) ∈ L²` for some `z₀ ∈ ℂ₊`,
  then `Φ(·, z₀) ∈ L²` as well, since `Φ + wΘ` is square-integrable for `w` in `⋂_t D_t(z₀)`, which is
  nonempty as a decreasing family of closed discs. But `det M(t, z₀) = 1` (§3.1) and the Cauchy–Schwarz
  inequality in `ℂ²` give `1 = |A D − B C| ≤ |Θ(t, z₀)| |Φ(t, z₀)|` for every `t ≥ 0`, while the right side is
  integrable on `[0, ∞)` by the Cauchy–Schwarz inequality in `L²`, a contradiction. Uniqueness of `m(z)`: if
  `Φ + wΘ` and `Φ + w′Θ` are square-integrable with `w ≠ w′`, so is `Θ`.

*Needs:* §3.1, §3.2, §3.3; Mathlib `TendstoLocallyUniformlyOn.differentiableOn`.

**Checks.**

- Free case: `−Ẽ/E = i` for every `t`, `m = i`, and `Φ + iΘ = (i e^{itz}, e^{itz})` is square-integrable on
  `ℝ₊` for `z ∈ ℂ₊`; the radius is `1/sinh(2t Im z) → 0`. Under the dictionary of the Conventions this is
  the limit-point case of OperatorTheory/UnboundedOperators §4.8 at `λ = −z ∈ ℂ₋`: the square-integrable
  solutions are the multiples of `(i e^{itz}, e^{itz})`, while `Φ − iΘ = (−i e^{−itz}, e^{−itz})` grows like
  `e^{t Im z}`.
- `−Ẽ/E` is interior, not a boundary point. Free case, `t = 1.7`, `z = 0.6 + 0.25i`: at `w = −Ẽ/E = i`,
  `Im z ∫₀ᵗ |Φ + iΘ|² = 1 − e^{−2t Im z} = 1 − e^{−0.85} ≈ 0.5726 < 1 = Im i`; the disc is
  `|w − i| ≤ e^{−2t Im z} |w + i|`, with centre `i coth(0.85) ≈ 1.4470i` and radius `1/sinh(0.85) ≈ 1.0459`,
  at distance `0.4470` from `i`, while `−D/C = −cot(tz)`, where `v = 0`, lies on the circle. For the smooth
  complex potential of §3.1 at the same `t` and `z`, `w₀ = −Ẽ/E ≈ 0.3468 + 0.7493i` has
  `Im z ∫₀ᵗ |Φ + w₀Θ|² ≈ 0.4541 < Im w₀`, and the disc `|Ẽ + wE| ≤ |Ẽ# + wE#|` has radius `≈ 0.6538`,
  equal to the stated radius, with `−D/C` and `−B/A` on its circle. A description with `−Ẽ/E` on the
  boundary would force equality in both instances.
- On `ℝ`, `Im(−Ẽ(t, x)/E(t, x)) = 1/|E(t, x)|²` by `det M = 1`; for the smooth complex potential of §3.1
  at `x = 0.7`, both sides are `0.983136`, and `Im(E/Ẽ) = 1/|Ẽ|² = 0.838119`.
- Compact support, computed: in the free case the formula gives `−Ẽ(T, ·)/E(T, ·) = i = m` for every `T`. For
  `f = 1` on `[0, 1]`, zero afterwards, at `z = i` it gives `m(i) = i/(1 + √2 tanh √2) ≈ 0.443190i`; with this
  `w`, `u − iv` vanishes at `t = 1` and `∫₀^∞ |Φ + wΘ|² = Im m(i)/Im z ≈ 0.443190` (`≈ 0.401791` on `[0, 1]` and
  `|u + iv|²/4 ≈ 0.041399` on the free tail), while `w = m(i) + 0.01` leaves `|u − iv| ≈ 0.0491` at `t = 1`, so
  the solution grows like `e^{t−1}`. The boundary points `−D(1, i)/C(1, i) ≈ 0.591892i` and
  `−B(1, i)/A(1, i) ≈ 0.385819i` of `D_1(i)`, the ends of a diameter of length `≈ 0.206073`, are not `m(i)`.

### 6.5 Spectral measures

Define the Neumann spectral measure `μ_q` as the Poisson-finite measure of §2.2 for the positive harmonic
function `Im m`, so that `Im m = β Im z + P[μ_q]` with `β ≥ 0`, and the Dirichlet spectral measure `μ̃_q`
likewise for `Im(−1/m)`; write `μ = w dx + μ_s` and `μ̃ = w̃ dx + μ̃_s` (poltoratski2024 line 255–264;
mauth2022 line 692–701; romanov2014 line 2275–2281). Equivalently, `(Re m(i), β, μ_q/π)` is the triple of
`m` in AutomorphicSpectralTheory §0.5, so `m(z) = Re m(i) + βz + (1/π)∫ ((x − z)⁻¹ − x/(1 + x²)) dμ_q(x)`.
Since `−Ẽ(t, ·)/E(t, ·) → m` (§6.4) and the pair `(β, μ_q)` of a nonnegative harmonic function is unique
(§2.2), `μ_q` is characterised as the Poisson-finite measure for which, for some `β`,
`Im(−Ẽ(t, z)/E(t, z)) → β Im z + P[μ_q](z)` as `t → ∞` at every `z ∈ ℂ₊`; this is
`IsSpectralMeasureOf` in `Suggested.lean`, applied to the Weyl approximants `−Ẽ(t, ·)/E(t, ·)` for `μ_q`
and `E(t, ·)/Ẽ(t, ·)` for `μ̃_q`. Prove that both measures exist for every potential
(`exists_isSpectralMeasureOf`). Its API:

- `w(x) = Im m(x + i0)` and `w̃(x) = Im(−1/m)(x + i0) = w(x)/|m(x + i0)|²` at almost every `x` where the
  nontangential limit `m(x + i0)` exists and is finite and nonzero (§2.4); hence `w w̃ ≤ 1` almost
  everywhere.
- Compact support: if `q = 0` on `(T, ∞)` then `β = 0`, `μ_q = dx/|E(T, x)|²` and `μ̃_q = dx/|Ẽ(T, x)|²`.
- Free case: `μ = μ̃ = dx`.
- `μ_q` and `μ̃_q` are determined by `m`, which depends only on `q` on `[0, ∞)`.
- Sign of the potential: `m_{−q} = −1/m_q`, because `−Ẽ_{−q}/E_{−q} = E_q/Ẽ_q` (§3.2), whose limit is the
  Dirichlet Weyl function `−1/m_q` of §6.4; hence `μ_{−q} = μ̃_q`, `μ̃_{−q} = μ_q` and `w_{−q} = w̃_q`.
- Truncations: let `C = TauCeti.boundaryCayley`, let `μ_T = dx/|E(T, ·)|²` be the Neumann spectral measure of
  the truncation `q_T` (compact-support bullet) and `m_T = −Ẽ(T, ·)/E(T, ·)` its Weyl function (§6.4), and
  on Mathlib's `Circle`, written `X`, let `ν_T = C_*(μ_T/(π(1 + x²)))` and `ν = C_*(μ_q/(π(1 + x²))) + β δ₁`. Then
  `m(z) = Re m(i) + i H_ν((z − i)/(z + i))` on `ℂ₊`, where `H_ν(ξ) = ∫ (ζ + ξ)/(ζ − ξ) dν(ζ)` is the Herglotz
  transform, and likewise `m_T(z) = Re m_T(i) + i H_{ν_T}((z − i)/(z + i))`; the masses satisfy
  `ν_T(X) = Im m_T(i) → Im m(i) = ν(X)`; and `ν_T → ν` weakly on the circle as `T → ∞`. Route: the identity
  is Tau Ceti `TauCeti.I_mul_herglotzTransform_cayley_eq` for `ν`, whose atom at `1` is `β` and whose Cayley
  pushforward is `μ_q/(π(1 + x²))`, compared with the representation above through
  `(1 + xz)/(x − z) = (1 + x²)((x − z)⁻¹ − x/(1 + x²))`; the masses are `H(0)` (Tau Ceti
  `MeasureTheory.Measure.herglotzTransform_zero`), the value at `z = i`. Since `m_T → m` locally uniformly on
  `ℂ₊` (§6.4), `H_{ν_T} → H_ν` uniformly on `|ξ| = 1/2`. For `k ≥ 1` the coefficient of `ξᵏ` in `H_ν(ξ)` is
  `2∫ ζ̄ᵏ dν(ζ)`, so every Fourier coefficient of `ν_T` tends to that of `ν`. The masses are bounded and the
  trigonometric polynomials are dense in the continuous functions on the circle (Mathlib
  `span_fourier_closure_eq_top`, carried to `Circle` by `AddCircle.homeomorphCircle'`), so `∫ g dν_T → ∫ g dν`
  for every continuous `g`, which is weak convergence (Mathlib
  `MeasureTheory.FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto`).

*Needs:* §2.2, §2.4, §2.5, §3.2, §6.4; AutomorphicSpectralTheory §0.5; Tau Ceti `TauCeti.boundaryCayley`,
`MeasureTheory.Measure.herglotzTransform`, `MeasureTheory.Measure.herglotzTransform_zero`,
`TauCeti.I_mul_herglotzTransform_cayley_eq`; Mathlib `span_fourier_closure_eq_top`,
`AddCircle.homeomorphCircle'`, `MeasureTheory.FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto`.

**Checks.**

- Free case: `m = i`, `Im m ≡ 1 = P[dx]`, `μ = dx`, `β = 0`.
- Real constant `f = c` on `[0, T]`, zero afterwards, at `x = 0`: `m(0) = −Ẽ(T, 0)/E(T, 0) = i e^{−2cT}`, so
  `w(0) = e^{−2cT}`, `w̃(0) = e^{2cT}` and `w w̃ = 1` there; the inequality `w w̃ ≤ 1` is strict exactly where
  `Re m(x + i0) ≠ 0`.
- A constant potential on all of `[0, ∞)`, `f ≡ c > 0`, has `w = 0` on `(−c, c)` (exponentially growing and
  decaying real solutions), so `μ` is not equivalent to Lebesgue measure without a decay hypothesis.
- Truncations, free case: `μ_T = dx` and `ν_T = C_*(dx/(π(1 + x²)))`, normalised arc length, for every `T`;
  `H_{ν_T} ≡ 1`, so `m_T = i`, and the mass is `1 = Im i`.
- Truncations, masses: for `f ≡ 1` on `[0, ∞)` the Weyl function is `m(z) = (1 + iκ)/z` with `κ = √(z² − 1)`,
  `Im κ > 0`, so `Im m(i) = √2 − 1 ≈ 0.414214`; the masses `Im m_T(i)` are `0.537329`, `0.443190`, `0.415910`,
  `0.414219` at `T = 0.5, 1, 2, 4`.
- Truncations, weak and not pointwise: for the same `f ≡ 1` at `x = 2`, the density `1/|E(T, 2)|²` oscillates
  in `T` between `1/2` and `3/2` with period `π/√3` and has no limit, while the limit density is
  `w(2) = Im m(2 + i0) = √3/2 ≈ 0.866025`, its mean over a period. Convergence of the densities is not part
  of the statement and fails.
- Sign of the potential, the second Check for `−c`: `m_{−c}(0) = i e^{2cT} = −1/(i e^{−2cT})`, so
  `w_{−c}(0) = e^{2cT} = w̃_c(0)`; the relation `m_{−q} = m_q` would give `e^{−2cT}`, and `m_{−q} = −m_q` a
  negative imaginary part.

### 6.6 The isometric embedding and uniqueness of the spectral measure

Prove that for every `t > 0` and `F ∈ PW_t`, `∫ |F|² dμ_q = ‖F‖²_{B(E(t,·))}` and
`∫ |F|² dμ̃_q = ‖F‖²_{B(Ẽ(t,·))}`, and that `μ_q` is the only Poisson-finite measure with the first property
for all `t > 0` (poltoratski2024 line 255–262; romanov2014 §8 Theorem 16 line 2283–2363;
debranges1968 §§19–23 and remling2018 Ch. 3, waived). With `‖F‖²_{B(E(t,·))} = ∫ |F(x)/E(t, x)|² dx`
(§6.1, `E(t, ·)` has no real zeros), these are `spectralMeasure_isometry` and `spectralMeasure_unique` in
`Suggested.lean`. Route: the measures `μ_T = dx/|E(T, ·)|²` of the
truncations `q_T` (§6.5) have Cayley images `C_*(μ_T/(π(1 + x²)))` that converge weakly on the circle to
`C_*(μ/(π(1 + x²))) + β δ₁` (truncation bullet of §6.5); for `F ∈ PW_t` with `zF ∈ PW_t`, `(1 + x²)|F(x)|² → 0` at `±∞`, so
`∫|F|² dμ_T → ∫|F|² dμ`, while `∫|F|² dμ_T = ‖F‖²_{B(E(t,·))}` for `T ≥ t` by §6.3; such `F` are dense in
`PW_t` (§2.7), and Cauchy sequences in `B(E(t, ·))` are Cauchy in `L²(μ)`. Uniqueness: two such measures
give equal finite measures `|k_ε|² dμ` for `k_ε(x) = sin(εx)/x`, by Mathlib
`MeasureTheory.Measure.ext_of_charFun` applied to `e^{iax}k_ε` and `k_ε`.

*Needs:* §2.1, §2.7, §6.3, §6.4, §6.5; Mathlib `MeasureTheory.Measure.ext_of_charFun`; Tau Ceti
`TauCeti.integral_circle_eq_atom_add_integral_cayleyPushforward`.

**Checks.**

- Free case: Plancherel `∫ |F|² dx = ‖F‖²_{L²}`.
- Compact support `q = q_T`: for `t ≥ T` the identity is the definition of `μ`, and for `t < T` it is §6.3.
- `2 dx` fails the identity in the free case (`∫ |F|² 2dx = 2‖F‖²`), so the normalisation of `μ` is forced.
- `t = 0`: `E(0, ·) = 1` is not Hermite–Biehler, so `B(E(0, ·))` is not defined (§6.1), and `PW_0 = {0}`; the
  statement is for `t > 0`, as in §6.2 and §6.3, and loses nothing.

### 6.7 The entropy of the Poisson measure relative to a spectral measure

Write `X` for Mathlib's `Circle`, `C = TauCeti.boundaryCayley` for the boundary Cayley map
`x ↦ (x − i)/(x + i)`, and `σ = C_*(Π/π)`, which is normalised arc length `dθ/2π`. For a Poisson-finite
measure `μ` on `ℝ` with Lebesgue decomposition `μ = w dx + μ_s` (Mathlib `MeasureTheory.Measure.rnDeriv` and
`MeasureTheory.Measure.singularPart` with respect to Lebesgue measure) and `β ≥ 0`, let
`ν_{μ,β} = C_*(μ/(π(1 + x²))) + β δ₁`, a finite measure on `X` of mass `β + (1/π)∫ dμ/(1 + x²)`. The entropy
of `σ` relative to `ν` in the sense of killipsimon2003 ((5.9) line 1812–1819, (5.10) line 1831–1834) is, in
Mathlib's terms, `S(σ | ν) = ν(X) − σ(X) − klDiv σ ν`, read as `−∞` when `klDiv σ ν = ∞`
(Mathlib `InformationTheory.klDiv`). The facts the source proves about it are in the pinned libraries:
the bound `S(σ | ν) ≤ log ν(X)` for a probability measure `σ` (killipsimon2003 Lemma 5.1 line 1836) is Mathlib
`InformationTheory.mul_log_le_klDiv` at `σ(X) = 1`; the variational formula (Theorem 5.2 line 1864) is Tau
Ceti `TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_integral_exp_sub_one` with `F = e^f`;
and the joint weak upper semicontinuity of `S` (Corollary 5.3 line 1960) is
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` together with the continuity of the total mass under
weak convergence.

Prove that `klDiv σ ν_{μ,β} = ν_{μ,β}(X) − 1 − (1/π) ∫ log w dΠ` when `w > 0` almost everywhere and
`log w ∈ L¹(Π)`, and that `klDiv σ ν_{μ,β} = ∞` otherwise; equivalently `S(σ | ν_{μ,β}) = (1/π) ∫ log w dΠ`
in `[−∞, ∞)`. Route: `log⁺ w ≤ w` and `∫ w dΠ ≤ ∫ dμ/(1 + x²) < ∞`, so the positive part of `log w` is
always `Π`-integrable; `σ` has no atoms and is equivalent to arc length, while `C_*(μ_s)` and the atom are
singular to arc length, so `σ ≪ ν_{μ,β}` exactly when `w > 0` almost everywhere, and then `dσ/dν_{μ,β}`
is `1/w` carried by `C`, `σ`-almost everywhere; changing variables along `C` gives
`∫ llr σ ν_{μ,β} dσ = −(1/π) ∫ log w dΠ`, which is finite exactly when `log w ∈ L¹(Π)`.

*Needs:* §2.1 (Poisson-finite measures and `Π`); Mathlib `InformationTheory.klDiv`, `MeasureTheory.llr`,
`MeasureTheory.Measure.rnDeriv`, `MeasureTheory.Measure.singularPart`; Tau Ceti `TauCeti.boundaryCayley`.

**Checks.**

- `σ` is arc length: the averages of `Re ζᵏ` against `C_*(Π/π)` are `1, 0, 0, 0` for `k = 0, 1, 2, 3`
  (numerically to `10⁻¹²`), as for `dθ/2π`. Free spectral measure `μ = dx`, `β = 0`: `ν = σ`, so
  `klDiv σ σ = 0` (Mathlib `InformationTheory.klDiv_self`), and the formula gives `1 − 1 − (1/π)∫ log 1 dΠ = 0`.
- `μ = 2 dx`, `β = 0`: `ν = 2σ`, `klDiv σ (2σ) = log(1/2) + 2 − 1 = 1 − log 2 ≈ 0.306853`, which the formula
  reproduces, and `S = log 2 = log ν(X)`: the equality case of the bound `klDiv σ ν ≥ ν(X) − 1 − log ν(X)`
  from `InformationTheory.mul_log_le_klDiv`. Reading `S` as `−klDiv σ ν`, without the mass correction,
  would give `log 2 − 1 ≈ −0.306853` instead.
- Point mass `μ = 0`, `β = 1`: `ν = δ₁` and `w = 0`. The set `X ∖ {1}` has `ν`-measure `0` and `σ`-measure
  `1`, so `σ` is not absolutely continuous with respect to `ν` and `klDiv σ δ₁ = ∞`
  (Mathlib `InformationTheory.klDiv_of_not_ac`), `S = −∞`. Two equal point masses, by contrast, give
  `klDiv δ₁ δ₁ = 0`, so this case needs the non-atomic first argument `σ`.
- Junk value of the logarithm: for `μ = w dx` with `w = 0` on `[0, 1]` and `w = 1` elsewhere, Mathlib's
  `Real.log 0 = 0` makes `log w` identically `0`, integrable with integral `0`, yet `σ` is not absolutely
  continuous with respect to `ν_{μ,0}` and `klDiv σ ν_{μ,0} = ∞`. The hypothesis `w > 0` almost everywhere
  is what separates the two cases.
- Rectangular barrier `f = 0.7` on `[0, 1.3]`, the instance `c = 0.7`, `T = 1.3` of the real constant
  potential on `[0, T]` of §6.5's second Check, with `μ = dx/|E(T, x)|²`,
  `T = 1.3` and `β = 0`: `ν(X) = (1/π)∫ w dΠ = Im m(i) = 0.537539` (quadrature `0.537539`). Since
  `e^{iTz}E(T, z) = a(1 + ρ)` with `a` outer (§4.4) and `|ρ| < 1` (§4.3), `log|E(T, z)| − T Im z` is the
  Poisson integral of `log|E(T, ·)|`, so `(1/π)∫ log w dΠ = 2T − 2 log|E(T, i)| = −0.918466` (quadrature
  `−0.918467`). Hence `klDiv σ ν = 0.537539 − 1 + 0.918466 = 0.456005`, above the bound
  `ν(X) − 1 − log ν(X) = 0.158293`; a sign error in the transport would make it negative.
- Semicontinuity is not continuity: `νₙ = (1 + sin nθ) dθ/2π = ν_{μₙ,0}` for `μₙ = (1 + sin(n arg C(x))) dx`
  converges weakly to `σ`, while `klDiv σ νₙ = −(1/2π)∫₀^{2π} log(1 + sin nθ) dθ = log 2 > 0 = klDiv σ σ`
  (numerically `0.693144` at `n = 3`), and the formula gives `1 − 1 − (−log 2)`. So the pinned lower
  semicontinuity cannot be improved to continuity.

### 6.8 The Szegő condition for square-integrable potentials

Let `q` be square-integrable. Prove that `∫ log w dΠ ≥ −2π log 2 − π‖q‖²` and the same for `w̃`; hence
`log w, log w̃ ∈ L¹(Π)` and `w, w̃ > 0` almost everywhere (poltoratski2024 line 263–268; mauth2022
Theorem 3 line 702–707; denisov2006 Theorem 11.1 line 3246 with the dictionary of §13). In
`Suggested.lean` this is `szego_condition`, for the density `w = dμ/dx` (Mathlib
`MeasureTheory.Measure.rnDeriv`) of either spectral measure, with `log w` integrable against `dx/(1 + x²)`.
Route: for the
truncation `q_T`, `w_T = |E(T, ·)|^{−2}` and `|E(T, x)| = |a(T, x) + b(T, x)| ≤ 2|a(T, x)|`, so
`∫ log w_T dΠ ≥ −2π log 2 − 2∫ log|a(T, x)| dx = −2π log 2 − π‖q‖²_{L²(0,T)}` by §4.4. With `σ`,
`ν_T = ν_{μ_T,0}` and `ν = ν_{μ_q,β}` as in §6.7, §6.7 gives `klDiv σ ν_T ≤ ν_T(X) − 1 + 2 log 2 + ‖q‖²`.
The measures `ν_T` converge weakly to `ν` and `ν_T(X) → ν(X)` (truncation bullet of §6.5), and Tau Ceti
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure`, with `σ` fixed, gives
`klDiv σ ν ≤ ν(X) − 1 + 2 log 2 + ‖q‖² < ∞`. By §6.7, `w > 0` almost everywhere, `log w ∈ L¹(Π)` and
`(1/π)∫ log w dΠ = ν(X) − 1 − klDiv σ ν ≥ −2 log 2 − ‖q‖²`. The Dirichlet side is the same with
`|Ẽ(T, x)| = |a(T, x) − b(T, x)| ≤ 2|a(T, x)|`.

*Needs:* §4.1, §4.4, §6.5, §6.7; Tau Ceti `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure`.

**Checks.**

- Free case: `w = 1` and `0 ≥ −2π log 2`.
- Real constant `f = c` on `[0, T]`: at `x = 0`, `log w(0) = −2cT`, and `|E(T, 0)| = e^{cT} ≤ 2|a(T, 0)| = 2 cosh cT`.
- Square-integrability is needed: `f ≡ c > 0` on `[0, ∞)` gives `w = 0` on `(−c, c)` and
  `∫ log w dΠ = −∞`.

### Examples

- For `q = c 1_{[0,T]}`, `μ = dx/|E(T, x)|²` with `|E(T, x)|² = |a + b|²` explicit from §4.1, and
  `m = −Ẽ(T, ·)/E(T, ·) = i(a − b)/(a + b)` at time `T`.
- The Sinc kernel `sin(t(z − conj w))/(π(z − conj w))` is `K_t` of the free system.

### Dependencies

Layer 1 (§1.2 for §6.3), Layer 2 (§2.1, §2.2, §2.4–§2.7), Layer 3, Layer 4 (§4.1–§4.4);
AutomorphicSpectralTheory §0.5 for §6.5; Tau Ceti (the
Herglotz transform on the circle and its Cayley identity, the boundary Cayley map and the Cayley
pushforward, the relative entropy and its lower semicontinuity); Mathlib (absolutely continuous functions
and their fundamental theorem of calculus, the exchange of an interval integral with an integral, locally
uniform limits of holomorphic functions, the Lebesgue decomposition, relative entropy, Fourier density on
the circle, weak convergence of finite measures, characteristic functions of finite measures).

## Layer 7: Meromorphic inner functions and resonances

From here on the potential is real, `q = f`.

### 7.1 Meromorphic inner functions and the phase of a Hermite–Biehler function

Call a bounded holomorphic `θ` on `ℂ₊` inner when `|θ*| = 1` almost everywhere (§2.5), and meromorphic
inner when it moreover extends to a meromorphic function on `ℂ`; for `λ ∈ ℂ₊` the Blaschke factor is
`b_λ(z) = (z − λ)/(z − conj λ)` (poltoratski2024 line 307–331; mauth2022 line 446–453). Its API:

- Representation: every meromorphic inner `θ` is `θ(z) = α e^{icz} B(z)` with `|α| = 1`, `c ≥ 0` and `B` the
  Blaschke product of the zeros `(ζₙ)` of `θ` in `ℂ₊`, counted with multiplicity: `B = ∏ₙ εₙ b_{ζₙ}` with
  `εₙ = |ζₙ² + 1|/(ζₙ² + 1)` (`εₙ = 1` if `ζₙ = i`), so that each factor is nonnegative at `i`. The zeros satisfy
  `Σₙ Im ζₙ/(1 + |ζₙ|²) < ∞` and, if there are infinitely many, `|ζₙ| → ∞`; `θ` has neither zeros nor poles on `ℝ`;
  and `|θ′(x)| = c + Σₙ 2 Im ζₙ/|x − ζₙ|²` for every `x ∈ ℝ` (poltoratski2024 line 312–321, and line 335–346 in
  the proof of Lemma 1).
- Products of meromorphic inner functions are meromorphic inner.
- For `E` Hermite–Biehler with no real zeros, `θ_E = E#/E` is meromorphic inner, and its zeros in `ℂ₊` are the
  conjugates of the zeros of `E`.
- Writing `E(x) = |E(x)| e^{−iψ(x)}` with `ψ` continuous on `ℝ`, so that `ψ = −arg E` (for `E = E(t, ·)`
  one may take `ψ = −φ(t, ·)`, the negative of the branch `φ` of §3.2), `θ_E(x) = e^{2iψ(x)}` and
  `ψ′(x) = π K(x, x)/|E(x)|² > 0`, with `K` the kernel of §6.1; hence, by the representation,
  `2ψ′(x) = |θ_E′(x)| = c + Σₙ 2 Im ζₙ/|x − ζₙ|²` for every `x ∈ ℝ`, with `(ζₙ)` the zeros of `θ_E` in `ℂ₊`.
- Route for the representation: `θθ# = 1` almost everywhere on `ℝ`, hence identically, as meromorphic
  functions; so the poles of `θ` are the points `conj ζₙ`, none is real, and the zeros of `θ ≢ 0` do not
  accumulate in `ℂ`. For the first `N` zeros the finite Blaschke product `B_N` is continuous on the closed
  half-plane, tends to a unimodular limit at `∞` and is unimodular on `ℝ`, so `θ/B_N` is bounded and
  holomorphic on `ℂ₊` with unimodular boundary values, hence bounded by `1` (`F = P[F*]`, §2.5). At a point
  `z₀` with `θ(z₀) ≠ 0` this gives `∏_{n ≤ N} |b_{ζₙ}(z₀)| ≥ |θ(z₀)| > 0` for every `N`, which is the Blaschke
  condition; with `|ζₙ| → ∞` it makes `B_N → B` locally uniformly on `ℂ` off the points `conj ζₙ`. Then
  `u = −log|θ/B|` is nonnegative and harmonic on `ℂ₊`, continuous up to `ℝ` and `0` on `ℝ`, so its measure in
  §2.2, the vague limit of `u(x + iy) dx`, is `0`, and `u = c Im z` with `c ≥ 0`; `θ/(e^{icz}B)` is then a
  holomorphic function of modulus `1`, a constant `α`. On `ℝ`, `θ′/θ = ic + Σₙ b′_{ζₙ}/b_{ζₙ}` with
  `b′_ζ(x)/b_ζ(x) = 2i Im ζ/|x − ζ|²`, and `|θ| = 1` there.

*Needs:* §2.2, §2.5, §3.3, §6.1.

**Checks.**

- `E = e^{−itz}`: `θ_E = e^{2itz}`, no zeros, `|θ_E′| = 2t = c`, and `ψ(x) = tx`, `ψ′ = t = π(t/π)/1`,
  while the branch of §3.2 is `φ(t, x) = −tx`, with `∂ₜφ = −x`.
- `E(z) = z + i`: `θ_E = (z − i)/(z + i) = b_i`, `|θ_E′(x)| = 2/(1 + x²) = 2 Im i/|x − i|²`, `c = 0`, and
  `ψ′ = 1/(1 + x²) = π(1/π)/(1 + x²)`.
- `e^{−i/z}` is inner but has an essential singularity at `0`, so it is not meromorphic inner; `e^{−iz}`
  is unbounded on `ℂ₊` (`|e^{−iz}| = e^{Im z}`), so the reflected convention `E/E#` is not inner.
- A meromorphic inner function that is no `θ_E` with `E` of order at most one: the zeros `ζₙ = √n + i/n`, `n ≥ 1`, have
  `Σ Im ζₙ/(1 + |ζₙ|²) ≤ Σ n^{−2} < ∞` and `|ζₙ| → ∞`, so their Blaschke product `B` is meromorphic inner with
  `c = 0`, and `|B′(x)| = Σₙ (2/n)/((x − √n)² + n^{−2})` converges at every real `x` (its terms are `O(n^{−2})`).
  Since `Σ |ζₙ|^{−2} = Σ n²/(n³ + 1) = ∞`, while the zeros of an entire function of order at most one have
  `Σ |α|^{−2} < ∞`, no Hermite–Biehler `E` of order at most one has `θ_E = B`; the representation, and §7.2,
  apply to `B` all the same.
- Normalisation: for `ζ = 1 + i`, `ε = √5/(1 + 2i)` and `b_ζ(i) = 1/(1 − 2i)`, so `ε b_ζ(i) = √5/5 > 0`; the
  representation of `θ = b_ζ` has `c = 0`, `B = ε b_ζ` and `α = (1 + 2i)/√5`, while `|θ′(x)| = 2/((x − 1)² + 1)` does
  not see `α`.

### 7.2 Zeros near points where the phase derivative varies

Let `θ` be meromorphic inner, `0 < ε < 1` and `x, y ∈ ℝ` with
`|θ′(x)| > (1 + ε)|θ′(y)|`. Prove that `θ` has a zero in the disc `{ζ : |ζ − x| < 3|y − x|/ε}`
(poltoratski2024 Lemma 1 line 332–360; mauth2022 Lemma 29 line 1624–1627 with radius `4|y − x|/ε` for
`0 < ε < ε₀` and a small fixed `ε₀`). Route: in the representation `|θ′| = c + Σₙ 2 Im ζₙ/|· − ζₙ|²` of §7.1
some summand satisfies the same inequality, which places `ζₙ`
inside an Apollonius circle with foci `x` and `y`: `|y − ζₙ| > √(1 + ε)|x − ζₙ|`, so
`|x − ζₙ| < |y − x|/(√(1 + ε) − 1) = (√(1 + ε) + 1)|y − x|/ε < 3|y − x|/ε` for `0 < ε < 1`.

*Needs:* §7.1.

**Checks.**

- `θ = b_i`, `x = 0`, `y = 1`: `|θ′(0)| = 2`, `|θ′(1)| = 1`, and for every `ε < 1` the disc of radius `3/ε`
  about `0` contains `i`.
- `θ = e^{2itz}`: `|θ′|` is constant, the hypothesis never holds, and `θ` has no zeros.
- `θ = b_{10i}`, `ε = 1/2`: `|θ′(0)| = 0.2`, `|θ′(5)| = 0.16` (ratio `1.25`, hypothesis fails), `|θ′(10)| = 0.1`
  (ratio `2`), and the disc of radius `60` about `0` contains `10i`.

### 7.3 Dirac inner functions and the motion of resonances

For a real potential define the Dirac inner functions `θ(t, ·) = E#(t, ·)/E(t, ·)` and
`θ̃(t, ·) = Ẽ#(t, ·)/Ẽ(t, ·)`; a resonance at time `t` is a zero of `E(t, ·)`, equivalently the conjugate
of a zero of `θ(t, ·)` (poltoratski2024 §4 line 361–468). Its API:

- For `t > 0` both are meromorphic inner (§3.3, §7.1); `θ(0, ·) = 1` and `θ̃(0, ·) = −1`; `|θ(t, x)| = 1` on `ℝ`.
- Riccati equation (4.1): `θ(t, z) = 1 + ∫₀ᵗ (2izθ + f(1 − θ²))(s, z) ds` wherever `E(s, z) ≠ 0` for
  `s ∈ [0, t]`, and likewise for `θ̃` with initial value `−1`.
- Resonance motion (4.3): if `ζ(t)` is a simple zero of `θ(t, ·)` on a time interval, then `ζ` is
  absolutely continuous with `ζ′(t) = −f(t)/∂_zθ(t, ζ(t))` almost everywhere (poltoratski2024 line 425–444).
- Route: (4.1) from §3.2; the zero is `ζ(t) = (1/2πi)∮ w ∂_wθ(t, w)/θ(t, w) dw` over a small fixed circle,
  absolutely continuous in `t`.

*Needs:* §1.6, §3.2, §3.3, §7.1.

**Checks.**

- Free case: `θ = e^{2itz}` solves `∂ₜθ = 2izθ`, with no zeros.
- Constant `f = c` at `z = 0`: `E(t, 0) = e^{ct}` is real, so `θ(t, 0) = 1` and the right side
  `f(1 − 1²) = 0` is consistent; `θ̃(t, 0) = (i e^{−ct})/(−i e^{−ct}) = −1`.
- For complex potentials the equation reads `∂ₜθ = 2izθ + conj q − qθ²`; the real form is its `g = 0` case.

### Examples

- `E(t, ·)` for `f = c 1_{[0,T]}` has infinitely many zeros in `ℂ₋`, which are the resonances of the
  rectangular barrier; `θ(t, ·)` is then a Blaschke product times `e^{iaz}`.
- `θ = b_i b_{2i}` has `|θ′(x)| = 2/(1 + x²) + 4/(4 + x²)`.

### Dependencies

Layer 1 (§1.6), Layer 2 (§2.2, §2.5), Layer 3, Layer 6 (§6.1).

## Layer 8: Universality and the approximation of Hermite–Biehler functions

The potential is real and square-integrable. Write `K(t, λ, z) = K_t(conj λ, z)` for the bilinear
reproducing kernel of `B(E(t, ·))` (§6.2), so that `K(t, λ, z) = D(t, λ, z)/(π(λ − z))` with numerator
`D(t, λ, z) = A(t, z)C(t, λ) − C(t, z)A(t, λ)`; and `Sinc(t, λ, z) = sin(t(λ − z))/(π(λ − z))`, the free
kernel, with numerator `sin(t(λ − z))` (poltoratski2024 (2.3) line 241–244 and (7.1) line 804–813;
mauth2022 line 1200). `w`, `w̃` are the densities of §6.5.

Each statement of §8.2–§8.6 is also a target for the Dirichlet data, with its own exceptional null set: with
`Φ`, `Ẽ`, the kernel `K̃_t` of §6.2, `μ̃`, `w̃`, `T̃₀`, `T̃₁`, the numerator
`D̃(t, λ, z) = B(t, z)D(t, λ) − D(t, z)B(t, λ)` and the Dirac inner function `θ̃(t, ·)` of §7.3 in place of `Θ`, `E`,
`K_t`, `μ`, `w`, `T₀`, `T₁`, `D(t, λ, z)` and `θ(t, ·)`. It is the Neumann statement for the potential `−f`, which
is again real and square-integrable. By the conjugation by `Ω` (§3.1, §3.2, §6.5), `Θ_{−f} = ΩΦ_f`, so
`K_{t,−f} = K̃_{t,f}` (`Ω` is orthogonal) and `D_{−f} = D̃_f`; `μ_{−f} = μ̃_f` and `w_{−f} = w̃_f`; and
`E_{−f} = iẼ_f`, so the sets `T₀`, `T₁` of `−f` are `T̃₀`, `T̃₁` and `θ_{−f} = −θ̃_f`. An approximation
`E_{−f} ≈ α(…)` of §8.6, with `θ_{−f} ≈ conj(α)²(…)` and `α² ∂_zθ_{−f} = (…)`, is then the approximation
`Ẽ_f ≈ α̃(…)`, `θ̃_f ≈ conj(α̃)²(…)`, `α̃² ∂_zθ̃_f = (…)` for the unimodular `α̃ = −iα`. Free case: `B = −sin tz`,
`D = cos tz` and `D̃(t, λ, z) = sin(t(λ − z))`, the free numerator, with `w̃ = 1`.

### 8.1 Boxes and resonance sets

Define, for `s ∈ ℝ` and `C > 0` (or a function `C(t) > 0`), the sets of times
`T₀(s, C) = {t > 0 : E(t, ·) has a zero in Q(s, C/t)}` and
`T₁(s, C) = {t > 0 : every zero of E(t, ·) in Q(s, C/t) has imaginary part < −1/t}`, and their analogues
`T̃₀`, `T̃₁` for `Ẽ`; and `γ(p) = √2/√(sinh 2p)` for `p > 0` (poltoratski2024 line 846–849 and
997–1001; mauth2022 line 1245–1257).

- `T₀(s, C)` and `T₁(s, C)` increase and decrease in `C` respectively, and `(0, ∞) ∖ T₀(s, C) ⊆ T₁(s, C)`.
- `γ(p)² sinh 2p = 2`, `γ(p) ~ 2e^{−p}` as `p → ∞`, and for real `a`,
  `|γ(p) sin(a + ip)|² = 2(sin²a + sinh²p)/sinh 2p` lies in `[tanh p, coth p]` and tends to `1` as
  `p → ∞`, uniformly in `a`.

*Needs:* §3.3.

**Checks.**

- Free case: `E(t, ·) = e^{−itz}` has no zeros, so `T₀(s, C) = ∅` and `T₁(s, C) = (0, ∞)`.
- `γ(1) = √2/√(sinh 2) ≈ 1.41421/1.90443 ≈ 0.7426`; and for real `a`,
  `|γ(p) sin(a + ip)|² = 2(sin²a + sinh²p)/sinh 2p`, which tends to `1` as `p → ∞` uniformly in `a`.
- A zero at `s − i/(2t)` puts `t` in `T₀(s, 1)` and outside `T₁(s, 1)`; a zero at `s − 2i/t` puts `t` in
  `T₀(s, 3) ∩ T₁(s, 3)`.

### 8.2 Universality of kernel norms

Prove that for almost every `s ∈ ℝ` and every `C > 0`,
`sup_{λ ∈ Q(s, C/t)} |w(s) K_t(λ, λ)/Sinc_t(λ, λ) − 1| → 0` as `t → ∞`, where
`K_t(λ, λ) = sup{|F(λ)|² : F ∈ PW_t, ∫|F|² dμ ≤ 1}` and
`Sinc_t(λ, λ) = sup{|F(λ)|² : F ∈ PW_t, ∫|F|² dx ≤ 1} = sinh(2t Im λ)/(2π Im λ)` (poltoratski2024 Lemma 2
line 630–727; mauth2022 Lemma 21 line 794). Route (upper bound): let `G = O_{(1/2) log w}` be the outer
function with `|G|² = w` on `ℝ` (§2.8; `log w ∈ L¹(Π)` by §6.8). Take `s` with `w(s) > 0` that is a
Lebesgue point of `√(M_1 P[|log w|])` (§2.3) and at which `G` has a nontangential limit, and multiply `G`
by a unimodular constant so that this limit is `√w(s)`. Almost every `s` qualifies: the limits exist
almost everywhere by the boundary-value bullet of §2.8, because `w dx ≤ μ` is Poisson-finite. Rescale by
`t`: `G_t(z) = G(s + z/t)` is outer with boundary modulus `√w(s + ·/t)`, by the covariance of §2.1 and the
characterisation of §2.8. A counterexample sequence `fₙ ∈ PW_1` with `∫ |fₙ|² w(s + ·/kₙ) dx ≤ 1` has
`e^{iz}fₙ ∈ H²(ℂ₊)` (§2.7). So `e^{iz}fₙ G_{kₙ} ∈ H²(ℂ₊)` with norm at most `1`, by the outer-multiplier
bullet of §2.8. A subsequence converges weakly and normally (§2.6), and §2.7's characterisation produces
an `H ∈ PW_1` violating the extremal value. Lower bound: `|Sinc(t, λ, ·)|²/‖Sinc(t, λ, ·)‖²₂` is an
approximate identity at `s`, so its `μ`-integral tends to `w(s)` at almost every `s` (§2.4), and
`Sinc(t, λ, ·)/‖·‖_μ` is a competitor.

*Needs:* §2.1, §2.3, §2.4, §2.6, §2.7, §2.8, §6.2, §6.6, §6.8.

**Checks.**

- Free case: `μ = dx`, `w ≡ 1`, `K = Sinc`, and the ratio is `1` for every `t`.
- For real `λ`, `Sinc_t(λ, λ) = t/π`, so the statement says `K_t(λ, λ) = (t/π)(1/w(s) + o(1))` uniformly for
  `|λ − s| ≤ C/t`.
- The statement fails at points with `w(s) = 0`: for `f ≡ c` (not square-integrable) and `s ∈ (−c, c)`,
  `w(s) = 0` while `K_t(s, s) > 0`.

### 8.3 `L²` proximity of kernels

Prove that for almost every `s` and every `C > 0`,
`sup_{λ ∈ Q(s, C/t)} ‖K_t(λ, ·) − Sinc_t(λ, ·)/w(s)‖²_{L²(μ)} = o(t)` (poltoratski2024 Lemma 3 line
729–751; mauth2022 Corollary 3 line 1104). Route: expand the square using the reproducing property and
the approximate-identity limit of §8.2, then use §8.2 and `Sinc_t(λ, λ) ≍ t`.

*Needs:* §8.2.

**Checks.**

- Free case: the left side is `0`.
- Scaling: `Sinc_t(λ, λ) = t/π` for real `λ`, so `o(t)` is `o(Sinc_t(λ, λ))`, the natural scale.
- The normalisation `Sinc/w(s)` is forced: with `Sinc/√w(s)` the same expansion gives
  `‖K_t(λ, ·) − Sinc_t(λ, ·)/√w(s)‖²_μ = Sinc_t(λ, λ)(1/√w(s) − 1)² + o(t)`, of order `t` unless `w(s) = 1`.

### 8.4 Uniform proximity of kernels

Prove that for almost every `s` and every `C > 0`,
`sup_{λ, z ∈ Q(s, C/t)} |K(t, λ, z) − Sinc(t, λ, z)/w(s)| = o(t)` (poltoratski2024 Lemma 4 (6.6) line
756–792; mauth2022 Lemma 22 line 1129). Route: `Δ = K(t, λ_t, ·) − Sinc(t, λ_t, ·)/w(s)` lies in `PW_t`
(§6.2, §2.7), so `e^{itz}Δ ∈ H²(ℂ₊)` (§2.7). Since `w dx ≤ μ`, §8.3 gives `∫ |Δ|² w dx ≤ ∫ |Δ|² dμ = o(t)`.
Let `G = O_{(1/2) log w}` be the outer function with `|G|² = w` on `ℝ` (§2.8, §6.8). The outer-multiplier
bullet of §2.8 then gives `F(t, ·) = e^{itz} G Δ ∈ H²(ℂ₊)` with `‖F(t, ·)‖² = ∫ |Δ|² w dx = o(t)`. Hence
`F(t, ·)` has nontangential maximal function `o(√t)` in `L²` (§2.6); choose two real points
on either side of `Q(s, C/t)` where it is `o(t)` and where `√(M_1 P[log w])` is controlled; the difference
of kernels is real entire, so the bound on the boundary of a rhombus symmetric about `ℝ` gives the bound
inside by the maximum principle.

*Needs:* §2.3, §2.6, §2.7, §2.8, §6.2, §6.8, §8.3.

**Checks.**

- Free case: the difference is `0`.
- On the diagonal `z = λ = s`: `K(t, s, s) − (t/π)/w(s) = o(t)`, consistent with §8.2.
- The difference is real entire for real `λ` because `A`, `C` are real entire (§3.1); for a complex
  `λ` the same holds for `K(t, λ, ·) − Sinc(t, λ, ·)/w(s)` and its reflection.

### 8.5 Proximity of the numerators

Prove that for almost every `s` and every `C > 0`,
`sup_{λ, z ∈ Q(s, C/t)} |D(t, λ, z) − sin(t(λ − z))/w(s)| → 0`, and that there is `C(t) → ∞` with the
same conclusion over `Q(s, C(t)/t)` (poltoratski2024 Lemma 5 (7.2) and Corollary 1 (7.3), line 814–842;
mauth2022 Corollaries 4–5 line 1205–1242). Route: multiply §8.4 by `π|λ − z| ≤ 2√2 πC/t`; a diagonal
argument over `C = 1, 2, …` gives `C(t)`.

*Needs:* §8.4.

**Checks.**

- Free case: `D = cos tz sin tλ − sin tz cos tλ = sin(t(λ − z))`, exactly.
- `λ = z`: both numerators vanish.
- Real constant `f = c` at `z = 0`, `λ` real small: `D(t, λ, 0) = A(t, 0)C(t, λ) = e^{ct}C(t, λ)`; the
  statement concerns square-integrable potentials only, and for `f ≡ c` it fails at `s = 0` because
  `w(0) = 0`.

### 8.6 Approximation near a resonance

Prove that for almost every `s` and every `D > 1` with `T₀(s, D)` unbounded there is `C(t) > D`,
`C(t) → ∞`, such that: if `z(t) = x(t) − iy(t)` is a choice of zeros of `E(t, ·)` in
`Q(s, C(t)/t)` for `t ∈ T₀(s, C)`, then there are unimodular `α(s, t)`, continuous in `t` where the choice
is, with `sup_{z ∈ Q(s, C(t)/t)} |E(t, z) − α(s, t) γ(t y(t)) sin(t(z − z(t)))/√w(s)| → 0` as `t → ∞` in
`T₀(s, C) ∩ {t y(t) > 1}`, uniformly in the choice of the zeros, and with error `o(γ(t y(t)))` without the
restriction `t y(t) > 1`; and,
equivalently for the Dirac inner function on `Q₊(s, C(t)/t) = Q(s, C(t)/t) ∩ ℂ₊`,
`sup |θ(t, z) − conj(α)² sin(t(z − conj z(t)))/sin(t(z − z(t)))| → 0`, with the derivative relation at the
zero `conj z(t)` of `θ(t, ·)`: `α² ∂_zθ(t, conj z(t)) = (1 + o(1)) t/sin(2it y(t))` (poltoratski2024 Lemma 6
and Corollary 2, line 850–917,
Remark 3 line 863; mauth2022 Lemma 23 line 1258 and Lemma 32 line 1765). Route: `E(t, z(t)) = 0` gives
`A(t, z(t)) = iC(t, z(t)) = β`, so `D(t, ·, z(t)) = iβE(t, ·)`, since
`D(t, λ, z(t)) = βC(t, λ) + iβA(t, λ)`, and §8.5 makes `iβE` close to `sin(t(· − z(t)))/w(s)`. At
`λ = conj z(t)` the reality of `A` and `C` gives `E(t, conj z(t)) = 2 conj β`, so `D(t, conj z(t), z(t)) = 2i|β|²`
and the diagonal of the kernel is `K_t(z(t), z(t)) = |β|²/(π y(t))`; §8.2, with `C(t)` growing slowly enough
for its error to tend to `0` on `Q(s, C(t)/t)` (the diagonal argument of §8.5), gives
`2|β|²w(s) = (1 + o(1)) sinh(2t y(t))`, a relative error at every height `t y(t) ∈ (0, C(t)]`, consistent
with the determinant identity (2.2). The error of §8.5 is a
supremum over the box, and `sinh(2t y(t)) > sinh 2` when `t y(t) > 1`, so no estimate depends on which zero is
chosen; continuity enters only through `β`, hence `α`.

*Needs:* §3.2, §6.2, §7.3, §8.1, §8.2, §8.5.

**Checks.**

- The normalisation: `|γ(p) sin(t(x − z(t)))|` with `t(x − x(t)) = a` real equals
  `(2(sin²a + sinh²p)/sinh 2p)^{1/2}` with `p = t y(t)`, between `γ(p) sinh p` and `γ(p) cosh p`, and tends to
  `1` as `p → ∞`, matching `|E(t, x)| ≈ 1/√w(s)` away from resonances.
- Determinant consistency: with `E ≈ αγ(p) sin(t(z − z₀))/√w` and `Ẽ ≈ αγ(p) cos(t(z − z̃₀))/√w̃`, where
  `z₀ = x₀ − ip/t` and `z̃₀ = x̃₀ − ip/t` have the height `p/t` of the factor `γ(p)`, the quantity
  `E Ẽ# − Ẽ E#` equals `2i` exactly when `cos(t(x̃₀ − x₀)) = √(w w̃)` (computed in §9.2); at a common height
  `p′/t ≠ p/t` it is `2i sinh 2p′/sinh 2p` under the same relation (§8.9).
- Free case: `T₀ = ∅` and the statement is vacuous.

### 8.7 Approximation away from resonances

Prove (poltoratski2024 Corollary 3 line 1002–1012 and the argument of line 918–996; mauth2022
Corollary 6 line 1397–1408): (1) for almost every `s` there are `C(t) → ∞` and `z(t) = x(t) − iy(t) ∈ ℂ₋`
with `sup_{z ∈ Q(s, C(t)/t)} |E(t, z) − α(s, t) γ(t y(t)) sin(t(z − z(t)))/√w(s)| → 0` as `t → ∞` in
`T₁(s, C)`, `|α| = 1`, where for `t ∈ T₀(s, C)` the point `z(t)` can be any zero of `E(t, ·)` in
`Q(s, C(t)/t)`, uniformly in the choice, and for `t ∉ T₀(s, C)` one can take `t y(t) = 2C(t)`; the same
function `C(t)` gives the approximation of `Ẽ(t, ·)` of this form, with `w̃(s)`, `T̃₀(s, C)` and `T̃₁(s, C)` in
place of `w(s)`, `T₀(s, C)` and `T₁(s, C)`, and so does every smaller function tending to infinity; (2) if
the approximation of `E` in (1) holds at `s` for a function `C(t) → ∞` and `t ∉ T₀(s, C(t))` for all large `t`,
then for every `D > 0`,
`sup_{z ∈ Q(s, D/t)} |E(t, z) + iα(s, t) e^{−itz}/√w(s)| → 0`; (3) for almost every `s`: if `T₀(s, K)` is
bounded for every `K > 0`, then for every `D > 0` there are unimodular `α(s, t)` with
`sup_{z ∈ Q(s, D/t)} |E(t, z) + iα(s, t) e^{−itz}/√w(s)| → 0` as `t → ∞`.

Route, the two-term form. Fix `s` where §8.5 holds and `w(s) > 0`, write `η_C(t)` for the error of §8.5 on
`Q(s, C/t)`, and let `C ≥ 3`. Two values `ω₁`, `ω₂ = ω₁ + π/(2t)` of the second argument in `ℝ ∩ Q(s, C/t)`
define a real matrix `M = M(t)` by `(A(t, ω_j), C(t, ω_j)) = M(cos tω_j, sin tω_j)/√w(s)`, and §8.5 gives
`det M = 1 + O(η_C)` and `(A(t, z), C(t, z)) = M(cos tz, sin tz)/√w(s) + O(‖M‖e^{C}η_C)` on `Q(s, C/t)`, where
`|cos tz|, |sin tz| ≤ e^{C}`. So `E(t, ·)` is within `O(‖M‖e^{C}η_C)` of `T(z) = a e^{−itz} + b e^{itz}` with
`|a| = (σ₁ + σ₂)/(2√w(s))` and `|b| = (σ₁ − σ₂)/(2√w(s))` for the singular values `σ₁ ≥ σ₂` of `M`; in particular
`|a|² − |b|² = det M/w(s)` and `‖M‖ ≤ 2√w(s)|a|`. §8.5 alone does not bound `M` (last Check); a box free of
zeros does. If `b ≠ 0`, the zeros `ζ` of `T` lie at the height `P/t`, `e^{2P} = |a|/|b|`, spaced `π/t` apart,
and `T(z) = −2i a e^{−itζ} sin(t(z − ζ))`, so `|T| ≥ 2 sin(1/2)|a|e^{−P}` on the circle of radius `1/(2t)` about
`ζ` (`sin(1/2) = 0.4794` is the minimum of `|sin|` on `|τ| = 1/2`). If `P ≤ C − 1/2`, one of these circles lies
in `Q(s, C/t)`, and once `e^{2C}η_C` is small Rouché's theorem gives a zero of `E(t, ·)` inside it. Hence, if
`Q(s, C/t)` holds no zero of `E(t, ·)` and `e^{2C}η_C` is small: `P > C − 1/2` (with `P = ∞` when `b = 0`), so
`σ₂/σ₁ ≥ (1 − e^{1−2C})/(1 + e^{1−2C})` and `M` is within `O(e^{1−2C} + η_C)` of a rotation;
`|a|²w(s) = 1 + O(η_C + e^{2−4C})`; and `|E(t, z) − a e^{−itz}| = O(e^{C}η_C + e^{1−C})` on `Q(s, C/t)`. On such
a box with `C ≥ 4π`, `(A(t, x), C(t, x))` has modulus in `[1/(2√w), 2/√w]` and makes more than a full turn on
`ℝ ∩ Q(s, C/t)`, of length `2C/t ≥ 8π/t`, while one turn takes `2π/t`; choosing `x₀`, `x₁` there with
`C(t, x₀) = 0 < A(t, x₀) = c₁` and `A(t, x₁) = 0 < C(t, x₁) = c₂`, and `x₂ = x₁ − π/(2t)`, §8.5 gives
`C(t, z) ≈ sin(t(z − x₀))/(c₁w)` and `A(t, z) ≈ cos(t(z − x₂))/(c₂w)`, so
`E ≈ cos(t(z − x₂))/(c₂w) − i sin(t(z − x₀))/(c₁w)`, with `c₁c₂w = cos(t(x₂ − x₀)) + o(1)`.

Route of (1). Take `C(t) → ∞` no larger than a function as in §8.6 and with `e^{2C(t)}η_{C(t)}(t) → 0`, by a
diagonal argument over constant box sizes (`η_K(t) → 0` for each constant `K`, §8.5); where `T₀(s, D)` is
bounded for every constant `D`, so that §8.6 does not apply, let `C(t)` grow so slowly that `T₀(s, C)` is
bounded. Every smaller function tending to infinity keeps these properties, so the minimum of the
functions for `E` and for `Ẽ` serves both. For `t ∈ T₀(s, C) ∩ T₁(s, C)` every zero of `E(t, ·)` in `Q(s, C/t)`
lies in the box of §8.6 below the height `−1/t`, and §8.6 gives the approximation with it, uniformly in the
choice. For `t ∉ T₀(s, C)` the two-term form gives `E(t, ·)` within `o(1)` of `(a/|a|) e^{−itz}/√w(s)` on all of
`Q(s, C/t)`, and `γ(2C) sin(t(z − u) + 2iC) = i e^{−it(z − u)} + O(e^{−3C})` there, so (1) holds with
`z(t) = u − 2iC(t)/t` for any real `u` and `α = −i e^{−itu} a/|a|`. For `Ẽ` the same argument runs with the
Dirichlet forms of §8.5 and §8.6 (introduction of this layer), that is, for the potential `−f`.

Route of (3), with constant boxes: at an `s` where §8.5 holds and `w(s) > 0`, fix `δ > 0`, let `ε > 0` be
such that every two-term form allowed by the route (`c₁`, `c₂` within the bounds it gives and
`c₁c₂w = cos(t(x₂ − x₀))`, so that `cos(t(x₂ − x₀))` is bounded below by a positive constant) whose parameters are `δ`-far from
`t(x₂ − x₀) ∈ 2πℤ`, `c₁ = c₂` has phase derivative varying by a factor more than `1 + 2ε` on
`J_t = (s − 4π/t, s + 4π/t)`, and take `K ≥ max(D, 4π + 24π/ε)`. For large `t` the box `Q(s, K/t)`
contains no zero of `E(t, ·)` and §8.5 on it gives the two-term form there; a phase derivative of `E` varying by
the factor `1 + ε` on `J_t` would give, by §7.2, a zero within `24π/(εt)` of `J_t`, hence in `Q(s, K/t)`. So
the parameters are `δ`-close, `E` is within `O(δe^D) + o(1)` of `e^{itx₀} e^{−itz}/√w(s)` on `Q(s, D/t)`, and
`δ` is arbitrary: `α = ie^{itx₀}`.

*Needs:* §3.2, §6.5, §7.2, §8.1, §8.5, §8.6; Tau Ceti `TauCeti.rouche_exists_eq_zero_iff` (Rouché's theorem).

**Checks.**

- Free case: `E = e^{−itz}` and `w = 1`, so (2) and (3) hold exactly with `α = i`:
  `e^{−itz} + i·i·e^{−itz} = 0`; in the route `M` is the identity, `a = 1`, `b = 0`, and at `s = 0`, with
  `C ≥ 4π`, one may take `x₀ = x₂ = 0`, `x₁ = π/(2t)` and `c₁ = c₂ = 1`; the two-term form is
  `cos tz − i sin tz = e^{−itz}` (with `−cos` in its first term it would be `−e^{itz}` instead).
- (3) is not a consequence of the statements (1) and (2): they allow the function `C(t) = √t` in (1) together
  with zeros of `E(t, ·)` at `s + (log t)/t − i/(2t)`. These satisfy the hypothesis of (3), since they leave
  `Q(s, K/t)` for `t > e^K`, but they lie in `Q(s, √t/t)` above the height `−1/t` (`log t < √t`), so no large
  `t` is in `T₁(s, C)`: (1) gives no approximation and the hypothesis of (2) fails. The route of (3) reaches
  its contradiction inside `Q(s, K/t)` with `K` constant, whatever the function of (1) is.
- With `A = t(z − x)` and `p = t y`, `γ(p) sin(A + ip) = i e^{−iA}(1 + O(e^{2|Im A| − 2p}))`, and
  `|Im A| ≤ D` on `Q(s, D/t)`; so (1) passes into (2), with `α` replaced by a unimodular multiple, when
  `t y(t) → ∞`.
- At a point `s` with `w(s) = 0` the normalisation `1/√w(s)` is undefined; for square-integrable `f` such
  points form a null set (§6.8), which is why the statement holds almost everywhere and not everywhere.
- §8.5 does not fix the two-term form. With `w(s) = 1`,
  `E(z) = 2 cos tz − (i/2) sin tz = 1.25 e^{−itz} + 0.75 e^{itz}` (`M = diag(2, 1/2)`, `|a|² − |b|² = 1`) satisfies the relation of §8.5 exactly, `D(t, λ, z) = sin(t(λ − z))`.
  Its zeros are `((k + 1/2)π − 0.2554 i)/t` with `0.2554 = ½ log(5/3)`, and the minimum of `|E|` on the circle of
  radius `1/(2t)` about `(π/2 − 0.2554 i)/t` is `0.9284 = 2 sin(1/2) · 1.25 · e^{−0.2554}`, the bound of the route.
  At that zero it differs by `e^{−0.2554} = 0.7746` from every `κ e^{−itz}` with `|κ| = 1`. For `C ≥ 2` the zero lies
  in `Q(0, C/t)` above the height `−1/t`, so every `t` is in `T₀(0, C)` and not in `T₁(0, C)`, and (1) claims
  nothing: it is the absence of zeros, through Rouché's theorem, that brings `M` close to a rotation.

### 8.8 Joint approximation of `E` and `Ẽ`

Prove that for almost every `s` there is `C(t) → ∞` such that for every `t ∈ T₁(s, C) ∩ T̃₁(s, C)` there
are `z(t) = u(t) − ip(t)`, `z̃(t) = ũ(t) − ip(t)` with `p(t) > 0`, where for `t ∈ T₀(s, C)` the point `z(t)` can
be any zero of `E(t, ·)` in `Q(s, C(t)/t)`, and a unimodular `α(t)` with
`sup_{Q(s, C(t)/t)} |E(t, z) − α γ(tp) sin(t(z − z(t)))/√w(s)| → 0`,
`sup_{Q(s, C(t)/t)} |Ẽ(t, z) − α γ(tp) cos(t(z − z̃(t)))/√w̃(s)| → 0`, uniformly in the choice of that zero,
`p(t) > C(t)/t` for `t ∉ T₀(s, C)`, `p(t) ≤ C(t)/t` for `t ∈ T₀(s, C)`, and `cos(t(ũ(t) − u(t))) = √(w(s) w̃(s))`
(poltoratski2024 Lemma 7 line 1028–1097, (8.1); mauth2022 Lemma 43 line 3140). Route: take `C(t)` no larger
than a common function of §8.7(1) for `E` and `Ẽ` and with `e^{3C(t)}(η_{C(t)}(t) + η̃_{C(t)}(t)) → 0`, by the
diagonal argument of §8.7, where `η_C` is the error of §8.5 on `Q(s, C/t)` and `η̃_C` the error of its Dirichlet
form (introduction of this layer), for `D̃` and `w̃`. Let `t ∈ T₁(s, C) ∩ T̃₁(s, C)` be large. On `Q(s, C/t)`, where
`|e^{∓itz}| ≤ e^C`, `E(t, ·)` is within `O(e^Cη_C)` of a form `T = a e^{−itz} + b e^{itz}`: for `t ∈ T₀(s, C)`
the form of §8.6 at the chosen zero `z(t)` (its route gives this error, because
`2|β|²w(s) = sinh(2tp) + O(η_C)` with `tp > 1`), otherwise the two-term form of §8.7's route; in both cases
`|a|² − |b|² = (1 + O(η_C))/w(s)` and `|b| < e^{−2}|a|`. Likewise `Ẽ(t, ·)` is within `O(e^Cη̃_C)` of a form
`T̃ = ã e^{−itz} + b̃ e^{itz}` with `|ã|² − |b̃|² = (1 + O(η̃_C))/w̃(s)`. Forms whose coefficients differ by
`o(e^{−C})` differ by `o(1)` on the box, and no bound below depends on the chosen zero. On `ℝ ∩ Q(s, C/t)`,
which contains a period `π/t` of `e^{2itx}`, the determinant identity (2.2) reads `Im(E conj Ẽ) = 1`, so
`Im(T conj T̃) = 1 + O(e^C(η_C + η̃_C))` there. Its mean against `e^{2itx}` over a period is
`(a conj b̃ − conj(b) ã)/(2i)`, hence `conj(b̃)/ã = conj(b)/a + o(e^{−2C})`. For `t ∈ T₀(s, C)` write
`T = α γ(tp) sin(t(z − (u − ip)))/√w(s)` with `z(t) = u − ip`, so that `conj(b)/a = conj(α)² e^{−2tp}`; for
every real `ũ` the form `α γ(tp) cos(t(z − (ũ − ip)))/√w̃(s)` has the same ratio and `|ã|² − |b̃|² = 1/w̃(s)`,
and choosing `ũ` by the argument of `ã/α` puts its coefficients within `o(e^{−2C})` of those of `T̃`. For
`t ∉ T₀(s, C)` the ratio `|b/a|` is below `e^{1−2C}` (§8.7's route), so the `e^{itz}` terms of `T` and `T̃`
are `O(e^{1−C})` on the box, and both forms are replaced by forms of height `p(t) = 2C(t)/t`, with `α`, `u`
and `ũ` read from the arguments of `a` and `ã`. In both cases the mean of `Im(T conj T̃)` over a period gives
`cos(t(ũ − u))/√(w w̃) = 1 + O(e^C(η_C + η̃_C) + e^{2−4C})`; since `√(w w̃) ≤ 1` (§6.5), a move of `tũ` by
`O((e^C(η_C + η̃_C) + e^{2−4C})^{1/2}) = o(e^{−C})` makes the cosine relation exact.

*Needs:* §3.2, §6.5, §8.1, §8.5, §8.6, §8.7.

**Checks.**

- `√(w w̃) ≤ 1` (§6.5), so an angle with the required cosine exists; at the point `x = 0` of the
  compactly supported example of §6.5, `w w̃ = 1` and `ũ − u ∈ (2π/t)ℤ`.
- The exact computation of §9.2 shows that the two approximants satisfy `EẼ# − ẼE# = 2i` identically in
  `z ∈ ℝ` under the cosine relation (numerically `2i` for `w = 0.7`, `w̃ = 0.9`).
- The relation is forced: for the two approximants with `t(ũ − u) = Φ`, the determinant on `ℝ` is
  `γ(p)² cos Φ sin(2ip)/√(w w̃) = 2i cos Φ/√(w w̃)`; with `ũ = u` and `w w̃ = 0.63` it is `≈ 2.52i ≠ 2i`.
- The common height comes from (2.2), not from the separate approximations. If `E(t, ·)` has no zero in
  `Q(s, C/t)` while the approximant of `Ẽ(t, ·)` had its zero at the height `−√C/t`, moving that height to the
  one of `E` would change it at the bottom of the box by about `e^{C − 2√C}` (`e⁸ ≈ 2981` at `C = 16`); the
  oscillating part of (2.2) excludes this, since it forces `e^C |b̃/ã| ≤ e^{1−C} + o(1)`.
- At a point with `w w̃ = 1` the cosine relation sits at the maximum of the cosine, so an error `ε` in the
  constant part moves `t(ũ − u)` by about `√(2ε)` (`0.0014142` for `ε = 10⁻⁶`), not by `O(ε)`; hence the
  route asks `e^{3C}(η_C + η̃_C) → 0` rather than `e^{2C}(η_C + η̃_C) → 0`.

### 8.9 Matching at the point

Let `s ∈ ℝ`, let `w, w̃ > 0` be numbers and let `C > 1`. Prove that there are `ε₀ > 0` and `D`, depending
only on `C`, `w` and `w̃`, with the following property. Let `t > 0` and let `E`, `Ẽ` be entire functions with
`E(s) conj Ẽ(s) − Ẽ(s) conj E(s) = 2i`, the determinant identity (2.2) of §3.2 at the real point `s`. Suppose that for some
`0 < ε < ε₀`, some `x, x̃, y ∈ ℝ` with `1 < ty < 2C`, `−π/2 < t(x̃ − x) < π/2` and `cos(t(x̃ − x)) = √(w w̃)`,
and some unimodular `α`, both `sup_{z ∈ Q(s, 3C/t)} |E(z) − α γ(ty) sin(t(z − (x − iy)))/√w| < ε` and
`sup_{z ∈ Q(s, 3C/t)} |Ẽ(z) − α γ(ty) cos(t(z − (x̃ − iy)))/√w̃| < ε`. Then there are `x′, x̃′, y′ ∈ ℝ` and a
unimodular `α′` with `|tx′ − tx| + |tx̃′ − tx̃| + |ty′ − ty| + |α′ − α| < Dε`, `x̃′ − x′ = x̃ − x`, and exactly
`E(s) = α′ γ(ty′) sin(t(s − (x′ − iy′)))/√w` and `Ẽ(s) = α′ γ(ty′) cos(t(s − (x̃′ − iy′)))/√w̃`
(poltoratski2024 Lemma 8 line 1116–1172 and mauth2022 Lemma 45 line 3251–3298, which print the factor
`γ(ty)` in (8.5) and (58); the third Check shows that (2.2) forces `γ(ty′)`). §9.3 applies it to
`E = E(t, ·)` and `Ẽ = Ẽ(t, ·)`, which satisfy (2.2) on `ℝ` (§3.2), at the points `p` of `ℝ ∩ Q(s, C/2ⁿ⁺¹)`,
keeping the numbers `w = w(s)` and `w̃ = w̃(s)`, for the points `s` where `w(s) w̃(s) > 0`, which are almost
all `s` by §6.8. Route: the quotient
`g(z) = sin(t(z − (x − iy)))/cos(t(z − (x̃ − iy)))` has `g′(z) = t cos(t(x̃ − x))/cos²(t(z − (x̃ − iy)))`, of
modulus at least `t √(w w̃)/cosh²(5C)` on `Q(s, 3C/t)`, so it attains the value `√(w/w̃) E(s)/Ẽ(s)` at a point
`a` with `|a − s| ≤ D₂ε/t` (on the disc of radius `c/t` about `s`, with `c` depending only on `C`, `w`, `w̃`,
`|g′ − g′(s)| ≤ |g′(s)|/2` because `|g″| ≲ t²` there, so `g` maps the disc of radius `r ≤ c/t` about `s` onto a
set containing the disc of radius `|g′(s)| r/2` about `g(s)`, and the value is within `O(ε)` of `g(s)`); put
`x′ = x − Re(a − s)`, `x̃′ = x̃ − Re(a − s)` and `y′ = y + Im(a − s)`. Then
`E(s) = κ sin(t(s − (x′ − iy′)))/√w` and `Ẽ(s) = κ cos(t(s − (x̃′ − iy′)))/√w̃` for one `κ ∈ ℂ`, and (2.2) at
`s` gives `|κ|² sinh(2ty′) = 2`, that is `|κ| = γ(ty′)`.

*Needs:* §8.1; Mathlib `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse` (the quantitative
inverse function theorem) with `ContinuousLinearEquiv.toNonlinearRightInverse`, and
`Convex.norm_image_sub_le_of_norm_fderiv_le'` (the mean value inequality) for its hypothesis; for the
application, §3.2 and §6.8.

**Checks.**

- If the approximations are exact at `s`, the conclusion holds with `x′ = x`, `x̃′ = x̃`, `y′ = y`, `α′ = α`.
- The constraint `1 < ty < 2C` keeps the quotient holomorphic near `s` (no zero of the cosine within `1/(2t)`
  of `ℝ ∩ Q(s, 3C/t)`).
- Moduli: two forms `κ sin(t(s − (x′ − iy′)))/√w` and `κ cos(t(s − (x̃′ − iy′)))/√w̃` with
  `cos(t(x̃′ − x′)) = √(w w̃)` have determinant `E conj Ẽ − Ẽ conj E = i|κ|² sinh(2ty′)` at the real point `s`, so
  (2.2) fixes `|κ| = γ(ty′)`. With the factor `γ(ty)` printed in the sources and `y′ ≠ y` it is
  `2i sinh(2ty′)/sinh(2ty)`, not `2i`: for `w = 0.7`, `w̃ = 0.9`, `t = 1`, `s = 0`, `ty = 1.5` it is `2.0820i`
  at `ty′ = 1.52` and `2.4448i` at `ty′ = 1.6`, while the factor `γ(ty′)` gives `2i` in both cases.
- The factor `γ(ty)` cannot be kept: with it, (2.2) forces `y′ = y`, and only `x′` and `arg α′` remain to match
  the three real parameters of `(E(s), Ẽ(s))`. In the setting of the previous Check take for `E(s)`, `Ẽ(s)` the
  forms with `x = 0.3`, height `1.52` and factor `γ(1.52)`; they satisfy (2.2) and differ by `0.0023` and
  `0.0020` from the forms with `x = 0.3`, height `1.5` and factor `γ(1.5)`. The conclusion holds exactly with
  `x′ = 0.3`, `y′ = 1.52`, `α′ = 1`, whereas at height `1.5` with factor `γ(1.5)` no real `x′` matches both
  moduli (the larger of the two modulus errors is at least `0.0012`).

### Examples

- For `f = c 1_{[0,T]}`, `E(t, ·) = e^{−i(t−T)z} E(T, ·)` for `t ≥ T` (the free equation), so the resonances
  are the fixed zeros of `E(T, ·)`. The compact box `Q(s, C/T)`, which contains `Q(s, C/t)` for `t ≥ T`, holds
  at most finitely many of them, all at positive distance from `ℝ`; hence `T₀(s, C)` is bounded for every `s` and `C`,
  and the conclusion of §8.7(3) holds at every `s`, with `w = |E(T, ·)|^{−2}` (§6.5): on `Q(s, D/t)`,
  `E(t, z) = e^{−itz} e^{iTz} E(T, z)` and `e^{iTz} E(T, z) = e^{iTs} E(T, s) + O(1/t)`.

### Dependencies

Layer 2 (§2.1, §2.3, §2.4, §2.6–§2.8), Layer 3, Layer 6, Layer 7; Mathlib (the quantitative inverse function
theorem, the mean value inequality); Tau Ceti (Rouché's theorem).

## Layer 9: Pointwise convergence of the non-linear Fourier transform

The potential is real and square-integrable. Locators in this layer are to arXiv version 14 of
poltoratski2024 (References).

### 9.1 Scattering data of subintervals

For `0 ≤ t₁ ≤ t₂` define the transfer matrix `M_{t₁→t₂} = M(t₂, ·) M(t₁, ·)^{−1}` and its Hermite–Biehler and
scattering functions `E_{t₁→t₂}`, `Ẽ_{t₁→t₂}`, `a_{t₁→t₂}`, `b_{t₁→t₂}` as those of the potential
`f(t₁ + ·) 1_{[0, t₂ − t₁]}` at time `t₂ − t₁` (poltoratski2024 line 1183–1210). Its API:

- `M_{t₁→t₂}` is the fundamental matrix of `f(t₁ + ·)` at time `t₂ − t₁` (§3.1 chain rule).
- `a_{t₁→t₂} = e^{i(t₂−t₁)z}(E(t₂)Ẽ#(t₁) − Ẽ(t₂)E#(t₁))/(2i)` and
  `b_{t₁→t₂} = e^{i(t₂−t₁)z}(Ẽ(t₂)E(t₁) − E(t₂)Ẽ(t₁))/(2i)` (poltoratski2024 (9.1)–(9.3) line 1228–1319).
- `∫ log|a_{t₁→t₂}(x)| dx = (π/2) ∫_{t₁}^{t₂} f²` (§4.4; poltoratski2024 line 1209–1210).
- The non-linear Fourier transform of `f 1_{(t₁, t₂)}` is `e^{2izt₁} b_{t₁→t₂}/a_{t₁→t₂}` (§5.6 translation).

*Needs:* §3.1, §3.2, §4.1, §4.4, §5.6.

**Checks.**

- `t₁ = 0`: `E(0) = 1`, `Ẽ(0) = −i`, and the formulas reduce to `a = e^{it₂z}(E + iẼ)/2`, `b = e^{it₂z}(E − iẼ)/2`.
- `t₁ = t₂`: `a = (EẼ# − ẼE#)/(2i) = 1` by (2.2) and `b = 0`.
- Free case: `a_{t₁→t₂} = 1`, `b_{t₁→t₂} = 0`.

### 9.2 Trigonometric evaluation of subinterval data

Let `s ∈ ℝ`, `w, w̃ > 0` with `w w̃ ≤ 1`, `Φ ∈ (−π/2, π/2)` with `cos Φ = √(w w̃)`, and for `k = 1, 2` let
`t_k > 0`, `x_k ∈ ℝ`, `y_k > 0`, `|α_k| = 1` with `E(t_k, s) = α_k γ(t_k y_k) sin θ_k/√w` and
`Ẽ(t_k, s) = α_k γ(t_k y_k) cos(θ_k − Φ)/√w̃`, where `θ_k = t_k(s − x_k + iy_k)`. Put
`υ = t₁y₁`, `e = ε₁ + iε₂` with `ε₁ = t₂(s − x₂) − t₁(s − x₁)`, `ε₂ = t₂y₂ − t₁y₁`, and
`N = (sinh 2υ sinh 2(υ + ε₂))^{1/2}`. Prove the exact identities
`a_{t₁→t₂}(s) = e^{i(t₂−t₁)s} α₂ conj(α₁) sin(e + 2iυ)/(iN)`,
`b_{t₁→t₂}(s) = −e^{i(t₂−t₁)s} α₂ α₁ sin(e)/(iN)`, and hence
`(f 1_{(t₁,t₂)})⌃(s) = −e^{2ist₁} α₁² sin e/sin(e + 2iυ)` (poltoratski2024 (9.2), (9.4) and line 1253–1347).
Route: `sin A cos(B − Φ) − cos(A − Φ) sin B = cos Φ sin(A − B)` with `A = θ₂`, `B = conj θ₁` (and the
analogous identity for `b`), and `γ(p)γ(p′) = 2/(sinh 2p sinh 2p′)^{1/2}`.

*Needs:* §8.1, §9.1.

**Checks.**

- `|a|² − |b|² = (sinh²(ε₂ + 2υ) − sinh² ε₂)/N² = 1`, as SU(1,1) requires on `ℝ`; numerically, for
  `w = 0.7`, `w̃ = 0.9`, `s = 0.3`, `(t₁, x₁, y₁) = (50, 0.31, 0.03)`, `(t₂, x₂, y₂) = (60, 0.305, 0.025)`, the
  direct and closed forms agree to `10^{−15}` and `|a|² − |b|² = 1.0000000000`.
- The data at a single time satisfy (2.2): `E Ẽ# − Ẽ E# = 2i` at `s` exactly when `cos Φ = √(w w̃)`.
- `e = 0`: `b = 0` and `|a| = sinh 2υ/N = 1`; no motion of the resonance means no scattering at `s`.

### 9.3 Resonances near a point occupy little time

Prove that for almost every `s` and every `C > 0`, with `K(t)` a function `C(t)` as in §8.8 at `s`: if `ℓₙ(s)` is
the supremum of the lengths of the intervals `I ⊆ [2ⁿ, 2ⁿ⁺¹] ∩ T₁(s, K) ∩ T̃₁(s, K)` such that `E(t, ·)` has a
zero in `Q(s, C/t)` at every `t ∈ I` (and `0` when there is no such interval), then `ℓₙ(s)/2ⁿ → 0`
(poltoratski2024 Lemma 9 line 1350–1377, whose statement has no restriction to `T₁(s, K) ∩ T̃₁(s, K)`; its proof
uses (9.2), which rests on Lemma 7 and on Lemma 8, and Lemma 8 asks `1 < ty` at line 1127; mauth2022 §3.3
Corollary 7 line 1525 for the analogous half-line statement). For `C ≤ 1` and large `n` there is no such interval:
a zero in `Q(s, C/t)` then lies in `Q(s, K(t)/t)` at height at most `1/t`. Route: for large `t` we have
`K(t) ≥ 4C`, so for a time `t` of such an interval the zero of `E(t, ·)` in `Q(s, C/t)` lies in `Q(s, K(t)/t)`
below the height `−1/t`; taken as the zero `z(t)` of §8.8 it gives `1 < tp(t) ≤ C`, the range of §8.9, and the
approximations of §8.8 hold on the boxes `Q(p, 3C/t) ⊆ Q(s, K(t)/t)`, `p ∈ ℝ ∩ Q(s, C/t)`. The errors of §8.8 tend
to `0` at each `s`, not uniformly in `s`: fix `m`, and let `G_N` be the set of `s` at which, for all `t ≥ 2^N`,
`K(t) ≥ 4C` and, for `t ∈ T₁(s, K) ∩ T̃₁(s, K)`, the approximations of §8.8 hold, for every choice of the zero,
with error below a threshold `ε₁(s) > 0` that depends only on `C`, `m`, `w(s)` and `w̃(s)` and is at most the `ε₀`
of §8.9 and the margins used below. The sets `G_N` increase to a set of full measure. Let
`Zₙ = {s : ℓₙ(s) > 2ⁿ/m}` and, for `s ∈ Zₙ`, let `Iₙ(s)` be such an interval of length `> 2ⁿ/m`; for `n ≥ N`, a
set `Sₙ ⊆ Zₙ ∩ G_N` of outer measure `≳ |Zₙ ∩ G_N|/m` shares a time `t₁` in the middle thirds of the `Iₙ(s)`; put
`t₂ = t₁ + 2ⁿ/(3m)` and `J(s) = ℝ ∩ Q(s, C/2ⁿ⁺¹)`, an interval of length `C/2ⁿ`, for `s ∈ Sₙ`. The two times share
one `Φ` of §9.2. If `w w̃ = 1`, then `Φ = 0`. If `w w̃ < 1`, then `t(ũ(t) − u(t))` is `Φ₀` or `−Φ₀` modulo `2π`,
where `cos Φ₀ = √(w w̃)` and `0 < Φ₀ < π/2`; for the two forms of §8.8 with `t(ũ − u) ≡ ±Φ₀` the mean of their
quotient over `x ∈ [s, s + π/t]` is exactly `−i w(s) ± √(w/w̃) sin Φ₀`, so the mean of `Ẽ(t, x)/E(t, x)` is within
`O(ε₁(s))` of that value; this mean is continuous in `t` (§3.1, and `E(t, ·)` has no real zeros, §3.2), so the
sign in `±Φ₀` is constant on `Iₙ(s)`. §8.8 at `t₁` and `t₂`, with §8.9 applied at each `p ∈ J(s)` to the numbers
`w(s)`, `w̃(s)`, then puts the data at `p` in the form of §9.2 with increment
`e(p) = e(s) + (t₂ − t₁)(p − s) + O(Dε₁(s))`, whose real part sweeps an interval of length `C/(3m)`, up to that
error, as `p` runs over `J(s)`. There `|a_{t₁→t₂}(p)|² = 1 + (sin² Re e(p) + sinh² Im e(p))/N²`, with `N` bounded
in terms of `C` because `t₁y₁` and `t₂y₂` lie in `(1, C]` and §8.9 moves them by `O(Dε₁(s))`; so
`∫_{J(s)} log|a_{t₁→t₂}| ≥ c_{m,C} |J(s)|` with `c_{m,C} > 0`, although the integrand vanishes where `e(p) = 0`.
Since `log|a_{t₁→t₂}| ≥ 0` on `ℝ` (§4.3), a cover of `Sₙ` of index two by the `J(s)` and §9.1's Plancherel
identity give `|Zₙ ∩ G_N| ≲_{m,C} ‖f‖²_{L²(2ⁿ, 2ⁿ⁺¹)}` for `n ≥ N`, which is summable in `n`. Borel–Cantelli,
which needs no measurability, gives for each `N` that almost every `s ∈ G_N` lies in finitely many `Zₙ`, so
`lim sup ℓₙ(s)/2ⁿ ≤ 1/m` at almost every `s`, for every `m`; off the union of these null sets over
`m = 1, 2, …`, `ℓₙ(s)/2ⁿ → 0`. That null set depends on `C`, through `G_N`, `ε₁(s)` and `c_{m,C}`, and the
`C > 0` are uncountably many. The length `ℓₙ(s)` is nondecreasing in `C`: `Q(s, C/t) ⊆ Q(s, C′/t)` for
`C ≤ C′`, while `K`, `T₁(s, K)` and `T̃₁(s, K)` do not involve `C`, so every interval counted for `C` is
counted for `C′`. Hence the statement for `C = 1, 2, 3, …`, off the union of the corresponding null sets,
gives it for every `C > 0`, by comparison with `C′ = ⌈C⌉`.

*Needs:* §3.1, §3.2, §4.3, §6.8, §8.1, §8.8, §8.9, §9.1, §9.2; Mathlib Borel–Cantelli
(`MeasureTheory.measure_limsup_atTop_eq_zero`, stated for outer measures).

**Checks.**

- Compact support: the resonances are fixed (§8 Examples), so `ℓₙ(s) = 0` for large `n`.
- Summability input: `Σₙ ‖f‖²_{L²(2ⁿ, 2ⁿ⁺¹)} = ‖f‖²_{L²(1, ∞)} < ∞`.
- A resonance at fixed distance `δ` from `s` lies in `Q(s, C/t)` only for `t ≤ C/δ`, so it contributes to
  `ℓₙ(s)` only for `2ⁿ ≤ C/δ`.
- The restriction to `T₁(s, K)` is needed by the route: a zero at `s − 0.3i/t` for every `t ∈ [2ⁿ, 2ⁿ⁺¹]` lies in
  `Q(s, K(t)/t)` above the height `−1/t` once `K(t) ≥ 0.3`, so no such `t` is in `T₁(s, K)` and the zero does not
  count towards `ℓₙ(s)`; §8.9 asks `1 < ty`, and here `ty = 0.3`.
- The lower bound is for the integral only. With `υ = 1`, `Im e = 0` and `e(s) = 0`, the formula of §9.2 gives
  `log|a_{t₁→t₂}| = ½ log(1 + sin²(Re e)/sinh² 2)`: `0` at `p = s` and `≈ 0.000379` at the shift `Re e = 0.1`,
  with mean `≈ 0.000126 > 0` over shifts in `[−0.1, 0.1]`. A pointwise bound `log|a_{t₁→t₂}| ≥ c > 0` on
  `J(s)` fails at `p = s`.
- Monotonicity in `C`, used to pass from integer `C` to every `C > 0`: if for one `n` with `K ≥ 2.7` on `[2ⁿ, 2ⁿ⁺¹]`
  and every `t` there the only zero of `E(t, ·)` in `Q(s, K(t)/t)` is `s + 2.7/t − 2i/t` and `Ẽ(t, ·)` has none
  there, then every such `t` is in `T₁(s, K) ∩ T̃₁(s, K)` (height `−2/t < −1/t`), and the zero lies in `Q(s, 3/t)`
  (`2.7 ≤ 3`, `2 ≤ 3`) but not in `Q(s, 2.5/t)` (`2.7 > 2.5`): `ℓₙ(s)` is `2ⁿ` for `C = 3` and `0` for `C = 2.5`
  and for `C = 2`. So `ℓₙ(s)` does depend on `C`, and the comparison must round `C` up, never down.

### 9.4 Resonance-free points

Call `s ∈ ℝ` a resonance-free point of the real potential `f` when, for every `C > 0`, the sets of times
`T₀(s, C)` and `T̃₀(s, C)` of §8.1 are bounded: there is `T(s, C)` such that `Q(s, C/t)` contains no zero of
`E(t, ·)` and no zero of `Ẽ(t, ·)` for `t > T(s, C)`. Write `R(f)` for the set of resonance-free points
(poltoratski2024 line 97–101 and 1173–1176, where the condition for `E` at almost every point is the
property from which Theorem 1 is deduced; mauth2022 line 1893–1894, whose exceptional set
`{s : T₀(s, C) is unbounded}` is the complement of the condition for `E` at one `C`). For a fundamental
system this is `DiracFundamentalSystem.IsResonanceFree` in `Suggested.lean`. Its API:

- For `s ∈ R(f)` there is `C(t) → ∞` such that `Q(s, C(t)/t)` contains no zero of `E(t, ·)` or of `Ẽ(t, ·)`
  for all large `t`: with `T_k = max(k, T(s, 1), …, T(s, k))`, put `C(t) = k` for `T_k < t ≤ T_{k+1}`.
- `R(f) = R(−f)`: by the conjugation by `Ω` (§3.1, §3.2), `E_{−f}(t, ·) = iẼ_f(t, ·)` and
  `Ẽ_{−f}(t, ·) = −i E_f(t, ·)`, so the sets `T₀(s, C)`, `T̃₀(s, C)` of `−f` are the sets `T̃₀(s, C)`, `T₀(s, C)` of
  `f`; and the density `w_{−f}` of §6.5 is the Dirichlet density `w̃_f` (§6.5, `m_{−f} = −1/m_f`).
- If `f` vanishes on `[T₀, ∞)` for some `T₀ > 0`, then `R(f) = ℝ`: for `t ≥ T₀`,
  `E(t, ·) = e^{−i(t−T₀)z} E(T₀, ·)` and `Ẽ(t, ·) = e^{−i(t−T₀)z} Ẽ(T₀, ·)` (the free equation), whose zeros are
  the fixed zeros of `E(T₀, ·)` and `Ẽ(T₀, ·)`, all in the open lower half-plane (§3.3); the finitely many in
  the compact box `Q(s, C/T₀)`, which contains `Q(s, C/t)` for `t ≥ T₀`, lie at a distance at least some
  `δ > 0` from `ℝ`, so `Q(s, C/t)`, where `|Im z| ≤ C/t`, contains none of them for `t > max(T₀, C/δ)`.

*Needs:* §3.1, §3.2, §3.3, §6.4, §6.5, §8.1.

**Checks.**

- Free case: `E(t, ·) = e^{−itz}` and `Ẽ(t, ·) = −i e^{−itz}` have no zeros, so `R(0) = ℝ`.
- `f = c 1_{[0,T₀]}`: `E(t, ·)` has infinitely many zeros for every `t ≥ T₀` (§7 Examples), and still
  `R(f) = ℝ` by the third bullet; the condition concerns boxes of size `C/t` about `s`, not the absence of
  zeros.
- `f ≡ c > 0` (not square-integrable). With `κ = √(c² − z²)`, `E(t, z) = cosh κt + (c − iz) sinh κt/κ` and
  `Ẽ(t, z) = −i(cosh κt − (c + iz) sinh κt/κ)`; a zero of `E(t, ·)` needs
  `e^{2κt} = (c − iz − κ)/(c − iz + κ)` and a zero of `Ẽ(t, ·)` needs `e^{2κt} = (c + iz + κ)/(c + iz − κ)`. For
  `0 < |s| < c` both right sides stay bounded on `Q(s, C/t)` while `|e^{2κt}|` grows like `e^{2√(c² − s²)t}`, so
  `s ∈ R(f)`. At `s = 0` the second denominator vanishes and `Ẽ(t, ·)` has a zero near `−2ic e^{−2ct}`
  (for `c = 1`, `t = 5`: `−9.0808·10⁻⁵ i`, against `−9.0800·10⁻⁵ i`), so `0 ∉ R(f)`, while `E(t, ·)` has no
  zero near `0`: a definition through `E` alone would admit `0`. At `s = 1/2` (`c = 1`) the point is
  resonance-free while `|E(10, 1/2)| ≈ 6434` grows like `e^{(√3/2)t}`, so resonance-freeness alone does not
  give the conclusions of §9.5, which also need square integrability.
- Membership in `R(f)` is not decided by the moduli at `s` of the transforms of `f` on subintervals. For data
  in the forms of §9.2 at times `t_j < t_k`, `|(f 1_{(t_j,t_k)})⌃(s)| = |sin(θ_k − θ_j)/sin(θ_k − conj θ_j)|`,
  which is the pseudo-hyperbolic distance `|ζ_k − ζ_j|/|1 − conj ζ_j ζ_k|` of the points `ζ_k = e^{2iθ_k}` of
  the unit disc and is unchanged by every automorphism of the disc; inserting a zero interval of length `β`
  after `t₁` replaces the restriction of `f` to each subinterval by a translate, whose transform has the same
  modulus at `s` (§5.6). With `θ_k = i h_k`, the heights `1, 0.99, 0.98` (a resonance moving towards `ℝ`) and
  `1, 1.0102119, 1.0208659` (its image under the half-turn of the disc about `ζ₁`, a resonance moving away)
  give the same moduli `d₁₂ = 0.0027860`, `d₂₃ = 0.0028445`, `d₁₃ = 0.0056305` on `(t₁, t₂)`, `(t₂, t₃)`,
  `(t₁, t₃)`, and in both cases `d₁₃ = (d₁₂ + d₂₃)/(1 + d₁₂ d₂₃)`, the addition law of pseudo-hyperbolic
  distances along a geodesic.

### 9.5 Asymptotics at resonance-free points

Prove that for every real square-integrable `f` there is a Lebesgue-null set `N_f` such that for every
`s ∈ R(f) ∖ N_f` and every `D > 0` there are unimodular `α(s, t)` and a constant `β(s)` with
`Im β(s) = −√(w(s) w̃(s))`, `|β(s)| = 1`, such that `sup_{Q(s,D/t)} |E(t, z) + iα(s, t) e^{−itz}/√w(s)| → 0` and
`sup_{Q(s,D/t)} |Ẽ(t, z) + iβ(s) α(s, t) e^{−itz}/√w̃(s)| → 0`; consequently `|E(t, s)| → 1/√w(s)`,
`|Ẽ(t, s)| → 1/√w̃(s)`, `|a(t, s)|² → (1/w + 1/w̃ + 2)/4` and `|b(t, s)|² → (1/w + 1/w̃ − 2)/4` at `s`
(poltoratski2024 (9.9)–(9.10) line 1538–1574; mauth2022 line 3855–3875). Route: `N_f` is the union of the
exceptional null sets of §8.7(3) for `f` and for `−f` and of `{w w̃ = 0}` (§6.8). At `s ∈ R(f) ∖ N_f` the sets
`T₀(s, K)` are bounded for every `K > 0` (§9.4), so §8.7(3) gives the approximation of `E`; and §8.7(3) for
`−f`, whose sets `T₀(s, K)` are the sets `T̃₀(s, K)` of `f` because `E_{−f} = iẼ_f`, with `w_{−f} = w̃_f`
(§9.4), gives that of `Ẽ`. The determinant identity (2.2) on `ℝ` gives `(conj β − β)/√(w w̃) = 2i`, and
continuity of `Ẽ(t, s)/E(t, s)` in `t` makes `β` constant.

*Needs:* §3.2, §4.1, §6.5, §6.8, §8.1, §8.7, §9.4.

**Checks.**

- Free case: `w = w̃ = 1`, `α = i`, `β = −i`: `E = e^{−itz}`, `Ẽ = −i e^{−itz}`, `|a|² → 1`, `|b|² → 0`.
- `|b|² ≥ 0` in the limit: `1/w + 1/w̃ ≥ 2/√(w w̃) ≥ 2` by the arithmetic–geometric mean inequality and
  `w w̃ ≤ 1` (§6.5); and `|a|² − |b|² → 1`.
- Compact support at `x = 0` for `f = c 1_{[0,T]}`, where `R(f) = ℝ` (§9.4): `w(0) = e^{−2cT}`,
  `w̃(0) = e^{2cT}`, and the limit `|a|² = (e^{2cT} + e^{−2cT} + 2)/4 = cosh² cT` is the exact value
  `a(T, 0) = cosh cT`.

### 9.6 Pointwise convergence at resonance-free points

Prove that for every real square-integrable `f` there is a Lebesgue-null set `N′_f` containing the set `N_f` of
§9.5 such that for every `s ∈ R(f) ∖ N′_f`: `b(T, s)/a(T, s) = (f_T)⌃*(s) → f⌃*(s)` as `T → ∞`; the strong form
holds, `sup_{|z − s| < C/T} |(f_T)⌃(z) − f⌃*(s)| → 0` for every `C > 0`, where `(f_T)⌃ = b(T, ·)/a(T, ·)` is
holomorphic on the disc for large `T`; the moduli `|a(T, s)|` and `|b(T, s)|` converge; and the generalised
eigenfunction `t ↦ M(t, s)` is bounded on `[0, ∞)` (poltoratski2024 Theorem 1 line 578–586, line 54–57 and the deduction (9.9)–(9.10) line
1538–1582; mauth2022 Theorem 2 line 216 and its deduction at line 3851–3862; both deduce the theorem from the
resonance-free condition at almost every point). `Suggested.lean` states it as
`tendsto_truncation_of_isResonanceFree`, for every measurable `F` to which the truncations
`b(T, ·)/a(T, ·)` converge in `L²(ℝ)`; by §5.5 these `F` are `f⌃*` up to null sets, and "for almost every
`s` in `R(f)`" is the existence of `N′_f`. Route: §9.5 makes `b/a = (E − iẼ)/(E + iẼ)` uniformly close on
`Q(s, D/T)` to the constant `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, whose denominator has squared modulus
`1/w + 1/w̃ + 2 > 0`, so the limit exists at every `s ∈ R(f) ∖ N_f`; §5.5 gives `(f_T)⌃* → f⌃*` in `Π`-measure,
so along a sequence `T_k → ∞` almost everywhere, and `N′_f` adds to `N_f` the null set where this fails;
`|A|, |C| ≤ |E|` and `|B|, |D| ≤ |Ẽ|` on `ℝ` bound `M(t, s)`.

*Needs:* §3.2, §4.1, §5.2, §5.5, §9.4, §9.5.

**Checks.**

- `f` integrable: by §5.2 the convergence holds uniformly on `ℝ`, at every point, resonance-free or not; on
  `R(f) ∖ N′_f` the two statements agree.
- Compact support: `R(f) = ℝ` (§9.4) and `(f_T)⌃* = f⌃*` for `T ≥ T₀`, so the convergence holds at every `s`.
- Square integrability cannot be dropped at resonance-free points: for `f ≡ c > 0` the point `s = 1/2`
  (`c = 1`) lies in `R(f)` (§9.4), while `M(t, s)` grows like `e^{(√3/2)t}`.
- Free case: `f⌃ = 0`, `b(T, ·) = 0` for every `T`, and `R(0) = ℝ`.

### Examples

- For `f = c 1_{[0,T₀]}` every statement of the layer holds with the exceptional set empty: `R(f) = ℝ`, the
  resonances are fixed, `E(t, ·) = e^{−i(t−T₀)z}E(T₀, ·)` for `t ≥ T₀`, and `(f_T)⌃* = f⌃*` for `T ≥ T₀`.
- For `f(s) = (1 + s)^{−1}` (square-integrable, not integrable) §9.6 gives convergence at almost every
  resonance-free point, which §5.5 alone (`L²(ℝ)` convergence at rate `(1 + T)^{−1/2}`) does not give at any
  prescribed point.

### Dependencies

Layer 3, Layer 4, Layer 5 (§5.2, §5.5, §5.6), Layer 6 (§6.4, §6.5, §6.8), Layer 8; Mathlib (Borel–Cantelli).

## Downstream consumers

- A roadmap on one-dimensional Schrödinger and Dirac operators and their spectral types: Layer 1
  (fundamental matrices entire in the spectral parameter for `L¹_loc` coefficients), §3.3 (Hermite–Biehler
  property), §6.4–§6.6 (Weyl functions and spectral measures) and §6.8 (the Szegő condition, the Dirac form
  of Deift–Killip-type statements).
- Linear evolution equations whose coefficients are integrable but not essentially bounded in time (the
  essentially bounded case is Tau Ceti's Carathéodory theorem), and comparison arguments for linear systems
  with integrable kernels: §1.1, §1.2 and §1.7.
- A canonical-systems and de Branges-spaces roadmap (inverse spectral theory, Krein's exponential-type
  theorem, de Branges' ordering theorem): §6.1–§6.6 and Layer 3.
- Half-plane Hardy-space theory beyond this roadmap (Toeplitz and Wiener–Hopf operators on the half-line,
  the Paley–Wiener theorem in several forms): Layer 2.
- Non-linear Fourier analysis (maximal non-linear Carleson operators, the `ℓ²(ℤ)` model, AKNS and
  Zakharov–Shabat scattering) and inverse scattering: Layers 4, 5 and 9.
- A proof that almost every point is resonance-free for every real square-integrable potential, which with
  §9.6 gives convergence almost everywhere (poltoratski2024 Theorem 1): §9.1–§9.4, with Layers 7 and 8.

## References

- **poltoratski2024** — A. Poltoratski, *Pointwise convergence of the non-linear Fourier transform*, Ann.
  of Math. 199 (2024), 741–793; arXiv:2103.13349 version 14, to which the locators refer. In version 14,
  §9 argues the absence of resonances through the subinterval calculus, the insertion of zero intervals and
  Lemma 10. Version 14 has no Lemma 11, the lemma of an earlier arXiv version (cited by mnatsakanyan2022 as
  the e-print of 2021) in whose proof mnatsakanyan2022 (abstract and line 135–137 of its version 4) reports
  an error; the moduli that §9 of version 14 compares do not determine the motion of a resonance (§9.4,
  fourth Check). This roadmap uses §9 for the subinterval
  calculus, Lemma 9 and the deduction (9.9)–(9.10), and states the theorem at resonance-free points.
- **mauth2022** — L. Mauth, *On pointwise convergence of the non-linear Fourier transform*, arXiv:2210.12286
  v1; the detailed account of poltoratski2024's earlier version, used mainly for Layers 2, 3, 6, 8 and 9 (§§2,
  3.1–3.3, 3.7). Its dictionary (line 65–87) refers to that earlier version: it agrees with version 14 for
  Theorem 1, Lemmas 1–6 and Corollaries 1–2, and from there on the pairs cited here are matched by content,
  not by the dictionary (its Corollary 6, Lemma 43 and Lemma 45 are Corollary 3, Lemma 7 and Lemma 8 of
  version 14, where the dictionary lists Corollary 4, Lemma 8 and Lemma 9).
- **denisov2006** — S. A. Denisov, *Continuous analogs of polynomials orthogonal on the unit circle. Krein
  systems*, IMRS 2006, Art. ID 54517; arXiv:0908.4049 v1 (§9 Lemmas 9.1–9.2, (157)–(158); §11 Theorem
  11.1, (194); §13).
- **romanov2014** — R. Romanov, *Canonical systems and de Branges spaces*, arXiv:1408.6022 v1 (§0, §1 Example
  1, §3 Proposition 4 and Theorem 5, §8 Theorems 15–16).
- **taothiele2012** — T. Tao, C. Thiele, *Nonlinear Fourier analysis*, arXiv:1201.5129 v1 (Lecture 1 Lemmas 1
  and 3, Lecture 1 §3 Lemma 5, Lecture 2 Lemma 6), for the discrete SU(1,1) model.
- **killipsimon2003** — R. Killip, B. Simon, *Sum rules for Jacobi matrices and their applications to
  spectral theory*, Ann. of Math. 158 (2003); arXiv:math-ph/0112008 v2 (§5, (5.9), Lemma 5.1, Theorem 5.2,
  Corollary 5.3).
- **denisov2026** — S. A. Denisov, *Pointwise behavior of SU(1,1) nonlinear Fourier transform*,
  arXiv:2605.25108 v2 (§1.2, questions Q1R and Q2R and Theorem 1.4), for the status of pointwise convergence
  for square-integrable potentials.
- **mnatsakanyan2022** — G. Mnatsakanyan, *Some quantitative estimates for the nonlinear Fourier transform*,
  arXiv:2210.00309 v4 (abstract and §1).
- **garnett2007** — J. B. Garnett, *Bounded analytic functions*, GTM 236, Springer 2007 (Ch. I §§3–5, Ch. II
  §§1–4; pp. 16, 27, 30, 55, 64, 84 as cited by mauth2022), cited by locator.
- **coddingtonlevinson1955** — E. A. Coddington, N. Levinson, *Theory of ordinary differential equations*
  (Ch. 1 §7, Ch. 2 §1), cited by locator.
- **debranges1968** — L. de Branges, *Hilbert spaces of entire functions* (§§19–23), cited by locator.
- **remling2018** — C. Remling, *Spectral theory of canonical systems* (Ch. 1–3), cited by locator.
- **krein1955** — M. G. Krein, *Continuous analogues of propositions on polynomials orthogonal on the unit
  circle* (pp. 637–640), cited by locator for the continuous Szegő theory behind denisov2006 §8.
