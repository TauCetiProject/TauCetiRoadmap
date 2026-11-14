module

public import Mathlib
public import TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence
public import TauCeti.AlgebraicTopology.Quasicategory.CatInfty
public import TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful
public import TauCeti.AlgebraicTopology.Quasicategory.Limit
public import TauCeti.AlgebraicTopology.SimplicialSet.AnodyneExtensions.LeftRight.Basic
public import TauCeti.AlgebraicTopology.SimplicialSet.CardinalFiltered
public import TauCeti.AlgebraicTopology.SimplicialSet.InternalHom
public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence
public import TauCeti.AlgebraicTopology.SimplicialSet.WeaklyContractible

/-!
# Presheaves, idempotent completions, filtered and sifted colimits, and Ind-objects: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the README's headline theorems
that are statable against the pinned Mathlib and Tau Ceti, with the definitions their statements
need. ∞-categories are quasicategories, Mathlib's `SSet.Quasicategory`. Colimits are initial vertices
of coslices (Tau Ceti `SSet.coslice.IsColimit`), limits terminal vertices of slices, fully faithful
maps Tau Ceti's `SSet.IsFullyFaithful`, categorical equivalences of quasicategories Tau Ceti's
`SSet.QCat.IsCategoricalEquivalence`, κ-filteredness Tau Ceti's `SSet.IsCardinalFiltered`, and a
simplicial set `K` is κ-small when `HasCardinalLT K.N κ` (fewer than κ nondegenerate simplices).

Stated below: retracts of colimit diagrams (Layer 1, HTT Lemma 5.1.6.3); the shapes `idem`, `idemPlus`
and `ret` of HTT Def. 4.4.5.2, with the inner anodyne inclusion of `ret`, effective idempotents, the
Kan extension property of strong retraction diagrams and the cofinality of `N(A) ⟶ Idem` (Layer 2);
idempotent completions, their existence, slices, cofinality and uniqueness (Layer 3); filtered
∞-categories, the tests for κ-filteredness, weak contractibility, cofinal diagonals, cofinal maps
from filtered posets and κ-right exact functors (Layer 4); sifted simplicial sets, the two-variable
colimit lemma, the basic sifted shapes, joint preservation of sifted colimits and weak
contractibility (Layer 5); κ-continuous functors, towers of ∞-categories, the cocomplete envelope of
HTT Lemma 5.3.5.7 and filtered colimits of idempotent complete ∞-categories in `Cat∞` (Layer 6).

Definitions owned by earlier Parts are restated with the same names and bodies: colimit and limit
diagrams (Part InfinityCategoryFoundations §1.2), cofinality and the restriction of sections (Part
LimitsAndKanExtensions §2.1), relative colimits and left Kan extensions along a full subcomplex
(Part LimitsAndKanExtensions §7.1) and retracts (Part AdjunctionsAndLocalizations §2.1).

Not statable at the pins:
* everything involving the Yoneda embedding `j : K ⟶ P(K)` or corepresented functors `C ⟶ Ŝ` (§1.1):
  the three models of presheaves (§1.2), Yoneda's lemma (§1.3.1, HTT Prop. 5.1.3.1) and its
  corollaries (§1.3), the free cocompletion (§1.4.3, HTT Thm. 5.1.5.6) and generation by
  representables (§1.4), restriction of presheaves and the explicit right adjoints (§1.5),
  completely compact objects (§1.6), the recognition of presheaf ∞-categories (§1.7), free
  resolutions of presheaves (§5.5), κ-compact objects, `Ind_κ` and everything stated about them
  (§6.1, §6.3–§6.5), among them the universal property of `Ind_κ` (§6.5.3, HTT Prop. 5.3.5.10):
  `j` is built from the rigidification `C[−]` on all simplicial sets and `Ex^∞`, neither in Mathlib
  or Tau Ceti;
* the ∞-categories `Fun^L` and `Fun^R` and the duality of adjoints (§1.5, HTT Prop. 5.2.6.2): the
  canonical equivalence is constructed through the Yoneda embedding, as above;
* the coherence condition on idempotents of the homotopy category and the lifting of idempotents
  (§6.6, HTT Prop. 4.4.5.20): the monoidal groupoid `Π₁ Map_C(X, X)` has no carrier;
* the characterizations of κ-filtered simplicial sets (§4.4, HTT Prop. 5.3.1.19) and the
  categorical equivalences for joins, linear orders and the Reedy extension step (§5.4, §5.5, HTT
  Lemmas 5.4.5.10, 5.4.6.2, A.2.9.18, Prop. A.2.9.14): they need categorical equivalences out of
  simplicial sets that are not quasicategories, and Tau Ceti's are between quasicategories only;
* the commutation of sifted colimits with finite products (§5.3.5, §5.3.6, HTT Lemma 5.5.8.11,
  Remark 5.5.8.12) and of κ-filtered colimits with κ-small limits in spaces (§6.2.2, HTT
  Prop. 5.3.3.3): the colimit functor `Fun(K, X) ⟶ X`, the product functor `X × X ⟶ X` and the
  functor `Z × −` on `S` have no carrier (Mathlib's `SimplicialNerve` has no functoriality in
  simplicial functors);
* filtered colimits of Kan complexes and homotopy pullbacks (§6.2.1): homotopy pullback squares of
  simplicial sets have no carrier.
-/

public section

namespace TauCetiRoadmap.InfinityCategoryTheory.PresheavesAndCompletions

open CategoryTheory Limits MonoidalCategory MonoidalClosed CartesianMonoidalCategory Simplicial SSet

universe u v

/-! ## Diagrams, cofinality and Kan extensions (restated from earlier Parts) -/

/-- A map `f : A ⟶ B` of simplicial sets is a categorical equivalence when, for every
∞-category `C`, restriction along `f` induces an equivalence of homotopy categories
`h Fun(B, C) ⥤ h Fun(A, C)`. Part InfinityCategoryFoundations' definition (its §2.1.6), repeated with the same body. (HTT, Def. 1.1.5.14, in
the equivalent form of Kerodon, §4.5.4, Def. 4.5.4.1.) -/
def IsCategoricalEquivalence {A B : SSet.{u}} (f : A ⟶ B) : Prop :=
  ∀ (C : SSet.{u}) [C.Quasicategory],
    (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence

/-- The class of categorical equivalences. Part InfinityCategoryFoundations' definition (its §2.1.6), repeated
with the same body. -/
def categoricalEquivalences : MorphismProperty SSet.{u} :=
  fun _ _ f ↦ IsCategoricalEquivalence f

open MorphismProperty in
/-- The categorical fibrations: maps with the right lifting property against every monomorphism that is a
categorical equivalence, the fibrations of the Joyal model structure. Part InfinityCategoryFoundations'
definition (its §9.4.1), repeated with the same body. (HTT, §2.2.5, p. 108.) -/
def categoricalFibrations : MorphismProperty SSet.{u} :=
  (monomorphisms SSet.{u} ⊓ categoricalEquivalences).rlp

/-- A map `p̄ : K ⋆ Δ[0] ⟶ C` out of the right cone is a *colimit diagram* when the cocone it
determines under `p = p̄|K`, a vertex of the coslice `C_{p/}`, is a colimit cocone in the sense of
Tau Ceti's `SSet.coslice.IsColimit`; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations §1.2.4.
(HTT, Def. 1.2.13.4.) -/
def IsColimitDiagram {K C : SSet.{u}} (q : join K Δ[0] ⟶ C) : Prop :=
  coslice.IsColimit (join.inl _ _ ≫ q)
    ((coslice.objEquiv (p := join.inl _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- A map `p̄ : Δ[0] ⋆ K ⟶ C` out of the left cone is a *limit diagram* when the cone it determines
over `p = p̄|K`, a vertex of the slice `C_{/p}`, is a limit cone in the sense of Tau Ceti's
`SSet.slice.IsLimit`; used for ∞-categories `C`. Owned by Part InfinityCategoryFoundations §1.2.4.
(HTT, Def. 1.2.13.4.) -/
def IsLimitDiagram {K C : SSet.{u}} (q : join Δ[0] K ⟶ C) : Prop :=
  slice.IsLimit (join.inr _ _ ≫ q)
    ((slice.objEquiv (p := join.inr _ _ ≫ q) (n := .op ⦋0⦌)).symm ⟨q, rfl⟩)

/-- Restriction of sections along `v : K ⟶ B`: a section of `p : E ⟶ B` over `B` restricts to a
map `K ⟶ E` over `v`. Owned by Part LimitsAndKanExtensions §2.1.1. (HTT, Def. 4.1.1.1, the map
`Map_B(B, E) ⟶ Map_B(K, E)`.) -/
noncomputable def sectionsRestrict {K B E : SSet.{u}} (p : E ⟶ B) (v : K ⟶ B) :
    (SSet.ihomOver p (𝟙 B) : SSet.{u}) ⟶ (SSet.ihomOver p v : SSet.{u}) :=
  SSet.ihomOver.homEquiv.symm
    ⟨v ▷ _ ≫ (SSet.ihomOver.homEquiv (𝟙 (SSet.ihomOver p (𝟙 B) : SSet.{u}))).1, by
      rw [Category.assoc, (SSet.ihomOver.homEquiv (𝟙 _)).2, Category.comp_id, whiskerRight_fst]⟩

/-- A map `v : K ⟶ B` of simplicial sets is *cofinal* when, for every right fibration
`p : E ⟶ B`, restriction of sections `Map_B(B, E) ⟶ Map_B(K, E)` is a weak homotopy equivalence.
Owned by Part LimitsAndKanExtensions §2.1.1. (HTT, Def. 4.1.1.1.) -/
def IsCofinal {K B : SSet.{u}} (v : K ⟶ B) : Prop :=
  ∀ (E : SSet.{u}) (p : E ⟶ B) [SSet.RightFibration p],
    SSet.IsWeakHomotopyEquivalence (sectionsRestrict p v)

/-- For `f : C ⟶ D` and `p̄ : K ⋆ Δ[0] ⟶ C` with `p = p̄|K`, `p̄` is an *`f`-colimit* of `p` when
the map `C_{p̄/} ⟶ C_{p/} ×_{D_{fp/}} D_{fp̄/}` is a trivial fibration. Used for inner fibrations
`f`. Owned by Part LimitsAndKanExtensions §7.1.1. (HTT, Def. 4.3.1.1.) -/
def IsRelativeColimit {K C D : SSet.{u}} (f : C ⟶ D) (q : SSet.join K Δ[0] ⟶ C) : Prop :=
  (MorphismProperty.monomorphisms SSet.{u}).rlp
    (pullback.lift
      (SSet.coslice.map (SSet.join.inl K Δ[0]) (𝟙 C) (by simp) :
        SSet.coslice q ⟶ SSet.coslice (SSet.join.inl K Δ[0] ≫ q))
      (SSet.coslice.map (𝟙 _) f rfl : SSet.coslice q ⟶ SSet.coslice (q ≫ f))
      (by rw [SSet.coslice.map_comp, SSet.coslice.map_comp]; simp) :
      SSet.coslice q ⟶ pullback
        (SSet.coslice.map (𝟙 _) f rfl :
          SSet.coslice (SSet.join.inl K Δ[0] ≫ q) ⟶ SSet.coslice (SSet.join.inl K Δ[0] ≫ q ≫ f))
        (SSet.coslice.map (SSet.join.inl K Δ[0]) (𝟙 D) (by simp) :
          SSet.coslice (q ≫ f) ⟶ SSet.coslice (SSet.join.inl K Δ[0] ≫ q ≫ f)))

/-- The simplicial set `A_{/c} = A ×_C C_{/c}` of objects of a subcomplex `A ⊆ C` over a vertex
`c`. Owned by Part LimitsAndKanExtensions §7.1.2. (HTT, Def. 4.3.2.2, the diagram `C⁰_{/c}`.) -/
noncomputable abbrev subcomplexOver {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) : SSet.{u} :=
  pullback A.ι (SSet.slice.π (SSet.const c : Δ[0] ⟶ C))

/-- The tautological cocone `A_{/c} ⋆ Δ[0] ⟶ C` with cone point `c`, corresponding to the
projection `A_{/c} ⟶ C_{/c}`. Owned by Part LimitsAndKanExtensions §7.1.2. (HTT, Def. 4.3.2.2.) -/
noncomputable def subcomplexOverCocone {C : SSet.{u}} (A : C.Subcomplex) (c : C _⦋0⦌) :
    SSet.join (subcomplexOver A c) Δ[0] ⟶ C :=
  (SSet.slice.homEquiv (pullback.snd A.ι (SSet.slice.π (SSet.const c : Δ[0] ⟶ C)))).1

/-- A functor `F : C ⟶ D` is a *left Kan extension of its restriction to `A` at `c`* when the
image under `F` of the tautological cocone over `A_{/c}` is a colimit cocone in `D`. Used when `C`
is an ∞-category and `A` a full subcomplex. Owned by Part LimitsAndKanExtensions §7.1.2.
(HTT, Def. 4.3.2.2, for the map from `D` to a point.) -/
def IsLeftKanExtensionAt {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) (c : C _⦋0⦌) : Prop :=
  SSet.coslice.IsColimit (SSet.join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F)
    (SSet.yonedaEquiv ((SSet.coslice.homEquiv
      (p := SSet.join.inl _ Δ[0] ≫ subcomplexOverCocone A c ≫ F) (X := Δ[0])).symm
        ⟨subcomplexOverCocone A c ≫ F, rfl⟩))

/-- A functor `F : C ⟶ D` is a *left Kan extension of its restriction to `A`* when it is one at
every object of `C`. Owned by Part LimitsAndKanExtensions §7.1.2. (HTT, Def. 4.3.2.2, for the map
from `D` to a point.) -/
def IsLeftKanExtension {C D : SSet.{u}} (A : C.Subcomplex) (F : C ⟶ D) : Prop :=
  ∀ c : C _⦋0⦌, IsLeftKanExtensionAt A F c

/-- The vertex `y` is a *retract* of `x`: there are edges `i : y ⟶ x` and `r : x ⟶ y` and a
2-simplex exhibiting the identity of `y` as a composite of `i` and `r`. Owned by Part
AdjunctionsAndLocalizations §2.1.2. (HTT, §4.4.5.) -/
def IsRetract {C : SSet.{u}} (y x : C _⦋0⦌) : Prop :=
  ∃ (i : Edge y x) (r : Edge x y), Nonempty (Edge.CompStruct i r (Edge.id y))

/-! ## Layer 1: Presheaves, Yoneda's lemma and the free cocompletion -/

/-- **Retracts of colimit diagrams are colimit diagrams.** README §1.6.2. For cocones
`p̄, q̄ : K ⋆ Δ[0] ⟶ C` in an ∞-category with `q̄` a colimit diagram and `p̄` a retract of `q̄` in
`Fun(K ⋆ Δ[0], C)`, `p̄` is a colimit diagram. (HTT, Lemma 5.1.6.3.) -/
theorem isColimitDiagram_of_isRetract {K C : SSet.{u}} [C.Quasicategory] (p q : join K Δ[0] ⟶ C)
    (hq : IsColimitDiagram q)
    (h : IsRetract ((ihomObj₀Equiv (join K Δ[0]) C).symm p)
      ((ihomObj₀Equiv (join K Δ[0]) C).symm q)) :
    IsColimitDiagram p := by
  sorry

/-! ## Layer 2: Idempotents and their splittings -/

/-- The monoid `{1, e}` with `e * e = e`, here `WithZero PUnit` with `e = 0`. -/
abbrev IdemMonoid : Type u := WithZero PUnit.{u + 1}

attribute [local instance] uliftCategory

/-- `Idem`, the nerve of the one-object category with endomorphism monoid `{1, e}`, `e * e = e`.
README §2.1.1. (HTT, Def. 4.4.5.2.) -/
abbrev idem : SSet.{u} := nerve (ULift.{u} (SingleObj IdemMonoid.{u}))

/-- `Idem⁺`, the nerve of the category `R` with objects `X`, `Y` and non-identity morphisms
`e : X ⟶ X`, `r : X ⟶ Y`, `i : Y ⟶ X` with `r ∘ i = id_Y` and `i ∘ r = e`. `R` is the Karoubi
envelope of the one-object category of `{1, e}`: `X` is the idempotent `1` and `Y` the idempotent `e`.
README §2.1.1. (HTT, Def. 4.4.5.2.) -/
abbrev idemPlus : SSet.{u} := nerve (Idempotents.Karoubi (SingleObj IdemMonoid.{u}))

/-- The inclusion `Idem ⊆ Idem⁺` of the full subcategory on `X`. README §2.1.1.
(HTT, Def. 4.4.5.2.) -/
noncomputable def idemToIdemPlus : idem.{u} ⟶ idemPlus.{u} :=
  nerveMap (ULift.downFunctor ⋙ Idempotents.toKaroubi (SingleObj IdemMonoid.{u}))

/-- The object `X` of `R`: the idempotent `1`. -/
abbrev idemPlusX : Idempotents.Karoubi (SingleObj IdemMonoid.{u}) :=
  (Idempotents.toKaroubi _).obj (SingleObj.star _)

/-- The object `Y` of `R`: the idempotent `e`. -/
def idemPlusY : Idempotents.Karoubi (SingleObj IdemMonoid.{u}) where
  X := SingleObj.star _
  p := (0 : IdemMonoid)
  idem := rfl

/-- The section `i : Y ⟶ X` of `R`. -/
def idemPlusI : idemPlusY.{u} ⟶ idemPlusX.{u} where
  f := (0 : IdemMonoid)
  comm := rfl

/-- The retraction `r : X ⟶ Y` of `R`. -/
def idemPlusR : idemPlusX.{u} ⟶ idemPlusY.{u} where
  f := (0 : IdemMonoid)
  comm := rfl

/-- `Ret ⊆ Idem⁺`, the image of the 2-simplex `Y ⟶ X ⟶ Y`. README §2.1.1.
(HTT, Def. 4.4.5.2.) -/
noncomputable def ret : idemPlus.{u}.Subcomplex :=
  Subcomplex.ofSimplex (n := 2) (ComposableArrows.mk₂ idemPlusI.{u} idemPlusR.{u})

/-- An ∞-category is *idempotent complete* when every idempotent `Idem ⟶ C` has a colimit.
README §2.1.2. (HTT, §5.1.4, recalling §4.4.5.) -/
def IsIdempotentComplete (C : SSet.{u}) : Prop :=
  ∀ F : idem.{u} ⟶ C, ∃ c : (coslice F) _⦋0⦌, coslice.IsColimit F c

/-- **`Ret ⊆ Idem⁺` is inner anodyne.** README §2.2.2. (HTT, Prop. 4.4.5.6.) -/
theorem innerAnodyneExtensions_ret_ι : innerAnodyneExtensions ret.{u}.ι := by
  sorry

/-- **Effective idempotents.** README §2.3.2. For an idempotent `F : Idem ⟶ C` in an ∞-category, the
following are equivalent: `F` extends to `Idem⁺`; `F` has a colimit; `F` has a limit.
(HTT, Cor. 4.4.5.14.) -/
theorem tfae_exists_idemPlus_extension {C : SSet.{u}} [C.Quasicategory] (F : idem.{u} ⟶ C) :
    List.TFAE [∃ G : idemPlus.{u} ⟶ C, idemToIdemPlus ≫ G = F,
      ∃ c : (coslice F) _⦋0⦌, coslice.IsColimit F c,
      ∃ c : (slice F) _⦋0⦌, slice.IsLimit F c] := by
  sorry

/-- **Strong retraction diagrams are left Kan extensions.** README §2.3.1. Every map
`Idem⁺ ⟶ C` into an ∞-category is a left Kan extension of its restriction to `Idem`.
(HTT, Prop. 4.4.5.12.) -/
theorem isLeftKanExtension_idemPlus {C : SSet.{u}} [C.Quasicategory] (G : idemPlus.{u} ⟶ C) :
    IsLeftKanExtension (Subcomplex.range idemToIdemPlus.{u}) G := by
  sorry

/-- **Idempotent completeness through limits and through extensions.** README §2.3.2. An ∞-category
is idempotent complete exactly when every idempotent has a limit, exactly when every idempotent
extends to `Idem⁺`. (HTT, Cor. 4.4.5.15.) -/
theorem tfae_isIdempotentComplete (C : SSet.{u}) [C.Quasicategory] :
    List.TFAE [IsIdempotentComplete C,
      ∀ F : idem.{u} ⟶ C, ∃ c : (slice F) _⦋0⦌, slice.IsLimit F c,
      ∀ F : idem.{u} ⟶ C, ∃ G : idemPlus.{u} ⟶ C, idemToIdemPlus ≫ G = F] := by
  sorry

/-- The functor from a partially ordered set to the one-object category of `{1, e}` sending every
non-identity morphism to `e`; its nerve sends nondegenerate simplices to nondegenerate simplices.
README §2.4.1. (HTT, Prop. 4.4.5.17.) -/
def toIdemMonoid (A : Type u) [LinearOrder A] : A ⥤ SingleObj IdemMonoid.{u} where
  obj _ := SingleObj.star _
  map {a b} _ := ((if a = b then 1 else 0 : IdemMonoid) : SingleObj.star _ ⟶ SingleObj.star _)
  map_id a := by
    show (if a = a then 1 else 0 : IdemMonoid) = 1
    rw [ite_eq_left rfl]
  map_comp {a b c} f g := by
    have hab := leOfHom f
    have hbc := leOfHom g
    show (if a = c then 1 else 0 : IdemMonoid) =
      (if b = c then 1 else 0 : IdemMonoid) * (if a = b then 1 else 0 : IdemMonoid)
    by_cases hac : a = c
    · subst hac
      obtain rfl : a = b := le_antisymm hab hbc
      simp
    · rw [ite_eq_right hac]
      by_cases hab' : a = b
      · subst hab'
        rw [ite_eq_left rfl, ite_eq_right hac, mul_one]
      · rw [ite_eq_right hab', mul_zero]

/-- **Retracts as sequential colimits.** README §2.4.1. For a nonempty linearly ordered set `A` with
no largest element, the map `N(A) ⟶ Idem` sending nondegenerate simplices to nondegenerate
simplices is cofinal. (HTT, Prop. 4.4.5.17, with the nonemptiness the source omits.) -/
theorem isCofinal_nerveMap_toIdemMonoid (A : Type u) [LinearOrder A] [Nonempty A] [NoMaxOrder A] :
    IsCofinal (nerveMap (toIdemMonoid A ⋙ ULift.upFunctor) : nerve A ⟶ idem.{u}) := by
  sorry

/-! ## Layer 3: Idempotent completions -/

/-- `f` exhibits `D` as an *idempotent completion* of `C`: `f` is fully faithful, `D` is idempotent
complete, and every object of `D` is a retract of an object in the image of `f`. README §3.1.1.
(HTT, Def. 5.1.4.1.) -/
def IsIdempotentCompletion {C D : SSet.{u}} (f : C ⟶ D) : Prop :=
  IsFullyFaithful f ∧ IsIdempotentComplete D ∧ ∀ d : D _⦋0⦌, ∃ c : C _⦋0⦌, IsRetract d (f.app _ c)

/-- **Idempotent completeness passes to overcategories.** README §3.1.2. (HTT, Lemma 5.1.4.3.) -/
theorem IsIdempotentComplete.slice {K C : SSet.{u}} [C.Quasicategory]
    (hC : IsIdempotentComplete C) (p : K ⟶ C) : IsIdempotentComplete (SSet.slice p) := by
  sorry

/-- **Idempotent completeness passes to undercategories.** README §3.1.2. (HTT, Lemma 5.1.4.3.) -/
theorem IsIdempotentComplete.coslice {K C : SSet.{u}} [C.Quasicategory]
    (hC : IsIdempotentComplete C) (p : K ⟶ C) : IsIdempotentComplete (SSet.coslice p) := by
  sorry

/-- **Idempotent completions pass to overcategories.** README §3.1.2. If `f : C ⟶ D` is an
idempotent completion, so is the projection `C ×_D D_{/p} ⟶ D_{/p}` for every `p : K ⟶ D`.
(HTT, Lemma 5.1.4.4.) -/
theorem IsIdempotentCompletion.pullback_slice {K C D : SSet.{u}} [C.Quasicategory]
    [D.Quasicategory] {f : C ⟶ D} (hf : IsIdempotentCompletion f) (p : K ⟶ D) :
    IsIdempotentCompletion (pullback.snd f (SSet.slice.π p)) := by
  sorry

/-- **Existence of idempotent completions.** README §3.2.1. Every small ∞-category has an idempotent
completion, one universe up (inside `P(C)`). (HTT, Prop. 5.1.4.2.) -/
theorem exists_isIdempotentCompletion (C : SSet.{u}) [C.Quasicategory] :
    ∃ (D : SSet.{u + 1}) (_ : D.Quasicategory) (f : uliftFunctor.{u + 1}.obj C ⟶ D),
      IsIdempotentCompletion f := by
  sorry

/-- **Idempotent completions are cofinal.** README §3.3.1. (HTT, Lemma 5.1.4.6.) -/
theorem IsIdempotentCompletion.isCofinal {C D : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    {f : C ⟶ D} (hf : IsIdempotentCompletion f) : IsCofinal f := by
  sorry

/-- **Idempotent completions are unique.** README §3.3.2. If `f : C ⟶ D` is an idempotent completion
and `E` is idempotent complete, restriction along `f` is a categorical equivalence
`Fun(D, E) ⟶ Fun(C, E)`. (HTT, Prop. 5.1.4.9.) -/
theorem isCategoricalEquivalence_pre {C D E : SSet.{u}} [C.Quasicategory] [D.Quasicategory]
    [E.Quasicategory] (f : C ⟶ D) (hf : IsIdempotentCompletion f) (hE : IsIdempotentComplete E) :
    QCat.IsCategoricalEquivalence (X := ⟨(ihom D).obj E, inferInstance⟩)
      (Y := ⟨(ihom C).obj E, inferInstance⟩) (ObjectProperty.homMk ((pre f).app E)) := by
  sorry

/-! ## Layer 4: Filtered ∞-categories and κ-right exact functors -/

/-- A *filtered ∞-category*: an ∞-category in which every map from a simplicial set with finitely
many nondegenerate simplices extends to its right cone. README §4.1.1. (HTT, Def. 5.3.1.7, the case
κ = ω.) -/
structure IsFiltered (C : SSet.{u}) : Prop where
  quasicategory : C.Quasicategory
  isCardinalFiltered : C.IsCardinalFiltered Cardinal.aleph0.{u}

/-- **κ-filteredness is invariant under categorical equivalence.** README §4.2.1.
(HTT, Remark 5.3.1.11.) -/
theorem isCardinalFiltered_iff_of_isCategoricalEquivalence {C C' : QCat.{u}} {f : C ⟶ C'}
    (hf : QCat.IsCategoricalEquivalence f) (κ : Cardinal.{u}) :
    C.obj.IsCardinalFiltered κ ↔ C'.obj.IsCardinalFiltered κ := by
  sorry

/-- **κ-filteredness tested on nerves of κ-small posets.** README §4.2.1. For κ regular, an
∞-category is κ-filtered exactly when every map from the nerve of a κ-small partially ordered set
extends to its right cone. (HTT, Remark 5.3.1.12.) -/
theorem isCardinalFiltered_iff_nerve (C : SSet.{u}) [C.Quasicategory] (κ : Cardinal.{u})
    (hκ : κ.IsRegular) :
    C.IsCardinalFiltered κ ↔ ∀ (A : Type u) [PartialOrder A], HasCardinalLT A κ →
      ∀ p : nerve A ⟶ C, ∃ F : join (nerve A) Δ[0] ⟶ C, join.inl _ _ ≫ F = p := by
  sorry

/-- **The boundary test for filteredness.** README §4.2.2. An ∞-category is filtered exactly when
every map `∂Δ[n] ⟶ C` extends to the cone `∂Δ[n] ⋆ Δ[0]`. (HTT, Lemma 5.3.1.14.) -/
theorem isCardinalFiltered_aleph0_iff_boundary (C : SSet.{u}) [C.Quasicategory] :
    C.IsCardinalFiltered Cardinal.aleph0.{u} ↔ ∀ (n : ℕ) (f : (∂Δ[n] : SSet.{u}) ⟶ C),
      ∃ F : join (∂Δ[n] : SSet.{u}) Δ[0] ⟶ C, join.inl _ _ ≫ F = f := by
  sorry

/-- **`Idem` is κ-filtered.** README §4.3.1. (HTT, Example 5.3.1.9.) -/
theorem isCardinalFiltered_idem (κ : Cardinal.{u}) : idem.{u}.IsCardinalFiltered κ := by
  sorry

/-- **An ∞-category with a final object is κ-filtered.** README §4.1.1. (HTT, Remark 5.3.1.17.) -/
theorem isCardinalFiltered_of_isTerminalVertex (C : SSet.{u}) [C.Quasicategory] {z : C _⦋0⦌}
    (hz : C.IsTerminalVertex z) (κ : Cardinal.{u}) : C.IsCardinalFiltered κ := by
  sorry

/-- **κ-filtered colimits give idempotent completeness.** README §4.3.1. An ∞-category admitting
colimits indexed by small κ-filtered ∞-categories is idempotent complete. (HTT, Remark 5.3.1.10.) -/
theorem isIdempotentComplete_of_cardinalFiltered_colimits (C : SSet.{max u v}) [C.Quasicategory]
    (κ : Cardinal.{u})
    (hC : ∀ (K : SSet.{u}) [K.Quasicategory] [K.IsCardinalFiltered κ]
      (p : SSet.uliftFunctor.{v, u}.obj K ⟶ C), ∃ c : (coslice p) _⦋0⦌, coslice.IsColimit p c) :
    IsIdempotentComplete C := by
  sorry

/-- **Filtered ∞-categories are weakly contractible.** README §4.3.2. (HTT, Lemma 5.3.1.20.) -/
theorem isWeaklyContractible_of_isCardinalFiltered (C : SSet.{u}) [C.Quasicategory]
    [C.IsCardinalFiltered Cardinal.aleph0.{u}] : C.IsWeaklyContractible := by
  sorry

/-- **Undercategories of κ-filtered ∞-categories are κ-filtered.** README §4.3.3. For κ regular and
`p : K ⟶ C` with `K` κ-small, `C_{p/}` is κ-filtered. (HTT, Lemma 5.3.1.21.) -/
theorem isCardinalFiltered_coslice {K C : SSet.{u}} [C.Quasicategory] (κ : Cardinal.{u})
    (hκ : κ.IsRegular) [C.IsCardinalFiltered κ] (hK : HasCardinalLT K.N κ) (p : K ⟶ C) :
    (SSet.coslice p).IsCardinalFiltered κ := by
  sorry

/-- **κ-filteredness through cofinal diagonals.** README §4.3.4. For κ regular, an ∞-category `C` is
κ-filtered exactly when, for every κ-small simplicial set `K`, the diagonal `C ⟶ Fun(K, C)` is
cofinal. (HTT, Prop. 5.3.1.22.) -/
theorem isCardinalFiltered_iff_forall_isCofinal_diagonal (C : SSet.{u}) [C.Quasicategory]
    (κ : Cardinal.{u}) (hκ : κ.IsRegular) :
    C.IsCardinalFiltered κ ↔ ∀ K : SSet.{u}, HasCardinalLT K.N κ →
      IsCofinal (MonoidalClosed.curry (CartesianMonoidalCategory.snd K C)) := by
  sorry

/-- **Filtered ∞-categories receive cofinal maps from filtered posets.** README §4.4.1. Every
κ-filtered ∞-category `C`, for κ regular, receives a cofinal map from the nerve of a κ-filtered
partially ordered set. (HTT, Prop. 5.3.1.18.) -/
theorem exists_isCofinal_nerve_of_isCardinalFiltered (C : SSet.{u}) [C.Quasicategory]
    (κ : Cardinal.{u}) (hκ : κ.IsRegular) [C.IsCardinalFiltered κ] :
    ∃ (A : Type u) (_ : PartialOrder A), (nerve A).IsCardinalFiltered κ ∧
      ∃ f : nerve A ⟶ C, IsCofinal f := by
  sorry

/-- A functor `F : A ⟶ B` of ∞-categories is *κ-right exact* when, for every right fibration
`q : B' ⟶ B` with `B'` κ-filtered, the fiber product `A ×_B B'` is κ-filtered. README §4.5.1.
(HTT, Def. 5.3.2.1.) -/
def IsCardinalRightExact {A B : SSet.{u}} (F : A ⟶ B) (κ : Cardinal.{u}) : Prop :=
  ∀ (B' : SSet.{u}) (q : B' ⟶ B) [SSet.RightFibration q], B'.IsCardinalFiltered κ →
    (pullback F q).IsCardinalFiltered κ

/-- **κ-right exact functors compose.** README §4.5.1. (HTT, Prop. 5.3.2.4 (1).) -/
theorem IsCardinalRightExact.comp {A B C : SSet.{u}} [A.Quasicategory] [B.Quasicategory]
    [C.Quasicategory] {F : A ⟶ B} {G : B ⟶ C} {κ : Cardinal.{u}} (hF : IsCardinalRightExact F κ)
    (hG : IsCardinalRightExact G κ) : IsCardinalRightExact (F ≫ G) κ := by
  sorry

/-- **κ-right exactness is invariant under equivalence of functors.** README §4.5.1. A functor
equivalent, in the homotopy category of `Fun(A, B)`, to a κ-right exact functor is κ-right exact.
(HTT, Prop. 5.3.2.4 (3).) -/
theorem IsCardinalRightExact.of_iso {A B : QCat.{u}} {F G : A ⟶ B} (e : F ≅ G) {κ : Cardinal.{u}}
    (hF : IsCardinalRightExact F.hom κ) : IsCardinalRightExact G.hom κ := by
  sorry

/-- **κ-right exactness tested on overcategories.** README §4.5.2. A functor `F : A ⟶ B` of
∞-categories is κ-right exact exactly when `A ×_B B_{/b}` is κ-filtered for every object `b`.
(HTT, Prop. 5.3.2.5.) -/
theorem isCardinalRightExact_iff_slice {A B : SSet.{u}} [A.Quasicategory] [B.Quasicategory]
    (F : A ⟶ B) (κ : Cardinal.{u}) (hκ : κ.IsRegular) :
    IsCardinalRightExact F κ ↔ ∀ b : B _⦋0⦌,
      (pullback F (SSet.slice.π (SSet.const b : Δ[0] ⟶ B))).IsCardinalFiltered κ := by
  sorry

/-- **κ-right exact functors preserve κ-small colimits.** README §4.5.3. For κ regular, a κ-right
exact functor of ∞-categories carries every colimit diagram on a κ-small simplicial set to a colimit
diagram. (HTT, Prop. 5.3.2.9.) -/
theorem isColimitDiagram_comp_of_isCardinalRightExact {A B : SSet.{u}} [A.Quasicategory]
    [B.Quasicategory] (F : A ⟶ B) (κ : Cardinal.{u}) (hκ : κ.IsRegular)
    (hF : IsCardinalRightExact F κ) {K : SSet.{u}} (hK : HasCardinalLT K.N κ)
    (pbar : join K Δ[0] ⟶ A) (h : IsColimitDiagram pbar) : IsColimitDiagram (pbar ≫ F) := by
  sorry

/-- **Preservation of κ-small colimits is κ-right exactness.** README §4.5.3. For κ regular and an
∞-category `A` with all κ-small colimits, a functor `F : A ⟶ B` to an ∞-category is κ-right exact
exactly when it carries colimit diagrams on κ-small simplicial sets to colimit diagrams.
(HTT, Prop. 5.3.2.9.) -/
theorem isCardinalRightExact_iff {A B : SSet.{u}} [A.Quasicategory] [B.Quasicategory]
    (F : A ⟶ B) (κ : Cardinal.{u}) (hκ : κ.IsRegular)
    (hA : ∀ (K : SSet.{u}), HasCardinalLT K.N κ → ∀ p : K ⟶ A, ∃ x, coslice.IsColimit p x) :
    IsCardinalRightExact F κ ↔ ∀ (K : SSet.{u}), HasCardinalLT K.N κ →
      ∀ pbar : join K Δ[0] ⟶ A, IsColimitDiagram pbar → IsColimitDiagram (pbar ≫ F) := by
  sorry

/-- A functor `G` of ∞-categories is *κ-left exact* when `Gᵒᵖ` is κ-right exact. README §4.5.4.
(HTT, Remark 5.3.2.10.) -/
def IsCardinalLeftExact {A B : SSet.{u}} (G : A ⟶ B) (κ : Cardinal.{u}) : Prop :=
  IsCardinalRightExact (SSet.opFunctor.map G) κ

/-- **Preservation of κ-small limits is κ-left exactness.** README §4.5.4. For κ regular and an
∞-category `A` with all κ-small limits, a functor `G : A ⟶ B` to an ∞-category is κ-left exact
exactly when it carries limit diagrams on κ-small simplicial sets to limit diagrams.
(HTT, Remark 5.3.2.10.) -/
theorem isCardinalLeftExact_iff {A B : SSet.{u}} [A.Quasicategory] [B.Quasicategory]
    (G : A ⟶ B) (κ : Cardinal.{u}) (hκ : κ.IsRegular)
    (hA : ∀ (K : SSet.{u}), HasCardinalLT K.N κ → ∀ p : K ⟶ A, ∃ x, slice.IsLimit p x) :
    IsCardinalLeftExact G κ ↔ ∀ (K : SSet.{u}), HasCardinalLT K.N κ →
      ∀ pbar : join Δ[0] K ⟶ A, IsLimitDiagram pbar → IsLimitDiagram (pbar ≫ G) := by
  sorry

/-! ## Layer 5: Sifted colimits -/

/-- A *sifted* simplicial set: it is nonempty and its diagonal `K ⟶ K × K` is cofinal. README §5.1.1.
(HTT, Def. 5.5.8.1.) -/
def IsSifted (K : SSet.{u}) : Prop :=
  K.Nonempty ∧ IsCofinal (lift (𝟙 K) (𝟙 K))

/-- **Colimits in two variables.** README §5.2.1. Let `q : C ⟶ D` be a categorical fibration of
∞-categories and `p : X ⋆ Δ[0] × Y ⋆ Δ[0] ⟶ C`. If `p` restricted to `{x} × Y ⋆ Δ[0]` is a
`q`-colimit for every vertex `x` of `X ⋆ Δ[0]`, and `p` restricted to `X ⋆ Δ[0] × {y}` is a
`q`-colimit for every vertex `y` of `Y`, then the restriction of `p` to `X ⋆ Δ[0] × {∞}` and its
restriction to the cone `(X × Y) ⋆ Δ[0]` are `q`-colimits. (HTT, Lemma 5.5.2.3 and its proof.) -/
theorem isRelativeColimit_of_two_variables {X Y C D : SSet.{u}} [C.Quasicategory]
    [D.Quasicategory] (q : C ⟶ D) (hq : categoricalFibrations q) (p : join X Δ[0] ⊗ join Y Δ[0] ⟶ C)
    (h₁ : ∀ x : (join X Δ[0]) _⦋0⦌, IsRelativeColimit q (lift (SSet.const x) (𝟙 _) ≫ p))
    (h₂ : ∀ y : Y _⦋0⦌,
      IsRelativeColimit q (lift (𝟙 _) (SSet.const ((join.inl Y Δ[0]).app _ y)) ≫ p)) :
    IsRelativeColimit q (lift (𝟙 _) (SSet.const (yonedaEquiv (join.inr Y Δ[0]))) ≫ p) ∧
      IsRelativeColimit q
        (lift (join.map (fst X Y) (𝟙 Δ[0])) (join.map (snd X Y) (𝟙 Δ[0])) ≫ p) := by
  sorry

/-- **`N(Δ)^op` is sifted.** README §5.3.1. (HTT, Lemma 5.5.8.4.) -/
theorem isSifted_nerve_simplexCategory_op :
    IsSifted (uliftFunctor.{u}.obj (SSet.opFunctor.obj (nerve SimplexCategory))) := by
  sorry

/-- **Filtered ∞-categories are sifted.** README §5.3.2. (HTT, Example 5.5.8.3.) -/
theorem IsFiltered.isSifted {C : SSet.{u}} (hC : IsFiltered C) : IsSifted C := by
  sorry

/-- **Joint preservation of sifted colimits.** README §5.3.3. For a sifted simplicial set `K` and
∞-categories `C`, `D`, `E` with `K`-indexed colimits, a functor `F : C × D ⟶ E` that preserves
`K`-indexed colimits separately in each variable preserves `K`-indexed colimits.
(HTT, Prop. 5.5.8.6.) -/
theorem isColimitDiagram_comp_of_isSifted {K C D E : SSet.{u}} (hK : IsSifted K)
    [C.Quasicategory] [D.Quasicategory] [E.Quasicategory]
    (hC : ∀ p : K ⟶ C, ∃ c, coslice.IsColimit p c) (hD : ∀ p : K ⟶ D, ∃ c, coslice.IsColimit p c)
    (hE : ∀ p : K ⟶ E, ∃ c, coslice.IsColimit p c) (F : C ⊗ D ⟶ E)
    (h₁ : ∀ (d : D _⦋0⦌) (q : join K Δ[0] ⟶ C), IsColimitDiagram q →
      IsColimitDiagram (q ≫ lift (𝟙 C) (SSet.const d) ≫ F))
    (h₂ : ∀ (c : C _⦋0⦌) (q : join K Δ[0] ⟶ D), IsColimitDiagram q →
      IsColimitDiagram (q ≫ lift (SSet.const c) (𝟙 D) ≫ F))
    (q : join K Δ[0] ⟶ C ⊗ D) (hq : IsColimitDiagram q) : IsColimitDiagram (q ≫ F) := by
  sorry

/-- **Sifted simplicial sets are weakly contractible.** README §5.3.4. (HTT, Prop. 5.5.8.7.) -/
theorem IsSifted.isWeaklyContractible {K : SSet.{u}} (hK : IsSifted K) :
    K.IsWeaklyContractible := by
  sorry

/-! ## Layer 6: Filtered colimits, κ-continuous functors and idempotent completeness -/

/-- A functor `F : C ⟶ D` is *κ-continuous* when it preserves κ-filtered colimits: it carries every
colimit diagram `K ⋆ Δ[0] ⟶ C` indexed by a small κ-filtered ∞-category `K` (in `SSet.{u}`, lifted
to the universe of `C`) to a colimit diagram. `C` and `D` may be large, as `Ŝ` is. Used for a regular
cardinal `κ` and ∞-categories `C` admitting small κ-filtered colimits. README §6.1.1.
(HTT, Def. 5.3.4.5.) -/
def IsCardinalContinuous (κ : Cardinal.{u}) {C D : SSet.{max u v}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) [K.Quasicategory] [K.IsCardinalFiltered κ]
    (q : SSet.join (SSet.uliftFunctor.{v, u}.obj K) Δ[0] ⟶ C),
    IsColimitDiagram q → IsColimitDiagram (q ≫ F)

/-- **κ-filtered colimits in towers of ∞-categories.** README §6.3.2. For κ uncountable and regular
and a tower `⋯ ⟶ C₁ ⟶ C₀` of categorical fibrations between ∞-categories with small κ-filtered
colimits, whose maps are κ-continuous, the limit has small κ-filtered colimits and its projections
are κ-continuous. (HTT, Lemma 5.3.4.12, first part.) -/
theorem isCardinalContinuous_limit_π (κ : Cardinal.{u}) (hκ : κ.IsRegular)
    (hκ' : Cardinal.aleph0 < κ) (T : ℕᵒᵖ ⥤ SSet.{max u v}) [∀ n, (T.obj n).Quasicategory]
    (hfib : ∀ n : ℕ, categoricalFibrations (T.map (homOfLE (Nat.le_succ n)).op))
    (hT : ∀ (n : ℕ) (K : SSet.{u}) [K.Quasicategory] [K.IsCardinalFiltered κ]
      (p : SSet.uliftFunctor.{v, u}.obj K ⟶ T.obj (Opposite.op n)), ∃ c, coslice.IsColimit p c)
    (hmap : ∀ n : ℕ, IsCardinalContinuous.{u, v} κ (T.map (homOfLE (Nat.le_succ n)).op)) :
    (∀ (K : SSet.{u}) [K.Quasicategory] [K.IsCardinalFiltered κ]
      (p : SSet.uliftFunctor.{v, u}.obj K ⟶ limit T), ∃ c, coslice.IsColimit p c) ∧
      ∀ n : ℕ, IsCardinalContinuous.{u, v} κ (limit.π T (Opposite.op n)) := by
  sorry

/-- **Every ∞-category embeds into a cocomplete one.** README §6.5.1. For an ∞-category `D` there is
a fully faithful functor `i : D ⟶ D'` into an ∞-category with colimits indexed by simplicial sets in
the universe of `D`, such that a cocone in `D` is a colimit diagram exactly when its image is.
(HTT, Lemma 5.3.5.7.) -/
theorem exists_isFullyFaithful_cocomplete (D : SSet.{u}) [D.Quasicategory] :
    ∃ (D' : SSet.{u + 1}) (_ : D'.Quasicategory) (i : uliftFunctor.{u + 1}.obj D ⟶ D'),
      IsFullyFaithful i ∧
      (∀ (K : SSet.{u}) (p : uliftFunctor.{u + 1}.obj K ⟶ D'), ∃ c, coslice.IsColimit p c) ∧
      ∀ (K : SSet.{u}) (q : join (uliftFunctor.{u + 1}.obj K) Δ[0] ⟶ uliftFunctor.{u + 1}.obj D),
        IsColimitDiagram q ↔ IsColimitDiagram (q ≫ i) := by
  sorry

/-- The quasicategory of `Cat∞` at a vertex of `SSet.catInfty`: the image of the unique object of
the simplicial thickening of `[0]`. -/
noncomputable def catInftyObj (x : catInfty.{u} _⦋0⦌) : SSet.{u} :=
  (x.obj ⟨ULift.up 0⟩).obj.toSSet

/-- **Filtered colimits of idempotent complete ∞-categories are idempotent complete.** README §6.6.2.
For a colimit diagram `I ⋆ Δ[0] ⟶ Cat∞` indexed by a small filtered ∞-category `I`, if every
∞-category of the diagram is idempotent complete, so is its colimit. (HTT, Cor. 4.4.5.21.) -/
theorem isIdempotentComplete_catInftyObj_of_isColimitDiagram (I : SSet.{u}) (hI : IsFiltered I)
    (q : join (uliftFunctor.{u + 1}.obj I) Δ[0] ⟶ catInfty.{u}) (hq : IsColimitDiagram q)
    (h : ∀ i, IsIdempotentComplete (catInftyObj ((join.inl _ Δ[0] ≫ q).app _ i))) :
    IsIdempotentComplete (catInftyObj (yonedaEquiv (join.inr _ Δ[0] ≫ q))) := by
  sorry

end TauCetiRoadmap.InfinityCategoryTheory.PresheavesAndCompletions
