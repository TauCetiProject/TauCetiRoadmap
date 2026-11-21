import Mathlib

/-!
# Mechanism design: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The one-bidder incentive lemma of README 1.2 is a
statement about two real functions on `ℝ≥0` and is stated in the README only; it is exactly the
one-bidder case (a type `ι` with one element) of the three Layer 1 theorems below. The README's
remaining targets, API lists and Checks are not restated.

Bidders form a finite type `ι`. In the single-parameter layers a bid profile is a function
`ι → ℝ≥0`, an allocation rule and a payment rule are functions `(ι → ℝ≥0) → ι → ℝ`, and a bidder
with value `v` who receives `x` and pays `p` has utility `v * x - p`. In the general environment
of Layer 3 a bid is a function `Ω → ℝ` on an outcome type `Ω`. In Layer 4 the values are
independent, bidder `i`'s value has law `μ i` on `ℝ≥0`, and expectations are taken under
`Measure.pi μ`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset
open scoped NNReal

namespace TauCetiRoadmap.MechanismDesign

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ## Layer 1: single-parameter mechanisms and Myerson's lemma -/

/-- 1.1 A mechanism `(x, p)` is dominant-strategy incentive compatible when, for every bid
profile `b`, every bidder `i` and every value `v`, bidding `v` gives bidder `i` at least the
utility of bidding `b i`, whatever the others bid. -/
def IsDSIC (x p : (ι → ℝ≥0) → ι → ℝ) : Prop :=
  ∀ (b : ι → ℝ≥0) (i : ι) (v : ℝ≥0),
    (v : ℝ) * x b i - p b i ≤ (v : ℝ) * x (Function.update b i v) i - p (Function.update b i v) i

/-- 1.1 An allocation rule is monotone when each bidder's allocation is nondecreasing in its own
bid, the other bids being fixed. -/
def IsMonotoneAlloc (x : (ι → ℝ≥0) → ι → ℝ) : Prop :=
  ∀ (b : ι → ℝ≥0) (i : ι), Monotone fun z : ℝ≥0 => x (Function.update b i z) i

/-- 1.1 Myerson's payment rule: `b i * x b i` minus the Lebesgue integral over `[0, b i]` of
bidder `i`'s allocation as a function of its own bid. -/
def myersonPayment (x : (ι → ℝ≥0) → ι → ℝ) (b : ι → ℝ≥0) (i : ι) : ℝ :=
  (b i : ℝ) * x b i - ∫ z in (0 : ℝ)..(b i : ℝ), x (Function.update b i z.toNNReal) i

/-- 1.3 Myerson's lemma, part (a): an allocation rule is implementable, that is, some payment
rule makes it dominant-strategy incentive compatible, if and only if it is monotone. -/
theorem exists_isDSIC_iff_isMonotoneAlloc (x : (ι → ℝ≥0) → ι → ℝ) :
    (∃ p, IsDSIC x p) ↔ IsMonotoneAlloc x := by
  sorry

/-- 1.3 Myerson's lemma, part (b): a monotone allocation rule with Myerson's payment rule is
dominant-strategy incentive compatible. -/
theorem isDSIC_myersonPayment {x : (ι → ℝ≥0) → ι → ℝ} (hx : IsMonotoneAlloc x) :
    IsDSIC x (myersonPayment x) := by
  sorry

/-- 1.3 Myerson's lemma, part (c): in a dominant-strategy incentive compatible mechanism each
payment is Myerson's payment plus what the bidder pays when it bids `0`. -/
theorem IsDSIC.payment_eq {x p : (ι → ℝ≥0) → ι → ℝ} (h : IsDSIC x p) (b : ι → ℝ≥0) (i : ι) :
    p b i = p (Function.update b i 0) i + myersonPayment x b i := by
  sorry

/-! ## Layer 2: second-price auctions -/

/-- 2.1 A winner rule picks, for every bid profile, a bidder with a highest bid; ties are broken
in any way. -/
def IsHighestBidder (w : (ι → ℝ≥0) → ι) : Prop :=
  ∀ (b : ι → ℝ≥0) (j : ι), b j ≤ b (w b)

/-- 2.1 The allocation of the second-price auction with reserve `r` and winner rule `w`: the
item goes to `w b` if its bid is at least `r`, and to nobody otherwise. -/
def secondPriceAlloc (w : (ι → ℝ≥0) → ι) (r : ℝ≥0) (b : ι → ℝ≥0) (i : ι) : ℝ :=
  if i = w b ∧ r ≤ b i then 1 else 0

/-- 2.1 The payment of the second-price auction with reserve `r`: the winner pays the larger of
`r` and the highest other bid (`0` when there is no other bidder); nobody else pays. -/
def secondPricePay (w : (ι → ℝ≥0) → ι) (r : ℝ≥0) (b : ι → ℝ≥0) (i : ι) : ℝ :=
  if i = w b ∧ r ≤ b i then ((max r ((univ.erase i).sup b) : ℝ≥0) : ℝ) else 0

/-- 2.1 The feasible allocations of one item, possibly fractional: nonnegative shares with sum at
most `1`. -/
def singleItem (ι : Type*) [Fintype ι] : Set (ι → ℝ) :=
  {y | (∀ i, 0 ≤ y i) ∧ ∑ i, y i ≤ 1}

/-- 2.1 The second-price auction with any reserve and any tie-breaking is dominant-strategy
incentive compatible, and every payment lies between `0` and the bid times the allocation, so
truthful bidders never pay more than their value and the seller never pays. -/
theorem isDSIC_secondPrice {w : (ι → ℝ≥0) → ι} (hw : IsHighestBidder w) (r : ℝ≥0) :
    IsDSIC (secondPriceAlloc w r) (secondPricePay w r) ∧
      ∀ b i, 0 ≤ secondPricePay w r b i ∧
        secondPricePay w r b i ≤ (b i : ℝ) * secondPriceAlloc w r b i := by
  sorry

/-- 2.2 The Vickrey auction (reserve `0`) allocates the item feasibly and maximizes the welfare
`∑ i, b i * y i` over all feasible single-item allocations `y`. -/
theorem vickrey_welfare {w : (ι → ℝ≥0) → ι} (hw : IsHighestBidder w) (b : ι → ℝ≥0) :
    secondPriceAlloc w 0 b ∈ singleItem ι ∧
      ∀ y ∈ singleItem ι, ∑ i, (b i : ℝ) * y i ≤ ∑ i, (b i : ℝ) * secondPriceAlloc w 0 b i := by
  sorry

/-- 2.2 With at least two bidders, the only dominant bid of a bidder with value `v` in the
Vickrey auction is `v`. -/
theorem vickrey_dominant_iff {w : (ι → ℝ≥0) → ι} (hw : IsHighestBidder w)
    (hι : 2 ≤ Fintype.card ι) (i : ι) (v β : ℝ≥0) :
    (∀ (b : ι → ℝ≥0) (β' : ℝ≥0),
      (v : ℝ) * secondPriceAlloc w 0 (Function.update b i β') i
          - secondPricePay w 0 (Function.update b i β') i ≤
        (v : ℝ) * secondPriceAlloc w 0 (Function.update b i β) i
          - secondPricePay w 0 (Function.update b i β) i) ↔ β = v := by
  sorry

/-! ## Layer 3: general environments, Groves and VCG mechanisms -/

variable {Ω : Type*}

/-- 3.1 A choice rule maximizes welfare when it picks, for every profile of reported valuations,
an outcome of largest total reported value. -/
def IsWelfareMaximizer (f : (ι → Ω → ℝ) → Ω) : Prop :=
  ∀ (b : ι → Ω → ℝ) (ω : Ω), ∑ j, b j ω ≤ ∑ j, b j (f b)

/-- 3.1 A mechanism with choice rule `f` and payment rule `p` in a general environment is
dominant-strategy incentive compatible when reporting the true valuation `v : Ω → ℝ` is a best
report for every agent, whatever the others report. -/
def IsDSICGeneral (f : (ι → Ω → ℝ) → Ω) (p : (ι → Ω → ℝ) → ι → ℝ) : Prop :=
  ∀ (b : ι → Ω → ℝ) (i : ι) (v : Ω → ℝ),
    v (f b) - p b i ≤ v (f (Function.update b i v)) - p (Function.update b i v) i

/-- 3.2 Groves' theorem: a welfare-maximizing choice rule, with payments equal to a term `h i`
that does not depend on agent `i`'s report minus the others' reported value of the chosen
outcome, is dominant-strategy incentive compatible. -/
theorem isDSICGeneral_groves {f : (ι → Ω → ℝ) → Ω} (hf : IsWelfareMaximizer f)
    (h : ι → (ι → Ω → ℝ) → ℝ) (hh : ∀ i b v, h i (Function.update b i v) = h i b) :
    IsDSICGeneral f (fun b i => h i b - ∑ j ∈ univ.erase i, b j (f b)) := by
  sorry

/-- 3.3 The Clarke pivot term: the largest total reported value of the agents other than `i`
over all outcomes. -/
def clarkePivot [Fintype Ω] [Nonempty Ω] (b : ι → Ω → ℝ) (i : ι) : ℝ :=
  univ.sup' univ_nonempty fun ω => ∑ j ∈ univ.erase i, b j ω

/-- 3.3 The VCG payment: the Clarke pivot term minus the others' reported value of the chosen
outcome. -/
def vcgPayment [Fintype Ω] [Nonempty Ω] (f : (ι → Ω → ℝ) → Ω) (b : ι → Ω → ℝ) (i : ι) : ℝ :=
  clarkePivot b i - ∑ j ∈ univ.erase i, b j (f b)

/-- 3.3 The VCG mechanism on a finite nonempty outcome type is dominant-strategy incentive
compatible, its payments are nonnegative, and an agent whose reported valuation is nonnegative
gets nonnegative utility. -/
theorem vcgPayment_properties [Fintype Ω] [Nonempty Ω] {f : (ι → Ω → ℝ) → Ω}
    (hf : IsWelfareMaximizer f) :
    IsDSICGeneral f (vcgPayment f) ∧ (∀ b i, 0 ≤ vcgPayment f b i) ∧
      ∀ b i, (∀ ω, 0 ≤ b i ω) → 0 ≤ b i (f b) - vcgPayment f b i := by
  sorry

/-! ## Layer 4: Bayesian incentive compatibility and expected revenue -/

/-- 4.1 The interim allocation of bidder `i` at report `z`: its expected allocation when it
reports `z` and the others report independent values with laws `μ j`. -/
def interimAlloc (μ : ι → Measure ℝ≥0) (x : (ι → ℝ≥0) → ι → ℝ) (i : ι) (z : ℝ≥0) : ℝ :=
  ∫ v, x (Function.update v i z) i ∂(Measure.pi μ)

/-- 4.1 The interim payment of bidder `i` at report `z`. -/
def interimPay (μ : ι → Measure ℝ≥0) (p : (ι → ℝ≥0) → ι → ℝ) (i : ι) (z : ℝ≥0) : ℝ :=
  ∫ v, p (Function.update v i z) i ∂(Measure.pi μ)

/-- 4.1 A mechanism is Bayesian incentive compatible for the value laws `μ` when, for every
bidder and every value `v`, reporting `v` maximizes the bidder's interim utility. -/
def IsBIC (μ : ι → Measure ℝ≥0) (x p : (ι → ℝ≥0) → ι → ℝ) : Prop :=
  ∀ (i : ι) (v z : ℝ≥0), (v : ℝ) * interimAlloc μ x i z - interimPay μ p i z ≤
    (v : ℝ) * interimAlloc μ x i v - interimPay μ p i v

/-- 4.3 The virtual value `z - (1 - F z) / f z` of a law `ν` on `ℝ` with distribution function
`F = cdf ν` and density `f`; where `f z = 0` Lean's division gives the value `z`. -/
def virtualValue (ν : Measure ℝ) (f : ℝ → ℝ) (z : ℝ) : ℝ :=
  z - (1 - cdf ν z) / f z

/-- 4.3 A law `μ` on `ℝ≥0` has density `f` that is positive above `a`: `f` is measurable, the
law seen on `ℝ` is `f` times Lebesgue measure, it gives no mass below `a`, the density is
positive at almost every point above `a` that still has mass above it, and the mean is finite. -/
structure HasPositiveDensityFrom (μ : Measure ℝ≥0) (f : ℝ → ℝ) (a : ℝ≥0) : Prop where
  measurable : Measurable f
  map_eq : μ.map ((↑) : ℝ≥0 → ℝ) = volume.withDensity fun z => ENNReal.ofReal (f z)
  support : μ (Set.Iio a) = 0
  pos : ∀ᵐ z, (a : ℝ) < z → cdf (μ.map ((↑) : ℝ≥0 → ℝ)) z < 1 → 0 < f z
  integrable : Integrable (fun z : ℝ≥0 => (z : ℝ)) μ

/-- 4.2 Revenue equivalence, interim form: two Bayesian incentive compatible mechanisms with the
same interim allocation for bidder `i` and the same interim payment at one report have the same
interim payment at every report. -/
theorem interimPay_eq_of_isBIC {μ : ι → Measure ℝ≥0} {x p x' p' : (ι → ℝ≥0) → ι → ℝ}
    (h : IsBIC μ x p) (h' : IsBIC μ x' p') (i : ι)
    (hX : interimAlloc μ x i = interimAlloc μ x' i) (z₀ : ℝ≥0)
    (h0 : interimPay μ p i z₀ = interimPay μ p' i z₀) :
    interimPay μ p i = interimPay μ p' i := by
  sorry

/-- 4.2 Revenue equivalence: under the hypotheses of `interimPay_eq_of_isBIC`, and with
integrable payments, bidder `i` pays the same in expectation in both mechanisms. -/
theorem integral_payment_eq_of_isBIC {μ : ι → Measure ℝ≥0} [∀ i, IsProbabilityMeasure (μ i)]
    {x p x' p' : (ι → ℝ≥0) → ι → ℝ} (h : IsBIC μ x p) (h' : IsBIC μ x' p') (i : ι)
    (hX : interimAlloc μ x i = interimAlloc μ x' i) (z₀ : ℝ≥0)
    (h0 : interimPay μ p i z₀ = interimPay μ p' i z₀)
    (hp : Integrable (fun v => p v i) (Measure.pi μ))
    (hp' : Integrable (fun v => p' v i) (Measure.pi μ)) :
    ∫ v, p v i ∂(Measure.pi μ) = ∫ v, p' v i ∂(Measure.pi μ) := by
  sorry

/-- 4.3 Expected payment equals expected virtual welfare: for a Bayesian incentive compatible
mechanism whose allocation to bidder `i` is measurable and bounded, with integrable payment, and a
value law of bidder `i` with a density positive above `a` and finite mean, bidder `i`'s expected
payment is the expectation of its virtual value times its allocation, minus the interim utility
of a bidder of value `a`. -/
theorem integral_payment_eq_virtualWelfare {μ : ι → Measure ℝ≥0}
    [∀ i, IsProbabilityMeasure (μ i)] {f : ι → ℝ → ℝ} {x p : (ι → ℝ≥0) → ι → ℝ}
    (h : IsBIC μ x p) (i : ι) {a : ℝ≥0} (hf : HasPositiveDensityFrom (μ i) (f i) a)
    (hxm : Measurable fun b => x b i) {C : ℝ} (hC : ∀ b, |x b i| ≤ C)
    (hp : Integrable (fun v => p v i) (Measure.pi μ)) :
    Integrable (fun v => virtualValue ((μ i).map (↑)) (f i) (v i) * x v i) (Measure.pi μ) ∧
      ∫ v, p v i ∂(Measure.pi μ) =
        ∫ v, virtualValue ((μ i).map (↑)) (f i) (v i) * x v i ∂(Measure.pi μ) -
          ((a : ℝ) * interimAlloc μ x i a - interimPay μ p i a) := by
  sorry

/-- 4.4 Myerson's optimal auction: if every value law has a density positive above `0` with
finite mean and a strictly increasing virtual value, a measurable allocation rule `xs` that
maximizes virtual welfare over a bounded feasible set `X` at every profile is monotone, so it is
dominant-strategy incentive compatible with Myerson's payments, and no Bayesian incentive
compatible mechanism with allocations in `X`, integrable payments and nonpositive interim
payment at report `0` has larger expected revenue. -/
theorem sum_integral_payment_le_myerson {μ : ι → Measure ℝ≥0} [∀ i, IsProbabilityMeasure (μ i)]
    {f : ι → ℝ → ℝ} (hf : ∀ i, HasPositiveDensityFrom (μ i) (f i) 0)
    (hreg : ∀ i, StrictMonoOn (virtualValue ((μ i).map (↑)) (f i)) (Set.Ici 0))
    {X : Set (ι → ℝ)} {C : ℝ} (hXC : ∀ y ∈ X, ∀ j, |y j| ≤ C)
    {xs : (ι → ℝ≥0) → ι → ℝ} (hxsX : ∀ b, xs b ∈ X) (hxsm : Measurable xs)
    (hxs : ∀ b, ∀ y ∈ X, ∑ j, virtualValue ((μ j).map (↑)) (f j) (b j) * y j ≤
      ∑ j, virtualValue ((μ j).map (↑)) (f j) (b j) * xs b j) :
    IsDSIC xs (myersonPayment xs) ∧
      ∀ x p : (ι → ℝ≥0) → ι → ℝ, IsBIC μ x p → (∀ b, x b ∈ X) → Measurable x →
        (∀ i, Integrable (fun v => p v i) (Measure.pi μ)) → (∀ i, interimPay μ p i 0 ≤ 0) →
          ∑ i, ∫ v, p v i ∂(Measure.pi μ) ≤ ∑ i, ∫ v, myersonPayment xs v i ∂(Measure.pi μ) := by
  sorry

/-- 4.5 For independent, identically distributed values whose law has a density positive above
`0`, finite mean and a strictly increasing virtual value, the second-price auction with a
reserve `r` at which the virtual value changes sign, and a measurable winner rule, has the
largest expected revenue among the mechanisms of `sum_integral_payment_le_myerson` for one
item. -/
theorem sum_integral_payment_le_secondPrice {μ₀ : Measure ℝ≥0} [IsProbabilityMeasure μ₀]
    {f : ℝ → ℝ} (hf : HasPositiveDensityFrom μ₀ f 0)
    (hreg : StrictMonoOn (virtualValue (μ₀.map (↑)) f) (Set.Ici 0))
    {r : ℝ≥0} (hr : 0 ≤ virtualValue (μ₀.map (↑)) f r)
    (hr' : ∀ z : ℝ≥0, z < r → virtualValue (μ₀.map (↑)) f z ≤ 0)
    {w : (ι → ℝ≥0) → ι} (hw : IsHighestBidder w) (hwm : ∀ i, MeasurableSet {b | w b = i}) :
    ∀ x p : (ι → ℝ≥0) → ι → ℝ, IsBIC (fun _ => μ₀) x p → (∀ b, x b ∈ singleItem ι) →
      Measurable x → (∀ i, Integrable (fun v => p v i) (Measure.pi fun _ => μ₀)) →
        (∀ i, interimPay (fun _ => μ₀) p i 0 ≤ 0) →
          ∑ i, ∫ v, p v i ∂(Measure.pi fun _ => μ₀) ≤
            ∑ i, ∫ v, secondPricePay w r v i ∂(Measure.pi fun _ => μ₀) := by
  sorry

end TauCetiRoadmap.MechanismDesign
