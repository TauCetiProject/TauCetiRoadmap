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
import TauCeti.Analysis.Semigroups.Generator.Closed
import TauCeti.Analysis.Semigroups.Generator.Uniqueness
import TauCeti.Analysis.Semigroups.GrowthBound

/-!
# Targets — one-parameter semigroups, completely monotone functions, BCR Bochner

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

This roadmap predates the `Suggested.lean` convention — it landed 2026-06-20, and the first target
files appeared 2026-07-05 — and was implemented without it. The file is therefore written after the
fact: each milestone is either **discharged**, closed by the Tau Ceti declaration that realizes it,
or left with an honest `sorry`.

Nothing here records a status by hand. The remaining `sorry` count is the remaining work, and the
compiler keeps it honest. Where a milestone is still open, its docstring names what already exists
and what is missing — the part a reader cannot recover from the signature alone.
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
  TauCeti.Semigroups.hilleYosida_generation hM hdense hres hpow

/-- **Milestone — Lumer–Phillips theorem.** A densely-defined dissipative operator satisfying a
range condition generates a contraction semigroup. Kept distinct from Hille–Yosida: a different
hypothesis set, reached through the same Yosida approximation.

**Open in the generation direction.** The converse is proved: the generator of a contraction
semigroup is dissipative (`TauCeti.Semigroups.real_inner_generator_nonpos` on a Hilbert space,
and in general via `smul_sub_generator_surjective`/`_injective`). What is missing is this
direction, dissipativity plus the range condition producing the semigroup. -/
theorem lumerPhillips (A : X →ₗ.[ℝ] X)
    (_hdense : Dense (A.domain : Set X)) (_hdiss : IsDissipative A)
    (_hrange : ∃ l : ℝ, 0 < l ∧ Function.Surjective fun x : A.domain => l • (x : X) - A x) :
    ∃ S : ContractionSemigroup X, S.toStronglyContinuousSemigroup.generator = A := sorry

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

**Proved.** Stated here against the subtraction kernel, which is the form available at the Tau
Ceti revision this repository pins. A later revision (#3594) restates it through the
`IsPositiveDefiniteSub` predicate, reading exactly as the README sketched; switching to that form
needs a pin bump and is left to a follow-up. -/
theorem bochner (F : V → ℂ) :
    (Continuous F ∧ Matrix.PosSemidef fun a b : V => F (a - b)) ↔
      ∃! μ : Measure V, IsFiniteMeasure μ ∧ ∀ v, F v = ∫ q, TauCeti.fourierAtom v q ∂μ :=
  TauCeti.bochner F

/-- **Milestone 2 — BCR semigroup–Bochner** (Berg–Christensen–Ressel 4.1.13). A bounded
continuous positive-definite function on the semigroup `ℝ≥0 × V` is the Laplace–Fourier transform
of a unique finite measure. Time lives in `ℝ≥0`, so the representing measure has the right support
automatically.

**Uniqueness proved, existence open.** Tau Ceti has the predicate
(`TauCeti.IsSemigroupGroupPD`), the transform (`TauCeti.RepresentsLaplaceFourier`) and the
uniqueness half (`TauCeti.Measure.ext_of_forall_laplaceFourierTransform_eq`); what remains is the
extraction of a representing measure.

A proved instance exists outside Tau Ceti, for the special case `V = (Fin d → ℝ)` with time in
`ℝ` plus a support side-condition, in `mrdouglasny/hille-yosida`
(`HilleYosida.SemigroupGroupExtension.semigroupGroupBochner`). Porting it is a restatement rather
than a copy: indexing time by `ℝ≥0` makes the support condition automatic, and `V` here is an
arbitrary finite-dimensional real inner-product space. -/
theorem bcr_semigroup_bochner [StarAddMonoid V] (F : ℝ≥0 × V → ℂ)
    (_hcont : Continuous F) (_hpd : TauCeti.IsSemigroupGroupPD F) :
    ∃! μ : Measure (ℝ≥0 × V), TauCeti.RepresentsLaplaceFourier μ F := sorry

end PartC

end TauCetiRoadmap.OneParameterSemigroups
