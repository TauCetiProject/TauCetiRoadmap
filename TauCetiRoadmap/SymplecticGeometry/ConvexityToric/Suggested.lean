module

public import Mathlib
public import TauCeti.Geometry.Manifold.DifferentialForm.Pullback.Smooth
public import TauCeti.Geometry.Symplectic.Hamiltonian.EquivariantMomentMap.Basic
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Toric.Algebraic.Lattice

/-!
# Hamiltonian convexity and toric geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with simple definitions on native carriers.
The statable headlines are torus convexity with connected fibers,
the word121 Bott–Samelson moment image and its exact polygon, toric orbit fibers,
and the Delzant property of a symplectic toric moment image.

The remaining headlines require constructions absent at the pins:
* The period/root comparison needs the compact adjoint-character and calibrated
  rank-one subgroup carriers. Equivariant local normal forms need the symplectic
  slice bundle and its equivariant symplectic chart comparison.
* The fixed-locus symplectic-submanifold theorem needs the induced smooth structure
  and restricted smooth form on each fixed component, and the equivariant normal bundle.
* Equivariant Morse perfection needs Borel equivariant cohomology and equivariant Thom classes.
* Kirwan convexity and Kostant projection convexity need the compact coadjoint orbit,
  its maximal-torus/chamber comparison, and the symplectic cross-section carriers.
  The norm-square deformation theorem needs the associated stable-stratum carrier.
* Duistermaat–Heckman absolute continuity, polynomiality and class variation need
  the measure constructed from the Liouville density, reduced spaces, and the
  reduced orbifold de Rham/classifying-space comparison. No arbitrary measure replaces it.
* Delzant reconstruction and uniqueness need the smooth symplectic reduction and
  equivariant symplectomorphism carriers; the facet cohomology presentation needs
  integral cohomology of those quotients. Labeled toric-orbifold classification needs
  the corresponding symplectic orbifold and reduction carriers.
These statements remain README targets; no admitted data stand in for their constructions.
-/

public section

noncomputable section
open scoped BigOperators Manifold ContDiff
open Manifold
namespace TauCetiRoadmap.ConvexityToric

/-! ## Layer 1: Hamiltonian torus data -/

section Hamiltonian
variable {E H M EG HG T : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup EG] [NormedSpace ℝ EG] [TopologicalSpace HG]
  {IT : ModelWithCorners ℝ EG HG} [TopologicalSpace T] [ChartedSpace HG T]
  [CommGroup T] [MulAction T M]

/-- A Hamiltonian torus action: a smooth action (`ContMDiffSMul`) of a commutative Lie group
`T` on `M` in which every element pulls `σ` back to itself, together with a group-level moment
map in the sense of `TauCeti.SmoothTwoForm.IsEquivariantMomentMap`. So each component `μ_ξ` is
smooth with `σ_x(ξ_M x, v) = dμ_ξ(v)` for the fundamental field `ξ_M x = d(g ↦ g • x)_1 ξ`, and
`μ` is coadjoint-equivariant, which for commutative `T` says `μ (g • x) = μ x`. The pinned
predicate asks for a `C³` Lie group, obtained here from the smooth one. -/
structure HamiltonianTorusData [IsManifold I ∞ M] [CompleteSpace E] [CompleteSpace EG]
    [LieGroup IT ∞ T] [ContMDiffSMul IT I ∞ T M] (σ : TauCeti.SmoothTwoForm I M)
    (μ : M → StrongDual ℝ EG) : Prop where
  preserves : ∀ g : T, TauCeti.SmoothForm.mpullback (fun x : M ↦ g • x)
    (ContMDiffSMul.contMDiff_const_smul (I := IT) g) σ = σ
  moment :
    haveI : LieGroup IT (minSmoothness ℝ 3) T := LieGroup.of_le (n := ∞) (by simp)
    σ.IsEquivariantMomentMap (I := IT) (G := T) fun x ↦ ((μ x : EG →L[ℝ] ℝ) : EG →ₗ[ℝ] ℝ)

/-! ## Layer 3: Convexity and matrix examples -/

/-- Atiyah–Guillemin–Sternberg convexity and connected fibers for a compact connected
Hamiltonian torus manifold, including ineffective actions and rank zero. -/
theorem torus_convexity
    [FiniteDimensional ℝ E] [FiniteDimensional ℝ EG]
    [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M]
    [LieGroup IT ∞ T] [ContMDiffSMul IT I ∞ T M] [T2Space T] [CompactSpace T] [ConnectedSpace T]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (μ : M → StrongDual ℝ EG) (hμ : HamiltonianTorusData (IT := IT) (T := T) σ μ) :
    Set.range μ = convexHull ℝ (μ '' {x | ∀ g : T, g • x = x}) ∧
      ∀ c : StrongDual ℝ EG, IsPreconnected (μ ⁻¹' {c}) := by
  sorry
end Hamiltonian

namespace BottSamelson
/-- The standard three-dimensional Hermitian space. -/
abbrev V3 := EuclideanSpace ℂ (Fin 3)

/-- The real diagonal entries of the actual orthogonal projector. -/
def projectorDiagonal (U : Submodule ℂ V3) : Fin 3 → ℝ :=
  fun i => ((U.starProjection (EuclideanSpace.single i (1 : ℂ))) i).re

/-- Weighted diagonal of the three orthogonal projectors on the incidence variety. -/
def moment (a b c : ℝ) (L₁ P L : Submodule ℂ V3) : Fin 3 → ℝ :=
  a • projectorDiagonal L₁ + b • projectorDiagonal P + c • projectorDiagonal L

/-- Coordinate plane fixed in the word121 incidence problem. -/
def initialPlane : Submodule ℂ V3 :=
  Submodule.span ℂ {EuclideanSpace.single 0 (1 : ℂ), EuclideanSpace.single 1 (1 : ℂ)}

/-- The moment values of the eight torus-fixed flags, in the order of the table of README §3.3. -/
def fixedMoment (a b c : ℝ) : Fin 8 → Fin 3 → ℝ :=
  ![![a+b+c,b,0], ![a+b,b+c,0], ![a+b+c,0,b], ![a+b,0,b+c],
    ![b+c,a+b,0], ![b,a+b+c,0], ![0,a+b+c,b], ![0,a+b,b+c]]

/-- This range uses actual subspaces, ranks and incidence, without a second flag carrier. -/
theorem incidence_moment_range (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    {x : Fin 3 → ℝ | ∃ L₁ P L : Submodule ℂ V3,
      Module.finrank ℂ L₁ = 1 ∧ Module.finrank ℂ P = 2 ∧ Module.finrank ℂ L = 1 ∧
      L₁ ≤ initialPlane ∧ L₁ ≤ P ∧ L ≤ P ∧ moment a b c L₁ P L = x} =
      convexHull ℝ (Set.range (fixedMoment a b c)) := by
  sorry

/-- All six inequalities are in the affine trace plane of the effective torus. -/
theorem fixedMoment_convexHull (a b c : ℝ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    convexHull ℝ (Set.range (fixedMoment a b c)) =
      {x : Fin 3 → ℝ | x 0 + x 1 + x 2 = a + 2*b + c ∧
        (∀ i, 0 ≤ x i) ∧ x 0 ≤ a+b+c ∧ x 1 ≤ a+b+c ∧ x 2 ≤ b+c} := by
  sorry

end BottSamelson

/-! ## Layer 5: Delzant moment images -/
section ToricFibers
variable {E H M EG HG T : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup EG] [NormedSpace ℝ EG] [TopologicalSpace HG]
  {IT : ModelWithCorners ℝ EG HG} [TopologicalSpace T] [ChartedSpace HG T]
  [CommGroup T] [MulAction T M]

/-- In a compact connected symplectic toric manifold, every nonempty moment fiber
is exactly one torus orbit. -/
theorem toric_fibers
    [FiniteDimensional ℝ E] [FiniteDimensional ℝ EG]
    [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M]
    [LieGroup IT ∞ T] [ContMDiffSMul IT I ∞ T M] [T2Space T] [CompactSpace T] [ConnectedSpace T]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (μ : M → StrongDual ℝ EG) (hμ : HamiltonianTorusData (IT := IT) (T := T) σ μ)
    (heffective : ∀ g : T, (∀ x : M, g • x = x) → g = 1)
    (hdim : Module.finrank ℝ E = 2 * Module.finrank ℝ EG) :
    ∀ x y : M, μ x = μ y ↔ ∃ g : T, g • x = y := by
  sorry
end ToricFibers

/-- Facet normals use a finite free integral lattice with its existing scalar-extension API. -/
structure IntegralFacetPresentation (N V : Type*) [AddCommGroup N]
    [NormedAddCommGroup V] [NormedSpace ℝ V] (d : ℕ) where
  latticeMap : N →+ V
  integralLattice : TauCeti.Toric.IsIntegralLattice latticeMap
  normal : Fin d → N
  support : Fin d → ℝ

variable {N V : Type*} [AddCommGroup N] [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- The moment image is in the dual of the cocharacter space. -/
def IntegralFacetPresentation.pairing {d : ℕ} (P : IntegralFacetPresentation N V d)
    (j : Fin d) (x : StrongDual ℝ V) : ℝ := x (P.latticeMap (P.normal j))

/-- Intersection of the inward closed supporting half-spaces. -/
def IntegralFacetPresentation.region {d : ℕ} (P : IntegralFacetPresentation N V d) :
    Set (StrongDual ℝ V) := {x | ∀ j, P.support j ≤ P.pairing j x}

/-- Exactly dim V incident facets, whose primitive normals form an integral basis. -/
def IntegralFacetPresentation.IsSmoothVertex [FiniteDimensional ℝ V] {d : ℕ}
    (P : IntegralFacetPresentation N V d) (x : StrongDual ℝ V) : Prop :=
  ∃ a : Fin (Module.finrank ℝ V) → Fin d, Function.Injective a ∧
    (∀ j, P.pairing j x = P.support j ↔ ∃ i, a i = j) ∧
    ∃ b : Module.Basis (Fin (Module.finrank ℝ V)) ℤ N, ∀ i, b i = P.normal (a i)

/-- A compact full-dimensional irredundant presentation with integral bases at vertices. -/
structure IntegralFacetPresentation.IsDelzant [FiniteDimensional ℝ V] {d : ℕ}
    (P : IntegralFacetPresentation N V d) : Prop where
  compact : IsCompact P.region
  fullDimension : (interior P.region).Nonempty
  smoothVertex : ∀ x ∈ P.region.extremePoints ℝ, P.IsSmoothVertex x
  irredundant : ∀ j, ∃ x ∈ P.region, P.pairing j x = P.support j ∧
    ∀ k, k ≠ j → P.support k < P.pairing k x


/-- An effective Hamiltonian torus action of half the manifold dimension has a
Delzant moment image for the actual normalized period lattice. -/
theorem toricImage_delzant
    {E H M EG HG T : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M]
    [NormedAddCommGroup EG] [NormedSpace ℝ EG] [FiniteDimensional ℝ EG]
    [TopologicalSpace HG] {IT : ModelWithCorners ℝ EG HG}
    [TopologicalSpace T] [ChartedSpace HG T] [CommGroup T] [LieGroup IT ∞ T]
    [T2Space T] [CompactSpace T] [ConnectedSpace T] [MulAction T M] [ContMDiffSMul IT I ∞ T M]
    (latticeMap : N →+ EG) (hlattice : TauCeti.Toric.IsIntegralLattice latticeMap)
    (exp : EG → T)
    (hexp_smooth : ContMDiff 𝓘(ℝ, EG) IT ∞ exp)
    (hexp_identity : exp 0 = 1)
    (hexp_add : ∀ v w, exp (v + w) = exp v * exp w)
    (hexp_deriv : mfderiv 𝓘(ℝ, EG) IT exp 0 = ContinuousLinearMap.id ℝ EG)
    (hperiod : ∀ v, exp ((2 * Real.pi) • v) = 1 ↔ v ∈ Set.range latticeMap)
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (μ : M → StrongDual ℝ EG) (hμ : HamiltonianTorusData (IT := IT) (T := T) σ μ)
    (heffective : ∀ g : T, (∀ x : M, g • x = x) → g = 1)
    (hdim : Module.finrank ℝ E = 2 * Module.finrank ℝ EG) :
    ∃ (d : ℕ) (P : IntegralFacetPresentation N EG d),
      P.latticeMap = latticeMap ∧ P.IsDelzant ∧ Set.range μ = P.region := by
  sorry

end TauCetiRoadmap.ConvexityToric
