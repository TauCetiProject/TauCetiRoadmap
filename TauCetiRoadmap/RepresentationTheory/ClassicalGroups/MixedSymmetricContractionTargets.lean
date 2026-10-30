import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.Basic.Complex.Basic

/-!
# Mixed symmetric tensors: suggested contraction signatures

This file is not the roadmap and is not exhaustive. `README.md` is definitive.
The carrier is Mathlib's actual bihomogeneous polynomial submodule; the
symmetric-power and representation comparisons are targets in the README.
-/

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups.MixedSymmetric

noncomputable section

abbrev Polynomial (N : ℕ) := MvPolynomial (Fin N ⊕ Fin N) ℂ

def variableWeight {N : ℕ} : Fin N ⊕ Fin N → ℕ × ℕ :=
  Sum.elim (fun _ => (1, 0)) (fun _ => (0, 1))

def bidegree (N m n : ℕ) : Submodule ℂ (Polynomial N) :=
  MvPolynomial.weightedHomogeneousSubmodule ℂ variableWeight (m, n)

def delta (N : ℕ) : Polynomial N →ₗ[ℂ] Polynomial N :=
  ∑ i : Fin N,
    (MvPolynomial.pderiv (Sum.inl i)).toLinearMap.comp
      (MvPolynomial.pderiv (Sum.inr i)).toLinearMap

def radius (N : ℕ) : Polynomial N :=
  ∑ i : Fin N, MvPolynomial.X (Sum.inl i) * MvPolynomial.X (Sum.inr i)

/-- Each inverse is in the image of multiplication by the actual invariant r.
The README specifies the finite right-inverse formula and equivariance. -/
theorem contraction_surjective (N : ℕ) (hN : 2 ≤ N) (a b : ℕ)
    (f : Polynomial N) (hf : f ∈ bidegree N a b) :
    ∃ q : Polynomial N, q ∈ bidegree N a b ∧ delta N (radius N * q) = f := by
  sorry

end

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups.MixedSymmetric
