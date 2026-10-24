# Direct and inverse categories, and non-singular presheaves

Build the theory of **direct and inverse categories** on top of Mathlib's
`HomotopicalAlgebra.ReedyStructure`: the well-founded characterisation of direct categories and
their canonical degree, restriction and transport of Reedy structures, the standard examples
(posets with well-founded order, small diagram shapes, the simplex and semi-simplex categories,
the semi-cubical and globe categories), and **non-singular presheaves** on a direct category with
their face posets.

`README.md` is definitive. `Suggested.lean` checks selected signatures; it is not an exhaustive
checklist and its admitted constructions are targets. Suggested homes are
`TauCeti/AlgebraicTopology/Reedy/` (mirroring Mathlib's `Mathlib/AlgebraicTopology/Reedy/`) for
Layers 1–2, and `TauCeti/CategoryTheory/Presheaf/Nonsingular.lean` and
`TauCeti/CategoryTheory/DiscreteFibration.lean` for Layer 3.

## Scope boundary

Latching and matching objects, Reedy weak factorization systems and the Reedy model structure are
**out of scope here**: they are covered by Joël Riou's Mathlib project
([leanprover-community/project-intentions#5](https://github.com/leanprover-community/project-intentions/issues/5)),
announced in the TODO of Mathlib's
[`Mathlib/AlgebraicTopology/Reedy/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/AlgebraicTopology/Reedy/Basic.lean).
This roadmap supplies only direct and inverse categories, examples, and non-singular presheaves,
all stated on Mathlib's `ReedyStructure` so that they combine with that work as it lands. Weighted
(co)limits, boundaries of representables, the inductive construction of diagrams and skeletal
filtrations are not targets here either. [BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/pull/947)
and [GrothendieckInfinityGroupoids](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1060)
(for the globe category `𝔾`) are consumers of this roadmap, not owners of any of its targets.

## What exists

**Mathlib**:

- [`HomotopicalAlgebra.ReedyStructure W₁ W₂ α`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/AlgebraicTopology/Reedy/Basic.lean):
  a degree `deg : C → α` into a type with `[LinearOrder α] [OrderBot α] [SuccOrder α] [WellFoundedLT α]`,
  the axioms `lt₁` (non-identity morphisms of `W₁` lower the degree), `lt₂` (those of `W₂` raise it),
  `nonempty_unique` (every morphism has a unique factorization as a `W₁`-morphism followed by a
  `W₂`-morphism, as `MorphismProperty.MapFactorizationData`); the opposite structure
  `ReedyStructure.op`; the degree of a morphism `degHom` with `degHom_le`, `degHom_comp_le_left`,
  `degHom_comp_le_right`, `exists_fac`, `prop₁_of_degHom_eq_deg_right`, `prop₂_of_degHom_eq_deg_left`;
  `deg_eq_of_iso`, `prop₁_of_iso`, `prop₂_of_iso` and `skeletal`.
- [`SimplexCategory.reedyStructure`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean)
  (mathlib4#44778): `ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ` with degree
  `len`. It is on Mathlib `master` but not in the Mathlib that TauCetiRoadmap currently pins; see 2.3.
- `SemiSimplexCategory` (objects `⦋n⦌ₛ`, morphisms order embeddings, the faithful functor
  `toSimplexCategory`, `Mono` instances, `homOfMono`); its docstring leaves semi-simplicial objects
  as a TODO. `AugmentedSimplexCategory := WithInitial SimplexCategory`, `SimplexCategory.Truncated`.
- `SSet.Nonsingular`, the poset `SSet.N` of non-degenerate simplices, `SSet.Nonsingular.δ_injective`,
  `SSet.nonDegenerate_δ` and the colimit description over `X.N` (`NonsingularColimit.lean`).
- `WideSubcategory`, `ObjectProperty.FullSubcategory`, `MorphismProperty.identities`,
  `MorphismProperty.map`, `MorphismProperty.prod`, `Functor.Elements` with `Functor.Elements.π`,
  `Subfunctor`, `yonedaEquiv`, `Quiver.IsThin`, `Skeletal`, `Over`, `Cat.of`, `Subobject`,
  `Preorder.smallCategory`, `WalkingParallelPair`, `WalkingSpan`, `WellFounded.rank` with
  `WellFounded.rank_eq` and `WellFounded.rank_lt_of_rel`.

Mathlib has **no** direct or inverse categories, no semi-simplicial objects, no semi-cubical
category, no non-singular presheaves on a general category and no discrete fibrations.

**Tau Ceti** has none of these either (no Lean file mentions Reedy structures or direct categories).

Nothing on this roadmap waits for Mathlib, and nothing here is to be opened as a Mathlib pull
request as part of discharging a target.

## Conventions (pinned)

1. **Reedy structures are Mathlib's.** A Reedy category is a category with a
   `ReedyStructure W₁ W₂ α`. `W₁` is the class of degree-*lowering* morphisms (epimorphisms for
   `Δ`) and `W₂` the degree-*raising* ones (monomorphisms for `Δ`); the canonical factorization is
   a `W₁`-morphism **followed by** a `W₂`-morphism. Every result is stated for general `α` unless it
   names `ℕ` or `Ordinal`. No second Reedy structure type is introduced.
2. **Direct and inverse.** `DirectRel C X Y := ∃ f : X ⟶ Y, ¬ MorphismProperty.identities C f`.
   `class IsDirect (C) : Prop` has the single field `wellFounded : WellFounded (DirectRel C)`;
   `class IsInverse (C) : Prop` has the single field `isDirect_op : IsDirect Cᵒᵖ`. A direct Reedy
   structure is a `ReedyStructure (identities C) ⊤ α`, an inverse one a `ReedyStructure ⊤ (identities C) α`.
   The canonical degree of a direct category is `IsDirect.rank X := WellFounded.rank (DirectRel C) X`,
   valued in `Ordinal.{u}` for `C : Type u`, and `IsDirect.reedyStructure` is the structure it
   defines. Nothing asks for smallness in Layers 1–2.
3. **Products** of Reedy structures are stated for `ℕ`-valued degrees, with
   `deg (c, d) = deg c + deg d` and classes `W₁.prod W₁'`, `W₂.prod W₂'`.
4. **Non-singular presheaves.** For `X : Cᵒᵖ ⥤ Type w`, `Presheaf.IsNonsingular X` means: for all
   `x : X.obj (op c)` and `u v : c' ⟶ c`, `X.map u.op x = X.map v.op x → u = v`. A functor `p : E ⥤ C`
   is a discrete fibration (`Functor.IsDiscreteFibration p`) if for every `e` the map
   `⟨e', g⟩ ↦ ⟨p.obj e', p.map g⟩` from `Σ e', e' ⟶ e` to `Σ c, c ⟶ p.obj e` is bijective.
   `DiscreteFibration C` is the full subcategory of `Over (Cat.of C)` on discrete fibrations.

## Neighbours

| Neighbour | Contract | Boundary |
| --- | --- | --- |
| Mathlib, as listed above | `ReedyStructure`, `SimplexCategory.reedyStructure`, `SemiSimplexCategory`, `SSet.Nonsingular`, `SSet.N` | consumed; every structure here is a Mathlib `ReedyStructure` |
| Riou's Reedy project (project-intentions#5) | latching and matching objects, Reedy weak factorization systems, the Reedy model structure | entirely theirs; this roadmap states nothing about them |
| [GrothendieckInfinityGroupoids](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1060), Layer 0.1 | the globe category `𝔾` | defined there; 2.6 proves it direct; globular sets stay there |
| [BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/pull/947) | may consume Layers 1–2 | its Reedy model structures come from Riou's project, not from here |

**Not in this roadmap**, beyond the scope boundary above: generalized, elegant and
Eilenberg–Zilber Reedy categories; geometric realisation and sphericity of non-singular
presheaves; regular CW complexes.

## Layer 1: direct and inverse categories

1.1 **Definitions and basic API.** `DirectRel`, `IsDirect`, `IsInverse`, with
`isInverse_iff : IsInverse C ↔ IsDirect Cᵒᵖ` and `isDirect_iff_isInverse_op : IsDirect C ↔ IsInverse Cᵒᵖ`.
In a direct category every endomorphism is the identity (`IsDirect.eq_id_of_endo`), every
isomorphism is an identity, and the category is skeletal (`IsDirect.skeletal`); dually for inverse
categories. Closure: discrete categories are direct; if `F : C ⥤ D` sends non-identity morphisms
to non-identity morphisms and `D` is direct, so is `C`; hence full subcategories and wide
subcategories of direct categories are direct; binary products of direct categories are direct.
*Check:* `ℤ` with its order is thin, skeletal, has only monomorphisms and identity endomorphisms,
and is not direct.

1.2 **Well-founded characterisation.** For any `α` as in Convention 1, a
`ReedyStructure (identities C) ⊤ α` makes `C` direct (`IsDirect.of_reedyStructure`), and
`IsDirect C ↔ Nonempty (ReedyStructure (identities C) ⊤ Ordinal.{u})`. The instance
`Unique ((identities C).MapFactorizationData ⊤ f)` and its dual
`Unique ((⊤ : MorphismProperty C).MapFactorizationData (identities C) f)`. The canonical degree:
`IsDirect.rank_lt` (non-identity morphisms raise `rank`), the recursion
`IsDirect.rank X = ⨆ (f : non-identity morphism Y ⟶ X), Order.succ (IsDirect.rank Y)`, and minimality:
for every direct Reedy structure `r` with values in `α : Type w`,
`Ordinal.lift.{w} (IsDirect.rank X) ≤ Ordinal.lift.{u} (Ordinal.typein (· < ·) (r.deg X))`.

1.3 **Finite degrees.** `Nonempty (ReedyStructure (identities C) ⊤ ℕ) ↔ ∃ _ : IsDirect C, ∀ X, IsDirect.rank X < ω`.
Sufficient condition: `C` is direct and, for every `X`, there are finitely many objects with a
morphism to `X` (then `X ↦` the length of the longest chain of non-identity morphisms ending at `X`
is a degree).

1.4 **Induction.** Well-founded induction and recursion over the objects of a direct category,
and over the degree of a Reedy structure, stated as `IsDirect.induction` / `IsDirect.rec` and
`ReedyStructure.induction` / `ReedyStructure.rec` with the unfolding equation of the recursor.

1.5 **Restriction and transport.** For `r : ReedyStructure W₁ W₂ α`:
`r.directPart : ReedyStructure (identities (WideSubcategory W₂)) ⊤ α` and
`r.inversePart : ReedyStructure ⊤ (identities (WideSubcategory W₁)) α`, both with degree `r.deg`.
Restriction to a full subcategory given by an `ObjectProperty P` such that, whenever `P X` and
`P Y`, `P` holds of the intermediate object of the Reedy factorization of every `f : X ⟶ Y`; the
degree sieves `{X | r.deg X ≤ a}` and `{X | r.deg X < a}` satisfy this (`r.truncation a`,
`r.truncationLT a`). Transport along an isomorphism of categories `F : C ⥤ D` (an equivalence
bijective on objects), with the classes `W₁.map F`, `W₂.map F`. `r.op` exchanges the direct and
inverse parts: `r.op.directPart` and `r.inversePart` correspond under `WideSubcategory` and `op`.

1.6 **Products.** `ReedyStructure.prod` for `ℕ`-valued degrees (Convention 3), with the
factorization componentwise (Riehl–Verity, TAC 2014, 2.7).

## Layer 2: examples

2.1 **Partial orders.** For a partial order `P` with Mathlib's `Preorder.smallCategory`:
`IsDirect P ↔ WellFoundedLT P` and `IsInverse P ↔ WellFoundedGT P`. Under `[LocallyFiniteOrderBot P]`,
`x ↦ (Finset.Iio x).card` is an `ℕ`-valued direct degree (`reedyStructureOfLocallyFiniteOrderBot`).
Instances and checks: `ℕ`, `Fin n`, `Finset ι` ordered by inclusion, the lexicographic order on
`ℕ ×ₗ ℕ` (direct, with no `ℕ`-valued degree).

2.2 **Small diagram shapes.** `WalkingParallelPair` with the source of degree `0` and the target
of degree `1` is direct (Riehl–Verity, TAC 2014, 2.5). `WalkingSpan` carries two Reedy structures:
the direct one with the apex of degree `0`, and the one with the apex of degree `1`, one leg
lowering and the other raising the degree (2.3–2.4 there); both are constructed, and the second is
neither direct nor inverse.

2.3 **The simplex categories.** `SimplexCategory.reedyStructure` is Mathlib's (mathlib4#44778).
If the Mathlib pinned by Tau Ceti predates that pull request, this item builds it here with exactly
Mathlib's name and statement (`ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ`,
degree `len`), replaced by deletion plus import when the pin moves. On top of it: its opposite on
`Δᵒᵖ` (`ReedyStructure.op`), its truncations to `SimplexCategory.Truncated n` (1.5), and a Reedy
structure on `AugmentedSimplexCategory` with epimorphisms and monomorphisms and degree `len + 1`,
`0` for the initial object (Riehl–Verity, TAC 2014, 2.6).

2.4 **The semi-simplex category.** The isomorphism of categories between `SemiSimplexCategory` and
`WideSubcategory (monomorphisms SimplexCategory)` (bijective on objects, `toSimplexCategory` on
morphisms). `SemiSimplexCategory.reedyStructure : ReedyStructure (identities SemiSimplexCategory) ⊤ ℕ`
is **obtained** from the Reedy structure of `Δ` by restriction to monomorphisms,
`SimplexCategory.reedyStructure.directPart` (1.5), transported along that isomorphism (1.5); it has
degree `len`, and `IsDirect SemiSimplexCategory` follows (1.2). Faces
`SemiSimplexCategory.δ i : ⦋n⦌ₛ ⟶ ⦋n + 1⦌ₛ` with `toSimplexCategory.map (δ i) = SimplexCategory.δ i`,
the simplicial identity `δ_comp_δ`, every morphism `⦋m⦌ₛ ⟶ ⦋n + 1⦌ₛ` with `m ≤ n` factors through a
face, and every morphism is a composite of faces. Semi-simplicial objects
`SemiSimplicialObject D := SemiSimplexCategoryᵒᵖ ⥤ D`, with the restriction functor
`SimplicialObject D ⥤ SemiSimplicialObject D` given by precomposition with `toSimplexCategory.op`.

2.5 **The semi-cubical category.** `SemiCubeCategory`: objects `⦋n⦌□` for `n : ℕ`; a morphism
`⦋m⦌□ ⟶ ⦋n⦌□` is a map `c : Fin n → Option Bool` with exactly `m` coordinates equal to `none` (the
face of `[0,1]ⁿ` fixing coordinate `i` to `b` when `c i = some b`, the free coordinates kept in
increasing order); the composite of `c : ⦋m⦌□ ⟶ ⦋n⦌□` and `d : ⦋n⦌□ ⟶ ⦋p⦌□` is `d` at fixed coordinates
and, at the `k`-th free coordinate of `d`, the value of `c` at `k`. Category axioms, every
morphism mono, a direct structure with degree `n`, and the count: there are `Nat.choose n k * 2 ^ (n - k)`
morphisms `⦋k⦌□ ⟶ ⦋n⦌□`, summing to `3 ^ n` over `k`.

2.6 **The globe category.** `𝔾` of GrothendieckInfinityGroupoids, Layer 0.1, is direct with degree
`n`, all of its morphisms are monomorphisms, and there are two morphisms `k ⟶ n` for `k < n`.

## Layer 3: non-singular presheaves on direct categories

3.1 **Non-singular presheaves** (Convention 4), for any category `C`.
`Presheaf.IsNonsingular X ↔ Quiver.IsThin X.Elements`; for `[SmallCategory C]` and `X : Cᵒᵖ ⥤ Type u`,
`Presheaf.IsNonsingular X ↔ ∀ c x, Mono (yonedaEquiv.symm x)`. Every representable is non-singular
iff every morphism of `C` is a monomorphism (cf. Cisinski, 8.2.2). Stability: a presheaf with a
morphism to a non-singular presheaf is non-singular (`Presheaf.IsNonsingular.of_hom`; in particular
subpresheaves, `Subfunctor`), coproducts, filtered colimits, and pushouts `X ⊔_A Y` along two
monomorphisms `A ⟶ X`, `A ⟶ Y`.

3.2 **Face posets.** For `[IsDirect C]` and `X` non-singular, the type `(c : C) × X.obj (op c)` with
`⟨c', x'⟩ ≤ ⟨c, x⟩ :↔ ∃ u : c' ⟶ c, X.map u.op x = x'` is a partial order (`Presheaf.FacePoset X`),
`X.Elements` is equivalent to `(Presheaf.FacePoset X)ᵒᵖ`, and `IsDirect (Presheaf.FacePoset X)`. The
canonical cocone exhibits `X` as the colimit of the representables over `Presheaf.FacePoset X`.
For `X : SSet` with `[X.Nonsingular]`, the non-degenerate simplices form a semi-simplicial set
(by `SSet.nonDegenerate_δ`), it is non-singular, and its face poset is order-isomorphic to `X.N`.
*Check:* for `C = SemiSimplexCategory` and `X` non-singular, an element `⟨⦋m⦌ₛ, x⟩` has `m + 1`
pairwise distinct vertices (its faces of dimension `0`), and `e ↦` (vertices of `e`) is an order
isomorphism from `{e // e ≤ ⟨⦋m⦌ₛ, x⟩}` onto the non-empty subsets of that vertex set.

3.3 **Discrete fibrations.** `Functor.IsDiscreteFibration` and `DiscreteFibration C`
(Convention 4); the equivalence `(Cᵒᵖ ⥤ Type v) ≌ DiscreteFibration C` for `C : Type v` with
`[SmallCategory C]`, sending `X` to the projection from (the opposite of) `X.Elements`; it
restricts to an equivalence between non-singular presheaves and discrete fibrations whose source
is thin, and, for `[IsDirect C]`, whose source is a partial order. Monomorphisms of presheaves
correspond to functors over `C` injective on objects.

3.4 **Pinned posets.** For `[IsDirect C]` with every morphism a monomorphism: `Over c` is thin and
skeletal, order-isomorphic to the poset of subobjects of `yoneda.obj c` of the form
`Subobject.mk (yoneda.map u)`; a discrete fibration `p : K ⥤ C` from a partial order induces, for
each `ξ : K`, an order isomorphism between `{η // η ≤ ξ}` and `Over (p.obj ξ)` compatible with `p`;
and conversely a map `τ` from `K` to the objects of `C`, strictly monotone for the partial order
`c ≤ c' :↔ Nonempty (c ⟶ c')` on objects (antisymmetric because `C` is direct), with such
compatible isomorphisms `u_ξ` satisfying `u_ξ ∘ u_η = u_{u_ξ η}` comes from a unique discrete
fibration. The category of non-singular presheaves is thereby equivalent to the category of these
pinned posets, with type-preserving maps compatible with the pinnings as morphisms. Directness is
used only through skeletality and `IsDirect.eq_id_of_endo` (which also give the antisymmetry of
`c ≤ c'`): state 3.4 for a small skeletal `C` in which every endomorphism is the identity and every
morphism is a monomorphism, and derive the `[IsDirect C]` form; the ordered set `ℤ` of 1.1 satisfies
these hypotheses without being direct.

## Provenance

Existing formalizations to port or consult (cited sources, not specifications):

- Michel Hua, leanprover-community/mathlib4#44731 (`Mathlib/AlgebraicTopology/Reedy/Direct.lean`):
  `ReedyStructure.ofWellFounded` (the rank as an `Ordinal`-valued direct degree), `wellFounded`,
  `eq_id_of_endo` and the `Unique ((identities C).MapFactorizationData ⊤ f)` instance — 1.1–1.2.
- Michel Hua, leanprover-community/mathlib4#44732 (`Mathlib/AlgebraicTopology/Reedy/SemiSimplexCategory.lean`):
  a direct structure on `SemiSimplexCategory` with degree `len` built directly; 2.4 obtains it
  from the Reedy structure of `Δ` by restriction to monomorphisms instead.
- [`lean/Grothendieck/Folder104.lean`](https://github.com/Commutator-IO/grothendieck-project/blob/main/lean/Grothendieck/Folder104.lean)
  (CC0), from a reading of folder 104 of the Grothendieck fonds (Montpellier): `reedyDirecte`,
  `wf_of_degre`, `entiers_relatifs_non_directe` (Layer 1), `DeltaInj` with `δ_comp_δ` and
  `factorise_face` (2.4), `card_I_cube` and `somme_faces_cube` (2.5); `nonSingulier_of_hom`,
  `admissible_coproduit` and `admissible_pushout` (3.1, with `admissible_iff` identifying its
  « admissible » presheaves with the non-singular ones), `mono_iff_injective_versEpingle` (3.3), and
  the pinned-poset equivalence `equivalence_page13` (3.4), proved for a small skeletal category
  whose morphisms are monomorphisms and whose endomorphisms are identities, with no
  well-foundedness hypothesis.
- [`lean/Grothendieck/Folder76.lean`](https://github.com/Commutator-IO/grothendieck-project/blob/main/lean/Grothendieck/Folder76.lean)
  (CC0), namespace `Grothendieck.Folder76.Sommets`, for non-singular semi-simplicial sets given
  explicitly (`NonSingular`): `NonSingular.vertex_inj` and `NonSingular.isFlagGeom`, the Check of
  3.2.

## References

- E. Riehl and D. Verity, *The theory and practice of Reedy categories*, Theory Appl. Categ. 29
  (2014), 256–301, Zbl 1302.55014, [arXiv:1304.6871](https://arxiv.org/abs/1304.6871). Item numbers
  above (2.3–2.7) are those of the arXiv version.
- D.-C. Cisinski, *Les préfaisceaux comme modèles des types d'homotopie*, Astérisque 308 (2006),
  Zbl 1111.18008, §8.2 (8.2.2).
