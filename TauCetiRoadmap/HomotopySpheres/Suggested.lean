import Mathlib
import TauCeti.Geometry.Manifold.Boundary.Charts
import TauCeti.Geometry.Diffeomorphism.Disc

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

This file is not the roadmap: the roadmap is README.md. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. The oriented-atlas
declarations `TauCeti.IsOrientedAtlas` and `TauCeti.orientationPreservingGroupoid` are reached
through `TauCeti.Geometry.Diffeomorphism.Disc`, whose public imports re-export them.

Stated here:

* the simply connected smooth h-cobordism theorem in total dimension at least six (Layer 1),
  on the native manifold with boundary and Tau Ceti's boundary manifold structure;
* real Bott periodicity for the orthogonal groups in the stable range (Section 4B);
* the independently owned Bott base entries in degrees two through eight, in their stable
  ranges (Section 4B); TopologicalKTheory T1.5a supplies components and degree one;
* the seventh stable stem, `π_{n+7}(S^n) ≅ ℤ/240` for `n ≥ 9` (Layer 9A);
* exotic spheres in every dimension `4k + 3`, `k ≥ 1`: a smooth manifold homeomorphic but not
  diffeomorphic to `S^(4k+3)`, realised by the boundary of the negative E8 plumbing
  (Sections 6B and 9A.4);
* vanishing of the fourth and fifth stable stems for `n ≥ 6` and `n ≥ 7` respectively
  (Layer 9);
* the sixth stable stem, in its unstable form `π_{n+6}(S^n) ≅ ℤ/2` for `n ≥ 8` (Layer 9);
* the standard sphere `S^n`, `n ≥ 1`, is smoothly parallelizable exactly for `n ∈ {1, 3, 7}`
  (Section 3C.5);
* smooth recognition in dimension six, oriented (Layer 10), and unoriented as Mathlib's
  `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` at `n = 6`;
* the even and odd simply connected Wall groups through their additive presentations (Layer 7).

The group isomorphisms among these are stated as existence (`nonempty_*`): the canonical maps
that the README makes isomorphisms (the Bott periodicity map, the generators `ν²` and `σ` of the
sixth and seventh stems, the Bott clutching generators) are not available at the pins. The
unoriented recognition theorem is an existence statement by nature, the corollary of the
oriented one; so is the exotic-sphere theorem, whose witness is the plumbing boundary.

Not statable at the pins:

* `Theta_n` as a group and `Theta_6 = 0` (Layers 2 and 9): `Theta_n` is the quotient of oriented
  smooth homotopy `n`-spheres by oriented h-cobordism, with the addition induced by Tau Ceti's
  `TauCeti.OrientedConnectedSum`. The pins have that connected sum but neither the oriented
  h-cobordism relation nor the quotient, which is a construction of the roadmap (the
  h-cobordism class content of `Theta_6 = 0` is implied by the six-dimensional recognition
  theorem below);
* the stable stems as colimits and stable `J` (Layer 3 and Section 4C): the pins
  do not supply a suspension homomorphism on `HomotopyGroup`;
* the connected James equivalence, the James splitting after one suspension and the EHP exact
  sequence (Sections 3B–3C): the pins lack the reduced word space, reduced pointed suspension
  and James–Hopf map, and the stable form of the splitting also needs a stable category of
  spectra with a suspension spectrum functor;
* Hopf-invariant-one exclusion (Section 3C.5): the pins lack the pointed topological mapping
  cone and its integral cup-product Hopf invariant. The sphere-framing consequence is stated
  below on the native smooth tangent bundle;
* the almost-framed groups, `P_n`, their comparison with the Wall groups and the geometric
  exact sequence (Layers 6 to 8): these need geometric bordism quotients and surgery traces;
* `Theta_7 ≅ ℤ/28`, the Eells–Kuiper comparison of the negative E8 boundary with the
  quaternionic sphere-bundle model, and nonstandardness of the E8 plumbing boundary itself in
  dimension `4k-1`, `k > 1`, as a statement about that boundary (Layer 9A): these need the
  homotopy-sphere bordism quotient, the plumbed manifolds and collared Spin fillings with their
  relative characteristic-number pairings. The pins do not supply those carriers; the
  seventh-stem statement below does not replace them. Their existence consequence needs none of
  them and is stated below.
-/

open scoped ContDiff Manifold

namespace TauCetiRoadmap.HomotopySpheres

universe u

/-- The standard sphere `S^n`, the unit sphere of `ℝ^{n+1}`, with Mathlib's smooth structure
modelled on `ℝ^n`. -/
noncomputable abbrev Sphere (n : ℕ) := Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1

/-- The orthogonal group `O(n)`, as Mathlib's submonoid of real `n × n` matrices, with the subspace
topology. -/
abbrev OrthogonalGroup (n : ℕ) := Matrix.orthogonalGroup (Fin n) ℝ

/-- A diffeomorphism `f : M ≃ S⁶` carries the oriented atlas `A` of `M` into the orientation of the
oriented atlas `B` of `S⁶`: every coordinate change from a chart `e ∘ f⁻¹` with `e ∈ A` to a chart
of `B` has derivative of positive determinant. -/
def PreservesOrientedAtlases {M : Type u} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 6)) M]
    (f : M ≃ₘ⟮𝓡 6, 𝓡 6⟯ Sphere 6)
    (A : Set (OpenPartialHomeomorph M (EuclideanSpace ℝ (Fin 6))))
    (B : Set (OpenPartialHomeomorph (Sphere 6) (EuclideanSpace ℝ (Fin 6)))) : Prop :=
  ∀ e ∈ A, ∀ e' ∈ B,
    (f.toHomeomorph.symm.toOpenPartialHomeomorph ≫ₕ e).symm ≫ₕ e' ∈
      TauCeti.orientationPreservingGroupoid (𝓡 6)

/-! ## Layer 1: h-cobordisms and the high-dimensional theorem -/

/-- The simply connected smooth h-cobordism theorem (Milnor, *Lectures on the h-cobordism
theorem*, Theorem 9.1 and the remark after Definition 9.2, pp.107–108; README Section 1.7). Let `W` be a compact Hausdorff
simply connected smooth manifold with boundary of dimension `n + 1 ≥ 6`, and split its boundary,
with Tau Ceti's boundary manifold structure, into a closed and open piece `M₀` and its complement.
If both inclusions into `W` are homotopy equivalences, then `W` is diffeomorphic to
`M₀ × [0, 1]` by a diffeomorphism that is the inclusion of `M₀` at time `0`. -/
theorem exists_diffeomorph_prod_Icc_of_hCobordism (n : ℕ) (hn : 5 ≤ n)
    (W : Type u) [TopologicalSpace W] [T2Space W] [CompactSpace W]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) W] [IsManifold (𝓡∂ (n + 1)) ∞ W]
    [SimplyConnectedSpace W]
    (M₀ : TopologicalSpace.Opens ((𝓡∂ (n + 1)).boundary W))
    (hM₀ : IsClosed (M₀ : Set ((𝓡∂ (n + 1)).boundary W)))
    (h₀ : ∃ e : ContinuousMap.HomotopyEquiv M₀ W,
      ⇑e.toFun = fun x : M₀ => ((x : (𝓡∂ (n + 1)).boundary W) : W))
    (h₁ : ∃ e : ContinuousMap.HomotopyEquiv ↥((M₀ : Set ((𝓡∂ (n + 1)).boundary W))ᶜ) W,
      ⇑e.toFun = fun x : ↥((M₀ : Set ((𝓡∂ (n + 1)).boundary W))ᶜ) =>
        ((x.1 : (𝓡∂ (n + 1)).boundary W) : W)) :
    ∃ f : (M₀ × Set.Icc (0 : ℝ) 1) ≃ₘ⟮(𝓡 n).prod (𝓡∂ 1), 𝓡∂ (n + 1)⟯ W,
      ∀ x : M₀, f (x, 0) = ((x : (𝓡∂ (n + 1)).boundary W) : W) := by
  sorry

/-! ## Layer 3: parallelizable spheres -/

/-- The standard sphere `S^n` with `n ≥ 1` admits `n` smooth tangent vector fields that are
linearly independent at every point exactly when `n ∈ {1, 3, 7}` (Hatcher, *Vector Bundles and
K-Theory*, §1.1, p.5, for the frames on `S^1`, `S^3` and `S^7`, and Theorem 2.16(b), p.59, for
the converse, applied to `S^(m-1)` with `m = n + 1`; README Section 3C.5). -/
theorem sphere_parallelizable_iff (n : ℕ) (hn : 0 < n) :
    (∃ v : Fin n → (x : Sphere n) → TangentSpace (𝓡 n) x,
        (∀ i, ContMDiff (𝓡 n) ((𝓡 n).prod 𝓘(ℝ, EuclideanSpace ℝ (Fin n))) ∞
          (fun x => (⟨x, v i x⟩ : TangentBundle (𝓡 n) (Sphere n)))) ∧
        ∀ x, LinearIndependent ℝ (fun i => v i x)) ↔
      n = 1 ∨ n = 3 ∨ n = 7 := by
  sorry

/-! ## Layer 4: real Bott periodicity -/

/-- Real Bott periodicity in the stable range: for `n ≥ k + 11` the homotopy groups of `O(n)` at
the identity satisfy `π_{k+9}(O(n)) ≅ π_{k+1}(O(n))` (Bott, *The stable homotopy of the classical
groups*, 1959, pp.314–315; the table of reduced `KO` of spheres in Hatcher, *Vector Bundles and
K-Theory*, Introduction, p.1, read through clutching, Proposition 1.14, p.25; README
Section 4B.7). -/
theorem nonempty_orthogonalGroup_bottPeriodicity (k n : ℕ) (hn : k + 11 ≤ n) :
    Nonempty (HomotopyGroup.Pi (k + 9) (OrthogonalGroup n) 1 ≃*
      HomotopyGroup.Pi (k + 1) (OrthogonalGroup n) 1) := by
  sorry

/-- The degree-two Bott entry vanishes at the identity of `O(n)` for `n ≥ 4`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem orthogonalGroup_secondHomotopyGroup (n : ℕ) (hn : 4 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 2 (OrthogonalGroup n) 1) := by
  sorry

/-- The degree-three Bott entry is infinite cyclic at the identity of `O(n)` for `n ≥ 5`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem nonempty_orthogonalGroup_thirdHomotopyGroup (n : ℕ) (hn : 5 ≤ n) :
    Nonempty (HomotopyGroup.Pi 3 (OrthogonalGroup n) 1 ≃* Multiplicative ℤ) := by
  sorry

/-- The degree-four Bott entry vanishes at the identity of `O(n)` for `n ≥ 6`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem orthogonalGroup_fourthHomotopyGroup (n : ℕ) (hn : 6 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 4 (OrthogonalGroup n) 1) := by
  sorry

/-- The fifth homotopy group of `O(n)` at the identity vanishes for `n ≥ 7`, the
stable range of the degree-five zero entry in Bott's table (Bott, 1959, p.315; Hatcher, *Vector
Bundles and K-Theory*, Introduction, p.1; README Section 4B.8). -/
theorem orthogonalGroup_fifthHomotopyGroup (n : ℕ) (hn : 7 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 5 (OrthogonalGroup n) 1) := by
  sorry

/-- The sixth homotopy group of `O(n)` at the identity vanishes for `n ≥ 8`, the
stable range of the degree-six zero entry in Bott's table (Bott, 1959, p.315; Hatcher, *Vector
Bundles and K-Theory*, Introduction, p.1; README Section 4B.8). -/
theorem orthogonalGroup_sixthHomotopyGroup (n : ℕ) (hn : 8 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 6 (OrthogonalGroup n) 1) := by
  sorry

/-- The degree-seven Bott entry is infinite cyclic at the identity of `O(n)` for `n ≥ 9`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem nonempty_orthogonalGroup_seventhHomotopyGroup (n : ℕ) (hn : 9 ≤ n) :
    Nonempty (HomotopyGroup.Pi 7 (OrthogonalGroup n) 1 ≃* Multiplicative ℤ) := by
  sorry

/-- The degree-eight Bott entry is cyclic of order two at the identity of `O(n)` for
`n ≥ 10` (Bott, 1959, pp.314–315; README Section 4B.8). -/
theorem nonempty_orthogonalGroup_eighthHomotopyGroup (n : ℕ) (hn : 10 ≤ n) :
    Nonempty (HomotopyGroup.Pi 8 (OrthogonalGroup n) 1 ≃* Multiplicative (ZMod 2)) := by
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

/-! ## Layer 9: the fourth through sixth stable stems -/

/-- The fourth stable stem vanishes: for `n ≥ 6`, `π_{n+4}(S^n, x) = 0`
(Kervaire--Milnor, 1963, p.512, stable-group table; README Section 9.2). -/
theorem sphere_homotopyGroup_fourthStem (n : ℕ) (hn : 6 ≤ n) (x : Sphere n) :
    Subsingleton (HomotopyGroup.Pi (n + 4) (Sphere n) x) := by
  sorry

/-- The fifth stable stem vanishes: for `n ≥ 7`, `π_{n+5}(S^n, x) = 0`
(Kervaire--Milnor, 1963, p.512, stable-group table; README Section 9.2). -/
theorem sphere_homotopyGroup_fifthStem (n : ℕ) (hn : 7 ≤ n) (x : Sphere n) :
    Subsingleton (HomotopyGroup.Pi (n + 5) (Sphere n) x) := by
  sorry

/-- The sixth stem is cyclic of order two: for `n ≥ 8`, in the Freudenthal stable range,
`π_{n+6}(S^n) ≅ ℤ/2`, generated by the suspension of `ν²` (Toda, *Composition methods in homotopy
groups of spheres*, Proposition 5.11, p.46, for the 2-primary generator; Kervaire--Milnor, p.512, for the integral order; README Section 9.3). -/
theorem nonempty_sphere_homotopyGroup_sixthStem (n : ℕ) (hn : 8 ≤ n) (x : Sphere n) :
    Nonempty (HomotopyGroup.Pi (n + 6) (Sphere n) x ≃* Multiplicative (ZMod 2)) := by
  sorry

/-! ## Layer 9A: the seventh stable stem -/

/-- The seventh stem is cyclic of order 240: for `n ≥ 9`, in the Freudenthal stable range,
`π_{n+7}(S^n) ≅ ℤ/240` (Toda, Chapter XIV, stable-stem table, pp.186–191;
README Section 9A.1). -/
theorem nonempty_sphere_homotopyGroup_seventhStem (n : ℕ) (hn : 9 ≤ n) (x : Sphere n) :
    Nonempty (HomotopyGroup.Pi (n + 7) (Sphere n) x ≃* Multiplicative (ZMod 240)) := by
  sorry

/-- Exotic spheres in every dimension `4k + 3` with `k ≥ 1`: there is a smooth manifold
homeomorphic but not diffeomorphic to `S^(4k+3)`. The witness is the boundary of the negative E₈
plumbing of dimension `4k + 4`; it is homeomorphic to the sphere by the h-cobordism theorem and the
radial Alexander trick, and no diffeomorphism to the sphere exists because capping the plumbing
by a disc along one would give a closed almost-parallelizable manifold of signature `-8`
(Milnor, *Lectures on the h-cobordism theorem*, remark after Proposition B, p.109, in dimension
seven; README Sections 6B and 9A.4). The hypothesis `k ≥ 1` excludes dimension three, where the
E₈ boundary is a homology sphere with nontrivial fundamental group and so no witness. -/
theorem exists_homeomorph_isEmpty_diffeomorph_sphere (k : ℕ) (hk : 1 ≤ k) :
    ∃ (M : Type) (_ : TopologicalSpace M)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin (4 * k + 3))) M)
      (_ : IsManifold (𝓡 (4 * k + 3)) ∞ M) (_ : M ≃ₜ Sphere (4 * k + 3)),
      IsEmpty (M ≃ₘ⟮𝓡 (4 * k + 3), 𝓡 (4 * k + 3)⟯ Sphere (4 * k + 3)) := by
  sorry

/-! ## Layer 10: smooth recognition in dimension six -/

/-- Smooth recognition of `S⁶`, oriented: a compact Hausdorff second-countable boundaryless smooth
six-manifold `M` homotopy equivalent to `S⁶`, with an oriented atlas `A`, admits a diffeomorphism
onto `S⁶` carrying `A` into the orientation of any oriented atlas `B` of `S⁶` (Milnor, *Lectures on
the h-cobordism theorem*, §9, Proposition B, p.109, whose proof on p.110 combines Proposition A
with the Kervaire--Milnor--Wall bounding theorem; Kervaire--Milnor, *Groups of homotopy
spheres I*, 1963, p.504, where `Θ₆` has order one; README Section 10.4). -/
theorem smoothPoincareSix_oriented
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 6)) M] [IsManifold (𝓡 6) ∞ M]
    (A : Set (OpenPartialHomeomorph M (EuclideanSpace ℝ (Fin 6))))
    (hA : TauCeti.IsOrientedAtlas (𝓡 6) ∞ A)
    (B : Set (OpenPartialHomeomorph (Sphere 6) (EuclideanSpace ℝ (Fin 6))))
    (hB : TauCeti.IsOrientedAtlas (𝓡 6) ∞ B)
    (h : ContinuousMap.HomotopyEquiv M (Sphere 6)) :
    ∃ f : M ≃ₘ⟮𝓡 6, 𝓡 6⟯ Sphere 6, PreservesOrientedAtlases f A B := by
  sorry

/-- Smooth recognition of homotopy six-spheres as Mathlib's smooth Poincaré predicate
in dimension six (Milnor, *Lectures on the h-cobordism theorem*, §9, Proposition B, p. 109;
README §10.4). Compactness and second countability follow once the predicate supplies the
smooth structure and the homotopy equivalence (Hatcher, Proposition 3.29, p. 239). -/
theorem nonempty_diffeomorph_sphere_six
    (M : Type u) [TopologicalSpace M] [T2Space M] :
    ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 6 := by
  sorry

end TauCetiRoadmap.HomotopySpheres
