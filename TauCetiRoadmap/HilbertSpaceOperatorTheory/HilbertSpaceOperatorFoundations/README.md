# Hilbert-space operator foundations: polar decomposition, singular systems, and projection geometry

Spectral perturbation theory is written in a small, stable vocabulary: apply a real
function to a self-adjoint operator; factor an operator through its modulus; expand a
rectangular map in its singular system; measure the gap between two orthogonal
projections; separate two pieces of a spectrum. This roadmap builds that vocabulary.

Mathlib has the static ingredients — the spectral theorem
([`LinearMap.IsSymmetric.eigenvalues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Spectrum.html)
and `eigenvectorBasis`), positivity (`LinearMap.IsPositive`), adjoints, the continuous
functional calculus over `ℂ`, and singular *values*
([`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html))
— but not the operator-theoretic layer over it: no partial-isometry API, no polar
decomposition, no singular *vectors*, no sharp projector-difference identity, and
no shared vocabulary of spectral-separation hypotheses.

Suggested home: `TauCeti/Analysis/InnerProductSpace/`, with the subspace-equality isometry lemma
in `TauCeti/Analysis/Normed/Operator/`.

**Why "Hilbert-space" and not "finite-dimensional".** The organizing core is
finite-dimensional: the functional calculus is a finite sum over an eigenbasis, and that
is what makes it exist. But three of the constructions here — the rectangular operator
modulus, the polar decomposition through a partial isometry, and the projection geometry —
need no finite-dimensional hypothesis at all, and consumers need them in that stronger
form. Stating those results in finite
dimension and generalizing later would mean proving them twice, so they are stated for
complete spaces here.

## Standing conventions

- **Scalars are `𝕜 : RCLike`; finite dimension exactly where the eigenbasis is used.** The
  functional calculus is a finite sum over `LinearMap.IsSymmetric.eigenvectorBasis`, so
  `[FiniteDimensional 𝕜 E]` is what makes the definition exist. Supporting material that
  needs neither the spectral theorem nor finite dimension — inner products of linear
  combinations, orthogonal series, projection-gap geometry — must not assume them.
- **One modulus.** The rectangular modulus
  `ContinuousLinearMap.modulus T = CFC.sqrt (T⋆ ∘L T)` is complex and
  works on complete spaces, because Mathlib registers the C⋆-algebra instances on
  `E →L[𝕜] E` only for `𝕜 = ℂ`. Everything stated against a modulus is stated against
  defined.
- **One equation, with carrier-appropriate predicates.** In a star monoid,
  `IsPartialIsometry u` means `u * star u * u = u`; this covers endomorphisms and abstract
  C⋆-algebra elements. A rectangular map `u : E → F` is not an element of one monoid, so
  `LinearMap.IsPartialIsometry` and `ContinuousLinearMap.IsPartialIsometry` state the typed
  equation `u ∘ u† ∘ u = u`. The endomorphism predicates are proved equivalent, and the
  geometric characterization — isometric on `(ker u)ᗮ`, zero on `ker u` — is a theorem,
  never the definition.
- **Three polar factorizations, one hierarchy.** Finite-dimensional endomorphisms over
  `RCLike` factor through a unitary; a rectangular complex operator with invertible
  modulus factors through an isometry; a general bounded rectangular complex operator
  factors through a partial isometry. Dropping finite dimension loses the unitary;
  invertibility of the modulus recovers an isometry. All three are stated, each with its
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

## What Mathlib already has (consume)

- **The spectral theorem:** `LinearMap.IsSymmetric` with `eigenvalues` / `eigenvectorBasis`,
  `LinearMap.IsPositive` with `nonneg_eigenvalues`, adjoints, and the rank-one operators
  `InnerProductSpace.rankOne`. Part A is a finite sum of these.
- **The continuous functional calculus over `ℂ`:** `CFC.sqrt` and `CFC.abs` on `E →L[ℂ] E`.
  Bridge to it; do not duplicate it.
- **Singular values:** `LinearMap.singularValues : ℕ →₀ ℝ` between finite-dimensional inner
  product spaces — zero-indexed, antitone, zero past the rank. Mathlib has the values;
  Part C adds the vectors and the two-sided spectrum bridge.
- **Projections:** `Submodule.starProjection` with `HasOrthogonalProjection`,
  `IsStarProjection`, `Submodule.reflection` — the raw material of Part D.
- **Orthogonal families:** `OrthogonalFamily`, whose only vector-level constructor
  `Orthonormal.orthogonalFamily` requires *unit* vectors — the gap Part D fills for the
  non-normalized families the singular expansion produces.
- **Gram matrices:** `Matrix.gram` and the matrix-side spectral theory; Part D's rigidity
  theorem characterizes equality of `Matrix.gram`.

---

## What is missing (build here)

* Partial isometries for maps between *different* spaces, and their geometric
  characterization; Mathlib has no `IsPartialIsometry` at all.
* The rectangular bounded polar decomposition.
* The singular system: right singular basis, left singular vectors, and the rank-one
  expansion.
* Gram rigidity — equal pairwise inner products force a linear isometry — and the isometric
  first isomorphism theorem it rests on.
* Spectral subspaces, the restricted spectrum, and the separation predicates the perturbation
  roadmaps consume.

## The build, in layers

### Part A — the rectangular modulus, Courant–Fischer, and Weyl

**Objects.** The rectangular
complex modulus `ContinuousLinearMap.modulus T = CFC.sqrt (T⋆ ∘L T)`; and the supporting
algebra — the expansion of `⟪∑ aᵢ • vᵢ, ∑ bⱼ • vⱼ⟫` over pairwise inner products, spans of
orthonormal subfamilies, and the eigenvector cross-term identity
`⟪eᵢ, (S−T) fⱼ⟫ = (μⱼ − λᵢ) ⟪eᵢ, fⱼ⟫`.

**API to develop.**

- The rectangular modulus: nonnegative, self-adjoint, `|T|² = T⋆T`; the pointwise isometry
  `‖|T| x‖ = ‖T x‖` with its kernel corollary; `‖|T|‖ = ‖T‖`; composition norm laws; the
  characterization as the unique nonnegative square root of the Gram operator.
- Courant–Fischer and Weyl: the quadratic form in the eigenbasis, the min–max equality,
  eigenvalue monotonicity, the perturbation bound.

### Part B — polar decomposition and partial isometries

Every bounded operator factors as a partial isometry times its modulus.

**Objects.** The star-monoid and carrier-specific partial-isometry predicates; the initial
space `polarInitial M` (the closure of `range |M|`), the partial isometry
`polarPartial M`, and the bounded-below isometry `polarIsometryOfIsUnitModulus`; the
near-isometry factorization; and Davis's intertwining unitary for a pair of complete
orthogonal projection families.

**API to develop.**

- The partial-isometry dictionary: `star u * u` is a star projection; closure under `star`;
  isometries are partial isometries; the operator characterization — `u` is a partial
  isometry iff it is norm-preserving on `(ker u)ᗮ` (Conway VI.3.2).
- The rectangular decomposition: `polarPartial M ∘L |M| = M`; isometric on
  `polarInitial M`, zero on its complement; `ker (polarPartial M) = (polarInitial M)ᗮ`; the
  adjoint formulas and the final space `polarFinal M = closure (range M)`; uniqueness — any
  `V` with `V ∘L |M| = M` vanishing on `(polarInitial M)ᗮ` is `polarPartial M`.
- The bounded-below rung: when `|M|` is a unit the factor is an isometry outright, with the
  quantitative comparison `‖M − W‖ ≤ ‖|M| − 1‖`. This rung stays separate from the general
  one: bounded-below is the hypothesis perturbation estimates have, and under it
  the conclusion is strictly stronger.

**Milestone — the decomposition.** It has content beyond the
factorization: the initial space is *proved* equal to `(ker M)ᗮ`, never taken as its
definition.

**Milestone — the near-isometry factorization.** A real finite-dimensional map whose
quadratic form is uniformly `δ`-close to the identity (`δ < 1`) factors as `M = W ∘ₗ S`
with `W` an isometry equivalence and `S` the positive square root of the Gram operator,
satisfying `‖S x − x‖ ≤ δ‖x‖`; consequently `‖M − W‖ ≤ 2δ` for `δ ≤ 1/2`. The exact
decompositions give no such estimate.

**Milestone — Davis's intertwining unitary.** For two complete orthogonal families of
projections `(Pⱼ)`, `(P'ⱼ)` satisfying Davis's non-degeneracy condition, the block polar
factors assemble into a unitary `U` with `U ∘ₗ Pⱼ = P'ⱼ ∘ₗ U` for every `j` — this Part's
modulus-inverse-times-operator construction applied to a projection pair.

### Part C — singular values and the singular system

Mathlib has `LinearMap.singularValues`; this Part adds everything around it, and each layer
answers a different question:

**Objects.** The right singular basis `rightSingularBasis A` (the sorted orthonormal
eigenbasis of `A⋆A`); the left singular vectors `leftSingularVector A i = σᵢ⁻¹ • A vᵢ`
(total, zero at zero singular values).

**API to develop.**

- The spectrum bridge: `A⋆A` and `AA⋆` are symmetric and positive; their sorted eigenvalue
  lists agree at every index below both dimensions — no relation between the dimensions is
  required, since both lists are zero past the rank; consequently
  `singularValues A⋆ = singularValues A`, so a rectangular map carries one singular sequence
  rather than two.
- The singular system: `A⋆A` acts on `vᵢ` by `σᵢ²`; the singular relation `A vᵢ = σᵢ • uᵢ`
  including the zero case; the `uᵢ` with `σᵢ ≠ 0` are orthonormal and are eigenvectors of
  `AA⋆` at `σᵢ²`; `A⋆ uᵢ = σᵢ • vᵢ`; the singular expansion of `A x` and the rank-one
  reconstruction of `A`; the extension of the nonzero left family to an orthonormal basis of
  the codomain — the statement consumers need, and not automatic for a rectangular map.

**Milestone — the singular expansion.** `A = ∑ᵢ σᵢ • rankOne uᵢ vᵢ`, intrinsically, with no
basis of the ambient spaces beyond the constructed singular one.

### Part D — Gram rigidity, projections, and spectral subspaces

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
`(a−δ, b+δ)` — and the two-block form are application shapes of the perturbation theory;
they are not reusable primitives with several independent consumers here.

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

## Worked examples (acceptance criteria)

### Part A — the rectangular modulus, Courant–Fischer, and Weyl

**Acceptance examples.** On a concrete diagonal operator the modulus takes its
expected diagonal values; the Weyl bound is sharp for a rank-one perturbation of the
identity.

### Part B — polar decomposition and partial isometries

**Acceptance criteria.** That square and rectangular partial-isometry
predicates state the same typed equation and agree in the endomorphism case; and that
`polarInitial M = (ker M)ᗮ` is a theorem.

### Part C — singular values and the singular system

**Acceptance criteria.** That no
statement of the singular system mentions a basis of the ambient spaces beyond the
constructed singular one; that the four conditions and the uniqueness converse are both
proved; that zero singular values are handled in the singular relation.

### Part D — Gram rigidity, projections, and spectral subspaces

**Acceptance criteria.** That the gap identity is an equality with no equal-rank
hypothesis; that the separation predicates are shared, not parallel definitions with one
name; that reducing subspaces import no perturbation theory; that the orthogonal-series
constructor fills the non-unit-vector gap rather than duplicating `OrthogonalFamily`.

## Ordering

Part A comes first: Parts B, C and D each consume it and nothing else — B needs the
modulus, C needs the Gram operator's eigenbasis and the eigenvalue-counting lemmas, D needs
the eigenvalue API behind its quadratic-form bridges. B, C and D are mutually independent
and can proceed in parallel once A lands.

This roadmap is independent: it rests only on Mathlib, and it is the foundation the rest of
the [Hilbert-space operator theory](../README.md) family cites.

## Definitions

**D1** `S x ↦ T x` — the isometry of ranges induced by two maps out of a common module with
equal pullback inner products.

**D2** `|M| x ↦ M x`, extended by continuity to the closure of `range |M|` and by zero on its
orthogonal complement — the rectangular polar partial isometry.

## References

- R. A. Horn, C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge (2013) — 4.2.6
  (Courant–Fischer), Weyl's perturbation inequality.
- J. B. Conway, *A Course in Functional Analysis*, 2nd ed. — §VI.3 (partial isometries,
  VI.3.2, VI.3.9); M. Reed, B. Simon, *Methods of Modern Mathematical Physics I*, §VI — the
  polar decomposition on Hilbert space.
- C. Davis, *The rotation of eigenvectors by a perturbation*, J. Math. Anal. Appl. **6**
  (1963) — the intertwining unitary and the projection geometry.
- T.-Y. Chien, S. Waldron, *A characterization of projective unitary equivalence of finite
  frames and applications*, SIAM J. Discrete Math. **30** (2016), arXiv:1312.5393 — Gram
  rigidity in its frame-theoretic form.

## Acknowledgements

An Apache-2.0 implementation of all four Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.), in namespaces `TauCeti.*`, `LinearMap.*` and `ContinuousLinearMap.*`. The
public API and proof structure may change during integration.

The Gram-matrix material was submitted as mathlib4 pull request
[#40567](https://github.com/leanprover-community/mathlib4/pull/40567) and reshaped on
review: the linear-combination identity moved to its natural home, and the quotient
plumbing became the standalone `rangeEquivOfInnerEq`. That pull request is closed —
Mathlib is not the destination — and the module was generalized further afterwards.
