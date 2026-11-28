# Roadmap: interval arithmetic and verified enclosures

**Summary.** This roadmap builds real interval arithmetic and the theorems that turn computations
with intervals into proofs. The objects are nonempty compact intervals `[a, b]` of reals, boxes
and interval matrices, arithmetic expressions built from the four operations and continuous
standard functions, and outward rounding to a floating-point format. The headline results are:
- the exact endpoint rules for sums, differences, products and quotients (`0 ∉ Y`), so that each
  interval operation returns exactly the set of results;
- the fundamental theorem of interval arithmetic: the natural interval extension of an expression
  contains the range of the expression over the box, shrinks with the box, is itself an interval,
  and equals the range when no variable occurs twice;
- the order of overestimation: the width of the natural extension is linear in the width of the
  box, and the mean-value form `f(m) + ∑ Dᵢ (Xᵢ − mᵢ)` overestimates the range by at most
  `2 n L' ‖w(X)‖²`;
- outward rounding: `RD z = RU z` exactly on the format, the rounded interval is the least
  floating-point interval containing the exact one, rounded evaluation contains the exact
  natural extension, and rounding widens by at most `2u|z|` at a point and `4u mid(X + Y)` for a
  sum of nonnegative intervals;
- verification for linear systems: `ρ(I − RA) < 1` or `‖I − RA‖ < 1` proves `A` and `R`
  nonsingular, with the residual bound `‖A⁻¹b − x̃‖ ≤ ‖R(b − Ax̃)‖/(1 − ‖I − RA‖)`; an affine map
  sending a box into its interior has spectral radius below `1`; and the interior inclusion
  `R(b − Ax̃) + (I − RA)X ⊆ int X` encloses the solutions of every system in an interval family;
- the interval Newton test in one and several variables and Krawczyk's test: an inclusion of the
  Newton or Krawczyk image in the box (in its interior, for Krawczyk) proves existence and
  uniqueness of a zero, disjointness proves its absence;
- Plum's existence and enclosure theorem in Banach spaces: from a residual bound `δ`, an inverse
  bound `K` for the linearization and a modulus of continuity `g` of the derivative, the
  inequality `δ ≤ α/K − ∫₀^α g` proves a zero within distance `α`, nondegenerate and locally
  unique under `K g(α) < 1`, in a compact case and in a dense-range case;
- the constructive Aubin–Nitsche bounds for an orthogonal projection, and the constant `h/π` for
  piecewise linear interpolation in one dimension, with Wirtinger's inequality as its core.

The roadmap is the verification layer of numerical analysis in Tau Ceti. It takes the
floating-point formats and the directed roundings from the FloatingPointArithmetic roadmap and
adds only what intervals need, and it takes the abstract Aubin–Nitsche lemma from the
GalerkinMethodsAndLagrangeFiniteElements roadmap. It consumes Tau Ceti's Brouwer and Schauder
fixed-point theorems (existence in the interval Newton and Krawczyk tests and in Plum's theorem),
its Neumann-series bound (the residual bound), its Fredholm theory of compact perturbations (the
compact case of Plum's theorem) and its sharp periodic Wirtinger inequality (the constant `h/π`).
Plum's theorem is a quantitative relative of the Newton–Kantorovich theorem of
[NewtonAndQuasiNewtonMethods](../NewtonAndQuasiNewtonMethods/README.md) §2.1, which supplies the
analogue but nothing that is consumed: with a Lipschitz modulus `g(t) = L t` the two hypotheses
coincide. Rational intervals with dyadic outward rounding, as used for certified computation in
number theory, are those of [ComputationalNumberTheory](../ComputationalNumberTheory/README.md)
Layer 4; this roadmap works with real endpoints and floating-point formats. The roadmap is a
synthesis of Rump's survey of verification methods, the interval chapter of the *Handbook of
Floating-Point Arithmetic* by Muller et al., and the monograph of Nakao, Plum and Watanabe on
computer-assisted proofs for differential equations; it follows none of them section by section.

Suggested home: `TauCeti/Numerics/Interval/`.

## How to read the build

Layer 1 proves the endpoint rules: an interval operation is the image of the two intervals under
the operation. Layer 2 defines expressions, their real evaluation and their natural interval
extension as a set built from exact images, and proves the fundamental theorem; by Layer 1 the
set-valued extension is what endpoint arithmetic computes. Layer 3 measures the overestimation of
the natural extension and of the mean-value form. Layer 4 adds outward rounding to a
floating-point format and proves that rounded evaluation still encloses, with width bounds.

Layers 5 and 6 are the verification theorems in finite dimensions. Layer 5 treats linear
systems: the norm and spectral-radius tests, interval matrix–vector products, the spectral bound
from an interior inclusion, and the verified solution of point and interval systems. Layer 6
treats nonlinear systems: the univariate interval Newton test, the interval mean value theorem,
the interval Newton test and Krawczyk's test, which uses the spectral bound of 5.2. Layer 7
leaves finite dimensions: Plum's existence theorem for an approximate zero of a map between
Banach spaces, and the constructive projection error constants that make its inverse bound
computable for elliptic problems.

Layers 1–3 need only Mathlib; Layer 4 needs Layers 1–2 and the floating-point model; Layer 5
needs Layer 1; Layer 6 needs Layer 5 and Tau Ceti's Brouwer theorem; Layer 7 needs Mathlib, Tau
Ceti and, for the Aubin–Nitsche bounds, the Galerkin roadmap's §1.4. Each subsection ends with a
*Needs:* line naming its inputs.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.IntervalArithmeticAndVerifiedEnclosures`.
- **Intervals** are `NonemptyInterval ℝ`: real endpoints `X.fst ≤ X.snd`, with set
  `Set.Icc X.fst X.snd`. Empty and unbounded intervals are not modelled. The width is Mathlib's
  `NonemptyInterval.length`, the midpoint is `intervalMid`, a real number `a` is the point
  interval `NonemptyInterval.pure a`, and `X ≤ Y` is containment of `X` in `Y`. Sums and
  differences are Mathlib's operations on `NonemptyInterval ℝ`; products and quotients are
  `cornerHull` of the operation, the interval between the least and the greatest of the four
  corner values, taken with `min` and `max` (never an infimum or supremum of a set).
- **Boxes and interval matrices.** A box is `box X` for `X : ι → NonemptyInterval ℝ`, the set of
  points with `x i ∈ X i`; an interval matrix `J : Fin m → Fin k → NonemptyInterval ℝ` is read
  through `intervalMatrix J`, the set of real matrices with `M i j ∈ J i j`. Interval
  matrix–vector products `intervalMulVec` are computed by interval operations. Hypotheses of the
  verification theorems are stated on these sets of real points and matrices; each interval
  computation of the sources is contained in them by 5.2, so the interval forms are corollaries.
- **Division and inverses.** `x / 0 = 0` and `M⁻¹ = 0` for singular `M` in Lean. Every quotient
  carries `0 ∉ Y` or an admissibility hypothesis, and every `M⁻¹` a determinant hypothesis or a
  conclusion that proves it.
- **Expressions** are the inductive type `IntervalExpr ι`: variables, real constants, the four
  operations and a standard function node carrying `f : ℝ → ℝ` and its domain `dom : Set ℝ`.
  Evaluation `IntervalExpr.eval` is total; `IntervalExpr.DefinedAt` records where it is
  meaningful, and `IntervalExpr.Admissible` records that the natural extension is defined
  (no divisor enclosure contains `0`, every argument enclosure lies in the domain, every standard
  function is continuous on its domain).
- **Floating point.** The format, its numbers, the normal range, the directed roundings and the
  unit roundoff are those of the FloatingPointArithmetic roadmap (§§1.1 and 2.1), copied verbatim:
  `FloatingPointFormat`, `FloatingPointFormat.value`, `FloatingPointFormat.Valid`,
  `FloatingPointFormat.numbers`, `FloatingPointFormat.minNormal`, `FloatingPointFormat.maxFinite`,
  `FloatingPointFormat.normalRange` (§1.1), `RoundingMode`, `FloatingPointFormat.extendedNumbers`,
  `FloatingPointFormat.IsRoundToNearest`, `FloatingPointFormat.IsRounding` and
  `FloatingPointFormat.unitRoundoff` (§2.1). Directed roundings are maps `ℝ → EReal` and overflow to
  `±∞`; `u` is `unitRoundoff .nearest`, that is `β^(1−p)/2`, as in the sources.
- **Spectral radius.** The spectral radius of a real matrix is `spectralRadius ℂ` of its
  complexification `A.map (algebraMap ℝ ℂ)`, valued in `ℝ≥0∞`. The real spectral radius, which
  ignores nonreal eigenvalues, is not used.
- **Norms.** Matrix norms are opened per statement: the `∞` operator norm through
  `Matrix.Norms.Operator`; an arbitrary induced norm is the operator norm of `E →L[ℝ] E` on a
  finite-dimensional normed space `E`. On `Fin n → ℝ` the norm is the sup norm, so
  `‖fun i ↦ (X i).length‖` is the largest width of the box.
- **Derivatives.** `fderiv` appears only under `DifferentiableOn` or `ContDiffOn` on an open set
  containing the points where it is evaluated. The Jacobian entry `(i, j)` at `x` is
  `fderiv ℝ f x (Pi.single j 1) i`.
- **Widths without suprema.** A width bound for a set `S` is stated as `|s − t| ≤ c` for all
  `s, t ∈ S`, and the excess of one width over another by exhibiting points; no supremum or infimum
  of a possibly empty or unbounded set occurs.
- **Locators** are `[R]`, `[M]`, `[NPW]` with a theorem, equation or section and a printed page,
  in the editions under [References](#references). A headline marked *route* is a corollary or an
  adaptation and carries a proof sketch; the others restate a source result.

## Layer 1: interval operations

### 1.1 Endpoint rules

Sources: [R, (5.4), p. 310; p. 311]; [M, Definition 12.2 and (12.1), p. 454].

- **Definitions** (`cornerHull`, `intervalMid`, `box`). As in the Conventions.
- **Sums and differences** (`coe_add`, `coe_sub`), proved Checks: the interval sum and difference
  are the sets of sums and differences, by Mathlib's `Set.Icc_add_Icc` and `Set.Icc_sub_Icc`
  [R, p. 311]. Widths add under both, Mathlib's `NonemptyInterval.length_add` and
  `NonemptyInterval.length_sub` [R, §5.2, p. 311].
- **Products** (`coe_cornerHull_mul`). The set of products `x y`, `x ∈ X`, `y ∈ Y`, is the
  interval between the least and greatest corner products, for every sign pattern, including
  `0 ∈ X` and `0 ∈ Y` [R, (5.4), p. 310; M, (12.1), p. 454]. Route: `x ↦ x y` and `y ↦ x y` are
  monotone or antitone, so extrema over the rectangle are attained at corners; the image is
  connected, hence the whole interval.
- **Quotients** (`coe_cornerHull_div`). If `0 ∉ Y`, the same holds for `x / y`
  [R, (5.4), p. 310; M, (12.1), p. 454]. Route: on `Y` the map `y ↦ 1/y` is continuous and
  monotone, and the product rule applies to `X` and `1/Y`.

*Needs:* Mathlib `NonemptyInterval`, `Set.Icc_add_Icc`, `Set.Icc_sub_Icc`, `Set.image2`.

**Checks.**

- `[−1, 2] · [−3, 1] = [−6, 3]`: the corners are `3, −1, −6, 2`.
- Negative control (all four corners are needed): the rule `[X.fst · Y.fst, X.snd · Y.snd]`, right
  for nonnegative intervals, gives `[3, 2]` for `[−1, 2] · [−3, 1]`, not even an interval; for
  `[−2, −1] · [3, 4]` the corners give `[−8, −3]`, while that rule gives `[−6, −4]`.
- `[1, 2] − [1, 2] = [−1, 1]`, of width `2 = 2 w([1, 2])`, although `x − x = 0`
  [NPW, §12.3.3, p. 431; M, p. 456, with `[0, 1]`].
- Negative control (the hypothesis `0 ∉ Y`): for `[1, 2] / [−1, 1]` the corner interval is
  `[−2, 2]`, while the set of quotients is `(−∞, −1] ∪ [1, ∞)` together with the junk value `0`
  from `x / 0 = 0`.

## Layer 2: expressions and the natural interval extension

### 2.1 Expressions

Sources: [M, Definition 12.3, p. 455]; [R, (5.16)–(5.17), p. 314].

- **Definitions** (`IntervalExpr`, `IntervalExpr.eval`, `IntervalExpr.DefinedAt`,
  `IntervalExpr.enclosure`, `IntervalExpr.Admissible`, `IntervalExpr.occurrences`). The natural
  interval extension `IntervalExpr.enclosure X e` replaces each variable `i` by `X i` and each
  operation and standard function by its image, so the occurrences of a variable range
  independently. A standard function `f` with domain `dom` acts on a set `Z ⊆ dom` by `f '' Z`
  [M, Definition 12.2, p. 454].

*Needs:* 1.1.

### 2.2 The fundamental theorem

Sources: [M, Theorem 12.1, p. 455]; [R, (5.16)–(5.17), p. 314; Theorem 8.1, p. 321];
[NPW, §12.3.3, p. 431].

- **Inclusion** (`IntervalExpr.definedAt_and_eval_mem_enclosure`). If the natural extension is
  admissible on `X`, then the expression is defined at every point `x` of the box and its value
  lies in the extension [M, Theorem 12.1, p. 455; R, (5.17), p. 314]. Route: induction on the
  expression; a divisor value lies in a divisor enclosure, which avoids `0`.
- **Inclusion isotonicity** (`IntervalExpr.admissible_and_enclosure_subset`). Admissibility and
  the extension pass to every sub-box: if `Y i ≤ X i` for all `i`, the extension on `Y` is
  admissible and contained in the extension on `X`. Route: induction, from the monotonicity of
  each operation under containment [NPW, §12.3.3, p. 431].
- **Single occurrences** (`IntervalExpr.enclosure_eq_image_of_nodup`). If no variable occurs twice,
  the extension equals the range `e.eval '' box X` [R, Theorem 8.1, p. 321]. Route: independent
  subexpressions realize any pair of their values at a common point of the box.
- **The extension is an interval** (`IntervalExpr.exists_coe_eq_enclosure`). Under admissibility
  the extension is a nonempty compact interval. Route: induction with 1.1 at binary nodes and,
  at a standard function, the image of a compact interval under a continuous map. With 1.1 this
  says that endpoint arithmetic computes the extension, node by node.

*Needs:* 1.1, 2.1; Mathlib's images of compact connected sets under continuous maps.

**Checks.**

- With the square as a standard function, on `X = [1, 4]` the expressions `x² − 4x`, `x(x − 4)`
  and `(x − 2)² − 4` have extensions `[−15, 12]`, `[−12, 0]` and the range `[−4, 0]`
  [R, §8.1, pp. 320–321]. The third has a single occurrence of `x`; the first two show that the
  extension depends on the expression, not only on the function.
- Negative control (admissibility in the interval statement): `1 / (x − x)` on `[0, 1]` has
  divisor enclosure `[−1, 1]`, so it is not admissible, and its extension
  `(−∞, −1] ∪ {0} ∪ [1, ∞)` (the `0` from the junk value `1 / 0 = 0`) is not an interval. The
  inclusion still holds, since the real evaluation is that same junk value `0` everywhere.
- The expression `x − x` has occurrence list `[x, x]`, which is not duplicate-free, and extension
  `[−w, w]` on an interval of width `w`, strictly larger than its range `{0}`.

## Layer 3: order of overestimation

### 3.1 The natural extension

Sources: route; the linear order is illustrated by the bounded ratios of widths for small radii
in [R, Tables 11.1–11.2, pp. 370–371].

- **Definition** (`IntervalExpr.LipschitzOnEnclosures`). Each standard function is Lipschitz on its
  argument enclosure over a reference box `X⁰`.
- **Linear overestimation** (`IntervalExpr.exists_enclosure_width_le`). Let the extension be
  admissible on `X⁰`, with Lipschitz standard functions on their argument enclosures. There is
  `L ≥ 0` such that for every sub-box `X ⊆ X⁰` any two values `s, t` of the extension satisfy
  `|s − t| ≤ L ‖w(X)‖_∞`. Route: induction on the expression with the reference enclosures as
  bounds: `|xy − x'y'| ≤ |x||y − y'| + |y'||x − x'|`, a divisor enclosure over `X⁰` is a compact
  interval avoiding `0` and so bounded away from it, and a standard function contributes its
  Lipschitz constant.
- **Excess width.** Consequently the width of the extension exceeds the width of the range by at
  most `L ‖w(X)‖_∞`, since the range lies in the extension (2.2).

*Needs:* 2.2; Mathlib `LipschitzOnWith`.

**Checks.**

- The order is sharp: for `x − x` on `[−r, r]` the range is `{0}` and the extension is
  `[−2r, 2r]`, of width `4r = 2 w(X)`.
- For `X⁰ = [1, 4]` and `x² − 4x` (square as a standard function, Lipschitz constant `8` on
  `[1, 4]`), every sub-box `X` has extension width at most `12 w(X)` (`8 w(X)` from the square and
  `4 w(X)` from `4x`).

### 3.2 The mean-value form

Sources: [R, (11.10), p. 370] (the centred form in one variable, with Hansen's quadratic
convergence reported there); the constant is a route.

- **Definition** (`meanValueForm`). For derivative enclosures `D i` with
  `∂ᵢf(x) ∈ D i` on the box and `m` the midpoint, the set
  `{f(m) + ∑ aᵢ (xᵢ − mᵢ) : a ∈ box D, x ∈ box X}`. It equals the interval evaluation
  `f(m) + ∑ Dᵢ · (Xᵢ − mᵢ)`, because the products and sums are exact (1.1) and their arguments
  are independent.
- **Enclosure** (`image_subset_meanValueForm`). If `f` is differentiable on an open set containing
  the box, the range of `f` over the box lies in the mean-value form [R, (11.10), p. 370]. Route:
  the mean value theorem on the segment from `m` to `x`, which stays in the box.
- **Quadratic overestimation** (`meanValueForm_excess_le`). If moreover every `D i` has width at
  most `L' ‖w(X)‖_∞`, there are points `x, y` of the box with `s − t ≤ f x − f y + 2nL'‖w(X)‖²_∞`
  for all `s, t` in the mean-value form: the width of the form exceeds that of the range by at
  most `2nL'‖w(X)‖²_∞`. Route: the width of the form is at most `∑ w(Xᵢ) mag(Dᵢ)` and
  `mag(Dᵢ) ≤ |∂ᵢf(m)| + w(Dᵢ)`; for the corners `x, y = m ± s∘r` with `s` the sign vector of
  `∇f(m)` and `r` the radii, the mean value theorem gives
  `f x − f y ≥ ∑ w(Xᵢ)|∂ᵢf(m)| − nL'‖w(X)‖²_∞`, since `∂ᵢf` at two points of the box differ by at
  most `w(Dᵢ)`.

*Needs:* 1.1, 2.1 (boxes); Mathlib's mean value theorem.

**Checks.**

- `f(x) = x²` on `[−r, r]` with `D = 2X`: `L' = 2`, the form is `[−2r², 2r²]`, the range `[0, r²]`,
  and the excess `3r² = (3/4) w(X)²` is below the bound `2 · 1 · 2 · (2r)² = 16r²`.
- `f(x) = x₁x₂` on `[−1, 1]²` with `D₁ = X₂`, `D₂ = X₁`: `L' = 1`, the form is
  `[−1, 1] + [−1, 1] = [−2, 2]` of width `4`, the range `[−1, 1]` of width `2`, and the excess `2`
  is below `2 · 2 · 1 · 2² = 16`.
- With `n = 0` the box is a point, the form is `{f(m)}` and both sides vanish.

## Layer 4: outward rounding

### 4.1 Rounding a single interval

Sources: [R, (4.1)–(4.2), p. 308; (5.14), p. 313]; [M, §12.3.1, p. 465].

- **Definition** (`outward`). The outward rounding of a set `S` is the set of reals `z` with
  RD(s) ≤ z ≤ RU(t) for some `s, t ∈ S`. For an interval `[a, b]` it is `[RD(a), RU(b)]`
  [R, (5.14), p. 313]; when `RU(b) = +∞` it is unbounded, which records overflow without a junk
  value.
- **Exactness of the directed roundings** (`FloatingPointFormat.IsRounding.down_eq_up_iff`). For
  every real `z`, RD(z) = RU(z) if and only if `z` is a floating-point number [R, (4.2), p. 308].
  Route: faithfulness RD(z) ≤ z ≤ RU(z) and exactness on the format (FloatingPointArithmetic
  §2.1); beyond `±Ω` one of the two is infinite and the other finite.
- **The rounded interval is best possible** (`FloatingPointFormat.outward_isLeast`). For an interval
  `I` within `[−Ω, Ω]`, the outward rounding is the interval `[RD(I.fst), RU(I.snd)]` with
  endpoints in the format, and it is the least such interval containing `I` [R, p. 313]. Route:
  RD(a) is the greatest number not above `a`.

*Needs:* FloatingPointArithmetic §§1.1 and 2.1.

**Checks.**

- In the format `(β, p, emin, emax) = (2, 3, −2, 2)` (47 numbers, `Ω = 7`): `[1.1, 6.9]` rounds
  to `[1, 7]`.
- Negative control (the range hypothesis): `[0, 14]` rounds to the unbounded `[0, ∞)`, and no
  interval with endpoints in the format contains `[0, 14]`.

### 4.2 Rounded evaluation

Sources: [R, (5.15) and the inclusion principle, pp. 313–314]; [M, §12.3.1, p. 465].

- **Definition** (`IntervalExpr.roundedEnclosure`). Inputs and constants are rounded outward, each
  operation is the outward rounding of the exact operation on the rounded arguments, and each
  standard function `f` is evaluated by a supplied set function `φ f`.
- **Floating-point inclusion principle**
  (`IntervalExpr.image_subset_enclosure_subset_roundedEnclosure`). If `f '' S ⊆ φ f S` for all
  `f` and `S`, then the range over the box lies in the natural extension, which lies in the
  rounded evaluation [R, p. 314; M, §12.3.1, p. 465]. Route: induction, with `S ⊆ outward S` by
  faithfulness and monotonicity of images under inclusion.

*Needs:* 2.2, 4.1; FloatingPointArithmetic §2.1 (faithfulness).

**Checks.**

- In `(2, 3, −2, 2)`, `[1, 1] / [3, 3]` rounds to `[5/16, 3/8]`, which contains `1/3`; this is
  Rump's example `[fl_down(1/3), fl_up(1/3)]` [R, p. 314] in a small format.
- With `φ f S = f '' S` the hypothesis holds; with `φ f S = ∅` it fails and the rounded
  evaluation of `exp x` is empty.

### 4.3 Width bounds

Sources: [M, §12.4.1, p. 469].

- **A rounded point** (`FloatingPointFormat.IsRounding.up_sub_down_le`). For `z` in the normal
  range or in the format, RD(z) and RU(z) are finite and RU(z) − RD(z) ≤ 2u|z| [M, p. 469].
  Route: RD(z) and RU(z) are equal or adjacent normal numbers, whose gap is at most `β^(1−p)`
  times the smaller (FloatingPointArithmetic §1.2), for `z < 0` by symmetry (§2.1).
- **A rounded sum** (`FloatingPointFormat.outward_add_length_le`). If `X, Y ⊆ [0, ∞)` and both
  endpoint sums lie in the normal range or in the format, the outward rounding of `X + Y` is an
  interval of width at most `w(X + Y) + 4u mid(X + Y)` [M, p. 469]. Route: apply the point bound
  at both endpoints.

*Needs:* 4.1; FloatingPointArithmetic §1.2 (relative spacing of adjacent normal numbers) and
§2.1 (faithfulness, symmetry).

**Checks.**

- In `(2, 3, −2, 2)`, `u = 1/8`: RD(1.1) = 1, RU(1.1) = 5/4, gap `1/4 ≤ 2u · 1.1 = 0.275`; at
  `z = 9/8` the gap `1/4` is `8/9` of `2u|z| = 9/32`.
- Negative control (the normal range): at the subnormal `z = 1/32`, RD(z) = 0 and RU(z) = 1/16,
  a gap of `1/16 > 2u|z| = 1/128`.
- The constant `2` is sharp: in binary32 (`p = 24`, `2u = 2⁻²³`) at `z = 1 + 2⁻²⁴`, RD(z) = 1
  and RU(z) = 1 + 2⁻²³, so the ratio of the gap to `2u|z|` is `1/(1 + 2⁻²⁴)`.
- `[1, 1.1] + [1, 1.1]` rounds to `[2, 5/2]` in `(2, 3, −2, 2)`, of width `1/2 ≤ 0.2 + 4u · 2.1`.

## Layer 5: linear systems

### 5.1 Norm and spectral tests

Sources: [R, Theorem 1.1, pp. 299–300; Theorem 10.2, p. 339].

- **Spectral test** (`det_ne_zero_of_spectralRadius_lt_one`). If `ρ(I − RA) < 1`, then `A` and `R`
  are nonsingular [R, Theorem 1.1, p. 299], which states the conclusion for `A`; that of `R` is the
  same argument, since `RA` is nonsingular. Route: a singular `RA` gives the eigenvalue `1` of
  `I − RA` [R, p. 300].
- **Residual bound in an induced norm** (`isUnit_and_norm_inverse_sub_le`). For `A, R` in
  `E →L[ℝ] E` on a finite-dimensional normed space with `‖I − RA‖ < 1`, `A` and `R` are invertible
  and `‖A⁻¹ b − x̃‖ ≤ ‖R(b − Ax̃)‖/(1 − ‖I − RA‖)` for all `b, x̃` [R, Theorem 10.2, p. 339]. Rump
  writes "some matrix norm"; the bound needs a norm compatible with the vector norm, and the
  operator norm is one. Route: `isUnit_one_sub_of_norm_lt_one` for `RA`, finite dimension for `A`
  and `R`, and `e = (RA)⁻¹R(b − Ax̃)` for `e = A⁻¹b − x̃`, with
  `‖(RA)⁻¹‖ ≤ 1/(1 − ‖I − RA‖)` from `NormedRing.norm_inverse_one_sub_le` (on `E = 0` both sides
  of the bound vanish).
- **The `∞`-norm** (`det_ne_zero_and_norm_inv_mulVec_sub_le`). The same for matrices with the
  largest absolute row sum, the norm in which the bound gives componentwise error bars
  [R, p. 339]. Route: the previous bullet through `Matrix.toLin'`, which is an isometry for the
  `∞` operator norm.

*Needs:* Mathlib `spectralRadius`, `isUnit_one_sub_of_norm_lt_one`, `Matrix.Norms.Operator`,
`Matrix.toLin'`; Tau Ceti `NormedRing.norm_inverse_one_sub_le`.

**Checks.**

- `A = [[4, 1], [2, 3]]`, `R = A⁻¹ + [[0.01, −0.02], [0, 0.01]]`, `b = (1, 2)`,
  `x̃ = (0.12, 0.55)`: in the `1`-, `2`- and `∞`-norms `‖I − RA‖ = 0.08, 0.0593, 0.05` and the
  errors `0.07, 0.0539, 0.05` are below the bounds `0.08, 0.0594, 0.0538`.
- Negative control (finite dimension): on `ℓ²` the right shift `A` and the left shift `R` give
  `RA = I`, so `‖I − RA‖ = 0`, while `A` is not invertible.

### 5.2 Interval products and interior inclusion

Sources: [R, §9, p. 326; Lemma 10.5, p. 342].

- **Definitions** (`intervalMatrix`, `intervalMulVec`, `pointMatrix`). As in the Conventions.
- **Inclusion** (`mulVec_mem_box_intervalMulVec`). If `M ∈ C` and `x ∈ X`, then `Mx ∈ CX`
  [R, p. 326]. Route: 1.1 entry by entry and `coe_add` for the sums.
- **Interior inclusion bounds the spectral radius** (`spectralRadius_lt_one_of_mapsTo_interior`).
  If the affine map `x ↦ z + Cx` sends a box into its interior, then `ρ(C) < 1`. This is
  [R, Lemma 10.5, p. 342] for a point matrix, with the image of the affine map in place of the
  interval product, a weaker hypothesis. Route: the image is compact in the interior, so
  `C D + ε B ⊆ D` for the symmetric convex body `D = X − X`, a ball `B` and some `ε > 0`; the
  gauge norm of `D` gives `‖C‖_D < 1`, which bounds the complex spectral radius. Rump's proof by
  Perron–Frobenius, `|C| rad(X) < rad(X)`, is an alternative.
- **Interval data** (`spectralRadius_lt_one_of_intervalMulVec`). If `Z + CX ⊆ int X` in interval
  arithmetic, then `ρ(C₀) < 1` for every `C₀ ∈ C` [R, Lemma 10.5, p. 342]. Route: the previous
  bullet and the inclusion.

*Needs:* 1.1, 5.1; Mathlib `spectralRadius`, gauge norms of convex bodies (`gauge`).

**Checks.**

- `A = [[2, −1], [1, 2]]`, `X = [2, 3] × [1, 3]`: `AX = [1, 5] × [4, 9]`; negative control,
  `(4, 8) ∈ AX` but `A⁻¹(4, 8) = (3.2, 2.4) ∉ X`, so `b ∈ AX` does not give `A⁻¹b ∈ X`
  [R, (9.7), p. 326, and p. 327].
- Complex spectrum: `C = [[0, −2], [2, 0]]` has eigenvalues `±2i`, real spectral radius `0` and
  complex spectral radius `2`. No affine map `x ↦ z + Cx` sends a box into its interior, since it
  multiplies volumes by `det C = 4`; the conclusion with the real spectral radius would not
  detect this.

### 5.3 Verified solution of linear systems

Sources: [R, Theorem 10.6 and (10.14), p. 343; Theorem 10.8, p. 344]; [NPW, Theorem 12.7, p. 435].

- **Point data** (`det_ne_zero_and_sub_mem_of_mapsTo_interior`). If the affine map
  `y ↦ R(b − Ax̃) + (I − RA)y` sends the box `X` into its interior, then `A` and `R` are
  nonsingular and `A⁻¹b − x̃` is the image of a point of `X` [R, Theorem 10.6 and (10.14),
  p. 343]. Route: 5.2 and 5.1 give nonsingularity; the affine map is a contraction for the gauge
  norm of 5.2, and its fixed point `y` satisfies `A(x̃ + y) = b`.
- **Interval data** (`verified_linearSystem`). Let `A` be an interval matrix, `b` an interval
  vector, `R`, `x̃` real, and let the interval residual `Y = R(b − Ax̃) + (I − RA)X`
  (`linearResidual`) lie in the interior of `X`. Then `R` and every `A₀ ∈ A` are nonsingular, and
  `A₀⁻¹b₀ ∈ x̃ + Y` for every `A₀ ∈ A`, `b₀ ∈ b`: the solution set of the family lies in `x̃ + Y`
  [R, Theorem 10.8, p. 344; NPW, Theorem 12.7, p. 435]. Route: the point theorem for fixed
  `A₀, b₀`, whose affine image lies in `Y` by 5.2.

*Needs:* 5.1, 5.2; Mathlib `ContractingWith.fixedPoint`.

**Checks.**

- `A = [[3, 1], [1, 2]]`, `R = 1.001 A⁻¹`, `b = (1, 1)`, `x̃ = 0`, `X = [−0.5, 1]²`:
  `Rb + (I − RA)X = [0.1992, 0.2007] × [0.3994, 0.4009]` lies in the interior of `X` and contains
  `A⁻¹b = (0.2, 0.4)`; `ρ(I − RA) = 0.001`.
- Rump's example [R, p. 343]: for `n = 1`, `b = 0`, `1 − RA = −0.6` and `X = [−1, 2]`, the
  residual `[−1.2, 0.6]` is not in the interior of `X`, although the solution `0` lies in every
  iterate; the hypothesis is sufficient, not necessary.

## Layer 6: nonlinear systems

### 6.1 The univariate interval Newton test

Sources: [R, Theorem 6.2, p. 316, and p. 317].

- **Interval Newton in one variable** (`intervalNewton_univariate`). Let `f` be continuous on
  `X = [a, b]` with `f'(x) ∈ D` at every interior point, `0 ∉ D` and `x̃ ∈ X`, and let
  `N = x̃ − f(x̃)/D`, the set of `x̃ − f(x̃)/d`, `d ∈ D` (an interval by 1.1). Every zero of `f` in
  `X` lies in `N`; if `N ⊆ X`, `f` has exactly one zero in `X`; if `N ∩ X = ∅`, `f` has no zero in
  `X` [R, Theorem 6.2, p. 316; the enclosure of the zeros is in its proof]. Rump assumes `f`
  differentiable on `ℝ` and `D = f'(X)`; the proof uses the mean value theorem between points of
  `X` only, and a larger `D` gives a larger `N`. Route: secant slopes lie in `D`; existence by the
  intermediate value theorem at the endpoints.

*Needs:* 1.1; Mathlib's mean value and intermediate value theorems.

**Checks.**

- `f(x) = x² − 2`, `X = [1, 2]`, `x̃ = 1.5`, `D = [2, 4]`: `N = [1.375, 1.4375] ⊆ X`, the first
  iterate of [R, p. 317], and `√2 ∈ N`.
- A degenerate `X = [a, a]` has no interior points; `N ⊆ X` forces `f(a) = 0`.
- Negative control (`0 ∉ D`): `x² − 1` on `[−2, 2]` has two zeros, and `f'(X) = [−4, 4] ∋ 0`.

### 6.2 The interval mean value theorem and the interval Newton test

Sources: [R, (13.1), p. 373; Theorem 13.1, p. 374; Theorem 13.2, p. 374].

- **Interval mean value theorem** (`exists_mem_intervalMatrix_eq_add_mulVec`). Let `f` be
  differentiable on an open set containing the box `X`, with every Jacobian on `X` in the interval
  matrix `J`. For `x, x̃ ∈ X` there is `M ∈ J` with `f(x) = f(x̃) + M(x − x̃)`
  [R, (13.1), p. 373; Theorem 13.1, p. 374]. Route: the scalar mean value theorem for each
  component on the segment, which gives row `i` of `M` at a point `ξᵢ` of the box. Rump states
  Theorem 13.1 for continuously differentiable `f`; the row-wise form (13.1) needs only
  differentiability.
- **Definition** (`intervalNewtonSet`). `N(x̃, X) = {x̃ − M⁻¹ f(x̃) : M ∈ J}`.
- **Interval Newton test** (`intervalNewton`). Let `f` be continuously differentiable on an open
  set containing `X`, with Jacobians on `X` in `J`, every matrix of `J` nonsingular and `x̃ ∈ X`.
  Every zero of `f` in `X` lies in `N(x̃, X)`; if `N(x̃, X) ⊆ X`, `f` has exactly one zero in `X`;
  if `N(x̃, X) ∩ X = ∅`, `f` has no zero in `X` [R, Theorem 13.2, p. 374]. Rump's Theorem 13.2
  assumes differentiability, but the proof uses the continuity of the averaged Jacobian
  `x ↦ ∫₀¹ f'(x̃ + t(x − x̃)) dt`, so continuous differentiability is assumed. Route: the
  averaged Jacobian M_x lies in `J` (an average of points of a convex set); Brouwer's theorem
  (`TauCeti.brouwerFixedPoint_compactConvex_continuousOn`) for `x ↦ x̃ − M_x⁻¹ f(x̃)` gives a zero;
  uniqueness and the enclosure of zeros by the interval mean value theorem.
- **Interval computation of `N`.** An interval vector containing every solution of `M y = f(x̃)`,
  `M ∈ J`, computed by 5.3, gives an interval enclosure of `N(x̃, X)`; its inclusion in `X` implies
  the hypothesis. Route: 5.3 and the inclusion of 5.2.

*Needs:* 5.2, 5.3; Tau Ceti's Brouwer theorem; Mathlib's mean value theorem and interval
integral.

**Checks.**

- `n = 1` reduces to 6.1 with `D = J`: then `N(x̃, X) = x̃ − f(x̃)/D`.
- `n = 0`: the box is a point, `f` is the zero map and `N(x̃, X) = {x̃}`.
- Negative control (nonsingular `J`): `f = 0` on `X = [0, 1]²` with `J = {0}` gives
  `N(x̃, X) = {x̃} ⊆ X` through the junk value `0⁻¹ = 0`, while every point of `X` is a zero.

### 6.3 Krawczyk's test

Sources: [R, Theorem 13.3, p. 375]; [NPW, (12.14), p. 433, and Theorem 12.6, p. 434].

- **Krawczyk's test** (`krawczyk`). Let `0 ∈ X`, let `f` be differentiable on an open set
  containing `x̃ + X`, with every Jacobian on `x̃ + X` in `J`, and suppose that
  `−R f(x̃) + (I − RM) y ∈ int X` for every `M ∈ J` and `y ∈ X`. Then `R` and every matrix of `J`
  are nonsingular, `f` has exactly one zero `x̂` in `x̃ + X`, and `x̂ − x̃` is one of the values
  `−R f(x̃) + (I − RM) y`, `M ∈ J`, `y ∈ X` [R, Theorem 13.3, p. 375; NPW, Theorem 12.6, p. 434].
  Both sources state the hypothesis for the interval operator `K(X) = −R f(x̃) + (I − RJ)X`,
  which contains every such value (5.2), and assume continuous differentiability; Rump's proof
  uses only the interval mean value theorem and Brouwer's theorem. Route: 5.2 for each `M` gives
  `ρ(I − RM) < 1` and so nonsingularity (5.1); Brouwer for `y ↦ y − R f(x̃ + y)`, which maps `X`
  into the values above by 6.2; injectivity of `f` on `x̃ + X` from 6.2 and nonsingularity.
- **Interval form.** If the interval operator `K(X)` of the sources, computed by 5.2's interval
  products, lies in the interior of `X`, the conclusions hold, with `x̂ ∈ x̃ + K(X)`
  [NPW, Theorem 12.6, p. 434].

*Needs:* 5.1, 5.2, 6.2 (interval mean value theorem); Tau Ceti's Brouwer theorem.

**Checks.**

- `f(x) = x² − 2`, `x̃ = 1.4142`, `R = 1/(2x̃)`, `X = [−10⁻³, 10⁻³]`, `J = 2(x̃ + X)`:
  `K(X) = [1.2855 · 10⁻⁵, 1.4270 · 10⁻⁵] ⊆ int X`, and `√2 − x̃ = 1.3562 · 10⁻⁵` lies in it.
- Negative control (interior, not inclusion): for `f = 0` on `ℝ`, `x̃ = 0`, `J = {0}`, `R = 1`
  and `X = [−1, 1]`, the values `−R f(x̃) + (1 − RM) y` form `X` itself, which lies in `X` but not
  in its interior; every point of `X` is a zero and the matrix `0 ∈ J` is singular.
- A degenerate side `[0, 0]` makes the interior of the box empty, so the hypothesis fails for
  every `R`.

## Layer 7: verification in Banach spaces

### 7.1 Plum's existence and enclosure theorem

Sources: [NPW, §6.1, pp. 181–188: (6.7)–(6.11), pp. 181–182; Theorem 6.2, p. 184; Remark 6.3,
pp. 184–185; proof, pp. 185–187; Theorem 6.4, p. 188].

Throughout, `F` maps a Banach space `X` to a normed space `Y`, `ω ∈ X` is an approximate zero,
`L = F'(ω)`, `α > 0` is the radius, and `δ`, `K > 0`, `g` satisfy `‖F(ω)‖ ≤ δ`, `‖v‖ ≤ K‖Lv‖` and
`‖F'(ω + v) − F'(ω)‖ ≤ g(‖v‖)` for all `v`, with `g` nondecreasing on `[0, ∞)` and
`G(t) = ∫₀ᵗ g`. NPW also assume `g(t) → 0` as `t → 0` and real Hilbert spaces; neither is used by
the proofs, and the targets omit both. Every integral `G(α)` is of a monotone function on
`[0, α]` and so a genuine interval integral.

- **Definition** (`IsCompactMap`). A map is compact if it is continuous and sends bounded sets to
  relatively compact sets [NPW, Definition 12.3, p. 425]. Mathlib's `IsCompactOperator` is the
  linear notion; for a nonlinear map it only asks for one relatively compact neighbourhood image.
- **Compact derivatives** (`IsCompactMap.isCompactOperator_fderiv`). The derivative at a point of a
  compact map into a Banach space is a compact operator [NPW, p. 182]. Route: `N'(ω)` maps the
  unit ball to within `ε` of `(N(ω + rB) − N(ω))/r`, which is totally bounded.
- **Bounded below with dense range** (`bijective_of_denseRange_of_norm_le`). On a Banach space an
  operator with `‖v‖ ≤ K‖Lv‖` and dense range is bijective [NPW, p. 182]. Route: the range is
  complete, hence closed.
- **Dense-range case** (`exists_zero_of_plum_denseRange`). If `F` is differentiable, `L` has dense
  range, `δ ≤ α/K − G(α)` and `K g(α) < 1`, then `F` has a zero `u` with `‖u − ω‖ ≤ α` and `F'(u)`
  is bijective [NPW, Theorem 6.2, case (2), p. 184]. Route: the simplified Newton map
  `T v = v − L⁻¹F(ω + v)` maps the ball of radius `α` into itself and is a contraction with
  constant `K g(α)` (`ContractingWith.fixedPoint`); `F'(u) = L(I + L⁻¹(F'(u) − L))` is bijective
  by the Neumann series (`isUnit_one_sub_of_norm_lt_one` in the Banach algebra `X →L[ℝ] X`)
  [NPW, pp. 185–187].
- **Compact case** (`exists_zero_of_plum_compact`). If `F = L₀ + N` with `L₀` bounded and
  bijective, `X` and `Y` Banach and `N` a differentiable compact map, and `δ ≤ α/K − G(α)`, then
  `F` has a zero `u` with `‖u − ω‖ ≤ α`, and `F'(u)` is bijective when `K g(α) < 1`
  [NPW, Theorem 6.2, case (1), p. 184]. Route: `L = L₀(I + L₀⁻¹N'(ω))` is injective by the inverse
  bound and a compact perturbation of `L₀`, so bijective by Fredholm index zero
  (`ContinuousLinearMap.index_one_add_eq_zero`); Tau Ceti's Schauder fixed-point theorem for
  closed convex sets with relatively compact image, applied to `T` on the ball.
- **Local uniqueness** (`plum_zero_subsingleton`). If `F` is differentiable, `δ ≤ α/K − G(α)`,
  `K g(α) < 1` and `δ < α'/K − G(α')` for some `α' > α`, then `F` has at most one zero with
  `‖u − ω‖ ≤ α'` [NPW, Theorem 6.2, p. 184]. Surjectivity of `L` is not needed [NPW,
  Remark 6.3(d), p. 185]. Route: a zero `ω + v` gives `‖v‖/K − G(‖v‖) ≤ δ`; the function
  `t ↦ t/K − G(t)` is concave, at least `δ` at `α` and above `δ` at `α'`, hence above `δ` on
  `(α, α']`, so `‖v‖ ≤ α`; two zeros in that ball differ by at most `K g(α)` times their
  distance.
- **Remainder form** (`exists_zero_of_plum_remainder`). In the compact case with `N` only
  continuous and differentiable at `ω`, if `‖N(ω + v) − N(ω) − N'(ω)v‖ ≤ G(‖v‖)` for a
  nondecreasing `G` and `δ ≤ α/K − G(α)`, then `F` has a zero with `‖u − ω‖ ≤ α`
  [NPW, Theorem 6.4, p. 188]. NPW also assume `G(t) = o(t)`, which makes the condition
  satisfiable for small `δ` but is not used in the proof. Route: as in the compact case, with the
  remainder bound in place of the integral of `g`.

*Needs:* Mathlib `ContractingWith.fixedPoint`, `isUnit_one_sub_of_norm_lt_one`,
`IsCompactOperator`, `DenseRange`, the mean value inequality and the interval integral; Tau Ceti
`ContinuousLinearMap.index_one_add_eq_zero` and Schauder's fixed-point theorem.

**Checks.**

- `F(u) = u² − 2` on `ℝ`, `ω = 1.4`: `L = 2.8`, `K = 1/2.8`, `δ = 0.04`, `g(t) = 2t`,
  `G(α) = α²`. The condition `δ ≤ 2.8α − α²` holds for `α ∈ [0.014359, 2.785641]`, and
  `√2 − 1.4 = 0.014214` is within the smallest radius; `K g(0.014359) = 0.0103 < 1`. Local
  uniqueness holds for every `α' < 2.785641`, and the other zero `−√2` is at distance `2.8142`,
  outside every such ball.
- With `g(t) = L't` the condition `δ ≤ α/K − L'α²/2` is the Kantorovich condition `2bL ≤ 1` for
  `b = Kδ` and Lipschitz constant `KL'`, and its least `α` is the Kantorovich radius of
  [NewtonAndQuasiNewtonMethods](../NewtonAndQuasiNewtonMethods/README.md) §2.1.
- Negative control (the strict inequality at `α'`): at `α' = 2.83` the inequality
  `δ < 2.8α' − α'²` fails, and the ball of radius `α'` contains both zeros `±√2`.

### 7.2 Constructive projection error constants

Sources: [NPW, (1.11), p. 5; (1.15), p. 6; Lemma 1.1, p. 7; Theorem 1.5, pp. 15–16].

- **Constructive Aubin–Nitsche bounds.** Let `X`, `Y` be real inner product spaces, `J : X → Y`
  continuous linear, `D ⊆ X` a subspace and `A : D → Y` linear and onto with
  `⟪u, v⟫_X = ⟪Au, Jv⟫_Y` for `u ∈ D`, `v ∈ X`. Let `P` be the `X`-orthogonal projection onto a
  finite-dimensional subspace (`Submodule.starProjection`) with `‖v − Pv‖_X ≤ C‖Av‖_Y` for
  `v ∈ D` and `C ≥ 0`. Then `‖J(v − Pv)‖_Y ≤ C‖v − Pv‖_X` for `v ∈ X` and
  `‖J(v − Pv)‖_Y ≤ C²‖Av‖_Y` for `v ∈ D` [NPW, Lemma 1.1, p. 7]. NPW take `A` bijective and `J` an
  embedding; injectivity of `A` follows from the identity, and neither injectivity of `J` nor
  completeness is used. Route: the abstract Aubin–Nitsche lemma of
  GalerkinMethodsAndLagrangeFiniteElements §1.4 for the form `⟪·, ·⟫_X` (of norm at most `1`),
  the Galerkin-orthogonal error `e = v − Pv` and `δ = C`: for `g ∈ Y` the dual problem
  `⟪u, z⟫_X = ⟪Ju, g⟫_Y` is solved by the `z ∈ D` with `Az = g`, and `‖z − Pz‖_X ≤ C‖g‖_Y`. The
  second bound is the first together with the hypothesis on `P`.
- **Wirtinger's inequality** (`integral_sq_le_of_eq_zero`). A function of class `C¹` on `[a, b]`
  vanishing at both ends satisfies `∫ e² ≤ ((b − a)/π)² ∫ e'²` [NPW, proof of Theorem 1.5, p. 16].
  Route: the odd extension of `e` to `[2a − b, b]` takes equal values at the ends and has mean
  zero, so Tau Ceti's sharp periodic Wirtinger inequality `TauCeti.integral_norm_sub_average_sq_le`
  on an interval of length `2(b − a)` gives the constant `(2(b − a)/(2π))² = ((b − a)/π)²`, and
  both integrals double.
- **The constant `h/π`** (`sum_integral_sq_deriv_sub_slope_le`). For `u` of class `C²` on `[a, b]`,
  the uniform partition with nodes `uniformNode a b N k` and `h = (b − a)/N`, and the piecewise
  linear interpolant `I_h u` at the nodes, `‖(u − I_h u)'‖_{L²} ≤ (h/π)‖u''‖_{L²}`, written as a sum
  of integrals over the cells [NPW, Theorem 1.5, p. 15]. Route: on each cell `e = u − I_h u`
  vanishes at the ends, `∫ e'² = −∫ e u''` by parts, and Wirtinger's inequality bounds `‖e‖`.
- **Interpolation is the `H¹₀`-projection.** For `u ∈ H¹₀(a, b)` the `H¹₀`-orthogonal projection
  onto the continuous piecewise linear functions vanishing at `a` and `b` is the interpolant at
  the nodes [NPW, p. 15], so `C(h) = h/π` in the first bullet for `X = H¹₀(a, b)` with the inner
  product `⟪u', v'⟫_{L²}`, `Y = L²(a, b)` and `A = −d²/dx²` on `H²(a, b) ∩ H¹₀(a, b)`.

*Needs:* GalerkinMethodsAndLagrangeFiniteElements §1.4; Tau Ceti
`TauCeti.integral_norm_sub_average_sq_le`; Mathlib `Submodule.starProjection`, integration by parts
on an interval.

**Checks.**

- `e = sin(π(x − a)/(b − a))` gives equality in Wirtinger's inequality; `e = x(1 − x)` on `[0, 1]`
  gives `1/30 = 0.03333 ≤ 1/(3π²) = 0.03377`.
- Negative control (the end conditions): `e = x` on `[0, 1]` has `∫ e² = 1/3 > 1/π² = 0.1013`.
- `u = sin(πx)` on `[0, 1]` with `N = 1`: both sides equal `π²/2 = 4.9348`, so the constant `h/π`
  is attained; with `N = 2, 4` the two sides are `0.9348 ≤ 1.2337` and `0.2485 ≤ 0.3084`.
- `u = x³` on `[0, 1]`, which does not vanish at `1`: `0.8 ≤ 1.2159` for `N = 1` and
  `0.1086 ≤ 0.1351` for `N = 3`; the cellwise bound needs no boundary condition.
- Aubin–Nitsche for `sin(πx)` and `N = 2`: `‖u − P_h u‖_{L²} = 0.1509 ≤ (h/π)²‖u''‖_{L²} = 0.1768`.

## Downstream consumers

- Verified zero search and verified continuation: the interval Newton and Krawczyk tests of
  Layer 6 as certified counterparts of Newton steps, and branch-and-bound searches that discard
  boxes by the exclusion test of 6.1 and 6.2.
- Verified linear algebra in floating point: rigorous error bars for computed solutions from the
  residual bounds of 5.1 and the interval systems of 5.3, with outward rounding (Layer 4).
- Computer-assisted existence proofs for elliptic boundary value problems and integral
  equations: Plum's theorem (7.1) with the constructive constants of 7.2.

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Owned here:
- the endpoint rules for interval products and quotients; boxes, interval matrices and interval
  matrix–vector products;
- arithmetic expressions with standard functions, their natural interval extension, the
  fundamental theorem with isotonicity and single-occurrence exactness, and the order of
  overestimation of the natural extension and the mean-value form;
- outward rounding of sets and intervals, rounded evaluation and its width bounds;
- the spectral, norm and interior-inclusion tests for linear systems, with point and interval
  data;
- the univariate and multivariate interval Newton tests, the interval mean value theorem and
  Krawczyk's test;
- compact nonlinear maps, Plum's theorem in its dense-range, compact, uniqueness and remainder
  forms, the constructive Aubin–Nitsche bounds for an orthogonal projection, Wirtinger's
  inequality for functions vanishing at both ends, and the constant `h/π` for piecewise linear
  interpolation.

Not owned (consumed or out of scope):
- floating-point formats, rounding functions, the unit roundoff and the standard model: the
  FloatingPointArithmetic roadmap, §§1.1–3.2, whose definitions are copied verbatim;
- Brouwer's and Schauder's fixed-point theorems, the Neumann-series bound and Fredholm theory:
  Tau Ceti; Banach's fixed-point theorem and the algebra of intervals: Mathlib;
- the sharp periodic Wirtinger inequality: Tau Ceti, within
  [Isoperimetry](../Isoperimetry/README.md) Layer 3; 7.2 consumes it for the form with zero end
  values;
- rational intervals `NonemptyInterval ℚ` with corner products, partial reciprocals and outward
  dyadic rounding: [ComputationalNumberTheory](../ComputationalNumberTheory/README.md) §§4.1–4.6,
  and rational enclosures of real, complex and `p`-adic numbers:
  [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md) §0.1; here endpoints are
  real and rounding is to a floating-point format;
- joint boxes and signed row images for bound tightening of linear constraints:
  [FiniteAffineBoundTightening](../FiniteAffineBoundTightening/README.md) Layer 1;
- the Newton–Kantorovich theorem and local convergence of Newton's method:
  [NewtonAndQuasiNewtonMethods](../NewtonAndQuasiNewtonMethods/README.md) §§1–2; bisection,
  the a priori Kantorovich bound and Newton-type methods in exact arithmetic: the
  NewtonTypeMethodsAndAlgorithmicDifferentiation roadmap, §§1.1 and 2.3;
- perturbation theory and condition numbers of linear systems in exact arithmetic: the
  ConditioningAndPerturbation roadmap, §§1.1–1.2;
- the abstract Aubin–Nitsche lemma and its finite element form: the
  GalerkinMethodsAndLagrangeFiniteElements roadmap, §§1.4 and 6.3; 7.2 consumes §1.4 for an
  orthogonal projection with an explicit constant and states the one-dimensional instance
  without finite element spaces.

Boundary in one sentence: everything about computing with intervals and proving existence from
an approximate solution is here; floating-point rounding of scalars, the convergence theory of
iterative methods and finite element spaces are not.

## Exact supplier contracts

### From Mathlib

- **Intervals:** `NonemptyInterval ℝ` with its order, addition, subtraction,
  `NonemptyInterval.pure` and `NonemptyInterval.length`; `Set.Icc_add_Icc`, `Set.Icc_sub_Icc`,
  `NonemptyInterval.length_add`, `NonemptyInterval.length_sub`; `Set.image2`.
- **Linear algebra and spectra:** `Matrix.det`, `Matrix.mulVec`, `spectralRadius`,
  `Matrix.Norms.Operator`, `isUnit_one_sub_of_norm_lt_one`, `Ring.inverse`.
- **Analysis:** `fderiv`, `HasDerivAt`, `HasFDerivAt`, `DifferentiableOn`, `ContDiffOn`,
  `LipschitzOnWith`, `ContractingWith.fixedPoint`, `IsCompactOperator`, `DenseRange`,
  `Bornology.IsBounded`, `MonotoneOn`, `Metric.closedBall`, `gauge`, the interval integral, and
  `Submodule.starProjection`.
- **Order:** `EReal`, `IsLeast`.

### From Tau Ceti

- **Brouwer's fixed-point theorem** for continuous self-maps of nonempty compact convex sets in
  finite dimensions: `TauCeti.brouwerFixedPoint_compactConvex_continuousOn` (6.2, 6.3).
- **Neumann series:** `NormedRing.norm_inverse_one_sub_le` (5.1).
- **Fredholm index of compact perturbations:** `ContinuousLinearMap.index_one_add_eq_zero` (7.1).
- **Schauder's fixed-point theorem** for continuous self-maps of nonempty closed convex sets
  whose image has compact closure, Tau Ceti's schauderFixedPoint_closedConvex_continuousOn
  (7.1, compact and remainder forms).
- **The sharp periodic Wirtinger inequality** for absolutely continuous functions with equal end
  values: `TauCeti.integral_norm_sub_average_sq_le` (7.2).

### From the GalerkinMethodsAndLagrangeFiniteElements roadmap

- §1.4: the abstract Aubin–Nitsche lemma, `‖J e‖ ≤ ‖A‖ δ ‖e‖` for a Galerkin-orthogonal `e` when
  every dual problem has a solution within `δ ‖g‖` of the subspace (7.2).

### From the FloatingPointArithmetic roadmap

- §1.1: the format, its numbers, `Ω` and the normal range (definitions copied verbatim).
- §1.2: the relative spacing of adjacent normal numbers (4.3).
- §2.1: the directed roundings, their faithfulness, monotonicity, exactness on the format and
  the symmetry RD(−x) = −RU(x), and the unit roundoff (definitions copied verbatim; 4.1–4.3).

## Beyond this roadmap

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Extended interval arithmetic and the IEEE 1788 standard:** empty and unbounded intervals,
  division by intervals containing zero, decorations [M, §12.2].
- **Midpoint–radius arithmetic** [M, §12.4.2], **affine arithmetic and Taylor models**.
- **Linear overestimation from rounding:** the extra width of rounded evaluation of a Lipschitz
  expression is linear in `u` (Neumaier, Theorem 2.1.5, cited in [M, p. 469]).
- **Slopes and automatic differentiation in interval arithmetic** [R, §11], and verified
  quadrature.
- **Further constructive constants:** `h/(2π)` for piecewise quadratics in one dimension
  [NPW, p. 17], `h/π` for bilinear elements on the unit square, which needs
  `|u|_{H²} = ‖Δu‖_{L²}` on convex polygons, and the triangle constant `0.493 h` [NPW, p. 6].
- **Eigenvalue enclosures and inverse norm bounds for elliptic operators** and verified solution
  of ordinary differential equations.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, module `NASC/VerifiedComputation.lean`, states a form of most targets of
Layers 1–7 and proves the following without `sorry`:
- 2.2: the inclusion, isotonicity and single-occurrence statements for its set-valued extension,
  as one theorem (NASC.IntervalExpr.range_subset_enclosure, from
  NASC.IntervalExpr.eval_mem_enclosure, NASC.IntervalExpr.admissible_enclosure_mono and
  NASC.IntervalExpr.enclosure_eq_image_eval_of_nodup), without the definedness conjunct;
- 5.1: the residual bound for operators between normed spaces, given an exact solution
  (NASC.norm_sub_le_of_norm_one_sub_comp_lt_one), and its matrix form for the Euclidean induced
  norm with the nonsingularity of `A` and `R` (NASC.norm_error_le_of_approximateInverse);
- 6.1: the first two conclusions of the univariate interval Newton test, under the stronger
  hypothesis of one-sided derivatives in `D` at every point of `X`
  (NASC.zeros_subset_intervalNewton_and_existsUnique).

Its statements of the endpoint rules, outward rounding, overestimation, the multivariate interval
Newton and Krawczyk tests, the spectral bound of 5.2 and Plum's theorem are not credited. Its
module is a cited source, not the specification.

Related formalizations:
- G. Irving's Lean 4 library [interval](https://github.com/girving/interval) (Apache-2.0)
  implements conservative interval arithmetic on a software floating-point type, with the
  operations proved conservative.
- Interval arithmetic with floating-point endpoints and its inclusion property are formalized in
  Coq (the CoqInterval library of Melquiond) and in Isabelle/HOL (the Approximation library of
  Hölzl), both used as decision procedures for real inequalities.

## References

The locators refer to these editions; page numbers are printed page numbers.

- [R] S. M. Rump, Verification methods: rigorous results using floating-point arithmetic,
  *Acta Numerica* 19 (2010), 287–449.
- [M] J.-M. Muller, N. Brunie, F. de Dinechin, C.-P. Jeannerod, M. Joldes, V. Lefèvre,
  G. Melquiond, N. Revol and S. Torres, *Handbook of Floating-Point Arithmetic*, 2nd ed.,
  Birkhäuser, 2018, Chapter 12.
- [NPW] M. T. Nakao, M. Plum and Y. Watanabe, *Numerical Verification Methods and Computer-Assisted
  Proofs for Partial Differential Equations*, Springer Series in Computational Mathematics 53,
  Springer, 2019.
- R. E. Moore, R. B. Kearfott and M. J. Cloud, *Introduction to Interval Analysis*, SIAM, 2009
  (background for Layers 1–3).
- A. Neumaier, *Interval Methods for Systems of Equations*, Cambridge University Press, 1990
  (background for Layer 3 and the interval Newton and Krawczyk tests, cited through [R] and [M]).
