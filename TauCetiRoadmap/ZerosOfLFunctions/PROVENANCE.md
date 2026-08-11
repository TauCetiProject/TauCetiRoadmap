# Zeros of L-functions: provenance and portfolio boundaries

Supporting material for [`README.md`](README.md), which is the specification. Nothing here is
a completion criterion. This file records where the roadmap came from, which sibling interfaces
it consumes, and which source checks changed the mathematical statement.
This file is explicitly non-normative: no roadmap milestone or dependency depends on it.

The roadmap was mechanically renamed from `LFunctionZeros` to `ZerosOfLFunctions` and then
refactored from source commit `21e58a4bcba71584e143aa37f8abdb4ac46a4262` on
`roadmap/lfunction-zeros`. The portfolio-boundary audit was completed on **2026-08-10**. The
underlying Mathlib audit was made on **2026-08-07** against project pin
`9caeba1000ef8f302920981f4a08651d325abc81` (Mathlib, 2026-06-03).

## Final ownership boundary

This roadmap has four direct roadmap dependencies.

- [`LFunctions`](../LFunctions/README.md) owns analytic L-function cards, their duals,
  completed Dedekind and Hecke functions, Euler-product-side nonvanishing, and normalization
  transport. This roadmap owns the growth, finite-order, factorization, zero-counting,
  zero-free-region, explicit-formula, and certification consequences of those cards.
- [`ArithmeticDirichletSeries`](../ArithmeticDirichletSeries/README.md) owns ideal weights,
  regrouping by norm, generic prime sums and counts, Abel summation, Perron's formula,
  Wiener--Ikehara, and the generic prime-number-theorem transfer. This roadmap consumes those
  declarations and owns only their L-function specializations and subsequent contour shifts.
- [`Chebotarev`](../Chebotarev/README.md) owns `frobeniusPrimeSet`,
  `frobeniusVonMangoldtCoeff`, `frobeniusPsi`, `frobeniusTheta`, `frobeniusPrimeCount`, and the
  qualitative Dirichlet/natural-density and prime-counting theorems. Effective Chebotarev here
  is stated on exactly those carriers; no parallel Frobenius or prime-counting API is created.
- [`ContourIntegration`](../ContourIntegration/README.md) owns the general-cycle residue
  theorem. This roadmap owns the rectangle package and the localization and canonical-
  representative bridges needed to apply that theorem to meromorphic L-functions.

There is deliberately no direct dependency on `ClassFieldTheory` or
`GlobalNumberFields`: any algebraic or character-theoretic input reaches this roadmap through
the L-functions or Chebotarev interfaces above.

General Artin representations and Artin L-functions were moved out of the current L-functions
roadmap after its coefficient carrier proved too restrictive. The generic zero-analysis
declarations remain applicable to a future Artin card once its owning roadmap supplies the
ordinary `AnalyticLFunctionData` predicates.

## Extraction ledger

The restructuring moved ownership without deleting the analytic applications.

| Material formerly described here | Final owner | What remains here |
|---|---|---|
| Generic ideal von Mangoldt weights and prime sums | Arithmetic Dirichlet Series | logarithmic-derivative specialization and explicit formula |
| Generic Abel summation | Arithmetic Dirichlet Series | transfer of effective weighted estimates to the relevant L-function counts |
| Truncated Perron formula, including the endpoint kernel | Arithmetic Dirichlet Series | verification of coefficient hypotheses and contour shift |
| Wiener--Ikehara and qualitative PNT transfer | Arithmetic Dirichlet Series | stronger zero-free-region error terms |
| Frobenius prime set and `ψ_C`, `ϑ_C`, `π_C` | Chebotarev | effective fixed-extension estimates and exceptional-zero terms |
| Qualitative Chebotarev | Chebotarev | a consistency corollary obtained by discarding the effective error |

The retained core comprises gamma growth and logarithm branches; analytic conductors and
convexity; entire functions of finite order and Hadamard factorization; zero counts and the
Riemann--von Mangoldt formula; zero-free regions and exceptional zeros; explicit formulas;
certified zero enclosures; and effective prime-ideal and Chebotarev estimates.

## Corrections discovered during source and interface review

- **Analytic conductor.** A `Gammaℂ(s + ν)` factor contributes the paired real shifts
  `(|s + ν| + 3)(|s + ν + 1| + 3)`, not `(|s + ν| + 3)^2`. The paired form is needed for
  exact compatibility with the modular-forms normalization.
- **Normalization sign.** Translating arithmetic weight `w` to analytic normalization shifts
  gamma parameters by `+w/2`. An earlier draft of the supplier README showed the opposite
  sign, while its Lean prototype used the correct positive sign.
- **Divisors versus values.** `meromorphicOrderAt f z = 0` is a punctured-germ statement and
  does not imply a useful pointwise value for an arbitrary total representative. Counts use
  divisors; contour evaluation additionally needs the canonical-representative analyticity and
  nonvanishing hypotheses recorded in Layer 7.
- **Signed versus unsigned counts.** The argument principle computes a signed divisor count.
  Certificates use a natural-valued zero count and therefore carry an explicit no-poles
  hypothesis.
- **Rectangle hypotheses.** `Rect.Valid` is enough for sets and counts. The supplier's
  piecewise-regular curve interface requires `Rect.Nondegenerate`; degenerate edges cannot be
  hidden inside the contour theorem.
- **Perron ownership.** Titchmarsh Lemma 3.12 is the source of the generic finite-height
  formula, but that declaration is now supplied by Arithmetic Dirichlet Series. Layer 8 begins
  with its specialization, not a second proof.
- **Effective Chebotarev ownership.** The exact conjugacy-class prime carrier and its weighted
  and unweighted counts are supplied by Chebotarev. The only new objects here are the
  exceptional-zero contributions and effective error theorems.

## Source-location checks

The hard-milestone table in the README records the detailed hypotheses and translations. The
following corrections are especially easy to lose in later edits.

- Kadiri Theorem 1.1 contains two different ranges: no zeros for `|Im s| ≥ 1`, and at most
  one real simple zero in the stated small-ordinate region. They must not be merged into one
  unconditional zero-free assertion.
- Titchmarsh Lemma 3.12, equation (3.12.1), is the truncated Perron formula. Titchmarsh
  Theorems 9.2--9.4 supply the unit-height count and the Riemann--von Mangoldt formula with its
  endpoint convention.
- Davenport §17 is the explicit formula for `ψ(x)`; §18 is the prime number theorem; §19 is
  the explicit formula for `ψ(x,χ)`; §20 is the prime number theorem for arithmetic
  progressions. In particular, §19 is not the source of the `exp(-c sqrt(log x))` error.
- Lang, chapter XVII §3, Theorems 3.1 and 3.2 provide the Weil explicit formula and the
  limiting logarithmic-derivative expansion. The zero sum is a symmetric height limit, not
  automatically an absolutely convergent series.
- Iwaniec--Kowalski equation (5.7) fixes the analytic-conductor convention. No unchecked
  within-chapter theorem number is used as the authority for a milestone.
- Lagarias--Odlyzko is the classical source for the effective Chebotarev shape. The roadmap
  states only fixed-extension dependence and leaves the exceptional real-zero contribution
  explicit; it does not claim fully numerical or conductor-uniform constants.

## Ecosystem notes

- Mathlib's `Analysis/Complex/ValueDistribution/` supplies Jensen and divisor infrastructure,
  but its integrated, disc-based counting functions do not replace the rectangle and
  unintegrated counts required here.
- `Analysis/Complex/BorelCaratheodory.lean` is the intended engine for the hard half of
  Hadamard factorization.
- `Analysis/Complex/BranchLogRoot.lean` supplies continuous logarithms on simply connected
  sets; the gamma, Hadamard, and argument-lift uses each still require the appropriate
  holomorphic upgrade.
- PrimeNumberTheoremAnd provides a useful `K = ℚ` comparison for effective PNT work. Its
  coefficient and contour infrastructure should be compared before implementing Layer 8,
  without changing the ownership boundary above.
