module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.BrouwerFixedPoint
public import TauCeti.Analysis.Normed.Ring.Units
public import TauCeti.Analysis.Fredholm.CompactPerturbation
public import TauCeti.Analysis.Fourier.Wirtinger

/-!
# Interval arithmetic and verified enclosures: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). An interval is a `NonemptyInterval ℝ` with real endpoints
`X.fst ≤ X.snd`, its set is `Set.Icc X.fst X.snd`, its width is Mathlib's
`NonemptyInterval.length`, and `X ≤ Y` is containment. A box is `box X`, the product of a family
of intervals, and an interval matrix `J` is read through `intervalMatrix J`, the set of real
matrices with entries in `J`. Interval operations are exact: `cornerHull op X Y` is the interval
between the least and greatest of the four corner values, and Layer 1 proves that it is the
image `Set.image2 op X Y` for `*` and for `/` with `0 ∉ Y`. The natural interval extension of an
expression is the set-valued `IntervalExpr.enclosure`; Layer 2 proves that it is an interval and
that it is what endpoint arithmetic computes. Outward rounding uses the directed roundings of the
floating-point model, whose definitions are local verbatim copies below. Spectral radii of real
matrices are those of the complexification, `spectralRadius ℂ (A.map (algebraMap ℝ ℂ))`.

Local copies. `FloatingPointFormat`, `FloatingPointFormat.value`, `FloatingPointFormat.Valid`,
`FloatingPointFormat.numbers`, `FloatingPointFormat.minNormal`, `FloatingPointFormat.maxFinite`,
`FloatingPointFormat.normalRange` (FloatingPointArithmetic, §1.1), `RoundingMode`,
`FloatingPointFormat.extendedNumbers`, `FloatingPointFormat.IsRoundToNearest`,
`FloatingPointFormat.IsRounding` and `FloatingPointFormat.unitRoundoff` (FloatingPointArithmetic,
§2.1) are verbatim copies of the definitions of the FloatingPointArithmetic roadmap.

Two declarations are proved sanity checks, not targets: `coe_add` and `coe_sub`.

Bold headlines of the README not stated here: the corollary of 3.1 for the excess width, which is
`exists_enclosure_width_le` with the range inside the enclosure; the interval forms of Krawczyk's
test and of the interval Newton test (6.2–6.3), which follow from the set forms stated here by
`mulVec_mem_box_intervalMulVec`; the constructive Aubin–Nitsche bounds (7.2), which are the
abstract Aubin–Nitsche lemma of GalerkinMethodsAndLagrangeFiniteElements §1.4 for the inner
product of `X`; the identification of the interpolant with the `H¹₀`-projection (7.2), which
needs the space `H¹₀(a, b)`.

Suppliers. The `#check` lines at the end of the file pin the Mathlib and Tau Ceti declarations of
the README's supplier contracts. Schauder's fixed-point theorem, also consumed (7.1), is not
pinned.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.IntervalArithmeticAndVerifiedEnclosures

open Set Filter Topology
open scoped Matrix

/-! ## Layer 1: interval operations -/

/-- The interval between the least and the greatest of the four corner values
`op X.fst Y.fst`, `op X.fst Y.snd`, `op X.snd Y.fst`, `op X.snd Y.snd`. -/
def cornerHull (op : ℝ → ℝ → ℝ) (X Y : NonemptyInterval ℝ) : NonemptyInterval ℝ :=
  ⟨(min (min (op X.fst Y.fst) (op X.fst Y.snd)) (min (op X.snd Y.fst) (op X.snd Y.snd)),
    max (max (op X.fst Y.fst) (op X.fst Y.snd)) (max (op X.snd Y.fst) (op X.snd Y.snd))),
    (min_le_left _ _).trans <| (min_le_left _ _).trans <|
      (le_max_left _ _).trans (le_max_left _ _)⟩

/-- The midpoint `(X.fst + X.snd) / 2` of an interval. -/
def intervalMid (X : NonemptyInterval ℝ) : ℝ := (X.fst + X.snd) / 2

/-- Proved check (1.1): the interval sum is the set of sums. -/
theorem coe_add (X Y : NonemptyInterval ℝ) :
    ((X + Y : NonemptyInterval ℝ) : Set ℝ) = Set.image2 (· + ·) (X : Set ℝ) (Y : Set ℝ) := by
  rw [Set.image2_add, NonemptyInterval.coe_def, NonemptyInterval.coe_def,
    NonemptyInterval.coe_def, Set.Icc_add_Icc X.fst_le_snd Y.fst_le_snd]
  rfl

/-- Proved check (1.1): the interval difference is the set of differences. -/
theorem coe_sub (X Y : NonemptyInterval ℝ) :
    ((X - Y : NonemptyInterval ℝ) : Set ℝ) = Set.image2 (· - ·) (X : Set ℝ) (Y : Set ℝ) := by
  rw [Set.image2_sub, NonemptyInterval.coe_def, NonemptyInterval.coe_def,
    NonemptyInterval.coe_def, Set.Icc_sub_Icc X.fst_le_snd Y.fst_le_snd]
  rfl

/-- **Interval products** (1.1). The set of products of two intervals is the interval between
the least and greatest corner products, also when both intervals contain `0`. -/
theorem coe_cornerHull_mul (X Y : NonemptyInterval ℝ) :
    ((cornerHull (· * ·) X Y : NonemptyInterval ℝ) : Set ℝ) =
      Set.image2 (· * ·) (X : Set ℝ) (Y : Set ℝ) := by
  sorry

/-- **Interval quotients** (1.1). If `0 ∉ Y`, the set of quotients is the interval between the
least and greatest corner quotients. -/
theorem coe_cornerHull_div (X Y : NonemptyInterval ℝ) (hY : (0 : ℝ) ∉ Y) :
    ((cornerHull (· / ·) X Y : NonemptyInterval ℝ) : Set ℝ) =
      Set.image2 (· / ·) (X : Set ℝ) (Y : Set ℝ) := by
  sorry

/-- The box `X₁ × ⋯ × Xₙ` of a family of intervals. -/
def box {ι : Type*} (X : ι → NonemptyInterval ℝ) : Set (ι → ℝ) :=
  Set.univ.pi fun i ↦ (X i : Set ℝ)

/-! ## Layer 2: expressions and the natural interval extension -/

/-- Arithmetic expressions in variables indexed by `ι`: variables, real constants, the four
operations, and a standard function `f` with its domain `dom`. -/
inductive IntervalExpr (ι : Type*)
  | var (i : ι)
  | const (c : ℝ)
  | add (a b : IntervalExpr ι)
  | sub (a b : IntervalExpr ι)
  | mul (a b : IntervalExpr ι)
  | div (a b : IntervalExpr ι)
  | unary (f : ℝ → ℝ) (dom : Set ℝ) (a : IntervalExpr ι)

namespace IntervalExpr

variable {ι : Type*}

/-- Real evaluation at a point (a total function; `DefinedAt` records where it is meaningful). -/
def eval (x : ι → ℝ) : IntervalExpr ι → ℝ
  | .var i => x i
  | .const c => c
  | .add a b => a.eval x + b.eval x
  | .sub a b => a.eval x - b.eval x
  | .mul a b => a.eval x * b.eval x
  | .div a b => a.eval x / b.eval x
  | .unary f _ a => f (a.eval x)

/-- The expression is defined at `x`: no denominator vanishes and every argument of a standard
function lies in its domain. -/
def DefinedAt (x : ι → ℝ) : IntervalExpr ι → Prop
  | .var _ | .const _ => True
  | .add a b | .sub a b | .mul a b => a.DefinedAt x ∧ b.DefinedAt x
  | .div a b => a.DefinedAt x ∧ b.DefinedAt x ∧ b.eval x ≠ 0
  | .unary _ dom a => a.DefinedAt x ∧ a.eval x ∈ dom

/-- The natural interval extension on a box, as a set: each operation and standard function is
replaced by its exact set version, so each occurrence of a variable ranges independently. -/
def enclosure (X : ι → NonemptyInterval ℝ) : IntervalExpr ι → Set ℝ
  | .var i => X i
  | .const c => {c}
  | .add a b => Set.image2 (· + ·) (a.enclosure X) (b.enclosure X)
  | .sub a b => Set.image2 (· - ·) (a.enclosure X) (b.enclosure X)
  | .mul a b => Set.image2 (· * ·) (a.enclosure X) (b.enclosure X)
  | .div a b => Set.image2 (· / ·) (a.enclosure X) (b.enclosure X)
  | .unary f _ a => f '' a.enclosure X

/-- The natural extension is defined on the box: no denominator enclosure contains `0`, every
argument enclosure of a standard function lies in its domain, and every standard function is
continuous on its domain. -/
def Admissible (X : ι → NonemptyInterval ℝ) : IntervalExpr ι → Prop
  | .var _ | .const _ => True
  | .add a b | .sub a b | .mul a b => a.Admissible X ∧ b.Admissible X
  | .div a b => a.Admissible X ∧ b.Admissible X ∧ (0 : ℝ) ∉ b.enclosure X
  | .unary f dom a => a.Admissible X ∧ a.enclosure X ⊆ dom ∧ ContinuousOn f dom

/-- The list of occurrences of variables, with multiplicity. -/
def occurrences : IntervalExpr ι → List ι
  | .var i => [i]
  | .const _ => []
  | .add a b | .sub a b | .mul a b | .div a b => a.occurrences ++ b.occurrences
  | .unary _ _ a => a.occurrences

/-- **Fundamental theorem of interval arithmetic** (2.2). If the natural extension is defined on
the box, the expression is defined at every point of the box and its value lies in the
extension. -/
theorem definedAt_and_eval_mem_enclosure (e : IntervalExpr ι) {X : ι → NonemptyInterval ℝ}
    (h : e.Admissible X) {x : ι → ℝ} (hx : x ∈ box X) :
    e.DefinedAt x ∧ e.eval x ∈ e.enclosure X := by
  sorry

/-- **Inclusion isotonicity** (2.2). Admissibility and the extension pass to sub-boxes. -/
theorem admissible_and_enclosure_subset (e : IntervalExpr ι) {X Y : ι → NonemptyInterval ℝ}
    (h : e.Admissible X) (hYX : ∀ i, Y i ≤ X i) :
    e.Admissible Y ∧ e.enclosure Y ⊆ e.enclosure X := by
  sorry

/-- **Single occurrences give the exact range** (2.2). -/
theorem enclosure_eq_image_of_nodup (e : IntervalExpr ι) (X : ι → NonemptyInterval ℝ)
    (h : e.occurrences.Nodup) : e.enclosure X = e.eval '' box X := by
  sorry

/-- **The extension is an interval** (2.2). Under admissibility the natural extension is a
nonempty compact interval; by 1.1 it is the interval computed by endpoint arithmetic. -/
theorem exists_coe_eq_enclosure (e : IntervalExpr ι) {X : ι → NonemptyInterval ℝ}
    (h : e.Admissible X) : ∃ I : NonemptyInterval ℝ, (I : Set ℝ) = e.enclosure X := by
  sorry

/-! ## Layer 3: order of overestimation -/

/-- Every standard function is Lipschitz on its argument enclosure over the box `X`. -/
def LipschitzOnEnclosures (X : ι → NonemptyInterval ℝ) : IntervalExpr ι → Prop
  | .var _ | .const _ => True
  | .add a b | .sub a b | .mul a b | .div a b =>
    a.LipschitzOnEnclosures X ∧ b.LipschitzOnEnclosures X
  | .unary f _ a => a.LipschitzOnEnclosures X ∧ ∃ K, LipschitzOnWith K f (a.enclosure X)

/-- **Linear overestimation** (3.1). On the sub-boxes of an admissible reference box, the width
of the natural extension is at most a constant times the largest input width. -/
theorem exists_enclosure_width_le [Fintype ι] (e : IntervalExpr ι) (X : ι → NonemptyInterval ℝ)
    (h : e.Admissible X) (hL : e.LipschitzOnEnclosures X) :
    ∃ L : ℝ, 0 ≤ L ∧ ∀ Y : ι → NonemptyInterval ℝ, (∀ i, Y i ≤ X i) →
      ∀ s ∈ e.enclosure Y, ∀ t ∈ e.enclosure Y, |s - t| ≤ L * ‖fun i ↦ (Y i).length‖ := by
  sorry

end IntervalExpr

/-- The mean-value form `f(m) + ∑ᵢ Dᵢ (Xᵢ - mᵢ)` with `m` the midpoint of the box, as the set
that interval arithmetic computes. -/
def meanValueForm {n : ℕ} (f : (Fin n → ℝ) → ℝ) (X D : Fin n → NonemptyInterval ℝ) : Set ℝ :=
  {y | ∃ a ∈ box D, ∃ x ∈ box X,
    y = f (fun i ↦ intervalMid (X i)) + ∑ i, a i * (x i - intervalMid (X i))}

/-- **The mean-value form encloses the range** (3.2). -/
theorem image_subset_meanValueForm {n : ℕ} (f : (Fin n → ℝ) → ℝ) (X D : Fin n → NonemptyInterval ℝ)
    {U : Set (Fin n → ℝ)} (hU : IsOpen U) (hXU : box X ⊆ U) (hf : DifferentiableOn ℝ f U)
    (hD : ∀ x ∈ box X, ∀ i, fderiv ℝ f x (Pi.single i 1) ∈ D i) :
    f '' box X ⊆ meanValueForm f X D := by
  sorry

/-- **Quadratic overestimation of the mean-value form** (3.2). If the derivative enclosures have
width at most `L'` times the largest input width, the width of the mean-value form exceeds the
width of the range by at most `2 n L' ‖w(X)‖²`: there are `x, y` in the box with
`s - t ≤ f x - f y + 2 n L' ‖w(X)‖²` for all `s, t` in the form. -/
theorem meanValueForm_excess_le {n : ℕ} (f : (Fin n → ℝ) → ℝ) (X D : Fin n → NonemptyInterval ℝ)
    {U : Set (Fin n → ℝ)} (hU : IsOpen U) (hXU : box X ⊆ U) (hf : DifferentiableOn ℝ f U)
    (hD : ∀ x ∈ box X, ∀ i, fderiv ℝ f x (Pi.single i 1) ∈ D i) {L' : ℝ}
    (hw : ∀ i, (D i).length ≤ L' * ‖fun j ↦ (X j).length‖) :
    ∃ x ∈ box X, ∃ y ∈ box X, ∀ s ∈ meanValueForm f X D, ∀ t ∈ meanValueForm f X D,
      s - t ≤ f x - f y + 2 * n * L' * ‖fun j ↦ (X j).length‖ ^ 2 := by
  sorry

/-! ## Layer 4: outward rounding

The definitions of this section up to `unitRoundoff` are verbatim copies from the
FloatingPointArithmetic roadmap, §§1.1 and 2.1. -/

/-- A finite-radix floating-point format with gradual underflow: radix `β ≥ 2`, precision
`p ≥ 2` and exponent range `emin < emax`. (Verbatim copy of FloatingPointArithmetic, §1.1.) -/
structure FloatingPointFormat where
  /-- The radix `β`. -/
  radix : ℕ
  /-- The precision `p`, the number of radix digits of the significand. -/
  precision : ℕ
  /-- The least exponent. -/
  emin : ℤ
  /-- The greatest exponent. -/
  emax : ℤ
  two_le_radix : 2 ≤ radix
  two_le_precision : 2 ≤ precision
  emin_lt_emax : emin < emax

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- The real number `M * β ^ (e - p + 1)` with integral significand `M` and exponent `e`.
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def value (M e : ℤ) : ℝ := (M : ℝ) * (F.radix : ℝ) ^ (e - (F.precision : ℤ) + 1)

/-- `(M, e)` is a representation in the format: `|M| ≤ β ^ p - 1` and `emin ≤ e ≤ emax`.
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def Valid (M e : ℤ) : Prop :=
  |M| < (F.radix : ℤ) ^ F.precision ∧ F.emin ≤ e ∧ e ≤ F.emax

/-- The set `𝔽` of floating-point numbers of the format (finite, subnormals included).
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def numbers : Set ℝ := {x | ∃ M e : ℤ, F.Valid M e ∧ F.value M e = x}

/-- The smallest positive normal number `β ^ emin`.
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def minNormal : ℝ := (F.radix : ℝ) ^ F.emin

/-- The largest number `Ω = (β ^ p - 1) * β ^ (emax - p + 1)`.
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def maxFinite : ℝ := F.value ((F.radix : ℤ) ^ F.precision - 1) F.emax

/-- The normal range `{x | β ^ emin ≤ |x| ≤ Ω}`.
(Verbatim copy of FloatingPointArithmetic, §1.1.) -/
def normalRange : Set ℝ := {x | F.minNormal ≤ |x| ∧ |x| ≤ F.maxFinite}

end FloatingPointFormat

/-- The four rounding directions. (Verbatim copy of FloatingPointArithmetic, §2.1.) -/
inductive RoundingMode
  | nearest
  | down
  | up
  | towardZero
  deriving DecidableEq

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- `𝔽 ∪ {-∞, +∞}` inside `EReal`. (Verbatim copy of FloatingPointArithmetic, §2.1.) -/
def extendedNumbers : Set EReal := ((↑) : ℝ → EReal) '' F.numbers ∪ {⊥, ⊤}

/-- A round-to-nearest function: a nearest point of `𝔽`, with an arbitrary tie rule. It never
leaves `[-Ω, Ω]`; statements about it carry a no-overflow hypothesis.
(Verbatim copy of FloatingPointArithmetic, §2.1.) -/
def IsRoundToNearest (rnd : ℝ → ℝ) : Prop :=
  ∀ x, rnd x ∈ F.numbers ∧ ∀ t ∈ F.numbers, |rnd x - x| ≤ |t - x|

/-- `rnd` is a rounding function for `mode`: nearest (finite values), down (`RD`, the largest
element of `𝔽 ∪ {-∞}` below), up (`RU`), or toward zero (`RD` on `x ≥ 0`, `RU` on `x ≤ 0`).
(Verbatim copy of FloatingPointArithmetic, §2.1.) -/
def IsRounding : RoundingMode → (ℝ → EReal) → Prop
  | .nearest, rnd => ∃ r : ℝ → ℝ, F.IsRoundToNearest r ∧ ∀ x, rnd x = (r x : EReal)
  | .down, rnd => ∀ x : ℝ, IsGreatest {y ∈ F.extendedNumbers | y ≤ (x : EReal)} (rnd x)
  | .up, rnd => ∀ x : ℝ, IsLeast {y ∈ F.extendedNumbers | (x : EReal) ≤ y} (rnd x)
  | .towardZero, rnd =>
    (∀ x : ℝ, 0 ≤ x → IsGreatest {y ∈ F.extendedNumbers | y ≤ (x : EReal)} (rnd x)) ∧
      (∀ x : ℝ, x ≤ 0 → IsLeast {y ∈ F.extendedNumbers | (x : EReal) ≤ y} (rnd x))

/-- The unit roundoff: `β ^ (1 - p) / 2` for rounding to nearest, `β ^ (1 - p)` for a directed
rounding. (Verbatim copy of FloatingPointArithmetic, §2.1.) -/
def unitRoundoff (mode : RoundingMode) : ℝ :=
  (F.radix : ℝ) ^ (1 - (F.precision : ℤ)) / (if mode = .nearest then 2 else 1)

end FloatingPointFormat

/-- Outward rounding of a set of reals: all `z` with `RD s ≤ z ≤ RU t` for some `s, t` in the
set. For an interval `[a, b]` it is `[RD a, RU b]`; on overflow it is unbounded. -/
def outward (rd ru : ℝ → EReal) (S : Set ℝ) : Set ℝ :=
  {z | ∃ s ∈ S, ∃ t ∈ S, rd s ≤ (z : EReal) ∧ (z : EReal) ≤ ru t}

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- **`RD z = RU z` exactly on the format** (4.1), for every real `z`. -/
theorem IsRounding.down_eq_up_iff {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd)
    (hu : F.IsRounding .up ru) (z : ℝ) : rd z = ru z ↔ z ∈ F.numbers := by
  sorry

/-- **The rounded interval is best possible** (4.1). For an interval within `[-Ω, Ω]`, the
outward rounding is the interval `[RD a, RU b]`, and it is the least interval with endpoints in
`𝔽` containing the given one. -/
theorem outward_isLeast {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd)
    (hu : F.IsRounding .up ru) (I : NonemptyInterval ℝ)
    (hI : -F.maxFinite ≤ I.fst ∧ I.snd ≤ F.maxFinite) :
    ∃ Z : NonemptyInterval ℝ, (Z : Set ℝ) = outward rd ru I ∧
      (Z.fst : EReal) = rd I.fst ∧ (Z.snd : EReal) = ru I.snd ∧
      IsLeast {W : NonemptyInterval ℝ | I ≤ W ∧ W.fst ∈ F.numbers ∧ W.snd ∈ F.numbers} Z := by
  sorry

/-- **Width of the rounding of a point** (4.3). On the normal range or on `𝔽`, both directed
roundings are finite and `RU z - RD z ≤ 2u|z|` with `u = β ^ (1 - p) / 2`. -/
theorem IsRounding.up_sub_down_le {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd)
    (hu : F.IsRounding .up ru) {z : ℝ} (hz : z ∈ F.normalRange ∪ F.numbers) :
    ∃ a b : ℝ, rd z = a ∧ ru z = b ∧ b - a ≤ 2 * F.unitRoundoff .nearest * |z| := by
  sorry

/-- **Width of a rounded sum** (4.3). For intervals in `[0, ∞)` whose endpoint sums lie in the
normal range or in `𝔽`, the rounded sum has width at most `w(X + Y) + 4u mid(X + Y)`. -/
theorem outward_add_length_le {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd)
    (hu : F.IsRounding .up ru) (X Y : NonemptyInterval ℝ) (hX : 0 ≤ X.fst) (hY : 0 ≤ Y.fst)
    (hlo : (X + Y).fst ∈ F.normalRange ∪ F.numbers)
    (hhi : (X + Y).snd ∈ F.normalRange ∪ F.numbers) :
    ∃ Z : NonemptyInterval ℝ, (Z : Set ℝ) = outward rd ru ((X + Y : NonemptyInterval ℝ) : Set ℝ) ∧
      Z.length ≤ (X + Y).length + 4 * F.unitRoundoff .nearest * intervalMid (X + Y) := by
  sorry

end FloatingPointFormat

namespace IntervalExpr

variable {ι : Type*}

/-- Rounded evaluation: inputs and constants are rounded outward, each operation is followed by
outward rounding, and each standard function `f` is evaluated by a supplied enclosure `φ f`. -/
def roundedEnclosure (rd ru : ℝ → EReal) (φ : (ℝ → ℝ) → Set ℝ → Set ℝ)
    (X : ι → NonemptyInterval ℝ) : IntervalExpr ι → Set ℝ
  | .var i => outward rd ru (X i)
  | .const c => outward rd ru {c}
  | .add a b => outward rd ru (Set.image2 (· + ·) (a.roundedEnclosure rd ru φ X)
      (b.roundedEnclosure rd ru φ X))
  | .sub a b => outward rd ru (Set.image2 (· - ·) (a.roundedEnclosure rd ru φ X)
      (b.roundedEnclosure rd ru φ X))
  | .mul a b => outward rd ru (Set.image2 (· * ·) (a.roundedEnclosure rd ru φ X)
      (b.roundedEnclosure rd ru φ X))
  | .div a b => outward rd ru (Set.image2 (· / ·) (a.roundedEnclosure rd ru φ X)
      (b.roundedEnclosure rd ru φ X))
  | .unary f _ a => φ f (a.roundedEnclosure rd ru φ X)

/-- **Floating-point inclusion principle** (4.2). The range lies in the natural extension, which
lies in the rounded evaluation, whenever every standard-function enclosure contains the image. -/
theorem image_subset_enclosure_subset_roundedEnclosure (F : FloatingPointFormat)
    {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd) (hu : F.IsRounding .up ru)
    (φ : (ℝ → ℝ) → Set ℝ → Set ℝ) (hφ : ∀ f S, f '' S ⊆ φ f S) (e : IntervalExpr ι)
    (X : ι → NonemptyInterval ℝ) :
    e.eval '' box X ⊆ e.enclosure X ∧ e.enclosure X ⊆ e.roundedEnclosure rd ru φ X := by
  sorry

end IntervalExpr

/-! ## Layer 5: linear systems -/

section LinearSystems

variable {n : ℕ}

/-- **Spectral radius test** (5.1). If `ρ(I - RA) < 1`, then `A` and `R` are nonsingular. -/
theorem det_ne_zero_of_spectralRadius_lt_one (A R : Matrix (Fin n) (Fin n) ℝ)
    (h : spectralRadius ℂ ((1 - R * A).map (algebraMap ℝ ℂ)) < 1) :
    A.det ≠ 0 ∧ R.det ≠ 0 := by
  sorry

/-- **Residual bound in an induced norm** (5.1). For operators on a finite-dimensional normed
space with `‖I - RA‖ < 1`, `A` and `R` are invertible and
`‖A⁻¹ b - x̃‖ ≤ ‖R (b - A x̃)‖ / (1 - ‖I - RA‖)`. -/
theorem isUnit_and_norm_inverse_sub_le {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (A R : E →L[ℝ] E) (h : ‖1 - R * A‖ < 1) :
    IsUnit A ∧ IsUnit R ∧
      ∀ b x : E, ‖Ring.inverse A b - x‖ ≤ ‖R (b - A x)‖ / (1 - ‖1 - R * A‖) := by
  sorry

open scoped Matrix.Norms.Operator in
/-- **Residual bound in the `∞`-norm** (5.1), for matrices, with the norm the largest absolute
row sum and the sup norm on vectors. -/
theorem det_ne_zero_and_norm_inv_mulVec_sub_le (A R : Matrix (Fin n) (Fin n) ℝ)
    (h : ‖1 - R * A‖ < 1) (b x : Fin n → ℝ) :
    A.det ≠ 0 ∧ R.det ≠ 0 ∧ ‖A⁻¹ *ᵥ b - x‖ ≤ ‖R *ᵥ (b - A *ᵥ x)‖ / (1 - ‖1 - R * A‖) := by
  sorry

/-- The real matrices with entries in an interval matrix. -/
def intervalMatrix {m k : ℕ} (J : Fin m → Fin k → NonemptyInterval ℝ) :
    Set (Matrix (Fin m) (Fin k) ℝ) :=
  {M | ∀ i j, M i j ∈ J i j}

/-- The interval matrix–vector product `C X`, by interval operations. -/
def intervalMulVec {m k : ℕ} (C : Fin m → Fin k → NonemptyInterval ℝ)
    (X : Fin k → NonemptyInterval ℝ) : Fin m → NonemptyInterval ℝ :=
  fun i ↦ ∑ j, cornerHull (· * ·) (C i j) (X j)

/-- The point interval matrix of a real matrix. -/
def pointMatrix {m k : ℕ} (R : Matrix (Fin m) (Fin k) ℝ) : Fin m → Fin k → NonemptyInterval ℝ :=
  fun i j ↦ NonemptyInterval.pure (R i j)

/-- The interval residual `R (b - A x̃) + (I - R A) X`, by interval operations. -/
def linearResidual (A : Fin n → Fin n → NonemptyInterval ℝ) (b : Fin n → NonemptyInterval ℝ)
    (R : Matrix (Fin n) (Fin n) ℝ) (x : Fin n → ℝ) (X : Fin n → NonemptyInterval ℝ) :
    Fin n → NonemptyInterval ℝ :=
  fun i ↦
    intervalMulVec (pointMatrix R)
        (fun k ↦ b k - intervalMulVec A (fun j ↦ NonemptyInterval.pure (x j)) k) i +
      intervalMulVec
        (fun k j ↦ NonemptyInterval.pure ((1 : Matrix (Fin n) (Fin n) ℝ) k j) -
          intervalMulVec (pointMatrix R) (fun l ↦ A l j) k) X i

/-- **Inclusion for matrix–vector products** (5.2). -/
theorem mulVec_mem_box_intervalMulVec {m k : ℕ} {C : Fin m → Fin k → NonemptyInterval ℝ}
    {X : Fin k → NonemptyInterval ℝ} {M : Matrix (Fin m) (Fin k) ℝ} (hM : M ∈ intervalMatrix C)
    {x : Fin k → ℝ} (hx : x ∈ box X) : M *ᵥ x ∈ box (intervalMulVec C X) := by
  sorry

/-- **Interior inclusion bounds the spectral radius** (5.2). If the affine map `x ↦ z + C x`
sends a box into its interior, then `ρ(C) < 1`. -/
theorem spectralRadius_lt_one_of_mapsTo_interior (C : Matrix (Fin n) (Fin n) ℝ) (z : Fin n → ℝ)
    (X : Fin n → NonemptyInterval ℝ) (h : ∀ x ∈ box X, z + C *ᵥ x ∈ interior (box X)) :
    spectralRadius ℂ (C.map (algebraMap ℝ ℂ)) < 1 := by
  sorry

/-- **Interior inclusion for interval data** (5.2). If `Z + C X ⊆ int X` in interval
arithmetic, then `ρ(C₀) < 1` for every `C₀ ∈ C`. -/
theorem spectralRadius_lt_one_of_intervalMulVec (C : Fin n → Fin n → NonemptyInterval ℝ)
    (Z X : Fin n → NonemptyInterval ℝ)
    (h : box (fun i ↦ Z i + intervalMulVec C X i) ⊆ interior (box X)) :
    ∀ C₀ ∈ intervalMatrix C, spectralRadius ℂ (C₀.map (algebraMap ℝ ℂ)) < 1 := by
  sorry

/-- **Verification of a point linear system** (5.3). If
`x ↦ R (b - A x̃) + (I - R A) x` maps the box `X` into its interior, then `A` and `R` are
nonsingular and `A⁻¹ b - x̃` is the image of a point of `X`. -/
theorem det_ne_zero_and_sub_mem_of_mapsTo_interior (A R : Matrix (Fin n) (Fin n) ℝ)
    (b x : Fin n → ℝ) (X : Fin n → NonemptyInterval ℝ)
    (h : ∀ y ∈ box X, R *ᵥ (b - A *ᵥ x) + (1 - R * A) *ᵥ y ∈ interior (box X)) :
    A.det ≠ 0 ∧ R.det ≠ 0 ∧
      A⁻¹ *ᵥ b - x ∈ (fun y ↦ R *ᵥ (b - A *ᵥ x) + (1 - R * A) *ᵥ y) '' box X := by
  sorry

/-- **Verification of an interval linear system** (5.3). If the interval residual
`Y = R (b - A x̃) + (I - R A) X` lies in the interior of `X`, then `R` and every `A₀ ∈ A` are
nonsingular, and `A₀⁻¹ b₀ ∈ x̃ + Y` for all `A₀ ∈ A`, `b₀ ∈ b`. -/
theorem verified_linearSystem (A : Fin n → Fin n → NonemptyInterval ℝ)
    (b : Fin n → NonemptyInterval ℝ) (R : Matrix (Fin n) (Fin n) ℝ) (x : Fin n → ℝ)
    (X : Fin n → NonemptyInterval ℝ) (h : box (linearResidual A b R x X) ⊆ interior (box X)) :
    R.det ≠ 0 ∧ ∀ A₀ ∈ intervalMatrix A, A₀.det ≠ 0 ∧
      ∀ b₀ ∈ box b, A₀⁻¹ *ᵥ b₀ - x ∈ box (linearResidual A b R x X) := by
  sorry

end LinearSystems

/-! ## Layer 6: nonlinear systems -/

/-- **Univariate interval Newton test** (6.1). With `N = {x̃ - f(x̃)/d : d ∈ D}`: every zero of `f`
in `X` lies in `N`; `N ⊆ X` gives exactly one zero in `X`; `N ∩ X = ∅` gives none. -/
theorem intervalNewton_univariate {f : ℝ → ℝ} (X D : NonemptyInterval ℝ) {x : ℝ} (hx : x ∈ X)
    (hD : (0 : ℝ) ∉ D) (hf : ContinuousOn f X)
    (hderiv : ∀ y ∈ Set.Ioo X.fst X.snd, ∃ d ∈ D, HasDerivAt f d y) :
    {y ∈ (X : Set ℝ) | f y = 0} ⊆ (fun d ↦ x - f x / d) '' (D : Set ℝ) ∧
      ((fun d ↦ x - f x / d) '' (D : Set ℝ) ⊆ X → ∃! y, y ∈ X ∧ f y = 0) ∧
      (Disjoint ((fun d ↦ x - f x / d) '' (D : Set ℝ)) X → ∀ y ∈ X, f y ≠ 0) := by
  sorry

section Nonlinear

variable {n : ℕ}

/-- **Interval mean value theorem** (6.2). If the Jacobians on a box lie in an interval matrix
`J`, then for `x, x̃` in the box `f x = f x̃ + M (x - x̃)` for some `M ∈ J`. -/
theorem exists_mem_intervalMatrix_eq_add_mulVec (f : (Fin n → ℝ) → Fin n → ℝ)
    {U : Set (Fin n → ℝ)} (hU : IsOpen U) (X : Fin n → NonemptyInterval ℝ) (hXU : box X ⊆ U)
    (hf : DifferentiableOn ℝ f U) (J : Fin n → Fin n → NonemptyInterval ℝ)
    (hJ : ∀ y ∈ box X, ∀ i j, fderiv ℝ f y (Pi.single j 1) i ∈ J i j) {x x' : Fin n → ℝ}
    (hx : x ∈ box X) (hx' : x' ∈ box X) :
    ∃ M ∈ intervalMatrix J, f x = f x' + M *ᵥ (x - x') := by
  sorry

/-- The interval Newton set `{x̃ - M⁻¹ f(x̃) : M ∈ J}`. -/
def intervalNewtonSet (f : (Fin n → ℝ) → Fin n → ℝ) (J : Fin n → Fin n → NonemptyInterval ℝ)
    (x : Fin n → ℝ) : Set (Fin n → ℝ) :=
  (fun M : Matrix (Fin n) (Fin n) ℝ ↦ x - M⁻¹ *ᵥ f x) '' intervalMatrix J

/-- **Interval Newton test** (6.2). If every matrix of `J` is nonsingular: every zero in the box
lies in the Newton set `N`; `N ⊆ X` gives exactly one zero in the box; `N ∩ X = ∅` gives none. -/
theorem intervalNewton (f : (Fin n → ℝ) → Fin n → ℝ) {U : Set (Fin n → ℝ)} (hU : IsOpen U)
    (X : Fin n → NonemptyInterval ℝ) (hXU : box X ⊆ U) (hf : ContDiffOn ℝ 1 f U)
    (J : Fin n → Fin n → NonemptyInterval ℝ)
    (hJ : ∀ y ∈ box X, ∀ i j, fderiv ℝ f y (Pi.single j 1) i ∈ J i j)
    (hJdet : ∀ M ∈ intervalMatrix J, M.det ≠ 0) {x : Fin n → ℝ} (hx : x ∈ box X) :
    {y ∈ box X | f y = 0} ⊆ intervalNewtonSet f J x ∧
      (intervalNewtonSet f J x ⊆ box X → ∃! y, y ∈ box X ∧ f y = 0) ∧
      (Disjoint (intervalNewtonSet f J x) (box X) → ∀ y ∈ box X, f y ≠ 0) := by
  sorry

/-- **Krawczyk's test** (6.3). Let `0 ∈ X`, let the Jacobians on `x̃ + X` lie in `J`, and suppose
`-R f(x̃) + (I - R M) y ∈ int X` for all `M ∈ J`, `y ∈ X`. Then `R` and every `M ∈ J` are
nonsingular, `f` has exactly one zero in `x̃ + X`, and that zero lies in `x̃ + K` for the set
`K` of these values. -/
theorem krawczyk (f : (Fin n → ℝ) → Fin n → ℝ) {U : Set (Fin n → ℝ)} (hU : IsOpen U)
    (x : Fin n → ℝ) (R : Matrix (Fin n) (Fin n) ℝ) (X : Fin n → NonemptyInterval ℝ)
    (J : Fin n → Fin n → NonemptyInterval ℝ) (h0 : (0 : Fin n → ℝ) ∈ box X)
    (hXU : ∀ y ∈ box X, x + y ∈ U) (hf : DifferentiableOn ℝ f U)
    (hJ : ∀ y ∈ box X, ∀ i j, fderiv ℝ f (x + y) (Pi.single j 1) i ∈ J i j)
    (hK : ∀ M ∈ intervalMatrix J, ∀ y ∈ box X,
      -(R *ᵥ f x) + (1 - R * M) *ᵥ y ∈ interior (box X)) :
    R.det ≠ 0 ∧ (∀ M ∈ intervalMatrix J, M.det ≠ 0) ∧ (∃! y, y ∈ box X ∧ f (x + y) = 0) ∧
      ∀ y ∈ box X, f (x + y) = 0 →
        ∃ M ∈ intervalMatrix J, ∃ y' ∈ box X, y = -(R *ᵥ f x) + (1 - R * M) *ᵥ y' := by
  sorry

end Nonlinear

/-! ## Layer 7: computer-assisted existence proofs in Banach spaces -/

section Plum

variable {X Y : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y]

/-- A compact map: continuous, and sending bounded sets to relatively compact sets. -/
def IsCompactMap (N : X → Y) : Prop :=
  Continuous N ∧ ∀ s : Set X, Bornology.IsBounded s → IsCompact (closure (N '' s))

/-- **Derivatives of compact maps are compact** (7.1). -/
theorem IsCompactMap.isCompactOperator_fderiv [CompleteSpace Y] {N : X → Y} (hN : IsCompactMap N)
    {ω : X} {N' : X →L[ℝ] Y} (hN' : HasFDerivAt N N' ω) : IsCompactOperator N' := by
  sorry

/-- **Bounded below with dense range** (7.1). On a Banach space, an operator with
`‖v‖ ≤ K ‖L v‖` and dense range is bijective. -/
theorem bijective_of_denseRange_of_norm_le [CompleteSpace X] (L : X →L[ℝ] Y) {K : ℝ}
    (hK : ∀ v, ‖v‖ ≤ K * ‖L v‖) (hL : DenseRange L) : Function.Bijective L := by
  sorry

/-- **Plum's theorem, dense-range case** (7.1). With residual `δ`, inverse bound `K`, a
nondecreasing majorant `g` of the modulus of continuity of `F'` at `ω`, `G(α) = ∫₀^α g`,
`δ ≤ α/K - G(α)` and `K g(α) < 1`, the equation `F u = 0` has a solution with `‖u - ω‖ ≤ α`
at which `F'` is bijective. -/
theorem exists_zero_of_plum_denseRange [CompleteSpace X] (F : X → Y) (ω : X) (g : ℝ → ℝ)
    {K δ α : ℝ} (hK : 0 < K) (hα : 0 < α) (hg : MonotoneOn g (Set.Ici 0))
    (hF : Differentiable ℝ F) (hδ : ‖F ω‖ ≤ δ) (hKL : ∀ v, ‖v‖ ≤ K * ‖fderiv ℝ F ω v‖)
    (hgF : ∀ v, ‖fderiv ℝ F (ω + v) - fderiv ℝ F ω‖ ≤ g ‖v‖)
    (hdense : DenseRange (fderiv ℝ F ω)) (hαδ : δ ≤ α / K - ∫ t in (0 : ℝ)..α, g t)
    (hKg : K * g α < 1) :
    ∃ u ∈ Metric.closedBall ω α, F u = 0 ∧ Function.Bijective (fderiv ℝ F u) := by
  sorry

/-- **Plum's theorem, compact case** (7.1). For `F = L₀ + N` with `L₀` bijective and `N` a
differentiable compact map, under the same bounds, `F u = 0` has a solution with
`‖u - ω‖ ≤ α`, and `F'(u)` is bijective when `K g(α) < 1`. -/
theorem exists_zero_of_plum_compact [CompleteSpace X] [CompleteSpace Y] (L₀ : X →L[ℝ] Y)
    (hL₀ : Function.Bijective L₀) (N : X → Y) (hN : IsCompactMap N) (hNd : Differentiable ℝ N)
    (ω : X) (g : ℝ → ℝ) {K δ α : ℝ} (hK : 0 < K) (hα : 0 < α) (hg : MonotoneOn g (Set.Ici 0))
    (hδ : ‖L₀ ω + N ω‖ ≤ δ) (hKL : ∀ v, ‖v‖ ≤ K * ‖L₀ v + fderiv ℝ N ω v‖)
    (hgN : ∀ v, ‖fderiv ℝ N (ω + v) - fderiv ℝ N ω‖ ≤ g ‖v‖)
    (hαδ : δ ≤ α / K - ∫ t in (0 : ℝ)..α, g t) :
    ∃ u ∈ Metric.closedBall ω α, L₀ u + N u = 0 ∧
      (K * g α < 1 → Function.Bijective (L₀ + fderiv ℝ N u)) := by
  sorry

/-- **Local uniqueness** (7.1). If moreover `K g(α) < 1` and `δ < α'/K - G(α')` for some
`α' > α`, then `F` has at most one zero with `‖u - ω‖ ≤ α'`. -/
theorem plum_zero_subsingleton (F : X → Y) (ω : X) (g : ℝ → ℝ) {K δ α α' : ℝ} (hK : 0 < K)
    (hα : 0 < α) (hαα' : α < α') (hg : MonotoneOn g (Set.Ici 0)) (hF : Differentiable ℝ F)
    (hδ : ‖F ω‖ ≤ δ) (hKL : ∀ v, ‖v‖ ≤ K * ‖fderiv ℝ F ω v‖)
    (hgF : ∀ v, ‖fderiv ℝ F (ω + v) - fderiv ℝ F ω‖ ≤ g ‖v‖)
    (hαδ : δ ≤ α / K - ∫ t in (0 : ℝ)..α, g t)
    (hα'δ : δ < α' / K - ∫ t in (0 : ℝ)..α', g t) (hKg : K * g α < 1) :
    {u ∈ Metric.closedBall ω α' | F u = 0}.Subsingleton := by
  sorry

/-- **Plum's theorem with a remainder majorant** (7.1). For `F = L₀ + N` with `L₀` bijective and
`N` a compact map differentiable at `ω`, with `‖N(ω + v) - N ω - N'(ω) v‖ ≤ G(‖v‖)` for a
nondecreasing `G` and `δ ≤ α/K - G(α)`, `F u = 0` has a solution with `‖u - ω‖ ≤ α`. -/
theorem exists_zero_of_plum_remainder [CompleteSpace X] [CompleteSpace Y] (L₀ : X →L[ℝ] Y)
    (hL₀ : Function.Bijective L₀) (N : X → Y) (hN : IsCompactMap N) (ω : X) (N' : X →L[ℝ] Y)
    (hN' : HasFDerivAt N N' ω) (G : ℝ → ℝ) {K δ α : ℝ} (hK : 0 < K) (hα : 0 < α)
    (hG : MonotoneOn G (Set.Ici 0)) (hδ : ‖L₀ ω + N ω‖ ≤ δ) (hKL : ∀ v, ‖v‖ ≤ K * ‖L₀ v + N' v‖)
    (hrem : ∀ v, ‖N (ω + v) - N ω - N' v‖ ≤ G ‖v‖) (hαδ : δ ≤ α / K - G α) :
    ∃ u ∈ Metric.closedBall ω α, L₀ u + N u = 0 := by
  sorry

end Plum

/-! ## Layer 7 (continued): constructive projection error constants -/

section Constants

/-- **Wirtinger's inequality with the sharp constant** (7.2). A `C¹` function vanishing at both
ends of `[a, b]` has `∫ e² ≤ ((b - a)/π)² ∫ e'²`. -/
theorem integral_sq_le_of_eq_zero {a b : ℝ} (hab : a < b) {e : ℝ → ℝ}
    (he : ContDiffOn ℝ 1 e (Set.Icc a b)) (ha : e a = 0) (hb : e b = 0) :
    ∫ x in a..b, e x ^ 2 ≤ ((b - a) / Real.pi) ^ 2 * ∫ x in a..b, deriv e x ^ 2 := by
  sorry

/-- The node `a + k (b - a)/N` of the uniform partition of `[a, b]` into `N` cells. -/
def uniformNode (a b : ℝ) (N k : ℕ) : ℝ := a + k * ((b - a) / N)

/-- **The constant `h/π` for piecewise linear interpolation** (7.2). For `u ∈ C²[a, b]` and the
uniform partition with `h = (b - a)/N`, the derivative of `u - I_h u` satisfies
`‖(u - I_h u)'‖ ≤ (h/π) ‖u''‖` in `L²(a, b)`, written cell by cell. -/
theorem sum_integral_sq_deriv_sub_slope_le {a b : ℝ} (hab : a < b) {N : ℕ} (hN : 0 < N)
    {u : ℝ → ℝ} (hu : ContDiffOn ℝ 2 u (Set.Icc a b)) :
    ∑ k ∈ Finset.range N, ∫ x in uniformNode a b N k..uniformNode a b N (k + 1),
        (deriv u x - (u (uniformNode a b N (k + 1)) - u (uniformNode a b N k)) /
          ((b - a) / N)) ^ 2 ≤
      ((b - a) / N / Real.pi) ^ 2 * ∫ x in a..b, deriv (deriv u) x ^ 2 := by
  sorry

end Constants

#check @Set.Icc_add_Icc
#check @Set.Icc_sub_Icc
#check @NonemptyInterval.length_add
#check @NonemptyInterval.length_sub
#check @TauCeti.brouwerFixedPoint_compactConvex_continuousOn
#check @NormedRing.norm_inverse_one_sub_le
#check @isUnit_one_sub_of_norm_lt_one
#check @ContinuousLinearMap.index_one_add_eq_zero
#check @ContractingWith.fixedPoint
#check @TauCeti.integral_norm_sub_average_sq_le
#check @gauge
#check @IsCompactOperator
#check @Submodule.starProjection
#check @Matrix.det
#check @Matrix.mulVec
#check @Matrix.toLin'
#check @spectralRadius
#check @Ring.inverse

end TauCetiRoadmap.IntervalArithmeticAndVerifiedEnclosures
