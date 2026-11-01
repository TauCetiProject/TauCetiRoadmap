import Mathlib
import TauCeti.Geometry.Manifold.Orientation

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

This file is not the roadmap: the roadmap is README.md. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

Stated here:

* real Bott periodicity for the orthogonal groups in the stable range (Stage 4B);
* the independently owned Bott base entries in degrees two through eight, in their stable
  ranges (Stage 4B); TopologicalKTheory T1.5a supplies components and degree one;
* the seventh stable stem, `π_{n+7}(S^n) ≅ ℤ/240` for `n ≥ 9` (Stage 9A);
* the sixth stable stem, in its unstable form `π_{n+6}(S^n) ≅ ℤ/2` for `n ≥ 8` (Stage 9);
* the standard sphere `S^n`, `n ≥ 1`, is smoothly parallelizable exactly for `n ∈ {1, 3, 7}`
  (Section 3C.5);
* smooth recognition in dimension six, oriented (Stage 10) and unoriented.

Not statable at the pins:

* the simply connected smooth h-cobordism theorem (Stage 1): the pins lack a full collared smooth
  cobordism carrier with boundary identifications, product collars and gluing data. Tau Ceti
  supplies the smooth boundary manifold and inclusion for finite-dimensional half-space models;
* `Theta_n` as a group and `Theta_6 = 0` (Stages 2 and 9): there is no connected sum of smooth
  manifolds and no h-cobordism relation at the pins (the h-cobordism class content of
  `Theta_6 = 0` is implied by the six-dimensional recognition theorem below);
* the stable stems as colimits, stable `J` and the Pontryagin--Thom isomorphism (Stages 3, 4C
  and 5): there is no suspension homomorphism on `HomotopyGroup` and no framed bordism group;
* the connected James equivalence and the EHP exact sequence (Sections 3B–3C): the pins lack
  the reduced word space, reduced pointed suspension and James–Hopf map;
* Hopf-invariant-one exclusion (Section 3C.5): the pins lack the pointed topological mapping
  cone and its integral cup-product Hopf invariant. The sphere-framing consequence is stated
  below on the native smooth tangent bundle;
* the almost-framed groups, `P_n`, the Wall groups `L_n` and the Kervaire--Milnor exact sequence
  (Stages 6 to 8): these need framed and almost-framed bordism and Wall forms and formations,
  none of which exists at the pins;
* `Theta_7 ≅ ℤ/28`, the Eells–Kuiper comparison of the negative E8 boundary with the
  quaternionic sphere-bundle model, and nonstandardness of every E8 boundary in dimension
  `4k-1`, `k > 1` (Stage 9A): these need the homotopy-sphere bordism quotient, plumbing
  and collared Spin fillings with their relative characteristic-number pairings. The pins
  do not supply those carriers; the seventh-stem statement below does not replace them.
-/

open scoped ContDiff Manifold

namespace TauCetiRoadmap.HomotopySpheres

universe u

/-- The standard sphere `S^n`, the unit sphere of `ℝ^{n+1}`, with Mathlib's smooth structure
modelled on `ℝ^n`. -/
abbrev Sphere (n : ℕ) := Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1

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

/-! ## Layer 3: parallelizable spheres -/

/-- The standard sphere `S^n` with `n ≥ 1` admits `n` smooth tangent vector fields that are
linearly independent at every point exactly when `n ∈ {1, 3, 7}` (Adams, *On the non-existence of
elements of Hopf invariant one*, 1960; Bott--Milnor and Kervaire, 1958; README Section 3C.5). -/
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
groups*, 1959; README Stage 4B). -/
theorem orthogonalGroup_bottPeriodicity (k n : ℕ) (hn : k + 11 ≤ n) :
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
theorem orthogonalGroup_thirdHomotopyGroup (n : ℕ) (hn : 5 ≤ n) :
    Nonempty (HomotopyGroup.Pi 3 (OrthogonalGroup n) 1 ≃* Multiplicative ℤ) := by
  sorry

/-- The degree-four Bott entry vanishes at the identity of `O(n)` for `n ≥ 6`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem orthogonalGroup_fourthHomotopyGroup (n : ℕ) (hn : 6 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 4 (OrthogonalGroup n) 1) := by
  sorry

/-- The fifth homotopy group of `O(n)` at the identity vanishes for `n ≥ 7`, the
stable range of the degree-five zero entry in Bott's table (README Stage 4B). -/
theorem orthogonalGroup_fifthHomotopyGroup (n : ℕ) (hn : 7 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 5 (OrthogonalGroup n) 1) := by
  sorry

/-- The sixth homotopy group of `O(n)` at the identity vanishes for `n ≥ 8`, the
stable range of the degree-six zero entry in Bott's table (README Stage 4B). -/
theorem orthogonalGroup_sixthHomotopyGroup (n : ℕ) (hn : 8 ≤ n) :
    Subsingleton (HomotopyGroup.Pi 6 (OrthogonalGroup n) 1) := by
  sorry

/-- The degree-seven Bott entry is infinite cyclic at the identity of `O(n)` for `n ≥ 9`
(Bott, 1959, p.315; README Section 4B.8). -/
theorem orthogonalGroup_seventhHomotopyGroup (n : ℕ) (hn : 9 ≤ n) :
    Nonempty (HomotopyGroup.Pi 7 (OrthogonalGroup n) 1 ≃* Multiplicative ℤ) := by
  sorry

/-- The degree-eight Bott entry is cyclic of order two at the identity of `O(n)` for
`n ≥ 10` (Bott, 1959, pp.314–315; README Section 4B.8). -/
theorem orthogonalGroup_eighthHomotopyGroup (n : ℕ) (hn : 10 ≤ n) :
    Nonempty (HomotopyGroup.Pi 8 (OrthogonalGroup n) 1 ≃* Multiplicative (ZMod 2)) := by
  sorry

/-! ## Layer 9: the sixth stable stem -/

/-- The sixth stem is cyclic of order two: for `n ≥ 8`, in the Freudenthal stable range,
`π_{n+6}(S^n) ≅ ℤ/2`, generated by the suspension of `ν²` (Toda, *Composition methods in homotopy
groups of spheres*, Chapter XIV, table of `π_{n+k}(S^n)`; README Stage 9). -/
theorem sphere_homotopyGroup_sixthStem (n : ℕ) (hn : 8 ≤ n) (x : Sphere n) :
    Nonempty (HomotopyGroup.Pi (n + 6) (Sphere n) x ≃* Multiplicative (ZMod 2)) := by
  sorry

/-! ## Layer 9A: the seventh stable stem -/

/-- The seventh stem is cyclic of order 240: for `n ≥ 9`, in the Freudenthal stable range,
`π_{n+7}(S^n) ≅ ℤ/240` (Toda, Chapter XIV, stable-stem table; README Stage 9A). -/
theorem sphere_homotopyGroup_seventhStem (n : ℕ) (hn : 9 ≤ n) (x : Sphere n) :
    Nonempty (HomotopyGroup.Pi (n + 7) (Sphere n) x ≃* Multiplicative (ZMod 240)) := by
  sorry

/-! ## Layer 10: smooth recognition in dimension six -/

/-- Smooth recognition of `S⁶`, oriented: a compact Hausdorff second-countable boundaryless smooth
six-manifold `M` homotopy equivalent to `S⁶`, with an oriented atlas `A`, admits a diffeomorphism
onto `S⁶` carrying `A` into the orientation of any oriented atlas `B` of `S⁶` (Kervaire--Milnor,
*Groups of homotopy spheres I*, 1963, `Θ₆ = 0`, with Smale's h-cobordism theorem; README Stage 10). -/
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

/-- Smooth recognition of `S⁶`, unoriented: a compact Hausdorff second-countable boundaryless
smooth six-manifold homotopy equivalent to `S⁶` is diffeomorphic to `S⁶` (README Stage 10). -/
theorem smoothPoincareSix
    (M : Type u) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 6)) M] [IsManifold (𝓡 6) ∞ M]
    (h : ContinuousMap.HomotopyEquiv M (Sphere 6)) :
    Nonempty (M ≃ₘ⟮𝓡 6, 𝓡 6⟯ Sphere 6) := by
  sorry

end TauCetiRoadmap.HomotopySpheres
