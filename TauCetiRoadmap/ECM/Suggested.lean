import Mathlib

/-!
# ECM: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states, against the
pinned Mathlib and Tau Ceti, the definitions that fix the roadmap's coefficient and
scaled-doubling conventions (milestones 1 and 4).

The projective and algorithmic correctness theorems (the Kummer-line identification of
milestone 3, the doubling and differential-addition theorems of milestone 4, the ladder,
stage-1, stage-2 and recovery theorems of milestones 5 and 9–12) are specified in the README
and are to be built on Mathlib's `W.toAffine.Point` group, not replaced by
proposition-valued placeholders.
-/

namespace TauCetiRoadmap.ECM

/-- The monic Weierstrass model `y'² = x'³ + AB x'² + B² x'` obtained from the Montgomery
equation `B y² = x³ + A x² + x` by `x' = Bx`, `y' = B²y`. -/
def model {R : Type*} [CommRing R] (A B : R) : WeierstrassCurve R :=
  ⟨0, A * B, 0, B ^ 2, 0⟩

/-- The discriminant of the Montgomery model is `16 B⁶ (A² − 4)`. -/
example {R : Type*} [CommRing R] (A B : R) :
    (model A B).Δ = 16 * B ^ 6 * (A ^ 2 - 4) := by
  simp only [model, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  ring

/-- Raw coordinates `(X, Z)` for `x = X / Z`; `(0, 0)` is allowed as data, never as a point
of the projective line. -/
structure Pair (R : Type*) where
  /-- The numerator coordinate. -/
  x : R
  /-- The denominator coordinate. -/
  z : R

/-- Scaled Montgomery doubling `(D U V, C (D V + N C))` with `U = (X + Z)²`, `V = (X − Z)²`,
`C = U − V`, for scalars with `N / D = (A + 2) / 4`. -/
def double {R : Type*} [CommRing R] (N D : R) (P : Pair R) : Pair R :=
  let U := (P.x + P.z) ^ 2
  let V := (P.x - P.z) ^ 2
  let C := U - V
  ⟨D * U * V, C * (D * V + N * C)⟩

end TauCetiRoadmap.ECM
