# Spectral-subspace perturbation: Sylvester equations, the Rosenblum theorem, and the Davis–Kahan sin Θ theorems

## Introduction

Spectral-subspace perturbation theory quantifies how an invariant subspace moves when a
self-adjoint operator is perturbed. The displacement is expressed through the sine of the principal
angle between the original and perturbed spectral subspaces. A spectral gap converts the
intertwining or residual equation for these subspaces into a Sylvester equation, so norm bounds for
the Sylvester inverse become `sin Θ`, tangent, and double-angle estimates.

Three separation geometries govern the sharp constants. Ordered and interval/exterior separation
give constant-one estimates, while arbitrary pairwise separation gives the sharp factor `π/2` for
general unitarily invariant norms. The Haagerup–Zsidó reciprocal kernel supplies this `π/2` bound.
Rosenblum's theorem is the qualitative disjoint-spectrum limit. The Yu–Wang–Samworth form uses a
population spectral gap and gives the finite-dimensional subspace bounds used in statistical
applications.

The roadmap assembles the angle geometry from [`PrincipalAngles`](../PrincipalAngles/README.md),
the norm-transfer machinery from [`Majorization`](../Majorization/README.md), the bounded polar
geometry from [`PolarDecomposition`](../PolarDecomposition/README.md), and the domain-aware
resolvent theory from [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md).

Suggested homes:

```text
TauCeti/Analysis/Fourier/HaagerupZsido/
TauCeti/Analysis/Operator/Sylvester/
TauCeti/Analysis/Operator/Perturbation/
```

## Notation and terminology

- **Scalars and Hilbert spaces.** Finite-dimensional algebraic statements use `𝕜 = ℝ` or `ℂ`.
  Complex functional-calculus statements use complex Hilbert spaces, with real forms stated where
  developed. Rectangular estimates allow different source and target Hilbert spaces.
- **Self-adjoint operators and perturbations.** `A` and `B` denote self-adjoint operators. Their
  difference `B-A` is the perturbation in the Davis–Kahan estimates.
- **Subspaces and projections.** `U` and `V` denote projected subspaces, with orthogonal projections
  `P_U` and `P_V`. Orthogonal complements are written `U⊥` and `V⊥`.
- **Directed and symmetric sine.** `P_{V⊥}P_U` is the directed sine map from `U` toward `V⊥`.
  `|P_U-P_V|` is the symmetric sine angle operator. Their operator norms agree under the standard
  equal-rank hypotheses, while general unitarily invariant norms retain the orientation data.
- **Spectral gaps.** `δ` or `g` denotes a positive separation parameter. *Ordered separation*
  fixes the relative order of two spectra; *interval/exterior separation* places one spectrum in an
  interval and the other outside an enlarged interval; *pairwise separation* bounds every
  cross-distance between the two spectra.
- **Internal gap.** An internal gap `Δ` separates the spectrum of a selected reducing block of one
  self-adjoint operator from the spectrum of its orthogonal complement.
- **Sylvester equation.** For self-adjoint `A` and `B`, the Sylvester equation is
  `AX-XB=C`. The operator `X` is the unknown and `C` is the defect or forcing term.
- **Unitarily invariant seminorms.** `N` denotes a rectangular unitarily invariant seminorm.
  Operator, Frobenius, Ky Fan, and Schatten norms are the standard instances used in the theorem
  family.
- **Haagerup–Zsidó kernel.** The weight is `w(y)=tanh(πy/2)`, its one-sided Laplace transform is
  `L(t)`, the real kernel is `r(t)=(sin t/2)L(t)`, and the reciprocal kernel is `k(t)=-ir(t)`.
- **Fourier convention.** The reciprocal identity is written as the bare integral
  `∫_ℝ k(t)e^{itx}dt = 1/x` for `1≤|x|`; a separate bridge relates this convention to Mathlib's
  `2π`-normalized Fourier transform.
- **Rosenblum intertwining.** An operator `X` satisfying `AX=XB` is an intertwiner. Rosenblum's
  theorem asserts vanishing of such an intertwiner when the self-adjoint spectra are disjoint.
- **Population and sample operators.** In the statistical layer, `T` denotes the population
  operator, `S` the sample or perturbed operator, and `Δ` the population internal gap. Corresponding
  eigenblocks use the same ordered eigenvalue-index set.
- **Residual columns.** For a selected population eigenblock, `R_j` denotes the residual column
  used to compare the population and sample eigenspaces. Frobenius sine distance is denoted
  `‖sinΘ(U,V)‖_F`.

## What Mathlib already has (consume)

- **For Part A:** the Fourier transform with inversion (mind the `2π` convention), the Bochner
  integral, `Integrable`, exponential decay, Poisson summation, `Real.tanh`, `Analysis/PSeries`.
- **Operators and geometry:** `ContinuousLinearMap`, adjoints, `IsSelfAdjoint`,
  `LinearMap.IsSymmetric`, `spectrum`, `cfcHom` of a star-normal element, Urysohn's lemma;
  `LinearPMap` with `adjoint` and `IsSelfAdjoint`; `Submodule.starProjection`,
  `OrthonormalBasis`, `LinearMap.IsSymmetric.eigenvectorBasis` and `eigenvalues`,
  `Module.finrank`, `WithLp 2 (E × F)`, `lp`.

The spectral predicates, norms, angle operators and unbounded spectral
theory come from the sibling roadmaps itemized under *Dependency ordering*. Everything
below is absent upstream.

## What is missing (build here)

* The Haagerup–Zsidó kernel, its Fourier transform, and the integrability that makes the
  sharp `π/2` constant available.
* The Sylvester operator on rectangular maps, the gap taxonomy, and Rosenblum's theorem, with
  the domain-aware form on `LinearPMap` alongside the bounded one.
* The Davis–Kahan `sin Θ` theorems: the dimension-free bounds, the finite spectral forms in
  every unitarily invariant norm, and the double-angle and tangent theory.
* The Yu–Wang–Samworth statistical variant, whose gap hypothesis sits on the population
  spectrum rather than the perturbed one — together with the complement identity, the
  residual sandwich, and the aligned-basis form.

## The build, in layers

The labels `SSP-S01`, `SSP-A01`–`SSP-A26`, `SSP-B01`–`SSP-B17`, `SSP-B19`,
`SSP-C01`–`SSP-C31`, and `SSP-D01`–`SSP-D19` form the complete mathematical obligation set
for this roadmap. Each label names one definition or theorem. Milestones and acceptance
examples cite these labels. `Suggested.lean` cites the labels represented by its sample
declarations.

### Shared separation object

The internal gap measures the separation between a selected spectral block and its complement
inside one symmetric operator. It is the common spectral hypothesis for the double-angle and
tangent estimates.

- **SSP-S01 — Internal spectral gap.** For a symmetric finite-dimensional operator `A`, a
  projected subspace `U`, and `δ≥0`, define the internal gap by requiring the restricted point
  spectra of `A|_U` and `A|_{U⊥}` to be separated by at least `δ`.

**Milestone S1 — shared internal-gap vocabulary.** `SSP-S01`.

### Part A — the Haagerup–Zsidó kernel and its Fourier transform

Part A constructs an integrable kernel `k : ℝ → ℂ` whose Fourier integral is `1/x` on
`1≤|x|` and whose `L¹` mass is exactly `π/2`.

**Objects.** The construction uses the hyperbolic weight, its one-sided Laplace transform, a
real kernel, and its rotation by `-i`.

- **SSP-A01 — Hyperbolic weight.** Define `w(y)=tanh(πy/2)`.
- **SSP-A02 — Weight Laplace transform.** Define
  `L(t)=∫_{y>0} w(y)e^{-|t|y} dy`.
- **SSP-A03 — Real kernel.** Define `r(t)=(sin t/2)L(t)`.
- **SSP-A04 — Reciprocal kernel.** Define `k(t)=-i r(t)`.
- **SSP-A05 — Weight positivity.** For `y≥0`, `0≤w(y)`.
- **SSP-A06 — Weight continuity.** The function `w` is continuous.
- **SSP-A07 — Laplace-transform positivity.** `0≤L(t)` for every `t`.
- **SSP-A08 — Laplace-transform parity.** `L(-t)=L(t)`.
- **SSP-A09 — Real-kernel measurability.** The function `r` is measurable.
- **SSP-A10 — Reciprocal-kernel measurability.** The function `k` is measurable.
- **SSP-A11 — Real-kernel oddness.** `r(-t)=-r(t)`.
- **SSP-A12 — Reciprocal-kernel oddness.** `k(-t)=-k(t)`.
- **SSP-A13 — Kernel norm formula.** `‖k(t)‖=|r(t)|`.
- **SSP-A14 — Oscillatory two-sided Laplace integral.** For `y>0`,
  `∫_ℝ e^{-y|t|}e^{itx}dt = 2y/(y²+x²)`.
- **SSP-A15 — Fourier transform of a two-sided exponential.** In Mathlib's Fourier
  normalization, the transform of `t ↦ e^{-2πy|t|}` is
  `x ↦ y/(π(y²+x²))` for `y>0`.
- **SSP-A16 — Exponential decay.** A two-sided exponential `e^{-a|x|}` with `a>0` is
  little-o of every real power at infinity.
- **SSP-A17 — Laplace transform of `|sin|`.** For `y>0`,
  `∫_ℝ |sin t|e^{-y|t|}dt = 2(1+e^{-πy})/((1-e^{-πy})(1+y²))`.
- **SSP-A18 — Cauchy-kernel Poisson summation.** The Cauchy kernel satisfies the Poisson
  summation identity used to evaluate its odd lattice sum.
- **SSP-A19 — Odd-pole expansion of the weight.** For `y>0`,
  `w(y)/y = (4/π)∑'_{n≥0}(y²+(2n+1)²)⁻¹`.
- **SSP-A20 — Rational telescoping integral.** For `a≥0`, integrating the odd-pole expansion
  against the difference of the adjacent Cauchy resolvents gives `2/(a+1)`.
- **SSP-A21 — Product integrability certificate.** The kernel integrand on
  `(0,∞)×ℝ` used in the mass and Fourier calculations is integrable.
- **SSP-A22 — Reciprocal-kernel integrability.** The kernel `k` is Bochner integrable on
  `ℝ`.
- **SSP-A23 — Exterior reciprocal Fourier identity.** If `1≤|x|`, then
  `∫_ℝ k(t)e^{itx}dt = 1/x`.
- **SSP-A24 — Exact kernel mass.** `∫_ℝ ‖k(t)‖dt = π/2`.
- **SSP-A25 — Fourier-normalization bridge.** The exterior identity `SSP-A23` has an
  equivalent statement in Mathlib's Fourier-transform normalization.
- **SSP-A26 — Kernel-mass convolution test.** For the explicit bounded operator-valued test
  integrand in the Part A acceptance suite, with `‖F(t)‖≤1`, prove
  `‖∫_ℝ k(t)F(t)dt‖≤π/2`.

The mass identity `SSP-A24` follows by Tonelli: the inner `|sin|` Laplace integral from
`SSP-A17` combines with `w(y)=tanh(πy/2)` so the integrand reduces to `(1+y²)⁻¹`, whose
integral over `(0,∞)` is `π/2`.

**Milestone A1 — kernel construction and elementary calculus.** `SSP-A01`–`SSP-A13`.

**Milestone A2 — Fourier, Laplace, and integrability identities.** `SSP-A14`–`SSP-A22`.

**Milestone A3 — exterior identity, exact mass, and normalization.** `SSP-A23`–`SSP-A25`.

**Milestone A4 — kernel-mass convolution test.** `SSP-A26`.

### Part B — Sylvester equations and the Rosenblum theorem

Rosenblum's theorem gives uniqueness for disjoint spectra. The quantitative Sylvester
estimates strengthen positive spectral separation into norm bounds for solutions.

**Objects.** For self-adjoint operators `A` and `B`, the Sylvester map sends `X` to
`AX-XB`. Finite-dimensional separation uses the predicates from `PrincipalAngles`, including
pairwise separation `PA-C24` and interval/exterior separation `PA-C26`. The unbounded
formulation consumes the domain-aware Sylvester equation `SA-C66` and the self-adjoint
partial-operator spectrum from `SelfAdjointSpectralTheory`.

#### Finite core and dimension-free operator norm

Coordinate division gives the finite-dimensional Sylvester model, while coercivity gives the
dimension-free operator-norm bounds. These estimates establish the constant-one separated
forms before the unitarily invariant extension.

- **SSP-B01 — Sylvester map.** Define the rectangular linear map `X ↦ AX-XB` on bounded
  operators between the two Hilbert spaces.
- **SSP-B02 — Injectivity under positive finite spectral separation.** In finite dimension,
  positive separation of the spectra of self-adjoint `A` and `B` makes the Sylvester map
  injective.
- **SSP-B03 — Canonical eigenbasis solution.** Under positive finite spectral separation,
  the Sylvester equation has the solution obtained by dividing each matrix coefficient by
  the corresponding eigenvalue difference.
- **SSP-B04 — Coordinate Sylvester equation.** In eigenbases of `A` and `B`, every solution
  of `AX-XB=C` satisfies `(αᵢ-βⱼ)Xᵢⱼ=Cᵢⱼ`.
- **SSP-B05 — Coercive operator invertibility.** A bounded operator with a positive
  coercivity lower bound is invertible with inverse norm bounded by the reciprocal of the
  coercivity constant.
- **SSP-B06 — Lyapunov bound.** If the quadratic forms of self-adjoint `A` and `B` are
  bounded below by `δ>0`, every solution of `AX+XB=Y` satisfies
  `‖X‖≤‖Y‖/(2δ)`.
- **SSP-B07 — Separated Sylvester bound.** Let `A` and `B` be bounded symmetric operators,
  let `g>0`, and suppose for some `c` that
  `(c+g)‖x‖² ≤ Re⟪Ax,x⟫` and `Re⟪Bv,v⟫ ≤ c‖v‖²` for all `x,v`. Every solution of
  `AX-XB=Y` satisfies `‖X‖≤‖Y‖/g`.
- **SSP-B08 — Reverse separated bound.** If instead
  `Re⟪Ax,x⟫ ≤ c‖x‖²` and `(c+g)‖v‖² ≤ Re⟪Bv,v⟫` for all `x,v`, every solution of
  `AX-XB=Y` satisfies `‖X‖≤‖Y‖/g`.

#### Unitarily invariant finite-dimensional bounds

Interval/exterior separation gives constant-one bounds through polar geometry. Pairwise
separation combines the Part A kernel with Ky Fan prefix control and Fan dominance, while the
Frobenius estimate follows directly from the coordinate equation.

- **SSP-B09 — Interval/exterior Sylvester bound.** Under interval/exterior separation by
  `δ>0`, every rectangular unitarily invariant seminorm `N` satisfies
  `δ N(X)≤N(C)` for `AX-XB=C`.
- **SSP-B10 — Reverse interval/exterior bound.** The reversed orientation of `SSP-B09`
  satisfies the same constant-one estimate.
- **SSP-B11 — Simultaneous Ky Fan prefix estimate.** Under pairwise spectral separation by
  `δ>0`, all Ky Fan prefix gauges of the solution are bounded simultaneously by
  `(π/(2δ))` times the corresponding prefixes of the defect.
- **SSP-B12 — Reciprocal-multiplier unitary representation.** In finite dimension, the
  reciprocal matrix multiplier for a separated pair is represented by a finite barycentric
  combination of left and right unitary actions with total mass at most `π/2`.
- **SSP-B13 — Pairwise unitarily invariant Sylvester bound.** Under pairwise separation by
  `δ>0`, every rectangular unitarily invariant seminorm satisfies
  `δ N(X)≤(π/2)N(C)`.
- **SSP-B14 — Unitary-orbit barycenter form.** The scaled solution in `SSP-B13` lies in the
  convex hull of the left-right unitary orbit of the defect with total coefficient mass at
  most `π/2`.
- **SSP-B15 — Frobenius constant-one bound.** Under pairwise separation by `δ>0`,
  `δ‖X‖_F≤‖C‖_F`.
- **SSP-B16 — Domain-aware pairwise bound.** For self-adjoint partial operators with spectra
  separated by `δ>0`, every domain-aware Sylvester solution satisfies
  `δ‖X‖≤(π/2)‖C‖`.
- **SSP-B17 — Rosenblum theorem.** A bounded operator intertwining two self-adjoint partial
  operators with disjoint spectra is zero.

#### Bounded/partial bridge

The bounded and partial-operator formulations share the same uniqueness theorem.

- **SSP-B19 — Bounded/partial uniqueness bridge.** Viewing bounded self-adjoint operators as
  total partial operators specializes `SSP-B17` to the bounded Rosenblum uniqueness theorem.

**Milestone B1 — finite Sylvester core.** `SSP-B01`–`SSP-B05`.

**Milestone B2 — dimension-free and unitarily invariant bounds.** `SSP-B06`–`SSP-B16`.

**Milestone B3 — Rosenblum theorem.** `SSP-B17`.

**Milestone B4 — bounded/partial uniqueness bridge.** `SSP-B19`.

### Part C — the Davis–Kahan `sin Θ` theorems

The residual form controls the angle from an approximate invariant subspace through
`R=AX-XM`. The perturbation form controls invariant subspaces of `A` and `B` through
`B-A`. Both forms are public operator-theory statements.

**Objects.** The angle maps, spectral subspaces, spectral form bounds, separation predicates,
and equal-rank projector identity are supplied by `PrincipalAngles`, including
`PA-B29`, `PA-C20`–`PA-C26`. This part adds the trial-map residual layer, reduced extensions,
graph subspaces, and the perturbation theorems obtained by applying Part B to projection
blocks.

#### Trial maps, residuals, and graph subspaces

Trial compression and residuals turn approximate invariance into operator equations. Reduced
extensions and graph subspaces provide the geometric models that convert those equations into
subspace-angle statements.

- **SSP-C01 — Trial compression.** For a trial map `X`, define the compression `X†AX`.
- **SSP-C02 — Trial residual.** Define the residual `R=AX-XM` for a trial map `X` and a
  model operator `M`.
- **SSP-C03 — Ritz residual.** For an isometric trial map, define the Ritz residual by taking
  `M=X†AX` in `SSP-C02`.
- **SSP-C04 — Frobenius minimality of the Ritz residual.** For finite-dimensional trial and
  ambient Hilbert spaces, among model operators on the trial space, the Ritz choice minimizes
  the Frobenius norm of the residual.
- **SSP-C05 — Sine embedding.** Define the cross-complement map measuring the sine of the
  angle from the trial range to a target subspace.
- **SSP-C06 — Cosine embedding.** Define the cross-projection map measuring the cosine of the
  same angle.
- **SSP-C07 — Sine singular-value identification.** The singular values of `SSP-C05` are the
  principal sines of the two subspaces.
- **SSP-C08 — Cosine singular-value identification.** The singular values of `SSP-C06` are
  the principal cosines of the two subspaces.
- **SSP-C09 — Reduced extension.** Extend a self-adjoint block operator by a chosen real
  scalar on the orthogonal complement.
- **SSP-C10 — Reduced-extension form bound.** Spectral containment of the selected block and
  the chosen scalar placement give the corresponding global quadratic-form bound for the
  reduced extension.
- **SSP-C11 — Angular operator.** Define an angular operator from `U` to `U⊥` by
  `XP_U=X` and `P_UX=0`.
- **SSP-C12 — Graph subspace.** Define `graph(U,X)={u+Xu : u∈U}` for an angular operator
  `X`.
- **SSP-C13 — Graph projection formula.** With `A=P_U+X`,
  `P_graph = A(1+X†X)⁻¹A†`.
- **SSP-C14 — Exact graph gap.**
  `‖P_U-P_graph‖ = ‖X‖/sqrt(1+‖X‖²)`.

#### Dimension-free and finite spectral `sin Θ`

The Sylvester bounds from Part B become directed sine bounds after projection onto complementary
subspaces. Finite spectral and equal-rank bridges then produce projector and unitarily invariant
norm forms.

- **SSP-C15 — Dimension-free directed `sin Θ` bound.** Let bounded symmetric `A,B` reduce
  subspaces `U,W`, let `g>0`, and suppose for some `c` that
  `(c+g)‖u‖² ≤ Re⟪Au,u⟫` on `U` and `Re⟪Bw,w⟫ ≤ c‖w‖²` on `W`. Then on arbitrary
  Hilbert spaces, `‖P_WP_U‖ ≤ ‖B-A‖/g`.
- **SSP-C16 — Dimension-free projector-gap companions.** For selected reducing subspaces
  `U,V`, apply `SSP-C15` with `W=V⊥` and the reversed estimate with `U⊥` and `V`. Under
  those two directed form-separation hypotheses, both directed sine bounds hold and hence
  `‖P_U-P_V‖ ≤ ‖B-A‖/g`.
- **SSP-C17 — Residual `sin Θ` theorem.** Under interval/exterior separation, every
  rectangular unitarily invariant seminorm satisfies `δ N(sinΘ)≤N(R)` for a trial residual.
- **SSP-C18 — Perturbation `sin Θ` theorem.** Under interval/exterior separation, every
  square unitarily invariant seminorm satisfies `δ N(sinΘ)≤N(B-A)`.
- **SSP-C19 — Canonical spectral-subspace residual form.** `SSP-C17` specializes canonically
  to spectral subspaces selected by real spectral sets.
- **SSP-C20 — Canonical spectral-projector bound.** Under the interval/exterior hypotheses
  and equal selected ranks, `δ‖P_{spec A}-P_{spec B}‖≤‖B-A‖`.
- **SSP-C21 — Frobenius `sin Θ` corollary.** The residual and perturbation theorems specialize
  to the Frobenius norm.
- **SSP-C22 — Ky Fan `sin Θ` corollary.** The residual and perturbation theorems specialize
  to every Ky Fan norm.
- **SSP-C23 — Pairwise `π/2` perturbation theorem.** Under pairwise separation by `δ>0`,
  `δN(sinΘ)≤(π/2)N(B-A)` for every square unitarily invariant seminorm.
- **SSP-C24 — Symmetric two-orientation constant-one theorem.** When the interval/exterior
  gap holds in both orientations, the symmetric projector-gap estimate has constant `1`.

#### Double-angle and tangent theory

Ordered two-block form separation gives the finite-dimensional `sin 2Θ` estimate. Ritz
compression/exterior separation gives the tangent estimate together with the pole-free
transversality needed to interpret principal tangents, while an off-diagonal perturbation
sharpens the eigenvector product inequality to the `tan 2θ` form.

- **SSP-C25 — Per-eigenvector `sin 2θ` product bound.** Let bounded symmetric `A,H` act on a
  Hilbert space, let `U` be `A`-invariant, let `a<b`, and assume
  `Re⟪Az,z⟫≤a‖z‖²` on `U⊥` and `b‖y‖²≤Re⟪Ay,y⟫` on `U`. If `‖H‖≤ε` and a unit
  vector `x` satisfies `(A+H)x=λx`, then `(b-a)‖P_Ux‖‖P_{U⊥}x‖≤ε`.
- **SSP-C26 — Per-eigenvector angle form.** Under `SSP-C25`, define
  `θ=arccos ‖P_Ux‖`. Then `(b-a) sin(2θ)≤2ε`.
- **SSP-C27 — Finite-dimensional `sin 2Θ` perturbation theorem.** Let finite-dimensional
  symmetric `A,B` leave `U,V` invariant. If `a<b` and `A` satisfies the two-block form bounds
  `Re⟪Az,z⟫≤a‖z‖²` on `U⊥` and `b‖y‖²≤Re⟪Ay,y⟫` on `U`, then every square
  unitarily invariant seminorm `N` satisfies `(b-a) N(2P_{U⊥}P_VP_U) ≤ 2N(B-A)`.
- **SSP-C28 — Equal-rank Ritz-residual `tan Θ` theorem.** Let `A` be symmetric on a
  finite-dimensional Hilbert space, let `U` be `A`-invariant, and let an isometric trial map
  `X` have `rank(range X)=rank(U)`. If the spectrum of `X†AX` lies in `[β,α]`, the spectrum
  of `A|_{U⊥}` lies in `[α+δ,∞)`, and `δ>0`, then every directed principal angle from
  `range X` to `U` is strictly below `π/2`. For every rectangular unitarily invariant seminorm
  `N`, any tangent operator whose singular values are the resulting principal tangents satisfies
  `δN(tanΘ)≤N(R)`, where `R=AX-X(X†AX)`.
- **SSP-C29 — Lower-rank Ritz-residual `tan Θ` theorem.** The pole-free conclusion and
  residual bound of `SSP-C28` remain valid when `rank(range X)<rank(U)` under the same
  interval/exterior spectral hypotheses.
- **SSP-C30 — Off-diagonal `tan 2θ` product bound.** Under `SSP-C25`, additionally assume
  that both diagonal blocks of `H` relative to `U⊕U⊥` vanish. Then
  `(b-a)‖P_Ux‖‖P_{U⊥}x‖ ≤ |‖P_Ux‖²-‖P_{U⊥}x‖²| ε`.
- **SSP-C31 — Quarter-acute branch from the ordered form gap.** Over `ℝ` or `ℂ`, let
  self-adjoint `A,H` act on a Hilbert space, let `U` be `A`-invariant and `V` be
  `(A+H)`-invariant, and let `a<b`. Assume `A` satisfies
  `b‖u‖²≤Re⟪Au,u⟫` on `U` and `Re⟪Az,z⟫≤a‖z‖²` on `U⊥`, while `A+H` satisfies the
  same two-block bounds relative to `V`. If `H(U)⊆U⊥` and `H(U⊥)⊆U`, then
  `‖P_U-P_V‖<sqrt(2)/2`. In finite dimension, equivalently, the maximal principal angle
  from `U` to `V` is less than `π/4`.

**Milestone C1 — trial maps, residuals, and graph subspaces.** `SSP-C01`–`SSP-C14`.

**Milestone C2 — dimension-free and finite spectral `sin Θ` theory.** `SSP-C15`–`SSP-C24`.

**Milestone C3 — double-angle and tangent theory.** `SSP-C25`–`SSP-C31`.

### Part D — the Yu–Wang–Samworth statistical variant

The population-gap formulation uses a deterministic gap in the population spectrum and
produces the subspace error bound used by statistical applications.

**Objects.** This part selects corresponding eigenblocks by common ordered eigenvalue indices,
measures their Frobenius sine distance, and transfers the symmetric perturbation theorem to
left and right singular subspaces. The aligned-family construction `PA-A27`–`PA-A28` and the
right and left Gram perturbation bounds `PA-B03`–`PA-B06` are consumed from
`PrincipalAngles`.

- **SSP-D01 — Corresponding eigenblocks.** Define two eigenblocks of symmetric `A` and `B`
  to correspond when they are spanned by the same ordered eigenvalue-index set.
- **SSP-D02 — Frobenius sine distance.** Define `‖sinΘ(U,V)‖_F` as the Frobenius norm of the
  directed sine map.
- **SSP-D03 — Population residual columns.** For a selected population eigenblock, define
  the residual columns `(S-λ_j(T))u_j(S)` in a population eigenbasis.
- **SSP-D04 — Left singular subspace.** Define selected left singular subspaces through the
  spectral subspaces of `AA†`.
- **SSP-D05 — Right singular subspace.** Define selected right singular subspaces through
  the spectral subspaces of `A†A`.
- **SSP-D06 — Hermitian dilation.** Define the self-adjoint block operator
  `[[0,A†],[A,0]]` associated to a rectangular map `A`.
- **SSP-D07 — Complement identity.** For equally indexed eigenblocks, the squared
  Frobenius sine equals the cross-block sum of squared overlaps.
- **SSP-D08 — Residual lower sandwich.** Under population internal gap `Δ`,
  `Δ²·overlap ≤ ∑_j ‖R_j‖²` for an arbitrary selected index block.
- **SSP-D09 — Residual Frobenius upper sandwich.** For an arbitrary selected index block,
  `∑_j ‖R_j‖² ≤ 4‖S-T‖_F²`.
- **SSP-D10 — Residual operator-norm upper sandwich.** If the selected block has cardinality
  `d` and `ε=‖S-T‖`, then `∑_j ‖R_j‖² ≤ 4dε²`.
- **SSP-D11 — Residual column decomposition.** Each residual column decomposes into a direct
  perturbation term and an eigenvalue-displacement term controlled by Weyl's inequality.
- **SSP-D12 — Singular-subspace Gram transfer.** For finite-dimensional rectangular
  `A,Â:E→F`, an interval/exterior gap `δ>0` for the selected spectral blocks of `A†A,Â†Â`
  gives `δ‖sinΘ(U_R,Ŭ_R)‖ ≤ (‖Â‖+‖A‖)‖Â-A‖`; the analogous gap for `AA†,ÂÂ†` gives
  the same bound for the selected left singular subspaces.
- **SSP-D13 — Hermitian-dilation perturbation bound.** The operator norm of the difference
  of two Hermitian dilations equals the operator norm of the difference of the rectangular
  maps.
- **SSP-D14 — Hermitian-dilation spectral transfer.** Singular values and left/right
  singular subspaces of `A` are recovered from the positive and negative spectral blocks of
  its Hermitian dilation.
- **SSP-D15 — Dilation pairwise-gap bound.** Let `D(A)` and `D(Â)` be the Hermitian
  dilations and let `Ω⊆ℝ`. If their selected spectral subspaces satisfy a pairwise spectral
  gap `δ>0`, then `δ‖sinΘ(E_{D(A)}(Ω),E_{D(Â)}(Ω))‖ ≤ (π/2)‖D(Â)-D(A)‖`.
- **SSP-D16 — Population-gap `sin Θ` theorem.** For corresponding rank-`d` eigenblocks and
  population internal gap `Δ>0`,
  `‖sinΘ(U,V)‖_F ≤ 2 min(sqrt(d)‖B-A‖, ‖B-A‖_F)/Δ`.
- **SSP-D17 — Aligned-basis population-gap theorem.** Under `SSP-D16`, corresponding
  orthonormal bases can be aligned with discrepancy at most `sqrt(2)` times the right-hand
  side of `SSP-D16`.
- **SSP-D18 — Single-eigenvector population-gap theorem.** The rank-one case gives a
  phase-aligned eigenvector bound with constant `2sqrt(2)`.
- **SSP-D19 — Rectangular singular-vector population-gap theorem.** Let finite-dimensional
  `A,Â:E→F` satisfy `‖Ax‖≤a‖x‖`, `‖Âx‖≤â‖x‖`, and `‖(Â-A)x‖≤ε‖x‖`, with
  `â,ε≥0`. If a finite index block `s` of the right Gram operator `A†A` is separated from
  its complement by a squared-singular-value gap `Γ≥0`, then
  `Γ²∑_{j∈s}∑_{k∉s}|⟪v_k(A†A),v_j(Â†Â)⟫|² ≤ 4|s|((a+â)ε)²`. Replacing
  `A†A,Â†Â` by `AA†,ÂÂ†` gives the same inequality for the corresponding left singular
  vectors.

**Milestone D1 — statistical subspace objects and transfer lemmas.** `SSP-D01`–`SSP-D15`.

**Milestone D2 — population-gap theorems.** `SSP-D16`–`SSP-D19`.

## Worked examples (acceptance criteria)

### Part A

The concrete exterior-transform and mass tests specialize `SSP-A23`–`SSP-A26`.

### Part B

The bounded/partial uniqueness bridge is `SSP-B19`.

### Part C

The residual and perturbation `sin Θ` families are `SSP-C17`–`SSP-C24`; the double-angle and
tangent and quarter-acute theorems are `SSP-C25`–`SSP-C31`.

### Part D

The symmetric and rectangular population-gap transfers are `SSP-D16`–`SSP-D19`. The
two-sided-gap comparison uses `SSP-C24`.

## Ordering

Part A is independent. Part B consumes Part A and the finite-dimensional separation,
unitarily invariant norm, and partial-operator APIs of the prerequisite roadmaps. Part C
consumes Part B and the angle geometry of `PrincipalAngles`. Part D consumes Part C and the finite-dimensional Gram and singular-subspace APIs.

## References

- C. Davis, W. M. Kahan, *The rotation of eigenvectors by a perturbation. III*, SIAM J. Numer.
  Anal. **7** (1970), 1–46 — the principal worked source.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6** (1963),
  159–173 — the `sin 2θ` theorem.
- M. Rosenblum, *On the operator equation BX − XA = Q*, Duke Math. J. **23** (1956), 263–269.
- R. Bhatia, C. Davis, A. McIntosh, *Perturbation of spectral subspaces and solution of linear
  operator equations*, Linear Algebra Appl. **52/53** (1983), 45–67.
- U. Haagerup and L. Zsidó — the extremal kernel attaining `π/2`, followed through the
  Albeverio–Makarov–Motovilov reconstruction of the provenance of the constant.
- R. Bhatia, *Matrix Analysis*, GTM 169, Ch. VII.2 — Part B's separated bound is the half-line
  case of Theorem VII.2.3, by an integral-free proof.
- Y. Yu, T. Wang, R. J. Samworth, *A useful variant of the Davis–Kahan theorem for
  statisticians*, Biometrika **102** (2015), 315–323.

## Acknowledgements

An Apache-2.0 implementation of all four Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware,
Inc.).

Material in the Sylvester and `sin Θ` lineage was adapted from the Spectra Formalization
Project at upstream revision `8dbaaf6728d1342ae16acf79fd7eef7c59b37e63`, with a recorded
compatibility patch; the Haagerup–Zsidó kernel material has no such influence.
