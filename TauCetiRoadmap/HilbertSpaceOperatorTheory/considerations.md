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

| Declaration | Body |
|---|---|
| `SelfAdjointSpectralTheory:152` `LowerFormBoundOn` | `∀ x ∈ U, c * ‖x‖ ^ 2 ≤ re ⟪A x, x⟫` |
| `SelfAdjointSpectralTheory:156` `UpperFormBoundOn` | the same with the inequality reversed |
| `SpectralSubspacePerturbation:317` `PopulationGap` | `SpectraSeparated A U A Uᗮ Δ` |
| `HilbertSpaceOperatorFoundations:462` `SpectrumIn` | `restrictedSpectrum A U ⊆ Ω` |

`PopulationGap` is the clearest: the body is an application of a sibling roadmap's own
predicate, so the PR proposes two public names for one notion.

The form bounds have a second issue independent of the guideline — Mathlib's `IsPositive`
covers the `U = ⊤`, `c = 0` case and nothing relates them.

*Against acting:* the form bounds appear in many statements, and a name is more readable than
a repeated two-line hypothesis. *For:* that is the argument the guideline anticipates and
rejects, and a redundant predicate grows a redundant theory of lemmas.

**Keep `MapsDomainTo`** (`SelfAdjointSpectralTheory:130`) despite being a one-liner:
`SylvesterEquation.equation` is a *dependent* field referring to it, so it cannot be inlined.
Worth stating as the explicit exception so nobody "fixes" it.

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
