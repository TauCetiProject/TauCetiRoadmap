# Roadmap: decision tree complexity

**Summary.** A Boolean function `f` on `n` variables can be measured in several ways: by the
depth `D(f)` of the shallowest decision tree that computes it, by the number `C(f)` of variables
one must reveal to certify its value at the worst input, by its sensitivity `s(f)` (the largest
number of single variables whose flip changes the value at one input), by its block
sensitivity `bs(f)` (the same with disjoint blocks of variables), and by its degree `deg(f)`, the
least degree of a real polynomial that agrees with `f` on `{0, 1}ⁿ`. This roadmap defines these
measures and proves that they are polynomially related. Every statement holds for every `n`,
including `n = 0`, and for constant functions, where all five measures are `0`. No algorithm,
running time or complexity class is a target.

The headline theorems are these.

- *The chain and Nisan's bound.* For every Boolean function, `s(f) ≤ bs(f) ≤ C(f) ≤ D(f)` and
  `deg(f) ≤ D(f)`. Nisan's theorem bounds certificates by sensitivity: `C(f) ≤ s(f) · bs(f)`.
- *Depth from block sensitivity.* For each value `b`, `D(f)` is at most `bs(f)` times the largest
  certificate complexity at an input where `f` takes the value `b`. Consequently
  `D(f) ≤ s(f) · bs(f)² ≤ bs(f)³`, and `D(f)` is at most the product of the certificate
  complexities on the two values.
- *The polynomial method.* Nisan and Szegedy's inequality `bs(f) ≤ 2 deg(f)²`, from the
  symmetrization of Minsky and Papert and a lemma of Ehlich–Zeller and Rivlin–Cheney on
  polynomials bounded at integer points; and the bound `D(f) ≤ deg(f)² · bs(f)` of Nisan and
  Smolensky.
- *The sensitivity theorem.* Huang's theorem: every set of more than half of the vertices of the
  cube `{0, 1}ⁿ` contains a vertex with at least `√n` neighbours in the set. Consequently
  `deg(f) ≤ s(f)²`, that is `s(f) ≥ √deg(f)`, and `bs(f) ≤ 2 s(f)⁴`.

The roadmap builds on Mathlib's multivariate polynomials, whose combinatorial Nullstellensatz
gives the uniqueness of the multilinear polynomial representing a Boolean function, and on
Mathlib's calculus of real polynomials. The lemma on polynomials bounded at integer points is
derived from Markov's inequality for the derivative of a polynomial bounded on an interval,
which the roadmap PolynomialInterpolationAndBestApproximation states. BooleanFunctionAnalysis
expands real functions on the cube in Walsh characters; the degree used here is defined
directly through polynomials.

Layer 1 below defines decision trees, certificates, sensitivity and block sensitivity and proves
the chain `s ≤ bs ≤ C ≤ D`. Layer 2 defines the degree and proves that the multilinear
representing polynomial is unique and that `deg ≤ D`; it uses Layer 1. Layer 3 proves Nisan's bound and the
bounds of the depth by certificates and block sensitivity; it uses Layer 1. Layer 4 proves the
symmetrization lemma, the integer-point lemma, the Nisan–Szegedy inequality and the
Nisan–Smolensky bound; it uses Layers 1 and 2. Layer 5 proves Huang's theorem and the
sensitivity theorem; it uses Layers 1, 2 and 4.

## Conventions

- **Inputs and functions.** An input is `x : Fin n → Bool`; a Boolean function is
  `f : (Fin n → Bool) → Bool`. For a set `B : Finset (Fin n)` of variables, `flipBlock x B` is
  `x` with the variables of `B` negated; `x^i` stands for `flipBlock x {i}`.
- **Real points.** A real polynomial is evaluated at an input through `boolVec x`, the point of
  `ℝⁿ` with coordinate `1` where `x` is true and `0` where it is false; "`p` represents `f`"
  means that this value is `1` where `f` is true and `0` where `f` is false.
- **Least and largest values.** A least value (`D(f)`, the certificate complexity at an input,
  `deg(f)`) is an `sInf` of a set of natural numbers; each such set is shown to be nonempty in
  the section that defines it, so the junk value `sInf ∅ = 0` never occurs. A largest value over
  inputs (`C(f)`, `s(f)`, `bs(f)`) or over families of blocks is a `Finset.sup`, which is `0`
  over an empty range.
- **Values `b`.** `C^(b)(f)` is the largest certificate complexity at an input where `f` takes
  the value `b`, and `0` when there is no such input. `C^(0)` and `C^(1)` refer to
  `b = false` and `b = true`.
- **Restrictions.** In the routes, fixing a set `S` of variables to a partial assignment gives a
  Boolean function on the same `n` variables that ignores those of `S`; its measures are those
  of the definitions below.

## Layer 1: decision trees, certificates and sensitivity

### 1.1 Decision trees

Define the inductive type `DecisionTree n`: a leaf `DecisionTree.leaf b` with an output
`b : Bool`, or a node `DecisionTree.node i t₀ t₁` that queries the variable `i` and continues
with `t₀` when `x i = false` and with `t₁` when `x i = true`. Define its output
`DecisionTree.eval` and its depth `DecisionTree.depth`, the largest number of nodes on a path
from the root to a leaf. Define `decisionTreeDepth f`, written `D(f)`, as the least depth of a
tree whose output is `f` on every input (Buhrman–de Wolf, §3.1, p. 5).

- Every Boolean function is computed by a tree of depth at most `n`: query the variables in
  order and put the values of `f` at the leaves. So the set in the definition is nonempty and
  `D(f) ≤ n`.
- A tree of depth `0` is a leaf, so `D(f) = 0` exactly when `f` is constant.
- A variable may be queried twice on a path; this never lowers the least depth.

**Checks.**
- `D(OR₂) = 2` and `D(MAJ₃) = 3`, where `MAJ₃` is true when at least two of three variables are
  true. For `n = 0` every function is constant and `D = 0`.
- The least depth is not the least number of nodes: the parity of two variables has `D = 2`,
  while every tree computing it queries both variables on both branches and so has at least
  three nodes.

### 1.2 Certificates

Define `IsCertificate f x S` for a set `S` of variables: every input that agrees with `x` on `S`
has the value `f x`. Define `certComplexityAt f x`, the least size of a certificate at `x`,
`certComplexity f`, written `C(f)`, its largest value over all inputs, and
`certComplexityOn f b`, written `C^(b)(f)`, its largest value over the inputs where `f` takes the
value `b` (Buhrman–de Wolf, Definition 1, p. 8).

- The set of all variables is a certificate at every input, so the least size exists and is at
  most `n`.
- `C(f)` is the larger of `C^(0)(f)` and `C^(1)(f)`, since every input has one of the two values.

**Checks.**
- `OR₃`: `C^(1) = 1` (one true variable certifies the value true) and `C^(0) = C = 3`.
- For a constant function the empty set is a certificate everywhere and `C = 0`; for
  `f = false`, `C^(1)(f) = 0` because no input takes the value true.
- A plausible wrong definition asks that the inputs agreeing with `x` *outside* `S` have the
  value `f x`. Then `S = ∅` always qualifies, since only `x` itself agrees with `x` everywhere, and
  every function would get `0`; with the correct definition `C(OR₂) = 2`.

### 1.3 Sensitivity and block sensitivity

Define `flipBlock`. Define `sensitivityAt f x`, the number of variables `i` with
`f (x^i) ≠ f x`, and `sensitivity f`, written `s(f)`, its largest value. Define
`blockSensitivityAt f x`, the largest number of pairwise disjoint sets `B` of variables with
`f (flipBlock x B) ≠ f x`, and `blockSensitivity f`, written `bs(f)`, its largest value
(Buhrman–de Wolf, Definition 2, p. 9; Huang, p. 2).

- The empty block is never sensitive, so the blocks counted are nonempty and at most `n` of
  them are disjoint.
- For a constant function `s(f) = bs(f) = 0`.

**Checks.**
- `OR₃`, `AND₃` and the parity of three variables have `s = bs = 3`; `MAJ₃` has `s = bs = 2`.
- On four variables, the function whose multilinear polynomial is
  `x₀x₁ + x₂ − x₀x₂ + x₃ − x₁x₃ − x₂x₃` has `s = 2` and `bs = 3`: at the input `0000` the blocks
  `{2}`, `{3}` and `{0, 1}` are disjoint and sensitive. Among all `2^16` functions on four
  variables, exactly `24` have `s < bs`.
- Disjointness matters: dropping it, `OR₂` at `00` has the three sensitive blocks `{0}`, `{1}`
  and `{0, 1}`, which would exceed `C(OR₂) = 2` and contradict 1.4.

### 1.4 The chain

Prove `sensitivity_le_blockSensitivity`, `blockSensitivity_le_certComplexity` and
`certComplexity_le_decisionTreeDepth`: `s(f) ≤ bs(f) ≤ C(f) ≤ D(f)` (Buhrman–de Wolf,
Proposition 1, p. 9, for the first two; Theorem 9, p. 14, proves the weaker `bs ≤ D`, and
`C ≤ D` is proved here by the route below).

Route: the sensitive single variables at `x` form disjoint sensitive blocks. A certificate `S` at
`x` meets every sensitive block `B`, since otherwise `flipBlock x B` agrees with `x` on `S` and
has the other value; disjoint blocks meet `S` in distinct variables. For a tree of depth `d`
computing `f`, the variables queried on the path of `x` form a certificate at `x` with at most
`d` elements, because every input agreeing with `x` on them follows the same path.

**Checks.**
- All three inequalities and their strictness were checked on all `65536` functions on four
  variables: `s < bs` occurs `24` times, `C < D` occurs `21040` times, and `bs < C` never
  occurs for `n ≤ 4`.
- `MAJ₃`: `C = 2 < 3 = D`.

*Needs:* 1.1, 1.2, 1.3; Mathlib `Nat.sInf_mem`, `Nat.sInf_le`, `Finset.sup_le`,
`Finset.card_le_card`. (Proved here.)

### Examples

`OR`, `AND`, parity and majority on up to four variables; the function of 1.3 with `s < bs`.

### Dependencies

Mathlib `Nat.sInf_mem`, `Nat.sInf_le`, `Finset.sup_le`, `Finset.card_le_card`. No other layer.

## Layer 2: the degree

### 2.1 Representing polynomials and the degree

Define `boolVec`, `Represents p f` for `p : MvPolynomial (Fin n) ℝ`, and `degree f`, written
`deg(f)`, as the least total degree of a real polynomial representing `f` (Buhrman–de Wolf,
Definitions 3 and 4, p. 10).

- `existsUnique_represents`: exactly one polynomial with degree at most `1` in each variable,
  that is in Mathlib's `MvPolynomial.restrictDegree (Fin n) ℝ 1`, represents `f`
  (Buhrman–de Wolf, Lemma 1, p. 4, for the uniqueness; the existence is remarked on p. 10).
- `totalDegree_eq_degree`: the total degree of that multilinear polynomial is `deg(f)`. In
  particular the set in the definition of `deg(f)` is nonempty, `deg(f) ≤ n`, and `deg(f) = 0`
  exactly when `f` is constant.

Route: existence from the sum over the true inputs `x` of `∏_{x i} X_i · ∏_{¬x i} (1 − X_i)`.
Uniqueness: the difference of two multilinear representing polynomials vanishes on `{0, 1}ⁿ` and
has degree at most `1 < 2` in each variable, so it is `0` by Mathlib's
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`. For the degree, `deg(f)` is at most the total
degree of the multilinear representative by definition; conversely, lowering every positive
exponent of a representing polynomial `q` to `1` gives a multilinear polynomial of total degree
at most that of `q` with the same values on `{0, 1}ⁿ`, which by uniqueness is the
representative.

**Checks.**
- `AND_n` is represented by `X₀ ⋯ X_(n−1)`, of degree `n`, and `OR₂` by `X₀ + X₁ − X₀X₁`, of
  degree `2`.
- `X₀²` represents the function `x ↦ x 0`, but its total degree `2` is not the degree `1` of that
  function: the least degree is attained by the multilinear representative `X₀`.
- The real degree is not the degree over `𝔽₂`: the parity of two variables is
  `X₀ + X₁ − 2X₀X₁`, of real degree `2`, while over `𝔽₂` it is `X₀ + X₁`, of degree `1`.
- The function true exactly when one or two of three variables are true is
  `X₀ + X₁ + X₂ − X₀X₁ − X₀X₂ − X₁X₂`, of degree `2`, with `s = bs = C = D = 3` (Buhrman–de Wolf,
  Example 3, p. 11, gives the polynomial and `s = bs = C = 3`; `D = 3` follows from `C ≤ D ≤ n`).
- The address function on `2 + 4` variables, whose first two variables select one of the last
  four as the output, has degree `3` and `s = bs = C = D = 3`.

*Needs:* Mathlib `MvPolynomial.restrictDegree`, `MvPolynomial.mem_restrictDegree`,
`MvPolynomial.totalDegree`, `MvPolynomial.eval`,
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, `Nat.sInf_mem`, `Nat.sInf_le`. (Proved here.)

### 2.2 The degree is at most the depth

Prove `degree_le_decisionTreeDepth`: `deg(f) ≤ D(f)` (Buhrman–de Wolf, Theorem 10, p. 14).

Route: by induction on a tree, a leaf with output `b` is represented by the constant `1` or `0`,
and a node querying `i` by `(1 − X_i) p₀ + X_i p₁`, where `p₀` and `p₁` represent its subtrees;
the total degree grows by at most one per level.

**Checks.**
- Equality holds for `OR_n`, `AND_n` and parity (`deg = D = n`), and for the function `AND` of
  two `OR`s of two variables (`deg = D = 4`).
- The inequality is strict for the function of 2.1 true on one or two of three variables
  (`2 < 3`); among all functions on three variables, `8` have `deg < D`.

*Needs:* 1.1, 2.1; Mathlib `MvPolynomial.totalDegree_add`, `MvPolynomial.totalDegree_mul`,
`MvPolynomial.totalDegree_X`, `MvPolynomial.totalDegree_C`, `Nat.sInf_mem`, `Nat.sInf_le`.
(Proved here.)

### Examples

The multilinear representatives of `AND`, `OR`, parity and the function true on one or two of
three variables; the address function on six variables.

### Dependencies

1.1. Mathlib `MvPolynomial.restrictDegree`, `MvPolynomial.mem_restrictDegree`,
`MvPolynomial.totalDegree`, `MvPolynomial.eval`,
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, `MvPolynomial.totalDegree_add`,
`MvPolynomial.totalDegree_mul`, `MvPolynomial.totalDegree_X`, `MvPolynomial.totalDegree_C`,
`Nat.sInf_mem`, `Nat.sInf_le`.

## Layer 3: certificates, sensitivity and depth

### 3.1 Nisan's bound

Prove `certComplexity_le_sensitivity_mul_blockSensitivity`: `C(f) ≤ s(f) · bs(f)`
(Buhrman–de Wolf, Lemma 3 and Theorem 2, p. 10, due to Nisan).

Route: a sensitive block `B` at `x` that is minimal under inclusion has `|B| ≤ s(f)`, because
every variable of `B` is sensitive at `flipBlock x B`. Take `bs(f, x)` disjoint sensitive blocks
at `x` and shrink each to a minimal sensitive block. Their union is a certificate at `x`:
otherwise an input agreeing with `x` on the union and with the other value differs from `x` on a
sensitive block disjoint from all of them. The union has at most `s(f) · bs(f)` variables.

**Checks.**
- For the function `AND` of two `OR`s of two variables, `C = 2 ≤ 2 · 2`; for `OR_n`,
  `C = n ≤ n²`.
- The function `x ↦ x 0` has `s = bs = C = 1`, so the bound is attained. Checked on all functions
  on at most four variables and on `8000` random functions on five variables.

*Needs:* 1.2, 1.3. (Proved here, following the cited proof.)

### 3.2 Depth from certificates and block sensitivity

Prove `decisionTreeDepth_le_certComplexityOn_mul_blockSensitivity`: for each `b : Bool`,
`D(f) ≤ C^(b)(f) · bs(f)` (Beals–Buhrman–Cleve–Mosca–de Wolf, Lemma 5.3, for `b = true`;
Buhrman–de Wolf, Theorem 11, p. 15, with the remark on `C^(0)` on p. 16).

Route, for `b = true` (the case `b = false` follows by applying it to `¬f`, which exchanges
`C^(0)` and `C^(1)` and keeps `D` and `bs`): induction on `β(f)`, the largest block sensitivity
at an input where `f` is false. If `f` has no false input or is constantly false, `D(f) = 0`.
Otherwise pick a true input and a certificate `S` at it with at most `C^(1)(f)` variables, and
build the tree that first queries the variables of `S`. If the answers agree with the
certificate, the value is true. If they do not, let `g` be the restriction of `f` to those
answers. For an input `y` where `g` is false, its disjoint sensitive blocks may be taken to
avoid `S`, since `g` ignores `S`, and the set of variables of `S` where the answers differ from the certificate is
one more sensitive block of `f`, at the input agreeing with `y` outside `S` and with the answers
on `S`. So `β(g) ≤ β(f) − 1`, and `C^(1)(g) ≤ C^(1)(f)`, since a certificate of `f` with the
variables of `S` removed certifies `g`. By induction `D(g) ≤ C^(1)(f) · (β(f) − 1)`, and
`D(f) ≤ C^(1)(f) + D(g) ≤ C^(1)(f) · β(f) ≤ C^(1)(f) · bs(f)`.

**Checks.**
- The function `AND` of two `OR`s of two variables has `D = 4 = C^(1) · bs = 2 · 2`: the bound is
  attained.
- `OR_n`: `C^(1) = 1` and `bs = n`, so the bound gives `D ≤ n`, which is attained; the bound with
  `C^(0) = n` gives `n²`.
- For `f = false`, `C^(1)(f) = 0` and the bound reads `D(f) ≤ 0`, which holds.
- Checked on all functions on at most four variables and on `8000` random functions on five
  variables.

*Needs:* 1.1, 1.2, 1.3; Mathlib `Nat.sInf_mem`, `Nat.sInf_le`. (Proved here; the route is a
form of the cited proofs.)

### 3.3 Consequences

Prove `decisionTreeDepth_le_blockSensitivity_pow_three`: `D(f) ≤ s(f) · bs(f)²` and
`D(f) ≤ bs(f)³` (Buhrman–de Wolf, Corollary 1, p. 15). Prove
`decisionTreeDepth_le_certComplexityOn_mul`: `D(f) ≤ C^(0)(f) · C^(1)(f)` (Buhrman–de Wolf,
Corollary 2, p. 16, there attributed to Blum–Impagliazzo, Hartmanis–Hemachandra and Tardos).

Route: by 3.2 with `C^(1)(f) ≤ C(f)`, 3.1 and `s ≤ bs` from 1.4. For the product: `bs(f) ≤ C(f)`
by 1.4 and `C(f)` is the larger of `C^(0)(f)` and `C^(1)(f)` (1.2); if `bs(f) ≤ C^(0)(f)` use 3.2
with `b = true`, otherwise `bs(f) ≤ C^(1)(f)` and use it with `b = false`.

**Checks.**
- The function `AND` of two `OR`s of two variables: `D = 4 = C^(0) · C^(1) = 2 · 2`, while
  `s · bs² = 8` and `bs³ = 8`.
- `OR_n`: `C^(0) · C^(1) = n = D`.

*Needs:* 1.2, 1.4, 3.1, 3.2. (Proved here.)

### Examples

`OR_n`, the function `AND` of two `OR`s of two variables, and `MAJ₃` against the bounds of 3.2
and 3.3.

### Dependencies

1.1, 1.2, 1.3, 1.4. No library declaration beyond those of Layer 1.

## Layer 4: the polynomial method

### 4.1 Symmetrization

Prove `exists_natDegree_le_eval_mul_choose`: for every real polynomial `p` in `m` variables
there is a polynomial `q` in one variable with `natDegree q ≤ totalDegree p` such that, for every
`k ≤ m`, `q(k) · (m choose k)` is the sum of `p` over the inputs with exactly `k` true variables;
so `q(k)` is the average of `p` over those inputs (Buhrman–de Wolf, Lemma 2, p. 4, due to Minsky
and Papert, stated there for multilinear `p`).

Route: both sides are linear in `p`, so take a monomial; on `{0, 1}^m` it equals the product of
the variables in its support `T`, with `j = |T|` at most its total degree. It is `1` on exactly
`(m − j choose k − j)` of the inputs with `k` true variables, and
`(m choose k)(k choose j) = (m choose j)(m − j choose k − j)`, so
`q = (j! · (m choose j))⁻¹ · descPochhammer ℝ j` works, of degree `j`, because
`(k choose j) = k(k − 1)⋯(k − j + 1)/j!`.

**Checks.**
- `p = X₀X₁` with `m = 2`: the sums for `k = 0, 1, 2` are `0, 0, 1`, and `q = X(X − 1)/2` gives
  `q(2) · 1 = 1`.
- `p = X₀ − X₁` with `m = 2` symmetrizes to `q = 0`: symmetrization can lower the degree.
- The statement needs no multilinearity: `p = X₀²` with `m = 1` gives `q = X`. Checked with
  exact arithmetic on `300` random polynomials with `m ≤ 5`.

*Needs:* 2.1 (`boolVec`); Mathlib `descPochhammer`, `descPochhammer_natDegree`,
`descPochhammer_eval_eq_descFactorial`, `Nat.choose_mul`, `MvPolynomial.totalDegree`. (Proved
here.)

### 4.2 Polynomials bounded at integer points

Prove `mul_le_natDegree_sq_mul`: let `p` be a real polynomial, `m` a natural number and
`b₁ ≤ p(i) ≤ b₂` for the integers `0 ≤ i ≤ m`; if `0 ≤ c ≤ |p′(x)|` at some `x ∈ [0, m]`, then
`c · m ≤ deg(p)² · (c + b₂ − b₁)`, with `deg(p)` the natural degree (Buhrman–de Wolf, Theorem 3,
p. 11, in the form `deg(p) ≥ √(c m/(c + b₂ − b₁))`, attributed to Ehlich–Zeller and
Rivlin–Cheney).

Route: for `m = 0` the left side is `0` and the right side is nonnegative because `b₁ ≤ p(0) ≤ b₂`.
For `m ≥ 1` let `M` be the largest value of `|p′|` on `[0, m]`, attained since the interval is
compact. Every point of `[0, m]` is within `1/2` of an integer of `[0, m]`, so by the mean value
theorem `b₁ − M/2 ≤ p ≤ b₂ + M/2` there. The polynomial `g(t) = p(m(t + 1)/2) − (b₁ + b₂)/2` has
natural degree at most `d = deg(p)`, satisfies `|g| ≤ (b₂ − b₁ + M)/2` on `[−1, 1]`, and
`g′(t) = (m/2) p′(m(t + 1)/2)`. Markov's inequality gives `m M ≤ d² (b₂ − b₁ + M)`. If `m ≤ d²`
the claim follows from `c m ≤ c d²` and `b₁ ≤ b₂`; otherwise `c (m − d²) ≤ M (m − d²) ≤ d² (b₂ − b₁)`.

**Checks.**
- The Chebyshev polynomial moved to `[0, m]`: for `m = 4`, `p(x) = 2(x/2 − 1)² − 1` has the values
  `1, −1/2, −1, −1/2, 1` at `0, …, 4`, so `b₁ = −1`, `b₂ = 1`, and `|p′(4)| = 2`; the inequality
  reads `8 ≤ 4 · 4 = 16`.
- The hypothesis `0 ≤ c` is needed: `p = X² − X`, `m = 1` has `p(0) = p(1) = 0`, so `b₁ = b₂ = 0`,
  and `c = −10` gives `−10 ≤ 4 · (−10) = −40`, which is false.
- The point `x` must lie in `[0, m]`: `p = (X − 5/2)²` with `m = 5` has the values `6.25, 2.25,
  0.25, 0.25, 2.25, 6.25`, so `b₁ = 0.25` and `b₂ = 6.25`, and `c = |p′(100)| = 195` would give
  `975 ≤ 4 · 201 = 804`, which is false.
- Checked on `20000` random polynomials of degree at most `7` with `m ≤ 30`, half of them close to
  a moved Chebyshev polynomial.

*Needs:* PolynomialInterpolationAndBestApproximation 4.3 (`abs_derivative_le_sq_mul`, Markov's
inequality); Mathlib `Polynomial.natDegree_comp`, `Polynomial.derivative_comp`,
`Polynomial.deriv`, `exists_deriv_eq_slope`, `IsCompact.exists_isMaxOn`, `isCompact_Icc`.
(Proved here.)

### 4.3 The Nisan–Szegedy inequality

Prove `blockSensitivity_le_two_mul_degree_sq`: `bs(f) ≤ 2 deg(f)²` (Buhrman–de Wolf, Theorem 4,
p. 11; Huang, p. 3).

Route: let `b = bs(f) ≥ 1` be attained at `a` with disjoint blocks `B₁, …, B_b`; replacing `f` by
`¬f`, which has the same block sensitivity and the degree of `1 − p`, assume `f a = false`. In the
multilinear representative `p` (2.1), substitute `Y_i` for `X_j` when `j ∈ B_i` and `a j` is false,
`1 − Y_i` when `j ∈ B_i` and `a j` is true, and the constant value of `a j` otherwise. The result
`q` in `b` variables has total degree at most `deg(f)`, values in `{0, 1}` on `{0, 1}^b`, `q = 0` at
`0` and `q = 1` at each unit vector. Symmetrizing (4.1) gives `r` with `natDegree r ≤ deg(f)`,
`r(0) = 0`, `r(1) = 1` and `0 ≤ r(k) ≤ 1` for `k ≤ b`. By the mean value theorem `r′(x) = 1` for
some `x ∈ (0, 1)`, and 4.2 with `m = b`, `c = 1`, `b₁ = 0`, `b₂ = 1` gives `b ≤ 2 natDegree(r)²`.

**Checks.**
- `OR_n`: `bs = n ≤ 2n²`. The function of 2.1 true on one or two of three variables:
  `bs = 3 ≤ 2 · 4`.
- On all functions on at most four variables the stronger `bs ≤ deg²` holds; the constant `2`
  is the one this route gives.
- For a constant function both sides are `0`.

*Needs:* 1.3, 2.1, 4.1, 4.2; Mathlib `MvPolynomial.aeval`, `MvPolynomial.totalDegree_add`,
`MvPolynomial.totalDegree_mul`, `exists_deriv_eq_slope`, `Polynomial.deriv`. (Proved here,
following the cited proof.)

### 4.4 The Nisan–Smolensky bound

Prove `decisionTreeDepth_le_degree_sq_mul_blockSensitivity`: `D(f) ≤ deg(f)² · bs(f)`
(Buhrman–de Wolf, Lemmas 5 and 6 and Theorem 12, p. 16, due to Nisan and Smolensky). With 4.3
this gives `D(f) ≤ 2 deg(f)⁴`.

Route: induction on `d = deg(f)`; for `d = 0`, `f` is constant. Call a monomial of degree `d`
with nonzero coefficient in the multilinear representative a maxonomial. Setting the variables
outside a maxonomial `M` to false leaves a function whose representative still contains `M`, so it
is not constant, and some set `B ⊆ M` has `f(flipBlock 0 B) ≠ f(0)`, with `0` the input that is
false everywhere. So pairwise disjoint maxonomials carry disjoint sensitive blocks at `0`, and a
maximal family of them has at most `bs(f)` members; the union `S` of its members has at most
`d · bs(f)` variables and meets every maxonomial. Query the variables of `S`: each restriction `g`
has a representative obtained from that of `f` by substituting constants, with no monomial of
degree `d` left, so `deg(g) ≤ d − 1`, and `bs(g) ≤ bs(f)`. Hence
`D(f) ≤ d · bs(f) + (d − 1)² · bs(f) ≤ d² · bs(f)`.

**Checks.**
- The function `AND` of two `OR`s of two variables: `D = 4 ≤ 16 · 2`.
- `OR_n`: `D = n ≤ n² · n`. Checked on all functions on at most four variables and on random
  functions on five.

*Needs:* 1.1, 1.3, 2.1; Mathlib `MvPolynomial.eval`, `MvPolynomial.totalDegree`, `Nat.sInf_mem`,
`Nat.sInf_le`. (Proved here, following the cited proof.)

### Examples

Symmetrization of `X₀X₁` and of `X₀ − X₁`; the moved Chebyshev polynomial against 4.2; `OR_n`
against 4.3 and 4.4.

### Dependencies

1.1, 1.3, 2.1. PolynomialInterpolationAndBestApproximation 4.3. Mathlib `descPochhammer`,
`descPochhammer_natDegree`, `descPochhammer_eval_eq_descFactorial`, `MvPolynomial.aeval`,
`MvPolynomial.eval`, `MvPolynomial.totalDegree`, `MvPolynomial.totalDegree_add`,
`MvPolynomial.totalDegree_mul`, `Nat.choose_mul`, `Nat.sInf_mem`, `Nat.sInf_le`, `Polynomial.natDegree_comp`, `Polynomial.derivative_comp`,
`Polynomial.deriv`, `exists_deriv_eq_slope`, `IsCompact.exists_isMaxOn`, `isCompact_Icc`.

## Layer 5: the sensitivity theorem

### 5.1 Huang's theorem on induced subgraphs of the cube

Prove `exists_sqrt_le_card_flipBlock_mem`: if `H` is a set of inputs with `2^n < 2 · |H|`, some
`x ∈ H` has at least `√n` neighbours in `H`, that is `√n ≤ #{i | x^i ∈ H}` (Huang, Theorem 1.1,
p. 1, for `n ≥ 1` and `|H| = 2^(n−1) + 1`; larger sets contain such a set, and for `n = 0` the
statement is `0 ≤ 0`).

Route: let `A` be the signed adjacency matrix of the cube indexed by inputs, with entry
`(−1)^#{j < i | x j}` at `(x, x^i)` and `0` elsewhere; it is symmetric and `A² = n · 1` (Huang,
Lemma 2.2, p. 3, whose recursive matrices are this one up to the order of the coordinates):
the two paths of length two between inputs that differ in `i < k` carry opposite signs. The
diagonal matrix `Δ` with entries `(−1)^|x|` satisfies `Δ A Δ = −A`, so the kernel `E` of `A − √n`
and the kernel of `A + √n` have equal dimension. Since `(A − √n)(A + √n) = 0`, the range of
`A + √n` lies in `E`, so by rank–nullity `dim E ≥ 2^n − dim E`, that is `2 · dim E ≥ 2^n`. The span of the basis vectors of the points of `H` has dimension
`|H|`, and `|H| + dim E > 2^n`, so it meets `E` in some `v ≠ 0`. At a point `x` where `|v x|` is largest,
`x ∈ H` and `√n |v x| = |(A v) x| ≤ ∑_{x^i ∈ H} |v (x^i)| ≤ #{i | x^i ∈ H} · |v x|`.

**Checks.**
- The hypothesis is sharp in size: the `2^(n−1)` inputs with an even number of true variables
  contain no two neighbours. Checked for `n ≤ 5`.
- For `n = 4` the theorem is tight: the least largest number of neighbours over the sets with
  `9` elements is `2 = √4`. Exhaustively, the least such number over all sets of more than
  `2^(n−1)` elements is `0, 1, 2, 2, 2` for `n = 0, …, 4`.
- The signed matrix: `A² = n · 1` and `Δ A Δ = −A` for `n ≤ 6`, and `√n` has multiplicity exactly
  `2^(n−1)` for `1 ≤ n ≤ 6`, checked numerically; for `n = 0`, `A` is the `1 × 1` zero matrix and
  the eigenvalue `0` has multiplicity `1`.

*Needs:* 1.3 (`flipBlock`); Mathlib `Matrix.mulVec`, `Submodule.finrank_sup_add_finrank_inf_eq`,
`Submodule.finrank_le`, `Submodule.finrank_mono`, `LinearMap.finrank_range_add_finrank_ker`,
`LinearEquiv.finrank_eq`, `Submodule.exists_mem_ne_zero_of_ne_bot`,
`Finset.exists_max_image`, `Real.sqrt`. (Proved here.)

### 5.2 The sensitivity theorem

Prove `degree_le_sensitivity_sq`: `deg(f) ≤ s(f)²`, that is `s(f) ≥ √deg(f)` (Huang,
Theorem 1.4, p. 3, conjectured by Gotsman and Linial).

Route: let `d = deg(f) ≥ 1` and `S` the set of variables of a monomial of degree `d` with
nonzero coefficient in the multilinear representative of `f` (2.1). Setting the
variables outside `S` to false leaves a function `g` of the `d` variables of `S` whose
representative keeps the coefficient of `∏_{i ∈ S} X_i`, which by the inclusion–exclusion formula
for coefficients is `∑_{T ⊆ S} (−1)^(d − |T|) g(1_T)` (expand each value `g(1_T)` in monomials and
use that `∑_{U ⊆ T ⊆ S} (−1)^(|S| − |T|)` vanishes unless `U = S`). Its being nonzero says that `g` takes the
value true on different numbers of inputs of even and of odd weight (Buhrman–de Wolf, Lemma 4,
p. 12, due to Shi and Yao). Hence the inputs `z` of the `d`-cube on which `g z` differs from the
parity of `z` are not exactly half, and one of the two classes, `H`, has more than `2^(d−1)`
elements. By 5.1 some `z ∈ H` has at least `√d` neighbours in `H`; at each such neighbour the
parity changes and the class does not, so `g` changes. Extending `z` by false outside `S` gives an
input where `f` has sensitivity at least `√d`, so `d ≤ s(f)²`. Huang's own route passes through
the equivalence of Gotsman and Linial (Huang, Theorem 1.3, p. 2).

**Checks.**
- The function `AND` of two `OR`s of two variables has `deg = 4 = 2² = s²`: the bound is attained
  (Buhrman–de Wolf, Example 2, p. 11; Huang, p. 3).
- `OR_n`: `deg = n ≤ n²`. The function of 2.1 true on one or two of three variables: `2 ≤ 9`.
- Checked on all functions on at most four variables (the largest ratio `deg/s²` is `1`) and on
  random functions on five.

*Needs:* 1.3, 2.1, 5.1; Mathlib `MvPolynomial.eval`, `MvPolynomial.totalDegree`,
`Finset.sum_powerset_neg_one_pow_card`, `Real.le_sqrt`. (Proved here.)

### 5.3 Block sensitivity is polynomial in sensitivity

Prove `blockSensitivity_le_two_mul_sensitivity_pow_four`: `bs(f) ≤ 2 s(f)⁴` (Huang, Theorem 1.5,
p. 3).

Route: 4.3 and 5.2 give `bs(f) ≤ 2 deg(f)² ≤ 2 (s(f)²)²`.

**Checks.**
- The function of 1.3 with `s = 2`, `bs = 3`: `3 ≤ 32`.
- For a constant function both sides are `0`.

*Needs:* 4.3, 5.2. (Proved here.)

### Examples

The sets of even inputs against 5.1; the function `AND` of two `OR`s of two variables, for which
5.2 is an equality.

### Dependencies

1.3, 2.1, 4.3. Mathlib `Matrix.mulVec`, `Submodule.finrank_sup_add_finrank_inf_eq`,
`Submodule.finrank_le`, `Submodule.finrank_mono`, `LinearMap.finrank_range_add_finrank_ker`,
`LinearEquiv.finrank_eq`, `Submodule.exists_mem_ne_zero_of_ne_bot`, `Finset.exists_max_image`, `Real.sqrt`,
`Real.le_sqrt`, `MvPolynomial.eval`, `MvPolynomial.totalDegree`, `Finset.sum_powerset_neg_one_pow_card`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: deterministic decision trees and
their least depth, certificates and the certificate complexities `C`, `C^(0)` and `C^(1)`,
sensitivity and block sensitivity, the degree of a Boolean function through real polynomials with
the uniqueness of the multilinear representative, the chain `s ≤ bs ≤ C ≤ D` with `deg ≤ D`,
Nisan's bound, the bounds of the depth by certificates and block sensitivity with their
consequences, symmetrization, the integer-point lemma, the inequalities of Nisan–Szegedy and of
Nisan–Smolensky, Huang's theorem on induced subgraphs of the cube, and the sensitivity theorem
with `bs ≤ 2 s⁴`.

Already in the libraries and therefore not targets: multivariate polynomials, their degrees and
the submodule `MvPolynomial.restrictDegree`, and the combinatorial Nullstellensatz
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, used above for uniqueness; the mean value
theorem and the derivative of a polynomial function. Mathlib's `Archive/Sensitivity.lean`, which
`import Mathlib` does not load, proves Huang's theorem in the form: a set of at least
`2^m + 1` vertices of the cube of dimension `m + 1` contains a vertex with at least `√(m + 1)`
neighbours in it. It is prior formalization, not a supplier; 5.1 states the same mathematics for
every `n`, including `n = 0`, and 5.2 and 5.3 are not in the Archive.

Left to other roadmaps:

- PolynomialInterpolationAndBestApproximation (an open roadmap, not on main) states Markov's
  inequality in its 4.3; this roadmap uses it in the route of 4.2 and does not restate it.
- BooleanFunctionAnalysis (an open roadmap, not on main) expands real functions on the cube
  `ι → ZMod 2` in Walsh characters and expresses "degree at most `k`" by the vanishing of the
  coefficients on sets of more than `k` coordinates; it defines no degree function and states
  nothing about decision trees, certificates or block sensitivity. Writing each variable as `(1 − (−1)^(x i))/2`
  shows that the degree of 2.1 is the largest size of a set with a nonzero Walsh coefficient of
  the function with values `0` and `1`; this roadmap does not use that description and does not
  depend on that roadmap.

Outside the scope: randomized and quantum decision trees and approximate degree; query
complexity of computational problems; the size of decision trees; Simon's lower bound on
sensitivity; sharper polynomial relations between the measures than those stated above; the
sharpness of Huang's theorem for square `n` (Chung, Füredi, Graham and Seymour); separating
examples beyond the small Checks above, such as Rubinstein's function.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Lattice/Nat.lean`: `Nat.sInf_mem` (a nonempty set of natural numbers contains
  its infimum) and `Nat.sInf_le` (the infimum is at most every member).
  `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup_le` (a `sup` is at most a common upper
  bound). `Mathlib/Data/Finset/Card.lean`: `Finset.card_le_card` (a subset has at most as
  many elements). `Mathlib/Data/Finset/Max.lean`: `Finset.exists_max_image` (a function on a
  nonempty finite set attains a largest value).
- `Mathlib/RingTheory/MvPolynomial/Basic.lean`: `MvPolynomial.restrictDegree σ R m`, the
  submodule of polynomials of degree at most `m` in each variable, and
  `MvPolynomial.mem_restrictDegree` (membership means every exponent of every monomial in the
  support is at most `m`).
- `Mathlib/Algebra/MvPolynomial/Eval.lean`: `MvPolynomial.eval`, `MvPolynomial.aeval`.
  `Mathlib/Algebra/MvPolynomial/Degrees.lean`: `MvPolynomial.totalDegree`,
  `MvPolynomial.totalDegree_add` (at most the larger of the two), `MvPolynomial.totalDegree_mul`
  (at most the sum), `MvPolynomial.totalDegree_X` (a variable has total degree `1` over a
  nontrivial ring), `MvPolynomial.totalDegree_C` (a constant has total degree `0`).
- `Mathlib/Combinatorics/Nullstellensatz.lean`: `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`
  (over a domain, a polynomial in finitely many variables whose degree in each variable `i` is less
  than `|S i|` and which vanishes on the product of the `S i` is zero).
- `Mathlib/Data/Nat/Choose/Basic.lean`: `Nat.choose_mul` (for `s ≤ k`,
  `(n choose k)(k choose s) = (n choose s)(n − s choose k − s)`). `Mathlib/Data/Nat/Choose/Sum.lean`:
  `Finset.sum_powerset_neg_one_pow_card` (the sum of `(−1)^|T|` over the subsets `T` of a finite set
  is `1` for the empty set and `0` otherwise).
- `Mathlib/RingTheory/Polynomial/Pochhammer.lean`: `descPochhammer`, `descPochhammer_natDegree`
  (`descPochhammer R j` has natural degree `j` over a nontrivial ring without zero divisors) and
  `descPochhammer_eval_eq_descFactorial` (its value at `k` is `k(k − 1)⋯(k − j + 1)`).
- `Mathlib/Algebra/Polynomial/Degree/Lemmas.lean`: `Polynomial.natDegree_comp` (over a ring without
  zero divisors the natural degree of `p.comp q` is the product). `Mathlib/Algebra/Polynomial/Derivative.lean`:
  `Polynomial.derivative_comp` (the chain rule). `Mathlib/Analysis/Calculus/Deriv/Polynomial.lean`:
  `Polynomial.deriv` (the derivative of `x ↦ p.eval x` is `p.derivative.eval x`).
- `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `exists_deriv_eq_slope` (the mean value
  theorem for a function continuous on `[a, b]` and differentiable on `(a, b)`, `a < b`).
  `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a function continuous on a
  nonempty compact set attains a maximum there); `isCompact_Icc`.
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.mulVec`. `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`:
  `Submodule.finrank_sup_add_finrank_inf_eq` (the dimensions of `s ⊔ t` and `s ⊓ t` add up to those
  of `s` and `t`). `Mathlib/LinearAlgebra/Dimension/Constructions.lean`: `Submodule.finrank_le` (a
  submodule has dimension at most that of the space). `Submodule.finrank_mono` (a smaller submodule has
  at most the dimension). `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`:
  `LinearMap.finrank_range_add_finrank_ker` (rank–nullity).
  `Mathlib/LinearAlgebra/Dimension/Finrank.lean`: `LinearEquiv.finrank_eq` (a linear equivalence
  preserves dimension).
  `Mathlib/Algebra/Module/Submodule/Lattice.lean`: `Submodule.exists_mem_ne_zero_of_ne_bot`.
- `Mathlib/Analysis/Real/Sqrt.lean`: `Real.sqrt` and `Real.le_sqrt` (for `0 ≤ x` and `0 ≤ y`, `x ≤ √y` if and only if `x² ≤ y`).

### From TauCetiRoadmap.PolynomialInterpolationAndBestApproximation

- Section 4.3, `abs_derivative_le_sq_mul` (Markov's inequality): if a real polynomial `p` has
  natural degree at most `n` and `|p| ≤ M` on `[−1, 1]`, then `|p′(x)| ≤ n² M` for every
  `x ∈ [−1, 1]`. Used in the route of 4.2 only.

## References

- Harry Buhrman and Ronald de Wolf, *Complexity measures and decision tree complexity: a survey*,
  Theoretical Computer Science 288 (2002), 21–43; the authors' preprint (27 pages) from Ronald de
  Wolf's page at CWI was read, and the definition, lemma, theorem, example and page numbers above
  are those of that preprint.
- Hao Huang, *Induced subgraphs of hypercubes and a proof of the Sensitivity Conjecture*, Annals of
  Mathematics 190 (2019), 949–955; arXiv:1907.00847, version 1, whose theorem, lemma and page
  numbers are used above.
- Robert Beals, Harry Buhrman, Richard Cleve, Michele Mosca and Ronald de Wolf, *Quantum lower
  bounds by polynomials*, Journal of the ACM 48 (2001), 778–797; arXiv:quant-ph/9802049, version 3,
  whose Lemma 5.3 (on its eighth page) is cited above.
- Attributions made in prose without a locator: Noam Nisan (block sensitivity and `C ≤ s · bs`,
  1991); Noam Nisan and Mario Szegedy (`bs ≤ 2 deg²`, 1994); Noam Nisan and Roman Smolensky
  (`D ≤ deg² · bs`); H. Ehlich and K. Zeller (1964) and T. J. Rivlin and E. W. Cheney (1966) for
  polynomials bounded at integer points; Marvin Minsky and Seymour Papert (symmetrization, 1969);
  Craig Gotsman and Nathan Linial (the equivalence and the conjecture `s ≥ √deg`, 1992);
  M. Blum and R. Impagliazzo, J. Hartmanis and L. Hemachandra, and G. Tardos (`D ≤ C^(0) C^(1)`);
  Andrei A. Markov (the inequality used in 4.2, 1889).
