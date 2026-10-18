import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.BigOperators.Finprod
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Localization.Basic
import Mathlib.Algebra.Homology.Homotopy
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Topology.Covering.Quotient
import Mathlib.Geometry.Manifold.LocalDiffeomorph
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz
import TauCetiRoadmap.DifferentialGeometry.Suggested

/-!
These are suggested forms, not an exhaustive checklist. README.md is the
 definitive specification. The completion has a genuine finite-sublevel support
condition; geometric forms use the shared DifferentialGeometry carrier. `sorry`
bodies denote constructions/theorems to build, not implemented mathematics.
The prototypes do not assume trajectory counts or gluing as arbitrary fields.
Native group-ring, Laurent-series, localization and chain-complex types are used.
-/

noncomputable section
open Bundle Set Filter
open CategoryTheory CategoryTheory.Limits Module
open scoped BigOperators Manifold ContDiff InnerProductSpace Topology
namespace TauCetiRoadmap.MorseNovikov

universe u v

/-- N1: coefficient support is finite below every real period cutoff. -/
structure NovikovSeries (R H : Type*) [Zero R] [AddCommGroup H] (N : H →+ ℝ) where
  coeff : H → R
  finite_below : ∀ C : ℝ, {h | coeff h ≠ 0 ∧ N h < C}.Finite

namespace NovikovSeries
variable {R H : Type*} [AddCommGroup H] {N : H →+ ℝ}

/-- The admitted ring structure. The carrier sees `R` only through `0`, so the coefficient ring
is an explicit argument: an instance binder would be introduced before the `sorry`. -/
@[instance_reducible] def commRingOf : ∀ _ : CommRing R, CommRing (NovikovSeries R H N) := by
  sorry

variable [CommRing R]
local instance : DecidableEq H := Classical.decEq H

/-- New ring structure, with coefficient equations specified below. -/
instance : CommRing (NovikovSeries R H N) := commRingOf inferInstance

@[ext] theorem ext {a b : NovikovSeries R H N} (h : ∀ g, a.coeff g = b.coeff g) : a = b := by
  cases a; cases b; congr; funext g; exact h g

theorem coeff_zero (h : H) : (0 : NovikovSeries R H N).coeff h = 0 := by sorry
theorem coeff_add (a b : NovikovSeries R H N) (h : H) :
    (a + b).coeff h = a.coeff h + b.coeff h := by sorry
theorem coeff_neg (a : NovikovSeries R H N) (h : H) :
    (-a).coeff h = -a.coeff h := by sorry

theorem convolution_finite (a b : NovikovSeries R H N) (h : H) :
    {u | a.coeff u * b.coeff (h - u) ≠ 0}.Finite := by sorry

theorem coeff_mul (a b : NovikovSeries R H N) (h : H) :
    (a * b).coeff h = ∑ᶠ u : H, a.coeff u * b.coeff (h - u) := by sorry

/-- Native finite group-ring inclusion; its coefficient formula pins it. -/
def ofGroupRing : AddMonoidAlgebra R H →+* NovikovSeries R H N := by sorry

theorem ofGroupRing_coeff (a : AddMonoidAlgebra R H) (h : H) :
    (ofGroupRing (N := N) a).coeff h = a.coeff h := by sorry

def monomial : ∀ (h : H),
    (NovikovSeries R H N)ˣ := by sorry

theorem monomial_coeff (h k : H) :
    (monomial (R := R) (N := N) h : NovikovSeries R H N).coeff k = if k = h then 1 else 0 := by sorry

theorem monomial_add (h k : H) :
    monomial (R := R) (N := N) (h + k) = monomial (R := R) (N := N) h * monomial (R := R) (N := N) k := by sorry

def cutoff : ∀ (C : ℝ),
    AddSubgroup (NovikovSeries R H N) := by sorry

theorem mem_cutoff (a : NovikovSeries R H N) (C : ℝ) :
    a ∈ cutoff C ↔ ∀ h, N h < C → a.coeff h = 0 := by sorry

/-- The geometric series `Σ (k ≥ 0) e^(k h)`; only its support bound is admitted. -/
def geometricInverse (h : H) (hh : 0 < N h) : NovikovSeries R H N where
  coeff := (Set.range fun k : ℕ ↦ k • h).indicator 1
  finite_below := by sorry

theorem one_sub_monomial_mul_geometricInverse (h : H) (hh : 0 < N h) :
    (1 - (monomial (R := R) (N := N) h : NovikovSeries R H N)) * geometricInverse h hh = 1 := by sorry

abbrev integerPeriod : ℤ →+ ℝ := Int.castAddHom ℝ

def laurentEquiv : NovikovSeries R ℤ integerPeriod ≃+* LaurentSeries R := by sorry

theorem laurentEquiv_coeff (a : NovikovSeries R ℤ integerPeriod) (k : ℤ) :
    (laurentEquiv a).coeff k = a.coeff k := by sorry

/-- N4: the native total quotient construction, including rings with zero divisors. -/
abbrev TotalQuotient := Localization (nonZeroDivisors (NovikovSeries R H N))

/-- Signs and deck changes act on all total-quotient elements, including zero. -/
def torsionRel (x y : TotalQuotient (R := R) (H := H) (N := N)) : Prop :=
  ∃ h : H, ∃ s : ℤ, (s = 1 ∨ s = -1) ∧
    y = (s : TotalQuotient (R := R) (H := H) (N := N)) *
      algebraMap (NovikovSeries R H N) _ (monomial (R := R) (N := N) h : NovikovSeries R H N) * x

def torsionSetoid : Setoid (TotalQuotient (R := R) (H := H) (N := N)) := by sorry

theorem torsionSetoid_rel (x y : TotalQuotient (R := R) (H := H) (N := N)) :
    torsionSetoid.r x y ↔ torsionRel x y := by sorry

abbrev TorsionValue := Quotient (torsionSetoid (R := R) (H := H) (N := N))

/-! `negRing` is `ℤ` with the ring structure transported along `x ↦ -x`. Its zero is `0`, so its
series carrier is the ordinary one, but its unit is `-1`, so its monomials and geometric series
have coefficients `-1` where the ordinary ones have `1`. Identifying the two by unfolding would let
`monomial_coeff` prove `False`. -/

private abbrev negRing : CommRing ℤ := (Equiv.neg ℤ).commRing

private def MonomialsAgree : Prop :=
  (monomial (R := ℤ) (N := integerPeriod) 0).val.coeff =
    (letI := negRing; monomial (R := ℤ) (N := integerPeriod) 0).val.coeff

private def GeometricInversesAgree : Prop :=
  (geometricInverse (R := ℤ) (N := integerPeriod) 1 (by simp)).coeff =
    (letI := negRing; geometricInverse (R := ℤ) (N := integerPeriod) 1 (by simp)).coeff

example : True := by
  fail_if_success have : MonomialsAgree := rfl
  trivial

example : True := by
  fail_if_success have : GeometricInversesAgree := rfl
  trivial
end NovikovSeries

/-- N4 determinant convention: a degree-1 to degree-0 differential a has torsion a⁻¹. -/
def twoTermTorsion {F : Type*} [Field F] (a : F) : F := a⁻¹

theorem twoTermTorsion_mul {F : Type*} [Field F] (a : F) (ha : a ≠ 0) :
    twoTermTorsion a * a = 1 := by simp [twoTermTorsion, ha]

/-- Bounded native chain complex with finite ordered bases in each degree. -/
structure BasedFiniteComplex (F : Type u) [Field F] where
  complex : ChainComplex (ModuleCat.{u} F) ℤ
  dimension : ℤ → ℕ
  basis : ∀ i, Basis (Fin (dimension i)) F (complex.X i)
  finite_degrees : {i | dimension i ≠ 0}.Finite

def basedDifferentialMatrix {F : Type*} [Field F] (C : BasedFiniteComplex F)
    (i j : ℤ) : Matrix (Fin (C.dimension j)) (Fin (C.dimension i)) F :=
  fun r c ↦ (C.basis j).repr (C.complex.d i j (C.basis i c)) r

/-- N4's based determinant-line/minor torsion, zero on nonacyclic complexes. -/
def basedTorsion {F : Type*} [Field F] : ∀ (C : BasedFiniteComplex F),
    F := by sorry

theorem basedTorsion_eq_zero_iff {F : Type*} [Field F] (C : BasedFiniteComplex F) :
    basedTorsion C = 0 ↔ ∃ i, ¬IsZero (C.complex.homology i) := by sorry

/-- The native two-term chain complex; its basis and matrix are fixed below. -/
def twoTermChainComplex {F : Type u} [Field F] : ∀ (a : F),
    ChainComplex (ModuleCat.{u} F) ℤ := by sorry

def twoTermBasedComplex {F : Type*} [Field F] (a : F) : BasedFiniteComplex F where
  complex := twoTermChainComplex a
  dimension i := if i = 0 ∨ i = 1 then 1 else 0
  basis := by sorry
  finite_degrees := by
    apply ((Set.finite_singleton (1 : ℤ)).insert 0).subset
    intro i hi
    simp only [Set.mem_setOf_eq, ne_eq, ite_eq_right_iff, one_ne_zero,
      imp_false, not_not] at hi
    simpa only [Set.mem_insert_iff, Set.mem_singleton_iff] using hi

theorem twoTermBasedComplex_matrix {F : Type*} [Field F] (a : F) :
    basedDifferentialMatrix (twoTermBasedComplex a) 1 0
      ⟨0, by simp [twoTermBasedComplex]⟩ ⟨0, by simp [twoTermBasedComplex]⟩ = a := by sorry

/-- The scalar convention now characterizes the torsion of an actual based complex. -/
theorem basedTorsion_twoTerm {F : Type*} [Field F] (a : F) :
    basedTorsion (twoTermBasedComplex a) = twoTermTorsion a := by sorry

/-- N5 algebraic return-map test: every iterate is nondegenerate. -/
def AllIteratesNondegenerate {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  ∀ k : ℕ, 0 < k → Matrix.det (1 - A ^ k) ≠ 0

def returnSign {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) (k : ℕ) : ℤ :=
  if 0 < Matrix.det (1 - A ^ k) then 1 else
    if Matrix.det (1 - A ^ k) = 0 then 0 else -1

section Geometry
open TauCetiRoadmap.DifferentialGeometry
variable {E B M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace B]
  (I : ModelWithCorners ℝ E B) [TopologicalSpace M] [ChartedSpace B M]
  [IsManifold I ∞ M] [I.Boundaryless] [T2Space M]

/-- N2: closedness is an equation on the common smooth-form carrier. -/
abbrev ClosedOneForm : Type _ := ↥(closedForms I M 1)

def criticalSet (α : ClosedOneForm I (M := M)) : Set M :=
  {x | ∀ v : TangentSpace I x, (α.1 : RoughForm I M ℝ 1) x ![v] = 0}

/-- N2 local potentials and native nondegenerate critical points. -/
def IsMorseForm (α : ClosedOneForm I (M := M)) : Prop :=
  ∀ x ∈ criticalSet I α, ∃ f : M → ℝ, ∃ U : Set M,
    IsOpen U ∧ x ∈ U ∧ ContMDiffOn I 𝓘(ℝ) ∞ f U ∧
      (∀ y ∈ U, ∀ v : TangentSpace I y,
        (α.1 : RoughForm I M ℝ 1) y ![v] = mfderiv I 𝓘(ℝ) f y v) ∧
      TauCeti.IsManifoldNondegenerateCriticalPoint I f x

theorem criticalSet_finite [CompactSpace M] (α : ClosedOneForm I (M := M))
    (hα : IsMorseForm I α) : (criticalSet I α).Finite := by sorry

/-- Rank-one alternating forms compared with the actual continuous dual. -/
def covector : ∀ (α : ClosedOneForm I (M := M)) (x : M),
    TangentSpace I x →L[ℝ] ℝ := by sorry

theorem covector_apply (α : ClosedOneForm I (M := M)) (x : M) (v : TangentSpace I x) :
    covector I α x v = (α.1 : RoughForm I M ℝ 1) x ![v] := by sorry

variable [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

def dualField (α : ClosedOneForm I (M := M)) (x : M) : TangentSpace I x :=
  Riemannian.Tensor.rieszDual (I := I) x (covector I α x)

theorem inner_dualField (α : ClosedOneForm I (M := M)) (x : M) (v : TangentSpace I x) :
    ⟪dualField I α x, v⟫_ℝ = covector I α x v :=
  Riemannian.Tensor.inner_rieszDual _ _

variable [CompactSpace M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

/-- Smoothness of the metric dual on the native tangent bundle. -/
theorem dualField_contMDiff (α : ClosedOneForm I (M := M)) :
    ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, dualField I α x⟩ : TangentBundle I M)) := by
  sorry

theorem negativeDualField_contMDiff (α : ClosedOneForm I (M := M)) :
    ContMDiff I I.tangent 1 (fun x ↦ (⟨x, -dualField I α x⟩ : TangentBundle I M)) := by
  sorry

/-- The existing complete-flow constructor, with the actual negative dual field. -/
def negativeDualFlow (α : ClosedOneForm I (M := M)) : Flow ℝ M :=
  toFlow (negativeDualField_contMDiff I α)
    (isCompleteVectorField_of_compactSpace (negativeDualField_contMDiff I α))

theorem negativeDualFlow_apply (α : ClosedOneForm I (M := M)) (t : ℝ) (x : M) :
    negativeDualFlow I α t x = flowOf (fun y ↦ -dualField I α y) t x :=
  toFlow_apply _ _ t x

def stableSet (α : ClosedOneForm I (M := M)) (p : M) : Set M :=
  {x | Tendsto (fun t : ℝ ↦ negativeDualFlow I α t x) atTop (nhds p)}

def unstableSet (α : ClosedOneForm I (M := M)) (p : M) : Set M :=
  {x | Tendsto (fun t : ℝ ↦ negativeDualFlow I α t x) atBot (nhds p)}

/-- Curve-generated tangent; N2 proves its agreement with submanifold tangents. -/
def setTangent (s : Set M) (x : M) : Submodule ℝ (TangentSpace I x) :=
  Submodule.span ℝ {v | ∃ c : ℝ → M, ∃ h : c 0 = x,
    ContMDiff 𝓘(ℝ) I 1 c ∧ Set.range c ⊆ s ∧
      v = h ▸ mfderiv 𝓘(ℝ) I c 0 (1 : ℝ)}

def IsMorseSmale (α : ClosedOneForm I (M := M)) : Prop :=
  IsMorseForm I α ∧ ∀ p ∈ criticalSet I α, ∀ q ∈ criticalSet I α,
    ∀ x ∈ unstableSet I α p ∩ stableSet I α q,
      setTangent I (unstableSet I α p) x ⊔ setTangent I (stableSet I α q) x = ⊤

variable (H : Type*) [AddCommGroup H]

def criticalIndex : ∀ (α : ClosedOneForm I (M := M)) (x : M),
    ℕ := by sorry

theorem criticalIndex_eq_local (α : ClosedOneForm I (M := M)) (x : M)
    (f : M → ℝ) (hf : ContMDiffAt I 𝓘(ℝ) 2 f x) (hpot : ∀ᶠ y in nhds x, ∀ v : TangentSpace I y,
      (α.1 : RoughForm I M ℝ 1) y ![v] = mfderiv I 𝓘(ℝ) f y v)
    (hx : x ∈ criticalSet I α) :
    criticalIndex I α x = TauCeti.manifoldMorseIndex I f x := by sorry

/-- N3 basis carrier after choosing one lift of each critical point. -/
def criticalGenerators (α : ClosedOneForm I (M := M)) (i : ℤ) : Type _ :=
  {x : M // x ∈ criticalSet I α ∧ (criticalIndex I α x : ℤ) = i}

variable (N : H →+ ℝ) (Xtilde : Type*) [TopologicalSpace Xtilde]
  [ChartedSpace B Xtilde] [IsManifold I ∞ Xtilde] [PreconnectedSpace Xtilde]

variable [AddAction H Xtilde]

/-- N2 a genuine regular smooth cover with an exact lifted potential and period law. -/
structure PeriodCover (α : ClosedOneForm I (M := M)) where
  projection : Xtilde → M
  quotient_covering : IsAddQuotientCoveringMap projection H
  local_diffeomorph : IsLocalDiffeomorph I I ∞ projection
  smooth_deck : ∀ h : H, ContMDiff I I ∞ (fun x : Xtilde ↦ h +ᵥ x)
  potential : Xtilde → ℝ
  smooth_potential : ContMDiff I 𝓘(ℝ) ∞ potential
  dpotential : ∀ x v, mfderiv I 𝓘(ℝ) potential x v =
    (α.1 : RoughForm I M ℝ 1) (projection x) ![mfderiv I I projection x v]
  potential_deck : ∀ h x, potential (h +ᵥ x) = potential x - N h

/-- Chosen critical lifts and actual descending tangent orientations. -/
structure CriticalLiftData (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) where
  lift : M → Xtilde
  projection_lift : ∀ p ∈ criticalSet I α, C.projection (lift p) = p
  orientation : ∀ p ∈ criticalSet I α,
    Orientation ℝ (setTangent I (unstableSet I α p) p) (Fin (criticalIndex I α p))

/-- Reverse one chosen descending orientation, retaining every critical lift. -/
def CriticalLiftData.flipOrientation (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p : M) : CriticalLiftData I H N Xtilde α C := by
  classical
  exact { L with orientation := fun x hx ↦
    if x = p then -(L.orientation x hx) else L.orientation x hx }

/-- Actual lifted negative-flow trajectories, before dividing by real translation.
The endpoint is h +ᵥ lift q, fixing the coefficient direction. -/
structure LiftedTrajectory (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p q : M) (h : H) where
  curve : ℝ → Xtilde
  smooth : ContMDiff 𝓘(ℝ) I ∞ curve
  follows_flow : ∀ t s, C.projection (curve (t + s)) =
    negativeDualFlow I α t (C.projection (curve s))
  from_lift : Tendsto curve atBot (nhds (L.lift p))
  to_lift : Tendsto curve atTop (nhds (h +ᵥ L.lift q))
  nonconstant : ¬ ∃ x, ∀ t, curve t = x

def trajectoryTranslationSetoid (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p q : M) (h : H) : Setoid (LiftedTrajectory I H N Xtilde α C L p q h) where
  r a b := ∃ s : ℝ, ∀ t, a.curve t = b.curve (t + s)
  iseqv := by sorry

abbrev TrajectoryOrbit (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p q : M) (h : H) :=
  Quotient (trajectoryTranslationSetoid I H N Xtilde α C L p q h)

/-- Orientation changes retain the actual curve and both lifted endpoints. -/
def trajectoryOrbitFlipOrientation (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p q z : M) (h : H) :
    TrajectoryOrbit I H N Xtilde α C L p q h →
      TrajectoryOrbit I H N Xtilde α C (L.flipOrientation I H N Xtilde α C z) p q h :=
  Quotient.map (fun γ ↦
    { curve := γ.curve
      smooth := γ.smooth
      follows_flow := γ.follows_flow
      from_lift := γ.from_lift
      to_lift := γ.to_lift
      nonconstant := γ.nonconstant }) (by
      intro a b hab
      exact hab)

/-- N2 constructs the determinant-line sign from L's descending orientations,
with the negative-flow direction separated as prescribed in the README. -/
def trajectorySign : ∀ (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (p q : M) (h : H) (γ : TrajectoryOrbit I H N Xtilde α C L p q h),
    ℤ := by sorry

theorem trajectorySign_unit (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (i : ℤ) (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1))
    (h : H) (γ : TrajectoryOrbit I H N Xtilde α C L p.1 q.1 h) :
    trajectorySign I H N Xtilde α hα C L p.1 q.1 h γ = 1 ∨
      trajectorySign I H N Xtilde α hα C L p.1 q.1 h γ = -1 := by sorry

theorem trajectorySign_flip_source (α : ClosedOneForm I (M := M))
    (hα : IsMorseSmale I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (i : ℤ)
    (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H)
    (γ : TrajectoryOrbit I H N Xtilde α C L p.1 q.1 h) :
    trajectorySign I H N Xtilde α hα C (L.flipOrientation I H N Xtilde α C p.1)
      p.1 q.1 h (trajectoryOrbitFlipOrientation I H N Xtilde α C L p.1 q.1 p.1 h γ) =
      -trajectorySign I H N Xtilde α hα C L p.1 q.1 h γ := by sorry

theorem trajectorySign_flip_target (α : ClosedOneForm I (M := M))
    (hα : IsMorseSmale I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (i : ℤ)
    (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H)
    (γ : TrajectoryOrbit I H N Xtilde α C L p.1 q.1 h) :
    trajectorySign I H N Xtilde α hα C (L.flipOrientation I H N Xtilde α C q.1)
      p.1 q.1 h (trajectoryOrbitFlipOrientation I H N Xtilde α C L p.1 q.1 q.1 h γ) =
      -trajectorySign I H N Xtilde α hα C L p.1 q.1 h γ := by sorry

theorem trajectoryOrbit_finite (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (i : ℤ) (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H) :
    Finite (TrajectoryOrbit I H N Xtilde α C L p.1 q.1 h) := by sorry

/-- Actual finite sum over all translation classes; not an arbitrary coefficient field. -/
def signedCount (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C)
    (i : ℤ) (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H) : ℤ := by
  classical
  letI := trajectoryOrbit_finite I H N Xtilde α hα C L i p q h
  letI := Fintype.ofFinite (TrajectoryOrbit I H N Xtilde α C L p.1 q.1 h)
  exact ∑ γ, trajectorySign I H N Xtilde α hα C L p.1 q.1 h γ

theorem signedCount_nonzero_trajectory (α : ClosedOneForm I (M := M))
    (hα : IsMorseSmale I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (i : ℤ)
    (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H)
    (hne : signedCount I H N Xtilde α hα C L i p q h ≠ 0) :
    Nonempty (LiftedTrajectory I H N Xtilde α C L p.1 q.1 h) := by sorry

def novikovComplex : ∀ (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C),
    ChainComplex (ModuleCat (NovikovSeries ℤ H N)) ℤ := by sorry

def novikovComplexBasis : ∀ (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C) (i : ℤ),
    (novikovComplex I H N Xtilde α hα C L).X i ≅
      ModuleCat.of (NovikovSeries ℤ H N)
        (criticalGenerators I α i →₀ NovikovSeries ℤ H N) := by sorry

theorem signedCount_finite_below (α : ClosedOneForm I (M := M))
    (hα : IsMorseSmale I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (i : ℤ)
    (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (cut : ℝ) :
    {h | signedCount I H N Xtilde α hα C L i p q h ≠ 0 ∧ N h < cut}.Finite := by sorry

/-- Every differential coefficient is the prescribed oriented trajectory sum. -/
theorem novikovComplex_d_coefficient (α : ClosedOneForm I (M := M))
    (hα : IsMorseSmale I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (i : ℤ)
    (p : criticalGenerators I α i) (q : criticalGenerators I α (i - 1)) (h : H) :
    (((novikovComplexBasis I H N Xtilde α hα C L (i - 1)).hom
      ((novikovComplex I H N Xtilde α hα C L).d i (i - 1)
        ((novikovComplexBasis I H N Xtilde α hα C L i).inv (Finsupp.single p 1)))) q).coeff h =
      signedCount I H N Xtilde α hα C L i p q h := by sorry

/-- N5 based periodic point with its real return time; iterates are included. -/
structure FlowPeriodicPoint (α : ClosedOneForm I (M := M)) where
  point : M
  time : ℝ
  positive_time : 0 < time
  fixed : negativeDualFlow I α time point = point
  nonstationary : dualField I α point ≠ 0

abbrev normalSpace (α : ClosedOneForm I (M := M)) (x : M) : Type _ :=
  TangentSpace I x ⧸ Submodule.span ℝ {dualField I α x}

/-- The derivative of the flow descends to the normal-space quotient. -/
def normalReturn : ∀ (α : ClosedOneForm I (M := M)) (o : FlowPeriodicPoint I α),
    normalSpace I α o.point →ₗ[ℝ] normalSpace I α o.point := by sorry

theorem normalReturn_mk (α : ClosedOneForm I (M := M)) (o : FlowPeriodicPoint I α)
    (v : TangentSpace I o.point) :
    normalReturn I α o (Submodule.Quotient.mk v) =
      Submodule.Quotient.mk
        (o.fixed ▸ mfderiv I I (negativeDualFlow I α o.time) o.point v) := by sorry

def AllPeriodicNondegenerate (α : ClosedOneForm I (M := M)) : Prop :=
  ∀ o : FlowPeriodicPoint I α, (LinearMap.id - normalReturn I α o).det ≠ 0

/-- N5 integral zeta after proving the rational exp/product identity. -/
def dynamicalZeta : ∀ (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (ho : AllPeriodicNondegenerate I α) (C : PeriodCover I H N Xtilde α),
    NovikovSeries ℤ H N := by sorry

/-- N4–N6: based torsion before quotienting by sign and coherent deck lifts. -/
def novikovTorsion : ∀ (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (C : PeriodCover I H N Xtilde α) (L : CriticalLiftData I H N Xtilde α C),
    NovikovSeries.TotalQuotient (R := ℤ) (H := H) (N := N) := by sorry

def completedCellularTorsion : ∀ (α : ClosedOneForm I (M := M))
    (C : PeriodCover I H N Xtilde α),
    NovikovSeries.TorsionValue (R := ℤ) (H := H) (N := N) := by sorry

/-- Alternating critical count; N3 identifies this with the topological Euler characteristic. -/
def criticalEuler (α : ClosedOneForm I (M := M)) : ℤ :=
  ∑ i ∈ Finset.range (Module.finrank ℝ E + 1),
    (-1 : ℤ) ^ i * ({x : M | x ∈ criticalSet I α ∧ criticalIndex I α x = i}.ncard : ℤ)

/-- N6 main theorem for arbitrary real periods and finitely generated abelian deck groups. -/
theorem dynamical_torsion_eq_cellular [Module.Finite ℤ H]
    (α : ClosedOneForm I (M := M)) (hα : IsMorseSmale I α)
    (ho : AllPeriodicNondegenerate I α) (C : PeriodCover I H N Xtilde α)
    (L : CriticalLiftData I H N Xtilde α C) (hχ : criticalEuler I α = 0) :
    Quotient.mk (NovikovSeries.torsionSetoid (R := ℤ) (H := H) (N := N))
      (novikovTorsion I H N Xtilde α hα C L *
        algebraMap (NovikovSeries ℤ H N) _ (dynamicalZeta I H N Xtilde α hα ho C)) =
      completedCellularTorsion I H N Xtilde α C := by sorry

end Geometry

/-- N7 Euler chains are actual 1-chains with a prescribed signed zero boundary. -/
structure EulerChain (C : ChainComplex (ModuleCat ℤ) ℤ) (z : C.X 0) where
  chain : C.X 1
  boundary : C.d 1 0 chain = z

def EulerChain.Rel {C : ChainComplex (ModuleCat ℤ) ℤ} {z : C.X 0}
    (a b : EulerChain C z) : Prop :=
  ∃ S : C.X 2, C.d 2 1 S = a.chain - b.chain

end TauCetiRoadmap.MorseNovikov
