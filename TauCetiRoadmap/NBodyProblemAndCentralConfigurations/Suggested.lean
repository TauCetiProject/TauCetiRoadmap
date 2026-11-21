import Mathlib

/-!
# The Newtonian n-body problem and central configurations: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here.

Bodies are indexed by `Fin n` and move in a real inner product space `E`; the gravitational
constant is `1`, the force function `U = Σ_{i<j} mᵢ mⱼ / ‖xᵢ − xⱼ‖` is positive, and the moment of
inertia `Σ mⱼ ‖xⱼ‖²` carries no factor `½`. A solution on a set of times `s` is a pair of curves
(positions and velocities) with derivatives taken within `s`, collision-free on `s`. The
restricted problem of Layer 4 is written on states `(x, y, u, v) : Fin 4 → ℝ` in the rotating
frame, with the primary of mass `1 − μ` at `(−μ, 0)` and the primary of mass `μ` at `(1 − μ, 0)`.
The definitions `forwardSolutions` and `IsLyapunovStable` are copied verbatim from
LyapunovStabilityOfODEs, 1.1 and 1.2.
-/

noncomputable section

open Filter Topology Metric Set Matrix InnerProductSpace

namespace TauCetiRoadmap.NBodyProblemAndCentralConfigurations

/-! ## Design note: configurations, solutions and central configurations -/

section Bodies

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- D.1 A configuration of `n` bodies is collision-free when no two bodies share a position. -/
def IsCollisionFree (x : Fin n → E) : Prop :=
  Pairwise fun i j ↦ x i ≠ x j

/-- D.2 The Newtonian acceleration of body `j`, with gravitational constant `1`:
`Σᵢ mᵢ ‖xᵢ − xⱼ‖⁻³ (xᵢ − xⱼ)`. The term `i = j` is `0` because its vector is `0`. -/
def newtonAccel (m : Fin n → ℝ) (x : Fin n → E) (j : Fin n) : E :=
  ∑ i, (m i / ‖x i - x j‖ ^ 3) • (x i - x j)

/-- D.2 The force function (the negative of the potential energy): `Σ_{i<j} mᵢ mⱼ / ‖xᵢ − xⱼ‖`. -/
def forceFunction (m : Fin n → ℝ) (x : Fin n → E) : ℝ :=
  ∑ i, ∑ j ∈ Finset.Ioi i, m i * m j / ‖x i - x j‖

/-- D.2 The kinetic energy `½ Σ mⱼ ‖vⱼ‖²`. -/
def kineticEnergy (m : Fin n → ℝ) (v : Fin n → E) : ℝ :=
  (∑ j, m j * ‖v j‖ ^ 2) / 2

/-- D.2 The energy `T − U`. -/
def energy (m : Fin n → ℝ) (x v : Fin n → E) : ℝ :=
  kineticEnergy m v - forceFunction m x

/-- D.2 The total momentum `Σ mⱼ vⱼ`. -/
def totalMomentum (m : Fin n → ℝ) (v : Fin n → E) : E :=
  ∑ j, m j • v j

/-- D.2 The centre of mass `(Σ mⱼ)⁻¹ Σ mⱼ xⱼ`. -/
def centreOfMass (m : Fin n → ℝ) (x : Fin n → E) : E :=
  (∑ j, m j)⁻¹ • ∑ j, m j • x j

/-- D.2 The moment of inertia about the origin, `Σ mⱼ ‖xⱼ‖²` (no factor `½`). -/
def inertia (m : Fin n → ℝ) (x : Fin n → E) : ℝ :=
  ∑ j, m j * ‖x j‖ ^ 2

/-- D.2 The angular momentum about the origin, as the antisymmetric bilinear form
`(a, b) ↦ Σ mⱼ (⟪xⱼ, a⟫ ⟪vⱼ, b⟫ − ⟪xⱼ, b⟫ ⟪vⱼ, a⟫)`. -/
def angularMomentum (m : Fin n → ℝ) (x v : Fin n → E) (a b : E) : ℝ :=
  ∑ j, m j * (⟪x j, a⟫_ℝ * ⟪v j, b⟫_ℝ - ⟪x j, b⟫_ℝ * ⟪v j, a⟫_ℝ)

/-- D.2 The squared norm of the angular momentum bivector `Σ mⱼ xⱼ ∧ vⱼ`:
`Σⱼ Σₖ mⱼ mₖ (⟪xⱼ, xₖ⟫ ⟪vⱼ, vₖ⟫ − ⟪xⱼ, vₖ⟫ ⟪vⱼ, xₖ⟫)`. -/
def angularMomentumSq (m : Fin n → ℝ) (x v : Fin n → E) : ℝ :=
  ∑ j, ∑ k, m j * m k * (⟪x j, x k⟫_ℝ * ⟪v j, v k⟫_ℝ - ⟪x j, v k⟫_ℝ * ⟪v j, x k⟫_ℝ)

/-- D.3 `(x, v)` is a solution of Newton's equations on `s`: positions collision-free on `s`,
`ẋ = v` and `v̇ = newtonAccel m x`, derivatives taken within `s`. -/
structure IsSolutionOn (m : Fin n → ℝ) (x v : ℝ → Fin n → E) (s : Set ℝ) : Prop where
  collisionFree : ∀ t ∈ s, IsCollisionFree (x t)
  hasDerivWithinAt_pos : ∀ t ∈ s, HasDerivWithinAt x (v t) s t
  hasDerivWithinAt_vel : ∀ t ∈ s, HasDerivWithinAt v (newtonAccel m (x t)) s t

/-- D.4 `x` is a central configuration with constant `lam`: it is collision-free and
`newtonAccel m x j = −lam (xⱼ − c)` for every `j`, with `c` the centre of mass. -/
def IsCentralConfiguration (m : Fin n → ℝ) (x : Fin n → E) (lam : ℝ) : Prop :=
  IsCollisionFree x ∧ ∀ j, newtonAccel m x j = -lam • (x j - centreOfMass m x)

/-! ## Layer 1: First integrals -/

/-- 1.1 Conservation of momentum, and the centre of mass moves at constant velocity. -/
theorem totalMomentum_eq {m : Fin n → ℝ} {x v : ℝ → Fin n → E} {s : Set ℝ}
    (h : IsSolutionOn m x v s) (hs : s.OrdConnected) {t₀ t : ℝ} (ht₀ : t₀ ∈ s) (ht : t ∈ s) :
    totalMomentum m (v t) = totalMomentum m (v t₀) ∧
      ∑ j, m j • x t j = ∑ j, m j • x t₀ j + (t - t₀) • totalMomentum m (v t₀) := by
  sorry

/-- 1.2 Conservation of energy. -/
theorem energy_eq {m : Fin n → ℝ} {x v : ℝ → Fin n → E} {s : Set ℝ}
    (h : IsSolutionOn m x v s) (hs : s.OrdConnected) {t₀ t : ℝ} (ht₀ : t₀ ∈ s) (ht : t ∈ s) :
    energy m (x t) (v t) = energy m (x t₀) (v t₀) := by
  sorry

/-- 1.3 Conservation of angular momentum. -/
theorem angularMomentum_eq {m : Fin n → ℝ} {x v : ℝ → Fin n → E} {s : Set ℝ}
    (h : IsSolutionOn m x v s) (hs : s.OrdConnected) {t₀ t : ℝ} (ht₀ : t₀ ∈ s) (ht : t ∈ s) :
    angularMomentum m (x t) (v t) = angularMomentum m (x t₀) (v t₀) := by
  sorry

/-! ## Layer 2: The moment of inertia, Sundman's inequality and total collapse -/

/-- 2.1 **Lagrange–Jacobi.** `İ = 2 Σ mⱼ ⟪xⱼ, vⱼ⟫` and `d/dt Σ mⱼ ⟪xⱼ, vⱼ⟫ = 2T − U`, so
`Ï = 4T − 2U`. -/
theorem lagrangeJacobi {m : Fin n → ℝ} {x v : ℝ → Fin n → E} {s : Set ℝ}
    (h : IsSolutionOn m x v s) {t : ℝ} (ht : t ∈ s) :
    HasDerivWithinAt (fun τ ↦ inertia m (x τ)) (2 * ∑ j, m j * ⟪x t j, v t j⟫_ℝ) s t ∧
      HasDerivWithinAt (fun τ ↦ ∑ j, m j * ⟪x τ j, v τ j⟫_ℝ)
        (2 * kineticEnergy m (v t) - forceFunction m (x t)) s t := by
  sorry

/-- 2.2 A solution on `[0, ∞)` with at least two positive masses, total momentum `0` and
bounded mutual distances has negative energy. -/
theorem energy_neg_of_bounded (hn : 2 ≤ n) {m : Fin n → ℝ} (hm : ∀ j, 0 < m j)
    {x v : ℝ → Fin n → E} (h : IsSolutionOn m x v (Ici 0)) (hP : totalMomentum m (v 0) = 0)
    (hR : ∃ R, ∀ t, 0 ≤ t → ∀ i j, ‖x t i - x t j‖ ≤ R) :
    energy m (x 0) (v 0) < 0 := by
  sorry

/-- 2.3 **Virial theorem.** If the virial `Σ mⱼ ⟪xⱼ, vⱼ⟫` is bounded on `[0, ∞)` (for instance
when positions and velocities are), the time average of the kinetic energy tends to minus the
energy. -/
theorem tendsto_average_kineticEnergy {m : Fin n → ℝ} {x v : ℝ → Fin n → E}
    (h : IsSolutionOn m x v (Ici 0))
    (hJ : ∃ R, ∀ t, 0 ≤ t → |∑ j, m j * ⟪x t j, v t j⟫_ℝ| ≤ R) :
    Tendsto (fun τ ↦ τ⁻¹ * ∫ t in (0 : ℝ)..τ, kineticEnergy m (v t)) atTop
      (𝓝 (-energy m (x 0) (v 0))) := by
  sorry

/-- 2.4 **Sundman's inequality**, strong form: `|C|² + (İ/2)² ≤ 2IT` for nonnegative masses. -/
theorem sundman_inequality {m : Fin n → ℝ} (hm : ∀ j, 0 ≤ m j) (x v : Fin n → E) :
    angularMomentumSq m x v + (∑ j, m j * ⟪x j, v j⟫_ℝ) ^ 2 ≤
      2 * inertia m x * kineticEnergy m v := by
  sorry

/-- 2.5 **Total collapse (Sundman–Weierstrass).** If the moment of inertia of a solution on
`[t₀, t₁)` with positive masses tends to `0` at `t₁`, the angular momentum is `0`. -/
theorem angularMomentum_eq_zero_of_inertia_tendsto_zero {m : Fin n → ℝ} (hm : ∀ j, 0 < m j)
    {x v : ℝ → Fin n → E} {t₀ t₁ : ℝ} (ht : t₀ < t₁) (h : IsSolutionOn m x v (Ico t₀ t₁))
    (hI : Tendsto (fun t ↦ inertia m (x t)) (𝓝[<] t₁) (𝓝 0)) :
    angularMomentum m (x t₀) (v t₀) = 0 := by
  sorry

/-! ## Layer 3: Central configurations -/

/-- 3.1 A central configuration scaled by a solution of the one-dimensional Kepler problem
`r̈ = −lam / r²` is a solution. -/
theorem isSolutionOn_homothetic {m : Fin n → ℝ} {x₀ : Fin n → E} {lam : ℝ}
    (hx : IsCentralConfiguration m x₀ lam) {r r' : ℝ → ℝ} {s : Set ℝ}
    (hr : ∀ t ∈ s, 0 < r t) (hr' : ∀ t ∈ s, HasDerivWithinAt r (r' t) s t)
    (hr'' : ∀ t ∈ s, HasDerivWithinAt r' (-lam / r t ^ 2) s t) :
    IsSolutionOn m (fun t j ↦ centreOfMass m x₀ + r t • (x₀ j - centreOfMass m x₀))
      (fun t j ↦ r' t • (x₀ j - centreOfMass m x₀)) s := by
  sorry

/-- 3.1 Conversely, every homothetic solution `r(t) x₀` comes from a central configuration
with centre of mass `0`, and `r̈ = −lam / r²`. -/
theorem exists_isCentralConfiguration_of_homothetic (hn : 2 ≤ n) {m : Fin n → ℝ}
    (hm : ∀ j, 0 < m j) {x₀ : Fin n → E} {r r' : ℝ → ℝ} {s : Set ℝ} (hs : IsOpen s)
    (hne : s.Nonempty) (hr : ∀ t ∈ s, 0 < r t)
    (h : IsSolutionOn m (fun t j ↦ r t • x₀ j) (fun t j ↦ r' t • x₀ j) s) :
    ∃ lam, IsCentralConfiguration m x₀ lam ∧ centreOfMass m x₀ = 0 ∧
      ∀ t ∈ s, HasDerivAt r' (-lam / r t ^ 2) t := by
  sorry

/-- 3.2 In the plane `ℂ`, a central configuration multiplied by a solution of the planar Kepler
problem `z̈ = −lam z / |z|³` is a solution. -/
theorem isSolutionOn_homographic {m : Fin n → ℝ} {x₀ : Fin n → ℂ} {lam : ℝ}
    (hx : IsCentralConfiguration m x₀ lam) {z z' : ℝ → ℂ} {s : Set ℝ}
    (hz : ∀ t ∈ s, z t ≠ 0) (hz' : ∀ t ∈ s, HasDerivWithinAt z (z' t) s t)
    (hz'' : ∀ t ∈ s, HasDerivWithinAt z' (-(lam / ‖z t‖ ^ 3) • z t) s t) :
    IsSolutionOn m (fun t j ↦ centreOfMass m x₀ + z t * (x₀ j - centreOfMass m x₀))
      (fun t j ↦ z' t * (x₀ j - centreOfMass m x₀)) s := by
  sorry

/-- 3.3 **Variational characterisation.** A collision-free configuration is a critical point
of `U` on `{I = 1}` iff it is a normalised central configuration. -/
theorem isCritical_iff_isCentralConfiguration (hn : 2 ≤ n) {m : Fin n → ℝ}
    (hm : ∀ j, 0 < m j) {x : Fin n → E} (hx : IsCollisionFree x) :
    (inertia m x = 1 ∧
      ∀ h : Fin n → E, fderiv ℝ (inertia m) x h = 0 → fderiv ℝ (forceFunction m) x h = 0) ↔
      (inertia m x = 1 ∧ centreOfMass m x = 0 ∧ ∃ lam, IsCentralConfiguration m x lam) := by
  sorry

/-- 3.4 **The regular simplex.** An affinely independent configuration is central iff all
mutual distances are equal. -/
theorem isCentralConfiguration_iff_dist_eq {m : Fin n → ℝ} (hm : ∀ j, 0 < m j)
    {x : Fin n → E} (hx : AffineIndependent ℝ x) :
    (∃ lam, IsCentralConfiguration m x lam) ↔
      ∃ a > 0, ∀ i j, i ≠ j → ‖x i - x j‖ = a := by
  sorry

/-- 3.5 **Moulton's theorem.** On a line, each ordering of `n ≥ 2` positive masses has exactly
one normalised central configuration. -/
theorem existsUnique_collinear (hn : 2 ≤ n) {m : Fin n → ℝ} (hm : ∀ j, 0 < m j)
    (σ : Equiv.Perm (Fin n)) :
    ∃! x : Fin n → ℝ, StrictMono (x ∘ σ) ∧ centreOfMass m x = 0 ∧ inertia m x = 1 ∧
      ∃ lam, IsCentralConfiguration m x lam := by
  sorry

end Bodies

/-! ## Layer 4: Lagrange points of the circular restricted three-body problem -/

/-- D.5 The amended potential `Ω = (x² + y²)/2 + (1 − μ)/r₁ + μ/r₂` of the rotating frame. -/
def amendedPotential (μ x y : ℝ) : ℝ :=
  (x ^ 2 + y ^ 2) / 2 + (1 - μ) / √((x + μ) ^ 2 + y ^ 2) + μ / √((x - 1 + μ) ^ 2 + y ^ 2)

/-- D.5 The rotating-frame field `(x, y, u, v) ↦ (u, v, 2v + ∂ₓΩ, −2u + ∂ᵧΩ)`, the partial
derivatives taken with Mathlib's one-variable `deriv`. -/
def restrictedField (μ : ℝ) (s : Fin 4 → ℝ) : Fin 4 → ℝ :=
  ![s 2, s 3, 2 * s 3 + deriv (fun x ↦ amendedPotential μ x (s 1)) (s 0),
    -2 * s 2 + deriv (fun y ↦ amendedPotential μ (s 0) y) (s 1)]

/-- 4.1 **The five Lagrange points.** Off the primaries, the zeros of the field are the three
collinear points, one in each gap, and the two triangular points. -/
theorem restrictedField_equilibria {μ : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1) :
    ∃ a₁ a₂ a₃ : ℝ, a₃ < -μ ∧ -μ < a₁ ∧ a₁ < 1 - μ ∧ 1 - μ < a₂ ∧
      {s : Fin 4 → ℝ | restrictedField μ s = 0 ∧ (s 0, s 1) ≠ (-μ, 0) ∧ (s 0, s 1) ≠ (1 - μ, 0)} =
        {![a₁, 0, 0, 0], ![a₂, 0, 0, 0], ![a₃, 0, 0, 0], ![1 / 2 - μ, √3 / 2, 0, 0],
          ![1 / 2 - μ, -(√3 / 2), 0, 0]} := by
  sorry

/-- 4.2 **Routh criterion**, first case: four distinct nonzero purely imaginary eigenvalues at
`L₄`, `L₅` when `27μ(1 − μ) < 1`. -/
theorem triangular_spectrum_of_lt {μ y₀ : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1) (hy : y₀ ^ 2 = 3 / 4)
    {A : Matrix (Fin 4) (Fin 4) ℝ}
    (hA : ∀ w, fderiv ℝ (restrictedField μ) ![1 / 2 - μ, y₀, 0, 0] w = A *ᵥ w)
    (h : 27 * μ * (1 - μ) < 1) :
    (spectrum ℂ (A.map (algebraMap ℝ ℂ))).ncard = 4 ∧
      ∀ z ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), z.re = 0 ∧ z ≠ 0 := by
  sorry

/-- 4.2 Second case: when `27μ(1 − μ) > 1`, no eigenvalue on the imaginary axis and exactly
two with positive real part. -/
theorem triangular_spectrum_of_gt {μ y₀ : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1) (hy : y₀ ^ 2 = 3 / 4)
    {A : Matrix (Fin 4) (Fin 4) ℝ}
    (hA : ∀ w, fderiv ℝ (restrictedField μ) ![1 / 2 - μ, y₀, 0, 0] w = A *ᵥ w)
    (h : 1 < 27 * μ * (1 - μ)) :
    (∀ z ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), z.re ≠ 0) ∧
      {z ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)) | 0 < z.re}.ncard = 2 := by
  sorry

/-- 4.2 Boundary case `27μ(1 − μ) = 1`: characteristic polynomial `(X² + ½)²` and
`A ∓ (i/√2)` of rank `3`, so `A` is not diagonalisable. -/
theorem triangular_spectrum_of_eq {μ y₀ : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1) (hy : y₀ ^ 2 = 3 / 4)
    {A : Matrix (Fin 4) (Fin 4) ℝ}
    (hA : ∀ w, fderiv ℝ (restrictedField μ) ![1 / 2 - μ, y₀, 0, 0] w = A *ᵥ w)
    (h : 27 * μ * (1 - μ) = 1) :
    A.charpoly = (Polynomial.X ^ 2 + Polynomial.C (1 / 2)) ^ 2 ∧
      (A.map (algebraMap ℝ ℂ) - (Complex.I / √2) • 1).rank = 3 ∧
      (A.map (algebraMap ℝ ℂ) + (Complex.I / √2) • 1).rank = 3 := by
  sorry

/-- 4.3 At each collinear equilibrium the linearisation has a real positive eigenvalue. -/
theorem collinear_exists_pos_eigenvalue {μ a : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1)
    (ha₁ : a ≠ -μ) (ha₂ : a ≠ 1 - μ) (h0 : restrictedField μ ![a, 0, 0, 0] = 0)
    {A : Matrix (Fin 4) (Fin 4) ℝ}
    (hA : ∀ w, fderiv ℝ (restrictedField μ) ![a, 0, 0, 0] w = A *ᵥ w) :
    ∃ r : ℝ, 0 < r ∧ (r : ℂ) ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)) := by
  sorry

section LyapunovStability

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 4.4 (copied verbatim from LyapunovStabilityOfODEs 1.1) The forward solutions of `x' = f x`
from `x`. -/
def forwardSolutions (f : E → E) (x : E) : Set (ℝ → E) :=
  {γ | γ 0 = x ∧ IsIntegralCurveOn γ (fun _ ↦ f) (Ici 0)}

/-- 4.4 (copied verbatim from LyapunovStabilityOfODEs 1.2) `x₀` is Lyapunov stable for
`x' = f x`. -/
def IsLyapunovStable (f : E → E) (x₀ : E) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧
      ∀ γ ∈ forwardSolutions f x, ∀ t, 0 ≤ t → dist (γ t) x₀ < ε

end LyapunovStability

/-- 4.4 The collinear equilibria are not Lyapunov stable, for every `μ ∈ (0, 1)`. -/
theorem not_isLyapunovStable_collinear {μ a : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1)
    (ha₁ : a ≠ -μ) (ha₂ : a ≠ 1 - μ) (h0 : restrictedField μ ![a, 0, 0, 0] = 0) :
    ¬ IsLyapunovStable (restrictedField μ) ![a, 0, 0, 0] := by
  sorry

/-- 4.4 The triangular equilibria are not Lyapunov stable when `27μ(1 − μ) > 1`. -/
theorem not_isLyapunovStable_triangular {μ y₀ : ℝ} (hμ₀ : 0 < μ) (hμ₁ : μ < 1)
    (hy : y₀ ^ 2 = 3 / 4) (h : 1 < 27 * μ * (1 - μ)) :
    ¬ IsLyapunovStable (restrictedField μ) ![1 / 2 - μ, y₀, 0, 0] := by
  sorry

end TauCetiRoadmap.NBodyProblemAndCentralConfigurations
