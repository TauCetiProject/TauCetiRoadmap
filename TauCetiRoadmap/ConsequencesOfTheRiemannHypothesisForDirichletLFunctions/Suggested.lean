import Mathlib
import TauCeti.Analysis.SpecialFunctions.LogIntegral
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Reciprocity

/-!
# Consequences of the Riemann hypothesis for Dirichlet L-functions: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib and Tau Ceti, the headline theorems of the roadmap that can be
stated there: the hypothesis for the completed L-functions of primitive Dirichlet characters (0.1),
the extended Riemann hypothesis for the Dedekind zeta functions of fields abelian over `ℚ` (0.2),
the Riemann hypothesis for the Hecke characters of such fields that come from abelian extensions of
`ℚ` (0.3), Lindelöf's bound for `ζ` and Littlewood's bounds for `L(1, χ)` (1.1), von Koch's bound
for `π(x) − Li x` (2.1), the prime number theorem in progressions with the square-root error term
(3.1), the bound `O((log q)²)` for the least value outside `{0, 1}` of a nonprincipal Dirichlet
character (3.4), and Littlewood's lower bound for the class numbers of imaginary quadratic fields
(4.1).

Every statement of the roadmap is a statement of another roadmap with the hypotheses removed that
the main theorems of GeneralizedRiemannHypothesisFromWindowBounds give (its sections 5.1 to 5.3:
the Riemann hypothesis for every Dirichlet L-function, through meromorphic orders, through values
and on the critical strip, and the Riemann hypothesis for `ζ`). The statement 0.1 follows from the
main theorems by Mathlib alone. The other statements here follow from them by the published
theorems that the README cites; the formal proof that GeneralizedRiemannHypothesisFromWindowBounds
cites for its main theorems does not state them.

The predicates of RiemannHypothesisStatementsAndConsequences §9.5,
`NumberField.ExtendedRiemannHypothesis K` and `GeneralizedRiemannHypothesis` of a primitive
ray-class character, are not in the library; 0.2 and 0.3 are stated with these predicates unfolded,
through the meromorphic order of Tau Ceti's continued Hecke L-function `heckeLFunctionC`, which has
a pole at `s = 1` for the trivial character and is entire otherwise. The record of a primitive
Dirichlet character is in the library (`TauCeti.LFunctions.dirichletData`, LFunctions Layer 4), but
the predicate `GeneralizedRiemannHypothesis` of a record (RiemannHypothesisStatementsAndConsequences
§9.3) is not; 0.1 is stated with that predicate unfolded, for Mathlib's
`DirichletCharacter.completedLFunction`, which has the same divisor as the completed function
`N^(s/2) · χ.completedLFunction s` of the record (ZerosOfLFunctions §§6.4a, 9.1).

The following targets are not statable at the pins, and nothing is stated in their place.

* The least prime in a progression (3.3): for `q > 3` and a unit `a` modulo `q` there is a prime
  `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²`, given the finite records under which the README states
  it. It lacks these records (of ExplicitPrimeCounting and ExplicitZetaBounds) as propositions:
  finite computations and zero counts, which the Riemann hypothesis does not give. The same holds
  of every target that takes a finite record or a table proposition of another roadmap as a
  hypothesis, among them the explicit bounds of 2.2–2.9, 3.2, 3.5, 4.6 and 4.7, Johnston–Yang's
  bound for the reciprocal ordinates (0.9), Lu–Zaman–Zhao's lower bound for `L(1, χ)` (0.7), the
  bounds for `1/ζ` of 1.4 (c) and the theorems of 0.8 under the theta clause of
  `ModEightFiniteInput`.
* The targets written in the other definitions of other roadmaps, which are not in the library:
  the exceptional zeros, the Riesz remainders, and the records of Dedekind zeta functions and of
  Hecke characters with the predicate of a record (0.5); the norm-composed characters (0.4); the
  bounds of 1.1 and 1.2 for the L-functions of the records of 0.5, through their analytic
  conductor; the argument `S(T)` (1.2) and the zero count `N(T)` (1.3) of `ζ`; the Li coefficients
  and the Weil form (1.6); Stark's constant in the bound of ExplicitNumberFields §4.7 (4.2); and the
  truncated Euler sum and its error in 4.4 (ii). They are stated when those definitions are in the
  library.

The following targets are not headline theorems and are not stated separately.

* The instances of the main theorems, and of 0.2, that other roadmaps write in their own predicates
  and records: the bounded-height hypotheses of 0.6, the records of 0.7, the zero clause of 0.8,
  the regions, densities and zero inputs of 1.4, 2.4, 2.9 and 3.2, the part `RH(T)` of the record
  of 2.7, the gaps of 1.5 and 4.2, and the clause of `DGLSWSmallFieldGRH` in 4.2.
* Targets that can be stated at the pins: the other bounds of 1.1 for `ζ` and for Dirichlet
  L-functions (those of 1.1 (i), and the bounds for `log |ζ(1/2 + it)|` and `log |L(1/2 + it, χ)|`),
  companions of the two stated here; in 2.1 the bounds for `ψ`, which is 3.1 at `q = 1`, and for
  `θ` and the count of primes in a progression, which follow from 3.1 by partial summation; in 3.4
  the least quadratic nonresidue, the case of the Legendre character, and the count of Linnik's
  exceptional primes that it implies; and the forms for number fields of the conditional theorems
  of other roadmaps, read with 0.2, 0.3 or the gaps of 4.2: 2.1 for `ψ_K`, `π_K` and Frobenius
  classes, the Hecke analogue in 3.4, the real-zero bounds of ExplicitNumberFields §4.9 in 4.2,
  and 4.3, 4.4 (i) and 4.5.

Two special cases are not stated separately: the completed Riemann zeta function, the case `N = 1`
of 0.1 (Mathlib's `DirichletCharacter.completedLFunction_modOne_eq`), and the cyclotomic fields,
the case `K = ℚ(ζ_q)` of 0.2.
-/

universe u

namespace TauCetiRoadmap.ConsequencesOfTheRiemannHypothesisForDirichletLFunctions

/-! ## Layer 0: the hypothesis for further L-functions -/

/-- **Completed L-functions of primitive characters** (0.1). For a primitive Dirichlet character
`χ`, every point of positive order of its completed L-function has real part `1/2`; there is no
condition on `Re s`. This is the hypothesis of the record of `χ`
(RiemannHypothesisStatementsAndConsequences §9.3, for the record of LFunctions Layer 4, whose
completed function has the divisor of Mathlib's `DirichletCharacter.completedLFunction`), unfolded.
For `N = 1` the completed function is `completedRiemannZeta`, whose poles at `0` and `1` have
negative order. -/
theorem re_eq_half_of_meromorphicOrderAt_completedLFunction_pos {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) {s : ℂ}
    (hs : 0 < meromorphicOrderAt (DirichletCharacter.completedLFunction χ) s) :
    s.re = 1 / 2 := by
  sorry

/-- **The extended Riemann hypothesis for fields abelian over `ℚ`** (0.2). For every number field
`K` abelian over `ℚ`, the Dedekind zeta function of `K`, the continued L-function of the trivial
primitive ray-class character of `K`, has order at most `0` at every `s` with `1/2 < Re s`. This is
the predicate `NumberField.ExtendedRiemannHypothesis K` of
RiemannHypothesisStatementsAndConsequences §9.5, unfolded. -/
theorem meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois (K : Type*) [Field K]
    [NumberField K] [IsAbelianGalois ℚ K] {s : ℂ} (hs : 1 / 2 < s.re) :
    meromorphicOrderAt
      (TauCeti.LFunctions.heckeLFunctionC
        (1 : TauCeti.LFunctions.PrimitiveRayClassCharacter K).character) s ≤ 0 := by
  sorry

/-- **Hecke characters of abelian extensions of `ℚ`** (0.3). Let `K ⊆ L` be number fields with `L`
abelian over `ℚ` (so that `L/K` is abelian), let `φ` be a character of `Gal(L/K)`, and let `φ̃` be
the primitive character of `φ` composed with the ray-class Artin map of `L/K` at its conductor.
The continued Hecke L-function of `φ̃` has order at most `0` at every `s` with `1/2 < Re s`: the
predicate `GeneralizedRiemannHypothesis` of RiemannHypothesisStatementsAndConsequences §9.5 for
`φ̃`, unfolded. The primitive character does not depend on the admissible modulus at which the
Artin map is taken (RiemannHypothesisStatementsAndConsequences §8.8). The fields are in `Type`, the
universe of Tau Ceti's ray-class Artin map. -/
theorem meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois {K L : Type} [Field K]
    [NumberField K] [Field L] [NumberField L] [Algebra K L] [IsAbelianGalois K L]
    [IsAbelianGalois ℚ L] (φ : Gal(L/K) →* ℂˣ) {s : ℂ} (hs : 1 / 2 < s.re) :
    meromorphicOrderAt
      (TauCeti.LFunctions.heckeLFunctionC
        (TauCeti.LFunctions.PrimitiveRayClassCharacter.of
          (φ.comp (TauCeti.ClassFieldTheory.rayClassArtinMap
            (TauCeti.ClassFieldTheory.abelianConductor K L)
            (TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor K L)))).character)
      s ≤ 0 := by
  sorry

/-! ## Layer 1: growth, argument and zeros of `ζ` and of L-functions -/

/-- **Lindelöf's bound** (1.1 (ii)). For every `ε > 0` there is `C` with `‖ζ(σ + it)‖ ≤ C |t|^ε`
for every `σ ≥ 1/2` and every `|t| ≥ 2`: RiemannHypothesisStatementsAndConsequences §9.7 (ii) for
`ζ` at `σ₀ = 1/2`, with the Riemann hypothesis supplied by
GeneralizedRiemannHypothesisFromWindowBounds §5.2 (Titchmarsh (1986), chapter XIV). -/
theorem norm_riemannZeta_le_rpow {ε : ℝ} (hε : 0 < ε) :
    ∃ C : ℝ, ∀ s : ℂ, 1 / 2 ≤ s.re → 2 ≤ |s.im| → ‖riemannZeta s‖ ≤ C * |s.im| ^ ε := by
  sorry

/-- **Littlewood's bounds** (1.1 (ii)). With one absolute constant `C`, every primitive Dirichlet
character `χ` modulo `q ≥ 3` has `(C log log q)⁻¹ ≤ |L(1, χ)| ≤ C log log q` and
`|L′/L(1, χ)| ≤ C log log q`: the conditional theorem of RiemannHypothesisStatementsAndConsequences
§9.7 (ii) (d), with the hypothesis for `χ` supplied by GeneralizedRiemannHypothesisFromWindowBounds
§5.1 (Littlewood (1928)). A primitive character modulo `q ≥ 3` is not the trivial one, whose
conductor is `1`. -/
theorem LFunction_one_bounds :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), 3 ≤ q → χ.IsPrimitive →
      (C * Real.log (Real.log q))⁻¹ ≤ ‖χ.LFunction 1‖ ∧
        ‖χ.LFunction 1‖ ≤ C * Real.log (Real.log q) ∧
        ‖logDeriv χ.LFunction 1‖ ≤ C * Real.log (Real.log q) := by
  sorry

/-! ## Layer 2: prime counts, Mertens sums and short intervals -/

/-- **Von Koch's bound** (2.1). `π(x) − Li x = O(√x log x)` as `x → ∞`, where
`Li x = ∫₂ˣ dt/log t` is Tau Ceti's `TauCeti.Real.logIntegral`: the case `ℚ` of
RiemannHypothesisStatementsAndConsequences §9.9 at `σ = 1/2`, with the Riemann hypothesis supplied
by GeneralizedRiemannHypothesisFromWindowBounds §5.2. -/
theorem primeCounting_sub_logIntegral_isBigO :
    (fun x : ℝ ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) - TauCeti.Real.logIntegral x) =O[Filter.atTop]
      fun x ↦ √x * Real.log x := by
  sorry

/-! ## Layer 3: primes in progressions and character values -/

/-- **Primes in progressions with the square-root error term** (3.1). For every `q ≥ 1` and every
unit `a` modulo `q`, `ψ(x; a, q) - x/φ(q) = O(√x log² x)` as `x → ∞`, where
`ψ(x; a, q) = Σ_{n ≤ x, n ≡ a mod q} Λ(n)` (AnalyticNumberTheoryPartI §0.2). -/
theorem psiAP_isBigO (q : ℕ) [NeZero q] {a : ZMod q} (ha : IsUnit a) :
    (fun x : ℝ ↦ (∑ n ∈ Finset.Iic ⌊x⌋₊, ArithmeticFunction.vonMangoldt.residueClass a n) -
        x / q.totient) =O[Filter.atTop] fun x ↦ √x * Real.log x ^ 2 := by
  sorry

/-- **The least character value** (3.4). There is an absolute `C` such that every nonprincipal
Dirichlet character `χ` modulo `q ≥ 2` takes a value outside `{0, 1}` at some `n` with
`1 ≤ n ≤ C (log q)²`: QuasiRiemannHypothesis §11.2 at `θ = 1/2`, with the hypothesis for `χ`
supplied by GeneralizedRiemannHypothesisFromWindowBounds §5.1. At the Legendre character modulo an
odd prime `p` it bounds the least quadratic nonresidue by `C (log p)²`. -/
theorem exists_ne_zero_ne_one_le_log_sq :
    ∃ C : ℝ, ∀ (q : ℕ) [NeZero q], 2 ≤ q → ∀ χ : DirichletCharacter ℂ q, χ ≠ 1 →
      ∃ n : ℕ, 0 < n ∧ (n : ℝ) ≤ C * Real.log q ^ 2 ∧ χ n ≠ 0 ∧ χ n ≠ 1 := by
  sorry

/-! ## Layer 4: number fields -/

/-- **Littlewood's class-number bound** (4.1). There is an absolute `c > 0` with
`h(K) ≥ c √|d_K|/log log |d_K|` for every imaginary quadratic field `K` with `|d_K| > 4`, that is
for every fundamental discriminant `d_K < −4`: Littlewood's lower bound for `L(1, χ)` (1.1) read
through the class number formula `h(K) = √|d_K| L(1, χ_{d_K})/π` for `d_K ≠ −3, −4`. -/
theorem mul_sqrt_div_log_log_le_classNumber :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type u) [Field K] [NumberField K] [NumberField.IsTotallyComplex K],
      Module.finrank ℚ K = 2 → 4 < |NumberField.discr K| →
        c * √(|NumberField.discr K| : ℝ) / Real.log (Real.log |NumberField.discr K|) ≤
          (NumberField.classNumber K : ℝ) := by
  sorry

end TauCetiRoadmap.ConsequencesOfTheRiemannHypothesisForDirichletLFunctions
