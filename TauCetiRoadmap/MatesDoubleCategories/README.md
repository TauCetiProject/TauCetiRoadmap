# Mates as a double isomorphism

Construct the mates isomorphism of doubly weak double categories for an arbitrary
Mathlib bicategory. Use the represented implicit presentation of
Fairbanks–Shulman: cells have paths on all four boundaries, and binary and nullary
path composites are chosen by invertible globular cells. Recover the ordinary
strict double isomorphism when the bicategory is strict.

The development order is M1 → M2 → M3 → M4. M2 tests the foundations on ordinary
strict double categories before the general mates construction. M3 proves the
general mates theorem; M4 specializes that theorem. The implementation belongs
in `TauCeti/CategoryTheory/DoubleCategory/`, with reusable bicategory path and
adjunction lemmas in the corresponding `TauCeti/CategoryTheory/Bicategory/`
modules. Names in `Suggested.lean` illustrate interfaces, not mandated spellings.

## Conventions and scope

Objects, horizontal generators, vertical generators, and cells have independent
universe parameters. Free paths may raise a morphism universe to include the
object universe. For the mates construction use `K : Type u` with
`[Bicategory.{w, v} K]`; do not assume `Bicategory.Strict K` until M4.

Horizontal arrows point right; vertical arrows point down. Composition is in
diagrammatic order. A cell has boundary `(top, bottom, left, right)`:

```text
       S
  A₁ ──────→ A₂
  │          │
 F₁         F₂
  │          │
  ↓          ↓
  B₁ ──────→ B₂
       T
```

In the mates examples, a vertical generator is a specified adjunction
`Fᵢ ⊣ Gᵢ`, oriented along `Fᵢ`. Retain its left adjoint, right adjoint, unit,
counit, and triangle identities, using `Bicategory.Adj.Hom`. The two cell types
on this boundary are

```text
L: S ≫ F₂ ⟶ F₁ ≫ T          R: G₁ ≫ S ⟶ T ≫ G₂.
```

This fixes the direction of the equivalence to be Mathlib's
`Bicategory.mateEquiv adj₁ adj₂ : L ≃ R`. Keep the same external boundary on
both sides; an arrow in the right-adjoint formula is not a new vertical
generator. Document the change of diagram convention when comparing with
Kelly–Street, who orient their displayed vertical arrows along right adjoints.

In an implicit double category, concatenate paths strictly in both directions.
The square cell types remain indexed by those paths, so equality of pasting
operations includes transport along the path unit and associativity equalities.
Do not replace these equalities by additional coherence isomorphisms.

A square has four singleton boundaries. A horizontal globular cell has empty
vertical boundaries, and a vertical globular cell has empty horizontal
boundaries. Read horizontal globular cells from top to bottom and vertical
globular cells from left to right. An empty path and a singleton containing a
chosen identity generator are distinct. Their comparison is part of the
representation data, including in a strict example.

Use separate explicit quivers/categories or object wrappers for the two edge
directions; avoid competing global instances on the shared object type. Reuse
`Quiver.Path`/`CategoryTheory.Paths`, `Category`, `Functor`, `Iso`, `Bicategory`,
and the existing adjunction and mates APIs. Supply named transport and
extensionality lemmas so users need not manipulate heterogeneous equalities.

This roadmap includes the basic theory needed to use these structures and their
strict comparison. It does not include the double-computad monad construction,
the comparison with Verity or Garner presentations, general strictification
equivalences for all bicategories, or the other examples of doubly weak double
categories. No general equipment construction is a prerequisite.

## M1: strict and represented implicit double categories

**M1.1 — Strict cells and maps.** Define a boundary-indexed strict double
category over a horizontal and a vertical category sharing objects. Give both
cell identities and pasting operations; prove or require both associativity and
unit laws, middle-four interchange, preservation of composition by both
identity-cell assignments, and equality of the two identity cells on an object.
Provide boundary transport, congruence, cancellation of transport, extensionality,
and rewriting lemmas for all operations.

Define strict double functors: a common object map, functorial edge maps in each
direction, and a cell map preserving boundaries, both identities, and both
pastings. Define identity and composite functors, extensionality, and double
isomorphisms as functors with strict two-sided inverses. Their inverse laws are
equalities of functors, not equivalences of categories of cells. Include an
identity-on-objects-and-edges constructor from a family of cell equivalences
that preserves the operations. Check a nontrivial middle-four grid, rather than
only functor identities.

**M1.2 — Free boundaries and representation.** Specialize the strict definition
to the two free path categories on specified generating quivers. An implicit
double functor must take generators to generators; extend its two quiver maps
to paths. Define horizontal and vertical globular categories of paths and their
isomorphisms. Representability is the proposition that every path is isomorphic
to a singleton in its respective globular category. A representation is chosen
binary and nullary composites with specified comparison isomorphisms
`[f,g] ≅ [f ⋆ g]` and `[] ≅ [1]`. These are data, not merely existence proofs.

Build recursive representations of arbitrary paths from these choices. Derive
the underlying horizontal and vertical bicategories on generators: their
2-cells are globular cells, whiskering is path pasting followed by representation,
and unitors and associators compare the corresponding composites. Prove their
naturality, triangle, and pentagon laws. Do not add these as independent axioms
to the represented implicit structure. Extend the transport and rewriting API
to globular isomorphisms and their action on each of the four boundaries.

Define represented strict double functors by preservation of chosen composites
and their binary/nullary comparison isomorphisms. Give their identity,
composition, inverse, and extensionality API. Prove that they preserve the
derived comparisons for arbitrary paths and the induced bicategory coherence.

**Completion checks.** Empty, singleton, binary, and length-three paths must all
have usable representations. Compare the two representations of three factors.
Check an empty path adjacent to a singleton identity generator without identifying
the two. Verify both horizontal and vertical forms of each construction.

*Inputs:* Mathlib quivers, paths, categories, isomorphisms, and bicategories.
*Reference:* Fairbanks–Shulman, Definitions 3.1–3.3 and Remark 3.5; Section 2
for the one-directional construction.

## M2: the strict comparison as the first structural test

**M2.1 — Expand an ordinary strict double category.** For a strict double
category `D`, take all of its edge arrows as generators. A cell with four path
boundaries is a `D`-square with the four evaluated composite boundaries. Construct
both pastings, inserting only the equality transports from evaluation of path
concatenation. Choose binary and nullary representations using the original
composition and identities. Prove both underlying bicategories strict, in the
sense of Mathlib's `Bicategory.Strict` including the coherence-isomorphism fields.
Extend this expansion to strict double functors.

**M2.2 — Extract squares.** From a represented implicit double category whose
two induced bicategories are strict, construct an ordinary strict double
category on its generators and singleton-boundary squares. Obtain square
composition by path pasting and changing the newly formed boundaries with the
chosen representation isomorphisms. Obtain identities using the nullary
comparisons. Prove the full strict axioms, including interchange. Extend this
construction to represented strict functors and isomorphisms.

**M2.3 — Compare in both directions.** Construct double isomorphisms from
extraction after expansion to `D`, and from expansion after extraction to the
original strict represented implicit structure. The second acts on arbitrary
path cells by the derived representation isomorphisms. Prove preservation of
chosen representations, naturality in strict functors, and compatibility with
functor composition. These comparisons must identify square operations, not
just establish bijections of their carriers.

**Completion checks.** Evaluate both comparisons on objects, generators,
empty-boundary cells, squares, and horizontally and vertically pasted pairs.
Use a concrete strict double category with nontrivial cells, for example the
quintet double category of a strict 2-category; construct that test example as
part of this milestone. It must exercise interchange.

*Inputs:* M1. *Reference:* Fairbanks–Shulman, Definition 3.12 and Corollary 3.14,
using the construction in the proof of Proposition 3.13.

## M3: mates for an arbitrary bicategory

**M3.1 — Coherent evaluation of paths.** Construct a represented implicit
2-category from `K`. Its objects and generators are those of `K`, its 1-arrows
are paths, and its 2-cells from `p` to `q` are actual `K` 2-cells
`eval p ⟶ eval q`. Choose `eval [] = 𝟙`, `eval [f] = f`, and left-associated
evaluation for longer nonempty paths. Build the canonical isomorphisms
`eval (p ++ q) ≅ eval p ≫ eval q`, with their empty and singleton cases and
associativity compatibility. Define 2-cell composition and whiskering using
them, and prove the strict 2-category laws on paths. Choose binary/nullary
representations and compare the recovered bicategory with `K`.

Mathlib's free-bicategory coherence and normalization provide the rebracketing
tools. They do not already provide this path construction with arbitrary
2-cells of `K`; constructing it is a target here. Prove that changing the
bracketing gives the canonical comparison of cell operations. Prove the
correspondence between specified adjunctions in `K` and adjunctions between
singleton paths in this implicit 2-category, with the unit/counit and composite
comparison formulas. No quotient of the genuine 2-cells of `K` is allowed.

**M3.2 — The two represented implicit double categories.** Define `L(K)` and
`R(K)` on the same objects, horizontal generating arrows of `K`, and vertical
generators `Bicategory.Adj.Hom`. Evaluate a nonempty vertical path by recursively
composing these adjunctions, with the singleton case unchanged and the empty
case `Adjunction.id`. Its left adjoint composes in path order; its right adjoint
composes in reverse order with the bracketing supplied by `Adjunction.comp`.

For any path boundary, let `S,T` denote its evaluated horizontal paths and
`F₁ ⊣ G₁`, `F₂ ⊣ G₂` the evaluated vertical adjunction paths. Define the cells
by the displayed `L` and `R` formulas above. Specify each pasting directly by
whiskering, composition, and the path comparison isomorphisms in `K`; prove the
strict implicit double axioms for both constructions. The right-hand pasting
must be identified with the usual right-adjoint pasting formula, even if
transport across the mate equivalence is used to organize the proof.

Choose horizontal composites and units from `K`, and vertical composites and
units from `Adjunction.comp` and `Adjunction.id`. Supply the binary/nullary
globular representation isomorphisms, including the coherently reversed
right-adjoint comparisons. Identify the horizontal globular bicategory with
`K`. With our left-to-right convention for vertical globular cells, a cell from
`F` to `F'` corresponds to `Bicategory.Adj.Hom₂ F' F`: its left component is
`F'.l ⟶ F.l`, and its right component is `F.r ⟶ F'.r`. Record and prove this
reversal explicitly when comparing vertical composition and coherence with
Mathlib's `Bicategory.Adj`. If a packaged local-opposite construction is needed
for that comparison, build its bicategory instance here.

**M3.3 — The represented double isomorphism.** On every path boundary, apply
`Bicategory.mateEquiv` to the two evaluated adjunctions. Assemble a represented
strict double functor `mates : L(K) → R(K)` with identity object and generator
maps. Prove preservation of both pastings, both identity cells, and all four
chosen binary/nullary representation families. Build its inverse using the
inverse equivalences and prove both functor composites equal identities.
Export the cell formula on singleton and arbitrary path boundaries, the two
inverse formulas, and preservation of derived path representations and
underlying coherence. The headline result is a represented double
**isomorphism**, not just a collection of local equivalences.

Supply named compatibility lemmas for changing horizontal boundary 2-cells
and for changing adjunctions by conjugate 2-cells, including their invertible
and coherence cases. Use existing mate-pasting and conjugation theorems wherever
they apply. Additional unit/counit characterizations belong in the general
bicategory API when needed for these boundary operations; do not duplicate
the ordinary-category theory wholesale.

**Completion checks.** State the construction with only `[Bicategory K]`.
Verify empty boundaries, both identity cells, binary and triple pasting, a
middle-four grid, a nontrivial change of bracketing, and both inverse laws.
Singleton-boundary action must reduce to the existing mate equivalence after
the stated boundary identifications. Tests must not silently add strictness.

*Inputs:* M1, its M2 strict comparison test, Mathlib bicategory coherence,
adjunctions, `Adj`, and mates. *References:* Fairbanks–Shulman, Proposition 2.5
and its comparisons, and Example 3.10.

## M4: strict specialization and the Kelly–Street isomorphism

Assume `[Bicategory.Strict K]`. Prove that the represented structures `L(K)`
and `R(K)` are strict in both directions. In the vertical direction this
includes equality of the full composite adjunction structures under identity
and reassociation, and identification of their coherence isomorphisms with
`eqToIso`. Proof irrelevance applies to proofs of the triangle identities;
it does not identify distinct units or counits.

Apply M2's extraction to M3's double isomorphism. Identify the resulting strict
double categories with the usual left- and right-adjoint square constructions:
same objects and arrows, specified composite adjunctions, the `L` and `R`
square types above, and the usual pasted 2-cells. Export the strict double
isomorphism and the theorem that its square map is `Bicategory.mateEquiv`.
Prove compatibility of expansion/extraction with this isomorphism, so the
strict theorem is visibly a specialization of M3.

For a fixed `Cat.{v,u}`, compare the square map with ordinary
`CategoryTheory.mateEquiv` via Mathlib's `Bicategory.toNatTrans_mateEquiv`.
This is a consistency test. Preserve the existing ordinary-category API with
independent universe levels for its four categories; do not replace it by the
fixed-universe global construction or claim that it has the same generality.

**Completion checks.** Both double inverse laws, both pasting directions,
identity cells, strict adjunction associativity, and the fixed-`Cat` comparison.

*Inputs:* M2 and M3. *References:* Kelly–Street, Proposition 2.2;
Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2.

## Existing library inputs

- `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` supplies the general
  bicategory mate equivalence, both pasting theorems, the square interchange
  theorem, conjugate equivalences and computable isomorphisms, mixed pasting,
  and coherence comparisons. Its pasting names follow its displayed axes;
  match their types to this roadmap's convention rather than their names alone.
- `Mathlib/CategoryTheory/Bicategory/Adjunction/Adj.lean` supplies specified
  adjunction arrows, conjugate pairs of 2-cells, and their bicategory structure.
- `Mathlib/CategoryTheory/Bicategory/Coherence.lean`,
  `Mathlib/CategoryTheory/PathCategory/Basic.lean`, and
  `Mathlib/CategoryTheory/Bicategory/Strict/Basic.lean` supply the coherence,
  free path, and strictness vocabulary.
- `Mathlib/CategoryTheory/Bicategory/Adjunction/Cat.lean` supplies the comparison
  with ordinary adjunctions and mates.
- `TauCeti/CategoryTheory/Adjunction/Mates.lean` adds ordinary-category identity
  mates, transpose/conjugate naturality, and transfer of identity/composition
  comparisons across mates. Reuse those declarations for ordinary-category
  comparisons; add general bicategory counterparts only for the operations
  required by M3. Their existing proofs do not package a double category.

All missing infrastructure specified above is Tau Ceti work. Adopt any matching
Mathlib interface that exists at implementation time and remove duplication
when Mathlib absorbs it. No target requires opening a Mathlib PR.

## References

1. Aaron David Fairbanks and Michael Shulman, *Doubly Weak Double Categories*,
   Applied Categorical Structures **34**, article 26 (2026),
   [published article](https://doi.org/10.1007/s10485-026-09863-1),
   [arXiv:2506.23651v2](https://arxiv.org/abs/2506.23651v2).
   Use the published numbering: Definitions 2.1 and 2.3; Propositions 2.5 and
   2.7 and comparisons 2.9–2.10; Definitions 3.1–3.3; Remark 3.5;
   Example 3.10 (p. 14); Definition 3.12–Corollary 3.14 (pp. 15–16).
2. G. M. Kelly and Ross Street, *Review of the elements of 2-categories*,
   Category Seminar, Lecture Notes in Mathematics **420** (1974), pp. 75–103,
   [DOI](https://doi.org/10.1007/BFb0063101), Proposition 2.2, pp. 86–87.
3. Eugenia Cheng, Nick Gurski, and Emily Riehl, *Cyclic multicategories,
   multivariable adjunctions and mates*, Journal of K-Theory **13** (2014),
   pp. 337–396, [arXiv:1208.4520](https://arxiv.org/abs/1208.4520),
   Definition 1.1 and Theorem 1.2, p. 346.
