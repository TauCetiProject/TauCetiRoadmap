import Mathlib
import TauCeti.AlgebraicTopology.Singular.Relative
import TauCeti.AlgebraicTopology.Singular.Twisted.Relative
import TauCeti.AlgebraicTopology.Singular.EilenbergZilber

/-!
The README is the definitive specification; this file is not an exhaustive checklist. The
declarations below expose native carriers for finite-index data, equivariant topological
thickenings, regular-coordinate charts, relative singular chains and the virtual cochain
complex. Their dependent constructions remain specified in the README, including the
orientation-twisted global trace and the virtual fundamental class.

The chain abbreviation here is the ordinary untwisted relative-chain carrier. It does not
encode the orientation-dual coefficients, finite-group invariants, integer reindexing or
global-relative pair-map proof required for the trace. The TS0–TS5 comparison is a supplier
contract stated in the README; this sketch does not assert a corresponding import.
-/

noncomputable section

open CategoryTheory TopologicalSpace Opposite

universe u

namespace TauCetiRoadmap.ImplicitAtlases

section FiniteIndices

variable {A : Type u} [DecidableEq A]
variable (G : A → Type u) (E : A → Type u)

/-- Actual finite group product; native Pi instances provide its group structure. -/
abbrev CoveringGroup (I : Finset A) := ∀ a : I, G a

/-- A native finite product model; V0 constructs its comparison to the direct sum. -/
abbrev ObstructionTuple (I : Finset A) := ∀ a : I, E a

/-- Deformation parameters are real nonnegative coordinates, not rational obstructions. -/
abbrev NonnegativeParameters (I : Finset A) :=
  {t : I → ℝ // ∀ a, 0 ≤ t a}

/-- The active finite index set retains its actual subtype indices. -/
noncomputable def activeIndices (I : Finset A) (t : NonnegativeParameters I) : Finset I :=
  Finset.univ.filter (fun a => 0 < t.val a)

end FiniteIndices

section TopologicalThickening

variable (G : Type u) [Group G]
variable (E : Type u) [NormedAddCommGroup E] [NormedSpace ℝ E]
variable (rho : Representation ℝ G E)

/-- The topological chart floor with genuine equivariance and regular-open data.
The footprint, projection, freeness and covering axioms of V1 remain additional constructions;
this record is deliberately not called a complete implicit atlas. -/
structure Thickening [Fintype G] [FiniteDimensional ℝ E] where
  space : TopCat.{u}
  hausdorff : T2Space space
  action : G →* (space ≃ₜ space)
  sectionMap : C(space, E)
  section_equivariant : ∀ (g : G) (x : space),
    sectionMap (action g x) = rho g (sectionMap x)
  regularLocus : Opens space
  regular_invariant : ∀ (g : G) (x : space),
    action g x ∈ regularLocus ↔ x ∈ regularLocus

variable [Fintype G] [FiniteDimensional ℝ E]

/-- The actual zero-fiber subtype, with its native induced topology. -/
abbrev ZeroFiber (C : Thickening G E rho) := {x : C.space // C.sectionMap x = 0}

/-- Expected dimensions live in Z. No `Int.toNat` occurs in the model predicate. -/
def expectedDimension (d : ℤ) : ℤ := d + (Module.finrank ℝ E : ℤ)

/-- One genuine interior regular-coordinate chart. Boundary and extra-obstruction product
models are separate V1 targets. The dimension equality is part of the actual witness. -/
structure RegularCoordinateAt (C : Thickening G E rho) (d : ℤ) (x : C.space) where
  dimension : ℕ
  dimension_eq : (dimension : ℤ) = expectedDimension E d
  source : Opens C.space
  mem_source : x ∈ source
  source_in_regular : (source : Set C.space) ⊆ (C.regularLocus : Set C.space)
  target : Opens (EuclideanSpace ℝ (Fin dimension))
  coordinate : source ≃ₜ target

/-- A negative expected dimension admits no such regular coordinate model. -/
theorem no_regularCoordinate_of_negative (C : Thickening G E rho) (d : ℤ)
    (h : expectedDimension E d < 0) (x : C.space) :
    IsEmpty (RegularCoordinateAt G E rho C d x) := by
  refine ⟨fun c => ?_⟩
  have hd := c.dimension_eq
  have hn : (0 : ℤ) ≤ (c.dimension : ℤ) := Int.natCast_nonneg _
  omega

end TopologicalThickening

section NativeChains

/-- Ordinary relative singular chains on an actual embedded pair. Coefficients are an actual
native module object; twisting/invariants/reindexing are not asserted by this abbreviation. -/
abbrev RelativeChains (M : ModuleCat.{u} ℚ) (P : TopPair.{u}) :
    ChainComplex (ModuleCat.{u} ℚ) ℕ :=
  ((TopPair.singularChainComplexFunctor (ModuleCat.{u} ℚ)).obj M).obj P

/-- The ordinary obstruction pair (E,E minus zero), in the native category of pairs. -/
def obstructionPair (E : Type u) [TopologicalSpace E] [Zero E] : TopPair.{u} :=
  TopPair.ofSubset (X := TopCat.of E) ({0}ᶜ : Set E)

/-- An actual carrier for the proposed virtual K-complex, reusing native complexes/functors.
Descent, purity, the global trace and finite-subatlas comparison are not dummy fields here. -/
abbrev VirtualKComplex (X : Type u) [TopologicalSpace X] :=
  (Compacts X)ᵒᵖ ⥤ CochainComplex (ModuleCat.{u} ℚ) ℤ

end NativeChains

end TauCetiRoadmap.ImplicitAtlases
