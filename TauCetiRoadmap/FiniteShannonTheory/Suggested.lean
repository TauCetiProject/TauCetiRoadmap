import Mathlib

/-!
# Finite Shannon theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the
roadmap's headline definitions and theorems against the pinned Mathlib and Tau Ceti,
each theorem with `sorry`; every definition has a real body. The README's remaining
targets, API lists and Checks are not restated.

Distributions on a finite type `α` are bare functions `p : α → ℝ`; the distribution
axioms are hypotheses of the theorems, not of the definitions. Logarithms are natural
(entropies in nats), and `Real.negMulLog` is the single building block. Layer 1's
signatures are taken from a compiling prototype (see the README's Provenance section).
-/

noncomputable section

open Finset Real

namespace TauCetiRoadmap.FiniteShannonTheory

variable {α β : Type*} [Fintype α] [Fintype β]

/-- Layer 1: Shannon entropy of a finite distribution, in nats. -/
def entropy (p : α → ℝ) : ℝ :=
  ∑ x, negMulLog (p x)

theorem entropy_nonneg {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x) (hp1 : ∑ x, p x = 1) :
    0 ≤ entropy p := by sorry

theorem entropy_point_mass [DecidableEq α] (a : α) :
    entropy (fun x => if x = a then (1 : ℝ) else 0) = 0 := by sorry

theorem entropy_uniform {p : α → ℝ} (hp : ∀ x, p x = (Fintype.card α : ℝ)⁻¹) :
    entropy p = Real.log (Fintype.card α) := by sorry

theorem entropy_le_log_card {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) :
    entropy p ≤ Real.log (Fintype.card α) := by sorry

theorem entropy_prod (q : α → ℝ) (r : β → ℝ) :
    entropy (fun z : α × β => q z.1 * r z.2)
      = (∑ b, r b) * entropy q + (∑ a, q a) * entropy r := by sorry

/-- Layer 2: first marginal of a joint distribution. -/
def marginal₁ (p : α × β → ℝ) : α → ℝ := fun a => ∑ b, p (a, b)

/-- Layer 2: second marginal of a joint distribution. -/
def marginal₂ (p : α × β → ℝ) : β → ℝ := fun b => ∑ a, p (a, b)

/-- Layer 2: conditional entropy `H(X ∣ Y)` of a joint distribution. -/
def condEntropy (p : α × β → ℝ) : ℝ :=
  ∑ z, p z * Real.log (marginal₂ p z.2 / p z)

/-- Layer 2: mutual information `I(X;Y)` of a joint distribution. -/
def mutualInfo (p : α × β → ℝ) : ℝ :=
  entropy (marginal₁ p) + entropy (marginal₂ p) - entropy p

theorem condEntropy_nonneg {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    0 ≤ condEntropy p := by sorry

theorem entropy_eq_entropy_marginal₂_add_condEntropy {p : α × β → ℝ}
    (hp0 : ∀ z, 0 ≤ p z) (hp1 : ∑ z, p z = 1) :
    entropy p = entropy (marginal₂ p) + condEntropy p := by sorry

theorem mutualInfo_nonneg {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    0 ≤ mutualInfo p := by sorry

theorem mutualInfo_eq_zero_iff {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    mutualInfo p = 0 ↔
      ∀ a b, p (a, b) = marginal₁ p a * marginal₂ p b := by sorry

/-- Layer 3: finite Kullback–Leibler divergence, in nats. Total; the lemmas
carry the support hypothesis under which it is the mathematical value. -/
def relEntropy (p q : α → ℝ) : ℝ :=
  ∑ x, p x * Real.log (p x / q x)

theorem relEntropy_nonneg {p q : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hq0 : ∀ x, 0 ≤ q x) (hp1 : ∑ x, p x = 1) (hq1 : ∑ x, q x = 1)
    (hsupp : ∀ x, q x = 0 → p x = 0) :
    0 ≤ relEntropy p q := by sorry

theorem relEntropy_eq_zero_iff {p q : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hq0 : ∀ x, 0 ≤ q x) (hp1 : ∑ x, p x = 1) (hq1 : ∑ x, q x = 1)
    (hsupp : ∀ x, q x = 0 → p x = 0) :
    relEntropy p q = 0 ↔ p = q := by sorry

end TauCetiRoadmap.FiniteShannonTheory
