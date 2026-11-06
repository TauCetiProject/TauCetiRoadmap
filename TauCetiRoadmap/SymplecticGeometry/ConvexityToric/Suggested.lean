import TauCetiRoadmap.SymplecticGeometry.HamiltonianReduction.Suggested
import TauCeti.Geometry.Toric.Algebraic.Lattice
import Mathlib.Analysis.Convex.Extreme
import Mathlib.AlgebraicTopology.SimplicialSet.TopAdj
import Mathlib.CategoryTheory.Functor.Currying
import Mathlib.Analysis.Convex.Hull
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Group.Measure
import Mathlib.MeasureTheory.Measure.AbsolutelyContinuous

/-!
These suggested forms are aids, not the specification. The README is definitive;
this file is neither exhaustive nor a required implementation plan. The lattice is the
actual pinned toric scalar-extension interface, and DH takes symplectic/moment-map data.
-/
noncomputable section
open scoped BigOperators Manifold ContDiff MeasureTheory
namespace TauCetiRoadmap.SymplecticGeometry

open CategoryTheory
universe u

/-! T4: the diagonal singular model of a topological nerve and its coarse map.
The input simplicial TopCat object retains the object and arrow topologies;
constructing it from R3 and proving the orbifold comparisons remain targets. -/

def orbifoldNerveSingularDiagonal (N : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) : SSet.{u} :=
  Functor.diag SimplexCategoryᵒᵖ ⋙ Functor.uncurry.obj (N ⋙ TopCat.toSSet)

def orbifoldClassifyingSpace (N : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) : TopCat.{u} :=
  SSet.toTop.obj (orbifoldNerveSingularDiagonal N)

def orbifoldNerveCoarseSimplicialMap (N : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) (X : TopCat.{u})
    (π : N ⟶ (Functor.const SimplexCategoryᵒᵖ).obj X) :
    orbifoldNerveSingularDiagonal N ⟶ TopCat.toSSet.obj X where
  app n := (TopCat.toSSet.map (π.app n)).app n
  naturality n m f := by
    change ((TopCat.toSSet.map (N.map f)).app n ≫
      (TopCat.toSSet.obj (N.obj m)).map f) ≫
      (TopCat.toSSet.map (π.app m)).app m =
      (TopCat.toSSet.map (π.app n)).app n ≫ (TopCat.toSSet.obj X).map f
    rw [Category.assoc, (TopCat.toSSet.map (π.app m)).naturality f,
      ← Category.assoc, ← NatTrans.comp_app, ← Functor.map_comp]
    have h : N.map f ≫ π.app m = π.app n := by
      simp
    rw [h]
    rfl

def orbifoldCoarseMap (N : SimplexCategoryᵒᵖ ⥤ TopCat.{u}) (X : TopCat.{u})
    (π : N ⟶ (Functor.const SimplexCategoryᵒᵖ).obj X) :
    orbifoldClassifyingSpace N ⟶ X :=
  SSet.toTop.map (orbifoldNerveCoarseSimplicialMap N X π) ≫ sSetTopAdj.counit.app X



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

def IntegralFacetPresentation.region {d : ℕ} (P : IntegralFacetPresentation N V d) :
    Set (StrongDual ℝ V) := {x | ∀ j, P.support j ≤ P.pairing j x}

/-- Exactly dim V incident facets, whose primitive normals form an integral basis. -/
def IntegralFacetPresentation.IsSmoothVertex [FiniteDimensional ℝ V] {d : ℕ}
    (P : IntegralFacetPresentation N V d) (x : StrongDual ℝ V) : Prop :=
  ∃ a : Fin (Module.finrank ℝ V) → Fin d, Function.Injective a ∧
    (∀ j, P.pairing j x = P.support j ↔ ∃ i, a i = j) ∧
    ∃ b : Module.Basis (Fin (Module.finrank ℝ V)) ℤ N, ∀ i, b i = P.normal (a i)

structure IntegralFacetPresentation.IsDelzant [FiniteDimensional ℝ V] {d : ℕ}
    (P : IntegralFacetPresentation N V d) : Prop where
  compact : IsCompact P.region
  fullDimension : (interior P.region).Nonempty
  smoothVertex : ∀ x ∈ P.region.extremePoints ℝ, P.IsSmoothVertex x
  irredundant : ∀ j, ∃ x ∈ P.region, P.pairing j x = P.support j ∧
    ∀ k, k ≠ j → P.support k < P.pairing k x

section Measure
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [MeasurableSpace M]

/-- The measure from the oriented density sigma^n/n!, not an arbitrary input measure. -/
def liouvilleMeasure
    [finiteDimensionalE : FiniteDimensional ℝ E]
    [borelM : BorelSpace M]
    [t2M : T2Space M]
    [secondCountableM : SecondCountableTopology M]
    [boundarylessM : BoundarylessManifold I M] :
    (σ : TauCeti.SmoothTwoForm I M) → σ.IsSymplectic → MeasureTheory.Measure M := by
  sorry

variable {EG HG T : Type*} [NormedAddCommGroup EG] [NormedSpace ℝ EG]
  [FiniteDimensional ℝ EG] [TopologicalSpace HG] {IT : ModelWithCorners ℝ EG HG}
  [TopologicalSpace T] [ChartedSpace HG T] [CommGroup T] [LieGroup IT ∞ T]
  [CompactSpace T] [ConnectedSpace T] [MulAction T M]
  [MeasurableSpace (StrongDual ℝ EG)] [BorelSpace (StrongDual ℝ EG)]

/-- DH is pushforward for an actual equivariant moment map, whose smoothness gives measurability. -/
def duistermaatHeckman
    [finiteDimensionalE : FiniteDimensional ℝ E]
    [borelM : BorelSpace M]
    [t2M : T2Space M]
    [secondCountableM : SecondCountableTopology M]
    [boundarylessM : BoundarylessManifold I M]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (μ : M → StrongDual ℝ EG) (_hμ : IsEquivariantMomentMap (IG := IT) (G := T) σ μ) :
    MeasureTheory.Measure (StrongDual ℝ EG) :=
  MeasureTheory.Measure.map μ (liouvilleMeasure σ hσ)

/-- Compact connected effective torus actions have absolutely continuous DH in the full dual. -/
theorem dh_absolutelyContinuous
    [finiteDimensionalE : FiniteDimensional ℝ E]
    [borelM : BorelSpace M]
    [t2M : T2Space M]
    [secondCountableM : SecondCountableTopology M]
    [boundarylessM : BoundarylessManifold I M]
    [CompactSpace M] [ConnectedSpace M]
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (ha : IsSmoothSymplecticAction (IG := IT) (G := T) σ)
    (μ : M → StrongDual ℝ EG) (hμ : IsEquivariantMomentMap (IG := IT) (G := T) σ μ)
    (heffective : ∀ g : T, (∀ x : M, g • x = x) → g = 1)
    (leb : MeasureTheory.Measure (StrongDual ℝ EG)) [leb.IsAddHaarMeasure] :
    duistermaatHeckman σ hσ μ hμ ≪ leb := by
  sorry

/-- The toric image is a smooth integral polytope in the normalized cocharacter lattice. -/
theorem toricImage_delzant
    [finiteDimensionalE : FiniteDimensional ℝ E]
    [borelM : BorelSpace M]
    [t2M : T2Space M]
    [secondCountableM : SecondCountableTopology M]
    [boundarylessM : BoundarylessManifold I M]
    [CompactSpace M] [ConnectedSpace M]
    (latticeMap : N →+ EG)
    (hlattice : TauCeti.Toric.IsIntegralLattice latticeMap)
    (exp : EG → T)
    (hexp_smooth : ContMDiff 𝓘(ℝ, EG) IT ∞ exp)
    (hexp_identity : exp 0 = 1)
    (hexp_add : ∀ v w, exp (v + w) = exp v * exp w)
    (hexp_deriv : mfderiv 𝓘(ℝ, EG) IT exp 0 = ContinuousLinearMap.id ℝ EG)
    (hperiod : ∀ v, exp ((2 * Real.pi) • v) = 1 ↔ v ∈ Set.range latticeMap)
    (σ : TauCeti.SmoothTwoForm I M) (hσ : σ.IsSymplectic)
    (ha : IsSmoothSymplecticAction (IG := IT) (G := T) σ)
    (μ : M → StrongDual ℝ EG) (hμ : IsEquivariantMomentMap (IG := IT) (G := T) σ μ)
    (heffective : ∀ g : T, (∀ x : M, g • x = x) → g = 1)
    (hdim : Module.finrank ℝ E = 2 * Module.finrank ℝ EG) :
    ∃ (d : ℕ) (P : IntegralFacetPresentation N EG d),
      P.latticeMap = latticeMap ∧ P.IsDelzant ∧ Set.range μ = P.region := by
  sorry
end Measure
end TauCetiRoadmap.SymplecticGeometry
