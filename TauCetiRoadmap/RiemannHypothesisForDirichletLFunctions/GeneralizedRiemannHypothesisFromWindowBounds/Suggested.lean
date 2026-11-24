import Mathlib

/-!
# The generalized Riemann hypothesis from window bounds: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib: the Riemann hypothesis, and the
Riemann hypothesis for Dirichlet L-functions in its standard forms (Layer 5), the window-bound form
of the Riemann hypothesis (3.5), and the equivalence of window bounds for the cyclic family of a
primitive Dirichlet character with the Riemann hypothesis for its members (4.2). The statements
that these theorems give for further L-functions and for the conditional theorems of other
roadmaps are those of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions.

Of the statements below, `riemannHypothesis`, `LFunction_ne_zero_of_one_half_lt_re` and
`re_eq_half_of_LFunction_eq_zero` are, binder for binder, theorems of the formal proof
[FormalProof]. `meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re` and
`riemannZeta_ne_zero_of_one_half_lt_re` follow from them by
Mathlib alone, and so does the implication from the window bounds to `RiemannHypothesis` in
`riemannHypothesis_iff_forall_exists_windows`, given the windowed theorem of that proof; in
`forall_exists_windows_cyclicFamily_iff` the implication from the window bounds is the step of that
proof. The converse implications there are consequences by the published theorems that the README
cites; the formal proof does not state them.

The predicates through which the README states these theorems are declarations of other
roadmaps, and every statement below unfolds them into Mathlib terms:
`ZeroFreeRightOf σ f` (RiemannHypothesisStatementsAndConsequences §9.2) is
`∀ s, σ < s.re → meromorphicOrderAt f s ≤ 0`; the hypothesis `χ.GeneralizedRiemannHypothesis` of a
Dirichlet character (§9.4) is `ZeroFreeRightOf (1/2) χ.LFunction`; the
predicate `HasWindows S λ` (PositivityOfDirichletSeriesWithKernels §6.9 (a)) is
`∀ Y₀, ∃ Y, max Y₀ 1 ≤ Y ∧ Set.Icc Y (Y ^ λ) ⊆ S`. The statement of 4.2 needs three pieces of
data of other roadmaps, which this file writes out with the definitions those roadmaps give: the
bundled primitive Dirichlet character `PrimitiveDirichletCharacter`
(RiemannHypothesisStatementsAndConsequences §10.3), its Riesz remainder
`PrimitiveDirichletCharacter.rieszRemainder` (§8.4a (b)) and its cyclic family
`PrimitiveDirichletCharacter.cyclicFamily` (FrobeniusRestrictedRieszSums §0.5).

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
  `0 < θ < 1`, real `C` and `λ > 1`, if the remainder `G_w(y) = Σ_ψ w(ψ) Re G_ψ(y)` satisfies
  `G_w(y) ≤ C y^θ` on windows `[Y, Y^λ]` with `Y` arbitrarily large, then every `L(s, ψ)` with
  `w(ψ) > 0` is zero-free right of `θ`. It lacks the Riesz remainder `G_ψ` of a primitive
  ray-class character (RiemannHypothesisStatementsAndConsequences §8.4a (b)), whose main term for
  the trivial character involves the Euler–Kronecker constant of `K`, also absent.
* Window bounds are the generalized Riemann hypothesis (3.3): for such a `w` and
  `σ ∈ [1/2, 1)`, every member is zero-free right of `σ` exactly when the window bound holds at
  every exponent `σ + ε`. It lacks the same remainder. Its case over `ℚ` for the trivial
  character, whose remainder is explicit, is 3.5 and is stated below.

One special case is not stated separately: the zeros of `riemannZeta` in the critical strip (5.3),
the case `N = 1` of `re_eq_half_of_LFunction_eq_zero` (Mathlib's
`DirichletCharacter.LFunction_modOne_eq`).
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GeneralizedRiemannHypothesisFromWindowBounds

/-! ## Layer 3: window bounds as a form of the generalized Riemann hypothesis -/

/-- **The Riemann hypothesis as a window bound** (3.5). Mathlib's `RiemannHypothesis` holds if and
only if for every `ε > 0` there are a ratio `λ > 1` and arbitrarily large `Y` such that
`G(y) ≤ y ^ (1/2 + ε)` for every `y ∈ [Y, Y ^ λ]`, where
`G(y) = Σ_{n ≤ y} Λ(n) (y/n - 1) - y log y + (1 + γ) y` is the Riesz remainder of the trivial
character of `ℚ` (RiemannHypothesisStatementsAndConsequences §8.4a (b)). The window condition is
the predicate `HasWindows` of PositivityOfDirichletSeriesWithKernels §6.9 (a), unfolded; the ratio
may depend on `ε`. The implication from the window bounds follows from [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean`
(`Deduction.zeroFree_of_rpow_window`) and `Formalism/GammaFactorNonvanishing/RhOfRight.lean`
(`Formalism.VW.rh_of_right`), with `G` as in
`Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean` (`Deduction.G`). -/
theorem riemannHypothesis_iff_forall_exists_windows :
    RiemannHypothesis ↔
      ∀ ε : ℝ, 0 < ε → ∃ lam : ℝ, 1 < lam ∧ ∀ Y₀ : ℝ, ∃ Y : ℝ, max Y₀ 1 ≤ Y ∧
        ∀ y ∈ Set.Icc Y (Y ^ lam),
          (∑ n ∈ Finset.Iic ⌊y⌋₊, ArithmeticFunction.vonMangoldt n * (y / n - 1)) -
              y * Real.log y + (1 + Real.eulerMascheroniConstant) * y ≤ y ^ (1 / 2 + ε) := by
  sorry

/-! ## Layer 4: cyclic families and the Riemann hypothesis -/

/-- A primitive Dirichlet character bundled with its conductor: a level, a character of that level
and a proof that it is primitive. This is the bundle of RiemannHypothesisStatementsAndConsequences
§10.3, written out with the same fields. -/
structure PrimitiveDirichletCharacter where
  /-- The level, which is the conductor. -/
  level : ℕ+
  /-- The character. -/
  character : DirichletCharacter ℂ level
  /-- The character is primitive. -/
  isPrimitive : character.IsPrimitive

namespace PrimitiveDirichletCharacter

/-- The Riesz remainder `G_χ` of a primitive Dirichlet character
(RiemannHypothesisStatementsAndConsequences §8.4a (b), with its Riesz sum unfolded):
`Σ_{1 ≤ n ≤ y} Λ(n) χ(n) (y/n − 1) + y · L′/L(1, χ)` for `χ ≠ 1`, and
`Σ_{1 ≤ n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y` for the trivial character, the only one of
level `1`. -/
noncomputable def rieszRemainder (χ : PrimitiveDirichletCharacter) (y : ℝ) : ℂ :=
  if χ.level = 1 then
    ∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (ArithmeticFunction.vonMangoldt n : ℂ) * ((y : ℂ) / n - 1)
      - y * Real.log y + (1 + Real.eulerMascheroniConstant) * y
  else
    ∑ n ∈ Finset.Icc 1 ⌊y⌋₊,
        (ArithmeticFunction.vonMangoldt n : ℂ) * χ.character n * ((y : ℂ) / n - 1)
      + y * logDeriv (DirichletCharacter.LFunction χ.character) 1

/-- The cyclic family `𝒦(ψ)` of a primitive Dirichlet character `ψ` of order `o`
(FrobeniusRestrictedRieszSums §0.5): the primitive characters `(ψ^l)*` inducing the powers `ψ^l`,
`0 ≤ l < o`, as a finite set of bundles. -/
noncomputable def cyclicFamily (ψ : PrimitiveDirichletCharacter) :
    Finset PrimitiveDirichletCharacter := by
  classical
  exact (Finset.range (orderOf ψ.character)).image fun l ↦
    { level := ⟨(ψ.character ^ l).conductor,
        Nat.pos_of_ne_zero (DirichletCharacter.conductor_ne_zero _)⟩
      character := (ψ.character ^ l).primitiveCharacter
      isPrimitive := DirichletCharacter.primitiveCharacter_isPrimitive _ }

end PrimitiveDirichletCharacter

/-- **Cyclic families of Dirichlet characters** (4.2). For a primitive Dirichlet character `ψ`, the
following are equivalent: for every `ε > 0` there are positive weights `w(κ)`, `κ ∈ 𝒦(ψ)`, and a
ratio `λ > 1` such that `Σ_{κ ∈ 𝒦(ψ)} w(κ) Re G_κ(y) ≤ y ^ (1/2 + ε)` on windows `[Y, Y ^ λ]` with
`Y` arbitrarily large; and every member `κ` of `𝒦(ψ)` satisfies
`κ.character.GeneralizedRiemannHypothesis` (RiemannHypothesisStatementsAndConsequences §9.4),
unfolded: its L-function has order at most `0` at every `s` with `1/2 < Re s`. The window condition
is the predicate `HasWindows` of PositivityOfDirichletSeriesWithKernels §6.9 (a), unfolded; the
weights and the ratio may depend on `ε`. The left side holds for every `ψ` by
ThetaChainsAndFrobeniusPrimeSums §10.11. -/
theorem forall_exists_windows_cyclicFamily_iff (ψ : PrimitiveDirichletCharacter) :
    (∀ ε : ℝ, 0 < ε → ∃ w : PrimitiveDirichletCharacter → ℝ,
        (∀ κ ∈ ψ.cyclicFamily, 0 < w κ) ∧ ∃ lam : ℝ, 1 < lam ∧ ∀ Y₀ : ℝ, ∃ Y : ℝ,
          max Y₀ 1 ≤ Y ∧ ∀ y ∈ Set.Icc Y (Y ^ lam),
            ∑ κ ∈ ψ.cyclicFamily, w κ * (κ.rieszRemainder y).re ≤ y ^ (1 / 2 + ε)) ↔
      ∀ κ ∈ ψ.cyclicFamily, ∀ s : ℂ, 1 / 2 < s.re →
        meromorphicOrderAt (DirichletCharacter.LFunction κ.character) s ≤ 0 := by
  sorry

/-! ## Layer 5: the headline theorems -/

/-- **The generalized Riemann hypothesis for Dirichlet L-functions** (5.1). For every modulus
`N ≥ 1` and every Dirichlet character `χ` modulo `N`, primitive or not, the L-function of `χ` has
order at most `0` at every `s` with `1/2 < Re s`: it has no zero there, and its only pole, at
`s = 1` for the trivial character, is allowed. This is the predicate
`χ.GeneralizedRiemannHypothesis` of RiemannHypothesisStatementsAndConsequences §9.4, that is
`ZeroFreeRightOf (1/2) χ.LFunction` (§9.2), unfolded. It follows from [FormalProof],
`Supplements/Kernels/MainTheorems.lean` (`allChi`). -/
theorem meromorphicOrderAt_LFunction_nonpos_of_one_half_lt_re {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 / 2 < s.re) :
    meromorphicOrderAt (DirichletCharacter.LFunction χ) s ≤ 0 := by
  sorry

/-- **The Riemann hypothesis** (5.2), in Mathlib's form: every zero of `riemannZeta` other than the
trivial zeros `-2, -4, …` and the point `s = 1` has real part `1/2`. The zeta bridge of
RiemannHypothesisStatementsAndConsequences §9.3 (`riemannHypothesis_iff_zeroFreeRightOf`,
`riemannHypothesis_iff_riemannZeta_ne_zero`) identifies it with the forms below. It is a theorem
of [FormalProof], `Supplements/Kernels/MainTheorems.lean` (`rhOfAll`). -/
theorem riemannHypothesis : RiemannHypothesis := by
  sorry

/-- **Nonvanishing right of the critical line** (5.3). For every Dirichlet character `χ` modulo
`N ≥ 1` and every `s` with `1/2 < Re s`, `χ.LFunction s ≠ 0`, unless `χ` is the trivial character
and `s = 1`, where Mathlib's function has its pole and an assigned value. It is a theorem of
[FormalProof], `Supplements/Kernels/MainTheorems.lean` (`allChi`). -/
theorem LFunction_ne_zero_of_one_half_lt_re {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)
    {s : ℂ} (hs : 1 / 2 < s.re) (hχs : χ ≠ 1 ∨ s ≠ 1) :
    DirichletCharacter.LFunction χ s ≠ 0 := by
  sorry

/-- **Zeros in the critical strip** (5.3). Every zero `s` of the L-function of a Dirichlet character
modulo `N ≥ 1`, primitive or not, with `0 < Re s < 1` has `Re s = 1/2`. The strip is open: the
principal character modulo `2` has zeros on `Re s = 0`. It is a theorem of [FormalProof],
`Supplements/Kernels/MainTheorems.lean` (`claimAll`), and for primitive `χ`
`Supplements/Kernels/MainTheorems.lean` (`critAll`). -/
theorem re_eq_half_of_LFunction_eq_zero {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) {s : ℂ}
    (hs₀ : 0 < s.re) (hs₁ : s.re < 1) (hs : DirichletCharacter.LFunction χ s = 0) :
    s.re = 1 / 2 := by
  sorry

/-- **The Riemann zeta function right of the critical line** (5.3). `riemannZeta s ≠ 0` for every
`s` with `1/2 < Re s`, the point `s = 1` included, where Mathlib's value is
`(γ - log (4π)) / 2`. It follows from [FormalProof], `Supplements/Kernels/MainTheorems.lean`
(`allChi`). -/
theorem riemannZeta_ne_zero_of_one_half_lt_re {s : ℂ} (hs : 1 / 2 < s.re) :
    riemannZeta s ≠ 0 := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.GeneralizedRiemannHypothesisFromWindowBounds
