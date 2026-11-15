/-
# Spectral steepest descent: suggested interfaces

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; discharging them
finishes neither a milestone nor the roadmap. The `sorry` proofs are targets, not completed results.
-/

import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import TauCeti.Analysis.InnerProductSpace.ContinuousFunctionalCalculus
import TauCeti.Analysis.InnerProductSpace.Polar.Finite
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Frobenius
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.KyFan
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.OpNorm

noncomputable section

open Filter Topology TauCeti

namespace TauCetiRoadmap.SpectralSteepestDescent

variable {𝕜 E F : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-! ## Layer 1: trace duality and the polar factor -/

/-- The real trace pairing `⟪A, B⟫ = re tr (A† B)` on linear maps `E → F`. -/
def traceInner (A B : E →ₗ[𝕜] F) : ℝ :=
  RCLike.re (LinearMap.trace 𝕜 E (LinearMap.adjoint A ∘ₗ B))

theorem traceInner_self (A : E →ₗ[𝕜] F) :
    traceInner A A = UnitarilyInvariantSeminorm.frobenius 𝕜 E F A ^ 2 := sorry

/-- Operator–nuclear duality: `|⟪D, A⟫| ≤ ‖D‖_op N₁(A)`. -/
theorem abs_traceInner_le (D A : E →ₗ[𝕜] F) :
    |traceInner D A| ≤
      UnitarilyInvariantSeminorm.opNorm 𝕜 E F D * UnitarilyInvariantSeminorm.nuclear 𝕜 E F A :=
  sorry

/-- The canonical polar factor attains the nuclear norm. -/
theorem traceInner_polarFactor (A : E →ₗ[𝕜] F) :
    traceInner A.polarFactor A = UnitarilyInvariantSeminorm.nuclear 𝕜 E F A := sorry

/-- The nuclear norm is the dual of the operator norm, attained at the polar factor. -/
theorem isGreatest_traceInner (A : E →ₗ[𝕜] F) :
    IsGreatest {r | ∃ D : E →ₗ[𝕜] F,
        UnitarilyInvariantSeminorm.opNorm 𝕜 E F D ≤ 1 ∧ traceInner D A = r}
      (UnitarilyInvariantSeminorm.nuclear 𝕜 E F A) := sorry

/-- The maximizers are the contractions that agree with the polar factor through the modulus. -/
theorem traceInner_eq_nuclear_iff {D A : E →ₗ[𝕜] F}
    (hD : UnitarilyInvariantSeminorm.opNorm 𝕜 E F D ≤ 1) :
    traceInner D A = UnitarilyInvariantSeminorm.nuclear 𝕜 E F A ↔ D ∘ₗ A.operatorAbs = A :=
  sorry

theorem polarFactor_ofReal_smul (A : E →ₗ[𝕜] F) {c : ℝ} (hc : 0 < c) :
    ((c : 𝕜) • A).polarFactor = A.polarFactor := sorry

/-! ### The Shampoo identity, over `ℝ` -/

variable {E' F' : Type*}
  [NormedAddCommGroup E'] [InnerProductSpace ℝ E'] [FiniteDimensional ℝ E']
  [NormedAddCommGroup F'] [InnerProductSpace ℝ F'] [FiniteDimensional ℝ F']

/-- `t ↦ t^(-1/4)` on `(0, ∞)`, extended by zero. -/
def shampooWeight (t : ℝ) : ℝ := if 0 < t then t ^ (-(1 / 4 : ℝ)) else 0

/-- Single-step Shampoo, `(A A†)^(-1/4) A (A† A)^(-1/4)`, is the canonical polar factor, with
no invertibility assumption. -/
theorem shampoo_eq_polarFactor (A : E' →ₗ[ℝ] F') :
    cfc shampooWeight (LinearMap.toContinuousLinearMap (A ∘ₗ LinearMap.adjoint A)) ∘L
        LinearMap.toContinuousLinearMap A ∘L
        cfc shampooWeight (LinearMap.toContinuousLinearMap (LinearMap.adjoint A ∘ₗ A)) =
      LinearMap.toContinuousLinearMap A.polarFactor := sorry

/-! ## Layer 2: nearest isometries -/

/-- Mirsky's inequality, in the form: any `k` of the differences `|σᵢ(A) − σᵢ(B)|` sum to at
most the Ky Fan `k`-sum of `A − B`. -/
theorem sum_abs_singularValues_sub_le_kyFanSum (A B : E →ₗ[𝕜] F) (k : ℕ) (s : Finset ℕ)
    (hs : s.card ≤ k) :
    ∑ i ∈ s, |A.singularValues i - B.singularValues i| ≤ (A - B).kyFanSum k := sorry

/-- Fan–Hoffman: a unitary extension of the polar factor is a nearest unitary in every unitarily
invariant seminorm. -/
theorem map_sub_le_map_sub_of_eqOn_polarFactor (N : UnitarilyInvariantSeminorm 𝕜 E F)
    (A : E →ₗ[𝕜] F) (W Q : E ≃ₗᵢ[𝕜] F)
    (hW : ∀ x ∈ (LinearMap.ker A)ᗮ, W x = A.polarFactor x) :
    N (A - (W : E →ₗ[𝕜] F)) ≤ N (A - (Q : E →ₗ[𝕜] F)) := sorry

/-- For injective `A`, the polar factor is the nearest isometric embedding in Frobenius norm. -/
theorem frobenius_sub_polarFactor_le (A : E →ₗ[𝕜] F) (hA : Function.Injective A)
    (V : E →ₗᵢ[𝕜] F) :
    UnitarilyInvariantSeminorm.frobenius 𝕜 E F (A - A.polarFactor) ≤
      UnitarilyInvariantSeminorm.frobenius 𝕜 E F (A - V.toLinearMap) := sorry

/-! ## Layer 3: odd polynomial iterations -/

/-- The odd polynomial step `X ↦ ∑ⱼ cⱼ X (X† X)ʲ`. -/
def oddStep {n : ℕ} (c : Fin n → ℝ) (X : E →ₗ[𝕜] F) : E →ₗ[𝕜] F :=
  ∑ j, ((c j : ℝ) : 𝕜) • (X ∘ₗ (LinearMap.adjoint X ∘ₗ X) ^ (j : ℕ))

/-- The scalar map `t ↦ ∑ⱼ cⱼ t^(2j+1)` that `oddStep c` applies to each singular value. -/
def oddScalar {n : ℕ} (c : Fin n → ℝ) (t : ℝ) : ℝ :=
  ∑ j, c j * t ^ (2 * (j : ℕ) + 1)

/-- Spectral form of the iterates: only the singular values move, by the scalar iterate. -/
theorem oddStep_iterate_eq {n : ℕ} (c : Fin n → ℝ) (k : ℕ) (X : E' →ₗ[ℝ] F') :
    LinearMap.toContinuousLinearMap ((oddStep c)^[k] X) =
      LinearMap.toContinuousLinearMap X.polarFactor ∘L
        cfc ((oddScalar c)^[k]) (LinearMap.toContinuousLinearMap X.operatorAbs) := sorry

/-- Convergence to the polar factor from scalar convergence on the nonzero singular values. -/
theorem tendsto_oddStep_iterate {n : ℕ} (c : Fin n → ℝ) (X : E →ₗ[𝕜] F)
    (h : ∀ i, X.singularValues i ≠ 0 →
      Tendsto (fun k ↦ (oddScalar c)^[k] (X.singularValues i)) atTop (𝓝 1)) :
    Tendsto (fun k ↦ LinearMap.toContinuousLinearMap ((oddStep c)^[k] X)) atTop
      (𝓝 (LinearMap.toContinuousLinearMap X.polarFactor)) := sorry

/-! ## Layer 4: scalar dynamics -/

/-- The cubic Newton–Schulz coefficients, `g(t) = (3t − t³)/2`. -/
def cubicCoeffs : Fin 2 → ℝ := ![3 / 2, -1 / 2]

/-- The quintic Newton–Schulz coefficients, `q(t) = (15t − 10t³ + 3t⁵)/8`. -/
def quinticCoeffs : Fin 3 → ℝ := ![15 / 8, -5 / 4, 3 / 8]

/-- Muon's tuned quintic coefficients `(3.4445, −4.7750, 2.0315)`, as exact rationals. -/
def muonCoeffs : Fin 3 → ℝ := ![34445 / 10000, -4775 / 1000, 20315 / 10000]

theorem tendsto_cubic_iterate {s : ℝ} (hs : s ∈ Set.Ioo 0 (Real.sqrt 3)) :
    Tendsto (fun k ↦ (oddScalar cubicCoeffs)^[k] s) atTop (𝓝 1) := sorry

theorem tendsto_quintic_iterate {s : ℝ} (hs : s ∈ Set.Ioc 0 1) :
    Tendsto (fun k ↦ (oddScalar quinticCoeffs)^[k] s) atTop (𝓝 1) := sorry

/-- No orbit of Muon's quintic converges to `1`: `1` is not a fixed point. -/
theorem not_tendsto_muon_iterate (s : ℝ) :
    ¬ Tendsto (fun k ↦ (oddScalar muonCoeffs)^[k] s) atTop (𝓝 1) := sorry

/-- The Muon band `[17/25, 5/4]` is invariant. -/
theorem mapsTo_muon_band :
    Set.MapsTo (oddScalar muonCoeffs) (Set.Icc (17 / 25) (5 / 4)) (Set.Icc (17 / 25) (5 / 4)) :=
  sorry

/-- Five Muon steps bring every `s ∈ [1/270, 5/4]` into the band. -/
theorem muon_iterate_five_mem_band {s : ℝ} (hs : s ∈ Set.Icc (1 / 270) (5 / 4)) :
    (oddScalar muonCoeffs)^[5] s ∈ Set.Icc (17 / 25) (5 / 4) := sorry

/-! ## Layer 5: steepest descent -/

/-- Muon's direction: `k` steps of its quintic from the Frobenius normalization. -/
def muonDirection (k : ℕ) (A : E →ₗ[𝕜] F) : E →ₗ[𝕜] F :=
  (oddStep muonCoeffs)^[k] ((((UnitarilyInvariantSeminorm.frobenius 𝕜 E F A)⁻¹ : ℝ) : 𝕜) • A)

/-- Five Muon steps: bounded operator norm, at least `17/25` of the nuclear norm, and within
`8/25` of the polar factor, when no nonzero singular value is below `‖A‖_F / 270`. -/
theorem muonDirection_five {A : E →ₗ[𝕜] F}
    (hA : ∀ i, A.singularValues i ≠ 0 →
      UnitarilyInvariantSeminorm.frobenius 𝕜 E F A / 270 ≤ A.singularValues i) :
    UnitarilyInvariantSeminorm.opNorm 𝕜 E F (muonDirection 5 A) ≤ 5 / 4 ∧
      17 / 25 * UnitarilyInvariantSeminorm.nuclear 𝕜 E F A ≤ traceInner (muonDirection 5 A) A ∧
      UnitarilyInvariantSeminorm.opNorm 𝕜 E F (muonDirection 5 A - A.polarFactor) ≤ 8 / 25 :=
  sorry

/-- The descent lemma for a derivative that is `L`-Lipschitz along the segment. -/
theorem le_add_fderiv_add_of_lipschitz {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    {f : V → ℝ} {x h : V} {L : ℝ}
    (hf : ∀ y ∈ segment ℝ x (x + h), DifferentiableAt ℝ f y)
    (hL : ∀ y ∈ segment ℝ x (x + h), ‖fderiv ℝ f y - fderiv ℝ f x‖ ≤ L * ‖y - x‖) :
    f (x + h) ≤ f x + fderiv ℝ f x h + L / 2 * ‖h‖ ^ 2 := sorry

/-- The dual norm of the operator norm is the nuclear norm of the trace-pairing gradient. -/
theorem norm_fderiv_eq_nuclear {f : (E' →L[ℝ] F') → ℝ} {W : E' →L[ℝ] F'} {G : E' →ₗ[ℝ] F'}
    (hG : ∀ Z : E' →L[ℝ] F', fderiv ℝ f W Z = traceInner G (Z : E' →ₗ[ℝ] F')) :
    ‖fderiv ℝ f W‖ = UnitarilyInvariantSeminorm.nuclear ℝ E' F' G := sorry

/-- One step of spectral steepest descent along any direction that is `ρ`-bounded in operator
norm and captures a fraction `κ` of the nuclear norm of the gradient. -/
theorem spectral_descent {f : (E' →L[ℝ] F') → ℝ} {W : E' →L[ℝ] F'} {G D : E' →ₗ[ℝ] F'}
    {κ ρ L η : ℝ} (hη : 0 ≤ η) (hL₀ : 0 ≤ L)
    (hG : ∀ Z : E' →L[ℝ] F', fderiv ℝ f W Z = traceInner G (Z : E' →ₗ[ℝ] F'))
    (hD : UnitarilyInvariantSeminorm.opNorm ℝ E' F' D ≤ ρ)
    (hκ : κ * UnitarilyInvariantSeminorm.nuclear ℝ E' F' G ≤ traceInner G D)
    (hf : ∀ y ∈ segment ℝ W (W - η • LinearMap.toContinuousLinearMap D),
      DifferentiableAt ℝ f y)
    (hL : ∀ y ∈ segment ℝ W (W - η • LinearMap.toContinuousLinearMap D),
      ‖fderiv ℝ f y - fderiv ℝ f W‖ ≤ L * ‖y - W‖) :
    f (W - η • LinearMap.toContinuousLinearMap D) ≤
      f W - η * κ * UnitarilyInvariantSeminorm.nuclear ℝ E' F' G + L / 2 * η ^ 2 * ρ ^ 2 :=
  sorry

end TauCetiRoadmap.SpectralSteepestDescent
