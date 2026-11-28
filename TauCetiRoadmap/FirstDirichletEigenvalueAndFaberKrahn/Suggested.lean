import Mathlib
import TauCeti.Analysis.PDE.Spectrum.Basic
import TauCeti.Analysis.BoundedVariation.Perimeter

/-!
# The first Dirichlet eigenvalue and Faber–Krahn: target signatures

This file is not the roadmap: `README.md` is the definitive specification. It states the
roadmap's definitions with real bodies and its theorems with `sorry`; every headline theorem of
the README is statable at the pins and is stated here.

The first Dirichlet eigenvalue of an open set `Ω` of a finite-dimensional real inner product
space is the infimum of the Rayleigh quotients `∫ ‖∇φ‖² / ∫ φ²` of the nonzero test functions
`φ ∈ C_c^∞(Ω)`, valued in `[0, ∞]`, with value `∞` exactly on the empty set. Layer 1 compares it
with Lipschitz trial functions and with Tau Ceti's first Dirichlet eigenvalue of `-Δ` on
`H¹₀(Ω)`; Layer 2 proves its behaviour under similarities, disjoint unions and products; Layer 3
proves the Faber–Krahn inequality, Cheeger's inequality, the Cheeger constant of balls and the
Hersch–Protter inequality for convex sets.
-/

noncomputable section

open MeasureTheory Set Metric TopologicalSpace
open scoped ENNReal Distributions

namespace TauCetiRoadmap.FirstDirichletEigenvalueAndFaberKrahn

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-! ## Layer 1: the first Dirichlet eigenvalue -/

/-- **1.1** The Dirichlet Rayleigh quotient `∫ ‖∇u‖² / ∫ u²` of a real function, in `[0, ∞]`,
with `∇u` the Fréchet derivative (zero where `u` is not differentiable). -/
def dirichletRayleigh (u : E → ℝ) : ℝ≥0∞ :=
  (∫⁻ x, ‖fderiv ℝ u x‖ₑ ^ 2) / ∫⁻ x, ‖u x‖ₑ ^ 2

/-- **1.1** The first Dirichlet eigenvalue (principal frequency) of an open set `Ω`: the infimum
of the Dirichlet Rayleigh quotients of the nonzero test functions `φ ∈ C_c^∞(Ω)`. It is `∞` for
the empty set and finite otherwise. -/
def principalFrequency (Ω : Opens E) : ℝ≥0∞ :=
  ⨅ (φ : 𝓓(Ω, ℝ)) (_ : (φ : E → ℝ) ≠ 0), dirichletRayleigh (φ : E → ℝ)

/-- **1.2** Lipschitz trial functions. The first Dirichlet eigenvalue is also the infimum of the
Rayleigh quotients of the nonzero Lipschitz functions with compact support inside `Ω`, the
gradient being the almost-everywhere derivative. -/
theorem principalFrequency_eq_iInf_lipschitz (Ω : Opens E) :
    principalFrequency Ω =
      ⨅ (u : E → ℝ) (_ : ∃ K, LipschitzWith K u) (_ : HasCompactSupport u)
        (_ : tsupport u ⊆ Ω) (_ : u ≠ 0), dirichletRayleigh u :=
  sorry

/-- **1.3** Agreement with Tau Ceti's first Dirichlet eigenvalue of `-Δ`. On a nonempty open set
of a Euclidean space (bounded or not), for any boundedness and coercivity data of the energy form
`∫ ∇u · ∇v` on `H¹₀(Ω)`, the first Dirichlet eigenvalue defined by test functions is the real
number `TauCeti.PDE.firstDirichletEigenvalue`. -/
theorem principalFrequency_eq_ofReal_firstDirichletEigenvalue {ι : Type*} [Fintype ι]
    [DecidableEq ι]
    {Ω : Opens (EuclideanSpace ℝ ι)}
    (hcoeff : MemLp (fun x ↦ TauCeti.PDE.energyIntegrand
        ((fun _ => (1 : Matrix ι ι ℝ)) x) ((0 : EuclideanSpace ℝ ι → EuclideanSpace ℝ ι) x)
        ((0 : EuclideanSpace ℝ ι → ℝ) x)) ⊤ (volume.restrict (Ω : Set (EuclideanSpace ℝ ι))))
    (hcoercive : IsCoercive (TauCeti.PDE.energyFormH1L0 hcoeff))
    (hne : (Ω : Set (EuclideanSpace ℝ ι)).Nonempty) :
    principalFrequency Ω =
      ENNReal.ofReal (TauCeti.PDE.firstDirichletEigenvalue hcoeff hcoercive) :=
  sorry

/-! ## Layer 2: similarities, disjoint unions and products -/

section Structure

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]

/-- **2.1** Similarities. If `Ω'` is the image of `Ω` under `x ↦ c + t • L x` for a linear
isometric equivalence `L` and a real `t ≠ 0`, then `λ₁(Ω') · t² = λ₁(Ω)`. -/
theorem principalFrequency_image_similarity (L : E ≃ₗᵢ[ℝ] F) (c : F) {t : ℝ}
    (ht : t ≠ 0) (Ω : Opens E) (Ω' : Opens F)
    (hΩ' : (Ω' : Set F) = (fun x => c + t • L x) '' (Ω : Set E)) :
    principalFrequency Ω' * ENNReal.ofReal (t ^ 2) = principalFrequency Ω :=
  sorry

/-- **2.2** Disjoint unions. The first Dirichlet eigenvalue of a union of pairwise disjoint open
sets is the infimum of their first Dirichlet eigenvalues. -/
theorem principalFrequency_iSup {ι : Type*} (Ω : ι → Opens E)
    (hd : Pairwise fun i j => Disjoint (Ω i : Set E) (Ω j : Set E)) :
    principalFrequency (⨆ i, Ω i) = ⨅ i, principalFrequency (Ω i) :=
  sorry

/-- **2.3** Products. For open `Ω₁ ⊆ E` and `Ω₂ ⊆ F`, the first Dirichlet eigenvalue of the
product `Ω₁ × Ω₂` in the Euclidean product `WithLp 2 (E × F)` is the sum of the two. -/
theorem principalFrequency_prod (Ω₁ : Opens E) (Ω₂ : Opens F)
    (Ω : Opens (WithLp 2 (E × F)))
    (hΩ : (Ω : Set (WithLp 2 (E × F))) =
      {z | (WithLp.ofLp z).1 ∈ Ω₁ ∧ (WithLp.ofLp z).2 ∈ Ω₂}) :
    principalFrequency Ω = principalFrequency Ω₁ + principalFrequency Ω₂ :=
  sorry

end Structure

/-! ## Layer 3: isoperimetric inequalities for the first eigenvalue -/

/-- **3.1** The Faber–Krahn inequality. Among open sets of a given volume the centred ball has the
least first Dirichlet eigenvalue: if `vol(ball 0 r) = vol(Ω)` then `λ₁(ball 0 r) ≤ λ₁(Ω)`. -/
theorem principalFrequency_ball_le (Ω : Opens E) {r : ℝ}
    (hr : volume (ball (0 : E) r) = volume (Ω : Set E)) :
    principalFrequency ⟨ball (0 : E) r, isOpen_ball⟩ ≤ principalFrequency Ω :=
  sorry

/-- **3.2** The Cheeger constant of a set `Ω`: the infimum of `P(A) / |A|` over the measurable
subsets `A ⊆ Ω` of finite positive volume, with `P(A)` the perimeter of `A` in the whole space.
It is `∞` when no such subset exists. -/
def cheegerConstant (Ω : Set E) : ℝ≥0∞ :=
  ⨅ (A : Set E) (_ : MeasurableSet A) (_ : A ⊆ Ω) (_ : volume A ≠ 0) (_ : volume A ≠ ⊤),
    TauCeti.perimeter volume ⊤ A / volume A

/-- **3.2** Cheeger's inequality: `h(Ω)² / 4 ≤ λ₁(Ω)` for every open set `Ω`. -/
theorem cheegerConstant_sq_div_four_le (Ω : Opens E) :
    cheegerConstant (Ω : Set E) ^ 2 / 4 ≤ principalFrequency Ω :=
  sorry

/-- **3.3** The isoperimetric lower bound for the Cheeger constant: with `n` the dimension and
`ω_n` the volume of the unit ball, `n (ω_n / |Ω|)^(1/n) ≤ h(Ω)`. -/
theorem le_cheegerConstant (Ω : Set E) :
    (Module.finrank ℝ E : ℝ≥0∞) *
        (volume (ball (0 : E) 1) / volume Ω) ^ ((Module.finrank ℝ E : ℝ)⁻¹) ≤
      cheegerConstant Ω :=
  sorry

/-- **3.3** The Cheeger constant of a ball of radius `R > 0` is `n / R`. -/
theorem cheegerConstant_ball (c : E) {R : ℝ} (hR : 0 < R) :
    cheegerConstant (ball c R) = (Module.finrank ℝ E : ℝ≥0∞) / ENNReal.ofReal R :=
  sorry

/-- **3.4** The Hersch–Protter inequality. If `Ω` is open and convex and contains no open ball of
radius larger than `R`, then `(π / (2R))² ≤ λ₁(Ω)`. -/
theorem ofReal_pi_div_two_mul_sq_le (Ω : Opens E) (hconv : Convex ℝ (Ω : Set E)) {R : ℝ}
    (hin : ∀ (x : E) (r : ℝ), ball x r ⊆ Ω → r ≤ R) :
    ENNReal.ofReal ((Real.pi / (2 * R)) ^ 2) ≤ principalFrequency Ω :=
  sorry

end TauCetiRoadmap.FirstDirichletEigenvalueAndFaberKrahn
