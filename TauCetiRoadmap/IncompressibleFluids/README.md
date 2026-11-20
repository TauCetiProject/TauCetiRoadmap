# Roadmap: incompressible fluids

**Summary.** Build the mathematical theory of the incompressible Navier–Stokes and Euler
equations on the whole space, on top of Mathlib's analysis stack and the Sobolev, Fourier
multiplier, heat-kernel and semigroup material already in Tau Ceti. The equations are

`∂ₜu + (u·∇)u + ∇p = νΔu + f`, `div u = 0`, `u(0) = u₀`,

for a velocity field `u : [0,T) × E → E` and a pressure `p : [0,T) × E → ℝ` on a
finite-dimensional real inner product space `E` of dimension `d ≥ 2`, with viscosity `ν > 0`
(Navier–Stokes) or `ν = 0` and `f = 0` (Euler). The roadmap builds, in order: solenoidal
fields, the Helmholtz–Weyl decomposition and the Leray projection on `L²` and on `Lᵖ`; the
Stokes semigroup with its `Lᵖ`–`L^q` and Oseen-kernel estimates; the Ladyzhenskaya,
Gagliardo–Nirenberg, product and commutator estimates and the Aubin–Lions compactness lemma;
Leray–Hopf weak solutions with Leray's existence theorem in dimensions two and three, the
two-dimensional uniqueness and regularity theory, and Prodi–Serrin weak–strong uniqueness; mild
solutions with the Fujita–Kato and Kato theorems, their smoothing, their agreement with
Leray–Hopf solutions and Leray's blow-up rate; and the Euler equations with their conservation
laws, vorticity dynamics, the Biot–Savart law, Kato's local well-posedness in `Hˢ`, the
Beale–Kato–Majda criterion, the inviscid limit, and the two-dimensional global theory of
Wolibner and Yudovich. The roadmap is this README; `Suggested.lean` states the headline
definitions and theorems whose carriers exist at the pins.

The roadmap builds on two others and feeds one. From **PDE** it takes the scalar theory: the
weak-derivative Sobolev spaces, Calderón–Zygmund and multiplier theory with the Riesz transforms,
the heat semigroup with its smoothing estimates, and Bochner spaces with the Lions–Magenes
identity; everything vector-valued and divergence-free is built here. From
**OneParameterSemigroups** it takes strongly continuous contraction semigroups and their
generators, to which the Stokes semigroup is reduced by restriction to an invariant subspace.
**PDE, Part II** consumes Layers 1–4 for the two-dimensional stochastic Navier–Stokes equation.

## How to read the build

Each layer rests on the ones before it and on the cited suppliers. Layers 1–3 are linear and
functional-analytic and make no reference to a nonlinear equation. Layers 4 and 5 are the two
existence theories for Navier–Stokes, joined by §5.3, and Layer 6 is the Euler theory, joined
to Navier–Stokes by the inviscid limit of §6.3. Each section states what to build, then API
bullets, then **Checks**, which are explicit computations a correct implementation must
reproduce and which fix the conventions, then *Needs*. A named theorem is a milestone; the
bullets around it are part of the target and carry the same weight.

## Conventions

**Space.** `E` is a finite-dimensional real inner product space with its Borel σ-algebra and
Lebesgue measure `volume`, as in the pinned heat-kernel files; `d = Module.finrank ℝ E`.
Statements that hold for every `d ≥ 1` are stated without a dimension hypothesis, and a
dimension restriction is always an explicit hypothesis (`d = 2`, `d = 3`, `2 ≤ d`), never a
standing assumption. The dimension-specific identifications of §6.1 and the Biot–Savart
formulas of §6.2 are stated on `EuclideanSpace ℝ (Fin 2)` and `EuclideanSpace ℝ (Fin 3)`.

**Fields.** A velocity field is a function `E → E`; a time-dependent one is `ℝ → E → E` or, in
a function space, `ℝ → X`. Velocity fields are real. The gradient of `u` at `x` is the Fréchet
derivative `fderiv ℝ u x : E →L[ℝ] E`, so `(∇u)ⱼₖ = ∂ₖuⱼ` in an orthonormal basis, the
divergence is its trace, the convective term is `((u·∇)v)(x) = fderiv ℝ v x (u x)`, with components
`uₖ∂ₖvⱼ`, and `u ⊗ v` is the rank-one field with `(u ⊗ v)ⱼₖ = uⱼvₖ`. The divergence of a
matrix field is taken in the second index, `(div F)ⱼ = ∂ₖFⱼₖ`, so that
`(u·∇)v = div(v ⊗ u)` whenever `div u = 0`. Norms of matrix fields are Hilbert–Schmidt, so
`‖∇u‖²_{L²} = Σⱼₖ ‖∂ₖuⱼ‖²_{L²}`.

**Weak divergence.** For an open `Ω`, a locally integrable `u : E → E` has weak divergence
`g` on `Ω` if `∫ ⟪u, ∇φ⟫ = −∫ g φ` for every test function `φ ∈ 𝓓(Ω, ℝ)`, and is *solenoidal*
on `Ω` if this holds with `g = 0`. This is a condition on the single scalar `div u`, weaker
than the existence of the full weak derivative `TauCeti.HasWeakFDerivOn`; when the full weak
derivative `U` exists, the weak divergence is the trace of `U`. The solenoidal `L²` fields on
`E` form the closed subspace `L²_σ(E)` of `Lp E 2 volume`, and `ℙ` is the orthogonal
projection onto it. Solenoidal subspaces of other spaces are written `X_σ = X ∩ {div u = 0}`.

**Riesz transforms.** `Rⱼ` is the Riesz transform of PDE §2.3 in the direction of the
`j`-th vector of an orthonormal basis, the Fourier multiplier with symbol `−i ξⱼ/‖ξ‖`
(Grafakos, Proposition 5.1.14, (5.1.40)). Then
`RⱼRₖ` has the real even symbol `−ξⱼξₖ/‖ξ‖²` and maps real functions to real functions, and
`Σⱼ RⱼRⱼ = −1`. With these signs the Leray projection is `(ℙu)ⱼ = uⱼ + Σₖ RⱼRₖuₖ`, with symbol
`δⱼₖ − ξⱼξₖ/‖ξ‖²`, and the pressure of a field with `−Δp = ∂ⱼ∂ₖFⱼₖ` is `p = Σⱼₖ RⱼRₖFⱼₖ`.
Operators defined on complex-valued functions act on real fields through their real and
imaginary parts; every such operator used here preserves real-valuedness, and that
preservation is a target wherever it is used.

**Fourier transform and Sobolev scale.** The Fourier transform is Mathlib's, with `2π` in the
exponent, so `∂ⱼ` has symbol `2πiξⱼ` and `Δ` has symbol `−4π²‖ξ‖²`. `Hˢ(E)` is Mathlib's
Bessel-potential space `TemperedDistribution.MemSobolev s 2`, with
`J^s = (1 − (2π)⁻²Δ)^{s/2}` Mathlib's `besselPotential`; a field is in `Hˢ` when each
component is. `H¹(E)` is identified with the weak-derivative space `TauCeti.W1p` at `p = 2`
through the comparison of PDE §1.3. The homogeneous seminorm
`|u|_{Ḣˢ} = ‖ ‖2πξ‖^s û ‖_{L²}` is used only on elements of `Hˢ`, for `s ≥ 0`; no homogeneous
Sobolev space is introduced.

**Time.** Solutions live on `[0, T)` with `0 < T ≤ ∞`. `L^q(0,T; X)` is Mathlib's `Lp` of
Bochner-measurable `X`-valued functions on `Set.Ioo 0 T` with Lebesgue measure, and weak time
derivatives are the pinned `TauCeti.HasWeakLineDerivOn` on an interval. The heat semigroup with
viscosity is `e^{νtΔ}`, the pinned `TauCeti.heatSemigroup` at time `νt`.

**Solution concepts.** Every theorem names its solution concept and never identifies two of
them without proof. A *classical* solution is `C¹` in time and `C²` in space (`C¹` for Euler)
and satisfies the equations pointwise with a pressure. A *weak* solution of Navier–Stokes is
in the energy class `L^∞(0,T; L²_σ) ∩ L²(0,T; H¹)` and satisfies the equations against
solenoidal test fields; a *Leray–Hopf* solution is a weak solution satisfying the energy
inequality and attaining its initial datum strongly in `L²`. A *mild* solution satisfies the
Duhamel integral equation in a named space. A *strong* solution is a weak solution in
`L^∞(0,T; H¹) ∩ L²(0,T; H²)`. An *`Hˢ` solution* of Euler is in `C([0,T]; Hˢ) ∩ C¹([0,T]; H^{s−1})`
with `s > d/2 + 1`, hence classical. A *Yudovich* solution is a weak solution of the
two-dimensional vorticity equation with vorticity in `L^∞(0,T; L¹ ∩ L^∞)`.

**Scaling.** If `(u, p)` solves Navier–Stokes with viscosity `ν` and `f = 0`, so does
`u_λ(x,t) = λu(λx, λ²t)`, `p_λ(x,t) = λ²p(λx, λ²t)`, for every `λ > 0`. The norms
`|u₀|_{Ḣ^{d/2−1}}` and `‖u₀‖_{L^d}` are invariant under `u₀ ↦ λu₀(λ·)`; smallness conditions
are stated in these norms against `ν` and are scale-invariant. For Euler, for every `a, b > 0`, the two-parameter
family `u_{a,b}(x,t) = a u(bx, abt)`, `p_{a,b}(x,t) = a²p(bx, abt)` preserves solutions.

**Estimates.** Every estimate states how its constant depends on `d`, on the exponents, on `ν`
and on `T`. Constants named `C(d)`, `C(d,s)`, `C(p)` depend only on the displayed parameters,
and an unqualified `∃ C` is not a final statement. Estimates that degenerate as `ν → 0` say so
through an explicit power of `ν`; the estimates of §6.3 are uniform in `ν ∈ [0, 1]`.

**Labels.** The identifiers S1–S4 (Layer 1), L5–L7 (Layer 2), N8–N11 (Layer 3), W12–W15
(Layer 4), M16–M19 (Layer 5) and E20–E24 (Layer 6) appear in the section headings; consumers
cite either form.

## Layer 1: solenoidal fields and the Leray projection

### 1.1 Weak divergence and the solenoidal subspace (S1)

Define the weak divergence on an open set as in the Conventions, as a predicate on a locally
integrable field and a locally integrable scalar, with the same algebra (`add`, `neg`,
`const_smul`, `congr_ae`, `mono` in `Ω`, uniqueness almost everywhere) that the pinned
`HasWeakLineDerivOn` carries. Define the closed subspace `L²_σ(E)` of `Lp E 2 volume` of fields
solenoidal on `E`, and the solenoidal test fields `𝓓_σ(E) = ker TestFunction.divergenceCLM`.

- A `C¹` field is solenoidal exactly when the trace of its Fréchet derivative vanishes.
- A field with weak derivative `U` has weak divergence `x ↦ trace (U x)`.
- Multiplication by a `C¹` scalar: `div(χu) = χ div u + ⟪∇χ, u⟫`.
- Translation, orthogonal change of variables `u ↦ O ∘ u ∘ O⁻¹` and dilation preserve
  solenoidality; convolution with an integrable scalar kernel preserves it, so mollification
  maps `L²_σ` into smooth solenoidal fields.
- `L²_σ(E)` is closed, and `Lᵖ_σ(E)` is closed in `Lᵖ(E; E)` for `1 ≤ p ≤ ∞`.
- `𝓓_σ(E)` is dense in `L²_σ(E)`, in `H¹_σ(E)` and in `Lᵖ_σ(E)` for `1 < p < ∞`, for `d ≥ 2`.

**Checks.**

- `d = 1`: a solenoidal `L²` field on `ℝ` is almost everywhere constant, hence zero, so
  `L²_σ(ℝ) = 0`.
- `u(x₁,x₂) = (−x₂, x₁)` and the strain field `(−x₁, x₂)` have zero divergence; `u(x) = x` has
  divergence `d`.
- `u = (g(x₂), 0)` is solenoidal on `ℝ²` for every locally integrable `g`, including
  discontinuous `g`, where no weak derivative exists as a function: the weak divergence is
  weaker than `HasWeakFDerivOn`.
- `u = ∇^⊥ψ = (−∂₂ψ, ∂₁ψ)` is solenoidal for every `ψ ∈ C²(ℝ²)`.

*Needs:* Tau Ceti `TestFunction.divergenceCLM`, `HasWeakFDerivOn` and the integration-by-parts identities of
`Analysis/Sobolev/WeakDeriv/Divergence.lean`; Mathlib mollification.

### 1.2 The Helmholtz–Weyl decomposition and the Leray projection on `L²` (S2)

Define `ℙ : Lp E 2 volume →L[ℝ] Lp E 2 volume` as the orthogonal projection onto `L²_σ(E)`.
Prove the Helmholtz–Weyl decomposition: the orthogonal complement of `L²_σ(E)` is the space of
`L²` gradients, the fields `∇q` with `q` locally integrable with weak gradient in `L²`; this
space is the closure of `{∇φ : φ ∈ 𝓓(E, ℝ)}`. Every `u ∈ L²` is uniquely `ℙu + ∇q`
(Tao, Notes 1, Exercise 17, with the complement described as the curl-free fields; the symbol
of `ℙ` is Ożański–Pooley, §2.1, p. 16, the display after (2.11), which gives the Fourier
transform of `F − ∇p` as `(I − ξ⊗ξ/|ξ|²)F̂`; (2.11) itself is the Oseen kernel).

- `ℙ` is idempotent and self-adjoint with `‖ℙ‖ ≤ 1`, `ℙ∇φ = 0`, and `ℙu = u` exactly on
  `L²_σ`.
- `ℙ` commutes with translations, with convolution by integrable scalar kernels, with
  dilations and with weak derivatives, and is equivariant under orthogonal changes of
  variables.
- `ℙ` commutes with the vector heat semigroup: `ℙ e^{tΔ} = e^{tΔ} ℙ`.
- The Riesz-transform formula `(ℙu)ⱼ = uⱼ + Σₖ RⱼRₖuₖ` in every orthonormal basis, and its
  Fourier form `(ℙu)^(ξ) = û(ξ) − ⟪û(ξ), ξ⟫ξ/‖ξ‖²` for almost every `ξ`.
- `ℙ` maps `Hˢ(E; E)` to itself with norm at most `1` for every real `s`, and commutes with
  `J^s`.

**Checks.**

- For `φ ∈ 𝓓(ℝ², ℝ)` and `u = (φ, 0)`: `(ℙu)^ = (ξ₂²φ̂, −ξ₁ξ₂φ̂)/‖ξ‖²`, which is orthogonal to
  `ξ`; `(u − ℙu)^ = ξ₁φ̂ ξ/‖ξ‖²`, a gradient.
- `ℙ(∇^⊥ψ) = ∇^⊥ψ` and `ℙ(∇ψ) = 0` for `ψ ∈ 𝓓(ℝ², ℝ)`.
- `‖u‖² = ‖ℙu‖² + ‖u − ℙu‖²`; on a gradient the first term vanishes, on a solenoidal field the
  second.
- The sign of the formula: with `Rⱼ ↔ −iξⱼ/‖ξ‖`, `Σₖ R₁Rₖuₖ` for `u = (φ, 0)` has transform
  `−ξ₁²φ̂/‖ξ‖²`, and `φ̂ − ξ₁²φ̂/‖ξ‖² = ξ₂²φ̂/‖ξ‖²`, matching the first check. The opposite sign
  convention for `Rⱼ` gives the same projection; the opposite sign in front of the sum does not.

*Needs:* §1.1; Mathlib `Submodule.starProjection`; the Riesz transforms of PDE §2.3 and Tau Ceti
`Lp.fourierMultiplierCLM`.

### 1.3 The Leray projection on `Lᵖ` and the pressure operator (S3)

For `1 < p < ∞` extend `ℙ` from `L² ∩ Lᵖ` to a bounded projection on `Lᵖ(E; E)` with range
`Lᵖ_σ(E)` and kernel the closure of the test gradients, with `‖ℙ‖_{Lᵖ → Lᵖ} ≤ C(d,p)`
(Tao, Notes 2, Proposition 13, from the `Lᵖ` bounds for the Riesz transforms; the symbol
`1 − ξ ⊗ ξ/‖ξ‖²` of `ℙ` is Bedrossian–Vicol, (1.42)–(1.43)), and
prove that the `L^p` and `L^{p'}` projections are adjoint. Define the pressure operator
`Π F = Σⱼₖ RⱼRₖFⱼₖ` on matrix fields in `Lᵖ`, `1 < p < ∞`, and prove
`‖ΠF‖_p ≤ C(d,p)‖F‖_p`, `−Δ(ΠF) = ∂ⱼ∂ₖFⱼₖ` in distributions, and
`ℙ div F = div F + ∇(ΠF)` in distributions.

- `ℙ` is unbounded on `L¹` and on `L^∞`: no constant `C` has `‖ℙu‖_p ≤ C‖u‖_p` on
  `𝓓(E, E)` for `p = 1` or `p = ∞`, for `d ≥ 2`.
- For `u ∈ L² ∩ Lᵖ` the `L²` and `Lᵖ` projections agree almost everywhere.
- For `u, v ∈ L⁴(E; E)`: `Π(u ⊗ v) ∈ L²` with `‖Π(u ⊗ v)‖₂ ≤ C(d)‖u‖₄‖v‖₄`.

**Checks.**

- `F = φ · 1` (a scalar multiple of the identity matrix, `φ ∈ 𝓓`): `ΠF = Σⱼ RⱼRⱼφ = −φ`, and
  `div F = ∇φ`, so `ℙ div F = ∇φ + ∇(−φ) = 0`, as it must be for a gradient.
- `u = (φ, 0)` with `∫φ ≠ 0`: `ℙu` decays like `‖x‖^{−d}` at infinity and is not integrable,
  the failure of `L¹` boundedness.

*Needs:* §1.2; the `Lᵖ` bounds for the Riesz transforms of PDE §2.3 and the Mihlin–Hörmander theorem;
PDE §2.3.

### 1.4 Solenoidal Sobolev spaces (S4)

Define `H¹_σ(E) = H¹(E; E) ∩ L²_σ(E)` as a closed subspace of the vector-valued `H¹`, and its
dual pairing: the Gelfand triple `H¹_σ ↪ L²_σ ↪ (H¹_σ)*` is an instance of the pinned Gelfand
triple hypotheses. Prove the identity `‖∇u‖²_{L²} = ½‖∇u − (∇u)ᵀ‖²_{L²}` for `u ∈ H¹_σ(E)`,
which for `d = 2` reads `‖∇u‖₂ = ‖ω‖₂` and for `d = 3` reads `‖∇u‖₂ = ‖curl u‖₂`.

- `ℙ` maps `H¹(E; E)` onto `H¹_σ(E)` and `−ℙΔu = −Δu` on `H²_σ(E)`: on the whole space the
  Stokes operator is the Laplacian restricted to solenoidal fields.
- Integration by parts: `∫ ⟪∇q, u⟫ = 0` for `u ∈ H¹_σ` and `q ∈ H¹`, and for `u ∈ L²_σ`,
  `q` with `∇q ∈ L²`.

**Checks.**

- The identity fails without `div u = 0`: for `u = ∇φ` the right side is `0` and the left is
  `‖∇²φ‖²₂`.
- `d = 2`, `u = ∇^⊥ψ`: `ω = Δψ` and `‖∇u‖₂ = ‖∇²ψ‖₂ = ‖Δψ‖₂`, the classical `L²` identity for
  the Hessian of a test function.

*Needs:* §1.1–§1.2; Tau Ceti `W1p`; PDE §6.1.

### Examples

The acceptance examples of this layer are the vanishing of `L²_σ(ℝ)`; the discontinuous shear
`(g(x₂), 0)`; the explicit projection of `(φ, 0)`; the pressure of a scalar multiple of the
identity; and the Hessian identity for a stream function.

### Dependencies

Mathlib's projections, distributions and Fourier transform; Tau Ceti's weak derivatives,
divergence of test fields, Riesz transforms and Mihlin–Hörmander theorem.

## Layer 2: the Stokes semigroup and linear estimates

### 2.1 Off-diagonal estimates for the heat semigroup (L5)

For `1 ≤ p ≤ q ≤ ∞` with `p < ∞`, `t > 0` and `f ∈ Lᵖ(E; F)`, prove
`‖e^{tΔ}f‖_q ≤ (4πt)^{−(d/2)(1/p − 1/q)}‖f‖_p` and, for every multi-index order `k ≥ 1`,
`‖D^k e^{tΔ}f‖_q ≤ C(d,k) t^{−k/2 − (d/2)(1/p − 1/q)}‖f‖_p`. The case `q = ∞`, `k = 0` is the
pinned `eLpNorm_heatSemigroup_top_le`; the case `p = q` is PDE §6.3.

- `‖K_t‖_r = (4πt)^{−(d/2)(1 − 1/r)} r^{−d/(2r)}` for the heat kernel, `1 ≤ r ≤ ∞`.
- Young's convolution inequality `‖k ⋆ f‖_q ≤ ‖k‖_r‖f‖_p` for `1 + 1/q = 1/r + 1/p`, extending
  the pinned `norm_convolutionLp_le` (the case `r = 1`).
- For `f ∈ Lᵖ`, `p < ∞`: `t^{(d/2)(1/p − 1/q)}‖e^{tΔ}f‖_q → 0` as `t → 0⁺` when `q > p`.

**Checks.**

- `p = 1`, `q = ∞`: the bound is `(4πt)^{−d/2}‖f‖₁`, attained in the limit by an approximate
  identity, since `e^{tΔ}δ = K_t` and `‖K_t‖_∞ = (4πt)^{−d/2}`.
- `f = K_s`: `e^{tΔ}K_s = K_{t+s}` by the pinned semigroup identity, and
  `‖K_{t+s}‖_∞ = (4π(t+s))^{−d/2} ≤ (4πt)^{−d/2}‖K_s‖₁`.
- Scaling: with `f_λ = f(λ·)`, both sides of the first estimate scale by `λ^{−d/q}` when `t` is
  replaced by `t/λ²`, which fixes the exponent `(d/2)(1/p − 1/q)`.

*Needs:* Tau Ceti `heatKernel`, `heatSemigroup`, `convolutionLp`; PDE §6.3.

### 2.2 The Stokes semigroup and the Oseen kernel (L6)

`L²_σ(E)` is invariant under the vector heat semigroup. Define the Stokes semigroup
`S_ν(t) = e^{νtΔ}|_{L²_σ}` as a contraction semigroup on `L²_σ(E)`, with generator `νΔ` on the
domain `H²_σ(E)`, and likewise on `Lᵖ_σ(E)` for `1 < p < ∞`. Prove the Oseen-kernel estimate
(Ożański–Pooley, (1.13)–(1.14), pp. 11–12, for `d = 3`; Wang, Lemma 6.10, p. 53, for every
`d`; both bound the kernel of `e^{tΔ}ℙ`, of which `O_t` is the gradient):
for `t > 0` the operator `e^{tΔ}ℙ div` on matrix fields is convolution with a smooth kernel
`O_t` satisfying `|D^k O_t(x)| ≤ C(d,k)(‖x‖ + √t)^{−d−1−k}`, and consequently
`‖e^{tΔ}ℙ div F‖_q ≤ C(d) t^{−1/2 − (d/2)(1/p − 1/q)}‖F‖_p` for all `1 ≤ p ≤ q ≤ ∞`, including
the endpoints where `ℙ` alone is unbounded. Here `e^{tΔ}ℙ div F` means `O_t ⋆ F`, which is
defined for `F ∈ Lᵖ` with every `1 ≤ p ≤ ∞`; the pinned heat semigroup exists only for
`p < ∞`.

- `O_t(x) = t^{−(d+1)/2}O₁(x/√t)`.
- `S_ν(t)` is self-adjoint on `L²_σ` and `‖∇S_ν(t)u₀‖₂ ≤ (2eνt)^{−1/2}‖u₀‖₂`.
- For `u₀ ∈ L²_σ`: `∫₀^∞ ‖∇S_ν(t)u₀‖²₂ dt = ‖u₀‖²₂/(2ν)`.

**Checks.**

- The energy identity of the last bullet on the Fourier side:
  `∫₀^∞ 4π²‖ξ‖² e^{−8π²ν‖ξ‖²t} dt = 1/(2ν)` for every `ξ ≠ 0`.
- The constant `(2eνt)^{−1/2}` is `sup_{r ≥ 0} r e^{−νtr²}` evaluated at `r = (2νt)^{−1/2}`.
- Integrability of the Oseen kernel: `∫ (‖x‖ + √t)^{−d−1} dx = C(d) t^{−1/2}`, which is the
  `p = q` case of the estimate.

*Needs:* §1.2, §1.3, §2.1; Tau Ceti semigroups.

### 2.3 The linear Stokes system (L7)

For `u₀ ∈ L²_σ(E)`, `f₀ ∈ L¹(0,T; L²(E; E))` and a matrix field `F ∈ L²(0,T; L²)`, prove
existence and uniqueness in the energy class of the weak solution of
`∂ₜu − νΔu + ∇p = f₀ + div F`, `div u = 0`, `u(0) = u₀`, given by Duhamel's formula
`u(t) = S_ν(t)u₀ + ∫₀ᵗ S_ν(t−s)ℙ(f₀ + div F)(s) ds`, with `u ∈ C([0,T]; L²_σ)` and the energy
equality
`‖u(t)‖² + 2ν∫₀ᵗ‖∇u‖² = ‖u₀‖² + 2∫₀ᵗ⟪f₀, u⟫ − 2∫₀ᵗ⟪F, ∇u⟫`
(for `d = 3`, `ν = 1`, `F = 0` and `f₀ ∈ C([0,T); L²)`: Ożański–Pooley, Lemma 2.1 (iii) with
(2.7)–(2.8), p. 15, for the bound and the energy equality, and Theorem 2.5, p. 20, for
uniqueness; the estimate with both `f₀ ∈ L¹L²` and `div F`, `F ∈ L²L²`, is Tao, Notes 1,
Exercise 27, (29), stated there for the scalar heat equation with Schwartz data, and applies
to the Stokes system after `ℙ`).

- The estimate `‖u‖_{L^∞L²} + √ν‖∇u‖_{L²L²} ≤ C(‖u₀‖₂ + ‖f₀‖_{L¹L²} + ν^{−1/2}‖F‖_{L²L²})`
  with an absolute `C`.
- The pressure is `p = −ΠF + q` with `∇q = (1 − ℙ)f₀`, since `(1 − ℙ) div F = −∇(ΠF)` by §1.3.
- Maximal regularity in `L²`: for `u₀ ∈ H¹_σ`, `F = 0` and `f₀ ∈ L²(0,T; L²)`,
  `u ∈ L^∞(0,T; H¹) ∩ L²(0,T; H²)` with `∂ₜu ∈ L²(0,T; L²)`.

**Checks.**

- `f₀ = 0`, `F = 0`: the energy equality is the identity of §2.2 integrated to time `t`.
- A gradient force `f₀ = ∇φ` produces `u = S_ν(t)u₀` and changes only the pressure.

*Needs:* §2.2; Duhamel's formula of PDE §6.3 with Tau Ceti `Semigroups.IsMildSolution`, and the
Gelfand-triple identity; PDE §6.1.

### Examples

The acceptance examples of this layer are the heat-kernel norms; the scaling check of the
off-diagonal exponent; the Fourier energy identity for the Stokes semigroup; and the
gradient-force invariance of the Stokes system.

### Dependencies

Layer 1; Tau Ceti's heat kernel, heat semigroup, convolution operators and semigroup theory;
PDE §6.1 and §6.3.

## Layer 3: nonlinear estimates and compactness

### 3.1 Ladyzhenskaya and Gagliardo–Nirenberg inequalities (N8)

Prove, first for compactly supported `C¹` functions and then for `H¹(E)`:

- `d = 2`: `‖u‖⁴₄ ≤ 2‖u‖²₂‖∇u‖²₂` (Constantin–Seregin, (4.1), in the form
  `‖u‖₄² ≤ √2‖u‖₂‖∇u‖₂` for `u ∈ C_c^∞(ℝ²)`).
- `d = 3`: `‖u‖₄ ≤ C‖u‖₂^{1/4}‖∇u‖₂^{3/4}` with an absolute constant `C`.
- General `d ≥ 2`: `‖u‖_q ≤ C(d,q)‖u‖₂^{1−θ}‖∇u‖₂^{θ}` with `θ = d(1/2 − 1/q)`, for
  `2 ≤ q ≤ 2d/(d−2)` when `d ≥ 3` and `2 ≤ q < ∞` when `d = 2` (Bedrossian–Vicol,
  Theorem A.26, (A.12)–(A.13), with an unspecified constant).
- Parabolic interpolation: a function in `L^∞(0,T; L²) ∩ L²(0,T; H¹)` lies in `L^r(0,T; L^q)`
  whenever `2/r + d/q = d/2` in the same range of `q`, with the norm bounded by the product of
  the two energy norms raised to `1 − 2/r` and `2/r`. For `d = 2` this gives `L⁴((0,T) × E)`
  and for `d = 3` it gives `L^{10/3}((0,T) × E)` and `L⁴(0,T; L³)`.

**Checks.**

- The exponent `θ` is forced by the dilation `u ↦ u(λ·)`: the left side scales by `λ^{−d/q}`,
  the right by `λ^{−d(1−θ)/2 + θ(1 − d/2)}`.
- `d = 2`, `q = ∞` is excluded: `H¹(ℝ²)` contains unbounded functions, for example
  `log log(1/‖x‖)` cut off near the origin.

*Needs:* Mathlib `eLpNorm_le_eLpNorm_fderiv_of_eq`; Tau Ceti `W1p` and smooth density; PDE §1.4.

### 3.2 The convective trilinear form (N9)

Define `b(u, v, w) = ∫ ⟪(u·∇)v, w⟫` and prove, for `d ∈ {2, 3}`, that it is a bounded trilinear
form on `H¹(E; E)` with

- `d = 2`: `|b(u,v,w)| ≤ √2 ‖u‖₂^{1/2}‖∇u‖₂^{1/2}‖∇v‖₂‖w‖₂^{1/2}‖∇w‖₂^{1/2}`;
- `d = 3`: `|b(u,v,w)| ≤ C‖u‖₂^{1/4}‖∇u‖₂^{3/4}‖∇v‖₂‖w‖₂^{1/4}‖∇w‖₂^{3/4}`.

- Antisymmetry: `b(u,v,w) = −b(u,w,v)` for `u ∈ H¹_σ`, hence `b(u,v,v) = 0`.
- The divergence form `(u·∇)v = div(v ⊗ u)` in distributions for `u ∈ H¹_σ`, `v ∈ H¹`.
- The induced map `B(u,v) = ℙ(u·∇)v` from `H¹_σ × H¹_σ` to `(H¹_σ)*` with
  `‖B(u,u)‖_{(H¹_σ)*} ≤ √2‖u‖₂‖∇u‖₂` for `d = 2` and `≤ C‖u‖₂^{1/2}‖∇u‖₂^{3/2}` for `d = 3`.

**Checks.**

- `b(u, v, v) = ½∫ u·∇‖v‖² = −½∫ (div u)‖v‖²`, which vanishes exactly because `div u = 0`; for
  `u(x) = x` cut off, it does not.
- The time integrability of `B(u,u)` for `u` in the energy class: `L²(0,T; (H¹_σ)*)` for
  `d = 2` and `L^{4/3}(0,T; (H¹_σ)*)` for `d = 3`, by the exponents above.

*Needs:* §1.4, §3.1.

### 3.3 Product and commutator estimates on `Hˢ` (N10)

For real `s > 0` and `f, g ∈ Hˢ(E) ∩ L^∞(E)`, prove the tame product estimate
`‖fg‖_{Hˢ} ≤ C(d,s)(‖f‖_∞‖g‖_{Hˢ} + ‖f‖_{Hˢ}‖g‖_∞)` and the Kato–Ponce commutator estimate
`‖J^s(fg) − f J^s g‖₂ ≤ C(d,s)(‖∇f‖_∞‖J^{s−1}g‖₂ + ‖J^s f‖₂‖g‖_∞)`
(the product estimate: Tao, Notes 1, Proposition 35 and Exercise 55; the commutator estimate:
Kato–Ponce 1988, as stated in Grafakos–Oh, §1, p. 1, here with `p = 2`).

- The Sobolev embedding `Hˢ(E) ↪ C_b(E)` for `s > d/2` with
  `‖f‖_∞ ≤ C(d,s)‖f‖_{Hˢ}`, and `Hˢ(E) ↪ C¹_b(E)` for `s > d/2 + 1`.
- `Hˢ(E)` is a Banach algebra under pointwise multiplication for `s > d/2`.

**Checks.**

- `s = 1`: the product estimate is the Leibniz rule and Hölder's inequality, with `C = 1` up
  to the equivalence of `‖·‖_{H¹}` with `‖·‖₂ + ‖∇·‖₂`.
- The commutator estimate at `s = 2` with `J²` replaced by `Δ`:
  `Δ(fg) − fΔg = gΔf + 2⟪∇f, ∇g⟫`, bounded by the right side.
- `Hˢ(ℝ)` is not an algebra for `0 ≤ s < 1/2`: for a cutoff `χ` equal to `1` near `0`,
  `|x|^{−a}χ ∈ Hˢ(ℝ)` exactly when `s < 1/2 − a`, so for `(1/2 − s)/2 ≤ a < 1/2 − s` the function
  is in `Hˢ` and its square `|x|^{−2a}χ²` is not.

*Needs:* PDE §7.1–§7.3 (the dyadic partition, Besov spaces and Bony's decomposition); Mathlib
`MemSobolev`.

### 3.4 Aubin–Lions compactness (N11)

Let `X₀ ↪ X ↪ X₁` be Banach spaces with `X₀` and `X₁` reflexive, the first embedding compact
and the second continuous and injective. For `1 < p, r < ∞` and `0 < T < ∞`, prove that the
space of `u ∈ L^p(0,T; X₀)` with weak time derivative in `L^r(0,T; X₁)`, normed by the sum,
embeds compactly in `L^p(0,T; X)` (Lions 1969, Théorème 5.1, p. 58; Wang, Lemma 5.6, p. 43;
Simon 1987 proves a stronger form without reflexivity). The target is Simon's form: no
reflexivity, `1 < p < ∞` and `1 < r ≤ ∞`; Lions' theorem is the reflexive case with `r < ∞`,
and neither bullet below uses reflexivity. Prove the local form used on the whole space: a sequence
bounded in `L²(0,T; H¹(E; E))` with time derivatives bounded in `L^r(0,T; H⁻¹(E; E))` has a
subsequence converging in `L²(0,T; L²(B; E))` for every bounded open `B ⊆ E`.

- Ehrling's lemma: for every `ε > 0` there is `C_ε` with
  `‖x‖_X ≤ ε‖x‖_{X₀} + C_ε‖x‖_{X₁}` on `X₀`.
- Elements of the space have representatives continuous into `X₁`, with
  `‖u(t) − u(s)‖_{X₁} ≤ |t − s|^{1 − 1/r}‖u'‖_{L^r(0,T; X₁)}`.

**Checks.**

- Compactness of `X₀ ↪ X` is necessary: for `X₀ = X = X₁ = H` an infinite-dimensional Hilbert
  space and `u_n(t) = e_n` constant in time for an orthonormal sequence `e_n`, the sequence is
  bounded with zero derivative and has no convergent subsequence in `L²(0,T; H)`.
- The time-derivative bound is necessary: `u_n(t) = sin(nt)x` with `x ≠ 0` is bounded in
  `L²(0,T; X₀)`, converges weakly to `0`, and has `‖u_n‖²_{L²(0,T; X)} → (T/2)‖x‖²_X`, so no
  subsequence converges in `L²(0,T; X)`.
- On the whole space the conclusion is only local: translates `u(· − ne₁)` of a fixed nonzero
  `u ∈ H¹` are bounded in `H¹`, constant in time, and have no subsequence converging in `L²(E)`.

*Needs:* Tau Ceti `W1p.isCompactOperator_valueL_restrictL` and weak derivatives on an interval;
PDE §6.1; Mathlib Arzelà–Ascoli and Bochner integration.

### Examples

The acceptance examples of this layer are the dilation counts that fix the interpolation
exponents; the vanishing of `b(u,v,v)`; the Leibniz identity behind the commutator estimate;
and the three counterexamples to Aubin–Lions without its hypotheses.

### Dependencies

Layer 1; PDE §1.4, §6.1 and Layer 7; Tau Ceti's Sobolev and Besov spaces.

## Layer 4: Leray–Hopf weak solutions

Throughout this layer `d ∈ {2, 3}`, `ν > 0`, `u₀ ∈ L²_σ(E)`, and the force `f` lies in
`L²(0,T'; L²(E; E))` for every finite `T' ≤ T`.

### 4.1 Weak solutions and their basic theory (W12)

Define a weak solution on `[0,T)` as a `u ∈ L^∞(0,T'; L²_σ) ∩ L²(0,T'; H¹)` for every
`T' < T` with

`−∫₀ᵀ⟪u, ∂ₜφ⟫ + ν∫₀ᵀ⟪∇u, ∇φ⟫ + ∫₀ᵀ b(u, u, φ) = ⟪u₀, φ(0)⟫ + ∫₀ᵀ⟪f, φ⟫`

for every smooth solenoidal `φ` compactly supported in `[0,T) × E`. Define a Leray–Hopf
solution as a weak solution with `‖u(t) − u₀‖₂ → 0` as `t → 0⁺` and the energy inequality
`‖u(t)‖² + 2ν∫₀ᵗ‖∇u‖² ≤ ‖u₀‖² + 2∫₀ᵗ⟪f, u⟫` for almost every `t`.

- A weak solution has a weak time derivative in `L^{4/d}(0,T'; (H¹_σ)*)`, equal to
  `νΔu − B(u,u) + ℙf`, and a representative weakly continuous into `L²`; for that
  representative the energy inequality of a Leray–Hopf solution holds for every `t`.
- Equivalent formulations: the definition above; the same with time-independent solenoidal
  test fields in the sense of distributions on `(0,T)`; and the equation
  `∂ₜu + div(u ⊗ u) + ∇p = νΔu + f` in distributions on `(0,T) × E` with the pressure
  `p = Π(u ⊗ u) + q`, `∇q = (1 − ℙ)f`, where `Π(u ⊗ u) ∈ L²((0,T') × E)` for `d = 2` and
  `∈ L^{5/3}((0,T') × E)` for `d = 3`.
- The a priori bound `‖u(t)‖₂ ≤ ‖u₀‖₂ + ∫₀ᵗ‖f‖₂` for Leray–Hopf solutions.
- Restriction of weak solutions in time. The *strong energy inequality*,
  `‖u(t)‖² + 2ν∫ₛᵗ‖∇u‖² ≤ ‖u(s)‖² + 2∫ₛᵗ⟪f, u⟫` for almost every `s ≥ 0`, `s = 0` included, and
  every `t ≥ s`, is a separate predicate. It is not part of the definition of a Leray–Hopf
  solution, and a theorem that uses it names it as a hypothesis.

**Checks.**

- A classical solution with `u ∈ C¹([0,T]; H¹)` and decay is a Leray–Hopf solution with energy
  equality.
- The Lamb–Oseen vortex of §4.3 is a classical solution on `(0,∞) × ℝ²` that is not a weak
  solution in this sense when `Γ ≠ 0`: its velocity decays like `Γ/(2π‖x‖)` and is not in `L²`.
- The exponents: `u ∈ L⁴((0,T) × ℝ²)` gives `u ⊗ u ∈ L²`, and `u ∈ L^{10/3}((0,T) × ℝ³)` gives
  `u ⊗ u ∈ L^{5/3}`, by §3.1.

*Needs:* §1.3, §1.4, §3.1, §3.2; PDE §6.1.

### 4.2 Leray's existence theorem (W13)

Prove that for every `u₀ ∈ L²_σ(E)`, every such `f` and every `0 < T ≤ ∞` there is a Leray–Hopf
solution on `[0,T)`. For `d = 3` and `f = 0` this is Leray's theorem (Ożański–Pooley,
Definition 4.5 and Theorem 4.7, pp. 44–45, at `ν = 1`); for every `d` and `f = 0` it is Tao,
Notes 2, Theorem 14. With a force, for `d = 3` it is Lemarié-Rieusset, Theorem 12.2,
pp. 357–358, with `f ∈ L²(0,T; H⁻¹)`, and Proposition 12.1, (12.10), p. 361, for the strong
energy inequality from almost every `s > 0`; for `d = 2, 3` on an arbitrary domain with
`f ∈ L²(0,T; L²)`, existence is Galdi, Theorem 3.1. Leray 1934 has `f = 0`. The
construction is Leray's (Ożański–Pooley, Theorem 4.2, p. 41, and Lemma 4.3, p. 42): for a mollifier `ρ_ε`, the regularized system
`∂ₜu + ℙ((ρ_ε ⋆ u)·∇)u = νΔu + ℙf`, `u(0) = u₀`, and both the regularized solutions and the
passage to the limit are targets.

- The regularized system has a unique global solution in `C([0,T'); L²_σ) ∩ L²(0,T'; H¹)`,
  with the energy equality.
- The regularized solutions are bounded in the energy class, and their time derivatives are
  bounded in `L^{4/d}(0,T'; H⁻¹(E; E))`, uniformly in `ε`.
- Spatial tightness of the regularized solutions: for every finite `T' < T` and `δ > 0`,
  there is `R > 0` such that `sup_{0 < ε ≤ 1} sup_{0 ≤ t ≤ T'}
  ∫_{‖x‖ > R}‖u_ε(t)‖² < δ`. Prove this by localized energy estimates retaining both the
  spatial tail of `u₀` and the spatial tail of `f` in `L²(0,T'; L²)`; a bound depending only
  on the total force norm cannot control its spatial tail. Combined with local compactness,
  this gives strong convergence in `L²(0,T'; L²(E))`, then in `L²(E)` at almost every time,
  and the strong energy inequality for the solution constructed.
- Along a subsequence they converge weakly-star in `L^∞L²`, weakly in `L²H¹`, and strongly in
  `L²(0,T'; L²(B))` for every bounded `B`, by §3.4, to a Leray–Hopf solution; the energy
  inequality passes to the limit by weak lower semicontinuity, and strong attainment of the
  initial datum follows from weak continuity and the energy inequality.

**Checks.**

- `u₀ = 0`, `f = 0`: the solution constructed is `0`.
- With the nonlinearity removed the construction returns the Stokes solution of §2.3.

*Needs:* §2.3, §3.1–§3.4, §4.1; Mathlib `ContractingWith` and weak-star compactness.

### 4.3 The two-dimensional theory (W14)

For `d = 2` prove that weak solutions are unique, satisfy the energy equality, and are
continuous into `L²` (Lions–Prodi 1959; Ladyzhenskaya 1959; on a bounded domain, Wang,
Theorem 6.1, p. 45; on an arbitrary domain with `f ∈ L²(0,T; L²)`, Galdi, Theorem 4.1 with
(4.4) and Remarks 4.1, 4.2 and 4.6; on `ℝ²` with `f = 0`, Bedrossian–Vicol, Theorem 4.5),
with the stability estimate
`‖u(t) − v(t)‖² ≤ ‖u₀ − v₀‖² exp((1/ν)∫₀ᵗ‖∇v‖²)` for two weak solutions with the same force.

- For `u₀ ∈ H¹_σ` and `f ∈ L²(0,T; L²)` the solution is strong:
  `u ∈ L^∞(0,T'; H¹) ∩ L²(0,T'; H²)`.
- For `f = 0` and `u₀ ∈ H¹_σ` the vorticity `ω = ∂₁u₂ − ∂₂u₁` satisfies
  `∂ₜω + u·∇ω = νΔω` weakly, with `‖ω(t)‖₂ ≤ ‖ω₀‖₂` and `‖ω(t)‖₂² + 2ν∫₀ᵗ‖∇ω‖₂² = ‖ω₀‖₂²`.
- For `f = 0` and `u₀ ∈ L²_σ` the solution is smooth on `(0,∞) × ℝ²`, with
  `‖∇u(t)‖₂² ≤ ‖u₀‖₂²/(2νt)`.

**Checks.**

- The Lamb–Oseen vortex `ω(x,t) = Γ K_{νt}(x)` with `K` the pinned heat kernel on `ℝ²` and
  `u(x,t) = (Γ/2π)(x^⊥/‖x‖²)(1 − e^{−‖x‖²/(4νt)})`, `x^⊥ = (−x₂, x₁)`: `u·∇ω = 0` because `ω`
  is radial and `u` is tangential, so `ω` solves the heat equation with viscosity `ν`, and
  `(u, ω)` is an exact classical solution.
- The constant in the stability estimate: with `w = u − v`,
  `½ d/dt‖w‖² + ν‖∇w‖² = −b(w, v, w)`, `|b(w, v, w)| ≤ √2‖w‖₂‖∇w‖₂‖∇v‖₂` by §3.2, and
  `√2‖w‖‖∇w‖‖∇v‖ ≤ ν‖∇w‖² + (1/2ν)‖∇v‖²‖w‖²`, so `d/dt‖w‖² ≤ (1/ν)‖∇v‖²‖w‖²`.
- The decay bound: `2ν∫₀ᵗ‖∇u‖² ≤ ‖u₀‖²` and `‖∇u(t)‖₂ = ‖ω(t)‖₂` is nonincreasing, so
  `t‖∇u(t)‖² ≤ ∫₀ᵗ‖∇u‖²`.

*Needs:* §1.4, §3.1, §3.2, §4.1, §4.2; Tau Ceti Gelfand-triple energy identity.

### 4.4 Weak–strong uniqueness (W15)

Prove the Prodi–Serrin theorem (Prodi 1959; Serrin 1963; on a bounded domain, Wang,
Theorems 6.6 and 6.7, pp. 47–48, with the two exponents named in the other order; for
`d = 2, 3` on an arbitrary domain, Galdi, Theorem 4.2(i), with Theorem 4.1 and Remark 4.3 for
the energy equality; on `ℝ³`, Bedrossian–Vicol, Theorem 4.8): if `v` is a
weak solution on `[0,T)` with
`v ∈ L^q(0,T'; L^p(E; E))` for every `T' < T`, where `2/q + d/p = 1` and `d < p ≤ ∞`, then
`v` satisfies the energy equality, and every Leray–Hopf solution with the same `u₀` and `f`
equals `v` on `[0,T)`.

- The estimate `|b(w, v, w)| ≤ C(d,p)‖v‖_p‖w‖₂^{2/q}‖∇w‖₂^{1 + d/p}` behind it.
- The stability form: `‖u(t) − v(t)‖² ≤ ‖u₀ − v₀‖² exp(C(d,p)ν^{1−q}∫₀ᵗ‖v‖_p^q)` for a
  Leray–Hopf `u` and a weak `v` in the class, with the same force.
- A strong solution in dimension three is in the class with `(q,p) = (4,6)`, since
  `H¹(ℝ³) ↪ L⁶`.

**Checks.**

- The exponents: with `θ = d/p`, `‖w‖_{2p/(p−2)} ≤ C‖w‖₂^{1−θ}‖∇w‖₂^{θ}` and Young's inequality
  with exponents `2/(1+θ)` and `2/(1−θ) = q` give the factor `‖v‖_p^q`.
- `p = ∞`, `q = 2`: the estimate is `|b(w,v,w)| ≤ ‖v‖_∞‖w‖₂‖∇w‖₂`, with no interpolation.
- The scaling of the Conventions preserves the norm of `L^q(0,∞; L^p)` exactly when
  `2/q + d/p = 1`.

*Needs:* §3.1, §3.2, §4.1; Tau Ceti Gelfand-triple energy identity.

### Examples

The acceptance examples of this layer are the Lamb–Oseen vortex; the exponent counts for the
pressure and for the Prodi–Serrin class; and the Stokes limit of the construction.

### Dependencies

Layers 1–3; PDE §6.1.

## Layer 5: mild solutions

Throughout this layer `f = 0` and `ν > 0`.

### 5.1 The bilinear fixed-point lemma (M16)

Let `X` be a real Banach space and `B : X → X → X` bilinear with `‖B(x,y)‖ ≤ η‖x‖‖y‖`,
`η > 0`. Prove (Wang, Lemma 7.2, p. 56; Danchin, Lemma 2.3.2) that for every `a ∈ X` with `4η‖a‖ < 1` the equation `x = a + B(x,x)` has a
solution with `‖x‖ ≤ 2‖a‖`, that it is the only solution with `‖x‖ < 1/(2η)`, and that the
solution map is Lipschitz on `{a : ‖a‖ ≤ r}` for each `r < 1/(4η)`, with constant
`(1 − 4ηr)^{−1/2}`.

- The solution is the limit of the Picard iterates `x₀ = a`, `x_{n+1} = a + B(x_n, x_n)`.
- The solution satisfies `‖x‖ ≤ (1 − √(1 − 4η‖a‖))/(2η)`.

**Checks.**

- `X = ℝ`, `B(x,y) = ηxy`: the equation is `ηx² − x + a = 0` with roots
  `(1 ± √(1 − 4ηa))/(2η)`; the lemma selects the smaller root, the condition `4ηa < 1` is
  sharp for real solutions, and the derivative of the smaller root in `a` is
  `(1 − 4ηa)^{−1/2}`.
- `a = 0`: the solution is `0` and the other root `1/η` lies outside the uniqueness ball.

*Needs:* Mathlib `ContractingWith`.

### 5.2 The Fujita–Kato and Kato theorems (M17)

Define a mild solution on `[0,T]` in a space `X_T` of time-dependent fields as a solution of
`u(t) = e^{νtΔ}u₀ − ∫₀ᵗ e^{ν(t−s)Δ}ℙ div(u ⊗ u)(s) ds` in `X_T`. For `d = 3` prove:

- **Fujita–Kato.** For `u₀ ∈ H^{1/2}_σ(ℝ³)` there is `T > 0` and a unique mild solution
  in `L⁴(0,T; H¹)`; it lies in `C([0,T]; H^{1/2}) ∩ L²(0,T; H^{3/2})`. The theorem originates
  in Fujita–Kato 1964, which works on a bounded domain; the formulation in `L⁴(0,T; H¹)` is
  that of Bahouri–Chemin–Danchin, Chapter 5, and the small-data statement in the critical
  space is Tao, Notes 1, Theorem 45 and Exercise 49. On `ℝ³` in homogeneous spaces: Danchin,
  §2.3.2, Theorem (Fujita–Kato) with (2.8), has `C([0,T]; Ḣ^{1/2})` with gradient in
  `L²(0,T; Ḣ^{1/2})`, a force, and the small-data global case; Bedrossian–Vicol, Theorem 5.4
  and Remark 5.5, p. 109, has `C([0,T]; Ḣ^{1/2}) ∩ L⁴(0,T; Ḣ¹)` with `f = 0`. There is an absolute
  constant `c > 0` such that `|u₀|_{Ḣ^{1/2}} ≤ cν` implies that the solution exists on
  `[0,T]` for every `T`.
- **Kato (1984).** For `u₀ ∈ L³_σ(ℝ³)` there is `T > 0` and a mild solution
  `u ∈ C([0,T]; L³)` with `t^{1/4}u ∈ C_b((0,T]; L⁶)` and `t^{1/4}‖u(t)‖₆ → 0` as `t → 0⁺`,
  unique in that class. There is an absolute constant `c > 0` such that `‖u₀‖₃ ≤ cν`
  implies existence for every `T`. (Lemarié-Rieusset, Theorem 7.5, with the weight
  `t^{1/2 − 3/(2q)}` on `L^q`, `3 < q < ∞`, here at `q = 6`.)
- **Strong solutions.** For `u₀ ∈ H¹_σ(ℝ³)` the Fujita–Kato solution is strong on `[0,T]` for
  `T = cν³/‖∇u₀‖₂⁴` with an absolute `c > 0`.

The bilinear estimates that feed §5.1 are targets: on `L⁴(0,T; Ḣ¹)`-seminormed fields,
`‖∫₀ᵗ e^{ν(t−s)Δ}ℙ div(u ⊗ v)‖ ≤ Cν^{−3/4}‖u‖‖v‖`; and in Kato's class with the norm
`sup t^{1/4}‖u(t)‖₆`, the same with constant `Cν^{−3/4}`.

- The linear terms: `‖e^{νtΔ}u₀‖_{L⁴(0,∞; Ḣ¹)} ≤ Cν^{−1/4}|u₀|_{Ḣ^{1/2}}`, and
  `sup t^{1/4}‖e^{νtΔ}u₀‖₆ ≤ Cν^{−1/4}‖u₀‖₃`.
- Continuous dependence on `u₀` in each class, locally Lipschitz.
- `|u₀|²_{Ḣ^{1/2}} ≤ ‖u₀‖₂‖∇u₀‖₂` for `u₀ ∈ H¹`, so `‖u₀‖₂‖∇u₀‖₂ ≤ c²ν²` gives a global strong
  solution.
- The maximal existence time `T*` and the continuation criteria: if `T* < ∞` then
  `∫₀^{T*}‖u‖⁴_{H¹} = ∞` for the Fujita–Kato solution.

**Checks.**

- Scale invariance of each smallness condition: under `u₀ ↦ λu₀(λ·)` on `ℝ³`,
  `|u₀|_{Ḣ^{1/2}}` and `‖u₀‖₃` are unchanged, so the conditions `≤ cν` are dimensionally
  consistent; the existence time for `H¹` data scales as `T ↦ T/λ²` with `‖∇u₀‖₂ ↦ λ^{1/2}‖∇u₀‖₂`.
- The powers of `ν`: the linear and bilinear constants combine to `4η‖a‖ ∼ ν^{−1}|u₀|`, giving
  smallness relative to `ν`.
- The exponent `1/4` in Kato's class is `(1 − 3/q)/2` at `q = 6`, from §2.1 with `p = 3`.

*Needs:* §1.3, §2.1, §2.2, §3.1, §5.1.

### 5.3 Smoothing and agreement with Leray–Hopf solutions (M18)

Prove that the Fujita–Kato solution with `u₀ ∈ H^{1/2}_σ(ℝ³)` is smooth on `(0,T] × ℝ³`, with
`u(t) ∈ Hˢ` for every `s` and `t > 0`; that it is a Leray–Hopf solution satisfying the energy
equality; and that every Leray–Hopf solution with the same initial datum coincides with it on
`[0,T]` (smoothness for `t > 0`: Tao, Notes 1, Exercise 42, for `s > d/2`, and Theorem 45
with Exercise 47 for smooth data at the critical regularity, all three on the torus; smoothness and the
energy equality for Leray's strong solutions on `ℝ³` at `ν = 1`: Ożański–Pooley,
Corollary 3.3 and Theorem 3.4, p. 25; agreement with weak solutions obeying the energy
inequality: Tao, Notes 2, Proposition 20, for `Hˢ` mild solutions with `s > d/2 − 1` and
`s ≥ 1`, with the remark after it that `s ≥ 1` can be dropped. None of these states the
theorem at `H^{1/2}(ℝ³)` in one place; the statement here combines them through §4.4).

- The Fujita–Kato solution is in the Prodi–Serrin class with `(q,p) = (4,6)`, so the last
  statement is §4.4.
- Two-dimensional agreement: for `u₀ ∈ L²_σ(ℝ²)` the weak solution of §4.3 is a mild solution
  in `C([0,T]; L²) ∩ L⁴((0,T) × ℝ²)`, for every `T`.

**Checks.**

- `2/4 + 3/6 = 1`.
- For `u₀ ∈ H^{1/2}`, `‖u₀‖₂` is finite, so the energy class is available with no extra
  hypothesis.

*Needs:* §2.3, §4.1, §4.4, §5.2.

### 5.4 Blow-up rates (M19)

Prove Leray's lower bound (Ożański–Pooley, Corollaries 3.11 and 3.12, p. 35, at `ν = 1`): if
the strong solution with `u₀ ∈ H¹_σ(ℝ³)` has maximal time
`T* < ∞`, then `‖∇u(t)‖₂ ≥ cν^{3/4}(T* − t)^{−1/4}` for `0 ≤ t < T*`, with an absolute
`c > 0`, and consequently `T* ≥ cν³‖∇u₀‖₂^{−4}`. Prove eventual regularity: a Leray–Hopf
solution on `[0,∞)` with `u₀ ∈ L²_σ(ℝ³)` that satisfies the strong energy inequality of §4.1,
in particular the solution constructed in §4.2, is a strong solution on `[T₀, ∞)` for
`T₀ = Cν^{−5}‖u₀‖₂⁴` with an absolute `C` (Ożański–Pooley, Theorem 4.12, p. 53, at `ν = 1`
and for the solution of §4.2; the proof uses only the strong energy inequality).

- The differential inequality `d/dt ‖∇u‖₂² + ν‖Δu‖₂² ≤ Cν^{−3}‖∇u‖₂⁶`.
- For `d = 2` and `u₀ ∈ Hˢ_σ`, `s ≥ 0`, the solution of §4.3 stays in `Hˢ` for all time.

**Checks.**

- The bound is scale-invariant: `‖∇u_λ(t)‖₂ = λ^{1/2}‖∇u(λ²t)‖₂` and
  `(T*/λ² − t)^{−1/4} = λ^{1/2}(T* − λ²t)^{−1/4}`.
- Integrating `y' ≤ Cν^{−3}y³` for `y = ‖∇u‖₂²` from `t` to `T*`, where `y → ∞`, gives
  `y(t)² ≥ ν³/(2C(T* − t))`.
- Eventual regularity: `2ν∫₀^{T₀}‖∇u‖² ≤ ‖u₀‖²` forces `‖∇u(t₀)‖₂² ≤ ‖u₀‖₂²/(2νT₀)` at some
  `t₀ ≤ T₀` from which the strong energy inequality holds, so
  `‖u(t₀)‖₂‖∇u(t₀)‖₂ ≤ ‖u₀‖₂²(2νT₀)^{−1/2}`, which is at most `c²ν²` once
  `T₀ ≥ ‖u₀‖₂⁴/(2c⁴ν⁵)`; §5.2 then gives a global strong solution from `t₀`, and §4.4 identifies
  it with `u`. The time `T₀` scales like `λ^{−2}` under the scaling of the Conventions, as
  `‖u₀‖₂⁴` does.

*Needs:* §3.1, §5.2, §5.3.

### Examples

The acceptance examples of this layer are the scalar quadratic equation for the fixed-point
lemma; the scaling counts for the Fujita–Kato and Kato conditions and for Leray's rate; and
the identity `2/4 + 3/6 = 1`.

### Dependencies

Layers 1–4.

## Layer 6: the Euler equations

Throughout this layer `ν = 0` and `f = 0` unless a statement names `ν`.

### 6.1 Classical solutions, vorticity and conservation laws (E20)

Define the vorticity of a `C¹` field as the antisymmetric part `Ω = ∇u − (∇u)ᵀ`, a field of
skew-adjoint operators on `E`, with the identifications `Ω = ω J` for `d = 2`, where
`ω = ∂₁u₂ − ∂₂u₁` and `J` is rotation by `π/2`, and `Ωh = ω × h` for `d = 3`, where
`ω = curl u`. For an `Hˢ` solution `u` of the Euler equations on `[0,T]`, in the sense of the
Conventions, prove:

- Conservation of energy, `‖u(t)‖₂ = ‖u₀‖₂`.
- The vorticity equation `∂ₜΩ + (u·∇)Ω + Ω∇u + (∇u)ᵀΩ = 0`, which reads
  `∂ₜω + u·∇ω = 0` for `d = 2` and `∂ₜω + (u·∇)ω = (ω·∇)u` for `d = 3`.
- The two-time flow `X(t,s,α)` of `u`: existence, uniqueness and joint `C¹` regularity,
  `X(s,s,α) = α`, and the composition law `X(t,r,X(r,s,α)) = X(t,s,α)`. Its inverse is
  `X(s,t,·)`, and `det D_αX(t,s,α) = 1`, so it preserves Lebesgue measure. Write
  `X(α,t) = X(t,0,α)` below; a one-parameter group law requires a stationary field.
- The Cauchy vorticity formula `ω(X(α,t),t) = ∇X(α,t)ω₀(α)` for `d = 3`, and
  `ω(X(α,t),t) = ω₀(α)` for `d = 2` (Majda–Bertozzi, Proposition 1.8, (1.51), in §1.6).
- Conservation of helicity `∫⟪u, ω⟫` for `d = 3`, and of `∫ Φ(ω)` for every continuous `Φ`
  with `Φ(ω₀)` integrable for `d = 2`, in particular of every `‖ω(t)‖_p`.
- Kelvin's circulation theorem: for a `C¹` loop `γ` and `γ_t = X(·,t) ∘ γ`, the circulation
  `∮_{γ_t} ⟪u, dl⟫` is constant in `t`.
- For the `Hˢ` solutions, the pressure may be chosen as `p = Π(u ⊗ u)`;
  `−Δp = trace((∇u)²)`. The Poisson equation also holds for sufficiently smooth classical
  solutions without decay, but alone determines pressure only up to a harmonic function.

**Checks.**

- Rigid rotation `u = (−x₂, x₁)`, `p = ‖x‖²/2` on `ℝ²`: `(u·∇)u = −x = −∇p`, `ω = 2`, and the
  flow map is rotation by angle `t`.
- Shear flow `u = (g(x₂), 0)`, `p = 0`, `g ∈ C¹`: stationary, `ω = −g'`, flow map
  `(α₁ + tg(α₂), α₂)`, with `∇X` unbounded in `t` while `det ∇X = 1`.
- Strain flow `u = (−γ₁x₁, −γ₂x₂, (γ₁+γ₂)x₃)`,
  `p = −½(γ₁²x₁² + γ₂²x₂² + (γ₁+γ₂)²x₃²)` on `ℝ³`: stationary and irrotational, also a solution
  of Navier–Stokes for every `ν` since `Δu = 0`.
- The Beltrami field `u = (A sin x₃ + C cos x₂, B sin x₁ + A cos x₃, C sin x₂ + B cos x₁)`
  has `curl u = u`, so `(u·∇)u = ∇(‖u‖²/2)` and `(u, −‖u‖²/2)` is a stationary Euler solution,
  while `(e^{−νt}u, −e^{−2νt}‖u‖²/2)` solves Navier–Stokes because `Δu = −u`.
- Every smooth compactly supported radial vorticity `ω₀(x) = w(‖x‖)` on `ℝ²`, with
  `u = K₂ ⋆ ω₀` as in §6.2, gives a stationary classical solution.

The rotation, shear, strain and Beltrami examples are classical solutions outside `L²`
(unless the field vanishes). They exercise the pointwise vorticity and pressure equations;
prove the classical vorticity equation under sufficient differentiability, and the explicit
flow formulas directly. A general classical field has a local flow; existence over the
whole solution interval uses the boundedness and Lipschitz bounds supplied by `Hˢ`. Radial
vorticity gives a stationary classical solution under the regularity and integrability
hypotheses of §6.2, and can have finite energy when its total circulation vanishes.
The integral conservation laws above are stated for `Hˢ` solutions only.

*Needs:* §1.3; Mathlib `IsPicardLindelof`, `gronwallBound`, `crossProduct` and curve
integrals.

### 6.2 The Biot–Savart law (E21)

For `d = 2`, prove that a solenoidal field `u ∈ H¹_σ` with vorticity `ω ∈ L¹ ∩ L²` satisfies
`u = K₂ ⋆ ω` with `K₂(x) = x^⊥/(2π‖x‖²)`, and for `d = 3` that `u ∈ H¹_σ` with
`ω ∈ L¹ ∩ L²` satisfies `u(x) = (1/4π)∫ ω(y) × (x − y)/‖x − y‖³ dy` (Majda–Bertozzi,
Proposition 2.1 in §2.1 for `d = 2` and Proposition 2.16 in §2.4 for `d = 3`, for smooth
decaying vorticity).

- For `1 < p < ∞` and a solenoidal `u ∈ H¹_σ` with `Ω ∈ Lᵖ`, in every dimension,
  `∇u ∈ Lᵖ` and `‖∇u‖_p ≤ C(d,p)‖Ω‖_p`: each `∂ₖuⱼ` is a linear combination of
  the operators `RₐR_b` applied to the components of `Ω`. The `H¹` hypothesis fixes the
  harmonic ambiguity; a nonzero irrotational strain field is excluded.
- `d = 2`, `ω ∈ L¹ ∩ L^∞`: `K₂ ⋆ ω` is defined pointwise, bounded with
  `‖K₂ ⋆ ω‖_∞ ≤ C‖ω‖₁^{1/2}‖ω‖_∞^{1/2}`, solenoidal with vorticity `ω`, and log-Lipschitz:
  `|u(x) − u(y)| ≤ C(‖ω‖₁ + ‖ω‖_∞)ℓ(‖x − y‖)` with `ℓ(r) = r(1 − log r)` for `r < 1` and
  `ℓ(r) = r` for `r ≥ 1` (Majda–Bertozzi, Lemma 8.1, (8.32), p. 315, for the regularized
  velocities; Crippa–Stefani, Corollary 2.4, (2.10)).
- For bounded compactly supported `ω`: `K₂ ⋆ ω(x) − (∫ω)K₂(x) = O(‖x‖^{−2})` as `‖x‖ → ∞`, so
  `K₂ ⋆ ω ∈ L²(ℝ²)` exactly when `∫ω = 0`.
- The logarithmic estimate of Beale–Kato–Majda: for `u ∈ Hˢ_σ`, `s > d/2 + 1`,
  `‖∇u‖_∞ ≤ C(d,s)(1 + ‖Ω‖₂ + ‖Ω‖_∞(1 + log⁺‖u‖_{Hˢ}))`,
  with `Ω` the skew-adjoint vorticity tensor; in dimensions two and three this is
  equivalently stated using `ω`, after adjusting the dimensional constant
  (Bedrossian–Vicol, Corollary 2.8, (2.37), with `log⁺(‖f‖_{Hʳ}/‖f‖_∞)`, `r > d/2`, in place
  of `log⁺‖u‖_{Hˢ}`).

**Checks.**

- Orientation: for radial `ω ≥ 0` on `ℝ²`, `K₂ ⋆ ω(x) = (x^⊥/‖x‖²)(1/2π)∫_{‖y‖ ≤ ‖x‖}ω`, a
  counterclockwise flow; for `ω = Γ K_{νt}` this is the Lamb–Oseen velocity of §4.3.
- Orientation in three dimensions: a vorticity field concentrated near the `x₃`-axis and
  pointing along `e₃` induces velocity in the direction `e₃ × x = (−x₂, x₁, 0)`.
- The rigid rotation `u = (−x₂, x₁)` has `ω = 2` constant; it is not of the form `K₂ ⋆ ω` with
  integrable `ω`, and the law is stated only under the integrability hypotheses.

*Needs:* §1.3, §1.4, §3.3; PDE §2.3.

### 6.3 Local well-posedness in `Hˢ` and the inviscid limit (E22)

For `d ≥ 2`, `s > d/2 + 1`, `ν ≥ 0` and nonzero `u₀ ∈ Hˢ_σ(E)`, prove that for
`T = 1/(2C(d,s)‖u₀‖_{Hˢ})`, independent of `ν`, there is a unique solution
`u^ν ∈ C([0,T]; Hˢ) ∩ C¹([0,T]; H^{s−2})` of the Navier–Stokes equations for `ν > 0`, and of the
Euler equations with `u⁰ ∈ C([0,T]; Hˢ) ∩ C¹([0,T]; H^{s−1})` for `ν = 0` (Kato 1972 on `ℝ³`;
Tao, Notes 3, Theorem 1, Proposition 6 and Exercise 10, for every `d` and integer `s`;
Kato–Ponce 1988 and Bedrossian–Vicol, Theorems 2.1 and 3.2, for real `s`), with
`‖u^ν(t)‖_{Hˢ} ≤ ‖u₀‖_{Hˢ}/(1 − C(d,s)t‖u₀‖_{Hˢ}) ≤ 2‖u₀‖_{Hˢ}`
on `[0,T]`. For `u₀ = 0`, the solution is zero for all time.

- The energy estimate `d/dt ‖u‖_{Hˢ} ≤ C(d,s)‖∇u‖_∞‖u‖_{Hˢ}`, uniform in `ν ≥ 0`.
- Uniqueness and `L²` stability: `‖u(t) − v(t)‖₂ ≤ ‖u₀ − v₀‖₂ exp(∫₀ᵗ‖∇v‖_∞)` for two
  solutions with the same `ν`.
- Continuity of the data-to-solution map `Hˢ_σ → C([0,T]; Hˢ)`.
- Continuation: the solution extends beyond `T'` whenever `∫₀^{T'}‖∇u‖_∞ < ∞`.
- The inviscid limit: `‖u^ν(t) − u⁰(t)‖₂ ≤ νt sup_{[0,t]}‖Δu⁰‖₂ exp(∫₀ᵗ‖∇u⁰‖_∞)` on `[0,T]`,
  and `u^ν → u⁰` in `C([0,T]; H^{s'})` for every `s' < s`.

**Checks.**

- The time of existence: `y' ≤ Cy²` with `y(0) = ‖u₀‖_{Hˢ}` gives
  `y(t) ≤ y(0)/(1 − Cty(0))`.
- The regularity threshold: `s > d/2 + 1` is what makes `‖∇u‖_∞ ≤ C‖u‖_{Hˢ}` by §3.3.
- The inviscid rate: with `w = u^ν − u⁰`,
  `½ d/dt‖w‖² = −b(w, u⁰, w) + ν⟪Δu^ν, w⟫ ≤ ‖∇u⁰‖_∞‖w‖² + ν‖Δu⁰‖₂‖w‖₂`, using
  `⟪Δu^ν, w⟫ = −‖∇w‖² + ⟪Δu⁰, w⟫`.

*Needs:* §1.2, §2.2, §3.3; Mathlib Picard–Lindelöf in a Banach space and Grönwall.

### 6.4 The Beale–Kato–Majda criterion (E23)

Prove that if the `Hˢ` solution of the Euler equations of §6.3 has maximal time `T* < ∞`, then
`∫₀^{T*}‖Ω(t)‖_∞ dt = ∞` (Beale–Kato–Majda 1984 for `d = 3`; Tao, Notes 3, Theorem 19, for
every `d` and integer `s`; Bedrossian–Vicol, Theorem 2.6, (2.31), for real `s`), and the same for the Navier–Stokes solution with `ν > 0`
(Tao, Notes 3, Remark 22).

- The double-exponential bound
  `‖u(t)‖_{Hˢ} ≤ C exp(C exp(C∫₀ᵗ‖Ω‖_∞))` with `C` depending on `d`, `s`, `‖u₀‖_{Hˢ}` and `t`.
- For `d = 3` the equivalent form with `‖ω(t)‖_∞`.

**Checks.**

- `d = 2`: `‖ω(t)‖_∞ = ‖ω₀‖_∞` by §6.1, so the integral is `T*‖ω₀‖_∞ < ∞` and no blow-up
  occurs, which is §6.5.
- The criterion is scale-invariant: `∫‖ω_λ‖_∞ dt` is unchanged by `u ↦ λu(λx, λ²t)` and by the
  Euler scalings.

*Needs:* §6.2, §6.3.

### 6.5 Two-dimensional global theory (E24)

For `d = 2` prove:

- **Global smooth solutions.** For `u₀ ∈ Hˢ_σ(ℝ²)`, `s > 2`, the Euler solution of §6.3
  exists for all time, with `‖u(t)‖_{Hˢ} ≤ C exp(C exp(Ct))` (Tao, Notes 3, Theorem 23 with
  Theorem 19, for integer `s`; Bedrossian–Vicol, Theorem 2.9, for real `s`; global existence of classical planar solutions goes back to
  Wolibner 1933 and Kato 1967).
- **Yudovich.** (Yudovich 1963 on a bounded domain; on `ℝ²`, Majda–Bertozzi, Theorems 8.1
  and 8.2 in §8.2, and Crippa–Stefani, Theorems 1.6 and 1.8 with Remark 1.7.) For `ω₀ ∈ L¹ ∩ L^∞(ℝ²)` there is a unique
  `ω ∈ L^∞(0,∞; L¹ ∩ L^∞)` with `u = K₂ ⋆ ω` and
  `∫₀^∞∫ ω(∂ₜφ + u·∇φ) + ∫ ω₀φ(0) = 0` for every `φ ∈ 𝓓([0,∞) × ℝ², ℝ)`.

- The flow of a log-Lipschitz field: for `u` as in §6.2 the flow map `X(·,t)` exists, is
  unique, is a measure-preserving homeomorphism, and is Hölder continuous with exponent
  `exp(−C(‖ω₀‖₁ + ‖ω₀‖_∞)t)`.
- The Yudovich solution is `ω(t) = ω₀ ∘ X(·,t)⁻¹`, so the distribution function of `ω(t)` and
  every `‖ω(t)‖_p`, `1 ≤ p ≤ ∞`, is conserved.
- Agreement: for `u₀ ∈ Hˢ_σ`, `s > 2`, with `ω₀ ∈ L¹`, the `Hˢ` solution is the Yudovich
  solution.

**Checks.**

- Osgood's condition: `∫₀¹ dr/ℓ(r) = ∞` for `ℓ(r) = r(1 − log r)`, which is what gives
  uniqueness of the flow, while the flow of the non-Lipschitz field `|x|^{1/2}` on `ℝ` is not
  unique.
- The Hölder exponent: `r' = −Cr log r` from `r(0) = r₀ < 1` gives
  `r(t) = r₀^{exp(−Ct)}`.
- A radial `ω₀` gives the stationary solution `ω(t) = ω₀`, and `X(·,t)` rotates each circle
  `‖x‖ = ρ` at angular velocity `(1/2πρ²)∫_{‖y‖ ≤ ρ}ω₀`.

*Needs:* §6.1–§6.4.

### Examples

The acceptance examples of this layer are rigid rotation; shear flow; strain flow; the
Beltrami field; radial vortices and their differential rotation; and the Osgood computation.

### Dependencies

Layers 1–3; Mathlib's ODE theory.

## Downstream consumers

- **PDE, Part II** consumes Layers 1–4 for the two-dimensional stochastic Navier–Stokes
  equation: the Leray projection, the Stokes semigroup, the trilinear form and the
  two-dimensional deterministic theory.

## Scope and ownership

This roadmap owns, on the whole space `E`: the weak divergence of a locally integrable vector
field and the closed subspace `L²_σ(E)` of solenoidal `L²` fields; the Helmholtz–Weyl
decomposition; the Leray projection `ℙ` on `L²`, its Riesz-transform formula, its extension to
`Lᵖ` for `1 < p < ∞` and to the Bessel scale, and its failure at `p = 1` and `p = ∞`; the
pressure operator `F ↦ Σⱼₖ RⱼRₖFⱼₖ`; the off-diagonal `Lᵖ`–`L^q` estimates for the heat
semigroup; the Stokes semigroup and the Oseen-kernel estimates for `e^{tΔ}ℙ div`; the linear
Stokes system; the Ladyzhenskaya inequalities and the `L²`-based Gagliardo–Nirenberg
interpolation inequality; the convective trilinear form; the tame product estimate and the
Kato–Ponce commutator estimate on `Hˢ(E)`; the Aubin–Lions compactness lemma; weak and
Leray–Hopf solutions of the Navier–Stokes equations and every theorem about them in Layer 4;
the bilinear fixed-point lemma, mild solutions and every theorem about them in Layer 5; the
vorticity of a velocity field in every dimension with its two- and three-dimensional
identifications; the Biot–Savart law; and classical, `Hˢ` and Yudovich solutions of the Euler
equations with every theorem about them in Layer 6.

- **PDE** owns the weak-derivative Sobolev spaces on open sets, the maximal function,
  interpolation, Calderón–Zygmund theory and the Mihlin–Hörmander theorem, the heat semigroup on
  `Lᵖ` and `BUC` with its generator and the diagonal smoothing estimates
  `‖D^α S(t)f‖_p ≤ C t^{−|α|/2}‖f‖_p` (its §6.3), Bochner spaces and the Gelfand triple with the
  Lions–Magenes identity (its §6.1), and the dyadic partition, Besov spaces and paraproducts
  (its Layer 7). Tau Ceti implements the parts of these cited in the supplier contracts below.
  This roadmap consumes them and restates none: every statement in PDE is scalar, and PDE names
  three-dimensional Navier–Stokes as outside its scope.
- **PDE, Part II** is the stochastic programme named by PDE, including the two-dimensional
  stochastic Navier–Stokes equation. It is a consumer of Layers 1–4 here, not a supplier:
  everything in this roadmap is deterministic.
- **OneParameterSemigroups**, Part A, owns strongly continuous semigroups, generators and the
  generation theorems; Tau Ceti implements it. Section 2.2 constructs the Stokes semigroup as
  the restriction of the vector heat semigroup to an invariant closed subspace and builds no
  generation engine.
- **IncompressibleFlows** plans incompressible Euler and Navier–Stokes theory on the torus and
  on Euclidean space together, and overlaps this roadmap on the whole space: both name the
  solenoidal subspace and Leray projection, Leray–Hopf solutions, mild solutions in critical
  spaces, local well-posedness of the Euler equations and the two-dimensional global theory.
  This roadmap states those on `E` only, in the forms given above. It states nothing periodic,
  and it does not cover transport by incompressible fields, renormalized solutions,
  regularity criteria beyond §4.4, critical spaces beyond `H^{1/2}` and `L³`, suitable weak
  solutions and partial regularity, or the Onsager theory, all of which IncompressibleFlows
  plans. No periodic statement is a consequence of a whole-space statement here.
- **CompressibleEulerEquations** owns the product and commutator estimates at integer order on
  its spaces `Hᵏ_Λ` (its §4.3). Section 3.3 here is the real-order statement on the Bessel
  scale `Hˢ(E)`, which at integer `s` and `Λ = 0` agrees with it.
- **RiemannianGeometry** and **DifferentialGeometry** own divergence, Lie derivatives and flows
  on manifolds. Nothing here is stated on a manifold; the flow maps of §6.1 are flows of
  time-dependent vector fields on `E` built from Mathlib's Picard–Lindelöf theory.
- Outside this roadmap: domains with boundary and every boundary condition (the Stokes operator
  on a domain, no-slip, boundary layers); the periodic setting; compressible flow; free
  boundaries and water waves; coupled systems (Boussinesq, magnetohydrodynamics); stochastic
  forcing; partial regularity (Caffarelli–Kohn–Nirenberg) and interior regularity of weak
  solutions in the Serrin class; the endpoint `L^∞(0,T; L³)` regularity theorem; critical spaces
  beyond `H^{1/2}` and `L³` (Besov spaces of negative order, `BMO⁻¹`); non-uniqueness by convex
  integration and the Onsager conjecture; vortex patches and vortex sheets; and the geometric
  formulation of the Euler equations on the group of volume-preserving diffeomorphisms. A
  statement in this roadmap that has a boundary term, a periodic cell or a density variable is out of
  scope by this list.

## Exact supplier contracts

### From Mathlib

- `TestFunction`, `Distribution`, `TemperedDistribution`, `SchwartzMap` and the Fourier
  transform on `L²` and on tempered distributions in `Mathlib/Analysis/Distribution/` and
  `Mathlib/Analysis/Fourier/`.
- `TemperedDistribution.besselPotential` and `TemperedDistribution.MemSobolev`
  (`Mathlib/Analysis/Distribution/Sobolev.lean:73,153`): the Bessel-potential scale, used at
  `p = 2` as `Hˢ(E)`.
- `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_one` and `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq`
  (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:440,602`): the
  Gagliardo–Nirenberg–Sobolev inequality for compactly supported `C¹` functions, the input to
  §3.1.
- `Submodule.starProjection` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131`):
  the orthogonal projection onto a closed subspace as a continuous linear endomorphism; `ℙ` is
  this projection for `L²_σ(E)`.
- `ContractingWith` (`Mathlib/Topology/MetricSpace/Contracting.lean:42`) with its fixed-point
  theorems: the Banach fixed-point theorem behind §5.1.
- `IsPicardLindelof` (`Mathlib/Analysis/ODE/PicardLindelof.lean:80`) and `gronwallBound` with
  `norm_le_gronwallBound_of_norm_deriv_right_le` (`Mathlib/Analysis/ODE/Gronwall.lean:43,134`):
  existence and uniqueness for the regularized systems of §4.2 and the flow maps of §6.1, and
  the Grönwall arguments throughout.
- `MeasureTheory.convolution`, `ContDiffBump`, the Bochner integral, `Lp`, Hölder's and
  Minkowski's inequalities, Banach–Alaoglu and weak-star sequential compactness in the dual of
  a separable space, Arzelà–Ascoli, and `crossProduct`
  (`Mathlib/LinearAlgebra/CrossProduct.lean:47`).
- Mathlib has no divergence-free subspace, no Leray projection, no Riesz transform, no
  Ladyzhenskaya or Gagliardo–Nirenberg interpolation inequality, no Aubin–Lions lemma and no
  statement about the Navier–Stokes or Euler equations.

### From Tau Ceti

All files are under `TauCeti/`; line numbers are those of the Tau Ceti revision pinned by this
repository's `lake-manifest.json` (`2fd255d`).

- `TauCeti.HasWeakLineDerivOn` and `TauCeti.HasWeakFDerivOn`
  (`Analysis/Sobolev/WeakDeriv/Basic.lean:212,251`): weak derivatives of locally integrable
  `F`-valued functions on an open set, used here with `F = E`.
- `TestFunction.divergenceCLM` (`Analysis/Distribution/TestFunction/Divergence.lean:58`): the
  divergence of a test vector field as a continuous linear map `𝓓(Ω, E) →L[ℝ] 𝓓(Ω, ℝ)`;
  `TauCeti.HasWeakFDerivOn.integral_inner_gradient_eq_neg_integral_smul_trace` and
  `TauCeti.HasWeakFDerivOn.integral_divergenceCLM_smul_eq_neg_integral`
  (`Analysis/Sobolev/WeakDeriv/Divergence.lean:79,126`): for a field with weak derivative `U`,
  integration by parts against a gradient and against the divergence of a test field, with the
  trace of `U` as the divergence.
- `TauCeti.W1p` (`Analysis/Sobolev/W1p/Basic.lean:372`) and `TauCeti.Wkp`
  (`Analysis/Sobolev/Wkp/Basic.lean:145`): the scalar weak-derivative Sobolev spaces;
  `TauCeti.W1p.isCompactOperator_valueL_restrictL`
  (`Analysis/Sobolev/W1p/LocalCompactness.lean:111`): local Rellich compactness, the spatial
  compactness input of §3.4; `TauCeti.W1p0.sobolevEmbeddingL`
  (`Analysis/Sobolev/Embedding.lean:435`): the Sobolev embedding.
- `MeasureTheory.Lp.fourierMultiplierCLM` (`Analysis/Fourier/L2Multiplier.lean:88`): the
  Fourier multiplier on `L²(E; F)` with a bounded symbol;
  `TauCeti.exists_fourierMultiplierCLM_eq_and_norm_le_of_norm_iteratedFDeriv_le`
  (`Analysis/Fourier/MihlinHormander.lean:358`): the Mihlin–Hörmander theorem, the source of
  every `Lᵖ` bound in Layer 1.
- `TauCeti.heatKernel` with `heatKernel_convolution_heatKernel` and `fourier_heatKernel`
  (`Analysis/PDE/HeatKernel/Basic.lean:76,254,289`); `TauCeti.heatSemigroup` and
  `heatSemigroup_apply` (`Analysis/PDE/HeatKernel/Semigroup.lean:88,131`): the Gaussian kernel
  `(4πt)^{−d/2}exp(−‖x‖²/4t)` and the heat semigroup as a contraction semigroup on `Lᵖ(E; F)`
  for `1 ≤ p < ∞` and any real Banach space `F`, used here with `F = E`;
  `TauCeti.enorm_heatKernel_convolution_le`, `eLpNorm_heatSemigroup_top_le` and
  `exists_contDiff_ae_eq_heatSemigroup` (`Analysis/PDE/HeatKernel/Smoothing.lean:52,83,97`):
  the `Lᵖ`–`L^∞` bound and smoothness of the heat flow, the `q = ∞` case of §2.1.
- `TauCeti.convolutionLp` and `norm_convolutionLp_le`
  (`MeasureTheory/Function/Lp/Convolution.lean:87,117`): convolution with an integrable kernel
  as a bounded operator on `Lᵖ`.
- `TauCeti.Semigroups.StronglyContinuousSemigroup` and `ContractionSemigroup`
  (`Analysis/Semigroups/Basic.lean:43,211`) with `StronglyContinuousSemigroup.generator`
  (`Analysis/Semigroups/Generator/Basic.lean:113`), and `Semigroups.IsMildSolution`
  (`Analysis/Semigroups/CauchyProblem/Basic.lean:94`): the semigroup carrier of §2.2 and the
  mild-solution carrier behind the Duhamel terms of §2.3 and Layer 5.
- `TauCeti.HasWeakLineDerivOn.exists_continuousOn_ae_eq_of_gelfandDual` and
  `HasWeakLineDerivOn.norm_sq_sub_norm_sq_eq_of_gelfandDual`
  (`Analysis/Sobolev/WeakDeriv/GelfandTriple.lean:151,270`): for a Gelfand triple
  `V ↪ H ↪ V*`, a function in `L²(0,T; V)` with weak time derivative in `L²(0,T; V*)` has a
  representative continuous into `H`, with the energy identity. This is the Lions–Magenes
  lemma behind every energy equality below.
- Tau Ceti has no weak divergence of a field without a full weak derivative, no solenoidal
  subspace, no Leray projection, no off-diagonal heat estimate with `q < ∞`, no vector-valued
  Sobolev carrier beyond componentwise use of the scalar ones, and no statement about the
  Navier–Stokes or Euler equations.

### From TauCetiRoadmap.PDE

§1.4 (Sobolev embeddings on `ℝⁿ`), §2.2 (interpolation), §2.3 (Calderón–Zygmund operators,
including the Riesz transforms `R_j` with multiplier `−iξ_j/|ξ|` and their `Lᵖ` bounds), §6.1
(Bochner spaces and the Gelfand triple), §6.3 (the heat semigroup and Duhamel's formula) and
§7.1–§7.3 (the dyadic partition, Besov spaces and paraproducts). Layer 1 consumes §2.3 for the
Riesz transforms and the pinned Mihlin–Hörmander theorem; §2.3 and Layer 5 consume §6.3; §3.3
consumes §7.3; Layers 4 and 5 consume §6.1.

### From TauCetiRoadmap.OneParameterSemigroups

Part A, through the Tau Ceti declarations above.

## References

- J. Leray, *Sur le mouvement d'un liquide visqueux emplissant l'espace*, Acta Math. 63 (1934):
  weak solutions on `ℝ³`, the regularization of §4.2 and the blow-up rate of §5.4.
- W. S. Ożański, B. C. Pooley, *Leray's fundamental work on the Navier–Stokes equations: a
  modern review of "Sur le mouvement d'un liquide visqueux emplissant l'espace"*,
  arXiv:1708.09787: the statements of Leray 1934 cited in §1.2, §2.2, §4.2 and §5.4, on `ℝ³`
  with `ν = 1` and `f = 0`.
- T. Tao, *254A: Incompressible fluid equations*, lecture notes, 2018, Notes 1 (local
  well-posedness of the Navier–Stokes equations), Notes 2 (weak solutions) and Notes 3 (local
  well-posedness for the Euler equations), terrytao.wordpress.com: §1.2, §1.3, §3.3, §4.2,
  §5.2, §6.3–§6.5.
- C. Wang, *Introduction of the Navier–Stokes equations*, lecture notes of a mini-course at
  Beijing Normal University, 2013: §2.2, §3.4, §4.3, §4.4 and §5.1.
- E. Hopf, *Über die Anfangswertaufgabe für die hydrodynamischen Grundgleichungen*, Math.
  Nachr. 4 (1951).
- O. A. Ladyzhenskaya, *The Mathematical Theory of Viscous Incompressible Flow*, 2nd ed.,
  Gordon and Breach, 1969: the inequalities of §3.1 and the two-dimensional theory.
- J.-L. Lions, G. Prodi, *Un théorème d'existence et unicité dans les équations de
  Navier–Stokes en dimension 2*, C. R. Acad. Sci. Paris 248 (1959).
- O. A. Ladyzhenskaya, *Solution "in the large" of the nonstationary boundary value problem
  for the Navier–Stokes system with two space variables*, Comm. Pure Appl. Math. 12 (1959),
  427–433: §4.3.
- J.-L. Lions, *Quelques méthodes de résolution des problèmes aux limites non linéaires*,
  Dunod, 1969: Théorème 5.1, p. 58, the compactness lemma of §3.4.
- G. Prodi, *Un teorema di unicità per le equazioni di Navier–Stokes*, Ann. Mat. Pura Appl. 48
  (1959); J. Serrin, *The initial value problem for the Navier–Stokes equations*, in Nonlinear
  Problems, Univ. of Wisconsin Press, 1963: §4.4.
- H. Fujita, T. Kato, *On the Navier–Stokes initial value problem I*, Arch. Rational Mech.
  Anal. 16 (1964); T. Kato, *Strong `Lᵖ`-solutions of the Navier–Stokes equation in `ℝᵐ`*,
  Math. Z. 187 (1984), 471–480: §5.2.
- T. Kato, *Nonstationary flows of viscous and ideal fluids in `ℝ³`*, J. Funct. Anal. 9 (1972):
  §6.3. T. Kato, G. Ponce, *Commutator estimates and the Euler and Navier–Stokes equations*,
  Comm. Pure Appl. Math. 41 (1988): §3.3 and §6.3. L. Grafakos, S. Oh, *The Kato–Ponce
  inequality*, Comm. Partial Differential Equations 39 (2014), arXiv:1303.5144: the statement
  of the commutator estimate.
- J. T. Beale, T. Kato, A. Majda, *Remarks on the breakdown of smooth solutions for the 3-D
  Euler equations*, Comm. Math. Phys. 94 (1984): §6.4.
- V. I. Yudovich, *Non-stationary flow of an ideal incompressible liquid*, Zh. Vychisl. Mat. i
  Mat. Fiz. 3 (1963); W. Wolibner, *Un théorème sur l'existence du mouvement plan d'un fluide
  parfait, homogène, incompressible, pendant un temps infiniment long*, Math. Z. 37 (1933),
  698–726; T. Kato, *On classical solutions of the two-dimensional non-stationary Euler
  equation*, Arch. Rational Mech. Anal. 25 (1967), 188–200; G. Crippa, G. Stefani, *An
  elementary proof of existence and uniqueness for the Euler flow in localized Yudovich
  spaces*, arXiv:2110.15648: §6.5.
- J. Simon, *Compact sets in the space `Lᵖ(0,T; B)`*, Ann. Mat. Pura Appl. 146 (1987): the
  form of §3.4 without reflexivity.
- A. J. Majda, A. L. Bertozzi, *Vorticity and Incompressible Flow*, Cambridge University Press,
  2002: Chapters 1 (An Introduction to Vortex Dynamics for Incompressible Fluid Flows), 2 (The
  Vorticity-Stream Formulation of the Euler and the Navier–Stokes Equations), 3 (Energy Methods
  for the Euler and the Navier–Stokes Equations), 4 (The Particle-Trajectory Method for
  Existence and Uniqueness of Solutions to the Euler Equation) and 8 (Weak Solutions to the 2D
  Euler Equations with Initial Vorticity in `L^∞`): §6.1, §6.2 and §6.5.
- J. Bedrossian, V. Vicol, *The Mathematical Analysis of the Incompressible Euler and
  Navier–Stokes Equations: An Introduction*, Graduate Studies in Mathematics 225, American
  Mathematical Society, 2022: §1.3, §3.1, §4.3, §4.4, §5.2, §6.2–§6.5.
- G. P. Galdi, *An introduction to the Navier–Stokes initial-boundary value problem*, in
  Fundamental Directions in Mathematical Fluid Mechanics, Birkhäuser, 2000, 1–70: §4.2–§4.4.
- R. Danchin, *Fourier Analysis Methods for PDE's*, lecture notes, 2005: §5.1 and §5.2.
- P. Constantin, G. Seregin, *Hölder continuity of solutions of 2D Navier–Stokes equations
  with singular forcing*, 2009: the appendix, for §3.1.
- L. Grafakos, *Classical Fourier Analysis*, 3rd ed., Springer, 2014: the Riesz transforms of
  the Conventions.
- H. Bahouri, J.-Y. Chemin, R. Danchin, *Fourier Analysis and Nonlinear Partial Differential
  Equations*, Springer, 2011: Chapters 5 and 7, the mild theory and the Euler estimates.
- J. C. Robinson, J. L. Rodrigo, W. Sadowski, *The Three-Dimensional Navier–Stokes Equations*,
  Cambridge University Press, 2016: the weak and strong solution theory of Layers 4 and 5.
- R. Temam, *Navier–Stokes Equations: Theory and Numerical Analysis*, AMS Chelsea, 2001;
  P. Constantin, C. Foias, *Navier–Stokes Equations*, University of Chicago Press, 1988.
- P. G. Lemarié-Rieusset, *The Navier–Stokes Problem in the 21st Century*, 2nd ed., CRC
  Press, 2023: §4.2 and §5.2, and the Oseen kernel estimates of §2.2.
