import Mathlib

/-!
# Taylor bounds and depths on height-two formal groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. One of the three
headlines, the flow programme, is statable and is stated below; the other two are not statable at
the pins.

* The flow programme (4.6 (a)–(c)): for `n′` even, a prime `p ≥ 3` and `D ∈ ℝ_{≥0}^{ℤ/n′}`, the
  programme `𝔉_p(D)` is the maximum of `Σ_s D_s(γ_LT − σ_s)` over the dual radius vectors `σ`,
  attained at one that satisfies the constraint for every odd shift; it lies between
  `ρ_LT·Σ_s D_s` and `γ_LT·Σ_s D_s`; and it equals `ρ_LT·Σ_s D_s` when `max D ≤ p·min D`. These
  are statements about finite sums of real numbers, stated below with the programme
  `flowProgramme` and the dual radius vectors `IsDualRadiusVector`. The positive homogeneity and
  the convexity of `𝔉_p` (4.6 (b)) are not stated.
* The Taylor bound at weighted radii (4.5): for `p` odd, a series `β` in the letters satisfying
  the cocycle conditions (B1)–(B4) of 4.3, an integral series `U`, the compositional inverse `g` of
  the letter logarithms, an integral matrix `M` compatible with the letters, radii `σ_i`
  satisfying the bi-power condition up to `κ` and an integer `a ≥ 1` bounding the entries of `κ`,
  `v_p(κ!·coeff_κ[U(g(My))·exp(±β_M(y))]) ≥ Σ_i κ_i(γ_LT − σ_i) − #ι·(log_p a + 1)`. Mathlib has
  multivariate power series with substitution (`MvPowerSeries.subst`), the exponential series
  `PowerSeries.exp`, the Gauss norm `MvPowerSeries.gaussNorm` and one-dimensional formal group laws
  `FormalGroup`. It lacks the letter logarithms of a twisted system and the compositional inverse of
  a system of logarithms in several variables, the torus action on the letters, the coboundaries
  `Δ_ev β`, `Δ_odd β` and the class of cocycles (B1)–(B4), and the series `β_M` with its bi-power
  monomials; written out from Mathlib's power series these form a long ad hoc encoding of the
  setting of 4.3, which is not made here.
* The depth at the points of a unitary moduli problem (4.19f (a)): at an algebraic integral framed
  point with an integral chart of a PEL moduli problem of unitary type whose polarisation `λ` is
  principal, for a CM field `E`, above a prime `ℓ ≥ 5` unramified in `E` and prime to the level,
  all of whose orbits alternate between the CM type and its conjugate without being stable under
  conjugation, the depth `ν` of a dominant weight satisfies
  `T·ν ≤ Σ_{orbits}𝔉_ℓ(n·w) + C·err + T·R_w^{tot}/(ℓ − 1)`. It lacks PEL moduli
  problems of unitary type and their points over complete discrete valuation rings (PELModuli
  §M1.7), semi-abelian schemes and their formal completions along the zero section
  (ShimuraCompactifications §6.1), rigidified cubical line bundles with their biextensions, integral
  charts with their polarisation series (4.8b), and harmonic polynomials of a weight in several
  copies of the tangent coordinates; neither Mathlib nor Tau Ceti has these carriers at the pins.

The integrality gap 4.2, the elementary inequalities of 4.1 (e), (f) and the flag lemma
4.18 (b) are statable in Mathlib; they are steps of the routes, not headlines, and are not stated
here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.TaylorBoundsAndDepthsOnHeightTwoFormalGroups

open Finset

/-- A *dual radius vector* for the flow programme on `ℤ/n′` at `p` (4.6): a vector
`σ ∈ [0, 1]^{ℤ/n′}` with `p^i·σ_s + σ_{s+i} ≥ 1` for every letter `s` and every odd `i < n′`.
[FormalProof], `Formalism/IncomingBounds/IncomingBound.lean` (`Formalism.IncomingBounds.IsDual`). -/
def IsDualRadiusVector (p n' : ℕ) (σ : ZMod n' → ℝ) : Prop :=
  (∀ s, 0 ≤ σ s ∧ σ s ≤ 1) ∧
    ∀ s, ∀ i ∈ (range n').filter Odd, 1 ≤ (p : ℝ) ^ i * σ s + σ (s + i)

/-- The *flow programme* `𝔉_p(D)` of 4.6: `γ_LT(p)·Σ_s D_s`, with `γ_LT(p) = p/(p² − 1)`, minus the
largest total `Σ_{s,i} x_{s,i}` of a flow `x ≥ 0` (indexed by the letters `s ∈ ℤ/n′` and the odd
`i < n′`) with `Σ_i p^i·x_{s,i} + Σ_i x_{s−i,i} ≤ D_s` for every `s`. -/
noncomputable def flowProgramme (p n' : ℕ) [NeZero n'] (D : ZMod n' → ℝ) : ℝ :=
  (p : ℝ) / ((p : ℝ) ^ 2 - 1) * ∑ s, D s -
    sSup {t : ℝ | ∃ x : ZMod n' → ℕ → ℝ, (∀ s i, 0 ≤ x s i) ∧
      (∀ s, ∑ i ∈ (range n').filter Odd, ((p : ℝ) ^ i * x s i + x (s - i) i) ≤ D s) ∧
      t = ∑ s, ∑ i ∈ (range n').filter Odd, x s i}

/-! ## Layer 4: Taylor bounds on height-two formal groups and depths of weights -/

/-- Duality for the flow programme (4.6 (a)): for `n′` even, a prime `p ≥ 3` and `D ≥ 0`, every
dual radius vector `σ` has `Σ_s D_s(γ_LT − σ_s) ≤ 𝔉_p(D)`, and equality holds at a dual radius
vector that satisfies `p^i·σ_s + σ_{s+i} ≥ 1` for every odd `i ≥ 1`, also `i ≥ n′`. -/
theorem flowProgramme_duality (p n' : ℕ) [NeZero n'] (hp : p.Prime) (hp3 : 3 ≤ p)
    (hn' : Even n') (D : ZMod n' → ℝ) (hD : ∀ s, 0 ≤ D s) :
    (∀ σ, IsDualRadiusVector p n' σ →
        ∑ s, D s * ((p : ℝ) / ((p : ℝ) ^ 2 - 1) - σ s) ≤ flowProgramme p n' D) ∧
      ∃ σ, IsDualRadiusVector p n' σ ∧
        (∀ s, ∀ i : ℕ, Odd i → 1 ≤ (p : ℝ) ^ i * σ s + σ (s + i)) ∧
        flowProgramme p n' D = ∑ s, D s * ((p : ℝ) / ((p : ℝ) ^ 2 - 1) - σ s) := by
  sorry

/-- The bounds of the flow programme (4.6 (b)): for `n′` even, a prime `p ≥ 3` and `D ≥ 0`,
`ρ_LT·Σ_s D_s ≤ 𝔉_p(D) ≤ γ_LT·Σ_s D_s`, with `ρ_LT(p) = 1/(p² − 1)` and `γ_LT(p) = p/(p² − 1)`.
The lower bound follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/FlowProgrammeBoundsAndLowLevelOptimum.lean`
(`GlobalTheory.FlowProgrammeFacts.main`); the upper bound is this roadmap's own formulation. -/
theorem flowProgramme_bounds (p n' : ℕ) [NeZero n'] (hp : p.Prime) (hp3 : 3 ≤ p)
    (hn' : Even n') (D : ZMod n' → ℝ) (hD : ∀ s, 0 ≤ D s) :
    1 / ((p : ℝ) ^ 2 - 1) * ∑ s, D s ≤ flowProgramme p n' D ∧
      flowProgramme p n' D ≤ (p : ℝ) / ((p : ℝ) ^ 2 - 1) * ∑ s, D s := by
  sorry

/-- The flow programme of a nearly constant vector (4.6 (c)): for `n′` even, a prime `p ≥ 3` and
`D ≥ 0` with `max D ≤ p·min D`, `𝔉_p(D) = ρ_LT·Σ_s D_s`, with `ρ_LT(p) = 1/(p² − 1)`.
Follows from [FormalProof],
`Development/AutomorphicArithmetic/OrbitLabellings/FnumEqRhoMulSumOfDemandRatioLe.lean`
(`UpperTheory.fnum_eq_rho_mul_sum_of_demand_ratio_le`). -/
theorem flowProgramme_eq_of_max_le_mul_min (p n' : ℕ) [NeZero n'] (hp : p.Prime) (hp3 : 3 ≤ p)
    (hn' : Even n') (D : ZMod n' → ℝ) (hD : ∀ s, 0 ≤ D s)
    (hmax : ∀ s t, D s ≤ (p : ℝ) * D t) :
    flowProgramme p n' D = 1 / ((p : ℝ) ^ 2 - 1) * ∑ s, D s := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.TaylorBoundsAndDepthsOnHeightTwoFormalGroups
