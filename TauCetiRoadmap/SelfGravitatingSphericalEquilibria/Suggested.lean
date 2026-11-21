import Mathlib

/-!
# Self-gravitating spherical equilibria: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Everything is a statement about real functions of one real variable, the radius. The Lane–Emden
nonlinearity is `(max θ 0) ^ n` with Mathlib's real power, so that it is `θ ^ n` where `θ > 0`,
vanishes where `θ ≤ 0` for `n > 0`, and is the constant `1` for `n = 0`. A solution of the
Lane–Emden equation on `[0, X)` takes the value `1` at `0`, is continuous on `[0, X)`, and solves
`θ'' + (2/ξ) θ' + (max θ 0) ^ n = 0` at every `ξ ∈ (0, X)`; continuity at `0` is what makes it the
regular solution. The Newtonian statements use the mass function `m(r) = 4π ∫₀ʳ s² ρ(s) ds` and
the hydrostatic equation `p' = −G m ρ / r²`; the Tolman–Oppenheimer–Volkoff system is the ODE
`p' = −(ρ + p)(m + 4π r³ p) / (r (r − 2m))` with `G = c = 1`. No spacetime metric is defined.
-/

noncomputable section

open Real Set MeasureTheory Filter Topology

namespace TauCetiRoadmap.SelfGravitatingSphericalEquilibria

/-! ## Layer 1: the regular solution of the Lane–Emden equation -/

/-- 1.1 The Lane–Emden nonlinearity `(max θ 0) ^ n` (real power). -/
def laneEmdenNonlin (n θ : ℝ) : ℝ := (max θ 0) ^ n

/-- 1.1 `θ` solves the Lane–Emden equation of index `n` on `[0, X)`: `θ 0 = 1`, `θ` is continuous
on `[0, X)`, and at every `ξ ∈ (0, X)` it is twice differentiable with
`θ'' + (2/ξ) θ' + (max θ 0) ^ n = 0`. -/
def IsLaneEmdenSolutionOn (n X : ℝ) (θ : ℝ → ℝ) : Prop :=
  θ 0 = 1 ∧ ContinuousOn θ (Ico 0 X) ∧
    ∀ ξ ∈ Ioo 0 X, DifferentiableAt ℝ θ ξ ∧ DifferentiableAt ℝ (deriv θ) ξ ∧
      deriv (deriv θ) ξ + 2 / ξ * deriv θ ξ + laneEmdenNonlin n (θ ξ) = 0

/-- 1.1 `θ` solves the Lane–Emden equation of index `n` on `[0, ∞)`. -/
def IsLaneEmdenSolution (n : ℝ) (θ : ℝ → ℝ) : Prop :=
  ∀ X, IsLaneEmdenSolutionOn n X θ

/-- 1.1 The Lane–Emden mass function `μ(ξ) = ∫₀^ξ s² (max (θ s) 0) ^ n ds`. -/
def laneEmdenMu (n : ℝ) (θ : ℝ → ℝ) (ξ : ℝ) : ℝ :=
  ∫ s in (0 : ℝ)..ξ, s ^ 2 * laneEmdenNonlin n (θ s)

/-- 1.2 For `n ≥ 0` and `X > 0`, a function solves the Lane–Emden equation on `[0, X)` if and only
if it is continuous on `[0, X)` and satisfies the integral equation
`θ ξ = 1 − ∫₀^ξ s (1 − s/ξ) (max (θ s) 0) ^ n ds` there. -/
theorem isLaneEmdenSolutionOn_iff {n X : ℝ} (hn : 0 ≤ n) (hX : 0 < X) (θ : ℝ → ℝ) :
    IsLaneEmdenSolutionOn n X θ ↔
      ContinuousOn θ (Ico 0 X) ∧
        ∀ ξ ∈ Ico 0 X,
          θ ξ = 1 - ∫ s in (0 : ℝ)..ξ, s * (1 - s / ξ) * laneEmdenNonlin n (θ s) := by
  sorry

/-- 1.3 For every real `n ≥ 0` the Lane–Emden equation has a solution on `[0, ∞)`, and two
solutions on the same interval `[0, X)` agree there. -/
theorem laneEmden_existsUnique {n : ℝ} (hn : 0 ≤ n) :
    (∃ θ, IsLaneEmdenSolution n θ) ∧
      ∀ X θ φ, IsLaneEmdenSolutionOn n X θ → IsLaneEmdenSolutionOn n X φ →
        EqOn θ φ (Ico 0 X) := by
  sorry

/-- 1.4 For `n ≥ 0` the solution is strictly decreasing on `[0, ∞)`. -/
theorem laneEmden_strictAntiOn {n : ℝ} (hn : 0 ≤ n) {θ : ℝ → ℝ}
    (hθ : IsLaneEmdenSolution n θ) : StrictAntiOn θ (Ici 0) := by
  sorry

/-! ## Layer 2: the solutions for n = 0, 1, 5 -/

/-- 2.1 For `n = 0` the solution is `1 − ξ²/6` on `[0, ∞)` (its first zero is `√6`; past it the
nonlinearity of index `0` is still the constant `1`). -/
theorem laneEmden_zero {θ : ℝ → ℝ} (hθ : IsLaneEmdenSolution 0 θ) :
    ∀ ξ, 0 ≤ ξ → θ ξ = 1 - ξ ^ 2 / 6 := by
  sorry

/-- 2.2 For `n = 1` the solution is `sin ξ / ξ` on `(0, π]` and `π/ξ − 1` on `[π, ∞)`. -/
theorem laneEmden_one {θ : ℝ → ℝ} (hθ : IsLaneEmdenSolution 1 θ) :
    (∀ ξ ∈ Ioc 0 π, θ ξ = sin ξ / ξ) ∧ ∀ ξ, π ≤ ξ → θ ξ = π / ξ - 1 := by
  sorry

/-- 2.3 For `n = 5` the solution is `(1 + ξ²/3) ^ (−1/2)` on `[0, ∞)`, and
`∫₀^∞ ξ² θ(ξ)⁵ dξ = √3`. -/
theorem laneEmden_five {θ : ℝ → ℝ} (hθ : IsLaneEmdenSolution 5 θ) :
    (∀ ξ, 0 ≤ ξ → θ ξ = (1 + ξ ^ 2 / 3) ^ (-(1 / 2 : ℝ))) ∧
      ∫ ξ in Ioi (0 : ℝ), ξ ^ 2 * θ ξ ^ 5 = √3 := by
  sorry

/-! ## Layer 3: the first zero -/

/-- 3.1 For `0 ≤ n < 3` the solution has a zero `ξ₁ > 0`, and it is positive on `[0, ξ₁)`. -/
theorem laneEmden_exists_zero {n : ℝ} (hn : 0 ≤ n) (hn3 : n < 3) {θ : ℝ → ℝ}
    (hθ : IsLaneEmdenSolution n θ) :
    ∃ ξ₁, 0 < ξ₁ ∧ θ ξ₁ = 0 ∧ ∀ ξ ∈ Ico 0 ξ₁, 0 < θ ξ := by
  sorry

/-- 3.2 The virial (Pohozaev) identity of the Lane–Emden equation: if `n ≥ 0` and the solution
vanishes at `ξ₁ > 0`, then `(5 − n) ∫₀^ξ₁ ξ (max θ 0)ⁿ μ(ξ) dξ = 3 μ(ξ₁)² / ξ₁`. -/
theorem laneEmden_virial {n : ℝ} (hn : 0 ≤ n) {θ : ℝ → ℝ} (hθ : IsLaneEmdenSolution n θ)
    {ξ₁ : ℝ} (hξ₁ : 0 < ξ₁) (hz : θ ξ₁ = 0) :
    (5 - n) * ∫ ξ in (0 : ℝ)..ξ₁, ξ * laneEmdenNonlin n (θ ξ) * laneEmdenMu n θ ξ =
      3 * laneEmdenMu n θ ξ₁ ^ 2 / ξ₁ := by
  sorry

/-- 3.3 For `n ≥ 5` the solution is positive on `[0, ∞)`. -/
theorem laneEmden_pos_of_five_le {n : ℝ} (hn : 5 ≤ n) {θ : ℝ → ℝ}
    (hθ : IsLaneEmdenSolution n θ) : ∀ ξ, 0 ≤ ξ → 0 < θ ξ := by
  sorry

/-! ## Layer 4: Newtonian polytropes -/

/-- 4.1 The mass function `m(r) = 4π ∫₀ʳ s² ρ(s) ds` of a radial density. -/
def massFunction (ρ : ℝ → ℝ) (r : ℝ) : ℝ :=
  4 * π * ∫ s in (0 : ℝ)..r, s ^ 2 * ρ s

/-- 4.1 Hydrostatic equilibrium on a set `S` of radii: `p' = −G m ρ / r²` at every `r ∈ S`. -/
def IsHydrostaticOn (G : ℝ) (ρ p : ℝ → ℝ) (S : Set ℝ) : Prop :=
  ∀ r ∈ S, HasDerivAt p (-(G * massFunction ρ r * ρ r / r ^ 2)) r

/-- 4.1 The length scale `α = √((n + 1) K ρc^(1/n − 1) / (4π G))` of a polytrope of index `n`,
constant `K` and central density `ρc`. -/
def polytropeScale (n K G ρc : ℝ) : ℝ :=
  √((n + 1) * K * ρc ^ (1 / n - 1) / (4 * π * G))

/-- 4.1 Every polytrope is a Lane–Emden profile: for `n > 0`, `K > 0`, `G > 0` and a
nonnegative density `ρ`, continuous at `0` from the right, the pressure `K ρ^(1 + 1/n)` is in
hydrostatic equilibrium on `(0, ∞)` if and only if `ρ r = ρ(0) (max θ(r/α) 0)ⁿ` for all
`r ≥ 0`, where `θ` is the Lane–Emden solution and `α` the scale of `ρ(0)`. -/
theorem isHydrostaticOn_polytrope_iff {n K G : ℝ} (hn : 0 < n) (hK : 0 < K) (hG : 0 < G)
    {θ : ℝ → ℝ} (hθ : IsLaneEmdenSolution n θ) {ρ : ℝ → ℝ} (hρ : ∀ r, 0 ≤ r → 0 ≤ ρ r)
    (hρ0 : ContinuousWithinAt ρ (Ici 0) 0) :
    IsHydrostaticOn G ρ (fun r ↦ K * ρ r ^ (1 + 1 / n)) (Ioi 0) ↔
      ∀ r, 0 ≤ r → ρ r = ρ 0 * laneEmdenNonlin n (θ (r / polytropeScale n K G (ρ 0))) := by
  sorry

/-- 4.2 The mass–radius relation: for `0 < n < 3` there is `C > 0` such that every polytrope of
index `n` with positive central density has a radius `R > 0` (positive density on `[0, R)`, zero
density from `R` on) and `K = C G M^((n − 1)/n) R^((3 − n)/n)` with `M = m(R)`. -/
theorem polytrope_mass_radius {n : ℝ} (hn : 0 < n) (hn3 : n < 3) :
    ∃ C > 0, ∀ K > 0, ∀ G > 0, ∀ ρ : ℝ → ℝ, 0 < ρ 0 → (∀ r, 0 ≤ r → 0 ≤ ρ r) →
      ContinuousWithinAt ρ (Ici 0) 0 →
      IsHydrostaticOn G ρ (fun r ↦ K * ρ r ^ (1 + 1 / n)) (Ioi 0) →
      ∃ R > 0, (∀ r ∈ Ico 0 R, 0 < ρ r) ∧ (∀ r, R ≤ r → ρ r = 0) ∧
        K = C * G * massFunction ρ R ^ ((n - 1) / n) * R ^ ((3 - n) / n) := by
  sorry

/-- 4.3 The gravitational energy `−4π G ∫₀^R r m(r) ρ(r) dr` of the density on `[0, R]`. -/
def gravitationalEnergy (G : ℝ) (ρ : ℝ → ℝ) (R : ℝ) : ℝ :=
  -(4 * π * G * ∫ r in (0 : ℝ)..R, r * massFunction ρ r * ρ r)

/-- 4.3 The virial identity: if `ρ` and `p` are continuous on `[0, R]`, hydrostatic on `(0, R)`
and `p R = 0`, then `3 ∫ p dV + E = 0` with `∫ p dV = 4π ∫₀^R r² p dr`. -/
theorem virial_identity {G R : ℝ} (hR : 0 ≤ R) {ρ p : ℝ → ℝ} (hρ : ContinuousOn ρ (Icc 0 R))
    (hp : ContinuousOn p (Icc 0 R)) (hyd : IsHydrostaticOn G ρ p (Ioo 0 R)) (hpR : p R = 0) :
    3 * (4 * π * ∫ r in (0 : ℝ)..R, r ^ 2 * p r) + gravitationalEnergy G ρ R = 0 := by
  sorry

/-- 4.4 The Betti–Ritter formula: for a polytrope of index `n > 0` whose density is positive on
`[0, R)` and vanishes at `R > 0`, `(5 − n) E = −3 G M² / R` with `M = m(R)`. -/
theorem polytrope_gravitationalEnergy {n K G : ℝ} (hn : 0 < n) (hK : 0 < K) (hG : 0 < G)
    {ρ : ℝ → ℝ} (hρ : ∀ r, 0 ≤ r → 0 ≤ ρ r) (hρ0 : ContinuousWithinAt ρ (Ici 0) 0)
    (hyd : IsHydrostaticOn G ρ (fun r ↦ K * ρ r ^ (1 + 1 / n)) (Ioi 0))
    {R : ℝ} (hR : 0 < R) (hpos : ∀ r ∈ Ico 0 R, 0 < ρ r) (hzero : ρ R = 0) :
    (5 - n) * gravitationalEnergy G ρ R = -(3 * G * massFunction ρ R ^ 2 / R) := by
  sorry

/-! ## Layer 5: Buchdahl's inequality for the Tolman–Oppenheimer–Volkoff system -/

/-- 5.1 `(ρ, p)` solves the Tolman–Oppenheimer–Volkoff system on `(0, R]` (units `G = c = 1`):
`2 m(r) < r` for `r ∈ (0, R]`, and `p' = −(ρ + p)(m + 4π r³ p) / (r (r − 2m))` on `(0, R)`. -/
def IsTOVSolutionOn (ρ p : ℝ → ℝ) (R : ℝ) : Prop :=
  (∀ r ∈ Ioc 0 R, 2 * massFunction ρ r < r) ∧
    ∀ r ∈ Ioo 0 R, HasDerivAt p
      (-((ρ r + p r) * (massFunction ρ r + 4 * π * r ^ 3 * p r) /
        (r * (r - 2 * massFunction ρ r)))) r

/-- 5.2 Buchdahl's inequality: if `ρ` and `p` are continuous on `[0, R]`, the mean density
`m(r)/r³` is nonincreasing on `(0, R]`, `(ρ, p)` solves the TOV system on `(0, R]` and
`p R ≥ 0`, then `2 m(R) / R < 8/9`. -/
theorem buchdahl {R : ℝ} (hR : 0 < R) {ρ p : ℝ → ℝ} (hρ : ContinuousOn ρ (Icc 0 R))
    (hmean : AntitoneOn (fun r ↦ massFunction ρ r / r ^ 3) (Ioc 0 R))
    (hp : ContinuousOn p (Icc 0 R)) (htov : IsTOVSolutionOn ρ p R) (hpR : 0 ≤ p R) :
    9 * massFunction ρ R < 4 * R := by
  sorry

/-- 5.3 The pressure of the constant-density star of density `ρ₀` and radius `R`, with
`M = 4π ρ₀ R³ / 3`: `ρ₀ (√(1 − 2M r²/R³) − √(1 − 2M/R)) / (3 √(1 − 2M/R) − √(1 − 2M r²/R³))`. -/
def constantDensityPressure (ρ₀ R r : ℝ) : ℝ :=
  ρ₀ * (√(1 - 2 * (4 * π * ρ₀ * R ^ 3 / 3) * r ^ 2 / R ^ 3) -
      √(1 - 2 * (4 * π * ρ₀ * R ^ 3 / 3) / R)) /
    (3 * √(1 - 2 * (4 * π * ρ₀ * R ^ 3 / 3) / R) -
      √(1 - 2 * (4 * π * ρ₀ * R ^ 3 / 3) * r ^ 2 / R ^ 3))

/-- 5.3 Sharpness: for `R > 0`, `ρ₀ > 0` and `M = 4π ρ₀ R³ / 3` with `9 M < 4 R`, the pressure
`constantDensityPressure ρ₀ R` is continuous on `[0, R]`, solves the TOV system with the constant
density `ρ₀`, vanishes at `R` and is nonnegative on `[0, R]`; the other hypotheses of 5.2 (a
continuous density, a nonincreasing mean density) hold for a constant density. -/
theorem buchdahl_sharp {R ρ₀ : ℝ} (hR : 0 < R) (hρ₀ : 0 < ρ₀)
    (h89 : 9 * (4 * π * ρ₀ * R ^ 3 / 3) < 4 * R) :
    ContinuousOn (constantDensityPressure ρ₀ R) (Icc 0 R) ∧
      IsTOVSolutionOn (fun _ ↦ ρ₀) (constantDensityPressure ρ₀ R) R ∧
      constantDensityPressure ρ₀ R R = 0 ∧
      ∀ r ∈ Icc 0 R, 0 ≤ constantDensityPressure ρ₀ R r := by
  sorry

end TauCetiRoadmap.SelfGravitatingSphericalEquilibria
