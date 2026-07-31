# Spectral-subspace perturbation: Sylvester equations, the Rosenblum theorem, and the Davis–Kahan sin Θ theorems

Perturbation theory for self-adjoint operators asks how an invariant subspace moves when the
operator does. Davis and Kahan (1970) answered in the form the subject has used since: the
displacement of a spectral subspace is the operator `sin Θ` built from the two orthogonal
projections, and a spectral gap `δ` between the parts of the spectrum forces
`δ · ‖sin Θ‖ ≤ ‖B − A‖` — in the operator norm, the Frobenius norm, and every unitarily
invariant norm, with **constant one** under interval/exterior or ordered separation and the
sharp constant **`π/2`** under arbitrary two-sided separation.

The engine is the Sylvester equation `A X − X B = C`: spectral separation makes it uniquely
solvable with an a-priori bound, and the `sin Θ` theorems are that bound read through
projection geometry. Its qualitative limit is **Rosenblum's theorem** — an operator
intertwining two self-adjoint operators with disjoint spectra is zero, in the unbounded case
that matters. Its statistical variant, **Yu–Wang–Samworth**, moves the gap hypothesis from
the perturbed spectrum to the unperturbed one, which is what a random sample covariance
allows.

Mathlib has the static operator-theory stack but none of this layer: no operator angles, no
Sylvester equations, no spectral-subspace perturbation theory, no statistical variant.

The goal is to build the reusable theory of these objects, not to race to the named theorems.
The bar for done: a researcher in operator theory or statistics finds Sylvester equations with
solvability and a-priori estimates at every relevant generality — bounded and domain-aware,
operator norm through arbitrary unitarily invariant norms, constant one and `π/2` — the
`sin Θ` family as consequences of that developed theory, and the statistical variant stated
the way its consumers use it.

This roadmap is the **endpoint of the
[Hilbert-space operator theory](../README.md) family**: it consumes all five of the others.
That transitive depth is the honest cost of stating Davis–Kahan over objects that exist
rather than over objects assumed — every norm, angle, ideal and spectral projection its
theorems quantify over is built first.

Its `Suggested.lean` imports the sibling signature files and uses their declarations directly.
In particular, spectral predicates come from operator foundations, invariant seminorms from
majorization and angles, and the rectangular domain-aware Sylvester equation and resolvent
vocabulary from self-adjoint spectral theory. No dependent roadmap redeclares those objects.

Suggested homes:

```text
TauCeti/Analysis/Fourier/HaagerupZsido/
TauCeti/Analysis/Operator/Sylvester/
TauCeti/Analysis/Operator/Perturbation/
```

## Generality bar

Decide these up front; do not silently specialize.

- **Scalar fields, rectangular shapes.** Algebraic and finite statements over `[RCLike 𝕜]`;
  complex-calculus results over `ℂ` with explicit real descent. The `π/2` bound holds
  verbatim over `ℝ` and `ℂ` — the real case is a theorem, via the doubled-phase certificate
  of Part B, and not a remark. Estimates run between two different Hilbert spaces with
  independent universes; endomorphisms are the diagonal case.
- **Unbounded statements are canonical.** The domain-aware forms — the Sylvester equation on
  `LinearPMap` with domain transport as data, spectra via the
  [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md) roadmap's
  `resolventSet` complement — are primary; bounded operators enter through
  `T.toLinearMap.toPMap ⊤`, finite dimension through restriction. Bounded and finite theorems
  are *specializations*, and Part C says how that is made true in the code rather than only
  in the prose.
- **Norms: one statement per family.** State results for an arbitrary (rectangular) unitarily
  invariant seminorm — subadditive, absolutely homogeneous, two-sided unitarily invariant,
  definiteness deliberately unbundled — with operator, Frobenius, Ky Fan and Schatten forms
  as instantiations. Ky Fan prefixes plus Fan dominance is the pinned lifting route.
- **Gap predicates and angles stay distinct.** Ordered separation (`λ + δ ≤ μ`),
  interval/exterior separation (one spectrum in `[a,b]`, the other outside `(a−δ, b+δ)`), and
  pairwise separation (`δ ≤ |λ − μ|`) carry constants one, one and `π/2`. None is silently
  strengthened, and `tan 2Θ` needs *ordered* internal separation: interlacing spectra satisfy
  pairwise separation while an off-diagonal perturbation produces a quarter turn. One
  interval/exterior gap controls the directed sine `P_{Vᗮ} ∘ P_U` in every unitarily invariant
  norm; the symmetric sine `|P_U − P_V|` needs the gap in both orientations; only the operator
  norm erases the difference, and only under equal ranks. Both angles are public API.
  The two primitive predicates — pairwise and ordered — are owned by
  [`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md); the
  interval/exterior and two-block forms are application shapes and are defined here.
- **Rosenblum without a Borel functional calculus.** Both Cayley spectra contain `1` once
  both operators are unbounded, so no continuous symbol separates them — but `1` is a **null
  point for every diagonal spectral measure**, so continuous symbols damped at `1` separate
  in the limit and dominated convergence finishes. A reviewer should check the null claim
  rather than the proof: if it failed, the argument would be wrong rather than merely
  different.
- **The constant `π/2`, honestly.** Part A's kernel *attains* `π/2`; that no admissible kernel
  beats it is a literature citation, not a target here, and the module documentation must say
  so. What *is* proved is a partial converse: every **real, undoubled** interpolation
  certificate for the two-by-two obstruction data has coefficient mass at least `5/3 > π/2` —
  so the real-field `π/2` theorem goes through the doubled-phase certificate and never a real
  kernel.
- **Kernel conventions.** The real kernel `ℝ → ℝ` and the complex kernel `ℝ → ℂ`
  (`k = −i·k_ℝ`) both stay: mass and positivity use the real one, the Fourier identity states
  cleanly with the complex one. The Laplace transform integrates over `Set.Ioi 0`. The
  Fourier identity is a bare integral against `exp(i t x)` — the form an operator is
  substituted into — with an explicit bridge to Mathlib's `2π`-normalized transform.
- **Population gaps in the statistical variant.** Part D's hypothesis is a gap in the spectrum
  of **one** designated (population) operator, with the perturbed block selected by
  *corresponding ordered eigenvalue indices* rather than as an arbitrary reducing subspace.
  Pinned so that nobody simplifies it back to a two-sided gap.

## What Mathlib already has

- **For Part A:** the Fourier transform with inversion (mind the `2π` convention), the Bochner
  integral, `Integrable`, exponential decay, Poisson summation, `Real.tanh`, `Analysis/PSeries`.
- **Operators and geometry:** `ContinuousLinearMap`, adjoints, `IsSelfAdjoint`,
  `LinearMap.IsSymmetric`, `spectrum`, `cfcHom` of a star-normal element, Urysohn's lemma;
  `LinearPMap` with `adjoint` and `IsSelfAdjoint`; `Submodule.starProjection`,
  `OrthonormalBasis`, `LinearMap.IsSymmetric.eigenvectorBasis` and `eigenvalues`,
  `Module.finrank`, `WithLp 2 (E × F)`, `lp`.

The spectral predicates, norms, angle operators, Hilbert–Schmidt space and unbounded spectral
theory come from the sibling roadmaps itemized under *Dependency ordering*. Before
implementing, search the Lean Zulip and the open Mathlib pull requests for newly landed
overlap and follow what is in motion rather than duplicating it. Everything below is absent
upstream.

## Part A — the Haagerup–Zsidó kernel and its Fourier transform

Independently submittable; no prerequisites.

This Part exists for a constant, and says so. There is an explicit integrable `k : ℝ → ℂ`
whose Fourier integral reproduces the reciprocal on the whole exterior region `1 ≤ |x|`, and
whose total mass is exactly `π/2`. Any kernel with the first property yields, on substituting
a separated pair of self-adjoint operators for `x`, a Sylvester solution bound with constant
`‖k‖₁`; a kernel with the right transform and worse mass proves a weaker Part B. So both
halves — identity and mass — are milestones. The mathematics is due to Haagerup and Zsidó and
is specified here intrinsically.

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
  generically so a reviewer can take them without the topic.

**Milestone A1 — the exterior identity and the exact mass.** The Fourier integral of
`reciprocalKernel` is `1/x` for `1 ≤ |x|`, and `∫ ‖reciprocalKernel‖ = π/2`.

The mass is not an estimate. Tonelli gives
`½ ∫_{y>0} weight y · (∫ |sin t| e^{−y|t|} dt) dy`; the inner integral is closed-form, and its
product with `tanh(π y/2)` collapses — **the weight is chosen to make that cancellation
exact** — leaving `∫_{y>0} (1+y²)⁻¹ = π/2`. That is the one sentence a reader should take away
about why `tanh(π y/2)` appears at all.

**Milestone A2 — the normalization bridge** to Mathlib's Fourier transform, so users mixing
the two conventions have a lemma rather than a warning.

**Acceptance examples.** The identity at a concrete `x`; the mass bounding one concrete
convolution; documentation stating that `π/2` is attained and that minimality is cited rather
than proved, the Lean-proved obstruction being Part B's `5/3`.

## Part B — Sylvester equations and the Rosenblum theorem

The hinge: it consumes Part A and all four external roadmaps, and Part C consumes it.

The headline is qualitative — an operator intertwining two self-adjoint operators with
**disjoint** spectra is zero, with `A` and `B` unbounded. The quantitative companions — a-priori
bounds on `‖X‖` when the spectra are **separated** by `δ` — are what Part C actually consumes.

**Objects.** The Sylvester operator `X ↦ A X − X B` on rectangular maps; the gap taxonomy of
the generality bar; the domain-aware Sylvester equation on `LinearPMap`, consumed from
`SelfAdjointSpectralTheory`, which owns the transport statement and excludes the estimates to
here; and the **Sylvester flow** `W t Z = U_A(t) ∘ Z ∘ U_B(t)⋆` on the Hilbert–Schmidt space.

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
- **Pairwise separation, constant `π/2`**: the analytic root is a *simultaneous Ky Fan prefix
  estimate* — one finite family of left and right unitaries realizing the reciprocal
  multiplier on every coordinate matrix unit at once, with mass at most `π/2`, by finite
  Fourier interpolation against Part A's kernel. The `π/2` is Part A's mass, not an
  unspecified constant. Fan dominance lifts the estimate to every unitarily invariant norm,
  orbit convexity packages the scaled solution as a barycenter of the defect's unitary orbit,
  and the **Frobenius norm loses nothing** — constant one, by dividing the coordinate equation
  and summing squares. The interpolation layer is internal, not public surface.
- **The flow route to the unbounded theory**: the flow is a one-parameter unitary group on the
  Hilbert–Schmidt space — unitarity from the `OperatorIdeals` conjugation theorem; strong
  continuity is the analytic content, since the columns must go to zero *together*, and the
  energy split is carried in `ℝ≥0∞` so no finiteness side conditions appear. Stone's theorem
  hands back a self-adjoint generator, **identified** — not defined, or nothing about
  Sylvester equations would be proved — as `Z ↦ A Z − Z B`, with domain membership a
  conclusion; separated spectra force a generator gap at every Hilbert–Schmidt vector.
  Unbounded endpoints across a pairwise gap `δ`: `δ · ‖X‖₂ ≤ ‖C‖₂` with constant one, and
  `δ · ‖X‖ ≤ (π/2) · ‖C‖` for bounded solutions of the domain-aware equation.

**Milestone B1 — the a-priori bounds**: the dimension-free coercive bound, the
interval/exterior bound with constant one in every rectangular unitarily invariant norm, and
the pairwise bound with `π/2`.

**Milestone B2 — Rosenblum's theorem** for self-adjoint `LinearPMap`s: a bounded operator
intertwining two of them with disjoint spectra is zero.

**Acceptance examples.** The two-by-two obstruction data (`α = (−1,1)`, `β = (0,2)`, gap one)
is admissible yet forces mass `≥ 5/3` on every real undoubled certificate; a bounded pair as
total partial maps recovers bounded uniqueness; the coercive bound on a concrete
multiplication pair.

## Part C — the Davis–Kahan sin Θ theorems

Consumes Part B; the acceptance suite is Davis–Kahan Part III.

The `sin Θ` family is Part B read through projection geometry. Two statement shapes, both
public API: the **residual** form — the numerical analyst's, where an approximate invariant
subspace with residual `R = A X − X M` is tilted by at most `‖R‖/δ` — and the
**perturbation** form — the operator theorist's, where invariant subspaces of `A` and `B` are
tilted by at most `‖B − A‖/δ` — each for every relevant unitarily invariant norm, with the
interval, spectral-projector and concrete-norm corollaries.

**Objects.** Consumed from `MajorizationAndAngles`: `sinThetaMap U V = P_{Vᗮ} ∘ P_U`, the
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
- **Domain-aware forms.** The unbounded `sin Θ` surface over the closed-operator layer:
  residual identities extended from a graph core to the full domain; common-domain and
  common-core variants; bounded-residual and lower-frame formulations; interval/exterior and
  pairwise-gap forms in the supported unitarily invariant norms, with the Hilbert–Schmidt case
  through Part B's flow; and the bounded and finite theorems as specializations.
- **Graph subspaces and Riccati.** The graph-reduction/Riccati equivalence — a graph subspace
  is invariant iff its angular operator solves the Riccati equation — with existence, bounds
  and uniqueness for contractive solutions under the gaps above.

**Milestone C1 — the perturbation family**, with the canonical spectral-projector corollary
`δ · ‖P_{spec A [a,b]} − P_{spec B [a,b]}‖ ≤ ‖B − A‖` under equal ranks.

**Milestone C2 — the two-sided `π/2` form**: under pairwise separation of the selected
`A`-spectrum from the complementary `B`-spectrum alone,
`δ · N (sinThetaMap U V) ≤ (π/2) · N (B − A)` for every unitarily invariant `N`.

### Milestone C3 — the domain-aware `sin Θ` theorem

**This is the roadmap's headline, and the one milestone whose statement a reader cannot
reconstruct from the milestones around it.** Everything above is bounded or finite; the
generality bar says the unbounded form is canonical and those are its specializations, so the
canonical statement has to be written out.

**Data.** All from sibling roadmaps except the last two:

- a self-adjoint `A : E →ₗ.[ℂ] E`, possibly unbounded, with its spectrum via `resolventSet`;
- a **trial map** `X : H →L[ℂ] E` with a **lower frame bound** `c > 0` (`c‖h‖ ≤ ‖X h‖`), not
  required to be isometric — which is what makes the statement *generalized* and what the
  Ritz layer needs;
- a self-adjoint **trial block** `A₀` on `H`, with `X` transporting `dom A₀` into `dom A`;
- a self-adjoint **complementary block** `Λ` on `K` together with an **isometric embedding**
  `Y : K →L[ℂ] E` whose range is *exactly* invariant: `A ∘ Y = Y ∘ Λ` on `dom Λ`. This is what
  replaces "`V` is an invariant subspace" once no spectral projection is available, and
  without it there is nothing for the sine operator to be an angle *to*;
- the **residual** `R : H →L[ℂ] E`, a bounded operator even though `A` is not: the
  domain-aware content is that `A X − X A₀` extends from a graph core to a bounded operator on
  all of `H`, and the hypothesis is bounded-residual, never bounded-`A`;
- the **gap** `g > 0`, a spectral separation between `A₀` and `Λ` in one of the three forms of
  the generality bar, carrying constants `1`, `1` and `π/2` respectively.

**The directed sine operator is constructed from that data**, not supplied: it is
`sin Θ = Y⋆ ∘ X : H →L[ℂ] K`, the component of the trial map along the complementary range,
read in the complementary coordinates. Constructing it is the whole point — a statement
quantified over an arbitrary operator called `sin Θ` says nothing, because both sides scale
independently.

**Statement.** `g · ‖sin Θ‖ ≤ ‖R‖` under ordered or interval/exterior separation, and
`g · ‖sin Θ‖ ≤ (π/2) · ‖R‖` under pairwise separation. The mechanism is that the residual
identity and the exact invariance of the complementary range make `Y⋆ X` solve the Sylvester
equation `Λ S − S A₀ = Y⋆ R`, to which Milestone B1 applies; `Y⋆` is a contraction, so the
right-hand side is bounded by `‖R‖`. Dividing by `‖X h‖` and using the frame bound turns the
operator statement into the subspace one, `g · c · ‖sin Θ h‖ ≤ ‖R‖ · ‖X h‖`, where the
left-hand side is the sine of the angle between the trial vector and the orthogonal complement
of the complementary range, and `c = 1` recovers the classical form.

**Hypotheses are bundled as a record, deliberately.** A flat theorem takes upwards of a dozen
arguments with non-obvious mutual constraints, and every specialization repeats all of them.
Bundling them makes each specialization a *constructor* — bounded operators build the record
with `A.toLinearMap.toPMap ⊤` and a trivial domain transport, and finite dimension adds
`FiniteDimensional` and reads the blocks off an eigenbasis — so specializations are proved by
supplying data rather than by re-proving the estimate. **This is the decision that makes
"bounded and finite are specializations" true in the code rather than only in the prose**, and
it is why the roadmap can carry one theorem where the literature carries a family.

**The ideal-gauge form.** At this generality the natural norm is not a unitarily invariant norm
on a finite-dimensional space but a Ky Fan dominant symmetric ideal gauge from
[`OperatorIdeals`](../OperatorIdeals/README.md): a total `ℝ≥0∞` gauge whose finiteness is a
*hypothesis* on the residual and a *conclusion* about `sin Θ`. In that form the conclusion is
a conjunction — `sin Θ ∈ N` and `g · c · N(sin Θ) ≤ N(R)` — and the membership half is content
a bounded statement cannot express, because there every operator lies in every carrier or the
carrier is `⊤`. The two roadmaps must agree that the dominant class quantified over here is the
class `OperatorIdeals` constructs from a symmetric gauge, **or this theorem quantifies over a
class no other roadmap builds**; that reconciliation is the real dependency between them, and
it is why C3 cannot land before `OperatorIdeals` Part B.

**Acceptance.** A reviewer should be able to check, without reading a proof: that no hypothesis
says `A` is bounded; that boundedness of the residual is a hypothesis and the bound on the
sine operator is a conclusion; that the sine operator is built from the data rather than
quantified over; that instantiating the record with a bounded self-adjoint `A` and an isometric
trial map yields Milestone C1 by construction; and that `π/2` appears only under pairwise
separation, the other two gap forms carrying constant one.

**Acceptance suite — Davis–Kahan Part III.** A source-facing layer recording the correspondence
between the paper's statements and the reusable declarations, in real and complex forms: the
generalized and ordinary `sin Θ` theorems; equal-rank and lower-rank Ritz-residual `tan Θ`;
`sin 2Θ` in unitarily invariant norms; the sharp operator-norm `tan 2Θ` with the quarter-turn
conclusion; the projector-difference companions; the paper's printed counterexample and
sharpness statements; equality models of arbitrary finite multiplicity; and explicit statements
of what is *not* claimed. Cross-checks between projection, singular-value, column-energy and
tensor formulations on small matrix models complete it.

## Part D — the Yu–Wang–Samworth statistical variant

Consumes Part C; a leaf.

Davis–Kahan hypothesizes a gap in the spectrum of one of the two operators — in practice the
perturbed one. That is the wrong shape for statistics: the perturbed operator is a *sample*
covariance and its spectrum is random; what one can assume is a gap in the **population**
spectrum. Yu–Wang–Samworth is the variant stated that way, and that hypothesis change is the
substance of this Part. Its probabilistic inputs live in
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

**Acceptance examples.** A spiked model where the sample gap closes but the population gap does
not; consistency — when a two-sided gap does hold, Part C's constant-one bound is stronger; a
non-square matrix through the Gram route. Cite and cross-check, never vendor, the related
endpoints in `YuanheZ/lean-stat-learning-theory` and `facebookresearch/atlas-lean`, the latter
for statement comparison only, its repository terms being incompatible.

## Dependency ordering

**Internal.** Part A is independent and independently submittable — this roadmap's cheapest
first contact with review. Part B consumes Part A for the constant; Part C consumes Part B;
Part D consumes Part C. Within Part B the finite core, the dimension-free bounds and the flow
can proceed in parallel once their external inputs exist; within Part C the dimension-free
layer precedes the finite spectral forms, and the domain-aware forms come last.

**External.**
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md): spectral
subspaces, the separation predicates, the modulus, singular values (Parts B–D).
[`MajorizationAndAngles`](../MajorizationAndAngles/README.md): the unitarily invariant norm
structures with Fan dominance, principal angles, the angle operators, aligned bases, Weyl
perturbation (Parts B–D). [`OperatorIdeals`](../OperatorIdeals/README.md): the Hilbert–Schmidt
space, the energy calculus, unitary conjugation, and the ideal-gauge class of Milestone C3
(Parts B–C). [`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md): unitary
groups and Stone, the `LinearPMap` resolvent and spectrum layer with the Cayley transform and
the intertwining chain, the spectral measure and its support, and the domain-aware Sylvester
equation (Parts B–C). Nothing here waits on `MatrixSpectralStatistics`.

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

## Provenance

A substantial implementation of all four Parts exists in the AIQ DKPS formalization (Kitware,
Inc., Apache-2.0). It establishes feasibility and provides source provenance for integration,
but this roadmap specifies the desired mathematics intrinsically and does not prescribe the
donor API or proof architecture. In particular, the existing statements carry paper numbering and
paper-flavoured names; a submission states the theorems in terms of the objects above, with the
source correspondence confined to the downstream acceptance layer of Part C.

Material in the Sylvester and `sin Θ` lineage was adapted from the Spectra Formalization
Project at upstream revision `8dbaaf6728d1342ae16acf79fd7eef7c59b37e63`, with a recorded
compatibility patch; the Haagerup–Zsidó kernel material has no such influence. Integration must
preserve licensing, identify which material is copied, adapted, generalized or new, and
coordinate with that project's author — or discuss the plan publicly — before reuse.
