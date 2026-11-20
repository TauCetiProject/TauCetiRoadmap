import Mathlib
import TauCeti.Topology.Triangulable.Basic

/-!
# Orbifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, those headline theorems of the roadmap that are statable at the pins, each with
`sorry`, together with the finite-group statements of the averaging step (§2.4) and of the chart
weight of orbifold integration (§5.1) that the README names.

The headline theorems of the roadmap are:

* the Yang–Cairns triangulation theorem (§3.1): the orbit space of a smooth locally free action
  of a compact Lie group on a second-countable Hausdorff manifold is triangulable. It is stated
  below, as `isTriangulable_orbitRel_quotient_of_locallyFree`.
* Linear charts with retained arrows (§2.1): near every object a proper étale Lie groupoid is the
  action groupoid of its finite isotropy group acting linearly on a ball. Not statable: the pins
  have no Lie groupoid carrier (a Lie groupoid structure on a native groupoid is LieGroupoidsPoisson
  §G0.2's target); Tau Ceti has the topological local model and Bochner linearization of finite
  group actions, which are supplier contracts of the README.
* The rational comparison `H*(|Γ|; ℚ) ≅ H*(BΓ; ℚ)` (§§4.4, 4.9b) and the orbifold de Rham theorem
  `H*(Ω_inv(Γ)) ≅ H*(BΓ; ℝ)` (§§4.5, 4.9b). Not statable: besides the Lie groupoid carrier, the
  coarse map `BΓ → |Γ|` and the complex of invariant forms exist at the pins only for action
  groupoids.
* Weighted integration with Stokes on collared domains, rational Poincaré duality and the
  normalization of the weighted fundamental class (§§5.1–5.4). Not statable: orientations and
  integrals of invariant forms on presentations, and collared domains, are absent at the pins.
* The simplicial Chern–Weil comparison (§4.8). Not statable: orbibundles and their represented
  bundles on `BΓ` are absent at the pins.
-/

noncomputable section

open scoped Manifold ContDiff

universe u v w

namespace TauCetiRoadmap.Orbifolds

/-! ## Layer 2: Retained-arrow charts, averaging and effective reduction -/

/-- Exactness of invariants by averaging lifts (§2.4): if `f` is a surjective intertwining map of
representations of a finite group `G` over a commutative ring in which `|G|` is invertible, every
invariant vector of the target is the image of an invariant vector. -/
theorem invariant_lift {k : Type u} [CommRing k] {G : Type v} [Group G] [Fintype G]
    [Invertible (Fintype.card G : k)] {V : Type w} [AddCommGroup V] [Module k V]
    {W : Type w} [AddCommGroup W] [Module k W]
    (ρ : Representation k G V) (σ : Representation k G W)
    (f : Representation.IntertwiningMap ρ σ) (hf : Function.Surjective f)
    (w : σ.invariants) :
    ∃ v : ρ.invariants, f v.val = w.val := by
  sorry

/-! ## Layer 3: Coarse triangulation, finite covers and boundary models -/

/-- **Yang–Cairns** (§3.1; Yang, Bull. AMS 69 (1963), 405–408). If a compact Lie group `K` acts
smoothly on a second-countable Hausdorff smooth manifold `M` with every stabilizer finite, the
orbit space `M/K` is homeomorphic to the geometric realization of an abstract simplicial complex. -/
theorem isTriangulable_orbitRel_quotient_of_locallyFree
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    (K : Type*) [Group K] [TopologicalSpace K] [ChartedSpace E' K] [LieGroup 𝓘(ℝ, E') ∞ K]
    [CompactSpace K]
    (M : Type*) [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [MulAction K M] [ContMDiffSMul 𝓘(ℝ, E') 𝓘(ℝ, E) ∞ K M]
    (hfin : ∀ x : M, Finite (MulAction.stabilizer K x)) :
    TauCeti.IsTriangulable.{0} (MulAction.orbitRel.Quotient K M) := by
  sorry

/-! ## Layer 5: Weighted integration, Thom classes and rational duality -/

/-- The chart weight of a finite group (§5.1): `|G|⁻¹`, counting the full group, ineffective
kernel included. -/
def finiteGroupWeight (G : Type u) [Group G] [Finite G] : ℚ := (Nat.card G : ℚ)⁻¹

/-- The chart integral of a function on a finite `G`-set with counting measure (§5.1):
`|G|⁻¹ ∑ₓ f(x)`. -/
def weightedFiniteSum (G : Type u) [Group G] [Finite G] {X : Type v} [Fintype X] (f : X → ℚ) : ℚ :=
  finiteGroupWeight G * ∑ x, f x

/-- The integral of the constant `a` over the point `[*/G]` (§5.1): `|G|⁻¹ · a`. It is an
integral on the orbifold, not on the classifying space `BG`. -/
def pointGroupIntegral (G : Type u) [Group G] [Finite G] (a : ℚ) : ℚ := finiteGroupWeight G * a

/-- `∫_[*/G] 1 = 1/|G|` (§5.1). -/
@[simp] theorem pointGroupIntegral_one (G : Type u) [Group G] [Finite G] :
    pointGroupIntegral G 1 = (Nat.card G : ℚ)⁻¹ := by
  simp [pointGroupIntegral, finiteGroupWeight]

/-- A rational linear functional scaled by the chart weight `|G|⁻¹` (§5.1). -/
def weightedFunctional (G : Type u) [Group G] [Finite G] {V : Type v} [AddCommGroup V]
    [Module ℚ V] (I : V →ₗ[ℚ] ℚ) : V →ₗ[ℚ] ℚ := finiteGroupWeight G • I

/-- The value of the weighted functional: `|G|⁻¹ · I v` (§5.1). -/
@[simp] theorem weightedFunctional_apply (G : Type u) [Group G] [Finite G]
    {V : Type v} [AddCommGroup V] [Module ℚ V] (I : V →ₗ[ℚ] ℚ) (v : V) :
    weightedFunctional G I v = finiteGroupWeight G * I v := rfl

/-- The weight `|G_x|⁻¹` of a point `x` of a `G`-set, `G_x` its stabilizer (§5.1). -/
def pointWeight (G : Type u) [Group G] [Finite G] (X : Type v) [MulAction G X] (x : X) : ℚ :=
  (Nat.card (MulAction.stabilizer G x) : ℚ)⁻¹

/-- The sum over the orbits of a finite `G`-set of `|G_x|⁻¹ f(x)`, for one chosen representative
`x` of each orbit (§5.1); `pointWeight_mul_invariant_of_same_orbit` shows that for invariant `f`
the choice does not matter. -/
def orbitWeightedSum (G : Type u) [Group G] [Finite G] (X : Type v) [MulAction G X]
    [Fintype X] (f : X → ℚ) : ℚ := by
  classical
  letI := Fintype.ofFinite (MulAction.orbitRel.Quotient G X)
  exact ∑ q : MulAction.orbitRel.Quotient G X, pointWeight G X (Quotient.out q) * f (Quotient.out q)

/-- The local weight formula in its finite form (§5.1): for a finite group acting on a finite set
and an invariant `f`, `|G|⁻¹ ∑ₓ f(x) = ∑_{orbits} |G_x|⁻¹ f(x)`, by orbit–stabilizer. -/
theorem weightedFiniteSum_eq_orbitWeightedSum
    (G : Type u) [Group G] [Fintype G] (X : Type v) [MulAction G X] [Fintype X]
    (f : X → ℚ) (hf : ∀ g : G, ∀ x : X, f (g • x) = f x) :
    weightedFiniteSum G f = orbitWeightedSum G X f := by
  sorry

/-- Representative independence (§5.1): for invariant `f` and `x`, `y` in one orbit,
`|G_x|⁻¹ f(x) = |G_y|⁻¹ f(y)`, conjugate stabilizers having the same order. -/
theorem pointWeight_mul_invariant_of_same_orbit
    (G : Type u) [Group G] [Fintype G] (X : Type v) [MulAction G X]
    (f : X → ℚ) (hf : ∀ g : G, ∀ x : X, f (g • x) = f x)
    (x y : X) (hxy : MulAction.orbitRel G X x y) :
    pointWeight G X x * f x = pointWeight G X y * f y := by
  sorry

end TauCetiRoadmap.Orbifolds
