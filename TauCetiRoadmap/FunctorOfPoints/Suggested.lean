module

public import Mathlib
public import TauCeti.Algebra.Category.CommAlgCat.Fppf
public import TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Basic

/-!
# The functor of points: suggested interfaces

`README.md` is the definitive specification. These are suggested forms, not an exhaustive
checklist. Definitions below have mathematical bodies; `sorry` occurs only in propositions
expressing roadmap targets. In particular, an equivalence is stated by its existence, rather
than by admitting a data-valued definition.

The affine site is `(CommAlgCat R)ᵒᵖ`; its presheaves have domain
`(CommAlgCat R)ᵒᵖᵒᵖ`. This records covariance in test algebras explicitly.
The following targets require carriers built in the README before they can be stated:
* §3.1: `tangentSpaceEquivDifferentials` and `tangentSpaceEquivZariski` require the
  `tangentSpace` module structure;
* §3.2: `formallySmooth_iff_points` requires the scheme-level `FormallySmooth` predicate
  supplied by SchemeAndStackFoundations §4.1;
* §6.3: `moduleEquivQuasicoherent` and §6.4
  `Module.isEquivalence_pullback_of_isLocallyBijective` require the coherent `Module F`
  carrier and its pullback functor from §6.1.
-/

public section

namespace TauCetiRoadmap.FunctorOfPoints

open CategoryTheory Opposite AlgebraicGeometry

universe u

variable (R : Type u) [CommRing R]

noncomputable def zariskiTopology : GrothendieckTopology (CommAlgCat.{u} R)ᵒᵖ :=
  (algSpec (CommRingCat.of R)).inducedTopology
    (Scheme.zariskiTopology.over (Spec (CommRingCat.of R)))

noncomputable def fpqcTopology : GrothendieckTopology (CommAlgCat.{u} R)ᵒᵖ :=
  (algSpec (CommRingCat.of R)).inducedTopology
    (Scheme.fpqcTopology.over (Spec (CommRingCat.of R)))

noncomputable def pointsFunctor :
    Over (Spec (CommRingCat.of R)) ⥤ ((CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) :=
  yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj (algSpec (CommRingCat.of R)).op

variable {R}

def IsOpenSubfunctor {F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u} (G : Subfunctor F) : Prop :=
  ∀ (A : CommAlgCat.{u} R) (x : F.obj (op (op A))), ∃ I : Ideal A,
    ∀ (B : CommAlgCat.{u} R) (φ : A ⟶ B),
      F.map φ.op.op x ∈ G.obj (op (op B)) ↔ Ideal.map φ.hom.toRingHom I = ⊤

def IsClosedSubfunctor {F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u} (G : Subfunctor F) : Prop :=
  ∀ (A : CommAlgCat.{u} R) (x : F.obj (op (op A))), ∃ I : Ideal A,
    ∀ (B : CommAlgCat.{u} R) (φ : A ⟶ B),
      F.map φ.op.op x ∈ G.obj (op (op B)) ↔ ∀ a ∈ I, φ.hom a = 0

/-- A cover is surjective locally on the affine site. -/
def JointlySurjectiveZariski {F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u} {ι : Type u}
    (U : ι → Subfunctor F) : Prop :=
  ∀ (A : CommAlgCat.{u} R) (x : F.obj (op (op A))),
    Sieve.generate (fun B (φ : B ⟶ op A) => ∃ i, F.map φ.op x ∈ (U i).obj (op B)) ∈
      zariskiTopology R (op A)

structure IsLocallyRepresentable (F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) : Prop where
  isSheaf : Presheaf.IsSheaf (zariskiTopology R) F
  exists_cover : ∃ (ι : Type u) (U : ι → Subfunctor F),
    (∀ i, IsOpenSubfunctor (U i)) ∧ (∀ i, (U i).toFunctor.IsRepresentable) ∧
      JointlySurjectiveZariski U

variable (R) in
abbrev LocallyRepresentable :=
  ObjectProperty.FullSubcategory fun F : Sheaf (zariskiTopology R) (Type u) =>
    IsLocallyRepresentable F.obj

/-- Every scheme gives a locally representable presheaf through the actual points functor. -/
theorem pointsFunctor_isLocallyRepresentable (X : Over (Spec (CommRingCat.of R))) :
    IsLocallyRepresentable ((pointsFunctor R).obj X) := by
  sorry

/-- Local representability characterizes the essential image of the actual points functor. -/
theorem isLocallyRepresentable_iff (F : (CommAlgCat.{u} R)ᵒᵖᵒᵖ ⥤ Type u) :
    IsLocallyRepresentable F ↔
      ∃ X : Over (Spec (CommRingCat.of R)), Nonempty ((pointsFunctor R).obj X ≅ F) := by
  sorry

/-- The comparison must identify the actual morphism with the subfunctor inclusion. -/
theorem isOpenImmersion_iff_points {X Y : Over (Spec (CommRingCat.of R))} (f : Y ⟶ X) :
    IsOpenImmersion f.left ↔
      ∃ G : Subfunctor ((pointsFunctor R).obj X), IsOpenSubfunctor G ∧
        ∃ e : (pointsFunctor R).obj Y ≅ G.toFunctor,
          (pointsFunctor R).map f = e.hom ≫ G.ι := by
  sorry

/-- Closed immersions are exactly the inclusions of closed subfunctors, with the map fixed. -/
theorem isClosedImmersion_iff_points {X Y : Over (Spec (CommRingCat.of R))} (f : Y ⟶ X) :
    IsClosedImmersion f.left ↔
      ∃ G : Subfunctor ((pointsFunctor R).obj X), IsClosedSubfunctor G ∧
        ∃ e : (pointsFunctor R).obj Y ≅ G.toFunctor,
          (pointsFunctor R).map f = e.hom ≫ G.ι := by
  sorry

/-- Over a locally Noetherian base, discrete valuation rings detect universal closedness
for finite type morphisms. -/
theorem universallyClosed_iff_dvr {X Y : Scheme.{u}} (f : X ⟶ Y)
    [IsLocallyNoetherian Y] [LocallyOfFiniteType f] [QuasiCompact f] :
    UniversallyClosed f ↔
      ∀ (S : ValuativeCommSq f) [IsDiscreteValuationRing S.R], S.commSq.HasLift := by
  sorry

/-- The Grassmannian of finite projective quotients is locally representable. -/
theorem grassmannian_isLocallyRepresentable (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] (k : ℕ) :
    IsLocallyRepresentable
      (unopUnop (CommAlgCat.{u} R) ⋙ Module.Grassmannian.functor (R := R) (M := M) k) := by
  sorry

theorem pointsFunctor_full : (pointsFunctor R).Full := by
  sorry

theorem pointsFunctor_faithful : (pointsFunctor R).Faithful := by
  sorry

/-- Check the interface against Tau Ceti's existing lifted points sheaf. -/
theorem pointsFunctorUliftIso_exists (X : Over (Spec (CommRingCat.of R))) :
    Nonempty ((pointsFunctor R).obj X ⋙ uliftFunctor.{u + 1, u} ≅
      (TauCeti.CommAlgCat.pointsSheaf X).obj) := by
  exact ⟨Iso.refl _⟩

/-- Affine comparison, naturally in the test object through the natural isomorphism. -/
theorem pointsFunctorAlgSpecIso_exists (B : CommAlgCat.{u} R) :
    Nonempty ((pointsFunctor R).obj ((algSpec (CommRingCat.of R)).obj (op B)) ≅
      yoneda.obj (op B)) := by
  sorry

end TauCetiRoadmap.FunctorOfPoints
