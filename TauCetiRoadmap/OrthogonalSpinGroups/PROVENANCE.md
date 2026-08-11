# Provenance and restructuring record

This file is non-normative. `README.md` is the definitive roadmap. This file records the source
revision, review decisions, supplier contracts, and ownership migration so that the corrected
mathematics is not lost when generic adelic material moves out.
No roadmap milestone or dependency depends on this file.

## Source revision

This is retained PR #12, refactored from source revision
`3f5bb5adf840865b0e2772cc40d1cde4a7974321`
(`roadmap(OrthogonalSpinGroups): name the supplier of Layer 5H's Hasse principle`). The
Clifford-norm sign convention, reflection factor, finite-versus-full-adele distinction,
noncompact-place formulation of strong approximation, split-torus normalization, and every
low-dimensional `τ(SO_Q)` exception are preserved.

## Migration ledger for PR #12

| Source material | Destination | Status |
| --- | --- | --- |
| Layers 0--2: orthogonal/special-orthogonal groups, determinant, reflections, Clifford and spinor norms, exact kernel/image comparison, transvections and local spinor norms | OrthogonalSpinGroups | retained |
| Layer 3A and 3C--3G: the orthogonal group schemes, specialized compact-open data, orthogonal/Spin adelic aliases, diagonals, adelic spinor norm and double cosets | OrthogonalSpinGroups | retained |
| Layer 3B: generic restricted-product maps, congruence, integral subgroup and rational diagonal | AdelicAlgebraicGroups | replaced-by-contract |
| Layer 3H: generic reduction theory, norm-one adelic subgroup, finite covolume and density | AdelicAlgebraicGroups | moved |
| Layer 4: general strong approximation versus verification for `Spin_Q` and the finite-adelic/spinor-kernel corollaries | AdelicAlgebraicGroups / OrthogonalSpinGroups | split |
| Layer 5A--5E: invariant forms, Haar/Tamagawa measures, convergence, central-isogeny comparison and the simply-connected semisimple theorem | AdelicAlgebraicGroups | moved |
| Layer 5F--5I: orthogonal measures, the `Spin → SO` computation and `τ(SO_Q)` with dimensions 0, 1 and 2 separated | OrthogonalSpinGroups | retained |

There is one public owner for every generic carrier. The old local `SquareClass` alias and generic
square-class pushforward stand-ins were deleted; the spinor norm now uses
`Kˣ ⧸ Subgroup.square Kˣ` directly, with square-class ownership documented in
QuadraticFormInvariants.

## Mathlib audit

Pin `9caeba1000ef8f302920981f4a08651d325abc81` (2026-06-03), toolchain
`leanprover/lean4:v4.31.0-rc1`, licence Apache-2.0. The capability audit was performed
2026-08-07 against `LinearAlgebra/CliffordAlgebra/`,
`Topology/Algebra/RestrictedProduct/`, `LinearAlgebra/QuadraticForm/`, and
`NumberTheory/NumberField/AdeleRing.lean`.

The audit fixed three naming hazards: `lipschitzGroup`, `pinGroup`, and `spinGroup` are in
the root namespace, as are `sigPos` and `sigNeg`. It also confirmed that Mathlib has no
reflection determinant for `Module.reflection`, no restricted-product congruence API, no adelic
point groups of algebraic groups, and no Tamagawa measure. The latter generic gaps are now owned
by AdelicAlgebraicGroups rather than by this roadmap.

At the next toolchain bump recheck mathlib4 changes #37381 (the `IsOrtho` deprecation) and
#40451 (the `CliffordAlgebra` quotient refactor).

## Final supplier contracts

- **QuadraticFormInvariants** supplies the raw multiplicative square-class quotient, reflection
  and Cartan--Dieudonné input, Witt theory, `hilbertSymbol`, `localHasse`,
  `hasseInvariant_eq_localHasse`, and local classification.
- **LocalFieldsRamification** supplies local compactness, normalized valuations, unit filtrations,
  square-class counts and the deep-squares theorem
  `unitFiltration_le_range_powMonoidHom_two` with its sharpness.
- **ClassFieldTheory** supplies `ClassFieldTheory.hilbertProductFormula`; it supplies no
  quadratic-form or Hasse--Minkowski carrier.
- **GlobalQuadraticForms** supplies `LocallyEquivalent`, `hasseMinkowski_equivalent`, and
  `equivalent_of_locallyEquivalent`. This corrects the old attribution of Hasse--Minkowski to
  source PR #6.
- **AdelicAlgebraicGroups** supplies the generic restricted-product/adelic names checked in
  `Suggested.lean`, and owns the README-level `LocalPointGroup`, `CompatibleCompactOpens`,
  `AdelicPointsAway`, `strongApproximation`, and `tamagawaMeasure` contracts.
- **ReductiveGroups** and **SpinRepresentations** remain accepted external suppliers for
  structure theory and Clifford representation theory.
- **IntegralLattices** is the downstream consumer.

The dependency arrows are one-way. OrthogonalSpinGroups does not recreate a generic adelic group,
measure, reduction theorem, or Hasse principle.

## Review decisions preserved

- The reflection coefficient uses Mathlib's un-halved polar form:
  `B(x,v) / Q(v) = 2 B(x,v) / B(v,v)`; the mixed coefficient
  `2 B(x,v) / Q(v)` is rejected because it sends `v` to `-3v`.
- The Clifford norm is `reverse g * g`, so a vector has norm exactly `Q(v)`. Mathlib's
  `star` convention differs by a sign on odd Clifford degree, and that sign is not killed by
  square classes in general.
- Rational points are discrete in the full adelic group and need not be discrete in the finite
  adelic group.
- Strong approximation for Spin is controlled by a noncompact place for every almost-simple
  factor. Indefiniteness is only the `S = {∞}` corollary.
- The generic strong-approximation proof and generic Tamagawa construction are not duplicated
  merely to keep the orthogonal application self-contained.
- For dimension two the split norm-one torus uses a residue normalization, not a finite
  `L(1, χ)`; dimensions zero and one both have Tamagawa number one.
