# Roadmap: Runge–Kutta order theory and B-series

**Summary.** This roadmap builds the algebraic and analytic theory of the order of Runge–Kutta
methods for ordinary differential equations `y' = f(t, y)`. Its objects are unordered rooted
trees with their order, density `γ` and symmetry `σ`; the elementary differentials `F(t)` of a
vector field; the elementary weights `Φ(t)` of a Butcher tableau; B-series
`a(∅) y + ∑ h^|t| a(t) F(t)(y) / σ(t)` and their composition product, the Butcher group. Its
headline theorems are:

- Butcher's theorem: a Runge–Kutta method, explicit or implicit, has order `p` (along the branch
  of stage values through `h = 0`, for every smooth system of any dimension) if and only if
  `Φ(t) = 1/γ(t)` for every rooted tree with at most `p` vertices; the exact flow and one step of
  the method are the B-series with coefficients `1/γ` and `Φ`;
- the counting of rooted trees (`1, 1, 2, 4, 9, 20, 48, 115, 286, 719` of orders one to ten) by
  Cayley's generating function, and the counts `(n − 1)!` and `n^(n−1)` of monotonically and fully
  labelled trees;
- Butcher's simplifying assumptions `B(p)`, `C(η)`, `D(ζ)` with `p ≤ η + ζ + 1`, `p ≤ 2η + 2`;
  the Butcher barriers: an explicit method of order `p ≥ 5` has at least `p + 1` stages, of order
  `p ≥ 7` at least `p + 2`, of order `p ≥ 8` at least `p + 3`, and these numbers are attained
  through order eight;
- collocation methods: existence and uniqueness of the collocation polynomial, its equivalence
  with a Runge–Kutta method, the characterization by `C(s)`, the order `s + r` under
  orthogonality of the node polynomial, the orders `2s`, `2s − 1`, `2s − 2` of the Gauss,
  Radau IIA and Lobatto IIIA methods, and the bound `p ≤ 2s` with equality only for Gauss;
- the composition law `B(b, B(a, y)) = B(ab, y)`, the composition of tableaux, and the Butcher
  group (associative, with unit and inverses, and not commutative);
- Gragg's asymptotic expansion of the global error of a one-step method, with only even powers
  for symmetric methods, and the order `p + k − 1` of the extrapolated values;
- uniform convergence of variable-step Euler polygons in a Lipschitz rectangle.

The roadmap builds on [OneStepMethodsForODEs](../OneStepMethodsForODEs/README.md), whose
Butcher tableaux, stage equations, one-step sequences and order-four theory it takes over
unchanged and extends to all orders. It feeds the
stiff-stability and geometric-integration theory, which uses B-series, collocation methods and
simplifying assumptions, and the adaptive and extrapolation codes that rest on the error
expansion. Gauss quadrature as such belongs to
[SpecialFunctionsOrthogonalPolynomialsGeneral](../SpecialFunctionsOrthogonalPolynomialsGeneral/README.md)
(Layer 5); the quadrature facts used here are proved from the tableaux. Embedded pairs and
step-size control belong to
[AdaptiveTimeSteppingForODEs](../AdaptiveTimeSteppingForODEs/README.md), which works with the
same tableaux; nothing passes between the two. The material is a
synthesis of Hairer–Nørsett–Wanner, Hairer–Lubich–Wanner, Butcher's two books and
Hairer–Wanner (see [References](#references)). Headlines that restate a source result cite a
theorem, definition, section or equation number with its printed page; corollaries and
adaptations carry a proof route.

`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it, and the definitions they need; it is not an exhaustive acceptance test, and
the bullets without a Lean name are targets of the same standing, stated in prose.

Suggested home: `TauCeti/Analysis/ODE/RungeKutta/` for Layers 1 and 3–8 and
`TauCeti/Combinatorics/ButcherTree/` for Layer 2.

## How to read the build

Layer 1 is independent of the rest: the Euler polygons of Cauchy's existence proof, on a mesh with
variable steps, in a rectangle where `f` is bounded and Lipschitz. Layer 2 is combinatorics of
rooted trees and uses no analysis. Layer 3 brings in the analysis: elementary differentials,
B-series, the Taylor expansion of the exact flow, the smooth branch of stage values, and the
B-series of one Runge–Kutta step. Layer 4 compares the two B-series of Layer 3 and proves
Butcher's order theorem, with its consequences for the order notion of OneStepMethodsForODEs.
Layers 5 and 6 are about the tree conditions of Layer 4: Layer 5 reduces them by simplifying
assumptions and proves the stage barriers for explicit methods; Layer 6 builds the collocation
methods and computes their orders through Layer 5. Layer 7 is the algebra of B-series under
composition and uses Layers 2 and 3. Layer 8 is about general one-step methods and uses only
Layer 1 of OneStepMethodsForODEs and the Taylor expansion in `h`; it is placed last because the
extrapolated methods are the main consumers of high-order tableaux.

Each numbered target lists its *Needs* and, where useful, **Checks**: sanity tests that a wrong
convention or a dropped hypothesis would fail.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.RungeKuttaOrderTheoryAndBSeries`.
- **Fields and solutions.** As in OneStepMethodsForODEs (Conventions): a field is
  `f : ℝ → E → E`, time first, on a real normed space `E`; an autonomous field is `f : E → E`. A
  solution on `[a, b]` is `IsIntegralCurveOn y f (Set.Icc a b)`; a solution near `t₀` is
  `∀ᶠ t in 𝓝 t₀, HasDerivAt y (f t (y t)) t`. Completeness of `E` is assumed exactly where an
  equation is solved (1.2, 3.4, 6.2, Layer 8).
- **Tableaux and one-step carriers.** `ButcherTableau s` with fields `A`, `b`, `c`, and
  `ButcherTableau.IsExplicit`, `ButcherTableau.IsStage` (the stage equations for the slopes
  `k i`), `ButcherTableau.stages`, `ButcherTableau.increment`, `meshNode`, `oneStepSeq`,
  `oneStepDefect`, `ButcherTableau.OrderConditions` and `ButcherTableau.HasOrder` are those of
  OneStepMethodsForODEs §§1.1, 1.2, 2.1, 4.1, 4.2, unchanged; `Suggested.lean` carries them as
  local copies. The row-sum condition `c = A 𝟙` is a hypothesis exactly where it is used.
- **Trees.** `OrderedTree` is the inductive type of finite trees whose children are ordered
  (`OrderedTree.node m ch` with `ch : Fin m → OrderedTree`), HLW's ordered trees ((1.30), p. 60).
  `OrderedTree.Swap` reorders the children of one vertex. A rooted tree is an element of
  `ButcherTree`, the quotient `Quot OrderedTree.Swap`, with `ButcherTree.mk`. Every function on
  `ButcherTree` is defined as the corresponding function of the representative `ButcherTree.out`
  (Mathlib's `Quot.out`), and a theorem `*_mk` says that every representative gives the same
  value; no definition needs that theorem. The name `ButcherTree` keeps apart Mathlib's
  `_root_.RootedTree`, a single order-theoretic tree on a type; 2.1 identifies `ButcherTree` with
  its finite isomorphism classes. The empty tree `∅` is written `none` in `Option ButcherTree`.
- **Tree functions.** The order `|t|` is the number of vertices; the density `γ` satisfies
  `γ([t₁, …, t_m]) = |t| γ(t₁) ⋯ γ(t_m)`; the symmetry `σ` satisfies
  `σ([t₁, …, t_m]) = σ(t₁) ⋯ σ(t_m) μ₁! μ₂! ⋯` with `μ` the multiplicities of equal subtrees
  (Butcher 2016, Theorem 304A, p. 154; HLW, Definition III.1.7, p. 57); the ordered weight is the
  product over the vertices of the factorial of the number of children. The stage weights are
  `Φ_j([t₁, …, t_m]) = ∏_k ∑_l a_jl Φ_l(t_k)`, with `Φ_j(•) = 1`, and `Φ(t) = ∑_j b_j Φ_j(t)`
  (HNW, Definition II.2.9, p. 151; HLW, (1.13)–(1.16), p. 55). They use `A 𝟙`, never `c`.
- **B-series normalization.** `B(a, y) = a(∅) y + ∑_t h^|t| a(t) F(t)(y) / σ(t)` (HLW,
  Definition III.1.8, p. 57, after Butcher and Sanz-Serna). The exact flow has `a = 1/γ` and a
  Runge–Kutta step has `a = Φ`. HNW (Definition II.12.1, p. 266) sums over labelled trees with
  coefficient `a(t)/|t|!`; its coefficients are `γ(t)` times these, through
  `α(t) = |t|!/(σ(t) γ(t))` (HLW, (1.27), p. 58). Statements are truncated at an order `N`, with
  an error `O(h^(N+1))` as `h → 0`, for fields of class `C^N`; no formal power series of vector
  fields is introduced.
- **Order.** `ButcherTableau.HasAutonomousOrder p`: for every `d`, every smooth `f` on `ℝ^d`
  (`EuclideanSpace ℝ (Fin d)`), every solution `u` near `0` and every stage branch `k` that is
  continuous at `h = 0` and solves the stage equations for `h` near `0`, the local error
  `u(h) − u(0) − h ∑ b_i k_i(h)` is `O(h^(p+1))`. `ButcherTableau.HasLocalOrder p` is the same for
  non-autonomous fields at every initial time. The dimension is arbitrary, since scalar
  equations need fewer conditions. For a scalar autonomous `f`, the trees `[[•],•]` and `[[•,•]]`
  of order four have the same elementary differential `f''·(f'f)·f`, so their two conditions
  merge into one, `(Φ − 1/γ)([[•],•]) + (Φ − 1/γ)([[•,•]])/2 = 0`. For a scalar non-autonomous
  `y' = f(x, y)` the count drops from order five on (HNW, Exercise II.2.3, p. 154). The branch
  formulation avoids the junk value of `ButcherTableau.stages` for implicit tableaux; 3.4 proves
  that the branch exists and is unique, and for explicit tableaux it is the stage vector itself.
  OneStepMethodsForODEs' `ButcherTableau.HasOrder` (uniform on intervals) is related to these in
  4.4.
- **Tree conditions.** `ButcherTableau.TreeConditions p` is `Φ(t) = 1/γ(t)` for every rooted tree
  with `|t| ≤ p` (`p = 0` imposes nothing). It differs from OneStepMethodsForODEs'
  `ButcherTableau.OrderConditions`, which is written with `c` and stops at order four.
- **Simplifying assumptions.** Indexed from zero to avoid subtraction on `ℕ`:
  `B(p)`: `∑ b_i c_i^q = 1/(q+1)` for `q < p`; `C(η)`: `∑_j a_ij c_j^q = c_i^(q+1)/(q+1)` for all
  `i` and `q < η`; `D(ζ)`: `∑_i b_i c_i^q a_ij = b_j (1 − c_j^(q+1))/(q+1)` for all `j` and
  `q < ζ`.
- **Collocation nodes.** Nodes are an injective `c : Fin s → ℝ`. The Gauss node polynomial is
  Mathlib's `Polynomial.shiftedLegendre` (over `ℤ`, mapped to `ℝ`), of degree `s` on `[0, 1]`;
  the Radau IIA and Lobatto IIIA node polynomials are `D^(s−1)(X^(s−1)(X − 1)^s)` and
  `D^(s−2)(X^(s−1)(X − 1)^(s−1))` (HW, (IV.5.2)–(IV.5.3), p. 72). A method "of nodes `P`" is the
  collocation tableau of an injective enumeration of `s` roots of `P`.
- **Euler polygons.** A mesh is OneStepMethodsForODEs' `(t₀, h)`; the Euler values are
  `oneStepSeq` of the increment `(t, y, h) ↦ f t y`, and the polygon interpolates them linearly.
  The rectangle is `D = [t₀, t₀ + a] × closedBall y₀ b` with `‖f‖ ≤ A` on `D`, `0 ≤ A` and
  `A a ≤ b`, as in HNW (Lemma I.7.1, p. 36), which writes `X − x₀ ≤ b/A`; no quotient `b/A` occurs.

## Layer 1: Euler polygons in a Lipschitz rectangle

OneStepMethodsForODEs §3.1 proves that Euler polygons converge to a given solution of a globally
Lipschitz field. This layer treats the local rectangle and produces the solution as the limit.

### 1.1 Euler polygons stay in the rectangle

- `eulerPolygon f t₀ h y₀ N t = y₀ + ∑_{k<N} min(max(t − t_k, 0), h_k) • f(t_k, Y_k)`: on
  `[t_k, t_(k+1)]` it is Y_k + (t − t_k) • f(t_k, Y_k) (HNW, (7.3a), p. 36).
- **Lemma** (`eulerPolygon_mem_closedBall`). Let `0 ≤ A`, `A a ≤ b` and `‖f(t, u)‖ ≤ A` on
  `D = [t₀, t₀ + a] × closedBall y₀ b`. On every mesh with nonnegative steps and last node at
  most `t₀ + a`, the Euler values stay in `closedBall y₀ b` and `‖y_h(t) − y₀‖ ≤ A (t − t₀)` on
  `[t₀, t_N]` (HNW, Lemma I.7.1, p. 36). No continuity is needed.

**Checks.**

- `E = ℝ`, `f = A` constant: `y_h(t) = y₀ + A (t − t₀)`, and the bound is an equality.
- `A a ≤ b` is needed: `f = 1`, `A = 1`, `a = 2`, `b = 1` and the mesh with one step `2` give
  Y_1 = y₀ + 2 ∉ closedBall y₀ 1.
- `0 ≤ A` is needed: for `A = −1`, `a = 1`, `b = −1` the ball is empty, the bound on `f` holds
  vacuously and `A a ≤ b`, but Y_0 = y₀ is not in the ball.

*Needs:* OneStepMethodsForODEs §§1.1–1.2.

### 1.2 Uniform convergence

- **Theorem** (`exists_eulerPolygon_uniform_limit`). Let `E` be complete, `0 ≤ A`, `A a ≤ b`,
  `f` jointly continuous on `D`, bounded by `A` on `D` and `L`-Lipschitz in `y` on
  `closedBall y₀ b` for each `t ∈ [t₀, t₀ + a]`. Then there is a solution `y` on `[t₀, t₀ + a]`
  with `y(t₀) = y₀` and graph in `D`, and for every `ε > 0` there is `δ > 0` such that every
  Euler polygon on a mesh of `[t₀, t₀ + a]` with steps in `[0, δ]` is uniformly within `ε` of `y`
  (HNW, Theorem I.7.3, p. 37). Existence and uniqueness of the solution are also Mathlib's
  (`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`, `ODE_solution_unique_of_mem_Icc`);
  the target is the convergence. Route: take `y` from Picard–Lindelöf; `s ↦ f(s, y(s))` is
  uniformly continuous on `[t₀, t₀ + a]` with a modulus `ω`, so the local defects of `y` on a
  step h_k ≤ δ are at most h_k ω(δ). Replace `f t` by its composition with the radial retraction
  onto `closedBall y₀ b`, which is `2`-Lipschitz on a normed space; by 1.1 this does not change
  the Euler values, and the modified field is `2L`-Lipschitz on `E`. The discrete stability of
  OneStepMethodsForODEs §1.3 then bounds the error at the nodes by
  `gronwallBound 0 (2L) (ω(δ)) (t − t₀)`; between nodes the polygon and `y` move by at most
  `A δ`. This replaces HNW's refinement argument, (7.11)–(7.13), p. 38, which uses uniform
  continuity of `f` on `D` and so needs `E` finite-dimensional.

**Checks.**

- `E = ℝ`, `f(t, u) = u`, `y₀ = 1`, `t₀ = 0`, `a = 1/2`, `b = 1`, `A = 2` (`|u| ≤ 2` on the ball,
  `A a = 1 ≤ b`): on the uniform mesh with `n` steps the polygon at `1/2` is
  `(1 + 1/(2n))^n → e^(1/2)` (`1.62889`, `1.64667`, `1.64852` for `n = 10, 100, 1000`;
  `e^(1/2) = 1.64872`).
- The steps must tend to `0` uniformly: meshes of `[0, 1/2]` whose first step is `1/4` for every
  `n` do not converge to `e^t` at `t = 1/4` (`5/4 ≠ e^(1/4)`).

*Needs:* 1.1; OneStepMethodsForODEs §1.3; Mathlib `IsIntegralCurveOn`, `gronwallBound`.

## Layer 2: rooted trees

### 2.1 Trees, order, density, symmetry

- `OrderedTree`, `OrderedTree.order`, `OrderedTree.density`, `OrderedTree.orderedWeight`,
  `OrderedTree.symmetry`, `OrderedTree.Swap`, `ButcherTree`, `ButcherTree.mk`, `ButcherTree.out` and
  `ButcherTree.order`, `ButcherTree.density`, `ButcherTree.symmetry`,
  `ButcherTree.orderedWeight` as in the Conventions. The recursive definition of trees as
  `[t₁, …, t_m]` is HNW, Definition II.2.12, p. 152, and HLW, Definition III.1.1, p. 53; trees
  as equivalence classes of labelled trees are HNW, Definitions II.2.4–2.5, p. 147.
- **Invariance** (`ButcherTree.invariants_mk`): order, density, symmetry and ordered weight of
  `mk τ` are those of `τ`. Route: induction on the equivalence generated by `OrderedTree.Swap`;
  sums and products over `Fin m` are invariant under permutations.
- **Comparison with Mathlib** (`exists_equiv_finiteRootedTree`): there is a bijection between
  `ButcherTree` and the order-isomorphism classes of finite Mathlib rooted trees
  (`finiteRootedTreeSetoid`), under which the order is the number of elements, and which is the
  canonical one: the class of `[t₁, …, t_m]` is that of a tree whose root has `m` immediate
  subtrees (`RootedTree.subtrees`, the up-sets of the covers of the root), the `i`-th in the
  class of `tᵢ`. The second conjunct and bijectivity determine the map by induction on the
  order. Route: the children of the root are the trees above its covers.
- Basic API: `order ≥ 1`; `density` divides `order !`; `[t₁, …, t_m]` as a function of the
  multiset of the `mk tᵢ`; the only tree of order one is `•`; the order of `[t₁, …, t_m]` is
  `1 + ∑ |tᵢ|` (Butcher 2016, (304a), p. 154).

**Checks.**

- The tree with nine vertices `[[•,•,•],[•,•,•]]`: `σ = 3! 3! 2! = 72` and `γ = 9 · 4 · 4 = 144`.
  Taking `σ` as `∏ σ(tᵢ)` without the multiplicities would give `36`.
- `[•, [•]]` and `[[•], •]` are `Swap`-related and have `σ = 1`, `γ = 8`; `[•, •]` has `σ = 2`,
  `γ = 3`; the tall tree of order `n` has `σ = 1`, `γ = n!`.
- HLW's tree of order nine `[[•], •, [[•,•], •]]` has `γ = 9 · 2 · 5 · 3 = 270` (HLW,
  Example III.1.6, p. 56).

*Needs:* Mathlib `Quot.out`, `_root_.RootedTree`.

### 2.2 Orderings and symmetry

- `ButcherTree.orderingCount t`, the number of ordered representatives of `t`.
- **Theorem** (`ButcherTree.symmetry_mul_orderingCount`): `σ(t) ν(t)` is the ordered weight,
  `ν` the number of orderings (HLW, (1.31)–(1.32), p. 60). This converts sums over ordered trees
  with weight `1/∏(children)!` into sums over rooted trees with weight `1/σ`.

**Checks.**

- `[•, [•]]`: two orderings, `σ = 1`, ordered weight `2! = 2`. `[•, •]`: one ordering, `σ = 2`,
  ordered weight `2`. `[•, •, [•]]`: three orderings, `σ = 2`, ordered weight `3! = 6`.

*Needs:* 2.1.

### 2.3 Counting

- `ButcherTree.treeCount n`, the number `θ_n` of trees of order `n`.
- **Theorem** (`ButcherTree.treeCount_values`): trees of each order are finite in number;
  `θ_1, …, θ_10 = 1, 1, 2, 4, 9, 20, 48, 115, 286, 719` and the numbers of trees of order at most
  `1, …, 10` are `1, 2, 4, 8, 17, 37, 85, 200, 486, 1205` (HNW, Table II.2.1, p. 147, and
  Table II.2.3, p. 154; Butcher 2016, Table 305(I), p. 156).
- **Theorem** (`ButcherTree.trunc_treeCount_generatingFunction`):
  `∑ θ_n x^(n−1) = ∏_n (1 − x^n)^(−θ_n)` modulo `x^N` for every `N`, in `PowerSeries ℚ` with
  `PowerSeries.trunc` (Butcher 2016, Theorem 303B, p. 152; HNW, Exercise II.2.2, p. 154).
  Route: a tree is a root with a multiset of trees.

**Checks.**

- Multiplying out the product modulo `x^10` with the stated `θ` returns
  `1, 1, 2, 4, 9, 20, 48, 115, 286, 719`.
- The numbers of ordered trees, `1, 1, 2, 5, 14, …` (Catalan), differ from `θ_n` from order four
  on: a count over `OrderedTree` would be wrong.

*Needs:* 2.1; Mathlib `PowerSeries`.

### 2.4 Labellings

- **Theorem** (`ButcherTree.symmetry_mul_density_dvd_factorial`): `σ(t) γ(t)` divides `|t|!`.
  The quotient `α(t)` is the number of monotone labellings (Butcher 2016, Theorem 305A, p. 155;
  HNW, Definition II.2.5, p. 147; HLW, (1.27), p. 58).
- **Theorem** (`ButcherTree.sum_factorial_div_symmetry`): for `n ≥ 1`,
  `∑_{|t|=n} n!/(σ(t) γ(t)) = (n − 1)!` and `∑_{|t|=n} n!/σ(t) = n^(n−1)` (Butcher 2016,
  Theorem 305B, p. 156).

**Checks.**

- `n = 4`: `α = 1, 3, 1, 1` for `[•,•,•]`, `[[•],•]`, `[[•,•]]`, `[[[•]]]`, summing to `6 = 3!`
  (HLW, Table III.1.1, p. 53); `n!/σ = 4, 24, 12, 24`, summing to `64 = 4³`.
- `n = 1, …, 8`: the two sums are `(n − 1)!` and `n^(n−1)`.

*Needs:* 2.1, 2.3.

## Layer 3: elementary differentials and B-series

### 3.1 Elementary differentials

- `OrderedTree.differential f y`: `F(•)(y) = f(y)`,
  `F([t₁, …, t_m])(y) = f^(m)(y)(F(t₁)(y), …, F(t_m)(y))`, with Mathlib's `iteratedFDeriv`
  (HLW, Definition III.1.2, p. 53; Butcher 2016, Definition 310A, p. 164).
  `ButcherTree.differential f t y` evaluates the representative.
- **Invariance** (`ButcherTree.differential_mk`): for `f` of class `C^(|τ|−1)`, the elementary
  differential of `mk τ` is that of `τ`. Route: symmetry of `iteratedFDeriv ℝ m f y` for `f` of
  class `C^m`; Mathlib has it for analytic functions (`ContDiffAt.iteratedFDeriv_comp_perm`)
  and for second derivatives (`ContDiffAt.isSymmSndFDerivAt`), and the `C^m` case follows from
  the second by induction; it is part of this target.

**Checks.**

- `E = ℝ`, `f(y) = y²`: `F([•])(y) = f'(y) f(y) = 2y³`, `F([•,•])(y) = f''(y)(f, f) = 2y⁴`.
- For a linear `f(y) = M y`, `F(t) = 0` unless `t` is tall, and `F(tall_n)(y) = M^n y`.

*Needs:* 2.1; Mathlib `iteratedFDeriv`.

### 3.2 B-series and the exact flow

- `bSeries a f N h y = a(∅) y + ∑_{1 ≤ |t| ≤ N} (h^|t| a(t)/σ(t)) F(t)(y)`, with Mathlib's
  `finsum` over the finite set of trees of each order; `exactCoeff` is `e(∅) = 1`,
  `e(t) = 1/γ(t)`.
- **Theorem** (`isBigO_sub_bSeries_exactCoeff`): for `f` of class `C^N` and a solution `u` near
  `0`, `u(h) − B_N(e, u(0)) = O(h^(N+1))` (HNW, Theorem II.2.6, p. 148; HLW, Theorem III.1.3,
  p. 53, and (1.26)–(1.27), p. 58). Route: `u^(q)(0) = ∑_{|t|=q} α(t) F(t)(u(0))` by induction on
  `q`, Taylor's formula with `taylor_mean_remainder_bound`, and 2.4.

**Checks.**

- `f(y) = y` on `ℝ`: `F(t) = 0` except for tall trees, `F = y`, and the B-series is
  `∑ h^n/n! y` (`σ = 1`, `γ = n!`).
- `f(y) = y²`, `u(t) = 1/(1 − t)`, `u(0) = 1`: through order three the B-series is
  `1 + h + h² + h³`, from `F(•) = 1`, `F([•]) = 2` with `γ = 2`, and `F([•,•]) = 2` with
  `σγ = 6`, `F([[•]]) = 4` with `σγ = 6`.

*Needs:* 2.1–2.4, 3.1.

### 3.3 Elementary weights

- `OrderedTree.stageWeight`, `OrderedTree.weight`, `ButcherTree.weight` as in the Conventions, and
  `ButcherTableau.rkCoeff T` (`1` at `∅`, `Φ` on trees).
- **Invariance** (`ButcherTree.weight_mk`): stage weights and weights do not depend on the
  representative.

**Checks.**

- Explicit Euler: `Φ(•) = 1`, `Φ(t) = 0` for `|t| ≥ 2`. Implicit Euler (`A = (1)`, `b = (1)`):
  `Φ(t) = 1` for every `t`. Implicit midpoint: `Φ(t) = 2^(1−|t|)`.
- OneStepMethodsForODEs' `rk4` (§4.4): `Φ([[•]]) = 1/6`, `Φ([[[•]]]) = 1/24`.

*Needs:* 2.1.

### 3.4 The stage branch and the B-series of a step

- **Theorem** (`ButcherTableau.exists_stageBranch`). Let `E` be complete, `r ≥ 1` and
  `Function.uncurry f` of class `C^r`. For every `t`, `y` there are `δ > 0` and a `C^r` map
  `k` on `(−δ, δ)` solving the stage equations there, and every stage branch that is continuous
  at `0` and solves them near `0` agrees with `k` near `0` (HNW, Theorem II.7.2, p. 206, for the
  contraction form with the derivatives in `h`). Route: Mathlib's `ContDiffAt.implicitFunction`
  for `K − F(h, K) = 0` at `(0, (f(t, y))_i)`, where the derivative in `K` is the identity;
  uniqueness from the local uniqueness of the implicit function, since a branch continuous at `0`
  takes the value `(f(t, y))_i` there.
- **Theorem** (`ButcherTableau.isBigO_step_sub_bSeries`): for `f : E → E` of class `C^N` and a
  stage branch continuous at `0`, `y + h ∑ b_i k_i(h) − B_N(Φ, y) = O(h^(N+1))` (HLW,
  Theorem III.1.4, p. 55; HNW, Theorem II.2.11, p. 151; Butcher 2016, Theorem 313B, p. 173).
  Route: the stage values are B-series by HLW, Lemma III.1.9, p. 57, applied order by order.

**Checks.**

- `T` implicit Euler, `f(y) = λ y`: the branch is `k(h) = λ y/(1 − hλ)` for `|hλ| < 1`, the step
  is `y/(1 − hλ) = ∑ (hλ)^n y`, the B-series with `Φ = 1` on tall trees.
- Uniqueness needs continuity at `0`: for implicit Euler on `f(y) = y²` at `y = 1` the stage
  equation `k = (1 + hk)²` has, for `0 < h < 1/4`, the two roots
  `k = (1 − 2h ± √(1 − 4h))/(2h²)`; only the minus sign stays bounded as `h → 0` (at `h = 0.01`
  the roots are `1.0205` and `9798.98`).

*Needs:* 3.1–3.3; OneStepMethodsForODEs §§2.1, 2.3; Mathlib `ContDiffAt.implicitFunction`.

## Layer 4: the order conditions

### 4.1 Definitions

- `ButcherTableau.TreeConditions`, `ButcherTableau.HasAutonomousOrder`,
  `ButcherTableau.HasLocalOrder` as in the Conventions. Basic API: all three are antitone in
  `p`; they hold for `p = 0`; `TreeConditions` depends on `A` and `b` only.

### 4.2 Butcher's theorem

- **Theorem** (`ButcherTableau.hasAutonomousOrder_iff_treeWeight`): `HasAutonomousOrder p` iff
  `TreeConditions p`, for every tableau (HNW, Theorem II.2.13, p. 153, extended to implicit
  methods at the start of Section II.7, p. 207; HLW, Theorem III.1.5, p. 56; Butcher 2016,
  Theorem 315A, p. 175; Butcher 2021, Theorem 3.6C, p. 127). Route: sufficiency by comparing 3.2
  with 3.4; necessity by the independence of the elementary differentials: for each tree `t`
  with `|t| ≤ p` a polynomial field on `ℝ^|t|` whose only nonzero elementary differential of
  order `|t|` is `F(t)` (HNW, Exercise II.2.4, p. 155; Butcher 2016, Theorem 314A, p. 174).

### 4.3 Non-autonomous problems

- **Theorem** (`ButcherTableau.hasLocalOrder_iff_hasAutonomousOrder`): under `c = A 𝟙`, local
  order and autonomous order coincide. Route: append `t' = 1`; the method applied to the
  augmented autonomous system reproduces the non-autonomous step exactly when `c = A 𝟙` (HLW,
  Section III.1.1, p. 51; HNW, Section II.1, (1.9), p. 134).

**Checks.**

- `c = A 𝟙` is needed: `A = (0, 0; 1, 0)`, `b = (1/2, 1/2)`, `c = (0, 1/2)` satisfies
  `TreeConditions 2` (it is Heun's tableau with a wrong `c`), but not `HasLocalOrder 2`: on
  `f(t, u) = t` from `(0, 0)` the step is `h²/4` and the solution is `h²/2`.
- `TreeConditions` uses `A 𝟙`, not `c`: the tableau `A = (0, 0; 1/2, 0)`, `b = (1/2, 1/2)`,
  `c = (0, 1)` of OneStepMethodsForODEs §4.2 satisfies `OrderConditions 2` but not
  `TreeConditions 2` (`Φ([•]) = 1/4`).

### 4.4 Comparison with OneStepMethodsForODEs

- **Theorem** (`ButcherTableau.hasOrder_iff_treeConditions_of_isExplicit`): for explicit
  tableaux with `c = A 𝟙`, OneStepMethodsForODEs' uniform `ButcherTableau.HasOrder p` is
  equivalent to `TreeConditions p`, for every `p`. This extends OneStepMethodsForODEs §4.3,
  which owns `p ≤ 4`. Route: 4.2, 4.3 and compactness of `[a, b]` for the uniform constant.
- **Theorem** (`ButcherTableau.treeConditions_iff_orderConditions`): for `c = A 𝟙` and `p ≤ 4`
  the tree conditions are the eight conditions of OneStepMethodsForODEs §4.1. (Proved here.)
- **Theorem** (`ButcherTableau.quadrature_of_treeConditions`): under `c = A 𝟙`, the bushy trees
  give `B(p)` and the tall trees give `bᵀ A^(k−1) 𝟙 = 1/k!` for `1 ≤ k ≤ p` (HNW, Section II.7,
  p. 208, for the bushy trees; Butcher 2016, proof of Theorem 324A, p. 200, for the tall trees).

**Checks.**

- `p = 5` is beyond OneStepMethodsForODEs: its `OrderConditions 5` is `OrderConditions 4`, which
  `rk4` satisfies, while `rk4` fails `TreeConditions 5` (`Φ([•,•,•,•]) = 5/24 ≠ 1/5`).
- The count of conditions up to order `p` is the cumulative count of 2.3.

*Needs:* 2.1–2.3, 3.2–3.4; OneStepMethodsForODEs §§4.1–4.3.

## Layer 5: simplifying assumptions and the Butcher barriers

### 5.1 Simplifying assumptions

- `ButcherTableau.SimplifyingB`, `ButcherTableau.SimplifyingC`, `ButcherTableau.SimplifyingD`
  as in the Conventions (HNW, (7.11), p. 208; Butcher 2016, Subsection 321, p. 186).
- **Theorem** (`ButcherTableau.hasAutonomousOrder_of_simplifying`): if `B(p)`, `C(η)` and `D(ζ)`
  hold with `p ≤ η + ζ + 1` and `p ≤ 2η + 2`, then `TreeConditions p` and
  `HasAutonomousOrder p` (HNW, Theorem II.7.4, p. 208, Butcher 1964; HW, Theorem IV.5.1, p. 71).
  No row-sum hypothesis is needed: `C(1)` is `c = A 𝟙`, and for `η = 0` the only conditions
  are those of order at most two, which `B(2)` and `D(1)` give.

**Checks.**

- Radau IIA with two stages (`A = (5/12, −1/12; 3/4, 1/4)`, `b = (3/4, 1/4)`, `c = (1/3, 1)`)
  satisfies `B(3)`, `C(2)`, `D(1)` and not `D(2)`; the theorem gives order `3`, which is exact.
- `rk4` satisfies `B(4)`, `C(1)`, `D(1)` and not `C(2)`; the theorem gives only order `3`.

*Needs:* 4.2.

### 5.2 The Butcher barriers

- **Theorem** (`ButcherTableau.add_one_le_of_treeConditions`): an explicit tableau with
  `TreeConditions p`, `p ≥ 5`, has `s ≥ p + 1` (HNW, Theorem II.5.1, p. 173; Butcher 2016,
  Theorem 324B, p. 201; Butcher 2021, Theorem 5.5A, p. 200).
- **Theorem** (`ButcherTableau.add_two_le_of_treeConditions`): for `p ≥ 7`, `s ≥ p + 2` (HNW,
  Theorem II.5.3, p. 179, Butcher 1965).
- **Theorem** (`ButcherTableau.add_three_le_of_treeConditions`): for `p ≥ 8`, `s ≥ p + 3` (HNW,
  Theorem II.5.4, p. 179, Butcher 1985).
  The sources exclude `s = p`, `s = p + 1`, `s = p + 2` respectively; `s ≥ p` for explicit
  tableaux is OneStepMethodsForODEs §5.4, reached through 4.4 with `c` replaced by `A 𝟙`, which
  does not change `TreeConditions`. The proofs of the second and third barriers are in Butcher's
  papers (Butcher, *Numer. Math.* 1965; *BIT* 1985).
- **Theorem** (`exists_isExplicit_treeConditions`): explicit tableaux of orders `5, 6, 7, 8` with
  `6, 7, 9, 11` stages exist (Butcher 2016, Subsections 325–327, pp. 204–210, with the 9-stage
  method of order 7 on p. 209 and the Cooper–Verner method of order 8 on p. 210; HNW, Section
  II.5, pp. 178–179). Route: verify the tree conditions of the cited tableaux.

**Checks.**

- Butcher's 6-stage method of order 5 (`c = (0, 1/4, 1/4, 1/2, 3/4, 1)`,
  `b = (7, 0, 32, 12, 32, 7)/90`) satisfies the 17 conditions of order five and fails one of
  order six.
- `p ≥ 5` is needed: `rk4` has `s = p = 4`.

*Needs:* 4.2, 4.4; OneStepMethodsForODEs §5.4.

## Layer 6: collocation methods

### 6.1 Collocation tableaux

- `collocationTableau c`: `a_ij = ∫_0^{c_i} ℓ_j`, `b_j = ∫_0^1 ℓ_j`, nodes `c`, with `ℓ_j`
  Mathlib's `Lagrange.basis` (HNW, Theorem II.7.7 with (7.16), p. 212; HLW, Theorem II.1.4,
  p. 31).
- **Theorem** (`collocationTableau_simplifying`): for injective `c`, `B(s)`, `C(s)` and
  `c = A 𝟙` hold (HLW, p. 32). Route: Lagrange interpolation is exact on polynomials of degree
  `< s`.

### 6.2 The collocation polynomial

- `polyValue p σ = ∑_m σ^m • p m` and `polyDeriv p` represent `u(t₀ + σ)` and `u'(t₀ + σ)` for
  an `E`-valued polynomial of degree at most `s`.
- **Theorem** (`existsUnique_collocationPolynomial`). Let `E` be complete, `c` injective and `f`
  `L`-Lipschitz in `y` for every `t` (no continuity in `t` is needed). There is `h₀ > 0` such
  that for `0 < |h| < h₀` the collocation polynomial (`u(t₀) = y₀`,
  `u'(t₀ + c_i h) = f(t₀ + c_i h, u(t₀ + c_i h))`)
  exists and is unique, and for it the slopes `u'(t₀ + c_j h)` solve the stage equations of
  `collocationTableau c` and `u(t₀ + h)` is the Runge–Kutta step (HNW, Definition II.7.6,
  p. 211, and Theorem II.7.7 with the remark after it, p. 212). Route: the correspondence of
  Theorem II.7.7 and OneStepMethodsForODEs §2.3. At `h = 0` uniqueness fails for `s ≥ 2`, since
  the `s` conditions coincide.

### 6.3 Characterization

- **Theorem** (`ButcherTableau.eq_collocationTableau_iff`): a tableau with distinct nodes and
  `B(s)` is the collocation tableau of its nodes iff `C(s)` holds (HNW, Theorem II.7.8, p. 212,
  with order at least `s`, which gives `B(s)` by 4.4).

### 6.4 Superconvergence

- **Theorem** (`collocation_hasAutonomousOrder`): if `∫_0^1 τ^q ∏(τ − c_i) dτ = 0` for `q < r`,
  the collocation method has `TreeConditions (s + r)`, `HasAutonomousOrder (s + r)` and
  `HasLocalOrder (s + r)` (HNW, Theorem II.7.9, p. 212; HLW, Theorem II.1.5, p. 32). Route
  (HNW, Exercise II.7.7, p. 215): the orthogonality gives `B(s + r)`, and with `C(s)` also
  `D(r)`; then 5.1 with `η = s`, `ζ = r`, and 4.3 with `c = A 𝟙`. Only orders "at least `s + r`"
  are claimed; the exact order needs a non-vanishing next moment.

### 6.5 Gauss, Radau IIA and Lobatto IIIA

- `gaussNodePoly`, `radauIIANodePoly`, `lobattoIIIANodePoly` as in the Conventions.
- **Theorem** (`gauss_hasAutonomousOrder`): the `s`-stage Gauss method has order exactly `2s`
  (HNW, Section II.7, pp. 209–210; Butcher 2016, Corollary 342D, p. 232).
- **Theorem** (`radauIIA_hasAutonomousOrder`): for `s ≥ 1` the Radau IIA method has order exactly
  `2s − 1` (HW, Theorem IV.5.3, p. 73).
- **Theorem** (`lobattoIIIA_hasAutonomousOrder`): for `s ≥ 2` the Lobatto IIIA method has order
  exactly `2s − 2` (HW, Theorem IV.5.5, p. 75).
  Route: Rodrigues' formula (Mathlib's `Polynomial.shiftedLegendre` is `D^s(X^s(1 − X)^s)/s!`)
  and integration by parts give the orthogonality of 6.4 with `r = s, s − 1, s − 2`; the upper
  bounds come from 6.6 (the Radau and Lobatto nodes are not the Gauss nodes) and, for Lobatto
  IIIA, from `B(2s − 1)` failing: the Lobatto quadrature is exact to degree `2s − 3` only (HW,
  p. 72).

**Checks.**

- `s = 1`: the Gauss node is `1/2` (implicit midpoint, order `2`), the Radau IIA node is `1`
  (implicit Euler, order `1`); `s = 2` Lobatto IIIA has nodes `0, 1` (the trapezoidal rule,
  order `2`).
- Maximal orders for `s = 1, 2, 3`: Gauss `2, 4, 6`; Radau IIA `1, 3, 5`; Lobatto
  IIIA (`s = 2, 3`) `2, 4`. Equispaced nodes `0, 1/2, 1` give order `4` (`r = 1`); nodes
  `0, 1/3, 1` give order `3` (`r = 0`).

### 6.6 The order bound

- **Theorem** (`ButcherTableau.le_two_mul_of_treeConditions`): `TreeConditions p` implies
  `p ≤ 2s` (Butcher 2021, Section 5.6, p. 202, where the Gauss methods are said to have the
  maximal order `2s`). Route: the bushy trees make `(b, A 𝟙)` an `s`-point quadrature rule exact
  to degree `p − 1`, and `∏(τ − (A 𝟙)_i)²` is not integrated exactly.
- **Theorem** (`ButcherTableau.eq_gauss_of_treeConditions`): `TreeConditions (2s)` forces the
  nodes `A 𝟙` to be distinct zeros of the shifted Legendre polynomial and `A`, `b` to be those of
  their collocation tableau (Butcher 2016, Theorem 342C and Corollary 342D, pp. 230–232).

**Checks.**

- `s = 2`: the polynomial system of the eight conditions of order four in
  `a₁₁, a₁₂, a₂₁, a₂₂, b₁, b₂` has exactly the two solutions `a₁₁ = a₂₂ = 1/4`, `b = (1/2, 1/2)`,
  `a₂₁ = 1/4 ± √3/6`, `a₁₂ = 1/2 − a₂₁`: the Gauss method with its two node orderings
  (by a Gröbner basis).

*Needs (Layer 6):* 4.2–4.4, 5.1; OneStepMethodsForODEs §2.3; Mathlib `Lagrange.basis`,
`Polynomial.shiftedLegendre`.

## Layer 7: composition of B-series and the Butcher group

### 7.1 Ordered subtrees and the product

- `OrderedTree.cuts τ`: the list of pairs `(θ, τ \ θ)` with `θ` a nonempty subtree of `τ`
  containing the root and `τ \ θ` the forest of removed subtrees, built by choosing for each
  child either its removal or a subtree of it (Mathlib's `List.sections`); these are HLW's
  ordered subtrees (1.33), p. 60, without `∅`.
- `butcherProduct a b`: `(ab)(∅) = b(∅)`, `(ab)(t) = b(∅) a(t) + ∑_θ b(θ) ∏_{δ ∈ t\θ} a(δ)`
  (HLW, (1.38), p. 62; Butcher 2021, Theorem 3.9C, p. 139).
- **Theorem** (`butcherProduct_some_mk`): the product may be computed on any representative.

**Checks.**

- `ab(•) = b(∅) a(•) + b(•)`; `ab([•,•]) = b(∅) a([•,•]) + b(•) a(•)² + 2 b([•]) a(•) + b([•,•])`
  (HLW, Example III.1.11, p. 64); the coefficient `2` counts the two vertex subsets
  `{root, leaf}`.

### 7.2 The composition law

- **Theorem** (`isBigO_bSeries_comp`): for `a(∅) = 1` and `f` of class `C^N`,
  `B_N(b, B_N(a, y)) − B_N(ab, y) = O(h^(N+1))` (HLW, Theorem III.1.10, p. 62; HNW,
  Theorem II.12.6, p. 267).

**Checks.**

- The exact flow composed with itself: `(e e)(t) = 2^|t|/γ(t)`, the flow over `2h`, on all
  trees of order at most six.

### 7.3 Composition of tableaux

- `ButcherTableau.comp T₁ T₂`, the `(s₁ + s₂)`-stage tableau of a step of `T₁` followed by a step
  of `T₂` (HLW, (1.28), p. 59).
- **Theorem** (`ButcherTableau.rkCoeff_comp`): its elementary weights are
  `butcherProduct (rkCoeff T₁) (rkCoeff T₂)` (HLW, (1.34), p. 61; Butcher 2016, Theorem 384A,
  p. 309, with the composite tableau (382a), p. 300).

**Checks.**

- Random rational tableaux with two and three stages: the weights of the composite agree with
  the product on all trees of order at most six.

### 7.4 The Butcher group

- **Theorem** (`butcherProduct_assoc`): `(ab)c = a(bc)` whenever `b(∅) = 1`, for any `a` and `c`;
  in particular the product is associative on the maps with `a(∅) = 1` (Butcher 2021,
  Theorem 4.7A, p. 165, for the group). Route: expand both sides over the nested pairs of
  subtrees containing the root, as in the proof of Butcher 2021, Theorem 4.7A, p. 166.
- **Theorem** (`butcherProduct_unit_inv`): `1(∅) = 1`, `1(t) = 0` is a two-sided unit and every
  `a` with `a(∅) = 1` has a two-sided inverse (HLW, Section III.1.5, (1.41)–(1.42), p. 64;
  Butcher 2021, Theorem 4.7A, p. 165, and its proof, p. 166; HNW, Exercise II.12.4, p. 272).
- **Theorem** (`exists_butcherProduct_ne`): the group is not commutative.

**Checks.**

- The inverse of the exact flow is `(−1)^|t|/γ(t)`, the flow over `−h`.
- Random rational `a`, `b`, `c` on the trees of order at most six: `(ab)c = a(bc)` when
  `b(∅) = 1`, also for `a(∅) ∈ {2, 0, −1/3}`; with `b(∅) = 3` the two sides differ, so the
  hypothesis on the middle factor cannot be dropped.
- With `a` the coefficients of explicit Euler and `e` those of the exact flow, the two products
  agree on `•`, `[•]` and `[[•]]` (values `2`, `3/2` and `2/3`), and through order three only
  `[•,•]` separates them: `(a e)([•,•]) = 7/3` and `(e a)([•,•]) = 4/3`.

*Needs (Layer 7):* 2.1, 3.1–3.4; Mathlib `List.sections`.

## Layer 8: asymptotic expansion of the global error and extrapolation

The method is a general increment function `Φ`, smooth on an open set `U ⊆ ℝ × E × ℝ` containing
`(t, y(t), 0)` for `t ∈ [t₀, T]`, consistent (`Φ(t, u, 0) = f(t, u)` on `U`), with defect
`h^(p+1) d(t) + O(h^(p+2))` as `h → 0⁺` for each `t ∈ [t₀, T)`. The solution `y` is on
`[t₀, T]` and `E` is complete. No smoothness of `f` is assumed beyond this: the slice
`{(t, u) | (t, u, 0) ∈ U}` is open and contains the graph of `y`, and on it `f = Φ(·, ·, 0)` by
consistency, so `f` is smooth there, which is all that `y`, `∂_y f(t, y(t))` and the `e_j`
use.

### 8.1 Gragg's expansion

- **Theorem** (`exists_globalErrorExpansion`): for every `N ≥ p` there are smooth `e_j` on
  `[t₀, T]` with `e_j(t₀) = 0`, `e_p' = ∂_y f(t, y(t)) e_p + d`, and constants `C`, `h₀ > 0` with
  `‖y(t₀ + nh) − y_n − ∑_{j=p}^{N} h^j e_j(t₀ + nh)‖ ≤ C h^(N+1)` for `0 < h ≤ h₀` and
  `t₀ + nh ≤ T`, on the uniform mesh (HNW, Theorem II.8.1, p. 217, Gragg 1964, with (8.2) and
  (8.8), pp. 216–217). Route: HNW's successive elimination, (8.4)–(8.9), with
  OneStepMethodsForODEs §1.4 at each step.

**Checks.**

- Explicit Euler on `y' = y`, `y(0) = 1`: `e_1(t) = t e^t/2`, so `e_1(1) = 1.3591`; the scaled
  errors `(e − (1 + 1/n)^n) n` are `1.3468` and `1.3579` for `n = 100, 1000` (HNW, p. 218).
- On `y' = t` with explicit Euler, `d = 1/2` and `e_1(t) = t/2`: the global error is `h t_n/2`
  exactly (OneStepMethodsForODEs §3.1, first Check).

### 8.2 Symmetric methods

- **Theorem** (`exists_globalErrorExpansion_even`): if moreover the method is symmetric,
  `Φ(t + h, u + hΦ(t, u, h), −h) = Φ(t, u, h)` whenever both points are in `U` (HNW,
  Definitions II.8.2 and II.8.7, pp. 219–221), the expansion has `e_j = 0` for odd `j` (HNW,
  Theorem II.8.10, p. 222).

**Checks.**

- The trapezoidal rule on `y' = y`: `(e − ((1 + h/2)/(1 − h/2))^n)/h²` at `h = 1/n` is
  `−0.22696, −0.22663, −0.22655` for `n = 10, 20, 40`, tending to `e_2(1) = −e/12 = −0.22652`
  with differences in ratio `4`.
- Explicit Euler is not symmetric (its adjoint is implicit Euler, HNW, p. 219), and its
  expansion has e_1 ≠ 0.

### 8.3 Extrapolation

- **Theorem** (`existsUnique_extrapolationWeights`): for `k ≥ 1`, `p ≥ 1` and distinct step
  numbers `n_1, …, n_k ≥ 1` (elements of `ℕ+`) there are unique `w` with `∑ w_i = 1` and
  `∑ w_i n_i^(−(p+q)) = 0` for `q < k − 1`. With them `T_{j,k} = ∑ w_i T_{i,1}`, the value at `0`
  of HNW's interpolant (9.3)–(9.4), p. 224. Route: the functions `1, x^p, …, x^(p+k−2)` form a
  Chebyshev system on `(0, ∞)`.
- **Theorem** (`isBigO_extrapolation`): for step numbers `n_i ≥ 1` and any weights `w` with
  `∑ w_i = 1` and `∑ w_i n_i^(−(p+q)) = 0` for `q < k − 1`, `∑ w_i T_{i,1}`, with `T_{i,1}` the
  result of `n_i` steps of size `H/n_i` from `y(t)`, has defect `O(H^(p+k))`: order `p + k − 1`
  (HNW, Theorem II.9.1, p. 225). Route: 8.1 started at `t`, as in HNW's proof; the moment
  conditions remove the terms `h^p, …, h^(p+k−2)`, and `e_(p+k−1)(t) = 0` makes the next term
  `O(H^(p+k))`. Distinctness of the `n_i` and `p ≥ 1` serve only the existence of the weights.

**Checks.**

- `n = (1, 2)`, `p = 1`: `w = (−1, 2)`, Richardson's `2T_{2,1} − T_{1,1}`. `n = (1, 2, 3)`,
  `p = 1`: `w = (1/2, −4, 9/2)`; for explicit Euler on `y' = y` the defects at
  `H = 0.1, 0.05, 0.025` are `4.25·10⁻⁶, 2.63·10⁻⁷, 1.64·10⁻⁸`, ratio `16`: order `3`.
- `p ≥ 1` is needed: for `p = 0` and `k = 2` the conditions `∑ w_i = 1` and `∑ w_i = 0`
  contradict each other.

*Needs (Layer 8):* OneStepMethodsForODEs §§1.2, 1.4.

## Downstream consumers

The stiff-stability and geometric-integration theory of Runge–Kutta methods (algebraic
stability of Gauss and Radau methods, symplectic integrators, backward error analysis through
modified equations written as B-series) uses the B-series of Layers 3 and 7, the collocation
methods of Layer 6 and the simplifying assumptions of Layer 5. Extrapolation codes and
Gragg–Bulirsch–Stoer methods use Layer 8.

## Scope and ownership

This roadmap owns:

- convergence of variable-step Euler polygons in a Lipschitz rectangle;
- unordered rooted trees with order, density, symmetry, orderings, counts and labellings;
- elementary differentials, elementary weights, B-series, the exact-flow and Runge–Kutta
  B-series, the smooth stage branch;
- the order theorem for all orders, explicit and implicit, autonomous and non-autonomous;
- simplifying assumptions and the Butcher barriers of orders five, seven and eight, with
  methods attaining them through order eight;
- collocation tableaux and polynomials, their characterization and orders, the Gauss, Radau IIA
  and Lobatto IIIA methods, the bound `p ≤ 2s`;
- the composition product of B-series, the composition of tableaux, and the Butcher group;
- the asymptotic expansion of the global error of one-step methods, its even form for symmetric
  methods, and extrapolation.

Boundaries:

- OneStepMethodsForODEs owns meshes, one-step methods, the convergence theorem, Butcher
  tableaux and stage solvability, the eight conditions through order four with
  `ButcherTableau.HasOrder`, `p ≤ s` for explicit methods, the stability function and
  A-stability, Cooper's theorem and symplecticity. This roadmap consumes them and extends the
  order theory to all orders (4.4 contains the case `p ≤ 4` of OneStepMethodsForODEs §4.3 as a
  special case of its statement, with that section as an input).
- SpecialFunctionsOrthogonalPolynomialsGeneral owns Gauss quadrature and its error. The
  quadrature facts used for collocation (exactness of `(b, c)` from `B(p)`, orthogonality of the
  shifted Legendre polynomial) are proved here on the tableaux.
- QuadratureRulesAndPeanoKernels owns Peano kernels, composite rules and one
  Richardson step for quadrature; Layer 8 extrapolates one-step methods, not quadrature rules.
- LinearMultistepMethods owns multistep methods; nothing here concerns them.
- [AdaptiveTimeSteppingForODEs](../AdaptiveTimeSteppingForODEs/README.md) owns embedded pairs,
  error indicators and step-size control on adaptive meshes. Layer 8 is about uniform meshes and
  does not consume it.
- ExponentialIntegrators owns exponential Euler and exponential Runge–Kutta
  methods for semilinear problems and their stiffness-independent error bounds; their order
  conditions are not treated here.
- WellQuasiOrdersAndKruskal owns labelled plane trees with a list of
  children and their homeomorphic embeddings. The ordered trees of 2.1 are a separate carrier:
  unlabelled, with the children indexed by `Fin m`, because the elementary differential at a
  vertex with `m` children evaluates `iteratedFDeriv ℝ m f y` on a family indexed by `Fin m`;
  they serve only as representatives of rooted trees. Neither roadmap consumes the other.
- Existence and uniqueness of solutions are Mathlib's; Layer 1 proves the convergence of Euler
  polygons, with existence as part of its statement.

Not part of this roadmap: stability functions, Padé approximations and A-stability of the
collocation methods (Radau IA, Lobatto IIIB and IIIC included), algebraic and B-stability,
B-convergence and order reduction; stage order beyond `C(η)`; partitioned and additive methods,
P-series, Lie–Butcher series; modified equations; Gragg's method with its expansion
u_k + (−1)^n v_k; general linear methods.

## Exact supplier contracts

### From OneStepMethodsForODEs

- §§1.1–1.2: `meshNode`, `oneStepSeq`, `oneStepDefect`, copied verbatim.
- §1.3: discrete stability (used in 1.2); §1.4: the convergence theorem (used in 8.1).
- §2.1: `ButcherTableau`, `ButcherTableau.IsExplicit`, `ButcherTableau.IsStage`,
  `ButcherTableau.stages`, `ButcherTableau.increment`, copied verbatim; §2.3: unique
  solvability of the stage equations for `|h| L α < 1` (used in 3.4 and 6.2).
- §4.1: `ButcherTableau.OrderConditions`; §4.2: `ButcherTableau.HasOrder`, copied verbatim;
  §4.3: the equivalence for `p ≤ 4` (an input of 4.4).
- §5.4: the order barrier `¬ ButcherTableau.HasOrder p` for explicit tableaux with `p > s`
  (used in 5.2).

### From Mathlib

- `IsIntegralCurveOn`, `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`,
  `ODE_solution_unique_of_mem_Icc` (`Mathlib/Analysis/ODE/`); `gronwallBound`
  (`Mathlib/Analysis/ODE/Gronwall.lean`), the bound of OneStepMethodsForODEs §1.3.
- `iteratedFDeriv`,
  `ContDiffAt.isSymmSndFDerivAt` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`),
  `ContDiffAt.iteratedFDeriv_comp_perm` (`Mathlib/Analysis/Analytic/IteratedFDeriv.lean`),
  `ContDiffAt.implicitFunction` (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean`),
  `taylor_mean_remainder_bound` (`Mathlib/Analysis/Calculus/Taylor.lean`).
- `Lagrange.basis` (`Mathlib/LinearAlgebra/Lagrange.lean`), `Polynomial.shiftedLegendre`
  (`Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean`), `PowerSeries.trunc`, `List.sections`,
  `Quot.out`, `finsum`.
- `_root_.RootedTree`, `RootedTree.subtrees` and `SubRootedTree.coeTree`
  (`Mathlib/Order/SuccPred/Tree.lean`): rooted trees as orders with a least element and
  predecessors, their immediate subtrees and the subtree as a rooted tree; compared with
  `ButcherTree` in 2.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- B-series as formal series of vector fields, the Connes–Kreimer Hopf algebra of rooted trees and
  its antipode (Butcher 2021, Section 2.9), and convergence of B-series for analytic fields.
- Backward error analysis: the modified vector field of a B-series method as a B-series and its
  substitution law (HLW, Chapter IX).
- The attainability of the order bound for explicit methods of order nine and higher, and
  Butcher's general lower bounds for `s` beyond order eight.

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC), `NASC/InitialValueProblems.lean` at commit
8efdbf7, states with `sorry` the convergence of Euler polygons (1.2), ordered-tree versions of
the order theorem (4.2) and of the B-series of a step (3.4) over a type of trees with ordered
children, the simplifying-assumptions theorem (5.1) and the collocation order (6.4). It proves
none of the targets of this roadmap. Its ordered trees need the ordered weight of 2.2 in every
sum; this roadmap states the theory on unordered trees and keeps the ordered ones as
representatives.

The Isabelle Archive of Formal Proofs entry *Ordinary Differential Equations* (Immler and
Hölzl) contains explicit Runge–Kutta methods used for rigorous enclosures, without the tree
theory.

## References

The locators refer to these editions; page numbers are printed page numbers.

- J. C. Butcher, *Numerical Methods for Ordinary Differential Equations*, 3rd ed., Wiley, 2016
  (cited as Butcher 2016).
- J. C. Butcher, *B-Series: Algebraic Analysis of Numerical Methods*, Springer Series in
  Computational Mathematics 55, Springer, 2021 (cited as Butcher 2021).
- E. Hairer, C. Lubich and G. Wanner, *Geometric Numerical Integration*, 2nd ed., Springer Series
  in Computational Mathematics 31, Springer, 2006 (cited as HLW).
- E. Hairer, S. P. Nørsett and G. Wanner, *Solving Ordinary Differential Equations I: Nonstiff
  Problems*, 2nd ed., Springer Series in Computational Mathematics 8, Springer, 1993 (cited as
  HNW).
- E. Hairer and G. Wanner, *Solving Ordinary Differential Equations II: Stiff and
  Differential-Algebraic Problems*, 2nd ed., Springer Series in Computational Mathematics 14,
  Springer, 1996 (cited as HW).
