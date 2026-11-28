import Mathlib
import TauCeti.Analysis.Normed.Ring.StableSequence

/-!
# Conditioning and perturbation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; it needs no
definitions of its own. Every headline theorem of the README is statable at the pins and is
stated here. The README's remaining API facts and Checks are not restated.

Inverses are Mathlib's `Ring.inverse`, which is `0` at a non-unit; every statement that uses an
inverse assumes that the element is a unit. The condition number is Tau Ceti's
`TauCeti.conditionNumber a = ‖a‖ * ‖Ring.inverse a‖`. Operators are bounded linear maps with the
operator norm; the eigenvector coordinates of the Bauer–Fike theorem carry the `ℓ^p` norm of
`PiLp p`; the simple-eigenvalue statements are about square matrices over a field (4.1) and
complex square matrices (4.2).
-/

noncomputable section

open Matrix
open scoped ENNReal Topology

namespace TauCetiRoadmap.ConditioningAndPerturbation

/-! ## Layer 1: linear systems and the distance to singularity -/

/-- 1.1 Perturbed linear systems: on a Banach space, let `A` be invertible with
`‖A⁻¹‖ ‖ΔA‖ < 1`, `A x = b` and `(A + ΔA) x' = b + Δb`. Then
`‖x' - x‖ ≤ ‖A⁻¹‖ / (1 - ‖A⁻¹‖ ‖ΔA‖) * (‖Δb‖ + ‖ΔA‖ ‖x‖)`, and for `x ≠ 0` the relative error
is at most `κ / (1 - κ ‖ΔA‖/‖A‖) * (‖ΔA‖/‖A‖ + ‖Δb‖/‖b‖)` with `κ = ‖A‖ ‖A⁻¹‖`. -/
theorem norm_sub_le_of_perturbed_system {𝕜 E : Type*} [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [CompleteSpace E] {A ΔA : E →L[𝕜] E}
    (hA : IsUnit A) (h : ‖Ring.inverse A‖ * ‖ΔA‖ < 1) {x x' b Δb : E} (hx : A x = b)
    (hx' : (A + ΔA) x' = b + Δb) :
    ‖x' - x‖ ≤ ‖Ring.inverse A‖ / (1 - ‖Ring.inverse A‖ * ‖ΔA‖) * (‖Δb‖ + ‖ΔA‖ * ‖x‖) ∧
      (x ≠ 0 → ‖x' - x‖ / ‖x‖ ≤ TauCeti.conditionNumber A /
        (1 - TauCeti.conditionNumber A * (‖ΔA‖ / ‖A‖)) * (‖ΔA‖ / ‖A‖ + ‖Δb‖ / ‖b‖)) := by
  sorry

/-- 1.2 Distance to the non-invertible operators (Gastinel–Kahan): on a nonzero Banach space
over `ℝ` or `ℂ`, the norms of the perturbations `Δ` that make an invertible `A + Δ` fail to be
invertible have greatest lower bound `‖A⁻¹‖⁻¹`. -/
theorem isGLB_norm_of_not_isUnit_add {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
    [NormedSpace 𝕜 E] [CompleteSpace E] [Nontrivial E] {A : E →L[𝕜] E} (hA : IsUnit A) :
    IsGLB {r : ℝ | ∃ Δ : E →L[𝕜] E, ¬IsUnit (A + Δ) ∧ ‖Δ‖ = r} ‖Ring.inverse A‖⁻¹ := by
  sorry

/-! ## Layer 2: backward errors -/

/-- 2.1 The normwise backward error (Rigal–Gaches): for `A : X →L Y`, a candidate solution
`y`, a right-hand side `b` and tolerances `α, β ≥ 0` such that `α ‖y‖ + β = 0` only when
`A y = b`, the least `ε ≥ 0` such that `(A + ΔA) y = b + Δb` for some `‖ΔA‖ ≤ ε α`,
`‖Δb‖ ≤ ε β` is `‖b - A y‖ / (α ‖y‖ + β)` (read as `0` when the denominator is `0`). -/
theorem isLeast_normwise_backwardError {𝕜 X Y : Type*} [RCLike 𝕜] [NormedAddCommGroup X]
    [NormedSpace 𝕜 X] [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (A : X →L[𝕜] Y) (y : X) (b : Y)
    {α β : ℝ} (hα : 0 ≤ α) (hβ : 0 ≤ β) (hzero : α * ‖y‖ + β = 0 → A y = b) :
    IsLeast {ε : ℝ | 0 ≤ ε ∧ ∃ (ΔA : X →L[𝕜] Y) (Δb : Y), ‖ΔA‖ ≤ ε * α ∧ ‖Δb‖ ≤ ε * β ∧
      (A + ΔA) y = b + Δb} (‖b - A y‖ / (α * ‖y‖ + β)) := by
  sorry

/-- 2.2 The componentwise backward error (Oettli–Prager): for tolerances `E ≥ 0`, `f ≥ 0`
entrywise, such that every row `i` with `(E |y| + f)ᵢ = 0` has residual `(b - A y)ᵢ = 0`, the
least `ε ≥ 0` such that `(A + ΔA) y = b + Δb` for some `|ΔA i j| ≤ ε E i j` and
`|Δb i| ≤ ε f i` is `maxᵢ |(b - A y)ᵢ| / (E |y| + f)ᵢ`, a row with zero denominator contributing
`0` (and `0` when there are no rows). -/
theorem isLeast_componentwise_backwardError {𝕜 m n : Type*} [RCLike 𝕜] [Fintype m] [Fintype n]
    (A : Matrix m n 𝕜) (y : n → 𝕜) (b : m → 𝕜) (E : Matrix m n ℝ) (f : m → ℝ)
    (hE : ∀ i j, 0 ≤ E i j) (hf : ∀ i, 0 ≤ f i)
    (hzero : ∀ i, ∑ j, E i j * ‖y j‖ + f i = 0 → (b - A *ᵥ y) i = 0) :
    IsLeast {ε : ℝ | 0 ≤ ε ∧ ∃ (ΔA : Matrix m n 𝕜) (Δb : m → 𝕜),
      (∀ i j, ‖ΔA i j‖ ≤ ε * E i j) ∧ (∀ i, ‖Δb i‖ ≤ ε * f i) ∧ (A + ΔA) *ᵥ y = b + Δb}
      (⨆ i, ‖(b - A *ᵥ y) i‖ / (∑ j, E i j * ‖y j‖ + f i)) := by
  sorry

/-! ## Layer 3: inclusion of eigenvalues -/

/-- 3.1 The Bauer–Fike theorem: let `V : ℓ^p(ι) ≃L E` send the coordinate vectors to
eigenvectors of `A` with eigenvalues `lam i`. For every operator `Δ`, every point `μ` of the
spectrum of `A + Δ` lies within `‖V‖ ‖V⁻¹‖ ‖Δ‖` of some `lam i`. -/
theorem exists_norm_sub_le_cond_mul_norm_of_mem_spectrum {ι E : Type*} [Fintype ι]
    [DecidableEq ι] [NormedAddCommGroup E] [NormedSpace ℂ E] {p : ℝ≥0∞} [Fact (1 ≤ p)]
    (A Δ : E →L[ℂ] E) (V : PiLp p (fun _ : ι => ℂ) ≃L[ℂ] E) (lam : ι → ℂ)
    (hV : ∀ i, A (V (WithLp.toLp p (Pi.single i 1))) = lam i • V (WithLp.toLp p (Pi.single i 1)))
    {μ : ℂ} (hμ : μ ∈ spectrum ℂ (A + Δ)) :
    ∃ i, ‖lam i - μ‖ ≤ ‖(V : PiLp p (fun _ : ι => ℂ) →L[ℂ] E)‖ *
      ‖(V.symm : E →L[ℂ] PiLp p (fun _ : ι => ℂ))‖ * ‖Δ‖ := by
  sorry

/-- 3.2 Perturbation of a normal element: in a C⋆-algebra, if `a` is normal, every point of
the spectrum of `a + b` lies within `‖b‖` of the spectrum of `a`. -/
theorem exists_mem_spectrum_norm_sub_le_of_isStarNormal {A : Type*} [CStarAlgebra A] (a b : A)
    [IsStarNormal a] {μ : ℂ} (hμ : μ ∈ spectrum ℂ (a + b)) :
    ∃ l ∈ spectrum ℂ a, ‖l - μ‖ ≤ ‖b‖ := by
  sorry

open Classical in
/-- 3.3 Gershgorin's count: if the Gershgorin discs of the rows in `I` are disjoint from those
of the rows outside `I`, the union of the discs of `I` contains exactly `#I` eigenvalues of `A`,
counted with algebraic multiplicity. -/
theorem card_roots_charpoly_filter_mem_gershgorinDiscs {n : Type*} [Fintype n] [DecidableEq n]
    (A : Matrix n n ℂ) (I : Finset n)
    (hI : ∀ i ∈ I, ∀ j ∉ I, Disjoint
      (Metric.closedBall (A i i) (∑ k ∈ Finset.univ.erase i, ‖A i k‖))
      (Metric.closedBall (A j j) (∑ k ∈ Finset.univ.erase j, ‖A j k‖))) :
    (A.charpoly.roots.filter (fun z => ∃ i ∈ I,
      z ∈ Metric.closedBall (A i i) (∑ k ∈ Finset.univ.erase i, ‖A i k‖))).card = I.card := by
  sorry

/-! ## Layer 4: simple eigenvalues -/

/-- 4.1 For a simple eigenvalue `l` of a square matrix over a field, a right eigenvector `x`
and a left eigenvector `w` (`w A = l w`) satisfy `w x ≠ 0`. -/
theorem dotProduct_ne_zero_of_rootMultiplicity_eq_one {K n : Type*} [Field K] [Fintype n]
    [DecidableEq n] {A : Matrix n n K} {l : K} (hl : A.charpoly.rootMultiplicity l = 1)
    {x w : n → K} (hx : A *ᵥ x = l • x) (hx0 : x ≠ 0) (hw : w ᵥ* A = l • w)
    (hw0 : w ≠ 0) : w ⬝ᵥ x ≠ 0 := by
  sorry

/-- 4.2 First-order perturbation of a simple eigenvalue of a complex square matrix, with right
eigenvector `x` and left eigenvector `y` (`yᴴ A = l yᴴ`): for every direction `E` there is a
function `f`, analytic at `0`, with `f 0 = l`, `f t` an eigenvalue of `A + t E` for `t` near
`0`, and `f'(0) = yᴴ E x / yᴴ x`. -/
theorem exists_eigenvalue_branch_hasDerivAt {n : Type*} [Fintype n] [DecidableEq n]
    {A : Matrix n n ℂ} {l : ℂ} (hl : A.charpoly.rootMultiplicity l = 1) {x y : n → ℂ}
    (hx : A *ᵥ x = l • x) (hx0 : x ≠ 0) (hy : star y ᵥ* A = l • star y) (hy0 : y ≠ 0)
    (E : Matrix n n ℂ) :
    ∃ f : ℂ → ℂ, f 0 = l ∧ AnalyticAt ℂ f 0 ∧
      HasDerivAt f ((star y ⬝ᵥ (E *ᵥ x)) / (star y ⬝ᵥ x)) 0 ∧
      ∀ᶠ t in 𝓝 0, (A + t • E).charpoly.IsRoot (f t) := by
  sorry

end TauCetiRoadmap.ConditioningAndPerturbation
