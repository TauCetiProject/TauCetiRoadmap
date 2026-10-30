import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
Suggested target forms, not an exhaustive checklist. The README is definitive.
RQFT1.MassivePrescriptions uses delta-normalized inverses with physical Fourier
phase +iη(p,x). These statements pin the boundary pairings and shell constants;
their analytic proofs are future work.
-/

noncomputable section
open Filter MeasureTheory
open scoped SchwartzMap Topology BigOperators

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory.MassivePrescriptions

abbrev Momentum := EuclideanSpace ℝ (Fin 4)
abbrev Spatial := EuclideanSpace ℝ (Fin 3)
abbrev Test := 𝓢(Momentum, ℂ)
abbrev Distribution := 𝓢'(Momentum, ℂ)

/-- Physical time-first mass shell in the angular momentum variable. -/
def shellPoint (m : ℝ) (positive : Bool) (k : Spatial) : Momentum :=
  WithLp.toLp 2 (Fin.cases
    ((if positive then 1 else -1) * Real.sqrt (‖k‖ ^ 2 + m ^ 2)) k)

/-- D± = θ(±p0)δ(q-m²); unlike W±, these contain no 2π factor. -/
def shellPairing (m : ℝ) (positive : Bool) (f : Test) : ℂ :=
  ∫ k : Spatial, f (shellPoint m positive k) /
    ((2 * Real.sqrt (‖k‖ ^ 2 + m ^ 2) : ℝ) : ℂ)

/-- Indices 0,1,2,3 mean retarded, advanced, Feynman, anti-Feynman. -/
def poleDenominator (m : ℝ) (i : Fin 4) (ε : ℝ) (p : Momentum) : ℂ :=
  let w2 : ℝ := (∑ j : Fin 3, (p j.succ) ^ 2) + m ^ 2
  if i = 0 then ((p 0 : ℂ) + Complex.I * ε) ^ 2 - w2
  else if i = 1 then ((p 0 : ℂ) - Complex.I * ε) ^ 2 - w2
  else if i = 2 then (p 0 : ℂ) ^ 2 - w2 + Complex.I * ε
  else (p 0 : ℂ) ^ 2 - w2 - Complex.I * ε

/-- The minus sign makes the eventual kernel solve P G=δ. -/
def regularizedPairing (m : ℝ) (i : Fin 4) (ε : ℝ) (f : Test) : ℂ :=
  ∫ p : Momentum, -(poleDenominator m i ε p)⁻¹ * f p

/-- Continuity is part of constructing the shell distributions. -/
theorem exists_shell_distributions (m : ℝ) (hm : 0 < m) :
    ∃ D : Bool → Distribution, ∀ positive f, D positive f = shellPairing m positive f := by
  sorry

/-- The boundary values are actual continuous complex-linear Schwartz functionals. -/
theorem exists_prescription_distributions (m : ℝ) (hm : 0 < m) :
    ∃ G : Fin 4 → Distribution, ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f)) := by
  sorry

/-- The common-source affine relation and the two frequency jumps. -/
theorem prescription_relations (m : ℝ) (hm : 0 < m) (G : Fin 4 → Distribution)
    (hG : ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f))) :
    G 0 + G 1 = G 2 + G 3 ∧
      (∀ f, G 2 f - G 1 f = (2 * Real.pi * Complex.I) * shellPairing m true f) ∧
      (∀ f, G 2 f - G 0 f = (2 * Real.pi * Complex.I) * shellPairing m false f) := by
  sorry

/-- The two mass-shell components give independent homogeneous solutions. -/
theorem shell_pairings_independent (m : ℝ) (hm : 0 < m) (a b : ℂ)
    (h : ∀ f : Test, a * shellPairing m true f + b * shellPairing m false f = 0) :
    a = 0 ∧ b = 0 := by
  sorry

end TauCetiRoadmap.RelativisticQuantumFieldTheory.MassivePrescriptions
