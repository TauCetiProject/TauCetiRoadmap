# Roadmap: homotopy theory of small categories — basic localizers, test categories, direct categories, derivators and 2-groups

**Summary.** Build the homotopy theory of small categories in the form Grothendieck gave it in
*Pursuing Stacks* and *Les Dérivateurs*, and its 1-truncated algebraic shadow. The roadmap
constructs:

- the 1-truncated layer: connected components and the fundamental groupoid of a small category,
  the classes `W₀` and `W₁` of functors inducing bijections on `π₀` and equivalences of
  fundamental groupoids, action groupoids, fibrations of groupoids and their exact sequences;
- **basic localizers** (Grothendieck's *localisateurs fondamentaux*), aspherical categories and
  functors, Quillen's Theorem A for an arbitrary basic localizer, the minimal basic localizer
  `W∞`, and Cisinski's theorem that `W∞` is the class of **Thomason equivalences**, the functors
  whose nerve is a simplicial weak equivalence;
- Thomason's model structure on `Cat`, Dwyer maps and pushouts along them;
- weak, local, strict **test categories**, with `Δ`, the cube category `□` and the cube category
  with connections `□_c` as the worked examples;
- **direct and inverse categories** on Mathlib's `HomotopicalAlgebra.ReedyStructure`: the
  well-founded characterisation of direct categories and their canonical degree, restriction and
  transport of Reedy structures, the standard examples (posets with well-founded order, small
  diagram shapes, the simplex and semi-simplex categories, the semi-cubical and globe
  categories), and **non-singular presheaves** on a direct category with their face posets,
  discrete fibrations and pinned posets;
- **derivators**: prederivators, the axioms Der1–Der4, strong, pointed and stable derivators,
  homotopy exact and (co)Cartesian squares, Kan extension along sieves and cosieves, the
  triangulated structure on the values of a stable derivator, and the derivators of a model
  category and of a cofibration category;
- Baues **cofibration categories** with Brown's factorization lemma and their homotopy category;
- **2-groups**: gr-categories, crossed modules, Sính's classification by `π₀`, `π₁` and the
  `k`-invariant in `H³`, braided and Picard categories, the symmetry sign, Deligne's equivalence
  of strictly commutative Picard categories with two-term complexes, the fundamental 2-groups of
  a topological group and of a pointed space, and extensions of groups by a crossed module;
- **Picard stacks** on an arbitrary site as coefficients, with Deligne's equivalence between
  strictly commutative Picard stacks and complexes of abelian sheaves in degrees `[-1, 0]`.

`README.md` is definitive. `Suggested.lean` checks selected signatures; it is not an exhaustive
checklist and its admitted constructions are targets. Suggested homes in Tau Ceti:
`TauCeti/CategoryTheory/Groupoid/` (Layer 0), `TauCeti/CategoryTheory/Localizer/` (Layers 1–2),
`TauCeti/AlgebraicTopology/Thomason/` (Layers 3–4), `TauCeti/AlgebraicTopology/TestCategory/`
(Layer 5), `TauCeti/AlgebraicTopology/Reedy/` (Layers 6–7, mirroring Mathlib's
`Mathlib/AlgebraicTopology/Reedy/`), `TauCeti/CategoryTheory/Presheaf/Nonsingular.lean` and
`TauCeti/CategoryTheory/DiscreteFibration.lean` (Layer 8), `TauCeti/CategoryTheory/Derivator/`
(Layer 9), `TauCeti/AlgebraicTopology/CofibrationCategory/` (Layer 10),
`TauCeti/CategoryTheory/GrCategory/` (Layer 11) and `TauCeti/CategoryTheory/Sites/PicardStack/`
(Layer 12). The file split is an implementation choice; the dependency order is not.

## Scope boundary

**In scope**: everything listed in the summary, for small categories in a fixed universe `u`
(`Cat.{u, u}`), and the comparison theorems that connect it with simplicial sets. Layers 6–7
(direct and inverse categories, Reedy structures) are stated for arbitrary categories and ask for
no smallness (convention 16).

**Out of scope, with owner.**

| Material | Owner | Use here |
| --- | --- | --- |
| Latching and matching objects, Reedy weak factorization systems, the Reedy model structure | Joël Riou's Mathlib project ([leanprover-community/project-intentions#5](https://github.com/leanprover-community/project-intentions/issues/5)), announced in the TODO of Mathlib's [`Mathlib/AlgebraicTopology/Reedy/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/AlgebraicTopology/Reedy/Basic.lean) | not used: Layers 6–8 state nothing about them, and every Reedy structure here is a Mathlib `ReedyStructure`, so that they combine with that work |
| Kan–Quillen model structure on `SSet`, simplicial weak equivalences, `sd ⊣ Ex` comparisons, geometric realization | [GeneralizedCohomology](../GeneralizedCohomology/README.md), G2 item 1; Mathlib (`SSet.sd`, `SSet.ex`, `SSet.sdExAdjunction`) | consumed in Layers 3–5 |
| Homotopy groups of spaces, weak homotopy equivalences, Hurewicz and Whitehead | [AlgebraicTopology](../AlgebraicTopology/README.md), Stage 8; Tau Ceti `TauCeti/Topology/Homotopy/HomotopyGroup/` | consumed in Layer 11 |
| `K(G, 1)` spaces and group cohomology of classifying spaces | [ClassifyingSpaces](../ClassifyingSpaces/README.md) | not used |
| Grothendieck topoi, their points and morphisms, the classifying topos `B_G` | the [Grothendieck topoi roadmap](../GrothendieckTopoi/README.md) | not used: sites appear here only as bases of coefficient stacks |
| Stacks in groupoids on schemes, gerbes, site-level stackification `Stack.stackification`, torsors, the Picard groupoid and Picard stack of a curve | [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md), §§1.15, 1.18, 3.4, 3.7 | `Stack.stackification` consumed in Layer 12 |
| The globe category `𝔾` (Layer 0.1 there), globular sets, Grothendieck ∞-groupoids, the homotopy hypothesis | [GrothendieckInfinityGroupoids](../GrothendieckInfinityGroupoids/README.md) | `𝔾` consumed in 7.6, which proves it direct; globular sets stay there |
| Quillen exact categories and Grothendieck groups | [GrothendieckEulerForms](../GrothendieckEulerForms/README.md) | not used |
| Spectra and stable homotopy | [GeneralizedCohomology](../GeneralizedCohomology/README.md) | not used |

Not in this roadmap either: generalized, elegant and Eilenberg–Zilber Reedy categories; weighted
(co)limits, boundaries of representables, the inductive construction of diagrams and skeletal
filtrations; geometric realisation and sphericity of non-singular presheaves; regular CW
complexes. [BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/pull/947) and
[GrothendieckInfinityGroupoids](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1060) consume
Layers 6–7 and own none of their targets; the Reedy model structures BordismFormalGroups uses come
from Riou's project, not from here.

The boundary in one sentence: if a statement is about small categories up to a class of weak
equivalences, presheaves on a small category, diagrams of shape a small category in a derivator,
direct and inverse categories and their Reedy structures, non-singular presheaves on a direct
category, or monoidal groupoids, it is here; if it is about simplicial sets or spaces alone, about
latching and matching objects or the Reedy model structure, about topoi, or about stacks on
schemes, it belongs to the owner named above.

## What exists (consume)

**Mathlib**, at the revision Tau Ceti pins:

- `CategoryTheory.Cat` with `Cat.of`, `Cat.Hom` (`F.toFunctor`), `Functor.toCatHom`, the strict
  bicategory instance `Cat.bicategory`; `Bicategory.Opposite` (`Bᵒᵖ` reverses 1-cells only),
  `Pseudofunctor` (`⥤ᵖ`), `LocallyDiscrete`, `Pseudofunctor.IsStack`.
- `MorphismProperty` with `ContainsIdentities`, `HasTwoOutOfThreeProperty`,
  `IsStableUnderRetracts`, `IsStableUnderCobaseChange`, `IsInvertedBy`, `HasFactorization`;
  `MorphismProperty.Localization` with `Q`, `Localization.Construction.lift`,
  `Functor.IsLocalization`, `LocalizerMorphism`.
- `StructuredArrow`, `CostructuredArrow` with `pre` and `post`, `Over`, `Functor.Elements` with
  `costructuredArrowYonedaEquivalence`, `CategoryTheory.Grothendieck`, `Functor.star`,
  `ConnectedComponents` with `Functor.mapConnectedComponents`, `IsConnected`, `Groupoid`,
  `SingleObj`, `Functor.Final`, `IsPushout`, `HasTerminal`, `HasZeroObject`.
- `nerve`, `nerveFunctor`, `nerveMap`, `SSet.hoFunctor ⊣ nerveFunctor` (`NerveAdjunction`),
  `SSet.sd`, `SSet.ex`, `SSet.sdExAdjunction`, `SSet.KanComplex`, the generating maps
  `SSet.modelCategoryQuillen.I`, `J`, and simplicial homology
  (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/`).
- `HomotopicalAlgebra.ModelCategory`, `CategoryWithCofibrations`,
  `CategoryWithWeakEquivalences`, `CofibrantBrownFactorization`, `FibrantBrownFactorization`.
- `MonoidalCategory`, `BraidedCategory`, `SymmetricCategory`, `GrpObj`, `Rep`,
  `groupCohomology`, `CochainComplex`, `DerivedCategory`, `Pretriangulated`, `Sheaf`,
  `GrothendieckTopology`, `FundamentalGroupoid`, `Path`, `IsTopologicalGroup`.
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
  `len`. It is on Mathlib `master` but not in the Mathlib that TauCetiRoadmap currently pins; see 7.3.
- `SemiSimplexCategory` (objects `⦋n⦌ₛ`, morphisms order embeddings, the faithful functor
  `toSimplexCategory`, `Mono` instances, `homOfMono`); its docstring leaves semi-simplicial objects
  as a TODO. `AugmentedSimplexCategory := WithInitial SimplexCategory`, `SimplexCategory.Truncated`.
- `SSet.Nonsingular`, the poset `SSet.N` of non-degenerate simplices, `SSet.Nonsingular.δ_injective`,
  `SSet.nonDegenerate_δ` and the colimit description over `X.N` (`NonsingularColimit.lean`).
- `WideSubcategory`, `ObjectProperty.FullSubcategory`, `MorphismProperty.identities`,
  `MorphismProperty.map`, `MorphismProperty.prod`, `Functor.Elements` with `Functor.Elements.π`,
  `Subfunctor`, `yonedaEquiv`, `Quiver.IsThin`, `Skeletal`, `Subobject`,
  `Preorder.smallCategory`, `WalkingParallelPair`, `WalkingSpan`, `WellFounded.rank` with
  `WellFounded.rank_eq` and `WellFounded.rank_lt_of_rel`.

Mathlib has no weak equivalences of `Cat`, no basic localizers, test categories, derivators,
cofibration categories in Baues' sense, gr-categories, crossed modules or Picard stacks; no
direct or inverse categories, no semi-simplicial objects, no semi-cubical category, no
non-singular presheaves on a general category and no discrete fibrations.

**Tau Ceti**: `TauCeti/CategoryTheory/Groupoid/ConnectedFunctor.lean` and `SingleObj.lean`
(natural isomorphisms out of connected groupoids, the equivalence of a connected groupoid with
`SingleObj` of a vertex group), `TauCeti/Topology/Homotopy/HomotopyGroup/` (functoriality of
`π_n`, `LoopSpace.lean` identifying `π_{n+1}(X, x)` with `π_n` of the loop space,
`ContinuousMap.IsWeakHomotopyEquivalence`), `TauCeti/CategoryTheory/Monoidal/Grp/`. No Tau Ceti
file mentions Reedy structures or direct categories.

Nothing on this roadmap waits for Mathlib, and no target is discharged by a Mathlib pull request.

## Conventions (pinned)

1. **Small categories.** A small category is an object of `Cat.{u, u}`. A class of functors is a
   `W : MorphismProperty Cat.{u, u}`; for `F : A ⥤ B` between small categories write `W F` for
   `W F.toCatHom`. The point category is `e := Discrete PUnit`, and `A → e` is `Functor.star A`.
2. **Slices.** For `F : A ⥤ B` and `b : B`, `A/b := CostructuredArrow F b` and
   `b\A := StructuredArrow b F`. For `F : A ⥤ B` and `G : B ⥤ C`, the comparison
   `A/c → B/c` is `CostructuredArrow.pre F G c`. Sieves and cosieves follow Groth 2013,
   Definition 1.28: a **sieve** `J ⊆ K` is a full, replete subcategory such that `k ⟶ j` with
   `j ∈ J` forces `k ∈ J`; a **cosieve** is the dual.
3. **Weak saturation and basic localizers.** `W` is *weakly saturated* (Cisinski 2004, 1.1.1)
   if it contains identities (FS1), has two-out-of-three (FS2), and for `i : X ⟶ Y`,
   `r : Y ⟶ X` with `i ≫ r = 𝟙 X` and `W (r ≫ i)` we have `W r` (FS3). A **basic localizer**
   (Cisinski 2004, Definition 1.1.3) is a weakly saturated `W` such that every small category
   with a terminal object is `W`-aspherical (LF2), and for every `F : A ⥤ B`, `G : B ⥤ C`, if
   every `CostructuredArrow.pre F G c` is in `W` then `F` is in `W` (LF3). `A` is
   **`W`-aspherical** if `W (Functor.star A)`; `F` is **`W`-aspherical** if every `A/b` is.
4. **The minimal localizer.** `W∞` is the intersection of all basic localizers. It is defined
   intrinsically; its identification with Thomason equivalences is a theorem (Layer 3), not a
   definition. **Thomason equivalences** `W_N` are the `F` with `nerveMap F` a simplicial weak
   equivalence in the sense of GeneralizedCohomology G2 item 1.
5. **Fundamental groupoid of a category.** `Π₁ A := (⊤ : MorphismProperty A).Localization`,
   the localization at all morphisms; `Π₁ F` is the functor induced by
   `Localization.Construction.lift`. `W₀` is the class of `F` with
   `F.mapConnectedComponents` bijective; `W₁` the class of `F` with `Π₁ F` an equivalence.
6. **Presheaves.** `Â := Aᵒᵖ ⥤ Type u`. `i_A X := CostructuredArrow yoneda X` (the category
   `A/X`; Mathlib's `costructuredArrowYonedaEquivalence` identifies it with
   `(Functor.Elements X)ᵒᵖ`). `i_A^* C` is the presheaf `a ↦ (Over a ⥤ C)`.
   `W_Â := i_A⁻¹(W)`. A presheaf `X` is `W`-aspherical if `i_A X` is.
7. **Test categories** follow Maltsiniotis 2009, §2.3, for a basic localizer `W`: `A` is a
   *weak test category* if `W = (i_A^*)⁻¹(W_Â)` and `i_A`, `i_A^*` induce mutually quasi-inverse
   equivalences `Â[W_Â⁻¹] ≌ Cat[W⁻¹]`; a *local test category* if every `A/a` is a weak test
   category; a *test category* if both; a *strict test category* if moreover the localization
   functor `Â → Â[W_Â⁻¹]` preserves binary products. *Totally aspherical* and *separating
   aspherical interval* are as in Maltsiniotis 2009, §§2.4–2.5. The named theorems of Layer 5 are
   for `W = W∞`.
8. **Cube categories.** `□` and `□_c` are the subcategories of partial orders on the objects
   `{0 < 1}ⁿ`, `n ≥ 0`, generated by faces `δⁿ_{i,ε}` and degeneracies `σⁿ_i`, respectively by
   these and the connections `γⁿ_i (x) = (…, max(xᵢ, xᵢ₊₁), …)`, exactly as in Maltsiniotis 2009,
   §1.1, including the characterization of the morphisms of `□` by conditions (a) and (b) there.
9. **Derivators.** A prederivator is a pseudofunctor `D : (Cat.{w, w})ᵒᵖ ⥤ᵖ Cat.{v, u'}` (1-cells
   reversed, 2-cells kept: Groth 2013, Definition 1.1, with "strict" relaxed to "pseudo"). For
   `F : J ⥤ K` write `F^* := D(F)`, `F_!` and `F_*` for its left and right adjoints when they
   exist. The axioms are **Der1–Der4 of Groth 2013, Definition 1.10**; *strong* is Groth's
   Definition 1.13 (`D([1] × J) → D(J)^{[1]}` full and essentially surjective), *pointed*
   Definition 3.1, *stable* Definition 4.1. This numbering is used throughout; Maltsiniotis'
   numbering Der1–Der6 is not used.
10. **Cofibration categories** are Baues' (Baues 1989, Chapter I, (1.1)), restricted to axioms
    C1–C3: on a category with an initial object, isomorphisms are cofibrations and weak
    equivalences, weak equivalences satisfy two-out-of-three, cofibrations compose (C1); the
    pushout of a cofibration `i` along any map exists, its cobase change is a cofibration, which
    is a weak equivalence if `i` is, and the map parallel to a weak equivalence is a weak
    equivalence (C2); every map factors as a cofibration followed by a weak equivalence (C3).
11. **Gr-categories** are monoidal structures (`MonoidalCategory`) on a `Groupoid` in which every
    object `X` has some `Y` with `X ⊗ Y ≅ 𝟙_`. `π₀ C` is the group of isomorphism classes,
    `π₁ C := Aut(𝟙_ C)`, abelian by Eckmann–Hilton; `π₀` acts on `π₁` through
    `a ↦ λ_X ∘ (a ▷ X) ∘ λ_X⁻¹` followed by the inverse of the analogous right-unitor map. The
    `k`-invariant is the class in `groupCohomology` of degree 3 of the normalized 3-cocycle of the
    associator of a skeletal model, normalized as in Baez–Lauda 2004, Theorem 43.
12. **Picard categories** are gr-categories with a `SymmetricCategory` structure. The **sign**
    `ε(X) ∈ π₁` is the symmetry `β_{X,X}` transported to `Aut(𝟙_)`; it is a homomorphism
    `π₀ → π₁` with `2ε = 0`. **Strictly commutative** means `β_{X,X} = 𝟙` for every `X`
    (Deligne, SGA 4 XVIII, §1.4).
13. **Two-term complexes** are additive maps `d : K⁻¹ →+ K⁰`, placed in degrees `-1` and `0`.
    `ch(d)` is the strictly commutative Picard category with objects `K⁰`, morphisms
    `x ⟶ y` the `k : K⁻¹` with `x + d k = y`, tensor `+`, and identity symmetry. Then
    `π₀ = coker d` and `π₁ = ker d`.
14. **Fibrations of groupoids** are star-surjective functors (Brown–Heath–Kamps 1983, §2).
    The homotopy pullback of groupoids is Mathlib's `CategoricalPullback` (iso-comma).
15. **Reedy structures are Mathlib's.** A Reedy category is a category with a
    `ReedyStructure W₁ W₂ α`. `W₁` is the class of degree-*lowering* morphisms (epimorphisms for
    `Δ`) and `W₂` the degree-*raising* ones (monomorphisms for `Δ`); the canonical factorization is
    a `W₁`-morphism **followed by** a `W₂`-morphism. Every result is stated for general `α` unless it
    names `ℕ` or `Ordinal`. No second Reedy structure type is introduced.
16. **Direct and inverse.** `DirectRel C X Y := ∃ f : X ⟶ Y, ¬ MorphismProperty.identities C f`.
    `class IsDirect (C) : Prop` has the single field `wellFounded : WellFounded (DirectRel C)`;
    `class IsInverse (C) : Prop` has the single field `isDirect_op : IsDirect Cᵒᵖ`. A direct Reedy
    structure is a `ReedyStructure (identities C) ⊤ α`, an inverse one a
    `ReedyStructure ⊤ (identities C) α`. The canonical degree of a direct category is
    `IsDirect.rank X := WellFounded.rank (DirectRel C) X`, valued in `Ordinal.{u}` for `C : Type u`,
    and `IsDirect.reedyStructure` is the structure it defines. Nothing asks for smallness in
    Layers 6–7.
17. **Products** of Reedy structures are stated for `ℕ`-valued degrees, with
    `deg (c, d) = deg c + deg d` and classes `W₁.prod W₁'`, `W₂.prod W₂'`.
18. **Non-singular presheaves.** For `X : Cᵒᵖ ⥤ Type w`, `Presheaf.IsNonsingular X` means: for all
    `x : X.obj (op c)` and `u v : c' ⟶ c`, `X.map u.op x = X.map v.op x → u = v`. A functor
    `p : E ⥤ C` is a discrete fibration (`Functor.IsDiscreteFibration p`) if for every `e` the map
    `⟨e', g⟩ ↦ ⟨p.obj e', p.map g⟩` from `Σ e', e' ⟶ e` to `Σ c, c ⟶ p.obj e` is bijective.
    `DiscreteFibration C` is the full subcategory of `Over (Cat.of C)` on discrete fibrations.

## The build, in layers

### Layer 0: the 1-truncated layer

- **Fundamental groupoid.** Construct `Π₁ A`, prove that it is a groupoid, its universal
  property (functors `Π₁ A ⥤ G` into a groupoid `G` are functors `A ⥤ G`), functoriality and
  `Π₁ G ≌ G` for a groupoid `G`. Prove `ConnectedComponents (Π₁ A) ≃ ConnectedComponents A`.
- **The classes `W₀` and `W₁`.** Prove that `F ∈ W₁` iff `F ∈ W₀` and for every `a` the map
  `Aut_{Π₁ A}(a) → Aut_{Π₁ B}(F a)` is bijective; that for a functor between groupoids, `W₁` is
  the class of equivalences of categories; and `W₁ ⊆ W₀`. Prove that `A` is `W₁`-aspherical iff
  `Π₁ A` is equivalent to `e`.
- **Action groupoids.** For a group `G`, prove that presheaves on `SingleObj G` are right
  `G`-sets (an equivalence of categories, naturally in `G`), and that `i_{BG} X` is equivalent to
  the action groupoid of `X`: its components are the orbits and the automorphism group of `x` is
  the stabilizer. Deduce that a map of `G`-sets lies in `W_Â` for `W = W₁` iff it is bijective,
  and that `X` is `W₁`-aspherical iff the action is simply transitive.
- **Fibrations of groupoids.** For a fibration `p : E ⥤ B` of groupoids and `x : E`, construct
  the exact sequence of groups and pointed sets
  `1 → Aut_F(x) → Aut_E(x) → Aut_B(p x) → π₀ F → π₀ E → π₀ B` (`F` the fibre over `p x`), with
  the action of `Aut_B(p x)` on `π₀ F` whose orbits are the fibres of `π₀ F → π₀ E`
  (Brown–Heath–Kamps 1983, sequence (1.1), after Brown 1970).
- **Mayer–Vietoris.** For a pullback square of groupoids in which one map is a fibration, prove
  the Mayer–Vietoris sequence of Brown–Heath–Kamps 1983, Theorem 2.2, its Corollary 2.4, and the
  bijectivity criterion of Corollary 2.5 for `π₀` of the pullback. Compare the strict pullback
  along a fibration with Mathlib's `CategoricalPullback` (equivalent) and transport the sequence.

### Layer 1: basic localizers and asphericity

- **The lattice.** Define `IsBasicLocalizer W` (convention 3). Prove that an arbitrary
  intersection of basic localizers is one, define `W∞`, and prove `W∞ ≤ W` for every basic
  localizer `W`.
- **Examples.** Prove that the following are basic localizers: `W₀`, `W₁`, the class of all
  functors, and the class `W₋₁` of functors `F : A ⥤ B` with `Nonempty A ↔ Nonempty B`. Prove
  `W₁ ≤ W₀`, `W₀ ≤ W₋₁`, and that the inclusions `W₀ ≤ W₋₁` and `W₋₁ ≤ ⊤` are strict, by the
  functor from the two-point discrete category to `e` and by the empty category.
- **Elementary consequences** (Cisinski 2004, §1.1): `W` is stable under small coproducts
  (Proposition 1.1.5) and finite products (Proposition 1.1.7, via Lemma 1.1.6); a functor with
  a natural transformation to or from a `W`-functor is in `W` (Proposition 1.1.9); every functor
  with a left or a right adjoint, in particular every equivalence, is in `W` (Corollary 1.1.10);
  a category with an initial object is aspherical (Corollary 1.1.11); a morphism between
  categories cofibred over `S` that is fibrewise in `W` is in `W` (Proposition 1.1.13).
- **Theorem A.** Every `W`-aspherical functor is in `W`, and the relative version: a functor over
  `C` with every `A/c → B/c` in `W` is in `W` (Cisinski 2004, Remark 1.1.4, after Quillen 1973,
  §1, Theorem A). The dual statement for `b\A` is proved for `W∞` in Layer 3 by op-invariance.
- **Integration.** For `F ⟶ G` in `I ⥤ Cat` objectwise in `W`, the induced functor of Mathlib
  Grothendieck constructions is in `W` (Cisinski 2004, Proposition 1.2.4).
- **Locally constant functors.** Define `F` to be `W`-locally constant when every `A/b → A/b'`
  is in `W` (Cisinski 2004, 2.3.1).

### Layer 2: presheaves on a small category

- **The adjunction.** Construct `i_A : Â ⥤ Cat` and `i_A^* : Cat ⥤ Â` with `i_A ⊣ i_A^*`,
  `i_A (yoneda a) ≅ Over a`, and naturality in `A`. Prove that representable presheaves are
  `W`-aspherical for every basic localizer.
- **Weak equivalences of presheaves.** Define `W_Â`, prove it is weakly saturated, and that
  `i_A` sends colimits computed in `Â` to colimits in `Cat` (Cisinski 2004, Lemma 1.3.6).
  Prove Grothendieck's theorem that monomorphisms in `W_Â` are stable under pushout and
  transfinite composition (Cisinski 2004, Theorem 1.3.10).
- **The simplex category.** For a small category `A`, prove that the functor
  `i_Δ (nerve A) → A` sending an `n`-simplex to its last vertex is `W`-aspherical for every basic
  localizer `W` (Cisinski 2004, Lemma 2.2.2 and Proposition 2.2.3), hence
  `W = nerve⁻¹(i_Δ⁻¹ W)` (Corollary 2.2.4) and `nerve`, `i_Δ` induce mutually quasi-inverse
  equivalences `Δ̂[W_Δ̂⁻¹] ≌ Cat[W⁻¹]` (Remark 2.2.5). For `X : SSet.{u}`, `i_Δ X` is the
  category of simplices `CostructuredArrow SSet.stdSimplex X`, which is small in universe `u`.

### Layer 3: Thomason equivalences and the minimal localizer

- **Thomason equivalences are a basic localizer.** Prove LF1–LF3 for `W_N`, LF3 by Quillen's
  Theorem A (Cisinski 2004, Theorem 2.1.13, through bisimplicial sets, Theorem 2.1.5 and
  Proposition 2.1.7). Prove `W_N` is stable under `A ↦ Aᵒᵖ`.
- **Minimality.** Prove `W∞ = W_N` (Cisinski 2004, Theorem 2.2.11, via Lemmas 2.2.6, 2.2.8 and
  Proposition 2.2.9). Consequences: `W∞` is stable under opposites; the dual Theorem A for
  `b\A`; `W∞ ≤ W₁ ≤ W₀`; `W∞`-equivalences induce isomorphisms on simplicial homology of
  nerves.
- **Homological localizers.** Prove that, for every abelian group `M`, the class of functors
  whose nerve induces isomorphisms on simplicial homology with coefficients in `M` is a basic
  localizer; hence it contains `W∞`.
- **Theorem B.** For a `W∞`-locally constant `F`, the square comparing `A/b` with the homotopy
  fibre is homotopy Cartesian in `SSet` (Cisinski 2004, Theorem 2.3.2, after Quillen 1973, §1,
  Theorem B); a `W∞`-locally constant functor is in `W∞` iff it is aspherical
  (Corollary 2.3.3). Prove the characterization: a basic localizer `W ≤ W₀` such that every
  `W`-locally constant functor in `W` is `W`-aspherical equals `W∞` (Theorem 2.3.6).
- **The homotopy category.** `Hot := Cat[W∞⁻¹]`; prove `Hot ≌ SSet[W⁻¹]` through `nerve` and
  `i_Δ`.

### Layer 4: Thomason's model structure

- **Dwyer maps.** A functor `i : A ⥤ B` is a *Dwyer map* if it is a sieve and there is a cosieve
  `V ⊆ B` containing `i(A)` such that `A → V` has a right adjoint (Thomason 1980,
  Definition 4.1). Prove that `c Sd² L → c Sd² K` is a Dwyer map for an inclusion of ordered
  simplicial complexes (Proposition 4.2), where `c` is `SSet.hoFunctor`.
- **Pushouts.** Prove that pushouts of small categories along Dwyer maps exist, that the nerve
  of such a pushout receives a weak equivalence from the pushout of nerves (Thomason 1980,
  Proposition 4.3), and that the cobase change of a Dwyer map is a Dwyer map with the same
  conclusion (Corollary 4.4).
- **Excision along sieves.** For sieves `U, V ⊆ A` with every object in `U` or `V`, prove that
  `nerve A` is the pushout of `nerve U ← nerve (U ∩ V) → nerve V` along monomorphisms, hence the
  square `U ∩ V, U, V, A` is homotopy coCartesian for `W∞` (its image in `Hot` is a homotopy
  pushout in the Kan–Quillen model structure).
- **The model structure.** Weak equivalences `W_N`, fibrations the `F` with `Ex² (nerveMap F)` a
  Kan fibration, cofibrations by left lifting (Thomason 1980, Definitions 2.1–2.3). Prove the
  model axioms (Theorem 4.9) as a Mathlib `HomotopicalAlgebra.ModelCategory Cat.{u, u}`,
  properness (Corollary 5.5), that every cofibrant category is a poset (Proposition 5.7), and that
  `c Sd² ⊣ Ex² nerve` is a Quillen equivalence with the Kan–Quillen structure of
  GeneralizedCohomology.

### Layer 5: test categories

- **Definitions** (convention 7) for an arbitrary basic localizer, with the implications
  strict test ⇒ test ⇒ weak test and test ⇒ local test, and invariance under equivalence of
  categories.
- **Asphericity of presheaves.** Totally aspherical categories are aspherical, and for a totally
  aspherical `A` the product of two weak equivalences of `Â` is one (Maltsiniotis 2005,
  Propositions 1.6.1 and 2.1.3).
- **Grothendieck's criterion.** If `A` is totally aspherical and `Â` has a separating aspherical
  interval, `A` is a strict test category (Maltsiniotis 2005, Proposition 1.6.8; restated as
  Maltsiniotis 2009, Theorem 2.6).
- **Examples.** `Δ` (`SimplexCategory`) is a strict test category (Maltsiniotis 2005,
  Proposition 1.6.13), with interval `Δ[1]`. `□_c` is a strict test category
  (Maltsiniotis 2009, §3). `□` is a test category (Cisinski 2006, Corollary 8.4.13 or
  Proposition 8.4.27) and is not a strict test category: the presheaf `□₁ × □₁` is not
  aspherical, because `nerve (i_□ (□₁ × □₁))` has first integral homology `ℤ`
  (Maltsiniotis 2009, §5, which identifies its homotopy type with `S² ∨ S¹`); use the
  homological localizer of Layer 3. Construct the monoidal structures on `□` and `□_c`
  (Maltsiniotis 2009, §1.2).

### Layer 6: direct and inverse categories

Conventions 15–17. Every item is stated for an arbitrary category `C : Type u` with
`[Category.{v} C]`.

6.1 **Definitions and basic API.** `DirectRel`, `IsDirect`, `IsInverse`, with
`isInverse_iff : IsInverse C ↔ IsDirect Cᵒᵖ` and `isDirect_iff_isInverse_op : IsDirect C ↔ IsInverse Cᵒᵖ`.
In a direct category every endomorphism is the identity (`IsDirect.eq_id_of_endo`), every
isomorphism is an identity, and the category is skeletal (`IsDirect.skeletal`); dually for inverse
categories. Closure: discrete categories are direct; if `F : C ⥤ D` sends non-identity morphisms
to non-identity morphisms and `D` is direct, so is `C`; hence full subcategories and wide
subcategories of direct categories are direct; binary products of direct categories are direct.
*Check:* `ℤ` with its order is thin, skeletal, has only monomorphisms and identity endomorphisms,
and is not direct.

6.2 **Well-founded characterisation.** For any `α` as in convention 15, a
`ReedyStructure (identities C) ⊤ α` makes `C` direct (`IsDirect.of_reedyStructure`), and
`IsDirect C ↔ Nonempty (ReedyStructure (identities C) ⊤ Ordinal.{u})`. The instance
`Unique ((identities C).MapFactorizationData ⊤ f)` and its dual
`Unique ((⊤ : MorphismProperty C).MapFactorizationData (identities C) f)`. The canonical degree:
`IsDirect.rank_lt` (non-identity morphisms raise `rank`), the recursion
`IsDirect.rank X = ⨆ (f : non-identity morphism Y ⟶ X), Order.succ (IsDirect.rank Y)`, and minimality:
for every direct Reedy structure `r` with values in `α : Type w`,
`Ordinal.lift.{w} (IsDirect.rank X) ≤ Ordinal.lift.{u} (Ordinal.typein (· < ·) (r.deg X))`.

6.3 **Finite degrees.** `Nonempty (ReedyStructure (identities C) ⊤ ℕ) ↔ ∃ _ : IsDirect C, ∀ X, IsDirect.rank X < ω`.
Sufficient condition: `C` is direct and, for every `X`, there are finitely many objects with a
morphism to `X` (then `X ↦` the length of the longest chain of non-identity morphisms ending at `X`
is a degree).

6.4 **Induction.** Well-founded induction and recursion over the objects of a direct category,
and over the degree of a Reedy structure, stated as `IsDirect.induction` / `IsDirect.rec` and
`ReedyStructure.induction` / `ReedyStructure.rec` with the unfolding equation of the recursor.

6.5 **Restriction and transport.** For `r : ReedyStructure W₁ W₂ α`:
`r.directPart : ReedyStructure (identities (WideSubcategory W₂)) ⊤ α` and
`r.inversePart : ReedyStructure ⊤ (identities (WideSubcategory W₁)) α`, both with degree `r.deg`.
Restriction to a full subcategory given by an `ObjectProperty P` such that, whenever `P X` and
`P Y`, `P` holds of the intermediate object of the Reedy factorization of every `f : X ⟶ Y`; the
degree sieves `{X | r.deg X ≤ a}` and `{X | r.deg X < a}` satisfy this (`r.truncation a`,
`r.truncationLT a`). Transport along an isomorphism of categories `F : C ⥤ D` (an equivalence
bijective on objects), with the classes `W₁.map F`, `W₂.map F`. `r.op` exchanges the direct and
inverse parts: `r.op.directPart` and `r.inversePart` correspond under `WideSubcategory` and `op`.

6.6 **Products.** `ReedyStructure.prod` for `ℕ`-valued degrees (convention 17), with the
factorization componentwise (Riehl–Verity, TAC 2014, 2.7).

### Layer 7: examples of direct and Reedy categories

7.1 **Partial orders.** For a partial order `P` with Mathlib's `Preorder.smallCategory`:
`IsDirect P ↔ WellFoundedLT P` and `IsInverse P ↔ WellFoundedGT P`. Under `[LocallyFiniteOrderBot P]`,
`x ↦ (Finset.Iio x).card` is an `ℕ`-valued direct degree (`reedyStructureOfLocallyFiniteOrderBot`).
Instances and checks: `ℕ`, `Fin n`, `Finset ι` ordered by inclusion, the lexicographic order on
`ℕ ×ₗ ℕ` (direct, with no `ℕ`-valued degree).

7.2 **Small diagram shapes.** `WalkingParallelPair` with the source of degree `0` and the target
of degree `1` is direct (Riehl–Verity, TAC 2014, 2.5). `WalkingSpan` carries two Reedy structures:
the direct one with the apex of degree `0`, and the one with the apex of degree `1`, one leg
lowering and the other raising the degree (2.3–2.4 there); both are constructed, and the second is
neither direct nor inverse.

7.3 **The simplex categories.** `SimplexCategory.reedyStructure` is Mathlib's (mathlib4#44778).
If the Mathlib pinned by Tau Ceti predates that pull request, this item builds it here with exactly
Mathlib's name and statement (`ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ`,
degree `len`), replaced by deletion plus import when the pin moves. On top of it: its opposite on
`Δᵒᵖ` (`ReedyStructure.op`), its truncations to `SimplexCategory.Truncated n` (6.5), and a Reedy
structure on `AugmentedSimplexCategory` with epimorphisms and monomorphisms and degree `len + 1`,
`0` for the initial object (Riehl–Verity, TAC 2014, 2.6).

7.4 **The semi-simplex category.** The isomorphism of categories between `SemiSimplexCategory` and
`WideSubcategory (monomorphisms SimplexCategory)` (bijective on objects, `toSimplexCategory` on
morphisms). `SemiSimplexCategory.reedyStructure : ReedyStructure (identities SemiSimplexCategory) ⊤ ℕ`
is **obtained** from the Reedy structure of `Δ` by restriction to monomorphisms,
`SimplexCategory.reedyStructure.directPart` (6.5), transported along that isomorphism (6.5); it has
degree `len`, and `IsDirect SemiSimplexCategory` follows (6.2). Faces
`SemiSimplexCategory.δ i : ⦋n⦌ₛ ⟶ ⦋n + 1⦌ₛ` with `toSimplexCategory.map (δ i) = SimplexCategory.δ i`,
the simplicial identity `δ_comp_δ`, every morphism `⦋m⦌ₛ ⟶ ⦋n + 1⦌ₛ` with `m ≤ n` factors through a
face, and every morphism is a composite of faces. Semi-simplicial objects
`SemiSimplicialObject D := SemiSimplexCategoryᵒᵖ ⥤ D`, with the restriction functor
`SimplicialObject D ⥤ SemiSimplicialObject D` given by precomposition with `toSimplexCategory.op`.

7.5 **The semi-cubical category.** `SemiCubeCategory`: objects `⦋n⦌□` for `n : ℕ`; a morphism
`⦋m⦌□ ⟶ ⦋n⦌□` is a map `c : Fin n → Option Bool` with exactly `m` coordinates equal to `none` (the
face of `[0,1]ⁿ` fixing coordinate `i` to `b` when `c i = some b`, the free coordinates kept in
increasing order); the composite of `c : ⦋m⦌□ ⟶ ⦋n⦌□` and `d : ⦋n⦌□ ⟶ ⦋p⦌□` is `d` at fixed coordinates
and, at the `k`-th free coordinate of `d`, the value of `c` at `k`. Category axioms, every
morphism mono, a direct structure with degree `n`, and the count: there are `Nat.choose n k * 2 ^ (n - k)`
morphisms `⦋k⦌□ ⟶ ⦋n⦌□`, summing to `3 ^ n` over `k`. It is distinct from the cube category `□` of
convention 8, which also has degeneracies.

7.6 **The globe category.** `𝔾` of GrothendieckInfinityGroupoids, Layer 0.1, is direct with degree
`n`, all of its morphisms are monomorphisms, and there are two morphisms `k ⟶ n` for `k < n`.

### Layer 8: non-singular presheaves on direct categories

8.1 **Non-singular presheaves** (convention 18), for any category `C`.
`Presheaf.IsNonsingular X ↔ Quiver.IsThin X.Elements`; for `[SmallCategory C]` and `X : Cᵒᵖ ⥤ Type u`,
`Presheaf.IsNonsingular X ↔ ∀ c x, Mono (yonedaEquiv.symm x)`. Every representable is non-singular
iff every morphism of `C` is a monomorphism (cf. Cisinski 2006, 8.2.2). Stability: a presheaf with a
morphism to a non-singular presheaf is non-singular (`Presheaf.IsNonsingular.of_hom`; in particular
subpresheaves, `Subfunctor`), coproducts, filtered colimits, and pushouts `X ⊔_A Y` along two
monomorphisms `A ⟶ X`, `A ⟶ Y`.

8.2 **Face posets.** For `[IsDirect C]` and `X` non-singular, the type `(c : C) × X.obj (op c)` with
`⟨c', x'⟩ ≤ ⟨c, x⟩ :↔ ∃ u : c' ⟶ c, X.map u.op x = x'` is a partial order (`Presheaf.FacePoset X`),
`X.Elements` is equivalent to `(Presheaf.FacePoset X)ᵒᵖ`, and `IsDirect (Presheaf.FacePoset X)`. The
canonical cocone exhibits `X` as the colimit of the representables over `Presheaf.FacePoset X`.
For `X : SSet` with `[X.Nonsingular]`, the non-degenerate simplices form a semi-simplicial set
(by `SSet.nonDegenerate_δ`), it is non-singular, and its face poset is order-isomorphic to `X.N`.
*Check:* for `C = SemiSimplexCategory` and `X` non-singular, an element `⟨⦋m⦌ₛ, x⟩` has `m + 1`
pairwise distinct vertices (its faces of dimension `0`), and `e ↦` (vertices of `e`) is an order
isomorphism from `{e // e ≤ ⟨⦋m⦌ₛ, x⟩}` onto the non-empty subsets of that vertex set.

8.3 **Discrete fibrations.** `Functor.IsDiscreteFibration` and `DiscreteFibration C`
(convention 18); the equivalence `(Cᵒᵖ ⥤ Type v) ≌ DiscreteFibration C` for `C : Type v` with
`[SmallCategory C]`, sending `X` to the projection from (the opposite of) `X.Elements`; it
restricts to an equivalence between non-singular presheaves and discrete fibrations whose source
is thin, and, for `[IsDirect C]`, whose source is a partial order. Monomorphisms of presheaves
correspond to functors over `C` injective on objects.

8.4 **Pinned posets.** For `[IsDirect C]` with every morphism a monomorphism: `Over c` is thin and
skeletal, order-isomorphic to the poset of subobjects of `yoneda.obj c` of the form
`Subobject.mk (yoneda.map u)`; a discrete fibration `p : K ⥤ C` from a partial order induces, for
each `ξ : K`, an order isomorphism between `{η // η ≤ ξ}` and `Over (p.obj ξ)` compatible with `p`;
and conversely a map `τ` from `K` to the objects of `C`, strictly monotone for the partial order
`c ≤ c' :↔ Nonempty (c ⟶ c')` on objects (antisymmetric because `C` is direct), with such
compatible isomorphisms `u_ξ` satisfying `u_ξ ∘ u_η = u_{u_ξ η}` comes from a unique discrete
fibration. The category of non-singular presheaves is thereby equivalent to the category of these
pinned posets, with type-preserving maps compatible with the pinnings as morphisms. Directness is
used only through skeletality and `IsDirect.eq_id_of_endo` (which also give the antisymmetry of
`c ≤ c'`): state 8.4 for a small skeletal `C` in which every endomorphism is the identity and every
morphism is a monomorphism, and derive the `[IsDirect C]` form; the ordered set `ℤ` of 6.1 satisfies
these hypotheses without being direct.

### Layer 9: derivators

- **Prederivators** (convention 9): morphisms (pseudonatural transformations), the represented
  prederivator `J ↦ (J ⥤ C)` (Groth 2013, Example 1.11: a derivator iff `C` is complete and
  cocomplete), the opposite prederivator (Definition 1.15), the shifted prederivator
  `D^M (J) := D(M × J)` with Theorem 1.31 (a derivator again), and the underlying diagram
  functors `D(J) → D(e)^J` and `D(J × K) → D(J)^K`.
- **Axioms and first consequences.** Der1–Der4, strong derivators; existence of initial and
  terminal objects in each `D(J)` (Proposition 1.12); homotopy Kan extensions (Definition 1.9).
- **Homotopy exact squares.** Define homotopy exact squares (Definition 1.21 and the
  Beck–Chevalley transformations of Lemmas 1.18–1.20); prove that adjunctions give homotopy exact
  squares (Lemma 1.23, Proposition 1.24); Kan extension along a fully faithful functor is fully
  faithful (Proposition 1.26, Lemma 1.27); along a cosieve `u_!` is fully faithful with essential
  image the diagrams initial off `u` and dually for sieves (Definition 1.28, Proposition 1.29);
  pullbacks along Grothendieck opfibrations are homotopy exact (Proposition 1.30).
- **(Co)Cartesian squares.** Definitions 3.9–3.10, the detection result Proposition 3.11,
  Proposition 3.13, and the pasting and cancellation law Proposition 3.14.
- **Pointed and stable derivators.** Pointed derivators (Definition 3.1, Propositions 3.2 and
  3.6, Lemma 3.7, Corollary 3.8: strongly pointed), extension by zero along sieves and cosieves,
  suspension and loops `(Σ, Ω)` (Definition 3.19, Proposition 3.20), cofibres (Definition 3.21,
  Propositions 3.23–3.25); stable derivators (Definition 4.1, Propositions 4.3–4.7,
  Corollary 4.8), additivity of `D(J)` (Corollary 4.14), and the canonical triangulated structure
  on every `D(J)` as a Mathlib `Pretriangulated` and `IsTriangulated` category (Theorem 4.15),
  compatible with restrictions and homotopy Kan extensions.
- **Examples.** The derivator `J ↦ Ho(M^J)` of a Mathlib model category `M` (Groth 2013,
  Theorem 1.38; Cisinski 2003); in particular the derivator `HOT := J ↦ Ho(Cat^J)` of Thomason's
  model structure (Layer 4). The derivator of a cofibration category is Layer 10.

### Layer 10: cofibration categories

- **Axioms** (convention 10) as a class over Mathlib's `CategoryWithCofibrations` and
  `CategoryWithWeakEquivalences`. Cofibrant objects, cofibrant replacement, and the full
  subcategory of cofibrant objects as a cofibration category.
- **Brown's factorization lemma.** Every map between cofibrant objects factors as a cofibration
  followed by a retraction of a trivial cofibration; consequently a functor sending trivial
  cofibrations between cofibrant objects to isomorphisms sends all weak equivalences between
  cofibrant objects to isomorphisms (Brown 1973, §1, Factorization lemma, dualized). Compare
  with Mathlib's `CofibrantBrownFactorization` on model categories.
- **The homotopy category.** The inclusion of cofibrant objects induces an equivalence of
  localizations, and every morphism of `Ho(C)` between cofibrant objects is a fraction
  `γ(s)⁻¹ γ(f)` with `s` a trivial cofibration.
- **Model categories.** The cofibrant objects of a Mathlib model category form a cofibration
  category.
- **Derivator.** A cofibration category is a right derivable category in the sense of
  Cisinski 2010, 2.22, and the prederivator `E ↦ Ho(C^E)` on finite direct categories `E`
  (`IsDirect` of 6.1, finite) is a weak right derivator of domain `Dir_f`
  satisfying Der5 (Cisinski 2010, Corollary 2.24, Definition A.5 dualized).

### Layer 11: gr-categories, crossed modules and Picard categories

- **Gr-categories** (convention 11): monoidal functors and monoidal natural transformations
  between them; `π₀`, `π₁`, the action, functoriality of these invariants; every gr-category is
  monoidally equivalent to a skeletal one and to a strict one (Baez–Lauda 2004,
  Propositions 39 and 45).
- **Classification** (Sính 1975; Baez–Lauda 2004, Theorem 43 and Corollary 44): monoidal
  equivalence classes of gr-categories are in bijection with isomorphism classes of
  quadruples `(G, M, action, k ∈ H³(G, M))`; monoidal functors between skeletal models correspond
  to `(φ, ψ, κ)` with `dκ = ψ k − k' φ`, and monoidal transformations to 1-cochains.
- **Crossed modules.** Define crossed modules of groups and their morphisms; prove the
  equivalence between crossed modules and strict 2-groups (group objects in groupoids,
  Brown–Spencer 1976); `π₀ = coker ∂`, `π₁ = ker ∂`, and the `k`-invariant of the associated
  gr-category.
- **Extensions with non-abelian kernel.** For groups `Q`, `N` and `ψ : Q →* Out N`, the
  obstruction in `H³(Q, Z(N))` vanishes iff an extension inducing `ψ` exists, and the extensions
  then form a torsor under `H²(Q, Z(N))` (Brown 1982, Chapter IV, §6). Identify the obstruction
  with the `k`-invariant of the gr-category pulled back from the crossed module
  `N → Aut N` along `ψ`.
- **Braided and Picard categories.** Braided gr-categories are classified by
  `(π₀, π₁, q)` with `q(x) = β_{x,x}` a quadratic map (Joyal–Street 1993, §3); for Picard
  categories the sign `ε` is a homomorphism killed by `2` and Picard categories are classified
  by `(π₀, π₁, ε)` (Sính 1975, Chapter II, §2; Johnson–Osorno 2012, Proposition 2.5 and
  Corollary 2.8). A Picard category is strictly commutative iff `ε = 0`.
- **Deligne over a point.** Every strictly commutative Picard category is equivalent to
  `ch(d)` (convention 13), and `d ↦ ch(d)` induces an equivalence between the full subcategory of
  `DerivedCategory (ModuleCat ℤ)` of complexes with cohomology in degrees `-1, 0` and the
  category of strictly commutative Picard categories with isomorphism classes of symmetric
  monoidal functors (Deligne, SGA 4 XVIII, 1.4.15, for the punctual site). Over a point, every
  strictly commutative Picard category is equivalent to `ch(0 : π₁ → π₀)`.
- **Topological realizations.** For a topological group `G`, the fundamental groupoid of `G`
  (Mathlib `FundamentalGroupoid`) is a group object in groupoids, hence a crossed module
  (Brown–Spencer 1976), with `π₀ = π₀(G)`, `π₁ = π₁(G, 1)` and the action of `π₀(G)` induced by
  conjugation. For a pointed space `(X, x)`, the fundamental groupoid of the loop space
  `Path x x` with concatenation is a gr-category `Π₂(X, x)` with `π₀ ≅ π₁(X, x)` and
  `π₁ ≅ π₂(X, x)` (through Tau Ceti's loop-space identification), and the action is the
  standard action of `π₁` on `π₂`.

### Layer 12: Picard stacks over a site

- **Picard stacks.** For a small site `(C, J)`, a Picard stack is a
  `F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat` with `F.IsStack J`, groupoid values, a Picard structure on each
  value (convention 12) and symmetric monoidal restriction functors with coherent structure
  isomorphisms; morphisms are pseudonatural transformations that are symmetric monoidal
  objectwise. Gr-stacks are the same without symmetry. Define `π₀` (the sheafification of the
  presheaf of `π₀`) and `π₁` (the sheaf `Aut(𝟙)`) as abelian sheaves.
- **Deligne's construction.** For a complex `d : K⁻¹ ⟶ K⁰` of sheaves of abelian groups on
  `(C, J)`, `ch(d)` is `Stack.stackification J` (SchemeAndStackFoundations §1.18) of the prestack
  `U ↦ ch(d(U))`, with its induced strictly commutative Picard structure.
- **Deligne's theorem** (SGA 4 XVIII, 1.4.15): every strictly commutative Picard stack is
  equivalent to some `ch(d)`, and `ch` induces an equivalence between the full subcategory of
  `DerivedCategory (Sheaf J AddCommGrpCat)` of complexes with cohomology in degrees `-1, 0` and
  the category of strictly commutative Picard stacks with isomorphism classes of morphisms.
  Consequences: `π₀ ch(d) ≅ H⁰`, `π₁ ch(d) ≅ H⁻¹`, and the equivalence classes of strictly
  commutative Picard stacks equipped with isomorphisms `π₀ ≅ M`, `π₁ ≅ N` are in bijection with
  `Ext²(M, N)` computed in `Sheaf J AddCommGrpCat`.

## Dependency order

Layer 0 is foundational and uses Mathlib only. Layer 1 uses Layer 0 for its examples. Layer 2
uses Layer 1. Layer 3 uses Layers 1–2 and the Kan–Quillen model structure of
GeneralizedCohomology. Layer 4 uses Layer 3. Layer 5 uses Layers 2–3. Layer 6 uses Mathlib's
`ReedyStructure` only. Layer 7 uses Layer 6, and GrothendieckInfinityGroupoids' globe category
for 7.6. Layer 8 uses Layers 6–7 and Mathlib's `SSet.Nonsingular`. Layer 9 uses Mathlib's model
categories and Layer 4 for the example `HOT`. Layer 10 uses Layer 9 and Layer 6's `IsDirect`.
Layer 11 uses Mathlib, Tau Ceti's homotopy groups and Layer 0. Layer 12 uses Layer 11 and
SchemeAndStackFoundations' `Stack.stackification`. Layers 6–8 use none of Layers 0–5 and can
start at once; Layers 0–2, 9 and 11 can proceed in parallel once Layer 0's fundamental
groupoid exists.

## Provenance

This roadmap was written from the needs of the Grothendieck edition of the Montpellier fonds,
whose Lean files contain hand-built fragments of Layers 0, 1, 6–8 and 10: fundamental localizers,
`W₀`, `W₋₁`, the trivial localizer and the minimal one as an intersection (folder 114); the
1-truncated model of weak equivalences of action groupoids (folder 118); Baues' axioms C1–C3,
cofibrant replacement and Brown's factorization (folder 106); direct categories of models and
non-singular presheaves (folders 104 and 76, detailed below); relative square rectification in a
model category (folder 107). Those files are not prescriptive; the specification above is.

Existing formalizations of Layers 6–8 to port or consult (cited sources, not specifications):

- Michel Hua, leanprover-community/mathlib4#44731 (`Mathlib/AlgebraicTopology/Reedy/Direct.lean`):
  `ReedyStructure.ofWellFounded` (the rank as an `Ordinal`-valued direct degree), `wellFounded`,
  `eq_id_of_endo` and the `Unique ((identities C).MapFactorizationData ⊤ f)` instance — 6.1–6.2.
- Michel Hua, leanprover-community/mathlib4#44732 (`Mathlib/AlgebraicTopology/Reedy/SemiSimplexCategory.lean`):
  a direct structure on `SemiSimplexCategory` with degree `len` built directly; 7.4 obtains it
  from the Reedy structure of `Δ` by restriction to monomorphisms instead.
- [`lean/Grothendieck/Folder104.lean`](https://github.com/Commutator-IO/grothendieck-project/blob/main/lean/Grothendieck/Folder104.lean)
  (CC0), from a reading of folder 104 of the Grothendieck fonds (Montpellier): `reedyDirecte`,
  `wf_of_degre`, `entiers_relatifs_non_directe` (Layer 6), `DeltaInj` with `δ_comp_δ` and
  `factorise_face` (7.4), `card_I_cube` and `somme_faces_cube` (7.5); `nonSingulier_of_hom`,
  `admissible_coproduit` and `admissible_pushout` (8.1, with `admissible_iff` identifying its
  « admissible » presheaves with the non-singular ones), `mono_iff_injective_versEpingle` (8.3), and
  the pinned-poset equivalence `equivalence_page13` (8.4), proved for a small skeletal category
  whose morphisms are monomorphisms and whose endomorphisms are identities, with no
  well-foundedness hypothesis.
- [`lean/Grothendieck/Folder76.lean`](https://github.com/Commutator-IO/grothendieck-project/blob/main/lean/Grothendieck/Folder76.lean)
  (CC0), namespace `Grothendieck.Folder76.Sommets`, for non-singular semi-simplicial sets given
  explicitly (`NonSingular`): `NonSingular.vertex_inj` and `NonSingular.isFlagGeom`, the Check of
  8.2.

## References

- D.-C. Cisinski, « Le localisateur fondamental minimal », *Cahiers Top. Géom. Diff. Catég.*
  45 (2004), 109–140: 1.1.1 (FS1–FS3), Definition 1.1.3 (LF1–LF3), Remark 1.1.4,
  Propositions 1.1.5, 1.1.7, 1.1.9, 1.1.13, Corollaries 1.1.10, 1.1.11, Proposition 1.2.4,
  Lemma 1.3.6, Theorem 1.3.10, Theorems 2.1.5, 2.1.13, Lemmas 2.2.2, 2.2.6, 2.2.8,
  Propositions 2.2.3, 2.2.9, Corollary 2.2.4, Remark 2.2.5, Theorem 2.2.11, 2.3.1,
  Theorem 2.3.2, Corollary 2.3.3, Theorem 2.3.6.
- D.-C. Cisinski, *Les préfaisceaux comme modèles des types d'homotopie*, Astérisque 308
  (2006), Zbl 1111.18008: Corollary 8.4.13 and Proposition 8.4.27 (the cube category is a test
  category); §8.2 (8.2.2, representables and monomorphisms).
- E. Riehl and D. Verity, *The theory and practice of Reedy categories*, Theory Appl. Categ. 29
  (2014), 256–301, Zbl 1302.55014, [arXiv:1304.6871](https://arxiv.org/abs/1304.6871). Item
  numbers cited in Layers 6–7 (2.3–2.7) are those of the arXiv version.
- D.-C. Cisinski, « Images directes cohomologiques dans les catégories de modèles », *Ann.
  Math. Blaise Pascal* 10 (2003), 195–244 (the derivator of a model category).
- D.-C. Cisinski, « Catégories dérivables », *Bull. SMF* 138 (2010), 317–393: 1.1 (axioms
  D0–D4), 2.1 (`Dir_f`), Theorem 2.21, 2.22, Corollary 2.24, Definition A.5.
- G. Maltsiniotis, *La théorie de l'homotopie de Grothendieck*, Astérisque 301 (2005):
  Propositions 1.6.1, 1.6.8, 1.6.13, 2.1.3.
- G. Maltsiniotis, « La catégorie cubique avec connexions est une catégorie test stricte »,
  *Homology Homotopy Appl.* 11 (2009), 309–326: §1.1–1.2 (cube categories), §2 (test
  categories recalled: 2.1–2.5, Theorem 2.6), §3, §5.
- A. Grothendieck, *Pursuing Stacks* (ed. G. Maltsiniotis, Documents Mathématiques 20, SMF,
  2022), and *Les Dérivateurs* (ed. M. Künzer, J. Malgoire, G. Maltsiniotis).
- D. Quillen, « Higher algebraic K-theory I », LNM 341 (1973), §1, Theorems A and B.
- R. W. Thomason, « Cat as a closed model category », *Cahiers Top. Géom. Diff.* 21 (1980),
  305–324: Definitions 2.1–2.3, 4.1, Propositions 4.2, 4.3, Corollary 4.4, Theorem 4.9,
  Corollary 5.5, Proposition 5.7.
- M. Groth, « Derivators, pointed derivators and stable derivators », *Algebr. Geom. Topol.* 13
  (2013), 313–374 (arXiv:1112.3840): Definitions 1.1, 1.9, 1.10, 1.13, 1.15, 1.21, 1.28, 3.1,
  3.4, 3.9, 3.10, 3.19, 3.21, 4.1; Example 1.11; Lemmas 1.18–1.20, 1.23, 1.27, 3.7;
  Propositions 1.12, 1.24, 1.26, 1.29, 1.30, 3.2, 3.6, 3.11, 3.13, 3.14, 3.20, 3.23–3.25,
  4.3–4.7; Theorems 1.31, 1.38, 4.15; Corollaries 3.8, 4.8, 4.14.
- H.-J. Baues, *Algebraic Homotopy*, Cambridge Studies in Adv. Math. 15 (1989), Chapter I,
  (1.1) (cofibration categories).
- K. S. Brown, « Abstract homotopy theory and generalized sheaf cohomology », *Trans. AMS* 186
  (1973), 419–458, §1 (factorization lemma).
- R. Brown, « Fibrations of groupoids », *J. Algebra* 15 (1970), 103–132; R. Brown,
  P. R. Heath, K. H. Kamps, « Groupoids and the Mayer–Vietoris sequence », *J. Pure Appl.
  Algebra* 30 (1983), 109–129: sequence (1.1), Theorem 2.2, Corollaries 2.4, 2.5.
- R. Brown, C. B. Spencer, « G-groupoids, crossed modules and the fundamental groupoid of a
  topological group », *Indag. Math.* 38 (1976), 296–302.
- K. S. Brown, *Cohomology of Groups*, GTM 87 (1982), Chapter IV, §6.
- Hoàng Xuân Sính, *Gr-catégories*, thèse, Université Paris VII (1975), Chapter II.
- J. C. Baez, A. D. Lauda, « Higher-dimensional algebra V: 2-groups », *Theory Appl. Categ.* 12
  (2004), 423–491 (arXiv:math/0307200): Propositions 39, 42, 45, Theorem 43, Corollary 44.
- A. Joyal, R. Street, « Braided tensor categories », *Adv. Math.* 102 (1993), 20–78, §3.
- N. Johnson, A. M. Osorno, « Modeling stable one-types », *Theory Appl. Categ.* 26 (2012),
  520–537 (arXiv:1201.2686): Definitions 2.3–2.4, Proposition 2.5, Corollary 2.8.
- P. Deligne, « La formule de dualité globale », SGA 4, Exposé XVIII, LNM 305 (1973), §1.4
  (strictly commutative Picard stacks), Proposition 1.4.15.
