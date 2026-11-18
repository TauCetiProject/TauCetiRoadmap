import Mathlib.Algebra.Module.Equiv.Basic
import Mathlib.Analysis.Complex.UnitDisc.Basic
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.FiniteCyclic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LongExactSequence
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Geometry.Manifold.Instances.Quotient
import Mathlib.Geometry.Manifold.LocalDiffeomorph
import Mathlib.RepresentationTheory.Basic
import Mathlib.Topology.Covering.Quotient

/-!
# Complex tori, varying lattices, and logarithmic transforms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations suggest Lean forms for the period action and the algebraic core
of cyclic affine quotients. The manifold, bundle, and logarithmic-transform APIs are specified in
the roadmap and consume interfaces which that roadmap asks Tau Ceti to construct.

The targets use Mathlib's orbit quotients, linear maps, ranges, and quotient modules. They do not
hide order or freeness conditions in empty proposition wrappers.
-/

namespace TauCetiRoadmap.ComplexTori

open Function CategoryTheory
open scoped ContDiff Manifold

/-! ## The period action and its family projection -/

/-- The lattice action associated to a varying period map. Its orbit quotient is used directly;
there is no separate tagged complex-torus-family carrier. -/
@[instance_reducible]
def periodAddAction {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) : AddAction Λ (Y × E) where
  vadd lam p := (p.1, p.2 + period p.1 lam)
  zero_vadd := by
    rintro ⟨y, e⟩
    change (y, e + period y 0) = (y, e)
    rw [map_zero, add_zero]
  add_vadd := by
    rintro lam mu ⟨y, e⟩
    change (y, e + period y (lam + mu)) =
      (y, e + period y mu + period y lam)
    rw [map_add]
    congr 1
    ac_rfl

/-- The orbit relation with its period action made explicit. Its quotient is still Lean's
standard `Quotient`; this definition only prevents typeclass search from guessing a period map. -/
def periodOrbitRel {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) : Setoid (Y × E) := by
  letI := periodAddAction period
  exact AddAction.orbitRel Λ (Y × E)

section PeriodFamily

variable {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
  (period : Y → (Λ →ₗ[ℤ] E))

/-- The map from the orbit quotient to the parameter space, descended from `Prod.fst`. The orbit
map `Y × E → (Y × E)/Λ` is the covering map; the map below is the family projection and will be
proved a holomorphic submersion. -/
noncomputable def torusFamilyProjection :
    Quotient (periodOrbitRel period) → Y :=
  Quotient.lift Prod.fst fun a b h ↦ by
    change ∃ lam : Λ, (b.1, b.2 + period b.1 lam) = a at h
    obtain ⟨lam, hlam⟩ := h
    exact (congrArg Prod.fst hlam).symm

@[simp]
theorem torusFamilyProjection_quotientMk (p : Y × E) :
    torusFamilyProjection period (Quotient.mk (periodOrbitRel period) p) = p.1 :=
  rfl

end PeriodFamily

/-! ## Affine equivariance for a varying torus family -/

/-- The torus over `y`, written as the additive quotient by the actual period range. -/
abbrev TorusFibre {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) (y : Y) :=
  E ⧸ LinearMap.range (period y)

/-- Transport a torus fibre along equality of base points. -/
def TorusFibre.cast {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) {y y' : Y} (h : y = y') :
    TorusFibre period y ≃+ TorusFibre period y' := by
  subst h
  exact AddEquiv.refl _

/-- The fibrewise presentation of the varying torus family.  It is canonically equivalent to the
single orbit quotient used above. -/
abbrev FibrewiseTorusFamily {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) :=
  Σ y, TorusFibre period y

/-- Descend a linear period-equivariant equivalence through the actual period submodules.
The inverse is induced by the inverse linear equivalence and the inverse group element. -/
noncomputable def linearPeriodFibreEquiv {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y]
    [AddCommGroup Λ] [AddCommGroup E] (period : Y → (Λ →ₗ[ℤ] E))
    (ρ : Representation ℤ Γ Λ) (g : Γ) (y : Y) (R : E ≃ₗ[ℤ] E)
    (_h : ∀ lam, R (period y lam) = period (g • y) (ρ g lam)) :
    TorusFibre period y ≃+ TorusFibre period (g • y) := by
  sorry

@[simp]
theorem linearPeriodFibreEquiv_mk {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y]
    [AddCommGroup Λ] [AddCommGroup E] (period : Y → (Λ →ₗ[ℤ] E))
    (ρ : Representation ℤ Γ Λ) (g : Γ) (y : Y) (R : E ≃ₗ[ℤ] E)
    (h : ∀ lam, R (period y lam) = period (g • y) (ρ g lam)) (e : E) :
    linearPeriodFibreEquiv period ρ g y R h (Submodule.Quotient.mk e) =
      Submodule.Quotient.mk (R e) := by
  sorry

/-- Algebraic affine equivariant data. The analytic constructor additionally requires
complex-linear continuous lifts varying holomorphically and a holomorphic translation section.
This record alone asserts no holomorphy.  The translation is a section of the appropriate target
fibre, not a lattice element or an assumed vector-space lift. -/
structure AffineEquivariantPeriodData {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y]
    [AddCommGroup Λ] [AddCommGroup E] (period : Y → (Λ →ₗ[ℤ] E)) where
  latticeAction : Representation ℤ Γ Λ
  linearPart : ∀ (_g : Γ) (_y : Y), E ≃ₗ[ℤ] E
  linearPart_period : ∀ (g : Γ) (y : Y) (lam : Λ),
    linearPart g y (period y lam) = period (g • y) (latticeAction g lam)
  linear_one : ∀ (y : Y) (e : E), linearPart 1 y e = e
  linear_mul : ∀ (g h : Γ) (y : Y) (e : E),
    linearPart (g * h) y e = linearPart g (h • y) (linearPart h y e)
  translation : ∀ (g : Γ) (y : Y), TorusFibre period (g • y)
  translation_one : ∀ (y : Y),
    TorusFibre.cast period (one_smul Γ y) (translation 1 y) = 0
  translation_mul : ∀ (g h : Γ) (y : Y),
    TorusFibre.cast period (mul_smul g h y) (translation (g * h) y) =
      translation g (h • y) +
      linearPeriodFibreEquiv period latticeAction g (h • y) (linearPart g (h • y))
        (linearPart_period g (h • y)) (translation h y)

/-- The fibre map is derived from the linear lift and equivariance, rather than stored. -/
noncomputable def AffineEquivariantPeriodData.fibreLinearPart
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)} (D : AffineEquivariantPeriodData (Γ := Γ) period)
    (g : Γ) (y : Y) : TorusFibre period y ≃+ TorusFibre period (g • y) :=
  linearPeriodFibreEquiv period D.latticeAction g y (D.linearPart g y) (D.linearPart_period g y)

/-- The affine map on one fibre, with linear and translation parts both visible. -/
noncomputable def AffineEquivariantPeriodData.affineFibreMap
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)}
    (D : AffineEquivariantPeriodData (Γ := Γ) period) (g : Γ) (y : Y) :
    TorusFibre period y ≃ TorusFibre period (g • y) := by
  sorry

@[simp]
theorem AffineEquivariantPeriodData.affineFibreMap_apply
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)} (D : AffineEquivariantPeriodData (Γ := Γ) period)
    (g : Γ) (y : Y) (x : TorusFibre period y) :
    D.affineFibreMap g y x = D.fibreLinearPart g y x + D.translation g y := by
  sorry

/-- The induced affine equivalence of the total fibrewise family. -/
noncomputable def AffineEquivariantPeriodData.affineFamilyLift
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)}
    (D : AffineEquivariantPeriodData (Γ := Γ) period) (g : Γ) :
    FibrewiseTorusFamily period ≃ FibrewiseTorusFamily period := by
  sorry

@[simp]
theorem AffineEquivariantPeriodData.affineFamilyLift_base
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)} (D : AffineEquivariantPeriodData (Γ := Γ) period)
    (g : Γ) (x : FibrewiseTorusFamily period) :
    (D.affineFamilyLift g x).1 = g • x.1 := by
  sorry

/-- The affine lifts obey the group law; `Equiv.trans` is written in application order. -/
theorem AffineEquivariantPeriodData.affineFamilyLift_mul
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)} (D : AffineEquivariantPeriodData (Γ := Γ) period)
    (g h : Γ) :
    D.affineFamilyLift (g * h) = (D.affineFamilyLift h).trans (D.affineFamilyLift g) := by
  sorry

/-- A nonzero translation has no fixed point.  This is the fibrewise regression behind affine
descent over a fixed base point; a purely linear action instead fixes zero. -/
theorem translationEquiv_fixedPointFree {T : Type*} [AddCommGroup T] (b : T) (hb : b ≠ 0) :
    ∀ x, x + b ≠ x := by
  intro x hx
  apply hb
  have h : x + b = x + 0 := by simpa using hx
  exact add_left_cancel h

/-! ## Dimension-correct punctured identifications -/

/-- The literal pullback total space, with the inherited subtype-of-product topology. -/
abbrev BaseChangeTotal {B B' X : Type*} (β : B' → B) (p : X → B) :=
  {q : B' × X // β q.1 = p q.2}

def baseChangeProjection {B B' X : Type*} (β : B' → B) (p : X → B) :
    BaseChangeTotal β p → B' := fun q ↦ q.1.1

/-- Pull back the installed atlas on Q along the second projection, using the local inverse
branches of β. The topology is the inherited subtype topology, never an extra input. -/
@[instance_reducible]
noncomputable def baseChangeChartedSpace {H B B' Q : Type*} [TopologicalSpace H]
    [TopologicalSpace B] [TopologicalSpace B'] [TopologicalSpace Q] [ChartedSpace H Q]
    (β : B' → B) (pQ : Q → B) (_hβ : IsLocalHomeomorph β) (_hpQ : Continuous pQ) :
    ChartedSpace H (BaseChangeTotal β pQ) := by
  sorry

/-- This local-diffeomorphism law identifies the atlas with the branch pullback of Q's atlas. -/
theorem baseChangeSecond_isLocalDiffeomorph {E H B B' Q : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E] [TopologicalSpace H]
    (I : ModelWithCorners ℂ E H) [TopologicalSpace B] [TopologicalSpace B']
    [TopologicalSpace Q] [ChartedSpace H Q] [IsManifold I ∞ Q]
    (β : B' → B) (pQ : Q → B) (hβ : IsLocalHomeomorph β) (hpQ : Continuous pQ) :
    letI := baseChangeChartedSpace (H := H) β pQ hβ hpQ
    IsLocalDiffeomorph I I ∞ (fun x : BaseChangeTotal β pQ ↦ x.1.2) := by
  sorry

/-- Covering descent recovers the upstairs family with the canonical branch-pullback atlas.
The forward formula is x ↦ (p_X x, quotientMap x), with no logarithmic gauge. -/
structure PuncturedBaseChangeIdentification {E H B B' X Q : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E] [TopologicalSpace H]
    (I : ModelWithCorners ℂ E H)
    [TopologicalSpace B] [TopologicalSpace B'] [TopologicalSpace X] [TopologicalSpace Q]
    [ChartedSpace H Q] [IsManifold I ∞ Q]
    (β : B' → B) (pQ : Q → B) (pX : X → B') (quotientMap : X → Q)
    (hβ : IsLocalHomeomorph β) (hpQ : Continuous pQ)
    [ChartedSpace H X] [IsManifold I ∞ X] where
  equivariant : ∀ x, β (pX x) = pQ (quotientMap x)
  forward : letI := baseChangeChartedSpace (H := H) β pQ hβ hpQ
    X ≃ₘ⟮I, I⟯ BaseChangeTotal β pQ
  forward_formula : ∀ x, forward x = ⟨(pX x, quotientMap x), equivariant x⟩

/-- The separate downstairs logarithmic gauge, over the original punctured base. Its
construction consumes the pure-translation hypotheses and patches local logarithm formulas. -/
structure PuncturedLogarithmicGauge {E H B Q Y : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E] [TopologicalSpace H]
    (I : ModelWithCorners ℂ E H) [TopologicalSpace Q] [TopologicalSpace Y]
    [ChartedSpace H Q] [IsManifold I ∞ Q] [ChartedSpace H Y] [IsManifold I ∞ Y]
    (pQ : Q → B) (pY : Y → B) where
  forward : Q ≃ₘ⟮I, I⟯ Y
  over_base : ∀ q, pY (forward q) = pQ q

/-- The punctured subtype of Mathlib's unit disc. -/
abbrev PuncturedUnitDisc := {z : Complex.UnitDisc // z ≠ 0}

noncomputable def puncturedPowerMap (m : ℕ) (hm : 0 < m) :
    PuncturedUnitDisc → PuncturedUnitDisc :=
  fun z ↦ ⟨Complex.UnitDisc.mk ((z.1 : ℂ) ^ m) (by
    rw [norm_pow]
    exact pow_lt_one₀ (norm_nonneg _) z.1.norm_lt_one (Nat.ne_of_gt hm)), by
      apply (Complex.UnitDisc.mk_eq_zero _).not.mpr
      exact pow_ne_zero _ (by simpa using z.2)⟩

/-- Even the identity pullback uses the full total-space model, here a disc times a torus.
This checks the topology and dimensions without making a cyclic-gauge claim. -/
noncomputable def identityPullback {E T : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace T] [ChartedSpace E T] [IsManifold 𝓘(ℂ, E) ∞ T] :
    (Complex.UnitDisc × T) ≃ₜ BaseChangeTotal id
      (Prod.fst : Complex.UnitDisc × T → Complex.UnitDisc) where
  toFun x := ⟨(x.1, x), rfl⟩
  invFun x := x.1.2
  left_inv _ := rfl
  right_inv x := by rcases x with ⟨⟨b, ⟨b', t⟩⟩, h⟩; cases h; rfl
  continuous_toFun := by fun_prop
  continuous_invFun := by fun_prop

/-! ## Fibrewise presentation comparison -/

/-- The fibrewise algebraic presentation is equivalent to the actual period orbit quotient. -/
noncomputable def fibrewiseEquivOrbit {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) :
    FibrewiseTorusFamily period ≃ Quotient (periodOrbitRel period) := by
  sorry

/-- The fibrewise presentation receives only the topology transported from the orbit quotient. -/
@[instance_reducible]
noncomputable def fibrewiseTopology {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    [TopologicalSpace Y] [TopologicalSpace E] (period : Y → (Λ →ₗ[ℤ] E)) :
    TopologicalSpace (FibrewiseTorusFamily period) :=
  TopologicalSpace.induced (fibrewiseEquivOrbit period) inferInstance

@[simp]
theorem fibrewiseEquivOrbit_base {Λ Y E : Type*} [AddCommGroup Λ] [AddCommGroup E]
    (period : Y → (Λ →ₗ[ℤ] E)) (x : FibrewiseTorusFamily period) :
    torusFamilyProjection period (fibrewiseEquivOrbit period x) = x.1 := by
  sorry

/-- Conjugate the fibrewise lift onto the standard orbit quotient, which is the analytic
family carrier. The sigma presentation supplies no independent topology or atlas. -/
noncomputable def AffineEquivariantPeriodData.affineOrbitLift
    {Γ Λ Y E : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ] [AddCommGroup E]
    {period : Y → (Λ →ₗ[ℤ] E)}
    (D : AffineEquivariantPeriodData (Γ := Γ) period) (g : Γ) :
    Quotient (periodOrbitRel period) ≃ Quotient (periodOrbitRel period) :=
  (fibrewiseEquivOrbit period).symm.trans
    ((D.affineFamilyLift g).trans (fibrewiseEquivOrbit period))

/-- Analytic descent adds complex-linear holomorphic lifts and a holomorphic torus-valued
translation section to the algebraic cocycle. The orbit projection pins the quotient atlas. -/
theorem AffineEquivariantPeriodData.affineOrbitLift_holomorphic
    {Γ Λ Y E EB H : Type*} [Group Γ] [MulAction Γ Y] [AddCommGroup Λ]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [NormedAddCommGroup EB] [NormedSpace ℂ EB]
    [TopologicalSpace H] (I : ModelWithCorners ℂ EB H)
    [TopologicalSpace Y] [ChartedSpace H Y] [IsManifold I ∞ Y]
    {period : Y → (Λ →ₗ[ℤ] E)}
    [ChartedSpace (ModelProd H E) (Quotient (periodOrbitRel period))]
    [IsManifold (I.prod 𝓘(ℂ, E)) ∞ (Quotient (periodOrbitRel period))]
    (D : AffineEquivariantPeriodData (Γ := Γ) period)
    (_hq : IsLocalDiffeomorph (I.prod 𝓘(ℂ, E)) (I.prod 𝓘(ℂ, E)) ∞
      (Quotient.mk (periodOrbitRel period)))
    (R : ∀ (_g : Γ) (_y : Y), E ≃L[ℂ] E)
    (_hR : ∀ g y, (R g y).toLinearEquiv.restrictScalars ℤ = D.linearPart g y)
    (_linear_holo : ∀ g, ContMDiff (I.prod 𝓘(ℂ, E)) (I.prod 𝓘(ℂ, E)) ∞
      (fun p : Y × E ↦ (g • p.1, R g p.1 p.2)))
    (_translation_holo : ∀ g, ContMDiff I (I.prod 𝓘(ℂ, E)) ∞
      (fun y ↦ fibrewiseEquivOrbit period ⟨g • y, D.translation g y⟩))
    (g : Γ) : ContMDiff (I.prod 𝓘(ℂ, E)) (I.prod 𝓘(ℂ, E)) ∞
      (D.affineOrbitLift g) := by
  sorry

/-- The two-torus regression uses the actual product carrier; the total complex model is
`ℂ × (E₁ × E₂)`, rather than the one-dimensional base model. -/
noncomputable def involutionModelMap {T₁ T₂ : Type*} [AddCommGroup T₁] [AddCommGroup T₂]
    (a : T₁) :
    Complex.UnitDisc × (T₁ × T₂) → Complex.UnitDisc × (T₁ × T₂) :=
  fun x ↦ (-x.1, x.2.1 + a, -x.2.2)

theorem involutionModelMap_square {T₁ T₂ : Type*} [AddCommGroup T₁] [AddCommGroup T₂]
    (a : T₁) (ha : a + a = 0) (x : Complex.UnitDisc × (T₁ × T₂)) :
    involutionModelMap a (involutionModelMap a x) = x := by
  rcases x with ⟨z, x, y⟩
  simp [involutionModelMap, add_assoc, ha]

theorem involutionModelMap_free {T₁ T₂ : Type*} [AddCommGroup T₁] [AddCommGroup T₂]
    (a : T₁) (ha : a ≠ 0) (x : Complex.UnitDisc × (T₁ × T₂)) :
    involutionModelMap a x ≠ x := by
  intro h
  exact translationEquiv_fixedPointFree a ha x.2.1 (congrArg (fun p ↦ p.2.1) h)

/-! ## Fixed tori and exact cyclic affine algebra -/

/-- A fixed torus also keeps Mathlib's orbit quotient. The action argument is the translation
action coming from a lattice inclusion in the roadmap. -/
abbrev FixedTorus (Λ E : Type*) [AddCommGroup Λ] [AddCommGroup E] [AddAction Λ E] :=
  AddAction.orbitRel.Quotient Λ E

/-! ## Analytic linear parts -/

/-- The abstract cyclic calculation below needs only an additive equivalence. The analytic
constructor instead starts from a complex-linear equivalence, whose underlying additive
equivalence is displayed here. Lattice preservation is imposed when this map descends to a fixed
torus. -/
def complexLinearPartToAddEquiv {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (A : E ≃L[ℂ] E) : E ≃+ E :=
  A.toLinearEquiv.toAddEquiv

/-- If a complex-linear equivalence preserving the period lattice descends along the quotient
map to `A_T`, then `A_T` and its inverse are holomorphic. The two displayed descent equations are
what the lattice-preservation proof supplies in the fixed-torus construction. -/
theorem descendedComplexLinearPart_biholomorphic {E T : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [AddCommGroup T] [TopologicalSpace T] [ChartedSpace E T]
    [IsManifold 𝓘(ℂ, E) ∞ T] (q : E → T)
    (_hq : IsLocalDiffeomorph 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ q) (_hq_surjective : Surjective q)
    (A_E : E ≃L[ℂ] E)
    (A_T : T ≃+ T) (_hdesc : ∀ x, q (A_E x) = A_T (q x))
    (_hdesc_symm : ∀ x, q (A_E.symm x) = A_T.symm (q x)) :
    ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ A_T ∧
      ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ A_T.symm := by
  sorry

section CyclicAffine

variable {T : Type*} [AddCommGroup T]

/-- The affine permutation of the torus with linear part `A` and translation part `t : T`. -/
def affineEquiv (A : T ≃+ T) (t : T) : T ≃ T where
  toFun x := A x + t
  invFun x := A.symm (x - t)
  left_inv x := by simp
  right_inv x := by simp

/-- The translation norm is an additive homomorphism. This is the group-valued input to `H¹`. -/
def cyclicNormHom (A : T ≃+ T) (k : ℕ) : T →+ T :=
  ∑ i ∈ Finset.range k, (i • A).toAddMonoidHom

/-- The translation accumulated by the first `k` iterates of an affine map. -/
def cyclicNorm (A : T ≃+ T) (k : ℕ) (t : T) : T :=
  cyclicNormHom A k t

/-- Every iterate is computed, rather than only the power used by one application. -/
theorem affineEquiv_iterate_apply (A : T ≃+ T) (t x : T) (k : ℕ) :
    ((affineEquiv A t : T → T)^[k]) x = (k • A) x + cyclicNorm A k t := by
  sorry

/-- Under `A ^ m = 1`, norm zero is exactly the condition that the affine map has period dividing
`m`. It does not by itself assert exact order `m`. -/
theorem affineEquiv_pow_eq_refl_iff (A : T ≃+ T) (t : T) (m : ℕ)
    (hA : (m • A) = AddEquiv.refl T) :
    (affineEquiv A t : T → T)^[m] = id ↔ cyclicNorm A m t = 0 := by
  sorry

/-- Exact order `m` additionally excludes every smaller positive period. -/
theorem affineEquiv_exactOrder_iff (A : T ≃+ T) (t : T) (m : ℕ) (_hm : 0 < m) :
    (((affineEquiv A t : T → T)^[m]) = id ∧
      ∀ k, 0 < k → k < m → ((affineEquiv A t : T → T)^[k]) ≠ id) ↔
    ((m • A) = AddEquiv.refl T ∧ cyclicNorm A m t = 0) ∧
      ∀ k, 0 < k → k < m →
        (k • A) ≠ AddEquiv.refl T ∨ cyclicNorm A k t ≠ 0 := by
  sorry

/-- Translation conjugacy changes the translation by `(1-A)b`. -/
theorem translation_conjugate_affine (A : T ≃+ T) (t b x : T) :
    affineEquiv (AddEquiv.refl T) b
        (affineEquiv A t ((affineEquiv (AddEquiv.refl T) b).symm x)) =
      affineEquiv A (t + b - A b) x := by
  sorry

/-- The linear map `1-A^k` which controls fixed points of the `k`-th affine iterate. -/
def oneSubPow (A : T ≃+ T) (k : ℕ) : T →+ T :=
  (AddEquiv.refl T).toAddMonoidHom - (k • A).toAddMonoidHom

/-- Period-two compatibility on arbitrary additive groups; no division by two is used. -/
theorem cyclicNormHom_two (A : T ≃+ T) :
    cyclicNormHom A 2 = AddMonoidHom.id T + A.toAddMonoidHom := by
  ext x
  simp [cyclicNormHom, Finset.sum_range_succ]

theorem oneSubPow_one (A : T ≃+ T) :
    oneSubPow A 1 = AddMonoidHom.id T - A.toAddMonoidHom := by
  ext x
  simp [oneSubPow]

theorem involution_norm_comp_difference (A : T ≃+ T) (hA : ∀ x, A (A x) = x) :
    (cyclicNormHom A 2).comp (oneSubPow A 1) = 0 := by
  ext x
  simp [cyclicNormHom_two, oneSubPow_one, hA, add_comm]

theorem involution_difference_comp_norm (A : T ≃+ T) (hA : ∀ x, A (A x) = x) :
    (oneSubPow A 1).comp (cyclicNormHom A 2) = 0 := by
  ext x
  simp [cyclicNormHom_two, oneSubPow_one, hA, add_comm]

/-- Both maps vanish for the identity involution on a group with 2-torsion. -/
example : cyclicNormHom (AddEquiv.refl (ZMod 2)) 2 = 0 ∧
    oneSubPow (AddEquiv.refl (ZMod 2)) 1 = 0 := by
  constructor
  · rw [cyclicNormHom_two]
    ext x
    change x + x = 0
    rw [← two_mul, show (2 : ZMod 2) = 0 by decide, zero_mul]
  · rw [oneSubPow_one]
    ext x
    change x - x = 0
    exact sub_self x

/-- The exact fixed-point criterion follows from the iterate formula. -/
theorem affineEquiv_iterate_hasFixedPoint_iff (A : T ≃+ T) (t : T) (k : ℕ) :
    (∃ x : T, ((affineEquiv A t : T → T)^[k]) x = x) ↔
      cyclicNorm A k t ∈ Set.range (oneSubPow A k) := by
  sorry

/-- A possibly nonfaithful affine `C_m`-action is free precisely when every nonidentity power
fails the fixed-point criterion. In particular, checking the generator alone is insufficient for
composite `m`. -/
theorem affineCyclic_free_iff (A : T ≃+ T) (t : T) (m : ℕ) (_hm : 0 < m)
    (_hA : (m • A) = AddEquiv.refl T) (_hNorm : cyclicNorm A m t = 0) :
    (∀ k, 0 < k → k < m → ∀ x : T, ((affineEquiv A t : T → T)^[k]) x ≠ x) ↔
      ∀ k, 0 < k → k < m → cyclicNorm A k t ∉ Set.range (oneSubPow A k) := by
  sorry

end CyclicAffine

/-! ## Mathlib cohomology and the integral connecting map -/

#check Rep.FiniteCyclicGroup.normHomCompSub
#check Rep.FiniteCyclicGroup.subCompNormHom
#check Representation.norm
#check Rep.FiniteCyclicGroup.groupCohomologyIsoOdd
#check Rep.FiniteCyclicGroup.groupCohomologyIsoEven
#check Rep.FiniteCyclicGroup.groupCohomologyπOdd_eq_iff
#check Rep.FiniteCyclicGroup.groupCohomologyπEven_eq_iff
#check groupCohomology.δ_naturality

/-- The public cohomology carriers are Mathlib's module objects. -/
noncomputable example {G : Type} [Group G] (T : Rep ℤ G) :
    AddCommGroup (groupCohomology T 1) := inferInstance

/-- The integral connecting map is literally Mathlib's connecting homomorphism. -/
noncomputable abbrev affineConnectingHom {G : Type} [Group G]
    {S : CategoryTheory.ShortComplex (Rep ℤ G)} (hS : S.ShortExact) :
    groupCohomology S.X₃ 1 ⟶ groupCohomology S.X₁ 2 :=
  groupCohomology.δ hS 1 2 rfl

/-- Vanishing of the vector-space terms makes the existing connecting map an isomorphism. -/
noncomputable def affineConnectingIso {G : Type} [Group G]
    {S : CategoryTheory.ShortComplex (Rep ℤ G)} (hS : S.ShortExact)
    (h₁ : CategoryTheory.Limits.IsZero (groupCohomology S.X₂ 1))
    (h₂ : CategoryTheory.Limits.IsZero (groupCohomology S.X₂ 2)) :
    groupCohomology S.X₃ 1 ≅ groupCohomology S.X₁ 2 := by
  letI := groupCohomology.isIso_δ_of_isZero hS 1 h₁ h₂
  exact asIso (affineConnectingHom hS)

/-- The trivial-action calculation uses Mathlib's torsion subgroup. -/
noncomputable def trivialActionHOneEquivTorsion {G T : Type} [Group G] [Fintype G]
    [AddCommGroup T] (m : ℕ) (_hm : 0 < m) (_hcard : Fintype.card G = m)
    (g : G) (_hg : ∀ x, x ∈ Subgroup.zpowers g) :
    groupCohomology (Rep.trivial ℤ G T) 1 ≃+ AddSubgroup.torsionBy T m := by
  sorry

/-! ## Total-space freeness and the multiple-fibre base map -/

/-- Freeness for the second quotient is a theorem about the total action. At a point over a base
stabilizer, the torus-level affine criterion supplies `hfibre`. -/
theorem totalAction_free_of_fibre_criterion {Γ B X : Type*} [Group Γ] [MulAction Γ B]
    [MulAction Γ X] (p : X → B) (hequiv : ∀ (g : Γ) (x : X), p (g • x) = g • p x)
    (hfibre : ∀ (g : Γ) (x : X), g • p x = p x → g • x = x → g = 1) :
    ∀ (g : Γ) (x : X), g • x = x → g = 1 := by
  intro g x hx
  exact hfibre g x (by rw [← hequiv g x, hx]) hx

end TauCetiRoadmap.ComplexTori
