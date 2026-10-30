module

import Mathlib

/-!
# Automorphic spectral theory, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. Complex coordinates represent the
complexification of any finite-dimensional real vector space.

Headlines not statable at the pins, with their missing carriers:
* Sharp Weyl-invariant interpolation: root-datum real-form strips and symbol algebras.
* Real reductive Schwartz multipliers, rapid estimates and finite K-type detection:
  the reductive-group Schwartz algebra and Casselman–Wallach representations.
* Weighted Sobolev evaluation and nuclear maps on seminorm completions: smooth
  weighted adelic quotient representations and their Banach seminorm completions.
* Nuclear Schwartz tensors and weighted constant-term decomposition: quotient Schwartz
  spaces, completed projective tensors and their constant-term maps.
* Relative-character convergence and Arthur's factorized formula: smooth automorphic
  induced representations with their topological tensor products.
* Support projections and summability: weighted cuspidal-support spaces.
* Regular constant-term boundedness and holomorphy: regular cuspidal data and Levi spaces.
* Lapid inversion under hereditary (HP), including the GL products: Schwartz-valued
  Eisenstein wave packets and normalized intertwiners.
* Schwartz kernels, uniform component bounds and grouped expansion: adelic quotient
  kernels and Eisenstein inducing spaces.
* Polynomial cuspidal counting and finite typical data: cuspidal automorphic
  representations, their levels and derived Casimir parameters.
* Archimedean annihilators and finite surviving components: induced spectral families
  and their Schwartz multiplier action.
* Mixed separation and normalized global isolation: mixed Hecke/Schwartz multipliers
  and the automorphic cuspidal-support Hilbert decomposition.
* Non-CAP isolation and admissible-representation preservation: CAP occurrence and
  central-character automorphic Hilbert representations.
* One GL_n cuspidal-support component: normalized adelic induction and its support blocks.
* Refined discrete-data isolation under polynomial counting: the Langlands discrete-data
  Hilbert decomposition and its character equations.
-/

namespace TauCetiRoadmap.AutomorphicSpectralTheoryPartII

/-! ## Layer 0: Entire interpolation and real-form symbol algebras -/

/-- Countability and summability of the inverse (p+1)-powers of the nonzero points. -/
def HasRankBound (Λ : Set ℂ) (p : ℕ) : Prop :=
  Λ.Countable ∧ Summable (fun z : {z : ℂ // z ∈ Λ ∧ z ≠ 0} => (‖z.1‖ ^ (p + 1))⁻¹)

/-- The genus-p elementary Weierstrass factor; at p=0 the exponent sum is empty. -/
noncomputable def elementaryFactor (p : ℕ) (w : ℂ) : ℂ :=
  (1 - w) * Complex.exp (∑ j ∈ Finset.range p, w ^ (j + 1) / ((j + 1 : ℕ) : ℂ))

/-- The unordered canonical product, inserting one zero at the origin exactly
when the prescribed set contains the origin. -/
noncomputable def canonicalProduct (Λ : Set ℂ) (p : ℕ) (z : ℂ) : ℂ := by
  classical
  exact z ^ (if (0 : ℂ) ∈ Λ then 1 else 0) *
    ∏' w : {w : ℂ // w ∈ Λ ∧ w ≠ 0}, elementaryFactor p (z / w.1)

/-- The finite partial canonical product, with one origin factor and one factor
for each member of the finite nonzero-point set. -/
noncomputable def partialCanonicalProduct (Λ : Set ℂ) (p : ℕ)
    (s : Finset {w : ℂ // w ∈ Λ ∧ w ≠ 0}) (z : ℂ) : ℂ := by
  classical
  exact z ^ (if (0 : ℂ) ∈ Λ then 1 else 0) *
    ∏ w ∈ s, elementaryFactor p (z / w.1)

/-- An integral-degree global exponential bound expressing finite entire order.
Holomorphy is a separate hypothesis in the interpolation statement. -/
def HasFiniteEntireOrder (ψ : ℂ → ℂ) : Prop :=
  ∃ C : ℝ, 0 < C ∧ ∃ d : ℕ, ∀ z : ℂ, ‖ψ z‖ ≤ Real.exp (C * (1 + ‖z‖) ^ d)

/-- Every polynomial weight is bounded on each strip with bounded real part. -/
def HasRapidVerticalDecay {n : ℕ} (ν : (Fin n → ℂ) → ℂ) : Prop :=
  ∀ M : ℝ, 0 < M → ∀ r : ℕ, ∃ C : ℝ, 0 ≤ C ∧
    ∀ z : Fin n → ℂ, ‖fun i => (z i).re‖ ≤ M → (1 + ‖z‖) ^ r * ‖ν z‖ ≤ C

/-- The translate by a of the integer span of a finite family of complex vectors.
Complex linear independence is a hypothesis of the interpolation theorem. -/
def affineSpectralLattice {n k : ℕ} (a : Fin n → ℂ)
    (b : Fin k → (Fin n → ℂ)) : Set (Fin n → ℂ) :=
  Set.range (fun m : Fin k → ℤ => a + ∑ i, (m i : ℂ) • b i)

/-- The rank-bound canonical product is entire with precisely the prescribed
simple zeros and a global order-(p+1) growth bound. BPLZZ, Lemma 2.2;
the genus-zero case uses the same elementary product estimate. -/
theorem finite_rank_weierstrass_product (Λ : Set ℂ) (p : ℕ) (hΛ : HasRankBound Λ p) :
    TendstoLocallyUniformly (partialCanonicalProduct Λ p) (canonicalProduct Λ p)
      Filter.atTop ∧
    Differentiable ℂ (canonicalProduct Λ p) ∧
    (∀ z : ℂ, canonicalProduct Λ p z = 0 ↔ z ∈ Λ) ∧
    (∀ z ∈ Λ, deriv (canonicalProduct Λ p) z ≠ 0) ∧
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ,
      ‖canonicalProduct Λ p z‖ ≤ Real.exp (C * (1 + ‖z‖) ^ (p + 1)) := by
  sorry

/-- A polynomial pullback of a finite-order entire zero set is exactly the zero
set of an entire rapidly vertically decreasing function in every finite dimension.
BPLZZ, Proposition 2.4 and Remark 2.7. -/
theorem polynomial_zero_fiber_interpolation (n : ℕ) (q : MvPolynomial (Fin n) ℂ)
    (ψ : ℂ → ℂ) (hψ : Differentiable ℂ ψ) (horder : HasFiniteEntireOrder ψ) :
    ∃ ν : (Fin n → ℂ) → ℂ, Differentiable ℂ ν ∧ HasRapidVerticalDecay ν ∧
      ∀ z, ν z = 0 ↔ ψ (MvPolynomial.eval z q) = 0 := by
  sorry

/-- An affine lattice generated by complex-linearly independent vectors admits
an entire rapid vertical interpolant zero on all lattice points outside a finite
exceptional set and nonzero throughout that set. Rank zero is included.
BPLZZ, Corollary 2.6 and Remark 2.7. -/
theorem affine_lattice_interpolation (n k : ℕ) (a : Fin n → ℂ)
    (b : Fin k → (Fin n → ℂ)) (hb : LinearIndependent ℂ b)
    (A : Finset (Fin n → ℂ)) :
    ∃ ν : (Fin n → ℂ) → ℂ, Differentiable ℂ ν ∧ HasRapidVerticalDecay ν ∧
      (∀ z ∈ affineSpectralLattice a b, z ∉ A → ν z = 0) ∧
      (∀ z ∈ A, ν z ≠ 0) := by
  sorry

end TauCetiRoadmap.AutomorphicSpectralTheoryPartII
