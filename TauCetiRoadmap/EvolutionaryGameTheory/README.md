# Roadmap: evolutionary game theory

**Summary.** A symmetric two-player game with `n` pure strategies is given by a real `n × n`
payoff matrix `A`: a player using strategy `i` against one using `j` receives `A i j`. A mixed
strategy, or a population state, is a point `x` of the probability simplex, and `y · A x` is the
payoff of `y` against `x`. This roadmap develops the static notion of evolutionary stability and
the replicator equation `xᵢ' = xᵢ ((A x)ᵢ − x · A x)`, in which a strategy's frequency grows at the
rate by which its payoff exceeds the population mean, and proves the theorems that tie the two
together. Every statement is about an arbitrary real matrix `A` over a finite set of strategies;
stability always means stability relative to the simplex, which the equation leaves invariant.

The headline theorems:

- *Evolutionary stability.* A mixed strategy `x` is evolutionarily stable (an ESS) when every other
  mixed strategy `y` either earns less than `x` against `x`, or earns as much and then earns less
  against `y` than `x` does. This holds exactly when `x · A y > y · A y` for every mixed `y ≠ x`
  near `x`. If every coordinate of `x` is positive, `x` is an ESS exactly when all pure strategies
  earn the same against `x` and `z · A z < 0` for every nonzero `z` with coordinate sum zero; such
  an ESS is then the only symmetric Nash equilibrium.
- *The folk theorem.* Every symmetric Nash equilibrium is a rest point of the replicator equation.
  A point of the simplex that is Lyapunov stable relative to the simplex is a symmetric Nash
  equilibrium, and so is the limit of every convergent solution that starts with all coordinates
  positive.
- *Evolutionary stability implies dynamic stability.* Every ESS is an asymptotically stable rest
  point of the replicator equation relative to the simplex, and an ESS with all coordinates
  positive attracts every solution that starts with all coordinates positive.
- *Symmetric payoffs.* If `A` is symmetric, the mean payoff `x · A x` is nondecreasing along every
  solution in the simplex, strictly increasing unless the solution starts at a rest point, and
  every such solution approaches the set of rest points.

The roadmap builds on LyapunovStabilityOfODEs, whose notion of a forward solution it adopts and
whose invariance principle (LaSalle's) gives the convergence for symmetric payoffs; on
PopulationDynamics, whose existence theorem for solutions confined to a compact set gives global
solutions; and on RegretMinimizationAndEquilibria, whose simplex it uses and of whose Nash
equilibria a symmetric Nash equilibrium is the symmetric case.

Layer 1 below is static: symmetric Nash equilibria, evolutionarily stable strategies and their
characterizations. Layer 2 defines the replicator equation and proves that the simplex and its
faces are invariant and that solutions exist for all times. Layer 3 defines stability relative to
a set and proves the folk theorem. Layer 4 proves that an ESS is asymptotically stable, with the
relative entropy as a Lyapunov function. Layer 5 treats symmetric payoff matrices. Layers 3 and 4
use Layers 1 and 2, and Layer 4 uses Layer 3 only for its definitions; Layer 5 uses Layer 2 and
LaSalle's principle.

## Conventions

- **Strategies and payoffs.** `ι` is a finite type of pure strategies, `n = Fintype.card ι`, and
  `A : Matrix ι ι ℝ`. For `x y : ι → ℝ`, the payoff of `y` against `x` is `y ⬝ᵥ (A *ᵥ x)`,
  written `y · A x`; `(A *ᵥ x) i` is the payoff of the pure strategy `i` against `x`, and
  `x · A x` is the mean payoff of the population state `x`. Players maximize. No hypothesis on
  `A` is standing: symmetry `Aᵀ = A` (Mathlib's `Matrix.IsSymm`) is assumed only in Layer 5.
- **The simplex.** `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, the
  definition of RegretMinimizationAndEquilibria (Conventions), copied verbatim:
  `Convexity.StdSimplex.range_toFun_comp_weights` identifies it with the vectors with nonnegative
  coordinates and sum `1`. It is empty when `ι` is empty and a single point when `n = 1`, and
  every statement below is true in both cases. The support of `x` is `{i | 0 < x i}`; `x` is
  interior when every coordinate is positive; the faces of the simplex are the sets of its points
  vanishing on a given set of coordinates.
- **Norm.** `ι → ℝ` carries Mathlib's sup norm; `dist y x` is the largest coordinate difference.
  Since all norms on `ι → ℝ` are equivalent, no statement depends on this choice.
- **Solutions.** The replicator field is a polynomial vector field on all of `ι → ℝ`. A forward
  solution from `x` is a member of `forwardSolutions (replicatorField A) x`, copied verbatim from
  LyapunovStabilityOfODEs 1.1: a curve `γ` with `γ 0 = x` and
  `IsIntegralCurveOn γ (fun _ ↦ replicatorField A) (Set.Ici 0)`. Only its values at `t ≥ 0`
  matter.
- **Stability is relative to the simplex.** The stability notions of LyapunovStabilityOfODEs 1.2
  and 1.3 test every initial point in a ball of `ι → ℝ`. The replicator field off the simplex is
  an artefact of extending it to all of `ι → ℝ`: the coordinate sum `s` of a solution satisfies
  `s' = (x · A x)(1 − s)`, so when the mean payoff at a rest point is negative, solutions that
  start just off the hyperplane `s = 1` leave it, although nothing changes on the simplex (the
  Check of 3.1). Layer 3 therefore defines stability relative to a set, testing only initial
  points in that set; with the whole space as the set it is the notion of
  LyapunovStabilityOfODEs.
- **The relative entropy.** For `x* ∈ simplex ι`, the function
  `H(y) = Σ_{i : 0 < x* i} x* i · log (x* i / y i)` is used in Layer 4 only on the points `y` of
  the simplex whose support contains that of `x*`, where every logarithm has a positive argument.
  It is the Kullback–Leibler divergence of `x*` from `y`; Mathlib's `InformationTheory.klDiv`
  (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean`) is its measure-theoretic form, with
  values in `[0, ∞]`, and the finite sum is used directly here. It is not a declaration of
  `Suggested.lean`.

## Layer 1: symmetric Nash equilibria and evolutionarily stable strategies

### 1.1 Symmetric Nash equilibria

Define `simplex` as in the Conventions and `IsSymmetricNash A x`: `x ∈ simplex ι` and
`y · A x ≤ x · A x` for every `y ∈ simplex ι`; that is, `x` is a best reply to itself
(Hofbauer–Sigmund, §2.1, equation (2), p. 481; van Strien, equation (1.1), p. 1). A strict symmetric
Nash equilibrium is one where equality holds only for `y = x` (van Strien, equation (1.2), p. 1).

- **Pure deviations suffice.** `x ∈ simplex ι` is a symmetric Nash equilibrium if and only if
  `(A *ᵥ x) i ≤ x · A x` for every pure strategy `i`, since `y · A x` is affine in `y` and the
  simplex is the convex hull of the unit vectors.
- **Support equalization.** If `x` is a symmetric Nash equilibrium, then `(A *ᵥ x) i = x · A x`
  for every `i` in the support of `x`; conversely a point `x` of the simplex such that
  `(A *ᵥ x) i` takes one value `c` for all `i` is a symmetric Nash equilibrium (van Strien,
  Lemma 1.2, p. 3). In particular an interior point is a symmetric Nash equilibrium exactly when
  `A *ᵥ x` is a constant vector.
- **The symmetric case of a Nash equilibrium.** `x` is a symmetric Nash equilibrium of `A` if and
  only if the profile giving both players `x` is a Nash equilibrium, in the sense of
  RegretMinimizationAndEquilibria 3.1, of the two-player game in which player `0` receives
  `A (a 0) (a 1)` and player `1` receives `A (a 1) (a 0)` (for nonempty `ι`, as that roadmap
  assumes of every action set): by symmetry the two players' conditions
  coincide, and the expected utility there is the bilinear payoff here.

**Checks.**
- For the identity matrix on two strategies, the symmetric Nash equilibria are the two unit vectors
  and `(1/2, 1/2)`; the unit vectors are strict and `(1/2, 1/2)` is not, since every strategy
  earns `1/2` against it (van Strien, Example 1.1, p. 1).
- For `A = 0` every point of the simplex is a symmetric Nash equilibrium and none is strict when
  `n ≥ 2`.
- The unit vector `e₁` of rock–paper–scissors (1.4) is a rest point of the replicator equation but
  not a symmetric Nash equilibrium: against `e₁` the strategy that beats it earns
  `w > 0 = e₁ · A e₁`.

*Needs:* Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`,
`dotProduct`, `Matrix.mulVec`; RegretMinimizationAndEquilibria (Conventions; 3.1, for the comparison
only). (Proved here.)

### 1.2 Evolutionarily stable strategies

Define `IsESS A x`: `x ∈ simplex ι`, and for every `y ∈ simplex ι` with `y ≠ x`, either
`y · A x < x · A x`, or `y · A x = x · A x` and `y · A y < x · A y` (Maynard Smith's equilibrium
and stability conditions; Hofbauer–Sigmund, §2.6, conditions (16) and (17), p. 486). The mutant
`y` ranges over all mixed strategies, not only the pure ones.

- **The invasion barrier.** `x` is an ESS if and only if for every `y ∈ simplex ι` with `y ≠ x`
  there is `ε̄ > 0` with `y · A w < x · A w` for every `ε ∈ (0, ε̄)`, where
  `w = (1 − ε) x + ε y` is the population after a fraction `ε` of mutants `y` enters (van Strien,
  definition (1.3), p. 2; Pražák, Definition of ESS, p. 2). Route: `(y − x) · A w` is the affine
  function `(y − x) · A x + ε (y − x) · A (y − x)` of `ε`, and `(y − x) · A y` is the sum of its two
  coefficients.
- **ESS and Nash equilibria.** A strict symmetric Nash equilibrium is an ESS, and an ESS is a
  symmetric Nash equilibrium (van Strien, Lemma 1.1, p. 2): the first condition holds for every
  `y` in the first case and is a consequence of the definition in the second.

**Checks.**
- For the identity matrix on two strategies, `e₁` and `e₂` are ESS and `(1/2, 1/2)` is not:
  `e₁ · A (1/2, 1/2) = 1/2` equals the mean payoff, and `e₁ · A e₁ = 1 > 1/2 = (1/2, 1/2) · A e₁`
  (van Strien, Example 1.3, p. 3).
- **A non-strict ESS on the boundary.** For `A = [[0, 0], [0, −1]]` the unit vector `e₁` is an ESS
  but not a strict Nash equilibrium: every `y` earns `0` against `e₁`, and
  `y · A y = −y₂² < 0 = e₁ · A y` for `y ≠ e₁`.
- **Pure mutants do not suffice.** For `A = [[0, 0, 0], [0, −1, 2], [0, 2, −1]]` and `x = e₁`,
  every strategy earns `0` against `e₁`, and the pure mutants `e₂`, `e₃` satisfy the stability
  condition (`−1 < 0`), but the mixed mutant `y = (0, 1/2, 1/2)` has `y · A y = 1/2 > 0 = e₁ · A y`.
  So `e₁` is not an ESS, although a definition that tests only pure mutants would call it one;
  and indeed `e₁` is not asymptotically stable: the line `x₂ = x₃` is invariant, and at
  `x = (1 − 2s, s, s)` with `s > 0` one has `(A x)₁ = 0 < 2 s² = x · A x`, so along the solution
  from every such point the first coordinate decreases and so stays at most `1 − 2s < 1`: no
  solution from these points, which come arbitrarily close to `e₁`, tends to `e₁`. The solution
  from `(0.98, 0.01, 0.01)` tends to `(0, 1/2, 1/2)` (on the line, `s' = s² (1 − 2s) > 0`).
- For `A = 0` and `n ≥ 2` there is no ESS; for `n = 1` the only point of the simplex is an ESS
  for every `A`, the condition being vacuous.

*Needs:* 1.1. (Proved here.)

### 1.3 Local superiority

Prove `isESS_iff_locallySuperior`: `IsESS A x` holds if and only if `x ∈ simplex ι` and there is
`ε > 0` such that `y · A y < x · A y` for every `y ∈ simplex ι` with `0 < dist y x < ε`
(Hofbauer–Sigmund, Theorem 7, p. 486, condition (18); van Strien, Lemma 1.3, p. 3, with the proof
of the forward implication on p. 4).

Route. Forward: let `Λ` be the union of the faces `{w ∈ simplex ι | w i = 0}` over the `i` in the
support of `x`; it is compact and does not contain `x`. Every `y ∈ simplex ι` with `y ≠ x` is
`x + s (w − x)` for some `w ∈ Λ` and `s ∈ (0, 1]`: some coordinate of `y − x` is negative, and it
lies in the support of `x`, so the ray from `x` through `y` leaves the simplex through `Λ`. With
`a(w) = (w − x) · A x ≤ 0` and `b(w) = (w − x) · A (w − x)`, the ESS conditions say that `a(w) < 0`
or `a(w) = 0 > b(w)`, and `y · A y − x · A y = s (a(w) + s b(w))`. Each `w ∈ Λ` has a neighbourhood
and an `s₀ > 0` such that `a + s b < 0` on it for `0 < s < s₀`; finitely many cover `Λ`, and
`s ≤ dist y x / dist x Λ` is small when `y` is near `x`. Backward: for `y ≠ x` in the simplex and
small `ε > 0`, the point `w = x + ε (y − x)` is near `x`, so `0 > (w − x) · A w = ε (a + ε b)` with
`a = (y − x) · A x` and `b = (y − x) · A (y − x)`; letting `ε → 0` gives `a ≤ 0`, and if `a = 0`
then `b < 0`, so `y · A y − x · A y = a + b < 0`.

**Checks.**
- For the identity on two strategies and `x = e₁`, `y = (1 − t, t)` gives `x · A y = 1 − t` and
  `y · A y = (1 − t)² + t²`, so the inequality holds exactly for `0 < t < 1/2`: superiority is only
  local, with radius `1/2` in the sup norm.
- For the counterexample `A = [[0, 0, 0], [0, −1, 2], [0, 2, −1]]` of 1.2, the points
  `(1 − t, t/2, t/2)` have `y · A y = t²/2 > 0 = e₁ · A y` for every `t ∈ (0, 1]`, so no radius
  works.

*Needs:* 1.2; Mathlib `Metric.infDist`, `IsCompact.exists_isMinOn`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`. (Proved here, after the cited proof.)

### 1.4 The interior ESS criterion

Prove `isESS_iff_of_pos`: let `x ∈ simplex ι` have every coordinate positive. Then `IsESS A x`
holds if and only if `(A *ᵥ x) i = (A *ᵥ x) j` for all `i, j` and `z · A z < 0` for every nonzero
`z : ι → ℝ` with `Σ i, z i = 0` (Sandholm, §VII.4, equation (18), p. 22; van Strien, Example
1.10, p. 12, for the computation in one case).

Route: an ESS is a symmetric Nash equilibrium (1.2), so support equalization (1.1) makes
`A *ᵥ x` constant; then `(y − x) · A x = 0` for every `y` in the simplex, and the ESS condition for
`y` reads `(y − x) · A (y − x) < 0`. Every nonzero `z` with sum zero is a positive multiple of such
a `y − x`, because `x + t z` lies in the simplex for small `t > 0` when `x` is interior.

**Checks.**
- **Rock–paper–scissors.** For a win payoff `w > 0` and a loss `ℓ > 0` let
  `A = [[0, −ℓ, w], [w, 0, −ℓ], [−ℓ, w, 0]]`: strategy `2` beats `1`, `3` beats `2` and `1` beats
  `3`. The centre `c = (1/3, 1/3, 1/3)` has `A *ᵥ c = ((w − ℓ)/3, (w − ℓ)/3, (w − ℓ)/3)`, and
  `z · A z = −((w − ℓ)/2) Σ zᵢ²` for `Σ zᵢ = 0` (the symmetric part has off-diagonal entries
  `(w − ℓ)/2`, and `Σ_{i<j} zᵢ zⱼ = −(Σ zᵢ²)/2`). So `c` is an ESS exactly when `w > ℓ`. For
  `w = 2, ℓ = 1` and `z = (1, −1, 0)` the form is `−1`; for `w = ℓ = 1` it is `0`; for
  `w = 1, ℓ = 2` it is `1`. `det A = w³ − ℓ³`, which is `7`, `0` and `−7` in these three cases.
- **An asymptotically stable rest point that is not an ESS.** For
  `A = [[1, 5, 0], [0, 1, 5], [5, 0, 4]]` the interior point `(3/18, 8/18, 7/18)` has
  `A *ᵥ x = (43/18, 43/18, 43/18)`, but `z · A z = 3 z₁ z₂` on the vectors with sum zero, which is
  `−3` at `(1, −1, 0)` and `3` at `(1, 1, −2)`; so it is not an ESS. The Jacobian of the replicator
  field restricted to the plane of sum zero has eigenvalues `−1/9 ± 1.2423 i`, so the point is
  asymptotically stable: the converse of 4.1 fails (van Strien, Example 1.10, pp. 11–13;
  Pražák, the example on p. 3).
- Interiority is needed for the forward implication: for `A = I` on two strategies the ESS `e₁`
  has `A *ᵥ e₁ = (1, 0)`, which is not constant.

*Needs:* 1.1, 1.2. (Proved here.)

### 1.5 Global superiority and uniqueness of an interior ESS

Prove `IsESS.superior_and_unique_of_pos`: if `x` is an ESS with every coordinate positive, then
`y · A y < x · A y` for every `y ∈ simplex ι` with `y ≠ x`, and every symmetric Nash equilibrium
equals `x` (Hofbauer–Sigmund, Theorem 7, p. 486, last sentence; van Strien, Lemma 1.2, last
assertion, p. 3, and Lemma 1.3, inequality (1.5), p. 3).

Route: `A *ᵥ x` is constant (1.4), so `y · A x = x · A x` for every `y` in the simplex and the
second ESS condition applies to every `y ≠ x`. A symmetric Nash equilibrium `y ≠ x` would have
`x · A y ≤ y · A y`, contradicting it.

**Checks.**
- For rock–paper–scissors with `w = 2, ℓ = 1` the centre satisfies the inequality on all of the
  simplex: `x · A y − y · A y = (1/3)(w − ℓ) − (w − ℓ) Σ_{i<j} yᵢ yⱼ = (1/2)(w − ℓ) Σ (yᵢ − 1/3)²`.
- Interiority is needed: the boundary ESS `e₁` of `A = I` on two strategies is not the only
  symmetric Nash equilibrium (`e₂` and `(1/2, 1/2)` are others), and it is not superior to `e₂`:
  `e₁ · A e₂ = 0 < 1 = e₂ · A e₂`.

*Needs:* 1.1, 1.2, 1.4. (Proved here.)

### Examples

Coordination (`A = I`), the hawk–dove game `A = [[−1, 2], [0, 1]]` (resource `2`, cost of a fight
`4`), whose interior point `(1/2, 1/2)` is an ESS with `A *ᵥ x = (1/2, 1/2)` (van Strien,
Example 1.4, p. 4), the non-strict ESS of
`[[0, 0], [0, −1]]`, the counterexample to pure-mutant testing, and the rock–paper–scissors family.

### Dependencies

Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Metric.infDist`,
`IsCompact.exists_isMinOn`; RegretMinimizationAndEquilibria, Conventions (the simplex) and 3.1
(for the comparison in 1.1). No other layer.

## Layer 2: the replicator equation

### 2.1 The replicator field

Define `replicatorField A : (ι → ℝ) → ι → ℝ` by
`replicatorField A x i = x i * ((A *ᵥ x) i − x · A x)` (Hofbauer–Sigmund, §2.2, equation (3),
p. 481; van Strien, equation (1.6), p. 5).

- Each coordinate is a polynomial in the coordinates of `x`, so the field is `ContDiff ℝ 1` (indeed
  smooth) on all of `ι → ℝ`, and Lipschitz on every compact set (Mathlib
  `ContDiff.locallyLipschitz`, `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`).
- **Rest points.** A point `x` of the simplex is a zero of the field if and only if
  `(A *ᵥ x) i = x · A x` for every `i` in its support (Hofbauer–Sigmund, §2.3, p. 482). Every unit
  vector is a rest point.
- The coordinate sum of the field is `(x · A x)(1 − Σ i, x i)`, which vanishes on the simplex.
- **Logarithmic derivatives.** Along a solution with `xᵢ > 0`, `(log xᵢ)' = (A x)ᵢ − x · A x`; hence
  for a vector `α` the product `Π xᵢ^αᵢ` has logarithmic derivative `Σ αᵢ ((A x)ᵢ − x · A x)`
  (Hofbauer–Sigmund, equation (5), p. 482).
- Adding a constant to every entry of a column of `A` leaves the field unchanged on the simplex
  (Hofbauer–Sigmund, §2.2, fact (a), p. 482).

**Checks.**
- For two strategies and `x = (p, 1 − p)` the first coordinate is
  `p (1 − p) ((A x)₁ − (A x)₂)`, the one-dimensional form (Hofbauer–Sigmund, equation (8), p. 483).
- For rock–paper–scissors with `w = ℓ`, `Σᵢ (A x)ᵢ = 0` and `x · A x = 0` for every `x`, so
  `(x₁ x₂ x₃)' = 0`: numerically the product stays within `10⁻¹³` of `0.03` along the solution from
  `(0.2, 0.3, 0.5)` up to time `100`.
- Adding `−10` to every entry of the hawk–dove matrix changes the mean payoff at `(1/2, 1/2)` from
  `1/2` to `−19/2` and leaves the field unchanged on the simplex but not off it.

*Needs:* Mathlib `dotProduct`, `Matrix.mulVec`, `ContDiff.locallyLipschitz`,
`LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`. (Proved here.)

### 2.2 Forward solutions

Define `forwardSolutions f x`, copied verbatim from LyapunovStabilityOfODEs 1.1: the curves `γ`
with `γ 0 = x` and `IsIntegralCurveOn γ (fun _ ↦ f) (Set.Ici 0)`. For the replicator field two
forward solutions from one point agree at every `t ≥ 0` (PopulationDynamics 2.1, uniqueness).

*Needs:* Mathlib `IsIntegralCurveOn`; LyapunovStabilityOfODEs 1.1; PopulationDynamics 2.1.

### 2.3 Invariance of the simplex and of its faces

Prove `mem_simplex_of_mem_forwardSolutions`: if `x ∈ simplex ι` and `γ` is a forward solution of
the replicator equation from `x`, then for every `t ≥ 0`, `γ t ∈ simplex ι` and, for every `i`,
`0 < γ t i ↔ 0 < x i` (Hofbauer–Sigmund, §2.2, p. 482; van Strien, §1.3, p. 5; Pražák,
Theorem 7.2, p. 3). So the interior of the simplex, each of its faces and the relative interior
of each face are invariant.

Route. Let `m(t) = γ t · A γ t`, continuous in `t`. The sum `s(t) = Σ i, γ t i` satisfies
`s' = m (1 − s)` with `s(0) = 1`, so `(1 − s(t)) exp (∫₀ᵗ m)` has derivative zero and `s ≡ 1`.
Each coordinate satisfies `γᵢ' = γᵢ gᵢ` with `gᵢ(t) = (A γ t)ᵢ − m(t)` continuous, so
`γᵢ(t) = xᵢ exp (∫₀ᵗ gᵢ)`, which is positive, zero or negative with `xᵢ`. Nothing here uses that
`γ` stays in a bounded set, so the argument also applies to solutions on bounded intervals `[0, T)`
and to the field `−replicatorField A`.

**Checks.**
- For `A = [[0, 6, −4], [−3, 0, 5], [−1, 3, 0]]` the edge `x₂ = 0` is invariant, and on it, with
  `x = (p, 0, 1 − p)`, the equation reads `p' = p (1 − p)(5p − 4)`, since `(A x)₁ = −4 (1 − p)` and
  `(A x)₃ = −p`; so the solution from `(0.2, 0, 0.8)` stays on the edge and tends to `e₃`.
- Off the simplex the hyperplane `s = 1` need not attract: for the hawk–dove matrix minus `10` in
  every entry, the solution from `1.001 · (1/2, 1/2)` has `s − 1` equal to `0.001` at time `0` and
  about `0.15` at time `1/2`, as `u = 1 − s` satisfies `u' = −m u` with `m ≈ −19/2`.

*Needs:* 2.1, 2.2; Mathlib `HasDerivWithinAt`, `Real.exp`,
`intervalIntegral.integral_hasDerivAt_right`. (Proved here.)

### 2.4 Global solutions

Prove `exists_isIntegralCurve_replicatorField`: from every `x ∈ simplex ι` there is a curve `γ`
with `γ 0 = x` and `IsIntegralCurve γ (fun _ ↦ replicatorField A)`, such that for every real `t`,
`γ t ∈ simplex ι` and `0 < γ t i ↔ 0 < x i` for every `i` (Pražák, Theorem 7.2, p. 3; van
Strien, §1.3, p. 5, where it is attributed to the general theory; Miękisz, §4, p. 10;
Hofbauer–Sigmund, §2.2, p. 482, for the invariance).

Route: by 2.3 every solution on a bounded interval `[0, T)` from `x` stays in the compact simplex,
so PopulationDynamics 2.1 gives a solution on `[0, ∞)`; the same for `−replicatorField A` gives one
on `(−∞, 0]`, and the two glue at `0` (Mathlib `HasDerivWithinAt.union`) into a solution on all of
`ℝ`. Applying 2.3 forwards and to the reversed field gives the invariance at every real `t`.

**Checks.**
- For `n = 1` the field vanishes on the simplex `{1}` and the solution is constant.
- For two strategies and `A = I`, the first coordinate `p` of the solution from `(p₀, 1 − p₀)`
  with `0 < p₀ < 1/2` satisfies `p' = p (1 − p)(2p − 1) < 0`: it decreases to `0` as `t → ∞` and
  increases to `1/2` as `t → −∞`, reaching neither.

*Needs:* 2.1, 2.3; PopulationDynamics 2.1; Mathlib `IsIntegralCurve`, `HasDerivWithinAt.union`,
`Convexity.StdSimplex.compactSpace`. (Proved here.)

### Examples

The flows of 2.3 on the edge `x₂ = 0`, the conserved product of rock–paper–scissors with `w = ℓ`,
and the transverse instability of the extended field.

### Dependencies

Mathlib `IsIntegralCurveOn`, `IsIntegralCurve`, `HasDerivWithinAt.union`,
`ContDiff.locallyLipschitz`, `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`,
`Convexity.StdSimplex.compactSpace`, `intervalIntegral.integral_hasDerivAt_right`;
LyapunovStabilityOfODEs 1.1; PopulationDynamics 2.1; Layer 1 only for the simplex.

## Layer 3: the folk theorem of evolutionary game theory

### 3.1 Stability relative to a set

For a vector field `f : E → E` on a real normed space, a set `S ⊆ E` and `x₀ ∈ E`, define
`IsLyapunovStableWithin f S x₀`: for every `ε > 0` there is `δ > 0` such that every `x ∈ S` with
`dist x x₀ < δ` has a forward solution, and every forward solution `γ` from such `x` has
`dist (γ t) x₀ < ε` for all `t ≥ 0`. Define `IsAsymptoticallyStableWithin f S x₀`: `x₀` is
Lyapunov stable relative to `S`, and for some `δ > 0` every `x ∈ S` with `dist x x₀ < δ` has a
forward solution and every forward solution from it tends to `x₀`. These are the definitions of
stable and asymptotically stable rest points of Hofbauer–Sigmund (§2.2, p. 482), stated for
neighbourhoods in the simplex, with the existence of solutions made explicit as in
LyapunovStabilityOfODEs 1.2 and 1.3.

- With `S` the whole space the two notions are LyapunovStabilityOfODEs 1.2 and 1.3: the
  definitions agree word for word once `x ∈ Set.univ` is read as no condition.
- Stability relative to `S` is implied by stability relative to any larger set, in particular by
  the notions of LyapunovStabilityOfODEs; the Check below shows that the converse fails for the
  replicator field.
- If `x₀ ∈ S` and `x₀` is Lyapunov stable relative to `S`, a forward solution from `x₀` stays within
  every `ε` of `x₀`, so it is constant and `f x₀ = 0`.

**Checks.**
- The interior ESS `(1/2, 1/2)` of the hawk–dove matrix minus `10` in every entry is asymptotically
  stable relative to the simplex (4.1), but not Lyapunov stable in the sense of
  LyapunovStabilityOfODEs 1.2 for the replicator field on `ℝ²`: by the computation of 2.3,
  `1 − s` grows like `exp (19 t/2)` near it, so solutions from points just off the line `s = 1`
  leave every small ball.
- For rock–paper–scissors with `w = ℓ`, the centre is Lyapunov stable relative to the simplex but
  not asymptotically stable: the level curves of the conserved product `x₁ x₂ x₃` near its maximum
  `1/27` are small closed curves around the centre, and no solution other than the rest point
  approaches it (Miękisz, §4, pp. 11–12).

*Needs:* 2.2; LyapunovStabilityOfODEs 1.2, 1.3 (for the comparison only). (Proved here.)

### 3.2 Nash equilibria are rest points

Prove `IsSymmetricNash.replicatorField_eq_zero`: every symmetric Nash equilibrium `x` satisfies
`replicatorField A x = 0` (Hofbauer–Sigmund, §2.3, folk theorem (a), p. 482; van Strien,
Lemma 1.4 (1), p. 6; Miękisz, Theorem 2, p. 10). Route: support equalization (1.1) makes the
second factor vanish on the support and the first vanish off it.

**Checks.**
- The converse fails: every unit vector is a rest point, but `e₁` of rock–paper–scissors is not a
  symmetric Nash equilibrium (1.1), and for `A = [[0, 1, 0], [0, 0, 2], [0, 0, 1]]` all three unit
  vectors are rest points while only `e₁` is a symmetric Nash equilibrium (van Strien,
  Example 1.7, p. 6).
- On the interior the two notions agree: an interior rest point has `A *ᵥ x` constant, hence is a
  symmetric Nash equilibrium (van Strien, Lemma 1.4 (2), p. 6).

*Needs:* 1.1, 2.1. (Proved here.)

### 3.3 Stable rest points are Nash equilibria

Prove `IsLyapunovStableWithin.isSymmetricNash`: if `x ∈ simplex ι` is Lyapunov stable for the
replicator equation relative to the simplex, then `x` is a symmetric Nash equilibrium
(Hofbauer–Sigmund, §2.3, folk theorem (d), p. 482; van Strien, Lemma 1.4 (3), p. 6; Miękisz,
Theorem 3, p. 10; Pražák, Theorem 7.3 (2), p. 3).

Route: suppose some pure strategy `j` has `(A *ᵥ x) j > x · A x` (1.1). By continuity there are
`r > 0` and `c > 0` with `(A y)ⱼ − y · A y > c` for every `y` within `r` of `x`. Take `ε = r` and
the `δ` that stability gives, and a point `y = (1 − η) x + η eⱼ` of the simplex within `δ` of `x`
with `η > 0`, so `yⱼ > 0`. Its forward solution stays within `r` of `x` and in the simplex (2.3), so
by the logarithmic derivative of 2.1, `γⱼ(t) ≥ yⱼ exp (c t)`, which exceeds `1` for large `t`: a
contradiction. The proof of the cited lemma in van Strien concludes only, from the growth of the
`j`-th coordinate near `x`, that a solution cannot tend to `x`, which contradicts attraction rather
than stability; the route above draws the contradiction with stability.

**Checks.**
- The converse fails: for `A = I` on two strategies, `(1/2, 1/2)` is a symmetric Nash equilibrium,
  and the solution from `(1/2 + η, 1/2 − η)` tends to `e₁` for every `η > 0`, so it is not stable.
- Membership is needed: a point at distance at least `1` from the simplex is Lyapunov stable
  relative to the simplex for every field (with `δ ≤ 1` no point of the simplex is within `δ`),
  and it is not a symmetric Nash equilibrium.
- Stability relative to a smaller set does not suffice: a rest point is Lyapunov stable relative to
  the one-point set containing it, and the unit vector `e₁` of rock–paper–scissors is a rest point
  that is not a symmetric Nash equilibrium.

*Needs:* 1.1, 2.1, 2.3, 3.1. (Proved here.)

### 3.4 Limits of interior solutions are Nash equilibria

Prove `isSymmetricNash_of_tendsto`: if `x ∈ simplex ι` has every coordinate positive, `γ` is a
forward solution of the replicator equation from `x`, and `γ t → z` as `t → ∞`, then `z` is a
symmetric Nash equilibrium (Hofbauer–Sigmund, §2.3, folk theorem (c), p. 482; Miękisz, Theorem 4,
p. 10).

Route: `z` lies in the closed simplex (2.3). If `(A *ᵥ z) j > z · A z` for some `j`, then for some
`c > 0` and all large `t`, `(A γ t)ⱼ − γ t · A γ t > c`; since `γⱼ(t) > 0` for all `t` (2.3), the
logarithmic derivative of 2.1 makes `γⱼ` grow exponentially, contradicting `γⱼ ≤ 1`.

**Checks.**
- Convergence cannot be weakened to accumulation: for rock–paper–scissors with `w < ℓ`
  (`w = 1, ℓ = 2`), the solution from `(0.3, 0.33, 0.37)` comes arbitrarily close to each unit
  vector (numerically, between times `200` and `400` its coordinates range from below `10⁻¹³⁰` to
  above `1 − 10⁻¹¹`), and the unit vectors are not symmetric Nash equilibria (Hofbauer–Sigmund,
  Theorem 2, p. 484, where the ω-limit set is the cycle of the three edges).
- Interiority is needed: for `A = [[0, 1, 0], [0, 0, 2], [0, 0, 1]]` (3.2) the solution from `e₂`
  is constant, so it converges to `e₂`, which is not a symmetric Nash equilibrium.

*Needs:* 1.1, 2.1, 2.3. (Proved here.)

### Examples

The hawk–dove matrix shifted by a constant, against the notions of LyapunovStabilityOfODEs; the
unit vectors of rock–paper–scissors as rest points that are not Nash equilibria; the heteroclinic
cycle of rock–paper–scissors with `w < ℓ`.

### Dependencies

Layers 1 and 2; LyapunovStabilityOfODEs 1.2 and 1.3 for the comparison of 3.1. No other supplier.

## Layer 4: evolutionary stability implies asymptotic stability

### 4.1 An ESS is asymptotically stable

Prove `IsESS.isAsymptoticallyStableWithin`: every ESS `x` satisfies
`IsAsymptoticallyStableWithin (replicatorField A) (simplex ι) x` (Hofbauer–Sigmund, Theorem 7 and
the sentence after it, p. 486; van Strien, Theorem 1.1, first assertion, p. 8; Sandholm, §VII.4,
p. 21; Pražák, Theorem 7.4 and the remark after it, p. 3). In particular a strict symmetric Nash
equilibrium is asymptotically stable (1.2; folk theorem (b) of Hofbauer–Sigmund, §2.3, p. 482).

Route, with `S` the support of `x` and `H` the relative entropy of the Conventions.

1. *The domain.* Let `ρ = min_{i ∈ S} x i / 2 > 0`. Every point `y` of the simplex within `ρ` of `x`
   has `y i > ρ` for `i ∈ S`, so `H` is defined and continuous on the closed `ρ`-ball of the
   simplex about `x`.
2. *Positivity (Gibbs' inequality).* For `y` in the simplex with support containing `S`, Jensen's
   inequality for the strictly concave logarithm gives
   `−H(y) = Σ_{i ∈ S} x i log (y i / x i) ≤ log Σ_{i ∈ S} y i ≤ 0`, with equality only if
   `y i / x i` is constant on `S` and `Σ_{i ∈ S} y i = 1`, that is `y = x`. So `H(y) > 0 = H(x)` for
   `y ≠ x`.
3. *The derivative.* Along a forward solution `γ` in that region, by 2.1,
   `(H ∘ γ)' = −Σ_{i ∈ S} x i ((A γ)ᵢ − γ · A γ) = −(x · A γ − γ · A γ)`, using `Σ_{i ∈ S} x i = 1`.
   By 1.3 there is `r > 0` with `x · A y > y · A y` for `y ≠ x` in the simplex within `r` of `x`.
4. *Stability.* Given `ε > 0`, put `ε' = min(ε, r, ρ)/2`. The set of points of the simplex at
   distance exactly `ε'` from `x` is compact. For `n = 1` the simplex is `{x}` and there is nothing
   to prove. For `n ≥ 2` the set is nonempty, since `ε' ≤ 1/4` and the segment from `x` to a unit
   vector `e_k` with `x k ≤ 1/2`, at distance at least `1/2` from `x`, crosses it; `H` has a
   positive minimum `μ` on it (step 2). Choose `δ ≤ ε'` with `H < μ` on the `δ`-ball of the simplex.
   A forward solution from such a point exists (2.4), stays in the simplex
   (2.3), and `H ∘ γ` does not increase while `γ` is within `ε'` of `x`; at a first time of reaching
   distance `ε'` it would have `μ ≤ H(γ t) ≤ H(γ 0) < μ`, so `γ` never reaches it.
5. *Attraction.* For such a solution `H(γ t)` decreases to a limit `L ≥ 0`. If `L > 0`, `γ` stays
   outside a ball where `H < L`, so on the compact annulus of the simplex between that ball and
   distance `ε'` the continuous function `y ↦ x · A y − y · A y` has a positive minimum `κ`, and
   `H(γ t) ≤ H(γ 0) − κ t` becomes negative. So `L = 0`, and since `H` has a positive minimum on
   every such annulus, `γ t → x`.

**Checks.**
- For the identity on three strategies each unit vector is an ESS and asymptotically stable; at
  the point `(0.6, 0.3, 0.1)`, the derivative of `H` along the field for `x = e₁` is
  `−(x · A y − y · A y) = −(0.6 − 0.46) = −0.14`, which a central difference reproduces.
- For the non-strict ESS `e₁` of `[[0, 0], [0, −1]]` the second coordinate satisfies
  `y₂' = −y₂² (1 − y₂)`, so it decays like `1/t`, not exponentially: from `y₂ = 0.3` it is about
  `0.001` at time `1000`. Asymptotic stability here is not exponential stability.
- The ESS condition is not necessary: see the asymptotically stable non-ESS of 1.4.

*Needs:* 1.3, 2.1, 2.2, 2.3, 2.4, 3.1; Mathlib `strictConcaveOn_log_Ioi`, `ConcaveOn.le_map_sum`,
`StrictConcaveOn.map_sum_eq_iff_of_pos`, `HasFDerivAt.comp_hasDerivWithinAt`,
`antitoneOn_of_hasDerivWithinAt_nonpos`, `IsCompact.exists_isMinOn`. (Proved here, after the cited
proof of van Strien.)

### 4.2 An interior ESS attracts the interior

Prove `IsESS.tendsto_of_pos`: if `x` is an ESS with every coordinate positive, then every forward
solution from a point `y` of the simplex with every coordinate positive tends to `x`
(Hofbauer–Sigmund, sentence after Theorem 7, p. 486; van Strien, Theorem 1.1, second assertion,
p. 8).

Route: by 1.5, `x · A z > z · A z` for every `z ≠ x` in the simplex, so by step 3 of 4.1 the
relative entropy `H` decreases along the whole solution, which stays in the interior (2.3). Each
term satisfies `x j log (x j / z j) ≥ x j log x j ≥ x j − 1 ≥ −1` (from `log u ≤ u − 1`), so on the
sublevel set `K = {z ∈ simplex ι | H(z) ≤ H(y)}` every coordinate is at least
`x i exp (−(H(y) + n)/x i) > 0`; `K` is compact and lies in the interior. Step 5 of 4.1, run on
`K` in place of the small ball, gives `γ t → x`.

**Checks.**
- For rock–paper–scissors with `w = 2, ℓ = 1`, the solution from `(0.05, 0.05, 0.9)` is within
  `10⁻⁶` of the centre at time `400`.
- Interiority of the initial point is needed: the faces are invariant (2.3), so a solution from a
  unit vector stays there.
- Interiority of the ESS is needed: for `A = I` on two strategies, `e₁` is an ESS but the solution
  from `(1/4, 3/4)` tends to `e₂`.

*Needs:* 1.5, 2.3, 4.1 (its steps 2, 3 and 5); Mathlib `Real.add_one_le_exp`,
`IsCompact.exists_isMinOn`. (Proved here, after the cited proof of van Strien.)

### Examples

The coordination game, the non-strict boundary ESS with its slow approach, and rock–paper–scissors
with `w > ℓ`.

### Dependencies

1.3, 1.5, Layer 2, 3.1; Mathlib `strictConcaveOn_log_Ioi`, `ConcaveOn.le_map_sum`,
`StrictConcaveOn.map_sum_eq_iff_of_pos`, `HasFDerivAt.comp_hasDerivWithinAt`,
`antitoneOn_of_hasDerivWithinAt_nonpos`, `IsCompact.exists_isMinOn`, `Real.add_one_le_exp`.

## Layer 5: symmetric payoff matrices

### 5.1 Mean payoff increases

Prove `monotoneOn_meanPayoff`: let `A` be symmetric, `x ∈ simplex ι` and `γ` a forward solution
from `x`. Then `t ↦ γ t · A γ t` is monotone on `[0, ∞)`, and strictly monotone there unless `x`
is a rest point (Pražák, Theorem 7.5, p. 4, the fundamental theorem of natural selection;
Sandholm, §VII.5.1, p. 24, for the ascent of the potential `x · A x / 2`).

Route: for symmetric `A` the derivative of `m(t) = γ t · A γ t` is `2 γ' · A γ`, and on the simplex
`2 Σᵢ γᵢ ((A γ)ᵢ − m) (A γ)ᵢ = 2 Σᵢ γᵢ ((A γ)ᵢ − m)²`, because `Σᵢ γᵢ ((A γ)ᵢ − m) = 0`. The sum is
nonnegative, and zero exactly at rest points (2.1). If `x` is not a rest point then no `γ t` is: a
rest point `γ t₀` would make the constant curve and `γ` two solutions agreeing at `t₀`, hence on
`[0, t₀]` by backward uniqueness (Mathlib `ODE_solution_unique_of_mem_Icc_left`, the field being
Lipschitz on the simplex), so `x = γ 0` would be a rest point. The derivative is then positive
on `(0, ∞)`.

**Checks.**
- For `A = [[1, 2, 0], [2, 0, 3], [0, 3, −1]]` and the solution from `(0.3, 0.3, 0.4)`, the
  central-difference derivative of the mean payoff at time `1` agrees with
  `2 Σ yᵢ ((A y)ᵢ − y · A y)²` to `10⁻⁹`, and the solution tends to the rest point `(2/3, 1/3, 0)`,
  at which `A y = (4/3, 4/3, 1)`.
- Symmetry is needed: for rock–paper–scissors with `w = 1, ℓ = 2` the mean payoff along the solution
  from `(0.3, 0.33, 0.37)` both increases and decreases in the first `30` time units.
- From a rest point the mean payoff is constant, so strict monotonicity needs its hypothesis.

*Needs:* 2.1, 2.2, 2.3; Mathlib `Matrix.IsSymm`, `monotoneOn_of_hasDerivWithinAt_nonneg`,
`strictMonoOn_of_hasDerivWithinAt_pos`, `ODE_solution_unique_of_mem_Icc_left`,
`ContDiff.locallyLipschitz`, `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact`. (Proved here.)

### 5.2 Convergence to the rest points

Prove `eventually_mem_thickening_restPoints`: let `A` be symmetric, `x ∈ simplex ι` and `γ` a
forward solution from `x`. For every `ε > 0`, `γ t` eventually lies within `ε` of the set of rest
points of the replicator field in the simplex (Sandholm, §VII.5.1, p. 24, convergence to a
connected set of rest points for dynamics with positive correlation, which by its Table II on
p. 21 the replicator equation has).

Route: apply LaSalle's invariance principle, LyapunovStabilityOfODEs 3.3, to the replicator field,
which is `C¹`, the differentiable function `V(y) = −y · A y`, and `γ`, whose values for `t ≥ 0` lie
in the bounded simplex (2.3); along `γ` the derivative of `V` is
`−2 Σᵢ γᵢ ((A γ)ᵢ − γ · A γ)² ≤ 0` (5.1). So `γ` eventually lies within every `ε` of the complete
orbits inside `Z = {y | fderiv ℝ V y (replicatorField A y) = 0}`; those orbits lie in `Z`, which
is closed, since `fderiv ℝ V y v = −2 v · A y` is continuous in `y`. If the conclusion
failed, a sequence `tₖ → ∞` with `γ tₖ` at distance at least `ε` from the rest points in the simplex
would have a subsequence converging to a point `p` of the simplex in the closure of `Z`, hence in
`Z`; and on the simplex `Z` consists of the rest points (5.1), a contradiction.

**Checks.**
- For `A = I` the rest points in the simplex are the barycentres of the faces, and the solution
  from `y` tends to the barycentre of the face spanned by the coordinates where `y` is largest,
  since `(yᵢ / yⱼ)' = (yᵢ / yⱼ)(yᵢ − yⱼ)`: from `(0.4, 0.4, 0.2)` it tends to `(1/2, 1/2, 0)`.
- Symmetry is needed: for rock–paper–scissors with `w = ℓ` the only interior rest point is the
  centre, the vertices are the only boundary rest points, and the solution from `(0.2, 0.3, 0.5)`
  keeps `x₁ x₂ x₃ = 0.03`, so it stays a fixed positive distance from all four.

*Needs:* 2.1, 2.3, 5.1; LyapunovStabilityOfODEs 3.3; Mathlib `Metric.thickening`,
`IsCompact.exists_mapClusterPt`. (Proved here.)

### Examples

The game `[[1, 2, 0], [2, 0, 3], [0, 3, −1]]` and the coordination game, against the
non-symmetric rock–paper–scissors family.

### Dependencies

Layer 2; LyapunovStabilityOfODEs 3.3; Mathlib `Matrix.IsSymm`,
`monotoneOn_of_hasDerivWithinAt_nonneg`, `strictMonoOn_of_hasDerivWithinAt_pos`,
`ODE_solution_unique_of_mem_Icc_left`, `Metric.thickening`, `IsCompact.exists_mapClusterPt`.

## Scope and ownership

This roadmap owns symmetric Nash equilibria of a symmetric two-player matrix game, evolutionarily
stable strategies with their characterizations by local superiority and, for interior strategies,
by the quadratic form on the tangent space of the simplex; the replicator equation and the
invariance of the simplex and its faces; stability relative to a set; the folk theorem in the
three forms stated above; the asymptotic stability of an ESS and the global attraction of an
interior ESS; and the increase of mean payoff and convergence to rest points for symmetric
matrices.

Taken from other roadmaps, not restated:

- RegretMinimizationAndEquilibria (Conventions) owns `simplex`, copied verbatim here, and (3.1)
  Nash equilibria of finite games; a symmetric Nash equilibrium is its notion for the symmetric
  two-player game, as 1.1 above says. Its scope excludes evolutionary dynamics.
- LyapunovStabilityOfODEs owns forward solutions (1.1), copied verbatim here; Lyapunov and
  asymptotic stability of an equilibrium in a whole normed space (1.2, 1.3); and LaSalle's
  invariance principle (3.3), applied in 5.2. The stability notions of 3.1 above differ from its
  1.2 and 1.3 in testing only initial points in a given set; 4.1 above reruns the argument of
  Lyapunov's theorem (its 3.1, 3.2) on the simplex rather than applying it, because those
  theorems need a function that is positive on a whole ball of the ambient space, which the
  relative entropy is not, and their conclusion can fail in the whole space (the Check of 3.1).
- PopulationDynamics (2.1) owns the existence of a solution on `[0, ∞)` from an a priori bound in a
  compact set and the uniqueness of solutions of a `C¹` field, used in 2.2 and 2.4. Its scope
  excludes the replicator equation and evolutionary stability.
- PotentialGamesAndPriceOfAnarchy treats pure-strategy potential games and excludes mixed strategies
  and the replicator equation; 5.1 above concerns the mixed mean payoff of a symmetric matrix and
  has no statement in common with it.

Already in the libraries: integral curves and uniqueness of solutions (Mathlib
`Mathlib/Analysis/ODE/`), Jensen's inequality and the strict concavity of the logarithm. Neither
Mathlib nor Tau Ceti has the replicator equation, evolutionary stability or game dynamics. Tau
Ceti's `Flow.exists_tendsto_atTop_of_antitone` (`TauCeti/Dynamics/Flow/Lyapunov.lean`) makes every
orbit of a flow of `ℝ` on a compact Hausdorff space converge to a point of a finite set `C`, given a
continuous function antitone along every orbit and constant along an orbit only from points of
`C`. It needs a flow on the simplex as a space of its own, which 2.4 does not construct, and a
finite set of rest points, which 5.2 does not assume; 5.2 states the weaker conclusion for every
symmetric matrix and takes it from LaSalle's principle instead.

Not treated here: the existence of symmetric Nash equilibria; bimatrix (two-population) replicator
dynamics and the symmetrized game; evolutionarily stable sets and neutral stability;
Zeeman's classification of three-strategy phase portraits and the full stability theory of
rock–paper–scissors beyond the Checks above; permanence; Hofbauer's equivalence of the replicator
equation with Lotka–Volterra equations; best-response, logit, Brown–von Neumann–Nash and imitation
dynamics; discrete-time and stochastic evolutionary dynamics; and convergence to a single rest
point for symmetric matrices.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex` and
  `Convexity.StdSimplex.range_toFun_comp_weights` (the range of the weights map is the set of
  vectors with nonnegative coordinates and sum `1`, for a finite index type).
  `Mathlib/Geometry/Convex/ConvexSpace/Topology.lean`:
  `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights` (the weights map is a closed
  embedding, for a finite index type).
  `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`:
  `Convexity.StdSimplex.compactSpace` (the simplex over `ℝ` is compact), so `simplex ι` is compact.
- `Mathlib/Data/Matrix/Mul.lean`: `dotProduct` (`⬝ᵥ`) and `Matrix.mulVec` (`*ᵥ`).
  `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`: `Matrix.IsSymm` (`Aᵀ = A`).
- `Mathlib/Analysis/ODE/Basic.lean`: `IsIntegralCurveOn γ v s`, that is
  `∀ t ∈ s, HasDerivWithinAt γ (v t (γ t)) s t`, and `IsIntegralCurve γ v`, that is
  `∀ t, HasDerivAt γ (v t (γ t)) t`. `Mathlib/Analysis/ODE/ExistUnique.lean`:
  `ODE_solution_unique_of_mem_Icc_left` (two solutions on `[a, b]` with derivatives within
  `(−∞, t]`, agreeing at `b`, in a set where the field is `K`-Lipschitz, agree on `[a, b]`).
- `Mathlib/Analysis/Calculus/ContDiff/RCLike.lean`: `ContDiff.locallyLipschitz`.
  `Mathlib/Topology/Algebra/MetricSpace/Lipschitz.lean`:
  `LocallyLipschitzOn.exists_lipschitzOnWith_of_compact` (a locally Lipschitz function is Lipschitz
  on each compact set).
- `Mathlib/Analysis/Calculus/Deriv/Basic.lean`: `HasDerivWithinAt.union` (derivatives within `s`
  and within `t` with the same value give one within `s ∪ t`).
  `Mathlib/Analysis/Calculus/Deriv/Comp.lean`: `HasFDerivAt.comp_hasDerivWithinAt` (chain rule).
  `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `monotoneOn_of_hasDerivWithinAt_nonneg`,
  `strictMonoOn_of_hasDerivWithinAt_pos` and `antitoneOn_of_hasDerivWithinAt_nonpos` (on a convex
  set, a continuous function whose derivative within the interior is nonnegative, positive or
  nonpositive there is monotone, strictly monotone or antitone).
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_hasDerivAt_right` (the derivative of `t ↦ ∫ a..t, g` at a point of
  continuity of `g`).
- `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConcaveOn_log_Ioi`.
  `Mathlib/Analysis/Convex/Jensen.lean`: `ConcaveOn.le_map_sum` (Jensen's inequality for a concave
  function and nonnegative weights of sum `1`) and `StrictConcaveOn.map_sum_eq_iff_of_pos` (its
  equality case for positive weights: all points equal).
  `Mathlib/Analysis/Complex/Exponential.lean`: `Real.exp` and `Real.add_one_le_exp`
  (`x + 1 ≤ exp x`, equivalently `log u ≤ u − 1` for `u > 0`).
- `Mathlib/Topology/MetricSpace/Thickening.lean`: `Metric.thickening`.
  `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`: `Metric.infDist`.
  `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn`.
  `Mathlib/Topology/Compactness/Compact.lean`: `IsCompact.exists_mapClusterPt`.

### From Tau Ceti

Nothing is used directly. PopulationDynamics 2.1 derives its existence statement from Tau Ceti's
maximal integral curves.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, copied
  verbatim into `Suggested.lean`.
- Section 3.1: `IsNash u σ` for a finite game with utilities `u`, used only in the comparison of
  1.1.

### From TauCetiRoadmap.LyapunovStabilityOfODEs

- Section 1.1: `forwardSolutions f x`, copied verbatim into `Suggested.lean`.
- Sections 1.2 and 1.3: `IsLyapunovStable f x₀` and `IsAsymptoticallyStable f x₀`, used only in the
  comparison of 3.1.
- Section 3.3: `eventually_mem_thickening_completeOrbitSet` (LaSalle's invariance principle): for a
  `C¹` field `f` on a finite-dimensional real normed space, a differentiable `V` and a forward
  solution `γ` with bounded values on `[0, ∞)` along which `fderiv ℝ V (γ t) (f (γ t)) ≤ 0`, for
  every `ε > 0` the point `γ t` eventually lies in the `ε`-thickening of the union of the complete
  orbits of `f` contained in `{x | fderiv ℝ V x (f x) = 0}`.

### From TauCetiRoadmap.PopulationDynamics

- Section 2.1: for a `C¹` vector field on a real Banach space, a compact set `K` and a point `x₀`
  such that every solution on a bounded interval `[0, T)` from `x₀` stays in `K`, there is a
  solution on `[0, ∞)` from `x₀`; two solutions on `[0, T]` with the same initial value agree; both
  hold backwards in time.

## References

- Josef Hofbauer and Karl Sigmund, *Evolutionary game dynamics*, Bulletin of the American
  Mathematical Society 40 (2003), 479–519; the reprint on Josef Hofbauer's page at the University
  of Vienna. Cited: §2.1, equation (2) (p. 481); §2.2, equations (3)–(5), the invariance of the
  faces and the definitions of stability (pp. 481–482); §2.3, the folk theorem (a)–(d) (p. 482);
  equation (8) (p. 483); Theorem 2 (p. 484); §2.6, conditions (16)–(17) and Theorem 7 with the
  sentence after it (p. 486). A survey: it states these results with references and without
  proofs.
- Sebastian van Strien, *Dynamics of Learning and Iterated Games*, lecture notes, version of
  January 26, 2024, on the author's page at Imperial College London. Cited: equations (1.1)–(1.3)
  and (1.6), Example 1.1, Lemma 1.1 and Lemma 1.2, Lemma 1.3 with inequality (1.5) and its proof,
  Examples 1.3 and 1.4, Lemma 1.4, Example 1.7, Theorem 1.1, Example 1.10 (pp. 1–13). The proofs
  there are the source of the routes of 1.3, 4.1 and 4.2.
- William H. Sandholm, *Evolutionary game theory*, survey of November 12, 2007, on the author's page
  at the University of Wisconsin. Cited: §VII.4 with equation (18) (pp. 21–22) and §VII.5.1
  (pp. 23–24).
- Jacek Miękisz, *Evolutionary game theory and population dynamics*, arXiv:q-bio/0703062v1 (2007).
  Cited: §4 with Theorems 2, 3 and 4 (pp. 9–11).
- Dalibor Pražák, lecture notes *7. Game theory and replicator dynamics*, last updated 2022-05-01,
  on the author's course page at Charles University. Cited: the definition of ESS (p. 2),
  Theorems 7.2–7.5 and the example on p. 3 (pp. 3–4).
- The results carry their customary attributions: J. Maynard Smith and G. R. Price (evolutionary
  stability), P. D. Taylor and L. B. Jonker (the replicator equation), and J. Hofbauer,
  P. Schuster and K. Sigmund (an ESS is asymptotically stable), as named in Hofbauer–Sigmund;
  R. A. Fisher for the fundamental theorem of natural selection. These works were not consulted,
  and no locator is given for them.
