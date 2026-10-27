import Mathlib
import TauCeti.Topology.Homotopy.HomotopyGroup.Map
import TauCeti.AlgebraicTopology.Singular.Twisted.Basic
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic

/-!
# Homotopy foundations for algebraic K-theory: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; proving these statements finishes neither a layer nor the roadmap.

The statements here are Quillen A and B, the latter in both comma forms
(§§2.31, 2.34), the local-coefficient characterisation of acyclic maps (§3.7),
plus existence and factorisation (§§3.10–3.13, 3.25), the second homotopy group
and universal central extension of plus for an aspherical source (§3.29), and
freeness of finite projectives over simplex function rings (§4.29).
Classifying spaces are Mathlib's realised nerves. The homotopy fibre is the
subspace of the product with the continuous path space, with paths from f(x) to y,
as in GeneralizedCohomology G2.10. Twisted homology uses Tau Ceti's local systems
and induced homology maps. CW type means homotopy equivalence to a Hausdorff CW complex.

The remaining headline theorems need carriers specified in the README and are not
stated here: the category chain complex with functor coefficients (category
homology), the Hurewicz map with primitive rational homology (rational Hurewicz),
the fraction categories and stable automorphism diagrams (monoidal group
completion and its linear and orthogonal plus comparisons), the Segal machine and
its connective spectra (topological K-theory), the symmetric-sphere-module spectra
with their stable localisation (Layers 5 and 7), Waldhausen categories and the
S-construction (Layer 6), and spectral operad algebras, the deformation category
and HF₂-synthetic spectra (the quotient and Moore Eₙ theorems).
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits Simplicial

universe u v w

namespace CategoryTheory

/-- The classifying space of a category is its nerve's geometric realisation. -/
def classifyingSpace (C : Type u) [Category.{v} C] : TopCat.{max u v} :=
  SSet.toTop.obj (nerve C)

/-- Realisation of the nerve map of a functor. -/
def classifyingSpaceMap {C D : Type u} [Category.{v} C] [Category.{v} D]
    (F : C ⥤ D) : classifyingSpace C ⟶ classifyingSpace D :=
  SSet.toTop.map (nerveMap F)

/-- The vertex of the realised nerve corresponding to an object. -/
def classifyingSpace_vertex {C : Type u} [Category.{v} C] (X : C) : classifyingSpace C :=
  TopCat.toSSetObjEquiv (classifyingSpace C) (Opposite.op ⦋0⦌)
    (((sSetTopAdj.unit.app (nerve C)).app (Opposite.op ⦋0⦌))
      (ComposableArrows.mk₀ X)) default

end CategoryTheory

namespace TauCeti

variable {X Y Z : TopCat.{u}}

/-- The endpoint-constrained subspace of the product with the continuous path space. -/
def MappingPathFiber (f : X ⟶ Y) (y : Y) : TopCat.{u} :=
  TopCat.of {p : X × C(unitInterval, Y) // p.2 0 = f p.1 ∧ p.2 1 = y}

/-- Bijective path components and positive homotopy groups at every source basepoint. -/
def IsWeakHomotopyEquivalence {A : Type u} {B : Type v}
    [TopologicalSpace A] [TopologicalSpace B] (f : C(A, B)) : Prop :=
  Function.Bijective (ZerothHomotopy.lift (fun x => ZerothHomotopy.mk (f x))
    (fun {_ _} p => ZerothHomotopy.sound (p.map f.continuous))) ∧
    ∀ (x : A) (n : ℕ), Function.Bijective
      (HomotopyGroup.map (N := Fin (n + 1)) (x := x) f rfl)

/-- Nonempty path-connected spaces with zero positive integral singular homology. -/
def IsAcyclicSpace (F : TopCat.{u}) : Prop :=
  PathConnectedSpace F ∧ ∀ n : ℕ, IsZero
    ((((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} (ULift.{u} ℤ))
      (n + 1)).obj (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))).obj F))

/-- A map is acyclic when every homotopy fibre is acyclic. -/
def IsAcyclicMap (f : X ⟶ Y) : Prop :=
  ∀ y : Y, IsAcyclicSpace (MappingPathFiber f y)

/-- Recognition of a plus map at the specified fundamental subgroup. -/
def IsPlusConstruction (f : X ⟶ Y) (x : X)
    (P : Subgroup (FundamentalGroup X x)) : Prop :=
  IsAcyclicMap f ∧ (FundamentalGroup.map f.hom x).ker = P

/-- A space has CW type if it is homotopy equivalent to a Hausdorff CW complex. -/
def HasCWType (X : TopCat.{u}) : Prop :=
  ∃ W : TopCat.{u}, Nonempty (Topology.CWComplex (Set.univ : Set W)) ∧ T2Space W ∧
    Nonempty (ContinuousMap.HomotopyEquiv W X)

/-- A surjective central homomorphism initial among central extensions of its target. -/
def IsUniversalCentralExtension {E G : Type u} [Group E] [Group G] (q : E →* G) : Prop :=
  Function.Surjective q ∧ q.ker ≤ Subgroup.center E ∧
    ∀ (E' : Type u) (_ : Group E') (q' : E' →* G),
      Function.Surjective q' → q'.ker ≤ Subgroup.center E' →
        ∃! φ : E →* E', q'.comp φ = q

end TauCeti

namespace CategoryTheory

variable {C D : Type (max u v)} [Category.{v} C] [Category.{v} D]

/-- Quillen A: contractible forward comma spaces give a homotopy inverse to BF (§2.31). -/
theorem quillenTheoremA (F : C ⥤ D)
    (h : ∀ d : D, ContractibleSpace (classifyingSpace (CostructuredArrow F d))) :
    ∃ e : ContinuousMap.HomotopyEquiv (classifyingSpace C) (classifyingSpace D),
      e.toFun = (classifyingSpaceMap F).hom := sorry

/-- Quillen B, forward comma form: covariant comma transport equivalences identify
`B(F↓d)` with the homotopy fibre, preserving projection up to homotopy (§2.34). The
object universe contains the morphism universe so that comma categories use the
same nerve map. -/
theorem quillenTheoremB (F : C ⥤ D)
    (h : ∀ ⦃d d' : D⦄ (g : d ⟶ d'),
      ∃ e : ContinuousMap.HomotopyEquiv
        (classifyingSpace (CostructuredArrow F d))
        (classifyingSpace (CostructuredArrow F d')),
        e.toFun = (classifyingSpaceMap (CostructuredArrow.map g)).hom) (d : D) :
    ∃ q : C(classifyingSpace (CostructuredArrow F d),
      TauCeti.MappingPathFiber (classifyingSpaceMap F) (classifyingSpace_vertex d)),
      TauCeti.IsWeakHomotopyEquivalence q ∧
      ContinuousMap.Homotopic
        ((⟨fun p => p.1.1, continuous_fst.comp continuous_subtype_val⟩ :
          C(TauCeti.MappingPathFiber (classifyingSpaceMap F) (classifyingSpace_vertex d),
            classifyingSpace C)).comp q)
        (classifyingSpaceMap (CostructuredArrow.proj F d)).hom := sorry

/-- Quillen B, primary form: when the contravariant base changes `B(d′↓F) → B(d↓F)`
are homotopy equivalences, `B(d↓F)` is weakly equivalent to the homotopy fibre over
`d`, preserving projection up to homotopy (§2.34). -/
theorem quillenTheoremB_structuredArrow (F : C ⥤ D)
    (h : ∀ ⦃d d' : D⦄ (g : d ⟶ d'),
      ∃ e : ContinuousMap.HomotopyEquiv
        (classifyingSpace (StructuredArrow d' F))
        (classifyingSpace (StructuredArrow d F)),
        e.toFun = (classifyingSpaceMap (StructuredArrow.map (T := F) g)).hom) (d : D) :
    ∃ q : C(classifyingSpace (StructuredArrow d F),
      TauCeti.MappingPathFiber (classifyingSpaceMap F) (classifyingSpace_vertex d)),
      TauCeti.IsWeakHomotopyEquivalence q ∧
      ContinuousMap.Homotopic
        ((⟨fun p => p.1.1, continuous_fst.comp continuous_subtype_val⟩ :
          C(TauCeti.MappingPathFiber (classifyingSpaceMap F) (classifyingSpace_vertex d),
            classifyingSpace C)).comp q)
        (classifyingSpaceMap (StructuredArrow.proj d F)).hom := sorry

end CategoryTheory

namespace TauCeti

variable {X Y Z : TopCat.{u}}

/-- Acyclicity is equivalent to homology isomorphisms for every pulled-back
target local system, over every unital ring and in every degree (§3.7). -/
theorem IsAcyclicMap.iff_homology (hX : HasCWType X) (hY : HasCWType Y)
    [PathConnectedSpace X] [PathConnectedSpace Y] (f : X ⟶ Y) :
    IsAcyclicMap f ↔
      ∀ (R : Type (max u w)) (_ : Ring R)
        (L : LocalCoefficientSystem.{max u w, u, max u w} R Y) (n : ℕ),
        IsIso (LocalCoefficientSystem.twistedHomologyMap f L n) := sorry

/-- A connected Hausdorff CW space admits plus at every perfect normal subgroup
(§§3.10–3.13). -/
theorem plus_exists [Topology.CWComplex (Set.univ : Set X)] [T2Space X] [PathConnectedSpace X]
    (x : X) (P : Subgroup (FundamentalGroup X x)) [P.Normal] [Group.IsPerfect P] :
    ∃ (Y : TopCat.{u}) (_ : Topology.CWComplex (Set.univ : Set Y)) (_ : T2Space Y)
      (_ : PathConnectedSpace Y) (f : X ⟶ Y), IsPlusConstruction f x P := sorry

/-- Maps killing P factor uniquely up to homotopy through any plus map, for
connected spaces of CW type (§3.25). -/
theorem IsPlusConstruction.lift (hX : HasCWType X) (hY : HasCWType Y) (hZ : HasCWType Z)
    [PathConnectedSpace X] [PathConnectedSpace Y] [PathConnectedSpace Z]
    (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x))
    [P.Normal] [Group.IsPerfect P] (hf : IsPlusConstruction f x P)
    (g : X ⟶ Z) (hg : P ≤ (FundamentalGroup.map g.hom x).ker) :
    ∃ h : Y ⟶ Z, ContinuousMap.Homotopic g.hom (f ≫ h).hom ∧
      ∀ h' : Y ⟶ Z, ContinuousMap.Homotopic g.hom (f ≫ h').hom →
        ContinuousMap.Homotopic h.hom h'.hom := sorry

/-- For an aspherical source, π₂ of plus is the Schur multiplier of P (§3.29). -/
theorem IsPlusConstruction.piTwoEquiv
    (hX : HasCWType X) (hY : HasCWType Y)
    [PathConnectedSpace X] [PathConnectedSpace Y]
    (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x))
    [P.Normal] [Group.IsPerfect P] (hf : IsPlusConstruction f x P)
    (hAspherical : IsAspherical X x) :
    Nonempty (Additive (HomotopyGroup (Fin 2) Y (f x)) ≃+
      groupHomology (Rep.trivial (ULift.{u} ℤ) P (ULift.{u} ℤ)) 2) := sorry

/-- The fundamental group of the plus fibre universally centrally extends P,
with the extension map induced by the fibre projection (§3.29). -/
theorem IsPlusConstruction.fiber_universalCentralExtension
    (hX : HasCWType X) (hY : HasCWType Y)
    [PathConnectedSpace X] [PathConnectedSpace Y]
    (f : X ⟶ Y) (x : X) (P : Subgroup (FundamentalGroup X x))
    [P.Normal] [Group.IsPerfect P] (hf : IsPlusConstruction f x P)
    (hAspherical : IsAspherical X x) :
    let z : MappingPathFiber f (f x) :=
      ⟨(x, ContinuousMap.const unitInterval (f x)), rfl, rfl⟩
    let proj : C(MappingPathFiber f (f x), X) :=
      ⟨fun p => p.1.1, continuous_fst.comp continuous_subtype_val⟩
    ∃ q : FundamentalGroup (MappingPathFiber f (f x)) z →* P,
      IsUniversalCentralExtension q ∧
        P.subtype.comp q = FundamentalGroup.map proj z := sorry


/-- Finite projectives over continuous functions on a simplex are free, for
real or complex scalars (§4.29). -/
theorem continuousFunctions_projective_free (𝕜 : Type) [RCLike 𝕜] (n : ℕ) (P : Type u)
    [AddCommGroup P] [Module C(SimplexCategory.toTop₀.obj ⦋n⦌, 𝕜) P]
    [Module.Finite C(SimplexCategory.toTop₀.obj ⦋n⦌, 𝕜) P]
    [Module.Projective C(SimplexCategory.toTop₀.obj ⦋n⦌, 𝕜) P] :
    Module.Free C(SimplexCategory.toTop₀.obj ⦋n⦌, 𝕜) P := sorry

end TauCeti

end
