# Roadmap: floating-point arithmetic and rounding error analysis

**Summary.** This roadmap builds the mathematical model of floating-point arithmetic and the
classical rounding error analysis of sums and polynomials. A floating-point format with radix
`β ≥ 2`, precision `p ≥ 2` and exponent range `emin < emax` is the finite set of reals
`M β^(e-p+1)` with `|M| < β^p` and `emin ≤ e ≤ emax`, subnormal numbers included. On it the
roadmap builds:
- the canonical representation, the extremal numbers, and the spacing of consecutive numbers;
- the four rounding functions (to nearest with any tie rule, down, up, toward zero), with
  overflow to `±∞` for the directed ones, their existence, monotonicity and exactness on the
  format, and the round-to-nearest-even function;
- the unit roundoff `u` and the relative error of rounding: `|δ| < u` on the normal range, the
  sharper `u/(1 + u)` for rounding to nearest (attained at `1 + u`), and absolute error bounds
  below the normal range;
- the standard model `fl(a op b) = (a op b)(1 + δ)`, `|δ| ≤ u`, and its inverse form, with
  Hauser's lemma (sums never underflow inexactly) and Sterbenz's lemma (nearby numbers subtract
  exactly);
- the error-free transformations Fast2Sum (radix at most 3), 2Sum (every radix) and 2MultFMA;
- the calculus of accumulated rounding factors `γ_n = nu/(1 - nu)` for `nu < 1`;
- summation in any order on a binary tree, with the backward bound `γ_{n-1}`, the a posteriori
  bound, and Rump's bound `(n - 1)u` for rounding to nearest; Horner's rule; Kahan's compensated
  summation (`2u + O(nu²)`), cascaded summation and Priest's doubly compensated summation.

The roadmap is the foundation of floating-point analysis in Tau Ceti. It consumes only Mathlib's
order theory, integer powers and integer logarithm. Its two-level model, a real-valued format for
statements that need the number system and a format-free standard model for algorithm-level
analysis, is meant to be copied verbatim by its consumers: a roadmap on interval arithmetic and
verified enclosures takes the directed roundings for outward rounding, and a roadmap on backward
error analysis of matrix algorithms takes the standard model, `γ_n` and the summation trees for
inner products, triangular systems and factorizations. The roadmap is a synthesis of the
*Handbook of Floating-Point Arithmetic* of Muller et al., Higham's *Accuracy and Stability of
Numerical Algorithms* and Rump's survey of verification methods; it follows none of them section
by section.

The nearest roadmaps analyse algorithms in exact arithmetic and leave rounding out:
[IterativeMethodsForLinearSystems](../IterativeMethodsForLinearSystems/README.md),
[EigenvalueIterations](../EigenvalueIterations/README.md) and
[OneStepMethodsForODEs](../OneStepMethodsForODEs/README.md), whose bounds for perturbed steps
accept the rounding errors bounded here. The roadmap ConditioningAndPerturbation (open pull request
#2807) supplies the perturbation theory of linear systems that backward error bounds are
combined with; nothing passes between it and this roadmap directly.

Suggested home: `TauCeti/Numerics/FloatingPoint/`.

## How to read the build

Layer 1 defines the format and proves what is needed about its numbers: the canonical
representation with least exponent, the extremal numbers `α`, `β^emin` and `Ω`, the fact that
every number is an integer multiple of `α`, and the spacing. Layer 2 defines rounding functions
by their order or nearest-point property, not by a digit algorithm, and proves their existence
and basic properties. Layer 3 turns the spacing into relative error bounds and the standard
model; the only substance beyond Layer 1 is Hauser's lemma. Layer 4 proves exactness results:
Sterbenz's lemma and the representability of the errors of addition and multiplication, and the
algorithms that compute those errors.

Layer 5 leaves the format: it is algebra of products `∏ (1 + δᵢ)^{±1}` with `|δᵢ| ≤ u`. Layer 6
applies it to evaluation trees for summation and to Horner's rule under the format-free standard
model, and returns to the format for the statements that need correct rounding to nearest:
Rump's `(n - 1)u` bound and the compensated summation algorithms, which use Layer 4.

The layers are in build order: each layer needs only earlier layers and Mathlib.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.FloatingPointArithmetic`.
- **The format** is the structure `FloatingPointFormat` with fields `radix : ℕ`,
  `precision : ℕ`, `emin emax : ℤ` and the proofs `2 ≤ radix`, `2 ≤ precision`, `emin < emax`.
  Its numbers are real: `numbers : Set ℝ` is the set of `value M e = M * β ^ (e - p + 1)` with
  `Valid M e`, that is `|M| < β ^ p` and `emin ≤ e ≤ emax`. The power is a `zpow` of the radix
  cast to `ℝ`. Subnormal numbers are always present; flush-to-zero formats are not modelled.
  There are no NaNs, infinities or signed zeros in `numbers`. The constants are `spacing`
  (`α = β ^ (emin - p + 1)`), `minNormal` (`β ^ emin`), `maxFinite` (`Ω`) and `normalRange`
  (`β ^ emin ≤ |x| ≤ Ω`).
- **Exponent and quantum.** `exponent x = max emin (Int.log β |x|)` (Mathlib's `Int.log`, the
  greatest `k` with `β ^ k ≤ |x|`) and `quantum x = β ^ (exponent x - p + 1)`;
  `integralSignificand x = ⌊x / quantum x⌋`. For a nonzero number these are the exponent,
  unit in the last place and integral significand of its normalized representation (1.1). At
  `x = 0` the value `exponent 0 = max emin 0` is a junk value. It occurs only in the hypotheses
  of Fast2Sum and of the exact product error, where the statements stay true at a zero argument:
  Fast2Sum with `a = 0` and a product with a zero factor are exact.
- **Rounding functions.** `RoundingMode` has the constructors `nearest`, `down`, `up`,
  `towardZero`. The directed roundings are maps `ℝ → EReal` with values in
  `extendedNumbers = 𝔽 ∪ {⊥, ⊤}`, so that `RD x = ⊥` for `x < -Ω` and `RU x = ⊤` for `x > Ω`:
  overflow needs no junk value. A round-to-nearest function is a real map
  `rnd : ℝ → ℝ` with `IsRoundToNearest`, a nearest point of the finite set `numbers`, with an
  arbitrary tie rule; it maps `|x| > Ω` to `±Ω` instead of to an infinity, so every statement
  about rounding to nearest carries the no-overflow hypothesis `|exact| ≤ Ω` at the operations it
  rounds. `IsRounding mode rnd` is the predicate for all four modes (for `nearest`, through a real
  round-to-nearest function).
- **Correct rounding.** An operation is correctly rounded for `rnd` when it returns `rnd` of the
  exact real result; algorithms are written that way (`rnd (a + b)`, `rnd (x * q + a)` for a fused
  multiply-add).
- **Unit roundoff.** `unitRoundoff mode` is `β ^ (1 - p) / 2` for `nearest` and `β ^ (1 - p)`
  for the directed modes.
- **The standard model is format-free.** `HasRelativeError u x y` means `y = x (1 + δ)` for some
  `|δ| ≤ u`; the inverse model is `HasRelativeError u y x`. An algorithm "under the standard
  model" is evaluated with an arbitrary `rnd : ℝ → ℝ`, and the hypothesis is
  `HasRelativeError u exact (rnd exact)` at each operation it performs (the predicates
  `SumTree.HasStableEvaluation`, `HornerStable`, …). Layer 3 proves that a correctly rounded
  operation of a format satisfies these hypotheses with `u = unitRoundoff mode` when nothing
  overflows and, for `×`, `÷`, `√` and the fused multiply-add, nothing underflows.
- **`γ_n`.** `roundingGamma u n = n * u / (1 - n * u)`. Every statement involving it assumes
  `0 ≤ u` and `(index) * u < 1` for each index that occurs: at `n * u = 1` the value is the junk
  `x / 0 = 0`, and the statements would be false.
- **Relative errors** are written with an existential factor `x (1 + δ)`, never as
  `(rnd x - x) / x`, which is `0` at `x = 0`.
- **Summation trees.** `SumTree ι` is the inductive type of binary trees with leaves in `ι`; a
  summation scheme for `x : Fin n → ℝ` is a tree whose `leaves` list is a permutation of
  `List.finRange n`. `eval rnd x` rounds once at each internal node. Recursive summation is
  `leftComb`, pairwise summation of `2 ^ r` terms is `balanced r`. Algorithms on lists take a
  `List ℝ` and number its entries from `0`.
- **Locators** are `[M]`, `[H]`, `[R]` with a theorem, equation or section and a printed page, in
  the editions under [References](#references). A locator marked *route* is a proof sketch for an
  adaptation; the rest restate a source result.

## Layer 1: formats

### 1.1 Formats and their numbers

Sources: [M, §2.1.1, (2.1), p. 16; §2.1.2, pp. 17–19]; [H, §2.1, (2.1), p. 40, and p. 41].

- **Definitions** (`FloatingPointFormat`, `value`, `Valid`, `numbers`, `spacing`, `minNormal`,
  `maxFinite`, `normalRange`, `exponent`, `quantum`, `integralSignificand`). As in the
  Conventions. A nonzero number is normal if `β ^ emin ≤ |x|` and subnormal otherwise.
- **Canonical representation** (`exists_minimalExponent`). For `x ∈ numbers`, `x ≠ 0`, the pair
  `(integralSignificand x, exponent x)` is a representation of `x`, its exponent is the least
  exponent of any representation, a normal `x` has `β ^ (p - 1) ≤ |M|`, and a subnormal `x` has
  exponent `emin` and `|M| < β ^ (p - 1)` [M, §2.1.2, pp. 17–18]. Route: `Int.zpow_log_le_self`
  and `Int.lt_zpow_succ_log_self` locate `|x|` in `[β ^ e, β ^ (e + 1))`.
- **Extremal numbers and the lattice** (`format_extrema`). `α` is the least positive number,
  `β ^ emin` is a number, `Ω` is the greatest number and equals `(β - β ^ (1 - p)) β ^ emax`
  [M, pp. 18–19]; every number is an integer multiple of `α`; `numbers` is symmetric, contains
  `0` and is finite. Route: `quantum x` is a multiple of `α` because `exponent x ≥ emin`.

**Checks.**

- In the format `β = 2`, `p = 3`, `emin = -2`, `emax = 2`: `α = 1/16`, `β ^ emin = 1/4`,
  `Ω = 7`, and `numbers` has 47 elements: 3 positive subnormal numbers, 4 numbers in each of the
  5 binades, their negatives and `0`.
- `17 = 17 · 10⁰ = 170 · 10⁻¹` has two representations for `β = 10`, `p = 3`; the canonical one
  has exponent `1` and significand `170`, the one with least exponent [M, p. 16].
- `binary64.spacing = 2 ^ (-1074)` (`binary64_spacing`, proved).
- Negative control: Higham's parameters for IEEE double (`t = 53`, `emin = -1021`,
  `emax = 1024` [H, p. 43]) are for significands in `[1/β, 1)`; read in the convention here they
  give `α = 2 ^ (-1073)` and `Ω = 2 ^ 1025 (1 - 2 ^ (-53))`, not the binary64 values. The
  conversion is `emin ↦ emin - 1`, `emax ↦ emax - 1`.

### 1.2 Spacing

Sources: [M, proof of Theorem 2.2, pp. 26–27]; [H, Lemma 2.1, p. 41].

- **Successor** (`succ_eq_add_quantum`). For `x ∈ numbers` with `0 < x < Ω`, the next number is
  `x + quantum x`: it is a number and no number lies strictly between [M, p. 27].
- **Uniform spacing.** The numbers in `[β ^ e, β ^ (e + 1)]` are equally spaced by
  `β ^ (e - p + 1)`, and the subnormal numbers with `0` are equally spaced by `α` [M, p. 27].
  Route: `succ_eq_add_quantum` and `quantum x = β ^ (e - p + 1)` on the binade.
- **Relative spacing of normal numbers** (`abs_sub_le_of_adjacent`). Adjacent normal numbers
  `x ≠ y` satisfy `β ^ (-p) |x| ≤ |y - x| ≤ β ^ (1 - p) |x|` [H, Lemma 2.1, p. 41].
- **Binary formats** (`binary32`, `binary64`). IEEE 754 binary32 is `(2, 24, -126, 127)` and
  binary64 is `(2, 53, -1022, 1023)` [M, p. 18; Table 3.1, p. 49].

**Checks.**

- In the format `(2, 3, -2, 2)`, the successor of `1` is `5/4` and the predecessor of `1` is
  `7/8`; the gaps `1/4 = β ^ (1 - p) · 1` and `1/8 = β ^ (-p) · 1` attain both bounds of
  `abs_sub_le_of_adjacent`.
- The successor of `α` is `2α`, and of the largest subnormal `β ^ emin - α` it is `β ^ emin`.

## Layer 2: rounding

### 2.1 Rounding functions

Sources: [M, §2.2.1, pp. 22–23; §2.2.2, p. 25; Property 2.1, p. 25]; [H, §2.1, p. 42];
[R, (2.1)–(2.2), p. 302].

- **Definitions** (`RoundingMode`, `extendedNumbers`, `IsRoundToNearest`, `IsRounding`,
  `IsTiesToEven`, `unitRoundoff`, `isRounding_nearest_coe`). `RD x` is the greatest element of
  `𝔽 ∪ {-∞}` not above `x`, `RU x` the least element of `𝔽 ∪ {+∞}` not below `x`, rounding
  toward zero is `RD` on `x ≥ 0` and `RU` on `x ≤ 0`, and a round-to-nearest function minimizes
  `|rnd x - x|` over `𝔽`. Ties to even picks, at a midpoint, the neighbour with even integral
  significand [M, p. 23].
- **Monotonicity and exactness** (`IsRounding.monotone_and_eq`). Every rounding function is
  monotone and fixes every number [M, §2.2.2, p. 25]. Route for `nearest`: if `x < y` and
  `rnd y < rnd x`, the nearest-point inequalities at `x` and `y` contradict
  `(rnd x - rnd y)(y - x) > 0`.
- **Existence and uniqueness** (`exists_isRounding`). Every mode has a rounding function, and the
  directed ones are unique. Route: `extendedNumbers` is a finite set containing `⊥` and `⊤`;
  `numbers` is finite and nonempty, so a nearest point exists.
- **Ties to even** (`existsUnique_isTiesToEven`). Exactly one round-to-nearest function breaks
  ties to even. Route: two consecutive numbers have consecutive canonical integral significands,
  or `β ^ p - 1` and `β ^ (p - 1)` across a power of `β`; in both cases exactly one is even, for
  either parity of `β`.
- **Symmetry** (`IsRounding.down_neg`). `RD(-x) = -RU(x)` in `EReal` [M, p. 25], the identity
  behind outward rounding with a single rounding direction.
- **Faithfulness** (`IsRounding.faithful`). `RD x ≤ x ≤ RU x`, and every rounding function takes
  the value `RD x` or `RU x` [M, p. 24].

**Checks.**

- In `(2, 3, -2, 2)`: `RD(α/2) = 0`, `RU(α/2) = α`, every round-to-nearest function gives
  `RN(α/3) = 0` [M, Property 2.1, p. 25].
- Overflow: in `(2, 3, -2, 2)`, `RU 14 = ⊤`, `RD 14 = 7`, `RZ (-14) = -7`, and a round-to-nearest
  function gives `7` at `14` (the convention, not IEEE's `+∞`).
- Ties: in `(2, 3, -2, 2)`, `9/8` is the midpoint of `1` (significand `4`) and `5/4`
  (significand `5`); ties to even gives `1`, and both values are round-to-nearest.
- The round-to-nearest-even function is odd: `RN(-x) = -RN(x)`. Negative control: a nearest
  function breaking every tie downward is not odd (`9/8 ↦ 1`, `-9/8 ↦ -5/4`).

## Layer 3: relative error and the standard model

### 3.1 Relative error of rounding

Sources: [M, Theorem 2.2, p. 26; Definition 2.3 and Theorem 2.3, p. 27; p. 28 and (2.4)–(2.5),
p. 28; p. 28–29]; [H, Theorem 2.2, p. 42; Theorem 2.3, p. 43]; [R, (2.3), p. 302].

- **Relative error on the normal range** (`IsRounding.relativeError`). For `x` in the normal
  range the rounded value `y` is finite, `y = x (1 + δ)` with `|δ| < u`, `x = y (1 + ε)` with
  `|ε| ≤ u`, and for rounding to nearest (any tie rule) `y = x (1 + δ)` with
  `|δ| ≤ u / (1 + u)` [M, Theorems 2.2–2.3, pp. 26–27; H, Theorems 2.2–2.3, pp. 42–43]. The
  inverse form is [M, (2.7), p. 28]; route: `|y| ≥ β ^ e` when `β ^ e ≤ |x|`.
- **Attainment** (`IsRoundToNearest.relativeError_one_add`). If `emin ≤ 0 ≤ emax`, every
  round-to-nearest function has relative error exactly `u / (1 + u)` at `1 + u`, the midpoint of
  `1` and `1 + 2u` [M, p. 28].
- **Below the normal range** (`IsRounding.abs_sub_of_abs_lt_minNormal`). For `|x| < β ^ emin`,
  `|RN x - x| ≤ α/2` and `|∘ x - x| < α` for the directed roundings [M, (2.4)–(2.5), p. 28]. The
  relative error can be `1`: `∘ x = 0` for `0 < x < α/2` under rounding to nearest and for
  `0 < x < α` under `RD` (the Checks of 2.1).
- **Relative plus absolute error** (`IsRounding.exists_relative_add_absolute`). For `|x| ≤ Ω`,
  `∘ x = x (1 + ε) + η` with `|ε| ≤ u`, `|η| ≤ β ^ emin u` and `ε η = 0` [M, pp. 28–29;
  R, (2.3), p. 302].

**Checks.**

- In `(2, 3, -2, 2)`, `u = 1/8` and `RN(9/8) ∈ {1, 5/4}` with relative error `1/9 = u/(1 + u)`.
- The maximal relative error of the three directed roundings over a fine grid of the normal range of
  `(2, 3, -2, 2)` is below `β ^ (1 - p) = 1/4` and approaches it as `x ↓ 1` under `RU`.
- Negative control (directed modes need the larger `u`): `RD(5/4 - 1/100) = 1` has relative error
  `0.19 > 1/8`, the nearest-mode value of `u`.
- `binary64.unitRoundoff .nearest = 2 ^ (-53)` and `binary32.unitRoundoff .nearest = 2 ^ (-24)`
  (`binary64_unitRoundoff`, `binary32_unitRoundoff`, proved).

### 3.2 The standard model

Sources: [M, (2.6)–(2.7), p. 28; Theorem 4.2, p. 102]; [H, (2.4), p. 44; (2.5), p. 45];
[R, (2.4), p. 302].

- **Hauser's lemma** (`add_mem_numbers_of_abs_lt`). If `a, b ∈ numbers` and `|a + b| < β ^ emin`
  then `a + b ∈ numbers` [M, Theorem 4.2, p. 102]. Route: `a + b` is a multiple of `α` (1.1)
  with multiplier below `β ^ (p - 1)`.
- **The standard model for addition and subtraction** (`IsRounding.hasRelativeError_add`). For
  `a, b ∈ numbers` with `|a + b| ≤ Ω`, the rounded sum is finite and satisfies both
  `HasRelativeError u (a + b) y` and `HasRelativeError u y (a + b)`, also when `a + b` is below
  the normal range [M, (2.6)–(2.7), p. 28 with Theorem 4.2; R, (2.4), p. 302]. Subtraction is the
  case `-b ∈ numbers`. Route: `IsRounding.relativeError` on the normal range, Hauser and
  `IsRounding.monotone_and_eq` below it.
- **The standard model for the other operations.** For `a, b, c ∈ numbers` and an exact result
  `a * b`, `a / b` (`b ≠ 0`), `√a` (`a > 0`) or `a * b + c` in the normal range, the rounded
  result satisfies both relative-error models with the unit roundoff of the mode, and
  `u / (1 + u)` in the first model for rounding to nearest [M, (2.6)–(2.7), p. 28; H, (2.4),
  p. 44]. This is `IsRounding.relativeError` at the exact result.

**Checks.**

- Hauser in `(2, 3, -2, 2)`: `5/16 - 1/4 = 1/16 = α` is a number; every pair of numbers with sum
  below `1/4` sums exactly (exhaustive, see notes).
- Negative control (a product can underflow inexactly): in `(2, 3, -2, 2)`,
  `(1/4)(3/16) = 3/64` rounds to nearest as `1/16`, with relative error `1/3 > u = 1/8`; the
  standard model for `×` needs the exact result in the normal range.

## Layer 4: exact operations and error-free transformations

### 4.1 Exact subtraction and representable errors

Sources: [M, Lemma 4.1, p. 101; §4.3, p. 103; (4.2), p. 111]; [H, Theorem 2.5, p. 50];
[R, (3.1), p. 304].

- **Sterbenz's lemma** (`sub_mem_numbers_of_half_le_of_le_two_mul`). If `x, y ∈ numbers` and
  `y/2 ≤ x ≤ 2y`, then `x - y ∈ numbers` [M, Lemma 4.1, p. 101; H, Theorem 2.5, p. 50, which
  adds a no-underflow hypothesis that the subnormal numbers make unnecessary]. The hypotheses
  force `x, y ≥ 0`.
- **Exact subtraction.** Under the hypotheses of Sterbenz's lemma, `∘(x - y) = x - y` for every
  rounding function. Route: Sterbenz's lemma and `IsRounding.monotone_and_eq`.
- **The error of a rounded-to-nearest sum is a number**
  (`IsRoundToNearest.add_sub_mem_numbers`). If `a, b ∈ numbers` and `|a + b| ≤ Ω`, then
  `a + b - RN(a + b) ∈ numbers` [M, §4.3, p. 103; R, (3.1), p. 304]. Route: the proof of
  [M, Theorem 4.3, pp. 105–107] (`|a + b - s| ≤ min(|a|, |b|)`, and `a + b - s` is a multiple of
  the smaller quantum).
- **The error of a rounded product is a number** (`IsRounding.mul_sub_mem_numbers`). In every
  mode, if `x₁, x₂ ∈ numbers`, `exponent x₁ + exponent x₂ ≥ emin + p - 1` and `|x₁ x₂| ≤ Ω`, the
  rounded product `r` is finite and `x₁ x₂ - r ∈ numbers` [M, (4.2), pp. 111–112].

**Checks.**

- Sterbenz in `(2, 3, -2, 2)` holds for all `47²` pairs (exhaustive).
- Negative control (subnormals are needed): `5/16 - 1/4 = 1/16` is subnormal; without subnormal
  numbers it would round to `0` [M, Figure 2.1, p. 20].
- Negative control (rounding to nearest is needed): in binary, for `a = 1` and `b = -2 ^ (-3p)`,
  `a + b - RD(a + b) = 2 ^ (-p) - 2 ^ (-3p)` is not a number [M, p. 103].
- Negative control (the exponent condition is needed): [M, p. 112] gives a decimal64 product
  whose error is below the subnormal spacing.

### 4.2 Error-free transformations

Sources: [M, Theorem 4.3 and Algorithm 4.3, p. 104; Algorithm 4.4, p. 108; Algorithm 4.8,
p. 112]; [H, (4.7), p. 93]; [R, Algorithm 3.1 and Theorem 3.2, p. 305].

- **The algorithms** (`fastTwoSum`, `twoSum`, `twoSumArgs`, `twoMultFMA`). Fast2Sum computes
  `s = RN(a + b)`, `t = RN(b - RN(s - a))`; 2Sum computes `s = RN(a + b)`, `a' = RN(s - b)`,
  `b' = RN(s - a')`, `t = RN(RN(a - a') + RN(b - b'))`, and `twoSumArgs` lists its six exact
  results; 2MultFMA computes `r₁ = RN(x₁ x₂)`, `r₂ = RN(x₁ x₂ - r₁)` with one fused
  multiply-add. They are defined for any `rnd : ℝ → ℝ`.
- **Fast2Sum** (`fastTwoSum_add`). For `β ≤ 3`, `a, b ∈ numbers` with
  `exponent b ≤ exponent a` (for instance `|b| ≤ |a|`) and `|a + b| ≤ Ω`, `s + t = a + b`
  [M, Theorem 4.3, p. 104].
- **2Sum** (`twoSum_add`). In every radix, if the six exact results have absolute value at most
  `Ω` and, unless `β = 2`, the inputs and the six exact results are zero or normal, then
  `s + t = a + b` [M, p. 108: Knuth in every radix without underflow, Boldo et al. in radix 2 with
  underflow; R, Theorem 3.2, p. 305].
- **2MultFMA** (`twoMultFMA_add`). Under the hypotheses of `IsRounding.mul_sub_mem_numbers`,
  `r₁ + r₂ = x₁ x₂` [M, Algorithm 4.8, p. 112]. Route: `r₂ = RN(x₁ x₂ - r₁)` is exact by 4.1 and
  `IsRounding.monotone_and_eq`.

**Checks.**

- Fast2Sum and 2Sum are exact for all pairs of numbers of `(2, 3, -2, 2)` and `(3, 3, -2, 1)`
  satisfying the hypotheses (exhaustive).
- Negative control (`β ≤ 3` is needed): in decimal with `p = 2`, `a = 0.98`, `b = 0.97` give
  `s = 2.0`, `RN(s - a) = 1.0`, `t = -0.03`, and `s + t = 1.97 ≠ 1.95`; in radix `4` with `p = 2`,
  `a = b = 15/64` give `s + t = 31/64 ≠ 30/64`.
- 2MultFMA is exact for all pairs of `(2, 3, -2, 2)` satisfying the exponent condition.

## Layer 5: accumulated rounding factors

Sources: [H, Lemma 3.1, p. 69; Lemma 3.3 and Lemma 3.4, p. 74]; [M, Definition 5.1 and (5.3),
p. 166]; [R, Theorem 2.1, p. 303].

- **Definition** (`roundingGamma`). `γ_n = n u / (1 - n u)`, used only under `n u < 1`.
- **Products of rounding factors** (`hasRelativeError_prod_zpow`). If `|δᵢ| ≤ u`, `ρᵢ = ±1` and
  `n u < 1`, then `∏ (1 + δᵢ) ^ ρᵢ = 1 + θ_n` with `|θ_n| ≤ γ_n` [H, Lemma 3.1, p. 69].
- **Product rule** (`hasRelativeError_mul_of_roundingGamma`). If `|θ_k| ≤ γ_k`, `|θ_j| ≤ γ_j`
  and `(k + j) u < 1`, then `(1 + θ_k)(1 + θ_j) = 1 + θ_{k+j}` [H, Lemma 3.3, p. 74].
- **Quotient rule** (`hasRelativeError_div_of_roundingGamma`). `(1 + θ_k)/(1 + θ_j)` is
  `1 + θ_{k+j}` if `j ≤ k` and `(k + j) u < 1`, and `1 + θ_{k+2j}` if `j > k` and
  `(k + 2j) u < 1` [H, Lemma 3.3, p. 74]. The denominator is positive because `2ju < 1`.
- **Inequalities** (`roundingGamma_rules`). `γ` is monotone in `n` below the pole [M, (5.3),
  p. 166]; `γ_k γ_j ≤ γ_{min(k,j)}` if `max(k, j) u ≤ 1/2`; `i γ_k ≤ γ_{ik}`; `γ_k + u ≤ γ_{k+1}`;
  `γ_k + γ_j + γ_k γ_j ≤ γ_{k+j}`; each when the indices that occur satisfy `(index) u < 1`
  [H, Lemma 3.3, p. 74, which omits the condition `max(k, j) u ≤ 1/2`].
- **The `1.01 n u` bound** (`hasRelativeError_prod_of_mul_le`). If `|δᵢ| ≤ u` and `n u ≤ 0.01`,
  then `∏ (1 + δᵢ) = 1 + η` with `|η| ≤ 1.01 n u` [H, Lemma 3.4, p. 74, stated for `n u < 0.01`;
  the bound holds at `n u = 0.01` because `e ^ (0.01) - 1 < 0.0101`].

**Checks.**

- `γ_0 = 0` and `γ_1 = u/(1 - u)`; at `u = 1`, `γ_1` is the junk value `0`
  (`roundingGamma_one_one`, proved), and `(1 + 1)^1 = 1 + θ` with `|θ| ≤ γ_1 = 0` is false: the
  hypothesis `n u < 1` is needed.
- Lemma 3.1 at the extreme factors `(1 + u)^s / (1 - u)^{n-s}` stays within `γ_n` for
  `u = 1/200`, `n < 40` (exact rationals).
- Negative control (the condition on the product rule): at `u = 0.1`, `γ_1 γ_6 = 1/6 > γ_1 = 1/9`.
- Negative control (index `k + 2j`): with `k = 0`, `j = 1`, `1/(1 - γ_1) - 1 = u/(1 - 2u)`, which
  exceeds `γ_{k+j} = γ_1` and equals `γ_{k+2j} = γ_2`.

## Layer 6: sums and polynomials

### 6.1 Summation on trees

Sources: [H, Algorithm 4.1 and (4.1), p. 89; (4.2)–(4.4), p. 90; (4.6), p. 92]; [M, Algorithm 5.5,
p. 177; (5.13), p. 178; (5.5), p. 168; Theorem 5.1, p. 171; p. 172]; [R, Theorem 2.1, p. 303].

- **Definitions** (`SumTree`, `leaves`, `depth`, `map`, `eval`, `HasStableEvaluation`,
  `HasInverseRelativeError`, `sumAbsComputed`, `SumsBoundedBy`, `leftComb`, `balanced`). Every
  scheme of [H, Algorithm 4.1, p. 89] (repeatedly replace two members of the multiset by their
  computed sum) is the evaluation of a tree whose leaves are a permutation of the terms;
  recursive summation in any order, pairwise summation and insertion are instances.
- **Recursive and pairwise summation** (`leftComb_balanced`). `leftComb n` has leaves
  `0, …, n` and depth `n`; `balanced r` has leaves `0, …, 2 ^ r - 1` and depth `r`.
- **Backward error** (`SumTree.exists_eval_eq_sum_mul`). For a scheme on `n` terms under the
  standard model with `(n - 1) u < 1`, `depth ≤ n - 1` and the computed sum is
  `∑ xᵢ (1 + εᵢ)` with `|εᵢ| ≤ γ_depth` [H, p. 90; R, (2.5), p. 303].
- **Forward error** (`SumTree.abs_eval_sub_sum_le`). `|Ŝ - S| ≤ γ_depth ∑ |xᵢ|`, hence
  `≤ γ_{n-1} ∑ |xᵢ|` [M, (5.5), p. 168; R, (2.5), p. 303].
- **Pairwise summation.** For `2 ^ r` terms summed pairwise, `|Ŝ - S| ≤ γ_r ∑ |xᵢ|`
  [H, (4.6), p. 92]. Route: `SumTree.abs_eval_sub_sum_le` at `balanced r`, whose depth is `r` by
  `leftComb_balanced`.
- **A posteriori bound** (`SumTree.abs_eval_sub_sum_le_computed`). Under the inverse model at
  every addition, `|Ŝ - S| ≤ u ∑ |T̂ᵢ|` over the `n - 1` computed partial sums [H, (4.3), p. 90;
  M, (5.13), p. 178].
- **Rump's bound** (`SumTree.abs_eval_sub_sum_le_nearest`). With correct rounding to nearest in a
  format, terms in `numbers` and no overflow, every scheme satisfies
  `|Ŝ - S| ≤ (n - 1) u ∑ |xᵢ|` for every `n` [M, Theorem 5.1, p. 171, for recursive summation;
  p. 172, for every order, after Jeannerod and Rump]. Route: [M, pp. 171–172] by induction on
  the tree, with `|δ| ≤ min(u |a + b|, |a|, |b|)` at each node (the nearest-point property
  against the numbers `a` and `b`).

**Checks.**

- `(balanced 2).leaves = [0, 1, 2, 3]` and `(balanced 2).depth = 2`; `(leftComb 3).depth = 3`.
- With adversarial factors `1 ± u` at `u = 2⁻¹⁰` over 3000 random trees and data, the forward
  error stays below `γ_depth ∑ |xᵢ|` (largest ratio `0.999`) and the a posteriori bound is attained
  (ratio `1.0`).
- Rump's bound with correct rounding to nearest, random trees, `n ≤ 30`: largest ratio to
  `(n - 1) u ∑ |xᵢ|` is `0.970` (`β = 2`, `p = 5`), `0.995` (`β = 10`, `p = 3`), `0.970`
  (`β = 3`, `p = 4`).
- Negative control (correct rounding is needed for `(n - 1) u`): under the standard model alone,
  `x = (1, 0, 0)` summed recursively with both factors `1 + u` gives `(1 + u)² = 1 + 2u + u²`,
  which exceeds `(n - 1) u ∑ |xᵢ| = 2u`.

### 6.2 Horner's rule

Sources: [H, (5.2), p. 104; (5.3), p. 105]; [M, Algorithm 5.3, p. 167; (5.7) and the remark on
the fused multiply-add, p. 168].

- **Definitions** (`horner`, `hornerFMA`, `HornerStable`, `HornerFMAStable`). For
  `a : Fin (n + 1) → ℝ` and `p(x) = ∑ aᵢ xⁱ`, `qₙ = aₙ` and `qᵢ = ∘(∘(x qᵢ₊₁) + aᵢ)`, or
  `qᵢ = ∘(x qᵢ₊₁ + aᵢ)` with a fused multiply-add.
- **Horner's rule** (`horner_backward`). Under the standard model with `2 n u < 1`,
  `q̂₀ = ∑ (1 + θᵢ) aᵢ xⁱ` with `|θᵢ| ≤ γ_{2i+1}` for `i < n` and `|θₙ| ≤ γ_{2n}`, hence
  `|p(x) - q̂₀| ≤ γ_{2n} ∑ |aᵢ| |x|ⁱ` [H, (5.2)–(5.3), pp. 104–105; M, (5.7), p. 168].
- **Horner's rule with a fused multiply-add** (`hornerFMA_backward`). With `n u < 1`,
  `|θᵢ| ≤ γ_{i+1}` for `i < n`, `|θₙ| ≤ γ_n`, and `|p(x) - q̂₀| ≤ γ_n ∑ |aᵢ| |x|ⁱ` [M, p. 168].
  Route: as for `horner_backward`, with one factor per step.

**Checks.**

- `n = 1`: `q̂₀ = (x a₁ (1 + δ₁) + a₀)(1 + δ₂)`, so `a₀` carries one factor (`γ_1`) and `a₁`
  two (`γ_2 = γ_{2n}`).
- With correct rounding to nearest (`β = 2`, `p = 8`, no overflow), 3000 random polynomials of
  degree 1 to 10 give largest ratios `0.640` to `γ_{2n} ∑ |aᵢ| |x|ⁱ` and `0.914` to the FMA bound.
- Negative control (two roundings per step need `γ_{2n}`): for `n = 1`, `a = (0, 1)`, `x = 1` and
  the factor `1 + u` at both operations, `q̂₀ = (1 + u)²` has error `2u + u²`, above the FMA bound
  `γ_1 = u/(1 - u)` and within `γ_2 = 2u/(1 - 2u)` (at `u = 2⁻⁸`: `0.00783`, `0.00392`,
  `0.00787`).

### 6.3 Compensated summation

Sources: [H, Algorithm 4.2 and (4.8), p. 93; p. 94]; [M, Algorithm 5.6, p. 179; (5.14),
Algorithm 5.8 and Priest's example, p. 180; Theorem 5.6, p. 181; Algorithm 5.11 and
Theorem 5.7, p. 182]; [R, Algorithm 3.5, p. 305; Theorem 3.6, p. 306].

- **The algorithms** (`kahanStep`, `kahanStepArgs`, `kahanSum`, `cascadedStep`,
  `cascadedStepArgs`, `cascadedSum`, `priestStep`, `priestStepArgs`, `priestSum`). Kahan's
  compensated summation from `s = e = 0`: `y = ∘(xᵢ + e)`, `t = ∘(s + y)`,
  `e = ∘(∘(s - t) + y)`, `s = t` [H, Algorithm 4.2, p. 93; M, Algorithm 5.6, p. 179, which
  carries the correction with the opposite sign]. Cascaded summation: `(s, eᵢ) = 2Sum(s, xᵢ)`,
  `e = RN(e + eᵢ)`, result `RN(s + e)` [M, Algorithm 5.11, p. 182]. Priest's doubly compensated
  summation [M, Algorithm 5.8, p. 180]. The lists `kahanStepArgs`, `cascadedStepArgs` and
  `priestStepArgs` hold the exact results that a step rounds, for the no-overflow hypotheses.
- **Kahan's compensated summation** (`exists_kahanSum_eq_sum_mul`). There is an absolute
  constant `C` such that, with correct rounding to nearest in any format, terms in `numbers`, no
  overflow and `n u ≤ 1/2`, the computed sum is `∑ (1 + μᵢ) xᵢ` with `|μᵢ| ≤ 2u + C n u²`;
  hence `|Ŝ - S| ≤ (2u + C n u²) ∑ |xᵢ|` [H, (4.8), p. 93; M, (5.14), p. 180; both after Knuth].
  The constant is quantified before the format and the data: a bound with a hidden dependence on
  `n` would be weaker.
- **Cascaded summation** (`abs_cascadedSum_sub_sum_le`). With correct rounding to nearest, terms
  in `numbers`, `n u < 1` and no overflow, even with underflow,
  `|σ - S| ≤ u |S| + γ_{n-1}² ∑ |xᵢ|` [M, Theorem 5.7, p. 182, after Ogita, Rump and Oishi].
- **Priest's doubly compensated summation** (`abs_priestSum_sub_sum_le`). With correct rounding
  to nearest, terms in `numbers` sorted by decreasing magnitude, `n ≤ β ^ (p - 3)` and no
  overflow, `|sₙ - S| ≤ 2u |S|` [M, Theorem 5.6, p. 181].

Route for underflow, common to the three theorems: Knuth's and Priest's analyses take no account
of underflow, and Ogita, Rump and Oishi state theirs for binary arithmetic, which
[M, Theorem 5.7, p. 182] states without a radix restriction. Each of the three algorithms only
adds and subtracts two numbers at a time. Such a result below `β ^ emin` is a number (Hauser's
lemma), so it is not rounded at all, and on the normal range the rounding agrees with that of the
same precision with an unbounded exponent range. The computation is therefore the one in that
unbounded range, to which the analyses apply; there the 2Sum steps of cascaded summation are
exact by Knuth's theorem in every radix [M, p. 108].

**Checks.**

- Kahan with correct rounding to nearest, 6000 random sums of up to 40 terms each in
  `(β, p) = (2, 6), (3, 4), (10, 3), (16, 3)`: the error never exceeds `2u ∑ |xᵢ|` (largest
  ratios `1.27`, `1.38`, `1.09`, `0.96`).
- Negative control (correct rounding is needed for the constant `2`): under the standard model
  alone, with `x = (1, 1)` and the eight rounding factors `1 + u`, `1 - u`, `1 - u`, `1 + u`,
  `1 + u`, `1 + u`, `1 - u`, `1 - u` in order, Kahan's recursion returns `2 + 5u + O(u²)`, so
  some `|μᵢ|` is at least `5u/2`. For `n = 3` equal terms the worst choice of signs gives the
  coefficient `8/3`. The rounding of `s - t`, exact under correct rounding in the cases that
  matter, carries the extra `u`.
- Priest's example [M, p. 180]: in binary with `p` bits, the terms `2 ^ (p + 1)`,
  `2 ^ (p + 1) - 2` and four times `-(2 ^ p - 1)` have sum `2`; Kahan's algorithm returns `3`, and
  Priest's algorithm on the sorted terms returns `2` (computed for `p = 6, 10, 24`).
- Cascaded summation and Priest's algorithm with underflow in range, for `(β, p)` equal to
  `(2, 6)`, `(10, 4)` and `(3, 5)`, 5000 random sums with cancellation: largest ratios `0.969`,
  `0.966`, `0.951` to the cascaded bound and `0.496`, `0.491`, `0.492` to `2u |S|`.

## Downstream consumers

- Interval arithmetic and verified enclosures consume the format, the directed roundings with
  `IsRounding.down_neg` and `IsRounding.faithful` for outward rounding, the standard model and
  `γ_n` (Layers 1–3, 5).
- Backward error analysis of matrix algorithms (inner and matrix products, triangular systems,
  LU, Cholesky and QR factorizations, iterative refinement) consumes `HasRelativeError`,
  `roundingGamma` with Layer 5, and the summation trees of 6.1 for inner products in any order;
  its bound `n u` for inner products with rounding to nearest extends Rump's bound of 6.1.
- Numerical methods whose analysis includes rounding (ODE solvers, quadrature, iterative
  solvers) consume the standard model of Layer 3 and `γ_n`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Owned here:
- floating-point formats as sets of reals, their canonical representations, exponent, quantum
  and spacing, and the IEEE binary32 and binary64 parameters;
- the rounding functions of the four modes, ties to even, and their existence, uniqueness,
  monotonicity, symmetry and faithfulness;
- the unit roundoff, the relative and absolute error of rounding, the standard model and its
  inverse, Hauser's and Sterbenz's lemmas, the representability of the errors of addition and
  multiplication;
- Fast2Sum, 2Sum and 2MultFMA;
- `HasRelativeError`, `roundingGamma` and the rules of Layer 5;
- summation trees with the backward, forward, a posteriori and Rump bounds; Horner's rule;
  Kahan's, cascaded and Priest's summation.

Not owned (consumed or out of scope):
- Mathlib's `Int.log`, `zpow`, `Int.floor`, `EReal`, `IsLeast`/`IsGreatest`, `Set.Finite`,
  `List.Perm` and finite sums and products are used as they are.
- Inner products, matrix–vector and matrix products, triangular systems and factorizations, with
  the bound `n u` for inner products under rounding to nearest, belong to backward error analysis
  of matrix algorithms, which builds on this roadmap.
- Interval arithmetic, outward-rounded interval operations and enclosure theorems belong to
  interval arithmetic and verified enclosures, which builds on this roadmap.
- Condition numbers and perturbation theory of linear systems belong to ConditioningAndPerturbation
  (open pull request #2807), which excludes rounding.

Boundary in one sentence: everything about a single format, its rounding functions and
algorithms on scalars and lists of scalars is here; anything indexed by matrices is not.

## Exact supplier contracts

### From Mathlib

- **Integer logarithm and powers:** `Int.log`, `Int.zpow_log_le_self`,
  `Int.lt_zpow_succ_log_self` (`Mathlib/Data/Int/Log.lean`); `zpow` on `ℝ`; `Int.floor`.
- **Order:** `EReal` with its coercion from `ℝ`, `⊥`, `⊤` and negation; `IsLeast`, `IsGreatest`,
  `Monotone`; `Set.Finite`.
- **Lists and sums:** `List.Perm`, `List.finRange`, `List.foldl`, `List.Pairwise`,
  `Finset.sum`, `Finset.prod`, `Fin.castSucc`, `Fin.castAdd`, `Fin.natAdd`, `Fin.cast`.

Mathlib's `Mathlib/Data/FP/Basic.lean` (radix 2, executable encoding, deprecated, no theorems)
and Lean's opaque `Float` are not used; nothing here refers to a machine encoding.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **IEEE 754 encodings and exceptions:** bit-level interchange formats, NaNs, signed zeros,
  infinities as operands, status flags, decimal encodings and radix conversion [M, Chapter 3].
- **Variants of ulp and faithful arithmetic:** the ulp functions of Harrison and Goldberg and
  their comparison [M, §2.3.2], faithful (not correctly rounded) arithmetic and Priest's
  sum-and-roundoff algorithm [M, Algorithm 4.5, p. 110], Fast2Sum and 2Sum with directed
  roundings [M, Theorems 4.6–4.7, p. 111].
- **Further error-free transformations:** Veltkamp splitting and Dekker's product without a
  fused multiply-add [M, §4.4.2], exact residuals of division and square root [R, p. 304,
  footnote 9], double-word arithmetic.
- **Sharper and different bounds:** the optimal bound `u - 2u²` for division in radix 2
  [M, p. 28], the bound `(n - 1)u/(1 + (n - 1)u)` for summation and `2nu` for Horner's rule
  [M, p. 173], bounds of Rump's type for directed roundings [M, p. 171], compensated Horner
  evaluation and K-fold summation.
- **Probabilistic rounding error analysis and stochastic rounding.**

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 8efdbf7, module `NASC/FloatingPoint.lean`, uses the same two-level model and
proves the following targets without `sorry`:
- §2.1: `IsRounding.monotone_and_eq`, for its definition of `IsRounding`, whose nearest case is
  the existential form of `isRounding_nearest_coe`;
- Layer 5: `hasRelativeError_prod_zpow`, and the first (monotonicity) and last (additive)
  conjuncts of `roundingGamma_rules`;
- §6.1: `SumTree.abs_eval_sub_sum_le` in the depth form, for the list of leaves, and
  `SumTree.abs_eval_sub_sum_le_computed`.

Its other statements of targets of this roadmap are not credited: they have admitted proofs, or
lack hypotheses that the statements here carry (its Kahan bound assumes only the standard model,
which the negative control of 6.3 refutes, and its Fast2Sum has no radix restriction, which the
negative control of 4.2 refutes). Its modules are a cited source, not the specification.

Related formalizations in other systems:
- Flocq (Coq), the library of Boldo and Melquiond [BM]: formats as sets of reals, rounding
  predicates, Sterbenz, Hauser, the error of addition and multiplication, Fast2Sum, 2Sum and
  Veltkamp–Dekker, with gradual underflow; the design of Layers 1–4 follows its choice of a
  real-valued model.
- Harrison's floating-point theory in HOL Light and the Isabelle AFP entry IEEE Floating Point
  formalize IEEE 754 encodings.
- No open Mathlib pull request concerns floating-point formats, rounding or rounding error
  analysis (GitHub search for "floating point", "rounding error", "Sterbenz" and "unit roundoff",
  2026-11-27).

## References

The locators refer to these editions; page numbers are printed page numbers.

- [M] J.-M. Muller, N. Brunie, F. de Dinechin, C.-P. Jeannerod, M. Joldes, V. Lefèvre,
  G. Melquiond, N. Revol and S. Torres, *Handbook of Floating-Point Arithmetic*, 2nd ed.,
  Birkhäuser, 2018.
- [H] N. J. Higham, *Accuracy and Stability of Numerical Algorithms*, SIAM, 1996 (1st edition).
- [R] S. M. Rump, Verification methods: rigorous results using floating-point arithmetic,
  *Acta Numerica* 19 (2010), 287–449.
- [BM] S. Boldo and G. Melquiond, *Computer Arithmetic and Formal Proofs: Verifying
  Floating-point Algorithms with the Coq System*, ISTE Press and Elsevier, 2017.
- D. E. Knuth, *The Art of Computer Programming*, Vol. 2, *Seminumerical Algorithms*, 3rd ed.,
  Addison-Wesley, 1998, §4.2.2 (2Sum and Kahan's summation, cited through [M] and [H]).
- T. Ogita, S. M. Rump and S. Oishi, Accurate sum and dot product, *SIAM J. Sci. Comput.* 26
  (2005), 1955–1988 (cascaded summation, cited through [M]).
- C.-P. Jeannerod and S. M. Rump, Improved error bounds for inner products in floating-point
  arithmetic, *SIAM J. Matrix Anal. Appl.* 34 (2013), 338–344 (the bound `(n - 1)u` in every
  order, cited through [M]).
- D. M. Priest, *On Properties of Floating Point Arithmetics: Numerical Stability and the Cost of
  Accurate Computations*, PhD thesis, University of California at Berkeley, 1992 (cited through
  [M]).
