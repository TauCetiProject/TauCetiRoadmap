module

public import Mathlib
public import TauCeti.Analysis.Holder.Normed

/-!
# Young integration and rough paths: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Time is real; a path is a map `ℝ → E` used on
a closed interval `Icc a b`, and a two-parameter map `ℝ → ℝ → E` is used on the simplex
`a ≤ s ≤ t ≤ b`. Rough paths are finite-dimensional, over `Vec d = EuclideanSpace ℝ (Fin d)`.
Tensors of degree `n` over `ℝ^d` are written in coordinates indexed by words: the second level of
a rough path lives in `Ten2 d = EuclideanSpace ℝ (Fin d × Fin d)`, whose norm is the
Hilbert–Schmidt norm, and functionals of all degrees are maps on `List (Fin d)`. Quantities that
can be infinite (variations, rough path distances) take values in `ℝ≥0∞`.

`rEVariationOn` and `ControlOn` follow the shapes of the Mathlib pull requests cited in the
README under *Exact supplier contracts*. The predicate `IsBrownian` is a local copy of the vector
Brownian motion of StochasticCalculus §1.2.
The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal Distributions

namespace TauCetiRoadmap.YoungIntegrationAndRoughPaths

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: variation, Hölder paths and controls -/

section Variation

variable {α E : Type*} [LinearOrder α] [PseudoEMetricSpace E]

/-- The `r`-variation of `f` on `s`, in the shape of the Mathlib pull request cited in the README:
for `0 < r < ∞`, the supremum over finite monotone sequences `u` in `s` of
`(∑ edist (f (u (i+1))) (f (u i)) ^ r)^(1/r)`; at `r = ⊤` the oscillation, at `r = 0` the
number of jumps. -/
def rEVariationOn (r : ℝ≥0∞) (f : α → E) (s : Set α) : ℝ≥0∞ :=
  if r = 0 then ⨆ p : { t : ℕ → α // Monotone t ∧ ∀ i, t i ∈ s },
    ((Function.support fun i : ℕ ↦ edist (f (p.val (i + 1))) (f (p.val i))).encard : ℝ≥0∞)
  else if r = ⊤ then ⨆ j : s × s, edist (f j.1) (f j.2)
  else ⨆ p : ℕ × { u : ℕ → α // Monotone u ∧ ∀ i, u i ∈ s },
    (∑ i ∈ Finset.range p.1, edist (f (p.2.1 (i + 1))) (f (p.2.1 i)) ^ r.toReal) ^ r.toReal⁻¹

/-- 1.1: `r ↦ rEVariationOn r f s` is antitone on `(0, ∞)`. -/
theorem rEVariationOn_anti {r r' : ℝ≥0∞} (hr : r ≠ 0) (hrr' : r ≤ r') (hr' : r' ≠ ⊤)
    (f : α → E) (s : Set α) : rEVariationOn r' f s ≤ rEVariationOn r f s := by
  sorry

/-- Check of Layer 1: the `1`-variation is Mathlib's variation, so `rEVariationOn` extends
`eVariationOn`; at `r = 1` both are the same supremum. -/
theorem rEVariationOn_one (f : α → E) (s : Set α) : rEVariationOn 1 f s = eVariationOn f s := by
  simp [rEVariationOn, eVariationOn]

end Variation

/-- A control on `s`, in the shape of the Mathlib pull request cited in the README: a function of
two variables, continuous on the ordered pairs of `s`, vanishing on the diagonal and
superadditive. -/
structure ControlOn (α : Type*) [PartialOrder α] [TopologicalSpace α] (s : Set α) where
  /-- The underlying two-variable function. -/
  toFun : α → α → ℝ≥0
  /-- Superadditivity on `s`. -/
  superadd ⦃a⦄ (_ : a ∈ s) ⦃b⦄ (_ : b ∈ s) ⦃c⦄ (_ : c ∈ s) :
    a ≤ b → b ≤ c → toFun a b + toFun b c ≤ toFun a c
  /-- The diagonal vanishes. -/
  zero_diag ⦃a⦄ : toFun a a = 0
  /-- Continuity on the ordered pairs of `s`. -/
  continuous : ContinuousOn (fun p : α × α ↦ toFun p.1 p.2) {p | p ∈ s ×ˢ s ∧ p.1 ≤ p.2}

section Controls

variable {E : Type*} [NormedAddCommGroup E]

/-- 1.2: the `p`-th power of the `p`-variation of a continuous path of finite `p`-variation,
`p ≥ 1`, is a control. -/
theorem exists_controlOn_rEVariationOn {a b p : ℝ} (hp : 1 ≤ p) {X : ℝ → E}
    (hX : ContinuousOn X (Icc a b)) (hfin : rEVariationOn (ENNReal.ofReal p) X (Icc a b) ≠ ⊤) :
    ∃ ω : ControlOn ℝ (Icc a b), ∀ s ∈ Icc a b, ∀ t ∈ Icc a b, s ≤ t →
      ((ω.toFun s t : ℝ≥0) : ℝ≥0∞) = rEVariationOn (ENNReal.ofReal p) X (Icc s t) ^ p := by
  sorry

/-- 1.2: an `α`-Hölder path has finite `1/α`-variation, bounded by `C (b - a)^α`. -/
theorem rEVariationOn_inv_le_of_holderOnWith {a b : ℝ} (hab : a ≤ b) {C α : ℝ≥0}
    (hα : 0 < α) (hα1 : α ≤ 1) {X : ℝ → E} (hX : HolderOnWith C α X (Icc a b)) :
    rEVariationOn ((α⁻¹ : ℝ≥0) : ℝ≥0∞) X (Icc a b) ≤ C * ENNReal.ofReal ((b - a) ^ (α : ℝ)) := by
  sorry

end Controls

/-! ## Layer 2: the sewing lemma, Young integration and Young equations -/

section Sewing

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The dyadic Riemann sum of a two-parameter map `Ξ` over `[s, t]` with `2 ^ n` pieces. -/
def dyadicSum (Ξ : ℝ → ℝ → E) (s t : ℝ) (n : ℕ) : E :=
  ∑ k ∈ Finset.range (2 ^ n),
    Ξ (s + k * (t - s) / 2 ^ n) (s + (k + 1) * (t - s) / 2 ^ n)

/-- The sewing map: the limit of the dyadic Riemann sums of `Ξ` over `[s, t]`. -/
def sewing (Ξ : ℝ → ℝ → E) (s t : ℝ) : E :=
  limUnder atTop (dyadicSum Ξ s t)

/-- Riemann sums of `Ξ` along partitions of `[s, t]` tend to `I` as the mesh tends to zero. -/
def HasPartitionLimit (Ξ : ℝ → ℝ → E) (s t : ℝ) (I : E) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ (n : ℕ) (u : Fin (n + 1) → ℝ), Monotone u → u 0 = s →
    u (Fin.last n) = t → (∀ i : Fin n, u i.succ - u i.castSucc < δ) →
      ‖(∑ i : Fin n, Ξ (u i.castSucc) (u i.succ)) - I‖ < ε

/-- 2.1, **the sewing lemma** in Hölder form. -/
theorem sewing_spec [CompleteSpace E] {a b γ C : ℝ} (hab : a ≤ b) (hγ : 1 < γ) (hC : 0 ≤ C)
    {Ξ : ℝ → ℝ → E}
    (hδ : ∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b →
      ‖Ξ s t - Ξ s u - Ξ u t‖ ≤ C * (t - s) ^ γ) :
    (∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b → sewing Ξ s t = sewing Ξ s u + sewing Ξ u t) ∧
    (∀ s t, a ≤ s → s ≤ t → t ≤ b →
      ‖sewing Ξ s t - Ξ s t‖ ≤ C / (1 - 2 ^ (1 - γ)) * (t - s) ^ γ) ∧
    (∀ s t, a ≤ s → s ≤ t → t ≤ b → HasPartitionLimit Ξ s t (sewing Ξ s t)) ∧
    (∀ (I : ℝ → ℝ → E) (γ' K : ℝ), 1 < γ' →
      (∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b → I s t = I s u + I u t) →
      (∀ s t, a ≤ s → s ≤ t → t ≤ b → ‖I s t - Ξ s t‖ ≤ K * (t - s) ^ γ') →
      ∀ s t, a ≤ s → s ≤ t → t ≤ b → I s t = sewing Ξ s t) := by
  sorry

/-- 2.1, **the sewing lemma** with a control: the defect bounded by `ω(s, t) ^ θ`, `θ > 1`, with
the constant `1 / (1 - 2 ^ (1 - θ))` of Friz–Victoir, Lemma 6.2. -/
theorem sewing_spec_control [CompleteSpace E] {a b θ : ℝ} (hab : a ≤ b) (hθ : 1 < θ)
    (ω : ControlOn ℝ (Icc a b)) {Ξ : ℝ → ℝ → E}
    (hδ : ∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b →
      ‖Ξ s t - Ξ s u - Ξ u t‖ ≤ (ω.toFun s t : ℝ) ^ θ) :
    (∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b →
      sewing Ξ s t = sewing Ξ s u + sewing Ξ u t) ∧
    (∀ s t, a ≤ s → s ≤ t → t ≤ b →
      ‖sewing Ξ s t - Ξ s t‖ ≤ 1 / (1 - 2 ^ (1 - θ)) * (ω.toFun s t : ℝ) ^ θ) ∧
    (∀ s t, a ≤ s → s ≤ t → t ≤ b → HasPartitionLimit Ξ s t (sewing Ξ s t)) := by
  sorry

end Sewing

section Young

variable {E F W : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [NormedAddCommGroup W] [NormedSpace ℝ W]

/-- The Young integral `∫_s^t Y dX`: the sewing of the left-point increments `Y u (X v - X u)`. -/
def youngIntegral (X : ℝ → E) (Y : ℝ → E →L[ℝ] F) (s t : ℝ) : F :=
  sewing (fun u v ↦ Y u (X v - X u)) s t

/-- 2.2, **Young's integral for Hölder paths**. -/
theorem youngIntegral_holder [CompleteSpace F] {a b : ℝ} (hab : a ≤ b) {Cx Cy α β : ℝ≥0}
    (hαβ : 1 < (α : ℝ) + β) {X : ℝ → E} {Y : ℝ → E →L[ℝ] F}
    (hX : HolderOnWith Cx α X (Icc a b)) (hY : HolderOnWith Cy β Y (Icc a b)) :
    (∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b →
      youngIntegral X Y s t = youngIntegral X Y s u + youngIntegral X Y u t) ∧
    ∀ s t, a ≤ s → s ≤ t → t ≤ b →
      ‖youngIntegral X Y s t - Y s (X t - X s)‖ ≤
        Cx * Cy / (1 - 2 ^ (1 - ((α : ℝ) + β))) * (t - s) ^ ((α : ℝ) + β) := by
  sorry

/-- 2.2, **the Young–Loève estimate** for paths of complementary finite variation. -/
theorem youngIntegral_variation [CompleteSpace F] {a b p q : ℝ} (hab : a ≤ b) (hp : 1 ≤ p)
    (hq : 1 ≤ q) (hpq : 1 < 1 / p + 1 / q) {X : ℝ → E} {Y : ℝ → E →L[ℝ] F}
    (hXc : ContinuousOn X (Icc a b)) (hYc : ContinuousOn Y (Icc a b))
    (hX : rEVariationOn (ENNReal.ofReal p) X (Icc a b) ≠ ⊤)
    (hY : rEVariationOn (ENNReal.ofReal q) Y (Icc a b) ≠ ⊤) :
    (∀ s u t, a ≤ s → s ≤ u → u ≤ t → t ≤ b →
      youngIntegral X Y s t = youngIntegral X Y s u + youngIntegral X Y u t) ∧
    (∀ s t, a ≤ s → s ≤ t → t ≤ b →
      ‖youngIntegral X Y s t - Y s (X t - X s)‖ₑ ≤
        ENNReal.ofReal (1 / (1 - 2 ^ (1 - (1 / p + 1 / q)))) *
          rEVariationOn (ENNReal.ofReal p) X (Icc s t) *
          rEVariationOn (ENNReal.ofReal q) Y (Icc s t)) ∧
    rEVariationOn (ENNReal.ofReal p) (fun t ↦ youngIntegral X Y a t) (Icc a b) ≠ ⊤ := by
  sorry

/-- 2.2: for a `C¹` integrator the Young integral is the Riemann integral of `Y r (X' r)`. -/
theorem youngIntegral_eq_intervalIntegral [CompleteSpace F] {a b : ℝ} (hab : a ≤ b)
    {X : ℝ → E} {Y : ℝ → E →L[ℝ] F} (hX : ContDiff ℝ 1 X) (hY : ContinuousOn Y (Icc a b))
    {s t : ℝ} (hs : a ≤ s) (hst : s ≤ t) (ht : t ≤ b) :
    youngIntegral X Y s t = ∫ r in s..t, Y r (deriv X r) := by
  sorry

/-- A solution of the Young differential equation `dY = f(Y) dX` on `[0, T]` started at `ξ`. -/
def IsYoungSolution (f : W → E →L[ℝ] W) (X : ℝ → E) (ξ : W) (T : ℝ) (Y : ℝ → W) : Prop :=
  ContinuousOn Y (Icc 0 T) ∧
    ∀ t ∈ Icc 0 T, Y t = ξ + youngIntegral X (fun r ↦ f (Y r)) 0 t

/-- 2.3, **existence, uniqueness and continuity for Young equations**, `1 ≤ p < 2`, with
`f ∈ C_b²`. -/
theorem exists_unique_isYoungSolution [CompleteSpace W] {p T M : ℝ} (hp : 1 ≤ p) (hp2 : p < 2)
    (hT : 0 ≤ T) {f : W → E →L[ℝ] W} (hf : ContDiff ℝ 2 f)
    (hfb : ∀ k ≤ 2, ∀ y, ‖iteratedFDeriv ℝ k f y‖ ≤ M) {X : ℝ → E}
    (hXc : ContinuousOn X (Icc 0 T)) (hX : rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ⊤)
    (ξ : W) :
    ∃ Y : ℝ → W, IsYoungSolution f X ξ T Y ∧
      rEVariationOn (ENNReal.ofReal p) Y (Icc 0 T) ≠ ⊤ ∧
      ∀ Z : ℝ → W, IsYoungSolution f X ξ T Z →
        rEVariationOn (ENNReal.ofReal p) Z (Icc 0 T) ≠ ⊤ → EqOn Z Y (Icc 0 T) := by
  sorry

/-- 2.3: the solution map of Young equations is continuous in `p`-variation, and the solutions
converge uniformly. -/
theorem tendsto_isYoungSolution [CompleteSpace W] {p T M : ℝ} (hp : 1 ≤ p) (hp2 : p < 2)
    {f : W → E →L[ℝ] W} (hf : ContDiff ℝ 2 f)
    (hfb : ∀ k ≤ 2, ∀ y, ‖iteratedFDeriv ℝ k f y‖ ≤ M)
    {X : ℝ → E} {Xn : ℕ → ℝ → E} {ξ : W} {ξn : ℕ → W} {Y : ℝ → W} {Yn : ℕ → ℝ → W}
    (hXc : ContinuousOn X (Icc 0 T)) (hXnc : ∀ n, ContinuousOn (Xn n) (Icc 0 T))
    (hXv : rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ⊤)
    (hXlim : Tendsto (fun n ↦ rEVariationOn (ENNReal.ofReal p) (Xn n - X) (Icc 0 T)) atTop (𝓝 0))
    (hξ : Tendsto ξn atTop (𝓝 ξ))
    (hY : IsYoungSolution f X ξ T Y) (hYv : rEVariationOn (ENNReal.ofReal p) Y (Icc 0 T) ≠ ⊤)
    (hYn : ∀ n, IsYoungSolution f (Xn n) (ξn n) T (Yn n))
    (hYnv : ∀ n, rEVariationOn (ENNReal.ofReal p) (Yn n) (Icc 0 T) ≠ ⊤) :
    Tendsto (fun n ↦ rEVariationOn (ENNReal.ofReal p) (Yn n - Y) (Icc 0 T)) atTop (𝓝 0) ∧
      TendstoUniformlyOn Yn Y atTop (Icc 0 T) := by
  sorry

end Young

/-! ## Layer 3: signatures, multiplicative functionals and the extension theorem -/

section Signature

/-- The coordinate space `ℝ^d`. -/
abbrev Vec (d : ℕ) := EuclideanSpace ℝ (Fin d)

/-- The iterated integral of `X` along the word `w`: `∫_{s<r₁<⋯<rₙ<t} dX^{w₁}_{r₁} ⋯ dX^{wₙ}_{rₙ}`,
built letter by letter from the front by Young integration. -/
def sigCoord {d : ℕ} (X : ℝ → Vec d) : List (Fin d) → ℝ → ℝ → ℝ
  | [], _, _ => 1
  | i :: w, s, t =>
      youngIntegral (fun r ↦ X r i) (fun r ↦ sigCoord X w r t • ContinuousLinearMap.id ℝ ℝ) s t

/-- The shuffles of two words. -/
def shuffle {β : Type*} : List β → List β → List (List β)
  | [], v => [v]
  | u, [] => [u]
  | a :: u, b :: v => (shuffle u (b :: v)).map (a :: ·) ++ (shuffle (a :: u) v).map (b :: ·)

/-- The Hilbert–Schmidt norm of the degree-`n` part of a map on words. -/
def levelNorm {d : ℕ} (M : List (Fin d) → ℝ) (n : ℕ) : ℝ :=
  Real.sqrt (∑ w : Fin n → Fin d, M (List.ofFn w) ^ 2)

variable {d : ℕ}

/-- 3.1, **Chen's identity** for paths of finite `p`-variation, `p < 2`. -/
theorem sigCoord_chen {a b p : ℝ} (hp : 1 ≤ p) (hp2 : p < 2) {X : ℝ → Vec d}
    (hXc : ContinuousOn X (Icc a b)) (hX : rEVariationOn (ENNReal.ofReal p) X (Icc a b) ≠ ⊤)
    (w : List (Fin d)) {s u t : ℝ} (hs : a ≤ s) (hsu : s ≤ u) (hut : u ≤ t) (ht : t ≤ b) :
    sigCoord X w s t =
      ∑ k ∈ Finset.range (w.length + 1), sigCoord X (w.take k) s u * sigCoord X (w.drop k) u t := by
  sorry

/-- 3.1, **the shuffle identity** for paths of finite `p`-variation, `p < 2`. -/
theorem sigCoord_shuffle {a b p : ℝ} (hp : 1 ≤ p) (hp2 : p < 2) {X : ℝ → Vec d}
    (hXc : ContinuousOn X (Icc a b)) (hX : rEVariationOn (ENNReal.ofReal p) X (Icc a b) ≠ ⊤)
    (u v : List (Fin d)) {s t : ℝ} (hs : a ≤ s) (hst : s ≤ t) (ht : t ≤ b) :
    sigCoord X u s t * sigCoord X v s t = ((shuffle u v).map fun w ↦ sigCoord X w s t).sum := by
  sorry

/-- 3.1, **factorial decay** of the signature of a path of bounded variation. -/
theorem levelNorm_sigCoord_le {s t : ℝ} (hst : s ≤ t) {X : ℝ → Vec d}
    (hXc : ContinuousOn X (Icc s t)) (hX : BoundedVariationOn X (Icc s t)) (n : ℕ) :
    levelNorm (fun w ↦ sigCoord X w s t) n ≤ (eVariationOn X (Icc s t)).toReal ^ n / n.factorial := by
  sorry

/-- A multiplicative functional of degree `N` on `[0, T]` (`N = ⊤` for all degrees), in word
coordinates: value `1` on the empty word, and continuity on the simplex and Chen's identity on
words of length at most `N`; the values on longer words are not constrained. -/
structure IsMultiplicative (N : ℕ∞) (T : ℝ) (M : List (Fin d) → ℝ → ℝ → ℝ) : Prop where
  nil : ∀ s t, M [] s t = 1
  chen : ∀ w : List (Fin d), (w.length : ℕ∞) ≤ N → ∀ s u t, 0 ≤ s → s ≤ u → u ≤ t → t ≤ T →
    M w s t = ∑ k ∈ Finset.range (w.length + 1), M (w.take k) s u * M (w.drop k) u t
  cont : ∀ w : List (Fin d), (w.length : ℕ∞) ≤ N →
    ContinuousOn (fun q : ℝ × ℝ ↦ M w q.1 q.2) {q | 0 ≤ q.1 ∧ q.1 ≤ q.2 ∧ q.2 ≤ T}

/-- The constant of the extension theorem, `p² (1 + ∑_{k ≥ 1} (2 / k) ^ ((⌊p⌋ + 1) / p))`. -/
def lyonsBeta (p : ℝ) : ℝ :=
  p ^ 2 * (1 + ∑' k : ℕ, (2 / ((k : ℝ) + 1)) ^ (((⌊p⌋₊ : ℝ) + 1) / p))

/-- `M` has finite `p`-variation controlled by `ω` with constant `β`, at the degrees `1 ≤ n ≤ N`:
`‖M^n_{s,t}‖ ≤ ω(s,t)^{n/p} / (β Γ(n/p + 1))`. -/
def HasPVariation (p β : ℝ) (N : ℕ∞) (T : ℝ) (ω : ControlOn ℝ (Icc 0 T))
    (M : List (Fin d) → ℝ → ℝ → ℝ) : Prop :=
  ∀ n : ℕ, 1 ≤ n → (n : ℕ∞) ≤ N → ∀ s t, 0 ≤ s → s ≤ t → t ≤ T →
    levelNorm (fun w ↦ M w s t) n ≤
      (ω.toFun s t : ℝ) ^ ((n : ℝ) / p) / (β * Real.Gamma ((n : ℝ) / p + 1))

/-- 3.2, **Lyons' extension theorem**. -/
theorem exists_unique_extension {p T : ℝ} (hp : 1 ≤ p) {ω : ControlOn ℝ (Icc 0 T)}
    {M : List (Fin d) → ℝ → ℝ → ℝ} (hM : IsMultiplicative (⌊p⌋₊ : ℕ∞) T M)
    (hω : HasPVariation p (lyonsBeta p) (⌊p⌋₊ : ℕ∞) T ω M) :
    ∃ M' : List (Fin d) → ℝ → ℝ → ℝ, IsMultiplicative ⊤ T M' ∧
      (∀ w : List (Fin d), w.length ≤ ⌊p⌋₊ → M' w = M w) ∧
      HasPVariation p (lyonsBeta p) ⊤ T ω M' ∧
      ∀ M'' : List (Fin d) → ℝ → ℝ → ℝ, IsMultiplicative ⊤ T M'' →
        (∀ w : List (Fin d), w.length ≤ ⌊p⌋₊ → M'' w = M w) →
        (∃ (ω'' : ControlOn ℝ (Icc 0 T)) (β'' : ℝ), 0 < β'' ∧ HasPVariation p β'' ⊤ T ω'' M'') →
        ∀ w s t, 0 ≤ s → s ≤ t → t ≤ T → M'' w s t = M' w s t := by
  sorry

/-- A weakly geometric `p`-rough path: a multiplicative functional of degree `⌊p⌋` with finite
`p`-variation whose coordinates satisfy the shuffle identity on words of total length at most
`⌊p⌋`. -/
def IsWeaklyGeometricPRoughPath (p T : ℝ) (M : List (Fin d) → ℝ → ℝ → ℝ) : Prop :=
  IsMultiplicative (⌊p⌋₊ : ℕ∞) T M ∧
    (∃ ω : ControlOn ℝ (Icc 0 T), HasPVariation p (lyonsBeta p) (⌊p⌋₊ : ℕ∞) T ω M) ∧
    ∀ u v : List (Fin d), u.length + v.length ≤ ⌊p⌋₊ → ∀ s t, 0 ≤ s → s ≤ t → t ≤ T →
      M u s t * M v s t = ((shuffle u v).map fun w ↦ M w s t).sum

/-- 3.3: the Lyons extension of a weakly geometric `p`-rough path satisfies the shuffle identity
at every length. -/
theorem shuffle_of_extension {p T : ℝ} (hp : 1 ≤ p) {M M' : List (Fin d) → ℝ → ℝ → ℝ}
    (hM : IsWeaklyGeometricPRoughPath p T M) (hM' : IsMultiplicative ⊤ T M')
    (hagree : ∀ w : List (Fin d), w.length ≤ ⌊p⌋₊ → M' w = M w)
    (hvar : ∃ (ω : ControlOn ℝ (Icc 0 T)) (β : ℝ), 0 < β ∧ HasPVariation p β ⊤ T ω M')
    (u v : List (Fin d)) {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t) (ht : t ≤ T) :
    M' u s t * M' v s t = ((shuffle u v).map fun w ↦ M' w s t).sum := by
  sorry

/-- 3.3: the signature of a path of finite `p`-variation, `p < 2`, is the Lyons extension of its
increments: a multiplicative functional of all degrees with finite `p`-variation. -/
theorem sigCoord_isMultiplicative {p T : ℝ} (hp : 1 ≤ p) (hp2 : p < 2) {X : ℝ → Vec d}
    (hXc : ContinuousOn X (Icc 0 T)) (hX : rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ⊤) :
    IsMultiplicative ⊤ T (sigCoord X) ∧
      ∃ (ω : ControlOn ℝ (Icc 0 T)) (β : ℝ), 0 < β ∧ HasPVariation p β ⊤ T ω (sigCoord X) := by
  sorry

end Signature

/-! ## Layer 4: Hölder rough paths and controlled integration -/

section RoughPaths

variable {d : ℕ}

/-- Second-level tensors over `ℝ^d`, with the Hilbert–Schmidt norm. -/
abbrev Ten2 (d : ℕ) := EuclideanSpace ℝ (Fin d × Fin d)

/-- The tensor product `x ⊗ y` of two vectors. -/
def outer (x y : Vec d) : Ten2 d := WithLp.toLp 2 fun ij ↦ x ij.1 * y ij.2

/-- The transpose of a second-level tensor. -/
def transpose2 (A : Ten2 d) : Ten2 d := WithLp.toLp 2 fun ij ↦ A (ij.2, ij.1)

/-- `(X, XX)` is an `α`-Hölder rough path on `[0, T]`: Chen's relation for all triples of times,
`‖X_t - X_s‖ ≤ C |t - s| ^ α` and `‖XX s t‖ ≤ C |t - s| ^ (2α)`. -/
structure IsHolderRoughPath (α T : ℝ) (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d) : Prop where
  chen : ∀ s ∈ Icc 0 T, ∀ u ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
    XX s t = XX s u + XX u t + outer (X u - X s) (X t - X u)
  holder : ∃ C, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖X t - X s‖ ≤ C * |t - s| ^ α
  holder₂ : ∃ C, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖XX s t‖ ≤ C * |t - s| ^ (2 * α)

/-- Weak geometricity: the symmetric part of `XX s t` is `½ (X_t - X_s) ⊗ (X_t - X_s)`. -/
def IsWeaklyGeometric (T : ℝ) (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d) : Prop :=
  ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
    XX s t + transpose2 (XX s t) = outer (X t - X s) (X t - X s)

/-- The inhomogeneous `α`-Hölder rough path distance on `[0, T]`, in `ℝ≥0∞`. -/
def roughPathDist (α T : ℝ) (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d)
    (Y : ℝ → Vec d) (YY : ℝ → ℝ → Ten2 d) : ℝ≥0∞ :=
  (⨆ (s : ℝ) (t : ℝ) (_ : 0 ≤ s ∧ s < t ∧ t ≤ T),
      ‖(X t - X s) - (Y t - Y s)‖ₑ / ENNReal.ofReal ((t - s) ^ α)) +
    ⨆ (s : ℝ) (t : ℝ) (_ : 0 ≤ s ∧ s < t ∧ t ≤ T),
      ‖XX s t - YY s t‖ₑ / ENNReal.ofReal ((t - s) ^ (2 * α))

/-- The canonical lift `∫_s^t (X_r - X_s) ⊗ dX_r` of a `C¹` path. -/
def canonicalLift (X : ℝ → Vec d) (s t : ℝ) : Ten2 d :=
  ∫ r in s..t, outer (X r - X s) (deriv X r)

/-- A geometric `α`-Hölder rough path: an `α`-Hölder rough path that is a limit of canonical lifts
of `C¹` paths in the `α`-Hölder rough path distance. -/
def IsGeometric (α T : ℝ) (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d) : Prop :=
  IsHolderRoughPath α T X XX ∧ ∃ Xn : ℕ → ℝ → Vec d, (∀ n, ContDiff ℝ 1 (Xn n)) ∧
    Tendsto (fun n ↦ roughPathDist α T (Xn n) (canonicalLift (Xn n)) X XX) atTop (𝓝 0)

/-- 4.1: the canonical lift of a `C¹` path is a weakly geometric `α`-Hölder rough path. -/
theorem isHolderRoughPath_canonicalLift {α T : ℝ} (hα : 0 < α) (hα1 : α ≤ 1) {X : ℝ → Vec d}
    (hX : ContDiff ℝ 1 X) :
    IsHolderRoughPath α T X (canonicalLift X) ∧ IsWeaklyGeometric T X (canonicalLift X) := by
  sorry

/-- 4.1: geometric rough paths are weakly geometric. -/
theorem IsGeometric.isWeaklyGeometric {α T : ℝ} (hα : 0 < α) {X : ℝ → Vec d}
    {XX : ℝ → ℝ → Ten2 d} (h : IsGeometric α T X XX) : IsWeaklyGeometric T X XX := by
  sorry

/-- 4.1, **geodesic approximation**: a weakly geometric `β`-Hölder rough path is a geometric
`α`-Hölder rough path for every `α < β`. -/
theorem isGeometric_of_isWeaklyGeometric {α β T : ℝ} (hα : 1 / 3 < α) (hαβ : α < β)
    (hβ : β ≤ 1 / 2) {X : ℝ → Vec d} {XX : ℝ → ℝ → Ten2 d} (hX : IsHolderRoughPath β T X XX)
    (hg : IsWeaklyGeometric T X XX) : IsGeometric α T X XX := by
  sorry

variable {W U : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
  [NormedAddCommGroup U] [NormedSpace ℝ U]

/-- `(Y, Y')` is controlled by `X` on `[0, T]`: `Y'` is `α`-Hölder and the remainder
`Y_t - Y_s - Y'_s (X_t - X_s)` is bounded by `C |t - s| ^ (2α)`. -/
structure IsControlled (α T : ℝ) (X : ℝ → Vec d) (Y : ℝ → W) (Y' : ℝ → Vec d →L[ℝ] W) :
    Prop where
  deriv_holder : ∃ C, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖Y' t - Y' s‖ ≤ C * |t - s| ^ α
  remainder : ∃ C, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
    ‖Y t - Y s - Y' s (X t - X s)‖ ≤ C * |t - s| ^ (2 * α)

/-- The distance `‖Y' - Yt'‖_α + ‖R^Y - R^Yt‖_{2α}` between controlled paths over two drivers,
in `ℝ≥0∞`; against the zero path over the same driver it is the seminorm of `(Y, Y')`. -/
def controlledDist (α T : ℝ) (X : ℝ → Vec d) (Y : ℝ → W) (Y' : ℝ → Vec d →L[ℝ] W)
    (Xt : ℝ → Vec d) (Yt : ℝ → W) (Yt' : ℝ → Vec d →L[ℝ] W) : ℝ≥0∞ :=
  (⨆ (s : ℝ) (t : ℝ) (_ : 0 ≤ s ∧ s < t ∧ t ≤ T),
      ‖(Y' t - Y' s) - (Yt' t - Yt' s)‖ₑ / ENNReal.ofReal ((t - s) ^ α)) +
    ⨆ (s : ℝ) (t : ℝ) (_ : 0 ≤ s ∧ s < t ∧ t ≤ T),
      ‖(Y t - Y s - Y' s (X t - X s)) - (Yt t - Yt s - Yt' s (Xt t - Xt s))‖ₑ /
        ENNReal.ofReal ((t - s) ^ (2 * α))

/-- The contraction `B(A) = ∑ᵢⱼ Aᵢⱼ B(eᵢ, eⱼ)` of a bilinear map with a second-level tensor. -/
def contract2 (B : Vec d →L[ℝ] Vec d →L[ℝ] W) (A : Ten2 d) : W :=
  ∑ i, ∑ j, A (i, j) • B (EuclideanSpace.single i 1) (EuclideanSpace.single j 1)

/-- The rough integral `∫_s^t Y dX`: the sewing of `Y_u X_{u,v} + Y'_u XX_{u,v}`. -/
def roughIntegral (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d) (Y : ℝ → Vec d →L[ℝ] W)
    (Y' : ℝ → Vec d →L[ℝ] Vec d →L[ℝ] W) (s t : ℝ) : W :=
  sewing (fun u v ↦ Y u (X v - X u) + contract2 (Y' u) (XX u v)) s t

/-- 4.2, **Gubinelli's rough integral**. -/
theorem roughIntegral_spec [CompleteSpace W] {α : ℝ} (hα : 1 / 3 < α) (hα2 : α ≤ 1 / 2) :
    ∃ C : ℝ, 0 < C ∧ ∀ {T Kx Kxx Kd Kr : ℝ} {X : ℝ → Vec d} {XX : ℝ → ℝ → Ten2 d}
      {Y : ℝ → Vec d →L[ℝ] W} {Y' : ℝ → Vec d →L[ℝ] Vec d →L[ℝ] W},
      0 ≤ T → IsHolderRoughPath α T X XX →
      (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖X t - X s‖ ≤ Kx * |t - s| ^ α) →
      (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖XX s t‖ ≤ Kxx * |t - s| ^ (2 * α)) →
      (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖Y' t - Y' s‖ ≤ Kd * |t - s| ^ α) →
      (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖Y t - Y s - Y' s (X t - X s)‖ ≤ Kr * |t - s| ^ (2 * α)) →
      (∀ s u t, 0 ≤ s → s ≤ u → u ≤ t → t ≤ T →
        roughIntegral X XX Y Y' s t = roughIntegral X XX Y Y' s u + roughIntegral X XX Y Y' u t) ∧
      (∀ s t, 0 ≤ s → s ≤ t → t ≤ T →
        ‖roughIntegral X XX Y Y' s t - Y s (X t - X s) - contract2 (Y' s) (XX s t)‖ ≤
          C * (Kx * Kr + Kxx * Kd) * (t - s) ^ (3 * α)) ∧
      IsControlled α T X (fun t ↦ roughIntegral X XX Y Y' 0 t) Y := by
  sorry

/-- 4.3, **stability of rough integration**: local Lipschitz continuity in the rough path and the
controlled integrand. -/
theorem roughIntegral_lipschitz [CompleteSpace W] {α T R : ℝ} (hα : 1 / 3 < α) (hα2 : α ≤ 1 / 2)
    (hT : 0 ≤ T) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ {X Xt : ℝ → Vec d} {XX XXt : ℝ → ℝ → Ten2 d}
      {Y Yt : ℝ → Vec d →L[ℝ] W} {Y' Yt' : ℝ → Vec d →L[ℝ] Vec d →L[ℝ] W},
      IsHolderRoughPath α T X XX → IsHolderRoughPath α T Xt XXt →
      roughPathDist α T X XX 0 0 ≤ ENNReal.ofReal R →
      roughPathDist α T Xt XXt 0 0 ≤ ENNReal.ofReal R →
      ‖Y' 0‖ₑ + controlledDist α T X Y Y' X 0 0 ≤ ENNReal.ofReal R →
      ‖Yt' 0‖ₑ + controlledDist α T Xt Yt Yt' Xt 0 0 ≤ ENNReal.ofReal R →
      controlledDist α T X (fun t ↦ roughIntegral X XX Y Y' 0 t) Y
          Xt (fun t ↦ roughIntegral Xt XXt Yt Yt' 0 t) Yt ≤
        C * (roughPathDist α T X XX Xt XXt + ‖Y' 0 - Yt' 0‖ₑ +
          ENNReal.ofReal (T ^ α) * controlledDist α T X Y Y' Xt Yt Yt') := by
  sorry

/-- 4.3: for a `C¹` path with its canonical lift, the rough integral of a controlled integrand is
the Riemann integral `∫_s^t Y_r (X'_r) dr`, whatever the Gubinelli derivative. -/
theorem roughIntegral_canonicalLift [CompleteSpace W] {α T : ℝ} (hα : 1 / 3 < α)
    (hα2 : α ≤ 1 / 2) {X : ℝ → Vec d} (hX : ContDiff ℝ 1 X) {Y : ℝ → Vec d →L[ℝ] W}
    {Y' : ℝ → Vec d →L[ℝ] Vec d →L[ℝ] W} (hY : IsControlled α T X Y Y')
    {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t) (ht : t ≤ T) :
    roughIntegral X (canonicalLift X) Y Y' s t = ∫ r in s..t, Y r (deriv X r) := by
  sorry

/-- 4.4, **composition**: a `C_b²` function of a controlled path is controlled, with Gubinelli
derivative `Dφ(Y_s) ∘ Y'_s`. -/
theorem IsControlled.comp {α T M : ℝ} (hα : 0 < α) {X : ℝ → Vec d} {Y : ℝ → W}
    {Y' : ℝ → Vec d →L[ℝ] W} (hY : IsControlled α T X Y Y')
    (hXh : ∃ C, ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, ‖X t - X s‖ ≤ C * |t - s| ^ α)
    {φ : W → U} (hφ : ContDiff ℝ 2 φ) (hφb : ∀ k ≤ 2, ∀ y, ‖iteratedFDeriv ℝ k φ y‖ ≤ M) :
    IsControlled α T X (fun t ↦ φ (Y t)) (fun s ↦ (fderiv ℝ φ (Y s)).comp (Y' s)) := by
  sorry

/-! ## Layer 5: rough differential equations -/

/-- The Gubinelli derivative `Df(Y_s) ∘ f(Y_s)` of `f(Y)` along a solution of `dY = f(Y) dX`. -/
def rdeDeriv (f : W → Vec d →L[ℝ] W) (Y : ℝ → W) (s : ℝ) : Vec d →L[ℝ] Vec d →L[ℝ] W :=
  (fderiv ℝ f (Y s)).comp (f (Y s))

/-- `Y` solves the rough differential equation `dY = f(Y) dX` on `[0, T]` from `ξ`, driven by
`(X, XX)`: `(Y, f(Y))` is controlled by `X` and `Y_t = ξ + ∫_0^t f(Y) dX`. -/
def IsRDESolution (α T : ℝ) (f : W → Vec d →L[ℝ] W) (X : ℝ → Vec d) (XX : ℝ → ℝ → Ten2 d)
    (ξ : W) (Y : ℝ → W) : Prop :=
  IsControlled α T X Y (fun s ↦ f (Y s)) ∧
    ∀ t ∈ Icc 0 T, Y t = ξ + roughIntegral X XX (fun s ↦ f (Y s)) (rdeDeriv f Y) 0 t

/-- 5.1, **existence and uniqueness of RDE solutions** for `f ∈ C_b³`. -/
theorem exists_unique_isRDESolution [CompleteSpace W] {α T M : ℝ} (hα : 1 / 3 < α)
    (hα2 : α < 1 / 2) (hT : 0 ≤ T) {f : W → Vec d →L[ℝ] W} (hf : ContDiff ℝ 3 f)
    (hfb : ∀ k ≤ 3, ∀ y, ‖iteratedFDeriv ℝ k f y‖ ≤ M) {X : ℝ → Vec d} {XX : ℝ → ℝ → Ten2 d}
    (hX : IsHolderRoughPath α T X XX) (ξ : W) :
    ∃ Y : ℝ → W, IsRDESolution α T f X XX ξ Y ∧
      ∀ Z : ℝ → W, IsRDESolution α T f X XX ξ Z → EqOn Z Y (Icc 0 T) := by
  sorry

/-- 5.2, **the universal limit theorem**: the Itô–Lyons map is locally Lipschitz in the initial
value and the rough path. -/
theorem rdeSolution_lipschitz [CompleteSpace W] {α T M R : ℝ} (hα : 1 / 3 < α) (hα2 : α < 1 / 2)
    (hT : 0 ≤ T) {f : W → Vec d →L[ℝ] W} (hf : ContDiff ℝ 3 f)
    (hfb : ∀ k ≤ 3, ∀ y, ‖iteratedFDeriv ℝ k f y‖ ≤ M) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ {X Xt : ℝ → Vec d} {XX XXt : ℝ → ℝ → Ten2 d} {ξ ξt : W} {Y Yt : ℝ → W},
      IsHolderRoughPath α T X XX → IsHolderRoughPath α T Xt XXt →
      roughPathDist α T X XX 0 0 ≤ ENNReal.ofReal R →
      roughPathDist α T Xt XXt 0 0 ≤ ENNReal.ofReal R →
      IsRDESolution α T f X XX ξ Y → IsRDESolution α T f Xt XXt ξt Yt →
      (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
        ‖(Y t - Yt t) - (Y s - Yt s)‖ₑ ≤
          C * (‖ξ - ξt‖ₑ + roughPathDist α T X XX Xt XXt) * ENNReal.ofReal (|t - s| ^ α)) ∧
      controlledDist α T X Y (fun s ↦ f (Y s)) Xt Yt (fun s ↦ f (Yt s)) ≤
        C * (‖ξ - ξt‖ₑ + roughPathDist α T X XX Xt XXt) := by
  sorry

/-- 5.3: driven by the canonical lift of a `C¹` path, the RDE solution solves the ODE
`Y' = f(Y) X'`. -/
theorem hasDerivWithinAt_of_isRDESolution_canonicalLift [CompleteSpace W] {α T : ℝ}
    (hα : 1 / 3 < α) (hα2 : α < 1 / 2) {f : W → Vec d →L[ℝ] W} (hf : ContDiff ℝ 3 f)
    {X : ℝ → Vec d} (hX : ContDiff ℝ 1 X) {ξ : W} {Y : ℝ → W}
    (hY : IsRDESolution α T f X (canonicalLift X) ξ Y) :
    ∀ t ∈ Icc 0 T, HasDerivWithinAt Y (f (Y t) (deriv X t)) (Icc 0 T) t := by
  sorry

/-- 5.4, **the geometric chain rule**: along an RDE solution driven by a weakly geometric rough
path, `F(Y_t) = F(ξ) + ∫_0^t DF(Y) f(Y) dX`, with integrand `g(Y)`, `g y = DF(y) ∘ f(y)`. -/
theorem chain_rule_of_isWeaklyGeometric [CompleteSpace W] [CompleteSpace U] {α T : ℝ}
    (hα : 1 / 3 < α) (hα2 : α < 1 / 2) {f : W → Vec d →L[ℝ] W} (hf : ContDiff ℝ 3 f)
    {X : ℝ → Vec d} {XX : ℝ → ℝ → Ten2 d} (hX : IsHolderRoughPath α T X XX)
    (hg : IsWeaklyGeometric T X XX) {ξ : W} {Y : ℝ → W} (hY : IsRDESolution α T f X XX ξ Y)
    {F : W → U} (hF : ContDiff ℝ 3 F) :
    ∀ t ∈ Icc 0 T, F (Y t) = F ξ + roughIntegral X XX
      (fun s ↦ (fderiv ℝ F (Y s)).comp (f (Y s)))
      (fun s ↦ (fderiv ℝ (fun y ↦ (fderiv ℝ F y).comp (f y)) (Y s)).comp (f (Y s))) 0 t := by
  sorry

end RoughPaths

/-! ## Layer 6: Hölder–Besov distributions and reconstruction -/

section Reconstruction

/-- Euclidean space `ℝ^m`, the base of distributions. -/
abbrev Sp (m : ℕ) := EuclideanSpace ℝ (Fin m)

/-- The test functions on all of `ℝ^m`. -/
abbrev Test (m : ℕ) := 𝓓((⊤ : TopologicalSpace.Opens (Sp m)), ℝ)

/-- The distributions on all of `ℝ^m`. -/
abbrev Distr (m : ℕ) := 𝓓'((⊤ : TopologicalSpace.Opens (Sp m)), ℝ)

variable {m : ℕ}

/-- `𝓑_r`: test functions supported in the closed unit ball with `C^r` norm at most `1`. -/
def testBall (m r : ℕ) : Set (Test m) :=
  {φ | tsupport φ ⊆ Metric.closedBall 0 1 ∧ ∀ k ≤ r, ∀ y, ‖iteratedFDeriv ℝ k φ y‖ ≤ 1}

/-- `ψ = φ^λ_x`, the rescaling `y ↦ λ^{-m} φ(λ⁻¹ (y - x))`. -/
def IsRescaled (φ ψ : Test m) (x : Sp m) (l : ℝ) : Prop :=
  ∀ y, ψ y = l ^ (-(m : ℝ)) * φ (l⁻¹ • (y - x))

/-- The local Hölder–Besov space `𝒞^α`, `α < 0`: `|ξ(φ^λ_x)| ≤ C λ^α` for `φ ∈ 𝓑_r`,
`r = ⌊-α⌋ + 1`, `λ ∈ (0, 1]`, locally uniformly in `x`. -/
def IsHolderBesov (α : ℝ) (ξ : Distr m) : Prop :=
  ∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ l ∈ Ioc (0 : ℝ) 1,
    ∀ φ ∈ testBall m (⌊-α⌋₊ + 1), ∀ ψ : Test m, IsRescaled φ ψ x l → |ξ ψ| ≤ C * l ^ α

/-- A regularity structure in the sense of Friz–Hairer, Definition 13.1, with a distinguished
finite basis `ι`: degrees, and a structure group of linear automorphisms such that `Γ τ - τ` has
only components of lower degree than `τ`. Friz–Hairer's definition has no unit element. -/
structure RegStructure where
  /-- The basis symbols. -/
  ι : Type
  [fintype : Fintype ι]
  /-- The degree (homogeneity) of each symbol. -/
  deg : ι → ℝ
  /-- The structure group. -/
  G : Subgroup ((ι → ℝ) ≃ₗ[ℝ] (ι → ℝ))
  /-- `Γ τ - τ` has only components of lower degree than `τ`. -/
  triangular : ∀ Γ ∈ G, ∀ i j, Γ (Pi.single j 1) i ≠ (if i = j then 1 else 0) → deg i < deg j

attribute [instance] RegStructure.fintype

/-- The realisation `Pm_x τ = ∑ᵢ τᵢ Pm_x(eᵢ)`. -/
def realize (𝒯 : RegStructure) (Pm : Sp m → 𝒯.ι → Distr m) (x : Sp m) (τ : 𝒯.ι → ℝ) : Distr m :=
  ∑ i, τ i • Pm x i

/-- `(Pm, Γ)` is a model of `𝒯` on `ℝ^m`, tested against `𝓑_r` with `r > -min deg`. -/
structure IsModel (𝒯 : RegStructure) (r : ℕ) (Pm : Sp m → 𝒯.ι → Distr m)
    (Γ : Sp m → Sp m → (𝒯.ι → ℝ) ≃ₗ[ℝ] (𝒯.ι → ℝ)) : Prop where
  r_gt : ∀ i, -(r : ℝ) < 𝒯.deg i
  mem : ∀ x y, Γ x y ∈ 𝒯.G
  mul : ∀ x y z, Γ x y * Γ y z = Γ x z
  compat : ∀ x y τ, realize 𝒯 Pm x (Γ x y τ) = realize 𝒯 Pm y τ
  boundPm : ∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ l ∈ Ioc (0 : ℝ) 1,
    ∀ φ ∈ testBall m r, ∀ ψ : Test m, IsRescaled φ ψ x l → ∀ i, |Pm x i ψ| ≤ C * l ^ 𝒯.deg i
  boundΓ : ∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ y ∈ K, ∀ i j,
    𝒯.deg i < 𝒯.deg j → |Γ x y (Pi.single j 1) i| ≤ C * ‖x - y‖ ^ (𝒯.deg j - 𝒯.deg i)

/-- `f` is a modelled distribution of regularity `γ`: components of degree at least `γ` vanish
and `|(f x - Γ x y (f y))ᵢ| ≤ C ‖x - y‖ ^ (γ - deg i)` locally uniformly. -/
def IsModelled (𝒯 : RegStructure) (Γ : Sp m → Sp m → (𝒯.ι → ℝ) ≃ₗ[ℝ] (𝒯.ι → ℝ)) (γ : ℝ)
    (f : Sp m → 𝒯.ι → ℝ) : Prop :=
  (∀ x i, γ ≤ 𝒯.deg i → f x i = 0) ∧
    ∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ y ∈ K, ∀ i,
      |(f x - Γ x y (f y)) i| ≤ C * ‖x - y‖ ^ (γ - 𝒯.deg i)

/-- 6.2, **the reconstruction theorem**, `γ > 0`. -/
theorem exists_unique_reconstruction (𝒯 : RegStructure) {r : ℕ} {Pm : Sp m → 𝒯.ι → Distr m}
    {Γ : Sp m → Sp m → (𝒯.ι → ℝ) ≃ₗ[ℝ] (𝒯.ι → ℝ)} (hM : IsModel 𝒯 r Pm Γ) {γ : ℝ} (hγ : 0 < γ)
    {f : Sp m → 𝒯.ι → ℝ} (hf : IsModelled 𝒯 Γ γ f) :
    ∃! Rf : Distr m, ∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ l ∈ Ioc (0 : ℝ) 1,
      ∀ φ ∈ testBall m r, ∀ ψ : Test m, IsRescaled φ ψ x l →
        |(Rf - realize 𝒯 Pm x (f x)) ψ| ≤ C * l ^ γ := by
  sorry

/-- 6.3, **the product of a Hölder function and a Hölder–Besov distribution**, `0 < α < β < 1`:
the unique distribution `B` with `|(B - f(x) ξ)(φ^λ_x)| ≤ C λ^{β - α}`; it lies in `𝒞^{-α}` and
equals `f g` when `ξ` is a continuous function `g`. -/
theorem exists_unique_holderBesov_mul {α β : ℝ} (hα : 0 < α) (hαβ : α < β) (hβ : β < 1)
    {f : Sp m → ℝ} (hf : ∀ K : Set (Sp m), IsCompact K →
      ∃ C : ℝ≥0, HolderOnWith C (Real.toNNReal β) f K)
    {ξ : Distr m} (hξ : IsHolderBesov (-α) ξ) :
    ∃! B : Distr m, (∀ K : Set (Sp m), IsCompact K → ∃ C, ∀ x ∈ K, ∀ l ∈ Ioc (0 : ℝ) 1,
        ∀ φ ∈ testBall m (⌊α⌋₊ + 1), ∀ ψ : Test m, IsRescaled φ ψ x l →
          |(B - f x • ξ) ψ| ≤ C * l ^ (β - α)) ∧
      IsHolderBesov (-α) B ∧
      ∀ g : Sp m → ℝ, Continuous g → ξ = Distribution.ofFun ⊤ g volume ⊤ →
        B = Distribution.ofFun ⊤ (fun y ↦ f y * g y) volume ⊤ := by
  sorry

end Reconstruction

/-! ## Layer 7: Brownian and Gaussian rough paths -/

section Stochastic

variable {Ω : Type*} {mΩ : MeasurableSpace Ω} {d : ℕ}

/-- Local copy of the `d`-dimensional standard Brownian motion of StochasticCalculus §1.2:
independent real Brownian coordinates. There it is the predicate `IsBrownianVector P B` on
`B : Fin d → ℝ≥0 → Ω → ℝ`; here the coordinates are packed into `Vec d`. -/
def IsBrownian (B : ℝ≥0 → Ω → Vec d) (P : Measure Ω) : Prop :=
  (∀ i, IsBrownianReal (fun t ω ↦ B t ω i) P) ∧
    iIndepFun (fun (i : Fin d) (ω : Ω) (t : ℝ≥0) ↦ B t ω i) P

/-- The path `t ↦ B_{t⁺}` on the real line. -/
def realPath (B : ℝ≥0 → Ω → Vec d) (ω : Ω) (t : ℝ) : Vec d := B t.toNNReal ω

/-- The Itô lift: the limit of the dyadic left-point sums of `(B_u - B_s) ⊗ (B_v - B_u)`. -/
def itoLift (B : ℝ≥0 → Ω → Vec d) (ω : Ω) (s t : ℝ) : Ten2 d :=
  limUnder atTop (dyadicSum
    (fun u v ↦ outer (realPath B ω u - realPath B ω s) (realPath B ω v - realPath B ω u)) s t)

/-- The identity tensor `∑ᵢ eᵢ ⊗ eᵢ`. -/
def idTensor (d : ℕ) : Ten2 d := WithLp.toLp 2 fun ij ↦ if ij.1 = ij.2 then 1 else 0

/-- The Stratonovich lift `itoLift + ½ (t - s) I`. -/
def stratLift (B : ℝ≥0 → Ω → Vec d) (ω : Ω) (s t : ℝ) : Ten2 d :=
  itoLift B ω s t + ((t - s) / 2) • idTensor d

/-- The dyadic piecewise linear interpolation of `x` on `[0, T]` at the times `k T / 2 ^ n`. -/
def dyadicInterp (T : ℝ) (n : ℕ) (x : ℝ → Vec d) (t : ℝ) : Vec d :=
  let k : ℕ := ⌊t * 2 ^ n / T⌋₊
  let t₀ : ℝ := k * T / 2 ^ n
  x t₀ + ((t - t₀) * 2 ^ n / T) • (x ((k + 1) * T / 2 ^ n) - x t₀)

/-- 7.1, **the Kolmogorov criterion for rough paths**. -/
theorem exists_modification_isHolderRoughPath {P : Measure Ω} [IsProbabilityMeasure P]
    {q β C T α : ℝ} (hq : 2 ≤ q) (hβ : 1 / q < β) (hα : 0 < α) (hαβ : α < β - 1 / q)
    {X : ℝ → Ω → Vec d} {XX : ℝ → ℝ → Ω → Ten2 d}
    (hXm : ∀ t, Measurable (X t)) (hXXm : ∀ s t, Measurable (XX s t))
    (hchen : ∀ ω s u t, XX s t ω = XX s u ω + XX u t ω + outer (X u ω - X s ω) (X t ω - X u ω))
    (hX : ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
      ∫⁻ ω, ‖X t ω - X s ω‖ₑ ^ q ∂P ≤ ENNReal.ofReal (C * |t - s| ^ (β * q)))
    (hXX : ∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T,
      ∫⁻ ω, ‖XX s t ω‖ₑ ^ (q / 2) ∂P ≤ ENNReal.ofReal (C * |t - s| ^ (β * q))) :
    ∃ (X' : ℝ → Ω → Vec d) (XX' : ℝ → ℝ → Ω → Ten2 d),
      (∀ t ∈ Icc 0 T, X' t =ᵐ[P] X t) ∧ (∀ s ∈ Icc 0 T, ∀ t ∈ Icc 0 T, XX' s t =ᵐ[P] XX s t) ∧
      ∀ᵐ ω ∂P, IsHolderRoughPath α T (fun t ↦ X' t ω) (fun s t ↦ XX' s t ω) := by
  sorry

/-- 7.2, **the Itô Brownian rough path**: the Itô lift has a version that is almost surely an
`α`-Hölder rough path. -/
theorem exists_version_itoLift {P : Measure Ω} [IsProbabilityMeasure P]
    {B : ℝ≥0 → Ω → Vec d} (hB : IsBrownian B P) {α T : ℝ} (hα : 1 / 3 < α) (hα2 : α < 1 / 2) :
    ∃ BB : ℝ → ℝ → Ω → Ten2 d,
      (∀ s t, 0 ≤ s → s ≤ t → t ≤ T → (fun ω ↦ BB s t ω) =ᵐ[P] fun ω ↦ itoLift B ω s t) ∧
      ∀ᵐ ω ∂P, IsHolderRoughPath α T (realPath B ω) (fun s t ↦ BB s t ω) := by
  sorry

/-- 7.2, **the Stratonovich Brownian rough path**: the Stratonovich lift has a version that is
almost surely a weakly geometric `α`-Hölder rough path. -/
theorem exists_version_stratLift {P : Measure Ω} [IsProbabilityMeasure P]
    {B : ℝ≥0 → Ω → Vec d} (hB : IsBrownian B P) {α T : ℝ} (hα : 1 / 3 < α) (hα2 : α < 1 / 2) :
    ∃ BB : ℝ → ℝ → Ω → Ten2 d,
      (∀ s t, 0 ≤ s → s ≤ t → t ≤ T → (fun ω ↦ BB s t ω) =ᵐ[P] fun ω ↦ stratLift B ω s t) ∧
      ∀ᵐ ω ∂P, IsHolderRoughPath α T (realPath B ω) (fun s t ↦ BB s t ω) ∧
        IsWeaklyGeometric T (realPath B ω) (fun s t ↦ BB s t ω) := by
  sorry

/-- 7.3, **Wong–Zakai at the level of rough paths**: canonical lifts of the dyadic piecewise
linear interpolations converge almost surely to every rough path version of the Stratonovich
lift. -/
theorem ae_tendsto_roughPathDist_dyadicInterp {P : Measure Ω} [IsProbabilityMeasure P]
    {B : ℝ≥0 → Ω → Vec d} (hB : IsBrownian B P) {α T : ℝ} (hα : 1 / 3 < α) (hα2 : α < 1 / 2)
    (hT : 0 < T) {BB : ℝ → ℝ → Ω → Ten2 d}
    (hBB : ∀ s t, 0 ≤ s → s ≤ t → t ≤ T → (fun ω ↦ BB s t ω) =ᵐ[P] fun ω ↦ stratLift B ω s t)
    (hrp : ∀ᵐ ω ∂P, IsHolderRoughPath α T (realPath B ω) (fun s t ↦ BB s t ω)) :
    ∀ᵐ ω ∂P, Tendsto (fun n ↦ roughPathDist α T (dyadicInterp T n (realPath B ω))
      (canonicalLift (dyadicInterp T n (realPath B ω))) (realPath B ω) (fun s t ↦ BB s t ω))
      atTop (𝓝 0) := by
  sorry

/-- 7.3, **Wong–Zakai for equations**: solutions driven by the dyadic interpolations converge
almost surely in `α`-Hölder norm to the solution driven by a rough path version of the
Stratonovich lift. -/
theorem ae_tendsto_isRDESolution_dyadicInterp {W : Type*} [NormedAddCommGroup W]
    [NormedSpace ℝ W] [CompleteSpace W] {P : Measure Ω} [IsProbabilityMeasure P]
    {B : ℝ≥0 → Ω → Vec d} (hB : IsBrownian B P) {α T M : ℝ} (hα : 1 / 3 < α) (hα2 : α < 1 / 2)
    (hT : 0 < T) {f : W → Vec d →L[ℝ] W} (hf : ContDiff ℝ 3 f)
    (hfb : ∀ k ≤ 3, ∀ y, ‖iteratedFDeriv ℝ k f y‖ ≤ M) (ξ : W) {BB : ℝ → ℝ → Ω → Ten2 d}
    (hBB : ∀ s t, 0 ≤ s → s ≤ t → t ≤ T → (fun ω ↦ BB s t ω) =ᵐ[P] fun ω ↦ stratLift B ω s t)
    (hrp : ∀ᵐ ω ∂P, IsHolderRoughPath α T (realPath B ω) (fun s t ↦ BB s t ω))
    {Y : Ω → ℝ → W} {Yn : ℕ → Ω → ℝ → W}
    (hY : ∀ᵐ ω ∂P, IsRDESolution α T f (realPath B ω) (fun s t ↦ BB s t ω) ξ (Y ω))
    (hYn : ∀ n ω, IsRDESolution α T f (dyadicInterp T n (realPath B ω))
      (canonicalLift (dyadicInterp T n (realPath B ω))) ξ (Yn n ω)) :
    ∀ᵐ ω ∂P, Tendsto (fun n ↦ ⨆ (s : ℝ) (t : ℝ) (_ : 0 ≤ s ∧ s < t ∧ t ≤ T),
      ‖(Yn n ω t - Y ω t) - (Yn n ω s - Y ω s)‖ₑ / ENNReal.ofReal ((t - s) ^ α))
      atTop (𝓝 0) := by
  sorry

/-- The `ρ`-th power of the two-dimensional `ρ`-variation of `R` on `[s, t]²`. -/
def rectVariation (ρ : ℝ) (R : ℝ → ℝ → ℝ) (s t : ℝ) : ℝ≥0∞ :=
  ⨆ (k : ℕ) (n : ℕ) (u : Fin (k + 1) → ℝ) (v : Fin (n + 1) → ℝ)
    (_ : Monotone u ∧ u 0 = s ∧ u (Fin.last k) = t ∧ Monotone v ∧ v 0 = s ∧ v (Fin.last n) = t),
    ∑ i : Fin k, ∑ j : Fin n,
      ‖R (u i.succ) (v j.succ) - R (u i.castSucc) (v j.succ) - R (u i.succ) (v j.castSucc) +
        R (u i.castSucc) (v j.castSucc)‖ₑ ^ ρ

/-- 7.4, **Gaussian rough paths**: a centred continuous Gaussian process with independent
components whose covariances have finite `ρ`-variation, `ρ < 3/2`, with
`‖R‖_{ρ;[s,t]²}^ρ ≤ K |t - s|`, lifts to a weakly geometric `α`-Hölder rough path for
`α ∈ (1/3, 1/(2ρ))`, its off-diagonal second level being the limit in probability of the
dyadic Riemann sums. -/
theorem exists_gaussianLift {P : Measure Ω} [IsProbabilityMeasure P] {ρ K α T : ℝ}
    (hρ : 1 ≤ ρ) (hρ32 : ρ < 3 / 2) (hα : 1 / 3 < α) (hαρ : α < 1 / (2 * ρ))
    {X : ℝ → Ω → Vec d} (hG : IsGaussianProcess X P) (hcen : ∀ t, P[X t] = 0)
    (hind : iIndepFun (fun (i : Fin d) (ω : Ω) (t : ℝ) ↦ X t ω i) P)
    (hcont : ∀ ω, Continuous fun t ↦ X t ω)
    (hR : ∀ i : Fin d, ∀ s t, 0 ≤ s → s ≤ t → t ≤ T →
      rectVariation ρ (fun u v ↦ P[fun ω ↦ X u ω i * X v ω i]) s t ≤ ENNReal.ofReal (K * (t - s))) :
    ∃ XX : ℝ → ℝ → Ω → Ten2 d,
      (∀ s t, 0 ≤ s → s ≤ t → t ≤ T → ∀ i j, i < j →
        TendstoInMeasure P (fun n ω ↦ dyadicSum
          (fun u v ↦ (X u ω i - X s ω i) * (X v ω j - X u ω j)) s t n) atTop
          (fun ω ↦ XX s t ω (i, j))) ∧
      ∀ᵐ ω ∂P, IsHolderRoughPath α T (fun t ↦ X t ω) (fun s t ↦ XX s t ω) ∧
        IsWeaklyGeometric T (fun t ↦ X t ω) (fun s t ↦ XX s t ω) := by
  sorry

/-- 7.4: the covariance of fractional Brownian motion of Hurst index `H ∈ (0, 1/2]` has finite
`1/(2H)`-variation, with `‖R_H‖_{1/(2H);[s,t]²}^{1/(2H)} ≤ K |t - s|`. -/
theorem rectVariation_fbmCov_le {H T : ℝ} (hH : 0 < H) (hH2 : H ≤ 1 / 2) :
    ∃ K, ∀ s t, 0 ≤ s → s ≤ t → t ≤ T →
      rectVariation (1 / (2 * H))
        (fun u v ↦ (|u| ^ (2 * H) + |v| ^ (2 * H) - |u - v| ^ (2 * H)) / 2) s t ≤
          ENNReal.ofReal (K * (t - s)) := by
  sorry

end Stochastic

/-! ## Mathlib and Tau Ceti vocabulary used by the README -/

#check @eVariationOn
#check @BoundedVariationOn
#check @HolderOnWith
#check @HolderWith
#check @eHolderNorm
#check @MemHolder
#check @TauCeti.HolderSpace
#check @intervalIntegral
#check @ODE_solution_unique_of_mem_Icc
#check @IsPicardLindelof
#check @iteratedFDeriv
#check @ContDiff
#check @EuclideanSpace
#check @limUnder
#check @TestFunction
#check @Distribution
#check @Distribution.ofFun
#check @ProbabilityTheory.IsBrownianReal
#check @ProbabilityTheory.IsPreBrownianReal
#check @ProbabilityTheory.IsKolmogorovProcess
#check @ProbabilityTheory.IsGaussianProcess
#check @ProbabilityTheory.iIndepFun
#check @MeasureTheory.TendstoInMeasure
#check @PiTensorProduct.projectiveSeminorm
#check @TensorAlgebra
#check @Real.Gamma

end TauCetiRoadmap.YoungIntegrationAndRoughPaths
