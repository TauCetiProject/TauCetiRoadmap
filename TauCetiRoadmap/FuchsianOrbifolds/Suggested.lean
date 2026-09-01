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
carrier, and the compact-Riemann-surface degree API owned by this roadmap.

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
noncomputable def pslSubgroupMulAction (Γ : Subgroup PSL₂R) : MulAction Γ ℍ := by
  sorry

/-- The effective projective action on the ideal boundary `P¹(R) = OnePoint R`. It is obtained
from the projective action rather than by choosing matrix representatives. -/
noncomputable def pslBoundaryAction : PSL₂R →* Equiv.Perm (OnePoint ℝ) := by
  sorry

/-- Restriction of the canonical boundary action to a projective subgroup. -/
@[instance_reducible]
noncomputable def pslBoundarySubgroupMulAction (Γ : Subgroup PSL₂R) :
    MulAction Γ (OnePoint ℝ) := by
  sorry

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

/-- Under `σ' = aσ+b`, width scales by `a` and q-coordinates differ by the displayed nonzero
constant. This is the transition map used to prove independence of compactification. -/
theorem CuspDatum.coordinate_change {Γ : Subgroup PSL₂R} (D D' : CuspDatum Γ)
    (a b : ℝ) (ha : 0 < a) (hwidth : D'.width = a * D.width)
    (hscale : ∀ z : ℍ, (pslAction D'.scaling z : ℂ) =
      a * (pslAction D.scaling z : ℂ) + b) (z : ℍ) :
    D'.coordinate z = Complex.exp (2 * Real.pi * Complex.I * b / (a * D.width)) *
      D.coordinate z := by
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

/-! ## Generic compact-Riemann-surface degree API owned by this roadmap

These declarations target `TauCeti.Analysis.Complex.RiemannSurface.Degree`. They use genuine maps,
finite fibres, local multiplicities, and divisors rather than records carrying their desired
conclusions as fields.

The target module imports `TauCeti.AlgebraicTopology.Cellular.FiniteCW` and nothing from
`ModularForms`. Its Euler characteristic is the literal transport of
`TauCetiRoadmap.AlgebraicTopology.finiteCWEulerCharacteristic` along the model supplied by
`TauCetiRoadmap.AlgebraicTopology.compactManifoldFiniteCWType 2`. Those roadmap-namespace names
are import checks, not declarations to duplicate in the implementation.
-/

namespace RiemannSurface

open scoped ContDiff Manifold

/-- A nonconstant holomorphic map with finite fibres. For connected compact Riemann surfaces,
this is the map carrier used by local multiplicity and degree. -/
structure FiniteHolomorphicMap (X Y : Type*) [TopologicalSpace X] [ChartedSpace ℂ X]
    [TopologicalSpace Y] [ChartedSpace ℂ Y] where
  toFun : X → Y
  holomorphic : MDiff toFun
  nonconstant : ∃ x x', toFun x ≠ toFun x'
  finite_fiber : ∀ y, {x | toFun x = y}.Finite

instance {X Y : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [TopologicalSpace Y]
    [ChartedSpace ℂ Y] : CoeFun (FiniteHolomorphicMap X Y) fun _ ↦ X → Y :=
  ⟨FiniteHolomorphicMap.toFun⟩

section CompactSurfaces

variable {X Y Z : Type*}
variable [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X] [CompactSpace X]
  [ConnectedSpace X] [IsManifold 𝓘(ℂ, ℂ) ∞ X]
variable [TopologicalSpace Y] [ChartedSpace ℂ Y] [T2Space Y] [CompactSpace Y]
  [ConnectedSpace Y] [IsManifold 𝓘(ℂ, ℂ) ∞ Y]
variable [TopologicalSpace Z] [ChartedSpace ℂ Z] [T2Space Z] [CompactSpace Z]
  [ConnectedSpace Z] [IsManifold 𝓘(ℂ, ℂ) ∞ Z]

/-- Composition stays in the finite nonconstant holomorphic-map carrier. -/
noncomputable def FiniteHolomorphicMap.comp (g : FiniteHolomorphicMap Y Z)
    (f : FiniteHolomorphicMap X Y) : FiniteHolomorphicMap X Z := by
  sorry

/-- The positive local multiplicity of a finite holomorphic map at a point. -/
noncomputable def localMultiplicity (f : FiniteHolomorphicMap X Y) (x : X) : ℕ := by
  sorry

theorem localMultiplicity_pos (f : FiniteHolomorphicMap X Y) (x : X) :
    0 < localMultiplicity f x := by
  sorry

/-- The fibre-independent sum of local multiplicities. -/
noncomputable def degree (f : FiniteHolomorphicMap X Y) : ℕ := by
  sorry

theorem degree_eq_fiber_sum (f : FiniteHolomorphicMap X Y) (y : Y) :
    degree f = ∑ x ∈ (f.finite_fiber y).toFinset, localMultiplicity f x := by
  sorry

theorem localMultiplicity_comp (g : FiniteHolomorphicMap Y Z)
    (f : FiniteHolomorphicMap X Y) (x : X) :
    localMultiplicity (g.comp f) x = localMultiplicity g (f x) * localMultiplicity f x := by
  sorry

theorem degree_comp (g : FiniteHolomorphicMap Y Z) (f : FiniteHolomorphicMap X Y) :
    degree (g.comp f) = degree g * degree f := by
  sorry

/-- A degree-one finite holomorphic map is a biholomorphism, not merely a homeomorphism. -/
noncomputable def biholomorph_of_degree_eq_one (f : FiniteHolomorphicMap X Y)
    (hf : degree f = 1) : X ≃ₘ⟮𝓘(ℂ, ℂ), 𝓘(ℂ, ℂ)⟯ Y := by
  sorry

/-- Divisors are integral finite formal sums of points. -/
abbrev Divisor (X : Type*) := X →₀ ℤ

/-- Pullback weights each point by the map's local multiplicity. -/
noncomputable def divisor_pullback (f : FiniteHolomorphicMap X Y) :
    Divisor Y →+ Divisor X := by
  sorry

/-- The Euler characteristic transported from AlgebraicTopology's finite CW model of the compact
surface. The implementation is the literal application of `compactManifoldFiniteCWType 2` and
`finiteCWEulerCharacteristic`; it does not introduce an analytic or Riemann--Roch definition. -/
noncomputable def surfaceEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [ChartedSpace ℂ X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    [IsManifold 𝓘(ℂ, ℂ) ∞ X] : ℤ := by
  sorry

/-- Genus is defined topologically from Euler characteristic. The preceding finite-CW theorem
proves that `2 - chi(X)` is a nonnegative even integer. -/
noncomputable def genus (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
    [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ, ℂ) ∞ X] : ℕ :=
  Int.toNat ((2 - surfaceEulerCharacteristic X) / 2)

/-- The defining Euler-characteristic identity for topological genus. Analytic compatibility is
then proved independently of the higher ModularForms Riemann--Roch layer. -/
theorem surfaceEulerCharacteristic_eq_two_sub_two_mul_genus :
    surfaceEulerCharacteristic X = 2 - 2 * (genus X : ℤ) := by
  sorry

/-- Degree of the ramification divisor `sum_x (e_x - 1)[x]`. -/
noncomputable def ramificationDegree (f : FiniteHolomorphicMap X Y) : ℕ := by
  sorry

/-- The acyclic proof spine: excise branch discs, use finite-cover multiplicativity on their
complement, and add the discs back. This theorem depends only on finite-CW Euler characteristic
and local normal forms, never on canonical divisors or Riemann--Roch. -/
theorem branchedCover_eulerCharacteristic (f : FiniteHolomorphicMap X Y) :
    surfaceEulerCharacteristic X =
      (degree f : ℤ) * surfaceEulerCharacteristic Y - (ramificationDegree f : ℤ) := by
  sorry

/-- Riemann--Hurwitz is an algebraic rewrite of the topological branched-cover formula. -/
theorem riemannHurwitz (f : FiniteHolomorphicMap X Y) :
    2 * (genus X : ℤ) - 2 =
      (degree f : ℤ) * (2 * (genus Y : ℤ) - 2) + (ramificationDegree f : ℤ) := by
  have hX := surfaceEulerCharacteristic_eq_two_sub_two_mul_genus (X := X)
  have hY := surfaceEulerCharacteristic_eq_two_sub_two_mul_genus (X := Y)
  have hχ := branchedCover_eulerCharacteristic f
  rw [hX, hY] at hχ
  linarith

end CompactSurfaces

end RiemannSurface
