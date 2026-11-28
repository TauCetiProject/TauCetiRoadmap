# Roadmap: threshold functions and margins

**Summary.** A single neuron with a threshold output computes a Boolean function by the sign of
an affine function of its inputs. This roadmap studies what such a unit can and cannot compute
and how well a finite labelled sample can be separated. Boolean inputs are points of the cube;
the neuron is the depth-one multilayer perceptron of the Tau Ceti library, and a polynomial
sign-represents a Boolean function when it is nonzero at every point of the cube and has the
function's sign there.

The first headline theorem is the exact threshold degree of symmetric functions. If the value of
a Boolean function on `n` bits depends only on the number `k` of true bits, and that value changes
between consecutive `k` exactly `c` times, then the least degree of a real polynomial
sign-representing the function is `c`. In particular parity needs degree `n`, so for `n ≥ 2` no
single neuron computes it: this is Minsky and Papert's theorem. On the way, the functions a single
neuron computes are shown to be exactly the functions of threshold degree at most one.

The second is Chow's theorem: a function computed by the single neuron, with values `±1`, is
determined among all `±1`-valued functions on the cube by its Fourier coefficients of degree at
most one, also when the affine output vanishes at points of the cube. The same holds in degree
`k` for functions that have the sign of a polynomial of degree at most `k`.

The third is about margins in a real inner product space. For a finite nonempty family of
points, the largest value, over vectors of norm at most one, of the least inner product with a
point of the family equals the distance from the origin to the convex hull of the family. For a
sample labelled `±1` with both labels present, the largest margin of an affine classifier whose
weight vector has norm at most one is half the distance between the convex hulls of the two
classes. Let `γ⋆` be the distance from the
origin to the convex hull of the sample points multiplied by their labels `±1`. When `γ⋆` is
positive, the perceptron makes at most `(R/γ⋆)²` updates on every sequence drawn from the sample,
where `R` bounds the norms, and no separator gives a better bound through Novikoff's theorem.

The roadmap builds on the Tau Ceti library that realizes Neuromanifolds (its multilayer
perceptrons and their realization maps), on DecisionTreeComplexity (the symmetrization of a
polynomial on the cube), on BooleanFunctionAnalysis (Walsh characters and Plancherel's identity)
and on OnlineLearningAndLittlestoneDimension (the perceptron and Novikoff's bound).

Below, Layer 1 defines the neuron, sign-representation and threshold degree, and identifies the
functions of the neuron; Layer 2 computes the threshold degree of symmetric functions; Layer 3
proves Chow's theorem; Layer 4 treats maximum margins and the perceptron. Layers 2 and 3 use
Layer 1; Layer 4 uses no other layer.

## Conventions

- **Cube and encodings.** A Boolean function on `n` bits is `f : (Fin n → Bool) → Bool`. For
  threshold degree an input `x` is the point `boolVec x` of `ℝⁿ` (`true ↦ 1`, `false ↦ 0`), the
  encoding of DecisionTreeComplexity 2.1, whose definition is copied verbatim. For Fourier
  coefficients the cube is `Fin n → ZMod 2` and a point `x` enters through its `±1` coordinates
  `walsh {i} x = (-1)^(x i)`, the encoding of BooleanFunctionAnalysis 1.1. `|x|` is the number of
  true bits, `#{i | x i = true}`.
- **The single neuron.** `neuron n` is the Tau Ceti specification `MLPSpec.linear ![n, 1]`: depth
  one, widths `n` and `1`, so no hidden layer and no activation. Its parameters `θ` are a
  `1 × n` weight matrix `W = (θ 0).1` and a bias `b = (θ 0).2`, and by the library's
  `MLPSpec.realize_depth_one` its output `neuronOutput θ x` is `Σ_j W 0 j · x j + b 0`. The output
  layer of a Tau Ceti perceptron is affine by construction, so the threshold is applied after the
  realization, never inside it.
- **Threshold convention.** The neuron computes `f` when `f x = true` exactly where the output is
  positive (`decide (0 < neuronOutput θ (boolVec x))`): an output `0` gives `false`, and in the
  `±1` form of Layer 3 it gives `-1`. This is the `{0, 1}`-valued form of O'Donnell (5.1), p. 113,
  with `1{ℓ > 0}`. Sign-representation, by contrast, is strict: `p` sign-represents `f` when
  `0 < (±1) · p(x)` at every point, with `+1` where `f` is true, so `p` has no zero on the cube
  (Bun–Thaler, eq. (2), p. 7).
- **Threshold degree.** `thresholdDegree f` is the `sInf` of the total degrees of polynomials in
  `MvPolynomial (Fin n) ℝ` that sign-represent `f`. That set is never empty (1.2), so the `sInf`
  is a least element and never the junk value of an empty set.
- **Margins.** `E` is a real inner product space, of any dimension. A family is `a : ι → E` with
  `ι` finite and nonempty; `margin a w` is the least `⟪w, a i⟫`. Directions range over the closed
  unit ball `‖w‖ ≤ 1`, not the sphere, so that the maximum is `0` rather than negative when the
  origin lies in the hull (Check of 4.1). Labels are real numbers, as in
  OnlineLearningAndLittlestoneDimension 3.1, assumed equal to `±1` as in its 3.2. Distances to sets are Mathlib's `Metric.infDist`, and
  the difference of two sets is the pointwise `A - B = {p - q | p ∈ A, q ∈ B}`.
- **Degenerate cases.** `n = 0` is allowed throughout: the cube has one point, the neuron output
  is its bias, and every function has threshold degree `0`. The margin statements need a nonempty
  index type; 4.2 needs both labels present, and 4.3 a positive distance.

## Layer 1: the single neuron and threshold degree

### 1.1 The neuron and linear threshold functions

Copy `boolVec` verbatim from DecisionTreeComplexity 2.1. Define `neuron n`, `neuronOutput θ x`
(the only coordinate of `(neuron n).realize θ x`) and `IsLinearThreshold f`: some
`θ : (neuron n).Parameters` has `f x = decide (0 < neuronOutput θ (boolVec x))` for every `x`.

- The output is affine in the input: `neuronOutput θ x = Σ_j W 0 j · x j + b 0`, which is Tau
  Ceti's `realize_depth_one` read at the only output coordinate; it equals the library's dense
  layer `TauCeti.Neuromanifold.dense (W, b)` at that coordinate.

**Checks.**

- `n = 2`: AND is computed with weights `(1, 1)` and bias `-3/2`, OR with `(1, 1)` and `-1/2`; with
  integer weights in `[-3, 3]` and biases in `(1/2)ℤ`, 14 of the 16 functions on two bits are
  computed, and the two others are XOR and its negation (2.2).
- Zeros of the output are allowed: weights `(1, 1)` and bias `-1` give output `0` at `10` and
  `01`, and the neuron computes AND, the same function as with bias `-3/2`.

### 1.2 Sign-representation and threshold degree

Define `SignRepresents p f`: `0 < (if f x then 1 else -1) · p(boolVec x)` for every `x`; and
`thresholdDegree f`, the `sInf` of the total degrees of the `p : MvPolynomial (Fin n) ℝ` with
`SignRepresents p f` (Bun–Thaler, §2.1, eq. (2), p. 7, on `{−1, 1}ⁿ`; the encodings differ by the
affine change `t ↦ 1 − 2t`, which preserves total degree).

- The set of degrees is nonempty and `thresholdDegree f ≤ n`: if `p` represents `f` in the sense of
  DecisionTreeComplexity 2.1 (`existsUnique_represents`: a multilinear `p` with value `1` where `f`
  is true and `0` elsewhere), then `2p − 1` sign-represents `f`, and its total degree is at most
  `n`. Hence `thresholdDegree f` is attained (Mathlib `Nat.sInf_mem`), and it is at most the
  degree of DecisionTreeComplexity 2.1.

**Checks.**

- A constant function has threshold degree `0` (the constant polynomial `±1`), and a nonconstant
  one has threshold degree at least `1`, since a constant polynomial has one sign.
- Strictness matters: the zero polynomial weakly represents every function, so without
  `p ≠ 0` on the cube every function would have threshold degree `0`.

### 1.3 The neuron computes exactly the functions of threshold degree at most one

Prove `isLinearThreshold_iff_thresholdDegree_le_one`: `IsLinearThreshold f` holds if and only if
`thresholdDegree f ≤ 1`. (Proved here. Bun–Thaler, p. 7, call a sign-representing polynomial of
degree one a linear threshold function; O'Donnell, p. 114, notes that a representation (5.1) can
be perturbed to avoid zeros on the cube. The statement here is that remark for the Tau Ceti neuron
with its zero convention.)

Route. If `θ` computes `f`, the output `ℓ(x) = Σ W 0 j x j + b 0` may vanish at points where `f`
is false. Let `ε > 0` be smaller than every positive value of `ℓ` on the cube (any `ε > 0` if
there is none). Then `ℓ − ε` is positive exactly where `ℓ` is, and has no zero on the cube, so the
polynomial `C (b 0 − ε) + Σ_j C (W 0 j) · X j`, of total degree at most one, sign-represents `f`.
Conversely, by 1.2 the threshold degree is attained by some `p` of total degree at most one; such
a `p` is `C c₀ + Σ_j C c_j · X j`, its value at `boolVec x` is `c₀ + Σ c_j x_j`, and the neuron with
weights `c_j` and bias `c₀` computes `f`, since `p` is nonzero with the sign of `f` at each point.

**Checks.**

- `n = 0`: both constant functions are computed (by the biases `1` and `-1`) and have threshold
  degree `0`.
- XOR on two bits: for every affine `p`, `p(1,0) + p(0,1) = p(0,0) + p(1,1)`, so `p` cannot be
  negative at `00` and `11` and positive at `10` and `01`; XOR has threshold degree `2` (2.2) and
  is not computed by the neuron.

*Needs:* 1.1, 1.2; DecisionTreeComplexity 2.1 (`existsUnique_represents`); Tau Ceti
`MLPSpec.realize_depth_one`; Mathlib `Nat.sInf_mem`, `MvPolynomial.totalDegree_add`,
`MvPolynomial.totalDegree_C`, `MvPolynomial.totalDegree_X`, `MvPolynomial.eval_eq`.

### Examples

- Majority on three bits is computed with weights `(1, 1, 1)` and bias `-3/2`; the integer search
  of 1.1 at `n = 3` finds 104 functions computed by the neuron, the functions used in the Checks of
  3.3.

### Dependencies

1.1 uses DecisionTreeComplexity 2.1 (the copied `boolVec`) and Tau Ceti's multilayer perceptrons.
1.2 uses 1.1 and DecisionTreeComplexity 2.1. 1.3 uses 1.1 and 1.2.

## Layer 2: threshold degree of symmetric functions

### 2.1 Symmetric functions

Prove `thresholdDegree_symmetric`: for `F : ℕ → Bool`, the function `x ↦ F |x|` on `n` bits has
threshold degree `#{j ∈ range n | F j ≠ F (j + 1)}`, the number of sign changes of `F` on
`0, 1, …, n`. The values of `F` beyond `n` play no role. (Bun–Thaler: the upper bound in §3.1,
eq. (6), p. 12, with the sign argument printed there; the lower bound in §5.2, p. 28, through the
symmetrization of their Lemma 22, p. 26. The source writes `q(i − 1) ≠ q(i)` where a change of
sign of `q` is meant, and in its sign argument the interval `[t_(k−2) + 1, t_(k−1)]` is printed
with `t_k` as right end; the route below says what is used.)

Route, upper bound. Let `t₁ < … < t_c` be the `j < n` with `F j ≠ F (j + 1)` and put
`P = σ · Π_r (Σ_i X i − (t_r + 1/2))`, of total degree at most `c` (Mathlib
`MvPolynomial.totalDegree_mul`). At `boolVec x` with `|x| = m` the factor `r` is negative exactly
when `m ≤ t_r`, so the sign of `P` at weight `m` is `σ (−1)^#{r | m ≤ t_r}`; it changes between `m`
and `m + 1` exactly when `m` is some `t_r`, as `F` does, and no factor vanishes. Choose `σ = ±1` so
that the signs agree at `m = n`.

Route, lower bound. Let `p` sign-represent `f` and let `q` be the univariate polynomial of
DecisionTreeComplexity 4.1 (`exists_natDegree_le_eval_mul_choose`): `natDegree q ≤ totalDegree p`
and `q(m) · C(n, m)` is the sum of `p(boolVec x)` over the `x` with `|x| = m`. That sum has at
least one term, and every term is nonzero with the sign of `F m`, so `q(m)` has the sign of `F m`
for `0 ≤ m ≤ n`. At each of the `c` changes `q` takes values of opposite signs at `t_r` and
`t_r + 1`, so it has a root in the open interval between them (Mathlib
`intermediate_value_Icc` for an increase, `intermediate_value_Icc'` for a decrease); these `c` roots are distinct, and `q ≠ 0` because `q(0) ≠ 0`. Hence
`c ≤ natDegree q ≤ totalDegree p` (Mathlib `Polynomial.card_le_degree_of_subset_roots`).

**Checks.**

- `n = 4`, `F = (true, false, false, true, true)`: two changes (after `0` and after `2`), and
  `(k − 1/2)(k − 5/2)` takes the values `5/4, −3/4, −3/4, 5/4, 21/4` at `k = 0, …, 4`, positive
  exactly where `F` is true.
- For every `F` and `n ≤ 5` the upper-bound polynomial sign-represents `x ↦ F |x|`, and a
  nonnegative, not identically zero weighting of the cube, concentrated on one weight in each of
  `c + 1` consecutive blocks of constant `F`, is orthogonal to `f` times every monomial of degree
  at most `c − 1`, which exhibits the lower bound independently of symmetrization (exact rational
  computation).
- Majority on three bits (`F = (false, false, true, true)`) has one change, threshold degree `1`,
  and is computed by the neuron (1.3).

*Needs:* 1.2; DecisionTreeComplexity 4.1 (`exists_natDegree_le_eval_mul_choose`); Mathlib
`MvPolynomial.totalDegree_mul`, `intermediate_value_Icc`, `intermediate_value_Icc'`,
`Polynomial.card_le_degree_of_subset_roots`.

### 2.2 Parity

The parity of `n` bits, `x ↦ decide (Odd |x|)`, has threshold degree `n`: this is the case
`F j = decide (Odd j)` of `thresholdDegree_symmetric`, since `Odd j` and `Odd (j + 1)` differ for
every `j < n`, and it is not restated as a separate theorem. Consequently, for `n ≥ 2`, parity is
not a linear threshold function (1.3). Bun–Thaler (p. 30) credit the parity bound to Minsky and
Papert's 1969 book and derive it from §5.2.

A direct proof of the lower bound: the parity character `x ↦ (−1)^|x|` is orthogonal on the cube
to every monomial of degree less than `n`, so `Σ_x (−1)^|x| p(boolVec x) = 0` for every `p` of degree less than `n`, while for
a `p` that sign-represents parity every term `(−1)^|x| p(boolVec x)` is negative, since `p` is
positive exactly at the `x` of odd weight.

**Checks.**

- `n = 2`: XOR has threshold degree `2`; the polynomial `−(k − 1/2)(k − 3/2)` of the weight `k`
  takes the values `−3/4, 1/4, −3/4` at `k = 0, 1, 2`, with the signs of XOR.
- `n = 0` and `n = 1`: parity is `false` and the identity, of threshold degree `0` and `1`.

*Needs:* 2.1; 1.3 for the consequence.

### Examples

- The function on `n` bits that is true exactly when `|x| ∈ {1, …, n − 1}` has two changes for
  `n ≥ 2`, so threshold degree `2`: it is not a linear threshold function although it is
  symmetric.

### Dependencies

2.1 uses 1.2 and DecisionTreeComplexity 4.1. 2.2 uses 2.1 and 1.3.

## Layer 3: Chow's theorem

### 3.1 Walsh characters and Fourier coefficients

Copy `walsh` and `walshCoeff` verbatim from BooleanFunctionAnalysis 1.1 and 1.2 (with their
`variable` lines): `walsh S x = Π_{i ∈ S} (−1)^(x i)` and `walshCoeff f S` is the average of
`f · walsh S` over the cube.

- What Layer 3 uses of BooleanFunctionAnalysis 1.1–1.2, where these facts are items of that
  roadmap: the average of `walsh S · walsh T` is `1` if `S = T` and `0` otherwise (the product is
  `walsh` of the symmetric difference, and a nonempty `walsh U` averages to `0` coordinate by
  coordinate), and `walshCoeff` is linear in the function. Hence a function
  `a₀ + Σ_i a_i walsh {i}` has `walshCoeff` zero on every `S` with at least two elements.

### 3.2 Chow's theorem in degree `k`

Prove `eq_of_walshCoeff_eq`: let `f, g` take the values `±1`, let `ℓ` have `walshCoeff ℓ S = 0`
for `|S| > k`, let `0 < f x · ℓ x` for every `x`, and let `walshCoeff g S = walshCoeff f S` for
`|S| ≤ k`. Then `g = f`. (O'Donnell, Theorem 5.8, p. 116; its proof is Exercise 5.9 there, and it
is the proof of Theorem 5.1, p. 114, with degree `k` in place of one, which is written out below.)

Route. By Plancherel (BooleanFunctionAnalysis 1.3, `expect_mul_eq_sum_walshCoeff`), the averages
of `f ℓ` and of `g ℓ` are `Σ_S walshCoeff f S · walshCoeff ℓ S` and the same with `g`; only
`|S| ≤ k` contribute, where the coefficients of `f` and `g` agree, so the two averages are equal.
Pointwise, `f x ℓ x = |ℓ x| ≥ g x ℓ x`, with equality only when `g x = f x`, because `ℓ x ≠ 0`
and `g x = ±1`. Equal averages of pointwise ordered functions force equality at every point.

**Checks.**

- `n = 3`, `k = 2`: the 254 functions that have the sign of some `ℓ` with coefficients in
  `{−1, 0, 1}` on the sets of size at most two are each the only `±1` function with their
  coefficients up to degree two; the only two `±1` functions on three bits that share all these
  coefficients are parity and its negation, which have threshold degree `3` (2.2).
- The values `±1` of `f` are needed: on one coordinate with `k = 0` and `ℓ = 1`, the function with
  values `1/2, 3/2` and the constant `1` have the same average, and `f ℓ > 0`.

*Needs:* 3.1; BooleanFunctionAnalysis 1.3 (`expect_mul_eq_sum_walshCoeff`).

### 3.3 Chow's theorem for the neuron

Define `neuronSign θ x`: `1` if `0 < neuronOutput θ (fun i => walsh {i} x)`, and `-1` otherwise.
Prove `eq_neuronSign_of_walshCoeff_eq`: every `g` with values `±1` whose Fourier coefficients on
the sets with at most one element equal those of `neuronSign θ` is `neuronSign θ`. (O'Donnell,
Theorem 5.1, p. 114, where the affine form is assumed nonzero on the cube after the perturbation
remark on the same page; here the output may vanish, and the perturbation is done in the route.)

Route. The output is `ℓ(x) = b 0 + Σ_j W 0 j walsh {j} x` (1.1). With `ε` as in 1.3, the function
`ℓ − ε` is positive exactly where `ℓ` is and has no zero, so `0 < neuronSign θ x · (ℓ x − ε)`;
`ℓ − ε` is a constant plus a combination of the `walsh {j}`, so its coefficients vanish on sets of
size at least two (3.1). Apply 3.2 with `k = 1`.

**Checks.**

- For `n ≤ 3`, each of the functions computed by integer weights in `[−3, 3]` and half-integer or
  integer biases (outputs `0` sent to `-1` included) is the only `±1` function with its degree-zero
  and degree-one coefficients: 2, 4, 14 and 104 functions for `n = 0, 1, 2, 3`, checked against all
  `2^(2^n)` functions.
- Linear threshold is needed: the parity `walsh {0, 1}` on two coordinates and its negation both
  have all coefficients of degree at most one equal to `0`.

*Needs:* 1.1, 3.1, 3.2.

### Examples

- On three coordinates, majority `neuronSign` with weights `(1, 1, 1)` and bias `0` has
  coefficients `1/2, 1/2, 1/2` on the singletons and `0` on the empty set; no other `±1` function
  has them.

### Dependencies

3.1 uses BooleanFunctionAnalysis 1.1 and 1.2 (copied). 3.2 uses 3.1 and BooleanFunctionAnalysis
1.3. 3.3 uses 1.1, 3.1 and 3.2.

## Layer 4: maximum margins and the perceptron

### 4.1 The maximum margin is the distance to the hull

Define `margin a w`, the least `⟪w, a i⟫` over a nonempty finite family. Prove
`isGreatest_margin`: the set of margins of the `w` with `‖w‖ ≤ 1` has greatest element
`γ⋆ = Metric.infDist 0 (convexHull ℝ (range a))`; and when `γ⋆ > 0`, every point `c` of the hull
with `‖c‖ = γ⋆` gives the only maximizing direction, `w = ‖c‖⁻¹ • c` (so that point is unique).
(Proved here.)

Route. For every `w` with `‖w‖ ≤ 1` and every `c` in the hull, `margin a w ≤ ⟪w, c⟫ ≤ ‖c‖`: the
half-space `{z | margin a w ≤ ⟪w, z⟫}` is convex and contains the family, hence the hull (Mathlib
`convexHull_min`), and the second step is `real_inner_le_norm`. So every margin is at most `γ⋆`
(Mathlib `Metric.le_infDist`). The hull is compact (`Set.Finite.isCompact_convexHull`), so some
`c⋆` in it has `‖c⋆‖ = γ⋆` (`IsCompact.exists_infDist_eq_dist`). If `γ⋆ = 0`, `w = 0` has margin
`0`. If `γ⋆ > 0`, the variational inequality of the nearest point
(`norm_eq_iInf_iff_real_inner_le_zero`) gives `⟪c⋆, z − c⋆⟫ ≥ 0` for `z` in the hull, so
`w⋆ = c⋆ / γ⋆` has margin at least `γ⋆`. Uniqueness: a maximizer `w` and a nearest point `c` give
`γ⋆ ≤ ⟪w, c⟫ ≤ ‖w‖ ‖c‖ ≤ γ⋆`, equality in Cauchy–Schwarz with `‖w‖ = 1`
(`inner_eq_norm_mul_iff_real`).

**Checks.**

- `a = ((1, 0), (0, 1))` in `ℝ²`: the nearest point of the segment is `(1/2, 1/2)`, `γ⋆² = 1/2`,
  and `(1, 1)/√2` has margin `1/√2`.
- The ball, not the sphere: for `a = (1, −1)` in `ℝ` the origin is in the hull, `γ⋆ = 0` is the
  margin of `w = 0`, and over the unit sphere `{1, −1}` the largest margin is `−1`.
- Uniqueness needs `γ⋆ > 0`: for `a = ((1, 0), (−1, 0))` in `ℝ²` the margin of `w` is `−|w₁|`, so
  every `w = (0, t)` with `|t| ≤ 1` attains the maximum `γ⋆ = 0`.

*Needs:* Mathlib `convexHull_min`, `real_inner_le_norm`, `Metric.le_infDist`,
`Set.Finite.isCompact_convexHull`, `IsCompact.exists_infDist_eq_dist`,
`norm_eq_iInf_iff_real_inner_le_zero`, `Metric.infDist_eq_iInf`, `inner_eq_norm_mul_iff_real`.

### 4.2 The affine margin is half the distance between the hulls

Define `affineMargin x y w b`, the least `y i · (⟪w, x i⟫ + b)`. Prove `isGreatest_affineMargin`:
for labels `±1` with both labels present, the affine margins of the pairs `(w, b)` with
`‖w‖ ≤ 1` and `b ∈ ℝ` have greatest element `δ / 2`, where `δ` is the distance from the origin to
`P − N`, `P` and `N` the convex hulls of the points labelled `1` and `−1`; `δ` is the distance
between the two hulls. (Proved here.)

Route. Upper bound: if `m` is the affine margin of `(w, b)`, then `⟪w, p⟫ + b ≥ m` on `P` and
`−(⟪w, q⟫ + b) ≥ m` on `N` (each a convex half-space containing the points of one class), so
`2m ≤ ⟪w, p − q⟫ ≤ ‖p − q‖` for all `p ∈ P`, `q ∈ N`, and `2m ≤ δ`. Attainment: if `δ = 0`,
`(0, 0)` has margin `0`. Otherwise `P − N` is the hull of the finite set of differences (Mathlib
`convexHull_sub`), compact, with a nearest point `p⋆ − q⋆` of norm `δ`; as in 4.1,
`⟪p − q⋆, p⋆ − q⋆⟫ ≥ δ²` and `⟪p⋆ − q, p⋆ − q⋆⟫ ≥ δ²` for `p ∈ P`, `q ∈ N`. With
`w = (p⋆ − q⋆)/δ` and `b = −⟪w, p⋆ + q⋆⟫/2`, every point labelled `1` has
`⟪w, x i⟫ + b ≥ ⟪w, q⋆⟫ + δ − ⟪w, p⋆ + q⋆⟫/2 = δ/2`, and symmetrically for `−1`.

**Checks.**

- `P = {1, 2}`, `N = {−1}` in `ℝ`: `δ = 2`; `w = 1`, `b = 0` give margins `1, 2, 1`, so the maximum
  `1 = δ/2` is attained, and no `w ∈ [−1, 1]`, `b` on a grid of step `1/4` does better.
- Both labels are needed: with only the label `1`, `w = 0` and `b → ∞` give unbounded margins, and
  there is no greatest element.
- The ball, not the sphere: for `P = {−1, 1}`, `N = {0}` the hulls meet, the maximum is `0` at
  `(0, 0)`, while `w = ±1` give at most `−1/2`.

*Needs:* 4.1's route; Mathlib `convexHull_sub`, `convexHull_min`, `Set.Finite.isCompact_convexHull`,
`IsCompact.exists_infDist_eq_dist`, `norm_eq_iInf_iff_real_inner_le_zero`, `Metric.infDist_eq_iInf`,
`real_inner_le_norm`, `Metric.le_infDist`.

### 4.3 The perceptron on a finite sample

Copy `perceptronWeight` and `perceptronUpdates` verbatim from OnlineLearningAndLittlestoneDimension
3.1 (with their `variable` line). Prove `card_perceptronUpdates_le_sq_div_infDist`: let `x : ι → E`
be a finite nonempty sample with labels `y i = ±1`, `‖x i‖ ≤ R`, and
`γ⋆ = Metric.infDist 0 (convexHull ℝ (range (y • x)))` positive. Then for every sequence of indices
`s : ℕ → ι` and every `T`, the perceptron run on the examples `(x (s t), y (s t))` makes at most
`(R / γ⋆)²` updates among its first `T` rounds; and `R / γ⋆ ≤ R ‖u‖ / γ` for every `u` and `γ > 0`
with `γ ≤ y i ⟪u, x i⟫` for all `i`, so `γ⋆` gives the best bound Novikoff's theorem gives on
this sample. (Proved here, from 4.1 above and OnlineLearningAndLittlestoneDimension 3.2.)

Route. By 4.1 there is `w⋆` with `‖w⋆‖ ≤ 1` and `γ⋆ ≤ ⟪w⋆, y i • x i⟫ = y i ⟪w⋆, x i⟫` for all `i`.
OnlineLearningAndLittlestoneDimension 3.2 (`card_perceptronUpdates_le`) with `u = w⋆` and
`γ = γ⋆` bounds the updates by `(R ‖w⋆‖ / γ⋆)² ≤ (R / γ⋆)²`, since `R ≥ ‖x i‖ ≥ 0`. For the second
part, `u ≠ 0` because `γ > 0`, and `u / ‖u‖` has norm one and margin at least `γ / ‖u‖` on the
points `y i • x i`, so `γ / ‖u‖ ≤ γ⋆` by 4.1.

**Checks.**

- `x = ((1, 0), (0, 1))`, both labelled `1`: `R = 1`, `γ⋆² = 1/2`, the bound is `2`, and the run on
  the alternating sequence makes exactly `2` updates.
- Three points `(2, 1)`, `(1, 2)` labelled `1` and `(−1, −1)` labelled `−1`: the nearest point of
  the hull of the `y i • x i` is `(1, 1)`, the bound is `5/2`, and each of the `3⁸` sequences of
  length eight makes at most one update.
- Labels `±1` are needed: one point `x = 1` with label `3` has `γ⋆ = 3`, `R = 1`, bound `1/9`, and
  the perceptron makes one update.
- `γ⋆ > 0` is needed: for `x = (1, −1)` both labelled `1` the origin is in the hull, the right side
  is `(R/0)² = 0` with Lean's division, and the first round is an update.

*Needs:* 4.1; OnlineLearningAndLittlestoneDimension 3.1 (copied) and 3.2
(`card_perceptronUpdates_le`).

### Examples

- The maximizing direction of 4.1 for the points `y i • x i` is the homogeneous maximum-margin
  separator, and 4.3 says that the perceptron's guarantee is governed by its margin. The affine
  maximizer of 4.2 is not of this form: there the offset `b` is free while only `‖w‖ ≤ 1` is
  constrained.

### Dependencies

4.1 uses Mathlib only. 4.2 uses Mathlib only (it repeats the argument of 4.1 on differences). 4.3
uses 4.1 and OnlineLearningAndLittlestoneDimension 3.1 and 3.2.

## Scope and ownership

This roadmap owns: the single neuron of the Tau Ceti library read as a linear threshold unit on
the cube; sign-representation and threshold degree; the identification of the neuron's functions
with threshold degree at most one; the threshold degree of symmetric functions and of parity;
Chow's theorem in degree `k` and for the neuron; the maximum homogeneous and affine margins of a
finite sample; and the perceptron bound in terms of the distance to the hull.

Stated elsewhere and not restated here:

- Tau Ceti's `TauCeti/Geometry/Neuromanifold/` library, which realizes Neuromanifolds, owns
  multilayer perceptron specifications, their parameters and realization maps; this roadmap uses
  the depth-one specification and `realize_depth_one`, and states nothing about neuromanifolds,
  fibres or identifiability.
- DecisionTreeComplexity owns `boolVec`, the degree of a Boolean function and its multilinear
  representation (2.1), and the symmetrization of a polynomial (4.1); `boolVec` is copied verbatim
  and the others are cited. The threshold degree is a different quantity (signs, not values).
- BooleanFunctionAnalysis owns the Walsh characters, Fourier coefficients and the Walsh expansion
  (1.1–1.2) and Plancherel's identity (1.3); `walsh` and `walshCoeff` are copied verbatim, and its
  1.5 (sign-valued functions of degree at most one are dictators or constants) is about functions
  equal to their degree-one part, not about their signs.
- OnlineLearningAndLittlestoneDimension owns the perceptron sequence (3.1), Novikoff's bound
  (3.2), the hinge-loss bound (3.3) and the halving learner (2.2); the perceptron is copied
  verbatim and 3.2 is cited, never restated.
- MathematicalStatisticsAsymptotic 3.5 owns the VC dimension of families of sets; the VC
  dimension of half-spaces and generalization bounds for margins are not treated here.

Not treated here: Cover's function-counting theorem, the capacity of a linear threshold unit
(`2 Σ_(k<d) C(N − 1, k)` dichotomies of `N` points in general position in `ℝ^d`), is deliberately
left out because "network capacity" is listed under "Deep learning theory" in the "Beyond this
roadmap" list of the roadmap StatisticalLearningTheory by another contributor (pull request
[#2515](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2515)). This is a statement of
scope only: this roadmap does not depend on that one and cites nothing from it. Also not treated:
the perceptron cycling theorem for non-separable data; threshold degree of non-symmetric functions
such as the Minsky–Papert CNF; Winnow and kernel perceptrons; soft-margin classifiers; threshold
circuits of depth two or more, which compute parity.

## Exact supplier contracts

### From Mathlib

- `Metric.infDist` (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean`), with `Metric.le_infDist`
  (for a nonempty set, `r ≤ infDist x s` iff `r ≤ dist x y` for all `y ∈ s`) and
  `IsCompact.exists_infDist_eq_dist` (a compact nonempty set has a nearest point) and
  `Metric.infDist_eq_iInf` (the distance as an infimum over the set) in the same file.
- `convexHull`, `convexHull_min` (`Mathlib/Analysis/Convex/Hull.lean`); `convexHull_sub`
  (`Mathlib/Analysis/Convex/Combination.lean`: the hull of `s − t` is the difference of the hulls);
  `Set.Finite.isCompact_convexHull` (`Mathlib/Analysis/Convex/Topology.lean`).
- `norm_eq_iInf_iff_real_inner_le_zero`
  (`Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean`: `v` in a convex
  `K` is nearest to `u` iff `⟪u − v, w − v⟫ ≤ 0` for all `w ∈ K`);
  `real_inner_le_norm`, `inner_eq_norm_mul_iff_real`
  (`Mathlib/Analysis/InnerProductSpace/Basic.lean`).
- `MvPolynomial.totalDegree`, `MvPolynomial.totalDegree_add`, `MvPolynomial.totalDegree_mul`,
  `MvPolynomial.totalDegree_C`, `MvPolynomial.totalDegree_X`
  (`Mathlib/Algebra/MvPolynomial/Degrees.lean`);
  `MvPolynomial.eval_eq` (`Mathlib/Algebra/MvPolynomial/Eval.lean`);
  `Polynomial.card_le_degree_of_subset_roots` (`Mathlib/Algebra/Polynomial/Roots.lean`);
  `intermediate_value_Icc`, `intermediate_value_Icc'`
  (`Mathlib/Topology/Order/IntermediateValue.lean`); `Nat.sInf_mem`
  (`Mathlib/Order/Lattice/Nat.lean`); `Finset.inf'`, `Finset.expect`.

### From Tau Ceti

- `TauCeti.Neuromanifold.MLPSpec` with `MLPSpec.Parameters`, `MLPSpec.realize`,
  `MLPSpec.realize_depth_one` (a depth-one specification realizes `(θ 0).1 *ᵥ x + (θ 0).2`) and
  `MLPSpec.linear` (identity hidden activations) (`TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`).
  This is the library realization of the roadmap Neuromanifolds; nothing is copied from that
  roadmap's own files.
- `TauCeti.Neuromanifold.dense` (`TauCeti/Geometry/Neuromanifold/Dense.lean`), named in 1.1 only
  to identify the neuron's output with a dense layer.

### From TauCetiRoadmap.DecisionTreeComplexity

- 2.1 `boolVec` (copied verbatim) and `existsUnique_represents` (every Boolean function has a
  multilinear representing polynomial), in 1.2 and 1.3.
- 4.1 `exists_natDegree_le_eval_mul_choose` (for `p` in `m` variables there is `q` with
  `natDegree q ≤ totalDegree p` and `q(k) C(m, k) = Σ_(|x| = k) p(boolVec x)` for `k ≤ m`), in 2.1.

### From TauCetiRoadmap.BooleanFunctionAnalysis

- 1.1 `walsh` and 1.2 `walshCoeff` (copied verbatim, with their `variable` lines: `ι` a type,
  then `[Fintype ι] [DecidableEq ι]`).
- 1.3 `expect_mul_eq_sum_walshCoeff` (Plancherel: the average of `f g` is the sum over `S` of the
  products of the coefficients), in 3.2.

### From TauCetiRoadmap.OnlineLearningAndLittlestoneDimension

- 3.1 `perceptronWeight`, `perceptronUpdates` (copied verbatim, with the `variable` line
  `{E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]`).
- 3.2 `card_perceptronUpdates_le` (labels `±1` and `‖x t‖ ≤ R` for `t < T`, `γ > 0` and
  `γ ≤ y t ⟪u, x t⟫` for `t < T`: at most `(R ‖u‖ / γ)²` updates among the first `T` rounds),
  in 4.3.

## References

- M. Bun and J. Thaler, *Approximate degree in classical and quantum computing*, Foundations and
  Trends in Theoretical Computer Science 15 (2022), no. 3–4; cited in the authors' version of
  May 16, 2023, https://people.cs.georgetown.edu/jthaler/adegFnT.pdf (J. Thaler's page; the same
  file is on M. Bun's page), whose page numbers are used. Used: §2.1, eq. (2), p. 7
  (threshold degree, sign-representation); §3.1, eq. (6), p. 12; Lemma 22, p. 26; §5.2, p. 28;
  p. 30 (Minsky and Papert on parity).
- R. O'Donnell, *Analysis of Boolean Functions*, arXiv:2105.10386v1 (2021). Used: §5.1, eq. (5.1),
  p. 113; the perturbation remark and Theorem 5.1, p. 114; Theorem 5.8, p. 116.
