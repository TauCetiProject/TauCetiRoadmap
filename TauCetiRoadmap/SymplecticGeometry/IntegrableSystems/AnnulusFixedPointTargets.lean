import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.LinearAlgebra.Determinant
import Mathlib.Topology.OpenPartialHomeomorph.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

The standard-area strict annulus theorem in lifted collar coordinates.
The README also constructs area normalization, collar extensions, twist
factorization and the finite-action critical-point bound. The target below
allows degenerate fixed points and does not assume an interior twist.
-/

namespace TauCetiRoadmap.SymplecticGeometry.AnnulusFixedPoints

open scoped ContDiff

abbrev Plane := ℝ × ℝ

/-- The closed strip covering the compact annulus. -/
def strip : Set Plane := {p | p.2 ∈ Set.Icc 0 1}

/-- A half-open fundamental domain for interior annulus points. -/
def interiorFundamentalDomain : Set Plane :=
  {p | p.1 ∈ Set.Ico 0 1 ∧ p.2 ∈ Set.Ioo 0 1}

/-- Two distinct zero-displacement fixed points of a chosen annulus lift.
Representatives in one half-open fundamental domain are distinct annulus
points, rather than two integer translates of the same point. -/
theorem strict_annulus_two_fixed_points (F : OpenPartialHomeomorph Plane Plane)
    (hsource : strip ⊆ F.source) (htarget : strip ⊆ F.target)
    (hsmooth : ContDiffOn ℝ ∞ F F.source)
    (hinverse : ContDiffOn ℝ ∞ F.symm F.target)
    (hstrip : Set.MapsTo F strip strip)
    (hstrip_inv : Set.MapsTo F.symm strip strip)
    (hdeck : ∀ p ∈ strip, F (p.1 + 1, p.2) = ((F p).1 + 1, (F p).2))
    (harea : ∀ p ∈ strip, LinearMap.det (fderiv ℝ F p).toLinearMap = 1)
    (hlower : ∀ x : ℝ, (F (x, 0)).2 = 0 ∧ (F (x, 0)).1 < x)
    (hupper : ∀ x : ℝ, (F (x, 1)).2 = 1 ∧ x < (F (x, 1)).1) :
    ∃ p ∈ interiorFundamentalDomain, ∃ q ∈ interiorFundamentalDomain,
      p ≠ q ∧ F p = p ∧ F q = q := by
  sorry

end TauCetiRoadmap.SymplecticGeometry.AnnulusFixedPoints
