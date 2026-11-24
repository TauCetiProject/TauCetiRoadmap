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
`ℚ` (0.3), Lindelöf's bound for `ζ` and Littlewood's bounds for `L(1, χ)` (1.1), the count of the
zeros of `ζ` up to height `T` with the error `O(log T/log log T)` (1.3), the positivity of Li's
coefficients, of the Li Gram matrices and of Weil's form (1.6), von Koch's bound for `π(x) − Li x`
(2.1), the prime number theorem in progressions with the square-root error term (3.1), the bound
`O((log q)²)` for the least value outside `{0, 1}` of a nonprincipal Dirichlet character (3.4), and
Littlewood's lower bound for the class numbers of imaginary quadratic fields (4.1).

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

Every headline theorem of the roadmap is statable at the pins and is stated here. The statements
of 1.3 and 1.6 use four definitions of WeilPositivityAndLiCriterion, repeated here with the same
bodies, since a roadmap's module is not imported: the multiplicity `zetaZeroMult` of a zero of the
completed zeta function (its §1.1), the Li coefficients `liCoeff` (§3.1), the Li Gram matrices
`liGramMatrix` (§4.2) and Weil's form `weilForm` (§5.1). In 1.3 the zero count `N(T)` of
ExplicitZetaBounds §2.9 is the sum of `zetaZeroMult ρ` over the `ρ` with `0 < Im ρ ≤ T`.

The following targets are not headline theorems and are not stated separately.

* The explicit forms that take as hypotheses finite computational records or table propositions,
  which the Riemann hypothesis does not give: the least prime in a progression (3.3: for `q > 3`
  and a unit `a` modulo `q` a prime `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²`, given
  `LamzouriLiSoundararajanRange` and the Dirichlet zero counts), the explicit bounds of 2.2–2.9,
  3.2, 3.5, 4.6 and 4.7, Johnston–Yang's bound for the reciprocal ordinates (0.9), Lu–Zaman–Zhao's
  lower bound for `L(1, χ)` (0.7), the bounds for `1/ζ` of 1.4 (c) and the theorems of 0.8 under
  the theta clause of `ModEightFiniteInput`. Each is an explicit version, valid under its records,
  of a consequence of the main theorems; the records are propositions of ExplicitZetaBounds,
  ExplicitPrimeCounting and the other roadmaps that state the explicit theorems.
* The instances of the main theorems, and of 0.2 and 0.3, that other roadmaps write in their own
  predicates, carriers and records: the hypothesis for the norm-composed characters of
  QuasiRiemannHypothesis §5.4 (0.4), whose primitive characters are the characters of 0.3; the
  absence of exceptional zeros in the sense of ZerosOfLFunctions §6.3 (0.5 (a)); the hypothesis for
  the records `dedekindZetaData K` and `heckeData ψ` of LFunctions Layers 3 and 5 (0.5 (c)); the
  bounded-height hypotheses of 0.6, the records of 0.7, the zero clause of 0.8, the regions,
  densities and zero inputs of 1.4, 2.4, 2.9 and 3.2, the part `RH(T)` of the record of 2.7, the
  gaps of 1.5 and 4.2, and the clause of `DGLSWSmallFieldGRH` in 4.2.
* Targets that can be stated at the pins: the other bounds of 1.1 for `ζ` and for Dirichlet
  L-functions (those of 1.1 (i), and the bounds for `log |ζ(1/2 + it)|` and `log |L(1/2 + it, χ)|`),
  companions of the two stated here; the bound for the argument `S(T)` of `ζ` in 1.2, which, with
  `S(T)` written as ExplicitZetaBounds writes it, `N(T) − ϑ(T)/π − 1` with its Riemann–Siegel theta
  function, is 1.3 up to the constant, the two left sides differing by less than `1/(40T)`
  (ExplicitZetaBounds §2.9); in 0.5 (b) the bounds for the Riesz remainders of
  RiemannHypothesisStatementsAndConsequences §8.4a, the Riesz-smoothed companions of 2.1 and 3.1
  for one character; in 2.1 the bounds for `ψ`, which is 3.1 at `q = 1`, and for `θ` and the count
  of primes in a progression, which follow from 3.1 by partial summation; in 3.4 the least
  quadratic nonresidue, the case of the Legendre character, and the count of Linnik's exceptional
  primes that it implies; and the forms for number fields of the conditional theorems of other
  roadmaps, read with 0.2, 0.3 or the gaps of 4.2: the bounds of 1.1 and 1.2 for the L-functions of
  the records of 0.5, through their analytic conductor, 2.1 for `ψ_K`, `π_K` and Frobenius classes,
  the Hecke analogue in 3.4, the lower bounds for `κ_K` of ExplicitNumberFields §4.7, with that
  roadmap's Stark weight, and the real-zero bounds of its §4.9 in 4.2, and 4.3, 4.4 and 4.5.

Two special cases are not stated separately: the completed Riemann zeta function, the case `N = 1`
of 0.1 (Mathlib's `DirichletCharacter.completedLFunction_modOne_eq`), and the cyclotomic fields,
the case `K = ℚ(ζ_q)` of 0.2.
-/

universe u

namespace TauCetiRoadmap.ConsequencesOfTheRiemannHypothesisForDirichletLFunctions

open scoped ContDiff ComplexConjugate

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

/-- The multiplicity of `ρ` as a zero of the completed zeta function: the positive part of the
divisor of `completedRiemannZeta` on `ℂ` at `ρ`. It is `0` at the poles `0` and `1` and at the
trivial zeros of `riemannZeta`, and off the real axis it is the multiplicity of `ρ` as a zero of
`ζ`. The definition of WeilPositivityAndLiCriterion §1.1. -/
noncomputable def zetaZeroMult (ρ : ℂ) : ℕ :=
  (MeromorphicOn.divisor completedRiemannZeta Set.univ ρ).toNat

/-- **The zero count of `ζ`** (1.3). There is `C` with
`|N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ C log T/log log T` for every `T ≥ 16`, where `N(T)`, the
number of zeros of `ζ` with `0 < Im ρ ≤ T` counted with multiplicity (ExplicitZetaBounds §2.9),
is the sum of `zetaZeroMult ρ` over those `ρ`, a finite sum. It is the relation
`N(T) = ϑ(T)/π + 1 + S(T)` of ExplicitZetaBounds §2.9 with the bound for `S(T)` of 1.2
(RiemannHypothesisStatementsAndConsequences §9.8), the Riemann hypothesis supplied by
GeneralizedRiemannHypothesisFromWindowBounds §5.2. -/
theorem abs_sum_zetaZeroMult_sub_le :
    ∃ C : ℝ, ∀ T : ℝ, 16 ≤ T →
      |(∑ᶠ ρ ∈ {ρ : ℂ | 0 < ρ.im ∧ ρ.im ≤ T}, (zetaZeroMult ρ : ℝ)) -
          T / (2 * Real.pi) * Real.log (T / (2 * Real.pi * Real.exp 1)) - 7 / 8| ≤
        C * Real.log T / Real.log (Real.log T) := by
  sorry

/-- The `n`-th Li coefficient of `ζ`, in its symmetric, absolutely convergent form
`λₙ = ½ ∑_ρ m_ρ Re [(1 − (1 − 1/ρ)^n) + (1 − (1 − 1/(1 − ρ))^n)]` with `m_ρ = zetaZeroMult ρ`;
`liCoeff 0 = 0`. The definition of WeilPositivityAndLiCriterion §3.1. -/
noncomputable def liCoeff (n : ℕ) : ℝ :=
  (1 / 2 : ℝ) * ∑' ρ : ℂ, (zetaZeroMult ρ : ℝ) *
    ((1 - (1 - 1 / ρ) ^ n) + (1 - (1 - 1 / (1 - ρ)) ^ n)).re

/-- The Li Gram matrix of size `N`, with entries `λ_(i+1) + λ_(j+1) − λ_|i − j|`. The definition
of WeilPositivityAndLiCriterion §4.2. -/
noncomputable def liGramMatrix (N : ℕ) : Matrix (Fin N) (Fin N) ℝ :=
  fun i j ↦ liCoeff ((i : ℕ) + 1) + liCoeff ((j : ℕ) + 1) -
    liCoeff (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ))

/-- Weil's form on the zero side, `W(g, h) = ∑_ρ m_ρ ĝ(ρ) conj (ĥ(1 − conj ρ))` with
`ĝ = mellin g` and `m_ρ = zetaZeroMult ρ`. The definition of WeilPositivityAndLiCriterion §5.1. -/
noncomputable def weilForm (g h : ℝ → ℂ) : ℂ :=
  ∑' ρ : ℂ, (zetaZeroMult ρ : ℂ) * (mellin g ρ * conj (mellin h (1 - conj ρ)))

/-- **Li's coefficients are positive** (1.6). `λₙ > 0` for every `n ≥ 1`: Li's criterion in the
direction from the Riemann hypothesis (WeilPositivityAndLiCriterion §3.2; Li (1997)), the Riemann
hypothesis supplied by GeneralizedRiemannHypothesisFromWindowBounds §5.2. -/
theorem liCoeff_pos (n : ℕ) (hn : 1 ≤ n) : 0 < liCoeff n := by
  sorry

/-- **The Li Gram matrices are positive definite** (1.6). For every `N` the matrix
`(λ_(i+1) + λ_(j+1) − λ_|i − j|)` indexed by `0 ≤ i, j < N` is positive definite:
WeilPositivityAndLiCriterion §4.2, the Riemann hypothesis supplied by
GeneralizedRiemannHypothesisFromWindowBounds §5.2. -/
theorem liGramMatrix_posDef (N : ℕ) : (liGramMatrix N).PosDef := by
  sorry

/-- **Weil's form is positive** (1.6). `Re W(g, g) > 0` for every nonzero smooth `g : ℝ → ℂ` with
compact support in `(0, ∞)`: the strict form of Weil's criterion (WeilPositivityAndLiCriterion
§5.2; Weil (1952)), from GeneralizedRiemannHypothesisFromWindowBounds §5.2, which makes every term
`m_ρ |ĝ(ρ)|²`, and from 1.3, which bounds the multiplicities so that the zeros of `ζ`, counted
without multiplicity, outnumber the zeros of the entire function `ĝ`. -/
theorem re_weilForm_pos (g : ℝ → ℂ) (hg : ContDiff ℝ ∞ g) (hgc : HasCompactSupport g)
    (hgs : tsupport g ⊆ Set.Ioi 0) (hg0 : g ≠ 0) : 0 < (weilForm g g).re := by
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
