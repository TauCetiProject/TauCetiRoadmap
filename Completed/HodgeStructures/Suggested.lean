import Mathlib
import TauCeti.Geometry.Hodge.Abelian
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.HodgeForm
import TauCeti.Geometry.Hodge.InternalHom
import TauCeti.Geometry.Hodge.Mixed.Abelian
import TauCeti.Geometry.Hodge.Mixed.Conjugation
import TauCeti.Geometry.Hodge.Mixed.Decomposition
import TauCeti.Geometry.Hodge.Mixed.DeligneSplitting
import TauCeti.Geometry.Hodge.Mixed.Strictness
import TauCeti.Geometry.Hodge.Orthogonal
import TauCeti.Geometry.Hodge.PeriodDomain
import TauCeti.Geometry.Hodge.Semisimple
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.TensorProduct
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.Geometry.Hodge.TensorProduct
import TauCeti.Geometry.Hodge.WeightOne.Basic
import TauCeti.Geometry.Hodge.WeightOne.Lattice
import TauCeti.Geometry.Hodge.WeightOne.RiemannForm
import TauCeti.Geometry.Hodge.WeightOne.Standard
import TauCeti.Geometry.Hodge.WeilOperator
import TauCeti.LinearAlgebra.BilinearForm.Isometry

/-!
# Hodge structures (pure, mixed, and polarized): target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. No statement is left as `sorry`. That is evidence for completion,
not its criterion: completion is judged by a milestone-by-milestone audit against `README.md`,
which a `sorry`-free file of suggested forms cannot replace.

The earlier version of this file proposed its own definitions (`HodgeStructure`,
`IsPolarization`, `Polarization`, `RationalHodgeSubstructure`, `MixedHodgeStructure`, `HodgeType`,
`PeriodDomain.Point`, `IsLatticeIsometry`) and stated the four layer milestones about them. Those
definitions now live in Tau Ceti, in the conjugation-parametric form the README's *Core
definitions* section asked for, so the statements below are made about the Tau Ceti objects
directly rather than about a local copy. Three differences from the proposals are deliberate.

* `HodgeStructureOn` carries no `F_bot` field. A bounded-below filtration is forced by
  opposedness together with `F_top`, so the field would be redundant.
* `MixedHodgeStructure.graded_pure` asks for a Hodge structure on each complexified graded piece
  whose filtration *is* the induced filtration `gradedF`. This is stronger than the README's
  `Nonempty (HodgeStructureOn …)`, which does not tie the Hodge structure to the given `F`.
* The symmetry group `Aut(V, Qint)` is `TauCeti.BilinForm.isometryGroup Qint`, a `Subgroup`
  of `V ≃ₗ[ℤ] V`, rather than a separate `IsLatticeIsometry` predicate.

The successor *Variations of Hodge structure* roadmap and the specialization onto Mathlib's
in-progress filtration API are outside this roadmap by its own text, so they are not part of the
completion judgment.
-/

namespace TauCetiRoadmap.HodgeStructures

open TauCeti TauCeti.Hodge CategoryTheory
open scoped TensorProduct DirectSum ComplexOrder

universe u v w

/-! ## Core definitions -/

section Core

variable {V : Type u} {Vℂ : Type v} [AddCommGroup V] [AddCommGroup Vℂ] [Module ℂ Vℂ]
  {ιℂ : V →ₗ[ℤ] Vℂ}

/-- **One pure-Hodge object, parametric in the conjugation.** A conjugation is a conjugate-linear
involution, and the integral object is an abbreviation of the general one at the lattice-induced
conjugation, not a copy of it. -/
example (W : Type u) [AddCommGroup W] [Module ℂ W] (ω : Conjugation W) :
    Function.Involutive ω.toEquiv :=
  ω.involutive

example (hℂ : IsBaseChange ℂ ιℂ) (n : ℤ) :
    HodgeStructure hℂ n = HodgeStructureOn Vℂ (latticeConjugation hℂ) n :=
  rfl

/-- **Conjugation is defined, not assumed.** `latticeConj` fixes the integral points, is an
involution, and is the unique conjugate-linear map fixing them. -/
theorem latticeConj_ι (hℂ : IsBaseChange ℂ ιℂ) (v : V) : latticeConj hℂ (ιℂ v) = ιℂ v :=
  Hodge.latticeConj_ι hℂ v

theorem latticeConj_involutive (hℂ : IsBaseChange ℂ ιℂ) :
    Function.Involutive (latticeConj hℂ) :=
  Hodge.latticeConj_involutive hℂ

theorem latticeConj_unique (hℂ : IsBaseChange ℂ ιℂ) (c : Vℂ →ₛₗ[starRingEnd ℂ] Vℂ)
    (hc : ∀ v, c (ιℂ v) = ιℂ v) : c = latticeConj hℂ :=
  Hodge.latticeConj_unique hℂ c hc

/-- **Polarization is one integral form.** `IsPolarization` is a `Prop` on a given integral form,
and the complex form of a `Polarization` is derived from the integral one. -/
example (hℂ : IsBaseChange ℂ ιℂ) {n : ℤ} (hs : HodgeStructure hℂ n)
    (Qint : LinearMap.BilinForm ℤ V) : Prop :=
  IsPolarization hℂ hs Qint

theorem Polarization.Q_ι {hℂ : IsBaseChange ℂ ιℂ} {n : ℤ} {hs : HodgeStructure hℂ n}
    (P : Polarization hℂ hs) (x y : V) : P.Q (ιℂ x) (ιℂ y) = (P.Qint x y : ℂ) :=
  Hodge.Polarization.Q_ι P x y

noncomputable section Tower

/- The rational-to-complex structure map is `ℚ`-linear for the `ℚ`-module structure obtained by
restricting scalars along `ℚ → ℂ`; Tau Ceti keeps these instances local, so they are repeated
here. -/
local instance (priority := low) : Module ℚ Vℂ := Module.restrictScalars ℚ ℂ Vℂ
local instance : IsScalarTower ℚ ℂ Vℂ := IsScalarTower.restrictScalars ℚ ℂ Vℂ
local instance : IsScalarTower ℤ ℚ ℂ where
  smul_assoc z q w := by
    norm_num [Algebra.smul_def, smul_eq_mul]
    ring
local instance : IsScalarTower ℤ ℚ Vℂ := IsScalarTower.to₁₂₄ ℤ ℚ ℂ Vℂ

/-- **The `ℤ → ℚ → ℂ` tower composes as a property.** The complex model is the base change of the
rational one along the canonical rational-to-complex map, and that map restricts on the lattice to
the given structure map. -/
theorem isBaseChange_rationalToComplexMap {Vℚ : Type w} [AddCommGroup Vℚ] [Module ℚ Vℚ]
    {ιℚ : V →ₗ[ℤ] Vℚ} (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ) :
    IsBaseChange ℂ (rationalToComplexMap hℚ ιℂ) :=
  Hodge.isBaseChange_rationalToComplexMap hℚ hℂ

theorem rationalToComplexMap_restrictScalars_comp {Vℚ : Type w} [AddCommGroup Vℚ] [Module ℚ Vℚ]
    {ιℚ : V →ₗ[ℤ] Vℚ} (hℚ : IsBaseChange ℚ ιℚ) :
    (rationalToComplexMap hℚ ιℂ).restrictScalars ℤ ∘ₗ ιℚ = ιℂ :=
  Hodge.rationalToComplexMap_restrictScalars_comp hℚ ιℂ

end Tower

/-- **Rational substructures derive their complexification.** -/
example {Vℚ : Type w} [AddCommGroup Vℚ] [Module ℚ Vℚ] {ιℚ : V →ₗ[ℤ] Vℚ}
    {hℚ : IsBaseChange ℚ ιℚ} {hℂ : IsBaseChange ℂ ιℂ} {n : ℤ} {hs : HodgeStructure hℂ n}
    (W : RationalHodgeSubstructure hℚ hs) : W.WC = rationalToComplexSubmodule hℚ hℂ W.WQ :=
  W.WC_def

end Core

/-! ## Worked instances -/

section Instances

/-- **The Tate structure `ℤ(m)`**, of weight `-2m` and type `(-m, -m)`. -/
example (m : ℤ) : (tateHodgeType m).weight = -2 * m :=
  tateHodgeType_weight m

theorem tate_piece (m p : ℤ) :
    (tate m).piece p = if p = -m then (⊤ : Submodule ℂ ℂ) else ⊥ :=
  Hodge.tate_piece m p

theorem tate_hodgeNumber (m p : ℤ) : (tate m).hodgeNumber p = if p = -m then 1 else 0 :=
  Hodge.tate_hodgeNumber m p

theorem isPolarization_tate (m : ℤ) :
    IsPolarization isBaseChange_tateLatticeMap (tate m) (LinearMap.mul ℤ ℤ) :=
  Hodge.isPolarization_tate m

/-- **The Tate twist** `V(m)` has weight `n - 2m` and `F^p(V(m)) = F^{p+m}(V)`, and it is the
tensor product with `ℤ(m)`: its filtration is pulled back from that of `V ⊗ ℤ(m)` along the right
unitor. -/
example {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {n : ℤ}
    (hs : HodgeStructureOn W ω n) (m : ℤ) : HodgeStructureOn W ω (n - 2 * m) :=
  hs.tateTwist m

theorem tateTwist_F {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {n : ℤ}
    (hs : HodgeStructureOn W ω n) (m p : ℤ) : (hs.tateTwist m).F p = hs.F (p + m) :=
  hs.tateTwist_F m p

theorem tateTwist_F_eq_comap {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W}
    {n : ℤ} (hs : HodgeStructureOn W ω n) (m p : ℤ) :
    (hs.tateTwist m).F p =
      ((hs.tensorProduct (tate m)).F p).comap (TensorProduct.rid ℂ W).symm.toLinearMap :=
  hs.tateTwist_F_eq_comap m p

/-- **Effective weight one.** For a complex structure `J` on the realification of a flat lattice,
the Riemann forms of `J` are exactly the forms polarizing its effective weight-one Hodge
structure. -/
theorem isRiemannForm_iff_isPolarization {V : Type u} {Vℂ : Type v} [AddCommGroup V]
    [AddCommGroup Vℂ] [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ} [Module.Flat ℤ V]
    (J : AlmostComplexStructure (Hodge.Realification V)) (hℂ : IsBaseChange ℂ ιℂ)
    (E : LinearMap.BilinForm ℤ V) :
    J.IsRiemannForm E ↔ IsPolarization hℂ (J.latticeHodgeStructure hℂ) E :=
  J.isRiemannForm_iff_isPolarization hℂ E

/-- The explicit rank-two instance on `ℤ × ℤ`: a polarized effective weight-one structure. -/
theorem standard_isEffective : StandardWeightOne.hodgeStructure.IsEffective :=
  StandardWeightOne.isEffective_hodgeStructure

noncomputable example : Polarization StandardWeightOne.isBaseChange_latticeToComplex
    StandardWeightOne.hodgeStructure :=
  StandardWeightOne.polarization

/-- **A pure structure viewed as mixed.** Its Deligne bigrading is the Hodge decomposition, placed
in total degree `n`. -/
theorem ofPure_deligneSplitting_eq_piece {V : Type u} {Vℚ : Type v} {Vℂ : Type w}
    [AddCommGroup V] [AddCommGroup Vℚ] [Module ℚ Vℚ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
    {ιℚ : V →ₗ[ℤ] Vℚ} {ιℂ : V →ₗ[ℤ] Vℂ} (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    {n : ℤ} (hs : HodgeStructure hℂ n) {p q : ℤ} (hpq : p + q = n) :
    (MixedHodgeStructure.ofPure (Vℚ := Vℚ) hℚ hℂ hs).deligneSplitting p q = hs.piece p :=
  MixedHodgeStructure.ofPure_deligneSplitting_eq_piece_of_add_eq hℚ hℂ hs hpq

end Instances

/-! ## L0: pure Hodge structures and the Hodge decomposition -/

section L0

variable {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {n : ℤ}

/-- **L0 milestone — the Hodge decomposition.** The `(p,q)`-pieces of a weight-`n` Hodge structure
form an internal direct sum. -/
theorem isInternal_piece (hs : HodgeStructureOn W ω n) : DirectSum.IsInternal hs.piece :=
  hs.isInternal_piece

/-- The `(p,q)` symmetry `conj (piece p) = piece (n - p)`. -/
theorem conj_piece (hs : HodgeStructureOn W ω n) (p : ℤ) :
    (hs.piece p).map ω.toEquiv.toLinearMap = hs.piece (n - p) :=
  hs.conj_piece p

/-- Morphisms, and the dual, tensor product and internal Hom, with their weights. -/
example {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n) (g : W →ₗ[ℂ] W') : Prop :=
  HodgeStructureOn.IsMorphism hs hs' g

noncomputable example (hs : HodgeStructureOn W ω n) : HodgeStructureOn (Module.Dual ℂ W) ω.dual (-n) :=
  hs.dual

noncomputable example {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'} {n' : ℤ}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') :
    HodgeStructureOn (W ⊗[ℂ] W') (ω.tensorProduct ω') (n + n') :=
  hs.tensorProduct hs'

noncomputable example {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'} {n' : ℤ}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') :
    HodgeStructureOn (W →ₗ[ℂ] W') (ω.internalHom ω') (n' - n) :=
  hs.internalHom hs'

/-- **Effectivity is a named hypothesis.** Under it, in weight one, the `±i`-eigenspaces of the
Weil operator are exactly the `(1,0)` and `(0,1)` pieces. -/
theorem eigenspace_weilOperator_I (hs : HodgeStructureOn W ω 1) (heff : hs.IsEffective) :
    Module.End.eigenspace hs.weilOperator Complex.I = hs.piece 1 :=
  hs.eigenspace_weilOperator_I heff

theorem eigenspace_weilOperator_neg_I (hs : HodgeStructureOn W ω 1) (heff : hs.IsEffective) :
    Module.End.eigenspace hs.weilOperator (-Complex.I) = hs.piece 0 :=
  hs.eigenspace_weilOperator_neg_I heff

/-- **The instance bridge.** On a lattice, complex structures on the realification correspond
exactly to effective weight-one Hodge structures. -/
noncomputable example {V : Type u} {Vℂ : Type v} [AddCommGroup V] [AddCommGroup Vℂ]
    [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ} (hℂ : IsBaseChange ℂ ιℂ) :
    AlmostComplexStructure (Hodge.Realification V) ≃
      {hs : HodgeStructure hℂ 1 // hs.IsEffective} :=
  AlmostComplexStructure.latticeHodgeStructureEquiv hℂ

end L0

/-! ## L1: polarization, the Weil operator, and semisimplicity -/

section L1

/-- **The Weil operator** acts by `i^{p-q}` on `H^{p,q}` and squares to `(-1)^n`. -/
theorem weilOperator_apply_of_mem {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W}
    {n : ℤ} (hs : HodgeStructureOn W ω n) {p : ℤ} {x : W} (hx : x ∈ hs.piece p) :
    hs.weilOperator x = Complex.I ^ (2 * p - n) • x :=
  hs.weilOperator_apply_of_mem hx

theorem weilOperator_comp_weilOperator {W : Type u} [AddCommGroup W] [Module ℂ W]
    {ω : Conjugation W} {n : ℤ} (hs : HodgeStructureOn W ω n) :
    hs.weilOperator ∘ₗ hs.weilOperator = ((-1 : ℂ) ^ n) • LinearMap.id :=
  hs.weilOperator_comp_weilOperator

/-- The Weil operator commutes with the conjugation. -/
theorem conj_weilOperator {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {n : ℤ}
    (hs : HodgeStructureOn W ω n) (x : W) :
    ω.toEquiv (hs.weilOperator x) = hs.weilOperator (ω.toEquiv x) :=
  hs.conj_weilOperator x

variable {V : Type u} {Vℂ : Type v} [AddCommGroup V] [AddCommGroup Vℂ] [Module ℂ Vℂ]
  {ιℂ : V →ₗ[ℤ] Vℂ} {hℂ : IsBaseChange ℂ ιℂ} {n : ℤ} {hs : HodgeStructure hℂ n}

/-- The Weil operator preserves the polarizing form. -/
theorem Q_weilOperator (P : Polarization hℂ hs) (x y : Vℂ) :
    P.Q (hs.weilOperator x) (hs.weilOperator y) = P.Q x y :=
  P.Q_weilOperator x y

/-- The Hodge form `h(u, v) = Q(C u, v̄)` is positive definite on all of `V_ℂ`. -/
theorem hodgeForm_self_pos (P : Polarization hℂ hs) {x : Vℂ} (hx : x ≠ 0) :
    0 < P.hodgeForm x x :=
  P.hodgeForm_self_pos hx

/-- **L1 milestone — orthogonal complements.** Every rational Hodge substructure of a polarizable
structure has a rational Hodge-substructure complement, complementary on both the rational and the
complex side and orthogonal for some polarizing form. -/
theorem exists_isCompl_of_isPolarizable {Vℚ : Type w} [AddCommGroup Vℚ] [Module ℚ Vℚ]
    [Module.Finite ℚ Vℚ] {ιℚ : V →ₗ[ℤ] Vℚ} {hℚ : IsBaseChange ℚ ιℚ}
    (h : IsPolarizable hℂ hs) (W : RationalHodgeSubstructure hℚ hs) :
    ∃ P : Polarization hℂ hs, ∃ W' : RationalHodgeSubstructure hℚ hs,
      IsCompl W.WQ W'.WQ ∧ IsCompl W.WC W'.WC ∧
        ∀ v ∈ W.WC, ∀ w ∈ W'.WC, P.Q v w = 0 :=
  Hodge.exists_isCompl_of_isPolarizable h W

/-- **L1 milestone — semisimplicity.** The category of polarizable rational Hodge structures of
weight `n`, with ordinary Hodge morphisms, is abelian, and every object is a finite biproduct of
simple objects. -/
noncomputable example (n : ℤ) : Abelian (PolarizableHodgeStructureCat.{u} n) :=
  inferInstance

theorem exists_iso_biproduct_simple {n : ℤ} (X : PolarizableHodgeStructureCat.{u} n) :
    ∃ s : Finset (RationalHodgeSubstructure X.isBaseChangeRat X.hs),
      (∀ U ∈ s, Simple (PolarizableHodgeStructureCat.ofSubstructure X U)) ∧
        Nonempty ((⨁ fun U : s ↦ PolarizableHodgeStructureCat.ofSubstructure X U.1) ≅ X) :=
  X.exists_iso_biproduct_simple

end L1

/-! ## L2: mixed Hodge structures and strictness -/

section L2

variable {Vℤ : Type u} {Vℚ : Type v} {Vℂ : Type w}
  [AddCommGroup Vℤ] [AddCommGroup Vℚ] [Module ℚ Vℚ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
  {ιℚ : Vℤ →ₗ[ℤ] Vℚ} {ιℂ : Vℤ →ₗ[ℤ] Vℂ} {hℚ : IsBaseChange ℚ ιℚ} {hℂ : IsBaseChange ℂ ιℂ}
  {V'ℤ : Type u} {V'ℚ : Type v} {V'ℂ : Type w}
  [AddCommGroup V'ℤ] [AddCommGroup V'ℚ] [Module ℚ V'ℚ] [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
  {ι'ℚ : V'ℤ →ₗ[ℤ] V'ℚ} {ι'ℂ : V'ℤ →ₗ[ℤ] V'ℂ} {h'ℚ : IsBaseChange ℚ ι'ℚ}
  {h'ℂ : IsBaseChange ℂ ι'ℂ}

/-- Each rational graded piece of a mixed Hodge structure, complexified, carries a pure Hodge
structure of weight `k` whose filtration is the induced one. -/
theorem graded_pure (mhs : MixedHodgeStructure hℚ hℂ) (k : ℤ) :
    ∃ hs : HodgeStructure (isBaseChange_ratTensorMap ℂ (weightGradedRat mhs.WQ k)) k,
      hs.F = gradedF hℚ hℂ mhs.WQ mhs.WQ_monotone mhs.F k :=
  mhs.graded_pure k

/-- Complexification commutes with the graded quotient. -/
noncomputable example (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ) (k : ℤ) :
    ℂ ⊗[ℚ] weightGradedRat WQ k ≃ₗ[ℂ]
      weightGradedComplex (fun k ↦ rationalToComplexSubmodule hℚ hℂ (WQ k)) k :=
  gradedComplexEquiv hℚ hℂ WQ hWQ k

/-- **Conjugation-equivariance of the abstract complexified map**, for every `IsBaseChange` model
and not only the concrete tensor. -/
theorem rationalMapToComplex_comp_latticeConj (f : Vℚ →ₗ[ℚ] V'ℚ) :
    (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ f).comp (latticeConj hℂ) =
      (latticeConj h'ℂ).comp (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ f) :=
  Hodge.rationalMapToComplex_comp_latticeConj hℚ hℂ h'ℚ h'ℂ f

/-- **Deligne's bigrading**, defined by its closed formula, is an internal direct sum, and it
recovers both the Hodge filtration and the complexified weight filtration. -/
theorem isInternal_deligneSplittingFamily (mhs : MixedHodgeStructure hℚ hℂ) :
    DirectSum.IsInternal mhs.deligneSplittingFamily :=
  mhs.isInternal_deligneSplittingFamily

theorem F_eq_iSup_deligneSplitting (mhs : MixedHodgeStructure hℚ hℂ) (p : ℤ) :
    mhs.F p = ⨆ (rs : ℤ × ℤ) (_ : p ≤ rs.1), mhs.deligneSplitting rs.1 rs.2 :=
  mhs.F_eq_iSup_deligneSplitting p

theorem WC_eq_iSup_deligneSplitting (mhs : MixedHodgeStructure hℚ hℂ) (k : ℤ) :
    mhs.WC k = ⨆ (rs : ℤ × ℤ) (_ : rs.1 + rs.2 ≤ k), mhs.deligneSplitting rs.1 rs.2 :=
  mhs.WC_eq_iSup_deligneSplitting k

/-- **The conjugation relation**, in the fine form of Peters–Steenbrink §3.1:
`conj (I^{p,q}) ≡ I^{q,p}` modulo `⨆_{r<q, s<p} I^{r,s}`. -/
theorem map_latticeConj_deligneSplitting_sup_below (mhs : MixedHodgeStructure hℚ hℂ) (p q : ℤ) :
    (mhs.deligneSplitting p q).map (latticeConj hℂ) ⊔ mhs.deligneSplittingBelow q p =
      mhs.deligneSplitting q p ⊔ mhs.deligneSplittingBelow q p :=
  mhs.map_latticeConj_deligneSplitting_sup_below p q

example (mhs : MixedHodgeStructure hℚ hℂ) (p q : ℤ) :
    mhs.deligneSplittingBelow p q =
      ⨆ r, ⨆ (_ : r < p), ⨆ s, ⨆ (_ : s < q), mhs.deligneSplitting r s :=
  rfl

/-- Functoriality: a morphism carries `I^{p,q}` into `I^{p,q}`. -/
theorem map_deligneSplitting_le {source : MixedHodgeStructure hℚ hℂ}
    {target : MixedHodgeStructure h'ℚ h'ℂ} (f : MixedHodgeStructure.Hom source target)
    (p q : ℤ) :
    (source.deligneSplitting p q).map f.toLinearMap ≤ target.deligneSplitting p q :=
  f.map_deligneSplitting_le p q

/-- **L2 milestone — strictness.** A morphism of mixed Hodge structures is strict for the rational
weight filtration, its complexification, and the Hodge filtration. -/
theorem strict {source : MixedHodgeStructure hℚ hℂ} {target : MixedHodgeStructure h'ℚ h'ℂ}
    (f : MixedHodgeStructure.Hom source target) :
    (∀ k, LinearMap.range f.toRatLinearMap ⊓ target.WQ k =
        (source.WQ k).map f.toRatLinearMap) ∧
      (∀ k, LinearMap.range f.toLinearMap ⊓ target.WC k = (source.WC k).map f.toLinearMap) ∧
      (∀ p, LinearMap.range f.toLinearMap ⊓ target.F p = (source.F p).map f.toLinearMap) :=
  ⟨f.range_inf_WQ_eq_map_WQ, f.range_inf_WC_eq_map_WC, f.range_inf_F_eq_map_F⟩

/-- Strictness makes mixed Hodge structures an abelian category. -/
noncomputable example : Abelian MixedHodgeStructureCat.{u} :=
  inferInstance

end L2

/-! ## L3: period-domain points and the symmetry group -/

section L3

variable {V : Type u} {Vℂ : Type v} [AddCommGroup V] [Module.Free ℤ V] [Module.Finite ℤ V]
  [AddCommGroup Vℂ] [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ} {hℂ : IsBaseChange ℂ ιℂ}

/-- **L3 milestone — the Hodge numbers partition the dimension.** -/
theorem finsum_h_eq_finrank {n : ℤ} {Qint : LinearMap.BilinForm ℤ V} {htype : HodgeType}
    (D : PeriodDomain.Point hℂ n Qint htype) :
    ∑ᶠ p, htype.h p = Module.finrank ℂ Vℂ :=
  D.finsum_h_eq_finrank

/-- A point of the period domain carries the fixed form only as an `IsPolarization` witness. -/
theorem PeriodDomain.Point.pol {n : ℤ} {Qint : LinearMap.BilinForm ℤ V} {htype : HodgeType}
    (D : PeriodDomain.Point hℂ n Qint htype) : IsPolarization hℂ D.hs Qint :=
  D.pol

/-- **The symmetry group** `Aut(V, Qint)`, as a subgroup of the integral automorphisms. -/
example (Qint : LinearMap.BilinForm ℤ V) : Subgroup (V ≃ₗ[ℤ] V) :=
  BilinForm.isometryGroup Qint

end L3

end TauCetiRoadmap.HodgeStructures
