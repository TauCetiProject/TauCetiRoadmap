import Mathlib
import TauCeti.Geometry.Hodge.Abelian
import TauCeti.Geometry.Hodge.Dimension
import TauCeti.Geometry.Hodge.Dual
import TauCeti.Geometry.Hodge.HodgeForm
import TauCeti.Geometry.Hodge.InternalHom.Basic
import TauCeti.Geometry.Hodge.Mixed.Abelian
import TauCeti.Geometry.Hodge.Mixed.Conjugation
import TauCeti.Geometry.Hodge.Mixed.Decomposition
import TauCeti.Geometry.Hodge.Mixed.DeligneSplitting
import TauCeti.Geometry.Hodge.Mixed.Strictness
import TauCeti.Geometry.Hodge.Orthogonal
import TauCeti.Geometry.Hodge.PeriodDomain
import TauCeti.Geometry.Hodge.Realification
import TauCeti.Geometry.Hodge.Semisimple
import TauCeti.Geometry.Hodge.Tate.Basic
import TauCeti.Geometry.Hodge.Tate.TensorProduct
import TauCeti.Geometry.Hodge.Tate.Twist
import TauCeti.Geometry.Hodge.TensorProduct.Basic
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

* `HodgeStructureOn` carries no `F_bot` field. Vanishing of the decreasing filtration in high
  degree, `∃ p, F p = ⊥`, follows from `F_top`, opposedness and involutivity of the conjugation
  (`HodgeStructureOn.F_bot`), so the field would be redundant.
* `MixedHodgeStructure.graded_pure` asks for a Hodge structure on each complexified graded piece
  whose filtration *is* the induced filtration `gradedF`. This is stronger than the README's
  `Nonempty (HodgeStructureOn …)`, which does not tie the Hodge structure to the given `F`.
* The symmetry group `Aut(V, Qint)` is `TauCeti.BilinForm.isometryGroup Qint`, a `Subgroup`
  of `V ≃ₗ[ℤ] V`, rather than a separate `IsLatticeIsometry` predicate.

The successor *Variations of Hodge structure* roadmap is outside this roadmap by its own text,
so it is not part of the completion judgment. The README also asks that `opposed`, `gradedF` and
`gradedComplexEquiv` be specialized onto a Mathlib filtration API with opposed filtrations and
induced filtrations on graded pieces, should one land. The Mathlib API merged so far
(`CategoryTheory.Filtration`, mathlib4#42642) is a categorical filtration as a functor to
`MonoOver X`, with strict morphisms; it has no notion of opposed filtrations or of graded pieces,
so there is not yet anything for these declarations to specialize onto.
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

/-- **Polarization is one integral form.** `IsPolarization` is a `Prop` on a given integral form:
`(-1)^n`-symmetry, nondegeneracy, orthogonality `Q(F^p, F^{n-p+1}) = 0` and positivity
`i^{p-q} Q(v, v̄) > 0` on `H^{p,q}`. Nondegeneracy is stated for the integral form; on a finite
free lattice this is equivalent to nondegeneracy of its complexification. The complex form of a
`Polarization` is derived from the integral one. -/
theorem isPolarization_iff (hℂ : IsBaseChange ℂ ιℂ) {n : ℤ} (hs : HodgeStructure hℂ n)
    (Qint : LinearMap.BilinForm ℤ V) :
    IsPolarization hℂ hs Qint ↔
      (∀ x y, Qint y x = (n.negOnePow : ℤ) * Qint x y) ∧ Qint.Nondegenerate ∧
        (∀ p, ∀ x ∈ hs.F p, ∀ y ∈ hs.F (n + 1 - p), integralFormBaseChange hℂ Qint x y = 0) ∧
        (∀ p, ∀ x ∈ hs.piece p, x ≠ 0 →
          0 < Complex.I ^ (2 * p - n) * integralFormBaseChange hℂ Qint x (latticeConj hℂ x)) :=
  ⟨fun h ↦ ⟨h.symm_weight, h.nondegenerate, h.orthogonal, h.positive⟩,
    fun ⟨h₁, h₂, h₃, h₄⟩ ↦ ⟨h₁, h₂, h₃, h₄⟩⟩

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

/-- The explicit standard instance on `ℤ^{l ⊕ l}`, principally polarized by the standard
symplectic form: a polarized effective weight-one structure. -/
theorem standard_isEffective (l : Type*) [Fintype l] [DecidableEq l] :
    (StandardWeightOne.hodgeStructure l).IsEffective :=
  StandardWeightOne.isEffective_hodgeStructure l

noncomputable example (l : Type*) [Fintype l] [DecidableEq l] :
    Polarization (StandardWeightOne.isBaseChange_latticeToComplex l)
      (StandardWeightOne.hodgeStructure l) :=
  StandardWeightOne.polarization l

/-- **A pure structure viewed as mixed.** Its Deligne bigrading is the Hodge decomposition, placed
in total degree `n`. -/
theorem ofPure_deligneSplitting_eq_piece {V : Type u} {Vℚ : Type v} {Vℂ : Type w}
    [AddCommGroup V] [AddCommGroup Vℚ] [Module ℚ Vℚ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
    {ιℚ : V →ₗ[ℤ] Vℚ} {ιℂ : V →ₗ[ℤ] Vℂ} (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    {n : ℤ} (hs : HodgeStructure hℂ n) {p q : ℤ} (hpq : p + q = n) :
    (MixedHodgeStructure.ofPure (Vℚ := Vℚ) hℚ hℂ hs).deligneSplitting p q = hs.piece p :=
  MixedHodgeStructure.ofPure_deligneSplitting_eq_piece_of_add_eq hℚ hℂ hs hpq

/-- Its weight filtration is concentrated in degree `n`, and its Hodge filtration is that of `hs`. -/
theorem ofPure_WQ_F {V : Type u} {Vℚ : Type v} {Vℂ : Type w}
    [AddCommGroup V] [AddCommGroup Vℚ] [Module ℚ Vℚ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
    {ιℚ : V →ₗ[ℤ] Vℚ} {ιℂ : V →ₗ[ℤ] Vℂ} (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    {n : ℤ} (hs : HodgeStructure hℂ n) (k : ℤ) :
    (MixedHodgeStructure.ofPure (Vℚ := Vℚ) hℚ hℂ hs).WQ k = (if n ≤ k then ⊤ else ⊥) ∧
      (MixedHodgeStructure.ofPure (Vℚ := Vℚ) hℚ hℂ hs).F = hs.F :=
  ⟨rfl, rfl⟩

end Instances

/-! ## L0: pure Hodge structures and the Hodge decomposition -/

section L0

variable {W : Type u} [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {n : ℤ}

/-- **L0 milestone — the Hodge decomposition.** The `(p,q)`-pieces of a weight-`n` Hodge structure
form an internal direct sum. -/
theorem isInternal_piece (hs : HodgeStructureOn W ω n) : DirectSum.IsInternal hs.piece :=
  hs.isInternal_piece

/-- The discharge route: the filtration is recovered from the pieces, `F^p = ⨆_{q ≥ p} H^{q}`, and
conversely a conjugation-symmetric bounded internal direct sum comes from a unique Hodge structure,
so `n`-opposed filtrations and `(p,q)`-decompositions are equivalent. -/
theorem F_eq_iSup_piece (hs : HodgeStructureOn W ω n) (p : ℤ) :
    hs.F p = ⨆ q, ⨆ (_ : p ≤ q), hs.piece q :=
  hs.F_eq_iSup_piece p

noncomputable example (ω : Conjugation W) (n : ℤ) :
    HodgeStructureOn W ω n ≃ {H : ℤ → Submodule ℂ W // IsHodgeDecomposition ω n H} :=
  HodgeStructureOn.decompositionEquiv ω n

theorem coe_decompositionEquiv_apply (hs : HodgeStructureOn W ω n) :
    (↑(HodgeStructureOn.decompositionEquiv ω n hs) : ℤ → Submodule ℂ W) = hs.piece :=
  HodgeStructureOn.coe_decompositionEquiv_apply hs

theorem isHodgeDecomposition_iff (H : ℤ → Submodule ℂ W) :
    IsHodgeDecomposition ω n H ↔
      DirectSum.IsInternal H ∧ (∀ p, (H p).map ω.toEquiv.toLinearMap = H (n - p)) ∧
        ∃ a, ∀ p < a, H p = ⊥ :=
  ⟨fun h ↦ ⟨h.isInternal, h.map_conj, h.exists_forall_lt_eq_bot⟩, fun ⟨h₁, h₂, h₃⟩ ↦ ⟨h₁, h₂, h₃⟩⟩

/-- The `(p,q)` symmetry `conj (piece p) = piece (n - p)`. -/
theorem conj_piece (hs : HodgeStructureOn W ω n) (p : ℤ) :
    (hs.piece p).map ω.toEquiv.toLinearMap = hs.piece (n - p) :=
  hs.conj_piece p

/-- **Morphisms.** A morphism of Hodge structures commutes with the conjugations and preserves
the Hodge filtration. -/
theorem isMorphism_iff {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n) (g : W →ₗ[ℂ] W') :
    HodgeStructureOn.IsMorphism hs hs' g ↔
      (∀ x, g (ω.toEquiv x) = ω'.toEquiv (g x)) ∧ ∀ p, (hs.F p).map g ≤ hs'.F p :=
  ⟨fun h ↦ ⟨h.commutes_conj, h.map_F_le⟩, fun ⟨h₁, h₂⟩ ↦ ⟨h₁, h₂⟩⟩

/-- On lattices, a morphism is an integral map whose complexification preserves the Hodge
filtration. -/
theorem Hom.map_F_le {V₁ V₂ W₁ W₂ : Type*} [AddCommGroup V₁] [AddCommGroup V₂] [AddCommGroup W₁]
    [Module ℂ W₁] [AddCommGroup W₂] [Module ℂ W₂] {ι₁ : V₁ →ₗ[ℤ] W₁} {ι₂ : V₂ →ₗ[ℤ] W₂}
    {h₁ : IsBaseChange ℂ ι₁} {h₂ : IsBaseChange ℂ ι₂} {source : HodgeStructure h₁ n}
    {target : HodgeStructure h₂ n} (f : HodgeStructure.Hom source target) (p : ℤ) :
    f.toLinearMap = integralMapToComplex h₁ ι₂ f.toIntLinearMap ∧
      (source.F p).map f.toLinearMap ≤ target.F p :=
  ⟨rfl, f.map_F_le p⟩

/-- **The dual, tensor product and internal Hom**, with their weights and filtrations, first on
complex spaces with a conjugation. -/

noncomputable example (hs : HodgeStructureOn W ω n) : HodgeStructureOn (Module.Dual ℂ W) ω.dual (-n) :=
  hs.dual

theorem dual_F (hs : HodgeStructureOn W ω n) (p : ℤ) :
    hs.dual.F p = (hs.F (1 - p)).dualAnnihilator :=
  HodgeStructureOn.dual_F hs p

noncomputable example {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'} {n' : ℤ}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') :
    HodgeStructureOn (W ⊗[ℂ] W') (ω.tensorProduct ω') (n + n') :=
  hs.tensorProduct hs'

theorem tensorProduct_piece {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'}
    {n' : ℤ} (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') (p : ℤ) :
    (hs.tensorProduct hs').piece p =
      ⨆ r : ℤ, Submodule.map₂ (TensorProduct.mk ℂ W W') (hs.piece r) (hs'.piece (p - r)) :=
  hs.tensorProduct_piece_eq_iSup hs' p

noncomputable example {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'} {n' : ℤ}
    (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') :
    HodgeStructureOn (W →ₗ[ℂ] W') (ω.internalHom ω') (n' - n) :=
  hs.internalHom hs'

theorem mem_internalHom_F_iff {W' : Type v} [AddCommGroup W'] [Module ℂ W'] {ω' : Conjugation W'}
    {n' : ℤ} (hs : HodgeStructureOn W ω n) (hs' : HodgeStructureOn W' ω' n') {p : ℤ}
    (f : W →ₗ[ℂ] W') :
    f ∈ (hs.internalHom hs').F p ↔ ∀ q, ∀ x ∈ hs.F q, f x ∈ hs'.F (p + q) :=
  hs.mem_internalHom_F_iff hs' f

/-- **The integral dual, tensor product and internal Hom.** On lattices these are Hodge structures
on `Module.Dual ℤ V`, `V ⊗[ℤ] V'` and `V →ₗ[ℤ] V'`, carried by the base-change witnesses of the
corresponding complexifications, so their conjugation is the lattice-induced one; their filtrations
are those of the complex constructions above. -/
noncomputable example {V : Type u} {Vℂ : Type v} [AddCommGroup V] [AddCommGroup Vℂ] [Module ℂ Vℂ]
    {ιℂ : V →ₗ[ℤ] Vℂ} [Module.Free ℤ V] [Module.Finite ℤ V] {hℂ : IsBaseChange ℂ ιℂ}
    (hs : HodgeStructure hℂ n) : HodgeStructure (isBaseChange_dualLatticeMap hℂ) (-n) :=
  hs.dual

theorem HodgeStructure.dual_F {V : Type u} {Vℂ : Type v} [AddCommGroup V] [AddCommGroup Vℂ]
    [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ} [Module.Free ℤ V] [Module.Finite ℤ V]
    {hℂ : IsBaseChange ℂ ιℂ} (hs : HodgeStructure hℂ n) (p : ℤ) :
    hs.dual.F p = (hs.F (1 - p)).dualAnnihilator := by
  rw [Hodge.HodgeStructure.dual_F, HodgeStructureOn.dual_F]

theorem HodgeStructure.tensorProduct_piece {V V' Vℂ V'ℂ : Type*} [AddCommGroup V]
    [AddCommGroup V'] [AddCommGroup Vℂ] [Module ℂ Vℂ] [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
    {ιℂ : V →ₗ[ℤ] Vℂ} {ι'ℂ : V' →ₗ[ℤ] V'ℂ} {hℂ : IsBaseChange ℂ ιℂ} {h'ℂ : IsBaseChange ℂ ι'ℂ}
    {n' : ℤ} (hs : HodgeStructure hℂ n) (hs' : HodgeStructure h'ℂ n') (p : ℤ) :
    (hs.tensorProduct hs' : HodgeStructure (isBaseChange_tensorLatticeMap hℂ h'ℂ) (n + n')).piece
        p =
      ⨆ r : ℤ, Submodule.map₂ (TensorProduct.mk ℂ Vℂ V'ℂ) (hs.piece r) (hs'.piece (p - r)) := by
  rw [Hodge.HodgeStructure.tensorProduct_piece, HodgeStructureOn.tensorProduct_piece_eq_iSup]

theorem HodgeStructure.mem_internalHom_F_iff {V₁ V₂ W₁ W₂ : Type*} [AddCommGroup V₁]
    [AddCommGroup V₂] [AddCommGroup W₁] [Module ℂ W₁] [AddCommGroup W₂] [Module ℂ W₂]
    {ι₁ : V₁ →ₗ[ℤ] W₁} {ι₂ : V₂ →ₗ[ℤ] W₂} {h₁ : IsBaseChange ℂ ι₁} {h₂ : IsBaseChange ℂ ι₂}
    [Module.Free ℤ V₁] [Module.Finite ℤ V₁] {n₂ : ℤ} (hs₁ : HodgeStructure h₁ n)
    (hs₂ : HodgeStructure h₂ n₂) {p : ℤ} (f : W₁ →ₗ[ℂ] W₂) :
    f ∈ (hs₁.internalHom hs₂ :
        HodgeStructure (isBaseChange_homLatticeMap h₁ h₂) (n₂ - n)).F p ↔
      ∀ q, ∀ x ∈ hs₁.F q, f x ∈ hs₂.F (p + q) := by
  rw [Hodge.HodgeStructure.internalHom_F, HodgeStructureOn.mem_internalHom_F_iff]

/-- **Effectivity is a named hypothesis.** Under it, in weight one, the `±i`-eigenspaces of the
Weil operator are exactly the `(1,0)` and `(0,1)` pieces. -/
theorem eigenspace_weilOperator_I (hs : HodgeStructureOn W ω 1) (heff : hs.IsEffective) :
    Module.End.eigenspace hs.weilOperator Complex.I = hs.piece 1 :=
  hs.eigenspace_weilOperator_I heff

theorem eigenspace_weilOperator_neg_I (hs : HodgeStructureOn W ω 1) (heff : hs.IsEffective) :
    Module.End.eigenspace hs.weilOperator (-Complex.I) = hs.piece 0 :=
  hs.eigenspace_weilOperator_neg_I heff

/-- `V_ℝ` with its structure map `v ↦ 1 ⊗ v`. -/
theorem realificationMap_apply {V : Type u} [AddCommGroup V] (x : V) :
    Hodge.realificationMap x = (1 : ℝ) ⊗ₜ[ℤ] x :=
  Hodge.realificationMap_apply x

/-- The complex structure `J` built from an odd-weight structure complexifies to its Weil operator,
so in effective weight one its `±i`-eigenspaces are the pieces above. -/
theorem latticeComplexification_latticeAlmostComplexStructure {V : Type u} {Vℂ : Type v}
    [AddCommGroup V] [AddCommGroup Vℂ] [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ} {hℂ : IsBaseChange ℂ ιℂ}
    (hs : HodgeStructure hℂ n) (hn : Odd n) :
    (hs.latticeAlmostComplexStructure hn).latticeComplexification hℂ = hs.weilOperator :=
  hs.latticeComplexification_latticeAlmostComplexStructure hn

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

/-- The comparison carries the lattice conjugation of `ℂ ⊗_ℚ grᵂ_k` to the conjugation induced on
the complex graded piece, and `gradedF` is the induced filtration transported along it. -/
theorem gradedComplexEquiv_latticeConj (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ) (k : ℤ)
    (x : ℂ ⊗[ℚ] weightGradedRat WQ k) :
    gradedComplexEquiv hℚ hℂ WQ hWQ k
        (latticeConj (isBaseChange_ratTensorMap ℂ (weightGradedRat WQ k)) x) =
      (gradedComplexConjugation hℚ hℂ WQ k).toEquiv (gradedComplexEquiv hℚ hℂ WQ hWQ k x) :=
  Hodge.gradedComplexEquiv_latticeConj hℚ hℂ WQ hWQ k x

example (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ) (F : ℤ → Submodule ℂ Vℂ) (k p : ℤ) :
    gradedF hℚ hℂ WQ hWQ F k p =
      (complexGradedF (fun k ↦ rationalToComplexSubmodule hℚ hℂ (WQ k)) F k p).comap
        (gradedComplexEquiv hℚ hℂ WQ hWQ k).toLinearMap :=
  rfl

/-- **Conjugation-equivariance of the abstract complexified map**, for every `IsBaseChange` model
and not only the concrete tensor. -/
theorem rationalMapToComplex_comp_latticeConj (f : Vℚ →ₗ[ℚ] V'ℚ) :
    (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ f).comp (latticeConj hℂ) =
      (latticeConj h'ℂ).comp (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ f) :=
  Hodge.rationalMapToComplex_comp_latticeConj hℚ hℂ h'ℚ h'ℂ f

/-- **Deligne's bigrading** is defined by Deligne's closed formula in `F`, `conj F` and `W`. -/
theorem deligneSplitting_def (mhs : MixedHodgeStructure hℚ hℂ) (p q : ℤ) :
    mhs.deligneSplitting p q =
      (mhs.F p ⊓ mhs.WC (p + q)) ⊓
        ((mhs.conjF q ⊓ mhs.WC (p + q)) ⊔
          ⨆ j : ℕ, mhs.conjF (q - (j : ℤ) - 1) ⊓ mhs.WC (p + q - (j : ℤ) - 2)) :=
  mhs.deligneSplitting_def p q

/-- The bigrading is an internal direct sum, and it recovers both the Hodge filtration and the
complexified weight filtration. -/
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

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- **The symmetry group** `Aut(V, Qint)`: the integral automorphisms preserving the form. -/
theorem mem_isometryGroup_iff (Qint : LinearMap.BilinForm ℤ V) (e : V ≃ₗ[ℤ] V) :
    e ∈ BilinForm.isometryGroup Qint ↔ ∀ x y, Qint (e x) (e y) = Qint x y :=
  BilinForm.mem_isometryGroup_iff

end L3

end TauCetiRoadmap.HodgeStructures
