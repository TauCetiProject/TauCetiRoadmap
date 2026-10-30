module

import Mathlib
import TauCeti.RingTheory.Huber.TopologicallyFiniteType

/-!
# Arc topology and descent: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. Its real-bodied predicates only express
valuation lifting, perfect characteristic-p schemes and coefficient torsion on native
carriers; they do not construct replacement sites, topoi or cohomology theories.

The following headline theorems are not statable at the pins:
* The finitary arc-descent/excision/aic-excision equivalence and rank-one detection
  lack coherent infinity-categories, cotruncated mapping spaces, the scheme v/arc
  sheaf categories and coherent augmented totalizations.
* Unrestricted Milnor excision and formal glueing lack the coherent arc-topos,
  sheafified representable pushouts and small-limit-valued sheaf carriers.
* Arc-descent of separated etale objects and constructible finite-set sheaves
  lacks the general constructible-sheaf category and its categorical descent functor.
* Characteristic-zero h-differential and h-de Rham arc-descent lacks the h-form
  cohomology functor, its coherent finitary extension and filtered enhancement.
* Perfect-complex arc-hyperdescent lacks the coherent symmetric monoidal Perf
  functor and scheme perfection.
* Mapping descent into algebraic spaces lacks algebraic spaces and scheme perfection.
* Arbitrary-parameter completed-generic-fibre hyperdescent and its Kunneth theorem
  lack coherent derived etale sections on the complete sites and the compatible
  monoidal totalization/completed-tensor functors.
* Finite-ideal complete-arc hyperdescent lacks the complete-arc site and the
  completed/punctured etale derived-sections functors on it.
* Integral perfectoid, tilt and A_inf hyperdescent lacks the integral perfectoid
  category with complete-arc hypercovers and its coherent derived section maps.

The torsion/constructible arc-descent and perfectoid-basis/structure-sheaf results
of PrismaticCohomology section 2.0 are supplier inputs, not additional targets here.
-/

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry Opposite

universe u

namespace TauCetiRoadmap.ArcTopologyAndDescent

/-! ## Layer 2: Arc-covers and spectral submersions -/

/-- The rank-at-most-one valuative lifting predicate on a scheme morphism. -/
def IsSchemeArcCover {X Y : Scheme.{u}} (f : Y ⟶ X) : Prop :=
  ∀ (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [Ring.KrullDimLE 1 V]
    (a : Spec (CommRingCat.of V) ⟶ X),
    ∃ (W : Type u) (_ : CommRing W) (_ : IsDomain W) (_ : ValuationRing W)
      (_ : Ring.KrullDimLE 1 W) (e : V →+* W) (b : Spec (CommRingCat.of W) ⟶ Y),
      Function.Injective e ∧ IsLocalHom e ∧
        b ≫ f = Spec.map (CommRingCat.ofHom e) ≫ a

/-- A qcqs scheme map is an arc-cover precisely when all qcqs base changes reflect compact openness (BM21 Proposition 2.19). -/
theorem arc_spectral_characterization (X Y : Scheme.{u})
    [CompactSpace X] [QuasiSeparatedSpace X] [CompactSpace Y] [QuasiSeparatedSpace Y]
    (f : Y ⟶ X) [QuasiCompact f] [QuasiSeparated f] :
    IsSchemeArcCover f ↔
      ∀ (T : Scheme.{u}) [CompactSpace T] [QuasiSeparatedSpace T] (g : T ⟶ X),
        Function.Surjective (pullback.snd f g) ∧
          ∀ U : Set T,
            IsOpen ((pullback.snd f g) ⁻¹' U) →
            IsCompact ((pullback.snd f g) ⁻¹' U) → IsOpen U := by
  sorry

/-- Arc-covers are stable under cofiltered limits with affine transition maps (BM21 Corollary 2.20). -/
theorem isSchemeArcCover_of_isLimit {I : Type u} [Category.{u} I] [IsCofiltered I]
    {X Y : I ⥤ Scheme.{u}} (f : Y ⟶ X)
    [∀ i, CompactSpace (X.obj i)] [∀ i, QuasiSeparatedSpace (X.obj i)]
    [∀ i, CompactSpace (Y.obj i)] [∀ i, QuasiSeparatedSpace (Y.obj i)]
    [∀ {i j} (φ : i ⟶ j), IsAffineHom (X.map φ)]
    [∀ {i j} (φ : i ⟶ j), IsAffineHom (Y.map φ)]
    {cX : Cone X} (hX : IsLimit cX) {cY : Cone Y} (hY : IsLimit cY)
    (hf : ∀ i, IsSchemeArcCover (f.app i)) :
    IsSchemeArcCover (hX.lift ((Cone.postcompose f).obj cY)) := by
  sorry

/-! ## Layer 7: Constructible complexes, differentials and perfect schemes -/

/-- For prime p, every open-section ring has p = 0 and bijective Frobenius; the empty scheme is included. -/
def IsPerfectFpScheme (p : ℕ) (X : Scheme.{u}) : Prop :=
  ∀ U : X.Opens, (p : Γ(X, U)) = 0 ∧ Function.Bijective (fun x : Γ(X, U) => x ^ p)

/-- The object property defining the full category of qcqs perfect F_p-schemes, for prime p. -/
def QcqsPerfectFp (p : ℕ) : ObjectProperty Scheme.{u} :=
  fun X => CompactSpace X ∧ QuasiSeparatedSpace X ∧ IsPerfectFpScheme p X

/-- On qcqs perfect F_p-schemes, arc-covers are exactly universally effective epimorphisms (BM21 Theorem 5.17). -/
theorem arcCover_iff_universallyEffectiveEpi (p : ℕ) [Fact p.Prime]
    {X Y : (QcqsPerfectFp.{u} p).FullSubcategory} (f : Y ⟶ X) :
    IsSchemeArcCover f.hom ↔
      ∀ (T P : (QcqsPerfectFp.{u} p).FullSubcategory) (g : T ⟶ X)
        (f' : P ⟶ T) (g' : P ⟶ Y),
        IsPullback g' f' f g → EffectiveEpi f' := by
  sorry

/-! ## Layer 10: Kunneth and affinoid vanishing -/

/-- Torsion is tested on the affine basis of the small étale site. -/
def IsTorsionEtaleSheaf (X : Scheme.{u})
    (F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u}) : Prop :=
  ∀ U : X.AffineEtale, IsAddTorsion (F.obj.obj (op ((Scheme.AffineEtale.Spec X).obj U)))

/-- Prime-power torsion is tested on the same affine basis. -/
def IsPrimePowerTorsionEtaleSheaf (X : Scheme.{u})
    (F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u}) (ℓ : ℕ) : Prop :=
  ∀ U : X.AffineEtale, ∀ x : F.obj.obj (op ((Scheme.AffineEtale.Spec X).obj U)),
    ∃ n : ℕ, ℓ ^ n • x = 0

/-- Arbitrary torsion étale cohomology of a d-dimensional affinoid vanishes above d+1 (BM21 Theorem 7.3(1)). -/
theorem affinoid_artin_grothendieck (K A : Type u) [NontriviallyNormedField K]
    [IsUltrametricDist K] [NonarchimedeanRing K] [CompleteSpace K] [IsAlgClosed K]
    [CommRing A] [TopologicalSpace A] [Algebra K A]
    (hA : TauCeti.Huber.IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (d : ℕ) [Ring.KrullDimLE d A]
    (F : Sheaf (Spec (CommRingCat.of A)).smallEtaleTopology AddCommGrpCat.{u})
    (hF : IsTorsionEtaleSheaf _ F) (q : ℕ) (hq : d + 1 < q) :
    Subsingleton (F.H q) := by
  sorry

/-- Residue-invertible prime-power torsion vanishes above d (BM21 Theorem 7.3(2)). -/
theorem affinoid_artin_grothendieck_prime_to_residue (K A : Type u)
    [NontriviallyNormedField K] [IsUltrametricDist K] [NonarchimedeanRing K]
    [CompleteSpace K] [IsAlgClosed K] [CommRing A] [TopologicalSpace A] [Algebra K A]
    (hA : TauCeti.Huber.IsStrictlyTopologicallyFiniteType (algebraMap K A))
    (d : ℕ) [Ring.KrullDimLE d A] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ‖(ℓ : K)‖ = 1)
    (F : Sheaf (Spec (CommRingCat.of A)).smallEtaleTopology AddCommGrpCat.{u})
    (hF : IsPrimePowerTorsionEtaleSheaf _ F ℓ) (q : ℕ) (hq : d < q) :
    Subsingleton (F.H q) := by
  sorry

end TauCetiRoadmap.ArcTopologyAndDescent
