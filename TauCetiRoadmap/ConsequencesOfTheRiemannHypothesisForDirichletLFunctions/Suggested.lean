import Mathlib
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Reciprocity

/-!
# Consequences of the Riemann hypothesis for Dirichlet L-functions: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib and Tau Ceti, the headline theorems of the roadmap that can be
stated there: the hypothesis for the completed L-functions of primitive Dirichlet characters (0.1),
the extended Riemann hypothesis for the Dedekind zeta functions of fields abelian over `ℚ` (0.2),
the Riemann hypothesis for the Hecke characters of such fields that come from abelian extensions of
`ℚ` (0.3), and the prime number theorem in progressions with the square-root error term (3.1).

Every statement of the roadmap is a statement of another roadmap with the hypotheses removed that
the main theorems of GeneralizedRiemannHypothesisFromWindowBounds give (its sections 5.1 to 5.3:
the Riemann hypothesis for every Dirichlet L-function, through meromorphic orders, through values
and on the critical strip, and the Riemann hypothesis for `ζ`). The statement 0.1 follows from the
main theorems by Mathlib alone. The statements 0.2, 0.3 and 3.1 follow from them by the published
theorems that the README cites; the formal proof that
GeneralizedRiemannHypothesisFromWindowBounds cites for its main theorems does not state them.

The predicates of RiemannHypothesisStatementsAndConsequences §9.5,
`NumberField.ExtendedRiemannHypothesis K` and `GeneralizedRiemannHypothesis` of a primitive
ray-class character, are not in the library; 0.2 and 0.3 are stated with these predicates unfolded,
through the meromorphic order of Tau Ceti's continued Hecke L-function `heckeLFunctionC`, which has
a pole at `s = 1` for the trivial character and is entire otherwise. The record of a primitive
Dirichlet character (`dirichletData` of LFunctions Layer 4) is not in the library either; 0.1 is
stated for Mathlib's `DirichletCharacter.completedLFunction`, which has the same divisor as the
completed function of that record (ZerosOfLFunctions §§6.4a, 9.1).

The following targets are not statable at the pins, and nothing is stated in their place.

* The least prime in a progression (3.3): for `q > 3` and a unit `a` modulo `q` there is a prime
  `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²`, given the finite records under which the README states
  it. It lacks these records (of ExplicitPrimeCounting and ExplicitZetaBounds) as propositions:
  finite computations and zero counts, which the Riemann hypothesis does not give.
* The other targets of Layers 0 to 4 are statements of other roadmaps in the predicates and records
  that those roadmaps define; they are stated when those definitions are in the library.

Two special cases are not stated separately: the completed Riemann zeta function, the case `N = 1`
of 0.1 (Mathlib's `DirichletCharacter.completedLFunction_modOne_eq`), and the cyclotomic fields,
the case `K = ℚ(ζ_q)` of 0.2.
-/

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

/-! ## Layer 3: primes in progressions and character values -/

/-- **Primes in progressions with the square-root error term** (3.1). For every `q ≥ 1` and every
unit `a` modulo `q`, `ψ(x; a, q) - x/φ(q) = O(√x log² x)` as `x → ∞`, where
`ψ(x; a, q) = Σ_{n ≤ x, n ≡ a mod q} Λ(n)` (AnalyticNumberTheoryPartI §0.2). -/
theorem psiAP_isBigO (q : ℕ) [NeZero q] {a : ZMod q} (ha : IsUnit a) :
    (fun x : ℝ ↦ (∑ n ∈ Finset.Iic ⌊x⌋₊, ArithmeticFunction.vonMangoldt.residueClass a n) -
        x / q.totient) =O[Filter.atTop] fun x ↦ √x * Real.log x ^ 2 := by
  sorry

end TauCetiRoadmap.ConsequencesOfTheRiemannHypothesisForDirichletLFunctions
