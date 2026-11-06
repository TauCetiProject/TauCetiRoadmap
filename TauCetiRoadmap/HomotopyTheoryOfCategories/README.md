# Roadmap: homotopy theory of small categories

**Summary.** Build the homotopy theory of small categories in the form Grothendieck gave it in
*Pursuing Stacks* and *Les Dérivateurs*, with its 1-truncated algebraic shadow. The carriers are
Mathlib's `Cat.{u, u}`, classes of functors `W : MorphismProperty Cat.{u, u}`, presheaf categories
`Aᵒᵖ ⥤ Type u` on a small category `A`, Mathlib's `FreeGroupoid`, `ConnectedComponents`,
`HomotopicalAlgebra.ReedyStructure`, `Pseudofunctor`, `MonoidalCategory` and
`SymmetricCategory`, and the predicates and structures defined here. The end theorems are: for
every adjunction `L ⊣ R`, an equivalence between the objects where the unit is invertible and the
objects where the counit is invertible, and Beck's theorem as an equivalence of conditions; the
exact sequence of a fibration of groupoids; for every basic localizer `W`, Quillen's Theorem A
(every `W`-aspherical functor is in `W`); that `W₀`, `W₁`, `W₋₁` and, for every abelian group `M`,
the class of functors inducing isomorphisms on the simplicial homology of nerves with
coefficients in `M`, are basic localizers; Cisinski's characterization: a basic localizer
`W ⊆ W₀` in which every `W`-locally constant functor in `W` is `W`-aspherical is the minimal basic
localizer `W∞`, which is the class of functors whose nerve is a simplicial weak equivalence; the
cobase change of a Dwyer map is a Dwyer map, and Thomason's model structure on `Cat`; `Δ` is a
strict test category for `W∞`; direct categories are those with a direct Reedy structure with
ordinal degrees, and with `ℕ`-valued degrees exactly when every rank is finite; non-singular
presheaves are those with a thin category of elements; Groth's stable derivators carry a canonical
triangulated structure; Brown's factorization lemma in a cofibration category; Sính's
classification of gr-categories by `(π₀, π₁, k)`; and Deligne's equivalence between strictly
commutative Picard stacks on a small site and complexes of abelian sheaves in degrees `[-1, 0]`.

Suggested homes: `TauCeti/CategoryTheory/Adjunction/Idempotent.lean`,
`TauCeti/CategoryTheory/Idempotents/AdditiveFunctors.lean` and
`TauCeti/CategoryTheory/Monad/MonadicityIff.lean` (Layer 0), `TauCeti/CategoryTheory/Groupoid/`
(Layer 1), `TauCeti/CategoryTheory/Localizer/` (Layers 2–4), `TauCeti/AlgebraicTopology/Thomason/`
(Layer 5), `TauCeti/AlgebraicTopology/TestCategory/` (Layer 6), `TauCeti/AlgebraicTopology/Reedy/`
(Layers 7–8), `TauCeti/CategoryTheory/Presheaf/Nonsingular.lean` (Layer 9),
`TauCeti/CategoryTheory/Derivator/` (Layer 10), `TauCeti/AlgebraicTopology/CofibrationCategory/`
(Layer 11), `TauCeti/CategoryTheory/GrCategory/` (Layer 12) and
`TauCeti/CategoryTheory/Sites/PicardStack/` (Layer 13).

## Scope and ownership

**Owned here.** For small categories in a fixed universe `u`: idempotent adjunctions, additive
functors on a Karoubi envelope and Beck's theorem as a characterization (Layer 0, for arbitrary
categories); the classes `W₀` and `W₁`, fibrations of groupoids and their exact sequences
(Layer 1); basic localizers, asphericity, Theorem A for an arbitrary basic localizer and `W∞`
(Layer 2); the functors `i_A`, `i_A^*` and weak equivalences of presheaves (Layer 3); Thomason
equivalences, the homological localizers and the categorical consequences of Theorem B (Layer 4);
Dwyer maps and Thomason's model structure (Layer 5); test categories (Layer 6); direct and inverse
categories on Mathlib's `ReedyStructure` and their examples (Layers 7–8, for arbitrary
categories); non-singular presheaves and discrete fibrations (Layer 9); derivators (Layer 10);
cofibration categories in Baues' sense (Layer 11); gr-categories, the monoidal and classifying
part of crossed modules, extensions with non-abelian kernel, the sign of a Picard groupoid and
two-term complexes (Layer 12); Picard stacks over a small site (Layer 13). A search of main and
of the open roadmap pull requests for basic localizers, test categories, derivators, gr-categories
and direct categories finds no other owner.

**Left to other roadmaps.**

| Material | Owner | Use here |
| --- | --- | --- |
| Kan–Quillen model structure on `SSet`, simplicial weak equivalences | GeneralizedCohomology, G2 item 1 | Layers 4–5 |
| Classifying spaces of small categories, homotopy colimits and Thomason's comparison, Quillen's Theorem B, the homology spectral sequence of a functor | StableHomotopyKTheory, §§1.21, 2.26, 2.29, 2.30, 2.34 | Layer 4 |
| The generic `PicardGroupoid` and the graded Picard groupoids of schemes | SchemeAndStackFoundations, §3.4 | Layer 12 |
| `CrossedModule` with its quotient groupoid, `coker ∂` and `ker ∂` | SchemeAndStackFoundations, §1.24 | Layer 12 |
| The site-level `Stack.stackification` | SchemeAndStackFoundations, §1.18 | Layer 13 |
| The Picard stack, gerbes and Abel maps of a curve | SchemeAndStackFoundations, §3.7 | not used |
| The globe category `Globe`, globular sets, Grothendieck ∞-groupoids | GrothendieckInfinityGroupoids, 0.1 | 8.6 |
| The simplex Reedy structure from the epi–mono factorization; latching and matching objects, the Reedy model structure, Bergner and Joyal model structures | BordismFormalGroups, F6.5 | 8.3 |
| Homotopy groups of spaces, Hurewicz and Whitehead theorems | AlgebraicTopology, Stage 8 | not used |
| `K(G, 1)` spaces and group cohomology of classifying spaces | ClassifyingSpaces | not used |
| Grothendieck topoi, their points and morphisms, the classifying topos of a group | GrothendieckTopoi | not used |
| Quillen exact categories and Grothendieck groups | GrothendieckEulerForms | not used |

The boundary in one sentence: if a statement is about small categories up to a class of weak
equivalences defined categorically or through nerves, about presheaves on a small category,
diagrams in a derivator, direct categories, non-singular presheaves or monoidal groupoids, it is
here; if it passes through the topological realisation of a nerve, is about simplicial sets or
spaces alone, about the Reedy model structure, about topoi, or about stacks on schemes, it belongs
to the owner named above. Sites appear here only as bases of coefficient stacks (Layer 13).

**Out of scope.** Generalized, elegant and Eilenberg–Zilber Reedy categories; weighted
(co)limits and skeletal filtrations; geometric realisation of non-singular presheaves; regular CW
complexes.

## Conventions

1. **Small categories.** A small category is an object of `Cat.{u, u}`; for `F : A ⥤ B` between
   small categories write `W F` for `W F.toCatHom`. The point is `e := Discrete PUnit` and `A → e`
   is `Functor.star A`. Witness: `Cat.of (Discrete PUnit.{u + 1})` is a terminal object of
   `Cat.{u, u}`, and for `A = [1]` the functor `Functor.star A` sends both objects to `⟨⟨⟩⟩`.
2. **Slices.** For `F : A ⥤ B` and `b : B`, `A/b := CostructuredArrow F b` and
   `b\A := StructuredArrow b F`; the comparison `A/c ⥤ B/c` over `G : B ⥤ C` is
   `CostructuredArrow.pre F G c`. Witness: for `F : e ⥤ [1]` picking `1`, `A/0` is empty and
   `A/1` has one object, while `0\A` and `1\A` both have one object. A **sieve** of `B` is a full
   subcategory such that `b ⟶ b'` with `b'` in it forces `b` in it; a **cosieve** is the dual
   (Groth 2013, Definition 1.28).
3. **Basic localizers** (Cisinski 2004, 1.1.1 and Definition 1.1.3): `W` contains the identities
   (FS1), has two-out-of-three (FS2), and for `i ≫ r = 𝟙` with `W (r ≫ i)` has `W r` (FS3); every
   small category with a terminal object is `W`-aspherical (LF2); if every
   `CostructuredArrow.pre F G c` is in `W`, then `F` is (LF3). `A` is `W`-aspherical if
   `W (Functor.star A)`; `F` is `W`-aspherical if every `A/b` is. Witness: in 2.1.
4. **The minimal localizer.** `W∞` is the intersection of all basic localizers. **Thomason
   equivalences** `W_N` are the `F` with `nerveMap F` a simplicial weak equivalence of
   GeneralizedCohomology G2 item 1. Their equality is a theorem (4.2), not a definition.
5. **Fundamental groupoid.** `Π₁ A := FreeGroupoid A`, Mathlib's free groupoid, the localization
   at all morphisms; `Π₁ F := FreeGroupoid.map F`. Witness: `Π₁ [1]` is the indiscrete groupoid on
   two objects, and `Π₁` of the one-object category of the monoid `ℕ` has automorphism group `ℤ`.
6. **Presheaves.** `Â := Aᵒᵖ ⥤ Type u`; `i_A X := CostructuredArrow yoneda X`, and
   `i_A^* C := (a ↦ (Over a ⥤ C))`; `W_Â := i_A⁻¹ W`. A presheaf is `W`-aspherical if `i_A X` is.
   Witness: for `A = [1]`, `i_A^* [1]` has two elements over `0` and three over `1` (3.1).
7. **Test categories** follow Maltsiniotis 2009, §2.3, for a basic localizer `W`; the named
   theorems of Layer 6 are for `W = W∞`.
8. **Cube categories.** `□` and `□_c` are the subcategories of partial orders on the `{0 < 1}ⁿ`,
   `n ≥ 0`, generated by faces and degeneracies, respectively by these and the connections, as in
   Maltsiniotis 2009, §1.1.
9. **Derivators.** A prederivator is a pseudofunctor `D : (Cat.{w, w})ᵒᵖ ⥤ᵖ Cat.{v₁, u₁}`, the
   opposite reversing 1-cells only (Groth 2013, Definition 1.1, with "strict" relaxed to
   "pseudo"); `F^* := D(F)`. Der1–Der4 are those of Groth 2013, Definition 1.10. Witness: in 10.1.
10. **Cofibration categories** are Baues' axioms C1–C3 without his axiom C4 on fibrant models
    (Baues 1989, Chapter I, (1.1)), on a category with an initial object; nothing in Layer 11
    uses C4.
11. **Gr-categories** are monoidal groupoids in which every object `X` has some `Y` with
    `X ⊗ Y ≅ 𝟙_`. `π₀ C := Skeleton C` with Mathlib's `Skeleton.instMonoid`; `π₁ C := Aut (𝟙_ C)`.
    For `a ∈ π₁` and an object `X`, let `L_X a := λ_X⁻¹ ≫ (a ▷ X) ≫ λ_X` and
    `R_X a := ρ_X⁻¹ ≫ (X ◁ a) ≫ ρ_X`, both in `Aut X`; `X` acts on `π₁` by `a ↦ R_X⁻¹ (L_X a)`.
    The `k`-invariant is the class in `groupCohomology` of degree 3 of the normalized 3-cocycle of
    the associator of a skeletal model (Baez–Lauda 2004, Theorem 43). Witness: in 12.1.
12. **Picard groupoids** are SchemeAndStackFoundations §3.4's `PicardGroupoid C`, with its `pi0`
    and `pi1`, the carriers of convention 11. The **sign** `ε(X) ∈ π₁` is `β_{X,X}` transported
    to `Aut (𝟙_)`. **Strictly commutative** means `β_{X,X} = 𝟙` for every `X` (Deligne, SGA 4
    XVIII, §1.4), a property, never part of the definition. Witness: in 12.5.
13. **Two-term complexes** are additive maps `d : K⁻¹ →+ K⁰` in degrees `-1, 0`; `ch(d)` has
    objects `K⁰`, morphisms `x ⟶ y` the `k : K⁻¹` with `x + d k = y`, tensor `+` and identity
    symmetry. Witness: for `d = 0 : ℤ →+ ℤ`, every object has automorphism group `ℤ`.
14. **Fibrations of groupoids** are star-surjective functors (Brown–Heath–Kamps 1983, §2), stated
    with Mathlib's `Functor.IsHomLift`; fibres are Mathlib's `Functor.Fiber`.
15. **Reedy structures are Mathlib's** `ReedyStructure W₁ W₂ α`: `W₁` lowers the degree, `W₂`
    raises it, and the factorization is a `W₁`-morphism followed by a `W₂`-morphism. Witness: for
    `Δ`, `W₁` is the epimorphisms, and `[2] → [2]`, `(0, 1, 2) ↦ (0, 0, 2)`, factors through `[1]`.
16. **Direct and inverse.** `DirectRel C X Y` says there is a non-identity `X ⟶ Y`; `IsDirect C`
    is its well-foundedness, `IsInverse C` that of `Cᵒᵖ`. A direct Reedy structure is a
    `ReedyStructure (identities C) ⊤ α`. Witness: `ℕ` is direct and not inverse.
17. **Products** of Reedy structures have `ℕ`-valued degrees with `deg (c, d) = deg c + deg d`.
18. **Non-singular presheaves and discrete fibrations** are as in 9.1 and 9.3.

## Exact supplier contracts

**From Mathlib** (at the pins).

- `Cat`, `Cat.of`, `Functor.toCatHom`, `Functor.star`, `MorphismProperty` with
  `ContainsIdentities`, `HasTwoOutOfThreeProperty`, `inverseImage`, `IsMultiplicative`,
  `Localization`, `Q`, `Localization.Construction.lift`, `Localization.inverts`.
- `CostructuredArrow`, `CostructuredArrow.pre`, `CostructuredArrow.map`,
  `CostructuredArrow.functor`, `CostructuredArrow.hasTerminal`, `StructuredArrow`, `Over`,
  `Over.map`, `Over.mapFunctor`, `Functor.Elements`, `Functor.Elements.π`,
  `costructuredArrowYonedaEquivalence`, `yoneda`, `yonedaEquiv`, `Functor.whiskeringLeft`.
- `FreeGroupoid`, `FreeGroupoid.of`, `FreeGroupoid.lift`, `FreeGroupoid.map`,
  `ConnectedComponents`, `Functor.mapConnectedComponents`, `Functor.mapAut`, `Groupoid`, `Aut`,
  `Functor.Fiber`, `Functor.Fiber.fiberInclusion`, `Functor.IsHomLift`, `CategoricalPullback`,
  `ActionCategory`, `ActionCategory.stabilizerIsoEnd`, `SingleObj`.
- `Adjunction`, `Adjunction.left_triangle_components`, `ObjectProperty.FullSubcategory`,
  `ObjectProperty.lift`, `ObjectProperty.ι`, `Reflective`, `Coreflective`, `Idempotents.Karoubi`,
  `Idempotents.toKaroubi`, `IsIdempotentComplete`, `karoubiUniversal`, `Functor.Additive`,
  `AdditiveFunctor`, `additiveFunctor`, `Monad.comparison`, `Comonad.comparison`,
  `MonadicRightAdjoint`, `ComonadicLeftAdjoint`, `Functor.IsSplitPair`, `Functor.IsCosplitPair`,
  `Monad.monadicOfHasPreservesGSplitCoequalizersOfReflectsIsomorphisms`.
- `nerve`, `nerveMap`, `SSet.homologyMap`, `SSet.sd`, `SSet.ex`, `SSet.hoFunctor`,
  `AddCommGrpCat`, `SimplexCategory`, `AsSmall`, `SemiSimplexCategory`, `SSet.Nonsingular`,
  `SSet.N`, `IsPushout`, `HasTerminal`, `PreservesLimit`.
- `HomotopicalAlgebra.ReedyStructure` with `deg`, `ReedyStructure.op`, `WideSubcategory`,
  `MorphismProperty.identities`, `WellFounded.rank`, `Ordinal.omega0`, `LocallyFiniteOrderBot`,
  `Finset.Iio`, `Quiver.IsThin`, `Skeletal`, `WalkingParallelPair`, `WalkingSpan`.
- `Pseudofunctor`, `Bicategory.Opposite`, `LocallyDiscrete`, `Pseudofunctor.IsStack`,
  `HomotopicalAlgebra.ModelCategory`, `CategoryWithCofibrations`,
  `CategoryWithWeakEquivalences`, `CofibrantBrownFactorization`.
- `MonoidalCategory`, `SymmetricCategory`, `Skeleton`, `Skeleton.instMonoid`, `groupCohomology`,
  `Rep`, `DerivedCategory`, `Pretriangulated`, `Sheaf`, `GrothendieckTopology`,
  `FundamentalGroupoid`, `HomotopyGroup`, `IsTopologicalGroup`.

**From Tau Ceti.** `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`:
`HomotopyGroup.loopSpaceMulEquiv` and `zerothHomotopyLoopSpaceEquivFundamentalGroup`, for 12.7.

**From GeneralizedCohomology.** G2 item 1: the Kan–Quillen model structure on `SSet` and the
simplicial weak equivalences (realization inducing a bijection on components and isomorphisms on
all homotopy groups), for 4.1, 4.2, 4.5, 4.6 and Layer 5.

**From StableHomotopyKTheory.** §2.26 (objectwise weak equivalences induce weak equivalences of
homotopy colimits) and §2.29 (Thomason's homotopy-colimit comparison, `hocolim B(Fc) → B(∫F)` a
weak equivalence), for 4.1; §1.21 (`π₁` of `BC` is the automorphism group in `C[C⁻¹]`), for 4.6;
§2.34, `quillenTheoremB` (the comma comparison into
the homotopy fibre is a weak equivalence when every `d → d′` induces a homotopy equivalence), for
4.4; §2.30, the homology spectral sequence of a functor, for 4.3.

**From SchemeAndStackFoundations.** §1.18, `Stack.stackification` for an arbitrary small site, for
13.2; §1.24, `CrossedModule Ht H` with `.quotientCategory`, `.isGroupoid`, `.isoClasses`
(`coker ∂`) and `.aut` (`ker ∂`), `H` acting on `H̃`, for 12.3; §3.4, `PicardGroupoid C` with
`pi0`, `pi1` and `gradedPicardGroupoid`, for 12.5, 12.6 and Layer 13.

**From GrothendieckInfinityGroupoids.** 0.1, the globe category `Globe` with its `Category`
instance, for 8.6.

**From BordismFormalGroups.** F6.5, the simplex Reedy structure on `SimplexCategory` built from
the native epi–mono factorization under Mathlib's name and statement, for 8.3 and 8.4.

Neither pin has basic localizers, test categories, idempotent adjunctions, direct categories,
non-singular presheaves on a general category, discrete fibrations, derivator axioms, cofibration
categories in Baues' sense, gr-categories or Picard stacks.

## How to read the build

Layer 0 is general category theory on Mathlib and is used by Layer 10. Layer 1 builds `W₀`, `W₁` and
fibrations of groupoids on Mathlib's free groupoid. Layer 2 defines basic localizers and proves
Theorem A intrinsically; its examples are `W₀`, `W₋₁` and `⊤`. Layer 3 adds presheaves and the
adjunction `i_A ⊣ i_A^*`. Layer 4 consumes GeneralizedCohomology's simplicial weak equivalences,
StableHomotopyKTheory's homotopy colimits and Theorem B to identify `W∞` with the Thomason
equivalences and to characterize it, and proves that `W₁` is a basic localizer. Layer 5 builds
Thomason's model structure on Layer 4. Layer 6 defines test categories on Layers 3–4. Layers 7–9
(direct categories, their examples, non-singular presheaves) use Mathlib's `ReedyStructure` and none
of Layers 1–6. Layer 10 builds derivators, Layer 11 cofibration categories with their derivator on
Layer 7's direct categories. Layer 12 builds gr-categories and Picard groupoids on
SchemeAndStackFoundations §§1.24 and 3.4, and Layer 13 Picard stacks on Layer 12 and
SchemeAndStackFoundations §1.18.

## Layer 0: categorical prerequisites

### 0.1 Idempotent adjunctions and fixed subcategories

For `adj : L ⊣ R` with unit `η` and counit `ε`, prove `Adjunction.idempotent_tfae`: the four
conditions `ηR`, `Rε`, `εL`, `Lη` invertible are equivalent; an adjunction satisfying them is
*idempotent* (Borceux, *Handbook* 1, Proposition 3.4.1). Define `Adjunction.fixedLeft`, the
objects where `η` is invertible, and `Adjunction.fixedRight`, the objects where `ε` is invertible;
prove that both are closed under isomorphisms, that `L` sends `fixedLeft` into `fixedRight` and
`R` sends `fixedRight` into `fixedLeft`, and that an object is in `fixedRight` iff it is
isomorphic to `L X` with `X` in `fixedLeft`. For **every** adjunction, prove
`Adjunction.isEquivalence_fixedLeftToFixedRight`: the restriction
`Adjunction.fixedLeftToFixedRight` of `L` is an equivalence, with quasi-inverse the restriction
of `R` and unit and counit those of `adj`. For an idempotent adjunction, prove
`Adjunction.nonempty_reflective_fixedLeft` (reflector `L ⋙ R`) and
`Adjunction.nonempty_coreflective_fixedRight` (coreflector `R ⋙ L`). When `η` is an isomorphism
(`L` fully faithful) the adjunction is idempotent and the essential image of `L` is `fixedRight`;
10.3 uses this for Kan extensions along fully faithful functors.
*Needs:* Mathlib `Adjunction`, `Adjunction.left_triangle_components`, `ObjectProperty.lift`,
`Reflective`, `Coreflective`.

**Checks.**

- For the diagonal `Δ : Type u ⥤ Type u × Type u`, left adjoint to the product, the unit is the
  diagonal `X → X × X`, invertible iff `X` has at most one element, and the counit at `(A, B)` is
  the pair of projections, invertible iff `A` and `B` are both empty or both singletons. So
  `fixedLeft` is the sets with at most one element and `fixedRight` the pairs `(∅, ∅)` and
  `(1, 1)`, and `L` restricts to an equivalence; yet `ηR` fails at `(Bool, PUnit)`, since
  `Bool × PUnit → (Bool × PUnit)²` is not bijective. The equivalence needs no idempotence.
- For abelianization `L : Grp ⥤ Ab` left adjoint to the inclusion, `η_G : G → G^ab` is invertible
  iff `G` is abelian (`S₃ → ℤ/2` is not) and `ε` is invertible everywhere: the adjunction is
  idempotent, `fixedLeft` is the abelian groups and is reflective.
- For the free abelian group functor left adjoint to the forgetful functor `Ab ⥤ Type u`, the unit
  `X → ℤ^(X)` is never bijective (`0` is not a generator, and `∅ → {0}`), so `fixedLeft` is empty,
  while the essential image of `L` is the free abelian groups: `fixedRight` is not the essential
  image of `L` unless `η` is invertible.

### 0.2 Additive functors on a Karoubi envelope

For preadditive `C` and `D`, prove `Idempotents.additive_iff_toKaroubi_comp`: `F : Karoubi C ⥤ D`
is additive iff `toKaroubi C ⋙ F` is. Define `Idempotents.whiskeringLeftToKaroubiAdditive`,
precomposition with `toKaroubi C` from `Karoubi C ⥤+ D` to `C ⥤+ D`, and prove
`Idempotents.full_whiskeringLeftToKaroubiAdditive`,
`Idempotents.faithful_whiskeringLeftToKaroubiAdditive` and, when `D` is idempotent complete,
`Idempotents.isEquivalence_whiskeringLeftToKaroubiAdditive`, the additive form of Mathlib's
`karoubiUniversal`. Every morphism of `Karoubi C` is the composite of an inclusion, a morphism of
`C` and a projection, which reduces additivity on `Karoubi C` to additivity on `C`.
*Needs:* Mathlib `Idempotents.Karoubi`, `Idempotents.toKaroubi`, `IsIdempotentComplete`,
`karoubiUniversal`, `AdditiveFunctor`, `additiveFunctor`.

**Checks.**

- Let `C` have one object `★` with endomorphism ring `ℤ × ℤ`. `Karoubi C` has, up to
  isomorphism, the four objects `(★, e)` for the idempotents `e = 0, (1, 0), (0, 1), 1`, and
  `(★, 0)` is a zero object. Additive functors `C ⥤ Ab` are `ℤ × ℤ`-modules `M`, and the extension
  of `M = ℤ × ℤ` sends `(★, (1, 0))` to `ℤ × 0`, of rank one.
- Idempotent completeness of `D` is needed: with `D = C` as above, the identity `C ⥤ C` has no
  additive extension to `Karoubi C`. It would send the splitting `e = p ≫ i`, `i ≫ p = 𝟙`, of
  `e = (1, 0)` to a factorization of `e` through the only object `★` with `F i ≫ F p = 1` in the
  commutative ring `ℤ × ℤ`, so `F p` and `F i` would be units and `e` a unit, which it is not.
- Fullness and faithfulness hold for every preadditive `D`: two natural transformations of
  additive functors on `Karoubi C` agreeing on `C` agree on every `(P, p)`, a retract of `P`.

### 0.3 Beck's theorem as a characterization

For `adj : F ⊣ G`, prove `Monad.isEquivalence_comparison_iff`: `(Monad.comparison adj)` is an
equivalence iff `G` reflects isomorphisms and, for every `G`-split pair `u, v`, the coequalizer of
`u, v` exists and is preserved by `G` (Mac Lane, *Categories for the Working Mathematician*, VI.7,
Theorem 1). Dually `Comonad.isEquivalence_comparison_iff` with `F`-cosplit pairs and equalizers.
Prove `Monad.reflectsIsomorphisms_of_monadicRightAdjoint` and
`Comonad.reflectsIsomorphisms_of_comonadicLeftAdjoint`. Mathlib's
`Monad.monadicOfHasPreservesGSplitCoequalizersOfReflectsIsomorphisms` is the "if" half.
*Needs:* Mathlib `Monad.comparison`, `Comonad.comparison`, `MonadicRightAdjoint`,
`ComonadicLeftAdjoint`, `Functor.IsSplitPair`, `Functor.IsCosplitPair`.

**Checks.**

- The forgetful functor from groups to sets, right adjoint to the free group, satisfies both
  conditions (a bijective homomorphism is an isomorphism), and is monadic.
- The forgetful functor from topological spaces to sets, right adjoint to the discrete topology,
  does not reflect isomorphisms: the identity from `ℝ` discrete to `ℝ` with its usual topology is
  a continuous bijection, not a homeomorphism. It is not monadic.
- The forgetful functor `U` from torsion-free abelian groups to sets reflects isomorphisms but is
  not monadic: the canonical presentation of `ℤ/2` by free abelian groups is a `U`-split pair of
  torsion-free groups whose coequalizer among torsion-free groups is `0`, with one element, while
  its split coequalizer in sets, `U (ℤ/2)`, has two. The coequalizer condition is not redundant.

### Examples

- Reflective subcategories (sheaves in presheaves, abelian groups in groups) are the fixed
  subcategories of idempotent adjunctions.
- For a ring `R`, additive functors out of the Karoubi envelope of the one-object category of `R`
  are `R`-modules.

### Dependencies

Mathlib only. The three targets are independent.

## Layer 1: the 1-truncated layer

### 1.1 The fundamental groupoid of a category

The carrier is Mathlib's `FreeGroupoid` (convention 5), the category of fractions inverting every
morphism (Gabriel–Zisman, Chapter I, 1.1). Prove `isEquivalence_freeGroupoidLift_id`: for a
groupoid `G`, the functor `FreeGroupoid.lift (𝟭 G)` is an equivalence `Π₁ G ≌ G`, with inverse
`FreeGroupoid.of G` (Mathlib's `lift_spec`, `lift_id_comp_of`). Prove
`bijective_mapConnectedComponents_freeGroupoidOf`: `FreeGroupoid.of A` induces a bijection
`ConnectedComponents A → ConnectedComponents (Π₁ A)`, natural in `A`.
*Needs:* Mathlib `FreeGroupoid`, `FreeGroupoid.lift`, `FreeGroupoid.of`, `ConnectedComponents`,
`Functor.mapConnectedComponents`.

**Checks.**

- `Π₁ [1]` is the indiscrete groupoid on `{0, 1}`, equivalent to `e`, while `[1]` is not a
  groupoid: the inverse of `0 ⟶ 1` exists only after localization.
- For the one-object category of the monoid `ℕ`, `Π₁` has automorphism group `ℤ`, the group
  completion, not the trivial group of invertible elements of `ℕ`: `Π₁` is not the core.
- For the walking parallel pair `a, b : 0 ⟶ 1`, `Π₁` has automorphism group `ℤ` at `0`, generated
  by `a ≫ b⁻¹`, while both categories have one connected component.

### 1.2 The classes `W₀` and `W₁`

Define `W₀` (`F.mapConnectedComponents` bijective) and `W₁` (`FreeGroupoid.map F` an
equivalence). Prove `W₁_iff`: `F ∈ W₁` iff `F ∈ W₀` and, at every object `a`, the map
`Aut_{Π₁ A}(a) → Aut_{Π₁ B}(F a)` of `Functor.mapAut` is bijective; `W₁_iff_isEquivalence`: for a
functor between groupoids, `W₁` is the class of equivalences; and `W₁_le_W₀`.
*Needs:* 1.1; Mathlib `Functor.mapAut`, `Functor.mapConnectedComponents`.

**Checks.**

- `B(ℤ/2) ⥤ e` is in `W₀` (both connected) and not in `W₁` (`ℤ/2 → 1` is not bijective).
- The functor from the discrete category on two objects to `e` is in neither class (`2 → 1`).
- `[1] ⥤ e` is in `W₁`, since `Π₁ [1]` is equivalent to `e`, but is not an equivalence of
  categories: `W₁` is not "equivalence of categories" outside groupoids.
- The walking parallel pair `⥤ e` is in `W₀` and not in `W₁` (1.1).

### 1.3 Action groupoids

For a group `G`, presheaves on `SingleObj G` are right `G`-sets, `x · g := X.map g.op x`, and the
left action `g • x := x · g⁻¹` makes `i_{BG} X` isomorphic, over `SingleObj G`, to Mathlib's
`ActionCategory G X`: an arrow `x ⟶ y` of `i_{BG} X` is a `g` with `y · g = x`, that is
`y = g • x`. Hence the components of `i_{BG} X` are the orbits and the automorphism group of `x` is
its stabilizer (`ActionCategory.stabilizerIsoEnd`). Prove that a map of `G`-sets is in `W_Â` for
`W = W₁` iff it is bijective, and that `X` is `W₁`-aspherical iff `X` is nonempty and the action
is free and transitive.
*Needs:* 1.2; Mathlib `SingleObj`, `ActionCategory`, `ActionCategory.stabilizerIsoEnd`.

**Checks.**

- `X = ∅`: `i_{BG} ∅` is the empty category, which is not `W₁`-aspherical (`∅ ⥤ e` is not even
  in `W₀`), although the empty action is vacuously free and transitive: nonemptiness is needed.
- `X = G` with the right regular action: `i_{BG} G` is connected with trivial stabilizers,
  equivalent to `e`, hence `W₁`-aspherical.
- `X` a point with trivial action: `i_{BG} X = BG`, `W₁`-aspherical iff `G = 1`; for `G = ℤ/2` the
  stabilizer is `ℤ/2` and the action is not free.

### 1.4 Fibrations of groupoids and their exact sequence

Define `IsGroupoidFibration p`: every `g : p.obj x ⟶ b` lifts to some `φ : x ⟶ y` with
`p.IsHomLift g φ`. For a fibration `p : E ⥤ B` of groupoids, `x : E` and the fibre
`F := p.Fiber (p.obj x)`, prove the exactness of
`1 → Aut_F(x) → Aut_E(x) → Aut_B(p x) → π₀ F → π₀ E → π₀ B` (Brown–Heath–Kamps 1983, sequence
(1.1), after Brown 1970): `IsGroupoidFibration.range_mapAut_fiberInclusion` (at `Aut_E(x)`),
`IsGroupoidFibration.mem_range_mapAut_iff` (at `Aut_B(p x)`: `g` lifts to an automorphism of `x`
iff every lift of `g` out of `x` ends in the component of `x` in `F`),
`IsGroupoidFibration.mapConnectedComponents_eq_iff` (at `π₀ F`: the fibres of `π₀ F → π₀ E` are
the orbits of `Aut_B(p x)`, acting through endpoints of lifts) and
`IsGroupoidFibration.mapConnectedComponents_eq_mk_iff` (at `π₀ E`). The exactness statements at
`Aut_E(x)` and at `π₀ F` hold for every functor of groupoids and are stated without the fibration
hypothesis: the morphisms of the fibre are by definition those lying over `𝟙`, and a zigzag in a
groupoid composes to a single morphism, whose image under `p` is the required `g`.
*Needs:* Mathlib `Functor.IsHomLift`, `Functor.Fiber`, `Functor.Fiber.fiberInclusion`,
`Functor.mapAut`, `ConnectedComponents`.

**Checks.**

- For a surjective homomorphism `φ : G → H`, `Bφ : BG ⥤ BH` is a fibration with fibre `B(ker φ)`,
  and the sequence is `1 → ker φ → G → H → 1 → 1 → 1`, exact at `H` by surjectivity.
- For `1 → ℤ/2`, `B1 ⥤ B(ℤ/2)` is not a fibration (the generator has no lift). There the
  right-hand side of `mem_range_mapAut_iff` holds vacuously for the generator, which is not in the
  range: the theorem is false without the fibration hypothesis.
- `mapConnectedComponents_eq_mk_iff` needs the fibration hypothesis: for `E` discrete on `{a, b}`,
  `B` the indiscrete groupoid on `{0, 1}`, `p a = 0` and `p b = 1`, the component `[b]` lies over
  the component of `p a`, but the range of `π₀` of the fibre over `0` is `{[a]}`, and `0 ⟶ 1` has
  no lift out of `a`.
- For a `G`-set `X`, `ActionCategory.π : ActionCategory G X ⥤ SingleObj G` is a fibration whose
  fibre is the discrete category `X`; the sequence is `1 → 1 → Stab(x) → G → X → X/G → 1`, the
  boundary sending `g` to `g • x`: `g` lifts to an automorphism of `x` iff `g • x = x`, and the
  fibres of `X → X/G` are the orbits.

### 1.5 Mayer–Vietoris

For a pullback square of groupoids in which one map is a fibration, prove the Mayer–Vietoris
sequence of Brown–Heath–Kamps 1983, Theorem 2.2, its Corollary 2.4, and the bijectivity criterion
of Corollary 2.5 for `π₀` of the pullback. Compare the strict pullback along a fibration with
Mathlib's `CategoricalPullback` (they are equivalent) and transport the sequence.
*Needs:* 1.4; Mathlib `CategoricalPullback`.

**Checks.**

- The pullback of a fibration `p` along `e ⥤ B` picking `p x` is the fibre, and the sequence
  reduces to that of 1.4.
- For `B = BG` and both legs the functor `e ⥤ BG`, the strict pullback is `e`, while
  `CategoricalPullback` is the discrete groupoid on `G`: `π₀` has one element against `|G|`.
  Neither leg is a fibration when `G ≠ 1`, and the comparison needs one.
- Replacing one leg by the fibration `ActionCategory.π : ActionCategory G G ⥤ BG` gives the
  discrete groupoid on `G` for both pullbacks, and the boundary `Aut(★) = G → π₀` is a bijection.

### Examples

- Fibrations: `ActionCategory.π` for every `G`-set, `Bφ` for every surjective homomorphism `φ`.
- `Π₁` of a poset with a least element is equivalent to `e`.

### Dependencies

Mathlib only. Within the layer, 1.2 uses 1.1, 1.3 uses 1.2, and 1.5 uses 1.4.

## Layer 2: basic localizers and asphericity

### 2.1 Basic localizers and the minimal localizer

Define `IsAspherical`, `IsAsphericalFunctor` and `IsBasicLocalizer` (convention 3) and `Winfty`,
the intersection of all basic localizers; prove `isBasicLocalizer_Winfty`, and more generally that
any intersection of basic localizers is one, so that `W∞ ≤ W` for every basic localizer `W`.
*Needs:* Mathlib `MorphismProperty`, `CostructuredArrow.pre`, `Functor.star`, `HasTerminal`.

**Checks.**

- The class of all functors satisfies every axiom, so the family is nonempty and `W∞` is not the
  intersection of an empty family.
- The isomorphisms of categories, and the equivalences, fail LF2: `[1]` has a terminal object and
  `[1] ⥤ e` is not an equivalence. A weak equivalence of small categories is not an equivalence.
- `e ⥤ [1]` picking `1` is in every basic localizer (2.3: it is right adjoint to `[1] ⥤ e`) but
  is not aspherical: its slice `A/0` is empty, and `∅ ⥤ e` is not in `W₋₁` (2.2), hence not in
  `W∞`. With the slices `b\A` instead, both `0\A` and `1\A` have one object and the functor would
  be aspherical: the definition uses `CostructuredArrow`.
- `W∞` contains `[1] ⥤ e` (LF2) and excludes the functor from two points to `e` (not in `W₀`,
  2.2) and `B(ℤ/2) ⥤ e` (not in `W_N`, 4.1, and `W∞ = W_N`, 4.2).

### 2.2 Examples: `W₀`, `W₁`, `W₋₁`

Define `WNeg₁`, the functors with `Nonempty A ↔ Nonempty B`. Prove `isBasicLocalizer_W₀`
(Cisinski 2004, proof of Proposition 2.3.4: `π₀` commutes with colimits and `A` is the colimit
of the `A/b`), `isBasicLocalizer_WNeg₁` and `isAspherical_W₁_iff` (`A` is `W₁`-aspherical iff
`Π₁ A` is equivalent to `e`). Prove `W₁ ≤ W₀ ≤ W₋₁ ≤ ⊤`, all strict. That `W₁` is a basic
localizer needs the nerve and is 4.6.
*Needs:* 1.1, 1.2, 2.1.

**Checks.**

- `W₀ < W₋₁`: the functor from two points to `e` is in `W₋₁`, not in `W₀`; `W₋₁ < ⊤`: `∅ ⥤ e`.
- LF3 for `W₋₁`: if `A` is empty and `B` is not, pick `b : B`; then `A/(G b)` is empty and
  `B/(G b)` contains `(b, 𝟙)`, so some `CostructuredArrow.pre F G c` is not in `W₋₁`.
- The walking parallel pair is `W₀`-aspherical and not `W₁`-aspherical (1.1).

### 2.3 Elementary consequences

`W` is stable under small coproducts (Cisinski 2004, Proposition 1.1.5) and finite products
(Proposition 1.1.7, via Lemma 1.1.6); a functor with a natural transformation to or from a
`W`-functor is in `W` (Proposition 1.1.9); prove `mem_of_isLeftAdjoint` and
`mem_of_isRightAdjoint`: a functor with a right or a left adjoint is in `W` (Corollary 1.1.10);
a category with an initial object is aspherical (Corollary 1.1.11); a morphism of categories
cofibred over `S` that is fibrewise in `W` is in `W` (Proposition 1.1.13).
*Needs:* 2.1.

**Checks.**

- `[1] ⥤ e` has a left adjoint (picking `0`) and a right adjoint (picking `1`).
- The functors `e ⥤ [1]` picking `0` and `1` are related by the natural transformation
  `0 ⟶ 1`; both are in `W`, as Proposition 1.1.9 requires.
- The coproduct `[1] ⊔ [1] ⥤ e ⊔ e` is in `W`, while `e ⊔ e ⥤ e` is not in `W₀`: coproducts of
  aspherical categories are not aspherical. `[1] × [1]` has the terminal object `(1, 1)`.

### 2.4 Theorem A and integration

Prove `mem_of_isAsphericalFunctor`: every `W`-aspherical functor is in `W`, and the relative
version, a functor over `C` with every `A/c ⥤ B/c` in `W` is in `W` (Cisinski 2004, Remark 1.1.4,
after Quillen 1973, §1, Theorem A). This is the general owner of Theorem A; the dual statement for
`b\A` is proved for `W∞` in 4.2. For `F ⟶ G` in `I ⥤ Cat` objectwise in `W`, the induced functor
of Mathlib Grothendieck constructions is in `W` (Cisinski 2004, Proposition 1.2.4).
*Needs:* 2.1.

**Checks.**

- For `F : A ⥤ e`, the slice `A/⟨⟨⟩⟩` is isomorphic to `A`, and Theorem A says that an aspherical
  `A` has `A ⥤ e` in `W`: the axiom LF2 is the case of a terminal object.
- The converse fails: `e ⥤ [1]` picking `1` is in `W` and not aspherical (2.1).
- For `I` the discrete category on two objects, the Grothendieck construction is the coproduct,
  and integration contains Proposition 1.1.5.

### 2.5 Locally constant functors

Define `IsLocallyConstant W F`: every `CostructuredArrow.map g : A/b ⥤ A/b'` is in `W`
(Cisinski 2004, 2.3.1).
*Needs:* 2.1; Mathlib `CostructuredArrow.map`.

**Checks.**

- Every functor into a groupoid is `W`-locally constant: for an isomorphism `g`,
  `CostructuredArrow.map g` is an isomorphism of categories, with inverse
  `CostructuredArrow.map g⁻¹`.
- `e ⥤ [1]` picking `1` is not `W∞`-locally constant: `A/0 = ∅ ⥤ A/1 = e` is not in `W₋₁`.
- The functor `ActionCategory ℤ ℤ ⥤ Bℤ` (translation action) is locally constant and in `W₀`
  (both connected), and its slice `A/★` has the components indexed by `n + h`, each indiscrete:
  it is equivalent to the discrete category `ℤ`, so the functor is not `W₀`-aspherical.

### Examples

- `W₀`, `W₋₁` and `⊤` (and `W₁`, 4.6); every intersection of basic localizers.
- Every functor with an adjoint; every functor into a groupoid is locally constant.

### Dependencies

Layer 1 for the examples of 2.2. Within the layer, 2.2–2.5 use 2.1.

## Layer 3: presheaves on a small category

### 3.1 The adjunction `i_A ⊣ i_A^*`

Define `iA`, `iAFunctor` (`X ↦ A/X`, Mathlib's `CostructuredArrow.functor yoneda`) and
`iAStarFunctor` (`C ↦ (a ↦ (Over a ⥤ C))`, from Mathlib's `Over.mapFunctor`). Prove
`nonempty_iAAdjunction` (`i_A ⊣ i_A^*`), `i_A (yoneda a) ≅ Over a`, naturality in `A`, and that
representable presheaves are aspherical for every basic localizer: `A/a` has a terminal object
(Mathlib's `CostructuredArrow.hasTerminal`), and LF2 applies.
*Needs:* 2.1; Mathlib `CostructuredArrow.functor`, `CostructuredArrow.hasTerminal`,
`Over.mapFunctor`, `yoneda`.

**Checks.**

- For `A = e`, `i_e X` is the discrete category on `X` and `i_e^* C` is the set of objects of `C`;
  the adjunction is the bijection between functors from a discrete category and maps to objects.
- For `A = [1]`, `i_A^* [1]` has two elements over `0` (functors `e ⥤ [1]`) and three over `1`
  (monotone maps `[1] → [1]`); with `Under a` in place of `Over a` it would have two over `1`.
- `i_A` of the terminal presheaf is `A` itself and of the empty presheaf is the empty category;
  `i_A (yoneda a)` has the terminal object `(a, 𝟙)`, whence asphericity by LF2.

### 3.2 Weak equivalences of presheaves

Define `presheafWeq A W`, the class `W_Â`. Prove that it is weakly saturated, that `i_A` sends
colimits in `Â` to colimits in `Cat` (Cisinski 2004, Lemma 1.3.6), and Grothendieck's theorem that
monomorphisms in `W_Â` are stable under pushout and transfinite composition (Theorem 1.3.10).
*Needs:* 3.1.

**Checks.**

- For `A = e`, `W_Â` for `W = W₀` is the bijections of sets, and for `W = W₋₁` the maps between
  sets that are both empty or both nonempty.
- For `A = SingleObj G` and `W = W₁`, `W_Â` is the bijective maps of `G`-sets (1.3).
- For `A = e` and `W = W₀`, the map from two points to one is not in `W_Â`.

### 3.3 The simplex category

For a small category `A`, prove that the functor `i_Δ (nerve A) ⥤ A` sending a simplex to its last
vertex is `W`-aspherical for every basic localizer `W` (Cisinski 2004, Lemma 2.2.2 and
Proposition 2.2.3), hence `W = nerve⁻¹(i_Δ⁻¹ W)` (Corollary 2.2.4) and `nerve`, `i_Δ` induce
mutually quasi-inverse equivalences `Δ̂[W_Δ̂⁻¹] ≌ Cat[W⁻¹]` (Remark 2.2.5). Here `i_Δ X` is the
category of simplices `CostructuredArrow SSet.stdSimplex X`, small in universe `u`.
*Needs:* 2.4, 3.1; Mathlib `nerve`, `SimplexCategory`.

**Checks.**

- A morphism `θ : [m] → [n]` of simplices of `nerve A` gives the arrow `a_{θ(m)} ⟶ a_n` between
  last vertices, so the last vertex is covariant; the first vertex gives `a_0 ⟶ a_{θ(0)}`, a
  functor to `Aᵒᵖ`.
- `i_Δ Δ[0]` is isomorphic to `Δ`, which has the terminal object `[0]`.
- For `A = e`, `nerve e = Δ[0]` and the last-vertex functor is `Δ ⥤ e`, aspherical by LF2.

### Examples

- Representable presheaves; for `A = e`, sets; for `A = SingleObj G`, `G`-sets.

### Dependencies

Layer 2. Within the layer, 3.2 and 3.3 use 3.1.

## Layer 4: Thomason equivalences and the minimal localizer

### 4.1 Thomason equivalences are a basic localizer

Prove that `W_N` (convention 4) is a basic localizer (Cisinski 2004, Theorem 2.1.13): FS1–FS3
and LF2 from the simplicial weak equivalences of GeneralizedCohomology G2 item 1. LF3 follows
the route of Theorem 2.1.13: for `u : A ⥤ B` over `C`, the functors `∫_C (A/c) ⥤ A` and
`∫_C (B/c) ⥤ B` have left adjoint sections, hence are in `W_N`, because a natural transformation
induces a simplicial homotopy of nerves, so the nerve of such a functor is a homotopy equivalence,
hence a weak equivalence (GeneralizedCohomology G2 item 1); and
`∫_C (A/c) ⥤ ∫_C (B/c)` is in `W_N`, since both sides are, up to Thomason's comparison
(StableHomotopyKTheory §2.29), homotopy colimits of the nerves of the slices, and objectwise weak
equivalences give a weak equivalence of homotopy colimits (§2.26). Prove that `W_N` is stable
under `A ↦ Aᵒᵖ`.
*Needs:* 2.1, StableHomotopyKTheory §§2.26, 2.29, GeneralizedCohomology G2 item 1.

**Checks.**

- `nerve [1] = Δ[1] → Δ[0]` is a simplicial weak equivalence (LF2 at `[1]`).
- `B(ℤ/2) ⥤ e` is not in `W_N`: the realization of its nerve has `π₁ = ℤ/2`.
- `nerve (Aᵒᵖ)` is the opposite simplicial set of `nerve A`, whose realization is homeomorphic to
  that of `nerve A`: this gives stability under opposites.

### 4.2 Minimality: `W∞ = W_N`

Prove `W∞ = W_N` (Cisinski 2004, Theorem 2.2.11, via Lemmas 2.2.6, 2.2.8 and Proposition 2.2.9).
Consequences: `W∞` is stable under opposites; the dual Theorem A for `b\A`; `W∞ ≤ W₀`;
`W∞`-equivalences induce isomorphisms on the simplicial homology of nerves.
*Needs:* 3.3, 4.1, GeneralizedCohomology G2 item 1.

**Checks.**

- The poset of nonempty proper subsets of `{0, 1, 2}` has nerve weakly equivalent to `S¹`; its
  functor to `e` is in `W₀` and not in `W₁` (`Π₁` has automorphism group `ℤ`).
- The poset of nonempty proper subsets of `{0, 1, 2, 3}` has nerve weakly equivalent to `S²`; its
  functor to `e` is in `W₁` (connected, simply connected) and not in `W∞`, since `H₂ = ℤ`: the
  inclusion `W∞ ≤ W₁` of 4.6 is strict.
- `[1] ⥤ e` is in `W∞` and in `W_N`, as LF2 and 4.1 require.

### 4.3 Homological localizers

Define `homologyLocalizer M`, the functors `F` with `SSet.homologyMap (nerveMap F) M n` an
isomorphism for every `n`, for `M : AddCommGrpCat.{u}`. Prove `isBasicLocalizer_homologyLocalizer`
(Cisinski 2006, Corollary 9.4.3 with `E = HM`, proved there through Bousfield's `E`-local model
structure). Route, this roadmap's own: FS1–FS3 because homology is a functor, LF2 because the nerve
of a category with a terminal object is contractible, and LF3 by comparing the homology spectral
sequences of `A ⥤ C` and `B ⥤ C` (StableHomotopyKTheory §2.30), whose `E²` pages are isomorphic when
every `A/c ⥤ B/c` is in the class. Hence `W∞ ≤ homologyLocalizer M`.
*Needs:* 2.1, StableHomotopyKTheory §2.30; Mathlib `SSet.homologyMap`, `nerveMap`.

**Checks.**

- For `M = ℚ`, `B(ℤ/2) ⥤ e` is in the class (the rational homology of a finite group vanishes in
  positive degrees), while for `M = ℤ/2` it is not (`H₁ = ℤ/2`): the class depends on `M`, and
  `W∞ < homologyLocalizer ℚ`.
- `H₀` with `M = ℤ` is `ℤ^{π₀}`, so `homologyLocalizer ℤ ≤ W₀`; the functor from two points to
  `e` is not in it.
- For `M = 0` every homology group vanishes and the class is `⊤`.

### 4.4 Theorem B and the characterization of `W∞`

Consume Quillen's Theorem B from StableHomotopyKTheory §2.34, translated into nerves by
GeneralizedCohomology G2 item 1 and 4.2: for a `W∞`-locally constant `F : A ⥤ B`, `A/b` is the
homotopy fibre of `F` over `b` (Cisinski 2004, Theorem 2.3.2). Prove
`Winfty_iff_isAsphericalFunctor_of_isLocallyConstant`: a `W∞`-locally constant functor is in `W∞`
iff it is `W∞`-aspherical (Corollary 2.3.3); and `eq_Winfty_of_isLocallyConstant`: a basic
localizer `W ≤ W₀` in which every `W`-locally constant functor in `W` is `W`-aspherical is `W∞`
(Theorem 2.3.6).
*Needs:* 2.4, 2.5, 4.2, StableHomotopyKTheory §2.34, GeneralizedCohomology G2 item 1.

**Checks.**

- `W₀` violates the hypothesis of `eq_Winfty_of_isLocallyConstant`: the functor
  `ActionCategory ℤ ℤ ⥤ Bℤ` of 2.5 is `W₀`-locally constant, in `W₀`, and not `W₀`-aspherical.
- The hypothesis `W ≤ W₀` is needed: for `⊤` every functor is aspherical, so the other hypothesis
  holds, and `⊤ ≠ W∞`.
- For a surjective homomorphism `φ : G → H`, `Bφ` is locally constant (into a groupoid) with slice
  `A/★` equivalent to `B(ker φ)`: both sides of Corollary 2.3.3 hold iff `ker φ = 1`; for
  `ℤ → ℤ/2` both fail.

### 4.5 The homotopy category

`Hot := Cat[W∞⁻¹]`; prove `Hot ≌ SSet[W⁻¹]` through `nerve` and `i_Δ` (3.3, 4.2).
*Needs:* 3.3, 4.2, GeneralizedCohomology G2 item 1.

**Checks.**

- `[1]` and `e` are isomorphic in `Hot`.
- `B(ℤ/2)` and `e` are not: `H₁(−; ℤ/2)` factors through `Hot` (4.3) and distinguishes them.
- The `S²` poset of 4.2 and `e` are not isomorphic in `Hot`, though they are after inverting `W₁`.

### 4.6 `W₁` is a basic localizer

Prove `isBasicLocalizer_W₁`, hence `W∞ ≤ W₁`. Route (Cisinski 2006, 9.2.1 and Corollary 9.2.15
for `n = 1`): a functor `F` is in `W₁` iff the nerve of `F` is a `1`-equivalence of simplicial
sets, bijective on `π₀` and an isomorphism on `π₁` at every vertex, since `π₁` of the nerve of `A`
is the automorphism group in `Π₁ A` (StableHomotopyKTheory §1.21); the `1`-equivalences are the
localizer `W_1` of Cisinski 2006, 9.2.1, by Corollary 9.2.15, and their inverse image under the
nerve is a basic localizer (Cisinski 2004, Corollary 2.2.4, with 3.3). Layers 1–2 do not suffice:
a strict colimit of groupoids does not preserve objectwise equivalences, so LF3 for `W₁` has no
fibre-by-fibre proof on free groupoids.
*Needs:* 3.3, StableHomotopyKTheory §1.21, GeneralizedCohomology G2 item 1.

**Checks.**

- `B(ℤ/2) ⥤ e` is in `W₀` and not in `W₁`: the realization of its nerve has `π₁ = ℤ/2`, and
  `Π₁ (B(ℤ/2)) = B(ℤ/2)` is not equivalent to `e`.
- A category with a terminal object has `Π₁` equivalent to `e` and contractible nerve: LF2 holds
  for `W₁`, on both sides of the identification.
- The `S²` poset of 4.2 is in `W₁` and not in `W∞`: `W∞ < W₁`.

### Examples

- Homological localizers for every abelian group; `W∞` itself.

### Dependencies

Layers 1–3, GeneralizedCohomology G2 item 1 and StableHomotopyKTheory §§1.21, 2.26, 2.29, 2.30
and 2.34. Within the layer, 4.2 uses 4.1, 4.4 uses 4.2 and 4.5 uses 4.2; 4.6 uses 3.3.

## Layer 5: Thomason's model structure

### 5.1 Dwyer maps

Define `IsDwyerMap i` (Thomason 1980, Definition 4.1): `i` is injective on objects and fully
faithful, its image is a sieve, and some cosieve `V` containing the image has `A ⥤ V` a left
adjoint. Prove `IsDwyerMap.of_isPushout`: the cobase change of a Dwyer map along any functor is a
Dwyer map (Thomason 1980, Proposition 4.3).
*Needs:* Mathlib `IsPushout`, `ObjectProperty.lift`.

**Checks.**

- `e ⥤ [1]` picking `0` is a Dwyer map with `V = [1]`: nothing maps to `0` but `0`, and
  `[1] ⥤ e` is right adjoint to it because `0` is initial.
- `e ⥤ [1]` picking `1` is not: `0 ⟶ 1` has its source outside the image, so the image is not a
  sieve (it is a cosieve).
- The inclusion of `{0}` into the poset `0 → 1 ← 2` is a Dwyer map only through `V = {0, 1}`: for
  `V` the whole poset a right adjoint `r` would need `Hom(0, 2) ≅ Hom(★, r 2)`, with `∅` against
  one element. The cosieve is not the whole category in general.
- The inclusion of the discrete category on `{0, 1}` into `[1]` is not full, hence not Dwyer.

### 5.2 Pushouts along Dwyer maps

Prove that the pushout of nerves along a Dwyer map `i` maps by a simplicial weak equivalence to
the nerve of the pushout (Thomason 1980, Proposition 4.3), and that pushouts along Dwyer maps
preserve weak equivalences: the cobase change of `i` is a Thomason equivalence when `i` is, and the
map parallel to a Thomason equivalence `f` is one (Corollary 4.4).
*Needs:* 4.1, 5.1, GeneralizedCohomology G2 item 1.

**Checks.**

- Gluing `[1]` at its `1` to the `0` of a second `[1]` along the Dwyer map `e ⥤ [1]` picking `0`
  gives `[2]`; the pushout of nerves is the horn `Λ²₁`, and `Λ²₁ → Δ[2]` is a weak equivalence
  and not an isomorphism.
- The cobase change of `e ⥤ [1]` picking `0` along `e ⥤ C` picking `c` adds one object `1` with
  `Hom(x, 1) = Hom(x, c)`: `C` is a sieve of the result, with right adjoint sending `1` to `c`,
  a Dwyer map as 5.1 predicts.
- In the pushout of `e ⥤ [1]` (picking `0`) along itself, the parallel map `[1] ⥤ P` is a map
  between categories with initial objects, a Thomason equivalence, as Corollary 4.4 predicts.

### 5.3 Excision along sieves

For sieves `U, V ⊆ A` with every object in `U` or `V`, prove that `nerve A` is the pushout of
`nerve U ← nerve (U ∩ V) → nerve V` along monomorphisms, hence the square is homotopy coCartesian
for `W∞`.
*Needs:* 4.2, GeneralizedCohomology G2 item 1.

**Checks.**

- A simplex `a_0 → ⋯ → a_n` with `a_n ∈ U` lies in `U`, since `U` is a sieve: this is the proof.
- For the span `1 ← 0 → 2` with `U = {0, 1}` and `V = {0, 2}`, `nerve A = Δ[1] ⊔_{Δ[0]} Δ[1]`.
- For `[2]` with the sieve `U = {0, 1}` and the cosieve `V = {1, 2}`, the pushout of nerves is the
  horn `Λ²₁`, not `Δ[2]`: both members of the cover must be sieves.

### 5.4 The model structure

Weak equivalences `W_N`, fibrations the `F` with `Ex² (nerveMap F)` a Kan fibration, cofibrations
by left lifting (Thomason 1980, Definitions 2.1–2.3); `c Sd² L ⥤ c Sd² K` is a Dwyer map for an
inclusion of ordered simplicial complexes, with `c = SSet.hoFunctor` and `Sd = SSet.sd`
(Proposition 4.2). Prove the model axioms (Theorem 4.9) as a Mathlib
`HomotopicalAlgebra.ModelCategory Cat.{u, u}`; that every cofibration is a pseudo-Dwyer map, a
retract of a Dwyer map, and properness (Corollary 5.5), both through Cisinski 1999, since Dwyer
maps are not stable under retracts; that every cofibrant category is a poset (Proposition 5.7);
and that `c Sd² ⊣ Ex² nerve` is a Quillen equivalence with the Kan–Quillen structure. The same
classes restrict to a proper, cofibrantly generated model structure on posets, Quillen equivalent
to Thomason's through the inclusion of posets into categories and its left adjoint (Raptis 2010,
Theorem 2.6).
*Needs:* 5.1, 5.2, GeneralizedCohomology G2 item 1; Mathlib `HomotopicalAlgebra.ModelCategory`,
`SSet.sd`, `SSet.ex`, `SSet.hoFunctor`.

**Checks.**

- `B(ℤ/2)` is not a poset, hence not cofibrant (Proposition 5.7).
- `∅ ⥤ e` is `c Sd² (∂Δ[0] → Δ[0])`, a generating cofibration, so `e` is cofibrant.
- The left adjoint of the inclusion of posets sends `B(ℤ/2)` to the point and the walking
  parallel pair to `[1]`; it is not a Thomason equivalence on `B(ℤ/2)`, so the Quillen equivalence
  is one of derived functors.

### Examples

- Sieve inclusions with a cosieve receiving a right adjoint, such as the inclusion of an initial
  object; `Cat` with Thomason's model structure.

### Dependencies

Layer 4 and GeneralizedCohomology G2 item 1. Within the layer, 5.2 uses 5.1, 5.4 uses 5.1–5.2,
and 5.3 uses only Layer 4.

## Layer 6: test categories

### 6.1 Definitions

Define `iALocalized` (the functor `Â[W_Â⁻¹] ⥤ Cat[W⁻¹]` induced by `i_A`),
`IsWeakTestCategory` (`W = (i_A^*)⁻¹ W_Â`, and `iALocalized` an equivalence), `IsLocalTestCategory`
(every `A/a` is a weak test category), `IsTestCategory` (both) and `IsStrictTestCategory` (a test
category whose localization functor preserves binary products), as in Maltsiniotis 2009, §2.3.
Prove strict test ⇒ test ⇒ weak test, test ⇒ local test, and invariance under equivalence.
*Needs:* 3.1, 3.2; Mathlib `MorphismProperty.Localization`, `Localization.Construction.lift`.

**Checks.**

- `e` is not a weak test category for `W∞`: `i_e^* C` is the set of objects of `C`, so
  `(i_e^*)⁻¹ W_Â` is the functors bijective on objects, which excludes `[1] ⥤ e ∈ W∞`.
- For `W = ⊤` every small category is a strict test category: `Cat` and `Â` have initial objects,
  so both localizations at all morphisms are equivalent to the point.
- `Δ` is a strict test category for `W∞` (6.4), and `□` a test category that is not strict.

### 6.2 Totally aspherical categories

`A` is *totally aspherical* if it is aspherical and every product `yoneda a × yoneda b` is
aspherical, and a *separating aspherical interval* is as in Maltsiniotis 2009, §§2.4–2.5. Totally
aspherical categories are aspherical, and for a totally aspherical `A` the product of two weak
equivalences of `Â` is one (Maltsiniotis 2005, Propositions 1.6.1 and 2.1.3).
*Needs:* 3.2, 6.1.

**Checks.**

- `Δ` is totally aspherical: `Δ[m] × Δ[n]` is the nerve of `[m] × [n]`, which has a terminal
  object.
- The converse fails. For a group `G ≠ 1` and `A = BG` with `W = W∞`, `W_Â` consists of the
  isomorphisms, so it is stable under finite products. Yet `A` is not aspherical, and
  `A/(★ × ★) ⥤ A/★ × A/★` is not in `W∞`: `A/★` is the action groupoid of `G` on itself,
  equivalent to `e`, and `A/(★ × ★)` is equivalent to the discrete category on `|G|` objects, so
  the map is the functor from the discrete category on `|G|` objects to `e`.
- `□` is not totally aspherical: `□₁ × □₁` is not aspherical (6.4).

### 6.3 Grothendieck's criterion

If `A` is totally aspherical and `Â` has a separating aspherical interval (two global sections with
empty equalizer), `A` is a strict test category (Maltsiniotis 2005, Proposition 1.6.8; restated as
Maltsiniotis 2009, Theorem 2.6).
*Needs:* 6.1, 6.2.

**Checks.**

- In `Δ̂`, `Δ[1]` with its vertices `0, 1 : Δ[0] ⟶ Δ[1]` is a separating aspherical interval: the
  equalizer of the two vertices is empty and `Δ[1]` is representable.
- For `A = e`, an interval is a set with two distinct points, never aspherical (`i_e I` is
  discrete with at least two objects), consistent with `e` not being a test category.
- `□₁` is a separating aspherical interval in `□̂`, but `□` is not totally aspherical, and the
  criterion does not apply.

### 6.4 Examples

Prove `isStrictTestCategory_simplexCategory`: `Δ` is a strict test category, stated on
`AsSmall.{u} SimplexCategory` (Maltsiniotis 2005, Astérisque 301, Proposition 1.6.13, which is
Proposition 1.6.14 in the author's preprint). `□_c` is a strict test category (Maltsiniotis 2009,
§3). `□` is a test category (Cisinski 2006, Corollary 8.4.13 or Proposition 8.4.27) and not a
strict one: `□₁ × □₁` is not aspherical, because `nerve (i_□ (□₁ × □₁))` has first integral
homology `ℤ` (Maltsiniotis 2009, §5, which identifies its homotopy type with `S² ∨ S¹`), detected
by the homological localizer of 4.3. Construct the monoidal structures on `□` and `□_c`
(Maltsiniotis 2009, §1.2).
*Needs:* 4.3, 6.1, 6.3; Mathlib `SimplexCategory`, `AsSmall`.

**Checks.**

- `AsSmall.{u} SimplexCategory` is equivalent to `SimplexCategory`, so the statement in universe
  `u` is about `Δ`.
- `Δ` satisfies 6.3 by the first Check of 6.2 and the first Check of 6.3.
- A space of the homotopy type `S² ∨ S¹` has `H₁ = ℤ ≠ 0`, so `□₁ × □₁` is not aspherical.

### Examples

- `Δ`, `□_c` (strict test categories); `□` (test, not strict).

### Dependencies

Layers 3–4. Within the layer, 6.2–6.4 use 6.1, and 6.4 uses 6.3.

## Layer 7: direct and inverse categories

### 7.1 Definitions and basic API

Define `DirectRel`, `IsDirect` and `IsInverse` (convention 16), and prove `IsInverse C ↔ IsDirect
Cᵒᵖ` and `IsDirect C ↔ IsInverse Cᵒᵖ`. Prove `IsDirect.eq_id_of_endo` (every endomorphism is the
identity) and `IsDirect.skeletal`; every isomorphism is an identity; dually for inverse
categories. Closure: discrete categories are direct; if `F : C ⥤ D` sends non-identity morphisms to
non-identity morphisms and `D` is direct, so is `C`; full and wide subcategories and binary
products of direct categories are direct.
*Needs:* Mathlib `MorphismProperty.identities`, `Skeletal`.

**Checks.**

- `ℤ` with its order is thin, skeletal, has only monomorphisms and identity endomorphisms, and is
  not direct: `⋯ ⟶ -2 ⟶ -1 ⟶ 0` is an infinite descending chain of non-identity morphisms.
- `ℕ` is direct and not inverse; `ℕᵒᵖ` is inverse.
- `SingleObj G` for `G ≠ 1` is not direct: a non-identity `g : ★ ⟶ ★` gives the infinite chain
  `⋯ ⟶ ★ ⟶ ★`, as `eq_id_of_endo` requires.

### 7.2 Well-founded characterisation, rank and induction

Prove `IsDirect.of_reedyStructure` (a `ReedyStructure (identities C) ⊤ α` for any `α` as in
convention 15 makes `C` direct) and `isDirect_iff_nonempty_reedyStructure` (with
`α = Ordinal.{u}`). A direct factorization of `f` is unique: the identity followed by `f`. The
canonical degree `IsDirect.rank X := WellFounded.rank (DirectRel C) X` is raised by non-identity
morphisms, satisfies `rank X = ⨆ (f : Y ⟶ X non-identity), Order.succ (rank Y)`, and is minimal:
for every direct Reedy structure `r` with values in `α : Type w`,
`Ordinal.lift.{w} (rank X) ≤ Ordinal.lift.{u} (Ordinal.typein (· < ·) (r.deg X))`. Well-founded
induction and recursion over the objects of a direct category and over the degree of a Reedy
structure, with the unfolding equation of the recursor.
*Needs:* 7.1; Mathlib `HomotopicalAlgebra.ReedyStructure`, `WellFounded.rank`.

**Checks.**

- For `[1]`, `rank 0 = 0` and `rank 1 = 1`; the degree `0 ↦ 5`, `1 ↦ 7` in `ℕ` is direct and
  bounds the rank from above.
- The poset `ω + 1` is direct with `rank ω = ω`, and has no `ℕ`-valued direct degree, since
  `deg ω` would exceed every `deg n`: ordinal degrees are needed in the characterization.
- `ℤ` has no direct Reedy structure, consistent with 7.1.

### 7.3 Finite degrees

Prove `nonempty_reedyStructure_nat_iff`: an `ℕ`-valued direct Reedy structure exists iff `C` is
direct with `IsDirect.rank X < ω` for every `X`. Sufficient condition: `C` is direct and every `X`
receives morphisms from finitely many objects (then the length of the longest chain of
non-identity morphisms ending at `X` is a degree).
*Needs:* 7.2.

**Checks.**

- `ℕ ×ₗ ℕ` with the lexicographic order is direct and `(1, 0)` has rank `ω`: it has no
  `ℕ`-valued degree.
- `Finset ι` under inclusion has the degree `card`.
- The sufficient condition is not necessary: the poset of infinitely many atoms below one top
  element has degree `0` on the atoms and `1` on the top.

### 7.4 Restriction and transport

For `r : ReedyStructure W₁ W₂ α` prove `ReedyStructure.exists_directPart` (a direct structure on
`WideSubcategory W₂` with degree `r.deg`) and `ReedyStructure.exists_inversePart` (an inverse one
on `WideSubcategory W₁`). Restriction to a full subcategory `P` such that, whenever `P X` and
`P Y`, `P` holds of the intermediate object of the factorization of every `f : X ⟶ Y`; the degree
sieves `{X | r.deg X ≤ a}` and `{X | r.deg X < a}` satisfy this. Transport along an isomorphism of
categories `F` with the classes `W₁.map F`, `W₂.map F`. `r.op` exchanges the direct and inverse
parts.
*Needs:* 7.1, 7.2; Mathlib `WideSubcategory`, `ReedyStructure.op`.

**Checks.**

- For `Δ` with epimorphisms and monomorphisms, the direct part is the wide subcategory of
  monomorphisms, isomorphic to the semi-simplex category (8.4), and the inverse part the
  epimorphisms.
- The intermediate object of the factorization of `[p] → [q]` has degree at most `min(p, q)`, so
  the degree sieves are closed under factorization.
- The full subcategory `{[2]}` of `Δ` is not: the constant map `[2] → [2]` at `0` factors through
  `[0]`.

### 7.5 Products

`ReedyStructure.prod` for `ℕ`-valued degrees (convention 17), with the factorization componentwise
(Riehl–Verity, TAC 2014, 2.7).
*Needs:* 7.1.

**Checks.**

- On `[1] × [1]` the degree is `(i, j) ↦ i + j`.
- With `max` in place of `+`, the non-identity `(0, 1) ⟶ (1, 1)` keeps degree `1`: `max` is not a
  degree.
- On `Δ × Δ` the factorization of `(f, g)` is the pair of epi–mono factorizations.

### Examples

- Posets with a well-founded order; `Δ` with its two classes; their products.

### Dependencies

Mathlib only. Within the layer, 7.2–7.5 use 7.1, and 7.3 and 7.4 use 7.2.

## Layer 8: examples of direct and Reedy categories

### 8.1 Partial orders

For a partial order `P` with Mathlib's `Preorder.smallCategory`, prove `isDirect_iff_wellFoundedLT`
(and dually `IsInverse P ↔ WellFoundedGT P`) and, under `[LocallyFiniteOrderBot P]`,
`exists_reedyStructure_card_Iio`: `x ↦ (Finset.Iio x).card` is an `ℕ`-valued direct degree.
*Needs:* 7.2.

**Checks.**

- `ℕ` and `Fin n` are direct, with degree the value.
- `Finset ι` ordered by inclusion: the degree of `{a, b}` is `3`, the number of proper subsets.
- The lexicographic `ℕ ×ₗ ℕ` is direct but not `LocallyFiniteOrderBot`: `(1, 0)` has infinitely
  many elements below it.

### 8.2 Small diagram shapes

`WalkingParallelPair` with the source of degree `0` and the target of degree `1` is direct
(Riehl–Verity, TAC 2014, 2.5). `WalkingSpan` carries two Reedy structures: the direct one with the
apex of degree `0`, and the one with the apex of degree `1`, one leg lowering and the other raising
the degree (2.3–2.4 there); both are constructed, and the second is neither direct nor inverse.
*Needs:* 7.2.

**Checks.**

- In `WalkingParallelPair` both arrows raise the degree and factor uniquely as the identity
  followed by themselves.
- In the second structure on `WalkingSpan` with degrees `0, 1, 2` on the two ends and the apex in
  the middle, each leg factors only trivially, so factorizations are unique.
- That structure has a lowering and a raising leg, so it is neither direct nor inverse.

### 8.3 The simplex categories

`SimplexCategory.reedyStructure` is Mathlib's (Mathlib master,
`Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean`, absent at the pin):
`ReedyStructure (epimorphisms SimplexCategory) (monomorphisms _) ℕ` with degree `len`.
BordismFormalGroups F6.5 constructs it from the native epi–mono factorization under exactly that
name and statement, and this target uses that construction, with no second copy. On top of it: its
opposite on `Δᵒᵖ`, its truncations to `SimplexCategory.Truncated n` (7.4), and a Reedy structure on
`AugmentedSimplexCategory` with degree `len + 1`, `0` for the initial object (Riehl–Verity, TAC
2014, 2.6).
*Needs:* 7.4, BordismFormalGroups F6.5.

**Checks.**

- `[2] → [2]`, `(0, 1, 2) ↦ (0, 0, 2)`, factors as `[2] ↠ [1] ↪ [2]` with degree `1` in between.
- In the augmented category, the map from the initial object to `[0]` raises the degree from `0`
  to `1`.
- On `Δᵒᵖ` the opposite structure has the monomorphisms of `Δ`, reversed, as its lowering class.

### 8.4 The semi-simplex category

Prove `SemiSimplexCategory.exists_reedyStructure_len`: `SemiSimplexCategory` has a direct
`ℕ`-valued Reedy structure with degree `len`, **obtained** from the Reedy structure of `Δ` by
restriction to monomorphisms (7.4) and transport along the isomorphism of categories between
`SemiSimplexCategory` and `WideSubcategory (monomorphisms SimplexCategory)`; `IsDirect` follows
(7.2), as do the facts that a morphism `⦋n⦌ₛ ⟶ ⦋m⦌ₛ` has `n ≤ m`, with `n < m` unless it is the
identity, and that every endomorphism is the identity. Faces `δ i : ⦋n⦌ₛ ⟶ ⦋n + 1⦌ₛ` mapping to
`SimplexCategory.δ i`, the identity `δ_comp_δ`, every morphism a composite of faces, and
semi-simplicial objects `SemiSimplexCategoryᵒᵖ ⥤ D` with the restriction from simplicial objects.
*Needs:* 7.4, 8.3; Mathlib `SemiSimplexCategory`.

**Checks.**

- There are `Nat.choose (n + 1) (m + 1)` morphisms `⦋m⦌ₛ ⟶ ⦋n⦌ₛ`, the order embeddings.
- There is no morphism `⦋1⦌ₛ ⟶ ⦋0⦌ₛ`, while `Δ` has `s⁰ : [1] → [0]`.
- For `i < j`, `δ i ≫ δ j = δ (j - 1) ≫ δ i` in the composition order of Mathlib's `δ_comp_δ`.

### 8.5 The semi-cubical category

The semi-cubical category: objects `⦋n⦌□` for `n : ℕ`; a morphism `⦋m⦌□ ⟶ ⦋n⦌□` is a map
`c : Fin n → Option Bool` with exactly `m` coordinates equal to `none` (the face of `[0, 1]ⁿ`
fixing coordinate `i` to `b` when `c i = some b`); the composite of `c : ⦋m⦌□ ⟶ ⦋n⦌□` and
`d : ⦋n⦌□ ⟶ ⦋p⦌□` is `d` at fixed coordinates and, at the `k`-th free coordinate of `d`, the
value of `c` at `k`. Category axioms, every morphism mono, a direct structure with degree `n`, and
the count of `Nat.choose n k * 2 ^ (n - k)` morphisms `⦋k⦌□ ⟶ ⦋n⦌□`, summing to `3 ^ n`. It is
distinct from `□` of convention 8, which has degeneracies.
*Needs:* 7.2.

**Checks.**

- For `n = 1`: two morphisms from `⦋0⦌□` and one from `⦋1⦌□`, three in all.
- For `n = 2`: four vertices, four edges and one square, nine in all.
- There is no morphism `⦋1⦌□ ⟶ ⦋0⦌□`: degeneracies are absent.

### 8.6 The globe category

The globe category `Globe` of GrothendieckInfinityGroupoids 0.1 is direct with degree `n`, all of
its morphisms are monomorphisms, and there are two morphisms `k ⟶ n` for `k < n`.
*Needs:* 7.2, GrothendieckInfinityGroupoids 0.1.

**Checks.**

- From `0` to `1` there are exactly the source and target maps.
- From `0` to `2` there are two morphisms, not four: the globular identities identify the four
  composites in pairs.
- There is no morphism `n ⟶ k` for `k < n`.

### Examples

- `ℕ`, `Fin n`, `Finset ι`, `WalkingParallelPair`, `WalkingSpan`, `Δ`, the semi-simplex,
  semi-cubical and globe categories.

### Dependencies

Layer 7, BordismFormalGroups F6.5 for 8.3–8.4 and GrothendieckInfinityGroupoids 0.1 for 8.6.

## Layer 9: non-singular presheaves on direct categories

### 9.1 Non-singular presheaves

For any category `C`, define `Presheaf.IsNonsingular X`: for all `x : X.obj (op c)` and
`u v : c' ⟶ c`, `X.map u.op x = X.map v.op x → u = v`. Prove `Presheaf.isNonsingular_iff_isThin`
(`X.Elements` is thin) and, for `[SmallCategory C]`, `Presheaf.isNonsingular_iff_mono` (every
`yonedaEquiv.symm x` is a monomorphism). Every representable is non-singular iff every morphism
of `C` is a monomorphism (cf. Cisinski 2006, 8.2.2). Stability: a presheaf with a morphism to a
non-singular presheaf is non-singular (in particular subpresheaves), coproducts, filtered
colimits, and pushouts along two monomorphisms.
*Needs:* Mathlib `Functor.Elements`, `Quiver.IsThin`, `yonedaEquiv`.

**Checks.**

- `Δ[0]` is not non-singular: for the unique `x : [1] → [0]`, the two vertices `u ≠ v : [0] → [1]`
  have `x ∘ u = x ∘ v`.
- Representables of `SemiSimplexCategory` are non-singular, since all its morphisms are
  monomorphisms.
- The simplicial circle `Δ[1]/∂Δ[1]` is not: its edge has both faces equal to the vertex.

### 9.2 Face posets

For `[IsDirect C]` and `X` non-singular, the type `(c : C) × X.obj (op c)` with
`⟨c', x'⟩ ≤ ⟨c, x⟩ :↔ ∃ u : c' ⟶ c, X.map u.op x = x'` is a partial order, `X.Elements` is
equivalent to its opposite, and it is direct. The canonical cocone exhibits `X` as the colimit of
the representables over it. For `X : SSet` with `[X.Nonsingular]`, the non-degenerate simplices
form a non-singular semi-simplicial set whose face poset is order-isomorphic to `X.N`.
*Needs:* 7.1, 9.1; Mathlib `SSet.Nonsingular`, `SSet.N`.

**Checks.**

- For `C = SemiSimplexCategory` and `X` non-singular, an element `⟨⦋m⦌ₛ, x⟩` has `m + 1` pairwise
  distinct vertices, and `e ↦` (vertices of `e`) is an order isomorphism from the elements below
  it onto the nonempty subsets of that vertex set.
- For the semi-simplicial `Δ[1]`, the face poset is `{0, 1, 01}` with `0, 1 < 01`.
- Directness is needed: on `SingleObj G` with the right regular presheaf `G`, which is
  non-singular, every pair satisfies `⟨★, x'⟩ ≤ ⟨★, x⟩`, so the relation is not antisymmetric
  when `G ≠ 1`.

### 9.3 Discrete fibrations

Define `Functor.IsDiscreteFibration p`: for every `e`, the map `⟨e', g⟩ ↦ ⟨p.obj e', p.map g⟩`
from `Σ e', e' ⟶ e` to `Σ c, c ⟶ p.obj e` is bijective. Prove `isDiscreteFibration_elements`: the
projection `(Functor.Elements.π X).leftOp` is a discrete fibration; the equivalence between
presheaves on a small `C` and the full subcategory of `Over (Cat.of C)` on discrete fibrations,
restricting to an equivalence between non-singular presheaves and discrete fibrations with thin
source, and, for `[IsDirect C]`, with source a partial order. Monomorphisms of presheaves
correspond to functors over `C` injective on objects.
*Needs:* 9.1; Mathlib `Functor.Elements.π`, `Over`.

**Checks.**

- `𝟭 C` is a discrete fibration.
- `[1] ⥤ e` is not: over `1`, the source `Σ e', e' ⟶ 1` has two elements and the target one.
- `e ⥤ [1]` picking `0` is a discrete fibration (the elements of `yoneda 0`), and picking `1` is
  not: `Σ c, c ⟶ 1` has two elements against one.

### 9.4 Pinned posets

For `[IsDirect C]` with every morphism a monomorphism: `Over c` is thin and skeletal,
order-isomorphic to the subobjects of `yoneda.obj c` of the form `Subobject.mk (yoneda.map u)`; a
discrete fibration `p : K ⥤ C` from a partial order induces, for each `ξ`, an order isomorphism
between `{η // η ≤ ξ}` and `Over (p.obj ξ)` compatible with `p`; conversely a strictly monotone
`τ` from `K` to the objects of `C` with compatible isomorphisms `u_ξ` satisfying
`u_ξ ∘ u_η = u_{u_ξ η}` comes from a unique discrete fibration. The category of non-singular
presheaves is thereby equivalent to that of pinned posets. State this for a small skeletal `C` in
which every endomorphism is the identity and every morphism is a monomorphism, and derive the
`[IsDirect C]` form.
*Needs:* 7.1, 9.3; Mathlib `Subobject`.

**Checks.**

- In `SemiSimplexCategory`, `Over ⦋1⦌ₛ` has three objects, the two vertices and the identity.
- The monomorphism hypothesis is needed: in the direct category with `a, b : 0 ⟶ 1` and
  `c : 1 ⟶ 2` subject to `a ≫ c = b ≫ c`, `Over 2` is not thin, `a` and `b` being distinct
  morphisms from `(0, a ≫ c)` to `(1, c)`.
- `ℤ` with its order satisfies the hypotheses of the general form without being direct.

### Examples

- Non-singular simplicial sets, semi-simplicial sets, posets as discrete fibrations.

### Dependencies

Layers 7–8 and Mathlib. Within the layer, 9.2–9.4 use 9.1, and 9.4 uses 9.3.

## Layer 10: derivators

Heller 1988 introduced the same structure independently, as a « homotopy theory ».

### 10.1 Prederivators

For a pseudofunctor `D` (convention 9), define `value D J` and `restrict D F`. Morphisms are
pseudonatural transformations; the represented prederivator `J ↦ (J ⥤ C)` (Groth 2013,
Example 1.11), the opposite prederivator (Definition 1.15), the shifted prederivator
`D^M (J) := D(M × J)` (Theorem 1.31) and the underlying diagram functors `D(J) ⥤ D(e)^J`.
*Needs:* Mathlib `Pseudofunctor`, `Bicategory.Opposite`.

**Checks.**

- For the represented prederivator of `Type u`, restriction along `J ⥤ e` is the constant diagram
  functor.
- `F^*` is contravariant in `F`, while a natural transformation `F ⟶ G` gives `F^* ⟶ G^*` in the
  same direction: the opposite bicategory reverses 1-cells only.
- The opposite of the prederivator represented by `C` is represented by `Cᵒᵖ`.

### 10.2 The axioms

Define `SatisfiesDer2` and `SatisfiesDer3`, with Der1 and Der4 (Groth 2013, Definition 1.10),
strong derivators (Definition 1.13); prove the existence of initial and terminal objects in each
`D(J)` (Proposition 1.12) and define homotopy Kan extensions (Definition 1.9).
*Needs:* 10.1.

**Checks.**

- The represented prederivator of a complete and cocomplete category satisfies Der1–Der4
  (Example 1.11).
- For the discrete category on two objects, the represented prederivator fails Der3: restriction
  along the functor from two points to `e` has no left adjoint, the two objects having no
  coproduct.
- The constant prederivator `J ↦ Type u` fails Der1 at `J = ∅`, where `D(∅)` must be the point.

### 10.3 Homotopy exact squares and Kan extensions

Homotopy exact squares (Definition 1.21, Lemmas 1.18–1.20); adjunctions give homotopy exact squares
(Lemma 1.23, Proposition 1.24); Kan extension along a fully faithful functor is fully faithful
(Proposition 1.26, Lemma 1.27), with essential image `fixedRight` of 0.1; along a cosieve `u_!` is
fully faithful with essential image the diagrams initial off `u`, dually for sieves (Proposition
1.29); pullbacks along Grothendieck opfibrations are homotopy exact (Proposition 1.30).
*Needs:* 0.1, 10.2.

**Checks.**

- In the represented derivator of `Type u`, left Kan extension along `e ⥤ [1]` picking `0` sends
  `X` to `𝟙 : X ⟶ X`, and the essential image is the diagrams with invertible arrow, `fixedRight`.
- Along the cosieve `{1} ⊆ [1]`, `u_! Y` has value `∅` at `0`, since no arrow goes from `1` to
  `0`.
- Along the sieve `{0} ⊆ [1]`, `u_* X` has the terminal value at `1`.

### 10.4 Pointed and stable derivators

(Co)Cartesian squares (Definitions 3.9–3.10, Propositions 3.11, 3.13, 3.14); pointed derivators
(Definition 3.1, Propositions 3.2 and 3.6, Lemma 3.7, Corollary 3.8), extension by zero, `(Σ, Ω)`
(Definition 3.19, Proposition 3.20), cofibres (Definition 3.21, Propositions 3.23–3.25); stable
derivators (Definition 4.1, Propositions 4.3–4.7, Corollary 4.8), additivity (Corollary 4.14), and
the canonical triangulated structure on every `D(J)` as a Mathlib `Pretriangulated` and
`IsTriangulated` category (Theorem 4.15), with restrictions and Kan extensions exact
(Corollary 4.19).
*Needs:* 10.3; Mathlib `Pretriangulated`.

**Checks.**

- The represented derivator of `Type u` is not pointed: `∅` is not terminal.
- The represented derivator of abelian groups is pointed and not stable: the square with `ℤ` at
  the corner and `0` elsewhere is cocartesian (the pushout of `0 ← ℤ → 0` is `0`) and not
  cartesian (the pullback of `0 → 0 ← 0` is `0`, not `ℤ`).
- For the derivator of chain complexes, `Σ` is the shift `[1]`.

### 10.5 Examples

For an arbitrary Mathlib model category `M`, the derivator `J ↦ (J ⥤ M)[W_J⁻¹]`, localizing the
diagram category at the levelwise weak equivalences, which needs no model structure on `J ⥤ M`
(Groth 2013, Theorem 1.38; Cisinski 2003); it is strong when `M` is combinatorial (Groth 2013,
Proposition 1.36). In particular `HOT := J ↦ (J ⥤ Cat)[W_J⁻¹]` for Thomason's model structure
(5.4). The derivator of a cofibration category is 11.4.
*Needs:* 5.4, 10.2; Mathlib `HomotopicalAlgebra.ModelCategory`.

**Checks.**

- For the model structure on `Type u` with isomorphisms as weak equivalences, the derivator is the
  represented one.
- `HOT(e)` is `Hot` of 4.5.
- For `J = ∅`, `(∅ ⥤ M)[W⁻¹]` is the point, as Der1 requires.

### Examples

- Represented derivators of complete and cocomplete categories; derivators of model categories.

### Dependencies

Layer 0 (0.1) and Mathlib; 10.5 uses 5.4. Within the layer, each target uses the previous ones.

## Layer 11: cofibration categories

### 11.1 Axioms

Define `IsCofibrationCategory` (convention 10) over Mathlib's `CategoryWithCofibrations` and
`CategoryWithWeakEquivalences`. Cofibrant objects, cofibrant replacement, and the full subcategory
of cofibrant objects as a cofibration category.
*Needs:* Mathlib `CategoryWithCofibrations`, `CategoryWithWeakEquivalences`, `IsPushout`.

**Checks.**

- `Type u` with all maps as cofibrations and the bijections as weak equivalences satisfies C1–C3:
  pushouts exist and `f = f ≫ 𝟙`.
- With the injections as cofibrations instead, C3 fails for any non-injective map: an injection
  followed by a bijection is injective.
- With the injections as cofibrations, every set is cofibrant, `∅ → X` being injective.

### 11.2 Brown's factorization lemma and the homotopy category

Prove `brown_factorization`: every map between cofibrant objects is `i ≫ r` with `i` a
cofibration and `r` a retraction of a trivial cofibration `j`; consequently a functor sending
trivial cofibrations between cofibrant objects to isomorphisms sends all weak equivalences between
cofibrant objects to isomorphisms (Brown 1973, §1, Factorization lemma, dualized). The inclusion
of cofibrant objects induces an equivalence of localizations, and every morphism of `Ho(C)`
between cofibrant objects is a fraction `γ(s)⁻¹ γ(f)` with `s` a trivial cofibration.
*Needs:* 11.1.

**Checks.**

- In the first example of 11.1, take `Z = Y`, `i = f`, `j = r = 𝟙`.
- In general, factor `(f, 𝟙) : X ⊔ Y → Y` by C3 as a cofibration `X ⊔ Y → Z` followed by a weak
  equivalence `r`; `i` and `j` are the two inclusions, and `j` is a weak equivalence by
  two-out-of-three since `j ≫ r = 𝟙`.
- The inclusion `X → X ⊔ Y` is a cofibration as the cobase change of `initial.to Y`, which needs
  `Y` cofibrant: the hypotheses `hX`, `hY` are used.

### 11.3 Model categories

The cofibrant objects of a Mathlib model category form a cofibration category. On them, Brown's
factorization is Mathlib's: the conclusion of `brown_factorization` follows from Mathlib's
`Nonempty (CofibrantBrownFactorization f)` with `r := p` and `j := s` (`s` a trivial cofibration,
`s ≫ p = 𝟙`), and nothing here reproves the model-category case.
*Needs:* 11.2; Mathlib `HomotopicalAlgebra.ModelCategory`, `CofibrantBrownFactorization`.

**Checks.**

- In spaces, for `f : X → Y` the mapping cylinder gives `Z`, with `j : Y → Z` and the retraction
  `r : Z → Y`.
- The fields `s` and `p` of `CofibrantBrownFactorization f` give `j` and `r` exactly.
- For the trivial model structure on `Type u` (isomorphisms as weak equivalences), `Z = Y`.

### 11.4 The derivator of a cofibration category

A cofibration category is a right derivable category in the sense of Cisinski 2010, 2.22, and the
prederivator `E ↦ Ho(C^E)` on finite direct categories `E` (`IsDirect`, 7.1, and finite) is a weak
right derivator of domain `Dir_f` satisfying Der5 (Cisinski 2010, Corollary 2.24, Definition A.5
dualized). Cisinski writes `D_C(E) := Ho(Hom(Eᵒᵖ, C))`, presheaves on `E`; in the form of
convention 9 this is `E ↦ Ho(C^E)` after `E ↦ Eᵒᵖ`, which preserves `Dir_f`, and Der 4 of
Definition A.5 is read with the corresponding comma categories.
*Needs:* 7.1, 10.2, 11.2.

**Checks.**

- `[1]` and the direct `WalkingSpan` (8.2) are in `Dir_f`.
- For a finite category, `IsDirect C` iff `IsDirect Cᵒᵖ` iff no composite of non-identity
  morphisms is an endomorphism: `Dir_f` is self-dual, as `E ↦ Eᵒᵖ` requires.
- `ℤ` and `SingleObj G` for `G ≠ 1` are not (not direct, 7.1).
- `Ho(C^e) = Ho(C)`.

### Examples

- Cofibrant objects of a model category; sets with bijections.

### Dependencies

Layers 7 and 10 and Mathlib's model categories. Within the layer, each target uses the previous.

## Layer 12: gr-categories, crossed modules and Picard groupoids

### 12.1 Gr-categories

Define `IsGrCategory` (convention 11) and prove `isUnit_skeleton`: every element of `π₀`, with
Mathlib's monoid structure, is a unit. Monoidal functors and transformations; `π₀`, `π₁` (abelian
by Eckmann–Hilton), the action and their functoriality; every gr-category is monoidally equivalent
to a skeletal one and to a strict one (Baez–Lauda 2004, Propositions 39 and 45).
*Needs:* Mathlib `MonoidalCategory`, `Skeleton.instMonoid`, `Aut`.

**Checks.**

- The skeletal gr-category with objects `ℤ/3`, `Aut x = ℤ/7`, trivial associator and unitors,
  `a ▷ X` labelled `a` and `X ◁ b` labelled `4ˣ b` (`4³ ≡ 1 mod 7`), is monoidal. Convention 11
  gives the action `a ↦ R_X⁻¹ (L_X a) = 4⁻ˣ a = 2ˣ a`: the generator acts by `2`; the reverse
  composite `L_X⁻¹ ∘ R_X` would give `4`.
- The discrete monoidal category on a group `G` is a gr-category with `π₀ = G`, `π₁ = 1`; on the
  monoid `ℕ` it is not, and `1 ∈ π₀ = ℕ` is not a unit.
- For an abelian group `A`, the one-object groupoid `BA` with tensor the addition has `π₀ = 1`,
  `π₁ = A`.

### 12.2 Sính's classification

Monoidal equivalence classes of gr-categories are in bijection with isomorphism classes of
quadruples `(G, M, action, k ∈ H³(G, M))`; monoidal functors between skeletal models correspond to
`(φ, ψ, κ)` with `dκ = ψ k − k' φ`, and monoidal transformations to 1-cochains (Sính 1975;
Baez–Lauda 2004, Theorem 43 and Corollary 44).
*Needs:* 12.1; Mathlib `groupCohomology`, `Rep`.

**Checks.**

- The example of 12.1 has `k = 0`.
- For `π₀ = π₁ = ℤ/2` with trivial action, `H³(ℤ/2, ℤ/2) = ℤ/2`: two classes.
- For `π₀ = ℤ/3` acting on `π₁ = ℤ/7`, `H³ = 0`, the orders being coprime: every such
  gr-category is equivalent to the split one.

### 12.3 Crossed modules

Consume SchemeAndStackFoundations §1.24's `CrossedModule Ht H`, with `H` acting on `H̃` and
`∂(h · x) = h ∂(x) h⁻¹`, its `.quotientCategory`, `.isGroupoid`, `.isoClasses` (`coker ∂`) and
`.aut` (`ker ∂`). Build here the monoidal structure on `.quotientCategory`, making it a
gr-category; the Brown–Spencer equivalence between crossed modules and group objects in groupoids
(Brown–Spencer 1976); and the `k`-invariant of the associated gr-category.
*Needs:* 12.1, 12.2, SchemeAndStackFoundations §1.24.

**Checks.**

- `∂ = 𝟙 : H → H` with conjugation: the quotient category is indiscrete, the gr-category is
  equivalent to the unit one, `π₀ = π₁ = 1`.
- `H̃ = A` abelian, `H = 1`: one object with automorphism group `A`, the gr-category `BA` of 12.1.
- `H̃ = 1`: the discrete monoidal category on `H`.

### 12.4 Extensions with non-abelian kernel

For groups `Q`, `N` and `ψ : Q →* Out N`, the obstruction in `H³(Q, Z(N))` vanishes iff an
extension inducing `ψ` exists, and the extensions then form a torsor under `H²(Q, Z(N))` (Brown
1982, Chapter IV, §6). Identify the obstruction with the `k`-invariant of the gr-category pulled
back from the crossed module `N → Aut N` along `ψ`.
*Needs:* 12.3.

**Checks.**

- `N` abelian: the semidirect product exists, the obstruction vanishes, and extensions form a
  torsor under `H²(Q, N)`.
- `N = Q = ℤ/2`, `ψ` trivial: `H²(ℤ/2, ℤ/2) = ℤ/2`, the extensions `ℤ/4` and `ℤ/2 × ℤ/2`.
- `N = S₃` (trivial centre): the extension is unique, the pullback of `Aut N → Out N` along `ψ`.

### 12.5 Braided gr-categories and Picard groupoids

Braided gr-categories are classified by `(π₀, π₁, q)` with `q(x) = β_{x,x}` quadratic
(Joyal–Street 1993, §3). For SchemeAndStackFoundations' `PicardGroupoid` (convention 12), prove
that it is a gr-category with the groupoid structure given by inverses, with `pi0` and `pi1` the
`π₀` and `π₁` of convention 11 as groups; the sign `ε` is a homomorphism killed by `2`, and Picard
groupoids are classified by `(π₀, π₁, ε)` (Sính 1975, Chapter II, §2; Johnson–Osorno 2012,
Proposition 2.5 and Corollary 2.8). A Picard groupoid is strictly commutative iff `ε = 0`.
*Needs:* 12.1, 12.2, SchemeAndStackFoundations §3.4.

**Checks.**

- SchemeAndStackFoundations' `gradedPicardGroupoid (Spec ℚ)` has `ε(𝒪, 1) = −1 ≠ 1` in
  `π₁ = ℚ^×`: its symmetry on `(𝒪, 1) ⊗ (𝒪, 1)` is the swap of `𝒪 ⊗ 𝒪` (the identity under
  `𝒪 ⊗ 𝒪 ≅ 𝒪`) times `(−1)^{1·1}`. It is not strictly commutative.
- `2ε = 0` because `β_{X,X} ≫ β_{X,X} = 𝟙` in a symmetric category.
- The discrete symmetric monoidal category on an abelian group is strictly commutative, `ε = 0`.

### 12.6 Two-term complexes and Deligne over a point

Define `IsStrictlyCommutative` and `TwoTerm d` (convention 13), with `TwoTerm.Hom` (a label
`k : K⁻¹` with `x + d k = y`), the `0`-labelled `TwoTerm.eqHom` and `TwoTerm.eqIso`, and the groupoid,
monoidal and symmetric instances, whose proof obligations are the label identities
`TwoTerm.comp_label`, `TwoTerm.eqIso_hom_label` and `TwoTerm.eqIso_inv_label`. `ch(d)` is a
gr-category (`x ⊗ (−x) ≅ 𝟙_` by `TwoTerm.eqIso`) and strictly commutative (`β_{x,x}` is labelled
`0`), each in one step from the instances. Prove `nonempty_skeletonTwoTerm_mulEquiv`
(`π₀ = coker d`) and `nonempty_autUnitTwoTerm_mulEquiv` (`π₁ = ker d`). Every strictly commutative
Picard groupoid is equivalent to some `ch(d)`, and `d ↦ ch(d)` induces an equivalence between the
full subcategory of `DerivedCategory (ModuleCat ℤ)` of complexes with cohomology in degrees `-1, 0`
and strictly commutative Picard groupoids with isomorphism classes of symmetric monoidal functors
(Deligne, SGA 4 XVIII, 1.4.15, for the punctual site); over a point, every strictly commutative
Picard groupoid is equivalent to `ch(0 : π₁ → π₀)`.
*Needs:* 12.5; Mathlib `SymmetricCategory`, `Skeleton`, `DerivedCategory`.

**Checks.**

- `d = 0 : K⁻¹ → K⁰`: `π₀ = K⁰`, `π₁ = K⁻¹`.
- `d = 𝟙 : ℤ → ℤ`: `π₀ = π₁ = 0`, and `ch(d)` is equivalent to the unit; `d = 2 : ℤ → ℤ`:
  `π₀ = ℤ/2`, `π₁ = 0`, while `ℤ/2 → 0` gives `π₀ = 0`, `π₁ = ℤ/2`.
- The symmetry `β_{x,x}` of `ch(d)` is labelled `0`, the identity: strictly commutative, so
  `gradedPicardGroupoid (Spec ℚ)` (12.5) is equivalent to no `ch(d)`.

### 12.7 Topological realizations

For a topological group `G`, the fundamental groupoid of `G` (Mathlib `FundamentalGroupoid`) is a
group object in groupoids, hence a crossed module (Brown–Spencer 1976), with `π₀ = π₀(G)`,
`π₁ = π₁(G, 1)` and the action of `π₀(G)` induced by conjugation. For a pointed space `(X, x)`,
the fundamental groupoid of the loop space with concatenation is a gr-category `Π₂(X, x)` with
`π₀ ≅ π₁(X, x)` and `π₁ ≅ π₂(X, x)`, through Tau Ceti's `HomotopyGroup.loopSpaceMulEquiv` and
`zerothHomotopyLoopSpaceEquivFundamentalGroup`, and the action is the standard action of `π₁` on
`π₂`.
*Needs:* 12.1, 12.3; Mathlib `FundamentalGroupoid`, `HomotopyGroup`, `IsTopologicalGroup`;
Tau Ceti `HomotopyGroup.loopSpaceMulEquiv`.

**Checks.**

- `G = S¹`: `π₀ = 1`, `π₁ = ℤ`.
- `G = O(2)`: `π₀ = ℤ/2` acts on `π₁(SO(2)) = ℤ` by `−1`, conjugation by a reflection inverting
  rotations.
- `X = ℝP²`: `π₀ = ℤ/2` acts on `π₂ = ℤ` by `−1`, the antipodal map of `S²` having degree `−1`.

### Examples

- `ch(d)` for every two-term complex; `Π₂(X, x)`; the gr-category of a crossed module.

### Dependencies

Mathlib, Tau Ceti and SchemeAndStackFoundations §§1.24 and 3.4. Within the layer, each target uses
12.1, and 12.6 uses 12.5.

## Layer 13: Picard stacks over a site

### 13.1 Picard stacks

For a small site `(C, J)`, a Picard stack is an `F : LocallyDiscrete Cᵒᵖ ⥤ᵖ Cat` with
`F.IsStack J`, a symmetric monoidal structure on each value making it a `PicardGroupoid`
(convention 12) and symmetric monoidal restriction functors with coherent structure isomorphisms;
morphisms are pseudonatural transformations, symmetric monoidal objectwise. Gr-stacks are the same
with gr-categories. Define `π₀` (the sheafification of the presheaf of `π₀`) and `π₁` (the sheaf
`Aut(𝟙)`) as abelian sheaves.
*Needs:* 12.5, SchemeAndStackFoundations §§1.18 and 3.4; Mathlib `Pseudofunctor.IsStack`.

**Checks.**

- On the punctual site, Picard stacks are Picard groupoids.
- For the stack of line bundles on the small Zariski site of a scheme, the presheaf
  `U ↦ Pic(U)` is nonzero in general but its sheafification `π₀` is `0`, every line bundle being
  locally trivial; `π₁ = 𝒪^×`.
- `π₁` needs no sheafification: the stack condition makes `U ↦ Aut(𝟙_U)` a sheaf.

### 13.2 Deligne's construction

For a complex `d : K⁻¹ ⟶ K⁰` of abelian sheaves on `(C, J)`, `ch(d)` is
`Stack.stackification J` (SchemeAndStackFoundations §1.18) of the prestack `U ↦ ch(d(U))`, with its
induced strictly commutative Picard structure.
*Needs:* 12.6, 13.1, SchemeAndStackFoundations §1.18.

**Checks.**

- `d : 0 → 𝒜`: `ch(d)` is the discrete stack of the sheaf `𝒜`, already a stack.
- `d : 𝒜 → 0`: the prestack `U ↦ B𝒜(U)` has stackification the stack of `𝒜`-torsors, with
  `π₀ = 0` and `π₁ = 𝒜`.
- `d : 𝔾_m → 0` on a scheme gives the Picard stack of line bundles.

### 13.3 Deligne's theorem

Every strictly commutative Picard stack is equivalent to some `ch(d)`, and `ch` induces an
equivalence between the full subcategory of `DerivedCategory (Sheaf J AddCommGrpCat)` of
complexes with cohomology in degrees `-1, 0` and strictly commutative Picard stacks with
isomorphism classes of morphisms (SGA 4 XVIII, 1.4.15). Consequences: `π₀ ch(d) ≅ H⁰`,
`π₁ ch(d) ≅ H⁻¹`, and the equivalence classes of strictly commutative Picard stacks with
`π₀ ≅ M`, `π₁ ≅ N` are in bijection with `Ext²(M, N)` in `Sheaf J AddCommGrpCat`.
*Needs:* 13.2; Mathlib `DerivedCategory`, `Sheaf`.

**Checks.**

- `M = 0`: `Ext²(0, N) = 0`, and the only class is the stack of `N`-torsors.
- On the punctual site `Ext²_ℤ(M, N) = 0` (`ℤ` has global dimension one), recovering 12.6.
- For `d = 2 : ℤ → ℤ` (constant sheaves), `π₀ = ℤ/2` and `π₁ = 0`.

### Examples

- Stacks of torsors under an abelian sheaf; the Picard stack of line bundles.

### Dependencies

Layer 12 and SchemeAndStackFoundations §§1.18 and 3.4. Within the layer, 13.2 uses 13.1 and 13.3
uses 13.2.

## Downstream consumers

No roadmap on main cites this one. GrothendieckNotesLemmas names this roadmap as the owner of
idempotent adjunctions, additive functors on a Karoubi envelope and Beck's theorem as a
characterization (0.1–0.3) and of the semi-simplex category (8.4). GrothendieckInfinityGroupoids
lists this roadmap as the consumer of its globe category in 8.6, and GrothendieckTopoi records that
this roadmap uses none of its material.

## Research context

Grothendieck's programme in *Pursuing Stacks* asks which classes `W` of functors are basic
localizers modelling homotopy types, and which small categories are test categories; Cisinski's
theorem that `W∞` is the class of Thomason equivalences settles the minimality conjecture of
*Pursuing Stacks*. Derivators, introduced by Grothendieck in *Les Dérivateurs* and by Heller as
homotopy theories, are the setting in which the homotopy theory of small categories and of model
categories are compared.

## References

- F. Borceux, *Handbook of Categorical Algebra 1*, Encyclopedia of Mathematics and its
  Applications 50, Cambridge University Press (1994): Proposition 3.4.1.
- S. Mac Lane, *Categories for the Working Mathematician*, GTM 5, 2nd ed., Springer (1998), VI.7,
  Theorem 1 (Beck).
- D.-C. Cisinski, « La classe des morphismes de Dwyer n'est pas stable par rétractes », *Cahiers
  Top. Géom. Diff. Catég.* 40 (1999), 227–231. It shows that Thomason 1980, Lemma 5.3 3°, is false
  as stated; 5.4 routes the pseudo-Dwyer maps and properness through it.
- D.-C. Cisinski, « Le localisateur fondamental minimal », *Cahiers Top. Géom. Diff. Catég.*
  45 (2004), 109–140: 1.1.1 (FS1–FS3), Definition 1.1.3 (LF1–LF3), Remark 1.1.4,
  Propositions 1.1.5, 1.1.7, 1.1.9, 1.1.13, Corollaries 1.1.10, 1.1.11, Proposition 1.2.4,
  Lemma 1.3.6, Theorem 1.3.10, Theorem 2.1.13, Lemmas 2.2.2, 2.2.6, 2.2.8, Propositions 2.2.3,
  2.2.9, Corollary 2.2.4, Remark 2.2.5, Theorem 2.2.11, 2.3.1, Theorem 2.3.2, Corollary 2.3.3,
  Theorem 2.3.6.
- D.-C. Cisinski, *Les préfaisceaux comme modèles des types d'homotopie*, Astérisque 308 (2006), Zbl
  1111.18008: Corollary 8.4.13 and Proposition 8.4.27 (the cube category is a test category); 8.2.2
  (representables and monomorphisms); 9.2.1 and Corollary 9.2.15 (the `n`-equivalences); 9.4.1–9.4.3
  (`E_*`-equivalences form a basic localizer). Erratum: in Proposition 4.3.2 the conditions (c) and
  (g) are not equivalent; only (c) ⇒ (g) holds. Counterexample to (g) ⇒ (c): `A = BG` with `G ≠ 1`
  and `W = W∞` (6.2).
- D.-C. Cisinski, « Images directes cohomologiques dans les catégories de modèles », *Ann.
  Math. Blaise Pascal* 10 (2003), 195–244 (the derivator of a model category).
- D.-C. Cisinski, « Catégories dérivables », *Bull. SMF* 138 (2010), 317–393: 1.1 (axioms
  D0–D4), 2.1 (`Dir_f`), Theorem 2.21, 2.22, Corollary 2.24, Definition A.5.
- E. Riehl and D. Verity, *The theory and practice of Reedy categories*, Theory Appl. Categ. 29
  (2014), 256–301, Zbl 1302.55014, [arXiv:1304.6871](https://arxiv.org/abs/1304.6871). Item
  numbers cited in Layers 7–8 (2.3–2.7) are those of the arXiv version.
- G. Maltsiniotis, *La théorie de l'homotopie de Grothendieck*, Astérisque 301 (2005):
  Propositions 1.6.1, 1.6.8, 1.6.13 (1.6.14 in the author's preprint), 2.1.3.
- G. Maltsiniotis, « La catégorie cubique avec connexions est une catégorie test stricte »,
  *Homology Homotopy Appl.* 11 (2009), 309–326: §§1.1–1.2 (cube categories), §2 (test
  categories recalled: 2.1–2.5, Theorem 2.6), §3, §5.
- A. Grothendieck, *Pursuing Stacks* (ed. G. Maltsiniotis, Documents Mathématiques 20, SMF,
  2022; the 1983 typescript is open access as
  [arXiv:2111.01000](https://arxiv.org/abs/2111.01000)), and *Les Dérivateurs* (ed. M. Künzer,
  J. Malgoire, G. Maltsiniotis).
- P. Gabriel, M. Zisman, *Calculus of Fractions and Homotopy Theory*, Ergebnisse der
  Mathematik 35, Springer (1967), Zbl 0186.56802: Chapter I, 1.1.
- D. Quillen, « Higher algebraic K-theory I », LNM 341 (1973), §1, Theorems A and B.
- R. W. Thomason, « Cat as a closed model category », *Cahiers Top. Géom. Diff.* 21 (1980),
  305–324: Definitions 2.1–2.3, 4.1, Propositions 4.2, 4.3, Corollary 4.4, Theorem 4.9,
  Corollary 5.5, Proposition 5.7.
- M. Groth, « Derivators, pointed derivators and stable derivators », *Algebr. Geom. Topol.* 13
  (2013), 313–374 (arXiv:1112.3840): Definitions 1.1, 1.9, 1.10, 1.13, 1.15, 1.21, 1.28, 3.1,
  3.4, 3.9, 3.10, 3.19, 3.21, 4.1; Example 1.11; Lemmas 1.18–1.20, 1.23, 1.27, 3.7;
  Propositions 1.12, 1.24, 1.26, 1.29, 1.30, 1.36, 3.2, 3.6, 3.11, 3.13, 3.14, 3.20,
  3.23–3.25, 4.3–4.7; Theorems 1.31, 1.38, 4.15; Corollaries 3.8, 4.8, 4.14, 4.19.
- A. Heller, *Homotopy theories*, Mem. Amer. Math. Soc. 71 (1988), no. 383,
  doi:10.1090/memo/0383, Zbl 0643.55015.
- G. Raptis, « Homotopy theory of posets », *Homology Homotopy Appl.* 12 (2010), no. 2, 211–230,
  doi:10.4310/HHA.2010.v12.n2.a7: Theorem 2.6.
- H.-J. Baues, *Algebraic Homotopy*, Cambridge Studies in Adv. Math. 15 (1989), Chapter I, (1.1).
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
- P. Deligne, « La formule de dualité globale », SGA 4, Exposé XVIII, LNM 305 (1973), §1.4,
  Proposition 1.4.15.
