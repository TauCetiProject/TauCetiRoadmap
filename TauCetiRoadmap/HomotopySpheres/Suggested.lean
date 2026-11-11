module

public import Mathlib
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.
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

/-- The Euclidean model space of a boundaryless smooth manifold of dimension `n`. -/
abbrev ModelSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- The smooth model with corners for the Euclidean space of dimension `n`. -/
noncomputable abbrev SmoothModel (n : ℕ) :=
  modelWithCornersSelf ℝ (ModelSpace n)

/-- The unit `n`-sphere in Euclidean space of dimension `n + 1`. -/
noncomputable abbrev Sphere (n : ℕ) :=
  Metric.sphere (0 : ModelSpace (n + 1)) 1

/-! ## Layer 1: h-cobordisms -/

/-- The simply connected smooth h-cobordism theorem (Milnor, Theorem 9.1, p. 107). -/
theorem exists_diffeomorph_prod_Icc_of_hCobordism (n : ℕ) (hn : 5 ≤ n)
    (W : Type*) [TopologicalSpace W] [T2Space W] [CompactSpace W]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) W] [IsManifold (𝓡∂ (n + 1)) ∞ W]
    [SimplyConnectedSpace W]
    (V₀ : TopologicalSpace.Opens ((𝓡∂ (n + 1)).boundary W))
    (hV₀ : IsClosed (V₀ : Set ((𝓡∂ (n + 1)).boundary W)))
    (h₀ : ∃ e : V₀ ≃ₕ W, ⇑e.toFun = fun x : V₀ => ((x : (𝓡∂ (n + 1)).boundary W) : W))
    (h₁ : ∃ e : ↥((V₀ : Set ((𝓡∂ (n + 1)).boundary W))ᶜ) ≃ₕ W,
      ⇑e.toFun = fun x => ((x.1 : (𝓡∂ (n + 1)).boundary W) : W)) :
    ∃ f : (V₀ × Set.Icc (0 : ℝ) 1) ≃ₘ⟮(𝓡 n).prod (𝓡∂ 1), 𝓡∂ (n + 1)⟯ W,
      ∀ x : V₀, f (x, 0) = ((x : (𝓡∂ (n + 1)).boundary W) : W) := by
  sorry

/-! ## Layer 4: real Bott periodicity -/

/-- The finite-rank special orthogonal group used to represent stable classes. -/
abbrev SpecialOrthogonal (n : ℕ) :=
  Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- The stable group in degree five vanishes, represented in the range of `SO(7)`. -/
theorem stableSOHomotopy_five_subsingleton : Subsingleton (π_ 5 (SpecialOrthogonal 7) 1) := by
  sorry

/-- The stable group in degree six vanishes, represented in the range of `SO(8)`. -/
theorem stableSOHomotopy_six_subsingleton : Subsingleton (π_ 6 (SpecialOrthogonal 8) 1) := by
  sorry

/-- The finite-rank form of real Bott periodicity in positive homotopy degrees. -/
theorem nonempty_realBottPeriodicity (i n N : ℕ) [NeZero i]
    (_hn : i + 2 ≤ n) (_hN : i + 10 ≤ N) :
    Nonempty (π_ (i + 8) (SpecialOrthogonal N) 1 ≃* π_ i (SpecialOrthogonal n) 1) := by
  sorry

/-! ## Layer 7: Wall surgery groups -/

/-- The free integral surgery kernel in a chosen basis. -/
abbrev WallLattice (rank : ℕ) := Fin rank → ℤ

/-- The sign-dependent target of the quadratic refinement (Ranicki, §2). -/
abbrev WallQuadraticValue (q : ℕ) := ZMod (if Even q then 0 else 2)

/-- A nonsingular integral quadratic surgery form in dimension `2 * q` (Ranicki, §2). -/
structure EvenWallForm (q : ℕ) where
  rank : ℕ
  pairing : LinearMap.BilinForm ℤ (WallLattice rank)
  quadratic : QuadraticMap ℤ (WallLattice rank) (WallQuadraticValue q)
  pairing_symmetry : ∀ x y,
    pairing x y = (-1 : ℤ) ^ q * pairing y x
  polar_eq : ∀ x y, QuadraticMap.polar quadratic x y = (pairing x y : WallQuadraticValue q)
  diagonal : ∀ x, (pairing x x : WallQuadraticValue q) =
    quadratic x + ((-1 : ℤ) ^ q : WallQuadraticValue q) * quadratic x
  unimodular : Function.Bijective pairing

/-- A self-annihilating direct summand on which the quadratic refinement vanishes. -/
structure EvenWallForm.Lagrangian {q : ℕ} (form : EvenWallForm q) where
  carrier : Submodule ℤ (WallLattice form.rank)
  isotropic : ∀ x ∈ carrier, ∀ y ∈ carrier, form.pairing x y = 0
  quadratic_zero : ∀ x ∈ carrier, form.quadratic x = 0
  self_orthogonal : form.pairing.orthogonal carrier = carrier
  directSummand : ∃ complement, IsCompl carrier complement

/-- An odd-dimensional quadratic surgery formation with two Lagrangians (Ranicki, §2). -/
structure OddWallFormation (q : ℕ) where
  form : EvenWallForm q
  firstLagrangian : form.Lagrangian
  secondLagrangian : form.Lagrangian

/-- A quadratic isometry preserving the integral pairing. -/
structure EvenWallForm.Isometry {q : ℕ} (F G : EvenWallForm q) where
  quadraticIsometry : F.quadratic.IsometryEquiv G.quadratic
  pairing_eq : ∀ x y,
    G.pairing (quadraticIsometry x) (quadraticIsometry y) = F.pairing x y

/-- A form isometry carrying each Lagrangian to its corresponding Lagrangian. -/
structure OddWallFormation.Isometry {q : ℕ} (F G : OddWallFormation q) where
  formIsometry : F.form.Isometry G.form
  first_eq : Submodule.map formIsometry.quadraticIsometry.toLinearEquiv.toLinearMap
    F.firstLagrangian.carrier = G.firstLagrangian.carrier
  second_eq : Submodule.map formIsometry.quadraticIsometry.toLinearEquiv.toLinearMap
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

/-- An isometry from the direct sum preserving the two ordered Lagrangians. -/
structure OddWallFormation.SumIsometry {q : ℕ} (F G K : OddWallFormation q) where
  formSum : F.form.SumIsometry G.form K.form
  first_eq : Submodule.map formSum.toLinearEquiv.toLinearMap
    (F.firstLagrangian.carrier.prod G.firstLagrangian.carrier) = K.firstLagrangian.carrier
  second_eq : Submodule.map formSum.toLinearEquiv.toLinearMap
    (F.secondLagrangian.carrier.prod G.secondLagrangian.carrier) = K.secondLagrangian.carrier

/-- The elementary cases with complementary Lagrangians or a common complement. -/
def OddWallFormation.IsTrivial {q : ℕ} (F : OddWallFormation q) : Prop :=
  IsCompl F.firstLagrangian.carrier F.secondLagrangian.carrier ∨
    ∃ L : F.form.Lagrangian,
      IsCompl F.firstLagrangian.carrier L.carrier ∧
      IsCompl F.secondLagrangian.carrier L.carrier

/-- The isometry, sum and hyperbolic-plane relations of the even surgery group. -/
def evenWallRelations (q : ℕ) : Set (FreeAbelianGroup (EvenWallForm q)) :=
  {r | (∃ F G : EvenWallForm q, Nonempty (F.Isometry G) ∧
      r = FreeAbelianGroup.of F - FreeAbelianGroup.of G) ∨
    (∃ F G K : EvenWallForm q, Nonempty (F.SumIsometry G K) ∧
      r = FreeAbelianGroup.of K - (FreeAbelianGroup.of F + FreeAbelianGroup.of G)) ∨
    (∃ F : EvenWallForm q, F.IsHyperbolicPlane ∧ r = FreeAbelianGroup.of F)}

/-- The isometry, sum and elementary formation relations of the odd surgery group. -/
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

/-- Signature divided by eight computes the group in dimensions divisible by four. -/
theorem nonempty_evenWallGroup_two_mul_addEquiv_int (k : ℕ) :
    Nonempty (EvenWallGroup (2 * k) ≃+ ℤ) := by
  sorry

/-- The Arf invariant computes the group in dimensions congruent to two modulo four. -/
theorem nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two (k : ℕ) :
    Nonempty (EvenWallGroup (2 * k + 1) ≃+ ZMod 2) := by
  sorry

/-- The simply connected Wall obstruction groups vanish in odd dimensions. -/
theorem oddWallGroup_subsingleton (q : ℕ) : Subsingleton (OddWallGroup q) := by
  sorry

/-! ## Layer 9: the sixth stable stem -/

/-- The first unit basis vector as a basepoint of the sphere. -/
noncomputable def sphereBasepoint (n : ℕ) : Sphere n :=
  ⟨EuclideanSpace.single 0 1, by simp⟩

/-- The sixth stable stem in the Freudenthal range, represented by Toda’s `ν²`. -/
theorem nonempty_sixthStableStem :
    Nonempty (π_ 14 (Sphere 8) (sphereBasepoint 8) ≃* Multiplicative (ZMod 2)) := by
  sorry

/-! ## Layer 10: recognition of homotopy six-spheres -/

/-- Oriented smooth recognition in dimension six from the vanishing of `Θ₆`. -/
theorem exists_orientationPreserving_diffeomorph_sphere_six
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (ModelSpace 6) M] [IsManifold (SmoothModel 6) ∞ M]
    (_h : M ≃ₕ Sphere 6)
    (A : Set (OpenPartialHomeomorph M (ModelSpace 6)))
    (hA : TauCeti.IsOrientedAtlas (SmoothModel 6) ∞ A)
    (B : Set (OpenPartialHomeomorph (Sphere 6) (ModelSpace 6)))
    (hB : TauCeti.IsOrientedAtlas (SmoothModel 6) ∞ B) :
    ∃ f : M ≃ₘ⟮SmoothModel 6, SmoothModel 6⟯ Sphere 6, ∀ e ∈ A, ∀ e' ∈ B,
      (f.toHomeomorph.symm.toOpenPartialHomeomorph ≫ₕ e).symm ≫ₕ e' ∈
        TauCeti.orientationPreservingGroupoid (SmoothModel 6) := by
  sorry

/-- The smooth six-sphere recognition theorem with the orientation data forgotten. -/
theorem nonempty_diffeomorph_sphere_six
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (ModelSpace 6) M] [IsManifold (SmoothModel 6) ∞ M]
    (_h : M ≃ₕ Sphere 6) :
    Nonempty (M ≃ₘ⟮SmoothModel 6, SmoothModel 6⟯ Sphere 6) := by
  sorry

end TauCetiRoadmap.HomotopySpheres
