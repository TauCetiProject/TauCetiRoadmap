# Roadmap: Grothendieck universes

**Summary.** Define Grothendieck universes in Mathlib's model `ZFSet.{u}` of ZFC (well-founded,
with choice) and identify them with the stages of the von Neumann hierarchy at inaccessible
cardinals. The end theorems are: `V_ω` and `V_κ`, for every inaccessible cardinal `κ`
(Mathlib's `Cardinal.IsInaccessible`: uncountable, regular, strong limit), are universes;
Williams's theorem that every universe is one of these; a universe containing `ω` has inaccessible
cardinality `κ` and equals `V_κ`; any two universes are comparable, one being an element of the
other or equal to it; a set lying in some universe lies in a least one; and the universe axiom
« every set lies in a universe » holds in `ZFSet.{u}` iff every cardinal of `Cardinal.{u}` lies
below an inaccessible one. The closure properties of universes (subsets, pairs, unions, products,
function sets, cardinality bounds) are proved on the way. The statements are those of
Gabriel 1962, Kruse 1965 and Williams 1969.

Suggested home: `TauCeti/SetTheory/ZFC/Universe.lean`, beside Mathlib's
`Mathlib/SetTheory/ZFC/VonNeumann.lean`.

## Scope and ownership

**Owned here.** The predicate of being a Grothendieck universe on `ZFSet.{u}`, its closure
properties, its characterisation by inaccessible cardinals, the order of universes, least
universes and the equivalence of the universe axiom with the unboundedness of inaccessible
cardinals.

**Supplied at the pins.** `ZFSet` with membership, `ZFSet.powerset`, `ZFSet.iUnion`,
`ZFSet.IsTransitive`, `ZFSet.omega`, `ZFSet.rank`, `ZFSet.card` and the von Neumann hierarchy
`ZFSet.vonNeumann` (`V_ o`) with `ZFSet.mem_vonNeumann`, `ZFSet.vonNeumann_add_one`,
`ZFSet.isTransitive_vonNeumann` and `ZFSet.card_vonNeumann`; the cardinals `Cardinal.IsRegular`,
`Cardinal.IsStrongLimit`, `Cardinal.IsInaccessible` with
`Cardinal.IsInaccessible.preBeth_ord`. They are Mathlib's, consumed by name.

**Not here.** That a universe containing `ω` is a model of ZFC (Kruse 1965, after Shepherdson
1952) needs a formal semantics of first-order set theory over `ZFSet`, which is not at the pins,
and is not in this roadmap. Neither are Tarski's axiom of inaccessible sets, large cardinals above
inaccessibles, or the use of universes in category theory (small categories, `U`-categories,
`U`-topoi): roadmaps that fix a universe in their conventions keep doing so in their own words.
The type universes of Lean are context only (Research context), not a deliverable.

The boundary in one sentence: statements about elements of `ZFSet.{u}` that are universes are
here; what one does inside a universe is elsewhere.

## Conventions

- Sets are elements of `ZFSet.{u}` for a fixed universe level `u`; cardinals and ordinals are
  `Cardinal.{u}` and `Ordinal.{u}`. Witness: `ZFSet.card (∅ : ZFSet.{u}) = 0` (`ZFSet.card_empty`)
  and `ZFSet.card {∅} = 1` (`ZFSet.card_singleton`).
- `V_ o` is Mathlib's `ZFSet.vonNeumann o`, the sets of rank `< o`, so `V_ 0 = ∅` and
  `V_ 1 = {∅}`; `x ∈ V_ o ↔ ZFSet.rank x < o` (`ZFSet.mem_vonNeumann`). Some authors index the
  hierarchy so that `V_α` is the sets of rank `≤ α`; here `V_ (o + 1) = (V_ o).powerset`
  (`ZFSet.vonNeumann_add_one`).
- **Inaccessible** means Mathlib's `Cardinal.IsInaccessible`, which is uncountable. Williams 1969
  and Tarski 1938 call inaccessible « in the narrower sense » the cardinals `α` such that unions of
  fewer than `α` sets of size `< α` have size `< α`, and `2^ξ < α` for `ξ < α`; these are `0`, `ℵ₀`
  and Mathlib's inaccessible cardinals (`1` and `2` fail, since `2^0 = 1` and `2^1 = 2`). Hence
  the separate case `V_ω` in 2.2. Witness: `ℵ₀` is regular and a strong limit, and
  `¬ Cardinal.IsInaccessible ℵ₀` since `ℵ₀ < ℵ₀` fails.
- **Universe axioms.** The structure `IsGrothendieckUniverse U` has the five fields of Williams
  1969, p. 1 (UA1–UA5): `U` is transitive, closed under `powerset`, closed under singletons,
  closed under unions `⋃ i, f i` of families `f : I → ZFSet` of elements of `U` indexed by an
  element `I ∈ U`, and nonempty. Gabriel 1962, Ch. 0, §1, p. 328, lists instead U1–U5, with
  ordered pairs in place of nonemptiness; 1.2 proves the two lists equivalent for nonempty `U`.
  Witness: `∅` satisfies UA1–UA4 vacuously and fails UA5.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `ZFSet` (`Mathlib/SetTheory/ZFC/Basic.lean`): membership, `ZFSet.powerset`, `ZFSet.mem_powerset`,
  `ZFSet.sUnion`, `ZFSet.iUnion` over a `Small.{u}` index with `ZFSet.mem_iUnion`, `ZFSet.range`,
  `ZFSet.small_coe` (each `x : ZFSet.{u}` is a small index type), `ZFSet.pair`, `ZFSet.prod`,
  `ZFSet.omega`, `ZFSet.regularity`.
- `ZFSet.IsTransitive` (`Mathlib/SetTheory/ZFC/Ordinal.lean`).
- `ZFSet.rank`, `ZFSet.rank_lt_of_mem` (`Mathlib/SetTheory/ZFC/Rank.lean`).
- `ZFSet.vonNeumann` with notation `V_`, `ZFSet.mem_vonNeumann`, `ZFSet.vonNeumann_add_one`,
  `ZFSet.isTransitive_vonNeumann`, `ZFSet.vonNeumann_subset_of_le`, `ZFSet.card_vonNeumann`
  (`card (V_ o) = preBeth o`) (`Mathlib/SetTheory/ZFC/VonNeumann.lean`).
- `ZFSet.card`, `ZFSet.card_mono` (`Mathlib/SetTheory/ZFC/Cardinal.lean`).
- `Cardinal.IsInaccessible`, `Cardinal.IsInaccessible.isRegular`,
  `Cardinal.IsInaccessible.isStrongLimit`, `Cardinal.IsInaccessible.preBeth_ord`,
  `Cardinal.IsRegular`, `Cardinal.IsStrongLimit`, `Cardinal.preBeth`, `Cardinal.ord`,
  `Cardinal.le_preBeth_ord` (`Mathlib/SetTheory/Cardinal/Regular.lean`, `Aleph.lean`).

**From Tau Ceti.** Nothing is consumed from Tau Ceti.

Nothing is consumed from another roadmap.

## How to read the build

Layer 1 defines universes and derives their closure properties and the bound `card x < card U`
for `x ∈ U`. Layer 2 proves that the inaccessible stages are universes and, conversely, Williams's
theorem that every universe is such a stage, with the cardinality of a universe. Layer 3 deduces
the order of universes, least universes and the universe axiom from Layer 2. The hardest target is
2.2, and within it the inclusion `U ⊆ V_κ`, which uses regularity (foundation) in `ZFSet`.

## Layer 1: universes

### 1.1 Grothendieck universes

Define `IsGrothendieckUniverse U` with the fields of the Conventions (Williams 1969, p. 1, after
Gabriel 1962, Ch. 0, §1, p. 328). *Needs:* Mathlib `ZFSet.IsTransitive`, `ZFSet.powerset`,
`ZFSet.iUnion`, `ZFSet.small_coe`.

**Checks.**

- `∅` is not a universe (UA5), and `{∅}` is not either: `∅ ∈ {∅}` but `ZFSet.powerset ∅ = {∅}`
  is not an element of `{∅}`, so UA2 fails.
- `V_ (ω + 1)` is not a universe: `V_ ω ∈ V_ (ω + 1)` and its power set `V_ (ω + 1)` is not an
  element of itself; a definition without UA2 would accept it.
- `V_ (ω + ω)` is transitive and closed under power sets and singletons but is not a universe:
  with `I = ω ∈ V_ (ω + ω)` and `f n = V_ (ω + n)`, the union `⋃ n, f n = V_ (ω + ω)` is not an
  element of itself. A definition without UA4 (a Zermelo universe) would accept it.

### 1.2 Closure properties

For a universe `U`, prove: `∅ ∈ U`; a subset of an element of `U` is in `U`; `x, y ∈ U` iff the
pair `{x, y} ∈ U` iff the ordered pair `ZFSet.pair x y ∈ U`, so UA1–UA5 imply Gabriel's U1–U5 and
conversely for nonempty `U`; `x ∪ y`, `x ×ˢ y` (`ZFSet.prod`), the set of functions from `x` to
`y`, and the product of a family indexed by an element of `U` are in `U` when their data are; and
`ZFSet.card x < ZFSet.card U` for `x ∈ U` (Gabriel 1962, Ch. 0, §1, p. 328, the corollaries listed
after the axioms). Prove that `ZFSet.omega ∈ U` iff `U` has an infinite element. *Needs:* 1.1,
Mathlib `ZFSet.mem_powerset`, `ZFSet.pair`, `ZFSet.prod`, `ZFSet.card_mono`.

**Checks.**

- In `V_ ω`, `{∅, {∅}} = V_ 2` is an element (a hereditarily finite set) and `ZFSet.omega` is not
  (its rank is `ω`).
- `card x < card U` is strict: for `U = V_ ω`, every element is finite and `card U = ℵ₀`.
- The union `x ∪ y` is the union of the family `![x, y]` indexed by `V_ 2 ∈ U`, which is how UA4
  yields binary unions.

### Examples

- `V_ ω` is a universe (2.1) and contains `V_ n` for every `n : ℕ`.
- `V_ (ω + ω)` satisfies every axiom except UA4.

### Dependencies

Mathlib: `ZFSet`, `ZFSet.IsTransitive`, `ZFSet.powerset`, `ZFSet.iUnion`, `ZFSet.card`.

## Layer 2: universes are the inaccessible stages

### 2.1 The inaccessible stages are universes

Prove `isGrothendieckUniverse_vonNeumann`: `V_ κ.ord` is a universe for every inaccessible
`κ : Cardinal.{u}`, and `isGrothendieckUniverse_vonNeumann_omega0`: `V_ ω` is a universe (Williams
1969, (b) and (c), p. 2, quoting Shepherdson 1952). Route: `V_ κ.ord` is transitive; a set of rank
`< κ.ord` has power set of rank `< κ.ord` because `κ.ord` is a limit; and if `I ∈ V_ κ.ord` and each
`f i ∈ V_ κ.ord`, then `card I < κ` and regularity of `κ` bounds `sup_i rank (f i) < κ.ord`. Prove
`ZFSet.card (V_ κ.ord) = κ` (Mathlib `ZFSet.card_vonNeumann` and
`Cardinal.IsInaccessible.preBeth_ord`). *Needs:* 1.1, Mathlib `ZFSet.vonNeumann`,
`ZFSet.mem_vonNeumann`, `ZFSet.isTransitive_vonNeumann`, `Cardinal.IsInaccessible.isRegular`,
`Cardinal.IsInaccessible.isStrongLimit`.

**Checks.**

- For `κ` inaccessible, `V_ κ.ord` contains `ZFSet.omega` (rank `ω < κ.ord`), so it differs from
  `V_ ω`.
- The strong limit property is used: `ℵ₁` is regular and not a strong limit. The element
  `I = V_ (ω + 1)` of `V_ ℵ₁.ord` has cardinality `2^ℵ₀ ≥ ℵ₁`, so there is a family
  `f : I → V_ ℵ₁.ord` whose ranks are cofinal in `ℵ₁.ord`; its union has rank `ℵ₁.ord` and is not in
  `V_ ℵ₁.ord`, so UA4 fails.
- Regularity is used: for `κ = ℶ_ω` (a singular strong limit), the family `n ↦ V_ (ℶ_ n).ord`
  indexed by `ω` has union `V_ κ.ord`, which is not an element of itself, so `V_ κ.ord` fails UA4.

### 2.2 Williams's theorem

Prove `isGrothendieckUniverse_iff`: a set `U` is a universe iff `U = V_ ω` or `U = V_ κ.ord` for an
inaccessible `κ` (Williams 1969, Theorem 1, p. 2, using Kruse 1965: for a universe `U` there is a
narrow-sense inaccessible `α` with `x ∈ U ⇒ x ⊆ U ∧ card x < α`). Route: with `α = card U`, prove
`V_ α.ord ⊆ U` by induction on ranks below `α.ord` (UA2, UA1, UA4), and `U ⊆ V_ α.ord` by
regularity: a `∈`-minimal element of `U \ V_ α.ord` would be a subset of `V_ α.ord` of cardinality
`< α`, hence of rank `< α.ord`. *Needs:* 1.2, 2.1, Mathlib `ZFSet.regularity`, `ZFSet.rank`,
`ZFSet.rank_lt_of_mem`, `ZFSet.vonNeumann_subset_of_le`.

**Checks.**

- The two cases are disjoint: `ZFSet.omega ∈ V_ κ.ord` and `ZFSet.omega ∉ V_ ω`.
- No other countable universe: `V_ n` for `n : ℕ` fails UA2 at `V_ (n - 1)` when `n ≥ 1`, and
  `V_ 0 = ∅` fails UA5.
- The equality, not only an inclusion, is needed for 3.1: `V_ ω ⊆ V_ κ.ord` and `V_ ω ≠ V_ κ.ord`.

### 2.3 The cardinal of a universe

Prove `IsGrothendieckUniverse.isInaccessible_card`: a universe `U` with `ZFSet.omega ∈ U` has
inaccessible cardinality, and `IsGrothendieckUniverse.eq_vonNeumann_card`: `U = V_ (card U).ord`
(Williams 1969, Theorem 2, p. 3, with Theorem 1). *Needs:* 2.1, 2.2.

**Checks.**

- For `U = V_ ω`, `card U = ℵ₀` is not inaccessible in Mathlib's sense: the hypothesis
  `ZFSet.omega ∈ U` is needed.
- For `κ` inaccessible, `card (V_ κ.ord) = κ` and `V_ (card (V_ κ.ord)).ord = V_ κ.ord`.
- The cardinal determines the universe: two universes containing `ω` with the same cardinality
  are equal.

### Examples

- `V_ ω`, the hereditarily finite sets, is the least universe.
- If `κ < λ` are inaccessible, `V_ κ.ord ∈ V_ λ.ord` are universes.

### Dependencies

Layer 1; Mathlib `ZFSet.vonNeumann`, `ZFSet.rank`, `ZFSet.regularity`, `Cardinal.IsInaccessible`.

## Layer 3: the order of universes and the universe axiom

### 3.1 Universes are totally ordered

Prove `IsGrothendieckUniverse.mem_or_eq_or_mem`: for universes `U` and `V`, `U ∈ V`, `U = V` or
`V ∈ U`; hence `U ⊆ V` or `V ⊆ U`, and the universes are well-ordered by `∈` (from 2.2: `V_ o ∈
V_ o'` iff `o < o'`, since `ZFSet.rank (V_ o) = o`). *Needs:* 2.2, Mathlib `ZFSet.mem_vonNeumann`.

**Checks.**

- `V_ ω ∈ V_ κ.ord` for every inaccessible `κ`.
- The disjunction is exclusive by regularity: `U ∈ V` and `V ∈ U` cannot both hold, and `U ∈ U`
  never holds.
- For `U = V`, the theorem gives no information beyond `U = V`: a universe is never an element of
  itself, by regularity.

### 3.2 Least universes

Prove `exists_least_isGrothendieckUniverse`: if some universe contains `x`, a least one does, and
it is `V_ ω` when `x` is hereditarily finite and `V_ κ.ord` for the least inaccessible `κ` with
`ZFSet.rank x < κ.ord` otherwise (Gabriel 1962, Ch. 0, §1, p. 328). Prove that the intersection of
a nonempty set of universes is a universe, the least one among them. *Needs:* 3.1, 2.2.

**Checks.**

- The least universe containing `∅` is `V_ ω`.
- The least universe containing `ZFSet.omega` is `V_ κ.ord` for the least inaccessible `κ`, when
  one exists in `Cardinal.{u}`.
- The hypothesis cannot be dropped: if `Cardinal.{u}` has no inaccessible cardinal, no universe
  contains `ZFSet.omega`.

### 3.3 The universe axiom

Prove `forall_exists_isGrothendieckUniverse_iff`: every `x : ZFSet.{u}` lies in a universe iff every
`c : Cardinal.{u}` lies below an inaccessible `κ : Cardinal.{u}` (Williams 1969, p. 3, the
equivalence of (A) and (B)). The left side is the axiom of universes of SGA 4, Exposé I,
Appendice; neither side is a theorem of Mathlib's foundations for a fixed `u`, and this roadmap
states only the equivalence. *Needs:* 2.2, 2.3, 1.2, Mathlib `Cardinal.le_preBeth_ord`.

**Checks.**

- Direction « ⇒ » applied to `x = V_ (c.ord + ω)` gives a universe containing an infinite set of
  cardinality `≥ c`, whose cardinal is inaccessible (2.3) and `> c` (1.2).
- Direction « ⇐ » applied to `x` uses `c = card (V_ (ZFSet.rank x + 1))`: an inaccessible `κ > c`
  has `ZFSet.rank x < κ.ord`, so `x ∈ V_ κ.ord`.
- Replacing Mathlib's inaccessibles by regular cardinals on the right would make the right side
  true (successor cardinals are regular) while the left side is not provable, so the strong limit
  condition matters.

### Examples

- Every hereditarily finite set lies in the universe `V_ ω`, with no hypothesis.

### Dependencies

Layer 2; Mathlib `Cardinal.IsInaccessible`, `Cardinal.ord`, `Cardinal.preBeth`.

## Downstream consumers

No roadmap on main or in an open pull request cites this one.

## Research context

Lean's type universes give universes of `ZFSet` one level up. Mathlib proves that
`Cardinal.univ.{u, u+1}`, the cardinal of `Cardinal.{u}` seen in `Cardinal.{u+1}`, is inaccessible
(`Cardinal.IsInaccessible.univ`), so by 2.1 the stage `V_ (Cardinal.univ.{u, u+1}).ord` of
`ZFSet.{u+1}` is a universe; it is the copy of `ZFSet.{u}` inside `ZFSet.{u+1}`. A universe
containing `ω` is a model of ZFC, and the universes containing `ω` are the super-complete models of
Shepherdson (Kruse 1965); that statement needs a semantics of set theory over `ZFSet` and is
outside this roadmap.

## References

- P. Gabriel, « Des catégories abéliennes », *Bull. Soc. Math. France* 90 (1962), 323–448,
  Chapitre 0, §1, p. 328. doi:10.24033/bsmf.1583; Zbl 0201.35602.
- A. H. Kruse, « Grothendieck universes and the super-complete models of Shepherdson »,
  *Compositio Math.* 17 (1965), 96–101. Zbl 0129.00505.
- N. H. Williams, « On Grothendieck universes », *Compositio Math.* 21 (1969), 1–3.
  Zbl 0175.00701.
- J. C. Shepherdson, « Inner models for set theory. II », *J. Symbolic Logic* 17 (1952), 225–237.
  doi:10.2307/2266609; Zbl 0048.28105.
- A. Tarski, « Über unerreichbare Kardinalzahlen », *Fund. Math.* 30 (1938), 68–89.
  doi:10.4064/fm-30-1-68-89; Zbl 0018.34702.
- M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas
  (SGA 4)*, tome 1, Lecture Notes in Math. 269, Springer, 1972, Exposé I, Appendice « Univers »
  (by N. Bourbaki). doi:10.1007/BFb0081551; Zbl 0234.00007.
