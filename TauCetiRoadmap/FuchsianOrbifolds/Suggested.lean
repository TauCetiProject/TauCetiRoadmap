import TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants
import TauCeti.Analysis.Complex.RiemannSurface.Degree
import TauCeti.Analysis.Complex.RiemannSurface.Ramification
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.GroupWithZero.Units.Fintype
import Mathlib.Analysis.Complex.UpperHalfPlane.FixedPoints
import Mathlib.Analysis.Complex.UpperHalfPlane.Manifold
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Complex.UpperHalfPlane.ProperAction
import Mathlib.Geometry.Manifold.Diffeomorph
import Mathlib.Geometry.Manifold.Instances.Quotient
import Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine

/-!
# Fuchsian groups and orbifold Riemann surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin the effective projective action, the standard orbit
quotient and free locus, invariant-function descent, primitive cusp data, the compactification
carrier, and the native compact-Riemann-surface degree API.

Elliptic quotient charts and the topology and atlas on the displayed compactification carrier
remain roadmap targets. They are specified in the markdown rather than represented by empty
`Prop` wrappers.
-/

namespace TauCetiRoadmap.FuchsianOrbifolds

open MeasureTheory
open Matrix MulAction
open scoped ContDiff Manifold MatrixGroups UpperHalfPlane

private abbrev SL₂R := SL(2, ℝ)
private abbrev PSL₂R := PSL(2, ℝ)

/-! ## Effective projective action -/

/-- The Möbius action of `SL(2,R)` factors through its center. This named homomorphism is the
canonical projective action; any `MulAction` and continuous-action instances are derived from it
without exporting a competing action. -/
noncomputable def pslAction : PSL₂R →* Equiv.Perm ℍ := by
  sorry

/-- The projective action factors the native special-linear Möbius action. -/
@[simp] theorem pslAction_mk (g : SL₂R) (z : ℍ) :
    pslAction (QuotientGroup.mk g) z = g • z := by
  sorry

/-- The projective Möbius action is effective. -/
theorem pslAction_injective : Function.Injective pslAction := by
  sorry

/-- Every element of the projective group acts holomorphically on the upper half-plane. -/
theorem pslAction_mdifferentiable (g : PSL₂R) : MDiff (pslAction g : ℍ → ℍ) := by
  sorry

/-- The effective action is jointly continuous. Its construction is the restriction of Mathlib's
projective action along the canonical map `PSL(2,ℝ) → PGL(2,ℝ)`. -/
theorem continuous_pslAction : Continuous fun p : PSL₂R × ℍ ↦ pslAction p.1 p.2 := by
  sorry

/-- Restrict the one canonical action to a subgroup; a Fuchsian input is the subgroup together
with `[DiscreteTopology Γ]`, not a record duplicating either datum. -/
@[instance_reducible]
noncomputable def pslSubgroupMulAction (Γ : Subgroup PSL₂R) : MulAction Γ ℍ :=
  MulAction.compHom ℍ (pslAction.comp Γ.subtype)

@[simp] theorem pslSubgroup_smul (Γ : Subgroup PSL₂R) (g : Γ) (z : ℍ) :
    letI := pslSubgroupMulAction Γ
    g • z = pslAction g.val z := rfl

/-- The effective projective action on the ideal boundary `P¹(R) = OnePoint R`. It is obtained
from the projective action rather than by choosing matrix representatives. -/
noncomputable def pslBoundaryAction : PSL₂R →* Equiv.Perm (OnePoint ℝ) := by
  sorry

/-- The boundary action factors the native general-linear action on the projective line. -/
@[simp] theorem pslBoundaryAction_mk (g : SL₂R) (z : OnePoint ℝ) :
    pslBoundaryAction (QuotientGroup.mk g) z = Matrix.SpecialLinearGroup.toGL g • z := by
  sorry

/-- Restriction of the canonical boundary action to a projective subgroup. -/
@[instance_reducible]
noncomputable def pslBoundarySubgroupMulAction (Γ : Subgroup PSL₂R) :
    MulAction Γ (OnePoint ℝ) :=
  MulAction.compHom (OnePoint ℝ) (pslBoundaryAction.comp Γ.subtype)

@[simp] theorem pslBoundarySubgroup_smul (Γ : Subgroup PSL₂R) (g : Γ) (z : OnePoint ℝ) :
    letI := pslBoundarySubgroupMulAction Γ
    g • z = pslBoundaryAction g.val z := rfl

/-- The trivial-stabilizer locus for the effective subgroup action. -/
noncomputable def pslFreeLocus (Γ : Subgroup PSL₂R) : Set ℍ :=
  letI := pslSubgroupMulAction Γ
  {z | MulAction.stabilizer Γ z = ⊥}

/-- Discreteness of a projective subgroup supplies proper discontinuity for its effective action. -/
theorem properlyDiscontinuous_pslSubgroup (Γ : Subgroup PSL₂R) [DiscreteTopology Γ] :
    letI := pslSubgroupMulAction Γ
    ProperlyDiscontinuousSMul Γ ℍ := by
  sorry

/-- The roadmap consumes Mathlib's invariant measure rather than constructing another one. -/
example : IsLocallyFiniteMeasure (volume : Measure ℍ) := inferInstance

/-! ## Existing properly-discontinuous and free-locus anchors -/

/-- Mathlib already proves proper discontinuity for every discrete subgroup of `SL(2,R)`.
The roadmap proves the effective `PSL(2,R)` form and does not infer freeness from this result. -/
example (Γ : Subgroup SL₂R) [DiscreteTopology Γ] : ProperlyDiscontinuousSMul Γ ℍ :=
  inferInstance

/-- Proper discontinuity gives finite stabilizers, not trivial stabilizers. -/
example (Γ : Subgroup SL₂R) [DiscreteTopology Γ] (z : ℍ) :
    (MulAction.stabilizer Γ z : Set Γ).Finite :=
  ProperlyDiscontinuousSMul.finite_stabilizer z

/-- The ordinary quotient projection is a covering on exactly the trivial-stabilizer locus.
Elliptic points are handled by the separate cyclic quotient chart of the roadmap. -/
example (Γ : Subgroup SL₂R) [DiscreteTopology Γ] :
    IsCoveringMapOn (Quotient.mk <| MulAction.orbitRel Γ ℍ) <|
      (Quotient.mk <| MulAction.orbitRel Γ ℍ) ''
        {z | MulAction.stabilizer Γ z = ⊥} :=
  isCoveringMapOn_quotientMk_of_properlyDiscontinuousSMul

/-! ## Descent through the standard orbit quotient -/

private abbrev OrbitQuotient (Γ : Type*) [Group Γ] [MulAction Γ ℍ] :=
  MulAction.orbitRel.Quotient Γ ℍ

/-- An invariant function descends through `MulAction.orbitRel.Quotient`; no quotient section is
chosen. Holomorphic and meromorphic descent add the corresponding map-level hypotheses. -/
def descendInvariant {Γ Y : Type*} [Group Γ] [MulAction Γ ℍ] (f : ℍ → Y)
    (hf : ∀ (g : Γ) (z : ℍ), f (g • z) = f z) : OrbitQuotient Γ → Y :=
  Quotient.lift f fun a b hab ↦ by
    rcases hab with ⟨g, rfl⟩
    exact hf g b

@[simp]
theorem descendInvariant_quotientMk {Γ Y : Type*} [Group Γ] [MulAction Γ ℍ]
    (f : ℍ → Y) (hf : ∀ (g : Γ) (z : ℍ), f (g • z) = f z) (z : ℍ) :
    descendInvariant f hf (Quotient.mk'' z) = f z :=
  rfl

/-! ## Choice-dependent cusp data and coordinates -/

/-- Parabolicity in the effective projective group. The implementation is obtained by descending
Mathlib's matrix classification and is independent of a lift to `SL(2,R)`. -/
def IsParabolic (g : PSL₂R) : Prop :=
  ∃ lift : SL₂R,
    QuotientGroup.mk' (Subgroup.center SL₂R) lift = g ∧
      (Matrix.SpecialLinearGroup.toGL lift).IsParabolic

/-- A boundary point is a cusp when a nontrivial parabolic element of the subgroup fixes it. -/
def IsCuspPoint (Γ : Subgroup PSL₂R) (c : OnePoint ℝ) : Prop :=
  ∃ g : Γ, g ≠ 1 ∧ IsParabolic g ∧ pslBoundaryAction g c = c

/-- The full subgroup stabilizer of a boundary point. -/
noncomputable def cuspStabilizer (Γ : Subgroup PSL₂R) (c : OnePoint ℝ) : Subgroup Γ :=
  letI := pslBoundarySubgroupMulAction Γ
  MulAction.stabilizer Γ c

/-- The orbit relation on the projective boundary for the effective subgroup action. -/
noncomputable def boundaryOrbitRel (Γ : Subgroup PSL₂R) : Setoid (OnePoint ℝ) :=
  letI := pslBoundarySubgroupMulAction Γ
  MulAction.orbitRel Γ (OnePoint ℝ)

/-- Boundary orbits before restricting to parabolic fixed points. -/
abbrev BoundaryOrbit (Γ : Subgroup PSL₂R) := Quotient (boundaryOrbitRel Γ)

/-- Being a cusp is invariant under the subgroup action and therefore descends to boundary
orbits. -/
def IsCuspOrbit (Γ : Subgroup PSL₂R) (C : BoundaryOrbit Γ) : Prop :=
  ∃ c : OnePoint ℝ, IsCuspPoint Γ c ∧ Quotient.mk (boundaryOrbitRel Γ) c = C

theorem isCuspOrbit_quotientMk {Γ : Subgroup PSL₂R} (c : OnePoint ℝ) :
    IsCuspOrbit Γ (Quotient.mk (boundaryOrbitRel Γ) c) ↔ IsCuspPoint Γ c := by
  sorry

/-- The actual cusp-orbit carrier adjoined in the compactification. -/
abbrev CuspOrbit (Γ : Subgroup PSL₂R) := {C : BoundaryOrbit Γ // IsCuspOrbit Γ C}

/-- Normalized data at an actual cusp representative. The selected element generates the full
stabilizer, the scaling sends the cusp to infinity, and the generator becomes translation by the
positive width. Thus a proper power of the primitive generator cannot masquerade as cusp data. -/
structure CuspDatum (Γ : Subgroup PSL₂R) where
  cusp : OnePoint ℝ
  isCusp : IsCuspPoint Γ cusp
  scaling : PSL₂R
  scaling_cusp : pslBoundaryAction scaling cusp = OnePoint.infty
  positiveGenerator : Γ
  width : ℝ
  width_pos : 0 < width
  zpowers_generator : Subgroup.zpowers positiveGenerator = cuspStabilizer Γ cusp
  conjugates_generator : ∀ z : ℍ,
    pslAction scaling (pslAction positiveGenerator z) = width +ᵥ pslAction scaling z

/-- The cusp orbit underlying normalized cusp data. -/
noncomputable def CuspDatum.orbit {Γ : Subgroup PSL₂R} (D : CuspDatum Γ) : CuspOrbit Γ :=
  ⟨Quotient.mk (boundaryOrbitRel Γ) D.cusp,
    (isCuspOrbit_quotientMk (Γ := Γ) D.cusp).2 D.isCusp⟩

/-- Membership in the full cusp stabilizer is exactly being an integral power of the selected
positive generator. -/
theorem CuspDatum.mem_stabilizer_iff {Γ : Subgroup PSL₂R} (D : CuspDatum Γ) (g : Γ) :
    g ∈ cuspStabilizer Γ D.cusp ↔ ∃ n : ℤ, g = D.positiveGenerator ^ n := by
  sorry

/-- After scaling, the full stabilizer is exactly the translation group `width * Z`; the selected
generator corresponds to the positive translation `+width`. -/
theorem CuspDatum.conjugates_stabilizer_iff {Γ : Subgroup PSL₂R} (D : CuspDatum Γ) (g : Γ) :
    g ∈ cuspStabilizer Γ D.cusp ↔
      ∃ n : ℤ, g = D.positiveGenerator ^ n ∧ ∀ z : ℍ,
        pslAction D.scaling (pslAction g z) =
          ((n : ℝ) * D.width) +ᵥ pslAction D.scaling z := by
  sorry

/-- The q-coordinate associated to a positive cusp width `w`. -/
noncomputable def cuspCoordinate (w : ℝ) (z : ℍ) : ℂ :=
  Complex.exp (2 * (Real.pi : ℂ) * Complex.I * (z : ℂ) / w)

/-- Positive translation by the cusp width fixes the q-coordinate. -/
theorem cuspCoordinate_vadd (w : ℝ) (hw : 0 < w) (z : ℍ) :
    cuspCoordinate w (w +ᵥ z) = cuspCoordinate w z := by
  sorry

/-- A cusp coordinate takes values in the punctured plane before compactification. -/
theorem cuspCoordinate_ne_zero (w : ℝ) (z : ℍ) : cuspCoordinate w z ≠ 0 := by
  exact Complex.exp_ne_zero _

/-- The q-coordinate associated to all of the normalized cusp datum. -/
noncomputable def CuspDatum.coordinate {Γ : Subgroup PSL₂R} (D : CuspDatum Γ) (z : ℍ) : ℂ :=
  cuspCoordinate D.width (pslAction D.scaling z)

/-- The q-coordinate descends under every element of the full cusp stabilizer, not only under the
selected generator. -/
theorem CuspDatum.coordinate_eq_of_mem_stabilizer {Γ : Subgroup PSL₂R} (D : CuspDatum Γ)
    (g : Γ) (hg : g ∈ cuspStabilizer Γ D.cusp) (z : ℍ) :
    D.coordinate (pslAction g z) = D.coordinate z := by
  sorry

/-- With the same cusp representative and selected positive generator, scaling the cusp chart
by `a > 0` scales its translation width by `a`. -/
theorem CuspDatum.width_change {Γ : Subgroup PSL₂R} (D D' : CuspDatum Γ)
    (hcusp : D'.cusp = D.cusp) (hgen : D'.positiveGenerator = D.positiveGenerator)
    (a b : ℝ) (ha : 0 < a)
    (hscale : ∀ z : ℍ, (pslAction D'.scaling z : ℂ) =
      a * (pslAction D.scaling z : ℂ) + b) :
    D'.width = a * D.width := by
  sorry

/-- The width-change theorem is consumed here; the scaling relation is not assumed as data. -/
theorem CuspDatum.coordinate_change {Γ : Subgroup PSL₂R} (D D' : CuspDatum Γ)
    (hcusp : D'.cusp = D.cusp) (hgen : D'.positiveGenerator = D.positiveGenerator)
    (a b : ℝ) (ha : 0 < a)
    (hscale : ∀ z : ℍ, (pslAction D'.scaling z : ℂ) =
      a * (pslAction D.scaling z : ℂ) + b) (z : ℍ) :
    D'.coordinate z = Complex.exp (2 * Real.pi * Complex.I * b / (a * D.width)) *
      D.coordinate z := by
  have hwidth := D.width_change D' hcusp hgen a b ha hscale
  sorry

/-! ## Typed triangle parameters -/

/-- A triangle vertex is either elliptic of a stated finite order or a cusp. -/
inductive TriangleOrder where
  | elliptic (m : ℕ) (hm : 2 ≤ m)
  | cusp

/-- The reciprocal contribution to the hyperbolic triangle inequality. -/
noncomputable def TriangleOrder.reciprocal : TriangleOrder → ℝ
  | .elliptic m _ => (m : ℝ)⁻¹
  | .cusp => 0

/-! ## Elliptic local coordinate anchor -/

/-- The coordinate map for a cyclic stabilizer of order `m`. The roadmap proves that the full
local orbit map is biholomorphically conjugate to this map. -/
def cyclicQuotientCoordinate (m : ℕ) (z : ℂ) : ℂ := z ^ m

theorem cyclicQuotientCoordinate_differentiable (m : ℕ) :
    Differentiable ℂ (cyclicQuotientCoordinate m) := by
  sorry

theorem cyclicQuotientCoordinate_eq_zero {m : ℕ} (hm : 0 < m) (z : ℂ) :
    cyclicQuotientCoordinate m z = 0 ↔ z = 0 := by
  sorry

/-! ## Compactification carrier -/

/-- The effective coarse orbit relation on the upper half-plane. -/
noncomputable def coarseOrbitRel (Γ : Subgroup PSL₂R) : Setoid ℍ :=
  letI := pslSubgroupMulAction Γ
  MulAction.orbitRel Γ ℍ

/-- The coarse quotient before adjoining cusps. -/
abbrev CoarseQuotient (Γ : Subgroup PSL₂R) := Quotient (coarseOrbitRel Γ)

/-- The compactification carrier is visibly the disjoint sum of the coarse orbit quotient and one
point for each cusp orbit. Its topology glues punctured cusp neighbourhoods across these
constructors; the carrier is not an arbitrary type or a classified surface. -/
inductive CompactifiedQuotient (Γ : Subgroup PSL₂R) where
  | ofQuotient (point : CoarseQuotient Γ)
  | ofCusp (cusp : CuspOrbit Γ)

/-- The compactification carrier has exactly the promised sum construction. -/
def CompactifiedQuotient.equivSum {Γ : Subgroup PSL₂R} :
    CompactifiedQuotient Γ ≃ CoarseQuotient Γ ⊕ CuspOrbit Γ where
  toFun
    | .ofQuotient point => Sum.inl point
    | .ofCusp cusp => Sum.inr cusp
  invFun
    | Sum.inl point => .ofQuotient point
    | Sum.inr cusp => .ofCusp cusp
  left_inv point := by cases point <;> rfl
  right_inv point := by cases point <;> rfl

noncomputable instance compactifiedTopologicalSpace (Γ : Subgroup PSL₂R)
    [DiscreteTopology Γ] : TopologicalSpace (CompactifiedQuotient Γ) := by
  sorry

@[instance_reducible]
noncomputable def compactifiedChartedSpace (Γ : Subgroup PSL₂R) [DiscreteTopology Γ] :
    ChartedSpace ℂ (CompactifiedQuotient Γ) := by
  sorry

/-- Elliptic and cusp charts give the compactified carrier its Riemann-surface structure. -/
theorem compactified_isManifold (Γ : Subgroup PSL₂R) [DiscreteTopology Γ] :
    letI := compactifiedChartedSpace Γ
    IsManifold 𝓘(ℂ, ℂ) ∞ (CompactifiedQuotient Γ) := by
  sorry

/-!
The level-one application first constructs a compact Riemann surface, then descends `j`, proves
the extended map to `OnePoint ℂ` has degree one, and only then obtains a biholomorphism with the
Riemann sphere. No target here installs a sphere atlas on the quotient by assumption.
-/

end TauCetiRoadmap.FuchsianOrbifolds

/-! ## Surface Euler characteristic and branched-cover targets

The finite-map, degree, divisor-pullback and ramification carriers are consumed from the native
`TauCeti.RiemannSurface` modules imported above. The local Euler and genus names specialize the
SurfaceInvariants declarations; the genus and Riemann--Hurwitz names are re-exported below on
`TauCeti.RiemannSurface`. Generic compact-surface classification and genus belong to
SurfaceTopology Layer 8, and generic topological
Riemann--Hurwitz belongs to its Layer 5. This roadmap owns the analytic finite-map adapter and
Fuchsian applications.
-/

namespace TauCetiRoadmap.FuchsianOrbifolds

open scoped ContDiff Manifold
open TauCeti.RiemannSurface

variable {X Y : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
  [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X]
  [TopologicalSpace Y] [ChartedSpace ℂ Y] [T2Space Y] [CompactSpace Y] [ConnectedSpace Y]
  [IsManifold 𝓘(ℂ) 1 Y]

/-- SurfaceTopology Layer 8 Euler characteristic specialized to compact complex curves. -/
noncomputable abbrev surfaceEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [ChartedSpace ℂ X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    [IsManifold 𝓘(ℂ) 1 X] : ℤ :=
  TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants.surfaceEulerCharacteristic (X := X)

/-- SurfaceTopology Layer 8 genus specialized to compact complex curves. -/
noncomputable abbrev genus (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
    [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X] : ℕ :=
  TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants.genus (X := X)

theorem surfaceEulerCharacteristic_eq_two_sub_two_mul_genus :
    surfaceEulerCharacteristic X = 2 - 2 * (genus X : ℤ) :=
  TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants.surfaceEulerCharacteristic_eq_two_sub_two_mul_genus
    (X := X)

/-- Consume SurfaceTopology Layer 5 after the owned analytic `z ↦ z^e` normal-form adapter:
identify the proper off-branch covering degree and local indices with native degree and
`localMultiplicity`, and its finite branch sum with `ramificationDegree`. This is a complex-curve
adapter target; the generic lifted-cell Riemann--Hurwitz proof remains in SurfaceTopology. -/
theorem branchedCover_eulerCharacteristic (f : TauCeti.RiemannSurface.FiniteHolomorphicMap X Y) :
    surfaceEulerCharacteristic X =
      (TauCeti.RiemannSurface.degree f : ℤ) * surfaceEulerCharacteristic Y -
        (TauCeti.RiemannSurface.ramificationDegree f : ℤ) := by
  sorry

theorem riemannHurwitz (f : TauCeti.RiemannSurface.FiniteHolomorphicMap X Y) :
    2 * (genus X : ℤ) - 2 =
      (TauCeti.RiemannSurface.degree f : ℤ) * (2 * (genus Y : ℤ) - 2) +
        (TauCeti.RiemannSurface.ramificationDegree f : ℤ) := by
  have hX := surfaceEulerCharacteristic_eq_two_sub_two_mul_genus (X := X)
  have hY := surfaceEulerCharacteristic_eq_two_sub_two_mul_genus (X := Y)
  have hχ := branchedCover_eulerCharacteristic f
  rw [hX, hY] at hχ
  linarith

end TauCetiRoadmap.FuchsianOrbifolds

/-! Public complex-curve specializations consumed by downstream applications. These are re-exports
of this owner's target signatures, not new native degree/ramification implementations. -/
namespace TauCeti.RiemannSurface

open scoped ContDiff Manifold

variable {X Y : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
  [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X]
  [TopologicalSpace Y] [ChartedSpace ℂ Y] [T2Space Y] [CompactSpace Y] [ConnectedSpace Y]
  [IsManifold 𝓘(ℂ) 1 Y]

noncomputable abbrev surfaceEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [ChartedSpace ℂ X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    [IsManifold 𝓘(ℂ) 1 X] : ℤ :=
  TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants.surfaceEulerCharacteristic (X := X)

noncomputable abbrev genus (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
    [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X] : ℕ :=
  TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants.genus (X := X)

theorem riemannHurwitz (f : TauCeti.RiemannSurface.FiniteHolomorphicMap X Y) :
    2 * (genus X : ℤ) - 2 =
      (TauCeti.RiemannSurface.degree f : ℤ) * (2 * (genus Y : ℤ) - 2) +
        (TauCeti.RiemannSurface.ramificationDegree f : ℤ) :=
  TauCetiRoadmap.FuchsianOrbifolds.riemannHurwitz f

end TauCeti.RiemannSurface

/-! Public short names for the native compact-curve API and this owner's surface specializations.
The aliases use the same carriers and declarations; they add no independent degree or genus theory. -/
namespace RiemannSurface

/-- Finite formal integer sums on the native divisor carrier. -/
abbrev Divisor (X : Type*) := TauCeti.AlgebraicGeometry.WeilDivisor X

export TauCeti.RiemannSurface
  (FiniteHolomorphicMap localMultiplicity localMultiplicity_pos degree degree_eq_fiber_sum
   localMultiplicity_comp degree_comp biholomorphOfDegreeEqOne biholomorphOfDegreeEqOne_toFun
   divisorPullback surfaceEulerCharacteristic genus ramificationDegree riemannHurwitz)

export TauCetiRoadmap.FuchsianOrbifolds
  (surfaceEulerCharacteristic_eq_two_sub_two_mul_genus branchedCover_eulerCharacteristic)

namespace FiniteHolomorphicMap

export TauCeti.RiemannSurface.FiniteHolomorphicMap
  (mk toFun holomorphic nonconstant finite_fiber comp)

end FiniteHolomorphicMap

end RiemannSurface

namespace TauCetiRoadmap.FuchsianOrbifolds

def p85Scale (u : (ZMod 8)ˣ) : MulAut (Multiplicative (ZMod 8)) where
  toFun x := Multiplicative.ofAdd ((u : ZMod 8) * x.toAdd)
  invFun x := Multiplicative.ofAdd (((u⁻¹ : (ZMod 8)ˣ) : ZMod 8) * x.toAdd)
  left_inv x := by simp [← mul_assoc]
  right_inv x := by simp [← mul_assoc]
  map_mul' x y := by
    change Multiplicative.ofAdd ((u : ZMod 8) * (x.toAdd + y.toAdd)) =
      Multiplicative.ofAdd ((u : ZMod 8) * x.toAdd + (u : ZMod 8) * y.toAdd)
    rw [mul_add]

def p85ScaleHom : (ZMod 8)ˣ →* MulAut (Multiplicative (ZMod 8)) where
  toFun := p85Scale
  map_one' := by ext x; simp [p85Scale]
  map_mul' u v := by ext x; simp [p85Scale, mul_assoc]

abbrev p85AffineGroup := Multiplicative (ZMod 8) ⋊[p85ScaleHom] (ZMod 8)ˣ

instance : Fintype p85AffineGroup :=
  Fintype.ofEquiv (Multiplicative (ZMod 8) × (ZMod 8)ˣ) SemidirectProduct.equivProd.symm

def p85Unit3 : (ZMod 8)ˣ := ⟨3, 3, by decide, by decide⟩
def p85Unit5 : (ZMod 8)ˣ := ⟨5, 5, by decide, by decide⟩
def p85Unit7 : (ZMod 8)ˣ := ⟨7, 7, by decide, by decide⟩

def p85Element (u : (ZMod 8)ˣ) (a : ZMod 8) : p85AffineGroup :=
  ⟨Multiplicative.ofAdd a, u⟩

@[simp] theorem p85Element_mul (u v : (ZMod 8)ˣ) (a b : ZMod 8) :
    p85Element u a * p85Element v b = p85Element (u*v) (a+(u : ZMod 8)*b) := rfl

def p85H1Elements : Finset p85AffineGroup :=
  {p85Element 1 0, p85Element p85Unit3 0, p85Element p85Unit5 0, p85Element p85Unit7 0}
def p85H2Elements : Finset p85AffineGroup :=
  {p85Element 1 0, p85Element p85Unit3 4, p85Element p85Unit5 4, p85Element p85Unit7 0}

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
def p85H₁ : Subgroup p85AffineGroup where
  carrier := {x | x ∈ p85H1Elements}
  one_mem' := by decide
  mul_mem' := by decide
  inv_mem' := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
def p85H₂ : Subgroup p85AffineGroup where
  carrier := {x | x ∈ p85H2Elements}
  one_mem' := by decide
  mul_mem' := by decide
  inv_mem' := by decide

theorem p85_card : Fintype.card p85AffineGroup = 32 := by decide

theorem p85H₁_card : p85H1Elements.card = 4 := by decide

theorem p85H₂_card : p85H2Elements.card = 4 := by decide

instance (x : p85AffineGroup) : Decidable (x ∈ p85H₁) :=
  inferInstanceAs (Decidable (x ∈ p85H1Elements))
instance (x : p85AffineGroup) : Decidable (x ∈ p85H₂) :=
  inferInstanceAs (Decidable (x ∈ p85H2Elements))

instance : Fintype p85H₁ := Fintype.ofFinset p85H1Elements (by intro x; rfl)
instance : Fintype p85H₂ := Fintype.ofFinset p85H2Elements (by intro x; rfl)

theorem p85H₁_subgroup_card : Fintype.card p85H₁ = 4 := by decide
theorem p85H₂_subgroup_card : Fintype.card p85H₂ = 4 := by decide

/-- The number of elements of a finite subgroup in a named conjugacy class. -/
def p85ConjugacyCount (S : Finset p85AffineGroup) (q : p85AffineGroup) : ℕ :=
  (Finset.univ.filter fun x => x ∈ S ∧ ∃ g : p85AffineGroup, g*q*g⁻¹=x).card

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
/-- The two subgroups have equal intersection counts with every conjugacy class. -/
theorem p85AlmostConjugate (q : p85AffineGroup) :
    p85ConjugacyCount p85H1Elements q = p85ConjugacyCount p85H2Elements q := by
  revert q
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
/-- No inner automorphism carries the first subgroup to the second. -/
theorem p85_not_conjugate :
    ¬ ∃ g : p85AffineGroup, ∀ x : p85AffineGroup,
      x ∈ p85H₂ ↔ g⁻¹*x*g ∈ p85H₁ := by
  decide

def p85Translation : p85AffineGroup := p85Element 1 1
def p85Dilation3 : p85AffineGroup := p85Element p85Unit3 0
def p85Dilation5 : p85AffineGroup := p85Element p85Unit5 0

set_option maxRecDepth 10000 in
set_option maxHeartbeats 10000000 in
theorem p85_normalForm (x : p85AffineGroup) :
    ∃ i : Fin 8, ∃ j k : Fin 2,
      x = p85Translation^i.val * p85Dilation3^j.val * p85Dilation5^k.val := by
  revert x
  decide

/-- Translation and the two specified dilations generate the entire affine group. -/
theorem p85_generates :
    Subgroup.closure ({p85Translation,p85Dilation3,p85Dilation5} : Set p85AffineGroup) = ⊤ := by
  apply (Subgroup.eq_top_iff' _).mpr
  intro x
  obtain ⟨i,j,k,rfl⟩ := p85_normalForm x
  have ht : p85Translation ∈ Subgroup.closure
      ({p85Translation,p85Dilation3,p85Dilation5} : Set p85AffineGroup) :=
    Subgroup.subset_closure (by simp)
  have h3 : p85Dilation3 ∈ Subgroup.closure
      ({p85Translation,p85Dilation3,p85Dilation5} : Set p85AffineGroup) :=
    Subgroup.subset_closure (by simp)
  have h5 : p85Dilation5 ∈ Subgroup.closure
      ({p85Translation,p85Dilation3,p85Dilation5} : Set p85AffineGroup) :=
    Subgroup.subset_closure (by simp)
  exact mul_mem (mul_mem (pow_mem ht _) (pow_mem h3 _)) (pow_mem h5 _)


end TauCetiRoadmap.FuchsianOrbifolds
