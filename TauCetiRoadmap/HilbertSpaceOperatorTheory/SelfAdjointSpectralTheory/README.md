# Self-adjoint spectral theory: the Borel functional calculus, unbounded operators, and Stone's theorem

The spectral theorem for unbounded self-adjoint operators is the most consequential absence
in Mathlib's operator theory. Mathlib has the static stack — `ContinuousLinearMap` with
adjoints and operator norms, the continuous functional calculus of a normal element,
`spectrum` and `resolvent` for Banach-algebra elements, `Measure` with
Riesz–Markov–Kakutani, and unbounded operators as `LinearPMap` with `adjoint`,
`IsSelfAdjoint` and closedness — but none of the layer that makes quantum mechanics,
spectral perturbation theory, or evolution equations expressible: no Borel functional
calculus, no projection-valued measures, no resolvent theory for a partially defined
operator, no spectral measure of an unbounded self-adjoint operator, and no Stone's theorem
connecting self-adjoint operators to one-parameter unitary groups.

This roadmap builds that layer as one body of mathematics. Its five Parts are five faces of
a single subject: a one-parameter unitary group has a self-adjoint generator; a bounded
normal operator has a Borel calculus and a projection-valued measure; a partially defined
operator has a graph-and-domain calculus and, when self-adjoint, a real spectrum with
quantitative resolvent bounds; and the Cayley transform welds these into the spectral
measure of an unbounded self-adjoint operator, with Stone's theorem in both directions as
the dynamical payoff.

The goal is to build the reusable theory of these objects, not to race to the named
theorems. The bar for done: a researcher in mathematical physics or spectral perturbation
theory finds unbounded self-adjoint operators, their resolvents, their spectral projections
and their unitary groups defined at their natural generality and equipped with the standard
API, so that the spectral theorem and Stone's theorem are consequences of a developed theory
rather than isolated endpoints.

Suggested homes:

```text
TauCeti/Analysis/InnerProductSpace/OneParameterUnitaryGroup/
TauCeti/Analysis/InnerProductSpace/BorelCalculus/
TauCeti/Analysis/InnerProductSpace/ProjValMeasure/
TauCeti/Analysis/InnerProductSpace/LinearPMap/
TauCeti/Analysis/CStarAlgebra/SelfAdjointGapInverse.lean
TauCeti/MeasureTheory/    (the generic measurability and Helly-selection layer)
```

## Scope boundary

This roadmap owns the **self-adjoint** side of spectral theory:

- the bounded Borel functional calculus of a normal operator, and projection-valued
  measures;
- resolvents, spectra and the Cayley transform of a self-adjoint `LinearPMap`;
- the spectral measure of an unbounded self-adjoint operator and its spectral projections;
- one-parameter unitary groups, and Stone's theorem as the bridge between the developed
  group and spectral APIs.

It does **not** own:

- strongly continuous semigroups and groups in general, their generators as general
  unbounded operators, Hille–Yosida, Lumer–Phillips, or the general theory of a generator's
  resolvent. Those belong to the
  [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  roadmap;
- solvability theorems of Rosenblum type, spectral-gap Sylvester estimates, and their
  `sin Θ` consequences. Those belong to
  [`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md), which
  consumes this roadmap. The domain-aware Sylvester *equation* — the transport statement
  `A X − X B = C` with its domain bookkeeping — is owned here, because it is a statement
  about the objects this roadmap defines; the estimates are not.

**Do not define a second generator or resolvent vocabulary.** Both this roadmap and the
one-parameter semigroups roadmap model an unbounded operator as a Mathlib `LinearPMap`, and
that is what makes one shared vocabulary possible. A `LinearPMap` is not an algebra element,
so it needs its own resolvent *set* (see the generality bar); that definition should be
shared with the semigroup development rather than duplicated on either side. Landing
Stone's theorem here discharges the `C₀`-group stretch goal that roadmap already records,
and the two should cite each other.

## Generality bar

Decide these up front; do not silently specialize.

### An unbounded operator *is* a `LinearPMap`

This is the premise every Part inherits, and the first thing to hold an implementation to.

1. Mathlib's `LinearPMap` (`H →ₗ.[ℂ] H`) is the foundational object. There is no second
   bundled `ClosedOperator`-style foundation.
2. Closedness, dense domain, symmetry (`LinearPMap.IsFormalAdjoint`) and self-adjointness
   (Mathlib's `IsSelfAdjoint A`, that is `A.adjoint = A`) are **hypotheses on a raw partial
   map — properties, never structure fields** of a parallel operator type. A theorem needing
   three properties carries three hypotheses; the benefit is that no consumer ever unwraps a
   bundle, and Mathlib's `LinearPMap` API applies directly.
3. A bundle may be added as a derived convenience carrying a `LinearPMap` and proofs; it may
   not own a parallel domain/action representation.
4. Bounded operators enter through the existing full-domain construction
   (`T.toLinearMap.toPMap ⊤`), and their self-adjointness transports.

### Self-adjointness is proved by von Neumann's criterion, with density derived

The route is symmetry plus **surjectivity of `A ± i`**, with density of the domain
**derived** from symmetry and surjectivity of `A + i` rather than assumed. Assuming density
up front would make Stone's theorem apply to fewer groups than claimed; deriving it replaces
the mollification argument of the textbook proof with a few lines of inner-product algebra.
No consumer of the criterion may smuggle a density hypothesis back in.

### A `LinearPMap` needs its own resolvent set

Mathlib's `spectrum R a` is `¬IsUnit (algebraMap R A z - a)`, defined for an element of an
algebra. A `LinearPMap` is not an algebra element — `A − z` is only defined on the domain —
so `resolventSet A` is defined directly: the `z` for which `A − z` has a **two-sided bounded
inverse**, a left inverse on the domain and a right inverse on the whole space whose values
land back in the domain. Both halves are load-bearing: for an unbounded operator,
injectivity on the domain and surjectivity onto the space are independent, and a one-sided
definition would admit "inverses" that leave the domain. In the bounded (`domain = ⊤`) case
this agrees with Mathlib's notion, and the bridge is a stated target rather than an implicit
identification.

### Projection-valued measures live on `ℝ`, carry their diagonal measures as data, and relabel explicitly

`ProjValMeasure H` is a measure on the Borel sets of `ℝ` bundling the projection field *and*
the scalar diagonal measures, welded by `⟪ξ, P B ξ⟫ = (diag ξ) B`. Countable additivity is
therefore never an axiom — it already lives inside `Measure ℝ`; idempotence,
self-adjointness, positivity and finite additivity are theorems. The alternative —
projections as the only data, additivity as a field — would put a summability side condition
on every consumer. The spectrum of a normal operator lies in `ℂ`, so the measure of a normal
operator is indexed along an explicit measurable relabelling `κ : spectrum ℂ a → ℝ`: the
real part for a bounded self-adjoint operator, the inverse Cayley map for the unbounded
theory. `κ` is a parameter, not a special case.

### Semibounds and lower bounds are hypotheses the consumer supplies

`SemiboundedBelow A c` and `SemiboundedAbove A c` are predicates on a partial map and a real
constant, never a subtype. Where a lower bound `c‖x‖ ≤ ‖A x − z x‖` is free — off the real
axis, from `|Im z|` — the theorem proves it; at a real point there is no free bound, so the
real-point resolvent lemma **takes the bound as a hypothesis** and reruns the same
closed-range argument. That is a factored theorem, not a weaker one: the caller with a
spectral gap or a semibound must not have to reprove closed range.

### Statements live at their natural generality

Facts about C⋆-algebra elements — the norm/spectrum interval characterization, the gap
inverse — are stated for C⋆-algebras, not for Hilbert-space operators. The measurability
lemmas behind the calculus (measurability of `ω ↦ cfc f (a ω)`, compact-infimum
measurability, Helly selection) are stated in `MeasureTheory` for their own hypotheses, with
no operator theory in sight.

## What Mathlib already has

- **`LinearPMap`** with `domain`, `graph`, `adjoint`, `IsFormalAdjoint`, `IsSelfAdjoint`,
  `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`, and closure/core material — the
  canonical carrier of Parts C, D, E.
- **`ContinuousLinearMap`** with operator norms, adjoints, `IsSelfAdjoint`, `unitary`, and
  the exponential `exp` with `hasDerivAt_exp_smul_const` — the bounded side of Parts A and B.
- **The continuous functional calculus**: `cfcHom` / `cfc` of an `IsStarNormal` element, its
  multiplicativity, positivity and norm control — the input Part B extends.
- **`spectrum` and `resolvent` for algebra elements**, including
  `spectrum.isOpen_resolventSet` — the bounded theory Part D's notions must bridge to, never
  duplicate.
- **Measure theory**: `Measure`, `IsFiniteMeasure`, regularity, Riesz–Markov–Kakutani for
  positive functionals, `StieltjesFunction`, dominated convergence, `Lp`.
- **Topology and analysis**: `Submodule.topologicalClosure`, orthogonal projections and
  `HasOrthogonalProjection`, Neumann series, `Tendsto` filters.

Everything below — the dynamical, projection-valued and unbounded-spectral layer — is absent
upstream. Before implementing, check the Lean Zulip and the open Mathlib pull requests:
unbounded operators and the functional calculus are areas with recurring activity.

---

## Part A — one-parameter unitary groups and Stone's theorem

Independently submittable.

**Objects.** `OneParameterUnitaryGroup H`: a map `U : ℝ → (H →L[ℂ] H)` on a complex Hilbert
space, unitary, a group homomorphism, strongly continuous. Its **generator**: the
`LinearPMap` whose domain is *exactly* the set of vectors where the difference quotient
`t ↦ (U t ψ − ψ)/(it)` converges, and whose value is the limit. That domain choice is the
design decision worth reviewing: the generator is genuinely unbounded, nothing assumes a
core or a dense domain in advance, and a smaller convenient domain would make the
self-adjointness statement weaker than what Part E consumes.

**API to develop.**

- Unitarity basics: `U(−t) = U(t)⋆`, norm preservation, `‖U t‖ = 1` on a nontrivial space;
  the time-reversed group.
- The difference quotient: additivity and `ℂ`-homogeneity in the vector (what makes the
  generator linear), the defining `Tendsto` characterization of the domain, and the domain's
  invariance under the group with `A (U s ψ) = U s (A ψ)`.
- **Symmetry without density**: the generator is formally self-adjoint, proved pointwise
  from `U t⋆ = U (−t)`. This half needs no density.
- **The commutant preserves the generator**: a bounded operator commuting with every `U t`
  maps the domain into itself and commutes with the generator there. This is what lets a
  symmetry of an underlying problem descend to the generator; its consumer is the
  perturbation roadmap.
- **The semigroup bridge**: restricting to `t ≥ 0` and forgetting the complex structure
  exhibits the group as a strongly continuous contraction semigroup over the underlying real
  Banach space, with semigroup generator `i·A` on the same domain. It must be built against
  the `StronglyContinuousSemigroup` and generator API of the one-parameter semigroups
  roadmap, not a private duplicate.
- **Skew-adjoint exponentials**: for bounded self-adjoint `S`, the flow `t ↦ exp (t (iS))`
  is such a group, norm-preserving, with derivative `exp(tB)·B` — the source of concrete
  examples — and the **Duhamel estimate** for *commuting* bounded self-adjoint `Sₘ, Sₙ`:
  `‖exp(it Sₘ)ψ − exp(it Sₙ)ψ‖ ≤ |t|·‖(i Sₘ − i Sₙ)ψ‖`. The commutation hypothesis is
  genuine, and it is all the Yosida scheme of Part E needs, since resolvents of one operator
  commute among themselves.

**Milestone A1 — von Neumann's criterion.** A symmetric operator with `A + i` and `A − i`
surjective is self-adjoint, with density of the domain derived rather than assumed.

**Milestone A2 — Stone's theorem, forward direction.** The generator of a one-parameter
unitary group is self-adjoint. The proof is the criterion: symmetry is the easy half,
surjectivity of `A ± i` via the semigroup resolvent is the work, density is derived.

**Acceptance examples.** For bounded self-adjoint `S`, the flow `t ↦ exp (i t S)` is a
one-parameter unitary group whose generator is `S` viewed as a total partial map; the
difference-quotient domain is all of `H` exactly when the group is norm-continuous.

## Part B — the Borel functional calculus and projection-valued measures

Independently submittable.

Mathlib has the continuous functional calculus of a normal element and no Borel one; it has
measures and Riesz–Markov–Kakutani and no spectral measures. This Part supplies the step
between: for a normal `a : H →L[ℂ] H`, a bounded Borel symbol on `spectrum ℂ a` acts as a
bounded operator, the assignment is a `*`-homomorphism extending `cfcHom`, and indicator
symbols yield a projection-valued measure.

**Objects.** The **diagonal measure**: the finite regular Borel measure on `spectrum ℂ a`
produced by Riesz–Markov–Kakutani from the positive functional `f ↦ ⟪ξ, cfcHom ha f ξ⟫`. The
**polarized pairing**, defined for any bounded Borel symbol by the quarter-sum of diagonal
integrals at `ξ + iᵏ ψ`. The admissibility predicate `IsBddMeasurable f` (measurable, with a
uniform bound). The operator `borelCalculus ha hf` whose matrix elements are the pairing. The
structure `ProjValMeasure H`.

**API to develop.**

- The transport principle, isolated in one place: every identity is checked for a continuous
  symbol — where it is a fact about `cfcHom`, hence free — and moved to the Borel symbol by
  `ε`-approximation in the `L¹` of the finite sum of diagonal measures occurring in the
  statement. An identity mentioning finitely many vectors mentions finitely many diagonal
  measures, so one finite measure controls it.
- The calculus: agreement with `cfcHom` on continuous symbols; linearity; conjugation;
  commutation with `a` and among values of the calculus; the norm bound
  `‖borelCalculus ha hf ξ‖ ≤ M‖ξ‖` for a symbol bound `M`; invariance under a.e.
  modification with respect to every diagonal measure.
- **Multiplicativity** — the one step needing the transport twice, in a fixed order: the
  approximant of `f` is chosen first, and the tolerance for the approximant of `g` depends on
  it. There is no uniform bound over approximants, and a reviewer should see that stated
  rather than discover it.
- Indicators to projections: the spectral projections, idempotent and self-adjoint, with
  intersection-to-composition; the diagonal masses; the assembled `ProjValMeasure` along a
  measurable relabelling `κ`; for bounded self-adjoint `T`, the relabelling is the real part,
  and half-line projections vanish exactly where the quadratic form is confined.
- The `ProjValMeasure` theory: idempotence, self-adjointness, monotone and finite additivity,
  `‖proj B ξ‖ ≤ ‖ξ‖`, extensionality in either field, and the countable splitting
  `∑' k, ‖proj (B k) ξ‖ₑ² = ‖ξ‖ₑ²` along a partition.
- The generic measure-theoretic layer, stated in `MeasureTheory` with no operator content:
  measurability of `ω ↦ cfc f (B ω)` for fixed continuous `f` and no measurable eigenbasis
  selection; measurability of compact infima of Carathéodory functions; Helly selection with
  the Stieltjes measure of the monotone limit.

**Milestone B1 — the homomorphism.** The calculus is a linear, multiplicative,
star-preserving extension of the continuous calculus.

**Milestone B2 — the projection-valued measure**, with its projections the indicator calculus
and its diagonals the pushed-forward diagonal measures.

**Milestone B3 — uniqueness and the bounded spectral theorem.** The calculus is the unique
extension of `cfcHom` whose matrix elements are integrals against the diagonal measures; and
a bounded self-adjoint operator is the integral of the identity against its
projection-valued measure — the headline a reader opens the topic for.

**Acceptance examples.** On a multiplication operator the calculus is multiplication by the
symbol; the measure of a bounded self-adjoint operator assigns to `[c, ∞)` the spectral
projection that half-line form bounds detect.

## Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

Needs the spectral-subspace layer of
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md), and
nothing else.

The vocabulary layer of the unbounded theory: everything Parts D and E state about a partial
map is phrased in the notions defined here. This is where the representation decision
becomes code.

**Objects and API to develop.**

- Domain relations as predicates: `SameDomain`, `MapsDomainTo`, `Extends`; domain-subtype
  simp lemmas, so consumers never unfold.
- Reducing subspaces: `InvariantSubspace`, `ReducesSubspace`, the reduced restriction of a
  partial map to a reducing subspace with its density, closed-graph, symmetry and
  self-adjointness inheritance.
- Transport constructions, each with density and closed-graph transport: pullback along a
  continuous linear equivalence, unitary conjugation preserving self-adjointness, and the
  direct sum of two partial maps.
- **The graph norm** `graphNorm A x = √(‖x‖² + ‖A x‖²)` on the domain subtype, with its
  elementary estimates — deliberately *not* a second topology on the domain. **Graph cores**
  are stated sequentially, recording exactly the two convergences a closed-graph argument
  consumes, and closedness in sequential form is what carries an identity from a core to the
  whole domain.
- **Relative boundedness** `RelativelyBounded A V a b` (`‖V x‖ ≤ a‖x‖ + b‖A x‖`) with its
  closure laws.
- **Perturbations**: `perturb A V` for a domain-defined `V` — the same domain by
  construction, which is where Kato–Rellich arguments start — and `boundedPerturbation` for
  a bounded operator.
- Shifted-inverse data and the elementary real resolvent predicates `realResolventSet`,
  `realSpectrum`, `SpectralSetsSeparated` — the hypothesis shapes Part D's quantitative
  statements consume.
- The rectangular domain-aware **Sylvester equation** `SylvesterEquation A B X C` with domain transport
  as a field, allowing different source and target Hilbert spaces; its module structure,
  the bounded case as a full-domain instance, and
  `HasBoundedEverywhereInverse`. Transport statements only; the estimates belong to the
  perturbation roadmap.
- **Quadratic-form bounds**: `LowerFormBoundOn` and `UpperFormBoundOn` for a bounded operator
  on a subspace, and the bridge from a spectral inclusion of a restriction to those bounds
  over `ℂ` — where the foundations' spectral-subspace layer is consumed.

**Milestone C1 — bounded Kato–Rellich.** A bounded self-adjoint perturbation of a
self-adjoint partial map is self-adjoint on the same domain, directly and with no
relative-bound machinery, because a bounded perturbation does not move the adjoint domain.

**Milestone C2 — the closed-graph characterization, and Kato–Rellich proper.** The single
iff — `A` is closed iff its graph is closed iff every graph-convergent sequence has its
limit in the domain with the expected image — and the Kato–Rellich theorem: a symmetric
relatively bounded perturbation with bound `b < 1` of a self-adjoint operator is
self-adjoint, for which `perturb`, `RelativelyBounded` and Milestone A1's criterion are
exactly the ingredients.

**Acceptance examples.** A bounded self-adjoint operator as a total partial map is
self-adjoint in the `LinearPMap` sense; the graph norm of a bounded map is equivalent to the
ambient norm; `⊤` is a graph core.

## Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

Independently submittable, and the cheapest way into the unbounded theory.

**Objects.** `resolventSet A` and `spectrum A` for `A : E →ₗ.[𝕜] E`, per the generality bar;
the named `resolvent A hz : E →L[𝕜] E`; the **Cayley transform** of a self-adjoint operator.

**API to develop.**

- The resolvent is named, not merely asserted: uniqueness (which lets any construction of an
  inverse identify itself as *the* resolvent), the left- and right-inverse laws, membership
  of values in the domain, the **first resolvent identity**
  `R w − R z = (w − z) (R w ∘ R z)`, commutation of resolvents, and resolvent spectral
  mapping in the consuming direction.
- **Openness of the resolvent set** by Neumann-series perturbation through uniqueness;
  closedness and hence **measurability of the real spectrum** — proved for the sake of
  Part E, which must feed the spectrum to a projection-valued measure.
- **Real spectrum with the quantitative bound**: for self-adjoint `A` and `Im z ≠ 0`, the
  lower bound `‖(A − z)x‖ ≥ |Im z|·‖x‖` — the cross term in the expanded square is purely
  imaginary — then closed range, then dense range; so `z ∈ resolventSet A`,
  `spectrum A ⊆ ℝ`, and `‖R(z)‖ ≤ |Im z|⁻¹`. Adjoints: `R(z)⋆ = R(z̄)`, and `R(z)`
  self-adjoint at real resolvent points.
- **The real-point case as a hypothesis**: at real `z` there is no free lower bound, so the
  same three steps run from an assumed `c‖x‖ ≤ ‖A x − z x‖` — the factored form semibounded
  operators and spectral gaps plug into. A two-sided shifted inverse with norm `≤ (r − s)⁻¹`
  exists across a spectral gap of width `r` around shift `s`.
- **The Cayley transform** `cayley hA = 1 − 2i·R(−i)`, the manifestly bounded form of
  `(A − i)(A + i)⁻¹`: norm-preserving, surjective, unitary, hence `IsStarNormal` — the
  bounded unitary that hands Part E to Part B.
- **The C⋆-algebra gap inverse**, at C⋆ generality: a self-adjoint element has `‖a‖ ≤ r` iff
  its spectrum lies in `[−r, r]`; spectrum avoiding `(−r, r)` makes `a` a unit with
  `‖a⁻¹‖ ≤ r⁻¹`.
- **The intertwining chain**: a bounded `X` with `X ∘ A ⊆ B ∘ X`, stated domain-aware,
  intertwines the resolvents, the Cayley transforms, and the continuous functional calculus
  of the two operators. The chain stops before the Borel calculus so this Part stays
  independent of Part B; the disjoint-spectra vanishing theorem it feeds belongs to the
  perturbation roadmap.

**Milestone D1 — real spectrum, quantitatively**, in the form above.

**Milestone D2 — the textbook characterization, and analyticity.** The single iff
identifying `z ∈ resolventSet A` with *`A − z` injective with closed dense range and bounded
inverse*, and analyticity of `z ↦ resolvent A hz` on the resolvent set — the natural next
statement after the first resolvent identity.

**Acceptance examples.** For bounded self-adjoint `T` as a total partial map, `resolventSet`
agrees with the complement of Mathlib's `spectrum ℂ T` and the resolvent matches the Neumann
series; a multiplication operator's spectrum is the essential range of its symbol.

## Part E — the spectral measure of an unbounded self-adjoint operator, Stone uniqueness, Yosida

Needs Parts A, B and D. The deepest Part, and the reason the others exist.

**Objects.** For self-adjoint `A : H →ₗ.[ℂ] H`: the spectral measure `spectralPVM hA`,
obtained by relabelling the Borel calculus of the Cayley transform along the inverse Cayley
map `w ↦ i(1+w)/(1−w)`; the spectral projections; the spectral subspace and the reduction of
`A` to it; the Yosida approximants; and the unitary group `genToGroup hA` built from them.

**API to develop.**

- **The construction, honestly.** The relabelling blows up at `w = 1`, which can lie in the
  spectrum of the Cayley transform, so the construction is faithful only because every
  diagonal measure gives `{1}` zero mass — the symbol `(1 − w)·1_{{1}}(w)` vanishes
  identically while `1 − U = 2i·R(−i)` is injective. A specification omitting this would hide
  the one place the construction could fail.
- **The resolvent formula**, the property that characterizes the measure:
  `⟪ξ, R(z) ξ⟫ = ∫ (s − z)⁻¹ d(diag ξ)` for `z` off the real axis; spectral projections
  commute with the resolvent and preserve the domain.
- **Support**: a Borel set of resolvent points carries the zero projection, stated as a null
  statement rather than through a defined `support` with an inclusion.
- **Reduction**: the restriction of `A` to a spectral subspace is again **self-adjoint** —
  symmetry is inherited, and the surjectivities of `A ± i` come from the resolvent, which
  preserves the range — and a spectral gap around `λ` puts `λ` in the resolvent set of the
  restriction.
- **Form bounds from spectral support**: vanishing of the spectral projection on `(−∞, c)`
  yields `c‖x‖² ≤ Re⟪A x, x⟫` on the domain, and dually; on a spectral range with
  `B ⊆ [β, α]` the quadratic form is confined to `[β, α]`.
- **The Yosida scheme, with named approximants**: `yosidaApprox hA n = n²·R(in) − in` and its
  symmetrized and mirrored forms, the contractions `n·R(±in)`, strong convergence on the
  domain; the exponentials `exp(it·(symmetrized approximant))`, unitary and Cauchy uniformly
  on compact time intervals via Part A's Duhamel estimate — the approximants commute, which
  is why Duhamel's commutation hypothesis suffices; the strong limit, and `genToGroup hA`,
  which is **Stone's theorem, construction half**. The approximants are public and named
  because the convergence statements are about them, not about a limit appearing from
  nowhere.
- **Maximality, proved once**: self-adjoint `A ≤ B` forces `A = B`. This is why identifying
  two self-adjoint operators never requires proving both inclusions.
- **Stone uniqueness** as the payoff of maximality: the generator of `genToGroup hA` is `A`.
  Spectral projections commute with the group, and interval cutoffs tend strongly to the
  identity.
- **The block-argument shapes** consumed by spectral perturbation theory: the grid
  `gridCell ε k = [kε, (k+1)ε)` with disjointness, covering and the norm splitting; the **cut
  operator**, turning a pointwise bound `‖A y − c y‖ ≤ r‖y‖` on a spectral range into an
  operator statement; the **gap inverse**, inverting `A` with norm `≤ δ⁻¹` on vectors whose
  diagonal measure avoids `(−δ, δ)`; and the reassembly lemma, which turns per-block lower
  bounds into a global one and says nothing about where the blocks come from.

**Milestone E1 — the spectral measure and its resolvent formula.**

**Milestone E2 — Stone's theorem, uniqueness half**: the generator of the generated group is
the operator.

**Milestone E3 — the packaged statements.** Three targets completing the theory: the spectral
theorem as one declaration (*`A` is the integral of the identity against its spectral
measure*, the statement a reader opens the topic for); Stone's theorem as the packaged
bijection between self-adjoint operators and strongly continuous one-parameter unitary
groups; and uniqueness of the spectral measure — a `ProjValMeasure` satisfying the resolvent
formula is `spectralPVM hA`.

**Acceptance examples.** For bounded self-adjoint `T` as a total partial map, `spectralPVM`
agrees with Part B's measure under the real-part relabelling and `genToGroup` is
`t ↦ exp(itT)`; a multiplication operator's spectral projections are multiplication by
indicators.

---

## Dependency ordering

**Internal.** Parts A, B and D are mutually independent and each is independently
submittable; any of the three is a reasonable first contribution. Part C is independent of
A, B and D but consumes the foundations roadmap. Part E is the confluence and needs exactly
A + B + D: the Cayley transform and resolvent bounds from D, the Borel calculus and
`ProjValMeasure` from B, and the unitary-group vocabulary, von Neumann criterion and Duhamel
estimate from A. Part E does not consume Part C's constructions — the shared carrier of C, D
and E is Mathlib's `LinearPMap` itself, which is the representation decision working as
intended. Within Part E, the Yosida and maximality material precedes the construction, and
the grid/cut/block shapes depend on the construction only through the cut operator.

**External.** `HilbertSpaceOperatorFoundations`: Part C's spectral-order bridge consumes its
spectral-subspace layer. Nothing else here depends on it.

**Downstream.** `SpectralSubspacePerturbation` consumes Parts A, D and E; the scope boundary
above marks the line. `OperatorIdeals` consumes Part E for the approximation numbers of
spectral bands, and `MatrixSpectralStatistics` consumes Part B's measurability layer.

## References

- M. Reed, B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*
  (rev. ed. 1980) — VII (the spectral theorem, bounded and unbounded), VIII.3–4 (Stone's
  theorem, the Cayley transform, von Neumann's criterion).
- K. Schmüdgen, *Unbounded Self-adjoint Operators on Hilbert Space* (GTM 265, 2012) — graph
  norms, cores, resolvents, semibounded operators, the spectral measure via the Cayley
  transform.
- W. Rudin, *Functional Analysis* (2nd ed. 1991), Ch. 12–13 — the Borel functional calculus
  and projection-valued measures for normal operators.
- T. Kato, *Perturbation Theory for Linear Operators* (2nd ed. 1976) — relative boundedness,
  Kato–Rellich, resolvent perturbation.
- J. Weidmann, *Linear Operators in Hilbert Spaces* (GTM 68, 1980) — closed operators, form
  bounds, spectral representation.
- K.-J. Engel, R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations* (GTM 194,
  2000) — the semigroup side of Stone's theorem and the Yosida approximation.

## Provenance

A substantial implementation of all five Parts exists in the AIQ DKPS formalization
(Kitware, Inc., Apache-2.0), in namespaces `TauCeti.*` and `LinearPMap.*`. It establishes
feasibility and provides source provenance for integration, but this roadmap specifies the
desired mathematics intrinsically and does not prescribe the donor API or proof
architecture.

Part of the unitary-group material was adapted from the Spectra Formalization Project
(Apache-2.0, Adam Bornemann), with per-file provenance headers; the construction of the
spectral measure through the Cayley transform and the Borel calculus was chosen over that
project's Herglotz/Poisson route. Integration must preserve licensing, identify which
material is copied, adapted or new, and coordinate with the original author.
