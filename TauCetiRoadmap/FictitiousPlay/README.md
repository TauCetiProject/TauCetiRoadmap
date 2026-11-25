# Roadmap: fictitious play in two-player matrix games

**Summary.** Fictitious play is the oldest learning rule for games. Two players repeat a game
with finitely many actions each; in every round each player picks a pure action that is a best
response to the empirical mixture of the opponent's earlier actions. This roadmap treats it for
bimatrix games, in which the row player receives `A a b` and the column player `B a b`, both
maximizing. Fictitious play is a property of a sequence of action pairs, not a single algorithm:
the first round is arbitrary, ties may be broken in any way, and every theorem holds for every
sequence with the property. Action sets are finite and nonempty throughout.

The first facts are general. Fictitious-play sequences exist from every first pair of actions.
If the empirical mixtures of both players converge, the limit pair is a mixed Nash equilibrium.
A strict pure equilibrium, once played, is played forever. Each player's realized payoff never
exceeds the best payoff it could have had by playing one action throughout, so its regret against
some action is nonnegative; but in a two-by-two coordination game there is a fictitious-play
sequence whose regret against one action after `T` rounds is exactly `⌊T/2⌋`, so fictitious play is
not a no-regret procedure.

The central result is Robinson's theorem. In a zero-sum game, the row player's best payoff
against the column player's empirical mixture and the column player's best concession against the
row player's mixture both converge to the value of the game, so their difference, the duality gap,
tends to `0`, and every cluster point of the pair of empirical mixtures is a saddle point. It is
proved for Robinson's vector systems, with a threshold that depends only on the matrix and the
accuracy, by induction on the number of actions.

Outside zero-sum games convergence can fail. In Shapley's three-action game, every
fictitious-play sequence whose two first-round actions differ never plays a diagonal pair, and
the empirical mixtures of the two players do not both converge. Convergence does hold in two further
classes. If the game
is solvable by iterated strict dominance by pure actions, play is eventually the surviving pair. If
the game has a weighted potential with positive weights, the sum of the two players' best-response
gaps at the empirical mixtures tends to `0`: the beliefs approach the equilibria, although the
mixtures need not converge.

The roadmap builds on RegretMinimizationAndEquilibria, whose probability simplex, payoff of a
matrix game and regret it uses unchanged; that roadmap's no-regret dynamics do not cover fictitious
play, which has linear regret in the coordination game. It builds on Mathlib for finite suprema,
the standard simplex and its compactness, and the convergence of `Σ 1/n²`.

Layer 1 defines play counts, empirical mixtures and fictitious play and proves the general facts.
Layer 2 is Robinson's theorem and its consequences for zero-sum games. Layer 3 is Shapley's
example and the two convergence classes.

## Conventions

- **Games.** Action types `ι` (rows) and `κ` (columns) with `[Fintype]`, `[DecidableEq]` and
  `[Nonempty]`; payoff matrices `A B : Matrix ι κ ℝ`; both players maximize. A zero-sum game is
  `(A, -A)`. Suprema over the finite action types are written `⨆ a, f a` (bounded because the type
  is finite and nonempty); `⨆` over an empty type would be the junk value `0` in `ℝ`, which the
  `[Nonempty]` hypotheses exclude.
- **Copied definitions.** `simplex ι`, the weight vectors of Mathlib's `Convexity.StdSimplex`
  (equivalently the nonnegative vectors of sum `1`, by
  `Convexity.StdSimplex.range_toFun_comp_weights`), and
  `regret p u T a = Σ_{t<T} (u t a − p t ⬝ᵥ u t)` are RegretMinimizationAndEquilibria's
  (its Conventions and 1.1), copied verbatim into `Suggested.lean` with that citation because
  a roadmap's Lean file does not import another roadmap's module.
- **Payoff.** `payoff A x y` stands for the expected payoff `x ⬝ᵥ (A *ᵥ y)`, which is
  RegretMinimizationAndEquilibria's `Matrix.payoff A x y` (its 2.1). That roadmap declares
  `Matrix.payoff` in the root namespace, so `Suggested.lean` writes the dot product out instead of
  declaring the name a second time.
- **Play sequences.** A play sequence is a pair `i : ℕ → ι`, `j : ℕ → κ` of pure actions in rounds
  `0, 1, 2, …`. `playCount i t a` is the number of rounds `s < t` with `i s = a`, cast to `ℝ`;
  `empiricalMix i t = (t : ℝ)⁻¹ • playCount i t`. At `t = 0` both are the zero vector
  (`0⁻¹ = 0`), which is not in the simplex; for `t ≥ 1` the empirical mixture lies in the simplex.
  Every quantitative statement uses `t ≥ 1` or a limit. Convergence of mixtures is in `ι → ℝ` with
  the product topology (the topology of any norm); a limit of mixtures lies in the simplex because
  the simplex is closed.
- **Fictitious play.** `IsFictitiousPlay A B i j` says: for every `t ≥ 1`,
  `(A *ᵥ playCount j t) (i t)` is the largest coordinate of `A *ᵥ playCount j t`, and
  `(playCount i t ᵥ* B) (j t)` is the largest coordinate of `playCount i t ᵥ* B`. Play is
  simultaneous, each player answers the opponent's counts of the rounds before `t` (equivalently,
  for `t ≥ 1`, the empirical mixture, by positive scaling), round `0` is unconstrained, and every
  tie-break is admissible. There are no prior ("fictitious past") weights. In the zero-sum game
  `(A, -A)` the column player maximizes `-A`, that is, minimizes the coordinates of
  `playCount i t ᵥ* A`.
- **Nash equilibria** appear unfolded, in the shape of RegretMinimizationAndEquilibria's
  `Matrix.exists_mixedNash`: `x ∈ simplex ι`, `y ∈ simplex κ`,
  `payoff A x' y ≤ payoff A x y` for every `x' ∈ simplex ι` and `payoff B x y' ≤ payoff B x y` for
  every `y' ∈ simplex κ`. A pure pair `(a, b)` is a strict equilibrium when `A a' b < A a b` for
  every `a' ≠ a` and `B a b' < B a b` for every `b' ≠ b`.
- **The value** of a matrix `A` is `⨆ x : simplex ι, ⨅ y : simplex κ, payoff A x y`, the left side
  of the minimax equality of RegretMinimizationAndEquilibria 2.1.

**Checks.**

- `simplex (Fin 2)` contains `(1/2, 1/2)` and not `(2, −1)`; `empiricalMix i 0` is the zero vector
  for every `i`, so round `0` has no mixture.
- Round `0` is unconstrained: in the prisoner's dilemma `A = [[3, 0], [4, 1]]`, `B = Aᵀ` the
  first pair `(C, C)` is admissible although `C` is never a best response, and round `1` is then
  `(D, D)`. A variant that also asked round `0` to answer the (zero) counts would change nothing,
  since every action answers the zero vector.

## Layer 1: fictitious play in bimatrix games

### 1.1 Existence, and limits are equilibria

Define `playCount`, `empiricalMix` and `IsFictitiousPlay` as in the Conventions. Prove
`exists_isFictitiousPlay`: for all `A`, `B` and every first pair `(a₀, b₀)` there is a
fictitious-play sequence with `i 0 = a₀` and `j 0 = b₀`. Prove `isNash_of_tendsto_empiricalMix`:
if `i`, `j` is fictitious play of `(A, B)` and `empiricalMix i t → x`, `empiricalMix j t → y`, then
`(x, y)` is a mixed Nash equilibrium (in the unfolded form of the Conventions). (Levin, *Learning
in Games*, Proposition 1, p. 3, proof p. 4, with prior weights; Daskalakis, MIT 6.853 Lecture 4,
Definition 1, p. 4-2, for the simultaneous form from round `1`. Proved here.)

Route. *Existence.* Define `(i t, j t)` by strong recursion on `t`: `(a₀, b₀)` at `t = 0`, and for
`t ≥ 1` a maximizer of `A *ᵥ playCount j t` and one of `playCount i t ᵥ* B`, which exist by
`Finset.exists_max_image` on the nonempty finite types; the counts at `t` depend only on rounds
`< t`. *Limits.* For `t ≥ 1` the mixture is nonnegative with sum `1`, so by
`Convexity.StdSimplex.range_toFun_comp_weights` it lies in the simplex, which is closed; hence
`x`, `y` lie in the simplex. Suppose `x a > 0` and `(A *ᵥ y) a' > (A *ᵥ y) a + 2δ` with `δ > 0`.
By continuity of `A *ᵥ ·` there is `T₀ ≥ 1` such that, for `t ≥ T₀`, coordinate `a'` of
`A *ᵥ empiricalMix j t` exceeds coordinate `a`; multiplying by `t` gives the same for
`playCount j t`, so
`i t ≠ a` for `t ≥ T₀`, `playCount i t a ≤ T₀` and `empiricalMix i t a ≤ T₀ / t → 0`, contradicting
`x a > 0`. So every `a` with `x a > 0` maximizes `A *ᵥ y`, and
`payoff A x y = Σ_a x a (A *ᵥ y) a = max (A *ᵥ y) ≥ Σ_a x' a (A *ᵥ y) a = payoff A x' y` for every
`x'` in the simplex. The column player is symmetric.

**Checks.**

- The coordination sequence of 1.3 has mixtures tending to `(1/2, 1/2)` for both players, the
  mixed equilibrium of that game, although every realized pair is a miscoordination.
- Matching pennies `A = [[1, −1], [−1, 1]]`, `B = −A`: by 2.2 every cluster point of the mixtures
  is a saddle point, and the only one is `((1/2, 1/2), (1/2, 1/2))`; the mixtures lie in a compact
  set, so they converge to it, consistently with this target.

*Needs:* Mathlib `Finset.exists_max_image`, `Convexity.StdSimplex.range_toFun_comp_weights`;
RegretMinimizationAndEquilibria `simplex` (copied) and its expected payoff (written out).

### 1.2 Strict pure equilibria are absorbing

Prove `isFictitiousPlay_absorbing`: if `i`, `j` is fictitious play of `(A, B)` and the pair
`(i t, j t)` played at some round `t` is a strict equilibrium, then `i s = i t` and `j s = j t`
for every `s ≥ t`. Round `0` is included. (Levin, Proposition 2, p. 6, with prior weights.
Proved here.)

Route. Induction on `s ≥ t`. Suppose `(i s, j s) = (i t, j t)`. Then
`playCount j (s + 1) = playCount j s + Pi.single (j t) 1`, so
`(A *ᵥ playCount j (s + 1)) a = (A *ᵥ playCount j s) a + A a (j t)`. The action `i t` maximizes the
first term (by fictitious play at `s` when `s ≥ 1`; at `s = 0` the vector is `0` and every action
maximizes it) and strictly maximizes the second, so it is the unique maximizer of the sum, and
`i (s + 1) = i t`. The column player is the same with `B`.

**Checks.**

- Strictness is needed: for `A = B = [[1, 1], [1, 0]]` the pair `(0, 0)` is a non-strict
  equilibrium, and from `(0, 0)` at round `0` a fictitious-play sequence plays row `1` at round `1`
  (the row is indifferent against column `0`).
- For all 6561 two-by-two games with entries in `{−1, 0, 1}` and every fictitious-play sequence
  to round `6`, and for all 4096 two-by-three games with entries in `{0, 1}` and every sequence to
  round `5`, a strict pure equilibrium played at a round before the last (round `0` included) is
  played again at the next round.
- Prisoner's dilemma `A = [[3, 0], [4, 1]]`, `B = Aᵀ`: every sequence is at `(D, D)` from round `1`
  on, whatever round `0` was.

*Needs:* 1.1 (definitions).

### 1.3 Regret

Prove `exists_zero_le_regret`: for fictitious play of `(A, B)` and every `T`, there is an action
`a` with `0 ≤ regret (fun t ↦ Pi.single (i t) 1) (fun t ↦ A *ᵥ Pi.single (j t) 1) T a`, and an
action `b` with the same for the column player, with plays `Pi.single (j t) 1` and payoff
vectors `Pi.single (i t) 1 ᵥ* B`. Here the plays and payoff vectors are those of the online protocol
of
RegretMinimizationAndEquilibria, so `regret … T a = (A *ᵥ playCount j T) a − Σ_{s<T} A (i s) (j s)`.
(Levin, Lemma 1, p. 7, in an asymptotic form with prior weights. Proved here.)

Define `coordinationPath t = t mod 2` in `Fin 2` and prove `coordination_regret`: in the
coordination game `A = B = 1` (the identity of `Fin 2`), the sequence `i t = t mod 2`,
`j t = (t + 1) mod 2` is fictitious play; the row player's regret against action `0` after `T`
rounds is `⌊T/2⌋` (the natural-number quotient `T / 2`, cast to `ℝ`); and both empirical mixtures
tend to `(1/2, 1/2)`. (Levin, Example "Mis-coordination", p. 5, with prior weights `(1/2, 0)`;
here the ties at even rounds are broken against coordination instead. Proved here.)

Route. *Nonnegative regret.* Put `E T = ⨆ a, (A *ᵥ playCount j T) a` and
`R T = Σ_{s<T} A (i s) (j s)`. For every `T`,

    E (T + 1) ≥ (A *ᵥ playCount j (T + 1)) (i T) = (A *ᵥ playCount j T) (i T) + A (i T) (j T)
              = E T + A (i T) (j T),

by fictitious play at `T ≥ 1` and because the vector is `0` at `T = 0`.
With `E 0 = R 0 = 0` this gives `E T ≥ R T`; take `a` a maximizer. The column player is the same
statement for the transposed game: `IsFictitiousPlay A B i j` says the same as
`IsFictitiousPlay Bᵀ Aᵀ j i`. *Coordination.* The column's counts of rounds `< t` are
`(⌊t/2⌋, ⌈t/2⌉)` and the row's are `(⌈t/2⌉, ⌊t/2⌋)`; at odd `t` the best responses are unique and
equal to `i t = 1`, `j t = 0`; at even `t ≥ 2` both actions tie. Every realized payoff is `0`, and
the payoff of action `0` at round `t` is `1` exactly when `t` is odd, so the regret against `0` is
the number of odd `t < T`, which is `⌊T/2⌋`. The mixtures are within `1/(2T)` of `1/2`.

**Checks.**

- The coordination sequence satisfies the predicate for all `t < 400`; ties occur exactly at even
  `t ≥ 2`; its regret against action `0` is `⌊T/2⌋` and against action `1` is `⌈T/2⌉` for all
  `T < 400`; every realized payoff is `0`.
- `E T ≥ R T` for both players and every `T ≤ 7` on every fictitious-play sequence to round `6`
  of each of the 6561 two-by-two games with entries in `{−1, 0, 1}`.

*Needs:* 1.1 (definitions); RegretMinimizationAndEquilibria `regret` (copied).

### Examples

- In the online protocol of RegretMinimizationAndEquilibria, a fictitious player plays the pure
  action with the largest cumulative payoff over the earlier rounds (follow the leader); by 1.3
  its regret can grow linearly in `T`, so the bounds of that roadmap's Layer 1
  have no counterpart for it.

### Dependencies

1.1 needs Mathlib, the copied `simplex` and the expected payoff. 1.2 needs the definitions of
1.1.
1.3 needs the definitions of 1.1 and the copied `regret`.

## Layer 2: zero-sum games

Robinson (1951) proved the theorem of 2.1 and deduced 2.2 for the procedure proposed by Brown
(as recalled by Daskalakis, Lecture 4, p. 4-1). The step locators below are to the open exposition
of Cloud, Wang and Kerr (arXiv:2212.09941v1, Appendix B), which follows Robinson's four lemmas
for a perturbed system; Robinson's paper is credited for the theorem and the method as a whole,
without page locators. The identity of step (R1) and the constants are derived here.

### 2.1 Robinson's theorem for vector systems

Define `IsVectorSystem A U V i j` for `U : ℕ → κ → ℝ`, `V : ℕ → ι → ℝ`, `i : ℕ → ι`,
`j : ℕ → κ`: `⨅ b, U 0 b = ⨆ a, V 0 a`; `U (t + 1) = U t + A (i t) ·` (the row `i t` of `A`);
`V (t + 1) = V t + A · (j t)` (the column `j t`); `i t` maximizes `V t` and `j t` minimizes `U t`,
for every `t`. This is Robinson's vector system as recalled by Cloud, Wang and Kerr
(Definition 1 and the remark after Definition 2, p. 20), with the chosen row and column indexed by
the time of the vectors they are chosen from. Prove `robinson_vectorSystem`: for every `A` and
`ε > 0` there is `T` such that every vector system of `A` satisfies `max V t − min U t ≤ ε t`
for all `t ≥ T`. (Robinson 1951; Cloud–Wang–Kerr, Lemma 4, p. 21, and its proof, pp. 21–23.
Proved here.)

Route. Write `max V t = ⨆ a, V t a`, `min U t = ⨅ b, U t b`, `D t = max V t − min U t` and
`α = max_{a,b} |A a b|`.

- (R0) Each coordinate of `U` and `V` changes by at most `α` per step, hence so do `max V`,
  `min V`, `max U`, `min U`, and `D` changes by at most `2α`. `D 0 = 0` by the first axiom, so
  `D t ≤ 2αt`.
- (R1) `min V t ≤ max U t` for every `t`. Let `X`, `Y` be the counts of `i`, `j` over the rounds
  `< t` (nonnegative, each of total `t`). Then `V t = V 0 + A *ᵥ Y` and `U t = U 0 + X ᵥ* A`, so
  `X ⬝ᵥ (V t − V 0) = X ⬝ᵥ (A *ᵥ Y) = (U t − U 0) ⬝ᵥ Y`. Hence
  `t · min V t ≤ X ⬝ᵥ V t = U t ⬝ᵥ Y − U 0 ⬝ᵥ Y + X ⬝ᵥ V 0`, and the right side is at most
  `t (max U t − min U 0 + max V 0) = t · max U t`, using `min U 0 = max V 0`; divide by `t ≥ 1`.
  At `t = 0`, `min V 0 ≤ max V 0 = min U 0 ≤ max U 0`. (Cloud–Wang–Kerr, Lemma 1, p. 20, state the
  weaker
  `liminf (max V t − min U t)/t ≥ 0`.)
- (R2) Call row `a` *eligible* on `[s, s + τ]` if `V t₁ a = max V t₁` for some `t₁` in the
  interval, and column `b` eligible if `U t₁ b = min U t₁` for some such `t₁`. If every row is
  eligible, `max V (s + τ) − min V (s + τ) ≤ 2ατ`: for `a` minimizing `V (s + τ)` and its `t₁`,
  `V (s + τ) a ≥ max V t₁ − α (s + τ − t₁) ≥ max V (s + τ) − 2ατ`. If every column is eligible,
  `max U (s + τ) − min U (s + τ) ≤ 2ατ` in the same way. (Cloud–Wang–Kerr, Definition 3 and
  Lemma 2, pp. 20–21, with `2α(τ + 1)` for their perturbed system.)
- (R3) If every row and every column is eligible on `[s, s + τ]`, then
  `D (s + τ) = (max V − min V) + (min V − max U) + (max U − min U) ≤ 4ατ` at `s + τ`, by (R2) and
  (R1). (Cloud–Wang–Kerr, Lemma 3, p. 21.)
- (R4) Deleting an action. Suppose row `m` is not eligible on `[s, s + τ]`. Then `i (s + r) ≠ m`
  for `r ≤ τ`, and `ι` has at least two elements. Let `A′` be `A` without row `m` (rows
  `{a // a ≠ m}`, nonempty), `c = D s`, `U′ r = U (s + r) + c`, `V′ r` the restriction of
  `V (s + r)` to the rows `≠ m`, `i′ r = i (s + r)`, `j′ r = j (s + r)` for `r ≤ τ`, continued
  for `r > τ` by choosing maximizers of `V′ r` and minimizers of `U′ r` and updating by the two
  step rules. This is a vector system of `A′`: `min U′ 0 = min U s + c = max V s = max V′ 0`
  because the maximum of `V s` is attained off `m`; the step rules hold since `i (s + r) ≠ m`; the
  maximality and minimality conditions are inherited for `r ≤ τ` and hold by construction after.
  Since `m` does not maximize `V (s + τ)`, `max V (s + τ) = max V′ τ`, so
  `D (s + τ) = (max V′ τ − min U′ τ) + D s`. A column `m` not eligible is deleted in the same way
  with `U′ r` the restriction of `U (s + r)` and `V′ r = V (s + r) − c`. (Cloud–Wang–Kerr, proof of
  Lemma 4, display (3) and the construction after it, pp. 21–22.)
- (R5) Induction. The claim is proved by strong induction on `card ι + card κ`, for all finite
  nonempty action types at once, with `T` uniform over all vector systems of the given matrix.
  Given `A` and `ε`, apply the induction hypothesis with `ε/2` to each of the finitely many
  matrices obtained by deleting one row (when `card ι ≥ 2`) or one column (when `card κ ≥ 2`), and
  let `t* ≥ 1` be at least all the resulting thresholds (`t* = 1` for a one-by-one matrix). By (R4)
  and the hypothesis at time `t*`: if some row or column is not eligible on `[s, s + t*]`, then
  `D (s + t*) ≤ D s + (ε/2) t*`.
- (R6) Blocks. Write `t = r + q t*` with `0 ≤ r < t*` and consider the blocks
  `[r + (k − 1) t*, r + k t*]`, `k = 1, …, q`. If some block has every row and column eligible, let
  `k₀` be the last one: by (R3) `D (r + k₀ t*) ≤ 4α t*`, and by (R5) on each block after it
  `D t ≤ 4αt* + (ε/2)(q − k₀) t* ≤ 4αt* + (ε/2) t`. Otherwise (R5) on every block and (R0) give
  `D t ≤ D r + (ε/2) q t* ≤ 2αr + (ε/2) t ≤ 2αt* + (ε/2) t`. In both cases
  `D t ≤ 4αt* + (ε/2) t ≤ ε t` once `t ≥ 8αt*/ε`, so `T = ⌈8αt*/ε⌉₊` works.

The degenerate cases are covered: for a one-by-one matrix every row and column is always eligible
and the first case of (R6) applies; for `A = 0`, `U` and `V` are constant and `D t = 0`.

**Checks.**

- Exact check of (R0)–(R4) on nine matrices (matching pennies, `[[2, 0], [0, 1]]`,
  `[[1, 0], [0, 0]]`, `[[0, 1], [2, −1]]`, the one-column `[[1], [0]]`, the one-by-one `[[3]]`,
  rock-paper-scissors, Daskalakis's `[[2, 1, 0], [2, 0, 3], [−1, 3, −3]]` and the zero matrix),
  three initial pairs `(U 0, V 0)` each (including nonzero ones with `min U 0 = max V 0`), every
  admissible choice of `i t`, `j t` and every interval up to round `8` (round `5` for the two
  matrices with many ties): `D 0 = 0`, steps of `D` at most `2α`, (R1), both halves of (R2), (R3),
  and for (R4) the axioms of the restricted system and the identity
  `D (s + τ) = (max V′ τ − min U′ τ) + D s`.
- The first axiom is what makes `T` uniform: for `A = 0` and any `c > 0`, `U t = 0` and
  `V t = (c, …, c)` satisfy every other axiom with `D t = c` for all `t`, so no single `T` serves
  all `c`. Nonzero initial vectors such as `U 0 = (1, 2)`, `V 0 = (1, 0)` are allowed.

*Needs:* Mathlib `Finset.exists_max_image`, `ciSup_le`, `le_ciSup`, `ciInf_le`, `le_ciInf`,
`Finite.bddAbove_range`, `Finite.bddBelow_range`, `Nat.strong_induction_on`.

### 2.2 Fictitious play in zero-sum games

Prove `tendsto_fictitiousPlay_zeroSum`: if `i`, `j` is fictitious play of `(A, -A)`, then

- the duality gap `⨆ a, (A *ᵥ empiricalMix j t) a − ⨅ b, (empiricalMix i t ᵥ* A) b` tends to `0`;
- the upper bound `⨆ a, (A *ᵥ empiricalMix j t) a` and the lower bound
  `⨅ b, (empiricalMix i t ᵥ* A) b` both tend to the value
  `⨆ x : simplex ι, ⨅ y : simplex κ, payoff A x y`;
- every cluster point `(x, y)` of `t ↦ (empiricalMix i t, empiricalMix j t)` (in the product
  topology) is a saddle point: `x`, `y` lie in the simplices and
  `payoff A x' y ≤ payoff A x y ≤ payoff A x y'` for all `x'`, `y'` in them.

Cluster points exist, since the mixtures lie in the compact simplices for `t ≥ 1`; the mixtures
themselves are not claimed to converge. (Robinson 1951; Daskalakis, Lecture 4, Claim 1, p. 4-2,
Theorem 1 and Corollary 1, pp. 4-3 to 4-4. Proved here from 2.1.)

Route. With `U t = playCount i t ᵥ* A` and `V t = A *ᵥ playCount j t`, the sequence is a vector
system of `A`: at `t = 0` both vectors are `0`, so the first axiom holds and every action
maximizes or minimizes; the step rules hold because
`playCount i (t + 1) = playCount i t + Pi.single (i t) 1`; for `t ≥ 1`, `j t` maximizes
`playCount i t ᵥ* (−A)`, that is, minimizes `U t`. For `t ≥ 1`, scaling by `t⁻¹ > 0` gives
`D t / t` as the duality gap. Put `x̄ = empiricalMix i t`, `ȳ = empiricalMix j t` and `v` the
value. Then
`⨅ b, (x̄ ᵥ* A) b ≤ v ≤ ⨆ a, (A *ᵥ ȳ) a`: the first because `⨅ b, (x̄ ᵥ* A) b ≤ payoff A x̄ y` for
every `y` in the simplex (an average is at least the least coordinate), so it is at most
`⨅ y, payoff A x̄ y ≤ v`; the second because `payoff A x ȳ ≤ ⨆ a, (A *ᵥ ȳ) a` for every `x`, so
`⨅ y, payoff A x y` is at most it for every `x`. These `⨆` and `⨅` over the simplices are of
families bounded by `α = max |A a b|` (a payoff of two mixtures is an average of entries) over
nonempty types (a vertex is in the simplex), so `le_ciSup`, `ciSup_le`, `ciInf_le` and `le_ciInf`
apply. So `0 ≤ gap ≤ ε` for `t ≥ max T 1` by 2.1 with `ε`, which is the first clause, and
`v ≤ upper ≤ v + gap`, `v − gap ≤ lower ≤ v` squeeze both bounds to `v`. For the third, the gap
is a continuous function `g` of `(x̄, ȳ)` (a finite `⨆` is a `Finset.sup'` by
`Finset.sup'_univ_eq_ciSup`, continuous by `ContinuousAt.finset_sup'_apply`; `⨅` likewise); a
cluster point `(x, y)` is the limit of a subsequence (`MapClusterPt.tendsto_subseq`, the space
being first countable), along which `g` tends both to `g (x, y)` and to `0`, so `g (x, y) = 0`;
along it the mixtures eventually lie in the closed simplices, so `x`, `y` lie in them; and
`g (x, y) = 0` with `⨅ b, (x ᵥ* A) b ≤ payoff A x y ≤ ⨆ a, (A *ᵥ y) a` forces equality, which
gives both saddle inequalities. No minimax theorem is used; the squeeze proves `⨆ ⨅ = ⨅ ⨆` as a
by-product.

**Checks.**

- On every fictitious-play sequence to round `9` of matching pennies (value `0`),
  rock-paper-scissors (value `0`), `[[2, 0], [0, 1]]` (value `2/3`) and `[[1], [0]]` (value `1`),
  the lower bound is at most the value and the value at most the upper bound at every `t ≥ 1`.
- Rock-paper-scissors and Daskalakis's three-by-three game from the first pair `(0, 0)` with
  first-index tie-breaking: the exact gap is `≥ 0` at every `t ≤ 20000` and below `1/20` at
  `t = 20000`.
- At `t = 0` the junk value matters: both bounds are `0`, which is not the value of
  `[[2, 0], [0, 1]]`; the statement is about limits only.

*Needs:* 2.1; 1.1 (definitions); Mathlib `ciSup_le`, `le_ciSup`, `ciInf_le`, `le_ciInf`,
`MapClusterPt.tendsto_subseq`, `tendsto_nhds_unique`, `ContinuousAt.finset_sup'_apply`,
`tendsto_of_tendsto_of_tendsto_of_le_of_le`,
`Convexity.StdSimplex.range_toFun_comp_weights`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`.

### Examples

- Matching pennies and rock-paper-scissors (value `0`); `[[2, 0], [0, 1]]`, whose unique saddle
  point is `((1/3, 2/3), (1/3, 2/3))` with value `2/3`, the example of
  RegretMinimizationAndEquilibria 2.1.
- The bound of 2.1 also proves the minimax equality: the route of 2.2 shows
  `⨅ b, (x̄ ᵥ* A) b ≤ ⨆ x, ⨅ y, payoff A x y ≤ ⨅ y, ⨆ x, payoff A x y ≤ ⨆ a, (A *ᵥ ȳ) a` with the
  outer gap tending to `0`.

### Dependencies

2.1 needs Mathlib only. 2.2 needs 2.1 and the definitions of 1.1.

## Layer 3: non-convergence and convergence in special classes

### 3.1 Shapley's game

Define `shapleyRow a b = 1` if `b = a + 1` in `Fin 3`, else `0`, and `shapleyCol a b = 1` if
`a = b + 1`, else `0` (arithmetic of `Fin 3` wraps, `2 + 1 = 0`). With rows and columns
`R, S, P = 0, 1, 2` these are the payoffs of Shapley's game as given by Levin (p. 6); the game is
symmetric, `shapleyCol = shapleyRowᵀ`, and not zero-sum. Prove `shapley_not_tendsto`: if `i`, `j`
is fictitious play of this game and `i 0 ≠ j 0`, then `i t ≠ j t` for every `t`, and the empirical
mixtures of the two players do not both converge. (Shapley 1964, as stated by Levin,
Proposition 4, p. 6, with the non-convergence argument on pp. 7–8, which assumes that play stays
off the diagonal; that fact is proved here. Proved here.)

Route. (i) Row `a` is a best response to counts `Y` exactly when `Y (a + 1)` is maximal, and
column `b` to counts `X` exactly when `X (b + 1)` is maximal. Claim: for `t ≥ 1` the sets
`P = argmax (playCount i t)` and `Q = argmax (playCount j t)` are disjoint, and then
`i t ≠ j t`. At `t = 1` they are `{i 0}` and `{j 0}`. Given disjoint `P`, `Q`, the row plays
`q − 1` with `q ∈ Q` and the column `p − 1` with `p ∈ P`, so `i t ≠ j t` as `p ≠ q`. The counts
are integers, so the new argmax of the row counts is `{q − 1}` if `q − 1 ∈ P` and is contained in
`P ∪ {q − 1}` otherwise; likewise the column's is `{p − 1}` or contained in `Q ∪ {p − 1}`. A common
element would be `q − 1` (then `q − 1 ∈ Q`, `q − 1 ∉ P` and `p − 1 ∉ Q`; but `p ∉ {q, q − 1}`
forces `p = q + 1` and `p − 1 = q ∈ Q`) or `p − 1` (then `p − 1 ∈ P`, `q − 1 ∉ P`, so
`P ⊇ {p, p − 1}` and `q = p + 1`, whence `q − 1 = p ∈ P`), or an element of `P ∩ Q`: impossible
in each case. (ii) Off the diagonal the two realized payoffs sum to `1`, so `R₁ T + R₂ T = T` for
the realized totals. (iii) By 1.3 for both players,
`T · (max (empiricalMix j T) + max (empiricalMix i T)) = E₁ T + E₂ T ≥ T` for `T ≥ 1`, where
`E₁ T = max_a playCount j T (a + 1)` and `E₂ T = max_b playCount i T (b + 1)`. (iv) If both
mixtures converge, the limit is a Nash equilibrium by 1.1, and the only one is uniform: let `M` be
the argmax of `y`; a row in the support of `x` has `y (a + 1)` maximal, so `supp x ⊆ M − 1`; a
column in the support of `y` has `x (b + 1)` maximal, so
`supp y ⊆ argmax x − 1 ⊆ supp x − 1 ⊆ M − 2 = M + 1`; and `M ⊆ supp y`. A nonempty subset
of `Fin 3` with `M ⊆ M + 1` is everything, so `y` is uniform, then `argmax x` is everything and `x`
is uniform. The limit of
`max ȳ + max x̄` would be `2/3 < 1`, contradicting (iii).

**Checks.**

- The matrices agree with Levin's table entry by entry; the realized payoffs sum to `1` off the
  diagonal and `0` on it.
- The hypothesis `i 0 ≠ j 0` is used: from a diagonal first pair with matched tie-breaking the
  sequence stays on the diagonal (the game is symmetric, so both players face the same counts);
  with first-index ties from `(0, 0)` it does so for 3000 rounds with counts `(1000, 1000, 1000)`.
  Nothing is claimed about convergence for diagonal starts.
- All fictitious-play sequences from the six off-diagonal first pairs, every tie-break, to round
  `22`: none plays a diagonal pair (96 sequences). The step of (i) holds for all count vectors with
  entries at most `6`.
- The uniqueness lemma: the only Nash equilibrium on the grid of step `1/12` is the uniform pair,
  and every nonempty `M ⊆ Fin 3` with `M ⊆ M + 1` is `Fin 3`.
- From `(P, R)` with first-index ties (Levin's start) the lengths of the runs of constant pairs are
  `1, 1, 3, 5, 8, 13, 20, 30, 45, 67, 99, 146, …`, increasing from the fourth run on to round
  200000.

*Needs:* 1.1, 1.3.

### 3.2 Games solvable by iterated strict dominance

Prove `eventually_eq_of_dominanceSolvable`. The hypotheses describe a deletion by rounds: numbers
`ρ a` and `σ b` (the round at which row `a` or column `b` is deleted), a bound `K`, and survivors
`a₀`, `b₀` with `ρ a₀ = σ b₀ = K` and `ρ a < K`, `σ b < K` for all other actions; each row `a ≠ a₀`
has a row `a′` with `ρ a < ρ a′` and `A a b < A a′ b` for every column `b` with `ρ a ≤ σ b` (still
present at round `ρ a`), and each column `b ≠ b₀` a column `b′` with `σ b < σ b′` and
`B a b < B a b′` for every row `a` with `σ b ≤ ρ a`. The conclusion: every fictitious-play
sequence of `(A, B)` satisfies `i t = a₀` and `j t = b₀` for all large `t`. Requiring the dominating
action to survive the round is no restriction: a chain of strict dominations among the actions
present at a round ends at an action that is not dominated there. Dominance is by pure actions
only. (Statement as listed by Dán, KTH FEP3301 Lecture 6, slide "Synchronous Fictitious Play";
attributed to Nachbar (1990) by Li et al., arXiv:2312.11063v1, §3.6, p. 21. Proved here.)

Route. Induction on `r ≤ K`: there is `T_r` with `ρ (i t) ≥ r` and `σ (j t) ≥ r` for `t ≥ T_r`
(`T_0 = 0`). Step for `r < K`: let `ρ a = r`, with `a′` from the hypothesis; the set of columns
with `σ b ≥ r` contains `b₀`, so `δ = min (A a′ b − A a b)` over it is positive. With
`α = max |A a b|`, for `t ≥ T_r`,
`(A *ᵥ playCount j t) a′ − (A *ᵥ playCount j t) a ≥ δ (t − T_r) − 2α T_r`, which is positive once
`t > T_r (1 + 2α/δ)`; then `i t ≠ a` (for `t ≥ 1`). Columns are the same with `B`, using
`ρ (i s) ≥ r` for `s ≥ T_r`. Take `T_{r+1}` the largest of the finitely many bounds. At `r = K`
only `a₀` and `b₀` remain. For `K = 0` both types are singletons and the claim holds from `T = 0`.

**Checks.**

- `A = [[0, 0, 0], [0, 1, 0], [1, 2, 0]]`, `B = [[0, 1, 0], [2, 1, 0], [1, 2, 0]]`: simultaneous
  deletion gives `ρ = (1, 1, 3)`, `σ = (2, 3, 0)`, `K = 3`, survivors `(2, 1)`, and the hypotheses
  hold; every fictitious-play sequence from each of the nine first pairs (22 sequences, every
  tie-break, to round `26`) is at `(2, 1)` from round `5` on.
- The prisoner's dilemma is the case `K = 1`.

*Needs:* 1.1 (definitions).

### 3.3 Weighted potential games

Prove `tendsto_gap_of_weightedPotential`: let `P : Matrix ι κ ℝ` and `w₁, w₂ > 0` with
`A a′ b − A a b = w₁ (P a′ b − P a b)` and `B a b′ − B a b = w₂ (P a b′ − P a b)` for all actions.
Then for every fictitious-play sequence, with `x̄ = empiricalMix i t` and `ȳ = empiricalMix j t`,

    (⨆ a, (A *ᵥ ȳ) a − payoff A x̄ ȳ) + (⨆ b, (x̄ ᵥ* B) b − payoff B x̄ ȳ) → 0.

This is convergence of beliefs to the equilibria: every cluster point of `(x̄, ȳ)` is a Nash
equilibrium, by the argument of the last clause of 2.2. The mixtures need not converge, and play
need not settle. (Definition of weighted
potential games: Berger, *Brown's original fictitious play*, Definition 3, pp. 5–6; the theorem is
Monderer and Shapley's (1996), as stated by Berger, §2.2, p. 6, and by Li et al., §3.6, p. 21.
Proved here.)

Route. Write `c = max |P a b|`. Since `(A *ᵥ y) a′ − (A *ᵥ y) a = w₁ ((P *ᵥ y) a′ − (P *ᵥ y) a)` for
every `y` and `w₁ > 0`, the row's best responses for `A` and for `P` coincide, and likewise the
column's. Put `G t = playCount i t ⬝ᵥ (P *ᵥ playCount j t)`, `f t = G t / t²`, `p t = P (i t) (j t)`
and, for `t ≥ 1`, `g t = (max (P *ᵥ ȳ) − f t) + (max (x̄ ᵥ* P) − f t) ≥ 0` (`f t = payoff P x̄ ȳ`
is at most each maximum, being an average of its coordinates). Expanding `G (t + 1)` with the new
rows and columns and using the
best responses,

    (t + 1)² (f (t + 1) − f t) = t · g t + (p t − f t)        (t ≥ 1).

Summing from `1` to `N − 1` with `|f| ≤ c`, `|p − f| ≤ 2c` and `Σ_{t≥1} (t + 1)⁻² < 1`
(`Real.summable_one_div_nat_pow`) gives `Σ_{t≥1} t g t / (t + 1)² ≤ 4c`, and `t/(t + 1)² ≥ 1/(4t)`
gives `Σ_{t≥1} g t / t ≤ 16c`. Next, on the simplices the function
`Φ (x, y) = max (P *ᵥ y) + max (x ᵥ* P) − 2 payoff P x y` satisfies
`|Φ (x, y) − Φ (x′, y′)| ≤ 3c (‖x − x′‖₁ + ‖y − y′‖₁)`, and
`x̄` moves by `‖Pi.single (i t) 1 − x̄‖₁ / (t + 1) ≤ 2/(t + 1)` per step, so
`|g (t + 1) − g t| ≤ C/t` with `C = 12c + 1`. A nonnegative sequence with these two properties
tends to `0`: if `g t ≥ 2η > 0` with `m = ⌊ηt/C⌋`, then `g s ≥ η` for `t ≤ s ≤ t + m` and
`Σ_{s=t}^{t+m} g s / s ≥ η (m + 1)/(t + m) ≥ η²/(C + η)`, which is impossible for infinitely many
`t` because the tails of a convergent series tend to `0`. Finally,
`max (A *ᵥ ȳ) − payoff A x̄ ȳ = Σ_a x̄ a (max (A *ᵥ ȳ) − (A *ᵥ ȳ) a) = w₁ (max (P *ᵥ ȳ) − f t)`
because the maximizers agree, and likewise for the column, so the displayed sum lies between `0`
and `max w₁ w₂ · g t`.

**Checks.**

- On every fictitious-play sequence to round `7` of three weighted potential games (the identity
  of `Fin 2` with `w₁ = w₂ = 1`; `P = [[1, 0], [0, 2]]` with `w₁ = 1`, `w₂ = 2`; a two-by-three `P`
  with `w₁ = 3`, `w₂ = 1`; each with added terms depending on the opponent's action only): the
  displayed identity holds exactly, `g t ≥ 0`, the best responses for `A` and `P` coincide, and the
  displayed sum equals `w₁ (max (P *ᵥ ȳ) − f t) + w₂ (max (x̄ ᵥ* P) − f t)`.
- The coordination sequence of 1.3 (identical interests, `P = A = B = 1`): the displayed sum at odd
  `T` is `(T + 1)/T²`, tending to `0`, while every realized pair miscoordinates.
- `w₁ > 0` is needed. Take `A = 0`, `B = P = 1` (identity of `Fin 2`): the condition holds with
  `w₁ = 0`, `w₂ = 1`, and every row action is a best response. Let the row play `0` for `t < 10`
  and `c = d mod 2` on `[10^d, 10^(d+1))`, and let the column play any fictitious-play answer.
  On `[10^d, 1.8 · 10^d)` the column's best response is forced to `1 − c`: the row's count of
  `1 − c` is at least `0.9 · 10^d` there, and its count of `c` at most `10^(d−1) + (t − 10^d)`. At
  `T = 10^(d+1)` the row's mixture is at least `0.9` on `c` and the column's at least `0.08` on
  `1 − c`, so the column's gap `(1 − ȳ c)(2 x̄ c − 1)` is at least `0.064 > 1/16` for every
  `d ≥ 1`, and the displayed sum does not tend to `0`. Exactly, with ties broken towards `1`: the
  forcing holds for `t < 10⁵`, and the gaps at `T = 10², …, 10⁵` are `0.16`, `0.132`, `0.1357`,
  `0.1352`.

*Needs:* 1.1 (definitions); Mathlib `Real.summable_one_div_nat_pow`,
`Summable.tendsto_sum_tsum_nat`, `ciSup_le`, `le_ciSup`, `Finite.bddAbove_range`.

### Examples

- Rock-paper-scissors is zero-sum, and by 2.2 its mixtures converge to the uniform pair (its only
  saddle point, by the argument of the 1.1 Check on matching pennies). Shapley's game is not
  zero-sum and has the same unique equilibrium, and by 3.1 its mixtures from an
  off-diagonal start do not both converge.
- Identical-interest games are the case `A = B = P`, `w₁ = w₂ = 1`; for two players the condition
  with `w₁ = w₂ = 1` says that `−P` is an exact potential of the cost game `(−A, −B)`.

### Dependencies

3.1 needs 1.1 and 1.3. 3.2 and 3.3 need the definitions of 1.1.

## Scope and ownership

This roadmap owns the definitions `playCount`, `empiricalMix`, `IsFictitiousPlay`,
`coordinationPath`, `IsVectorSystem`, `shapleyRow` and `shapleyCol`, and the targets 1.1–3.3:
existence of fictitious play and equilibrium limits, absorption at strict equilibria, the regret of
fictitious play, Robinson's theorem and its consequences for zero-sum games, Shapley's
non-convergence theorem, and convergence for dominance-solvable and weighted potential games.

- RegretMinimizationAndEquilibria (on main) owns the probability simplex, the payoff of a matrix
  game and the regret (its Conventions, 1.1 and 2.1); the simplex and the regret are copied
  verbatim here and the payoff is written out as a dot product, and its value of a
  matrix game (2.1) is the value of 2.2. Its no-regret self-play (2.2) and the convergence of
  no-regret dynamics to correlated equilibria (3.3) do not cover fictitious play, which is not a
  no-regret procedure (1.3). Its minimax theorem, Nash existence and correlated equilibria are not
  restated.
- The weighted-potential condition of 3.3 is stated directly on the payoff matrices; potential
  games as such (exact and ordinal potentials, improvement paths) are not treated here.
- Approximate Nash equilibria as a notion are not treated here; the conclusions of 1.1, 2.2 and
  3.3 are stated with exact equilibria, gaps and limits.

These are classical facts about fictitious play; the recent preprint *Polynomial Dimension
Dependence for Fictitious Play Convergence* (Google Research, cogentic_research_papers, 2026),
which studies the rate of convergence in zero-sum games, recalls them in its introduction; nothing
here rests on it and none of its results is stated.

Not treated: Miyasawa's theorem for two-by-two games and the Monderer–Sela counterexample;
fictitious play with prior weights and the alternating form (Brown's original), with Berger's
theorem for ordinal potential games; the rate of convergence in zero-sum games (the bound of
Robinson and Shapiro and Karlin's conjecture); continuous-time fictitious play and best-response
dynamics; smooth and stochastic fictitious play; dominance by mixed strategies; follow-the-leader
as an online algorithm.

## Exact supplier contracts

### From Mathlib

- `Finset.exists_max_image` (`Mathlib/Data/Finset/Max.lean`): a function on a nonempty finset
  attains its maximum (1.1, 2.1).
- `Convexity.StdSimplex.range_toFun_comp_weights` (`Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`):
  for a finite type the weight vectors are the nonnegative vectors of sum `1` (1.1, 2.2);
  `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`
  (`Mathlib/Geometry/Convex/ConvexSpace/Topology.lean`) and the instance
  `Convexity.StdSimplex.compactSpace`
  (`Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`): the simplex is closed and
  compact (2.2).
- `ciSup_le`, `le_ciSup`, `ciInf_le`, `le_ciInf`
  (`Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`) with `Finite.bddAbove_range`,
  `Finite.bddBelow_range` (`Mathlib/Data/Fintype/Order.lean`): suprema and infima over finite
  nonempty types and over the simplices, which are bounded (2.1, 2.2, 3.3).
- `MapClusterPt.tendsto_subseq` (`Mathlib/Topology/Bases.lean`): in a first-countable space a
  cluster point of a sequence is the limit of a subsequence; `tendsto_nhds_unique`;
  `ContinuousAt.finset_sup'_apply` (`Mathlib/Topology/Order/Lattice.lean`) with
  `Finset.sup'_univ_eq_ciSup`;
  `tendsto_of_tendsto_of_tendsto_of_le_of_le` (squeeze) (2.2).
- `Real.summable_one_div_nat_pow` (`Mathlib/Analysis/PSeries.lean`, `Σ 1/n^p` converges for
  `p > 1`) and `Summable.tendsto_sum_tsum_nat` (3.3); `Nat.strong_induction_on` (2.1).

### From Tau Ceti

Nothing. The pinned Tau Ceti has no game theory (no payoff matrices, best responses or
equilibria); its convexity of the simplex is not needed.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions and 1.1: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)` and
  `regret p u T a = Σ_{t<T} (u t a − p t ⬝ᵥ u t)`, copied verbatim (1.1, 1.3, 2.2).
- 2.1: `Matrix.payoff M x y = x ⬝ᵥ (M *ᵥ y)`, written out as the dot product (not declared
  again); the value `⨆ x : simplex ι, ⨅ y : simplex κ, payoff M x y` and the orientation of
  `Matrix.exists_mixedNash` (the row player maximizes), followed in the Conventions. No theorem of
  that roadmap is used in a route.

## References

- U. Berger, *Brown's original fictitious play*, working paper (March 2005), EconWPA
  game/0503008; J. Econom. Theory 135 (2007) 572–578.
- G. W. Brown, *Iterative solution of games by fictitious play*, in *Activity Analysis of
  Production and Allocation* (T. C. Koopmans, ed.), Wiley, 1951, 374–376 (attributed, as listed
  by Berger).
- A. Cloud, A. Wang, W. Kerr, *Anticipatory fictitious play*, arXiv:2212.09941v1, Appendix B.
- G. Dán, *Computational Game Theory*, Lecture 6, KTH FEP3301, slides (author's page).
- C. Daskalakis, *Topics in Algorithmic Game Theory*, MIT 6.853, Lecture 4 (September 20, 2011),
  lecture notes (author's page).
- J. Levin, *Learning in Games*, lecture notes, Stanford Economics 286 (author's page).
- H. Li, W. Huang, Z. Duan, D. H. Mguni, K. Shao, J. Wang, X. Deng, *A survey on algorithms for
  Nash equilibria in finite normal-form games*, arXiv:2312.11063v1, §3.6.
- Attributed without locators: D. Monderer, L. S. Shapley, *Fictitious play property for games
  with identical interests*, J. Econom. Theory 68 (1996) 258–265; D. Monderer, L. S. Shapley,
  *Potential games*, Games Econom. Behav. 14 (1996) 124–143; J. H. Nachbar, *"Evolutionary"
  selection dynamics in games: convergence and limit properties*, Internat. J. Game Theory 19
  (1990) 59–89; J. Robinson, *An iterative method of solving a game*, Ann. of Math. 54 (1951)
  296–301; L. S. Shapley, *Some topics in two-person games*, in *Advances in Game Theory*, Ann. of
  Math. Studies 52, Princeton, 1964, 1–28.
