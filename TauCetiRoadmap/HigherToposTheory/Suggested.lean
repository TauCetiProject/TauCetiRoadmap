import Mathlib
import TauCeti.Algebra.Homology.LinearHomComplex.Enrichment
import TauCeti.AlgebraicTopology.DGNerve.Basic
import TauCeti.AlgebraicTopology.Quasicategory.Cartesian
import TauCeti.AlgebraicTopology.Quasicategory.Core
import TauCeti.AlgebraicTopology.Quasicategory.FullSubcategory
import TauCeti.AlgebraicTopology.Quasicategory.LocallySmall
import TauCeti.AlgebraicTopology.Quasicategory.RightMappingSpace
import TauCeti.AlgebraicTopology.SimplexCategory.JoinVertex
import TauCeti.AlgebraicTopology.SimplicialSet.CardinalFiltered
import TauCeti.AlgebraicTopology.SimplicialSet.Coslice
import TauCeti.AlgebraicTopology.SimplicialSet.Join.Basic
import TauCeti.AlgebraicTopology.SimplicialSet.KanComplex.HomotopyGroup
import TauCeti.AlgebraicTopology.SimplicialSet.Marked.Basic
import TauCeti.AlgebraicTopology.SimplicialSet.Marked.Limits
import TauCeti.AlgebraicTopology.SimplicialSet.Marked.MappingSpace
import TauCeti.AlgebraicTopology.SimplicialSet.Slice
import TauCeti.AlgebraicTopology.SimplicialSet.SmallModel
import TauCeti.CategoryTheory.DG.Basic
import TauCeti.CategoryTheory.DG.FullSubcategory
import TauCeti.CategoryTheory.DG.Simplicial
import TauCeti.CategoryTheory.Enriched.NaturalTransformation
import TauCeti.CategoryTheory.Enriched.TensorProduct
import TauCeti.Topology.Homotopy.HomotopyGroup.WeakHomotopyEquivalence

/-!
# Higher Topos Theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below suggest Lean forms for particular targets; proving them does not by itself
finish a layer or the roadmap.

It prototypes the Lean definitions fixed by the *Conventions* table of the README (one
definition per notion) and the definitions of L1.5 (equivalences, morphism spaces and final
objects, with HTT's H-enriched constructions), each in the form of its README *Lean:* line. A
definition depends on other roadmap targets (the homotopy category of spaces `SSet.H` of F2.4,
the rigidification of L1.4, the cones of L1.3, the colimit predicates of L5.6, the fat coslices of
L5.5, the presheaf ∞-categories of L6); those are prototyped here as far as the Conventions'
definitions need them. Data that is not yet constructed (the rigidification, the ∞-category of
spaces, the universal right fibration, …) is `sorry`; every `Prop` is stated.

## Tau Ceti declarations

The Tau Ceti main declarations that the definitions use (`SSet.Edge.IsEquivalence`, `SSet.core`,
`SSet.join`, `SSet.slice`, `SSet.coslice`, `SSet.rightMappingSpace`, `SSet.Edge.IsCartesian`,
`SSet.CartesianFibration`, `SSet.IsCardinalFiltered`, `SSet.IsLocallySmall`,
`TauCeti.HasSmallSpaceModel`, `TauCeti.MarkedSSet`, `TauCeti.DGCategory`, `TauCeti.dgNerve`, …)
are imported from Tau Ceti. The few that are newer than the pinned Tau Ceti revision
(`SSet.IsTerminalVertex`, `SSet.RightFibration`, `SSet.LeftFibration`, `SSet.catInfty`,
`CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`, …) are copied locally, under the same
relative name, in the sections headed *Tau Ceti declarations postdating the pin*; each copy names
the Tau Ceti declaration and file it copies, and is deleted when the pin is bumped.
-/

noncomputable section

universe w v u u'

open CategoryTheory Limits MonoidalCategory CartesianMonoidalCategory MonoidalClosed Opposite
  Simplicial HomotopicalAlgebra Cardinal

namespace TauCetiRoadmap.HigherToposTheory

/-! ## F2.4: weak homotopy equivalences and the homotopy category of spaces

These come first: the Dwyer–Kan equivalences below use the redefined weak equivalences. -/

namespace SSet

open _root_.SSet

/-- The weak homotopy equivalences, README *Weak homotopy equivalences*
(`HTT.A.2.7/weak-equivalences`; Conventions row *weak homotopy equivalence*; Kerodon 3.1.7.12):
`f : X ⟶ Y` is one when, for every Kan complex `Z`, precomposition with `f` is a bijection
`π₀ Fun(Y, Z) ⟶ π₀ Fun(X, Z)`, the condition of Tau Ceti main's class `SSet.IsWeakHomotopyEquivalence`.
This redefines Tau Ceti's `weakEquivalences SSet` (realization). -/
def weakHomotopyEquivalences : MorphismProperty SSet.{u} := fun _ _ f ↦
  ∀ (Z : SSet.{u}) [KanComplex Z], Function.Bijective (mapπ₀ ((MonoidalClosed.pre f).app Z))

/-- `weakEquivalences SSet` of the README *Weak homotopy equivalences* (`HTT.A.2.7/weak-equivalences`,
Kerodon 3.1.7.12): the weak equivalences of `SSet` are `weakHomotopyEquivalences`. -/
scoped instance instCategoryWithWeakEquivalences : CategoryWithWeakEquivalences SSet.{u} where
  weakEquivalences := weakHomotopyEquivalences

/-- Weak contractibility, README redefinition of `SSet.IsWeaklyContractible` (F2.4; Conventions row
*weakly contractible*): `K ⟶ Δ[0]` is a weak homotopy equivalence (Kerodon 3.1.7.12). -/
class IsWeaklyContractible (K : SSet.{u}) : Prop where
  weakEquivalence : WeakEquivalence (stdSimplex.isTerminalObj₀.from K)

/-- The homotopy category of spaces `H`, README *The homotopy category of spaces* (`SSet.H`;
HTT Definition 1.1.3.4): the localization of `SSet` at the weak homotopy equivalences. -/
abbrev H : Type (u + 1) := (weakEquivalences SSet.{u}).Localization

/-- The localization functor `SSet.H.Q : SSet ⥤ H`, README *The homotopy category of spaces*
(HTT Definition 1.1.3.4). -/
abbrev H.Q : SSet.{u} ⥤ H.{u} := (weakEquivalences SSet.{u}).Q

/-- The Cartesian monoidal structure of `H`, README *The homotopy category of spaces*
(HTT Definition 1.1.3.4: "finite products in H … making H Cartesian monoidal"). -/
instance H.cartesianMonoidalCategory : CartesianMonoidalCategory H.{u} := sorry

/-- `Q` preserves finite products, README *The homotopy category of spaces* (HTT 1.1.3.4); this
is the monoidal structure along which HTT A.1.4.3 transports enrichment. -/
instance H.Q.monoidal : (H.Q.{u}).Monoidal := sorry

/-- Simplicial homotopy equivalences, README F2.2 (`SSet.IsHomotopyEquivalence`: a homotopy
inverse with simplicial homotopies through `Δ[1]`); used by *Cofinal maps* (HTT 4.1.1.1). -/
def IsHomotopyEquivalence {X Y : SSet.{u}} (f : X ⟶ Y) : Prop :=
  ∃ g : Y ⟶ X, Nonempty (Homotopy (f ≫ g) (𝟙 X)) ∧ Nonempty (Homotopy (g ≫ f) (𝟙 Y))

/-- Weak equivalences of Kan complexes, README F2.2 *Weak equivalences of Kan complexes*
(`SSet.KanComplex.W`; `HTT.A.2.7/kan-weak-equivalences/basic`): a bijection on `π 0` and on every
`π n`, at every vertex. -/
def KanComplex.W : MorphismProperty SSet.{u} := fun X _ f ↦
  ∀ (n : ℕ) (x : X _⦋0⦌),
    Function.Bijective (_root_.SSet.KanComplex.π.map (n := n) (x := x) f rfl)

/-- Whitehead's theorem, README F2.2 *Whitehead's theorem*
(`SSet.KanComplex.W.iff_isHomotopyEquivalence`; `HTT.A.2.7/kan-weak-equivalences/whitehead`): a
map of Kan complexes is in `W` exactly when it is a simplicial homotopy equivalence. -/
theorem KanComplex.W.iff_isHomotopyEquivalence {X Y : SSet.{u}} [KanComplex X] [KanComplex Y]
    (f : X ⟶ Y) : KanComplex.W f ↔ IsHomotopyEquivalence f := by sorry

end SSet

/-- Weak homotopy equivalences of topological spaces, README F2.4 *Realization and weak homotopy
equivalences* (`TopCat.IsWeakHomotopyEquivalence`, propose; `HTT.A.2.7/realization/top-weq`): a
bijection on path components and on every `π_n(A, a)`, `n ≥ 1`. Stated through Tau Ceti's
`ContinuousMap.IsWeakHomotopyEquivalence`, which is present at the pin and provides the induced
maps of homotopy groups. -/
def TopCat.IsWeakHomotopyEquivalence {A B : TopCat.{u}} (g : A ⟶ B) : Prop :=
  ContinuousMap.IsWeakHomotopyEquivalence g.hom

open scoped TauCetiRoadmap.HigherToposTheory.SSet

/-! ## Tau Ceti declarations postdating the pin

Tau Ceti main declarations used below that are not yet present at the Tau Ceti revision pinned
by this repository (`2fd255d`). Each is a local copy, under the same relative name, of the Tau Ceti
declaration it names; Tau Ceti declarations that exist at the pin are imported above. -/

namespace SSet

open _root_.SSet

/-- Local copy of Tau Ceti `SSet.IsTerminalVertex`
(`TauCeti/AlgebraicTopology/Quasicategory/TerminalVertex.lean`); README L1.5 *Final objects*
(`HTT.1.2.12/final`, HTT Definition 1.2.12.3; Conventions row *final object*): every
`∂Δ[n + 1] ⟶ X` with last vertex `x` extends to `Δ[n + 1]`. -/
def IsTerminalVertex {X : SSet.{u}} (x : X _⦋0⦌) : Prop :=
  ∀ ⦃n : ℕ⦄ (σ₀ : (∂Δ[n + 1] : SSet) ⟶ X),
    X.map (_root_.SimplexCategory.const ⦋0⦌ ⦋n⦌ (Fin.last n)).op
        (yonedaEquiv (boundary.ι 0 ≫ σ₀)) = x →
      ∃ σ : Δ[n + 1] ⟶ X, σ₀ = ∂Δ[n + 1].ι ≫ σ

/-- Local copy of Tau Ceti `SSet.coslice.map` (`…/SimplicialSet/Coslice.lean`), README L1.3
*Slices*. -/
def coslice.map {K C L D : SSet.{u}} {p : K ⟶ C} {q : L ⟶ D} (i : L ⟶ K) (g : C ⟶ D)
    (h : i ≫ p ≫ g = q) : coslice p ⟶ coslice q := sorry

/-- Local copy of Tau Ceti `SSet.rightHornInclusions`
(`TauCeti/AlgebraicTopology/SimplicialSet/AnodyneExtensions/LeftRight/Basic.lean`); README L2.1
(HTT 2.0.0.3): `Λ[n, i] ⟶ Δ[n]` for `0 < i ≤ n`. -/
inductive rightHornInclusions : MorphismProperty SSet.{u} where
  | intro {n : ℕ} (i : Fin (n + 2)) (h0 : 0 < i) : rightHornInclusions Λ[n + 1, i].ι

/-- Local copy of Tau Ceti `SSet.RightFibration` (`…/AnodyneExtensions/LeftRight/Basic.lean`);
README L2.1 *Left and right fibrations* (HTT 2.0.0.3). -/
class RightFibration {X Y : SSet.{u}} (p : X ⟶ Y) : Prop where
  mem : rightHornInclusions.rlp p

end SSet

namespace TauCeti

/-- Local copy of Tau Ceti `TauCeti.SimplicialHomotopyCategory`
(`TauCeti/AlgebraicTopology/SimplicialCategory/HomotopyCategory.lean`): the homotopy category
`π₀ C` of a simplicial category, used by `IsDwyerKanEquivalence` (README L1.5). -/
structure SimplicialHomotopyCategory (C : Type u) [EnrichedCategory SSet.{v} C] where
  of ::
  as : C

/-- Local copy of the category structure of Tau Ceti `TauCeti.SimplicialHomotopyCategory`
(`…/SimplicialCategory/HomotopyCategory.lean`; morphisms `π₀` of the mapping spaces). -/
instance (C : Type u) [EnrichedCategory SSet.{v} C] :
    Category.{v} (SimplicialHomotopyCategory C) := sorry

/-- Local copy of Tau Ceti `TauCeti.SimplicialHomotopyCategory.mapHomotopyCategory`
(`…/SimplicialCategory/HomotopyCategory.lean`). -/
def SimplicialHomotopyCategory.mapHomotopyCategory {C : Type u} {D : Type u'}
    [EnrichedCategory SSet.{v} C] [EnrichedCategory SSet.{v} D] (F : EnrichedFunctor SSet.{v} C D) :
    SimplicialHomotopyCategory C ⥤ SimplicialHomotopyCategory D where
  obj X := .of (F.obj X.as)
  map := sorry
  map_id := sorry
  map_comp := sorry

end TauCeti

namespace CategoryTheory.EnrichedFunctor

open TauCeti.SimplicialHomotopyCategory in
/-- Local copy of Tau Ceti `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`
(`TauCeti/AlgebraicTopology/SimplicialCategory/DwyerKan.lean`), as it stands; README L1.5 *The
homotopy category of a simplicial category; Dwyer–Kan equivalences* (HTT 1.1.4.4, A.3.2.1). The
weak equivalences are those of F2.4 (`SSet.weakHomotopyEquivalences` above). -/
class IsDwyerKanEquivalence {C : Type u} {D : Type u'} [EnrichedCategory SSet.{v} C]
    [EnrichedCategory SSet.{v} D] (F : EnrichedFunctor SSet.{v} C D) : Prop where
  weakEquivalence_map (X Y : C) : WeakEquivalence (F.map X Y)
  essSurj : (mapHomotopyCategory F).EssSurj

end CategoryTheory.EnrichedFunctor

namespace SSet

open _root_.SSet

/-! ## Supporting targets (L1.3, L1.4, and helpers) -/

/-- The right cone `K^▷ = K ⋆ Δ[0]`, README L1.3 *Cones* (`SSet.rightCone`; HTT Notation
1.2.8.4). -/
abbrev rightCone (K : SSet.{u}) : SSet.{u} := SSet.join K Δ[0]

/-- The left cone `K^◁ = Δ[0] ⋆ K`, README L1.3 *Cones* (`SSet.leftCone`; HTT Notation 1.2.8.4). -/
abbrev leftCone (K : SSet.{u}) : SSet.{u} := SSet.join Δ[0] K

/-- Helper for README *Cofinal maps*, *`Ind_κ`* and *Localization*: the vertices of `Fun(K, Z)`
are the maps `K ⟶ Z` (through `Δ[0] ⟶ Fun(K, Z)` and the tensor-hom adjunction). -/
def ihomVertexEquiv {K Z : SSet.{u}} : ((ihom K).obj Z) _⦋0⦌ ≃ (K ⟶ Z) where
  toFun F := lift (𝟙 K) (stdSimplex.isTerminalObj₀.from K) ≫
    ((ihom.adjunction K).homEquiv _ _).symm (yonedaEquiv.symm F)
  invFun g := yonedaEquiv ((ihom.adjunction K).homEquiv _ _ (fst K Δ[0] ≫ g))
  left_inv := sorry
  right_inv := sorry

/-- The objects of `C[S]`, README L1.4 *The rigidification of a simplicial set*
(`SSet.rigidification`, HTT §1.1.5): the vertices of S. -/
def Rigidification (S : SSet.{u}) : Type u := S _⦋0⦌

/-- The category structure of `C[S]`, README L1.4 *The rigidification of a simplicial set*
(HTT §1.1.5, the left Kan extension of `Δ[n] ↦ SimplicialThickening (Fin (n+1))`). -/
instance (S : SSet.{u}) : Category.{u} (Rigidification S) := sorry

/-- The simplicial enrichment of `C[S]`, README L1.4 *The rigidification of a simplicial set*
(HTT §1.1.5). -/
instance (S : SSet.{u}) : SimplicialCategory (Rigidification S) := sorry

/-- `C[f]`, README L1.4 *The rigidification of a simplicial set* (`SSet.rigidification`, HTT
§1.1.5). Mathlib has no category of simplicial categories (`EnrichedCat` is a bicategory), so the
functor `C[−]` is prototyped by its action on objects and maps. -/
def rigidification.map {S T : SSet.{u}} (f : S ⟶ T) :
    EnrichedFunctor SSet.{u} (Rigidification S) (Rigidification T) := sorry

/-! ## L1.5: HTT's H-enriched constructions -/

end SSet

/-- H-enriched equivalences, README L1.5 *Change of enrichment and H-enriched equivalences*
(`EnrichedFunctor.IsEquivalence`; HTT 1.1.3–1.1.4): essentially surjective on underlying
categories and an isomorphism in `H` on every mapping object. -/
class EnrichedFunctor.IsEquivalence {C : Type v} {D : Type w} [EnrichedCategory SSet.H.{u} C]
    [EnrichedCategory SSet.H.{u} D] (F : EnrichedFunctor SSet.H.{u} C D) : Prop where
  essSurj : F.forget.EssSurj
  isIso_map (X Y : C) : IsIso (F.map X Y)

/-- The H-enriched homotopy category `hC` of a simplicial category, README L1.5 *The homotopy
category of a simplicial category; Dwyer–Kan equivalences* (`SimplicialCategory.hoEnriched`; HTT
Definition 1.1.4.1, Remark 1.1.4.3): `TransportEnrichment` along `SSet.H.Q` (HTT A.1.4.3). -/
abbrev SimplicialCategory.hoEnriched (C : Type v) [Category.{u} C] [SimplicialCategory C] :
    Type v :=
  TransportEnrichment SSet.H.Q.{u} C

/-- The H-enriched functor `hC ⟶ hD` of a simplicial functor, README L1.5 *The homotopy category
of a simplicial category* (HTT Remark 1.1.4.3). -/
def SimplicialCategory.hoEnriched.map {C : Type v} {D : Type w} [Category.{u} C]
    [SimplicialCategory C] [Category.{u} D] [SimplicialCategory D]
    (F : EnrichedFunctor SSet.{u} C D) :
    EnrichedFunctor SSet.H.{u} (SimplicialCategory.hoEnriched C)
      (SimplicialCategory.hoEnriched D) where
  obj X := F.obj X
  map X Y := SSet.H.Q.map (F.map X Y)
  map_id := sorry
  map_comp := sorry

namespace SSet

open _root_.SSet

/-- The H-enriched homotopy category `hS = h C[S]` of a simplicial set, README L1.5 *The
H-enriched homotopy category of a simplicial set* (`SSet.hoEnriched`; HTT Definition 1.1.5.14). -/
abbrev hoEnriched (S : SSet.{u}) : Type u :=
  SimplicialCategory.hoEnriched (Rigidification S)

/-- The H-enriched functor `hS ⟶ hT` of a map, README L1.5 *The H-enriched homotopy category of a
simplicial set* (HTT 1.1.5.14). -/
def hoEnriched.map {S T : SSet.{u}} (f : S ⟶ T) :
    EnrichedFunctor SSet.H.{u} (hoEnriched S) (hoEnriched T) :=
  SimplicialCategory.hoEnriched.map (rigidification.map f)

/-- The underlying category of `hS` is `hoFunctor.obj S`, README L1.5 *The H-enriched homotopy
category of a simplicial set* (HTT 1.1.5.14, "Provide … that identification"). -/
def hoEnriched.forgetEquivalence (S : SSet.{u}) :
    ForgetEnrichment SSet.H.{u} (hoEnriched S) ≌ hoFunctor.obj S := sorry

/-- Categorical equivalences, README L1.5 *Categorical equivalences* (`SSet.IsCategoricalEquivalence`;
HTT Definition 1.1.5.14; Conventions row *categorical equivalence*): `hS ⟶ hT` is an equivalence
of H-enriched categories. -/
def IsCategoricalEquivalence {S T : SSet.{u}} (f : S ⟶ T) : Prop :=
  EnrichedFunctor.IsEquivalence (hoEnriched.map f)

/-- Mapping objects in H, README L1.5 *Mapping objects in H* (`SSet.mapH`; HTT Definition 1.2.2.1;
Conventions row *morphism space*): `Map_S(x, y)`, the mapping object of `hS`. -/
def mapH {S : SSet.{u}} (x y : S _⦋0⦌) : SSet.H.{u} :=
  EnrichedCategory.Hom (V := SSet.H.{u}) (C := hoEnriched S) x y

/-! ## L1.5: morphism spaces -/

/-- Evaluation at the vertex `i` of `Δ[1]`, `Fun(Δ[1], C) ⟶ C`; helper for README L1.5 *Morphism
spaces* (`SSet.endpoints`). -/
def evalVertex (C : SSet.{u}) (i : Fin 2) : (ihom Δ[1]).obj C ⟶ C :=
  lift (stdSimplex.isTerminalObj₀.from _ ≫ yonedaEquiv.symm (stdSimplex.obj₀Equiv.symm i))
    (𝟙 _) ≫ (ihom.ev Δ[1]).app C

/-- The endpoint map `Fun(Δ[1], C) ⟶ C ⊗ C`, README L1.5 *Morphism spaces* (`SSet.endpoints`,
propose; HTT §1.2.2, Kerodon 4.6.1.1): evaluation at the two vertices of `Δ[1]`. -/
def endpoints (C : SSet.{u}) : (ihom Δ[1]).obj C ⟶ C ⊗ C :=
  lift (evalVertex C 0) (evalVertex C 1)

/-- The morphism space `Hom_C(x, y)`, README L1.5 *Morphism spaces* (`SSet.morphismSpace`,
propose; `HTT.1.2.2/morphism-space`, Kerodon Construction 4.6.1.1; Conventions row *morphism
space*): the fibre of `endpoints C` over the vertex `(x, y)`. -/
def morphismSpace (C : SSet.{u}) (x y : C _⦋0⦌) : ((ihom Δ[1]).obj C).Subcomplex :=
  (Subcomplex.ofSimplex (X := C ⊗ C) (n := 0) (x, y)).preimage (endpoints C)

/-- The vertices of `Hom_C(x, y)` are the edges from `x` to `y`, README L1.5 *Morphism spaces*
(`HTT.1.2.2/morphism-space`). -/
def morphismSpace.obj₀Equiv (C : SSet.{u}) (x y : C _⦋0⦌) :
    (morphismSpace C x y : SSet.{u}) _⦋0⦌ ≃ Edge x y := sorry

/-- The left-pinched morphism space `Hom^L_C(x, y)`, README L1.5 *Morphism spaces*
(`SSet.leftMappingSpace`, propose; HTT §1.2.2): the fibre over `y` of the coslice projection
`C_{x/} ⟶ C`. -/
def leftMappingSpace {C : SSet.{u}} (x y : C _⦋0⦌) :
    (coslice (yonedaEquiv.symm x : Δ[0] ⟶ C)).Subcomplex :=
  (Subcomplex.ofSimplex (X := C) (n := 0) y).preimage (coslice.π (yonedaEquiv.symm x))

/-- `Hom^L_C(x, y)` is the opposite of `Hom^R_{Cᵒᵖ}(y, x)`, README L1.5 *Morphism spaces*
(HTT §1.2.2: the coslice `C_{x/}` is the opposite of the slice `Cᵒᵖ_{/x}`). -/
def leftMappingSpace.isoOpRightMappingSpace {C : SSet.{u}} (x y : C _⦋0⦌) :
    (leftMappingSpace x y : SSet.{u}) ≅
      (rightMappingSpace C.op (opObjEquiv.symm y) (opObjEquiv.symm x) : SSet.{u}).op := sorry

/-! ## L1.5: fully faithful and essentially surjective maps; final objects; colimits -/

/-- Fully faithful maps, README L1.5 *Fully faithful and essentially surjective maps*
(`HTT.1.2.10/fully-faithful`, `SSet.IsFullyFaithful`; HTT Definition 1.2.10.1; Conventions row
*fully faithful*): every `Map_S(x, y) ⟶ Map_T(f x, f y)` is an isomorphism in `H`. Redefines Tau
Ceti's `SSet.IsFullyFaithful`. -/
def IsFullyFaithful {S T : SSet.{u}} (f : S ⟶ T) : Prop :=
  ∀ x y : hoEnriched S, IsIso ((hoEnriched.map f).map x y)

/-- Essentially surjective maps, README L1.5 *Fully faithful and essentially surjective maps*
(`HTT.1.2.10/essentially-surjective`, `SSet.IsEssentiallySurjective`; HTT Definition 1.2.10.1;
Conventions row *essentially surjective*). -/
def IsEssentiallySurjective {S T : SSet.{u}} (f : S ⟶ T) : Prop :=
  (hoFunctor.map f).toFunctor.EssSurj

/-- Local copy of Tau Ceti `SSet.IsInitialVertex` (`…/Quasicategory/InitialVertex.lean`), README L1.5
*Final objects* (HTT Definition 1.2.12.3; Conventions row *final object*): final vertices of `Cᵒᵖ`. -/
def IsInitialVertex {C : SSet.{u}} (X : C _⦋0⦌) : Prop :=
  IsTerminalVertex (X := C.op) (opObjEquiv.symm X)

/-- Local copy of Tau Ceti `SSet.IsColimit` (`…/Quasicategory/Limit.lean`), README L1.5 *Limits and
colimits* (HTT Definition 1.2.13.4; Conventions row *limit, colimit*): an initial vertex of `C_{p/}`. -/
def IsColimit {K C : SSet.{u}} (p : K ⟶ C) (c : (coslice p) _⦋0⦌) : Prop := IsInitialVertex c

/-- Local copy of Tau Ceti `SSet.IsLimit` (`…/Quasicategory/Limit.lean`), README L1.5 *Limits and
colimits* (HTT Definition 1.2.13.4; Conventions row *limit, colimit*): a final vertex of `C_{/p}`. -/
def IsLimit {K C : SSet.{u}} (p : K ⟶ C) (c : (slice p) _⦋0⦌) : Prop := IsTerminalVertex c

/-- Colimit diagrams, README L1.5 *Limits and colimits* (`SSet.IsColimitDiagram`; HTT Remark
1.2.13.5): `IsColimit` of the vertex of `C_{pbar|K/}` determined by `pbar : K^▷ ⟶ C`. -/
def IsColimitDiagram {K C : SSet.{u}} (pbar : rightCone K ⟶ C) : Prop :=
  IsColimit _ (yonedaEquiv (coslice.homEquiv.symm ⟨pbar, rfl⟩ :
    Δ[0] ⟶ coslice (join.inl K Δ[0] ≫ pbar)))

/-- Limit diagrams, the dual of `IsColimitDiagram` (README L1.5 *Limits and colimits*, HTT Remark
1.2.13.5), used by the squares of README L5.10 (`SSet.IsPullback`). -/
def IsLimitDiagram {K C : SSet.{u}} (pbar : leftCone K ⟶ C) : Prop :=
  IsLimit _ (yonedaEquiv (slice.homEquiv.symm ⟨pbar, rfl⟩ : Δ[0] ⟶ slice (join.inr Δ[0] K ≫ pbar)))

/-! ## Conventions: categorical fibrations, adjunctions, reflective localizations -/

/-- Categorical fibrations, README L3.8 *Categorical fibrations* (`SSet.CategoricalFibration`;
`HTT.2.2.5/categorical-fibration`, HTT §2.2.5; Kerodon 4.5.6.5; Conventions row *categorical
fibration*): right lifting against monomorphisms that are categorical equivalences. Redefines
Tau Ceti's `SSet.CategoricalFibration`. -/
def CategoricalFibration {X Y : SSet.{u}} (p : X ⟶ Y) : Prop :=
  (MorphismProperty.monomorphisms SSet.{u} ⊓ fun _ _ f ↦ IsCategoricalEquivalence f).rlp p

/-- Left adjoints, README L1.2 *Adjunctions* (`HTT.1.2.7/adjunction`; Kerodon Definition 6.2.1.1;
Conventions row *adjunction*): a Mathlib `Bicategory.Adjunction` in `SSet.QCat.bicategory`. -/
def QCat.IsLeftAdjoint {C D : SSet.QCat.{u}} (F : C ⟶ D) : Prop :=
  ∃ G : D ⟶ C, Nonempty (Bicategory.Adjunction F G)

/-- Right adjoints, README L6.4 *Functor ∞-categories of left and right adjoints*
(`QCat.IsRightAdjoint`, with `SSet.funR`; HTT Definition 5.2.6.1; Conventions row *adjunction*): a
Mathlib `Bicategory.Adjunction` in `SSet.QCat.bicategory` with the given 1-morphism on the right. -/
def QCat.IsRightAdjoint {C D : SSet.QCat.{u}} (G : C ⟶ D) : Prop :=
  ∃ F : D ⟶ C, Nonempty (Bicategory.Adjunction F G)

/-- Reflective localizations, README L6 *Reflective localizations* (`SSet.IsReflectiveLocalization`;
HTT Definition 5.2.7.2; Conventions row *reflective localization*): a fully faithful right
adjoint. -/
def IsReflectiveLocalization {C D : SSet.QCat.{u}} (f : C ⟶ D) : Prop :=
  ∃ g : D ⟶ C, Nonempty (Bicategory.Adjunction f g) ∧ IsFullyFaithful g.hom

/-! ## Conventions: Kan extensions (L5.8, L5.9) -/

/-- The comparison `C_{pbar/} ⟶ C_{p/} ×_{D_{fp/}} D_{fpbar/}` of README L5.8 *Relative colimits*
(`SSet.IsRelColimit`; HTT 4.3.1.1), with `p` the restriction of `pbar` to `K`. -/
def relColimitComparison {K C D : SSet.{u}} (f : C ⟶ D) (pbar : rightCone K ⟶ C) :
    coslice pbar ⟶ Limits.pullback
      (coslice.map (𝟙 K) f (by simp) :
        coslice (join.inl K Δ[0] ≫ pbar) ⟶ coslice ((join.inl K Δ[0] ≫ pbar) ≫ f))
      (coslice.map (join.inl K Δ[0]) (𝟙 D) (by simp) :
        coslice (pbar ≫ f) ⟶ coslice ((join.inl K Δ[0] ≫ pbar) ≫ f)) :=
  Limits.pullback.lift (coslice.map (join.inl K Δ[0]) (𝟙 C) (by simp))
    (coslice.map (𝟙 _) f (by simp)) sorry

/-- Relative colimits, README L5.8 *Relative colimits* (`SSet.IsRelColimit`; HTT Definition
4.3.1.1): the comparison has the right lifting property against every `∂Δ[n] ⟶ Δ[n]`. -/
def IsRelColimit {K C D : SSet.{u}} (f : C ⟶ D) [InnerFibration f] (pbar : rightCone K ⟶ C) :
    Prop :=
  modelCategoryQuillen.I.rlp (relColimitComparison f pbar)

/-- The comparison `C_{/pbar} ⟶ C_{/p} ×_{D_{/fp}} D_{/fpbar}` of README L5.8 *Relative colimits*
(`SSet.IsRelLimit`, the dual). -/
def relLimitComparison {K C D : SSet.{u}} (f : C ⟶ D) (pbar : leftCone K ⟶ C) :
    slice pbar ⟶ Limits.pullback
      (slice.map (𝟙 K) f (by simp) :
        slice (join.inr Δ[0] K ≫ pbar) ⟶ slice ((join.inr Δ[0] K ≫ pbar) ≫ f))
      (slice.map (join.inr Δ[0] K) (𝟙 D) (by simp) :
        slice (pbar ≫ f) ⟶ slice ((join.inr Δ[0] K ≫ pbar) ≫ f)) :=
  Limits.pullback.lift (slice.map (join.inr Δ[0] K) (𝟙 C) (by simp))
    (slice.map (𝟙 _) f (by simp)) sorry

/-- Relative limits, README L5.8 *Relative colimits* (`SSet.IsRelLimit`, dual of HTT 4.3.1.1). -/
def IsRelLimit {K C D : SSet.{u}} (f : C ⟶ D) [InnerFibration f] (pbar : leftCone K ⟶ C) : Prop :=
  modelCategoryQuillen.I.rlp (relLimitComparison f pbar)

/-- The cone `(C₀ ×_C C_{/c})^▷ ⟶ C_{/c}^▷ ⟶ C` of README L5.9 *Kan extensions along full
inclusions* (HTT 4.3.2.2), with `C₀ = fullEnhancedSubcategory C P` and the tautological cone. -/
def leftKanExtensionCone {C : SSet.{u}} (P : C _⦋0⦌ → Prop) (c : C _⦋0⦌) :
    rightCone (Limits.pullback (fullEnhancedSubcategory C P).ι
      (slice.π (yonedaEquiv.symm c))) ⟶ C :=
  join.map (Limits.pullback.snd _ _) (𝟙 Δ[0]) ≫
    (slice.homEquiv (𝟙 (slice (yonedaEquiv.symm c)))).1

/-- The cone `(C₀ ×_C C_{c/})^◁ ⟶ C_{c/}^◁ ⟶ C`, dual of `leftKanExtensionCone` (README L5.9,
right Kan extensions). -/
def rightKanExtensionCone {C : SSet.{u}} (P : C _⦋0⦌ → Prop) (c : C _⦋0⦌) :
    leftCone (Limits.pullback (fullEnhancedSubcategory C P).ι
      (coslice.π (yonedaEquiv.symm c))) ⟶ C :=
  join.map (𝟙 Δ[0]) (Limits.pullback.snd _ _) ≫
    (coslice.homEquiv (𝟙 (coslice (yonedaEquiv.symm c)))).1

/-- Pointwise relative left Kan extensions, README L5.9 *Kan extensions along full inclusions*
(`SSet.IsRelLeftKanExtension`; HTT Definition 4.3.2.2 = Kerodon 7.3.2.1; Conventions row *Kan
extension*), at the object `c`; `C₀` is the full subcategory on `P`. -/
def IsRelLeftKanExtensionAt {C D D' : SSet.{u}} [Quasicategory C] [Quasicategory D]
    [Quasicategory D'] (p : D ⟶ D') [InnerFibration p] (P : C _⦋0⦌ → Prop) (F : C ⟶ D)
    (c : C _⦋0⦌) : Prop :=
  IsRelColimit p (leftKanExtensionCone P c ≫ F)

/-- Relative left Kan extensions, README L5.9 *Kan extensions along full inclusions* (HTT
4.3.2.2): at every object. -/
def IsRelLeftKanExtension {C D D' : SSet.{u}} [Quasicategory C] [Quasicategory D]
    [Quasicategory D'] (p : D ⟶ D') [InnerFibration p] (P : C _⦋0⦌ → Prop) (F : C ⟶ D) : Prop :=
  ∀ c, IsRelLeftKanExtensionAt p P F c

/-- The terminal simplicial set is a quasicategory (helper for `IsLeftKanExtension`, the case
`D' = Δ[0]` of README L5.9). -/
instance quasicategory_terminal : Quasicategory (⊤_ SSet.{u}) := sorry

/-- Left Kan extensions along a full inclusion, README L5.9 *Kan extensions along full inclusions*
(`SSet.IsLeftKanExtension`; HTT 4.3.2.2): the case `D' = Δ[0]`. -/
def IsLeftKanExtension {C D : SSet.{u}} [Quasicategory C] [Quasicategory D]
    (P : C _⦋0⦌ → Prop) (F : C ⟶ D) : Prop :=
  IsRelLeftKanExtension (terminal.from D) P F

/-- Relative right Kan extensions at `c`, README L5.9 (`SSet.IsRelRightKanExtension`, dual of HTT
4.3.2.2). -/
def IsRelRightKanExtensionAt {C D D' : SSet.{u}} [Quasicategory C] [Quasicategory D]
    [Quasicategory D'] (p : D ⟶ D') [InnerFibration p] (P : C _⦋0⦌ → Prop) (F : C ⟶ D)
    (c : C _⦋0⦌) : Prop :=
  IsRelLimit p (rightKanExtensionCone P c ≫ F)

/-- Relative right Kan extensions, README L5.9 (`SSet.IsRelRightKanExtension`, dual of HTT
4.3.2.2). -/
def IsRelRightKanExtension {C D D' : SSet.{u}} [Quasicategory C] [Quasicategory D]
    [Quasicategory D'] (p : D ⟶ D') [InnerFibration p] (P : C _⦋0⦌ → Prop) (F : C ⟶ D) : Prop :=
  ∀ c, IsRelRightKanExtensionAt p P F c

/-- Right Kan extensions along a full inclusion, README L5.9 (`SSet.IsRightKanExtension`, dual of
HTT 4.3.2.2; used by HTT 6.1.2.11). -/
def IsRightKanExtension {C D : SSet.{u}} [Quasicategory C] [Quasicategory D]
    (P : C _⦋0⦌ → Prop) (F : C ⟶ D) : Prop :=
  IsRelRightKanExtension (terminal.from D) P F

/-- The fat coslice `D^{q/}`, README L5.5 *Fat joins and morphism spaces* (`SSet.fatCoslice`; HTT
4.2.1.5), used by *Kan extensions along arbitrary maps*. -/
def fatCoslice {K D : SSet.{u}} (q : K ⟶ D) : SSet.{u} := sorry

/-- The image in the fat coslice `D^{q/}` of the vertex of `D_{q/}` given by a cone `pbar` extending
`q` (README L5.5, the map `D_{q/} ⟶ D^{q/}` of HTT 4.2.1.5). -/
def fatCoslice.ofCone {K D : SSet.{u}} {q : K ⟶ D} (pbar : rightCone K ⟶ D)
    (h : join.inl K Δ[0] ≫ pbar = q) : (fatCoslice q) _⦋0⦌ := sorry

/-- `K_{/c} := K ×_{K'} K'_{/c}`, README L5.9 *Kan extensions along arbitrary maps* (Kerodon
7.3.1.2). -/
abbrev overVertex {K K' : SSet.{u}} (δ : K ⟶ K') (c : K' _⦋0⦌) : SSet.{u} :=
  Limits.pullback δ (slice.π (yonedaEquiv.symm c))

/-- The vertex of `D^{(f∘π)/}` given by the composite `(α ∘ π) ≫ f'(τ_c) : f ∘ π ⟶ const_{f'(c)}`,
README L5.9 *Kan extensions along arbitrary maps* (`τ_c` through `SSet.fatJoin.toJoin`, HTT
4.2.1.1). -/
def kanExtensionAlongVertex {K K' D : SSet.{u}} (δ : K ⟶ K') {f : K ⟶ D} {f' : K' ⟶ D}
    (α : Edge (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ f'))) (c : K' _⦋0⦌) :
    (fatCoslice (Limits.pullback.fst δ (slice.π (yonedaEquiv.symm c)) ≫ f)) _⦋0⦌ := sorry

/-- Kan extensions along arbitrary maps, README L5.9 *Kan extensions along arbitrary maps*
(`SSet.IsLeftKanExtensionAlong`; Kerodon Definition 7.3.1.2, pointwise; Conventions row *Kan
extension*): for every vertex `c` of `K'`, some colimit cone over `f ∘ π` on `K_{/c}` is equivalent
in `D^{(f∘π)/}` to `(α ∘ π) ≫ f'(τ_c)`. -/
def IsLeftKanExtensionAlong {K K' D : SSet.{u}} [Quasicategory D] (δ : K ⟶ K') {f : K ⟶ D}
    {f' : K' ⟶ D} (α : Edge (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ f'))) : Prop :=
  ∀ c : K' _⦋0⦌, ∃ (pbar : rightCone (overVertex δ c) ⟶ D)
    (h : join.inl _ Δ[0] ≫ pbar = Limits.pullback.fst δ (slice.π (yonedaEquiv.symm c)) ≫ f),
    IsColimitDiagram pbar ∧
      ∃ e : Edge (fatCoslice.ofCone pbar h) (kanExtensionAlongVertex δ α c), Edge.IsEquivalence e

/-! ## Conventions: localization (L9.5) and cofinality (L5.2) -/

/-- The full subcategory `Fun_W(C, E)` of `Fun(C, E)` on the functors carrying every W-edge to an
equivalence, README L9.5 *Localization* (HA 1.3.4.1), with C lifted to the universe of E. -/
def funW {C : SSet.{u}} (W : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop) (E : SSet.{max u w}) :
    ((ihom (uliftFunctor.{w}.obj C)).obj E).Subcomplex :=
  fullEnhancedSubcategory _ fun g ↦ ∀ ⦃x y : C _⦋0⦌⦄ (e : Edge x y), W e →
    Edge.IsEquivalence (Edge.mk' ((ihomVertexEquiv g).app _ ⟨e.edge⟩))

/-- Precomposition `Fun(D, E) ⟶ Fun_W(C, E)` with `f`, README L9.5 *Localization* (HA 1.3.4.1). -/
def localizationPrecomp {C D : SSet.{u}} (f : C ⟶ D) (W : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop)
    (E : SSet.{max u w}) : (ihom (uliftFunctor.{w}.obj D)).obj E ⟶ (funW.{w} W E : SSet) :=
  Subcomplex.lift ((MonoidalClosed.pre (uliftFunctor.{w}.map f)).app E) sorry

/-- Localizations, README L9.5 *Localization* (`SSet.IsLocalization`; HA Definition 1.3.4.1,
Kerodon 6.3.1.9; Conventions row *localization*): `f` inverts `W`, and precomposition with `f` is
a categorical equivalence `Fun(D, E) ⟶ Fun_W(C, E)` for every ∞-category `E` in `SSet.{max u w}`. -/
def IsLocalization {C D : SSet.{u}} [Quasicategory D] (f : C ⟶ D)
    (W : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop) : Prop :=
  (∀ ⦃x y : C _⦋0⦌⦄ (e : Edge x y), W e → Edge.IsEquivalence (e.map f)) ∧
    ∀ (E : SSet.{max u w}) [Quasicategory E],
      IsCategoricalEquivalence (localizationPrecomp.{w} f W E)

/-- The section space `Map_T(S, X)`, the fibre of `Fun(S, X) ⟶ Fun(S, T)` over `s`; README L5.2
*Cofinal maps* (HTT 4.1.1.1, Remark 4.1.1.2). -/
def sectionSpace {S T X : SSet.{u}} (q : X ⟶ T) (s : S ⟶ T) : ((ihom S).obj X).Subcomplex :=
  (Subcomplex.ofSimplex (n := 0) (ihomVertexEquiv.symm s)).preimage ((ihom S).map q)

/-- Restriction of sections `Map_T(T, X) ⟶ Map_T(S, X)`, README L5.2 *Cofinal maps*
(`SSet.sectionsRestrict`, propose; HTT 4.1.1.1). -/
def sectionsRestrict {S T X : SSet.{u}} (p : S ⟶ T) (q : X ⟶ T) :
    (sectionSpace q (𝟙 T) : SSet.{u}) ⟶ (sectionSpace q p : SSet.{u}) :=
  Subcomplex.lift (Subcomplex.ι _ ≫ (MonoidalClosed.pre p).app X) sorry

/-- Cofinal maps, README L5.2 *Cofinal maps* (`SSet.IsCofinal`; HTT Definition 4.1.1.1; Kerodon's
right cofinal 7.2.1.1; Conventions row *cofinal*): restriction of sections along `p` is a homotopy
equivalence for every right fibration `X ⟶ T` in `SSet.{u}`. -/
def IsCofinal {S T : SSet.{u}} (p : S ⟶ T) : Prop :=
  ∀ (X : SSet.{u}) (q : X ⟶ T) [SSet.RightFibration q],
    IsHomotopyEquivalence (sectionsRestrict p q)

/-! ## Conventions: colimit predicates (L5.6), idempotent completeness, filtered, compact -/

/-- Every diagram of shape `K` has a colimit, README L5.6 supporting predicate
(`SSet.HasColimitsOfShape`; HTT §4.2.3). -/
def HasColimitsOfShape (K C : SSet.{u}) : Prop :=
  ∀ p : K ⟶ C, ∃ c : (coslice p) _⦋0⦌, IsColimit p c

/-- Small colimits, README L5.6 supporting predicate (`SSet.HasSmallColimits`; HTT §4.2.3), with
`C` lifted to the universe of the diagrams. -/
def HasSmallColimits (C : SSet.{v}) : Prop :=
  ∀ K : SSet.{u}, HasColimitsOfShape (uliftFunctor.{v}.obj K) (uliftFunctor.{u}.obj C)

/-- The category `R` with objects `X`, `Y`, maps `i : X ⟶ Y`, `r : Y ⟶ X` and `r ∘ i = id`,
README L6 *Idempotents and retraction diagrams* (HTT 4.4.5.2). -/
def IdemPlusCat : Type := Fin 2

/-- The category structure of `IdemPlusCat`, README L6 (HTT 4.4.5.2). -/
instance : SmallCategory IdemPlusCat := sorry

/-- `Idem⁺ = N(R)`, README L6 *Idempotents and retraction diagrams* (`SSet.idemPlus`; HTT
4.4.5.2). -/
abbrev idemPlus : SSet.{0} := nerve IdemPlusCat

/-- `Idem ⊆ Idem⁺`, the full subcategory on `X`, README L6 (`SSet.idem`; HTT 4.4.5.2). -/
abbrev idem : SSet.{0} :=
  (fullEnhancedSubcategory idemPlus fun v ↦ nerveEquiv v = (show IdemPlusCat from (0 : Fin 2)) : SSet)

/-- Idempotent complete ∞-categories, README L6 *Retracts and idempotent completeness*
(`SSet.IsIdempotentComplete`; HTT §4.4.5, §5.1.4; Conventions row *idempotent complete*): every
idempotent has a colimit. -/
def IsIdempotentComplete (C : SSet.{u}) [Quasicategory C] : Prop :=
  HasColimitsOfShape (uliftFunctor.{u}.obj idem) C

/-- Filtered ∞-categories, README L6 *κ-filtered ∞-categories* (`SSet.IsFiltered`; HTT Definition
5.3.1.7; Conventions row *filtered*): ω-filtered. -/
abbrev IsFiltered (C : SSet.{u}) : Prop := SSet.IsCardinalFiltered C (ℵ₀ : Cardinal.{u})

/-- Small κ-filtered colimits, README L6 *κ-continuous functors, κ-compact objects*
(`SSet.HasCardinalFilteredColimits`, propose; HTT 5.3.4.5), with `C` lifted to the universe of the
diagrams. -/
def HasCardinalFilteredColimits (C : SSet.{v}) (κ : Cardinal.{w}) : Prop :=
  ∀ (K : SSet.{u}) [Quasicategory K] [SSet.IsCardinalFiltered K κ],
    HasColimitsOfShape (uliftFunctor.{v}.obj K) (uliftFunctor.{u}.obj C)

/-- κ-continuous functors, README L6 *κ-continuous functors, κ-compact objects*
(`SSet.IsCardinalContinuous`; HTT Definition 5.3.4.5; Conventions row *κ-compact*). -/
def IsCardinalContinuous {C D : SSet.{v}} [Quasicategory C] [Quasicategory D] (F : C ⟶ D)
    (κ : Cardinal.{w}) [Fact κ.IsRegular] (_hC : HasCardinalFilteredColimits.{w, v, u} C κ) :
    Prop :=
  ∀ (K : SSet.{u}) [Quasicategory K] [SSet.IsCardinalFiltered K κ]
    (pbar : rightCone (uliftFunctor.{v}.obj K) ⟶ uliftFunctor.{u}.obj C),
    IsColimitDiagram pbar → IsColimitDiagram (pbar ≫ uliftFunctor.{u}.map F)

/-- The simplicial category `Kan` of Kan complexes, README L1.4 (`SSet.Kan`): the full subcategory
of `SSet.{u}` on the Kan complexes. -/
abbrev Kan : Type (u + 1) := ObjectProperty.FullSubcategory fun X : SSet.{u} ↦ KanComplex X

/-- The simplicial structure of `Kan`, restricted from `SimplicialCategory SSet.{u}` (README L1.4,
`SSet.Kan`). -/
instance : SimplicialCategory Kan.{u} := sorry

/-- The ∞-category of spaces `S = N(Kan)`, README L1.4 (`SSet.spaces`; HTT 1.2.16.1). -/
abbrev spaces : SSet.{u + 1} := SimplicialNerve Kan.{u}

/-- `S` is a quasicategory, README L1.4 (`[SSet.Quasicategory SSet.spaces]`; HTT 1.1.5.10). -/
instance : Quasicategory spaces.{u} := sorry

/-- The opposite of a quasicategory is a quasicategory (helper, used by the dual definitions). -/
instance quasicategory_op (X : SSet.{u}) [Quasicategory X] : Quasicategory X.op := sorry

/-- The corepresented functor `j_X : C ⟶ S`, README L6 (`SSet.corepresented`; HTT 5.1.5 and
5.3.4.5). -/
def corepresented (C : SSet.{v}) (X : C _⦋0⦌) : uliftFunctor.{v + 1}.obj C ⟶ spaces.{v} := sorry

/-- Small κ-filtered colimits pass to the universe lift (helper for `IsCardinalPresentable`). -/
theorem HasCardinalFilteredColimits.uliftFunctor {C : SSet.{v}} {κ : Cardinal.{w}}
    (hC : HasCardinalFilteredColimits.{w, v, u} C κ) :
    HasCardinalFilteredColimits.{w, v + 1, u} (SSet.uliftFunctor.{v + 1}.obj C) κ := sorry

/-- The universe lift of a quasicategory is a quasicategory (helper). -/
instance quasicategory_uliftFunctor (X : SSet.{u}) [Quasicategory X] :
    Quasicategory (uliftFunctor.{v}.obj X) := sorry

/-- κ-compact objects, README L6 *κ-continuous functors, κ-compact objects*
(`SSet.IsCardinalPresentable`; HTT Definition 5.3.4.5; Conventions row *κ-compact*): the
corepresented functor is κ-continuous. -/
def IsCardinalPresentable {C : SSet.{v}} [Quasicategory C] (X : C _⦋0⦌) (κ : Cardinal.{w})
    [Fact κ.IsRegular] (hC : HasCardinalFilteredColimits.{w, v, u} C κ) : Prop :=
  IsCardinalContinuous (corepresented C X) κ hC.uliftFunctor

/-! ## Conventions: Ind-completion, size, accessibility, presentability (L6, L7) -/

/-- The presheaf ∞-category `P(S) = Fun(S^op, S)`, README L6 (`SSet.presheaf`; HTT 5.1.0.1). -/
abbrev presheaf (S : SSet.{u}) : SSet.{u + 1} :=
  (ihom (uliftFunctor.{u + 1}.obj S.op)).obj spaces.{u}

/-- The total space `Z'` of the universal right fibration, README L5.1 (HTT §3.3.2, proposed
name). -/
def universalRightFibrationTotal : SSet.{u + 1} := sorry

/-- The universal right fibration `Z' ⟶ S^op`, README L5.1 (`SSet.universalRightFibration`, HTT
§3.3.2, proposed name). -/
def universalRightFibration : universalRightFibrationTotal.{u} ⟶ spaces.{u}.op := sorry

/-- `Ind_κ(C)`, README L6 *`Ind_κ`* (`SSet.ind`; HTT Definition 5.3.5.1; Conventions row
*Ind-completion*): the presheaves whose classified right fibration has κ-filtered total space. -/
def ind (κ : Cardinal.{w}) (C : SSet.{u}) [Quasicategory C] [Fact κ.IsRegular] : SSet.{u + 1} :=
  (fullEnhancedSubcategory (presheaf C) fun F ↦ SSet.IsCardinalFiltered
    (Limits.pullback (opFunctor.map (ihomVertexEquiv F)) universalRightFibration) κ : SSet)

/-- Essentially κ-small ∞-categories, README L7 *Essentially κ-small ∞-categories*
(`SSet.IsEssentiallyCardinalSmall`, propose; HTT 5.4.1.2 (3), 5.4.1.3; Kerodon 4.9.5.1;
Conventions row *essentially κ-small*): a categorical equivalence from a quasicategory with fewer
than κ nondegenerate simplices. The theorems assume `[Fact κ.IsRegular]` and `ℵ₀ < κ`. -/
def IsEssentiallyCardinalSmall (C : SSet.{v}) [Quasicategory C] (κ : Cardinal.{u}) : Prop :=
  ∃ (D : SSet.{u}) (_ : Quasicategory D), HasCardinalLT D.N κ ∧
    ∃ f : uliftFunctor.{v}.obj D ⟶ uliftFunctor.{u}.obj C, IsCategoricalEquivalence f

/-- Essentially small ∞-categories, README L7 *Essentially κ-small ∞-categories*
(`SSet.IsEssentiallySmall`, propose; HTT 5.4.1.3). -/
def IsEssentiallySmall (C : SSet.{v}) [Quasicategory C] : Prop :=
  ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular), ℵ₀ < κ ∧ IsEssentiallyCardinalSmall C κ

/-- κ-accessible ∞-categories, README L7 *κ-accessible ∞-categories* (`SSet.IsCardinalAccessible`,
propose; HTT Definition 5.4.2.1; Conventions row *accessible*): `Ind_κ(C₀) ≃ C` with `C₀` small. -/
def IsCardinalAccessible (C : SSet.{v}) [Quasicategory C] (κ : Cardinal.{u}) [Fact κ.IsRegular] :
    Prop :=
  ∃ (C₀ : SSet.{u}) (_ : Quasicategory C₀),
    ∃ f : uliftFunctor.{v}.obj (ind κ C₀) ⟶ uliftFunctor.{u + 1}.obj C, IsCategoricalEquivalence f

/-- Accessible ∞-categories, README L7 *κ-accessible ∞-categories* (`SSet.IsAccessible`, propose;
HTT 5.4.2.1). -/
def IsAccessible (C : SSet.{v}) [Quasicategory C] : Prop :=
  ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular), IsCardinalAccessible C κ

/-- Presentable ∞-categories, README L7 *Presentable ∞-categories* (`SSet.IsPresentable`, propose;
HTT Definition 5.5.0.1; Conventions row *presentable*): accessible with small colimits. -/
def IsPresentable (C : SSet.{v}) [Quasicategory C] : Prop :=
  IsAccessible.{v, u} C ∧ HasSmallColimits.{v, u} C

/-! ## Conventions: exactness (L6) -/

/-- κ-right exact functors, README L6 *κ-right exact functors* (`SSet.IsCardinalRightExact`; HTT
Definition 5.3.2.1). -/
def IsCardinalRightExact {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] (F : A ⟶ B)
    (κ : Cardinal.{w}) : Prop :=
  ∀ (B' : SSet.{u}) (r : B' ⟶ B) [SSet.RightFibration r],
    SSet.IsCardinalFiltered B' κ →
      SSet.IsCardinalFiltered (Limits.pullback F r) κ

/-- κ-left exact functors, README L6 *κ-right exact functors* (`SSet.IsCardinalLeftExact`; HTT
Remarks 5.3.2.2, 5.3.2.10): `G^op` is κ-right exact. -/
def IsCardinalLeftExact {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] (G : A ⟶ B)
    (κ : Cardinal.{w}) : Prop :=
  IsCardinalRightExact (opFunctor.map G) κ

/-- Left exact functors, README L6 (`SSet.IsLeftExact`; HTT 5.3.2.2; Conventions row *left
exact*). -/
def IsLeftExact {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] (G : A ⟶ B) : Prop :=
  IsCardinalLeftExact G (ℵ₀ : Cardinal.{u})

/-- Right exact functors, README L6 (`SSet.IsRightExact`; HTT 5.3.2.1 at κ = ω). -/
def IsRightExact {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] (F : A ⟶ B) : Prop :=
  IsCardinalRightExact F (ℵ₀ : Cardinal.{u})

/-! ## Conventions: groupoid objects, Čech nerves, effective epimorphisms (L5.10, L10) -/

/-- The fixed isomorphism `Δ[1] ⊗ Δ[1] ≅ (Λ[2, 2])^◁`, README L5.10 (`SSet.IsPullback`; HTT
4.4.2.1). -/
def squareIsoLeftCone : (Δ[1] ⊗ Δ[1] : SSet.{u}) ≅ leftCone (Λ[2, 2] : SSet.{u}) := sorry

/-- Pullback squares, README L5.10 (`SSet.IsPullback`; HTT 4.4.2.1): a limit diagram through
`Δ[1] ⊗ Δ[1] ≅ (Λ[2, 2])^◁`. -/
def IsPullback {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsLimitDiagram (squareIsoLeftCone.inv ≫ σ)

/-- `N(Δ)^op`, lifted to `SSet.{u}`, README L10 *Groupoid objects* (HTT 6.1.2.6). -/
abbrev nerveSimplexOp : SSet.{u} := uliftFunctor.{u}.obj (nerve SimplexCategory).op

/-- `N(Δ₊)^op`, lifted to `SSet.{u}`, README L10 *Čech nerves* (HTT 6.1.2.11). -/
abbrev nerveAugmentedOp : SSet.{u} := uliftFunctor.{u}.obj (nerve AugmentedSimplexCategory).op

/-- The square `[n] ⟶ S, S' ⟶ {s}` of `Δ^op` as a map `Δ[1] ⊗ Δ[1] ⟶ N(Δ)^op`, through
`S ≅ [|S| − 1]`; README L10 *Groupoid objects* (HTT 6.1.2.6 (4″)). -/
def groupoidSquare (n : ℕ) (S S' : Finset (Fin (n + 1))) (s : Fin (n + 1))
    (h : S ∪ S' = Finset.univ) (h' : S ∩ S' = {s}) : Δ[1] ⊗ Δ[1] ⟶ nerveSimplexOp.{u} := sorry

/-- Groupoid objects, README L10 *Groupoid objects* (`SSet.IsGroupoidObject`, propose; HTT
6.1.2.6 (4″), 6.1.2.7; Conventions row *groupoid object*). -/
def IsGroupoidObject {C : SSet.{u}} [Quasicategory C] (U : nerveSimplexOp.{u} ⟶ C) : Prop :=
  ∀ (n : ℕ) (S S' : Finset (Fin (n + 1))) (s : Fin (n + 1)) (h : S ∪ S' = Finset.univ)
    (h' : S ∩ S' = {s}), IsPullback (groupoidSquare n S S' s h h' ≫ U)

/-- Augmented simplicial objects `N(Δ₊)^op ⟶ C`, README L6.8 (`SSet.augmentedSimplicialObjects`). -/
abbrev augmentedSimplicialObjects (C : SSet.{u}) : Type u := nerveAugmentedOp.{u} ⟶ C

/-- Čech nerves, README L10 *Čech nerves* (`SSet.IsCechNerve`, propose; HTT 6.1.2.11 (1);
Conventions row *Čech nerve*): a right Kan extension of its restriction to `N(Δ₊^{≤0})^op`. -/
def IsCechNerve {C : SSet.{u}} [Quasicategory C] (U : augmentedSimplicialObjects C) : Prop :=
  IsRightKanExtension (fun v : nerveAugmentedOp.{u} _⦋0⦌ ↦ ∀ x : SimplexCategory,
    nerveEquiv (opObjEquiv v.down) = WithInitial.of x → x.len = 0) U

/-- The canonical isomorphism `(N(Δ)^op)^▷ ≅ N(Δ₊)^op`, README L6.8 (`SSet.IsGeometricRealization`;
HTT 6.1.2.12). -/
def geometricRealizationIso : rightCone nerveSimplexOp.{u} ≅ nerveAugmentedOp.{u} := sorry

/-- Geometric realizations, README L6.8 (`SSet.IsGeometricRealization`; HTT 6.1.2.12). -/
def IsGeometricRealization {C : SSet.{u}} (U : augmentedSimplicialObjects C) : Prop :=
  IsColimitDiagram (geometricRealizationIso.hom ≫ U)

/-- The edge `[0] ⟶ [−1]` of `N(Δ₊)^op`, whose image is the augmentation; README L10 *Effective
epimorphisms* (HTT 6.2.3.5). -/
def augmentationEdge : nerveAugmentedOp.{u} _⦋1⦌ := sorry

/-- Effective epimorphisms, README L10 *Effective epimorphisms* (`SSet.IsEffectiveEpi`, propose;
HTT Corollary 6.2.3.5 (2); Conventions row *effective epimorphism*): some Čech nerve of `f` is a
geometric realization. -/
def IsEffectiveEpi {C : SSet.{u}} [Quasicategory C] {x y : C _⦋0⦌} (f : Edge x y) : Prop :=
  ∃ U : augmentedSimplicialObjects C,
    U.app _ augmentationEdge = f.edge ∧ IsCechNerve U ∧ IsGeometricRealization U

/-! ## Conventions: Grothendieck topologies (L10) -/

/-- Sieves on an ∞-category, README L10 *Sieves and Grothendieck topologies* (`SSet.Sieve`,
propose; HTT Definition 6.2.2.1). -/
def Sieve (C : SSet.{u}) : Type u :=
  {P : C _⦋0⦌ → Prop // ∀ ⦃c d : C _⦋0⦌⦄ (_ : Edge c d), P d → P c}

/-- Grothendieck topologies on an ∞-category, README L10 *Sieves and Grothendieck topologies*
(`SSet.GrothendieckTopology`, propose; HTT 6.2.2.1 with Remark 6.2.2.3; Conventions row
*Grothendieck topology*): a Mathlib `GrothendieckTopology` on `hC`. -/
abbrev GrothendieckTopology (C : SSet.{u}) [Quasicategory C] : Type u :=
  CategoryTheory.GrothendieckTopology (hoFunctor.obj C)

end SSet

/-! ## Conventions: t-structures (L9.2)

*Coherent topological space* (Conventions) has no new definition: it is the Mathlib hypotheses
`[CompactSpace X] [QuasiSeparatedSpace X] [PrespectralSpace X]`. *dg category* is Tau Ceti's
`TauCeti.DGCategory`. -/

namespace TStructure

open Pretriangulated

variable {D : Type u} [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- A Mathlib t-structure from HA's homological axioms, README L9.2 *t-structures on triangulated
categories* (`TStructure.mkHomological`; HA Definition 1.2.1.1, Notation 1.2.1.2), through the
dictionary `D_{≥n} = t.le (−n)`, `D_{≤n} = t.ge (−n)`. -/
def mkHomological (Dge Dle : ObjectProperty D) [Dge.IsClosedUnderIsomorphisms]
    [Dle.IsClosedUnderIsomorphisms]
    (orth : ∀ ⦃X Y : D⦄, Dge X → Dle Y → ∀ f : X ⟶ Y⟦(-1 : ℤ)⟧, f = 0)
    (shift_ge : ∀ X, Dge X → Dge (X⟦(1 : ℤ)⟧)) (shift_le : ∀ X, Dle X → Dle (X⟦(-1 : ℤ)⟧))
    (exists_triangle : ∀ A : D, ∃ (X Y : D) (_ : Dge X) (_ : Dle (Y⟦(1 : ℤ)⟧)) (f : X ⟶ A)
      (g : A ⟶ Y) (h : Y ⟶ X⟦(1 : ℤ)⟧), Triangle.mk f g h ∈ distTriang D) :
    Triangulated.TStructure D where
  le n X := Dge (X⟦n⟧)
  ge n X := Dle (X⟦n⟧)
  le_isClosedUnderIsomorphisms := sorry
  ge_isClosedUnderIsomorphisms := sorry
  le_shift := sorry
  ge_shift := sorry
  zero' := sorry
  le_zero_le := sorry
  ge_one_le := sorry
  exists_triangle_zero_one := sorry

end TStructure

namespace SSet

open _root_.SSet

/-- t-structures on a stable ∞-category, README L9.2 *t-structures on stable ∞-categories*
(`SSet.TStructure`; HA Definition 1.2.1.4; Conventions row *t-structure*): Mathlib's
`TStructure` on `hC`. The pretriangulated structure of `hC` (HA 1.1.2.14, from `[SSet.IsStable C]`)
is taken as instance arguments. -/
abbrev TStructure (C : SSet.{u}) [Preadditive (hoFunctor.obj C)]
    [HasZeroObject (hoFunctor.obj C)] [HasShift (hoFunctor.obj C) ℤ]
    [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive] [Pretriangulated (hoFunctor.obj C)] :=
  Triangulated.TStructure (hoFunctor.obj C)

variable {C : SSet.{u}} [Preadditive (hoFunctor.obj C)] [HasZeroObject (hoFunctor.obj C)]
  [HasShift (hoFunctor.obj C) ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive]
  [Pretriangulated (hoFunctor.obj C)]

/-- `C_{≥n}`, README L9.2 (`SSet.TStructure.geq`; HA 1.2.1.4): the full subcategory on the objects
of `t.le (−n)`. -/
def TStructure.geq (t : TStructure C) (n : ℤ) : C.Subcomplex :=
  fullEnhancedSubcategory C fun x ↦ t.le (-n) (show hoFunctor.obj C from HomotopyCategory.mk x)

/-- `C_{≤n}`, README L9.2 (`SSet.TStructure.leq`; HA 1.2.1.4): the full subcategory on the objects
of `t.ge (−n)`. -/
def TStructure.leq (t : TStructure C) (n : ℤ) : C.Subcomplex :=
  fullEnhancedSubcategory C fun x ↦ t.ge (-n) (show hoFunctor.obj C from HomotopyCategory.mk x)

end SSet

/-! ## Extension 1: layers F1, F2, F3, L2, L3, L4

The Definition and Notation targets of F1–F3 and L2–L4 that the sections above do not declare,
each in the form of its README *Lean:* line.
Entries whose *Lean:* line is "no new definition" (HTT A.1.1.1, A.1.1.2, A.1.3.4, A.1.3.5,
A.2.1.1, A.2.9.1, A.2.9.25/after, `HTT.A.2.7/kan-fibrations`, `HTT.A.2.7/homotopy-groups`) add
nothing; Tau Ceti main declarations are used as written (`SSet.CartesianFibration`,
`TauCeti.MarkedSSet`, …), and those newer than the pin (`SSet.LeftFibration`, `SSet.catInfty`, …)
are copied in the first block of this section. -/

universe v₁ u₁ v₂ u₂

/-! ### Tau Ceti declarations postdating the pin (layers F3, L2–L4)

Local copies of Tau Ceti main declarations not yet present at the pinned revision (`2fd255d`). -/

namespace SSet

open _root_.SSet

/-- Local copy of Tau Ceti `SSet.leftHornInclusions`
(`TauCeti/AlgebraicTopology/SimplicialSet/AnodyneExtensions/LeftRight/Basic.lean`); README L2.1
(HTT 2.0.0.3): `Λ[n + 1, i] ⟶ Δ[n + 1]` for `i < n + 1`. -/
inductive leftHornInclusions : MorphismProperty SSet.{u} where
  | intro {n : ℕ} (i : Fin (n + 2)) (hn : i < Fin.last (n + 1)) : leftHornInclusions Λ[n + 1, i].ι

/-- Local copy of Tau Ceti `SSet.leftFibrations` (`…/AnodyneExtensions/LeftRight/Basic.lean`);
README L2.1 (HTT Definition 2.0.0.3). -/
def leftFibrations : MorphismProperty SSet.{u} := leftHornInclusions.rlp

/-- Local copy of Tau Ceti `SSet.rightFibrations` (`…/AnodyneExtensions/LeftRight/Basic.lean`);
README L2.1 (HTT Definition 2.0.0.3). -/
def rightFibrations : MorphismProperty SSet.{u} := rightHornInclusions.rlp

/-- Local copy of Tau Ceti `SSet.LeftFibration` (`…/AnodyneExtensions/LeftRight/Basic.lean`);
README L2.1 *Left, right and inner fibrations* (HTT Definition 2.0.0.3). -/
class LeftFibration {X Y : SSet.{u}} (p : X ⟶ Y) : Prop where
  mem : leftFibrations p

/-- Local copy of Tau Ceti `SSet.leftAnodyneExtensions` (`…/AnodyneExtensions/LeftRight/Basic.lean`);
README L2.1 (HTT Definition 2.0.0.3). -/
def leftAnodyneExtensions : MorphismProperty SSet.{u} := leftFibrations.llp

/-- Local copy of Tau Ceti `SSet.rightAnodyneExtensions`
(`…/AnodyneExtensions/LeftRight/Basic.lean`); README L2.1 (HTT Definition 2.0.0.3). -/
def rightAnodyneExtensions : MorphismProperty SSet.{u} := rightFibrations.llp

/-- Local copy of Tau Ceti `SSet.CoreEnriched`
(`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): simplicial sets with the cores
`Fun(A, B)^≃` as mapping simplicial sets. -/
structure CoreEnriched : Type (u + 1) where
  of ::
  /-- The underlying simplicial set. -/
  toSSet : SSet.{u}

/-- Local copy of the category structure of Tau Ceti `SSet.CoreEnriched` (`…/CatInfty.lean`). -/
instance : Category CoreEnriched.{u} :=
  inferInstanceAs (Category (InducedCategory SSet CoreEnriched.toSSet))

/-- Local copy of the simplicial structure of Tau Ceti `SSet.CoreEnriched` (`…/CatInfty.lean`). -/
instance : SimplicialCategory CoreEnriched.{u} := sorry

/-- Local copy of Tau Ceti `SSet.CatInftyΔ` (`…/CatInfty.lean`): HTT's `Cat_∞^Δ`. -/
abbrev CatInftyΔ : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun A : CoreEnriched.{u} ↦ Quasicategory A.toSSet

/-- Local copy of Tau Ceti `SSet.catInfty` (`…/CatInfty.lean`), as defined there: HTT's `Cat∞`, the
simplicial nerve of `CatInftyΔ`. -/
abbrev catInfty : SSet.{u + 1} := SimplicialNerve CatInftyΔ.{u}

end SSet

namespace TauCeti.MarkedSSet

/-- Local copy of Tau Ceti `TauCeti.MarkedSSet.markedAnodyneGenerators` (`…/Marked/Anodyne.lean`);
README L4.2 *Marked anodyne maps* (HTT Definition 3.1.1.1). -/
def markedAnodyneGenerators : MorphismProperty _root_.TauCeti.MarkedSSet.{u} := sorry

/-- Local copy of Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions` (`…/Marked/Anodyne.lean`),
kept as written (README *Redefinitions*, HTT 3.1.1.1). -/
def markedAnodyneExtensions : MorphismProperty _root_.TauCeti.MarkedSSet.{u} := markedAnodyneGenerators.rlp.llp

end TauCeti.MarkedSSet

/-- Local copy of Tau Ceti `CategoryTheory.EnrichedCat.bicategory.strict`
(`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`). -/
instance EnrichedCat.bicategory.strict (V : Type v) [Category.{w} V] [MonoidalCategory V] :
    Bicategory.Strict (EnrichedCat.{w, v, u} V) := sorry

/-- Local copy of Tau Ceti `CategoryTheory.EnrichedCat.category`
(`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`): `Cat_S`, with `V`-functors as morphisms
(README F3). -/
instance EnrichedCat.category (V : Type v) [Category.{w} V] [MonoidalCategory V] :
    Category (EnrichedCat.{w, v, u} V) :=
  StrictBicategory.category (EnrichedCat.{w, v, u} V)

open _root_.TauCeti

/-! ### F1.1 Weakly saturated classes -/

namespace MorphismProperty

variable {C : Type u} [Category.{v} C]

/-- Weakly saturated classes, README F1.1 *Weakly saturated classes*
(`MorphismProperty.IsWeaklySaturated`; HTT Definition A.1.2.2): stable under cobase change,
transfinite composition and retracts. No colimit hypothesis. -/
class IsWeaklySaturated (W : CategoryTheory.MorphismProperty C) : Prop extends
    W.IsStableUnderCobaseChange, W.IsStableUnderTransfiniteComposition.{w},
    W.IsStableUnderRetracts

/-- The weakly saturated class generated by `W`, README F1.1 (`MorphismProperty.weakSaturation`;
HTT A.1.2.2, A.1.2.4): the infimum of the weakly saturated classes containing `W`. -/
def weakSaturation (W : CategoryTheory.MorphismProperty C) : CategoryTheory.MorphismProperty C :=
  sInf {W' | W ≤ W' ∧ IsWeaklySaturated.{w} W'}

/-! ### F1.3 Trees of pushouts -/

/-- The restriction of `Y : A ⥤ D` to `Set.Iio a` (helper for README F1.3 *S-trees*). -/
abbrev restrictIio {A : Type w} [PartialOrder A] {D : Type u₁} [Category.{v₁} D] (Y : A ⥤ D)
    (a : A) : Set.Iio a ⥤ D :=
  (Subtype.mono_coe (· ∈ Set.Iio a)).functor ⋙ Y

/-- The map `colim_{b < a} Y_b ⟶ Y_a` (helper for README F1.3 *S-trees*, HTT A.1.5.1). -/
def restrictIioDesc {A : Type w} [PartialOrder A] {D : Type u₁} [Category.{v₁} D] (Y : A ⥤ D)
    (a : A) [HasColimit (restrictIio Y a)] : colimit (restrictIio Y a) ⟶ Y.obj a :=
  colimit.desc (restrictIio Y a)
    ⟨Y.obj a, { app b := Y.map (homOfLE (le_of_lt b.2)), naturality := sorry }⟩

/-- S-trees with root `X`, README F1.3 *S-trees* (`MorphismProperty.Tree`; HTT Definition A.1.5.1):
a well-founded poset `A`, `Y : A ⥤ Under X`, and for each `a` a member `f a` of `S` with a pushout
square in `C` whose left map is `f a` and whose right map is `colim_{b < a} Y_b ⟶ Y_a`; colimits
in `Under X`. -/
structure Tree [HasColimitsOfSize.{w, w} C] (S : CategoryTheory.MorphismProperty C) (X : C) where
  A : Type w
  [partialOrder : PartialOrder A]
  [wellFoundedLT : WellFoundedLT A]
  Y : A ⥤ Under X
  src : A → C
  tgt : A → C
  f (a : A) : src a ⟶ tgt a
  mem (a : A) : S (f a)
  top (a : A) : src a ⟶ (colimit (restrictIio Y a)).right
  bot (a : A) : tgt a ⟶ (Y.obj a).right
  isPushout (a : A) : IsPushout (top a) (f a) ((Under.forget X).map (restrictIioDesc Y a)) (bot a)

namespace Tree

variable [HasColimitsOfSize.{w, w} C] {S : CategoryTheory.MorphismProperty C} {X : C}

attribute [instance] Tree.partialOrder Tree.wellFoundedLT

/-- Good trees, README F1.3 (`Tree.IsGood κ`; HTT A.1.5.1): κ-presentable sources and targets,
and fewer than κ predecessors of each index. -/
def IsGood (T : Tree.{w} S X) (κ : Cardinal.{w}) [Fact κ.IsRegular] : Prop :=
  ∀ a : T.A, IsCardinalPresentable (T.src a) κ ∧ IsCardinalPresentable (T.tgt a) κ ∧
    HasCardinalLT (Set.Iio a) κ

/-- `Y_B`, the colimit in `Under X` over a downward-closed subset, README F1.3 *Colimits over
downward-closed subsets* (`Tree.objOfLowerSet`; HTT Notation A.1.5.2). -/
def objOfLowerSet (T : Tree.{w} S X) (B : LowerSet T.A) : Under X :=
  colimit ((Subtype.mono_coe (· ∈ (B : Set T.A))).functor ⋙ T.Y)

/-- `Y_∅ ≅ X`, README F1.3 (HTT Notation A.1.5.2). -/
def objOfLowerSetBotIso (T : Tree.{w} S X) : T.objOfLowerSet ⊥ ≅ Under.mk (𝟙 X) := sorry

/-- `Y_{≤β} ≅ Y_β`, README F1.3 (HTT Notation A.1.5.2). -/
def objOfLowerSetIicIso (T : Tree.{w} S X) (b : T.A) :
    T.objOfLowerSet (LowerSet.Iic b) ≅ T.Y.obj b := sorry

end Tree

/-! ### F1.6 Accessible subcategories, perfect classes -/

/-- Perfect classes of weak equivalences, README F1.6 (`MorphismProperty.IsPerfect`; HTT Definition
A.2.6.12): containing the isomorphisms, two-out-of-three, stable under filtered colimits, and
generated under filtered colimits in `Arrow C` by a small subset of `W`. -/
class IsPerfect (W : CategoryTheory.MorphismProperty C) : Prop where
  isomorphisms_le : CategoryTheory.MorphismProperty.isomorphisms C ≤ W
  hasTwoOutOfThreeProperty : W.HasTwoOutOfThreeProperty
  isStableUnderFilteredColimits : W.IsStableUnderFilteredColimits.{w, w}
  exists_generators : ∃ P : ObjectProperty (Arrow C), ObjectProperty.Small.{w} P ∧
    (∀ f, P f → W f.hom) ∧ ∀ f : Arrow C, W f.hom →
      ∃ (J : Type w) (_ : SmallCategory J) (_ : IsFiltered J), P.colimitsOfShape J f

end MorphismProperty

namespace ObjectProperty

variable {C : Type u} [Category.{v} C]

/-- κ-accessible subcategories, README F1.6 *Accessible subcategories*
(`ObjectProperty.IsCardinalAccessibleSubcategory`; HTT Definition A.2.6.2). -/
def IsCardinalAccessibleSubcategory (P : CategoryTheory.ObjectProperty C) (κ : Cardinal.{w})
    [Fact κ.IsRegular] : Prop :=
  (∀ (J : Type w) [SmallCategory J] [IsCardinalFiltered J κ], P.IsClosedUnderColimitsOfShape J) ∧
    ∃ Q ≤ P, CategoryTheory.ObjectProperty.Small.{w} Q ∧ ∀ X, P X →
      ∃ (J : Type w) (_ : SmallCategory J) (_ : IsCardinalFiltered J κ), Q.colimitsOfShape J X

/-- Accessible subcategories, README F1.6 (`ObjectProperty.IsAccessibleSubcategory`; HTT A.2.6.2). -/
def IsAccessibleSubcategory (P : CategoryTheory.ObjectProperty C) : Prop :=
  ∃ (κ : Cardinal.{w}) (_ : Fact κ.IsRegular), IsCardinalAccessibleSubcategory P κ

end ObjectProperty

namespace Cardinal

/-- `κ ≪ τ`, README F1.6 *Sharply larger cardinals* (`Cardinal.PowLT`; HTT Definition A.2.6.3):
`τ' ^ κ' < τ` for all `τ' < τ` and `κ' < κ`. No regularity hypothesis. -/
def PowLT (κ τ : Cardinal.{u}) : Prop := ∀ τ' < τ, ∀ κ' < κ, τ' ^ κ' < τ

end Cardinal

/-- Discrete opfibrations, README F1.7 *Restriction along a discrete opfibration*
(`Functor.IsDiscreteOpfibration`, propose; HTT Lemma A.2.8.10): every `η : g c ⟶ d` has a unique lift
`c ⟶ c'` with `g c' = d`. -/
def Functor.IsDiscreteOpfibration {C : Type u} [Category.{v} C] {D : Type u₁}
    [Category.{v₁} D] (g : C ⥤ D) : Prop :=
  ∀ (c : C) {d : D} (η : g.obj c ⟶ d),
    ∃! x : Σ c' : C, c ⟶ c', ∃ h : g.obj x.1 = d, g.map x.2 ≫ eqToHom h = η

/-! ### F1.5–F1.8 Model categories: properness, homotopy pushouts, Quillen adjunctions,
combinatorial model categories, diagram classes, Reedy categories -/

namespace HomotopicalAlgebra

/-- Left proper model categories, README F1.5 (`HomotopicalAlgebra.IsLeftProper`; HTT Definition
A.2.4.1): pushouts of weak equivalences along cofibrations are weak equivalences. -/
class IsLeftProper (C : Type u) [Category.{v} C] [ModelCategory C] : Prop where
  weakEquivalence_of_isPushout {A B A' B' : C} {i : A ⟶ B} {j : A ⟶ A'} {j' : B ⟶ B'}
    {i' : A' ⟶ B'} : IsPushout i j j' i' → ∀ [Cofibration i] [WeakEquivalence j], WeakEquivalence j'

/-- Right proper model categories, README F1.5 (`HomotopicalAlgebra.IsRightProper`; HTT A.2.4.1):
pullbacks of weak equivalences along fibrations are weak equivalences. -/
class IsRightProper (C : Type u) [Category.{v} C] [ModelCategory C] : Prop where
  weakEquivalence_of_isPullback {P X Y Z : C} {fst : P ⟶ X} {snd : P ⟶ Y} {f : X ⟶ Z}
    {g : Y ⟶ Z} : IsPullback fst snd f g → ∀ [Fibration g] [WeakEquivalence f], WeakEquivalence snd

section

variable {C : Type u} [Category.{v} C] [ModelCategory C]

/-- Homotopy pushout squares, README F1.5 (`HTT.A.2.4.3/after`, `HomotopicalAlgebra.IsHomotopyPushout`):
some cofibrant resolution `Y' ⟵ Z' ⟶ X'` of the span `(l, t)` (Z' cofibrant, both legs
cofibrations, weak equivalences to the span) has pushout mapping to the corner by a weak
equivalence. -/
def IsHomotopyPushout {Z X Y P : C} {t : Z ⟶ X} {l : Z ⟶ Y} {r : X ⟶ P} {b : Y ⟶ P}
    (_sq : CommSq t l r b) : Prop :=
  ∃ (Z' X' Y' : C) (t' : Z' ⟶ X') (l' : Z' ⟶ Y') (z : Z' ⟶ Z) (x : X' ⟶ X) (y : Y' ⟶ Y),
    IsCofibrant Z' ∧ Cofibration t' ∧ Cofibration l' ∧ WeakEquivalence z ∧ WeakEquivalence x ∧
      WeakEquivalence y ∧ t' ≫ x = z ≫ t ∧ l' ≫ y = z ≫ l ∧
      ∃ h : t' ≫ x ≫ r = l' ≫ y ≫ b, WeakEquivalence (pushout.desc (x ≫ r) (y ≫ b) h)

/-- Homotopy pullback squares, the dual of `IsHomotopyPushout` (README F1.5, `HTT.A.2.4.3/after`):
a fibrant resolution of the cospan `(r, b)` whose pullback receives the corner by a weak
equivalence. -/
def IsHomotopyPullback {Z X Y P : C} {t : Z ⟶ X} {l : Z ⟶ Y} {r : X ⟶ P} {b : Y ⟶ P}
    (_sq : CommSq t l r b) : Prop :=
  ∃ (P' X' Y' : C) (r' : X' ⟶ P') (b' : Y' ⟶ P') (p : P ⟶ P') (x : X ⟶ X') (y : Y ⟶ Y'),
    IsFibrant P' ∧ Fibration r' ∧ Fibration b' ∧ WeakEquivalence p ∧ WeakEquivalence x ∧
      WeakEquivalence y ∧ x ≫ r' = r ≫ p ∧ y ≫ b' = b ≫ p ∧
      ∃ h : (t ≫ x) ≫ r' = (l ≫ y) ≫ b', WeakEquivalence (pullback.lift (t ≫ x) (l ≫ y) h)

end

/-- Quillen adjunctions, README F1.5 (`HTT.A.2.5/quillen-adjunctions`, `Adjunction.IsQuillen`):
the left adjoint preserves cofibrations and trivial cofibrations. -/
def Adjunction.IsQuillen {C : Type u} [Category.{v} C] [ModelCategory C] {D : Type u₁}
    [Category.{v₁} D] [ModelCategory D] {F : C ⥤ D} {G : D ⥤ C} (_adj : F ⊣ G) : Prop :=
  cofibrations C ≤ (cofibrations D).inverseImage F ∧
    trivialCofibrations C ≤ (trivialCofibrations D).inverseImage F

/-- Combinatorial model categories, README F1.6 (`HomotopicalAlgebra.IsCombinatorial`; HTT
Definition A.2.6.1): locally presentable, with cofibrations and trivial cofibrations generated
as weakly saturated classes by small sets. -/
class IsCombinatorial (C : Type u) [Category.{v} C] [ModelCategory C] : Prop where
  isLocallyPresentable : IsLocallyPresentable.{w} C
  exists_cofibrations : ∃ I : CategoryTheory.MorphismProperty C, I.IsSmall.{w} ∧
    cofibrations C = MorphismProperty.weakSaturation.{w} I
  exists_trivialCofibrations : ∃ J : CategoryTheory.MorphismProperty C, J.IsSmall.{w} ∧
    trivialCofibrations C = MorphismProperty.weakSaturation.{w} J

namespace ModelCategory

variable {A : Type u} [Category.{v} A]

/-- The type synonym of `A` carrying prescribed cofibrations `C`, weak equivalences `W` and
fibrations `(C ⊓ W).rlp`, README F1.6 *Smith's recognition theorem*
(`HomotopicalAlgebra.ModelCategory.WithClasses`, propose; HTT Proposition A.2.6.10; Conventions
*Model structures on one category*). -/
def WithClasses (_C _W : CategoryTheory.MorphismProperty A) : Type u := A

instance (C W : CategoryTheory.MorphismProperty A) : Category.{v} (WithClasses C W) :=
  inferInstanceAs (Category A)

/-- The bridge `A ≌ WithClasses C W` (identities), README F1.6 (`WithClasses.equivalence`). -/
def WithClasses.equivalence (C W : CategoryTheory.MorphismProperty A) : A ≌ WithClasses C W :=
  CategoryTheory.Equivalence.refl

instance (C W : CategoryTheory.MorphismProperty A) : CategoryWithCofibrations (WithClasses C W) :=
  ⟨C⟩

instance (C W : CategoryTheory.MorphismProperty A) :
    CategoryWithWeakEquivalences (WithClasses C W) := ⟨W⟩

instance (C W : CategoryTheory.MorphismProperty A) : CategoryWithFibrations (WithClasses C W) :=
  ⟨(C ⊓ W).rlp⟩

/-- Transport lemma, README F1.6 (`WithClasses.cofibrations_eq`): the cofibrations are `C`. -/
theorem WithClasses.cofibrations_eq (C W : CategoryTheory.MorphismProperty A) :
    (cofibrations (WithClasses C W)).inverseImage (WithClasses.equivalence C W).functor = C := rfl

/-- Transport lemma, README F1.6 (`WithClasses.weakEquivalences_eq`): the weak equivalences are
`W`. -/
theorem WithClasses.weakEquivalences_eq (C W : CategoryTheory.MorphismProperty A) :
    (weakEquivalences (WithClasses C W)).inverseImage (WithClasses.equivalence C W).functor = W :=
  rfl

/-- Transport lemma, README F1.6 (`WithClasses.fibrations_eq`): the fibrations are
`(C ⊓ W).rlp`. -/
theorem WithClasses.fibrations_eq (C W : CategoryTheory.MorphismProperty A) :
    (fibrations (WithClasses C W)).inverseImage (WithClasses.equivalence C W).functor =
      (C ⊓ W).rlp := rfl

/-- Smith's recognition theorem, README F1.6 (`HomotopicalAlgebra.ModelCategory.ofSmith`, propose;
HTT Proposition A.2.6.10): on a presentable category, a weakly saturated class `C` generated by a
small set, with `C ⊓ W` weakly saturated, `W` accessible (as a full subcategory of `Arrow A`) with
two-out-of-three, and `C.rlp ≤ W`, gives a model structure with cofibrations `C`, weak equivalences
`W` and fibrations `(C ⊓ W).rlp`. -/
@[instance_reducible]
def ofSmith [IsLocallyPresentable.{w} A] (C W : CategoryTheory.MorphismProperty A)
    [MorphismProperty.IsWeaklySaturated.{w} C]
    (hC : ∃ I : CategoryTheory.MorphismProperty A, I.IsSmall.{w} ∧
      C = MorphismProperty.weakSaturation.{w} I)
    [MorphismProperty.IsWeaklySaturated.{w} (C ⊓ W)]
    (hW : ObjectProperty.IsAccessibleSubcategory.{w} (fun f : Arrow A ↦ W f.hom))
    [W.HasTwoOutOfThreeProperty] (hrlp : C.rlp ≤ W) : ModelCategory (WithClasses C W) := sorry

/-- Smith's theorem in practice, README F1.6 (`HomotopicalAlgebra.ModelCategory.ofPerfect`, propose;
HTT Proposition A.2.6.15): for a perfect class `W` and a small set `C₀` such that weak equivalences
are stable under pushout along pushouts of members of `C₀` and `C₀.rlp ≤ W`, the model structure on
`WithClasses (weakSaturation C₀) W` (built from `ofSmith`). -/
@[instance_reducible]
def ofPerfect [IsLocallyPresentable.{w} A] (C₀ W : CategoryTheory.MorphismProperty A)
    (_hC₀ : C₀.IsSmall.{w}) [MorphismProperty.IsPerfect.{w} W]
    (_hpush : ∀ ⦃X Y X' Y' X'' Y'' : A⦄ (i : X ⟶ Y) (a : X ⟶ X') (i' : X' ⟶ Y') (b : Y ⟶ Y')
      (c : X' ⟶ X'') (i'' : X'' ⟶ Y'') (d : Y' ⟶ Y''), C₀ i → IsPushout a i i' b →
      IsPushout c i' i'' d → W c → W d)
    (_hrlp : C₀.rlp ≤ W) :
    ModelCategory (WithClasses (MorphismProperty.weakSaturation.{w} C₀) W) := sorry

/-- The transferred model structure, README F1.6 *The transfer theorem*
(`HomotopicalAlgebra.ModelCategory.Transferred`, propose; `HTT.A.2.6/transfer/structure`, not an
HTT statement): the type synonym of `B` for an adjunction `F ⊣ G` from a model category `A`. -/
def Transferred {A : Type u} [Category.{v} A] {B : Type u₁} [Category.{v₁} B] {F : A ⥤ B}
    {G : B ⥤ A} (_adj : F ⊣ G) : Type u₁ := B

namespace Transferred

variable {A : Type u} [Category.{v} A] {B : Type u₁} [Category.{v₁} B] {F : A ⥤ B} {G : B ⥤ A}
  (adj : F ⊣ G)

instance : Category.{v₁} (Transferred adj) := inferInstanceAs (Category B)

/-- The bridge `B ≌ Transferred adj` (identities), README F1.6 (`Transferred.equivalence`). -/
def equivalence : B ≌ Transferred adj := CategoryTheory.Equivalence.refl

variable [ModelCategory A]

/-- The weak equivalences created by `G` (README F1.6). -/
instance : CategoryWithWeakEquivalences (Transferred adj) :=
  ⟨(weakEquivalences A).inverseImage G⟩

/-- The fibrations created by `G` (README F1.6). -/
instance : CategoryWithFibrations (Transferred adj) := ⟨(fibrations A).inverseImage G⟩

/-- The cofibrations: the left lifting class of the trivial fibrations created by `G`
(README F1.6). -/
instance : CategoryWithCofibrations (Transferred adj) :=
  ⟨((weakEquivalences A).inverseImage G ⊓ (fibrations A).inverseImage G).llp⟩

/-- The transferred model structure, README F1.6 (`HTT.A.2.6/transfer/structure`): `A`
combinatorial, `B` presentable, `G` preserving κ-filtered colimits for some regular κ, and `G`
carrying relative `F(J)`-cell complexes (the weakly saturated class generated by the image under `F`
of a chosen small generating set `J` of the trivial cofibrations of `A`) to weak equivalences. The
two hypotheses that are not classes are `Fact`s, so that this is an instance. -/
instance modelCategory [IsCombinatorial.{w} A] [IsLocallyPresentable.{w} B]
    [Fact (∃ (κ : Cardinal.{w}) (_ : Fact κ.IsRegular), ∀ (J : Type w) [SmallCategory J]
      [IsCardinalFiltered J κ], PreservesColimitsOfShape J G)]
    [Fact (MorphismProperty.weakSaturation.{w}
      ((Classical.choose (IsCombinatorial.exists_trivialCofibrations.{w} (C := A))).map F) ≤
        (weakEquivalences A).inverseImage G)] : ModelCategory (Transferred adj) := sorry

/-- Transport lemma, README F1.6 (`Transferred.weakEquivalences_eq`):
`(weakEquivalences A).inverseImage G`. -/
theorem weakEquivalences_eq :
    (weakEquivalences (Transferred adj)).inverseImage (equivalence adj).functor =
      (weakEquivalences A).inverseImage G := rfl

/-- Transport lemma, README F1.6 (`Transferred.fibrations_eq`): `(fibrations A).inverseImage G`. -/
theorem fibrations_eq :
    (fibrations (Transferred adj)).inverseImage (equivalence adj).functor =
      (fibrations A).inverseImage G := rfl

/-- Transport lemma, README F1.6 (`Transferred.cofibrations_eq`): the left lifting class of the
intersection of the two created classes. -/
theorem cofibrations_eq :
    (cofibrations (Transferred adj)).inverseImage (equivalence adj).functor =
      ((weakEquivalences A).inverseImage G ⊓ (fibrations A).inverseImage G).llp := rfl

end Transferred

end ModelCategory

section Diagrams

variable (J : Type u₁) [Category.{v₁} J] (A : Type u) [Category.{v} A] [ModelCategory A]

/-- Injective cofibrations, README F1.7 *Injective and projective classes* (HTT Definition A.2.8.1):
levelwise cofibrations. -/
def injectiveCofibrations : CategoryTheory.MorphismProperty (J ⥤ A) :=
  (cofibrations A).functorCategory J

/-- Projective fibrations, README F1.7 (HTT A.2.8.1): levelwise fibrations. -/
def projectiveFibrations : CategoryTheory.MorphismProperty (J ⥤ A) :=
  (fibrations A).functorCategory J

/-- Levelwise weak equivalences, README F1.7 (HTT A.2.8.1). -/
def levelwiseWeakEquivalences : CategoryTheory.MorphismProperty (J ⥤ A) :=
  (weakEquivalences A).functorCategory J

/-- Injective fibrations, README F1.7 (HTT A.2.8.1). -/
def injectiveFibrations : CategoryTheory.MorphismProperty (J ⥤ A) :=
  (injectiveCofibrations J A ⊓ levelwiseWeakEquivalences J A).rlp

/-- Projective cofibrations, README F1.7 (HTT A.2.8.1). -/
def projectiveCofibrations : CategoryTheory.MorphismProperty (J ⥤ A) :=
  (projectiveFibrations J A ⊓ levelwiseWeakEquivalences J A).llp

end Diagrams

namespace ReedyStructure

variable {J : Type w} [SmallCategory J] {W₁ W₂ : CategoryTheory.MorphismProperty J}
  [W₁.IsMultiplicative] [W₂.IsMultiplicative] {α : Type u₁} [LinearOrder α] [OrderBot α]
  [SuccOrder α] [WellFoundedLT α] (r : HomotopicalAlgebra.ReedyStructure W₁ W₂ α)
  {C : Type u} [Category.{v} C]

/-- The objects of degree `< deg j` (helper for README F1.8 *Latching and matching objects*). -/
abbrev below (j : J) : CategoryTheory.ObjectProperty J := fun j' ↦ r.deg j' < r.deg j

/-- The latching category of `j`: the non-identity `W₂`-maps (Lurie's `J^R`) into `j`, README F1.8
(HTT Notation A.2.9.7). -/
abbrev latchingIndex (j : J) : CategoryTheory.ObjectProperty (Over j) :=
  fun f ↦ W₂ f.hom ∧ ¬ CategoryTheory.MorphismProperty.identities J f.hom

/-- The matching category of `j`: the non-identity `W₁`-maps (Lurie's `J^L`) out of `j`, README
F1.8 (HTT Notation A.2.9.7). -/
abbrev matchingIndex (j : J) : CategoryTheory.ObjectProperty (Under j) :=
  fun f ↦ W₁ f.hom ∧ ¬ CategoryTheory.MorphismProperty.identities J f.hom

/-- The latching diagram, landing in the objects of degree `< deg j` (README F1.8). -/
def latchingDiagram (j : J) : (latchingIndex (W₂ := W₂) j).FullSubcategory ⥤ (below r j).FullSubcategory :=
  ObjectProperty.lift _ (ObjectProperty.ι _ ⋙ Over.forget j) sorry

/-- The matching diagram, landing in the objects of degree `< deg j` (README F1.8). -/
def matchingDiagram (j : J) : (matchingIndex (W₁ := W₁) j).FullSubcategory ⥤ (below r j).FullSubcategory :=
  ObjectProperty.lift _ (ObjectProperty.ι _ ⋙ Under.forget j) sorry

variable [HasColimitsOfSize.{w, w} C] [HasLimitsOfSize.{w, w} C]

/-- The latching object `L_j X`, README F1.8 (`ReedyStructure.latchingObject`; HTT Notation
A.2.9.7), for `X` defined on the objects of degree `< deg j`. -/
def latchingObject (j : J) (X : (below r j).FullSubcategory ⥤ C) : C :=
  colimit (latchingDiagram r j ⋙ X)

/-- The latching map `L_j X ⟶ X j`, README F1.8 (`ReedyStructure.latchingMap`; HTT A.2.9.7). -/
def latchingMap (X : J ⥤ C) (j : J) : latchingObject r j (ObjectProperty.ι _ ⋙ X) ⟶ X.obj j :=
  colimit.desc (latchingDiagram r j ⋙ ObjectProperty.ι _ ⋙ X)
    ⟨X.obj j, { app f := X.map f.obj.hom, naturality := sorry }⟩

/-- The matching object `M_j X`, README F1.8 (`ReedyStructure.matchingObject`; HTT A.2.9.7). -/
def matchingObject (j : J) (X : (below r j).FullSubcategory ⥤ C) : C :=
  limit (matchingDiagram r j ⋙ X)

/-- The matching map `X j ⟶ M_j X`, README F1.8 (`ReedyStructure.matchingMap`; HTT A.2.9.7). -/
def matchingMap (X : J ⥤ C) (j : J) : X.obj j ⟶ matchingObject r j (ObjectProperty.ι _ ⋙ X) :=
  limit.lift (matchingDiagram r j ⋙ ObjectProperty.ι _ ⋙ X)
    ⟨X.obj j, { app f := X.map f.obj.hom, naturality := sorry }⟩

/-- The relative latching map `X j ⊔_{L_j X} L_j Y ⟶ Y j` of `f : X ⟶ Y`, README F1.8 (HTT
A.2.9.7). -/
def relativeLatchingMap {X Y : J ⥤ C} (f : X ⟶ Y) (j : J) :
    pushout (latchingMap r X j) (colimMap (Functor.whiskerLeft (latchingDiagram r j)
      (Functor.whiskerLeft (ObjectProperty.ι _) f)) :
        latchingObject r j (ObjectProperty.ι _ ⋙ X) ⟶ latchingObject r j (ObjectProperty.ι _ ⋙ Y))
      ⟶ Y.obj j :=
  pushout.desc (f.app j) (latchingMap r Y j) sorry

/-- The relative matching map `X j ⟶ Y j ×_{M_j Y} M_j X` of `f : X ⟶ Y`, README F1.8 (HTT
A.2.9.7). -/
def relativeMatchingMap {X Y : J ⥤ C} (f : X ⟶ Y) (j : J) :
    X.obj j ⟶ pullback (matchingMap r Y j) (limMap (Functor.whiskerLeft (matchingDiagram r j)
      (Functor.whiskerLeft (ObjectProperty.ι _) f)) :
        matchingObject r j (ObjectProperty.ι _ ⋙ X) ⟶ matchingObject r j (ObjectProperty.ι _ ⋙ Y)) :=
  pullback.lift (f.app j) (matchingMap r X j) sorry

/-- `X ≺ Y`: distinct, with a `W₂`-map `X ⟶ Y` or a `W₁`-map `Y ⟶ X`; README F1.8
(`ReedyStructure.Prec`, HTT Notation A.2.9.11). -/
def Prec (X Y : J) : Prop := X ≠ Y ∧ ((∃ f : X ⟶ Y, W₂ f) ∨ ∃ f : Y ⟶ X, W₁ f)

/-- Good filtrations, README F1.8 (`ReedyStructure.GoodFiltration`; HTT Notation A.2.9.11): a
well-ordered enumeration of `J` in which every object comes after its predecessors for `Prec`. -/
structure GoodFiltration where
  ι : Type w
  [linearOrder : LinearOrder ι]
  [wellFoundedLT : WellFoundedLT ι]
  e : ι ≃ J
  lt_of_transGen (i i' : ι) : Relation.TransGen (Prec (W₁ := W₁) (W₂ := W₂) (J := J)) (e i) (e i') →
    i < i'

end ReedyStructure

section Reedy

variable {J : Type w} [SmallCategory J] {W₁ W₂ : CategoryTheory.MorphismProperty J}
  [W₁.IsMultiplicative] [W₂.IsMultiplicative] {α : Type u₁} [LinearOrder α] [OrderBot α]
  [SuccOrder α] [WellFoundedLT α] (r : HomotopicalAlgebra.ReedyStructure W₁ W₂ α)
  (A : Type u) [Category.{v} A] [ModelCategory A] [HasColimitsOfSize.{w, w} A]
  [HasLimitsOfSize.{w, w} A]

/-- Reedy cofibrations (C), README F1.8 *Reedy classes* (`HTT.A.2.9.19/classes`; HTT A.2.9.19):
every relative latching map is a cofibration. Helper for `HomotopicalAlgebra.Reedy`. -/
def reedyCofibrations : CategoryTheory.MorphismProperty (J ⥤ A) := fun _ _ f ↦
  ∀ j, cofibrations A (ReedyStructure.relativeLatchingMap r f j)

/-- Reedy fibrations (F), README F1.8 *Reedy classes* (HTT A.2.9.19): every relative matching map
is a fibration. Helper for `HomotopicalAlgebra.Reedy`. -/
def reedyFibrations : CategoryTheory.MorphismProperty (J ⥤ A) := fun _ _ f ↦
  ∀ j, fibrations A (ReedyStructure.relativeMatchingMap r f j)

/-- `J ⥤ A` with the Reedy model structure, README F1.8 *The Reedy model structure*
(`HomotopicalAlgebra.Reedy`, propose; HTT Proposition A.2.9.19; Conventions *Model structures on
one category*). -/
def Reedy (_r : HomotopicalAlgebra.ReedyStructure W₁ W₂ α) (A : Type u) [Category.{v} A] : Type _ :=
  J ⥤ A

instance (A : Type u) [Category.{v} A] : Category (Reedy r A) := inferInstanceAs (Category (J ⥤ A))

/-- The bridge `(J ⥤ A) ≌ Reedy r A` (identities), README F1.8 (`Reedy.equivalence`). -/
def Reedy.equivalence (A : Type u) [Category.{v} A] : (J ⥤ A) ≌ Reedy r A :=
  CategoryTheory.Equivalence.refl

/-- The Reedy model structure, README F1.8 (HTT A.2.9.19): cofibrations (C), fibrations (F), and
the levelwise weak equivalences (W). -/
instance Reedy.modelCategory : ModelCategory (Reedy r A) where
  categoryWithCofibrations := ⟨reedyCofibrations r A⟩
  categoryWithWeakEquivalences := ⟨levelwiseWeakEquivalences J A⟩
  categoryWithFibrations := ⟨reedyFibrations r A⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- Transport lemma, README F1.8 (`Reedy.cofibrations_eq`): condition (C). -/
theorem Reedy.cofibrations_eq :
    (cofibrations (Reedy r A)).inverseImage (Reedy.equivalence r A).functor =
      reedyCofibrations r A := rfl

/-- Transport lemma, README F1.8 (`Reedy.fibrations_eq`): condition (F). -/
theorem Reedy.fibrations_eq :
    (fibrations (Reedy r A)).inverseImage (Reedy.equivalence r A).functor =
      reedyFibrations r A := rfl

/-- Transport lemma, README F1.8 (`Reedy.weakEquivalences_eq`): condition (W). -/
theorem Reedy.weakEquivalences_eq :
    (weakEquivalences (Reedy r A)).inverseImage (Reedy.equivalence r A).functor =
      levelwiseWeakEquivalences J A := rfl

end Reedy

end HomotopicalAlgebra

/-! ### F2.5 Truncated Kan complexes (also HTT 2.3.4.15, L3.4) -/

namespace SSet

open _root_.SSet

/-- Truncated Kan complexes, README F2.5 *Postnikov towers* (`HTT.A.2.7/postnikov`) and L3.4
*Truncated Kan complexes* (`SSet.KanComplex.IsTruncated`; HTT Definition 2.3.4.15), for `−2 ≤ k`:
for `k ≥ −1`, every `π i X x` with `k < i` is trivial (`i = 0` included); for `k = −2`, weakly
contractible. Values `k < −2` are not meant. -/
def KanComplex.IsTruncated (k : ℤ) (X : SSet.{u}) [KanComplex X] : Prop :=
  if k = -2 then IsWeaklyContractible X
  else ∀ (x : X _⦋0⦌) (i : ℕ), k < i → Subsingleton (SSet.KanComplex.π i X x)

/-- Moore's Postnikov section `τ_{≤n} X` of a Kan complex, README F2.5 *Postnikov sections*
(`SSet.postnikovSection`; `HTT.A.2.7/postnikov/section`): the m-simplices of X modulo agreement of
their n-skeleta. -/
def postnikovSection (n : ℕ) (X : SSet.{u}) [KanComplex X] : SSet.{u} := sorry

/-- The quotient map `X ⟶ τ_{≤n} X` (README F2.5 *Postnikov sections*). -/
def postnikovSection.π (n : ℕ) (X : SSet.{u}) [KanComplex X] : X ⟶ postnikovSection n X := sorry

/-- The Kan–Quillen model structure, the target `HTT.A.2.7/model-structure` (F2.4; README F2):
cofibrations the monomorphisms, fibrations `J.rlp`, weak equivalences those of F2.4. -/
scoped instance modelCategoryQuillen : ModelCategory SSet.{u} where
  categoryWithCofibrations := _root_.SSet.modelCategoryQuillen.instCategoryWithCofibrations
  categoryWithFibrations := _root_.SSet.modelCategoryQuillen.instCategoryWithFibrations
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

end SSet

open scoped TauCetiRoadmap.HigherToposTheory.SSet

/-- Isofibrations ("quasi-fibrations") of categories, README F3.4 (`Functor.IsIsofibration`; HTT
Definition A.3.2.7). -/
class Functor.IsIsofibration {C : Type u} [Category.{v} C] {D : Type u₁} [Category.{v₁} D]
    (F : C ⥤ D) : Prop where
  lift (X : C) {Y : D} (e : F.obj X ≅ Y) :
    ∃ (Y' : C) (e' : X ≅ Y') (h : F.obj Y' = Y), F.mapIso e' ≪≫ eqToIso h = e

/-! ### F1.2, F3.1–F3.3 Tensors, Quillen bifunctors, monoidal and enriched model categories -/

namespace EnrichedCategory

variable (V : Type u₁) [Category.{v₁} V] [MonoidalCategory V] (D : Type u) [EnrichedCategory V D]

/-- Tensored enriched categories, README F1.2 *Tensors and cotensors*
(`EnrichedCategory.HasTensors`; HTT Example A.1.4.5 and the definitions before it). -/
def HasTensors [MonoidalClosed V] : Prop :=
  ∀ (v : V) (X : D), ∃ (T : D) (η : v ⟶ (X ⟶[V] T)), ∀ Y : D,
    IsIso (MonoidalClosed.curry (η ▷ (T ⟶[V] Y) ≫ eComp V X T Y))

/-- Cotensored enriched categories, README F1.2 (`EnrichedCategory.HasCotensors`; HTT A.1.4.5),
with right adjoints to every `tensorRight v`. -/
def HasCotensors [∀ v : V, (tensorRight v).IsLeftAdjoint] : Prop :=
  ∀ (v : V) (X : D), ∃ (P : D) (ε : v ⟶ (P ⟶[V] X)), ∀ Y : D,
    IsIso ((Adjunction.ofIsLeftAdjoint (tensorRight v)).homEquiv _ _
      ((Y ⟶[V] P) ◁ ε ≫ eComp V Y P X))

end EnrichedCategory

/-- Right-closedness gives right adjoints to every `tensorRight v` (helper for `HasCotensors`). -/
instance isLeftAdjoint_tensorRight {V : Type u₁} [Category.{v₁} V] [MonoidalCategory V]
    [MonoidalClosed Vᴹᵒᵖ] (v : V) : (tensorRight v).IsLeftAdjoint := sorry

namespace HomotopicalAlgebra

/-- Left Quillen bifunctors, README F3.3 (`HomotopicalAlgebra.IsLeftQuillenBifunctor`; HTT
Definition A.3.1.1). -/
class IsLeftQuillenBifunctor {A : Type u} [Category.{v} A] [ModelCategory A] {B : Type u₁}
    [Category.{v₁} B] [ModelCategory B] {C : Type u₂} [Category.{v₂} C] [ModelCategory C]
    (F : A ⥤ B ⥤ C) : Prop where
  preservesColimits_obj (X : A) : PreservesColimits (F.obj X)
  preservesColimits_flip_obj (Y : B) : PreservesColimits (F.flip.obj Y)
  cofibration_ι {X₁ Y₁ : A} {X₂ Y₂ : B} (i : X₁ ⟶ Y₁) (j : X₂ ⟶ Y₂) [Cofibration i]
    [Cofibration j] (sq : F.PushoutObjObj i j) : Cofibration sq.ι
  weakEquivalence_ι_left {X₁ Y₁ : A} {X₂ Y₂ : B} (i : X₁ ⟶ Y₁) (j : X₂ ⟶ Y₂) [Cofibration i]
    [Cofibration j] [WeakEquivalence i] (sq : F.PushoutObjObj i j) : WeakEquivalence sq.ι
  weakEquivalence_ι_right {X₁ Y₁ : A} {X₂ Y₂ : B} (i : X₁ ⟶ Y₁) (j : X₂ ⟶ Y₂) [Cofibration i]
    [Cofibration j] [WeakEquivalence j] (sq : F.PushoutObjObj i j) : WeakEquivalence sq.ι

/-- Monoidal model categories, README F3.3 (`HomotopicalAlgebra.MonoidalModelCategory`; HTT
Definition A.3.1.2). -/
class MonoidalModelCategory (S : Type u) [Category.{v} S] [MonoidalCategory S] [ModelCategory S]
    [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] : Prop where
  isLeftQuillenBifunctor : IsLeftQuillenBifunctor (MonoidalCategory.curriedTensor S)
  isCofibrant_unit : IsCofibrant (𝟙_ S)

/-- The tensor bifunctor `A ⥤ S ⥤ A` of a tensored S-enriched category, from chosen tensors,
README F3.3 (`EnrichedCategory.tensorBifunctor`; HTT Definition A.3.1.5). -/
def EnrichedCategory.tensorBifunctor (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S]
    [MonoidalClosed S] (A : Type u) [Category.{v} A] [EnrichedOrdinaryCategory S A]
    (_h : EnrichedCategory.HasTensors S A) : A ⥤ S ⥤ A := sorry

/-- Enriched model categories, README F3.3 (`HomotopicalAlgebra.EnrichedModelCategory`; HTT
Definition A.3.1.5): tensored and cotensored, with tensor a left Quillen bifunctor. -/
class EnrichedModelCategory (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S]
    [ModelCategory S] [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S]
    (A : Type u) [Category.{v} A] [EnrichedOrdinaryCategory S A] [ModelCategory A] : Prop where
  hasTensors : EnrichedCategory.HasTensors S A
  hasCotensors : EnrichedCategory.HasCotensors S A
  isLeftQuillenBifunctor : IsLeftQuillenBifunctor (EnrichedCategory.tensorBifunctor S A hasTensors)

/-- `SSet` is right closed (helper: `Δ^op`-presheaves are symmetric monoidal closed). -/
instance SSet.monoidalClosedMop : MonoidalClosed SSet.{u}ᴹᵒᵖ := sorry

/-- The Kan–Quillen structure is a monoidal model category, README F3.1 (`HTT.A.2.7/model-properties`,
HTT Example A.3.1.4). -/
instance SSet.monoidalModelCategory : MonoidalModelCategory SSet.{u} := sorry

/-- Simplicial model categories, README F3.3 (`HomotopicalAlgebra.SimplicialModelCategory`; HTT
Definition A.3.1.5), for the Kan–Quillen structure on `SSet`. -/
abbrev SimplicialModelCategory (A : Type u) [Category.{v} A] [EnrichedOrdinaryCategory SSet.{v} A]
    [ModelCategory A] : Prop :=
  EnrichedModelCategory SSet.{v} A

/-- The comparison `β_{X,K} : F(X) ⊗ K ⟶ F(X ⊗ K)` of a Quillen adjunction `F ⊣ G'` whose right
adjoint is the underlying functor of an S-enriched functor `G`, README F3.3 *Enriched Quillen
equivalences through the bifibrant objects*
(`HomotopicalAlgebra.EnrichedModelCategory.tensorComparison`, propose; HTT Remark A.3.1.8). -/
def EnrichedModelCategory.tensorComparison {S : Type u₁} [Category.{v₁} S] [MonoidalCategory S]
    [MonoidalClosed S] {C : Type u} [Category.{v} C] [EnrichedOrdinaryCategory S C] {D : Type u₂}
    [Category.{v₂} D] [EnrichedOrdinaryCategory S D] (hC : EnrichedCategory.HasTensors S C)
    (hD : EnrichedCategory.HasTensors S D) (G : EnrichedFunctor S D C) {F : C ⥤ D}
    (_adj : F ⊣ (ForgetEnrichment.equiv (V := S)).inverse ⋙ G.forget ⋙
      (ForgetEnrichment.equiv (V := S)).functor) (X : C) (K : S) :
    ((EnrichedCategory.tensorBifunctor S D hD).obj (F.obj X)).obj K ⟶
      F.obj (((EnrichedCategory.tensorBifunctor S C hC).obj X).obj K) := sorry

/-! ### F3.2 Diagram model structures and homotopy (co)limits -/

/-- `C ⥤ A` with the projective model structure, README F3.2 (`HomotopicalAlgebra.ProjectiveDiagram`;
HTT Proposition A.2.8.2). -/
def ProjectiveDiagram (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] := C ⥤ A

/-- `C ⥤ A` with the injective model structure, README F3.2 (`HomotopicalAlgebra.InjectiveDiagram`;
HTT Proposition A.2.8.2). -/
def InjectiveDiagram (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] := C ⥤ A

instance (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] :
    Category (ProjectiveDiagram C A) := inferInstanceAs (Category (C ⥤ A))

instance (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] :
    Category (InjectiveDiagram C A) := inferInstanceAs (Category (C ⥤ A))

/-- The projective model structure, README F3.2 (HTT A.2.8.2): levelwise weak equivalences and
fibrations. -/
instance (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] [ModelCategory A]
    [IsCombinatorial.{w} A] : ModelCategory (ProjectiveDiagram C A) where
  categoryWithWeakEquivalences := ⟨levelwiseWeakEquivalences C A⟩
  categoryWithFibrations := ⟨projectiveFibrations C A⟩
  categoryWithCofibrations := ⟨projectiveCofibrations C A⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The injective model structure, README F3.2 (HTT A.2.8.2): levelwise weak equivalences and
cofibrations. -/
instance (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A] [ModelCategory A]
    [IsCombinatorial.{w} A] : ModelCategory (InjectiveDiagram C A) where
  categoryWithWeakEquivalences := ⟨levelwiseWeakEquivalences C A⟩
  categoryWithFibrations := ⟨injectiveFibrations C A⟩
  categoryWithCofibrations := ⟨injectiveCofibrations C A⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

section Bridges

variable (C : Type w) [SmallCategory C] (A : Type u) [Category.{v} A]

/-- The bridge `(C ⥤ A) ≌ ProjectiveDiagram C A` (identities), README Conventions *Model
structures on one category* and F3.2 (`HomotopicalAlgebra.ProjectiveDiagram.equivalence`). -/
def ProjectiveDiagram.equivalence : (C ⥤ A) ≌ ProjectiveDiagram C A := CategoryTheory.Equivalence.refl

/-- The bridge `(C ⥤ A) ≌ InjectiveDiagram C A` (identities), README Conventions and F3.2
(`HomotopicalAlgebra.InjectiveDiagram.equivalence`). -/
def InjectiveDiagram.equivalence : (C ⥤ A) ≌ InjectiveDiagram C A := CategoryTheory.Equivalence.refl

variable [ModelCategory A] [IsCombinatorial.{w} A]

/-- Transport lemma, README F3.2: projective weak equivalences are the levelwise ones. -/
theorem ProjectiveDiagram.weakEquivalences_eq :
    (weakEquivalences (ProjectiveDiagram C A)).inverseImage
      (ProjectiveDiagram.equivalence C A).functor = levelwiseWeakEquivalences C A := rfl

/-- Transport lemma, README F3.2: projective fibrations are the levelwise ones. -/
theorem ProjectiveDiagram.fibrations_eq :
    (fibrations (ProjectiveDiagram C A)).inverseImage
      (ProjectiveDiagram.equivalence C A).functor = projectiveFibrations C A := rfl

/-- Transport lemma, README F3.2: projective cofibrations (HTT A.2.8.1). -/
theorem ProjectiveDiagram.cofibrations_eq :
    (cofibrations (ProjectiveDiagram C A)).inverseImage
      (ProjectiveDiagram.equivalence C A).functor = projectiveCofibrations C A := rfl

/-- Transport lemma, README F3.2: injective weak equivalences are the levelwise ones. -/
theorem InjectiveDiagram.weakEquivalences_eq :
    (weakEquivalences (InjectiveDiagram C A)).inverseImage
      (InjectiveDiagram.equivalence C A).functor = levelwiseWeakEquivalences C A := rfl

/-- Transport lemma, README F3.2: injective fibrations (HTT A.2.8.1). -/
theorem InjectiveDiagram.fibrations_eq :
    (fibrations (InjectiveDiagram C A)).inverseImage
      (InjectiveDiagram.equivalence C A).functor = injectiveFibrations C A := rfl

/-- Transport lemma, README F3.2: injective cofibrations are the levelwise ones. -/
theorem InjectiveDiagram.cofibrations_eq :
    (cofibrations (InjectiveDiagram C A)).inverseImage
      (InjectiveDiagram.equivalence C A).functor = injectiveCofibrations C A := rfl

end Bridges

section HomotopyKan

variable {C C' : Type w} [SmallCategory C] [SmallCategory C'] {A : Type u} [Category.{v} A]
  [ModelCategory A] [IsCombinatorial.{w} A]

/-- Homotopy right Kan extensions, README F3.2 (`HTT.A.2.8.7/after`,
`HomotopicalAlgebra.IsHomotopyRightKanExtension`): for some levelwise weak equivalence `F ⟶ F'`
to an injectively fibrant `F'` and right Kan extension `(F'', β)` of `F'` along `f`, the induced
`G ⟶ F''` is a levelwise weak equivalence. -/
def IsHomotopyRightKanExtension (f : C ⥤ C') {F : C ⥤ A} {G : C' ⥤ A} (α : f ⋙ G ⟶ F) : Prop :=
  ∃ (F' : C ⥤ A) (w : F ⟶ F'), levelwiseWeakEquivalences C A w ∧
    IsFibrant ((InjectiveDiagram.equivalence C A).functor.obj F') ∧
    ∃ (F'' : C' ⥤ A) (β : f ⋙ F'' ⟶ F') (h : F''.IsRightKanExtension β),
      haveI := h
      levelwiseWeakEquivalences C' A (F''.liftOfIsRightKanExtension β G (α ≫ w))

/-- Homotopy left Kan extensions, the dual (README F3.2, `HTT.A.2.8.7/after`), with projectively
cofibrant replacements. -/
def IsHomotopyLeftKanExtension (f : C ⥤ C') {F : C ⥤ A} {G : C' ⥤ A} (α : F ⟶ f ⋙ G) : Prop :=
  ∃ (F' : C ⥤ A) (w : F' ⟶ F), levelwiseWeakEquivalences C A w ∧
    IsCofibrant ((ProjectiveDiagram.equivalence C A).functor.obj F') ∧
    ∃ (F'' : C' ⥤ A) (β : F' ⟶ f ⋙ F'') (h : F''.IsLeftKanExtension β),
      haveI := h
      levelwiseWeakEquivalences C' A (F''.descOfIsLeftKanExtension β G (w ≫ α))

/-- Homotopy limits, README F3.2 (`HomotopicalAlgebra.IsHomotopyLimit`): the case of the functor
to `Discrete PUnit`. -/
def IsHomotopyLimit {F : C ⥤ A} (c : Cone F) : Prop :=
  IsHomotopyRightKanExtension ((Functor.const C).obj (Discrete.mk PUnit.unit))
    (G := (Functor.const (Discrete PUnit.{w + 1})).obj c.pt) c.π

/-- Homotopy colimits, README F3.2 (`HomotopicalAlgebra.IsHomotopyColimit`). -/
def IsHomotopyColimit {F : C ⥤ A} (c : Cocone F) : Prop :=
  IsHomotopyLeftKanExtension ((Functor.const C).obj (Discrete.mk PUnit.unit))
    (G := (Functor.const (Discrete PUnit.{w + 1})).obj c.pt) c.ι

end HomotopyKan

section Realization

variable {A : Type u} [Category.{v} A] [EnrichedOrdinaryCategory SSet.{v} A] [ModelCategory A]
  [HasColimitsOfSize.{v, v} A]

/-- The geometric realization `|X| = ∫ X ⊗ Δ[•]` of a simplicial object of a tensored simplicial
category (helper for README F3.2 *Coends of diagrams and geometric realization*, HTT A.2.9.29). -/
def simplicialRealization (_h : EnrichedCategory.HasTensors SSet.{v} A)
    (X : SimplexCategoryᵒᵖ ⥤ A) : A := sorry

/-- A chosen projectively cofibrant replacement of a simplicial object, with its levelwise weak
equivalence to `X` (helper for README F3.2, HTT A.2.9.30). -/
def projectiveCofibrantReplacement [IsCombinatorial.{v} A] (X : SimplexCategoryᵒᵖ ⥤ A) :
    Σ X' : SimplexCategoryᵒᵖ ⥤ A, X' ⟶ X := sorry

/-- The canonical map `hocolim X ⟶ |X|` in a localization `hA` of A, README F3.2
(`HomotopicalAlgebra.hocolimToRealization`, propose; HTT Corollary A.2.9.30): the colimit of a
projectively cofibrant replacement, compared with the realization through A.2.9.29. -/
def hocolimToRealization [IsCombinatorial.{v} A] {hA : Type u₁} [Category.{v₁} hA] (L : A ⥤ hA)
    [L.IsLocalization (weakEquivalences A)] (h : EnrichedCategory.HasTensors SSet.{v} A)
    (X : SimplexCategoryᵒᵖ ⥤ A) :
    L.obj (colimit (projectiveCofibrantReplacement X).1) ⟶ L.obj (simplicialRealization h X) :=
  sorry

end Realization

/-! ### F3.4 The homotopy category of an S-enriched category; `Cat_S` -/

section EnrichedHo

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [ModelCategory S]

/-- In a monoidal model category whose objects are all cofibrant, weak equivalences are monoidal
(helper for README F3.4, the hypothesis of HTT A.3.2.1 used throughout). -/
instance isMonoidal_weakEquivalences [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ]
    [MonoidalModelCategory S] [∀ X : S, IsCofibrant X] : (weakEquivalences S).IsMonoidal := sorry

variable [(weakEquivalences S).IsMonoidal]

/-- `hS`, the localized monoidal category of S (README F3.4, HTT A.3.2.1). -/
abbrev HoS : Type u₁ :=
  LocalizedMonoidal (weakEquivalences S).Q (weakEquivalences S) (Iso.refl _)

/-- The monoidal localization functor `S ⥤ hS` (README F3.4). -/
abbrev HoS.Q : S ⥤ HoS S := Localization.Monoidal.toMonoidalCategory _ _ _

/-- The homotopy category `hC` of an S-enriched category, README F3.4
(`HomotopicalAlgebra.EnrichedHomotopyCategory`; HTT Definition A.3.2.1): the objects of `C`. -/
structure EnrichedHomotopyCategory (C : Type u₂) [EnrichedCategory S C] where
  of ::
  as : C

instance (C : Type u₂) [EnrichedCategory S C] : Category (EnrichedHomotopyCategory S C) where
  Hom X Y := (HoS.Q S).obj (𝟙_ S) ⟶ (HoS.Q S).obj (X.as ⟶[S] Y.as)
  id X := (HoS.Q S).map (eId S X.as)
  comp f g := (HoS.Q S).map (λ_ (𝟙_ S)).inv ≫ Functor.OplaxMonoidal.δ (HoS.Q S) _ _ ≫
    (f ⊗ₘ g) ≫ Functor.LaxMonoidal.μ (HoS.Q S) _ _ ≫ (HoS.Q S).map (eComp S _ _ _)
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

variable {S}

/-- The morphism of `hC` named by a point `𝟙_ S ⟶ Map_C(X, Y)` (README F3.4,
`EnrichedHomotopyCategory.homMk`). -/
def EnrichedHomotopyCategory.homMk {C : Type u₂} [EnrichedCategory S C] {X Y : C}
    (f : 𝟙_ S ⟶ (X ⟶[S] Y)) : (EnrichedHomotopyCategory.of X : EnrichedHomotopyCategory S C) ⟶ .of Y :=
  (HoS.Q S).map f

/-- The functoriality of `hC`, README F3.4 (`EnrichedFunctor.mapHomotopyCategory'`). -/
def EnrichedFunctor.mapHomotopyCategory' {C : Type u₂} {D : Type u} [EnrichedCategory S C]
    [EnrichedCategory S D] (F : EnrichedFunctor S C D) :
    EnrichedHomotopyCategory S C ⥤ EnrichedHomotopyCategory S D where
  obj X := .of (F.obj X.as)
  map {X Y} f := @CategoryStruct.comp (HoS S) _ _ _ _
    (show (HoS.Q S).obj (𝟙_ S) ⟶ (HoS.Q S).obj (X.as ⟶[S] Y.as) from f)
    ((HoS.Q S).map (F.map X.as Y.as))
  map_id := sorry
  map_comp := sorry

variable (S) in
/-- The hS-enriched `hC`, README F3.4 (`EnrichedHomotopyCategory.enriched`; HTT A.3.2.1, A.1.4.3):
`TransportEnrichment` along `S ⥤ hS`. -/
abbrev EnrichedHomotopyCategory.enriched (C : Type u₂) [EnrichedCategory S C] : Type u₂ :=
  TransportEnrichment (HoS.Q S) C

/-- Weak equivalences of S-enriched categories, README F3.4
(`CategoryTheory.EnrichedFunctor.IsWeakEquivalence`; HTT Definition A.3.2.1, unwound). -/
class EnrichedFunctor.IsWeakEquivalence {C : Type u₂} {D : Type u} [EnrichedCategory S C]
    [EnrichedCategory S D] (F : EnrichedFunctor S C D) : Prop where
  weakEquivalence_map (X Y : C) : WeakEquivalence (F.map X Y)
  essSurj : (EnrichedFunctor.mapHomotopyCategory' F).EssSurj

variable (S) in
/-- Equivalences in an S-enriched category, README F3.4 (`EnrichedCategory.IsEquivalenceHom`; HTT
Definition A.3.2.9). -/
def EnrichedCategory.IsEquivalenceHom {C : Type u₂} [EnrichedCategory S C] {X Y : C}
    (f : 𝟙_ S ⟶ (X ⟶[S] Y)) : Prop :=
  IsIso (EnrichedHomotopyCategory.homMk f)

variable (S) in
/-- Locally fibrant S-enriched categories, README F3.4 (`EnrichedCategory.IsLocallyFibrant`; HTT
A.3.2.9). -/
def EnrichedCategory.IsLocallyFibrant (C : Type u₂) [EnrichedCategory S C] : Prop :=
  ∀ X Y : C, IsFibrant (X ⟶[S] Y)

/-- Local fibrations, README F3.4 (`EnrichedFunctor.IsLocalFibration`; HTT Definition A.3.2.9). -/
def EnrichedFunctor.IsLocalFibration {C : Type u₂} {D : Type u} [EnrichedCategory S C]
    [EnrichedCategory S D] (F : EnrichedFunctor S C D) : Prop :=
  (∀ X Y, Fibration (F.map X Y)) ∧
    Functor.IsIsofibration (EnrichedFunctor.mapHomotopyCategory' F)

end EnrichedHo

end HomotopicalAlgebra

namespace EnrichedCat

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S]

/-- An S-functor viewed as an `EnrichedFunctor` (helper for README F3.4). -/
abbrev toFunctor {C D : EnrichedCat.{v₁, u₁, v₁} S} (F : C ⟶ D) : EnrichedFunctor S C D := F

/-- `[1]_K`, README F3.4 *The model structure on `Cat_S`* (`EnrichedCat.interval`; HTT Notation
before A.3.2.4): objects `X, Y`, `Map(X, Y) = K`, `Map(Y, X) = ∅`. -/
def interval [HasInitial S] (K : S) : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- The object `X` of `[1]_K` (README F3.4). -/
def interval.left [HasInitial S] (K : S) : interval S K := sorry

/-- The object `Y` of `[1]_K` (README F3.4). -/
def interval.right [HasInitial S] (K : S) : interval S K := sorry

/-- The identification `Map_{[1]_K}(X, Y) = K` (README F3.4). -/
def interval.homIso [HasInitial S] (K : S) :
    (interval.left S K ⟶[S] interval.right S K) ≅ K := sorry

/-- `[1]_K ⟶ [1]_L` for `K ⟶ L` (README F3.4). -/
def interval.map [HasInitial S] {K L : S} (f : K ⟶ L) : interval S K ⟶ interval S L := sorry

/-- `[0]_S`, README F3.4 (`EnrichedCat.point`). -/
def point : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- The empty S-enriched category (README F3.4). -/
def empty : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- `∅ ⟶ [0]_S` (README F3.4). -/
def empty.toPoint : empty S ⟶ point S := sorry

/-- `C₀`, README F3.4 (`EnrichedCat.generatingCofibrations`; HTT A.3.2.4): `∅ ⟶ [0]_S` and the
`[1]_K ⟶ [1]_L` for `K ⟶ L` in `I`. -/
def generatingCofibrations [HasInitial S] (I : CategoryTheory.MorphismProperty S) :
    CategoryTheory.MorphismProperty (EnrichedCat.{v₁, u₁, v₁} S) :=
  CategoryTheory.MorphismProperty.ofHoms (fun _ : Unit ↦ empty.toPoint S) ⊔
    CategoryTheory.MorphismProperty.ofHoms (fun f : {f : Arrow S // I f.hom} ↦ interval.map S f.1.hom)


/-- The discrete S-enriched category on a set `O` (mapping objects `𝟙_S` on the diagonal and initial
elsewhere), README F3.4 *Simplicial categories with a fixed object set* (`EnrichedCat.discrete`). -/
def discrete [HasInitial S] (O : Type v₁) : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- `Map^φ_{Cat_S}(C, D)`, README F3.4 *Mapping objects of functor sets* (`EnrichedCat.mapOver`,
propose; HTT construction before Lemma A.3.2.26): the object of S representing the functors
`C ⟶ D^K` that are φ on objects. -/
def mapOver (C D : EnrichedCat.{v₁, u₁, v₁} S) (_φ : C → D) : S := sorry
/-- `[1]^∼_S`, README F3.4 *The invertibility hypothesis* (`EnrichedCat.isoInterval`; HTT Notation
A.3.2.11): objects `X, Y`, every mapping object `𝟙_S`. -/
def isoInterval : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- `[1]_S ⟶ [1]^∼_S` (README F3.4). -/
def interval.toIsoInterval [HasInitial S] : interval S (𝟙_ S) ⟶ isoInterval S := sorry

/-- `Cat_S` is cocomplete (helper for README F3.7, used by `EnrichedCat.invert`). -/
instance hasColimits [MonoidalClosed S] [HasColimitsOfSize.{v₁, v₁} S] :
    HasColimitsOfSize.{v₁, v₁} (EnrichedCat.{v₁, u₁, v₁} S) := sorry

open HomotopicalAlgebra in
/-- `Cat_S` with Bergner's model structure, README F3.4 (`CategoryTheory.EnrichedCat.Bergner`; HTT
Proposition A.3.2.4). -/
def Bergner : Type _ := EnrichedCat.{v₁, u₁, v₁} S

instance : Category (Bergner S) := inferInstanceAs (Category (EnrichedCat.{v₁, u₁, v₁} S))

/-- The bridge `EnrichedCat S ≌ Bergner S` (identities), README Conventions *Model structures on
one category* and F3.4 (`EnrichedCat.Bergner.equivalence`). -/
def Bergner.equivalence : EnrichedCat.{v₁, u₁, v₁} S ≌ Bergner S := CategoryTheory.Equivalence.refl

open HomotopicalAlgebra in
/-- The cofibrations of Bergner's structure, README F3.4 (HTT A.3.2.4): generated by `C₀` for a
chosen small generating set of cofibrations of S. -/
def Bergner.cofibrationClass [ModelCategory S] [IsCombinatorial.{v₁} S] :
    CategoryTheory.MorphismProperty (EnrichedCat.{v₁, u₁, v₁} S) :=
  (generatingCofibrations S
    (Classical.choose (IsCombinatorial.exists_cofibrations (C := S)))).rlp.llp

open HomotopicalAlgebra in
/-- The weak equivalences of Bergner's structure, README F3.4 (HTT A.3.2.1). -/
def Bergner.weakEquivalenceClass [ModelCategory S] [(weakEquivalences S).IsMonoidal] :
    CategoryTheory.MorphismProperty (EnrichedCat.{v₁, u₁, v₁} S) :=
  fun _ _ F ↦ EnrichedFunctor.IsWeakEquivalence (toFunctor S F)

open HomotopicalAlgebra in
/-- The model structure on `Cat_S`, README F3.4 (HTT A.3.2.4): for S combinatorial and monoidal
model, every object cofibrant and weak equivalences stable under filtered colimits, cofibrations
generated by `C₀` for a chosen small generating set of cofibrations of S, weak equivalences those
of A.3.2.1, fibrations their right lifting class. -/
instance Bergner.modelCategory [ModelCategory S] [IsCombinatorial.{v₁} S]
    [(weakEquivalences S).IsMonoidal] [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S] [∀ X : S, IsCofibrant X]
    [(weakEquivalences S).IsStableUnderFilteredColimits.{v₁, v₁}] :
    ModelCategory (Bergner S) where
  categoryWithCofibrations := ⟨Bergner.cofibrationClass S⟩
  categoryWithWeakEquivalences := ⟨Bergner.weakEquivalenceClass S⟩
  categoryWithFibrations := ⟨(Bergner.cofibrationClass S ⊓ Bergner.weakEquivalenceClass S).rlp⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

section Bridge

open HomotopicalAlgebra

variable [ModelCategory S] [IsCombinatorial.{v₁} S] [(weakEquivalences S).IsMonoidal]
  [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S] [∀ X : S, IsCofibrant X]
  [(weakEquivalences S).IsStableUnderFilteredColimits.{v₁, v₁}]

/-- Transport lemma, README F3.4: Bergner's weak equivalences are those of A.3.2.1. -/
theorem Bergner.weakEquivalences_eq :
    (weakEquivalences (Bergner S)).inverseImage (Bergner.equivalence S).functor =
      Bergner.weakEquivalenceClass S := rfl

/-- Transport lemma, README F3.4: Bergner's cofibrations are generated by `C₀`. -/
theorem Bergner.cofibrations_eq :
    (cofibrations (Bergner S)).inverseImage (Bergner.equivalence S).functor =
      Bergner.cofibrationClass S := rfl

/-- Transport lemma, README F3.4: Bergner's fibrations are the right lifting class. -/
theorem Bergner.fibrations_eq :
    (fibrations (Bergner S)).inverseImage (Bergner.equivalence S).functor =
      (Bergner.cofibrationClass S ⊓ Bergner.weakEquivalenceClass S).rlp := rfl

end Bridge

end EnrichedCat

namespace EnrichedCat

/-- Simplicial categories with object set `O`, README F3.4 *Simplicial categories with a fixed
object set* (`CategoryTheory.EnrichedCat.FixedObjects`, propose; `HTT.A.3.2/fixed-objects/model`;
Dwyer–Kan, §7): `EnrichedCategory SSet` structures on `O`. -/
structure FixedObjects (O : Type u) where
  /-- The simplicial enrichment on `O`. -/
  str : EnrichedCategory SSet.{u} O

/-- Morphisms of `Cat_{Δ,O}`: identity-on-objects simplicial functors (README F3.4). -/
instance (O : Type u) : Category (FixedObjects O) where
  Hom X Y := {F : @EnrichedFunctor SSet.{u} _ _ O X.str O Y.str //
    ∀ o, @EnrichedFunctor.obj SSet.{u} _ _ O X.str O Y.str F o = o}
  id := sorry
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The model structure on `Cat_{Δ,O}`, README F3.4 (`HTT.A.3.2/fixed-objects/model`): transferred
along the free–forgetful adjunction from the levelwise structure on `O × O`-graphs. The roadmap
gives `FixedObjects O` one model structure, so it is an ordinary instance. -/
instance (O : Type u) : ModelCategory (FixedObjects O) := sorry

end EnrichedCat

namespace CategoryTheory

/-- Homotopy sifted categories, README F3.4 *Sifted homotopy colimits with a fixed object set*
(`CategoryTheory.IsHomotopySifted`, propose; `HTT.A.3.2/sifted-hocolim/mapping`): J is nonempty and
for all `a, b` the category of cospans `a ⟶ c ⟵ b` has weakly contractible nerve. -/
class IsHomotopySifted (J : Type w) [SmallCategory J] : Prop where
  nonempty : Nonempty J
  isWeaklyContractible (a b : J) :
    SSet.IsWeaklyContractible (nerve (StructuredArrow (a, b) (Functor.diag J)))

end CategoryTheory

namespace HomotopicalAlgebra

open EnrichedCat

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [ModelCategory S]
  [IsCombinatorial.{v₁} S] [(weakEquivalences S).IsMonoidal]
  [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S] [∀ X : S, IsCofibrant X]
  [(weakEquivalences S).IsStableUnderFilteredColimits.{v₁, v₁}]

/-- The invertibility hypothesis, README F3.4 (`HomotopicalAlgebra.SatisfiesInvertibilityHypothesis`;
HTT Definition A.3.2.12): for every cofibration `i : [1]_S ⟶ C` classifying an equivalence of `C`,
the pushout `C ⟶ C ⊔_{[1]_S} [1]^∼_S` is a weak equivalence. -/
def SatisfiesInvertibilityHypothesis : Prop :=
  ∀ (C D : EnrichedCat.{v₁, u₁, v₁} S) (i : interval S (𝟙_ S) ⟶ C) (j : C ⟶ D)
    (k : isoInterval S ⟶ D),
    Cofibration ((Bergner.equivalence S).functor.map i) →
    EnrichedCategory.IsEquivalenceHom S ((interval.homIso S (𝟙_ S)).inv ≫
      (toFunctor S i).map (interval.left S (𝟙_ S)) (interval.right S (𝟙_ S))) →
    IsPushout i (interval.toIsoInterval S) j k →
      WeakEquivalence ((Bergner.equivalence S).functor.map j)

end HomotopicalAlgebra

namespace HomotopicalAlgebra

/-- Excellent model categories, README F3.4 (`HomotopicalAlgebra.ExcellentModelCategory`; HTT
Definition A.3.2.16). The invertibility hypothesis needs Bergner's structure, hence the earlier
conditions as instances: it is stated under them. Every object is cofibrant (HTT Remark
A.3.2.17, from (A2)); this is recorded as the field `isCofibrant`. -/
class ExcellentModelCategory (S : Type u) [Category.{v} S] [MonoidalCategory S] [SymmetricCategory S]
    [MonoidalClosed S] [ModelCategory S] : Prop where
  isCombinatorial : IsCombinatorial.{v} S
  mono_le_cofibrations : CategoryTheory.MorphismProperty.monomorphisms S ≤ cofibrations S
  isCofibrant : ∀ X : S, IsCofibrant X
  isStableUnderBinaryProducts : (cofibrations S).IsStableUnderProductsOfShape WalkingPair
  isStableUnderFilteredColimits : (weakEquivalences S).IsStableUnderFilteredColimits.{v, v}
  isLeftQuillenBifunctor : IsLeftQuillenBifunctor (MonoidalCategory.curriedTensor S)
  satisfiesInvertibilityHypothesis [IsCombinatorial.{v} S] [(weakEquivalences S).IsMonoidal]
    [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S] [∀ X : S, IsCofibrant X]
    [(weakEquivalences S).IsStableUnderFilteredColimits.{v, v}] :
    SatisfiesInvertibilityHypothesis S

/-! ### F3.5 Enriched diagram categories -/

/-- S-enriched diagrams `C ⟶ A`, README F3.5 (`CategoryTheory.EnrichedDiagram`; HTT Definition
A.3.3.1): `EnrichedFunctor S C A` with S-natural transformations of Tau Ceti. -/
def EnrichedDiagram (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] (C : Type u₂)
    [EnrichedCategory S C] (A : Type u) [Category.{v} A] [EnrichedOrdinaryCategory S A] :=
  EnrichedFunctor S C A

namespace EnrichedDiagram

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [BraidedCategory S] (C : Type u₂)
  [EnrichedCategory S C] (A : Type u) [Category.{v} A] [EnrichedOrdinaryCategory S A]

instance : Category (EnrichedDiagram S C A) where
  Hom F G := UnitGradedNatTrans (V := S) F G
  id F := UnitGradedNatTrans.id F
  comp α β := UnitGradedNatTrans.unitComp α β
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

variable {S C A} in
/-- The component at `X` of an S-natural transformation, in `A` (helper for README F3.5). -/
def app {F G : EnrichedDiagram S C A} (α : F ⟶ G) (X : C) :
    EnrichedFunctor.obj F X ⟶ EnrichedFunctor.obj G X :=
  (eHomEquiv S).symm (GradedNatTrans.app (show UnitGradedNatTrans (V := S) F G from α) X)

variable [ModelCategory A]

/-- Injective cofibrations of enriched diagrams, README F3.5 (HTT Definition A.3.3.1). -/
def injectiveCofibrations : CategoryTheory.MorphismProperty (EnrichedDiagram S C A) :=
  fun _ _ α ↦ ∀ X, Cofibration (app α X)

/-- Projective fibrations of enriched diagrams, README F3.5 (HTT A.3.3.1). -/
def projectiveFibrations : CategoryTheory.MorphismProperty (EnrichedDiagram S C A) :=
  fun _ _ α ↦ ∀ X, Fibration (app α X)

/-- Levelwise weak equivalences of enriched diagrams, README F3.5 (HTT A.3.3.1). -/
def levelwiseWeakEquivalences : CategoryTheory.MorphismProperty (EnrichedDiagram S C A) :=
  fun _ _ α ↦ ∀ X, WeakEquivalence (app α X)

/-- Injective fibrations of enriched diagrams, README F3.5 (HTT A.3.3.1). -/
def injectiveFibrations : CategoryTheory.MorphismProperty (EnrichedDiagram S C A) :=
  (injectiveCofibrations S C A ⊓ levelwiseWeakEquivalences S C A).rlp

/-- Projective cofibrations of enriched diagrams, README F3.5 (HTT A.3.3.1). -/
def projectiveCofibrations : CategoryTheory.MorphismProperty (EnrichedDiagram S C A) :=
  (projectiveFibrations S C A ⊓ levelwiseWeakEquivalences S C A).llp

/-- Enriched diagrams with the projective model structure, README F3.5 (HTT A.3.3.2). -/
def Projective := EnrichedDiagram S C A

/-- Enriched diagrams with the injective model structure, README F3.5 (HTT A.3.3.2). -/
def Injective := EnrichedDiagram S C A

instance : Category (Projective S C A) := inferInstanceAs (Category (EnrichedDiagram S C A))

instance : Category (Injective S C A) := inferInstanceAs (Category (EnrichedDiagram S C A))

/-- The projective model structure on enriched diagrams, README F3.5 (HTT A.3.3.2). -/
instance [IsCombinatorial.{v} A] : ModelCategory (Projective S C A) where
  categoryWithWeakEquivalences := ⟨levelwiseWeakEquivalences S C A⟩
  categoryWithFibrations := ⟨projectiveFibrations S C A⟩
  categoryWithCofibrations := ⟨projectiveCofibrations S C A⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The injective model structure on enriched diagrams, README F3.5 (HTT A.3.3.2). -/
instance [IsCombinatorial.{v} A] : ModelCategory (Injective S C A) where
  categoryWithWeakEquivalences := ⟨levelwiseWeakEquivalences S C A⟩
  categoryWithFibrations := ⟨injectiveFibrations S C A⟩
  categoryWithCofibrations := ⟨injectiveCofibrations S C A⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The bridge `EnrichedDiagram S C A ≌ Projective S C A` (identities), README Conventions *Model
structures on one category* and F3.5 (`EnrichedDiagram.Projective.equivalence`). -/
def Projective.equivalence : EnrichedDiagram S C A ≌ Projective S C A := CategoryTheory.Equivalence.refl

/-- The bridge `EnrichedDiagram S C A ≌ Injective S C A` (identities), README Conventions and F3.5
(`EnrichedDiagram.Injective.equivalence`). -/
def Injective.equivalence : EnrichedDiagram S C A ≌ Injective S C A := CategoryTheory.Equivalence.refl

variable [IsCombinatorial.{v} A]

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Projective.weakEquivalences_eq :
    (weakEquivalences (Projective S C A)).inverseImage (Projective.equivalence S C A).functor =
      levelwiseWeakEquivalences S C A := rfl

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Projective.fibrations_eq :
    (fibrations (Projective S C A)).inverseImage (Projective.equivalence S C A).functor =
      projectiveFibrations S C A := rfl

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Projective.cofibrations_eq :
    (cofibrations (Projective S C A)).inverseImage (Projective.equivalence S C A).functor =
      projectiveCofibrations S C A := rfl

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Injective.weakEquivalences_eq :
    (weakEquivalences (Injective S C A)).inverseImage (Injective.equivalence S C A).functor =
      levelwiseWeakEquivalences S C A := rfl

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Injective.fibrations_eq :
    (fibrations (Injective S C A)).inverseImage (Injective.equivalence S C A).functor =
      injectiveFibrations S C A := rfl

/-- Transport lemma, README F3.5 (HTT A.3.3.2). -/
theorem Injective.cofibrations_eq :
    (cofibrations (Injective S C A)).inverseImage (Injective.equivalence S C A).functor =
      injectiveCofibrations S C A := rfl

variable {S C A} in
/-- Restriction `f^* : A^{C'} ⟶ A^C` along an S-functor (helper for README F3.5). -/
def restrict {C' : Type u₂} [EnrichedCategory S C'] (f : EnrichedFunctor S C C') :
    EnrichedDiagram S C' A ⥤ EnrichedDiagram S C A := sorry

variable {S C A} in
/-- Homotopy right Kan extensions of enriched diagrams, README F3.5 *Homotopy Kan extensions of
enriched diagrams* (`EnrichedDiagram.IsHomotopyRightKanExtension`, propose; HTT A.3.3.12): the
enriched form of F3.2's predicate, through an injective fibrant replacement `F ⟶ F'` and the right
adjoint of `f^*`. -/
def IsHomotopyRightKanExtension {C' : Type u₂} [EnrichedCategory S C']
    (f : EnrichedFunctor S C C') {F : EnrichedDiagram S C A} {G : EnrichedDiagram S C' A}
    (α : (restrict f).obj G ⟶ F) : Prop :=
  ∃ (F' : EnrichedDiagram S C A) (w : F ⟶ F'), levelwiseWeakEquivalences S C A w ∧
    IsFibrant ((Injective.equivalence S C A).functor.obj F') ∧
    ∃ (R : EnrichedDiagram S C A ⥤ EnrichedDiagram S C' A) (adj : restrict f ⊣ R),
      levelwiseWeakEquivalences S C' A (adj.homEquiv _ _ (α ≫ w))

end EnrichedDiagram

/-! ### F3.6 Chunks -/

namespace EnrichedModelCategory

variable {A : Type u} [Category.{v} A] [ModelCategory A]

/-- Chunks, README F3.6 (`HomotopicalAlgebra.EnrichedModelCategory.IsChunk`; HTT Definition
A.3.4.1): every finite product map `a ⟶ ∏ bᵢ` in `U` factors as a trivial cofibration and a
fibration through `U`, and every coproduct map `∐ bᵢ ⟶ a` as a cofibration and a trivial
fibration through `U`. The S-enriched functoriality in the family (`U.coneFamilies n`) is omitted
here: it needs the S-enriched category of factorizations, which is not prototyped. -/
def IsChunk (U : CategoryTheory.ObjectProperty A) : Prop :=
  ∀ n : ℕ, (∀ (a : A) (b : Fin n → A), U a → (∀ i, U (b i)) → ∀ φ : ∀ i, a ⟶ b i,
      ∃ (abar : A) (j : a ⟶ abar) (q : abar ⟶ ∏ᶜ b), j ≫ q = Pi.lift φ ∧
        trivialCofibrations A j ∧ fibrations A q ∧ U abar) ∧
    (∀ (a : A) (b : Fin n → A), U a → (∀ i, U (b i)) → ∀ φ : ∀ i, b i ⟶ a,
      ∃ (abar : A) (j : ∐ b ⟶ abar) (q : abar ⟶ a), j ≫ q = Sigma.desc φ ∧
        cofibrations A j ∧ trivialFibrations A q ∧ U abar)

/-- `U° = U ∩ A°`, README F3.6 (`ObjectProperty.bifibrant`; HTT A.3.4.1). -/
def bifibrant (U : CategoryTheory.ObjectProperty A) : CategoryTheory.ObjectProperty A :=
  fun X ↦ U X ∧ IsFibrant X ∧ IsCofibrant X

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [BraidedCategory S] (C : Type u₂)
  [EnrichedCategory S C] [EnrichedOrdinaryCategory S A] [IsCombinatorial.{v} A]

/-- The functors all of whose values lie in `U`, README F3.6 (`ObjectProperty.diagram`; HTT
A.3.4.9). -/
def diagram (U : CategoryTheory.ObjectProperty A) :
    CategoryTheory.ObjectProperty (EnrichedDiagram.Projective S C A) :=
  fun F ↦ ∀ X, U (EnrichedFunctor.obj (show EnrichedFunctor S C A from F) X)

/-- C-chunks, README F3.6 (`IsChunk.IsDiagramChunk`; HTT Definition A.3.4.9). -/
def IsChunk.IsDiagramChunk (U : CategoryTheory.ObjectProperty A) : Prop :=
  IsChunk U ∧ IsChunk (diagram S C U)

end EnrichedModelCategory

end HomotopicalAlgebra

/-! ### F3.7 Localization and homotopy colimits in `Cat_S` -/

namespace EnrichedCat

variable (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [HasInitial S]

/-- The chosen factorization `[1]_S ⟶ E ⟶ [1]^∼_S` into a cofibration and a weak equivalence,
README F3.7 (`EnrichedCat.invertCylinder`; HTT Notation A.3.5.1). -/
def invertCylinder : EnrichedCat.{v₁, u₁, v₁} S := sorry

/-- `[1]_S ⟶ E` (README F3.7). -/
def invertCylinder.ι : interval S (𝟙_ S) ⟶ invertCylinder S := sorry

/-- `E ⟶ [1]^∼_S` (README F3.7). -/
def invertCylinder.π : invertCylinder S ⟶ isoInterval S := sorry

variable {S} [MonoidalClosed S] [HasColimitsOfSize.{v₁, v₁} S]

/-- `C[W⁻¹]`, README F3.7 (`EnrichedCat.invert`; HTT Notation A.3.5.1): the pushout of
`∐_W E ⟵ ∐_W [1]_S ⟶ C`. -/
def invert (C : EnrichedCat.{v₁, u₁, v₁} S) {W : Type v₁} (w : W → (interval S (𝟙_ S) ⟶ C)) :
    EnrichedCat.{v₁, u₁, v₁} S :=
  pushout (Sigma.desc w) (Limits.Sigma.map fun _ : W ↦ invertCylinder.ι S)

variable (S) in
/-- Filtered S-enriched categories, README F3.7 (`EnrichedCat.Filtration`; HTT Definition
A.3.5.7). -/
structure Filtration (A : Type w) [PartialOrder A] (C : Type u₂) [EnrichedCategory S C] where
  r : C → A
  isInitial (X Y : C) : ¬ r X ≤ r Y → IsInitial (X ⟶[S] Y)

variable {A : Type v₁} [PartialOrder A] (p : A ⥤ EnrichedCat.{v₁, u₁, v₁} S)

/-- The objects `Σ a, p a` of the Grothendieck construction, README F3.7 (`EnrichedCat.groth`;
HTT Definition A.3.5.11). -/
def GrothObj : Type v₁ := Σ a : A, p.obj a

open Classical in
/-- The S-enrichment of the Grothendieck construction, README F3.7 (HTT A.3.5.11):
`Map((a, c), (a', c')) = Map(p(a ≤ a') c, c')` when `a ≤ a'`, and `∅` otherwise. -/
instance : EnrichedCategory S (GrothObj p) where
  Hom x y := if h : x.1 ≤ y.1 then
      ((toFunctor S (p.map (homOfLE h))).obj x.2 ⟶[S] y.2) else ⊥_ S
  id := sorry
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The Grothendieck construction, README F3.7 (`EnrichedCat.groth`; HTT Definition A.3.5.11). -/
def groth : EnrichedCat.{v₁, u₁, v₁} S := EnrichedCat.of S (GrothObj p)

/-- The filtration `r (a, c) = a` of the Grothendieck construction, README F3.7
(`EnrichedCat.groth.filtration`; HTT A.3.5.11). -/
def groth.filtration : Filtration S A (GrothObj p) where
  r := Sigma.fst
  isInitial _ _ _ := sorry

/-- The index set of the morphisms `(a, c) ⟶ (a', p(a ≤ a') c)` given by identities, README F3.7
(`EnrichedCat.groth.W`; HTT A.3.5.11). -/
def groth.W : Type v₁ := Σ (a a' : A), PLift (a ≤ a') × p.obj a

/-- The morphisms `[1]_S ⟶ groth p` of `groth.W p` (README F3.7, HTT A.3.5.11). -/
def groth.W.ι : groth.W p → (interval S (𝟙_ S) ⟶ groth p) := sorry

end EnrichedCat

/-! ### F3.8 Weak exponentials; F3.9 Bousfield localization -/

namespace HomotopicalAlgebra

section WeakExponential

variable {A : Type u} [Category.{v} A] [ModelCategory A] [HasBinaryProducts A]

/-- Weak exponentials, README F3.8 (`HomotopicalAlgebra.IsWeakExponential`; HTT Definition A.3.6.1),
for a localization `L : A ⥤ hA` with binary products in `hA`. -/
def IsWeakExponential {hA : Type u₁} [Category.{v₁} hA] [HasBinaryProducts hA] (L : A ⥤ hA)
    [L.IsLocalization (weakEquivalences A)] {P Z Y X : A} (p : P ⟶ Z ⨯ Y) (e : P ⟶ X) : Prop :=
  ∃ _ : IsIso (L.map p ≫ prodComparison L Z Y), ∀ W : hA,
    Function.Bijective fun g : W ⟶ L.obj Z ↦
      prod.map g (𝟙 _) ≫ inv (L.map p ≫ prodComparison L Z Y) ≫ L.map e

/-- Standard diagrams, README F3.8 (`IsWeakExponential.IsStandard`; HTT Remark A.3.6.2): `X, Y, Z`
fibrant and `p` a trivial fibration. -/
def IsWeakExponential.IsStandard {P Z Y X : A} (p : P ⟶ Z ⨯ Y) (_e : P ⟶ X) : Prop :=
  IsFibrant X ∧ IsFibrant Y ∧ IsFibrant Z ∧ trivialFibrations A p

/-- The homotopy category of a model category has binary products (README F3.8, a lemma of the
entry *Weak exponentials*). -/
instance hasBinaryProducts_localization : HasBinaryProducts (weakEquivalences A).Localization :=
  sorry

variable [HasColimitsOfSize.{w, w} A] [IsCombinatorial.{w} A]

/-- Multiplication by a fibrant `Y` preserves homotopy colimits, README F3.8
(`HomotopicalAlgebra.MultiplicationPreservesHocolim`; HTT Definition A.3.6.5), over small posets
and projectively cofibrant diagrams. -/
def MultiplicationPreservesHocolimBy (Y : A) : Prop :=
  ∀ (P : Type w) [PartialOrder P] (F F' : P ⥤ A) (α : F' ⟶ F ⋙ prod.functor.flip.obj Y),
    IsCofibrant ((ProjectiveDiagram.equivalence P A).functor.obj F) →
    IsCofibrant ((ProjectiveDiagram.equivalence P A).functor.obj F') →
    levelwiseWeakEquivalences P A α →
    IsIso ((weakEquivalences A).Q.map (colimMap α ≫ colimit.post F (prod.functor.flip.obj Y)) ≫
      prodComparison (weakEquivalences A).Q (colimit F) Y)

/-- Multiplication preserves homotopy colimits, README F3.8 (HTT Definition A.3.6.5). -/
def MultiplicationPreservesHocolim : Prop :=
  ∀ Y : A, IsFibrant Y → MultiplicationPreservesHocolimBy.{w} Y

end WeakExponential

/-- Bousfield localizations, README F3.9 (`HTT.A.3.7/intro`, `HomotopicalAlgebra.IsBousfieldLocalization`):
same cofibrations, and every weak equivalence of `M` one of `M'`. -/
def IsBousfieldLocalization {A : Type u} [Category.{v} A] (M M' : ModelCategory A) : Prop :=
  @cofibrations A _ M.categoryWithCofibrations = @cofibrations A _ M'.categoryWithCofibrations ∧
    @weakEquivalences A _ M.categoryWithWeakEquivalences ≤
      @weakEquivalences A _ M'.categoryWithWeakEquivalences

namespace SimplicialModelCategory

variable {A : Type u} [Category.{v} A] [EnrichedOrdinaryCategory SSet.{v} A] [ModelCategory A]

/-- The derived mapping space `Map_{hA}(X, Z)` in `H`, README F3.9
(`HomotopicalAlgebra.SimplicialModelCategory.derivedMap`; HTT §A.3.7): `Map_A` of the chosen
cofibrant replacement of `X` and fibrant replacement of `Z`. -/
def derivedMap (X Z : A) : SSet.H.{v} :=
  SSet.H.Q.obj
    ((CategoryTheory.MorphismProperty.factorizationData (cofibrations A) (trivialFibrations A)
        (initial.to X)).Z ⟶[SSet.{v}]
      (CategoryTheory.MorphismProperty.factorizationData (trivialCofibrations A) (fibrations A)
        (terminal.from Z)).Z)

/-- `Map_{hA}(Y, Z) ⟶ Map_{hA}(X, Z)` induced by `f : X ⟶ Y` (README F3.9). -/
def derivedMap.mapLeft {X Y : A} (f : X ⟶ Y) (Z : A) : derivedMap Y Z ⟶ derivedMap X Z := sorry

/-- S-local objects, README F3.9 (`SimplicialModelCategory.IsLocal`; HTT §A.3.7). -/
def IsLocal (S : CategoryTheory.MorphismProperty A) (Z : A) : Prop :=
  ∀ ⦃X Y : A⦄ (f : X ⟶ Y), S f → IsIso (derivedMap.mapLeft f Z)

/-- S-equivalences, README F3.9 (`SimplicialModelCategory.localEquivalences`; HTT §A.3.7). -/
def localEquivalences (S : CategoryTheory.MorphismProperty A) : CategoryTheory.MorphismProperty A :=
  fun _ _ f ↦ ∀ Z, IsLocal S Z → IsIso (derivedMap.mapLeft f Z)

end SimplicialModelCategory

namespace SimplicialModelCategory

/-- The left Bousfield localization `S⁻¹A`, README F3.9 *Existence of left Bousfield localizations*
(`SimplicialModelCategory.Localization`, propose; HTT Proposition A.3.7.3; Conventions *Model
structures on one category*): the type synonym of A. -/
def Localization (A : Type u) [Category.{v} A] (_S : CategoryTheory.MorphismProperty A) : Type u :=
  A

section

variable (A : Type u) [Category.{v} A] (S : CategoryTheory.MorphismProperty A)

instance : Category.{v} (Localization A S) := inferInstanceAs (Category A)

/-- The bridge `A ≌ Localization A S` (identities), README F3.9 (`Localization.equivalence`). -/
def Localization.equivalence : A ≌ Localization A S := CategoryTheory.Equivalence.refl

variable [EnrichedOrdinaryCategory SSet.{v} A] [ModelCategory A]

instance : EnrichedOrdinaryCategory SSet.{v} (Localization A S) :=
  inferInstanceAs (EnrichedOrdinaryCategory SSet.{v} A)

instance : CategoryWithCofibrations (Localization A S) := ⟨cofibrations A⟩

instance : CategoryWithWeakEquivalences (Localization A S) := ⟨localEquivalences (A := A) S⟩

instance : CategoryWithFibrations (Localization A S) :=
  ⟨(cofibrations A ⊓ localEquivalences (A := A) S).rlp⟩

/-- The model structure of `S⁻¹A`, README F3.9 (HTT A.3.7.3): the cofibrations of A, the
S-equivalences, and their right lifting class; for A left proper, combinatorial and simplicial,
and S small (the hypotheses other than combinatoriality are those of the statements about it). -/
instance [IsCombinatorial.{v} A] : ModelCategory (Localization A S) where
  categoryWithCofibrations := inferInstance
  categoryWithWeakEquivalences := inferInstance
  categoryWithFibrations := inferInstance
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- `S⁻¹A` is a simplicial model category, README F3.9 (HTT A.3.7.3). -/
instance [IsCombinatorial.{v} A] : SimplicialModelCategory (Localization A S) := sorry

omit [EnrichedOrdinaryCategory SSet.{v} A] in
/-- Transport lemma, README F3.9 (`Localization.cofibrations_eq`): the cofibrations of A. -/
theorem Localization.cofibrations_eq :
    (cofibrations (Localization A S)).inverseImage (Localization.equivalence A S).functor =
      cofibrations A := rfl

/-- Transport lemma, README F3.9 (`Localization.weakEquivalences_eq`): the S-equivalences. -/
theorem Localization.weakEquivalences_eq :
    (weakEquivalences (Localization A S)).inverseImage (Localization.equivalence A S).functor =
      localEquivalences S := rfl

/-- Transport lemma, README F3.9 (`Localization.fibrations_eq`): their right lifting class. -/
theorem Localization.fibrations_eq :
    (fibrations (Localization A S)).inverseImage (Localization.equivalence A S).functor =
      (cofibrations A ⊓ localEquivalences S).rlp := rfl

end

end SimplicialModelCategory

end HomotopicalAlgebra

/-! ### L2 Left fibrations, covariant model structure, straightening over a point -/

/-- Categories cofibered in groupoids, README L2.1 (`CategoryTheory.Functor.IsCofiberedInGroupoids`;
HTT Definition 2.1.1.1). -/
class Functor.IsCofiberedInGroupoids {C : Type u} [Category.{v} C] {D : Type u₁} [Category.{v₁} D]
    (F : C ⥤ D) : Prop where
  exists_lift (c : C) {d : D} (η : F.obj c ⟶ d) :
    ∃ (c' : C) (η' : c ⟶ c'), ∃ h : F.obj c' = d, F.map η' ≫ eqToHom h = η
  isStronglyCocartesian {c c' : C} (η : c ⟶ c') : F.IsStronglyCocartesian (F.map η) η

/-- Final objects of a simplicial category in the H-enriched sense, README L2.5
(`SimplicialCategory.IsHoFinal`; HTT Definition 1.2.12.1). -/
def SimplicialCategory.IsHoFinal {C : Type v} [Category.{u} C] [SimplicialCategory C] (X : C) :
    Prop :=
  ∀ Y : C, Nonempty (IsTerminal
    (EnrichedCategory.Hom (V := SSet.H.{u}) (C := SimplicialCategory.hoEnriched C) Y X))

namespace SSet

open _root_.SSet

/-- Covariant transport of a left fibration, README L2.1 *Left fibrations and covariant transport*
(`SSet.LeftFibration.transport`; HTT Proposition 2.1.3.1, Kerodon §5.2.2): the functor
`hS ⟶ H` whose object function is the fibres of `q`. -/
def LeftFibration.transport {X S : SSet.{u}} (q : X ⟶ S) [LeftFibration q] :
    hoFunctor.obj S ⥤ SSet.H.{u} := sorry

/-- Final objects in the H-enriched sense, README L2.5 (`SSet.IsHoFinal`; HTT Definition 1.2.12.1):
every `Map_C(Y, X)` is terminal in `H`. No quasicategory hypothesis. -/
def IsHoFinal {C : SSet.{u}} (X : C _⦋0⦌) : Prop := ∀ Y, Nonempty (IsTerminal (mapH Y X))

/-- The left cone `C^◁(f) = S ⊔_X X^◁` of `f : X ⟶ S`, README L2.6 (`SSet.leftConeOf`; HTT
Definition 2.1.4.2). -/
def leftConeOf {X S : SSet.{u}} (f : X ⟶ S) : SSet.{u} := pushout f (join.inr Δ[0] X)

/-- The inclusion `S ⟶ C^◁(f)` (README L2.6, HTT 2.1.4.2). -/
def leftConeOf.ι {X S : SSet.{u}} (f : X ⟶ S) : S ⟶ leftConeOf f := pushout.inl _ _

/-- The cone point of `C^◁(f)` (README L2.6, HTT 2.1.4.2). -/
def leftConeOf.conePoint {X S : SSet.{u}} (f : X ⟶ S) : (leftConeOf f) _⦋0⦌ :=
  yonedaEquiv (join.inl Δ[0] X ≫ pushout.inr f _)

/-- The right cone `C^▷(f) = S ⊔_X X^▷` of `f : X ⟶ S`, README L2.6 (`SSet.rightConeOf`; HTT
2.1.4.2). -/
def rightConeOf {X S : SSet.{u}} (f : X ⟶ S) : SSet.{u} := pushout f (join.inl X Δ[0])

/-- The inclusion `S ⟶ C^▷(f)` (README L2.6). -/
def rightConeOf.ι {X S : SSet.{u}} (f : X ⟶ S) : S ⟶ rightConeOf f := pushout.inl _ _

/-- The cone point of `C^▷(f)` (README L2.6). -/
def rightConeOf.conePoint {X S : SSet.{u}} (f : X ⟶ S) : (rightConeOf f) _⦋0⦌ :=
  yonedaEquiv (join.inr X Δ[0] ≫ pushout.inr f _)

namespace Over

/-- The functoriality of `SSet.leftConeOf` on `SSet/S`, README L2.6
(`SSet.Over.leftConeOfFunctor`; HTT 2.1.4.5). -/
def leftConeOfFunctor (S : SSet.{u}) : CategoryTheory.Over S ⥤ SSet.{u} where
  obj X := leftConeOf X.hom
  map {X Y} g := pushout.map X.hom (join.inr Δ[0] X.left) Y.hom (join.inr Δ[0] Y.left) (𝟙 S)
    (join.map (𝟙 Δ[0]) g.left) g.left sorry sorry
  map_id := sorry
  map_comp := sorry

/-- Covariant equivalences, README L2.6 (`SSet.Over.IsCovariantEquivalence`; HTT Definition
2.1.4.5): the left cones give a categorical equivalence. -/
def IsCovariantEquivalence {S : SSet.{u}} {X Y : CategoryTheory.Over S} (f : X ⟶ Y) : Prop :=
  IsCategoricalEquivalence ((leftConeOfFunctor S).map f)

/-- The class of covariant equivalences (README L2.6, HTT 2.1.4.5). -/
def covariantEquivalences (S : SSet.{u}) : CategoryTheory.MorphismProperty (CategoryTheory.Over S) :=
  fun _ _ f ↦ IsCovariantEquivalence f

/-- Covariant cofibrations, README L2.6 (HTT 2.1.4.5): the monomorphisms. -/
def covariantCofibrations (S : SSet.{u}) : CategoryTheory.MorphismProperty (CategoryTheory.Over S) :=
  (CategoryTheory.MorphismProperty.monomorphisms SSet.{u}).inverseImage (CategoryTheory.Over.forget S)

/-- Covariant fibrations, README L2.6 (HTT 2.1.4.5). -/
def covariantFibrations (S : SSet.{u}) : CategoryTheory.MorphismProperty (CategoryTheory.Over S) :=
  (covariantCofibrations S ⊓ covariantEquivalences S).rlp

/-- `f ↦ f^op`, `SSet/S ⥤ SSet/S^op` (helper for README L2.6 *contravariant*). -/
abbrev opFunctor (S : SSet.{u}) :
    CategoryTheory.Over S ⥤ CategoryTheory.Over (_root_.SSet.opFunctor.obj S) :=
  CategoryTheory.Over.post _root_.SSet.opFunctor

/-- Contravariant equivalences, README L2.6 (`HTT.2.1.4.8/after`,
`SSet.Over.IsContravariantEquivalence`): `f^op` is a covariant equivalence over `S^op`. -/
def IsContravariantEquivalence {S : SSet.{u}} {X Y : CategoryTheory.Over S} (f : X ⟶ Y) : Prop :=
  IsCovariantEquivalence ((opFunctor S).map f)

/-- `SSet/S` with the covariant model structure, README L2.6 (`HTT.2.1.4.8/after`,
`SSet.Over.Covariant`; HTT 2.1.4.7). -/
def Covariant (S : SSet.{u}) : Type (u + 1) := CategoryTheory.Over S

/-- `SSet/S` with the contravariant model structure, README L2.6 (`SSet.Over.Contravariant`; HTT
2.1.4.12). -/
def Contravariant (S : SSet.{u}) : Type (u + 1) := CategoryTheory.Over S

instance (S : SSet.{u}) : Category (Covariant S) := inferInstanceAs (Category (CategoryTheory.Over S))

instance (S : SSet.{u}) : Category (Contravariant S) :=
  inferInstanceAs (Category (CategoryTheory.Over S))

/-- The covariant model structure, README L2.6 (HTT 2.1.4.7). -/
instance (S : SSet.{u}) : ModelCategory (Covariant S) where
  categoryWithWeakEquivalences := ⟨covariantEquivalences S⟩
  categoryWithCofibrations := ⟨covariantCofibrations S⟩
  categoryWithFibrations := ⟨covariantFibrations S⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The contravariant model structure, README L2.6 (`HTT.2.1.4.8/after`; HTT Remark 2.1.4.12):
equivalences and fibrations those whose opposites are covariant. -/
instance (S : SSet.{u}) : ModelCategory (Contravariant S) where
  categoryWithWeakEquivalences := ⟨fun _ _ f ↦ IsContravariantEquivalence f⟩
  categoryWithCofibrations := ⟨covariantCofibrations S⟩
  categoryWithFibrations := ⟨(covariantFibrations _).inverseImage (opFunctor S)⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The bridge `Over S ≌ Covariant S` (identities), README Conventions *Model structures on one
category* and L2.6 (`SSet.Over.Covariant.equivalence`). -/
def Covariant.equivalence (S : SSet.{u}) : CategoryTheory.Over S ≌ Covariant S := CategoryTheory.Equivalence.refl

/-- The bridge `Over S ≌ Contravariant S` (identities), README Conventions and L2.6
(`SSet.Over.Contravariant.equivalence`). -/
def Contravariant.equivalence (S : SSet.{u}) : CategoryTheory.Over S ≌ Contravariant S :=
  CategoryTheory.Equivalence.refl

/-- Transport lemma, README L2.6 (HTT 2.1.4.7). -/
theorem Covariant.weakEquivalences_eq (S : SSet.{u}) :
    (weakEquivalences (Covariant S)).inverseImage (Covariant.equivalence S).functor =
      covariantEquivalences S := rfl

/-- Transport lemma, README L2.6 (HTT 2.1.4.7). -/
theorem Covariant.cofibrations_eq (S : SSet.{u}) :
    (cofibrations (Covariant S)).inverseImage (Covariant.equivalence S).functor =
      covariantCofibrations S := rfl

/-- Transport lemma, README L2.6 (HTT 2.1.4.7). -/
theorem Covariant.fibrations_eq (S : SSet.{u}) :
    (fibrations (Covariant S)).inverseImage (Covariant.equivalence S).functor =
      covariantFibrations S := rfl

/-- Transport lemma, README L2.6 (`HTT.2.1.4.8/after`). -/
theorem Contravariant.weakEquivalences_eq (S : SSet.{u}) :
    (weakEquivalences (Contravariant S)).inverseImage (Contravariant.equivalence S).functor =
      fun _ _ f ↦ IsContravariantEquivalence f := rfl

/-- Transport lemma, README L2.6 (`HTT.2.1.4.8/after`). -/
theorem Contravariant.cofibrations_eq (S : SSet.{u}) :
    (cofibrations (Contravariant S)).inverseImage (Contravariant.equivalence S).functor =
      covariantCofibrations S := rfl

/-- Transport lemma, README L2.6 (`HTT.2.1.4.8/after`). -/
theorem Contravariant.fibrations_eq (S : SSet.{u}) :
    (fibrations (Contravariant S)).inverseImage (Contravariant.equivalence S).functor =
      (covariantFibrations _).inverseImage (opFunctor S) := rfl

/-- *(added)* A statement mixing two structures through the bridge, README L2.6 *The covariant
model structure*, Checks: over `Δ[0]` the covariantly fibrant objects are the Kan–Quillen fibrant
objects (the Kan complexes; HTT 2.1.4.9 with the dual of 2.2.3.12). -/
theorem Covariant.isFibrant_iff_isFibrant (X : SSet.{u}) :
    IsFibrant ((Covariant.equivalence Δ[0]).functor.obj
      (CategoryTheory.Over.mk (stdSimplex.isTerminalObj₀.from X))) ↔ IsFibrant X := by
  sorry

end Over

/-- Straightening `St_φ : SSet/S ⥤ SSet^C`, README L2.8 (`HTT.2.2.1/intro`, `SSet.straighten`;
HTT §2.2.1): `c ↦ Map_M(c, v)` with `M = C[X^▷] ⊔_{C[X]} Cᵒᵖ`, for a simplicial functor
`φ : C[S] ⟶ Cᵒᵖ`. -/
def straighten {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    CategoryTheory.Over S ⥤ HomotopicalAlgebra.EnrichedDiagram SSet.{u} C SSet.{u} := sorry

/-- Unstraightening `Un_φ`, the right adjoint of `straighten φ` (README L2.8, HTT §2.2.1). -/
def unstraighten {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    HomotopicalAlgebra.EnrichedDiagram SSet.{u} C SSet.{u} ⥤ CategoryTheory.Over S := sorry

/-- `St_φ ⊣ Un_φ` (README L2.8, `SSet.straightenAdjunction`). -/
def straightenAdjunction {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) : straighten φ ⊣ unstraighten φ := sorry

/-- Pointwise equivalences of right fibrations, README L2.8
(`SSet.RightFibration.IsPointwiseEquivalence`; HTT Definition 2.2.3.2): every fibre map is a
homotopy equivalence. -/
def RightFibration.IsPointwiseEquivalence {S : SSet.{u}} {X Y : CategoryTheory.Over S}
    [SSet.RightFibration X.hom] [SSet.RightFibration Y.hom] (f : X ⟶ Y) : Prop :=
  ∀ s : S _⦋0⦌, IsHomotopyEquivalence (pullback.map X.hom (yonedaEquiv.symm s) Y.hom
    (yonedaEquiv.symm s) f.left (𝟙 _) (𝟙 S) sorry sorry)

/-- The cosimplicial object `Q^•`, README L2.8 *The cosimplicial object `Q^•`*
(`SSet.cosimplicialQ`; `HTT.2.2.2.7/construction`, HTT §2.2.2): `Q^n = Map_{C[J^n]}(x, y)` by the
mapping-object formula. -/
def cosimplicialQ : SimplexCategory ⥤ SSet.{u} := sorry

/-- The twisted realization `|−|_Q`, the left Kan extension of `Q^•` along the Yoneda embedding
(README L2.8, `SSet.realizeQ`; HTT §2.2.2). -/
def realizeQ : SSet.{u} ⥤ SSet.{u} := sorry

/-- `Sing_Q`, with n-simplices the maps `Q^n ⟶ X` (README L2.8, `SSet.singQ`; HTT §2.2.2). -/
def singQ : SSet.{u} ⥤ SSet.{u} := sorry

/-- `|−|_Q ⊣ Sing_Q` (README L2.8 *The cosimplicial object `Q^•`*, HTT §2.2.2). -/
def realizeQAdjunction : realizeQ.{u} ⊣ singQ.{u} := sorry

/-! ### L3 Inner and Cartesian fibrations -/

/-- The vertex `{i}` of `Δ[1]` (helper). -/
abbrev vertexΔ1 (i : Fin 2) : Δ[0] ⟶ Δ[1] := yonedaEquiv.symm ((stdSimplex.obj₀Equiv (n := 1)).symm i)

/-- Correspondences, README L3.1 (`SSet.Correspondence`; HTT Definition 2.3.1.3): an ∞-category
`M ⟶ Δ[1]` with fibres identified with `C` and `C'`. -/
structure Correspondence (C C' : SSet.{u}) [Quasicategory C] [Quasicategory C'] where
  M : SSet.{u}
  [quasicategory : Quasicategory M]
  F : M ⟶ Δ[1]
  fibreZero : pullback F (vertexΔ1 0) ≅ C
  fibreOne : pullback F (vertexΔ1 1) ≅ C'

/-- The fibre of `Fun(B, X) ⟶ Fun(A, X) × Fun(B, S)` over `(a, b)` (helper for README L3.3). -/
def relOverFibre {A B X S : SSet.{u}} (i : A ⟶ B) (p : X ⟶ S) (a : A ⟶ X) (b : B ⟶ S) :
    ((ihom B).obj X).Subcomplex :=
  (Subcomplex.ofSimplex (n := 0) (X := (ihom A).obj X ⊗ (ihom B).obj S)
    (ihomVertexEquiv.symm a, ihomVertexEquiv.symm b)).preimage
      (lift ((MonoidalClosed.pre i).app X) ((ihom B).map p))

/-- The vertex of `relOverFibre` named by `f` (helper for README L3.3). -/
def relOverFibre.vertex {A B X S : SSet.{u}} (i : A ⟶ B) (p : X ⟶ S) {a : A ⟶ X} {b : B ⟶ S}
    (f : B ⟶ X) (_h₁ : i ≫ f = a) (_h₂ : f ≫ p = b) : (relOverFibre i p a b : SSet.{u}) _⦋0⦌ :=
  ⟨ihomVertexEquiv.symm f, sorry⟩

/-- Homotopy relative to `A` over `S`, README L3.3 (`HTT.2.3.3/intro`, `SSet.HomotopicRelOver`):
the vertices named by `f` and `f'` of the fibre of `Fun(B, X) ⟶ Fun(A, X) ×_{Fun(A, S)} Fun(B, S)`
are joined by an equivalence of the fibre. -/
def HomotopicRelOver {A B X S : SSet.{u}} (i : A ⟶ B) (p : X ⟶ S) (f f' : B ⟶ X)
    (hi : i ≫ f = i ≫ f') (hp : f ≫ p = f' ≫ p) : Prop :=
  ∃ e : Edge (relOverFibre.vertex i p f rfl rfl) (relOverFibre.vertex i p f' hi.symm hp.symm),
    Edge.IsEquivalence e

/-- Minimal inner fibrations, README L3.3 (`SSet.IsMinimal`; HTT Definition 2.3.3.1). -/
def IsMinimal {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p] : Prop :=
  ∀ (n : ℕ) (f f' : Δ[n] ⟶ X) (hi : (∂Δ[n]).ι ≫ f = (∂Δ[n]).ι ≫ f') (hp : f ≫ p = f' ≫ p),
    HomotopicRelOver (∂Δ[n]).ι p f f' hi hp → f = f'

/-- A quasicategory's map to `Δ[0]` is an inner fibration (helper). -/
instance innerFibration_toΔ0 (C : SSet.{u}) [Quasicategory C] :
    InnerFibration (stdSimplex.isTerminalObj₀.from C) := sorry

/-- Minimal ∞-categories, README L3.3 (`SSet.Quasicategory.IsMinimal`; HTT 2.3.3.1). -/
def Quasicategory.IsMinimal (C : SSet.{u}) [Quasicategory C] : Prop :=
  TauCetiRoadmap.HigherToposTheory.SSet.IsMinimal (stdSimplex.isTerminalObj₀.from C)

/-- n-categories, README L3.4 (`SSet.IsNCategory`; HTT Definition 2.3.4.1), for `−1 ≤ n`. -/
structure IsNCategory (n : ℤ) (C : SSet.{u}) : Prop extends Quasicategory C where
  eq_of_homotopicRelOver : 0 ≤ n → ∀ (f f' : Δ[n.toNat] ⟶ C)
    (hi : (∂Δ[n.toNat]).ι ≫ f = (∂Δ[n.toNat]).ι ≫ f') (hp : f ≫ terminal.from C = f' ≫ terminal.from C),
      HomotopicRelOver (∂Δ[n.toNat]).ι (terminal.from C) f f' hi hp → f = f'
  eq_of_boundary (m : ℕ) : n < m → ∀ f f' : Δ[m] ⟶ C, (∂Δ[m]).ι ≫ f = (∂Δ[m]).ι ≫ f' → f = f'

/-- The homotopy n-category `h_n C`, README L3.4 *The homotopy n-category*
(`SSet.homotopyNCategory`; `HTT.2.3.4.12/construction`, HTT Proposition 2.3.4.12), for `1 ≤ n`: its
m-simplices are the maps `Δ[m] ⟶ C` up to homotopy relative to the (n − 1)-skeleton. -/
def homotopyNCategory (n : ℕ) (C : SSet.{u}) [Quasicategory C] : SSet.{u} := sorry

/-- The map `θ : C ⟶ h_n C` (README L3.4, HTT 2.3.4.12). -/
def homotopyNCategory.θ (n : ℕ) (C : SSet.{u}) [Quasicategory C] : C ⟶ homotopyNCategory n C :=
  sorry

/-- The restriction map of coslices, README L3.5 (`SSet.coslice.restrictionMap`, the dual of
`SSet.slice.restrictionMap`): `X_{σ/} ⟶ X_{i ≫ σ/} ×_{S_{i ≫ σ ≫ p/}} S_{σ ≫ p/}`. -/
noncomputable def coslice.restrictionMap {K L X S : SSet.{u}} (i : L ⟶ K) (p : X ⟶ S)
    (σ : K ⟶ X) :
    coslice σ ⟶ Limits.pullback (coslice.map (𝟙 L) p (by simp) : coslice (i ≫ σ) ⟶ coslice (i ≫ σ ≫ p))
      (coslice.map i (𝟙 S) (by simp) : coslice (σ ≫ p) ⟶ coslice (i ≫ σ ≫ p)) :=
  sorry

/-- p-coCartesian edges, README L3.5 (`HTT.2.4.1.7/after`, `SSet.Edge.IsCocartesian`): the restriction
map of coslices at the source vertex is a trivial fibration. -/
def Edge.IsCocartesian {X S : SSet.{u}} {x y : X _⦋0⦌} (f : SSet.Edge x y) (p : X ⟶ S) : Prop :=
  (MorphismProperty.monomorphisms SSet.{u}).rlp
    (coslice.restrictionMap (stdSimplex.δ 1) p (yonedaEquiv.symm f.edge))

/-- coCartesian edges are the `p^op`-Cartesian edges of `X^op`, README L3.5. -/
theorem Edge.isCocartesian_iff_isCartesian_op {X S : SSet.{u}} {x y : X _⦋0⦌}
    (f : SSet.Edge x y) (p : X ⟶ S) :
    SSet.Edge.IsCocartesian f p ↔ SSet.Edge.IsCartesian (Edge.mk' (X := X.op) (opObjEquiv.symm f.edge))
      (_root_.SSet.opFunctor.map p) :=
  sorry

/-- Locally p-Cartesian edges, README L3.5 (`SSet.Edge.IsLocallyCartesian`; HTT Definition 2.4.1.11):
Cartesian for the pullback of `p` along the edge `p(e)`. -/
def Edge.IsLocallyCartesian {X S : SSet.{u}} {x y : X _⦋0⦌} (e : Edge x y) (p : X ⟶ S) : Prop :=
  SSet.Edge.IsCartesian
    (Edge.mk' (yonedaEquiv (pullback.lift (yonedaEquiv.symm e.edge) (𝟙 Δ[1]) sorry :
      Δ[1] ⟶ pullback p (yonedaEquiv.symm (e.map p).edge))))
    (pullback.snd p (yonedaEquiv.symm (e.map p).edge))

/-- coCartesian fibrations, README L3.6 (`SSet.CocartesianFibration`; HTT Definition 2.4.2.1). -/
abbrev CocartesianFibration {X S : SSet.{u}} (p : X ⟶ S) : Prop :=
  SSet.CartesianFibration (_root_.SSet.opFunctor.map p)

/-- Locally Cartesian fibrations, README L3.6 (`SSet.LocallyCartesianFibration`; HTT Definition
2.4.2.6). -/
class LocallyCartesianFibration {X S : SSet.{u}} (p : X ⟶ S) : Prop extends InnerFibration p where
  cartesianFibration_pullback (e : Δ[1] ⟶ S) :
    SSet.CartesianFibration (pullback.snd p e)

/-- Bifibrations, README L3.9 (`SSet.Bifibration`; HTT Definition 2.4.7.2): `Λ[n, 0]`-fillers over
simplices whose `T`-component sends `Δ^{0,1}` to a degenerate edge, and `Λ[n, n]`-fillers over
simplices whose `S`-component sends `Δ^{n−1,n}` to a degenerate edge, for `n ≥ 1`. -/
class Bifibration {X S T : SSet.{u}} (p : X ⟶ S ⊗ T) : Prop extends InnerFibration p where
  exists_lift_left (n : ℕ) (σ₀ : (Λ[n + 1, 0] : SSet) ⟶ X) (f : Δ[n + 1] ⟶ S ⊗ T) :
    σ₀ ≫ p = Λ[n + 1, 0].ι ≫ f →
    (f ≫ snd S T).app _ (stdSimplex.edge (n + 1) 0 1 (Fin.zero_le _)) ∈ T.degenerate 1 →
    ∃ σ : Δ[n + 1] ⟶ X, Λ[n + 1, 0].ι ≫ σ = σ₀ ∧ σ ≫ p = f
  exists_lift_right (n : ℕ) (σ₀ : (Λ[n + 1, Fin.last (n + 1)] : SSet) ⟶ X)
    (f : Δ[n + 1] ⟶ S ⊗ T) : σ₀ ≫ p = Λ[n + 1, Fin.last (n + 1)].ι ≫ f →
    (f ≫ fst S T).app _ (stdSimplex.edge (n + 1) (Fin.last n).castSucc (Fin.last (n + 1))
      (Fin.castSucc_lt_last _).le) ∈ S.degenerate 1 →
    ∃ σ : Δ[n + 1] ⟶ X, Λ[n + 1, Fin.last (n + 1)].ι ≫ σ = σ₀ ∧ σ ≫ p = f

/-- `SSet` with the Joyal model structure, README L3.8 *The Joyal model structure* (`SSet.Joyal`;
HTT Theorem 2.2.5.1). -/
def Joyal : Type (u + 1) := SSet.{u}

instance : Category Joyal.{u} := inferInstanceAs (Category SSet.{u})

/-- The Joyal model structure, README L3.8 (HTT 2.2.5.1): categorical equivalences, monomorphisms,
categorical fibrations. -/
instance : ModelCategory Joyal.{u} where
  categoryWithWeakEquivalences := ⟨fun X Y f ↦ IsCategoricalEquivalence (S := X) (T := Y) f⟩
  categoryWithCofibrations := ⟨CategoryTheory.MorphismProperty.monomorphisms SSet.{u}⟩
  categoryWithFibrations := ⟨fun X Y f ↦ CategoricalFibration (X := X) (Y := Y) f⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The bridge `SSet ≌ SSet.Joyal` (identities), README Conventions *Model structures on one
category* and L3.8 (`SSet.Joyal.equivalence`). -/
def Joyal.equivalence : SSet.{u} ≌ Joyal.{u} := CategoryTheory.Equivalence.refl

/-- Transport lemma, README L3.8 (HTT 2.2.5.1): the Joyal weak equivalences are the categorical
equivalences. -/
theorem Joyal.weakEquivalences_eq :
    (weakEquivalences Joyal.{u}).inverseImage Joyal.equivalence.functor =
      fun _ _ f ↦ IsCategoricalEquivalence f := rfl

/-- Transport lemma, README L3.8 (HTT 2.2.5.1): the Joyal cofibrations are the monomorphisms. -/
theorem Joyal.cofibrations_eq :
    (cofibrations Joyal.{u}).inverseImage Joyal.equivalence.functor =
      CategoryTheory.MorphismProperty.monomorphisms SSet.{u} := rfl

/-- Transport lemma, README L3.8 (`HTT.2.2.5/categorical-fibration`): the Joyal fibrations are the
categorical fibrations. -/
theorem Joyal.fibrations_eq :
    (fibrations Joyal.{u}).inverseImage Joyal.equivalence.functor =
      fun _ _ f ↦ CategoricalFibration f := rfl

/-- *(added)* A statement mixing two structures through the bridge, README L5.1 *Limits in `S`*,
proof route (HTT 3.3.3.3: Kan–Quillen is a left Bousfield localization of Joyal): the identity
`SSet.Joyal ⥤ SSet` sends categorical equivalences to Kan–Quillen weak equivalences. -/
theorem Joyal.weakEquivalence_inverse_map {X Y : Joyal.{u}} (f : X ⟶ Y) [WeakEquivalence f] :
    WeakEquivalence (Joyal.equivalence.inverse.map f) := by
  sorry

/-- *(added)* A statement mixing two structures through the bridge, README L3.8 *Fibrant objects of
the Joyal model structure*, Checks: Kan–Quillen fibrant objects (Kan complexes) are Joyal
fibrant. -/
theorem Joyal.isFibrant_functor_obj {X : SSet.{u}} (_hX : IsFibrant X) :
    IsFibrant (Joyal.equivalence.functor.obj X) := by
  sorry

end SSet

/-! ### L4 Marked simplicial sets and straightening -/

namespace SSet

open _root_.SSet

/-- The mapping simplex `M(φ)`, README L4.5 (`SSet.mappingSimplex`; `HTT.3.2.2/intro`, Remark 3.2.2.5):
m-simplices pairs `(f, σ)` with `f : Fin (m + 1) →o Fin (n + 1)` and `σ` an m-simplex of
`φ (f (last m))`; along `p` the pair goes to `(f ∘ p, e ∘ σ ∘ p)`. -/
def mappingSimplex {n : ℕ}
    (φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}) : SSet.{u} := sorry

/-- The simplices of the mapping simplex (README L4.5, HTT §3.2.2). -/
def mappingSimplex.objEquiv {n : ℕ}
    (φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}) {m : ℕ} :
    (mappingSimplex φ) _⦋m⦌ ≃
      Σ f : Fin (m + 1) →o Fin (n + 1), (φ.obj (op (f (Fin.last m)))) _⦋m⦌ := sorry

/-- `M(φ) ⟶ Δ[n]` (README L4.5, `SSet.mappingSimplex.π`). -/
def mappingSimplex.π {n : ℕ}
    (φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}) :
    mappingSimplex φ ⟶ Δ[n] := sorry

/-- The inclusion of the fibre `A_i` of `M(φ)` over `i` (README L4.5). -/
def mappingSimplex.fibreι {n : ℕ}
    (φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}) (i : Fin (n + 1)) :
    φ.obj (op i) ⟶ mappingSimplex φ := sorry

end SSet

namespace TauCeti.MarkedSSet

open _root_.SSet _root_.TauCeti.MarkedSSet TauCetiRoadmap.HigherToposTheory.TauCeti.MarkedSSet

/-- `(Set⁺_Δ)/S`, README L4.2 (`TauCeti.MarkedSSet.Over`; HTT Notation 3.1.0.2). -/
abbrev Over (S : SSet.{u}) : Type (u + 1) := CategoryTheory.Over (sharp.obj S)

/-- `X^♮`, README L4.2 (`TauCeti.MarkedSSet.natural`; HTT Definition 3.1.1.8): `X` marked at its
p-Cartesian edges. -/
def natural {X S : SSet.{u}} (p : X ⟶ S) [CartesianFibration p] : MarkedSSet.{u} where
  toSSet := X
  marked := {e | Edge.IsCartesian (Edge.mk' e) p}
  σ_mem_marked := sorry

/-- `X^♮` as an object of `(Set⁺_Δ)/S` (README L4.2, HTT 3.1.1.8). -/
def natural.over {X S : SSet.{u}} (p : X ⟶ S) [CartesianFibration p] : Over S :=
  CategoryTheory.Over.mk (toSharp (X := natural p) p)

/-- Cofibrations of marked simplicial sets, README L4.3 (`TauCeti.MarkedSSet.cofibrations`; HTT
Definition 3.1.2.2): monomorphisms on underlying simplicial sets. -/
def cofibrations : CategoryTheory.MorphismProperty MarkedSSet.{u} := fun _ _ f ↦ Mono (Hom.hom f)

/-- Cofibrations of `(Set⁺_Δ)/S` (README L4.3, HTT 3.1.2.2). -/
def cofibrationsOver (S : SSet.{u}) : CategoryTheory.MorphismProperty (Over S) :=
  cofibrations.inverseImage (CategoryTheory.Over.forget _)

/-- The Cartesian closed structure of `Set⁺_Δ`, README L4.3 *Marked mapping objects* (HTT §3.1.3). -/
instance monoidalClosed : MonoidalClosed MarkedSSet.{u} := sorry

/-- `Map^♭_S(X, Y)`, README L4.3 (`TauCeti.MarkedSSet.mapFlatOver`; `HTT.3.1.3/intro`): n-simplices
the maps `Δ[n]^♭ × X ⟶ Y` over S. -/
def mapFlatOver {S : SSet.{u}} (X Y : Over S) : SSet.{u} := sorry

/-- The simplices of `Map^♭_S(X, Y)` (README L4.3). -/
def mapFlatOver.objEquiv {S : SSet.{u}} (X Y : Over S) {n : ℕ} :
    (mapFlatOver X Y) _⦋n⦌ ≃
      {g : flat.obj Δ[n] ⊗ X.left ⟶ Y.left // g ≫ Y.hom = CartesianMonoidalCategory.snd _ _ ≫ X.hom} :=
  sorry

/-- `Map^♯_S(X, Y)`, README L4.3 (`TauCeti.MarkedSSet.mapSharpOver`; `HTT.3.1.3/intro`):
n-simplices the maps `Δ[n]^♯ × X ⟶ Y` over S. -/
def mapSharpOver {S : SSet.{u}} (X Y : Over S) : SSet.{u} := sorry

/-- The simplices of `Map^♯_S(X, Y)` (README L4.3). -/
def mapSharpOver.objEquiv {S : SSet.{u}} (X Y : Over S) {n : ℕ} :
    (mapSharpOver X Y) _⦋n⦌ ≃
      {g : sharp.obj Δ[n] ⊗ X.left ⟶ Y.left // g ≫ Y.hom = CartesianMonoidalCategory.snd _ _ ≫ X.hom} :=
  sorry

/-- Precomposition `Map^♯_S(Y, Z) ⟶ Map^♯_S(X, Z)` (README L4.3). -/
def mapSharpOver.precomp {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y) (Z : Over S) :
    mapSharpOver Y Z ⟶ mapSharpOver X Z := sorry

/-- Cartesian equivalences, README L4.3 (`TauCeti.MarkedSSet.IsCartesianEquivalence`;
`HTT.3.1.3.3/after`): precomposition is a homotopy equivalence on `Map^♯_S(−, Z^♮)` for every
Cartesian fibration `Z ⟶ S` in the universe of S. -/
def IsCartesianEquivalence {S : SSet.{u}} {X Y : Over S} (f : X ⟶ Y) : Prop :=
  ∀ (Z : SSet.{u}) (q : Z ⟶ S) [CartesianFibration q],
    SSet.IsHomotopyEquivalence (mapSharpOver.precomp f (natural.over q))

/-- The simplicial structure of `Set⁺_Δ` with `sHom X Y = Map^♯(X, Y)`, homed in README L4.3
*Simplicial model structure* (HTT Corollary 3.1.4.4, over `Δ[0]`). -/
instance : SimplicialCategory MarkedSSet.{u} := sorry

/-- `M^♮(φ)`, README L4.5 (`TauCeti.MarkedSSet.mappingSimplex`; HTT Notation 3.2.2.3): marked at the
edges whose component is degenerate. -/
def mappingSimplex {n : ℕ} (φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}) : MarkedSSet.{u} where
  toSSet := SSet.mappingSimplex φ
  marked := {e | (SSet.mappingSimplex.objEquiv φ e).2 ∈
    _root_.SSet.degenerate _ 1}
  σ_mem_marked := sorry

end TauCeti.MarkedSSet

namespace SSet

open _root_.SSet _root_.TauCeti _root_.TauCeti.MarkedSSet
  TauCetiRoadmap.HigherToposTheory.TauCeti.MarkedSSet

/-- Quasi-equivalences, README L4.5 (`SSet.IsQuasiEquivalence`; HTT Definition 3.2.2.6): over
`Δ[n]`, marked edges to p-Cartesian edges, and categorical equivalences of fibres. -/
def IsQuasiEquivalence {n : ℕ}
    {φ : (Fin (n + 1))ᵒᵖ ⥤ SSet.{u}} {X : SSet.{u}} (p : X ⟶ Δ[n]) [CartesianFibration p]
    (q : mappingSimplex φ ⟶ X) : Prop :=
  q ≫ p = mappingSimplex.π φ ∧
    (∀ e ∈ (TauCeti.MarkedSSet.mappingSimplex φ).marked, Edge.IsCartesian (Edge.mk' (q.app _ e)) p) ∧
    ∀ i : Fin (n + 1), IsCategoricalEquivalence (pullback.lift
      (mappingSimplex.fibreι φ i ≫ q)
      (stdSimplex.isTerminalObj₀.from _) sorry :
        φ.obj (op i) ⟶ pullback p (yonedaEquiv.symm ((stdSimplex.obj₀Equiv (n := n)).symm i)))

/-- The marked straightening `St⁺_φ`, README L4.4 (`SSet.markedStraightening`; `HTT.3.2.1/intro`,
Definition 3.2.1.2), for a simplicial functor `φ : C[S] ⟶ Cᵒᵖ`. -/
def markedStraightening {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    TauCeti.MarkedSSet.Over S ⥤ HomotopicalAlgebra.EnrichedDiagram SSet.{u} C MarkedSSet.{u} :=
  sorry

/-- The marked unstraightening `Un⁺_φ`, README L4.4 (`SSet.markedUnstraightening`; HTT Notation
3.2.1.6). -/
def markedUnstraightening {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    HomotopicalAlgebra.EnrichedDiagram SSet.{u} C MarkedSSet.{u} ⥤ TauCeti.MarkedSSet.Over S :=
  sorry

/-- `St⁺_φ ⊣ Un⁺_φ` (README L4.4, HTT 3.2.1.4). -/
def markedStraighteningAdjunction {S : SSet.{u}} {C : Type u} [Category.{u} C]
    [SimplicialCategory C] (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    markedStraightening φ ⊣ markedUnstraightening φ := sorry

/-- The J-simplices of the relative nerve, README L4.6 (HTT Definition 3.2.5.2): a functor
`σ : Fin (m + 1) ⥤ C` with `τ(J') : Δ^{J'} ⟶ f(σ(max J'))` for every nonempty `J' ⊆ [m]` (given as
an order embedding `Fin (k + 1) ↪o Fin (m + 1)`), compatible along `J'' ⊆ J'`. -/
structure RelativeNerveSimplex {C : Type u} [SmallCategory C] (f : C ⥤ SSet.{u}) (m : ℕ) where
  σ : Fin (m + 1) ⥤ C
  τ {k : ℕ} (ι : Fin (k + 1) ↪o Fin (m + 1)) : Δ[k] ⟶ f.obj (σ.obj (ι (Fin.last k)))
  compat {k k' : ℕ} (ι : Fin (k + 1) ↪o Fin (m + 1)) (ι' : Fin (k' + 1) ↪o Fin (k + 1)) :
    SSet.stdSimplex.map (SimplexCategory.mkHom ι'.toOrderHom) ≫ τ ι =
      τ (ι'.trans ι) ≫ f.map (σ.map (homOfLE (ι.monotone (Fin.le_last _))))

/-- The relative nerve `N_f(C)`, README L4.6 (`SSet.relativeNerve`; HTT Definition 3.2.5.2). -/
def relativeNerve {C : Type u} [SmallCategory C] (f : C ⥤ SSet.{u}) : SSet.{u} := sorry

/-- The simplices of `N_f(C)` (README L4.6, HTT 3.2.5.2). -/
def relativeNerve.objEquiv {C : Type u} [SmallCategory C] (f : C ⥤ SSet.{u}) {m : ℕ} :
    (relativeNerve f) _⦋m⦌ ≃ RelativeNerveSimplex f m := sorry

/-- `N_f(C) ⟶ N(C)` (README L4.6). -/
def relativeNerve.π {C : Type u} [SmallCategory C] (f : C ⥤ SSet.{u}) :
    relativeNerve f ⟶ nerve C := sorry

/-- `f ↦ N_f(C)`, README L4.6 (`SSet.relativeNerveFunctor`; HTT 3.2.5.2). -/
def relativeNerveFunctor (C : Type u) [SmallCategory C] :
    (C ⥤ SSet.{u}) ⥤ CategoryTheory.Over (nerve C) := sorry

/-- `X ↦ F_X(C)`, the left adjoint of `relativeNerveFunctor C` (README L4.6, HTT 3.2.5.5). -/
def relativeNerveLeftAdjoint (C : Type u) [SmallCategory C] :
    CategoryTheory.Over (nerve C) ⥤ (C ⥤ SSet.{u}) := sorry

/-- `F_•(C) ⊣ N_•(C)` (README L4.6, HTT 3.2.5.5). -/
def relativeNerveAdjunction (C : Type u) [SmallCategory C] :
    relativeNerveLeftAdjoint C ⊣ relativeNerveFunctor C := sorry

/-- The total space of the universal Cartesian fibration (README L4.7, `SSet.universalCartesian`;
`HTT.3.3.2/intro`). -/
def universalCartesian : SSet.{u + 1} := sorry

/-- The universal Cartesian fibration `universalCartesian ⟶ Cat∞^op`, README L4.7
(`SSet.universalCartesianFibration`; `HTT.3.3.2/intro`): `Un⁺_φ` of `C ↦ C^♮`. -/
def universalCartesianFibration : universalCartesian.{u} ⟶ catInfty.{u}.op := sorry

/-- The universal Cartesian fibration is a Cartesian fibration, and so are its pullbacks (README
L4.7; HTT §3.3.2). -/
instance {S : SSet.{u + 1}} (f : S ⟶ catInfty.{u}.op) :
    CartesianFibration (pullback.snd universalCartesianFibration.{u} f) := sorry

/-- Classifying maps, README L4.7 (`SSet.ClassifiesCartesianFibration`; HTT Definition 3.3.2.2),
at the large base: a Cartesian equivalence `X^♮ ⟶ (pullback of the universal fibration)^♮`
over `S^♯`. -/
def ClassifiesCartesianFibration {X S : SSet.{u + 1}} (p : X ⟶ S) [CartesianFibration p]
    (f : S ⟶ catInfty.{u}.op) : Prop :=
  ∃ g : TauCeti.MarkedSSet.natural.over p ⟶
      TauCeti.MarkedSSet.natural.over (pullback.snd universalCartesianFibration f),
    TauCeti.MarkedSSet.IsCartesianEquivalence g

/-- The coCartesian form, README L4.7 (HTT 3.3.2.2): `f : S ⟶ Cat∞` classifies a coCartesian `p`
when `f^op` classifies `p^op`. -/
def ClassifiesCocartesianFibration {X S : SSet.{u + 1}} (p : X ⟶ S) [CocartesianFibration p]
    (f : S ⟶ catInfty.{u}) : Prop :=
  ClassifiesCartesianFibration (_root_.SSet.opFunctor.map p) (_root_.SSet.opFunctor.map f)

end SSet

namespace TauCeti.MarkedSSet

open _root_.SSet _root_.TauCeti.MarkedSSet TauCetiRoadmap.HigherToposTheory.TauCeti.MarkedSSet

/-- The marked relative nerve `N⁺_F(C)`, README L4.6 (`TauCeti.MarkedSSet.relativeNerve`; HTT
Definition 3.2.5.12): an edge is marked when its component in `F(σ 1)` is marked. -/
def relativeNerve {C : Type u} [SmallCategory C] (F : C ⥤ MarkedSSet.{u}) : MarkedSSet.{u} where
  toSSet := TauCetiRoadmap.HigherToposTheory.SSet.relativeNerve (F ⋙ forget)
  marked := {e | let s := TauCetiRoadmap.HigherToposTheory.SSet.relativeNerve.objEquiv _ e
    yonedaEquiv (s.τ ((OrderIso.refl (Fin 2)).toOrderEmbedding)) ∈ (F.obj (s.σ.obj (Fin.last 1))).marked}
  σ_mem_marked := sorry

end TauCeti.MarkedSSet

/-! ## Extension 2: layers L5, L6, L7, L8

Prototypes of the Definition, Notation and prose-definition targets of L5 (limits, colimits and
Kan extensions), L6 (presheaves, adjunctions, inductive limits, groupoid objects) and L7
(accessible and presentable ∞-categories) that the sections above do not declare; L8 has no such
target. A few supporting targets of other layers that these need (`SSet.KanComplex.IsTruncated`
of F2.5, `SSet.subcategory` of L1.3, `SSet.Over.IsCovariantEquivalence` of L2.6,
`SSet.Edge.IsCocartesian` and `SSet.CocartesianFibration` of L3.5–L3.6) are prototyped in the
subsection *Supporting targets of other layers*, following their README *Lean:* lines. -/

/-! ### Tau Ceti declarations postdating the pin (Extension 2)

Local copies of Tau Ceti main declarations not yet present at the pinned revision (`2fd255d`). -/

namespace SSet

open _root_.SSet

/-- Local copy of Tau Ceti `SSet.fiber` (`TauCeti/AlgebraicTopology/SimplicialSet/Fiber.lean`): the
fibre of `q` over a vertex, the simplices sent to degeneracies of `y`. -/
def fiber {X Y : SSet.{u}} (q : X ⟶ Y) (y : Y _⦋0⦌) : X.Subcomplex :=
  (Subcomplex.ofSimplex y).preimage q

/-- Local copy of Tau Ceti `SSet.verticalEdge`
(`TauCeti/AlgebraicTopology/SimplicialSet/Homotopy.lean`): the edge `{v} × Δ[1]` of `X ⊗ Δ[1]`. -/
def verticalEdge {X : SSet.{u}} (v : X _⦋0⦌) : (X ⊗ Δ[1] : SSet.{u}) _⦋1⦌ :=
  (X.σ 0 v, stdSimplex.edge 1 0 1 (by decide))

end SSet

namespace SSet

open _root_.SSet

/-! ### Supporting targets of other layers (Extension 2) -/


/-- The subcomplex of `N(D)` of the simplices whose objects satisfy `P` and whose morphisms lie in
`W`; helper for `SSet.subcategory` (README L1.3 *Subcategories and full subcategories*). -/
def nerveSubcategory {D : Type u} [SmallCategory D] (P : ObjectProperty D)
    (W : MorphismProperty D) : (nerve D).Subcomplex where
  obj n := {s | (∀ i, P (s.obj i)) ∧ ∀ (i j : Fin (n.unop.len + 1)) (h : i ≤ j),
    W (s.map (homOfLE h))}
  map _ _ _ := sorry

/-- Subcategories of an ∞-category, README L1.3 *Subcategories and full subcategories*
(`SSet.subcategory`, propose; `HTT.1.2.11/intro`): the preimage of the nerve of the subcategory of
`hC` given by `P` and `W` under the unit `C ⟶ N(hC)`. -/
def subcategory (C : SSet.{u}) (P : ObjectProperty (hoFunctor.obj C))
    (W : MorphismProperty (hoFunctor.obj C)) [W.IsMultiplicative] : C.Subcomplex :=
  (nerveSubcategory P W).preimage (nerveAdjunction.unit.app C)


/-- The functoriality of `SSet.leftConeOf` in `Over S`, README L2.6 (`SSet.Over.leftConeOfFunctor`). -/
def Over.leftConeOfMap {S : SSet.{u}} {X Y : CategoryTheory.Over S} (f : X ⟶ Y) :
    leftConeOf X.hom ⟶ leftConeOf Y.hom :=
  pushout.map _ _ _ _ (𝟙 S) (join.map (𝟙 Δ[0]) f.left) f.left sorry sorry


/-! ### Helpers (Extension 2) -/

/-- The vertex of `Fun(Δ[1], C)` given by an edge of `C` (helper for classes of morphisms viewed
in `Fun(Δ[1], C)`). -/
def Edge.toArrowVertex {C : SSet.{u}} {x y : C _⦋0⦌} (e : Edge x y) : ((ihom Δ[1]).obj C) _⦋0⦌ :=
  ihomVertexEquiv.symm (yonedaEquiv.symm e.edge)

/-- The edge of `C` given by a vertex of `Fun(Δ[1], C)` (helper). -/
def arrowVertexEdge {C : SSet.{u}} (v : ((ihom Δ[1]).obj C) _⦋0⦌) :
    Edge (C.δ 1 (yonedaEquiv (ihomVertexEquiv v))) (C.δ 0 (yonedaEquiv (ihomVertexEquiv v))) :=
  Edge.mk' (yonedaEquiv (ihomVertexEquiv v))

/-- Classes of morphisms of an ∞-category, in Mathlib's `MorphismProperty` shape indexed by the
endpoints (README L6 *Factorization systems*). -/
abbrev EdgeClass (C : SSet.{u}) : Type u := ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop

/-- The class `[e] : 𝟙 ⟶ Map_S(x, y)` in `H` of an edge, through the identification of the
underlying category of `hS` with `hoFunctor.obj S` (README L1.5,
`SSet.hoEnriched.forgetEquivalence`); helper for the H-enriched conditions of L6 and L7. -/
def hoEnriched.edgeClass {S : SSet.{u}} {x y : S _⦋0⦌} (e : Edge x y) :
    𝟙_ SSet.H.{u} ⟶ mapH x y :=
  sorry

/-- Precomposition with `[e]`, `Map_S(y, z) ⟶ Map_S(x, z)` in `H` (helper). -/
def hoEnriched.precomp {S : SSet.{u}} {x y : S _⦋0⦌} (e : Edge x y) (z : S _⦋0⦌) :
    mapH y z ⟶ mapH x z :=
  (λ_ _).inv ≫ (hoEnriched.edgeClass e ▷ _) ≫
    eComp SSet.H.{u} (C := hoEnriched S) (x : hoEnriched S) (y : hoEnriched S) (z : hoEnriched S)

/-- The two vertices `0` and `1` of `Δ[1]` (helper). -/
abbrev Δ1vertex (i : Fin 2) : (Δ[1] : SSet.{u}) _⦋0⦌ := stdSimplex.obj₀Equiv.symm i

/-- The edge `{v} × Δ[1]` of a map `s : D ⊗ Δ[1] ⟶ M` (helper for associated functors, L6). -/
def cylinderEdge {D M : SSet.{u}} (s : D ⊗ Δ[1] ⟶ M) (v : D _⦋0⦌) :
    Edge (M.δ 1 (s.app _ (verticalEdge v))) (M.δ 0 (s.app _ (verticalEdge v))) :=
  Edge.mk' (s.app _ (verticalEdge v))

/-- The universe lift commutes with right cones (helper; the join commutes with `uliftFunctor`). -/
def rightCone.uliftIso (K : SSet.{u}) :
    uliftFunctor.{v}.obj (rightCone K) ≅ rightCone (uliftFunctor.{v}.obj K) := sorry

/-- The 1-morphism of `SSet.QCat` given by a map of quasicategories (helper). -/
def QCat.homMk {C D : SSet.{u}} [Quasicategory C] [Quasicategory D] (f : C ⟶ D) :
    (⟨C, inferInstance⟩ : SSet.QCat.{u}) ⟶ ⟨D, inferInstance⟩ :=
  ObjectProperty.homMk f

/-- `ℵ₀` is regular, as an instance (helper for the compact objects of L7). -/
instance fact_isRegular_aleph0 : Fact (ℵ₀ : Cardinal.{w}).IsRegular := ⟨Cardinal.isRegular_aleph0⟩

/-! ### L5.3: smooth maps -/

/-- Smooth maps, README L5.3 *Smooth maps* (`SSet.IsSmooth`; HTT Proposition 4.1.2.8 (1),
Definition 4.1.2.9): pulling back along any `B ⟶ Y` carries right anodyne maps `A ⟶ B` to right
anodyne maps `A ×_Y X ⟶ B ×_Y X`. -/
def IsSmooth {X Y : SSet.{u}} (p : X ⟶ Y) : Prop :=
  ∀ ⦃A B : SSet.{u}⦄ (g : B ⟶ Y) (i : A ⟶ B), rightAnodyneExtensions i →
    rightAnodyneExtensions
      (pullback.map (i ≫ g) p g p i (𝟙 X) (𝟙 Y) (by simp) (by simp))

/-! ### L5.5: fat joins and fat slices -/

/-- The first stage `X ⊔_{X × Y × {0}} (X × Y × Δ[1])` of the fat join (helper for README L5.5
*The fat join*). -/
abbrev fatJoinAux (X Y : SSet.{u}) : SSet.{u} := pushout (ι₀ : X ⊗ Y ⟶ (X ⊗ Y) ⊗ Δ[1]) (fst X Y)

/-- The fat join `X ⋄ Y = X ⊔_{X × Y × {0}} (X × Y × Δ[1]) ⊔_{X × Y × {1}} Y`, README L5.5 *The fat
join* (`SSet.fatJoin`; HTT Definition 4.2.1.1). -/
def fatJoin (X Y : SSet.{u}) : SSet.{u} :=
  pushout (ι₁ ≫ pushout.inl _ _ : X ⊗ Y ⟶ fatJoinAux X Y) (snd X Y)

/-- The inclusion `X ⟶ X ⋄ Y`, README L5.5 (HTT 4.2.1.1). -/
def fatJoin.inl (X Y : SSet.{u}) : X ⟶ fatJoin X Y := pushout.inr _ _ ≫ pushout.inl _ _

/-- The inclusion `Y ⟶ X ⋄ Y`, README L5.5 (HTT 4.2.1.1). -/
def fatJoin.inr (X Y : SSet.{u}) : Y ⟶ fatJoin X Y := pushout.inr _ _

/-- The projection `X ⋄ Y ⟶ Δ[1]`, README L5.5 (`SSet.fatJoin.toΔ1`; HTT 4.2.1.1). -/
def fatJoin.toΔ1 (X Y : SSet.{u}) : fatJoin X Y ⟶ Δ[1] :=
  pushout.desc (pushout.desc (snd _ _) (stdSimplex.isTerminalObj₀.from X ≫
    yonedaEquiv.symm (Δ1vertex 0)) sorry)
    (stdSimplex.isTerminalObj₀.from Y ≫ yonedaEquiv.symm (Δ1vertex 1)) sorry

/-- The comparison `X ⋄ Y ⟶ X ⋆ Y` over `Δ[1]`, the identity on X and Y, README L5.5
(`SSet.fatJoin.toJoin`; HTT 4.2.1.1). -/
def fatJoin.toJoin (X Y : SSet.{u}) : fatJoin X Y ⟶ join X Y := sorry

/-- The fat slice `C^{/p} = Fun(Δ[1], Fun(X, C)) ×_{Fun(X, C)²} (C × {p})`, README L5.5 *The fat
slice* (`SSet.fatSlice`, dual of HTT 4.2.1.5): cones `const_c ⟶ p`, through
`Fun(X × Δ[1], C) ≅ Fun(Δ[1], Fun(X, C))`. -/
def fatSlice {X C : SSet.{u}} (p : X ⟶ C) : SSet.{u} :=
  pullback (endpoints ((ihom X).obj C))
    (lift (MonoidalClosed.curry (snd X C))
      (stdSimplex.isTerminalObj₀.from C ≫ yonedaEquiv.symm (ihomVertexEquiv.symm p)))

/-! ### L5.5: the relative fat join -/

/-- The relative fat join `X ⋄_S Y = X ⊔_{X ×_S Y × {0}} (X ×_S Y × Δ[1]) ⊔_{X ×_S Y × {1}} Y`
over S, README L5.5 *The relative fat join and relative slices* (`SSet.Over.fibreJoin`; HTT
Definition 4.2.2.1). -/
def Over.fibreJoin {S : SSet.{u}} (X Y : CategoryTheory.Over S) : CategoryTheory.Over S :=
  CategoryTheory.Over.mk (Y := pushout
    (ι₁ ≫ pushout.inl _ _ : pullback X.hom Y.hom ⟶
      pushout (ι₀ : pullback X.hom Y.hom ⟶ pullback X.hom Y.hom ⊗ Δ[1]) (pullback.fst _ _))
    (pullback.snd X.hom Y.hom))
    (pushout.desc (pushout.desc (fst _ _ ≫ pullback.fst _ _ ≫ X.hom) X.hom sorry) Y.hom sorry)

/-- The functor `X ↦ (K ⟶ K ⋄_S X)` from `SSet/S` to `(SSet/S)_{K/}`, README L5.5 (HTT 4.2.2.1). -/
def Over.fibreJoinFunctor {S : SSet.{u}} (K : CategoryTheory.Over S) :
    CategoryTheory.Over S ⥤ CategoryTheory.Under K := sorry

/-- The relative fat coslice, as a functor `(SSet/S)_{K/} ⥤ SSet/S`, README L5.5
(`SSet.Over.fatCoslice`; HTT 4.2.2.1). -/
def Over.fatCosliceFunctor {S : SSet.{u}} (K : CategoryTheory.Over S) :
    CategoryTheory.Under K ⥤ CategoryTheory.Over S := sorry

/-- The relative fat coslice `Y^{p_S/}` of `p_S : K ⟶ Y` over S, README L5.5
(`SSet.Over.fatCoslice`; HTT 4.2.2.1). -/
def Over.fatCoslice {S : SSet.{u}} {K Y : CategoryTheory.Over S} (p : K ⟶ Y) :
    CategoryTheory.Over S :=
  (Over.fatCosliceFunctor K).obj (CategoryTheory.Under.mk p)

/-- The adjunction `(K ⋄_S −) ⊣ fatCoslice`, README L5.5 (HTT 4.2.2.1). -/
def Over.fibreJoinAdjunction {S : SSet.{u}} (K : CategoryTheory.Over S) :
    Over.fibreJoinFunctor K ⊣ Over.fatCosliceFunctor K := sorry

/-- Base change of the relative fat join along `T ⟶ S`, README L5.5 (HTT 4.2.2.1). -/
def Over.fibreJoin.baseChangeIso {S T : SSet.{u}} (f : T ⟶ S) (X Y : CategoryTheory.Over S) :
    (CategoryTheory.Over.pullback f).obj (Over.fibreJoin X Y) ≅
      Over.fibreJoin ((CategoryTheory.Over.pullback f).obj X)
        ((CategoryTheory.Over.pullback f).obj Y) := sorry

/-! ### L5.6: the decomposition simplicial set; colimit predicates -/

/-- The decomposition simplicial set `K_F`, README L5.6 *The decomposition simplicial set*
(`SSet.decompositionCylinder`; HTT Notation 4.2.3.1), for `F : I ⥤ SSet/K`, with the simplices
described there (a splitting of `[n]`, a simplex of K, a chain in I and compatible lifts). -/
def decompositionCylinder {K : SSet.{u}} {I : Type u} [SmallCategory I]
    (F : I ⥤ CategoryTheory.Over K) : SSet.{u} := sorry

/-- The projection `K_F ⟶ Δ[1]`, README L5.6 (`SSet.decompositionCylinder.toΔ1`; HTT 4.2.3.1). -/
def decompositionCylinder.toΔ1 {K : SSet.{u}} {I : Type u} [SmallCategory I]
    (F : I ⥤ CategoryTheory.Over K) : decompositionCylinder F ⟶ Δ[1] := sorry

/-- The inclusion `K ⟶ K_F` (the fibre over `0`), README L5.6 (HTT 4.2.3.1). -/
def decompositionCylinder.ιBase {K : SSet.{u}} {I : Type u} [SmallCategory I]
    (F : I ⥤ CategoryTheory.Over K) : K ⟶ decompositionCylinder F := sorry

/-- The inclusion `N(I) ⟶ K_F` (the fibre over `1`), README L5.6 (HTT 4.2.3.1). -/
def decompositionCylinder.ιNerve {K : SSet.{u}} {I : Type u} [SmallCategory I]
    (F : I ⥤ CategoryTheory.Over K) : nerve I ⟶ decompositionCylinder F := sorry

/-- The maps `K_I^▷ ⟶ K_F`, README L5.6 (HTT 4.2.3.1). -/
def decompositionCylinder.coneMap {K : SSet.{u}} {I : Type u} [SmallCategory I]
    (F : I ⥤ CategoryTheory.Over K) (i : I) :
    rightCone (F.obj i).left ⟶ decompositionCylinder F := sorry

/-- Every diagram of shape `K` has a limit, README L5.6 supporting predicate (dual of
`SSet.HasColimitsOfShape`). -/
def HasLimitsOfShape (K C : SSet.{u}) : Prop :=
  ∀ p : K ⟶ C, ∃ c : (slice p) _⦋0⦌, IsLimit p c

/-- κ-small colimits, README L5.6 supporting predicate (`SSet.HasColimitsOfSize κ C`): every
diagram indexed by a simplicial set with fewer than κ nondegenerate simplices has a colimit. -/
def HasColimitsOfSize (κ : Cardinal.{w}) (C : SSet.{u}) : Prop :=
  ∀ K : SSet.{u}, HasCardinalLT K.N κ → HasColimitsOfShape K C

/-- Small limits, README L5.6 supporting predicate (`SSet.HasSmallLimits`), with `C` lifted to the
universe of the diagrams. -/
def HasSmallLimits (C : SSet.{v}) : Prop :=
  ∀ K : SSet.{u}, HasLimitsOfShape (uliftFunctor.{v}.obj K) (uliftFunctor.{u}.obj C)

/-- `F` preserves the colimit diagram `p̄`, README L5.6 supporting predicate
(`SSet.PreservesColimit`). -/
def PreservesColimit {K C D : SSet.{u}} (F : C ⟶ D) (pbar : rightCone K ⟶ C) : Prop :=
  IsColimitDiagram pbar → IsColimitDiagram (pbar ≫ F)

/-- `F` preserves the limit diagram `p̄` (dual of `SSet.PreservesColimit`). -/
def PreservesLimit {K C D : SSet.{u}} (F : C ⟶ D) (pbar : leftCone K ⟶ C) : Prop :=
  IsLimitDiagram pbar → IsLimitDiagram (pbar ≫ F)

/-- Preserving small colimits, README L5.6 supporting predicate (`SSet.PreservesSmallColimits.{u}`),
through the universe lift as in `SSet.IsCardinalContinuous`. -/
def PreservesSmallColimits {C D : SSet.{v}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) (pbar : rightCone (uliftFunctor.{v}.obj K) ⟶ uliftFunctor.{u}.obj C),
    PreservesColimit (uliftFunctor.{u}.map F) pbar

/-- Preserving small limits (dual of `SSet.PreservesSmallColimits`; used by `Pr^R`, L7). -/
def PreservesSmallLimits {C D : SSet.{v}} (F : C ⟶ D) : Prop :=
  ∀ (K : SSet.{u}) (pbar : leftCone (uliftFunctor.{v}.obj K) ⟶ uliftFunctor.{u}.obj C),
    PreservesLimit (uliftFunctor.{u}.map F) pbar

/-! ### L5.9: left extensions and the mapping cylinder -/

/-- The mapping cylinder `M^op(δ) = (K × Δ[1]) ⊔_{K × {1}} K'`, README L5.9 *Left extensions and the
mapping cylinder* (`SSet.mappingCylinderOp`; HTT Definition 4.3.3.1). -/
def mappingCylinderOp {K K' : SSet.{u}} (δ : K ⟶ K') : SSet.{u} :=
  pushout (ι₁ : K ⟶ K ⊗ Δ[1]) δ

/-- The inclusion `K ≅ K × {0} ⟶ M^op(δ)`, README L5.9 (HTT 4.3.3.1). -/
def mappingCylinderOp.ι {K K' : SSet.{u}} (δ : K ⟶ K') : K ⟶ mappingCylinderOp δ :=
  ι₀ ≫ pushout.inl _ _

/-- The projection `M^op(δ) ⟶ Δ[1]`, README L5.9 (HTT 4.3.3.1). -/
def mappingCylinderOp.toΔ1 {K K' : SSet.{u}} (δ : K ⟶ K') : mappingCylinderOp δ ⟶ Δ[1] :=
  pushout.desc (snd _ _) (stdSimplex.isTerminalObj₀.from K' ≫ yonedaEquiv.symm (Δ1vertex 1)) sorry

/-- Left extensions of `f` along `δ`, README L5.9 (`SSet.LeftExtension`; HTT Definition 4.3.3.1):
`f' : K' ⟶ D` with an edge `α : f ⟶ δ ≫ f'` of `Fun(K, D)`. -/
structure LeftExtension {K K' D : SSet.{u}} (δ : K ⟶ K') (f : K ⟶ D) where
  /-- The extension. -/
  ext : K' ⟶ D
  /-- The transformation `f ⟶ δ ≫ f'`. -/
  α : Edge (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ ext))

/-- Left extensions are maps `M^op(δ) ⟶ D` restricting to `f`, README L5.9 (HTT 4.3.3.1). -/
def LeftExtension.equivCylinder {K K' D : SSet.{u}} (δ : K ⟶ K') (f : K ⟶ D) :
    LeftExtension δ f ≃ {F : mappingCylinderOp δ ⟶ D // mappingCylinderOp.ι δ ≫ F = f} := sorry

/-- HTT's left Kan extensions along `δ`, README L5.9 *Kan extensions along arbitrary maps*
(`SSet.IsLeftKanExtensionCyl`, auxiliary; HTT Definition 4.3.3.2): `F` factors as `F' ∘ F''` with
`F'' : M^op(δ) ⟶ 𝒦` a categorical equivalence over `Δ[1]` to an ∞-category and `F'` a left Kan
extension of its restriction to the fibre over `0`. -/
def IsLeftKanExtensionCyl {K K' D : SSet.{u}} [Quasicategory D] (δ : K ⟶ K')
    (F : mappingCylinderOp δ ⟶ D) : Prop :=
  ∃ (𝒦 : SSet.{u}) (_ : Quasicategory 𝒦) (π : 𝒦 ⟶ Δ[1]) (F'' : mappingCylinderOp δ ⟶ 𝒦)
    (F' : 𝒦 ⟶ D), F'' ≫ π = mappingCylinderOp.toΔ1 δ ∧ IsCategoricalEquivalence F'' ∧
      F'' ≫ F' = F ∧ IsLeftKanExtension (fun v ↦ π.app _ v = Δ1vertex 0) F'

/-! ### L5.10: coproducts, pushouts, representability, retracts and idempotents -/

/-- The constant simplicial set on a type, README L5.10 *Coproducts* (`SSet.discrete`, propose). -/
abbrev discrete (A : Type u) : SSet.{u} := (Functor.const SimplexCategoryᵒᵖ).obj A

/-- κ-small coproducts, README L5.10 *Coproducts* (`SSet.HasCoproductsOfSize`; `HTT.4.4.1/intro`). -/
def HasCoproductsOfSize (κ : Cardinal.{w}) (C : SSet.{u}) : Prop :=
  ∀ A : Type u, HasCardinalLT A κ → HasColimitsOfShape (discrete A) C

/-- The fixed isomorphism `Δ[1] ⊗ Δ[1] ≅ (Λ[2, 0])^▷`, README L5.10 *Pushouts* (HTT 4.4.2.1). -/
def squareIsoRightCone : (Δ[1] ⊗ Δ[1] : SSet.{u}) ≅ rightCone (Λ[2, 0] : SSet.{u}) := sorry

/-- Pushout squares, README L5.10 *Pushouts* (`SSet.IsPushout`; HTT 4.4.2.1): a colimit diagram
through `Δ[1] ⊗ Δ[1] ≅ (Λ[2, 0])^▷`. -/
def IsPushout {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) : Prop :=
  IsColimitDiagram (squareIsoRightCone.inv ≫ σ)

/-- The edge `Δ[1] × {j}` of a square (helper; `j = 0` the top, `j = 1` the bottom). -/
def squareRow {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) (j : Fin 2) : C _⦋1⦌ :=
  σ.app _ ((yonedaEquiv (𝟙 Δ[1]), (Δ[1] : SSet.{u}).σ 0 (Δ1vertex j)) :
    (Δ[1] ⊗ Δ[1] : SSet.{u}) _⦋1⦌)

/-- The edge `{i} × Δ[1]` of a square (helper). -/
def squareColumn {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) (i : Fin 2) : C _⦋1⦌ :=
  σ.app _ (((Δ[1] : SSet.{u}).σ 0 (Δ1vertex i), yonedaEquiv (𝟙 Δ[1])) :
    (Δ[1] ⊗ Δ[1] : SSet.{u}) _⦋1⦌)

open MonoidalClosed in
/-- Representable V-enriched functors, README L5.10 *Representable H-enriched functors*
(`EnrichedFunctor.IsRepresentedBy`; HTT Definition 4.4.4.1): for every x the composite
`Map_C(x, c) ⟶ G(c) ⊗ Map_C(x, c) ⟶ G(x)` is an isomorphism. -/
def EnrichedFunctor.IsRepresentedBy {V : Type v} [Category.{w} V] [MonoidalCategory V]
    [BraidedCategory V] [MonoidalClosed V] {C : Type u} [EnrichedCategory V C]
    (G : EnrichedFunctor V Cᵒᵖ V) (c : C) (η : 𝟙_ V ⟶ G.obj (op c)) : Prop :=
  ∀ x : C, IsIso ((λ_ _).inv ≫ (η ▷ _) ≫ MonoidalClosed.uncurry (G.map (op c) (op x)) :
    (EnrichedCategory.Hom x c : V) ⟶ G.obj (op x))

/-- Representable V-enriched functors, README L5.10 (HTT 4.4.4.1). -/
def EnrichedFunctor.IsRepresentable {V : Type v} [Category.{w} V] [MonoidalCategory V]
    [BraidedCategory V] [MonoidalClosed V] {C : Type u} [EnrichedCategory V C]
    (G : EnrichedFunctor V Cᵒᵖ V) : Prop :=
  ∃ c η, EnrichedFunctor.IsRepresentedBy G c η

/-- `H` is braided, from its Cartesian monoidal structure (helper for HTT 4.4.4.1 with `V = H`). -/
instance H.braidedCategory : BraidedCategory SSet.H.{u} := sorry

/-- `H` is closed monoidal (HTT 1.1.3; helper for HTT 4.4.4.1 with `V = H`). -/
instance H.monoidalClosed : MonoidalClosed SSet.H.{u} := sorry

/-- The identification `hS ≃ H` as an H-enriched functor `hS ⟶ H`, sending a Kan complex to its
class (README L1.4–L1.5; helper for README L5.10). The ∞-category `S` of small spaces lives in
`SSet.{u + 1}`, so its mapping objects are in `H.{u + 1}`. -/
def spacesToH : EnrichedFunctor SSet.H.{u + 1} (hoEnriched spaces.{u}) SSet.H.{u + 1} := sorry

/-- The H-enriched homotopy functor `hF : (hC)^op ⟶ hS ≃ H` of a presheaf, README L5.10
*Representable presheaves* (HTT 4.4.4.4): `SSet.hoEnriched.map F`, through `h(C^op) ≅ (hC)^op` and
`spacesToH`. -/
def presheafH {C : SSet.{u}} (F : uliftFunctor.{u + 1}.obj C.op ⟶ spaces.{u}) :
    EnrichedFunctor SSet.H.{u + 1} (hoEnriched (uliftFunctor.{u + 1}.obj C))ᵒᵖ SSet.H.{u + 1} :=
  sorry

/-- Representable presheaves, README L5.10 *Representable presheaves* (`SSet.IsRepresentedBy`; HTT
Definition 4.4.4.4): `(c, η)` represents `hF`. -/
def IsRepresentedBy {C : SSet.{u}} [Quasicategory C]
    (F : uliftFunctor.{u + 1}.obj C.op ⟶ spaces.{u}) (c : hoEnriched (uliftFunctor.{u + 1}.obj C))
    (η : 𝟙_ SSet.H.{u + 1} ⟶ (presheafH F).obj (op c)) : Prop :=
  EnrichedFunctor.IsRepresentedBy (presheafH F) c η

/-- Representable presheaves, README L5.10 (`SSet.IsRepresentable`; HTT 4.4.4.4). -/
def IsRepresentable {C : SSet.{u}} [Quasicategory C]
    (F : uliftFunctor.{u + 1}.obj C.op ⟶ spaces.{u}) : Prop :=
  EnrichedFunctor.IsRepresentable (presheafH F)

/-- The functor `C ⟶ S` classifying a left fibration (straightening, HTT 3.3.2.2, README L4.7;
helper). -/
def classifyingFunctor {X C : SSet.{u}} (φ : X ⟶ C) [LeftFibration φ] :
    uliftFunctor.{u + 1}.obj C ⟶ spaces.{u} := sorry

/-- The H-enriched functor `F_p : hC ⟶ H` of the left fibration `C_{p/} ⟶ C`, README L5.10
*Tensors with simplicial sets* (`SSet.coconeFunctorH`, propose; HTT Notation 4.4.4.8). -/
def coconeFunctorH {K C : SSet.{u}} [Quasicategory C] (p : K ⟶ C) [LeftFibration (coslice.π p)] :
    EnrichedFunctor SSet.H.{u + 1} (hoEnriched (uliftFunctor.{u + 1}.obj C)) SSet.H.{u + 1} :=
  EnrichedFunctor.comp SSet.H.{u + 1} (hoEnriched.map (classifyingFunctor (coslice.π p))) spacesToH

/-- `F_X := F_{const X}`, README L5.10 (HTT 4.4.4.8). -/
abbrev objectFunctorH {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌)
    [LeftFibration (coslice.π (yonedaEquiv.symm X : Δ[0] ⟶ C))] :
    EnrichedFunctor SSet.H.{u + 1} (hoEnriched (uliftFunctor.{u + 1}.obj C)) SSet.H.{u + 1} :=
  coconeFunctorH (yonedaEquiv.symm X : Δ[0] ⟶ C)

/-- Retracts, README L5.10 *Retracts and idempotent completeness* (`SSet.IsRetract`;
`HTT.4.4.5/intro`): a retract in `hC`. -/
def IsRetract {C : SSet.{u}} (Y X : C _⦋0⦌) : Prop :=
  Nonempty (Retract (HomotopyCategory.mk Y : hoFunctor.obj C) (HomotopyCategory.mk X))

/-- The 2-simplex `Y ⟶ X ⟶ Y` of `Idem⁺` (helper for `SSet.ret`, README L5.10; HTT 4.4.5.2). -/
def retSimplex : idemPlus _⦋2⦌ := sorry

/-- `Ret ⊆ Idem⁺`, the image of the 2-simplex `Y ⟶ X ⟶ Y`, README L5.10 (`SSet.ret`; HTT
4.4.5.2). -/
abbrev ret : SSet.{0} := (Subcomplex.ofSimplex retSimplex : SSet)

/-- `Ret` is `Δ[2]` with its long edge collapsed, README L5.10 (HTT 4.4.5.2). -/
def retIso : ret ≅ pushout (stdSimplex.δ 1 : Δ[1] ⟶ Δ[2]) (stdSimplex.isTerminalObj₀.from Δ[1]) :=
  sorry

/-- Idempotents, README L5.10 *Idempotents and retraction diagrams* (`SSet.Idempotent`; HTT
4.4.5.4). -/
abbrev Idempotent (C : SSet.{u}) : Type u := uliftFunctor.{u}.obj idem ⟶ C

/-- Weak retraction diagrams, README L5.10 (`SSet.WeakRetraction`; HTT 4.4.5.4). -/
abbrev WeakRetraction (C : SSet.{u}) : Type u := uliftFunctor.{u}.obj ret ⟶ C

/-- Strong retraction diagrams, README L5.10 (`SSet.StrongRetraction`; HTT 4.4.5.4). -/
abbrev StrongRetraction (C : SSet.{u}) : Type u := uliftFunctor.{u}.obj idemPlus ⟶ C

/-- The ∞-category of idempotents `Fun(Idem, C)`, README L5.10 (HTT 4.4.5.4). -/
abbrev idempotents (C : SSet.{u}) : SSet.{u} := (ihom (uliftFunctor.{u}.obj idem)).obj C

/-- `Fun(Ret, C)`, README L5.10 (HTT 4.4.5.4). -/
abbrev weakRetractions (C : SSet.{u}) : SSet.{u} := (ihom (uliftFunctor.{u}.obj ret)).obj C

/-- `Fun(Idem⁺, C)`, README L5.10 (HTT 4.4.5.4). -/
abbrev strongRetractions (C : SSet.{u}) : SSet.{u} := (ihom (uliftFunctor.{u}.obj idemPlus)).obj C

/-- Effective idempotents, README L5.10 (`SSet.IsEffective`; HTT 4.4.5.14): `F` extends along
`Idem ⟶ Idem⁺`. -/
def IsEffective {C : SSet.{u}} (F : Idempotent C) : Prop :=
  ∃ G : StrongRetraction C, uliftFunctor.{u}.map (Subcomplex.ι _) ≫ G = F

/-! ### L5.1: the universal left fibration -/

/-- The total space `S_{∗/}` of the universal left fibration, README L5.1 (HTT §3.3.2, proposed
name). -/
def universalLeftFibrationTotal : SSet.{u + 1} := sorry

/-- The universal left fibration `S_{∗/} ⟶ S`, README L5.1 (`SSet.universalLeftFibration`, HTT
§3.3.2, 3.3.2.8, proposed name). -/
def universalLeftFibration : universalLeftFibrationTotal.{u} ⟶ spaces.{u} := sorry

/-! ### L6.1–L6.3: presheaves, Yoneda, idempotent completions, colimit generation -/

/-- The Yoneda embedding `j : K ⟶ P(K)`, README L6 *The Yoneda embedding* (`SSet.yoneda`;
`HTT.5.1.3/intro`): the transpose of the simplicial nerve of `C[K^op × K] ⟶ C[K]^op × C[K] ⟶ Kan`,
`(x, y) ↦ Sing |Map_{C[K]}(x, y)|`. -/
def yoneda (K : SSet.{u}) : uliftFunctor.{u + 1}.obj K ⟶ presheaf K := sorry

/-- `C[K^op] ≅ C[K]^op`, README L6.1 *Rigidification of the opposite* (`SSet.rigidificationOpIso`,
propose; `HTT.5.1.3/intro/op`): natural in K, induced on `Δ[n]` by the order reversal of `[n]`. Stated
as an isomorphism of bundled simplicial categories in `EnrichedCat`. -/
def rigidificationOpIso (K : SSet.{u}) :
    EnrichedCat.of SSet.{u} (Rigidification K.op) ≅
      EnrichedCat.of SSet.{u} (Rigidification K)ᵒᵖ := sorry

/-- `C[K × L] ⟶ C[K] × C[L]`, README L6.1 *Rigidification and products*
(`SSet.rigidificationProdComparison`, propose; `HTT.5.1.3/intro/prod`): the pairing of `C[pr₁]` and
`C[pr₂]`, into the product simplicial category (Tau Ceti's `tensorEnrichedCategory`, the product
for the Cartesian structure on `SSet`). -/
def rigidificationProdComparison (K L : SSet.{u}) :
    EnrichedFunctor SSet.{u} (Rigidification (K ⊗ L)) (Rigidification K × Rigidification L) :=
  sorry

/-- Idempotent completions, README L6 *Idempotent completions* (`SSet.IsIdempotentCompletion`; HTT
Definition 5.1.4.1). -/
def IsIdempotentCompletion {C D : SSet.{u}} [Quasicategory C] [Quasicategory D] (f : C ⟶ D) :
    Prop :=
  IsIdempotentComplete D ∧ IsFullyFaithful f ∧ ∀ d : D _⦋0⦌, ∃ c : C _⦋0⦌, IsRetract d (f.app _ c)

/-- `Fun^L(P, C)` in HTT's Notation 5.1.5.1, the functors preserving small colimits, README L6
*`P(S)` is the free cocompletion* (`SSet.funColim`). -/
def funColim (P C : SSet.{v}) : ((ihom P).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun g ↦ PreservesSmallColimits.{v, u} (ihomVertexEquiv g)

/-- Full subcategories stable under small colimits, README L6 *Stable and generating
subcategories* (`SSet.IsStableUnderColimits`; HTT Definition 5.1.5.7): a colimit diagram whose
restriction to K lies in `C₀` has its cone point in `C₀`. -/
def IsStableUnderColimits {C : SSet.{v}} (C₀ : Set (C _⦋0⦌)) : Prop :=
  ∀ (K : SSet.{u}) (pbar : rightCone (uliftFunctor.{v}.obj K) ⟶ uliftFunctor.{u}.obj C),
    IsColimitDiagram pbar →
    (∃ q : uliftFunctor.{v}.obj K ⟶ uliftFunctor.{u}.obj (fullEnhancedSubcategory C (· ∈ C₀)),
      q ≫ uliftFunctor.{u}.map (Subcomplex.ι _) = join.inl _ Δ[0] ≫ pbar) →
    ∃ q' : Δ[0] ⟶ uliftFunctor.{u}.obj (fullEnhancedSubcategory C (· ∈ C₀)),
      q' ≫ uliftFunctor.{u}.map (Subcomplex.ι _) = join.inr _ Δ[0] ≫ pbar

/-- Generation under small colimits, README L6 *Stable and generating subcategories*
(`SSet.GeneratesUnderColimits`; HTT 5.1.5.7 and the definition after it), for C with small
colimits. -/
def GeneratesUnderColimits {C : SSet.{v}} (A : Set (C _⦋0⦌)) (_hC : HasSmallColimits.{v, u} C) :
    Prop :=
  ∀ C₀ : Set (C _⦋0⦌), A ⊆ C₀ → IsStableUnderColimits.{v, u} C₀ → C₀ = Set.univ

/-- Completely compact objects, README L6 *Completely compact objects* (`SSet.IsCompletelyCompact`;
HTT Definition 5.1.6.2): `j_X` preserves small colimits. -/
def IsCompletelyCompact {C : SSet.{v}} [Quasicategory C] (X : C _⦋0⦌)
    (_hC : HasSmallColimits.{v, u} C) : Prop :=
  PreservesSmallColimits.{v + 1, u} (corepresented C X)

/-- Completely compact left fibrations, README L6 (`SSet.LeftFibration.IsCompletelyCompact`; HTT
Definition 5.1.6.5): classified by a functor preserving small colimits, that is, covariantly
equivalent over C to the pullback of the universal left fibration along such a functor. -/
def LeftFibration.IsCompletelyCompact {C C' : SSet.{v}} [Quasicategory C] (φ : C' ⟶ C)
    [LeftFibration φ] (_hC : HasSmallColimits.{v, u} C) : Prop :=
  ∃ F : uliftFunctor.{v + 1}.obj C ⟶ spaces.{v}, PreservesSmallColimits.{v + 1, u} F ∧
    ∃ g : CategoryTheory.Over.mk (uliftFunctor.{v + 1}.map φ) ⟶
      CategoryTheory.Over.mk (pullback.fst F universalLeftFibration),
      Over.IsCovariantEquivalence g

/-! ### L6.4–L6.6: associated functors, adjunctions, localizations, orthogonality -/

namespace CartesianFibration

/-- Functors associated to a Cartesian fibration over `Δ[1]`, README L6
(`SSet.CartesianFibration.IsAssociated`; HTT Definition 5.2.1.1); `h₀`, `h₁` are the given
equivalences onto the fibres (HTT Remark 5.2.1.2). -/
def IsAssociated {M C D : SSet.{u}} (p : M ⟶ Δ[1]) [SSet.CartesianFibration p]
    (h₀ : C ⟶ (fiber p (Δ1vertex 0) : SSet.{u})) (h₁ : D ⟶ (fiber p (Δ1vertex 1) : SSet.{u}))
    (g : D ⟶ C) : Prop :=
  ∃ s : D ⊗ Δ[1] ⟶ M, s ≫ p = snd D Δ[1] ∧ ι₁ ≫ s = h₁ ≫ Subcomplex.ι _ ∧
    ι₀ ≫ s = g ≫ h₀ ≫ Subcomplex.ι _ ∧
    ∀ x : D _⦋0⦌, SSet.Edge.IsCartesian (cylinderEdge s x) p

end CartesianFibration

namespace CocartesianFibration

/-- Functors associated to a coCartesian fibration over `Δ[1]`, README L6
(`SSet.CocartesianFibration.IsAssociated`; `HTT.5.2.2/intro`), with `SSet.Edge.IsCocartesian`. -/
def IsAssociated {M C D : SSet.{u}} (p : M ⟶ Δ[1]) [CocartesianFibration p]
    (h₀ : C ⟶ (fiber p (Δ1vertex 0) : SSet.{u})) (h₁ : D ⟶ (fiber p (Δ1vertex 1) : SSet.{u}))
    (f : C ⟶ D) : Prop :=
  ∃ s : C ⊗ Δ[1] ⟶ M, s ≫ p = snd C Δ[1] ∧ ι₀ ≫ s = h₀ ≫ Subcomplex.ι _ ∧
    ι₁ ≫ s = f ≫ h₁ ≫ Subcomplex.ι _ ∧ ∀ x : C _⦋0⦌, Edge.IsCocartesian (cylinderEdge s x) p

end CocartesianFibration

/-- HTT's adjunctions, README L6 *HTT's adjunctions* (`SSet.IsCorrespondenceAdjunction`; HTT
Definition 5.2.2.1): one bifibration over `Δ[1]` to which f and g are associated. -/
def IsCorrespondenceAdjunction {C D : SSet.{u}} (f : C ⟶ D) (g : D ⟶ C) : Prop :=
  ∃ (M : SSet.{u}) (q : M ⟶ Δ[1]) (_ : SSet.CartesianFibration q)
    (_ : CocartesianFibration q) (h₀ : C ⟶ (fiber q (Δ1vertex 0) : SSet.{u}))
    (h₁ : D ⟶ (fiber q (Δ1vertex 1) : SSet.{u})),
    IsCategoricalEquivalence h₀ ∧ IsCategoricalEquivalence h₁ ∧
      CocartesianFibration.IsAssociated q h₀ h₁ f ∧ CartesianFibration.IsAssociated q h₀ h₁ g

/-- The class in `hC` of the component `u(c) : c ⟶ g(f(c))` of `u : 𝟙 ⟶ f ≫ g`, as a point of the
mapping object of `hC` (helper for README L6 *Unit transformations*). -/
def unitComponentClass {C D : SSet.{u}} {f : C ⟶ D} {g : D ⟶ C}
    (_u : Edge (ihomVertexEquiv.symm (𝟙 C)) (ihomVertexEquiv.symm (f ≫ g))) (c : hoEnriched C) :
    𝟙_ SSet.H.{u} ⟶ EnrichedCategory.Hom (V := SSet.H.{u}) c
      ((hoEnriched.map g).obj ((hoEnriched.map f).obj c)) := sorry

/-- Unit transformations, README L6 *Unit transformations* (`SSet.IsUnitTransformation`; HTT
Definition 5.2.2.7): `Map_D(f c, d) ⟶ Map_C(g f c, g d) ⟶ Map_C(c, g d)` is an isomorphism in H. -/
def IsUnitTransformation {C D : SSet.{u}} [Quasicategory C] [Quasicategory D] {f : C ⟶ D}
    {g : D ⟶ C} (u : Edge (ihomVertexEquiv.symm (𝟙 C)) (ihomVertexEquiv.symm (f ≫ g))) : Prop :=
  ∀ (c : hoEnriched C) (d : hoEnriched D),
    IsIso ((hoEnriched.map g).map ((hoEnriched.map f).obj c) d ≫
      (λ_ _).inv ≫ (unitComponentClass u c ▷ _) ≫
        eComp SSet.H.{u} c ((hoEnriched.map g).obj ((hoEnriched.map f).obj c))
          ((hoEnriched.map g).obj d))

/-- `Fun^L(C, D)`, README L6 *Functor ∞-categories of left and right adjoints* (`SSet.funL`; HTT
Definition 5.2.6.1). -/
def funL (C D : SSet.{u}) [Quasicategory C] [Quasicategory D] : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ QCat.IsLeftAdjoint (QCat.homMk (ihomVertexEquiv v))

/-- `Fun^R(C, D)`, README L6 (`SSet.funR`; HTT 5.2.6.1). -/
def funR (C D : SSet.{u}) [Quasicategory C] [Quasicategory D] : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦
    ∃ F : (⟨D, inferInstance⟩ : SSet.QCat.{u}) ⟶ ⟨C, inferInstance⟩,
      Nonempty (Bicategory.Adjunction F (QCat.homMk (ihomVertexEquiv v)))

/-- Relative localizations, README L6 *Relative localizations* (`SSet.Edge.IsLocalizationInto`;
HTT Definition 5.2.7.6): `d ∈ C₀` and precomposition with `[f]` is an isomorphism
`Map_C(d, e) ⟶ Map_C(c, e)` for every `e ∈ C₀`. -/
def Edge.IsLocalizationInto {C : SSet.{u}} (C₀ : Set (C _⦋0⦌)) {c d : C _⦋0⦌} (f : Edge c d) :
    Prop :=
  d ∈ C₀ ∧ ∀ e ∈ C₀, IsIso (hoEnriched.precomp f e)

/-- Reflective subcategories, README L6 *Reflective subcategories* (`SSet.IsReflectiveSubcategory`;
HTT 5.2.7.8, Remark 5.2.7.9): the inclusion has a left adjoint. -/
def IsReflectiveSubcategory {C : SSet.{u}} [Quasicategory C] (C₀ : Set (C _⦋0⦌)) : Prop :=
  ∃ L : (⟨C, inferInstance⟩ : SSet.QCat.{u}) ⟶ ⟨fullEnhancedSubcategory C (· ∈ C₀), inferInstance⟩,
    Nonempty (Bicategory.Adjunction L (QCat.homMk (Subcomplex.ι _)))

/-- The double slice `(C_{A/})_{/Ỹ}` and the two objects `B̃`, `X̃` determined by a square from `f`
to `g` (helper for README L6 *Orthogonality*, HTT 5.2.8.1; built from the join and slice
equivalences). -/
def orthogonalityData {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) :
    Σ (Y : (coslice (yonedaEquiv.symm (C.δ 1 (squareRow σ 0)) : Δ[0] ⟶ C)) _⦋0⦌),
      (slice (yonedaEquiv.symm Y : Δ[0] ⟶ _)) _⦋0⦌ × (slice (yonedaEquiv.symm Y : Δ[0] ⟶ _)) _⦋0⦌ :=
  sorry

/-- Orthogonality, README L6 *Orthogonality* (`SSet.LeftOrthogonal`; HTT Definition 5.2.8.1): for
every square with top `f` and bottom `g`, `Map_{C_{A/ /Y}}(B̃, X̃)` is weakly contractible. -/
def LeftOrthogonal {C : SSet.{u}} [Quasicategory C] {a b x y : C _⦋0⦌} (f : Edge a b)
    (g : Edge x y) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ C, squareRow σ 0 = f.edge → squareRow σ 1 = g.edge →
    IsWeaklyContractible (morphismSpace _ (orthogonalityData σ).2.1 (orthogonalityData σ).2.2 :
      SSet.{u})

/-- `S^⊥`, README L6 *Orthogonality* (HTT Notation 5.2.8.4). -/
def rightOrthogonalClass {C : SSet.{u}} [Quasicategory C] (S : EdgeClass C) : EdgeClass C :=
  fun _ _ g ↦ ∀ ⦃a b⦄ (f : Edge a b), S f → LeftOrthogonal f g

/-- `⊥S`, README L6 *Orthogonality* (HTT Notation 5.2.8.4). -/
def leftOrthogonalClass {C : SSet.{u}} [Quasicategory C] (S : EdgeClass C) : EdgeClass C :=
  fun _ _ f ↦ ∀ ⦃x y⦄ (g : Edge x y), S g → LeftOrthogonal f g

/-- A class of morphisms closed under retracts in `Fun(Δ[1], C)` (helper). -/
def EdgeClass.IsClosedUnderRetracts {C : SSet.{u}} (S : EdgeClass C) : Prop :=
  ∀ ⦃x y x' y' : C _⦋0⦌⦄ (e : Edge x y) (e' : Edge x' y'),
    IsRetract (Edge.toArrowVertex e) (Edge.toArrowVertex e') → S e' → S e

/-- Factorization systems, README L6 *Factorization systems* (`SSet.FactorizationSystem`; HTT
Definition 5.2.8.8). -/
structure FactorizationSystem (C : SSet.{u}) [Quasicategory C] where
  /-- The left class `S_L`. -/
  left : EdgeClass C
  /-- The right class `S_R`. -/
  right : EdgeClass C
  left_retract : left.IsClosedUnderRetracts
  right_retract : right.IsClosedUnderRetracts
  orthogonal : ∀ ⦃a b x y⦄ (f : Edge a b) (g : Edge x y), left f → right g → LeftOrthogonal f g
  factor : ∀ ⦃x z : C _⦋0⦌⦄ (h : Edge x z), ∃ (y : C _⦋0⦌) (e₁ : Edge x y) (e₂ : Edge y z),
    left e₁ ∧ right e₂ ∧ Nonempty (Edge.CompStruct e₁ e₂ h)

/-! ### L6.7: κ-closed ∞-categories, colimit functors, κ-compact left fibrations -/

/-- Essentially κ-filtered simplicial sets, README L6.6 *Filtered simplicial sets*
(`SSet.IsEssentiallyCardinalFiltered`; HTT Proposition 5.3.1.19, Remark 5.3.1.11): categorically
equivalent to a κ-filtered ∞-category. -/
def IsEssentiallyCardinalFiltered (S : SSet.{u}) (κ : Cardinal.{u}) : Prop :=
  ∃ (C : SSet.{u}) (f : S ⟶ C), Quasicategory C ∧ IsCategoricalEquivalence f ∧
    SSet.IsCardinalFiltered C κ

/-- κ-closed ∞-categories, README L6 *κ-closed ∞-categories and colimit functors*
(`SSet.IsCardinalClosed`; HTT Definition 5.3.3.1). -/
abbrev IsCardinalClosed (C : SSet.{u}) (κ : Cardinal.{w}) : Prop := HasColimitsOfSize κ C


/-- κ-compact left fibrations, README L6 (`SSet.LeftFibration.IsCardinalPresentable`; HTT
Definition 5.3.4.5): classified by a κ-continuous functor. -/
def LeftFibration.IsCardinalPresentable {C C' : SSet.{v}} [Quasicategory C] (φ : C' ⟶ C)
    [LeftFibration φ] (κ : Cardinal.{w}) [Fact κ.IsRegular]
    (hC : HasCardinalFilteredColimits.{w, v, u} C κ) : Prop :=
  ∃ F : uliftFunctor.{v + 1}.obj C ⟶ spaces.{v}, IsCardinalContinuous F κ hC.uliftFunctor ∧
    ∃ g : CategoryTheory.Over.mk (uliftFunctor.{v + 1}.map φ) ⟶
      CategoryTheory.Over.mk (pullback.fst F universalLeftFibration),
      Over.IsCovariantEquivalence g

/-- `Fun_R(C, D)`, the functors carrying every member of R to a colimit diagram, README L6
*Freely adjoining colimits: notation* (`SSet.funRespecting`; HTT Notation 5.3.6.1). -/
def funRespecting {C : SSet.{u}} (R : Set (Σ K : SSet.{u}, rightCone K ⟶ C)) (D : SSet.{u}) :
    ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ ∀ x ∈ R, IsColimitDiagram (x.2 ≫ ihomVertexEquiv v)

/-- `Fun_𝒦(C, D)`, the functors preserving 𝒦-indexed colimits, README L6 (`SSet.funPreserving`;
HTT 5.3.6.1). -/
def funPreserving (𝒦 : Set SSet.{u}) (C D : SSet.{u}) : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦
    ∀ K ∈ 𝒦, ∀ pbar : rightCone K ⟶ C, PreservesColimit (ihomVertexEquiv v) pbar

/-! ### L6.8: simplicial objects, effective groupoids, group objects -/

/-- The ∞-category `C^Δ = Fun(N(Δ)^op, C)` of simplicial objects, README L6 *Simplicial objects*
(`SSet.simplicialObjects`; HTT Definition 6.1.2.2). -/
abbrev simplicialObjects (C : SSet.{u}) : SSet.{u} := (ihom nerveSimplexOp.{u}).obj C

/-- The ∞-category `C^{Δ₊}` of augmented simplicial objects, README L6 (HTT 6.1.2.2). -/
abbrev augmentedSimplicialObjectsCat (C : SSet.{u}) : SSet.{u} := (ihom nerveAugmentedOp.{u}).obj C

/-- Effective groupoids, README L6 *Effective groupoids* (`SSet.IsEffectiveGroupoid`; HTT
Definition 6.1.2.14): an extension to a geometric realization that is a Čech nerve. -/
def IsEffectiveGroupoid {C : SSet.{u}} [Quasicategory C] (U : nerveSimplexOp.{u} ⟶ C) : Prop :=
  ∃ Up : augmentedSimplicialObjects C,
    join.inl _ Δ[0] ≫ geometricRealizationIso.hom ≫ Up = U ∧ IsGeometricRealization Up ∧
      IsCechNerve Up

/-- Pointed objects `X_*`, README L6 *Pointed objects and group objects* (`SSet.pointedObjects`;
`HTT.7.2.2.1/pointed`): the edges of X with final source. -/
def pointedObjects (X : SSet.{u}) : ((ihom Δ[1]).obj X).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsTerminalVertex ((evalVertex X 0).app _ v)

/-- The vertex `[0]` of `N(Δ)^op` (helper). -/
def nerveSimplexOp.vertexZero : nerveSimplexOp.{u} _⦋0⦌ :=
  ⟨opObjEquiv.symm (nerveEquiv.symm ⦋0⦌)⟩

/-- Group objects, README L6 (`SSet.IsGroupObject`; HTT 7.2.2.1): groupoid objects with `U₀`
final. -/
def IsGroupObject {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X) : Prop :=
  IsGroupoidObject U ∧ IsTerminalVertex (U.app _ nerveSimplexOp.vertexZero)

/-- `U[K]`, README L6.8 *Evaluating a simplicial object on a simplicial set*
(`SSet.simplicialObjectEval`; `HTT.6.1.2.6/eval`, HTT Notation 6.1.2.5): the value at K of the
right Kan extension of U along `N(Δ)^op ⟶ N(Δ_{/K})^op`, a vertex of C (so `U[Δ[n]] ≃ U([n])`). -/
def simplicialObjectEval {C : SSet.{u}} [Quasicategory C] (U : nerveSimplexOp.{u} ⟶ C)
    (K : SSet.{u}) : C _⦋0⦌ := sorry

/-- The slice map `C_{/U[K']} ⟶ C_{/U[K]}` induced by `i : K ⟶ K'`, README L6.8
(`SSet.simplicialObjectEval.sliceMap`; `HTT.6.1.2.6/eval`). -/
def simplicialObjectEval.sliceMap {C : SSet.{u}} [Quasicategory C] (U : nerveSimplexOp.{u} ⟶ C)
    {K K' : SSet.{u}} (_i : K ⟶ K') :
    slice (yonedaEquiv.symm (simplicialObjectEval U K')) ⟶
      slice (yonedaEquiv.symm (simplicialObjectEval U K)) := sorry

/-- `Grp(X) ⊆ X_Δ`, README L6 (`SSet.grp`; HTT 7.2.2.1). -/
def grp (X : SSet.{u}) [Quasicategory X] : (simplicialObjects X).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsGroupObject (ihomVertexEquiv v)

end SSet

/-- `Δ_s`, the wide subcategory of `SimplexCategory` on the injective maps, README L6
*Semisimplicial objects* (`SimplexCategory.inj`, proposed name; HTT Notation 6.5.3.6). -/
abbrev SimplexCategory.inj : Type :=
  WideSubcategory (MorphismProperty.monomorphisms _root_.SimplexCategory)

namespace SSet

open _root_.SSet

/-- Semisimplicial objects `Fun(N(Δ_s)^op, X)`, README L6 *Semisimplicial objects*
(`SSet.semisimplicialObjects`; HTT Notation 6.5.3.6). -/
abbrev semisimplicialObjects (X : SSet.{u}) : SSet.{u} :=
  (ihom (uliftFunctor.{u}.obj (nerve SimplexCategory.inj).op)).obj X

/-! ### L7.1–L7.3: accessible functors, `Acc_κ`, idempotent completion, κ-cofinality -/

/-- The quasicategory underlying a vertex of `Cat∞` (helper). -/
def catInftyObj (v : catInfty.{u} _⦋0⦌) : SSet.{u} := (v.obj ⟨⟨0⟩⟩).obj.toSSet

/-- The underlying simplicial set of a vertex of `Cat∞` is a quasicategory (helper). -/
instance (v : catInfty.{u} _⦋0⦌) : Quasicategory (catInftyObj v) := (v.obj ⟨⟨0⟩⟩).property

/-- The class in `hCat∞` of the edge given by a functor (helper; README L4.1). -/
def catInfty.homMk {A B : catInfty.{u} _⦋0⦌} (f : catInftyObj A ⟶ catInftyObj B) :
    (HomotopyCategory.mk A : hoFunctor.obj catInfty.{u}) ⟶ HomotopyCategory.mk B := sorry

/-- `Cat∞` is a quasicategory (README L4.1; HTT 3.0.0.1). -/
instance : Quasicategory catInfty.{u} := sorry

/-- The class of morphisms of `hCat∞` represented by functors with a property (helper for the HTT
1.2.11 subcategories of `Cat∞` in L7). -/
def catInfty.functorClass
    (P : ∀ ⦃A B : catInfty.{u} _⦋0⦌⦄, (catInftyObj A ⟶ catInftyObj B) → Prop) :
    MorphismProperty (hoFunctor.obj catInfty.{u}) := fun A B φ ↦
  ∃ (A' B' : catInfty.{u} _⦋0⦌) (hA : HomotopyCategory.mk A' = A)
    (hB : HomotopyCategory.mk B' = B) (f : catInftyObj A' ⟶ catInftyObj B'),
    P f ∧ eqToHom hA.symm ≫ catInfty.homMk f ≫ eqToHom hB = φ

/-- The object property of `hCat∞` of the vertices whose quasicategory has a property (helper). -/
def catInfty.objectClass (P : ∀ (C : SSet.{u}) [Quasicategory C], Prop) :
    ObjectProperty (hoFunctor.obj catInfty.{u}) := fun A ↦
  ∃ A' : catInfty.{u} _⦋0⦌, HomotopyCategory.mk A' = A ∧ P (catInftyObj A')

/-- The HTT 1.2.11 subcategory of `Cat∞` with objects and morphisms given by properties (helper;
the multiplicativity of the class of morphisms is a lemma for each instance). -/
def catInfty.subcategory (P : ∀ (C : SSet.{u}) [Quasicategory C], Prop)
    (W : ∀ ⦃A B : catInfty.{u} _⦋0⦌⦄, (catInftyObj A ⟶ catInftyObj B) → Prop)
    [(catInfty.functorClass W).IsMultiplicative] : catInfty.{u}.Subcomplex :=
  SSet.subcategory catInfty.{u} (catInfty.objectClass P) (catInfty.functorClass W)

/-- Accessible functors, README L7 *Accessible functors* (`SSet.IsAccessibleFunctor`; HTT
Definition 5.4.2.5): κ-continuous for some regular κ. -/
def IsAccessibleFunctor {C D : SSet.{v}} [Quasicategory C] [Quasicategory D] (F : C ⟶ D) : Prop :=
  ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular) (hC : HasCardinalFilteredColimits.{u, v, u} C κ),
    IsCardinalContinuous F κ hC

/-- The functors of `Acc_κ`: κ-continuous and preserving κ-compact objects (helper for README L7
*`Acc_κ`*, HTT 5.4.2.14). -/
def AccCardinalFunctor (κ : Cardinal.{u}) [Fact κ.IsRegular] {C D : SSet.{u + 1}}
    [Quasicategory C] [Quasicategory D] (F : C ⟶ D) : Prop :=
  ∃ (hC : HasCardinalFilteredColimits.{u, u + 1, u} C κ)
    (hD : HasCardinalFilteredColimits.{u, u + 1, u} D κ),
    IsCardinalContinuous F κ hC ∧
      ∀ X, IsCardinalPresentable X κ hC → IsCardinalPresentable (F.app _ X) κ hD

/-- `Acc_κ ⊆ Cat∞^`, README L7 *`Acc_κ`* (`SSet.accCardinal`, propose; HTT Definition 5.4.2.14).
The multiplicativity of its class of morphisms (HTT 5.4.2.14) is taken as an instance argument. -/
def accCardinal (κ : Cardinal.{u}) [Fact κ.IsRegular]
    [(catInfty.functorClass.{u + 1} fun _ _ F ↦ AccCardinalFunctor κ F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsCardinalAccessible.{u + 1, u} C κ)
    fun _ _ F ↦ AccCardinalFunctor κ F

/-- `Acc = ⋃_κ Acc_κ`, README L7 (`SSet.acc`, propose; HTT 5.4.2.14): accessible ∞-categories and
the functors lying in some `Acc_κ`. -/
def acc [(catInfty.functorClass.{u + 1} fun _ _ F ↦
      ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular), AccCardinalFunctor κ F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsAccessible.{u + 1, u} C)
    fun _ _ F ↦ ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular), AccCardinalFunctor κ F

/-- `Cat∞^∨ ⊆ Cat∞`, the idempotent complete ∞-categories, README L7 *Idempotent completion
functor* (`SSet.catInftyIdem`, propose; `HTT.5.4.2.16/after`). -/
abbrev catInftyIdem : SSet.{u + 1} :=
  (fullEnhancedSubcategory catInfty.{u} fun v ↦ IsIdempotentComplete (catInftyObj v) : SSet)

/-- Idempotent completion functors, README L7 (`SSet.IsIdempotentCompletionFunctor`, propose;
`HTT.5.4.2.16/after`): left adjoints to `Cat∞^∨ ⊆ Cat∞`. -/
def IsIdempotentCompletionFunctor
    (L : (⟨catInfty.{u}, inferInstance⟩ : SSet.QCat.{u + 1}) ⟶ ⟨catInftyIdem.{u}, inferInstance⟩) :
    Prop :=
  Nonempty (Bicategory.Adjunction L (QCat.homMk (Subcomplex.ι _)))

/-- Weakly cofinal functors, README L7 *Weakly cofinal and κ-cofinal functors*
(`SSet.IsWeaklyCofinal`; HTT Definition 5.4.5.8). -/
def IsWeaklyCofinal {I J : SSet.{u}} (f : I ⟶ J) : Prop :=
  ∀ y : J _⦋0⦌, ∃ x : I _⦋0⦌, Nonempty (Edge y (f.app _ x))

/-- κ-cofinal functors, README L7 (`SSet.IsCardinalCofinal`; HTT 5.4.5.8). -/
def IsCardinalCofinal {I J : SSet.{u}} (f : I ⟶ J) (κ : Cardinal.{w}) : Prop :=
  ∀ (K : SSet.{u}) [IsWeaklyContractible K] (p : K ⟶ I), HasCardinalLT K.N κ →
    IsWeaklyCofinal (coslice.map (𝟙 K) f (by simp) : coslice p ⟶ coslice (p ≫ f))

/-- Accessible subcategories, README L7 *Accessible subcategories* (`SSet.IsAccessibleSubcategory`;
HTT Definition 5.4.7.8). -/
def IsAccessibleSubcategory {C : SSet.{v}} [Quasicategory C] (P : C _⦋0⦌ → Prop) : Prop :=
  IsAccessible.{v, u} (fullEnhancedSubcategory C P : SSet) ∧
    IsAccessibleFunctor.{v, u} (Subcomplex.ι (fullEnhancedSubcategory C P))

/-! ### L7.4–L7.5: `Pr^L`, `Pr^R`, presentable fibrations, local objects, saturation -/

/-- `Pr^L ⊆ Cat∞^`, README L7 *`Pr^L` and `Pr^R`* (`SSet.prL`, propose; HTT Definition 5.5.3.1). -/
def prL [(catInfty.functorClass.{u + 1} fun _ _ F ↦
      PreservesSmallColimits.{u + 1, u} F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsPresentable.{u + 1, u} C)
    fun _ _ F ↦ PreservesSmallColimits.{u + 1, u} F

/-- `Pr^R ⊆ Cat∞^`, README L7 (`SSet.prR`, propose; HTT 5.5.3.1): accessible functors preserving
small limits. -/
def prR [(catInfty.functorClass.{u + 1} fun _ _ F ↦
      IsAccessibleFunctor.{u + 1, u} F ∧ PreservesSmallLimits.{u + 1, u} F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsPresentable.{u + 1, u} C)
    fun _ _ F ↦ IsAccessibleFunctor.{u + 1, u} F ∧ PreservesSmallLimits.{u + 1, u} F

/-- Presentable fibrations, README L7 *Presentable fibrations* (`SSet.PresentableFibration`; HTT
Definition 5.5.3.2). -/
def PresentableFibration {X S : SSet.{v}} (p : X ⟶ S) : Prop :=
  SSet.CartesianFibration p ∧ CocartesianFibration p ∧
    ∀ s : S _⦋0⦌, ∃ _ : Quasicategory (fiber p s : SSet.{v}),
      IsPresentable.{v, u} (fiber p s : SSet.{v})

/-- S-local objects, README L7 *Local objects and local equivalences* (`SSet.IsLocalObject`; HTT
Definition 5.5.4.1). -/
def IsLocalObject {C : SSet.{u}} [Quasicategory C] (S : EdgeClass C) (Z : C _⦋0⦌) : Prop :=
  ∀ ⦃x y : C _⦋0⦌⦄ (s : Edge x y), S s → IsIso (hoEnriched.precomp s Z)

/-- S-equivalences, README L7 (`SSet.IsLocalEquivalence`; HTT 5.5.4.1). -/
def IsLocalEquivalence {C : SSet.{u}} [Quasicategory C] (S : EdgeClass C) {x y : C _⦋0⦌}
    (f : Edge x y) : Prop :=
  ∀ Z, IsLocalObject S Z → IsIso (hoEnriched.precomp f Z)

/-- Stability under pushouts (helper for HTT 5.5.4.5, 5.5.5.1): in a pushout square, if the top is
in S so is the bottom. -/
def EdgeClass.IsStableUnderPushout {C : SSet.{u}} (S : EdgeClass C) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ C, IsPushout σ → S (Edge.mk' (squareRow σ 0)) →
    S (Edge.mk' (squareRow σ 1))

/-- The full subcategory of `Fun(Δ[1], C)` spanned by S is stable under small colimits (helper). -/
def EdgeClass.IsStableUnderColimits {C : SSet.{v}} (S : EdgeClass C) : Prop :=
  SSet.IsStableUnderColimits.{v, u} {v : ((ihom Δ[1]).obj C) _⦋0⦌ | S (arrowVertexEdge v)}

/-- Strongly saturated classes, README L7 *Strongly saturated classes* (`SSet.IsStronglySaturated`;
HTT Definition 5.5.4.5); `SSet.HasSmallColimits C` is a hypothesis of the results. -/
def IsStronglySaturated {C : SSet.{v}} (S : EdgeClass C) : Prop :=
  S.IsStableUnderPushout ∧ EdgeClass.IsStableUnderColimits.{v, u} S ∧
    ∀ ⦃x₀ x₁ x₂ : C _⦋0⦌⦄ {e₀₁ : Edge x₀ x₁} {e₁₂ : Edge x₁ x₂} {e₀₂ : Edge x₀ x₂},
      Edge.CompStruct e₀₁ e₁₂ e₀₂ →
        ((S e₀₁ ∧ S e₁₂) → S e₀₂) ∧ ((S e₀₁ ∧ S e₀₂) → S e₁₂) ∧ ((S e₁₂ ∧ S e₀₂) → S e₀₁)

/-- The strongly saturated class generated by `S₀`, README L7 (`SSet.stronglySaturatedClosure`;
HTT Remark 5.5.4.7). -/
def stronglySaturatedClosure {C : SSet.{v}} (S₀ : EdgeClass C) : EdgeClass C :=
  fun _ _ e ↦ ∀ S : EdgeClass C, IsStronglySaturated.{v, u} S →
    (∀ ⦃a b⦄ (f : Edge a b), S₀ f → S f) → S e

/-- Small generation, README L7 (`SSet.IsOfSmallGeneration`; HTT 5.5.4.7): generated by a set of
morphisms indexed by a small type. -/
def IsOfSmallGeneration {C : SSet.{v}} (S : EdgeClass C) : Prop :=
  ∃ (ι : Type u) (a b : ι → C _⦋0⦌) (e : ∀ i, Edge (a i) (b i)),
    ∀ ⦃x y⦄ (f : Edge x y), S f ↔ stronglySaturatedClosure.{v, u}
      (fun x' y' f' ↦ ∃ i, (⟨a i, b i, e i⟩ : Σ x y, Edge x y) = ⟨x', y', f'⟩) f

/-- Strongly reflective subcategories, README L7 (`SSet.IsStronglyReflective`;
`HTT.5.5.4.16/after`, HTT's second form): closed under equivalence, presentable, with a left
adjoint to the inclusion. -/
def IsStronglyReflective {C : SSet.{v}} [Quasicategory C] (P : C _⦋0⦌ → Prop) : Prop :=
  (∀ ⦃x y : C _⦋0⦌⦄ (e : Edge x y), Edge.IsEquivalence e → P x → P y) ∧
    IsPresentable.{v, u} (fullEnhancedSubcategory C P : SSet) ∧
    ∃ L : (⟨C, inferInstance⟩ : SSet.QCat.{v}) ⟶ ⟨fullEnhancedSubcategory C P, inferInstance⟩,
      Nonempty (Bicategory.Adjunction L (QCat.homMk (Subcomplex.ι _)))

/-- Saturated classes, README L7 *Saturated classes* (`SSet.IsSaturated`; HTT Definition 5.5.5.1). -/
def IsSaturated {C : SSet.{v}} (S : EdgeClass C) : Prop :=
  EdgeClass.IsStableUnderColimits.{v, u} S ∧
    (∀ ⦃x y⦄ (e : Edge x y), Edge.IsEquivalence e → S e) ∧
    (∀ ⦃x₀ x₁ x₂ : C _⦋0⦌⦄ {e₀₁ : Edge x₀ x₁} {e₁₂ : Edge x₁ x₂} {e₀₂ : Edge x₀ x₂},
      Edge.CompStruct e₀₁ e₁₂ e₀₂ → S e₀₁ → S e₁₂ → S e₀₂) ∧
    S.IsStableUnderPushout

/-! ### L7.3: freely adjoining colimits -/

/-- `P^𝒦_R(C)`, README L7 *`P^𝒦_R(C)`* (`SSet.adjoinColimits`; HTT Proposition 5.3.6.2), by Lurie's
construction: the smallest full subcategory of the S-local objects of `P(C)` containing `L ∘ j₀(C)`
and closed under 𝒦-indexed colimits. -/
def adjoinColimits (𝒦 : Set SSet.{u}) {C : SSet.{u}}
    (R : Set (Σ K : SSet.{u}, rightCone K ⟶ C)) : SSet.{u + 1} := sorry

/-- `j : C ⟶ P^𝒦_R(C)`, README L7 (`SSet.adjoinColimits.ι`; HTT 5.3.6.2). -/
def adjoinColimits.ι (𝒦 : Set SSet.{u}) {C : SSet.{u}}
    (R : Set (Σ K : SSet.{u}, rightCone K ⟶ C)) :
    uliftFunctor.{u + 1}.obj C ⟶ adjoinColimits 𝒦 R := sorry

/-- `P^{𝒦'}_𝒦(C)`, README L7 (`SSet.adjoinColimitsKeeping`; HTT Definition 5.3.6.5): adjoin
𝒦'-indexed colimits, keeping the 𝒦-indexed colimit diagrams. -/
def adjoinColimitsKeeping (𝒦 𝒦' : Set SSet.{u}) (C : SSet.{u}) : SSet.{u + 1} :=
  adjoinColimits 𝒦'
    (Set.ofPred fun x : (Σ K : SSet.{u}, rightCone K ⟶ C) ↦ x.1 ∈ 𝒦 ∧ IsColimitDiagram x.2)

/-! ### L7.6: truncated objects and morphisms, Postnikov towers -/

/-- Morphism spaces of quasicategories are Kan complexes (HTT 1.2.2.3; helper instance). -/
instance kanComplex_morphismSpace (C : SSet.{u}) [Quasicategory C] (x y : C _⦋0⦌) :
    KanComplex (morphismSpace C x y : SSet.{u}) := sorry

/-- Truncated objects, README L7 *Truncated objects* (`SSet.IsTruncatedObject`; HTT Definition
5.5.6.1): final for `k = −2`, and every `Hom_C(D, X)` k-truncated for `k ≥ −1`. -/
def IsTruncatedObject {C : SSet.{u}} [Quasicategory C] (k : ℤ) (X : C _⦋0⦌) : Prop :=
  if k ≤ -2 then IsTerminalVertex X
  else ∀ D : C _⦋0⦌, KanComplex.IsTruncated k (morphismSpace C D X : SSet.{u})

/-- The homotopy fibre of `g : X ⟶ Y` over `y`, `X ×_Y P_y Y` with `P_y Y` the paths ending at `y`
(helper for README L7 *Truncated morphisms*). -/
def homotopyFiber {X Y : SSet.{u}} (g : X ⟶ Y) (y : Y _⦋0⦌) : SSet.{u} :=
  pullback g (((Subcomplex.ofSimplex y).preimage (evalVertex Y 1)).ι ≫ evalVertex Y 0)

/-- Homotopy fibres of maps of Kan complexes are Kan complexes (helper instance). -/
instance kanComplex_homotopyFiber {X Y : SSet.{u}} [KanComplex X] [KanComplex Y] (g : X ⟶ Y)
    (y : Y _⦋0⦌) : KanComplex (homotopyFiber g y) := sorry

/-- Truncated maps of Kan complexes, README L7 *Truncated morphisms*
(`SSet.KanComplex.IsTruncatedMap`; HTT Definition 5.5.6.8): all homotopy fibres k-truncated (for
`k = −2`, weakly contractible, so g is a homotopy equivalence). -/
def KanComplex.IsTruncatedMap (k : ℤ) {X Y : SSet.{u}} [KanComplex X] [KanComplex Y]
    (g : X ⟶ Y) : Prop :=
  ∀ y : Y _⦋0⦌, KanComplex.IsTruncated k (homotopyFiber g y)

/-- A postcomposition map `Hom_C(E, c) ⟶ Hom_C(E, d)` with `f`, chosen up to homotopy (README L7
*Truncated morphisms*; independence of the choice is a lemma). -/
def postcompMorphismSpace {C : SSet.{u}} [Quasicategory C] {c d : C _⦋0⦌} (f : Edge c d)
    (E : C _⦋0⦌) : (morphismSpace C E c : SSet.{u}) ⟶ (morphismSpace C E d : SSet.{u}) := sorry

/-- Truncated morphisms, README L7 *Truncated morphisms* (`SSet.IsTruncatedMorphism`; HTT
Definition 5.5.6.8). -/
def IsTruncatedMorphism {C : SSet.{u}} [Quasicategory C] (k : ℤ) {c d : C _⦋0⦌} (f : Edge c d) :
    Prop :=
  ∀ E : C _⦋0⦌, KanComplex.IsTruncatedMap k (postcompMorphismSpace f E)

/-- Monomorphisms, README L7 (`SSet.IsMonomorphism`; after HTT 5.5.6.13): (−1)-truncated
morphisms. -/
def IsMonomorphism {C : SSet.{u}} [Quasicategory C] {c d : C _⦋0⦌} (f : Edge c d) : Prop :=
  IsTruncatedMorphism (-1) f

/-- The shape `N(ℤ^∞_{≥0})^op = N(ℕ∞)ᵒᵖ` of towers, lifted (README L7 *Postnikov towers*). -/
abbrev towerShape : SSet.{u} := uliftFunctor.{u}.obj (nerve (ℕ∞)ᵒᵖ)

/-- The shape `N(ℤ_{≥0})^op` of pretowers, lifted (README L7 *Postnikov towers*). -/
abbrev pretowerShape : SSet.{u} := uliftFunctor.{u}.obj (nerve ℕᵒᵖ)

/-- The edge `∞ ⟶ n` of `N(ℕ∞)ᵒᵖ` (helper). -/
def towerSimplex (n : ℕ) : towerShape.{u} _⦋1⦌ :=
  ⟨(ComposableArrows.mk₁ (homOfLE (le_top : ((n : ℕ∞)) ≤ ⊤)).op : ComposableArrows (ℕ∞)ᵒᵖ 1)⟩

/-- The edge `n + 1 ⟶ n` of `N(ℕ)ᵒᵖ` (helper). -/
def pretowerSimplex (n : ℕ) : pretowerShape.{u} _⦋1⦌ :=
  ⟨(ComposableArrows.mk₁ (homOfLE n.le_succ).op : ComposableArrows ℕᵒᵖ 1)⟩

/-- Postnikov towers, README L7 *Postnikov towers* (`SSet.IsPostnikovTower`; HTT Definition
5.5.6.23): every `X(∞) ⟶ X(n)` is an n-truncation. -/
def IsPostnikovTower {C : SSet.{u}} [Quasicategory C] (X : towerShape.{u} ⟶ C) : Prop :=
  ∀ n : ℕ, Edge.IsLocalizationInto {Y | IsTruncatedObject n Y} ((Edge.mk' (towerSimplex n)).map X)

/-- Postnikov pretowers, README L7 (HTT 5.5.6.23): every `X(n + 1) ⟶ X(n)` is an n-truncation. -/
def IsPostnikovPretower {C : SSet.{u}} [Quasicategory C] (X : pretowerShape.{u} ⟶ C) : Prop :=
  ∀ n : ℕ, Edge.IsLocalizationInto {Y | IsTruncatedObject n Y}
    ((Edge.mk' (pretowerSimplex n)).map X)

/-- `Post⁺(C)`, README L7 (`SSet.postnikovTowers`; HTT 5.5.6.23). -/
def postnikovTowers (C : SSet.{u}) [Quasicategory C] : ((ihom towerShape.{u}).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsPostnikovTower (ihomVertexEquiv v)

/-- `Post(C)`, README L7 (`SSet.postnikovPretowers`; HTT 5.5.6.23). -/
def postnikovPretowers (C : SSet.{u}) [Quasicategory C] :
    ((ihom pretowerShape.{u}).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsPostnikovPretower (ihomVertexEquiv v)

/-- The inclusion `N(ℕ)ᵒᵖ ⟶ N(ℕ∞)ᵒᵖ`, lifted (helper). -/
def pretowerToTower : pretowerShape.{u} ⟶ towerShape.{u} :=
  uliftFunctor.{u}.map (nerveMap (Monotone.functor (Nat.mono_cast : Monotone ((↑) : ℕ → ℕ∞))).op)

/-- Restriction `Post⁺(C) ⟶ Post(C)`, README L7 (HTT 5.5.6.23; that it lands in `Post(C)` is a
lemma). -/
def postnikovRestrict (C : SSet.{u}) [Quasicategory C] :
    (postnikovTowers C : SSet.{u}) ⟶ (postnikovPretowers C : SSet.{u}) :=
  Subcomplex.lift (Subcomplex.ι _ ≫ (MonoidalClosed.pre pretowerToTower).app C) sorry

/-- Convergence of Postnikov towers, README L7 (`SSet.PostnikovTowersConverge`; HTT 5.5.6.23). -/
def PostnikovTowersConverge (C : SSet.{u}) [Quasicategory C] : Prop :=
  IsCategoricalEquivalence (postnikovRestrict C)

/-! ### L7.7–L7.9: compact generation, `Pr^R_κ`, `Pr^L_κ`, sifted colimits, projective objects -/

/-- κ-compactly generated ∞-categories, README L7 *κ-compactly generated ∞-categories*
(`SSet.IsCardinalLocallyPresentable`; HTT Definition 5.5.7.1). -/
def IsCardinalLocallyPresentable (C : SSet.{v}) [Quasicategory C] (κ : Cardinal.{u})
    [Fact κ.IsRegular] : Prop :=
  IsPresentable.{v, u} C ∧ IsCardinalAccessible C κ

/-- Compactly generated ∞-categories, README L7 (`SSet.IsCompactlyGenerated`; HTT 5.5.7.1). -/
def IsCompactlyGenerated (C : SSet.{v}) [Quasicategory C] : Prop :=
  IsCardinalLocallyPresentable.{v, u} C ℵ₀

/-- `Pr^R_κ ⊆ Cat∞^`, README L7 *`Pr^R_κ`* (`SSet.prRCardinal`, propose; HTT Definition 5.5.7.5). -/
def prRCardinal (κ : Cardinal.{u}) [Fact κ.IsRegular]
    [(catInfty.functorClass.{u + 1} fun _ _ F ↦
      (∃ hC : HasCardinalFilteredColimits.{u, u + 1, u} _ κ, IsCardinalContinuous F κ hC) ∧
        PreservesSmallLimits.{u + 1, u} F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsCardinalLocallyPresentable.{u + 1, u} C κ) fun _ _ F ↦
    (∃ hC : HasCardinalFilteredColimits.{u, u + 1, u} _ κ, IsCardinalContinuous F κ hC) ∧
      PreservesSmallLimits.{u + 1, u} F

/-- The functors of `Pr^L_κ`: preserving small colimits and κ-compact objects (helper for HTT
Notation 5.5.7.7). -/
def PrLCardinalFunctor (κ : Cardinal.{u}) [Fact κ.IsRegular] {C D : SSet.{u + 1}}
    [Quasicategory C] [Quasicategory D] (F : C ⟶ D) : Prop :=
  PreservesSmallColimits.{u + 1, u} F ∧
    ∃ (hC : HasCardinalFilteredColimits.{u, u + 1, u} C κ)
      (hD : HasCardinalFilteredColimits.{u, u + 1, u} D κ),
      ∀ X, IsCardinalPresentable X κ hC → IsCardinalPresentable (F.app _ X) κ hD

/-- `Pr^L_κ ⊆ Cat∞^`, README L7 *`Pr^L_κ` and κ-small colimits* (`SSet.prLCardinal`, propose; HTT
Notation 5.5.7.7). -/
def prLCardinal (κ : Cardinal.{u}) [Fact κ.IsRegular]
    [(catInfty.functorClass.{u + 1} fun _ _ F ↦ PrLCardinalFunctor κ F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ IsCardinalLocallyPresentable.{u + 1, u} C κ)
    fun _ _ F ↦ PrLCardinalFunctor κ F

/-- Functors preserving κ-small colimits (helper for HTT Notation 5.5.7.7). -/
def PreservesColimitsOfSize (κ : Cardinal.{w}) {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ K : SSet.{u}, HasCardinalLT K.N κ → ∀ pbar : rightCone K ⟶ C, PreservesColimit F pbar

/-- `Cat∞^{Rex(κ)}` inside `Cat∞` of universe `u`, README L7 (HTT Notation 5.5.7.7; helper for
`SSet.catInftyRex` and `SSet.catInftyRexSmall`). -/
def catInftyRexOf (κ : Cardinal.{w})
    [(catInfty.functorClass.{u} fun _ _ F ↦ PreservesColimitsOfSize κ F).IsMultiplicative] :
    catInfty.{u}.Subcomplex :=
  catInfty.subcategory (fun C _ ↦ HasColimitsOfSize κ C) fun _ _ F ↦ PreservesColimitsOfSize κ F

/-- `(Cat∞^)^{Rex(κ)}`, README L7 (`SSet.catInftyRex`, propose; HTT Notation 5.5.7.7). -/
abbrev catInftyRex (κ : Cardinal.{w})
    [(catInfty.functorClass.{u + 1} fun _ _ F ↦ PreservesColimitsOfSize κ F).IsMultiplicative] :
    catInfty.{u + 1}.Subcomplex :=
  catInftyRexOf.{w, u + 1} κ

/-- `Cat∞^{Rex(κ)}` of small ∞-categories, README L7 (`SSet.catInftyRexSmall`, propose; HTT
Notation 5.5.7.7). -/
abbrev catInftyRexSmall (κ : Cardinal.{w})
    [(catInfty.functorClass.{u} fun _ _ F ↦ PreservesColimitsOfSize κ F).IsMultiplicative] :
    catInfty.{u}.Subcomplex :=
  catInftyRexOf.{w, u} κ

/-- Sifted simplicial sets, README L7 *Sifted simplicial sets* (`SSet.IsSifted`; HTT Definition
5.5.8.1): nonempty with cofinal diagonal. -/
def IsSifted (K : SSet.{u}) : Prop :=
  Nonempty (K _⦋0⦌) ∧ IsCofinal (lift (𝟙 K) (𝟙 K) : K ⟶ K ⊗ K)

/-- `P_Σ(C) ⊆ P(C)`, the presheaves preserving finite products, README L7 *`P_Σ(C)`*
(`SSet.pSigma`; HTT Definition 5.5.8.8): carrying limit diagrams over finite discrete simplicial
sets in `C^op` to limit diagrams. -/
def pSigma (C : SSet.{u}) : (presheaf C).Subcomplex :=
  fullEnhancedSubcategory _ fun F ↦ ∀ (A : Type (u + 1)) [Finite A]
    (pbar : leftCone (discrete A) ⟶ uliftFunctor.{u + 1}.obj C.op),
    IsLimitDiagram pbar → IsLimitDiagram (pbar ≫ ihomVertexEquiv F)

/-- Projective objects, README L7 *Projective objects* (`SSet.IsProjectiveObject`; HTT Definition
5.5.8.18): `j_P` preserves geometric realizations; Lurie's hypothesis `hC` is an argument. -/
def IsProjectiveObject {C : SSet.{u}} [Quasicategory C] (P : C _⦋0⦌)
    (_hC : HasColimitsOfShape nerveSimplexOp.{u} C) : Prop :=
  ∀ Up : augmentedSimplicialObjects C, IsGeometricRealization Up →
    IsColimitDiagram ((rightCone.uliftIso nerveSimplexOp.{u}).inv ≫
      uliftFunctor.{u + 1}.map (geometricRealizationIso.hom ≫ Up) ≫ corepresented C P)

/-- Small colimits give small κ-filtered colimits (helper for README L7 *Projectively generated*). -/
theorem HasSmallColimits.hasCardinalFilteredColimits {C : SSet.{v}}
    (hC : HasSmallColimits.{v, u} C) (κ : Cardinal.{w}) :
    HasCardinalFilteredColimits.{w, v, u} C κ := sorry

/-- Small colimits give geometric realizations (helper for README L7 *Projectively generated*). -/
theorem HasSmallColimits.hasColimitsOfShape_nerveSimplexOp {C : SSet.{v}}
    (hC : HasSmallColimits.{v, u} C) : HasColimitsOfShape nerveSimplexOp.{v} C := sorry

/-- Sets of compact projective generators, README L7 *Projectively generated ∞-categories*
(`SSet.IsCompactProjectiveGenerators`; HTT Definition 5.5.8.23). -/
def IsCompactProjectiveGenerators {C : SSet.{v}} [Quasicategory C] (S : Set (C _⦋0⦌))
    (hC : HasSmallColimits.{v, u} C) : Prop :=
  (∀ P ∈ S, IsCardinalPresentable P (ℵ₀ : Cardinal.{u}) (hC.hasCardinalFilteredColimits _) ∧
    IsProjectiveObject P hC.hasColimitsOfShape_nerveSimplexOp) ∧
    IsEssentiallySmall.{v, u} (fullEnhancedSubcategory C (· ∈ S) : SSet) ∧
    GeneratesUnderColimits S hC

/-- Projectively generated ∞-categories, README L7 (`SSet.IsProjectivelyGenerated`; HTT
5.5.8.23). -/
def IsProjectivelyGenerated {C : SSet.{v}} [Quasicategory C] (hC : HasSmallColimits.{v, u} C) :
    Prop :=
  ∃ S : Set (C _⦋0⦌), IsCompactProjectiveGenerators S hC

/-- The functor sending a set to its nonempty finite subsets, README L7 *Nonempty finite subsets*
(`SSet.nonemptyFinsetFunctor`, propose; HTT Notation 5.5.9.11). -/
def nonemptyFinsetFunctor : Type u ⥤ Type u where
  obj S := {s : Finset S // s.Nonempty}
  map f := ↾fun s ↦ by classical exact ⟨s.1.image (fun x ↦ f x), s.2.image _⟩
  map_id := sorry
  map_comp := sorry

/-- `M(K)`, README L7 (`SSet.nonemptyFinsets`, propose; HTT Notation 5.5.9.11). -/
def nonemptyFinsets (K : SSet.{u}) : SSet.{u} := K ⋙ nonemptyFinsetFunctor

end SSet

/-! ### L7.9: `Env(C)` and the functors L, L⁺ (HTT Notation 5.5.9.4) -/

namespace CategoryTheory

/-- `Env⁺(C)`, finite families `(J, (C_j))`, README L7 *`Env(C)` and the functors L, L⁺*
(`CategoryTheory.EnvPlus`, propose; HTT Notation 5.5.9.4), with `J = Fin n`. -/
structure EnvPlus (C : Type u) where
  /-- The size of the family. -/
  n : ℕ
  /-- The family. -/
  obj : Fin n → C

/-- Morphisms `(J, C) ⟶ (J', C')` of `Env⁺(C)`: `f : J' ⟶ J` with maps `C_{f(j')} ⟶ C'_{j'}`. -/
structure EnvPlus.Hom {C : Type u} [Category.{v} C] (X Y : EnvPlus C) where
  /-- The map of index sets. -/
  f : Fin Y.n → Fin X.n
  /-- The maps of objects. -/
  maps : ∀ j, X.obj (f j) ⟶ Y.obj j

/-- The category `Env⁺(C)`, README L7 (HTT 5.5.9.4). -/
instance {C : Type u} [Category.{v} C] : Category (EnvPlus C) where
  Hom := EnvPlus.Hom
  id X := ⟨id, fun _ ↦ 𝟙 _⟩
  comp a b := ⟨a.f ∘ b.f, fun k ↦ a.maps (b.f k) ≫ b.maps k⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- `Env(C)`, the families with J nonempty, README L7 (`CategoryTheory.Env`, propose; HTT
5.5.9.4). -/
structure Env (C : Type u) where
  /-- The underlying family. -/
  toEnvPlus : EnvPlus C
  pos : 0 < toEnvPlus.n

/-- The category `Env(C)`: the morphisms with `f` surjective, README L7 (HTT 5.5.9.4). -/
instance {C : Type u} [Category.{v} C] : Category (Env C) where
  Hom X Y := {φ : X.toEnvPlus ⟶ Y.toEnvPlus // Function.Surjective φ.f}
  id X := ⟨𝟙 X.toEnvPlus, Function.surjective_id⟩
  comp a b := ⟨a.1 ≫ b.1, a.2.comp b.2⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The inclusion `Env(C) ⥤ Env⁺(C)`, README L7 (HTT 5.5.9.4). -/
def Env.forget (C : Type u) [Category.{v} C] : Env C ⥤ EnvPlus C where
  obj X := X.toEnvPlus
  map φ := φ.1

/-- `θ : C ⥤ Env(C)`, `c ↦ (Unit, c)`, README L7 (HTT 5.5.9.4). -/
def Env.θ (C : Type u) [Category.{v} C] : C ⥤ Env C where
  obj c := ⟨⟨1, fun _ ↦ c⟩, Nat.one_pos⟩
  map g := ⟨⟨id, fun _ ↦ g⟩, Function.surjective_id⟩
  map_id := sorry
  map_comp := sorry

/-- `E⁺ : Fun(C, SSet) ⥤ Fun(Env⁺(C), SSet)`, `F ↦ ((J, C) ↦ ∏ⱼ F(C_j))`, README L7 (HTT
5.5.9.4). -/
def EnvPlus.E (C : Type u) [SmallCategory C] : (C ⥤ SSet.{u}) ⥤ (EnvPlus C ⥤ SSet.{u}) where
  obj F :=
    { obj X := ∏ᶜ fun j ↦ F.obj (X.obj j)
      map φ := Pi.lift fun k ↦ Pi.π _ (φ.f k) ≫ F.map (φ.maps k)
      map_id := sorry
      map_comp := sorry }
  map α :=
    { app X := Limits.Pi.map fun j ↦ α.app (X.obj j)
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- `E`, the restriction of `E⁺` along `Env(C) ⥤ Env⁺(C)`, README L7 (HTT 5.5.9.4). -/
def Env.E (C : Type u) [SmallCategory C] : (C ⥤ SSet.{u}) ⥤ (Env C ⥤ SSet.{u}) :=
  EnvPlus.E C ⋙ (Functor.whiskeringLeft _ _ _).obj (Env.forget C)

/-- `φ⁺ : Env⁺(C) ⥤ C`, `(J, C) ↦ ∏ⱼ C_j`, for C with finite products, README L7 (HTT 5.5.9.4). -/
def EnvPlus.φ (C : Type u) [SmallCategory C] [HasFiniteProducts C] : EnvPlus C ⥤ C where
  obj X := ∏ᶜ X.obj
  map φ := Pi.lift fun k ↦ Pi.π _ (φ.f k) ≫ φ.maps k
  map_id := sorry
  map_comp := sorry

/-- `φ`, the restriction of `φ⁺` to `Env(C)`, README L7 (HTT 5.5.9.4). -/
def Env.φ (C : Type u) [SmallCategory C] [HasFiniteProducts C] : Env C ⥤ C :=
  Env.forget C ⋙ EnvPlus.φ C

/-- `L := E ⋙ φ.lan`, README L7 (HTT 5.5.9.4). -/
def Env.L (C : Type u) [SmallCategory C] [HasFiniteProducts C] :
    (C ⥤ SSet.{u}) ⥤ (C ⥤ SSet.{u}) :=
  Env.E C ⋙ (Env.φ C).lan

/-- `L⁺ := E⁺ ⋙ φ⁺.lan`, README L7 (HTT 5.5.9.4). -/
def EnvPlus.L (C : Type u) [SmallCategory C] [HasFiniteProducts C] :
    (C ⥤ SSet.{u}) ⥤ (C ⥤ SSet.{u}) :=
  EnvPlus.E C ⋙ (EnvPlus.φ C).lan

/-- `α : 𝟭 ⟶ L`, from `θ^* ∘ E ≅ 𝟭`, README L7 (HTT 5.5.9.4). -/
def Env.α (C : Type u) [SmallCategory C] [HasFiniteProducts C] : 𝟭 _ ⟶ Env.L C := sorry

/-- `β : L ⟶ L⁺`, from `Env(C) ⊆ Env⁺(C)`, README L7 (HTT 5.5.9.4). -/
def Env.β (C : Type u) [SmallCategory C] [HasFiniteProducts C] : Env.L C ⟶ EnvPlus.L C := sorry

end CategoryTheory

/-! ## Extension 3: layers L9, L10, L11, L12

Prototypes of the Definition, Notation and prose-definition targets of L9 (HA chapter 1), L10
(HTT §§6.1–6.2), L11 (HTT §§6.3–6.5, 7.3.4.2) and L12 (HTT §§7.1–7.3), in the form of their README
*Lean:* lines.

Targets of other layers that these definitions need and that the sections above do not declare
(`SSet.IsPushout` of L5.10, the truncation predicates of L7.7, `SSet.IsLocalObject` and the
strongly saturated classes of L7.6, `SSet.IsAccessibleFunctor` of L7.3, the preservation and
finite-limit predicates of L5.6, `SSet.pointedObjects` and the simplicial objects of L6.8, the
adjunction predicate of L1.2, and a few chosen constructions) are prototyped first, in the block
*Supporting targets of other layers*. Chosen constructions that are themselves targets elsewhere (a chosen pullback, the
colimit functor, Kan extensions, the coskeleton unit, the decoding of simplices of `Cat∞`) are
`sorry`-bodied data. Every `Prop` is stated.

The Tau Ceti main declarations used here are imported: `SSet.KanComplex.π` with its
induced maps, `SSet.CartesianFibration`, `SSet.catInfty`, `TauCeti.dgNerve`, `TauCeti.dgNerveEquiv`,
`TauCeti.DGFullSubcategory`, `TauCeti.DGSimplicialCategory` and
`TauCeti.linearHomComplexEnrichedCategory`.
-/

namespace SSet

open _root_.SSet

/-! ### Ext. 3: supporting targets of other layers -/

/-- The vertex `i` of `Δ[1]` as a map `Δ[0] ⟶ Δ[1]` (helper for squares). -/
def vertexMap (i : Fin 2) : (Δ[0] : SSet.{u}) ⟶ Δ[1] :=
  yonedaEquiv.symm (stdSimplex.obj₀Equiv.symm i)

/-- The constant map `K ⟶ Δ[1]` at the vertex `i` (helper for squares). -/
def constMap (K : SSet.{u}) (i : Fin 2) : K ⟶ Δ[1] :=
  stdSimplex.isTerminalObj₀.from K ≫ vertexMap i

/-- The vertex `(i, j)` of a square `σ : Δ[1] ⊗ Δ[1] ⟶ C` (helper; the first coordinate is
horizontal, the second vertical). -/
def squareVertex {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) (i j : Fin 2) : C _⦋0⦌ :=
  yonedaEquiv (lift (vertexMap i) (vertexMap j) ≫ σ)

/-- The horizontal edge `(0, j) ⟶ (1, j)` of `Δ[1] ⊗ Δ[1]` (helper). -/
def squareH (j : Fin 2) : (Δ[1] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] := lift (𝟙 _) (constMap _ j)

/-- The vertical edge `(i, 0) ⟶ (i, 1)` of `Δ[1] ⊗ Δ[1]` (helper). -/
def squareV (i : Fin 2) : (Δ[1] : SSet.{u}) ⟶ Δ[1] ⊗ Δ[1] := lift (constMap _ i) (𝟙 _)

/-- The horizontal edge `σ(0, j) ⟶ σ(1, j)` of a square, as an edge (helper). -/
abbrev squareHEdge {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) (j : Fin 2) :=
  Edge.mk' (yonedaEquiv (squareH j ≫ σ))

/-- The vertical edge `σ(i, 0) ⟶ σ(i, 1)` of a square, as an edge (helper). -/
abbrev squareVEdge {C : SSet.{u}} (σ : Δ[1] ⊗ Δ[1] ⟶ C) (i : Fin 2) :=
  Edge.mk' (yonedaEquiv (squareV i ≫ σ))

/-- The cone point of `K^▷` (helper). -/
def rightCone.pt (K : SSet.{u}) : (rightCone K) _⦋0⦌ :=
  (join.inr K Δ[0]).app _ (stdSimplex.obj₀Equiv.symm 0)

/-- The cone point of `K^◁` (helper). -/
def leftCone.pt (K : SSet.{u}) : (leftCone K) _⦋0⦌ :=
  (join.inl Δ[0] K).app _ (stdSimplex.obj₀Equiv.symm 0)

/-- The vertex of `K^▷` coming from `k` (helper). -/
def rightCone.incl {K : SSet.{u}} (k : K _⦋0⦌) : (rightCone K) _⦋0⦌ := (join.inl K Δ[0]).app _ k

/-- The vertex of `K^◁` coming from `k` (helper). -/
def leftCone.incl {K : SSet.{u}} (k : K _⦋0⦌) : (leftCone K) _⦋0⦌ := (join.inr Δ[0] K).app _ k

/-- The edge of `C` given by a vertex of `Fun(Δ[1], C)` (helper for classes of morphisms). -/
abbrev arrowEdge {C : SSet.{u}} (v : ((ihom Δ[1]).obj C) _⦋0⦌) :=
  Edge.mk' (yonedaEquiv (ihomVertexEquiv v))

/-- The vertex `i` of the arrow given by a vertex of `Fun(Δ[1], C)` (helper). -/
def arrowVertex {C : SSet.{u}} (v : ((ihom Δ[1]).obj C) _⦋0⦌) (i : Fin 2) : C _⦋0⦌ :=
  yonedaEquiv (vertexMap i ≫ ihomVertexEquiv v)

/-- The subcomplex of the simplices all of whose vertices satisfy `P` and all of whose edges
satisfy `Q`: README L1.3 *Subcategories* in the form used by `Cat∞^Ex`, `LTop`, `RTop`,
`Cat∞^lex` and `O^{(S)}_X` (helper; HTT 1.2.11). -/
def subcomplexOf (X : SSet.{u}) (P : X _⦋0⦌ → Prop) (Q : X _⦋1⦌ → Prop) : X.Subcomplex where
  obj n := {s | (∀ v : ⦋0⦌ ⟶ n.unop, P (X.map v.op s)) ∧ ∀ e : ⦋1⦌ ⟶ n.unop, Q (X.map e.op s)}
  map _ _ _ := sorry

/-- The fibre `p⁻¹(s)` of a map over a vertex (helper). -/
abbrev fibre {X S : SSet.{u}} (p : X ⟶ S) (s : S _⦋0⦌) : SSet.{u} :=
  Limits.pullback p (yonedaEquiv.symm s)

/-- The fibre of an inner fibration is a quasicategory (helper instance). -/
instance quasicategory_fibre {X S : SSet.{u}} [Quasicategory X] (p : X ⟶ S) (s : S _⦋0⦌) :
    Quasicategory (fibre p s) := sorry

/-- A subcomplex of a quasicategory spanned by vertices is a quasicategory (helper instance for
full subcategories). -/
instance quasicategory_subcomplex {X : SSet.{u}} [Quasicategory X] (A : X.Subcomplex) :
    Quasicategory (A : SSet.{u}) := sorry

/-- Slices of a quasicategory are quasicategories (helper instance, HTT 1.2.9.3). -/
instance quasicategory_slice {K C : SSet.{u}} [Quasicategory C] (p : K ⟶ C) :
    Quasicategory (slice p) := sorry

/-- The vertex `(x, y)` of `Δ[1] ⊗ Δ[2]` (helper for distinguished triangles). -/
def rectVertex {C : SSet.{u}} (τ : Δ[1] ⊗ Δ[2] ⟶ C) (i : Fin 2) (j : Fin 3) : C _⦋0⦌ :=
  yonedaEquiv (lift (vertexMap i) (yonedaEquiv.symm (stdSimplex.obj₀Equiv.symm j)) ≫ τ)


/-- Finite limits, README L5.6 supporting predicate: limits of every finite simplicial set (Mathlib
`SSet.Finite`). -/
def HasFiniteLimits (C : SSet.{u}) : Prop :=
  ∀ K : SSet.{u}, K.Finite → HasLimitsOfShape K C

/-- Preservation of finite limits, README L5.6 supporting predicate (`SSet.PreservesColimit`,
dual, finite shapes). -/
def PreservesFiniteLimits {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ K : SSet.{u}, K.Finite → ∀ pbar : leftCone K ⟶ C, IsLimitDiagram pbar → IsLimitDiagram (pbar ≫ F)


/-- Adjunctions of functors between quasicategories, README L1.2 *Adjunctions*
(`HTT.1.2.7/adjunction`; Conventions row *adjunction*): a `Bicategory.Adjunction` in
`SSet.QCat.bicategory` (helper form of `L ⊣ g`). -/
def IsAdjunction {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] (L : A ⟶ B) (g : B ⟶ A) :
    Prop :=
  Nonempty (Bicategory.Adjunction
    (ObjectProperty.homMk L : (⟨A, ‹_›⟩ : SSet.QCat.{u}) ⟶ ⟨B, ‹_›⟩)
    (ObjectProperty.homMk g : (⟨B, ‹_›⟩ : SSet.QCat.{u}) ⟶ ⟨A, ‹_›⟩))


/-- Postcomposition `Hom_C(E, x) ⟶ Hom_C(E, y)` with `f`, chosen (README L7.7 *truncated
morphisms*: "chosen up to homotopy"); a construction of L1.5. -/
def morphismSpace.postcomp {C : SSet.{u}} [Quasicategory C] {x y : C _⦋0⦌} (f : Edge x y)
    (E : C _⦋0⦌) : (morphismSpace C E x : SSet.{u}) ⟶ (morphismSpace C E y : SSet.{u}) := sorry


/-- The full subcategory `τ_{≤k} C` of k-truncated objects (helper; HTT 5.5.6.1). -/
abbrev truncatedSubcategory (k : ℤ) (C : SSet.{u}) [Quasicategory C] : SSet.{u} :=
  (fullEnhancedSubcategory C fun X ↦ IsTruncatedObject k X : SSet)

/-- The class of an edge in `Map_C(x, y) ∈ H` (helper, README L1.5 *Mapping objects in H*). -/
def edgeClass {C : SSet.{u}} {x y : C _⦋0⦌} (s : Edge x y) :
    𝟙_ SSet.H.{u} ⟶ EnrichedCategory.Hom (V := SSet.H.{u}) (C := hoEnriched C) x y := sorry


/-- Classes stable under pullback, README L10 (`SSet.IsStableUnderPullback`; HTT Notation
6.1.3.4): in a pullback square, if the right edge `σ(1,0) ⟶ σ(1,1)` is in S, so is the left edge. -/
def IsStableUnderPullback {X : SSet.{u}} (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ X, IsPullback σ → S (squareVEdge σ 1) → S (squareVEdge σ 0)


/-- The inclusion `N(Δ)^op ⟶ N(Δ₊)^op` (helper, through `geometricRealizationIso`). -/
def augmentationInclusion : nerveSimplexOp.{u} ⟶ nerveAugmentedOp.{u} :=
  join.inl _ Δ[0] ≫ geometricRealizationIso.hom


/-- The colimit functor `Fun(K, C) ⟶ C`, README L6 (`SSet.colimFunctor`; HTT 4.2.3.15), from a
chosen section of the trivial fibration. -/
def colimFunctor (K C : SSet.{u}) : (ihom K).obj C ⟶ C := sorry

/-- The underlying quasicategory of a vertex of `Cat∞` (helper decoding Tau Ceti's
`SSet.catInfty`, README L4.1). -/
def catInfty.obj (v : SSet.catInfty.{u} _⦋0⦌) : SSet.{u} := sorry

/-- The underlying quasicategory of a vertex of `Cat∞` is a quasicategory (helper). -/
instance (v : SSet.catInfty.{u} _⦋0⦌) : Quasicategory (catInfty.obj v) := sorry

/-- The functor given by an edge of `Cat∞` (helper decoding Tau Ceti's `SSet.catInfty`). -/
def catInfty.edgeMap {v w : SSet.catInfty.{u} _⦋0⦌} (_e : Edge v w) :
    catInfty.obj v ⟶ catInfty.obj w := sorry

/-- The vertex of `Cat∞` given by a quasicategory (helper). -/
def catInfty.vertexOf (X : SSet.{u}) [Quasicategory X] : SSet.catInfty.{u} _⦋0⦌ := sorry

/-- A chosen final vertex (helper; HTT 1.2.12). -/
def chosenTerminal (X : SSet.{u}) : X _⦋0⦌ := sorry

/-- A chosen edge to the chosen final vertex (helper; HTT 1.2.12.6). -/
def toChosenTerminal {X : SSet.{u}} (x : X _⦋0⦌) : Edge x (chosenTerminal X) := sorry

end SSet

/-! ### Ext. 3, L9.1: stable ∞-categories and their homotopy categories -/

namespace SSet

open _root_.SSet

/-- Zero objects, README L9.1 *Zero objects and pointed ∞-categories* (`SSet.IsZeroObject`; HA
Definition 1.1.1.1; also HTT Definition 7.2.2.7): both final and initial. -/
def IsZeroObject {C : SSet.{u}} (X : C _⦋0⦌) : Prop := IsTerminalVertex X ∧ IsInitialVertex X

/-- Pointed ∞-categories, README L9.1 (`SSet.IsPointed`; HA Definition 1.1.1.1). -/
def IsPointed (C : SSet.{u}) : Prop := ∃ X : C _⦋0⦌, IsZeroObject X

/-- Triangles, README L9.1 *Triangles, fibre and cofibre sequences* (`SSet.Triangle`; HA
Definition 1.1.1.4): squares `X ⟶ Y`, `X ⟶ 0`, `Y ⟶ Z`, `0 ⟶ Z` whose vertex `(1, 0)` is a zero
object; `X = σ(0,0)`, `Y = σ(0,1)`, `0 = σ(1,0)`, `Z = σ(1,1)`. -/
def Triangle (C : SSet.{u}) : Type u :=
  {σ : Δ[1] ⊗ Δ[1] ⟶ C // IsZeroObject (squareVertex σ 1 0)}

/-- Fibre sequences, README L9.1 (`Triangle.IsFiberSequence`; HA 1.1.1.4): pullback triangles. -/
def Triangle.IsFiberSequence {C : SSet.{u}} (σ : Triangle C) : Prop := IsPullback σ.1

/-- Cofibre sequences, README L9.1 (`Triangle.IsCofiberSequence`; HA 1.1.1.4): pushout triangles. -/
def Triangle.IsCofiberSequence {C : SSet.{u}} (σ : Triangle C) : Prop := IsPushout σ.1

/-- Fibres, README L9.1 *Fibres and cofibres* (`SSet.IsFiber`; HA Definition 1.1.1.6): a fibre
sequence whose edge `(0, 1) ⟶ (1, 1)` is `g`. -/
def IsFiber {C : SSet.{u}} {x y : C _⦋0⦌} (g : Edge x y) (σ : Triangle C) : Prop :=
  σ.IsFiberSequence ∧ yonedaEquiv (squareH 1 ≫ σ.1) = g.edge

/-- Cofibres, README L9.1 (`SSet.IsCofiber`; HA 1.1.1.6): a cofibre sequence whose edge
`(0, 0) ⟶ (0, 1)` is `g`. -/
def IsCofiber {C : SSet.{u}} {x y : C _⦋0⦌} (g : Edge x y) (σ : Triangle C) : Prop :=
  σ.IsCofiberSequence ∧ yonedaEquiv (squareV 0 ≫ σ.1) = g.edge

/-- Every edge has a fibre, README L9.1 (`SSet.HasFibers`; HA 1.1.1.6). -/
def HasFibers (C : SSet.{u}) : Prop :=
  ∀ ⦃x y : C _⦋0⦌⦄ (g : Edge x y), ∃ σ : Triangle C, IsFiber g σ

/-- Every edge has a cofibre, README L9.1 (`SSet.HasCofibers`; HA 1.1.1.6). -/
def HasCofibers (C : SSet.{u}) : Prop :=
  ∀ ⦃x y : C _⦋0⦌⦄ (g : Edge x y), ∃ σ : Triangle C, IsCofiber g σ

/-- Stable ∞-categories, README L9.1 *Stable ∞-categories* (`SSet.IsStable`; HA Definition
1.1.1.9): pointed, with fibres and cofibres, fibre sequences being exactly cofibre sequences. -/
class IsStable (C : SSet.{u}) [Quasicategory C] : Prop where
  isPointed : IsPointed C
  hasFibers : HasFibers C
  hasCofibers : HasCofibers C
  isFiberSequence_iff (σ : Triangle C) : σ.IsFiberSequence ↔ σ.IsCofiberSequence

end SSet

/-- HA's additive categories, README L9.1 *Additive categories* (`CategoryTheory.IsHAAdditive`,
propose; HA Definition 1.1.2.1): a zero object, finite products and coproducts, `X ⨿ Y ⟶ X ⨯ Y`
(components `𝟙` and `0`) an isomorphism, and inverses for the induced addition
`f + g = lift f g ≫ (X ⨿ Y ≅ X ⨯ Y)⁻¹ ≫ desc 𝟙 𝟙`. -/
class CategoryTheory.IsHAAdditive (C : Type u) [Category.{v} C] : Prop where
  hasZeroObject : HasZeroObject C
  hasFiniteProducts : HasFiniteProducts C
  hasFiniteCoproducts : HasFiniteCoproducts C
  isIso_coprodToProd (X Y : C) :
    letI := hasZeroObject; letI := hasFiniteProducts; letI := hasFiniteCoproducts
    letI := HasZeroObject.zeroMorphismsOfZeroObject (C := C)
    IsIso (coprod.desc (prod.lift (𝟙 X) (0 : X ⟶ Y)) (prod.lift (0 : Y ⟶ X) (𝟙 Y)))
  exists_neg {X Y : C} (f : X ⟶ Y) :
    letI := hasZeroObject; letI := hasFiniteProducts; letI := hasFiniteCoproducts
    letI := HasZeroObject.zeroMorphismsOfZeroObject (C := C)
    haveI := isIso_coprodToProd Y Y
    ∃ g : X ⟶ Y, prod.lift f g ≫
      inv (coprod.desc (prod.lift (𝟙 Y) (0 : Y ⟶ Y)) (prod.lift (0 : Y ⟶ Y) (𝟙 Y))) ≫
        coprod.desc (𝟙 Y) (𝟙 Y) = 0

/-- Triangulated categories, README L9.1 (HA Definition 1.1.2.5): no new definition; Mathlib's
`Pretriangulated` (TR1–TR3) and `IsTriangulated` (TR4). -/
example (D : Type u) [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
    [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D] : Prop := IsTriangulated D

namespace SSet

open _root_.SSet

/-- The full subcategory `M_Σ ⊆ Fun(Δ[1] × Δ[1], C)` of pushout squares with zero corners
`(1, 0)` and `(0, 1)`, README L9.1 *Suspension and loops* (HA, before Remark 1.1.2.6). -/
def suspensionSquares (C : SSet.{u}) : ((ihom (Δ[1] ⊗ Δ[1])).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsPushout (ihomVertexEquiv v) ∧
    IsZeroObject (squareVertex (ihomVertexEquiv v) 1 0) ∧
      IsZeroObject (squareVertex (ihomVertexEquiv v) 0 1)

/-- Evaluation `Fun(Δ[1] × Δ[1], C) ⟶ C` at a vertex of the square (helper). -/
def evalSquareVertex (C : SSet.{u}) (i j : Fin 2) : (ihom (Δ[1] ⊗ Δ[1])).obj C ⟶ C :=
  lift (stdSimplex.isTerminalObj₀.from _ ≫ lift (vertexMap i) (vertexMap j)) (𝟙 _) ≫
    (ihom.ev (Δ[1] ⊗ Δ[1])).app C

/-- The trivial fibration `M_Σ ⟶ C`, evaluation at the initial vertex, README L9.1 *Suspension and
loops* (HA, before Remark 1.1.2.6; HTT 4.3.2.15 twice). -/
def suspensionSquares.ev₀ (C : SSet.{u}) : (suspensionSquares C : SSet.{u}) ⟶ C :=
  (suspensionSquares C).ι ≫ evalSquareVertex C 0 0

/-- The suspension functor `Σ_C`, README L9.1 *Suspension and loops* (`SSet.suspension`; HA,
before Remark 1.1.2.6): a chosen section of `suspensionSquares.ev₀` followed by evaluation at the
final vertex. -/
def suspension (C : SSet.{u}) [Quasicategory C] : C ⟶ C := sorry

/-- The loop functor `Ω_C`, README L9.1 (`SSet.loops`; HA Remark 1.1.2.6): dually, from pullback
squares. -/
def loops (C : SSet.{u}) [Quasicategory C] : C ⟶ C := sorry

/-- The shift on `hC` induced by Σ, README L9.1 *Suspension and loops* (HA Notation 1.1.2.7), for
stable C. -/
instance hoFunctor.hasShift (C : SSet.{u}) [Quasicategory C] [IsStable C] :
    HasShift (hoFunctor.obj C) ℤ := sorry

/-- Supporting instances on `hC` for stable C (HA Lemma 1.1.2.9 and Theorem 1.1.2.14; the
pretriangulated structure is that theorem): the preadditive structure. -/
instance hoFunctor.preadditive (C : SSet.{u}) [Quasicategory C] [IsStable C] :
    Preadditive (hoFunctor.obj C) := sorry

/-- The class in `hC` of an edge (helper, Mathlib `HomotopyCategory.homMk`). -/
abbrev homMk {C : SSet.{u}} {x y : C _⦋0⦌} (e : Edge x y) :
    (show hoFunctor.obj C from HomotopyCategory.mk x) ⟶ (show hoFunctor.obj C from HomotopyCategory.mk y) :=
  HomotopyCategory.homMk e

/-- The equivalence `W ≃ Σ X` in `hC` given by the outer rectangle of a diagram
`Δ[1] × Δ[2] ⟶ C` as in HA Definition 1.1.2.11 (part of that target). -/
def rectangleSuspensionIso {C : SSet.{u}} [Quasicategory C] (τ : Δ[1] ⊗ Δ[2] ⟶ C) :
    (show hoFunctor.obj C from HomotopyCategory.mk (rectVertex τ 1 2)) ≅
      (hoFunctor.map (suspension C)).toFunctor.obj
        (show hoFunctor.obj C from HomotopyCategory.mk (rectVertex τ 0 0)) := sorry

/-- The squares `[0,1] × [j, j+1]` of a diagram `Δ[1] × Δ[2] ⟶ C` (helper). -/
def rectSquare {C : SSet.{u}} (τ : Δ[1] ⊗ Δ[2] ⟶ C) (j : Fin 2) : Δ[1] ⊗ Δ[1] ⟶ C :=
  (𝟙 Δ[1] ⊗ₘ _root_.SSet.stdSimplex.map (SimplexCategory.mkHom
    ⟨fun k ↦ if k = 0 then j.castSucc else j.succ, sorry⟩)) ≫ τ

/-- Distinguished triangles, README L9.1 *Distinguished triangles* (`SSet.IsDistinguishedTriangle`;
HA Definition 1.1.2.11, Remark 1.1.2.12): for a pointed quasicategory with cofibres, some
`τ : Δ[1] × Δ[2] ⟶ C` with rows `X ⟶ Y ⟶ 0` and `0' ⟶ Z ⟶ W`, both squares pushouts, `0, 0'`
zero, whose edges represent f and g, and with `h = [Z ⟶ W] ≫ (W ≃ Σ X)`. -/
def IsDistinguishedTriangle {C : SSet.{u}} [Quasicategory C] {X Y Z : C _⦋0⦌}
    (f : (show hoFunctor.obj C from HomotopyCategory.mk X) ⟶ HomotopyCategory.mk Y)
    (g : (show hoFunctor.obj C from HomotopyCategory.mk Y) ⟶ HomotopyCategory.mk Z)
    (h : (show hoFunctor.obj C from HomotopyCategory.mk Z) ⟶
      (hoFunctor.map (suspension C)).toFunctor.obj (HomotopyCategory.mk X)) : Prop :=
  ∃ (τ : Δ[1] ⊗ Δ[2] ⟶ C) (hX : rectVertex τ 0 0 = X) (hY : rectVertex τ 0 1 = Y)
    (hZ : rectVertex τ 1 1 = Z),
    IsPushout (rectSquare τ 0) ∧ IsPushout (rectSquare τ 1) ∧
      IsZeroObject (rectVertex τ 0 2) ∧ IsZeroObject (rectVertex τ 1 0) ∧
      (∃ e : Edge (rectVertex τ 0 0) (rectVertex τ 0 1),
        hX ▸ hY ▸ homMk e = f ∧ e.edge = yonedaEquiv (squareV 0 ≫ rectSquare τ 0)) ∧
      (∃ e : Edge (rectVertex τ 0 1) (rectVertex τ 1 1),
        hY ▸ hZ ▸ homMk e = g ∧ e.edge = yonedaEquiv (squareH 1 ≫ rectSquare τ 0)) ∧
      ∃ e : Edge (rectVertex τ 1 1) (rectVertex τ 1 2),
        e.edge = yonedaEquiv (squareV 1 ≫ rectSquare τ 1) ∧
          hX ▸ hZ ▸ (homMk e ≫ (rectangleSuspensionIso τ).hom) = h

/-- Ext groups, README L9.1 (HA Notation 1.1.2.17): no new definition; `Extⁿ(X, Y)` is
`X⟦−n⟧ ⟶ Y` in `hoFunctor.obj C`. -/
example (C : SSet.{u}) [Quasicategory C] [IsStable C] (n : ℤ) (X Y : hoFunctor.obj C) : Type u :=
  X⟦-n⟧ ⟶ Y

/-- Stable subcategories, README L9.1 *Stable subcategories* (`SSet.IsStableSubcategory`; HA
Definition 1.1.3.2): a set of objects of a stable C, closed under equivalence, containing a zero
object, and closed under fibres and cofibres. -/
def IsStableSubcategory {C : SSet.{u}} [Quasicategory C] [IsStable C] (P : C _⦋0⦌ → Prop) : Prop :=
  (∀ ⦃x y : C _⦋0⦌⦄ (e : Edge x y), Edge.IsEquivalence e → P x → P y) ∧
    (∃ X, IsZeroObject X ∧ P X) ∧
    (∀ ⦃x y : C _⦋0⦌⦄ (g : Edge x y) (σ : Triangle C), P x → P y → IsFiber g σ →
      P (squareVertex σ.1 0 0)) ∧
    ∀ ⦃x y : C _⦋0⦌⦄ (g : Edge x y) (σ : Triangle C), P x → P y → IsCofiber g σ →
      P (squareVertex σ.1 1 1)

/-- The image of a triangle under a functor preserving zero objects (helper for exact functors). -/
def Triangle.map {C C' : SSet.{u}} (σ : Triangle C) (F : C ⟶ C')
    (h : IsZeroObject (squareVertex (σ.1 ≫ F) 1 0)) : Triangle C' := ⟨σ.1 ≫ F, h⟩

/-- Exact functors, README L9.1 *Exact functors and `Cat∞^Ex`* (`SSet.IsExact`;
`HA.1.1.4/intro`): zero objects to zero objects and fibre sequences to fibre sequences. -/
def IsExact {C C' : SSet.{u}} [Quasicategory C] [Quasicategory C'] [IsStable C] [IsStable C']
    (F : C ⟶ C') : Prop :=
  (∀ X : C _⦋0⦌, IsZeroObject X → IsZeroObject (F.app _ X)) ∧
    ∀ σ : Triangle C, σ.IsFiberSequence → IsPullback (σ.1 ≫ F)

/-- `Cat∞^Ex`, README L9.1 (`SSet.catInftyEx`; `HA.1.1.4/intro`): the simplices of `Cat∞` all of
whose vertices are stable and all of whose edges are exact. -/
def catInftyEx : (SSet.catInfty.{u}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsStable (catInfty.obj v)) fun e ↦
    ∀ (_ : IsStable (catInfty.obj ((SSet.catInfty.{u}).δ 1 e)))
      (_ : IsStable (catInfty.obj ((SSet.catInfty.{u}).δ 0 e))),
      IsExact (catInfty.edgeMap (Edge.mk' e))

end SSet

/-! ### Ext. 3, L9.2–L9.3: t-structures, spectral sequences, Dold–Kan -/

namespace TStructure

open Pretriangulated

variable {D : Type u} [Category.{v} D] [Preadditive D] [HasZeroObject D] [HasShift D ℤ]
  [∀ n : ℤ, (shiftFunctor D n).Additive] [Pretriangulated D]

/-- README L9.2 *t-structures on triangulated categories* (HA Notation 1.2.1.2): `D_{≥n}` of
`mkHomological` is `Dge` shifted, through `D_{≥n} = t.le (−n)`. -/
theorem mkHomological_le_iff (Dge Dle : ObjectProperty D) [Dge.IsClosedUnderIsomorphisms]
    [Dle.IsClosedUnderIsomorphisms] (orth shift_ge shift_le exists_triangle) (n : ℤ) (X : D) :
    (mkHomological Dge Dle orth shift_ge shift_le exists_triangle).le n X ↔
      Dge (X⟦n⟧) := Iff.rfl

/-- README L9.2 (HA Notation 1.2.1.2): `D_{≤n}` of `mkHomological`, through `D_{≤n} = t.ge (−n)`. -/
theorem mkHomological_ge_iff (Dge Dle : ObjectProperty D) [Dge.IsClosedUnderIsomorphisms]
    [Dle.IsClosedUnderIsomorphisms] (orth shift_ge shift_le exists_triangle) (n : ℤ) (X : D) :
    (mkHomological Dge Dle orth shift_ge shift_le exists_triangle).ge n X ↔
      Dle (X⟦n⟧) := Iff.rfl

section Heart

variable [IsTriangulated D]

/-- The heart of a t-structure is abelian, README L9.2 *The heart of a t-structure is abelian*
(`TStructure.heartAbelian`, propose; HA Remark 1.2.1.12, BBD Théorème 1.3.6), in Mathlib's setting,
for any category `H` with `[t.Heart H]`. -/
@[instance_reducible]
noncomputable def heartAbelian (t : Triangulated.TStructure D) (H : Type u₁) [Category.{v₁} H]
    [Preadditive H] [t.Heart H] : Abelian H := sorry

/-- The cohomological functor `H⁰ = τ_{≥0} τ_{≤0} : D ⥤ H` to the heart, README L9.2
(`TStructure.homology₀`, propose): the lift of `t.truncGELE 0 0` through `t.ιHeart`. -/
noncomputable def homology₀ (t : Triangulated.TStructure D) (H : Type u₁) [Category.{v₁} H]
    [Preadditive H] [t.Heart H] : D ⥤ H := sorry

/-- `H⁰ ⋙ ι ≅ τ_{≥0} τ_{≤0}`, README L9.2 (`TStructure.homology₀ιHeartIso`, propose). -/
noncomputable def homology₀ιHeartIso (t : Triangulated.TStructure D) (H : Type u₁)
    [Category.{v₁} H] [Preadditive H] [t.Heart H] :
    homology₀ t H ⋙ t.ιHeart ≅ t.truncGELE 0 0 := sorry

end Heart

end TStructure

namespace SSet

open _root_.SSet

section TStructureExt

variable {C : SSet.{u}} [Preadditive (hoFunctor.obj C)] [HasZeroObject (hoFunctor.obj C)]
  [HasShift (hoFunctor.obj C) ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive]
  [Pretriangulated (hoFunctor.obj C)]

/-- The heart `C^♥`, README L9.2 *The heart and homotopy objects* (`SSet.TStructure.heart`; HA
Definition 1.2.1.11): the full subcategory of C on Mathlib's `TStructure.heart` of `hC`. -/
def TStructure.heart (t : TStructure C) : C.Subcomplex :=
  fullEnhancedSubcategory C fun x ↦
    Triangulated.TStructure.heart t (show hoFunctor.obj C from HomotopyCategory.mk x)

/-- `h(C^♥) ≌ (hC)^♥`, README L9.2 *The heart and homotopy objects* (`SSet.TStructure.heartHoEquiv`,
propose; HA 1.2.1.11): the homotopy category of the full enhanced subcategory on the heart is the
full subcategory of `hC` on Mathlib's heart (`HTT.1.2.11/intro`). -/
def TStructure.heartHoEquiv (t : TStructure C) :
    hoFunctor.obj (TStructure.heart t : SSet.{u}) ≌ (Triangulated.TStructure.heart t).FullSubcategory :=
  sorry

/-- Homotopy objects `π_n : C ⟶ C^♥`, README L9.2 (`SSet.TStructure.homotopyObject`; HA
1.2.1.11): `X ↦ π₀(X[−n])`, with `π₀ = τ_{≤0} ∘ τ_{≥0}` and the shift of Notation 1.1.2.7. -/
def TStructure.homotopyObject (t : TStructure C) (n : ℤ) : C ⟶ (t.heart : SSet.{u}) := sorry

/-- Closure under extensions, README L9.2 *Closed under extensions*
(`SSet.IsClosedUnderExtensions`; HA Definition 1.2.1.15): for every fibre sequence σ, if `σ(0,0)`
and `σ(1,1)` are in C', so is `σ(0,1)`. -/
def IsClosedUnderExtensions (P : C _⦋0⦌ → Prop) : Prop :=
  ∀ σ : Triangle C, σ.IsFiberSequence → P (squareVertex σ.1 0 0) → P (squareVertex σ.1 1 1) →
    P (squareVertex σ.1 0 1)

/-- Left bounded t-structures, README L9.2 (`HA.1.2.1.16/after`): `C = C⁺ = ⋃ₙ C_{≤n}`. -/
def TStructure.IsLeftBounded (t : TStructure C) : Prop :=
  ∀ x : C _⦋0⦌, ∃ n : ℤ, t.ge n (show hoFunctor.obj C from HomotopyCategory.mk x)

/-- Right bounded t-structures, README L9.2 (`HA.1.2.1.16/after`): `C = C⁻ = ⋃ₙ C_{≥−n}`. -/
def TStructure.IsRightBounded (t : TStructure C) : Prop :=
  ∀ x : C _⦋0⦌, ∃ n : ℤ, t.le n (show hoFunctor.obj C from HomotopyCategory.mk x)

/-- Bounded t-structures, README L9.2 (`HA.1.2.1.16/after`): `C = C^b`. -/
def TStructure.IsBounded (t : TStructure C) : Prop := t.IsLeftBounded ∧ t.IsRightBounded

/-- Compatibility with filtered colimits, README L9.4 (`SSet.TStructure.IsCompatibleWithFilteredColimits`;
HA Definition 1.3.5.20): `C_{≤0} = t.ge 0` is closed under small filtered colimits. -/
def TStructure.IsCompatibleWithFilteredColimits (t : TStructure C) : Prop :=
  ∀ (I : SSet.{u}) [IsFiltered I] (p : rightCone I ⟶ C), IsColimitDiagram p →
    (∀ i : I _⦋0⦌, t.ge 0 (show hoFunctor.obj C from HomotopyCategory.mk (p.app _ (rightCone.incl i)))) →
      t.ge 0 (show hoFunctor.obj C from HomotopyCategory.mk (p.app _ (rightCone.pt I)))

/-- Compatibility with sequential colimits, README L9.2 (HA Definition 1.2.2.12): the same with
`I = N(ℤ_{≥0})`. -/
def TStructure.IsCompatibleWithSequentialColimits (t : TStructure C) : Prop :=
  ∀ p : rightCone (uliftFunctor.{u}.obj (nerve ℕ)) ⟶ C, IsColimitDiagram p →
    (∀ i, t.ge 0 (show hoFunctor.obj C from HomotopyCategory.mk (p.app _ (rightCone.incl i)))) →
      t.ge 0 (show hoFunctor.obj C from
        HomotopyCategory.mk (p.app _ (rightCone.pt (uliftFunctor.{u}.obj (nerve ℕ)))))

end TStructureExt

/-- Quasisaturated classes, README L9.2 (`SSet.IsQuasisaturated`; HA Definition 1.2.1.14): contains
the equivalences, two-out-of-three for 2-simplices, closed under pushouts. -/
def IsQuasisaturated {C : SSet.{u}} (S : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop) : Prop :=
  (∀ ⦃x y : C _⦋0⦌⦄ (e : Edge x y), Edge.IsEquivalence e → S e) ∧
    (∀ ⦃x₀ x₁ x₂ : C _⦋0⦌⦄ (e₀₁ : Edge x₀ x₁) (e₁₂ : Edge x₁ x₂) (e₀₂ : Edge x₀ x₂),
      Nonempty (Edge.CompStruct e₀₁ e₁₂ e₀₂) →
        (S e₀₁ → S e₁₂ → S e₀₂) ∧ (S e₀₁ → S e₀₂ → S e₁₂) ∧ (S e₁₂ → S e₀₂ → S e₀₁)) ∧
    ∀ σ : Δ[1] ⊗ Δ[1] ⟶ C, IsPushout σ → S (squareVEdge σ 0) → S (squareVEdge σ 1)

/-- The quasisaturated class generated by `S₀`, README L9.2 (`SSet.quasisaturatedClosure`; HA
1.2.1.14): the intersection. -/
def quasisaturatedClosure {C : SSet.{u}} (S₀ : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop) :
    ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop :=
  fun _ _ f ↦ ∀ S : ∀ ⦃x y : C _⦋0⦌⦄, Edge x y → Prop, IsQuasisaturated S →
    (∀ ⦃x y : C _⦋0⦌⦄ (g : Edge x y), S₀ g → S g) → S f


/-- The vertex `n` of `N(ℤ)`, lifted (helper). -/
def nerveIntVertex (n : ℤ) : (uliftFunctor.{u}.obj (nerve ℤ)) _⦋0⦌ := ⟨ComposableArrows.mk₀ n⟩

/-- The edge `m ⟶ n` of `N(ℤ)` for `m ≤ n`, lifted (helper). -/
def nerveIntEdge {m n : ℤ} (h : m ≤ n) : (uliftFunctor.{u}.obj (nerve ℤ)) _⦋1⦌ :=
  ⟨ComposableArrows.mk₁ (homOfLE h)⟩

section TStructureExt₂

variable {C : SSet.{u}} [Preadditive (hoFunctor.obj C)] [HasZeroObject (hoFunctor.obj C)]
  [HasShift (hoFunctor.obj C) ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive]
  [Pretriangulated (hoFunctor.obj C)]

/-- The left completion `Ĉ`, README L9.2 *Bounded t-structures and the left completion*
(`SSet.TStructure.leftCompletion`; `HA.1.2.1.16/after`): the full subcategory of `Fun(N(ℤ), C)` of
functors F with `F(n) ∈ C_{≤−n}` and `F(m) ⟶ F(n)` exhibiting `F(n) ≃ τ_{≤−n} F(m)` for `m ≤ n`. -/
def TStructure.leftCompletion (t : TStructure C) :
    ((ihom (uliftFunctor.{u}.obj (nerve ℤ))).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦
    (∀ n : ℤ, t.ge n (show hoFunctor.obj C from
      HomotopyCategory.mk ((ihomVertexEquiv v).app _ (nerveIntVertex n)))) ∧
    ∀ (m n : ℤ) (h : m ≤ n),
      Edge.IsLocalizationInto {Z | t.ge n (show hoFunctor.obj C from HomotopyCategory.mk Z)}
        (Edge.mk' ((ihomVertexEquiv v).app _ (nerveIntEdge h)))

/-- The functor `C ⟶ Ĉ` of HA Proposition 1.2.1.17 (supporting; the target of that entry). -/
def TStructure.toLeftCompletion (t : TStructure C) : C ⟶ (t.leftCompletion : SSet.{u}) := sorry

/-- Left complete t-structures, README L9.2 (`SSet.TStructure.IsLeftComplete`;
`HA.1.2.1.17/after`): `C ⟶ Ĉ` is a categorical equivalence. -/
def TStructure.IsLeftComplete (t : TStructure C) : Prop :=
  IsCategoricalEquivalence t.toLeftCompletion

/-- The spectral sequence of a filtered object `X : N(ℤ) ⟶ C`, README L9.2 *Filtered objects and
their spectral sequence* (`SSet.TStructure.filteredSpectralSequence`; HA Definition 1.2.2.9): the
pages `E_r^{p,q}` in the heart, through a chosen inverse of the trivial fibration of 1.2.2.4. -/
def TStructure.filteredSpectralSequence (t : TStructure C)
    (X : uliftFunctor.{u}.obj (nerve ℤ) ⟶ C) : ℕ → ℤ × ℤ → (Triangulated.TStructure.heart t).FullSubcategory :=
  sorry

end TStructureExt₂

/-- The poset `I^{[1]}` of pairs `i ≤ j`, ordered componentwise, README L9.2 *I-complexes*
(HA Definition 1.2.2.2). -/
abbrev IntervalPairs (I : Type u) [LinearOrder I] : Type u := {p : I × I // p.1 ≤ p.2}

/-- The vertex `(i, j)` of `N(I^{[1]})` (helper). -/
def IntervalPairs.vertex {I : Type u} [LinearOrder I] {i j : I} (h : i ≤ j) :
    (nerve (IntervalPairs I)) _⦋0⦌ := ComposableArrows.mk₀ ⟨(i, j), h⟩

/-- The square `(i, j) ⟶ (i, k)`, `(j, j) ⟶ (j, k)` of `N(I^{[1]})` for `i ≤ j ≤ k` (helper). -/
def IntervalPairs.square {I : Type u} [LinearOrder I] {i j k : I} (_hij : i ≤ j) (_hjk : j ≤ k) :
    Δ[1] ⊗ Δ[1] ⟶ nerve (IntervalPairs I) := sorry

/-- `Gap(I, C)`, README L9.2 *I-complexes* (`SSet.gap`; HA Definition 1.2.2.2): the full subcategory
of `Fun(N(I^{[1]}), C)` on functors with zero diagonal and pushout squares. -/
def gap (I : Type u) [LinearOrder I] (C : SSet.{u}) :
    ((ihom (nerve (IntervalPairs I))).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦
    (∀ i : I, IsZeroObject ((ihomVertexEquiv v).app _ (IntervalPairs.vertex (le_refl i)))) ∧
      ∀ (i j k : I) (hij : i ≤ j) (hjk : j ≤ k),
        IsPushout (IntervalPairs.square hij hjk ≫ ihomVertexEquiv v)

end SSet

/-- `Ch(A)_{≥n}`, README L9.3 *Chain complexes* (HA Definition 1.2.3.1; proposed name): in cochain
degrees, `CochainComplex.IsStrictlyLE (−n)`. -/
def CochainComplex.haGE (A : Type u) [Category.{v} A] [HasZeroMorphisms A] (n : ℤ) :
    ObjectProperty (CochainComplex A ℤ) := fun K ↦ K.IsStrictlyLE (-n)

/-- `Ch(A)_{≤n}`, README L9.3 (HA 1.2.3.1; proposed name): `CochainComplex.IsStrictlyGE (−n)`. -/
def CochainComplex.haLE (A : Type u) [Category.{v} A] [HasZeroMorphisms A] (n : ℤ) :
    ObjectProperty (CochainComplex A ℤ) := fun K ↦ K.IsStrictlyGE (-n)


/-- The face `δ i : [n] ⟶ [n + 1]` in `Δ_s` (helper). -/
def SimplexCategory.inj.δ {n : ℕ} (i : Fin (n + 2)) :
    (⟨⦋n⦌⟩ : SimplexCategory.inj) ⟶ ⟨⦋n + 1⦌⟩ := ⟨SimplexCategory.δ i, sorry⟩

/-- The unnormalized chain complex of a semisimplicial object, README L9.3 *Unnormalized chain
complexes* (`AlgebraicTopology.alternatingFaceMapComplexSemi`, propose; HA Definition 1.2.3.8):
`C_n = A_n` with `∑ i, (−1)^i d_i`. -/
def AlgebraicTopology.alternatingFaceMapComplexSemi.obj {A : Type u} [Category.{v} A] [Preadditive A]
    (X : SimplexCategory.injᵒᵖ ⥤ A) : ChainComplex A ℕ :=
  ChainComplex.of (fun n ↦ X.obj (op ⟨⦋n⦌⟩))
    (fun n ↦ ∑ i : Fin (n + 2), ((-1 : ℤ) ^ (i : ℕ)) • X.map (SimplexCategory.inj.δ i).op) sorry

/-- The functor `alternatingFaceMapComplexSemi A`, README L9.3 (HA 1.2.3.8). -/
def AlgebraicTopology.alternatingFaceMapComplexSemi (A : Type u) [Category.{v} A] [Preadditive A] :
    (SimplexCategory.injᵒᵖ ⥤ A) ⥤ ChainComplex A ℕ where
  obj := alternatingFaceMapComplexSemi.obj
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- Normalized chain complexes, README L9.3 (HA Definition 1.2.3.9): no new definition; Mathlib's
`normalizedMooreComplex`. -/
example (A : Type u) [Category.{v} A] [Abelian A] : SimplicialObject A ⥤ ChainComplex A ℕ :=
  AlgebraicTopology.normalizedMooreComplex A

/-- The functor `A i ⥤ ∀ j, A j` inserting a variable at `i` with the others fixed at `x`
(helper for multi-additive functors). -/
def CategoryTheory.Functor.insertVariable {n : ℕ} (A : Fin n → Type u) [∀ i, Category.{v} (A i)]
    (i : Fin n) (x : ∀ j, A j) : A i ⥤ ∀ j, A j :=
  Functor.pi' fun j ↦ if h : i = j then (Pi.eqToEquivalence A h).functor else (Functor.const _).obj (x j)

/-- Multi-additive functors, README L9.3 (`CategoryTheory.Functor.IsMultiAdditive`, propose; HA
Definition 1.2.3.19): additive in each variable separately. -/
def CategoryTheory.Functor.IsMultiAdditive {n : ℕ} {A : Fin n → Type u} [∀ i, Category.{v} (A i)]
    [∀ i, Preadditive (A i)] {B : Type u'} [Category.{v} B] [Preadditive B]
    (F : (∀ i, A i) ⥤ B) : Prop :=
  ∀ (i : Fin n) (x : ∀ j, A j), (Functor.insertVariable A i x ⋙ F).Additive

/-! ### Ext. 3, L9.4–L9.5: dg categories, derived ∞-categories, localization -/

/-- The paths `{a, b} ∪ {i_{σ(1)}, …, i_{σ(k)}}` of `C[Δ^J]` (helper for `permChain`). -/
def SimplicialThickening.permPath {J : Type u} [LinearOrder J] {m : ℕ}
    (a b : SimplicialThickening J) (mid : Fin m → J) (σ : Equiv.Perm (Fin m)) (k : ℕ) :
    a ⟶ b where
  I := {a.as, b.as} ∪ {t | ∃ j : Fin m, (σ.symm j : ℕ) < k ∧ t = mid j}
  left := sorry
  right := sorry
  left_le := sorry
  le_right := sorry

/-- The simplices `τ_{I,σ}` of `Map_{C[Δ^J]}(i₋, i₊) = N(P_{i₋,i₊})`, README L9.4 *Simplices of
`C[Δ[n]]` from permutations* (`SimplicialThickening.permChain`, propose; HA Notation 1.3.1.15):
the chain of paths adding `i_{σ(1)}, i_{σ(2)}, …` in turn, an m-simplex of the nerve. -/
def SimplicialThickening.permChain {J : Type u} [LinearOrder J] {m : ℕ}
    (a b : SimplicialThickening J) (mid : Fin m → J) (σ : Equiv.Perm (Fin m)) :
    ComposableArrows (a ⟶ b) m where
  obj k := permPath a b mid σ k
  map _ := InducedCategory.homMk (homOfLE sorry)
  map_id := sorry
  map_comp := sorry

namespace TauCeti

open _root_.TauCeti TauCetiRoadmap.HigherToposTheory.SSet

/-- The category `Cat_dg^R` of dg categories over R and dg functors, README L9.4 *Differential
graded functors* (`TauCeti.DGCat`, propose; HA Definition 1.3.1.18). -/
structure DGCat (R : Type v) [CommRing R] where
  /-- The underlying type of objects. -/
  carrier : Type u
  /-- The dg structure. -/
  [str : DGCategory R carrier]

attribute [instance] DGCat.str

/-- The category structure of `Cat_dg^R`, README L9.4 (HA 1.3.1.18): Mathlib's `EnrichedFunctor`. -/
instance (R : Type v) [CommRing R] : Category (DGCat.{v, u} R) where
  Hom C D := EnrichedFunctor (CochainComplex (ModuleCat.{v} R) ℤ) C.carrier D.carrier
  id C := EnrichedFunctor.id _ C.carrier
  comp F G := EnrichedFunctor.comp _ F G
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The comparison `N(C_Δ) ⟶ N_dg(C)` from the simplicial nerve of the simplicial category of a dg
category to its dg nerve, README L9.4 *The dg nerve and the simplicial nerve*
(`TauCeti.dgNerve.fromSimplicialNerve`, propose; HA Construction 1.3.1.16), with the sign conventions
fixed by Tau Ceti's composition order. -/
def dgNerve.fromSimplicialNerve (R : Type v) [CommRing R] (C : Type u) [DGCategory R C] :
    SimplicialNerve (ForgetEnrichment SSet.{v} (DGSimplicialCategory R C)) ⟶ dgNerve R C := sorry

/-- `D⁻(A)`, README L9.4 (`TauCeti.derivedCategoryInftyMinus`, propose; HA Definition 1.3.2.7): the
dg nerve of the full dg subcategory of `Ch(A)` on degreewise projective complexes bounded below in
homological degree. -/
def derivedCategoryInftyMinus (A : Type u) [Category.{0} A] [Abelian A] [EnoughProjectives A] :
    SSet.{u} :=
  dgNerve ℤ (DGFullSubcategory (C := CochainComplex A ℤ) fun M ↦
    (∀ k, Projective (M.X k)) ∧ ∃ N : ℤ, ∀ k > N, Limits.IsZero (M.X k))

/-- Fibrant complexes for the injective model structure of HA Proposition 1.3.5.3 (supporting):
right lifting against the monomorphisms that are quasi-isomorphisms. -/
def IsInjectiveFibrant {A : Type u} [Category.{v} A] [Abelian A] (M : CochainComplex A ℤ) : Prop :=
  ∀ ⦃X Y : CochainComplex A ℤ⦄ (i : X ⟶ Y), Mono i → QuasiIso i → ∀ f : X ⟶ M, ∃ g, i ≫ g = f

/-- `D(A)`, README L9.4 *The unbounded derived ∞-category* (`TauCeti.derivedCategoryInfty`,
propose; HA Definition 1.3.5.8): the dg nerve of the fibrant complexes. -/
def derivedCategoryInfty (A : Type u) [Category.{0} A] [Abelian A] [IsGrothendieckAbelian.{0} A] :
    SSet.{u} :=
  dgNerve ℤ (DGFullSubcategory (C := CochainComplex A ℤ) IsInjectiveFibrant)

/-- `N_dg(Ch(A))_{≥n}`, README L9.4 *Connective and coconnective complexes*
(`TauCeti.dgNerveConnective`, propose; HA Definition 1.3.5.16): `H_k = 0` for `k < n`. -/
def dgNerveConnective (A : Type u) [Category.{0} A] [Abelian A] (n : ℤ) :
    (dgNerve ℤ (CochainComplex A ℤ)).Subcomplex :=
  SSet.fullEnhancedSubcategory _ fun v ↦ ∀ k > -n, Limits.IsZero ((dgNerveEquiv ℤ _ v).homology k)

/-- `N_dg(Ch(A))_{≤n}`, README L9.4 (`TauCeti.dgNerveCoconnective`, propose; HA 1.3.5.16): `H_k = 0`
for `k > n`. -/
def dgNerveCoconnective (A : Type u) [Category.{0} A] [Abelian A] (n : ℤ) :
    (dgNerve ℤ (CochainComplex A ℤ)).Subcomplex :=
  SSet.fullEnhancedSubcategory _ fun v ↦ ∀ k < -n, Limits.IsZero ((dgNerveEquiv ℤ _ v).homology k)

end TauCeti

/-- Projective objects, README L9.4 (HA Definition 1.3.2.4): no new definition. -/
example (A : Type u) [Category.{v} A] (P : A) : Prop := Projective P ∧ EnoughProjectives A

/-- `Ch(A)_Δ`, README L9.4 (HA Notation 1.3.2.13): no new definition;
`TauCeti.DGSimplicialCategory ℤ (Ch(A))`. -/
example (A : Type u) [Category.{0} A] [Preadditive A] : Type u :=
  TauCeti.DGSimplicialCategory ℤ (CochainComplex A ℤ)

/-- Grothendieck abelian categories, README L9.5 (HA Definition 1.3.5.1): no new definition. -/
example (A : Type u) [Category.{v} A] [Abelian A] : Prop := IsGrothendieckAbelian.{v} A

namespace SSet

open _root_.SSet

section TExact

variable {C C' : SSet.{u}} [Quasicategory C] [Quasicategory C'] [IsStable C] [IsStable C']
  [Preadditive (hoFunctor.obj C)] [HasZeroObject (hoFunctor.obj C)]
  [HasShift (hoFunctor.obj C) ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive]
  [Pretriangulated (hoFunctor.obj C)]
  [Preadditive (hoFunctor.obj C')] [HasZeroObject (hoFunctor.obj C')]
  [HasShift (hoFunctor.obj C') ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C') n).Additive]
  [Pretriangulated (hoFunctor.obj C')]

/-- Right t-exact functors, README L9.4 *t-exact functors* (`SSet.TStructure.IsRightTExact`; HA
Definition 1.3.3.1): exact, carrying `C_{≥0} = t.le 0` into `C'_{≥0}`. -/
def TStructure.IsRightTExact (F : C ⟶ C') (t₁ : TStructure C) (t₂ : TStructure C') : Prop :=
  IsExact F ∧ ∀ x : C _⦋0⦌, t₁.le 0 (show hoFunctor.obj C from HomotopyCategory.mk x) →
    t₂.le 0 (show hoFunctor.obj C' from HomotopyCategory.mk (F.app _ x))

/-- Left t-exact functors, README L9.4 (`SSet.TStructure.IsLeftTExact`; HA 1.3.3.1): exact,
carrying `C_{≤0} = t.ge 0` into `C'_{≤0}`. -/
def TStructure.IsLeftTExact (F : C ⟶ C') (t₁ : TStructure C) (t₂ : TStructure C') : Prop :=
  IsExact F ∧ ∀ x : C _⦋0⦌, t₁.ge 0 (show hoFunctor.obj C from HomotopyCategory.mk x) →
    t₂.ge 0 (show hoFunctor.obj C' from HomotopyCategory.mk (F.app _ x))

/-- t-exact functors, README L9.4 (HA 1.3.3.1): both. -/
def TStructure.IsTExact (F : C ⟶ C') (t₁ : TStructure C) (t₂ : TStructure C') : Prop :=
  TStructure.IsRightTExact F t₁ t₂ ∧ TStructure.IsLeftTExact F t₁ t₂

end TExact

/-- The translation functor `t_{[n]}`, README L9.5 *Translation functors and `T_• C`*
(`SSet.translation`, propose; HA Notation 1.3.4.11): `Y ↦ ∐ (σ : Δ[n] ⟶ Y), Y_{σ/}`. -/
def translation (n : ℕ) : SSet.{u} ⥤ SSet.{u} where
  obj Y := ∐ fun σ : (Δ[n] ⟶ Y) ↦ coslice σ
  map := sorry
  map_id := sorry
  map_comp := sorry

/-- `t_{[n]}(Y × Z) ≅ t_{[n]} Y × t_{[n]} Z`, as the monoidal structure used for the change of
enrichment, README L9.5 (HA 1.3.4.11). -/
instance (n : ℕ) : (translation.{u} n).LaxMonoidal := sorry

/-- `C_n = T_{[n]} C`, README L9.5 (`SimplicialCategory.translation`, HA 1.3.4.11): the change of
enrichment along `SSet.translation n`. -/
abbrev SimplicialCategory.translation (n : ℕ) (C : Type u') [EnrichedCategory SSet.{u} C] : Type u' :=
  TransportEnrichment (TauCetiRoadmap.HigherToposTheory.SSet.translation.{u} n) C

end SSet

namespace HomotopicalAlgebra.ModelCategory

open _root_.SSet

/-- The cofibrant objects `A^c` of a model category, README L9.5 *The underlying ∞-category of a
model category* (HA 1.3.4.15). -/
abbrev Cofibrant (A : Type u) [Category.{v} A] [ModelCategory A] : Type u :=
  ObjectProperty.FullSubcategory fun X : A ↦ IsCofibrant X

/-- The weak equivalences between cofibrant objects, as edges of `N(A^c)` (README L9.5, HA
1.3.4.15). -/
def cofibrantWeakEquivalences (A : Type u) [Category.{v} A] [ModelCategory A] :
    ∀ ⦃x y : (nerve (Cofibrant A)) _⦋0⦌⦄, Edge x y → Prop :=
  fun _ _ e ↦ WeakEquivalence (nerve.homEquiv e).hom

/-- `f : N(A^c) ⟶ C` exhibits C as the underlying ∞-category of A, README L9.5
(`SSet.IsLocalization` at the cofibrant weak equivalences; HA Definition 1.3.4.15). -/
def IsUnderlyingInfty {A : Type u} [Category.{v} A] [ModelCategory A] {D : SSet.{max u v}}
    [Quasicategory D] (f : nerve (Cofibrant A) ⟶ D) : Prop :=
  SSet.IsLocalization.{w} f (cofibrantWeakEquivalences A)

/-- The chosen underlying ∞-category, README L9.5 (`HomotopicalAlgebra.ModelCategory.underlyingInfty`,
propose; HA 1.3.4.15). -/
def underlyingInfty (A : Type u) [Category.{v} A] [ModelCategory A] : SSet.{max u v} := sorry

end HomotopicalAlgebra.ModelCategory

/-! ### Ext. 3, L9.6: spectra and stabilization -/

namespace SSet

open _root_.SSet

/-- Cohomology theories, README L9.6 (`SSet.CohomologyTheory`, propose; HA Definition 1.4.1.6): a
sequence `Hⁿ : hC^op ⟶ Set` with `δⁿ : Hⁿ ≅ H^{n+1} ∘ Σ`, carrying coproducts to products, and
exact on cofibre sequences `X' ⟶ X ⟶ X''`: an element of `Hⁿ(X)` restricting to the base point of
`Hⁿ(X')` (through `X' ⟶ 0`) comes from `Hⁿ(X'')`. -/
structure CohomologyTheory (C : SSet.{u}) [Quasicategory C] where
  /-- The functors `Hⁿ`. -/
  H : ℤ → (hoFunctor.obj C)ᵒᵖ ⥤ Type u
  /-- The suspension isomorphisms `δⁿ`. -/
  δ (n : ℤ) : H n ≅ (hoFunctor.map (suspension C)).toFunctor.op ⋙ H (n + 1)
  /-- Coproducts in `hC` go to products. -/
  preservesProducts (n : ℤ) (J : Type u) : PreservesLimitsOfShape (Discrete J) (H n)
  /-- Exactness on cofibre sequences. -/
  exact (n : ℤ) (σ : Triangle C) (_ : σ.IsCofiberSequence)
    (e₁ : Edge (squareVertex σ.1 0 0) (squareVertex σ.1 0 1))
    (e₂ : Edge (squareVertex σ.1 0 1) (squareVertex σ.1 1 1))
    (z : Edge (squareVertex σ.1 0 0) (squareVertex σ.1 1 0))
    (_ : e₁.edge = yonedaEquiv (squareV 0 ≫ σ.1)) (_ : e₂.edge = yonedaEquiv (squareH 1 ≫ σ.1))
    (_ : z.edge = yonedaEquiv (squareH 0 ≫ σ.1)) (a : (H n).obj (op (HomotopyCategory.mk _)))
    (b₀ : (H n).obj (op (HomotopyCategory.mk (squareVertex σ.1 1 0))))
    (_ : (H n).map (homMk e₁).op a = (H n).map (homMk z).op b₀) :
    ∃ c, (H n).map (homMk e₂).op c = a

/-- Excisive functors, README L9.6 *Excisive and reduced functors* (`SSet.IsExcisive`; HA
Definition 1.4.2.1): pushout squares to pullback squares. -/
def IsExcisive {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ C, IsPushout σ → IsPullback (σ ≫ F)

/-- Reduced functors, README L9.6 (`SSet.IsReduced`; HA 1.4.2.1): final objects to final objects. -/
def IsReduced {C D : SSet.{u}} (F : C ⟶ D) : Prop :=
  ∀ X : C _⦋0⦌, IsTerminalVertex X → IsTerminalVertex (F.app _ X)

/-- `Exc(C, D)`, README L9.6 (HA 1.4.2.1): the full subcategory of excisive functors. -/
def exc (C D : SSet.{u}) : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsExcisive (ihomVertexEquiv v)

/-- `Fun_∗(C, D)`, README L9.6 (HA 1.4.2.1): the full subcategory of reduced functors. -/
def funStar (C D : SSet.{u}) : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsReduced (ihomVertexEquiv v)

/-- `Exc_∗(C, D)`, README L9.6 (HA 1.4.2.1): reduced excisive functors. -/
def excStar (C D : SSet.{u}) : ((ihom C).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsExcisive (ihomVertexEquiv v) ∧ IsReduced (ihomVertexEquiv v)

/-- `S^fin_*`, the ∞-category of finite pointed spaces (HA Notation 1.4.2.5; supporting, an L9.6
construction), in the universe of the target. -/
def finitePointedSpaces : SSet.{u} := sorry

/-- The vertex `S⁰` of `S^fin_*` (supporting, HA Notation 1.4.2.20). -/
def finitePointedSpaces.sphere₀ : finitePointedSpaces.{u} _⦋0⦌ := sorry

/-- Spectrum objects, README L9.6 (`SSet.spectrumObjects`; HA Definition 1.4.2.8):
`Sp(C) = Exc_∗(S^fin_*, C)`. -/
abbrev spectrumObjects (C : SSet.{u}) : SSet.{u} := (excStar finitePointedSpaces C : SSet)

/-- `Ω^∞ : Sp(C) ⟶ C`, evaluation at `S⁰`, README L9.6 (`SSet.spectrumObjects.ΩInfty`; HA Notation
1.4.2.20). -/
def spectrumObjects.ΩInfty (C : SSet.{u}) : spectrumObjects C ⟶ C :=
  (excStar finitePointedSpaces C).ι ≫
    lift (stdSimplex.isTerminalObj₀.from _ ≫ yonedaEquiv.symm finitePointedSpaces.sphere₀) (𝟙 _) ≫
      (ihom.ev finitePointedSpaces).app C

/-- A chosen pullback of the cospan `τ(1,0) ⟶ τ(1,1) ⟵ τ(0,1)` of `F ∘ τ` (helper, L5.10). -/
def excisiveComparison.target {C D : SSet.{u}} (F : C ⟶ D) (τ : Δ[1] ⊗ Δ[1] ⟶ C) : D _⦋0⦌ := sorry

/-- The comparison `η_τ : F(τ(0,0)) ⟶ F(τ(1,0)) ×_{F(τ(1,1))} F(τ(0,1))`, README L9.6
(`SSet.excisiveComparison`, propose; HA Notation 1.4.2.12), well defined up to equivalence. -/
def excisiveComparison {C D : SSet.{u}} (F : C ⟶ D) (τ : Δ[1] ⊗ Δ[1] ⟶ C) :
    Edge (F.app _ (squareVertex τ 0 0)) (excisiveComparison.target F τ) := sorry

/-- Spectra, README L9.6 (`SSet.spectra`, propose; HA Definition 1.4.3.1): `Sp = Sp(S_*)`. -/
abbrev spectra : SSet.{u + 1} := spectrumObjects (pointedObjects spaces.{u})

/-- The sphere spectrum, README L9.6 (`SSet.sphereSpectrum`, propose; `HA.1.4.4.5/after`): the image
of a final vertex of `S` under `Σ^∞_+`, a chosen left adjoint of `Sp ⟶ S_* ⟶ S`. -/
def sphereSpectrum : spectra.{u} _⦋0⦌ := sorry

/-- Accessible t-structures, README L9.6 (`SSet.TStructure.IsAccessible`; HA Definition 1.4.4.12):
`C_{≥0}` is presentable, for presentable stable C. -/
def TStructure.IsAccessible {C : SSet.{u}} [Quasicategory C] [IsStable C]
    [Preadditive (hoFunctor.obj C)] [HasZeroObject (hoFunctor.obj C)]
    [HasShift (hoFunctor.obj C) ℤ] [∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive]
    [Pretriangulated (hoFunctor.obj C)] (_hC : IsPresentable.{u, w} C) (t : TStructure C) : Prop :=
  IsPresentable.{u, w} (t.geq 0 : SSet.{u})

end SSet

/-! ### Ext. 3, L10: ∞-topoi -/

/-- The Grothendieck topology of a left exact reflective localization of presheaves, README L10.1
*Topoi* (`GrothendieckTopology.ofLeftExactReflection`, propose; HTT Proposition 6.1.0.1, (A) ⇔ (B)):
a sieve S on d covers when `L` inverts its inclusion into `yoneda d`. -/
def GrothendieckTopology.ofLeftExactReflection {D : Type u} [SmallCategory D] {E : Type u₁}
    [Category.{u} E] {L : (Dᵒᵖ ⥤ Type u) ⥤ E} {i : E ⥤ Dᵒᵖ ⥤ Type u} (adj : L ⊣ i) [i.Full]
    [i.Faithful] [PreservesFiniteLimits L] : CategoryTheory.GrothendieckTopology D where
  sieves d := {S | IsIso (L.map S.functorInclusion)}
  top_mem' := sorry
  pullback_stable' := sorry
  transitive' := sorry

/-- Grothendieck topoi, README L10.1 *Topoi* (`CategoryTheory.IsGrothendieckTopos`, propose; HTT
Definition 6.1.0.2, condition (A) of 6.1.0.1): equivalent to sheaves of sets on a small site. -/
def CategoryTheory.IsGrothendieckTopos (C : Type (u + 1)) [Category.{u} C] : Prop :=
  ∃ (D : Type u) (_ : SmallCategory D) (J : GrothendieckTopology D),
    Nonempty (C ≌ Sheaf J (Type u))

/-- `Δ_∞`, README L10.3 *Augmented simplicial objects with an extra degeneracy direction*
(`SimplexCategory.infty`, propose; HTT Lemma 6.1.3.16): objects `n` stand for the finite linear
orders `J = Fin n`, and morphisms `J ∪ {∞} ⟶ J' ∪ {∞}` are the order-preserving maps fixing ∞. -/
def SimplexCategory.infty : Type := ℕ

instance : Category SimplexCategory.infty where
  Hom (n m : ℕ) := {f : Fin (n + 1) →o Fin (m + 1) // f (Fin.last n) = Fin.last m}
  id _ := ⟨OrderHom.id, rfl⟩
  comp f g := ⟨g.1.comp f.1, by simp [f.2, g.2]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The functor `Δ₊ ⥤ Δ_∞` (README L10.3, HTT 6.1.3.16): `[n] ↦ [n]`, the empty order to `∅`. -/
def SimplexCategory.infty.fromAugmented : AugmentedSimplexCategory ⥤ SimplexCategory.infty := sorry


namespace SSet

open _root_.SSet

/-- ∞-topoi, README L10.1 (`SSet.IsInftyTopos`; HTT Definition 6.1.0.4): an accessible left exact
reflective localization `L : P(C) ⟶ X` of presheaves on a small C, accessibility being that of
`g ∘ L`. -/
def IsInftyTopos (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∃ (C : SSet.{u}) (_ : Quasicategory C) (L : presheaf C ⟶ X) (g : X ⟶ presheaf C),
    IsAdjunction L g ∧ IsFullyFaithful g ∧ IsAccessibleFunctor.{u + 1, u} (L ≫ g) ∧ IsLeftExact L

/-- The codomain fibration `O_X = Fun(Δ[1], X) ⟶ X`, evaluation at `1`, README L10.2
(`SSet.arrowTarget`, propose; HTT Lemma 6.1.1.1). -/
def arrowTarget (X : SSet.{u}) : (ihom Δ[1]).obj X ⟶ X := evalVertex X 1

/-- The inclusion of the fibre over the vertex `i` of `Δ[1]` (helper). -/
def fibre.ι {M : SSet.{u}} (p : M ⟶ Δ[1]) (i : Fin 2) :
    fibre p (stdSimplex.obj₀Equiv.symm i) ⟶ M := Limits.pullback.fst _ _


/-- Universal colimits, README L10.2 (`SSet.HasUniversalColimits`; `HTT.6.1.1/intro`, HTT
Definition 6.1.1.2): for every edge `f : Δ[1] ⟶ X`, every functor associated to the pullback of
`arrowTarget X` along f preserves small colimits; presentability is the hypothesis argument. -/
def HasUniversalColimits (X : SSet.{u + 1}) [Quasicategory X] (_hX : IsPresentable.{u + 1, u} X) :
    Prop :=
  ∀ f : Δ[1] ⟶ X,
    haveI : CartesianFibration (Limits.pullback.snd (arrowTarget X) f) := sorry
    ∀ (C D : SSet.{u + 1}) [Quasicategory C] [Quasicategory D]
      (h₀ : C ⟶ (fiber (Limits.pullback.snd (arrowTarget X) f) (Δ1vertex 0) : SSet.{u + 1}))
      (h₁ : D ⟶ (fiber (Limits.pullback.snd (arrowTarget X) f) (Δ1vertex 1) : SSet.{u + 1}))
      (g : D ⟶ C), IsCategoricalEquivalence h₀ → IsCategoricalEquivalence h₁ →
        CartesianFibration.IsAssociated _ h₀ h₁ g → PreservesSmallColimits.{u + 1, u} g

/-- Disjoint coproducts, README L10.2 (`SSet.HasDisjointCoproducts`; `HTT.6.1.1.4/after`): pushout
squares with initial corner `(0, 0)` are pullbacks. -/
def HasDisjointCoproducts (X : SSet.{u}) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ X, IsInitialVertex (squareVertex σ 0 0) → IsPushout σ → IsPullback σ

/-- Cartesian transformations, README L10.3 (`SSet.IsCartesianTransformation`; HTT Definition
6.1.3.1): every naturality square `(φ ▷ Δ[1]) ≫ α` is a pullback. -/
def IsCartesianTransformation {K X : SSet.{u}} (α : K ⊗ Δ[1] ⟶ X) : Prop :=
  ∀ φ : K _⦋1⦌, IsPullback ((yonedaEquiv.symm φ ▷ Δ[1]) ≫ α)

/-- `O^S_X`, README L10.3 (`SSet.arrowsIn`; HTT Notation 6.1.3.4): the full subcategory of
`Fun(Δ[1], X)` on S. -/
def arrowsIn {X : SSet.{u}} (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop) :
    ((ihom Δ[1]).obj X).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ S (arrowEdge v)

/-- `O^{(S)}_X`, README L10.3 (`SSet.cartesianArrowsIn`; HTT Notation 6.1.3.4): the subcategory on S
with the Cartesian transformations as morphisms. -/
def cartesianArrowsIn {X : SSet.{u}} (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop) :
    ((ihom Δ[1]).obj X).Subcomplex :=
  subcomplexOf _ (fun v ↦ S (arrowEdge v))
    fun e ↦ IsCartesianTransformation (MonoidalClosed.uncurry (yonedaEquiv.symm e))

/-- The isomorphism `Δ[1] ≅ Δ[0] ⋆ Δ[0]` (helper, README L1.3 *Joins*). -/
def joinPointIso : (Δ[1] : SSet.{u}) ≅ join Δ[0] Δ[0] := sorry

/-- The edge `k ⟶ ∗` of `K^▷` (helper). -/
def rightCone.edgeToPt {K : SSet.{u}} (k : K _⦋0⦌) : Δ[1] ⟶ rightCone K :=
  joinPointIso.hom ≫ join.map (yonedaEquiv.symm k) (𝟙 Δ[0])


/-- Coproduct cocones with legs `inj i` (helper, L5.6): a colimit diagram on the discrete simplicial
set on ι with these legs. -/
def IsCoproduct {X : SSet.{u}} {ι : Type u} (x : ι → X _⦋0⦌) {P : X _⦋0⦌}
    (inj : ∀ i, Edge (x i) P) : Prop :=
  ∃ c : rightCone (discrete ι) ⟶ X, IsColimitDiagram c ∧
    ∀ i : ι, yonedaEquiv (rightCone.edgeToPt (K := discrete ι) i ≫ c) = (inj i).edge

/-- Local classes, README L10.3 (`SSet.IsLocalClass`; HTT Definition 6.1.3.8, condition (3) of
6.1.3.7): stable under pullback and under small coproducts in `Fun(Δ[1], X)`, and for a pushout
square in `O_X` whose edges out of f are Cartesian with `f, f', g ∈ S`, the edges into `g'` are
Cartesian and `g' ∈ S`. -/
def IsLocalClass {X : SSet.{u + 1}} [Quasicategory X] (_hX : IsPresentable.{u + 1, u} X)
    (_hu : HasUniversalColimits X _hX) (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop) : Prop :=
  IsStableUnderPullback S ∧
    (∀ (ι : Type (u + 1)) (x : ι → ((ihom Δ[1]).obj X) _⦋0⦌) (P : ((ihom Δ[1]).obj X) _⦋0⦌)
      (inj : ∀ i, Edge (x i) P), IsCoproduct x inj → (∀ i, S (arrowEdge (x i))) → S (arrowEdge P)) ∧
    ∀ σ : Δ[1] ⊗ Δ[1] ⟶ (ihom Δ[1]).obj X, IsPushout σ →
      IsCartesianTransformation (MonoidalClosed.uncurry (squareH 0 ≫ σ)) →
      IsCartesianTransformation (MonoidalClosed.uncurry (squareV 0 ≫ σ)) →
      S (arrowEdge (squareVertex σ 0 0)) → S (arrowEdge (squareVertex σ 0 1)) →
      S (arrowEdge (squareVertex σ 1 0)) →
        IsCartesianTransformation (MonoidalClosed.uncurry (squareH 1 ≫ σ)) ∧
          IsCartesianTransformation (MonoidalClosed.uncurry (squareV 1 ≫ σ)) ∧
          S (arrowEdge (squareVertex σ 1 1))

/-- Left exactness at an object, README L10.3 (`SSet.IsLeftExactAt`; HTT Definition 6.1.4.1):
pullback squares with final corner Z go to pullback squares. -/
def IsLeftExactAt {X Y : SSet.{u}} (f : X ⟶ Y) (Z : X _⦋0⦌) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ X, squareVertex σ 1 1 = Z → IsPullback σ → IsPullback (σ ≫ f)

/-- `Res(X) ⊆ X^{Δ₊}`, README L10.3 (`SSet.res`; `HTT.6.1.4.3/after`): the simplicial resolutions,
augmented simplicial objects that are geometric realizations. -/
def res (X : SSet.{u}) : ((ihom nerveAugmentedOp.{u}).obj X).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsGeometricRealization (ihomVertexEquiv v)

/-- Groupoid resolutions, README L10.3 (`SSet.IsGroupoidResolution`; `HTT.6.1.4.3/after`): a
simplicial resolution whose underlying simplicial object is a groupoid object. -/
def IsGroupoidResolution {X : SSet.{u}} [Quasicategory X] (U : augmentedSimplicialObjects X) : Prop :=
  IsGeometricRealization U ∧ IsGroupoidObject (augmentationInclusion ≫ U)

/-- `U₊ ⟶ V₊` exhibits `V₊` as the groupoid resolution generated by `U₊`, README L10.3
(`SSet.IsGeneratedGroupoidResolution`; `HTT.6.1.4.3/after`): V₊ is a groupoid resolution and
composition `Map_{Res(X)}(V₊, W₊) ⟶ Map_{Res(X)}(U₊, W₊)` is a homotopy equivalence for every
groupoid resolution W₊, composition being a chosen one (`morphismSpace.precomp`). -/
def morphismSpace.precomp {C : SSet.{u}} [Quasicategory C] {x y : C _⦋0⦌} (f : Edge x y)
    (W : C _⦋0⦌) : (morphismSpace C y W : SSet.{u}) ⟶ (morphismSpace C x W : SSet.{u}) := sorry

/-- README L10.3 (`SSet.IsGeneratedGroupoidResolution`; `HTT.6.1.4.3/after`). -/
def IsGeneratedGroupoidResolution {X : SSet.{u}} [Quasicategory X] {Uplus Vplus : (res X : SSet) _⦋0⦌}
    (g : Edge Uplus Vplus) : Prop :=
  IsGroupoidResolution (ihomVertexEquiv Vplus.1) ∧
    ∀ Wplus : (res X : SSet) _⦋0⦌, IsGroupoidResolution (ihomVertexEquiv Wplus.1) →
      IsHomotopyEquivalence (morphismSpace.precomp g Wplus)

/-- Classifying morphisms, README L10.6 (`SSet.Classifies`; HTT Definition 6.1.6.1): f is a final
object of `O^{(S)}_X`. -/
def Classifies {X : SSet.{u}} (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop)
    (f : (cartesianArrowsIn S : SSet.{u}) _⦋0⦌) : Prop :=
  IsTerminalVertex f

/-- Subobject classifiers, README L10.6 (`SSet.IsSubobjectClassifier`; HTT 6.1.6.1). -/
def IsSubobjectClassifier {X : SSet.{u}} [Quasicategory X] (Y : X _⦋0⦌) : Prop :=
  ∃ f : (cartesianArrowsIn (X := X) fun _ _ e ↦ IsMonomorphism e : SSet.{u}) _⦋0⦌,
    arrowVertex f.1 1 = Y ∧ Classifies _ f

/-- Relatively κ-compact morphisms, README L10.6 (`SSet.IsRelativelyCardinalPresentable`; HTT
Definition 6.1.6.4): every pullback of f along a morphism with κ-compact source has κ-compact
source. -/
def IsRelativelyCardinalPresentable {X : SSet.{v}} [Quasicategory X] {x y : X _⦋0⦌} (f : Edge x y)
    (κ : Cardinal.{w}) [Fact κ.IsRegular] (hX : HasCardinalFilteredColimits.{w, v, u} X κ) : Prop :=
  ∀ σ : Δ[1] ⊗ Δ[1] ⟶ X, IsPullback σ → yonedaEquiv (squareV 1 ≫ σ) = f.edge →
    IsCardinalPresentable (squareVertex σ 0 1) κ hX → IsCardinalPresentable (squareVertex σ 0 0) κ hX

/-- Topological classes, README L10.7 (`SSet.IsTopological`; HTT Definition 6.2.1.4): generated as a
strongly saturated class by monomorphisms, and stable under pullback. -/
def IsTopological {X : SSet.{u}} [Quasicategory X] (S : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop) : Prop :=
  (∃ S₀ : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop,
    (∀ ⦃x y : X _⦋0⦌⦄ (f : Edge x y), S₀ f → S f ∧ IsMonomorphism f) ∧
      ∀ ⦃x y : X _⦋0⦌⦄ (f : Edge x y), stronglySaturatedClosure.{u, u} S₀ f ↔ S f) ∧
    IsStableUnderPullback S

/-- Topological localizations, README L10.7 (`SSet.IsTopologicalLocalization`; HTT 6.2.1.4): the
class of morphisms that L inverts is topological. -/
def IsTopologicalLocalization {X Y : SSet.{u}} [Quasicategory X] (L : X ⟶ Y) : Prop :=
  IsTopological fun _ _ f ↦ Edge.IsEquivalence (f.map L)

/-- The vertex of `P(C)` representing c (helper; the Yoneda embedding of L6.1). -/
def yonedaVertex {C : SSet.{u}} (c : C _⦋0⦌) : (presheaf C) _⦋0⦌ := sorry

/-- The sieve on c in `hC` of a monomorphism into `j(c)` (helper; HTT Proposition 6.2.2.5). -/
def sieveOfMono {C : SSet.{u}} {U : (presheaf C) _⦋0⦌} (c : C _⦋0⦌)
    (_f : Edge U (yonedaVertex c)) :
    CategoryTheory.Sieve (show hoFunctor.obj C from HomotopyCategory.mk c) := sorry

/-- The monomorphisms into representables whose sieve is J-covering, README L10.8
(`SSet.coveringMonos`; HTT 6.2.2.6). -/
def coveringMonos {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) :
    ∀ ⦃x y : (presheaf C) _⦋0⦌⦄, Edge x y → Prop :=
  fun _ y f ↦ IsMonomorphism f ∧ ∃ (c : C _⦋0⦌) (h : y = yonedaVertex c),
    sieveOfMono c (h ▸ f) ∈ J (show hoFunctor.obj C from HomotopyCategory.mk c)

/-- Sheaves, README L10.8 (`SSet.IsSheaf`; HTT Definition 6.2.2.6): local for `coveringMonos J`. -/
def IsSheaf {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) (F : (presheaf C) _⦋0⦌) :
    Prop :=
  IsLocalObject (coveringMonos J) F

/-- `Shv(C) ⊆ P(C)`, README L10.8 (`SSet.sheaf`; HTT 6.2.2.6). -/
def sheaf {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) : (presheaf C).Subcomplex :=
  fullEnhancedSubcategory _ (IsSheaf J)

end SSet

/-- The category `Cov(C)` of pairs `(c, covering sieve)`, README L10.8 (HTT Notation 6.2.2.8), for an
ordinary category with a topology. -/
structure CategoryTheory.GrothendieckTopology.Cov {D : Type u} [Category.{v} D]
    (J : GrothendieckTopology D) where
  /-- The object. -/
  obj : D
  /-- The covering sieve. -/
  sieve : CategoryTheory.Sieve obj
  mem : sieve ∈ J obj

/-- Morphisms of `Cov(C)` carry the first sieve into the second (HTT 6.2.2.8). -/
instance {D : Type u} [Category.{v} D] (J : GrothendieckTopology D) : Category.{v} (CategoryTheory.GrothendieckTopology.Cov J) where
  Hom X Y := {u : X.obj ⟶ Y.obj // X.sieve ≤ Y.sieve.pullback u}
  id X := ⟨𝟙 _, sorry⟩
  comp f g := ⟨f.1 ≫ g.1, sorry⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The projection `Cov(C) ⥤ C` (HTT 6.2.2.8). -/
def CategoryTheory.GrothendieckTopology.Cov.forget {D : Type u} [Category.{v} D]
    (J : GrothendieckTopology D) : CategoryTheory.GrothendieckTopology.Cov J ⥤ D where
  obj X := X.obj
  map f := f.1

namespace SSet

open _root_.SSet

/-- `Cov(C) = C ×_{N(hC)} N(Cov(hC))`, README L10.8 (`SSet.coveringSieves`; HTT Notation 6.2.2.8). -/
abbrev coveringSieves {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) : SSet.{u} :=
  Limits.pullback (nerveAdjunction.unit.app C) (nerveMap (CategoryTheory.GrothendieckTopology.Cov.forget J))

/-- `ρ : Cov(C) ⟶ C`, README L10.8 (HTT 6.2.2.8). -/
def coveringSieves.ρ {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) :
    coveringSieves J ⟶ C := Limits.pullback.fst _ _

/-- `ρ` is a Cartesian fibration, README L10.8 (HTT 6.2.2.8). -/
instance {C : SSet.{u}} [Quasicategory C] (J : GrothendieckTopology C) :
    CartesianFibration (coveringSieves.ρ J) := sorry

/-- Semitopoi, README L10.9 (`SSet.IsSemitopos`; HTT Definition 6.2.3.1): presentable, with universal
colimits, and the underlying groupoid of every Čech nerve effective. -/
def IsSemitopos (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∃ hX : IsPresentable.{u + 1, u} X, HasUniversalColimits X hX ∧
    ∀ U : augmentedSimplicialObjects X, IsCechNerve U → IsEffectiveGroupoid (augmentationInclusion ≫ U)

/-- Canonical coverings, README L10.10 (`SSet.IsCanonicalCovering`; HTT Definition 6.2.4.1): S
contains a family `u i : c' i ⟶ c` with `⊔ f(c' i) ⟶ f(c)` an effective epimorphism; f left exact
into a semitopos (hypothesis arguments). -/
def IsCanonicalCovering {C X : SSet.{u + 1}} [Quasicategory C] [Quasicategory X] (f : C ⟶ X)
    (_hX : IsSemitopos X) (_hf : IsLeftExact f) {c : C _⦋0⦌}
    (S : CategoryTheory.Sieve (show hoFunctor.obj C from HomotopyCategory.mk c)) : Prop :=
  ∃ (ι : Type (u + 1)) (c' : ι → C _⦋0⦌) (u : ∀ i, Edge (c' i) c), (∀ i, S.arrows (homMk (u i))) ∧
    ∃ (P : X _⦋0⦌) (inj : ∀ i, Edge (f.app _ (c' i)) P) (e : Edge P (f.app _ c)),
      IsCoproduct _ inj ∧ (∀ i, Nonempty (Edge.CompStruct (inj i) e ((u i).map f))) ∧ IsEffectiveEpi e

/-- The canonical topology, README L10.10 (`SSet.canonicalTopology`; HTT Proposition 6.2.4.2): the
covering sieves are the canonical coverings. -/
def canonicalTopology {C X : SSet.{u + 1}} [Quasicategory C] [Quasicategory X] (f : C ⟶ X)
    (hX : IsSemitopos X) (hf : IsLeftExact f) : GrothendieckTopology C where
  sieves c := {S | IsCanonicalCovering f hX hf (c := c.as.as) S}
  top_mem' := sorry
  pullback_stable' := sorry
  transitive' := sorry


/-- The vertex of `X_{/X}` given by an edge into X (helper for `SSet.Subobject`). -/
def Subobject.sliceVertex {C : SSet.{u}} [Quasicategory C] {X : C _⦋0⦌}
    (f : Σ c : C _⦋0⦌, Edge c X) : (slice (yonedaEquiv.symm X : Δ[0] ⟶ C)) _⦋0⦌ := sorry

/-- Subobjects, README L10.7 *Subobjects* (`SSet.Subobject`, propose; HTT Proposition 6.2.1.3 and
the prose before it): monomorphisms into X, up to equivalence in `X_{/X}`. -/
def Subobject {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌) : Type u :=
  Quot fun (f g : Σ c : C _⦋0⦌, {e : Edge c X // IsMonomorphism e}) ↦
    ∃ h : Edge (Subobject.sliceVertex ⟨f.1, f.2.1⟩) (Subobject.sliceVertex ⟨g.1, g.2.1⟩),
      Edge.IsEquivalence h

/-- The order of `Sub(X)` by factorization (README L10.7, HTT 6.2.1.3). -/
instance {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌) : PartialOrder (Subobject X) := sorry

/-- The comparison `h(C_{/c}) ⥤ (hC)_{/c}`, README L10.8 *Topologies on C are topologies on hC*
(`SSet.sliceHoComparison`, propose; HTT Remark 6.2.2.3). -/
def sliceHoComparison {C : SSet.{u}} [Quasicategory C] (c : C _⦋0⦌) :
    hoFunctor.obj (slice (yonedaEquiv.symm c : Δ[0] ⟶ C)) ⥤
      CategoryTheory.Over (show hoFunctor.obj C from HomotopyCategory.mk c) := sorry

/-- `C⁺`, README L10.8 *The plus construction* (`SSet.plusSite`, propose; HTT Construction 6.2.2.9):
the pairs `(u : C' ⟶ C, sieve)` with u in the sieve. -/
def plusSite {C : SSet.{u}} [Quasicategory C] (_J : GrothendieckTopology C) : SSet.{u} := sorry

/-- `F ↦ F† = ρ_! π_* e^* F`, README L10.8 (`SSet.plusConstruction`, propose; HTT 6.2.2.9), through
chosen Kan extension functors. -/
def plusConstruction {C : SSet.{u}} [Quasicategory C] (_J : GrothendieckTopology C) :
    presheaf C ⟶ presheaf C := sorry

end SSet

/-! ### Ext. 3, L11: the ∞-category of ∞-topoi, n-topoi, homotopy theory in an ∞-topos -/

namespace SSet

open _root_.SSet

/-- Geometric morphisms, README L11.1 (`SSet.IsGeometricMorphism`; HTT Definition 6.3.1.1): a
functor with a left exact left adjoint. -/
def IsGeometricMorphism {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y] (f : X ⟶ Y) : Prop :=
  ∃ g : Y ⟶ X, IsAdjunction g f ∧ IsLeftExact g

/-- `LTop`, README L11.1 (`SSet.lTop`; HTT Definition 6.3.1.5): the subcategory of `Cat∞^` on the
∞-topoi, with the left exact functors preserving small colimits. -/
def lTop : (SSet.catInfty.{u + 1}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsInftyTopos (catInfty.obj v)) fun e ↦
    IsLeftExact (catInfty.edgeMap (Edge.mk' e)) ∧
      PreservesSmallColimits.{u + 1, u} (catInfty.edgeMap (Edge.mk' e))

/-- `RTop`, README L11.1 (`SSet.rTop`; HTT 6.3.1.5): the ∞-topoi with the geometric morphisms. -/
def rTop : (SSet.catInfty.{u + 1}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsInftyTopos (catInfty.obj v)) fun e ↦
    IsGeometricMorphism (catInfty.edgeMap (Edge.mk' e))


/-- The covariant transport `X_s ⟶ X_{s'}` along an edge, for a coCartesian fibration (chosen;
HTT 2.4.7, supporting). -/
def cocartesianTransport {X S : SSet.{u}} (p : X ⟶ S) {s s' : S _⦋0⦌} (_e : Edge s s') :
    fibre p s ⟶ fibre p s' := sorry

/-- Topos fibrations, README L11.1 (`SSet.ToposFibration`; HTT Definition 6.3.1.6): Cartesian and
coCartesian, with ∞-topoi as fibres and left exact covariant transport. -/
structure ToposFibration {X S : SSet.{u + 1}} [Quasicategory X] (p : X ⟶ S) : Prop
    extends SSet.CartesianFibration p where
  cocartesian : CocartesianFibration p
  isInftyTopos_fibre (s : S _⦋0⦌) : IsInftyTopos (fibre p s)
  isLeftExact_transport {s s' : S _⦋0⦌} (e : Edge s s') : IsLeftExact (cocartesianTransport p e)

/-- `Fun_*(X, Y)`, README L11.1 (`SSet.funLowerStar`; HTT Definition 6.3.1.10): the geometric
morphisms. -/
def funLowerStar (X Y : SSet.{u}) [Quasicategory X] [Quasicategory Y] :
    ((ihom X).obj Y).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsGeometricMorphism (ihomVertexEquiv v)

/-- `Fun^*(Y, X)`, README L11.1 (`SSet.funUpperStar`; HTT 6.3.1.10): left exact functors preserving
small colimits. -/
def funUpperStar (Y X : SSet.{u + 1}) [Quasicategory Y] [Quasicategory X] :
    ((ihom Y).obj X).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦
    IsLeftExact (ihomVertexEquiv v) ∧ PreservesSmallColimits.{u + 1, u} (ihomVertexEquiv v)

/-- `Cat∞^lex`, README L11.1 (`SSet.catInftyLex`; HTT Definition 6.3.4.3): finite limits and left
exact functors. -/
def catInftyLex : (SSet.catInfty.{u}).Subcomplex :=
  subcomplexOf _ (fun v ↦ HasFiniteLimits (catInfty.obj v)) fun e ↦
    PreservesFiniteLimits (catInfty.edgeMap (Edge.mk' e))

/-- The square `Fun^*(Y, Z) ⟶ Fun^*(X, Z)`, `Fun^*(Y, Z) ⟶ Z_*` (evaluation at α), `Z_* ⟶ Z`,
`Fun^*(X, Z) ⟶ Z` (evaluation at U) of HTT 6.3.5.4, as a square of `Cat∞` (part of that target). -/
def classifyingSquare {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (_fstar : X ⟶ Y)
    (_U : X _⦋0⦌) (_α : Edge (chosenTerminal Y) (_fstar.app _ _U)) (Z : SSet.{u + 1})
    [Quasicategory Z] : Δ[1] ⊗ Δ[1] ⟶ SSet.catInfty.{u + 1} := sorry

/-- Classifying ∞-topoi for sections, README L11.1 (`SSet.IsClassifyingToposForSections`; HTT
Definition 6.3.5.4): for every ∞-topos Z, the square of `classifyingSquare` is a pullback in
`Cat∞`. -/
def IsClassifyingToposForSections {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y]
    (fstar : X ⟶ Y) (U : X _⦋0⦌) (α : Edge (chosenTerminal Y) (fstar.app _ U)) : Prop :=
  ∀ (Z : SSet.{u + 1}) [Quasicategory Z], IsInftyTopos Z → IsPullback (classifyingSquare fstar U α Z)

/-- `Shv_C(X)`, README L11.1 (`SSet.sheavesValuedOnTopos`, propose; HTT Notation 6.3.5.16): the
functors `Xᵒᵖ ⟶ C` preserving small limits (indexed by `SSet.{u}`), with `X` and `C` in any common
universe `v` (universe check: was `SSet.{u + 1}`, which made the limits of `Shv_Ŝ` large). -/
def sheavesValuedOnTopos (X C : SSet.{v}) : ((ihom X.op).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ PreservesSmallLimits.{v, u} (ihomVertexEquiv v)

/-- A chosen right adjoint `π_* : X_{/U} ⟶ X` of `U × − : X ⟶ X_{/U}` (supporting, HTT 6.3.5.1). -/
def sliceπStar {Y : SSet.{u}} (U : Y _⦋0⦌) : slice (yonedaEquiv.symm U) ⟶ Y := sorry

/-- Étale geometric morphisms, README L11.1 (`SSet.IsEtaleGeometricMorphism`; HTT 6.3.5.1/after;
supporting): `f ≃ π_* ∘ e` with e a categorical equivalence onto a slice. -/
def IsEtaleGeometricMorphism {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y] (f : X ⟶ Y) :
    Prop :=
  ∃ (U : Y _⦋0⦌) (e : X ⟶ slice (yonedaEquiv.symm U)), IsCategoricalEquivalence e ∧
    Nonempty ((show hoFunctor.obj ((ihom X).obj Y) from HomotopyCategory.mk (ihomVertexEquiv.symm f)) ≅
      HomotopyCategory.mk (ihomVertexEquiv.symm (e ≫ sliceπStar U)))

/-- `LTop^ét`, README L11.1 (`SSet.lTopEt`; HTT 6.3.5.1/after): left adjoints of étale geometric
morphisms. -/
def lTopEt : (SSet.catInfty.{u + 1}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsInftyTopos (catInfty.obj v)) fun e ↦
    ∃ f, IsAdjunction (catInfty.edgeMap (Edge.mk' e)) f ∧ IsEtaleGeometricMorphism f

/-- The vertex of `LTop^ét` given by an ∞-topos (helper). -/
def lTopEt.vertexOf (X : SSet.{u + 1}) [Quasicategory X] (_hX : IsInftyTopos X) :
    (lTopEt.{u} : SSet) _⦋0⦌ := ⟨catInfty.vertexOf X, sorry⟩

/-- A chosen equivalence `Xᵒᵖ ⟶ LTop^ét_{X/}` (HTT 6.3.5.10; supporting). -/
def lTopEtCosliceEquiv (X : SSet.{u + 1}) [Quasicategory X] (hX : IsInftyTopos X) :
    uliftFunctor.{u + 2}.obj X.op ⟶ coslice (yonedaEquiv.symm (lTopEt.vertexOf X hX)) := sorry

/-- `F_X : Xᵒᵖ ⟶ Ŝ`, README L11.1 (HTT Notation 6.3.5.19): the composite
`Xᵒᵖ ≃ LTop^ét_{X/} ⟶ LTop^ét ⊆ LTop ⟶ Ŝ`. -/
def lTopRestrict (F : uliftFunctor.{u + 3}.obj (lTop.{u} : SSet) ⟶ spaces.{u + 2})
    (X : SSet.{u + 1}) [Quasicategory X] (hX : IsInftyTopos X) :
    uliftFunctor.{u + 3}.obj (uliftFunctor.{u + 2}.obj X.op) ⟶ spaces.{u + 2} :=
  uliftFunctor.{u + 3}.map (lTopEtCosliceEquiv X hX ≫ coslice.π _ ≫
    Subcomplex.homOfLE (show lTopEt ≤ lTop from sorry)) ≫ F

/-- Sheaves on `LTop^op`, README L11.1 (`SSet.IsLTopSheaf`; HTT Notation 6.3.5.19): every `F_X`
preserves small limits. -/
def IsLTopSheaf (F : uliftFunctor.{u + 3}.obj (lTop.{u} : SSet) ⟶ spaces.{u + 2}) : Prop :=
  ∀ (X : SSet.{u + 1}) [Quasicategory X] (hX : IsInftyTopos X),
    PreservesSmallLimits.{u + 3, u} (lTopRestrict F X hX)

/-- `Shv(LTop^op)`, README L11.1 (`SSet.lTopSheaves`; HTT 6.3.5.19). -/
def lTopSheaves : ((ihom (uliftFunctor.{u + 3}.obj (lTop.{u} : SSet))).obj spaces.{u + 2}).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsLTopSheaf (ihomVertexEquiv v)

/-- The square `f̂^* F_X ⟶ f̂^* G_X` over `F_Y ⟶ G_Y` in `Shv_Ŝ(Y)` of HTT 6.3.5.22 (part of that
target). -/
def universalSquare {F G : (lTopSheaves.{u} : SSet) _⦋0⦌} (_α : Edge F G) {X Y : SSet.{u + 1}}
    [Quasicategory X] [Quasicategory Y] (_fstar : X ⟶ Y) :
    Δ[1] ⊗ Δ[1] ⟶
      (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj Y) spaces.{u + 2} : SSet) := sorry

/-- Universal morphisms of sheaves on `LTop^op`, README L11.1 (`SSet.IsUniversalMorphism`; HTT
Definition 6.3.5.22): for every geometric morphism with left adjoint `f^*`, the square is a pullback. -/
def IsUniversalMorphism {F G : (lTopSheaves.{u} : SSet) _⦋0⦌} (α : Edge F G) : Prop :=
  ∀ (X Y : SSet.{u + 1}) [Quasicategory X] [Quasicategory Y] (fstar : X ⟶ Y), IsInftyTopos X →
    IsInftyTopos Y → (∃ f, IsGeometricMorphism f ∧ IsAdjunction fstar f) →
      IsPullback (universalSquare α fstar)

/-- Sets of objects closed under equivalence (helper). -/
def IsReplete {X : SSet.{u}} (P : Set (X _⦋0⦌)) : Prop :=
  ∀ ⦃x y : X _⦋0⦌⦄ (e : Edge x y), Edge.IsEquivalence e → x ∈ P → y ∈ P

/-- Sets of objects closed under small colimits (helper; diagrams in `SSet.{u}`). -/
def IsClosedUnderSmallColimits {X : SSet.{u + 1}} (P : Set (X _⦋0⦌)) : Prop :=
  ∀ (K : SSet.{u}) (pbar : rightCone (uliftFunctor.{u + 1}.obj K) ⟶ X), IsColimitDiagram pbar →
    (∀ k, pbar.app _ (rightCone.incl k) ∈ P) → pbar.app _ (rightCone.pt _) ∈ P

/-- Sets of objects closed under finite limits (helper). -/
def IsClosedUnderFiniteLimits {X : SSet.{u}} (P : Set (X _⦋0⦌)) : Prop :=
  ∀ (K : SSet.{u}), K.Finite → ∀ pbar : leftCone K ⟶ X, IsLimitDiagram pbar →
    (∀ k, pbar.app _ (leftCone.incl k) ∈ P) → pbar.app _ (leftCone.pt _) ∈ P

/-- The image of a geometric morphism, README L11.1 (`SSet.geometricImage`; HTT Definition 6.3.6.1):
the smallest replete set of objects containing the essential image of `f^*` and closed under small
colimits and finite limits, `f^*` the left adjoint chosen from `hf`. -/
def geometricImage {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (f : X ⟶ Y)
    (hf : IsGeometricMorphism f) : Set (X _⦋0⦌) :=
  ⋂₀ {P | (∀ y, hf.choose.app _ y ∈ P) ∧ IsReplete P ∧ IsClosedUnderSmallColimits P ∧
    IsClosedUnderFiniteLimits P}

/-- Algebraic geometric morphisms, README L11.1 (`SSet.IsAlgebraicGeometricMorphism`; HTT 6.3.6.1). -/
def IsAlgebraicGeometricMorphism {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (f : X ⟶ Y)
    (hf : IsGeometricMorphism f) : Prop :=
  geometricImage f hf = Set.univ

/-- `P_{≤n−1}(C)`, the (n − 1)-truncated presheaves (helper for README L11.2). -/
abbrev truncatedPresheaves (n : ℕ) (C : SSet.{u}) : SSet.{u + 1} :=
  truncatedSubcategory ((n : ℤ) - 1) (presheaf C)

/-- n-topoi, README L11.2 (`SSet.IsNTopos`; HTT Definition 6.4.1.1): an accessible left exact
reflective localization of `P_{≤n−1}(C)`, the index being an integer. -/
def IsNTopos (n : ℕ) (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∃ (C : SSet.{u}) (_ : Quasicategory C) (L : truncatedPresheaves n C ⟶ X)
    (g : X ⟶ truncatedPresheaves n C),
    IsAdjunction L g ∧ IsFullyFaithful g ∧ IsAccessibleFunctor.{u + 1, u} (L ≫ g) ∧ IsLeftExact L

/-- Locales, README L11.2 (HTT Definition 6.4.2.3): no new definition; Mathlib `Order.Frame`. -/
example (U : Type u) : Type u := Order.Frame U

/-- The vertex `[k]` of `N(Δ)^op` (helper). -/
def simplexVertex (k : ℕ) : nerveSimplexOp.{u} _⦋0⦌ := ⟨opObjEquiv.symm (ComposableArrows.mk₀ ⦋k⦌)⟩

/-- Products of Kan complexes are Kan complexes (supporting; Kerodon 3.1.1.6), so that the target
of `efficiencyMap` is a Kan complex. -/
instance kanComplex_tensor (X Y : SSet.{u}) [KanComplex X] [KanComplex Y] :
    KanComplex (X ⊗ Y) := sorry

/-- The comparison `Hom_X(E, U_1) ⟶ Hom_X(E, U_0) × Hom_X(E, U_0)` of the two face maps (chosen;
HTT 6.4.3.1). -/
def efficiencyMap {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X) (E : X _⦋0⦌) :
    (morphismSpace X E (U.app _ (simplexVertex 1)) : SSet.{u}) ⟶
      (morphismSpace X E (U.app _ (simplexVertex 0)) : SSet.{u}) ⊗
        (morphismSpace X E (U.app _ (simplexVertex 0)) : SSet.{u}) := sorry

/-- n-efficient groupoids, README L11.2 (`SSet.IsNEfficient`; HTT Definition 6.4.3.1): every
`Hom_X(E, U_1) ⟶ Hom_X(E, U_0) × Hom_X(E, U_0)` is `(n − 2)`-truncated, the index an integer. -/
def IsNEfficient (n : ℕ) {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X)
    (_hU : IsGroupoidObject U) : Prop :=
  ∀ E : X _⦋0⦌, KanComplex.IsTruncatedMap ((n : ℤ) - 2) (efficiencyMap U E)

/-- `O_X^{(n)}`, `O_X^{(n)×}`, README L11.2 (HTT Notation 6.4.4.2): no new declaration;
`arrowsIn` and `cartesianArrowsIn` of the (n − 2)-truncated morphisms. -/
example (n : ℕ) (X : SSet.{u}) [Quasicategory X] : ((ihom Δ[1]).obj X).Subcomplex :=
  arrowsIn (X := X) fun _ _ f ↦ IsTruncatedMorphism ((n : ℤ) - 2) f

/-- n-topoi for `n : ℕ∞`, ∞-topoi at `⊤` (helper for README L11.2). -/
def IsNToposInf (n : ℕ∞) (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  (n = ⊤ → IsInftyTopos X) ∧ ∀ m : ℕ, n = m → IsNTopos m X

/-- `Top^R_n`, README L11.2 (`SSet.rTopN`; HTT Definition 6.4.5.1): n-topoi and geometric morphisms. -/
def rTopN (n : ℕ∞) : (SSet.catInfty.{u + 1}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsNToposInf n (catInfty.obj v)) fun e ↦
    IsGeometricMorphism (catInfty.edgeMap (Edge.mk' e))

/-- `Top^R_∞ = RTop`, README L11.2 (HTT 6.4.5.1). -/
theorem rTopN_top : rTopN.{u} ⊤ = rTop.{u} := sorry

/-- `τ_{≤m−1} Y`, the identity for `m = ⊤` (helper for README L11.2). -/
abbrev truncBelow (m : ℕ∞) (Y : SSet.{u}) [Quasicategory Y] : SSet.{u} :=
  (fullEnhancedSubcategory Y fun y ↦ ∀ k : ℕ, m = k → IsTruncatedObject ((k : ℤ) - 1) y : SSet)

/-- The restriction `Fun_*(Y, X) ⟶ Fun_*(τ_{≤m−1} Y, τ_{≤m−1} X)` (HTT 6.3.1.9; part of 6.4.5.8). -/
def localicRestriction (m : ℕ∞) (X Y : SSet.{u + 1}) [Quasicategory X] [Quasicategory Y] :
    (funLowerStar Y X : SSet) ⟶ (funLowerStar (truncBelow m Y) (truncBelow m X) : SSet) := sorry

/-- m-localic n-topoi, README L11.2 (`SSet.IsLocalic`; HTT Definition 6.4.5.8). -/
def IsLocalic (m n : ℕ∞) (X : SSet.{u + 1}) [Quasicategory X] (_h : m ≤ n)
    (_hX : IsNToposInf n X) : Prop :=
  ∀ (Y : SSet.{u + 1}) [Quasicategory Y], IsNToposInf n Y →
    IsCategoricalEquivalence (localicRestriction m X Y)

/-- The cotensor `X^K`, README L11.3 *Sheaves of sets and cotensors* (`SSet.cotensor`;
`HTT.6.5.1/intro`): a chosen object with `Map(Y, X^K) ≃ Map_H(K, Map(Y, X))`; the representing
property is not stated here (it needs `SSet.IsRepresentable` of L5.10). -/
def cotensor (K : SSet.{u}) {C : SSet.{u + 1}} (_X : C _⦋0⦌) : C _⦋0⦌ := sorry

/-- Homotopy sheaves, README L11.3 (`SSet.homotopySheaf`; HTT Definition 6.5.1.1): `π_n(f)`, an
object of the 0-truncated full subcategory of `X_{/x}`. -/
def homotopySheaf (n : ℕ) {X : SSet.{u}} [Quasicategory X] {x y : X _⦋0⦌} (_f : Edge x y) :
    (truncatedSubcategory 0 (slice (yonedaEquiv.symm x))) _⦋0⦌ := sorry

/-- n-connective morphisms, README L11.3 (`SSet.IsConnectiveMorphism`; HTT Definition 6.5.1.10):
true for `n = ⊥` (−1); otherwise an effective epimorphism with `π_k(f)` final for `k < n`. -/
def IsConnectiveMorphism (n : WithBot ℕ∞) {X : SSet.{u}} [Quasicategory X] {x y : X _⦋0⦌}
    (f : Edge x y) : Prop :=
  n = ⊥ ∨ (IsEffectiveEpi f ∧ ∀ k : ℕ, ((k : ℕ∞) : WithBot ℕ∞) < n → IsTerminalVertex (homotopySheaf k f))

/-- n-connective objects, README L11.3 (`SSet.IsConnectiveObject`; HTT 6.5.1.10). -/
def IsConnectiveObject (n : WithBot ℕ∞) {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) : Prop :=
  IsConnectiveMorphism n (toChosenTerminal x)

/-- Connected objects, README L11.3 (`SSet.IsConnectedObject`; HTT Definition 6.5.1.11). -/
def IsConnectedObject {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) : Prop :=
  IsConnectiveObject 1 x

/-- Hypercomplete objects, README L11.3 (`SSet.IsHypercompleteObject`; `HTT.6.5.2.8/after`). -/
def IsHypercompleteObject {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) : Prop :=
  IsLocalObject (fun _ _ f ↦ IsConnectiveMorphism ⊤ f) x

/-- `X^∧`, README L11.3 (`SSet.hypercompletion`; `HTT.6.5.2.8/after`). -/
def hypercompletion (X : SSet.{u}) [Quasicategory X] : X.Subcomplex :=
  fullEnhancedSubcategory X IsHypercompleteObject

/-- Hypercomplete ∞-topoi, README L11.3 (`SSet.IsHypercomplete`; `HTT.6.5.2.8/after`). -/
def IsHypercomplete (X : SSet.{u}) [Quasicategory X] : Prop :=
  ∀ ⦃x y : X _⦋0⦌⦄ (f : Edge x y), IsConnectiveMorphism ⊤ f → Edge.IsEquivalence f

/-- Cotopological localizations, README L11.3 (`SSet.IsCotopologicalLocalization`; HTT Definition
6.5.2.17): an accessible left exact reflective localization of ∞-topoi reflecting equivalences
among monomorphisms. -/
def IsCotopologicalLocalization {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y]
    (_hX : IsInftyTopos X) (_hY : IsInftyTopos Y) (L : X ⟶ Y) : Prop :=
  (∃ g : Y ⟶ X, IsAdjunction L g ∧ IsFullyFaithful g ∧ IsAccessibleFunctor.{u + 1, u} (L ≫ g)) ∧
    IsLeftExact L ∧ ∀ ⦃x y : X _⦋0⦌⦄ (f : Edge x y), IsTruncatedMorphism (-1) f →
      Edge.IsEquivalence (f.map L) → Edge.IsEquivalence f

/-- `(cosk_{n−1} U)_n` (chosen; the right Kan extension of L5.9, HTT 6.5.3.2). -/
def coskeletonObj {X : SSet.{u}} (_U : nerveSimplexOp.{u} ⟶ X) (_n : ℕ) : X _⦋0⦌ := sorry

/-- The unit `U_n ⟶ (cosk_{n−1} U)_n` (chosen; HTT 6.5.3.2); for n = 0 the target is final. -/
def coskeletonUnit {X : SSet.{u}} (U : nerveSimplexOp.{u} ⟶ X) (n : ℕ) :
    Edge (U.app _ (simplexVertex n)) (coskeletonObj U n) := sorry

/-- Hypercoverings, README L11.3 (`SSet.IsHypercover`; HTT Definition 6.5.3.2). -/
def IsHypercover {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X) : Prop :=
  ∀ n, IsEffectiveEpi (coskeletonUnit U n)

/-- Effective hypercoverings, README L11.3 (`SSet.IsEffectiveHypercover`; HTT 6.5.3.2): a colimit of
U is final. -/
def IsEffectiveHypercover {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X) : Prop :=
  IsHypercover U ∧ ∃ pbar : rightCone nerveSimplexOp.{u} ⟶ X, join.inl _ Δ[0] ≫ pbar = U ∧
    IsColimitDiagram pbar ∧ IsTerminalVertex (pbar.app _ (rightCone.pt _))

/-- n-coskeletal simplicial objects, README L11.3 (`SSet.IsCoskeletal`; `HTT.6.5.3.7/after`): right
Kan extended from `N(Δ_{≤n})^op`. -/
def IsCoskeletal (n : ℕ) {X : SSet.{u}} [Quasicategory X] (U : nerveSimplexOp.{u} ⟶ X) : Prop :=
  IsRightKanExtension (fun v : nerveSimplexOp.{u} _⦋0⦌ ↦ (nerveEquiv (opObjEquiv v.down)).len ≤ n) U

/-- `N(Δ_s)^op`, lifted (README L6.8). -/
abbrev nerveSemisimplexOp : SSet.{u} := uliftFunctor.{u}.obj (nerve SimplexCategory.inj).op


/-- n-coskeletal semisimplicial objects, README L11.3 (`HTT.6.5.3.7/after`). -/
def IsCoskeletalSemi (n : ℕ) {X : SSet.{u}} [Quasicategory X] (U : nerveSemisimplexOp.{u} ⟶ X) : Prop :=
  IsRightKanExtension
    (fun v : nerveSemisimplexOp.{u} _⦋0⦌ ↦ (nerveEquiv (opObjEquiv v.down)).obj.len ≤ n) U

/-- The topology of open covers on `h N(Opens X)`, transported along
`nerveFunctorCompHoFunctorIso` (helper for README L11.3). -/
def opensTopology (X : TopCat.{u}) : GrothendieckTopology (nerve (TopologicalSpace.Opens X)) :=
  Functor.inducedTopology
    (nerveFunctorCompHoFunctorIso.app (Cat.of (TopologicalSpace.Opens X))).hom.toFunctor
    (Opens.grothendieckTopology X)

/-- Sheaves on a topological space, README L11.3 (`SSet.sheafOnSpace`; `HTT.6.5.4/intro`):
`Shv(N(Opens X))` for the topology of open covers. -/
abbrev sheafOnSpace (X : TopCat.{u}) : SSet.{u + 1} := (sheaf (opensTopology X) : SSet)

/-- `f_* : Shv(X) ⟶ Shv(Y)`, README L11.3 (`SSet.sheafOnSpace.map`; `HTT.6.5.4/intro`). -/
def sheafOnSpace.map {X Y : TopCat.{u}} (_f : X ⟶ Y) : sheafOnSpace X ⟶ sheafOnSpace Y := sorry

/-- Left exact filtered colimits, README L11.4 (`SSet.HasLeftExactFilteredColimits`; HTT Definition
7.3.4.2): every `colim : Fun(I, C) ⟶ C` with I filtered is left exact. -/
def HasLeftExactFilteredColimits (C : SSet.{u}) [Quasicategory C] (_hC : IsPresentable.{u, w} C) :
    Prop :=
  ∀ (I : SSet.{u}) [IsFiltered I], IsLeftExact (colimFunctor I C)

end SSet

/-! ### Ext. 3, L12: higher topos theory in topology -/

/-- The singular presheaves `Sing_X(Y, −)`, README L12.1 *Spaces over X and their singular
presheaves* (`TopCat.singOver`, propose; `HTT.7.1.2.1/sing`, HTT Proposition 7.1.2.1): the
n-simplices at an open U are the maps `U × |Δ[n]| ⟶ Y` over X. -/
def TopCat.singOver (X : TopCat.{u}) :
    CategoryTheory.Over X ⥤ (TopologicalSpace.Opens X)ᵒᵖ ⥤ SSet.{u} := sorry

/-- `Top_{/X}` with the model structure of HTT 7.1.2.1 relative to a set B of opens, README L12.1
*Spaces over X and their model structure* (`TopCat.OverBasis`, propose; Conventions *Model
structures on one category*): a type synonym of `Over X`. -/
def TopCat.OverBasis (X : TopCat.{u}) (_B : Set (TopologicalSpace.Opens X)) : Type (u + 1) :=
  CategoryTheory.Over X

namespace TopCat.OverBasis

open HomotopicalAlgebra

variable {X : TopCat.{u}} (B : Set (TopologicalSpace.Opens X))

instance : Category.{u} (OverBasis X B) := inferInstanceAs (Category (CategoryTheory.Over X))

/-- The horn generators `U × Λ_top ⟶ U × |Δ[n]|` (n ≥ 1, U ∈ B), README L12.1
(`TopCat.OverBasis.horns`; `HTT.7.1.2.1/sing`). -/
def horns (_B : Set (TopologicalSpace.Opens X)) :
    CategoryTheory.MorphismProperty (CategoryTheory.Over X) := sorry

/-- The boundary generators `U × ∂_top ⟶ U × |Δ[n]|` (U ∈ B), README L12.1
(`TopCat.OverBasis.boundaries`; `HTT.7.1.2.1/sing`). -/
def boundaries (_B : Set (TopologicalSpace.Opens X)) :
    CategoryTheory.MorphismProperty (CategoryTheory.Over X) := sorry

/-- Lurie's (W) (helper for `TopCat.OverBasis`, README L12.1): `Sing_X(Y, U) ⟶ Sing_X(Z, U)` is a
homotopy equivalence for every `U ∈ B`. -/
def weakEquivalenceClass (B : Set (TopologicalSpace.Opens X)) :
    CategoryTheory.MorphismProperty (CategoryTheory.Over X) :=
  fun _ _ f ↦ ∀ U ∈ B, SSet.IsHomotopyEquivalence (((TopCat.singOver X).map f).app (op U))

/-- The bridge `Over X ≌ OverBasis X B` (identities), README L12.1 (`TopCat.OverBasis.equivalence`). -/
def equivalence (X : TopCat.{u}) (B : Set (TopologicalSpace.Opens X)) :
    CategoryTheory.Over X ≌ OverBasis X B := CategoryTheory.Equivalence.refl

/-- The model structure of HTT 7.1.2.1, README L12.1: cofibrations `(boundaries B).rlp.llp`,
fibrations `(horns B).rlp`, weak equivalences Lurie's (W). -/
instance modelCategory : ModelCategory (OverBasis X B) where
  categoryWithCofibrations := ⟨(boundaries B).rlp.llp⟩
  categoryWithWeakEquivalences := ⟨weakEquivalenceClass B⟩
  categoryWithFibrations := ⟨(horns B).rlp⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The simplicial enrichment of `Top_{/X}`, with `Y ⊗ Δ[n] = Y × |Δ[n]|` (README L12.1, HTT 7.1.2.1). -/
instance : EnrichedOrdinaryCategory SSet.{u} (OverBasis X B) := sorry

/-- `Top_{/X}` is a simplicial model category (README L12.1, HTT 7.1.2.1 with A.3.1.5). -/
instance : SimplicialModelCategory (OverBasis X B) := sorry

/-- Transport lemma, README L12.1 (`OverBasis.fibrations_eq`): `(horns B).rlp`. -/
theorem fibrations_eq :
    (fibrations (OverBasis X B)).inverseImage (equivalence X B).functor = (horns B).rlp := rfl

/-- Transport lemma, README L12.1 (`OverBasis.cofibrations_eq`): `(boundaries B).rlp.llp`. -/
theorem cofibrations_eq :
    (cofibrations (OverBasis X B)).inverseImage (equivalence X B).functor =
      (boundaries B).rlp.llp := rfl

/-- Transport lemma, README L12.1 (`OverBasis.weakEquivalences_eq`): Lurie's (W). -/
theorem weakEquivalences_eq :
    (weakEquivalences (OverBasis X B)).inverseImage (equivalence X B).functor =
      weakEquivalenceClass B := rfl

end TopCat.OverBasis

/-- The open sets of the basis of HTT 7.1.1.1, README L12.1 *The basis of open Fσ subsets*
(`TopologicalSpace.openFσ`, propose): unions of closed sets `K₀, K₁, …` with each `K_{n+1}` a
neighbourhood of `K_n`. -/
def TopologicalSpace.openFσ (X : Type u) [TopologicalSpace X] : Set (TopologicalSpace.Opens X) :=
  {U | ∃ K : ℕ → Set X, (∀ n, IsClosed (K n)) ∧ (∀ n, K n ⊆ interior (K (n + 1))) ∧
    ⋃ n, K n = U}

/-- The presheaves `N_𝒰`, README L12.1 (`TopCat.cechNerveLinear`, propose; HTT Definition 7.1.3.2):
`V ↦ N({U ∈ 𝒰 : V ⊆ s(U)})` on the basis B. -/
def TopCat.cechNerveLinear {X : TopCat.{u}} {B : Set (TopologicalSpace.Opens X)} {𝒰 : Type u}
    [LinearOrder 𝒰] (s : 𝒰 → B) : Bᵒᵖ ⥤ SSet.{u} where
  obj V := nerve {U : 𝒰 // V.unop ≤ s U}
  map f := nerveMap (Monotone.functor (f := fun U ↦ ⟨U.1, le_trans (leOfHom f.unop) U.2⟩)
    fun _ _ h ↦ h)
  map_id := sorry
  map_comp := sorry

namespace SSet

open _root_.SSet

/-- `Pro(S)`, README L12.1 (`SSet.proSpaces`; HTT Definition 7.1.6.1): the opposite of the full
subcategory of `Fun(S, S)` on the accessible left exact functors. -/
abbrev proSpaces : SSet.{u + 1} :=
  (fullEnhancedSubcategory ((ihom spaces.{u}).obj spaces.{u}) fun v ↦
    IsAccessibleFunctor.{u + 1, u} (ihomVertexEquiv v) ∧ IsLeftExact (ihomVertexEquiv v) : SSet).op

/-- The shape `Sh(X) = q_* q^*`, README L12.1 (`SSet.shape`; HTT Definition 7.1.6.3), for a chosen
geometric morphism `q_* : X ⟶ S` and the left adjoint chosen from `hq`. -/
def shape {X : SSet.{u + 1}} [Quasicategory X] (q : X ⟶ spaces.{u}) (hq : IsGeometricMorphism q) :
    proSpaces.{u} _⦋0⦌ :=
  opObjEquiv.symm ⟨ihomVertexEquiv.symm (hq.choose ≫ q), sorry⟩

/-- The map of shapes induced by a geometric morphism (HTT 7.1.6.3; part of that target). -/
def shapeMap {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (p : X ⟶ Y)
    (q : Y ⟶ spaces.{u}) (hq : IsGeometricMorphism q) (hpq : IsGeometricMorphism (p ≫ q)) :
    Edge (shape (p ≫ q) hpq) (shape q hq) := sorry

/-- Shape equivalences, README L12.1 (`SSet.IsShapeEquivalence`; HTT 7.1.6.3). -/
def IsShapeEquivalence {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (p : X ⟶ Y)
    (q : Y ⟶ spaces.{u}) (hq : IsGeometricMorphism q) (hpq : IsGeometricMorphism (p ≫ q)) : Prop :=
  Edge.IsEquivalence (shapeMap p q hq hpq)

/-- The identity of `S` as a vertex of `Pro(S)` (helper). -/
def proSpaces.idVertex : proSpaces.{u} _⦋0⦌ := opObjEquiv.symm ⟨ihomVertexEquiv.symm (𝟙 _), sorry⟩

/-- Trivial shape, README L12.1 (`SSet.HasTrivialShape`; HTT Definition 7.1.6.11): `Sh(X)` is
equivalent to the identity in `Pro(S)`. -/
def HasTrivialShape {X : SSet.{u + 1}} [Quasicategory X] (q : X ⟶ spaces.{u})
    (hq : IsGeometricMorphism q) : Prop :=
  ∃ e : Edge (shape q hq) proSpaces.idVertex, Edge.IsEquivalence e

/-- The connectivity index `n ↦ n` for `n ≥ 0`, `−1 ↦ ⊥` (helper for README L12.2). -/
def connIndex (n : ℤ) : WithBot ℕ∞ := if n < 0 then ⊥ else ((n.toNat : ℕ∞) : WithBot ℕ∞)

/-- Homotopy dimension ≤ n, README L12.2 (`SSet.HasHomotopyDimLE`; HTT Definition 7.2.1.1): every
n-connective object has a global section, for every final t. -/
def HasHomotopyDimLE (n : ℤ) (X : SSet.{u}) [Quasicategory X] : Prop :=
  ∀ t : X _⦋0⦌, IsTerminalVertex t → ∀ U : X _⦋0⦌, IsConnectiveObject (connIndex n) U →
    Nonempty (Edge t U)

/-- Relative homotopy dimension, README L12.2 (`SSet.GeometricMorphism.HasHomotopyDimLE`; HTT
Definition 7.2.1.6): k-connective morphisms go to (k − n)-connective morphisms for `k ≥ n`. -/
def GeometricMorphism.HasHomotopyDimLE (n : ℤ) {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y]
    (f : X ⟶ Y) (_hf : IsGeometricMorphism f) : Prop :=
  ∀ k : ℤ, n ≤ k → ∀ ⦃x y : X _⦋0⦌⦄ (g : Edge x y), IsConnectiveMorphism (connIndex k) g →
    IsConnectiveMorphism (connIndex (k - n)) (g.map f)

/-- Local homotopy dimension, README L12.2 (`SSet.IsLocallyOfHomotopyDimLE`; HTT Definition
7.2.1.8): a small family generating X under colimits with slices of homotopy dimension ≤ n. -/
def IsLocallyOfHomotopyDimLE (n : ℤ) (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∃ (ι : Type u) (U : ι → X _⦋0⦌),
    (∀ P : Set (X _⦋0⦌), IsReplete P → IsClosedUnderSmallColimits P → (∀ i, U i ∈ P) →
      P = Set.univ) ∧
    ∀ i, HasHomotopyDimLE n (slice (yonedaEquiv.symm (U i)))

/-- `EM_n(X)`, README L12.2 (`SSet.emObjects`; `HTT.7.2.2.1/em`, HTT Definition 7.2.2.1): pointed
objects whose target is n-truncated and n-connective. -/
def emObjects (n : ℕ) (X : SSet.{u}) [Quasicategory X] : (pointedObjects X : SSet.{u}).Subcomplex :=
  fullEnhancedSubcategory _ fun e ↦ IsTruncatedObject n (arrowVertex e.1 1) ∧
    IsConnectiveObject ((n : ℕ∞) : WithBot ℕ∞) (arrowVertex e.1 1)

/-- Zero objects of an ∞-topos, README L12.2 (HTT Definition 7.2.2.7): no new declaration;
L9's `SSet.IsZeroObject`. -/
example {X : SSet.{u}} (x : X _⦋0⦌) : Prop := IsZeroObject x

/-- `Disc(X) = h(τ_{≤0} X)` (helper for README L12.2). -/
abbrev Disc (X : SSet.{u}) [Quasicategory X] : Type u := hoFunctor.obj (truncatedSubcategory 0 X)

/-- The Cartesian monoidal structure of `Disc(X)` (finite products; supporting, HTT 7.2.2). -/
instance (X : SSet.{u}) [Quasicategory X] : CartesianMonoidalCategory (Disc X) := sorry

/-- The braiding of `Disc(X)` (supporting). -/
instance (X : SSet.{u}) [Quasicategory X] : BraidedCategory (Disc X) := sorry

/-- `K(A, n)`, README L12.2 (`SSet.eilenbergMacLane`, propose; prose after HTT 7.2.2.12): a chosen
inverse image of A under `π_n : EM_n(X) ⟶ N(Disc(X))`. -/
def eilenbergMacLane (n : ℕ) {X : SSet.{u}} [Quasicategory X] (_A : CommGrp (Disc X)) : X _⦋0⦌ :=
  sorry

/-- Cohomology, README L12.2 (`SSet.cohomology`; HTT Definition 7.2.2.14):
`H^n(X; A) = π₀ Map_X(1_X, K(A, n))`. -/
def cohomology (n : ℕ) {X : SSet.{u}} [Quasicategory X] (A : CommGrp (Disc X)) : Type u :=
  π₀ (morphismSpace X (chosenTerminal X) (eilenbergMacLane n A) : SSet.{u})

/-- Cohomological dimension ≤ n, README L12.2 (`SSet.HasCohomologicalDimLE`; HTT Definition
7.2.2.18). -/
def HasCohomologicalDimLE (n : ℕ) (X : SSet.{u}) [Quasicategory X] : Prop :=
  ∀ (A : CommGrp (Disc X)) (k : ℕ), n < k → Subsingleton (cohomology k A)

/-- n-gerbes, README L12.2 (`SSet.IsGerbe`; HTT Definition 7.2.2.20). -/
def IsGerbe (n : ℕ) {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) : Prop :=
  IsConnectiveObject ((n : ℕ∞) : WithBot ℕ∞) x ∧ IsTruncatedObject n x

/-- The pullback `Disc(X) ⥤ Disc(X_{/x})` (supporting, HTT 7.2.1.13). -/
def discPullback {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) :
    Disc X ⥤ Disc (slice (yonedaEquiv.symm x)) := sorry

/-- Gerbes banded by A, README L12.2 (`SSet.IsBandedBy`; HTT Definition 7.2.2.20, n ≥ 2): `π_n x`
is isomorphic to the pullback of A to `Disc(X_{/x})` (the compatibility of the group structures is
not stated). -/
def IsBandedBy (n : ℕ) {X : SSet.{u}} [Quasicategory X] (x : X _⦋0⦌) (A : CommGrp (Disc X)) :
    Prop :=
  2 ≤ n ∧ IsGerbe n x ∧
    Nonempty ((show Disc (slice (yonedaEquiv.symm x)) from
      HomotopyCategory.mk (homotopySheaf n (toChosenTerminal x))) ≅ (discPullback x).obj A.X)

end SSet

/-- Covering dimension ≤ n, README L12.2 (`TopologicalSpace.HasCoveringDimLE`, propose; HTT
Definition 7.2.3.1): every open cover has an open refinement in which any `n + 2` members have empty
intersection. -/
def TopologicalSpace.HasCoveringDimLE (n : ℕ) (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (ι : Type u) (U : ι → Set X), (∀ i, IsOpen (U i)) → ⋃ i, U i = Set.univ →
    ∃ (κ : Type u) (V : κ → Set X), (∀ j, IsOpen (V j)) ∧ ⋃ j, V j = Set.univ ∧
      (∀ j, ∃ i, V j ⊆ U i) ∧ ∀ s : Finset κ, s.card = n + 2 → ⋂ j ∈ s, V j = ∅

/-- Absolute neighbourhood retracts, README L12.3 *Cell-like maps of ANRs*
(`TopologicalSpace.IsANR`, propose; HTT Proposition 7.3.6.6): metrizable, and a neighbourhood
retract of every metric space in which it embeds as a closed subset. -/
def TopologicalSpace.IsANR (X : Type u) [TopologicalSpace X] : Prop :=
  TopologicalSpace.MetrizableSpace X ∧ ∀ (Y : Type u) [MetricSpace Y] (i : X → Y),
    Topology.IsClosedEmbedding i → ∃ U : Set Y, IsOpen U ∧ Set.range i ⊆ U ∧
      ∃ r : U → X, Continuous r ∧ ∀ (x : X) (hx : i x ∈ U), r ⟨i x, hx⟩ = x

/-- Finite covering dimension ≤ n, README L12.4 *Classical inputs*
(`TopologicalSpace.HasFiniteCoverDimLE`, propose): every finite open cover `u` has an open shrinking
`v` in which any `n + 2` members have empty intersection. -/
def TopologicalSpace.HasFiniteCoverDimLE (n : ℕ) (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (k : ℕ) (u : Fin k → Set X), (∀ j, IsOpen (u j)) → ⋃ j, u j = Set.univ →
    ∃ v : Fin k → Set X, (∀ j, IsOpen (v j)) ∧ ⋃ j, v j = Set.univ ∧ (∀ j, v j ⊆ u j) ∧
      ∀ s : Finset (Fin k), s.card = n + 2 → ⋂ j ∈ s, v j = ∅

/-- Heyting spaces, README L12.2 (`TopologicalSpace.HeytingSpace`, propose; `HTT.7.2.4/intro`): a
basis of compact opens closed under finite intersection, X compact, and `int(U ∪ (X − V))` compact
for compact opens U, V. -/
class TopologicalSpace.HeytingSpace (X : Type u) [TopologicalSpace X] : Prop
    extends PrespectralSpace X, QuasiSeparatedSpace X, CompactSpace X where
  isCompact_interior_union_compl (U V : Set X) : IsOpen U → IsCompact U → IsOpen V → IsCompact V →
    IsCompact (interior (U ∪ Vᶜ))

/-- Heyting dimension ≤ α of a subset S, by well-founded recursion on α (README L12.2,
`HTT.7.2.4/intro`): for every relatively compact open `U ∩ S` of S, its boundary in S is empty or has
Heyting dimension ≤ some `β < α`. -/
def TopologicalSpace.heytingDimLE {X : Type u} [TopologicalSpace X] (α : Ordinal.{u}) (S : Set X) :
    Prop :=
  ∀ U : Set X, IsOpen U → IsCompact (U ∩ S) →
    (closure (U ∩ S) ∩ S) \ (U ∩ S) = ∅ ∨
      ∃ β : Set.Iio α, heytingDimLE β.1 ((closure (U ∩ S) ∩ S) \ (U ∩ S))
termination_by α
decreasing_by exact β.2

/-- Heyting dimension ≤ α, README L12.2 (`TopologicalSpace.HasHeytingDimLE`, propose;
`HTT.7.2.4/intro`). -/
def TopologicalSpace.HasHeytingDimLE (α : Ordinal.{u}) (X : Type u) [TopologicalSpace X] : Prop :=
  heytingDimLE α (Set.univ : Set X)

/-- The irreducible closed subsets (helper for the Krull dimension). -/
abbrev TopologicalSpace.IrreducibleClosed (X : Type u) [TopologicalSpace X] : Type u :=
  {Z : Set X // IsIrreducible Z ∧ IsClosed Z}

/-- Strict inclusion of irreducible closed subsets of a Noetherian space is well-founded
(`HTT.7.2.4/intro`). -/
theorem TopologicalSpace.wellFounded_irreducibleClosed (X : Type u) [TopologicalSpace X]
    [_root_.TopologicalSpace.NoetherianSpace X] :
    WellFounded fun A B : IrreducibleClosed X ↦ A.1 ⊂ B.1 := sorry

/-- The Krull dimension of a Noetherian space, README L12.2 (`HTT.7.2.4/intro`): the supremum of the
ordinal ranks of the irreducible closed subsets under strict inclusion (`WellFounded.rank`). -/
def TopologicalSpace.krullDimOrd (X : Type u) [TopologicalSpace X]
    [_root_.TopologicalSpace.NoetherianSpace X] : Ordinal.{u} :=
  haveI := wellFounded_irreducibleClosed X
  ⨆ Z : IrreducibleClosed X, WellFounded.rank (fun A B : IrreducibleClosed X ↦ A.1 ⊂ B.1) Z

/-- Strongly k-connective sheaves, README L12.2 (`IsStronglyConnective`, propose; HTT Definition
7.2.4.8): on a compact open V of a Heyting space, every `∂Δ[m] ⟶ F(U)` (U ⊆ V compact open)
extends to `Δ[m]` on an open cover of `U − K`, for a closed K ⊆ U with `U − K` compact whose closure
in X is empty or has Heyting dimension `< m − k`. -/
def TopologicalSpace.IsStronglyConnective {X : Type u} [TopologicalSpace X] [HeytingSpace X]
    (V : TopologicalSpace.Opens X) (_hV : IsCompact (V : Set X)) (k : ℤ)
    (F : (TopologicalSpace.Opens V)ᵒᵖ ⥤ SSet.{u}) : Prop :=
  ∀ (m : ℕ) (U : TopologicalSpace.Opens V), IsCompact (U : Set V) →
    ∀ ζ : (∂Δ[m] : SSet.{u}) ⟶ F.obj (op U), ∃ K : Set V, K ⊆ U ∧ IsClosed K ∧
      IsCompact ((U : Set V) \ K) ∧
      (closure (Subtype.val '' K) = ∅ ∨ ∃ β : ℕ, (β : ℤ) < m - k ∧
        heytingDimLE (β : Ordinal.{u}) (closure (Subtype.val '' K))) ∧
      ∃ (ι : Type u) (W : ι → TopologicalSpace.Opens V) (hW : ∀ i, W i ≤ U),
        (⋃ i, (W i : Set V)) = (U : Set V) \ K ∧
          ∀ i, ∃ η : Δ[m] ⟶ F.obj (op (W i)), ∂Δ[m].ι ≫ η = ζ ≫ F.map (homOfLE (hW i)).op

/-- Left adjointable squares of categories, README L12.3 (`CategoryTheory.TwoSquare.IsLeftAdjointable`,
propose; `HTT.7.3.1/intro`, HTT Definition 7.3.1.1): for `η : q'_* ⋙ p_* ≅ p'_* ⋙ q_*` and
`q^* ⊣ q_*`, `q'^* ⊣ q'_*`, the push-pull transformation `q^* p_* ⟶ p'_* q'^*` (Mathlib's
`mateEquiv`) is an isomorphism. -/
def CategoryTheory.TwoSquare.IsLeftAdjointable {C' D' C D : Type u} [Category.{v} C'] [Category.{v} D']
    [Category.{v} C] [Category.{v} D] {q'star : C' ⥤ D'} {p'star : C' ⥤ C} {pstar : D' ⥤ D}
    {qstar : C ⥤ D} (η : q'star ⋙ pstar ≅ p'star ⋙ qstar) {qup : D ⥤ C} {q'up : D' ⥤ C'}
    (adj : qup ⊣ qstar) (adj' : q'up ⊣ q'star) : Prop :=
  IsIso (X := pstar ⋙ qup) (Y := q'up ⋙ p'star) ((mateEquiv adj' adj).symm η.hom)

namespace SSet

open _root_.SSet

/-- The adjunction of homotopy categories induced by an adjunction of quasicategories (chosen from
the `Bicategory.Adjunction`; helper, HTT 5.2.2). -/
def IsAdjunction.ho {A B : SSet.{u}} [Quasicategory A] [Quasicategory B] {L : A ⟶ B} {g : B ⟶ A}
    (_h : IsAdjunction L g) : (hoFunctor.map L).toFunctor ⊣ (hoFunctor.map g).toFunctor := sorry

/-- Left adjointable squares of quasicategories, README L12.3 (`SSet.IsLeftAdjointableSquare`, HTT
Definition 7.3.1.2): `TwoSquare.IsLeftAdjointable` of the image under `hoFunctor`. -/
def IsLeftAdjointableSquare {C' D' C D : SSet.{u}} [Quasicategory C'] [Quasicategory D']
    [Quasicategory C] [Quasicategory D] {q'star : C' ⟶ D'} {p'star : C' ⟶ C} {pstar : D' ⟶ D}
    {qstar : C ⟶ D}
    (η : (hoFunctor.map q'star).toFunctor ⋙ (hoFunctor.map pstar).toFunctor ≅
      (hoFunctor.map p'star).toFunctor ⋙ (hoFunctor.map qstar).toFunctor)
    {qup : D ⟶ C} {q'up : D' ⟶ C'} (h : IsAdjunction qup qstar) (h' : IsAdjunction q'up q'star) :
    Prop :=
  CategoryTheory.TwoSquare.IsLeftAdjointable η h.ho h'.ho

/-- A square of quasicategories, with its commutativity in homotopy categories (helper for decoding
squares of `RTop`). -/
structure QCatSquare where
  /-- The corners. -/
  C' : SSet.{u}
  D' : SSet.{u}
  C : SSet.{u}
  D : SSet.{u}
  [qC' : Quasicategory C']
  [qD' : Quasicategory D']
  [qC : Quasicategory C]
  [qD : Quasicategory D]
  /-- The functors. -/
  q'star : C' ⟶ D'
  p'star : C' ⟶ C
  pstar : D' ⟶ D
  qstar : C ⟶ D
  /-- The commutativity. -/
  η : (hoFunctor.map q'star).toFunctor ⋙ (hoFunctor.map pstar).toFunctor ≅
    (hoFunctor.map p'star).toFunctor ⋙ (hoFunctor.map qstar).toFunctor

attribute [instance] QCatSquare.qC' QCatSquare.qD' QCatSquare.qC QCatSquare.qD

/-- Left adjointability of a decoded square: for all left adjoints of `q_*` and `q'_*`. -/
def QCatSquare.IsLeftAdjointable (S : QCatSquare.{u}) : Prop :=
  ∀ (qup : S.D ⟶ S.C) (q'up : S.D' ⟶ S.C') (h : IsAdjunction qup S.qstar)
    (h' : IsAdjunction q'up S.q'star), IsLeftAdjointableSquare S.η h h'

/-- The square of quasicategories and functors given by a square of `Cat∞` (helper decoding Tau
Ceti's `SSet.catInfty`; the horizontal edges are `q'_*`, `q_*`). -/
def catInfty.decodeSquare (_σ : Δ[1] ⊗ Δ[1] ⟶ SSet.catInfty.{u}) : QCatSquare.{u} := sorry

/-- The edge of `Cat∞` given by a functor (helper). -/
def catInfty.edgeOf {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y] (_f : X ⟶ Y) :
    SSet.catInfty.{u} _⦋1⦌ := sorry

/-- Proper geometric morphisms, README L12.3 (`SSet.IsProperGeometricMorphism`; HTT Definition
7.3.1.4): for every rectangle of `RTop` (rows `X'' ⟶ X' ⟶ X` over `Y'' ⟶ Y' ⟶ Y`, here
`Δ[1] × Δ[2] ⟶ RTop`) with right edge p and both squares pullbacks, the left square is left
adjointable. -/
def IsProperGeometricMorphism {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (p : X ⟶ Y)
    (_hp : IsGeometricMorphism p) : Prop :=
  ∀ ρ : Δ[1] ⊗ Δ[2] ⟶ (rTop.{u} : SSet),
    yonedaEquiv (squareH 1 ≫ rectSquare ρ 1 ≫ rTop.ι) = catInfty.edgeOf p →
      IsPullback (rectSquare ρ 0) → IsPullback (rectSquare ρ 1) →
        (catInfty.decodeSquare (rectSquare ρ 0 ≫ rTop.ι)).IsLeftAdjointable

/-- Locally compact spaces, README L12.3 (HTT Definition 7.3.1.7): no new definition. -/
example (X : Type u) [TopologicalSpace X] : Prop := LocallyCompactSpace X

/-- Completely regular spaces, README L12.3 (HTT Definition 7.3.1.12): no new definition. -/
example (X : Type u) [TopologicalSpace X] : Prop := T35Space X

/-- Proper maps, README L12.3 (HTT Definition 7.3.1.14): no new definition. -/
example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (p : X → Y) : Prop := IsProperMap p

/-- The class `S_U` generated by `∅ ⟶ V` with V admitting a map to U (HTT 7.3.2.3). -/
def awayGenerators {X : SSet.{u}} (U : X _⦋0⦌) : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop :=
  fun x y _ ↦ IsInitialVertex x ∧ Nonempty (Edge y U)

/-- Equivalences away from U, README L12.3 (`SSet.IsEquivalenceAwayFrom`; `HTT.7.3.2.3/after`):
members of the strongly saturated class generated by `S_U`. -/
def IsEquivalenceAwayFrom {X : SSet.{u}} (U : X _⦋0⦌) : ∀ ⦃x y : X _⦋0⦌⦄, Edge x y → Prop :=
  stronglySaturatedClosure.{u, u} (awayGenerators U)

/-- `X^{/U}`, the objects trivial on U, README L12.3 (`SSet.closedComplement`; HTT 7.3.2.4 and
Definition 7.3.2.6). -/
def closedComplement {X : SSet.{u}} [Quasicategory X] (U : X _⦋0⦌) : X.Subcomplex :=
  fullEnhancedSubcategory X (IsLocalObject (IsEquivalenceAwayFrom U))

/-- Closed immersions, README L12.3 (`SSet.IsClosedImmersion`; HTT Definition 7.3.2.6): an
equivalence onto `X^{/U}` for some `U ∈ Sub(1_X)`. -/
def IsClosedImmersion {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y] (π : Y ⟶ X) : Prop :=
  IsGeometricMorphism π ∧ ∃ U : X _⦋0⦌, IsMonomorphism (toChosenTerminal U) ∧
    ∃ e : Y ⟶ (closedComplement U : SSet.{u}), IsCategoricalEquivalence e ∧ e ≫ (closedComplement U).ι = π

/-- The opens of `U` in a sieve, as a category (helper for README L12.3). -/
abbrev sieveOpens {X : TopCat.{u}} (U : TopologicalSpace.Opens X) (S : CategoryTheory.Sieve U) :
    Type u :=
  ObjectProperty.FullSubcategory fun V : TopologicalSpace.Opens X ↦ ∃ h : V ≤ U, S.arrows (homOfLE h)

/-- The cone `(N(S)^op)^◁ ⟶ N(Opens X)^op` with apex U (helper). -/
def sieveCone {X : TopCat.{u}} (U : TopologicalSpace.Opens X) (S : CategoryTheory.Sieve U) :
    leftCone (nerve (sieveOpens U S)).op ⟶ (nerve (TopologicalSpace.Opens X)).op := sorry

/-- C-valued sheaves, README L12.3 (`SSet.IsSheafValued`; HTT Definition 7.3.3.1): for every
covering sieve the restricted cone is a limit diagram. -/
def IsSheafValued {X : TopCat.{u}} {C : SSet.{u}} (F : (nerve (TopologicalSpace.Opens X)).op ⟶ C) :
    Prop :=
  ∀ (U : TopologicalSpace.Opens X) (S : CategoryTheory.Sieve U), S ∈ Opens.grothendieckTopology X U →
    IsLimitDiagram (sieveCone U S ≫ F)

/-- `Shv(X; C)`, README L12.3 (`SSet.sheavesValued`; HTT 7.3.3.1). -/
def sheavesValued (X : TopCat.{u}) (C : SSet.{u}) :
    ((ihom (nerve (TopologicalSpace.Opens X)).op).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsSheafValued (ihomVertexEquiv v)

/-- The poset `K(X)` of compact subsets (helper for README L12.3). -/
abbrev CompactSets (X : Type u) [TopologicalSpace X] : Type u := {K : Set X // IsCompact K}

/-- `K ⋐ K'`: some open lies between them (HTT 7.3.4.1). -/
def CompactSets.CompactlyContained {X : Type u} [TopologicalSpace X] (K K' : CompactSets X) : Prop :=
  ∃ U : Set X, IsOpen U ∧ K.1 ⊆ U ∧ U ⊆ K'.1

/-- The vertex K of `N(K(X))^op` (helper). -/
def CompactSets.vertex {X : Type u} [TopologicalSpace X] (K : CompactSets X) :
    (nerve (CompactSets X)).op _⦋0⦌ := opObjEquiv.symm (ComposableArrows.mk₀ K)

/-- The square `K ∪ K' ⟶ K, K' ⟶ K ∩ K'` of `N(K(X))^op` (helper). -/
def CompactSets.square {X : Type u} [TopologicalSpace X] (_K _K' : CompactSets X) :
    Δ[1] ⊗ Δ[1] ⟶ (nerve (CompactSets X)).op := sorry

/-- The cocone `(N{K' : K ⋐ K'}^op)^▷ ⟶ N(K(X))^op` with apex K (helper). -/
def CompactSets.cocone {X : Type u} [TopologicalSpace X] (K : CompactSets X) :
    rightCone (nerve {K' : CompactSets X // CompactSets.CompactlyContained K K'}).op ⟶
      (nerve (CompactSets X)).op := sorry

/-- K-sheaves, README L12.3 (`SSet.IsKSheaf`; HTT Definition 7.3.4.1): `F(∅)` final, the union
squares pullbacks, and `F(K) = colim_{K ⋐ K'} F(K')`. -/
def IsKSheaf {X : Type u} [TopologicalSpace X] {C : SSet.{u}} (F : (nerve (CompactSets X)).op ⟶ C) :
    Prop :=
  IsTerminalVertex (F.app _ (CompactSets.vertex ⟨∅, isCompact_empty⟩)) ∧
    (∀ K K' : CompactSets X, IsPullback (CompactSets.square K K' ≫ F)) ∧
    ∀ K : CompactSets X, IsColimitDiagram (CompactSets.cocone K ≫ F)

/-- `Shv_K(X; C)`, README L12.3 (`SSet.kSheaves`; HTT 7.3.4.1). -/
def kSheaves (X : Type u) [TopologicalSpace X] (C : SSet.{u}) :
    ((ihom (nerve (CompactSets X)).op).obj C).Subcomplex :=
  fullEnhancedSubcategory _ fun v ↦ IsKSheaf (ihomVertexEquiv v)

/-- Cell-like geometric morphisms, README L12.3 (`SSet.IsCellLike`; HTT Definition 7.3.6.1): proper,
with fully faithful left adjoint `p^*` (Lurie's "right adjoint `p^*`" is a slip). -/
def IsCellLike {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (p : X ⟶ Y)
    (hp : IsGeometricMorphism p) : Prop :=
  IsProperGeometricMorphism p hp ∧ IsFullyFaithful hp.choose

/-- ∞-topoi with enough points, README L12.3 *Points* (`SSet.HasEnoughPoints`; HTT Remark 6.5.4.7):
a morphism whose image under every stalk functor `p^*` (a chosen left adjoint of a geometric
morphism `p : S ⟶ X`) is an equivalence is an equivalence. -/
def HasEnoughPoints (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∀ ⦃x y : X _⦋0⦌⦄ (f : Edge x y),
    (∀ (p : spaces.{u} ⟶ X) (hp : IsGeometricMorphism p),
      Edge.IsEquivalence (f.map (Classical.choose hp))) → Edge.IsEquivalence f

end SSet


/-! ## Milestone theorems

Statements, as `theorem … := by sorry`, of the README *Milestones* (front matter, *How to read
the build*) and of the characterizations named in the third column of the Conventions table whose
notions are declared above. Each docstring names the README entry and the Lurie (or Kerodon)
number. Auxiliary declarations that a statement needs and the file lacked are marked *(added)*. -/

/-! ### Added supporting declarations -/

namespace HomotopicalAlgebra

/-- *(added)* Quillen equivalences, README F1.5 *Quillen equivalences*
(`Adjunction.IsQuillenEquivalence`; HTT Proposition A.2.5.1), in the form of A.2.5.1's third
condition: a Quillen adjunction for which a map `X ⟶ G Y` from a cofibrant `X` to the image of a
fibrant `Y` is a weak equivalence exactly when its adjoint `F X ⟶ Y` is. Mathlib has no Quillen
equivalence predicate. -/
def Adjunction.IsQuillenEquivalence {C : Type u} [Category.{v} C] [ModelCategory C] {D : Type u₁}
    [Category.{v₁} D] [ModelCategory D] {F : C ⥤ D} {G : D ⥤ C} (adj : F ⊣ G) : Prop :=
  Adjunction.IsQuillen adj ∧ ∀ (X : C) (Y : D), IsCofibrant X → IsFibrant Y →
    ∀ f : X ⟶ G.obj Y, WeakEquivalence f ↔ WeakEquivalence ((adj.homEquiv X Y).symm f)

end HomotopicalAlgebra

namespace SSet

open _root_.SSet TauCetiRoadmap.HigherToposTheory.HomotopicalAlgebra

/-- *(added)* Kan–Quillen is combinatorial, part of README F3.1 *Properties of the Kan–Quillen
model structure* (`HTT.A.2.7/model-properties`, HTT Example A.3.1.4); needed to put Bergner's
structure on `Cat_Δ` (`EnrichedCat.Bergner.modelCategory`). -/
theorem modelCategoryQuillen_isCombinatorial : IsCombinatorial.{u} SSet.{u} := by sorry

/-- *(added)* The weak homotopy equivalences are monoidal (every simplicial set is cofibrant and
the product is a left Quillen bifunctor), README F3.1 (`HTT.A.2.7/model-properties`); the
hypothesis under which `EnrichedCat.Bergner.modelCategory` is stated. -/
theorem modelCategoryQuillen_isMonoidal : (weakEquivalences SSet.{u}).IsMonoidal := by sorry

/-- *(added)* Every simplicial set is cofibrant (the cofibrations are the monomorphisms), README F3.1
(`HTT.A.2.7/model-properties`); a hypothesis of `EnrichedCat.Bergner.modelCategory`. -/
theorem modelCategoryQuillen_isCofibrant (X : SSet.{u}) : IsCofibrant X := by sorry

/-- *(added)* Weak homotopy equivalences are stable under filtered colimits, README F3.1
(`HTT.A.2.7/model-properties/combinatorial`); a hypothesis of `EnrichedCat.Bergner.modelCategory`. -/
theorem modelCategoryQuillen_isStableUnderFilteredColimits :
    (weakEquivalences SSet.{u}).IsStableUnderFilteredColimits.{u, u} := by sorry

/-- *(added)* `Ex^∞ = colim_n Ex^n`, README F2.3 *Subdivision and `Ex^∞`* (`SSet.exInfty`); Mathlib
has `SSet.ex` but not its colimit. -/
def exInfty : SSet.{u} ⥤ SSet.{u} := sorry

/-- *(added)* The functoriality of the simplicial nerve, `N(F) : N(C) ⟶ N(D)` (README L1.4); Mathlib
has `SimplicialNerve` on objects only. -/
def simplicialNerve.map {C D : Type u} [Category.{u} C] [SimplicialCategory C] [Category.{u} D]
    [SimplicialCategory D] (F : EnrichedFunctor SSet.{u} C D) :
    SimplicialNerve C ⟶ SimplicialNerve D := sorry

/-- *(added)* The counit `C[N(C)] ⟶ C` of the adjunction `(C[−], N)`, README L2.8 *The comparison
theorem* (HTT 2.2.0.1). -/
def simplicialNerveCounit (C : Type u) [Category.{u} C] [SimplicialCategory C] :
    EnrichedFunctor SSet.{u} (Rigidification (SimplicialNerve C)) C := sorry

/-- *(added)* `C[−] : SSet ⥤ Cat_Δ` as a functor from the Joyal model category to Bergner's
(README L1.4, L3.8; HTT 2.2.5.1). -/
def rigidificationFunctor : Joyal.{u} ⥤ EnrichedCat.Bergner SSet.{u} := sorry

/-- *(added)* The simplicial nerve `N : Cat_Δ ⥤ SSet` (README L1.4, L3.8; HTT 2.2.5.1). -/
def simplicialNerveFunctor : EnrichedCat.Bergner SSet.{u} ⥤ Joyal.{u} := sorry

/-- *(added)* The adjunction `C[−] ⊣ N` (README L1.4; HTT §1.1.5). -/
def rigidificationAdjunction : rigidificationFunctor.{u} ⊣ simplicialNerveFunctor.{u} := sorry

/-- *(added)* The pinch inclusion `Hom^R_C(x, y) ⟶ Hom_C(x, y)`, README L1.5 *Morphism spaces*
(HTT 4.2.1.8). -/
def rightMappingSpace.toMorphismSpace (C : SSet.{u}) (x y : C _⦋0⦌) :
    (rightMappingSpace C x y : SSet.{u}) ⟶ (morphismSpace C x y : SSet.{u}) := sorry

/-- *(added)* The pinch inclusion `Hom^L_C(x, y) ⟶ Hom_C(x, y)`, README L1.5 (HTT 4.2.1.8). -/
def leftMappingSpace.toMorphismSpace (C : SSet.{u}) (x y : C _⦋0⦌) :
    (leftMappingSpace x y : SSet.{u}) ⟶ (morphismSpace C x y : SSet.{u}) := sorry

/-- *(added)* The natural map `|Hom^R_S(x, y)|_Q ⟶ Map_{C[S]}(x, y)` in `H`, README L2.8 *The
mapping-space comparison* (HTT 2.2.4.1). -/
def rightMappingSpace.toMapH (S : SSet.{u}) (x y : S _⦋0⦌) :
    SSet.H.Q.obj (rightMappingSpace S x y : SSet.{u}) ⟶ mapH x y := sorry

/-- *(added)* `Hom^R_X(x, y) ⟶ Hom^R_Y(f x, f y)`, README L1.5 *Fully faithful and essentially
surjective maps* (characterizations). -/
def rightMappingSpace.map {X Y : SSet.{u}} (f : X ⟶ Y) (x y : X _⦋0⦌) :
    (rightMappingSpace X x y : SSet.{u}) ⟶ (rightMappingSpace Y (f.app _ x) (f.app _ y) : SSet.{u}) :=
  sorry

/-- *(added)* `Hom_X(x, y) ⟶ Hom_Y(f x, f y)`, README L1.5 (Kerodon 4.8.3.1). -/
def morphismSpace.map {X Y : SSet.{u}} (f : X ⟶ Y) (x y : X _⦋0⦌) :
    (morphismSpace X x y : SSet.{u}) ⟶ (morphismSpace Y (f.app _ x) (f.app _ y) : SSet.{u}) :=
  Subcomplex.lift ((morphismSpace X x y).ι ≫ (ihom Δ[1]).map f) sorry

/-- *(added)* The constant map `K ⟶ C` at a vertex (helper). -/
abbrev constAt (K : SSet.{u}) {C : SSet.{u}} (y : C _⦋0⦌) : K ⟶ C :=
  stdSimplex.isTerminalObj₀.from K ≫ yonedaEquiv.symm y

/-- *(added)* For a cocone `p̄ : K^▷ ⟶ C` with cone point `c`, the map
`Hom_C(c, y) ⟶ Hom_{Fun(K, C)}(p, const_y)` given by composing with the cocone, chosen; README L1.5
*Limits and colimits* (characterization, Kerodon 7.1.1.1 dualized). -/
def coconeMorphismSpaceMap {K C : SSet.{u}} (pbar : rightCone K ⟶ C) (y : C _⦋0⦌) :
    (morphismSpace C (yonedaEquiv (join.inr K Δ[0] ≫ pbar)) y : SSet.{u}) ⟶
      (morphismSpace ((ihom K).obj C) (ihomVertexEquiv.symm (join.inl K Δ[0] ≫ pbar))
        (ihomVertexEquiv.symm (constAt K y)) : SSet.{u}) := sorry

/-- *(added)* For `α : f ⟶ δ ≫ f'` and `g : K' ⟶ D`, the map
`Hom_{Fun(K', D)}(f', g) ⟶ Hom_{Fun(K, D)}(f, δ ≫ g)`, restriction along δ followed by composition
with α, chosen; README L5.9 *Kan extensions along arbitrary maps* (Kerodon §7.3.6). -/
def kanExtensionPrecompMap {K K' D : SSet.{u}} (δ : K ⟶ K') {f : K ⟶ D} {f' : K' ⟶ D}
    (_α : Edge (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ f'))) (g : K' ⟶ D) :
    (morphismSpace ((ihom K').obj D) (ihomVertexEquiv.symm f') (ihomVertexEquiv.symm g) : SSet.{u}) ⟶
      (morphismSpace ((ihom K).obj D) (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ g)) :
        SSet.{u}) := sorry

/-- *(added)* The Yoneda embedding into `Ind_κ(C)`, README L6 *`Ind_κ`* (`SSet.ind.yoneda`; HTT
5.3.5.2). -/
def ind.yoneda (κ : Cardinal.{w}) (C : SSet.{u}) [Quasicategory C] [Fact κ.IsRegular] :
    uliftFunctor.{u + 1}.obj C ⟶ ind κ C := sorry

/-- *(added)* `Ind_κ(C)` is a quasicategory (a full subcategory of `P(C)`; helper instance). -/
instance quasicategory_ind (κ : Cardinal.{w}) (C : SSet.{u}) [Quasicategory C] [Fact κ.IsRegular] :
    Quasicategory (ind κ C) := sorry

/-- *(added)* `Fun^κ(P, D)`, the full subcategory of κ-continuous functors, README L6 *The universal
property of `Ind_κ`* (`SSet.funCardinalContinuous`; HTT 5.3.5.10). -/
def funCardinalContinuous (P D : SSet.{v}) [Quasicategory P] [Quasicategory D] (κ : Cardinal.{w})
    [Fact κ.IsRegular] (hP : HasCardinalFilteredColimits.{w, v, u} P κ) :
    ((ihom P).obj D).Subcomplex :=
  fullEnhancedSubcategory _ fun g ↦ IsCardinalContinuous (ihomVertexEquiv g) κ hP

/-- *(added)* Generation under small κ-filtered colimits (README L7 *The generator
characterization*, HTT 5.4.2.2): the only full subcategory containing `A` and stable under small
κ-filtered colimits is `C` itself (the κ-filtered form of `SSet.GeneratesUnderColimits`). -/
def GeneratesUnderCardinalFilteredColimits {C : SSet.{v}} (A : Set (C _⦋0⦌)) (κ : Cardinal.{u}) :
    Prop :=
  ∀ C₀ : Set (C _⦋0⦌), A ⊆ C₀ →
    (∀ (K : SSet.{u}) [Quasicategory K] [SSet.IsCardinalFiltered K κ]
      (pbar : rightCone (uliftFunctor.{v}.obj K) ⟶ uliftFunctor.{u}.obj C), IsColimitDiagram pbar →
      (∃ q : uliftFunctor.{v}.obj K ⟶ uliftFunctor.{u}.obj (fullEnhancedSubcategory C (· ∈ C₀)),
        q ≫ uliftFunctor.{u}.map (Subcomplex.ι _) = join.inl _ Δ[0] ≫ pbar) →
      ∃ q' : Δ[0] ⟶ uliftFunctor.{u}.obj (fullEnhancedSubcategory C (· ∈ C₀)),
        q' ≫ uliftFunctor.{u}.map (Subcomplex.ι _) = join.inr _ Δ[0] ≫ pbar) →
    C₀ = Set.univ

/-- *(added)* The square `U₁ ⟶ U₀ ⇉ U₋₁` of `N(Δ₊)^op` (the two faces `[0] ⇉ [1]` and the
augmentation), README L10 *Čech nerves* (HTT 6.1.2.11 (2)). -/
def cechSquare : Δ[1] ⊗ Δ[1] ⟶ nerveAugmentedOp.{u} := sorry

/-- *(added)* The vertex of `X_{/y}` given by an edge `f : x ⟶ y` (helper, through
`Δ[1] ≅ Δ[0] ⋆ Δ[0]`). -/
def Edge.toSliceVertex {X : SSet.{u}} {x y : X _⦋0⦌} (_f : Edge x y) :
    (slice (yonedaEquiv.symm y : Δ[0] ⟶ X)) _⦋0⦌ := sorry

/-- *(added)* Descent, condition (2) of HTT Theorem 6.1.0.6, README L10.1 *Giraud's theorem*
(`SSet.HasDescent`, `HTT.6.1.0.6/stmt`): X is presentable, and for every natural transformation
`ᾱ : p̄ ⟶ q̄` of small diagrams `K^▷ ⟶ X` with `q̄` a colimit diagram and `ᾱ|K` Cartesian, `p̄` is
a colimit diagram exactly when `ᾱ` is Cartesian. -/
def HasDescent (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  IsPresentable.{u + 1, u} X ∧
    ∀ (K : SSet.{u}) (α : rightCone (uliftFunctor.{u + 1}.obj K) ⊗ Δ[1] ⟶ X),
      IsColimitDiagram (ι₁ ≫ α) →
      IsCartesianTransformation ((join.inl _ Δ[0] ▷ Δ[1]) ≫ α) →
      (IsColimitDiagram (ι₀ ≫ α) ↔ IsCartesianTransformation α)

/-- *(added)* Giraud's axioms, condition (3) of HTT Theorem 6.1.0.6, README L10.1
(`SSet.SatisfiesGiraudAxioms`, `HTT.6.1.0.6/stmt`), in the form of the README *Lean:* line. -/
def SatisfiesGiraudAxioms (X : SSet.{u + 1}) [Quasicategory X] : Prop :=
  ∃ hX : IsPresentable.{u + 1, u} X, HasUniversalColimits X hX ∧ HasDisjointCoproducts X ∧
    ∀ U : nerveSimplexOp.{u + 1} ⟶ X, IsGroupoidObject U → IsEffectiveGroupoid U

end SSet

namespace SimplicialCategory

open _root_.SSet

/-- *(added)* The constant enriched diagram at `c` (helper for README L5.7, HTT 4.2.4.1). -/
def constDiagram (I : Type u) [Category.{u} I] [SimplicialCategory I] {C : Type u}
    [Category.{u} C] [SimplicialCategory C] (c : C) :
    HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C := sorry

/-- *(added)* A model of `holim_I Map_C(F −, D)`: the limit of an injectively fibrant replacement
of `Map_C(F −, D) : Iᵒᵖ ⟶ SSet` (HTT Remark A.3.3.13), chosen. -/
def holimModel {I C : Type u} [Category.{u} I] [SimplicialCategory I] [Category.{u} C]
    [SimplicialCategory C] (_F : HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C) (_D : C) :
    SSet.{u} := sorry

/-- *(added)* The homotopy-colimit comparison in `H` for a simplicial cocone `η : F ⟶ const c` and
an object `D`: `Map_C(c, D) ⟶ holim_I Map_C(F −, D)` (HTT Remark A.3.3.13), chosen. -/
def homotopyColimitComparison {I C : Type u} [Category.{u} I] [SimplicialCategory I]
    [Category.{u} C] [SimplicialCategory C] (F : HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C)
    {c : C} (_η : F ⟶ constDiagram I c) (D : C) :
    SSet.H.Q.obj (c ⟶[SSet.{u}] D) ⟶ SSet.H.Q.obj (holimModel F D) := sorry

/-- *(added)* Homotopy colimits in a simplicial category, README L5.7 (HTT Remark A.3.3.13, used by
HTT 4.2.4.1): `η` exhibits `c` as a homotopy colimit of F when every comparison
`Map_C(c, D) ⟶ holim Map_C(F −, D)` is an isomorphism in `H`. -/
def IsHomotopyColimit {I C : Type u} [Category.{u} I] [SimplicialCategory I] [Category.{u} C]
    [SimplicialCategory C] (F : HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C) {c : C}
    (η : F ⟶ constDiagram I c) : Prop :=
  ∀ D : C, IsIso (homotopyColimitComparison F η D)

/-- *(added)* The extension `N(I)^▷ ⟶ N(C)` of `N(F)` determined by a simplicial cocone
(HTT 4.2.4.1). -/
def nerveCocone {I C : Type u} [Category.{u} I] [SimplicialCategory I] [Category.{u} C]
    [SimplicialCategory C] (F : HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C) {c : C}
    (_η : F ⟶ constDiagram I c) :
    TauCetiRoadmap.HigherToposTheory.SSet.rightCone (SimplicialNerve I) ⟶ SimplicialNerve C :=
  sorry

end SimplicialCategory

namespace TauCeti.MarkedSSet

open _root_.SSet _root_.TauCeti.MarkedSSet TauCetiRoadmap.HigherToposTheory.TauCeti.MarkedSSet
  TauCetiRoadmap.HigherToposTheory.HomotopicalAlgebra

/-- *(added)* `(Set⁺_Δ)/S` with the Cartesian model structure, README L4.3 *The Cartesian model
structure* (`TauCeti.MarkedSSet.cartesianModelCategory`; HTT 3.1.3.7), on the type synonym the README
allows. -/
def Cartesian (S : SSet.{u}) : Type (u + 1) := Over S

instance (S : SSet.{u}) : Category (Cartesian S) := inferInstanceAs (Category (Over S))

/-- *(added)* The Cartesian model structure (README L4.3, HTT 3.1.3.7): cofibrations monomorphic
on underlying maps, weak equivalences the Cartesian equivalences. -/
instance cartesianModelCategory (S : SSet.{u}) : ModelCategory (Cartesian S) where
  categoryWithWeakEquivalences := ⟨fun _ _ f ↦ IsCartesianEquivalence (S := S) f⟩
  categoryWithCofibrations := ⟨cofibrationsOver S⟩
  categoryWithFibrations :=
    ⟨(cofibrationsOver S ⊓ fun _ _ f ↦ IsCartesianEquivalence (S := S) f).rlp⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- *(added)* The bridge `Over S ≌ Cartesian S` (identities), README Conventions *Model structures
on one category* and L4.3 (`TauCeti.MarkedSSet.Cartesian.equivalence`). -/
def Cartesian.equivalence (S : SSet.{u}) : Over S ≌ Cartesian S := CategoryTheory.Equivalence.refl

/-- *(added)* Transport lemma, README L4.3 (HTT 3.1.3.7). -/
theorem Cartesian.weakEquivalences_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.weakEquivalences (Cartesian S)).inverseImage (Cartesian.equivalence S).functor =
      fun _ _ f ↦ IsCartesianEquivalence (S := S) f := rfl

/-- *(added)* Transport lemma, README L4.3 (HTT 3.1.3.7). -/
theorem Cartesian.cofibrations_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.cofibrations (Cartesian S)).inverseImage (Cartesian.equivalence S).functor =
      cofibrationsOver S := rfl

/-- *(added)* Transport lemma, README L4.3 (HTT 3.1.3.7): fibrations by the right lifting
property against trivial cofibrations. -/
theorem Cartesian.fibrations_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.fibrations (Cartesian S)).inverseImage (Cartesian.equivalence S).functor =
      (cofibrationsOver S ⊓ fun _ _ f ↦ IsCartesianEquivalence (S := S) f).rlp := rfl

/-- The cofibrations of `(Set⁺_Δ)/S^♯` (helper for `SharpCartesian`, README L4.3, HTT 3.1.5.2):
maps monomorphic on underlying simplicial sets. -/
def SharpCartesian.cofibrationClass (S : SSet.{u}) :
    CategoryTheory.MorphismProperty (CategoryTheory.Over (sharp.obj S)) :=
  fun _ _ f ↦ Mono (forget.map f.left)

/-- The weak equivalences of `(Set⁺_Δ)/S^♯` (helper for `SharpCartesian`, README L4.3, HTT
3.1.5.2): the Cartesian equivalences over `S^♯`. -/
def SharpCartesian.weakEquivalenceClass (S : SSet.{u}) :
    CategoryTheory.MorphismProperty (CategoryTheory.Over (sharp.obj S)) := sorry

/-- `(Set⁺_Δ)/S^♯` with the structure of HTT 3.1.5.2, README L4.3 *The Cartesian model structure*
(`TauCeti.MarkedSSet.SharpCartesian`, propose; Conventions *Model structures on one category*): a
type synonym of `Over (sharp.obj S)`. -/
def SharpCartesian (S : SSet.{u}) : Type (u + 1) := CategoryTheory.Over (sharp.obj S)

instance (S : SSet.{u}) : Category (SharpCartesian S) := inferInstanceAs (Category (CategoryTheory.Over (sharp.obj S)))

/-- The model structure on `SharpCartesian S` (README L4.3, HTT 3.1.5.2). -/
instance (S : SSet.{u}) : ModelCategory (SharpCartesian S) where
  categoryWithWeakEquivalences := ⟨SharpCartesian.weakEquivalenceClass S⟩
  categoryWithCofibrations := ⟨SharpCartesian.cofibrationClass S⟩
  categoryWithFibrations :=
    ⟨(SharpCartesian.cofibrationClass S ⊓ SharpCartesian.weakEquivalenceClass S).rlp⟩
  cm1a := sorry
  cm1b := sorry
  cm2 := sorry
  cm3a := sorry
  cm3b := sorry
  cm3c := sorry
  cm4a := sorry
  cm4b := sorry
  cm5a := sorry
  cm5b := sorry

/-- The bridge `Over (sharp.obj S) ≌ SharpCartesian S` (identities), README L4.3
(`SharpCartesian.equivalence`). -/
def SharpCartesian.equivalence (S : SSet.{u}) : CategoryTheory.Over (sharp.obj S) ≌ SharpCartesian S :=
  CategoryTheory.Equivalence.refl

/-- Transport lemma, README L4.3 (`SharpCartesian.weakEquivalences_eq`). -/
theorem SharpCartesian.weakEquivalences_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.weakEquivalences (SharpCartesian S)).inverseImage
      (SharpCartesian.equivalence S).functor = SharpCartesian.weakEquivalenceClass S := rfl

/-- Transport lemma, README L4.3 (`SharpCartesian.cofibrations_eq`). -/
theorem SharpCartesian.cofibrations_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.cofibrations (SharpCartesian S)).inverseImage
      (SharpCartesian.equivalence S).functor = SharpCartesian.cofibrationClass S := rfl

/-- Transport lemma, README L4.3 (`SharpCartesian.fibrations_eq`). -/
theorem SharpCartesian.fibrations_eq (S : SSet.{u}) :
    (HomotopicalAlgebra.fibrations (SharpCartesian S)).inverseImage
      (SharpCartesian.equivalence S).functor =
      (SharpCartesian.cofibrationClass S ⊓ SharpCartesian.weakEquivalenceClass S).rlp := rfl

/-- *(added)* `Set⁺_Δ` with the Cartesian model structure over `Δ[0]`, transported along
`Set⁺_Δ ≌ (Set⁺_Δ)/(Δ[0])^♯` (README L4.3, L4.5; HTT 3.1.3.7, A.3.2.22), the target model
category of the projective structure in HTT 3.2.0.1. -/
instance modelCategory : ModelCategory MarkedSSet.{u} := sorry

/-- *(added)* `Set⁺_Δ` is combinatorial (README L4.3, HTT 3.1.3.7 over `Δ[0]`). -/
theorem isCombinatorial : IsCombinatorial.{u} MarkedSSet.{u} := by sorry

end TauCeti.MarkedSSet

namespace SSet

open _root_.SSet TauCetiRoadmap.HigherToposTheory.HomotopicalAlgebra

/-- *(added)* The shift `X⟦1⟧` of `hC` is `Σ X` (HA Notation 1.1.2.7), for stable C; links the
sorry-bodied `hoFunctor.hasShift` with `SSet.suspension`. -/
def hoFunctor.shiftOneIso (C : SSet.{u}) [Quasicategory C] [IsStable C] (X : hoFunctor.obj C) :
    X⟦(1 : ℤ)⟧ ≅ (hoFunctor.map (suspension C)).toFunctor.obj X := sorry

/-! ### Milestones -/

/-- Milestone *Kan–Quillen model structure, combinatorially*, README F2.4 *The Kan–Quillen model
structure* (`HTT.A.2.7/model-structure`; HTT §A.2.7). The model structure is the instance
`modelCategoryQuillen` (its fields are the proof obligations); its classes are the
monomorphisms, the Kan fibrations and the weak homotopy equivalences, the trivial cofibrations are
the anodyne extensions, and the trivial fibrations the maps with the right lifting property against
monomorphisms. -/
theorem modelCategoryQuillen_spec :
    cofibrations SSet.{u} = MorphismProperty.monomorphisms SSet.{u} ∧
      fibrations SSet.{u} = _root_.SSet.modelCategoryQuillen.J.rlp ∧
      weakEquivalences SSet.{u} = weakHomotopyEquivalences.{u} ∧
      trivialCofibrations SSet.{u} = _root_.SSet.anodyneExtensions.{u} ∧
      trivialFibrations SSet.{u} = (MorphismProperty.monomorphisms SSet.{u}).rlp := by sorry

end SSet

namespace EnrichedCat

open HomotopicalAlgebra

/-- Milestone *Bergner's model structure on simplicial categories*, README F3.4 *The model structure
on `Cat_S`* (`CategoryTheory.EnrichedCat.Bergner`; HTT Proposition A.3.2.4). For a combinatorial
monoidal model category S in which every object is cofibrant and weak equivalences are stable under
filtered colimits, the structure `Bergner.modelCategory` is left proper and combinatorial, its
cofibrations are the weakly saturated class generated by `C₀` for a small generating set of
cofibrations, and its weak equivalences are those of A.3.2.1. -/
theorem bergner_spec (S : Type u₁) [Category.{v₁} S] [MonoidalCategory S] [ModelCategory S]
    [MonoidalClosed S] [MonoidalClosed Sᴹᵒᵖ] [MonoidalModelCategory S] [IsCombinatorial.{v₁} S]
    [∀ X : S, IsCofibrant X] [(weakEquivalences S).IsStableUnderFilteredColimits.{v₁, v₁}] :
    IsLeftProper (Bergner S) ∧ IsCombinatorial.{v₁} (Bergner S) ∧
      (∃ I : CategoryTheory.MorphismProperty S, I.IsSmall.{v₁} ∧
        cofibrations S = MorphismProperty.weakSaturation.{v₁} I ∧
        (cofibrations (Bergner S)).inverseImage (Bergner.equivalence S).functor =
          MorphismProperty.weakSaturation.{v₁} (generatingCofibrations S I)) ∧
      ∀ ⦃C D : EnrichedCat.{v₁, u₁, v₁} S⦄ (F : C ⟶ D),
        WeakEquivalence ((Bergner.equivalence S).functor.map F) ↔
          EnrichedFunctor.IsWeakEquivalence (toFunctor S F) := by
  sorry

end EnrichedCat

namespace SSet

open _root_.SSet TauCetiRoadmap.HigherToposTheory.HomotopicalAlgebra

/-- Milestone *`C[N(C)] ⟶ C` is an equivalence for locally Kan C*, README L2.8 *The comparison
theorem* (HTT Theorem 2.2.0.1): for a locally Kan simplicial category C and objects x, y, the
counit `Map_{C[N C]}(x, y) ⟶ Map_C(x, y)` is a weak homotopy equivalence. -/
theorem simplicialNerveCounit_weakEquivalence (C : Type u) [Category.{u} C] [SimplicialCategory C]
    (_hC : HomotopicalAlgebra.EnrichedCategory.IsLocallyFibrant SSet.{u} C)
    (x y : Rigidification (SimplicialNerve C)) :
    WeakEquivalence ((simplicialNerveCounit C).map x y) := by sorry

/-- README L2.8 *The comparison theorem*, "Provide also" (HTT 2.2.0.1): a simplicial functor of
locally Kan simplicial categories is a Dwyer–Kan equivalence exactly when its simplicial nerve is
a categorical equivalence. -/
theorem isDwyerKanEquivalence_iff_isCategoricalEquivalence {C D : Type u} [Category.{u} C]
    [SimplicialCategory C] [Category.{u} D] [SimplicialCategory D]
    (_hC : HomotopicalAlgebra.EnrichedCategory.IsLocallyFibrant SSet.{u} C)
    (_hD : HomotopicalAlgebra.EnrichedCategory.IsLocallyFibrant SSet.{u} D)
    (F : EnrichedFunctor SSet.{u} C D) :
    CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence F ↔
      IsCategoricalEquivalence (simplicialNerve.map F) := by sorry

/-- Milestone *Joyal model structure, Quillen equivalent to Bergner's*, README L3.8 *The Joyal model
structure* (HTT Theorem 2.2.5.1, with `HTT.2.2.5.1/C` and `HTT.2.2.5.1/Q`). The structure is the
instance on `SSet.Joyal` (cofibrations the monomorphisms, weak equivalences the categorical
equivalences, fibrations the categorical fibrations); it is left proper and combinatorial, and
`(C[−], N)` is a Quillen equivalence with Bergner's structure on `Cat_Δ`. -/
theorem joyal_spec :
    IsLeftProper Joyal.{u} ∧ IsCombinatorial.{u} Joyal.{u} ∧
      (∀ ⦃X Y : SSet.{u}⦄ (f : X ⟶ Y), Cofibration (Joyal.equivalence.functor.map f) ↔ Mono f) ∧
      (∀ ⦃X Y : SSet.{u}⦄ (f : X ⟶ Y),
        WeakEquivalence (Joyal.equivalence.functor.map f) ↔ IsCategoricalEquivalence f) ∧
      (∀ ⦃X Y : SSet.{u}⦄ (f : X ⟶ Y),
        Fibration (Joyal.equivalence.functor.map f) ↔ CategoricalFibration f) ∧
      haveI := modelCategoryQuillen_isCombinatorial.{u}
      haveI := modelCategoryQuillen_isMonoidal.{u}
      haveI := modelCategoryQuillen_isCofibrant.{u}
      haveI := modelCategoryQuillen_isStableUnderFilteredColimits.{u}
      Adjunction.IsQuillenEquivalence rigidificationAdjunction.{u} := by sorry

/-- README L2.6 `HTT.2.2.5.1/C` (first step of HTT 2.2.5.1): `C[−]` carries monomorphisms to
cofibrations of Bergner's structure. Stated with the milestone 2.2.5.1. -/
theorem rigidificationFunctor_cofibration ⦃A B : SSet.{u}⦄ (i : A ⟶ B) [Mono i] :
    haveI := modelCategoryQuillen_isCombinatorial.{u}
    haveI := modelCategoryQuillen_isMonoidal.{u}
    haveI := modelCategoryQuillen_isCofibrant.{u}
    haveI := modelCategoryQuillen_isStableUnderFilteredColimits.{u}
    Cofibration (rigidificationFunctor.map (Joyal.equivalence.functor.map i)) := by sorry

/-- Milestone *The fibrant objects of the Joyal structure are the ∞-categories*, README L3.8
*Fibrant objects of the Joyal model structure* (HTT Theorem 2.4.6.1). -/
theorem joyal_isFibrant_iff (X : SSet.{u}) :
    IsFibrant (Joyal.equivalence.functor.obj X) ↔ Quasicategory X := by
  sorry

end SSet

namespace SSet

open _root_.SSet _root_.TauCeti _root_.TauCeti.MarkedSSet
  TauCetiRoadmap.HigherToposTheory.TauCeti.MarkedSSet
  TauCetiRoadmap.HigherToposTheory.HomotopicalAlgebra

attribute [local instance] TauCeti.MarkedSSet.isCombinatorial

/-- *(added)* `St⁺_φ` between the model-category synonyms, conjugated by the bridges (helper for
HTT 3.2.0.1; README Conventions *Model structures on one category*). -/
def markedStraightening' {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    TauCeti.MarkedSSet.Cartesian S ⥤
      HomotopicalAlgebra.EnrichedDiagram.Projective SSet.{u} C MarkedSSet.{u} :=
  (TauCeti.MarkedSSet.Cartesian.equivalence S).inverse ⋙ markedStraightening φ ⋙
    (HomotopicalAlgebra.EnrichedDiagram.Projective.equivalence SSet.{u} C MarkedSSet.{u}).functor

/-- *(added)* `Un⁺_φ` between the model-category synonyms, conjugated by the bridges (helper for
HTT 3.2.0.1). -/
def markedUnstraightening' {S : SSet.{u}} {C : Type u} [Category.{u} C] [SimplicialCategory C]
    (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    HomotopicalAlgebra.EnrichedDiagram.Projective SSet.{u} C MarkedSSet.{u} ⥤
      TauCeti.MarkedSSet.Cartesian S :=
  (HomotopicalAlgebra.EnrichedDiagram.Projective.equivalence SSet.{u} C MarkedSSet.{u}).inverse ⋙
    markedUnstraightening φ ⋙ (TauCeti.MarkedSSet.Cartesian.equivalence S).functor

/-- *(added)* `St⁺_φ ⊣ Un⁺_φ` between the model-category synonyms, the conjugate of
`markedStraighteningAdjunction φ` by the bridges (helper for HTT 3.2.0.1). -/
def markedStraighteningAdjunction' {S : SSet.{u}} {C : Type u} [Category.{u} C]
    [SimplicialCategory C] (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    markedStraightening' φ ⊣ markedUnstraightening' φ :=
  (TauCeti.MarkedSSet.Cartesian.equivalence S).symm.toAdjunction.comp
    ((markedStraighteningAdjunction φ).comp
      (HomotopicalAlgebra.EnrichedDiagram.Projective.equivalence SSet.{u} C
        MarkedSSet.{u}).toAdjunction)

/-- Milestone *Straightening and unstraightening*, README L4.5 *The straightening theorem* (HTT
Theorem 3.2.0.1). For a simplicial set S, a simplicial category C and `φ : C[S] ⟶ Cᵒᵖ`:
(1) `(St⁺_φ, Un⁺_φ)` is a Quillen adjunction between `(Set⁺_Δ)/S` with the Cartesian structure and
`(Set⁺_Δ)^C` with the projective structure; (2) if φ is a Dwyer–Kan equivalence, it is a Quillen
equivalence. -/
theorem markedStraightening_spec {S : SSet.{u}} {C : Type u} [Category.{u} C]
    [SimplicialCategory C] (φ : EnrichedFunctor SSet.{u} (Rigidification S) Cᵒᵖ) :
    Adjunction.IsQuillen (markedStraighteningAdjunction' φ) ∧
      (CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence φ →
        Adjunction.IsQuillenEquivalence (markedStraighteningAdjunction' φ)) := by sorry

/-- Milestone *Homotopy limits in simplicial categories are ∞-categorical limits*, README L5.7
*Homotopy colimits are ∞-categorical colimits* (HTT Theorem 4.2.4.1): for locally Kan simplicial
categories I and C, a simplicial functor `F : I ⥤ C` and a compatible family `η` of maps to `c`,
`η` exhibits `c` as a homotopy colimit of F (HTT Remark A.3.3.13) exactly when the extension
`N(I)^▷ ⟶ N(C)` of `N(F)` determined by `η` is a colimit diagram. -/
theorem simplicialCategory_isHomotopyColimit_iff {I C : Type u} [Category.{u} I]
    [SimplicialCategory I] [Category.{u} C] [SimplicialCategory C]
    (_hI : HomotopicalAlgebra.EnrichedCategory.IsLocallyFibrant SSet.{u} I)
    (_hC : HomotopicalAlgebra.EnrichedCategory.IsLocallyFibrant SSet.{u} C)
    (F : HomotopicalAlgebra.EnrichedDiagram SSet.{u} I C) {c : C}
    (η : F ⟶ SimplicialCategory.constDiagram I c) :
    SimplicialCategory.IsHomotopyColimit F η ↔
      IsColimitDiagram (SimplicialCategory.nerveCocone F η) := by sorry

/-- Milestone *Quillen's Theorem A for ∞-categories (Joyal)*, README L5.4 *Theorem A*
(`SSet.isCofinal_iff_isWeaklyContractible`; HTT Theorem 4.1.3.1, Kerodon 7.2.3.1; Conventions row
*cofinal*): for `f : C ⟶ D` with D an ∞-category, f is cofinal exactly when every
`C ×_D D_{d/}` is weakly contractible. -/
theorem isCofinal_iff_isWeaklyContractible {C D : SSet.{u}} [Quasicategory D] (f : C ⟶ D) :
    IsCofinal f ↔ ∀ d : D _⦋0⦌,
      IsWeaklyContractible (Limits.pullback f (coslice.π (yonedaEquiv.symm d : Δ[0] ⟶ D))) := by
  sorry

/-- Milestone *Presheaves are the free cocompletion*, README L6 *`P(S)` is the free cocompletion*
(HTT Theorem 5.1.5.6): for a small simplicial set S and an ∞-category C with small colimits,
restriction along `j : S ⟶ P(S)` is a categorical equivalence `Fun^L(P(S), C) ⟶ Fun(S, C)`. -/
theorem funColim_restrict_isCategoricalEquivalence (S : SSet.{u}) (C : SSet.{u + 1})
    [Quasicategory C] (_hC : HasSmallColimits.{u + 1, u} C) :
    IsCategoricalEquivalence
      ((funColim.{u + 1, u} (presheaf S) C).ι ≫ (MonoidalClosed.pre (yoneda S)).app C) := by sorry

/-- The full subcategory `C^κ` of κ-compact objects (helper for the presentability milestones). -/
abbrev compactObjects (C : SSet.{v}) [Quasicategory C] (κ : Cardinal.{u}) [Fact κ.IsRegular]
    (hC : HasCardinalFilteredColimits.{u, v, u} C κ) : SSet.{v} :=
  (fullEnhancedSubcategory C fun X ↦ IsCardinalPresentable X κ hC : SSet)

/-- Milestone *Characterizations of presentable ∞-categories (Simpson)*, README L7 *Simpson's
theorem* (HTT Theorem 5.5.1.1), for a large ∞-category C (`SSet.{u + 1}`, small meaning `u`):
the six conditions are equivalent. In (2) the κ-compact objects are taken for every κ at which C
has κ-filtered colimits. -/
theorem isPresentable_tfae (C : SSet.{u + 1}) [Quasicategory C] :
    List.TFAE [
      IsPresentable.{u + 1, u} C,
      IsAccessible.{u + 1, u} C ∧ ∀ (κ : Cardinal.{u}) [Fact κ.IsRegular]
        (hC : HasCardinalFilteredColimits.{u, u + 1, u} C κ),
          HasColimitsOfSize κ (compactObjects C κ hC),
      ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular) (hC : HasCardinalFilteredColimits.{u, u + 1, u} C κ),
        IsCardinalAccessible C κ ∧ HasColimitsOfSize κ (compactObjects C κ hC),
      ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular) (D : SSet.{u}) (_ : Quasicategory D),
        HasColimitsOfSize κ D ∧ ∃ f : ind κ D ⟶ C, IsCategoricalEquivalence f,
      ∃ (D : SSet.{u}) (_ : Quasicategory D) (L : presheaf D ⟶ C) (g : C ⟶ presheaf D),
        IsAdjunction L g ∧ IsFullyFaithful g ∧ IsAccessibleFunctor.{u + 1, u} (L ≫ g),
      ∃ hC : HasSmallColimits.{u + 1, u} C, IsLocallySmall.{u} C ∧
        ∃ (κ : Cardinal.{u}) (_ : Fact κ.IsRegular) (ι : Type u) (a : ι → C _⦋0⦌),
          (∀ i, IsCardinalPresentable (a i) κ (hC.hasCardinalFilteredColimits κ)) ∧
          ∀ X : C _⦋0⦌, ∃ (K : SSet.{u}) (pbar : rightCone (uliftFunctor.{u + 1}.obj K) ⟶
              uliftFunctor.{u}.obj C),
            IsColimitDiagram pbar ∧
            (∃ q : uliftFunctor.{u + 1}.obj K ⟶
                uliftFunctor.{u}.obj (fullEnhancedSubcategory C (· ∈ Set.range a)),
              q ≫ uliftFunctor.{u}.map (Subcomplex.ι _) = join.inl _ Δ[0] ≫ pbar) ∧
            yonedaEquiv (join.inr _ Δ[0] ≫ pbar) = ⟨X⟩] := by
  sorry

/-- Milestone *Localizations of presentable ∞-categories*, README L7 *Localization at a small set*
(HTT Proposition 5.5.4.15): for presentable C, a small set S of morphisms (indexed by `ι : Type u`)
and its strongly saturated closure S̄, with `C'` the S-local objects: every object has a map in S̄ to
an S-local object; `C'` is presentable; the inclusion has a left adjoint L; and for a morphism f,
being an S-equivalence, lying in S̄, and `L f` being an equivalence are equivalent. -/
theorem localization_presentable (C : SSet.{v}) [Quasicategory C] (_hC : IsPresentable.{v, u} C)
    {ι : Type u} (a b : ι → C _⦋0⦌) (e : ∀ i, Edge (a i) (b i)) :
    let S : EdgeClass C := fun x y f ↦ ∃ i, (⟨a i, b i, e i⟩ : Σ x y, Edge x y) = ⟨x, y, f⟩
    (∀ X : C _⦋0⦌, ∃ (Y : C _⦋0⦌) (f : Edge X Y),
      stronglySaturatedClosure.{v, u} S f ∧ IsLocalObject S Y) ∧
    IsPresentable.{v, u} (fullEnhancedSubcategory C (IsLocalObject S) : SSet.{v}) ∧
    ∃ L : (⟨C, inferInstance⟩ : SSet.QCat.{v}) ⟶
        ⟨fullEnhancedSubcategory C (IsLocalObject S), inferInstance⟩,
      Nonempty (Bicategory.Adjunction L (QCat.homMk (Subcomplex.ι _))) ∧
      ∀ ⦃x y : C _⦋0⦌⦄ (f : Edge x y), List.TFAE [IsLocalEquivalence S f,
        stronglySaturatedClosure.{v, u} S f, Edge.IsEquivalence (f.map L.hom)] := by sorry

/-- Milestone *Adjoint functor theorem*, README L7 *The adjoint functor theorem* (HTT Corollary
5.5.2.9): for F between presentable ∞-categories, F has a right adjoint exactly when it preserves
small colimits, and a left adjoint exactly when it is accessible and preserves small limits. -/
theorem adjoint_functor_theorem {C D : SSet.{v}} [Quasicategory C] [Quasicategory D]
    (_hC : IsPresentable.{v, u} C) (_hD : IsPresentable.{v, u} D) (F : C ⟶ D) :
    ((∃ G : D ⟶ C, IsAdjunction F G) ↔ PreservesSmallColimits.{v, u} F) ∧
      ((∃ G : D ⟶ C, IsAdjunction G F) ↔
        IsAccessibleFunctor.{v, u} F ∧ PreservesSmallLimits.{v, u} F) := by sorry

/-- README L7 *The adjoint functor theorem* (HTT Remark 5.5.2.10): the first statement of 5.5.2.9
needs only that D be locally small. -/
theorem exists_rightAdjoint_iff {C D : SSet.{v}} [Quasicategory C] [Quasicategory D]
    (_hC : IsPresentable.{v, u} C) [IsLocallySmall.{u} D] (F : C ⟶ D) :
    (∃ G : D ⟶ C, IsAdjunction F G) ↔ PreservesSmallColimits.{v, u} F := by sorry

open Pretriangulated in
/-- Milestone *The homotopy category of a stable ∞-category is triangulated*, README L9.1 *The
homotopy category is triangulated* (HA Theorem 1.1.2.14), in the stable case: `hC`, with the
translation Σ (HA 1.1.2.7) and the distinguished triangles of HA 1.1.2.11, is a triangulated
category. The README's hypotheses (pointed, cofibres, Σ an equivalence) are weakened to
`[IsStable C]`, the hypothesis of the file's shift and preadditive instances. -/
theorem hoFunctor_isTriangulated (C : SSet.{u}) [Quasicategory C] [IsStable C] :
    ∃ (_ : HasZeroObject (hoFunctor.obj C))
      (_ : ∀ n : ℤ, (shiftFunctor (hoFunctor.obj C) n).Additive)
      (_ : Pretriangulated (hoFunctor.obj C)),
      IsTriangulated (hoFunctor.obj C) ∧
        ∀ T : Pretriangulated.Triangle (hoFunctor.obj C), T ∈ distTriang (hoFunctor.obj C) ↔
          ∃ (X Y Z : C _⦋0⦌) (f : (show hoFunctor.obj C from HomotopyCategory.mk X) ⟶
              HomotopyCategory.mk Y)
            (g : (show hoFunctor.obj C from HomotopyCategory.mk Y) ⟶ HomotopyCategory.mk Z)
            (h : (show hoFunctor.obj C from HomotopyCategory.mk Z) ⟶
              (hoFunctor.map (suspension C)).toFunctor.obj (HomotopyCategory.mk X)),
            IsDistinguishedTriangle f g h ∧
              Nonempty (T ≅ Pretriangulated.Triangle.mk f g
                (h ≫ (hoFunctor.shiftOneIso C (HomotopyCategory.mk X)).inv)) := by sorry

/-- Milestone *Giraud's theorem for ∞-topoi*, README L10.1 *Giraud's theorem* (HTT Theorem 6.1.0.6,
parts `1⇒2`, `2⇒3`, `3⇒1`): for an ∞-category X, being an ∞-topos, satisfying descent, and
satisfying the ∞-categorical Giraud axioms are equivalent. -/
theorem isInftyTopos_iff (X : SSet.{u + 1}) [Quasicategory X] :
    (IsInftyTopos X ↔ HasDescent X) ∧ (IsInftyTopos X ↔ SatisfiesGiraudAxioms X) := by sorry

/-- Milestone *Proper base change*, README L12.3 *Proper maps of spaces and the proper base change
theorem* (HTT Theorem 7.3.1.16): for a proper map `p : X ⟶ Y` with X completely regular,
`p_* : Shv(X) ⟶ Shv(Y)` is a proper geometric morphism. -/
theorem isProperGeometricMorphism_sheafOnSpace_map {X Y : TopCat.{u}} (p : X ⟶ Y)
    (_hp : IsProperMap p) [T35Space X] :
    ∃ hp : IsGeometricMorphism (sheafOnSpace.map p),
      IsProperGeometricMorphism (sheafOnSpace.map p) hp := by sorry

/-! ### Characterizations of the Conventions table -/

/-- Conventions row *categorical equivalence*; README L3.2 *Joyal's weak categorical equivalences*
(HTT Proposition 2.2.5.8): f is a categorical equivalence exactly when `hFun(B, C) ⟶ hFun(A, C)`
is an equivalence for every ∞-category C in the universe of A and B. -/
theorem isCategoricalEquivalence_iff_hoFun {A B : SSet.{u}} (f : A ⟶ B) :
    IsCategoricalEquivalence f ↔ ∀ (C : SSet.{u}) [Quasicategory C],
      (hoFunctor.map ((MonoidalClosed.pre f).app C)).toFunctor.IsEquivalence := by sorry

/-- Conventions row *categorical equivalence* (Kerodon 4.5.1.10): a map of ∞-categories is a
categorical equivalence exactly when it is an equivalence in `SSet.QCat.bicategory`, i.e. has a
homotopy inverse up to natural isomorphism. -/
theorem isCategoricalEquivalence_iff_qcat {S T : SSet.{u}} [Quasicategory S] [Quasicategory T]
    (f : S ⟶ T) :
    IsCategoricalEquivalence f ↔ ∃ g : T ⟶ S,
      Nonempty (𝟙 _ ≅ QCat.homMk f ≫ QCat.homMk g) ∧
        Nonempty (QCat.homMk g ≫ QCat.homMk f ≅ 𝟙 _) := by sorry

/-- Conventions row *categorical equivalence*; README L1.5 *Fully faithful and essentially
surjective maps* (HTT 1.2.10.1, Kerodon 4.8.4.1): categorical equivalence is fully faithful plus
essentially surjective. -/
theorem isCategoricalEquivalence_iff_fullyFaithful_essSurj {S T : SSet.{u}} (f : S ⟶ T) :
    IsCategoricalEquivalence f ↔ IsFullyFaithful f ∧ IsEssentiallySurjective f := by sorry

/-- Conventions row *weak homotopy equivalence*; README F2.4 *Weak homotopy equivalences*
(`HTT.A.2.7/weak-equivalences`, Kerodon 3.3.7): f is a weak homotopy equivalence exactly when
`Ex^∞ f` is a homotopy equivalence. (The realization form is not stated.) -/
theorem weakHomotopyEquivalences_iff_exInfty {X Y : SSet.{u}} (f : X ⟶ Y) :
    weakHomotopyEquivalences f ↔ IsHomotopyEquivalence (exInfty.map f) := by sorry

/-- Conventions row *morphism space*; README L1.5 *Morphism spaces* (characterizations) and L5.5
*Fibres of fat slices* (HTT Corollary 4.2.1.8): for an ∞-category, the pinch inclusions
`Hom^R_C(x, y) ⟶ Hom_C(x, y) ⟵ Hom^L_C(x, y)` are homotopy equivalences. -/
theorem morphismSpace_pinch_isHomotopyEquivalence (C : SSet.{u}) [Quasicategory C]
    (x y : C _⦋0⦌) :
    IsHomotopyEquivalence (rightMappingSpace.toMorphismSpace C x y) ∧
      IsHomotopyEquivalence (leftMappingSpace.toMorphismSpace C x y) := by sorry

/-- Conventions row *morphism space*; README L2.8 *The mapping-space comparison* (HTT Proposition
2.2.4.1): for an ∞-category S, `|Hom^R_S(x, y)|_Q ⟶ Map_{C[S]}(x, y)` is an isomorphism in `H`. -/
theorem rightMappingSpace_toMapH_isIso (S : SSet.{u}) [Quasicategory S] (x y : S _⦋0⦌) :
    IsIso (rightMappingSpace.toMapH S x y) := by sorry

/-- Conventions row *fully faithful*; README L1.5 (characterizations, through HTT 2.2.4.1): for
∞-categories, f is fully faithful exactly when every `Hom^R_X(x, y) ⟶ Hom^R_Y(f x, f y)` is a
homotopy equivalence. -/
theorem isFullyFaithful_iff_rightMappingSpace {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y]
    (f : X ⟶ Y) :
    IsFullyFaithful f ↔ ∀ x y : X _⦋0⦌, IsHomotopyEquivalence (rightMappingSpace.map f x y) := by
  sorry

/-- Conventions row *fully faithful*; README L5.5 *Fully faithful maps through `Hom_C`* (Kerodon
4.8.3.1): for ∞-categories, f is fully faithful exactly when every `Hom_X(x, y) ⟶ Hom_Y(f x, f y)`
is a homotopy equivalence. -/
theorem isFullyFaithful_iff_morphismSpace {X Y : SSet.{u}} [Quasicategory X] [Quasicategory Y]
    (f : X ⟶ Y) :
    IsFullyFaithful f ↔ ∀ x y : X _⦋0⦌, IsHomotopyEquivalence (morphismSpace.map f x y) := by
  sorry

/-- Conventions row *final object*; README L2.5 *Strongly final objects through morphism spaces*
(HTT Proposition 1.2.12.4): in an ∞-category, X is final exactly when every `Hom^R_C(Y, X)` is
contractible. -/
theorem isTerminalVertex_iff_rightMappingSpace {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌) :
    IsTerminalVertex X ↔ ∀ Y : C _⦋0⦌, IsWeaklyContractible (rightMappingSpace C Y X : SSet.{u}) := by
  sorry

/-- Conventions row *final object* (Kerodon 4.7.3.1): in an ∞-category, X is final exactly when every
`Hom_C(Y, X)` is contractible. -/
theorem isTerminalVertex_iff_morphismSpace {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌) :
    IsTerminalVertex X ↔ ∀ Y : C _⦋0⦌, IsWeaklyContractible (morphismSpace C Y X : SSet.{u}) := by
  sorry

/-- Conventions row *final object*; README L2.5 *Strongly final and H-final* (HTT Definition
1.2.12.1, Corollary 1.2.12.5): a strongly final vertex is final in `hC`, for any simplicial set. -/
theorem IsTerminalVertex.isHoFinal {C : SSet.{u}} {X : C _⦋0⦌} (_hX : IsTerminalVertex X) :
    IsHoFinal X := by sorry

/-- Conventions row *final object*; README L2.5 (HTT 1.2.12.5): in an ∞-category, a vertex final in
`hC` is strongly final. -/
theorem isTerminalVertex_iff_isHoFinal {C : SSet.{u}} [Quasicategory C] (X : C _⦋0⦌) :
    IsTerminalVertex X ↔ IsHoFinal X := by sorry

/-- Conventions row *limit, colimit* (Kerodon 7.1.1.1, dualized): in an ∞-category, a cocone
`p̄ : K^▷ ⟶ C` with cone point c is a colimit diagram exactly when, for every object y,
`Hom_C(c, y) ⟶ Hom_{Fun(K, C)}(p, const_y)` is a homotopy equivalence. -/
theorem isColimitDiagram_iff_morphismSpace {K C : SSet.{u}} [Quasicategory C]
    (pbar : rightCone K ⟶ C) :
    IsColimitDiagram pbar ↔ ∀ y : C _⦋0⦌, IsHomotopyEquivalence (coconeMorphismSpaceMap pbar y) := by
  sorry

/-- Conventions row *p-Cartesian edge*; README L3.5 *Cartesian edges by horn lifting*
(`SSet.Edge.isCartesian_iff_lift`; HTT Remark 2.4.1.4, Kerodon 5.1.1.1): for an inner fibration p,
an edge f is p-Cartesian exactly when every square from `Λ[n, n]` over `Δ[n]`, `n ≥ 2`, whose horn
sends `Δ^{n−1,n}` to f, has a filler. -/
theorem Edge.isCartesian_iff_lift {X S : SSet.{u}} (p : X ⟶ S) [InnerFibration p]
    {x y : X _⦋0⦌} (f : Edge x y) :
    SSet.Edge.IsCartesian f p ↔
      ∀ (n : ℕ) (σ₀ : (Λ[n + 2, Fin.last (n + 2)] : SSet.{u}) ⟶ X) (τ : Δ[n + 2] ⟶ S),
        σ₀ ≫ p = Λ[n + 2, Fin.last (n + 2)].ι ≫ τ →
        σ₀.app _ (horn.edge (n + 2) (Fin.last (n + 2)) (Fin.last (n + 1)).castSucc
          (Fin.last (n + 2)) (Fin.castSucc_lt_last _).le (by simp)) = f.edge →
        ∃ σ : Δ[n + 2] ⟶ X, Λ[n + 2, Fin.last (n + 2)].ι ≫ σ = σ₀ ∧ σ ≫ p = τ := by sorry

/-- Conventions row *categorical fibration*; README L3.8 *Categorical fibrations over an
∞-category* (HTT Corollary 2.4.6.5, Kerodon 4.5.6.1): for `p : C ⟶ D` with D an ∞-category, p is a
categorical fibration exactly when it is an inner fibration lifting equivalences out of `p c`. -/
theorem categoricalFibration_iff {C D : SSet.{u}} [Quasicategory D] (p : C ⟶ D) :
    CategoricalFibration p ↔ InnerFibration p ∧
      ∀ (c : C _⦋0⦌) {d' : D _⦋0⦌} (f : Edge (p.app _ c) d'), Edge.IsEquivalence f →
        ∃ (c' : C _⦋0⦌) (f' : Edge c c'), Edge.IsEquivalence f' ∧ (f'.map p).edge = f.edge := by
  sorry

/-- Conventions row *adjunction*; README L6 *HTT's adjunctions* (HTT Definition 5.2.2.1): for
∞-categories, `f ⊣ g` exactly when there is a bifibration over `Δ[1]` to which f and g are
associated. -/
theorem isAdjunction_iff_isCorrespondenceAdjunction {C D : SSet.{u}} [Quasicategory C]
    [Quasicategory D] (f : C ⟶ D) (g : D ⟶ C) :
    IsAdjunction f g ↔ IsCorrespondenceAdjunction f g := by sorry

/-- Conventions row *adjunction*; README L6 *Unit transformations characterize adjoints* (HTT
Proposition 5.2.2.8): `f ⊣ g` exactly when there is a unit transformation `id_C ⟶ g ∘ f`. -/
theorem isAdjunction_iff_exists_isUnitTransformation {C D : SSet.{u}} [Quasicategory C]
    [Quasicategory D] (f : C ⟶ D) (g : D ⟶ C) :
    IsAdjunction f g ↔ ∃ u : Edge (ihomVertexEquiv.symm (𝟙 C)) (ihomVertexEquiv.symm (f ≫ g)),
      IsUnitTransformation u := by sorry

/-- Conventions row *Kan extension*; README L5.9 *Kan extensions along arbitrary maps* (HTT
Definition 4.3.3.2): the pointwise condition agrees with HTT's through the mapping cylinder, for the
map `M^op(δ) ⟶ D` corresponding to `(f', α)`. -/
theorem isLeftKanExtensionAlong_iff_cyl {K K' D : SSet.{u}} [Quasicategory D] (δ : K ⟶ K')
    {f : K ⟶ D} (E : LeftExtension δ f) :
    IsLeftKanExtensionAlong δ E.α ↔
      IsLeftKanExtensionCyl δ (LeftExtension.equivCylinder δ f E).1 := by sorry

/-- Conventions row *Kan extension*; the universal property (Kerodon §7.3.6): `α : f ⟶ δ ≫ f'`
exhibits f' as a left Kan extension exactly when, for every `g : K' ⟶ D`,
`Hom(f', g) ⟶ Hom(f, δ ≫ g)` is a homotopy equivalence. Kerodon states this when the pointwise
extensions exist; the README gives no hypothesis. -/
theorem isLeftKanExtensionAlong_iff_universal {K K' D : SSet.{u}} [Quasicategory D] (δ : K ⟶ K')
    {f : K ⟶ D} {f' : K' ⟶ D} (α : Edge (ihomVertexEquiv.symm f) (ihomVertexEquiv.symm (δ ≫ f'))) :
    IsLeftKanExtensionAlong δ α ↔
      ∀ g : K' ⟶ D, IsHomotopyEquivalence (kanExtensionPrecompMap δ α g) := by sorry

/-- Conventions row *reflective localization*; README L6 *Reflective localizations are
localizations* (HTT Proposition 5.2.7.12): a reflective localization is a localization at the
morphisms it inverts. -/
theorem IsReflectiveLocalization.isLocalization {C D : SSet.{u}} [Quasicategory C] [Quasicategory D]
    (f : C ⟶ D) (_hf : IsReflectiveLocalization (QCat.homMk f)) :
    IsLocalization.{w} f fun _ _ e ↦ Edge.IsEquivalence (e.map f) := by sorry

/-- Conventions row *weakly contractible*: K is weakly contractible exactly when, for every Kan
complex Z, the constant map `Z ⟶ Fun(K, Z)` is a homotopy equivalence. -/
theorem isWeaklyContractible_iff_kan (K : SSet.{u}) :
    IsWeaklyContractible K ↔ ∀ (Z : SSet.{u}) [KanComplex Z],
      IsHomotopyEquivalence (MonoidalClosed.curry (snd K Z)) := by sorry

/-- Conventions row *weakly contractible*: K is weakly contractible exactly when, for every
∞-category Z, the constant map `Z ⟶ Fun(K, Z)` is a categorical equivalence. -/
theorem isWeaklyContractible_iff_quasicategory (K : SSet.{u}) :
    IsWeaklyContractible K ↔ ∀ (Z : SSet.{u}) [Quasicategory Z],
      IsCategoricalEquivalence (MonoidalClosed.curry (snd K Z)) := by sorry

/-- Conventions row *Ind-completion*; the universal property (Kerodon Definition 9.3.1.1, here in the
κ-form of HTT 5.3.5.10): `Ind_κ(C)` has small κ-filtered colimits, and for every ∞-category D with
small κ-filtered colimits, restriction along `j : C ⟶ Ind_κ(C)` is a categorical equivalence from the
κ-continuous functors to `Fun(C, D)`. -/
theorem ind_universal (κ : Cardinal.{u}) [Fact κ.IsRegular] (C : SSet.{u}) [Quasicategory C] :
    ∃ hI : HasCardinalFilteredColimits.{u, u + 1, u} (ind κ C) κ,
      ∀ (D : SSet.{u + 1}) [Quasicategory D], HasCardinalFilteredColimits.{u, u + 1, u} D κ →
        IsCategoricalEquivalence ((funCardinalContinuous (ind κ C) D κ hI).ι ≫
          (MonoidalClosed.pre (ind.yoneda κ C)).app D) := by sorry

/-- Conventions row *essentially κ-small*; README L7 *Essentially κ-small ∞-categories*, condition
(1) of HTT 5.4.1.2 (Kerodon 4.9.7.7): fewer than κ equivalence classes of objects and κ-small
homotopy groups of every `Hom^R_C(X, Y)`. κ uncountable regular. -/
theorem isEssentiallyCardinalSmall_iff_homotopy (C : SSet.{u}) [Quasicategory C]
    (κ : Cardinal.{u}) [Fact κ.IsRegular] (_hκ : ℵ₀ < κ) :
    IsEssentiallyCardinalSmall C κ ↔
      HasCardinalLT (_root_.SSet.π₀ (core C : SSet.{u})) κ ∧
        ∀ (X Y : C _⦋0⦌) (f : (rightMappingSpace C X Y : SSet.{u}) _⦋0⦌) (i : ℕ),
          HasCardinalLT (SSet.KanComplex.π i (rightMappingSpace C X Y : SSet.{u}) f) κ := by
  sorry

/-- README L7, condition (2) of HTT 5.4.1.2: a minimal model of C is κ-small. -/
theorem isEssentiallyCardinalSmall_iff_minimal (C : SSet.{u}) [Quasicategory C]
    (κ : Cardinal.{u}) [Fact κ.IsRegular] (_hκ : ℵ₀ < κ) :
    IsEssentiallyCardinalSmall C κ ↔
      ∃ (D : SSet.{u}) (_ : Quasicategory D) (i : D ⟶ C), Mono i ∧ IsCategoricalEquivalence i ∧
        Quasicategory.IsMinimal D ∧ HasCardinalLT D.N κ := by sorry

/-- README L7, condition (4) of HTT 5.4.1.2: some κ-small simplicial set admits a categorical
equivalence to C. -/
theorem isEssentiallyCardinalSmall_iff_sSet (C : SSet.{u}) [Quasicategory C]
    (κ : Cardinal.{u}) [Fact κ.IsRegular] (_hκ : ℵ₀ < κ) :
    IsEssentiallyCardinalSmall C κ ↔
      ∃ (K : SSet.{u}) (f : K ⟶ C), HasCardinalLT K.N κ ∧ IsCategoricalEquivalence f := by sorry

/-- README L7, condition (5) of HTT 5.4.1.2 (Kerodon 9.2.7.14): C is κ-compact in `Cat∞`. -/
theorem isEssentiallyCardinalSmall_iff_compact (C : SSet.{u}) [Quasicategory C]
    (κ : Cardinal.{u}) [Fact κ.IsRegular] (_hκ : ℵ₀ < κ) :
    IsEssentiallyCardinalSmall C κ ↔
      ∃ hC : HasCardinalFilteredColimits.{u, u + 1, u} SSet.catInfty.{u} κ,
        IsCardinalPresentable (catInfty.vertexOf C) κ hC := by sorry

/-- Conventions row *locally small* (Kerodon §4.9.7, through HTT 4.2.1.8): an ∞-category is locally
small exactly when every `Hom_C(X, Y)` has a small Kan model. -/
theorem isLocallySmall_iff_morphismSpace (C : SSet.{v}) [Quasicategory C] :
    IsLocallySmall.{u} C ↔ ∀ x y : C _⦋0⦌,
      TauCeti.HasSmallSpaceModel.{u} (morphismSpace C x y : SSet.{v}) := by sorry

/-- Conventions row *accessible*; README L7 *The generator characterization* (HTT Proposition
5.4.2.2): for an ∞-category C and κ regular, C is κ-accessible; or C is locally small with small
κ-filtered colimits, `C^κ` essentially small and generating C under small κ-filtered colimits; or C
has small κ-filtered colimits and an essentially small full subcategory of κ-compact objects
generating C under small κ-filtered colimits. -/
theorem isCardinalAccessible_tfae (C : SSet.{v}) [Quasicategory C] (κ : Cardinal.{u})
    [Fact κ.IsRegular] :
    List.TFAE [
      IsCardinalAccessible C κ,
      IsLocallySmall.{u} C ∧ ∃ hC : HasCardinalFilteredColimits.{u, v, u} C κ,
        IsEssentiallySmall.{v, u} (compactObjects C κ hC) ∧
          GeneratesUnderCardinalFilteredColimits {X | IsCardinalPresentable X κ hC} κ,
      ∃ hC : HasCardinalFilteredColimits.{u, v, u} C κ, ∃ A : Set (C _⦋0⦌),
        (∀ X ∈ A, IsCardinalPresentable X κ hC) ∧
        IsEssentiallySmall.{v, u} (fullEnhancedSubcategory C (· ∈ A) : SSet.{v}) ∧
        GeneratesUnderCardinalFilteredColimits A κ] := by sorry

/-- Conventions row *left exact* (dual of HTT 5.3.2.9): with finite limits in the source, G is left
exact exactly when it preserves finite limits. -/
theorem isLeftExact_iff_preservesFiniteLimits {A B : SSet.{u}} [Quasicategory A] [Quasicategory B]
    (_hA : HasFiniteLimits A) (G : A ⟶ B) :
    IsLeftExact G ↔ PreservesFiniteLimits G := by sorry

/-- Conventions row *Čech nerve*; README L10 *Čech nerves* (HTT Proposition 6.1.2.11 (2)): an
augmented simplicial object is a Čech nerve exactly when its underlying simplicial object is a
groupoid object and `U₁ ⟶ U₀ ⇉ U₋₁` is a pullback square. -/
theorem isCechNerve_iff {C : SSet.{u}} [Quasicategory C] (U : augmentedSimplicialObjects C) :
    IsCechNerve U ↔ IsGroupoidObject (augmentationInclusion ≫ U) ∧ IsPullback (cechSquare ≫ U) := by
  sorry

/-- Conventions row *effective epimorphism*; README L10 *Effective epimorphisms* (HTT Corollary
6.2.3.5): in a semitopos, f is an effective epimorphism exactly when its (−1)-truncation in `X_{/y}`
is final, and exactly when every Čech nerve of f is a geometric realization. -/
theorem isEffectiveEpi_iff {X : SSet.{u + 1}} [Quasicategory X] (_hX : IsSemitopos X)
    {x y : X _⦋0⦌} (f : Edge x y) :
    (IsEffectiveEpi f ↔ ∀ (τ : (slice (yonedaEquiv.symm y : Δ[0] ⟶ X)) _⦋0⦌)
        (e : Edge (Edge.toSliceVertex f) τ),
        Edge.IsLocalizationInto {Z | IsTruncatedObject (-1) Z} e → IsTerminalVertex τ) ∧
      (IsEffectiveEpi f ↔ ∀ U : augmentedSimplicialObjects X,
        U.app _ augmentationEdge = f.edge → IsCechNerve U → IsGeometricRealization U) := by sorry

/-- Conventions row *Grothendieck topology*; README L10 *Topologies on C are topologies on hC* (HTT
Remark 6.2.2.3): sieves on `C_{/c}` (HTT 6.2.2.1) correspond to Mathlib sieves on c in `hC`, so HTT's
topologies on C are the Grothendieck topologies on `hC`. -/
theorem sieve_slice_equiv {C : SSet.{u}} [Quasicategory C] (c : C _⦋0⦌) :
    Nonempty (Sieve (slice (yonedaEquiv.symm c : Δ[0] ⟶ C)) ≃
      CategoryTheory.Sieve (show hoFunctor.obj C from HomotopyCategory.mk c)) := by sorry

end SSet

namespace SSet

open _root_.SSet

/-! ## Universe check for §6.3.5 -/

/-! Levels: small = `Type u`; C : `SSet.{u}`; `P(C)`, ∞-topoi : `SSet.{u + 1}`; `LTop`, `RTop` :
`SSet.{u + 2}`; Lurie's larger universe U is level `u + 2`, so `LTop` is U-small; `Ŝ = spaces.{u + 2}`
: `SSet.{u + 3}`; `Shv_Ŝ(X)`, `Shv(LTop^op)` : `SSet.{u + 3}` (∞-topoi in U, `IsInftyTopos.{u + 2}`);
κ = `Cardinal.univ.{u, u + 2}`. -/

/-- `Fun(K, C)` is a quasicategory when C is (helper instance, HTT 1.2.7.3). -/
instance quasicategory_ihom (K C : SSet.{v}) [Quasicategory C] : Quasicategory ((ihom K).obj C) :=
  sorry

/-- The cardinal of `Type u`, seen in a universe `v` above, is regular (helper; Mathlib
`Cardinal.IsInaccessible.univ`). -/
instance fact_isRegular_univ : Fact (Cardinal.univ.{u, v}).IsRegular :=
  ⟨Cardinal.IsInaccessible.univ.isRegular⟩

/-- `RTop^ét`, README L11.1 (`SSet.rTopEt`; HTT 6.3.5.1/after): ∞-topoi with the étale geometric
morphisms. -/
def rTopEt : (SSet.catInfty.{u + 1}).Subcomplex :=
  subcomplexOf _ (fun v ↦ IsInftyTopos (catInfty.obj v)) fun e ↦
    IsEtaleGeometricMorphism (catInfty.edgeMap (Edge.mk' e))

/-- `RTop^ét ⊆ RTop` (helper; étale geometric morphisms are geometric morphisms). -/
theorem rTopEt_le_rTop : rTopEt.{u} ≤ rTop.{u} := by sorry

/-- The inclusion `Shv_S(X) ⊆ Shv_Ŝ(X)` induced by `S ⊆ Ŝ` (helper, HTT 6.3.5.17). -/
def sheavesSpacesInclusion (X : SSet.{u + 1}) [Quasicategory X] :
    uliftFunctor.{u + 3}.obj (sheavesValuedOnTopos.{u + 1, u} X spaces.{u} : SSet) ⟶
      (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj X) spaces.{u + 2} : SSet) := sorry

/-- `f̂_* : Shv_Ŝ(Y) ⟶ Shv_Ŝ(X)`, composition with `f^* : X ⟶ Y` (helper, HTT 6.3.5.18). -/
def sheavesPrecomp {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y] (_fstar : X ⟶ Y) :
    (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj Y) spaces.{u + 2} : SSet) ⟶
      (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj X) spaces.{u + 2} : SSet) := sorry

/-- The restriction `F ↦ F_X : Shv(LTop^op) ⟶ Shv_Ŝ(X)` (helper, HTT 6.3.5.19, 6.3.5.21). -/
def lTopSheaves.restrict (X : SSet.{u + 1}) [Quasicategory X] (_hX : IsInftyTopos X) :
    (lTopSheaves.{u} : SSet) ⟶
      (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj X) spaces.{u + 2} : SSet) := sorry

/-- README L11.1 *Sheaves on an ∞-topos with values in large spaces* (HTT Remark 6.3.5.17 (a)):
`Shv_Ŝ(X)` is an ∞-topos in U (level `u + 2`). -/
theorem isInftyTopos_sheavesValuedOnTopos (X : SSet.{u + 1}) [Quasicategory X]
    (_hX : IsInftyTopos X) :
    IsInftyTopos.{u + 2}
      (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj X) spaces.{u + 2} : SSet) := by
  sorry

/-- README L11.1 *Sheaves on an ∞-topos with values in large spaces* (HTT Remark 6.3.5.17 (b)):
`Shv_S(X) ⊆ Shv_Ŝ(X)` preserves small colimits. -/
theorem preservesSmallColimits_sheavesSpacesInclusion (X : SSet.{u + 1}) [Quasicategory X]
    (_hX : IsInftyTopos X) : PreservesSmallColimits.{u + 3, u} (sheavesSpacesInclusion X) := by
  sorry

/-- README L11.1 *Sheaves on an ∞-topos with values in large spaces* (HTT Remark 6.3.5.18, the
identification used in its proof): with κ the cardinal of the small sets in U,
`Shv_Ŝ(X) ≃ Ind_κ(X)` (5.3.5.4). -/
theorem ind_univ_equiv_sheavesValuedOnTopos (X : SSet.{u + 1}) [Quasicategory X]
    (_hX : IsInftyTopos X) :
    ∃ e : ind Cardinal.univ.{u, u + 2} (uliftFunctor.{u + 2}.obj X) ⟶
        (sheavesValuedOnTopos.{u + 3, u} (uliftFunctor.{u + 3}.obj X) spaces.{u + 2} : SSet),
      IsCategoricalEquivalence e := by
  sorry

/-- README L11.1 *Sheaves on an ∞-topos with values in large spaces* (HTT Remark 6.3.5.18): for a
geometric morphism with left adjoint `f^* : X ⟶ Y`, `f̂_*` is a geometric morphism in U. -/
theorem isGeometricMorphism_sheavesPrecomp {X Y : SSet.{u + 1}} [Quasicategory X] [Quasicategory Y]
    (fstar : X ⟶ Y) (_hX : IsInftyTopos X) (_hY : IsInftyTopos Y)
    (_hf : ∃ f, IsGeometricMorphism f ∧ IsAdjunction fstar f) :
    IsGeometricMorphism (sheavesPrecomp fstar) := by
  sorry

/-- README L11.1 *Sheaves on `LTop^op`* (HTT Lemma 6.3.5.21, first clause): `Shv(LTop^op)` is an
∞-topos in U (level `u + 2`). -/
theorem isInftyTopos_lTopSheaves : IsInftyTopos.{u + 2} (lTopSheaves.{u} : SSet) := by sorry

/-- README L11.1 *Sheaves on `LTop^op`* (HTT Lemma 6.3.5.21, second clause): each restriction
`F ↦ F_X` preserves U-small colimits (indexed by `SSet.{u + 2}`) and finite limits. -/
theorem lTopSheaves.restrict_preserves (X : SSet.{u + 1}) [Quasicategory X]
    (hX : IsInftyTopos X) :
    PreservesSmallColimits.{u + 3, u + 2} (lTopSheaves.restrict X hX) ∧
      PreservesFiniteLimits (lTopSheaves.restrict X hX) := by
  sorry

/-- README L11.1 *`RTop^ét` has small colimits* (HTT Theorem 6.3.5.13): `RTop^ét` has small
colimits, preserved by `RTop^ét ⊆ RTop`. -/
theorem rTopEt_hasSmallColimits :
    HasSmallColimits.{u + 2, u} (rTopEt.{u} : SSet) ∧
      PreservesSmallColimits.{u + 2, u} (Subcomplex.homOfLE rTopEt_le_rTop.{u}) := by
  sorry

end SSet

end TauCetiRoadmap.HigherToposTheory
