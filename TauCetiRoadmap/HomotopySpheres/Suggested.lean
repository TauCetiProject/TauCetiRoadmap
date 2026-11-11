module

public import Mathlib

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The targets below use Mathlib's smooth manifolds, homotopy groups, spheres and matrix groups.

* The oriented recognition theorem and the h-cobordism theorem require chosen smooth
  orientations and compact oriented collared cobordisms.
* Freudenthal and the stable-stem colimit require the pointed suspension maps.
* Framed Pontryagin–Thom requires geometric framed bordism, Thom spaces and the tubular
  collapse construction.
* The Kervaire–Milnor exact sequence and the computation of the sixth homotopy sphere group
  require the geometric quotients and their induced maps.
* The geometric Wall comparison requires surgery traces and geometric filling quotients.
  The algebraic computations use the additive presentations of the form and formation groups.
-/

public section

open ContinuousMap Manifold Topology
open scoped ContDiff Manifold Topology

namespace TauCetiRoadmap.HomotopySpheres

abbrev ModelSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

noncomputable abbrev SmoothModel (n : ℕ) :=
  modelWithCornersSelf ℝ (ModelSpace n)

noncomputable abbrev Sphere (n : ℕ) :=
  Metric.sphere (0 : ModelSpace (n + 1)) 1

/-- A finite lawful smooth atlas code on the fixed Type-0 model. -/
structure SmoothAtlasCode (n : ℕ) where
  chartCount : ℕ
  chartDomain : Fin chartCount → Set (ModelSpace n)
  chartDomain_open : ∀ i, IsOpen (chartDomain i)
  chartDomain_nonempty : ∀ i, (chartDomain i).Nonempty
  overlap : Fin chartCount → Fin chartCount → Set (ModelSpace n)
  overlap_open : ∀ i j, IsOpen (overlap i j)
  overlap_subset_source : ∀ i j, overlap i j ⊆ chartDomain i
  self_overlap : ∀ i, overlap i i = chartDomain i
  transition : Fin chartCount → Fin chartCount →
    OpenPartialHomeomorph (ModelSpace n) (ModelSpace n)
  transition_source : ∀ i j, (transition i j).source = overlap i j
  transition_target : ∀ i j, (transition i j).target = overlap j i
  transition_mem_groupoid :
    ∀ i j, transition i j ∈ contDiffGroupoid ∞ (SmoothModel n)
  transition_id : ∀ i x, x ∈ chartDomain i → transition i i x = x
  transition_inv : ∀ i j x, x ∈ overlap i j → transition j i (transition i j x) = x
  transition_cocycle : ∀ i j k x, x ∈ overlap i j →
    transition i j x ∈ overlap j k →
      x ∈ overlap i k ∧ transition i k x = transition j k (transition i j x)
  identified : (Σ i, chartDomain i) → (Σ i, chartDomain i) → Prop
  identified_iff : ∀ i j x y,
    identified ⟨i, x⟩ ⟨j, y⟩ ↔
      (x : ModelSpace n) ∈ overlap i j ∧ transition i j x = y
  identified_refl : ∀ x, identified x x
  identified_symm : ∀ {x y}, identified x y → identified y x
  identified_trans : ∀ {x y z}, identified x y → identified y z → identified x z
  separated : IsClosed {p : (Σ i, chartDomain i) × (Σ i, chartDomain i) |
    identified p.1 p.2}

abbrev SmoothAtlasCode.PrePoint {n : ℕ} (C : SmoothAtlasCode n) :=
  Σ i, C.chartDomain i

def SmoothAtlasCode.gluingSetoid {n : ℕ} (C : SmoothAtlasCode n) : Setoid C.PrePoint where
  r := C.identified
  iseqv :=
    ⟨fun x ↦ C.identified_refl x,
      fun {_ _} h ↦ C.identified_symm h,
      fun {_ _ _} hxy hyz ↦ C.identified_trans hxy hyz⟩

abbrev SmoothAtlasCode.Realization {n : ℕ} (C : SmoothAtlasCode n) :=
  Quotient C.gluingSetoid

def SmoothAtlasCode.quotientProjection {n : ℕ} (C : SmoothAtlasCode n) :
    C.PrePoint → C.Realization :=
  Quotient.mk C.gluingSetoid

def SmoothAtlasCode.chartToRealization {n : ℕ} (C : SmoothAtlasCode n)
    (i : Fin C.chartCount) : C.chartDomain i → C.Realization :=
  fun x ↦ C.quotientProjection ⟨i, x⟩

abbrev SpecialOrthogonal (n : ℕ) :=
  Matrix.specialOrthogonalGroup (Fin n) ℝ

theorem stableSOHomotopy_five_subsingleton : Subsingleton (π_ 5 (SpecialOrthogonal 7) 1) := by
  sorry

theorem stableSOHomotopy_six_subsingleton : Subsingleton (π_ 6 (SpecialOrthogonal 8) 1) := by
  sorry

/-- The finite-rank form of real Bott periodicity in positive homotopy degrees. -/
theorem realBottPeriodicity (i n N : ℕ) [NeZero i]
    (_hn : i + 2 ≤ n) (_hN : i + 10 ≤ N) :
    Nonempty (π_ (i + 8) (SpecialOrthogonal N) 1 ≃* π_ i (SpecialOrthogonal n) 1) := by
  sorry

noncomputable def sphereBasepoint (n : ℕ) : Sphere n :=
  ⟨EuclideanSpace.single 0 1, by simp⟩

/-- The sixth stable stem, represented in the Freudenthal stable range. -/
theorem sixthStableStem :
    Nonempty (π_ 14 (Sphere 8) (sphereBasepoint 8) ≃* Multiplicative (ZMod 2)) := by
  sorry

theorem smoothPoincareSix
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (ModelSpace 6) M] [IsManifold (SmoothModel 6) ∞ M]
    (_h : M ≃ₕ Sphere 6) :
    Nonempty (M ≃ₘ⟮SmoothModel 6, SmoothModel 6⟯ Sphere 6) := by
  sorry

abbrev WallLattice (rank : ℕ) := Fin rank → ℤ

abbrev WallQuadraticValue (q : ℕ) := ZMod (if Even q then 0 else 2)

structure EvenWallForm (q : ℕ) where
  rank : ℕ
  pairing : LinearMap.BilinForm ℤ (WallLattice rank)
  quadratic : WallLattice rank → WallQuadraticValue q
  pairing_symmetry : ∀ x y,
    pairing x y = (-1 : ℤ) ^ q * pairing y x
  quadratic_zero : quadratic 0 = 0
  quadratic_add : ∀ x y,
    quadratic (x + y) =
      quadratic x + quadratic y + (pairing x y : WallQuadraticValue q)
  quadratic_smul : ∀ (a : ℤ) x,
    quadratic (a • x) = (a : WallQuadraticValue q) ^ 2 * quadratic x
  diagonal : ∀ x, (pairing x x : WallQuadraticValue q) =
    quadratic x + ((-1 : ℤ) ^ q : WallQuadraticValue q) * quadratic x
  unimodular : Function.Bijective pairing

structure EvenWallForm.Lagrangian {q : ℕ} (form : EvenWallForm q) where
  carrier : Submodule ℤ (WallLattice form.rank)
  isotropic : ∀ x ∈ carrier, ∀ y ∈ carrier, form.pairing x y = 0
  quadratic_zero : ∀ x ∈ carrier, form.quadratic x = 0
  self_orthogonal : form.pairing.orthogonal carrier = carrier
  directSummand : ∃ complement, IsCompl carrier complement

structure OddWallFormation (q : ℕ) where
  form : EvenWallForm q
  firstLagrangian : form.Lagrangian
  secondLagrangian : form.Lagrangian

structure EvenWallForm.Isometry {q : ℕ} (F G : EvenWallForm q) where
  toLinearEquiv : WallLattice F.rank ≃ₗ[ℤ] WallLattice G.rank
  pairing_eq : ∀ x y, G.pairing (toLinearEquiv x) (toLinearEquiv y) = F.pairing x y
  quadratic_eq : ∀ x, G.quadratic (toLinearEquiv x) = F.quadratic x

structure OddWallFormation.Isometry {q : ℕ} (F G : OddWallFormation q) where
  formIsometry : F.form.Isometry G.form
  first_eq : Submodule.map formIsometry.toLinearEquiv.toLinearMap
    F.firstLagrangian.carrier = G.firstLagrangian.carrier
  second_eq : Submodule.map formIsometry.toLinearEquiv.toLinearMap
    F.secondLagrangian.carrier = G.secondLagrangian.carrier


/-- Witness the direct sum by an isometry from the product lattice. -/
structure EvenWallForm.SumIsometry {q : ℕ} (F G K : EvenWallForm q) where
  toLinearEquiv : (WallLattice F.rank × WallLattice G.rank) ≃ₗ[ℤ] WallLattice K.rank
  pairing_eq : ∀ x y, K.pairing (toLinearEquiv x) (toLinearEquiv y) =
    F.pairing x.1 y.1 + G.pairing x.2 y.2
  quadratic_eq : ∀ x, K.quadratic (toLinearEquiv x) = F.quadratic x.1 + G.quadratic x.2

/-- The integral hyperbolic plane in hyperbolic coordinates. -/
def EvenWallForm.IsHyperbolicPlane {q : ℕ} (F : EvenWallForm q) : Prop :=
  ∃ e : WallLattice 2 ≃ₗ[ℤ] WallLattice F.rank,
    (∀ x y, F.pairing (e x) (e y) = x 0 * y 1 + (-1 : ℤ) ^ q * x 1 * y 0) ∧
    (∀ x, F.quadratic (e x) = ((x 0 * x 1 : ℤ) : WallQuadraticValue q))

structure OddWallFormation.SumIsometry {q : ℕ} (F G K : OddWallFormation q) where
  formSum : F.form.SumIsometry G.form K.form
  first_eq : Submodule.map formSum.toLinearEquiv.toLinearMap
    (F.firstLagrangian.carrier.prod G.firstLagrangian.carrier) = K.firstLagrangian.carrier
  second_eq : Submodule.map formSum.toLinearEquiv.toLinearMap
    (F.secondLagrangian.carrier.prod G.secondLagrangian.carrier) = K.secondLagrangian.carrier

def OddWallFormation.IsTrivial {q : ℕ} (F : OddWallFormation q) : Prop :=
  IsCompl F.firstLagrangian.carrier F.secondLagrangian.carrier ∨
    ∃ L : F.form.Lagrangian,
      IsCompl F.firstLagrangian.carrier L.carrier ∧
      IsCompl F.secondLagrangian.carrier L.carrier

def evenWallRelations (q : ℕ) : Set (FreeAbelianGroup (EvenWallForm q)) :=
  {r | (∃ F G : EvenWallForm q, Nonempty (F.Isometry G) ∧
      r = FreeAbelianGroup.of F - FreeAbelianGroup.of G) ∨
    (∃ F G K : EvenWallForm q, Nonempty (F.SumIsometry G K) ∧
      r = FreeAbelianGroup.of K - (FreeAbelianGroup.of F + FreeAbelianGroup.of G)) ∨
    (∃ F : EvenWallForm q, F.IsHyperbolicPlane ∧ r = FreeAbelianGroup.of F)}

def oddWallRelations (q : ℕ) : Set (FreeAbelianGroup (OddWallFormation q)) :=
  {r | (∃ F G : OddWallFormation q, Nonempty (F.Isometry G) ∧
      r = FreeAbelianGroup.of F - FreeAbelianGroup.of G) ∨
    (∃ F G K : OddWallFormation q, Nonempty (F.SumIsometry G K) ∧
      r = FreeAbelianGroup.of K - (FreeAbelianGroup.of F + FreeAbelianGroup.of G)) ∨
    (∃ F : OddWallFormation q, F.IsTrivial ∧ r = FreeAbelianGroup.of F)}

/-- The additive presentation of the even Wall group in dimension `2*q`. -/
abbrev EvenWallGroup (q : ℕ) :=
  FreeAbelianGroup (EvenWallForm q) ⧸ AddSubgroup.closure (evenWallRelations q)

/-- The additive presentation of the odd Wall group in dimension `2*q+1`. -/
abbrev OddWallGroup (q : ℕ) :=
  FreeAbelianGroup (OddWallFormation q) ⧸ AddSubgroup.closure (oddWallRelations q)

theorem wallGroupZero :
    Nonempty (EvenWallGroup 0 ≃+ ℤ) := by
  sorry

theorem wallGroupTwo :
    Nonempty (EvenWallGroup 1 ≃+ ZMod 2) := by
  sorry

theorem oddWallGroup_subsingleton (q : ℕ) : Subsingleton (OddWallGroup q) := by
  sorry

end TauCetiRoadmap.HomotopySpheres
