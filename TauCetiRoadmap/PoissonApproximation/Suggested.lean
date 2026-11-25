import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Coupling
import TauCeti.Probability.Distributions.PoissonBinomial.Basic

/-!
# Poisson approximation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here, except that Le Cam's inequality (README 3.3,
the bound `2 ∑ (p i)²`) is not stated separately: it follows in one step from the bound of
Barbour and Hall below, since `(1 - exp (-λ)) / λ ≤ 1`. The README's proof routes, API lists and
Checks are not restated.

Total variation is Mathlib's `MeasureTheory.tvDist`, which on probability measures takes values in
`[0, 2]`: it is the `ℓ¹` distance of the two mass functions on `ℕ`, twice the largest difference
of the masses of an event. Every bound below is written in that normalization. The Poisson law is
Mathlib's `ProbabilityTheory.poissonMeasure r` with rate `r : ℝ≥0`. A family of indicators indexed
by a finite type `ι` is described by its joint law, a probability measure `ξ` on `ι → Bool`. Where
a bound contains the factor `(1 - exp (-λ)) / λ`, its value at `λ = 0` is Lean's `0`, and every
statement is true there as written.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal Nat

namespace TauCetiRoadmap.PoissonApproximation

/-! ## Layer 2: the Stein equation for the Poisson law -/

/-- 2.1 The Stein characterization of the Poisson law. A probability measure `μ` on `ℕ` is the
Poisson law of rate `r` if and only if `∫ (r f(k+1) - k f(k)) dμ(k) = 0` for every bounded
`f : ℕ → ℝ`. The rate `r = 0` is included. -/
theorem eq_poissonMeasure_iff_integral_stein (μ : Measure ℕ) [IsProbabilityMeasure μ]
    (r : ℝ≥0) :
    μ = poissonMeasure r ↔
      ∀ f : ℕ → ℝ, (∃ C, ∀ k, |f k| ≤ C) →
        ∫ k, ((r : ℝ) * f (k + 1) - (k : ℝ) * f k) ∂μ = 0 := by
  sorry

/-- 2.2 The solution of the Stein equation for the Poisson law of rate `r` and a set `A ⊆ ℕ`:
`f_A(k) = (k - 1)! r^(-k) e^r (Po(r)(A ∩ {0, …, k - 1}) - Po(r)(A) Po(r)({0, …, k - 1}))`.
Its value at `k = 0` is `0`, and at `r = 0` it vanishes identically. -/
def steinSolution (r : ℝ≥0) (A : Set ℕ) (k : ℕ) : ℝ :=
  ((k - 1)! : ℝ) / (r : ℝ) ^ k * Real.exp r *
    ((poissonMeasure r).real (A ∩ Set.Iio k) -
      (poissonMeasure r).real A * (poissonMeasure r).real (Set.Iio k))

/-- 2.2 For `r > 0`, `steinSolution r A` solves the Stein equation
`r f(k+1) - k f(k) = 1_A(k) - Po(r)(A)` at every `k`. -/
theorem steinSolution_stein (r : ℝ≥0) (hr : 0 < r) (A : Set ℕ) (k : ℕ) :
    (r : ℝ) * steinSolution r A (k + 1) - (k : ℝ) * steinSolution r A k =
      A.indicator 1 k - (poissonMeasure r).real A := by
  sorry

/-- 2.3 The bound on the increments of the Stein solution:
`|f_A(k+1) - f_A(k)| ≤ (1 - e^(-r)) / r` for every `A ⊆ ℕ` and every `k`, including `k = 0`. -/
theorem abs_steinSolution_succ_sub_le (r : ℝ≥0) (A : Set ℕ) (k : ℕ) :
    |steinSolution r A (k + 1) - steinSolution r A k| ≤ (1 - Real.exp (-(r : ℝ))) / r := by
  sorry

/-- 2.3 The bound on the Stein solution itself: `|f_A(k)| ≤ min 1 (r^(-1/2))`. -/
theorem abs_steinSolution_le (r : ℝ≥0) (A : Set ℕ) (k : ℕ) :
    |steinSolution r A k| ≤ min 1 ((r : ℝ) ^ (-(1 / 2 : ℝ))) := by
  sorry

/-! ## Layer 3: sums of indicators -/

section Indicators

variable {ι : Type*} [Fintype ι]

/-- 3.1 The number of indicators of `x : ι → Bool` that are `true`. -/
def occurrences (x : ι → Bool) : ℕ :=
  (Finset.univ.filter fun i => x i = true).card

/-- 3.1 The intensity of a law `ξ` of a family of indicators: the sum over `i` of the probability
that the `i`-th indicator is `true`, which is the mean of `occurrences` under `ξ`. -/
def intensity (ξ : Measure (ι → Bool)) : ℝ≥0 :=
  ∑ i, (ξ.real {x | x i = true}).toNNReal

/-- 3.1 The local dependence theorem of Arratia, Goldstein and Gordon, for dependency
neighbourhoods. Let `ξ` be the law of a family of indicators and let each `i` lie in its
neighbourhood `N i`, with the `i`-th indicator independent of the indicators outside `N i`. With
`λ` the intensity, `b₁ = ∑ᵢ ∑_{j ∈ N i} pᵢ pⱼ` and `b₂ = ∑ᵢ ∑_{j ∈ N i, j ≠ i} P(xᵢ = xⱼ = true)`,
the law of the number of occurrences is within `2 (1 - e^(-λ)) / λ · (b₁ + b₂)` of `Po(λ)`. -/
theorem tvDist_le_of_dependencyNeighbourhoods [DecidableEq ι] (ξ : Measure (ι → Bool))
    [IsProbabilityMeasure ξ] (N : ι → Finset ι) (hN : ∀ i, i ∈ N i)
    (hind : ∀ i, IndepFun (fun x : ι → Bool => x i)
      (fun (x : ι → Bool) (j : {j // j ∉ N i}) => x j) ξ) :
    tvDist (ξ.map occurrences) (poissonMeasure (intensity ξ)) ≤
      2 * ((1 - Real.exp (-(intensity ξ : ℝ))) / intensity ξ) *
        (∑ i, ∑ j ∈ N i, ξ.real {x | x i = true} * ξ.real {x | x j = true} +
          ∑ i, ∑ j ∈ (N i).erase i, ξ.real {x | x i = true ∧ x j = true}) := by
  sorry

/-- 3.2 The bound of Barbour and Hall for independent indicators: the Poisson-binomial law with
success probabilities `p i` and the Poisson law with the same mean `λ = ∑ p i` are within
`2 (1 - e^(-λ)) / λ · ∑ (p i)²`. -/
theorem tvDist_poissonBinomialMeasure_le (p : ι → unitInterval) :
    tvDist (TauCeti.Probability.poissonBinomialMeasure p)
        (poissonMeasure (∑ i, unitInterval.toNNReal (p i))) ≤
      2 * ((1 - Real.exp (-((∑ i, unitInterval.toNNReal (p i) : ℝ≥0) : ℝ))) /
          ((∑ i, unitInterval.toNNReal (p i) : ℝ≥0) : ℝ)) * ∑ i, ((p i : ℝ)) ^ 2 := by
  sorry

/-- 3.4 Poisson approximation under a monotone coupling. Suppose that for each `i` with
`P(xᵢ = true) ≠ 0` there is a coupling `γ` of `ξ` with `ξ` conditioned on `xᵢ = true` under which,
almost surely, every indicator other than the `i`-th of the second coordinate is at most the same
indicator of the first. Then the law of the number of occurrences is within
`2 (1 - e^(-λ)) / λ · (λ - Var W)` of `Po(λ)`, where `W` is the number of occurrences. -/
theorem tvDist_le_of_monotoneCoupling (ξ : Measure (ι → Bool)) [IsProbabilityMeasure ξ]
    (hc : ∀ i, ξ {x | x i = true} ≠ 0 → ∃ γ : Measure ((ι → Bool) × (ι → Bool)),
      TauCeti.IsCoupling γ ξ (ξ[|{x | x i = true}]) ∧
        ∀ᵐ z ∂γ, ∀ j, j ≠ i → z.2 j ≤ z.1 j) :
    tvDist (ξ.map occurrences) (poissonMeasure (intensity ξ)) ≤
      2 * ((1 - Real.exp (-(intensity ξ : ℝ))) / intensity ξ) *
        ((intensity ξ : ℝ) - variance (fun x => (occurrences x : ℝ)) ξ) := by
  sorry

end Indicators

/-! ## Layer 4: birthdays, matchings and empty boxes -/

/-- 4.1 The birthday problem. Let `n` people have independent birthdays, uniform among `d ≥ 1`
days, and let `W` be the number of pairs of people with the same birthday. With
`λ = n (n - 1) / (2 d)`, the law of `W` is within `2 (1 - e^(-λ)) (4 n - 7) / d` of `Po(λ)`. -/
theorem tvDist_birthday_le (n d : ℕ) (hd : 0 < d) :
    tvDist ((uniformOn (Set.univ : Set (Fin n → Fin d))).map
        (fun b => (Finset.univ.filter fun q : Fin n × Fin n => q.1 < q.2 ∧ b q.1 = b q.2).card))
      (poissonMeasure ((n.choose 2 : ℝ≥0) / d)) ≤
      2 * (1 - Real.exp (-(((n.choose 2 : ℝ≥0) / d : ℝ≥0) : ℝ))) * (4 * n - 7) / d := by
  sorry

/-- 4.2 The number of permutations of `Fin n` with exactly `j` fixed points is
`n.choose j * numDerangements (n - j)`. -/
theorem card_filter_card_fixedPoints_eq (n j : ℕ) :
    (Finset.univ.filter fun σ : Equiv.Perm (Fin n) =>
        (Finset.univ.filter fun i => σ i = i).card = j).card =
      n.choose j * numDerangements (n - j) := by
  sorry

/-- 4.2 The matching problem. The number of fixed points of a uniform random permutation of
`Fin n` has a law within `2^(n+1) / (n+1)!` of `Po(1)`. -/
theorem tvDist_fixedPoints_le (n : ℕ) [MeasurableSpace (Equiv.Perm (Fin n))]
    [MeasurableSingletonClass (Equiv.Perm (Fin n))] :
    tvDist ((uniformOn (Set.univ : Set (Equiv.Perm (Fin n)))).map
        (fun σ => (Finset.univ.filter fun i => σ i = i).card)) (poissonMeasure 1) ≤
      2 ^ (n + 1) / ((n + 1)! : ℝ) := by
  sorry

/-- 4.3 Empty boxes. Let `k` balls fall independently and uniformly into `n ≥ 1` boxes and let `W`
be the number of empty boxes. With `λ = n (1 - 1/n)^k`, the law of `W` is within
`2 (1 - e^(-λ)) / λ · (λ² - n (n - 1) (1 - 2/n)^k)` of `Po(λ)`. -/
theorem tvDist_emptyBoxes_le (n k : ℕ) (hn : 0 < n) :
    tvDist ((uniformOn (Set.univ : Set (Fin k → Fin n))).map
        (fun b => (Finset.univ.filter fun c : Fin n => ∀ i, b i ≠ c).card))
      (poissonMeasure ((n : ℝ≥0) * (1 - 1 / (n : ℝ≥0)) ^ k)) ≤
      2 * ((1 - Real.exp (-(((n : ℝ≥0) * (1 - 1 / (n : ℝ≥0)) ^ k : ℝ≥0) : ℝ))) /
          (((n : ℝ≥0) * (1 - 1 / (n : ℝ≥0)) ^ k : ℝ≥0) : ℝ)) *
        ((((n : ℝ≥0) * (1 - 1 / (n : ℝ≥0)) ^ k : ℝ≥0) : ℝ) ^ 2 -
          (n : ℝ) * ((n : ℝ) - 1) * (1 - 2 / (n : ℝ)) ^ k) := by
  sorry

end TauCetiRoadmap.PoissonApproximation
