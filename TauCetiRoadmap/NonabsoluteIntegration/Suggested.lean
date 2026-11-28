module

public import Mathlib
public import TauCeti.Analysis.BoxIntegral.Oriented.Basic

/-!
# Nonabsolute integration: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The definitions carry no `sorry`. The integral is Tau Ceti's oriented interval integral
`TauCeti.BoxIntegral.HasHenstockIntervalIntegral`, imported from
`TauCeti/Analysis/BoxIntegral/Oriented/Basic.lean`, so the statements are about the library
object and its API applies to them. Two kinds of definitions appear here.

* `upperRightDini`, `lowerRightDini`, `upperLeftDini`, `lowerLeftDini` and `HasLusinN` are
  verbatim local copies of the definitions of the roadmap on real functions, derivatives and
  variation (§§1.1 and 4.3 there).
* The remaining definitions are owned by this roadmap.

The Henstock–Kurzweil integral of `f` on `[a, b]` is `HasHenstockIntervalIntegral f a b y`. A
primitive is never a defined function: a statement about the indefinite integral carries a
function `F` with the hypothesis `∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)`, so
no junk value enters. The implementation namespace of the README is `TauCeti`; the prototypes
live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Set Topology BoxIntegral TauCeti.BoxIntegral
open scoped ENNReal NNReal

namespace TauCetiRoadmap.NonabsoluteIntegration

attribute [local instance] Classical.propDecidable

/-! ## Library declarations used in the README -/

#check @BoxIntegral.HasIntegral
#check @BoxIntegral.IntegrationParams.Henstock
#check @BoxIntegral.IntegrationParams.McShane
#check @BoxIntegral.TaggedPrepartition.IsHenstock
#check @BoxIntegral.TaggedPrepartition.IsSubordinate
#check @BoxIntegral.Box.exists_taggedPartition_isHenstock_isSubordinate_homothetic
#check @BoxIntegral.Integrable.dist_integralSum_sum_integral_le_of_memBaseSet
#check @BoxIntegral.HasIntegral.unique
#check @BoxIntegral.HasIntegral.congr_ae
#check @MeasureTheory.IntegrableOn.hasBoxIntegral
#check @TauCeti.BoxIntegral.intervalBox
#check @TauCeti.BoxIntegral.HasHenstockIntervalIntegral
#check @TauCeti.BoxIntegral.HenstockIntervalIntegrable
#check @AbsolutelyContinuousOnInterval
#check @BoundedVariationOn
#check @LocallyBoundedVariationOn.exists_monotoneOn_sub_monotoneOn
#check @LocallyBoundedVariationOn.ae_differentiableAt
#check @Metric.ediam
#check @exists_polynomial_near_of_continuousOn
#check @Monotone.ae_hasDerivAt
#check @deriv

/-! ## Local copies from the roadmap on real functions, derivatives and variation -/

section Supplier

/-- Local copy of `upperRightDini` from the roadmap on real functions, derivatives and variation,
§1.1. The upper right Dini derivative `D⁺f(x) = limsup_{y → x⁺} (f y - f x) / (y - x)`, valued
in `EReal`, so that the values `⊤` and `⊥` are genuine rather than junk. -/
def upperRightDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  limsup (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[>] x)

/-- Local copy of `lowerRightDini` from the roadmap on real functions, derivatives and variation,
§1.1. The lower right Dini derivative `D₊f(x) = liminf_{y → x⁺} (f y - f x) / (y - x)`. -/
def lowerRightDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  liminf (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[>] x)

/-- Local copy of `upperLeftDini` from the roadmap on real functions, derivatives and variation,
§1.1. The upper left Dini derivative `D⁻f(x) = limsup_{y → x⁻} (f y - f x) / (y - x)`. -/
def upperLeftDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  limsup (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[<] x)

/-- Local copy of `lowerLeftDini` from the roadmap on real functions, derivatives and variation,
§1.1. The lower left Dini derivative `D₋f(x) = liminf_{y → x⁻} (f y - f x) / (y - x)`. -/
def lowerLeftDini (f : ℝ → ℝ) (x : ℝ) : EReal :=
  liminf (fun y ↦ ((slope f x y : ℝ) : EReal)) (𝓝[<] x)

/-- Local copy of `HasLusinN` from the roadmap on real functions, derivatives and variation,
§4.3. Lusin's property (N) on a set: `f` maps Lebesgue-null subsets of `s` to Lebesgue-null
sets. -/
def HasLusinN (f : ℝ → ℝ) (s : Set ℝ) : Prop :=
  ∀ t ⊆ s, volume t = 0 → volume (f '' t) = 0

end Supplier

/-! ## Layer 1: The indefinite integral -/

section Layer1

variable {f g F : ℝ → ℝ} {a b y z : ℝ}

/-- The Saks–Henstock lemma in its strong form: for every `ε > 0` there is a gauge such that,
for every Henstock tagged prepartition subordinate to it, the sum over its intervals of the
moduli of the differences between the Riemann term and the increment of the primitive is at
most `ε`. -/
theorem sum_abs_sub_le_of_hasHenstockIntervalIntegral (hab : a < b)
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)) {ε : ℝ} (hε : 0 < ε) :
    ∃ r : (Fin 1 → ℝ) → Ioi (0 : ℝ), ∀ π : TaggedPrepartition (intervalBox a b hab),
      π.IsHenstock → π.IsSubordinate r →
        ∑ J ∈ π.boxes, |f (π.tag J 0) * (J.upper 0 - J.lower 0) -
          (F (J.upper 0) - F (J.lower 0))| ≤ ε := by
  sorry

/-- The indefinite Henstock–Kurzweil integral is continuous. -/
theorem continuousOn_henstockPrimitive (hab : a ≤ b)
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)) :
    ContinuousOn F (Icc a b) := by
  sorry

/-- The indefinite Henstock–Kurzweil integral is differentiable, with derivative `f x`, at every
interior point at which `f` is continuous. -/
theorem hasDerivAt_henstockPrimitive_of_continuousAt
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)) {x : ℝ} (hx : x ∈ Ioo a b)
    (hfx : ContinuousAt f x) : HasDerivAt F (f x) x := by
  sorry

/-- Hake's theorem at the left endpoint: if `f` has integral `G c` on `[c, b]` for every
`c ∈ (a, b)`, then `f` has integral `y` on `[a, b]` iff `G c → y` as `c → a⁺`. -/
theorem hasHenstockIntervalIntegral_iff_tendsto_left (hab : a < b) {G : ℝ → ℝ}
    (hG : ∀ c ∈ Ioo a b, HasHenstockIntervalIntegral f c b (G c)) :
    HasHenstockIntervalIntegral f a b y ↔ Tendsto G (𝓝[>] a) (𝓝 y) := by
  sorry

/-- Hake's theorem at the right endpoint: if `f` has integral `G c` on `[a, c]` for every
`c ∈ (a, b)`, then `f` has integral `y` on `[a, b]` iff `G c → y` as `c → b⁻`. -/
theorem hasHenstockIntervalIntegral_iff_tendsto_right (hab : a < b) {G : ℝ → ℝ}
    (hG : ∀ c ∈ Ioo a b, HasHenstockIntervalIntegral f a c (G c)) :
    HasHenstockIntervalIntegral f a b y ↔ Tendsto G (𝓝[<] b) (𝓝 y) := by
  sorry

/-- Monotonicity: if `f ≤ g` almost everywhere on `[a, b]`, `a ≤ b`, then the integrals are
in the same order. -/
theorem HasHenstockIntervalIntegral.le_of_ae_le (hab : a ≤ b)
    (hf : HasHenstockIntervalIntegral f a b y) (hg : HasHenstockIntervalIntegral g a b z)
    (hfg : ∀ᵐ x, x ∈ Icc a b → f x ≤ g x) : y ≤ z := by
  sorry

end Layer1

/-! ## Layer 2: Measurability and the Lebesgue integral -/

section Layer2

variable {f g h F : ℝ → ℝ} {a b y : ℝ}

/-- The indefinite Henstock–Kurzweil integral has derivative `f` almost everywhere. -/
theorem ae_hasDerivAt_henstockPrimitive
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)) :
    ∀ᵐ x, x ∈ Ioo a b → HasDerivAt F (f x) x := by
  sorry

/-- A Henstock–Kurzweil integrable function is Lebesgue measurable. -/
theorem HenstockIntervalIntegrable.aemeasurable (hab : a ≤ b)
    (hf : HenstockIntervalIntegrable f a b) : AEMeasurable f (volume.restrict (Icc a b)) := by
  sorry

/-- A Henstock–Kurzweil integrable function bounded below by a Lebesgue integrable function is
Lebesgue integrable. -/
theorem HenstockIntervalIntegrable.integrableOn_of_ae_le (hab : a ≤ b)
    (hf : HenstockIntervalIntegrable f a b) (hg : IntegrableOn g (Icc a b))
    (hgf : ∀ᵐ x, x ∈ Icc a b → g x ≤ f x) : IntegrableOn f (Icc a b) := by
  sorry

/-- A function is Lebesgue integrable on `[a, b]` iff it and its modulus are Henstock–Kurzweil
integrable there. -/
theorem integrableOn_iff_henstockIntervalIntegrable_abs (hab : a ≤ b) :
    IntegrableOn f (Icc a b) ↔
      HenstockIntervalIntegrable f a b ∧ HenstockIntervalIntegrable (fun x ↦ |f x|) a b := by
  sorry

/-- A function is Lebesgue integrable on `[a, b]` iff its restriction to every measurable set is
Henstock–Kurzweil integrable there. -/
theorem integrableOn_iff_forall_henstockIntervalIntegrable_indicator (hab : a ≤ b) :
    IntegrableOn f (Icc a b) ↔
      ∀ s : Set ℝ, MeasurableSet s → HenstockIntervalIntegrable (s.indicator f) a b := by
  sorry

/-- The modulus of a McShane integrable function is McShane integrable. -/
theorem integrable_mcShane_abs (hab : a < b)
    (hf : Integrable (intervalBox a b hab) IntegrationParams.McShane (fun x ↦ f (x 0))
      BoxAdditiveMap.volume) :
    Integrable (intervalBox a b hab) IntegrationParams.McShane (fun x ↦ |f (x 0)|)
      BoxAdditiveMap.volume := by
  sorry

/-- On a compact interval the McShane integral is the Lebesgue integral. -/
theorem hasIntegral_mcShane_iff (hab : a < b) :
    HasIntegral (intervalBox a b hab) IntegrationParams.McShane (fun x ↦ f (x 0))
        BoxAdditiveMap.volume y ↔
      IntegrableOn f (Icc a b) ∧ ∫ x in a..b, f x = y := by
  sorry

/-- The monotone convergence theorem for the Henstock–Kurzweil integral. -/
theorem hasHenstockIntervalIntegral_of_monotone (hab : a ≤ b) {f : ℕ → ℝ → ℝ} {y : ℕ → ℝ}
    {L : ℝ} (hf : ∀ n, HasHenstockIntervalIntegral (f n) a b (y n))
    (hmono : ∀ᵐ x, x ∈ Icc a b → Monotone fun n ↦ f n x)
    (hlim : ∀ᵐ x, x ∈ Icc a b → Tendsto (fun n ↦ f n x) atTop (𝓝 (g x)))
    (hy : Tendsto y atTop (𝓝 L)) :
    HasHenstockIntervalIntegral g a b L := by
  sorry

/-- The dominated convergence theorem for the Henstock–Kurzweil integral, with a lower and an
upper Henstock–Kurzweil integrable bound. -/
theorem hasHenstockIntervalIntegral_of_dominated (hab : a ≤ b) {f : ℕ → ℝ → ℝ} {y : ℕ → ℝ}
    {φ : ℝ → ℝ} (hf : ∀ n, HasHenstockIntervalIntegral (f n) a b (y n))
    (hg : HenstockIntervalIntegrable g a b) (hh : HenstockIntervalIntegrable h a b)
    (hbound : ∀ n, ∀ᵐ x, x ∈ Icc a b → g x ≤ f n x ∧ f n x ≤ h x)
    (hlim : ∀ᵐ x, x ∈ Icc a b → Tendsto (fun n ↦ f n x) atTop (𝓝 (φ x))) :
    ∃ L, HasHenstockIntervalIntegral φ a b L ∧ Tendsto y atTop (𝓝 L) := by
  sorry

end Layer2

/-! ## Layer 3: Generalized absolute continuity and the descriptive characterization -/

section Layer3

variable {f F : ℝ → ℝ} {a b : ℝ} {E : Set ℝ}

/-- The finite families of nonoverlapping closed intervals with endpoints in `E`, encoded as in
Mathlib's `AbsolutelyContinuousOnInterval`: a length `n` and endpoint pairs `I i`, `i < n`. -/
def IsIntervalFamilyIn (E : Set ℝ) (p : ℕ × (ℕ → ℝ × ℝ)) : Prop :=
  (∀ i < p.1, (p.2 i).1 ∈ E ∧ (p.2 i).2 ∈ E ∧ (p.2 i).1 ≤ (p.2 i).2) ∧
    (Finset.range p.1 : Set ℕ).PairwiseDisjoint fun i ↦ Ioo (p.2 i).1 (p.2 i).2

/-- The restricted variation of `F` on `E`: the supremum, over finite families of
nonoverlapping intervals with endpoints in `E`, of the sum of the oscillations of `F` on those
intervals, valued in `ℝ≥0∞`. The oscillation on `[c, d]` sees `F` on all of `[c, d]`, not only on
`E`. -/
def eVariationStarOn (F : ℝ → ℝ) (E : Set ℝ) : ℝ≥0∞ :=
  ⨆ p : {p : ℕ × (ℕ → ℝ × ℝ) // IsIntervalFamilyIn E p},
    ∑ i ∈ Finset.range p.1.1, Metric.ediam (F '' Icc (p.1.2 i).1 (p.1.2 i).2)

/-- `F` is of generalized bounded variation in the restricted sense (`VBG*`) on `E`: `E` is a
countable union of sets on each of which the restricted variation of `F` is finite. -/
def IsVBGStarOn (F : ℝ → ℝ) (E : Set ℝ) : Prop :=
  ∃ S : ℕ → Set ℝ, ⋃ n, S n = E ∧ ∀ n, eVariationStarOn F (S n) ≠ ⊤

/-- `F` is absolutely continuous in the restricted sense (`AC*`) on `E`: for every `ε > 0` there
is `δ > 0` such that every finite family of nonoverlapping intervals with endpoints in `E` and
total length `< δ` has sum of oscillations of `F` `< ε`. -/
def AbsContStarOn (F : ℝ → ℝ) (E : Set ℝ) : Prop :=
  ∀ ε > (0 : ℝ), ∃ δ > (0 : ℝ), ∀ p : ℕ × (ℕ → ℝ × ℝ), IsIntervalFamilyIn E p →
    ∑ i ∈ Finset.range p.1, ((p.2 i).2 - (p.2 i).1) < δ →
      ∑ i ∈ Finset.range p.1, Metric.ediam (F '' Icc (p.2 i).1 (p.2 i).2) < ENNReal.ofReal ε

/-- `F` is generalized absolutely continuous in the restricted sense (`ACG*`) on `E`: `F` is
continuous on `E` and `E` is a countable union of sets on each of which `F` is `AC*`. -/
def IsACGStarOn (F : ℝ → ℝ) (E : Set ℝ) : Prop :=
  ContinuousOn F E ∧ ∃ S : ℕ → Set ℝ, ⋃ n, S n = E ∧ ∀ n, AbsContStarOn F (S n)

/-- Sanity check of the definition: the spikes `|sin (π / x)|` vanish on
`E = {0} ∪ {1/(n+1)}`, so they are absolutely continuous on `E` in the wide sense, but they are
not `AC*` on `E`: the intervals `[1/(n+2), 1/(n+1)]` have endpoints in `E`, small total length
for large `n`, and oscillation `1` each. A definition by increments `|F d - F c|` instead of
oscillations would accept this function. -/
theorem not_absContStarOn_spikes :
    ¬ AbsContStarOn (fun x ↦ |Real.sin (Real.pi / x)|)
      (insert 0 (Set.range fun n : ℕ ↦ 1 / ((n : ℝ) + 1))) := by
  sorry

/-- On an interval, absolute continuity in the restricted sense is ordinary absolute
continuity. -/
theorem absContStarOn_Icc_iff (hab : a ≤ b) :
    AbsContStarOn F (Icc a b) ↔ AbsolutelyContinuousOnInterval F a b := by
  sorry

/-- A function continuous on `[a, b]` and `AC*` on a subset `E` of `[a, b]` has finite restricted
variation on `E`. -/
theorem AbsContStarOn.eVariationStarOn_ne_top (hF : ContinuousOn F (Icc a b))
    (hE : E ⊆ Icc a b) (h : AbsContStarOn F E) : eVariationStarOn F E ≠ ⊤ := by
  sorry

/-- The Denjoy–Lusin theorem: a function that is `VBG*` on a set `E` has a finite derivative at
almost every point of `E`. -/
theorem IsVBGStarOn.ae_differentiableAt (h : IsVBGStarOn F E) :
    ∀ᵐ x, x ∈ E → DifferentiableAt ℝ F x := by
  sorry

/-- For a function continuous on `[a, b]` and a closed subset `E` of `[a, b]`: `F` is `ACG*` on
`E` iff it is `VBG*` on `E` and has Lusin's property (N) on `E`. -/
theorem isACGStarOn_iff_isVBGStarOn_and_hasLusinN (hF : ContinuousOn F (Icc a b))
    (hE : IsClosed E) (hEab : E ⊆ Icc a b) :
    IsACGStarOn F E ↔ IsVBGStarOn F E ∧ HasLusinN F E := by
  sorry

/-- An `ACG*` function on `[a, b]` whose derivative vanishes almost everywhere is constant. -/
theorem IsACGStarOn.eq_of_ae_hasDerivAt_zero (h : IsACGStarOn F (Icc a b))
    (h0 : ∀ᵐ x, x ∈ Icc a b → HasDerivAt F 0 x) : ∀ x ∈ Icc a b, F x = F a := by
  sorry

/-- The indefinite Henstock–Kurzweil integral is `ACG*`. -/
theorem isACGStarOn_henstockPrimitive (hab : a ≤ b)
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x)) :
    IsACGStarOn F (Icc a b) := by
  sorry

/-- The descriptive characterization of the Henstock–Kurzweil integral (the restricted Denjoy
integral): `F - F a` is the indefinite integral of `f` on `[a, b]` iff `F` is `ACG*` on `[a, b]`
with derivative `f` almost everywhere. -/
theorem hasHenstockIntervalIntegral_iff_isACGStarOn (hab : a ≤ b) :
    (∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x - F a)) ↔
      IsACGStarOn F (Icc a b) ∧ ∀ᵐ x, x ∈ Icc a b → HasDerivAt F (f x) x := by
  sorry

/-- An `ACG*` function on `[a, b]` with nonnegative derivative almost everywhere is monotone. -/
theorem IsACGStarOn.monotoneOn_of_ae_deriv_nonneg (h : IsACGStarOn F (Icc a b))
    (h0 : ∀ᵐ x, x ∈ Icc a b → 0 ≤ deriv F x) : MonotoneOn F (Icc a b) := by
  sorry

/-- A function continuous on `[a, b]` and differentiable at every point of `(a, b)` outside a
countable set is `ACG*` on `[a, b]`. -/
theorem isACGStarOn_of_differentiableAt_off_countable {s : Set ℝ} (hs : s.Countable)
    (hc : ContinuousOn F (Icc a b)) (hd : ∀ x ∈ Ioo a b \ s, DifferentiableAt ℝ F x) :
    IsACGStarOn F (Icc a b) := by
  sorry

end Layer3

/-! ## Layer 4: The Perron integral -/

section Layer4

variable {f w M m F : ℝ → ℝ} {a b y : ℝ}

/-- `M` is a Perron major function of `f` on `[a, b]`: its lower right Dini derivative is at
least `f x` at every `x ∈ [a, b)`, and its lower left Dini derivative is at least `f x` at every
`x ∈ (a, b]`. Since `f x` is real, both lower derivatives are `> -∞` there. -/
def IsPerronMajor (f M : ℝ → ℝ) (a b : ℝ) : Prop :=
  (∀ x ∈ Ico a b, (f x : EReal) ≤ lowerRightDini M x) ∧
    ∀ x ∈ Ioc a b, (f x : EReal) ≤ lowerLeftDini M x

/-- `m` is a Perron minor function of `f` on `[a, b]`: its upper right Dini derivative is at most
`f x` on `[a, b)` and its upper left Dini derivative is at most `f x` on `(a, b]`. -/
def IsPerronMinor (f m : ℝ → ℝ) (a b : ℝ) : Prop :=
  (∀ x ∈ Ico a b, upperRightDini m x ≤ (f x : EReal)) ∧
    ∀ x ∈ Ioc a b, upperLeftDini m x ≤ (f x : EReal)

/-- The upper Perron integral: the infimum of `M b - M a` over major functions, in `EReal`, so
that it is `⊤` when there is no major function. -/
def perronUpper (f : ℝ → ℝ) (a b : ℝ) : EReal :=
  ⨅ (M : ℝ → ℝ) (_ : IsPerronMajor f M a b), ((M b - M a : ℝ) : EReal)

/-- The lower Perron integral: the supremum of `m b - m a` over minor functions, in `EReal`, so
that it is `⊥` when there is no minor function. -/
def perronLower (f : ℝ → ℝ) (a b : ℝ) : EReal :=
  ⨆ (m : ℝ → ℝ) (_ : IsPerronMinor f m a b), ((m b - m a : ℝ) : EReal)

/-- `f` is Perron integrable on `[a, b]` with integral `y`: the upper and lower Perron integrals
both equal `y`. -/
def HasPerronIntegral (f : ℝ → ℝ) (a b y : ℝ) : Prop :=
  perronUpper f a b = y ∧ perronLower f a b = y

/-- Sanity check of the definition: the endpoint `b` carries a condition. The function equal to
`-1` at `1` and to `0` elsewhere has every Dini derivative `0` on `[0, 1)`, but its left
difference quotients at `1` tend to `-∞`, so it is not a major function of `0` on `[0, 1]`. A
definition that imposed the left condition only on `(a, b)` would accept it, and the upper
Perron integral of `0` would be at most `-1`. -/
theorem not_isPerronMajor_endpoint_jump :
    ¬ IsPerronMajor (fun _ ↦ 0) (fun x ↦ if x = 1 then -1 else 0) 0 1 := by
  sorry

/-- A function whose lower Dini derivatives are nonnegative on `[a, b]` (right ones on `[a, b)`,
left ones on `(a, b]`) is monotone on `[a, b]`; no continuity is assumed. -/
theorem monotoneOn_of_lowerDini_nonneg (hr : ∀ x ∈ Ico a b, 0 ≤ lowerRightDini w x)
    (hl : ∀ x ∈ Ioc a b, 0 ≤ lowerLeftDini w x) : MonotoneOn w (Icc a b) := by
  sorry

/-- A major function minus a minor function is monotone on `[a, b]`. -/
theorem IsPerronMajor.monotoneOn_sub (hM : IsPerronMajor f M a b) (hm : IsPerronMinor f m a b) :
    MonotoneOn (M - m) (Icc a b) := by
  sorry

/-- The lower Perron integral is at most the upper one. -/
theorem perronLower_le_perronUpper (hab : a ≤ b) : perronLower f a b ≤ perronUpper f a b := by
  sorry

/-- Sanity check of the definition: a function with a derivative relative to `[a, b]` at every
point of `[a, b]` is a major and a minor function of its derivative, so the derivative has Perron
integral `F b - F a`; for `F x = x² sin (x⁻²)` on `[0, 1]` the derivative is not Lebesgue
integrable. -/
theorem hasPerronIntegral_of_hasDerivWithinAt (hab : a ≤ b)
    (hF : ∀ x ∈ Icc a b, HasDerivWithinAt F (f x) (Icc a b) x) :
    HasPerronIntegral f a b (F b - F a) := by
  sorry

/-- The Perron integral is the Henstock–Kurzweil integral. -/
theorem hasPerronIntegral_iff (hab : a ≤ b) :
    HasPerronIntegral f a b y ↔ HasHenstockIntervalIntegral f a b y := by
  sorry

end Layer4

/-! ## Layer 5: Multipliers and the Alexiewicz norm -/

section Layer5

variable {f g F : ℝ → ℝ} {a b : ℝ}

/-- Integration by parts with an absolutely continuous factor. -/
theorem hasHenstockIntervalIntegral_mul_of_absolutelyContinuousOnInterval (hab : a ≤ b)
    (hF : ∀ x ∈ Icc a b, HasHenstockIntervalIntegral f a x (F x))
    (hg : AbsolutelyContinuousOnInterval g a b) :
    HasHenstockIntervalIntegral (fun x ↦ f x * g x) a b
      (F b * g b - ∫ x in a..b, F x * deriv g x) := by
  sorry

/-- Functions of bounded variation are multipliers for the Henstock–Kurzweil integral. -/
theorem HenstockIntervalIntegrable.mul_of_boundedVariationOn
    (hf : HenstockIntervalIntegrable f a b) (hg : BoundedVariationOn g (uIcc a b)) :
    HenstockIntervalIntegrable (fun x ↦ f x * g x) a b := by
  sorry

/-- The space of Henstock–Kurzweil integrable functions is not complete for the Alexiewicz
norm `‖f‖ = sup_{x ∈ [0, 1]} |∫₀ˣ f|`: there are integrable `fₙ` whose primitives converge
uniformly on `[0, 1]` to a function that is the primitive of no integrable function. -/
theorem exists_tendstoUniformlyOn_not_henstockPrimitive :
    ∃ (f F : ℕ → ℝ → ℝ) (G : ℝ → ℝ),
      (∀ n, ∀ x ∈ Icc (0 : ℝ) 1, HasHenstockIntervalIntegral (f n) 0 x (F n x)) ∧
        TendstoUniformlyOn F G atTop (Icc 0 1) ∧
          ¬ ∃ g : ℝ → ℝ, ∀ x ∈ Icc (0 : ℝ) 1, HasHenstockIntervalIntegral g 0 x (G x) := by
  sorry

end Layer5

end TauCetiRoadmap.NonabsoluteIntegration
