import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map
import TauCetiRoadmap.GeneralizedCohomology.Suggested

/-!
# StableHomotopyKTheory: representative target signatures

README.md is the roadmap and the full mathematical specification. This file is
not exhaustive: it records light definitions and milestones statable against
the pinned Mathlib and Tau Ceti APIs. New theorem proofs use `sorry`.

The signatures specify realised nerves, endpoint-based homotopy fibres,
acyclic maps and plus recognition. Spectra, their localisations, coefficient
objects and filtered constructions are specified in the README. Homotopy fibres
use GeneralizedCohomology G2.10's real-bodied MappingPathFiber carrier.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits Simplicial

universe u v

/-! ## Layer 1: Classifying spaces and category homology -/

namespace CategoryTheory

variable {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]

/-- the classifying space `BC = |NC|`. -/
def classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} := SSet.toTop.obj (nerve C)

/-- The map `BF = |NF|` induced by a functor. -/
def classifyingSpaceMap (F : C ⥤ D) : classifyingSpace C ⟶ classifyingSpace D :=
  SSet.toTop.map (nerveMap F)

/-- B(id)=id. -/
theorem classifyingSpaceMap_id : classifyingSpaceMap (𝟭 C) = 𝟙 (classifyingSpace C) := sorry

/-- B(F⋙G)=BF≫BG. -/
theorem classifyingSpaceMap_comp (F : C ⥤ D) (G : D ⥤ E) :
    classifyingSpaceMap (F ⋙ G) = classifyingSpaceMap F ≫ classifyingSpaceMap G := sorry

/-- `B` as a functor `Cat ⥤ TopCat`. -/
def classifyingSpaceFunctor : Cat.{v, u} ⥤ TopCat.{max u v} := nerveFunctor ⋙ SSet.toTop

/-- The vertex is the adjunction unit evaluated on the object zero-simplex. -/
def classifyingSpace_vertex (X : C) : classifyingSpace C :=
  TopCat.toSSetObjEquiv (classifyingSpace C) (Opposite.op ⦋0⦌)
    (((sSetTopAdj.unit.app (nerve C)).app (Opposite.op ⦋0⦌))
      (ComposableArrows.mk₀ X)) default

/-- Realisation of a functor carries the selected vertex to the image vertex. -/
theorem classifyingSpaceMap_vertex (F : C ⥤ D) (X : C) :
    (classifyingSpaceMap F).hom (classifyingSpace_vertex X) = classifyingSpace_vertex (F.obj X) := sorry

/-- Realisation has no components besides those represented by objects. -/
theorem classifyingSpace_zerothHomotopy :
    ∃ e : ZerothHomotopy (classifyingSpace C) ≃ CategoryTheory.ConnectedComponents C,
      ∀ X : C, e (ZerothHomotopy.mk (classifyingSpace_vertex X)) =
        CategoryTheory.ConnectedComponents.mk X := sorry

/-- `classifyingSpace_fin_two_homeomorph_unitInterval`: classifyingSpace (Fin 2) (the ordered set 0 < 1) is homeomorphic to the unit interval, with vertices 0 and 1 the endpoints. -/
theorem classifyingSpace_fin_two_homeomorph_unitInterval : ∃ e : classifyingSpace (Fin 2) ≃ₜ unitInterval,
    e (classifyingSpace_vertex (0 : Fin 2)) = 0 ∧
    e (classifyingSpace_vertex (1 : Fin 2)) = 1 := sorry

/-- Either endpoint-constant map of the realized ordinal differs from its identity. -/
theorem classifyingSpaceMap_ordinal_id_ne_endpointConst (e : Fin 2) :
    classifyingSpaceMap (𝟭 (Fin 2)) ≠
      classifyingSpaceMap ((Functor.const (Fin 2)).obj e) := sorry

/-- The endpoint inclusion and terminal functor realize to the point identity in one
order and the endpoint-constant interval map in the other, with the selected vertex. -/
theorem classifyingSpaceMap_endpoint_composite_order (e : Fin 2) :
    let i : Discrete PUnit.{1} ⥤ Fin 2 := Functor.fromPUnit e
    let t : Fin 2 ⥤ Discrete PUnit.{1} := Functor.star (Fin 2)
    classifyingSpaceMap (i ⋙ t) = 𝟙 (classifyingSpace (Discrete PUnit.{1})) ∧
      classifyingSpaceMap (t ⋙ i) =
        classifyingSpaceMap ((Functor.const (Fin 2)).obj e) ∧
      (classifyingSpaceMap i).hom (classifyingSpace_vertex (Discrete.mk PUnit.unit)) =
        classifyingSpace_vertex e := sorry

/-- `classifyingSpace_empty`: classifyingSpace of the empty category is the empty space, and of the one-object one-morphism category is a single point. -/
theorem classifyingSpace_empty : IsEmpty (classifyingSpace (Discrete PEmpty.{1})) ∧
    Nonempty (Unique (classifyingSpace (Discrete PUnit.{1}))) := sorry

/-- `classifyingSpace_discrete`: For a set S viewed as a discrete category, classifyingSpace S is homeomorphic to S with the discrete topology. -/
theorem classifyingSpace_discrete (S : Type) [TopologicalSpace S] [DiscreteTopology S] :
    ∃ e : classifyingSpace (Discrete S) ≃ₜ S,
      ∀ x : S, e (classifyingSpace_vertex (Discrete.mk x)) = x := sorry

/-- `classifyingSpaceMap_not_full`: There is a continuous map classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2) (the reflection of the interval) that is not classifyingSpaceMap of any functor: B is faithful but not full. -/
theorem classifyingSpaceMap_not_full : ∃ g : classifyingSpace (Fin 2) ⟶ classifyingSpace (Fin 2),
    ∀ F : Fin 2 ⥤ Fin 2, classifyingSpaceMap F ≠ g := sorry

/-- Realisation admits the CW structure specified in §1.3. -/
theorem realisation_has_cw (X : SSet.{u}) :
    Nonempty (Topology.CWComplex (Set.univ : Set (SSet.toTop.obj X))) := sorry

/-- A subcategory gives a subcomplex: the inclusion of classifying spaces is a closed embedding. -/
theorem classifyingSpace_subcomplex (F : C ⥤ D) [F.Faithful] (hF : Function.Injective F.obj) :
    Topology.IsClosedEmbedding (classifyingSpaceMap F) := sorry

/-- `SSet.toTop_t2Space`: realisations are Hausdorff. -/
theorem _root_.SSet.toTop_t2Space (X : SSet.{u}) : T2Space (SSet.toTop.obj X) := sorry

/-- `SSet.toTop_isCompact_subset_finite_subcomplex`: a compact subset of `|X|` lies in the realisation
of a simplicial subset with finitely many nondegenerate simplices. -/
theorem _root_.SSet.toTop_isCompact_subset_finite_subcomplex (X : SSet.{u})
    (K : Set (SSet.toTop.obj X)) (hK : IsCompact K) :
    ∃ A : X.Subcomplex, SSet.Finite A ∧ K ⊆ Set.range (SSet.toTop.map A.ι).hom := sorry

/-- `SSet.toTop_map_isClosedEmbedding_of_mono`: realisations of monomorphisms are closed embeddings
(onto subcomplexes). -/
theorem _root_.SSet.toTop_map_isClosedEmbedding_of_mono {A X : SSet.{u}} (i : A ⟶ X) [Mono i] :
    Topology.IsClosedEmbedding (SSet.toTop.map i).hom := sorry

/-- `SSet.toTop_stronglyLocallyContractibleSpace`: a basis of contractible open neighbourhoods.
The classical CW local-contractibility theorem supplies this class; the weaker
`LocallyContractibleSpace` predicate alone does not supply a local-path-connectedness instance. -/
theorem _root_.SSet.toTop_stronglyLocallyContractibleSpace (X : SSet.{u}) :
    StronglyLocallyContractibleSpace (SSet.toTop.obj X) := sorry

/-- Reversal of nerve simplices gives an opposite-space homeomorphism (§1.7). -/
theorem classifyingSpace_op_homeomorph :
    Nonempty (classifyingSpace Cᵒᵖ ≃ₜ classifyingSpace C) := sorry

/-- the canonical map `B(C × D) → BC × BD` is a homeomorphism when
`BD` is a finite complex. -/
theorem classifyingSpaceProdHomeomorph (C D : Type u) [Category.{v} C] [Category.{v} D]
    [(nerve D).Finite] :
    IsHomeomorph (fun x : classifyingSpace (C × D) =>
      ((classifyingSpaceMap (CategoryTheory.Prod.fst C D)).hom x,
        (classifyingSpaceMap (CategoryTheory.Prod.snd C D)).hom x)) := sorry


/-- A natural transformation gives a homotopy of the realised maps (§1.10). -/
theorem NatTrans.classifyingSpaceHomotopic {F G : C ⥤ D} (η : F ⟶ G) :
    ContinuousMap.Homotopic (classifyingSpaceMap F).hom (classifyingSpaceMap G).hom := sorry

/-- An adjunction induces a homotopy equivalence of classifying spaces, using its unit and counit. -/
theorem Adjunction.classifyingSpaceHomotopyEquiv {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap L).hom ∧ e.invFun = (classifyingSpaceMap R).hom := sorry

/-- An initial object contracts the classifying space to its vertex. -/
theorem classifyingSpace_contractible_of_hasInitial [HasInitial C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- A terminal object contracts the classifying space to its vertex. -/
theorem classifyingSpace_contractible_of_hasTerminal [HasTerminal C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- the nerve commutes with filtered colimits of categories. -/
theorem nerve_isColimit_of_isFiltered {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c) :
    Nonempty (IsColimit (nerveFunctor.mapCocone c)) := sorry


/-- If every transition induces a homotopy equivalence of classifying spaces, each stage maps by a homotopy equivalence to the filtered-colimit classifying space. -/
theorem classifyingSpace_filteredColimit_homotopyEquiv {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (h : ∀ ⦃i j : I⦄ (f : i ⟶ j), ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i))
      (classifyingSpace (F.obj j)),
      e.toFun = (classifyingSpaceMap (F.map f).toFunctor).hom) (i : I) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace (F.obj i)) (classifyingSpace c.pt),
      e.toFun = (classifyingSpaceMap (c.ι.app i).toFunctor).hom := sorry

/-- The classifying space of a filtered small category is contractible. -/
theorem classifyingSpace_contractible_of_filtered [IsFiltered C] :
    ContractibleSpace (classifyingSpace C) := sorry

/-- homology with arbitrary constant module coefficients commutes with filtered colimits of categories. -/
theorem classifyingSpace_filteredColimit_homology {I : Type u} [SmallCategory I] [IsFiltered I]
    (F : I ⥤ Cat.{v, u}) (c : Cocone F) (hc : IsColimit c)
    (R : Type (max u v)) [Ring R] (A : ModuleCat.{max u v} R) (n : ℕ) :
    Nonempty (IsColimit ((classifyingSpaceFunctor ⋙
      (AlgebraicTopology.singularHomologyFunctor (ModuleCat.{max u v} R) n).obj A).mapCocone c)) := sorry

/-- The selected vertex of the unique object represents the sole component of a point. -/
theorem classifyingSpace_point_vertex : ∀ x : classifyingSpace (Discrete PUnit.{1}),
    x = classifyingSpace_vertex (Discrete.mk PUnit.unit) := sorry

/-- Distinct objects of a discrete category give distinct vertices. -/
theorem classifyingSpace_discrete_vertices_ne : classifyingSpace_vertex (Discrete.mk false) ≠
    classifyingSpace_vertex (Discrete.mk true) := sorry

/-- The two ordinal vertices are distinct even though their space is contractible. -/
theorem classifyingSpace_ordinal_vertices_ne : classifyingSpace_vertex (0 : Fin 2) ≠ classifyingSpace_vertex (1 : Fin 2) := sorry

end CategoryTheory

/-! ## Layer 2: Quillen's theorems -/

namespace TauCeti

/-- A weak homotopy equivalence is bijective on path components and on every
positive homotopy group at every basepoint (§2.1). -/
def IsWeakHomotopyEquivalence {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : Prop :=
  Function.Bijective (ZerothHomotopy.lift (fun x => ZerothHomotopy.mk (f x))
    (fun {_ _} p => ZerothHomotopy.sound (p.map f.continuous))) ∧
    ∀ (x : X) (n : ℕ), Function.Bijective
      (HomotopyGroup.map (N := Fin (n + 1)) (x := x) f rfl)

/-- The identity of every space is a weak homotopy equivalence. -/
theorem isWeakHomotopyEquivalence_id (X : Type u) [TopologicalSpace X] :
    IsWeakHomotopyEquivalence (ContinuousMap.id X) := sorry

/-- Every continuous map between contractible spaces is a weak homotopy equivalence. -/
theorem isWeakHomotopyEquivalence_contractible {X : Type u} {Y : Type v}
    [TopologicalSpace X] [TopologicalSpace Y] [ContractibleSpace X] [ContractibleSpace Y]
    (f : C(X, Y)) : IsWeakHomotopyEquivalence f := sorry

/-- A point misses one component of a discrete two-point space, despite inducing
bijections on every positive homotopy group at its source basepoint. -/
theorem isWeakHomotopyEquivalence_not_pi0 :
    ¬ IsWeakHomotopyEquivalence (ContinuousMap.const PUnit.{1} false) ∧
      ∀ n : ℕ, Function.Bijective
        (HomotopyGroup.map (N := Fin (n + 1)) (x := PUnit.unit)
          (ContinuousMap.const PUnit.{1} false) rfl) := sorry

/-- Between CW complexes, weak homotopy equivalence is equivalent to admitting
a homotopy inverse for the given continuous map. -/
theorem isWeakHomotopyEquivalence_iff_homotopyEquiv_cw {X : Type u} {Y : Type v}
    [TopologicalSpace X] [TopologicalSpace Y]
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    (f : C(X, Y)) : IsWeakHomotopyEquivalence f ↔
      ∃ e : ContinuousMap.HomotopyEquiv X Y, e.toFun = f := sorry

/-- Collapsing the circle and the isolated point to distinct points is bijective
on components and correct at the isolated basepoint, but fails weak equivalence. -/
theorem isWeakHomotopyEquivalence_not_all_basepoints :
    let f : C(Circle ⊕ PUnit.{1}, Bool) :=
      ⟨Sum.elim (fun _ => false) (fun _ => true),
        continuous_const.sumElim continuous_const⟩
    Function.Bijective (ZerothHomotopy.lift (fun x => ZerothHomotopy.mk (f x))
      (fun {_ _} p => ZerothHomotopy.sound (p.map f.continuous))) ∧
      (∀ n : ℕ, Function.Bijective
        (HomotopyGroup.map (N := Fin (n + 1)) (x := Sum.inr PUnit.unit) f rfl)) ∧
      ¬ IsWeakHomotopyEquivalence f := sorry

/-- Vanishing positive homotopy at all source basepoints does not suffice:
the empty space misses the component of a point (§2.1). -/
example : ¬ IsWeakHomotopyEquivalence
    (ContinuousMap.const PEmpty.{1} PUnit.unit) := by
  intro h
  obtain ⟨q, _⟩ := h.1.2 (ZerothHomotopy.mk PUnit.unit)
  induction q using ZerothHomotopy.rec with
  | mk x => exact x.elim

end TauCeti

namespace CategoryTheory

variable {C D : Type (max u v)} [Category.{v} C] [Category.{v} D]

/-- Quillen's Theorem A: the given map has a homotopy inverse (§2.31). -/
theorem quillenTheoremA (F : C ⥤ D)
    (h : ∀ d : D, ContractibleSpace (classifyingSpace (StructuredArrow d F))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- Quillen's Theorem B identifies each forward comma space with the homotopy
fibre by a weak equivalence preserving projection up to homotopy (§2.34).
The common object universe accommodates the comma objects and Mathlib's nerveMap. -/
theorem quillenTheoremB (F : C ⥤ D)
    (h : ∀ ⦃d d' : D⦄ (g : d ⟶ d'),
      ∃ e : ContinuousMap.HomotopyEquiv
        (classifyingSpace (CostructuredArrow F d))
        (classifyingSpace (CostructuredArrow F d')),
        e.toFun = (classifyingSpaceMap (CostructuredArrow.map g)).hom) (d : D) :
    ∃ q : C(classifyingSpace (CostructuredArrow F d),
      TauCetiRoadmap.GeneralizedCohomology.MappingPathFiber
        (classifyingSpaceMap F).hom (classifyingSpace_vertex d)),
      TauCeti.IsWeakHomotopyEquivalence q ∧
      ContinuousMap.Homotopic
        ((TauCetiRoadmap.GeneralizedCohomology.mappingPathFiberProjection
          (classifyingSpaceMap F).hom (classifyingSpace_vertex d)).comp q)
        (classifyingSpaceMap (CostructuredArrow.proj F d)).hom := sorry

end CategoryTheory

namespace TauCeti

variable {A B : TopCat.{u}}

/-! ## Layer 3: The plus construction -/

variable {X Y Z : TopCat.{u}}

/-- path-connected with vanishing integral homology in positive degrees
(equivalently, nonempty with vanishing reduced integral homology). -/
def IsAcyclicSpace (F : TopCat.{u}) : Prop :=
  PathConnectedSpace F ∧ ∀ n : ℕ, IsZero ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ))
    (n + 1)).obj (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).obj F))

/-- Contractible spaces are acyclic. -/
theorem IsAcyclicSpace.of_contractible (F : TopCat.{u}) [ContractibleSpace F] : IsAcyclicSpace F := sorry

/-- Homotopy equivalence preserves acyclicity. -/
theorem IsAcyclicSpace.of_homotopyEquiv {F F' : TopCat.{u}} (e : ContinuousMap.HomotopyEquiv F F')
    (h : IsAcyclicSpace F) : IsAcyclicSpace F' := sorry

/-- `isAcyclicSpace_point`: A one-point space is acyclic. -/
theorem isAcyclicSpace_point : IsAcyclicSpace (TopCat.of PUnit.{u + 1}) := sorry

/-- `not_isAcyclicSpace_empty`: The empty space is not acyclic: the nonempty path-connectedness condition fails. -/
theorem not_isAcyclicSpace_empty : ¬ IsAcyclicSpace (TopCat.of PEmpty.{u + 1}) := by
  intro h
  obtain ⟨x⟩ := h.1.nonempty
  exact x.elim

/-- Nonemptiness distinguishes acyclicity from positive-degree homology vanishing. -/
example : ¬ IsAcyclicSpace (TopCat.of PEmpty.{u + 1}) := by
  intro h
  obtain ⟨x⟩ := h.1.nonempty
  exact x.elim

/-- `not_isAcyclicSpace_circle`: The circle is not acyclic: H₁(S¹; ℤ) = ℤ. -/
theorem not_isAcyclicSpace_circle : ¬ IsAcyclicSpace (TopCat.of (Circle)) := sorry

/-- There exists an acyclic space with nontrivial fundamental group. -/
theorem exists_acyclicSpace_nontrivial_pi1 :
    ∃ F : TopCat.{0}, IsAcyclicSpace F ∧ ∃ x : F, Nontrivial (FundamentalGroup F x) := sorry

/-- An acyclic CW space has superperfect fundamental group. -/
theorem IsAcyclicSpace.perfect_and_H2 {F : TopCat.{u}} [Topology.CWComplex (Set.univ : Set F)]
    (h : IsAcyclicSpace F) (x : F) :
    Group.IsPerfect (FundamentalGroup F x) ∧
      IsZero (groupHomology (Rep.trivial (ULift.{u} ℤ) (FundamentalGroup F x) (ULift.{u} ℤ)) 2) := sorry

/-- every homotopy fibre is acyclic. -/
def IsAcyclicMap (f : X ⟶ Y) : Prop := ∀ y : Y, IsAcyclicSpace (TopCat.of (TauCetiRoadmap.GeneralizedCohomology.MappingPathFiber f.hom y))

/-- `isAcyclicMap_id`: The identity map is acyclic. -/
theorem isAcyclicMap_id : IsAcyclicMap (𝟙 X) := sorry

/-- `isAcyclicMap_toPoint_iff`: X → point is acyclic iff X is acyclic. -/
theorem isAcyclicMap_toPoint_iff : IsAcyclicMap (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) ↔
    IsAcyclicSpace X := sorry

/-- `isAcyclicMap_homotopyEquiv`: The forward map of a homotopy equivalence is acyclic. -/
theorem isAcyclicMap_homotopyEquiv (e : ContinuousMap.HomotopyEquiv X Y) : IsAcyclicMap (TopCat.ofHom e.toFun) := sorry

/-- `not_isAcyclicMap_point_into_acyclic`: A point→(Poincaré sphere minus a point) is an integral homology isomorphism, but fails π₁ surjectivity and its loop-space fibre is not acyclic. -/
theorem not_isAcyclicMap_point_into_acyclic (F : TopCat.{u}) (hF : IsAcyclicSpace F) (x : F) (hx : Nontrivial (FundamentalGroup F x)) :
    ¬ IsAcyclicMap (TopCat.ofHom (ContinuousMap.const PUnit.{u + 1} x) : TopCat.of PUnit ⟶ F) := sorry

/-- Acyclic maps surject on π₁ with perfect kernel at each source basepoint (§3.4). -/
theorem IsAcyclicMap.pi1_surjective_perfect_kernel
    {f : X ⟶ Y}
    (hf : IsAcyclicMap f) (x : X) :
    Function.Surjective (FundamentalGroup.map f.hom x) ∧
      Group.IsPerfect (FundamentalGroup.map f.hom x).ker := sorry

/-- Constant-coefficient consequence of the full local-system criterion (§3.7). -/
theorem IsAcyclicMap.homology_criterion
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [PathConnectedSpace X] [PathConnectedSpace Y] (f : X ⟶ Y)
    (hf : IsAcyclicMap f) (n : ℕ) :
    IsIso (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ)) n).obj
      (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).map f) := sorry

/-- Acyclic f with ker(π₁f)=P. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- The induced quotient isomorphism π₁X/P≅π₁Y. -/
theorem IsPlusConstruction.pi1_quotient {f : X ⟶ Y} {x : X} {P : Subgroup (FundamentalGroup X x)} [P.Normal]
    (h : IsPlusConstruction f x P) :
    ∃ e : FundamentalGroup X x ⧸ P ≃* FundamentalGroup Y (f.hom x),
      ∀ g : FundamentalGroup X x, e (QuotientGroup.mk g) = FundamentalGroup.map f.hom x g := sorry

/-- `isPlusConstruction_acyclic_toPoint`: For X acyclic, X → point is a plus construction relative to π₁(X). -/
theorem isPlusConstruction_acyclic_toPoint (hX : IsAcyclicSpace X) (x : X) :
    IsPlusConstruction (TopCat.ofHom (ContinuousMap.const X PUnit.unit) : X ⟶ TopCat.of PUnit.{u + 1}) x ⊤ := sorry

/-- `not_isPlusConstruction_nonperfect`: No map is a plus construction relative to a non-perfect subgroup: the kernel of an acyclic map on π₁ is perfect. -/
theorem not_isPlusConstruction_nonperfect (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x)) (hP : ¬ Group.IsPerfect P) :
    ¬ IsPlusConstruction f x P := sorry

/-- The identity is plus relative to the trivial subgroup. -/
theorem isPlusConstruction_id (x : X) : IsPlusConstruction (𝟙 X) x ⊥ := sorry

/-- On connected CW complexes, plus recognition at the trivial subgroup is
equivalent to weak homotopy equivalence of the given map. -/
theorem isPlusConstruction_trivial_iff
    [Topology.CWComplex (Set.univ : Set X)] [Topology.CWComplex (Set.univ : Set Y)]
    [PathConnectedSpace X] [PathConnectedSpace Y] (f : X ⟶ Y) (x : X) :
    IsPlusConstruction f x ⊥ ↔ IsWeakHomotopyEquivalence f.hom := sorry

/-- Plus existence at every perfect normal subgroup of a connected CW space (§3.10). -/
theorem plus_exists [Topology.CWComplex (Set.univ : Set X)] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] [Group.IsPerfect P] :
    ∃ (Y : TopCat.{u}) (_ : Topology.CWComplex (Set.univ : Set Y))
      (_ : PathConnectedSpace Y) (f : X ⟶ Y), IsPlusConstruction f x P := sorry

end TauCeti

/-
Further construction targets are specified in README.md:
Layer 1: toTopCWComplex and its cell/skeleton maps; CGWH and its categorical
closures; categorySimplicialModule, categoryChainComplex, categoryHomology and
categoryHomologyFunctor; twisted cellular and group-nerve/bar comparisons.
Layer 2: IsHomotopyFiberSequence, IsHomotopyFiberSequenceOfHomotopy,
homotopyPullback, IsHomotopyCartesian, IsHomotopyCartesianOfHomotopy,
IsQuasiFibration, SimplicialSpace.realization, BisimplicialSet.realization,
IsProper, PiStarKanCondition, SpaceDiagram.hocolim and comma/fibre comparisons.
Layer 3: perfectRadical, plusConstruction, IsAbelianSpace, SpaceTower.holim,
postnikovTower, principalFibration_extensionObstruction, twistedExtensionObstruction,
abelianExtension, UniversalCentralExtension and rationalEMCohomology.
Layer 4: Core.monoidalCategory and its component comparison, SInvS,
FaithfulTranslations, MonoidalActionCategory, MonoidalAction.diag,
IsHomotopyAssocHSpace, IsHomotopyCommHSpace, pontryaginLocalization,
IsGroupCompletion, stableGeneralLinearGroup, stableElementaryGroup, BasedFree,
projectiveFreeComplement, summingFunctors, segalGammaSpace, segalSpaces,
coherentSubsetGammaSpace using the supplied symmetric coherence,
topologicalVariant and simplicialRingOfContinuous.
Layer 5: point-set loop/suspension/shift and cone adapters, injective replacements,
point-set/derived pairings, operadPositiveModel, operadRectification,
eilenbergMacLaneRing for associative rings, eilenbergMacLaneModule,
eilenbergMacLaneComplex, HRModDerivedEquiv, connectiveSphereInduction,
comparisons with the supplied spectraInfinityCategory and the Picard-spectrum comparison.
Layer 6: WaldhausenCategory, ExactFunctor, S, K0 and kSpectrum.
Layer 7: moore, modM, piMod, modTower, abelianTower.difference with its
kernel/cokernel, multiplicationTower, generalMoore, completionZEquiv,
FilteredSpectrum, ExactCouple and their spectral sequences and convergence.

Additional map, comparison and boundary-check targets from those sections:
IsAcyclicMap.iff_homology, IsAcyclicMap.isWeakHomotopyEquivalence_of_bijective_pi1.
IsAcyclicMap.ker_isPerfect, IsAcyclicMap.of_comp.
IsAcyclicMap.surjective_pi1, IsAcyclicSpace.perfect_fundamentalGroup.
IsPlusConstruction.homology_iso, IsPlusConstruction.recognition_hSpace.
IsWeakHomotopyEquivalence.homotopyEquiv_of_cw, IsWeakHomotopyEquivalence.of_homotopic.
classifyingSpaceMap_edge, classifyingSpaceMap_universes.
classifyingSpace_coveringEquivalence, classifyingSpace_distinct_vertices.
classifyingSpace_edge, classifyingSpace_edgeFunctor.
classifyingSpace_edge_comp, classifyingSpace_eq_toTop_nerve.
classifyingSpace_filteredColimit_pi, classifyingSpace_fundamentalGroupoidEquivalence.
classifyingSpace_groupoid_oneType, classifyingSpace_hSpace_core_finsets.
classifyingSpace_hSpace_discrete_nat, classifyingSpace_hSpace_unit.
classifyingSpace_homologyIso_categoryHomology, classifyingSpace_homotopyEquiv_of_adjunction.
classifyingSpace_joined_vertex, classifyingSpace_localSystemEquivalence.
classifyingSpace_maximalTreePresentation, classifyingSpace_maximalTreePresentation_apply.
classifyingSpace_opHomeomorph, classifyingSpace_pi0Equiv.
classifyingSpace_pi1Presentation, classifyingSpace_prodHomeomorph_k.
classifyingSpace_prodMap, classifyingSpace_sigma.
classifyingSpace_treeLoop, classifyingSpace_treePath.
classifyingSpace_twistedCellularChainIso, isAcyclicSpace_contractible_compat.
quillenTheoremA_prefibred, quillenTheoremB_prefibred.
-/

end
