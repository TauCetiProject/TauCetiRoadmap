import Mathlib

/-!
# Evolutionary game theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here.

A symmetric two-player game with `n` pure strategies is a real matrix `A : Matrix ι ι ℝ` over a
finite type `ι`; `A i j` is the payoff of strategy `i` against strategy `j`, and a mixed strategy
`y` scores `y ⬝ᵥ (A *ᵥ x)` against `x`. Mixed strategies are the points of `simplex ι`, copied
verbatim from RegretMinimizationAndEquilibria. The replicator equation is the polynomial vector
field `replicatorField A` on all of `ι → ℝ` (sup norm); its solutions are taken in the sense of
`forwardSolutions`, copied verbatim from LyapunovStabilityOfODEs, Section 1.1. Stability is
relative to the simplex (`IsLyapunovStableWithin`, `IsAsymptoticallyStableWithin`): only initial
points in the simplex are tested, since the simplex is invariant but the polynomial field need
not be stable in the directions transverse to it.
-/

noncomputable section

open Filter Topology Metric Set Matrix

namespace TauCetiRoadmap.EvolutionaryGameTheory

/-! ## Layer 1: symmetric Nash equilibria and evolutionarily stable strategies -/

/-- 1.1 The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex` (copied verbatim from RegretMinimizationAndEquilibria,
Conventions). -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

variable {ι : Type*} [Fintype ι]

/-- 1.1 `x` is a symmetric Nash equilibrium of the symmetric game with payoff matrix `A`: a mixed
strategy that is a best reply to itself. -/
def IsSymmetricNash (A : Matrix ι ι ℝ) (x : ι → ℝ) : Prop :=
  x ∈ simplex ι ∧ ∀ y ∈ simplex ι, y ⬝ᵥ (A *ᵥ x) ≤ x ⬝ᵥ (A *ᵥ x)

/-- 1.2 `x` is an evolutionarily stable strategy: a mixed strategy such that every other mixed
strategy `y` either does worse than `x` against `x`, or does as well against `x` and worse than
`x` against `y` (Maynard Smith's equilibrium and stability conditions). -/
def IsESS (A : Matrix ι ι ℝ) (x : ι → ℝ) : Prop :=
  x ∈ simplex ι ∧ ∀ y ∈ simplex ι, y ≠ x →
    y ⬝ᵥ (A *ᵥ x) < x ⬝ᵥ (A *ᵥ x) ∨
      (y ⬝ᵥ (A *ᵥ x) = x ⬝ᵥ (A *ᵥ x) ∧ y ⬝ᵥ (A *ᵥ y) < x ⬝ᵥ (A *ᵥ y))

/-- 1.3 **Local superiority.** A mixed strategy `x` is an ESS if and only if it does strictly
better against every nearby mixed strategy `y ≠ x` than `y` does against itself. -/
theorem isESS_iff_locallySuperior (A : Matrix ι ι ℝ) (x : ι → ℝ) :
    IsESS A x ↔ x ∈ simplex ι ∧ ∃ ε > 0, ∀ y ∈ simplex ι, dist y x < ε → y ≠ x →
      y ⬝ᵥ (A *ᵥ y) < x ⬝ᵥ (A *ᵥ y) := by
  sorry

/-- 1.4 **The interior ESS criterion.** A mixed strategy `x` with every coordinate positive is an
ESS if and only if all pure strategies earn the same payoff against `x` and the quadratic form of
`A` is negative definite on the vectors with coordinate sum zero. -/
theorem isESS_iff_of_pos (A : Matrix ι ι ℝ) {x : ι → ℝ} (hx : x ∈ simplex ι)
    (hpos : ∀ i, 0 < x i) :
    IsESS A x ↔ (∀ i j, (A *ᵥ x) i = (A *ᵥ x) j) ∧
      ∀ z : ι → ℝ, z ≠ 0 → ∑ i, z i = 0 → z ⬝ᵥ (A *ᵥ z) < 0 := by
  sorry

/-- 1.5 An ESS `x` with every coordinate positive does strictly better against every other mixed
strategy `y` than `y` does against itself, and it is the only symmetric Nash equilibrium. -/
theorem IsESS.superior_and_unique_of_pos {A : Matrix ι ι ℝ} {x : ι → ℝ} (h : IsESS A x)
    (hpos : ∀ i, 0 < x i) :
    (∀ y ∈ simplex ι, y ≠ x → y ⬝ᵥ (A *ᵥ y) < x ⬝ᵥ (A *ᵥ y)) ∧
      ∀ y, IsSymmetricNash A y → y = x := by
  sorry

/-! ## Layer 2: the replicator equation -/

/-- 2.1 The replicator vector field on `ι → ℝ`: the `i`-th coordinate is `x i` times the excess
of the payoff of strategy `i` against `x` over the mean payoff `x ⬝ᵥ (A *ᵥ x)`. -/
def replicatorField (A : Matrix ι ι ℝ) (x : ι → ℝ) : ι → ℝ :=
  fun i ↦ x i * ((A *ᵥ x) i - x ⬝ᵥ (A *ᵥ x))

section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 2.2 The forward solutions of `x' = f x` from `x`: curves `γ` with `γ 0 = x` whose derivative
within `[0, ∞)` at every `t ≥ 0` is `f (γ t)` (copied verbatim from LyapunovStabilityOfODEs,
Section 1.1). -/
def forwardSolutions (f : E → E) (x : E) : Set (ℝ → E) :=
  {γ | γ 0 = x ∧ IsIntegralCurveOn γ (fun _ ↦ f) (Ici 0)}

end

/-- 2.3 **Invariance of the simplex and of its faces.** Every forward solution of the replicator
equation from a point of the simplex stays in the simplex, and each coordinate keeps its sign:
it stays positive if it starts positive and stays zero if it starts at zero. -/
theorem mem_simplex_of_mem_forwardSolutions (A : Matrix ι ι ℝ) {x : ι → ℝ} {γ : ℝ → ι → ℝ}
    (hx : x ∈ simplex ι) (hγ : γ ∈ forwardSolutions (replicatorField A) x) :
    ∀ t, 0 ≤ t → γ t ∈ simplex ι ∧ ∀ i, (0 < γ t i ↔ 0 < x i) := by
  sorry

/-- 2.4 **Global solutions.** From every point of the simplex the replicator equation has a
solution defined for all real times, which stays in the simplex and keeps the sign of each
coordinate. -/
theorem exists_isIntegralCurve_replicatorField (A : Matrix ι ι ℝ) {x : ι → ℝ}
    (hx : x ∈ simplex ι) :
    ∃ γ : ℝ → ι → ℝ, γ 0 = x ∧ IsIntegralCurve γ (fun _ ↦ replicatorField A) ∧
      ∀ t, γ t ∈ simplex ι ∧ ∀ i, (0 < γ t i ↔ 0 < x i) := by
  sorry

/-! ## Layer 3: the folk theorem of evolutionary game theory -/

section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 3.1 `x₀` is Lyapunov stable for `x' = f x` relative to `S`: for every `ε > 0` there is
`δ > 0` such that from every point of `S` within `δ` of `x₀` there is a forward solution, and
every forward solution from such a point stays within `ε` of `x₀` for all `t ≥ 0`. -/
def IsLyapunovStableWithin (f : E → E) (S : Set E) (x₀ : E) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ S, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧
      ∀ γ ∈ forwardSolutions f x, ∀ t, 0 ≤ t → dist (γ t) x₀ < ε

/-- 3.1 `x₀` is asymptotically stable relative to `S`: it is Lyapunov stable relative to `S`, and
for some `δ > 0` there is a forward solution from every point of `S` within `δ` of `x₀`, and every
such solution tends to `x₀`. -/
def IsAsymptoticallyStableWithin (f : E → E) (S : Set E) (x₀ : E) : Prop :=
  IsLyapunovStableWithin f S x₀ ∧ ∃ δ > 0, ∀ x ∈ S, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧ ∀ γ ∈ forwardSolutions f x, Tendsto γ atTop (𝓝 x₀)

end

/-- 3.2 A symmetric Nash equilibrium is a rest point of the replicator equation. -/
theorem IsSymmetricNash.replicatorField_eq_zero {A : Matrix ι ι ℝ} {x : ι → ℝ}
    (h : IsSymmetricNash A x) : replicatorField A x = 0 := by
  sorry

/-- 3.3 A point of the simplex that is Lyapunov stable for the replicator equation, relative to
the simplex, is a symmetric Nash equilibrium. -/
theorem IsLyapunovStableWithin.isSymmetricNash {A : Matrix ι ι ℝ} {x : ι → ℝ}
    (hx : x ∈ simplex ι)
    (h : IsLyapunovStableWithin (replicatorField A) (simplex ι) x) :
    IsSymmetricNash A x := by
  sorry

/-- 3.4 If a forward solution of the replicator equation from a point of the simplex with every
coordinate positive converges, its limit is a symmetric Nash equilibrium. -/
theorem isSymmetricNash_of_tendsto {A : Matrix ι ι ℝ} {x z : ι → ℝ} {γ : ℝ → ι → ℝ}
    (hx : x ∈ simplex ι) (hpos : ∀ i, 0 < x i)
    (hγ : γ ∈ forwardSolutions (replicatorField A) x) (hlim : Tendsto γ atTop (𝓝 z)) :
    IsSymmetricNash A z := by
  sorry

/-! ## Layer 4: evolutionary stability implies asymptotic stability -/

/-- 4.1 **An ESS is asymptotically stable.** Every ESS is an asymptotically stable rest point of
the replicator equation, relative to the simplex. -/
theorem IsESS.isAsymptoticallyStableWithin {A : Matrix ι ι ℝ} {x : ι → ℝ} (h : IsESS A x) :
    IsAsymptoticallyStableWithin (replicatorField A) (simplex ι) x := by
  sorry

/-- 4.2 **An interior ESS attracts the interior.** If `x` is an ESS with every coordinate
positive, every forward solution from a point of the simplex with every coordinate positive
converges to `x`. -/
theorem IsESS.tendsto_of_pos {A : Matrix ι ι ℝ} {x y : ι → ℝ} {γ : ℝ → ι → ℝ} (h : IsESS A x)
    (hpos : ∀ i, 0 < x i) (hy : y ∈ simplex ι) (hypos : ∀ i, 0 < y i)
    (hγ : γ ∈ forwardSolutions (replicatorField A) y) : Tendsto γ atTop (𝓝 x) := by
  sorry

/-! ## Layer 5: symmetric payoff matrices -/

/-- 5.1 **Mean payoff increases for a symmetric payoff matrix.** If `A` is symmetric, the mean
payoff `γ t ⬝ᵥ (A *ᵥ γ t)` is monotone along every forward solution from a point of the simplex,
and strictly increasing unless the initial point is a rest point. -/
theorem monotoneOn_meanPayoff {A : Matrix ι ι ℝ} (hA : A.IsSymm) {x : ι → ℝ} {γ : ℝ → ι → ℝ}
    (hx : x ∈ simplex ι) (hγ : γ ∈ forwardSolutions (replicatorField A) x) :
    MonotoneOn (fun t ↦ γ t ⬝ᵥ (A *ᵥ γ t)) (Ici 0) ∧
      (replicatorField A x ≠ 0 → StrictMonoOn (fun t ↦ γ t ⬝ᵥ (A *ᵥ γ t)) (Ici 0)) := by
  sorry

/-- 5.2 **Convergence to the rest points for a symmetric payoff matrix.** If `A` is symmetric,
every forward solution from a point of the simplex eventually lies within every `ε > 0` of the
set of rest points in the simplex. -/
theorem eventually_mem_thickening_restPoints {A : Matrix ι ι ℝ} (hA : A.IsSymm) {x : ι → ℝ}
    {γ : ℝ → ι → ℝ} (hx : x ∈ simplex ι) (hγ : γ ∈ forwardSolutions (replicatorField A) x) :
    ∀ ε > 0, ∀ᶠ t in atTop,
      γ t ∈ thickening ε {z | z ∈ simplex ι ∧ replicatorField A z = 0} := by
  sorry

end TauCetiRoadmap.EvolutionaryGameTheory
