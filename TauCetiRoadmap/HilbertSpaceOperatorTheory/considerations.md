# Considerations — open API questions on this roadmap

**Draft-only. Delete this file when the PR is undrafted.** It exists so a reviewer or a
later contributor does not have to rediscover the same questions by reading 2000 lines of
`Suggested.lean`. Nothing here is settled; each item is a judgement call with the argument
on both sides.

Criteria are `TauCetiRoadmap/README.md` § *Writing a roadmap*. Line numbers are as of the
`hilbert-space-operator-theory` branch.

---

## Settled and already applied

**`borelCalculus` admissibility** — `SelfAdjointSpectralTheory/Suggested.lean`. Was
`borelCalculus a ha f hf hb` with measurability and boundedness as separate arguments,
which forced `borelCalculus_mul` to take `hfg` and `hfgb` as *hypotheses* even though both
follow from `hf`, `hg`. Fixed by bundling admissibility, so multiplicativity reads
`borelCalculus ha (hf.mul hg) = borelCalculus ha hf * borelCalculus ha hg`.

**Matrix `MeasurableSpace`** — `MatrixSpectralStatistics/Suggested.lean`. Was
`Matrix (Fin n) (Fin n) ℝ`. Generalized to `Matrix m n α`.

Both are demonstrated in the donor repository; see `llm_notes.md` for where.

---

## Open — worth deciding before review

### 1. Three `IsPartialIsometry`, two bridges

`HilbertSpaceOperatorFoundations/Suggested.lean:31, 45, 302` declare the predicate for
star-monoid elements, `E →ₗ[𝕜] F`, and `E →L[𝕜] F`. Mathlib has no `IsPartialIsometry`, so
introducing one is legitimate, and Mathlib itself carries `IsPositive` in both a `→ₗ` and a
`→L` form (`Analysis/InnerProductSpace/Positive.lean:59, 266`), so the multi-carrier pattern
has precedent.

The gap is that Mathlib's precedent comes with transfer lemmas and this does not.
`isPartialIsometry_iff_starMul` (:49) joins the star-monoid and `LinearMap` forms on
endomorphisms, and each carrier has its own `isPartialIsometry_iff_norm_map` (:161, :306).
Nothing relates `ContinuousLinearMap.IsPartialIsometry u` to
`LinearMap.IsPartialIsometry u.toLinearMap` — the pair a user meets first, since every `→L`
carries a `→ₗ`. Without it, half the lemmas apply to a given operator and there is no way to
move between the halves.

*Against acting:* the missing bridge is one lemma and could be left to the implementor.
*For:* the roadmap's job is to fix the public surface, and "which of the three does my
operator satisfy" is exactly what a surface has to answer.

### 2. Predicates that wrap a one-liner

The guideline is explicit — *never wrap a one-line bound in a new predicate* — with
`norm_cfc_le` carrying `∀ x ∈ s, ‖f x‖ ≤ C` inline as the worked example.

Only one member of the original list survives scrutiny, and the test that separates them is
**whether the predicate has an interface**: producers whose conclusion it is, consumers that
take it as a hypothesis, and lemmas about it — versus a name that only saves typing.

**Genuinely gratuitous — resolved.** `PopulationGap` was
`SpectraSeparated A U A Uᗮ Δ`, i.e. a second name for `InternalGap`, which is a third name
for a `SpectraSeparated` instance. Removed in favour of `InternalGap`.

**Not gratuitous, and the flag was wrong** — `LowerFormBoundOn` / `UpperFormBoundOn`
(`SelfAdjointSpectralTheory:170, 174`). They have eight producer theorems whose *conclusion*
is a form bound (`{lower,upper}FormBoundOn_{top_of_spectrum_subset,of_restriction_spectrum_subset}_{Ici,Iic}`,
in both the real and complex spectral-order files) and consumers in the sin Θ and projector
estimates. Nothing anywhere unfolds them. They are the interface between the spectral layer
and the estimate layer: spectral information in, quadratic-form currency out. Inline them and
those eight theorems have conclusions naming nothing, and the boundary disappears. Mathlib
names the degenerate case itself — `ContinuousLinearMap.IsPositive` is symmetry plus
`LowerFormBoundOn _ ⊤ 0`.

**Not gratuitous** — `SpectrumIn` (`HilbertSpaceOperatorFoundations`), 124 uses across 19
files in the donor. That is vocabulary.

**Keep `MapsDomainTo`** (`SelfAdjointSpectralTheory:130`) despite being a one-liner:
`SylvesterEquation.equation` is a *dependent* field referring to it, so it cannot be inlined.
Worth stating as the explicit exception so nobody "fixes" it.

### 2b. Objects that lack their basic theory

The guideline's other rule — *for each object you introduce, ask for its complete basic
theory* — is where the form bounds actually fall short, and it is a better use of effort than
removing them.

Added (proved in the donor, stated here as signatures): weakening in the constant and
restriction to a subspace for each bound, plus both directions of the `IsPositive`
identification. Before, a consumer holding a bound on `U` at constant `c` and needing one on
a subspace of `U` had to reprove it from the definition — which is exactly how a named
predicate drifts from the theory it abstracts.

Still open, same category: the missing `→L`/`→ₗ` bridge for `IsPartialIsometry` in item 1.

### 2c. Namespace discrepancy for the form bounds

The donor declares `LowerFormBoundOn` / `UpperFormBoundOn` inside `namespace
ContinuousLinearMap`, so consumers write `A.LowerFormBoundOn U c`. The roadmap declares them
inside `TauCetiRoadmap.SelfAdjointSpectralTheory`, so they must be written
`LowerFormBoundOn A U c`.

This is not a stylistic tie. `HilbertSpaceOperatorFoundations/Suggested.lean` opens
`namespace LinearMap` and `namespace ContinuousLinearMap` at **top level, outside** the
roadmap namespace, and says so explicitly: *"the namespace is part of the proposal."* That
file is proposing Mathlib-namespace declarations and gets dot notation for them.
`SelfAdjointSpectralTheory` wraps its whole body in the roadmap namespace, so the same
declarations there cannot reach `ContinuousLinearMap`.

Two roadmaps in the same PR therefore propose two different conventions for where an
operator predicate lives, and the donor sides with Foundations. Resolving it means moving the
form-bound block outside `namespace TauCetiRoadmap.SelfAdjointSpectralTheory` — which also
moves it out of `section ClosedOperators` and its `𝕜 / E / F` variables, so it is a
structural edit rather than a one-liner. Left as-is pending that decision; the statements
below use explicit application, matching the rest of that file.

### 3. `IsEigenvectorAt` restates Mathlib

`HilbertSpaceOperatorFoundations:454` is `x ≠ 0 ∧ A x = (lam : 𝕜) • x`, which is Mathlib's
`Module.End.HasEigenvector` (`f.HasEigenvector μ x`). The difference is taking `lam : ℝ` and
coercing — real-valuedness for symmetric operators, which is a lemma about `HasEigenvector`
rather than grounds for a second predicate.

### 4. Scalar generality is not decided

The guideline says decide generality up front and write it down. Currently:

| File | Scalars |
|---|---|
| `MajorizationAndAngles` | `RCLike 𝕜` |
| `MatrixSpectralStatistics` | `RCLike 𝕜` in Part C; `ℝ`-only for Weyl and sorted eigenvalues |
| `SelfAdjointSpectralTheory` | `ℂ` for Stone and the Borel calculus; `RCLike 𝕜` for Part C |
| `OperatorIdeals` | `ℂ` only |
| `SpectralSubspacePerturbation` | `ℂ` only |

This is in the signatures, not the proofs: the ℂ commitment is what forces
`OperatorIdealFamily.{0, v, w}` at `OperatorIdeals:290, 296, 335` to pin the first universe
to a literal `Type 0`.

ℂ is *correct* for Stone and the Borel calculus — they need it. The question is
`OperatorIdeals` and `SpectralSubspacePerturbation`, and `MatrixSpectralStatistics:192`,
which states the intent that "complex Hermitian matrices are covered by the same statement"
while the Weyl bridge above it is `ℝ`-only.

### 5. Names that do not describe their signature

Names are the API surface, so these are in scope even where the mathematics is fine.

- `OperatorIdeals:276` **`symmetricGaugeFamily_injective`** concludes a pointwise
  `Φ.extend a = Ψ.extend a` on antitone sequences, not `Function.Injective`.
- `MajorizationAndAngles:249` **`sum_sq_eigenvalues_sub_ge`** is named `_ge` with a `≤`
  conclusion; its separation constant `γ` appears in three hypotheses and nowhere in the
  conclusion. As a signature it also adds nothing: it is
  `sum_sq_eigenvalues_sub_le_sum_sq_norm_apply` (:237) instantiated at
  `e := hT.eigenvectorBasis hn`. Its `hsep` additionally forces `γ = 0` whenever `S` has a
  repeated eigenvalue. This looks mis-transcribed rather than merely misnamed — most likely
  the intended conclusion was a lower bound.
- `MajorizationAndAngles:129` **`sinThetaSq_eq_card_sub_sum_sq`** unfolds the definition on
  :123 by `Finset.sum_sub_distrib`. Its docstring claims a relation to the Frobenius norm of
  the overlap operator, which the statement does not mention.
- `OperatorIdeals:335` **`gauge_blockSum_le`** is the reverse case: the signature asks only
  for four contractions and a splitting identity, which is *more* general than the docstring's
  "block-diagonal for orthogonal decompositions" and still true. Fix the prose, not the
  statement.

### 6. Prose that promises what the signature does not deliver

- `MatrixSpectralStatistics:115` says the first-countability hypothesis is "a proof artifact";
  the statement still carries `[(nhds p₀).IsCountablyGenerated]`, while the value half at :125
  carries no countability at all. Either it is needed, or it should go.
- `MatrixSpectralStatistics:129` says the two halves of Berge "use *different* hypotheses on
  `K`"; both :137 and :147 take `hKu` and `hKl`.

### 7. Docstrings that narrate the roadmap's own history, or defer to the donor code

Several docstrings explain how the document got this way ("a placeholder stood here and
identified no theorem…", "the previous version of this structure did not have the field…") or
appeal to the donor repository as though it were the specification ("the existing proof
additionally assumes…"). The guideline asks for the opposite — say what the statement should
be, and keep provenance in a clearly secondary section so reviewers do not read the source as
prescriptive. Sites are listed in `llm_notes.md`.

---

## Not a problem — recorded so it is not re-raised

- `SylvesterEquation` (`SelfAdjointSpectralTheory:137`) is a `Prop`-valued structure
  determined entirely by `(A, B, X, C)`, with the domain-transport field load-bearing because
  `equation` cannot be stated without it. This is the shape to imitate.
- `centeredScatter_append` (`MatrixSpectralStatistics:258`) is Welford's update stated
  correctly, including the degenerate `n = 0` case.
- Mathlib's `eigenvalues` is antitone (`Analysis/InnerProductSpace/Spectrum.lean:312`), so the
  index-wise pairings in Hoffman–Wielandt and the von Neumann trace core are the sorted ones.
  They do not need a sorting hypothesis.
