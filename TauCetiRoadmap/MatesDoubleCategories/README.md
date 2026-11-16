# Roadmap: mates as a double isomorphism

**Summary.** Construct the mates isomorphism of doubly weak double categories
for an arbitrary Mathlib bicategory. Use the represented implicit presentation of
Fairbanks–Shulman: cells have paths on all four boundaries, and binary and nullary
path composites are chosen by invertible globular cells. Recover the ordinary
strict double isomorphism when the bicategory is strict.

## Scope and ownership

The implementation belongs in `TauCeti/CategoryTheory/DoubleCategory/`, with
reusable bicategory path and
adjunction lemmas in the corresponding `TauCeti/CategoryTheory/Bicategory/`
modules. Names in `Suggested.lean` illustrate interfaces, not mandated spellings.

This roadmap includes the basic theory needed to use strict double categories,
represented implicit double categories, their strict comparison, and the mates
isomorphisms. The Schanuel–Street walking adjunction and its simplex hom-categories
test the implicit 2-category interface. This does not include the
double-computad monad construction, the
comparison with Verity or Garner presentations, general strictification
equivalences for all bicategories, or the other examples of doubly weak double
categories. No general equipment construction is a prerequisite.

## How to read the build

The pilot's development order is M1 → M2 → M3 → M4. M2 tests the foundations on
ordinary strict double categories before the general mates construction. M3
proves the general mates theorem; M4 specializes it. The mathematical
dependencies are smaller than this chosen execution order:

| Target | Local prerequisites |
| --- | --- |
| M1.1: strict double categories and maps | none |
| M1.2: implicit double categories and representations | M1.1 |
| M1.3: implicit 2-categories and adjunctions | M1.1 and the horizontal constructions of M1.2 |
| M1.4: walking adjunction and its four hom-categories | M1.3; Mathlib simplex categories |
| M2.1: expansion | M1.1–M1.2 |
| M2.2: extraction | M1.1–M1.2 |
| M2.3: comparison | M2.1–M2.2 |
| M3.1: path evaluation | M1.3 |
| M3.2: the two adjunction double categories | M1.1–M1.2, M3.1 |
| M3.3: mates isomorphism | M3.2 |
| M4: strict specialization | M2 and M3 |

Each target lists its library inputs below. M3 has no mathematical dependency on
M2 or the M1.4 example. M1.4 tests the one-directional interface; M2 is the
first double-category comparison test. `Suggested.lean` prototypes selected
foundational interfaces and checks the
mate orientation against Mathlib. Its admitted theorem is an M1.2 target; it
does not implement the headline isomorphisms.

## Conventions

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

## M1: strict and represented implicit double categories

### M1.1 — Strict cells and maps

Define a boundary-indexed strict double category (`StrictDoubleCategory` in the
prototype) over a horizontal and a vertical category sharing objects. The
prototype's `Edge`, `edgeId`, and `edgeComp` expose the explicitly supplied edge
categories. Give both cell identities and pasting operations; prove or require
both associativity and
unit laws, middle-four interchange, preservation of composition by both
identity-cell assignments, and equality of the two identity cells on an object.

Define strict double functors: a common object map, functorial edge maps in each
direction, and a cell map preserving boundaries, both identities, and both
pastings. Define identity and composite functors, extensionality, and double
isomorphisms as functors with strict two-sided inverses. Their inverse laws are
equalities of functors, not equivalences of categories of cells. Include an
identity-on-objects-and-edges constructor from a family of cell equivalences
that preserves the operations. Check a nontrivial middle-four grid, rather than
only functor identities.

**API.**

- For cells: boundary transport, its identity and composition laws, cancellation
  of transport, and congruence and rewriting for both pastings and identities.
- For strict double functors: identity, composition, action on each boundary and
  on cells, preservation lemmas, extensionality, and category laws.
- For double isomorphisms: identity, inverse, composition, evaluation of both
  inverse laws, and the constructor from boundary-preserving cell equivalences.

**Checks.** On a grid of four cells, both orders of pasting have boundary
`(p ≫ q, x ≫ y, l ≫ l', n ≫ n')` and equal cell values by interchange.
The two identity assignments at an object both give a cell with four identity
boundaries and agree. A double isomorphism followed by its inverse fixes every
cell after the stated boundary transports, including a cell with nonidentity
boundary arrows.

*Needs:* Mathlib `Category`, `Functor`, `Iso`, and equality transport.

### M1.2 — Free boundaries and representation

Specialize the strict definition to the two free path categories on specified
generating quivers (`ImplicitDoubleCategory`, using `pathCategory` and
`singleton` in the prototype). An implicit double functor must take generators
to generators; extend its two quiver maps
to paths. Define horizontal and vertical globular categories of paths and their
isomorphisms (`HorizontalIso` and `VerticalIso`). Representability
(`Representable`) is the proposition that every path is isomorphic to a
singleton in its respective globular category. A representation
(`Representation`) is chosen binary and nullary composites with comparison isomorphisms
`[f,g] ≅ [f ⋆ g]` and `[] ≅ [1]`. These are data, not merely existence proofs.

Build recursive representations of arbitrary paths from these choices. Prove
`representable_of_representation`: a `Representation` supplies `Representable`.
These four names and the theorem are in the prototype's
`ImplicitDoubleCategory` namespace. Derive the underlying horizontal and
vertical bicategories on generators: their
2-cells are globular cells, whiskering is path pasting followed by representation,
and unitors and associators compare the corresponding composites. Prove their
naturality, triangle, and pentagon laws. Do not add these as independent axioms
to the represented implicit structure. Extend the transport and rewriting API
to globular isomorphisms and their action on each of the four boundaries.

Define represented strict double functors by preservation of chosen composites
and their binary/nullary comparison isomorphisms. Give their identity,
composition, inverse, and extensionality API. Prove that they preserve the
derived comparisons for arbitrary paths and the induced bicategory coherence.

**API.**

- For free boundaries and globular isomorphisms: empty, singleton, concatenation,
  identity, inverse, composition, and changing each of the four cell boundaries.
- For representations: recursive path comparisons and their empty, singleton,
  binary, and concatenation formulas; `representable_of_representation`.
- For the two induced bicategories: composition, whiskering, associators,
  unitors, and their naturality and coherence theorems.
- For represented strict functors: preservation of the chosen and derived
  comparisons, identity, composition, inverses, and extensionality.

**Checks.** The recursive comparison for a singleton is its identity; for an
empty path it is the chosen nullary comparison. The two binary reductions of
`[f,g,h]` yield singleton composites `(f ⋆ g) ⋆ h` and `f ⋆ (g ⋆ h)` whose
comparison is the induced associator. On one object with empty generating
quivers, the empty path exists but no singleton does: `Representable` is false
and there is no `Representation`. In any represented example, `[]` and `[1]`
remain distinct paths, related by the nullary comparison. Verify both directions.

*Needs:* M1.1; Mathlib quivers, `Quiver.Path`/`CategoryTheory.Paths`, and
`Bicategory`. *Reference:* Fairbanks–Shulman, Definitions 3.1–3.3 and Remark 3.5.

### M1.3 — Implicit 2-categories and adjunctions

Define an implicit 2-category as a strict 2-category whose underlying
1-category is the free path category on a specified generating quiver. Give
its generator-preserving strict functors. It can also be presented by an
implicit double category with empty vertical generating quiver, so its cells
have boundary `(p, q, [], [])`; construct this identification using M1.1–M1.2.
Reuse Mathlib's `Bicategory` with `Bicategory.Strict` for its strict 2-category
structure.

Define representability and a chosen representation in this one direction:
every path is isomorphic to a singleton, with chosen binary and nullary
comparisons. Use only the horizontal part of M1.2, and construct the underlying
bicategory on generators and representation-preserving functors. Do not require
a full double-category `Representation` on the empty-vertical-quiver
presentation: on a nonempty object type that would require a nonexistent
vertical identity generator.

An adjunction between generators `f : a → b` and `g : b → a` is an adjunction
between `[f]` and `[g]` in the strict path 2-category. Its unit and counit have
types `[] ⟶ [f,g]` and `[g,f] ⟶ []`, with the two triangle identities under
path pasting. Use Mathlib's bicategorical adjunction structure, and supply the
identity and composition constructions for adjunctions between paths. For
adjunctions between singleton paths, construct a correspondence with specified
adjunctions between the same generators in the underlying bicategory, using
the representation comparisons. Prove the inverse transfer, including formulas
for units, counits, and triangle identities.

**API.**

- Path hom-categories, strict composition and whiskering, and their identification
  with the cells with empty vertical boundaries in the double presentation.
- One-directional path representations and their induced bicategory coherence,
  with the corresponding functor and extensionality API from M1.2.
- Adjunction transfer in both directions between singleton paths and generators,
  inverse laws on the full specified adjunction data, and compatibility with
  identity and composite adjunctions under the chosen path comparisons.

**Checks.** For a represented example, the underlying bicategory's unit at `a`
is the chosen generator `1ₐ`, while the strict path identity is `[]`.
The two triangle composites on `[f]` and `[g]` are their identity 2-cells.
Transferring an adjunction to generators and back recovers its unit and counit,
not merely its left and right adjoints.

*Needs:* M1.1 and the horizontal constructions of M1.2; Mathlib
`Bicategory.Strict` and `Bicategory.Adjunction`, including identity and composite
adjunctions. *References:* Fairbanks–Shulman, Definitions 2.1 and 2.3 and
Proposition 2.7.

### M1.4 — The Schanuel–Street walking adjunction

Construct an implicit 2-category `WalkingAdjunction` with objects `+,-` and
generating quiver consisting of `f : + → -` and `g : - → +`. Its path
2-category is the free strict 2-category containing an adjunction `f ⊣ g`:
the generating 2-cells are `η : []₊ ⟶ [f,g]` and
`ε : [g,f] ⟶ []₋`, with the two triangle identities. All 2-cells are generated
by these under identities and both pastings, subject only to the strict
2-category laws and the triangles. Keep the underlying 1-category free on
`f,g`. This target does not require a general library of computad presentations.

Prove the universal property: for every strict 2-category `K` and fully
specified adjunction `F ⊣ G` in it, there is a unique strict 2-functor from the
path 2-category of `WalkingAdjunction` taking `+,-,f,g,η,ε` to the specified
objects, arrows, unit, and counit. Use Mathlib's `StrictPseudofunctor` for strict
2-functors. Export evaluation on the generators, an extension operation,
extensionality from those images, and the resulting correspondence with
specified adjunctions. For an implicit target, the corresponding functor
preserves generators when `F,G` are singleton paths.

**Simplex categories and conventions.** Use `Δ₊ = AugmentedSimplexCategory`,
including `[-1] = ∅`, and `Δ = SimplexCategory`, with
`[n] = {0,…,n}` for `n ≥ 0`. Define `Δ_top` and `Δ_bot` as wide subcategories
of `Δ` whose maps preserve the greatest and least elements, respectively.
Define `Δ_∂` on the same nonempty ordinals with maps preserving both endpoints;
include `[0]`, whose endpoints coincide. These are restrictions on morphisms,
not full subcategories of `Δ`. Supply identity/composition, faithful inclusion,
map extensionality, endpoint formulas, and the required restrictions of faces
and degeneracies, using Mathlib's simplex morphisms and wide-subcategory API.

Prove the finite-ordinal duality `Δ₊ᵒᵖ ≅ Δ_∂`. Pin its object convention by
sending the ordinal with `n` elements to `[n]`, its chain of `n+1` cuts. For a
monotone map `α : Fin n →o Fin m`, the contravariant map on cuts sends
`j ∈ {0,…,m}` to `#{i < n | α(i) < j}`. Prove the inverse, functoriality, and
endpoint laws. In particular, the empty ordinal maps to `[0]`. Also provide
`Δ_topᵒᵖ ≅ Δ_bot` via left/right adjoints of the endpoint-preserving order maps.

**Hom-category theorem.** For the four hom-categories of the path 2-category,
construct isomorphisms of categories with explicit inverse functors as follows.
Paths below are written in diagrammatic order;
`n` ranges over the natural numbers, so zero repetitions mean an empty path.

| Hom-category | Simplex model | Image of the indicated path |
| --- | --- | --- |
| `WalkingAdjunction(+,+)` | `Δ₊` | `(fg)^n ↦ [n-1]`, with `n=0` giving `∅` |
| `WalkingAdjunction(-,-)` | `Δ₊ᵒᵖ` | `(gf)^n ↦ [n-1]ᵒᵖ`, or `[n]` in `Δ_∂` |
| `WalkingAdjunction(-,+)` | `Δ_top` | `(gf)^n g ↦ [n]` |
| `WalkingAdjunction(+,-)` | `Δ_bot` | `(fg)^n f ↦ [n]` |

Identify vertical composition with composition in these categories. Give the
formulas for all eight horizontal composition functors using ordinal sum and
the two dualities above, with factor order matched to diagrammatic pasting.
Prove compatibility with the hom-category isomorphisms. Include the action of
whiskered units and counits on finite ordinals, and a generation/normal-form
result that shows the hom descriptions have exactly the stipulated relations.
The construction and universal property must describe the same 2-category.

**Checks.** The empty endopaths correspond to `∅` in the two augmented
hom-categories, and the empty endopath at `-` corresponds to `[0]` in the
interval model. The unit is `∅ → [0]` in `Δ₊`; the counit is that arrow in
`Δ₊ᵒᵖ`. The cell `g ◁ η` is the top-preserving map `[0] → [1]` taking `0` to
`1`, while `η ▷ f` is the bottom-preserving map taking `0` to `0`. Their
composites with the respective counit whiskerings give the two identity maps
on `[0]`. The two unit insertions `(fg) → (fg)^2` give the two distinct maps
`[0] → [1]` in `Δ₊`. The universal extension into `K` recovers the full unit
and counit of its chosen adjunction.

With this generating quiver `WalkingAdjunction` is not representable: there
is no generator from `+` to itself, or from `-` to itself, to represent even
the empty paths. Verify this explicitly. The example tests M1.3 before any
representation is chosen; it must not impose a representation as a hypothesis.

*Needs:* M1.3; Mathlib `SimplexCategory`, `AugmentedSimplexCategory`, ordinal
sum, category opposites, wide subcategories, `StrictPseudofunctor`, and
bicategorical adjunctions. The endpoint subcategories, finite-ordinal dualities,
walking adjunction, and hom-category comparisons are targets here.
*References:* Schanuel–Street, pp. 81–83; Riehl–Verity, Proposition 3.3.4,
Observation 3.3.6, and Remark 3.3.8. The latter fixes the `+,-` and top/bottom
conventions used in this table.

## M2: the strict comparison as the first structural test

### M2.1 — Expand an ordinary strict double category

For a strict double category `D`, take all of its edge arrows as generators.
A cell with four path
boundaries is a `D`-square with the four evaluated composite boundaries. Construct
both pastings, inserting only the equality transports from evaluation of path
concatenation. Choose binary and nullary representations using the original
composition and identities. Prove both underlying bicategories strict, in the
sense of Mathlib's `Bicategory.Strict` including the coherence-isomorphism fields.
Extend this expansion to strict double functors. Export evaluation on empty,
singleton, and concatenated paths and the resulting cell and pasting formulas.

*Needs:* M1.1–M1.2; Mathlib paths and `Bicategory.Strict`.

### M2.2 — Extract squares

From a represented implicit double category whose two induced bicategories are
strict, construct an ordinary strict double
category on its generators and singleton-boundary squares. Obtain square
composition by path pasting and changing the newly formed boundaries with the
chosen representation isomorphisms. Obtain identities using the nullary
comparisons. Prove the full strict axioms, including interchange. Extend this
construction to represented strict functors and isomorphisms. Export formulas
for the extracted cells, identities, both pastings, and maps on squares.

*Needs:* M1.1–M1.2; strictness of both induced bicategories as hypotheses.

### M2.3 — Compare in both directions

Construct double isomorphisms from extraction after expansion to `D`, and from
expansion after extraction to the
original strict represented implicit structure. The second acts on arbitrary
path cells by the derived representation isomorphisms. Prove preservation of
chosen representations, naturality in strict functors, and compatibility with
functor composition. These comparisons must identify square operations, not
just establish bijections of their carriers.

**Checks and examples for M2.** Evaluate both comparisons on objects, generators,
empty-boundary cells, squares, and horizontally and vertically pasted pairs.
Use a concrete strict double category with nontrivial cells, for example the
quintet double category of a strict 2-category; construct that test example as
part of this milestone. It must exercise interchange. Expansion evaluates `[]`
to an identity arrow and `[f,g]` to `f ≫ g`. Extraction after expansion recovers
each original square and both of its original pasting operations. In the other
direction, a cell with a length-three boundary is recovered after conjugation
by the derived representation comparisons, with the inverse conjugations
cancelling.

*Needs:* M2.1–M2.2. The quintet test uses Mathlib's strict bicategories.
*Reference:* Fairbanks–Shulman, Definition 3.12 and Corollary 3.14,
using the construction in the proof of Proposition 3.13.

## M3: mates for an arbitrary bicategory

### M3.1 — Coherent evaluation of paths

Construct a represented implicit 2-category from `K`. Its objects and generators
are those of `K`, its 1-arrows
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

**API and checks.** Export evaluation and concatenation-comparison formulas,
their naturality, and the comparison with `K` on objects, 1-cells, 2-cells,
coherence, and adjunctions. Evaluation of `[]`, `[f]`, `[f,g]`, and `[f,g,h]`
is respectively `𝟙`, `f`, `f ≫ g`, and `(f ≫ g) ≫ h`. The comparison
`eval ([f] ++ [g,h]) ≅ eval [f] ≫ eval [g,h]` is the associator
`(f ≫ g) ≫ h ≅ f ≫ (g ≫ h)`; empty-factor cases are inverse unitors.
For singleton paths the recovered 2-cell type is exactly `f ⟶ g` in `K`.

*Needs:* M1.3; Mathlib `Bicategory/Coherence.lean` and bicategorical adjunctions.
*Reference:* Fairbanks–Shulman, Proposition 2.5 and comparisons 2.7, 2.9–2.10.

### M3.2 — The two represented implicit double categories

Define `L(K)` and `R(K)` on the same objects, horizontal generating arrows of
`K`, and vertical
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

**API and checks.** Export the `L(K)` and `R(K)` cell types, identity and
pasting formulas, all four binary/nullary representation families, and the
horizontal and vertical globular identifications. For a vertical globular cell
from `F` to `F'`, compute the left component as `τ : F'.l ⟶ F.l` and the right
component as `Bicategory.conjugateEquiv F.adj F'.adj τ : F.r ⟶ F'.r`, after
the unitor identifications of the globular cell types.
For `F = F'` and `τ = 𝟙`, the latter is `𝟙` by `conjugateEquiv_id`.
For the horizontal identity square on `F`, the `L` formula is
`(λ_ F.l).hom ≫ (ρ_ F.l).inv` and the `R` formula is
`(ρ_ F.r).hom ≫ (λ_ F.r).inv`; these include the necessary unitors even when
the boundary paths are empty. Evaluate a binary vertical composite to verify
that its right adjoint is `G₂ ≫ G₁`, in that order.

*Needs:* M1.1–M1.2, M3.1; Mathlib `Bicategory.Adj.Hom`,
`Bicategory.Adj.Hom₂`, and `Adjunction.comp`/`Adjunction.id` in the bicategory
namespace. *Reference:* Fairbanks–Shulman, Example 3.10.

### M3.3 — The represented double isomorphism

On every path boundary, apply `Bicategory.mateEquiv` to the two evaluated
adjunctions. Assemble a represented
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

**Checks.** State the construction with only `[Bicategory K]`.
Verify empty boundaries, both identity cells, binary and triple pasting, a
middle-four grid, a nontrivial change of bracketing, and both inverse laws.
Singleton-boundary action must reduce to the existing mate equivalence after
the stated boundary identifications. In particular, compute the mate of M3.2's
horizontal identity square using
`Bicategory.mateEquiv_leftUnitor_hom_rightUnitor_inv`: it is the displayed
`R` identity square. Tests must not silently add strictness.

*Needs:* M3.2; Mathlib `Bicategory.mateEquiv`, `mateEquiv_vcomp`,
`mateEquiv_hcomp`, `mateEquiv_square`, and `conjugateEquiv`.
*Reference:* Fairbanks–Shulman, Example 3.10. Its brief construction specifies
the mathematical example; proving its pasting, representation, and preservation
laws is part of M3.2–M3.3.

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

**API and checks.** Export strictness of both induced bicategories, the strict
double isomorphism and its square formula, and compatibility with the M2
comparisons. Check both double inverse laws, both pasting directions, and
identity cells. For three specified adjunctions, compare the units and counits
of the two parenthesized composites, as well as their left and right adjoints.
In fixed `Cat`, the square map is the ordinary mate under
`Bicategory.toNatTrans_mateEquiv`.

*Needs:* M2 and M3; Mathlib `Bicategory.Strict` and
`Bicategory/Adjunction/Cat.lean`. *References:* Kelly–Street, Proposition 2.2;
Cheng–Gurski–Riehl, Definition 1.1 and Theorem 1.2.

## Exact supplier contracts

### From Mathlib

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
- `Mathlib/AlgebraicTopology/SimplexCategory/Defs.lean`, `Basic.lean`, and
  `GeneratorsRelations/` supply simplex morphisms, faces, degeneracies, and
  their relations. `Augmented/Basic.lean` supplies `AugmentedSimplexCategory`
  as `WithInitial SimplexCategory`; `Augmented/Monoidal.lean` supplies ordinal
  sum. M1.4 builds its endpoint subcategories and comparisons using these APIs.
- `Mathlib/CategoryTheory/Widesubcategory.lean` supplies wide subcategories;
  `Bicategory/Functor/StrictPseudofunctor.lean` supplies the strict functors
  used in M1.4's universal property.

### From Tau Ceti

- `TauCeti/CategoryTheory/Adjunction/Mates.lean` adds ordinary-category identity
  mates, transpose/conjugate naturality, and transfer of identity/composition
  comparisons across mates. Reuse those declarations for ordinary-category
  comparisons; add general bicategory counterparts only for the operations
  required by M3. Their existing proofs do not package a double category.

All missing infrastructure specified above is Tau Ceti work. Adopt any matching
Mathlib interface that exists at implementation time and remove duplication
when Mathlib absorbs it. No target requires opening a Mathlib PR.

## Related formalizations

For related Lean work on strict double categories, see the Geb project's
[`GebLean/Utilities/DoubleCategory.lean`](https://github.com/anoma/geb/blob/main/geb-lean/GebLean/Utilities/DoubleCategory.lean).
Compare its internal-category-in-`Cat` presentation and universe conventions
when designing M1's boundary-indexed interface. The represented implicit
structures and the arbitrary-bicategory mates theorem are specified here as
well as the strict case.

This roadmap specifies an independent development from the mathematical
sources below. Geb's repository advertises GPL-3.0; any proposed reuse of its
code must follow the project's [porting guidance](../../README.md#porting-existing-work),
including author coordination and checking the applicable licence. Cite related
formalizations even when developing the mathematics independently.

## Downstream consumers

M1 supplies reusable strict and represented implicit double-category interfaces.
Its walking adjunction supplies a universal source for specified adjunctions
in strict 2-categories, with a calculable simplex model of all four hom-categories.
M2 lets constructions on either strict presentation use the other presentation's
API. M3 packages the existing local mates correspondence as a global double
isomorphism for bicategories; M4 makes that result usable through the ordinary
strict-double-category interface. These interfaces support further work with
strict double categories without requiring consumers to work directly with
path representations or heterogeneous equality.

## References

1. Aaron David Fairbanks and Michael Shulman, *Doubly Weak Double Categories*,
   Applied Categorical Structures **34**, article 26 (2026),
   [published article](https://doi.org/10.1007/s10485-026-09863-1),
   [arXiv:2506.23651v2](https://arxiv.org/abs/2506.23651v2).
   Locate results by item number, since the published and arXiv pagination
   differ: Definitions 2.1 and 2.3; Propositions 2.5 and
   2.7 and comparisons 2.9–2.10; Definitions 3.1–3.3; Remark 3.5;
   Example 3.10; Definition 3.12–Corollary 3.14.
2. G. M. Kelly and Ross Street, *Review of the elements of 2-categories*,
   Category Seminar, Lecture Notes in Mathematics **420** (1974), pp. 75–103,
   [DOI](https://doi.org/10.1007/BFb0063101), Proposition 2.2: statement on
   printed p. 86, proof on p. 87. The diagrams (2.4)–(2.5) on p. 86 display
   the right adjoints `u,u'` from the upper to the lower objects.
3. Eugenia Cheng, Nick Gurski, and Emily Riehl, *Cyclic multicategories,
   multivariable adjunctions and mates*, Journal of K-Theory **13** (2014),
   pp. 337–396, [arXiv:1208.4520](https://arxiv.org/abs/1208.4520),
   Definition 1.1 and Theorem 1.2, p. 346.
4. Stephen Schanuel and Ross Street, *The free adjunction*, Cahiers de Topologie
   et Géométrie Différentielle Catégoriques **27** (1986), no. 1, pp. 81–83,
   [article and scan](https://numdam.org/item/CTGDC_1986__27_1_81_0/).
5. Emily Riehl and Dominic Verity, *Homotopy coherent adjunctions and the formal
   theory of monads*, Advances in Mathematics **286** (2016), pp. 802–888,
   [published PDF](https://math.jhu.edu/~eriehl/adjunctions.pdf),
   Proposition 3.3.4 (pp. 827–828), Observation 3.3.6 (pp. 829–830), and
   Remark 3.3.8 (pp. 830–831). Only the strict 2-category and its universal
   property are targets here; no homotopy-coherent enhancement is required.
