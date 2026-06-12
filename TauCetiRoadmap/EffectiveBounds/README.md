# Roadmap: effective arithmetic bounds and geometry of numbers

Mathlib has Minkowski's convex-body theorem, the canonical embedding, and the Minkowski
bound, but it stops short of the **effective, explicit estimates** that geometry of
numbers exists to produce: a discriminant bound from an integral basis, an explicit class
number bound, the index of squares in the unit group, and — the summit — the
**Hermite–Minkowski finiteness theorem** (only finitely many number fields of bounded
discriminant). **We do not wait: we build the effective bounds here in `TauCeti/`, with
geometry of numbers as the engine.**

The spine is the chain of explicit bounds; geometry of numbers is the tool, not the goal.

Suggested homes: `TauCeti/NumberTheory/EffectiveBounds/` (the bounds) and
`TauCeti/NumberTheory/GeometryOfNumbers/` (the lattice-point engine).

Several Layer-1 bounds already exist, sorry-free, inside
[kim-em/erdos-unit-distance](https://github.com/kim-em/erdos-unit-distance) (the
formalization of Alpöge's disproof of the uniform-constant Erdős unit-distance
conjecture), stated over an arbitrary number field. The first targets here **migrate**
them; credit that source in each ported file.

## Standing hypotheses

Work over a number field `F` (`[NumberField F]`), degree `n = [F : ℚ]`. State each bound
in the generality the proof needs — a discriminant bound needs only an integral basis, the
class number bound needs Minkowski's theorem and an ideal count, the unit-square index
needs Dirichlet's unit theorem — rather than bundling a single "number field with all its
invariants" hypothesis.

## What Mathlib already has (consume)

- **The Minkowski engine:** `Mathlib/Algebra/Module/ZLattice/Basic.lean` and
  `…/Covolume.lean` (lattices, covolume), `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`
  (Minkowski's convex-body theorem).
- **The canonical embedding and discriminant:**
  `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/*` (the Minkowski space, the
  convex-body bound), `Mathlib/NumberTheory/NumberField/Discriminant/*` (the Minkowski
  bound on `|d_F|`, `|d_F| > 1` for `F ≠ ℚ`).
- **Ideal counting (reconcile, do not re-derive):**
  `Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean` already gives the *asymptotic*
  count of ideals by norm. Any `O(X)` upper bound below must be derived from this, not from
  a fresh Rankin argument, where they overlap.
- **Class group and unit theorem:** `Mathlib/RingTheory/ClassGroup.lean`,
  `Mathlib/NumberTheory/NumberField/ClassNumber.lean`,
  `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` (the unit rank, the
  regulator, `fundSystem`).

## What is missing (build here)

The explicit, effective forms: `|d_F| ≤ |disc b|` from any integral basis `b`;
`h_F ≤ |d_F|·4ⁿ`; `[O_F^× : (O_F^×)²] ≤ 2ⁿ`; a clean measure-free lattice-point
packing/doubling API (reconciled with `ZLattice`); and the Hermite–Minkowski finiteness
theorem. None of these explicit bounds is upstream.

---

## The build, in layers

As a layer makes the next layer's *types* expressible in `TauCeti/`, state its milestones
in `Targets.lean` (with `sorry`) and hand them to the AIs to discharge.

### Layer 0: the geometry-of-numbers engine
- Measure-free lattice-point **packing** and **doubling** bounds in boxes/polydiscs (a
  separated set in a box is small; `#(Λ ∩ 2·B) ≤ C·#(Λ ∩ B)`). The erdos
  `GeometricCore` lemmas are the migration candidate.
  ⚠ **Reconcile with `ZLattice` first.** Before porting, map every proposed definition to
  the existing `ZLattice`/covolume API and **drop any `box`/separation definition that is
  just a Mathlib wrapper**; migrate only genuinely measure-free cardinal/doubling lemmas
  not already expressible cleanly upstream.

### Layer 1: effective upper bounds (the first migration targets)
- **Discriminant from an integral basis.** `|d_F| ≤ |disc b|` for any `ℚ`-basis `b` of
  algebraic integers (the index is a nonzero integer); helper: an element with `x² ∈ ℚ`,
  `x ∉ ℚ` has trace zero. (erdos `abs_discr_le_of_basis_isIntegral`.)
- **Class number bound.** `h_F ≤ |d_F|·4ⁿ`, via Minkowski's bound (every class has an
  integral ideal of norm `≤ √|d_F|`) and an ideal count (reconciled with
  `Ideal/Asymptotics`). (erdos `classNumber_le_bound`.)
- **Unit-square index.** `[O_F^× : (O_F^×)²] ≤ 2ⁿ`, from Dirichlet's unit theorem and a
  squaring-map index computation. (erdos `units_sq_index_le`; the abstract group lemma
  `index_powMonoidHom_two_le_of_closure` migrates independently.)

### Layer 2: Minkowski lower bounds and Hermite–Minkowski (the summit)
- Minkowski's **lower** bound on `|d_F|` growing with `n` (so only finitely many `n` admit
  `|d_F| ≤ B`); ⚠ this lower bound, not the upper bounds of Layer 1, is the real content.
  Combined with finiteness of fields of bounded degree-and-discriminant, this gives
  **Hermite's theorem**: only finitely many number fields of bounded discriminant.

### Layer 3: regulators and unit-lattice volume
- The regulator as the covolume of the unit lattice; the algebraic inputs to the analytic
  class number formula.

### Long horizon (aspiration)
**Brauer–Siegel**: `log(h_F · R_F) ∼ log √|d_F|`; effective bounds with explicit
constants.

## Worked examples (acceptance criteria — keep the bounds honest)

- The class number bound is non-vacuous on a small field: for `ℚ(√−5)` (`d = −20`,
  `n = 2`, `h = 2`), `2 ≤ 20·16`.
- A concrete lattice-doubling instance for a rank-2 lattice in `ℝ²`, exercising the
  Layer-0 engine.
- The discriminant bound recovers `|d_{ℚ(i)}| = 4` from the basis `{1, i}`.

## Ordering

Layer 1 first — the explicit upper bounds are direct migrations and validate the pipeline.
Layer 0 (the engine) is best done after its `ZLattice` reconciliation spike, since that
determines what is even worth porting. Layer 2 (the lower bound and Hermite) is the
mathematically hard summit and depends on the Minkowski API. As each milestone's
prerequisite *types* exist in `TauCeti/`, state it in `Targets.lean` (with `sorry`).

## References

- J. Neukirch, *Algebraic Number Theory*, Ch. I §5–6, III §2 (Minkowski theory, the
  discriminant and class number bounds, Hermite–Minkowski).
- H. Cohen, *A Course in Computational Algebraic Number Theory* (effective bounds).
- W. Narkiewicz, *Elementary and Analytic Theory of Algebraic Numbers* (Brauer–Siegel).

## Acknowledgements

The Layer-1 bound lemmas are migrated from
[kim-em/erdos-unit-distance](https://github.com/kim-em/erdos-unit-distance), where they
were written for the formalization of Alpöge's disproof of the uniform-constant Erdős
unit-distance conjecture. Thanks to its authors.
