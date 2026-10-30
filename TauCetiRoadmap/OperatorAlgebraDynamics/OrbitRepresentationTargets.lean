import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.GroupTheory.GroupAction.Basic

/-!
Suggested forms are aids, not the specification; the README is definitive.
The concrete orbit/crossed-product constructions are specified in D2.OrbitRepresentations.
Here the diagonal and permutation operators carry their exact coordinate laws,
so no private operator or orbit-space carrier is assumed.
-/
noncomputable section
namespace OperatorAlgebraDynamics.OrbitRepresentation

abbrev HilbertSum (I : Type*) := lp (fun _ : I => ℂ) 2

/-- Point separation kills off-diagonal entries even for a nondiscrete orbit in X. -/
theorem diagonal_commutant {I F : Type*} (value : F → I → ℂ)
    (hsep : ∀ i j : I, i ≠ j → ∃ f : F, value f i ≠ value f j)
    (D : F → (HilbertSum I →L[ℂ] HilbertSum I))
    (hD : ∀ f ξ i, (D f ξ) i = value f i * ξ i)
    (T : HilbertSum I →L[ℂ] HilbertSum I)
    (hT : ∀ f, T.comp (D f) = (D f).comp T) :
    ∃ d : I → ℂ, (∀ i, ‖d i‖ ≤ ‖T‖) ∧ ∀ ξ i, (T ξ) i = d i * ξ i := by
  sorry

/-- Transitivity reduces the diagonal commutant to scalars on the same Hilbert sum. -/
theorem transitive_commutant_scalar {G I F : Type*} [Group G] [MulAction G I]
    [Nonempty I] [MulAction.IsPretransitive G I]
    (value : F → I → ℂ)
    (hsep : ∀ i j : I, i ≠ j → ∃ f : F, value f i ≠ value f j)
    (D : F → (HilbertSum I →L[ℂ] HilbertSum I))
    (hD : ∀ f ξ i, (D f ξ) i = value f i * ξ i)
    (U : G → (HilbertSum I →L[ℂ] HilbertSum I))
    (hU : ∀ g ξ i, (U g ξ) i = ξ (g⁻¹ • i))
    (T : HilbertSum I →L[ℂ] HilbertSum I)
    (hTD : ∀ f, T.comp (D f) = (D f).comp T)
    (hTU : ∀ g, T.comp (U g) = (U g).comp T) :
    ∃ c : ℂ, T = c • ContinuousLinearMap.id ℂ (HilbertSum I) := by
  sorry

def shift (ξ : ℤ → ℂ) (n : ℤ) : ℂ := ξ (n - 1)

def modulation (θ x : ℝ) (ξ : ℤ → ℂ) (n : ℤ) : ℂ :=
  Complex.exp ((2 * Real.pi * (x - (n : ℝ) * θ) : ℝ) * Complex.I) * ξ n

/-- u is the shift, v the modulation; the phase agrees with K7's ordered relation. -/
theorem rotation_relation (θ x : ℝ) (ξ : ℤ → ℂ) (n : ℤ) :
    shift (modulation θ x ξ) n =
      Complex.exp ((2 * Real.pi * θ : ℝ) * Complex.I) * modulation θ x (shift ξ) n := by
  sorry

end OperatorAlgebraDynamics.OrbitRepresentation
