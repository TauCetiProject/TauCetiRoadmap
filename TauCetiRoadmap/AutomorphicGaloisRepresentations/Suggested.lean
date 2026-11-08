module

public import Mathlib
public import TauCeti.NumberTheory.ArithmeticDirichletSeries.NaturalDensity
public import TauCeti.NumberTheory.ModularForms.Newforms.Fields

/-!
# Galois representations attached to modular and Hilbert modular forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for its headline results.
The pins are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and
Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.

The density-one ordinary-prime theorem of README §7.7 is stated on Tau Ceti's
actual classical newforms and coefficient fields. Ordinarity means that the
integral Fourier coefficient a_p lies outside some coefficient prime above p.
Squarefree level and trivial nebentypus exclude CM, so a separate CM predicate
is unnecessary in this statement. All coefficient fields are allowed, and the
existential quantifier over coefficient primes is retained.

Three statements of Layer 0's analytic quaternionic theory are stated on Mathlib's
power series and bounded operators: the counting bound behind the slope-dimension
estimate of README §0.2e, and Bol's identity and the strict small-slope kernel
criterion of README §0.2f.

The other headline results require objects absent at these pins. The period,
eigenvariety and geometric realization theorems of Layer 0 need period rings,
the analytic and overconvergent quaternionic form spaces of README §§0.2b–0.2c
and Shimura cohomology. Layer 1's DFG comparison needs parabolic premotives and their
Kuga–Sato projector realizations. Layer 2's comparison of the weight-one
Artin representation of AlgebraicModularFormsAndSerreWeights §6.4 with the
normalization of Layer 1 needs that Galois representation, which is absent at
the pins.
The unrestricted Hilbert attachment, character converse and irreducibility of
Layer 3 need Hilbert automorphic representations, algebraic Hecke-character
avatars and labelled period functors. Layer 4's Ramanujan and full local
compatibility theorems additionally need local Langlands parameters and the
Weil–Deligne functor, retaining monodromy. Layer 5's ordinary and crystalline/Wach
comparisons need those attached representations and period modules. Layer 6's
optimized residual eigensystems, integral Hecke determinant and deformation maps
need residual attachments, geometric Hecke multiplicities, determinant laws and
deformation functors. Layer 7's pure strict fixed-eigenform family, large-image
and residual-ramification theorems need the attached members, residual reductions
and shared compatible-system carrier. None of these is statable at the pins; their
full scope is specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open IsDedekindDomain UpperHalfPlane
open scoped NumberField

/-! ## Layer 0: analytic quaternionic forms -/

/-- README §0.2e: the counting bound behind the slope-dimension estimate. If the lower
bound `v * ∑_{j<n} ⌊j / hU⌋` for the sum of the first `n` slopes of a controlling operator
with `hU` classes is at most `n * h`, then `n < hU * (⌊2h / v⌋ + 2)`. No sign condition
on `h` is needed. -/
theorem lt_of_slope_sum_le (hU : ℕ) (hhU : 0 < hU) {v h : ℝ} (hv : 0 < v) (n : ℕ)
    (hn : v * ∑ j ∈ Finset.range n, ((j / hU : ℕ) : ℝ) ≤ n * h) :
    n < hU * (⌊2 * h / v⌋₊ + 2) := by
  sorry

/-- README §0.2f: Bol's identity for `N = a X + b` and `L = c X + d` with `d ≠ 0`, in
power series over a field: the `r`-th derivative of `N^(j+r) L^(-(j+1))` is
`(ad - bc)^r (j+r)(j+r-1)⋯(j+1) N^j L^(-(j+r+1))`. -/
theorem bol_identity {K : Type*} [Field K] (a b c d : K) (hd : d ≠ 0) (j r : ℕ) :
    (⇑(PowerSeries.derivative (R := K)))^[r]
        ((PowerSeries.C a * PowerSeries.X + PowerSeries.C b) ^ (j + r) *
          (PowerSeries.C c * PowerSeries.X + PowerSeries.C d)⁻¹ ^ (j + 1)) =
      PowerSeries.C ((a * d - b * c) ^ r * ((j + r).descFactorial r : K)) *
        (PowerSeries.C a * PowerSeries.X + PowerSeries.C b) ^ j *
        (PowerSeries.C c * PowerSeries.X + PowerSeries.C d)⁻¹ ^ (j + r + 1) := by
  sorry

/-- README §0.2f: the strict small-slope kernel criterion. If `Θ ∘ U = c • (U' ∘ Θ)`, the
target operator has norm at most one and `‖c‖ < ‖μ‖`, then `Θ` kills the generalized
`μ`-eigenspace of `U`. For a partial theta map `c` is `τ(ϖ_v)^(n_τ+1)` in the normalized
determinant convention, and `‖c‖ < ‖μ‖` is the strict slope cutoff `v_p(μ) < (n_τ+1)/e_v`. -/
theorem eq_zero_of_intertwining_of_norm_lt {K E E' : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup E] [NormedSpace K E] [NormedAddCommGroup E'] [NormedSpace K E']
    [CompleteSpace E'] (U : E →L[K] E) (U' : E' →L[K] E') (Θ : E →L[K] E') (c μ : K)
    (hΘ : Θ.comp U = c • U'.comp Θ) (hU' : ‖U'‖ ≤ 1) (hμ : ‖c‖ < ‖μ‖) {N : ℕ} {f : E}
    (hf : ((U - μ • 1) ^ N) f = 0) :
    Θ f = 0 := by
  sorry

/-! ## Layer 7: density-one ordinary primes -/

/-- Good rational primes at which a weight-two newform is ordinary for some prime
of its coefficient field. Rational primes are represented by the nonzero prime
ideals of the integers of ℚ, with p given by their absolute norm. -/
def ordinaryGoodPrimes {N : ℕ} [NeZero N] (f : HeckeRing.GL2.Newform N 2) :
    Set (HeightOneSpectrum (𝓞 ℚ)) :=
  {v | let p := v.asIdeal.absNorm
    ¬ p ∣ N ∧ ∃ l : HeightOneSpectrum (𝓞 (TauCeti.CoefficientField f)),
      (p : 𝓞 (TauCeti.CoefficientField f)) ∈ l.asIdeal ∧
      ∃ a : 𝓞 (TauCeti.CoefficientField f),
        ((a : TauCeti.CoefficientField f) : ℂ) =
          (qExpansion 1 f.toCuspForm).coeff p ∧ a ∉ l.asIdeal}

/-- README §7.7: the good primes ordinary at some coefficient prime have natural
density one for a squarefree-level weight-two newform with trivial nebentypus.
This is the ordinary-prime conclusion of Skinner §3, printed p. 350. -/
theorem fixedSquarefreeForm_ordinary_density_one {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hN : Squarefree N) (hχ : f.χ = 1) :
    NumberField.Set.HasNaturalDensity (ordinaryGoodPrimes f) 1 := by
  sorry

end TauCetiRoadmap.AutomorphicGaloisRepresentations
