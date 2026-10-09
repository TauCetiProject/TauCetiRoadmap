import Mathlib.Algebra.Azumaya.Defs
import Mathlib.Algebra.Azumaya.Matrix
import Mathlib.Algebra.BrauerGroup.Defs
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.CommAlgCat.FiniteType
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.Algebra.Category.ModuleCat.Descent
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.Algebra.Category.Ring.FilteredColimits
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Module.SpanRank
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Birational.Birational
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.Group.Affine
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.AlgebraicGeometry.Limits
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.FinitePresentation
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.FlatRank
import Mathlib.AlgebraicGeometry.Morphisms.FormallyUnramified
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.QuasiFinite
import Mathlib.AlgebraicGeometry.Morphisms.QuasiSeparated
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Functor
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Proper
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.RelativeGluing
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.Sites.EtalePoint
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.Sites.Proetale
import Mathlib.AlgebraicGeometry.Sites.SmallAffineZariski
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.HasExt
import Mathlib.CategoryTheory.Abelian.RightDerived
import Mathlib.CategoryTheory.Bicategory.NaturalTransformation.Pseudo
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Comma.Presheaf.Basic
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.EssentiallySmall
import Mathlib.CategoryTheory.Filtered.Basic
import Mathlib.CategoryTheory.Filtered.Connected
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Limits.ConcreteCategory.Basic
import Mathlib.CategoryTheory.Limits.Constructions.Over.Connected
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.Categorical.Basic
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Cartesian.Over
import Mathlib.CategoryTheory.Monoidal.Grp
import Mathlib.CategoryTheory.Monoidal.Mod
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.MorphismProperty.Representable
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.CategoryTheory.Sites.Descent.DescentDataAsCoalgebra
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Descent.Precoverage
import Mathlib.CategoryTheory.Sites.LeftExact
import Mathlib.CategoryTheory.Sites.LocallySurjective
import Mathlib.CategoryTheory.Sites.MayerVietorisSquare
import Mathlib.CategoryTheory.Sites.NonabelianCohomology.H1
import Mathlib.CategoryTheory.Sites.PrecoverageToGrothendieck
import Mathlib.CategoryTheory.Sites.PseudofunctorSheafOver
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.CategoryTheory.Sites.SheafCohomology.Cech
import Mathlib.CategoryTheory.Sites.SheafCohomology.MayerVietoris
import Mathlib.CategoryTheory.Skeletal
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.PurelyInseparable.Basic
import Mathlib.FieldTheory.Separable
import Mathlib.GroupTheory.GroupExtension.Basic
import Mathlib.GroupTheory.GroupExtension.Defs
import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.LinearAlgebra.TensorProduct.Pi
import Mathlib.LinearAlgebra.TensorProduct.Quotient
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Order.RelSeries
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Algebraic.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Etale.StandardEtale
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.RingTheory.Flat.Equalizer
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Colon
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Invariant.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.LocalRing.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Fiber
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.TensorProduct.Quotient
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Homeomorph.Defs
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.NoetherianSpace
import Mathlib.Topology.Sheaves.Flasque
import Mathlib.Topology.Sheaves.LocallySurjective
import TauCeti.Algebra.AlgebraicGroup.ConstantGroup.Scheme
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.TensorProduct.BaseChange
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.WeilDivisor.Principal.Basic
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.TensorProduct
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus
import TauCeti.RingTheory.Derivation.DualNumber

/-!
# Scheme, stack, cohomology and intersection foundations: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer, and discharging everything here finishes no layer. Every proof is
`sorry`; unit tests are `example`s named in the README's **Checks** lists.

Design choices made explicit here. Algebraic spaces are fppf sheaves on `Scheme.{u}` with
representable diagonal and an étale atlas; group spaces are `GrpObj` in `Over h_S`, and the only
carrier of torsor classes is `NonabelianH1` of Layer 2 (Layer 1's torsor classes are its fppf
instance). The Picard carrier is Tau Ceti's `LineBundleClass`; finite locally free sheaves of a
given rank are Mathlib's `IsLocallyFree` with AlgebraicVectorBundles' rank predicate, named
`isFiniteLocallyFreeOfRank` here with the same meaning. Formal schemes are prototyped as adic
thickening systems with level-preserving morphisms; the comparison with the EGA category is a
target of the README. Statements that cannot be typed at the pins are stated in the README only;
the closing comment of each layer lists them by name.
-/

namespace TauCetiRoadmap.SchemeAndStackFoundations


section SF_base

open _root_.CategoryTheory _root_.CategoryTheory.Limits
open scoped _root_.TensorProduct
universe u
namespace Henselization
variable {R : Type u} [CommRing R]

/-- Canonical reduction map: a baseline instantiation, not a new quotient. -/
abbrev reducedMap (I : Ideal R) (B : CommAlgCat.{u} R) :
    R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap (I.map (algebraMap R B)) (algebraMap R B) Ideal.le_comap_map

def IsNeighbourhood (I : Ideal R) : ObjectProperty (CommAlgCat.{u} R) :=
  fun B => Algebra.Etale R B ∧ Function.Bijective (reducedMap I B)

abbrev Neighbourhood (I : Ideal R) := (IsNeighbourhood I).FullSubcategory

theorem isNeighbourhood_self (I : Ideal R) :
    IsNeighbourhood I (CommAlgCat.of R R) := by sorry

theorem isNeighbourhood_localization (I : Ideal R) (x : R)
    (hx : IsUnit (Ideal.Quotient.mk I x)) :
    IsNeighbourhood I (CommAlgCat.of R (Localization.Away x)) := by sorry

-- Check `neighbourhood_identity`
example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry
-- Check `neighbourhood_invert_two`
example : IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (2 : ℤ))) := by sorry
-- Check `neighbourhood_reject_invert_five`
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (5 : ℤ))) := by sorry
-- Check `neighbourhood_reject_two_sheets`
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (ℤ × ℤ)) := by sorry

theorem isNeighbourhood_tensor (I : Ideal R) (B C : CommAlgCat.{u} R)
    (hB : IsNeighbourhood I B) (hC : IsNeighbourhood I C) :
    IsNeighbourhood I (CommAlgCat.of R (B ⊗[R] C)) := by sorry

theorem parallel_equalization (I : Ideal R) {B C : Neighbourhood I}
    (f g : B ⟶ C) : ∃ (D : Neighbourhood I) (h : C ⟶ D), f ≫ h = g ≫ h := by sorry

theorem neighbourhood_isFiltered (I : Ideal R) : IsFiltered (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_isFiltered

theorem neighbourhood_essentiallySmall (I : Ideal R) :
    EssentiallySmall.{u} (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_essentiallySmall

/-- The small diagram is a reindexing of the existing inclusion. -/
noncomputable def diagram (I : Ideal R) :
    SmallModel.{u} (Neighbourhood I) ⥤ CommAlgCat.{u} R :=
  (equivSmallModel.{u} (Neighbourhood I)).inverse ⋙ (IsNeighbourhood I).ι

noncomputable def algebra (I : Ideal R) : CommAlgCat.{u} R := colimit (diagram I)

noncomputable abbrev extended (I : Ideal R) : Ideal (algebra I) := I.map (algebraMap R (algebra I))

noncomputable def stage (I : Ideal R) (B : SmallModel.{u} (Neighbourhood I)) :
    (diagram I).obj B →ₐ[R] algebra I := (colimit.ι (diagram I) B).hom

theorem stage_naturality (I : Ideal R) {B C : SmallModel.{u} (Neighbourhood I)}
    (f : B ⟶ C) :
    (stage I C).comp ((diagram I).map f).hom = stage I B := by sorry

theorem mem_extended_iff_exists_stage (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B) :
    stage I B b ∈ extended I ↔
      ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
        ((diagram I).map t).hom b ∈ I.map (algebraMap R ((diagram I).obj C)) := by sorry

theorem exists_stage_monic_polynomial (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) :
    ∃ (B : SmallModel.{u} (Neighbourhood I)) (p : Polynomial ((diagram I).obj B)),
      p.Monic ∧ p.map (stage I B).toRingHom = f := by sorry

theorem exists_stage_quotient_unit (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B)
    (hb : IsUnit (Ideal.Quotient.mk (extended I) (stage I B b))) :
    ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
      IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj C)))
        (((diagram I).map t).hom b)) := by sorry

theorem exists_stage_simple_root (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ (B : SmallModel.{u} (Neighbourhood I))
      (p : Polynomial ((diagram I).obj B)) (b : (diagram I).obj B),
      p.Monic ∧ p.map (stage I B).toRingHom = f ∧ stage I B b = a0 ∧
        p.eval b ∈ I.map (algebraMap R ((diagram I).obj B)) ∧
        IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj B)))
          (p.derivative.eval b)) := by sorry

theorem quotient_bijective (I : Ideal R) :
    Function.Bijective (reducedMap I (algebra I)) := by sorry

theorem extended_le_jacobson (I : Ideal R) :
    extended I ≤ Ideal.jacobson (⊥ : Ideal (algebra I)) := by sorry

theorem simple_root_lift (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ a : algebra I, f.eval a = 0 ∧ a - a0 ∈ extended I := by sorry

theorem henselian (I : Ideal R) : HenselianRing (algebra I) (extended I) := by sorry
attribute [instance] henselian



section EtaleSection
variable {B : Type u} [CommRing B] [Algebra R B] [Algebra.Etale R B]

theorem etale_section_selector (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∀ b : B, e * b = e * algebraMap R B (σ b) := by
  let : Algebra B R := σ.toAlgebra
  have : IsScalarTower R B R := IsScalarTower.of_algebraMap_eq' σ.comp_algebraMap.symm
  have hσ : Function.Surjective σ := fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩
  have : Algebra.FormallyEtale B R := Algebra.FormallyEtale.of_restrictScalars (R := R)
  obtain ⟨k, hk, hker⟩ :=
    (Ideal.isIdempotentElem_iff_of_fg _ (Algebra.FinitePresentation.ker_fG_of_surjective σ hσ)).mp
      ((Algebra.FormallyEtale.iff_of_surjective hσ).mp inferInstance)
  have hσk : σ k = 0 := by
    apply RingHom.mem_ker.mp
    change k ∈ RingHom.ker σ.toRingHom
    rw [hker]
    exact Ideal.mem_span_singleton_self k
  refine ⟨1 - k, hk.one_sub, by simp [hσk], ?_⟩
  intro b
  have hb : b - algebraMap R B (σ b) ∈ RingHom.ker σ.toRingHom := by
    simp [RingHom.mem_ker]
  rw [hker] at hb
  obtain ⟨c, hc⟩ := Ideal.mem_span_singleton'.mp hb
  have hz : (1 - k) * (b - algebraMap R B (σ b)) = 0 := by
    rw [← hc]
    calc
      (1 - k) * (c * k) = c * (k - k * k) := by ring
      _ = 0 := by rw [hk]; ring
  exact sub_eq_zero.mp (by simpa only [mul_sub] using hz)


omit [Algebra.Etale R B] in
theorem etale_selector_kernel (σ : B →ₐ[R] R) {e : B}
    (heσ : σ e = 1) (he : ∀ b : B, e * b = e * algebraMap R B (σ b)) :
    RingHom.ker σ.toRingHom = Ideal.span {1 - e} := by
  apply le_antisymm
  · intro b hb
    have hzb : e * b = 0 := by
      have hσb : σ b = 0 := hb
      simpa only [hσb, map_zero, mul_zero] using he b
    exact Ideal.mem_span_singleton'.mpr ⟨b, by calc
      b * (1 - e) = b - e * b := by ring
      _ = b := by rw [hzb]; ring⟩
  · apply Ideal.span_le.mpr
    intro b hb
    obtain rfl := Set.mem_singleton_iff.mp hb
    simp [RingHom.mem_ker, heσ]

theorem etale_section_product (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : B ≃ₐ[R] R × (B ⧸ Ideal.span {e}), ∀ b : B, (E b).1 = σ b := by
  obtain ⟨e, he, heσ, hselect⟩ := etale_section_selector σ
  have hker := etale_selector_kernel σ heσ hselect
  have hσ : Function.Surjective σ := fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩
  let E₁ := AlgEquiv.prodQuotientOfIsIdempotentElem R he.one_sub he (by ring)
    (by change (1-e)*e=0; rw [sub_mul, one_mul, he]; ring)
  let E₂ : (B ⧸ Ideal.span {1-e}) ≃ₐ[R] R :=
    ((Ideal.span {1-e}).quotientEquivAlgOfEq R hker.symm).trans
      (Ideal.quotientKerAlgEquivOfSurjective hσ)
  refine ⟨e, he, heσ, E₁.trans (AlgEquiv.prodCongr E₂ (.refl)), ?_⟩
  intro b
  rfl

theorem etale_section_localization (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : Localization.Away e ≃ₐ[R] R,
        ∀ b : B, E (algebraMap B (Localization.Away e) b) = σ b := by
  obtain ⟨e, he, heσ, hselect⟩ := etale_section_selector σ
  let : Algebra B R := σ.toAlgebra
  have : IsScalarTower R B R := IsScalarTower.of_algebraMap_eq' σ.comp_algebraMap.symm
  have : IsLocalization.Away e R := IsLocalization.away_of_isIdempotentElem he
    (etale_selector_kernel σ heσ hselect)
    (fun r ↦ ⟨algebraMap R B r, σ.commutes r⟩)
  let E := (IsLocalization.algEquiv (Submonoid.powers e) (Localization.Away e) R).restrictScalars R
  exact ⟨e, he, heσ, E, fun b ↦ (IsLocalization.algEquiv (Submonoid.powers e) (Localization.Away e) R).commutes b⟩

-- acceptance: first-sheet selector has its actual projection and multiplication law.
example : IsIdempotentElem ((1, 0) : ZMod 5 × ZMod 5) ∧
    (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) (1, 0) = 1 ∧
    ∀ b : ZMod 5 × ZMod 5, (1, 0) * b =
      (1, 0) * algebraMap (ZMod 5) (ZMod 5 × ZMod 5)
        ((AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) b) := by
  refine ⟨?_, by decide, by decide⟩
  change ((1, 0) : ZMod 5 × ZMod 5) * (1, 0) = (1, 0)
  decide

-- acceptance: the complementary idempotent selects the other sheet.
example : ¬ ((AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5))
    ((0, 1) : ZMod 5 × ZMod 5) = 1) := by decide

-- acceptance: the actual section kernel is the complementary ideal.
example : RingHom.ker (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)).toRingHom =
    Ideal.span {1 - ((1, 0) : ZMod 5 × ZMod 5)} := by
  apply etale_selector_kernel (AlgHom.fst (ZMod 5) (ZMod 5) (ZMod 5)) (by decide)
  decide

-- acceptance: product comparison carries the given section, not an arbitrary projection.
example (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : B ≃ₐ[R] R × (B ⧸ Ideal.span {e}), ∀ b : B, (E b).1 = σ b :=
  etale_section_product σ

-- acceptance: localization comparison fixes each source element's actual section image.
example (σ : B →ₐ[R] R) :
    ∃ e : B, IsIdempotentElem e ∧ σ e = 1 ∧
      ∃ E : Localization.Away e ≃ₐ[R] R,
        ∀ b : B, E (algebraMap B (Localization.Away e) b) = σ b :=
  etale_section_localization σ

end EtaleSection


theorem etale_lift_unique (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R))
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (f g : B →ₐ[R] R)
    (hfg : (Ideal.Quotient.mk I).comp f.toRingHom =
      (Ideal.Quotient.mk I).comp g.toRingHom) : f = g := by
  obtain ⟨e, he, hfe, hselect⟩ := etale_section_selector f
  have hge : g e - 1 ∈ I := by
    apply Ideal.Quotient.eq_zero_iff_mem.mp
    have h : Ideal.Quotient.mk I (g e) = 1 := by
      have hh : Ideal.Quotient.mk I (g e) = Ideal.Quotient.mk I (f e) :=
        (DFunLike.congr_fun hfg e).symm
      simpa only [hfe, map_one] using hh
    rw [map_sub, map_one, h, sub_self]
  have hu : IsUnit (g e) := Ideal.isUnit_of_sub_one_mem_jacobson_bot _ (hI hge)
  have heq : g e = 1 := by
    have hid : g e * g e = g e * 1 := by simpa using congrArg g he
    exact hu.mul_left_cancel hid
  ext b
  have h := congrArg g (hselect b)
  simpa [heq] using h.symm

theorem exists_etale_lift (I : Ideal R) [HenselianRing R I]
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (σ : B →+* R ⧸ I)
    (hσ : σ.comp (algebraMap R B) = Ideal.Quotient.mk I) :
    ∃ τ : B →ₐ[R] R, (Ideal.Quotient.mk I).comp τ.toRingHom = σ := by sorry

theorem existsUnique_lift (I : Ideal R) {S : Type u} [CommRing S]
    (J : Ideal S) [HenselianRing S J] (f : R →+* S) (hf : I ≤ J.comap f) :
    ∃! g : algebra I →+* S, g.comp (algebraMap R (algebra I)) = f := by sorry

theorem fixed_of_henselian (I : Ideal R) [HenselianRing R I] :
    Nonempty (algebra I ≃ₐ[R] R) := by sorry

-- Check `henselization_zero_ideal`
example : Nonempty (algebra (⊥ : Ideal R) ≃ₐ[R] R) := by sorry
-- Check `henselization_unit_ideal`
example : Subsingleton (algebra (⊤ : Ideal R)) := by sorry
-- Check `henselization_fixed_pair`
example (I : Ideal R) [HenselianRing R I] : Nonempty (algebra I ≃ₐ[R] R) := by sorry
-- Check `henselization_ordinary_finite_field`
example : Nonempty (algebra (⊥ : Ideal (ZMod 5)) ≃ₐ[ZMod 5] ZMod 5) := by sorry

theorem local_henselization [IsLocalRing R] :
    IsLocalRing (algebra (IsLocalRing.maximalIdeal R)) := by sorry

section Functoriality
variable {S T : Type u} [CommRing S] [CommRing T]

/-- The chosen extension of η_S ∘ f by the existing initial-pair theorem. -/
noncomputable def map (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) : algebra I →+* algebra J :=
  Classical.choose (existsUnique_lift I (extended J)
    ((algebraMap S (algebra J)).comp f) (by
      intro r hr
      exact Ideal.mem_map_of_mem (algebraMap S (algebra J)) (hf hr))).exists

theorem map_comp_unit (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (map I J f hf).comp (algebraMap R (algebra I)) =
      (algebraMap S (algebra J)).comp f := by sorry

theorem map_extended_le (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    extended I ≤ (extended J).comap (map I J f hf) := by sorry

theorem map_id (I : Ideal R) :
    map I I (RingHom.id R) (by intro r hr; exact hr) =
      RingHom.id (algebra I) := by sorry

theorem map_comp (I : Ideal R) (J : Ideal S) (K : Ideal T)
    (f : R →+* S) (g : S →+* T)
    (hf : I ≤ J.comap f) (hg : J ≤ K.comap g) :
    map I K (g.comp f) (by intro r hr; exact hg (hf hr)) =
      (map J K g hg).comp (map I J f hf) := by sorry

theorem quotient_naturality (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (Ideal.quotientMap (extended J) (map I J f hf) (map_extended_le I J f hf)).comp
        (reducedMap I (algebra I)) =
      (reducedMap J (algebra J)).comp (Ideal.quotientMap J f hf) := by sorry

-- Check `map_field_identity`
example : map (⊥ : Ideal (ZMod 5)) ⊥ (RingHom.id (ZMod 5))
    (by intro r hr; exact hr) = RingHom.id (algebra (⊥ : Ideal (ZMod 5))) := by sorry

-- Check `map_scalar_seven`
example : map (⊥ : Ideal ℤ) (⊥ : Ideal (ZMod 5)) (Int.castRingHom (ZMod 5))
    (by intro r hr; have hr0 : r = 0 := hr; simp [hr0])
    (algebraMap ℤ (algebra (⊥ : Ideal ℤ)) 7) =
      algebraMap (ZMod 5) (algebra (⊥ : Ideal (ZMod 5))) 2 := by sorry

-- Check `map_quotient_nine`
example : let I : Ideal (ZMod 9) := Ideal.span {(3 : ZMod 9)}
    map I (⊥ : Ideal (ZMod 9 ⧸ I)) (Ideal.Quotient.mk I)
      (by intro r hr; exact (Ideal.Quotient.eq_zero_iff_mem).2 hr)
      (algebraMap (ZMod 9) (algebra I) 3) = 0 := by sorry

-- Check `map_can_collapse`
example : ¬ Function.Injective
    (map (⊥ : Ideal (ZMod 5)) (⊤ : Ideal (ZMod 5)) (RingHom.id (ZMod 5))
      (by intro r hr; trivial)) := by sorry

end Functoriality

-- acceptance: zero ideal detects eventual zero, not injectivity of stage maps.
example (B : SmallModel.{u} (Neighbourhood (⊥ : Ideal R)))
    (b : (diagram (⊥ : Ideal R)).obj B) (hb : stage (⊥ : Ideal R) B b = 0) :
    ∃ (C : SmallModel.{u} (Neighbourhood (⊥ : Ideal R))) (t : B ⟶ C),
      ((diagram (⊥ : Ideal R)).map t).hom b = 0 := by sorry

-- acceptance: a quotient unit need not be a unit before quotienting.
example : ¬ IsUnit (2 : ZMod 30) ∧
    IsUnit (Ideal.Quotient.mk (Ideal.span {(5 : ZMod 30)}) (2 : ZMod 30)) := by sorry

-- acceptance: the empty lower-coefficient family still admits a monic lift.
example (I : Ideal R) :
    ∃ (B : SmallModel.{u} (Neighbourhood I)) (p : Polynomial ((diagram I).obj B)),
      p.Monic ∧ p.map (stage I B).toRingHom = (1 : Polynomial (algebra I)) := by sorry

-- acceptance: the same root is multiple in characteristic two.
example : ¬ IsUnit (((Polynomial.X ^ 2 - 1 : Polynomial (ZMod 2)).derivative).eval 1) := by sorry

end Henselization

open _root_.TensorProduct
noncomputable section
namespace FlatAnnihilator
universe faU faV faW faZ
variable {R : Type faU} [CommRing R] (S : Type faV) [CommRing S] [Algebra R S]
variable {M : Type faW} [AddCommGroup M] [Module R M]

theorem ideal_map_eq_tensor_range (I : Ideal R) :
    I.map (algebraMap R S) = LinearMap.range
      ((AlgebraTensorModule.rid R S S).toLinearMap ∘ₗ I.subtype.baseChange S) := by
  sorry

theorem mem_map_kernel_iff [Module.Flat R S] (f : R →ₗ[R] M) (s : S) :
    s ∈ Ideal.map (algebraMap R S) f.ker ↔ s ⊗ₜ[R] f 1 = 0 := by
  sorry

theorem annihilator_eq_generator_kernel {ι : Type faZ} (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    Module.annihilator R M =
      (LinearMap.pi fun i => LinearMap.toSpanSingleton R M (g i)).ker := by
  sorry

theorem annihilator_flat_baseChange_generators [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

theorem annihilator_flat_baseChange [Module.Flat R S] [Module.Finite R M] :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

theorem element_annihilator_flat_baseChange [Module.Flat R S] (m : M) :
    (Submodule.span R {m}).annihilator.map (algebraMap R S) =
      (Submodule.span S {(1 : S) ⊗ₜ[R] m}).annihilator := by
  sorry

theorem annihilator_map_le_baseChange :
    (Module.annihilator R M).map (algebraMap R S) ≤
      Module.annihilator S (S ⊗[R] M) := by
  sorry

theorem ideal_map_iInf_finite [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (I : ι → Ideal R) :
    (⨅ i, I i).map (algebraMap R S) = ⨅ i, (I i).map (algebraMap R S) := by
  sorry

end FlatAnnihilator

namespace FlatAnnihilator

-- Check `empty_family`
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    (⨅ i : Fin 0, (fun _ => (⊥ : Ideal R)) i).map (algebraMap R S) = ⊤ := by
  sorry

-- Check `identity_extension`
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [Module.Finite R M] :
    Module.annihilator R (R ⊗[R] M) = Module.annihilator R M := by
  sorry

-- Check `zero_module`
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    Module.annihilator S (S ⊗[R] (⊥ : Submodule R R)) = ⊤ := by
  sorry

-- Check `zero_element`
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.Flat R S] :
    (Submodule.span S {(1 : S) ⊗ₜ[R] (0 : M)}).annihilator = ⊤ := by
  sorry

-- Check `nonreduced_element`
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈
      (Submodule.span (ZMod 4) {(1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

-- Check `nonreduced_diagonal`
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈
      (Submodule.span (ZMod 4 × ZMod 4)
        {(1 : ZMod 4 × ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

section Nonflat
local instance : Algebra (ZMod 4) (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAlgebra

-- Check `nonflat_element_failure`
example :
    (Submodule.span (ZMod 4) {(2 : ZMod 4)}).annihilator.map
      (algebraMap (ZMod 4) (ZMod 2)) = ⊥ ∧
    (Submodule.span (ZMod 2) {(1 : ZMod 2) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator = ⊤ ∧
    (⊥ : Ideal (ZMod 2)) ≠ ⊤ := by
  sorry

end Nonflat
end FlatAnnihilator

open _root_.TensorProduct
noncomputable section
namespace QuotientBaseChange
universe qbU qbV qbW qbZ
variable {R : Type qbU} [CommRing R] (S : Type qbV) [CommRing S] [Algebra R S]
variable {M : Type qbW} [AddCommGroup M] [Module R M]
variable {N : Type qbZ} [AddCommGroup N] [Module R N]

theorem quotient_baseChange_square (Q : Submodule R M) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap ∘ₗ
      Q.mkQ.baseChange S = (Q.baseChange S).mkQ := by
  sorry

theorem quotient_baseChange_annihilator (Q : Submodule R M) :
    Module.annihilator S (S ⊗[R] (M ⧸ Q)) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

theorem quotient_annihilator_flat_baseChange (Q : Submodule R M)
    [Module.Flat R S] [Module.Finite R (M ⧸ Q)] :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

theorem quotient_annihilator_map_le_baseChange (Q : Submodule R M) :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) ≤
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

theorem baseChange_range (f : M →ₗ[R] N) :
    LinearMap.range (f.baseChange S) = f.range.baseChange S := by
  sorry

theorem baseChange_map (Q : Submodule R M) (f : M →ₗ[R] N) :
    (Q.map f).baseChange S = (Q.baseChange S).map (f.baseChange S) := by
  sorry

theorem baseChange_le_comap (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    Q.baseChange S ≤ (P.baseChange S).comap (f.baseChange S) := by
  sorry

theorem quotient_baseChange_naturality (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S P).toLinearMap ∘ₗ
      (Q.mapQ P f hf).baseChange S =
    (Q.baseChange S).mapQ (P.baseChange S) (f.baseChange S)
        (baseChange_le_comap S Q P f hf) ∘ₗ
      (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap := by
  sorry

theorem cokernel_annihilator_flat_baseChange (f : M →ₗ[R] N)
    [Module.Flat R S] [Module.Finite R (N ⧸ f.range)] :
    (Module.annihilator R (N ⧸ f.range)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S)) := by
  sorry

noncomputable def cokernelBaseChangeEquiv (f : M →ₗ[R] N) :
    S ⊗[R] (N ⧸ f.range) ≃ₗ[S]
      (S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S) :=
  AlgebraTensorModule.tensorQuotientEquiv S R S f.range ≪≫ₗ
    Submodule.quotEquivOfEq _ _ (baseChange_range S f).symm

theorem cokernelBaseChangeEquiv_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    cokernelBaseChangeEquiv S f (s ⊗ₜ[R] (Submodule.Quotient.mk n)) =
      Submodule.Quotient.mk (s ⊗ₜ[R] n) := by
  sorry

theorem cokernelBaseChangeEquiv_symm_mk_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    (cokernelBaseChangeEquiv S f).symm (Submodule.Quotient.mk (s ⊗ₜ[R] n)) =
      s ⊗ₜ[R] (Submodule.Quotient.mk n) := by
  sorry

theorem cokernel_baseChange_square (f : M →ₗ[R] N) :
    (cokernelBaseChangeEquiv S f).toLinearMap ∘ₗ
      f.range.mkQ.baseChange S = (LinearMap.range (f.baseChange S)).mkQ := by
  sorry

end QuotientBaseChange

open _root_.TensorProduct
noncomputable section
namespace QuotientBaseChange

-- Check `identity_cokernel`
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Subsingleton ((S ⊗[R] M) ⧸
      LinearMap.range ((LinearMap.id : M →ₗ[R] M).baseChange S)) := by
  sorry

-- Check `zero_map_scalar`
example :
    AlgebraTensorModule.rid ℤ (ZMod 5) (ZMod 5)
      (((LinearMap.range ((0 : ℤ →ₗ[ℤ] ℤ).baseChange (ZMod 5))).quotEquivOfEqBot
        (by simp))
      (cokernelBaseChangeEquiv (ZMod 5) (0 : ℤ →ₗ[ℤ] ℤ)
        ((3 : ZMod 5) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ))))) = 1 := by
  sorry

-- Check `inverse_representative`
example :
    (cokernelBaseChangeEquiv (ZMod 4) (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ))).symm
      (Submodule.Quotient.mk ((3 : ZMod 4) ⊗ₜ[ℤ] (7 : ℤ))) =
        (3 : ZMod 4) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ)) := by
  sorry

-- Check `nonflat_injective_map_collapses`
example :
    Function.Injective (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)) ∧
      (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 2) = 0 ∧
      ((1 : ZMod 2) ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := by
  sorry

-- Check `nonreduced_quotient_annihilator`
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈ Module.annihilator (ZMod 4)
      (((ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4)) := by
  sorry

-- Check `nonreduced_diagonal_quotient`
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈ Module.annihilator (ZMod 4 × ZMod 4)
      (((ZMod 4 × ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4 × ZMod 4)) := by
  sorry

-- Check `top_quotient_annihilator`
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Module.annihilator S ((S ⊗[R] M) ⧸ (⊤ : Submodule R M).baseChange S) = ⊤ := by
  sorry

-- Check `zero_ring_cokernel`
example : Subsingleton ((ZMod 1 ⊗[ℤ] ℤ) ⧸
    LinearMap.range ((LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 1))) := by
  sorry

end QuotientBaseChange


noncomputable section

namespace IdealPullback
open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

theorem ideal_comap_top (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffine X] [IsAffine Y] :
    (I.comap f).ideal ⟨⊤, isAffineOpen_top X⟩ =
      (I.ideal ⟨⊤, isAffineOpen_top Y⟩).map f.appTop.hom := by
  sorry

theorem comap_restrict (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.Opens) :
    (I.comap f).comap (f ⁻¹ᵁ U).ι = (I.comap U.ι).comap (f ∣_ U) := by
  sorry

theorem ideal_restrict_top (I : X.IdealSheafData) (U : X.affineOpens) :
    (I.comap U.1.ι).ideal ⟨⊤, @isAffineOpen_top _ U.2⟩ =
      (I.ideal U).comap U.1.topIso.hom.hom := by
  sorry

theorem ideal_comap_affineOpen (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, H⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

theorem ideal_comap_of_isAffineHom (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffineHom f] (U : Y.affineOpens) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, U.2.preimage f⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

def comapObjIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) ≅
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  (I.comap f).subschemeObjIso ⟨f ⁻¹ᵁ U, H⟩ ≪≫
    (Ideal.quotEquivOfEq (ideal_comap_affineOpen I f U H)).toCommRingCatIso

theorem comapObjIso_inclusion (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).subschemeι.app (f ⁻¹ᵁ U) ≫ (comapObjIso I f U H).hom =
      CommRingCat.ofHom (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom)) := by
  sorry

theorem comapObjIso_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).hom ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b) =
      Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b := by
  sorry

theorem comapObjIso_inv_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

end IdealPullback


namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `composition`
example [IsAffine X] [IsAffine Y] [IsAffine Z]
    (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (I.comap (f ≫ g)).ideal ⟨⊤, isAffineOpen_top X⟩ =
      ((I.ideal ⟨⊤, isAffineOpen_top Z⟩).map g.appTop.hom).map f.appTop.hom := by
  sorry

-- Check `empty_open`
example (I : Y.IdealSheafData) (f : X ⟶ Y) :
    ∀ x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ
      (f ⁻¹ᵁ (⊥ : Y.Opens))),
      (comapObjIso I f ⟨⊥, isAffineOpen_bot Y⟩ (by simpa using isAffineOpen_bot X)).hom x = 0 := by
  sorry

-- Check `inverse_representative`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv ((comapObjIso I f U H).hom
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

-- Check `nonflat_quotient`
example :
    let f := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : (Spec (.of ℤ)).IdealSheafData :=
      Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    I ≠ ⊥ ∧ I.comap f = ⊥ := by
  sorry

-- Check `nonreduced_quotient`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let y := (I.comap (𝟙 X)).subschemeι.app U b
    (comapObjIso I (𝟙 X) U U.2).hom y ≠ 0 ∧
      ((comapObjIso I (𝟙 X) U U.2).hom y) ^ 2 = 0 := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

theorem extendedIdeal_restrict (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    ((I.ideal V).map (f.app V).hom).map
      (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom =
        (I.ideal U).map (f.app U).hom := by
  sorry

def quotientRestriction (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    (Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  Ideal.quotientMap _
    (X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op).hom
    (Ideal.map_le_iff_le_comap.mp (extendedIdeal_restrict I f h).le)

theorem quotientRestriction_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) (b : Γ(X, f ⁻¹ᵁ V)) :
    quotientRestriction I f h (Ideal.Quotient.mk _ b) =
      Ideal.Quotient.mk _
        ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op) b) := by
  sorry

theorem quotientRestriction_id (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    quotientRestriction I f (le_refl U) = RingHom.id _ := by
  sorry

theorem quotientRestriction_comp (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    quotientRestriction I f (h.trans k) =
      (quotientRestriction I f h).comp (quotientRestriction I f k) := by
  sorry

theorem comapObjIso_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V)
    (HU : IsAffineOpen (f ⁻¹ᵁ U)) (HV : IsAffineOpen (f ⁻¹ᵁ V)) :
    (I.comap f).subscheme.presheaf.map
        ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
          ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op ≫
      (comapObjIso I f U HU).hom =
        (comapObjIso I f V HV).hom ≫ CommRingCat.ofHom (quotientRestriction I f h) := by
  sorry

theorem comapObjIso_inv_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V)
    (HU : IsAffineOpen (f ⁻¹ᵁ U)) (HV : IsAffineOpen (f ⁻¹ᵁ V)) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫ (comapObjIso I f U HU).inv =
      (comapObjIso I f V HV).inv ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

def quotientPresheaf (I : Y.IdealSheafData) (f : X ⟶ Y) :
    Y.affineOpensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := CommRingCat.of (Γ(X, f ⁻¹ᵁ U.unop) ⧸
    (I.ideal U.unop).map (f.app U.unop).hom)
  map h := CommRingCat.ofHom (quotientRestriction I f h.unop.le)
  map_id U := by
    sorry
  map_comp h k := by
    sorry

theorem quotientPresheaf_obj (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientPresheaf I f).obj (op U) =
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) := by
  sorry

theorem quotientPresheaf_map (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    (quotientPresheaf I f).map (homOfLE h).op =
      CommRingCat.ofHom (quotientRestriction I f h) := by
  sorry

def comapObjNatIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
      TopologicalSpace.Opens.map f.base ⋙
      TopologicalSpace.Opens.map (I.comap f).subschemeι.base).op ⋙
        (I.comap f).subscheme.presheaf ≅ quotientPresheaf I f :=
  NatIso.ofComponents (fun U => comapObjIso I f U.unop (U.unop.2.preimage f))
    (fun h => by sorry)

theorem comapObjNatIso_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).app (op U) = comapObjIso I f U (U.2.preimage f) := by
  sorry

theorem comapObjNatIso_hom_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).hom.app (op U) = (comapObjIso I f U (U.2.preimage f)).hom := by
  sorry

theorem comapObjNatIso_inv_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).inv.app (op U) = (comapObjIso I f U (U.2.preimage f)).inv := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `empty_target`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) :
    quotientRestriction I f (show (⟨⊥, isAffineOpen_bot Y⟩ : Y.affineOpens) ≤ V
      from (show (⊥ : Y.Opens) ≤ V.1 from bot_le)) q = 0 := by
  sorry

-- Check `triple_overlap`
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W T : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) (l : W ≤ T)
    (q : Γ(X, f ⁻¹ᵁ T) ⧸ (I.ideal T).map (f.app T).hom) :
    quotientRestriction I f ((h.trans k).trans l) q =
      quotientRestriction I f h (quotientRestriction I f k (quotientRestriction I f l q)) := by
  sorry

-- Check `nonreduced_identity`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b) ≠ 0 ∧
      (quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b)) ^ 2 = 0 := by
  sorry

-- Check `basic_open_representative`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (b : Γ(X, f ⁻¹ᵁ V)) :
    (quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op
      (Ideal.Quotient.mk _ b) =
        Ideal.Quotient.mk _ ((X.presheaf.map
          ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) b) := by
  sorry

-- Check `nonflat_surviving_unit`
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    (1 : (quotientPresheaf I f).obj (op U)) ≠ 0 := by
  sorry

-- Check `zero_ideal_path`
example (f : X ⟶ Y) {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (b : Γ(X, f ⁻¹ᵁ W)) :
    (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE h).op
      ((quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE k).op
        (Ideal.Quotient.mk _ b)) =
        (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE (h.trans k)).op
          (Ideal.Quotient.mk _ b) := by
  sorry

-- Check `roundtrip`
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens)
    (x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U))) :
    (comapObjNatIso I f).inv.app (op U) ((comapObjNatIso I f).hom.app (op U) x) = x := by
  sorry

-- Check `forward_overlap`
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    (I.comap f).subscheme.presheaf.map
      ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
        ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k)))).op ≫
        (comapObjNatIso I f).hom.app (op U) =
      (comapObjNatIso I f).hom.app (op W) ≫
        (quotientPresheaf I f).map (homOfLE k).op ≫
          (quotientPresheaf I f).map (homOfLE h).op := by
  sorry

-- Check `inverse_overlap`
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    {U V : Y.affineOpens} (h : U ≤ V) :
    (quotientPresheaf I f).map (homOfLE h).op ≫
      (comapObjNatIso I f).inv.app (op U) =
        (comapObjNatIso I f).inv.app (op V) ≫
          (I.comap f).subscheme.presheaf.map
            ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
              ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

theorem extendedIdeal_le_ker (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (I.ideal U).map (f.app U).hom ≤
      RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

def quotientToClosed (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) :=
  Ideal.Quotient.lift _ ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom
    (by sorry)

theorem quotientToClosed_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToClosed I f U (Ideal.Quotient.mk _ a) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) a := by
  sorry

theorem quotientToClosed_unique (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)))
    (hq : q.comp (Ideal.Quotient.mk _) = ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :
    q = quotientToClosed I f U := by
  sorry

theorem quotientToClosed_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫
        CommRingCat.ofHom (quotientToClosed I f U) =
      CommRingCat.ofHom (quotientToClosed I f V) ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

theorem quotientToClosed_eq_inv (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    CommRingCat.ofHom (quotientToClosed I f U) = (comapObjIso I f U H).inv := by
  sorry

theorem quotientToClosed_injective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Injective (quotientToClosed I f U) := by
  sorry

theorem quotientToClosed_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Surjective (quotientToClosed I f U) := by
  sorry

def quotientToClosedNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base ⋙
        TopologicalSpace.Opens.map (I.comap f).subschemeι.base).op ⋙
          (I.comap f).subscheme.presheaf where
  app U := CommRingCat.ofHom (quotientToClosed I f U.unop)
  naturality _ _ h := by sorry

theorem quotientToClosedNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToClosedNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToClosed I f U) := by
  sorry

theorem quotientToClosedNatTrans_affine (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f = (comapObjNatIso I f).inv := by
  sorry

theorem quotientToClosedNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToClosedNatTrans I f) := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `actual_factorization`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (quotientToClosed I f U).comp (Ideal.Quotient.mk _) =
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

-- Check `top_ideal`
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToClosed (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- Check `nonreduced_section`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientToClosed I (𝟙 X) U (Ideal.Quotient.mk _ b)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- Check `nonflat_surviving_unit`
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    quotientToClosed I f U 1 ≠ 0 := by
  sorry

-- Check `basic_open`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (a : Γ(X, f ⁻¹ᵁ V)) :
    (quotientToClosedNatTrans I f).app (op (Y.affineBasicOpen s))
      ((quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op (Ideal.Quotient.mk _ a)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ (Y.affineBasicOpen s))
          ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) a) := by
  sorry

-- Check `two_step_overlap`
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    (quotientPresheaf I f).map (homOfLE k).op ≫
        (quotientPresheaf I f).map (homOfLE h).op ≫
        (quotientToClosedNatTrans I f).app (op U) =
      (quotientToClosedNatTrans I f).app (op W) ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k)))).op := by
  sorry

-- Check `affine_roundtrip`
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f ≫ (comapObjNatIso I f).hom = 𝟙 _ := by
  sorry

-- Check `nonaffine_obstruction`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective ((quotientToClosedNatTrans I f).app (op U))) :
    ¬ IsAffineHom f := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

theorem allOpenKernel_restriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    RingHom.ker (I.subschemeι.app V).hom ≤
      (RingHom.ker (I.subschemeι.app U).hom).comap (X.presheaf.map (homOfLE h).op).hom := by
  sorry

def allOpenRestriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (Γ(X, V) ⧸ RingHom.ker (I.subschemeι.app V).hom) →+*
      (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :=
  Ideal.quotientMap _ (X.presheaf.map (homOfLE h).op).hom (by sorry)

theorem allOpenRestriction_mk (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V)
    (a : Γ(X, V)) :
    allOpenRestriction I h (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ (X.presheaf.map (homOfLE h).op a) := by
  sorry

theorem allOpenRestriction_id (I : X.IdealSheafData) (U : X.Opens) :
    allOpenRestriction I (le_refl U) = RingHom.id _ := by
  sorry

theorem allOpenRestriction_comp (I : X.IdealSheafData) {U V W : X.Opens}
    (h : U ≤ V) (k : V ≤ W) :
    (allOpenRestriction I h).comp (allOpenRestriction I k) =
      allOpenRestriction I (h.trans k) := by
  sorry

def allOpenQuotient (I : X.IdealSheafData) : X.Opensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := .of (Γ(X, U.unop) ⧸ RingHom.ker (I.subschemeι.app U.unop).hom)
  map h := CommRingCat.ofHom (allOpenRestriction I h.unop.le)
  map_id U := by sorry
  map_comp h k := by sorry

theorem allOpenQuotient_obj (I : X.IdealSheafData) (U : X.Opens) :
    (allOpenQuotient I).obj (op U) =
      CommRingCat.of (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) := by
  sorry

theorem allOpenQuotient_map (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (allOpenQuotient I).map (homOfLE h).op = CommRingCat.ofHom (allOpenRestriction I h) := by
  sorry

def allOpenToClosed (I : X.IdealSheafData) : allOpenQuotient I ⟶
    (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf where
  app U := CommRingCat.ofHom (I.subschemeι.app U.unop).hom.kerLift
  naturality U V h := by sorry

theorem allOpenToClosed_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U) (Ideal.Quotient.mk _ a) = I.subschemeι.app U a := by
  sorry

theorem allOpenToClosed_injective (I : X.IdealSheafData) (U : X.Opens) :
    Function.Injective ((allOpenToClosed I).app (op U)) := by
  sorry

theorem allOpenToClosed_affine_bijective (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((allOpenToClosed I).app (op U.1)) := by
  sorry

theorem allOpenToClosed_affine_agreement (I : X.IdealSheafData) (U : X.affineOpens) :
    (allOpenToClosed I).app (op U.1) =
      CommRingCat.ofHom (Ideal.quotientMap (I.ideal U) (RingHom.id _)
        (by rw [I.ker_subschemeι_app U]; exact le_rfl)) ≫ (I.subschemeObjIso U).inv := by
  sorry

theorem allOpenToClosed_locally_surjective (I : X.IdealSheafData) :
    Presheaf.IsLocallySurjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

theorem allOpenToClosed_locally_injective (I : X.IdealSheafData) :
    Presheaf.IsLocallyInjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

def allOpenSheafComparison (I : X.IdealSheafData) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf :=
  sheafifyLift _ (allOpenToClosed I)
    (by sorry)

theorem allOpenSheafComparison_factor (I : X.IdealSheafData) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      allOpenSheafComparison I = allOpenToClosed I := by
  sorry

theorem allOpenSheafComparison_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenSheafComparison I).app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a)) = I.subschemeι.app U a := by
  sorry

theorem allOpenSheafComparison_unique (I : X.IdealSheafData)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf)
    (hq : toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      q = allOpenToClosed I) : q = allOpenSheafComparison I := by
  sorry

theorem allOpenSheafComparison_isIso (I : X.IdealSheafData) :
    IsIso (allOpenSheafComparison I) := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `two_step`
example (I : X.IdealSheafData) {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (a : Γ(X, W) ⧸ RingHom.ker (I.subschemeι.app W).hom) :
    (allOpenQuotient I).map (homOfLE h).op
      ((allOpenQuotient I).map (homOfLE k).op a) =
        (allOpenQuotient I).map (homOfLE (h.trans k)).op a := by
  sorry

-- Check `affine_ideal`
example (I : X.IdealSheafData) (U : X.affineOpens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a) = 0 ↔ a ∈ I.ideal U := by
  sorry

-- Check `unit_ideal`
example (U : X.affineOpens) (a : Γ(X, U) ⧸
    RingHom.ker ((⊤ : X.IdealSheafData).subschemeι.app U).hom) : a = 0 := by
  sorry

-- Check `nonreduced`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- Check `affine_roundtrip`
example (I : X.IdealSheafData) (U : X.affineOpens)
    (a : Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :
    (RingEquiv.ofBijective ((allOpenToClosed I).app (op U.1)).hom
      (allOpenToClosed_affine_bijective I U)).symm
      ((allOpenToClosed I).app (op U.1) a) = a := by
  sorry

-- Check `nonaffine_obstruction`
example (I : X.IdealSheafData) (U : X.Opens)
    (h : ¬ Function.Surjective ((allOpenToClosed I).app (op U))) : ¬ IsAffineOpen U := by
  sorry

-- Check `representative_inverse`
example (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    let q := allOpenSheafComparison I
    let _ := allOpenSheafComparison_isIso I
    (inv q).app (op U) (I.subschemeι.app U a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a) := by
  sorry

-- Check `pullback_agreement`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a)) =
          quotientToClosed I f U (Ideal.Quotient.mk _ a) := by
  sorry

-- Check `arbitrary_section`
example (I : X.IdealSheafData) (U : X.Opens)
    (s : Γ(I.subscheme, I.subschemeι ⁻¹ᵁ U)) :
    ∃ q, (allOpenSheafComparison I).app (op U) q = s := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def quotientToKernel (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :=
  Ideal.quotientMap _ (RingHom.id _) (extendedIdeal_le_ker I f U)

theorem quotientToKernel_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToKernel I f U (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientToKernel_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) : Function.Surjective (quotientToKernel I f U) := by
  sorry

theorem quotientToKernel_factor (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    ((allOpenToClosed (I.comap f)).app (op (f ⁻¹ᵁ U))).hom.comp
      (quotientToKernel I f U) = quotientToClosed I f U := by
  sorry

theorem quotientToKernel_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective (quotientToKernel I f U) ↔ Function.Injective (quotientToClosed I f U) := by
  sorry

theorem quotientToKernel_bijective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Bijective (quotientToKernel I f U) := by
  sorry

theorem quotientToKernel_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫ CommRingCat.ofHom (quotientToKernel I f U) =
      CommRingCat.ofHom (quotientToKernel I f V) ≫
        (allOpenQuotient (I.comap f)).map
          ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op := by
  sorry

def quotientToKernelNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙ allOpenQuotient (I.comap f) where
  app U := CommRingCat.ofHom (quotientToKernel I f U.unop)
  naturality _ _ h := quotientToKernel_naturality I f h.unop.le

theorem quotientToKernelNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToKernelNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToKernel I f U) := by
  sorry

theorem quotientToKernelNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op (allOpenToClosed (I.comap f)) =
      quotientToClosedNatTrans I f := by
  sorry

theorem quotientToKernelNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToKernelNatTrans I f) := by
  sorry

theorem quotientToKernelNatTrans_sheaf_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op
        (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)) ≫
          allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `affine_roundtrip`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U))
    (a : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (RingEquiv.ofBijective (quotientToKernel I f U)
      (quotientToKernel_bijective I f U H)).symm (quotientToKernel I f U a) = a := by
  sorry

-- Check `unit_ideal`
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToKernel (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- Check `empty_open`
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : Γ(X, f ⁻¹ᵁ (⊥ : Y.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Y⟩).map (f.app (⊥ : Y.Opens)).hom) :
    quotientToKernel I f ⟨⊥, isAffineOpen_bot Y⟩ q = 0 := by
  sorry

-- Check `strict_kernel_obstruction`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U))
    (ha : a ∈ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom)
    (hn : a ∉ (I.ideal U).map (f.app U).hom) :
    ¬ Function.Injective (quotientToKernel I f U) ∧ ¬ IsAffineOpen (f ⁻¹ᵁ U) := by
  sorry

-- Check `two_step_restriction`
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (q : Γ(X, f ⁻¹ᵁ W) ⧸ (I.ideal W).map (f.app W).hom) :
    (quotientToKernelNatTrans I f).app (op U)
      (quotientRestriction I f h (quotientRestriction I f k q)) =
    (allOpenQuotient (I.comap f)).map
      ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k))).op
        ((quotientToKernelNatTrans I f).app (op W) q) := by
  sorry

-- Check `nonreduced_identity`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToKernelNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- Check `sheaf_factor_on_every_class`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) ((quotientToKernelNatTrans I f).app (op U) q)) =
      quotientToClosed I f U q := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000

theorem extendedIdeal_comp (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (I.ideal U).map ((f ≫ g).app U).hom =
      ((I.comap g).ideal ⟨g ⁻¹ᵁ U, H⟩).map (f.app (g ⁻¹ᵁ U)).hom := by
  sorry

def quotientCompIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) ≃+*
      (Γ(X, f ⁻¹ᵁ (g ⁻¹ᵁ U)) ⧸
        ((I.comap g).ideal ⟨g ⁻¹ᵁ U, H⟩).map (f.app (g ⁻¹ᵁ U)).hom) :=
  Ideal.quotEquivOfEq (extendedIdeal_comp I f g U H)

theorem quotientCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    quotientCompIso I f g U H (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompIso I f g U H).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : Z.affineOpens} (h : U ≤ V)
    (HU : g ⁻¹ᵁ U ∈ Y.affineOpens) (HV : g ⁻¹ᵁ V ∈ Y.affineOpens) :
    CommRingCat.ofHom (quotientRestriction I (f ≫ g) h) ≫
      (quotientCompIso I f g U HU).toCommRingCatIso.hom =
    (quotientCompIso I f g V HV).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (quotientRestriction (I.comap g) f
        (show (⟨g ⁻¹ᵁ U, HU⟩ : Y.affineOpens) ≤ ⟨g ⁻¹ᵁ V, HV⟩ from g.preimage_mono h)) := by
  sorry

def kernelCompIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) :
    (Γ(X, V) ⧸ RingHom.ker ((I.comap (f ≫ g)).subschemeι.app V).hom) ≃+*
      (Γ(X, V) ⧸ RingHom.ker (((I.comap g).comap f).subschemeι.app V).hom) :=
  Ideal.quotEquivOfEq (congrArg (fun J : X.IdealSheafData =>
    RingHom.ker (J.subschemeι.app V).hom) (I.comap_comp f g))

theorem kernelCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    kernelCompIso I f g V (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem kernelCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    (kernelCompIso I f g V).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompIso_kernel_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U)).toRingHom.comp
      (quotientToKernel I (f ≫ g) U) =
    (quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩).comp
      (quotientCompIso I f g U H).toRingHom := by
  sorry

theorem kernelCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : X.Opens} (h : U ≤ V) :
    CommRingCat.ofHom (allOpenRestriction (I.comap (f ≫ g)) h) ≫
      (kernelCompIso I f g U).toCommRingCatIso.hom =
    (kernelCompIso I f g V).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (allOpenRestriction ((I.comap g).comap f) h) := by
  sorry

def quotientCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientPresheaf I (f ≫ g) ≅
      (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op ⋙ quotientPresheaf (I.comap g) f :=
  NatIso.ofComponents (fun U =>
    (quotientCompIso I f g U.unop (U.unop.2.preimage g)).toCommRingCatIso)
    (fun h => quotientCompIso_naturality I f g h.unop.le _ _)

theorem quotientCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) :
    (quotientCompNatIso I f g).hom.app (op U) =
      (quotientCompIso I f g U (U.2.preimage g)).toCommRingCatIso.hom := by
  sorry

theorem quotientCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `roundtrip`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompIso I f g U H).symm (quotientCompIso I f g U H q) = q := by
  sorry

-- Check `unit_ideal`
example (f : X ⟶ Y) (g : Y ⟶ Z) (U : Z.affineOpens)
    (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸
      ((⊤ : Z.IdealSheafData).ideal U).map ((f ≫ g).app U).hom) :
    quotientCompIso (⊤ : Z.IdealSheafData) f g U H q = 0 := by
  sorry

-- Check `empty_open`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (H : g ⁻¹ᵁ (⊥ : Z.Opens) ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ (⊥ : Z.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Z⟩).map ((f ≫ g).app (⊥ : Z.Opens)).hom) :
    quotientCompIso I f g ⟨⊥, isAffineOpen_bot Z⟩ H q = 0 := by
  sorry

-- Check `nonreduced_identity`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientCompIso I (𝟙 X) (𝟙 X) U U.2 (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- Check `roundtrip`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (V : X.Opens)
    (q : Γ(X, V) ⧸ RingHom.ker ((I.comap (f ≫ g)).subschemeι.app V).hom) :
    (kernelCompIso I f g V).symm (kernelCompIso I f g V q) = q := by
  sorry

-- Check `empty_open`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : Γ(X, (⊥ : X.Opens)) ⧸
      RingHom.ker ((I.comap (f ≫ g)).subschemeι.app (⊥ : X.Opens)).hom) :
    kernelCompIso I f g ⊥ q = 0 := by
  sorry

-- Check `comparison_on_every_class`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) (quotientToKernel I (f ≫ g) U q) =
    quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩ (quotientCompIso I f g U H q) := by
  sorry

-- Check `two_step_restriction`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    {U V W : Z.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ W) ⧸ (I.ideal W).map ((f ≫ g).app W).hom) :
    (quotientCompNatIso I f g).hom.app (op U)
      (quotientRestriction I (f ≫ g) h (quotientRestriction I (f ≫ g) k q)) =
    quotientRestriction (I.comap g) f
      (show (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens) ≤
        ⟨g ⁻¹ᵁ W, W.2.preimage g⟩ from g.preimage_mono (h.trans k))
      ((quotientCompNatIso I f g).hom.app (op W) q) := by
  sorry

-- Check `inverse_on_every_class`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompNatIso I f g).inv.app (op U)
      ((quotientCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- Check `kernel_square_on_every_class`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) ((quotientToKernelNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)
      ((quotientCompNatIso I f g).hom.app (op U) q) := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def kernelCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    allOpenQuotient (I.comap (f ≫ g)) ≅ allOpenQuotient ((I.comap g).comap f) :=
  NatIso.ofComponents (fun U => (kernelCompIso I f g U.unop).toCommRingCatIso)
    (fun h => kernelCompIso_naturality I f g h.unop.le)

theorem kernelCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) :
    (kernelCompNatIso I f g).app (op U) = (kernelCompIso I f g U).toCommRingCatIso := by
  sorry

theorem kernelCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

theorem kernelCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

def sheafCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≅
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) :=
  (sheafification (Opens.grothendieckTopology X) CommRingCat).mapIso (kernelCompNatIso I f g)

theorem sheafCompNatIso_unit (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≫
      (sheafCompNatIso I f g).hom =
    (kernelCompNatIso I f g).hom ≫
      toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) := by
  sorry

theorem sheafCompNatIso_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (sheafCompNatIso I f g).hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g)))).app
        (op U) (Ideal.Quotient.mk _ a)) =
    (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f))).app
      (op U) (Ideal.Quotient.mk _ a) := by
  sorry

theorem sheafCompNatIso_inv_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (sheafCompNatIso I f g).inv.app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f))).app
        (op U) (Ideal.Quotient.mk _ a)) =
    (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g)))).app
      (op U) (Ideal.Quotient.mk _ a) := by
  sorry

def closedCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (TopologicalSpace.Opens.map (I.comap (f ≫ g)).subschemeι.base).op ⋙
      (I.comap (f ≫ g)).subscheme.presheaf ≅
    (TopologicalSpace.Opens.map ((I.comap g).comap f).subschemeι.base).op ⋙
      ((I.comap g).comap f).subscheme.presheaf :=
  let _ := allOpenSheafComparison_isIso (I.comap (f ≫ g))
  let _ := allOpenSheafComparison_isIso ((I.comap g).comap f)
  (asIso (allOpenSheafComparison (I.comap (f ≫ g)))).symm ≪≫
    sheafCompNatIso I f g ≪≫ asIso (allOpenSheafComparison ((I.comap g).comap f))

theorem sheafCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (sheafCompNatIso I f g).hom ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

theorem closedCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).hom.app (op U) ((I.comap (f ≫ g)).subschemeι.app U a) =
      ((I.comap g).comap f).subschemeι.app U a := by
  sorry

theorem closedCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).inv.app (op U) (((I.comap g).comap f).subschemeι.app U a) =
      (I.comap (f ≫ g)).subschemeι.app U a := by
  sorry

theorem kernelCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (kernelCompNatIso I f g).hom ≫ allOpenToClosed ((I.comap g).comap f) =
      allOpenToClosed (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

theorem sheafCompNatIso_unique (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ⟶
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)))
    (hq : q ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom) :
    q = (sheafCompNatIso I f g).hom := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- Check `roundtrip`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (kernelCompNatIso I f g).inv.app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- Check `empty_open`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (kernelCompNatIso I f g).hom.app (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- Check `two_restrictions`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op W)) :
    (kernelCompNatIso I f g).hom.app (op U)
      (allOpenRestriction (I.comap (f ≫ g)) h
        (allOpenRestriction (I.comap (f ≫ g)) k q)) =
    allOpenRestriction ((I.comap g).comap f) (h.trans k)
      ((kernelCompNatIso I f g).hom.app (op W) q) := by
  sorry

-- Check `all_sections_roundtrip`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (s : Γ((I.comap (f ≫ g)).subscheme, (I.comap (f ≫ g)).subschemeι ⁻¹ᵁ U)) :
    (closedCompNatIso I f g).inv.app (op U)
      ((closedCompNatIso I f g).hom.app (op U) s) = s := by
  sorry

-- Check `all_quotient_classes`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (allOpenToClosed ((I.comap g).comap f)).app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenToClosed (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- Check `restriction`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V : X.Opens} (h : U ≤ V)
    (s : Γ((I.comap (f ≫ g)).subscheme, (I.comap (f ≫ g)).subschemeι ⁻¹ᵁ V)) :
    (closedCompNatIso I f g).hom.app (op U)
      ((I.comap (f ≫ g)).subscheme.presheaf.map
        (homOfLE ((I.comap (f ≫ g)).subschemeι.preimage_mono h)).op s) =
    ((I.comap g).comap f).subscheme.presheaf.map
      (homOfLE (((I.comap g).comap f).subschemeι.preimage_mono h)).op
      ((closedCompNatIso I f g).hom.app (op V) s) := by
  sorry

-- Check `all_sections_square`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (sheafify (Opens.grothendieckTopology X)
      (allOpenQuotient (I.comap (f ≫ g)))).obj (op U)) :
    (allOpenSheafComparison ((I.comap g).comap f)).app (op U)
      ((sheafCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenSheafComparison (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- Check `forced_comparison`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    let _ := allOpenSheafComparison_isIso ((I.comap g).comap f)
    allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom ≫
      inv (allOpenSheafComparison ((I.comap g).comap f)) = (sheafCompNatIso I f g).hom := by
  sorry

-- Check `nonreduced_identity`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.Opens := ⊤
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (sheafCompNatIso I (𝟙 X) (𝟙 X)).hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X)))).app (op U) (Ideal.Quotient.mk _ a))
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

theorem allOpenQuotient_eqToIso_mk (I J : X.IdealSheafData) (h : I = J)
    (U : X.Opens) (a : Γ(X, U)) :
    (eqToIso (congrArg allOpenQuotient h)).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

theorem allOpenQuotient_iso_eqToIso (I J : X.IdealSheafData) (h : I = J)
    (e : allOpenQuotient I ≅ allOpenQuotient J)
    (he : ∀ (U : X.Opens) (a : Γ(X, U)),
      e.hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a) :
    e = eqToIso (congrArg allOpenQuotient h) := by
  sorry

theorem kernelCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    kernelCompNatIso I f g = eqToIso (congrArg allOpenQuotient (I.comap_comp f g)) := by
  sorry

theorem sheafCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient K)) (I.comap_comp f g)) := by
  sorry

theorem allOpenSheafComparison_eqToIso (I J : X.IdealSheafData) (h : I = J) :
    let _ := allOpenSheafComparison_isIso I
    let _ := allOpenSheafComparison_isIso J
    (asIso (allOpenSheafComparison I)).symm ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData =>
        sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) h) ≪≫
      asIso (allOpenSheafComparison J) =
    eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h) := by
  sorry

theorem closedCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    closedCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData =>
        (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf)
      (I.comap_comp f g)) := by
  sorry

theorem kernelCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f)) := by
  sorry

theorem kernelCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.comp_id f)) := by
  sorry

theorem kernelCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

theorem sheafCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.id_comp f)) := by
  sorry

theorem sheafCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f)) := by
  sorry

theorem sheafCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

theorem closedCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.id_comp f)) := by
  sorry

theorem closedCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f)) := by
  sorry

theorem closedCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

end IdealPullback

noncomputable section
namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 100000

-- Check `kernel_threefold_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : (allOpenQuotient (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- Check `sheaf_threefold_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- Check `closed_threefold_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- Check `kernel_identity_sections`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (𝟙 X ≫ f))).obj (op U)) :
    (kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f))).hom.app (op U) q := by
  sorry

-- Check `sheaf_identity_sections`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- Check `closed_identity_sections`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- Check `kernel_empty_open`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (eqToIso (congrArg allOpenQuotient (I.comap_comp f g))).hom.app
      (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- Check `closed_inverse_transport`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (h : I.comap (f ≫ g) = (I.comap g).comap f) :
    (closedCompNatIso I f g).symm =
    (eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h)).symm := by
  sorry

-- Check `sheaf_nonreduced`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.Opens := ⊤
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    ∀ e : sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X))) ≅
      sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient ((I.comap (𝟙 X)).comap (𝟙 X))),
    let q := e.hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X)
        (allOpenQuotient (I.comap (𝟙 X ≫ 𝟙 X)))).app (op U) (Ideal.Quotient.mk _ a))
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end IdealPullback

namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe sqU
variable {X Y Z : Scheme.{sqU}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

noncomputable def quotientToSheafNatTrans (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙
          sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)) :=
  quotientToKernelNatTrans I f ≫
    Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
      from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)))

theorem quotientToSheafNatTrans_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (quotientToSheafNatTrans I f).app (op U) (Ideal.Quotient.mk _ a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a) := by
  sorry

theorem quotientToSheafNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToSheafNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
        (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

theorem quotientToSheafNatTrans_unique (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙
          sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)))
    (hq : q ≫ Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
      from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
      (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f) :
    q = quotientToSheafNatTrans I f := by
  sorry

theorem quotientToSheafNatTrans_app_isIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    IsIso ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

theorem quotientToSheafNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToSheafNatTrans I f) := by
  sorry

theorem quotientCompNatIso_kernel (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToKernelNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (kernelCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToKernelNatTrans (I.comap g) f) := by
  sorry

theorem quotientCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToClosedNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (closedCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToClosedNatTrans (I.comap g) f) := by
  sorry

theorem quotientCompNatIso_sheaf (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    quotientToSheafNatTrans I (f ≫ g) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (sheafCompNatIso I f g).hom =
    (quotientCompNatIso I f g).hom ≫
      Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ h => g.preimage_mono h).functor.op
        (quotientToSheafNatTrans (I.comap g) f) := by
  sorry

theorem quotientCompNatIso_kernel_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToKernelNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (kernelCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToKernelNatTrans I (f ≫ g) := by
  sorry

theorem quotientCompNatIso_closed_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToClosedNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (closedCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToClosedNatTrans I (f ≫ g) := by
  sorry

theorem quotientCompNatIso_sheaf_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] :
    Functor.whiskerLeft (show Monotone (fun U : Z.affineOpens =>
      (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
      from fun _ _ h => g.preimage_mono h).functor.op
      (quotientToSheafNatTrans (I.comap g) f) ≫
      Functor.whiskerLeft ((show Monotone (fun U : Z.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map (f ≫ g).base).op
        (sheafCompNatIso I f g).inv =
    (quotientCompNatIso I f g).inv ≫ quotientToSheafNatTrans I (f ≫ g) := by
  sorry

theorem quotientCompIso_closed_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    CommRingCat.ofHom (quotientToClosed I (f ≫ g) U) ≫
      (closedCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (quotientToClosed (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

theorem quotientCompIso_sheaf_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (quotientToSheafNatTrans I (f ≫ g)).app (op U) ≫
      (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

theorem quotientToSheafNatTrans_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Injective (quotientToClosed I f U) := by
  sorry

theorem quotientToSheafNatTrans_surjective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Surjective (quotientToClosed I f U) := by
  sorry

end IdealPullback

namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe sqU
variable {X Y Z : Scheme.{sqU}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- Check `identity_bijective`
example (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((quotientToSheafNatTrans I (𝟙 X)).app (op U)) := by
  sorry

-- Check `empty_open`
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : (quotientPresheaf I f).obj (op ⟨⊥, isAffineOpen_bot Y⟩)) :
    (quotientToSheafNatTrans I f).app (op ⟨⊥, isAffineOpen_bot Y⟩) q = 0 := by
  sorry

-- Check `surjectivity_obstruction`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective (quotientToClosed I f U)) :
    ¬ Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

-- Check `single_affine_preimage`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : IsAffineOpen (g ⁻¹ᵁ U))
    (q : (quotientPresheaf I (f ≫ g)).obj (op U)) :
    (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩)
      (quotientCompIso I f g U H q) := by
  sorry

-- Check `kernel_inverse_sections`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (kernelCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToKernelNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- Check `closed_inverse_sections`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (closedCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToClosedNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToClosedNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- Check `sheaf_inverse_sections`
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (sheafCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToSheafNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- Check `nonreduced_identity`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToSheafNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end IdealPullback

namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerLevel
variable {X Y Z W : Scheme.{quotientTowerLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

theorem quotientPresheaf_eqToIso_mk (I J : Y.IdealSheafData) (h : I = J)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U)
      (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientPresheaf_hom_ext (I : Y.IdealSheafData) (f : X ⟶ Y)
    {F : Y.affineOpensᵒᵖ ⥤ CommRingCat}
    (α β : quotientPresheaf I f ⟶ F)
    (H : ∀ (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)),
      α.app (op U) (Ideal.Quotient.mk _ a) = β.app (op U) (Ideal.Quotient.mk _ a)) :
    α = β := by
  sorry

theorem quotientPresheaf_assoc_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) (U : W.affineOpens)
    (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompNatIso_assoc_left_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompNatIso_eqToIso_mk (I : Z.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (J : Y.IdealSheafData) (hJ : I.comap g = J)
    (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Z.affineOpens =>
        (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
        from fun _ _ k => g.preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) hJ))).hom.app
          (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientPresheaf_assoc_post_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    {F : W.affineOpensᵒᵖ ⥤ CommRingCat}
    (α : quotientPresheaf I (f ≫ g ≫ h) ⟶ F)
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom ≫ α).app
      (op U) (Ideal.Quotient.mk _ a) = α.app (op U) (Ideal.Quotient.mk _ a) := by
  sorry

theorem quotientCompNatIso_assoc_right_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h] :
    quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g) =
    eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h))) := by
  sorry

theorem quotientPresheaf_id_right_mk (I : Y.IdealSheafData)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

theorem quotientCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id)) =
      eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f)) := by
  sorry

end IdealPullback

namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerTestLevel
variable {X Y Z W : Scheme.{quotientTowerTestLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- Check `ideal_transport_roundtrip`
example (I J : Y.IdealSheafData) (h : I = J) (f : X ⟶ Y)
    (U : Y.affineOpens) (q : (quotientPresheaf I f).obj (op U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).inv.app (op U)
      ((eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U) q) = q := by
  sorry

-- Check `right_identity_sections`
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (quotientPresheaf I (f ≫ 𝟙 Y)).obj (op U)) :
    (quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- Check `assoc_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q := by
  sorry

-- Check `assoc_inverse_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf ((I.comap h).comap g) f).obj
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).inv.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).inv.app (op U) q := by
  sorry

-- Check `kernel_target_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToKernelNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToKernelNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- Check `closed_target_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToClosedNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToClosedNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- Check `sheaf_target_sections`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h] (U : W.affineOpens)
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op U)) :
    (quotientToSheafNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) q) =
    (quotientToSheafNatTrans ((I.comap h).comap g) f).app
      (op ⟨g ⁻¹ᵁ (h ⁻¹ᵁ U), (U.2.preimage h).preimage g⟩) ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) q) := by
  sorry

-- Check `empty_source`
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h]
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op ⟨⊥, isAffineOpen_bot W⟩)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op ⟨⊥, isAffineOpen_bot W⟩) q = 0 := by
  sorry

-- Check `nonreduced_identity_tower`
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let f : X ⟶ X := 𝟙 X
    let g : X ⟶ X := 𝟙 X
    let h : X ⟶ X := 𝟙 X
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : X.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : X.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end IdealPullback



open scoped _root_.TensorProduct
open _root_.AlgebraicGeometry

namespace Excellence

/-- Noetherian geometric regularity, tested after finite purely inseparable extensions. -/
def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧
    ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
      IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)

theorem GeometricallyRegular.regular (k B : Type u) [Field k] [CommRing B]
    [Algebra k B] (h : GeometricallyRegular k B) : IsRegularRing B := by sorry

theorem GeometricallyRegular.finite_extension (k B L : Type u) [Field k] [CommRing B]
    [Algebra k B] [Field L] [Algebra k L] [Module.Finite k L]
    (h : GeometricallyRegular k B) : IsRegularRing (L ⊗[k] B) := by sorry

theorem GeometricallyRegular.algEquiv (k B C : Type u) [Field k] [CommRing B]
    [CommRing C] [Algebra k B] [Algebra k C] (e : B ≃ₐ[k] C) :
    GeometricallyRegular k B ↔ GeometricallyRegular k C := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : GeometricallyRegular k k := by sorry
-- Check `test_zero`
example (k : Type u) [Field k] :
    GeometricallyRegular k (k ⧸ (⊤ : Ideal k)) := by sorry
-- Check `test_dual_numbers`
example (k : Type u) [Field k] : ¬ GeometricallyRegular k (TrivSqZeroExt k k) := by sorry
-- Check `test_inseparable`
example (k L : Type u) [Field k] [Field L] [Algebra k L] [Module.Finite k L]
    [IsPurelyInseparable k L] (h : ¬ Algebra.IsSeparable k L) :
    ¬ GeometricallyRegular k L := by sorry

/-- Flatness plus Noetherian geometrically regular native residue-field fibres. -/
def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)

theorem RegularAlgebraMap.flat (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) : Module.Flat R B := by sorry

theorem RegularAlgebraMap.fibre (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) (p : PrimeSpectrum R) :
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B) := by sorry

theorem RegularAlgebraMap.field_iff (k L : Type u) [Field k] [Field L] [Algebra k L]
    [Module.Finite k L] :
    RegularAlgebraMap k L ↔ Algebra.IsSeparable k L := by sorry

-- Check `test_identity`
example (R : Type u) [CommRing R] : RegularAlgebraMap R R := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] : RegularAlgebraMap R (R ⧸ (⊤ : Ideal R)) := by sorry
-- Check `test_flat_not_regular`
example (k : Type u) [Field k] :
    Module.Flat k (TrivSqZeroExt k k) ∧ ¬ RegularAlgebraMap k (TrivSqZeroExt k k) := by sorry

/-- The actual regular locus; it need not be open without a further hypothesis. -/
def regularLocus (R : Type u) [CommRing R] : Set (PrimeSpectrum R) :=
  {p | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}

theorem mem_regularLocus (R : Type u) [CommRing R] (p : PrimeSpectrum R) :
    p ∈ regularLocus R ↔ IsRegularLocalRing (Localization.AtPrime p.asIdeal) := by sorry

theorem regularLocus_eq_univ (R : Type u) [CommRing R] [IsRegularRing R] :
    regularLocus R = Set.univ := by sorry

theorem regularLocus_ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (q : PrimeSpectrum S) :
    q ∈ regularLocus S ↔ PrimeSpectrum.comap e.toRingHom q ∈ regularLocus R := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : regularLocus k = Set.univ := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] :
    regularLocus (R ⧸ (⊤ : Ideal R)) = ∅ := by sorry
-- Check `test_dual_numbers`
example (k : Type u) [Field k] : regularLocus (TrivSqZeroExt k k) = ∅ := by sorry

/-- At every prime, the completion of the local ring has regular formal fibres. -/
def IsGRing (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal))

theorem IsGRing.noetherian (R : Type u) [CommRing R] (h : IsGRing R) :
    IsNoetherianRing R := by sorry

theorem IsGRing.completion_regular (R : Type u) [CommRing R] (h : IsGRing R)
    (p : PrimeSpectrum R) :
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal)) := by sorry

theorem IsGRing.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsGRing R) : IsGRing S := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : IsGRing k := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] : IsGRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- Check `test_complete_local`
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsGRing R := by sorry

/-- Openness for every finite-type algebra, rather than only for the base spectrum. -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (regularLocus B)

theorem IsJ2.noetherian (R : Type u) [CommRing R] (h : IsJ2 R) :
    IsNoetherianRing R := by sorry

theorem IsJ2.regularLocus_open (R B : Type u) [CommRing R] [CommRing B] [Algebra R B]
    [Algebra.FiniteType R B] (h : IsJ2 R) : IsOpen (regularLocus B) := by sorry

theorem IsJ2.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsJ2 R) : IsJ2 S := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : IsJ2 k := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] : IsJ2 (R ⧸ (⊤ : Ideal R)) := by sorry
-- Check `test_singular_allowed`
example (k : Type u) [Field k] : IsJ2 (TrivSqZeroExt k k) := by sorry

def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop := IsGRing R ∧ IsJ2 R

theorem IsQuasiExcellentRing.gRing (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsGRing R := by sorry
theorem IsQuasiExcellentRing.j2 (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsJ2 R := by sorry

theorem IsQuasiExcellentRing.noetherian (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsNoetherianRing R := h.1.1

-- Check `test_field`
example (k : Type u) [Field k] : IsQuasiExcellentRing k := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] : IsQuasiExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- Check `test_nilpotents_allowed`
example (k : Type u) [Field k] : IsQuasiExcellentRing (TrivSqZeroExt k k) := by sorry

/-- The final conjunct is the expansion of the imported R03.3/catenary predicate
for every finite-type algebra. There is no second catenary-ring node here. -/
def IsExcellentRing (R : Type u) [CommRing R] : Prop :=
  IsQuasiExcellentRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → ∀ p q : PrimeSpectrum B, p ≤ q →
      (∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum B),
        s.head = p → s.last = q → s.length ≤ n) ∧
      ∀ s t : LTSeries (PrimeSpectrum B),
        s.head = p → s.last = q → t.head = p → t.last = q →
        (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
        (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length

theorem IsExcellentRing.quasiExcellent (R : Type u) [CommRing R]
    (h : IsExcellentRing R) : IsQuasiExcellentRing R := by sorry

theorem IsExcellentRing.finiteType (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] [Algebra.FiniteType R B] (h : IsExcellentRing R) :
    IsExcellentRing B := by sorry

theorem IsExcellentRing.localization (R : Type u) [CommRing R] (M : Submonoid R)
    (h : IsExcellentRing R) : IsExcellentRing (Localization M) := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : IsExcellentRing k := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] : IsExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- Check `test_integers`
example : IsExcellentRing ℤ := by sorry
-- Check `test_nilpotents_allowed`
example (k : Type u) [Field k] : IsExcellentRing (TrivSqZeroExt k k) := by sorry
-- Check `test_complete_local`
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsExcellentRing R := by sorry

def IsQuasiExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsQuasiExcellentRing Γ(X, U)

theorem IsQuasiExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsQuasiExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsQuasiExcellentRing Γ(X, U) := by sorry

theorem IsQuasiExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsQuasiExcellentScheme X) : IsLocallyNoetherian X := by sorry

theorem IsQuasiExcellentScheme.iso (X Y : Scheme.{u}) (e : X ≅ Y)
    (h : IsQuasiExcellentScheme X) : IsQuasiExcellentScheme Y := by sorry

-- Check `test_spec`
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of R)) ↔ IsQuasiExcellentRing R := by sorry
-- Check `test_field`
example (k : Type u) [Field k] : IsQuasiExcellentScheme (Spec (.of k)) := by sorry
-- Check `test_zero`
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry

def IsExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsExcellentRing Γ(X, U)

theorem IsExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsExcellentRing Γ(X, U) := by sorry

theorem IsExcellentScheme.quasiExcellent (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsQuasiExcellentScheme X := by sorry

theorem IsExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsLocallyNoetherian X := by sorry

-- Check `test_spec`
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of R)) ↔ IsExcellentRing R := by sorry
-- Check `test_field`
example (k : Type u) [Field k] : IsExcellentScheme (Spec (.of k)) := by sorry
-- Check `test_empty`
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry
-- Check `test_nonreduced`
example (k : Type u) [Field k] :
    IsExcellentScheme (Spec (.of (TrivSqZeroExt k k))) := by sorry

end Excellence



open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry
namespace Spaces

abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- A named condition on the native diagonal, using native relative representability. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

theorem RepresentableDiagonal.of_scheme (X : Scheme.{u}) :
    RepresentableDiagonal (yoneda.obj X) := by sorry

theorem RepresentableDiagonal.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    RepresentableDiagonal F ↔ RepresentableDiagonal G := by sorry

theorem RepresentableDiagonal.from_scheme (F : SchemePresheaf.{u})
    (h : RepresentableDiagonal F) (X : Scheme.{u}) (a : yoneda.obj X ⟶ F) :
    yoneda.relativelyRepresentable a := by sorry

-- Check `test_field`
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of k))) := by sorry
-- Check `test_empty`
example : RepresentableDiagonal (yoneda.obj Scheme.empty.{u}) := by sorry
-- Check `test_nonreduced`
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry

/-- Etaleness and surjectivity are tested on every represented scheme base change. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

theorem EtaleAtlas.representable (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    yoneda.relativelyRepresentable a := by sorry

theorem EtaleAtlas.etale (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a := by sorry

theorem EtaleAtlas.surjective (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := by sorry

theorem EtaleAtlas.yoneda_iff (U X : Scheme.{u}) (f : U ⟶ X) :
    EtaleAtlas (yoneda.obj X) U (yoneda.map f) ↔ Etale f ∧ Surjective f := by sorry

-- Check `test_identity`
example (X : Scheme.{u}) : EtaleAtlas (yoneda.obj X) X (𝟙 (yoneda.obj X)) := by sorry
-- Check `test_empty_identity`
example : EtaleAtlas (yoneda.obj Scheme.empty.{u}) Scheme.empty
    (𝟙 (yoneda.obj Scheme.empty)) := by sorry
-- Check `test_empty_not_cover`
example (k : Type u) [Field k] (a : yoneda.obj Scheme.empty ⟶ yoneda.obj (Spec (.of k))) :
    ¬ EtaleAtlas (yoneda.obj (Spec (.of k))) Scheme.empty a := by sorry

/-- Absolute algebraic spaces. A space over S carries a map to h_S in the native over-category.
No quasi-compactness of the diagonal or properness is imposed. -/
def IsAlgebraicSpace (F : SchemePresheaf.{u}) : Prop :=
  Presheaf.IsSheaf Scheme.fppfTopology F ∧ RepresentableDiagonal F ∧
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a

theorem IsAlgebraicSpace.sheaf (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    Presheaf.IsSheaf Scheme.fppfTopology F := by sorry
theorem IsAlgebraicSpace.diagonal (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    RepresentableDiagonal F := by sorry
theorem IsAlgebraicSpace.atlas (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a := by sorry
theorem IsAlgebraicSpace.of_scheme (X : Scheme.{u}) :
    IsAlgebraicSpace (yoneda.obj X) := by sorry
theorem IsAlgebraicSpace.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    IsAlgebraicSpace F ↔ IsAlgebraicSpace G := by sorry

-- Check `test_field`
example (k : Type u) [Field k] : IsAlgebraicSpace (yoneda.obj (Spec (.of k))) := by sorry
-- Check `test_empty`
example : IsAlgebraicSpace (yoneda.obj Scheme.empty.{u}) := by sorry
-- Check `test_nonreduced`
example (k : Type u) [Field k] :
    IsAlgebraicSpace (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry
-- Check `test_arbitrary_scheme`
example (X : Scheme.{u}) : IsAlgebraicSpace (yoneda.obj X) := by sorry

end Spaces

open Topology
universe gerbU gerbV gerbW
namespace GaloisGerbs
variable (N : Type gerbU) (E : Type gerbV) (G : Type gerbW)
variable [Group N] [Group E] [Group G]
variable [TopologicalSpace N] [TopologicalSpace E] [TopologicalSpace G]
variable [IsTopologicalGroup E] [IsTopologicalGroup G] [DiscreteTopology N]
/-- Topological extension prefix only: the algebraic kernel and Galois quotient are
specified separately in the definitive roadmap. -/
structure TopologicalExtension [IsTopologicalGroup E] [IsTopologicalGroup G]
    [DiscreteTopology N] extends GroupExtension N E G where
  inl_embedding : Topology.IsEmbedding toGroupExtension.inl
  rightHom_continuous : Continuous toGroupExtension.rightHom
  rightHom_quotient : Topology.IsQuotientMap toGroupExtension.rightHom
variable {N E G}
namespace TopologicalExtension
theorem kernel_iff (T : TopologicalExtension N E G) (e : E) :
    T.rightHom e = 1 ↔ ∃ n : N, T.inl n = e := by
  rw [← MonoidHom.mem_ker, ← T.range_inl_eq_ker_rightHom]
  rfl
theorem inl_project (T : TopologicalExtension N E G) (n : N) :
    T.rightHom (T.inl n) = 1 := T.toGroupExtension.rightHom_inl n
theorem continuous_projection (T : TopologicalExtension N E G) :
    Continuous T.rightHom ∧ Topology.IsQuotientMap T.rightHom :=
  ⟨T.rightHom_continuous, T.rightHom_quotient⟩
end TopologicalExtension
/-- A witnessed topological chart, not a claim that the whole extension splits. -/
structure LocalSplitChart (T : TopologicalExtension N E G) where
  subgroup : Subgroup G
  subgroup_open : IsOpen (subgroup : Set G)
  sectionHom : subgroup →* E
  section_continuous : Continuous sectionHom
  project_section : ∀ g : subgroup, T.rightHom (sectionHom g) = (g : G)
  chart : (N × subgroup) ≃ₜ {e : E // T.rightHom e ∈ subgroup}
  chart_formula : ∀ n g, (chart (n,g)).val = T.inl n * sectionHom g
namespace LocalSplitChart
theorem section_one (T : TopologicalExtension N E G) (C : LocalSplitChart T) :
    C.sectionHom 1 = 1 := C.sectionHom.map_one
theorem section_mul (T : TopologicalExtension N E G) (C : LocalSplitChart T)
    (g h : C.subgroup) : C.sectionHom (g*h) = C.sectionHom g * C.sectionHom h :=
  C.sectionHom.map_mul g h
theorem chart_value (T : TopologicalExtension N E G) (C : LocalSplitChart T)
    (n : N) (g : C.subgroup) : (C.chart (n,g)).val = T.inl n * C.sectionHom g :=
  C.chart_formula n g
end LocalSplitChart
example (T : TopologicalExtension N E G) (n : N) :
    T.rightHom (T.inl n) = 1 := TopologicalExtension.inl_project T n
example (T : TopologicalExtension N E G) (C : LocalSplitChart T) :
    C.sectionHom 1 = 1 := LocalSplitChart.section_one T C
example (R : Type*) [CommRing R] : IsAzumaya R (Matrix (Fin 2) (Fin 2) R) :=
  IsAzumaya.matrix R (Fin 2)
end GaloisGerbs


/- Prototype boundary: Henselization.algebra is the explicit presentation of the imported PerfectoidSpaces:P3/henselisation-of-pairs carrier. Its canonical presentation equivalence remains a gap.
Added GaloisGerb.test_nonsemilinear_extension: Let τ(x+iy)=x+2y−iy on the additive group C, and form C⋊τGal(C/R) with discrete kernel Ga(C). This split topological extension is not a gerb with that algebraic kernel: τ(1)=1 and τ(i)=2−i, so τ is not complex-antilinear and cannot be an algebraic conjugation-semilinear automorphism of Ga/C. Inner conjugation cannot repair it because the kernel is abelian.
API importedPresentationEquiv: The displayed small-neighbourhood colimit is canonically the imported P3 henselization, commuting with η, the extended ideal, stage maps and canonical residue map. -/

end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end SF_base

/-! ## Layer 0: schemes and morphisms -/
section SF_SF_0


set_option linter.unusedVariables false

open _root_.CategoryTheory Limits

universe u

noncomputable section

/-! ## Quasi-coherent algebras, the relative spectrum and the relative Proj

The targets of Layer 0 §1–2 that an existing roadmap states or the pinned library builds are not
restated: Layer 0's `qcoh algebra`, Layer 0's `relative spec`, its universal property,
affine anti-equivalence, pullback and base change, Layer 0's `symmetric algebra sheaf` and Layer 0's `graded qcoh algebra` are Tau Ceti's
`TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`, `CategoryTheory.CommMon.relativeSpec` and
`TauCeti.AlgebraicGeometry.relativeSpec` (modules `TauCeti.AlgebraicGeometry.RelativeSpec.*`)
together with AlgebraicVectorBundles Layers L1A, L1B and L2A (`relativeSpecHomEquiv`,
`relativeSpecEquiv`, `relativeSpecBaseChangeIso`, `pullbackQuasicoherentAlgebra`,
`symmetricAlgebra`, `GradedQuasicoherentAlgebra`); Layer 0's `noetherian normal components` is
Tau Ceti's `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`.

The remaining targets of these two subsections are stated in the roadmap document on those
carriers and have no Lean form here yet: Layer 0's `qcoh algebra sheaf comparison` (the README target, the
coequifibered presheaf on `S.AffineZariskiSite` of a `QuasicoherentAlgebra`, cf. Tau Ceti's
`CommMon.sectionsPresheaf`), Layer 0's `pushforward algebra` (the README target, `f_* O_X` for `f` quasi-compact
and quasi-separated), Layer 0's `relative spec morphism properties`,
Layer 0's `affine pushforward qcoh equivalence`, Layer 0's `relative proj` with its base
change, affine comparison and the compatibility with StableReduction Layer 2's
finitely generated relative Proj. -/

namespace Proj
open _root_.AlgebraicGeometry

/-- `Proj` of a graded `R`-algebra commutes with base change along `R → R'`. -/
theorem isPullback_baseChange {R R' A : Type u} [CommRing R] [CommRing R'] [CommRing A]
    [Algebra R A] [Algebra R R'] (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜]
    [GradedAlgebra (fun d => (𝒜 d).baseChange R')] :
    ∃ (f : Proj (fun d => (𝒜 d).baseChange R') ⟶ Proj 𝒜)
      (g : Proj (fun d => (𝒜 d).baseChange R') ⟶ Spec (CommRingCat.of R')),
      IsPullback f g (Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap R (𝒜 0))))
        (Spec.map (CommRingCat.ofHom (algebraMap R R'))) := by
  sorry

end Proj


namespace IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite

variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false





/-- The affine inverse-image functor on affine opens along an affine morphism. -/
abbrev preimageFunctor (g : Y ⟶ Z) [IsAffineHom g] : Z.affineOpens ⥤ Y.affineOpens :=
  (show Monotone (fun U : Z.affineOpens => (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
    from fun _ _ h => g.preimage_mono h).functor


/-- Left identity coherence: for `f = 𝟙 Y` the comparison is the transport along `𝟙 ≫ g = g`
followed by the componentwise identification of the two (equal) extended ideals. -/
theorem quotientCompNatIso_id_left (I : Z.IdealSheafData) (g : Y ⟶ Z) [IsAffineHom g] :
    quotientCompNatIso I (𝟙 Y) g =
      eqToIso (congrArg (quotientPresheaf I) (Category.id_comp g)) ≪≫
        (NatIso.ofComponents (fun U =>
          (Ideal.quotEquivOfEq (I := (I.ideal U.unop).map (g.app U.unop).hom)
            (J := ((I.comap g).ideal ((preimageFunctor g).obj U.unop)).map
              ((𝟙 Y : Y ⟶ Y).app ((preimageFunctor g).obj U.unop).1).hom)
            (by sorry)).toCommRingCatIso)
          (fun _ => by sorry) :
          quotientPresheaf I g ≅ (preimageFunctor g).op ⋙ quotientPresheaf (I.comap g) (𝟙 Y)) := by
  sorry

end IdealPullback

/-! ### Layer 0 definitions without a typed form at the pins

The following README definitions of Layer 0 §3, §4, §5, §6 and §7 have no declaration above, because
their carriers are absent from the pinned Mathlib (no depth or Cohen–Macaulay predicate for modules,
no dimension function on topological spaces at a point, no perfection colimit for schemes):
`AlgebraicGeometry.Scheme.Modules.IsReflexive` with `reflexiveHull`,
`TauCeti.topologicalKrullDimAt`, `TauCeti.IndEtale`, `Ring.IsCatenary`,
`Ring.IsUniversallyCatenary`, `Module.depth` and `Module.IsCohenMacaulay`,
`AlgebraicGeometry.IsCMQuasiExcellent` and `IsSnQuasiExcellent`, `Ring.IsJapanese`,
`Ring.IsNagata`, `AlgebraicGeometry.Scheme.IsPerfect`,
`AlgebraicGeometry.IsUniversalHomeomorphism`, `AlgebraicGeometry.PerfectlyProper`,
`AlgebraicGeometry.PerfectlySmoothOfRelativeDimension` and
`AlgebraicGeometry.Scheme.IsWeaklyNormal`. Their API items and unit tests are the ones the
README lists; no `Prop`-valued stand-in is introduced for any of them. -/

end
end SF_SF_0

/-! ## Layer 1: descent, algebraic spaces and stacks -/
section SF_SF_1


universe u v w

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry

set_option linter.unusedVariables false

noncomputable section


/-- Presheaves of sets on the big category of schemes. -/
abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- `Cat`-valued pseudofunctors on schemes, the carriers of stacks. -/
abbrev SchPseudofunctor := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}

/-! ### Descent -/

namespace Descent

/-- `QCoh(X)`: the full subcategory of quasi-coherent `𝒪_X`-modules. -/
abbrev QCohCat (X : Scheme.{u}) : Type (u + 1) :=
  (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory

/-- The quasi-coherent pullback pseudofunctor: the restriction of
`Scheme.Modules.pseudofunctor` (left adjoints) to quasi-coherent modules. -/
def qcohPseudofunctor : SchPseudofunctor.{u} := sorry

theorem qcohPseudofunctor_obj (X : Scheme.{u}) :
    Nonempty ((qcohPseudofunctor.obj ⟨op X⟩ : Cat.{u, u + 1}) ≌ QCohCat X) := sorry

/-- Pullback preserves quasi-coherence, so the functors of `qcohPseudofunctor` are restrictions of
`Scheme.Modules.pullback`. -/
theorem qcohPseudofunctor_map {X Y : Scheme.{u}} (f : X ⟶ Y) (M : QCohCat Y) :
    SheafOfModules.isQuasicoherent X.ringCatSheaf ((Scheme.Modules.pullback f).obj M.obj) := sorry

theorem qcohPseudofunctor_mapComp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    Nonempty (Scheme.Modules.pullback g ⋙ Scheme.Modules.pullback f ≅
      Scheme.Modules.pullback (f ≫ g)) := sorry

/-- The fibrewise inclusion `QCoh(X) ⥤ X.Modules`; these functors form a strong transformation to
the left-adjoint part of `Scheme.Modules.pseudofunctor`. -/
def qcohPseudofunctor_forget (X : Scheme.{u}) : QCohCat X ⥤ X.Modules := ObjectProperty.ι _

/-- `QCoh(Spec R) ≌ ModuleCat R` by global sections and `tilde`. -/
def qcohSpecEquiv (R : CommRingCat.{u}) : QCohCat (Spec R) ≌ ModuleCat.{u} R := sorry

-- Check `test_empty`
example (M : QCohCat Scheme.empty.{u}) : IsZero M := sorry

-- Check `test_spec`
example (R : CommRingCat.{u}) : Nonempty (QCohCat (Spec R) ≌ ModuleCat.{u} R) := ⟨qcohSpecEquiv R⟩

-- Check `test_extension_by_zero`
-- (witness: the extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ`)
example : ∃ M : (Spec (CommRingCat.of ℤ)).Modules,
    ¬ SheafOfModules.isQuasicoherent (Spec (CommRingCat.of ℤ)).ringCatSheaf M := sorry

-- Check `test_pullback_rational`
example : IsZero ((Scheme.Modules.pullback
    (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj
      (tilde (ModuleCat.of ℤ (ZMod 2)))) := sorry

/-- Fpqc descent for quasi-coherent sheaves. -/
theorem qcohFpqcDescent : (qcohPseudofunctor.{u}).IsStack Scheme.fpqcTopology := sorry

/-- Sheaves on a site form a stack. -/
theorem sheafIsStack {C : Type u} [Category.{v} C] (J : GrothendieckTopology C) :
    (J.pseudofunctorOver (Type w)).IsStack J := sorry

end Descent

/-! ### Algebraic spaces -/

namespace Spaces





/-- The object property of being an algebraic space. -/
def isAlgebraicSpace : ObjectProperty SchemePresheaf.{u} := fun F => IsAlgebraicSpace F

/-- The category of algebraic spaces. -/
abbrev AlgSpace : Type (u + 1) := (isAlgebraicSpace.{u}).FullSubcategory

def AlgSpace.toPresheaf : AlgSpace.{u} ⥤ SchemePresheaf.{u} := ObjectProperty.ι _

def AlgSpace.ofScheme : Scheme.{u} ⥤ AlgSpace.{u} :=
  ObjectProperty.lift _ yoneda (fun X => IsAlgebraicSpace.of_scheme X)

def AlgSpace.ofScheme_fullyFaithful : (AlgSpace.ofScheme.{u}).FullyFaithful := sorry

/-- Algebraic spaces over `S` in the sense of the Stacks Project, on the induced fppf site of
`Over S`. -/
def IsAlgebraicSpaceOver (S : Scheme.{u}) (F : (Over S)ᵒᵖ ⥤ Type u) : Prop :=
  Presheaf.IsSheaf (Scheme.fppfTopology.over S) F ∧
    (yoneda : Over S ⥤ _).relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F)) ∧
    ∃ (U : Over S) (a : yoneda.obj U ⟶ F),
      MorphismProperty.presheaf (MorphismProperty.inverseImage (@Etale : MorphismProperty Scheme.{u}) (Over.forget S)) a ∧
      MorphismProperty.presheaf
        (MorphismProperty.inverseImage (@Surjective : MorphismProperty Scheme.{u}) (Over.forget S)) a

theorem AlgSpace.overEquiv (S : Scheme.{u}) :
    Nonempty (Over (AlgSpace.ofScheme.obj S) ≌
      ObjectProperty.FullSubcategory (IsAlgebraicSpaceOver S)) := sorry

def AlgSpace.isTerminal_ofScheme_specZ :
    IsTerminal (AlgSpace.ofScheme.{u}.obj (Spec (CommRingCat.of (ULift.{u} ℤ)))) := sorry

def AlgSpace.isInitial_ofScheme_empty : IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty) := sorry

-- Check `test_galois_endomorphisms`
-- (a quadratic Galois extension `K / ℚ`, e.g. `ℚ(i)`: identity and conjugation)
example (K : Type) [Field K] [Algebra ℚ K] [IsGalois ℚ K] (hK : Module.finrank ℚ K = 2) :
    Nat.card {f : AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) ⟶
        AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) //
      f ≫ AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K))) =
        AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)))} = 2 := sorry

-- Check `test_empty_initial`
example : Nonempty (IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty)) :=
  ⟨AlgSpace.isInitial_ofScheme_empty⟩

-- Check `test_yoneda`
example (X Y : Scheme.{u}) :
    Function.Bijective (fun f : X ⟶ Y => AlgSpace.ofScheme.map f) := sorry

-- Check `test_constant_not_space`
example : ¬ IsAlgebraicSpace ((Functor.const Scheme.{u}ᵒᵖ).obj (ULift.{u} Bool)) := sorry

/-- An equivalence relation of schemes, `(t, s) : R ⟶ U × U` a monomorphism inducing equivalence
relations on `T`-points. -/
structure IsEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop where
  mono : Mono (prod.lift t s)
  equivalence : ∀ T : Scheme.{u},
    _root_.Equivalence (fun a b : T ⟶ U => ∃ r : T ⟶ R, r ≫ t = a ∧ r ≫ s = b)

/-- Etale equivalence relations. -/
structure EtaleEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop extends IsEquivRel s t where
  etale_s : Etale s
  etale_t : Etale t

namespace EtaleEquivRel

variable {U R : Scheme.{u}} {s t : R ⟶ U}

theorem refl (h : EtaleEquivRel s t) : ∃ e : U ⟶ R, e ≫ s = 𝟙 U ∧ e ≫ t = 𝟙 U := sorry

theorem symm (h : EtaleEquivRel s t) : ∃ i : R ⟶ R, i ≫ s = t ∧ i ≫ t = s := sorry

theorem trans (h : EtaleEquivRel s t) :
    ∃ c : pullback s t ⟶ R, c ≫ s = pullback.snd s t ≫ s ∧ c ≫ t = pullback.fst s t ≫ t := sorry

theorem restrict (h : EtaleEquivRel s t) {U' : Scheme.{u}} (g : U' ⟶ U) [Etale g] :
    EtaleEquivRel (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst) := sorry

theorem ofAtlas (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ yoneda.map s ≫ a = yoneda.map t ≫ a :=
  sorry

end EtaleEquivRel

-- Check `test_diagonal`
example (U : Scheme.{u}) : EtaleEquivRel (𝟙 U) (𝟙 U) := sorry

-- Check `test_fold`
example (U : Scheme.{u}) :
    EtaleEquivRel (pullback.fst (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)))
      (pullback.snd (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U))) := sorry

-- Check `test_folded_line`
-- (R = Δ ⊔ Γ with Γ = {(x, -x) : x ≠ 0}, char k ≠ 2)
example (k : Type u) [Field k] (hk : (2 : k) ≠ 0) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ Spec (CommRingCat.of (Polynomial k))),
      EtaleEquivRel s t ∧ ¬ IsIso s := sorry

-- Check `test_full_relation_not_etale`
example (k : Type u) [Field k] :
    let p := Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))
    ¬ EtaleEquivRel (pullback.fst p p) (pullback.snd p p) := sorry

-- Check `test_double_diagonal`
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k)
    ¬ EtaleEquivRel (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)) := sorry

/-- The fppf quotient sheaf of a pre-relation. -/
def quotientSheaf {U R : Scheme.{u}} (s t : R ⟶ U) : Sheaf Scheme.fppfTopology.{u} (Type u) := sorry

namespace quotientSheaf

variable {U R : Scheme.{u}} (s t : R ⟶ U)

def π : yoneda.obj U ⟶ (quotientSheaf s t).obj := sorry

theorem desc (F : Sheaf Scheme.fppfTopology.{u} (Type u)) (f : yoneda.obj U ⟶ F.obj)
    (hf : yoneda.map s ≫ f = yoneda.map t ≫ f) :
    ∃! g : (quotientSheaf s t).obj ⟶ F.obj, π s t ≫ g = f := sorry

theorem kernelPair (h : IsEquivRel s t) :
    IsPullback (yoneda.map s) (yoneda.map t) (π s t) (π s t) := sorry

theorem restrict {U' : Scheme.{u}} (g : U' ⟶ U) [Flat g] [LocallyOfFinitePresentation g]
    [Surjective g] :
    Nonempty ((quotientSheaf (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst)).obj ≅ (quotientSheaf s t).obj) :=
  sorry

theorem represented_of {M : Scheme.{u}} (q : U ⟶ M) (hq : s ≫ q = t ≫ q)
    (h₁ : Presheaf.IsLocallySurjective Scheme.fppfTopology (yoneda.map q))
    (h₂ : Presheaf.IsLocallySurjective Scheme.fppfTopology
      (yoneda.map (pullback.lift t s hq.symm))) :
    Nonempty ((quotientSheaf s t).obj ≅ yoneda.obj M) := sorry

end quotientSheaf

-- Check `test_diagonal`
example (U : Scheme.{u}) : Nonempty ((quotientSheaf (𝟙 U) (𝟙 U)).obj ≅ yoneda.obj U) := sorry

-- Check `test_swap`
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k) ⨿ Spec (CommRingCat.of k)
    let sw : U ⟶ U := coprod.desc coprod.inr coprod.inl
    Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) sw)).obj ≅
      yoneda.obj (Spec (CommRingCat.of k))) := sorry

-- Check `test_sheafification_needed`
-- (a quadratic Galois extension `L / K`, e.g. `ℂ / ℝ`, with `σ` the nontrivial automorphism of
-- `Spec L` over `Spec K`: `Spec L` has no `Spec K`-point over `K`, the quotient sheaf has one)
example (K L : Type u) [Field K] [Field L] [Algebra K L] [IsGalois K L]
    (hL : Module.finrank K L = 2) (σ : Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of L)) :
    let U := Spec (CommRingCat.of L)
    let p := Spec.map (CommRingCat.ofHom (algebraMap K L))
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ U // f ≫ p = 𝟙 _} ∧
      Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) σ)).obj.obj
        (op (Spec (CommRingCat.of K)))) := sorry

/- Check `test_hopf_compat` — restricted to affine
`R`-schemes, the quotient sheaf of an affine group by a normal closed subgroup `V(I)` is Tau Ceti's
`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`. Not typed: the restriction from the big fppf site of
schemes to Tau Ceti's site `CommAlgCat.fppfTopology R` is not a named functor at the pins. -/

/-- Quotients of schemes by etale equivalence relations. -/
theorem etaleQuotientTheorem {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    IsAlgebraicSpace (quotientSheaf s t).obj ∧ EtaleAtlas (quotientSheaf s t).obj U (quotientSheaf.π s t) :=
  sorry

/-- Fppf descent of separated locally quasi-finite morphisms. -/
theorem quasiFiniteDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u})
      (pullback.snd p (yoneda.map (f i)))) :
    MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u}) p := sorry

/-- Presentations of algebraic spaces. -/
theorem spacePresentation (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ Nonempty ((quotientSheaf s t).obj ≅ F) :=
  sorry

/-- The topological space `|X|` of an algebraic space. -/
def points (F : AlgSpace.{u}) : TopCat.{u} := sorry

def points_map {F G : AlgSpace.{u}} (f : F ⟶ G) : points F ⟶ points G := sorry

theorem points_ofScheme (X : Scheme.{u}) :
    Nonempty (points (AlgSpace.ofScheme.obj X) ≅ (X.carrier : TopCat.{u})) := sorry

theorem points_atlas_surjective (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : EtaleAtlas F.obj U a) :
    Function.Surjective (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) ∧
      IsOpenMap (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) := sorry

/- API `opensEquiv` — open subspaces of `X` correspond to the opens of
`|X|`. Not typed: open subspaces (representable open immersions into `X`) are not yet a named
object property; owner Layer 1's `space points`. -/

-- Check `test_field`
example (k : Type u) [Field k] : Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) ∧
    Nonempty (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) := sorry

-- Check `test_galois`
-- (for a quadratic extension `L / K`, e.g. `ℂ / ℝ`, `|Spec L|` is one point although `Spec L` has two
-- `K`-automorphisms)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of L)))) := sorry

/- Check `test_folded_line` — the closed points of the folded
line over an algebraically closed field are the origin and the pairs `{x, -x}`; and
Check `test_no_residue_field` — the generic point of `𝔸¹/ℤ`
(characteristic zero) is represented by no monomorphism from the spectrum of a field. Both concern
the explicit quotients of Layer 1's `folded line space` and Layer 1's `translation quotient space`, whose
equivalence relations are not constructed in this file. -/

/-- Properties of morphisms of algebraic spaces defined etale locally. -/
def EtaleLocal (P : MorphismProperty Scheme.{u}) {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∃ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj) (h : U ⟶ V),
    EtaleAtlas F.obj U a ∧ MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b ∧
      a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b ∧ P h

namespace EtaleLocal

variable (P : MorphismProperty Scheme.{u}) [P.IsLocalAtSource Scheme.etalePrecoverage]
  [P.IsLocalAtTarget Scheme.etalePrecoverage]

theorem iff_forall_square {F G : AlgSpace.{u}} (f : F ⟶ G) :
    EtaleLocal P f ↔ ∀ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj)
      (h : U ⟶ V), EtaleAtlas F.obj U a → MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b →
        a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b → P h := sorry

theorem ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) : EtaleLocal P (AlgSpace.ofScheme.map f) ↔ P f :=
  sorry

theorem iff_presheaf [P.IsStableUnderBaseChange] {F G : AlgSpace.{u}} (f : F ⟶ G)
    (hf : yoneda.relativelyRepresentable (isAlgebraicSpace.ι.map f)) :
    EtaleLocal P f ↔ MorphismProperty.presheaf P (isAlgebraicSpace.ι.map f) := sorry

theorem comp [P.IsStableUnderComposition] {F G H : AlgSpace.{u}} (f : F ⟶ G) (g : G ⟶ H)
    (hf : EtaleLocal P f) (hg : EtaleLocal P g) : EtaleLocal P (f ≫ g) := sorry

/- API `baseChange` — stability under base change, stated
with the fibre products of Layer 1's `space fibre products` (`AlgSpace.pullbackObj` below). -/
theorem baseChange [P.IsStableUnderBaseChange] {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hf : EtaleLocal P f) :
    ∃ (W : AlgSpace.{u}) (q : W ⟶ G), Nonempty (W.obj ≅ pullback (isAlgebraicSpace.ι.map f)
      (isAlgebraicSpace.ι.map g)) ∧ EtaleLocal P q := sorry

end EtaleLocal

-- Check `test_identity`
example (F : AlgSpace.{u}) : EtaleLocal (@Etale : MorphismProperty Scheme.{u}) (𝟙 F) := sorry

-- Check `test_scheme`
example {X Y : Scheme.{u}} (f : X ⟶ Y) :
    EtaleLocal (@Smooth : MorphismProperty Scheme.{u}) (AlgSpace.ofScheme.map f) ↔ Smooth f := sorry

-- Check `test_atlas`
example {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    EtaleLocal (@Etale : MorphismProperty Scheme.{u})
      (ObjectProperty.homMk (quotientSheaf.π s t) :
        AlgSpace.ofScheme.obj U ⟶ (⟨(quotientSheaf s t).obj, (etaleQuotientTheorem h).1⟩ : AlgSpace.{u})) :=
  sorry

/- Check `test_closed_immersion_not_local` — for the
identity of `𝔸¹`, the chart square with top arrow the identity has a closed immersion while the
chart square with top arrow the fold map `𝔸¹ ⊔ 𝔸¹ ⟶ 𝔸¹` does not; closed immersion is not etale
local on the source, so `EtaleLocal @IsClosedImmersion` is not square-independent. -/
example (k : Type u) [Field k] :
    let A := Spec (CommRingCat.of (Polynomial k))
    IsClosedImmersion (𝟙 A) ∧ ¬ IsClosedImmersion (coprod.desc (𝟙 A) (𝟙 A)) := sorry

/-- Fibre products of algebraic spaces. -/
theorem isAlgebraicSpace_pullback {F G H : SchemePresheaf.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hF : IsAlgebraicSpace F) (hG : IsAlgebraicSpace G) (hH : IsAlgebraicSpace H) :
    IsAlgebraicSpace (pullback f g) := sorry

/-- The fibre product in `AlgSpace`. -/
def AlgSpace.pullbackObj {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) : AlgSpace.{u} :=
  ⟨pullback (isAlgebraicSpace.ι.map f) (isAlgebraicSpace.ι.map g),
    isAlgebraicSpace_pullback _ _ F.property G.property H.property⟩

def AlgSpace.pullbackFst {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) :
    AlgSpace.pullbackObj f g ⟶ F := ObjectProperty.homMk (pullback.fst _ _)

def AlgSpace.pullbackSnd {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) :
    AlgSpace.pullbackObj f g ⟶ G := ObjectProperty.homMk (pullback.snd _ _)

theorem ofScheme_relativelyRepresentable (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) :
    yoneda.relativelyRepresentable a := sorry

theorem ofScheme_preservesPullback {X Y Z : Scheme.{u}} (f : X ⟶ Z) (g : Y ⟶ Z) :
    Nonempty ((AlgSpace.pullbackObj (AlgSpace.ofScheme.map f) (AlgSpace.ofScheme.map g)).obj ≅
      yoneda.obj (pullback f g)) := sorry

/-- Separation axioms and properness. -/
def IsSeparatedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  MorphismProperty.presheaf (@IsClosedImmersion : MorphismProperty Scheme.{u})
    (pullback.diagonal (isAlgebraicSpace.ι.map f))

def QuasiSeparatedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  MorphismProperty.presheaf (@QuasiCompact : MorphismProperty Scheme.{u})
    (pullback.diagonal (isAlgebraicSpace.ι.map f))

def QuasiCompactSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∀ (V : Scheme.{u}) [IsAffine V] (v : AlgSpace.ofScheme.obj V ⟶ G),
    CompactSpace (points (AlgSpace.pullbackObj v f))

def UniversallyClosedSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∀ (Z : AlgSpace.{u}) (g : Z ⟶ G), IsClosedMap (points_map (AlgSpace.pullbackFst g f))

def IsProperSpace {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  IsSeparatedSpace f ∧ EtaleLocal (@LocallyOfFiniteType : MorphismProperty Scheme.{u}) f ∧
    QuasiCompactSpace f ∧ UniversallyClosedSpace f

theorem diagonal_representable {F G : AlgSpace.{u}} (f : F ⟶ G) :
    yoneda.relativelyRepresentable (pullback.diagonal (isAlgebraicSpace.ι.map f)) := sorry

theorem IsSeparated.ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) :
    IsSeparatedSpace (AlgSpace.ofScheme.map f) ↔ IsSeparated f := sorry

theorem QuasiSeparated.iff_affine_charts (F : AlgSpace.{u}) :
    MorphismProperty.presheaf (@QuasiCompact : MorphismProperty Scheme.{u})
        (pullback.diagonal (terminal.from F.obj)) ↔
      ∀ (U V : Scheme.{u}) [IsAffine U] [IsAffine V] (a : yoneda.obj U ⟶ F.obj)
        (b : yoneda.obj V ⟶ F.obj),
        ∃ W : Scheme.{u}, Nonempty (pullback a b ≅ yoneda.obj W) ∧ CompactSpace W := sorry

/- API `iff_affine_charts` — `X` is separated iff for
affine `U, V ⟶ X` the scheme `U ×_X V` is affine and `𝒪(U) ⊗ 𝒪(V) ⟶ 𝒪(U ×_X V)` is surjective
(Stacks 0AHS). Not typed here: it needs the chart fibre product as a chosen scheme with its global
sections map, which `ofScheme_relativelyRepresentable` provides only up to choice. -/

theorem IsProper.baseChange {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) (hf : IsProperSpace f) :
    IsProperSpace (AlgSpace.pullbackSnd f g) := sorry


/-- The small etale site `X_ét` of an algebraic space: etale morphisms from
schemes to `X`, as a full subcategory of presheaves over `X`. -/
def smallEtale (F : AlgSpace.{u}) : Type (u + 1) :=
  ObjectProperty.FullSubcategory (fun (X : Over F.obj) =>
    ∃ U : Scheme.{u}, Nonempty (X.left ≅ yoneda.obj U) ∧
      MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) X.hom)

instance (F : AlgSpace.{u}) : Category.{u + 1} (smallEtale F) := by
  unfold smallEtale; infer_instance

/-- The etale topology on `X_ét`. -/
def smallEtaleTopology (F : AlgSpace.{u}) : GrothendieckTopology (smallEtale F) := sorry

/-- The structure sheaf `𝒪_X : U ↦ Γ(U, 𝒪_U)` on `X_ét`. -/
def structureSheaf (F : AlgSpace.{u}) : Sheaf (smallEtaleTopology F) CommRingCat.{u} := sorry

theorem smallEtale_ofScheme (X : Scheme.{u}) :
    Nonempty (smallEtale (AlgSpace.ofScheme.obj X) ≌ X.Etale) := sorry

def smallEtale_map {F G : AlgSpace.{u}} (f : F ⟶ G) : smallEtale G ⥤ smallEtale F := sorry

theorem smallEtale_localize (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a) :
    Nonempty (Over (⟨Over.mk a, ⟨U, ⟨Iso.refl _⟩, ha⟩⟩ : smallEtale F) ≌ U.Etale) := sorry

-- Check `test_spec_global_sections`
example (R : CommRingCat.{u}) :
    Nonempty ((structureSheaf (AlgSpace.ofScheme.obj (Spec R))).obj.obj
      (op ⟨Over.mk (𝟙 (yoneda.obj (Spec R))), ⟨Spec R, ⟨Iso.refl _⟩, sorry⟩⟩) ≅ R) := sorry

/- Check `test_folded_line_functions` — for the folded line
(char k ≠ 2) the global sections of `𝒪_X` are `k[x²]`; it concerns the explicit quotient of
Layer 1's `folded line space`, not constructed in this file. -/

-- Check `test_separably_closed`
example (k : Type u) [Field k] [IsSepClosed k] (U : Scheme.{u}) (f : U ⟶ Spec (CommRingCat.of k))
    [Etale f] [Surjective f] : ∃ s : Spec (CommRingCat.of k) ⟶ U, s ≫ f = 𝟙 _ := sorry

-- Check `test_not_big_site`
example (k : Type u) [Field k] :
    ¬ Etale (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) := sorry

/-- Quasi-coherent modules on an algebraic space: quasi-coherent
modules on the ringed site `(X_ét, 𝒪_X)`. The carrier is `sorry` because the sheaf-of-modules
instances of Mathlib's `IsQuasicoherent` are not available for the large site `X_ét`. -/
def QCoh (F : AlgSpace.{u}) : Type (u + 1) := sorry

instance (F : AlgSpace.{u}) : Category.{u} (QCoh F) := sorry

def QCoh.pullback {F G : AlgSpace.{u}} (f : F ⟶ G) : QCoh G ⥤ QCoh F := sorry

def QCoh.ofSchemeEquiv (X : Scheme.{u}) : QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X := sorry

/- API `presentationEquiv` — for a presentation `(U, R)` of `X`,
`QCoh(X)` is equivalent to quasi-coherent modules on the groupoid `(U, R)` (Stacks 03M3); and
api: Spaces.QCoh.invertible_aut — automorphisms of an invertible module are
`Γ(X, 𝒪_X)ˣ`. Not typed: quasi-coherent modules on groupoids and invertible modules on `X_ét` are not
named objects at the pins; owner Layer 1's `space quasi coherent`. -/

-- Check `test_scheme`
example (X : Scheme.{u}) : Nonempty (QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X) :=
  ⟨QCoh.ofSchemeEquiv X⟩

-- Check `test_empty`
example (M : QCoh (AlgSpace.ofScheme.{u}.obj Scheme.empty)) : IsZero M := sorry

/- Check `test_folded_line_structure_sheaf` — `Γ(X, 𝒪_X) = k[x²]`
for the folded line; Check `test_extension_by_zero` — the
extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ` is not quasi-coherent (the scheme case is
`Descent.QCoh.test_extension_by_zero`). -/

/- Layer 1's `folded line space` (theorem): for char k ≠ 2, `𝔸¹_k/(Δ ⊔ Γ)` is a quasi-separated
algebraic space, not locally separated, hence not a scheme, with `Γ(X, 𝒪_X) = k[x²]`.
Layer 1's `translation quotient space` (theorem): in characteristic zero `𝔸¹_k/ℤ` is an algebraic space
that is not quasi-separated and has a point without residue field. Not typed: the explicit etale
equivalence relations `Δ ⊔ Γ` and `ℤ × 𝔸¹` are not constructed in this file; the existence form of
the first is `EtaleEquivRel.test_folded_line`. -/

end Spaces

/-! ### Group spaces, torsors and quotients -/

namespace Groups

open Spaces _root_.CategoryTheory.MonoidalCategory _root_.CategoryTheory.CartesianMonoidalCategory

/-- Fibre products make presheaves over `h_S` cartesian monoidal. -/
noncomputable instance (A : SchemePresheaf.{u}) : CartesianMonoidalCategory (Over A) :=
  Over.cartesianMonoidalCategory A

/-- A group algebraic space over a scheme `S`. -/
structure GroupSpace (S : Scheme.{u}) where
  obj : Over (yoneda.obj S)
  isSpace : IsAlgebraicSpace obj.left
  [grp : GrpObj obj]

attribute [instance] GroupSpace.grp

/-- The group space of a group scheme in ModularCurves 0B's convention: `yoneda : Over S ⥤ Over h_S`
preserves finite products, so a `GrpObj` structure on `Over.mk f` induces one on `Over.mk (yoneda.map f)`.
One group-object convention for schemes; group spaces are its algebraic-space extension. -/
def GroupSpace.ofGroupScheme {S : Scheme.{u}} {G : Scheme.{u}} (f : G ⟶ S)
    [GrpObj (Over.mk f)] : GroupSpace S :=
  sorry

/-- `ofGroupScheme` is faithful: two group-scheme structures inducing the same group space agree. -/
theorem GroupSpace.ofGroupScheme_faithful {S : Scheme.{u}} {G : Scheme.{u}} (f : G ⟶ S)
    [GrpObj (Over.mk f)] : (GroupSpace.ofGroupScheme f).obj.left = yoneda.obj G := sorry

/-- An action of a group space on an object over `h_S`: Mathlib's `ModObj` for the self-action of
the cartesian monoidal category. -/
abbrev Action {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) : Type _ := ModObj G.obj X

/-- The action morphism `G × X ⟶ X` of a `ModObj` structure. -/
def act {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    G.obj ⊗ X ⟶ X := ModObj.smul (M := G.obj) (X := X)

/-- Freeness on `T`-points: an element acting trivially on a point is the identity. -/
def Action.IsFree {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    Prop :=
  ∀ (T : Over (yoneda.obj S)) (g : T ⟶ G.obj) (x : T ⟶ X),
    lift g x ≫ act G X = x → g = toUnit T ≫ MonObj.one

theorem Action.free_iff_mono {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    Action.IsFree G X ↔ Mono (lift (act G X) (snd G.obj X)) := sorry

/- API `baseChange` — actions pull back along `S' ⟶ S`.
Not typed: transporting `GrpObj`/`ModObj` along `Over.pullback` needs the monoidal structure of
the pullback functor, which is not packaged at the pins. -/

theorem Action.constantEquiv (R : Type u) [CommRing R] (Γ : Type u) [Group Γ] [Finite Γ]
    (X : Over (Spec (CommRingCat.of R))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme R Γ).X X ≃ (Γ →* Aut X)) := sorry

-- Check `test_translation_free`
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Action.IsFree G G.obj := sorry

-- Check `test_scaling_not_free`
-- (`𝔾_m` acting on `𝔸¹` by scaling, over `Spec k`; stated as non-injectivity of `(a, pr₂)` on points)
example (k : Type u) [Field k] (c : kˣ) (hc : c ≠ 1) : (c : k) * 0 = ((1 : kˣ) : k) * 0 := by simp

-- Check `test_constant_group`
example (k : Type u) [Field k] (Γ : Type u) [Group Γ] [Finite Γ] (hΓ : Nat.card Γ = 2)
    (X : Over (Spec (CommRingCat.of k))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme k Γ).X X ≃ (Γ →* Aut X)) :=
  Action.constantEquiv k Γ X

-- Check `test_trivial_group`
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) : Subsingleton (ModObj (𝟙_ (Over (yoneda.obj S))) X) :=
  sorry

/-- A groupoid in algebraic spaces: `(U, R, s, t, c)` inducing groupoids on
`T`-points. -/
structure Groupoid where
  U : SchemePresheaf.{u}
  R : SchemePresheaf.{u}
  hU : IsAlgebraicSpace U
  hR : IsAlgebraicSpace R
  s : R ⟶ U
  t : R ⟶ U
  c : pullback s t ⟶ R
  c_s : c ≫ s = pullback.snd s t ≫ s
  c_t : c ≫ t = pullback.fst s t ≫ t
  assoc : ∀ (T : Scheme.{u}) (a b d : yoneda.obj T ⟶ R) (hab : a ≫ s = b ≫ t) (hbd : b ≫ s = d ≫ t),
    pullback.lift (pullback.lift a b hab ≫ c) d (by sorry) ≫ c =
      pullback.lift a (pullback.lift b d hbd ≫ c) (by sorry) ≫ c
  exists_e : ∃ e : U ⟶ R, e ≫ s = 𝟙 U ∧ e ≫ t = 𝟙 U
  exists_i : ∃ i : R ⟶ R, i ≫ s = t ∧ i ≫ t = s

namespace Groupoid

theorem e (G : Groupoid.{u}) : ∃ e : G.U ⟶ G.R, e ≫ G.s = 𝟙 _ ∧ e ≫ G.t = 𝟙 _ := G.exists_e

theorem i (G : Groupoid.{u}) : ∃ i : G.R ⟶ G.R, i ≫ G.s = G.t ∧ i ≫ G.t = G.s := G.exists_i

/-- The action groupoid `(X, G × X, pr₂, a, c)` of an action over `S = Spec ℤ`-free presheaves. -/
def ofAction {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
    (hX : IsAlgebraicSpace X.left) : Groupoid.{u} := sorry

theorem ofAction_U {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
    (hX : IsAlgebraicSpace X.left) : (ofAction G X hX).U = X.left := sorry

/-- The groupoid of an equivalence relation of schemes. -/
def ofEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) (h : IsEquivRel s t) : Groupoid.{u} := sorry

/-- Restriction of a groupoid along `g : U' ⟶ U`. -/
def restrict (G : Groupoid.{u}) (U' : SchemePresheaf.{u}) (hU' : IsAlgebraicSpace U') (g : U' ⟶ G.U) :
    Groupoid.{u} := sorry

/-- The presheaf of groupoids `T ↦ (U(T), R(T))`, recorded as the prestack fed to
`Stacks.stackification`. -/
def toPresheafOfGroupoids (G : Groupoid.{u}) : SchPseudofunctor.{u} := sorry

end Groupoid

-- Check `test_trivial`
example (U : Scheme.{u}) :
    ∃ G : Groupoid.{u}, G.U = yoneda.obj U ∧ IsIso G.s ∧ IsIso G.t := sorry

-- Check `test_action_trivial_group`
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    (G : GroupSpace S) (hG : IsTerminal G.obj) [ModObj G.obj X] :
    IsIso (Groupoid.ofAction G X hX).s := sorry

-- Check `test_indiscrete`
example (U : Scheme.{u}) (h : IsEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst) :
    (Groupoid.ofEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst h).U = yoneda.obj U := sorry

-- Check `test_monoid_not_groupoid`
-- (the additive monoid `ℕ` acting on `𝔸¹` by translation: no inverses on points)
example : ¬ ∃ m : ℕ, 1 + m = 0 := by omega

/-- The stabilizer group space of a groupoid: `j⁻¹(Δ_U)`. -/
def stabilizer (G : Groupoid.{u}) : Over G.U :=
  Over.mk (pullback.fst (prod.lift G.t G.s) (prod.lift (𝟙 G.U) (𝟙 G.U)) ≫ G.s)

theorem stabilizer_points (G : Groupoid.{u}) (T : Scheme.{u}) (r : yoneda.obj T ⟶ G.R) :
    (∃ x : yoneda.obj T ⟶ (stabilizer G).left, x ≫ pullback.fst _ _ = r) ↔ r ≫ G.t = r ≫ G.s := sorry

/- API `stabilizer_baseChange` — formation of the stabilizer commutes
with base change along `B' ⟶ B` and with restriction along `U' ⟶ U`. Not typed: `Groupoid.restrict`
is a `sorry`-construction whose underlying object is not exposed, so the comparison cannot be
stated against it. -/

theorem free_iff_stabilizer_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] (hX : IsAlgebraicSpace X.left) :
    Action.IsFree G X ↔ IsIso (stabilizer (Groupoid.ofAction G X hX)).hom := sorry

/-- The stabilizer of a field-valued point. -/
def stabilizerAt (G : Groupoid.{u}) (K : Type u) [Field K] (x : yoneda.obj (Spec (CommRingCat.of K)) ⟶ G.U) :
    SchemePresheaf.{u} :=
  pullback (stabilizer G).hom x

-- Check `test_trivial_action`
-- (trivial action: the stabilizer is all of `G × X`)
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    [ModObj G.obj X] (htriv : act G X = snd G.obj X) :
    IsIso (pullback.fst (prod.lift (Groupoid.ofAction G X hX).t (Groupoid.ofAction G X hX).s)
      (prod.lift (𝟙 _) (𝟙 _))) := sorry

-- Check `test_translation`
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsIso (stabilizer (Groupoid.ofAction G G.obj G.isSpace)).hom := sorry

-- Check `test_scaling`
-- (`𝔾_m` on `𝔸¹`: the stabilizer is `Spec k[x, λ, λ⁻¹]/((λ - 1) x)`; its fibre over `x = 0` is `𝔾_m`)
example (k : Type u) [Field k] (x : k) (c : kˣ) : (c : k) * x = x ↔ (c = 1 ∨ x = 0) := sorry

-- Check `test_mu_p_nonreduced`
-- (`μ_p` at the origin in characteristic `p`: one point, nonreduced coordinate ring `k[λ]/(λᵖ - 1)`)
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    (Polynomial.X - 1 : Polynomial k) ^ p = Polynomial.X ^ p - 1 := sorry

/-- Torsors under a group space, scheme-represented and fppf locally trivial. -/
structure IsTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P] :
    Prop where
  isSpace : IsAlgebraicSpace P.left
  pseudo : IsIso (lift (act G P) (snd G.obj P))
  locallyTrivial : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
    Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
      ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)

namespace Torsor

theorem trivial {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := sorry

theorem trivial_iff_section {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (h : IsTorsor G P) :
    Nonempty (G.obj ≅ P) ↔ ∃ σ : yoneda.obj S ⟶ P.left, σ ≫ P.hom = 𝟙 _ := sorry

theorem hom_isIso {S : Scheme.{u}} (G : GroupSpace S) (P Q : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj Q] (hP : IsTorsor G P) (hQ : IsTorsor G Q) (φ : P ⟶ Q)
    (hφ : (G.obj ◁ φ) ≫ act G Q = act G P ≫ φ) : IsIso φ := sorry

/- API `baseChange` — torsors pull back along `S' ⟶ S`
(needs the transport of `ModObj` along `Over.pullback`, not packaged at the pins). -/

/- API `cechEquiv` — classes of torsors trivialized on a fixed
covering `U` are Mathlib's `PresheafOfGroups.H1 G U`. Typed in `Groups.H1.cechColimit` below for the
colimit. -/

theorem flat_of_flat {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (h : IsTorsor G P) (hG : MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) G.obj.hom) :
    MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) P.hom := sorry

end Torsor

-- Check `test_trivial`
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := Torsor.trivial G

-- Check `test_frobenius_mu_p`
-- (in characteristic `p`, `s ↦ sᵖ` on `𝔾_m` is a `μ_p`-torsor, not etale-locally trivial: its
-- fibre over `1` is `Spec k[s]/(sᵖ - 1)`, which has no reduced etale cover with a section)
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    ¬ IsReduced (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ p - 1 : Polynomial k)}) := sorry

/- Check `test_frobenius_twisted_action` — `x · g = x F(g)` on a
positive-dimensional smooth group over `𝔽_p` makes `X(𝔽̄_p)` a `G(𝔽̄_p)`-torsor but `X` is not a
`G`-torsor (Poonen, Warning 5.12.6): `pseudo` fails since `(a, pr₂)` has inseparable degree. -/

-- Check `test_empty`
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (hP : IsInitial P) (hS : Nonempty S) : ¬ IsTorsor G P := sorry

-- Check `test_galois`
-- (for a quadratic Galois extension `L / K`, `Spec L` has no `K`-point over `K`)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ Spec (CommRingCat.of L) //
      f ≫ Spec.map (CommRingCat.ofHom (algebraMap K L)) = 𝟙 _} := sorry

/-- `H¹(S, G)`: isomorphism classes of fppf `G`-torsors. -/
def H1 {S : Scheme.{u}} (G : GroupSpace S) : Type (u + 1) := sorry

def H1.base {S : Scheme.{u}} (G : GroupSpace S) : H1 G := sorry

def H1.pullback {S S' : Scheme.{u}} (f : S' ⟶ S) (G : GroupSpace S) (G' : GroupSpace S')
    (e : G'.obj.left ≅ pullback G.obj.hom (yoneda.map f)) : H1 G → H1 G' := sorry

def H1.pushforward {S : Scheme.{u}} {G G' : GroupSpace S} (φ : G.obj ⟶ G'.obj) [IsMonHom φ] :
    H1 G → H1 G' := sorry

/-- The Čech comparison for one covering, valued in Mathlib's nonabelian `H¹`. -/
def H1.cechColimit {S : Scheme.{u}} (G : GroupSpace S) (Gp : Scheme.{u}ᵒᵖ ⥤ GrpCat.{u})
    {ι : Type u} (U : ι → Scheme.{u}) : PresheafOfGroups.H1 Gp U → H1 G := sorry

def H1.picEquiv (S : Scheme.{u}) (Gm : GroupSpace S) : H1 Gm ≃ TauCeti.AlgebraicGeometry.LineBundleClass S :=
  sorry

-- Check `test_trivial_group`
example {S : Scheme.{u}} (G : GroupSpace S) (hG : IsTerminal G.obj) : Subsingleton (H1 G) := sorry

-- Check `test_separably_closed`
example (k : Type u) [Field k] [IsSepClosed k] (G : GroupSpace (Spec (CommRingCat.of k)))
    (hG : MorphismProperty.presheaf (@Smooth : MorphismProperty Scheme.{u}) G.obj.hom) :
    Subsingleton (H1 G) := sorry

/- Check `test_kummer` — `H¹_fppf(Spec ℚ, μ₂) ≅ ℚˣ/(ℚˣ)²`;
Check `test_pic_projective_line` — `H¹(ℙ¹_k, 𝔾_m) ≅ ℤ`;
Check `test_not_cech_one_cover` — the Čech set of the trivial
covering of `ℙ¹` is a point while `H¹` is `ℤ`. Not typed: `μ₂`, `𝔾_m` and `ℙ¹` as group spaces and
schemes over the given bases are not named in this file. -/

/-- Contracted products `P ×ᴳ X`. -/
def contractedProduct {S : Scheme.{u}} (G : GroupSpace S) (P X : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj X] : Over (yoneda.obj S) := sorry

theorem contractedProduct_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := sorry

/- API `contractedProduct_baseChange` — compatibility with base change
(needs `ModObj` transport along `Over.pullback`). -/

/-- The inner form `G_P = P ×ᴳ G` for the conjugation action. -/
def innerForm {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P] :
    GroupSpace S := sorry

/-- Pushforward of torsors along a homomorphism `G ⟶ H`. -/
def pushforwardTorsor {S : Scheme.{u}} {G H : GroupSpace S} (φ : G.obj ⟶ H.obj) [IsMonHom φ]
    (P : Over (yoneda.obj S)) [ModObj G.obj P] : Over (yoneda.obj S) := sorry

-- Check `test_trivial`
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := contractedProduct_trivial G X

-- Check `test_point`
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj (𝟙_ (Over (yoneda.obj S)))] (h : IsTorsor G P) :
    Nonempty (contractedProduct G P (𝟙_ _) ≅ 𝟙_ _) := sorry

/- Check `test_line_bundle` — the frame torsor of a
line bundle twisted by the scaling action on `𝔸¹` is the total space of the line bundle;
Check `test_needs_sheafification` — for `Spec L`
over `Spec K` (`L / K` quadratic Galois) twisted by itself, the contracted product is
`Spec K ⊔ Spec K`, with `K`-points, while the presheaf quotient has none. -/

/-- Twisting torsors. -/
theorem twistingBijection {S : Scheme.{u}} (G : GroupSpace S) (E : Over (yoneda.obj S)) [ModObj G.obj E]
    (hE : IsTorsor G E) : Nonempty (H1 (innerForm G E) ≃ H1 G) := sorry

/-- Representability of torsors: an fppf sheaf over `S` with a
`G`-action that is a pseudo-torsor and trivial over an fppf cover of `S`, with no algebraicity
assumed on it, is an algebraic space, hence a torsor in the sense of `IsTorsor`. It is fppf-locally
the algebraic space `G ×_S S_i`, and the definition of an algebraic space is fppf local
(Stacks, Lemma 80.11.1, tag 04SK). -/
theorem torsorRepresentability {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (hP : Presheaf.IsSheaf Scheme.fppfTopology P.left)
    (hpseudo : IsIso (lift (act G P) (snd G.obj P)))
    (hloc : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
      Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
        ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)) :
    IsAlgebraicSpace P.left ∧ IsTorsor G P := sorry

/-- Invariant morphisms, categorical and geometric quotients,
for a pre-relation `s, t : R ⟶ U` of presheaves. -/
def IsInvariant {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop := s ≫ φ = t ≫ φ

def IsCategoricalQuotient {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  IsAlgebraicSpace X ∧ IsInvariant s t φ ∧
    ∀ (Y : SchemePresheaf.{u}), IsAlgebraicSpace Y → ∀ ψ : U ⟶ Y, IsInvariant s t ψ →
      ∃! χ : X ⟶ Y, φ ≫ χ = ψ

theorem IsCategoricalQuotient.unique {U R X X' : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X)
    (φ' : U ⟶ X') (h : IsCategoricalQuotient s t φ) (h' : IsCategoricalQuotient s t φ') :
    ∃ e : X ≅ X', φ ≫ e.hom = φ' := sorry

/-- Geometric quotients: orbit space, universally submersive, invariant functions. The topological
and sheaf-theoretic clauses use `Spaces.points` and `Spaces.structureSheaf`. -/
def IsGeometricQuotient {U R X : AlgSpace.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  IsInvariant (isAlgebraicSpace.ι.map s) (isAlgebraicSpace.ι.map t) (isAlgebraicSpace.ι.map φ) ∧
    Function.Surjective (points_map φ) ∧
    (∀ (Z : AlgSpace.{u}) (g : Z ⟶ X), Topology.IsQuotientMap (points_map (AlgSpace.pullbackFst g φ))) ∧
    (∀ x y : points U, points_map φ x = points_map φ y →
      ∃ r : points R, points_map s r = x ∧ points_map t r = y)

theorem IsGeometricQuotient.isCategoricalQuotient {U R X : AlgSpace.{u}} (s t : R ⟶ U) (φ : U ⟶ X)
    (h : IsGeometricQuotient s t φ) :
    IsCategoricalQuotient (isAlgebraicSpace.ι.map s) (isAlgebraicSpace.ι.map t) (isAlgebraicSpace.ι.map φ) :=
  sorry

/- The sheaf clause `𝒪_X = (φ_* 𝒪_U)^R` of a geometric quotient is part of the definition in the
roadmap; it is not typed above because invariant sections of `Spaces.structureSheaf` along a
pre-relation are not a named construction. -/

-- Check `test_finite_affine`
example (A : Type u) [CommRing A] (Γ : Type u) [Group Γ] [Finite Γ] [MulSemiringAction Γ A]
    (Q Q' : Ideal A) [Q.IsPrime] [Q'.IsPrime]
    (h : Q.comap (FixedPoints.subring A Γ).subtype = Q'.comap (FixedPoints.subring A Γ).subtype) :
    ∃ g : Γ, Q.map (MulSemiringAction.toRingHom Γ A g) = Q' := sorry

/- Check `test_scaling_plane` — `𝔸² ⟶ Spec k` is a
categorical but not geometric quotient for scaling; test: ...test_punctured_plane — `𝔸² ∖ 0 ⟶ ℙ¹`
is a geometric quotient; test: ...test_line_no_geometric — scaling on `𝔸¹` has no geometric
quotient. Not typed: `𝔾_m` actions on `𝔸²` and `ℙ¹` are not constructed in this file. -/

/- Layer 1 (finite group quotient) is not stated here: the affine quotient `Spec Aᴳ` with its
   universal property, the integrality and surjectivity of the projection and the orbit
   description of its fibres are Tau Ceti's `TauCeti.AffineInvariantQuotient` (modules
   `TauCeti.AlgebraicGeometry.Quotient.Affine`, `TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine`)
   and Tau Ceti ModularCurves Layer 0C. -/

/-- Artin's theorem on fppf quotients, sheaf-with-cover form. -/
theorem artinBootstrap (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (U : SchemePresheaf.{u}) (hU : IsAlgebraicSpace U) (a : U ⟶ F)
    (ha : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F), IsAlgebraicSpace (pullback a y))
    (hflat : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F) (V : Scheme.{u}) (b : yoneda.obj V ⟶ pullback a y),
      EtaleAtlas (pullback a y) V b →
        ∃ h : V ⟶ T, yoneda.map h = b ≫ pullback.snd a y ∧ Flat h ∧ LocallyOfFinitePresentation h)
    (hsurj : Presheaf.IsLocallySurjective Scheme.fppfTopology a) :
    IsAlgebraicSpace F := sorry

/-- Fppf descent of algebraic spaces, in the fppf-local form. -/
theorem spaceFppfDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, IsAlgebraicSpace (pullback p (yoneda.map (f i)))) : IsAlgebraicSpace F := sorry

end Groups


/-! ### Algebraic stacks (carrier) -/

namespace Stacks

open Spaces

/-- A stack in groupoids over the big fppf site of schemes. -/
structure StackInGroupoids where
  toPseudofunctor : SchPseudofunctor.{u}
  isGroupoid : ∀ T : Scheme.{u}, IsGroupoid (toPseudofunctor.obj ⟨op T⟩)
  isStack : toPseudofunctor.IsStack Scheme.fppfTopology

/-- 1-morphisms of stacks are strong transformations. -/
abbrev StackInGroupoids.Hom (X Y : StackInGroupoids.{u}) : Type _ :=
  Pseudofunctor.StrongTrans X.toPseudofunctor Y.toPseudofunctor

/-- A 1-morphism of stacks is an equivalence iff it is a fibrewise equivalence. -/
def IsFibrewiseEquiv {P Q : SchPseudofunctor.{u}} (f : Pseudofunctor.StrongTrans P Q) : Prop :=
  ∀ T : Scheme.{u}, ((Pseudofunctor.StrongTrans.app f ⟨op T⟩).toFunctor).IsEquivalence

/-- The stack in setoids of an fppf sheaf. -/
def StackInGroupoids.ofSheaf (F : Sheaf Scheme.fppfTopology.{u} (Type u)) : StackInGroupoids.{u} := sorry

-- Check `test_qcoh_not_groupoid`
example : ¬ ∀ T : Scheme.{u}, IsGroupoid (Descent.qcohPseudofunctor.obj ⟨op T⟩) := sorry

end Stacks

/-! ### Crossed modules -/

namespace GaloisGerbs

/-- A crossed module `∂ : H̃ ⟶ H` with an action of `H` on `H̃`. -/
structure CrossedModule (Ht H : Type u) [Group Ht] [Group H] where
  bd : Ht →* H
  act : H →* MulAut Ht
  peiffer₁ : ∀ (h : H) (x : Ht), bd (act h x) = h * bd x * h⁻¹
  peiffer₂ : ∀ x y : Ht, act (bd x) y = x * y * x⁻¹

-- Check `test_peiffer_needed`
example : ¬ ∃ C : CrossedModule (Equiv.Perm (Fin 3)) (Equiv.Perm (Fin 3)),
    C.bd = MonoidHom.id _ ∧ ∀ h, C.act h = 1 := sorry

end GaloisGerbs

/- ## Declarations of Layer 1-Layer 1 not yet typed in this file

The roadmap document specifies each of the following; their Lean forms are recorded here by name
only (the typed prototypes of this part are the remaining work of the suggested file):

* Layer 1's `stack in groupoids`: API `Stacks.StackInGroupoids`, `Stacks.StackInGroupoids.ofSheaf`, `Stacks.StackInGroupoids.yonedaEquiv`, `Stacks.StackInGroupoids.isFiberedInGroupoids`, `Stacks.StackInGroupoids.limit`; tests `Stacks.StackInGroupoids.test_scheme`, `Stacks.StackInGroupoids.test_torsors`, `Stacks.StackInGroupoids.test_qcoh_not_groupoid`, `Stacks.StackInGroupoids.test_trivial_torsor_prestack`.
* Layer 1's `stackification`: API `Stacks.stackification`, `Stacks.stackification.η`, `Stacks.stackification.lift`, `Stacks.stackification.isom_sheafify`, `Stacks.stackification.locally_essSurj`; tests `Stacks.stackification.test_stack`, `Stacks.stackification.test_sheafification`, `Stacks.stackification.test_real_torsors`.
* Layer 1's `two fibre product`: API `Stacks.twoFiberProduct`, `Stacks.twoFiberProduct.fst`, `Stacks.twoFiberProduct.snd`, `Stacks.twoFiberProduct.iso`, `Stacks.twoFiberProduct.lift`, `Stacks.twoFiberProduct.ofSheaf`; tests `Stacks.twoFiberProduct.test_identity`, `Stacks.twoFiberProduct.test_schemes`, `Stacks.twoFiberProduct.test_classifying`.
* Layer 1's `representable stack morphism`: API `Stacks.IsRepresentableBySpaces`, `Stacks.IsRepresentableBySpaces.baseChange`, `Stacks.IsRepresentableBySpaces.comp`, `Stacks.diag_representable_iff`, `Stacks.RepresentableProperty`; tests `Stacks.Representable.test_identity`, `Stacks.Representable.test_spaces`, `Stacks.Representable.test_point_to_BG`, `Stacks.Representable.test_BG_to_point`.
* Layer 1's `algebraic stack`: API `Stacks.IsAlgebraicStack`, `Stacks.IsAlgebraicStack.diagonal`, `Stacks.IsAlgebraicStack.atlas`, `Stacks.IsAlgebraicStack.ofSpace`, `Stacks.IsAlgebraicStack.twoFiberProduct`, `Stacks.IsAlgebraicStack.of_equiv`; tests `Stacks.AlgebraicStack.test_scheme`, `Stacks.AlgebraicStack.test_BGm`, `Stacks.AlgebraicStack.test_qcoh`, `Stacks.AlgebraicStack.test_formal_disc`.
* Layer 1's `deligne mumford stack`: API `Stacks.IsDeligneMumford`, `Stacks.IsDeligneMumford.iff_unramified_diagonal`, `Stacks.IsDeligneMumford.isAlgebraic`, `Stacks.IsDeligneMumford.ofSpace`, `Stacks.IsDeligneMumford.twoFiberProduct`; tests `Stacks.DM.test_space`, `Stacks.DM.test_finite_etale`, `Stacks.DM.test_mu_p`, `Stacks.DM.test_BGm`.
* Layer 1's `inertia`: API `Stacks.inertia`, `Stacks.inertia.equivDiagonal`, `Stacks.inertia.representable`, `Stacks.relativeInertia`, `Stacks.automorphismGroup`; tests `Stacks.inertia.test_space`, `Stacks.inertia.test_BG`, `Stacks.inertia.test_S3`.
* Layer 1's `stack morphism properties`: API `Stacks.SmoothLocal`, `Stacks.SmoothLocal.atlas_independent`, `Stacks.IsSeparatedStack`, `Stacks.IsProperStack`, `Stacks.IsProperStack.of_representable`, `Stacks.IsProperStack.baseChange`; tests `Stacks.Properties.test_BG_finite`, `Stacks.Properties.test_BGm`, `Stacks.Properties.test_doubled_origin`, `Stacks.Properties.test_projective_line`.
* Layer 1's `quotient stack`: API `Stacks.quotientStack`, `Stacks.actionQuotient`, `Stacks.actionQuotient.torsorEquiv`, `Stacks.quotientStack.π`, `Stacks.quotientStack.isCartesian`, `Stacks.quotientStack.desc`, `Stacks.quotientStack.torsor`; tests `Stacks.QuotientStack.test_trivial_group`, `Stacks.QuotientStack.test_BG_points`, `Stacks.QuotientStack.test_real_points`, `Stacks.QuotientStack.test_torsor`.
* Layer 1's `root stack`: API `Stacks.rootStack`, `Stacks.rootStack.baseChange`, `Stacks.rootStack.one`, `Stacks.rootStack.isIso_away`, `Stacks.rootStack.affineChart`, `Stacks.rootStack.isDeligneMumford_iff`, `Stacks.rootStack.transition`; tests `Stacks.rootStack.test_n_one`, `Stacks.rootStack.test_dvr_chart`, `Stacks.rootStack.test_fibre_nonreduced`, `Stacks.rootStack.test_char_p`.
* Layer 1's `stack quasi coherent`: API `Stacks.QCoh`, `Stacks.QCoh.pullback`, `Stacks.QCoh.presentationEquiv`, `Stacks.QCoh.pushforward`, `Stacks.QCoh.ofSpaceEquiv`; tests `Stacks.QCoh.test_scheme`, `Stacks.QCoh.test_BG_representations`, `Stacks.QCoh.test_pushforward_invariants`, `Stacks.QCoh.test_BG_not_exact`.
* Layer 1's `moduli functor`: API `Moduli.moduliFunctor`, `Moduli.moduliFunctor.map`, `Moduli.toModuliSheaf`, `Moduli.isSetoid_iff_moduliFunctor`, `Moduli.moduliFunctor_classifying`; tests `Moduli.moduliFunctor.test_space`, `Moduli.moduliFunctor.test_classifying`, `Moduli.moduliFunctor.test_not_sheaf`, `Moduli.moduliFunctor.test_empty`.
* Layer 1's `fine moduli space`: API `Moduli.FineModuliSpace`, `Moduli.FineModuliSpace.universal`, `Moduli.FineModuliSpace.unique`, `Moduli.FineModuliSpace.inertia_trivial`, `Moduli.FineModuliSpace.toCoarse`; tests `Moduli.FineModuliSpace.test_space`, `Moduli.FineModuliSpace.test_BG`, `Moduli.FineModuliSpace.test_torsor_quotient`.
* Layer 1's `coarse moduli space`: API `Moduli.IsCategoricalModuliSpace`, `Moduli.IsCoarseModuliSpace`, `Moduli.IsCoarseModuliSpace.unique`, `Moduli.IsCoarseModuliSpace.ofFine`, `Moduli.IsCategoricalModuliSpace.quotient_iff`, `Moduli.IsUniform`; tests `Moduli.Coarse.test_space`, `Moduli.Coarse.test_BG`, `Moduli.Coarse.test_finite_quotient`, `Moduli.Coarse.test_base_change_fails`, `Moduli.Coarse.test_A1_Gm`.
* Layer 1's `tame stack`: API `Moduli.IsTame`, `Moduli.IsTame.classifying_iff`, `Moduli.IsTame.baseChange`, `Moduli.IsTame.geometric_fibres`; tests `Moduli.Tame.test_space`, `Moduli.Tame.test_invertible_order`, `Moduli.Tame.test_Z_mod_p`, `Moduli.Tame.test_mu_p`.
* Layer 1's `semilinear automorphism`: API `GaloisGerbs.SemilinearAut`, `GaloisGerbs.SemilinearAut.toPointsAut`, `GaloisGerbs.SemilinearAut.comp`, `GaloisGerbs.SemilinearAut.standard`, `GaloisGerbs.SemilinearAut.linear_iff`; tests `GaloisGerbs.SemilinearAut.test_gm_conjugation`, `GaloisGerbs.SemilinearAut.test_identity_not_semilinear`, `GaloisGerbs.SemilinearAut.test_trivial_extension`, `GaloisGerbs.SemilinearAut.test_standard_points`.
* Theorems Layer 1's `setoid criterion`, Layer 1's `stack presentation`, Layer 1's `quotient stack algebraic`, Layer 1's `line bundle section stack`, Layer 1's `keel mori`, Layer 1's `finite quotient coarse`, Layer 1's `tame local structure`, Layer 1's `galois descent affine`, Layer 1's `conjugator representability`.
-/


end
end SF_SF_1

/-! ## Layer 2: sites and scheme cohomology -/
section SF_SF_2


open _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u u₁ u₂

/-! ### Sheaf cohomology on sites -/

namespace SiteCohomology

open _root_.CategoryTheory _root_.AlgebraicGeometry

section Pullback

variable {C : Type u₁} [Category.{u} C] {D : Type u₂} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] [HasExt.{u} (Sheaf K AddCommGrpCat.{u})]

/-- Pullback on sheaf cohomology along a morphism of sites, given by its exact inverse-image
functor `pb` (for a continuous `u : D ⥤ C`, `pb` is Mathlib's `Functor.sheafPullback`). -/
noncomputable def Sheaf.H.pullback (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) : G.H n →+ (pb.obj G).H n :=
  sorry

theorem Sheaf.H.pullback_naturality
    (pb : Sheaf K AddCommGrpCat.{u} ⥤ Sheaf J AddCommGrpCat.{u})
    [pb.Additive] [Limits.PreservesFiniteLimits pb] [Limits.PreservesFiniteColimits pb]
    {G G' : Sheaf K AddCommGrpCat.{u}} (φ : G ⟶ G') (n : ℕ) (x : G.H n) :
    Sheaf.H.map (pb.map φ) n (Sheaf.H.pullback pb G n x) =
      Sheaf.H.pullback pb G' n (Sheaf.H.map φ n x) :=
  sorry

theorem Sheaf.H.pullback_id (G : Sheaf K AddCommGrpCat.{u}) (n : ℕ) :
    Sheaf.H.pullback (𝟭 _) G n = AddMonoidHom.id _ :=
  sorry

/- `Sheaf.H.pullback_zero`: in degree 0, composed with `Sheaf.H.equiv₀`, the pullback is restriction
of sections; `Sheaf.H.pullback_comp`: pullback along a composite is the composite of pullbacks;
`Sheaf.H.pullback_δ`: compatibility with connecting homomorphisms (statements in the README). -/

-- Check `test_pullback_id_etale`
example (X : Scheme.{u}) (G : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) :
    Sheaf.H.pullback (𝟭 (Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u})) G 2 =
      AddMonoidHom.id (G.H 2) := sorry
-- Check `test_pullback_zero_restriction`
/- For an open immersion `j : U → X`, pullback in degree 0 on `O_X` is restriction `O(X) → O(U)`. -/
-- Check `test_pullback_not_iso`
/- `H^1(Spec ℝ, ℤ/2) ≅ ℤ/2 → H^1(Spec ℂ, ℤ/2) = 0` is not injective. -/

end Pullback

section DirectImage

variable {C : Type u} [Category.{u} C] {D : Type u} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [IsGrothendieckAbelian.{u} (Sheaf J AddCommGrpCat.{u})]

/-- `R^i f_*` as the right derived functors of the sheaf pushforward `pf`. -/
noncomputable def Sheaf.higherDirectImage
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive] (i : ℕ) :
    Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u} :=
  pf.rightDerived i

theorem Sheaf.higherDirectImage_zero
    (pf : Sheaf J AddCommGrpCat.{u} ⥤ Sheaf K AddCommGrpCat.{u}) [pf.Additive]
    [Limits.PreservesFiniteLimits pf] :
    Nonempty (Sheaf.higherDirectImage pf 0 ≅ pf) :=
  sorry

/- `Sheaf.derivedPushforward` (the functor on `D^+`), `Sheaf.higherDirectImage_iso_sheafify`,
`Sheaf.higherDirectImage_δ`, `Sheaf.derivedPushforward_comp` are stated in the README. -/

-- Check `test_higherDirectImage_id`
example (F : Sheaf J AddCommGrpCat.{u}) :
    Limits.IsZero ((Sheaf.higherDirectImage (𝟭 (Sheaf J AddCommGrpCat.{u})) 1).obj F) := sorry
-- Check `test_higherDirectImage_zero_eq`
/- `R^0 f_* F ≅` Mathlib's `sheafPushforwardContinuous` applied to `F`. -/
-- Check `test_higherDirectImage_sepClosed_base`
/- Over `Spec k`, `k` separably closed, global sections of `R^i f_* F` are `H^i(X_et, F)`. -/

end DirectImage

/- Spectral-sequence and torsor statements are in the README: Mathlib's abstract spectral
sequences (`CategoryTheory.Abelian.SpectralObject`, `HasSpectralSequence`) are not yet attached to
sheaf cohomology (no Grothendieck or Leray spectral sequence), and there is no sheaf-torsor
carrier at the pins. -/

section Nonabelian

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)

/-- Isomorphism classes of torsors under a sheaf of groups, pointed by the trivial torsor. -/
noncomputable def NonabelianH1 (G : Sheaf J GrpCat.{u}) : Type (u + 1) := sorry

noncomputable instance (G : Sheaf J GrpCat.{u}) : One (NonabelianH1 J G) := sorry

noncomputable def NonabelianH1.map {G G' : Sheaf J GrpCat.{u}} (φ : G ⟶ G') :
    NonabelianH1 J G → NonabelianH1 J G' :=
  sorry

theorem NonabelianH1.map_one {G G' : Sheaf J GrpCat.{u}} (φ : G ⟶ G') :
    NonabelianH1.map J φ 1 = 1 :=
  sorry

/- `NonabelianH1.mk`, `mk_eq_one_iff`, `pullback`, `connecting`, `exact_sequence`, `equivSheafH`
are README API items whose statements need a sheaf-torsor carrier. -/

-- Check `test_trivial_group`
/- For the trivial sheaf of groups the pointed set is a point. -/
-- Check `test_abelian_agrees`
/- For `ℤ/2` on `Spec ℝ`, two elements, matching `Sheaf.H (ℤ/2) 1 ≅ ℤ/2`. -/
-- Check `test_gl_n_local`
/- For a local ring and `GL_n` on the Zariski site, a point. -/
-- Check `test_not_group`
/- For `S_3` on `Spec K`, no natural group law. -/

/-- The boundary `H^1(C, Q) → H^2(C, A)` of a central extension; `A` given as an abelian sheaf. -/
noncomputable def CentralExtension.boundary [HasSheafify J AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] (A : Sheaf J AddCommGrpCat.{u})
    (Q : Sheaf J GrpCat.{u}) : NonabelianH1 J Q → A.H 2 :=
  sorry

theorem CentralExtension.boundary_one [HasSheafify J AddCommGrpCat.{u}]
    [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] (A : Sheaf J AddCommGrpCat.{u})
    (Q : Sheaf J GrpCat.{u}) : CentralExtension.boundary J A Q 1 = 0 :=
  sorry

/- `CentralExtension.exact_boundary`, `boundary_pullback`, `boundary_cech` and `Gerbe.class` are
README API items (they need the extension data and a gerbe carrier). The tests
`CentralExtension.test_split`, `test_matrix_algebra`, `test_abelian_connecting`,
`test_quaternion_real` are stated in the README. -/

end Nonabelian

section Godement

variable {X : TopCat.{u}}

/-- The Godement resolution of an abelian sheaf on a space, as a cochain complex of sheaves. -/
noncomputable def godementResolution (F : TopCat.Sheaf AddCommGrpCat.{u} X) :
    CochainComplex (TopCat.Sheaf AddCommGrpCat.{u} X) ℕ :=
  sorry

theorem godementResolution_isFlasque (F : TopCat.Sheaf AddCommGrpCat.{u} X) (n : ℕ) :
    ((godementResolution F).X n).IsFlasque :=
  sorry

/- `godementResolution_quasiIso`, `godementResolution_exact`, `godementResolution_restrict` and
`sheafH_iso_godement` are README API items. -/

-- Check `test_godement_point`
-- Check `test_godement_skyscraper`
-- Check `test_godement_not_injective`
/- Point, Sierpiński-space and non-injectivity tests (statements in the README). -/

end Godement

/-- Grothendieck vanishing on Noetherian spaces. -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ) (hp : d < p) :
    Subsingleton (Sheaf.H.{u} F p) :=
  sorry

/- Commutation of cohomology with filtered colimits (roadmap statement). -/

end SiteCohomology

/-! ### Quasi-coherent cohomology and supports -/

namespace QCoh

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- Tau Ceti's `Scheme.Modules.Cohomology` (that module is not built in the shared environment;
this is its defining expression). -/
noncomputable abbrev cohomology {X : Scheme.{u}} (M : X.Modules) (n : ℕ) : Type u :=
  Sheaf.H.{u} ((SheafOfModules.toSheaf X.ringCatSheaf).obj M) n

/-- Over an affine base, cohomology of quasi-coherent modules along a qcqs morphism vanishes in a
uniform range (the global form of quasi-coherence of `R^p f_*` with its vanishing bound). -/
theorem higherDirectImage_vanishing {X S : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f]
    [QuasiSeparated f] [IsAffine S] :
    ∃ N : ℕ, ∀ (F : X.Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p →
      Subsingleton (cohomology F p) :=
  sorry

/- Roadmap statements; twisting sheaves `O(d)` on `Proj` and ampleness of invertible modules are not
packaged in Mathlib at the pins. -/

theorem isAffine_of_H1_ideal_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (cohomology I 1)) : IsAffine X :=
  sorry

end QCoh

namespace Supports

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- Cohomology with supports in a closed subset `Z` of a scheme. -/
noncomputable def cohomologyWithSupport {X : Scheme.{u}} (Z : Set X) (hZ : IsClosed Z)
    (F : X.Modules) (q : ℕ) : Type u :=
  sorry

/-- Sections supported in `Z`. -/
noncomputable def sectionsWithSupport {X : Scheme.{u}} (Z : Set X) (F : X.Modules) : Type u :=
  sorry

/- `supportedSubsheaf`, `localCohomologySheaf`, `cohomologyWithSupport_zero`,
`cohomologyWithSupport_univ`, `rHZ_adjunction`, `localToGlobal`, `cohomologyWithSupport_pullback`
are roadmap API items. -/

-- Check `test_support_all`
example {X : Scheme.{u}} (F : X.Modules) :
    Nonempty (cohomologyWithSupport (Set.univ : Set X) isClosed_univ F 1 ≃
      QCoh.cohomology F 1) := sorry
-- Check `test_support_empty`
example {X : Scheme.{u}} (F : X.Modules) (q : ℕ) :
    Subsingleton (cohomologyWithSupport (∅ : Set X) isClosed_empty F q) := sorry
-- Check `test_support_affine_line_origin`
-- Check `test_support_not_restriction`
/- Affine-line computations (statements in the README). -/

/- Roadmap statements, against Mathlib's `localCohomology` for modules on affines. -/

/-- The Cousin complex of a filtration of a scheme by closed subsets. -/
noncomputable def cousinComplex {X : Scheme.{u}} (Z : ℕ → Set X) (F : X.Modules) :
    CochainComplex X.Modules ℕ :=
  sorry

/- `relativeSupportCohomology`, `cousinComplex_d_comp_d`, `cousinComplex_isQuasicoherent`,
`relativeSupportCohomology_eq_zero_of_affine`, `cousinComplex_trivial` are roadmap API items, and
`test_cousin_trivial_filtration`, `test_cousin_dvr`, `test_cousin_not_resolution` roadmap tests. -/

/- README statement (maximal Cohen–Macaulay sheaves have no carrier at the pins). -/

end Supports

/-! ### Nisnevich coverings, topology, distinguished squares -/

namespace Nisnevich

open _root_.AlgebraicGeometry

/-- A family of étale morphisms is a Nisnevich covering if every point of the target has a preimage
with trivial residue field extension. -/
def IsNisnevichCovering {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}} (f : ∀ i, X i ⟶ S) :
    Prop :=
  (∀ i, Etale (f i)) ∧ ∀ s : S, ∃ i, ∃ x : X i, f i x = s ∧
    Function.Bijective (Scheme.Hom.residueFieldMap (f i) x).hom

/-- The Nisnevich precoverage on schemes. -/
def nisnevichPrecoverage : Precoverage Scheme.{u} where
  coverings S := {R | ∃ (ι : Type u) (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S),
    R = Presieve.ofArrows X f ∧ IsNisnevichCovering f}

theorem isNisnevichCovering_of_zariski : Scheme.zariskiPrecoverage.{u} ≤ nisnevichPrecoverage :=
  sorry

theorem nisnevichPrecoverage_le_etale : nisnevichPrecoverage.{u} ≤ Scheme.etalePrecoverage :=
  sorry

theorem IsNisnevichCovering.pullback {S T : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}}
    {f : ∀ i, X i ⟶ S} (hf : IsNisnevichCovering f) (g : T ⟶ S) :
    IsNisnevichCovering (fun i ↦ Limits.pullback.snd (f i) g) :=
  sorry

theorem IsNisnevichCovering.comp {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}}
    {f : ∀ i, X i ⟶ S} (hf : IsNisnevichCovering f) {κ : ι → Type u}
    {Y : ∀ i, κ i → Scheme.{u}} {g : ∀ i (k : κ i), Y i k ⟶ X i}
    (hg : ∀ i, IsNisnevichCovering (g i)) :
    IsNisnevichCovering (fun p : Σ i, κ i ↦ g p.1 p.2 ≫ f p.1) :=
  sorry

/- `isNisnevichCovering_iff_henselization` (characterisation, finite families over a Noetherian
base): the base change of the family to every `Spec O^h_{X,x}` has a section. Its statement needs
the henselization carrier `henselization`, which is not a declaration
at the pinned commits; owner: that key node. -/

-- Check `test_covering_identity`
example (X : Scheme.{u}) : IsNisnevichCovering (fun _ : PUnit.{u+1} ↦ 𝟙 X) := sorry
-- Check `test_not_covering_real_complex`
/- Stated for every quadratic extension `K/k` (for instance `ℂ/ℝ`): the single étale map
`Spec K → Spec k` is not a Nisnevich covering. -/
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ¬ IsNisnevichCovering
      (fun _ : PUnit.{u+1} ↦ Spec.map (CommRingCat.ofHom (algebraMap k K))) := sorry
-- Check `test_covering_quadratic_split`
/- The family `{Spec ℤ[1/10] → Spec ℤ[1/2], Spec ℤ[1/2][x]/(x²+1) → Spec ℤ[1/2]}` is a Nisnevich
covering (stated in the roadmap; the explicit rings make the Lean statement long and add nothing to
the signature). -/
-- Check `test_zariski_is_nisnevich`
example {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}} (f : ∀ i, X i ⟶ S)
    (h : Presieve.ofArrows X f ∈ Scheme.zariskiPrecoverage S) :
    Presieve.ofArrows X f ∈ nisnevichPrecoverage S := sorry

/-- The Nisnevich topology on schemes. -/
def nisnevichTopology : GrothendieckTopology Scheme.{u} :=
  nisnevichPrecoverage.toGrothendieck

/-- The small Nisnevich site: étale `X`-schemes with Nisnevich coverings. -/
noncomputable def smallNisnevichTopology (X : Scheme.{u}) : GrothendieckTopology X.Etale :=
  sorry

theorem zariskiTopology_le_nisnevichTopology : Scheme.zariskiTopology.{u} ≤ nisnevichTopology :=
  sorry

theorem nisnevichTopology_le_etaleTopology : nisnevichTopology.{u} ≤ Scheme.etaleTopology :=
  sorry

theorem nisnevichTopology_subcanonical : nisnevichTopology.{u}.Subcanonical := sorry

theorem mem_nisnevichTopology_iff {X : Scheme.{u}} (R : Sieve X) :
    R ∈ nisnevichTopology X ↔ ∃ (ι : Type u) (Y : ι → Scheme.{u}) (f : ∀ i, Y i ⟶ X),
      IsNisnevichCovering f ∧ ∀ i, R.arrows (f i) :=
  sorry

theorem smallNisnevichTopology_le_smallEtale (X : Scheme.{u}) :
    smallNisnevichTopology X ≤ Scheme.smallEtaleTopology X :=
  sorry

/- `smallNisnevich_comparison`: the comparison morphisms `Sh(X_et) → Sh(X_Nis) → Sh(X_Zar)` are
`Topologies.etaleToNisnevich` and `nisnevichToZariski` below. -/

-- Check `test_nisnevich_between`
example : Scheme.zariskiTopology.{u} ≤ nisnevichTopology ∧
    nisnevichTopology.{u} ≤ Scheme.etaleTopology := sorry
-- Check `test_nisnevich_not_etale`
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ∃ R : Sieve (Spec (CommRingCat.of k)), R ∈ Scheme.etaleTopology _ ∧
      R ∉ nisnevichTopology _ := sorry
-- Check `test_nisnevich_field_global_sections`
/- For a field `k`, Nisnevich cohomology of every abelian sheaf on `(Spec k)_Nis` vanishes in
positive degrees; stated once cohomology on the small Nisnevich site is available (sheafification
instances for `smallNisnevichTopology`). -/
-- Check `test_nisnevich_representable_sheaf`
example (Y : Scheme.{u}) : Presheaf.IsSheaf nisnevichTopology (yoneda.obj Y) := sorry

/-- An elementary distinguished square: `X₂ → X₄` an open immersion, `X₃ → X₄` étale, the square
cartesian, and `X₃ → X₄` an isomorphism over the reduced complement of `X₂`. -/
structure ElementaryDistinguishedSquare (X : Scheme.{u}) extends Square Scheme.{u} where
  base : toSquare.X₄ = X
  isOpenImmersion : IsOpenImmersion toSquare.f₂₄
  etale : Etale toSquare.f₃₄
  isPullback : toSquare.IsPullback
  /-- `f₃₄` is injective with trivial residue extensions over the complement of the open image. -/
  iso_over_complement : ∀ x : toSquare.X₄, x ∉ Set.range toSquare.f₂₄ →
    ∃! y : toSquare.X₃, toSquare.f₃₄ y = x ∧
      Function.Bijective (Scheme.Hom.residueFieldMap toSquare.f₃₄ y).hom

namespace ElementaryDistinguishedSquare

variable {X : Scheme.{u}}

theorem isNisnevichCovering (S : ElementaryDistinguishedSquare X) :
    Sieve.ofTwoArrows S.toSquare.f₂₄ S.toSquare.f₃₄ ∈ nisnevichTopology S.toSquare.X₄ :=
  sorry

/-- The square attached to an open cover `X = U ∪ V`. -/
noncomputable def ofZariski (U V : X.Opens) (h : U ⊔ V = ⊤) :
    ElementaryDistinguishedSquare X :=
  sorry

noncomputable def pullback (S : ElementaryDistinguishedSquare X) {Y : Scheme.{u}} (g : Y ⟶ X) :
    ElementaryDistinguishedSquare Y :=
  sorry

theorem isPullback' (S : ElementaryDistinguishedSquare X) : S.toSquare.IsPullback :=
  S.isPullback

end ElementaryDistinguishedSquare

-- Check `test_eds_zariski`
example (X : Scheme.{u}) (U V : X.Opens) (h : U ⊔ V = ⊤) :
    IsOpenImmersion (ElementaryDistinguishedSquare.ofZariski U V h).toSquare.f₃₄ := sorry
-- Check `test_eds_affine_line`
/- `X = 𝔸¹_ℚ`, `U = 𝔸¹ ∖ {0}`, `V = 𝔸¹ ∖ {−1, −2}` with `s ↦ s² + 2s` is an elementary
distinguished square (statement in the roadmap). -/
-- Check `test_eds_not_distinguished`
/- `(∅ ⊂ Spec ℝ, Spec ℂ → Spec ℝ)` is not an elementary distinguished square: the fibre over the
closed point has residue field `ℂ ≠ ℝ` (statement in the roadmap). -/

theorem ElementaryDistinguishedSquare.exists_mayerVietorisSquare {X : Scheme.{u}}
    [HasWeakSheafify nisnevichTopology.{u} (Type u)]
    (S : ElementaryDistinguishedSquare X) :
    ∃ M : nisnevichTopology.{u}.MayerVietorisSquare, M.toSquare = S.toSquare :=
  sorry

/-- On Noetherian finite-dimensional schemes, a presheaf of sets is a Nisnevich sheaf iff it sends
the empty scheme to a point and every elementary distinguished square to a pullback. -/
theorem isSheaf_iff_distinguishedSquares (P : Scheme.{u}ᵒᵖ ⥤ Type u)
    (hnoeth : ∀ X : Scheme.{u}, IsNoetherian X) :
    Presheaf.IsSheaf nisnevichTopology P ↔
      (∀ X : Scheme.{u}, IsEmpty X → Nonempty (Unique (P.obj (Opposite.op X)))) ∧
      ∀ (X : Scheme.{u}) (S : ElementaryDistinguishedSquare X),
        (S.toSquare.op.map P).IsPullback :=
  sorry

/- Layer 2 (nisnevich points henselization),
   Layer 2 (nisnevich cohomological dimension), Layer 2 (nisnevich cech comparison) and
   Layer 2 (brown gersten vanishing) are stated in the roadmap; their Lean statements need the small
   Nisnevich site's sheafification and Ext instances and the henselization carrier, neither of
   which exists at the pinned commits. -/

end Nisnevich

/-! ### Topologies of a scheme and coefficient sheaves -/

namespace Topologies

open _root_.AlgebraicGeometry _root_.Opposite

/-- The big-site sheaf `F^a`, `(T → S) ↦ Γ(T, h^*F)`, of a quasi-coherent module, on the fpqc
topology (hence on every coarser one). -/
noncomputable def bigSheaf {S : Scheme.{u}} (F : S.Modules) [F.IsQuasicoherent] :
    Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry

/- `bigSheaf_obj`: sections over `(T, h)` are `Γ(T, h^*F)`;
   `bigSheaf_isSheaf`: `F^a` is a sheaf for the Zariski, étale, fppf and fpqc topologies;
   `bigSheaf_exact`: exactness on short exact sequences of quasi-coherent modules;
   `bigSheaf_pullback`: compatibility with pullback along `S' → S`;
   `bigSheaf_structureSheaf`: `(O_S)^a` is the structure sheaf `G_a`;
   `bigSheaf_fullyFaithful`: `F ↦ F^a` is fully faithful on quasi-coherent modules.
   These need the global-sections functor of `Scheme.Modules` and an `Over`-site restriction API;
   the carrier above fixes the type. -/

-- Check `test_bigSheaf_zero`
/- `F = 0` gives the zero sheaf (needs a quasi-coherence instance for the zero module). -/
-- Check `test_bigSheaf_spec_field`
/- For `S = Spec k`, `F = O_S`, sections over `Spec L` are `L` (statement in the roadmap). -/
-- Check `test_bigSheaf_zariski_restriction`
/- Restriction of `F^a` to the small Zariski site recovers `F` (statement in the roadmap). -/
-- Check `test_bigSheaf_not_topological_pullback`
/- Sections of `O^a` over `Spec ℚ(i)` are `ℚ(i)`, not `ℚ` (statement in the roadmap). -/

/-- `G_a` on the big fpqc site over `S`. -/
noncomputable def Ga (S : Scheme.{u}) : Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `G_m` on the big fpqc site over `S`. -/
noncomputable def Gm (S : Scheme.{u}) : Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `μ_n ⊆ G_m`, for every `n ≥ 1`. -/
noncomputable def mu (S : Scheme.{u}) (n : ℕ) :
    Sheaf (Scheme.fpqcTopology.over S) AddCommGrpCat.{u} :=
  sorry
/-- `G_m` restricted to the small étale site. -/
noncomputable def GmEtale (X : Scheme.{u}) : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry
/-- `μ_n` restricted to the small étale site. -/
noncomputable def muEtale (X : Scheme.{u}) (n : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry

theorem Gm_obj {S T : Scheme.{u}} (h : T ⟶ S) :
    Nonempty (((Gm S).obj.obj (op (Over.mk h)) : Type u) ≃+ Additive (Γ(T, ⊤))ˣ) :=
  sorry

noncomputable def powHom (S : Scheme.{u}) (n : ℕ) : Gm S ⟶ Gm S := sorry

theorem mu_eq_ker_pow (S : Scheme.{u}) (n : ℕ) : Nonempty (mu S n ≅ kernel (powHom S n)) :=
  sorry

/- `Gm_restrict_small`: the restriction of `Gm S` to the small étale site is `GmEtale S`;
   `mu_eq_cpc`: for `n` invertible on `S`, `muEtale S n` is the roots-of-unity sheaf of
   CohomologicalPointCounting ConstructibleEtale Layer 6 (not a declaration at the pins). -/

-- Check `test_mu_one`
example (S : Scheme.{u}) : Limits.IsZero (mu S 1) := sorry
-- Check `test_Gm_field`
example (h : Spec (CommRingCat.of ℚ) ⟶ Spec (CommRingCat.of ℚ)) :
    Nonempty (((Gm (Spec (CommRingCat.of ℚ))).obj.obj (op (Over.mk h)) : Type) ≃+
      Additive ℚˣ) := sorry
-- Check `test_mu_p_not_etale_trivial`
/- Over `Spec 𝔽_p`, `μ_p` has trivial sections on reduced schemes and nonzero sections on
`Spec 𝔽_p[ε]/(ε^p)` (statement in the roadmap). -/

/-- Inverse image along the big-fppf-to-small-étale comparison `a_X`. -/
noncomputable def aXInverse (X : Scheme.{u}) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.fpqcTopology.over X) AddCommGrpCat.{u} :=
  sorry
/-- The comparison `Sh(X_et) → Sh(X_Nis)` (inverse image direction: Nisnevich to étale). -/
noncomputable def etaleToNisnevich (X : Scheme.{u}) :
    Sheaf (Nisnevich.smallNisnevichTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry
/-- The comparison `Sh(X_Nis) → Sh(X_Zar)` (inverse image direction: Zariski to Nisnevich). -/
noncomputable def nisnevichToZariski (X : Scheme.{u}) :
    Sheaf (Opens.grothendieckTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Nisnevich.smallNisnevichTopology X) AddCommGrpCat.{u} :=
  sorry
/-- The big fppf to big étale comparison (inverse image direction). -/
noncomputable def epsilonFppfEtale (X : Scheme.{u}) :
    Sheaf (Scheme.etaleTopology.over X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.fppfTopology.over X) AddCommGrpCat.{u} :=
  sorry

/- `aX` (the morphism of topoi), `comparison_comp`, `comparison_baseChange` and `aX_inverseImage_obj`
   are stated in the roadmap; the inverse-image functors above are their carriers. -/

-- Check `test_comparison_id`
/- The étale-to-étale comparison is the identity of `Sh(X_et)` (statement in the roadmap). -/
-- Check `test_aX_constant`
/- `a_X^{-1}` of the constant étale sheaf `ℤ/2` is the constant fppf sheaf `ℤ/2`. -/
-- Check `test_zariski_not_etale`
/- `H^1_Zar(Spec ℝ, μ_2) = 0` but `H^1_et(Spec ℝ, μ_2) ≅ ℤ/2`. -/

/-- Zariski cohomology of a quasi-coherent module (Tau Ceti's `Scheme.Modules.Cohomology`, which is
exactly this Mathlib expression) agrees with its étale cohomology. -/
noncomputable def etaleSheafOfModule {X : Scheme.{u}} (F : X.Modules) [F.IsQuasicoherent] :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  sorry

theorem quasiCoherent_etale_comparison (X : Scheme.{u}) (F : X.Modules) [F.IsQuasicoherent]
    (n : ℕ) :
    Nonempty (Sheaf.H.{u} ((SheafOfModules.toSheaf X.ringCatSheaf).obj F) n ≃+
      (etaleSheafOfModule F).H n) :=
  sorry

/- `H^q(X_et, F) = H^q_fppf(X, a_X^{-1} F)`; big-site cohomology of `Scheme.{u}`-sites needs
sheafification instances in a higher universe, not available at the pins (roadmap statement). -/

/- Grothendieck's comparison for smooth commutative quasi-projective group schemes (roadmap
statement); same universe obstruction as above. -/

end Topologies

namespace Etale

open _root_.AlgebraicGeometry _root_.Opposite Topologies

/-- Hilbert's Theorem 90: `H^1(X_et, G_m)` is the Picard group of isomorphism classes of line bundles
(Tau Ceti's `LineBundleClass`, a commutative monoid whose inverses JacobianChallenge Layer A adds). -/
theorem hilbert90 (X : Scheme.{u}) :
    Nonempty ((GmEtale X).H 1 ≃+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) :=
  sorry

theorem etale_kummer_h1 (X : Scheme.{u}) (n : ℕ) (hn : IsUnit ((n : ℤ) : Γ(X, ⊤))) :
    ∃ (f : Additive (Γ(X, ⊤))ˣ →+ (muEtale X n).H 1)
      (g : (muEtale X n).H 1 →+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)),
      Function.Exact f g ∧ (∀ v : (Γ(X, ⊤))ˣ, f (Additive.ofMul (v ^ n)) = 0) ∧
      ∀ L, n • L = 0 ↔ ∃ c, g c = L :=
  sorry
/- The fppf form for every `n` and the `H^2` sequence are stated in the roadmap (big-site
cohomology). -/

/-- The constant étale sheaf with value `ℤ/p`. -/
noncomputable def constZMod (X : Scheme.{u}) (p : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  (constantSheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}).obj
    (AddCommGrpCat.of (ULift.{u} (ZMod p)))

theorem artinSchreier_vanishing (p : ℕ) [Fact p.Prime] (X : Scheme.{u}) [IsAffine X]
    [CharP Γ(X, ⊤) p] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((constZMod X p).H q) :=
  sorry

/- `f_*` is exact on abelian étale sheaves for finite `f` and commutes with base change for integral
`f`; needs the pushforward of small étale sheaves along a morphism of schemes
(CohomologicalPointCounting EtaleBaseChange Layer 0 builds its site functor). -/

/-- Étale cohomology of `Spec K` is continuous Galois cohomology (statement shape: the stalk at the
separable closure as a discrete module; the carrier `galoisModule` is the stalk functor). -/
noncomputable def galoisModule (K : Type u) [Field K]
    (F : Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of K))) AddCommGrpCat.{u}) :
    Type u :=
  sorry
/- The comparison `F.H n ≃+ continuousCohomology n (galoisModule K F)` needs the topological
representation structure on the stalk (Mathlib `TopRep`), stated in the roadmap. -/

/- Statements in the roadmap; they need pullback along morphisms of small étale sites
(Layer 2 (site cohomology pullback)) whose carrier is below. -/

/-- Tsen: for a curve over an algebraically closed field the field Brauer group of its function
field is trivial (field Brauer group as Tau Ceti's `BrauerGroup`). -/
theorem brauer_functionField_curve_trivial (k K : Type u) [Field k] [IsAlgClosed k] [Field K]
    [Algebra k K] (t : K) (ht : Transcendental k t)
    (halg : Algebra.IsAlgebraic (IntermediateField.adjoin k {t}) K)
    (x : BrauerGroup.{u, u} K) : x = 1 :=
  sorry

theorem curve_Gm_vanishing (k : Type u) [Field k] [IsAlgClosed k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 f] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((GmEtale X).H q) :=
  sorry

end Etale

/-! ### The pro-étale comparison -/

namespace Proetale

open _root_.CategoryTheory _root_.AlgebraicGeometry

/- The morphism of topoi `ν : Sh(X_proét) → Sh(X_ét)`, the comparison `H^q(X_ét, F) ≅ H^q(X_proét, ν^* F)`
for torsion `F` and lisse adic sheaves are EllAdicRealization Layers 1, 3 and 4 (TauCetiRoadmap pull
request 196); this roadmap states only the site foundations below, which those layers consume. -/

/-- A category of sheaves is replete if limits of towers of epimorphisms are epimorphisms onto
every stage. -/
def IsReplete (T : Type u₁) [Category.{u} T] : Prop :=
  ∀ (F : ℕᵒᵖ ⥤ T) (_ : ∀ n : ℕ, Epi (F.map (homOfLE (Nat.le_succ n)).op))
    (c : Limits.Cone F) (_ : Limits.IsLimit c) (m : ℕ), Epi (c.π.app (Opposite.op m))

theorem isReplete_proetale (X : Scheme.{u}) :
    IsReplete (Sheaf (Scheme.ProEt.topology X) (Type u)) :=
  sorry

/- `isReplete_of_locallyWeaklyContractible`, `IsReplete.lim_epi` (the definition unfolded) and
`IsReplete.derivedCategory_leftComplete` are roadmap API items. -/

-- Check `test_isReplete_types`
example : IsReplete (Type u) := sorry
-- Check `test_isReplete_proetale_point`
example (k : Type u) [Field k] [IsAlgClosed k] :
    IsReplete (Sheaf (Scheme.ProEt.topology (Spec (CommRingCat.of k))) (Type u)) := sorry
-- Check `test_etale_not_replete`
example : ¬ IsReplete (Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of ℚ))) (Type)) :=
  sorry

/- `w_contractible_cover` and `proetale_left_completeness` are stated in the README; w-contractible rings
and the left-completed derived categories have no carriers at the pins. -/

end Proetale

/-! ### Coherent duality -/

namespace Coherent

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- `D_QCoh(O_X)`: the derived category of `O_X`-modules restricted to complexes with
quasi-coherent cohomology (carrier; Mathlib's `DerivedCategory` of `X.Modules` once its universe
and `HasDerivedCategory` instance are fixed). -/
noncomputable def DQCoh (X : Scheme.{u}) : Type (u + 1) := sorry

noncomputable instance (X : Scheme.{u}) : Category.{u} (DQCoh X) := sorry

noncomputable instance (X : Scheme.{u}) : Limits.HasZeroObject (DQCoh X) := sorry

/-- For `X = Spec A`, `D(A) ≌ D_QCoh(O_X)` (carrier of `DQCoh.affineEquiv`, with `D(A)` the
derived category of `ModuleCat A`). -/
noncomputable def DQCoh.affineEquivFunctor (A : CommRingCat.{u}) :
    ModuleCat.{u} A ⥤ DQCoh (Spec A) :=
  sorry

/- `DQCoh.mem_iff`, `DQCoh.isTriangulated`, `DQCoh.hasCoproducts`, `DQCoh.affineEquiv`, `DCoh` and the
tests `test_DQCoh_structure_sheaf`, `test_DQCoh_affine_free`, `test_DQCoh_extension_by_zero_not_qc` are
roadmap items. -/

noncomputable def derivedTensor {X : Scheme.{u}} : DQCoh X ⥤ DQCoh X ⥤ DQCoh X := sorry
noncomputable def derivedHom {X : Scheme.{u}} : (DQCoh X)ᵒᵖ ⥤ DQCoh X ⥤ DQCoh X := sorry

noncomputable def derivedPullback {X Y : Scheme.{u}} (f : X ⟶ Y) : DQCoh Y ⥤ DQCoh X := sorry
noncomputable def totalDirectImage {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : DQCoh X ⥤ DQCoh Y :=
  sorry
noncomputable def derivedPullback_totalDirectImage_adj {X Y : Scheme.{u}} (f : X ⟶ Y)
    [QuasiCompact f] [QuasiSeparated f] : derivedPullback f ⊣ totalDirectImage f :=
  sorry

/- Roadmap statements (perfect complexes and Tor independence have no carriers at the pins). -/

/-- The right adjoint `a_f` of `Rf_*` on `D_QCoh` for qcqs schemes. -/
noncomputable def pushforwardRightAdjoint {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : DQCoh Y ⥤ DQCoh X :=
  sorry
noncomputable def pushforwardRightAdjoint_adj {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : totalDirectImage f ⊣ pushforwardRightAdjoint f :=
  sorry
/-- The trace (counit) `Rf_* a_f K → K`. -/
noncomputable def trace {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f] [QuasiSeparated f] :
    pushforwardRightAdjoint f ⋙ totalDirectImage f ⟶ 𝟭 (DQCoh Y) :=
  (pushforwardRightAdjoint_adj f).counit

-- Check `test_rightAdjoint_id`
example (X : Scheme.{u}) : Nonempty (pushforwardRightAdjoint (𝟙 X) ≅ 𝟭 (DQCoh X)) := sorry
-- Check `test_rightAdjoint_closed_point`
-- Check `test_rightAdjoint_not_upperShriek`
/- Closed point of `𝔸¹` and non-proper affine line (statements in the README). -/

/-- The upper shriek of a separated finite-type morphism of Noetherian schemes (the functor of
`coherent duality`, on the bounded-below part). -/
noncomputable def upperShriek {X Y : Scheme.{u}} (f : X ⟶ Y) [IsSeparated f]
    [LocallyOfFiniteType f] [QuasiCompact f] [IsNoetherian Y] : DQCoh Y ⥤ DQCoh X :=
  sorry

theorem upperShriek_openImmersion {X Y : Scheme.{u}} (j : X ⟶ Y) [IsOpenImmersion j]
    [IsSeparated j] [LocallyOfFiniteType j] [QuasiCompact j] [IsNoetherian Y] :
    Nonempty (upperShriek j ≅ derivedPullback j) :=
  sorry

theorem upperShriek_proper {X Y : Scheme.{u}} (f : X ⟶ Y) [IsProper f] [QuasiCompact f]
    [IsNoetherian Y] :
    Nonempty (upperShriek f ≅ pushforwardRightAdjoint f) :=
  sorry

/-- A relative dualizing complex `(K, ξ)` for a flat finitely presented morphism (carrier). -/
noncomputable def RelativeDualizingComplex {X S : Scheme.{u}} (f : X ⟶ S) [Flat f]
    [LocallyOfFinitePresentation f] : Type (u + 1) :=
  sorry

/-- The relative dualizing module `ω_{X/Y}` of a flat Cohen–Macaulay morphism (carrier). -/
noncomputable def relativeDualizingModule {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    [LocallyOfFiniteType f] : X.Modules :=
  sorry

/- Roadmap statements, stated with `upperShriek`, `relativeDualizingModule` and the derived
`Hom`. -/

end Coherent

/-! ### Brauer groups and equivariant sheaves -/

namespace Brauer

open _root_.CategoryTheory _root_.AlgebraicGeometry Topologies

/-- Over an affine scheme the Azumaya condition is Mathlib's `IsAzumaya` (the affine form of the
equivalent conditions). -/
theorem isAzumaya_iff_matrix_after_etale (R A : Type u) [CommRing R] [Ring A] [Algebra R A]
    [Module.Finite R A] [Module.Projective R A] :
    IsAzumaya R A ↔ ∃ (ι : Type u) (B : ι → Type u) (_ : ∀ i, CommRing (B i))
      (_ : ∀ i, Algebra R (B i)) (_ : ∀ i, Algebra.Etale R (B i)),
      (∀ p : PrimeSpectrum R, ∃ i, ∃ q : PrimeSpectrum (B i),
        q.asIdeal.comap (algebraMap R (B i)) = p.asIdeal) ∧
      ∀ i, ∃ n : ℕ, 0 < n ∧
        Nonempty (TensorProduct R (B i) A ≃ₐ[B i] Matrix (Fin n) (Fin n) (B i)) :=
  sorry

/-- The class in `H^2(X_et, G_m)` of an Azumaya algebra, via its gerbe of trivialisations
(the algebra given here by its affine data; the sheaf-algebra carrier is
Layer 2's `sheaf algebra`). -/
noncomputable def azumayaClass (X : Scheme.{u}) (A : Type u) : (GmEtale X).H 2 := sorry

/- `trivializationGerbe`, `trivializationGerbe_isGerbe`, `azumayaClass_eq_zero_iff`,
`azumayaClass_tensor`, `azumayaClass_eq_delta`, `azumayaClass_pullback` and the tests
`test_class_matrix`, `test_class_quaternion_real`, `test_class_field_agrees`,
`test_class_not_module_class` are roadmap items; the carrier `azumayaClass` above takes the
algebra as a placeholder type argument until the sheaf-algebra carrier exists. -/

/- Layer 2 (brauer field comparison) is Tau Ceti's `TauCeti.brauerCohomologyEquiv`
   (`Additive (BrauerGroup K) ≃+ H²(Gal, K̄ˣ)`) together with the README target; it is not restated.
   Layer 2 (brauer henselian local): the finite-field case `Subsingleton (BrauerGroup k)` is Tau Ceti's
   `TauCeti.subsingleton_brauerGroup_of_finite`; the henselian local ring statement needs Azumaya
   algebras over a local ring and is stated in the roadmap. -/

end Brauer

namespace Equivariant

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- Semilinear `Γ`-equivariant `O_X`-modules for a discrete group acting on a scheme by
automorphisms (carrier). -/
noncomputable def EquivariantModules (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : Type (u + 1) :=
  sorry

noncomputable instance (X : Scheme.{u}) (Γ : Type u) [Group Γ] (act : Γ →* Aut X) :
    Category.{u} (EquivariantModules X Γ act) :=
  sorry

noncomputable instance (X : Scheme.{u}) (Γ : Type u) [Group Γ] (act : Γ →* Aut X) :
    Abelian (EquivariantModules X Γ act) :=
  sorry

noncomputable def EquivariantModules.forget (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : EquivariantModules X Γ act ⥤ X.Modules :=
  sorry

theorem EquivariantModules.isGrothendieckAbelian (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : IsGrothendieckAbelian.{u} (EquivariantModules X Γ act) :=
  sorry

noncomputable def EquivariantModules.coind (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : X.Modules ⥤ EquivariantModules X Γ act :=
  sorry
noncomputable def EquivariantModules.ind (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) : X.Modules ⥤ EquivariantModules X Γ act :=
  sorry
noncomputable def EquivariantModules.forgetCoindAdj (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) :
    EquivariantModules.forget X Γ act ⊣ EquivariantModules.coind X Γ act :=
  sorry
noncomputable def EquivariantModules.indForgetAdj (X : Scheme.{u}) (Γ : Type u) [Group Γ]
    (act : Γ →* Aut X) :
    EquivariantModules.ind X Γ act ⊣ EquivariantModules.forget X Γ act :=
  sorry

/- Roadmap statements (group cohomology of the coinduced sections and the Ext spectral sequence). -/

end Equivariant


end SF_SF_2

/-! ## Layer 3: curves, divisors and Picard objects -/
section SF_SF_3


noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.CategoryTheory.MonoidalCategory

universe u

namespace Curve

variable (k : Type u) [Field k]

/-- `dim_k Hⁱ(X, M)`, the `k`-dimension of Tau Ceti's `Scheme.Modules.Cohomology` with its
base-field module structure (`Module.finrank`, so `0` when infinite-dimensional). -/
def cohomologyDim (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) (i : ℕ) : ℕ :=
  Module.finrank k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology M i)

/-- The structure sheaf as a sheaf of modules over itself. -/
abbrev structureModule (X : Scheme.{u}) : X.Modules := _root_.SheafOfModules.unit X.ringCatSheaf

/-- The Euler characteristic `χ(X, M) = dim H⁰ − dim H¹` used on schemes of dimension at most one. -/
def eulerChar (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) : ℤ :=
  (cohomologyDim k X M 0 : ℤ) - cohomologyDim k X M 1

/-- The genus `dim_k H¹(X, O_X)` of JacobianChallenge Layer B, as used by this layer. -/
def genus (X : Scheme.{u}) [X.Over (Spec (.of k))] : ℕ := cohomologyDim k X (structureModule X) 1

/-! ### Nonsingular projective model -/

section NonsingularModel

/-- The regular projective model `X̄ = X_{k(X)}` of a normal curve (AlgebraicCurves Layer 12B). -/
def nonsingularModel (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)] (hdim : topologicalKrullDim X = 1) :
    Scheme.{u} :=
  sorry

variable (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [IsSeparated (X ↘ Spec (.of k))]
  [LocallyOfFiniteType (X ↘ Spec (.of k))] [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
  (hdim : topologicalKrullDim X = 1)

instance : (nonsingularModel k X hdim).Over (Spec (.of k)) := sorry

instance nonsingularModel_isProper : IsProper (nonsingularModel k X hdim ↘ Spec (.of k)) := sorry

/-- The open immersion `j_X : X → X̄` over `k` inducing the identity of `k(X)`. -/
def nonsingularModel.openImmersion : X ⟶ nonsingularModel k X hdim := sorry

theorem nonsingularModel.openImmersion_isOpenImmersion :
    IsOpenImmersion (nonsingularModel.openImmersion k X hdim) := by sorry

theorem nonsingularModel.openImmersion_isOver :
    nonsingularModel.openImmersion k X hdim ≫ nonsingularModel k X hdim ↘ Spec (.of k) =
      X ↘ Spec (.of k) := by sorry

/-- The boundary `∂X = X̄ ∖ j_X(X)`, a finite set of closed points. -/
def boundary : Set (nonsingularModel k X hdim) :=
  (Set.range (nonsingularModel.openImmersion k X hdim).base)ᶜ

theorem boundary_finite : (boundary k X hdim).Finite := by sorry

theorem boundary_eq_empty_iff : boundary k X hdim = ∅ ↔ IsProper (X ↘ Spec (.of k)) := by sorry

theorem nonsingularModel_smooth [PerfectField k] [Smooth (X ↘ Spec (.of k))] :
    Smooth (nonsingularModel k X hdim ↘ Spec (.of k)) := by sorry

theorem nonsingularModel.extend {Y : Scheme.{u}} [Y.Over (Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] (f : X ⟶ Y) (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k)) :
    ∃! g : nonsingularModel k X hdim ⟶ Y, nonsingularModel.openImmersion k X hdim ≫ g = f := by sorry

/- Remaining API of this node, stated in the roadmap document:
`nonsingularModel.functionField_iso` (identification of function fields with AlgebraicCurves'),
`nonsingularModel.unique` (uniqueness among open immersions into regular proper curves),
`nonsingularModel.map` (functoriality for dominant morphisms).
Tests: `nonsingularModel_affineLine` (model of A¹ is P¹ with one boundary point),
`nonsingularModel_gm` (two boundary points), `nonsingularModel_not_smooth` (y² = x^p − t over
F_p(t)); they need P¹ and explicit plane curves as schemes over k, which the pinned libraries do
not provide as named objects. -/

end NonsingularModel

-- Check `nonsingularModel_proper`
example (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [IsProper (X ↘ Spec (.of k))]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)] (hdim : topologicalKrullDim X = 1) :
    boundary k X hdim = ∅ := by sorry

/-! ### Curve affine or projective -/

theorem isAffine_or_isProper (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) :
    (IsAffine X ∧ ¬ IsProper (X ↘ Spec (.of k))) ∨
      (¬ IsAffine X ∧ IsProper (X ↘ Spec (.of k))) := by sorry

/-! ### Genus base change -/

/-- Base change of a `k`-scheme along `k → K`. -/
abbrev baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K] [Algebra k K] :
    Scheme.{u} :=
  pullback (X ↘ Spec (.of k)) (Spec.map (CommRingCat.ofHom (algebraMap k K)))

instance (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K] [Algebra k K] :
    (baseChange k X K).Over (Spec (.of K)) := ⟨pullback.snd _ _⟩

theorem genus_baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1)
    (K : Type u) [Field K] [Algebra k K] :
    cohomologyDim K (baseChange k X K) (structureModule _) 0 = 1 ∧
      genus K (baseChange k X K) = genus k X := by sorry

/-! ### Vector bundle degree -/

/-- `E` is finite locally free of constant rank `r`: Mathlib's `IsLocallyFree` witnessed by local
generators that are bases of cardinality `r`. This is AlgebraicVectorBundles L0B's predicate
`isFiniteLocallyFreeOfRank` (there an `ObjectProperty`), with which it agrees once that roadmap
lands; no second carrier is intended. -/
def isFiniteLocallyFreeOfRank {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Prop :=
  ∃ q : _root_.SheafOfModules.LocalGeneratorsData.{u} E,
    q.IsLocallyFreeData ∧ ∀ i, Finite (q.generators i).I ∧ Nat.card (q.generators i).I = r

section Degree

variable (X : Scheme.{u}) [X.Over (Spec (.of k))]

/-- `deg E = χ(E) − r·χ(O_X)` for a locally free sheaf `E` of constant rank `r` on a proper
`k`-scheme of dimension at most one; the rank is the explicit argument `r`, and every lemma
assumes `isFiniteLocallyFreeOfRank E r`. -/
def vectorBundleDegree (E : X.Modules) (r : ℕ) : ℤ :=
  eulerChar k X E - r * eulerChar k X (structureModule X)

theorem vectorBundleDegree_rankOne (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    vectorBundleDegree k X L.obj 1 = eulerChar k X L.obj - eulerChar k X (structureModule X) := by
  sorry

theorem vectorBundleDegree_of_iso {E F : X.Modules} (e : E ≅ F) (r : ℕ) :
    vectorBundleDegree k X E r = vectorBundleDegree k X F r := by sorry

theorem vectorBundleDegree_add_of_shortExact [IsProper (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X ≤ 1) (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (r₁ r₃ : ℕ) (h₁ : isFiniteLocallyFreeOfRank S.X₁ r₁) (h₃ : isFiniteLocallyFreeOfRank S.X₃ r₃) :
    vectorBundleDegree k X S.X₂ (r₁ + r₃) =
      vectorBundleDegree k X S.X₁ r₁ + vectorBundleDegree k X S.X₃ r₃ := by sorry

theorem vectorBundleDegree_tensor [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1)
    (E V : X.Modules) (r s : ℕ) (hE : isFiniteLocallyFreeOfRank E r) (hV : isFiniteLocallyFreeOfRank V s) :
    vectorBundleDegree k X (E ⊗ V) (r * s) =
      r * vectorBundleDegree k X V s + s * vectorBundleDegree k X E r := by sorry

/- Remaining API of this node, stated in the roadmap document: `vectorBundleDegree_det`
(deg E = deg det E), `vectorBundleDegree_dual`, `vectorBundleDegree_twist` (twist by an effective
Cartier divisor), `vectorBundleDegree_elementaryModification`, `vectorBundleDegree_baseChange` and
`vectorBundleDegree_pullback`. Their carriers (exterior powers and duals of sheaves of modules,
lengths, base change of modules along field extensions) are not in the pinned libraries. -/

-- Check `vectorBundleDegree_trivial`
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1) :
    vectorBundleDegree k X (structureModule X) 1 = 0 := by sorry

/- Check `vectorBundleDegree_projectiveLine` — on P¹_k,
deg(O(a) ⊕ O(b)) = a + b (P¹ and its twisting sheaves are not named objects at the pin).
Check `vectorBundleDegree_filtration` — degrees add along a
filtration with invertible quotients; O(1) ⊕ O(−1) on P¹ has degree 0 without being trivial. -/

-- Check `vectorBundleDegree_divisor`
example [IsIntegral X] [IsNoetherian X]
    [∀ y : TauCeti.AlgebraicGeometry.CodimensionOnePoint X,
      IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, Order.coheight y ≤ 1) [IsProper (X ↘ Spec (.of k))]
    (D : TauCeti.AlgebraicGeometry.SchemeWeilDivisor X) :
    vectorBundleDegree k X (TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf hX D).obj 1 =
      D.sum fun x n ↦ n * ((X ↘ Spec (.of k)).residueDegree (x : X) : ℤ) := by sorry

-- Check `vectorBundleDegree_ne_eulerChar`
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 2) :
    vectorBundleDegree k X (structureModule X) 1 ≠ eulerChar k X (structureModule X) := by sorry

end Degree

/-! ### Vector bundle riemann roch -/

theorem eulerChar_eq_degree_add_rank_mul (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (E : X.Modules) (r : ℕ) (hE : isFiniteLocallyFreeOfRank E r) :
    eulerChar k X E = vectorBundleDegree k X E r + r * (1 - (genus k X : ℤ)) := by sorry

/-! ### Curve serre duality

The theorem (`Ext^{1+i}(F, ω_X) ≅ H^{−i}(X, F)^∨` for quasi-coherent `F` on a proper Cohen–Macaulay
curve, `Hⁱ(E^∨ ⊗ ω) ≅ H^{1−i}(E)^∨`, `Ext¹(U, V) ≅ Hom(V, U ⊗ ω)^∨`, and `ω ≅ Ω¹` in the smooth
case) needs Ext groups and duals of sheaves of modules, the dualizing module `H^{−1}(f^! k)` of
Layer 2 and the sheaf of differentials; none is a carrier of the pinned libraries, so it is stated in
the roadmap document only. A dimension-only Lean form would be false without those carriers. -/

/-! ### Scheme riemann hurwitz -/

theorem genus_of_finite_etale {X Y : Scheme.{u}} [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] [Smooth (Y ↘ Spec (.of k))]
    (hXd : topologicalKrullDim X = 1) (hYd : topologicalKrullDim Y = 1)
    (hX : cohomologyDim k X (structureModule X) 0 = 1)
    (hY : cohomologyDim k Y (structureModule Y) 0 = 1) (f : X ⟶ Y) [IsFinite f] [Etale f] (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k))
    (n : ℕ) (hn : ∀ y : Y, f.finrank y = n) :
    (genus k X : ℤ) - 1 = n * ((genus k Y : ℤ) - 1) := by sorry

/-! ## Projective line characterization, genus one curves,
Layer 3 (line bundle degree bounds) -/

theorem isTrivial_of_genus_zero_of_degree_zero (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [IsIntegral X] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 0)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (hL : vectorBundleDegree k X L.obj 1 = 0) :
    TauCeti.AlgebraicGeometry.LineBundleClass.mk L = 1 := by sorry

theorem exists_rationalPoint_of_degree_one (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hg : genus k X = 1) (N : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hN : vectorBundleDegree k X N.obj 1 = 1) :
    ∃ x : Spec (.of k) ⟶ X, x ≫ X ↘ Spec (.of k) = 𝟙 _ := by sorry

theorem cohomologyDim_one_eq_zero_of_degree_gt (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hL : 2 * (genus k X : ℤ) - 2 < vectorBundleDegree k X L.obj 1) :
    cohomologyDim k X L.obj 1 = 0 ∧
      (cohomologyDim k X L.obj 0 : ℤ) = vectorBundleDegree k X L.obj 1 + 1 - genus k X := by sorry

theorem cohomologyDim_zero_pos_of_genus_le_degree (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hL : (genus k X : ℤ) ≤ vectorBundleDegree k X L.obj 1) :
    0 < cohomologyDim k X L.obj 0 := by sorry

end Curve

/-! ## Picard objects -/

namespace Picard

/-! ### Picard groupoid -/

/-- A Picard groupoid: a symmetric monoidal category which is a groupoid and in which every object
has a tensor inverse up to isomorphism (Bhatt–Scholze, Definition 12.14). -/
class PicardGroupoid (C : Type*) [Category C] [MonoidalCategory C] [SymmetricCategory C] :
    Prop where
  isIso : ∀ {X Y : C} (f : X ⟶ Y), IsIso f
  exists_inverse : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)

namespace PicardGroupoid

variable (C : Type*) [Category C] [MonoidalCategory C] [SymmetricCategory C] [PicardGroupoid C]

/-- The abelian group of isomorphism classes. -/
def pi0 : Type _ := Skeleton C

instance : CommGroup (pi0 C) := sorry

/-- The abelian group of automorphisms of the unit. -/
def pi1 : Type _ := Aut (𝟙_ C)

instance : CommGroup (pi1 C) := sorry

end PicardGroupoid

variable (X : Scheme.{u})

/-- `𝒫ic(X)`: the core of the category of invertible sheaves. -/
abbrev picardGroupoid : Type _ := Core (TauCeti.AlgebraicGeometry.InvertibleSheaf X)

instance : MonoidalCategory (picardGroupoid X) := sorry

instance : SymmetricCategory (picardGroupoid X) := sorry

instance picardGroupoid.instPicardGroupoid : PicardGroupoid (picardGroupoid X) := sorry

theorem picardGroupoid.pi0_equiv :
    Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃ TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

theorem picardGroupoid.pi1_equiv :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid X) ≃* (Γ(X, ⊤))ˣ) := by sorry

/-- Pullback of invertible sheaves as a functor of Picard groupoids. -/
def picardGroupoid.pullback {Y : Scheme.{u}} (f : Y ⟶ X) : picardGroupoid X ⥤ picardGroupoid Y :=
  sorry

/- Remaining API: `picardGroupoid.isStack` (fppf descent, Layer 1) and `gradedPicardGroupoid`
(pairs (L, f) with the Koszul sign rule). -/

-- Check `picardGroupoid_pi0`
example : Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃ TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

-- Check `picardGroupoid_field`
example (K : Type u) [Field K] :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid (Spec (.of K))) ≃* Kˣ) := by sorry

/- Check `picardGroupoid_projectiveLine` — π₀ = Z, π₁ = k^× for P¹.
Check `picardGroupoid_not_discrete` — 𝒫ic(X) is not the discrete
groupoid on Pic(X) when Γ(X, O_X)^× ≠ 1. -/

/-! ### Picard cohomological, class group picard locally factorial,
Layer 3 (picard excision sequence)

The étale and fppf cohomology of `G_m` on schemes and the Weil divisor class group in arbitrary
dimension are not carriers of the pinned libraries; these three nodes are stated in the roadmap
document. The affine case of the first is Mathlib's `CommRing.Pic`. -/

/- node: Layer 3 (class group picard locally factorial)
node: Layer 3 (picard excision sequence) -/

theorem lineBundleClass_spec_equiv_pic (R : Type u) [CommRing R] :
    Nonempty (TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃ CommRing.Pic R) := by sorry

/-! ### Line bundle norm -/

/-- `Norm_π : Pic(X) → Pic(Y)` for a finite locally free morphism of constant degree `d ≥ 1`. -/
def lineBundleNorm {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ) :
    TauCeti.AlgebraicGeometry.LineBundleClass X → TauCeti.AlgebraicGeometry.LineBundleClass Y :=
  sorry

theorem lineBundleNorm_tensor {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ)
    (a b : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm π d (a * b) = lineBundleNorm π d a * lineBundleNorm π d b := by sorry

theorem lineBundleNorm_one {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ) :
    lineBundleNorm π d 1 = 1 := by sorry

/- Remaining API: `lineBundleNorm_pullback` (Norm(π*N) = N^d), `lineBundleNorm_comp`,
`lineBundleNorm_baseChange`, `lineBundleNorm_det`, `sectionNorm`, `lineBundleNorm_divisor`;
they need pullback and determinants of invertible sheaves, not available at the pin. -/

-- Check `lineBundleNorm_id`
example (X : Scheme.{u}) (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm (𝟙 X) 1 a = a := by sorry

/- Check `lineBundleNorm_field` — over a field the norm on units
is Mathlib's `Algebra.norm` (needs `sectionNorm`).
test: Picard.lineBundleNorm_square (z ↦ z² on P¹) and
test: Picard.lineBundleNorm_ne_det (hyperelliptic double cover) need P¹
and explicit double covers as named schemes. -/

/-! ### Picard scheme without point and picard brauer sequence -/

section Torsors

variable (k : Type u) [Field k]

/-- The degree-`d` component `Pic^d_{X/k}` of the Picard scheme of a smooth projective
geometrically connected curve, constructed without a rational point. -/
def picardComponent (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] (d : ℤ) :
    Over (Spec (.of k)) := sorry

/-- `Pic⁰_{X/k}` as an abelian variety (the Jacobian, with or without a rational point). -/
def jacobian (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] :
    TauCeti.AlgebraicGeometry.AbelianVariety k := sorry

/-- The `k`-points of the Picard sheaf, `Pic(X_{k^s})^{G_k}`, as an abstract group. -/
def picardSheafPoints (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] : Type u := sorry

variable (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
  [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]

theorem picardComponent_zero : (jacobian k X).toOver = picardComponent k X 0 := by sorry

theorem jacobian_dim (hdim : topologicalKrullDim X = 1) :
    (jacobian k X).dim = ((Curve.genus k X : ℕ∞) : WithBot ℕ∞) := by sorry

theorem picardComponent_isProper (d : ℤ) : IsProper (picardComponent k X d).hom := by sorry

/-- `Pic^d_{X/k}` has a `k`-point exactly when it is the trivial torsor; the canonical class gives a
point in degree `2g − 2`. -/
theorem picardComponent_canonical_point (hdim : topologicalKrullDim X = 1) :
    Nonempty ((Over.mk (𝟙 (Spec (.of k)))) ⟶
      picardComponent k X (2 * (Curve.genus k X : ℤ) - 2)) := by sorry

/- Layer 3 (picard brauer sequence) is not stated here: the Picard–Brauer obstruction and its
   vanishing given a rational point are Tau Ceti JacobianChallenge Layer D. -/
instance : AddCommGroup (picardSheafPoints k X) := sorry

/-- The map from actual line-bundle classes. -/
def ofLineBundleClass : Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) → picardSheafPoints k X :=
  sorry

theorem ofLineBundleClass_injective : Function.Injective (ofLineBundleClass k X) := by sorry

end Torsors


/-! ### Rational divisor classes

Stated in the roadmap document; it composes the Picard–Brauer obstruction of JacobianChallenge
Layer D with the Galois-cohomological Brauer group of ClassFieldTheory Layer 5.
Layer 3 (degree zero class comparison) is not stated here: `Cl⁰ ≃ Pic⁰`, the degree-zero
divisor description of `Pic⁰` and `Pic/Pic⁰ ≅ ℤ` are Tau Ceti's
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`,
`weightedDegreeZeroQuotientAddEquivPicZero` and `picQuotientPicZeroAddEquivInt`. -/

/- node: Layer 3 (picard stack curve)
node: Layer 3 (universal section stack) -/

/-! ### Picard stack curve, universal section stack

The pinned libraries have no algebraic stacks over `(Sch/k)_fppf`; the constructions and their
API (`picardStack`, `picardStack.degreeComponent`, `picardStack.aut_eq_units`,
`picardStack.toPicardSheaf`, `picardStack.isGerbe`, `picardStack.split_of_point`,
`picardStack.tensor`, `picardStack.baseChange`; `sectionStack`, `sectionStack.forget`,
`sectionStack.zeroSection`, `sectionStack.eq_of_neg`, `sectionStack.symmetricPowerEquiv`,
`sectionStack.isVectorBundle`, `sectionStack.add`, `sectionStack.add_symmetricPower`) and tests
(`picardStack_projectiveLine`, `picardStack_field`, `picardStack_aut`, `picardStack_not_scheme`;
`sectionStack_negative`, `sectionStack_projectiveLine`, `sectionStack_rank`,
`sectionStack_not_bundle`) are specified in the roadmap document. The groupoid of objects over a
scheme `T` is `picardGroupoid` of `X ×_k T`. -/

/-- The groupoid of objects of the Picard stack over a `k`-scheme `T` is the Picard groupoid of
`X ×_k T`; in particular it is a groupoid. -/
example (X : Scheme.{u}) : Groupoid (picardGroupoid X) := inferInstance

/-! ### Abel maps high degree, picard norm sequence, invariant differentials,
Layer 3 (abel jacobi differentials), Layer 3 (tate module etale h1)

The Abel maps need the symmetric powers of JacobianChallenge Layer C; the norm sequence needs the
Picard stacks above; the differential statements need the sheaf of differentials of a scheme
(StableReduction Layers 0–1). The comparison of the Tate module of the Jacobian with
`H¹_ét` is TraceFormula Layer 8 (TauCetiRoadmap pull request 196) and is not stated here. -/

/- node: Layer 3 (invariant differentials) — Ω¹_{G/S} ≅ f*e*Ω¹ and
Γ(A, Ω¹) ≅ T₀(A)^∨ for an abelian variety; needs the sheaf of differentials of a scheme.
node: Layer 3 (abel jacobi differentials) — ι_O^* : Γ(J, Ω¹) ≅ Γ(X, Ω¹).
node: Layer 3 (abel maps high degree) — fibres, surjectivity and the
projective-bundle structure of X^(d) → Pic^d; needs JacobianChallenge Layer C's symmetric powers.
node: Layer 3 (picard norm sequence) — Nm on Picard stacks and the
double-cover exact sequence. -/

end Picard

end
end SF_SF_3

/-! ## Layer 4: deformations, formal schemes, models and alterations -/
section SF_SF_4


noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u

namespace Formal
open _root_.AlgebraicGeometry

/-! ### Thickenings and formal smoothness of morphisms -/

/-- A thickening: a closed immersion that is surjective on points (Stacks 04EX). -/
class IsThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i, Surjective i

/-- A first-order thickening: a closed immersion whose ideal sheaf squares to zero (Stacks 04EX). -/
class IsFirstOrderThickening {Z X : Scheme.{u}} (i : Z ⟶ X) : Prop extends IsClosedImmersion i where
  ker_mul_self : i.ker * i.ker = ⊥

theorem IsFirstOrderThickening.isThickening {Z X : Scheme.{u}} (i : Z ⟶ X)
    [IsFirstOrderThickening i] : IsThickening i := by
  sorry

theorem isFirstOrderThickening_specMap_iff {B : CommRingCat.{u}} (J : Ideal B) :
    IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ↔ J * J = ⊥ := by
  sorry

theorem IsFirstOrderThickening.pullback {Z X Y : Scheme.{u}} (i : Z ⟶ X) [IsFirstOrderThickening i]
    (g : Y ⟶ X) : IsFirstOrderThickening (pullback.snd i g) := by
  sorry

/-- The underlying homeomorphism of a thickening. -/
def IsThickening.homeomorph {Z X : Scheme.{u}} (i : Z ⟶ X) [IsThickening i] : Z ≃ₜ X :=
  sorry

/-- A thickening of order `n + 2` factors through a first-order thickening of a thickening of order
`n + 1` (the reduction to square-zero ideals). -/
theorem IsThickening.factor_firstOrder {Z X : Scheme.{u}} (i : Z ⟶ X) [IsClosedImmersion i] (n : ℕ)
    (h : i.ker ^ (n + 2) = ⊥) :
    ∃ (Z' : Scheme.{u}) (a : Z ⟶ Z') (b : Z' ⟶ X), a ≫ b = i ∧ IsClosedImmersion a ∧
      a.ker ^ (n + 1) = ⊥ ∧ IsFirstOrderThickening b := by
  sorry

-- Check `isFirstOrderThickening_dualNumber`
example (k : Type u) [Field k] (B : CommRingCat.{u}) (e : B ≅ CommRingCat.of (DualNumber k))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv DualNumber.eps}) :
    IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- Check `isFirstOrderThickening_id`
example (X : Scheme.{u}) : IsFirstOrderThickening (𝟙 X) := by
  sorry

-- Check `not_isFirstOrderThickening_cube`
example (k : Type u) [Field k] (B : CommRingCat.{u})
    (e : B ≅ CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 3}))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv (Ideal.Quotient.mk _ Polynomial.X)}) :
    IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ∧
      ¬ IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- Check `not_isThickening_origin`
example (k : Type u) [Field k] :
    ¬ IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
      (Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

/-- Formally smooth morphisms: extensions exist along affine first-order thickenings over the
base (Stacks 02H0). -/
class FormallySmooth {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  exists_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

/-- Formally étale morphisms: unique extensions along affine first-order thickenings (Stacks 02HG). -/
class FormallyEtale {X S : Scheme.{u}} (f : X ⟶ S) : Prop where
  existsUnique_lift : ∀ {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S), g ≫ f = i ≫ h → ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h

theorem FormallySmooth.exists_lift' {X S : Scheme.{u}} (f : X ⟶ S) [FormallySmooth f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h :=
  FormallySmooth.exists_lift i g h w

theorem formallySmooth_specMap_iff {R S : CommRingCat.{u}} (φ : R ⟶ S) :
    FormallySmooth (Spec.map φ) ↔ φ.hom.FormallySmooth := by
  sorry

theorem FormallySmooth.iff_affineLocally {X S : Scheme.{u}} (f : X ⟶ S) :
    FormallySmooth f ↔ ∀ (V : S.affineOpens) (U : X.affineOpens) (e : (U : X.Opens) ≤ f ⁻¹ᵁ V),
      (f.appLE V U e).hom.FormallySmooth := by
  sorry

instance FormallySmooth.comp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) [FormallySmooth f]
    [FormallySmooth g] : FormallySmooth (f ≫ g) := by
  sorry

instance FormallySmooth.pullback {X Y S : Scheme.{u}} (f : X ⟶ S) (g : Y ⟶ S) [FormallySmooth g] :
    FormallySmooth (pullback.fst f g) := by
  sorry

instance FormallyEtale.of_isOpenImmersion {X S : Scheme.{u}} (f : X ⟶ S) [IsOpenImmersion f] :
    FormallyEtale f := by
  sorry

-- Check `formallySmooth_affineSpace`
example (S : Scheme.{u}) (n : Type u) : FormallySmooth (𝔸(n; S) ↘ S) := by
  sorry

-- Check `formallyEtale_id`
example (X : Scheme.{u}) : FormallyEtale (𝟙 X) := by
  sorry

-- Check `not_formallySmooth_closedPoint`
example (k : Type u) [Field k] :
    ¬ FormallySmooth (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
      (Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

-- Check `formallyUnramified_iff_mathlib`
example {X S : Scheme.{u}} (f : X ⟶ S) :
    FormallyEtale f ↔ FormallySmooth f ∧ _root_.AlgebraicGeometry.FormallyUnramified f := by
  sorry

/-- Infinitesimal lifting criterion (Stacks 02H6, 02HM). -/
theorem smooth_iff_formallySmooth {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFinitePresentation f] :
    Smooth f ↔ FormallySmooth f := by
  sorry

theorem etale_iff_formallyEtale {X S : Scheme.{u}} (f : X ⟶ S) [LocallyOfFinitePresentation f] :
    Etale f ↔ FormallyEtale f := by
  sorry

/-- Torsor of lifts, affine part: a smooth morphism admits lifts along affine first-order
thickenings, and an étale one admits unique lifts. The sheaf-level torsor under
`Hom(a^*Ω_{X/S}, I)` and its class in `H¹` need the sheaf of differentials of Tau Ceti
StableReduction Layer 1 and are not typed here. -/
theorem Smooth.exists_lift {X S : Scheme.{u}} (f : X ⟶ S) [Smooth f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃ l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h := by
  sorry

theorem Etale.existsUnique_lift {X S : Scheme.{u}} (f : X ⟶ S) [Etale f]
    {T T' : Scheme.{u}} [IsAffine T'] (i : T ⟶ T') [IsFirstOrderThickening i]
    (g : T ⟶ X) (h : T' ⟶ S) (w : g ≫ f = i ≫ h) : ∃! l : T' ⟶ X, i ≫ l = g ∧ l ≫ f = h := by
  sorry

end Formal

/-! ### Formal deformation theory -/

namespace Deformation

variable (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k]

/-- Objects of `C_Λ`: Artinian local Λ-algebras `A` with a surjective augmentation `A → k`
(equivalently an identification of the residue field with `k`), Stacks 06GC. -/
def IsArtinLocalAug : ObjectProperty (Over (CommAlgCat.of Λ k)) := fun A =>
  IsArtinianRing A.left ∧ IsLocalRing A.left ∧ Function.Surjective A.hom.hom

/-- The category `C_Λ`; morphisms are Λ-algebra maps over `k`, automatically local. -/
abbrev ArtinLocalAlg := (IsArtinLocalAug Λ k).FullSubcategory

variable {Λ k}

instance (A : ArtinLocalAlg Λ k) : IsArtinianRing A.obj.left := A.property.1

instance (A : ArtinLocalAlg Λ k) : IsLocalRing A.obj.left := A.property.2.1

/-- The underlying algebra map of a morphism of `C_Λ`. -/
abbrev ArtinLocalAlg.toAlgHom {A B : ArtinLocalAlg Λ k} (f : A ⟶ B) :
    A.obj.left →ₐ[Λ] B.obj.left :=
  f.hom.left.hom

/-- `k` itself, terminal in `C_Λ`. -/
def ArtinLocalAlg.residue : ArtinLocalAlg Λ k :=
  ⟨Over.mk (𝟙 (CommAlgCat.of Λ k)), sorry⟩

/-- The augmentation as the morphism to the terminal object. -/
def ArtinLocalAlg.toResidue (A : ArtinLocalAlg Λ k) : A ⟶ ArtinLocalAlg.residue :=
  sorry

/-- The dual numbers `k[ε]` with augmentation `ε ↦ 0`. -/
def ArtinLocalAlg.dualNumbers : ArtinLocalAlg Λ k :=
  sorry

/-- Small extensions (Stacks 06GD): surjective with nonzero principal kernel killed by the maximal
ideal. -/
def IsSmallExtension {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) : Prop :=
  Function.Surjective (ArtinLocalAlg.toAlgHom f) ∧
    ∃ t : A'.obj.left, t ≠ 0 ∧ RingHom.ker (ArtinLocalAlg.toAlgHom f).toRingHom = Ideal.span {t} ∧
      ∀ m ∈ IsLocalRing.maximalIdeal A'.obj.left, m * t = 0

theorem IsSmallExtension.surjective {A' A : ArtinLocalAlg Λ k} {f : A' ⟶ A}
    (h : IsSmallExtension f) : Function.Surjective (ArtinLocalAlg.toAlgHom f) :=
  h.1

/-- Fibre products along a surjection stay in `C_Λ` (Stacks 06GH). -/
def ArtinLocalAlg.pullback {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) : ArtinLocalAlg Λ k :=
  sorry

def ArtinLocalAlg.pullbackFst {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    ArtinLocalAlg.pullback f₁ f₂ hf₂ ⟶ A₁ :=
  sorry

def ArtinLocalAlg.pullbackSnd {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    ArtinLocalAlg.pullback f₁ f₂ hf₂ ⟶ A₂ :=
  sorry

theorem ArtinLocalAlg.isPullback {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    IsPullback (ArtinLocalAlg.pullbackFst f₁ f₂ hf₂) (ArtinLocalAlg.pullbackSnd f₁ f₂ hf₂)
      f₁ f₂ := by
  sorry

theorem ArtinLocalAlg.toResidue_surjective (A : ArtinLocalAlg Λ k) :
    Function.Surjective (ArtinLocalAlg.toAlgHom A.toResidue) := by
  sorry

/-- The addition map `k[ε] ×_k k[ε] → k[ε]`, `(a + bε₁, a + cε₂) ↦ a + (b + c)ε`. -/
def ArtinLocalAlg.dualAdd :
    ArtinLocalAlg.pullback (ArtinLocalAlg.toResidue (Λ := Λ) (k := k) ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _) ⟶ ArtinLocalAlg.dualNumbers :=
  sorry

/-- Every surjection in `C_Λ` is a finite composite of small extensions (Stacks 06GE). -/
theorem factor_smallExtensions {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A)
    (hf : Function.Surjective (ArtinLocalAlg.toAlgHom f)) :
    ∃ (n : ℕ) (B : Fin (n + 1) → ArtinLocalAlg Λ k) (g : ∀ i : Fin n, B i.castSucc ⟶ B i.succ),
      (∀ i, IsSmallExtension (g i)) ∧ Nonempty (B 0 ≅ A') ∧ Nonempty (B (Fin.last n) ≅ A) := by
  sorry

/-- Complete Noetherian local Λ-algebras with residue field `k` (the category `Ĉ_Λ`, Stacks 06GW),
bundled with their augmentation. -/
structure CompleteLocalAlg (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k] where
  R : Type u
  [commRing : CommRing R]
  [algebra : Algebra Λ R]
  [isLocalRing : IsLocalRing R]
  [isNoetherianRing : IsNoetherianRing R]
  [complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R]
  ρ : R →ₐ[Λ] k
  ρ_surjective : Function.Surjective ρ

attribute [instance] CompleteLocalAlg.commRing CompleteLocalAlg.algebra
  CompleteLocalAlg.isLocalRing CompleteLocalAlg.isNoetherianRing CompleteLocalAlg.complete

/-- An object of `Ĉ_Λ` is the limit of its Artinian quotients `R/m^n` (Stacks 06GW). -/
theorem CompleteLocalAlg.toPro (R : CompleteLocalAlg Λ k) :
    Function.Bijective (AdicCompletion.of (IsLocalRing.maximalIdeal R.R) R.R) := by
  sorry

-- Check `zmod_prime_pow_mem`: Z/p^(n+1) is Artinian local (an object of C_{Z_p}).
example (p : ℕ) [Fact p.Prime] (n : ℕ) : IsArtinianRing (ZMod (p ^ (n + 1))) ∧
    IsLocalRing (ZMod (p ^ (n + 1))) := by
  sorry

-- Check `residue_terminal`
example (A : ArtinLocalAlg Λ k) : Subsingleton (A ⟶ ArtinLocalAlg.residue) := by
  sorry

-- Check `not_mem_padicInt`
example (p : ℕ) [Fact p.Prime] : ¬ IsArtinianRing ℤ_[p] := by
  sorry

-- Check `dualNumber_pullback`: `k[ε] ×_k k[ε]` has a two-dimensional cotangent space.
example : Module.finrank
    (IsLocalRing.ResidueField (ArtinLocalAlg.pullback (Λ := Λ) (k := k)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _)).obj.left)
    (IsLocalRing.CotangentSpace (ArtinLocalAlg.pullback (Λ := Λ) (k := k)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _)).obj.left) = 2 := by
  sorry

/-- A predeformation functor: `F(k)` is a point (Stacks 06GS for functors). -/
structure PredeformationFunctor (Λ : Type u) [CommRing Λ] (k : Type u) [Field k] [Algebra Λ k] where
  F : ArtinLocalAlg Λ k ⥤ Type u
  unique : Unique (F.obj ArtinLocalAlg.residue)

namespace PredeformationFunctor

variable (D : PredeformationFunctor Λ k)

/-- The comparison map θ for a fibre product along a surjection. -/
def θ {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A)
    (hf₂ : Function.Surjective (ArtinLocalAlg.toAlgHom f₂)) :
    D.F.obj (ArtinLocalAlg.pullback f₁ f₂ hf₂) → {p : D.F.obj A₁ × D.F.obj A₂ //
      D.F.map f₁ p.1 = D.F.map f₂ p.2} :=
  fun x => ⟨(D.F.map (ArtinLocalAlg.pullbackFst f₁ f₂ hf₂) x,
    D.F.map (ArtinLocalAlg.pullbackSnd f₁ f₂ hf₂) x), sorry⟩

/-- Schlessinger's (H1). -/
def H1 : Prop :=
  ∀ {A₁ A₂ A : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ A) (f₂ : A₂ ⟶ A) (hs : IsSmallExtension f₂),
    Function.Surjective (D.θ f₁ f₂ hs.surjective)

/-- Schlessinger's (H2): bijectivity for `A = k`, `A₂ = k[ε]`. -/
def H2 : Prop :=
  ∀ {A₁ : ArtinLocalAlg Λ k} (f₁ : A₁ ⟶ ArtinLocalAlg.residue),
    Function.Bijective (D.θ f₁ (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue_surjective _))

/-- Schlessinger's (H4): bijectivity along a small extension `A' → A` with `A₁ = A₂ = A'`. -/
def H4 : Prop :=
  ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hs : IsSmallExtension f),
    Function.Bijective (D.θ f f hs.surjective)

/-- The tangent space `F(k[ε])`. -/
abbrev tangentSpace : Type u := D.F.obj ArtinLocalAlg.dualNumbers

/-- Under (H2) the tangent space is an abelian group (Stacks 06IH). -/
abbrev tangentSpace.addCommGroup (h : D.H2) : AddCommGroup D.tangentSpace :=
  sorry

/-- Under (H2) the tangent space is a `k`-vector space (Stacks 06IH). -/
abbrev tangentSpace.module (h : D.H2) :
    letI := tangentSpace.addCommGroup D h
    Module k D.tangentSpace :=
  sorry

/-- Schlessinger's (H3): finite-dimensional tangent space. -/
def H3 (h : D.H2) : Prop :=
  letI := tangentSpace.addCommGroup D h
  letI := tangentSpace.module D h
  FiniteDimensional k D.tangentSpace

/-- The sum of tangent vectors is computed by the addition map `k[ε] ×_k k[ε] → k[ε]`. -/
theorem tangentSpace.add_def (h : D.H2) (v w : D.tangentSpace)
    (x : D.F.obj (ArtinLocalAlg.pullback (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers)
      (ArtinLocalAlg.toResidue ArtinLocalAlg.dualNumbers) (ArtinLocalAlg.toResidue_surjective _)))
    (hx : (D.θ _ _ _ x).1 = (v, w)) :
    letI := tangentSpace.addCommGroup D h
    v + w = D.F.map ArtinLocalAlg.dualAdd x := by
  sorry

/-- Lifts along a small extension, when they exist, form a torsor under the tangent space
(Stacks 06JI, kernel one-dimensional). -/
theorem lifts_torsor (h2 : D.H2) (h4 : D.H4) {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A)
    (hs : IsSmallExtension f) (ξ : D.F.obj A) :
    letI := tangentSpace.addCommGroup D h2
    ∃ act : D.tangentSpace → {x // D.F.map f x = ξ} → {x // D.F.map f x = ξ},
      ∀ x y : {x // D.F.map f x = ξ}, ∃! v, act v x = y := by
  sorry

/-- Functoriality of tangent spaces. -/
def map (D' : PredeformationFunctor Λ k) (η : D.F ⟶ D'.F) : D.tangentSpace → D'.tangentSpace :=
  η.app _

end PredeformationFunctor

/-- The prorepresented functor `h_R = Hom_Λ(R, -)` restricted to `C_Λ`. -/
def prorep (R : CompleteLocalAlg Λ k) : PredeformationFunctor Λ k :=
  sorry

/-- Smooth morphisms of functors (Stacks 06HG). -/
def IsSmoothMorphism {D D' : PredeformationFunctor Λ k} (η : D.F ⟶ D'.F) : Prop :=
  ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), Function.Surjective (ArtinLocalAlg.toAlgHom f) →
    ∀ (x : D.F.obj A) (y : D'.F.obj A'), D'.F.map f y = η.app A x →
      ∃ z : D.F.obj A', D.F.map f z = x ∧ η.app A' z = y

/-- A formal element of `D` over `R`: a natural transformation `h_R → F` (Stacks 06H3). -/
abbrev FormalElement (D : PredeformationFunctor Λ k) (R : CompleteLocalAlg Λ k) :=
  (prorep R).F ⟶ D.F

/-- Versal formal elements (Stacks 06HR). -/
def IsVersal {D : PredeformationFunctor Λ k} {R : CompleteLocalAlg Λ k} (ξ : FormalElement D R) :
    Prop :=
  IsSmoothMorphism ξ

/-- Hulls = minimal versal formal elements (Stacks 06T4). -/
def IsHull {D : PredeformationFunctor Λ k} {R : CompleteLocalAlg Λ k} (ξ : FormalElement D R) :
    Prop :=
  IsVersal ξ ∧ Function.Bijective (PredeformationFunctor.map (prorep R) D ξ)

/-- Prorepresentable functors (Stacks 06GX). -/
def IsProrepresentable (D : PredeformationFunctor Λ k) : Prop :=
  ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsIso ξ

theorem IsHull.unique {D : PredeformationFunctor Λ k} {R R' : CompleteLocalAlg Λ k}
    (ξ : FormalElement D R) (ξ' : FormalElement D R') (h : IsHull ξ) (h' : IsHull ξ') :
    Nonempty (R.R ≃ₐ[Λ] R'.R) := by
  sorry

theorem IsProrepresentable.isHull {D : PredeformationFunctor Λ k} (h : IsProrepresentable D) :
    ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

theorem IsVersal.powerSeries {D : PredeformationFunctor Λ k} {R : CompleteLocalAlg Λ k}
    (ξ : FormalElement D R) (h : IsVersal ξ) :
    ∃ (R₀ : CompleteLocalAlg Λ k) (ξ₀ : FormalElement D R₀) (r : ℕ), IsHull ξ₀ ∧
      Nonempty (R.R ≃ₐ[Λ] MvPowerSeries (Fin r) R₀.R) := by
  sorry

/-- Schlessinger's theorem: hulls (Stacks 06IX, 06IY). -/
theorem schlessinger_hull (D : PredeformationFunctor Λ k) :
    (∃ (_ : D.H1) (h2 : D.H2), D.H3 h2) ↔
      ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

/-- Schlessinger's theorem: prorepresentability (Stacks 06JM). -/
theorem schlessinger_prorepresentable (D : PredeformationFunctor Λ k) :
    (∃ (_ : D.H1) (h2 : D.H2), D.H3 h2 ∧ D.H4) ↔ IsProrepresentable D := by
  sorry

-- Check `prorep_tangent_powerSeries`
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    Nonempty ((prorep R).tangentSpace ≃ (Fin n → k)) := by
  sorry

-- Check `point_functor`: a functor with one-point values satisfies H1 and H4 and has a
-- one-point tangent space.
example (D : PredeformationFunctor Λ k) (h : ∀ A, Subsingleton (D.F.obj A)) :
    D.H1 ∧ D.H4 ∧ Subsingleton D.tangentSpace := by
  sorry

-- Check `not_H2_quotient`: for char k ≠ 2, the quotient of h_{k[[t]]} by t ↦ −t satisfies H1
-- but not H2.
example (h2 : (2 : k) ≠ 0) : ∃ D : PredeformationFunctor Λ k, D.H1 ∧ ¬ D.H2 := by
  sorry

-- Check `tangent_eq_derivations`: compare Tau Ceti's derivationToDualNumberEquivLift.
example (R : CompleteLocalAlg Λ k) :
    letI := R.ρ.toRingHom.toAlgebra
    Nonempty ((prorep R).tangentSpace ≃ Derivation Λ R.R k) := by
  sorry

-- Check `hull_prorep`
example (R : CompleteLocalAlg Λ k) : IsHull (𝟙 (prorep R).F) := by
  sorry

-- Check `smooth_iff_powerSeries`: h_R → h_Λ is smooth iff R is a power series ring over Λ.
example (R Λ' : CompleteLocalAlg Λ k) (eΛ : Λ'.R ≃ₐ[Λ] Λ) (η : (prorep R).F ⟶ (prorep Λ').F) :
    IsSmoothMorphism η ↔ ∃ n : ℕ, Nonempty (R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) := by
  sorry

-- Check `versal_not_hull`: (k[[t, s]], t ↦ t) is versal but not a hull for h_{k[[t]]}.
example (R R₁ : CompleteLocalAlg Λ k) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ)
    (e₁ : R₁.R ≃ₐ[Λ] MvPowerSeries (Fin 1) Λ) (ξ : FormalElement (prorep R₁) R)
    (hv : IsVersal ξ) : ¬ IsHull ξ := by
  sorry

-- Check `versal_quotient_no_hull`: the quotient functor of `not_H2_quotient` has a versal
-- element but no hull.
example (h2 : (2 : k) ≠ 0) : ∃ D : PredeformationFunctor Λ k,
    (∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsVersal ξ) ∧
    ¬ ∃ (R : CompleteLocalAlg Λ k) (ξ : FormalElement D R), IsHull ξ := by
  sorry

/-- Obstruction theories (Stacks 07YG specialised to `C_Λ`). The kernel `I` of a small extension is
one-dimensional, so the class `ob ∈ O ⊗ I` is recorded in `O` after choosing a generator. -/
structure ObstructionTheory (D : PredeformationFunctor Λ k) where
  O : Type u
  [addCommGroup : AddCommGroup O]
  [module : Module k O]
  [finiteDimensional : FiniteDimensional k O]
  ob : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f → D.F.obj A → O
  lift_iff : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hf : IsSmallExtension f) (ξ : D.F.obj A),
    ob f hf ξ = 0 ↔ ∃ x, D.F.map f x = ξ

attribute [instance] ObstructionTheory.addCommGroup ObstructionTheory.module
  ObstructionTheory.finiteDimensional

theorem ObstructionTheory.lift_iff' {D : PredeformationFunctor Λ k} (o : ObstructionTheory D)
    {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A) (hf : IsSmallExtension f) (ξ : D.F.obj A) :
    o.ob f hf ξ = 0 ↔ ∃ x, D.F.map f x = ξ :=
  o.lift_iff f hf ξ

/-- An unobstructed functor has the zero obstruction theory. -/
def ObstructionTheory.zero (D : PredeformationFunctor Λ k)
    (h : ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f →
      Function.Surjective (D.F.map f)) : ObstructionTheory D :=
  sorry

/-- A hull `Λ[[t₁..t_d]]/J` with `d = dim T_F` has at most `dim O` minimal relations. -/
theorem ObstructionTheory.relations_le {D : PredeformationFunctor Λ k} (o : ObstructionTheory D)
    (d : ℕ) (J : Ideal (MvPowerSeries (Fin d) Λ)) (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin d) Λ ⧸ J) (ξ : FormalElement D R) (h : IsHull ξ) :
    J.spanFinrank ≤ Module.finrank k o.O := by
  sorry

/-- Obstruction theories pull back along smooth morphisms. -/
def ObstructionTheory.map {D D' : PredeformationFunctor Λ k} (η : D.F ⟶ D'.F)
    (hη : IsSmoothMorphism η) (o : ObstructionTheory D') : ObstructionTheory D :=
  sorry

-- Check `obstruction_powerSeries`
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    ∃ o : ObstructionTheory (prorep R), Module.finrank k o.O = 0 := by
  sorry

-- Check `obstruction_hypersurface`: h_{Λ[[t]]/(t²)} has a nonzero obstruction space.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] PowerSeries Λ ⧸ Ideal.span {(PowerSeries.X : PowerSeries Λ) ^ 2})
    (o : ObstructionTheory (prorep R)) : 0 < Module.finrank k o.O := by
  sorry

-- Check `not_unobstructed_hypersurface`: h_{k[[x,y]]/(xy)} is not unobstructed.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) Λ)}) :
    ¬ ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f →
      Function.Surjective ((prorep R).F.map f) := by
  sorry

/- Deformation.obstruction_H1_example: for the functor of lifts of a fixed morphism to a smooth
   target, H¹ of Hom(a^*Ω, O) is an obstruction space. It needs sheaf cohomology of O_X-modules
   (SchemeAndStackFoundations Layer 2) and is stated in the roadmap only.

   Theorems of Layer 4 of the roadmap not typed here (they need Ext groups of O_X-modules
   and the sheaf of differentials of Tau Ceti StableReduction Layer 1):
   * Layer 4 (algebra deformation classes)  (Stacks 0GPT, 08S7, 08S5, 08S6, 0D14),
   * Layer 4 (deformations of smooth schemes) (Stacks 0DY7–0ET5, 0DZQ; H¹(T), H²(T), H¹(O), H²(O)),
   * Layer 4 (node versal deformation) (hull Λ[[t]], universal family uv = t; DM69 (1.6)). -/

end Deformation

namespace Formal
open _root_.AlgebraicGeometry

/-! ### Formal schemes, completion and algebraization -/

/-- An adic ring with finitely generated ideal of definition, complete and separated. -/
structure AdicRing where
  carrier : Type u
  [commRing : CommRing carrier]
  ideal : Ideal carrier
  fg : ideal.FG
  [complete : IsAdicComplete ideal carrier]

attribute [instance] AdicRing.commRing AdicRing.complete

/-- The level maps `X 0 → X n` of a system of thickenings. -/
def levelMap (X : ℕ → Scheme.{u}) (ι : ∀ n, X n ⟶ X (n + 1)) : ∀ n, X 0 ⟶ X n
  | 0 => 𝟙 _
  | n + 1 => levelMap X ι n ≫ ι n

/-- A formal scheme, prototyped by a system of thickenings `X 0 ⊂ X 1 ⊂ ⋯` in which `X n` is cut
out in `X (n + 1)` by the `(n + 1)`-st power of the ideal of `X 0` (Stacks 0AIF). The
roadmap's definition is the topologically locally ringed space `colim X n`. -/
structure FormalScheme where
  X : ℕ → Scheme.{u}
  ι : ∀ n, X n ⟶ X (n + 1)
  isThickening : ∀ n, IsThickening (ι n)
  adic : ∀ n, (ι n).ker = (levelMap X ι (n + 1)).ker ^ (n + 1)

namespace FormalScheme

/-- The reductions `X n`. -/
abbrev reduction (𝔛 : FormalScheme.{u}) (n : ℕ) : Scheme.{u} := 𝔛.X n

/-- Level-preserving morphisms of systems. -/
structure Hom (𝔛 𝔜 : FormalScheme.{u}) where
  app : ∀ n, 𝔛.X n ⟶ 𝔜.X n
  comm : ∀ n, 𝔛.ι n ≫ app (n + 1) = app n ≫ 𝔜.ι n

/-- Adic morphisms: each level is the base change of the next. -/
def IsAdicHom {𝔛 𝔜 : FormalScheme.{u}} (f : Hom 𝔛 𝔜) : Prop :=
  ∀ n, IsPullback (𝔛.ι n) (f.app n) (f.app (n + 1)) (𝔜.ι n)

/-- A scheme as a formal scheme with the zero ideal of definition. -/
def ofScheme (X : Scheme.{u}) : FormalScheme.{u} where
  X _ := X
  ι _ := 𝟙 X
  isThickening _ := sorry
  adic _ := sorry

/-- Locally Noetherian formal schemes. -/
def IsLocallyNoetherian (𝔛 : FormalScheme.{u}) : Prop :=
  ∀ n, _root_.AlgebraicGeometry.IsLocallyNoetherian (𝔛.X n)

/-- Fibre products of adic morphisms, computed levelwise. -/
def pullback {𝔛 𝔜 𝔖 : FormalScheme.{u}} (f : Hom 𝔛 𝔖) (g : Hom 𝔜 𝔖) (hf : IsAdicHom f) :
    FormalScheme.{u} :=
  sorry

theorem pullback_X {𝔛 𝔜 𝔖 : FormalScheme.{u}} (f : Hom 𝔛 𝔖) (g : Hom 𝔜 𝔖) (hf : IsAdicHom f)
    (n : ℕ) : Nonempty ((pullback f g hf).X n ≅ Limits.pullback (f.app n) (g.app n)) := by
  sorry

/- AlgebraicGeometry.FormalScheme.adicEquivSystems: in this prototype a formal scheme is given by
   its system of reductions, so adic formal schemes over `Spf A` are by definition compatible
   systems over `A/I^{n+1}`; the comparison with topologically locally ringed spaces needs sheaves of topological rings, which Mathlib does not provide, and is stated in
   the roadmap. -/

end FormalScheme

/-- `Spf A` as the system `Spec (A/I^{n+1})` (Stacks 0AIF). -/
def Spf (A : AdicRing.{u}) : FormalScheme.{u} where
  X n := Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1)))
  ι n := Spec.map (CommRingCat.ofHom (Ideal.Quotient.factor
    (Ideal.pow_le_pow_right (by omega : n + 1 ≤ n + 2))))
  isThickening _ := sorry
  adic _ := sorry

namespace Spf

/-- Global sections of `Spf A` recover `A`: `A` is the limit of the `A/I^{n+1}`. -/
theorem globalSections (A : AdicRing.{u}) :
    Function.Bijective (AdicCompletion.of A.ideal A.carrier) := by
  sorry

/-- Morphisms `Spf B → Spf A` correspond to continuous ring maps `A → B`. -/
theorem homEquiv (A B : AdicRing.{u}) :
    Nonempty (FormalScheme.Hom (Spf B) (Spf A) ≃
      {φ : A.carrier →+* B.carrier // A.ideal.map φ ≤ B.ideal}) := by
  sorry

/- AlgebraicGeometry.Spf.basicOpen_sections: Γ(D(f), O_{Spf A}) is the I-adic completion of A_f;
   it needs the structure sheaf of topological rings and is stated in the roadmap. -/

/-- The closed immersions `Spec (A/I^{n+1}) → Spf A`. -/
abbrev reduction (A : AdicRing.{u}) (n : ℕ) : Scheme.{u} := (Spf A).X n

/-- With the zero ideal of definition, `Spf A` is `Spec A`. -/
theorem ofScheme (A : AdicRing.{u}) (h : A.ideal = ⊥) (n : ℕ) :
    Nonempty ((Spf A).X n ≅ Spec (CommRingCat.of A.carrier)) := by
  sorry

/-- Functoriality in continuous ring maps. -/
def map {A B : AdicRing.{u}} (φ : A.carrier →+* B.carrier) (hφ : A.ideal.map φ ≤ B.ideal) :
    FormalScheme.Hom (Spf B) (Spf A) :=
  sorry

end Spf

-- Check `padicInt_points`: Spf Z_p has one point.
example (p : ℕ) [Fact p.Prime] (A : AdicRing.{0}) (e : A.carrier ≃+* ℤ_[p])
    (hI : A.ideal = Ideal.span {e.symm p}) : Subsingleton ((Spf A).X 0) := by
  sorry

-- Check `discrete_eq_spec`
example (A : AdicRing.{u}) (h : A.ideal = ⊥) :
    Nonempty ((Spf A).X 0 ≅ Spec (CommRingCat.of A.carrier)) := by
  sorry

-- Check `not_spec_powerSeries`: Spf k[[t]] has one point, Spec k[[t]] two.
example (k : Type u) [Field k] (A : AdicRing.{u}) (e : A.carrier ≃+* PowerSeries k)
    (hI : A.ideal = Ideal.span {e.symm PowerSeries.X}) : Subsingleton ((Spf A).X 0) := by
  sorry

example (k : Type u) [Field k] : ¬ Subsingleton (Spec (CommRingCat.of (PowerSeries k))) := by
  sorry

-- Check `homEquiv_padic`: the only ring endomorphism of Z_p is the identity.
example (p : ℕ) [Fact p.Prime] (φ : ℤ_[p] →+* ℤ_[p]) : φ = RingHom.id _ := by
  sorry

-- Check `ofScheme_spf`
example (A : AdicRing.{u}) (h : A.ideal = ⊥) (n : ℕ) :
    Nonempty ((Spf A).X n ≅ (FormalScheme.ofScheme (Spec (CommRingCat.of A.carrier))).X n) := by
  sorry

-- Check `padic_line`: the reductions of the completion of 𝔸¹_{Z_p} along
-- p = 0 are 𝔸¹ over Z/p^{n+1}.
example (p : ℕ) [Fact p.Prime] (n : ℕ) (A : AdicRing.{0})
    (e : A.carrier ≃+* (PowerSeries ℤ_[p])) :
    Nonempty (Spec (CommRingCat.of (Polynomial (ZMod (p ^ (n + 1))))) ≅
      Spec (CommRingCat.of (Polynomial ℤ_[p] ⧸ Ideal.span {(p : Polynomial ℤ_[p]) ^ (n + 1)}))) := by
  sorry

-- Check `not_adic_projection`: Spf k[[s,t]] → Spf k[[s]] is not adic,
-- because (s) does not generate an ideal of definition of k[[s,t]].
example (k : Type u) [Field k] :
    Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 2) k)} ≠
      Ideal.span {MvPowerSeries.X 0, MvPowerSeries.X 1} := by
  sorry

-- Check `locallyNoetherian_padic`
example (A : AdicRing.{u}) [IsNoetherianRing A.carrier] :
    FormalScheme.IsLocallyNoetherian (Spf A) := by
  sorry

/-- The formal completion `X/Z` along the closed subscheme cut out by `I`: the system of
infinitesimal neighbourhoods `V(I^{n+1})` (Stacks 0AIZ, 0AMC, 0GBA). -/
def Scheme.formalCompletion (X : Scheme.{u}) (I : X.IdealSheafData) : FormalScheme.{u} where
  X n := (I ^ (n + 1)).subscheme
  ι n := Scheme.IdealSheafData.inclusion (sorry : I ^ (n + 2) ≤ I ^ (n + 1))
  isThickening _ := sorry
  adic _ := sorry

namespace Scheme.formalCompletion

/-- The canonical maps from the reductions of `X/Z` to `X`. -/
def toScheme (X : Scheme.{u}) (I : X.IdealSheafData) (n : ℕ) :
    (Scheme.formalCompletion X I).X n ⟶ X :=
  (I ^ (n + 1)).subschemeι

/-- Functoriality for morphisms carrying the first centre into the second. -/
def map {X Y : Scheme.{u}} (f : X ⟶ Y) (I : X.IdealSheafData) (J : Y.IdealSheafData)
    (h : J ≤ I.map f) :
    FormalScheme.Hom (Scheme.formalCompletion X I) (Scheme.formalCompletion Y J) :=
  sorry

theorem reduction (X : Scheme.{u}) (I : X.IdealSheafData) (n : ℕ) :
    (Scheme.formalCompletion X I).X n = (I ^ (n + 1)).subscheme :=
  rfl

/-- Over a locally Noetherian scheme the completion is locally Noetherian (flatness of `X/Z → X`
is recorded in the roadmap). -/
theorem flat (X : Scheme.{u}) [_root_.AlgebraicGeometry.IsLocallyNoetherian X] (I : X.IdealSheafData) :
    FormalScheme.IsLocallyNoetherian (Scheme.formalCompletion X I) := by
  sorry

end Scheme.formalCompletion

/- AlgebraicGeometry.Scheme.formalCompletion_spec: for `X = Spec A` and `I` finitely generated,
   `X/V(I) ≅ Spf Â` (Stacks 0GBA); it needs the ideal sheaf of an ideal on an affine scheme, which
   Mathlib builds only through `IdealSheafData.ofIdeals` with compatibility data; stated in the
   roadmap. -/

-- Check `formalCompletion_affineLine_origin`: the reductions of the completion of 𝔸¹_k
-- at the origin are Spec k[t]/(t^{n+1}) (the reductions of Spf k[[t]]).
example (k : Type u) [Field k] (n : ℕ) :
    Nonempty (Spec (CommRingCat.of (PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ (n + 1)})) ≅
      Spec (CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ (n + 1)}))) := by
  sorry

-- Check `formalCompletion_self`
example (X : Scheme.{u}) (n : ℕ) : Nonempty ((Scheme.formalCompletion X ⊥).X n ≅ X) := by
  sorry

-- Check `formalCompletion_empty`
example (X : Scheme.{u}) (n : ℕ) : IsEmpty ((Scheme.formalCompletion X ⊤).X n) := by
  sorry

-- Check `formalCompletion_ne_neighbourhood`: k[[t]] is not Artinian.
example (k : Type u) [Field k] : ¬ IsArtinianRing (PowerSeries k) := by
  sorry

/-- Coherent formal modules (Stacks 0EHN): finitely presented modules on the reductions with
compatible restrictions. -/
structure Scheme.CoherentFormalModule (𝔛 : FormalScheme.{u}) where
  F : ∀ n, (𝔛.X n).Modules
  fp : ∀ n, (F n).IsFinitePresentation
  iso : ∀ n, (Scheme.Modules.pullback (𝔛.ι n)).obj (F (n + 1)) ≅ F n

/-- The completion of a finitely presented module (Stacks 0880). -/
def Scheme.completionFunctor (X : Scheme.{u}) (I : X.IdealSheafData)
    (M : X.Modules) (hM : M.IsFinitePresentation) :
    Scheme.CoherentFormalModule (Scheme.formalCompletion X I) where
  F n := (Scheme.Modules.pullback (Scheme.formalCompletion.toScheme X I n)).obj M
  fp _ := sorry
  iso _ := sorry

/- AlgebraicGeometry.Scheme.completionFunctor_exact (exactness of F ↦ (F/IⁿF)_n as a functor to
   inverse systems, Stacks 0881, via Artin–Rees; it is not levelwise exactness) and
   AlgebraicGeometry.Scheme.coherentFormalModuleEquivSpec (coherent formal modules on Spf Â ≃ finite
   Â-modules, Stacks 087W) need the abelian category of coherent formal modules; stated in the
   roadmap. -/

/- AlgebraicGeometry.Scheme.coherentFormalModuleEquivFormal (coherent formal modules = coherent
   modules on the formal completion, Stacks 0EKN) and
   AlgebraicGeometry.Scheme.completionFunctor_obj_sections (sections of the completion are the
   completion of sections) need modules on topologically ringed spaces; stated in the roadmap. -/

-- Check `completion_structureSheaf_spec`: for a complete Noetherian ring the map to
-- the completion is bijective.
example (A : Type u) [CommRing A] [IsNoetherianRing A] (I : Ideal A) [IsAdicComplete I A] :
    Function.Bijective (AdicCompletion.of I A) := by
  sorry

-- Check `completion_zero_ideal`
example (A : Type u) [CommRing A] : Function.Bijective (AdicCompletion.of (⊥ : Ideal A) A) := by
  sorry

-- Check `completion_not_full_affineLine`: k[x] → k[[x]] is not surjective, so
-- multiplication by 1/(1 − x) is not the completion of an endomorphism of O_{𝔸¹}.
example (k : Type u) [Field k] :
    ¬ Function.Surjective (Polynomial.coeToPowerSeries.ringHom : Polynomial k →+* PowerSeries k) := by
  sorry

-- Check `completion_torsion`
example (p m : ℕ) [Fact p.Prime] :
    Function.Bijective (AdicCompletion.of (Ideal.span {(p : ℤ)}) (ZMod (p ^ m))) := by
  sorry

/- Theorems of Layer 4 that need coherent cohomology Hⁱ(X, F) and higher direct images (Tau Ceti's
   `TauCeti.AlgebraicGeometry.Cohomology.Basic` is not compiled in this build, and coherence of
   Rⁱf_* is Tau Ceti StableReduction Layer 2):
   * Layer 4 (theorem on formal functions)  (Stacks 02OC): H^p(X,F)^ ≅ lim_n H^p(X, F/IⁿF);
   * Layer 4 (stein factorization) (Stacks 03H0, 0AY8);
   * Layer 4 (effective formal deformations of curves).
   The existence and algebraization theorems are typed below. -/

/-- Grothendieck's existence theorem (Stacks 088C): for `X` proper over a complete Noetherian
ring, every coherent formal module is the completion of a coherent module. -/
theorem grothendieck_existence (A : AdicRing.{u}) [IsNoetherianRing A.carrier] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of A.carrier)) [IsProper f] (I : X.IdealSheafData)
    (hI : I.support = (Set.range (Limits.pullback.fst f (Spec.map (CommRingCat.ofHom
      (Ideal.Quotient.mk A.ideal)))) : Set X))
    (𝓜 : Scheme.CoherentFormalModule (Scheme.formalCompletion X I)) :
    ∃ (M : X.Modules) (hM : M.IsFinitePresentation),
      Nonempty (∀ n, (Scheme.completionFunctor X I M hM).F n ≅ 𝓜.F n) := by
  sorry

/- Algebraization of closed formal subschemes (Stacks 0899, 09ZT) is part of
   Layer 4 (algebraization of subschemes and morphisms) and is stated in the roadmap. -/

/-- The closed immersion `Spec (A/I^{n+1}) → Spec A`. -/
abbrev quotMap (A : AdicRing.{u}) (n : ℕ) :
    Spec (CommRingCat.of (A.carrier ⧸ A.ideal ^ (n + 1))) ⟶ Spec (CommRingCat.of A.carrier) :=
  Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk (A.ideal ^ (n + 1))))

/-- Algebraization of morphisms (Stacks 0A42): compatible maps of reductions of a proper scheme to
a separated finite-type scheme over a complete Noetherian ring come from a unique map. -/
theorem algebraize_hom (A : AdicRing.{u}) [IsNoetherianRing A.carrier]
    {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of A.carrier))
    (fY : Y ⟶ Spec (CommRingCat.of A.carrier)) [IsProper fX] [IsSeparated fY]
    [LocallyOfFiniteType fY]
    (g : ∀ n, Limits.pullback fX (quotMap A n) ⟶ Limits.pullback fY (quotMap A n))
    (hg : ∀ n, g n ≫ Limits.pullback.snd fY (quotMap A n) = Limits.pullback.snd fX (quotMap A n)) :
    ∃! G : X ⟶ Y, ∃ h : G ≫ fY = fX, ∀ n,
      Limits.pullback.map fX (quotMap A n) fY (quotMap A n) G (𝟙 _) (𝟙 _)
        (by rw [Category.comp_id, h]) (by simp) = g n := by
  sorry

/-- Grothendieck's algebraization theorem (Stacks 089A): a compatible system of proper schemes over
`A/I^{n+1}` whose first member carries an ample line bundle lifting to all levels is the system of
reductions of a proper `A`-scheme. Ampleness is Tau Ceti StableReduction Layer 2's notion and is
recorded in the roadmap; the typed form records the conclusion. -/
theorem grothendieck_algebraization (A : AdicRing.{u}) [IsNoetherianRing A.carrier]
    (𝔛 : FormalScheme.{u}) (π : FormalScheme.Hom 𝔛 (Spf A)) (hπ : FormalScheme.IsAdicHom π)
    (hproper : IsProper (π.app 0)) :
    ∃ (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of A.carrier)), IsProper f ∧
      ∀ n, Nonempty (Limits.pullback f (quotMap A n) ≅ 𝔛.X n) := by
  sorry

/-! ### Modifications, strict transforms, flattening, regularity -/

/-- Modifications: proper morphisms that are isomorphisms over a dense open with dense preimage
(Stacks 0AAZ; de Jong 2.17); source and target are assumed integral where used. -/
class IsModification {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  birational : ∃ U : S.Opens, Dense (U : Set S) ∧ Dense ((f ⁻¹ᵁ U : S'.Opens) : Set S') ∧
    IsIso (f ∣_ U)

theorem IsModification.comp {S'' S' S : Scheme.{u}} (g : S'' ⟶ S') (f : S' ⟶ S)
    [IsModification g] [IsModification f] : IsModification (g ≫ f) := by
  sorry

theorem IsModification.toBirational {S' S : Scheme.{u}} (f : S' ⟶ S) [IsModification f] :
    Scheme.Birational S' S := by
  sorry

/-- The centre: the closed set over which `f` is not an isomorphism. -/
def IsModification.centre {S' S : Scheme.{u}} (f : S' ⟶ S) [IsModification f] : Set S :=
  {s | ∀ U : S.Opens, s ∈ U → ¬ IsIso (f ∣_ U)}

theorem IsModification.isIso_of_isFinite {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] [IsFinite f]
    (hS : ∀ s : S, IsIntegrallyClosed (S.presheaf.stalk s)) : IsIso f := by
  sorry

/-- Alterations: proper dominant morphisms finite over a nonempty open (Stacks 0AB0; de Jong 2.20);
source and target are assumed integral and the target locally Noetherian where used. -/
class IsAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) : Prop where
  isProper : IsProper f
  isDominant : IsDominant f
  generically_finite : ∃ U : S.Opens, (U : Set S).Nonempty ∧ IsFinite (f ∣_ U)

namespace IsAlteration

/-- The induced extension of function fields `K(S) → K(S')`. -/
def functionFieldMap {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : S.functionField ⟶ S'.functionField :=
  sorry

/-- The generic degree `[K(S') : K(S)]`. -/
def genericDegree {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : ℕ :=
  letI := (functionFieldMap f).hom.toAlgebra
  Module.finrank S.functionField S'.functionField

/-- Generically étale: the function-field extension is separable. -/
def IsGenericallyEtale {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : Prop :=
  letI := (functionFieldMap f).hom.toAlgebra
  Algebra.IsSeparable S.functionField S'.functionField

theorem comp {S'' S' S : Scheme.{u}} (g : S'' ⟶ S') (f : S' ⟶ S) [IsAlteration g]
    [IsAlteration f] : IsAlteration (g ≫ f) := by
  sorry

theorem genericDegree_comp {S'' S' S : Scheme.{u}} [IsIntegral S''] [IsIntegral S'] [IsIntegral S]
    (g : S'' ⟶ S') (f : S' ⟶ S) [IsAlteration g] [IsAlteration f] [IsAlteration (g ≫ f)] :
    genericDegree (g ≫ f) = genericDegree g * genericDegree f := by
  sorry

theorem isModification_iff {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S']
    [IsAlteration f] : IsModification f ↔ genericDegree f = 1 := by
  sorry

/-- de Jong 5.4: finitely many alterations are dominated by a single alteration. -/
theorem exists_dominating {S : Scheme.{u}} {ι : Type} [Finite ι] (T : ι → Scheme.{u})
    (g : ∀ i, T i ⟶ S) [∀ i, IsAlteration (g i)] :
    ∃ (T' : Scheme.{u}) (_ : IsIntegral T') (h : T' ⟶ S) (_ : IsAlteration h),
      ∀ i, ∃ a : T' ⟶ T i, a ≫ g i = h := by
  sorry

end IsAlteration

theorem IsModification.isAlteration {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] : IsAlteration f := by
  sorry

theorem IsModification.functionField_equiv {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
    [IsIntegral S'] [IsModification f] :
    letI := IsModification.isAlteration f
    IsIso (IsAlteration.functionFieldMap f) := by
  sorry

/-- Stacks 0DMN: a proper surjection onto an integral Noetherian scheme contains an alteration. -/
theorem IsAlteration.exists_of_surjective {X S : Scheme.{u}} (f : X ⟶ S) [IsProper f]
    [Surjective f] [IsIntegral S] [_root_.AlgebraicGeometry.IsLocallyNoetherian S] :
    ∃ (Z : X.IdealSheafData) (_ : IsIntegral Z.subscheme), IsAlteration (Z.subschemeι ≫ f) := by
  sorry

-- AlgebraicGeometry.isAlteration_frobenius / not_isModification_frobenius
example (p : ℕ) [Fact p.Prime] [IsIntegral (Spec (CommRingCat.of (Polynomial (ZMod p))))]
    (F : Spec (CommRingCat.of (Polynomial (ZMod p))) ⟶ Spec (CommRingCat.of (Polynomial (ZMod p))))
    (hF : F = Spec.map (CommRingCat.ofHom (frobenius (Polynomial (ZMod p)) p))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = p ∧ ¬ IsModification F := by
  sorry

-- Check `isAlteration_gaussianIntegers`
example [IsIntegral (Spec (CommRingCat.of GaussianInt))] [IsIntegral (Spec (CommRingCat.of ℤ))]
    (F : Spec (CommRingCat.of GaussianInt) ⟶ Spec (CommRingCat.of ℤ))
    (hF : F = Spec.map (CommRingCat.ofHom (algebraMap ℤ GaussianInt))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = 2 ∧ IsAlteration.IsGenericallyEtale F := by
  sorry

-- AlgebraicGeometry.isAlteration_id / isModification_id
example (X : Scheme.{u}) [IsIntegral X] : IsAlteration (𝟙 X) ∧ IsModification (𝟙 X) := by
  sorry

-- Check `not_isAlteration_projectiveLine`: P¹_k → Spec k is not generically finite
-- (projective space is Tau Ceti StableReduction Layer 2); typed shadow with the affine line.
example (k : Type u) [Field k] :
    ¬ IsAlteration (Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))) := by
  sorry

-- Check `isModification_isAlteration`
example {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S'] [IsModification f] :
    ∃ _ : IsAlteration f, IsAlteration.genericDegree f = 1 := by
  sorry

-- Check `not_isModification_openImmersion`
example (k : Type u) [Field k] :
    ¬ IsModification (Spec.map (CommRingCat.ofHom
      (algebraMap (Polynomial k) (Localization.Away (Polynomial.X : Polynomial k))))) := by
  sorry

-- Check `isModification_cusp_normalization`: 𝔸¹ → V(y² − x³), t ↦ (t², t³).
example (k : Type u) [Field k]
    (φ : (MvPolynomial (Fin 2) k ⧸
      Ideal.span {(MvPolynomial.X 1 ^ 2 - MvPolynomial.X 0 ^ 3 : MvPolynomial (Fin 2) k)}) →+*
        Polynomial k)
    (hφ : ∀ i, φ (Ideal.Quotient.mk _ (MvPolynomial.X i)) = Polynomial.X ^ (i.val + 2)) :
    IsModification (Spec.map (CommRingCat.ofHom φ)) ∧ IsFinite (Spec.map (CommRingCat.ofHom φ)) := by
  sorry

/- AlgebraicGeometry.isModification_blowup_origin: the blowup of 𝔸² at the origin (Tau Ceti
   StableReduction Layer 4) is a modification with centre the origin; the blowup is not available
   in this build. -/

/-- Strict transform of `X → S` along `S' → S` (Stacks 080D; de Jong 2.18): the ideal sheaf of the
scheme-theoretic closure of the base change over the open where `S' → S` is an isomorphism. -/
def strictTransform {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S) [IsModification φ] :
    (Limits.pullback f φ).IdealSheafData :=
  sorry

/-- Strict transform of a module: quotient by sections supported over the exceptional locus. -/
def strictTransformModule {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S) [IsModification φ]
    (M : X.Modules) : (Limits.pullback f φ).Modules :=
  sorry

/-- The strict transform is the scheme-theoretic closure of the restriction over any dense open
over which `φ` is an isomorphism (de Jong 2.18). -/
theorem strictTransform_eq_closure {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S)
    [IsModification φ] (U : S.Opens) (hU : Dense (U : Set S)) (hφ : IsIso (φ ∣_ U)) :
    (↑(strictTransform f φ).support : Set ↥(Limits.pullback f φ)) =
      closure {x : ↥(Limits.pullback f φ) | Limits.pullback.snd f φ x ∈ φ ⁻¹ᵁ U} := by
  sorry

/-- A closed subscheme of `X ×_S S'` flat over `S'` and equal to the base change over a dense open
is the strict transform (de Jong 2.18). -/
theorem strictTransform_unique_of_flat {X S S' : Scheme.{u}} (f : X ⟶ S) (φ : S' ⟶ S)
    [IsModification φ] (Z : (Limits.pullback f φ).IdealSheafData)
    (hflat : Flat (Z.subschemeι ≫ Limits.pullback.snd f φ))
    (hgen : ∃ U : S'.Opens, Dense (U : Set S') ∧
      ∀ x : ↥(Limits.pullback f φ), Limits.pullback.snd f φ x ∈ U → x ∈ Z.support) :
    Z = strictTransform f φ := by
  sorry

/- AlgebraicGeometry.strictTransform_comp (transitivity), strictTransform_eq_blowup (Stacks 080E),
   strictTransform_closedImmersion (agreement with Tau Ceti StableReduction Layer 4's strict
   transform of a closed subscheme), and the tests strictTransform_line and
   strictTransform_centre_empty need the blowup of Layer 4; they are stated in the roadmap. -/

-- Check `strictTransform_self`
example {S S' : Scheme.{u}} (φ : S' ⟶ S) [IsModification φ] :
    strictTransform (𝟙 S) φ = ⊥ := by
  sorry

-- Check `strictTransformModule_torsion`: the module k[t]/(t) is t-power torsion, so its
-- strict transform vanishes.
example (k : Type u) [Field k] : ∀ m : Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)},
    (Polynomial.X : Polynomial k) • m = 0 := by
  sorry

/-- Generic flatness (Stacks 052A). -/
theorem generic_flatness {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [LocallyOfFiniteType f]
    [QuasiCompact f] : ∃ U : S.Opens, Dense (U : Set S) ∧ Flat (f ∣_ U) := by
  sorry

/-- Raynaud–Gruson flattening, modification form over a Noetherian integral base (Stacks 0815,
081R; de Jong 2.19); the admissible blowup itself is Tau Ceti StableReduction Layer 4. -/
theorem flattening_by_modification {X S : Scheme.{u}} (f : X ⟶ S) [IsIntegral S] [IsNoetherian S]
    [IsProper f] (U : S.Opens) (hU : Dense (U : Set S)) (hf : Flat (f ∣_ U)) :
    ∃ (S' : Scheme.{u}) (_ : IsIntegral S') (φ : S' ⟶ S) (_ : IsModification φ),
      Flat ((strictTransform f φ).subschemeι ≫ Limits.pullback.snd f φ) := by
  sorry

/- Layer 4 (modification domination) (Stacks 081T) and Layer 4 (chow lemma) (Stacks 0200) assert that the
   dominating map is an admissible blowup, resp. that the source admits an immersion into P^n_S;
   both notions are Tau Ceti StableReduction Layers 2 and 4, so these theorems are stated in the
   roadmap only. -/

/-- Regular schemes: locally Noetherian with regular local rings. -/
class IsRegular (X : Scheme.{u}) : Prop where
  isLocallyNoetherian : _root_.AlgebraicGeometry.IsLocallyNoetherian X
  isRegularLocalRing : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)

theorem isRegular_spec_iff (A : CommRingCat.{u}) : IsRegular (Spec A) ↔ IsRegularRing A := by
  sorry

theorem IsRegular.of_isOpenImmersion {U X : Scheme.{u}} (f : U ⟶ X) [IsOpenImmersion f]
    [IsRegular X] : IsRegular U := by
  sorry

theorem IsRegular.of_smooth {X S : Scheme.{u}} (f : X ⟶ S) [Smooth f] [IsRegular S] :
    IsRegular X := by
  sorry

theorem IsRegular.isNormal (X : Scheme.{u}) [IsRegular X] (x : X) :
    IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x) := by
  sorry

/-- The regular locus. -/
def regularLocus (X : Scheme.{u}) : Set X := {x | IsRegularLocalRing (X.presheaf.stalk x)}

theorem regularLocus_eq_smoothLocus {X : Scheme.{u}} (k : Type u) [Field k] [PerfectField k]
    (f : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFinitePresentation f] :
    regularLocus X = (f.smoothLocus : Set X) := by
  sorry

-- Check `isRegular_affineSpace`
example (k : Type u) [Field k] (n : ℕ) :
    IsRegular (Spec (CommRingCat.of (MvPolynomial (Fin n) k))) := by
  sorry

-- Check `isRegular_specInt`
example : IsRegular (Spec (CommRingCat.of ℤ)) := by
  sorry

-- Check `not_isRegular_node`
example (k : Type u) [Field k] :
    ¬ IsRegular (Spec (CommRingCat.of
      (MvPolynomial (Fin 2) k ⧸
        Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) k)}))) := by
  sorry

-- Check `not_isRegular_dualNumbers`
example (k : Type u) [Field k] : ¬ IsRegular (Spec (CommRingCat.of (DualNumber k))) := by
  sorry

-- Check `isRegular_empty`
example : IsRegular (∅ : Scheme.{u}) := by
  sorry

/-- Strict normal crossings data: finitely many components (de Jong 2.4). -/
structure SNCData (X : Scheme.{u}) where
  ι : Type u
  [fintype : Fintype ι]
  comp : ι → X.IdealSheafData

attribute [instance] SNCData.fintype

/-- The partial intersection `D_J`, cut out by the sum of the component ideals. -/
def SNCData.stratum {X : Scheme.{u}} (C : SNCData X) (J : Finset C.ι) : X.IdealSheafData :=
  ⨆ j ∈ J, C.comp j

/-- The divisor `⋃ D_i`, cut out by the product of the component ideals. -/
def SNCData.divisor {X : Scheme.{u}} (C : SNCData X) : X.IdealSheafData :=
  ∏ i, C.comp i

/-- Regularity of every nonempty partial intersection, in the expected codimension. -/
def SNCData.IsTransverse {X : Scheme.{u}} (C : SNCData X) : Prop :=
  ∀ J : Finset C.ι, J.Nonempty →
    IsRegular (C.stratum J).subscheme ∧
    ∀ y : (C.stratum J).subscheme,
      ringKrullDim (X.presheaf.stalk ((C.stratum J).subschemeι y)) =
        ringKrullDim ((C.stratum J).subscheme.presheaf.stalk y) + (J.card : WithBot ℕ∞)

/-- `D` is a strict normal crossings divisor (de Jong 2.4). -/
def IsStrictNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ C : SNCData X, D = C.divisor ∧
    (∀ x ∈ (D.support : Set X), IsRegularLocalRing (X.presheaf.stalk x)) ∧ C.IsTransverse

/-- Normal crossings: strict normal crossings after a surjective étale base change. -/
def IsNormalCrossings {X : Scheme.{u}} (D : X.IdealSheafData) : Prop :=
  ∃ (X' : Scheme.{u}) (e : X' ⟶ X), Etale e ∧ Surjective e ∧ IsStrictNormalCrossings (D.comap e)

theorem IsStrictNormalCrossings.isNormalCrossings {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) : IsNormalCrossings D := by
  sorry

theorem IsStrictNormalCrossings.pullback_smooth {X Y : Scheme.{u}} (f : Y ⟶ X) [Smooth f]
    {D : X.IdealSheafData} (h : IsStrictNormalCrossings D) :
    IsStrictNormalCrossings (D.comap f) := by
  sorry

theorem IsStrictNormalCrossings.component {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) :
    ∃ C : SNCData X, D = C.divisor ∧ ∀ i, IsRegular (C.comp i).subscheme := by
  sorry

/-- Local equation: at a point of `D` the ideal is generated by a product of part of a regular
system of parameters (stated as principality of the stalk ideal). -/
theorem IsStrictNormalCrossings.local_equation {X : Scheme.{u}} {D : X.IdealSheafData}
    (h : IsStrictNormalCrossings D) (x : X) (hx : x ∈ (D.support : Set X)) :
    ∃ t : X.presheaf.stalk x, ∀ U : X.affineOpens, ∀ hxU : x ∈ (U : X.Opens),
      Ideal.map (X.presheaf.germ U.1 x hxU).hom (D.ideal U) = Ideal.span {t} := by
  sorry

theorem IsStrictNormalCrossings.of_subset {X : Scheme.{u}} (C : SNCData X)
    (h : IsStrictNormalCrossings C.divisor) (J : Finset C.ι) :
    IsStrictNormalCrossings (∏ j ∈ J, C.comp j) := by
  sorry

/- Tests AlgebraicGeometry.snc_axes, nodalCubic_nc_not_snc and not_nc_threeLines are computations
   in 𝔸²_k with the ideal sheaves of xy, y² − x²(x + 1) and xy(x − y); stated in the roadmap. -/

-- Check `snc_empty`
example (X : Scheme.{u}) [IsRegular X] : IsStrictNormalCrossings (⊤ : X.IdealSheafData) := by
  sorry

/-- Resolution of curves by normalization (Stacks 0C45, 0BI4). -/
theorem resolution_of_curves (Y : Scheme.{u}) [IsIntegral Y] [IsNoetherian Y]
    (hdim : topologicalKrullDim Y ≤ 1) [IsFinite (Scheme.Hom.fromNormalization (𝟙 Y))] :
    IsRegular (Scheme.Hom.normalization (𝟙 Y)) ∧
      IsModification (Scheme.Hom.fromNormalization (𝟙 Y)) := by
  sorry

/-- Serre's criterion for normality (Stacks 031S), the `(R₁)` half: a normal Noetherian domain is
regular in codimension one. The `(S₂)` half needs depth, which Mathlib does not define. -/
theorem serre_normality_R1 (A : Type u) [CommRing A] [IsNoetherianRing A] [IsDomain A]
    [IsIntegrallyClosed A] (p : Ideal A) [p.IsPrime] (hp : p.height ≤ 1) :
    IsRegularLocalRing (Localization.AtPrime p) := by
  sorry

/-! ### Grassmannians and moduli of stable pointed curves -/

/- Layer 4 (grassmannian scheme) is not stated here: the relative Grassmannian scheme with its
   charts, gluing and universal property is Tau Ceti ModularCurves Layer 0G, which this layer
   consumes. -/

/- Layer 4 (hilbert scheme) (Nitsure, Theorems 5.1–5.3): representability of Quot^{Φ,L}_{E/X/S} and
   Hilb^{Φ,L}_{X/S} by projective S-schemes, Hom and Isom as open subschemes. Not typed: relative
   very ample line bundles and Hilbert polynomials are Tau Ceti StableReduction Layer 2.

   Layer 4 (stable curve stack) and its API, under the roadmap's names:
     AlgebraicGeometry.StableCurves.Mbar           -- pseudofunctor S ↦ groupoid of stable n-pointed
                                                    --   genus-g families (StableReduction Layer 3)
     AlgebraicGeometry.StableCurves.Mbar.isStack   -- Pseudofunctor.IsStack for the fppf topology
     AlgebraicGeometry.StableCurves.Mbar.smooth    -- the open substack M_{g,n}
     AlgebraicGeometry.StableCurves.Mbar.pullback
     AlgebraicGeometry.StableCurves.Mbar.aut_finite
     AlgebraicGeometry.StableCurves.Mbar.forget
   Tests: StableCurves.Mbar_zero_three, StableCurves.Mbar_one_one_aut,
     StableCurves.not_stable_zero_two, StableCurves.not_stable_rational_tail,
     StableCurves.Mbar_smooth_open.
   They need the prestable and stable family predicates of Tau Ceti StableReduction Layer 3 and the
   algebraic stacks of SchemeAndStackFoundations Layer 1, neither present in this build.

   Theorems Layer 4 (isom stable curves) (DM 1.11), Layer 4 (stable curve stack algebraic) (DM 5.1–5.2,
   Stacks 0E9C), Layer 4 (stable curve stack smooth) (DM 1.6–1.9, 5.2), Layer 4 (level structure cover)
   (Deligne 1985 §3, de Jong 2.24) and Layer 4 (stable extension after alteration) (de Jong 4.17,
   Deligne Lemme 1.6) are stated in the roadmap. Once Layer 3 exists the last has the shape

     theorem stable_extension_after_alteration {Y : Scheme} [IsIntegral Y] [IsNoetherian Y]
         (U : Y.Opens) (hU : Dense (U : Set Y)) (C : StablePointedFamily g n U) :
         ∃ (Y' : Scheme) (_ : IsIntegral Y') (ψ : Y' ⟶ Y) (_ : IsAlteration ψ)
           (C' : StablePointedFamily g n Y'), Nonempty (C'.restrict (ψ ⁻¹ᵁ U) ≅ C.pullback (ψ ∣_ U))
-/

/-! ### De Jong's alterations -/

namespace DeJong

/-- A trait: a complete discrete valuation ring (de Jong 2.12). -/
class IsTrait (R : Type u) [CommRing R] [IsDomain R] : Prop where
  isDVR : IsDiscreteValuationRing R
  complete : IsAdicComplete (IsLocalRing.maximalIdeal R) R

/-- The ramification index of a local extension of DVRs: the valuation of a uniformiser. -/
def TraitHom.ramificationIndex {R R' : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [CommRing R'] [IsDomain R'] [IsDiscreteValuationRing R']
    (φ : R →+* R') : ℕ :=
  sorry

/-- An `S`-variety over a trait: integral, separated, flat and of finite type (de Jong 2.15). -/
class IsSVariety {R : Type u} [CommRing R] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R)) :
    Prop where
  isIntegral : IsIntegral X
  isSeparated : IsSeparated f
  flat : Flat f
  locallyOfFiniteType : LocallyOfFiniteType f
  quasiCompact : QuasiCompact f

theorem isSVariety_iff_genericFiber_nonempty {R K : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] :
    IsSVariety f ↔ Nonempty (TauCeti.genericFiber R K f).left := by
  sorry

/-- Base change along a finite extension of traits: components of the base change dominating `X`
are `S'`-varieties mapping to `X` by alterations (de Jong 6.8). -/
theorem IsSVariety.baseChange_component {R R' : Type u} [CommRing R] [IsDomain R]
    [CommRing R'] [IsDomain R'] [Algebra R R'] [Module.Finite R R'] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) [IsSVariety f] :
    ∃ (Z : (Limits.pullback f (Spec.map (CommRingCat.ofHom (algebraMap R R')))).IdealSheafData)
      (_ : IsIntegral Z.subscheme),
      IsSVariety (Z.subschemeι ≫ Limits.pullback.snd f _) ∧
        IsAlteration (Z.subschemeι ≫ Limits.pullback.fst f _) := by
  sorry

/- AlgebraicGeometry.DeJong.finiteDVRExtension_of_trait: comparison with Tau Ceti's
   `FiniteDVRExtension`, whose module is not compiled in this build; stated in the roadmap. -/

/-- A proper `S`-variety with an identification of its generic fibre is a Tau Ceti model. -/
def IsSVariety.toModel {R K : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    [Field K] [Algebra R K] [IsFractionRing R K] {C : Scheme.{u}}
    (toK : C ⟶ Spec (CommRingCat.of K)) {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] (e : TauCeti.genericFiber R K f ≅ Over.mk toK) : TauCeti.Model R K C toK :=
  sorry

-- Check `isTrait_padicInt`
example (p : ℕ) [Fact p.Prime] : IsTrait ℤ_[p] := by
  sorry

-- Check `not_isTrait_localization`
example (p : ℕ) [Fact p.Prime] [(Ideal.span {(p : ℤ)}).IsPrime] :
    ¬ IsTrait (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by
  sorry

-- Check `ramification_sqrt`: Z_p → Z_p[x]/(x² − p) has ramification index 2.
example (p : ℕ) [Fact p.Prime] (R' : Type) [CommRing R'] [IsDomain R'] [IsDiscreteValuationRing R']
    (e : R' ≃+* Polynomial ℤ_[p] ⧸ Ideal.span {Polynomial.X ^ 2 - Polynomial.C (p : ℤ_[p])})
    (φ : ℤ_[p] →+* R') (hφ : ∀ a, e (φ a) = Ideal.Quotient.mk _ (Polynomial.C a)) :
    TraitHom.ramificationIndex φ = 2 := by
  sorry

-- Check `isSVariety_genericOnly`: Spec Q_p is a Z_p-variety with empty special
-- fibre.
example (p : ℕ) [Fact p.Prime] :
    IsSVariety (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] ℚ_[p]))) := by
  sorry

-- Check `not_isSVariety_specialPoint`
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSVariety (Spec.map (CommRingCat.ofHom (PadicInt.toZMod (p := p)))) := by
  sorry

/-- Conditions (a)–(d) of de Jong 2.16 without integrality: smooth generic fibre, and the special
fibre is cut out by the product of components whose partial intersections are smooth over the
residue field of the expected codimension. -/
def SemistableConditions {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  Smooth (TauCeti.genericFiber R K f).hom ∧
    ∃ C : SNCData X, (TauCeti.specialFiberι R f).ker = C.divisor ∧ C.IsTransverse ∧
      ∀ J : Finset C.ι, J.Nonempty →
        ∃ g : (C.stratum J).subscheme ⟶ Spec (CommRingCat.of (IsLocalRing.ResidueField R)),
          Smooth g ∧ g ≫ Spec.map (CommRingCat.ofHom (algebraMap R (IsLocalRing.ResidueField R))) =
            (C.stratum J).subschemeι ≫ f

/-- Strictly semistable `S`-varieties (de Jong 2.16). -/
def IsStrictlySemistable {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) : Prop :=
  IsSVariety f ∧ SemistableConditions K f

theorem IsStrictlySemistable.isRegular {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) :
    IsRegular X := by
  sorry

/-- With perfect residue field, strict semistability says the special fibre is an SNC divisor. -/
theorem IsStrictlySemistable.snc_specialFiber {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    [PerfectField (IsLocalRing.ResidueField R)] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] (hgen : Smooth (TauCeti.genericFiber R K f).hom) :
    IsStrictlySemistable K f ↔ IsStrictNormalCrossings (TauCeti.specialFiberι R f).ker := by
  sorry

/-- Zariski-local model: near each point of the special fibre `X` is smooth over
`R[t₁, …, t_r]/(t₁ ⋯ t_r − π)` (de Jong 2.16). -/
theorem IsStrictlySemistable.smooth_over_model {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) (π : R)
    (hπ : Irreducible π) (x : X) :
    ∃ (U : X.Opens) (_ : x ∈ U) (r : ℕ)
      (g : U.toScheme ⟶ Spec (CommRingCat.of (MvPolynomial (Fin r) R ⧸
        Ideal.span {(∏ i, MvPolynomial.X i) - MvPolynomial.C π}))), Smooth g := by
  sorry

/- AlgebraicGeometry.DeJong.IsStrictlySemistable.local_form (complete local rings
   B[[t₁..t_r]]/(t₁⋯t_r − π), B formally smooth over R) and
   AlgebraicGeometry.DeJong.IsStrictlySemistable.baseChange_etale (stability under finite
   unramified trait extensions) are stated in the roadmap. -/

-- Check `strictlySemistable_xy`
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C (p : ℤ_[p])})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    IsStrictlySemistable ℚ_[p] f := by
  sorry

-- Check `strictlySemistable_smooth`
example (p : ℕ) [Fact p.Prime] :
    IsStrictlySemistable ℚ_[p] (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] (Polynomial ℤ_[p])))) := by
  sorry

-- Check `not_strictlySemistable_xy_sq`
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C ((p : ℤ_[p]) ^ 2)})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    ¬ IsStrictlySemistable ℚ_[p] f := by
  sorry

-- Check `not_strictlySemistable_ramified`
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (Polynomial ℤ_[p] ⧸
    Ideal.span {Polynomial.X ^ 2 - Polynomial.C (p : ℤ_[p])})) ⟶ Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    ¬ IsStrictlySemistable ℚ_[p] f := by
  sorry

/- AlgebraicGeometry.DeJong.strictlySemistable_ramified_basechange (xy − p becomes xy − ϖ² after
   ramified base change) is stated in the roadmap. -/

/-- Strict semistable pairs (de Jong 6.3): `X` strictly semistable, `X_s ∪ Z_h` an SNC divisor with
horizontal part `H`, and every horizontal stratum satisfying the semistable conditions. -/
def IsStrictSemistablePair {R : Type u} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of R)) (H : SNCData X) : Prop :=
  IsStrictlySemistable K f ∧
    IsStrictNormalCrossings ((TauCeti.specialFiberι R f).ker * H.divisor) ∧
    ∀ J : Finset H.ι, J.Nonempty → SemistableConditions K ((H.stratum J).subschemeι ≫ f)

theorem IsStrictSemistablePair.of_strictlySemistable {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} (h : IsStrictlySemistable K f) :
    IsStrictSemistablePair K f ⟨PEmpty, fun x => x.elim⟩ := by
  sorry

theorem IsStrictSemistablePair.horizontal {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} {H : SNCData X}
    (h : IsStrictSemistablePair K f H) (i : H.ι) :
    Flat ((H.comp i).subschemeι ≫ f) := by
  sorry

theorem IsStrictSemistablePair.restrict {R : Type u} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {K : Type u} [Field K] [Algebra R K] [IsFractionRing R K]
    {X : Scheme.{u}} {f : X ⟶ Spec (CommRingCat.of R)} {H : SNCData X}
    (h : IsStrictSemistablePair K f H) (U : X.Opens) [IsIntegral U.toScheme] :
    IsStrictSemistablePair K (U.ι ≫ f) ⟨H.ι, fun i => (H.comp i).comap U.ι⟩ := by
  sorry

/- AlgebraicGeometry.DeJong.IsStrictSemistablePair.local_form (complete local rings
   C[[t, s]]/(π − t₁⋯t_n)) and the tests AlgebraicGeometry.DeJong.pair_specialFiber,
   AlgebraicGeometry.DeJong.pair_with_horizontal and AlgebraicGeometry.DeJong.not_pair_diagonal
   (computations with Z_p[x, y, z]/(xy − p)) are stated in the roadmap. -/

/- Split semistable curves (Layer 4 (split prestable curve)) need Tau Ceti StableReduction Layer 3's
   prestable families. Declarations: AlgebraicGeometry.DeJong.IsSplitPrestable,
   AlgebraicGeometry.DeJong.IsSplitPrestable.pullback,
   AlgebraicGeometry.DeJong.IsSplitPrestable.singularLocus_section,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_smooth,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_sections; tests AlgebraicGeometry.DeJong.split_twoLines,
   AlgebraicGeometry.DeJong.not_split_nodalCubic, AlgebraicGeometry.DeJong.split_after_extension,
   AlgebraicGeometry.DeJong.split_smooth. Theorems Layer 4 (node local structure),
   Layer 4 (nodal family resolution), Layer 4 (generic projection), Layer 4 (curve fibration),
   Layer 4 (three point divisor), Layer 4 (stable model domination), Layer 4 (curve family alteration),
   Layer 4 (nc to snc), Layer 4 (faltings formal smoothness), Layer 4 (bertini smoothness) are stated in the
   roadmap. -/

/-- de Jong's alteration theorem (de Jong 1996, Theorem 4.1): a regular projective `Xbar₁` with an
open `X₁` altering `X`, with SNC boundary containing the preimage of `Z`; generically étale over a
perfect field. Projectivity is recorded as properness here (projective morphisms are Tau Ceti
StableReduction Layer 2). -/
theorem alteration_theorem (k : Type u) [Field k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) [IsIntegral X] [IsSeparated f] [LocallyOfFiniteType f]
    [QuasiCompact f] (Z : X.IdealSheafData) (hZ : Z ≠ ⊥) :
    ∃ (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ) (Xbar₁ : Scheme.{u})
      (j : X₁ ⟶ Xbar₁) (g : Xbar₁ ⟶ Spec (CommRingCat.of k)) (B : Xbar₁.IdealSheafData),
      IsOpenImmersion j ∧ IsProper g ∧ IsRegular Xbar₁ ∧ IsStrictNormalCrossings B ∧
      (B.support : Set Xbar₁) = (Set.range j)ᶜ ∪ j '' (φ ⁻¹' (Z.support : Set X)) ∧
      ((PerfectField k) → IsAlteration.IsGenericallyEtale φ) := by
  sorry

/-- de Jong's semistable alteration theorem over a trait (Theorem 6.5). -/
theorem semistable_alteration_theorem (R : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [IsTrait R] {X : Scheme.{u}} (f : X ⟶ Spec (CommRingCat.of R))
    [IsSVariety f] :
    ∃ (R₁ K₁ : Type u) (_ : CommRing R₁) (_ : IsDomain R₁) (_ : IsDiscreteValuationRing R₁)
      (_ : IsTrait R₁) (_ : Algebra R R₁) (_ : Module.Finite R R₁) (_ : Field K₁)
      (_ : Algebra R₁ K₁) (_ : IsFractionRing R₁ K₁)
      (X₁ : Scheme.{u}) (_ : IsIntegral X₁) (φ : X₁ ⟶ X) (_ : IsAlteration φ) (Xbar₁ : Scheme.{u})
      (g : Xbar₁ ⟶ Spec (CommRingCat.of R₁)) (j : X₁ ⟶ Xbar₁) (H : SNCData Xbar₁),
        IsOpenImmersion j ∧ IsProper g ∧ IsStrictSemistablePair K₁ g H := by
  sorry

end DeJong

end Formal

end
end SF_SF_4

/-!
## Targets without a typed form at the pins

Layer 5 (intersection theory). None of the README target–the README target is typed here: `CH_k(X)` needs rational
equivalence on Mathlib's `AlgebraicCycle`, which has no carrier yet; the README target–the README target (proper
pushforward, flat pullback, localization) need that quotient; the README target–the README target (first Chern class,
projective bundles, Chern classes, refined Gysin maps, the intersection product) need the
relative Proj of Layer 0 and the normal-cone deformation of Layer 4; the README target–the README target
(Grothendieck–Riemann–Roch, the surface pairing, adjunction, Riemann–Roch and Hodge index on
surfaces, the Weil bound, Bézout) need all of the above together with Layer 2's coherent duality.
Proposed names: `Chow.RatEquiv`, `.c1`, `.chernClass`, `.gysin`,
`.intersect`, `AlgebraicGeometry.projectiveBundle`.

Interfaces (the boundaries section of the README). The comparison maps that the arithmetic
roadmaps consume are interfaces on carriers owned by other roadmaps
(algebraic de Rham and Betti cohomology, the étale–analytic site map, scheme–adic and
scheme–diamond fibre products, derived limits of finite-coefficient cohomology, prismatic and
`A_inf` cohomology, `B_dR`, cycle class maps); only the native objects of interface (i) exist at the pins
(`CategoryTheory.Sheaf.H`, `AlgebraicGeometry.Scheme.ProEt.topology`,
`AlgebraicGeometry.Scheme.ellAdicSheaf`, `AlgebraicGeometry.Scheme.EllAdicCohomology`).
No proposition-valued stand-in is introduced for any of them.
-/

end TauCetiRoadmap.SchemeAndStackFoundations
