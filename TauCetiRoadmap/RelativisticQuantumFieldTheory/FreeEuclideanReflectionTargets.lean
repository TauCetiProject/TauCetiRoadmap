/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Group.Measure
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
This file is not the roadmap and is not exhaustive. The README is definitive.
These targets pin RQFT7.FreeReflection's angular Fourier and massive-shell
normalizations on native Schwartz and L² carriers. Analytic proofs are targets.
-/

noncomputable section

open MeasureTheory
open scoped SchwartzMap ComplexConjugate

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory.FreeReflection

abbrev Spatial := EuclideanSpace ℝ (Fin 3)
/-- Expose the native product-Haar instance through the volume definition. -/
local instance : (volume : Measure (ℝ × Spatial)).IsAddHaarMeasure := by
  change (volume.prod volume : Measure (ℝ × Spatial)).IsAddHaarMeasure
  infer_instance

abbrev EuclideanTest := 𝓢(ℝ × Spatial, ℂ)

/-- Schwartz tests flat on the closed nonpositive-time half-space. -/
def positiveTimeTests : Submodule ℂ EuclideanTest where
  carrier := {f | ∀ z, z.1 ≤ 0 → f z = 0}
  zero_mem' := by simp
  add_mem' := by
    intro f g hf hg z hz
    simp [hf z hz, hg z hz]
  smul_mem' := by
    intro c f hf z hz
    simp [hf z hz]

abbrev PositiveTest := positiveTimeTests

/-- Massive dispersion in the angular momentum variable p = 2πξ. -/
def omega (m : ℝ) (p : Spatial) : ℝ := Real.sqrt (‖p‖ ^ 2 + m ^ 2)

/-- RQFT3's scalar shell measure in its spatial chart. -/
def shellMeasure (m : ℝ) : Measure Spatial :=
  volume.withDensity fun p => ENNReal.ofReal (((2 * Real.pi) ^ 3 * (2 * omega m p))⁻¹)

abbrev OneParticle (m : ℝ) := Lp ℂ 2 (shellMeasure m)

/-- Unnormalized negative-phase spatial Fourier transform. -/
def spatialFourier (f : EuclideanTest) (t : ℝ) (p : Spatial) : ℂ :=
  ∫ x : Spatial, Complex.exp (-(inner ℝ x p : ℂ) * Complex.I) * f (t, x)

/-- Positive-time Laplace transform of the spatial Fourier transform. -/
def laplaceSpatial (m : ℝ) (f : PositiveTest) (p : Spatial) : ℂ :=
  ∫ t in Set.Ioi (0 : ℝ),
    (Real.exp (-omega m p * t) : ℂ) * spatialFourier f.val t p

/-- Actual native L² membership is required before forming the quotient vector. -/
theorem memLp_laplaceSpatial (m : ℝ) (hm : 0 < m) (f : PositiveTest) :
    MemLp (laplaceSpatial m f) 2 (shellMeasure m) := by
  sorry

/-- Its representative is the specified transform, not an arbitrary L² vector. -/
def toOneParticle (m : ℝ) (hm : 0 < m) (f : PositiveTest) : OneParticle m :=
  (memLp_laplaceSpatial m hm f).toLp (laplaceSpatial m f)

/-- The reflected two-time kernel after spatial Fourier transformation.
The README additionally requires its distributional agreement with G_m(θx-y). -/
def reflectedCovariance (m : ℝ) (f g : PositiveTest) : ℂ :=
  ∫ p : Spatial, (∫ t in Set.Ioi (0 : ℝ), ∫ s in Set.Ioi (0 : ℝ),
    conj (spatialFourier f.val t p) *
      (Real.exp (-omega m p * (t + s)) : ℂ) * spatialFourier g.val s p)
    ∂shellMeasure m

/-- Factorization with the invariant shell weight and a second-linear inner product. -/
theorem reflectedCovariance_eq_inner (m : ℝ) (hm : 0 < m) (f g : PositiveTest) :
    reflectedCovariance m f g = inner ℂ (toOneParticle m hm f) (toOneParticle m hm g) := by
  sorry

/-- Time Cauchy–Schwarz followed by angular spatial Plancherel. -/
theorem norm_toOneParticle_le (m : ℝ) (hm : 0 < m) (f : PositiveTest) :
    ‖toOneParticle m hm f‖ ≤ (2 * m)⁻¹ * ‖f.val.toLp 2 volume‖ := by
  sorry

/-- Every scalar one-particle vector is approximated by positive-time tests. -/
theorem denseRange_toOneParticle (m : ℝ) (hm : 0 < m) :
    DenseRange (toOneParticle m hm) := by
  sorry

end TauCetiRoadmap.RelativisticQuantumFieldTheory.FreeReflection
