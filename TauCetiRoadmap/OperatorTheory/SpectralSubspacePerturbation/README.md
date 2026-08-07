# Spectral-subspace perturbation: Sylvester equations, the Rosenblum theorem, and the Davis–Kahan sin Θ theorems

Perturbation theory for self-adjoint operators asks how an invariant subspace moves when the
operator does. Davis and Kahan (1970) answered in the form the subject has used since: the
displacement of a spectral subspace is the operator `sin Θ` built from the two orthogonal
projections, and a spectral gap `δ` between the parts of the spectrum forces
`δ · ‖sin Θ‖ ≤ ‖B − A‖` — in the operator norm, the Frobenius norm, and every unitarily
invariant norm, with **constant one** under interval/exterior or ordered separation and the
sharp constant **`π/2`** under arbitrary two-sided separation.

The main reduction is the Sylvester equation `A X − X B = C`: spectral separation makes it
uniquely solvable with an a-priori bound, and the `sin Θ` theorems are that bound read through
projection geometry. Its qualitative limit is **Rosenblum's theorem** — an operator
intertwining two self-adjoint operators with disjoint spectra is zero, in the unbounded case
that matters. Its statistical variant, **Yu–Wang–Samworth**, moves the gap hypothesis from
the perturbed spectrum to the unperturbed one, which is what a random sample covariance
allows.

Mathlib has the static operator-theory stack but none of this layer: no operator angles, no
Sylvester equations, no spectral-subspace perturbation theory, no statistical variant.

This roadmap is the **endpoint of the [operator theory](../README.md) family**: it consumes
`PolarDecomposition`, `Majorization`, `PrincipalAngles` and `SelfAdjointSpectralTheory`.

Its `Suggested.lean` imports the sibling signature files and uses their declarations
directly; no dependent roadmap redeclares those objects.

Suggested homes:

```text
TauCeti/Analysis/Fourier/HaagerupZsido/
TauCeti/Analysis/Operator/Sylvester/
TauCeti/Analysis/Operator/Perturbation/
```

## Standing conventions

- **Scalar fields, rectangular shapes.** Algebraic and finite statements over `[RCLike 𝕜]`;
  complex-calculus results over `ℂ` with explicit real descent. The `π/2` bound holds
  verbatim over `ℝ` and `ℂ`; the real case is proved via the doubled-phase certificate of
  Part B. Estimates run between two Hilbert spaces with independent universes; endomorphisms
  are the diagonal case.
- **Unbounded statements are canonical.** The domain-aware forms are primary: the Sylvester
  equation on `LinearPMap` with domain transport as data, and spectra via the
  [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md) roadmap's
  `resolventSet` complement. Bounded operators enter through `T.toLinearMap.toPMap ⊤`, finite
  dimension through restriction. Part C proves both are specializations.
- **Norms: one statement per family.** State results for an arbitrary (rectangular) unitarily
  invariant seminorm — subadditive, absolutely homogeneous, two-sided unitarily invariant,
  definiteness deliberately unbundled — with operator, Frobenius, Ky Fan and Schatten forms
  as instantiations. Ky Fan prefixes plus Fan dominance is the pinned lifting route.
- **Gap predicates and angles stay distinct.**
  - Three separations, carrying constants one, one and `π/2`: ordered (`λ + δ ≤ μ`),
    interval/exterior (one spectrum in `[a,b]`, the other outside `(a−δ, b+δ)`), and pairwise
    (`δ ≤ |λ − μ|`). None is silently strengthened.
  - `tan 2Θ` needs *ordered* internal separation: interlacing spectra satisfy pairwise
    separation while an off-diagonal perturbation produces a quarter turn.
  - One interval/exterior gap controls the directed sine `P_{Vᗮ} ∘ P_U` in every unitarily
    invariant norm; the symmetric sine `|P_U − P_V|` needs the gap in both orientations. Only
    the operator norm erases the difference, and only under equal ranks.
  - Both angles are public API. The primitive predicates — pairwise and ordered — belong to
    [`PrincipalAngles`](../PrincipalAngles/README.md); the interval/exterior form and
    `InternalGap`, in which both spectra come from one operator, are application shapes
    defined here.
- **Rosenblum without a Borel functional calculus.** Both Cayley spectra contain `1` once
  both operators are unbounded, so no continuous symbol separates them. But `1` is a null
  point for every diagonal spectral measure, so continuous symbols damped at `1` separate in
  the limit, and dominated convergence finishes.
* **The constant `π/2`.** Part A constructs a kernel of mass exactly `π/2`. The partial converse is proved: every real, undoubled interpolation certificate for the two-by-two obstruction data has coefficient mass at least `5/3 > π/2`. The real-field `π/2` theorem therefore goes through the doubled-phase certificate.
- **Kernel conventions.** The real kernel `ℝ → ℝ` and the complex kernel `ℝ → ℂ`
  (`k = −i·k_ℝ`) both stay: mass and positivity use the real one, the Fourier identity uses
  the complex one. The Laplace transform integrates over `Set.Ioi 0`. The Fourier identity is
  a bare integral against `exp(i t x)` — the form an operator is substituted into — with an
  explicit bridge to Mathlib's `2π`-normalized transform.
- **Population gaps in the statistical variant.** Part D's hypothesis is a gap in the spectrum
  of **one** designated (population) operator, with the perturbed block selected by
  *corresponding ordered eigenvalue indices* rather than as an arbitrary reducing subspace.
  The hypothesis is one-sided: no spectral gap is assumed for the perturbed operator.

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

### Part A — the Haagerup–Zsidó kernel and its Fourier transform

Independently submittable; no prerequisites.

Part A constructs an integrable `k : ℝ → ℂ` whose Fourier integral reproduces the reciprocal
on the whole exterior region `1 ≤ |x|`, and whose total mass is exactly `π/2`. Any kernel
with the first property yields, on substituting a separated pair of self-adjoint operators
for `x`, a Sylvester solution bound with constant `‖k‖₁`; a kernel with the right transform
and worse mass proves a weaker Part B. So both halves — identity and mass — are milestones.
The mathematics is due to Haagerup and Zsidó and is specified here intrinsically.

**Objects.** A four-definition chain: `weight y = tanh (π y / 2)`;
`weightLaplaceTransform t = ∫ y in Ioi 0, weight y · e^{−|t| y}`;
`realKernel t = (sin t / 2) · weightLaplaceTransform t`;
`reciprocalKernel t = −i · realKernel t`, the rotation that lands the transform on `1/x`.

**API to develop.**

- Parity, nonnegativity of the weight and its transform, continuity, measurability; the kernel
  is odd, so the two-sided identity follows from `1 ≤ x` by reflection.
- The scalar integral layer, each piece independently reusable: the two-sided exponential
  (oscillatory Laplace transform, its Fourier transform, decay at infinity); the closed-form
  Laplace transform of `|sin|` by periodic decomposition; Poisson summation against the Cauchy
  kernel and the odd-pole expansion `weight y / y = (4/π) ∑' n, (y² + (2n+1)²)⁻¹`; elementary
  Cauchy-type integrals.
- One **product-integrability certificate** on `Ioi 0 × ℝ` licensing both the Tonelli exchange
  in the mass computation and the later Fourier exchange, with the generic lemmas placed
  generically.

**Milestone A1 — the exterior identity and the exact mass.** The Fourier integral of
`reciprocalKernel` is `1/x` for `1 ≤ |x|`, and `∫ ‖reciprocalKernel‖ = π/2`.

The mass is not an estimate. Tonelli gives
`½ ∫_{y>0} weight y · (∫ |sin t| e^{−y|t|} dt) dy`; the inner integral is closed-form, and its
product with `tanh(π y/2)` collapses — **the weight is chosen to make that cancellation
exact** — leaving `∫_{y>0} (1+y²)⁻¹ = π/2`.

**Milestone A2 — the normalization bridge** to Mathlib's Fourier transform, so users mixing
the two conventions have a lemma rather than a warning.

### Part B — Sylvester equations and the Rosenblum theorem

Needs Part A and the four external roadmaps; Part C consumes it.

Rosenblum's theorem is qualitative: an operator intertwining two self-adjoint operators with
**disjoint** spectra is zero, with `A` and `B` unbounded. The quantitative companions —
a-priori bounds on `‖X‖` when the spectra are **separated** by `δ` — are what Part C
consumes.

**Objects.** The Sylvester operator `X ↦ A X − X B` on rectangular maps; the gap taxonomy of
the generality bar; the domain-aware Sylvester equation on `LinearPMap`, consumed from
`SelfAdjointSpectralTheory`, which owns the transport statement and excludes the estimates to
here.

**API to develop.**

- Finite core: injectivity under positive separation, the canonical eigenbasis solution, the
  coordinate equation `(αᵢ − βⱼ) Xᵢⱼ = Cᵢⱼ`.
- **Dimension-free operator-norm bounds**, integral-free, on arbitrary Hilbert spaces, in both
  orientations `A X ± X B = Y`: the coercive (Lyapunov) form `‖X‖ ≤ ‖Y‖ / (2δ)` and the
  separated form `‖X‖ ≤ ‖Y‖ / g`, by shifting both operators to the midpoint and solving for
  `‖X‖`; the operator-level Lax–Milgram lemma making a coercive operator a unit.
- **Interval/exterior separation, constant one, every rectangular unitarily invariant norm**:
  polar absorption — shift the interval to its midpoint, replace the exterior operator by its
  modulus, absorb the polar partial isometry into the unknown — with the reverse orientation
  by adjoint transport.
- **Pairwise separation, constant `π/2`.**
  - The analytic root is a *simultaneous Ky Fan prefix estimate*: one finite family of left
    and right unitaries realizing the reciprocal multiplier on every coordinate matrix unit
    at once, with mass at most `π/2`, by finite Fourier interpolation against Part A's kernel.
    The `π/2` is Part A's mass, not an unspecified constant.
  - Fan dominance lifts the estimate to every unitarily invariant norm, and orbit convexity
    packages the scaled solution as a barycenter of the defect's unitary orbit.
  - The **Frobenius norm loses nothing** — constant one, by dividing the coordinate equation
    and summing squares.
  - For self-adjoint `LinearPMap`s, the domain-aware `SylvesterEquation` carries the same
    pairwise `π/2` operator-norm estimate against `SelfAdjointSpectralTheory.spectrum`.
  - The interpolation layer is internal, not public surface.
**Milestone B1 — the a-priori bounds**: the dimension-free coercive bound, the
interval/exterior bound with constant one in every rectangular unitarily invariant norm, and
the pairwise bound with `π/2`, including the domain-aware `LinearPMap` operator-norm endpoint.

**Milestone B2 — Rosenblum's theorem** for self-adjoint `LinearPMap`s: a bounded operator
intertwining two of them with disjoint spectra is zero.

### Part C — the Davis–Kahan sin Θ theorems

Consumes Part B; the acceptance suite is Davis–Kahan Part III.

The `sin Θ` family is Part B read through projection geometry. Two statement shapes, both
public API: the **residual** form — the numerical analyst's, where an approximate invariant
subspace with residual `R = A X − X M` is tilted by at most `‖R‖/δ` — and the
**perturbation** form — the operator theorist's, where invariant subspaces of `A` and `B` are
tilted by at most `‖B − A‖/δ` — each for every relevant unitarily invariant norm, with the
interval, spectral-projector and concrete-norm corollaries.

**Objects.** Consumed from `PrincipalAngles`: `sinThetaMap U V = P_{Vᗮ} ∘ P_U`, the
symmetric sine `|P_U − P_V|`, and the principal angles. Built here: the trial-map layer — the
compression `X⋆ A X` along a trial map, isometric or not, its residual, the Ritz residual
(Rayleigh–Ritz makes it Frobenius-minimal), and the sine and cosine embeddings with their
singular-value identifications; reduced extensions, a block operator extended by a scalar on
the complement, which is the device that turns spectral hypotheses into coercivity; and graph
subspaces with their projection and gap formulas and angular operators.

**API to develop.**

- **Dimension-free first.** On arbitrary Hilbert spaces, from Milestone B1 alone: the directed
  bound `‖P_V ∘ P_U‖ ≤ ‖B − A‖ / g` for invariant subspaces with quadratic-form separation,
  and its projector-difference companions.
- **Finite spectral forms.** Spectral coercivity bridges convert eigenvalue hypotheses into
  form bounds, giving the residual theorem in every rectangular unitarily invariant norm; the
  perturbation theorem in every square one, by transport across the subspace's isometric
  inclusion; canonical spectral-subspace and spectral-projector statements with no eigenbasis
  in the API; the equal-rank bridge `‖P_U − P_V‖ = ‖sinThetaMap U V‖`; the Frobenius and Ky
  Fan corollaries; the `π/2` two-sided form; and the symmetric sharp theorem under the
  two-orientation gap.
- **Double-angle and tangent theory.** Davis's `sin 2θ` in per-eigenvector product and angle
  forms; the one-sided `sin 2Θ` map `2 P_{Uᗮ} P_V P_U` in unitarily invariant norms; tangent
  estimates on the acute branch from Ritz residuals, equal-rank and lower-rank; and the sharp
  `tan 2θ` with vanishing-pinch hypotheses and the quarter-turn conclusion, under *ordered*
  internal separation.

**Milestone C1 — the perturbation family**, with the canonical spectral-projector corollary
`δ · ‖P_{spec A [a,b]} − P_{spec B [a,b]}‖ ≤ ‖B − A‖` under equal ranks.

**Milestone C2 — the two-sided `π/2` form**: under pairwise separation of the selected
`A`-spectrum from the complementary `B`-spectrum alone,
`δ · N (sinThetaMap U V) ≤ (π/2) · N (B − A)` for every unitarily invariant `N`.

### Part D — the Yu–Wang–Samworth statistical variant

Consumes Part C; a leaf.

Davis–Kahan hypothesizes a gap in the spectrum of one of the two operators — in practice the
perturbed one. That is the wrong shape for statistics: the perturbed operator is a *sample*
covariance and its spectrum is random; what one can assume is a gap in the **population**
spectrum. Yu–Wang–Samworth is the variant stated that way. Its probabilistic inputs live in
[`MatrixSpectralStatistics`](../MatrixSpectralStatistics/README.md); this Part is the
deterministic inequality they compose with.

**Objects.** `PopulationGap A U Δ`, the population operator's internal gap across the selected
block; `CorrespondingEigenblock`, blocks of the two operators selected by the *same ordered
eigenvalue indices*; the Frobenius sine distance; the residual columns
`(S − λⱼ(T)) uⱼ(S)` in the population eigenbasis; and, for rectangular data, left and right
singular subspaces via the Gram operators and the Hermitian dilation `[[0, A⋆], [A, 0]]`.

**API to develop.**

- The **complement identity**: the Frobenius sine of two equally indexed eigenblocks equals the
  square root of the cross-block overlap sum. Every bound of the paper is proved as cross-block
  energy and read back as an angle, so this bridge is public API rather than an internal step.
- The **residual sandwich**, for an **arbitrary index block** — leading-only would not cover the
  interval case: `Δ² · overlap ≤ ∑ⱼ ‖Rⱼ‖²` from the population gap below, and
  `∑ⱼ ‖Rⱼ‖² ≤ 4 ‖S − T‖²_F` above, each column splitting into a perturbation piece and a
  Hoffman–Wielandt eigenvalue piece; with the operator-norm branch
  `∑_{j∈s} ‖Rⱼ‖² ≤ 4 |s| ε²` via Weyl.
- The **aligned-basis (Procrustes) surface**: orthonormal bases of the two blocks with
  `√(∑ ‖vᵢ − uᵢ‖²) ≤ √2 · ‖sin Θ‖_F` — the usable form when eigenbases are determined only up
  to rotation, which is every application.
- The **singular-subspace transfer**: the symmetric theorem applied to `A⋆A` and `A A⋆`, the
  Gram perturbation bounded by `(‖Â‖ + ‖A‖) · ‖Â − A‖`, and the Hermitian-dilation form
  controlling both sides at once — whose arbitrary-set gap supports `π/2`, not constant one.

**Milestone D1 — the population-gap theorem and its single-vector form**, the latter being the
sign-aligned eigenvector corollary that statisticians quote.

## Worked examples (acceptance criteria)

### Part A — the Haagerup–Zsidó kernel and its Fourier transform

**Acceptance examples.** The identity at a concrete `x`; the mass bounding one concrete
convolution; `π/2` is attained by Part A's kernel.

### Part B — Sylvester equations and the Rosenblum theorem

**Acceptance examples.** The two-by-two obstruction data (`α = (−1,1)`, `β = (0,2)`, gap one)
is admissible yet forces mass `≥ 5/3` on every real undoubled certificate; a bounded pair as
total partial maps recovers bounded uniqueness; the coercive bound on a concrete
multiplication pair.

### Part C — the Davis–Kahan sin Θ theorems

**Acceptance suite — Davis–Kahan Part III.** A source-facing layer recording the correspondence
between the paper's statements and the reusable declarations, in real and complex forms: the
generalized and ordinary `sin Θ` theorems; equal-rank and lower-rank Ritz-residual `tan Θ`;
`sin 2Θ` in unitarily invariant norms; the sharp operator-norm `tan 2Θ` with the quarter-turn
conclusion; the projector-difference companions; the paper's printed counterexample and
sharpness statements; equality models of arbitrary finite multiplicity; and explicit statements
of what is *not* claimed. Cross-checks between projection, singular-value, column-energy and
tensor formulations on small matrix models complete it.

### Part D — the Yu–Wang–Samworth statistical variant

**Acceptance examples.** A spiked model where the sample gap closes but the population gap does
not; consistency — when a two-sided gap does hold, Part C's constant-one bound is stronger; a
non-square matrix through the Gram route. Cite and cross-check, never vendor, the related
endpoints in `YuanheZ/lean-stat-learning-theory` and `facebookresearch/atlas-lean`, the latter
for statement comparison only, its repository terms being incompatible.

## Ordering

**Internal.** Part A is independent and independently submittable. Part B consumes Part A for
the constant; Part C consumes Part B; Part D consumes Part C. Within Part B the finite core,
the dimension-free bounds can proceed in parallel once their external inputs
exist; within Part C the dimension-free layer precedes the finite spectral forms.

**External.**
[`PolarDecomposition`](../PolarDecomposition/README.md): the modulus and singular values
(Parts B–D). [`Majorization`](../Majorization/README.md): the unitarily invariant seminorm
structures with Fan dominance and the Frobenius seminorm (Parts B–D).
[`PrincipalAngles`](../PrincipalAngles/README.md): `sinThetaMap`, the angle operators,
spectral subspaces, the separation predicates, aligned bases and Weyl perturbation
(Parts B–D). [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md): unitary
groups and Stone, the `LinearPMap` resolvent and spectrum layer with the Cayley transform and
the intertwining chain, the spectral measure and its support, and the domain-aware Sylvester
equation (Parts B–C).

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
Inc.). The public API and proof structure may change during integration. In particular, the
existing statements carry paper numbering and paper-flavoured names; a submission states the
theorems in terms of the objects above, with the source correspondence confined to the
acceptance layer of Part C.

Material in the Sylvester and `sin Θ` lineage was adapted from the Spectra Formalization
Project at upstream revision `8dbaaf6728d1342ae16acf79fd7eef7c59b37e63`, with a recorded
compatibility patch; the Haagerup–Zsidó kernel material has no such influence.
