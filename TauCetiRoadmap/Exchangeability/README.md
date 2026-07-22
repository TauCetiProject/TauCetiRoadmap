# Roadmap: exchangeability and de Finetti

Exchangeability is the first large probability-symmetry theory missing from Mathlib:
finite-dimensional laws invariant under permutations, spreadability/contractability, tail
σ-algebras for processes, random directing measures, and the conditional-product
representation of invariant laws. Mathlib supplies the ambient stack this rests on: finite
and product measures, kernels, `Measure.bind`, conditional expectation, filtrations and
martingales, `Lp` spaces, Hilbert-space projections, measure-preserving maps, and the mean
ergodic theorem. It does not, however, carry the exchangeability theory on top.

The first summit is the de Finetti–Ryll-Nardzewski theorem for sequences on a standard
Borel space:

```text
contractable ↔ exchangeable ↔ conditionally i.i.d.
```

It has three classical proof routes: reverse martingales, L² contractability bounds, and
Koopman / mean ergodic theory. This roadmap builds the reusable probability-symmetry
library those routes need, in dependency order, with de Finetti as its first summit theorem.

A completed Lean formalization exists in
[`cameronfreer/exchangeability`](https://github.com/cameronfreer/exchangeability); it is a
migration source and API-warning map (see [Migration source](#migration-source)), not the
specification. The specification here is Kallenberg's theorem and the reusable library
needed to state and prove it.

Suggested homes:

```text
TauCeti/Probability/Exchangeability/
TauCeti/Probability/DeFinetti/
TauCeti/Probability/Process/
TauCeti/Probability/Martingale/
TauCeti/Probability/Ergodic/
TauCeti/MeasureTheory/Measure/
```

## The end goal (v1)

For a probability space `(Ω, μ)` and a measurable sequence

```lean
X : ℕ → Ω → α
```

with `α` a standard Borel space, prove the de Finetti–Ryll-Nardzewski equivalence:

```lean
-- the shape we are building toward, once the definitions land in TauCeti:
-- theorem deFinetti_RyllNardzewski_equivalence
--     {Ω : Type*} [MeasurableSpace Ω]
--     {α : Type*} [MeasurableSpace α] [StandardBorelSpace α] [Nonempty α]
--     {μ : Measure Ω} [IsProbabilityMeasure μ]
--     (X : ℕ → Ω → α)
--     (hX_meas : ∀ i, Measurable (X i)) :
--     Contractable μ X ↔ Exchangeable μ X ∧ ConditionallyIID μ X
--
-- theorem deFinetti
--     {Ω : Type*} [MeasurableSpace Ω]
--     {α : Type*} [MeasurableSpace α] [StandardBorelSpace α] [Nonempty α]
--     {μ : Measure Ω} [IsProbabilityMeasure μ]
--     (X : ℕ → Ω → α)
--     (hX_meas : ∀ i, Measurable (X i))
--     (hX_exch : Exchangeable μ X) :
--     ConditionallyIID μ X
```

The standard-Borel hypothesis is on the value space `α`, where the directing measure and
the conditional distributions live; the public statement keeps `Ω` with only a measurable
structure. Build the tail-conditional path law via `condDistrib` on `ℕ → α` (standard Borel
because `α` is), which needs standard Borel only on its codomain; the directing measure is
the one-coordinate conditional law extracted from that conditional path law, with the product
factorization proved separately. An extra `[StandardBorelSpace Ω]` would arise only from
`condExpKernel` (or `condDistrib` specialized to an identity-valued kernel with value space
`Ω`); such a hypothesis is internal to that route and does not appear in the public
statement.

The default public theorem should eventually use the reverse-martingale proof. The L²
route reaches the same standard-Borel theorem through the common ending, with its real-valued
L² statement as an internal intermediate step, and the Koopman route is the ergodic-theory
route with reusable operator-theoretic infrastructure.

## The library spine

The deliverable is a reusable probability-symmetry library, not just a proof script for one
theorem. The de Finetti–Ryll-Nardzewski theorem is the summit of this spine, not its only
output. The spine is:

1. sequence laws and finite-dimensional marginals;
2. exchangeability, full exchangeability, spreadability/contractability, and the bridges
   between the process-level and path-law formulations;
3. product kernels and mixtures of finite product measures;
4. measurable mixtures of i.i.d. product laws, and the genuine conditionally-i.i.d. upgrade
   (the joint-law disintegration given the directing measure);
5. process-relative tail σ-algebras and path-space shifts;
6. reverse martingales for arbitrary decreasing filtrations;
7. Koopman operators and invariant σ-algebras for arbitrary measure-preserving maps.

Each item is worth building for its own sake, so that a later probability-symmetry roadmap
(exchangeable arrays, Markov exchangeability, ergodic decomposition) can consume it directly.

## Standing hypotheses

Spell hypotheses out; do not bundle them.

The basic definitions should be as hypothesis-light as possible:

* `Exchangeable μ X`: invariance of finite-dimensional laws under permutations of `Fin n`.
* `FullyExchangeable μ X`: invariance of the path law under all permutations of `ℕ`.
* `Contractable μ X`: invariance under strictly increasing finite subsequences.
* `MixedIID μ X` (Kallenberg's terminology for the unconditional identity): existence of a
  measurable random probability measure whose
  finite product kernels give the finite-dimensional laws. Pin the random-measure API
  before stating it: either `ν : Ω → ProbabilityMeasure α` (with Mathlib's
  `ProbabilityMeasure.pi`, and `ProbabilityMeasure.toMeasure_pi` / `ProbabilityMeasure.pi_pi`
  for the bridge to `Measure.pi` and rectangle evaluation), or a raw `ν : Ω → Measure α`
  together with an explicit `∀ ω, IsProbabilityMeasure (ν ω)` hypothesis. The
  `MixedIIDWith μ X ν` relation plus the existential wrapper keeps the mixing
  representative nameable in proofs.

This is a representation property of the **unconditional finite-dimensional laws**. Do not call
it `ConditionallyIID`: that standard phrase normally asserts conditional independence relative to
a σ-algebra or random element, using conditional laws or almost-sure conditional-expectation
identities. The mixture equation above is the conclusion of integrating out such conditional
structure, not a definition of conditional independence on the original probability space.

The genuine conditional notion is the **summit predicate**, a separate, stronger target:

* `ConditionallyIIDWith μ X ν`: the **joint-law disintegration**
  `Law(ν, block) = ∫ δ_{ν(ω)} ⊗ (ν(ω))^{⊗m} dμ(ω)` — conditionally on `ν`, every finite
  distinct block is i.i.d. `ν` (Kallenberg 2005, §1.1 eq. (2); stated as a joint-law identity,
  so the definition needs no conditional expectations — Thm 1.1 there is the equivalence with
  exchangeability), with `ConditionallyIID` its existential wrapper.

It strictly strengthens the mixture identity **at a fixed `ν`**: the mixture relation
constrains only the block's marginal law, so for a **nondegenerate mixing law**, on a rich
enough space an **independent copy** of a directing measure also witnesses `MixedIIDWith`
while the process is not conditionally i.i.d. given it. Terminology follows: a `ν` witnessing
only the mixture identity is a **mixing representative**; **directing measure** is reserved
for the conditional predicate's witness. Uniqueness splits the same way: no witness-level
a.e.-equality theorem may conclude `ν = ν'` from `MixedIIDWith` alone — what is unique on the
mixture side is the **mixing law** `μ.map ν` (`mixedIID_mixingLaw_unique`), while a.e.
uniqueness of the witness itself holds on the conditional side
(`conditionallyIID_ae_unique`, Layer 6). The easy arrow is
`ConditionallyIIDWith μ X ν → MixedIIDWith μ X ν` with its existential corollary
`mixedIID_of_conditionallyIID`; the hard converse is de Finetti's upgrade to the canonical
tail-measurable directing measure (`conditionallyIID_of_exchangeable`, Layer 6), and the
summit theorems conclude `ConditionallyIID`, never merely `MixedIID`. Sequencing note:
TauCeti's landed API currently uses the name `ConditionallyIID` for the *mixture* shape, so
the code rename (to `MixedIID` / `MixedIIDWith`) must land **before** the conditional
predicate is implemented under this name.

The standard-Borel hypotheses belong in the directing-measure construction and final
de Finetti theorem, not in every elementary definition. Similarly, L² assumptions belong
only in the L² route, and shift-preservation assumptions belong only in the Koopman /
ergodic-theory lane.

Index the v1 theorem by `ℕ`. General exchangeability over other countable index types,
exchangeable arrays, Aldous–Hoover, Markov exchangeability, and finite de Finetti bounds
are Layer 8 milestones, sequenced after the v1 sequence theorem but still part of this
roadmap.

## What Mathlib already has (consume)

* **Finite products and path laws:** `Measure.map`, finite product measurable spaces,
  `Measure.pi` (`Measure.pi_eq`, `Measure.pi_pi`), and the cylinder/rectangle API:
  `generateFrom_pi`, `isPiSystem_pi`, `MeasureTheory.squareCylinders`,
  `isPiSystem_squareCylinders`, and `generateFrom_squareCylinders`.
* **Finite-dimensional laws determine the law** (general index, finite measures):
  `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq` and
  `identDistrib_iff_forall_finset_identDistrib`
  (`Mathlib/Probability/Process/FiniteDimensionalLaws.lean`). Tau Ceti does not reprove
  finite-dimensional-law uniqueness; its Layer 0 `pathLaw` / `Fin n`-prefix marginal-uniqueness
  wrapper is built on Mathlib's projective-limit uniqueness (`IsProjectiveLimit.unique`).
* **Kernels and bind:** `Kernel`, `Measure.bind`, and the Giry-style measure API needed
  for mixtures of finite product measures.
* **Conditional expectation:** `μ[f | m]`, tower properties, `condExpL2`, and
  conditional-expectation estimates.
* **Filtrations and martingales:** `Filtration`, martingales, submartingales, and the
  available upcrossing machinery.
* **`Lp` and Hilbert-space machinery:** `MemLp`, `Lp`, orthogonal projections, symmetric
  idempotents, and conditional expectation as an `L²` projection.
* **Ergodic and operator theory:** measure-preserving maps, composition with a
  measure-preserving map on `Lp`, and the mean ergodic theorem for suitable continuous
  linear maps.

Consume these directly rather than re-proving Mathlib's product-measure,
conditional-expectation, Hilbert-space, or mean-ergodic infrastructure.

## What is missing (build here)

The missing pieces are:

* finite-dimensional exchangeability and full exchangeability for sequence laws;
* contractability and the proof `Exchangeable → Contractable`;
* the `pathLaw` / `Fin n`-prefix wrappers over Mathlib's projective-limit uniqueness
  (`IsProjectiveLimit.unique`, from `Mathlib.MeasureTheory.Constructions.Projective`);
* product-kernel measurability for random finite product measures;
* the common de Finetti endings turning a mixing-representative bridge into `MixedIIDWith` and
  its joint-rectangle strengthening into `ConditionallyIIDWith`;
* process-relative tail σ-algebras and their antitone filtration structure;
* reverse martingale convergence for conditional expectations along decreasing filtrations;
* Koopman operators and the identification of the mean-ergodic projection with conditional
  expectation onto the invariant σ-algebra;
* the L², Koopman, and reverse-martingale proof routes for de Finetti.

State the general infrastructure at full generality: reverse martingales for arbitrary
decreasing filtrations, and Koopman machinery for arbitrary measure-preserving
transformations, before specializing to path-space shifts.

## Migration source

A completed Lean formalization of this theory exists at
[`cameronfreer/exchangeability`](https://github.com/cameronfreer/exchangeability), pinned at
[`e0532e59ceff23edab44dda9ab0655debbc9cc22`](https://github.com/cameronfreer/exchangeability/tree/e0532e59ceff23edab44dda9ab0655debbc9cc22).
Use it as a source of sorry-free proof scripts to migrate or adapt, a declaration map for
the three proof routes, an API-warning source (where a local definition was convenient but
should be generalized for Tau Ceti), and an attribution source for ported files. It is
**not** the mathematical specification: the specification is the standalone library above,
with Kallenberg, Aldous, Hewitt–Savage, and Ryll-Nardzewski as references. The map below is
"where to look", not "what is correct"; judge each milestone on its own terms. Source
README, work-plan, and note files are background only.

* Layer 0: `Exchangeability/Core.lean`, `Exchangeability/Contractability.lean`,
  `Exchangeability/ConditionallyIID.lean`, `Exchangeability/Util/StrictMono.lean`, and
  `Exchangeability/Util/ProductBounds.lean`.
* Layer 1: `Exchangeability/Probability/MeasureKernels.lean`,
  `Exchangeability/Probability/InfiniteProduct.lean`,
  `Exchangeability/Probability/CondIndep.lean`, the
  `Exchangeability/Probability/CondIndep/` subtree, and
  `Exchangeability/DeFinetti/CommonEnding.lean`.
* Layer 2: `Exchangeability/Tail/*.lean`, `Exchangeability/PathSpace/*.lean`, and
  `Exchangeability/Probability/SigmaAlgebraHelpers.lean`.
* Layer 3: `Exchangeability/DeFinetti/ViaL2.lean`,
  `Exchangeability/DeFinetti/ViaL2/*.lean`, `Exchangeability/DeFinetti/L2Helpers.lean`,
  `Exchangeability/DeFinetti/TheoremViaL2.lean`,
  `Exchangeability/Bridge/CesaroToCondExp.lean`,
  `Exchangeability/Probability/CenteredVariables.lean`,
  `Exchangeability/Probability/IntegrationHelpers.lean`, and
  `Exchangeability/Probability/LpNormHelpers.lean`.
* Layer 4: `Exchangeability/Probability/Martingale.lean`,
  `Exchangeability/Probability/Martingale/Reverse.lean`,
  `Exchangeability/Probability/Martingale/Convergence.lean`,
  `Exchangeability/Probability/Martingale/Crossings/*.lean`, and
  `Exchangeability/Probability/TimeReversalCrossing.lean`. These source crossing and
  convergence files are the reverse-direction delta; consume Mathlib for the forward
  upcrossing and convergence API per the build plan below.
* Layer 5: `Exchangeability/Ergodic/*.lean` and
  `Exchangeability/DeFinetti/ViaKoopman.lean`,
  `Exchangeability/DeFinetti/ViaKoopman/*.lean`, and
  `Exchangeability/DeFinetti/TheoremViaKoopman.lean`.
* Layer 6: `Exchangeability/DeFinetti/ViaMartingale.lean`,
  `Exchangeability/DeFinetti/ViaMartingale/*.lean`,
  `Exchangeability/DeFinetti/MartingaleHelpers.lean`, and
  `Exchangeability/DeFinetti/TheoremViaMartingale.lean`.
* Layer 7: `Exchangeability/DeFinetti/BridgeProperty.lean`,
  `Exchangeability/DeFinetti/Theorem.lean`, `Exchangeability/DeFinetti.lean`, and top-level
  `Exchangeability.lean`.
* Cross-layer helpers: `Exchangeability/Probability/CondExp.lean`,
  `Exchangeability/Probability/TripleLawDropInfo.lean`, and the
  `Exchangeability/Probability/TripleLawDropInfo/` subtree. Pull these into whichever Tau
  Ceti layer first needs the corresponding general-purpose facts.

Credit `cameronfreer/exchangeability` in each ported or adapted file, and record when a
Tau Ceti file intentionally diverges from this source API.

---

## The build, in layers

The ordering below is the dependency order. As each layer makes the next layer's *types*
expressible in `TauCeti/`, state its milestones in `Suggested.lean` with `sorry`.

### Layer 0: sequence laws, finite marginals, and symmetry notions

Suggested home:

```text
TauCeti/Probability/Exchangeability/Basic.lean
TauCeti/Probability/Exchangeability/Contractability.lean
TauCeti/Probability/Exchangeability/FullyExchangeable.lean
```

Build:

* `Exchangeable μ X`;
* `FullyExchangeable μ X`;
* `ExchangeableAt μ X n`;
* `Contractable μ X`;
* `pathLaw μ X`;
* prefix projections and prefix cylinders;
* `pathLaw` / `Fin n`-prefix wrappers over Mathlib's projective-limit uniqueness
  (`IsProjectiveLimit.unique`);
* finite approximation of infinite permutations;
* extension of strictly monotone finite selections to finite permutations.

`Contractable` (invariance under strictly increasing finite subsequences) is the first
formal target for this spreadability notion; `Spreadable` is the standard synonym, mentioned
for orientation. The roadmap commits to the single `Contractable` API, not two parallel ones.

Key milestones:

```lean
measure_eq_of_fin_marginals_eq
exchangeable_iff_fullyExchangeable
exists_perm_extending_strictMono
contractable_of_exchangeable
Contractable.map_single
Contractable.map_pair
Contractable.comp
```

Mathlib's projective-limit machinery (`IsProjectiveLimit.unique`, from
`Mathlib.MeasureTheory.Constructions.Projective`) already gives uniqueness from a projective
family of finite-dimensional marginals; `measure_eq_of_fin_marginals_eq` is the single
`ℕ`-prefix wrapper over it, not new measure theory. It assumes only `[IsFiniteMeasure μ]` (the
conclusion forces `ν` finite), so probability applications are covered directly through the
`IsProbabilityMeasure → IsFiniteMeasure` instance; no separate probability wrapper is needed.

Also build the implication lattice and the alternate characterizations as named API:

* exchangeability via all finite permutations, and via adjacent transpositions (which
  generate the finite permutations, stated finite-dimensionally over `Fin n`);
* contractability/spreadability via the monoid of strictly increasing maps `ℕ → ℕ`;
* closure of each symmetry class under coordinatewise pushforward `X ↦ (f ∘ Xᵢ)`;
* mixtures of i.i.d. laws are exchangeable, and exchangeable laws are stationary;
* the implication lattice among `ExchangeableAt n`, `Exchangeable`, `FullyExchangeable`,
  `Contractable`, `MixedIID`, and `ConditionallyIID`, with every easy arrow named and the hard
  arrow `Contractable → ConditionallyIID` isolated;
* the process-level ↔ path-law bridges in both directions.

State each equivalence with its hypotheses: finite ↔ full exchangeability needs a probability
(or finite) measure and finite-marginal uniqueness, and the adjacent-transposition reduction
is the finitary `Exchangeable`, not `FullyExchangeable`. Downstream users should be able to
name the symmetry notion they mean and move between equivalent formulations by theorem.

⚠ **API warning.** Do not define exchangeability as a property of a measure on path space
only, or as a property of a process only, without bridges. Both viewpoints are useful:
the process-level statements are what users want, while the path-law statements make
π-system and shift arguments cleaner.

### Layer 1: product kernels and mixtures

Suggested home:

```text
TauCeti/MeasureTheory/Measure/ProductKernel.lean
TauCeti/Probability/DeFinetti/CommonEnding.lean
```

Consume Mathlib's product/cylinder infrastructure — `generateFrom_pi`, `isPiSystem_pi`,
`MeasureTheory.squareCylinders`, `isPiSystem_squareCylinders`, `generateFrom_squareCylinders`,
`Measure.pi_eq`, `Measure.pi_pi` — and build only the de Finetti-facing adapters over it:

* measurability of `ω ↦ Measure.pi fun _ : Fin m => ν ω` (the random product kernel);
* measurability of the joint kernel `ω ↦ δ_{ν ω} ⊗ (ν ω)^{⊗m}`, which the conditional common
  ending needs for `Measure.bind_apply` and extensionality on the joint space;
* the AE-measurable version needed for `Measure.bind_apply`;
* rectangle evaluation and equality-from-rectangles specialized to those random product
  measures (that rectangles form a π-system and generate the product σ-algebra is Mathlib's
  `isPiSystem_pi` / `generateFrom_pi`).

Then build the common de Finetti endings:

```lean
mixedIID_of_mixingRepresentative
conditionallyIID_of_jointRectangles
```

The intended bridge hypothesis of the first is an indicator-product factorization: for every
finite injective selection `k : Fin m → ℕ` and measurable rectangle `B`, the law of
`(X (k i))ᵢ` equals the mixture of product measures induced by `ν`. The second is its
**joint-rectangle strengthening** — agreement of the joint law of `(ν, block)` with the
disintegration `δ_ν ⊗ ν^{⊗m}` on rectangles `S ×ˢ B` (measurable `S` in the `ν` coordinate) —
which upgrades to `ConditionallyIIDWith` by the same π-system argument and is what each proof
route calls to reach the conditional summit.

This layer is shared by the L² and Koopman routes, and also useful for the martingale
route's final finite-product step.

### Layer 2: process tails and path-space dynamics

Suggested home:

```text
TauCeti/Probability/Process/Tail.lean
TauCeti/Probability/PathSpace/Shift.lean
TauCeti/Probability/Ergodic/ShiftInvariantSigma.lean
```

Build process-relative tails:

```lean
tailFamily X n
tailProcess X
tailFamily_antitone
tailProcess_le_tailFamily
tailProcess_le_ambient
tailProcess_eq_iInf_revFiltration
```

Build path-space shift:

```lean
shift : (ℕ → α) → (ℕ → α)
shift_measurable
shift_iterate_measurable
```

Build shift-invariant σ-algebras:

```lean
isShiftInvariant
shiftInvariantSigma
shiftInvariantSigma_le
mem_shiftInvariantSigma_iff
shiftInvariantSigma_measurable_shift_eq
shiftInvariant_implies_shiftInvariantMeasurable
```

⚠ **Tail vs invariant σ-algebra.** Do not silently identify the tail σ-algebra with the
shift-invariant σ-algebra. For one-sided sequences, the relationship runs through
invariance, almost invariance, and completions. State exactly the theorem each proof
route needs.

Build the exchangeable σ-algebra and the directing-measure measurability API (the σ-algebra
target Layer 6 consumes; `ν` itself is constructed in Layer 6, not here):

```lean
exchangeableSigma
exchangeableSigma_le
tail_le_exchangeableSigma
hewittSavage_trivial_of_iIndep
```

* the exchangeable / symmetric σ-algebra on path space, and its relationship to the tail and
  shift-invariant σ-algebras (and their completions and a.e. versions) under the de Finetti
  hypotheses;
* the measurability target for a directing measure `ν` with respect to the tail or
  exchangeable σ-algebra;
* the **Hewitt–Savage zero-one law**: for an i.i.d. sequence the *symmetric / exchangeable*
  σ-algebra is trivial. This is stronger than Kolmogorov's tail 0-1 law: tail triviality holds
  for any independent sequence, whereas Hewitt–Savage is the symmetric-σ-algebra statement and
  needs the identically-distributed hypothesis.

### Layer 3: L² averaging library and the standard-Borel de Finetti route

Suggested home:

```text
TauCeti/Probability/Exchangeability/L2/Covariance.lean
TauCeti/Probability/Exchangeability/L2/BlockAverages.lean
TauCeti/Probability/DeFinetti/ViaL2.lean
```

This is the first proof route to port after the shared layers. Its analytic core is
real-valued and second-moment, but the Layer 3 milestone is the standard-Borel de Finetti
statement, not a relabeled real-valued theorem.

Build:

* equality of means and integrals from equal one-dimensional laws;
* equality of pair covariances from equal two-dimensional laws;
* the uniform covariance structure of a contractable L² sequence;
* two-window L² bounds for block averages;
* long-average versus tail-average bounds;
* L¹ convergence of weighted block averages;
* extension from bounded measurable real observables to a countable determining class on the
  standard Borel state space;
* the directing-measure bridge;
* the calls to the common endings — `mixedIID_of_mixingRepresentative` and the joint-rectangle
  `conditionallyIID_of_jointRectangles` for the conditional summit.

Key milestones:

```lean
contractable_covariance_structure
l2_bound_two_windows_uniform
l2_bound_long_vs_tail
weighted_sums_converge_L1
realObservables_determine_directing_measure
directing_measure_satisfies_requirements
conditionallyIID_of_contractable_viaL2
deFinetti_viaL2
deFinetti_RyllNardzewski_equivalence_viaL2
```

Real-valued L² convergence is the intermediate analytic step. Through the common ending and a
determining class of bounded measurable real observables on the standard Borel state space,
the route reaches the standard-Borel de Finetti statement; the roadmap target is this
library-level theorem, stronger than the bare real-valued conclusion the source currently
carries.

### Layer 4: reverse martingales and conditional-expectation limits

Suggested home:

```text
TauCeti/Probability/Martingale/Reverse.lean
TauCeti/Probability/Martingale/AntitoneUpcrossing.lean
TauCeti/Probability/Martingale/LevyDownward.lean
```

Mathlib already provides the upcrossing API (`upcrossingsBefore`, `upcrossings`, and the
submartingale upcrossing bound in `Mathlib/Probability/Martingale/Upcrossing.lean`) and the
forward, upward convergence theorems (`Submartingale.ae_tendsto_limitProcess` and
`tendsto_ae_condExp` in `Mathlib/Probability/Martingale/Convergence.lean`). What it does not
have is the downward theorem along an antitone filtration. Consume the former, and build
only the reversal, the antitone adapter, and the `⨅ n, 𝔽 n` identification:

1. **Finite-horizon reversal.**

   ```lean
   revFiltration
   revCEFinite
   revCEFinite_martingale
   ```

   For an antitone filtration `𝔽 : ℕ → MeasurableSpace Ω`, the finite-horizon reversal
   `n ↦ 𝔽 (N - n)` is an ordinary filtration, and the reversed conditional expectations
   form a martingale by the tower property.

2. **Antitone adapter for the upcrossing bound.**

   ```lean
   upcrossings_bdd_uniform
   ```

   Apply Mathlib's upcrossing bound to the reversed finite-horizon martingale to get a
   uniform crossing bound for the antitone sequence `n ↦ μ[f | 𝔽 n]`. The crossing counts
   are Mathlib's; only this adapter is new.

3. **Existence and identification of the limit.**

   ```lean
   condExp_exists_ae_limit_antitone
   ae_limit_is_condexp_iInf
   condExp_tendsto_iInf
   ```

Target theorem:

```lean
theorem condExp_tendsto_iInf
    [IsProbabilityMeasure μ]
    {𝔽 : ℕ → MeasurableSpace Ω}
    (h_filtration : Antitone 𝔽)
    (h_le : ∀ n, 𝔽 n ≤ (inferInstance : MeasurableSpace Ω))
    (f : Ω → ℝ)
    (h_f_int : Integrable f μ) :
    ∀ᵐ ω ∂μ,
      Tendsto
        (fun n => μ[f | 𝔽 n] ω)
        atTop
        (𝓝 (μ[f | ⨅ n, 𝔽 n] ω))
```

This theorem should be independent of exchangeability and later consumed by the martingale
proof. The L¹ and Lᵖ convergence forms (for `f ∈ L¹` / `Lᵖ`, using Mathlib's
uniform-integrability and eLp-norm conditional-expectation tools) are follow-up Layer 4
targets; the L¹ form is what most uses want.

### Layer 5: Koopman operators and invariant σ-algebras

Suggested home:

```text
TauCeti/Probability/Ergodic/Koopman.lean
TauCeti/Probability/Ergodic/InvariantSigma.lean
TauCeti/Probability/DeFinetti/ViaKoopman.lean
```

Build the generic operator-theoretic lane first:

```lean
koopman
koopman_isometry
fixedSpace
metProjection
birkhoffAverage_tendsto_metProjection
```

State the operator at the right level of generality (it is the same operator everywhere, not
just on `L²`):

* the Koopman operator on `Lᵖ` for `1 ≤ p < ∞` (via Mathlib's `Lp.compMeasurePreserving`), an
  isometric embedding — not unitary for the one-sided shift, since it is surjective only when
  the map is invertible mod null sets;
* the associated Markov operator on bounded measurable functions / `L^∞`: positive and unital;
* multiplicativity **for the deterministic Koopman operator** on `L^∞` — this is special to
  composition operators; a general Markov operator is positive and unital but not
  multiplicative;
* compatibility with composition and with the invariant σ-algebra.

Then specialize to path-space shift and identify the projection:

```lean
fixedSubspace
metProjectionShift
condexpL2
koopman_eq_self_of_shiftInvariant
aestronglyMeasurable_shiftInvariant_of_koopman
lpMeas_eq_fixedSubspace
proj_eq_condexp
metProjectionShift_tendsto
```

Finally build the exchangeability-specific bridge:

```lean
pathSpace_contractable_of_contractable
measure_map_shift_eq_of_contractable
pathSpace_shift_preserving_of_contractable
conditionallyIID_transfer
conditionallyIID_bind_of_contractable
deFinetti_viaKoopman
```

⚠ **Warning.** The mean ergodic theorem gives convergence to an orthogonal projection, and
the probabilistic statement still needs that projection identified with conditional
expectation onto the invariant σ-algebra. That identification is a separate theorem, not a
simp step.

### Layer 6: directing measures and de Finetti representation

Suggested home:

```text
TauCeti/Probability/DeFinetti/ViaMartingale/ContractionIndependence.lean
TauCeti/Probability/DeFinetti/ViaMartingale/FutureFiltration.lean
TauCeti/Probability/DeFinetti/ViaMartingale/DirectingMeasure.lean
TauCeti/Probability/DeFinetti/ViaMartingale/FiniteProduct.lean
TauCeti/Probability/DeFinetti/ViaMartingale.lean
TauCeti/Probability/DeFinetti/Theorem.lean
```

Build:

* Kallenberg's contraction-independence lemma;
* future filtrations and their relation to `tailProcess X`;
* conditional-law convergence by `condExp_tendsto_iInf`;
* the directing measure from tail conditional laws;
* finite-product factorization;
* the final theorem wrappers.

Key milestones:

```lean
conditionallyIID_of_contractable
conditionallyIID_of_exchangeable
deFinetti
deFinetti_equivalence
deFinetti_RyllNardzewski_equivalence
mixedIID_of_contractable
```

`conditionallyIID_of_contractable` is the actual hard route theorem; `deFinetti` and the
Ryll-Nardzewski equivalence conclude `ConditionallyIID`, and the mixture forms
(`mixedIID_of_contractable`, `deFinetti_mixture`) are retained as integrated-out corollaries,
never as the summit.

The directing-measure theorem should expose a real API, not just an existence proof:

* construction of the directing measure `ν`;
* the **conditional upgrade** `conditionallyIID_of_exchangeable`: the constructed `ν` satisfies
  `ConditionallyIIDWith μ X ν` — conditionally on `ν` the process is i.i.d. `ν` (Kallenberg
  2005, Thm 1.1), the sharp form from which the mixture identity follows by integrating out;
* **a.e.** uniqueness of `ν` **among directing measures**, i.e. among witnesses of
  `ConditionallyIIDWith` (`conditionallyIID_ae_unique`: equality of probability measures a.e.
  under the base law, tested against a determining class — not pointwise). Pin its hypotheses:
  `[IsProbabilityMeasure μ] [StandardBorelSpace α] [Nonempty α]`, measurable `X`, and two
  explicit `ConditionallyIIDWith μ X ν` / `ConditionallyIIDWith μ X ν'` hypotheses, concluding
  `ν =ᵐ[μ] ν'`. Mere mixing
  representatives (witnesses of `MixedIIDWith`) are **not** a.e. unique when the mixing law is
  nondegenerate — an independent copy of `ν` is one — so no witness-level a.e.-equality
  theorem may conclude `ν = ν'` from `MixedIIDWith` alone; the mixture-side uniqueness is of
  the mixing law `μ.map ν` (`mixedIID_mixingLaw_unique`, which does quantify over mixture
  witnesses: two `MixedIIDWith` hypotheses, measurable `X`, concluding `μ.map ν = μ.map ν'`).
  The `[IsProbabilityMeasure μ]` hypothesis on `mixedIID_mixingLaw_unique` is load-bearing,
  not decorative: for infinite base measures, distinct mixing measures can give identical
  `∞`-valued finite-dimensional mixtures, so mixing-law uniqueness fails at the hypothesis-light
  generality of the definitions;
* the finite-dimensional factorization identity;
* the empirical-measure form: `(1/n) Σ_{i<n} δ_{Xᵢ}(ω) ⇒ ν(ω)` weakly in `P(α)`, tested
  against bounded continuous functions (a milestone in its own right, bringing in the weak
  topology on `ProbabilityMeasure α`; not a prerequisite for the base directing-measure
  theorem);
* the mixture-of-product-measures form: `pathLaw X = ∫ p^{⊗ℕ} dπ(p)` with `π` the unique law
  of `ν` on `P(α)`;
* the extreme-point corollary, once π-system uniqueness and the Hewitt–Savage input (Layer 2)
  are available: the extreme exchangeable laws are exactly the i.i.d. laws.

This is the default route for the final public API.

### Layer 7: public API and examples

Suggested home:

```text
TauCeti/Probability/Exchangeability.lean
TauCeti/Probability/DeFinetti.lean
TauCeti/Examples/Probability/DeFinetti.lean
```

Expose:

```lean
Exchangeable
FullyExchangeable
Contractable
MixedIIDWith
MixedIID
ConditionallyIIDWith
ConditionallyIID

exchangeable_iff_fullyExchangeable
contractable_of_exchangeable
exchangeable_of_mixedIID
mixedIIDWith_of_conditionallyIIDWith
mixedIID_of_conditionallyIID

conditionallyIID_of_contractable
conditionallyIID_of_exchangeable
deFinetti
deFinetti_equivalence
deFinetti_RyllNardzewski_equivalence
mixedIID_of_contractable

deFinetti_viaL2
deFinetti_viaKoopman

deFinetti_empiricalMeasure
deFinetti_mixture
mixedIID_mixingLaw_unique
conditionallyIID_ae_unique
exchangeable_extreme_iff_iid
```

Route-specific theorem names should keep their suffixes. The unsuffixed theorem should be
the general martingale route.

### Layer 8: generalized exchangeability and representation theorems

This layer is not needed before the v1 sequence theorem, but it is part of the roadmap: it
extends the library from exchangeable sequences to the next standard representation theorems
and approximation results.

Build:

* finite de Finetti bounds, including quantitative approximation by mixtures of products;
* de Finetti for other countable index types;
* ergodic decomposition of exchangeable laws;
* Markov exchangeability;
* exchangeable arrays and the Aldous–Hoover representation (a substantially larger tower than
  the sequence theorem, with its own prerequisites).

Mathlib extraction of the general-purpose infrastructure built along the way — reverse
martingales, Koopman operators, product kernels — is a parallel ongoing goal.

## Worked examples

Discharge these alongside the layers; they check that the API describes real probability
objects, not just the final theorem.

* The law of an i.i.d. sequence is `MixedIID` — indeed `ConditionallyIID`, with the constant
  directing measure — `Exchangeable`, and `Contractable`.
* A `Bool`-valued sequence generated **conditionally i.i.d. given a random `θ`** (draw `θ`,
  then flip i.i.d. `κ (θ ω)`-coins) is exchangeable, with `ω ↦ κ (θ ω)` (`κ` a two-point
  kernel) as the directing measure — genuinely: the generating construction makes it a witness
  of `ConditionallyIIDWith`, not merely a mixing representative. The directing measure is the
  random probability measure induced by `θ`, not `θ` itself; phrasing it via the two-point
  kernel keeps the example independent of a mature `Bernoulli` API.
* Finite-dimensional prefix marginals determine a probability measure on `ℕ → α`.
* Full exchangeability of a path law implies shift-preservation.
* A stationary non-reversible finite-state Markov chain — for instance the deterministic
  3-cycle with uniform stationary law — is shift-invariant but not exchangeable, since the law
  of `(X₀, X₁)` differs from that of `(X₁, X₀)`. This keeps stationarity, shift-invariance, and
  exchangeability distinct.
* Hewitt–Savage: the symmetric σ-algebra of an i.i.d. sequence is trivial.
* The tail-family of a process is antitone.
* The Lévy downward theorem specializes correctly to an eventually constant decreasing
  filtration (a test of `condExp_tendsto_iInf`, not a de Finetti example).
* In the real-valued L² lane, bounded observables give `MemLp 2` automatically.

## Ordering

Layer 0 first: all proof routes need the core definitions and finite-marginal uniqueness.
Layer 1 next: product kernels and the common ending are shared by the proof routes.
Layer 2 next: tails and shifts are needed by the martingale and Koopman routes.

After that, the L² route can land first because it validates the common ending with the
least global infrastructure. Reverse martingales and Koopman can proceed in parallel as
general infrastructure. The martingale de Finetti proof comes after reverse martingales
and becomes the default public theorem. Layer 8 (generalized exchangeability and
representation theorems) sequences after the v1 theorem.

## References

* Olav Kallenberg, *Probabilistic Symmetries and Invariance Principles*, Springer, 2005,
  Chapter 1, Theorem 1.1.
* David Aldous, *Exchangeability and related topics*, École d'Été de Probabilités de
  Saint-Flour XIII, 1983.
* Bruno de Finetti, "La prévision : ses lois logiques, ses sources subjectives", 1937.
* Czesław Ryll-Nardzewski, "On stationary sequences of random variables and the de
  Finetti's equivalence", 1957.
* Edwin Hewitt and Leonard Savage, "Symmetric measures on Cartesian products", 1955.
* Cameron Freer, *Three Roads to de Finetti's Theorem in Lean* (short paper),
  [ITP 2026](https://itp-conference-2026.github.io/program.html).
* `cameronfreer/exchangeability`, Lean 4 formalization of exchangeability and de Finetti.

## Acknowledgements

This roadmap uses Cameron Freer's `exchangeability` formalization as its primary migration
source. It also benefits
from the anonymous reviewers of Cameron Freer, *Three Roads to de Finetti's Theorem in
Lean* (short paper), whose feedback helped golf and simplify the library and make fuller
use of Mathlib. Ported files should preserve source attribution and document any
substantial API changes made during migration to Tau Ceti.
