import Mathlib
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic

/-!
# DG Floer theory, Part II: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Only the parts of Layer 1 item 4 (the rotation family at a fixed pole) and of Layer 4 item 3
(the finite-rank odd-sphere group) that rest on Mathlib and Tau Ceti today are prototyped. Abundance, covering by diffeomorphisms, the multiple-realization
theorem and the knotted-hypersurface theorem need the DG Morse and Floer carriers of the base
roadmap and the carriers of the suppliers named in `README.md`; they stay README targets. The
degree of the rotation family needs the base roadmap's homological degree interface and is a
README target for the same reason.
-/

namespace TauCetiRoadmap.DGFloerPartII

open scoped Topology ContDiff

/-! ## Layer 1: the rotation family at a fixed pole -/

/-- The unit tangent sphere `T¹_p Sⁿ` at `p ∈ Sⁿ ⊂ ℝⁿ⁺¹`: the unit vectors orthogonal to `p`. -/
abbrev UnitTangent (n : ℕ) (p : EuclideanSpace ℝ (Fin (n + 1))) : Type :=
  {v : EuclideanSpace ℝ (Fin (n + 1)) // ‖v‖ = 1 ∧ inner ℝ p v = 0}

/-- The rotation family of the second proof of Proposition 6.34 at the fixed pole `p`: a unit
tangent vector `v` at `p` and an angle `θ` give the point `cos θ · p + sin θ · v` of the great
circle through `p` in the direction `v`. -/
noncomputable def rotationFamily (n : ℕ) (p : EuclideanSpace ℝ (Fin (n + 1))) :
    UnitTangent n p × ℝ → EuclideanSpace ℝ (Fin (n + 1)) :=
  fun x ↦ Real.cos x.2 • p + Real.sin x.2 • (x.1 : EuclideanSpace ℝ (Fin (n + 1)))

theorem continuous_rotationFamily (n : ℕ) (p : EuclideanSpace ℝ (Fin (n + 1))) :
    Continuous (rotationFamily n p) := sorry

/-- For a unit vector `p` the family lands in the unit sphere `Sⁿ`. -/
theorem norm_rotationFamily (n : ℕ) {p : EuclideanSpace ℝ (Fin (n + 1))} (hp : ‖p‖ = 1)
    (x : UnitTangent n p × ℝ) : ‖rotationFamily n p x‖ = 1 := sorry

/-- The angle enters periodically, so the family descends to `T¹_p Sⁿ × S¹ → Sⁿ`. -/
theorem rotationFamily_add_two_pi (n : ℕ) (p : EuclideanSpace ℝ (Fin (n + 1)))
    (v : UnitTangent n p) (θ : ℝ) :
    rotationFamily n p (v, θ + 2 * Real.pi) = rotationFamily n p (v, θ) := sorry

/-- At the pole itself (`θ = 0`) every great circle passes through `p`. -/
theorem rotationFamily_zero (n : ℕ) (p : EuclideanSpace ℝ (Fin (n + 1))) (v : UnitTangent n p) :
    rotationFamily n p (v, 0) = p := sorry

/-! ## Layer 4: the finite-rank odd-sphere group and compact Lie groups -/

/-- `SO(n)`: the special orthogonal group of real `n × n` matrices, with the subspace topology of
the matrix space. -/
abbrev SO (n : ℕ) : Type := Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- `π₂(SO(3)) = 0`, the first low-rank value of Lemma 6.35. -/
theorem subsingleton_pi2_SO3 : Subsingleton (π_ 2 (SO 3) 1) := sorry

/-- `π₄(SO(5)) ≅ ℤ/2`. -/
theorem nonempty_pi4_SO5_mulEquiv : Nonempty (π_ 4 (SO 5) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₆(SO(7)) = 0`. -/
theorem subsingleton_pi6_SO7 : Subsingleton (π_ 6 (SO 7) 1) := sorry

/-- `π₈(SO(9)) ≅ (ℤ/2)²`: the corrected value of Lemma 6.35, whose printed `ℤ/4` is a source
error (README, Layer 4 item 3). -/
theorem nonempty_pi8_SO9_mulEquiv :
    Nonempty (π_ 8 (SO 9) 1 ≃* Multiplicative (ZMod 2 × ZMod 2)) := sorry

/-- `π₁₀(SO(11)) ≅ ℤ/2`. -/
theorem nonempty_pi10_SO11_mulEquiv :
    Nonempty (π_ 10 (SO 11) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₂(SO(13)) ≅ ℤ/2`. -/
theorem nonempty_pi12_SO13_mulEquiv :
    Nonempty (π_ 12 (SO 13) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₄(SO(15)) ≅ ℤ/2`. -/
theorem nonempty_pi14_SO15_mulEquiv :
    Nonempty (π_ 14 (SO 15) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- Lemma 6.35: for every odd `n ≥ 3`, written `n = k + 3`, the group `π_(n−1)(SO(n))` is torsion.
The finite-rank splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))` behind it, for
`n ≥ 17`, needs the stable orthogonal group and the Stiefel carrier of the README and is stated
there. -/
theorem isOfFinOrder_pi_SO (k : ℕ) (hk : Odd (k + 3))
    (x : π_ (k + 2) (SO (k + 3)) 1) : IsOfFinOrder x := sorry

end TauCetiRoadmap.DGFloerPartII
