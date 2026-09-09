/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Bochner.BochnerTheorem
import TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder
import TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.Uniqueness
import TauCeti.Analysis.Semigroups.CauchyProblem
import TauCeti.Analysis.Semigroups.Dissipative.Basic
import TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation
import TauCeti.Analysis.Semigroups.Generation.LumerPhillips
import TauCeti.Analysis.Semigroups.Generator.Closed
import TauCeti.Analysis.Semigroups.GrowthBound

/-!
# Targets — one-parameter semigroups, completely monotone functions, BCR Bochner

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Each milestone below is either closed by the Tau Ceti declaration that realizes it, or left with
an honest `sorry`. A `sorry` here marks a milestone this file does not close; it is not an
inventory of what the roadmap still wants, since the file is not exhaustive. Where a milestone is
open, its docstring names what already exists and what is missing.
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

/-- **Milestone — abstract Cauchy problem.** `u t = S t x` solves `u' = A u`, `u 0 = x`:
classically for `x` in the generator's domain, and mildly for every `x`. -/
example (S : StronglyContinuousSemigroup X) (x : S.domain) :
    IsClassicalSolution S.generator (x : X) (fun t => S.realOperator t x) :=
  S.isClassicalSolution_realOperator x

example (S : StronglyContinuousSemigroup X) (x : X) :
    IsMildSolution S.generator x (fun t => S.realOperator t x) :=
  S.isMildSolution_realOperator x

/-- **Milestone — Hille–Yosida generation theorem.** A densely-defined operator whose resolvent
set contains `(ω,∞)` and whose resolvent powers satisfy `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` generates a C₀
semigroup of growth `(ω, M)`.

Engel–Nagel II.3.5–3.8; Pazy Ch. 1. -/
theorem hilleYosida_generation {A : X →ₗ.[ℝ] X} {M omega : ℝ} (hM : 1 ≤ M)
    (hres : ∀ lambda : ℝ, omega < lambda → lambda ∈ LinearPMap.resolventSet A)
    (hpow : ∀ n : ℕ, 1 ≤ n → ∀ lambda : ℝ, omega < lambda →
      ‖LinearPMap.resolvent A lambda ^ n‖ ≤ M / (lambda - omega) ^ n)
    (hdense : Dense (A.domain : Set X)) :
    ∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.HasGrowthBound omega M :=
  TauCeti.Semigroups.hilleYosida_generation hM hdense hres hpow

/-- **Milestone — Lumer–Phillips theorem.** A densely-defined dissipative operator satisfying a
range condition generates a contraction semigroup. Kept distinct from Hille–Yosida: a different
hypothesis set, reached through the same Yosida approximation.

The hypothesis pair here is `IsMDissipative` unfolded. -/
theorem lumerPhillips (A : X →ₗ.[ℝ] X)
    (hdense : Dense (A.domain : Set X)) (hdiss : IsDissipative A)
    (hrange : ∃ l : ℝ, 0 < l ∧ Function.Surjective fun x : A.domain => l • (x : X) - A x) :
    ∃ S : ContractionSemigroup X, S.toStronglyContinuousSemigroup.generator = A :=
  IsMDissipative.exists_contractionSemigroup_generator_eq ⟨hdiss, hrange⟩ hdense

end PartA

/-! ## Part B — completely monotone and Bernstein functions -/

/-- **Milestone — Bernstein's theorem**, in the Hausdorff–Bernstein–Widder form: a function is
continuous on `[0,∞)` and completely monotone on `(0,∞)` if and only if it is the Laplace
transform of a unique finite measure on `ℝ≥0`. -/
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

Stated against the subtraction kernel, the form available at the Tau Ceti revision this
repository pins. -/
theorem bochner (F : V → ℂ) :
    (Continuous F ∧ Matrix.PosSemidef fun a b : V => F (a - b)) ↔
      ∃! μ : Measure V, IsFiniteMeasure μ ∧ ∀ v, F v = ∫ q, TauCeti.fourierAtom v q ∂μ :=
  TauCeti.bochner F

/-- **Milestone 2 — BCR semigroup–Bochner** (Berg–Christensen–Ressel 4.1.13). A bounded
continuous positive-definite function on the semigroup `ℝ≥0 × V` is the Laplace–Fourier transform
of a unique finite measure. Time lives in `ℝ≥0`, so the representing measure has the right support
automatically.

Tau Ceti has the predicate (`TauCeti.IsSemigroupGroupPD`), the transform
(`TauCeti.RepresentsLaplaceFourier`) and the uniqueness half
(`TauCeti.Measure.ext_of_forall_laplaceFourierTransform_eq`); what remains is the extraction of a
representing measure.

Boundedness is not decorative. `TauCeti.RepresentsLaplaceFourier.norm_le_mass` forces
`‖F x‖ ≤ μ.real Set.univ`, so an unbounded positive-definite `F` has no representing measure at
all: `F (t, v) = (Real.exp t : ℂ)` is continuous, satisfies `IsSemigroupGroupPD` (its kernel is
the rank-one `exp tₚ * exp t_q`), and would make the conclusion below false.

A proved instance exists outside Tau Ceti, for the special case `V = (Fin d → ℝ)` with time in
`ℝ` plus a support side-condition, in `mrdouglasny/hille-yosida`
(`HilleYosida.SemigroupGroupExtension.semigroupGroupBochner`). Porting it is a restatement rather
than a copy: indexing time by `ℝ≥0` makes the support condition automatic, and `V` here is an
arbitrary finite-dimensional real inner-product space. -/
theorem bcr_semigroup_bochner (F : ℝ≥0 × V → ℂ)
    (_hcont : Continuous F) (_hpd : TauCeti.IsSemigroupGroupPD F)
    (_hbdd : Bornology.IsBounded (Set.range F)) :
    ∃! μ : Measure (ℝ≥0 × V), TauCeti.RepresentsLaplaceFourier μ F := sorry

end PartC

end TauCetiRoadmap.OneParameterSemigroups
