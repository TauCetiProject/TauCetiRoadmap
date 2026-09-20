import Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.GroupTheory.OrderOfElement

/-!
# ECM: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; discharging
all of them finishes neither a layer nor the roadmap.

The definitions pin the coefficient and scaled-doubling conventions. The projective
and executable correspondence interfaces are specified in the README and must be
built on the existing point API, not replaced by proposition-valued placeholders.
-/

namespace TauCetiRoadmap.ECM

/-- The monic model obtained from `B y² = x³ + A x² + x`. -/
def model {R : Type*} [CommRing R] (A B : R) : WeierstrassCurve R :=
  ⟨0, A * B, 0, B ^ 2, 0⟩

example {R : Type*} [CommRing R] (A B : R) :
    (model A B).Δ = 16 * B ^ 6 * (A ^ 2 - 4) := by
  sorry

/-- Raw coordinates; `(0,0)` is allowed as data, never as a projective point. -/
structure Pair (R : Type*) where
  x : R
  z : R

/-- Scaled doubling with `N / D = (A + 2) / 4`. -/
def double {R : Type*} [CommRing R] (N D : R) (P : Pair R) : Pair R :=
  let U := (P.x + P.z) ^ 2
  let V := (P.x - P.z) ^ 2
  let C := U - V
  ⟨D * U * V, C * (D * V + N * C)⟩

/-- Detection alone does not imply that the gcd is proper. -/
example (n t p : ℕ) (hp : p.Prime) (hpn : p ∣ n) (hpt : p ∣ t)
    (hproper : Nat.gcd t n < n) :
    1 < Nat.gcd t n ∧ Nat.gcd t n < n ∧ Nat.gcd t n ∣ n := by
  sorry

/-- The annihilation condition is order divisibility, including prime powers. -/
example {G : Type*} [AddGroup G] (P : G) (M : ℕ)
    (h : addOrderOf P ∣ M) : M • P = 0 := by
  sorry

end TauCetiRoadmap.ECM
