import Mathlib

/-!
# Theta chains and Frobenius prime sums: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the
definitions those statements need.

* The windowed bound for the cyclic family of a primitive Dirichlet character (10.10, 10.11):
  stated, for every primitive Dirichlet character `ψ`, with the bundle
  `PrimitiveDirichletCharacter`, the Riesz remainder `PrimitiveDirichletCharacter.rieszRemainder`
  (RiemannHypothesisStatementsAndConsequences §8.4a (b)), the cyclic family
  `PrimitiveDirichletCharacter.cyclicFamily` (FrobeniusRestrictedRieszSums §0.5), the weights
  `PrimitiveDirichletCharacter.familyWeight` of 10.10 and the predicate `HasWindows`
  (PositivityOfDirichletSeriesWithKernels §6.9 (a)). The uniform form is stated with the exponent
  `e_W = 9`, the weights at `ω₀ = 3/4` and the window exponent `3/2`; the consumer
  form is the statement that GeneralizedRiemannHypothesisFromWindowBounds §§4.2, 5.1 cite.
* The Frobenius-restricted inequality for one translate (10.4, with the budget 10.5): for chain
  data at a scale `(x, ε)` satisfying the standing hypotheses of 10.0, the sum over the tops and
  the steps of the Frobenius-restricted Riesz sums `ℛ(a_τ, τ, w_{u₀,j})` is at most their main
  terms plus `x^{5ε}·(|Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c))`. It lacks chain data (10.0): Hermitian
  lattices over the ring of integers of a number field with their slopes and the heights of maps
  between them (SlopesOfHermitianVectorBundles Layers 1–2), algebraic modular forms on definite
  unitary groups with their integral structures (ThetaChainsOnDefiniteUnitaryGroups Layers 2–3), the
  lattices of forms divided by the local gains, the glued target and the period pairing
  (GluedTargetAndDivisionInequality §§7.13–7.14), and the Bessel–Poincaré series with their Gram
  operators (BesselPoincareSeriesAndGramBounds §§5.14–5.15).
* The slope inequality of the chain (9.6): for a translate, its word code and the family of
  pairings `B_u : N′_u → R^∨` under the frame hypotheses, the mean of `μ(N′_u) − h_u` exceeds
  `μ(R^∨)` by at most the frame defects. It lacks, besides the carriers of the preceding bullet,
  the maximal and minimal slopes of Hermitian lattices (SlopesOfHermitianVectorBundles §§2.1–2.2).

Mathlib has `NumberField.IsCMField` and the matrix unitary group, and Tau Ceti has neither
Hermitian lattices over rings of integers with their degrees and slopes nor algebraic modular
forms on unitary groups; Mathlib's `ZLattice` and `ZLattice.covolume` give the case of Euclidean
lattices only, while every lattice of the chain is a lattice over the ring of integers of a
coefficient field of large degree. The exact identity 10.3 is algebra on real numbers once the
Frobenius-restricted main term is defined, and the parameter statements 10.6a–10.6d are
inequalities between explicit functions of `x`; they are steps of the routes, not headlines, and
are not stated.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaChainsAndFrobeniusPrimeSums

open scoped ArithmeticFunction.vonMangoldt

/-! ## Layer 10: The Frobenius-restricted inequality and the windowed bound -/

/-- A primitive Dirichlet character bundled with its conductor: a level, a character of that level
and a proof that it is primitive.
[FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean` (`Formalism.HC.PChar`). -/
structure PrimitiveDirichletCharacter where
  /-- The level, which is the conductor. -/
  level : ℕ+
  /-- The character. -/
  character : DirichletCharacter ℂ level
  /-- The character is primitive. -/
  isPrimitive : character.IsPrimitive

namespace PrimitiveDirichletCharacter

/-- The Riesz remainder `G_χ` of a primitive Dirichlet character
(RiemannHypothesisStatementsAndConsequences §8.4a (b)):
`∑_{n ≤ y} Λ(n) χ(n) (y/n − 1) + y · L′/L(1, χ)` for `χ ≠ 1`, and
`∑_{n ≤ y} Λ(n) (y/n − 1) − y log y + (1 + γ) y` for the trivial character, of level `1`.
[FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.An.gChi`, `Formalism.HC.An.logDerivativeAtOne`), `Formalism/StatementOC.lean` (`Formalism.Gz`). -/
noncomputable def rieszRemainder (χ : PrimitiveDirichletCharacter) (y : ℝ) : ℂ :=
  if χ.level = 1 then
    ∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (Λ n : ℂ) * ((y : ℂ) / n - 1) - y * Real.log y
      + (1 + Real.eulerMascheroniConstant) * y
  else
    ∑ n ∈ Finset.Icc 1 ⌊y⌋₊, (Λ n : ℂ) * χ.character n * ((y : ℂ) / n - 1)
      + y * logDeriv χ.character.LFunction 1

/-- The cyclic family `𝒦(ψ)` of a primitive Dirichlet character `ψ` of order `o`
(FrobeniusRestrictedRieszSums §0.5): the primitive characters `(ψ^l)*` inducing the powers `ψ^l`,
`0 ≤ l < o`.
[FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean` (`Formalism.HC.Level.ofSub`), `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean` (`Formalism.HC.PChar.of`). -/
noncomputable def cyclicFamily (ψ : PrimitiveDirichletCharacter) :
    Finset PrimitiveDirichletCharacter := by
  classical
  exact (Finset.range (orderOf ψ.character)).image fun l ↦
    { level := ⟨(ψ.character ^ l).conductor,
        Nat.pos_of_ne_zero (DirichletCharacter.conductor_ne_zero _)⟩
      character := (ψ.character ^ l).primitiveCharacter
      isPrimitive := DirichletCharacter.primitiveCharacter_isPrimitive _ }

/-- The weights of the cyclic family: for `ω₀ ∈ (0, 1)` and `ψ` of order `o`,
`w_ψ(1) = 1` and `w_ψ(χ) = (1 − ω₀)/(1 + ω₀(o − 1))` for the members `χ ≠ 1` of `𝒦(ψ)` (a primitive
character is trivial exactly when its level is `1`). The uniform windowed bound (10.10) takes
`ω₀ = 3/4`, where `w_ψ(χ) = 1/(3o + 1)`. -/
noncomputable def familyWeight (ψ : PrimitiveDirichletCharacter) (ω₀ : ℝ)
    (χ : PrimitiveDirichletCharacter) : ℝ :=
  if χ.level = 1 then 1 else (1 - ω₀) / (1 + ω₀ * ((orderOf ψ.character : ℝ) - 1))

end PrimitiveDirichletCharacter

/-- Windows of scales (PositivityOfDirichletSeriesWithKernels §6.9 (a)): for `S ⊆ ℝ` and an
exponent `κ > 1` (written `λ_W` in the README), `HasWindows S κ` says that for every `Y₀` there is
`Y ≥ max(Y₀, 1)` with `[Y, Y^κ] ⊆ S`.
[FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows`). -/
def HasWindows (S : Set ℝ) (κ : ℝ) : Prop :=
  ∀ Y₀ : ℝ, ∃ Y ≥ max Y₀ 1, Set.Icc Y (Y ^ κ) ⊆ S

/-- **The windowed bound for the cyclic family, uniform form** (10.10). Let `ψ` be a primitive
Dirichlet character of order `o`. There is `ε₁ > 0` such that for every `ε ∈ (0, ε₁)` the set of `y`
with `Σ_{χ ∈ 𝒦(ψ)} w_ψ(χ)·Re G_χ(y) ≤ y^{1/2 + 9ε}` has windows of exponent `3/2`; the weights are
those of `PrimitiveDirichletCharacter.familyWeight` at `ω₀ = 3/4`: `1` at the trivial character and
`1/(3o + 1)` at the other members. -/
theorem cyclicWindowedBound (ψ : PrimitiveDirichletCharacter) :
    ∃ ε₁ > (0 : ℝ), ∀ ε ∈ Set.Ioo (0 : ℝ) ε₁,
      HasWindows {y : ℝ | ∑ χ ∈ ψ.cyclicFamily, ψ.familyWeight (3 / 4) χ * (χ.rieszRemainder y).re
        ≤ y ^ ((1 : ℝ) / 2 + 9 * ε)} (3 / 2) := by
  sorry

/-- **The windowed bound for the cyclic family, consumer form** (10.11). For every primitive
Dirichlet character `ψ` and every `ε > 0` there are positive reals `w(χ)`, `χ ∈ 𝒦(ψ)`, and `κ > 1`
such that the set of `y` with `Σ_{χ ∈ 𝒦(ψ)} w(χ)·Re G_χ(y) ≤ y^{1/2 + ε}` has windows of
exponent `κ`.
Follows from [FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows.mono`). -/
theorem cyclicWindowedBound_forEveryEpsilon (ψ : PrimitiveDirichletCharacter) {ε : ℝ}
    (hε : 0 < ε) :
    ∃ w : PrimitiveDirichletCharacter → ℝ, (∀ χ ∈ ψ.cyclicFamily, 0 < w χ) ∧ ∃ κ > (1 : ℝ),
      HasWindows {y : ℝ | ∑ χ ∈ ψ.cyclicFamily, w χ * (χ.rieszRemainder y).re
        ≤ y ^ ((1 : ℝ) / 2 + ε)} κ := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.ThetaChainsAndFrobeniusPrimeSums
