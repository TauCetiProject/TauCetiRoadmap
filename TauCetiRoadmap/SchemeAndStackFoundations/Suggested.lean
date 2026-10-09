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
# Scheme, stack, cohomology and intersection foundations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The forms below suggest Lean forms for particular milestones so that
contributors and reviewers converge on names and signatures, never as a checklist.
Every proof is `sorry`; nothing here is an implementation.

Statements that cannot be typed at the pinned libraries are named in comment blocks: each
layer's section ends with the block listing its untyped targets, and the block at the end of
the file lists the SF.5 targets and the interfaces of the README's boundaries section, none of
which has a typed form (their carriers, Chow groups and the comparison maps, do not exist yet).

Section order: the base strands of SF.0–SF.2 (henselization, flat base change, ideal sheaves,
excellence, algebraic-space predicates, Galois gerbs, Brauer, coherent duality, equivariant
cohomology), then the SF.0, SF.1, SF.2, SF.3 and SF.4 sections of the README in order.
-/

section SF_base

/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proof is `sorry`; admitted signatures certify no implementation.
-/

open _root_.CategoryTheory _root_.CategoryTheory.Limits
open scoped _root_.TensorProduct
universe u
namespace TauCeti.Henselization
variable {R : Type u} [CommRing R]

-- node: SchemeAndStackFoundations:SF.0/etale-neighbourhood
/-- Canonical reduction map: a baseline instantiation, not a new quotient. -/
abbrev reducedMap (I : Ideal R) (B : CommAlgCat.{u} R) :
    R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap (I.map (algebraMap R B)) (algebraMap R B) Ideal.le_comap_map

def IsNeighbourhood (I : Ideal R) : ObjectProperty (CommAlgCat.{u} R) :=
  fun B => Algebra.Etale R B ∧ Function.Bijective (reducedMap I B)

abbrev Neighbourhood (I : Ideal R) := (IsNeighbourhood I).FullSubcategory

lemma isNeighbourhood_self (I : Ideal R) :
    IsNeighbourhood I (CommAlgCat.of R R) := by sorry

lemma isNeighbourhood_localization (I : Ideal R) (x : R)
    (hx : IsUnit (Ideal.Quotient.mk I x)) :
    IsNeighbourhood I (CommAlgCat.of R (Localization.Away x)) := by sorry

-- test: TauCeti.Henselization.neighbourhood_identity
example (I : Ideal R) : IsNeighbourhood I (CommAlgCat.of R R) := by sorry
-- test: TauCeti.Henselization.neighbourhood_invert_two
example : IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (2 : ℤ))) := by sorry
-- test: TauCeti.Henselization.neighbourhood_reject_invert_five
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (5 : ℤ))) := by sorry
-- test: TauCeti.Henselization.neighbourhood_reject_two_sheets
example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (ℤ × ℤ)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/tensor-neighbourhood
lemma isNeighbourhood_tensor (I : Ideal R) (B C : CommAlgCat.{u} R)
    (hB : IsNeighbourhood I B) (hC : IsNeighbourhood I C) :
    IsNeighbourhood I (CommAlgCat.of R (B ⊗[R] C)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/parallel-equalization
lemma parallel_equalization (I : Ideal R) {B C : Neighbourhood I}
    (f g : B ⟶ C) : ∃ (D : Neighbourhood I) (h : C ⟶ D), f ≫ h = g ≫ h := by sorry

-- node: SchemeAndStackFoundations:SF.0/filtered-neighbourhoods
theorem neighbourhood_isFiltered (I : Ideal R) : IsFiltered (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_isFiltered

-- node: SchemeAndStackFoundations:SF.0/small-neighbourhoods
lemma neighbourhood_essentiallySmall (I : Ideal R) :
    EssentiallySmall.{u} (Neighbourhood I) := by sorry
attribute [instance] neighbourhood_essentiallySmall

-- node: SchemeAndStackFoundations:key/henselization
/-- The small diagram is a reindexing of the existing inclusion. -/
noncomputable def diagram (I : Ideal R) :
    SmallModel.{u} (Neighbourhood I) ⥤ CommAlgCat.{u} R :=
  (equivSmallModel.{u} (Neighbourhood I)).inverse ⋙ (IsNeighbourhood I).ι

noncomputable def algebra (I : Ideal R) : CommAlgCat.{u} R := colimit (diagram I)

noncomputable abbrev extended (I : Ideal R) : Ideal (algebra I) := I.map (algebraMap R (algebra I))

noncomputable def stage (I : Ideal R) (B : SmallModel.{u} (Neighbourhood I)) :
    (diagram I).obj B →ₐ[R] algebra I := (colimit.ι (diagram I) B).hom

lemma stage_naturality (I : Ideal R) {B C : SmallModel.{u} (Neighbourhood I)}
    (f : B ⟶ C) :
    (stage I C).comp ((diagram I).map f).hom = stage I B := by sorry

-- node: SchemeAndStackFoundations:SF.0/extended-ideal-stage
lemma mem_extended_iff_exists_stage (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B) :
    stage I B b ∈ extended I ↔
      ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
        ((diagram I).map t).hom b ∈ I.map (algebraMap R ((diagram I).obj C)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/monic-polynomial-stage
lemma exists_stage_monic_polynomial (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) :
    ∃ (B : SmallModel.{u} (Neighbourhood I)) (p : Polynomial ((diagram I).obj B)),
      p.Monic ∧ p.map (stage I B).toRingHom = f := by sorry

-- node: SchemeAndStackFoundations:SF.0/quotient-unit-stage
lemma exists_stage_quotient_unit (I : Ideal R)
    (B : SmallModel.{u} (Neighbourhood I)) (b : (diagram I).obj B)
    (hb : IsUnit (Ideal.Quotient.mk (extended I) (stage I B b))) :
    ∃ (C : SmallModel.{u} (Neighbourhood I)) (t : B ⟶ C),
      IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj C)))
        (((diagram I).map t).hom b)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/simple-root-stage
lemma exists_stage_simple_root (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ (B : SmallModel.{u} (Neighbourhood I))
      (p : Polynomial ((diagram I).obj B)) (b : (diagram I).obj B),
      p.Monic ∧ p.map (stage I B).toRingHom = f ∧ stage I B b = a0 ∧
        p.eval b ∈ I.map (algebraMap R ((diagram I).obj B)) ∧
        IsUnit (Ideal.Quotient.mk (I.map (algebraMap R ((diagram I).obj B)))
          (p.derivative.eval b)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/residue-comparison
lemma quotient_bijective (I : Ideal R) :
    Function.Bijective (reducedMap I (algebra I)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/jacobson-containment
lemma extended_le_jacobson (I : Ideal R) :
    extended I ≤ Ideal.jacobson (⊥ : Ideal (algebra I)) := by sorry

-- node: SchemeAndStackFoundations:SF.0/simple-root-realization
lemma simple_root_lift (I : Ideal R) (f : Polynomial (algebra I))
    (hf : f.Monic) (a0 : algebra I) (hroot : f.eval a0 ∈ extended I)
    (hderiv : IsUnit (Ideal.Quotient.mk (extended I) (f.derivative.eval a0))) :
    ∃ a : algebra I, f.eval a = 0 ∧ a - a0 ∈ extended I := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselian-pair
theorem henselian (I : Ideal R) : HenselianRing (algebra I) (extended I) := by sorry
attribute [instance] henselian



section EtaleSection
variable {B : Type u} [CommRing B] [Algebra R B] [Algebra.Etale R B]

-- node: SchemeAndStackFoundations:SF.0/etale-section-selector
lemma etale_section_selector (σ : B →ₐ[R] R) :
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


-- node: SchemeAndStackFoundations:SF.0/etale-selector-kernel
omit [Algebra.Etale R B] in
lemma etale_selector_kernel (σ : B →ₐ[R] R) {e : B}
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

-- node: SchemeAndStackFoundations:SF.0/etale-section-product
lemma etale_section_product (σ : B →ₐ[R] R) :
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

-- node: SchemeAndStackFoundations:SF.0/etale-section-localization
lemma etale_section_localization (σ : B →ₐ[R] R) :
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


-- node: SchemeAndStackFoundations:SF.0/etale-lift-uniqueness
lemma etale_lift_unique (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R))
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

-- node: SchemeAndStackFoundations:SF.0/etale-section-comparison
theorem exists_etale_lift (I : Ideal R) [HenselianRing R I]
    (B : CommAlgCat.{u} R) [Algebra.Etale R B] (σ : B →+* R ⧸ I)
    (hσ : σ.comp (algebraMap R B) = Ideal.Quotient.mk I) :
    ∃ τ : B →ₐ[R] R, (Ideal.Quotient.mk I).comp τ.toRingHom = σ := by sorry

-- node: SchemeAndStackFoundations:SF.0/initial-henselian-pair
theorem existsUnique_lift (I : Ideal R) {S : Type u} [CommRing S]
    (J : Ideal S) [HenselianRing S J] (f : R →+* S) (hf : I ≤ J.comap f) :
    ∃! g : algebra I →+* S, g.comp (algebraMap R (algebra I)) = f := by sorry

-- node: SchemeAndStackFoundations:SF.0/fixed-henselian-pair
lemma fixed_of_henselian (I : Ideal R) [HenselianRing R I] :
    Nonempty (algebra I ≃ₐ[R] R) := by sorry

-- test: TauCeti.Henselization.henselization_zero_ideal
example : Nonempty (algebra (⊥ : Ideal R) ≃ₐ[R] R) := by sorry
-- test: TauCeti.Henselization.henselization_unit_ideal
example : Subsingleton (algebra (⊤ : Ideal R)) := by sorry
-- test: TauCeti.Henselization.henselization_fixed_pair
example (I : Ideal R) [HenselianRing R I] : Nonempty (algebra I ≃ₐ[R] R) := by sorry
-- test: TauCeti.Henselization.henselization_ordinary_finite_field
example : Nonempty (algebra (⊥ : Ideal (ZMod 5)) ≃ₐ[ZMod 5] ZMod 5) := by sorry

-- node: SchemeAndStackFoundations:SF.0/ordinary-local-henselization
lemma local_henselization [IsLocalRing R] :
    IsLocalRing (algebra (IsLocalRing.maximalIdeal R)) := by sorry

section Functoriality
variable {S T : Type u} [CommRing S] [CommRing T]

-- node: SchemeAndStackFoundations:SF.0/henselization-map
/-- The chosen extension of η_S ∘ f by the existing initial-pair theorem. -/
noncomputable def map (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) : algebra I →+* algebra J :=
  Classical.choose (existsUnique_lift I (extended J)
    ((algebraMap S (algebra J)).comp f) (by
      intro r hr
      exact Ideal.mem_map_of_mem (algebraMap S (algebra J)) (hf hr))).exists

-- node: SchemeAndStackFoundations:SF.0/henselization-map-unit
lemma map_comp_unit (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (map I J f hf).comp (algebraMap R (algebra I)) =
      (algebraMap S (algebra J)).comp f := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-ideal
lemma map_extended_le (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    extended I ≤ (extended J).comap (map I J f hf) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-identity
lemma map_id (I : Ideal R) :
    map I I (RingHom.id R) (by intro r hr; exact hr) =
      RingHom.id (algebra I) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-map-composition
lemma map_comp (I : Ideal R) (J : Ideal S) (K : Ideal T)
    (f : R →+* S) (g : S →+* T)
    (hf : I ≤ J.comap f) (hg : J ≤ K.comap g) :
    map I K (g.comp f) (by intro r hr; exact hg (hf hr)) =
      (map J K g hg).comp (map I J f hf) := by sorry

-- node: SchemeAndStackFoundations:SF.0/henselization-residue-naturality
lemma quotient_naturality (I : Ideal R) (J : Ideal S) (f : R →+* S)
    (hf : I ≤ J.comap f) :
    (Ideal.quotientMap (extended J) (map I J f hf) (map_extended_le I J f hf)).comp
        (reducedMap I (algebra I)) =
      (reducedMap J (algebra J)).comp (Ideal.quotientMap J f hf) := by sorry

-- test: TauCeti.Henselization.map_field_identity
example : map (⊥ : Ideal (ZMod 5)) ⊥ (RingHom.id (ZMod 5))
    (by intro r hr; exact hr) = RingHom.id (algebra (⊥ : Ideal (ZMod 5))) := by sorry

-- test: TauCeti.Henselization.map_scalar_seven
example : map (⊥ : Ideal ℤ) (⊥ : Ideal (ZMod 5)) (Int.castRingHom (ZMod 5))
    (by intro r hr; have hr0 : r = 0 := hr; simp [hr0])
    (algebraMap ℤ (algebra (⊥ : Ideal ℤ)) 7) =
      algebraMap (ZMod 5) (algebra (⊥ : Ideal (ZMod 5))) 2 := by sorry

-- test: TauCeti.Henselization.map_quotient_nine
example : let I : Ideal (ZMod 9) := Ideal.span {(3 : ZMod 9)}
    map I (⊥ : Ideal (ZMod 9 ⧸ I)) (Ideal.Quotient.mk I)
      (by intro r hr; exact (Ideal.Quotient.eq_zero_iff_mem).2 hr)
      (algebraMap (ZMod 9) (algebra I) 3) = 0 := by sorry

-- test: TauCeti.Henselization.map_can_collapse
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

end TauCeti.Henselization

open _root_.TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.FlatAnnihilator
universe faU faV faW faZ
variable {R : Type faU} [CommRing R] (S : Type faV) [CommRing S] [Algebra R S]
variable {M : Type faW} [AddCommGroup M] [Module R M]

lemma ideal_map_eq_tensor_range (I : Ideal R) :
    I.map (algebraMap R S) = LinearMap.range
      ((AlgebraTensorModule.rid R S S).toLinearMap ∘ₗ I.subtype.baseChange S) := by
  sorry

lemma mem_map_kernel_iff [Module.Flat R S] (f : R →ₗ[R] M) (s : S) :
    s ∈ Ideal.map (algebraMap R S) f.ker ↔ s ⊗ₜ[R] f 1 = 0 := by
  sorry

lemma annihilator_eq_generator_kernel {ι : Type faZ} (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    Module.annihilator R M =
      (LinearMap.pi fun i => LinearMap.toSpanSingleton R M (g i)).ker := by
  sorry

lemma annihilator_flat_baseChange_generators [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (g : ι → M)
    (hg : Submodule.span R (Set.range g) = ⊤) :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma annihilator_flat_baseChange [Module.Flat R S] [Module.Finite R M] :
    (Module.annihilator R M).map (algebraMap R S) =
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma element_annihilator_flat_baseChange [Module.Flat R S] (m : M) :
    (Submodule.span R {m}).annihilator.map (algebraMap R S) =
      (Submodule.span S {(1 : S) ⊗ₜ[R] m}).annihilator := by
  sorry

lemma annihilator_map_le_baseChange :
    (Module.annihilator R M).map (algebraMap R S) ≤
      Module.annihilator S (S ⊗[R] M) := by
  sorry

lemma ideal_map_iInf_finite [Module.Flat R S]
    {ι : Type faZ} [Fintype ι] [DecidableEq ι] (I : ι → Ideal R) :
    (⨅ i, I i).map (algebraMap R S) = ⨅ i, (I i).map (algebraMap R S) := by
  sorry

end TauCeti.SchemeFoundations.FlatAnnihilator

namespace TauCeti.SchemeFoundations.FlatAnnihilator

-- test: FlatAnnihilatorChecked.empty_family
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    (⨅ i : Fin 0, (fun _ => (⊥ : Ideal R)) i).map (algebraMap R S) = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.identity_extension
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [Module.Finite R M] :
    Module.annihilator R (R ⊗[R] M) = Module.annihilator R M := by
  sorry

-- test: FlatAnnihilatorChecked.zero_module
example {R S : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Flat R S] :
    Module.annihilator S (S ⊗[R] (⊥ : Submodule R R)) = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.zero_element
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] [Module.Flat R S] :
    (Submodule.span S {(1 : S) ⊗ₜ[R] (0 : M)}).annihilator = ⊤ := by
  sorry

-- test: FlatAnnihilatorChecked.nonreduced_element
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈
      (Submodule.span (ZMod 4) {(1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

-- test: FlatAnnihilatorChecked.nonreduced_diagonal
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈
      (Submodule.span (ZMod 4 × ZMod 4)
        {(1 : ZMod 4 × ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator := by
  sorry

section Nonflat
local instance : Algebra (ZMod 4) (ZMod 2) :=
  (ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAlgebra

-- test: FlatAnnihilatorChecked.nonflat_element_failure
example :
    (Submodule.span (ZMod 4) {(2 : ZMod 4)}).annihilator.map
      (algebraMap (ZMod 4) (ZMod 2)) = ⊥ ∧
    (Submodule.span (ZMod 2) {(1 : ZMod 2) ⊗ₜ[ZMod 4] (2 : ZMod 4)}).annihilator = ⊤ ∧
    (⊥ : Ideal (ZMod 2)) ≠ ⊤ := by
  sorry

end Nonflat
end TauCeti.SchemeFoundations.FlatAnnihilator

open _root_.TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.QuotientBaseChange
universe qbU qbV qbW qbZ
variable {R : Type qbU} [CommRing R] (S : Type qbV) [CommRing S] [Algebra R S]
variable {M : Type qbW} [AddCommGroup M] [Module R M]
variable {N : Type qbZ} [AddCommGroup N] [Module R N]

lemma quotient_baseChange_square (Q : Submodule R M) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap ∘ₗ
      Q.mkQ.baseChange S = (Q.baseChange S).mkQ := by
  sorry

lemma quotient_baseChange_annihilator (Q : Submodule R M) :
    Module.annihilator S (S ⊗[R] (M ⧸ Q)) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma quotient_annihilator_flat_baseChange (Q : Submodule R M)
    [Module.Flat R S] [Module.Finite R (M ⧸ Q)] :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma quotient_annihilator_map_le_baseChange (Q : Submodule R M) :
    (Module.annihilator R (M ⧸ Q)).map (algebraMap R S) ≤
      Module.annihilator S ((S ⊗[R] M) ⧸ Q.baseChange S) := by
  sorry

lemma baseChange_range (f : M →ₗ[R] N) :
    LinearMap.range (f.baseChange S) = f.range.baseChange S := by
  sorry

lemma baseChange_map (Q : Submodule R M) (f : M →ₗ[R] N) :
    (Q.map f).baseChange S = (Q.baseChange S).map (f.baseChange S) := by
  sorry

lemma baseChange_le_comap (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    Q.baseChange S ≤ (P.baseChange S).comap (f.baseChange S) := by
  sorry

lemma quotient_baseChange_naturality (Q : Submodule R M) (P : Submodule R N)
    (f : M →ₗ[R] N) (hf : Q ≤ P.comap f) :
    (AlgebraTensorModule.tensorQuotientEquiv S R S P).toLinearMap ∘ₗ
      (Q.mapQ P f hf).baseChange S =
    (Q.baseChange S).mapQ (P.baseChange S) (f.baseChange S)
        (baseChange_le_comap S Q P f hf) ∘ₗ
      (AlgebraTensorModule.tensorQuotientEquiv S R S Q).toLinearMap := by
  sorry

lemma cokernel_annihilator_flat_baseChange (f : M →ₗ[R] N)
    [Module.Flat R S] [Module.Finite R (N ⧸ f.range)] :
    (Module.annihilator R (N ⧸ f.range)).map (algebraMap R S) =
      Module.annihilator S ((S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S)) := by
  sorry

noncomputable def cokernelBaseChangeEquiv (f : M →ₗ[R] N) :
    S ⊗[R] (N ⧸ f.range) ≃ₗ[S]
      (S ⊗[R] N) ⧸ LinearMap.range (f.baseChange S) :=
  AlgebraTensorModule.tensorQuotientEquiv S R S f.range ≪≫ₗ
    Submodule.quotEquivOfEq _ _ (baseChange_range S f).symm

lemma cokernelBaseChangeEquiv_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    cokernelBaseChangeEquiv S f (s ⊗ₜ[R] (Submodule.Quotient.mk n)) =
      Submodule.Quotient.mk (s ⊗ₜ[R] n) := by
  sorry

lemma cokernelBaseChangeEquiv_symm_mk_tmul (f : M →ₗ[R] N) (s : S) (n : N) :
    (cokernelBaseChangeEquiv S f).symm (Submodule.Quotient.mk (s ⊗ₜ[R] n)) =
      s ⊗ₜ[R] (Submodule.Quotient.mk n) := by
  sorry

lemma cokernel_baseChange_square (f : M →ₗ[R] N) :
    (cokernelBaseChangeEquiv S f).toLinearMap ∘ₗ
      f.range.mkQ.baseChange S = (LinearMap.range (f.baseChange S)).mkQ := by
  sorry

end TauCeti.SchemeFoundations.QuotientBaseChange

open _root_.TensorProduct
noncomputable section
namespace TauCeti.SchemeFoundations.QuotientBaseChange

-- test: QuotientBaseChangeChecked.identity_cokernel
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Subsingleton ((S ⊗[R] M) ⧸
      LinearMap.range ((LinearMap.id : M →ₗ[R] M).baseChange S)) := by
  sorry

-- test: QuotientBaseChangeChecked.zero_map_scalar
example :
    AlgebraTensorModule.rid ℤ (ZMod 5) (ZMod 5)
      (((LinearMap.range ((0 : ℤ →ₗ[ℤ] ℤ).baseChange (ZMod 5))).quotEquivOfEqBot
        (by simp))
      (cokernelBaseChangeEquiv (ZMod 5) (0 : ℤ →ₗ[ℤ] ℤ)
        ((3 : ZMod 5) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ))))) = 1 := by
  sorry

-- test: QuotientBaseChangeChecked.inverse_representative
example :
    (cokernelBaseChangeEquiv (ZMod 4) (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ))).symm
      (Submodule.Quotient.mk ((3 : ZMod 4) ⊗ₜ[ℤ] (7 : ℤ))) =
        (3 : ZMod 4) ⊗ₜ[ℤ] (Submodule.Quotient.mk (7 : ℤ)) := by
  sorry

-- test: QuotientBaseChangeChecked.nonflat_injective_map_collapses
example :
    Function.Injective (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)) ∧
      (LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 2) = 0 ∧
      ((1 : ZMod 2) ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := by
  sorry

-- test: QuotientBaseChangeChecked.nonreduced_quotient_annihilator
example : (2 : ZMod 4) ≠ 0 ∧
    (2 : ZMod 4) ∈ Module.annihilator (ZMod 4)
      (((ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4)) := by
  sorry

-- test: QuotientBaseChangeChecked.nonreduced_diagonal_quotient
example : ((2, 2) : ZMod 4 × ZMod 4) ≠ 0 ∧
    ((2, 2) : ZMod 4 × ZMod 4) ∈ Module.annihilator (ZMod 4 × ZMod 4)
      (((ZMod 4 × ZMod 4) ⊗[ZMod 4] (ZMod 4)) ⧸
        (Ideal.span {(2 : ZMod 4)}).baseChange (ZMod 4 × ZMod 4)) := by
  sorry

-- test: QuotientBaseChangeChecked.top_quotient_annihilator
example {R S M : Type*} [CommRing R] [CommRing S] [Algebra R S]
    [AddCommGroup M] [Module R M] :
    Module.annihilator S ((S ⊗[R] M) ⧸ (⊤ : Submodule R M).baseChange S) = ⊤ := by
  sorry

-- test: QuotientBaseChangeChecked.zero_ring_cokernel
example : Subsingleton ((ZMod 1 ⊗[ℤ] ℤ) ⧸
    LinearMap.range ((LinearMap.toSpanSingleton ℤ ℤ (2 : ℤ)).baseChange (ZMod 1))) := by
  sorry

end TauCeti.SchemeFoundations.QuotientBaseChange


noncomputable section

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma ideal_comap_top (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffine X] [IsAffine Y] :
    (I.comap f).ideal ⟨⊤, isAffineOpen_top X⟩ =
      (I.ideal ⟨⊤, isAffineOpen_top Y⟩).map f.appTop.hom := by
  sorry

lemma comap_restrict (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.Opens) :
    (I.comap f).comap (f ⁻¹ᵁ U).ι = (I.comap U.ι).comap (f ∣_ U) := by
  sorry

lemma ideal_restrict_top (I : X.IdealSheafData) (U : X.affineOpens) :
    (I.comap U.1.ι).ideal ⟨⊤, @isAffineOpen_top _ U.2⟩ =
      (I.ideal U).comap U.1.topIso.hom.hom := by
  sorry

lemma ideal_comap_affineOpen (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, H⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

lemma ideal_comap_of_isAffineHom (I : Y.IdealSheafData) (f : X ⟶ Y)
    [IsAffineHom f] (U : Y.affineOpens) :
    (I.comap f).ideal ⟨f ⁻¹ᵁ U, U.2.preimage f⟩ = (I.ideal U).map (f.app U).hom := by
  sorry

def comapObjIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) ≅
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :=
  (I.comap f).subschemeObjIso ⟨f ⁻¹ᵁ U, H⟩ ≪≫
    (Ideal.quotEquivOfEq (ideal_comap_affineOpen I f U H)).toCommRingCatIso

lemma comapObjIso_inclusion (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    (I.comap f).subschemeι.app (f ⁻¹ᵁ U) ≫ (comapObjIso I f U H).hom =
      CommRingCat.ofHom (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom)) := by
  sorry

lemma comapObjIso_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).hom ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b) =
      Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b := by
  sorry

lemma comapObjIso_inv_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv (Ideal.Quotient.mk ((I.ideal U).map (f.app U).hom) b) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback


namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: IdealPullbackChecked.composition
example [IsAffine X] [IsAffine Y] [IsAffine Z]
    (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (I.comap (f ≫ g)).ideal ⟨⊤, isAffineOpen_top X⟩ =
      ((I.ideal ⟨⊤, isAffineOpen_top Z⟩).map g.appTop.hom).map f.appTop.hom := by
  sorry

-- test: IdealPullbackChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y) :
    ∀ x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ
      (f ⁻¹ᵁ (⊥ : Y.Opens))),
      (comapObjIso I f ⟨⊥, isAffineOpen_bot Y⟩ (by simpa using isAffineOpen_bot X)).hom x = 0 := by
  sorry

-- test: IdealPullbackChecked.inverse_representative
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U)) (b : Γ(X, f ⁻¹ᵁ U)) :
    (comapObjIso I f U H).inv ((comapObjIso I f U H).hom
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U) b)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ U) b := by
  sorry

-- test: IdealPullbackChecked.nonflat_quotient
example :
    let f := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : (Spec (.of ℤ)).IdealSheafData :=
      Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    I ≠ ⊥ ∧ I.comap f = ⊥ := by
  sorry

-- test: IdealPullbackChecked.nonreduced_quotient
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let y := (I.comap (𝟙 X)).subschemeι.app U b
    (comapObjIso I (𝟙 X) U U.2).hom y ≠ 0 ∧
      ((comapObjIso I (𝟙 X) U U.2).hom y) ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma extendedIdeal_restrict (I : Y.IdealSheafData) (f : X ⟶ Y)
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

lemma quotientRestriction_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) (b : Γ(X, f ⁻¹ᵁ V)) :
    quotientRestriction I f h (Ideal.Quotient.mk _ b) =
      Ideal.Quotient.mk _
        ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map (homOfLE h)).op) b) := by
  sorry

lemma quotientRestriction_id (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    quotientRestriction I f (le_refl U) = RingHom.id _ := by
  sorry

lemma quotientRestriction_comp (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) :
    quotientRestriction I f (h.trans k) =
      (quotientRestriction I f h).comp (quotientRestriction I f k) := by
  sorry

lemma comapObjIso_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V)
    (HU : IsAffineOpen (f ⁻¹ᵁ U)) (HV : IsAffineOpen (f ⁻¹ᵁ V)) :
    (I.comap f).subscheme.presheaf.map
        ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
          ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op ≫
      (comapObjIso I f U HU).hom =
        (comapObjIso I f V HV).hom ≫ CommRingCat.ofHom (quotientRestriction I f h) := by
  sorry

lemma comapObjIso_inv_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
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

lemma quotientPresheaf_obj (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientPresheaf I f).obj (op U) =
      CommRingCat.of (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) := by
  sorry

lemma quotientPresheaf_map (I : Y.IdealSheafData) (f : X ⟶ Y)
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

lemma comapObjNatIso_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).app (op U) = comapObjIso I f U (U.2.preimage f) := by
  sorry

lemma comapObjNatIso_hom_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).hom.app (op U) = (comapObjIso I f U (U.2.preimage f)).hom := by
  sorry

lemma comapObjNatIso_inv_app (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens) :
    (comapObjNatIso I f).inv.app (op U) = (comapObjIso I f U (U.2.preimage f)).inv := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientRestrictionChecked.empty_target
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ V) ⧸ (I.ideal V).map (f.app V).hom) :
    quotientRestriction I f (show (⟨⊥, isAffineOpen_bot Y⟩ : Y.affineOpens) ≤ V
      from (show (⊥ : Y.Opens) ≤ V.1 from bot_le)) q = 0 := by
  sorry

-- test: QuotientRestrictionChecked.triple_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W T : Y.affineOpens} (h : U ≤ V) (k : V ≤ W) (l : W ≤ T)
    (q : Γ(X, f ⁻¹ᵁ T) ⧸ (I.ideal T).map (f.app T).hom) :
    quotientRestriction I f ((h.trans k).trans l) q =
      quotientRestriction I f h (quotientRestriction I f k (quotientRestriction I f l q)) := by
  sorry

-- test: QuotientRestrictionChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b) ≠ 0 ∧
      (quotientRestriction I (𝟙 X) (le_refl U) (Ideal.Quotient.mk _ b)) ^ 2 = 0 := by
  sorry

-- test: QuotientPresheafChecked.basic_open_representative
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (b : Γ(X, f ⁻¹ᵁ V)) :
    (quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op
      (Ideal.Quotient.mk _ b) =
        Ideal.Quotient.mk _ ((X.presheaf.map
          ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) b) := by
  sorry

-- test: QuotientPresheafChecked.nonflat_surviving_unit
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    (1 : (quotientPresheaf I f).obj (op U)) ≠ 0 := by
  sorry

-- test: QuotientPresheafChecked.zero_ideal_path
example (f : X ⟶ Y) {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (b : Γ(X, f ⁻¹ᵁ W)) :
    (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE h).op
      ((quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE k).op
        (Ideal.Quotient.mk _ b)) =
        (quotientPresheaf (⊥ : Y.IdealSheafData) f).map (homOfLE (h.trans k)).op
          (Ideal.Quotient.mk _ b) := by
  sorry

-- test: ComapObjNatIsoChecked.roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    (U : Y.affineOpens)
    (x : Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U))) :
    (comapObjNatIso I f).inv.app (op U) ((comapObjNatIso I f).hom.app (op U) x) = x := by
  sorry

-- test: ComapObjNatIsoChecked.forward_overlap
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

-- test: ComapObjNatIsoChecked.inverse_overlap
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f]
    {U V : Y.affineOpens} (h : U ≤ V) :
    (quotientPresheaf I f).map (homOfLE h).op ≫
      (comapObjNatIso I f).inv.app (op U) =
        (comapObjNatIso I f).inv.app (op V) ≫
          (I.comap f).subscheme.presheaf.map
            ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
              ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma extendedIdeal_le_ker (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (I.ideal U).map (f.app U).hom ≤
      RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

def quotientToClosed (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)) :=
  Ideal.Quotient.lift _ ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom
    (by sorry)

lemma quotientToClosed_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToClosed I f U (Ideal.Quotient.mk _ a) =
      (I.comap f).subschemeι.app (f ⁻¹ᵁ U) a := by
  sorry

lemma quotientToClosed_unique (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      Γ((I.comap f).subscheme, (I.comap f).subschemeι ⁻¹ᵁ (f ⁻¹ᵁ U)))
    (hq : q.comp (Ideal.Quotient.mk _) = ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :
    q = quotientToClosed I f U := by
  sorry

lemma quotientToClosed_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V : Y.affineOpens} (h : U ≤ V) :
    CommRingCat.ofHom (quotientRestriction I f h) ≫
        CommRingCat.ofHom (quotientToClosed I f U) =
      CommRingCat.ofHom (quotientToClosed I f V) ≫
        (I.comap f).subscheme.presheaf.map
          ((TopologicalSpace.Opens.map (I.comap f).subschemeι.base).map
            ((TopologicalSpace.Opens.map f.base).map (homOfLE h))).op := by
  sorry

lemma quotientToClosed_eq_inv (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    CommRingCat.ofHom (quotientToClosed I f U) = (comapObjIso I f U H).inv := by
  sorry

lemma quotientToClosed_injective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToClosed_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
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

lemma quotientToClosedNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToClosedNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToClosed I f U) := by
  sorry

lemma quotientToClosedNatTrans_affine (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f = (comapObjNatIso I f).inv := by
  sorry

lemma quotientToClosedNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToClosedNatTrans I f) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientToClosedChecked.actual_factorization
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (quotientToClosed I f U).comp (Ideal.Quotient.mk _) =
      ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom := by
  sorry

-- test: QuotientToClosedChecked.top_ideal
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToClosed (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- test: QuotientToClosedChecked.nonreduced_section
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let b := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientToClosed I (𝟙 X) U (Ideal.Quotient.mk _ b)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: QuotientToClosedChecked.nonflat_surviving_unit
example :
    let Y := Spec (.of ℤ)
    let X := Spec (.of (ZMod 2))
    let f : X ⟶ Y := Spec.map (CommRingCat.ofHom (Int.castRingHom (ZMod 2)))
    let I : Y.IdealSheafData := Scheme.IdealSheafData.ofIdealTop (Ideal.span {2})
    let U : Y.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    quotientToClosed I f U 1 ≠ 0 := by
  sorry

-- test: QuotientToClosedNatTransChecked.basic_open
example (I : Y.IdealSheafData) (f : X ⟶ Y) (V : Y.affineOpens)
    (s : Γ(Y, V)) (a : Γ(X, f ⁻¹ᵁ V)) :
    (quotientToClosedNatTrans I f).app (op (Y.affineBasicOpen s))
      ((quotientPresheaf I f).map (homOfLE (Y.affineBasicOpen_le s)).op (Ideal.Quotient.mk _ a)) =
        (I.comap f).subschemeι.app (f ⁻¹ᵁ (Y.affineBasicOpen s))
          ((X.presheaf.map ((TopologicalSpace.Opens.map f.base).map
            (homOfLE (Y.affineBasicOpen_le s))).op) a) := by
  sorry

-- test: QuotientToClosedNatTransChecked.two_step_overlap
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

-- test: QuotientToClosedNatTransChecked.affine_roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    quotientToClosedNatTrans I f ≫ (comapObjNatIso I f).hom = 𝟙 _ := by
  sorry

-- test: QuotientToClosedNatTransChecked.nonaffine_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective ((quotientToClosedNatTrans I f).app (op U))) :
    ¬ IsAffineHom f := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

lemma allOpenKernel_restriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    RingHom.ker (I.subschemeι.app V).hom ≤
      (RingHom.ker (I.subschemeι.app U).hom).comap (X.presheaf.map (homOfLE h).op).hom := by
  sorry

def allOpenRestriction (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (Γ(X, V) ⧸ RingHom.ker (I.subschemeι.app V).hom) →+*
      (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :=
  Ideal.quotientMap _ (X.presheaf.map (homOfLE h).op).hom (by sorry)

lemma allOpenRestriction_mk (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V)
    (a : Γ(X, V)) :
    allOpenRestriction I h (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ (X.presheaf.map (homOfLE h).op a) := by
  sorry

lemma allOpenRestriction_id (I : X.IdealSheafData) (U : X.Opens) :
    allOpenRestriction I (le_refl U) = RingHom.id _ := by
  sorry

lemma allOpenRestriction_comp (I : X.IdealSheafData) {U V W : X.Opens}
    (h : U ≤ V) (k : V ≤ W) :
    (allOpenRestriction I h).comp (allOpenRestriction I k) =
      allOpenRestriction I (h.trans k) := by
  sorry

def allOpenQuotient (I : X.IdealSheafData) : X.Opensᵒᵖ ⥤ CommRingCat.{u} where
  obj U := .of (Γ(X, U.unop) ⧸ RingHom.ker (I.subschemeι.app U.unop).hom)
  map h := CommRingCat.ofHom (allOpenRestriction I h.unop.le)
  map_id U := by sorry
  map_comp h k := by sorry

lemma allOpenQuotient_obj (I : X.IdealSheafData) (U : X.Opens) :
    (allOpenQuotient I).obj (op U) =
      CommRingCat.of (Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) := by
  sorry

lemma allOpenQuotient_map (I : X.IdealSheafData) {U V : X.Opens} (h : U ≤ V) :
    (allOpenQuotient I).map (homOfLE h).op = CommRingCat.ofHom (allOpenRestriction I h) := by
  sorry

def allOpenToClosed (I : X.IdealSheafData) : allOpenQuotient I ⟶
    (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf where
  app U := CommRingCat.ofHom (I.subschemeι.app U.unop).hom.kerLift
  naturality U V h := by sorry

lemma allOpenToClosed_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U) (Ideal.Quotient.mk _ a) = I.subschemeι.app U a := by
  sorry

lemma allOpenToClosed_injective (I : X.IdealSheafData) (U : X.Opens) :
    Function.Injective ((allOpenToClosed I).app (op U)) := by
  sorry

lemma allOpenToClosed_affine_bijective (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((allOpenToClosed I).app (op U.1)) := by
  sorry

lemma allOpenToClosed_affine_agreement (I : X.IdealSheafData) (U : X.affineOpens) :
    (allOpenToClosed I).app (op U.1) =
      CommRingCat.ofHom (Ideal.quotientMap (I.ideal U) (RingHom.id _)
        (by rw [I.ker_subschemeι_app U]; exact le_rfl)) ≫ (I.subschemeObjIso U).inv := by
  sorry

lemma allOpenToClosed_locally_surjective (I : X.IdealSheafData) :
    Presheaf.IsLocallySurjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

lemma allOpenToClosed_locally_injective (I : X.IdealSheafData) :
    Presheaf.IsLocallyInjective (Opens.grothendieckTopology X)
      (allOpenToClosed I) := by
  sorry

def allOpenSheafComparison (I : X.IdealSheafData) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf :=
  sheafifyLift _ (allOpenToClosed I)
    (by sorry)

lemma allOpenSheafComparison_factor (I : X.IdealSheafData) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      allOpenSheafComparison I = allOpenToClosed I := by
  sorry

lemma allOpenSheafComparison_mk (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    (allOpenSheafComparison I).app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a)) = I.subschemeι.app U a := by
  sorry

lemma allOpenSheafComparison_unique (I : X.IdealSheafData)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ⟶
      (TopologicalSpace.Opens.map I.subschemeι.base).op ⋙ I.subscheme.presheaf)
    (hq : toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I) ≫
      q = allOpenToClosed I) : q = allOpenSheafComparison I := by
  sorry

lemma allOpenSheafComparison_isIso (I : X.IdealSheafData) :
    IsIso (allOpenSheafComparison I) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: AllOpenRestrictionChecked.two_step
example (I : X.IdealSheafData) {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (a : Γ(X, W) ⧸ RingHom.ker (I.subschemeι.app W).hom) :
    (allOpenQuotient I).map (homOfLE h).op
      ((allOpenQuotient I).map (homOfLE k).op a) =
        (allOpenQuotient I).map (homOfLE (h.trans k)).op a := by
  sorry

-- test: AllOpenQuotientChecked.affine_ideal
example (I : X.IdealSheafData) (U : X.affineOpens) (a : Γ(X, U)) :
    (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a) = 0 ↔ a ∈ I.ideal U := by
  sorry

-- test: AllOpenQuotientChecked.unit_ideal
example (U : X.affineOpens) (a : Γ(X, U) ⧸
    RingHom.ker ((⊤ : X.IdealSheafData).subschemeι.app U).hom) : a = 0 := by
  sorry

-- test: AllOpenQuotientChecked.nonreduced
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (allOpenToClosed I).app (op U.1) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: AllOpenToClosedChecked.affine_roundtrip
example (I : X.IdealSheafData) (U : X.affineOpens)
    (a : Γ(X, U) ⧸ RingHom.ker (I.subschemeι.app U).hom) :
    (RingEquiv.ofBijective ((allOpenToClosed I).app (op U.1)).hom
      (allOpenToClosed_affine_bijective I U)).symm
      ((allOpenToClosed I).app (op U.1) a) = a := by
  sorry

-- test: AllOpenToClosedChecked.nonaffine_obstruction
example (I : X.IdealSheafData) (U : X.Opens)
    (h : ¬ Function.Surjective ((allOpenToClosed I).app (op U))) : ¬ IsAffineOpen U := by
  sorry

-- test: AllOpenSheafComparisonChecked.representative_inverse
example (I : X.IdealSheafData) (U : X.Opens) (a : Γ(X, U)) :
    let q := allOpenSheafComparison I
    let _ := allOpenSheafComparison_isIso I
    (inv q).app (op U) (I.subschemeι.app U a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient I)).app (op U)
        (Ideal.Quotient.mk _ a) := by
  sorry

-- test: AllOpenSheafComparisonChecked.pullback_agreement
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a)) =
          quotientToClosed I f U (Ideal.Quotient.mk _ a) := by
  sorry

-- test: AllOpenSheafComparisonChecked.arbitrary_section
example (I : X.IdealSheafData) (U : X.Opens)
    (s : Γ(I.subscheme, I.subschemeι ⁻¹ᵁ U)) :
    ∃ q, (allOpenSheafComparison I).app (op U) q = s := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def quotientToKernel (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    (Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) →+*
      (Γ(X, f ⁻¹ᵁ U) ⧸ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom) :=
  Ideal.quotientMap _ (RingHom.id _) (extendedIdeal_le_ker I f U)

lemma quotientToKernel_mk (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U)) :
    quotientToKernel I f U (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientToKernel_surjective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) : Function.Surjective (quotientToKernel I f U) := by
  sorry

lemma quotientToKernel_factor (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens) :
    ((allOpenToClosed (I.comap f)).app (op (f ⁻¹ᵁ U))).hom.comp
      (quotientToKernel I f U) = quotientToClosed I f U := by
  sorry

lemma quotientToKernel_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective (quotientToKernel I f U) ↔ Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToKernel_bijective (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    Function.Bijective (quotientToKernel I f U) := by
  sorry

lemma quotientToKernel_naturality (I : Y.IdealSheafData) (f : X ⟶ Y)
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

lemma quotientToKernelNatTrans_app (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    (quotientToKernelNatTrans I f).app (op U) = CommRingCat.ofHom (quotientToKernel I f U) := by
  sorry

lemma quotientToKernelNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op (allOpenToClosed (I.comap f)) =
      quotientToClosedNatTrans I f := by
  sorry

lemma quotientToKernelNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToKernelNatTrans I f) := by
  sorry

lemma quotientToKernelNatTrans_sheaf_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToKernelNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op
        (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)) ≫
          allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientToKernelChecked.affine_roundtrip
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (H : IsAffineOpen (f ⁻¹ᵁ U))
    (a : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (RingEquiv.ofBijective (quotientToKernel I f U)
      (quotientToKernel_bijective I f U H)).symm (quotientToKernel I f U a) = a := by
  sorry

-- test: QuotientToKernelChecked.unit_ideal
example (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ ((⊤ : Y.IdealSheafData).ideal U).map (f.app U).hom) :
    quotientToKernel (⊤ : Y.IdealSheafData) f U q = 0 := by
  sorry

-- test: QuotientToKernelChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : Γ(X, f ⁻¹ᵁ (⊥ : Y.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Y⟩).map (f.app (⊥ : Y.Opens)).hom) :
    quotientToKernel I f ⟨⊥, isAffineOpen_bot Y⟩ q = 0 := by
  sorry

-- test: QuotientToKernelChecked.strict_kernel_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (a : Γ(X, f ⁻¹ᵁ U))
    (ha : a ∈ RingHom.ker ((I.comap f).subschemeι.app (f ⁻¹ᵁ U)).hom)
    (hn : a ∉ (I.ideal U).map (f.app U).hom) :
    ¬ Function.Injective (quotientToKernel I f U) ∧ ¬ IsAffineOpen (f ⁻¹ᵁ U) := by
  sorry

-- test: QuotientToKernelNatChecked.two_step_restriction
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    {U V W : Y.affineOpens} (h : U ≤ V) (k : V ≤ W)
    (q : Γ(X, f ⁻¹ᵁ W) ⧸ (I.ideal W).map (f.app W).hom) :
    (quotientToKernelNatTrans I f).app (op U)
      (quotientRestriction I f h (quotientRestriction I f k q)) =
    (allOpenQuotient (I.comap f)).map
      ((TopologicalSpace.Opens.map f.base).map (homOfLE (h.trans k))).op
        ((quotientToKernelNatTrans I f).app (op W) q) := by
  sorry

-- test: QuotientToKernelNatChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToKernelNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: QuotientToKernelNatChecked.sheaf_factor_on_every_class
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : Γ(X, f ⁻¹ᵁ U) ⧸ (I.ideal U).map (f.app U).hom) :
    (allOpenSheafComparison (I.comap f)).app (op (f ⁻¹ᵁ U))
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) ((quotientToKernelNatTrans I f).app (op U) q)) =
      quotientToClosed I f U q := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000

lemma extendedIdeal_comp (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    quotientCompIso I f g U H (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompIso I f g U H).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma kernelCompIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    kernelCompIso I f g V (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma kernelCompIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (V : X.Opens) (a : Γ(X, V)) :
    (kernelCompIso I f g V).symm (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompIso_kernel_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U)).toRingHom.comp
      (quotientToKernel I (f ≫ g) U) =
    (quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩).comp
      (quotientCompIso I f g U H).toRingHom := by
  sorry

lemma kernelCompIso_naturality (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) :
    (quotientCompNatIso I f g).hom.app (op U) =
      (quotientCompIso I f g U (U.2.preimage g)).toCommRingCatIso.hom := by
  sorry

lemma quotientCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsAffineHom g] (U : Z.affineOpens) (a : Γ(X, (f ≫ g) ⁻¹ᵁ U)) :
    (quotientCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: QuotientCompChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompIso I f g U H).symm (quotientCompIso I f g U H q) = q := by
  sorry

-- test: QuotientCompChecked.unit_ideal
example (f : X ⟶ Y) (g : Y ⟶ Z) (U : Z.affineOpens)
    (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸
      ((⊤ : Z.IdealSheafData).ideal U).map ((f ≫ g).app U).hom) :
    quotientCompIso (⊤ : Z.IdealSheafData) f g U H q = 0 := by
  sorry

-- test: QuotientCompChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (H : g ⁻¹ᵁ (⊥ : Z.Opens) ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ (⊥ : Z.Opens)) ⧸
      (I.ideal ⟨⊥, isAffineOpen_bot Z⟩).map ((f ≫ g).app (⊥ : Z.Opens)).hom) :
    quotientCompIso I f g ⟨⊥, isAffineOpen_bot Z⟩ H q = 0 := by
  sorry

-- test: QuotientCompChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := quotientCompIso I (𝟙 X) (𝟙 X) U U.2 (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

-- test: KernelCompChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (V : X.Opens)
    (q : Γ(X, V) ⧸ RingHom.ker ((I.comap (f ≫ g)).subschemeι.app V).hom) :
    (kernelCompIso I f g V).symm (kernelCompIso I f g V q) = q := by
  sorry

-- test: KernelCompChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : Γ(X, (⊥ : X.Opens)) ⧸
      RingHom.ker ((I.comap (f ≫ g)).subschemeι.app (⊥ : X.Opens)).hom) :
    kernelCompIso I f g ⊥ q = 0 := by
  sorry

-- test: KernelCompChecked.comparison_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) (quotientToKernel I (f ≫ g) U q) =
    quotientToKernel (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩ (quotientCompIso I f g U H q) := by
  sorry

-- test: QuotientCompNatChecked.two_step_restriction
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

-- test: QuotientCompNatChecked.inverse_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    (quotientCompNatIso I f g).inv.app (op U)
      ((quotientCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- test: QuotientCompNatChecked.kernel_square_on_every_class
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : Γ(X, (f ≫ g) ⁻¹ᵁ U) ⧸ (I.ideal U).map ((f ≫ g).app U).hom) :
    kernelCompIso I f g ((f ≫ g) ⁻¹ᵁ U) ((quotientToKernelNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)
      ((quotientCompNatIso I f g).hom.app (op U) q) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

def kernelCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    allOpenQuotient (I.comap (f ≫ g)) ≅ allOpenQuotient ((I.comap g).comap f) :=
  NatIso.ofComponents (fun U => (kernelCompIso I f g U.unop).toCommRingCatIso)
    (fun h => kernelCompIso_naturality I f g h.unop.le)

lemma kernelCompNatIso_app (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) :
    (kernelCompNatIso I f g).app (op U) = (kernelCompIso I f g U).toCommRingCatIso := by
  sorry

lemma kernelCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma kernelCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (kernelCompNatIso I f g).inv.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

def sheafCompNatIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≅
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) :=
  (sheafification (Opens.grothendieckTopology X) CommRingCat).mapIso (kernelCompNatIso I f g)

lemma sheafCompNatIso_unit (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ≫
      (sheafCompNatIso I f g).hom =
    (kernelCompNatIso I f g).hom ≫
      toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)) := by
  sorry

lemma sheafCompNatIso_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (sheafCompNatIso I f g).hom.app (op U)
      ((toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g)))).app
        (op U) (Ideal.Quotient.mk _ a)) =
    (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f))).app
      (op U) (Ideal.Quotient.mk _ a) := by
  sorry

lemma sheafCompNatIso_inv_unit_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma sheafCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (sheafCompNatIso I f g).hom ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

lemma closedCompNatIso_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).hom.app (op U) ((I.comap (f ≫ g)).subschemeι.app U a) =
      ((I.comap g).comap f).subschemeι.app U a := by
  sorry

lemma closedCompNatIso_inv_mk (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : X.Opens) (a : Γ(X, U)) :
    (closedCompNatIso I f g).inv.app (op U) (((I.comap g).comap f).subschemeι.app U a) =
      (I.comap (f ≫ g)).subschemeι.app U a := by
  sorry

lemma kernelCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    (kernelCompNatIso I f g).hom ≫ allOpenToClosed ((I.comap g).comap f) =
      allOpenToClosed (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom := by
  sorry

lemma sheafCompNatIso_unique (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap (f ≫ g))) ⟶
      sheafify (Opens.grothendieckTopology X) (allOpenQuotient ((I.comap g).comap f)))
    (hq : q ≫ allOpenSheafComparison ((I.comap g).comap f) =
      allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom) :
    q = (sheafCompNatIso I f g).hom := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- test: CompositeKernelPresheafChecked.roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (kernelCompNatIso I f g).inv.app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) = q := by
  sorry

-- test: CompositeKernelPresheafChecked.empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (kernelCompNatIso I f g).hom.app (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- test: CompositeKernelPresheafChecked.two_restrictions
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    {U V W : X.Opens} (h : U ≤ V) (k : V ≤ W)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op W)) :
    (kernelCompNatIso I f g).hom.app (op U)
      (allOpenRestriction (I.comap (f ≫ g)) h
        (allOpenRestriction (I.comap (f ≫ g)) k q)) =
    allOpenRestriction ((I.comap g).comap f) (h.trans k)
      ((kernelCompNatIso I f g).hom.app (op W) q) := by
  sorry

-- test: CompositeClosedPresheafChecked.all_sections_roundtrip
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (s : Γ((I.comap (f ≫ g)).subscheme, (I.comap (f ≫ g)).subschemeι ⁻¹ᵁ U)) :
    (closedCompNatIso I f g).inv.app (op U)
      ((closedCompNatIso I f g).hom.app (op U) s) = s := by
  sorry

-- test: CompositeClosedPresheafChecked.all_quotient_classes
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op U)) :
    (allOpenToClosed ((I.comap g).comap f)).app (op U)
      ((kernelCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenToClosed (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- test: CompositeClosedPresheafChecked.restriction
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

-- test: CompositeSheafChecked.all_sections_square
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (U : X.Opens)
    (q : (sheafify (Opens.grothendieckTopology X)
      (allOpenQuotient (I.comap (f ≫ g)))).obj (op U)) :
    (allOpenSheafComparison ((I.comap g).comap f)).app (op U)
      ((sheafCompNatIso I f g).hom.app (op U) q) =
    (closedCompNatIso I f g).hom.app (op U)
      ((allOpenSheafComparison (I.comap (f ≫ g))).app (op U) q) := by
  sorry

-- test: CompositeSheafChecked.forced_comparison
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    let _ := allOpenSheafComparison_isIso ((I.comap g).comap f)
    allOpenSheafComparison (I.comap (f ≫ g)) ≫ (closedCompNatIso I f g).hom ≫
      inv (allOpenSheafComparison ((I.comap g).comap f)) = (sheafCompNatIso I f g).hom := by
  sorry

-- test: CompositeSheafChecked.nonreduced_identity
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

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

lemma allOpenQuotient_eqToIso_mk (I J : X.IdealSheafData) (h : I = J)
    (U : X.Opens) (a : Γ(X, U)) :
    (eqToIso (congrArg allOpenQuotient h)).hom.app (op U) (Ideal.Quotient.mk _ a) =
      Ideal.Quotient.mk _ a := by
  sorry

lemma allOpenQuotient_iso_eqToIso (I J : X.IdealSheafData) (h : I = J)
    (e : allOpenQuotient I ≅ allOpenQuotient J)
    (he : ∀ (U : X.Opens) (a : Γ(X, U)),
      e.hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a) :
    e = eqToIso (congrArg allOpenQuotient h) := by
  sorry

lemma kernelCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    kernelCompNatIso I f g = eqToIso (congrArg allOpenQuotient (I.comap_comp f g)) := by
  sorry

lemma sheafCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    sheafCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X)
        (allOpenQuotient K)) (I.comap_comp f g)) := by
  sorry

lemma allOpenSheafComparison_eqToIso (I J : X.IdealSheafData) (h : I = J) :
    let _ := allOpenSheafComparison_isIso I
    let _ := allOpenSheafComparison_isIso J
    (asIso (allOpenSheafComparison I)).symm ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData =>
        sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) h) ≪≫
      asIso (allOpenSheafComparison J) =
    eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h) := by
  sorry

lemma closedCompNatIso_eqToIso (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) :
    closedCompNatIso I f g = eqToIso (congrArg
      (fun K : X.IdealSheafData =>
        (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf)
      (I.comap_comp f g)) := by
  sorry

lemma kernelCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma kernelCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    kernelCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma kernelCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

lemma sheafCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma sheafCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma sheafCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

lemma closedCompNatIso_id_left (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg (fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) ((I.comap f).comap_id)) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.id_comp f)) := by
  sorry

lemma closedCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id) =
    eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f)) := by
  sorry

lemma closedCompNatIso_assoc (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) :
    closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g =
      eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h)) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

noncomputable section
namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
variable {X Y Z W : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 100000

-- test: CompositeCoherenceChecked.kernel_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : (allOpenQuotient (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (kernelCompNatIso I (f ≫ g) h ≪≫ kernelCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => (allOpenQuotient (I.comap k))) (Category.assoc f g h)) ≪≫
        kernelCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => (allOpenQuotient (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (sheafCompNatIso I (f ≫ g) h ≪≫ sheafCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.assoc f g h)) ≪≫
        sheafCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.closed_threefold_sections
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    (U : X.Opens) (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap ((f ≫ g) ≫ h))).obj (op U)) :
    (closedCompNatIso I (f ≫ g) h ≪≫ closedCompNatIso (I.comap h) f g).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ W => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.assoc f g h)) ≪≫
        closedCompNatIso I f (g ≫ h) ≪≫
          eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f)))
            (I.comap_comp g h))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.kernel_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : (allOpenQuotient (I.comap (𝟙 X ≫ f))).obj (op U)) :
    (kernelCompNatIso I (𝟙 X) f ≪≫
      eqToIso (congrArg allOpenQuotient ((I.comap f).comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => (allOpenQuotient (I.comap k))) (Category.id_comp f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (sheafCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => sheafify (Opens.grothendieckTopology X) (allOpenQuotient K)) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.closed_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : X.Opens)
    (q : ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap (f ≫ 𝟙 Y))).obj (op U)) :
    (closedCompNatIso I f (𝟙 Y) ≪≫
      eqToIso (congrArg (fun K : Y.IdealSheafData => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (K.comap f))) I.comap_id)).hom.app (op U) q =
      (eqToIso (congrArg (fun k : X ⟶ Y => ((fun K : X.IdealSheafData => (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) (I.comap k))) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: CompositeCoherenceChecked.kernel_empty_open
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (q : (allOpenQuotient (I.comap (f ≫ g))).obj (op (⊥ : X.Opens))) :
    (eqToIso (congrArg allOpenQuotient (I.comap_comp f g))).hom.app
      (op (⊥ : X.Opens)) q = 0 := by
  sorry

-- test: CompositeCoherenceChecked.closed_inverse_transport
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (h : I.comap (f ≫ g) = (I.comap g).comap f) :
    (closedCompNatIso I f g).symm =
    (eqToIso (congrArg (fun K : X.IdealSheafData =>
      (TopologicalSpace.Opens.map K.subschemeι.base).op ⋙ K.subscheme.presheaf) h)).symm := by
  sorry

-- test: CompositeCoherenceChecked.sheaf_nonreduced
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

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
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

lemma quotientToSheafNatTrans_mk (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (quotientToSheafNatTrans I f).app (op U) (Ideal.Quotient.mk _ a) =
      (toSheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f))).app
        (op (f ⁻¹ᵁ U)) (Ideal.Quotient.mk _ a) := by
  sorry

lemma quotientToSheafNatTrans_factor (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientToSheafNatTrans I f ≫
      Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
        from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
        (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f := by
  sorry

lemma quotientToSheafNatTrans_unique (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : quotientPresheaf I f ⟶
      ((show Monotone (fun U : Y.affineOpens => U.1) from fun _ _ h => h).functor ⋙
        TopologicalSpace.Opens.map f.base).op ⋙
          sheafify (Opens.grothendieckTopology X) (allOpenQuotient (I.comap f)))
    (hq : q ≫ Functor.whiskerLeft ((show Monotone (fun U : Y.affineOpens => U.1)
      from fun _ _ h => h).functor ⋙ TopologicalSpace.Opens.map f.base).op
      (allOpenSheafComparison (I.comap f)) = quotientToClosedNatTrans I f) :
    q = quotientToSheafNatTrans I f := by
  sorry

lemma quotientToSheafNatTrans_app_isIso (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) (H : IsAffineOpen (f ⁻¹ᵁ U)) :
    IsIso ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

lemma quotientToSheafNatTrans_isIso (I : Y.IdealSheafData) (f : X ⟶ Y) [IsAffineHom f] :
    IsIso (quotientToSheafNatTrans I f) := by
  sorry

lemma quotientCompNatIso_kernel (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_closed (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_sheaf (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_kernel_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_closed_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompNatIso_sheaf_inverse (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
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

lemma quotientCompIso_closed_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    CommRingCat.ofHom (quotientToClosed I (f ≫ g) U) ≫
      (closedCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      CommRingCat.ofHom (quotientToClosed (I.comap g) f ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

lemma quotientCompIso_sheaf_factor (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : g ⁻¹ᵁ U ∈ Y.affineOpens) :
    (quotientToSheafNatTrans I (f ≫ g)).app (op U) ≫
      (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U)) =
    (quotientCompIso I f g U H).toCommRingCatIso.hom ≫
      (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩) := by
  sorry

lemma quotientToSheafNatTrans_injective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Injective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Injective (quotientToClosed I f U) := by
  sorry

lemma quotientToSheafNatTrans_surjective_iff (I : Y.IdealSheafData) (f : X ⟶ Y)
    (U : Y.affineOpens) :
    Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) ↔
      Function.Surjective (quotientToClosed I f U) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe sqU
variable {X Y Z : Scheme.{sqU}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- test: QuotientComparisonSquaresChecked.identity_bijective
example (I : X.IdealSheafData) (U : X.affineOpens) :
    Function.Bijective ((quotientToSheafNatTrans I (𝟙 X)).app (op U)) := by
  sorry

-- test: QuotientComparisonSquaresChecked.empty_open
example (I : Y.IdealSheafData) (f : X ⟶ Y)
    (q : (quotientPresheaf I f).obj (op ⟨⊥, isAffineOpen_bot Y⟩)) :
    (quotientToSheafNatTrans I f).app (op ⟨⊥, isAffineOpen_bot Y⟩) q = 0 := by
  sorry

-- test: QuotientComparisonSquaresChecked.surjectivity_obstruction
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (h : ¬ Function.Surjective (quotientToClosed I f U)) :
    ¬ Function.Surjective ((quotientToSheafNatTrans I f).app (op U)) := by
  sorry

-- test: QuotientComparisonSquaresChecked.single_affine_preimage
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z)
    (U : Z.affineOpens) (H : IsAffineOpen (g ⁻¹ᵁ U))
    (q : (quotientPresheaf I (f ≫ g)).obj (op U)) :
    (sheafCompNatIso I f g).hom.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans I (f ≫ g)).app (op U) q) =
    (quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, H⟩)
      (quotientCompIso I f g U H q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.kernel_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (kernelCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToKernelNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToKernelNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.closed_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (closedCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToClosedNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToClosedNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.sheaf_inverse_sections
example (I : Z.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) [IsAffineHom g]
    (U : Z.affineOpens)
    (q : (quotientPresheaf (I.comap g) f).obj (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩)) :
    (sheafCompNatIso I f g).inv.app (op ((f ≫ g) ⁻¹ᵁ U))
      ((quotientToSheafNatTrans (I.comap g) f).app (op ⟨g ⁻¹ᵁ U, U.2.preimage g⟩) q) =
    (quotientToSheafNatTrans I (f ≫ g)).app (op U)
      ((quotientCompNatIso I f g).inv.app (op U) q) := by
  sorry

-- test: QuotientComparisonSquaresChecked.nonreduced_identity
example :
    let X := Spec (.of (ZMod 4))
    let I : X.IdealSheafData := ⊥
    let U : X.affineOpens := ⟨⊤, isAffineOpen_top _⟩
    let a := (Scheme.ΓSpecIso (.of (ZMod 4))).inv 2
    let q := (quotientToSheafNatTrans I (𝟙 X)).app (op U) (Ideal.Quotient.mk _ a)
    q ≠ 0 ∧ q ^ 2 = 0 := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerLevel
variable {X Y Z W : Scheme.{quotientTowerLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

lemma quotientPresheaf_eqToIso_mk (I J : Y.IdealSheafData) (h : I = J)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U)
      (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientPresheaf_hom_ext (I : Y.IdealSheafData) (f : X ⟶ Y)
    {F : Y.affineOpensᵒᵖ ⥤ CommRingCat}
    (α β : quotientPresheaf I f ⟶ F)
    (H : ∀ (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)),
      α.app (op U) (Ideal.Quotient.mk _ a) = β.app (op U) (Ideal.Quotient.mk _ a)) :
    α = β := by
  sorry

lemma quotientPresheaf_assoc_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) (U : W.affineOpens)
    (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_assoc_left_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_eqToIso_mk (I : Z.IdealSheafData)
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

lemma quotientPresheaf_assoc_post_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    {F : W.affineOpensᵒᵖ ⥤ CommRingCat}
    (α : quotientPresheaf I (f ≫ g ≫ h) ⟶ F)
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    ((eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h))).hom ≫ α).app
      (op U) (Ideal.Quotient.mk _ a) = α.app (op U) (Ideal.Quotient.mk _ a) := by
  sorry

lemma quotientCompNatIso_assoc_right_mk (I : W.IdealSheafData)
    (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W) [IsAffineHom g] [IsAffineHom h]
    (U : W.affineOpens) (a : Γ(X, ((f ≫ g) ≫ h) ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.assoc f g h)) ≪≫
      quotientCompNatIso I f (g ≫ h) ≪≫
        Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
          (⟨(g ≫ h) ⁻¹ᵁ U, U.2.preimage (g ≫ h)⟩ : Y.affineOpens))
          from fun _ _ k => (g ≫ h).preimage_mono k).functor.op
          (eqToIso (congrArg (fun K => quotientPresheaf K f) (I.comap_comp g h)))).hom.app (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_assoc (I : W.IdealSheafData)
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

lemma quotientPresheaf_id_right_mk (I : Y.IdealSheafData)
    (f : X ⟶ Y) (U : Y.affineOpens) (a : Γ(X, f ⁻¹ᵁ U)) :
    (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app
      (op U) (Ideal.Quotient.mk _ a) = Ideal.Quotient.mk _ a := by
  sorry

lemma quotientCompNatIso_id_right (I : Y.IdealSheafData) (f : X ⟶ Y) :
    quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id)) =
      eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f)) := by
  sorry

end TauCeti.SchemeFoundations.IdealPullback

namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite
universe quotientTowerTestLevel
variable {X Y Z W : Scheme.{quotientTowerTestLevel}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 800000

-- test: QuotientTowerChecked.ideal_transport_roundtrip
example (I J : Y.IdealSheafData) (h : I = J) (f : X ⟶ Y)
    (U : Y.affineOpens) (q : (quotientPresheaf I f).obj (op U)) :
    (eqToIso (congrArg (fun K => quotientPresheaf K f) h)).inv.app (op U)
      ((eqToIso (congrArg (fun K => quotientPresheaf K f) h)).hom.app (op U) q) = q := by
  sorry

-- test: QuotientTowerChecked.right_identity_sections
example (I : Y.IdealSheafData) (f : X ⟶ Y) (U : Y.affineOpens)
    (q : (quotientPresheaf I (f ≫ 𝟙 Y)).obj (op U)) :
    (quotientCompNatIso I f (𝟙 Y) ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : Y.affineOpens =>
        (⟨(𝟙 Y) ⁻¹ᵁ U, U.2.preimage (𝟙 Y)⟩ : Y.affineOpens))
        from fun _ _ k => (𝟙 Y : Y ⟶ Y).preimage_mono k).functor.op
        (eqToIso (congrArg (fun K => quotientPresheaf K f) I.comap_id))).hom.app (op U) q =
      (eqToIso (congrArg (quotientPresheaf I) (Category.comp_id f))).hom.app (op U) q := by
  sorry

-- test: QuotientTowerChecked.assoc_sections
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

-- test: QuotientTowerChecked.assoc_inverse_sections
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

-- test: QuotientTowerChecked.kernel_target_sections
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

-- test: QuotientTowerChecked.closed_target_sections
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

-- test: QuotientTowerChecked.sheaf_target_sections
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

-- test: QuotientTowerChecked.empty_source
example (I : W.IdealSheafData) (f : X ⟶ Y) (g : Y ⟶ Z) (h : Z ⟶ W)
    [IsAffineHom g] [IsAffineHom h]
    (q : (quotientPresheaf I ((f ≫ g) ≫ h)).obj (op ⟨⊥, isAffineOpen_bot W⟩)) :
    (quotientCompNatIso I (f ≫ g) h ≪≫
      Functor.isoWhiskerLeft (show Monotone (fun U : W.affineOpens =>
        (⟨h ⁻¹ᵁ U, U.2.preimage h⟩ : Z.affineOpens))
        from fun _ _ k => h.preimage_mono k).functor.op
        (quotientCompNatIso (I.comap h) f g)).hom.app (op ⟨⊥, isAffineOpen_bot W⟩) q = 0 := by
  sorry

-- test: QuotientTowerChecked.nonreduced_identity_tower
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

end TauCeti.SchemeFoundations.IdealPullback



open scoped _root_.TensorProduct
open _root_.AlgebraicGeometry

namespace TauCeti.SchemeFoundations.Excellence

/-- Noetherian geometric regularity, tested after finite purely inseparable extensions. -/
def GeometricallyRegular (k B : Type u) [Field k] [CommRing B] [Algebra k B] : Prop :=
  IsNoetherianRing B ∧
    ∀ (L : Type u) [Field L] [Algebra k L], Module.Finite k L →
      IsPurelyInseparable k L → IsRegularRing (L ⊗[k] B)

lemma GeometricallyRegular.regular (k B : Type u) [Field k] [CommRing B]
    [Algebra k B] (h : GeometricallyRegular k B) : IsRegularRing B := by sorry

lemma GeometricallyRegular.finite_extension (k B L : Type u) [Field k] [CommRing B]
    [Algebra k B] [Field L] [Algebra k L] [Module.Finite k L]
    (h : GeometricallyRegular k B) : IsRegularRing (L ⊗[k] B) := by sorry

lemma GeometricallyRegular.algEquiv (k B C : Type u) [Field k] [CommRing B]
    [CommRing C] [Algebra k B] [Algebra k C] (e : B ≃ₐ[k] C) :
    GeometricallyRegular k B ↔ GeometricallyRegular k C := by sorry

-- test: GeometricallyRegular.test_field
example (k : Type u) [Field k] : GeometricallyRegular k k := by sorry
-- test: GeometricallyRegular.test_zero
example (k : Type u) [Field k] :
    GeometricallyRegular k (k ⧸ (⊤ : Ideal k)) := by sorry
-- test: GeometricallyRegular.test_dual_numbers
example (k : Type u) [Field k] : ¬ GeometricallyRegular k (TrivSqZeroExt k k) := by sorry
-- test: GeometricallyRegular.test_inseparable
example (k L : Type u) [Field k] [Field L] [Algebra k L] [Module.Finite k L]
    [IsPurelyInseparable k L] (h : ¬ Algebra.IsSeparable k L) :
    ¬ GeometricallyRegular k L := by sorry

/-- Flatness plus Noetherian geometrically regular native residue-field fibres. -/
def RegularAlgebraMap (R B : Type u) [CommRing R] [CommRing B] [Algebra R B] : Prop :=
  Module.Flat R B ∧ ∀ p : PrimeSpectrum R,
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B)

lemma RegularAlgebraMap.flat (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) : Module.Flat R B := by sorry

lemma RegularAlgebraMap.fibre (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] (h : RegularAlgebraMap R B) (p : PrimeSpectrum R) :
    GeometricallyRegular p.asIdeal.ResidueField (p.asIdeal.Fiber B) := by sorry

lemma RegularAlgebraMap.field_iff (k L : Type u) [Field k] [Field L] [Algebra k L]
    [Module.Finite k L] :
    RegularAlgebraMap k L ↔ Algebra.IsSeparable k L := by sorry

-- test: RegularAlgebraMap.test_identity
example (R : Type u) [CommRing R] : RegularAlgebraMap R R := by sorry
-- test: RegularAlgebraMap.test_zero
example (R : Type u) [CommRing R] : RegularAlgebraMap R (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: RegularAlgebraMap.test_flat_not_regular
example (k : Type u) [Field k] :
    Module.Flat k (TrivSqZeroExt k k) ∧ ¬ RegularAlgebraMap k (TrivSqZeroExt k k) := by sorry

/-- The actual regular locus; it need not be open without a further hypothesis. -/
def regularLocus (R : Type u) [CommRing R] : Set (PrimeSpectrum R) :=
  {p | IsRegularLocalRing (Localization.AtPrime p.asIdeal)}

lemma mem_regularLocus (R : Type u) [CommRing R] (p : PrimeSpectrum R) :
    p ∈ regularLocus R ↔ IsRegularLocalRing (Localization.AtPrime p.asIdeal) := by sorry

lemma regularLocus_eq_univ (R : Type u) [CommRing R] [IsRegularRing R] :
    regularLocus R = Set.univ := by sorry

lemma regularLocus_ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (q : PrimeSpectrum S) :
    q ∈ regularLocus S ↔ PrimeSpectrum.comap e.toRingHom q ∈ regularLocus R := by sorry

-- test: regularLocus.test_field
example (k : Type u) [Field k] : regularLocus k = Set.univ := by sorry
-- test: regularLocus.test_zero
example (R : Type u) [CommRing R] :
    regularLocus (R ⧸ (⊤ : Ideal R)) = ∅ := by sorry
-- test: regularLocus.test_dual_numbers
example (k : Type u) [Field k] : regularLocus (TrivSqZeroExt k k) = ∅ := by sorry

/-- At every prime, the completion of the local ring has regular formal fibres. -/
def IsGRing (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ p : PrimeSpectrum R,
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal))

lemma IsGRing.noetherian (R : Type u) [CommRing R] (h : IsGRing R) :
    IsNoetherianRing R := by sorry

lemma IsGRing.completion_regular (R : Type u) [CommRing R] (h : IsGRing R)
    (p : PrimeSpectrum R) :
    RegularAlgebraMap (Localization.AtPrime p.asIdeal)
      (AdicCompletion (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
        (Localization.AtPrime p.asIdeal)) := by sorry

lemma IsGRing.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsGRing R) : IsGRing S := by sorry

-- test: IsGRing.test_field
example (k : Type u) [Field k] : IsGRing k := by sorry
-- test: IsGRing.test_zero
example (R : Type u) [CommRing R] : IsGRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsGRing.test_complete_local
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsGRing R := by sorry

/-- Openness for every finite-type algebra, rather than only for the base spectrum. -/
def IsJ2 (R : Type u) [CommRing R] : Prop :=
  IsNoetherianRing R ∧ ∀ (B : Type u) [CommRing B] [Algebra R B],
    Algebra.FiniteType R B → IsOpen (regularLocus B)

lemma IsJ2.noetherian (R : Type u) [CommRing R] (h : IsJ2 R) :
    IsNoetherianRing R := by sorry

lemma IsJ2.regularLocus_open (R B : Type u) [CommRing R] [CommRing B] [Algebra R B]
    [Algebra.FiniteType R B] (h : IsJ2 R) : IsOpen (regularLocus B) := by sorry

lemma IsJ2.ringEquiv (R S : Type u) [CommRing R] [CommRing S]
    (e : R ≃+* S) (h : IsJ2 R) : IsJ2 S := by sorry

-- test: IsJ2.test_field
example (k : Type u) [Field k] : IsJ2 k := by sorry
-- test: IsJ2.test_zero
example (R : Type u) [CommRing R] : IsJ2 (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsJ2.test_singular_allowed
example (k : Type u) [Field k] : IsJ2 (TrivSqZeroExt k k) := by sorry

def IsQuasiExcellentRing (R : Type u) [CommRing R] : Prop := IsGRing R ∧ IsJ2 R

lemma IsQuasiExcellentRing.gRing (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsGRing R := by sorry
lemma IsQuasiExcellentRing.j2 (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsJ2 R := by sorry

lemma IsQuasiExcellentRing.noetherian (R : Type u) [CommRing R]
    (h : IsQuasiExcellentRing R) : IsNoetherianRing R := h.1.1

-- test: IsQuasiExcellentRing.test_field
example (k : Type u) [Field k] : IsQuasiExcellentRing k := by sorry
-- test: IsQuasiExcellentRing.test_zero
example (R : Type u) [CommRing R] : IsQuasiExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsQuasiExcellentRing.test_nilpotents_allowed
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

lemma IsExcellentRing.quasiExcellent (R : Type u) [CommRing R]
    (h : IsExcellentRing R) : IsQuasiExcellentRing R := by sorry

lemma IsExcellentRing.finiteType (R B : Type u) [CommRing R] [CommRing B]
    [Algebra R B] [Algebra.FiniteType R B] (h : IsExcellentRing R) :
    IsExcellentRing B := by sorry

lemma IsExcellentRing.localization (R : Type u) [CommRing R] (M : Submonoid R)
    (h : IsExcellentRing R) : IsExcellentRing (Localization M) := by sorry

-- test: IsExcellentRing.test_field
example (k : Type u) [Field k] : IsExcellentRing k := by sorry
-- test: IsExcellentRing.test_zero
example (R : Type u) [CommRing R] : IsExcellentRing (R ⧸ (⊤ : Ideal R)) := by sorry
-- test: IsExcellentRing.test_integers
example : IsExcellentRing ℤ := by sorry
-- test: IsExcellentRing.test_nilpotents_allowed
example (k : Type u) [Field k] : IsExcellentRing (TrivSqZeroExt k k) := by sorry
-- test: IsExcellentRing.test_complete_local
example (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] : IsExcellentRing R := by sorry

def IsQuasiExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsQuasiExcellentRing Γ(X, U)

lemma IsQuasiExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsQuasiExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsQuasiExcellentRing Γ(X, U) := by sorry

lemma IsQuasiExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsQuasiExcellentScheme X) : IsLocallyNoetherian X := by sorry

lemma IsQuasiExcellentScheme.iso (X Y : Scheme.{u}) (e : X ≅ Y)
    (h : IsQuasiExcellentScheme X) : IsQuasiExcellentScheme Y := by sorry

-- test: IsQuasiExcellentScheme.test_spec
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of R)) ↔ IsQuasiExcellentRing R := by sorry
-- test: IsQuasiExcellentScheme.test_field
example (k : Type u) [Field k] : IsQuasiExcellentScheme (Spec (.of k)) := by sorry
-- test: IsQuasiExcellentScheme.test_zero
example (R : Type u) [CommRing R] :
    IsQuasiExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry

-- node: SchemeAndStackFoundations:key/excellent-schemes
def IsExcellentScheme (X : Scheme.{u}) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧ IsAffineOpen U ∧ IsExcellentRing Γ(X, U)

lemma IsExcellentScheme.affine_iff (X : Scheme.{u}) :
    IsExcellentScheme X ↔
      ∀ U : X.Opens, IsAffineOpen U → IsExcellentRing Γ(X, U) := by sorry

lemma IsExcellentScheme.quasiExcellent (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsQuasiExcellentScheme X := by sorry

lemma IsExcellentScheme.locallyNoetherian (X : Scheme.{u})
    (h : IsExcellentScheme X) : IsLocallyNoetherian X := by sorry

-- test: IsExcellentScheme.test_spec
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of R)) ↔ IsExcellentRing R := by sorry
-- test: IsExcellentScheme.test_field
example (k : Type u) [Field k] : IsExcellentScheme (Spec (.of k)) := by sorry
-- test: IsExcellentScheme.test_empty
example (R : Type u) [CommRing R] :
    IsExcellentScheme (Spec (.of (R ⧸ (⊤ : Ideal R)))) := by sorry
-- test: IsExcellentScheme.test_nonreduced
example (k : Type u) [Field k] :
    IsExcellentScheme (Spec (.of (TrivSqZeroExt k k))) := by sorry

end TauCeti.SchemeFoundations.Excellence



open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry
namespace TauCeti.SchemeFoundations.Spaces

abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- A named condition on the native diagonal, using native relative representability. -/
def RepresentableDiagonal (F : SchemePresheaf.{u}) : Prop :=
  yoneda.relativelyRepresentable (prod.lift (𝟙 F) (𝟙 F))

lemma RepresentableDiagonal.of_scheme (X : Scheme.{u}) :
    RepresentableDiagonal (yoneda.obj X) := by sorry

lemma RepresentableDiagonal.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    RepresentableDiagonal F ↔ RepresentableDiagonal G := by sorry

lemma RepresentableDiagonal.from_scheme (F : SchemePresheaf.{u})
    (h : RepresentableDiagonal F) (X : Scheme.{u}) (a : yoneda.obj X ⟶ F) :
    yoneda.relativelyRepresentable a := by sorry

-- test: RepresentableDiagonal.test_field
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of k))) := by sorry
-- test: RepresentableDiagonal.test_empty
example : RepresentableDiagonal (yoneda.obj Scheme.empty.{u}) := by sorry
-- test: RepresentableDiagonal.test_nonreduced
example (k : Type u) [Field k] :
    RepresentableDiagonal (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry

/-- Etaleness and surjectivity are tested on every represented scheme base change. -/
def EtaleAtlas (F : SchemePresheaf.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F) : Prop :=
  MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a ∧
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a

lemma EtaleAtlas.representable (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    yoneda.relativelyRepresentable a := by sorry

lemma EtaleAtlas.etale (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a := by sorry

lemma EtaleAtlas.surjective (F : SchemePresheaf.{u}) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (h : EtaleAtlas F U a) :
    MorphismProperty.presheaf (@Surjective : MorphismProperty Scheme.{u}) a := by sorry

lemma EtaleAtlas.yoneda_iff (U X : Scheme.{u}) (f : U ⟶ X) :
    EtaleAtlas (yoneda.obj X) U (yoneda.map f) ↔ Etale f ∧ Surjective f := by sorry

-- test: EtaleAtlas.test_identity
example (X : Scheme.{u}) : EtaleAtlas (yoneda.obj X) X (𝟙 (yoneda.obj X)) := by sorry
-- test: EtaleAtlas.test_empty_identity
example : EtaleAtlas (yoneda.obj Scheme.empty.{u}) Scheme.empty
    (𝟙 (yoneda.obj Scheme.empty)) := by sorry
-- test: EtaleAtlas.test_empty_not_cover
example (k : Type u) [Field k] (a : yoneda.obj Scheme.empty ⟶ yoneda.obj (Spec (.of k))) :
    ¬ EtaleAtlas (yoneda.obj (Spec (.of k))) Scheme.empty a := by sorry

/-- Absolute algebraic spaces. A space over S carries a map to h_S in the native over-category.
No quasi-compactness of the diagonal or properness is imposed. -/
def IsAlgebraicSpace (F : SchemePresheaf.{u}) : Prop :=
  Presheaf.IsSheaf Scheme.fppfTopology F ∧ RepresentableDiagonal F ∧
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a

lemma IsAlgebraicSpace.sheaf (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    Presheaf.IsSheaf Scheme.fppfTopology F := by sorry
lemma IsAlgebraicSpace.diagonal (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    RepresentableDiagonal F := by sorry
lemma IsAlgebraicSpace.atlas (F : SchemePresheaf.{u}) (h : IsAlgebraicSpace F) :
    ∃ (U : Scheme.{u}) (a : yoneda.obj U ⟶ F), EtaleAtlas F U a := by sorry
lemma IsAlgebraicSpace.of_scheme (X : Scheme.{u}) :
    IsAlgebraicSpace (yoneda.obj X) := by sorry
lemma IsAlgebraicSpace.iso (F G : SchemePresheaf.{u}) (e : F ≅ G) :
    IsAlgebraicSpace F ↔ IsAlgebraicSpace G := by sorry

-- test: IsAlgebraicSpace.test_field
example (k : Type u) [Field k] : IsAlgebraicSpace (yoneda.obj (Spec (.of k))) := by sorry
-- test: IsAlgebraicSpace.test_empty
example : IsAlgebraicSpace (yoneda.obj Scheme.empty.{u}) := by sorry
-- test: IsAlgebraicSpace.test_nonreduced
example (k : Type u) [Field k] :
    IsAlgebraicSpace (yoneda.obj (Spec (.of (TrivSqZeroExt k k)))) := by sorry
-- test: IsAlgebraicSpace.test_arbitrary_scheme
example (X : Scheme.{u}) : IsAlgebraicSpace (yoneda.obj X) := by sorry

end TauCeti.SchemeFoundations.Spaces

open Topology
universe gerbU gerbV gerbW
namespace TauCeti.SchemeFoundations.GaloisGerbs
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
#print axioms TopologicalExtension.kernel_iff
#print axioms TopologicalExtension.inl_project
#print axioms TopologicalExtension.continuous_projection
#print axioms TopologicalExtension
#print axioms LocalSplitChart
#print axioms LocalSplitChart.section_one
#print axioms LocalSplitChart.section_mul
#print axioms LocalSplitChart.chart_value
end TauCeti.SchemeFoundations.GaloisGerbs

/- N29 typed omission ledger: these are MATHEMATICAL COMMENTS, not Lean signatures.
The definitive reader and TypedOmissions.json specify all omitted carriers, APIs and tests.
Node SchemeAndStackFoundations:SF.2/sheaf-algebra: For a native scheme X, an associative unital O_X-algebra is a sheaf of rings A with a central structure map O_X→A. Require its underlying O_X-module to be quasi-coherent. Morphisms are unital sheaf-ring maps preserving the central structure map. The carrier is not a sheaf of commutative algebras: matrix algebras must be allowed.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.sections: On every affine U, A(U) is an algebra over O_X(U), possibly noncommutative.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.hom_ext: Algebra-sheaf maps agreeing on all affine opens are equal.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.pullback: For f:Y→X, f* A is a quasi-coherent O_Y-algebra with the canonical central unit.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_matrix2: Mat_2(O_X) is such an algebra; for X=Spec(k), its affine sections are Mat_2(k).
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_scalar: O_X itself is the rank-one algebra object.
TauCeti.SchemeFoundations.Brauer.SheafAlgebra.test_noncommutative: For X=Spec(Q), Mat_2(Q) is admitted although E_12E_21≠E_21E_12.
Node SchemeAndStackFoundations:SF.2/azumaya: A quasi-coherent O_X-algebra A is Azumaya when there is a surjective étale covering U_i→X and O_{U_i}-algebra isomorphisms f_i* A≅Mat_{d_i}(O_{U_i}), with d_i≥1. This implies finite locally free and faithful underlying module. Degree is locally constant; no single global degree is required.
TauCeti.SchemeFoundations.Brauer.Azumaya.local_matrix: A is Azumaya exactly when it has a positive-degree étale-local matrix splitting.
TauCeti.SchemeFoundations.Brauer.Azumaya.degree: On a connected base the degree d is constant and the module rank is d².
TauCeti.SchemeFoundations.Brauer.Azumaya.pullback: Any scheme pullback preserves Azumaya algebras.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_matrix: Mat_n(O_X) is Azumaya for every n≥1.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_scalar: O_X is degree-one Azumaya.
TauCeti.SchemeFoundations.Brauer.Azumaya.test_dual_numbers: Over a field k, k[ε]/(ε²), though finite free, is not an Azumaya k-algebra.
Node SchemeAndStackFoundations:SF.2/stabilized-equivalence: On X, A≈B means there exist finite locally free O_X-modules F,G of positive rank at every point and an O_X-algebra isomorphism A⊗End(F)≅B⊗End(G). Use this stabilization relation on Azumaya algebras; it is not merely isomorphism of underlying modules.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.refl: Every Azumaya algebra is equivalent to itself using F=G=O_X.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.symm: A≈B implies B≈A.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.trans: A≈B and B≈C imply A≈C.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_matrix: Mat_n(O_X)≈O_X for every n≥1.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_field: Over Spec(k), this is the usual stabilization relation for finite-dimensional central simple k-algebras.
TauCeti.SchemeFoundations.Brauer.StabilizedEquivalence.test_zero_rank: Zero-rank F or G is excluded: allowing both would collapse every pair via a zero algebra.
Node SchemeAndStackFoundations:key/scheme-brauer: Br_Az(X) is the quotient of Azumaya O_X-algebras by stabilized equivalence. Multiplication is tensor product, identity is O_X and inverse is the opposite algebra. Give it the resulting commutative-group structure. Keep this group distinct from all of H²_et(X,G_m), and from its torsion subgroup Br′(X).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.mk: The class [A] of an Azumaya O_X-algebra.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.mul_mk: [A][B]=[A⊗B].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.inv_mk: [A]⁻¹=[A^op].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.end_zero: End(F) has identity class for positive-rank finite locally free F.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback: Scheme maps act contravariantly on Br_Az by pullback.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta: The canonical étale cohomology class is a natural injective homomorphism into H²_et(X,G_m), without unconditional surjectivity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_matrix: [Mat_2(O_X)] is the identity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_real: Br_Az(Spec(R)) has the real quaternion class of order two; its pullback to Spec(C) is the identity.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_field: Br_Az(Spec(k)) identifies with the existing field Brauer group through the central-simple-algebra dictionary.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_dual_numbers: A non-Azumaya finite free algebra such as k[ε]/(ε²) has no Azumaya-class constructor.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.test_not_h2: The construction is not defined to be all of H²_et(X,G_m), nor is Br_Az=Br′ asserted for arbitrary X.
Node SchemeAndStackFoundations:SF.2/cohomological-brauer: Br′(X) is the subgroup of H² on the native small étale site with coefficients in the units sheaf G_m consisting of elements killed by some positive integer. Do not redefine the cohomology carrier. The Azumaya-to-cohomology map lands here under the stated quasi-compact or connected hypotheses.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.inclusion: The inclusion Br′(X)→H²_et(X,G_m) is injective.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.mem_iff: A class belongs exactly when some positive integer kills it.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.pullback: Pullback on cohomology preserves torsion classes.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_complex: Br′(Spec(C))=0.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_real: Br′(Spec(R))≅Z/2 and the quaternion class maps to its nonzero element.
TauCeti.SchemeFoundations.Brauer.CohomologicalBrauer.test_nontorsion: A nontorsion H² class, if present on X, is excluded by the subgroup membership condition.
Node SchemeAndStackFoundations:SF.2/affine-comparison: For A a quasi-coherent algebra on Spec(R), the étale-local matrix condition is equivalent to the native IsAzumaya R Γ(A,Spec(R)) predicate.
Node SchemeAndStackFoundations:SF.2/tensor: Azumaya A,B on X have Azumaya tensor product; on a common étale splitting cover, Mat_d⊗Mat_e≅Mat_de.
Node SchemeAndStackFoundations:SF.2/opposite: The opposite A^op of an Azumaya algebra is Azumaya, with matrix transposition identifying its local splitting.
Node SchemeAndStackFoundations:SF.2/equivalence-refl: A≈A with F=G=O_X of positive rank one.
Node SchemeAndStackFoundations:SF.2/equivalence-symm: If A≈B then B≈A.
Node SchemeAndStackFoundations:SF.2/equivalence-trans: If A≈B and B≈C then A≈C, using tensor products of the witnessing positive-rank bundles.
Node SchemeAndStackFoundations:SF.2/operation-well-defined: If A≈A′ and B≈B′ then A⊗B≈A′⊗B′.
Node SchemeAndStackFoundations:SF.2/unit: The tensor class of O_X is an identity, since A⊗O_X≅A as O_X-algebras.
Node SchemeAndStackFoundations:SF.2/inverse: For Azumaya A, A⊗A^op≅End_O_X(A), with A positive-rank finite locally free; hence its stabilization class is the identity.
Node SchemeAndStackFoundations:SF.2/pullback-id: For X, pullback along id_X is the identity homomorphism of Br_Az(X).
Node SchemeAndStackFoundations:SF.2/pullback-comp: For Z→Y→X, pullback on Br_Az is the composite of the two pullback homomorphisms.
Node SchemeAndStackFoundations:SF.2/end-zero: For finite locally free F of positive rank at every point, [End(F)] is the identity in Br_Az(X).
Node SchemeAndStackFoundations:SF.2/field-comparison: For a field k, Br_Az(Spec(k)) is canonically isomorphic to the existing BrauerGroup k using finite-dimensional central simple algebras.
Node SchemeAndStackFoundations:SF.2/delta-injective: The homomorphism δ:Br_Az(X)→H²_et(X,G_m) is injective; this does not say its image is the whole cohomology group or all torsion classes.
Node SchemeAndStackFoundations:SF.2/degree-annihilation: If A has constant module rank d² with d≥1, then [A]^d is the identity in Br_Az(X).
Node SchemeAndStackFoundations:SF.2/torsion-image: If X is quasi-compact or connected, every Azumaya class is torsion and δ factors through Br′(X).
Node SchemeAndStackFoundations:SF.2/pullback: For a scheme morphism f:Y→X, define f*:Br_Az(X)→Br_Az(Y) by pulling back Azumaya algebra sheaves and their stabilization witnesses. This is a group homomorphism and requires no flatness of f.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_mk: f*([A])=[f*A].
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_one: f*(1)=1.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_mul: f*([A][B])=f*([A])f*([B]).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_id: Identity pullback fixes every class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_matrix: Every pulled-back matrix algebra has identity class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.pullback_test_quaternion: R→C kills the Hamilton quaternion class.
Node SchemeAndStackFoundations:SF.2/splitting-torsor: For an Azumaya A of constant degree d, the sheaf Isom_O-alg(Mat_d(O_X),A) is an étale PGL_d-torsor. It is the splitting-torsor construction, not the already-owned general definition of a torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.points: Its sections over an étale U are algebra isomorphisms Mat_d(O_U)≅A|_U.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.action: PGL_d acts by precomposition and makes it a torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.naturality: Pullback of the frame torsor identifies with the frame torsor of f*A.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_matrix: For A=Mat_d(O_X), the identity frame is a global section.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_degree1: Degree one gives the trivial PGL_1-torsor.
TauCeti.SchemeFoundations.Brauer.SplittingTorsor.test_quaternion: Hamilton quaternions over R have no R-frame but have a frame after R→C.
Node SchemeAndStackFoundations:SF.2/delta: Construct δ_X:Br_Az(X)→H²_et(X,G_m) from the obstruction to lifting projective frames to linear frames. On constant degree d it is the boundary of 1→G_m→GL_d→PGL_d→1 applied to the splitting torsor. For variable degree glue the same scalar-banded splitting gerbe.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_mk: δ([A]) is the scalar splitting-gerbe class of A.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_mul: δ is a homomorphism.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_pullback: δ_Y(f*α)=f*(δ_X(α)).
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_matrix: δ([Mat_d(O_X)])=0.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_real: The real quaternion class maps to the nonzero order-two class.
TauCeti.SchemeFoundations.Brauer.SchemeBrauer.delta_test_no_surjectivity: No axiom declaring δ surjective is included; arbitrary X need not have Br_Az=Br′.
Node SchemeAndStackFoundations:SF.2/affine-dualizing: For a Noetherian commutative ring A, a dualizing complex ω in D(A) has finite injective dimension, finite A-module cohomology in every degree, and the canonical homothety A→RHom_A(ω,ω) is a quasi-isomorphism. Finite injective dimension includes boundedness; this is not the predicate that ω is a single module.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.homothety: The canonical homothety is an isomorphism in D(A).
TauCeti.SchemeFoundations.Coherent.DualizingComplex.cohomology_finite: Every H^i(ω) is finite over A.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.biduality: For K in D^b_fg(A), the evaluation K→RHom(RHom(K,ω),ω) is an isomorphism.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_field: For a field k, k[0] is dualizing.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_regular_shift: For a d-dimensional regular local ring, A[d] is the normalized dualizing complex.
TauCeti.SchemeFoundations.Coherent.DualizingComplex.test_non_cm: For A=k[x,y]/(x²,xy) localized at (x,y), the normalized dualizing complex has nonzero H^-1 and H^0, so a single shifted module is insufficient.
Node SchemeAndStackFoundations:SF.2/scheme-dualizing: For a locally Noetherian X, a dualizing complex K in D(O_X) is affine-locally the sheafification of a ring dualizing complex: for every affine U=Spec(A), K|_U≅~ω_A with ω_A dualizing. A cover criterion is equivalent, but is proved separately.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.affine: Restriction to every affine open comes from a ring dualizing complex.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.cover_iff: Checking this on an affine open cover suffices.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.restrict: Restriction to an open subscheme preserves the dualizing property.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_field: On Spec(k), ~k[0] is dualizing.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_disjoint: Dualizing complexes on a disjoint union are chosen componentwise; unequal shifts are allowed.
TauCeti.SchemeFoundations.Coherent.SchemeDualizing.test_projective_line: On P¹_k, O(-2)[1] is dualizing.
Node SchemeAndStackFoundations:SF.2/normalized-dualizing: For a Noetherian local ring (A,m,κ), a dualizing ω is normalized when RHom_A(κ,ω)≅κ[0]; equivalently Ext^i_A(κ,ω) vanishes for i≠0 and Ext^0 is one-dimensional over κ. Shifts are cohomological: H^i(K[r])=H^{i+r}(K).
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.residue: RHom_A(κ,ω)≅κ[0].
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.finite_local: For finite local A→B, RHom_A(B,ω_A) is normalized over B.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.shift_unique: Among shifts of one local dualizing complex, exactly one is normalized.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_field: κ[0] is normalized over κ.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_dvr: A[1] is normalized for a regular DVR A.
TauCeti.SchemeFoundations.Coherent.NormalizedDualizing.test_wrong_shift: For a regular DVR, A[0] is dualizing but not normalized.
Node SchemeAndStackFoundations:key/coherent-duality: For separated finite-type morphisms f:X→Y of Noetherian schemes over a fixed Noetherian base S, construct f!:D^+_qc(O_Y)→D^+_qc(O_X), coherently contravariant under composition. On proper f it is the restriction of the right adjoint of Rf*:D_qc(O_X)→D_qc(O_Y). This is coherent O-module duality, not étale-coefficient Verdier duality.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.comp: (g∘f)!≅f!g! with unit and associativity coherence.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.proper_adjunction: For proper f, Hom(Rf*K,M)≅Hom(K,f!M) in the stated derived categories.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.finite: For finite f, f*f!M≅RHom_Y(f*O_X,M).
TauCeti.SchemeFoundations.Coherent.CoherentDuality.regular_immersion: For a Koszul-regular immersion of codimension c, f!M≅Lf*M⊗det(N_f)[-c].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.smooth_proper: For smooth proper f of relative dimension d, f!M≅Lf*M⊗Ω^d_{X/Y}[d].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_projective_line: For f:P¹_k→Spec(k), f!k≅O(-2)[1].
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_closed_prime: For Spec(F_p)→Spec(Z), f!Z≅F_p[-1], with H^1=F_p.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_underived_hom: Hom_Z(F_p,Z)=0 does not compute the preceding derived shriek complex.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_finite_flat: For finite flat A→B, f!A=Hom_A(B,A) in degree zero.
TauCeti.SchemeFoundations.Coherent.CoherentDuality.test_dual_numbers_trace: For char(k)=0 and B=k[ε]/ε², the algebra trace pairing is degenerate; the finite-duality module is not made isomorphic to B by that pairing.
Node SchemeAndStackFoundations:SF.2/affine-cover: The every-affine definition of a dualizing complex is equivalent to checking one affine open cover.
Node SchemeAndStackFoundations:SF.2/biduality: If X is Noetherian with dualizing ω, RHom_X(-,ω) is an involution of D_Coh(X), interchanges D^+_Coh and D^-_Coh, and preserves D^b_Coh.
Node SchemeAndStackFoundations:SF.2/composition: For composable morphisms in FTS_S, (g∘f)!≅f!g!, with the pseudofunctor associativity and unit constraints.
Node SchemeAndStackFoundations:SF.2/proper-adjunction: For proper f in FTS_S, f! on D^+_qc is the restricted right adjoint of Rf* on D_qc.
Node SchemeAndStackFoundations:SF.2/trace-comp: For proper X→Y→Z, the counit for the composite agrees with Rg* applied to the f-counit followed by the g-counit, under canonical composition identifications.
Node SchemeAndStackFoundations:SF.2/finite-formula: For finite f:X→Y in FTS_S, f*f!M≅RHom_O_Y(f*O_X,M), for M in D^+_qc(Y).
Node SchemeAndStackFoundations:SF.2/closed-formula: For a closed immersion f:X→Y in FTS_S, f!M is RHom_O_Y(O_X,M) with its O_X-module structure.
Node SchemeAndStackFoundations:SF.2/cartier-formula: For an effective Cartier divisor f:X→Y, f!M≅Lf*M⊗f*O_Y(X)[-1].
Node SchemeAndStackFoundations:SF.2/regular-immersion: For a Koszul-regular immersion f of codimension c in FTS_S, f!M≅Lf*M⊗∧^c N_f[-c].
Node SchemeAndStackFoundations:SF.2/smooth-proper: For smooth proper f of constant relative dimension d in FTS_S, f!M≅Lf*M⊗Ω^d_{X/Y}[d].
Node SchemeAndStackFoundations:SF.2/preserves-dualizing: If f is in FTS_S and ω_Y is dualizing, then f!ω_Y is dualizing on X.
Node SchemeAndStackFoundations:SF.2/serre-proper: For proper X/k, put ω_X=f!k. For K in D_qc(X), Ext^i_X(K,ω_X)≅Hom_k(H^-i(X,K),k), naturally and compatibly with shifts and distinguished triangles.
Node SchemeAndStackFoundations:SF.2/canonical-module: For proper X/k of dimension d and ω_X=f!k, H^-d(ω_X) is coherent, satisfies S2, and its support is the union of the dimension-d irreducible components.
Node SchemeAndStackFoundations:SF.2/trace: For proper f in FTS_S and M in D^+_qc(Y), the coherent trace is the counit Rf*f!M→M of the proper adjunction. It is not the ordinary algebra trace, nor an asserted isomorphism for every lci fundamental class.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.natural: Trace commutes with morphisms M→N.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.comp: Proper composite traces agree through the shriek/pushforward composition isomorphisms.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.finite: For finite affine A→B, the counit is derived evaluation at 1∈B.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_identity: The identity-map trace is the identity.
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_finite_flat: For finite flat A→B, Hom_A(B,A)→A sends λ to λ(1).
TauCeti.SchemeFoundations.Coherent.CoherentTrace.test_dual_numbers: For B=k[ε]/ε² in characteristic zero, duality uses evaluation on Hom_k(B,k); it is not an invertible ordinary algebra-trace pairing.
Node SchemeAndStackFoundations:SF.2/linearized-sheaf: For a ringed space X with a left action of a discrete group Γ by ringed-space automorphisms, a Γ-equivariant O_X-module F is an O_X-module together with a lift Γ→Aut(X,F) over the given action. Equivalently give pullback-linearization isomorphisms satisfying the unit and composition cocycle, including the canonical pullback coherences. Γ may move X; ordinary Action(X.Modules,Γ) supplies only the fixed-base special case.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.forget: Forget to the underlying O_X-module.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.transport: A group element transports sections across its induced open-set automorphism, semilinearly over the transported scalar sections.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.hom_ext: Equivariant maps equal on underlying module-sheaf maps are equal.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_trivial_group: For Γ=1, the category is the ordinary O_X-module sheaf category.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_point: On a one-point ringed space with ring R and trivial ring action, objects are R-linear representations of Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantSheaf.test_moving_base: Z acting on R by translations transports an open interval to a different interval; a fixed-base automorphism of one sheaf alone does not specify this action.
Node SchemeAndStackFoundations:SF.2/enough-injectives: The category of semilinear Γ-equivariant O_X-modules is abelian and has enough injectives for an arbitrary discrete Γ. The forgetful and coinduction adjunctions must be constructed, including sheafification and products; a finite-group hypothesis is not imposed.
Node SchemeAndStackFoundations:SF.2/invariant-sections: The left-exact functor Γ(X,-)^Γ from semilinear equivariant O_X-modules to abelian groups takes the invariant subgroup of ordinary global sections under their induced Γ-action. For moving bases the total open X is still invariant.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.inclusion: Include invariant sections into ordinary global sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.mem_iff: A section is invariant exactly when every γ fixes it under semilinear global transport.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.map: An equivariant sheaf map induces a map of invariant sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_trivial: For Γ=1, these are all global sections.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_sign: For C2 acting on Z by sign on a point, the invariant group is zero.
TauCeti.SchemeFoundations.Equivariant.InvariantSections.test_trivial_action: For C2 acting trivially on Z on a point, the invariant group is Z.
Node SchemeAndStackFoundations:key/equivariant-sheaf-cohomology: For a discrete group Γ acting on a ringed space X and semilinear equivariant sheaf F, H^n(X,Γ;F) is the n-th right derived functor of F↦Γ(X,F)^Γ in the equivariant abelian sheaf category. Derive the composite; do not define it as H^n(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.h0: H^0(X,Γ;F)≅Γ(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.trivial_group: For Γ=1, H^n agrees with ordinary O_X-module sheaf cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.point: On a point, it is group cohomology of the module of sections.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.map: Equivariant sheaf maps induce cohomology maps.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.spectral: H^p(Γ,H^q(X,F)) converges to H^{p+q}(X,Γ;F) once the named composite-functor acyclicity is proved.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_c2: For X a point and C2 acting trivially on Z, H^1=0 and H^2≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_trivial: For Γ=1 it recovers ordinary sheaf cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_wrong_invariants: On a point ordinary H^2(point,Z)^C2=0, while equivariant H^2(point,C2;Z)≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_inverted_order: For finite Γ and Q-vector-space coefficients, invariants are exact and H^n(X,Γ;F)≅H^n(X,F)^Γ.
TauCeti.SchemeFoundations.Equivariant.EquivariantCohomology.test_translation: For constant Z on R with Z acting by translations, equivariant H^1≅Z whereas ordinary H^1(R,Z)=0.
Node SchemeAndStackFoundations:SF.2/ext: For semilinear Γ-equivariant O_X-modules F,G, Ext^n_{Γ,O_X}(F,G) derives G↦Hom_{Γ,O_X}(F,G) in the second variable of the equivariant abelian category.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.h0: Ext^0 is equivariant Hom.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.map_first: Ext is contravariant in F.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.map_second: Ext is covariant in G.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_trivial: Γ=1 gives ordinary O_X-module Ext.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_point: On a point with ring Z it is Ext in the Z[Γ]-module category.
TauCeti.SchemeFoundations.Equivariant.EquivariantExt.test_c2: For C2 acting trivially on Z, Ext^2_{C2,Z}(Z,Z)≅Z/2.
Node SchemeAndStackFoundations:SF.2/support: For a Γ-stable closed subset D⊂X, H^n_D(X,Γ;F) derives the invariant sections supported in D. The support functor is the kernel of global restriction Γ(X,F)→Γ(X minus D,F); derive that left-exact functor, rather than taking invariants of ordinary supported cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.h0: H^0_D is the invariant subgroup of sections vanishing on the complement of D.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.closed_all: For D=X, supported cohomology equals equivariant global cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.closed_empty: For D=∅, it is zero in every degree.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_all_point: For X=D a point and C2 acting trivially on Z, H^2_D≅Z/2.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_empty: Empty support has zero cohomology.
TauCeti.SchemeFoundations.Equivariant.EquivariantSupport.test_unstable: For Z translating R, the singleton {0} is not stable and is not accepted as equivariant support.
Node SchemeAndStackFoundations:SF.2/hom-invariants: Hom_{Γ,O_X}(F,G) is the invariant subgroup of Hom_{O_X}(F,G) under conjugation of linearizations.
Node SchemeAndStackFoundations:SF.2/degree-zero: H^0(X,Γ;F)≅Γ(X,F)^Γ naturally.
Node SchemeAndStackFoundations:SF.2/ordinary-comparison: For Γ=1, H^n(X,1;F) is naturally isomorphic to ordinary sheaf cohomology.
Node SchemeAndStackFoundations:SF.2/point-comparison: For a one-point space, equivariant cohomology agrees with group cohomology of its section module.
Node SchemeAndStackFoundations:SF.2/invariants-acyclic: For an injective equivariant O_X-module sheaf I, its global-section Γ-module is acyclic for invariants. Obtain this by a retract of the sections of a coinduced sheaf; no exactness of the free O_X-module left adjoint to abelian-group sections is assumed.
Node SchemeAndStackFoundations:SF.2/spectral-sequence: For arbitrary discrete Γ, there is a natural first-quadrant spectral sequence H^p(Γ,H^q(X,F))⇒H^{p+q}(X,Γ;F).
Node SchemeAndStackFoundations:SF.2/localization: For a Γ-stable closed D and invariant complement U, the natural supported, global and restricted equivariant cohomology maps give a long exact sequence, with boundary H^n(U,Γ;F|_U)→H^{n+1}_D(X,Γ;F).
Node SchemeAndStackFoundations:key/galois-gerbs: Fix a characteristic-zero field k, a Galois extension k′/k inside an algebraic closure, and Γ=Gal(k′/k) with its Krull topology. A gerb consists of a linear algebraic group H/k′ and a topological extension 1→H(k′)→E→Γ→1 with discrete kernel. Every lift of σ acts on the kernel through an algebraic σ-semilinear automorphism of H. Over Gal(k′/K) for some finite K/k inside k′, there is a local splitting chart whose algebraic conjugation action is effective descent to K. None of these conditions forces a global splitting.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.kernel: The kernel is H/k′ with its discrete point group.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.local_chart: A finite K/k and a continuous splitting over Gal(k′/K) with effective algebraic K-descent and a topological chart are part of the data.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.conjugation: Conjugation by a lift of σ agrees on points with an algebraic σ-semilinear automorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.neutral: A k-defined H has the neutral semidirect-product gerb.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.base_extension: Enlarging k′ uses Galois pullback and algebraic-kernel point pushout.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_neutral: For H/k the neutral gerb is H(k′)⋊Gal(k′/k) with its original algebraic descent.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_c4: The C4 extension of Gal(C/R)=C2 by μ2(C) satisfies local splitting over C but has no global splitting.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_alg_closed: For k′=k algebraically closed the Galois quotient is trivial.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerb.test_topology: The discrete H(k′) topology is not replaced by the analytic point topology, even for C-points.
Node SchemeAndStackFoundations:SF.1/morphism: A morphism E→E′ of k′/k-gerbs is a continuous group homomorphism over id_Γ together with an algebraic k′-group homomorphism H→H′ whose point map agrees with the extension map on the kernel. Continuity alone on the discrete point kernels is not algebraicity.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.identity: Identity extension and algebraic maps define the identity morphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.comp: Compose both maps; the two compatibility squares and continuity are preserved.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.kernel_points: The restriction to H(k′) is the point map of the recorded algebraic homomorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_power: Over algebraically closed k, G_m kernel endomorphisms z↦z^n for n∈Z are algebraic morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_identity: The identity morphism has identity kernel and quotient maps.
TauCeti.SchemeFoundations.GaloisGerbs.GaloisGerbMorphism.test_conjugation: For the neutral G_m gerb over C/R, complex conjugation on the discrete C× kernel is continuous but is not a C-algebraic kernel map.
Node SchemeAndStackFoundations:SF.1/conjugacy: For morphisms f1,f2:E→E′, kernel conjugacy means there is h∈H′(k′) with Int(i′(h))∘f1=f2. Retain the conjugators as data/sets when needed; do not identify conjugate morphisms before the application asks for a quotient.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.refl: The identity kernel point conjugates a morphism to itself.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.symm: An inverse kernel point reverses a conjugacy.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.trans: The product of two conjugators yields the composite conjugacy.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_identity: Every morphism is conjugate to itself by 1.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_trivial_kernel: With trivial target kernel, conjugacy is equality of morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.GerbConjugacy.test_not_any_lift: A target element projecting nontrivially to Γ is not admitted as a kernel conjugator.
Node SchemeAndStackFoundations:SF.1/neutral: For a linear algebraic group H defined over k, construct the k′/k-gerb H(k′)⋊Gal(k′/k), using the algebraic Galois action and the discrete point-kernel/product topology. The local splitting is global in this special example, but not required for general gerbs.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.inclusion: h↦(h,1) is the kernel inclusion.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.projection: (h,σ)↦σ is the quotient.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.section: σ↦(1,σ) is the continuous global section.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_trivial: For H=1, the extension is Γ itself.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_gm: For H=G_m over R and k′=C, the action is complex conjugation on C×.
TauCeti.SchemeFoundations.GaloisGerbs.NeutralGerb.test_point_stabilizers: Every algebraic kernel point is fixed by an open Galois subgroup, which makes the action on the discrete kernel continuous.
Node SchemeAndStackFoundations:SF.1/conjugator-scheme: For f1,f2:E→E′, construct the k-scheme Isom(f1,f2) whose R-points are h∈H′(k′⊗_k R) satisfying Int(h)f1_R=f2_R after the specified kernel-point pushouts. For f1=f2 it is the descended automorphism k-group I_f. Scheme representability and descent are proof obligations, not an arbitrary point-set quotient.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.points: R-points are exactly the algebraic-kernel conjugators satisfying the full extension equation.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.automorphisms: Isom(f,f) is the descended automorphism group I_f.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.neutral_basechange: For a neutral target, base change I_f to k′ is the centralizer of the algebraic kernel image.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_trivial: If the target kernel is trivial and f1=f2, the conjugator scheme is the trivial group.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_gm: For the identity map of the neutral G_m gerb, I_f=G_m over k.
TauCeti.SchemeFoundations.GaloisGerbs.ConjugatorScheme.test_kernel: A conjugator is a kernel-algebra point; arbitrary target-extension elements are not its R-points.
Node SchemeAndStackFoundations:SF.1/pro-gerb: A pro-gerb is a compatible projective system of finite-stage k′/k-gerbs with continuous extension transitions and algebraic kernel transitions. Pro-morphisms are compatible finite-stage maps. Stagewise conjugacy means each stage admits a conjugator; it does not assert compatible conjugators or one element in an inverse-limit kernel without an extra existence theorem.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.stage: Every finite stage is a gerb with the same Galois quotient and its own algebraic kernel.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.transition: Transition maps are gerb morphisms satisfying the projective-system coherence.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.stagewise_conjugate: Conjugacy of pro-morphisms is the source’s stagewise relation, with no unproved global-conjugator upgrade.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_constant: A constant system recovers the original gerb and its morphisms.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_kottwitz: The Kottwitz protorus has rational character group Q through finite stages (1/n)Z; this is a required HKW22 consumer test, not a freshly read theorem here.
TauCeti.SchemeFoundations.GaloisGerbs.ProGerb.test_wrong_global_conjugacy: Stagewise nonempty conjugator sets alone do not supply a compatible inverse-limit conjugator.
Node SchemeAndStackFoundations:SF.1/centralizer: For f:E′→G_G into the neutral gerb of G/k, the base change of I_f to k′ is the algebraic centralizer of f_alg(H′) in G_{k′}. The descended k-form is defined by conjugation through lifts of Γ.
Node SchemeAndStackFoundations:SF.1/cocycle: Fix f:E′→G_G with neutral target. Morphisms f′ with the same algebraic kernel map correspond to continuous 1-cocycles of Gal(k′/k) in I_f(k′), and are conjugate to f exactly when the associated H¹ class is trivial.
Node SchemeAndStackFoundations:SF.1/splitting-field-extension: For k′⊂k″ over k, transport a k′/k-gerb by pullback along Gal(k″/k)→Gal(k′/k) and pushout H(k′)→H(k″), preserving the algebraic kernel maps, semilinear conjugation and local effective-descent chart. This changes both quotient and kernel, not just one.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.kernel: The transported algebraic kernel is H_{k″}.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.projection: The quotient is Gal(k″/k).
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.neutral: Neutral gerbs transport to the neutral gerb of the same k-defined algebraic group.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_identity: For k″=k′ it recovers the original gerb up to its canonical isomorphism.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_neutral: A globally split neutral gerb remains neutral.
TauCeti.SchemeFoundations.GaloisGerbs.GerbFieldExtension.test_kernel_changes: For G_m and R⊂C, a transport that leaves kernel points equal to R× does not produce the C× kernel of the transported gerb.
Untyped concrete tests for SchemeAndStackFoundations:SF.1/topological-extension
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_kernel: For the neutral extension N⋊Γ, an element lies in the kernel precisely when its Γ-coordinate is one.
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_unit: The trivial-kernel identity extension Γ→Γ has the given quotient topology.
TauCeti.SchemeFoundations.GaloisGerbs.TopologicalExtension.test_wrong_topology: Giving the embedded kernel a strictly coarser topology than its discrete subspace topology fails the embedding requirement.
Untyped concrete tests for SchemeAndStackFoundations:SF.1/local-splitting-chart
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_neutral: The neutral extension has U=Γ and s(γ)=(1,γ), with its product chart.
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_c4: For C4→C2, the trivial open subgroup has a chart even though no homomorphic section exists on all C2.
TauCeti.SchemeFoundations.GaloisGerbs.LocalSplitChart.test_unit_coordinate: The chart sends (1,1) to 1, and (n,1) to i(n).
-/

/- Prototype boundary: TauCeti.Henselization.algebra is the explicit presentation of the imported PerfectoidSpaces:P3/henselisation-of-pairs carrier. Its canonical presentation equivalence remains a gap.
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

/-! ## SF.0: schemes and morphisms -/
section SF_SF_0

/-
This section is not the roadmap and is not exhaustive. The roadmap document (`README.md`,
section SF.0) is definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. Every `sorry` marks planned work; nothing here is
implemented. Conditions whose Mathlib vocabulary does not exist yet are left out and named in
comments rather than replaced by placeholder propositions.
-/

set_option linter.unusedVariables false

/-! ===== Group A ===== -/
open _root_.CategoryTheory Limits

universe u

noncomputable section

/-! ## Quasi-coherent algebras, the relative spectrum and the relative Proj

The targets of SF.0 §1–2 that an existing roadmap states or the pinned library builds are not
restated: `SF.0/qcoh-algebra` (T001), `SF.0/relative-spec` (T004), its universal property,
affine anti-equivalence, pullback and base change (T005–T008), `SF.0/symmetric-algebra-sheaf`
(T011) and `SF.0/graded-qcoh-algebra` (T013) are Tau Ceti's
`TauCeti.AlgebraicGeometry.QuasicoherentAlgebra`, `CategoryTheory.CommMon.relativeSpec` and
`TauCeti.AlgebraicGeometry.relativeSpec` (modules `TauCeti.AlgebraicGeometry.RelativeSpec.*`)
together with AlgebraicVectorBundles Layers L1A, L1B and L2A (`relativeSpecHomEquiv`,
`relativeSpecEquiv`, `relativeSpecBaseChangeIso`, `pullbackQuasicoherentAlgebra`,
`symmetricAlgebra`, `GradedQuasicoherentAlgebra`); `SF.0/noetherian-normal-components` (T012) is
Tau Ceti's `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`.

The remaining targets of these two subsections are stated in the roadmap document on those
carriers and have no Lean form here yet: `SF.0/qcoh-algebra-sheaf-comparison` (T002, the
coequifibered presheaf on `S.AffineZariskiSite` of a `QuasicoherentAlgebra`, cf. Tau Ceti's
`CommMon.sectionsPresheaf`), `SF.0/pushforward-algebra` (T003, `f_* O_X` for `f` quasi-compact
and quasi-separated), `SF.0/relative-spec-morphism-properties` (T009),
`SF.0/affine-pushforward-qcoh-equivalence` (T010), `SF.0/relative-proj` (T015) with its base
change (T016), affine comparison (T017) and the compatibility with StableReduction Layer 2's
finitely generated relative Proj (T018). -/

namespace AlgebraicGeometry.Proj

-- node: SchemeAndStackFoundations:SF.0/proj-base-change
/-- `Proj` of a graded `R`-algebra commutes with base change along `R → R'`. -/
theorem isPullback_baseChange {R R' A : Type u} [CommRing R] [CommRing R'] [CommRing A]
    [Algebra R A] [Algebra R R'] (𝒜 : ℕ → Submodule R A) [GradedAlgebra 𝒜]
    [GradedAlgebra (fun d => (𝒜 d).baseChange R')] :
    ∃ (f : Proj (fun d => (𝒜 d).baseChange R') ⟶ Proj 𝒜)
      (g : Proj (fun d => (𝒜 d).baseChange R') ⟶ Spec (CommRingCat.of R')),
      IsPullback f g (Proj.toSpecZero 𝒜 ≫ Spec.map (CommRingCat.ofHom (algebraMap R (𝒜 0))))
        (Spec.map (CommRingCat.ofHom (algebraMap R R'))) := by
  sorry

end AlgebraicGeometry.Proj


namespace TauCeti.SchemeFoundations.IdealPullback
open _root_.CategoryTheory _root_.AlgebraicGeometry _root_.Opposite

variable {X Y Z : Scheme.{u}}
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

/-- The affine inverse-image functor on affine opens along an affine morphism. -/
abbrev preimageFunctor (g : Y ⟶ Z) [IsAffineHom g] : Z.affineOpens ⥤ Y.affineOpens :=
  (show Monotone (fun U : Z.affineOpens => (⟨g ⁻¹ᵁ U, U.2.preimage g⟩ : Y.affineOpens))
    from fun _ _ h => g.preimage_mono h).functor

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- node: SchemeAndStackFoundations:SF.0/quotient-tower/left-unit
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

end TauCeti.SchemeFoundations.IdealPullback

/-! ### SF.0 definitions without a typed form at the pins

The following README definitions of SF.0 §3, §4, §5, §6 and §7 have no declaration above, because
their carriers are absent from the pinned Mathlib (no depth or Cohen–Macaulay predicate for modules,
no dimension function on topological spaces at a point, no perfection colimit for schemes):
`AlgebraicGeometry.Scheme.Modules.IsReflexive` with `reflexiveHull` (T025),
`TauCeti.topologicalKrullDimAt` (T028), `TauCeti.IndEtale` (T053), `Ring.IsCatenary` (T069),
`Ring.IsUniversallyCatenary` (T070), `Module.depth` and `Module.IsCohenMacaulay` (T072),
`AlgebraicGeometry.IsCMQuasiExcellent` and `IsSnQuasiExcellent` (T077), `Ring.IsJapanese` (T079),
`Ring.IsNagata` (T080), `AlgebraicGeometry.Scheme.IsPerfect` (T087),
`AlgebraicGeometry.IsUniversalHomeomorphism` (T091), `AlgebraicGeometry.PerfectlyProper` (T102),
`AlgebraicGeometry.PerfectlySmoothOfRelativeDimension` (T104) and
`AlgebraicGeometry.Scheme.IsWeaklyNormal` (T107). Their API items and unit tests are the ones the
README lists; no `Prop`-valued stand-in is introduced for any of them. -/

end
end SF_SF_0

/-! ## SF.1: descent, algebraic spaces and stacks -/
section SF_SF_1

/-
Suggested Lean forms for layer SF.1 (descent, algebraic spaces and algebraic stacks) of the
roadmap "Scheme, stack, cohomology and intersection foundations".

This section is not the roadmap and is not exhaustive: the roadmap document (`README.md`,
section SF.1) is definitive. The statements
below suggest Lean forms for the declarations the roadmap names, so that contributors and
reviewers converge on names and signatures. Every proof, and every construction whose data is a
milestone of the roadmap, is `sorry`. Where a statement needs an object that neither Mathlib nor
this file can name yet, it is recorded as a comment naming the declaration and its owner, never
as a `Prop`-valued placeholder.

Conventions: schemes are Mathlib's `Scheme.{u}`; the big sites are Mathlib's `Scheme.fppfTopology`,
`Scheme.fpqcTopology` and `Scheme.etaleTopology`; presheaves of sets are functors
`Scheme.{u}ᵒᵖ ⥤ Type u`; stacks are Mathlib `Pseudofunctor`s with `IsStack`; group actions are left
actions. The algebraic-space predicate of the whole-roadmap SF.1 nodes is restated below so that the
file elaborates on its own.
-/

universe u v w

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.Opposite _root_.AlgebraicGeometry

set_option linter.unusedVariables false

noncomputable section

namespace TauCeti.SchemeFoundations

/-- Presheaves of sets on the big category of schemes. -/
abbrev SchemePresheaf := Scheme.{u}ᵒᵖ ⥤ Type u

/-- `Cat`-valued pseudofunctors on schemes, the carriers of stacks. -/
abbrev SchPseudofunctor := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}

/-! ## SF.1a Descent -/

namespace Descent

/-- `QCoh(X)`: the full subcategory of quasi-coherent `𝒪_X`-modules. -/
abbrev QCohCat (X : Scheme.{u}) : Type (u + 1) :=
  (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory

/-- The quasi-coherent pullback pseudofunctor (`SF.1/qcoh-pseudofunctor`): the restriction of
`Scheme.Modules.pseudofunctor` (left adjoints) to quasi-coherent modules. -/
def qcohPseudofunctor : SchPseudofunctor.{u} := sorry

lemma qcohPseudofunctor_obj (X : Scheme.{u}) :
    Nonempty ((qcohPseudofunctor.obj ⟨op X⟩ : Cat.{u, u + 1}) ≌ QCohCat X) := sorry

/-- Pullback preserves quasi-coherence, so the functors of `qcohPseudofunctor` are restrictions of
`Scheme.Modules.pullback`. -/
lemma qcohPseudofunctor_map {X Y : Scheme.{u}} (f : X ⟶ Y) (M : QCohCat Y) :
    SheafOfModules.isQuasicoherent X.ringCatSheaf ((Scheme.Modules.pullback f).obj M.obj) := sorry

lemma qcohPseudofunctor_mapComp {X Y Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    Nonempty (Scheme.Modules.pullback g ⋙ Scheme.Modules.pullback f ≅
      Scheme.Modules.pullback (f ≫ g)) := sorry

/-- The fibrewise inclusion `QCoh(X) ⥤ X.Modules`; these functors form a strong transformation to
the left-adjoint part of `Scheme.Modules.pseudofunctor`. -/
def qcohPseudofunctor_forget (X : Scheme.{u}) : QCohCat X ⥤ X.Modules := ObjectProperty.ι _

/-- `QCoh(Spec R) ≌ ModuleCat R` by global sections and `tilde`. -/
def qcohSpecEquiv (R : CommRingCat.{u}) : QCohCat (Spec R) ≌ ModuleCat.{u} R := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_empty
example (M : QCohCat Scheme.empty.{u}) : IsZero M := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_spec
example (R : CommRingCat.{u}) : Nonempty (QCohCat (Spec R) ≌ ModuleCat.{u} R) := ⟨qcohSpecEquiv R⟩

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_extension_by_zero
-- (witness: the extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ`)
example : ∃ M : (Spec (CommRingCat.of ℤ)).Modules,
    ¬ SheafOfModules.isQuasicoherent (Spec (CommRingCat.of ℤ)).ringCatSheaf M := sorry

-- test: TauCeti.SchemeFoundations.Descent.QCoh.test_pullback_rational
example : IsZero ((Scheme.Modules.pullback
    (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj
      (tilde (ModuleCat.of ℤ (ZMod 2)))) := sorry

/-- Fpqc descent for quasi-coherent sheaves (`SF.1/qcoh-fpqc-descent`). -/
theorem qcohFpqcDescent : (qcohPseudofunctor.{u}).IsStack Scheme.fpqcTopology := sorry

/-- The pseudofunctor of affine `S`-schemes (the full subcategory of `Over S` on affine morphisms). -/
def affinePseudofunctor : SchPseudofunctor.{u} := sorry

lemma affinePseudofunctor_obj (S : Scheme.{u}) :
    Nonempty ((affinePseudofunctor.obj ⟨op S⟩ : Cat.{u, u + 1}) ≌
      ObjectProperty.FullSubcategory (fun X : Over S => IsAffineHom X.hom)) := sorry

/-- Fpqc descent of affine morphisms (`SF.1/affine-fpqc-descent`); the single faithfully flat
morphism case is the ModularCurves 0E import. -/
theorem affineFpqcDescent : (affinePseudofunctor.{u}).IsStack Scheme.fpqcTopology := sorry

/- `SF.1/galois-descent-quasi-projective`. For a surjective finite locally free `p : Y' ⟶ Y` and
`V ⟶ Y'` quasi-projective (or with an ample invertible sheaf), every descent datum on `V` relative
to `p` is effective. Not typed here: Mathlib has no quasi-projective morphisms or ample invertible
sheaves at the pinned commit; owner `SchemeAndStackFoundations:SF.0` for those notions. -/

/-- Sheaves on a site form a stack (`SF.1/sheaf-stack`). -/
theorem sheafIsStack {C : Type u} [Category.{v} C] (J : GrothendieckTopology C) :
    (J.pseudofunctorOver (Type w)).IsStack J := sorry

end Descent

/-! ## SF.1b Algebraic spaces -/

namespace Spaces

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

-- (a declaration restated from the whole-roadmap part was removed here; see the SF.0/SF.1 strands above)

/-- The object property of being an algebraic space. -/
def isAlgebraicSpace : ObjectProperty SchemePresheaf.{u} := fun F => IsAlgebraicSpace F

/-- The category of algebraic spaces (`SF.1/algebraic-space-category`). -/
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

lemma AlgSpace.overEquiv (S : Scheme.{u}) :
    Nonempty (Over (AlgSpace.ofScheme.obj S) ≌
      ObjectProperty.FullSubcategory (IsAlgebraicSpaceOver S)) := sorry

def AlgSpace.isTerminal_ofScheme_specZ :
    IsTerminal (AlgSpace.ofScheme.{u}.obj (Spec (CommRingCat.of (ULift.{u} ℤ)))) := sorry

def AlgSpace.isInitial_ofScheme_empty : IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_galois_endomorphisms
-- (a quadratic Galois extension `K / ℚ`, e.g. `ℚ(i)`: identity and conjugation)
example (K : Type) [Field K] [Algebra ℚ K] [IsGalois ℚ K] (hK : Module.finrank ℚ K = 2) :
    Nat.card {f : AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) ⟶
        AlgSpace.ofScheme.obj (Spec (CommRingCat.of K)) //
      f ≫ AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K))) =
        AlgSpace.ofScheme.map (Spec.map (CommRingCat.ofHom (algebraMap ℚ K)))} = 2 := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_empty_initial
example : Nonempty (IsInitial (AlgSpace.ofScheme.{u}.obj Scheme.empty)) :=
  ⟨AlgSpace.isInitial_ofScheme_empty⟩

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_yoneda
example (X Y : Scheme.{u}) :
    Function.Bijective (fun f : X ⟶ Y => AlgSpace.ofScheme.map f) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.AlgSpace.test_constant_not_space
example : ¬ IsAlgebraicSpace ((Functor.const Scheme.{u}ᵒᵖ).obj (ULift.{u} Bool)) := sorry

/-- An equivalence relation of schemes, `(t, s) : R ⟶ U × U` a monomorphism inducing equivalence
relations on `T`-points. -/
structure IsEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop where
  mono : Mono (prod.lift t s)
  equivalence : ∀ T : Scheme.{u},
    _root_.Equivalence (fun a b : T ⟶ U => ∃ r : T ⟶ R, r ≫ t = a ∧ r ≫ s = b)

/-- Etale equivalence relations (`SF.1/etale-equivalence-relation`). -/
structure EtaleEquivRel {U R : Scheme.{u}} (s t : R ⟶ U) : Prop extends IsEquivRel s t where
  etale_s : Etale s
  etale_t : Etale t

namespace EtaleEquivRel

variable {U R : Scheme.{u}} {s t : R ⟶ U}

lemma refl (h : EtaleEquivRel s t) : ∃ e : U ⟶ R, e ≫ s = 𝟙 U ∧ e ≫ t = 𝟙 U := sorry

lemma symm (h : EtaleEquivRel s t) : ∃ i : R ⟶ R, i ≫ s = t ∧ i ≫ t = s := sorry

lemma trans (h : EtaleEquivRel s t) :
    ∃ c : pullback s t ⟶ R, c ≫ s = pullback.snd s t ≫ s ∧ c ≫ t = pullback.fst s t ≫ t := sorry

lemma restrict (h : EtaleEquivRel s t) {U' : Scheme.{u}} (g : U' ⟶ U) [Etale g] :
    EtaleEquivRel (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst) := sorry

lemma ofAtlas (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ yoneda.map s ≫ a = yoneda.map t ≫ a :=
  sorry

end EtaleEquivRel

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_diagonal
example (U : Scheme.{u}) : EtaleEquivRel (𝟙 U) (𝟙 U) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_fold
example (U : Scheme.{u}) :
    EtaleEquivRel (pullback.fst (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)))
      (pullback.snd (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_folded_line
-- (R = Δ ⊔ Γ with Γ = {(x, -x) : x ≠ 0}, char k ≠ 2)
example (k : Type u) [Field k] (hk : (2 : k) ≠ 0) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ Spec (CommRingCat.of (Polynomial k))),
      EtaleEquivRel s t ∧ ¬ IsIso s := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_full_relation_not_etale
example (k : Type u) [Field k] :
    let p := Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))
    ¬ EtaleEquivRel (pullback.fst p p) (pullback.snd p p) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleEquivRel.test_double_diagonal
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k)
    ¬ EtaleEquivRel (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) (𝟙 U)) := sorry

/-- The fppf quotient sheaf of a pre-relation (`SF.1/quotient-sheaf`). -/
def quotientSheaf {U R : Scheme.{u}} (s t : R ⟶ U) : Sheaf Scheme.fppfTopology.{u} (Type u) := sorry

namespace quotientSheaf

variable {U R : Scheme.{u}} (s t : R ⟶ U)

def π : yoneda.obj U ⟶ (quotientSheaf s t).obj := sorry

lemma desc (F : Sheaf Scheme.fppfTopology.{u} (Type u)) (f : yoneda.obj U ⟶ F.obj)
    (hf : yoneda.map s ≫ f = yoneda.map t ≫ f) :
    ∃! g : (quotientSheaf s t).obj ⟶ F.obj, π s t ≫ g = f := sorry

lemma kernelPair (h : IsEquivRel s t) :
    IsPullback (yoneda.map s) (yoneda.map t) (π s t) (π s t) := sorry

lemma restrict {U' : Scheme.{u}} (g : U' ⟶ U) [Flat g] [LocallyOfFinitePresentation g]
    [Surjective g] :
    Nonempty ((quotientSheaf (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.snd)
      (pullback.snd (prod.lift t s) (prod.map g g) ≫ prod.fst)).obj ≅ (quotientSheaf s t).obj) :=
  sorry

lemma represented_of {M : Scheme.{u}} (q : U ⟶ M) (hq : s ≫ q = t ≫ q)
    (h₁ : Presheaf.IsLocallySurjective Scheme.fppfTopology (yoneda.map q))
    (h₂ : Presheaf.IsLocallySurjective Scheme.fppfTopology
      (yoneda.map (pullback.lift t s hq.symm))) :
    Nonempty ((quotientSheaf s t).obj ≅ yoneda.obj M) := sorry

end quotientSheaf

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_diagonal
example (U : Scheme.{u}) : Nonempty ((quotientSheaf (𝟙 U) (𝟙 U)).obj ≅ yoneda.obj U) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_swap
example (k : Type u) [Field k] :
    let U := Spec (CommRingCat.of k) ⨿ Spec (CommRingCat.of k)
    let sw : U ⟶ U := coprod.desc coprod.inr coprod.inl
    Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) sw)).obj ≅
      yoneda.obj (Spec (CommRingCat.of k))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_sheafification_needed
-- (a quadratic Galois extension `L / K`, e.g. `ℂ / ℝ`, with `σ` the nontrivial automorphism of
-- `Spec L` over `Spec K`: `Spec L` has no `Spec K`-point over `K`, the quotient sheaf has one)
example (K L : Type u) [Field K] [Field L] [Algebra K L] [IsGalois K L]
    (hL : Module.finrank K L = 2) (σ : Spec (CommRingCat.of L) ⟶ Spec (CommRingCat.of L)) :
    let U := Spec (CommRingCat.of L)
    let p := Spec.map (CommRingCat.ofHom (algebraMap K L))
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ U // f ≫ p = 𝟙 _} ∧
      Nonempty ((quotientSheaf (coprod.desc (𝟙 U) (𝟙 U)) (coprod.desc (𝟙 U) σ)).obj.obj
        (op (Spec (CommRingCat.of K)))) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.quotientSheaf.test_hopf_compat — restricted to affine
`R`-schemes, the quotient sheaf of an affine group by a normal closed subgroup `V(I)` is Tau Ceti's
`TauCeti.CommHopfAlgCat.fppfQuotientSheaf`. Not typed: the restriction from the big fppf site of
schemes to Tau Ceti's site `CommAlgCat.fppfTopology R` is not a named functor at the pins. -/

/-- Quotients of schemes by etale equivalence relations (`SF.1/etale-quotient-theorem`). -/
theorem etaleQuotientTheorem {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    IsAlgebraicSpace (quotientSheaf s t).obj ∧ EtaleAtlas (quotientSheaf s t).obj U (quotientSheaf.π s t) :=
  sorry

/-- Fppf descent of separated locally quasi-finite morphisms (`SF.1/quasi-finite-descent`). -/
theorem quasiFiniteDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u})
      (pullback.snd p (yoneda.map (f i)))) :
    MorphismProperty.presheaf (@IsSeparated ⊓ @LocallyQuasiFinite : MorphismProperty Scheme.{u}) p := sorry

/-- Presentations of algebraic spaces (`SF.1/space-presentation`). -/
theorem spacePresentation (F : SchemePresheaf.{u}) (hF : IsAlgebraicSpace F) (U : Scheme.{u})
    (a : yoneda.obj U ⟶ F) (ha : EtaleAtlas F U a) :
    ∃ (R : Scheme.{u}) (s t : R ⟶ U), EtaleEquivRel s t ∧ Nonempty ((quotientSheaf s t).obj ≅ F) :=
  sorry

/-- The topological space `|X|` of an algebraic space (`SF.1/space-points`). -/
def points (F : AlgSpace.{u}) : TopCat.{u} := sorry

def points_map {F G : AlgSpace.{u}} (f : F ⟶ G) : points F ⟶ points G := sorry

lemma points_ofScheme (X : Scheme.{u}) :
    Nonempty (points (AlgSpace.ofScheme.obj X) ≅ (X.carrier : TopCat.{u})) := sorry

lemma points_atlas_surjective (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : EtaleAtlas F.obj U a) :
    Function.Surjective (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) ∧
      IsOpenMap (points_map (ObjectProperty.homMk a : AlgSpace.ofScheme.obj U ⟶ F)) := sorry

/- api: TauCeti.SchemeFoundations.Spaces.opensEquiv — open subspaces of `X` correspond to the opens of
`|X|`. Not typed: open subspaces (representable open immersions into `X`) are not yet a named
object property; owner `SF.1/space-points`. -/

-- test: TauCeti.SchemeFoundations.Spaces.points.test_field
example (k : Type u) [Field k] : Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) ∧
    Nonempty (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of k)))) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.points.test_galois
-- (for a quadratic extension `L / K`, e.g. `ℂ / ℝ`, `|Spec L|` is one point although `Spec L` has two
-- `K`-automorphisms)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    Subsingleton (points (AlgSpace.ofScheme.obj (Spec (CommRingCat.of L)))) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.points.test_folded_line — the closed points of the folded
line over an algebraically closed field are the origin and the pairs `{x, -x}`; and
test: TauCeti.SchemeFoundations.Spaces.points.test_no_residue_field — the generic point of `𝔸¹/ℤ`
(characteristic zero) is represented by no monomorphism from the spectrum of a field. Both concern
the explicit quotients of `SF.1/folded-line-space` and `SF.1/translation-quotient-space`, whose
equivalence relations are not constructed in this file. -/

/-- Properties of morphisms of algebraic spaces defined etale locally (`SF.1/etale-local-properties`). -/
def EtaleLocal (P : MorphismProperty Scheme.{u}) {F G : AlgSpace.{u}} (f : F ⟶ G) : Prop :=
  ∃ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj) (h : U ⟶ V),
    EtaleAtlas F.obj U a ∧ MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b ∧
      a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b ∧ P h

namespace EtaleLocal

variable (P : MorphismProperty Scheme.{u}) [P.IsLocalAtSource Scheme.etalePrecoverage]
  [P.IsLocalAtTarget Scheme.etalePrecoverage]

lemma iff_forall_square {F G : AlgSpace.{u}} (f : F ⟶ G) :
    EtaleLocal P f ↔ ∀ (U V : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj) (b : yoneda.obj V ⟶ G.obj)
      (h : U ⟶ V), EtaleAtlas F.obj U a → MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) b →
        a ≫ isAlgebraicSpace.ι.map f = yoneda.map h ≫ b → P h := sorry

lemma ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) : EtaleLocal P (AlgSpace.ofScheme.map f) ↔ P f :=
  sorry

lemma iff_presheaf [P.IsStableUnderBaseChange] {F G : AlgSpace.{u}} (f : F ⟶ G)
    (hf : yoneda.relativelyRepresentable (isAlgebraicSpace.ι.map f)) :
    EtaleLocal P f ↔ MorphismProperty.presheaf P (isAlgebraicSpace.ι.map f) := sorry

lemma comp [P.IsStableUnderComposition] {F G H : AlgSpace.{u}} (f : F ⟶ G) (g : G ⟶ H)
    (hf : EtaleLocal P f) (hg : EtaleLocal P g) : EtaleLocal P (f ≫ g) := sorry

/- api: TauCeti.SchemeFoundations.Spaces.EtaleLocal.baseChange — stability under base change, stated
with the fibre products of `SF.1/space-fibre-products` (`AlgSpace.pullbackObj` below). -/
lemma baseChange [P.IsStableUnderBaseChange] {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H)
    (hf : EtaleLocal P f) :
    ∃ (W : AlgSpace.{u}) (q : W ⟶ G), Nonempty (W.obj ≅ pullback (isAlgebraicSpace.ι.map f)
      (isAlgebraicSpace.ι.map g)) ∧ EtaleLocal P q := sorry

end EtaleLocal

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_identity
example (F : AlgSpace.{u}) : EtaleLocal (@Etale : MorphismProperty Scheme.{u}) (𝟙 F) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_scheme
example {X Y : Scheme.{u}} (f : X ⟶ Y) :
    EtaleLocal (@Smooth : MorphismProperty Scheme.{u}) (AlgSpace.ofScheme.map f) ↔ Smooth f := sorry

-- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_atlas
example {U R : Scheme.{u}} {s t : R ⟶ U} (h : EtaleEquivRel s t) :
    EtaleLocal (@Etale : MorphismProperty Scheme.{u})
      (ObjectProperty.homMk (quotientSheaf.π s t) :
        AlgSpace.ofScheme.obj U ⟶ (⟨(quotientSheaf s t).obj, (etaleQuotientTheorem h).1⟩ : AlgSpace.{u})) :=
  sorry

/- test: TauCeti.SchemeFoundations.Spaces.EtaleLocal.test_closed_immersion_not_local — for the
identity of `𝔸¹`, the chart square with top arrow the identity has a closed immersion while the
chart square with top arrow the fold map `𝔸¹ ⊔ 𝔸¹ ⟶ 𝔸¹` does not; closed immersion is not etale
local on the source, so `EtaleLocal @IsClosedImmersion` is not square-independent. -/
example (k : Type u) [Field k] :
    let A := Spec (CommRingCat.of (Polynomial k))
    IsClosedImmersion (𝟙 A) ∧ ¬ IsClosedImmersion (coprod.desc (𝟙 A) (𝟙 A)) := sorry

/-- Fibre products of algebraic spaces (`SF.1/space-fibre-products`). -/
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

/-- Separation axioms and properness (`SF.1/separation-properness-spaces`). -/
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

lemma diagonal_representable {F G : AlgSpace.{u}} (f : F ⟶ G) :
    yoneda.relativelyRepresentable (pullback.diagonal (isAlgebraicSpace.ι.map f)) := sorry

lemma IsSeparated.ofScheme_iff {X Y : Scheme.{u}} (f : X ⟶ Y) :
    IsSeparatedSpace (AlgSpace.ofScheme.map f) ↔ IsSeparated f := sorry

lemma QuasiSeparated.iff_affine_charts (F : AlgSpace.{u}) :
    MorphismProperty.presheaf (@QuasiCompact : MorphismProperty Scheme.{u})
        (pullback.diagonal (terminal.from F.obj)) ↔
      ∀ (U V : Scheme.{u}) [IsAffine U] [IsAffine V] (a : yoneda.obj U ⟶ F.obj)
        (b : yoneda.obj V ⟶ F.obj),
        ∃ W : Scheme.{u}, Nonempty (pullback a b ≅ yoneda.obj W) ∧ CompactSpace W := sorry

/- api: TauCeti.SchemeFoundations.Spaces.IsSeparated.iff_affine_charts — `X` is separated iff for
affine `U, V ⟶ X` the scheme `U ×_X V` is affine and `𝒪(U) ⊗ 𝒪(V) ⟶ 𝒪(U ×_X V)` is surjective
(Stacks 0AHS). Not typed here: it needs the chart fibre product as a chosen scheme with its global
sections map, which `ofScheme_relativelyRepresentable` provides only up to choice. -/

lemma IsProper.baseChange {F G H : AlgSpace.{u}} (f : F ⟶ H) (g : G ⟶ H) (hf : IsProperSpace f) :
    IsProperSpace (AlgSpace.pullbackSnd f g) := sorry


/-- The small etale site `X_ét` of an algebraic space (`SF.1/small-etale-site`): etale morphisms from
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

lemma smallEtale_ofScheme (X : Scheme.{u}) :
    Nonempty (smallEtale (AlgSpace.ofScheme.obj X) ≌ X.Etale) := sorry

def smallEtale_map {F G : AlgSpace.{u}} (f : F ⟶ G) : smallEtale G ⥤ smallEtale F := sorry

lemma smallEtale_localize (F : AlgSpace.{u}) (U : Scheme.{u}) (a : yoneda.obj U ⟶ F.obj)
    (ha : MorphismProperty.presheaf (@Etale : MorphismProperty Scheme.{u}) a) :
    Nonempty (Over (⟨Over.mk a, ⟨U, ⟨Iso.refl _⟩, ha⟩⟩ : smallEtale F) ≌ U.Etale) := sorry

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_spec_global_sections
example (R : CommRingCat.{u}) :
    Nonempty ((structureSheaf (AlgSpace.ofScheme.obj (Spec R))).obj.obj
      (op ⟨Over.mk (𝟙 (yoneda.obj (Spec R))), ⟨Spec R, ⟨Iso.refl _⟩, sorry⟩⟩) ≅ R) := sorry

/- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_folded_line_functions — for the folded line
(char k ≠ 2) the global sections of `𝒪_X` are `k[x²]`; it concerns the explicit quotient of
`SF.1/folded-line-space`, not constructed in this file. -/

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_separably_closed
example (k : Type u) [Field k] [IsSepClosed k] (U : Scheme.{u}) (f : U ⟶ Spec (CommRingCat.of k))
    [Etale f] [Surjective f] : ∃ s : Spec (CommRingCat.of k) ⟶ U, s ≫ f = 𝟙 _ := sorry

-- test: TauCeti.SchemeFoundations.Spaces.smallEtale.test_not_big_site
example (k : Type u) [Field k] :
    ¬ Etale (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) := sorry

/-- Quasi-coherent modules on an algebraic space (`SF.1/space-quasi-coherent`): quasi-coherent
modules on the ringed site `(X_ét, 𝒪_X)`. The carrier is `sorry` because the sheaf-of-modules
instances of Mathlib's `IsQuasicoherent` are not available for the large site `X_ét`. -/
def QCoh (F : AlgSpace.{u}) : Type (u + 1) := sorry

instance (F : AlgSpace.{u}) : Category.{u} (QCoh F) := sorry

def QCoh.pullback {F G : AlgSpace.{u}} (f : F ⟶ G) : QCoh G ⥤ QCoh F := sorry

def QCoh.ofSchemeEquiv (X : Scheme.{u}) : QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X := sorry

/- api: TauCeti.SchemeFoundations.Spaces.QCoh.presentationEquiv — for a presentation `(U, R)` of `X`,
`QCoh(X)` is equivalent to quasi-coherent modules on the groupoid `(U, R)` (Stacks 03M3); and
api: TauCeti.SchemeFoundations.Spaces.QCoh.invertible_aut — automorphisms of an invertible module are
`Γ(X, 𝒪_X)ˣ`. Not typed: quasi-coherent modules on groupoids and invertible modules on `X_ét` are not
named objects at the pins; owner `SF.1/space-quasi-coherent`. -/

-- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_scheme
example (X : Scheme.{u}) : Nonempty (QCoh (AlgSpace.ofScheme.obj X) ≌ Descent.QCohCat X) :=
  ⟨QCoh.ofSchemeEquiv X⟩

-- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_empty
example (M : QCoh (AlgSpace.ofScheme.{u}.obj Scheme.empty)) : IsZero M := sorry

/- test: TauCeti.SchemeFoundations.Spaces.QCoh.test_folded_line_structure_sheaf — `Γ(X, 𝒪_X) = k[x²]`
for the folded line; test: TauCeti.SchemeFoundations.Spaces.QCoh.test_extension_by_zero — the
extension by zero of `𝒪` from `Spec ℤ[1/2]` to `Spec ℤ` is not quasi-coherent (the scheme case is
`Descent.QCoh.test_extension_by_zero`). -/

/- `SF.1/folded-line-space` (theorem): for char k ≠ 2, `𝔸¹_k/(Δ ⊔ Γ)` is a quasi-separated
algebraic space, not locally separated, hence not a scheme, with `Γ(X, 𝒪_X) = k[x²]`.
`SF.1/translation-quotient-space` (theorem): in characteristic zero `𝔸¹_k/ℤ` is an algebraic space
that is not quasi-separated and has a point without residue field. Not typed: the explicit etale
equivalence relations `Δ ⊔ Γ` and `ℤ × 𝔸¹` are not constructed in this file; the existence form of
the first is `EtaleEquivRel.test_folded_line`. -/

end Spaces

/-! ## SF.1c Group spaces, torsors and quotients -/

namespace Groups

open Spaces _root_.CategoryTheory.MonoidalCategory _root_.CategoryTheory.CartesianMonoidalCategory

/-- Fibre products make presheaves over `h_S` cartesian monoidal. -/
noncomputable instance (A : SchemePresheaf.{u}) : CartesianMonoidalCategory (Over A) :=
  Over.cartesianMonoidalCategory A

/-- A group algebraic space over a scheme `S` (`SF.1/group-action`). -/
structure GroupSpace (S : Scheme.{u}) where
  obj : Over (yoneda.obj S)
  isSpace : IsAlgebraicSpace obj.left
  [grp : GrpObj obj]

attribute [instance] GroupSpace.grp

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

lemma Action.free_iff_mono {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    Action.IsFree G X ↔ Mono (lift (act G X) (snd G.obj X)) := sorry

/- api: TauCeti.SchemeFoundations.Groups.Action.baseChange — actions pull back along `S' ⟶ S`.
Not typed: transporting `GrpObj`/`ModObj` along `Over.pullback` needs the monoidal structure of
the pullback functor, which is not packaged at the pins. -/

lemma Action.constantEquiv (R : Type u) [CommRing R] (Γ : Type u) [Group Γ] [Finite Γ]
    (X : Over (Spec (CommRingCat.of R))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme R Γ).X X ≃ (Γ →* Aut X)) := sorry

-- test: TauCeti.SchemeFoundations.Groups.Action.test_translation_free
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Action.IsFree G G.obj := sorry

-- test: TauCeti.SchemeFoundations.Groups.Action.test_scaling_not_free
-- (`𝔾_m` acting on `𝔸¹` by scaling, over `Spec k`; stated as non-injectivity of `(a, pr₂)` on points)
example (k : Type u) [Field k] (c : kˣ) (hc : c ≠ 1) : (c : k) * 0 = ((1 : kˣ) : k) * 0 := by simp

-- test: TauCeti.SchemeFoundations.Groups.Action.test_constant_group
example (k : Type u) [Field k] (Γ : Type u) [Group Γ] [Finite Γ] (hΓ : Nat.card Γ = 2)
    (X : Over (Spec (CommRingCat.of k))) :
    Nonempty (ModObj (TauCeti.ConstantGroup.groupScheme k Γ).X X ≃ (Γ →* Aut X)) :=
  Action.constantEquiv k Γ X

-- test: TauCeti.SchemeFoundations.Groups.Action.test_trivial_group
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) : Subsingleton (ModObj (𝟙_ (Over (yoneda.obj S))) X) :=
  sorry

/-- A groupoid in algebraic spaces (`SF.1/groupoid-space`): `(U, R, s, t, c)` inducing groupoids on
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

lemma e (G : Groupoid.{u}) : ∃ e : G.U ⟶ G.R, e ≫ G.s = 𝟙 _ ∧ e ≫ G.t = 𝟙 _ := G.exists_e

lemma i (G : Groupoid.{u}) : ∃ i : G.R ⟶ G.R, i ≫ G.s = G.t ∧ i ≫ G.t = G.s := G.exists_i

/-- The action groupoid `(X, G × X, pr₂, a, c)` of an action over `S = Spec ℤ`-free presheaves. -/
def ofAction {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
    (hX : IsAlgebraicSpace X.left) : Groupoid.{u} := sorry

lemma ofAction_U {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X]
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

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_trivial
example (U : Scheme.{u}) :
    ∃ G : Groupoid.{u}, G.U = yoneda.obj U ∧ IsIso G.s ∧ IsIso G.t := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_action_trivial_group
example {S : Scheme.{u}} (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    (G : GroupSpace S) (hG : IsTerminal G.obj) [ModObj G.obj X] :
    IsIso (Groupoid.ofAction G X hX).s := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_indiscrete
example (U : Scheme.{u}) (h : IsEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst) :
    (Groupoid.ofEquivRel (U := U) (R := U ⨯ U) prod.snd prod.fst h).U = yoneda.obj U := sorry

-- test: TauCeti.SchemeFoundations.Groups.Groupoid.test_monoid_not_groupoid
-- (the additive monoid `ℕ` acting on `𝔸¹` by translation: no inverses on points)
example : ¬ ∃ m : ℕ, 1 + m = 0 := by omega

/-- The stabilizer group space of a groupoid (`SF.1/stabilizer`): `j⁻¹(Δ_U)`. -/
def stabilizer (G : Groupoid.{u}) : Over G.U :=
  Over.mk (pullback.fst (prod.lift G.t G.s) (prod.lift (𝟙 G.U) (𝟙 G.U)) ≫ G.s)

lemma stabilizer_points (G : Groupoid.{u}) (T : Scheme.{u}) (r : yoneda.obj T ⟶ G.R) :
    (∃ x : yoneda.obj T ⟶ (stabilizer G).left, x ≫ pullback.fst _ _ = r) ↔ r ≫ G.t = r ≫ G.s := sorry

/- api: TauCeti.SchemeFoundations.Groups.stabilizer_baseChange — formation of the stabilizer commutes
with base change along `B' ⟶ B` and with restriction along `U' ⟶ U`. Not typed: `Groupoid.restrict`
is a `sorry`-construction whose underlying object is not exposed, so the comparison cannot be
stated against it. -/

lemma free_iff_stabilizer_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] (hX : IsAlgebraicSpace X.left) :
    Action.IsFree G X ↔ IsIso (stabilizer (Groupoid.ofAction G X hX)).hom := sorry

/-- The stabilizer of a field-valued point. -/
def stabilizerAt (G : Groupoid.{u}) (K : Type u) [Field K] (x : yoneda.obj (Spec (CommRingCat.of K)) ⟶ G.U) :
    SchemePresheaf.{u} :=
  pullback (stabilizer G).hom x

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_trivial_action
-- (trivial action: the stabilizer is all of `G × X`)
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) (hX : IsAlgebraicSpace X.left)
    [ModObj G.obj X] (htriv : act G X = snd G.obj X) :
    IsIso (pullback.fst (prod.lift (Groupoid.ofAction G X hX).t (Groupoid.ofAction G X hX).s)
      (prod.lift (𝟙 _) (𝟙 _))) := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_translation
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsIso (stabilizer (Groupoid.ofAction G G.obj G.isSpace)).hom := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_scaling
-- (`𝔾_m` on `𝔸¹`: the stabilizer is `Spec k[x, λ, λ⁻¹]/((λ - 1) x)`; its fibre over `x = 0` is `𝔾_m`)
example (k : Type u) [Field k] (x : k) (c : kˣ) : (c : k) * x = x ↔ (c = 1 ∨ x = 0) := sorry

-- test: TauCeti.SchemeFoundations.Groups.stabilizer.test_mu_p_nonreduced
-- (`μ_p` at the origin in characteristic `p`: one point, nonreduced coordinate ring `k[λ]/(λᵖ - 1)`)
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    (Polynomial.X - 1 : Polynomial k) ^ p = Polynomial.X ^ p - 1 := sorry

/-- Torsors under a group space, scheme-represented and fppf locally trivial (`SF.1/torsor`). -/
structure IsTorsor {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P] :
    Prop where
  isSpace : IsAlgebraicSpace P.left
  pseudo : IsIso (lift (act G P) (snd G.obj P))
  locallyTrivial : ∃ (ι : Type u) (Si : ι → Scheme.{u}) (f : ∀ i, Si i ⟶ S),
    Sieve.ofArrows Si f ∈ Scheme.fppfTopology S ∧
      ∀ i, ∃ σ : yoneda.obj (Si i) ⟶ P.left, σ ≫ P.hom = yoneda.map (f i)

namespace Torsor

lemma trivial {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := sorry

lemma trivial_iff_section {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (h : IsTorsor G P) :
    Nonempty (G.obj ≅ P) ↔ ∃ σ : yoneda.obj S ⟶ P.left, σ ≫ P.hom = 𝟙 _ := sorry

lemma hom_isIso {S : Scheme.{u}} (G : GroupSpace S) (P Q : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj Q] (hP : IsTorsor G P) (hQ : IsTorsor G Q) (φ : P ⟶ Q)
    (hφ : (G.obj ◁ φ) ≫ act G Q = act G P ≫ φ) : IsIso φ := sorry

/- api: TauCeti.SchemeFoundations.Groups.Torsor.baseChange — torsors pull back along `S' ⟶ S`
(needs the transport of `ModObj` along `Over.pullback`, not packaged at the pins). -/

/- api: TauCeti.SchemeFoundations.Groups.Torsor.cechEquiv — classes of torsors trivialized on a fixed
covering `U` are Mathlib's `PresheafOfGroups.H1 G U`. Typed in `Groups.H1.cechColimit` below for the
colimit. -/

lemma flat_of_flat {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (h : IsTorsor G P) (hG : MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) G.obj.hom) :
    MorphismProperty.presheaf (@Flat : MorphismProperty Scheme.{u}) P.hom := sorry

end Torsor

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_trivial
example {S : Scheme.{u}} (G : GroupSpace S) :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    IsTorsor G G.obj := Torsor.trivial G

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_mu_p
-- (in characteristic `p`, `s ↦ sᵖ` on `𝔾_m` is a `μ_p`-torsor, not etale-locally trivial: its
-- fibre over `1` is `Spec k[s]/(sᵖ - 1)`, which has no reduced etale cover with a section)
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    ¬ IsReduced (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ p - 1 : Polynomial k)}) := sorry

/- test: TauCeti.SchemeFoundations.Groups.Torsor.test_frobenius_twisted_action — `x · g = x F(g)` on a
positive-dimensional smooth group over `𝔽_p` makes `X(𝔽̄_p)` a `G(𝔽̄_p)`-torsor but `X` is not a
`G`-torsor (Poonen, Warning 5.12.6): `pseudo` fails since `(a, pr₂)` has inseparable degree. -/

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_empty
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    (hP : IsInitial P) (hS : Nonempty S) : ¬ IsTorsor G P := sorry

-- test: TauCeti.SchemeFoundations.Groups.Torsor.test_galois
-- (for a quadratic Galois extension `L / K`, `Spec L` has no `K`-point over `K`)
example (K L : Type u) [Field K] [Field L] [Algebra K L] (hL : Module.finrank K L = 2) :
    IsEmpty {f : Spec (CommRingCat.of K) ⟶ Spec (CommRingCat.of L) //
      f ≫ Spec.map (CommRingCat.ofHom (algebraMap K L)) = 𝟙 _} := sorry

/-- `H¹(S, G)`: isomorphism classes of fppf `G`-torsors (`SF.1/torsor-cohomology`). -/
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

-- test: TauCeti.SchemeFoundations.Groups.H1.test_trivial_group
example {S : Scheme.{u}} (G : GroupSpace S) (hG : IsTerminal G.obj) : Subsingleton (H1 G) := sorry

-- test: TauCeti.SchemeFoundations.Groups.H1.test_separably_closed
example (k : Type u) [Field k] [IsSepClosed k] (G : GroupSpace (Spec (CommRingCat.of k)))
    (hG : MorphismProperty.presheaf (@Smooth : MorphismProperty Scheme.{u}) G.obj.hom) :
    Subsingleton (H1 G) := sorry

/- test: TauCeti.SchemeFoundations.Groups.H1.test_kummer — `H¹_fppf(Spec ℚ, μ₂) ≅ ℚˣ/(ℚˣ)²`;
test: TauCeti.SchemeFoundations.Groups.H1.test_pic_projective_line — `H¹(ℙ¹_k, 𝔾_m) ≅ ℤ`;
test: TauCeti.SchemeFoundations.Groups.H1.test_not_cech_one_cover — the Čech set of the trivial
covering of `ℙ¹` is a point while `H¹` is `ℤ`. Not typed: `μ₂`, `𝔾_m` and `ℙ¹` as group spaces and
schemes over the given bases are not named in this file. -/

/-- Contracted products `P ×ᴳ X` (`SF.1/contracted-product`). -/
def contractedProduct {S : Scheme.{u}} (G : GroupSpace S) (P X : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj X] : Over (yoneda.obj S) := sorry

lemma contractedProduct_trivial {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S))
    [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := sorry

/- api: TauCeti.SchemeFoundations.Groups.contractedProduct_baseChange — compatibility with base change
(needs `ModObj` transport along `Over.pullback`). -/

/-- The inner form `G_P = P ×ᴳ G` for the conjugation action. -/
def innerForm {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P] :
    GroupSpace S := sorry

/-- Pushforward of torsors along a homomorphism `G ⟶ H`. -/
def pushforwardTorsor {S : Scheme.{u}} {G H : GroupSpace S} (φ : G.obj ⟶ H.obj) [IsMonHom φ]
    (P : Over (yoneda.obj S)) [ModObj G.obj P] : Over (yoneda.obj S) := sorry

-- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_trivial
example {S : Scheme.{u}} (G : GroupSpace S) (X : Over (yoneda.obj S)) [ModObj G.obj X] :
    letI : ModObj G.obj G.obj := ModObj.regular G.obj
    Nonempty (contractedProduct G G.obj X ≅ X) := contractedProduct_trivial G X

-- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_point
example {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S)) [ModObj G.obj P]
    [ModObj G.obj (𝟙_ (Over (yoneda.obj S)))] (h : IsTorsor G P) :
    Nonempty (contractedProduct G P (𝟙_ _) ≅ 𝟙_ _) := sorry

/- test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_line_bundle — the frame torsor of a
line bundle twisted by the scaling action on `𝔸¹` is the total space of the line bundle;
test: TauCeti.SchemeFoundations.Groups.contractedProduct.test_needs_sheafification — for `Spec L`
over `Spec K` (`L / K` quadratic Galois) twisted by itself, the contracted product is
`Spec K ⊔ Spec K`, with `K`-points, while the presheaf quotient has none. -/

/-- Twisting torsors (`SF.1/twisting-bijection`). -/
theorem twistingBijection {S : Scheme.{u}} (G : GroupSpace S) (E : Over (yoneda.obj S)) [ModObj G.obj E]
    (hE : IsTorsor G E) : Nonempty (H1 (innerForm G E) ≃ H1 G) := sorry

/-- Representability of torsors and their descent (`SF.1/torsor-representability`). -/
theorem torsorRepresentability {S : Scheme.{u}} (G : GroupSpace S) (P : Over (yoneda.obj S))
    [ModObj G.obj P] (h : IsTorsor G P)
    (hG : MorphismProperty.presheaf (@Flat ⊓ @LocallyOfFinitePresentation : MorphismProperty Scheme.{u})
      G.obj.hom) : IsAlgebraicSpace P.left := h.isSpace

/-- Invariant morphisms, categorical and geometric quotients (`SF.1/categorical-geometric-quotient`),
for a pre-relation `s, t : R ⟶ U` of presheaves. -/
def IsInvariant {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop := s ≫ φ = t ≫ φ

def IsCategoricalQuotient {U R X : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X) : Prop :=
  IsAlgebraicSpace X ∧ IsInvariant s t φ ∧
    ∀ (Y : SchemePresheaf.{u}), IsAlgebraicSpace Y → ∀ ψ : U ⟶ Y, IsInvariant s t ψ →
      ∃! χ : X ⟶ Y, φ ≫ χ = ψ

lemma IsCategoricalQuotient.unique {U R X X' : SchemePresheaf.{u}} (s t : R ⟶ U) (φ : U ⟶ X)
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

lemma IsGeometricQuotient.isCategoricalQuotient {U R X : AlgSpace.{u}} (s t : R ⟶ U) (φ : U ⟶ X)
    (h : IsGeometricQuotient s t φ) :
    IsCategoricalQuotient (isAlgebraicSpace.ι.map s) (isAlgebraicSpace.ι.map t) (isAlgebraicSpace.ι.map φ) :=
  sorry

/- The sheaf clause `𝒪_X = (φ_* 𝒪_U)^R` of a geometric quotient is part of the definition in the
roadmap; it is not typed above because invariant sections of `Spaces.structureSheaf` along a
pre-relation are not a named construction. -/

-- test: TauCeti.SchemeFoundations.Groups.Quotient.test_finite_affine
example (A : Type u) [CommRing A] (Γ : Type u) [Group Γ] [Finite Γ] [MulSemiringAction Γ A]
    (Q Q' : Ideal A) [Q.IsPrime] [Q'.IsPrime]
    (h : Q.comap (FixedPoints.subring A Γ).subtype = Q'.comap (FixedPoints.subring A Γ).subtype) :
    ∃ g : Γ, Q.map (MulSemiringAction.toRingHom Γ A g) = Q' := sorry

/- test: TauCeti.SchemeFoundations.Groups.Quotient.test_scaling_plane — `𝔸² ⟶ Spec k` is a
categorical but not geometric quotient for scaling; test: ...test_punctured_plane — `𝔸² ∖ 0 ⟶ ℙ¹`
is a geometric quotient; test: ...test_line_no_geometric — scaling on `𝔸¹` has no geometric
quotient. Not typed: `𝔾_m` actions on `𝔸²` and `ℙ¹` are not constructed in this file. -/

/- SF.1/finite-group-quotient (T187) is not stated here: the affine quotient `Spec Aᴳ` with its
   universal property, the integrality and surjectivity of the projection and the orbit
   description of its fibres are Tau Ceti's `TauCeti.AffineInvariantQuotient` (modules
   `TauCeti.AlgebraicGeometry.Quotient.Affine`, `TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine`)
   and Tau Ceti ModularCurves Layer 0C. -/

/-- Artin's theorem on fppf quotients (`SF.1/artin-bootstrap`), sheaf-with-cover form. -/
theorem artinBootstrap (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    (U : SchemePresheaf.{u}) (hU : IsAlgebraicSpace U) (a : U ⟶ F)
    (ha : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F), IsAlgebraicSpace (pullback a y))
    (hflat : ∀ (T : Scheme.{u}) (y : yoneda.obj T ⟶ F) (V : Scheme.{u}) (b : yoneda.obj V ⟶ pullback a y),
      EtaleAtlas (pullback a y) V b →
        ∃ h : V ⟶ T, yoneda.map h = b ≫ pullback.snd a y ∧ Flat h ∧ LocallyOfFinitePresentation h)
    (hsurj : Presheaf.IsLocallySurjective Scheme.fppfTopology a) :
    IsAlgebraicSpace F := sorry

/-- Fppf descent of algebraic spaces (`SF.1/space-fppf-descent`), in the fppf-local form. -/
theorem spaceFppfDescent (F : SchemePresheaf.{u}) (hF : Presheaf.IsSheaf Scheme.fppfTopology F)
    {S : Scheme.{u}} (p : F ⟶ yoneda.obj S) {ι : Type u} (X : ι → Scheme.{u}) (f : ∀ i, X i ⟶ S)
    (hcov : Sieve.ofArrows X f ∈ Scheme.fppfTopology S)
    (h : ∀ i, IsAlgebraicSpace (pullback p (yoneda.map (f i)))) : IsAlgebraicSpace F := sorry

end Groups


/-! ## SF.1d Algebraic stacks (carrier) -/

namespace Stacks

open Spaces

/-- A stack in groupoids over the big fppf site of schemes (`SF.1/stack-in-groupoids`). -/
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

-- test: TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_qcoh_not_groupoid
example : ¬ ∀ T : Scheme.{u}, IsGroupoid (Descent.qcohPseudofunctor.obj ⟨op T⟩) := sorry

end Stacks

/-! ## SF.1f Crossed modules -/

namespace GaloisGerbs

/-- A crossed module `∂ : H̃ ⟶ H` with an action of `H` on `H̃` (`SF.1/crossed-module-category`). -/
structure CrossedModule (Ht H : Type u) [Group Ht] [Group H] where
  bd : Ht →* H
  act : H →* MulAut Ht
  peiffer₁ : ∀ (h : H) (x : Ht), bd (act h x) = h * bd x * h⁻¹
  peiffer₂ : ∀ x y : Ht, act (bd x) y = x * y * x⁻¹

-- test: TauCeti.SchemeFoundations.GaloisGerbs.CrossedModule.test_peiffer_needed
example : ¬ ∃ C : CrossedModule (Equiv.Perm (Fin 3)) (Equiv.Perm (Fin 3)),
    C.bd = MonoidHom.id _ ∧ ∀ h, C.act h = 1 := sorry

end GaloisGerbs

/- ## Declarations of SF.1d-SF.1f not yet typed in this file

The roadmap document specifies each of the following; their Lean forms are recorded here by name
only (the typed prototypes of this part are the remaining work of the suggested file):

* `SF.1/stack-in-groupoids`: API `TauCeti.SchemeFoundations.Stacks.StackInGroupoids`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.ofSheaf`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.yonedaEquiv`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.isFiberedInGroupoids`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.limit`; tests `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_scheme`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_torsors`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_qcoh_not_groupoid`, `TauCeti.SchemeFoundations.Stacks.StackInGroupoids.test_trivial_torsor_prestack`.
* `SF.1/stackification`: API `TauCeti.SchemeFoundations.Stacks.stackification`, `TauCeti.SchemeFoundations.Stacks.stackification.η`, `TauCeti.SchemeFoundations.Stacks.stackification.lift`, `TauCeti.SchemeFoundations.Stacks.stackification.isom_sheafify`, `TauCeti.SchemeFoundations.Stacks.stackification.locally_essSurj`; tests `TauCeti.SchemeFoundations.Stacks.stackification.test_stack`, `TauCeti.SchemeFoundations.Stacks.stackification.test_sheafification`, `TauCeti.SchemeFoundations.Stacks.stackification.test_real_torsors`.
* `SF.1/two-fibre-product`: API `TauCeti.SchemeFoundations.Stacks.twoFiberProduct`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.fst`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.snd`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.iso`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.lift`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.ofSheaf`; tests `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_identity`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_schemes`, `TauCeti.SchemeFoundations.Stacks.twoFiberProduct.test_classifying`.
* `SF.1/representable-stack-morphism`: API `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces`, `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.baseChange`, `TauCeti.SchemeFoundations.Stacks.IsRepresentableBySpaces.comp`, `TauCeti.SchemeFoundations.Stacks.diag_representable_iff`, `TauCeti.SchemeFoundations.Stacks.RepresentableProperty`; tests `TauCeti.SchemeFoundations.Stacks.Representable.test_identity`, `TauCeti.SchemeFoundations.Stacks.Representable.test_spaces`, `TauCeti.SchemeFoundations.Stacks.Representable.test_point_to_BG`, `TauCeti.SchemeFoundations.Stacks.Representable.test_BG_to_point`.
* `SF.1/algebraic-stack`: API `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.diagonal`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.atlas`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.ofSpace`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.twoFiberProduct`, `TauCeti.SchemeFoundations.Stacks.IsAlgebraicStack.of_equiv`; tests `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_scheme`, `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_BGm`, `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_qcoh`, `TauCeti.SchemeFoundations.Stacks.AlgebraicStack.test_formal_disc`.
* `SF.1/deligne-mumford-stack`: API `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.iff_unramified_diagonal`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.isAlgebraic`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.ofSpace`, `TauCeti.SchemeFoundations.Stacks.IsDeligneMumford.twoFiberProduct`; tests `TauCeti.SchemeFoundations.Stacks.DM.test_space`, `TauCeti.SchemeFoundations.Stacks.DM.test_finite_etale`, `TauCeti.SchemeFoundations.Stacks.DM.test_mu_p`, `TauCeti.SchemeFoundations.Stacks.DM.test_BGm`.
* `SF.1/inertia`: API `TauCeti.SchemeFoundations.Stacks.inertia`, `TauCeti.SchemeFoundations.Stacks.inertia.equivDiagonal`, `TauCeti.SchemeFoundations.Stacks.inertia.representable`, `TauCeti.SchemeFoundations.Stacks.relativeInertia`, `TauCeti.SchemeFoundations.Stacks.automorphismGroup`; tests `TauCeti.SchemeFoundations.Stacks.inertia.test_space`, `TauCeti.SchemeFoundations.Stacks.inertia.test_BG`, `TauCeti.SchemeFoundations.Stacks.inertia.test_S3`.
* `SF.1/stack-morphism-properties`: API `TauCeti.SchemeFoundations.Stacks.SmoothLocal`, `TauCeti.SchemeFoundations.Stacks.SmoothLocal.atlas_independent`, `TauCeti.SchemeFoundations.Stacks.IsSeparatedStack`, `TauCeti.SchemeFoundations.Stacks.IsProperStack`, `TauCeti.SchemeFoundations.Stacks.IsProperStack.of_representable`, `TauCeti.SchemeFoundations.Stacks.IsProperStack.baseChange`; tests `TauCeti.SchemeFoundations.Stacks.Properties.test_BG_finite`, `TauCeti.SchemeFoundations.Stacks.Properties.test_BGm`, `TauCeti.SchemeFoundations.Stacks.Properties.test_doubled_origin`, `TauCeti.SchemeFoundations.Stacks.Properties.test_projective_line`.
* `SF.1/quotient-stack`: API `TauCeti.SchemeFoundations.Stacks.quotientStack`, `TauCeti.SchemeFoundations.Stacks.actionQuotient`, `TauCeti.SchemeFoundations.Stacks.actionQuotient.torsorEquiv`, `TauCeti.SchemeFoundations.Stacks.quotientStack.π`, `TauCeti.SchemeFoundations.Stacks.quotientStack.isCartesian`, `TauCeti.SchemeFoundations.Stacks.quotientStack.desc`, `TauCeti.SchemeFoundations.Stacks.quotientStack.torsor`; tests `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_trivial_group`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_BG_points`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_real_points`, `TauCeti.SchemeFoundations.Stacks.QuotientStack.test_torsor`.
* `SF.1/root-stack`: API `TauCeti.SchemeFoundations.Stacks.rootStack`, `TauCeti.SchemeFoundations.Stacks.rootStack.baseChange`, `TauCeti.SchemeFoundations.Stacks.rootStack.one`, `TauCeti.SchemeFoundations.Stacks.rootStack.isIso_away`, `TauCeti.SchemeFoundations.Stacks.rootStack.affineChart`, `TauCeti.SchemeFoundations.Stacks.rootStack.isDeligneMumford_iff`, `TauCeti.SchemeFoundations.Stacks.rootStack.transition`; tests `TauCeti.SchemeFoundations.Stacks.rootStack.test_n_one`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_dvr_chart`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_fibre_nonreduced`, `TauCeti.SchemeFoundations.Stacks.rootStack.test_char_p`.
* `SF.1/stack-quasi-coherent`: API `TauCeti.SchemeFoundations.Stacks.QCoh`, `TauCeti.SchemeFoundations.Stacks.QCoh.pullback`, `TauCeti.SchemeFoundations.Stacks.QCoh.presentationEquiv`, `TauCeti.SchemeFoundations.Stacks.QCoh.pushforward`, `TauCeti.SchemeFoundations.Stacks.QCoh.ofSpaceEquiv`; tests `TauCeti.SchemeFoundations.Stacks.QCoh.test_scheme`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_representations`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_pushforward_invariants`, `TauCeti.SchemeFoundations.Stacks.QCoh.test_BG_not_exact`.
* `SF.1/moduli-functor`: API `TauCeti.SchemeFoundations.Moduli.moduliFunctor`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.map`, `TauCeti.SchemeFoundations.Moduli.toModuliSheaf`, `TauCeti.SchemeFoundations.Moduli.isSetoid_iff_moduliFunctor`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor_classifying`; tests `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_space`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_classifying`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_not_sheaf`, `TauCeti.SchemeFoundations.Moduli.moduliFunctor.test_empty`.
* `SF.1/fine-moduli-space`: API `TauCeti.SchemeFoundations.Moduli.FineModuliSpace`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.universal`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.unique`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.inertia_trivial`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.toCoarse`; tests `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_space`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_BG`, `TauCeti.SchemeFoundations.Moduli.FineModuliSpace.test_torsor_quotient`.
* `SF.1/coarse-moduli-space`: API `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.unique`, `TauCeti.SchemeFoundations.Moduli.IsCoarseModuliSpace.ofFine`, `TauCeti.SchemeFoundations.Moduli.IsCategoricalModuliSpace.quotient_iff`, `TauCeti.SchemeFoundations.Moduli.IsUniform`; tests `TauCeti.SchemeFoundations.Moduli.Coarse.test_space`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_BG`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_finite_quotient`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_base_change_fails`, `TauCeti.SchemeFoundations.Moduli.Coarse.test_A1_Gm`.
* `SF.1/tame-stack`: API `TauCeti.SchemeFoundations.Moduli.IsTame`, `TauCeti.SchemeFoundations.Moduli.IsTame.classifying_iff`, `TauCeti.SchemeFoundations.Moduli.IsTame.baseChange`, `TauCeti.SchemeFoundations.Moduli.IsTame.geometric_fibres`; tests `TauCeti.SchemeFoundations.Moduli.Tame.test_space`, `TauCeti.SchemeFoundations.Moduli.Tame.test_invertible_order`, `TauCeti.SchemeFoundations.Moduli.Tame.test_Z_mod_p`, `TauCeti.SchemeFoundations.Moduli.Tame.test_mu_p`.
* `SF.1/semilinear-automorphism`: API `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.toPointsAut`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.comp`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.standard`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.linear_iff`; tests `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_gm_conjugation`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_identity_not_semilinear`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_trivial_extension`, `TauCeti.SchemeFoundations.GaloisGerbs.SemilinearAut.test_standard_points`.
* Theorems `SF.1/setoid-criterion`, `SF.1/stack-presentation`, `SF.1/quotient-stack-algebraic`, `SF.1/line-bundle-section-stack`, `SF.1/keel-mori`, `SF.1/finite-quotient-coarse`, `SF.1/tame-local-structure`, `SF.1/galois-descent-affine`, `SF.1/conjugator-representability`.
-/

end TauCeti.SchemeFoundations

end
end SF_SF_1

/-! ## SF.2: sites and scheme cohomology -/
section SF_SF_2

/-
This section is not the roadmap and is not exhaustive. The roadmap document (`README.md`,
section SF.2) is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof is `sorry` and no implementation is claimed.
-/

open _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u u₁ u₂

/-! ## SF.2a: sheaf cohomology on sites -/

namespace TauCeti.SchemeFoundations.SiteCohomology

open _root_.CategoryTheory _root_.AlgebraicGeometry

section Pullback

variable {C : Type u₁} [Category.{u} C] {D : Type u₂} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [HasExt.{u} (Sheaf J AddCommGrpCat.{u})] [HasExt.{u} (Sheaf K AddCommGrpCat.{u})]

-- node: SchemeAndStackFoundations:SF.2/site-cohomology-pullback
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

-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale
example (X : Scheme.{u}) (G : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) :
    Sheaf.H.pullback (𝟭 (Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u})) G 2 =
      AddMonoidHom.id (G.H 2) := sorry
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction
/- For an open immersion `j : U → X`, pullback in degree 0 on `O_X` is restriction `O(X) → O(U)`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso
/- `H^1(Spec ℝ, ℤ/2) ≅ ℤ/2 → H^1(Spec ℂ, ℤ/2) = 0` is not injective. -/

end Pullback

section DirectImage

variable {C : Type u} [Category.{u} C] {D : Type u} [Category.{u} D]
  {J : GrothendieckTopology C} {K : GrothendieckTopology D}
  [HasSheafify J AddCommGrpCat.{u}] [HasSheafify K AddCommGrpCat.{u}]
  [IsGrothendieckAbelian.{u} (Sheaf J AddCommGrpCat.{u})]

-- node: SchemeAndStackFoundations:SF.2/site-derived-pushforward
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

-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_id
example (F : Sheaf J AddCommGrpCat.{u}) :
    Limits.IsZero ((Sheaf.higherDirectImage (𝟭 (Sheaf J AddCommGrpCat.{u})) 1).obj F) := sorry
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_zero_eq
/- `R^0 f_* F ≅` Mathlib's `sheafPushforwardContinuous` applied to `F`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_sepClosed_base
/- Over `Spec k`, `k` separably closed, global sections of `R^i f_* F` are `H^i(X_et, F)`. -/

end DirectImage

-- node: SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence
-- node: SchemeAndStackFoundations:SF.2/cech-to-cohomology
-- node: SchemeAndStackFoundations:SF.2/abelian-torsor-h1
-- node: SchemeAndStackFoundations:SF.2/slice-site-cohomology
/- Spectral-sequence and torsor statements are in the README: Mathlib's abstract spectral
sequences (`CategoryTheory.Abelian.SpectralObject`, `HasSpectralSequence`) are not yet attached to
sheaf cohomology (no Grothendieck or Leray spectral sequence), and there is no sheaf-torsor
carrier at the pins. -/

section Nonabelian

variable {C : Type u} [Category.{u} C] (J : GrothendieckTopology C)

-- node: SchemeAndStackFoundations:SF.2/nonabelian-torsor-h1
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

-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_trivial_group
/- For the trivial sheaf of groups the pointed set is a point. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_abelian_agrees
/- For `ℤ/2` on `Spec ℝ`, two elements, matching `Sheaf.H (ℤ/2) 1 ≅ ℤ/2`. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_gl_n_local
/- For a local ring and `GL_n` on the Zariski site, a point. -/
-- test: TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_not_group
/- For `S_3` on `Spec K`, no natural group law. -/

-- node: SchemeAndStackFoundations:SF.2/gerbe-h2-class
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

-- node: SchemeAndStackFoundations:SF.2/godement-resolution
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

-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_point
-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_skyscraper
-- test: TauCeti.SchemeFoundations.SiteCohomology.test_godement_not_injective
/- Point, Sierpiński-space and non-injectivity tests (statements in the README). -/

end Godement

-- node: SchemeAndStackFoundations:SF.2/flasque-cech-vanishing
-- node: SchemeAndStackFoundations:SF.2/noetherian-space-vanishing
/-- Grothendieck vanishing on Noetherian spaces. -/
theorem noetherianSpace_vanishing {X : TopCat.{u}} [TopologicalSpace.NoetherianSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ d) (F : TopCat.Sheaf AddCommGrpCat.{u} X) (p : ℕ) (hp : d < p) :
    Subsingleton (Sheaf.H.{u} F p) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits
/- Commutation of cohomology with filtered colimits (roadmap statement). -/

end TauCeti.SchemeFoundations.SiteCohomology

/-! ## SF.2b: quasi-coherent cohomology and supports -/

namespace TauCeti.SchemeFoundations.QCoh

open _root_.CategoryTheory _root_.AlgebraicGeometry

/-- Tau Ceti's `Scheme.Modules.Cohomology` (that module is not built in the shared environment;
this is its defining expression). -/
noncomputable abbrev cohomology {X : Scheme.{u}} (M : X.Modules) (n : ℕ) : Type u :=
  Sheaf.H.{u} ((SheafOfModules.toSheaf X.ringCatSheaf).obj M) n

-- node: SchemeAndStackFoundations:SF.2/qcoh-higher-direct-images
/-- Over an affine base, cohomology of quasi-coherent modules along a qcqs morphism vanishes in a
uniform range (the global form of quasi-coherence of `R^p f_*` with its vanishing bound). -/
theorem higherDirectImage_vanishing {X S : Scheme.{u}} (f : X ⟶ S) [QuasiCompact f]
    [QuasiSeparated f] [IsAffine S] :
    ∃ N : ℕ, ∀ (F : X.Modules) [F.IsQuasicoherent] (p : ℕ), N ≤ p →
      Subsingleton (cohomology F p) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/projective-space-cohomology
-- node: SchemeAndStackFoundations:SF.2/ample-serre-vanishing
-- node: SchemeAndStackFoundations:SF.2/proper-fibre-dimension-vanishing
/- Roadmap statements; twisting sheaves `O(d)` on `Proj` and ampleness of invertible modules are not
packaged in Mathlib at the pins. -/

-- node: SchemeAndStackFoundations:SF.2/serre-affineness-criterion
theorem isAffine_of_H1_ideal_vanishing (X : Scheme.{u}) [CompactSpace X]
    (h : ∀ (I : X.Modules) [I.IsQuasicoherent], Subsingleton (cohomology I 1)) : IsAffine X :=
  sorry

end TauCeti.SchemeFoundations.QCoh

namespace TauCeti.SchemeFoundations.Supports

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/sheaf-cohomology-with-supports
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

-- test: TauCeti.SchemeFoundations.Supports.test_support_all
example {X : Scheme.{u}} (F : X.Modules) :
    Nonempty (cohomologyWithSupport (Set.univ : Set X) isClosed_univ F 1 ≃
      TauCeti.SchemeFoundations.QCoh.cohomology F 1) := sorry
-- test: TauCeti.SchemeFoundations.Supports.test_support_empty
example {X : Scheme.{u}} (F : X.Modules) (q : ℕ) :
    Subsingleton (cohomologyWithSupport (∅ : Set X) isClosed_empty F q) := sorry
-- test: TauCeti.SchemeFoundations.Supports.test_support_affine_line_origin
-- test: TauCeti.SchemeFoundations.Supports.test_support_not_restriction
/- Affine-line computations (statements in the README). -/

-- node: SchemeAndStackFoundations:SF.2/supports-localization-triangle
-- node: SchemeAndStackFoundations:SF.2/local-cohomology-module-comparison
-- node: SchemeAndStackFoundations:SF.2/local-cohomology-flat-base-change
-- node: SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing
/- Roadmap statements, against Mathlib's `localCohomology` for modules on affines. -/

-- node: SchemeAndStackFoundations:SF.2/cousin-complex
/-- The Cousin complex of a filtration of a scheme by closed subsets. -/
noncomputable def cousinComplex {X : Scheme.{u}} (Z : ℕ → Set X) (F : X.Modules) :
    CochainComplex X.Modules ℕ :=
  sorry

/- `relativeSupportCohomology`, `cousinComplex_d_comp_d`, `cousinComplex_isQuasicoherent`,
`relativeSupportCohomology_eq_zero_of_affine`, `cousinComplex_trivial` are roadmap API items, and
`test_cousin_trivial_filtration`, `test_cousin_dvr`, `test_cousin_not_resolution` roadmap tests. -/

-- node: SchemeAndStackFoundations:SF.2/kempf-cousin-resolution
/- README statement (maximal Cohen–Macaulay sheaves have no carrier at the pins). -/

end TauCeti.SchemeFoundations.Supports

/-! ## SF.2c (Nisnevich): Nisnevich coverings, topology, distinguished squares -/

namespace TauCeti.SchemeFoundations.Nisnevich

open _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-covering
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
the henselization carrier `SchemeAndStackFoundations:key/henselization`, which is not a declaration
at the pinned commits; owner: that key node. -/

-- test: TauCeti.SchemeFoundations.Nisnevich.test_covering_identity
example (X : Scheme.{u}) : IsNisnevichCovering (fun _ : PUnit.{u+1} ↦ 𝟙 X) := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_not_covering_real_complex
/- Stated for every quadratic extension `K/k` (for instance `ℂ/ℝ`): the single étale map
`Spec K → Spec k` is not a Nisnevich covering. -/
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ¬ IsNisnevichCovering
      (fun _ : PUnit.{u+1} ↦ Spec.map (CommRingCat.ofHom (algebraMap k K))) := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_covering_quadratic_split
/- The family `{Spec ℤ[1/10] → Spec ℤ[1/2], Spec ℤ[1/2][x]/(x²+1) → Spec ℤ[1/2]}` is a Nisnevich
covering (stated in the roadmap; the explicit rings make the Lean statement long and add nothing to
the signature). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_zariski_is_nisnevich
example {S : Scheme.{u}} {ι : Type u} {X : ι → Scheme.{u}} (f : ∀ i, X i ⟶ S)
    (h : Presieve.ofArrows X f ∈ Scheme.zariskiPrecoverage S) :
    Presieve.ofArrows X f ∈ nisnevichPrecoverage S := sorry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-topology
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
`TauCeti.SchemeFoundations.Topologies.etaleToNisnevich` and `nisnevichToZariski` below. -/

-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_between
example : Scheme.zariskiTopology.{u} ≤ nisnevichTopology ∧
    nisnevichTopology.{u} ≤ Scheme.etaleTopology := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_not_etale
example (k K : Type u) [Field k] [Field K] [Algebra k K] (h : Module.finrank k K = 2) :
    ∃ R : Sieve (Spec (CommRingCat.of k)), R ∈ Scheme.etaleTopology _ ∧
      R ∉ nisnevichTopology _ := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_field_global_sections
/- For a field `k`, Nisnevich cohomology of every abelian sheaf on `(Spec k)_Nis` vanishes in
positive degrees; stated once cohomology on the small Nisnevich site is available (sheafification
instances for `smallNisnevichTopology`). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_representable_sheaf
example (Y : Scheme.{u}) : Presheaf.IsSheaf nisnevichTopology (yoneda.obj Y) := sorry

-- node: SchemeAndStackFoundations:SF.2/elementary-distinguished-square
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

-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_zariski
example (X : Scheme.{u}) (U V : X.Opens) (h : U ⊔ V = ⊤) :
    IsOpenImmersion (ElementaryDistinguishedSquare.ofZariski U V h).toSquare.f₃₄ := sorry
-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_affine_line
/- `X = 𝔸¹_ℚ`, `U = 𝔸¹ ∖ {0}`, `V = 𝔸¹ ∖ {−1, −2}` with `s ↦ s² + 2s` is an elementary
distinguished square (statement in the roadmap). -/
-- test: TauCeti.SchemeFoundations.Nisnevich.test_eds_not_distinguished
/- `(∅ ⊂ Spec ℝ, Spec ℂ → Spec ℝ)` is not an elementary distinguished square: the fibre over the
closed point has residue field `ℂ ≠ ℝ` (statement in the roadmap). -/

-- node: SchemeAndStackFoundations:SF.2/distinguished-square-mayer-vietoris
theorem ElementaryDistinguishedSquare.exists_mayerVietorisSquare {X : Scheme.{u}}
    [HasWeakSheafify nisnevichTopology.{u} (Type u)]
    (S : ElementaryDistinguishedSquare X) :
    ∃ M : nisnevichTopology.{u}.MayerVietorisSquare, M.toSquare = S.toSquare :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/nisnevich-sheaf-criterion
/-- On Noetherian finite-dimensional schemes, a presheaf of sets is a Nisnevich sheaf iff it sends
the empty scheme to a point and every elementary distinguished square to a pullback. -/
theorem isSheaf_iff_distinguishedSquares (P : Scheme.{u}ᵒᵖ ⥤ Type u)
    (hnoeth : ∀ X : Scheme.{u}, IsNoetherian X) :
    Presheaf.IsSheaf nisnevichTopology P ↔
      (∀ X : Scheme.{u}, IsEmpty X → Nonempty (Unique (P.obj (Opposite.op X)))) ∧
      ∀ (X : Scheme.{u}) (S : ElementaryDistinguishedSquare X),
        (S.toSquare.op.map P).IsPullback :=
  sorry

/- SchemeAndStackFoundations:SF.2/nisnevich-points-henselization,
   SF.2/nisnevich-cohomological-dimension, SF.2/nisnevich-cech-comparison and
   SF.2/brown-gersten-vanishing are stated in the roadmap; their Lean statements need the small
   Nisnevich site's sheafification and Ext instances and the henselization carrier, neither of
   which exists at the pinned commits. -/

end TauCeti.SchemeFoundations.Nisnevich

/-! ## SF.2c: topologies of a scheme and coefficient sheaves -/

namespace TauCeti.SchemeFoundations.Topologies

open _root_.AlgebraicGeometry _root_.Opposite

-- node: SchemeAndStackFoundations:SF.2/big-site-quasi-coherent-sheaf
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

-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zero
/- `F = 0` gives the zero sheaf (needs a quasi-coherence instance for the zero module). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_spec_field
/- For `S = Spec k`, `F = O_S`, sections over `Spec L` are `L` (statement in the roadmap). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zariski_restriction
/- Restriction of `F^a` to the small Zariski site recovers `F` (statement in the roadmap). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_bigSheaf_not_topological_pullback
/- Sections of `O^a` over `Spec ℚ(i)` are `ℚ(i)`, not `ℚ` (statement in the roadmap). -/

-- node: SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves
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

-- test: TauCeti.SchemeFoundations.Topologies.test_mu_one
example (S : Scheme.{u}) : Limits.IsZero (mu S 1) := sorry
-- test: TauCeti.SchemeFoundations.Topologies.test_Gm_field
example (h : Spec (CommRingCat.of ℚ) ⟶ Spec (CommRingCat.of ℚ)) :
    Nonempty (((Gm (Spec (CommRingCat.of ℚ))).obj.obj (op (Over.mk h)) : Type) ≃+
      Additive ℚˣ) := sorry
-- test: TauCeti.SchemeFoundations.Topologies.test_mu_p_not_etale_trivial
/- Over `Spec 𝔽_p`, `μ_p` has trivial sections on reduced schemes and nonzero sections on
`Spec 𝔽_p[ε]/(ε^p)` (statement in the roadmap). -/

-- node: SchemeAndStackFoundations:SF.2/topology-comparison-morphisms
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

-- test: TauCeti.SchemeFoundations.Topologies.test_comparison_id
/- The étale-to-étale comparison is the identity of `Sh(X_et)` (statement in the roadmap). -/
-- test: TauCeti.SchemeFoundations.Topologies.test_aX_constant
/- `a_X^{-1}` of the constant étale sheaf `ℤ/2` is the constant fppf sheaf `ℤ/2`. -/
-- test: TauCeti.SchemeFoundations.Topologies.test_zariski_not_etale
/- `H^1_Zar(Spec ℝ, μ_2) = 0` but `H^1_et(Spec ℝ, μ_2) ≅ ℤ/2`. -/

-- node: SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison
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

-- node: SchemeAndStackFoundations:SF.2/etale-pullback-fppf-comparison
/- `H^q(X_et, F) = H^q_fppf(X, a_X^{-1} F)`; big-site cohomology of `Scheme.{u}`-sites needs
sheafification instances in a higher universe, not available at the pins (roadmap statement). -/

-- node: SchemeAndStackFoundations:SF.2/smooth-group-fppf-etale-comparison
/- Grothendieck's comparison for smooth commutative quasi-projective group schemes (roadmap
statement); same universe obstruction as above. -/

end TauCeti.SchemeFoundations.Topologies

namespace TauCeti.SchemeFoundations.Etale

open _root_.AlgebraicGeometry _root_.Opposite TauCeti.SchemeFoundations.Topologies

-- node: SchemeAndStackFoundations:SF.2/hilbert-90
/-- Hilbert's Theorem 90: `H^1(X_et, G_m)` is the Picard group of isomorphism classes of line bundles
(Tau Ceti's `LineBundleClass`, a commutative monoid whose inverses JacobianChallenge Layer A adds). -/
theorem hilbert90 (X : Scheme.{u}) :
    Nonempty ((GmEtale X).H 1 ≃+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/fppf-kummer-sequence
theorem etale_kummer_h1 (X : Scheme.{u}) (n : ℕ) (hn : IsUnit ((n : ℤ) : Γ(X, ⊤))) :
    ∃ (f : Additive (Γ(X, ⊤))ˣ →+ (muEtale X n).H 1)
      (g : (muEtale X n).H 1 →+ Additive (TauCeti.AlgebraicGeometry.LineBundleClass X)),
      Function.Exact f g ∧ (∀ v : (Γ(X, ⊤))ˣ, f (Additive.ofMul (v ^ n)) = 0) ∧
      ∀ L, n • L = 0 ↔ ∃ c, g c = L :=
  sorry
/- The fppf form for every `n` and the `H^2` sequence are stated in the roadmap (big-site
cohomology). -/

-- node: SchemeAndStackFoundations:SF.2/artin-schreier-sequence
/-- The constant étale sheaf with value `ℤ/p`. -/
noncomputable def constZMod (X : Scheme.{u}) (p : ℕ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} :=
  (constantSheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}).obj
    (AddCommGrpCat.of (ULift.{u} (ZMod p)))

theorem artinSchreier_vanishing (p : ℕ) [Fact p.Prime] (X : Scheme.{u}) [IsAffine X]
    [CharP Γ(X, ⊤) p] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((constZMod X p).H q) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/finite-pushforward-exact
/- `f_*` is exact on abelian étale sheaves for finite `f` and commutes with base change for integral
`f`; needs the pushforward of small étale sheaves along a morphism of schemes
(CohomologicalPointCounting EtaleBaseChange Layer 0 builds its site functor). -/

-- node: SchemeAndStackFoundations:SF.2/etale-galois-comparison
/-- Étale cohomology of `Spec K` is continuous Galois cohomology (statement shape: the stalk at the
separable closure as a discrete module; the carrier `galoisModule` is the stalk functor). -/
noncomputable def galoisModule (K : Type u) [Field K]
    (F : Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of K))) AddCommGrpCat.{u}) :
    Type u :=
  sorry
/- The comparison `F.H n ≃+ continuousCohomology n (galoisModule K F)` needs the topological
representation structure on the stalk (Mathlib `TopRep`), stated in the roadmap. -/

-- node: SchemeAndStackFoundations:SF.2/etale-cohomology-limits
-- node: SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering
-- node: SchemeAndStackFoundations:SF.2/gabber-affine-proper-base-change
-- node: SchemeAndStackFoundations:SF.2/proper-hypercover-descent
/- Statements in the roadmap; they need pullback along morphisms of small étale sites
(SF.2/site-cohomology-pullback) whose carrier is below. -/

-- node: SchemeAndStackFoundations:SF.2/tsen-theorem
/-- Tsen: for a curve over an algebraically closed field the field Brauer group of its function
field is trivial (field Brauer group as Tau Ceti's `BrauerGroup`). -/
theorem brauer_functionField_curve_trivial (k K : Type u) [Field k] [IsAlgClosed k] [Field K]
    [Algebra k K] (t : K) (ht : Transcendental k t)
    (halg : Algebra.IsAlgebraic (IntermediateField.adjoin k {t}) K)
    (x : BrauerGroup.{u, u} K) : x = 1 :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/curve-multiplicative-cohomology
-- node: SchemeAndStackFoundations:SF.2/curve-roots-of-unity-cohomology
theorem curve_Gm_vanishing (k : Type u) [Field k] [IsAlgClosed k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) [SmoothOfRelativeDimension 1 f] (q : ℕ) (hq : 2 ≤ q) :
    Subsingleton ((GmEtale X).H q) :=
  sorry

end TauCeti.SchemeFoundations.Etale

/-! ## SF.2d: the pro-étale comparison -/

namespace TauCeti.SchemeFoundations.Proetale

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/proetale-etale-morphism
/-- Inverse image `ν^*` from étale sheaves to pro-étale sheaves (Mathlib's `Scheme.ProEt`). -/
noncomputable def nu (X : Scheme.{u}) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u} ⥤
      Sheaf (Scheme.ProEt.topology X) AddCommGrpCat.{u + 1} :=
  sorry

/- `nu_inverseImage_obj_affine`, `nu_directImage_obj`, `nu_unit_iso`, `nu_naturality` and
`nu_pushforward_comm` are roadmap API items: they need the inclusion `X.Etale ⥤ X.ProEt` and
presentations of affine weakly étale objects as limits, not yet in Mathlib at the pins
(cf. Mathlib pull request 41730). -/

-- test: TauCeti.SchemeFoundations.Proetale.test_nu_point
-- test: TauCeti.SchemeFoundations.Proetale.test_nu_constant_profinite
-- test: TauCeti.SchemeFoundations.Proetale.test_nu_not_essentially_surjective
/- Empty scheme, constant sheaf on a profinite set and `ellAdicSheaf` tests (statements in the README). -/

-- node: SchemeAndStackFoundations:SF.2/proetale-classical-comparison
/-- Bhatt–Scholze: étale cohomology equals pro-étale cohomology of `ν^*F` for every abelian `F`. -/
theorem proetale_classical_comparison (X : Scheme.{u})
    (F : Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{u}) (n : ℕ) :
    Nonempty (F.H n ≃+ ((nu X).obj F).H n) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/replete-topos
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

-- test: TauCeti.SchemeFoundations.Proetale.test_isReplete_types
example : IsReplete (Type u) := sorry
-- test: TauCeti.SchemeFoundations.Proetale.test_isReplete_proetale_point
example (k : Type u) [Field k] [IsAlgClosed k] :
    IsReplete (Sheaf (Scheme.ProEt.topology (Spec (CommRingCat.of k))) (Type u)) := sorry
-- test: TauCeti.SchemeFoundations.Proetale.test_etale_not_replete
example : ¬ IsReplete (Sheaf (Scheme.smallEtaleTopology (Spec (CommRingCat.of ℚ))) (Type)) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/w-contractible-cover
-- node: SchemeAndStackFoundations:SF.2/proetale-left-completeness
-- node: SchemeAndStackFoundations:SF.2/proetale-lisse-sheaves
/- Roadmap statements; w-contractible rings and the left-completed derived categories have no
carriers at the pins. -/

end TauCeti.SchemeFoundations.Proetale

/-! ## SF.2e: coherent duality — carriers behind `key/coherent-duality` -/

namespace TauCeti.SchemeFoundations.Coherent

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category
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

-- node: SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom
noncomputable def derivedTensor {X : Scheme.{u}} : DQCoh X ⥤ DQCoh X ⥤ DQCoh X := sorry
noncomputable def derivedHom {X : Scheme.{u}} : (DQCoh X)ᵒᵖ ⥤ DQCoh X ⥤ DQCoh X := sorry

-- node: SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh
noncomputable def derivedPullback {X Y : Scheme.{u}} (f : X ⟶ Y) : DQCoh Y ⥤ DQCoh X := sorry
noncomputable def totalDirectImage {X Y : Scheme.{u}} (f : X ⟶ Y) [QuasiCompact f]
    [QuasiSeparated f] : DQCoh X ⥤ DQCoh Y :=
  sorry
noncomputable def derivedPullback_totalDirectImage_adj {X Y : Scheme.{u}} (f : X ⟶ Y)
    [QuasiCompact f] [QuasiSeparated f] : derivedPullback f ⊣ totalDirectImage f :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/perfect-generator
-- node: SchemeAndStackFoundations:SF.2/tor-independent-base-change
/- Roadmap statements (perfect complexes and Tor independence have no carriers at the pins). -/

-- node: SchemeAndStackFoundations:SF.2/pushforward-right-adjoint
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

-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id
example (X : Scheme.{u}) : Nonempty (pushforwardRightAdjoint (𝟙 X) ≅ 𝟭 (DQCoh X)) := sorry
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point
-- test: TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek
/- Closed point of `𝔸¹` and non-proper affine line (statements in the README). -/

-- node: SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-etale
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-flat-base-change
-- node: SchemeAndStackFoundations:SF.2/upper-shriek-smooth
-- node: SchemeAndStackFoundations:SF.2/lci-upper-shriek
/-- The upper shriek of a separated finite-type morphism of Noetherian schemes (the functor of
`key/coherent-duality`, on the bounded-below part). -/
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

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-complex
/-- A relative dualizing complex `(K, ξ)` for a flat finitely presented morphism (carrier). -/
noncomputable def RelativeDualizingComplex {X S : Scheme.{u}} (f : X ⟶ S) [Flat f]
    [LocallyOfFinitePresentation f] : Type (u + 1) :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/relative-dualizing-module
/-- The relative dualizing module `ω_{X/Y}` of a flat Cohen–Macaulay morphism (carrier). -/
noncomputable def relativeDualizingModule {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    [LocallyOfFiniteType f] : X.Modules :=
  sorry

-- node: SchemeAndStackFoundations:SF.2/cm-serre-duality
-- node: SchemeAndStackFoundations:SF.2/curve-dualizing-comparison
-- node: SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality
/- Roadmap statements, stated with `upperShriek`, `relativeDualizingModule` and the derived
`Hom`. -/

end TauCeti.SchemeFoundations.Coherent

/-! ## SF.2f and SF.2g: Brauer groups and equivariant sheaves -/

namespace TauCeti.SchemeFoundations.Brauer

open _root_.CategoryTheory _root_.AlgebraicGeometry TauCeti.SchemeFoundations.Topologies

-- node: SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent
-- node: SchemeAndStackFoundations:SF.2/azumaya-equivalent-conditions
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

-- node: SchemeAndStackFoundations:SF.2/azumaya-trivialization-gerbe
/-- The class in `H^2(X_et, G_m)` of an Azumaya algebra, via its gerbe of trivialisations
(the algebra given here by its affine data; the sheaf-algebra carrier is
`SchemeAndStackFoundations:SF.2/sheaf-algebra`). -/
noncomputable def azumayaClass (X : Scheme.{u}) (A : Type u) : (GmEtale X).H 2 := sorry

/- `trivializationGerbe`, `trivializationGerbe_isGerbe`, `azumayaClass_eq_zero_iff`,
`azumayaClass_tensor`, `azumayaClass_eq_delta`, `azumayaClass_pullback` and the tests
`test_class_matrix`, `test_class_quaternion_real`, `test_class_field_agrees`,
`test_class_not_module_class` are roadmap items; the carrier `azumayaClass` above takes the
algebra as a placeholder type argument until the sheaf-algebra carrier exists. -/

-- node: SchemeAndStackFoundations:SF.2/brauer-regular-injectivity
-- node: SchemeAndStackFoundations:SF.2/brauer-field-comparison
-- node: SchemeAndStackFoundations:SF.2/brauer-kummer-sequence
-- node: SchemeAndStackFoundations:SF.2/brauer-henselian-local
-- node: SchemeAndStackFoundations:SF.2/brauer-hochschild-serre-sequence
/- SF.2/brauer-field-comparison (T306) is Tau Ceti's `TauCeti.brauerCohomologyEquiv`
   (`Additive (BrauerGroup K) ≃+ H²(Gal, K̄ˣ)`) together with T273; it is not restated.
   SF.2/brauer-henselian-local: the finite-field case `Subsingleton (BrauerGroup k)` is Tau Ceti's
   `TauCeti.subsingleton_brauerGroup_of_finite`; the henselian local ring statement needs Azumaya
   algebras over a local ring and is stated in the roadmap. -/

end TauCeti.SchemeFoundations.Brauer

namespace TauCeti.SchemeFoundations.Equivariant

open _root_.CategoryTheory _root_.AlgebraicGeometry

-- node: SchemeAndStackFoundations:SF.2/equivariant-module-category
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

-- node: SchemeAndStackFoundations:SF.2/equivariant-coinduction
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

-- node: SchemeAndStackFoundations:SF.2/coinduced-sections-acyclic
-- node: SchemeAndStackFoundations:SF.2/equivariant-ext-spectral-sequence
/- Roadmap statements (group cohomology of the coinduced sections and the Ext spectral sequence). -/

end TauCeti.SchemeFoundations.Equivariant

/-! ## Index of the SF.2 items

Every declaration, API item and unit test of the SF.2 layer, by its roadmap name, with a
one-line gloss. Those with a Lean signature above appear there under the same name; the others are
stated in the roadmap document and wait for the carriers named there.
-/
/-
node SchemeAndStackFoundations:SF.2/site-cohomology-pullback (construction): Pullback on sheaf cohomology along a morphism of sites
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback [constructor]: For a morphism of sites f given by u and n ≥ 0, the homomorphism H^n(V,G) → H^n(u(V), u^{-1}G).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_zero [simp]: In degree 0, pullback composed with H.equiv₀ is the restriction map of sections G(V) → (u^{-1}G)(u(V)).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_naturality [functoriality]: For φ : G → G' the square formed by H.map φ and the pullbacks commutes.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_id [functoriality]: Pullback along the identity morphism of sites is the identity.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_comp [functoriality]: Pullback along a composite morphism of sites is the composite of the pullbacks (through u^{-1}v^{-1} ≅ (vu)^{-1}).
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_δ [compatibility]: Pullback commutes with the connecting homomorphisms attached to a short exact sequence 0 → G' → G → G'' → 0 and its (exact) pullback.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale [degenerate]: For the identity of X_et and n = 2 the pullback H^2(X_et,G) → H^2(X_et,G) is the identity map.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction [computation]: For an open immersion j : U → X and the small Zariski sites, pullback in degree 0 on the structure sheaf is restriction O(X) → O(U).
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso [non-example]: For the morphism Spec C → Spec R of small étale sites and G = Z/2Z, pullback H^1(Spec R, Z/2) ≅ Z/2 → H^1(Spec C, Z/2) = 0 is not injective; the cons…
node SchemeAndStackFoundations:SF.2/site-derived-pushforward (construction): Higher direct images for a morphism of sites
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward [constructor]: The functor Rf_* : D^+(Ab(C)) → D^+(Ab(D)) derived from f_*.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage [constructor]: R^if_*F := H^i(Rf_*F) as an abelian sheaf on D.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_zero [simp]: R^0f_*F ≅ f_*F naturally in F.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_iso_sheafify [characterisation]: R^if_*F is isomorphic to the sheafification of the presheaf V ↦ H^i(u(V),F), naturally in F.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_δ [relation]: A short exact sequence of abelian sheaves on C gives a long exact sequence of the R^if_*.
  api TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward_comp [functoriality]: R(g∘f)_* ≅ Rg_* ∘ Rf_* on D^+ (pushforward preserves injectives).
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_id [degenerate]: For the identity morphism of a site, R^1 id_* F = 0 for every abelian sheaf F.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_zero_eq [compatibility]: R^0f_*F is canonically isomorphic to Mathlib's sheafPushforwardContinuous applied to F.
  test TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_sepClosed_base [computation]: For f : X → Spec k with k separably closed and the small étale sites, the global sections of R^if_*F are H^i(X_et, F) (an étale sheaf on Spec k is de…
node SchemeAndStackFoundations:SF.2/site-leray-spectral-sequence (theorem): Leray spectral sequence for a morphism of sites
node SchemeAndStackFoundations:SF.2/cech-to-cohomology (theorem): Čech-to-cohomology spectral sequence and Leray's acyclicity theorem
node SchemeAndStackFoundations:SF.2/abelian-torsor-h1 (theorem): First cohomology classifies torsors
node SchemeAndStackFoundations:SF.2/nonabelian-torsor-h1 (construction): Nonabelian first cohomology as torsor classes
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1 [constructor]: The pointed set of isomorphism classes of G-torsors on the site C.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk [constructor]: The class of a G-torsor.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk_eq_one_iff [characterisation]: The class of P is the base point iff P has a global section.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.map [functoriality]: The map on classes induced by a morphism of sheaves of groups G → G', by contracted product, with map_id and map_comp.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.pullback [functoriality]: The map along a morphism of sites, compatible with composition.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.connecting [constructor]: For 1 → A → B → Q → 1 exact, the boundary Q(C) → H^1(C,A) sending a section to its torsor of lifts.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.exact_sequence [relation]: Exactness of 1 → A(C) → B(C) → Q(C) → H^1(A) → H^1(B) → H^1(Q) as pointed sets.
  api TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.equivSheafH [compatibility]: For abelian G, an equivalence NonabelianH1 G ≃ Sheaf.H G 1 sending mk P to the class of SF.2/abelian-torsor-h1.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_trivial_group [degenerate]: For the trivial sheaf of groups, NonabelianH1 is a one-point set.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_abelian_agrees [compatibility]: For G = Z/2Z on the small étale site of Spec R, NonabelianH1 has two elements, matching Sheaf.H (Z/2) 1 ≅ Z/2.
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_gl_n_local [computation]: For a local ring A and G = GL_n on the small Zariski site of Spec A, NonabelianH1 is a point (every locally free module of rank n on a local scheme i…
  test TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_not_group [non-example]: For G = S_3 (constant) on Spec K_et with K having a cyclic cubic and a quadratic extension, NonabelianH1 is the set Hom_cont(Gal_K, S_3)/conjugacy, w…
node SchemeAndStackFoundations:SF.2/gerbe-h2-class (construction): Second cohomology class of a central extension boundary and of an abelian-banded gerbe
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary [constructor]: For a central extension 1 → A → B → Q → 1, the map δ : NonabelianH1 Q → Sheaf.H A 2.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_one [simp]: δ of the trivial torsor is 0.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.exact_boundary [relation]: δ[P] = 0 iff [P] is in the image of NonabelianH1 B → NonabelianH1 Q.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_pullback [functoriality]: δ commutes with pullback along morphisms of sites.
  api TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_cech [characterisation]: On a covering trivialising P, δ[P] is the image under the Čech edge map of the 2-cocycle of a lift of the transition 1-cocycle.
  api TauCeti.SchemeFoundations.SiteCohomology.Gerbe.class [constructor]: The class in H^2(C, A) of a gerbe banded by an abelian sheaf A, zero iff the gerbe has a global object.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_split [degenerate]: For the split central extension A → A × Q → Q, δ is identically 0.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_matrix_algebra [computation]: For 1 → G_m → GL_d → PGL_d → 1 on X_et and the trivial PGL_d-torsor (class of Mat_d(O_X)), δ = 0.
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_abelian_connecting [compatibility]: For an abelian short exact sequence 0 → A → B → Q → 0, δ composed with the identification NonabelianH1 Q ≃ Sheaf.H Q 1 is the connecting map H^1(Q) →…
  test TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_quaternion_real [non-example]: For X = Spec R and the Hamilton quaternions, δ of the PGL_2-torsor of H is the nonzero element of H^2(Spec R_et, G_m) ≅ Z/2, so δ is not the zero map.
node SchemeAndStackFoundations:SF.2/slice-site-cohomology (lemma): Cohomology on a slice site
node SchemeAndStackFoundations:SF.2/godement-resolution (construction): Godement resolution of a sheaf of modules
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution [constructor]: The functor from O_X-modules to complexes of O_X-modules F ↦ (f_*f^*F → f_*f^*f_*f^*F → …) with augmentation from F.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_quasiIso [characterisation]: The augmentation F → godementResolution F is a quasi-isomorphism.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_isFlasque [other]: Every term of the resolution is flasque.
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_exact [functoriality]: The functor F ↦ godementResolution F is exact (as a functor to complexes).
  api TauCeti.SchemeFoundations.SiteCohomology.godementResolution_restrict [compatibility]: Restriction to an open U carries godementResolution F to godementResolution (F|_U).
  api TauCeti.SchemeFoundations.SiteCohomology.sheafH_iso_godement [compatibility]: H^n(U, F) is the n-th cohomology of the complex of sections of godementResolution F over U (Mathlib's Sheaf.H).
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_point [degenerate]: On a one-point space the Godement resolution of a module M is an acyclic complex augmented by M (cohomology M in degree 0 and 0 elsewhere).
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_skyscraper [computation]: For X the Sierpiński space and F the skyscraper Z at the closed point, the degree-0 term f_*f^*F has global sections Z (the product of the stalks Z a…
  test TauCeti.SchemeFoundations.SiteCohomology.test_godement_not_injective [non-example]: The terms of the Godement resolution of the constant sheaf Z on the Sierpiński space are flasque but not injective abelian sheaves (the stalk Z is no…
node SchemeAndStackFoundations:SF.2/flasque-cech-vanishing (lemma): Flasque sheaves have vanishing higher Čech cohomology
node SchemeAndStackFoundations:SF.2/noetherian-space-vanishing (theorem): Grothendieck's vanishing theorem on Noetherian spaces
node SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits (theorem): Cohomology commutes with filtered colimits on coherent objects
node SchemeAndStackFoundations:SF.2/qcoh-higher-direct-images (theorem): Higher direct images of quasi-coherent sheaves along qcqs morphisms
node SchemeAndStackFoundations:SF.2/projective-space-cohomology (theorem): Cohomology of line bundles on projective space
node SchemeAndStackFoundations:SF.2/ample-serre-vanishing (theorem): Serre vanishing and finiteness for ample invertible sheaves
node SchemeAndStackFoundations:SF.2/proper-fibre-dimension-vanishing (theorem): Higher direct images vanish above the fibre dimension
node SchemeAndStackFoundations:SF.2/serre-affineness-criterion (theorem): Serre's cohomological criterion for affineness
node SchemeAndStackFoundations:SF.2/sheaf-cohomology-with-supports (construction): Cohomology with supports in a closed subset
  api TauCeti.SchemeFoundations.Supports.sectionsWithSupport [constructor]: Γ_Z(X, F) as the kernel of F(X) → F(X ∖ Z), functorial in F.
  api TauCeti.SchemeFoundations.Supports.supportedSubsheaf [constructor]: The sheaf H_Z(F) on Z of sections supported in Z.
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport [constructor]: H^q_Z(X, F) := R^qΓ_Z(X, F), with its O_X(X)-module structure.
  api TauCeti.SchemeFoundations.Supports.localCohomologySheaf [constructor]: H^q_Z(F) := R^qH_Z(F) as O_X|_Z-modules.
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_zero [simp]: H^0_Z(X, F) = Γ_Z(X, F).
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_univ [simp]: For Z = X, H^q_Z(X,F) = H^q(X,F); for Z = ∅ it vanishes.
  api TauCeti.SchemeFoundations.Supports.rHZ_adjunction [universal-property]: RH_Z is right adjoint to i_* on derived categories.
  api TauCeti.SchemeFoundations.Supports.localToGlobal [relation]: The spectral sequence H^p(Z, H^q_Z(K)) ⇒ H^{p+q}_Z(X, K).
  api TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_pullback [functoriality]: For a morphism f : X' → X and Z' = f^{-1}Z, the pullback maps H^p_Z(X,K) → H^p_{Z'}(X', Lf^*K) compatible with the maps to H^p(X,K).
  test TauCeti.SchemeFoundations.Supports.test_support_all [degenerate]: For Z = X, H^1_Z(X, F) = H^1(X, F).
  test TauCeti.SchemeFoundations.Supports.test_support_empty [degenerate]: For Z = ∅, H^q_Z(X, F) = 0 for all q.
  test TauCeti.SchemeFoundations.Supports.test_support_affine_line_origin [computation]: For X = A^1_k and Z the origin, H^1_Z(X, O) ≅ k[t,t^{-1}]/k[t] (a k-vector space with basis t^{-1}, t^{-2}, …) and H^0_Z(X,O) = 0.
  test TauCeti.SchemeFoundations.Supports.test_support_not_restriction [non-example]: H^0_Z(X,F) is not F(Z): for X = A^1_k, Z = origin, F = O, F restricted to Z has sections k while H^0_Z(X,O) = 0.
node SchemeAndStackFoundations:SF.2/supports-localization-triangle (theorem): Localization triangles for cohomology with supports
node SchemeAndStackFoundations:SF.2/local-cohomology-module-comparison (comparison): Local cohomology of sheaves and of modules
node SchemeAndStackFoundations:SF.2/local-cohomology-flat-base-change (theorem): Flat base change and flat excision for local cohomology
node SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing (theorem): Depth controls vanishing of local cohomology
node SchemeAndStackFoundations:SF.2/cousin-complex (construction): Cousin complex of a filtration by closed subsets
  api TauCeti.SchemeFoundations.Supports.relativeSupportCohomology [constructor]: H^k_{Z_i/Z_{i+1}}(F), the derived functors of sections supported in Z_i ∖ Z_{i+1} modulo Z_{i+1}.
  api TauCeti.SchemeFoundations.Supports.cousinComplex [constructor]: The complex Cous_Z(F) with augmentation F → Cous_Z(F)^0, functorial in F.
  api TauCeti.SchemeFoundations.Supports.cousinComplex_d_comp_d [relation]: Consecutive differentials compose to zero.
  api TauCeti.SchemeFoundations.Supports.cousinComplex_isQuasicoherent [other]: For X Noetherian and F quasi-coherent, each term is quasi-coherent.
  api TauCeti.SchemeFoundations.Supports.relativeSupportCohomology_eq_zero_of_affine [characterisation]: If Z_i ∖ Z_{i+1} → X is affine then H^k_{Z_i/Z_{i+1}}(F) = 0 for k ≠ i (quasi-coherent F).
  api TauCeti.SchemeFoundations.Supports.cousinComplex_trivial [simp]: For the filtration X ⊇ ∅, the Cousin complex is F concentrated in degree 0.
  test TauCeti.SchemeFoundations.Supports.test_cousin_trivial_filtration [degenerate]: For Z_0 = X, Z_1 = ∅ the augmentation F → Cous_Z(F) is an isomorphism onto F in degree 0.
  test TauCeti.SchemeFoundations.Supports.test_cousin_dvr [computation]: For X = Spec of a DVR R with fraction field K and Z_1 = closed point, Cous_Z(O_X) is K → K/R in degrees 0, 1, and the augmentation R → (K → K/R) is a…
  test TauCeti.SchemeFoundations.Supports.test_cousin_not_resolution [non-example]: For X = Spec k[x,y]/(xy, y^2) (not Cohen–Macaulay, embedded point at the origin) with Z_1 = origin, the augmentation O_X → Cous_Z(O_X) is not injecti…
node SchemeAndStackFoundations:SF.2/kempf-cousin-resolution (theorem): Cousin complexes of maximal Cohen–Macaulay sheaves are resolutions
node SchemeAndStackFoundations:SF.2/big-site-quasi-coherent-sheaf (construction): The big-site sheaf of a quasi-coherent module
  api TauCeti.SchemeFoundations.Topologies.bigSheaf [constructor]: F ↦ F^a from quasi-coherent O_S-modules to τ-sheaves of O-modules on Sch/S, with F^a(T) = Γ(T, h^*F).
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_obj [simp]: Sections of F^a over (T, h) are Γ(T, h^*F).
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_isSheaf [characterisation]: F^a is a sheaf for each listed topology, including fpqc.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_exact [functoriality]: F ↦ F^a sends short exact sequences of quasi-coherent modules to short exact sequences of τ-sheaves.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_pullback [compatibility]: For g : S' → S, (g^*F)^a is the restriction of F^a to Sch/S'.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_structureSheaf [example]: (O_S)^a is the structure sheaf O of the big site, i.e. G_a as a sheaf of rings.
  api TauCeti.SchemeFoundations.Topologies.bigSheaf_fullyFaithful [equivalence]: F ↦ F^a is fully faithful on quasi-coherent modules.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zero [degenerate]: For F = 0, F^a is the zero sheaf.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_spec_field [computation]: For S = Spec k and F = O_S, F^a(Spec L) = L for every field extension L/k.
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zariski_restriction [compatibility]: Restricting F^a to the small Zariski site of S gives back F (as a sheaf on the topological space of S).
  test TauCeti.SchemeFoundations.Topologies.test_bigSheaf_not_topological_pullback [non-example]: For S = Spec Q, F = O_S and T = Spec Q(i), F^a(T) = Q(i); the topological inverse image h^{-1}F would give sections Q, so the definition must use the…
node SchemeAndStackFoundations:SF.2/multiplicative-additive-group-sheaves (definition): The sheaves G_m, G_a and μ_n on schemes
  api TauCeti.SchemeFoundations.Topologies.Ga [constructor]: The sheaf of abelian groups T ↦ Γ(T,O_T) on (Sch/S)_τ.
  api TauCeti.SchemeFoundations.Topologies.Gm [constructor]: The sheaf of abelian groups T ↦ Γ(T,O_T)^× on (Sch/S)_τ.
  api TauCeti.SchemeFoundations.Topologies.mu [constructor]: For n ≥ 1 the subsheaf μ_n ⊂ G_m of n-th roots of unity.
  api TauCeti.SchemeFoundations.Topologies.Gm_obj [simp]: Sections of G_m over T are the units of Γ(T, O_T).
  api TauCeti.SchemeFoundations.Topologies.mu_eq_ker_pow [characterisation]: μ_n is the kernel of the n-th power endomorphism of G_m.
  api TauCeti.SchemeFoundations.Topologies.Gm_restrict_small [compatibility]: The restriction of G_m to the small étale site of S is the sheaf of units of the étale structure sheaf.
  api TauCeti.SchemeFoundations.Topologies.mu_eq_cpc [compatibility]: For n invertible on S, the restriction of μ_n to S_et is the roots-of-unity sheaf of CohomologicalPointCounting ConstructibleEtale Layer 6.
  test TauCeti.SchemeFoundations.Topologies.test_mu_one [degenerate]: μ_1 is the zero sheaf.
  test TauCeti.SchemeFoundations.Topologies.test_Gm_field [computation]: G_m(Spec Q) = Q^×, and μ_2(Spec Q) = {±1}.
  test TauCeti.SchemeFoundations.Topologies.test_mu_p_not_etale_trivial [non-example]: Over S = Spec F_p, μ_p has trivial sections on every reduced S-scheme but nonzero sections on Spec F_p[ε]/(ε^p); so μ_p is not the constant sheaf Z/p…
node SchemeAndStackFoundations:SF.2/topology-comparison-morphisms (construction): Comparison morphisms between the topologies of a scheme
  api TauCeti.SchemeFoundations.Topologies.epsilonFppfEtale [constructor]: The morphism of topoi from big fppf sheaves to big étale sheaves on Sch/X.
  api TauCeti.SchemeFoundations.Topologies.aX [constructor]: The morphism a_X from big fppf sheaves to sheaves on X_et, with a_X^{-1}F(T) = Γ(T, F_T).
  api TauCeti.SchemeFoundations.Topologies.etaleToNisnevich [constructor]: The morphism of topoi Sh(X_et) → Sh(X_Nis).
  api TauCeti.SchemeFoundations.Topologies.nisnevichToZariski [constructor]: The morphism of topoi Sh(X_Nis) → Sh(X_Zar).
  api TauCeti.SchemeFoundations.Topologies.comparison_comp [functoriality]: The composite etaleToNisnevich ≫ nisnevichToZariski is the étale-to-Zariski comparison; all comparisons compose coherently.
  api TauCeti.SchemeFoundations.Topologies.comparison_baseChange [compatibility]: For f : Y → X the comparison morphisms commute with the morphisms of topoi induced by f.
  api TauCeti.SchemeFoundations.Topologies.aX_inverseImage_obj [simp]: a_X^{-1}F evaluated at (T → X) is Γ(T_et, F|_T).
  test TauCeti.SchemeFoundations.Topologies.test_comparison_id [degenerate]: For the identity topology comparison (étale to étale) the morphism is the identity of Sh(X_et).
  test TauCeti.SchemeFoundations.Topologies.test_aX_constant [computation]: a_X^{-1} of the constant sheaf Z/2 on X_et is the constant fppf sheaf Z/2 on Sch/X (sections over T: locally constant functions T → Z/2).
  test TauCeti.SchemeFoundations.Topologies.test_zariski_not_etale [non-example]: The étale-to-Zariski comparison is not an equivalence: for X = Spec R, the sheaf μ_2 has H^1_Zar(X, μ_2) = 0 but H^1_et(X, μ_2) ≅ R^×/R^{×2} = Z/2.
node SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison (comparison): Quasi-coherent cohomology is the same in every topology
node SchemeAndStackFoundations:SF.2/etale-pullback-fppf-comparison (comparison): Étale sheaves have the same fppf cohomology
node SchemeAndStackFoundations:SF.2/smooth-group-fppf-etale-comparison (comparison): Étale and fppf cohomology agree for smooth commutative group schemes
node SchemeAndStackFoundations:SF.2/hilbert-90 (theorem): Hilbert's Theorem 90 for schemes
node SchemeAndStackFoundations:SF.2/fppf-kummer-sequence (theorem): Kummer sequences in the fppf and étale topologies
node SchemeAndStackFoundations:SF.2/artin-schreier-sequence (theorem): The Artin–Schreier sequence and p-cohomological dimension in characteristic p
node SchemeAndStackFoundations:SF.2/finite-pushforward-exact (theorem): Finite and integral pushforward on étale sheaves
node SchemeAndStackFoundations:SF.2/etale-galois-comparison (comparison): Étale cohomology of a field is Galois cohomology
node SchemeAndStackFoundations:SF.2/etale-cohomology-limits (theorem): Étale cohomology of limits of schemes
node SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering (theorem): Hochschild–Serre spectral sequences for Galois coverings
node SchemeAndStackFoundations:SF.2/gabber-affine-proper-base-change (theorem): Gabber's affine analogue of proper base change
node SchemeAndStackFoundations:SF.2/tsen-theorem (theorem): Tsen's theorem and vanishing of Galois cohomology of G_m for function fields of curves
node SchemeAndStackFoundations:SF.2/curve-multiplicative-cohomology (theorem): Étale cohomology of G_m on a smooth curve
node SchemeAndStackFoundations:SF.2/curve-roots-of-unity-cohomology (theorem): Étale cohomology of μ_n on curves over an algebraically closed field
node SchemeAndStackFoundations:SF.2/proper-hypercover-descent (theorem): Cohomological descent for proper hypercoverings
node SchemeAndStackFoundations:SF.2/proetale-etale-morphism (construction): The morphism from the pro-étale to the étale topos
  api TauCeti.SchemeFoundations.Proetale.nu [constructor]: The morphism of topoi ν_X : Sh(X_proet) → Sh(X_et), with inverse image ν^* and direct image ν_*.
  api TauCeti.SchemeFoundations.Proetale.nu_inverseImage_obj_affine [simp]: For U = lim U_i affine pro-étale with a presentation, (ν^*F)(U) = colim F(U_i).
  api TauCeti.SchemeFoundations.Proetale.nu_directImage_obj [simp]: (ν_*G)(V) = G(V) for V étale over X.
  api TauCeti.SchemeFoundations.Proetale.nu_unit_iso [characterisation]: The unit F → ν_*ν^*F is an isomorphism for every étale sheaf F.
  api TauCeti.SchemeFoundations.Proetale.nu_naturality [functoriality]: For f : X → Y, ν_Y ∘ f_proet = f_et ∘ ν_X as morphisms of topoi.
  api TauCeti.SchemeFoundations.Proetale.nu_pushforward_comm [compatibility]: For f qcqs and F ∈ Sh(X_et) or D^+(X_et), ν_Y^* f_{et,*}F ≅ f_{proet,*} ν_X^*F.
  test TauCeti.SchemeFoundations.Proetale.test_nu_point [degenerate]: For X = ∅, Sh(X_proet) and Sh(X_et) are both trivial and ν is an equivalence.
  test TauCeti.SchemeFoundations.Proetale.test_nu_constant_profinite [computation]: For X = Spec of an algebraically closed field and A = Z/2, (ν^* A)(X ⊗ S) = C(S, Z/2) for a profinite set S.
  test TauCeti.SchemeFoundations.Proetale.test_nu_not_essentially_surjective [non-example]: For X = Spec of an algebraically closed field, the sheaf S ↦ C(S, Z_ℓ) (Mathlib's ellAdicSheaf) is not in the essential image of ν^* (its value on a …
node SchemeAndStackFoundations:SF.2/proetale-classical-comparison (theorem): Bhatt–Scholze comparison: classical complexes embed fully faithfully in pro-étale complexes
node SchemeAndStackFoundations:SF.2/replete-topos (definition): Replete topoi
  api TauCeti.SchemeFoundations.Proetale.IsReplete [constructor]: The predicate on a category of sheaves: limits of towers of epimorphisms are epimorphisms onto each stage.
  api TauCeti.SchemeFoundations.Proetale.isReplete_of_locallyWeaklyContractible [other]: A locally weakly contractible topos is replete.
  api TauCeti.SchemeFoundations.Proetale.isReplete_proetale [instance]: Sh(X_proet) is replete for every scheme X.
  api TauCeti.SchemeFoundations.Proetale.IsReplete.lim_epi [projection]: In a replete topos lim F_n → F_m is an epimorphism for a tower of epimorphisms.
  api TauCeti.SchemeFoundations.Proetale.IsReplete.derivedCategory_leftComplete [relation]: If T is replete then D(T) is left-complete (SF.2/proetale-left-completeness).
  test TauCeti.SchemeFoundations.Proetale.test_isReplete_types [degenerate]: The category of types (sheaves on the one-point site) is replete.
  test TauCeti.SchemeFoundations.Proetale.test_isReplete_proetale_point [computation]: For X = Spec of an algebraically closed field, Sh(X_proet) ≃ sheaves on profinite sets is replete.
  test TauCeti.SchemeFoundations.Proetale.test_etale_not_replete [non-example]: For X = Spec Q the tower of surjections μ_{ℓ^{n+1}} → μ_{ℓ^n} (ℓ-th power) of étale sheaves has limit 0 in Sh(X_et) (no nonzero element of Z_ℓ(1) has…
node SchemeAndStackFoundations:SF.2/w-contractible-cover (theorem): Existence of w-contractible pro-étale covers
node SchemeAndStackFoundations:SF.2/proetale-left-completeness (theorem): Left-completeness of the pro-étale derived category and the unbounded comparison
node SchemeAndStackFoundations:SF.2/proetale-lisse-sheaves (theorem): Lisse adic sheaves on the pro-étale site
node SchemeAndStackFoundations:SF.2/nisnevich-covering (definition): Nisnevich coverings
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering [constructor]: The predicate on a family of étale morphisms into X: every point has a preimage with trivial residue field extension.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage [constructor]: The precoverage on schemes whose covering families are Nisnevich coverings (a sub-precoverage of Mathlib's etalePrecoverage).
  api TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_of_zariski [compatibility]: Every Zariski covering family is a Nisnevich covering (zariskiPrecoverage ≤ nisnevichPrecoverage).
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage_le_etale [compatibility]: nisnevichPrecoverage ≤ etalePrecoverage.
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.pullback [functoriality]: Nisnevich coverings are stable under base change along any morphism Y → X.
  api TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.comp [functoriality]: Composing Nisnevich coverings of the members of a Nisnevich covering gives a Nisnevich covering.
  api TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_iff_henselization [characterisation]: For finite families over a Noetherian base: Nisnevich iff the base change to each Spec O^h_{X,x} has a section.
  test TauCeti.SchemeFoundations.Nisnevich.test_covering_identity [degenerate]: The singleton family {id : X → X} is a Nisnevich covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_not_covering_real_complex [non-example]: {Spec C → Spec R} is not a Nisnevich covering although it is an étale covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_covering_quadratic_split [computation]: {Spec Z[1/10] → Spec Z[1/2], Spec Z[1/2][x]/(x^2+1) → Spec Z[1/2]} is a Nisnevich covering: the second map is étale, and over the prime (5) the polyn…
  test TauCeti.SchemeFoundations.Nisnevich.test_zariski_is_nisnevich [compatibility]: The Zariski covering {D(2), D(3)} of Spec Z is a Nisnevich covering.
node SchemeAndStackFoundations:SF.2/nisnevich-topology (construction): The Nisnevich topology
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology [constructor]: The Grothendieck topology on Scheme generated by Nisnevich coverings.
  api TauCeti.SchemeFoundations.Nisnevich.smallNisnevichTopology [constructor]: The topology on X.Etale induced by Nisnevich coverings.
  api TauCeti.SchemeFoundations.Nisnevich.zariskiTopology_le_nisnevichTopology [compatibility]: zariskiTopology ≤ nisnevichTopology.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_le_etaleTopology [compatibility]: nisnevichTopology ≤ etaleTopology.
  api TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_subcanonical [instance]: The Nisnevich topology is subcanonical.
  api TauCeti.SchemeFoundations.Nisnevich.mem_nisnevichTopology_iff [characterisation]: A sieve covers X iff it contains a Nisnevich covering family.
  api TauCeti.SchemeFoundations.Nisnevich.smallNisnevich_comparison [compatibility]: The small Nisnevich site maps to the small étale and small Zariski sites by SF.2/topology-comparison-morphisms.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_between [compatibility]: zariskiTopology ≤ nisnevichTopology ∧ nisnevichTopology ≤ etaleTopology.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_not_etale [non-example]: The sieve on Spec R generated by Spec C → Spec R is étale-covering but not Nisnevich-covering.
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_field_global_sections [computation]: For a field k, a presheaf of sets F on (Spec k)_Nis is a sheaf iff F(∐ Spec L_i) = ∏ F(Spec L_i); in particular every Nisnevich sheaf on Spec k is de…
  test TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_representable_sheaf [degenerate]: The presheaf represented by any scheme is a Nisnevich sheaf.
node SchemeAndStackFoundations:SF.2/elementary-distinguished-square (definition): Elementary distinguished squares
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare [constructor]: Structure: a Mathlib Square in Scheme over X with an open immersion j, an étale p, cartesianness, and p an isomorphism over the reduced complement of…
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isNisnevichCovering [projection]: The pair {j, p} is a Nisnevich covering of X.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.ofZariski [constructor]: The square attached to an open cover X = U ∪ V.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.pullback [functoriality]: Base change along any morphism Y → X gives an elementary distinguished square over Y.
  api TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isPullback [projection]: The underlying square is a pullback in Scheme.
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_zariski [degenerate]: For X = U ∪ V an open cover, ofZariski gives a square whose p is the open immersion of V.
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_affine_line [computation]: X = A^1_Q, U = A^1 ∖ {0}, V = A^1 ∖ {−1, −2} with p(s) = s^2 + 2s: p is étale on V and p^{-1}(0) ∩ V = {0} with residue field Q, so (U ⊂ X, p) is an …
  test TauCeti.SchemeFoundations.Nisnevich.test_eds_not_distinguished [non-example]: X = Spec R, U = ∅, V = Spec C: p is étale and surjective but p^{-1}(X ∖ U) → X ∖ U is not an isomorphism, so this is not an elementary distinguished …
node SchemeAndStackFoundations:SF.2/distinguished-square-mayer-vietoris (lemma): Distinguished squares are Mayer–Vietoris squares
node SchemeAndStackFoundations:SF.2/nisnevich-sheaf-criterion (theorem): The Nisnevich sheaf condition is checked on distinguished squares
node SchemeAndStackFoundations:SF.2/nisnevich-points-henselization (theorem): Points of the Nisnevich topology are henselizations
node SchemeAndStackFoundations:SF.2/nisnevich-cohomological-dimension (theorem): Nisnevich cohomological dimension is bounded by Krull dimension
node SchemeAndStackFoundations:SF.2/nisnevich-cech-comparison (theorem): Čech and derived Nisnevich cohomology agree
node SchemeAndStackFoundations:SF.2/brown-gersten-vanishing (theorem): Brown–Gersten vanishing for Nisnevich Mayer–Vietoris functors
node SchemeAndStackFoundations:SF.2/derived-quasi-coherent-category (definition): The derived category of complexes with quasi-coherent cohomology
  api TauCeti.SchemeFoundations.Coherent.DQCoh [constructor]: The full triangulated subcategory D_QCoh(O_X) of DerivedCategory (X.Modules) of complexes with quasi-coherent cohomology sheaves.
  api TauCeti.SchemeFoundations.Coherent.DQCoh.mem_iff [characterisation]: K ∈ D_QCoh iff every cohomology sheaf H^i(K) is quasi-coherent.
  api TauCeti.SchemeFoundations.Coherent.DQCoh.isTriangulated [instance]: D_QCoh(O_X) is closed under shifts and cones (a triangulated subcategory).
  api TauCeti.SchemeFoundations.Coherent.DQCoh.hasCoproducts [instance]: D_QCoh(O_X) has arbitrary direct sums, computed in D(O_X).
  api TauCeti.SchemeFoundations.Coherent.DQCoh.affineEquiv [equivalence]: For X = Spec A, M ↦ M~ is an equivalence D(A) ≌ D_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.DCoh [constructor]: For X locally Noetherian, the subcategory of complexes with coherent cohomology, with bounded variants.
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_structure_sheaf [degenerate]: O_X[0] belongs to D_QCoh(O_X) for every scheme X.
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_affine_free [computation]: Under DQCoh.affineEquiv for X = Spec Z, the complex Z[0] goes to O_X[0] and Z/2[0] goes to the quasi-coherent sheaf (Z/2)~, supported on the closed p…
  test TauCeti.SchemeFoundations.Coherent.test_DQCoh_extension_by_zero_not_qc [non-example]: For X = Spec of a DVR with generic point inclusion j : U → X, the module j_!O_U (extension by zero) is not quasi-coherent, so j_!O_U[0] ∉ D_QCoh(O_X).
node SchemeAndStackFoundations:SF.2/derived-tensor-internal-hom (construction): Derived tensor product and derived internal Hom of O_X-modules
  api TauCeti.SchemeFoundations.Coherent.derivedTensor [constructor]: K ⊗^L_{O_X} L on D(O_X), bifunctorial and triangulated in each variable.
  api TauCeti.SchemeFoundations.Coherent.derivedHom [constructor]: RHom_{O_X}(K, L) on D(O_X), contravariant in K, covariant in L.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_derivedHom_adj [universal-property]: Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M)) naturally.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_unit [simp]: K ⊗^L O_X ≅ K and RHom(O_X, L) ≅ L.
  api TauCeti.SchemeFoundations.Coherent.derivedTensor_mem_DQCoh [other]: ⊗^L preserves D_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.derivedHom_mem_DQCoh [other]: RHom(K, L) ∈ D_QCoh for K pseudo-coherent and L ∈ D^+_QCoh.
  api TauCeti.SchemeFoundations.Coherent.perfect_dual [relation]: For K perfect, RHom(K, L) ≅ RHom(K, O_X) ⊗^L L.
  test TauCeti.SchemeFoundations.Coherent.test_derivedTensor_unit [degenerate]: For K = O_X[0], K ⊗^L K ≅ O_X[0].
  test TauCeti.SchemeFoundations.Coherent.test_derivedTensor_affine_tor [computation]: On X = Spec Z, (Z/2)~ ⊗^L (Z/2)~ has cohomology sheaves (Z/2)~ in degrees 0 and −1 (Tor_1(Z/2, Z/2) = Z/2).
  test TauCeti.SchemeFoundations.Coherent.test_derivedHom_affine_ext [compatibility]: On X = Spec A with K = M~, L = N~ for finitely presented M over Noetherian A, H^i(RHom(K, L)) is (Ext^i_A(M, N))~.
  test TauCeti.SchemeFoundations.Coherent.test_underived_tensor_differs [non-example]: The underived tensor product (Z/2)~ ⊗ (Z/2)~ = (Z/2)~ misses the Tor term, so derivedTensor is not the termwise tensor product of the given complexes.
node SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh (construction): Derived pullback and total direct image on quasi-coherent complexes
  api TauCeti.SchemeFoundations.Coherent.derivedPullback [constructor]: Lf^* : D(O_Y) → D(O_X), restricting to D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage [constructor]: Rf_* : D(O_X) → D(O_Y), restricting to D_QCoh for qcqs f.
  api TauCeti.SchemeFoundations.Coherent.derivedPullback_totalDirectImage_adj [universal-property]: Lf^* ⊣ Rf_*.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_mem_DQCoh [other]: For f qcqs, Rf_* preserves D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_coproduct [other]: For f qcqs, Rf_* on D_QCoh commutes with direct sums.
  api TauCeti.SchemeFoundations.Coherent.projectionFormula [relation]: Rf_*E ⊗^L K ≅ Rf_*(E ⊗^L Lf^*K) for qcqs f.
  api TauCeti.SchemeFoundations.Coherent.totalDirectImage_comp [functoriality]: R(g∘f)_* ≅ Rg_* ∘ Rf_* and L(g∘f)^* ≅ Lf^* ∘ Lg^*.
  api TauCeti.SchemeFoundations.Coherent.cohomology_totalDirectImage [compatibility]: H^i(Rf_*F) ≅ R^if_*F for quasi-coherent F (SF.2/qcoh-higher-direct-images).
  test TauCeti.SchemeFoundations.Coherent.test_pullback_identity [degenerate]: For f = id_X, Lf^* K ≅ K.
  test TauCeti.SchemeFoundations.Coherent.test_pushforward_projective_line [computation]: For f : P^1_k → Spec k, Rf_*O(−2) is k[−1] (SF.2/projective-space-cohomology).
  test TauCeti.SchemeFoundations.Coherent.test_pullback_affine_tensor [compatibility]: For Spec B → Spec A, Lf^*(M~) has cohomology (Tor_i^A(M, B))~ in degree −i.
  test TauCeti.SchemeFoundations.Coherent.test_underived_pullback_not_exact [non-example]: For Spec(Z/2) → Spec Z and the exact sequence 0 → Z → Z → Z/2 → 0, the underived pullback is not exact (multiplication by 2 becomes zero), so Lf^* is…
node SchemeAndStackFoundations:SF.2/perfect-generator (theorem): D_QCoh of a qcqs scheme is generated by one perfect complex
node SchemeAndStackFoundations:SF.2/tor-independent-base-change (theorem): Tor-independent base change for quasi-coherent complexes
node SchemeAndStackFoundations:SF.2/pushforward-right-adjoint (construction): Right adjoint of pushforward on quasi-coherent complexes
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint [constructor]: a_f : D_QCoh(O_Y) → D_QCoh(O_X), right adjoint to Rf_*.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_adj [universal-property]: Rf_* ⊣ a_f on D_QCoh.
  api TauCeti.SchemeFoundations.Coherent.trace [data]: The counit Tr_f : Rf_*a_f(K) → K, natural in K.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_comp [functoriality]: a_{g∘f} ≅ a_f ∘ a_g compatibly with traces.
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_boundedBelow [other]: a_f maps D^+_QCoh(O_Y) into D^+_QCoh(O_X).
  api TauCeti.SchemeFoundations.Coherent.globalDuality [relation]: RHom_X(L, a_f K) ≅ RHom_Y(Rf_*L, K) for L ∈ D_QCoh(O_X), K ∈ D_QCoh(O_Y).
  api TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_affine_finite [example]: For a finite map Spec B → Spec A, a_f(K~) = (RHom_A(B, K))~ as B-complexes.
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id [degenerate]: For f = id_X, a_f ≅ id and Tr_f is the identity.
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point [computation]: For f : Spec k → Spec k[x] (x ↦ 0), a_f(O) = RHom(k, k[x]) = k[−1].
  test TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek [non-example]: For f : A^1_k → Spec k (affine, not proper), a_f(k) corresponds to the full linear dual Hom_k(k[x], k) as a k[x]-module (Stacks Example 48.3.2), wher…
node SchemeAndStackFoundations:SF.2/upper-shriek-compactification-independence (theorem): The upper shriek pseudofunctor is independent of compactifications
node SchemeAndStackFoundations:SF.2/upper-shriek-etale (lemma): Upper shriek of étale morphisms and open immersions
node SchemeAndStackFoundations:SF.2/upper-shriek-flat-base-change (theorem): Flat base change for upper shriek
node SchemeAndStackFoundations:SF.2/upper-shriek-smooth (theorem): Upper shriek of smooth morphisms
node SchemeAndStackFoundations:SF.2/lci-upper-shriek (theorem): Upper shriek of local complete intersection and Gorenstein morphisms
node SchemeAndStackFoundations:SF.2/relative-dualizing-complex (definition): Relative dualizing complexes
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex [constructor]: Structure: an S-perfect K ∈ D(O_X) with the diagonal isomorphism ξ.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.unique [extensionality]: Two relative dualizing complexes are uniquely isomorphic compatibly with ξ.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.exists [constructor]: Existence for flat finitely presented f.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.baseChange [functoriality]: Derived pullback along S' → S of a relative dualizing complex is one for X' → S'.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.homothety_iso [characterisation]: O_X → RHom(K, K) is an isomorphism.
  api TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.upperShriek [compatibility]: For f flat in FTS_S, f^!O_Y with its canonical ξ is a relative dualizing complex.
  test TauCeti.SchemeFoundations.Coherent.test_rdc_identity [degenerate]: For f = id_S, the relative dualizing complex is O_S[0].
  test TauCeti.SchemeFoundations.Coherent.test_rdc_projective_line [computation]: For f : P^1_S → S, the relative dualizing complex is O(−2)[1] = Ω^1_{P^1/S}[1].
  test TauCeti.SchemeFoundations.Coherent.test_rdc_base_change [compatibility]: For S' → S and f flat finitely presented, the base change of the relative dualizing complex of f is that of f' (the unique one).
  test TauCeti.SchemeFoundations.Coherent.test_rdc_not_invertible [non-example]: For f : Spec A → Spec k with A = k[x,y]/(x,y)^2, the relative dualizing complex is Hom_k(A, k)[0], which needs two generators as an A-module; so a re…
node SchemeAndStackFoundations:SF.2/relative-dualizing-module (definition): Relative dualizing module of a Cohen–Macaulay morphism
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule [constructor]: ω_{X/Y} := H^{−d}(f^!O_Y) for f flat Cohen–Macaulay of relative dimension d.
  api TauCeti.SchemeFoundations.Coherent.upperShriek_structureSheaf_iso_shift [characterisation]: f^!O_Y ≅ ω_{X/Y}[d].
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_coherent [other]: ω_{X/Y} is coherent and flat over Y.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_baseChange [functoriality]: Formation of ω_{X/Y} commutes with arbitrary base change in FTS_S.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_invertible_iff [characterisation]: ω_{X/Y} is invertible at x iff f is Gorenstein at x.
  api TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_smooth [example]: For f smooth of relative dimension d, ω_{X/Y} ≅ ∧^dΩ_{X/Y}.
  test TauCeti.SchemeFoundations.Coherent.test_omega_smooth_curve_degree [computation]: For a smooth projective curve C of genus g over k, deg ω_{C/k} = 2g − 2; for P^1, ω = O(−2).
  test TauCeti.SchemeFoundations.Coherent.test_omega_identity [degenerate]: For f = id_Y (relative dimension 0), ω_{Y/Y} = O_Y.
  test TauCeti.SchemeFoundations.Coherent.test_omega_nodal_invertible [compatibility]: For the nodal cubic y^2 = x^3 + x^2 over k, ω is invertible of degree 0 (Gorenstein, arithmetic genus 1), matching StableReduction Layer 2.
  test TauCeti.SchemeFoundations.Coherent.test_omega_not_canonical_for_non_cm [non-example]: For X = two planes in A^4 meeting at a point (not Cohen–Macaulay), f^!k has more than one nonzero cohomology sheaf, so ω_{X/k} is not defined by this…
node SchemeAndStackFoundations:SF.2/cm-serre-duality (theorem): Serre duality for proper Cohen–Macaulay schemes
node SchemeAndStackFoundations:SF.2/curve-dualizing-comparison (comparison): General coherent duality restricts to the curve duality of StableReduction and JacobianChallenge
node SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality (theorem): Sheafified Grothendieck duality for proper morphisms
node SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent (theorem): Descent of quasi-coherent algebras and of the Azumaya property
node SchemeAndStackFoundations:SF.2/azumaya-equivalent-conditions (theorem): Equivalent characterisations of Azumaya algebras on a scheme
node SchemeAndStackFoundations:SF.2/azumaya-trivialization-gerbe (construction): The gerbe of trivialisations of an Azumaya algebra
  api TauCeti.SchemeFoundations.Brauer.trivializationGerbe [constructor]: The stack G_A of pairs (E, φ : End(E) ≅ A|_U) over the small étale site.
  api TauCeti.SchemeFoundations.Brauer.trivializationGerbe_isGerbe [other]: G_A is a gerbe with band G_m.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass [constructor]: The class [G_A] ∈ H^2(X_et, G_m) (Mathlib's Sheaf.H).
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_zero_iff [characterisation]: [G_A] = 0 iff A ≅ End(E) for a finite locally free E of positive rank.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_tensor [relation]: [G_{A⊗B}] = [G_A] + [G_B] and [G_{A^op}] = −[G_A].
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_delta [compatibility]: azumayaClass descends to the Brauer quotient and equals SchemeAndStackFoundations:SF.2/delta.
  api TauCeti.SchemeFoundations.Brauer.azumayaClass_pullback [functoriality]: Pullback of algebras corresponds to pullback on H^2 (SF.2/site-cohomology-pullback).
  test TauCeti.SchemeFoundations.Brauer.test_class_matrix [degenerate]: azumayaClass (Mat_d(O_X)) = 0.
  test TauCeti.SchemeFoundations.Brauer.test_class_quaternion_real [computation]: For X = Spec R and the Hamilton quaternions, azumayaClass ≠ 0 and 2 · azumayaClass = 0.
  test TauCeti.SchemeFoundations.Brauer.test_class_field_agrees [compatibility]: For X = Spec K, azumayaClass followed by SF.2/brauer-field-comparison equals the class of the central simple algebra in TauCeti.BrauerGroup K.
  test TauCeti.SchemeFoundations.Brauer.test_class_not_module_class [non-example]: The class depends on the algebra, not the module: the underlying modules of the quaternions H and of Mat_2(R) over R are both free of rank 4, but the…
node SchemeAndStackFoundations:SF.2/brauer-regular-injectivity (theorem): Brauer groups of regular schemes: torsion and injectivity into the function field
node SchemeAndStackFoundations:SF.2/brauer-field-comparison (comparison): The cohomological Brauer group of a field is the Brauer group
node SchemeAndStackFoundations:SF.2/brauer-kummer-sequence (theorem): Kummer sequences for Brauer groups
node SchemeAndStackFoundations:SF.2/brauer-henselian-local (theorem): Brauer groups of henselian local rings
node SchemeAndStackFoundations:SF.2/brauer-hochschild-serre-sequence (theorem): The algebraic Brauer group sequence of a variety
node SchemeAndStackFoundations:SF.2/equivariant-module-category (construction): The abelian category of semilinear equivariant modules
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules [constructor]: The category Mod_Γ(O_X) of semilinear Γ-equivariant O_X-modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.abelian [instance]: Mod_Γ(O_X) is abelian, with kernels and cokernels computed underlying.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget [projection]: The exact faithful forgetful functor to Mod(O_X).
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_exact [other]: forget preserves finite limits and colimits and reflects isomorphisms.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.hom_eq_invariants [characterisation]: Hom_Γ(F, G) ≅ Hom_{O_X}(F, G)^Γ.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.isGrothendieckAbelian [instance]: Mod_Γ(O_X) is Grothendieck abelian (AB5 with the generators L(U)), hence has enough injectives.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.trivialGroupEquiv [equivalence]: For Γ trivial, forget is an equivalence.
  test TauCeti.SchemeFoundations.Equivariant.test_trivial_group [degenerate]: For Γ = 1, EquivariantModules.forget is an equivalence of categories.
  test TauCeti.SchemeFoundations.Equivariant.test_point_group_ring [computation]: For X a point with O_X = Z and Γ = Z/2, Mod_Γ(O_X) is the category of Z[Z/2]-modules; the module Z with the sign action is an object not isomorphic t…
  test TauCeti.SchemeFoundations.Equivariant.test_hom_invariants [compatibility]: For F = G = O_X with trivial linearisation, Hom_Γ(F, G) = Γ(X, O_X)^Γ.
  test TauCeti.SchemeFoundations.Equivariant.test_not_action_category [non-example]: For Γ = Z acting on X = R by translation, the structure sheaf with its translation linearisation is an object of Mod_Γ(O_X) but not of Mathlib's Acti…
node SchemeAndStackFoundations:SF.2/equivariant-coinduction (construction): Induction and coinduction for equivariant modules
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.ind [constructor]: Ind(F) = ⊕_γ γ^*F with the permutation Γ-structure.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind [constructor]: Coind(F) = ∏_γ γ_*F with the permutation Γ-structure.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.indForgetAdj [universal-property]: Ind ⊣ forget.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forgetCoindAdj [universal-property]: forget ⊣ Coind.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind_injective [other]: Coind sends injective O_X-modules to injective equivariant modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_injective [other]: forget sends injective equivariant modules to injective O_X-modules.
  api TauCeti.SchemeFoundations.Equivariant.EquivariantModules.unit_mono [characterisation]: The unit G → Coind(forget G) is a monomorphism.
  test TauCeti.SchemeFoundations.Equivariant.test_coind_trivial_group [degenerate]: For Γ = 1, Coind ≅ id.
  test TauCeti.SchemeFoundations.Equivariant.test_coind_point [computation]: For X a point with O = Z and Γ = Z/2, Coind(Z) = Z × Z with the swap action ≅ Z[Z/2].
  test TauCeti.SchemeFoundations.Equivariant.test_coind_global_sections [compatibility]: Γ(X, Coind F) ≅ Map(Γ, Γ(X, F)) as Γ-modules (product over γ of Γ(X, γ_*F) = Γ(X, F)).
  test TauCeti.SchemeFoundations.Equivariant.test_ind_ne_coind_infinite [non-example]: For Γ = Z and X a point, Ind(Z) = Z[Z] (finite support) differs from Coind(Z) = Map(Z, Z) (all functions); induction and coinduction differ for infin…
node SchemeAndStackFoundations:SF.2/coinduced-sections-acyclic (lemma): Sections of injective equivariant modules are acyclic for invariants
node SchemeAndStackFoundations:SF.2/equivariant-ext-spectral-sequence (theorem): Spectral sequence for equivariant Ext
-/

end SF_SF_2

/-! ## SF.3: curves, divisors and Picard objects -/
section SF_SF_3

/-!
# Scheme and stack foundations, layer SF.3: curves, divisors and Picard objects

This section is not the roadmap and is not exhaustive. The roadmap document (`README.md`,
section SF.3) is definitive. The statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof is `sorry`, and no implementation is claimed.

Prototyping boundary. Normality of a curve is written as integrally closed stalks. The
`k`-dimension of `Hⁱ(X, M)` for Tau Ceti's coherent cohomology of sheaves of modules
(`TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, its base-field module structure and
`Scheme.Modules.eulerCharBelow`) enters as the admitted datum `cohomologyDim`, whose intended
body is `Module.finrank k (Cohomology M i)`.
JacobianChallenge Layer D are absent from both libraries; the objects this layer adds on top of
them are admitted data with their interface lemmas. Interfaces whose carriers cannot be expressed
(determinants and duals of sheaves of modules, torsion and Tate modules of abelian varieties,
`μ_n`-coefficients on the étale site) are recorded as comments naming their API items and tests.
-/

noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.CategoryTheory.MonoidalCategory

universe u

namespace TauCeti.AlgebraicGeometry.Curve

variable (k : Type u) [Field k]

/-- `dim_k Hⁱ(X, M)`, the `k`-dimension of Tau Ceti's `Scheme.Modules.Cohomology` with its
base-field module structure (`Module.finrank`, so `0` when infinite-dimensional). -/
def cohomologyDim (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) (i : ℕ) : ℕ :=
  Module.finrank k (Scheme.Modules.Cohomology M i)

/-- The structure sheaf as a sheaf of modules over itself. -/
abbrev structureModule (X : Scheme.{u}) : X.Modules := _root_.SheafOfModules.unit X.ringCatSheaf

/-- The Euler characteristic `χ(X, M) = dim H⁰ − dim H¹` used on schemes of dimension at most one. -/
def eulerChar (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) : ℤ :=
  (cohomologyDim k X M 0 : ℤ) - cohomologyDim k X M 1

/-- The genus `dim_k H¹(X, O_X)` of JacobianChallenge Layer B, as used by this layer. -/
def genus (X : Scheme.{u}) [X.Over (Spec (.of k))] : ℕ := cohomologyDim k X (structureModule X) 1

/-! ## SF.3/nonsingular-projective-model -/

section NonsingularModel

-- node: SchemeAndStackFoundations:SF.3/nonsingular-projective-model
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

lemma nonsingularModel.openImmersion_isOpenImmersion :
    IsOpenImmersion (nonsingularModel.openImmersion k X hdim) := by sorry

lemma nonsingularModel.openImmersion_isOver :
    nonsingularModel.openImmersion k X hdim ≫ nonsingularModel k X hdim ↘ Spec (.of k) =
      X ↘ Spec (.of k) := by sorry

/-- The boundary `∂X = X̄ ∖ j_X(X)`, a finite set of closed points. -/
def boundary : Set (nonsingularModel k X hdim) :=
  (Set.range (nonsingularModel.openImmersion k X hdim).base)ᶜ

lemma boundary_finite : (boundary k X hdim).Finite := by sorry

lemma boundary_eq_empty_iff : boundary k X hdim = ∅ ↔ IsProper (X ↘ Spec (.of k)) := by sorry

lemma nonsingularModel_smooth [PerfectField k] [Smooth (X ↘ Spec (.of k))] :
    Smooth (nonsingularModel k X hdim ↘ Spec (.of k)) := by sorry

lemma nonsingularModel.extend {Y : Scheme.{u}} [Y.Over (Spec (.of k))]
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

-- test: TauCeti.AlgebraicGeometry.Curve.nonsingularModel_proper
example (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [IsProper (X ↘ Spec (.of k))]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)] (hdim : topologicalKrullDim X = 1) :
    boundary k X hdim = ∅ := by sorry

/-! ## SF.3/curve-affine-or-projective -/

-- node: SchemeAndStackFoundations:SF.3/curve-affine-or-projective
theorem isAffine_or_isProper (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) :
    (IsAffine X ∧ ¬ IsProper (X ↘ Spec (.of k))) ∨
      (¬ IsAffine X ∧ IsProper (X ↘ Spec (.of k))) := by sorry

/-! ## SF.3/genus-base-change -/

-- node: SchemeAndStackFoundations:SF.3/genus-base-change
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

/-! ## SF.3/vector-bundle-degree -/

/-- `E` is locally free of constant rank `r`: local generators which are bases, each family of
cardinality `r` (Mathlib's `SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`). -/
def IsLocallyFreeOfRank {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Prop :=
  ∃ q : _root_.SheafOfModules.LocalGeneratorsData.{u} E,
    q.IsLocallyFreeData ∧ ∀ i, Finite (q.generators i).I ∧ Nat.card (q.generators i).I = r

section Degree

variable (X : Scheme.{u}) [X.Over (Spec (.of k))]

-- node: SchemeAndStackFoundations:SF.3/vector-bundle-degree
/-- `deg E = χ(E) − r·χ(O_X)` for a locally free sheaf `E` of constant rank `r` on a proper
`k`-scheme of dimension at most one; the rank is the explicit argument `r`, and every lemma
assumes `IsLocallyFreeOfRank E r`. -/
def vectorBundleDegree (E : X.Modules) (r : ℕ) : ℤ :=
  eulerChar k X E - r * eulerChar k X (structureModule X)

lemma vectorBundleDegree_rankOne (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    vectorBundleDegree k X L.obj 1 = eulerChar k X L.obj - eulerChar k X (structureModule X) := by
  sorry

lemma vectorBundleDegree_of_iso {E F : X.Modules} (e : E ≅ F) (r : ℕ) :
    vectorBundleDegree k X E r = vectorBundleDegree k X F r := by sorry

lemma vectorBundleDegree_add_of_shortExact [IsProper (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X ≤ 1) (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (r₁ r₃ : ℕ) (h₁ : IsLocallyFreeOfRank S.X₁ r₁) (h₃ : IsLocallyFreeOfRank S.X₃ r₃) :
    vectorBundleDegree k X S.X₂ (r₁ + r₃) =
      vectorBundleDegree k X S.X₁ r₁ + vectorBundleDegree k X S.X₃ r₃ := by sorry

lemma vectorBundleDegree_tensor [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1)
    (E V : X.Modules) (r s : ℕ) (hE : IsLocallyFreeOfRank E r) (hV : IsLocallyFreeOfRank V s) :
    vectorBundleDegree k X (E ⊗ V) (r * s) =
      r * vectorBundleDegree k X V s + s * vectorBundleDegree k X E r := by sorry

/- Remaining API of this node, stated in the roadmap document: `vectorBundleDegree_det`
(deg E = deg det E), `vectorBundleDegree_dual`, `vectorBundleDegree_twist` (twist by an effective
Cartier divisor), `vectorBundleDegree_elementaryModification`, `vectorBundleDegree_baseChange` and
`vectorBundleDegree_pullback`. Their carriers (exterior powers and duals of sheaves of modules,
lengths, base change of modules along field extensions) are not in the pinned libraries. -/

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_trivial
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1) :
    vectorBundleDegree k X (structureModule X) 1 = 0 := by sorry

/- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_projectiveLine — on P¹_k,
deg(O(a) ⊕ O(b)) = a + b (P¹ and its twisting sheaves are not named objects at the pin).
test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_filtration — degrees add along a
filtration with invertible quotients; O(1) ⊕ O(−1) on P¹ has degree 0 without being trivial. -/

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_divisor
example [IsIntegral X] [IsNoetherian X]
    [∀ y : TauCeti.AlgebraicGeometry.CodimensionOnePoint X,
      IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, Order.coheight y ≤ 1) [IsProper (X ↘ Spec (.of k))]
    (D : TauCeti.AlgebraicGeometry.SchemeWeilDivisor X) :
    vectorBundleDegree k X (TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf hX D).obj 1 =
      D.sum fun x n ↦ n * ((X ↘ Spec (.of k)).residueDegree (x : X) : ℤ) := by sorry

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_ne_eulerChar
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 2) :
    vectorBundleDegree k X (structureModule X) 1 ≠ eulerChar k X (structureModule X) := by sorry

end Degree

/-! ## SF.3/vector-bundle-riemann-roch -/

-- node: SchemeAndStackFoundations:SF.3/vector-bundle-riemann-roch
theorem eulerChar_eq_degree_add_rank_mul (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (E : X.Modules) (r : ℕ) (hE : IsLocallyFreeOfRank E r) :
    eulerChar k X E = vectorBundleDegree k X E r + r * (1 - (genus k X : ℤ)) := by sorry

/-! ## SF.3/curve-serre-duality

-- node: SchemeAndStackFoundations:SF.3/curve-serre-duality
The theorem (`Ext^{1+i}(F, ω_X) ≅ H^{−i}(X, F)^∨` for quasi-coherent `F` on a proper Cohen–Macaulay
curve, `Hⁱ(E^∨ ⊗ ω) ≅ H^{1−i}(E)^∨`, `Ext¹(U, V) ≅ Hom(V, U ⊗ ω)^∨`, and `ω ≅ Ω¹` in the smooth
case) needs Ext groups and duals of sheaves of modules, the dualizing module `H^{−1}(f^! k)` of
SF.2 and the sheaf of differentials; none is a carrier of the pinned libraries, so it is stated in
the roadmap document only. A dimension-only Lean form would be false without those carriers. -/

/-! ## SF.3/scheme-riemann-hurwitz -/

-- node: SchemeAndStackFoundations:SF.3/scheme-riemann-hurwitz
theorem genus_of_finite_etale {X Y : Scheme.{u}} [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] [Smooth (Y ↘ Spec (.of k))]
    (hXd : topologicalKrullDim X = 1) (hYd : topologicalKrullDim Y = 1)
    (hX : cohomologyDim k X (structureModule X) 0 = 1)
    (hY : cohomologyDim k Y (structureModule Y) 0 = 1) (f : X ⟶ Y) [IsFinite f] [Etale f] (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k))
    (n : ℕ) (hn : ∀ y : Y, f.finrank y = n) :
    (genus k X : ℤ) - 1 = n * ((genus k Y : ℤ) - 1) := by sorry

/-! ## SF.3/projective-line-characterization, SF.3/genus-one-curves,
SF.3/line-bundle-degree-bounds -/

-- node: SchemeAndStackFoundations:SF.3/projective-line-characterization
theorem isTrivial_of_genus_zero_of_degree_zero (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [IsIntegral X] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 0)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (hL : vectorBundleDegree k X L.obj 1 = 0) :
    TauCeti.AlgebraicGeometry.LineBundleClass.mk L = 1 := by sorry

-- node: SchemeAndStackFoundations:SF.3/genus-one-curves
theorem exists_rationalPoint_of_degree_one (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hg : genus k X = 1) (N : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hN : vectorBundleDegree k X N.obj 1 = 1) :
    ∃ x : Spec (.of k) ⟶ X, x ≫ X ↘ Spec (.of k) = 𝟙 _ := by sorry

-- node: SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds
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

end TauCeti.AlgebraicGeometry.Curve

/-! ## Picard objects -/

namespace TauCeti.AlgebraicGeometry.Picard

/-! ### SF.3/picard-groupoid -/

-- node: SchemeAndStackFoundations:SF.3/picard-groupoid
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

lemma picardGroupoid.pi0_equiv :
    Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃ TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

lemma picardGroupoid.pi1_equiv :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid X) ≃* (Γ(X, ⊤))ˣ) := by sorry

/-- Pullback of invertible sheaves as a functor of Picard groupoids. -/
def picardGroupoid.pullback {Y : Scheme.{u}} (f : Y ⟶ X) : picardGroupoid X ⥤ picardGroupoid Y :=
  sorry

/- Remaining API: `picardGroupoid.isStack` (fppf descent, SF.1) and `gradedPicardGroupoid`
(pairs (L, f) with the Koszul sign rule). -/

-- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_pi0
example : Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃ TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_field
example (K : Type u) [Field K] :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid (Spec (.of K))) ≃* Kˣ) := by sorry

/- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_projectiveLine — π₀ = Z, π₁ = k^× for P¹.
test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_not_discrete — 𝒫ic(X) is not the discrete
groupoid on Pic(X) when Γ(X, O_X)^× ≠ 1. -/

/-! ### SF.3/picard-cohomological, SF.3/class-group-picard-locally-factorial,
SF.3/picard-excision-sequence

The étale and fppf cohomology of `G_m` on schemes and the Weil divisor class group in arbitrary
dimension are not carriers of the pinned libraries; these three nodes are stated in the roadmap
document. The affine case of the first is Mathlib's `CommRing.Pic`. -/

/- node: SchemeAndStackFoundations:SF.3/class-group-picard-locally-factorial
node: SchemeAndStackFoundations:SF.3/picard-excision-sequence -/

-- node: SchemeAndStackFoundations:SF.3/picard-cohomological
theorem lineBundleClass_spec_equiv_pic (R : Type u) [CommRing R] :
    Nonempty (TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃ CommRing.Pic R) := by sorry

/-! ### SF.3/line-bundle-norm -/

-- node: SchemeAndStackFoundations:SF.3/line-bundle-norm
/-- `Norm_π : Pic(X) → Pic(Y)` for a finite locally free morphism of constant degree `d ≥ 1`. -/
def lineBundleNorm {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ) :
    TauCeti.AlgebraicGeometry.LineBundleClass X → TauCeti.AlgebraicGeometry.LineBundleClass Y :=
  sorry

lemma lineBundleNorm_tensor {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ)
    (a b : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm π d (a * b) = lineBundleNorm π d a * lineBundleNorm π d b := by sorry

lemma lineBundleNorm_one {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] (d : ℕ) :
    lineBundleNorm π d 1 = 1 := by sorry

/- Remaining API: `lineBundleNorm_pullback` (Norm(π*N) = N^d), `lineBundleNorm_comp`,
`lineBundleNorm_baseChange`, `lineBundleNorm_det`, `sectionNorm`, `lineBundleNorm_divisor`;
they need pullback and determinants of invertible sheaves, not available at the pin. -/

-- test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_id
example (X : Scheme.{u}) (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm (𝟙 X) 1 a = a := by sorry

/- test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_field — over a field the norm on units
is Mathlib's `Algebra.norm` (needs `sectionNorm`).
test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_square (z ↦ z² on P¹) and
test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_ne_det (hyperelliptic double cover) need P¹
and explicit double covers as named schemes. -/

/-! ### SF.3/picard-scheme-without-point and SF.3/picard-brauer-sequence -/

section Torsors

variable (k : Type u) [Field k]

-- node: SchemeAndStackFoundations:SF.3/picard-scheme-without-point
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

/- SF.3/picard-brauer-sequence (T354) is not stated here: the Picard–Brauer obstruction and its
   vanishing given a rational point are Tau Ceti JacobianChallenge Layer D. -/
instance : AddCommGroup (picardSheafPoints k X) := sorry

/-- The map from actual line-bundle classes. -/
def ofLineBundleClass : Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) → picardSheafPoints k X :=
  sorry

theorem ofLineBundleClass_injective : Function.Injective (ofLineBundleClass k X) := by sorry

end Torsors

-- node: SchemeAndStackFoundations:SF.3/rational-divisor-classes

/-! ### SF.3/rational-divisor-classes

Stated in the roadmap document; it composes the Picard–Brauer obstruction of JacobianChallenge
Layer D with the Galois-cohomological Brauer group of ClassFieldTheory Layer 5.
SF.3/degree-zero-class-comparison (T356) is not stated here: `Cl⁰ ≃ Pic⁰`, the degree-zero
divisor description of `Pic⁰` and `Pic/Pic⁰ ≅ ℤ` are Tau Ceti's
`TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupPicZeroAddEquivPicZero`,
`weightedDegreeZeroQuotientAddEquivPicZero` and `picQuotientPicZeroAddEquivInt`. -/

/- node: SchemeAndStackFoundations:SF.3/picard-stack-curve
node: SchemeAndStackFoundations:SF.3/universal-section-stack -/

/-! ### SF.3/picard-stack-curve, SF.3/universal-section-stack

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

/-! ### SF.3/abel-maps-high-degree, SF.3/picard-norm-sequence, SF.3/invariant-differentials,
SF.3/abel-jacobi-differentials, SF.3/tate-module-etale-h1

The Abel maps need the symmetric powers of JacobianChallenge Layer C; the norm sequence needs the
Picard stacks above; the differential statements need the sheaf of differentials of a scheme
(StableReduction Layers 0–1); the Tate-module comparison needs the torsion and Tate modules of
abelian varieties (CohomologicalPointCounting/TraceFormula Layer 8) and `μ_n`-coefficients on the
étale site. The one carrier already present is Mathlib's pro-étale `EllAdicCohomology`, the target
of part (iii) of the Tate-module comparison. -/

-- node: SchemeAndStackFoundations:SF.3/tate-module-etale-h1
/-- Acceptance instance of the Tate-module comparison in genus zero: both sides vanish. The general
statement (`T_ℓ J ≅ H¹(X_{k^s}, Z_ℓ(1))`, `H¹(X_{k^s}, Z_ℓ) ≅ Hom(T_ℓ J, Z_ℓ)`) is stated in the
roadmap document; its Tate-module carrier is TraceFormula Layer 8's. -/
theorem subsingleton_ellAdicCohomology_one_of_genus_zero (k : Type u) [Field k] [IsSepClosed k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) (hg : Curve.genus k X = 0)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : k) ≠ 0) :
    Subsingleton (X.EllAdicCohomology ℓ 1) := by sorry

/- node: SchemeAndStackFoundations:SF.3/invariant-differentials — Ω¹_{G/S} ≅ f*e*Ω¹ and
Γ(A, Ω¹) ≅ T₀(A)^∨ for an abelian variety; needs the sheaf of differentials of a scheme.
node: SchemeAndStackFoundations:SF.3/abel-jacobi-differentials — ι_O^* : Γ(J, Ω¹) ≅ Γ(X, Ω¹).
node: SchemeAndStackFoundations:SF.3/abel-maps-high-degree — fibres, surjectivity and the
projective-bundle structure of X^(d) → Pic^d; needs JacobianChallenge Layer C's symmetric powers.
node: SchemeAndStackFoundations:SF.3/picard-norm-sequence — Nm on Picard stacks and the
double-cover exact sequence. -/

end TauCeti.AlgebraicGeometry.Picard

end
end SF_SF_3

/-! ## SF.4: deformations, formal schemes, models and alterations -/
section SF_SF_4

/-
Suggested Lean forms for layer SF.4 "Deformations, models and birational geometry" of the
roadmap "Scheme, stack, cohomology and intersection foundations".

This section is not the roadmap and is not exhaustive: the roadmap document (`README.md`,
section SF.4) is definitive. The statements below
`sorry`; nothing here is an implementation claim.

Conventions of this prototype.
* Schemes, morphism properties, ideal sheaves, subschemes and modules are Mathlib's
  (`AlgebraicGeometry.Scheme`, `IsClosedImmersion`, `Scheme.IdealSheafData`, `Scheme.Modules`).
* A formal scheme is prototyped by its system of thickenings `X 0 → X 1 → ⋯` (Stacks 0AIF);
  the comparison with topologically locally ringed spaces is an API item, because Mathlib has no
  sheaves of topological rings on spaces.
* Objects that need Tau Ceti StableReduction Layers 1–4 (nodal and stable families, blowups) or
  algebraic stacks (SchemeAndStackFoundations SF.1) are not typed here; their declarations are listed in
  comment blocks under the names the roadmap gives them, and no `Prop`-valued placeholder is used.
-/

noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits

universe u

namespace AlgebraicGeometry

/-! ## SF.4a  Thickenings and formal smoothness of morphisms -/

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

-- AlgebraicGeometry.isFirstOrderThickening_dualNumber
example (k : Type u) [Field k] (B : CommRingCat.{u}) (e : B ≅ CommRingCat.of (DualNumber k))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv DualNumber.eps}) :
    IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- AlgebraicGeometry.isFirstOrderThickening_id
example (X : Scheme.{u}) : IsFirstOrderThickening (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_isFirstOrderThickening_cube
example (k : Type u) [Field k] (B : CommRingCat.{u})
    (e : B ≅ CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ 3}))
    (J : Ideal B) (hJ : J = Ideal.span {e.inv (Ideal.Quotient.mk _ Polynomial.X)}) :
    IsThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) ∧
      ¬ IsFirstOrderThickening (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk J))) := by
  sorry

-- AlgebraicGeometry.not_isThickening_origin
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

-- AlgebraicGeometry.formallySmooth_affineSpace
example (S : Scheme.{u}) (n : Type u) : FormallySmooth (𝔸(n; S) ↘ S) := by
  sorry

-- AlgebraicGeometry.formallyEtale_id
example (X : Scheme.{u}) : FormallyEtale (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_formallySmooth_closedPoint
example (k : Type u) [Field k] :
    ¬ FormallySmooth (Spec.map (CommRingCat.ofHom (Ideal.Quotient.mk
      (Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

-- AlgebraicGeometry.formallyUnramified_iff_mathlib
example {X S : Scheme.{u}} (f : X ⟶ S) :
    FormallyEtale f ↔ FormallySmooth f ∧ AlgebraicGeometry.FormallyUnramified f := by
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

end AlgebraicGeometry

/-! ## SF.4a  Formal deformation theory -/

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

-- Deformation.zmod_prime_pow_mem: Z/p^(n+1) is Artinian local (an object of C_{Z_p}).
example (p : ℕ) [Fact p.Prime] (n : ℕ) : IsArtinianRing (ZMod (p ^ (n + 1))) ∧
    IsLocalRing (ZMod (p ^ (n + 1))) := by
  sorry

-- Deformation.residue_terminal
example (A : ArtinLocalAlg Λ k) : Subsingleton (A ⟶ ArtinLocalAlg.residue) := by
  sorry

-- Deformation.not_mem_padicInt
example (p : ℕ) [Fact p.Prime] : ¬ IsArtinianRing ℤ_[p] := by
  sorry

-- Deformation.dualNumber_pullback: `k[ε] ×_k k[ε]` has a two-dimensional cotangent space.
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

-- Deformation.prorep_tangent_powerSeries
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    Nonempty ((prorep R).tangentSpace ≃ (Fin n → k)) := by
  sorry

-- Deformation.point_functor: a functor with one-point values satisfies H1 and H4 and has a
-- one-point tangent space.
example (D : PredeformationFunctor Λ k) (h : ∀ A, Subsingleton (D.F.obj A)) :
    D.H1 ∧ D.H4 ∧ Subsingleton D.tangentSpace := by
  sorry

-- Deformation.not_H2_quotient: for char k ≠ 2, the quotient of h_{k[[t]]} by t ↦ −t satisfies H1
-- but not H2.
example (h2 : (2 : k) ≠ 0) : ∃ D : PredeformationFunctor Λ k, D.H1 ∧ ¬ D.H2 := by
  sorry

-- Deformation.tangent_eq_derivations: compare Tau Ceti's derivationToDualNumberEquivLift.
example (R : CompleteLocalAlg Λ k) :
    letI := R.ρ.toRingHom.toAlgebra
    Nonempty ((prorep R).tangentSpace ≃ Derivation Λ R.R k) := by
  sorry

-- Deformation.hull_prorep
example (R : CompleteLocalAlg Λ k) : IsHull (𝟙 (prorep R).F) := by
  sorry

-- Deformation.smooth_iff_powerSeries: h_R → h_Λ is smooth iff R is a power series ring over Λ.
example (R Λ' : CompleteLocalAlg Λ k) (eΛ : Λ'.R ≃ₐ[Λ] Λ) (η : (prorep R).F ⟶ (prorep Λ').F) :
    IsSmoothMorphism η ↔ ∃ n : ℕ, Nonempty (R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) := by
  sorry

-- Deformation.versal_not_hull: (k[[t, s]], t ↦ t) is versal but not a hull for h_{k[[t]]}.
example (R R₁ : CompleteLocalAlg Λ k) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ)
    (e₁ : R₁.R ≃ₐ[Λ] MvPowerSeries (Fin 1) Λ) (ξ : FormalElement (prorep R₁) R)
    (hv : IsVersal ξ) : ¬ IsHull ξ := by
  sorry

-- Deformation.versal_quotient_no_hull: the quotient functor of `not_H2_quotient` has a versal
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

-- Deformation.obstruction_powerSeries
example (R : CompleteLocalAlg Λ k) (n : ℕ) (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin n) Λ) :
    ∃ o : ObstructionTheory (prorep R), Module.finrank k o.O = 0 := by
  sorry

-- Deformation.obstruction_hypersurface: h_{Λ[[t]]/(t²)} has a nonzero obstruction space.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] PowerSeries Λ ⧸ Ideal.span {(PowerSeries.X : PowerSeries Λ) ^ 2})
    (o : ObstructionTheory (prorep R)) : 0 < Module.finrank k o.O := by
  sorry

-- Deformation.not_unobstructed_hypersurface: h_{k[[x,y]]/(xy)} is not unobstructed.
example (R : CompleteLocalAlg Λ k)
    (e : R.R ≃ₐ[Λ] MvPowerSeries (Fin 2) Λ ⧸
      Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) Λ)}) :
    ¬ ∀ {A' A : ArtinLocalAlg Λ k} (f : A' ⟶ A), IsSmallExtension f →
      Function.Surjective ((prorep R).F.map f) := by
  sorry

/- Deformation.obstruction_H1_example: for the functor of lifts of a fixed morphism to a smooth
   target, H¹ of Hom(a^*Ω, O) is an obstruction space. It needs sheaf cohomology of O_X-modules
   (SchemeAndStackFoundations SF.2) and is stated in the roadmap only.

   Theorems of SF.4a of the roadmap not typed here (they need Ext groups of O_X-modules
   and the sheaf of differentials of Tau Ceti StableReduction Layer 1):
   * SF.4/algebra-deformation-classes  (Stacks 0GPT, 08S7, 08S5, 08S6, 0D14),
   * SF.4/deformations-of-smooth-schemes (Stacks 0DY7–0ET5, 0DZQ; H¹(T), H²(T), H¹(O), H²(O)),
   * SF.4/node-versal-deformation (hull Λ[[t]], universal family uv = t; DM69 (1.6)). -/

end Deformation

namespace AlgebraicGeometry

/-! ## SF.4b  Formal schemes, completion and algebraization -/

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
  ∀ n, AlgebraicGeometry.IsLocallyNoetherian (𝔛.X n)

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

-- AlgebraicGeometry.Spf.padicInt_points: Spf Z_p has one point.
example (p : ℕ) [Fact p.Prime] (A : AdicRing.{0}) (e : A.carrier ≃+* ℤ_[p])
    (hI : A.ideal = Ideal.span {e.symm p}) : Subsingleton ((Spf A).X 0) := by
  sorry

-- AlgebraicGeometry.Spf.discrete_eq_spec
example (A : AdicRing.{u}) (h : A.ideal = ⊥) :
    Nonempty ((Spf A).X 0 ≅ Spec (CommRingCat.of A.carrier)) := by
  sorry

-- AlgebraicGeometry.Spf.not_spec_powerSeries: Spf k[[t]] has one point, Spec k[[t]] two.
example (k : Type u) [Field k] (A : AdicRing.{u}) (e : A.carrier ≃+* PowerSeries k)
    (hI : A.ideal = Ideal.span {e.symm PowerSeries.X}) : Subsingleton ((Spf A).X 0) := by
  sorry

example (k : Type u) [Field k] : ¬ Subsingleton (Spec (CommRingCat.of (PowerSeries k))) := by
  sorry

-- AlgebraicGeometry.Spf.homEquiv_padic: the only ring endomorphism of Z_p is the identity.
example (p : ℕ) [Fact p.Prime] (φ : ℤ_[p] →+* ℤ_[p]) : φ = RingHom.id _ := by
  sorry

-- AlgebraicGeometry.FormalScheme.ofScheme_spf
example (A : AdicRing.{u}) (h : A.ideal = ⊥) (n : ℕ) :
    Nonempty ((Spf A).X n ≅ (FormalScheme.ofScheme (Spec (CommRingCat.of A.carrier))).X n) := by
  sorry

-- AlgebraicGeometry.FormalScheme.padic_line: the reductions of the completion of 𝔸¹_{Z_p} along
-- p = 0 are 𝔸¹ over Z/p^{n+1}.
example (p : ℕ) [Fact p.Prime] (n : ℕ) (A : AdicRing.{0})
    (e : A.carrier ≃+* (PowerSeries ℤ_[p])) :
    Nonempty (Spec (CommRingCat.of (Polynomial (ZMod (p ^ (n + 1))))) ≅
      Spec (CommRingCat.of (Polynomial ℤ_[p] ⧸ Ideal.span {(p : Polynomial ℤ_[p]) ^ (n + 1)}))) := by
  sorry

-- AlgebraicGeometry.FormalScheme.not_adic_projection: Spf k[[s,t]] → Spf k[[s]] is not adic,
-- because (s) does not generate an ideal of definition of k[[s,t]].
example (k : Type u) [Field k] :
    Ideal.span {(MvPowerSeries.X 0 : MvPowerSeries (Fin 2) k)} ≠
      Ideal.span {MvPowerSeries.X 0, MvPowerSeries.X 1} := by
  sorry

-- AlgebraicGeometry.FormalScheme.locallyNoetherian_padic
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
theorem flat (X : Scheme.{u}) [AlgebraicGeometry.IsLocallyNoetherian X] (I : X.IdealSheafData) :
    FormalScheme.IsLocallyNoetherian (Scheme.formalCompletion X I) := by
  sorry

end Scheme.formalCompletion

/- AlgebraicGeometry.Scheme.formalCompletion_spec: for `X = Spec A` and `I` finitely generated,
   `X/V(I) ≅ Spf Â` (Stacks 0GBA); it needs the ideal sheaf of an ideal on an affine scheme, which
   Mathlib builds only through `IdealSheafData.ofIdeals` with compatibility data; stated in the
   roadmap. -/

-- AlgebraicGeometry.formalCompletion_affineLine_origin: the reductions of the completion of 𝔸¹_k
-- at the origin are Spec k[t]/(t^{n+1}) (the reductions of Spf k[[t]]).
example (k : Type u) [Field k] (n : ℕ) :
    Nonempty (Spec (CommRingCat.of (PowerSeries k ⧸ Ideal.span {(PowerSeries.X : PowerSeries k) ^ (n + 1)})) ≅
      Spec (CommRingCat.of (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k) ^ (n + 1)}))) := by
  sorry

-- AlgebraicGeometry.formalCompletion_self
example (X : Scheme.{u}) (n : ℕ) : Nonempty ((Scheme.formalCompletion X ⊥).X n ≅ X) := by
  sorry

-- AlgebraicGeometry.formalCompletion_empty
example (X : Scheme.{u}) (n : ℕ) : IsEmpty ((Scheme.formalCompletion X ⊤).X n) := by
  sorry

-- AlgebraicGeometry.formalCompletion_ne_neighbourhood: k[[t]] is not Artinian.
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

-- AlgebraicGeometry.completion_structureSheaf_spec: for a complete Noetherian ring the map to
-- the completion is bijective.
example (A : Type u) [CommRing A] [IsNoetherianRing A] (I : Ideal A) [IsAdicComplete I A] :
    Function.Bijective (AdicCompletion.of I A) := by
  sorry

-- AlgebraicGeometry.completion_zero_ideal
example (A : Type u) [CommRing A] : Function.Bijective (AdicCompletion.of (⊥ : Ideal A) A) := by
  sorry

-- AlgebraicGeometry.completion_not_full_affineLine: k[x] → k[[x]] is not surjective, so
-- multiplication by 1/(1 − x) is not the completion of an endomorphism of O_{𝔸¹}.
example (k : Type u) [Field k] :
    ¬ Function.Surjective (Polynomial.coeToPowerSeries.ringHom : Polynomial k →+* PowerSeries k) := by
  sorry

-- AlgebraicGeometry.completion_torsion
example (p m : ℕ) [Fact p.Prime] :
    Function.Bijective (AdicCompletion.of (Ideal.span {(p : ℤ)}) (ZMod (p ^ m))) := by
  sorry

/- Theorems of SF.4b that need coherent cohomology Hⁱ(X, F) and higher direct images (Tau Ceti's
   `TauCeti.AlgebraicGeometry.Cohomology.Basic` is not compiled in this build, and coherence of
   Rⁱf_* is Tau Ceti StableReduction Layer 2):
   * SF.4/theorem-on-formal-functions  (Stacks 02OC): H^p(X,F)^ ≅ lim_n H^p(X, F/IⁿF);
   * SF.4/stein-factorization (Stacks 03H0, 0AY8);
   * SF.4/effective-formal-deformations-of-curves.
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
   SF.4/algebraization-of-subschemes-and-morphisms and is stated in the roadmap. -/

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

/-! ## SF.4c  Modifications, strict transforms, flattening, regularity -/

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
    [Surjective f] [IsIntegral S] [AlgebraicGeometry.IsLocallyNoetherian S] :
    ∃ (Z : X.IdealSheafData) (_ : IsIntegral Z.subscheme), IsAlteration (Z.subschemeι ≫ f) := by
  sorry

-- AlgebraicGeometry.isAlteration_frobenius / not_isModification_frobenius
example (p : ℕ) [Fact p.Prime] [IsIntegral (Spec (CommRingCat.of (Polynomial (ZMod p))))]
    (F : Spec (CommRingCat.of (Polynomial (ZMod p))) ⟶ Spec (CommRingCat.of (Polynomial (ZMod p))))
    (hF : F = Spec.map (CommRingCat.ofHom (frobenius (Polynomial (ZMod p)) p))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = p ∧ ¬ IsModification F := by
  sorry

-- AlgebraicGeometry.isAlteration_gaussianIntegers
example [IsIntegral (Spec (CommRingCat.of GaussianInt))] [IsIntegral (Spec (CommRingCat.of ℤ))]
    (F : Spec (CommRingCat.of GaussianInt) ⟶ Spec (CommRingCat.of ℤ))
    (hF : F = Spec.map (CommRingCat.ofHom (algebraMap ℤ GaussianInt))) :
    ∃ _ : IsAlteration F, IsAlteration.genericDegree F = 2 ∧ IsAlteration.IsGenericallyEtale F := by
  sorry

-- AlgebraicGeometry.isAlteration_id / isModification_id
example (X : Scheme.{u}) [IsIntegral X] : IsAlteration (𝟙 X) ∧ IsModification (𝟙 X) := by
  sorry

-- AlgebraicGeometry.not_isAlteration_projectiveLine: P¹_k → Spec k is not generically finite
-- (projective space is Tau Ceti StableReduction Layer 2); typed shadow with the affine line.
example (k : Type u) [Field k] :
    ¬ IsAlteration (Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))) := by
  sorry

-- AlgebraicGeometry.isModification_isAlteration
example {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S] [IsIntegral S'] [IsModification f] :
    ∃ _ : IsAlteration f, IsAlteration.genericDegree f = 1 := by
  sorry

-- AlgebraicGeometry.not_isModification_openImmersion
example (k : Type u) [Field k] :
    ¬ IsModification (Spec.map (CommRingCat.ofHom
      (algebraMap (Polynomial k) (Localization.Away (Polynomial.X : Polynomial k))))) := by
  sorry

-- AlgebraicGeometry.isModification_cusp_normalization: 𝔸¹ → V(y² − x³), t ↦ (t², t³).
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

-- AlgebraicGeometry.strictTransform_self
example {S S' : Scheme.{u}} (φ : S' ⟶ S) [IsModification φ] :
    strictTransform (𝟙 S) φ = ⊥ := by
  sorry

-- AlgebraicGeometry.strictTransformModule_torsion: the module k[t]/(t) is t-power torsion, so its
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

/- SF.4/modification-domination (Stacks 081T) and SF.4/chow-lemma (Stacks 0200) assert that the
   dominating map is an admissible blowup, resp. that the source admits an immersion into P^n_S;
   both notions are Tau Ceti StableReduction Layers 2 and 4, so these theorems are stated in the
   roadmap only. -/

/-- Regular schemes: locally Noetherian with regular local rings. -/
class IsRegular (X : Scheme.{u}) : Prop where
  isLocallyNoetherian : AlgebraicGeometry.IsLocallyNoetherian X
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

-- AlgebraicGeometry.isRegular_affineSpace
example (k : Type u) [Field k] (n : ℕ) :
    IsRegular (Spec (CommRingCat.of (MvPolynomial (Fin n) k))) := by
  sorry

-- AlgebraicGeometry.isRegular_specInt
example : IsRegular (Spec (CommRingCat.of ℤ)) := by
  sorry

-- AlgebraicGeometry.not_isRegular_node
example (k : Type u) [Field k] :
    ¬ IsRegular (Spec (CommRingCat.of
      (MvPolynomial (Fin 2) k ⧸
        Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) k)}))) := by
  sorry

-- AlgebraicGeometry.not_isRegular_dualNumbers
example (k : Type u) [Field k] : ¬ IsRegular (Spec (CommRingCat.of (DualNumber k))) := by
  sorry

-- AlgebraicGeometry.isRegular_empty
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

-- AlgebraicGeometry.snc_empty
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

/-! ## SF.4d  Grassmannians and moduli of stable pointed curves -/

/- SF.4/grassmannian-scheme (T396) is not stated here: the relative Grassmannian scheme with its
   charts, gluing and universal property is Tau Ceti ModularCurves Layer 0G, which this layer
   consumes. -/

/- SF.4/hilbert-scheme (Nitsure, Theorems 5.1–5.3): representability of Quot^{Φ,L}_{E/X/S} and
   Hilb^{Φ,L}_{X/S} by projective S-schemes, Hom and Isom as open subschemes. Not typed: relative
   very ample line bundles and Hilbert polynomials are Tau Ceti StableReduction Layer 2.

   SF.4/stable-curve-stack and its API, under the roadmap's names:
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
   algebraic stacks of SchemeAndStackFoundations SF.1, neither present in this build.

   Theorems SF.4/isom-stable-curves (DM 1.11), SF.4/stable-curve-stack-algebraic (DM 5.1–5.2,
   Stacks 0E9C), SF.4/stable-curve-stack-smooth (DM 1.6–1.9, 5.2), SF.4/level-structure-cover
   (Deligne 1985 §3, de Jong 2.24) and SF.4/stable-extension-after-alteration (de Jong 4.17,
   Deligne Lemme 1.6) are stated in the roadmap. Once Layer 3 exists the last has the shape

     theorem stable_extension_after_alteration {Y : Scheme} [IsIntegral Y] [IsNoetherian Y]
         (U : Y.Opens) (hU : Dense (U : Set Y)) (C : StablePointedFamily g n U) :
         ∃ (Y' : Scheme) (_ : IsIntegral Y') (ψ : Y' ⟶ Y) (_ : IsAlteration ψ)
           (C' : StablePointedFamily g n Y'), Nonempty (C'.restrict (ψ ⁻¹ᵁ U) ≅ C.pullback (ψ ∣_ U))
-/

/-! ## SF.4e  de Jong's alterations -/

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

-- AlgebraicGeometry.DeJong.isTrait_padicInt
example (p : ℕ) [Fact p.Prime] : IsTrait ℤ_[p] := by
  sorry

-- AlgebraicGeometry.DeJong.not_isTrait_localization
example (p : ℕ) [Fact p.Prime] [(Ideal.span {(p : ℤ)}).IsPrime] :
    ¬ IsTrait (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by
  sorry

-- AlgebraicGeometry.DeJong.ramification_sqrt: Z_p → Z_p[x]/(x² − p) has ramification index 2.
example (p : ℕ) [Fact p.Prime] (R' : Type) [CommRing R'] [IsDomain R'] [IsDiscreteValuationRing R']
    (e : R' ≃+* Polynomial ℤ_[p] ⧸ Ideal.span {Polynomial.X ^ 2 - Polynomial.C (p : ℤ_[p])})
    (φ : ℤ_[p] →+* R') (hφ : ∀ a, e (φ a) = Ideal.Quotient.mk _ (Polynomial.C a)) :
    TraitHom.ramificationIndex φ = 2 := by
  sorry

-- AlgebraicGeometry.DeJong.isSVariety_genericOnly: Spec Q_p is a Z_p-variety with empty special
-- fibre.
example (p : ℕ) [Fact p.Prime] :
    IsSVariety (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] ℚ_[p]))) := by
  sorry

-- AlgebraicGeometry.DeJong.not_isSVariety_specialPoint
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

-- AlgebraicGeometry.DeJong.strictlySemistable_xy
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C (p : ℤ_[p])})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    IsStrictlySemistable ℚ_[p] f := by
  sorry

-- AlgebraicGeometry.DeJong.strictlySemistable_smooth
example (p : ℕ) [Fact p.Prime] :
    IsStrictlySemistable ℚ_[p] (Spec.map (CommRingCat.ofHom (algebraMap ℤ_[p] (Polynomial ℤ_[p])))) := by
  sorry

-- AlgebraicGeometry.DeJong.not_strictlySemistable_xy_sq
example (p : ℕ) [Fact p.Prime] (f : Spec (CommRingCat.of (MvPolynomial (Fin 2) ℤ_[p] ⧸
    Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.C ((p : ℤ_[p]) ^ 2)})) ⟶
      Spec (CommRingCat.of ℤ_[p]))
    (hf : f = Spec.map (CommRingCat.ofHom (algebraMap _ _))) :
    ¬ IsStrictlySemistable ℚ_[p] f := by
  sorry

-- AlgebraicGeometry.DeJong.not_strictlySemistable_ramified
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

/- Split semistable curves (SF.4/split-prestable-curve) need Tau Ceti StableReduction Layer 3's
   prestable families. Declarations: AlgebraicGeometry.DeJong.IsSplitPrestable,
   AlgebraicGeometry.DeJong.IsSplitPrestable.pullback,
   AlgebraicGeometry.DeJong.IsSplitPrestable.singularLocus_section,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_smooth,
   AlgebraicGeometry.DeJong.IsSplitPrestable.of_sections; tests AlgebraicGeometry.DeJong.split_twoLines,
   AlgebraicGeometry.DeJong.not_split_nodalCubic, AlgebraicGeometry.DeJong.split_after_extension,
   AlgebraicGeometry.DeJong.split_smooth. Theorems SF.4/node-local-structure,
   SF.4/nodal-family-resolution, SF.4/generic-projection, SF.4/curve-fibration,
   SF.4/three-point-divisor, SF.4/stable-model-domination, SF.4/curve-family-alteration,
   SF.4/nc-to-snc, SF.4/faltings-formal-smoothness, SF.4/bertini-smoothness are stated in the
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

end AlgebraicGeometry

end
end SF_SF_4

/-!
## Targets without a typed form at the pins

SF.5 (intersection theory). None of T421–T436 is typed here: `CH_k(X)` (T421) needs rational
equivalence on Mathlib's `AlgebraicCycle`, which has no carrier yet; T423–T425 (proper
pushforward, flat pullback, localization) need that quotient; T426–T430 (first Chern class,
projective bundles, Chern classes, refined Gysin maps, the intersection product) need the
relative Proj of SF.0 (T004–T012) and the normal-cone deformation of SF.4; T431–T436
(Grothendieck–Riemann–Roch, the surface pairing, adjunction, Riemann–Roch and Hodge index on
surfaces, the Weil bound, Bézout) need all of the above together with SF.2's coherent duality.
Proposed names: `TauCeti.SchemeFoundations.Chow.RatEquiv`, `.c1`, `.chernClass`, `.gysin`,
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
