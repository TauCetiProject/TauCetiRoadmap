module

public import Mathlib
public import TauCeti.Analysis.BoundedVariation.TotalVariation
public import TauCeti.Analysis.BoundedVariation.Translation
public import TauCeti.Analysis.BoundedVariation.Compactness
public import TauCeti.Analysis.BoundedVariation.Real

/-!
# Finite volume schemes and hyperbolic systems: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Time comes first: a space-time function is `u : ℝ → ℝ → E`,
`u t x`. Grid functions are `ℤ → ℝ`, cell `j` is `[j Δx, (j + 1) Δx)`, and the mesh ratio is
`μ = Δt / Δx > 0`. A numerical flux with stencil `(p, q)` is `F : (Fin (p + q + 1) → ℝ) → ℝ`,
evaluated at the interface `j + 1/2` on the values `v (j - p), …, v (j + q)`. Total variations,
`L¹` distances and moduli that may be infinite take values in `ℝ≥0∞`: `gridTV` for grid functions,
Mathlib's `eVariationOn` for a given function, and Tau Ceti's `TauCeti.totalVariationOn volume ⊤`
for the variation of an a.e. class. No real supremum over an unbounded set occurs.
The characteristic speeds of a system are `lam : Fin m → (Fin m → ℝ) → ℝ` (the README's `λ_k`),
with right eigenvectors `r`.

`IsIntegralSolution` and `IsEntropySolution` are verbatim copies of the definitions of the
roadmap HamiltonJacobiAndConservationLaws, §5.1 and §6.1; the docstrings of the copies name them.
The `#check` lines at the end of the file pin the Mathlib and Tau Ceti declarations that the
README names.

The declarations `isConsistentFlux_laxFriedrichsFlux`, `conservativeUpdate_shift`,
`entropyStable_viscosityForm_iff`, `entropyConservativeFlux_burgers`,
`entropyConservativeFlux_burgers_log` and `isWeakConservationLaw_iff_isIntegralSolution` are proved
Checks; everything else is a `sorry` target.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Topology Set Function
open scoped ENNReal NNReal InnerProductSpace ContDiff

namespace TauCetiRoadmap.FiniteVolumeSchemesAndHyperbolicSystems

/-! ## Supplier definitions, copied verbatim -/

section Supplier

/-- Copied verbatim from the roadmap HamiltonJacobiAndConservationLaws, §5.1.
**Integral solution** of `∂ₜu + ∂ₓ(f(u)) = 0` on `(0,∞) × ℝ` with datum `u₀` (§5.1). -/
def IsIntegralSolution (f : ℝ → ℝ) (u₀ : ℝ → ℝ) (u : ℝ → ℝ → ℝ) : Prop :=
  LocallyIntegrable u₀ volume ∧
  AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume) ∧
  (∃ M : ℝ, ∀ᵐ q ∂((volume.restrict (Ioi 0)).prod volume), |u q.1 q.2| ≤ M) ∧
  ∀ φ : ℝ × ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
    (∫ t in Ioi 0, ∫ x, (u t x * fderiv ℝ φ (t, x) (1, 0)
        + f (u t x) * fderiv ℝ φ (t, x) (0, 1))) + ∫ x, u₀ x * φ (0, x) = 0

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- Copied verbatim from the roadmap HamiltonJacobiAndConservationLaws, §6.1.
**Kružkov entropy solution** of `∂ₜu + div f(u) = 0` on `(0,T) × E` with datum `u₀`
(§6.1). The spatial pairing `⟪f(u) - f(k), ∇ₓφ⟫` is `fderiv ℝ φ (t, x) (0, f (u t x) - f k)`
and `∂ₜφ` is `fderiv ℝ φ (t, x) (1, 0)`. -/
def IsEntropySolution (f : ℝ → E) (u₀ : E → ℝ) (T : ℝ) (u : ℝ → E → ℝ) : Prop :=
  LocallyIntegrable u₀ volume ∧
  AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioo 0 T)).prod volume) ∧
  (∃ M : ℝ, ∀ᵐ q ∂((volume.restrict (Ioo 0 T)).prod volume), |u q.1 q.2| ≤ M) ∧
  ∀ (k : ℝ) (φ : ℝ × E → ℝ), ContDiff ℝ 1 φ → HasCompactSupport φ → (∀ q, 0 ≤ φ q) →
    (∀ q : ℝ × E, T ≤ q.1 → φ q = 0) →
    0 ≤ (∫ t in Ioo 0 T, ∫ x, (|u t x - k| * fderiv ℝ φ (t, x) (1, 0)
          + (SignType.sign (u t x - k) : ℝ) * fderiv ℝ φ (t, x) (0, f (u t x) - f k)))
        + ∫ x, |u₀ x - k| * φ (0, x)

end Supplier

/-- Conventions. A space-time function `u` is continuous in time with values in `L¹(ℝ)` on the
set `s` of times. -/
def IsL1ContinuousOn {E : Type*} [NormedAddCommGroup E] (u : ℝ → ℝ → E) (s : Set ℝ) : Prop :=
  ∀ t₀ ∈ s, Tendsto (fun t => ∫⁻ x, ‖u t x - u t₀ x‖ₑ) (𝓝[s] t₀) (𝓝 0)

/-- Conventions. The essential total variation of `u : ℝ → ℝ`, Tau Ceti's variation of the
distributional derivative on the whole line; it depends only on the a.e. class of `u`. -/
abbrev essVar (u : ℝ → ℝ) : ℝ≥0∞ := TauCeti.totalVariationOn volume ⊤ u

/-! ## Layer 1: grid functions and conservative schemes -/

/-! ### 1.1 Grid functions and cell averages -/

/-- 1.1 The total variation `∑ⱼ |v (j + 1) - v j|` of a grid function, in `ℝ≥0∞`. -/
def gridTV (v : ℤ → ℝ) : ℝ≥0∞ := ∑' j, ‖v (j + 1) - v j‖ₑ

/-- 1.1 The average of `u₀` over the cell `[j Δx, (j + 1) Δx]`. -/
def cellAverage (Δx : ℝ) (u₀ : ℝ → ℝ) (j : ℤ) : ℝ :=
  (∫ x in (j * Δx)..((j + 1) * Δx), u₀ x) / Δx

/-- 1.1 The piecewise constant function with value `v j` on the cell `[j Δx, (j + 1) Δx)`. -/
def finiteVolumeReconstruction (Δx : ℝ) (v : ℤ → ℝ) (x : ℝ) : ℝ := v ⌊x / Δx⌋

/-- 1.1 The grid variation is Mathlib's variation of the grid function on `ℤ`. -/
theorem gridTV_eq_eVariationOn (v : ℤ → ℝ) : gridTV v = eVariationOn v univ := by
  sorry

/-- 1.1 The essential variation of a cell reconstruction is the grid variation. -/
theorem essVar_finiteVolumeReconstruction {Δx : ℝ} (hΔx : 0 < Δx) (v : ℤ → ℝ) :
    essVar (finiteVolumeReconstruction Δx v) = gridTV v := by
  sorry

/-- 1.1 Cell averages do not increase the variation. -/
theorem gridTV_cellAverage_le {Δx : ℝ} (hΔx : 0 < Δx) {u₀ : ℝ → ℝ}
    (hu₀ : LocallyIntegrable u₀ volume) : gridTV (cellAverage Δx u₀) ≤ essVar u₀ := by
  sorry

/-- 1.1 The projection onto cell averages has `L¹` error at most `Δx` times the variation. -/
theorem lintegral_finiteVolumeReconstruction_sub_le {Δx : ℝ} (hΔx : 0 < Δx) {u₀ : ℝ → ℝ}
    (hu₀ : LocallyIntegrable u₀ volume) :
    ∫⁻ x, ‖finiteVolumeReconstruction Δx (cellAverage Δx u₀) x - u₀ x‖ₑ ≤
      ENNReal.ofReal Δx * essVar u₀ := by
  sorry

/-! ### 1.2 Conservative schemes -/

/-- 1.2 The numerical flux at the interface `j + 1/2`: `F (v (j - p), …, v (j + q))`. -/
def numericalFlux (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (v : ℤ → ℝ) (j : ℤ) : ℝ :=
  F fun i => v (j - p + i)

/-- 1.2 One step of the conservative scheme with mesh ratio `μ = Δt / Δx`:
`v j - μ (F_{j+1/2} - F_{j-1/2})`. -/
def conservativeUpdate (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (μ : ℝ) (v : ℤ → ℝ) (j : ℤ) :
    ℝ :=
  v j - μ * (numericalFlux p q F v j - numericalFlux p q F v (j - 1))

/-- 1.2 Consistency of a numerical flux with the flux `f`. -/
def IsConsistentFlux {p q : ℕ} (F : (Fin (p + q + 1) → ℝ) → ℝ) (f : ℝ → ℝ) : Prop :=
  ∀ u, F (fun _ => u) = f u

/-- 1.2 The Lax–Friedrichs flux `(f a + f b) / 2 - (b - a) / (2 μ)`, stencil `(0, 1)`. -/
def laxFriedrichsFlux (f : ℝ → ℝ) (μ : ℝ) (a : Fin (0 + 1 + 1) → ℝ) : ℝ :=
  (f (a 0) + f (a 1)) / 2 - (a 1 - a 0) / (2 * μ)

/-- 1.2 The approximate solution of the scheme started from cell averages: on the space-time
cell of `(t, x)` it is the value after `⌊t / (μ Δx)⌋` steps in cell `⌊x / Δx⌋`. -/
def schemeApprox (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (μ Δx : ℝ) (u₀ : ℝ → ℝ)
    (t x : ℝ) : ℝ :=
  (conservativeUpdate p q F μ)^[⌊t / (μ * Δx)⌋₊] (cellAverage Δx u₀) ⌊x / Δx⌋

/-- Check: the Lax–Friedrichs flux is consistent. -/
theorem isConsistentFlux_laxFriedrichsFlux (f : ℝ → ℝ) (μ : ℝ) :
    IsConsistentFlux (p := 0) (q := 1) (laxFriedrichsFlux f μ) f := by
  intro u
  simp [laxFriedrichsFlux]

/-- Check: the scheme commutes with translation of the grid. -/
theorem conservativeUpdate_shift (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (μ : ℝ) (v : ℤ → ℝ)
    (j : ℤ) :
    conservativeUpdate p q F μ (fun i => v (i + 1)) j = conservativeUpdate p q F μ v (j + 1) := by
  simp only [conservativeUpdate, numericalFlux]
  congr 3 <;> (congr 1; ext i; congr 1; ring)

/-- 1.2 Conservation: for a locally Lipschitz flux and summable data the step is summable with
the same sum. -/
theorem tsum_conservativeUpdate {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ}
    (hF : LocallyLipschitz F) (μ : ℝ) {v : ℤ → ℝ} (hv : Summable v) :
    Summable (conservativeUpdate p q F μ v) ∧ ∑' j, conservativeUpdate p q F μ v j = ∑' j, v j := by
  sorry

/-! ## Layer 2: the Lax–Wendroff theorem -/

/-- 2.2 The entropy inequality `∂ₜη(u) + ∂ₓq(u) ≤ 0` for one pair `(η, q)`, with the initial
datum, tested against nonnegative `C¹` functions of compact support on `[0, ∞) × ℝ`. -/
def IsEntropyInequality (η qf : ℝ → ℝ) (u₀ : ℝ → ℝ) (u : ℝ → ℝ → ℝ) : Prop :=
  ∀ φ : ℝ × ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ → (∀ z, 0 ≤ φ z) →
    0 ≤ (∫ t in Ioi 0, ∫ x, (η (u t x) * fderiv ℝ φ (t, x) (1, 0)
        + qf (u t x) * fderiv ℝ φ (t, x) (0, 1))) + ∫ x, η (u₀ x) * φ (0, x)

/-- 2.1 **The Lax–Wendroff theorem.** A bounded limit in `L¹_loc` of a consistent conservative
scheme with locally Lipschitz flux, started from cell averages, is an integral solution. -/
theorem isIntegralSolution_of_tendsto {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ} {f : ℝ → ℝ}
    (hF : LocallyLipschitz F) (hcons : IsConsistentFlux F f) {μ : ℝ} (hμ : 0 < μ)
    {u₀ : ℝ → ℝ} (hu₀ : LocallyIntegrable u₀ volume) {Δx : ℕ → ℝ} (hΔx : ∀ k, 0 < Δx k)
    (hΔx0 : Tendsto Δx atTop (𝓝 0)) {C : ℝ}
    (hbd : ∀ k t x, 0 ≤ t → |schemeApprox p q F μ (Δx k) u₀ t x| ≤ C)
    {u : ℝ → ℝ → ℝ}
    (hu : AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume))
    (hlim : ∀ T R : ℝ, Tendsto (fun k => ∫⁻ t in Ioo 0 T, ∫⁻ x in Icc (-R) R,
      ‖schemeApprox p q F μ (Δx k) u₀ t x - u t x‖ₑ) atTop (𝓝 0)) :
    IsIntegralSolution f u₀ u := by
  sorry

/-- 2.2 **Entropy version.** If moreover the scheme satisfies a discrete entropy inequality for
`(η, qf)` with a locally Lipschitz numerical entropy flux `G` consistent with `qf`, on all data
with values in an interval `I` that contains every computed value, the limit satisfies the
entropy inequality. -/
theorem isEntropyInequality_of_tendsto {p q : ℕ} {F G : (Fin (p + q + 1) → ℝ) → ℝ}
    {f η qf : ℝ → ℝ} (hF : LocallyLipschitz F) (hcons : IsConsistentFlux F f)
    (hη : Continuous η) (hG : LocallyLipschitz G) (hGcons : IsConsistentFlux G qf)
    {μ : ℝ} (hμ : 0 < μ) {I : Set ℝ}
    (hent : ∀ v : ℤ → ℝ, (∀ j, v j ∈ I) → ∀ j,
      η (conservativeUpdate p q F μ v j) ≤
        η (v j) - μ * (numericalFlux p q G v j - numericalFlux p q G v (j - 1)))
    {u₀ : ℝ → ℝ} (hu₀ : LocallyIntegrable u₀ volume) {Δx : ℕ → ℝ} (hΔx : ∀ k, 0 < Δx k)
    (hΔx0 : Tendsto Δx atTop (𝓝 0))
    (hI : ∀ k n j, (conservativeUpdate p q F μ)^[n] (cellAverage (Δx k) u₀) j ∈ I)
    (hIb : Bornology.IsBounded I) {u : ℝ → ℝ → ℝ}
    (hu : AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume))
    (hlim : ∀ T R : ℝ, Tendsto (fun k => ∫⁻ t in Ioo 0 T, ∫⁻ x in Icc (-R) R,
      ‖schemeApprox p q F μ (Δx k) u₀ t x - u t x‖ₑ) atTop (𝓝 0)) :
    IsEntropyInequality η qf u₀ u := by
  sorry

/-! ## Layer 3: monotone and total variation diminishing schemes -/

section Properties

/-- 3.1 A grid operator is monotone on data with values in `I`. -/
def IsMonotoneOn (S : (ℤ → ℝ) → ℤ → ℝ) (I : Set ℝ) : Prop :=
  ∀ v w : ℤ → ℝ, (∀ j, v j ∈ I) → (∀ j, w j ∈ I) → v ≤ w → S v ≤ S w

/-- 3.1 A grid operator is an `ℓ¹` contraction on data with values in `I`. -/
def IsL1ContractiveOn (S : (ℤ → ℝ) → ℤ → ℝ) (I : Set ℝ) : Prop :=
  ∀ v w : ℤ → ℝ, (∀ j, v j ∈ I) → (∀ j, w j ∈ I) →
    ∑' j, ‖S v j - S w j‖ₑ ≤ ∑' j, ‖v j - w j‖ₑ

/-- 3.1 A grid operator is total variation diminishing on data with values in `I`. -/
def IsTVDOn (S : (ℤ → ℝ) → ℤ → ℝ) (I : Set ℝ) : Prop :=
  ∀ v : ℤ → ℝ, (∀ j, v j ∈ I) → gridTV (S v) ≤ gridTV v

/-- 3.1 A grid operator preserves monotonicity of data of finite variation with values in `I`. -/
def IsMonotonicityPreservingOn (S : (ℤ → ℝ) → ℤ → ℝ) (I : Set ℝ) : Prop :=
  ∀ v : ℤ → ℝ, (∀ j, v j ∈ I) → gridTV v ≠ ⊤ →
    (Monotone v → Monotone (S v)) ∧ (Antitone v → Antitone (S v))

variable {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ} {μ : ℝ}

/-- 3.1 **Crandall–Tartar.** A monotone conservative scheme with locally Lipschitz flux is an
`ℓ¹` contraction on data with values in `[m, M]`, and maps such data to such data. -/
theorem isL1ContractiveOn_of_isMonotoneOn (hF : LocallyLipschitz F) {m M : ℝ}
    (hmono : IsMonotoneOn (conservativeUpdate p q F μ) (Icc m M)) :
    IsL1ContractiveOn (conservativeUpdate p q F μ) (Icc m M) ∧
      ∀ v : ℤ → ℝ, (∀ j, v j ∈ Icc m M) → ∀ j, conservativeUpdate p q F μ v j ∈ Icc m M := by
  sorry

/-- 3.1 An `ℓ¹` contraction that commutes with translation is total variation diminishing. -/
theorem isTVDOn_of_isL1ContractiveOn {S : (ℤ → ℝ) → ℤ → ℝ} {I : Set ℝ}
    (hS : ∀ v j, S (fun i => v (i + 1)) j = S v (j + 1)) (hL : IsL1ContractiveOn S I) :
    IsTVDOn S I := by
  sorry

/-- 3.1 A total variation diminishing conservative scheme with continuous flux preserves
monotonicity. -/
theorem isMonotonicityPreservingOn_of_isTVDOn (hF : Continuous F) {I : Set ℝ}
    (hT : IsTVDOn (conservativeUpdate p q F μ) I) :
    IsMonotonicityPreservingOn (conservativeUpdate p q F μ) I := by
  sorry

/-- 3.2 The Lax–Friedrichs scheme is monotone on `I` when `μ L ≤ 1`, `L` a Lipschitz constant
of `f` on `I`. -/
theorem isMonotoneOn_laxFriedrichs {f : ℝ → ℝ} {L : ℝ≥0} {I : Set ℝ} (hf : LipschitzOnWith L f I)
    (hμ : 0 < μ) (hCFL : μ * L ≤ 1) :
    IsMonotoneOn (conservativeUpdate 0 1 (laxFriedrichsFlux f μ) μ) I := by
  sorry

/-- 3.3 **Harten's lemma, variation.** With `A j` for `A_{j+1/2}` and `B j` for `B_{j+1/2}`, the
incremental form `u j - A (j - 1) (u j - u (j - 1)) + B j (u (j + 1) - u j)` does not increase
the variation if `A j, B j ≥ 0` and `A j + B j ≤ 1`. -/
theorem gridTV_incremental_le (u A B : ℤ → ℝ) (hA : ∀ j, 0 ≤ A j) (hB : ∀ j, 0 ≤ B j)
    (hAB : ∀ j, A j + B j ≤ 1) :
    gridTV (fun j => u j - A (j - 1) * (u j - u (j - 1)) + B j * (u (j + 1) - u j)) ≤
      gridTV u := by
  sorry

/-- 3.3 **Harten's lemma, maximum principle.** Under `A (j - 1) + B j ≤ 1` the updated values lie
in every interval that contains the old ones. -/
theorem incremental_mem_Icc (u A B : ℤ → ℝ) (hA : ∀ j, 0 ≤ A j) (hB : ∀ j, 0 ≤ B j)
    (hAB : ∀ j, A (j - 1) + B j ≤ 1) {m M : ℝ} (hu : ∀ j, u j ∈ Icc m M) (j : ℤ) :
    u j - A (j - 1) * (u j - u (j - 1)) + B j * (u (j + 1) - u j) ∈ Icc m M := by
  sorry

/-- 3.4 **The cell entropy inequality of Crandall and Majda.** For a monotone conservative scheme
and `k ∈ I`, the Kružkov entropy `|v - k|` satisfies the discrete entropy inequality with the
numerical entropy flux `F (v ⊔ k) - F (v ⊓ k)`. -/
theorem monotoneUpdate_entropy_inequality {I : Set ℝ}
    (hmono : IsMonotoneOn (conservativeUpdate p q F μ) I)
    {v : ℤ → ℝ} (hv : ∀ j, v j ∈ I) {k : ℝ} (hk : k ∈ I) (j : ℤ) :
    |conservativeUpdate p q F μ v j - k| ≤ |v j - k| -
      μ * ((numericalFlux p q F (v ⊔ fun _ => k) j - numericalFlux p q F (v ⊓ fun _ => k) j) -
        (numericalFlux p q F (v ⊔ fun _ => k) (j - 1) -
          numericalFlux p q F (v ⊓ fun _ => k) (j - 1))) := by
  sorry

end Properties

/-! ## Layer 4: convergence of monotone schemes -/

section Convergence

variable {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ} {μ : ℝ}

/-- 4.1 **Discrete estimates.** For a monotone scheme on `[m, M]` whose flux is `L`-Lipschitz there
(sup norm), every iterate of data with values in `[m, M]` has values in `[m, M]` and variation
at most that of the data, and one step moves it by at most `μ L (p + q + 1)` times that
variation in `ℓ¹`. -/
theorem iterate_conservativeUpdate_bounds {m M : ℝ} {L : ℝ≥0}
    (hF : LipschitzOnWith L F (Set.pi univ fun _ => Icc m M)) (hμ : 0 < μ)
    (hmono : IsMonotoneOn (conservativeUpdate p q F μ) (Icc m M)) {v : ℤ → ℝ}
    (hv : ∀ j, v j ∈ Icc m M) (n : ℕ) :
    (∀ j, (conservativeUpdate p q F μ)^[n] v j ∈ Icc m M) ∧
      gridTV ((conservativeUpdate p q F μ)^[n] v) ≤ gridTV v ∧
      ∑' j, ‖(conservativeUpdate p q F μ)^[n + 1] v j - (conservativeUpdate p q F μ)^[n] v j‖ₑ ≤
        ENNReal.ofReal (μ * L * (p + q + 1)) * gridTV v := by
  sorry

/-- 4.2 **Compactness in `C([0, T]; L¹_loc)`.** A sequence of space-time functions that is
bounded, of bounded variation in space at each time, and equicontinuous in time in `L¹` up to
an error `ρ k → 0`, has a subsequence converging in `L¹(K)` uniformly in `t ∈ [0, T]` for every
compact `K`. -/
theorem exists_subseq_tendsto_iSup_lintegral {w : ℕ → ℝ → ℝ → ℝ} {T C V L : ℝ} {ρ : ℕ → ℝ}
    (hmeas : ∀ k t, AEStronglyMeasurable (w k t) volume) (hbd : ∀ k t x, |w k t x| ≤ C)
    (hTV : ∀ k, ∀ t ∈ Icc 0 T, essVar (w k t) ≤ ENNReal.ofReal V)
    (htime : ∀ k, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
      ∫⁻ x, ‖w k t x - w k s x‖ₑ ≤ ENNReal.ofReal (L * |t - s| + ρ k))
    (hρ : Tendsto ρ atTop (𝓝 0)) :
    ∃ (φ : ℕ → ℕ) (w' : ℝ → ℝ → ℝ), StrictMono φ ∧
      (∀ t, AEStronglyMeasurable (w' t) volume) ∧ IsL1ContinuousOn w' (Icc 0 T) ∧
      ∀ K : Set ℝ, IsCompact K → Tendsto (fun j => ⨆ t ∈ Icc 0 T,
        ∫⁻ x in K, ‖w (φ j) t x - w' t x‖ₑ) atTop (𝓝 0) := by
  sorry

/-- 4.3 **Limits of monotone schemes are entropy solutions.** A limit in `L¹_loc` of a consistent
monotone scheme on `[m, M]`, started from data with values a.e. in `[m, M]`, is the Kružkov
entropy solution on every interval `(0, T)`. -/
theorem isEntropySolution_of_tendsto {f : ℝ → ℝ} (hF : LocallyLipschitz F)
    (hcons : IsConsistentFlux F f) (hμ : 0 < μ) {m M : ℝ}
    (hmono : IsMonotoneOn (conservativeUpdate p q F μ) (Icc m M)) {u₀ : ℝ → ℝ}
    (hu₀ : AEStronglyMeasurable u₀ volume) (hu₀m : ∀ᵐ x, u₀ x ∈ Icc m M)
    {Δx : ℕ → ℝ} (hΔx : ∀ k, 0 < Δx k) (hΔx0 : Tendsto Δx atTop (𝓝 0)) {u : ℝ → ℝ → ℝ}
    (hu : AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume))
    (hlim : ∀ T R : ℝ, Tendsto (fun k => ∫⁻ t in Ioo 0 T, ∫⁻ x in Icc (-R) R,
      ‖schemeApprox p q F μ (Δx k) u₀ t x - u t x‖ₑ) atTop (𝓝 0)) (T : ℝ) :
    IsEntropySolution (E := ℝ) f u₀ T u := by
  sorry

/-- 4.4 **Convergence of monotone schemes.** For integrable data of finite variation with values
a.e. in `[m, M]` and a consistent scheme, monotone on `[m, M]`, with locally Lipschitz flux, the
whole family of approximations converges to the `L¹`-continuous entropy solution in `L¹(K)`
uniformly on `[0, T]`, for every compact `K`. -/
theorem tendsto_schemeApprox {f : ℝ → ℝ} (hF : LocallyLipschitz F) (hcons : IsConsistentFlux F f)
    (hμ : 0 < μ) {m M : ℝ} (hmono : IsMonotoneOn (conservativeUpdate p q F μ) (Icc m M))
    {u₀ : ℝ → ℝ} (hu₀ : Integrable u₀ volume) (hu₀m : ∀ᵐ x, u₀ x ∈ Icc m M)
    (hu₀v : essVar u₀ ≠ ⊤) {u : ℝ → ℝ → ℝ} (hu : ∀ T, IsEntropySolution (E := ℝ) f u₀ T u)
    (hcont : IsL1ContinuousOn u (Ici 0)) {T : ℝ} {K : Set ℝ} (hK : IsCompact K) :
    Tendsto (fun Δx => ⨆ t ∈ Icc 0 T, ∫⁻ x in K, ‖schemeApprox p q F μ Δx u₀ t x - u t x‖ₑ)
      (𝓝[>] 0) (𝓝 0) := by
  sorry

end Convergence

/-! ## Layer 5: order barriers -/

section Barriers

/-- 5.1 The scheme as a function of the `p + q + 2` values `v (j - p - 1), …, v (j + q)`; slot
`p + 1` holds `v j`. -/
def schemeMap (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (μ : ℝ) (α : Fin (p + q + 2) → ℝ) : ℝ :=
  α ⟨p + 1, by omega⟩ - μ * (F (fun i => α i.succ) - F (fun i => α i.castSucc))

/-- 5.1 The coefficient `β(u) = ∑ᵢ (i - p - 1)² ∂ᵢH(u, …, u) - μ² f'(u)²` of the leading term of
the one-step defect. -/
def hhlBeta (p q : ℕ) (F : (Fin (p + q + 1) → ℝ) → ℝ) (μ : ℝ) (f : ℝ → ℝ) (u : ℝ) : ℝ :=
  (∑ i : Fin (p + q + 2), ((i : ℝ) - (p + 1)) ^ 2 *
    fderiv ℝ (schemeMap p q F μ) (fun _ => u) (Pi.single i 1)) - μ ^ 2 * deriv f u ^ 2

variable {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ} {μ : ℝ} {f : ℝ → ℝ}

/-- 5.1 **Harten–Hyman–Lax, the coefficient.** For a consistent `C¹` flux whose scheme is
monotone on `I^{p+q+2}`, at each interior state `β ≥ 0`, and `β = 0` exactly when a single
partial derivative of the scheme is nonzero; then `μ f'(u) = p + 1 - i` for that slot `i`. -/
theorem hhlBeta_nonneg (hF : ContDiff ℝ 1 F) (hcons : IsConsistentFlux F f) {I : Set ℝ}
    (hmono : MonotoneOn (schemeMap p q F μ) (Set.pi univ fun _ => I)) {u : ℝ}
    (hu : u ∈ interior I) :
    0 ≤ hhlBeta p q F μ f u ∧
      (hhlBeta p q F μ f u = 0 ↔ ∃ i, (∀ i', i' ≠ i →
        fderiv ℝ (schemeMap p q F μ) (fun _ => u) (Pi.single i' 1) = 0) ∧
          μ * deriv f u = (p + 1 : ℝ) - i) := by
  sorry

/-- 5.1 **Harten–Hyman–Lax, the translation case.** If `β` vanishes on an open interval `J`
inside `I`, then `f` is affine on `J` with slope `k / μ` for an integer `k`. -/
theorem affine_of_hhlBeta_eq_zero (hF : ContDiff ℝ 1 F) (hcons : IsConsistentFlux F f)
    {I J : Set ℝ} (hmono : MonotoneOn (schemeMap p q F μ) (Set.pi univ fun _ => I))
    (hμ : 0 < μ) (hJ : IsOpen J) (hJc : IsPreconnected J) (hJI : J ⊆ I)
    (hβ : ∀ u ∈ J, hhlBeta p q F μ f u = 0) :
    ∃ (k : ℤ) (b : ℝ), ∀ u ∈ J, f u = k / μ * u + b := by
  sorry

/-- 5.1 **Harten–Hyman–Lax, the defect.** For a consistent `C³` flux and a `C³` classical solution
of `∂ₜu + f'(u) ∂ₓu = 0`, at each point the one-step defect is
`-(Δx²/2) ∂ₓ(β(u) ∂ₓu) + O(Δx³)`. -/
theorem isBigO_hhl_defect (hF : ContDiff ℝ 3 F) (hcons : IsConsistentFlux F f) {u : ℝ → ℝ → ℝ}
    (hu : ContDiff ℝ 3 (Function.uncurry u))
    (hsol : ∀ t x, deriv (fun s => u s x) t + deriv f (u t x) * deriv (u t) x = 0) (t x : ℝ) :
    (fun Δx : ℝ => u (t + μ * Δx) x -
        schemeMap p q F μ (fun i => u t (x + ((i : ℝ) - (p + 1)) * Δx)) +
        Δx ^ 2 / 2 * deriv (fun y => hhlBeta p q F μ f (u t y) * deriv (u t) y) x)
      =O[𝓝 0] fun Δx => Δx ^ 3 := by
  sorry

/-- 5.2 **Godunov's barrier, semi-discrete.** For `w_j' = (a / h) ∑ₖ γₖ w_{j+k}` with `a ≠ 0`,
positivity `a γₖ ≥ 0` for `k ≠ 0` and `∑ₖ k γₖ = -1` give `|∑ₖ k² γₖ| ≥ 1`; in particular the
second-order condition `∑ₖ k² γₖ = 0` fails, so the order is at most one. -/
theorem one_le_abs_sum_sq_mul (s : Finset ℤ) (γ : ℤ → ℝ) {a : ℝ} (ha : a ≠ 0)
    (hpos : ∀ k ∈ s, k ≠ 0 → 0 ≤ a * γ k) (h1 : ∑ k ∈ s, (k : ℝ) * γ k = -1) :
    1 ≤ |∑ k ∈ s, (k : ℝ) ^ 2 * γ k| := by
  sorry

/-- 5.2 **Godunov's barrier, fully discrete.** A nonnegative stencil with the first three moments
of the translation by `ν` cells, `v ↦ (j ↦ v (j + ν))`, is that translation: `ν` is an integer
and the stencil is a unit mass at `ν`. -/
theorem exists_int_eq_of_positive_stencil_secondMoment (s : Finset ℤ) (c : ℤ → ℝ) (ν : ℝ)
    (hc : ∀ k ∈ s, 0 ≤ c k) (h0 : ∑ k ∈ s, c k = 1) (h1 : ∑ k ∈ s, (k : ℝ) * c k = ν)
    (h2 : ∑ k ∈ s, (k : ℝ) ^ 2 * c k = ν ^ 2) :
    ∃ k ∈ s, (k : ℝ) = ν ∧ c k = 1 ∧ ∀ k' ∈ s, k' ≠ k → c k' = 0 := by
  sorry

/-- 5.2 The linear scheme `v ↦ (j ↦ ∑ₖ c k v (j + k))` with finitely supported coefficients. -/
def linearScheme (c : ℤ →₀ ℝ) (v : ℤ → ℝ) (j : ℤ) : ℝ := c.sum fun k ck => ck * v (j + k)

/-- 5.2 **A linear monotonicity preserving scheme is monotone**: its coefficients are
nonnegative. -/
theorem nonneg_of_isMonotonicityPreservingOn_linearScheme (c : ℤ →₀ ℝ)
    (h : IsMonotonicityPreservingOn (linearScheme c) univ) (k : ℤ) : 0 ≤ c k := by
  sorry

end Barriers

/-! ## Layer 6: error estimates -/

section Errors

/-- 6.1 A continuous function that is affine between consecutive points of the finite set `b`. -/
def IsPiecewiseAffine (f : ℝ → ℝ) (b : Finset ℝ) : Prop :=
  Continuous f ∧ ∀ x y, x ≤ y → (∀ z ∈ b, z ∉ Ioo x y) →
    ∃ α β : ℝ, ∀ z ∈ Icc x y, f z = α * z + β

/-- 6.1 A step function: constant on every closed interval that misses the finite set `s`. -/
def IsStepFunction (v : ℝ → ℝ) (s : Finset ℝ) : Prop :=
  ∀ x y, x ≤ y → (∀ z ∈ s, z ∉ Icc x y) → v x = v y

/-- 6.1 **Stability in the flux.** For Lipschitz fluxes `f` and `g` whose difference is
`K`-Lipschitz on `[-M, M]`, and data in `L¹` of finite variation with values a.e. in
`[-M, M]`, the entropy solutions satisfy, for almost every `t ∈ (0, T)`,
`‖u t - v t‖₁ ≤ ‖u₀ - v₀‖₁ + t min(TV u₀, TV v₀) K`. -/
theorem lintegral_sub_le_of_flux {f g : ℝ → ℝ} {Lf Lg K : ℝ≥0} {M T : ℝ}
    (hf : LipschitzWith Lf f) (hg : LipschitzWith Lg g)
    (hfg : LipschitzOnWith K (f - g) (Icc (-M) M))
    {u₀ v₀ : ℝ → ℝ} (hu₀ : Integrable u₀ volume) (hv₀ : Integrable v₀ volume)
    (hu₀M : ∀ᵐ x, u₀ x ∈ Icc (-M) M) (hv₀M : ∀ᵐ x, v₀ x ∈ Icc (-M) M)
    {u v : ℝ → ℝ → ℝ} (hu : IsEntropySolution (E := ℝ) f u₀ T u)
    (hv : IsEntropySolution (E := ℝ) g v₀ T v) :
    ∀ᵐ t ∂(volume.restrict (Ioo 0 T)), ∫⁻ x, ‖u t x - v t x‖ₑ ≤
      ∫⁻ x, ‖u₀ x - v₀ x‖ₑ + ENNReal.ofReal t * min (essVar u₀) (essVar v₀) * K := by
  sorry

/-- 6.1 **Front tracking for a scalar law.** For a piecewise affine flux and step data there is
an entropy solution that at each positive time is a step function with at most `N` jumps, `N`
independent of the time, with values in the data values and the breakpoints. -/
theorem exists_frontTracking_scalar {f : ℝ → ℝ} {b : Finset ℝ} (hf : IsPiecewiseAffine f b)
    {u₀ : ℝ → ℝ} {s₀ : Finset ℝ} (hu₀ : IsStepFunction u₀ s₀) :
    ∃ (u : ℝ → ℝ → ℝ) (N : ℕ), (∀ T, IsEntropySolution (E := ℝ) f u₀ T u) ∧
      ∀ t, 0 < t → ∃ s : Finset ℝ, s.card ≤ N ∧ IsStepFunction (u t) s ∧
        ∀ x, u t x ∈ range u₀ ∪ (b : Set ℝ) := by
  sorry

/-- 6.2 The rescaled mollifier `θ_ε(y) = θ(y / ε) / ε`. -/
def mollifier (θ : ℝ → ℝ) (ε y : ℝ) : ℝ := θ (y / ε) / ε

/-- 6.2 The Kružkov functional `Λ_T(u, φ, k)` of a space-time function `u`, a test function
`φ s x` and a constant `k`, including the terms at the times `T` and `0`. -/
def kruzkovFunctional (f : ℝ → ℝ) (T : ℝ) (u : ℝ → ℝ → ℝ) (φ : ℝ → ℝ → ℝ) (k : ℝ) : ℝ :=
  (∫ s in Ioo 0 T, ∫ x, (|u s x - k| * deriv (fun r => φ r x) s
      + (SignType.sign (u s x - k) : ℝ) * (f (u s x) - f k) * deriv (φ s) x))
    - (∫ x, |u T x - k| * φ T x) + ∫ x, |u 0 x - k| * φ 0 x

/-- 6.2 Kuznetsov's doubled form `Λ_{ε,ε₀}(u, v)`: the Kružkov functional of `u` with
`k = v s' x'`, tested with `θ_{ε₀}(s - s') θ_ε(x - x')` and integrated over `(s', x')`. -/
def kuznetsovForm (f θ : ℝ → ℝ) (ε ε₀ T : ℝ) (u v : ℝ → ℝ → ℝ) : ℝ :=
  ∫ s' in Ioo 0 T, ∫ x', kruzkovFunctional f T u
    (fun s x => mollifier θ ε₀ (s - s') * mollifier θ ε (x - x')) (v s' x')

/-- 6.2 The modulus of continuity in time `ν(u, ε₀)` on `[0, T]`, in `ℝ≥0∞`. -/
def timeModulus (u : ℝ → ℝ → ℝ) (T ε₀ : ℝ) : ℝ≥0∞ :=
  ⨆ t ∈ Icc 0 T, ⨆ τ ∈ Icc (-ε₀) ε₀, ⨆ (_ : t + τ ∈ Icc 0 T), ∫⁻ x, ‖u (t + τ) x - u t x‖ₑ

/-- 6.2 The standing hypotheses on the mollifier profile `θ`: smooth, even, with values in
`[0, 1]`, vanishing outside `[-1, 1]`, of integral one. -/
structure IsMollifierProfile (θ : ℝ → ℝ) : Prop where
  contDiff : ContDiff ℝ ∞ θ
  even : ∀ y, θ (-y) = θ y
  mem_Icc : ∀ y, θ y ∈ Icc 0 1
  eq_zero : ∀ y, 1 < |y| → θ y = 0
  integral_eq : ∫ y, θ y = 1

/-- 6.2 **Kuznetsov's lemma.** For a bounded measurable `u` with integrable time slices on
`[0, T]` and the `L¹`-continuous entropy solution `v` with integrable datum `v₀`,
`‖u T - v T‖₁ + Λ_{ε,ε₀}(u, v) ≤ ‖u 0 - v₀‖₁ + TV(v₀) (2ε + ε₀ L) + ν(u, ε₀)`. -/
theorem kuznetsov {f : ℝ → ℝ} {L : ℝ≥0} (hf : LipschitzWith L f) {θ : ℝ → ℝ}
    (hθ : IsMollifierProfile θ) {ε ε₀ T T' : ℝ} (hε : 0 < ε) (hε₀ : 0 < ε₀) (hε₀T : ε₀ < T)
    (hTT' : T < T') {u v : ℝ → ℝ → ℝ} {v₀ : ℝ → ℝ} (hv₀ : Integrable v₀ volume)
    (hv : IsEntropySolution (E := ℝ) f v₀ T' v) (hvc : IsL1ContinuousOn v (Icc 0 T))
    (hum : AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Icc 0 T)).prod volume))
    (hub : ∃ C, ∀ t ∈ Icc 0 T, ∀ x, |u t x| ≤ C) (hui : ∀ t ∈ Icc 0 T, Integrable (u t) volume) :
    ENNReal.ofReal ((∫ x, |u T x - v T x|) + kuznetsovForm f θ ε ε₀ T u v) ≤
      ENNReal.ofReal (∫ x, |u 0 x - v₀ x|) + essVar v₀ * ENNReal.ofReal (2 * ε + ε₀ * L) +
        timeModulus u T ε₀ := by
  sorry

/-- 6.2 The doubled form is nonnegative when `u` is itself an `L¹`-continuous entropy solution. -/
theorem kuznetsovForm_nonneg {f : ℝ → ℝ} (hf : Continuous f) {θ : ℝ → ℝ}
    (hθ : IsMollifierProfile θ) {ε ε₀ T T' : ℝ} (hε : 0 < ε) (hε₀ : 0 < ε₀) (hTT' : T < T')
    {u v : ℝ → ℝ → ℝ} {u₀ : ℝ → ℝ} (hu₀ : Integrable u₀ volume)
    (hu : IsEntropySolution (E := ℝ) f u₀ T' u) (huc : IsL1ContinuousOn u (Icc 0 T))
    (hvm : AEStronglyMeasurable (Function.uncurry v) ((volume.restrict (Icc 0 T)).prod volume))
    (hvb : ∃ C, ∀ t ∈ Icc 0 T, ∀ x, |v t x| ≤ C) (hvi : ∀ t ∈ Icc 0 T, Integrable (v t) volume) :
    0 ≤ kuznetsovForm f θ ε ε₀ T u v := by
  sorry

/-- 6.3 **The viscous rate.** A bounded classical solution `uδ` of `∂ₜu + ∂ₓf(u) = δ ∂ₓ²u`, with
`C²` space slices and `L¹` initial trace `u₀`, is within `4 TV(u₀) √(T δ)` of the entropy
solution at time `T`. -/
theorem lintegral_viscous_sub_le {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f) {δ : ℝ} (hδ : 0 < δ)
    {u₀ : ℝ → ℝ} (hu₀ : Integrable u₀ volume)
    {uδ u : ℝ → ℝ → ℝ} (hc : ContinuousOn (Function.uncurry uδ) (Ioi 0 ×ˢ univ))
    (hb : ∃ C, ∀ t > 0, ∀ x, |uδ t x| ≤ C) (hx : ∀ t > 0, ContDiff ℝ 2 (uδ t))
    (heq : ∀ t > 0, ∀ x, HasDerivAt (fun s => uδ s x)
      (δ * iteratedDeriv 2 (uδ t) x - deriv f (uδ t x) * deriv (uδ t) x) t)
    (h0 : Tendsto (fun t => ∫⁻ x, ‖uδ t x - u₀ x‖ₑ) (𝓝[>] 0) (𝓝 0))
    (hu : ∀ T, IsEntropySolution (E := ℝ) f u₀ T u) (huc : IsL1ContinuousOn u (Ici 0))
    {T : ℝ} (hT : 0 < T) :
    ∫⁻ x, ‖uδ T x - u T x‖ₑ ≤ 4 * essVar u₀ * ENNReal.ofReal (Real.sqrt (T * δ)) := by
  sorry

/-- 6.3 **The rate `√Δx` for monotone schemes.** Under the hypotheses of `tendsto_schemeApprox`,
with an `L`-Lipschitz flux `F` on `[m, M]`, there is `C` with
`‖schemeApprox Δx T - u T‖₁ ≤ C √Δx` for `0 < Δx ≤ 1`. -/
theorem exists_lintegral_schemeApprox_sub_le_sqrt {p q : ℕ} {F : (Fin (p + q + 1) → ℝ) → ℝ}
    {f : ℝ → ℝ} {μ : ℝ} {m M : ℝ} {L : ℝ≥0}
    (hF : LipschitzOnWith L F (Set.pi univ fun _ => Icc m M)) (hcons : IsConsistentFlux F f)
    (hμ : 0 < μ) (hmono : IsMonotoneOn (conservativeUpdate p q F μ) (Icc m M))
    {u₀ : ℝ → ℝ} (hu₀ : Integrable u₀ volume) (hu₀m : ∀ᵐ x, u₀ x ∈ Icc m M)
    (hu₀v : essVar u₀ ≠ ⊤) {u : ℝ → ℝ → ℝ} (hu : ∀ T, IsEntropySolution (E := ℝ) f u₀ T u)
    (hcont : IsL1ContinuousOn u (Ici 0)) {T : ℝ} (hT : 0 < T) :
    ∃ C : ℝ, ∀ Δx ∈ Ioc (0 : ℝ) 1,
      ∫⁻ x, ‖schemeApprox p q F μ Δx u₀ T x - u T x‖ₑ ≤ ENNReal.ofReal (C * Real.sqrt Δx) := by
  sorry

end Errors

/-! ## Layer 7: entropy-conservative and entropy-stable fluxes -/

section Tadmor

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- 7.1 The entropy flux potential `ψ(u) = ⟪w(u), f(u)⟫ - q(u)` of an entropy variable `w`. -/
def entropyFluxPotential (w f : V → V) (qf : V → ℝ) (u : V) : ℝ := ⟪w u, f u⟫_ℝ - qf u

/-- 7.1 Tadmor's numerical entropy flux `½⟪w a + w b, g a b⟫ - ½(ψ a + ψ b)`. -/
def tadmorEntropyFlux (w f : V → V) (qf : V → ℝ) (g : V → V → V) (a b : V) : ℝ :=
  ⟪w a + w b, g a b⟫_ℝ / 2 -
    (entropyFluxPotential w f qf a + entropyFluxPotential w f qf b) / 2

/-- 7.1 **Entropy-conservative fluxes.** A consistent two-point flux satisfies
`⟪w b - w a, g a b⟫ = ψ b - ψ a` for all states exactly when the semi-discrete scheme has a
cell entropy equality with some consistent numerical entropy flux; Tadmor's flux is one. -/
theorem entropyConservative_iff (w f : V → V) (qf : V → ℝ) (g : V → V → V)
    (hg : ∀ u, g u u = f u) :
    (∀ a b, ⟪w b - w a, g a b⟫_ℝ = entropyFluxPotential w f qf b - entropyFluxPotential w f qf a) ↔
      ∃ G : V → V → ℝ, (∀ u, G u u = qf u) ∧ ∀ a b c, G b c - G a b = ⟪w b, g b c - g a b⟫_ℝ := by
  sorry

/-- 7.1 **Entropy-stable fluxes**, the inequality version; with the inequality Tadmor's flux is
a consistent numerical entropy flux for the cell entropy inequality. -/
theorem entropyStable_iff (w f : V → V) (qf : V → ℝ) (g : V → V → V) (hg : ∀ u, g u u = f u) :
    (∀ a b, ⟪w b - w a, g a b⟫_ℝ ≤ entropyFluxPotential w f qf b - entropyFluxPotential w f qf a) ↔
      ∃ G : V → V → ℝ, (∀ u, G u u = qf u) ∧ ∀ a b c, G b c - G a b ≤ ⟪w b, g b c - g a b⟫_ℝ := by
  sorry

/-- 7.2 **The semi-discrete entropy inequality.** Along a solution of
`u_j' = -(g(u_j, u_{j+1}) - g(u_{j-1}, u_j)) / Δx` with an entropy-stable flux, the entropy
`η` with gradient `w` satisfies `(η ∘ u_j)' ≤ -(G_{j+1/2} - G_{j-1/2}) / Δx` with Tadmor's flux. -/
theorem hasDerivAt_entropy_le (η : V → ℝ) (w f : V → V) (qf : V → ℝ) (g : V → V → V)
    (hη : ∀ u, HasFDerivAt η (innerSL ℝ (w u)) u)
    (hstab : ∀ a b, ⟪w b - w a, g a b⟫_ℝ ≤
      entropyFluxPotential w f qf b - entropyFluxPotential w f qf a)
    {Δx : ℝ} (hΔx : 0 < Δx) (u : ℝ → ℤ → V)
    (hu : ∀ t j, HasDerivAt (fun s => u s j) (-(1 / Δx) • (g (u t j) (u t (j + 1)) -
      g (u t (j - 1)) (u t j))) t) (t : ℝ) (j : ℤ) :
    ∃ d, HasDerivAt (fun s => η (u s j)) d t ∧
      d ≤ -(tadmorEntropyFlux w f qf g (u t j) (u t (j + 1)) -
        tadmorEntropyFlux w f qf g (u t (j - 1)) (u t j)) / Δx := by
  sorry

/-- 7.3 The scalar entropy-conservative flux `g*(a, b) = (ψ b - ψ a) / (w b - w a)`, and `f a`
on the diagonal. -/
def entropyConservativeFlux (w f qf : ℝ → ℝ) (a b : ℝ) : ℝ :=
  if a = b then f a else
    (entropyFluxPotential (V := ℝ) w f qf b - entropyFluxPotential (V := ℝ) w f qf a) / (w b - w a)

/-- 7.3 **The scalar entropy-conservative flux.** On an open interval where `η` is `C²` with
`η'' > 0`, `f` is `C¹` and `q' = η' f'`, the flux `g*` is the unique entropy-conservative
two-point flux, it is continuous, and off the diagonal it is the `η''`-weighted average
`(∫ₐᵇ f η'') / (w b - w a)`, `w = η'`. -/
theorem entropyConservativeFlux_spec {η f qf : ℝ → ℝ} {I : Set ℝ} (hI : IsOpen I)
    (hIc : Convex ℝ I) (hη : ContDiffOn ℝ 2 η I) (hη2 : ∀ u ∈ I, 0 < deriv (deriv η) u)
    (hf : ContDiffOn ℝ 1 f I) (hq : ∀ u ∈ I, HasDerivAt qf (deriv η u * deriv f u) u) :
    ContinuousOn (fun z : ℝ × ℝ => entropyConservativeFlux (deriv η) f qf z.1 z.2) (I ×ˢ I) ∧
    (∀ a ∈ I, ∀ b ∈ I, a ≠ b → entropyConservativeFlux (deriv η) f qf a b =
      (∫ u in a..b, f u * deriv (deriv η) u) / (deriv η b - deriv η a)) ∧
    ∀ g : ℝ → ℝ → ℝ, (∀ a ∈ I, ∀ b ∈ I, (deriv η b - deriv η a) * g a b =
        entropyFluxPotential (V := ℝ) (deriv η) f qf b -
          entropyFluxPotential (V := ℝ) (deriv η) f qf a) →
      ∀ a ∈ I, ∀ b ∈ I, a ≠ b → g a b = entropyConservativeFlux (deriv η) f qf a b := by
  sorry

/-- Check (7.3, the viscosity form): for `w a ≠ w b`, the flux `g* - (Q / 2) (w b - w a)` is
entropy stable at `(a, b)` exactly when `Q ≥ 0`. -/
theorem entropyStable_viscosityForm_iff (w f qf : ℝ → ℝ) {a b : ℝ} (hab : a ≠ b)
    (hw : w a ≠ w b) (Q : ℝ) :
    (w b - w a) * (entropyConservativeFlux w f qf a b - Q / 2 * (w b - w a)) ≤
        entropyFluxPotential (V := ℝ) w f qf b - entropyFluxPotential (V := ℝ) w f qf a ↔
      0 ≤ Q := by
  have hw' : w b - w a ≠ 0 := sub_ne_zero.mpr (Ne.symm hw)
  have key : (w b - w a) * entropyConservativeFlux w f qf a b =
      entropyFluxPotential (V := ℝ) w f qf b - entropyFluxPotential (V := ℝ) w f qf a := by
    rw [entropyConservativeFlux]; simp only [hab, ↓reduceIte]
    field_simp
  rw [mul_sub, key]
  constructor
  · intro h
    have h2 : 0 ≤ Q / 2 * (w b - w a) ^ 2 := by nlinarith
    have hsq : 0 < (w b - w a) ^ 2 := by positivity
    by_contra hQ
    push Not at hQ
    nlinarith
  · intro hQ
    have : 0 ≤ (w b - w a) * (Q / 2 * (w b - w a)) := by nlinarith [sq_nonneg (w b - w a)]
    linarith

/-- Check (7.3): for Burgers' flux with `η = u² / 2` (`w = u`, `q = u³ / 3`) the flux is
`(a² + a b + b²) / 6`. -/
theorem entropyConservativeFlux_burgers (a b : ℝ) :
    entropyConservativeFlux id (fun u => u ^ 2 / 2) (fun u => u ^ 3 / 3) a b =
      (a ^ 2 + a * b + b ^ 2) / 6 := by
  unfold entropyConservativeFlux entropyFluxPotential
  split_ifs with h
  · subst h; simp; ring
  · have : b - a ≠ 0 := sub_ne_zero.mpr (Ne.symm h)
    simp only [id, RCLike.inner_apply, conj_trivial]
    field_simp
    ring

/-- Check (7.3): for Burgers' flux with `η = -log u` on `u > 0` (`w = -1 / u`, `q = -u`) the
flux is `a b / 2`. -/
theorem entropyConservativeFlux_burgers_log {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (hab : a ≠ b) :
    entropyConservativeFlux (fun u => -1 / u) (fun u => u ^ 2 / 2) (fun u => -u) a b =
      a * b / 2 := by
  unfold entropyConservativeFlux entropyFluxPotential
  simp only [hab, ↓reduceIte]
  have h1 : b - a ≠ 0 := sub_ne_zero.mpr (Ne.symm hab)
  simp only [RCLike.inner_apply, conj_trivial]
  have h2 : (-1 / b - -1 / a) = (b - a) / (a * b) := by field_simp; ring
  rw [h2]
  field_simp
  ring

end Tadmor

/-! ## Layer 8: the Riemann problem for systems -/

section Systems

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]

/-- 8.1 A **weak solution** of the system `∂ₜu + ∂ₓf(u) = 0` on `(0, ∞) × ℝ` with datum `u₀`:
measurable and essentially bounded, with the integral identity for every `C¹` test function of
compact support on `[0, ∞) × ℝ`. -/
def IsWeakConservationLaw (f : E → E) (u₀ : ℝ → E) (u : ℝ → ℝ → E) : Prop :=
  LocallyIntegrable u₀ volume ∧
  AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume) ∧
  (∃ M : ℝ, ∀ᵐ z ∂((volume.restrict (Ioi 0)).prod volume), ‖u z.1 z.2‖ ≤ M) ∧
  ∀ φ : ℝ × ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
    (∫ t in Ioi 0, ∫ x, (fderiv ℝ φ (t, x) (1, 0) • u t x + fderiv ℝ φ (t, x) (0, 1) • f (u t x)))
      + ∫ x, φ (0, x) • u₀ x = 0

/-- 8.1 Riemann data: `a` on `x < 0` and `b` on `x ≥ 0`. -/
def riemannData (a b : E) (x : ℝ) : E := if x < 0 then a else b

/-- Check: for a scalar law, `IsWeakConservationLaw` is the integral solution of
HamiltonJacobiAndConservationLaws §5.1. -/
theorem isWeakConservationLaw_iff_isIntegralSolution (f u₀ : ℝ → ℝ) (u : ℝ → ℝ → ℝ) :
    IsWeakConservationLaw f u₀ u ↔ IsIntegralSolution f u₀ u := by
  simp only [IsWeakConservationLaw, IsIntegralSolution, smul_eq_mul, Real.norm_eq_abs, mul_comm]

/-- 8.1 **The Rankine–Hugoniot condition for systems.** The single jump from `a` to `b` with
speed `s` is a weak solution exactly when `f b - f a = s • (b - a)`. -/
theorem isWeakConservationLaw_singleJump_iff (f : E → E) (a b : E) (s : ℝ) :
    IsWeakConservationLaw f (riemannData a b) (fun t x => if x < s * t then a else b) ↔
      f b - f a = s • (b - a) := by
  sorry

variable {m : ℕ}

/-- 8.2 **Strict hyperbolicity** on an open set `U` of states, with characteristic speeds
`lam k` (the README's `λ_k`) strictly increasing in `k` and right eigenvectors `r k`; the flux is
`C²` and the speeds and eigenvectors are `C¹` on `U`. -/
def IsStrictlyHyperbolicOn (f : (Fin m → ℝ) → Fin m → ℝ) (U : Set (Fin m → ℝ))
    (lam : Fin m → (Fin m → ℝ) → ℝ) (r : Fin m → (Fin m → ℝ) → Fin m → ℝ) : Prop :=
  IsOpen U ∧ ContDiffOn ℝ 2 f U ∧ (∀ k, ContDiffOn ℝ 1 (lam k) U ∧ ContDiffOn ℝ 1 (r k) U) ∧
    ∀ u ∈ U, StrictMono (fun k => lam k u) ∧
      ∀ k, r k u ≠ 0 ∧ fderiv ℝ f u (r k u) = lam k u • r k u

/-- 8.2 The `k`-th field is **genuinely nonlinear** on `U`, normalized by `∇λ_k · r_k > 0`. -/
def IsGenuinelyNonlinearOn (lam : Fin m → (Fin m → ℝ) → ℝ) (r : Fin m → (Fin m → ℝ) → Fin m → ℝ)
    (k : Fin m) (U : Set (Fin m → ℝ)) : Prop :=
  ∀ u ∈ U, 0 < fderiv ℝ (lam k) u (r k u)

/-- 8.2 The `k`-th field is **linearly degenerate** on `U`: `∇λ_k · r_k = 0`. -/
def IsLinearlyDegenerateOn (lam : Fin m → (Fin m → ℝ) → ℝ) (r : Fin m → (Fin m → ℝ) → Fin m → ℝ)
    (k : Fin m) (U : Set (Fin m → ℝ)) : Prop :=
  ∀ u ∈ U, fderiv ℝ (lam k) u (r k u) = 0

/-- 8.2 A **Lax `k`-shock** from `a` to `b` with speed `s`. -/
def IsLaxShock (f : (Fin m → ℝ) → Fin m → ℝ) (lam : Fin m → (Fin m → ℝ) → ℝ) (k : Fin m)
    (a b : Fin m → ℝ) (s : ℝ) : Prop :=
  f b - f a = s • (b - a) ∧ lam k b < s ∧ s < lam k a ∧ (∀ i, i < k → lam i a < s) ∧
    ∀ i, k < i → s < lam i b

/-- 8.2 A **`k`-contact discontinuity** from `a` to `b` with speed `s`. -/
def IsContact (f : (Fin m → ℝ) → Fin m → ℝ) (lam : Fin m → (Fin m → ℝ) → ℝ) (k : Fin m)
    (a b : Fin m → ℝ) (s : ℝ) : Prop :=
  f b - f a = s • (b - a) ∧ lam k a = s ∧ lam k b = s

/-- 8.2 A **`k`-rarefaction fan** on `[σ, τ]`: `λ_k (W ξ) = ξ` and `W' ∥ r_k(W)` there. -/
def IsRarefactionFan (lam : Fin m → (Fin m → ℝ) → ℝ) (r : Fin m → (Fin m → ℝ) → Fin m → ℝ)
    (k : Fin m) (W : ℝ → Fin m → ℝ) (σ τ : ℝ) : Prop :=
  σ < τ ∧ ∀ ξ ∈ Icc σ τ, lam k (W ξ) = ξ ∧ ∃ c : ℝ, HasDerivWithinAt W (c • r k (W ξ)) (Icc σ τ) ξ

/-- 8.2 An **elementary `k`-wave** from `a` to `b` occupying the speeds `[σ, τ]` of the profile
`W`: trivial, a Lax shock or contact at the single speed `σ = τ`, or a rarefaction fan. -/
def IsElementaryWave (f : (Fin m → ℝ) → Fin m → ℝ) (lam : Fin m → (Fin m → ℝ) → ℝ)
    (r : Fin m → (Fin m → ℝ) → Fin m → ℝ) (k : Fin m) (a b : Fin m → ℝ) (W : ℝ → Fin m → ℝ)
    (σ τ : ℝ) : Prop :=
  (a = b ∧ σ = τ) ∨ (σ = τ ∧ (IsLaxShock f lam k a b σ ∨ IsContact f lam k a b σ)) ∨
    (W σ = a ∧ W τ = b ∧ IsRarefactionFan lam r k W σ τ)

/-- 8.2 A **Riemann fan** from `a` to `b` with states in `U`: intermediate states
`a = u 0, …, u m = b` separated by elementary waves of the families `1, …, m` (here `0, …, m - 1`)
in increasing order of speed, the profile `W ξ` being constant between waves. -/
def IsRiemannFan (f : (Fin m → ℝ) → Fin m → ℝ) (lam : Fin m → (Fin m → ℝ) → ℝ)
    (r : Fin m → (Fin m → ℝ) → Fin m → ℝ) (U : Set (Fin m → ℝ)) (a b : Fin m → ℝ)
    (W : ℝ → Fin m → ℝ) : Prop :=
  ∃ (u : Fin (m + 1) → Fin m → ℝ) (σ τ : Fin m → ℝ),
    u 0 = a ∧ u (Fin.last m) = b ∧ (∀ i, u i ∈ U) ∧ (∀ ξ, W ξ ∈ U) ∧
    (∀ k, σ k ≤ τ k) ∧ (∀ k k', k < k' → τ k ≤ σ k') ∧
    (∀ ξ, (∀ k, ξ < σ k) → W ξ = a) ∧ (∀ ξ, (∀ k, τ k < ξ) → W ξ = b) ∧
    (∀ k k' : Fin m, k.val + 1 = k'.val → ∀ ξ, τ k < ξ → ξ < σ k' → W ξ = u k.succ) ∧
    ∀ k, IsElementaryWave f lam r k (u k.castSucc) (u k.succ) W (σ k) (τ k)

variable {f : (Fin m → ℝ) → Fin m → ℝ} {U : Set (Fin m → ℝ)} {lam : Fin m → (Fin m → ℝ) → ℝ}
  {r : Fin m → (Fin m → ℝ) → Fin m → ℝ}

/-- 8.2 **A Riemann fan is a weak solution** of the Riemann problem. -/
theorem isWeakConservationLaw_of_isRiemannFan (hhyp : IsStrictlyHyperbolicOn f U lam r)
    {a b : Fin m → ℝ} {W : ℝ → Fin m → ℝ} (hW : IsRiemannFan f lam r U a b W) :
    IsWeakConservationLaw f (riemannData a b) (fun t x => W (x / t)) := by
  sorry

/-- 8.3 **Hugoniot curves and the Lax condition.** In a genuinely nonlinear field, through each
state `a ∈ U` there is a `C¹` curve `H` of states joined to `a` by a jump satisfying the
Rankine–Hugoniot condition with speed `s ε`, tangent to `r_k(a)` with `s 0 = λ_k(a)`; for small
`ε ≠ 0` the jump is a Lax `k`-shock exactly when `ε < 0`. -/
theorem exists_hugoniotCurve (hhyp : IsStrictlyHyperbolicOn f U lam r) {k : Fin m}
    (hk : IsGenuinelyNonlinearOn lam r k U) {a : Fin m → ℝ} (ha : a ∈ U) :
    ∃ ε₀ > 0, ∃ (H : ℝ → Fin m → ℝ) (s : ℝ → ℝ),
      ContDiffOn ℝ 1 H (Ioo (-ε₀) ε₀) ∧ ContinuousOn s (Ioo (-ε₀) ε₀) ∧ H 0 = a ∧
      HasDerivAt H (r k a) 0 ∧ s 0 = lam k a ∧ (∀ ε ∈ Ioo (-ε₀) ε₀, H ε ∈ U) ∧
      (∀ ε ∈ Ioo (-ε₀) ε₀, f (H ε) - f a = s ε • (H ε - a)) ∧
      ∀ ε ∈ Ioo (-ε₀) ε₀, ε ≠ 0 → (IsLaxShock f lam k a (H ε) (s ε) ↔ ε < 0) := by
  sorry

/-- 8.4 **Wave curves.** If every field is genuinely nonlinear or linearly degenerate, then near
each state `uL ∈ U` and for each `k` there is a map `Φ`, `C¹` in `(ε, a)`, with `Φ 0 a = a`,
`∂_ε Φ(0, a) = r_k(a)`, such that `a` and `Φ ε a` are joined by an elementary `k`-wave. -/
theorem exists_waveCurve (hhyp : IsStrictlyHyperbolicOn f U lam r)
    (hfield : ∀ k, IsGenuinelyNonlinearOn lam r k U ∨ IsLinearlyDegenerateOn lam r k U)
    {uL : Fin m → ℝ} (huL : uL ∈ U) (k : Fin m) :
    ∃ V ∈ 𝓝 uL, ∃ ε₀ > 0, ∃ Φ : ℝ → (Fin m → ℝ) → Fin m → ℝ,
      ContDiffOn ℝ 1 (Function.uncurry Φ) (Ioo (-ε₀) ε₀ ×ˢ V) ∧ (∀ a ∈ V, Φ 0 a = a) ∧
      (∀ a ∈ V, HasDerivAt (fun ε => Φ ε a) (r k a) 0) ∧
      ∀ a ∈ V, ∀ ε ∈ Ioo (-ε₀) ε₀, Φ ε a ∈ U ∧
        ∃ (W : ℝ → Fin m → ℝ) (σ τ : ℝ), (∀ ξ ∈ Icc σ τ, W ξ ∈ U) ∧
          IsElementaryWave f lam r k a (Φ ε a) W σ τ := by
  sorry

/-- 8.5 **Lax's theorem.** If every field is genuinely nonlinear or linearly degenerate, each
`uL ∈ U` has a neighbourhood `V ⊆ U` such that for `uR ∈ V` the Riemann problem has a Riemann
fan with states in `V`, unique up to null sets of speeds. -/
theorem exists_selfSimilar_riemann_solution (hhyp : IsStrictlyHyperbolicOn f U lam r)
    (hfield : ∀ k, IsGenuinelyNonlinearOn lam r k U ∨ IsLinearlyDegenerateOn lam r k U)
    {uL : Fin m → ℝ} (huL : uL ∈ U) :
    ∃ V ∈ 𝓝 uL, V ⊆ U ∧ ∀ uR ∈ V, (∃ W, IsRiemannFan f lam r V uL uR W) ∧
      ∀ W W', IsRiemannFan f lam r V uL uR W → IsRiemannFan f lam r V uL uR W' →
        W =ᵐ[volume] W' := by
  sorry

/-! ## Layer 9: small total variation -/

/-- 9.1 `u` has at `(t, x)` an approximate jump from `a` to `b` with speed `σ`: the mean of
`‖u - U‖` over `[t - ρ, t + ρ] × [x - ρ, x + ρ]`, `U` the jump along `y = x + σ (s - t)`,
tends to `0`. -/
def IsApproxJumpPoint (u : ℝ → ℝ → Fin m → ℝ) (t x : ℝ) (a b : Fin m → ℝ) (σ : ℝ) : Prop :=
  Tendsto (fun ρ : ℝ => (ENNReal.ofReal (ρ ^ 2))⁻¹ * ∫⁻ s in Icc (t - ρ) (t + ρ),
    ∫⁻ y in Icc (x - ρ) (x + ρ), ‖u s y - (if y < x + σ * (s - t) then a else b)‖ₑ)
    (𝓝[>] 0) (𝓝 0)

/-- 9.1 **Lax's condition at jumps** (Holden–Risebro, condition B): at every approximate jump
point at a positive time some family `k` has `λ_k(b) ≤ σ ≤ λ_k(a)`. -/
def SatisfiesLaxAtJumps (lam : Fin m → (Fin m → ℝ) → ℝ) (u : ℝ → ℝ → Fin m → ℝ) : Prop :=
  ∀ t > 0, ∀ x a b σ, IsApproxJumpPoint u t x a b σ → a ≠ b → ∃ k, lam k b ≤ σ ∧ σ ≤ lam k a

/-- 9.1 **Bounded variation along space-like curves** (Holden–Risebro, condition C): along every
positive `β`-Lipschitz curve `t = γ x`, `x ↦ u (γ x) x` has locally bounded variation. -/
def HasBVAlongCurves (u : ℝ → ℝ → Fin m → ℝ) (β : ℝ≥0) : Prop :=
  0 < β ∧ ∀ γ : ℝ → ℝ, LipschitzWith β γ → (∀ x, 0 < γ x) →
    ∀ a b, eVariationOn (fun x => u (γ x) x) (Icc a b) ≠ ⊤

/-- 9.1 **Lipschitz continuity in time.** A weak solution with values in `K`, where `f` is
`L`-Lipschitz, and with variation at most `C` at every time, satisfies
`‖u t - u s‖₁ ≤ C L |t - s|` for almost all `s, t > 0`. -/
theorem lintegral_sub_le_of_isWeakConservationLaw {K : Set (Fin m → ℝ)} {L : ℝ≥0}
    (hf : LipschitzOnWith L f K) {u₀ : ℝ → Fin m → ℝ} {u : ℝ → ℝ → Fin m → ℝ}
    (hu : IsWeakConservationLaw f u₀ u) (huK : ∀ t x, u t x ∈ K) {C : ℝ}
    (hC : ∀ t > 0, eVariationOn (u t) univ ≤ ENNReal.ofReal C) :
    ∀ᵐ s ∂(volume.restrict (Ioi 0)), ∀ᵐ t ∂(volume.restrict (Ioi 0)),
      ∫⁻ x, ‖u t x - u s x‖ₑ ≤ ENNReal.ofReal (C * L * |t - s|) := by
  sorry

/-- 9.2 **Front-tracking approximations.** Near a state `ū ∈ U`, data of small variation have, for
each `δ ∈ (0, 1]`, a measurable piecewise constant approximation `w δ` with finitely many jumps
at each time, variation bounded by `C` times that of the data, uniformly `L¹`-Lipschitz in time,
initial error at most `δ`, and weak residual tending to `0` with `δ` for every test function. -/
theorem exists_frontTracking (hhyp : IsStrictlyHyperbolicOn f U lam r)
    (hfield : ∀ k, IsGenuinelyNonlinearOn lam r k U ∨ IsLinearlyDegenerateOn lam r k U)
    {ū : Fin m → ℝ} (hū : ū ∈ U) :
    ∃ δ₀ > 0, ∃ C : ℝ, ∀ u₀ : ℝ → Fin m → ℝ, Measurable u₀ →
      Integrable (fun x => u₀ x - ū) volume → (∀ x, ‖u₀ x - ū‖ < δ₀) →
      eVariationOn u₀ univ < ENNReal.ofReal δ₀ →
      ∃ w : ℝ → ℝ → ℝ → Fin m → ℝ, ∀ δ ∈ Ioc (0 : ℝ) 1,
        Measurable (Function.uncurry (w δ)) ∧ (∀ t x, w δ t x ∈ U) ∧
        (∀ t ≥ 0, ∃ s : Finset ℝ, ∀ x y, x ≤ y → (∀ z ∈ s, z ∉ Icc x y) → w δ t x = w δ t y) ∧
        (∀ t ≥ 0, eVariationOn (w δ t) univ ≤ ENNReal.ofReal C * eVariationOn u₀ univ) ∧
        (∀ s ≥ 0, ∀ t ≥ 0, ∫⁻ x, ‖w δ t x - w δ s x‖ₑ ≤
          ENNReal.ofReal (C * |t - s|) * eVariationOn u₀ univ) ∧
        ∫⁻ x, ‖w δ 0 x - u₀ x‖ₑ ≤ ENNReal.ofReal δ ∧
        ∀ φ : ℝ × ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
          Tendsto (fun δ' => ‖(∫ t in Ioi 0, ∫ x, (fderiv ℝ φ (t, x) (1, 0) • w δ' t x +
            fderiv ℝ φ (t, x) (0, 1) • f (w δ' t x))) + ∫ x, φ (0, x) • u₀ x‖)
            (𝓝[>] 0) (𝓝 0) := by
  sorry

/-- 9.3 **Global existence for small variation.** Near `ū ∈ U` there are `δ, C, β` such that
data with `‖u₀ - ū‖ < δ`, `u₀ - ū` integrable and variation below `δ` have a global weak
solution with values in `U`, variation at most `C` times that of the data at all times,
Lax's condition at its jumps, and bounded variation along `β`-Lipschitz curves. -/
theorem exists_isWeakConservationLaw_smallTV (hhyp : IsStrictlyHyperbolicOn f U lam r)
    (hfield : ∀ k, IsGenuinelyNonlinearOn lam r k U ∨ IsLinearlyDegenerateOn lam r k U)
    {ū : Fin m → ℝ} (hū : ū ∈ U) :
    ∃ δ > 0, ∃ (C : ℝ) (β : ℝ≥0), ∀ u₀ : ℝ → Fin m → ℝ, Measurable u₀ →
      Integrable (fun x => u₀ x - ū) volume → (∀ x, ‖u₀ x - ū‖ < δ) →
      eVariationOn u₀ univ < ENNReal.ofReal δ →
      ∃ u : ℝ → ℝ → Fin m → ℝ, IsWeakConservationLaw f u₀ u ∧ (∀ t x, u t x ∈ U) ∧
        (∀ t ≥ 0, eVariationOn (u t) univ ≤ ENNReal.ofReal C * eVariationOn u₀ univ) ∧
        SatisfiesLaxAtJumps lam u ∧ HasBVAlongCurves u β := by
  sorry

/-- 9.4 **The standard Riemann semigroup.** Near `ū ∈ U` there are a domain `D` containing all
data of small variation near `ū` and a semigroup `S` on `D` that is `L¹`-Lipschitz in the data
with a constant independent of time, whose trajectories are weak solutions with Lax's condition
at jumps and bounded variation along curves, and every weak solution with these properties and
with values in `D` at positive times is the trajectory of `S`. -/
theorem exists_smallVariation_conservation_semigroup (hhyp : IsStrictlyHyperbolicOn f U lam r)
    (hfield : ∀ k, IsGenuinelyNonlinearOn lam r k U ∨ IsLinearlyDegenerateOn lam r k U)
    {ū : Fin m → ℝ} (hū : ū ∈ U) :
    ∃ δ > 0, ∃ (C : ℝ) (β : ℝ≥0) (D : Set (ℝ → Fin m → ℝ))
      (S : ℝ → (ℝ → Fin m → ℝ) → ℝ → Fin m → ℝ),
      (∀ u₀ : ℝ → Fin m → ℝ, Measurable u₀ → Integrable (fun x => u₀ x - ū) volume →
        (∀ x, ‖u₀ x - ū‖ < δ) → eVariationOn u₀ univ < ENNReal.ofReal δ → u₀ ∈ D) ∧
      (∀ v ∈ D, ∀ t ≥ 0, S t v ∈ D) ∧ (∀ v ∈ D, S 0 v =ᵐ[volume] v) ∧
      (∀ v ∈ D, ∀ s ≥ 0, ∀ t ≥ 0, S (s + t) v =ᵐ[volume] S s (S t v)) ∧
      (∀ v ∈ D, ∀ w ∈ D, ∀ t ≥ 0,
        ∫⁻ x, ‖S t v x - S t w x‖ₑ ≤ ENNReal.ofReal C * ∫⁻ x, ‖v x - w x‖ₑ) ∧
      (∀ v ∈ D, IsWeakConservationLaw f v (fun t => S t v) ∧ (∀ t x, S t v x ∈ U) ∧
        SatisfiesLaxAtJumps lam (fun t => S t v) ∧ HasBVAlongCurves (fun t => S t v) β) ∧
      ∀ v ∈ D, ∀ u : ℝ → ℝ → Fin m → ℝ, IsWeakConservationLaw f v u →
        (∀ t > 0, u t ∈ D) → SatisfiesLaxAtJumps lam u → HasBVAlongCurves u β →
        ∀ᵐ t ∂(volume.restrict (Ioi 0)), u t =ᵐ[volume] S t v := by
  sorry

end Systems

#check @TauCeti.totalVariationOn
#check @eVariationOn
#check @LocallyLipschitz
#check @LipschitzOnWith
#check @LocallyIntegrable
#check @HasCompactSupport
#check @Asymptotics.IsBigO
#check @HasStrictFDerivAt.implicitFunction
#check @LipschitzOnWith.comp_eVariationOn_le
#check @ODE_solution_unique
#check @TauCeti.lintegral_enorm_comp_add_sub_le_mul_totalVariationOn
#check @TauCeti.exists_subseq_tendsto_setLIntegral_enorm_sub_of_totalVariationOn_le
#check @TauCeti.Real.ofReal_sum_abs_sub_le_totalVariationOn
#check @intervalIntegral.integral_eq_sub_of_hasDerivAt

end TauCetiRoadmap.FiniteVolumeSchemesAndHyperbolicSystems
