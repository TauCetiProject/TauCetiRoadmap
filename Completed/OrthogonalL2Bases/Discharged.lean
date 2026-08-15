/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

import TauCeti.Analysis.InnerProductSpace.HilbertBasisMap
import TauCeti.Analysis.InnerProductSpace.L2.Pi
import TauCeti.Analysis.InnerProductSpace.L2.Product
import TauCeti.Analysis.InnerProductSpace.PolynomialCompleteness
import TauCeti.Analysis.InnerProductSpace.WeightedOrthogonalBasis
import TauCeti.Analysis.SpecialFunctions.Hermite.Orthogonality
import TauCeti.MeasureTheory.Function.WeightL2Isometry
import TauCeti.Probability.Distributions.Gaussian.Hermite.Basis
import TauCeti.Probability.Distributions.Gaussian.Hermite.MemLp
import TauCeti.Probability.Distributions.Gaussian.Hermite.Pi.Basis
import TauCeti.Probability.Moments.VanishingMoments
import TauCeti.RingTheory.Polynomial.Hermite.Derivative
import TauCeti.RingTheory.Polynomial.Hermite.GeneratingFunction
import TauCeti.RingTheory.Polynomial.Hermite.Real

/-!
# Discharge record — `OrthogonalL2Bases`

Every target of the sibling `Suggested.lean`, restated and closed by the Tau Ceti declaration
that realizes it. Definition targets are checked by type; theorem targets by application. If
this file elaborates, each target is discharged *by the kernel*, not by matching names or by
reading prose.

All 27 targets discharge against Tau Ceti `main` at `a7c87175` (2026-08-15); they also
discharged at `58d1ae1c` (08-14) and `ce9fe563` (08-11). Tau Ceti moved something under this
file twice in those four days, and both times the file stopped elaborating:

* 08-13: `hermite_generating_function` (T8) moved from the `TauCeti` namespace to `Polynomial`,
  tracking Kim Morrison's upstream adaptation in mathlib4#42724.
* 08-15: `Gaussian/Hermite/PiBasis.lean` became `Gaussian/Hermite/Pi/Basis.lean`, changing the
  import path (T26, T27); the declarations themselves were untouched.

Neither is a regression: the theorems are still there, still proved, still sorry-free, and each
change was correct. Each repair was one line. That is the reason to state a discharge record
this way rather than in prose, which would have gone on reporting the roadmap complete while
naming a declaration and an import path that no longer resolve.

This repository pins Tau Ceti at `86cc55d9` (08-13), between the two events, so the file cannot
be green against both the pin and `main`; it is written against `main`, and a forward bump of
the pin reconciles them. No compatibility shim is added to bridge the two.

Being under `Completed/`, this file sits outside the `TauCetiRoadmap.*` glob and so is **not
built by CI**, as `Completed/README.md` already notes for the archived `Suggested.lean`. It is
a snapshot pinned to the commit named above, not a live check. Given how fast the two events
above arrived, treat it as evidence of the state at archival and nothing stronger.

A hazard for anyone re-running it: after changing the pin, confirm the imported modules
actually *built* at the new revision. A stale `.olean` from the previous pin will let
`lake env lean` exit 0 on a file that cannot really elaborate.

Nine of the 27 targets reach their Tau Ceti counterpart under a different name, and three need
the roadmap's hypotheses genuinely weakened rather than merely renamed; both are noted inline
where they occur.
-/

open MeasureTheory ProbabilityTheory Polynomial Real
open scoped NNReal ENNReal

variable {𝕜 : Type*} [RCLike 𝕜]

/-! ## Part 0 — weight ↔ measure isometry + basis transport -/

-- T1. `weightL2Isometry` (def)
noncomputable example {α : Type*} [MeasurableSpace α] (μ : Measure α) (w : α → ℝ)
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) :
    Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x))) ≃ₗᵢ[𝕜] Lp 𝕜 2 μ :=
  TauCeti.weightL2Isometry μ w hwpos hwm

-- T2. `weightL2Isometry_apply`
example {α : Type*} [MeasurableSpace α] (μ : Measure α) (w : α → ℝ)
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ)
    (f : Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x)))) :
    TauCeti.weightL2Isometry (𝕜 := 𝕜) μ w hwpos hwm f =ᵐ[μ] fun x => Real.sqrt (w x) • f x :=
  TauCeti.weightL2Isometry_apply μ w hwpos hwm f

-- T3. `weightL2Isometry_symm_apply`
example {α : Type*} [MeasurableSpace α] (μ : Measure α) (w : α → ℝ)
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (g : Lp 𝕜 2 μ) :
    (TauCeti.weightL2Isometry (𝕜 := 𝕜) μ w hwpos hwm).symm g
      =ᵐ[μ] fun x => (Real.sqrt (w x))⁻¹ • g x :=
  TauCeti.weightL2Isometry_symm_apply μ w hwpos hwm g

-- T4. `HilbertBasis.mapₗᵢ` (def)
noncomputable example {ι : Type*} {E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
    (b : HilbertBasis ι 𝕜 E) (e : E ≃ₗᵢ[𝕜] F) : HilbertBasis ι 𝕜 F :=
  b.mapₗᵢ e

-- T5. `HilbertBasis.mapₗᵢ_apply`
example {ι : Type*} {E F : Type*}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
    (b : HilbertBasis ι 𝕜 E) (e : E ≃ₗᵢ[𝕜] F) (i : ι) :
    (b.mapₗᵢ e) i = e (b i) :=
  HilbertBasis.mapₗᵢ_apply b e i

/-! ## Part A1 — Hermite polynomial API -/

-- T6. `derivative_hermite_succ`
example (n : ℕ) : derivative (hermite (n + 1)) = (n + 1) • hermite n :=
  Polynomial.derivative_hermite_succ n

-- T7. `integrable_aeval_mul_gaussian`
example (p : ℤ[X]) :
    Integrable (fun x : ℝ => aeval x p * Real.exp (-(x ^ 2 / 2))) :=
  TauCeti.integrable_aeval_mul_gaussian p

-- T8. `hermite_generating_function`
-- Moved from the `TauCeti` namespace to `Polynomial` on 2026-08-13, tracking Kim Morrison's
-- upstream adaptation in mathlib4#42724.
example (x t : ℝ) :
    ∑' n : ℕ, aeval x (hermite n) * t ^ n / (n.factorial : ℝ) = Real.exp (x * t - t ^ 2 / 2) :=
  Polynomial.hermite_generating_function x t

-- T9. `integral_hermite_mul_hermite_gaussianReal`
example (m n : ℕ) :
    (∫ x, aeval x (hermite m) * aeval x (hermite n) ∂(gaussianReal 0 1))
      = if m = n then (n.factorial : ℝ) else 0 :=
  TauCeti.integral_hermite_mul_hermite_gaussianReal m n

/-! ## Part B1 — completeness toolkit (moment determinacy) -/

-- T10. `ae_eq_zero_of_forall_moment_eq_zero`.
-- TauCeti states this for an arbitrary `ν : Measure ℝ` and needs only *one* finite exponential
-- moment, so the roadmap's `volume` / all-rates form follows by instantiation at `a = 1`.
example (g : ℝ → ℝ)
    (hexp : ∀ a : ℝ, 0 ≤ a → Integrable (fun x : ℝ => Real.exp (a * |x|) * g x) volume)
    (hmom : ∀ n : ℕ, ∫ x : ℝ, x ^ n * g x = 0) :
    g =ᵐ[volume] 0 :=
  TauCeti.ae_eq_zero_of_forall_moment_eq_zero g ⟨1, one_pos, hexp 1 zero_le_one⟩ hmom

-- T11. `ae_eq_zero_of_forall_moment_eq_zero_of_finite_expMoments`
example {ν : Measure ℝ}
    (hexp : ∀ a : ℝ, 0 ≤ a → Integrable (fun x : ℝ => Real.exp (a * |x|)) ν)
    {g : ℝ → 𝕜} (hg : MemLp g 2 ν)
    (hmom : ∀ n : ℕ, ∫ x, (algebraMap ℝ 𝕜 x) ^ n * g x ∂ν = 0) :
    g =ᵐ[ν] 0 :=
  TauCeti.ae_eq_zero_of_forall_moment_eq_zero_of_finite_expMoments hexp hg hmom

/-! ## Part B2 — orthogonality relation → Hilbert basis

TauCeti generalizes this block from a polynomial family `p : ℕ → Polynomial ℝ` on `ℝ` to an
arbitrary family `f : ℕ → α → ℝ` on an arbitrary measurable space, so every roadmap target here
is the instance `f := fun n x => (p n).eval x`. The orthonormality-side targets additionally
weaken `0 < w` a.e. to `0 ≤ w` a.e. -/

section WeightedBridge
variable (p : ℕ → Polynomial ℝ) (w : ℝ → ℝ) (c : ℕ → ℝ)

/-- The roadmap's `barePolyLp`, as the polynomial instance of TauCeti's `bareNormalizedLp`. -/
noncomputable abbrev barePolyLp {μ : Measure ℝ}
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x)))) (n : ℕ) :
    Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x))) :=
  TauCeti.bareNormalizedLp (𝕜 := 𝕜) (fun n x => (p n).eval x) w c hmem n

-- T12. `barePolyLp` (def) — the roadmap type, realized by the abbreviation above.
noncomputable example {μ : Measure ℝ}
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x)))) (n : ℕ) :
    Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x))) :=
  barePolyLp p w c hmem n

-- T13. `orthonormal_barePolyLp`
example {μ : Measure ℝ}
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (horth : ∀ m n, (∫ x, (p m).eval x * (p n).eval x * w x ∂μ) = if m = n then c n else 0)
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x)))) :
    Orthonormal 𝕜 (barePolyLp (𝕜 := 𝕜) p w c hmem) :=
  TauCeti.orthonormal_bareNormalizedLp (fun n x => (p n).eval x) w c
    (hwpos.mono fun _ hx => hx.le) hwm hc horth hmem

-- T14. `barePolyLp_ortho_eq_bot`.
-- TauCeti needs neither `hwpos` nor `hwm`, and only *one* finite exponential moment.
example {μ : Measure ℝ}
    (_hwpos : ∀ᵐ x ∂μ, 0 < w x) (_hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (hdeg : ∀ n, (p n).degree = (n : WithBot ℕ))
    (hexp : ∀ a : ℝ, 0 ≤ a →
      Integrable (fun x : ℝ => Real.exp (a * |x|)) (μ.withDensity (fun x => ENNReal.ofReal (w x))))
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x)))) :
    (Submodule.span 𝕜 (Set.range (barePolyLp (𝕜 := 𝕜) p w c hmem)))ᗮ = ⊥ :=
  TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot p w c hdeg hc
    ⟨1, one_pos, hexp 1 zero_le_one⟩ hmem

-- T15. `hilbertBasisOfWeightedMeasure` (def)
noncomputable example {μ : Measure ℝ}
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (horth : ∀ m n, (∫ x, (p m).eval x * (p n).eval x * w x ∂μ) = if m = n then c n else 0)
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x))))
    (hcomplete : (Submodule.span 𝕜 (Set.range (barePolyLp (𝕜 := 𝕜) p w c hmem)))ᗮ = ⊥) :
    HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x)))) :=
  TauCeti.hilbertBasisOfWeightedMeasure (fun n x => (p n).eval x) w c
    (hwpos.mono fun _ hx => hx.le) hwm hc horth hmem hcomplete

-- T16. `hilbertBasisOfOrthogonalSystem` (def)
noncomputable example {μ : Measure ℝ}
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (horth : ∀ m n, (∫ x, (p m).eval x * (p n).eval x * w x ∂μ) = if m = n then c n else 0)
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x))))
    (hcomplete : (Submodule.span 𝕜 (Set.range (barePolyLp (𝕜 := 𝕜) p w c hmem)))ᗮ = ⊥) :
    HilbertBasis ℕ 𝕜 (Lp 𝕜 2 μ) :=
  TauCeti.hilbertBasisOfOrthogonalSystem (fun n x => (p n).eval x) w c hwpos hwm hc horth hmem
    hcomplete

-- T17. `coe_hilbertBasisOfWeightedMeasure`
example {μ : Measure ℝ}
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (horth : ∀ m n, (∫ x, (p m).eval x * (p n).eval x * w x ∂μ) = if m = n then c n else 0)
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x))))
    (hcomplete : (Submodule.span 𝕜 (Set.range (barePolyLp (𝕜 := 𝕜) p w c hmem)))ᗮ = ⊥) :
    ⇑(TauCeti.hilbertBasisOfWeightedMeasure (fun n x => (p n).eval x) w c
        (hwpos.mono fun _ hx => hx.le) hwm hc horth hmem hcomplete)
      = barePolyLp (𝕜 := 𝕜) p w c hmem :=
  TauCeti.coe_hilbertBasisOfWeightedMeasure (fun n x => (p n).eval x) w c
    (hwpos.mono fun _ hx => hx.le) hwm hc horth hmem hcomplete

-- T18. `coe_hilbertBasisOfOrthogonalSystem`
example {μ : Measure ℝ}
    (hwpos : ∀ᵐ x ∂μ, 0 < w x) (hwm : AEMeasurable w μ) (hc : ∀ n, 0 < c n)
    (horth : ∀ m n, (∫ x, (p m).eval x * (p n).eval x * w x ∂μ) = if m = n then c n else 0)
    (hmem : ∀ n, MemLp (fun x => (algebraMap ℝ 𝕜) ((p n).eval x / Real.sqrt (c n))) 2
      (μ.withDensity (fun x => ENNReal.ofReal (w x))))
    (hcomplete : (Submodule.span 𝕜 (Set.range (barePolyLp (𝕜 := 𝕜) p w c hmem)))ᗮ = ⊥) (n : ℕ) :
    TauCeti.hilbertBasisOfOrthogonalSystem (fun n x => (p n).eval x) w c hwpos hwm hc horth hmem
        hcomplete n
      = TauCeti.weightL2Isometry μ w hwpos hwm (barePolyLp (𝕜 := 𝕜) p w c hmem n) :=
  TauCeti.coe_hilbertBasisOfOrthogonalSystem (fun n x => (p n).eval x) w c hwpos hwm hc horth
    hmem hcomplete n

end WeightedBridge

/-! ## Part A3 — the Gaussian Hermite basis -/

-- T19. `hermiteℝ` (def)
noncomputable example (n : ℕ) : Polynomial ℝ := TauCeti.hermiteℝ n

-- The roadmap specifies the body `(hermite n).map (Int.castRingHom ℝ)`; `hermiteℝ` is not an
-- exposed definition, so check the identity extensionally instead of by `rfl`.
example (n : ℕ) : TauCeti.hermiteℝ n = (hermite n).map (Int.castRingHom ℝ) :=
  Polynomial.funext fun x => by simp [Polynomial.eval_map, Polynomial.aeval_def]

-- T20. `gaussianHermiteHilbertBasis` (def)
noncomputable example : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (gaussianReal 0 1)) :=
  TauCeti.gaussianHermiteHilbertBasis 𝕜

-- T21. `coe_gaussianHermiteHilbertBasis`
example (n : ℕ) :
    ⇑(TauCeti.gaussianHermiteHilbertBasis 𝕜 n) =ᵐ[gaussianReal 0 1]
      fun x => (algebraMap ℝ 𝕜) (aeval x (hermite n) / Real.sqrt (n.factorial)) :=
  TauCeti.coeFn_gaussianHermiteHilbertBasis 𝕜 n

-- T22. `memLp_hermite_gaussianReal`
example (n : ℕ) (v : ℝ≥0) :
    MemLp (fun x => (algebraMap ℝ 𝕜) (aeval x (hermite n) / Real.sqrt (n.factorial))) 2
      (gaussianReal 0 v) :=
  TauCeti.memLp_hermite_gaussianReal n v

/-! ## Part B3 — product / pi bases + the Gaussian multi-d instance -/

section Product
variable {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
  {μ : Measure α} {ν : Measure β} [SigmaFinite μ] [SigmaFinite ν]

-- T23. `prodHilbertBasis` (def)
noncomputable example {ι₁ ι₂ : Type*}
    (b₁ : HilbertBasis ι₁ 𝕜 (Lp 𝕜 2 μ)) (b₂ : HilbertBasis ι₂ 𝕜 (Lp 𝕜 2 ν)) :
    HilbertBasis (ι₁ × ι₂) 𝕜 (Lp 𝕜 2 (μ.prod ν)) :=
  TauCeti.prodHilbertBasis b₁ b₂

-- T24. `prodHilbertBasis_apply` (the roadmap's a.e.-product form)
example {ι₁ ι₂ : Type*}
    (b₁ : HilbertBasis ι₁ 𝕜 (Lp 𝕜 2 μ)) (b₂ : HilbertBasis ι₂ 𝕜 (Lp 𝕜 2 ν)) (i : ι₁) (j : ι₂) :
    ⇑(TauCeti.prodHilbertBasis b₁ b₂ (i, j)) =ᵐ[μ.prod ν] fun q => (b₁ i) q.1 * (b₂ j) q.2 :=
  TauCeti.coeFn_prodHilbertBasis b₁ b₂ i j

end Product

-- T25. `piHilbertBasis` (def)
noncomputable example
    {ι : Type*} [Fintype ι] {α : ι → Type*} [∀ i, MeasurableSpace (α i)]
    {μ : ∀ i, Measure (α i)} [∀ i, SigmaFinite (μ i)] {κ : ι → Type*}
    (b : ∀ i, HilbertBasis (κ i) 𝕜 (Lp 𝕜 2 (μ i))) :
    HilbertBasis (∀ i, κ i) 𝕜 (Lp 𝕜 2 (Measure.pi μ)) :=
  TauCeti.piHilbertBasis b

-- T26. `gaussianHermitePiBasis` (def)
noncomputable example (ι : Type*) [Fintype ι] :
    HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi (fun _ : ι => gaussianReal 0 1))) :=
  TauCeti.gaussianHermitePiBasis 𝕜 ι

-- T27. `coe_gaussianHermitePiBasis`
example (ι : Type*) [Fintype ι] (a : ι → ℕ) :
    ⇑(TauCeti.gaussianHermitePiBasis 𝕜 ι a)
      =ᵐ[Measure.pi (fun _ : ι => gaussianReal 0 1)]
        fun x => ∏ i, (algebraMap ℝ 𝕜) (aeval (x i) (hermite (a i)) / Real.sqrt ((a i).factorial)) :=
  TauCeti.coeFn_gaussianHermitePiBasis 𝕜 ι a
