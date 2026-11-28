import Mathlib
import TauCeti.Analysis.Semigroups.Basic

/-!
# Lax equivalence and finite difference schemes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

Layer 1 is the abstract theory of Lax and Richtmyer: a family `C τ` of bounded one-step operators
on a real Banach space approximating a strongly continuous semigroup `S` (the Tau Ceti
`TauCeti.Semigroups.StronglyContinuousSemigroup`). Layer 2 is von Neumann's Fourier criterion for
constant-coefficient two-level schemes on the periodic grids `ZMod N`, with the classical schemes
for the heat and transport equations. Every headline theorem of the README is stated here.
-/

open Filter Topology NNReal Real

namespace TauCetiRoadmap.LaxEquivalenceAndFiniteDifferenceSchemes

open TauCeti.Semigroups

/-! ## Layer 1: the Lax–Richtmyer theorem -/

section Abstract

variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]

/-- §1.1 Stability on `[0, T]`: for some `τ₀ > 0` the powers `(C τ)ⁿ` with `0 < τ ≤ τ₀` and
`n τ ≤ T` are bounded in operator norm by one constant. -/
def IsStableScheme (C : ℝ≥0 → X →L[ℝ] X) (T : ℝ≥0) : Prop :=
  ∃ τ₀ : ℝ≥0, 0 < τ₀ ∧ ∃ K : ℝ, ∀ τ : ℝ≥0, 0 < τ → τ ≤ τ₀ → ∀ n : ℕ,
    (n : ℝ≥0) * τ ≤ T → ‖C τ ^ n‖ ≤ K

/-- §1.1 Consistency on `[0, T]`: on a dense set of initial values `x` the one-step error
`C τ (S t x) - S τ (S t x)` is `o(τ)` as `τ → 0⁺`, uniformly for `t ∈ [0, T]`. -/
def IsConsistentScheme (S : StronglyContinuousSemigroup X) (C : ℝ≥0 → X →L[ℝ] X)
    (T : ℝ≥0) : Prop :=
  ∃ D : Set X, Dense D ∧ ∀ x ∈ D, ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ≥0, 0 < δ ∧
    ∀ τ : ℝ≥0, 0 < τ → τ < δ → ∀ t : ℝ≥0, t ≤ T →
      ‖C τ (S t x) - S τ (S t x)‖ ≤ ε * τ

/-- §1.1 Convergence on `[0, T]`: for every initial value `x`, every sequence of steps
`τ j > 0` tending to `0` and every sequence of step counts `n j` with `n j * τ j ≤ T` and
`n j * τ j → t`, the approximations `(C (τ j)) ^ (n j) x` tend to `S t x`. -/
def IsConvergentScheme (S : StronglyContinuousSemigroup X) (C : ℝ≥0 → X →L[ℝ] X)
    (T : ℝ≥0) : Prop :=
  ∀ (x : X) (τ : ℕ → ℝ≥0) (n : ℕ → ℕ) (t : ℝ≥0), (∀ j, 0 < τ j) →
    Tendsto τ atTop (𝓝 0) → (∀ j, (n j : ℝ≥0) * τ j ≤ T) →
    Tendsto (fun j => (n j : ℝ≥0) * τ j) atTop (𝓝 t) →
    Tendsto (fun j => (C (τ j) ^ n j) x) atTop (𝓝 (S t x))

/-- §1.2 Global error bound: a power bound `K` and a local error `c τ ^ (p + 1)` along the orbit
of `x` give the global error `K c T τ ^ p` at every time `n τ ≤ T`. -/
theorem norm_pow_apply_sub_le (S : StronglyContinuousSemigroup X) (C : ℝ≥0 → X →L[ℝ] X)
    {T τ₀ : ℝ≥0} {K c p : ℝ}
    (hstab : ∀ τ : ℝ≥0, 0 < τ → τ ≤ τ₀ → ∀ n : ℕ, (n : ℝ≥0) * τ ≤ T → ‖C τ ^ n‖ ≤ K)
    {x : X}
    (hloc : ∀ τ : ℝ≥0, 0 < τ → τ ≤ τ₀ → ∀ t : ℝ≥0, t ≤ T →
      ‖C τ (S t x) - S τ (S t x)‖ ≤ c * (τ : ℝ) ^ (p + 1))
    {τ : ℝ≥0} (hτ : 0 < τ) (hτ₀ : τ ≤ τ₀) {n : ℕ} (hn : (n : ℝ≥0) * τ ≤ T) :
    ‖(C τ ^ n) x - S ((n : ℝ≥0) * τ) x‖ ≤ K * c * T * (τ : ℝ) ^ p := by
  sorry

/-- §1.3 Perturbation of a stable family: adding operators of norm at most `L τ` keeps the
powers bounded, by `K exp (K L T)`. -/
theorem norm_add_pow_le (C B : ℝ≥0 → X →L[ℝ] X) {T τ₀ : ℝ≥0} {K L : ℝ}
    (hstab : ∀ τ : ℝ≥0, 0 < τ → τ ≤ τ₀ → ∀ n : ℕ, (n : ℝ≥0) * τ ≤ T → ‖C τ ^ n‖ ≤ K)
    (hB : ∀ τ : ℝ≥0, 0 < τ → τ ≤ τ₀ → ‖B τ‖ ≤ L * τ)
    {τ : ℝ≥0} (hτ : 0 < τ) (hτ₀ : τ ≤ τ₀) {n : ℕ} (hn : (n : ℝ≥0) * τ ≤ T) :
    ‖(C τ + B τ) ^ n‖ ≤ K * Real.exp (K * L * T) := by
  sorry

/-- §1.4 A convergent scheme on a Banach space is stable (Lax–Richtmyer, by uniform
boundedness). -/
theorem IsConvergentScheme.isStableScheme [CompleteSpace X] {S : StronglyContinuousSemigroup X}
    {C : ℝ≥0 → X →L[ℝ] X} {T : ℝ≥0} (h : IsConvergentScheme S C T) : IsStableScheme C T := by
  sorry

/-- §1.5 The Lax equivalence theorem: for a consistent scheme on a Banach space, convergence is
equivalent to stability. -/
theorem isConvergentScheme_iff_isStableScheme [CompleteSpace X]
    (S : StronglyContinuousSemigroup X) (C : ℝ≥0 → X →L[ℝ] X) (T : ℝ≥0)
    (hcons : IsConsistentScheme S C T) : IsConvergentScheme S C T ↔ IsStableScheme C T := by
  sorry

end Abstract

/-! ## Layer 2: von Neumann analysis on periodic grids -/

section Periodic

/-- §2.1 The symbol of a stencil `a`: `θ ↦ ∑ₘ aₘ e^{i m θ}`. -/
noncomputable def stencilSymbol (a : ℤ →₀ ℂ) (θ : ℝ) : ℂ :=
  a.sum fun m c => c * Complex.exp (m * θ * Complex.I)

/-- §2.1 The matrix of the stencil `a` on `ZMod N`, sending `u` to `j ↦ ∑ₘ aₘ u (j + m)`: the
circulant matrix whose first column puts `aₘ` in row `-m`. -/
noncomputable def stencilMatrix (a : ℤ →₀ ℂ) (N : ℕ) : Matrix (ZMod N) (ZMod N) ℂ :=
  Matrix.circulant fun r => a.sum fun m c => if ((-m : ℤ) : ZMod N) = r then c else 0

/-- §2.2 The `ℓ²` operator norm of the `n`-th power of the two-level scheme `B u' = A u` on
`ZMod N` is the `n`-th power of the largest modulus of its amplification factor at the grid
frequencies `2πk/N`. -/
theorem norm_toEuclideanCLM_pow (a b : ℤ →₀ ℂ) (N : ℕ) [NeZero N]
    (hb : ∀ k : ZMod N, stencilSymbol b (2 * π * k.val / N) ≠ 0) (n : ℕ) :
    ‖Matrix.toEuclideanCLM (𝕜 := ℂ) (((stencilMatrix b N)⁻¹ * stencilMatrix a N) ^ n)‖ =
      ‖fun k : ZMod N =>
        stencilSymbol a (2 * π * k.val / N) / stencilSymbol b (2 * π * k.val / N)‖ ^ n := by
  sorry

/-- §2.3 The von Neumann criterion: a two-level scheme whose implicit symbol never vanishes has
powers bounded uniformly in the grid size and the number of steps if and only if its
amplification factor has modulus at most `1` at every frequency. -/
theorem exists_forall_norm_pow_le_iff (a b : ℤ →₀ ℂ) (hb : ∀ θ : ℝ, stencilSymbol b θ ≠ 0) :
    (∃ K : ℝ, ∀ (N : ℕ) [NeZero N] (n : ℕ),
      ‖Matrix.toEuclideanCLM (𝕜 := ℂ) (((stencilMatrix b N)⁻¹ * stencilMatrix a N) ^ n)‖ ≤ K) ↔
      ∀ θ : ℝ, ‖stencilSymbol a θ‖ ≤ ‖stencilSymbol b θ‖ := by
  sorry

/-- §2.4 The weighted (θ-) method for the heat equation with weight `w` and mesh ratio
`μ = τ/h² ≥ 0` is stable on all periodic grids if and only if `2 (1 - 2w) μ ≤ 1`. -/
theorem weightedHeat_exists_forall_norm_pow_le_iff (w μ : ℝ) (hμ : 0 ≤ μ) :
    (∃ K : ℝ, ∀ (N : ℕ) [NeZero N] (n : ℕ),
      ‖Matrix.toEuclideanCLM (𝕜 := ℂ)
        (((stencilMatrix (Finsupp.single 0 1 - ((w * μ : ℝ) : ℂ) •
            (Finsupp.single (-1) 1 + Finsupp.single 0 (-2) + Finsupp.single 1 1)) N)⁻¹ *
          stencilMatrix (Finsupp.single 0 1 + (((1 - w) * μ : ℝ) : ℂ) •
            (Finsupp.single (-1) 1 + Finsupp.single 0 (-2) + Finsupp.single 1 1)) N) ^ n)‖ ≤ K) ↔
      2 * (1 - 2 * w) * μ ≤ 1 := by
  sorry

/-- §2.5 Three explicit schemes for `u_t + a u_x = 0` with Courant number `ν = a τ / h`: the
upwind scheme `u_j ↦ (1 - ν) u_j + ν u_{j-1}` is stable on all periodic grids if and only if
`0 ≤ ν ≤ 1`, the Lax–Wendroff scheme if and only if `|ν| ≤ 1`, and the centred explicit scheme
`u_j ↦ u_j - (ν/2)(u_{j+1} - u_{j-1})` only for `ν = 0`. -/
theorem transport_exists_forall_norm_pow_le_iff (ν : ℝ) :
    ((∃ K : ℝ, ∀ (N : ℕ) [NeZero N] (n : ℕ),
      ‖Matrix.toEuclideanCLM (𝕜 := ℂ)
        (stencilMatrix (Finsupp.single 0 ((1 - ν : ℝ) : ℂ) + Finsupp.single (-1) (ν : ℂ)) N ^ n)‖
          ≤ K) ↔ 0 ≤ ν ∧ ν ≤ 1) ∧
    ((∃ K : ℝ, ∀ (N : ℕ) [NeZero N] (n : ℕ),
      ‖Matrix.toEuclideanCLM (𝕜 := ℂ)
        (stencilMatrix (Finsupp.single (-1) (((ν + ν ^ 2) / 2 : ℝ) : ℂ) +
          Finsupp.single 0 ((1 - ν ^ 2 : ℝ) : ℂ) +
          Finsupp.single 1 (((ν ^ 2 - ν) / 2 : ℝ) : ℂ)) N ^ n)‖ ≤ K) ↔ |ν| ≤ 1) ∧
    ((∃ K : ℝ, ∀ (N : ℕ) [NeZero N] (n : ℕ),
      ‖Matrix.toEuclideanCLM (𝕜 := ℂ)
        (stencilMatrix (Finsupp.single (-1) ((ν / 2 : ℝ) : ℂ) + Finsupp.single 0 1 +
          Finsupp.single 1 ((-ν / 2 : ℝ) : ℂ)) N ^ n)‖ ≤ K) ↔ ν = 0) := by
  sorry

end Periodic

end TauCetiRoadmap.LaxEquivalenceAndFiniteDifferenceSchemes
