# Roadmap: algebraic circuits and Valiant's classes

**Summary.** An arithmetic circuit computes a multivariate polynomial over a commutative
semiring `R` from variables and constants by additions and multiplications; its size counts all
its gates, inputs included. Valiant's class VP consists of the families of polynomials whose
number of variables, degree and circuit size grow polynomially; VNP consists of the families
obtained from one in VP by summing over all `0`/`1` values of some of its variables. This roadmap
builds the model and the two classes and proves the classical structure theorems and lower bound,
with explicit natural-number sizes wherever a circuit is built. Each statement names the structure
it needs on `R`.

The headline theorems:

- If `f` has a circuit of size `s`, then for every `d` one circuit of size `s(d + 1)² + 1`, all
  of whose gates are homogeneous, computes the homogeneous components of `f` of degrees `0, …, d`;
  and one circuit of size `5s + 2` computes `f` together with all its partial derivatives
  (Baur and Strassen).
- Over every commutative ring the permanent of a square matrix is given by Ryser's and Glynn's
  formulas, and the families of the permanents and of the Hamiltonian cycle polynomials of generic
  `n × n` matrices are in VNP.
- Over every commutative ring the determinant of the generic `n × n` matrix has a circuit of size
  `4(n + 1)⁴`, so the determinant family is in VP. A polynomial computed by a formula of size `s`
  is the permanent of a matrix of side at most `s + 1`, and, over a commutative ring, the
  determinant of a matrix of side at most `s + 2`, whose entries are variables and constants.
- Over a field of characteristic `0` or of characteristic at least `m`, if the permanent of the
  generic `m × m` matrix is the determinant of an `n × n` matrix whose entries are polynomials of
  degree at most one, then `m² ≤ 2n` (Mignon and Ressayre).

The roadmap uses Mathlib's permanent and determinant of the generic matrix, homogeneous
components and partial derivatives of multivariate polynomials, and Tau Ceti's chain rule for
partial derivatives under substitution. No roadmap is a supplier. Among its neighbours,
SatisfiabilityComplexity treats the Boolean analogue, satisfiability and its NP-completeness;
NonintersectingPathsAndLGV reads determinants as signed sums over path systems in a weighted
digraph; MatchingTheory lists the counting of perfect matchings by permanents outside its
scope.

Below, Layer 1 defines circuits, families, VP and VNP and proves their closure properties;
Layer 2 treats homogenization and Baur–Strassen; Layer 3 the permanent and the Hamiltonian cycle
polynomial; Layer 4 the determinant and formulas; Layer 5 the Mignon–Ressayre bound. Layers 2–4
use the definitions of Layer 1; Layer 5 uses no other layer.

## Conventions

- **Coefficients and variables.** `R` is a commutative semiring unless a statement asks for a
  commutative ring or a field; the variables form an arbitrary type `V` (possibly empty, possibly
  infinite). Polynomials are Mathlib's `MvPolynomial V R`; the degree is `totalDegree`.
- **Circuits.** A `Gate V R k` is an input `var v` or `const a`, or `add i j` or `mul i j` with
  `i j : Fin k`, positions below `k` (`i = j` allowed). A `Circuit V R s` gives a gate
  `c k : Gate V R k` at each position `k : Fin s`, and `Circuit.val c k` is the polynomial at `k`
  (`X v`, `C a`, or the sum or product of the values at `i` and `j`), defined by recursion on `k`.
  The size of a circuit is its number of gates. `Computes f s` says that some circuit with
  exactly `s` gates has `f` as one of its values, and `ComputesAll f s`, for
  `f : ι → MvPolynomial V R`, that one circuit with `s` gates has every `f i` among its values.
  Inputs (leaves) count: `X v` needs one gate, and no polynomial is computed with `0` gates. No
  division, no subtraction gate (a ring supplies `−1` as a constant). A route that builds a
  circuit with fewer gates than the bound pads it with gates `const 0` at the end, which changes
  no value (the first item of 1.1).
- **Families and classes.** A `PolyFamily R` has, for each `n : ℕ`, a number of variables
  `nvars n` and a polynomial `poly n` in the variables `Fin (nvars n)`. Bounds are polynomials
  with natural coefficients, as for Mathlib's polynomial-time Turing machines
  (`Turing.TM2ComputableInPolyTime`): `VP R` asks for one `p : Polynomial ℕ` with `nvars n`,
  `totalDegree (poly n)` and the number of gates of a circuit computing `poly n` all at most
  `p.eval n`, for every `n`. Since no polynomial is computed with `0` gates, a `p` with
  `p.eval 0 = 0`, such as `X`, never witnesses `VP`. `subsetSum g`, for `g` in the variables
  `Fin (m + r)`, keeps the first `m` variables and, for each subset `S` of the last `r`, sets
  those in `S` to `1` and the others to `0`, and adds the `2 ^ r` results (`Fin.append`). `VNP R`
  asks for a family `g` in `VP R` such that, for every `n`, `g.nvars n = nvars n + r` for some
  `r` and `poly n` is the subset sum of `g.poly n` (transported along `finCongr` of that
  equation).
- **Projection entries.** `IsProjEntry p` says that `p` is a variable or a constant. Every such
  `p` has `totalDegree p ≤ 1`.
- **Generic matrices.** The generic `n × n` matrix is Mathlib's `Matrix.mvPolynomialX (Fin n)
  (Fin n) R`, with entry `X (i, j)` in row `i` and column `j`. Mathlib's permanent is
  `M.permanent = Σ_σ ∏_i M (σ i) i` and `Matrix.det_apply` writes the determinant as
  `Σ_σ sign σ · ∏_i M (σ i) i`; both are invariant under transposition, so the orientation
  `∏_i M i (σ i)` used in the routes gives the same values. The permanent of the empty matrix
  is `1`. The families `permFamily R`, `hcFamily R` and `detFamily R` have `nvars n = n * n` and
  rename `X (i, j)` to the variable `finProdFinEquiv (i, j)`, of value `n * i + j` (row by row);
  `detFamily` needs a commutative ring.
- **Hamiltonian cycle polynomial.** For a square matrix `M` indexed by a finite type with `n`
  elements, `hamCycleSum M` is the sum of `∏_i M i (σ i)` over the permutations `σ` with
  `σ.cycleType = {n}`, that is, the cycles (in Mathlib's sense, `Equiv.Perm.IsCycle`: one
  nontrivial orbit) whose support is every index (`Equiv.Perm.IsCycle.cycleType`,
  `Equiv.Perm.card_cycleType_eq_one`). Mathlib's cycle type omits fixed points, and a cycle moves
  at least two points, so `hamCycleSum M = 0` when `n ≤ 1`: a Hamiltonian cycle needs two
  vertices. For the generic matrix the value at `n = 2` is `X (0, 1) X (1, 0)`, and for `n ≥ 3`
  the monomials are the directed Hamiltonian cycles of the complete digraph on `n` vertices.
- **Formulas.** `Formula V R` is the type of binary trees with variables and constants at the
  leaves and `+`, `×` at the inner nodes; `Formula.eval` is the polynomial it computes and
  `Formula.size` its number of nodes, so a formula with `L` leaves has size `2L − 1`.
- **Hessians.** For a polynomial `p` over a field and a point `x`, the Hessian of `p` at `x` is
  the square matrix of the values at `x` of the formal second partial derivatives
  `pderiv a (pderiv b p)`; it is used in the route of 5.1 only and is not declared.

## Layer 1: circuits and Valiant's classes

### 1.1 Circuits, families, VP and VNP

Define `Gate`, `Circuit`, `Circuit.val`, `Computes`, `ComputesAll`, `IsProjEntry`, `subsetSum`,
`PolyFamily`, `VP` and `VNP` as in the Conventions (circuits: Bürgisser, Def. 2.1, p. 4, whose
size counts only the addition and multiplication gates, while here the inputs count too; the
classes: Saptharishi, Def. 3.1, p. 25, and Def. 3.2, p. 27; Bürgisser, Def. 2.9, p. 6, and
Def. 2.25, p. 12, over a field). API, each a short induction or a direct construction:

- `Computes f s` and `ComputesAll f s` are monotone in `s`: for `s ≤ t`, the circuit with `t`
  gates that copies `c` at the positions below `s` and has `const 0` above has the same value at
  every position below `s`, by strong induction on the position. No polynomial is computed with
  `s = 0` (`Fin 0` is empty); `X v` and `C a` are computed with `s = 1`.
- A polynomial is computed with `s` gates exactly when it is an entry `l k`, `k < s`, of a
  sequence `l` of polynomials each of whose entries below `s` is a variable, a constant, or the sum
  or product of two earlier entries: given `c`, take `l k = c.val k`; given `l`, choose one such
  description of each entry below `s` and read it as a gate, then `c.val k = l k` by strong
  induction on `k`.
- If `Computes f s` and `Computes g t`, then `f + g` and `f * g` are computed with `s + t + 1`
  gates (place the second circuit after the first, shifting its positions by `s`, and add one
  gate).
- Substituting a projection entry for every variable keeps the number of gates: if `Computes f s`
  and every `σ v` satisfies `IsProjEntry`, then `aeval σ f` is computed with `s` gates (replace
  each input `var v` by the input for `σ v`).
- If `Computes f s`, then `totalDegree f ≤ 2 ^ (s − 1)`: the value at position `k` has degree at
  most `2 ^ k`, since `totalDegree_add` and `totalDegree_mul` bound sums by the maximum and
  products by the sum. The bound is attained by the squaring chain `x, x², x⁴, …` (Bürgisser,
  Ex. 2.1(2), p. 5).
- `ComputesAll (fun _ : Unit ↦ f) s` holds exactly when `Computes f s` holds; `ComputesAll` of an
  empty family holds for every `s`, `0` included.
- `VP R ⊆ VNP R`: take `g = f` itself, with `r = 0` and the equation `nvars n = nvars n + 0`
  (true by `rfl`); the subset sum over `Fin 0` has the single term `S = ∅`, whose substitution
  `Fin.append X _` is `X` (`Fin.append_right_nil`), and `aeval X` is the identity
  (`MvPolynomial.aeval_X_left`).
- Evaluation of a `Polynomial ℕ` is monotone: `p.eval a ≤ p.eval b` for `a ≤ b`, termwise from
  `Polynomial.eval_eq_sum_range` (all coefficients are natural numbers).

**Checks.**

- Over `ℤ`, `X v ^ 2` is computed with `2` gates (the input and its square) and not with `1`,
  since a circuit with one gate has the value `X w` or `C a`; a model counting only operations
  would give it size `1`.
- The family with one variable and `poly n = X 0` for every `n` is in `VP` with the constant
  polynomial `p = 1`: one variable, degree one and one gate at every `n`. The family with
  `nvars n = 2 ^ n` and `poly n = 0` is not in `VP` (too many variables), although `0` is
  computed with one gate; since the witness family of `VNP` has at least `nvars n` variables, it
  is not in `VNP` either.
- With no variables and one extra variable `y`, the subset sum of `y` is `0 + 1 = 1` and that of
  `C 1` is `2`; a sum over the signs `±1` would give `0` for `y`.

### 1.2 Closure of VP and VNP

Prove `mem_VNP_of_subsetSum`: if `g ∈ VNP R`, `g.nvars n = f.nvars n + t n` and `f.poly n` is the
subset sum over the last `t n` variables of `g.poly n` for every `n`, then `f ∈ VNP R`. Prove
`mem_VP_of_projection` and `mem_VNP_of_projection`: let `g` be in `VP R` (respectively `VNP R`),
`p : Polynomial ℕ`, `q : ℕ → ℕ` with `q n ≤ p.eval n` and `f.nvars n ≤ p.eval n`, and
`σ n : Fin (g.nvars (q n)) → MvPolynomial (Fin (f.nvars n)) R` with every value a projection
entry and `f.poly n = aeval (σ n) (g.poly (q n))`; then `f ∈ VP R` (respectively `VNP R`). These
are the closure properties stated without proof by Bürgisser (§3.1, p. 17; projections and
p-projections, Defs. 2.15–2.16, p. 8). (Proved here, with the bounding polynomials below.)

Route. VP, projection. Let `p_g` witness `g ∈ VP R`; then `P = p_g.comp p + p` witnesses
`f ∈ VP R`. The polynomial `f.poly n` is computed with `p_g.eval (q n)` gates (the substitution
item of 1.1). Its degree is at most that of `g.poly (q n)`: `aeval (σ n) = bind₁ (σ n)`
(`MvPolynomial.aeval_eq_bind₁`) and Tau Ceti's `MvPolynomial.totalDegree_bind₁_le` with `D = 1`.
By monotonicity (1.1), `p_g.eval (q n) ≤ p_g.eval (p.eval n) = (p_g.comp p).eval n ≤ P.eval n`
(`Polynomial.eval_comp`, `Polynomial.eval_add`), and `f.nvars n ≤ p.eval n ≤ P.eval n`; the
number of gates is raised to `P.eval n` by padding.

VNP, subset sums. Let `w ∈ VP R`, with polynomial `p_w`, witness `g ∈ VNP R`: at each `n`,
`w.nvars n = g.nvars n + r` and `g.poly n` is the subset sum of `w.poly n` (transported to
`Fin (g.nvars n + r)`) over the last `r` variables. Transport `w.poly n` instead along
`w.nvars n = f.nvars n + (t n + r)`, which follows from the two equations and `Nat.add_assoc`;
then the family `w` itself witnesses `f ∈ VNP R`, with the same `p_w`. A subset `S` of
`Fin (t n + r)` is a pair of subsets `S₁` of `Fin (t n)` and `S₂` of `Fin r` (the preimages
under `Fin.castAdd` and `Fin.natAdd`), so the subset sum over `t n + r` variables is a double
sum. For a fixed pair, the substitution of the inner sum (keep the first `g.nvars n` variables,
set the last `r` by `S₂`) followed by that of the outer one (keep the first `f.nvars n`, set the
next `t n` by `S₁`) is the single substitution `Fin.append X (indicator of S)` on
`Fin (f.nvars n + (t n + r))` (`MvPolynomial.comp_aeval`, `MvPolynomial.aeval_rename`, and
`Fin.append_left`, `Fin.append_right` on each block; the values `0` and `1` are fixed). Summing,
and using that `aeval` is additive, gives `f.poly n`.

VNP, projection. Let `w ∈ VP R`, with polynomial `p_w`, witness `g ∈ VNP R`, and choose for each
`n` some `r` with `w.nvars (q n) = g.nvars (q n) + r`. The new witness has
`f.nvars n + r` variables, and its `n`-th member is the transported `w.poly (q n)` with each
variable `Fin.castAdd r i` replaced by `σ n i` renamed by `Fin.castAdd r`, and each variable
`Fin.natAdd _ j` by `X (Fin.natAdd _ j)`; these are projection entries. Its number of variables is
at most `p.eval n + p_w.eval (q n)`, since `r ≤ w.nvars (q n)`, and its degree and number of gates
are at most `p_w.eval (q n)` as in the VP case; so `P = p_w.comp p + p` witnesses it in `VP R`.
For a subset `S`, the subset substitution after this one equals `aeval (σ n)` after the subset
substitution of `S` in the transported `w.poly (q n)` (`MvPolynomial.comp_aeval`; both send the
first block to `σ n` and the last to the indicator of `S`); summing over `S` and using that
`aeval (σ n)` is additive gives `aeval (σ n) (g.poly (q n)) = f.poly n`.

**Checks.** All over `ℤ` (over the zero ring every polynomial is `0`).

- The bound on `q` is needed: the family with `poly n = x ^ n` in one variable is in `VP` with
  `p = X + 1` (one input and `n − 1` products, or `C 1` for `n = 0`: at most `n + 1` gates), but
  with `q n = 2 ^ n` and `σ` the identity the projected family `x ^ (2 ^ n)` has exponential
  degree, while every family in `VNP` has polynomially bounded degree (the subset sum substitutes
  constants, which does not raise the degree).
- The bound on `f.nvars n` is needed: the family `nvars n = 2 ^ n`, `poly n = 0` of the Checks of
  1.1 is the projection, with `q n = n`, of the family with no variables and every polynomial
  `0`, which is in `VP` with `p = 1`; it is not in `VNP`.
- Projection entries are needed: substituting `x ^ (2 ^ n)` for the variable of the family with
  `poly n = x` (in `VP` with `p = 1`) gives exponential degree.
- The polynomial `P`: for `p_g = X ^ 2 + 1` and `p = X + 1`, `P = (X + 1) ^ 2 + 1 + X + 1`, and the
  number of gates `p_g.eval (q n) ≤ (n + 1) ^ 2 + 1` is at most `P.eval n` at `n = 0, 1, 2`:
  `2 ≤ 3`, `5 ≤ 7`, `10 ≤ 13`.

*Needs:* 1.1; Mathlib `MvPolynomial.aeval_eq_bind₁`, `MvPolynomial.aeval_rename`,
`MvPolynomial.comp_aeval`, `MvPolynomial.totalDegree_rename_le`, `Fin.append_left`,
`Fin.append_right`, `Fin.castAdd`, `Fin.natAdd`, `finCongr`, `Polynomial.eval_comp`,
`Polynomial.eval_add`; Tau Ceti `MvPolynomial.totalDegree_bind₁_le`.

### Examples

- By 1.2, substituting constants for some variables of the members of a family in `VNP`, and
  renaming the others injectively into at most `p.eval n` variables for a polynomial `p` with
  `n ≤ p.eval n` for every `n`, gives a family in `VNP` (take `q n = n`).

### Dependencies

1.1 is definitions. 1.2 uses 1.1.

## Layer 2: homogeneous components and partial derivatives

### 2.1 Homogenization

Prove `exists_homogeneous_circuit`: over a commutative semiring, if `Computes f s`, then for every
`d` there is a circuit with `s(d + 1)² + 1` gates whose values are all homogeneous and among which
are `homogeneousComponent i f` for `i = 0, …, d` (Saptharishi, Lemma 5.2, p. 40, and
Shpilka–Yehudayoff, Thm 2.2, p. 13, with the bound `O(s d²)`; the exact constant is proved here).

Route. Let `c` be a circuit with `s` gates computing `f`, and `l k = c.val k`. The new circuit
starts with the gate `C 0`, homogeneous of every degree (`isHomogeneous_zero`). For each `k < s` in
turn it provides gates for the components `h(k, i) = homogeneousComponent i (l k)`, `i ≤ d`: for an
input `X v`, `h(k, 1) = X v` (one gate, none if `d = 0`) and the other components are the zero gate;
for an input `C a`, `h(k, 0) = C a` (one gate) and the others are the zero gate; for
`l k = l i + l j`, the `d + 1` gates `h(i, ·) + h(j, ·)` (linearity of `homogeneousComponent`); for
`l k = l i * l j`, the component of degree `e` is `Σ_{t ≤ e} h(i, t) h(j, e − t)`, which costs
`e + 1` products and `e` additions, `(d + 1)²` gates for `e = 0, …, d`. Each gate of `c` costs at
most `(d + 1)²` gates, so there are at most `s(d + 1)² + 1`, and padding with `const 0`
(homogeneous) gives exactly that number. The product formula: write `l j = Σ_t h(j, t)`
(`sum_homogeneousComponent`, adding zero components beyond the degree); Tau Ceti's
`MvPolynomial.IsHomogeneous.homogeneousComponent_mul_right` gives
`homogeneousComponent e (a · h(j, t)) = homogeneousComponent (e − t) a · h(j, t)` for `t ≤ e` and
`0` otherwise; sum over `t`. Every gate is homogeneous by `IsHomogeneous.add`, `IsHomogeneous.mul`,
`isHomogeneous_X`, `isHomogeneous_C`.

**Checks.**

- For `d = 0` the bound is `s + 1` and the circuit computes the constant coefficient of `f`.
- One product gate costs exactly `(d + 1)²` new gates, sixteen at `d = 3`.
- Exhaustively, for all 4108 circuits of size at most `4` over the leaves `x`, `y`, `C 2`,
  `C (−1)` and `d = 0, …, 3`, the construction above computes every component of every gate, all
  its gates are homogeneous, and its size never exceeds `s(d + 1)² + 1`.

*Needs:* 1.1; Mathlib `MvPolynomial.homogeneousComponent`, `sum_homogeneousComponent`,
`homogeneousComponent_eq_zero`, `IsHomogeneous.add`, `IsHomogeneous.mul`, `isHomogeneous_X`,
`isHomogeneous_C`, `isHomogeneous_zero`; Tau Ceti
`MvPolynomial.IsHomogeneous.homogeneousComponent_mul_right`.

### 2.2 The Baur–Strassen theorem

Prove `computesAll_pderiv`: over a commutative semiring, if `Computes f s`, then one circuit with
`5s + 2` gates computes `f` and `pderiv v f` for every variable `v` (the family indexed by
`Option V`). Baur and Strassen proved that the gradient costs a constant factor; Saptharishi,
Lemma 6.3, p. 60 (proof §6.1.2, p. 61, at most `5s` edges in his count), and Shpilka–Yehudayoff,
Thm 2.5, p. 15, state it with size `O(s)`; the constant `5s + 2` in this model is proved here.

Route (reverse accumulation). Let `c` be a circuit with `s` gates, `l k = c.val k`, and `o < s` a
position with `l o = f`; each `l k` is described by its gate `c k`. Keep the `s` gates and add `C 0`
and `C 1`. Process `u = o, o − 1, …, 0`; when `u` is processed, its adjoint `A_u` is the sum of the
contributions it has received (the gate `C 1` for `u = o`, the gate `C 0` if there are none), which
costs one addition fewer than the number of contributions. An addition gate `l u = l i + l j` passes
`A_u` to `i` and to `j` (no new gate); a product gate `l u = l i * l j` passes `A_u · l j` to `i`
and `A_u · l i` to `j` (two products; when `i = j` both go to `i`). Finally `pderiv v f` is the sum
of the adjoints of the leaves `u ≤ o` with `l u = X v` (the gate `C 0` if there is none). With `m`
operation gates and `ℓ` leaves, there are at most `2m` contributions besides the initial one, hence
at most `2m` products and `2m` additions for adjoints, and at most `ℓ` additions for the partial
derivatives: at most `s + 2 + 4m + ℓ ≤ 5s + 2` gates, every new gate uses earlier ones, and padding
gives exactly `5s + 2`.

Correctness: for every `j ≤ o`,
`pderiv v f = Σ_{k ≤ j} A⁽ʲ⁾_k · pderiv v (l k) + Σ_{leaves k, j < k ≤ o} A_k · pderiv v (l k)`,
where `A⁽ʲ⁾_k` is the sum of the contributions `k` has received once the gates above `j` are
processed. For `j = o` this reads `pderiv v f = 1 · pderiv v (l o)`. Processing gate `j` keeps the
identity: for a sum by additivity of `pderiv v`, for a product by `MvPolynomial.pderiv_mul` (also
when `i = j`), for a constant because `pderiv v (C a) = 0` (`pderiv_C`), and a leaf moves to the
second sum. When all gates are processed, `pderiv v f = Σ_{leaves k ≤ o} A_k · pderiv v (l k)` and
`pderiv v (X w)` is `1` for `w = v` and `0` otherwise (`pderiv_X`). No subtraction is used, so the
route works over every commutative semiring; variables that do not occur, and an infinite `V`, are
covered by the gate `C 0`.

**Checks.**

- `f = x²` with the circuit `x, x · x` (`s = 2`): the adjoint of `x` is `1 · x + 1 · x`, so
  `pderiv x f = 2x`, and the new circuit has `2 + 2 + 2 + 1 = 7 ≤ 12` gates.
- The output need not be the last gate: for `x, x · x, y, x · x + y` with `o = 1`, the construction
  gives `pderiv x = 2x` and `pderiv y = 0`.
- Exhaustively, for the 4108 circuits of size at most `4` of the Checks of 2.1, every partial
  derivative (including that of an absent variable `z`) is correct, and the size is at most
  `5s + 2 − 4`.

*Needs:* 1.1; Mathlib `MvPolynomial.pderiv`, `MvPolynomial.pderiv_mul`, `MvPolynomial.pderiv_X`,
`MvPolynomial.pderiv_C`.

### Examples

- With 2.2, the gradient of the permanent costs at most five times the permanent plus two gates.

### Dependencies

2.1 and 2.2 each use 1.1.

## Layer 3: the permanent and the Hamiltonian cycle polynomial

### 3.1 Ryser's formula

Prove `permanent_eq_sum_powerset`: for a square matrix `A` over a commutative ring indexed by a
finite type of cardinality `n`,
`perm A = Σ_{S ⊆ index set} (−1) ^ (n − |S|) ∏_i Σ_{j ∈ S} A i j`. Ryser's formula; stated with
complements by Bürgisser, (2.3), p. 12, and in this form by Shpilka–Yehudayoff, Fact 1.1, p. 4,
both without proof. (Proved here.)

Route. Expand each product of sums (`Finset.prod_univ_sum`) as a sum over the maps
`φ : index → index` with values in `S`, of `∏_i A i (φ i)`. Exchanging the sums, the coefficient of
`φ` is `Σ_{S ⊇ image φ} (−1) ^ (n − |S|)`; writing `S` as the image plus a subset `T` of its
complement `U`, this is `Σ_{T ⊆ U} (−1) ^ (|U| − |T|)`, which is `1` if `U` is empty and `0`
otherwise (`Finset.sum_powerset_neg_one_pow_card`, after the substitution `T ↦ U \ T`). So only
surjective `φ` survive, which on a finite type are the permutations, and
`Σ_σ ∏_i A i (σ i) = perm Aᵀ = perm A` (`Matrix.permanent_transpose`).

**Checks.**

- Empty index type: the only `S` is empty and both sides are `1`.
- `1 × 1`: `S = ∅` gives `(−1) · 0` and `S = {0}` gives `a`; with the sign `(−1) ^ |S|` the formula
  would give `(−1) ^ n perm A`, here `−a`.
- Symbolically, both sides agree for the generic matrices of sides `0` to `4`.

*Needs:* Mathlib `Matrix.permanent`, `Matrix.permanent_transpose`, `Finset.prod_univ_sum`,
`Finset.sum_powerset_neg_one_pow_card`.

### 3.2 Glynn's formula

Prove `permanent_glynn`: for a square matrix `A` over a commutative ring indexed by a finite type
of cardinality `n`, with `ε true = 1` and `ε false = −1`: for every index `i₀`,
`2 ^ (n − 1) perm A = Σ_{δ, δ i₀ = true} (∏_k ε (δ k)) ∏_i Σ_j ε (δ j) A i j`, and
`2 ^ n perm A` is the same sum over all `δ` (the empty index type included). Glynn's formula
(Chabaud–Deshpande–Mehraban, §5.1, eqs. (33)–(34), p. 9, state it with `x₁ = 1` and with all
signs, dividing by `2 ^ (m − 1)` and `2 ^ m`; the form over every commutative ring, with
no division, is proved here).

Route. Fix `δ` and expand `∏_i Σ_j ε(δ j) A i j` as `Σ_φ (∏_i ε(δ (φ i))) ∏_i A i (φ i)` over maps
`φ`; with `c_k = |φ⁻¹(k)|`, `∏_k ε(δ k) · ∏_i ε(δ (φ i)) = ∏_k ε(δ k) ^ (1 + c_k)`. Summing over
the `δ` with `δ i₀ = true`, the factor for `i₀` is `1` and the others factor
(`Fintype.prod_sum` over the remaining coordinates):
`∏_{k ≠ i₀} (1 + (−1) ^ (1 + c_k))`, which is `2 ^ (n − 1)` if every `c_k` with `k ≠ i₀` is odd and
`0` otherwise. If they are all odd they are at least `1`, so `c_{i₀} = n − Σ_{k≠i₀} c_k ≤ 1`; and
`c_{i₀} = 0` is impossible, since then `n` would be a sum of `n − 1` odd numbers, of parity
`n − 1`. So every fibre has one point, `φ` is a permutation, each permutation has weight
`2 ^ (n − 1)`, and the sum is `2 ^ (n − 1) perm A` as in 3.1. The sum over all `δ` is computed the
same way with every coordinate free: the factor is `∏_k (1 + (−1) ^ (1 + c_k))`, nonzero only when
all `c_k` are odd, hence all equal to `1`, with value `2 ^ n`. Neither identity is derived from the
other by cancelling `2`, which is not allowed in characteristic `2`.

**Checks.**

- `1 × 1`: the normalised sum has the single term `δ = (true)`, `1 · (1 · a) = a = 2 ^ 0 a`; the
  full sum is `a + (−1)(−a) = 2a`.
- `2 × 2`, `i₀ = 0`: the terms `δ = (true, true)` and `(true, false)` give
  `(a + b)(c + d) − (a − b)(c − d) = 2(ad + bc)` for rows `(a, b)`, `(c, d)`.
- Symbolically, both identities hold for the generic matrices of sides `0` to `4` and every `i₀`.

*Needs:* Mathlib `Matrix.permanent`, `Matrix.permanent_transpose`, `Finset.prod_univ_sum`,
`Fintype.prod_sum`.

### 3.3 The permanent and Hamiltonian cycle families

Define `hamCycleSum`, `permFamily R` and `hcFamily R` as in the Conventions; Bürgisser, §2.8,
pp. 15–16, defines the Hamilton cycle polynomials as sums over the cyclic permutations.

**Checks.**

- For the generic matrix, `hamCycleSum` is `0` for `n = 0` and `n = 1` (the identity has the
  empty cycle type, not `{0}` or `{1}`), and `X (0, 1) X (1, 0)` for `n = 2`; the numbers of
  permutations of `Fin n` with cycle type `{n}` for `n = 0, …, 6` are `0, 0, 1, 2, 6, 24, 120`,
  that is `(n − 1)!` for `n ≥ 2`. A sum over the permutations that are a cycle on all of `Fin n`
  in the sense of `Equiv.Perm.IsCycleOn` would instead count the identity for `n ≤ 1`, giving `1`
  and `X (0, 0)`.
- For `n = 3` it is `X(0,1) X(1,2) X(2,0) + X(0,2) X(2,1) X(1,0)`, while the permanent of the
  generic `3 × 3` matrix has six terms. In `hcFamily R`, the first monomial is
  `X 1 · X 5 · X 6` (`finProdFinEquiv (i, j) = 3 i + j`).

### 3.4 The permanent and the Hamiltonian cycle polynomial are in VNP

Prove `permFamily_mem_VNP` and `hcFamily_mem_VNP`: over every commutative ring both families are
in `VNP R`. Bürgisser, p. 12, deduces the first from Valiant's criterion over a field, and so
does Saptharishi, Cor. 3.4, p. 28. The witnesses, their counts and their bounding polynomials
below are proved here.

Route, the permanent. The witness family has `n * n + n` variables: `x_ij`, the variable
`finProdFinEquiv (i, j)`, among the first `n * n`, and `e_j`, the variable `Fin.natAdd (n * n) j`,
for the last `n`; at each `n` take `r = n` (the equation `n * n + n = n * n + n` is `rfl`) and
`g n = ∏_j (2 e_j − 1) · ∏_i Σ_j e_j x_ij`. For a subset `S` of `Fin n`, the subset substitution
gives `∏_j (2 e_j − 1) = (−1) ^ (n − |S|)` and `Σ_j e_j x_ij = Σ_{j ∈ S} x_ij`, so the subset sum
of `g n` is the right side of 3.1 for the generic matrix, renamed by `finProdFinEquiv`, which is
its permanent (`MvPolynomial.rename` is a ring map, so it commutes with the sums and products of
3.1). The witness has degree at most `3n`, and a circuit with `3n² + 4n + 1` gates for `n ≥ 1`
(the inputs `x_ij`, `e_j`, `C 2`, `C (−1)`; `2e_j` and `2e_j − 1`; `n − 1` products; the `n²`
products `e_j x_ij`, `n(n − 1)` additions, `n − 1` products; one last product) and the single
gate `C 1` for `n = 0`. So `p = 4 (X + 1) ^ 2` witnesses it in `VP R` at every `n`:
`n² + n`, `3n` and `3n² + 4n + 1` are at most `4(n + 1)²`, and `p.eval 0 = 4 ≥ 1`.

Route, the Hamiltonian cycle polynomial. Let `k = n − 1` (truncated, so `k = 0` for `n ≤ 1`) and
`r = k * k`; the witness family has `n * n + k * k` variables. For `n ≤ 1`, `hamCycleSum` of the
generic matrix is `0` (3.3), and the witness is `g n = 0`, one gate `C 0`. For `n ≥ 2` index the
last `k * k` variables (through `Fin.natAdd` and `finProdFinEquiv`) as `e_{a t}`, `a, t < k`, read
"vertex `a + 1` sits at position `t + 1`"; vertex `0` sits at position `0`. Let `P(0, 0) = 1`,
`P(0, t + 1) = P(a + 1, 0) = 0`, `P(a + 1, t + 1) = e_{a t}`, and
`PM = ∏_a Σ_t e_{at} ∏_{u ≠ t} (1 − e_{au}) · ∏_t Σ_a e_{at} ∏_{b ≠ a} (1 − e_{bt})`. Put
`g n = PM · ∏_{t < n} Σ_{a, b < n} P(a, t) P(b, t + 1 mod n) x_ab`. For the indicator vector `e`
of a subset, `Σ_t e_{at} ∏_{u ≠ t} (1 − e_{au})` is the number of `t` for which row `a` of `e` is
the `t`-th unit vector, so it is `1` if row `a` has exactly one `1` and `0` otherwise; hence `PM`
is `1` exactly when `e` is a permutation matrix and `0` otherwise. For the permutation matrix of
`π ∈ Perm (Fin k)`, the vertices `v_0 = 0` and `v_(π a + 1) = a + 1` list `Fin n` without
repetition, the factor for `t` is `x_(v_t, v_(t+1 mod n))`, and the product is `∏_i X (i, σ i)`
for the permutation `σ` with `σ (v_t) = v_(t+1 mod n)`. This `σ` is `τ * finRotate n * τ⁻¹` for
the bijection `τ : t ↦ v_t`, so its cycle type is `{n}` (`Equiv.Perm.cycleType_conj`,
`cycleType_finRotate_of_le`, as `n ≥ 2`). Conversely a `σ` with cycle type `{n}` is a cycle
(`Equiv.Perm.card_cycleType_eq_one`) whose support has `n` elements
(`Equiv.Perm.IsCycle.cycleType`), so it is a cycle on all of `Fin n` (`IsCycle.isCycleOn`), and
it arises from exactly one `π`, through `v_t = σ ^ t 0` (all distinct and exhausting `Fin n`,
`Equiv.Perm.IsCycleOn.pow_apply_eq`). So the subset sum of `g n` is `hcFamily` at `n`. The
witness has degree at most `2k² + 3n ≤ 3(n + 1)²`. Its circuit for `n ≥ 2`: inputs `x_ab`,
`e_{at}`, `C 1`, `C (−1)`, `C 0` (`n² + k² + 3`); the `1 − e_{at}` (`2k²`); the row and column
factors (`2(k²(k − 1) + k(k − 1) + (k − 1))`); `PM` (one product); for each `t`, `n²` terms of
two products and `n² − 1` additions (`n(3n² − 1)` in all); `n − 1` products and one last product.
This total is at most `5(n + 1)³`, so `p = 5 (X + 1) ^ 3` witnesses the family in `VP R` at every
`n`: `n² + k² ≤ 5(n + 1)³`, `3(n + 1)² ≤ 5(n + 1)³`, and one gate for `n ≤ 1`.

**Checks.**

- The subset-sum identity of the permanent witness was checked symbolically for `n = 0, …, 4`,
  and that of the Hamiltonian cycle witness for `n = 0, …, 4` (for `n = 4`, `512` subsets), both
  in the variables `Fin (n * n + r)` with `finProdFinEquiv`; the constructed circuits have exactly
  `3n² + 4n + 1` gates for `1 ≤ n ≤ 12`, and at most the count above for the Hamiltonian cycle
  witness for `2 ≤ n ≤ 8`; the bounds by `4(n + 1)²` and `5(n + 1)³` hold for `n ≤ 200`.
- The indicator `PM` is needed: without it the subset sum of the Hamiltonian cycle witness at
  `n = 3` receives terms from the `0`/`1` matrices that are not permutation matrices, and is no
  longer `hcFamily` at `3`.
- At `n = 1` the witness is `0`; the matrix route for `n ≥ 2` would give `x_00` there, which is
  not `hamCycleSum` of the `1 × 1` generic matrix.

*Needs:* 1.1, 3.1, 3.3; Mathlib `Matrix.mvPolynomialX`, `Matrix.mvPolynomialX_apply`,
`MvPolynomial.rename`, `finProdFinEquiv`, `Fin.natAdd`, `Equiv.Perm.cycleType_conj`,
`cycleType_finRotate_of_le`, `Equiv.Perm.card_cycleType_eq_one`, `Equiv.Perm.IsCycle.cycleType`,
`Equiv.Perm.IsCycle.isCycleOn`, `Equiv.Perm.IsCycleOn.pow_apply_eq`.

### Examples

- In characteristic `2` the permanent equals the determinant: by `Matrix.det_apply` the two
  differ only by the signs `sign σ = ±1`, and `−x = x` (`CharTwo.neg_eq`). Over `ℤ` they differ
  for `2 × 2` matrices (`ad + bc` against `ad − bc`).

### Dependencies

3.1 and 3.2 use nothing from this roadmap. 3.3 uses 1.1. 3.4 uses 1.1, 3.1 and 3.3.

## Layer 4: the determinant

### 4.1 The determinant has polynomial-size circuits

Define `detFamily R` over a commutative ring as in the Conventions. Prove
`computes_det_and_detFamily_mem_VP`: over every commutative ring the determinant of the generic
`n × n` matrix is computed with `4(n + 1)⁴` gates, and `detFamily R ∈ VP R`. The route is that of
Mahajan and Vinay through clow sequences (Saptharishi, Def. 3.8, Lemma 3.9 and its proof,
Thm 3.10, pp. 32–34; Bürgisser, Prop. 2.17, p. 9, states circuits of size `O(n⁴)` over every
commutative ring); the explicit circuit, its sign and its count are proved here.

Route. Let the edge `u → w` of the complete digraph with loops on `{0, …, n − 1}` have weight
`x_uw`. A clow with head `h` is a closed walk `h → c_1 → ⋯ → c_(ℓ−1) → h` of length `ℓ ≥ 1` all of
whose other vertices are larger than `h`; a clow sequence is a list of clows with strictly
increasing heads and total length `n`; its weight is the product of its edge weights and its sign
`(−1) ^ (n + r)`, `r` the number of clows.

Clow lemma: the signed weights of all clow sequences add up to `det`. A cycle cover is a clow
sequence (each cycle with its least vertex as head, ordered by heads) whose sign is that of the
permutation, `(−1) ^ (n − r)` (`Matrix.det_apply`, after transposing). The others cancel in pairs:
for one that is not a cycle cover, let `i` be the largest index such that `C_i, …, C_r` are not
pairwise disjoint simple cycles (then `C_(i+1), …, C_r` are). Walk along `C_i` from its head and
stop at the first vertex `v` that either lies on some `C_j`, `j > i`, or closes a cycle inside `C_i`
(a second visit to a vertex; the head is never revisited before the end). Exactly one of the two
occurs first. In the first case insert the cycle `C_j`, rotated to start at `v`, into `C_i` at `v`
and delete `C_j`; in the second, cut the cycle traversed since the first visit to `v` out of `C_i`
and insert it as a clow with its least vertex as head, at its place among the heads (it is disjoint
from `C_(i+1), …, C_r`, and its vertices exceed the head of `C_i`). The weight is unchanged and `r`
changes by one. In the new sequence the index is again `i` (in the first case the new `C_i` repeats
`v`; in the second it still contains `v`, which also lies on the new cycle), the walk stops at the
same `v` with the other case, and so the map is an involution without fixed points (Saptharishi's
proof of Lemma 3.9 is this argument).

The circuit. For `0 ≤ ℓ ≤ n − 1`, `h ≤ v < n`, let `F(ℓ, h, v)` be the signed sum, with sign
`(−1) ^ (number of closed clows)`, over the lists of closed clows with heads less than `h` followed
by an open walk from `h` that is at `v`, all vertices after `h` larger than `h`, of the weights of
their `ℓ` edges. Then `F(0, h, h) = 1`, `F(0, h, v) = 0` for `v ≠ h`, and
`F(ℓ + 1, h, w) = Σ_{h ≤ v} F(ℓ, h, v) x_vw` for `w > h`,
`F(ℓ + 1, h', h') = Σ_{h < h'} Σ_{h ≤ v} F(ℓ, h, v) · (−x_vh)` (close the clow with head `h`, open
one with head `h'`), and `det = (−1) ^ n Σ_{h ≤ v} F(n − 1, h, v) · (−x_vh)` by the clow lemma, for
`n ≥ 1`; `det = 1` for `n = 0` (one gate `C 1`). Gates: `n²` inputs and `C 1`, `C (−1)`, `C 0`,
`C ((−1) ^ n)`; `n²` gates `−x_vh`; for each of the `n − 1` steps, at most `n² · n` extension
products, `n²` closing products and `2n³` additions, at most `4n³`; at the end at most `n²`
products, `n²` additions and one product. In all at most `4n⁴ + 4n² + 5`, which is at most
`4(n + 1)⁴` for `n ≥ 1`; padding gives exactly `4(n + 1)⁴` gates, also for `n = 0`. The family
is in `VP` with `p = 4 (X + 1) ^ 4`: at every `n` it has `n²` variables and degree at most `n`
(each term of `Matrix.det_apply` is a product of `n` variables), both at most `4(n + 1)⁴`, and
renaming the inputs by `finProdFinEquiv` keeps the number of gates.

**Checks.**

- The sign: without the final factor `(−1) ^ n` the construction computes `(−1) ^ n det`, and so
  does Saptharishi's algebraic branching program of Thm 3.10 as printed (closing edges `−x_ji`,
  start `v_(1,1)` only; the clow sequences whose first head is not the least vertex cancel among
  themselves, since the involution keeps the set of visited vertices); at `n = 1` both give
  `−x_00`. Symbolically, the circuit with the factor equals `det` for `n = 0, …, 5`, and without
  it `(−1) ^ n det`.
- The count of the route, `4n⁴ + 4n² + 5`, is `13, 85, 365, 1093` for `n = 1, …, 4`, against
  `4(n + 1)⁴ = 64, 324, 1024, 2500`; an implementation that creates no gate for an empty sum has
  `8, 19, 56, 157, 376` gates for `n = 1, …, 5`.

*Needs:* 1.1; Mathlib `Matrix.det_apply`, `Matrix.det_transpose`, `Matrix.mvPolynomialX_apply`.

### 4.2 Determinants and permanents are universal for formulas

Define `Formula`, `Formula.eval` and `Formula.size` as in the Conventions. Prove
`exists_permanent_eq_eval`: over a commutative semiring, for every formula `φ` there are
`n ≤ φ.size + 1` and an `n × n` matrix of projection entries whose permanent is `φ.eval`; and
`exists_det_eq_eval`: over a commutative ring, the same with `n ≤ φ.size + 2` and the determinant.
Valiant's universality theorem; Shpilka–Yehudayoff, Thm 1.4, p. 5, state side `s + 1` for the
determinant, and Bürgisser, Prop. 2.23, pp. 10–11, side `m + 1` for weakly skew circuits of size
`m`. The construction below, with these bounds, is proved here.

Route. Build a directed acyclic graph with a source `s` and a sink `t` by induction on `φ`: a
leaf with label `w` (a variable or a constant) gives `s → m → t` with weights `w` and `1`, through a
new middle vertex `m`; `φ + ψ` identifies the sources and the sinks of the two graphs (parallel
composition); `φ · ψ` identifies the sink of the first with the source of the second (series
composition). By induction the sum over `s`–`t` paths of the products of the weights is `φ.eval`,
every edge has a middle vertex as one end, so no two edges join the same ordered pair and no edge
joins `s` to `t`, and the number of vertices is at most `2L + 1` for `L` leaves (`3` for a leaf;
at most `(2L₁ + 1) + (2L₂ + 1) − 2` and `− 1` for the compositions). Now identify `s` with `t`:
`N ≤ 2L` vertices, and every cycle that is not a loop passes through `s`, because the graph was
acyclic. Let `M` have the weight of the edge `u → w` at `(u, w)` and `0` where there is none.

(a) Put `1` on the diagonal except at `s`, where the entry is `0`. A permutation with nonzero term
is a cycle through `s` (an `s`–`t` path) together with loops at the other vertices, so the
permanent is the sum of the path weights, `φ.eval`, with `N ≤ 2L = φ.size + 1`.

(b) Put `−1` on the diagonal except at `s`. A cover whose cycle through `s` has `k` edges has sign
`(−1) ^ (k − 1)` and loop factor `(−1) ^ (N − k)`, so the determinant is `(−1) ^ (N − 1) φ.eval`.
If `N` is odd this is `φ.eval`; if `N` is even, add one isolated vertex with loop `−1`, which
multiplies the determinant by `−1`. The side is at most `2L + 1 = φ.size + 2`. The entries are
variables, constants of `φ`, `0`, `1` and `−1`.

**Checks.**

- A single leaf `w`: (a) gives `[[0, w], [1, 1]]` with permanent `w`, side `2 = size + 1`; (b) gives
  `[[0, w], [1, −1]]` with determinant `−w`, so a third vertex is added and the side is
  `3 = size + 2`.
- For `x + y`, a graph with one edge per leaf and the ends of parallel pieces identified would have
  two edges `s → t` and need the entry `x + y`; the subdivided leaves keep every entry a variable or
  a constant (here the side is `3`). Bürgisser's proof of Prop. 2.23 replaces every weight `w(e)` by
  `−w(e)`, which puts negated variables into the matrix; that route is not used here.
- For all formulas with at most three leaves over `x`, `y`, `C 0`, `C 2`, and with four leaves over
  `x`, `y`, `C 2`, the two matrices have the stated sides, and their permanent and determinant equal
  `φ.eval` (symbolically up to two leaves, at three integer points beyond).

*Needs:* 1.1; Mathlib `Matrix.permanent`, `Matrix.det_apply`, `Equiv.Perm.IsCycle.sign`.

### Examples

- A formula of size `s` gives a circuit of size `s` (each node a gate), so `Computes φ.eval
  φ.size`; conversely a circuit is a formula only after its shared gates are duplicated.
- Every formula of size `s` computes the determinant of an `(s + 2) × (s + 2)` matrix whose
  entries have degree at most one, so the hypothesis of 5.1 is met by every such polynomial.

### Dependencies

4.1 and 4.2 use 1.1.

## Layer 5: the permanent as a determinant

### 5.1 The Mignon–Ressayre bound

Prove `sq_le_two_mul_of_det_eq_permanent`: let `F` be a field with `ringChar F = 0` or
`m ≤ ringChar F`, and `A` an `n × n` matrix of polynomials in the variables `Fin m × Fin m` with
`totalDegree (A i j) ≤ 1` for all `i, j`. If `det A` is the permanent of the generic `m × m`
matrix, then `m² ≤ 2n`. Mignon and Ressayre proved this in characteristic `0` (Cai–Chen–Li,
Thm 2.2, p. 42, and §2.1, pp. 41–42; Saptharishi, Thm 7.4, p. 70, with Lemmas 7.2, 7.5, 7.6 and
Claims 7.7, 7.8, pp. 69–72, which leave the rank computation as an exercise; Bürgisser, Thm 2.36,
p. 17, over `ℂ`). The rank computation below and the case of characteristic at least `m` are
proved here.

Route. If `m = 0` there is nothing to prove. If `m = 1`, `det A = X (0, 0)` is not the constant
`1`, so `n ≥ 1` and `1 ≤ 2n`. Let `m ≥ 2`; again `n ≥ 1`, since the permanent is not constant.

(1) The determinant at a singular point. Let `Y` be an `n × n` matrix over `F` with `det Y = 0` and
`H` the Hessian of the determinant of the generic `n × n` matrix at `Y`. Then `rank H ≤ 2n`. Choose
`v ≠ 0` with `Y v = 0`; the matrices `Z` with `Z v = 0` form a subspace `W` of codimension `n`.
For `Z, Z' ∈ W`, `Zᵀ H Z'` (with `Z` read as a vector of entries) is the coefficient of `s t` in
`det (Y + s Z + t Z') ∈ F[s, t]`, which is `0` because this matrix kills `v`. So `H` maps `W` into
the annihilator of `W`, of dimension `n`, and `rank H ≤ dim H(W) + codim W ≤ 2n` (Saptharishi,
Lemma 7.2, p. 69, and Cor. 7.3, p. 70; the argument uses no hypothesis on the characteristic).

(2) Chain rule. Write `A = A₀ + Σ_v X v · A_v` with constant matrices `A₀`, `A_v`. The permanent is
`aeval A` applied to the generic determinant; Tau Ceti's `MvPolynomial.pderiv_aeval`, applied twice
(the second derivatives of the entries of `A` vanish), gives, at any point `x₀` with
`Y = A(x₀)`: Hessian of the permanent at `x₀` equals `Lᵀ H L`, where `L` is the `n² × m²` matrix
with columns the entries of the `A_v`. So the rank of the Hessian of the permanent at `x₀` is at
most `rank H` (`Matrix.rank_mul_le_left`, `Matrix.rank_mul_le_right`), and if
`perm (x₀) = 0` then `det Y = 0` and (1) applies.

(3) A zero of the permanent with invertible Hessian. For `m = 2`, `perm = x₀₀ x₁₁ + x₀₁ x₁₀` has the
constant Hessian with entries `1` at the pairs `{(0,0), (1,1)}` and `{(0,1), (1,0)}`, of rank `4` in
every characteristic; take `x₀ = 0`. For `m ≥ 3`, let `x₀` have all entries `1` except
`x₀(0, 0) = 1 − m`. Expanding along the entry `(0, 0)`,
`perm (x₀) = (1 − m)(m − 1)! + (m! − (m − 1)!) = 0`. The second derivative of the permanent in the
variables `(a, j)` and `(b, l)` is `0` if `a = b` or `j = l` (the permanent has degree one in each
row and each column) and otherwise the permanent of the generic matrix with rows `a, b` and columns
`j, l` deleted. At `x₀` that minor is the all-ones matrix of side `m − 2`, with permanent
`(m − 2)!`, if `0 ∈ {a, b, j, l}`; otherwise it contains the entry `1 − m` and its permanent is
`(1 − m)(m − 3)! + (m − 2)! − (m − 3)! = −2 (m − 3)!`. So the Hessian is `(m − 3)! H'` with
`H' = (m − 2) K ⊗ K − m K' ⊗ K'`, where `K = J − I` (`J` the all-ones `m × m` matrix) and `K'` is
`K` with its row `0` and column `0` set to zero.

(4) The determinant of `H'`. Under the hypothesis on the characteristic, with `m ≥ 3`, the numbers
`2`, `m − 1`, `m − 2` and `(m − 3)!` are nonzero in `F` (a characteristic `p ≥ m` exceeds each of
`m − 1`, `m − 2`, `m − 3` and is odd). `K` is invertible with `K⁻¹ = J/(m − 1) − I` and
`det K = (−1) ^ (m − 1)(m − 1)`. Let `e` be the first unit vector, `w = K e` (ones off index `0`)
and `y = K⁻¹ e`. Then `K' = K − e wᵀ − w eᵀ`, so `T = K⁻¹ K' = I − e eᵀ − y wᵀ` and
`K' ⊗ K' = (K ⊗ K)(T ⊗ T)`. `T` is the identity on the subspace `U` of vectors with first coordinate
`0` and coordinate sum `0` (dimension `m − 2`), `T e = 0` (since `wᵀ e = 0`) and
`T y = ((m − 2)/(m − 1)) e` (since `eᵀ y = (2 − m)/(m − 1)` and `wᵀ y = 1`); `U`, `e`, `y` together
span `F^m`. In a basis of `U` followed by `e`, `y`, `T` is upper triangular with diagonal
`(1, …, 1, 0, 0)`, so `T ⊗ T` is upper triangular, in the lexicographic order of the product basis,
with diagonal entries `1` (`(m − 2)²` times) and `0` (`4m − 4` times). Hence
`det H' = det (K ⊗ K) · det ((m − 2) I − m T ⊗ T)`, which is
`((−1) ^ (m − 1)(m − 1)) ^ (2m) · (−2) ^ ((m − 2)²) · (m − 2) ^ (4m − 4)`
(`Matrix.det_kronecker`, `Matrix.det_mul`), and this is nonzero; so the Hessian of the permanent at
`x₀` has rank `m²`.

(5) By (2), (1) and (3), `m² ≤ rank H ≤ 2n`.

**Checks.**

- For `m ≥ 3` the hypothesis excludes characteristic `2`, and must: over `ZMod 2`, the generic
  `3 × 3` matrix itself satisfies the other hypotheses (its determinant equals its permanent,
  Examples of Layer 3), and `9 > 6`. For `m ≤ 2` characteristic `2` is allowed, and there the
  bound holds (at `m = 2` by the rank `4` of step (3)).
- The degree bound is needed: the `1 × 1` matrix whose entry is the permanent of the generic
  `2 × 2` matrix has that determinant, and `4 > 2`.
- The bound is attained at `m = 2`: `perm₂ = det [[x₀₀, −x₁₀], [x₀₁, x₁₁]]`, `m² = 4 = 2n`.
- At `m = 3` the matrix `H'` has determinant `2⁶ · (−2) · 1 = −128`; for `m = 3, 4, 5` the closed
  form agrees with the exact determinant over `ℚ`, the Hessian has rank `m²`, and its entries are
  `(m − 3)!` times `0`, `m − 2` and `−2` as in (3).
- For `m = 3, 4, 5` and `p ∈ {2, 3, 5, 7, 11}`, the Hessian at `x₀` has rank `m²` modulo `p` exactly
  when `p` divides none of `2`, `m − 1`, `m − 2`, `(m − 3)!`. For `p ≤ m − 3` every entry is a
  multiple of `(m − 3)!` and so vanishes modulo `p` (Cai–Chen–Li, p. 43, remark on the factorials):
  this point gives nothing there.
- The rank of the Hessian of the determinant at `diag(0, 1, …, 1)` is `0, 4, 6, 8` for
  `n = 1, …, 4`, and at a singular matrix with two equal rows it is at most `2n` over `ℚ` and
  modulo `2` and `3` for `n = 2, 3, 4`.

*Needs:* Mathlib `Matrix.permanent`, `Matrix.mvPolynomialX`, `Matrix.det_kronecker`,
`Matrix.det_mul`, `Matrix.rank_mul_le_left`, `Matrix.rank_mul_le_right`, `MvPolynomial.pderiv`,
`MvPolynomial.pderiv_comm`; Tau Ceti `MvPolynomial.pderiv_aeval`.

### Examples

- Combined with 4.2, the permanent of the generic `m × m` matrix has formulas only of size at
  least `m²/2 − 2` in characteristic `0`.

### Dependencies

5.1 uses no other target; 4.2 shows that its hypothesis can be met.

## Scope and ownership

This roadmap owns the circuit model with its size count, the classes VP and VNP as sets of
families, their closure under subset sums and projections, homogenization and the Baur–Strassen
theorem with exact sizes, Ryser's and Glynn's formulas over commutative rings, the membership of
the permanent and Hamiltonian cycle families in VNP, the polynomial-size circuits of the
determinant, the universality of determinants and permanents for formulas, and the lower bound
of Mignon and Ressayre in characteristic `0` and in characteristic at least `m`.

Already in the libraries and used, not restated: the permanent and its basic properties, the generic
matrix, the Leibniz formula for the determinant, homogeneous components, partial derivatives and the
Leibniz rule (Mathlib); the chain rule for partial derivatives under substitution, the shift of
homogeneous components under multiplication by a homogeneous polynomial, and the degree bound for
substitutions (Tau Ceti). Mathlib's first-order terms of the language of rings
(`FirstOrder.Language.ring`) are expression trees over `+`, `×`, `−`, `0`, `1` without constants
from `R` and without a size; a term over variables `V` gives a `Formula V ℤ` with the same value,
and `Formula` is defined here because constants and sizes are needed. Neither pinned library has
circuits or straight-line programs (searched by `circuit`, `straight-line`, `Circuit`, `Gate`,
`FreeCommRing`): the nearest objects are these terms and the elements of `FreeCommRing`, polynomial
expressions without a size, which `FirstOrder.Ring.termOfFreeCommRing` turns into terms; neither
carries constants from `R` or counts shared subexpressions once, as a circuit does. Mathlib has no
Hamiltonian cycle sum of a matrix (its `SimpleGraph.IsHamiltonian` concerns graphs, with no
polynomial), so `hamCycleSum` is defined here beside `Matrix.permanent` and `Matrix.det`. The bounds
by a `Polynomial ℕ` follow Mathlib's `Turing.TM2ComputableInPolyTime`. Mathlib's `Finset.subsetSum`
is a different object, the finite set of the sums of the subsets of a finite set in a commutative
monoid; `subsetSum` here is a sum of substitutions into one polynomial. Tau Ceti's
`Matrix.leibnizPart` (`TauCeti/LinearAlgebra/Matrix/LeibnizPart.lean`) splits the Leibniz expansion
by the sign of the permutation, the permanent being the sum of the two parts and the determinant
their difference; it is not used here.

The paper *VP ≠ VNP over every field* (Claude, Anthropic, 2026) has a public Lean development
(https://github.com/anthropics/formal-math/tree/main/vp-vnp, Apache-2.0) that also defines
circuits, VP, VNP and the Hamiltonian cycle polynomial; no declaration here is taken from it, and
nothing here depends on it. Its circuits are lists of polynomials, which compute the same
polynomials with the same number of gates as the circuits here (1.1); its bounds `n ^ a + a` and
the polynomial bounds here define the same classes once the finite type of variables of each
member is renamed to a `Fin`, variables `Fin m ⊕ Fin r` to `Fin (m + r)`, and sums over Boolean
vectors are read as sums over subsets (`n ^ a + a` is the value of `X ^ a + C a`, and a `p` with
`natDegree p = d` and coefficient sum `m` has `p.eval n ≤ n ^ (d + m) + (d + m)` for every `n`);
its Hamiltonian cycle polynomial sums over the permutations that are a cycle on all indices
(`Equiv.Perm.IsCycleOn`), which gives the same polynomial as `hamCycleSum` of the generic matrix
for `n ≥ 2`, and `1` and `X (0, 0)` instead of `0` for `n = 0, 1`. That development proves
Ryser's formula as a sum over the Boolean cube and the membership of the permanent and of the
Hamiltonian cycle polynomial in VNP over fields; 3.1 and 3.4 here are stated over every
commutative ring.

Not treated here: the VNP-completeness of the permanent and of the Hamiltonian cycle polynomial;
Valiant's criterion relating VNP to Boolean counting; depth reduction (Hyafil; Valiant, Skyum,
Berkowitz and Rackoff) and the balancing of formulas; Strassen's degree bound and the lower bound
of order `n log d` for power sums; elimination of divisions; lower bounds for formulas
(Kalorkoti), for monotone circuits (Jerrum and Snir) and for restricted models through partial
derivatives (Nisan; Nisan and Wigderson); the bound of Cai, Chen and Li in small odd
characteristic; border complexity; tensor rank, matrix multiplication tensors and the exponent of
matrix multiplication. SatisfiabilityComplexity proves the NP-completeness of satisfiability and
lists circuits outside its scope; MatchingTheory lists the counting of perfect matchings by
permanents outside its scope; NonintersectingPathsAndLGV proves the Lindström–Gessel–Viennot
lemma, which, like 4.2, reads a determinant as a signed sum over path systems in a weighted
digraph; ComputabilityTheory treats recursion theory, not complexity classes. This roadmap depends
on none of them.

## Exact supplier contracts

### From Mathlib

- `MvPolynomial`, `MvPolynomial.X`, `MvPolynomial.C`, `MvPolynomial.aeval`,
  `MvPolynomial.rename`, `MvPolynomial.totalDegree` (`Mathlib/Algebra/MvPolynomial/*`);
  `MvPolynomial.aeval_eq_bind₁` (`Mathlib/Algebra/MvPolynomial/Monad.lean`),
  `MvPolynomial.aeval_X_left` (`aeval X` is the identity, `Mathlib/Algebra/MvPolynomial/Eval.lean`),
  `MvPolynomial.aeval_rename` (`Mathlib/Algebra/MvPolynomial/Rename.lean`),
  `MvPolynomial.comp_aeval` (`Mathlib/Algebra/MvPolynomial/Eval.lean`: an algebra map composed
  with `aeval f` is `aeval` of the composite), `MvPolynomial.totalDegree_rename_le`,
  `MvPolynomial.totalDegree_add`, `MvPolynomial.totalDegree_mul`
  (`Mathlib/Algebra/MvPolynomial/Degrees.lean`).
- `MvPolynomial.homogeneousComponent`, `MvPolynomial.IsHomogeneous`,
  `MvPolynomial.sum_homogeneousComponent` (the components up to the total degree add up to the
  polynomial), `MvPolynomial.homogeneousComponent_eq_zero` (components above the total degree
  vanish), `IsHomogeneous.add`, `IsHomogeneous.mul`, `isHomogeneous_X`, `isHomogeneous_C`,
  `isHomogeneous_zero` (`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`).
- `MvPolynomial.pderiv` (a derivation, over a commutative semiring), `MvPolynomial.pderiv_mul`,
  `MvPolynomial.pderiv_X`, `MvPolynomial.pderiv_C`, `MvPolynomial.pderiv_comm`
  (`Mathlib/Algebra/MvPolynomial/PDeriv.lean`).
- `Matrix.permanent` (`Σ_σ ∏_i M (σ i) i`, over a commutative semiring) and
  `Matrix.permanent_transpose` (`Mathlib/LinearAlgebra/Matrix/Permanent.lean`);
  `Matrix.mvPolynomialX`, `Matrix.mvPolynomialX_apply`
  (`Mathlib/LinearAlgebra/Matrix/MvPolynomial.lean`); `Matrix.det_apply`, `Matrix.det_mul`,
  `Matrix.det_transpose` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`);
  `Matrix.det_kronecker` (`det (A ⊗ B) = det A ^ |n| · det B ^ |m|`,
  `Mathlib/LinearAlgebra/Matrix/Kronecker.lean`); `Matrix.rank`, `Matrix.rank_mul_le_left`,
  `Matrix.rank_mul_le_right` (`Mathlib/LinearAlgebra/Matrix/Rank.lean`, over a ring with the strong
  rank condition).
- `Equiv.Perm.cycleType` (the multiset of the lengths of the nontrivial cycles),
  `Equiv.Perm.IsCycle.cycleType`, `Equiv.Perm.card_cycleType_eq_one`, `Equiv.Perm.cycleType_conj`
  (`Mathlib/GroupTheory/Perm/Cycle/Type.lean`); `cycleType_finRotate_of_le` (`finRotate n` has
  cycle type `{n}` for `n ≥ 2`, `Mathlib/GroupTheory/Perm/Fin.lean`); `Equiv.Perm.IsCycleOn`,
  `Equiv.Perm.IsCycle.isCycleOn`, `Equiv.Perm.IsCycleOn.pow_apply_eq`, `Equiv.Perm.IsCycle.sign`
  (`sign` of a cycle is `−(−1) ^ |support|`) (`Mathlib/GroupTheory/Perm/Cycle/Basic.lean`);
  `CharTwo.neg_eq` (`Mathlib/Algebra/CharP/Two.lean`).
- `Finset.prod_univ_sum`, `Fintype.prod_sum` (a product of sums is a sum over choice functions,
  `Mathlib/Algebra/BigOperators/Ring/Finset.lean`), `Finset.sum_powerset_neg_one_pow_card`
  (`Mathlib/Data/Nat/Choose/Sum.lean`: over `ℤ`, the alternating sum over the subsets of `x` is `1`
  if `x` is empty and `0` otherwise), `finProdFinEquiv` (`(i, j) ↦ n i + j` on
  `Fin m × Fin n`, `Mathlib/Logic/Equiv/Fin/Basic.lean`).
- `Fin.append`, `Fin.append_left`, `Fin.append_right`, `Fin.append_right_nil`
  (`Mathlib/Data/Fin/Tuple/Basic.lean`); `finCongr` (`Mathlib/Data/Fin/SuccPred.lean`);
  `Fin.castLT`, `Fin.castAdd`, `Fin.natAdd` (Lean core).
- `Polynomial.eval`, `Polynomial.eval_add`, `Polynomial.eval_comp`
  (`Mathlib/Algebra/Polynomial/Eval/Defs.lean`), `Polynomial.eval_eq_sum_range`
  (`Mathlib/Algebra/Polynomial/Eval/Degree.lean`).
- Compared in the scope section only: `FirstOrder.Language.ring`
  (`Mathlib/ModelTheory/Algebra/Ring/Basic.lean`), `Finset.subsetSum`
  (`Mathlib/Combinatorics/Additive/SubsetSum.lean`), `FreeCommRing`
  (`Mathlib/RingTheory/FreeCommRing.lean`), `FirstOrder.Ring.termOfFreeCommRing`
  (`Mathlib/ModelTheory/Algebra/Ring/FreeCommRing.lean`), `SimpleGraph.IsHamiltonian`
  (`Mathlib/Combinatorics/SimpleGraph/Hamiltonian.lean`), `Turing.TM2ComputableInPolyTime`
  (`Mathlib/Computability/TuringMachine/Computable.lean`).

### From Tau Ceti

- `MvPolynomial.pderiv_aeval` (`TauCeti/Algebra/MvPolynomial/PDeriv.lean`): for a finite type of
  variables `σ`, `pderiv j (aeval f p) = Σ_i aeval f (pderiv i p) · pderiv j (f i)`; used twice in
  5.1.
- `MvPolynomial.IsHomogeneous.homogeneousComponent_mul_right`
  (`TauCeti/RingTheory/MvPolynomial/Homogeneous.lean`): if `t` is homogeneous of degree `d`, the
  degree-`e` component of `a · t` is `homogeneousComponent (e − d) a · t` when `d ≤ e` and `0`
  otherwise; used in 2.1.
- `MvPolynomial.totalDegree_bind₁_le` (`TauCeti/Algebra/MvPolynomial/Monad.lean`): substituting
  polynomials of degree at most `D` multiplies the degree by at most `D`; used with `D = 1` in 1.2.

## References

- P. Bürgisser, *Completeness classes in algebraic complexity theory*, arXiv:2406.06217v1 (2024)
  (printed page numbers). Used: Def. 2.1, p. 4; Ex. 2.1, p. 5; Def. 2.9, p. 6; Defs. 2.15–2.16,
  p. 8; Prop. 2.17, p. 9; Prop. 2.23, pp. 10–11; (2.3) and Def. 2.25, p. 12; §2.8, pp. 15–16;
  Thm 2.36, p. 17; §3.1, p. 17.
- R. Saptharishi, *A survey of lower bounds in arithmetic circuit complexity*, version 9.0.3,
  https://github.com/dasarpmar/lowerbounds-survey (printed page numbers). Used: Def. 3.1, p. 25;
  Def. 3.2, p. 27; Cor. 3.4, p. 28; Def. 3.8 and Lemma 3.9, p. 32; Thm 3.10 and the proof of
  Lemma 3.9, pp. 33–34; Lemma 5.2, p. 40; Lemma 6.3, p. 60, and §6.1.2, p. 61; Lemma 7.2, p. 69;
  Cor. 7.3, Thm 7.4, Lemmas 7.5–7.6, p. 70; Claims 7.7–7.8, pp. 71–72.
- A. Shpilka and A. Yehudayoff, *Arithmetic circuits: a survey of recent results and open
  questions*, Foundations and Trends in Theoretical Computer Science 5 (2010), authors' PDF
  (printed page numbers). Used: Fact 1.1, p. 4; Thm 1.4, p. 5; Thm 2.2, p. 13; Thm 2.5, p. 15.
- J.-Y. Cai, X. Chen and D. Li, *Quadratic lower bound for permanent vs. determinant in any
  characteristic*, Computational Complexity 19 (2010), 37–56; authors' PDF
  https://pages.cs.wisc.edu/~jyc/papers/per-det.pdf. Used: §2.1, pp. 41–42; Thm 2.2, p. 42; p. 43.
- U. Chabaud, A. Deshpande and S. Mehraban, *Quantum-inspired permanent identities*,
  arXiv:2208.00327v3 (2022). Used: §5.1, eqs. (33)–(34), p. 9.
- Attributed in prose without locators (no legal copy was opened): H. J. Ryser's book
  *Combinatorial Mathematics* for 3.1; D. G. Glynn's paper on the permanent of a square matrix for
  3.2; W. Baur and V. Strassen's paper on the complexity of partial derivatives for 2.2;
  L. G. Valiant's papers on completeness classes in algebra for VP, VNP and 4.2; M. Mahajan and
  V. Vinay's paper on the determinant for 4.1; T. Mignon and N. Ressayre's paper on the
  determinant and permanent problem for 5.1.
