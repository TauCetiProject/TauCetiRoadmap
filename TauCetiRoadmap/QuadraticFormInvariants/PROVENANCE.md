# Provenance for the quadratic-forms roadmap

This file is **not normative**. [README.md](README.md) is the definitive document, and
no milestone there depends on anything recorded here. This file holds dated information
about the surrounding ecosystem: the revision at which Mathlib was inspected, the
external formalizations that cover overlapping ground, and the conditions that apply
before any code crosses a project boundary. Re-run the searches and update the dates at
implementation time.

## Portfolio restructuring snapshot

- Source retained PR: TauCetiRoadmap PR #4 at
  `687a9156dc61af4c029395bc7ebd9c8d442a5293` (2026-08-09).
- Restructured on 2026-08-10 under the arithmetic-portfolio master plan.
- Retained here: local quadratic-form invariants and classification (including the
  dyadic case), quaternion/norm Hilbert symbols, the Brauer/cohomological comparison,
  the Kummer cup--norm theorem, `w1`, `w2`, Scharlau transfer, and the relative
  Evens--Kahn formula.
- Rewired suppliers: `ProfiniteCohomology`, `LocalFieldsRamification`, and
  `ClassFieldTheory`. The first two supply continuous-cohomology and ramification
  interfaces; CFT supplies the local invariant, the cohomological Hilbert pairing, and
  Hilbert reciprocity.
- Frozen bridge exports: `hilbertSymbol_eq_cohomological` and
  `hilbertSymbol_productFormula`. The latter is derived from
  `ClassFieldTheory.hilbertProductFormula`; there is no reverse dependency from CFT.
- Removed from this roadmap's ownership: Hasse--Minkowski and all global classification,
  realization, isotropy, and isometry theorems. Their owner is `GlobalQuadraticForms`.

## Mathlib inspection

- Roadmap pin: `9caeba1000`, 2026-06-03. Toolchain `leanprover/lean4:v4.31.0-rc1`.
- The inventory in the README's "From Mathlib" section was checked at the pin and
  rechecked on master on 2026-08-06.
- Continuous cohomology exists at the pin, in
  `Mathlib/Algebra/Category/ContinuousCohomology/Basic.lean`: the functor
  `continuousCohomology R G n` on `R`-linear representations of a topological group,
  together with the degree-zero computation. The low-degree calculational API does not
  exist there: no Kummer isomorphism, no cup product, no restriction or corestriction,
  and no Evens norm. The profinite-cohomology roadmap builds that API on the Mathlib
  functor, and Layer 7A consumes it from there rather than from Mathlib. Mathlib master
  also has
  `RepresentationTheory/Homological/ContCohomology/`, which is a second development of
  the same subject; compare the two before building on either.
- `Mathlib/NumberTheory/LocalField/Basic.lean` supplies `IsNonarchimedeanLocalField` at
  the pin. It does not supply a normalized valuation, a unit filtration, or the
  square-class count. The local-fields-ramification roadmap builds them on that class,
  and Layer 6A consumes them from there.

## Related Mathlib work

None of the following is a prerequisite of any milestone. Each is recorded so that a
later implementer does not duplicate it, and so that a landed declaration replaces a
local one.

- **Quaternion algebras as central simple algebras.** Pull requests
  [#41536](https://github.com/leanprover-community/mathlib4/pull/41536) (the quaternion
  directory split), [#41537](https://github.com/leanprover-community/mathlib4/pull/41537)
  (two-sided ideal lemmas), and
  [#41538](https://github.com/leanprover-community/mathlib4/pull/41538) (Mathias-Stout,
  J. Springer), which depends on the first two and proves that `ℍ[R,a,b,c]` over a field
  is central simple when `c·(b² + 4a) ≠ 0`, adding
  `Mathlib/Algebra/Quaternion/CentralSimple.lean`. All three were open on 2026-08-06, at
  heads `e95984de0341`, `40983fffa9aa`, and `86493005d20f`. Layer 5 states the same
  theorem intrinsically and proves it. **Migration:** when #41538 lands, delete the
  local proof, import `Mathlib/Algebra/Quaternion/CentralSimple.lean`, and keep the
  vocabulary of the `BrauerData` fields unchanged, so that no consuming statement moves.
- **Brauer multiplication.** Pull request
  [#26377](https://github.com/leanprover-community/mathlib4/pull/26377) (open on
  2026-08-06 at `13cac7e3b9bb`) proves that the tensor product of a simple algebra and a
  central simple algebra is simple. The semisimple-algebras roadmap owns that statement
  inside this family.
- **Reduced norm and trace.** Pull request
  [#28970](https://github.com/leanprover-community/mathlib4/pull/28970) (open on
  2026-08-06 at `5a2bcb298759`, last updated 2025-11-19) is related work. No milestone
  uses a general reduced norm or trace, because Layer 2 builds the quaternion norm form
  from `star`.
- **Indefinite bilinear forms.** Pull request
  [#38194](https://github.com/leanprover-community/mathlib4/pull/38194) touches real
  signature theory only. There is no conflict.

## External formalizations

The information below was collected from public repositories and pull-request metadata
on 2026-08-06. No external contact was made, and no ownership agreement is claimed.

### `mariainesdff/HassePrinciple`

- **Authors:** Nirvana Coppola, María Inés de Frutos-Fernández, and contributors.
- **Revision inspected:**
  [`d2802ddce55e`](https://github.com/mariainesdff/HassePrinciple/commit/d2802ddce55ef34045f68c5bf39c0598e7d0e988),
  2026-07-27. **Licence:** Apache-2.0.
- **Content.** The Hasse-Minkowski theorem over `ℚ`, following Serre: an integer-valued
  `hilbertSym` on a general field with Serre's solvability definition, the `p = 2`
  `epsilon` and `omega` residues, `p`-adic squares in `Padics/Squares.lean`, Serre's
  contiguous-orthogonal-bases chain in `QuadraticForm/Chain.lean` stated with
  `[Invertible (2 : k)]`, and the Hasse-Minkowski invariant with the rank-by-rank case
  analysis.
- **Overlap.** Chain equivalence, the Hilbert symbol, and `p`-adic squares. Its
  Hasse--Minkowski material now overlaps the downstream `GlobalQuadraticForms` roadmap,
  not this roadmap's owned scope.
- **Difference.** Their target is the global theorem over `ℚ`. This roadmap's target is
  the general-field invariant theory, the classification over every nonarchimedean local
  field including the dyadic ones, and the cohomological comparison. Global form theory
  is routed to `GlobalQuadraticForms`. Their `hilbertSym` is
  `0` on a zero argument; the symbol here is total on `Kˣ × Kˣ`, and the comparison
  lemma between the two conventions belongs to the coordination.
- **Contact status:** not contacted. **Agreed ownership:** none recorded.
- **Condition.** Before adapting code, proof organization, or project-specific statement
  shapes, contact the maintainers and record the division of work. Keep QFI adaptations
  restricted to local invariant and symbol material; route Hasse--Minkowski adaptations
  to `GlobalQuadraticForms`. Consume their files only after those files land in Mathlib
  or after explicit coordination.

Prior art in the same direction: the 2023 Lorentz-Center workshop project on
Hasse-Minkowski by A. Best, K. Buzzard, M. Streng, H. Wiersema, and R. Winter.

### `Whysoserioushah/BrauerGroup`

- **Revision inspected:**
  [`283e0df7dc15`](https://github.com/Whysoserioushah/BrauerGroup/commit/283e0df7dc15cd8b469a73fbc763f74637c87147),
  2026-07-16. **Licence:** Apache-2.0.
- **Content.** A staging repository for the full Brauer-group program: Wedderburn,
  Skolem-Noether, the double centralizer, splitting fields, the group structure,
  `Br(K) ≅ H²(Gal(Kˢ/K), Kˢˣ)`, `Br(ℝ)`, and `Br(𝔽_q)`.
- **Overlap.** The comparison theorem that Layer 7B of this roadmap also states.
- **Contact status:** not contacted. **Agreed ownership:** none recorded.
- **Plan.** Track and consume upstreamed Mathlib results rather than migrating staging
  code into Tau Ceti. If their comparison theorem reaches Mathlib first, then
  milestones 1 and 2 of Layer 7B become consumed statements, and milestones 3 to 5
  remain the work of this roadmap.
- **Condition.** No code adaptation and no alternate API without recorded coordination.

## `gq2-lean` provenance

The [`roed-math/gq2-lean`](https://github.com/roed-math/gq2-lean) project (Apache-2.0,
same ownership as this roadmap) contains working single-purpose versions of several
targets, over dyadic bases only. They are evidence that the statements are formalizable
and a source of proofs. They are not prescriptions of form; improve them rather than
copy them.

Map from `gq2` file to layer here:

- `GQ2/StiefelWhitney.lean` (`swOne` and `swTwo`, with proved Delzant well-definedness
  over a finite dyadic base) to Layers 0 and 8;
- `GQ2/TraceForm.lean` (`traceFormOne` and `traceFormTwisted` diagonalizations) to
  Layer 9;
- `GQ2/HilbertSymbol*.lean` (the `ℚ_2` symbol through `ε` and `ω`, with the necessity
  and sufficiency case analysis, that is the `8 × 8` table) to Layer 6;
- `GQ2/Kummer.lean` and `GQ2/QuadraticAdjoin.lean` (Kummer cocycles and quadratic
  coordinates) to Layer 7;
- `GQ2/EvensKahn.lean` and `GQ2/EvensKahnDerived.lean` (the index-2 two-point Evens norm
  and the derived equation (111)) to Layer 9;
- `GQ2/RegularIsometry.lean`, `GQ2/RegularSummand.lean`, and `GQ2/TrivialSelfDual.lean`
  are not migrated, because they are presentation-specific;
- `GQ2/QuadraticFp2.lean` and `GQ2/GaussSigns*.lean` are characteristic-2 and
  finite-field material, which the standing exclusion of the README puts outside scope.

### Consumer map, dated 2026-08-08

**Not normative.** The README specifies generic declarations and is organized around the
mathematics, not around any consumer's acceptance labels. This table records how one
consuming formalization's labels land on those declarations, so that the layers of
[README.md](README.md) can be read without the labels. Nothing here is a prerequisite of
any milestone, and no milestone is organized around a label.

| consumer label | declaration or milestone here |
|---|---|
| B9 | the form-level relative Stiefel-Whitney theorem of Layer 9, `relativeStiefelWhitney_quadraticExtension`, stated on the isometry classes of `Tr_*⟨1⟩` and `Tr_*⟨a⟩` with the canonical `w₁`, `w₂`, corestriction, cup and index-two Evens norm; its calculational corollary on diagonal tuples is `relativeStiefelWhitney_quadraticExtension_diagonal`, and the finite dyadic base is a specialization of either |
| B11a | the Kummer-cup/norm-equation theorem of Layer 7C, `cup_kummerClass_eq_zero_iff`, over any field in which `2` is invertible, together with its four companion descriptions, of which the `{±1}`-valued one is `cup_kummerClass_eq_zero_iff_hilbertSymbol` at Layer 6C's `hilbertSymbol` over a nonarchimedean local field |

Both rows are theorems about quadratic forms, quaternion algebras and Galois cohomology
with every consumer name removed, which is why they belong here and not outside the
repository. The dyadic case is not a separate statement in either row: Layer 7C's theorem
carries no hypothesis on the residue characteristic, and Layer 9's carries none beyond
separability and degree two.

## Supplying Tau Ceti roadmaps

This section is a dated record, not a specification: the normative statement of what this
roadmap consumes is the contract table in [README.md](README.md), which names every
supplier declaration exactly.

Three roadmaps in this repository supply material that this one used to define or cite
through the former combined Local Fields roadmap.

- The **[local-fields-ramification
  roadmap](../LocalFieldsRamification/README.md)** owns the normalized valuation, the
  absolute ramification index, the unit filtration, local power and square classes with
  the identification of the two spellings of the square classes, unramified extensions,
  and norm groups. Layer 6A consumes them.
- The **[profinite-cohomology roadmap](../ProfiniteCohomology/README.md)** owns continuous
  cohomology in all degrees, with cup products, Kummer theory, restriction,
  corestriction, and the Evens norm. Layer 7A consumes them.
- The **[class-field-theory roadmap](../ClassFieldTheory/README.md)** owns the local
  invariant normalization, the cohomological Kummer-cup Hilbert pairing, local duality,
  and Hilbert reciprocity. QFI imports those declarations and owns only their comparison
  with the norm-equation/quaternion symbol. This gives the strict direction
  `ClassFieldTheory -> QuadraticFormInvariants`.

Where a supplier owns a milestone but exports no target signature for it, this roadmap
states the specialized shape its own layers consume, as a theorem about the supplier's
objects rather than as a second definition. Those, at the heads inspected on 2026-08-08,
are: the local square theorem `U(K, 2e+1) ⊆ (Kˣ)²` in its sharp general form; the
square-class counts in the `4 · q^e` shape Layer 6D consumes; the unramified norm group
phrased through the norm equation `b = x² − Δ y²`; and the filtration quotients, which
6A cites rather than restates. If the local-fields-ramification roadmap later names any of them, the
local statement is deleted and the contract table gains a declaration.

One object is this roadmap's because the ramification supplier does not name it:
`IsUniformizer` in its
valuation form. One more is this roadmap's because it is specific to `μ₂`: `mu2EquivZMod2`
with the triviality of the Galois action on `μ₂`, and the mod-2 map `h2MuToUnits` read
through it. The coefficient object `Additive Kˢˣ` and the passage from a field embedding to
the open subgroup the supplier's operations are indexed by are the profinite-cohomology
roadmap's, as `UnitsCoeff` and as `galoisSubgroup` with `galoisRes`, `galoisCor` and
`galoisEvens`; this roadmap consumes them and builds no copy.

## Licence note

The independent comparison formalization
[`davidturturean/gq2-lean-turturean`](https://github.com/davidturturean/gq2-lean-turturean)
is GPL-licensed. Cite it for comparison only. No code moves from it into Apache-licensed
Tau Ceti without an explicit licensing decision.
