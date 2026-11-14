import Mathlib

/-!
# Automorphic p-adic L-functions, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with only the simple definitions needed
for those statements.

The following headline theorems are not statable at the pins:
* The unique equivariant coherent Eisenstein–Kronecker residue class: the completed
  Poincaré coefficient and equivariant support-cohomology carriers are missing.
* Refined integral critical evaluation: the completed universal-extension and moment
  carriers are missing.
* The de Rham cohomology of the completed logarithm coefficient, the de Rham
  polylogarithm class and its comparison with the coherent class: algebraic de Rham
  cohomology with coefficients in an integrable connection, with supports and
  equivariant, is missing.
* The residue-normalized current comparison and explicit critical class formula:
  bundle-valued relative currents and the Eisenstein–Kronecker class are missing.
* Regularized critical Hecke-value integrality, for nontrivial and unit conductors:
  compatible CM period data and the algebraic-Hecke analytic L-value interface are missing.
* Generalized Shimura algebraicity: the Serre-tensor CM period and L-value interface
  is missing; an abstract Hecke character alone does not specify these periods.
* The weak Deligne period relation: Hecke motives and determinant periods are missing.
* The integral CM Eisenstein measure and its critical moments: ordinary theta data,
  integral multivariate Amice and Eisenstein–Kronecker coordinates are missing.
* Signed bounded ray-class interpolation, integral unit-index descent of the
  weighted ray pushforward and uniqueness:
  the compatible arithmetic-avatar, CM-period and smoothed arithmetic-family
  carriers are missing.

The analytic continuation and functional-equation headlines below use the actual
lattice series in Layer 3.
The series is used through HasSum in its convergence half-plane; the total tsum
outside that half-plane is not claimed to be its analytic continuation.
-/

namespace TauCetiRoadmap.AutomorphicPadicLFunctionsPartII

/-! ## Layer 3: Analytic representatives and current normalization -/

open scoped BigOperators

/-- The diagonal Hermitian form, linear in its first variable. Its imaginary part
is the alternating pairing used for the lattice characters. -/
noncomputable def hermitianPairing {d : ℕ} (h : Fin d → ℝ)
    (z w : Fin d → ℂ) : ℂ :=
  ∑ i, (h i : ℂ) * z i * star (w i)

/-- A Kronecker summand with antiholomorphic multi-index numerator. The singular
zero vector is omitted before taking the real logarithm of the squared norm. -/
noncomputable def kroneckerTerm {d : ℕ} (h : Fin d → ℝ) (ν : Fin d → ℕ)
    (z w : Fin d → ℂ) (s : ℂ) (l : Fin d → ℂ) : ℂ :=
  if l = -z then 0 else
    (∏ i, star (z i + l i) ^ ν i) *
      Complex.exp ((2 * Real.pi * Complex.I) * (hermitianPairing h l w).im) /
      Complex.exp (s * (Real.log (hermitianPairing h (z + l) (z + l)).re : ℂ))

/-- For every positive diagonal Hermitian form and full real lattice in ℂᵈ,
the generalized Kronecker series has meromorphic continuation, is analytic away
from d (in particular at zero), and has at most a simple pole at d. For nonzero
multi-index it is also analytic at d. The auxiliary analytic function G expresses
the removable extension of (s-d)F(s) without assigning a false value at a pole.
Kings–Sprang v4, Proposition 3.13 and its Mellin proof, with completed and
uncompleted residues distinguished as in README.md §3.4. -/
theorem kronecker_meromorphic_continuation
    (d : ℕ) (hd : 0 < d) (Λ : Submodule ℤ (Fin d → ℂ))
    [DiscreteTopology Λ] [IsZLattice ℝ Λ]
    (h : Fin d → ℝ) (hh : ∀ i, 0 < h i)
    (ν : Fin d → ℕ) (z w : Fin d → ℂ) :
    ∃ F : ℂ → ℂ,
      MeromorphicOn F Set.univ ∧
      (∀ s : ℂ, (d : ℝ) + (∑ i, (ν i : ℝ)) / 2 < s.re →
        HasSum (fun l : Λ => kroneckerTerm h ν z w s l) (F s)) ∧
      (∀ s : ℂ, s ≠ (d : ℂ) → AnalyticAt ℂ F s) ∧
      (ν ≠ 0 → AnalyticAt ℂ F (d : ℂ)) ∧
      (∃ G : ℂ → ℂ, AnalyticAt ℂ G (d : ℂ) ∧
        ∀ s : ℂ, s ≠ (d : ℂ) → G s = (s - (d : ℂ)) * F s) := by
  sorry

/-- The gamma-completed Kronecker series satisfies the primal/alternating-dual
functional equation with phase exp(2πi Im H(w,z)). The metric covolume is the
Lebesgue covolume multiplied by ∏h_i. The uncompleted residue at d is
π^d/(Γ(d)vol_H Λ) when ν=0 and w belongs to the alternating dual; otherwise w
outside that dual gives regularity at d. The pointwise equation excludes Gamma
poles and the possible poles of either uncompleted series. Kings–Sprang v4,
Proposition 3.13 and its theta/Mellin proof, with the phase and completed residues
as specified in README.md §3.4. -/
theorem kronecker_functional_equation
    (d : ℕ) (hd : 0 < d) (Λ Λd : Submodule ℤ (Fin d → ℂ))
    [DiscreteTopology Λ] [IsZLattice ℝ Λ]
    (h : Fin d → ℝ) (hh : ∀ i, 0 < h i)
    (hΛd : ∀ l, l ∈ Λd ↔ ∀ m ∈ Λ, ∃ n : ℤ, (hermitianPairing h l m).im = n)
    (ν : Fin d → ℕ) (z w : Fin d → ℂ) :
    ∃ F G : ℂ → ℂ,
      (∀ s : ℂ, (d : ℝ) + (∑ i, (ν i : ℝ)) / 2 < s.re →
        HasSum (fun l : Λ => kroneckerTerm h ν z w s l) (F s)) ∧
      (∀ s : ℂ, (d : ℝ) + (∑ i, (ν i : ℝ)) / 2 < s.re →
        HasSum (fun l : Λd => kroneckerTerm h ν w z s l) (G s)) ∧
      (∀ s : ℂ, s ≠ (d : ℂ) → AnalyticAt ℂ F s ∧ AnalyticAt ℂ G s) ∧
      (∀ s : ℂ, (∀ n : ℕ, s ≠ -n) →
        (∀ n : ℕ, ((d + ∑ i, ν i : ℕ) : ℂ) - s ≠ -n) →
        s ≠ (d : ℂ) → ((d + ∑ i, ν i : ℕ) : ℂ) - s ≠ (d : ℂ) →
        (Real.pi : ℂ) ^ (-s) * Complex.Gamma s * F s =
          Complex.exp ((2 * Real.pi * Complex.I) * (hermitianPairing h w z).im) /
            (((∏ i, h i) * ZLattice.covolume Λ : ℝ) : ℂ) *
          ((Real.pi : ℂ) ^ (-(((d + ∑ i, ν i : ℕ) : ℂ) - s)) *
            Complex.Gamma (((d + ∑ i, ν i : ℕ) : ℂ) - s) *
            G (((d + ∑ i, ν i : ℕ) : ℂ) - s))) ∧
      (ν = 0 → w ∈ Λd → Filter.Tendsto (fun s => (s - d) * F s)
        (nhdsWithin (d : ℂ) {(d : ℂ)}ᶜ)
        (nhds ((Real.pi : ℂ) ^ (d : ℂ) /
          (Complex.Gamma d * (((∏ i, h i) * ZLattice.covolume Λ : ℝ) : ℂ))))) ∧
      (w ∉ Λd → AnalyticAt ℂ F (d : ℂ)) := by
  sorry

end TauCetiRoadmap.AutomorphicPadicLFunctionsPartII
