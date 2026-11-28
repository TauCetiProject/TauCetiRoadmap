module

public import Mathlib

/-!
# Floating-point arithmetic: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). A format is the real-valued `FloatingPointFormat` (radix `β ≥ 2`,
precision `p ≥ 2`, exponents `emin < emax`); its numbers are the reals `M * β ^ (e - p + 1)` with
`|M| < β ^ p` and `emin ≤ e ≤ emax`, so subnormal numbers are always present. Directed roundings
take values in `EReal`, so that overflow is `⊥` or `⊤`; a round-to-nearest function is the
real-valued nearest-point map onto the finite set of numbers, and every statement about it carries
an explicit no-overflow hypothesis. The standard model of arithmetic is format-free: an arbitrary
`rnd : ℝ → ℝ` with `HasRelativeError u` assumed at each operation. `roundingGamma u n` is
`n * u / (1 - n * u)` and is used only under `n * u < 1`, because at `n * u = 1` it is the junk
value `x / 0 = 0`.

The definitions of this file are meant to be copied verbatim by the roadmaps that consume the
model (interval arithmetic and verified enclosures; backward error analysis of matrix
algorithms).

Bold headlines of the README not stated here: uniform spacing in a binade (§1.2), from
`succ_eq_add_quantum`; the instances of the standard model for `×`, `÷`, `√` and the fused
multiply-add (§3.2), which are `IsRounding.relativeError` at the exact result; exact subtraction
`rnd (x - y) = x - y` (§4.1), which is Sterbenz plus `IsRounding.monotone_and_eq`; the bound
`γ_r` for pairwise summation (§6.1), which is `SumTree.abs_eval_sub_sum_le` at `balanced r`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.FloatingPointArithmetic

open scoped BigOperators

/-! ## Layer 1: formats -/

/-! ### 1.1 Formats and their numbers -/

/-- A finite-radix floating-point format with gradual underflow: radix `β ≥ 2`, precision
`p ≥ 2` and exponent range `emin < emax`. -/
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

/-- The real number `M * β ^ (e - p + 1)` with integral significand `M` and exponent `e`. -/
def value (M e : ℤ) : ℝ := (M : ℝ) * (F.radix : ℝ) ^ (e - (F.precision : ℤ) + 1)

/-- `(M, e)` is a representation in the format: `|M| ≤ β ^ p - 1` and `emin ≤ e ≤ emax`. -/
def Valid (M e : ℤ) : Prop :=
  |M| < (F.radix : ℤ) ^ F.precision ∧ F.emin ≤ e ∧ e ≤ F.emax

/-- The set `𝔽` of floating-point numbers of the format (finite, subnormals included). -/
def numbers : Set ℝ := {x | ∃ M e : ℤ, F.Valid M e ∧ F.value M e = x}

/-- The smallest positive subnormal number `α = β ^ (emin - p + 1)`, the spacing of the
subnormal numbers. -/
def spacing : ℝ := (F.radix : ℝ) ^ (F.emin - (F.precision : ℤ) + 1)

/-- The smallest positive normal number `β ^ emin`. -/
def minNormal : ℝ := (F.radix : ℝ) ^ F.emin

/-- The largest number `Ω = (β ^ p - 1) * β ^ (emax - p + 1)`. -/
def maxFinite : ℝ := F.value ((F.radix : ℤ) ^ F.precision - 1) F.emax

/-- The normal range `{x | β ^ emin ≤ |x| ≤ Ω}`. -/
def normalRange : Set ℝ := {x | F.minNormal ≤ |x| ∧ |x| ≤ F.maxFinite}

/-- The exponent `max emin ⌊log_β |x|⌋` of a real number; for a nonzero element of the format it
is the least exponent of a representation. -/
def exponent (x : ℝ) : ℤ := max F.emin (Int.log F.radix |x|)

/-- The quantum `β ^ (exponent x - p + 1)`, the unit in the last place of a number of the
format. -/
def quantum (x : ℝ) : ℝ := (F.radix : ℝ) ^ (F.exponent x - (F.precision : ℤ) + 1)

/-- The integral significand `⌊x / quantum x⌋`; for an element of the format it is the significand
of the representation with least exponent. -/
def integralSignificand (x : ℝ) : ℤ := ⌊x / F.quantum x⌋

/-- **Canonical representation** (§1.1). A nonzero number has the representation
`(integralSignificand x, exponent x)`, whose exponent is least among all representations; it is
normalized when `x` is normal and has exponent `emin` and a short significand when `x` is
subnormal. -/
theorem exists_minimalExponent {x : ℝ} (hx : x ∈ F.numbers) (hx₀ : x ≠ 0) :
    F.Valid (F.integralSignificand x) (F.exponent x) ∧
      F.value (F.integralSignificand x) (F.exponent x) = x ∧
      (∀ M e : ℤ, F.Valid M e → F.value M e = x → F.exponent x ≤ e) ∧
      (F.minNormal ≤ |x| → (F.radix : ℤ) ^ (F.precision - 1) ≤ |F.integralSignificand x|) ∧
      (|x| < F.minNormal →
        F.exponent x = F.emin ∧ |F.integralSignificand x| < (F.radix : ℤ) ^ (F.precision - 1)) := by
  sorry

/-- **Extremal numbers and the lattice of the format** (§1.1). -/
theorem format_extrema :
    IsLeast {x ∈ F.numbers | 0 < x} F.spacing ∧
      F.minNormal ∈ F.numbers ∧
      IsGreatest F.numbers F.maxFinite ∧
      F.maxFinite =
        ((F.radix : ℝ) - (F.radix : ℝ) ^ (1 - (F.precision : ℤ))) * (F.radix : ℝ) ^ F.emax ∧
      (∀ x ∈ F.numbers, ∃ m : ℤ, x = m * F.spacing) ∧
      (∀ x : ℝ, -x ∈ F.numbers ↔ x ∈ F.numbers) ∧
      (0 : ℝ) ∈ F.numbers ∧ F.numbers.Finite := by
  sorry

/-! ### 1.2 Spacing -/

/-- **Successor** (§1.2). The successor in `𝔽` of a positive number below `Ω` is `x + quantum x`. -/
theorem succ_eq_add_quantum {x : ℝ} (hx : x ∈ F.numbers) (h₀ : 0 < x) (hΩ : x < F.maxFinite) :
    x + F.quantum x ∈ F.numbers ∧ ∀ y ∈ F.numbers, x < y → x + F.quantum x ≤ y := by
  sorry

/-- **Relative spacing of normal numbers** (§1.2). Adjacent normal numbers `x ≠ y` satisfy
`β ^ (-p) |x| ≤ |y - x| ≤ β ^ (1 - p) |x|`. -/
theorem abs_sub_le_of_adjacent {x y : ℝ} (hx : x ∈ F.numbers) (hy : y ∈ F.numbers) (hxy : x ≠ y)
    (hxn : F.minNormal ≤ |x|) (hyn : F.minNormal ≤ |y|)
    (hadj : ∀ z ∈ F.numbers, ¬ (min x y < z ∧ z < max x y)) :
    (F.radix : ℝ) ^ (-(F.precision : ℤ)) * |x| ≤ |y - x| ∧
      |y - x| ≤ (F.radix : ℝ) ^ (1 - (F.precision : ℤ)) * |x| := by
  sorry

end FloatingPointFormat

/-- IEEE 754 binary32: `β = 2`, `p = 24`, `emin = -126`, `emax = 127`. -/
def binary32 : FloatingPointFormat :=
  ⟨2, 24, -126, 127, le_rfl, by norm_num, by norm_num⟩

/-- IEEE 754 binary64: `β = 2`, `p = 53`, `emin = -1022`, `emax = 1023`. -/
def binary64 : FloatingPointFormat :=
  ⟨2, 53, -1022, 1023, le_rfl, by norm_num, by norm_num⟩

/-! ## Layer 2: rounding -/

/-- The four rounding directions. -/
inductive RoundingMode
  | nearest
  | down
  | up
  | towardZero
  deriving DecidableEq

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- `𝔽 ∪ {-∞, +∞}` inside `EReal`. -/
def extendedNumbers : Set EReal := ((↑) : ℝ → EReal) '' F.numbers ∪ {⊥, ⊤}

/-- A round-to-nearest function: a nearest point of `𝔽`, with an arbitrary tie rule. It never
leaves `[-Ω, Ω]`; statements about it carry a no-overflow hypothesis. -/
def IsRoundToNearest (rnd : ℝ → ℝ) : Prop :=
  ∀ x, rnd x ∈ F.numbers ∧ ∀ t ∈ F.numbers, |rnd x - x| ≤ |t - x|

/-- `rnd` is a rounding function for `mode`: nearest (finite values), down (`RD`, the largest
element of `𝔽 ∪ {-∞}` below), up (`RU`), or toward zero (`RD` on `x ≥ 0`, `RU` on `x ≤ 0`). -/
def IsRounding : RoundingMode → (ℝ → EReal) → Prop
  | .nearest, rnd => ∃ r : ℝ → ℝ, F.IsRoundToNearest r ∧ ∀ x, rnd x = (r x : EReal)
  | .down, rnd => ∀ x : ℝ, IsGreatest {y ∈ F.extendedNumbers | y ≤ (x : EReal)} (rnd x)
  | .up, rnd => ∀ x : ℝ, IsLeast {y ∈ F.extendedNumbers | (x : EReal) ≤ y} (rnd x)
  | .towardZero, rnd =>
    (∀ x : ℝ, 0 ≤ x → IsGreatest {y ∈ F.extendedNumbers | y ≤ (x : EReal)} (rnd x)) ∧
      (∀ x : ℝ, x ≤ 0 → IsLeast {y ∈ F.extendedNumbers | (x : EReal) ≤ y} (rnd x))

/-- Rounding to nearest, ties to even: at a midpoint the result has an even integral
significand. -/
def IsTiesToEven (rnd : ℝ → ℝ) : Prop :=
  F.IsRoundToNearest rnd ∧
    ∀ x, (∃ t ∈ F.numbers, t ≠ rnd x ∧ |t - x| = |rnd x - x|) →
      Even (F.integralSignificand (rnd x))

/-- The unit roundoff: `β ^ (1 - p) / 2` for rounding to nearest, `β ^ (1 - p)` for a directed
rounding. -/
def unitRoundoff (mode : RoundingMode) : ℝ :=
  (F.radix : ℝ) ^ (1 - (F.precision : ℤ)) / (if mode = .nearest then 2 else 1)

/-- A real-valued round-to-nearest function is a rounding function for `.nearest`. -/
theorem isRounding_nearest_coe {r : ℝ → ℝ} (h : F.IsRoundToNearest r) :
    F.IsRounding .nearest (fun x ↦ (r x : EReal)) :=
  ⟨r, h, fun _ ↦ rfl⟩

/-- **Monotonicity and exactness** (§2.1). Every rounding function is monotone and fixes `𝔽`. -/
theorem IsRounding.monotone_and_eq {mode : RoundingMode} {rnd : ℝ → EReal}
    (h : F.IsRounding mode rnd) :
    Monotone rnd ∧ ∀ x ∈ F.numbers, rnd x = (x : EReal) := by
  sorry

/-- **Existence and uniqueness** (§2.1). Each mode has a rounding function; the directed ones are
unique. -/
theorem exists_isRounding (mode : RoundingMode) :
    (∃ rnd, F.IsRounding mode rnd) ∧
      (mode ≠ .nearest → ∀ r₁ r₂, F.IsRounding mode r₁ → F.IsRounding mode r₂ → r₁ = r₂) := by
  sorry

/-- **Ties to even** (§2.1). There is exactly one round-to-nearest-even function. -/
theorem existsUnique_isTiesToEven : ∃! rnd : ℝ → ℝ, F.IsTiesToEven rnd := by
  sorry

/-- **Symmetry of the directed roundings** (§2.1): `RD(-x) = -RU(x)`. -/
theorem IsRounding.down_neg {rd ru : ℝ → EReal} (hd : F.IsRounding .down rd)
    (hu : F.IsRounding .up ru) (x : ℝ) : rd (-x) = -ru x := by
  sorry

/-- **Every rounding is faithful** (§2.1): `RD(x) ≤ x ≤ RU(x)` and `∘(x) ∈ {RD(x), RU(x)}`. -/
theorem IsRounding.faithful {mode : RoundingMode} {rnd rd ru : ℝ → EReal}
    (h : F.IsRounding mode rnd) (hd : F.IsRounding .down rd) (hu : F.IsRounding .up ru)
    (x : ℝ) : rd x ≤ (x : EReal) ∧ (x : EReal) ≤ ru x ∧ (rnd x = rd x ∨ rnd x = ru x) := by
  sorry

end FloatingPointFormat

/-! ## Layer 3: relative error and the standard model -/

/-- The standard relative-error model: `y = x * (1 + δ)` with `|δ| ≤ u`. -/
def HasRelativeError (u x y : ℝ) : Prop :=
  ∃ δ : ℝ, |δ| ≤ u ∧ y = x * (1 + δ)

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- **Relative error of rounding on the normal range** (§3.1). The rounded value is finite,
`∘(x) = x (1 + δ)` with `|δ| < u`, `x = ∘(x) (1 + ε)` with `|ε| ≤ u`, and `|δ| ≤ u / (1 + u)` for
rounding to nearest. -/
theorem IsRounding.relativeError {mode : RoundingMode} {rnd : ℝ → EReal} {x : ℝ}
    (h : F.IsRounding mode rnd) (hx : x ∈ F.normalRange) :
    ∃ y : ℝ, rnd x = y ∧
      (∃ δ : ℝ, |δ| < F.unitRoundoff mode ∧ y = x * (1 + δ)) ∧
      HasRelativeError (F.unitRoundoff mode) y x ∧
      (mode = .nearest →
        HasRelativeError (F.unitRoundoff mode / (1 + F.unitRoundoff mode)) x y) := by
  sorry

/-- **The bound `u / (1 + u)` is attained at `1 + u`** (§3.1), for every tie rule. -/
theorem IsRoundToNearest.relativeError_one_add {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd)
    (h₀ : F.emin ≤ 0) (h₁ : 0 ≤ F.emax) :
    |rnd (1 + F.unitRoundoff .nearest) - (1 + F.unitRoundoff .nearest)| /
        (1 + F.unitRoundoff .nearest) =
      F.unitRoundoff .nearest / (1 + F.unitRoundoff .nearest) := by
  sorry

/-- **Absolute error below the normal range** (§3.1): at most `α / 2` for rounding to nearest,
less than `α` for a directed rounding. -/
theorem IsRounding.abs_sub_of_abs_lt_minNormal {mode : RoundingMode} {rnd : ℝ → EReal} {x : ℝ}
    (h : F.IsRounding mode rnd) (hx : |x| < F.minNormal) :
    ∃ y : ℝ, rnd x = y ∧ (mode = .nearest → |y - x| ≤ F.spacing / 2) ∧
      (mode ≠ .nearest → |y - x| < F.spacing) := by
  sorry

/-- **Relative-plus-absolute model** (§3.1). Without overflow, `∘(x) = x (1 + ε) + η` with
`|ε| ≤ u`, `|η| ≤ β ^ emin * u` and `ε η = 0`. -/
theorem IsRounding.exists_relative_add_absolute {mode : RoundingMode} {rnd : ℝ → EReal} {x : ℝ}
    (h : F.IsRounding mode rnd) (hx : |x| ≤ F.maxFinite) :
    ∃ y ε η : ℝ, rnd x = y ∧ y = x * (1 + ε) + η ∧ |ε| ≤ F.unitRoundoff mode ∧
      |η| ≤ F.minNormal * F.unitRoundoff mode ∧ ε * η = 0 := by
  sorry

/-- **Hauser's lemma** (§3.2). A sum of two numbers below the normal range is a number. -/
theorem add_mem_numbers_of_abs_lt {a b : ℝ} (ha : a ∈ F.numbers) (hb : b ∈ F.numbers)
    (h : |a + b| < F.minNormal) : a + b ∈ F.numbers := by
  sorry

/-- **The standard model for addition** (§3.2). Without overflow, a rounded sum of two numbers
satisfies both relative-error models, underflow notwithstanding. -/
theorem IsRounding.hasRelativeError_add {mode : RoundingMode} {rnd : ℝ → EReal} {a b : ℝ}
    (h : F.IsRounding mode rnd) (ha : a ∈ F.numbers) (hb : b ∈ F.numbers)
    (hab : |a + b| ≤ F.maxFinite) :
    ∃ y : ℝ, rnd (a + b) = y ∧ HasRelativeError (F.unitRoundoff mode) (a + b) y ∧
      HasRelativeError (F.unitRoundoff mode) y (a + b) := by
  sorry

/-! ## Layer 4: exact operations and error-free transformations -/

/-- **Sterbenz's lemma** (§4.1). -/
theorem sub_mem_numbers_of_half_le_of_le_two_mul {x y : ℝ}
    (hx : x ∈ F.numbers) (hy : y ∈ F.numbers) (h₁ : y / 2 ≤ x) (h₂ : x ≤ 2 * y) :
    x - y ∈ F.numbers := by
  sorry

/-- **The error of a rounded-to-nearest sum is a number** (§4.1). -/
theorem IsRoundToNearest.add_sub_mem_numbers {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd)
    {a b : ℝ} (ha : a ∈ F.numbers) (hb : b ∈ F.numbers) (hab : |a + b| ≤ F.maxFinite) :
    a + b - rnd (a + b) ∈ F.numbers := by
  sorry

/-- **The error of a rounded product is a number** (§4.1), in every rounding mode, under the
exponent condition `e₁ + e₂ ≥ emin + p - 1`. -/
theorem IsRounding.mul_sub_mem_numbers {mode : RoundingMode} {rnd : ℝ → EReal} {x₁ x₂ : ℝ}
    (h : F.IsRounding mode rnd) (h₁ : x₁ ∈ F.numbers) (h₂ : x₂ ∈ F.numbers)
    (he : F.emin + (F.precision : ℤ) - 1 ≤ F.exponent x₁ + F.exponent x₂)
    (hΩ : |x₁ * x₂| ≤ F.maxFinite) :
    ∃ r : ℝ, rnd (x₁ * x₂) = r ∧ x₁ * x₂ - r ∈ F.numbers := by
  sorry

end FloatingPointFormat

/-- Fast2Sum: `s = ∘(a + b)`, `t = ∘(b - ∘(s - a))`. -/
def fastTwoSum (rnd : ℝ → ℝ) (a b : ℝ) : ℝ × ℝ :=
  let s := rnd (a + b)
  (s, rnd (b - rnd (s - a)))

/-- 2Sum: `s = ∘(a + b)`, `a' = ∘(s - b)`, `b' = ∘(s - a')`, `t = ∘(∘(a - a') + ∘(b - b'))`. -/
def twoSum (rnd : ℝ → ℝ) (a b : ℝ) : ℝ × ℝ :=
  let s := rnd (a + b)
  let a' := rnd (s - b)
  let b' := rnd (s - a')
  (s, rnd (rnd (a - a') + rnd (b - b')))

/-- The six exact results that 2Sum rounds. -/
def twoSumArgs (rnd : ℝ → ℝ) (a b : ℝ) : List ℝ :=
  let s := rnd (a + b)
  let a' := rnd (s - b)
  let b' := rnd (s - a')
  [a + b, s - b, s - a', a - a', b - b', rnd (a - a') + rnd (b - b')]

/-- 2MultFMA: `r₁ = ∘(x₁ x₂)` and `r₂ = ∘(x₁ x₂ - r₁)` by one fused multiply-add. -/
def twoMultFMA (rnd : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ × ℝ :=
  let r := rnd (x₁ * x₂)
  (r, rnd (x₁ * x₂ - r))

namespace FloatingPointFormat

variable (F : FloatingPointFormat)

/-- **Fast2Sum** (§4.2): exact for radix at most `3` when `b = 0` or the exponent of `a` is at
least that of `b` (so `|b| ≤ |a|` suffices), and `a + b` does not overflow. -/
theorem fastTwoSum_add {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd) (hβ : F.radix ≤ 3)
    {a b : ℝ} (ha : a ∈ F.numbers) (hb : b ∈ F.numbers)
    (he : b = 0 ∨ F.exponent b ≤ F.exponent a)
    (hab : |a + b| ≤ F.maxFinite) :
    (fastTwoSum rnd a b).1 + (fastTwoSum rnd a b).2 = a + b := by
  sorry

/-- **2Sum** (§4.2): exact in every radix when none of the six exact results overflows, with or
without underflow. -/
theorem twoSum_add {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd) {a b : ℝ}
    (ha : a ∈ F.numbers) (hb : b ∈ F.numbers)
    (hΩ : ∀ z ∈ twoSumArgs rnd a b, |z| ≤ F.maxFinite) :
    (twoSum rnd a b).1 + (twoSum rnd a b).2 = a + b := by
  sorry

/-- **2MultFMA** (§4.2): exact under the exponent condition and without overflow. -/
theorem twoMultFMA_add {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd) {x₁ x₂ : ℝ}
    (h₁ : x₁ ∈ F.numbers) (h₂ : x₂ ∈ F.numbers)
    (he : F.emin + (F.precision : ℤ) - 1 ≤ F.exponent x₁ + F.exponent x₂)
    (hΩ : |x₁ * x₂| ≤ F.maxFinite) :
    (twoMultFMA rnd x₁ x₂).1 + (twoMultFMA rnd x₁ x₂).2 = x₁ * x₂ := by
  sorry

end FloatingPointFormat

/-! ## Layer 5: accumulated rounding factors -/

/-- `γ_n = n u / (1 - n u)`; used only under `n * u < 1`. -/
def roundingGamma (u : ℝ) (n : ℕ) : ℝ := n * u / (1 - n * u)

/-- **Products of rounding factors** (Layer 5): `∏ (1 + δᵢ) ^ ρᵢ = 1 + θ` with `|θ| ≤ γ_n`. -/
theorem hasRelativeError_prod_zpow {u : ℝ} {n : ℕ} (hn : (n : ℝ) * u < 1)
    {δ : Fin n → ℝ} (hδ : ∀ j, |δ j| ≤ u) {ρ : Fin n → ℤ} (hρ : ∀ j, ρ j = 1 ∨ ρ j = -1) :
    HasRelativeError (roundingGamma u n) 1 (∏ j, (1 + δ j) ^ ρ j) := by
  sorry

/-- **Product rule** (Layer 5): `(1 + θ_k)(1 + θ_j) = 1 + θ_{k+j}`. -/
theorem hasRelativeError_mul_of_roundingGamma {u θ₁ θ₂ : ℝ} {k j : ℕ} (hu : 0 ≤ u)
    (h : ((k + j : ℕ) : ℝ) * u < 1) (h₁ : |θ₁| ≤ roundingGamma u k)
    (h₂ : |θ₂| ≤ roundingGamma u j) :
    HasRelativeError (roundingGamma u (k + j)) 1 ((1 + θ₁) * (1 + θ₂)) := by
  sorry

/-- **Quotient rule** (Layer 5): `(1 + θ_k)/(1 + θ_j)` is `1 + θ_{k+j}` for `j ≤ k` and
`1 + θ_{k+2j}` for `j > k`. -/
theorem hasRelativeError_div_of_roundingGamma {u θ₁ θ₂ : ℝ} {k j : ℕ} (hu : 0 ≤ u)
    (h₁ : |θ₁| ≤ roundingGamma u k) (h₂ : |θ₂| ≤ roundingGamma u j) :
    (j ≤ k → ((k + j : ℕ) : ℝ) * u < 1 →
        HasRelativeError (roundingGamma u (k + j)) 1 ((1 + θ₁) / (1 + θ₂))) ∧
      (k < j → ((k + 2 * j : ℕ) : ℝ) * u < 1 →
        HasRelativeError (roundingGamma u (k + 2 * j)) 1 ((1 + θ₁) / (1 + θ₂))) := by
  sorry

/-- **Inequalities between the `γ_k`** (Layer 5). -/
theorem roundingGamma_rules {u : ℝ} (hu : 0 ≤ u) :
    (∀ j k : ℕ, j ≤ k → (k : ℝ) * u < 1 → roundingGamma u j ≤ roundingGamma u k) ∧
      (∀ j k : ℕ, ((max j k : ℕ) : ℝ) * u ≤ 1 / 2 →
        roundingGamma u k * roundingGamma u j ≤ roundingGamma u (min k j)) ∧
      (∀ i k : ℕ, ((i * k : ℕ) : ℝ) * u < 1 → i * roundingGamma u k ≤ roundingGamma u (i * k)) ∧
      (∀ k : ℕ, ((k + 1 : ℕ) : ℝ) * u < 1 → roundingGamma u k + u ≤ roundingGamma u (k + 1)) ∧
      (∀ j k : ℕ, ((j + k : ℕ) : ℝ) * u < 1 →
        roundingGamma u j + roundingGamma u k + roundingGamma u j * roundingGamma u k ≤
          roundingGamma u (j + k)) := by
  sorry

/-- **The `1.01 n u` bound** (Layer 5): for `n u ≤ 0.01`, `∏ (1 + δᵢ) = 1 + η` with
`|η| ≤ 1.01 n u`. -/
theorem hasRelativeError_prod_of_mul_le {u : ℝ} {n : ℕ} (hn : (n : ℝ) * u ≤ 0.01)
    {δ : Fin n → ℝ} (hδ : ∀ j, |δ j| ≤ u) :
    HasRelativeError (1.01 * n * u) 1 (∏ j, (1 + δ j)) := by
  sorry

/-! ## Layer 6: sums and polynomials -/

/-! ### 6.1 Summation trees -/

/-- A binary summation tree: the order in which a summation scheme adds its terms. -/
inductive SumTree (ι : Type*)
  | leaf (i : ι)
  | branch (left right : SumTree ι)

namespace SumTree

variable {ι κ : Type*}

/-- The leaves in evaluation order. -/
def leaves : SumTree ι → List ι
  | .leaf i => [i]
  | .branch a b => a.leaves ++ b.leaves

/-- The depth, the largest number of additions on a path from a leaf to the root. -/
def depth : SumTree ι → ℕ
  | .leaf _ => 0
  | .branch a b => max a.depth b.depth + 1

/-- Relabel the leaves. -/
def map (f : ι → κ) : SumTree ι → SumTree κ
  | .leaf i => .leaf (f i)
  | .branch a b => .branch (a.map f) (b.map f)

/-- Evaluation with one rounding at each addition. -/
def eval (rnd : ℝ → ℝ) (x : ι → ℝ) : SumTree ι → ℝ
  | .leaf i => x i
  | .branch a b => rnd (a.eval rnd x + b.eval rnd x)

/-- The standard model `∘(a + b) = (a + b)(1 + δ)`, `|δ| ≤ u`, at every addition. -/
def HasStableEvaluation (rnd : ℝ → ℝ) (x : ι → ℝ) (u : ℝ) : SumTree ι → Prop
  | .leaf _ => True
  | .branch a b =>
    a.HasStableEvaluation rnd x u ∧ b.HasStableEvaluation rnd x u ∧
      HasRelativeError u (a.eval rnd x + b.eval rnd x) ((branch a b).eval rnd x)

/-- The inverse model `a + b = ∘(a + b)(1 + δ)`, `|δ| ≤ u`, at every addition. -/
def HasInverseRelativeError (rnd : ℝ → ℝ) (x : ι → ℝ) (u : ℝ) : SumTree ι → Prop
  | .leaf _ => True
  | .branch a b =>
    a.HasInverseRelativeError rnd x u ∧ b.HasInverseRelativeError rnd x u ∧
      HasRelativeError u ((branch a b).eval rnd x) (a.eval rnd x + b.eval rnd x)

/-- `∑ |T̂ᵢ|`, the sum of the absolute values of the computed partial sums. -/
def sumAbsComputed (rnd : ℝ → ℝ) (x : ι → ℝ) : SumTree ι → ℝ
  | .leaf _ => 0
  | .branch a b => |(branch a b).eval rnd x| + a.sumAbsComputed rnd x + b.sumAbsComputed rnd x

/-- No addition overflows: every exact sum formed has absolute value at most `M`. -/
def SumsBoundedBy (rnd : ℝ → ℝ) (x : ι → ℝ) (M : ℝ) : SumTree ι → Prop
  | .leaf _ => True
  | .branch a b =>
    a.SumsBoundedBy rnd x M ∧ b.SumsBoundedBy rnd x M ∧ |a.eval rnd x + b.eval rnd x| ≤ M

/-- Recursive summation `((x₀ + x₁) + x₂) + ⋯ + xₙ`, the left comb. -/
def leftComb : (n : ℕ) → SumTree (Fin (n + 1))
  | 0 => .leaf 0
  | n + 1 => .branch ((leftComb n).map Fin.castSucc) (.leaf (Fin.last (n + 1)))

/-- Pairwise summation of `2 ^ r` terms, the balanced tree. -/
def balanced : (r : ℕ) → SumTree (Fin (2 ^ r))
  | 0 => .leaf 0
  | r + 1 =>
    .branch ((balanced r).map (Fin.cast (by rw [pow_succ, mul_two]) ∘ Fin.castAdd (2 ^ r)))
      ((balanced r).map (Fin.cast (by rw [pow_succ, mul_two]) ∘ Fin.natAdd (2 ^ r)))

/-- Recursive and pairwise summation are summation schemes of depth `n` and `r`. -/
theorem leftComb_balanced (n r : ℕ) :
    (leftComb n).leaves = List.finRange (n + 1) ∧ (leftComb n).depth = n ∧
      (balanced r).leaves = List.finRange (2 ^ r) ∧ (balanced r).depth = r := by
  sorry

/-- **Backward error of summation** (§6.1). A scheme adding `n` terms by `n - 1` additions under
the standard model returns `∑ xᵢ (1 + εᵢ)` with `|εᵢ| ≤ γ_depth`, and `depth ≤ n - 1`. -/
theorem exists_eval_eq_sum_mul {n : ℕ} (t : SumTree (Fin n))
    (hperm : t.leaves.Perm (List.finRange n)) {rnd : ℝ → ℝ} {x : Fin n → ℝ} {u : ℝ}
    (hu : 0 ≤ u) (hn : ((n - 1 : ℕ) : ℝ) * u < 1) (ht : t.HasStableEvaluation rnd x u) :
    t.depth ≤ n - 1 ∧ ∃ ε : Fin n → ℝ, t.eval rnd x = ∑ i, x i * (1 + ε i) ∧
      ∀ i, |ε i| ≤ roundingGamma u t.depth := by
  sorry

/-- **Forward error of summation** (§6.1): `γ_depth ∑ |xᵢ|`, hence `γ_{n-1} ∑ |xᵢ|`. -/
theorem abs_eval_sub_sum_le {n : ℕ} (t : SumTree (Fin n))
    (hperm : t.leaves.Perm (List.finRange n)) {rnd : ℝ → ℝ} {x : Fin n → ℝ} {u : ℝ}
    (hu : 0 ≤ u) (hn : ((n - 1 : ℕ) : ℝ) * u < 1) (ht : t.HasStableEvaluation rnd x u) :
    |t.eval rnd x - ∑ i, x i| ≤ roundingGamma u t.depth * ∑ i, |x i| ∧
      |t.eval rnd x - ∑ i, x i| ≤ roundingGamma u (n - 1) * ∑ i, |x i| := by
  sorry

/-- **A posteriori bound** (§6.1): under the inverse model, the error is at most `u ∑ |T̂ᵢ|`. -/
theorem abs_eval_sub_sum_le_computed (t : SumTree ι) {rnd : ℝ → ℝ} {x : ι → ℝ} {u : ℝ}
    (ht : t.HasInverseRelativeError rnd x u) :
    |t.eval rnd x - (t.leaves.map x).sum| ≤ u * t.sumAbsComputed rnd x := by
  sorry

/-- **Rump's bound `(n - 1) u ∑ |xᵢ|`** (§6.1), for rounding to nearest, any summation order and
no overflow. -/
theorem abs_eval_sub_sum_le_nearest (F : FloatingPointFormat) {n : ℕ} (t : SumTree (Fin n))
    (hperm : t.leaves.Perm (List.finRange n)) {rnd : ℝ → ℝ} (h : F.IsRoundToNearest rnd)
    {x : Fin n → ℝ} (hx : ∀ i, x i ∈ F.numbers) (hΩ : t.SumsBoundedBy rnd x F.maxFinite) :
    |t.eval rnd x - ∑ i, x i| ≤ ((n - 1 : ℕ) : ℝ) * F.unitRoundoff .nearest * ∑ i, |x i| := by
  sorry

end SumTree

/-! ### 6.2 Horner's rule -/

/-- Horner's rule `qₙ = aₙ`, `qᵢ = ∘(∘(x qᵢ₊₁) + aᵢ)`, for `p(x) = ∑ aᵢ xⁱ` of degree `n`. -/
def horner (rnd : ℝ → ℝ) (x : ℝ) : (n : ℕ) → (Fin (n + 1) → ℝ) → ℝ
  | 0, a => a 0
  | n + 1, a => rnd (rnd (x * horner rnd x n (fun i ↦ a i.succ)) + a 0)

/-- Horner's rule with one fused multiply-add per step, `qᵢ = ∘(x qᵢ₊₁ + aᵢ)`. -/
def hornerFMA (rnd : ℝ → ℝ) (x : ℝ) : (n : ℕ) → (Fin (n + 1) → ℝ) → ℝ
  | 0, a => a 0
  | n + 1, a => rnd (x * hornerFMA rnd x n (fun i ↦ a i.succ) + a 0)

/-- The standard model at both operations of every Horner step. -/
def HornerStable (rnd : ℝ → ℝ) (u x : ℝ) : (n : ℕ) → (Fin (n + 1) → ℝ) → Prop
  | 0, _ => True
  | n + 1, a =>
    let q := horner rnd x n (fun i ↦ a i.succ)
    HornerStable rnd u x n (fun i ↦ a i.succ) ∧ HasRelativeError u (x * q) (rnd (x * q)) ∧
      HasRelativeError u (rnd (x * q) + a 0) (rnd (rnd (x * q) + a 0))

/-- The standard model at the fused multiply-add of every step. -/
def HornerFMAStable (rnd : ℝ → ℝ) (u x : ℝ) : (n : ℕ) → (Fin (n + 1) → ℝ) → Prop
  | 0, _ => True
  | n + 1, a =>
    let q := hornerFMA rnd x n (fun i ↦ a i.succ)
    HornerFMAStable rnd u x n (fun i ↦ a i.succ) ∧
      HasRelativeError u (x * q + a 0) (rnd (x * q + a 0))

/-- **Horner's rule** (§6.2): `q̂₀ = ∑ (1 + θᵢ) aᵢ xⁱ` with `|θᵢ| ≤ γ_{2i+1}` for `i < n` and
`|θₙ| ≤ γ_{2n}`, hence `|p(x) - q̂₀| ≤ γ_{2n} ∑ |aᵢ| |x|ⁱ`. -/
theorem horner_backward {rnd : ℝ → ℝ} {u x : ℝ} {n : ℕ} {a : Fin (n + 1) → ℝ} (hu : 0 ≤ u)
    (hn : ((2 * n : ℕ) : ℝ) * u < 1) (h : HornerStable rnd u x n a) :
    (∃ θ : Fin (n + 1) → ℝ, horner rnd x n a = ∑ i, (1 + θ i) * a i * x ^ (i : ℕ) ∧
        ∀ i : Fin (n + 1),
          |θ i| ≤ roundingGamma u (if (i : ℕ) = n then 2 * n else 2 * i + 1)) ∧
      |∑ i, a i * x ^ (i : ℕ) - horner rnd x n a| ≤
        roundingGamma u (2 * n) * ∑ i, |a i| * |x| ^ (i : ℕ) := by
  sorry

/-- **Horner's rule with a fused multiply-add** (§6.2): `|θᵢ| ≤ γ_{i+1}` for `i < n`,
`|θₙ| ≤ γ_n`, and `|p(x) - q̂₀| ≤ γ_n ∑ |aᵢ| |x|ⁱ`. -/
theorem hornerFMA_backward {rnd : ℝ → ℝ} {u x : ℝ} {n : ℕ} {a : Fin (n + 1) → ℝ} (hu : 0 ≤ u)
    (hn : (n : ℝ) * u < 1) (h : HornerFMAStable rnd u x n a) :
    (∃ θ : Fin (n + 1) → ℝ, hornerFMA rnd x n a = ∑ i, (1 + θ i) * a i * x ^ (i : ℕ) ∧
        ∀ i : Fin (n + 1), |θ i| ≤ roundingGamma u (if (i : ℕ) = n then n else i + 1)) ∧
      |∑ i, a i * x ^ (i : ℕ) - hornerFMA rnd x n a| ≤
        roundingGamma u n * ∑ i, |a i| * |x| ^ (i : ℕ) := by
  sorry

/-! ### 6.3 Compensated summation -/

/-- One step of Kahan's compensated summation on the state `(s, e)`: `y = ∘(x + e)`,
`t = ∘(s + y)`, `e' = ∘(∘(s - t) + y)`. -/
def kahanStep (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : ℝ × ℝ :=
  let y := rnd (x + p.2)
  let t := rnd (p.1 + y)
  (t, rnd (rnd (p.1 - t) + y))

/-- The four exact results that a Kahan step rounds. -/
def kahanStepArgs (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : List ℝ :=
  let y := rnd (x + p.2)
  let t := rnd (p.1 + y)
  [x + p.2, p.1 + y, p.1 - t, rnd (p.1 - t) + y]

/-- Kahan's compensated sum, from `(s, e) = (0, 0)`. -/
def kahanSum (rnd : ℝ → ℝ) (xs : List ℝ) : ℝ :=
  (xs.foldl (kahanStep rnd) (0, 0)).1

/-- One step of cascaded summation: `(s, eᵢ) = 2Sum(s, x)`, `e = ∘(e + eᵢ)`. -/
def cascadedStep (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : ℝ × ℝ :=
  ((twoSum rnd p.1 x).1, rnd (p.2 + (twoSum rnd p.1 x).2))

/-- The seven exact results that a cascaded step rounds. -/
def cascadedStepArgs (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : List ℝ :=
  twoSumArgs rnd p.1 x ++ [p.2 + (twoSum rnd p.1 x).2]

/-- Cascaded summation of `x₀ :: xs` (Pichat–Neumaier in the 2Sum form of Ogita, Rump and
Oishi): start from `(x₀, 0)` and return `∘(s + e)`. -/
def cascadedSum (rnd : ℝ → ℝ) (x₀ : ℝ) (xs : List ℝ) : ℝ :=
  let p := xs.foldl (cascadedStep rnd) (x₀, 0)
  rnd (p.1 + p.2)

/-- One step of Priest's doubly compensated summation on the state `(s, c)`. -/
def priestStep (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : ℝ × ℝ :=
  let y := rnd (p.2 + x)
  let w := rnd (x - rnd (y - p.2))
  let t := rnd (y + p.1)
  let v := rnd (y - rnd (t - p.1))
  let z := rnd (w + v)
  let s := rnd (t + z)
  (s, rnd (z - rnd (s - t)))

/-- The ten exact results that a step of Priest's algorithm rounds. -/
def priestStepArgs (rnd : ℝ → ℝ) (p : ℝ × ℝ) (x : ℝ) : List ℝ :=
  let y := rnd (p.2 + x)
  let w := rnd (x - rnd (y - p.2))
  let t := rnd (y + p.1)
  let v := rnd (y - rnd (t - p.1))
  let z := rnd (w + v)
  let s := rnd (t + z)
  [p.2 + x, y - p.2, x - rnd (y - p.2), y + p.1, t - p.1, y - rnd (t - p.1), w + v, t + z,
    s - t, z - rnd (s - t)]

/-- Priest's doubly compensated sum of `x₀ :: xs`, from `(s, c) = (x₀, 0)`. -/
def priestSum (rnd : ℝ → ℝ) (x₀ : ℝ) (xs : List ℝ) : ℝ :=
  (xs.foldl (priestStep rnd) (x₀, 0)).1

/-- **Kahan's compensated summation** (§6.3). There is an absolute constant `C` such that, with
correct rounding to nearest, no overflow and `n u ≤ 1/2`, the computed sum is
`∑ (1 + μᵢ) xᵢ` with `|μᵢ| ≤ 2u + C n u²`, hence `|Ŝ - S| ≤ (2u + C n u²) ∑ |xᵢ|`. -/
theorem exists_kahanSum_eq_sum_mul :
    ∃ C : ℝ, ∀ (F : FloatingPointFormat) (rnd : ℝ → ℝ) (xs : List ℝ),
      F.IsRoundToNearest rnd → (∀ x ∈ xs, x ∈ F.numbers) →
      (∀ i : Fin xs.length, ∀ z ∈ kahanStepArgs rnd ((xs.take i).foldl (kahanStep rnd) (0, 0))
        (xs.get i), |z| ≤ F.maxFinite) →
      (xs.length : ℝ) * F.unitRoundoff .nearest ≤ 1 / 2 →
      (∃ μ : Fin xs.length → ℝ, kahanSum rnd xs = ∑ i, (1 + μ i) * xs.get i ∧
        ∀ i, |μ i| ≤ 2 * F.unitRoundoff .nearest +
          C * xs.length * F.unitRoundoff .nearest ^ 2) ∧
      |kahanSum rnd xs - xs.sum| ≤
        (2 * F.unitRoundoff .nearest + C * xs.length * F.unitRoundoff .nearest ^ 2) *
          (xs.map abs).sum := by
  sorry

/-- **Cascaded summation** (§6.3): `|σ - S| ≤ u |S| + γ_{n-1}² ∑ |xᵢ|` for `n u < 1`, with
correct rounding to nearest and no overflow, underflow notwithstanding. -/
theorem abs_cascadedSum_sub_sum_le (F : FloatingPointFormat) {rnd : ℝ → ℝ}
    (h : F.IsRoundToNearest rnd) {x₀ : ℝ} {xs : List ℝ} (hx₀ : x₀ ∈ F.numbers)
    (hxs : ∀ x ∈ xs, x ∈ F.numbers)
    (hn : ((xs.length + 1 : ℕ) : ℝ) * F.unitRoundoff .nearest < 1)
    (hΩ : (∀ i : Fin xs.length, ∀ z ∈ cascadedStepArgs rnd
        ((xs.take i).foldl (cascadedStep rnd) (x₀, 0)) (xs.get i), |z| ≤ F.maxFinite) ∧
      |(xs.foldl (cascadedStep rnd) (x₀, 0)).1 + (xs.foldl (cascadedStep rnd) (x₀, 0)).2| ≤
        F.maxFinite) :
    |cascadedSum rnd x₀ xs - (x₀ + xs.sum)| ≤
      F.unitRoundoff .nearest * |x₀ + xs.sum| +
        roundingGamma (F.unitRoundoff .nearest) xs.length ^ 2 * (|x₀| + (xs.map abs).sum) := by
  sorry

/-- **Priest's doubly compensated summation** (§6.3): for terms sorted by decreasing magnitude,
`n ≤ β ^ (p - 3)`, rounding to nearest and no overflow, `|sₙ - S| ≤ 2u |S|`. -/
theorem abs_priestSum_sub_sum_le (F : FloatingPointFormat) {rnd : ℝ → ℝ}
    (h : F.IsRoundToNearest rnd) {x₀ : ℝ} {xs : List ℝ} (hx₀ : x₀ ∈ F.numbers)
    (hxs : ∀ x ∈ xs, x ∈ F.numbers) (hsorted : (x₀ :: xs).Pairwise (fun a b ↦ |b| ≤ |a|))
    (hn : ((xs.length + 1 : ℕ) : ℝ) ≤ (F.radix : ℝ) ^ ((F.precision : ℤ) - 3))
    (hΩ : ∀ i : Fin xs.length, ∀ z ∈ priestStepArgs rnd
        ((xs.take i).foldl (priestStep rnd) (x₀, 0)) (xs.get i), |z| ≤ F.maxFinite) :
    |priestSum rnd x₀ xs - (x₀ + xs.sum)| ≤ 2 * F.unitRoundoff .nearest * |x₀ + xs.sum| := by
  sorry

/-! ## Checks -/

/-- Check: the unit roundoff of binary64 with rounding to nearest is `2⁻⁵³`. -/
theorem binary64_unitRoundoff : binary64.unitRoundoff .nearest = 2 ^ (-53 : ℤ) := by
  simp only [FloatingPointFormat.unitRoundoff, binary64, ite_true]
  norm_num

/-- Check: the unit roundoff of binary32 with rounding to nearest is `2⁻²⁴`. -/
theorem binary32_unitRoundoff : binary32.unitRoundoff .nearest = 2 ^ (-24 : ℤ) := by
  simp only [FloatingPointFormat.unitRoundoff, binary32, ite_true]
  norm_num

/-- Check: the smallest positive subnormal number of binary64 is `2⁻¹⁰⁷⁴`. -/
theorem binary64_spacing : binary64.spacing = 2 ^ (-1074 : ℤ) := by
  simp only [FloatingPointFormat.spacing, binary64]
  norm_num

/-- Check (negative control for `n * u < 1`): `γ₁` at `u = 1` is the junk value `1 / 0 = 0`. -/
theorem roundingGamma_one_one : roundingGamma 1 1 = 0 := by
  simp [roundingGamma]

/-! ### Mathlib suppliers named in the README -/

#check @Int.log
#check @Int.zpow_log_le_self
#check @Int.lt_zpow_succ_log_self
#check @Int.floor
#check @Set.Finite
#check @List.Perm
#check @List.Pairwise
#check @List.foldl
#check @List.finRange
#check @Finset.sum
#check @Finset.prod
#check @Fin.castSucc
#check @Fin.castAdd
#check @Fin.natAdd
#check @Fin.cast

end TauCetiRoadmap.FloatingPointArithmetic
