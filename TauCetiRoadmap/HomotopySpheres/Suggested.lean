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
  `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` at `n = 6` for compact
  second-countable `M`.

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
* the stable stems as colimits, stable `J` and the Pontryagin--Thom isomorphism (Layer 3,
  Section 4C and Layer 5): there is no suspension homomorphism on `HomotopyGroup` and no
  framed bordism group;
* the connected James equivalence, the James splitting after one suspension and the EHP exact
  sequence (Sections 3B–3C): the pins lack the reduced word space, reduced pointed suspension
  and James–Hopf map, and the stable form of the splitting also needs a stable category of
  spectra with a suspension spectrum functor;
* Hopf-invariant-one exclusion (Section 3C.5): the pins lack the pointed topological mapping
  cone and its integral cup-product Hopf invariant. The sphere-framing consequence is stated
  below on the native smooth tangent bundle;
* the almost-framed groups, `P_n`, the Wall groups `L_n` and the Kervaire--Milnor exact sequence
  (Layers 6 to 8): these need framed and almost-framed bordism and Wall forms and formations,
  none of which exists at the pins;
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
groups of spheres*, Proposition 5.11, p.46, for the 2-primary generator, cited as
uncertified; Kervaire--Milnor, p.512, for the integral order; README Section 9.3). -/
theorem nonempty_sphere_homotopyGroup_sixthStem (n : ℕ) (hn : 8 ≤ n) (x : Sphere n) :
    Nonempty (HomotopyGroup.Pi (n + 6) (Sphere n) x ≃* Multiplicative (ZMod 2)) := by
  sorry

/-! ## Layer 9A: the seventh stable stem -/

/-- The seventh stem is cyclic of order 240: for `n ≥ 9`, in the Freudenthal stable range,
`π_{n+7}(S^n) ≅ ℤ/240` (Toda, Chapter XIV, stable-stem table, pp.186–191, cited as uncertified;
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

/-- Smooth recognition of `S⁶`, unoriented, as Mathlib's smooth Poincaré predicate in dimension
six: if a compact Hausdorff second-countable space `M` is homotopy equivalent to `S⁶`, every
boundaryless smooth six-dimensional structure on `M` admits a diffeomorphism onto `S⁶`
(Milnor, *Lectures on the h-cobordism theorem*, §9, Proposition B, p.109; README Section 10.4).
For a Hausdorff space with a six-dimensional chart structure, compactness and second
countability already follow from the homotopy equivalence (Hatcher, *Algebraic Topology*,
Proposition 3.29, p.239); they are hypotheses because the route of Sections 10.1–10.3 uses
them. -/
theorem nonempty_diffeomorph_sphere_six
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M] :
    ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 6 := by
  sorry

end TauCetiRoadmap.HomotopySpheres
