import Mathlib.Topology.Homotopy.HomotopyGroup
import TauCeti.Analysis.Normed.Module.Complexification
import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Compact
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.Four
import TauCeti.Geometry.Lie.Subgroup.Unitary
import Mathlib.Analysis.Quaternion
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.Algebra.Algebra.Opposite
import Mathlib.AlgebraicTopology.SimplicialSet.StdSimplex
import Mathlib.AlgebraicTopology.SimplicialSet.TopAdj
import Mathlib.Topology.Category.CompactlyGenerated
import Mathlib.Topology.Homotopy.Basic
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Limits.Constructions.Over.Basic
import Mathlib.CategoryTheory.Action.Basic
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Pi.Basic
import Mathlib.CategoryTheory.Monoidal.Mod
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.DayConvolution.DayFunctor
import Mathlib.CategoryTheory.Monoidal.DayConvolution.Braided
import Mathlib.CategoryTheory.Localization.Construction
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor
import Mathlib.CategoryTheory.Shift.Basic
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.Algebra.Group.Subgroup.Basic

/-!
**This file is not the roadmap and is not exhaustive.** The definitive document is
README.md. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.
The Day smash and sphere monoid below are honest admitted construction targets:
G2 pins their actual degreewise quotients, permutation actions and structure maps.
Their native monoid/module laws are part of the types, not unconstrained Prop fields.
The final section checks stable interfaces parametrically on a preadditive category
with integer shift. It does not claim that these instances, stable equivalences,
Brown representation or spectral proofs already exist.
-/

open CategoryTheory CategoryTheory.MonoidalCategory
open scoped Simplicial

namespace TauCetiRoadmap.GeneralizedCohomology

/-- The raw mapping-path replacement has the product/subspace topology.
G2's convenient-space comparison applies k-ification afterward. -/
def MappingPathSpace {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) :=
  {p : B × C(unitInterval, K) // p.2 0 = f p.1}

instance {B K : Type*} [TopologicalSpace B] [TopologicalSpace K] (f : C(B, K)) :
    TopologicalSpace (MappingPathSpace f) :=
  inferInstanceAs (TopologicalSpace {p : B × C(unitInterval, K) // p.2 0 = f p.1})

/-- A genuine universal path-lifting condition. G2.10 proves equivalence
with homotopy lifting tested on the universal path parameter (or its ULift
into a larger universe). The forward lift works for arbitrary parameter universes. -/
def IsHurewiczFibration {E B : Type*} [TopologicalSpace E] [TopologicalSpace B]
    (p : C(E, B)) : Prop :=
  ∃ lifting : C(MappingPathSpace p, C(unitInterval, E)),
    (∀ q, lifting q 0 = q.val.1) ∧
    (∀ q t, p (lifting q t) = q.val.2 t)

/-- The universal lifting function produces actual lifts for arbitrary parameters. -/
theorem IsHurewiczFibration.lift {E B X : Type*}
    [TopologicalSpace E] [TopologicalSpace B] [TopologicalSpace X]
    (p : C(E, B)) (hp : IsHurewiczFibration p)
    (a : C(X, E)) (H : C(X × unitInterval, B))
    (h0 : ∀ x, H (x, 0) = p (a x)) :
    ∃ L : C(X × unitInterval, E),
      (∀ x, L (x, 0) = a x) ∧ (∀ x t, p (L (x, t)) = H (x, t)) := by
  obtain ⟨lifting, hstart, hproj⟩ := hp
  let q : C(X, MappingPathSpace p) :=
    { toFun x := ⟨(a x, H.curry x), h0 x⟩
      continuous_toFun := (a.continuous.prodMk H.curry.continuous).subtype_mk _ }
  refine ⟨(lifting.comp q).uncurry, ?_, ?_⟩
  · intro x
    exact hstart (q x)
  · intro x t
    exact hproj (q x) t

/-- The actual homotopy-fibre carrier over k keeps both endpoint equations. -/
def MappingPathFiber {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) (k : K) :=
  {p : B × C(unitInterval, K) // p.2 0 = f p.1 ∧ p.2 1 = k}

instance {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) (k : K) : TopologicalSpace (MappingPathFiber f k) :=
  inferInstanceAs
    (TopologicalSpace {p : B × C(unitInterval, K) // p.2 0 = f p.1 ∧ p.2 1 = k})

/-- The fixed-interval endpoint fibre is the native compact-open path space. -/
noncomputable def mappingPathFiberConstHomeomorphPath
    {K : Type*} [TopologicalSpace K] (b k : K) :
    MappingPathFiber (ContinuousMap.const PUnit b) k ≃ₜ Path b k where
  toFun p :=
    { toContinuousMap := p.val.2
      source' := p.property.1
      target' := p.property.2 }
  invFun gamma := ⟨(PUnit.unit, gamma.toContinuousMap), gamma.source', gamma.target'⟩
  left_inv p := by
    apply Subtype.ext
    apply Prod.ext
    · exact Subsingleton.elim _ _
    · rfl
  right_inv gamma := by ext t; rfl
  continuous_toFun := continuous_induced_rng.mpr
    (continuous_snd.comp continuous_subtype_val)
  continuous_invFun := (continuous_const.prodMk continuous_induced_dom).subtype_mk _

@[simp] theorem mappingPathFiberConstHomeomorphPath_apply
    {K : Type*} [TopologicalSpace K] (b k : K)
    (p : MappingPathFiber (ContinuousMap.const PUnit b) k) (t : unitInterval) :
    mappingPathFiberConstHomeomorphPath b k p t = p.val.2 t := rfl

@[simp] theorem mappingPathFiberConstHomeomorphPath_symm_apply
    {K : Type*} [TopologicalSpace K] (b k : K) (gamma : Path b k) (t : unitInterval) :
    ((mappingPathFiberConstHomeomorphPath b k).symm gamma).val.2 t = gamma t := rfl

/-- The native loop-space comparison is the same endpoint comparison at k=b. -/
noncomputable def mappingPathFiberConstHomeomorphLoopSpace
    {K : Type*} [TopologicalSpace K] (k : K) :
    MappingPathFiber (ContinuousMap.const PUnit k) k ≃ₜ LoopSpace K k :=
  mappingPathFiberConstHomeomorphPath k k

@[simp] theorem mappingPathFiberConstHomeomorphLoopSpace_apply
    {K : Type*} [TopologicalSpace K] (k : K)
    (p : MappingPathFiber (ContinuousMap.const PUnit k) k) (t : unitInterval) :
    mappingPathFiberConstHomeomorphLoopSpace k p t = p.val.2 t := rfl

@[simp] theorem mappingPathFiberConstHomeomorphLoopSpace_symm_apply
    {K : Type*} [TopologicalSpace K] (k : K) (gamma : LoopSpace K k) (t : unitInterval) :
    ((mappingPathFiberConstHomeomorphLoopSpace k).symm gamma).val.2 t = gamma t := rfl

def mappingPathProjection {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) : C(MappingPathSpace f, B) where
  toFun p := p.val.1
  continuous_toFun := continuous_fst.comp continuous_subtype_val

def mappingPathFiberProjection {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) (k : K) : C(MappingPathFiber f k, B) where
  toFun p := p.val.1
  continuous_toFun := continuous_fst.comp continuous_subtype_val

def mappingPathEndpoint {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) : C(MappingPathSpace f, K) where
  toFun p := p.val.2 1
  continuous_toFun := (continuous_eval_const (1 : unitInterval)).comp
    (continuous_snd.comp continuous_subtype_val)

def mappingPathInclusion {B K : Type*} [TopologicalSpace B] [TopologicalSpace K]
    (f : C(B, K)) : C(B, MappingPathSpace f) where
  toFun b := ⟨(b, ContinuousMap.const unitInterval (f b)), rfl⟩
  continuous_toFun := (continuous_id.prodMk
    (ContinuousMap.continuous_const'.comp f.continuous)).subtype_mk _

@[simp] theorem mappingPathProjection_comp_inclusion {B K : Type*}
    [TopologicalSpace B] [TopologicalSpace K] (f : C(B, K)) :
    (mappingPathProjection f).comp (mappingPathInclusion f) = ContinuousMap.id B := by
  ext b
  rfl

@[simp] theorem mappingPathEndpoint_comp_inclusion {B K : Type*}
    [TopologicalSpace B] [TopologicalSpace K] (f : C(B, K)) :
    (mappingPathEndpoint f).comp (mappingPathInclusion f) = f := by
  ext b
  rfl

/-- Actual lift data for a supplied stable oriented classifier.
G5.0 constructs the canonical BSpin/BSO carriers and classifies these lifts;
this generic signature keeps the projection homotopy as data. -/
structure SpinClassifierLift {X BSpin BSO : Type*}
    [TopologicalSpace X] [TopologicalSpace BSpin] [TopologicalSpace BSO]
    (projection : C(BSpin, BSO)) (classifier : C(X, BSO)) where
  lift : C(X, BSpin)
  projectionHomotopy : (projection.comp lift).Homotopy classifier

/-- The telescope multiplication comparison is fixed at the actual unit pair.
G5.0 constructs this for its unit-preserving designated maps and TopK Whitney sum. -/
structure SpinClassifierMultiplicationComparison {BSpin BSO : Type*}
    [TopologicalSpace BSpin] [TopologicalSpace BSO]
    (unitSpin : BSpin) (projection : C(BSpin, BSO))
    (spinSum : C(BSpin × BSpin, BSpin)) (orientedSum : C(BSO × BSO, BSO)) where
  comparison : ContinuousMap.HomotopyRel (projection.comp spinSum)
    (orientedSum.comp (projection.prodMap projection)) {(unitSpin, unitSpin)}

/-- A separate carrier for the Hilbert norm; native Complexification retains
its Taylor norm. The Hilbert normed/inner-product instances are G5.5 targets. -/
def RealHilbertComplexification (H : Type*) := TauCeti.Complexification H

instance {H : Type*} [AddCommGroup H] : AddCommGroup (RealHilbertComplexification H) :=
  inferInstanceAs (AddCommGroup (TauCeti.Complexification H))

instance {H : Type*} [AddCommGroup H] [Module ℝ H] :
    Module ℂ (RealHilbertComplexification H) :=
  inferInstanceAs (Module ℂ (TauCeti.Complexification H))

/-- The actual Hermitian form to be used for the Hilbert synonym. -/
noncomputable def hilbertComplexificationInner {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (z w : RealHilbertComplexification H) : ℂ :=
  let z' : TauCeti.Complexification H := z
  let w' : TauCeti.Complexification H := w
  ((inner ℝ z'.re w'.re + inner ℝ z'.im w'.im : ℝ) : ℂ) +
    Complex.I * ((inner ℝ z'.re w'.im - inner ℝ z'.im w'.re : ℝ) : ℂ)

/-- The Hilbert norm formula, not an instance on the native Taylor carrier. -/
noncomputable def hilbertComplexificationNorm {H : Type*} [NormedAddCommGroup H]
    (z : RealHilbertComplexification H) : ℝ :=
  let z' : TauCeti.Complexification H := z
  Real.sqrt (‖z'.re‖ ^ 2 + ‖z'.im‖ ^ 2)

/-- G5.5 uses this native underlying algebra for the mixed operator model.
Its operator adjoint agrees with native global Clifford star when p=0;
for p>0 the positive generators have the opposite adjoint sign. -/
abbrev RealMixedCliffordCarrier (p q : ℕ) :=
  CliffordAlgebra (TauCeti.realCliffordForm p q)

/-- Separate synonym for the operator C*-model; its norm and adjoint are
construction targets, and no native Clifford star instance is installed on it. -/
def RealMixedCliffordCStarModel (p q : ℕ) := RealMixedCliffordCarrier p q

instance (p q : ℕ) : Ring (RealMixedCliffordCStarModel p q) :=
  inferInstanceAs (Ring (RealMixedCliffordCarrier p q))

instance (p q : ℕ) : Algebra ℝ (RealMixedCliffordCStarModel p q) :=
  inferInstanceAs (Algebra ℝ (RealMixedCliffordCarrier p q))

/-- Only the underlying algebra is transported here. G5.5 constructs the
C*-adjoint β∘reverse on this separate synonym. -/
def realMixedCliffordCStarModelEquiv (p q : ℕ) :
    RealMixedCliffordCStarModel p q ≃ₐ[ℝ] RealMixedCliffordCarrier p q :=
  AlgEquiv.refl

/-- Affiliated negative-Clifford operators classify KO^(-n). -/
abbrev RealNegativeCliffordCarrier (n : ℕ) := RealMixedCliffordCarrier 0 n

/-- A right-H module is expressed using native opposite scalars. -/
abbrev RightQuaternionScalars := (Quaternion ℝ)ᵐᵒᵖ

/-- G4.0 upgrades this actual native Spin(4) group equivalence to its topology. -/
noncomputable def nativeSpinFourQuaternionHomeomorph :
    spinGroup (TauCeti.realCliffordForm 4 0) ≃ₜ
      (unitary (Quaternion ℝ) × unitary (Quaternion ℝ)) :=
  { TauCeti.realSpinFourEquivQuaternionUnitaryProd.toEquiv with
    continuous_toFun := by sorry
    continuous_invFun := by sorry }

/-- The topology target uses the given algebraic map, not an arbitrary homeomorphism. -/
theorem nativeSpinFourQuaternionHomeomorph_apply
    (s : spinGroup (TauCeti.realCliffordForm 4 0)) :
    nativeSpinFourQuaternionHomeomorph s =
      TauCeti.realSpinFourEquivQuaternionUnitaryProd s := rfl

/-- Ordered real coordinates for the calibrated vector action. -/
def spinFourVectorQuaternion (v : Fin 4 → ℝ) : Quaternion ℝ :=
  ⟨v 0, v 1, v 2, v 3⟩

noncomputable def spinFourCalibrationQuaternion : Quaternion ℝ :=
  ⟨1 / Real.sqrt 2, 0, 1 / Real.sqrt 2, 0⟩

/-- The native factors require a swap and two inner conjugations. -/
noncomputable def spinFourCalibratedPair
    (s : spinGroup (TauCeti.realCliffordForm 4 0)) : Quaternion ℝ × Quaternion ℝ :=
  let n := TauCeti.realSpinFourEquivQuaternionUnitaryProd s
  let u := spinFourCalibrationQuaternion
  (u * (n.2 : Quaternion ℝ) * star u, star u * (n.1 : Quaternion ℝ) * u)

/-- G4.0 proves this actual coordinate calibration, retaining native vector action. -/
theorem spinFourCalibratedPair_vectorAction
    (s : spinGroup (TauCeti.realCliffordForm 4 0)) (v : Fin 4 → ℝ) :
    spinFourVectorQuaternion (s • v) =
      (spinFourCalibratedPair s).1 * spinFourVectorQuaternion v *
        star (spinFourCalibratedPair s).2 := by
  sorry

/-- Compact Sp(r) uses both native unitary inverse equations over the
noncommutative quaternion ring; Matrix.unitaryGroup requires commutative scalars. -/
abbrev QuaternionFrameGroup (r : ℕ) :=
  unitary (Matrix (Fin r) (Fin r) (Quaternion ℝ))

example (r : ℕ) : Group (QuaternionFrameGroup r) := inferInstance


section QuaternionSpLieData

open Manifold
open scoped ContDiff Manifold Matrix.Norms.Operator

attribute [local instance] Matrix.linftyOpTopologicalSpace Matrix.linftyOpContinuousStar

/-- The named native closed-subgroup model; it is not an unspecified existential model. -/
noncomputable abbrev QuaternionSpLieModel (N : ℕ) :=
  LieSubalgebra.toSubmodule (TauCeti.Lie.lieSubalgebraOfSubgroup
    (I := 𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ)))
    (unitarySubgroup (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ))

/-- Native Cartan slice data, retaining the actual chart needed by the smooth-into API. -/
structure QuaternionSpSliceChartData (N : ℕ) where
  complement : Submodule ℝ
    (LeftInvariantDerivation
      𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ))
      (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ)
  chart : OpenPartialHomeomorph
    (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ
    (QuaternionSpLieModel N × complement)
  isCompl : IsCompl (QuaternionSpLieModel N) complement
  one_mem_source : (1 : (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ) ∈ chart.source
  isSliceChart : TauCeti.IsSliceChart chart
    ((Set.univ : Set (QuaternionSpLieModel N)) ×ˢ ({0} : Set complement))
    ((unitarySubgroup (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ : Subgroup _) : Set _)
  contMDiffOn_chart :
    ContMDiffOn 𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ))
      𝓘(ℝ, QuaternionSpLieModel N × complement) ∞ chart chart.source
  contMDiffOn_chart_symm :
    ContMDiffOn 𝓘(ℝ, QuaternionSpLieModel N × complement)
      𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ)) ∞ chart.symm chart.target

/-- Choosing the native complement and slice chart introduces no new mathematical axiom. -/
noncomputable def quaternionSpSliceChartData (N : ℕ) : QuaternionSpSliceChartData N := by
  let hex := TauCeti.Lie.exists_isSliceChart_of_isClosed_subgroup
    (I := 𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ)))
    (TauCeti.isClosed_unitarySubgroup_units (Matrix (Fin N) (Fin N) (Quaternion ℝ)))
  let q := Classical.choose hex
  let Φ := Classical.choose (Classical.choose_spec hex)
  have h := Classical.choose_spec (Classical.choose_spec hex)
  exact ⟨q, Φ, h.1, h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2⟩

set_option maxHeartbeats 1000000 in
/-- Actual native embedded-Lie data with its slice-chart structure pinned definitionally.
G4.0b transports this operator-topology data through Unitary.toUnits and fixed real
coordinates, exporting only the default-topology Euclidean model. -/
noncomputable def quaternionSpEmbeddedLieSubgroupData (N : ℕ) :
    TauCeti.Lie.EmbeddedLieSubgroupData
      𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ))
      (unitarySubgroup (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ)
      (QuaternionSpLieModel N) := by
  let d := quaternionSpSliceChartData N
  exact
    { chartedSpace := Subgroup.chartedSpaceOfIsSliceChart _ d.chart
        d.isSliceChart d.one_mem_source
      lieGroup := Subgroup.lieGroup_chartedSpaceOfIsSliceChart _ d.chart
        d.isSliceChart d.one_mem_source d.contMDiffOn_chart d.contMDiffOn_chart_symm
      contMDiff_subtypeVal := Subgroup.contMDiff_subtypeVal_chartedSpaceOfIsSliceChart
        _ d.chart d.isSliceChart d.one_mem_source d.contMDiffOn_chart_symm
      isDiffImmersionAt_subtypeVal := fun k =>
        Subgroup.isDiffImmersionAt_subtypeVal_chartedSpaceOfIsSliceChart
          _ d.chart d.isSliceChart d.one_mem_source d.contMDiffOn_chart
          d.contMDiffOn_chart_symm (by simp) k }

set_option maxHeartbeats 1000000 in
/-- Smooth-into checks use the same chosen data, rather than opaque existential charts. -/
theorem quaternionSp_contMDiff_iff_comp_subtypeVal (N : ℕ)
    {E₀ H₀ M : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀]
    [TopologicalSpace H₀] (J : ModelWithCorners ℝ E₀ H₀)
    [TopologicalSpace M] [ChartedSpace H₀ M]
    (f : M → unitarySubgroup (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ) :
    let _ := (quaternionSpEmbeddedLieSubgroupData N).chartedSpace
    ContMDiff J 𝓘(ℝ, QuaternionSpLieModel N) ∞ f ↔
      ContMDiff J 𝓘(ℝ, Matrix (Fin N) (Fin N) (Quaternion ℝ)) ∞
        ((fun x : unitarySubgroup (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ =>
          (x : (Matrix (Fin N) (Fin N) (Quaternion ℝ))ˣ)) ∘ f) := by
  let d := quaternionSpSliceChartData N
  exact Subgroup.contMDiff_iff_comp_subtypeVal_chartedSpaceOfIsSliceChart
    _ d.chart d.isSliceChart d.one_mem_source d.contMDiffOn_chart
    d.contMDiffOn_chart_symm f

end QuaternionSpLieData

open Manifold
open scoped ContDiff Manifold

/-- The exported Sp model has its fixed real dimension, independent of matrix norm scopes. -/
abbrev QuaternionSpEuclideanModel (N : ℕ) :=
  EuclideanSpace ℝ (Fin (N * (2 * N + 1)))

/-- Row, column, then standard (1,i,j,k) quaternion coordinates, in lexicographic order. -/
def quaternionMatrixStdRealCoordinates (N : ℕ)
    (A : Matrix (Fin N) (Fin N) (Quaternion ℝ)) :
    EuclideanSpace ℝ (Fin N × Fin N × Fin 4) :=
  WithLp.toLp 2 fun d =>
    let q := A d.1 d.2.1
    ![q.re, q.imI, q.imJ, q.imK] d.2.2

/-- G4.0b transports the actual chosen slice data to the default-topology unitary carrier,
then to the fixed diagonal/upper-entry Euclidean model. This is a construction target. -/
@[instance_reducible]
noncomputable def quaternionFrameGroupChartedSpace (N : ℕ) :
    ChartedSpace (QuaternionSpEuclideanModel N) (QuaternionFrameGroup N) := by
  sorry

/-- The consumer-facing smooth-into criterion uses only fixed real Euclidean models.
Its proof transports the actual native chosen-slice iff above; no scoped matrix norm
or unrelated charted structure occurs in the statement. -/
theorem quaternionFrameGroup_contMDiff_iff (N : ℕ)
    {E₀ H₀ M : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀]
    [TopologicalSpace H₀] (J : ModelWithCorners ℝ E₀ H₀)
    [TopologicalSpace M] [ChartedSpace H₀ M]
    (f : M → QuaternionFrameGroup N) :
    let _ := quaternionFrameGroupChartedSpace N
    ContMDiff J 𝓘(ℝ, QuaternionSpEuclideanModel N) ∞ f ↔
      ContMDiff J 𝓘(ℝ, EuclideanSpace ℝ (Fin N × Fin N × Fin 4)) ∞
        (fun x => quaternionMatrixStdRealCoordinates N (f x).val) := by
  sorry

/-- Right scalar multiplication is the native opposite-module action. -/
example (r : ℕ) : Module RightQuaternionScalars (Fin r → Quaternion ℝ) := inferInstance

/-- Complex restriction really lands in the opposite quaternion ring. -/
def complexToRightQuaternionScalars : ℂ →+* RightQuaternionScalars :=
  Quaternion.ofComplex.toRingHom.toOpposite (by
    intro z w
    show Quaternion.ofComplex z * Quaternion.ofComplex w =
      Quaternion.ofComplex w * Quaternion.ofComplex z
    rw [← map_mul, ← map_mul, mul_comm])

/-- The actual right-linear column action of a quaternionic unitary matrix. -/
def quaternionFrameAction (r : ℕ) (g : QuaternionFrameGroup r) :
    (Fin r → Quaternion ℝ) →ₗ[RightQuaternionScalars] (Fin r → Quaternion ℝ) :=
  Matrix.mulVecBilin (Quaternion ℝ) RightQuaternionScalars g.val

def quaternionHermitian (r : ℕ) (v w : Fin r → Quaternion ℝ) : Quaternion ℝ :=
  ∑ i, star (v i) * w i

theorem quaternionFrameAction_preserves (r : ℕ) (g : QuaternionFrameGroup r)
    (v w : Fin r → Quaternion ℝ) :
    quaternionHermitian r (quaternionFrameAction r g v) (quaternionFrameAction r g w) =
      quaternionHermitian r v w := by
  sorry

/-- The projective carrier is native; AT4.6 supplies its quotient topology; G4.0 adds the quaternionic charts/CW API. -/
abbrev QuaternionProjective (n : ℕ) :=
  Projectivization RightQuaternionScalars (Fin (n + 1) → Quaternion ℝ)


/-- G4.0a's finite right-plane carrier uses native submodules and right dimension.
The topology/chart/quotient comparisons are definitive README construction targets. -/
def QuaternionGrassmannian (r N : ℕ) :=
  { V : Submodule RightQuaternionScalars (Fin N → Quaternion ℝ) //
      Module.finrank RightQuaternionScalars V = r }

/-- Full-rank frames carry the ambient tuple subspace topology.
G4.0a gives their span quotient topology to the Grassmannian. -/
abbrev QuaternionFullFrame (r N : ℕ) :=
  { v : Fin r → (Fin N → Quaternion ℝ) //
      LinearIndependent RightQuaternionScalars v }

/-- The span map uses the actual native dimension theorem over a division ring. -/
noncomputable def quaternionFullFrameSpan (r N : ℕ) (v : QuaternionFullFrame r N) :
    QuaternionGrassmannian r N :=
  ⟨Submodule.span RightQuaternionScalars (Set.range v.val), by
    simpa using finrank_span_eq_card v.property⟩

/-- The Grassmannian topology is precisely the full-frame span quotient topology. -/
noncomputable instance quaternionGrassmannianTopology (r N : ℕ) :
    TopologicalSpace (QuaternionGrassmannian r N) :=
  TopologicalSpace.coinduced (quaternionFullFrameSpan r N) inferInstance

/-- This specializes AT4.6's generic nonzero-vector quotient-topology contract.
No second quaternionic projective carrier or generic projective theorem is introduced.
Delete this local specialization when AT4.6 supplies its generic quotient-topology
instance, replacing it by that instance; its coinduced-definition comparison is rfl. -/
@[instance_reducible] noncomputable def quaternionProjectiveQuotientTopology (n : ℕ) :
    TopologicalSpace (QuaternionProjective n) :=
  TopologicalSpace.coinduced
    (Projectivization.mk' RightQuaternionScalars :
      {v : Fin (n + 1) → Quaternion ℝ // v ≠ 0} → QuaternionProjective n)
    inferInstance

/-- Compare rank-one subspaces with the actual native projective carrier. -/
noncomputable def quaternionProjectiveGrassmannianEquiv (n : ℕ) :
    QuaternionProjective n ≃ QuaternionGrassmannian 1 (n + 1) :=
  Projectivization.equivSubmodule RightQuaternionScalars (Fin (n + 1) → Quaternion ℝ)


section QuaternionProjectiveComparison

attribute [local instance] quaternionProjectiveQuotientTopology

/-- The remaining comparison proves continuity of the given native equivalence. -/
noncomputable def quaternionProjectiveGrassmannianHomeomorph (n : ℕ) :
    QuaternionProjective n ≃ₜ QuaternionGrassmannian 1 (n + 1) :=
  { quaternionProjectiveGrassmannianEquiv n with
    continuous_toFun := by sorry
    continuous_invFun := by sorry }

/-- The homeomorphism is pinned to Mathlib's span equivalence. -/
theorem quaternionProjectiveGrassmannianHomeomorph_toEquiv (n : ℕ) :
    (quaternionProjectiveGrassmannianHomeomorph n).toEquiv =
      quaternionProjectiveGrassmannianEquiv n := rfl

end QuaternionProjectiveComparison

/-- Pointed simplicial sets use the native undercategory at the simplicial point. -/
def PointedSSet := Under (Δ[0] : SSet)

instance pointedSSetCategory : Category PointedSSet :=
  inferInstanceAs (Category (Under (Δ[0] : SSet)))

section EarlyRealization

universe u

variable (k : TopCat.{u} ⥤ CompactlyGenerated.{u,u})
variable (hk : CompactlyGenerated.compactlyGeneratedToTop.{u,u} ⊣ k)
variable [CategoryTheory.Limits.HasBinaryProducts CompactlyGenerated.{u,u}]

/-- The early monoidal supplier uses the actual native inclusion and its
PR284-owned compact-generation right adjoint. It depends on no EM/Brown theory. -/
noncomputable def realizationProductKelleyComparison (K L : SSet.{u}) :
    k.obj (SSet.toTop.obj (CategoryTheory.Limits.prod K L)) ≅
      CategoryTheory.Limits.prod (k.obj (SSet.toTop.obj K)) (k.obj (SSet.toTop.obj L)) := by
  have _ := hk
  sorry

end EarlyRealization

/-- The finite-bijection skeleton: objects n, morphisms Fin n ≃ Fin m. -/
def FiniteBijection := ℕ

instance : Add FiniteBijection := inferInstanceAs (Add ℕ)
instance (n : ℕ) : OfNat FiniteBijection n := inferInstanceAs (OfNat ℕ n)

instance finiteBijectionCategory : Category FiniteBijection where
  Hom n m := Fin n ≃ Fin m
  id n := Equiv.refl (Fin n)
  comp f g := f.trans g
  id_comp := by intros; ext; rfl
  comp_id := by intros; ext; rfl
  assoc := by intros; ext; rfl

/-- G2.1's actual degreewise quotient smash, with its monoidal equations. -/
noncomputable instance pointedSSetMonoidal : MonoidalCategory PointedSSet := by
  sorry

/-- A finite bijection gives the corresponding categorical isomorphism. -/
def finiteBijectionIso {n m : FiniteBijection} (e : Fin n ≃ Fin m) : n ≅ m where
  hom := e
  inv := e.symm
  hom_inv_id := by
    change e.trans e.symm = Equiv.refl (Fin n)
    simp
  inv_hom_id := by
    change e.symm.trans e = Equiv.refl (Fin m)
    simp

def finiteBlockSum {n m p q : FiniteBijection} (f : Fin n ≃ Fin m)
    (g : Fin p ≃ Fin q) : Fin (n + p) ≃ Fin (m + q) :=
  finSumFinEquiv.symm.trans ((Equiv.sumCongr f g).trans finSumFinEquiv)

/-- Actual addition/block-sum tensor data; only coherence proofs are admitted. -/
@[reducible] def finiteBijectionTensorData : MonoidalCategoryStruct FiniteBijection where
  tensorObj n m := n + m
  tensorUnit := 0
  tensorHom {_ _ _ _} f g := finiteBlockSum f g
  whiskerLeft n {_ _} f := finiteBlockSum (Equiv.refl (Fin n)) f
  whiskerRight {_ _} f n := finiteBlockSum f (Equiv.refl (Fin n))
  associator n m k := finiteBijectionIso (Equiv.cast (congrArg Fin (Nat.add_assoc n m k)))
  leftUnitor n := finiteBijectionIso (Equiv.cast (congrArg Fin (Nat.zero_add n)))
  rightUnitor n := finiteBijectionIso (Equiv.cast (congrArg Fin (Nat.add_zero n)))

noncomputable instance finiteBijectionMonoidal : MonoidalCategory FiniteBijection where
  toMonoidalCategoryStruct := finiteBijectionTensorData
  tensorHom_def := by intros; sorry
  id_tensorHom_id := by intros; sorry
  tensorHom_comp_tensorHom := by intros; sorry
  whiskerLeft_id := by intros; sorry
  id_whiskerRight := by intros; sorry
  associator_naturality := by intros; sorry
  leftUnitor_naturality := by intros; sorry
  rightUnitor_naturality := by intros; sorry
  pentagon := by intros; sorry
  triangle := by intros; sorry

/-- Block swap uses the actual finite-sum bijection. -/
noncomputable instance finiteBijectionSymmetric : SymmetricCategory FiniteBijection where
  braiding n m := by
    change n + m ≅ m + n
    exact finiteBijectionIso
      (finSumFinEquiv.symm.trans ((Equiv.sumComm _ _).trans finSumFinEquiv))
  braiding_naturality_right := by intros; sorry
  braiding_naturality_left := by intros; sorry
  hexagon_forward := by intros; sorry
  hexagon_reverse := by intros; sorry
  symmetry := by intros; sorry

/-- G2.1 constructs the degreewise smash-quotient twist, not the cartesian twist. -/
noncomputable instance pointedSSetSymmetric : SymmetricCategory PointedSSet := by
  sorry

/-- Native DayFunctor separates convolution from pointwise functor tensor. -/
abbrev SymmetricSequence := DayFunctor FiniteBijection PointedSSet

open scoped ExternalProduct

/-- The actual native left-Kan-extension existence target for convolution. -/
noncomputable instance symmetricSequenceConvolutions
    (F G : FiniteBijection ⥤ PointedSSet) :
    (tensor FiniteBijection).HasPointwiseLeftKanExtension (F ⊠ G) := by
  sorry

noncomputable instance symmetricSequenceUnitConvolution :
    (Functor.fromPUnit.{0} (𝟙_ FiniteBijection)).HasPointwiseLeftKanExtension
      (Functor.fromPUnit.{0} (𝟙_ PointedSSet)) := by
  sorry

/-- Degreewise smash preserves the colimits used by the native Day theorem. -/
noncomputable instance pointedSmashLeftPreserves (X : PointedSSet) :
    Limits.PreservesColimitsOfSize.{0,0} (tensorLeft X) := by
  sorry

noncomputable instance pointedSmashRightPreserves (X : PointedSSet) :
    Limits.PreservesColimitsOfSize.{0,0} (tensorRight X) := by
  sorry

/-- Use Mathlib's Day monoidal and lawful instances with its canonical functor ι. -/
noncomputable example : MonoidalCategory SymmetricSequence := inferInstance
noncomputable example : LawfulDayConvolutionMonoidalCategoryStruct
    FiniteBijection PointedSSet SymmetricSequence := inferInstance

/-- The action description is a proved equivalence, not a second spectrum carrier. -/
noncomputable def sequenceActionEquivalence :
    SymmetricSequence ≌ ((n : ℕ) → Action PointedSSet (Equiv.Perm (Fin n))) := by
  sorry

/-- The actual native Day braiding, read through the canonical functor. -/
noncomputable def sequenceDayBraiding (F G : SymmetricSequence) : F ⊗ G ≅ G ⊗ F := by
  letI : DayConvolution F.functor G.functor :=
    LawfulDayConvolutionMonoidalCategoryStruct.convolution
      FiniteBijection PointedSSet SymmetricSequence F G
  letI : DayConvolution G.functor F.functor :=
    LawfulDayConvolutionMonoidalCategoryStruct.convolution
      FiniteBijection PointedSSet SymmetricSequence G F
  refine
    { hom := .mk (DayConvolution.braiding F.functor G.functor).hom
      inv := .mk (DayConvolution.braiding F.functor G.functor).inv
      hom_inv_id := ?_
      inv_hom_id := ?_ }
  · sorry
  · sorry

noncomputable instance symmetricSequenceSymmetric : SymmetricCategory SymmetricSequence where
  braiding := sequenceDayBraiding
  braiding_naturality_right := by intros; sorry
  braiding_naturality_left := by intros; sorry
  hexagon_forward := by intros; sorry
  hexagon_reverse := by intros; sorry
  symmetry := by intros; sorry

/-- S_n=(Δ[1]/∂Δ[1])^∧n, with coordinate actions and block-concatenation product.
The zero term is S⁰, not the one-point zero object. -/
noncomputable def symmetricSphere : Mon SymmetricSequence := by
  sorry

/-- Coordinate permutation makes the sphere sequence commutative for Day smash. -/
noncomputable instance sphereIsComm : IsCommMonObj symmetricSphere.X := by
  sorry

/-- A spectrum is an actual native module object over the sphere monoid.
Its module laws encode unit and iterated structure-map associativity/equivariance. -/
abbrev SymmetricSpectrum := Mod SymmetricSequence symmetricSphere.X

/-- Evaluation at n, retaining the chosen simplicial basepoint. -/
def level (E : SymmetricSpectrum) (n : ℕ) : PointedSSet := E.X.functor.obj n

/-- Spectrum maps give equivariant based simplicial maps on every level. -/
def levelMap {E F : SymmetricSpectrum} (f : E ⟶ F) (n : ℕ) : level E n ⟶ level F n :=
  f.hom.natTrans.app n

@[simp] theorem levelMap_id (E : SymmetricSpectrum) (n : ℕ) :
    levelMap (𝟙 E) n = 𝟙 (level E n) := by
  rfl

@[simp] theorem levelMap_comp {E F G : SymmetricSpectrum}
    (f : E ⟶ F) (g : F ⟶ G) (n : ℕ) :
    levelMap (f ≫ g) n = levelMap f n ≫ levelMap g n := by
  rfl

/-- The finite permutation action on a spectrum level uses native automorphisms. -/
def levelPermutation (E : SymmetricSpectrum) (n : ℕ) :
    Equiv.Perm (Fin n) →* Aut (level E n) where
  toFun p := E.X.functor.mapIso (finiteBijectionIso p)
  map_one' := by
    apply Iso.ext
    exact E.X.functor.map_id n
  map_mul' p q := by
    apply Iso.ext
    exact E.X.functor.map_comp q p

/-- The raw sphere-balanced smash. G2 constructs its balanced coequalizer and
proves the closed symmetric monoidal laws before deriving it. -/
noncomputable def spectrumSmash (E F : SymmetricSpectrum) : SymmetricSpectrum := by
  sorry

/-- Free spectra are the left adjoints to evaluation; their permutation-induction
formula and structural adjunction belong to the same G2 target. -/
noncomputable def freeSpectrum (n : ℕ) (X : PointedSSet) : SymmetricSpectrum := by
  sorry

noncomputable def freeEvaluationEquiv (n : ℕ) (X : PointedSSet)
    (E : SymmetricSpectrum) :
    (freeSpectrum n X ⟶ E) ≃ (X ⟶ level E n) := by
  sorry

/-- Underlying integer-graded cofunctors; the complete theory/exactness/relative
axioms are G1 README targets, not asserted by this carrier alone. -/
abbrev IntegerGradedCofunctor (C : Type*) [Category* C] :=
  ℤ → (Cᵒᵖ ⥤ AddCommGrpCat)

section StableInterfaces

variable {C : Type*} [Category* C] [Preadditive C] [HasShift C ℤ]
variable [∀ n : ℤ, (shiftFunctor C n).Additive]

/-- π_n E uses suspension of the sphere in the source. -/
abbrev StablePi (sphere E : C) (n : ℤ) :=
  ((shiftFunctor C n).obj sphere ⟶ E)

/-- The representing cohomological shift occurs in the target. -/
abbrev SpectralCohomology (E P : C) (q : ℤ) :=
  (P ⟶ (shiftFunctor C q).obj E)

/-- Exact integer sign check, independent of connectivity or n being nonnegative. -/
noncomputable def coefficientDegreeEquiv (sphere E : C) (q : ℤ) :
    SpectralCohomology E sphere q ≃+ StablePi sphere E (-q) := by
  sorry

/-- Contravariance on spectral cohomology is precomposition. -/
def cohomologyPullback {P Q : C} (f : P ⟶ Q) (E : C) (q : ℤ) :
    SpectralCohomology E Q q →+ SpectralCohomology E P q where
  toFun x := f ≫ x
  map_zero' := by simp
  map_add' x y := by simp

variable [MonoidalCategory C]

/-- The represented homological shift is π_n of E smashed with P. -/
abbrev SpectralHomology (sphere E P : C) (n : ℤ) :=
  StablePi sphere (E ⊗ P) n

/-- The spectral cohomological grading is defined for all integer shifts. -/
noncomputable def suspensionCohomologyEquiv (E P : C) (q : ℤ) :
    SpectralCohomology E ((shiftFunctor C (1 : ℤ)).obj P) (q + 1) ≃+
      SpectralCohomology E P q := by
  sorry

/-- Once G2 supplies the shifted multiplication morphism, the external product
is the actual tensor of classes followed by that morphism. -/
def externalProductClass (E P Q : C) (p q : ℤ)
    (mul : (shiftFunctor C p).obj E ⊗ (shiftFunctor C q).obj E ⟶
      (shiftFunctor C (p + q)).obj E)
    (x : SpectralCohomology E P p) (y : SpectralCohomology E Q q) :
    SpectralCohomology E (P ⊗ Q) (p + q) := (x ⊗ₘ y) ≫ mul

/-- The stagewise restriction kernel is an actual additive subgroup, not a bare
Prop named phantom. G3 proves when this agrees with intrinsic compact-source phantoms. -/
def stagewisePhantoms (P E : C) (stage : ℕ → C)
    (inclusion : ∀ n, stage n ⟶ P) : AddSubgroup (P ⟶ E) where
  carrier := {f | ∀ n, inclusion n ≫ f = 0}
  zero_mem' := by simp
  add_mem' := by intro f g hf hg n; simp [hf n, hg n]
  neg_mem' := by intro f hf n; simp [hf n]

/-- G5's duality uses the native pairing with both actual triangle identities. -/
def finiteDualEvaluation (P DP : C) [ExactPairing P DP] : DP ⊗ P ⟶ 𝟙_ C :=
  ExactPairing.evaluation P DP

def finiteDualCoevaluation (P DP : C) [ExactPairing P DP] : 𝟙_ C ⟶ P ⊗ DP :=
  ExactPairing.coevaluation P DP

end StableInterfaces

end TauCetiRoadmap.GeneralizedCohomology
