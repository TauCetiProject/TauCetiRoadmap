import Mathlib
import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic

/-!
# Locally analytic distributions, growth and character spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap’s headline theorems against the pinned APIs; discharging them
finishes neither a layer nor the roadmap.

The statements are nonarchimedean Hahn–Banach and Fréchet open mapping (§0.2), fixed-rank
spectral convergence (§4.13), and compactness of Tate-algebra maps with topologically
nilpotent coordinate images (§4.15). Four definitions on native power series and
polynomials express the spectral statement: entireness, the bounded spectral resultant, the
monic tail quotient and its fixed-rank spectral output. RestrictedPowerSeries and
CompactOperators own the supplier interfaces identified in the README; in particular the
entire spectral transform of two entire inputs and its Gauss convergence are
CompactOperators §3.3's `colemanDEntire` and `tendsto_gaussNorm_colemanDBounded`, and the
closed-disc maximum modulus comparison of §0.1 is derived from RestrictedPowerSeries §2.4's
unit-radius maximum modulus principle, so it is not restated here.

The other headline results require objects absent from the pinned libraries:
* The compact-type and strong-duality comparisons of Layer 0 need nonarchimedean locally
  convex limits, strong duals and completed projective/inductive tensors. Native seminorm
  families suffice for the open-mapping statement, but do not supply these constructions
  or the left hearts used by the three-space theorems.
* The finite-piece, Stein and tower Hyodo–Kato comparisons (§0.CR.6.6) need semistable
  dagger models, log rigid Hyodo–Kato complexes and their topological limit carriers.
* The Fréchet Amice comparison and nonsplitting of differentiation and the logarithm
  sequence (Layer 1) need the analytic stages, locally analytic function space and its
  projective-limit distribution dual, with their actual topologies.
* Amice–Vélu–Vishik extension and uniqueness, its vector-order form and the isotropic
  extension theorem (Layer 2) need the p-adic C^r spaces, their tensor products and duals.
* The Mellin algebra isomorphism and rigid–adic comparison (Layer 3) need these distribution
  spaces and the compact abelian rigid character spaces with their section algebras.
* The operator spectral mapping, finite-slope perfect complexes, local Fredholm windows,
  exact-slope rank and Euler characteristic, and Fréchet finite-window comparisons
  (Layer 4) need the Banach-algebra Fredholm determinant and slope-decomposition interfaces,
  with affinoid localization and coefficient extension. The torus slope comparison also
  needs the geometric torus character/cocharacter and valuation-lattice interfaces. The
  bounded formal-series compactness theorem (§4.15) needs its coefficient-sup Banach algebra,
  which is larger than the native restricted-series algebra.

The fixed-rank spectral convergence below uses polynomial resultants directly; it does not
require a Fredholm determinant or a distribution carrier.
-/

namespace TauCetiRoadmap.LocallyAnalyticDistributions

noncomputable section

open Filter Topology

/-! ## Layer 0: analytic Banach stages, locally analytic functions and their strong duals -/

namespace AnalyticDistributions

/-- §0.2: spherical completeness gives a norm-preserving extension from any normed subspace.
The ball-intersection hypothesis states spherical completeness directly.
Source: Schneider, Proposition 9.2, pp. 58–59, and Corollary 9.4, p. 59. -/
theorem naHahnBanach {K V : Type*} [NontriviallyNormedField K] [CompleteSpace K]
    [IsUltrametricDist K] [NormedAddCommGroup V] [NormedSpace K V] [IsUltrametricDist V]
    (hK : ∀ c : Set (Set K), c.Nonempty → IsChain (· ⊆ ·) c →
      (∀ B ∈ c, ∃ a : K, ∃ r : ℝ, 0 ≤ r ∧ B = Metric.closedBall a r) →
      (⋂₀ c).Nonempty)
    (U : Submodule K V) (ℓ : U →L[K] K) :
    ∃ ℓ' : V →L[K] K, (∀ u : U, ℓ' u = ℓ u) ∧ ‖ℓ'‖ = ‖ℓ‖ := by sorry

/-- §0.2: a continuous surjection between Fréchet spaces is open. Native seminorm families
specify their locally convex topologies; the ultrametric inequality is not needed.
Source: Schneider, Proposition 8.6 and Corollary 8.7, pp. 54–55. -/
theorem naFrechet_openMapping {K V W ι κ : Type*}
    [NontriviallyNormedField K] [CompleteSpace K]
    [AddCommGroup V] [UniformSpace V] [IsUniformAddGroup V] [Module K V]
    [T2Space V] [TopologicalSpace.MetrizableSpace V] [CompleteSpace V]
    [AddCommGroup W] [UniformSpace W] [IsUniformAddGroup W] [Module K W]
    [T2Space W] [TopologicalSpace.MetrizableSpace W] [CompleteSpace W]
    (pV : ι → Seminorm K V) (pW : κ → Seminorm K W)
    (hV : WithSeminorms pV) (hW : WithSeminorms pW)
    (f : V →L[K] W) (hf : Function.Surjective f) : IsOpenMap f := by sorry

end AnalyticDistributions

/-! ## Layer 4: analytic families, Fredholm theory and finite-slope complexes -/

namespace NonarchimedeanFredholm

/-- Restrictedness at every positive radius, on Mathlib's native power-series carrier. -/
def IsEntire {A : Type*} [NormedCommRing A] (f : PowerSeries A) : Prop :=
  ∀ R : ℝ, 0 < R → PowerSeries.IsRestricted R f

/-- The bounded resultant at the prescribed characteristic rank `n` and functional degree `m`
(CompactOperators §3.3). The output variable is distinct from the resultant variable. -/
def polynomialSpectralResultant {A : Type*} [CommRing A]
    (n m : ℕ) (B P : Polynomial A) : Polynomial A :=
  Polynomial.resultant ((P.reflect n).map Polynomial.C)
    (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m

/-- The reciprocal-tail formula for monic division (RestrictedPowerSeries §7.2).
For entire input and monic `Q` the coefficient sums converge. -/
def entireMonicQuotient {A : Type*} [NormedCommRing A]
    (Q : Polynomial A) (F : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk fun n => ∑' k : ℕ, F.coeff (n + Q.natDegree + k) *
    (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k

/-- The fixed-rank spectral output, reducing the entire functional input modulo `reflect_n P`
before taking the finite resultant (§4.13). -/
def entirePolynomialSpectral {A : Type*} [NormedCommRing A]
    (n : ℕ) (B : PowerSeries A) (P : Polynomial A) : Polynomial A :=
  polynomialSpectralResultant n n
    (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) * entireMonicQuotient (P.reflect n) B)) P

variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- §4.13 (All-radius Gauss convergence at fixed characteristic rank). -/
theorem tendsto_spectral_fixed_polynomial_gauss (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant n N (PowerSeries.trunc (N + 1) B) P -
        entirePolynomialSpectral n B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := by sorry

end NonarchimedeanFredholm

namespace AnalyticDistributions

/-- §4.15: a continuous homomorphism from a finite-variable Tate algebra over a finite
extension of `ℚ_p` is compact as a linear map when every coordinate image is topologically
nilpotent. Source: Pan, §2.2.1 and Example 2.2.2, p. 13. -/
theorem tateAlgebra_isCompactOperator {p d : ℕ} [Fact p.Prime]
    {K B : Type*} [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
    [NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]
    [NormedRing B] [NormedAlgebra K B] [CompleteSpace B] [IsUltrametricDist B]
    (f : MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin d => (1 : ℝ)) →A[K] B)
    (hf : ∀ i : Fin d, IsTopologicallyNilpotent
      (f ⟨MvPowerSeries.X i,
        MvPowerSeries.isRestricted_monomial _ (Finsupp.single i 1) (1 : K)⟩)) :
    IsCompactOperator f.toContinuousLinearMap := by
  sorry

end AnalyticDistributions

end

end TauCetiRoadmap.LocallyAnalyticDistributions
