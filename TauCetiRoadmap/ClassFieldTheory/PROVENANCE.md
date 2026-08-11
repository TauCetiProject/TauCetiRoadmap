# Provenance for the class field theory roadmap

**This file is not normative.** [`README.md`](README.md) is the specification. Nothing here is
a prerequisite of a milestone. This file records dated ecosystem observations, migration
sources, licensing constraints, and the ownership split adopted in the arithmetic portfolio
restructuring.

## Portfolio migration record

This roadmap combines two reviewed sources:

- `roed-math/TauCetiRoadmap` PR #2 at
  `860e95df4902f4cc354def542347897d661cdcc1` supplied finite-group Tate cohomology in all
  integer degrees, class formations, Tate–Nakayama, local invariant maps, local reciprocity,
  norm groups and existence, local Tate duality, and the Euler characteristic;
- PR #6 at `5aa90a7a7bed6e2a0c6940ece96b5dafef4d823c` supplied the finite-completion
  dictionary, global norm-index machinery, Hasse norm, global reciprocity and existence, named
  class fields, global class formations, the sum of local invariants, and Hilbert reciprocity.

The resulting ownership boundary is:

- valuation, unit-filtration, ramification, Frobenius, and tame-quotient targets remain in
  `LocalFieldsRamification`;
- moduli, ray and narrow class groups, adeles, ideles, Hecke characters, infinity types, orders,
  `Pic`, and `NarrowPic` moved from old PR #6 to `GlobalNumberFields`;
- the Hasse–Minkowski block from old PR #6 moved to `GlobalQuadraticForms`;
- local quadratic-form and quaternion invariants remain in `QuadraticFormInvariants`;
- continuous profinite cohomology remains in `ProfiniteCohomology`;
- finite-place Frobenius and the ideal Artin map remain in `NumberFieldArithmetic`.

The old `GlobalClassFieldTheory` directory and namespace were retitled `ClassFieldTheory`.
There is no compatibility alias for the old namespace: consumers should import
`TauCetiRoadmap.ClassFieldTheory.Suggested` and use
`TauCetiRoadmap.ClassFieldTheory`.

## Cycle-breaking decision

Old PR #6 consumed the norm-equation Hilbert symbol from `QuadraticFormInvariants` and then
proved its product formula. That would create a cycle once quadratic invariants consume class
field theory. The corrected direction is:

```text
ClassFieldTheory → QuadraticFormInvariants → GlobalQuadraticForms
```

`ClassFieldTheory` defines the local symbol from `kummerClass`, the continuous cup product and
the invariant map, and proves `hilbertProductFormula`. `QuadraticFormInvariants` later compares
its norm-equation/quaternion symbol with this cohomological one. No quadratic-form module is
imported here.

The public names frozen for global quadratic-form consumers are:

```text
ClassFieldTheory.cyclicHasseNorm
ClassFieldTheory.hilbertProductFormula
```

The Hasse–Minkowski source audit in the old PR #6 provenance remains relevant to
`GlobalQuadraticForms`, not to this roadmap. Its corrected O'Meara route and warnings about the
quaternary case and vector approximation migrated with that block.

## Local consumer contract

`LocalGaloisGroups` consumes the following declarations directly and builds no private
cohomology, Kummer, reciprocity or Euler-characteristic carriers:

```text
GalRep
H
muNRep
kummerClass
kummerEquiv_mixed
h2MuEquivZMod_mixed
h2FpEquivZMod_of_mu
kummerCupPairing
localSymbol
tateDualityPairing_perfect_mixed
finite_H
eulerCharacteristic_finrank_fp
artinMap
cyclotomicCharacter_artinMap
cyclotomicCharacter_artinMap_padic
```

These names are inherited from the corrected PR #2 source. Their carriers are abbreviations of
the imported continuous cohomology objects; the extraction did not copy a second cohomology
implementation.

## Prior formalization work

- **mariainesdff/ideles** (Lean 3, ITP 2022, Apache-2.0) was checked on 2026-08-07 at
  `b85d242f18cb`. It defines the idele class group of a global field, states the main theorems
  of global class field theory, and proves an explicit quotient comparison with the class group.
  Its adelic substrate was ported to Mathlib, while the class-field statements were not. Contact
  the author before adapting code.
- **kbuzzard/ClassFieldTheory** (Apache-2.0) was checked on 2026-08-07 at
  `ccc3323c6750`. Its global chapter was blueprint-only; its Lean tree contained finite Tate
  cohomology, class-formation and Herbrand infrastructure, a local invariant, valuation-sequence
  and unramified-cohomology work. Local-unit Herbrand computations, fundamental classes, and the
  Artin map were still open. Its class-formation interface audit confirms that the distinguished
  `H²` class at a subgroup has order `Nat.card H`, not the ambient index. Coordinate with that
  project before adapting any unlanded code or proof structure.
- **ImperialCollegeLondon/FLT** (Apache-2.0) was checked on 2026-08-07 at
  `d18b563029f3`. It contains sorry-free adelic discreteness and cocompactness and Fujisaki's
  lemma. Those results concern `GlobalNumberFields` carriers consumed here. Coordinate before
  adapting code; independent proofs remain allowed with attribution.

The FLT local-class-field-theory interface on its `erd1/LCFT` line separates
`SatisfiesLocalExistenceTheorem` from `LocalArtinMapData` and assembles them as
`SatisfiesLocalClassFieldTheory`, including arithmetic-Frobenius normalization and tower
compatibility. The old local-fields roadmap's final assembly step translates directly to that
interface. This observation records compatibility only; no implementation was copied.

The migration also preserves the corrected local proof constraints from PR #2: local class
formations are constructed before reciprocity; local duality uses Shapiro/coinduction rather
than a nonexistent filtration by trivial modules; and conductor attainment for complex-valued
characters uses the no-small-subgroups property of `ℂˣ`.

## Mathlib work to watch

These are dated observations and not prerequisites.

- PR #40735 developed `NumberField.IdeleGroup`, its principal subgroup, the idele class group,
  and maps from local units. Those carrier decisions now belong to `GlobalNumberFields`.
- PR #40661 supplied theorem-wanted statements for Hilbert class fields, Kronecker–Weber and
  the principal ideal theorem, overlapping the named class-field layers here.
- PRs #40848 and #40791 developed `S`-integers and the `S`-unit theorem used in the global
  Herbrand calculation.
- PR #41591 developed ring-level decomposition and inertia infrastructure adjacent to the
  finite-completion dictionary.
- The continuous-cohomology and cup-product work tracked by `ProfiniteCohomology` is the carrier
  this roadmap consumes; it should not be duplicated in the finite Tate package.

Refresh all statuses before implementation. If compatible declarations land, adopt their names
and replace local targets with comparison theorems or imports.

## Artin-map boundary

The ideal group, ideal Artin map, value at an unramified prime, uniqueness, monotonicity in the
excluded set, and restriction to subextensions are owned by `NumberFieldArithmetic`. This
roadmap's `abelianArtinHomAway` is only the adapter from `[IsAbelianGalois K L]` to the supplier's
explicit commutativity argument. There is no second ideal group or ideal Artin map.

The local map `artinMap : Kˣ → G_K^{ab}` is different mathematics and is owned here. It uses
arithmetic Frobenius, has dense image, and is generally not surjective. The global idele/ray-class
map is assembled from these local maps and compared with the ideal map by the supplier's
uniqueness theorem.

## Normalization audit

The corrected PR #2 source fixed the following conventions, which survive the migration:

- the local invariant of a fundamental class of degree `n` is `1/n`;
- restriction multiplies local invariants by the degree and corestriction preserves them;
- local reciprocity sends a uniformizer to arithmetic Frobenius;
- for `K/ℚ_p`, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` on units;
- the `ℚ_p` specialization cannot replace the general theorem because the field norm is part of
  the type;
- local Artin maps are not declared surjective.

The global sum-of-invariants theorem and `hilbertProductFormula` use the same normalization.

## Coordination

Coordinate finite Tate and class-formation implementation with active class-field-theory
projects, continuous cohomology with `ProfiniteCohomology`, ramification APIs with
`LocalFieldsRamification`, and all carrier changes with `GlobalNumberFields`. Register work
through this repository's claims process before beginning a substantial milestone. The roadmap
is tested against the repository's manifest; changing that manifest is a repository-level
decision.
