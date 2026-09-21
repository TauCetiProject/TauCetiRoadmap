import Mathlib
import TauCetiRoadmap.ArithmeticDirichletSeries.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.LFunctions.Suggested
import TauCetiRoadmap.Chebotarev.Suggested
import Completed.ContourIntegration.Suggested

/-!
# Zeros of L-functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Mathlib has Jensen's formula, the divisor of a meromorphic function, Phragmén–Lindelöf on a
vertical strip, branches of the logarithm on simply connected sets, and the discreteness of
`riemannZetaZeros`. It has no growth theory for the Gamma function on a vertical strip, no
order of an entire function, no Hadamard factorization, no zero counting, no zero-free region,
and no way to say that a list of zeros is complete. We build that in `TauCeti/`.

The file states representative targets from **Layer 0** (order, the entire completion, and
vertical-strip growth), **Layer 1** (Stirling, the branch of `log Γ`, and the continued
uncompleted L-function), **Layer 2** (the three conductors), **Layer 3** (the pole-cleared
convexity route), **Layer 4** (the two counts through `MeromorphicOn.divisor`), **Layer 6**
(the zero-free region, with Layer 6.4 decomposed), **Layer 7** (the rectangle contour and
Riemann–von Mangoldt), **Layer 8** (the effective ray-class count and its abelian Chebotarev
transport), and **Layer 9** (certificates and `GRH`), stated with `sorry` against the pinned
suppliers. `LFunctions` supplies the analytic cards and completed functions;
`GlobalNumberFields` supplies the modulus, the ray class group, and the class of an ideal;
`ArithmeticDirichletSeries` supplies Abel summation, Perron's formula, and
Wiener--Ikehara; `Chebotarev` supplies the exact Frobenius prime carriers and qualitative
counts; and `ContourIntegration` supplies the general residue calculus. The declarations
below specialize those interfaces to zero analysis and effective estimates. They do not
redeclare generic summation, prime-counting, or Frobenius infrastructure.

⚠ There is no Artin card here and none is assumed. The two families are Dedekind zeta
functions and L-functions of finite-order ray-class characters, and every effective estimate
below is stated for one of them: `rayClassPsi_effective` unconditionally, and the three
`frobenius*_effective` theorems for an **abelian** extension under a reciprocity hypothesis
that `ClassFieldTheory` discharges. A nonabelian conjugacy class needs an Artin L-function of
degree above one, which no supplier constructs, and is out of scope.

⚠ Four conventions carry most of the weight, and all four are in the README's conventions
table.

1. Zeros and poles are read off `meromorphicOrderAt` and never off the value `f z`, which at a
   pole is a junk value (`Complex.Gamma` and `Gammaℝ` are assigned `0` at theirs).
2. And conversely: `meromorphicOrderAt f z = 0` is a punctured-germ condition and constrains
   no value, no derivative, and no continuity at `z`. It is the right hypothesis for a *count*
   and the wrong one for anything evaluated pointwise; see
   `meromorphicOrderAt_zero_not_pointwise`.
3. The signed `divisorCount`, which the argument principle computes, is a different object
   from the natural-valued `zeroCount`, which certificates and `N(T)` use; they agree only on
   regions with no poles.
4. `Rect.Valid` carries the sets and the counts; `Rect.Nondegenerate` carries every geometric
   statement, because the supplier's curve regularity forbids a constant edge.
5. `∑ᶠ` is reserved for counts over a region on which finiteness is a hypothesis; a sum over
   **all** zeros of an L-function is `∑'` with a `Summable` companion, because a finsum over an
   infinite support is the junk value `0` whatever the summability of the family.
-/

namespace TauCetiRoadmap.ZerosOfLFunctions

open Complex Filter Topology Asymptotics Bornology MeromorphicOn

/-! ## Layer 0: growth predicates and the entire completion -/

/-- **Layer 0, order at most `A`** for an entire function: `f` is dominated by
`exp (‖s‖ ^ A')` for every `A' > A`. Entirety is *not* part of the predicate, so that it
composes; every theorem calling this the order of an entire function carries
`Differentiable ℂ f` as a hypothesis. The roadmap defines no numeric order and no type. -/
def OrderLE (f : ℂ → ℂ) (A : ℝ) : Prop :=
  ∀ A' : ℝ, A < A' → f =O[cobounded ℂ] fun s ↦ Real.exp (‖s‖ ^ A')

/-- **Layer 0, growth in vertical strips**: polynomial growth in `|Im s|`, uniformly on each
closed vertical strip and above an existentially quantified height. This is the hypothesis
every counting and convexity statement wants; Layer 0's main theorem derives it from finite
order plus the functional equation. The constants are constrained (`0 < C`, `0 ≤ A`) so that
the predicate cannot be satisfied vacuously, and the strip is nondegenerate.
⚠ The height threshold `T₀` is quantified, not fixed at `1`. The data record permits an
arbitrary finite polar divisor, so a record may have poles off the real axis: the shifted
product `s ↦ completedRiemannZeta (s - T * I) * completedRiemannZeta (s + T * I)` satisfies
the model's predicates and has poles at `1 ± iT`, and no bound on a strip through them can
hold. With a fixed `1 ≤ |Im s|` this predicate would be false for that record. -/
def HasVerticalStripGrowth (f : ℂ → ℂ) : Prop :=
  ∀ σ₁ σ₂ : ℝ, σ₁ < σ₂ → ∃ C A T₀ : ℝ, 0 < C ∧ 0 ≤ A ∧ 0 ≤ T₀ ∧
    ∀ s : ℂ, σ₁ ≤ s.re → s.re ≤ σ₂ → T₀ ≤ |s.im| → ‖f s‖ ≤ C * (1 + |s.im|) ^ A

/-- **Layer 0.2, generic entire completion.** This is the removable extension of the
supplier's completed function after clearing exactly the finite polar divisor recorded by the
analytic card. It is not the pointwise product at a pole. -/
noncomputable def entireCompletion (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) : ℂ → ℂ := sorry

theorem differentiable_entireCompletion (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) : Differentiable ℂ (entireCompletion d hc) := sorry

/-- Away from the supplier-owned polar support, the removable extension agrees with the
completed function times the exact clearing polynomial. -/
theorem entireCompletion_eq (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) {s : ℂ} (hs : d.polarOrder s = 0) :
    entireCompletion d hc s =
      (d.polarOrder.support.prod fun p => (s - p) ^ d.polarOrder p) * d.completed s := sorry

/-- **Layer 0, the completed zeta function grows polynomially in vertical strips.** The pin
proves neither this nor the finite order it follows from. Stated for the meromorphic `Λ`
itself: the hypothesis `1 ≤ |s.im|` keeps the poles at `0` and `1` out of range. -/
example : HasVerticalStripGrowth completedRiemannZeta := sorry

/-- **Layer 0.2, the entire completion of `ζ`, by removable extension.** ⚠ The multiplicative
clearing is *not* the pointwise product: `completedRiemannZeta` is a total representative with
a junk value at its poles, so `fun s ↦ s * (s - 1) * completedRiemannZeta s` takes the value
`0` at `s = 0` and `s = 1` — fake zeros exactly where the clearing polynomial is meant to
remove poles. The milestone is the entire *extension* across the polar support, its agreement
off the poles, and the nonvanishing at them that says the polar orders were exact. ⚠ Mathlib's
`completedRiemannZeta₀` is a different function: it clears the poles additively
(`completedRiemannZeta s = completedRiemannZeta₀ s - 1/s - 1/(1 - s)`), so it is entire but its
zeros are not those of `completedRiemannZeta`, and no counting statement may use it. -/
example :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧
      (∀ s : ℂ, s ≠ 0 → s ≠ 1 → g s = s * (s - 1) * completedRiemannZeta s) ∧
      g 0 ≠ 0 ∧ g 1 ≠ 0 ∧ OrderLE g 1 := sorry

/-! ## Layer 1: Stirling asymptotics, and the continued L-function -/

/-- **Layer 1.6, inverse gamma factor by meromorphic continuation.** At a gamma pole this is
the analytic continuation of the reciprocal, not pointwise division by Mathlib's total
representative. -/
noncomputable def invGammaFactor
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData) : ℂ → ℂ := sorry

/-- **Layer 1.6, the continued uncompleted L-function.** This is regularized across the gamma
poles and agrees with the original Dirichlet series on `Re s > 1`. -/
noncomputable def continuedL (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) : ℂ → ℂ := sorry

theorem completed_eq_gammaFactor_mul_continuedL
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) {s : ℂ} (hs : d.gammaFactor s ≠ 0) :
    d.completed s = ((d.conductor : ℕ) : ℂ) ^ (s / 2) * d.gammaFactor s *
      continuedL d hc s := sorry

/-- **Layer 1.6, the pointwise functional equation for the continued L-function.** ⚠ Four
hypotheses, and none is decoration. The two gamma hypotheses keep the trivial zeros out (the
`s = 3` witness in the ζ example below). The two **polar** hypotheses are the supplier's own
conditions in `HasFunctionalEquation.eq_away`, and dropping them makes the statement false:
nonvanishing of the gamma factors does not put `s` away from the completed poles, and dividing by
a nonzero gamma value does not remove an assigned value there. Countermodel, `shiftedPoleData`
below: a degree-`0` card with `F s = 1 / ((s - 2) * (s + 1))` off its two poles and the assigned
values `F 2 = 1`, `F (-1) = 0`. Its gamma factor is identically `1`, so both gamma hypotheses
hold everywhere; the removable set of Layer 1.6 is empty, so `continuedL` is the raw product and
takes the assigned values; and at `s = 2` the left side is `continuedL d.dual (-1) =
conj (F (-1)) = 0` while the right side is `continuedL d 2 = F 2 = 1`. The germ-level form,
`continuedL_functionalEquation_eventuallyEq`, needs neither polar hypothesis. -/
theorem continuedL_functionalEquation
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) (hfe : d.HasFunctionalEquation) {s : ℂ}
    (hp : d.polarOrder s = 0)
    (hp' : d.polarOrder (TauCetiRoadmap.LFunctions.AnalyticLFunctionData.reflectedPoint s) = 0)
    (hs : d.gammaFactor s ≠ 0) (hs' : d.dual.gammaFactor (1 - s) ≠ 0) :
    ((d.dual.conductor : ℕ) : ℂ) ^ ((1 - s) / 2) * d.dual.gammaFactor (1 - s) *
        continuedL d.dual
          (TauCetiRoadmap.LFunctions.AnalyticLFunctionData.dual_hasMeromorphicContinuation hc)
          (1 - s) =
      d.rootNumber⁻¹ * (((d.conductor : ℕ) : ℂ) ^ (s / 2) * d.gammaFactor s *
        continuedL d hc s) := sorry

/-- **Layer 1.6, the functional equation as an equality of germs**, the form that carries no
polar and no gamma hypothesis: the polar support is finite and the gamma poles are discrete, so
on a punctured neighbourhood of any `s` every factor is regular and the pointwise form applies.
This is the supplier's `hasFunctionalEquation_eventuallyEq` read through the completion identity,
and it is the statement Layers 5 and 7 consume. -/
theorem continuedL_functionalEquation_eventuallyEq
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) (hfe : d.HasFunctionalEquation) (s : ℂ) :
    (fun z : ℂ => ((d.dual.conductor : ℕ) : ℂ) ^ ((1 - z) / 2) * d.dual.gammaFactor (1 - z) *
        continuedL d.dual
          (TauCetiRoadmap.LFunctions.AnalyticLFunctionData.dual_hasMeromorphicContinuation hc)
          (1 - z)) =ᶠ[𝓝[≠] s]
      (fun z : ℂ => d.rootNumber⁻¹ * (((d.conductor : ℕ) : ℂ) ^ (z / 2) * d.gammaFactor z *
        continuedL d hc z)) := sorry

open Classical in
/-- **The shifted-pole card**, the countermodel for the polar hypotheses of
`continuedL_functionalEquation`. Degree `0`, conductor `1`, root number `1`, simple poles at
`2` and `-1 = reflectedPoint 2`, and the *assigned* values `1` at `2` and `0` at `-1`. The poles
are off `{0, 1}` on purpose: a functional-equation check that passes at the ζ poles alone does
not pass this one. The coefficients are irrelevant to the test and are set to `0`; the card
claims no Dirichlet agreement. -/
noncomputable def shiftedPoleData : TauCetiRoadmap.LFunctions.AnalyticLFunctionData where
  coeff _ := 0
  conductor := 1
  gammaR := 0
  gammaC := 0
  rootNumber := 1
  completed s := if s = 2 then 1 else if s = -1 then 0 else 1 / ((s - 2) * (s + 1))
  polarOrder := Finsupp.single 2 1 + Finsupp.single (-1) 1

theorem shiftedPoleData_hasContinuation : shiftedPoleData.HasMeromorphicContinuation := sorry

/-- `F (1 - conj s)` conjugated is `F s` off the poles, and `1 - conj` swaps the two poles. -/
theorem shiftedPoleData_hasFunctionalEquation : shiftedPoleData.HasFunctionalEquation := sorry

/-- **The rejection test for the polar hypotheses.** Both gamma hypotheses of
`continuedL_functionalEquation` hold at `s = 2`, and its conclusion there is `0 = 1`. -/
example :
    shiftedPoleData.gammaFactor 2 ≠ 0 ∧ shiftedPoleData.dual.gammaFactor (1 - 2) ≠ 0 ∧
      ¬ (((shiftedPoleData.dual.conductor : ℕ) : ℂ) ^ ((1 - 2 : ℂ) / 2) *
            shiftedPoleData.dual.gammaFactor (1 - 2) *
            continuedL shiftedPoleData.dual
              (TauCetiRoadmap.LFunctions.AnalyticLFunctionData.dual_hasMeromorphicContinuation
                shiftedPoleData_hasContinuation) (1 - 2) =
          shiftedPoleData.rootNumber⁻¹ * (((shiftedPoleData.conductor : ℕ) : ℂ) ^ ((2 : ℂ) / 2) *
            shiftedPoleData.gammaFactor 2 *
            continuedL shiftedPoleData shiftedPoleData_hasContinuation 2)) := sorry

/-- **Layer 1.1, a holomorphic branch of `log Γ` on a sector.** Route:
`Complex.exists_continuousOn_eqOn_exp_comp` on the sector, which is open and simply connected
and carries no zero or pole of `Γ`, followed by the upgrade from continuity to holomorphy
(`exp` is a local biholomorphism). ⚠ `Complex.log ∘ Gamma` is **not** a branch: nonvanishing
of `Γ` does not make the principal logarithm of its image continuous. ⚠ The normalization
`L 2 = 0` is part of the statement, and is consistent because `Γ 2 = 1` **and** `0 < δ < π`
puts `2` in the sector; without it the branch is determined only up to `2πi k`, which moves
the constant term of Stirling's formula. ⚠ Both bounds on `δ` are load-bearing, which is why
`hδ` and `hδ'` are hypotheses rather than side conditions in prose: at `δ ≤ 0` the set is
`{1 < ‖s‖}` minus at most a ray and is not simply connected, so no branch exists; at `δ ≥ π`
it is empty, `L` is unconstrained on it, and `L 2 = 0` normalizes nothing. -/
example (δ : ℝ) (hδ : 0 < δ) (hδ' : δ < Real.pi) :
    ∃ L : ℂ → ℂ,
      DifferentiableOn ℂ L {s : ℂ | |s.arg| < Real.pi - δ ∧ 1 < ‖s‖} ∧
      Set.EqOn (Complex.exp ∘ L) Gamma {s : ℂ | |s.arg| < Real.pi - δ ∧ 1 < ‖s‖} ∧
      L 2 = 0 := sorry

/-- **Layer 1.3, the Stirling estimate on a vertical line**, in the additive `log ‖·‖` form the
later layers compose over products, uniformly for `σ` in a compact interval and along
`|t| → ∞` in both directions (`cocompact ℝ`, not `atTop`). -/
example (a b : ℝ) :
    ∃ C : ℝ, ∀ᶠ t : ℝ in cocompact ℝ, ∀ σ ∈ Set.Icc a b,
      |Real.log ‖Gamma (σ + t * I)‖ -
          ((σ - 1 / 2) * Real.log |t| - Real.pi * |t| / 2 + Real.log (2 * Real.pi) / 2)| ≤
        C / |t| := sorry

/-- **Layer 1.4, the digamma bound** `Γ'/Γ (s) = log s + O(1/‖s‖)`, on a right half-plane
(the roadmap asks for it on any sector `|arg s| ≤ π − δ`). -/
example :
    (fun s : ℂ ↦ digamma s - Complex.log s) =O[cobounded ℂ ⊓ 𝓟 {s : ℂ | 1 ≤ s.re}]
      fun s ↦ (‖s‖)⁻¹ := sorry

/-- **Layer 1.5, the gamma factor has no zeros.** Its poles are the negative translates of the
shifts, and the statement is about `meromorphicOrderAt`, never about the value: at a pole of
`Gammaℝ` the total representative is `0`, which is why `Gammaℝ_eq_zero_iff` must not be read
as a vanishing statement. -/
example (n : ℕ) : meromorphicOrderAt Gammaℝ (-2 * n) = (-1 : WithTop ℤ) := sorry

/-- **Layer 1.6, the analytic reciprocal of the gamma factor.** `Gammaℝ` has no zeros, so
`1 / Gammaℝ` is analytic off the poles and extends analytically across each of them by the
value `0`. This entire function is what `continuedL` is built from, and it is what replaces
every division by a gamma factor: the pointwise quotient `Λ s / Gammaℝ s` divides by the junk
value `Gammaℝ (-2n) = 0` at each pole, while this product does not. -/
example :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧
      (∀ s : ℂ, Gammaℝ s ≠ 0 → g s * Gammaℝ s = 1) ∧
      (∀ n : ℕ, g (-2 * n) = 0) := sorry

/-- **Layer 1.6, the continued uncompleted L-function.** ⚠ The data record carries the
coefficients and a total representative of the *completed* continuation, and `LSeries` is a
junk value off its half-plane of convergence, so no statement about `L` at `1/2 + it` may be
phrased through the series. ⚠ And this is **not** the raw quotient. The last two conjuncts are
what a raw quotient fails: `analyticAt` is what later layers need in order to evaluate the
function at all, and the value at `0` is where the ζ instance separates the two constructions.
The milestone over the L-functions roadmap's record is this shape with `Gammaℝ` replaced by
`d.gammaFactor` and the conductor power restored; at the ζ instance the object is
`riemannZeta`. -/
example :
    ∃ L : ℂ → ℂ, MeromorphicOn L Set.univ ∧
      (∀ s : ℂ, 1 < s.re → L s = LSeries (fun _ ↦ 1) s) ∧
      (∀ s : ℂ, Gammaℝ s ≠ 0 → completedRiemannZeta s = Gammaℝ s * L s) ∧
      (∀ z : ℂ, 0 ≤ meromorphicOrderAt L z → AnalyticAt ℂ L z) ∧
      L 0 = -1 / 2 := sorry

/-- **Layer 1.6, the completed identity is an equality of germs, not of values.** ⚠ The
hypothesis `Gammaℝ s ≠ 0` above is not decoration. At a pole of `Gammaℝ` the pointwise product
`Gammaℝ s * L s` multiplies the junk value `0` by the compensating trivial zero of `L` and
gives `0`, while `Λ` is analytic and *nonzero* there — that is what "the trivial zeros are not
zeros of `Λ`" means. So the global identity of Layer 1.6 is an identity of meromorphic germs,
and its pointwise form holds exactly off the gamma poles. `s = -2` is the smallest witness. -/
example : completedRiemannZeta (-2) ≠ Gammaℝ (-2) * riemannZeta (-2) := sorry

/-- **Layer 1.6, the ζ instance names the object**: the construction must produce
`riemannZeta` itself, not merely something with its germs. -/
example :
    ∃ L : ℂ → ℂ, (∀ s : ℂ, Gammaℝ s ≠ 0 → completedRiemannZeta s = Gammaℝ s * L s) ∧
      (∀ z : ℂ, 0 ≤ meromorphicOrderAt L z → AnalyticAt ℂ L z) ∧
      L = riemannZeta := sorry

/-- **Layer 1.6, why the raw quotient is wrong**, as a refutation rather than a warning. Both
`completedRiemannZeta` and `Gammaℝ` have a simple pole at `s = 0`, so the continued `ζ` is
regular there with the value `-1/2` (`riemannZeta_zero`); the pointwise quotient divides by the
junk value `Gammaℝ 0 = 0` and is therefore `0`. The pin's own `riemannZeta_def_of_ne_zero`
carries the hypothesis `s ≠ 0` for exactly this reason. A `continuedL` defined as the quotient
satisfies every other clause above and fails this one. -/
example : completedRiemannZeta 0 / Gammaℝ 0 ≠ riemannZeta 0 := sorry

/-- **Layer 1.6, the functional equation is against the *dual* record.** ⚠ Over the
L-functions roadmap's record this relates `continuedL d` to `continuedL d.dual`, where that
roadmap's `dual` conjugates the coefficients, the shifts, and the root number; it is a self-relation
only for a self-dual record, and a non-real finite-order Hecke character is the test that
catches the difference. The ζ record is self-dual, so at the pin the statement collapses to
the pin's own `riemannZeta_one_sub`, and this example records the shape rather than the test:
the general form is an equality of *products*, never of quotients, so that no junk division
appears at a pole of either gamma factor. ⚠ Both gamma factors must be hypothesised nonzero,
and not only the one at `s`: at `s = 3` the point `1 - s = -2` is a pole of `Gammaℝ`, the left
side is `0 * 0`, and the right side is not `0`. -/
example (s : ℂ) (hs : Gammaℝ s ≠ 0) (hs' : Gammaℝ (1 - s) ≠ 0) :
    Gammaℝ (1 - s) * riemannZeta (1 - s) = Gammaℝ s * riemannZeta s := sorry

/-! ## Layer 2: the three conductors -/

/-- **Layer 2, the analytic conductor at a point**, Iwaniec–Kowalski (5.7), from the
arithmetic conductor `N` (the record's field, which is what `q` never means on its own) and
the spectral parameters. The `+ 3` is part of the convention. Each `Gammaℂ (s + ν)` contributes
the pair of shifts `ν, ν + 1` that `Gammaℝ_mul_Gammaℝ_add_one` splits it into, not
`(‖s + ν‖ + 3) ^ 2`: only the paired form is an equality with the modular forms roadmap's
`𝔮(f, s)`, whose newform value `N · (|s + (k−1)/2| + 3) · (|s + (k+1)/2| + 3)` is this
definition at `gammaC = {(k−1)/2}`. -/
noncomputable def analyticConductorAt (N : ℕ+) (gammaR gammaC : Multiset ℂ) (s : ℂ) : ℝ :=
  ((N : ℕ) : ℝ) * (gammaR.map fun μ ↦ ‖s + μ‖ + 3).prod
    * (gammaC.map fun ν ↦ (‖s + ν‖ + 3) * (‖s + ν + 1‖ + 3)).prod

/-- **Layer 2, the central analytic conductor**: the value at the central point of the
analytic normalization. The modular forms roadmap's `𝔮(f) = 𝔮(f, k/2)` is this quantity after
the normalization translation, which is why the central point is `1/2` here and `k/2` there. -/
noncomputable def centralAnalyticConductor (N : ℕ+) (gammaR gammaC : Multiset ℂ) : ℝ :=
  analyticConductorAt N gammaR gammaC (1 / 2)

/-- The record-level analytic conductor used by every generic zero estimate. -/
noncomputable def analyticConductorAtData
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData) (s : ℂ) : ℝ :=
  analyticConductorAt d.conductor d.gammaR d.gammaC s

/-- **Layer 2.2, the two-sided comparison on a strip.** ⚠ This replaces monotonicity in
`|Im s|`, which is false for a complex shift: `‖s + μ‖ + 3` decreases as `Im s` approaches
`-Im μ`. ⚠ The quantifier order is the statement: `C₁` and `C₂` are chosen before the
conductor and before the spectral parameters, and depend only on the strip, the degree, and
the bound `B` on the shifts. Quantifying them after `N` would allow them to depend on the
conductor, which is exactly the uniformity the milestone is about. -/
example (a b B : ℝ) (dR dC : ℕ) :
    ∃ C₁ C₂ : ℝ, 0 < C₁ ∧ 0 < C₂ ∧
      ∀ (N : ℕ+) (gammaR gammaC : Multiset ℂ), gammaR.card = dR → gammaC.card = dC →
        (∀ μ ∈ gammaR, ‖μ‖ ≤ B) → (∀ ν ∈ gammaC, ‖ν‖ ≤ B) →
        ∀ σ ∈ Set.Icc a b, ∀ t : ℝ,
          C₁ * ((N : ℕ) : ℝ) * (|t| + 3) ^ (dR + 2 * dC) ≤
              analyticConductorAt N gammaR gammaC (σ + t * I) ∧
            analyticConductorAt N gammaR gammaC (σ + t * I) ≤
              C₂ * ((N : ℕ) : ℝ) * (|t| + 3) ^ (dR + 2 * dC) := sorry

/-- **Layer 2, the conductor grows like `q · |t|^{degree}`.** Stated for the Riemann zeta
data (`N = 1`, one real gamma factor at shift `0`), where it is a bound on `|t| + 3`. -/
example :
    (fun t : ℝ ↦ analyticConductorAt 1 {0} 0 (t * I)) =Θ[atTop] fun t : ℝ ↦ |t| := sorry

/-! ## Layer 3: convexity, on the pole-cleared *uncompleted* function

⚠ The interpolation is run on `continuedL`, never on the completed function. Layer 1.5 gives
`|γ(σ + it)| = exp(-π d |t| / 4) |t|^{A(σ) + o(1)}`, so a polynomial bound for `Λ` — which is
true, and is what Layer 0.4 proves — divides to give a bound for `L` carrying `exp(+π d |t|/4)`.
That is exponentially growing, not `q^{1/4 + ε}`, and no choice of polynomial exponent repairs
it. The two edges below are polynomial in the analytic conductor with no exponential in either,
and the only division at the end is by the polynomial clearing the poles. -/

/-- **Layer 3.3, the pole-cleared strip bound**, at the ζ instance, where the clearing
polynomial is `s - 1` and the arithmetic conductor is `1`.

⚠ The bound is stated for the **removable analytic extension** `g` of
`fun s ↦ (s - 1) * riemannZeta s`, and not for that product. This is the same defect Layer 0.2
avoids above: the product takes the value `(1 - 1) * riemannZeta 1 = 0` at `s = 1`, since
`riemannZeta 1` is a junk value, whereas `g 1` is the residue `1`. The product is therefore not
continuous at `1`, let alone holomorphic, so `Complex.PhragmenLindelof.vertical_strip` does not
apply to it; and an inequality written for the product would typecheck while bounding nothing
there, because `0` satisfies every upper bound. The clause `g 1 = 1` is the test that the
extension was taken, exactly as `continuedL riemannZetaData 0 = -1/2` is in Layer 1.6.

The exponent is the linear interpolation between `0` at `Re s = 1 + δ` (absolute convergence)
and `1/2 + δ` at `Re s = -δ` (the functional equation against the dual, with the two gamma
exponentials cancelling inside the quotient). ⚠ The factor `1 + |s.im|` is the clearing
polynomial's own growth and is not slack; dropping it makes the statement false on the right
edge, where `‖(s - 1) ζ(s)‖ ≍ |t|`. -/
example (δ : ℝ) (hδ : 0 < δ) (hδ' : δ < 1 / 2) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧
      (∀ s : ℂ, s ≠ 1 → g s = (s - 1) * riemannZeta s) ∧
      g 1 = 1 ∧
      ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ, -δ ≤ s.re → s.re ≤ 1 + δ →
        ‖g s‖ ≤
          C * (1 + |s.im|) *
            (|s.im| + 3) ^ ((1 / 2 + δ) * (1 + δ - s.re) / (1 + 2 * δ)) := sorry

/-- **Layer 3.3, the central-line convexity bound**, the corollary at `σ = 1/2` where the
interpolated exponent `(1/2 + δ)(1/2 + δ)/(1 + 2δ)` is exactly `1/4 + δ/2`. The clearing
polynomial is divided out here because its only root, `s = 1`, is off the critical line — which
is also why the statement may be written for `riemannZeta` directly: on that line the analytic
extension `g` above agrees with `(s - 1) * riemannZeta s` on the nose.
⚠ Subconvexity is out of scope: no milestone improves `1/4`. -/
example (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ t : ℝ,
      ‖riemannZeta (1 / 2 + t * I)‖ ≤ C * (|t| + 3) ^ (1 / 4 + ε) := sorry

/-- **Layer 3.3, the wide-strip corollary above the polar heights**, which is the shape Layer
4.7 consumes on `Re s ∈ [-2, 6]` to keep the gamma exponential in the numerator of the Jensen
ratio. ⚠ The height threshold is what keeps the clearing polynomial bounded away from `0`. -/
example (a b : ℝ) :
    ∃ C B T₀ : ℝ, 0 < C ∧ 0 ≤ B ∧ 0 ≤ T₀ ∧
      ∀ s : ℂ, a ≤ s.re → s.re ≤ b → T₀ ≤ |s.im| →
        ‖riemannZeta s‖ ≤ C * (|s.im| + 3) ^ B := sorry

/-! ## Layer 4: the two counts -/

/-- **Layer 4.1, the signed divisor count** of `f` over a region `R`, for `f` meromorphic on
an ambient open `U ⊇ R`: poles contribute negatively. This is what a contour integral of
`logDeriv f` computes (Layer 7.2), and it is *not* a number of zeros. ⚠ `MeromorphicOn.divisor`
is total, with junk value `0` off `U` and where `f` is not meromorphic, so meromorphy on `U` is
a hypothesis of every theorem about this count; and a `∑ᶠ` over an infinite support is silently
`0`, so finiteness of the support in `R` is a companion theorem, not an afterthought. -/
noncomputable def divisorCount (f : ℂ → ℂ) (U R : Set ℂ) : ℤ :=
  ∑ᶠ ρ ∈ R, MeromorphicOn.divisor f U ρ

/-- **Layer 4.1, the zero count**: the natural-valued sum of the multiplicities of the
positive part of the divisor, `(MeromorphicOn.divisor f U)⁺` read pointwise. This is what
`N(T)`, Riemann–von Mangoldt, and every certificate use. It equals `divisorCount` exactly when
`R` contains no pole (`∀ z ∈ R, 0 ≤ divisor f U z`), which is a hypothesis and never an
inference: without it, an omitted zero and an omitted pole cancel in the signed count. -/
noncomputable def zeroCount (f : ℂ → ℂ) (U R : Set ℂ) : ℕ :=
  ∑ᶠ ρ ∈ R, (MeromorphicOn.divisor f U ρ).toNat

/-- **The closed rectangle** `[σ₁, σ₂] × [t₁, t₂]`, as a four-real bundle over the exact set
expression the conventions table pins. Closed rectangles with regular boundary carry contour
integrals and certificates. The ordering of the endpoints is a predicate rather than a
structure field, so that the definitions below stay total: `Set.Icc` of a reversed pair is
empty, so an invalid rectangle has empty region and count `0`, and the ordering is carried
explicitly by every statement that needs it. ⚠ Two predicates, and they are not
interchangeable: `Rect.Valid` for sets and counts, `Rect.Nondegenerate` for everything
geometric. -/
structure Rect where
  /-- Left edge. -/
  σ₁ : ℝ
  /-- Right edge. -/
  σ₂ : ℝ
  /-- Bottom edge. -/
  t₁ : ℝ
  /-- Top edge. -/
  t₂ : ℝ

/-- The underlying set of a closed rectangle. -/
def Rect.toSet (B : Rect) : Set ℂ := Set.Icc B.σ₁ B.σ₂ ×ℂ Set.Icc B.t₁ B.t₂

/-- The endpoints of a rectangle are in order. This is the predicate the *set and count*
statements carry: `Set.Icc` of a reversed pair is empty, so a reversed rectangle has empty
region and count `0`, and `Rect.Valid` is what makes a subdivision or a certificate mean what
it says. ⚠ It is **not** enough for anything geometric; see `Rect.Nondegenerate`. -/
def Rect.Valid (B : Rect) : Prop := B.σ₁ ≤ B.σ₂ ∧ B.t₁ ≤ B.t₂

/-- The endpoints of a rectangle are in **strict** order. This is the predicate every contour,
winding-number, null-homology and argument-principle statement carries.
⚠ `Rect.Valid` is false-making here, not merely weak. `IsPwC1ImmersionOn` demands a non-zero
one-sided derivative on every breakpoint-free piece, and if `σ₁ = σ₂` the two horizontal edges
of `rectBoundary` are constant maps whose `derivWithin` vanishes identically on a whole piece;
a point rectangle makes all four edges constant. The interior-winding statement is also
vacuous under `Valid`, since a degenerate rectangle has empty interior. -/
def Rect.Nondegenerate (B : Rect) : Prop := B.σ₁ < B.σ₂ ∧ B.t₁ < B.t₂

/-- Nondegenerate rectangles are valid, so the counting API applies to them unchanged. -/
theorem Rect.Valid.of_nondegenerate {B : Rect} (h : B.Nondegenerate) : B.Valid :=
  ⟨h.1.le, h.2.le⟩

/-- The half-open rectangle `[σ₁, σ₂] × (t₁, t₂]`, which is what exact partitions and `N(T)`
use: a zero on a shared horizontal edge is counted once rather than twice. -/
def Rect.toSetHalfOpen (B : Rect) : Set ℂ := Set.Icc B.σ₁ B.σ₂ ×ℂ Set.Ioc B.t₁ B.t₂

/-- **Layer 4.3, exact additivity, on half-open rectangles.** ⚠ The closed statement is false:
two closed rectangles sharing an edge both contain a zero on that edge, so a subdivision
double-counts it. The closed version needs the hypothesis that the shared boundary is regular
and zero-free. ⚠ Finiteness is a hypothesis, not a consequence: `∑ᶠ` returns `0` on an
infinite support, and a function meromorphic on `U` can have infinitely many zeros in a
bounded rectangle when that rectangle is not relatively compact in `U`, so the three finsums
would all be junk and the equation would say nothing. The clean sufficient hypothesis is the
one displayed here — meromorphy on `U`, the closed rectangle contained in `U`, and finite
divisor support on it — and the corresponding statement for a vertical subdivision needs a
half-open real interval as well, or the zero-free-shared-edge hypothesis. -/
example (f : ℂ → ℂ) (U : Set ℂ) (σ₁ σ₂ t₁ t₂ t₃ : ℝ) (h₁ : t₁ ≤ t₂) (h₂ : t₂ ≤ t₃)
    (hf : MeromorphicOn f U) (hU : Rect.toSet ⟨σ₁, σ₂, t₁, t₃⟩ ⊆ U)
    (hfin : (Function.support fun ρ ↦ MeromorphicOn.divisor f U ρ) ∩
      Rect.toSet ⟨σ₁, σ₂, t₁, t₃⟩ |>.Finite) :
    zeroCount f U (Rect.toSetHalfOpen ⟨σ₁, σ₂, t₁, t₃⟩) =
      zeroCount f U (Rect.toSetHalfOpen ⟨σ₁, σ₂, t₁, t₂⟩) +
        zeroCount f U (Rect.toSetHalfOpen ⟨σ₁, σ₂, t₂, t₃⟩) := sorry

/-- **Layer 4, the trivial zeros of `ζ` are not zeros of `Λ`.** They are the points where
`Gammaℝ` has a pole and `riemannZeta` a compensating zero, so the completed function is regular
and nonvanishing there. Verifying this on the order is the first check that the counting
convention is the intended one. -/
example (n : ℕ) : meromorphicOrderAt completedRiemannZeta (-2 * (n + 1)) = 0 := sorry

/-- **Layer 4, the poles of `Λ` are points of negative divisor**, not zeros, and not detectable
from the value of the total representative at `1`. -/
example : MeromorphicOn.divisor completedRiemannZeta Set.univ 1 = -1 := sorry

/-- **Layer 4, the zeros of `Λ` lie in the critical strip.** With Layer 6 this becomes the
open strip. -/
example (ρ : ℂ) (hρ : 0 < MeromorphicOn.divisor completedRiemannZeta Set.univ ρ) :
    0 ≤ ρ.re ∧ ρ.re ≤ 1 := sorry

/-- **Layer 4.7, the local count at height `T`.** ⚠ Not a consequence of growth alone: Jensen's
formula bounds the count by `log (M / ‖f c‖)`, and the denominator needs a *lower* bound at an
explicit basepoint. The proof takes the basepoint at `2 + iT`, where the Euler product bounds
`‖ζ‖` away from `0`, and the disc of radius `3` about it contains the unit disc on the critical
line. The region here contains no pole of `Λ` (for `2 ≤ T` the points `0` and `1` are at
distance at least `2`), so the natural-valued count is the right one. -/
example :
    ∃ C : ℝ, ∀ T : ℝ, 2 ≤ T →
      (zeroCount completedRiemannZeta Set.univ (Metric.closedBall (1 / 2 + T * I) 1) : ℝ) ≤
        C * Real.log T := sorry

/-- **Layer 4.9, the counting function `N(T)`**: zeros of the completed function with
`0 < Im ρ ≤ T`, with multiplicity, in the closed critical strip. Half-open in the imaginary
direction, which is what excludes the real axis and makes the partition of 4.3 exact; a zero at
height exactly `T` is counted. ⚠ The symmetric count over `|Im ρ| ≤ T` is a different quantity,
and the factor-of-two relation between them is a theorem with an explicit reality hypothesis
(true for `ζ_K`, and for a Hecke character only when it is real). ⚠ The region is not compact,
so the finiteness that makes this finsum the intended count comes from local finiteness of
`MeromorphicOn.divisor f Set.univ` on the compact closure, through
`Function.locallyFinsupp.locallyFiniteSupport` and
`LocallyFiniteSupport.finite_inter_support_of_isCompact`, not from
`Function.locallyFinsuppWithin.finiteSupport`. -/
noncomputable def zeroCountUpTo (f : ℂ → ℂ) (U : Set ℂ) (T : ℝ) : ℕ :=
  zeroCount f U (Rect.toSetHalfOpen ⟨0, 1, 0, T⟩)

/-- **Layer 4.8, the unit-height count**, which the box-to-disc reduction proves before any
contour integral exists: the unit-height rectangle sits inside the disc of radius `√2/2`
centered on the critical line, so this is one application of the local count. Summing `T` of
them gives `N(T) = O(T log T)` for `ζ`, the strongest counting bound available before Layer 7.
⚠ Differencing the Riemann–von Mangoldt formula does not improve this to an asymptotic: its
error is the same size as the main term of the difference. -/
example :
    (fun T : ℝ ↦ (zeroCountUpTo completedRiemannZeta Set.univ (T + 1) : ℝ) -
        (zeroCountUpTo completedRiemannZeta Set.univ T : ℝ))
      =O[atTop] Real.log := sorry

/-! ## Layer 6: the zero-free region -/

/-- **Layer 6, the de la Vallée Poussin region for `ζ`**, the first instance of the general
statement and the one the pin can already talk about. ⚠ The general theorem is stated per
family, never for a bare record satisfying the data-model predicates: the proof needs the
Euler product and the nonnegativity of the von Mangoldt coefficients. -/
example :
    ∃ c : ℝ, 0 < c ∧ ∀ ρ : ℂ, 0 < MeromorphicOn.divisor completedRiemannZeta Set.univ ρ →
      ρ.re < 1 - c / Real.log (|ρ.im| + 3) := sorry

/-- **Layer 6, the qualitative boundary case**, which is the pin's
`riemannZeta_ne_zero_of_one_le_re` recovered from the region. -/
example (ρ : ℂ) (hρ : 0 < MeromorphicOn.divisor completedRiemannZeta Set.univ ρ) :
    ρ.re < 1 := sorry

/-! ### Layer 6.4: the Hecke region, decomposed

No source proves 6.4 in the stated generality, so the README decomposes it into six
milestones and the three that a formalizer is most likely to get wrong are named here. They
are **named** rather than anonymous because 6.4a and 6.4b are consumed by Layer 8.7 as well.
-/

section HeckeZeroFree

open NumberField

variable (K : Type*) [Field K] [NumberField K]

/-- **Layer 6.4a, positivity of the `3-4-1` combination**, at a common presentation modulus.
⚠ All three characters are presented at `𝔣`, so all three Euler products run over the ideals
prime to `𝔣` and the combination is a single termwise-nonnegative series; presenting each at
its own conductor breaks that and the statement becomes false as a termwise inequality. The
trigonometric factor is `LFunctions.three_four_one_nonneg` and the coefficient nonnegativity
is `LFunctions.dedekindZeta_idealVonMangoldt_nonneg`. ⚠ This is a statement on the half-plane
of absolute convergence only; it is not an inequality between meromorphic continuations. -/
theorem three_four_one_hecke (𝔣 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (χ : TauCetiRoadmap.GlobalNumberFields.RayClassCharacter 𝔣) {σ t : ℝ} (hσ : 1 < σ) :
    0 ≤ 3 * (-logDeriv (TauCetiRoadmap.LFunctions.heckeLFunctionC K
            (1 : TauCetiRoadmap.GlobalNumberFields.RayClassCharacter 𝔣)) (σ : ℂ)).re
        + 4 * (-logDeriv (TauCetiRoadmap.LFunctions.heckeLFunctionC K χ)
            ((σ : ℂ) + (t : ℂ) * I)).re
        + (-logDeriv (TauCetiRoadmap.LFunctions.heckeLFunctionC K (χ ^ 2))
            ((σ : ℂ) + 2 * (t : ℂ) * I)).re := sorry

/-- **Layer 6.4b, the imprimitive comparison, zero side.** The deleted Euler factors of
`LFunctions.eulerCorrection` vanish only on `Re s = 0`, because `‖w‖ = 1` and
`1 - w * 𝔑𝔭 ^ (-s) = 0` force `𝔑𝔭 ^ (-Re s) = 1`. Hence on the right half-plane a presented
series and its primitive source have the same zeros, and the region proved for the primitive
character transfers verbatim. ⚠ Without this, 6.4a's third term — `χ ^ 2`, which is imprimitive
whenever `χ` is not — is a series about which Layer 6 proves nothing. -/
theorem eulerCorrection_ne_zero_of_pos_re
    {𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K}
    (χ : TauCetiRoadmap.GlobalNumberFields.RayClassCharacter 𝔪)
    (𝔫 : TauCetiRoadmap.GlobalNumberFields.Modulus K) {s : ℂ} (hs : 0 < s.re) :
    TauCetiRoadmap.LFunctions.eulerCorrection K χ 𝔫 s ≠ 0 := sorry

/-- **Layer 6.4, the conclusion of the region theorem at one character and one constant**, as
the disjunction its proof produces. ⚠ The two branches are genuinely different statements: for
a non-real `χ` there is **no** zero in the region, and for a real one the exceptional zero is
not excluded by any milestone here — only shown to be unique, real, and simple. The predicate is
separated from the theorem so that the two quantifier orders below can be stated without
repeating it. -/
def HeckeZeroFreeDisjunction (c : ℝ)
    (χ : TauCetiRoadmap.LFunctions.PrimitiveRayClassCharacter K) : Prop :=
  (χ.character ^ 2 ≠ 1 →
      ∀ ρ : ℂ, 0 < MeromorphicOn.divisor
          (TauCetiRoadmap.LFunctions.completedHeckeLFunction K χ) Set.univ ρ →
        ρ.re < 1 - c / Real.log
          (analyticConductorAtData (TauCetiRoadmap.LFunctions.heckeData K χ) (ρ.im * I))) ∧
    (χ.character ^ 2 = 1 →
      ∃ β : ℝ, ∀ ρ : ℂ, 0 < MeromorphicOn.divisor
          (TauCetiRoadmap.LFunctions.completedHeckeLFunction K χ) Set.univ ρ →
        ρ.re < 1 - c / Real.log
            (analyticConductorAtData (TauCetiRoadmap.LFunctions.heckeData K χ)
              (ρ.im * I)) ∨
          (ρ = (β : ℂ) ∧ MeromorphicOn.divisor
            (TauCetiRoadmap.LFunctions.completedHeckeLFunction K χ) Set.univ ρ = 1))

/-- **Layer 6.4, the region for a primitive finite-order ray-class character, uniform in the
field and the character of a fixed degree.** ⚠ The quantifier order *is* the statement: `c` is
chosen from the degree `n` before `K` and `χ`, which is what 6.4e's small-conductor reduction
delivers. A statement that fixes `K` before choosing `c` permits `c` to depend on `K`; that is
`heckeZeroFreeRegion_of_fixed` below, a corollary, and it does not discharge this milestone.
The two are stated separately so that neither is described as the other. -/
theorem heckeZeroFreeRegion (n : ℕ) :
    ∃ c : ℝ, 0 < c ∧
      ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
        ∀ χ : TauCetiRoadmap.LFunctions.PrimitiveRayClassCharacter K,
          χ.character ≠ 1 → HeckeZeroFreeDisjunction K c χ := sorry

/-- **Layer 6.4, the fixed-field form**, in which `c` may depend on `K`. This is the weaker
statement, and it is what an `∃ c` after fixing `K` means; it follows from
`heckeZeroFreeRegion` at `n = [K:ℚ]` and is stated only so that the two quantifier orders are
never confused. -/
theorem heckeZeroFreeRegion_of_fixed :
    ∃ c : ℝ, 0 < c ∧
      ∀ χ : TauCetiRoadmap.LFunctions.PrimitiveRayClassCharacter K,
        χ.character ≠ 1 → HeckeZeroFreeDisjunction K c χ := sorry

end HeckeZeroFree

/-! ## Layer 7: the rectangle contour, against the contour integration roadmap

⚠ The theorem consumed here is that roadmap's **Layer 4** summit
`hungerbuhlerWasem_residueTheorem`, not its Layer 2: its pinned `argumentPrinciple` and
`classicalResidueTheorem_circle` are stated for a circle, and a rectangle is not one. The
declarations below are stated against its exact types, so the contract is machine-checked
rather than promised in prose, and they are **named** rather than anonymous because they are
this roadmap's exported interface — an `example` is not a declaration contract.

⚠ Two hypotheses run through all of them and neither may be weakened.
`Rect.Nondegenerate`, because the supplier's curve regularity forbids a constant edge; and
pointwise `AnalyticAt ℂ f z ∧ f z ≠ 0` on the boundary, because
`meromorphicOrderAt f z = 0` is a condition on the punctured germ that constrains no value.
See `meromorphicOrderAt_zero_not_pointwise` below for the countermodel. -/

open TauCetiRoadmap.ContourIntegration

/-- **Layer 7.1, the rectangle boundary as a contour**: the positively oriented boundary of a
closed rectangle, parametrized on `[0, 4]` with one edge per unit interval, so that the
breakpoint witness `IsPwC1ImmersionOn` asks for is `{1, 2, 3}`. -/
noncomputable def rectBoundary (B : Rect) : ℝ → ℂ := sorry

/-- **Layer 7.1, the boundary curve traces the frontier**, which is what lets the pointwise
boundary hypotheses below be applied at each `rectBoundary B t`. -/
theorem rectBoundary_mem_frontier {B : Rect} (hB : B.Nondegenerate) {t : ℝ}
    (ht : t ∈ Set.Icc (0 : ℝ) 4) : rectBoundary B t ∈ frontier B.toSet := sorry

/-- **Layer 7.1, the curve structure the supplier's theorem hypothesizes**: a closed
piecewise-`C¹` immersion, the corners being the piece boundaries. ⚠ The hypothesis is
`Rect.Nondegenerate`, and under `Rect.Valid` alone the statement is **false**: a rectangle
with a zero-length edge has a constant edge, whose `derivWithin` vanishes on a whole piece,
contradicting the non-vanishing tangent `IsPwC1ImmersionOn` requires. -/
theorem isPwC1ImmersionOn_rectBoundary {B : Rect} (hB : B.Nondegenerate) :
    IsPwC1ImmersionOn (rectBoundary B) 0 4 ∧ rectBoundary B 0 = rectBoundary B 4 := sorry

/-- **Layer 7.1, the winding number inside**: `1` about each interior point. -/
theorem windingNumber_rectBoundary_of_mem_interior {B : Rect} (hB : B.Nondegenerate) {z : ℂ}
    (hz : z ∈ interior B.toSet) : windingNumber (rectBoundary B) 0 4 z = 1 := sorry

/-- **Layer 7.1, the winding number outside**: `0` about each point off the closed rectangle.
Together with the previous theorem this is what collapses the supplier's weighted residue sum
to a count over the rectangle. -/
theorem windingNumber_rectBoundary_of_not_mem {B : Rect} (hB : B.Nondegenerate) {z : ℂ}
    (hz : z ∉ B.toSet) : windingNumber (rectBoundary B) 0 4 z = 0 := sorry

/-- **Layer 7.1, null-homology**, the hypothesis `hungerbuhlerWasem_residueTheorem` takes. -/
theorem isNullHomologous_rectBoundary {B : Rect} (hB : B.Nondegenerate) {U : Set ℂ}
    (hU : B.toSet ⊆ U) : IsNullHomologous (rectBoundary B) 0 4 U := sorry

/-- **Layer 7.2, the local bridge**: the residue of the logarithmic derivative is the order.
This is what turns the supplier's weighted residue sum into a divisor count. -/
theorem residue_logDeriv_eq_order {f : ℂ → ℂ} {z : ℂ} {n : ℤ} (hf : MeromorphicAt f z)
    (hn : meromorphicOrderAt f z = (n : WithTop ℤ)) :
    residue (logDeriv f) z = (n : ℂ) := sorry

/-- **Layer 7.2, the argument principle on a rectangle**, as the specialization of
`hungerbuhlerWasem_residueTheorem` to `logDeriv f` on `rectBoundary B`, stated against an
**explicit finite singular set** and with the supplier's actual hypotheses.

⚠ `MeromorphicOn f U` plus a divisor does **not** give the supplier's
`hf : DifferentiableOn ℂ (logDeriv f) (U \ ↑S)`; `hanalytic` and `hsupp` are what do, and
`hsupp` is also where finiteness of `S` comes from. ⚠ `hbdry` is pointwise. The conclusion is
a Cauchy principal value with the supplier's generalized winding weights;
`windingNumber_rectBoundary_of_mem_interior` collapses them, and
`intervalIntegral_of_hasCauchyPV` turns the principal value into an ordinary integral. -/
theorem hasCauchyPV_rectBoundary_logDeriv {f : ℂ → ℂ} {U : Set ℂ} {B : Rect} {S : Finset ℂ}
    {ord : ℂ → ℤ}
    (hU : IsOpen U) (hB : B.Nondegenerate) (hBU : B.toSet ⊆ U) (hSU : (S : Set ℂ) ⊆ U)
    (hSbdry : ∀ s ∈ S, s ∉ frontier B.toSet)
    (hanalytic : AnalyticOnNhd ℂ f (U \ (S : Set ℂ)))
    (hmero : ∀ s ∈ S, MeromorphicAt f s)
    (hord : ∀ s ∈ S, meromorphicOrderAt f s = (ord s : WithTop ℤ))
    (hsupp : ∀ z ∈ U, meromorphicOrderAt f z ≠ 0 → z ∈ S)
    (hbdry : ∀ z ∈ frontier B.toSet, AnalyticAt ℂ f z ∧ f z ≠ 0) :
    HasCauchyPV (rectBoundary B) 0 4 (logDeriv f)
      (2 * (Real.pi : ℂ) * Complex.I *
        ∑ s ∈ S, windingNumber (rectBoundary B) 0 4 s * (ord s : ℂ)) := sorry

/-- **Layer 7.2b, from the principal value to the ordinary integral.** The supplier's
conclusion is a `HasCauchyPV`, not an interval integral, and nothing connects Layer 7's
statements to Layer 9's counts without this. Continuity of the integrand on the image of the
curve is what `AnalyticAt ℂ f z ∧ f z ≠ 0` on the boundary supplies and what the order
condition alone does not. -/
theorem intervalIntegral_of_hasCauchyPV {γ : ℝ → ℂ} {a b : ℝ} {g : ℂ → ℂ} {v : ℂ}
    (hγ : IsPiecewiseC1On γ a b) (hcont : ContinuousOn g (γ '' Set.uIcc a b))
    (h : HasCauchyPV γ a b g v) :
    ∫ t in a..b, deriv γ t • g (γ t) = v := sorry

/-- **Layer 7.2a, localization, step 1**: a relatively compact, **connected** open
neighbourhood of the rectangle inside the ambient set — the `ε`-thickening of the rectangle,
for `ε` small. ⚠ This is what lets the argument principle be applied where the singular set is
genuinely finite, without assuming it is finite globally; and connectedness is what step 2's
finite-order hypothesis is discharged from, since a boundary point of order `0` then forces
finite order on all of `closure V` by Mathlib's
`MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`. On a disconnected `U` the components
on which `f` vanishes identically are exactly what a connected `V` avoids. -/
theorem exists_isOpen_closure_compact_between {U : Set ℂ} {B : Rect} (hB : B.Valid)
    (hU : IsOpen U) (hBU : B.toSet ⊆ U) :
    ∃ V : Set ℂ, IsOpen V ∧ IsConnected V ∧ B.toSet ⊆ V ∧ IsCompact (closure V) ∧
      closure V ⊆ U := sorry

/-- **Layer 7.2a, localization, step 2**: on a compact subset of the domain of meromorphy on
which the order is finite everywhere, the set of points of nonzero order is finite. This
replaces the global finiteness hypothesis, which is **false** for every completed L-function:
those have infinitely many zeros.

⚠ `hne` cannot be dropped, and it is not implied by `MeromorphicOn`: `meromorphicOrderAt f z`
is `⊤` wherever `f` vanishes on a punctured neighbourhood of `z`, so for `f = 0` every point of
a compact disc has nonzero order and the displayed set is the whole disc
(`finite_orderSupport_zero_fails`). This is the one place where the nonzero-order locus and the
divisor support part company. `MeromorphicOn.divisor` is `0` at a point of order `⊤`, so *its*
support is locally finite unconditionally (`Function.locallyFinsuppWithin.finiteSupport` on a
compact `U`), while the locus item 2's third hypothesis needs is not. The two are reconciled by
`hne`: under it the two sets coincide on `K`. -/
theorem finite_orderSupport_of_isCompact {f : ℂ → ℂ} {U K : Set ℂ}
    (hU : IsOpen U) (hf : MeromorphicOn f U) (hK : IsCompact K) (hKU : K ⊆ U)
    (hne : ∀ z ∈ K, meromorphicOrderAt f z ≠ ⊤) :
    {z ∈ K | meromorphicOrderAt f z ≠ 0}.Finite := sorry

/-- **The rejection test for step 2**: without `hne` the statement is false, with `f = 0` as the
witness; `meromorphicOrderAt_eq_top_iff` is what puts every point of the disc in the set. -/
theorem finite_orderSupport_zero_fails :
    ¬ {z ∈ Metric.closedBall (0 : ℂ) 1 |
        meromorphicOrderAt (fun _ : ℂ => (0 : ℂ)) z ≠ 0}.Finite := sorry

/-- **Layer 7.2a, localization, step 2′**: the finite-order hypothesis of step 2 comes from the
boundary. On a connected open `V ⊇ ∂R` a single boundary point of order `0` — which the
boundary hypothesis of every counting theorem supplies — gives finite order at every point of
`closure V`, since the closure of a connected set is connected and `f` is meromorphic on it.
This is Mathlib's identity theorem for meromorphic functions, restated in the shape step 2 takes
it. -/
theorem meromorphicOrderAt_ne_top_of_frontier {f : ℂ → ℂ} {U V : Set ℂ} {B : Rect}
    (hB : B.Nondegenerate) (hf : MeromorphicOn f U) (hV : IsConnected V) (hVU : closure V ⊆ U)
    (hBV : B.toSet ⊆ V) (hbdry : ∀ z ∈ frontier B.toSet, meromorphicOrderAt f z = 0) :
    ∀ z ∈ closure V, meromorphicOrderAt f z ≠ ⊤ := sorry

/-- **Layer 7.2a, localization, step 3**: the order at a point is a germ condition, so it does
not see the ambient set, and the divisor over a smaller open set agrees with the global one
there. This is what carries a theorem proved on `V` back to a statement about `divisor f U`. -/
theorem divisorCount_restrict {f : ℂ → ℂ} {U V : Set ℂ} {B : Rect}
    (hU : IsOpen U) (hV : IsOpen V) (hVU : V ⊆ U) (hf : MeromorphicOn f U)
    (hBV : B.toSet ⊆ V) :
    divisorCount f V B.toSet = divisorCount f U B.toSet := sorry

/-- **Layer 7.2a, the canonical-representative bridge**, which is what connects the argument
principle to the divisor language every other layer uses.

⚠ `hcanon` is the load-bearing hypothesis and is not implied by `hf`: `MeromorphicAt` is a
punctured-germ condition, so a representative may be redefined at one point without changing
any order, and the defect is invisible to `MeromorphicOn.divisor`. With `hcanon`, the
order-zero boundary condition upgrades to `AnalyticAt` there, and an analytic function of
order `0` at a point is nonzero there — so `hcanon` and `hbdry` together give both pointwise
facts that `hasCauchyPV_rectBoundary_logDeriv` needs. The L-functions roadmap's records
satisfy `hcanon` through their `regular_away` field, and `entireCompletion` and `continuedL`
inherit it from Layers 0.2 and 1.6. -/
theorem intervalIntegral_logDeriv_eq_divisorCount {f : ℂ → ℂ} {U : Set ℂ} {B : Rect}
    (hU : IsOpen U) (hB : B.Nondegenerate) (hBU : B.toSet ⊆ U)
    (hf : MeromorphicOn f U)
    (hcanon : ∀ z ∈ U, 0 ≤ meromorphicOrderAt f z → AnalyticAt ℂ f z)
    (hbdry : ∀ z ∈ frontier B.toSet, meromorphicOrderAt f z = 0) :
    ∫ t in (0:ℝ)..4, deriv (rectBoundary B) t • logDeriv f (rectBoundary B t) =
      2 * (Real.pi : ℂ) * Complex.I * (divisorCount f U B.toSet : ℂ) := sorry

/-- **The acceptance test for the localization, and the reason no global finiteness hypothesis
appears above.** The ambient set is all of `ℂ` and `completedRiemannZeta` has infinitely many
zeros in it, so a version of the theorem carrying
`{z ∈ U | meromorphicOrderAt f z ≠ 0}.Finite` says nothing about the function this layer exists
for. The theorem above applies to it, because `hasCauchyPV_rectBoundary_logDeriv` is invoked on
a relatively compact `V ⊇ B.toSet` where the singular set really is finite, and
`divisorCount_restrict` carries the answer back to `Set.univ`. -/
example (B : Rect) (hB : B.Nondegenerate)
    (hbdry : ∀ z ∈ frontier B.toSet, meromorphicOrderAt completedRiemannZeta z = 0) :
    ¬ {z : ℂ | meromorphicOrderAt completedRiemannZeta z ≠ 0}.Finite ∧
      ∫ t in (0:ℝ)..4, deriv (rectBoundary B) t •
          logDeriv completedRiemannZeta (rectBoundary B t) =
        2 * (Real.pi : ℂ) * Complex.I *
          (divisorCount completedRiemannZeta Set.univ B.toSet : ℂ) := sorry

/-- **The countermodel that makes `hcanon` and the pointwise boundary hypotheses necessary.**
Take `f` equal to `1` except at one point, where it is `0`. Every germ condition holds — `f` is
meromorphic everywhere, every order is `0`, the divisor is identically `0` — and yet `f` is not
continuous, `logDeriv f` is undefined at that point, and the image of any path through it meets
`0`. So `meromorphicOrderAt f z = 0` on a boundary implies neither analyticity there nor
non-vanishing there, and the argument lift of 7.3 does not exist for this `f`. -/
theorem meromorphicOrderAt_zero_not_pointwise :
    ∃ f : ℂ → ℂ, (∀ z : ℂ, MeromorphicAt f z) ∧ (∀ z : ℂ, meromorphicOrderAt f z = 0) ∧
      (∀ z : ℂ, MeromorphicOn.divisor f Set.univ z = 0) ∧
      ¬ Continuous f ∧ (∃ z : ℂ, f z = 0) := sorry

/-- **Layer 7.3, the continuous argument lift.** ⚠ The hypothesis is pointwise analyticity and
non-vanishing on the boundary, which is what makes the image curve continuous and `0`-avoiding;
under `meromorphicOrderAt f z = 0` alone the conclusion is false, by
`meromorphicOrderAt_zero_not_pointwise`. ⚠ No basepoint value may be asserted: `θ 0` is *some*
argument of `f (rectBoundary B 0)`, and every statement downstream uses only a difference
`θ b - θ a`, which is independent of the choice. -/
theorem exists_argLift_rectBoundary {f : ℂ → ℂ} {B : Rect} (hB : B.Nondegenerate)
    (hbdry : ∀ z ∈ frontier B.toSet, AnalyticAt ℂ f z ∧ f z ≠ 0) :
    ∃ θ : ℝ → ℝ, ContinuousOn θ (Set.Icc 0 4) ∧
      ∀ t ∈ Set.Icc (0 : ℝ) 4,
        f (rectBoundary B t) =
          (‖f (rectBoundary B t)‖ : ℂ) * Complex.exp (θ t * Complex.I) := sorry

/-! ## Layer 7: the Riemann–von Mangoldt formula -/

/-- **Layer 7.4, Riemann–von Mangoldt for `ζ`**: `N(T) = (T/2π) log(T/2πe) + O(log T)`, with
`N` counting `0 < Im ρ ≤ T` with multiplicity. The proof runs the argument principle on the
entire completion, not on `Λ`, whose poles at `0` and `1` lie on the lower edge of the contour. -/
example :
    (fun T : ℝ ↦ (zeroCountUpTo completedRiemannZeta Set.univ T : ℝ) -
        T / (2 * Real.pi) * Real.log (T / (2 * Real.pi * Real.exp 1)))
      =O[atTop] Real.log := sorry

/-- The conductor-and-degree main term in the generic Riemann--von Mangoldt formula, in the
**one-sided** normalization that matches `zeroCountUpTo`: `(T/2π) log (N (T/2πe)^d)`.

⚠ The symmetric count `N±` over `|Im ρ| ≤ T` uses the same expression with `T/π` in front:
`N±(T) = (T/π) log (N (T/2πe)^d) + O(log (N T^d))`, which is Trudgian's Theorem 2 verbatim at
`N = |d_K|`, `d = [K:ℚ]`. The conversion between the two conventions multiplies the **whole**
main term by two, and in particular it never moves a square root onto the conductor: a main
term reading `log (N^(1/2) * (T/2πe)^d)` is a different and false statement. Additivity is the
cheap check — over a factorization the counts add, the degrees add and the conductors
multiply, so the coefficient of `Real.log N` is pinned by the degree-one case, where
Trudgian's Theorem 1 gives `T/π` for the symmetric count. -/
noncomputable def riemannVonMangoldtMainTerm
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData) (T : ℝ) : ℝ :=
  T / (2 * Real.pi) *
    Real.log (((d.conductor : ℕ) : ℝ) *
      (T / (2 * Real.pi * Real.exp 1)) ^ d.degree)

/-- **Layer 7.6, the Riemann--von Mangoldt formula for a fixed card**, with the hypotheses that
make it true. ⚠ Continuation, functional equation and vertical-strip growth do **not** carry
it, and neither does adding Dirichlet agreement; the two cards below are the reason each of the
three extra hypotheses is here.

- `constantOneData` — completed function identically `1`, conductor `1`, `gammaR = {0}`, empty
  polar divisor — has continuation, functional equation and growth, has no zeros at all, and
  its degree-one main term `(T/2π) log (T/2πe)` is of order `T log T`. What excludes it is
  `hda`: no coefficient sequence makes `1` equal to `Gammaℝ s * LSeries a s` on `Re s > 1`,
  because `LSeries a s → a 1` while `1 / Gammaℝ s → 0` as `Re s → ∞`.
- `twistedZetaData` — `ζ(s) (1 + 5·2^{-s} + 2·4^{-s})` with conductor `4` and completed
  function `Λ_ζ(s) (2^s + 5 + 2^{1-s})` — has all of those **and** Dirichlet agreement with
  `coeff 1 = 1` **and** the average coefficient bound, but the Dirichlet polynomial's zeros lie
  on `Re s ≈ 2.19` and `Re s ≈ -1.19`, outside the strip, so the strip count is `N_ζ(T)` while
  the main term carries an extra `(T/2π) log 4`. What excludes it is `hconf`, the confinement
  of the zeros of the entire completion to the closed strip, which the two families get from
  their Euler products (Layer 6.5) and which no generic card provides. Continuity, finite order
  and nonvanishing somewhere do not substitute for it: the twisted card has all three.

The constants are those of a fixed card. The conductor-uniform statements are the two family
theorems below, whose quantifier order is the uniformity; an `=O[atTop]` after fixing the card
lets both the constant and the threshold depend on it, and is not a uniform statement. -/
theorem riemannVonMangoldt_generic
    (d : TauCetiRoadmap.LFunctions.AnalyticLFunctionData)
    (hc : d.HasMeromorphicContinuation) (hfe : d.HasFunctionalEquation)
    (hgrowth : HasVerticalStripGrowth d.completed)
    (hda : d.HasDirichletAgreement) (hcoeff : d.HasAverageCoefficientBound)
    (hconf : ∀ ρ : ℂ, 0 < MeromorphicOn.divisor (entireCompletion d hc) Set.univ ρ →
      0 ≤ ρ.re ∧ ρ.re ≤ 1) :
    (fun T : ℝ => (zeroCountUpTo (entireCompletion d hc) Set.univ T : ℝ) -
        riemannVonMangoldtMainTerm d T) =O[atTop]
      (fun T : ℝ => Real.log (analyticConductorAtData d (T * I))) := sorry

/-- **Layer 7.6, conductor-uniform Riemann--von Mangoldt for Dedekind zeta functions.** ⚠ The
quantifier order is the content: `C` and `T₀` are chosen from the degree `n` alone, before the
field. Trudgian's Theorem 2 is this statement in the symmetric convention with explicit
constants; `riemannVonMangoldt_generic` at `dedekindZetaData K` is the fixed-field corollary and
is not this. The count is of the completed function itself: its poles at `0` and `1` lie on the
real axis, which the half-open convention excludes. -/
theorem riemannVonMangoldt_dedekind (n : ℕ) :
    ∃ C T₀ : ℝ, 0 < C ∧ 2 ≤ T₀ ∧
      ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
        ∀ T : ℝ, T₀ ≤ T →
          |(zeroCountUpTo (TauCetiRoadmap.LFunctions.completedDedekindZeta K) Set.univ T : ℝ) -
              riemannVonMangoldtMainTerm (TauCetiRoadmap.LFunctions.dedekindZetaData K) T| ≤
            C * Real.log
              (analyticConductorAtData (TauCetiRoadmap.LFunctions.dedekindZetaData K) (T * I)) :=
  sorry

/-- **Layer 7.6, conductor-uniform Riemann--von Mangoldt for primitive finite-order Hecke
L-functions**, with the same quantifier order: `C` and `T₀` from the degree, before the field
and the character. The conductor in the main term is `heckeData`'s, `|d_K| 𝔑𝔣`. -/
theorem riemannVonMangoldt_hecke (n : ℕ) :
    ∃ C T₀ : ℝ, 0 < C ∧ 2 ≤ T₀ ∧
      ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = n →
        ∀ χ : TauCetiRoadmap.LFunctions.PrimitiveRayClassCharacter K, χ.character ≠ 1 →
          ∀ T : ℝ, T₀ ≤ T →
            |(zeroCountUpTo (TauCetiRoadmap.LFunctions.completedHeckeLFunction K χ) Set.univ T :
                ℝ) - riemannVonMangoldtMainTerm (TauCetiRoadmap.LFunctions.heckeData K χ) T| ≤
              C * Real.log
                (analyticConductorAtData (TauCetiRoadmap.LFunctions.heckeData K χ) (T * I)) :=
  sorry

/-- **The constant card**: continuation, functional equation and vertical-strip growth, no
zeros, and a main term of order `T log T`. `coeff 1 = 1` is set on purpose — the normalization
alone does not reject it; the half-plane identity does. -/
noncomputable def constantOneData : TauCetiRoadmap.LFunctions.AnalyticLFunctionData where
  coeff n := if n = 1 then 1 else 0
  conductor := 1
  gammaR := {0}
  gammaC := 0
  rootNumber := 1
  completed _ := 1
  polarOrder := 0

theorem constantOneData_hasContinuation : constantOneData.HasMeromorphicContinuation := sorry

theorem constantOneData_hasFunctionalEquation : constantOneData.HasFunctionalEquation := sorry

theorem hasVerticalStripGrowth_constantOneData :
    HasVerticalStripGrowth constantOneData.completed := sorry

/-- **The rejection test for `hda`.** The constant card has no zeros, its main term is not
within a logarithmic error of `0`, and no choice of coefficients gives it Dirichlet agreement —
so it is `hda`, and only `hda`, that keeps it out of `riemannVonMangoldt_generic`. -/
example :
    (∀ T : ℝ, zeroCountUpTo (entireCompletion constantOneData constantOneData_hasContinuation)
        Set.univ T = 0) ∧
      ¬ ((fun T : ℝ => (0 : ℝ) - riemannVonMangoldtMainTerm constantOneData T) =O[atTop]
          fun T : ℝ => Real.log (analyticConductorAtData constantOneData (T * I))) ∧
      ∀ a : ℕ → ℂ,
        ¬ ({ constantOneData with coeff := a } :
            TauCetiRoadmap.LFunctions.AnalyticLFunctionData).HasDirichletAgreement := sorry

/-- **The twisted zeta card**: `ζ(s) (1 + 5·2^{-s} + 2·4^{-s})`, coefficients
`1 + 5·[2 ∣ n] + 2·[4 ∣ n]`, conductor `4`, and completed function `Λ_ζ(s) P(s)` with
`P s = 2^s + 5 + 2^{1-s}`, since `4^{s/2} · 2^{-s}·(2^s + 5 + 2·2^{-s}) = P s`. `P` satisfies
its own degree-`0` reflection `P (1 - s) = P s`, so the card has the functional equation with
root number `1`, simple poles at `0` and `1` only (`P 0 = P 1 = 8`), vertical-strip growth,
Dirichlet agreement and the average coefficient bound. Its zeros are those of `Λ_ζ` together
with the roots of `u² + 5u + 2 = 0` under `u = 2^s`, that is the two vertical lines
`Re s = log₂ ((5 + √17)/2) ≈ 2.19` and `Re s = 1 - log₂ ((5 + √17)/2) ≈ -1.19`, all outside
the closed strip. -/
noncomputable def twistedZetaData : TauCetiRoadmap.LFunctions.AnalyticLFunctionData where
  coeff n := 1 + (if 2 ∣ n then 5 else 0) + (if 4 ∣ n then 2 else 0)
  conductor := 4
  gammaR := {0}
  gammaC := 0
  rootNumber := 1
  completed s := completedRiemannZeta s * ((2 : ℂ) ^ s + 5 + (2 : ℂ) ^ (1 - s))
  polarOrder := Finsupp.single 0 1 + Finsupp.single 1 1

theorem twistedZetaData_hasContinuation : twistedZetaData.HasMeromorphicContinuation := sorry

theorem twistedZetaData_hasFunctionalEquation : twistedZetaData.HasFunctionalEquation := sorry

/-- **The rejection test for `hconf`.** Every other hypothesis of `riemannVonMangoldt_generic`
holds for the twisted card, it has a zero of real part above `1`, and the conclusion fails — by
exactly `(T/2π) log 4`, the conductor's contribution to a main term that the strip count never
sees. -/
example :
    twistedZetaData.HasDirichletAgreement ∧ twistedZetaData.HasAverageCoefficientBound ∧
      HasVerticalStripGrowth twistedZetaData.completed ∧
      (∃ ρ : ℂ, 0 < MeromorphicOn.divisor
          (entireCompletion twistedZetaData twistedZetaData_hasContinuation) Set.univ ρ ∧
        1 < ρ.re) ∧
      ¬ ((fun T : ℝ => (zeroCountUpTo
            (entireCompletion twistedZetaData twistedZetaData_hasContinuation) Set.univ T : ℝ) -
            riemannVonMangoldtMainTerm twistedZetaData T) =O[atTop]
          fun T : ℝ => Real.log (analyticConductorAtData twistedZetaData (T * I))) := sorry

/-! ## Layer 8: effective prime, ray-class, and abelian Chebotarev estimates

The generic Abel, Perron, and Tauberian theorems are imported from
`ArithmeticDirichletSeries`. The declarations here begin only after those theorems have been
specialized to logarithmic derivatives and their contours shifted. Likewise the Frobenius
coefficient and all three Frobenius counting functions below are the exact objects imported
from `Chebotarev`; this roadmap introduces only the exceptional-zero contribution and the
effective error estimates.

⚠ The layer's endpoint is stated **on the ray-class side** (8.7), where every carrier exists:
the modulus, the ray class group and the class of an ideal are `GlobalNumberFields`', the
orthogonality identity is `LFunctions.partialZeta_eq_sum_heckeLFunctionC`, and the zero-free
input is Layer 6.4. Layer 8.8 transports 8.7 to an **abelian** extension along a reciprocity
dictionary carried as a hypothesis and discharged by `ClassFieldTheory.rayClassArtinMap`'s
splitting law. A **nonabelian** conjugacy class is out of scope: expanding its indicator in
irreducible characters produces an Artin L-function of degree above one, which no supplier
constructs and this roadmap owns no instance of.
-/

/-- **Layer 8, the offset logarithmic integral** `Li x = ∫_2^x dt / log t`, the main term of
every unweighted prime count in this layer. ⚠ `x / log x` is **not** an admissible main term for
an effective estimate: `Li x - x / log x ∼ x / log² x`, and
`(x / log² x) / (x exp(-c √log x) / log x) = exp(c √log x) / log x → ∞`, so a statement with
main term `x / log x` and error `x exp(-c √log x) / log x` is false already for `π(x)`. The
lower limit `2` is a convention; any other changes `Li` by a constant, which every error term
here absorbs. No supplier declares this function — the Arithmetic Dirichlet Series roadmap's
prose names `Li(x)` in its 6.2 and declares no carrier — so it is defined here and is a
candidate to move supplier-ward. -/
noncomputable def logarithmicIntegral (x : ℝ) : ℝ := ∫ t in (2 : ℝ)..x, 1 / Real.log t

/-- **Layer 8, `Li x` against `x / log x`**, two-sided: the difference is of exact order
`x / log² x`. This is the computation that rules out `x / log x` as a main term, and it is
also what makes `Chebotarev.tendsto_frobeniusPrimeCount` a corollary of the effective count. -/
theorem logarithmicIntegral_sub_div_log :
    (fun x : ℝ => logarithmicIntegral x - x / Real.log x) ~[atTop]
      fun x : ℝ => x / Real.log x ^ 2 := sorry

section EffectiveRayClass

open NumberField IsDedekindDomain

variable (K : Type*) [Field K] [NumberField K]

/-- **Layer 8.7, the weighted count of prime ideals in one ray class.** The partial sum, over
the ideals prime to `𝔪` of norm at most `x` whose ray class is `c`, of the supplier's ideal
von Mangoldt transform at the trivial weight — the same coefficient
`LFunctions.dedekindZeta_logDeriv_eq` uses. ⚠ Not a second ideal weight and not a second
counting carrier: the class is read through `GlobalNumberFields.idealClass`, whose domain is
the ideals prime to `𝔪`, so an ideal sharing a prime with `𝔪` is omitted from the sum rather
than assigned a junk class. -/
noncomputable def rayClassPsi (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) (x : ℝ) : ℝ := sorry

/-- **Layer 8.7**, the contribution of the exceptional zeros at the modulus `𝔪`. ⚠ This is a
**sum** over the real characters at `𝔪` that have one, not a single term: the uniqueness of
Layer 6.4f is per character, and the Landau–Page statement that would collapse the sum to one
term is not a milestone of this roadmap. -/
noncomputable def exceptionalRayClassTerm (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) (x : ℝ) : ℝ := sorry

/-- The partial-summation transform of `exceptionalRayClassTerm` appearing in the unweighted
count: `x^β / β` becomes `Li (x^β)`, by `exceptionalRayClassTerm_eq`. -/
noncomputable def exceptionalRayClassPrimeCountTerm
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) (x : ℝ) : ℝ := sorry

/-- **Layer 8.7, what the two exceptional terms are**, as one theorem. The `ψ`-level term is the
finite sum of `ψ(c) x^β / (β · #Cl_𝔪)` over the real nontrivial characters `ψ` at `𝔪` that
carry an exceptional zero `β` — a simple real zero in `(1/2, 1)` of the presented series, which
by 6.4b is a zero of the primitive one — with the weight `ψ(c) / #Cl_𝔪` coming from the
orthogonality of 8.7 and `ψ(c) = ±1` because `ψ` is real. The prime-count term is its
partial-summation transform, with `Li (x^β)` in place of `x^β / β`: substituting `u = t^β` in
`∫_2^x t^{β-1} / log t dt` gives `Li (x^β) - Li (2^β)`, and the constant is absorbed. ⚠ The
prime-count term is **not** `x^β / (β log x)`: that is only the first term of `Li (x^β)`, and
the difference is `≍ x^β / log² x`, which is not within the error unless `β` is bounded away
from `1` — which nothing here gives. ⚠ Without this theorem both terms are opaque receptacles
in which any error could be hidden, which is what `exceptionalChebotarevTerm_eq` already says
one layer up. -/
theorem exceptionalRayClassTerm_eq (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) :
    ∃ (S : Finset (TauCetiRoadmap.GlobalNumberFields.RayClassCharacter 𝔪))
      (β : TauCetiRoadmap.GlobalNumberFields.RayClassCharacter 𝔪 → ℝ),
      (∀ ψ ∈ S, ψ ≠ 1 ∧ ψ ^ 2 = 1 ∧ 1 / 2 < β ψ ∧ β ψ < 1 ∧
        meromorphicOrderAt (TauCetiRoadmap.LFunctions.heckeLFunctionC K ψ) (β ψ : ℂ) =
          (1 : WithTop ℤ)) ∧
      (∀ x : ℝ, exceptionalRayClassTerm K 𝔪 c x =
        (Nat.card (TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) : ℝ)⁻¹ *
          ∑ ψ ∈ S, ((ψ c : ℂ)).re * x ^ β ψ / β ψ) ∧
      (∀ x : ℝ, exceptionalRayClassPrimeCountTerm K 𝔪 c x =
        (Nat.card (TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) : ℝ)⁻¹ *
          ∑ ψ ∈ S, ((ψ c : ℂ)).re * logarithmicIntegral (x ^ β ψ)) := sorry

/-- **Layer 8.7, the effective count in a ray class.** The main term is `x / #Cl_𝔪`, from the
trivial character through Layer 8.5; every nontrivial character contributes through 8.6 and
Layer 6.4, with Layer 6.4b replacing an imprimitive character at `𝔪` by its primitive source.
Constants may depend on `K` and on `𝔪`, but not on `x`. ⚠ No uniformity in `𝔪` is claimed:
absorbing the exceptional term into the error would need a lower bound for `1 - β` that only
Siegel's theorem gives, and that is out of scope. At `K = ℚ` this is the prime number theorem
for arithmetic progressions with the classical error term. -/
theorem rayClassPsi_effective (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) :
    ∃ c₀ : ℝ, 0 < c₀ ∧
      (fun x : ℝ => rayClassPsi K 𝔪 c x -
          x / (Nat.card (TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪) : ℝ) +
          exceptionalRayClassTerm K 𝔪 c x) =O[atTop]
        (fun x : ℝ => x * Real.exp (-c₀ * Real.sqrt (Real.log x))) := sorry

end EffectiveRayClass

section EffectiveAbelianChebotarev

open NumberField IsDedekindDomain

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsAbelianGalois K L]

/-- **Layer 8.8, the reciprocity dictionary**, carried as a hypothesis. `Φ` is a surjection of
the ray class group at `𝔪` onto the Galois group whose splitting law identifies the Artin
class of a prime prime to `𝔪` with the image of its ray class.

⚠ This is **not** a compatibility structure invented to paper over a gap. It is an equation
between two carriers that both exist — `Chebotarev.frobeniusPrimeSet`, defined from
`NumberFieldArithmetic.artinSymbol`, and `GlobalNumberFields.idealClass` — and the object that
discharges it is `ClassFieldTheory.rayClassArtinMap`, whose splitting law that roadmap owns.
This roadmap neither restates nor approximates it, and the unconditional content transported
along it is `rayClassPsi_effective`, which needs no such hypothesis. -/
def IsReciprocityDictionary (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (C : ConjClasses (L ≃ₐ[K] L)) : Prop :=
  Function.Surjective Φ ∧
    ∀ (𝔭 : HeightOneSpectrum (𝓞 K))
      (h : 𝔭.asIdeal ∈ TauCetiRoadmap.GlobalNumberFields.integralIdealsPrimeTo 𝔪),
      (𝔭 ∈ TauCetiRoadmap.Chebotarev.frobeniusPrimeSet K L C ↔
        ConjClasses.mk (Φ (TauCetiRoadmap.GlobalNumberFields.idealClass 𝔪 ⟨𝔭.asIdeal, h⟩)) = C)

/-- **Layer 8.8**, the contribution of the exceptional real zeros. -/
noncomputable def exceptionalChebotarevTerm
    (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ := sorry

/-- The partial-summation transform of `exceptionalChebotarevTerm` appearing in the
unweighted Frobenius prime count, identified by `exceptionalChebotarevPrimeCountTerm_eq`. -/
noncomputable def exceptionalChebotarevPrimeCountTerm
    (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ := sorry

/-- **Layer 8.8, what the exceptional term is.** Under any dictionary it is the sum, over the
fibre of `C`, of the ray-class exceptional terms of 8.7. ⚠ This theorem is not decoration: an
opaque `exceptionalChebotarevTerm` makes `frobeniusPsi_effective` unfalsifiable, since any
error can be hidden in it. It is also the statement that the term does not depend on the
choice of `𝔪` and `Φ`, which is why the definition takes neither. The finsum is over a finite
set by `GlobalNumberFields.finite_rayClassGroup`, and that finiteness is a hypothesis of the
proof rather than something the notation supplies. -/
theorem exceptionalChebotarevTerm_eq (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) (x : ℝ) :
    exceptionalChebotarevTerm K L C x =
      ∑ᶠ c ∈ {c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 |
          ConjClasses.mk (Φ c) = C},
        exceptionalRayClassTerm K 𝔪 c x := sorry

/-- **Layer 8.8, what the prime-count exceptional term is**: the same fibre sum as
`exceptionalChebotarevTerm_eq`, of the ray-class prime-count terms, so that by
`exceptionalRayClassTerm_eq` it is a finite sum of weighted `Li (x^β)`. -/
theorem exceptionalChebotarevPrimeCountTerm_eq (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) (x : ℝ) :
    exceptionalChebotarevPrimeCountTerm K L C x =
      ∑ᶠ c ∈ {c : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 |
          ConjClasses.mk (Φ c) = C},
        exceptionalRayClassPrimeCountTerm K 𝔪 c x := sorry

/-- **Layer 8.8, effective Chebotarev for the weighted prime-power count, abelian only.**
Constants may depend on the fixed extension `L/K`, but not on `x`; no conductor-uniform or
fully numerical constant is claimed. ⚠ `IsAbelianGalois K L` is load-bearing, not a
simplification: for a nonabelian class the character expansion leaves the two families this
roadmap has instances for, and no milestone covers it. ⚠ The dictionary is a hypothesis and is
discharged from `ClassFieldTheory`; without it this theorem says nothing about `L/K`, which is
why `rayClassPsi_effective` and not this is the layer's unconditional content. -/
theorem frobeniusPsi_effective (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ => TauCetiRoadmap.Chebotarev.frobeniusPsi K L C x -
          ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) * x +
          exceptionalChebotarevTerm K L C x) =O[atTop]
        (fun x : ℝ => x * Real.exp (-c * Real.sqrt (Real.log x))) := sorry

/-- **Layer 8.8**, removal of prime powers on the supplier-owned Frobenius theta function. -/
theorem frobeniusTheta_effective (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ => TauCetiRoadmap.Chebotarev.frobeniusTheta K L C x -
          ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) * x +
          exceptionalChebotarevTerm K L C x) =O[atTop]
        (fun x : ℝ => x * Real.exp (-c * Real.sqrt (Real.log x))) := sorry

/-- **Layer 8.8**, partial summation on the supplier-owned Frobenius prime count. The main
term is `(#C/#G) · Li x`, and the exceptional term is the `Li (x^β)` transform of
`exceptionalChebotarevPrimeCountTerm_eq`. The qualitative limit remains
`Chebotarev.tendsto_frobeniusPrimeCount`; this is its stronger, fixed-extension error estimate.
⚠ `x / log x` cannot stand here: by `logarithmicIntegral_sub_div_log` the two main terms differ
by `≍ x / log² x`, which exceeds the displayed error, and the trivial extension below is where
that is visible. -/
theorem frobeniusPrimeCount_effective (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) :
    ∃ c : ℝ, 0 < c ∧
      (fun x : ℝ => (TauCetiRoadmap.Chebotarev.frobeniusPrimeCount K L C x : ℝ) -
          ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) *
            logarithmicIntegral x + exceptionalChebotarevPrimeCountTerm K L C x) =O[atTop]
        (fun x : ℝ => x * Real.exp (-c * Real.sqrt (Real.log x)) / Real.log x) := sorry

/-- **Layer 8.8, the `x / log x` form**, which survives only as a weaker corollary: its error
is `O(x / log² x)`, the size of `Li x - x / log x`, and the exceptional term disappears into it
because `Li (x^β) = O(x^β / log x) = o(x / log² x)` for `β < 1`. -/
theorem frobeniusPrimeCount_div_log (C : ConjClasses (L ≃ₐ[K] L))
    (𝔪 : TauCetiRoadmap.GlobalNumberFields.Modulus K)
    (Φ : TauCetiRoadmap.GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L))
    (hΦ : IsReciprocityDictionary K L 𝔪 Φ C) :
    (fun x : ℝ => (TauCetiRoadmap.Chebotarev.frobeniusPrimeCount K L C x : ℝ) -
        ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) * (x / Real.log x)) =O[atTop]
      (fun x : ℝ => x / Real.log x ^ 2) := sorry

/-- **The trivial-extension acceptance test**, `K = L = ℚ`. The Galois group is trivial, its
one conjugacy class is `⟦1⟧`, every prime is unramified with Frobenius `1`, so
`Chebotarev.frobeniusPrimeCount ℚ ℚ ⟦1⟧` is `π`; the reciprocity dictionary at `𝔪 = 1` is the
trivial map, and the exceptional term vanishes because `RayClassGroup 1` of `ℚ` is trivial and
carries no nontrivial character. `frobeniusPrimeCount_effective` then reads
`π(x) = Li x + O(x exp(-c √log x) / log x)`, de la Vallée Poussin's prime number theorem. ⚠
With `x / log x` in place of `Li x` it would read
`π(x) - x / log x = O(x exp(-c √log x) / log x)`, which `logarithmicIntegral_sub_div_log`
refutes. -/
example :
    (∀ x : ℝ, (TauCetiRoadmap.Chebotarev.frobeniusPrimeCount ℚ ℚ (ConjClasses.mk 1) x : ℝ) =
        (Nat.primeCounting ⌊x⌋₊ : ℝ)) ∧
      (∀ x : ℝ, exceptionalChebotarevPrimeCountTerm ℚ ℚ (ConjClasses.mk 1) x = 0) ∧
      ∃ c : ℝ, 0 < c ∧
        (fun x : ℝ => (Nat.primeCounting ⌊x⌋₊ : ℝ) - logarithmicIntegral x) =O[atTop]
          fun x : ℝ => x * Real.exp (-c * Real.sqrt (Real.log x)) / Real.log x := sorry

end EffectiveAbelianChebotarev

/-! ## Layer 9: certified zeros -/

/-- **Layer 9.1, a complete list of zeros in a rectangle.** `boxes` are closed rectangles
inside `R` with pairwise disjoint interiors, `mult` their multiplicities as natural numbers.
The last field is the whole point: without it the predicate says only that these are *some* of
the zeros. ⚠ Three hypotheses do work that a weaker version silently drops. `no_poles` is what
stops an omitted zero from cancelling an omitted pole in a signed total — with it, the count is
the natural-valued `zeroCount`. Boundary regularity is `meromorphicOrderAt f z = 0`, not
`f z ≠ 0`, because a total representative takes a junk value at a pole and `f z ≠ 0` neither
excludes one nor is implied by regularity. And disjointness is of *interiors*, since abutting
rectangles are the normal case and their shared edge is zero-free by the boundary hypothesis.
⚠ `Rect.Valid` is the right predicate here, and the germ-level `regular_frontier` is the right
boundary condition: certificate semantics is about counts, and a count is a statement about
germs. It follows that a certificate does **not** on its own license the contour evaluation of
Layer 7 — that needs `Rect.Nondegenerate` and pointwise analyticity and non-vanishing on the
boundary, and the bridge is `intervalIntegral_logDeriv_eq_divisorCount` under its `hcanon`
hypothesis. -/
structure HasZerosInRects (f : ℂ → ℂ) (U : Set ℂ) (R : Rect) (boxes : List Rect)
    (mult : List ℕ) : Prop where
  /-- The ambient set is open. -/
  isOpen : IsOpen U
  /-- The region has its endpoints in order. -/
  valid_region : R.Valid
  /-- Each listed rectangle has its endpoints in order. -/
  valid_boxes : ∀ B ∈ boxes, B.Valid
  /-- `f` is meromorphic on the ambient open set. -/
  meromorphic : MeromorphicOn f U
  /-- The region lies in the ambient set. -/
  region_subset : R.toSet ⊆ U
  /-- No poles in the region, so that the signed and unsigned counts agree on it. -/
  no_poles : ∀ z ∈ R.toSet, 0 ≤ MeromorphicOn.divisor f U z
  /-- Each rectangle lies in the region. -/
  boxes_subset : ∀ B ∈ boxes, B.toSet ⊆ R.toSet
  /-- The rectangles have pairwise disjoint interiors. -/
  boxes_pairwise_disjoint :
    boxes.Pairwise fun B B' ↦ Disjoint (interior B.toSet) (interior B'.toSet)
  /-- `f` is regular and nonvanishing on the boundary of the region. -/
  regular_frontier : ∀ z ∈ frontier R.toSet, meromorphicOrderAt f z = 0
  /-- `f` is regular and nonvanishing on the boundary of each rectangle. -/
  regular_frontier_box : ∀ B ∈ boxes, ∀ z ∈ frontier B.toSet, meromorphicOrderAt f z = 0
  /-- Each rectangle contains exactly the recorded number of zeros, with multiplicity. -/
  count_box : List.Forall₂ (fun B m ↦ zeroCount f U B.toSet = m) boxes mult
  /-- The list is complete: the region contains no other zeros. -/
  count_region : zeroCount f U R.toSet = mult.sum

/-- **Layer 9.2, coverage** — the theorem that says the predicate means what its name says.
Every zero of the region lies in one of the listed rectangles. ⚠ Its proof sums the nonnegative
divisor and compares; it must not subtract signed counts, which is exactly the step the
`no_poles` and `ℕ`-multiplicity choices are there to make unnecessary. -/
example (f : ℂ → ℂ) (U : Set ℂ) (R : Rect) (boxes : List Rect) (mult : List ℕ)
    (h : HasZerosInRects f U R boxes mult) (ρ : ℂ) (hρ : ρ ∈ R.toSet)
    (hpos : 0 < MeromorphicOn.divisor f U ρ) :
    ∃ B ∈ boxes, ρ ∈ B.toSet := sorry

/-- **Layer 9.4, on the critical line**, defined semantically. ⚠ "Each rectangle meets the
line `Re s = 1/2`" is *not* this predicate and does not imply it: a wide rectangle can meet the
line and contain off-line zeros. -/
def AllOnCriticalLine (f : ℂ → ℂ) (U : Set ℂ) (R : Rect) : Prop :=
  ∀ ρ ∈ R.toSet, 0 < MeromorphicOn.divisor f U ρ → ρ.re = 1 / 2

/-- **Layer 9.4, the symmetry-and-uniqueness criterion**, the one a numerical certificate can
actually supply: a rectangle invariant under `s ↦ 1 - conj s`, for a function whose *divisor*
has the same invariance, containing exactly one zero, has that zero on the critical line.
⚠ The hypothesis is on the divisor, not on the values: `Λ` satisfies
`Λ (1 - conj s) = conj (Λ s)`, not `Λ (1 - conj s) = Λ s`, and it is the zero set that the
argument uses. ⚠ Multiplicity one is essential: a reflection-conjugate pair inside the
rectangle satisfies every other hypothesis. -/
example (f : ℂ → ℂ) (U : Set ℂ) (B : Rect)
    (hU : ∀ s ∈ U, 1 - (starRingEnd ℂ) s ∈ U)
    (hf : ∀ s ∈ U, MeromorphicOn.divisor f U (1 - (starRingEnd ℂ) s) =
      MeromorphicOn.divisor f U s)
    (hB : ∀ s ∈ B.toSet, 1 - (starRingEnd ℂ) s ∈ B.toSet)
    (hcount : zeroCount f U B.toSet = 1) :
    AllOnCriticalLine f U B := sorry

/-- **Layer 9.5, `GRH` for the zeta instance is the pin's `RiemannHypothesis`.** Proving this
is what makes the general definition trustworthy; a `GRH` predicate that does not specialize
to Mathlib's statement is the wrong predicate. The bridge is that a point of positive divisor
of `completedRiemannZeta` is exactly a nontrivial zero of `riemannZeta`: the trivial zeros are
cancelled by the poles of `Gammaℝ`, and `0` and `1` are points of negative divisor. -/
example :
    (∀ ρ : ℂ, 0 < MeromorphicOn.divisor completedRiemannZeta Set.univ ρ → ρ.re = 1 / 2) ↔
      RiemannHypothesis := sorry

end TauCetiRoadmap.ZerosOfLFunctions
