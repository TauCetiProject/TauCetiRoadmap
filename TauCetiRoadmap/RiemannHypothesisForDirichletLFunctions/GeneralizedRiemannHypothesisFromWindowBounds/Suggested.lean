import Mathlib
import TauCeti.NumberTheory.LFunctions.Hecke.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Reciprocity

/-!
# The generalized Riemann hypothesis from window bounds: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti: the Riemann
hypothesis, and the Riemann hypothesis for Dirichlet L-functions in its standard forms (Layer 5),
the window-bound form of the Riemann hypothesis (3.5), the extended Riemann hypothesis for the
Dedekind zeta functions of fields abelian over `ℚ` and the Riemann hypothesis for the Hecke
characters of such fields that come from abelian extensions of `ℚ` (5.5, 5.6), and the prime
number theorem in progressions with the square-root error term (6.5).

Of the statements below, `riemannHypothesis`, `LFunction_ne_zero_of_one_half_lt_re` and
`re_eq_half_of_LFunction_eq_zero` are, binder for binder, theorems of the formal proof
[FormalProof]. `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re`,
`riemannZeta_ne_zero_of_one_half_lt_re` and
`re_eq_half_of_meromorphicOrderAt_completedLFunction_pos` follow from them by
Mathlib alone, and so does the implication from the window bounds to `RiemannHypothesis` in
`riemannHypothesis_iff_forall_exists_windows`, given the windowed theorem of that proof. The
converse implication there, the two statements on Dedekind zeta functions and Hecke L-functions,
and `psiAP_isBigO` are consequences by the published theorems that the README cites; the formal
proof does not state them.

The predicates through which the README states these theorems are declarations of other
roadmaps, and every statement below unfolds them into Mathlib and Tau Ceti terms:
`ZeroFreeRightOf σ f` (RiemannHypothesisStatementsAndConsequences §9.2) is
`∀ s, σ < s.re → meromorphicOrderAt f s ≤ 0`; the hypothesis `χ.GeneralizedRiemannHypothesis` of a
Dirichlet character (§9.4) is `ZeroFreeRightOf (1/2) χ.LFunction`; the extended Riemann
hypothesis of a number field and the hypothesis of a ray-class character (§9.5) are
`ZeroFreeRightOf (1/2)` of the continued Dedekind zeta function and of the continued Hecke
L-function, which Tau Ceti has as `TauCeti.LFunctions.heckeLFunctionC` (the Dedekind zeta
function being the L-function of the trivial primitive character); the hypothesis of the record
of a primitive Dirichlet character (§9.3, with the record of LFunctions Layer 4) is the statement
on the points of positive order of Mathlib's `DirichletCharacter.completedLFunction`; the
predicate `HasWindows S λ` (PositivityOfDirichletSeriesWithKernels §6.9 (a)) is
`∀ Y₀, ∃ Y, max Y₀ 1 ≤ Y ∧ Set.Icc Y (Y ^ λ) ⊆ S`.

Mathlib assigns values to its L-functions at their poles. `riemannZeta 1 = (γ - log (4π)) / 2`
(`riemannZeta_one`), which is not `0` (`riemannZeta_one_ne_zero`); so `riemannZeta s ≠ 0` holds on
all of `1/2 < Re s`, and Mathlib's `RiemannHypothesis`, which excludes `s = 1` and the trivial
zeros, is the strip statement. The L-function of the trivial character modulo `N` has the value
`N ^ (-1) * ∑ j, χ j * hurwitzZeta (toAddCircle j) 1` at its pole `s = 1`, with Mathlib's values
of the Hurwitz zeta functions at their pole; it is `riemannZeta 1` for `N = 1`, and Mathlib proves
no nonvanishing at `s = 1` for the trivial character of a modulus `N > 1`. The value form below
therefore excludes the trivial character at `s = 1`, as Mathlib's
`DirichletCharacter.LFunction_ne_zero_of_one_le_re` does, while the form through orders needs no
exception.

The following headline theorems are not statable at the pins, and nothing is stated in their
place.

* The windowed Landau theorem for weighted families (2.1): for a finitely supported nonnegative
  weight `w` on the primitive finite-order ray-class characters of a number field `K`,
  `0 ≤ θ < 1`, real `C` and `λ > 1`, if the remainder `G_w(y) = Σ_ψ w(ψ) Re G_ψ(y)` satisfies
  `G_w(y) ≤ C y^θ` on windows `[Y, Y^λ]` with `Y` arbitrarily large, then every `L(s, ψ)` with
  `w(ψ) > 0` is zero-free right of `θ`. It lacks the Riesz remainder `G_ψ` of a primitive
  ray-class character (RiemannHypothesisStatementsAndConsequences §8.4a (b)), whose main term for
  the trivial character involves the Euler–Kronecker constant of `K`, also absent.
* Window bounds are the generalized Riemann hypothesis (3.3): for such a `w` and
  `σ ∈ [1/2, 1)`, every member is zero-free right of `σ` exactly when the window bound holds at
  every exponent `σ + ε`. It lacks the same remainder. Its case over `ℚ` for the trivial
  character, whose remainder is explicit, is 3.5 and is stated below.
* Cyclic families (4.2): for a primitive Dirichlet character `ψ`, window bounds with positive
  weights for its cyclic family at every exponent `1/2 + ε` hold exactly when every member
  satisfies the Riemann hypothesis. It lacks the cyclic family (FrobeniusRestrictedRieszSums §0.5),
  the bundled primitive Dirichlet character (RiemannHypothesisStatementsAndConsequences §10.3) and
  its Riesz remainder (§8.4a (b)).
* The least prime in a progression (6.23): for `q > 3` and a unit `a` modulo `q` there is a prime
  `p ≡ a (mod q)` with `p ≤ (φ(q) log q)²`, given the finite records under which the README states
  it. It lacks these records (of ExplicitPrimeCounting and ExplicitZetaBounds) as propositions:
  finite computations and zero counts, which the Riemann hypothesis does not give.

The other targets of Layer 6 are statements of other roadmaps with the hypotheses that Layer 5
proves removed; they are not headlines of this roadmap and are not stated here. Three special cases
are not stated separately: the zeros of `riemannZeta` in the critical strip (5.3), the case `N = 1`
of `re_eq_half_of_LFunction_eq_zero` (Mathlib's `DirichletCharacter.LFunction_modOne_eq`); the
completed Riemann zeta function, the case `N = 1` of the statement on completed L-functions
(Mathlib's `DirichletCharacter.completedLFunction_modOne_eq`); and the cyclotomic fields of 5.5.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GeneralizedRiemannHypothesisFromWindowBounds

/-! ## Layer 3: window bounds as a form of the generalized Riemann hypothesis -/

/-- **The Riemann hypothesis as a window bound** (3.5). Mathlib's `RiemannHypothesis` holds if and
only if for every `ε > 0` there are a ratio `λ > 1` and arbitrarily large `Y` such that
`G(y) ≤ y ^ (1/2 + ε)` for every `y ∈ [Y, Y ^ λ]`, where
`G(y) = Σ_{n ≤ y} Λ(n) (y/n - 1) - y log y + (1 + γ) y` is the Riesz remainder of the trivial
character of `ℚ` (RiemannHypothesisStatementsAndConsequences §8.4a (b)). The window condition is
the predicate `HasWindows` of PositivityOfDirichletSeriesWithKernels §6.9 (a), unfolded; the ratio
may depend on `ε`. -/
theorem riemannHypothesis_iff_forall_exists_windows :
    RiemannHypothesis ↔
      ∀ ε : ℝ, 0 < ε → ∃ lam : ℝ, 1 < lam ∧ ∀ Y₀ : ℝ, ∃ Y : ℝ, max Y₀ 1 ≤ Y ∧
        ∀ y ∈ Set.Icc Y (Y ^ lam),
          (∑ n ∈ Finset.Iic ⌊y⌋₊, ArithmeticFunction.vonMangoldt n * (y / n - 1)) -
              y * Real.log y + (1 + Real.eulerMascheroniConstant) * y ≤ y ^ (1 / 2 + ε) := by
  sorry

/-! ## Layer 5: the headline theorems -/

/-- **The generalized Riemann hypothesis for Dirichlet L-functions** (5.1). For every modulus
`N ≥ 1` and every Dirichlet character `χ` modulo `N`, primitive or not, the L-function of `χ` has
order at most `0` at every `s` with `1/2 < Re s`: it has no zero there, and its only pole, at
`s = 1` for the trivial character, is allowed. This is the predicate
`χ.GeneralizedRiemannHypothesis` of RiemannHypothesisStatementsAndConsequences §9.4, that is
`ZeroFreeRightOf (1/2) χ.LFunction` (§9.2), unfolded. -/
theorem meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 / 2 < s.re) :
    meromorphicOrderAt (DirichletCharacter.LFunction χ) s ≤ 0 := by
  sorry

/-- **The Riemann hypothesis** (5.2), in Mathlib's form: every zero of `riemannZeta` other than the
trivial zeros `-2, -4, …` and the point `s = 1` has real part `1/2`. The zeta bridge of
RiemannHypothesisStatementsAndConsequences §9.3 (`riemannHypothesis_iff_zeroFreeRightOf`,
`riemannHypothesis_iff_riemannZeta_ne_zero`) identifies it with the forms below. -/
theorem riemannHypothesis : RiemannHypothesis := by
  sorry

/-- **Nonvanishing right of the critical line** (5.3). For every Dirichlet character `χ` modulo
`N ≥ 1` and every `s` with `1/2 < Re s`, `χ.LFunction s ≠ 0`, unless `χ` is the trivial character
and `s = 1`, where Mathlib's function has its pole and an assigned value. -/
theorem LFunction_ne_zero_of_one_half_lt_re {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    {s : ℂ} (hs : 1 / 2 < s.re) (hχs : χ ≠ 1 ∨ s ≠ 1) :
    DirichletCharacter.LFunction χ s ≠ 0 := by
  sorry

/-- **Zeros in the critical strip** (5.3). Every zero `s` of the L-function of a Dirichlet character
modulo `N ≥ 1`, primitive or not, with `0 < Re s < 1` has `Re s = 1/2`. The strip is open: the
principal character modulo `2` has zeros on `Re s = 0`. -/
theorem re_eq_half_of_LFunction_eq_zero {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) {s : ℂ}
    (hs₀ : 0 < s.re) (hs₁ : s.re < 1) (hs : DirichletCharacter.LFunction χ s = 0) :
    s.re = 1 / 2 := by
  sorry

/-- **The Riemann zeta function right of the critical line** (5.3). `riemannZeta s ≠ 0` for every
`s` with `1/2 < Re s`, the point `s = 1` included, where Mathlib's value is
`(γ - log (4π)) / 2`. -/
theorem riemannZeta_ne_zero_of_one_half_lt_re {s : ℂ} (hs : 1 / 2 < s.re) :
    riemannZeta s ≠ 0 := by
  sorry

/-- **Completed L-functions of primitive characters** (5.4). For a primitive Dirichlet character
`χ`, every point of positive order of its completed L-function has real part `1/2`; there is no
condition on `Re s`. This is the hypothesis of the record of `χ`
(RiemannHypothesisStatementsAndConsequences §9.3, for the record of LFunctions Layer 4, whose
completed function is Mathlib's `DirichletCharacter.completedLFunction`), unfolded. For `N = 1`
the completed function is `completedRiemannZeta`, whose poles at `0` and `1` have negative
order. -/
theorem re_eq_half_of_meromorphicOrderAt_completedLFunction_pos {N : ℕ} [NeZero N]
    {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) {s : ℂ}
    (hs : 0 < meromorphicOrderAt (DirichletCharacter.completedLFunction χ) s) :
    s.re = 1 / 2 := by
  sorry

/-- **The extended Riemann hypothesis for fields abelian over `ℚ`** (5.5). For every number field
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

/-- **Hecke characters of abelian extensions of `ℚ`** (5.6). Let `K ⊆ L` be number fields with `L`
abelian over `ℚ` (so that `L/K` is abelian), let `φ` be a character of `Gal(L/K)`, and let `φ̃` be
the primitive character of `φ` composed with the ray-class Artin map of `L/K` at its conductor.
The continued Hecke L-function of `φ̃` has order at most `0` at every `s` with `1/2 < Re s`: the
predicate `GeneralizedRiemannHypothesis` of RiemannHypothesisStatementsAndConsequences §9.5 for
`φ̃`, unfolded. The primitive character does not depend on the admissible modulus at which the
Artin map is taken (§8.8). The fields are in `Type`, the universe of Tau Ceti's ray-class Artin
map. -/
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

/-! ## Layer 6: consequences for the conditional theorems of other roadmaps -/

/-- **Primes in progressions with the square-root error term** (6.5). For every `q ≥ 1` and every
unit `a` modulo `q`, `ψ(x; a, q) - x/φ(q) = O(√x log² x)` as `x → ∞`, where
`ψ(x; a, q) = Σ_{n ≤ x, n ≡ a mod q} Λ(n)` (AnalyticNumberTheoryPartI §0.2). -/
theorem psiAP_isBigO (q : ℕ) [NeZero q] {a : ZMod q} (ha : IsUnit a) :
    (fun x : ℝ ↦ (∑ n ∈ Finset.Iic ⌊x⌋₊, ArithmeticFunction.vonMangoldt.residueClass a n) -
        x / q.totient) =O[Filter.atTop] fun x ↦ √x * Real.log x ^ 2 := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GeneralizedRiemannHypothesisFromWindowBounds
