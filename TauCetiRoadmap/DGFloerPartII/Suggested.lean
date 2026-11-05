module

public import Mathlib

/-!
# DG Floer theory, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

Statable at the pins: the torsion group `π_(n−1)(SO(n))` of 4.3 (Lemma 6.35 of the source), on the
carrier `SO n = Matrix.specialOrthogonalGroup (Fin n) ℝ` with the subtype topology of the matrix
space and Mathlib's cubical homotopy groups `π_ n X x`: the seven low-rank values and the torsion
statement for every odd `n ≥ 3`.

Not statable at the pins, and stated in the README only: Theorem B (3.3) and Theorems G and H
(4.6, 4.1), which need the DG Morse and Floer carriers of the base roadmap; Theorem I and
Propositions 6.29–6.39 (4.2–4.5), which need `Diff(M)` with its `C^∞` topology, the mapping
spaces out of spheres and the fibered-family carriers; the degree `1 + (−1)^(n−1)` of the rotation
family of 1.4, which needs a mapping degree, absent from Mathlib and Tau Ceti at the pins.
-/

@[expose] public section

namespace TauCetiRoadmap.DGFloerPartII

open scoped Topology

/-! ## Layer 4: the torsion group `π_(n−1)(SO(n))` -/

/-- `SO(n)`: the special orthogonal group of real `n × n` matrices, with the subspace topology of
the matrix space. -/
abbrev SO (n : ℕ) : Type := Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- `π₂(SO(3)) = 0`, the first low-rank value of Lemma 6.35 (README 4.3), through the double
cover `S³ → SO(3)`. -/
theorem subsingleton_pi2_SO3 : Subsingleton (π_ 2 (SO 3) 1) := sorry

/-- `π₄(SO(5)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi4_SO5_mulEquiv : Nonempty (π_ 4 (SO 5) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₆(SO(7)) = 0` (README 4.3). -/
theorem subsingleton_pi6_SO7 : Subsingleton (π_ 6 (SO 7) 1) := sorry

/-- `π₈(SO(9)) ≅ (ℤ/2)²`: the stabilization `π₈(SO(9)) → π₈(SO) = ℤ/2` is split with kernel
`ℤ/2` (Crowley–Schick–Steimle, proof of Lemma 2.2; README 4.3). -/
theorem nonempty_pi8_SO9_mulEquiv :
    Nonempty (π_ 8 (SO 9) 1 ≃* Multiplicative (ZMod 2 × ZMod 2)) := sorry

/-- `π₁₀(SO(11)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi10_SO11_mulEquiv :
    Nonempty (π_ 10 (SO 11) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₂(SO(13)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi12_SO13_mulEquiv :
    Nonempty (π_ 12 (SO 13) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- `π₁₄(SO(15)) ≅ ℤ/2` (README 4.3). -/
theorem nonempty_pi14_SO15_mulEquiv :
    Nonempty (π_ 14 (SO 15) 1 ≃* Multiplicative (ZMod 2)) := sorry

/-- Lemma 6.35: for every odd `n ≥ 3`, written `n = k + 3`, the group `π_(n−1)(SO(n))` is torsion.
The stable-plus-Stiefel splitting `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))` behind it, for
`n ≥ 17`, needs the stable orthogonal group and the Stiefel carrier of the README and is stated
there (README 4.3). -/
theorem isOfFinOrder_pi_SO (k : ℕ) (hk : Odd (k + 3))
    (x : π_ (k + 2) (SO (k + 3)) 1) : IsOfFinOrder x := sorry

end TauCetiRoadmap.DGFloerPartII
