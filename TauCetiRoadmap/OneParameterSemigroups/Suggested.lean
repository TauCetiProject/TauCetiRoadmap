/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Bochner.BochnerTheorem
import TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder
import TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.Uniqueness
import TauCeti.Analysis.Semigroups.BoundedGenerator.Basic
import TauCeti.Analysis.Semigroups.CauchyProblem.Basic
import TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness
import TauCeti.Analysis.Semigroups.Dissipative.Basic
import TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation
import TauCeti.Analysis.Semigroups.Generation.LumerPhillips
import TauCeti.Analysis.Semigroups.Generator.Closed
import TauCeti.Analysis.Semigroups.Generator.Uniqueness
import TauCeti.Analysis.Semigroups.GrowthBound
import TauCeti.Analysis.Semigroups.Resolvent.Complexification
import TauCeti.Analysis.Semigroups.Resolvent.Complex
import TauCeti.Analysis.CompletelyMonotone.Bernstein.LevyKhintchine.Uniqueness
import TauCeti.Analysis.CompletelyMonotone.Stieltjes.Reciprocal
import TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness
import TauCeti.Analysis.Bochner.LocallyCompactGroup
import TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.Existence

/-!
# Targets — one-parameter semigroups, completely monotone functions, BCR Bochner

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

The examples consume native definitions and representation theorems directly. In particular,
complexification retains the exact growth constants, and the countability-free Bochner target
retains inner regularity of the representing measure.
-/

namespace TauCetiRoadmap.OneParameterSemigroups

open MeasureTheory TauCeti TauCeti.Semigroups
open scoped NNReal ComplexOrder

/-! ## Part A — strongly continuous semigroups -/

section PartA
variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

/-- The C₀ semigroup object, with its contraction subclass and growth bound. -/
example : Type _ := StronglyContinuousSemigroup X
example : Type _ := ContractionSemigroup X
example (S : StronglyContinuousSemigroup X) (omega M : ℝ) : Prop :=
  S.HasGrowthBound omega M

/-- **The generator is closed.** -/
example (S : StronglyContinuousSemigroup X) : S.generator.IsClosed :=
  S.isClosed_generator

/-- **Dissipativity**, the general Banach notion. -/
example (A : X →ₗ.[ℝ] X) : Prop := IsDissipative A

/-- **Abstract Cauchy problem**: classical and mild solutions of `u' = A u`, `u 0 = x`. -/
example (A : X →ₗ.[ℝ] X) (x : X) (u : ℝ → X) : Prop := IsClassicalSolution A x u
example (A : X →ₗ.[ℝ] X) (x : X) (u : ℝ → X) : Prop := IsMildSolution A x u

/-- **Milestone — Hille–Yosida generation theorem.** A densely-defined operator whose resolvent
set contains `(ω,∞)` and whose resolvent powers satisfy `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` generates a C₀
semigroup of growth `(ω, M)`.

**Proved.** Engel–Nagel II.3.5–3.8; Pazy Ch. 1. -/
theorem hilleYosida_generation {A : X →ₗ.[ℝ] X} {M omega : ℝ} (hM : 1 ≤ M)
    (hres : ∀ lambda : ℝ, omega < lambda → lambda ∈ LinearPMap.resolventSet A)
    (hpow : ∀ n : ℕ, 1 ≤ n → ∀ lambda : ℝ, omega < lambda →
      ‖LinearPMap.resolvent A lambda ^ n‖ ≤ M / (lambda - omega) ^ n)
    (hdense : Dense (A.domain : Set X)) :
    ∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.HasGrowthBound omega M :=
  TauCeti.Semigroups.hilleYosida_generation hM hres hpow hdense

/-- **Milestone — Lumer–Phillips theorem.** A densely-defined dissipative operator satisfying a
range condition generates a contraction semigroup. Kept distinct from Hille–Yosida: a different
hypothesis set, reached through the same Yosida approximation.

**Discharged.** Tau Ceti states it as an equivalence, with the dissipativity and range
conditions packaged as `IsMDissipative`; that predicate unfolds to exactly the two hypotheses
below, so the milestone is the `mpr` direction. -/
theorem lumerPhillips (A : X →ₗ.[ℝ] X)
    (hdense : Dense (A.domain : Set X)) (hdiss : IsDissipative A)
    (hrange : ∃ l : ℝ, 0 < l ∧ Function.Surjective fun x : A.domain => l • (x : X) - A x) :
    ∃ S : ContractionSemigroup X, S.toStronglyContinuousSemigroup.generator = A :=
  (TauCeti.Semigroups.exists_contractionSemigroup_generator_eq_iff A).mpr ⟨hdense, hdiss, hrange⟩

/-- **The generator determines the semigroup uniquely** (Engel–Nagel II.1.4). The README bolds
this as the first thing the Part A API must supply; it is also what makes the Cauchy-problem
milestone below a statement about *the* solution.

**Discharged.** -/
theorem eq_of_generator_eq {S T : StronglyContinuousSemigroup X}
    (hgen : S.generator = T.generator) : S = T :=
  StronglyContinuousSemigroup.eq_of_generator_eq hgen

/-- **Acceptance example — `e^{tA}` for a bounded generator.** The README asks for this and the
multiplication semigroup as the concrete tests that keep Part A honest.

**Discharged.** -/
noncomputable example (A : X →L[ℝ] X) : StronglyContinuousSemigroup X :=
  StronglyContinuousSemigroup.ofBounded A

/-- **Milestone — abstract Cauchy problem, classical half.** For `x ∈ D(A)` the orbit
`u t = S t x` solves `u' = A u`, `u 0 = x` classically.

**Discharged.** The roadmap calls this the motivating payoff and states it as a milestone in its
own right even though it follows from generator uniqueness. Tau Ceti proves it for the orbit of a
generator-domain vector; `realOperator` is the `ℝ`-indexed action of the `ℝ≥0`-indexed
semigroup. -/
theorem cauchyProblem_classical (S : StronglyContinuousSemigroup X) (x : S.domain) :
    IsClassicalSolution S.generator (x : X) (fun t => S.realOperator t x) :=
  S.isClassicalSolution_realOperator x

/-- **Milestone — abstract Cauchy problem, mild half.** For arbitrary `x` the orbit is a mild
solution, in the integrated form.

**Discharged.** -/
theorem cauchyProblem_mild (S : StronglyContinuousSemigroup X) (x : X) :
    IsMildSolution S.generator x (fun t => S.realOperator t x) :=
  S.isMildSolution_realOperator x

end PartA

/-! ## Part B — completely monotone and Bernstein functions -/

/-- **Milestone — Bernstein's theorem**, in the Hausdorff–Bernstein–Widder form: a function is
continuous on `[0,∞)` and completely monotone on `(0,∞)` if and only if it is the Laplace
transform of a unique finite measure on `ℝ≥0`.

**Proved.** -/
theorem bernstein (f : ℝ → ℝ) :
    TauCeti.IsContinuousCompletelyMonotoneOnIoi f ↔
      ∃! μ : Measure ℝ≥0, TauCeti.RepresentsLaplace μ f :=
  TauCeti.hausdorff_bernstein_widder_existsUnique f

/-! ## Part C — positive-definite functions, Bochner, and BCR -/

section PartC
variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
  [MeasurableSpace V] [BorelSpace V]

/-- **Milestone 1 — Bochner's theorem on `V`.** A function on a finite-dimensional real
inner-product space is continuous with positive-definite subtraction kernel if and only if it is
the Fourier transform of a unique finite Borel measure.

`TauCeti.IsPositiveDefiniteSub` is the group form of positive definiteness,
`∑ᵢⱼ cᵢ · conj(cⱼ) · F(vᵢ - vⱼ) ≥ 0` over every finite family, which on a real inner-product
space is the involution form of the README for `a⋆ = -a`. -/
theorem bochner (F : V → ℂ) :
    (Continuous F ∧ TauCeti.IsPositiveDefiniteSub F) ↔
      ∃! μ : Measure V, IsFiniteMeasure μ ∧ ∀ v, F v = ∫ q, TauCeti.fourierAtom v q ∂μ :=
  TauCeti.bochner F

/-- **Milestone 2 — BCR semigroup–Bochner** (Berg–Christensen–Ressel 4.1.13). A bounded
continuous positive-definite function on the semigroup `ℝ≥0 × V` is the Laplace–Fourier transform
of a unique finite measure. Time lives in `ℝ≥0`, so the representing measure has the right support
automatically.

**Boundedness is required.** `TauCeti.IsSemigroupGroupPD` is the bare
quadratic-form condition, so without a bound the statement is false: `F (t, v) = exp t` is
continuous and positive definite, being a character — the quadratic form is `‖∑ cᵢ exp tᵢ‖ ^ 2` —
yet no finite measure represents it, since a representing `μ` forces `‖F‖ ≤ μ univ`.

**No `StarAddMonoid V` either.** The involution `(t, v) ↦ (t, -v)` lives on Tau Ceti's own
`BCRPoint V` wrapper, precisely so that no global negation instance is installed on every additive
group -- which, as that module says, "would conflict with Mathlib's ordinary star conventions".
`TauCeti.IsSemigroupGroupPD` therefore asks only for `AddCommGroup V`.

A proved instance also exists outside Tau Ceti, for the special case `V = (Fin d → ℝ)` with time
in `ℝ` plus a support side-condition, in `mrdouglasny/hille-yosida`
(`HilleYosida.SemigroupGroupExtension.semigroupGroupBochner`), which carries the same boundedness
hypothesis. Porting it is a restatement rather than a copy: indexing time by `ℝ≥0` makes the
support condition automatic, and `V` here is an arbitrary finite-dimensional real inner-product
space. -/
theorem bcr_semigroup_bochner (F : ℝ≥0 × V → ℂ)
    (_hcont : Continuous F) (_hbdd : Bornology.IsBounded (Set.range F))
    (_hpd : TauCeti.IsSemigroupGroupPD F) :
    ∃! μ : Measure (ℝ≥0 × V), TauCeti.RepresentsLaplaceFourier μ F :=
  (TauCeti.bcr_semigroup_bochner F).mp ⟨_hpd, _hcont, _hbdd⟩

end PartC


/-! ## Native interfaces for the full complex and representation scope -/

section Complexification
variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

/-- Complexification preserves the exact growth constants. -/
example (S : StronglyContinuousSemigroup X) (omega M : ℝ) :
    S.complexify.HasGrowthBound omega M ↔ S.HasGrowthBound omega M :=
  S.hasGrowthBound_complexify_iff omega M

/-- The real-axis resolvent is the complexification of the real resolvent. -/
example (S : StronglyContinuousSemigroup X) {l : ℝ}
    (hl : l ∈ TauCeti.LinearPMap.resolventSet S.generator) :
    TauCeti.LinearPMap.resolvent
      (S.complexify.complexGenerator S.isComplexLinear_complexify) (l : ℂ) =
        (TauCeti.LinearPMap.resolvent S.generator l).complexify :=
  S.resolvent_complexify_complexGenerator_ofReal hl
end Complexification

/-- The Bernstein representation uses a normalized Lévy measure and a unique triplet. -/
example {f : ℝ → ℝ} (hf : TauCeti.IsBernsteinFunction f) :
    ∃! p : ℝ × ℝ × Measure ℝ≥0,
      0 ≤ p.1 ∧ 0 ≤ p.2.1 ∧ TauCeti.IsBernsteinLevyMeasure p.2.2 ∧
        Set.EqOn f (TauCeti.bernsteinLevyKhintchineExponent p.1 p.2.1 p.2.2) (Set.Ici 0) :=
  hf.existsUnique_eqOn_bernsteinLevyKhintchineExponent

/-- The reciprocal correspondence requires an extension across the origin. -/
example {f : ℝ → ℝ} :
    TauCeti.IsStieltjesFunction f ↔
      ∃ g : ℝ → ℝ, TauCeti.IsCompleteBernsteinFunction g ∧
        Set.EqOn g (fun t => (f t)⁻¹) (Set.Ioi 0) :=
  TauCeti.isStieltjesFunction_iff_exists_isCompleteBernsteinFunction_eqOn_inv

/-- Countability-free Bochner representation retains inner regularity explicitly. -/
example {G : Type*} [AddCommGroup G] [TopologicalSpace G] [IsTopologicalAddGroup G]
    [LocallyCompactSpace G] [T2Space G]
    [MeasurableSpace (PontryaginDual (Multiplicative G))]
    [BorelSpace (PontryaginDual (Multiplicative G))] (f : G → ℂ) :
    (Continuous f ∧ TauCeti.IsPositiveDefiniteSub f) ↔
      ∃! μ : FiniteMeasure (PontryaginDual (Multiplicative G)),
        μ.toMeasure.InnerRegular ∧ μ.pontryaginMeasureTransform = f :=
  TauCeti.continuous_and_isPositiveDefiniteSub_iff_existsUnique_innerRegular_pontryaginMeasureTransform_eq f

end TauCetiRoadmap.OneParameterSemigroups
