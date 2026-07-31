# Hilbert-space operator foundations: functional calculus, polar decomposition, singular systems, and projection geometry

Spectral perturbation theory is written in a small, stable vocabulary: apply a real
function to a self-adjoint operator; factor an operator through its modulus; expand a
rectangular map in its singular system; measure the gap between two orthogonal
projections; separate two pieces of a spectrum. This roadmap builds that vocabulary.

Mathlib has the static ingredients — the spectral theorem
([`LinearMap.IsSymmetric.eigenvalues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Spectrum.html)
and `eigenvectorBasis`), positivity (`LinearMap.IsPositive`), adjoints, the continuous
functional calculus over `ℂ`, and singular *values*
([`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html))
— but not the operator-theoretic layer over `RCLike`: no functional calculus for a
symmetric `LinearMap` covering `ℝ` and `ℂ` together, no positive square root with its
uniqueness theory at that generality, no partial-isometry API, no polar decomposition, no
singular *vectors*, no Moore–Penrose inverse, no sharp projector-difference identity, and
no shared vocabulary of spectral-separation hypotheses.

The goal is to build the reusable theory of these objects, not to race to a handful of
named theorems. The bar for done: a researcher in matrix analysis or spectral perturbation
finds each object defined once, at its natural generality, with its complete basic API —
closure and composition laws, kernels and ranges, the standard identities, the connections
to existing Mathlib structures — so that the headline results are consequences of a
developed theory rather than isolated endpoints. A contribution that proves a headline
theorem and leaves the surrounding object without its basic API is not yet what is wanted.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`, with the two scalar square-root
estimates in `TauCeti/Analysis/SpecialFunctions/` and the subspace-equality isometry lemma
in `TauCeti/Analysis/Normed/Operator/`.

**Why "Hilbert-space" and not "finite-dimensional".** The organizing core is
finite-dimensional: the functional calculus is a finite sum over an eigenbasis, and that
is what makes it exist. But three of the constructions here — the rectangular operator
modulus, the polar decomposition through a partial isometry, and the projection geometry —
need no finite-dimensional hypothesis at all, and later roadmaps consume them in that
stronger form. [`OperatorIdeals`](../OperatorIdeals/README.md) applies the modulus to
operators on infinite-dimensional spaces;
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md) measures gaps
between spectral projections of unbounded operators. Stating those results in finite
dimension and generalizing later would mean proving them twice, so they are stated for
complete spaces here.

## Generality bar

Decide these up front; do not silently specialize.

- **Scalars are `𝕜 : RCLike`; finite dimension exactly where the eigenbasis is used.** The
  functional calculus is a finite sum over `LinearMap.IsSymmetric.eigenvectorBasis`, so
  `[FiniteDimensional 𝕜 E]` is what makes the definition exist. Supporting material that
  needs neither the spectral theorem nor finite dimension — inner products of linear
  combinations, orthogonal series, projection-gap geometry — must not assume them.
- **One square root, defined once.** The positive square root *is* the functional calculus
  at `Real.sqrt`, by definition and not by a bridging lemma. A reader must never meet two
  constructions of one object; the square-root-specific theory (uniqueness, kernel, range,
  the isometry-defect identity) attaches to that single definition.
- **Two moduli, neither subsuming the other.** The square modulus
  `LinearMap.operatorAbs A = sqrt (A⋆ ∘ₗ A)` is `RCLike`-generic and finite-dimensional; the
  rectangular modulus `ContinuousLinearMap.modulus T = CFC.sqrt (T⋆ ∘L T)` is complex and
  works on complete spaces, because Mathlib registers the C⋆-algebra instances on
  `E →L[𝕜] E` only for `𝕜 = ℂ`. One is more general in the field, the other in the shape;
  deleting either loses theorems, and a theorem proves they agree wherever both are
  defined.
- **One equation, with carrier-appropriate predicates.** In a star monoid,
  `IsPartialIsometry u` means `u * star u * u = u`; this covers endomorphisms and abstract
  C⋆-algebra elements. A rectangular map `u : E → F` is not an element of one monoid, so
  `LinearMap.IsPartialIsometry` and `ContinuousLinearMap.IsPartialIsometry` state the typed
  equation `u ∘ u† ∘ u = u`. The endomorphism predicates are proved equivalent, and the
  geometric characterization — isometric on `(ker u)ᗮ`, zero on `ker u` — is a theorem,
  never the definition.
- **Three polar factorizations, one hierarchy.** Finite-dimensional endomorphisms over
  `RCLike` factor through a genuine unitary; a rectangular complex operator with invertible
  modulus factors through an isometry; a general bounded rectangular complex operator
  factors through a partial isometry. Dropping finite dimension costs the unitary;
  invertibility of the modulus buys an isometry back. All three are stated, each with its
  own theory.
- **Intrinsic, basis-free statements.** The singular system is built for a linear map
  between spaces, never for a matrix in a chosen pair of bases: the consumers (principal
  angles, unitarily invariant norms, spectral-subspace perturbation) are basis-free, and a
  matrix-mediated development would force each to carry a basis choice and prove
  independence of it.
- **Total operations at zero singular values.** The left singular vector is `σᵢ⁻¹ • A vᵢ`
  through total field inversion, so it is defined (and zero) at `σᵢ = 0`; orthonormality is
  asserted on the subtype of indices with nonzero singular value, and the singular relation
  `A vᵢ = σᵢ • uᵢ` holds *including* the zero case.
- **Equalities where equalities hold.** The projector-difference identity
  `‖P − Q‖ = max (‖(1−Q)P‖, ‖(1−P)Q‖)` is an equality, with factor one and no equal-rank
  hypothesis. It must not be weakened to a two-sided estimate.

## What Mathlib already has

Consume these and connect to them.

- **The spectral theorem:** `LinearMap.IsSymmetric` with `eigenvalues` / `eigenvectorBasis`,
  `LinearMap.IsPositive` with `nonneg_eigenvalues`, adjoints, and the rank-one operators
  `InnerProductSpace.rankOne`. Part A is a finite sum of these.
- **The continuous functional calculus over `ℂ`:** `CFC.sqrt` and `CFC.abs` on `E →L[ℂ] E`.
  The C⋆-instances exist only for `𝕜 = ℂ`, which is why the `RCLike` calculus of Part A is
  built here and why there are two moduli. Bridge to it; do not duplicate it.
- **Singular values:** `LinearMap.singularValues : ℕ →₀ ℝ` between finite-dimensional inner
  product spaces — zero-indexed, antitone, zero past the rank. Mathlib has the values;
  Part C adds the vectors, the two-sided spectrum bridge, and the pseudoinverse.
- **Projections:** `Submodule.starProjection` with `HasOrthogonalProjection`,
  `IsStarProjection`, `Submodule.reflection` — the raw material of Part D.
- **Orthogonal families:** `OrthogonalFamily`, whose only vector-level constructor
  `Orthonormal.orthogonalFamily` requires *unit* vectors — the gap Part D fills for the
  non-normalized families the singular expansion produces.
- **Gram matrices:** `Matrix.gram` and the matrix-side spectral theory; Part D's rigidity
  theorem characterizes equality of `Matrix.gram`.

Before implementing, search the Lean Zulip and the open Mathlib pull requests for
overlapping work — in particular for singular-value and pseudoinverse API, which has been
in motion — and follow what is landing rather than duplicating it.

---

## Part A — the functional calculus, the positive square root, and the two moduli

**Objects.** The finite self-adjoint functional calculus
`selfAdjointFunctionalCalculus hT f = ∑ᵢ f(λᵢ) • rankOne eᵢ eᵢ` for a symmetric
endomorphism over `RCLike`; the positive square root `sqrt hT`, defined as the calculus at
`Real.sqrt`; the square modulus `LinearMap.operatorAbs A = sqrt (A⋆ ∘ₗ A)`; the rectangular
complex modulus `ContinuousLinearMap.modulus T = CFC.sqrt (T⋆ ∘L T)`; and the supporting
algebra — the expansion of `⟪∑ aᵢ • vᵢ, ∑ bⱼ • vⱼ⟫` over pairwise inner products, spans of
orthonormal subfamilies, the eigenvector cross-term identity
`⟪eᵢ, (S−T) fⱼ⟫ = (μⱼ − λᵢ) ⟪eᵢ, fⱼ⟫`, and two scalar square-root estimates near `1`.

**API to develop.**

- The calculus: diagonal action on the eigenbasis; symmetry of the result; `id` recovers
  `T`; functions agreeing on the eigenvalues give equal operators; composition is pointwise
  multiplication; the *eigenvector-stable* form — `T x = λ • x` implies
  `calculus f x = f λ • x`, which is what makes the calculus well behaved on repeated
  eigenspaces; the commutant property (anything commuting with `T` commutes with every
  `calculus f`).
- The square root: positive, symmetric, squares to `T`; `ker (sqrt hT) = ker T`,
  `range (sqrt hT) = range T`; the isometry-defect identity `‖sqrt hT x‖² = re ⟪T x, x⟫`;
  invertible when `T` is.
- The square modulus: positive; `|A|² = A⋆A`; the pointwise isometry `‖|A| x‖ = ‖A x‖` with
  `ker |A| = ker A` and `range |A| = (ker A)ᗮ`; commutation with `A` when `A` is normal.
- The rectangular modulus: nonnegative, self-adjoint, `|T|² = T⋆T`; the pointwise isometry
  `‖|T| x‖ = ‖T x‖` with its kernel corollary; `‖|T|‖ = ‖T‖`; composition norm laws; the
  characterization as the unique nonnegative square root of the Gram operator.
- Courant–Fischer and Weyl: the quadratic form in the eigenbasis, the min–max equality,
  eigenvalue monotonicity, the perturbation bound.

### Naming the square modulus

The two constructions are

```lean
LinearMap.operatorAbs       (A : E →ₗ[𝕜] E) : E →ₗ[𝕜] E   -- RCLike, finite-dimensional
ContinuousLinearMap.modulus (T : E →L[ℂ] F) : E →L[ℂ] E   -- complex, rectangular, complete
```

each in the namespace of its carrier, so both support dot notation.

**`operatorAbs` is a deliberate placeholder, and the name is an open question for review.**
A bare `abs` is the natural mathematical spelling but collides with the lattice absolute
value that `|·|` denotes in Lean, so an unqualified `abs A` in a file with both in scope
reads as the wrong object; `modulus` avoids the collision but then the two constructions
carry names a reader has to be told are the same notion. Rather than settle that here, the
square construction and its lemmas use a distinctive token — `operatorAbs`,
`norm_operatorAbs_apply`, `ker_operatorAbs` — which appears nowhere else in Mathlib or in
this development, so that whichever name the review settles on, adopting it is one
mechanical replacement.

**Milestone — uniqueness, at both layers.** The square root is the unique positive operator
squaring to `T` (Horn–Johnson 7.2.6); and the calculus itself is the unique symmetric
operator acting as `f (λᵢ)` on each eigenvector of `T`.

**Milestone — Courant–Fischer and Weyl.** The `k`-th sorted eigenvalue is the sup–inf of
the Rayleigh quotient over `(k+1)`-dimensional subspaces (Horn–Johnson 4.2.6), and a
symmetric perturbation moves each eigenvalue by at most the operator norm.

**Milestone — the two moduli agree, and so do the two calculi.** Over `ℂ` the `RCLike`
functional calculus and Mathlib's continuous functional calculus compute the same operator.
At `Real.sqrt` this identifies the two moduli; for a general continuous `f` it lets a
consumer move between the two calculi freely, and it is a target here rather than a remark.
Without it a reader cannot tell whether the two developments describe one object.

**Acceptance examples.** `calculus id = T`; the calculus of a constant is that multiple of
the identity; on a concrete diagonal operator the square root and modulus take their
expected diagonal values; the Weyl bound is sharp for a rank-one perturbation of the
identity.

## Part B — polar decomposition and partial isometries

Every operator factors as an isometric part times its modulus. That statement appears in
two genuinely different forms, differing on three axes, and each direction of
generalization loses something:

| | square decomposition | rectangular decomposition |
|---|---|---|
| scalars | `[RCLike 𝕜]` — `ℝ` and `ℂ` | `ℂ` only |
| dimension | `[FiniteDimensional]` | `[CompleteSpace]` — infinite allowed |
| shape | `E →ₗ[𝕜] E`, endomorphism | `E →L[ℂ] F`, rectangular |
| isometric factor | genuine **unitary** `E ≃ₗᵢ[𝕜] E` | **partial isometry** |

The obstruction is upstream, in Part A: the two moduli have complementary limitations, so
there is no single modulus and hence no single polar decomposition subsuming both. Their
partial-isometry predicates share the same equation, but rectangular maps require typed
composition rather than multiplication in one carrier.

**Objects.** The star-monoid and carrier-specific partial-isometry predicates; the polar
factor `polarFactor A` (the partial isometry
`|A| x ↦ A x` extended by zero) and its unitary witnesses (`polarUnitaryEquiv`, canonical
as `A |A|⁻¹` when `A` is invertible; `choosePolarUnitary` in general); on the rectangular
side, the initial space `polarInitial M` (the closure of `range |M|`), the partial isometry
`polarPartial M`, and the bounded-below isometry `polarIsometryOfIsUnitModulus`; the
near-isometry factorization; and Davis's intertwining unitary for a pair of complete
orthogonal projection families.

**API to develop.**

- The partial-isometry dictionary: `star u * u` is a star projection; closure under `star`;
  isometries are partial isometries; the operator characterization — `u` is a partial
  isometry iff it is norm-preserving on `(ker u)ᗮ` (Conway VI.3.2).
- The square decomposition: `polarFactor` with `ker = ker A`, `range = range A`, partial
  isometry, and the defining property `polarFactor A (|A| x) = A x`; the normal case (`A`
  commutes with `|A|`); uniqueness of the polar factor among unitary-times-positive
  factorizations of an invertible `A`; the adjoint formula
  `polarFactor A⋆ = (polarFactor A)⋆`.
- The rectangular decomposition: `polarPartial M ∘L |M| = M`; isometric on
  `polarInitial M`, zero on its complement; `ker (polarPartial M) = (polarInitial M)ᗮ`; the
  adjoint formulas and the final space `polarFinal M = closure (range M)`; uniqueness — any
  `V` with `V ∘L |M| = M` vanishing on `(polarInitial M)ᗮ` is `polarPartial M`.
- The bounded-below rung: when `|M|` is a unit the factor is an isometry outright, with the
  quantitative comparison `‖M − W‖ ≤ ‖|M| − 1‖`. This rung stays separate from the general
  one: bounded-below is the hypothesis perturbation estimates actually have, and under it
  the conclusion is strictly stronger.

**Milestone — the two decompositions.** The general one has content beyond the
factorization: the initial space is *proved* equal to `(ker M)ᗮ`, never taken as its
definition.

**Milestone — the near-isometry factorization.** A real finite-dimensional map whose
quadratic form is uniformly `δ`-close to the identity (`δ < 1`) factors as `M = W ∘ₗ S`
with `W` an isometry equivalence and `S` the positive square root of the Gram operator,
satisfying `‖S x − x‖ ≤ δ‖x‖`; consequently `‖M − W‖ ≤ 2δ` for `δ ≤ 1/2`. This is what a
perturbation argument needs and what the exact decompositions cannot give.

**Milestone — Davis's intertwining unitary.** For two complete orthogonal families of
projections `(Pⱼ)`, `(P'ⱼ)` satisfying Davis's non-degeneracy condition, the block polar
factors assemble into a unitary `U` with `U ∘ₗ Pⱼ = P'ⱼ ∘ₗ U` for every `j` — this Part's
modulus-inverse-times-operator construction applied to a projection pair.

**Acceptance criteria.** That the two decompositions are not redundant (the table above, in
particular that the general one is `ℂ`-only); that square and rectangular partial-isometry
predicates state the same typed equation and agree in the endomorphism case; and that
`polarInitial M = (ker M)ᗮ` is a theorem.

## Part C — singular values and the singular system

Mathlib has `LinearMap.singularValues`; this Part adds everything around it, and each layer
answers a different question:

| layer | what is missing upstream |
|---|---|
| accessor | a `ContinuousLinearMap`-level view of `singularValues` — naming surface only |
| spectrum bridge | that `A⋆A` and `AA⋆` share their nonzero spectrum **with multiplicity** |
| singular system | the singular **vectors** — Mathlib has the values, not the system |
| Moore–Penrose | the pseudoinverse, with all four Penrose conditions and the converse |

The accessor exists so that operator-norm consumers — approximation numbers, Ky Fan norms,
Eckart–Young — never spell `T.toLinearMap.singularValues` in a public statement. It fixes
the public spelling for four downstream developments, so it is a target of this Part and
not an afterthought; but its lemmas should be one-line delegations, and a reviewer should
confirm exactly that. Any lemma there with real content belongs at the `LinearMap` level
instead.

**Objects.** The right singular basis `rightSingularBasis A` (the sorted orthonormal
eigenbasis of `A⋆A`); the left singular vectors `leftSingularVector A i = σᵢ⁻¹ • A vᵢ`
(total, zero at zero singular values); the Moore–Penrose inverse `moorePenroseInverse A`,
built from the singular system with coefficient `(σᵢ²)⁻¹` against rank-one maps.

**API to develop.**

- The spectrum bridge: `A⋆A` and `AA⋆` are symmetric and positive; their sorted eigenvalue
  lists agree at every index below both dimensions — no relation between the dimensions is
  required, since both lists are zero past the rank; consequently
  `singularValues A⋆ = singularValues A`. This is what lets a rectangular map carry *one*
  singular sequence rather than two.
- The singular system: `A⋆A` acts on `vᵢ` by `σᵢ²`; the singular relation `A vᵢ = σᵢ • uᵢ`
  including the zero case; the `uᵢ` with `σᵢ ≠ 0` are orthonormal and are eigenvectors of
  `AA⋆` at `σᵢ²`; `A⋆ uᵢ = σᵢ • vᵢ`; the singular expansion of `A x` and the rank-one
  reconstruction of `A`; the extension of the nonzero left family to an orthonormal basis of
  the codomain — the statement downstream consumers actually need, and not automatic for a
  rectangular map.

### The Moore–Penrose interface

The four Penrose conditions

```text
A B A = A     B A B = B     (A B)⋆ = A B     (B A)⋆ = B A
```

should be a named predicate, `IsMoorePenroseInverse A B`, rather than four anonymous
hypotheses repeated at every use. The reason is not brevity: the four conditions *are*
Penrose's definition of a pseudoinverse, so a statement that spells them out loses the
reading "`B` is a Moore–Penrose inverse of `A`" that makes the uniqueness theorem say what
it means. A predicate also gives the theory somewhere to live — that the relation is
symmetric under `A ↔ B`, that it transports along adjoints, that it survives unitary
conjugation.

A `Prop`-valued structure with four named fields, rather than an iterated conjunction, so
that the conditions have accessors and a caller supplying them writes `⟨h₁, h₂, h₃, h₄⟩`.
Mathlib has neither a Moore–Penrose inverse nor such a predicate; check the current Zulip
and the open pull requests before fixing the shape, and follow anything in flight rather
than competing with it.

The roadmap asks for:

- the predicate, with named access to each of the four conditions;
- the construction `moorePenroseInverse A` from the singular system, for every `A` between
  finite-dimensional spaces, and the proof that it satisfies the predicate;
- **uniqueness**: two operators satisfying the predicate against the same `A` are equal;
- **the converse characterization**: anything satisfying the predicate *is* the constructed
  pseudoinverse. Without this the construction is merely *a* generalized inverse; with it,
  the name is earned;
- compatibility with the adjoint: `IsMoorePenroseInverse A B ↔ IsMoorePenroseInverse A⋆ B⋆`;
- inverse behaviour under injectivity, surjectivity, and invertibility — `A⁺A = 1` for
  injective `A`, `A A⁺ = 1` for surjective `A`, and `A⁺ = A⁻¹` for invertible `A`.

**Milestone — the singular expansion.** `A = ∑ᵢ σᵢ • rankOne uᵢ vᵢ`, intrinsically, with no
basis of the ambient spaces beyond the constructed singular one.

**Milestone — existence and uniqueness of the Moore–Penrose inverse**, in the form above:
the predicate, the construction, and the theorem that they determine each other.

**Acceptance criteria.** That the accessor layer has no mathematical content; that no
statement of the singular system mentions a basis of the ambient spaces beyond the
constructed singular one; that the uniqueness converse is proved and not just the four
conditions; that zero singular values are handled in the singular relation — the case a
rectangular treatment gets wrong first.

## Part D — Gram rigidity, projections, and spectral subspaces

The vocabulary the perturbation theory is stated in, and the one sharp identity that
vocabulary exists for:

```text
‖P − Q‖ = max (‖(1−Q) P‖, ‖(1−P) Q‖)        for orthogonal projections P, Q
```

Perturbation arguments naturally produce two one-sided estimates; this equality upgrades
the pair to a bound on `‖P − Q‖` itself with factor one and no equal-rank hypothesis.
Without it a development loses a factor of two or carries a rank condition through every
statement. The proof is the block decomposition `(P−Q)² = P(1−Q)P + (1−P)Q(1−P)` with the
C⋆-norm identities, scalar-generic over `RCLike`.

**Objects.** The isometric first isomorphism theorem `rangeEquivOfInnerEq` — two maps out
of a common module with equal pullback inner products have canonically isometric ranges —
and the Gram-rigidity theorems it yields; reflections, diagonal and off-diagonal parts of
an operator relative to `U ⊕ Uᗮ`; the symmetric and directed projection gaps; invariant and
reducing subspaces; restricted spectra with the canonical spectral subspace
`spectralSubspace A Ω` and projector `spectralProjection A Ω`; the spectral-separation
predicates; the orthogonal-series constructor for pairwise orthogonal, not necessarily
unit, vectors.

**API to develop.**

- Gram rigidity: equal pullback inner products give equal kernels and the range isometry;
  for families, equal pairwise inner products give a span-to-span isometry sending
  `φ i ↦ ψ i`, extended in finite dimension to an isometry equivalence of the ambient
  space; the `Matrix.gram` characterization as an iff.
- Projection geometry: projections onto spans of orthonormal families; reflections with
  involutivity, isometry, and commutation-when-reducing; the diagonal/off-diagonal calculus
  (`2·diag = A + R A R`, `2·offdiag = A − R A R`).
- The gap: symmetry, the directed-gap comparison, the max identity above.
- Invariance: invariant and reducing kept as distinct named notions — they coincide for
  symmetric operators, and that coincidence is a theorem; restriction of a symmetric
  operator to an invariant subspace and its restricted spectrum; the quadratic-form bridges
  `SpectrumIn A U (Iic a) → re ⟪A x, x⟫ ≤ a‖x‖²` on `U`, with their converses. Reducing
  subspaces stay independent of all perturbation theory, so they are separately reviewable
  and separately consumable.
- Orthogonal series: a pairwise-orthogonal family of vectors spans an orthogonal family of
  lines — the constructor Mathlib's unit-vector hypothesis blocks; Pythagoras for finite
  sums; summability iff square-norm summability; Parseval for a family with a specified
  sum. The families this roadmap produces are `σᵢ • uᵢ`, orthogonal but not normalizable
  when some `σᵢ` vanish, which is why the unit-vector constructor does not suffice.

### The spectral-separation predicates

Several theorem families across this roadmap family — sine, tangent, double-angle,
Sylvester — hypothesize that two pieces of spectrum are separated, and they do not all
hypothesize the same thing. Naming the separations rather than writing each as an explicit
inequality is what makes "these two theorems have the same gap hypothesis" a checkable
claim; it is also what lets a caller discharge the hypothesis once and feed it to several
theorems.

Two notions are primitive and belong here:

- **`SpectraSeparated A U B V δ`** — every eigenvalue of `A` carried by `U` and every
  eigenvalue of `B` carried by `V` are at distance at least `δ`. This is the weakest and
  most symmetric form; it is what the `π/2` theorems assume, and no ordering of the two
  spectra is implied.
- **`OrderedGap`** — one spectrum lies below the other with a margin: `λ + δ ≤ μ` for every
  `λ` in the first and `μ` in the second. Strictly stronger, and the hypothesis under which
  the constants improve to one.

Everything else that has appeared in this material is a specialization and belongs where it
is consumed. The interval/exterior form — one spectrum in `[a,b]`, the other outside
`(a−δ, b+δ)` — and the two-block form are application shapes of the perturbation theory and
are specified in
[`SpectralSubspacePerturbation`](../SpectralSubspacePerturbation/README.md); they are not
reusable primitives with several independent consumers here.

The roadmap therefore asks for:

- the two primitive predicates, each stated for restricted spectra of a symmetric operator
  on a named subspace;
- the conversions between them: ordered separation implies `SpectraSeparated` at the same
  `δ`; spectral inclusion on opposite sides of a cut gives ordered separation; and the
  bridges to the quadratic-form bounds above, which is how a spectral hypothesis becomes
  usable in an operator estimate;
- for each named form, a statement of which theorem families consume it, so that a
  predicate with no consumer is visible as such.

Parallel definitions encoding the same condition under different names are the failure mode
to avoid. If two forms turn out to be equivalent, one of them is a theorem and not a
definition.

**Milestone — the sharp gap identity**, as an equality with no equal-rank hypothesis, and
**Gram rigidity** in its family form.

**Acceptance criteria.** That the gap identity is an equality with no equal-rank
hypothesis; that the separation predicates are shared, not parallel definitions with one
name; that reducing subspaces import no perturbation theory; that the orthogonal-series
constructor fills the non-unit-vector gap rather than duplicating `OrthogonalFamily`.

## Dependency ordering

Part A comes first: Parts B, C and D each consume it and nothing else — B needs both
moduli, C needs the Gram operator's eigenbasis and the eigenvalue-counting lemmas, D needs
the eigenvalue API behind its quadratic-form bridges. B, C and D are mutually independent
and can proceed in parallel once A lands.

This roadmap is independent: it rests only on Mathlib, and it is the foundation the rest of
the [Hilbert-space operator theory](../README.md) family cites.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge (2013) — Thm 7.2.6
  (unique positive square root), 7.2.7(b), 7.3.1 (polar decomposition), 4.2.6
  (Courant–Fischer), Weyl's perturbation inequality.
- J. B. Conway, *A Course in Functional Analysis*, 2nd ed. — §VI.3 (partial isometries,
  VI.3.2, VI.3.9); M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*, §VI — the
  polar decomposition on Hilbert space.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6**
  (1963) — the intertwining unitary and the projection geometry.
- R. Penrose, *A generalized inverse for matrices*, Proc. Cambridge Philos. Soc. **51**
  (1955) — the four conditions and the uniqueness characterization.
- T.-Y. Chien, S. Waldron, *A characterization of projective unitary equivalence of finite
  frames and applications*, SIAM J. Discrete Math. **30** (2016), arXiv:1312.5393 — Gram
  rigidity in its frame-theoretic form.

## Provenance

A substantial implementation of all four Parts exists in the AIQ DKPS formalization
(Kitware, Inc., Apache-2.0), in namespaces `TauCeti.*`, `LinearMap.*` and
`ContinuousLinearMap.*`. It establishes feasibility and provides source provenance for
integration, but this roadmap specifies the desired mathematics intrinsically and does not
prescribe the donor API or proof architecture.

Two differences between that implementation and what is specified above should be expected
at integration: the square modulus is currently named `abs` there, and the Moore–Penrose
conditions are currently passed as four anonymous hypotheses rather than through a
predicate. The first is the open naming question of Part A; the second is a target of
Part C.

The Gram-matrix material was submitted as mathlib4 pull request
[#40567](https://github.com/leanprover-community/mathlib4/pull/40567) and reshaped on
review: the linear-combination identity moved to its natural home, and the quotient
plumbing became the standalone `rangeEquivOfInnerEq`. That pull request is closed —
Mathlib is not the destination — and the module was generalized further afterwards.
