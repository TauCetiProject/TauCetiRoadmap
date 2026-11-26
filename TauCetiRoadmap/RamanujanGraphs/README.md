# Roadmap: Ramanujan graphs

**Summary.** A `d`-regular graph is Ramanujan when every adjacency eigenvalue other than `±d` has
absolute value at most `2√(d − 1)`, the spectral radius of the infinite `d`-regular tree; by the
Alon–Boppana bound, no infinite family does much better. This roadmap proves that connected
bipartite Ramanujan graphs exist in every degree `d ≥ 3`, by the method of interlacing families of
Marcus, Spielman and Srivastava, and develops the tree as the model for the spectrum of a large
regular graph. It contains no explicit construction (Lubotzky–Phillips–Sarnak, Margulis,
Morgenstern), no non-bipartite Ramanujan graphs of every degree, and only the sizes `2d · 2^k`.

A signing `s` of the edges gives a signed adjacency matrix `A_s` and a 2-lift, a graph with two
vertices over each vertex whose spectrum is that of `A` together with that of `A_s`. Every finite
graph has a signing all of whose eigenvalues are at most the largest root of its matching
polynomial. The proof shows that the characteristic polynomials of the signings form an
interlacing family, through an elementary form of real stability: expected characteristic
polynomials of independent rank-one updates of a real symmetric matrix are real-rooted. With the
root bound `2√(d − 1)` for the matching polynomial and the symmetric spectrum of a bipartite
graph, it follows that for every `d ≥ 3` and `k ≥ 0` there is a connected bipartite `d`-regular
Ramanujan graph on `2d · 2^k` vertices; its Ihara zeta function satisfies the Riemann hypothesis.

At a vertex of a `d`-regular graph there are at least as many closed walks of length `ℓ` as at
the root of the tree, `t_ℓ`, with equality when the ball of radius `ℓ/2` is a tree. The numbers
`t_ℓ` are the moments of the Kesten–McKay law. McKay's theorem follows: if the proportion of
vertices on cycles of each fixed length tends to zero, the empirical spectral measures of
`d`-regular graphs, `d ≥ 2`, converge weakly to that law. Serre's theorem gives, for each `d ≥ 2`
and `ε > 0`, a positive proportion of eigenvalues above `2√(d − 1) − ε` in every `d`-regular graph.
Finally, a `(q + 1)`-regular graph with `q ≥ 1` is Ramanujan exactly when its counts of closed
non-backtracking walks equal an explicit main term up to an error `O(q^(m/2))`.

The roadmap builds on MatchingPolynomial (signed adjacency matrices and the matching
polynomial), IharaZetaFunction (Ramanujan graphs, the zeta function, the Hashimoto matrix),
SpectralGraphBounds (eigenvalue bounds and the multiplicity of the degree),
EigenvalueAndSingularValueInequalities (the converse of Cauchy interlacing) and RandomMatrices as
realised in Tau Ceti (spectral measures, the method of moments).

Layer 1 treats interlacing families of polynomials; Layer 2 real stability; Layer 3 lifts and the
existence theorem; Layer 4 the Ihara counts; Layer 5 the tree, the Kesten–McKay law, McKay's
theorem and Serre's theorem. Layers 4 and 5 do not need Layers 1–3.

## Conventions

- Graphs are Mathlib's `SimpleGraph V` with `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`.
  Every statement holds for every finite `V`, the empty type included, unless it says otherwise.
- A signing is `s : G.edgeSet → ℤˣ` and its signed adjacency matrix is `signedAdjMatrix G s`,
  copied verbatim from MatchingPolynomial 2.1, with the matching polynomial `matchingPolynomial`
  and `matchingCount` from MatchingPolynomial 1.1. Its entries lie in `ℤ`; real roots are taken
  after `map (Int.castRingHom ℝ)`.
- A real polynomial is real-rooted when it splits over `ℝ` (`Polynomial.Splits`). "The largest root
  of `f` is at most the largest root of `g`" is written "every root `x` of `f` has a root `y` of
  `g` with `x ≤ y`", which is vacuous for a polynomial with no roots and needs no junk value.
- Adjacency eigenvalues: inside `IsRamanujan` and in Layer 4 they are Mathlib's unsorted
  `(G.isHermitian_adjMatrix ℝ).eigenvalues`, as in IharaZetaFunction; in Serre's theorem they are
  the sorted `adjEigenvalues` of SpectralGraphBounds 1.1 (copied verbatim). Both lists are the
  roots of the characteristic polynomial with multiplicity.
- `IsRamanujan q G`, `SatisfiesRiemannHypothesis q G`, `hashimotoMatrix`,
  `IsNonBacktrackingCycle` and `closedNonBacktrackingCount` are copied verbatim from
  IharaZetaFunction 1.1, 1.2 and 5.3. `IsRamanujan` exempts both `±(q + 1)` and does not ask for
  connectivity, so the existence theorem 3.3 states connectivity separately.
- `√` is `Real.sqrt`; `√(d − 1)` means `Real.sqrt ((d : ℝ) − 1)`, which is `0` for `d ≤ 1`.
- The empirical spectral measure of a graph is Tau Ceti's `Matrix.spectralMeasure` of its real
  adjacency matrix, `n⁻¹ Σ δ_(λ_i)` (RandomMatrices, Conventions 3 and 1.1); it needs a nonempty
  vertex type. Weak convergence is convergence of the integrals of every bounded continuous
  function (RandomMatrices, Conventions 6).

## Layer 1: interlacing families of polynomials

### 1.1 Interlacing families

Define `sortedRoots p`, the real roots of `p : ℝ[X]` with multiplicity in nonincreasing order, and
`CommonlyInterlaced f` for a family `f : ι → ℝ[X]`: every `f i` is real-rooted, and for all `i`,
`i'` and every `j` with `j + 1 < deg (f i)`, the `(j + 2)`-nd largest root of `f i` is at most the
`(j + 1)`-st largest root of `f i'`. For real-rooted polynomials of one degree `n` this says that
the largest roots lie in one interval, the second largest in the next interval below it, and so
on: it is the existence of a common interlacing polynomial of degree `n − 1` (Marcus–Spielman–
Srivastava, Def 4.1 and the remark after it, p. 6).

For finite nonempty types `S 0, …, S (m − 1)` and `f : (∀ k, S k) → ℝ[X]`, `partialSum f k τ` is
the sum of `f σ` over the `σ` that agree with `τ` below `k`, and `IsInterlacingFamily f` says
that for every `k < m` and every `τ` the polynomials `t ↦ partialSum f (k + 1) (τ with k ↦ t)`
are commonly interlaced (MSS, Def 4.3, p. 7).

- **Interlacing families** (`exists_isRoot_le_of_isInterlacingFamily`): if every `f σ` has
  positive leading coefficient and `IsInterlacingFamily f`, then some `σ` has every root of `f σ`
  at most some root of `Σ_σ f σ` (MSS, Lemma 4.2 and Thm 4.4, p. 7).

MSS state this for members of one degree `n`; the route below does not use the degrees, and the
statement is made without that hypothesis. Real-rootedness of the members is part of
`CommonlyInterlaced` (for `m ≥ 1` the last level of the family consists of the members
themselves), as MSS's Definition 4.1 presupposes.

*Proof route.* (1) *One level.* Let `g_t`, `t ∈ T` finite nonempty, be commonly interlaced with
positive leading coefficients and `F = Σ_t g_t`. If some `g_t` is constant it has no roots and
there is nothing to prove. Otherwise put `α = max_t r₂(g_t)` over the members of degree `≥ 2`
(`r_j` the `j`-th largest root), or any number below every root if all members are linear. By
the interlacing condition `r₂(g_t) ≤ α ≤ r₁(g_t)` for every `t`, so in `g_t(x) = c Π (x − r_j)`
only the factor `x − r₁` can be negative for `x ≥ α`; hence `g_t ≤ 0` on `[α, r₁(g_t)]`. Thus
`F(α) ≤ 0`, while `F` has positive leading coefficient and tends to `+∞`, so `F` has a root in
`[α, ∞)` (Mathlib `intermediate_value_Icc`); let `β` be its largest root, so `F > 0` on
`(β, ∞)`. If every `r₁(g_t) > β`, then on `(β, min_t r₁(g_t))` every `g_t ≤ 0` and `F ≤ 0`, a
contradiction. So some `r₁(g_t) ≤ β`, and every root of that `g_t` is at most `β`. (2) *Induction.*
The leading coefficient of a sum of polynomials with positive leading coefficients is positive.
Starting from `Σ_σ f σ = partialSum f 0 τ`, apply (1) at level `k` to the children of the current
partial sum, whose sum it is, and fix the value at `k` found there; after `m` steps the partial
sum is a single `f σ`, and the roots compare along the chain. For `m = 0` the only member is the
sum itself.

*Needs:* Mathlib `intermediate_value_Icc`, `Polynomial.roots`, `Polynomial.splits_iff_card_roots`.

**Checks.**

- MSS's example (p. 7): for `f = (x + 5)(x − 9)(x − 10)` and `g = (x + 6)(x − 1)(x − 8)` the
  sum `2x³ − 17x² − 51x + 498` is real-rooted with largest root in `(7, 8)`, below the largest
  roots `10` and `8` of the summands; the pair is not commonly interlaced, and indeed
  `(11/20) f + (9/20) g` is not real-rooted (exact Sturm count).
- `(x + 1)(x + 2) + (x − 1)(x − 2) = 2x² + 4` has no real root.
- Positive leading coefficients are needed: `−(x − 1)` and `x − 5` are linear, so the root
  condition is vacuous, but their sum is the constant `−4`, which has no root.
- Nonempty value types are needed: if some `S k` is empty there is no assignment, the family
  condition is vacuous and the conclusion fails.

### 1.2 Two polynomials

- **Common interlacing and convex combinations** (`commonlyInterlaced_pair_iff`): for real-rooted
  `f, g ∈ ℝ[X]` of one degree with positive leading coefficients, `f` and `g` are commonly
  interlaced if and only if `t f + (1 − t) g` is real-rooted for every `t ∈ [0, 1]`.

MSS, Lemma 4.5, p. 8, for `k` polynomials, where it is attributed to Dedieu, Fell and
Chudnovsky–Seymour; only the case `k = 2` is stated here, which is the case the signings need.
Common roots of `f` and `g` are allowed. The route below is written out in full.

*Proof route.* Write `f = a f̂`, `g = b ĝ` with `f̂`, `ĝ` monic and `a, b > 0`; then
`t f + (1 − t) g` is a positive multiple of `s f̂ + (1 − s) ĝ` with `s = ta/(ta + (1 − t)b)`, which
runs over `[0, 1]`, so take `f`, `g` monic of degree `n`. For `n ≤ 1` every member of the segment
is constant or linear and the root condition is vacuous. Let `n ≥ 2`, roots `a₁ ≥ … ≥ aₙ` of `f`
and `b₁ ≥ … ≥ bₙ` of `g`.

(⇒) The condition gives `max(a_(j+1), b_(j+1)) ≤ min(a_j, b_j)`; put `β_j = min(a_j, b_j)` for
`j < n`, a nonincreasing list. On `E = EuclideanSpace ℝ (Fin n)` let `T` be the diagonal operator
with entries `a_j`, so that its eigenvalues in Mathlib's nonincreasing order are the `a_j` and
`finrank E = (n − 1) + 1`. Since `a_(j+1) ≤ β_j ≤ a_j`, EigenvalueAndSingularValueInequalities 3.4
`exists_hyperplane_eigenvalues_compression_eq` gives a hyperplane `W` on which the compression of
`T` has eigenvalues `β`. In an orthonormal eigenbasis `w_j` of the compression, completed by a
unit normal `e` of `W`, the matrix of `T` is the arrowhead matrix `[[diag β, z], [zᵀ, c]]` with
`z_j = ⟪w_j, T e⟫` and `c = ⟪e, T e⟫`. Expanding the determinant along the last row and column,
its characteristic polynomial is `(x − c) h(x) − Σ_j z_j² h(x)/(x − β_j)` with `h = Π_j (x − β_j)`;
it equals `f`. In the same way `g = (x − c') h − Σ_j z'_j² h/(x − β_j)`. The right side is affine
in `(c, z_1², …)`, so `s f + (1 − s) g` is the characteristic polynomial of the arrowhead matrix
with `c'' = s c + (1 − s) c'` and `z''_j = √(s z_j² + (1 − s) z'_j²)`, a real symmetric matrix,
whose characteristic polynomial splits (Mathlib `Matrix.IsHermitian.splits_charpoly`).

(⇐) Suppose the condition fails, say `a_(j+1) > b_j` for some `1 ≤ j < n` (the other case is
symmetric). Write `N_p(x)` for the number of roots of `p` greater than `x`, with multiplicity,
and `h_s = s f + (1 − s) g`, monic of degree `n` and real-rooted for every `s ∈ [0, 1]`. *Local
constancy.* Let `x₀` be a real number and `s₀ ∈ [0, 1]` with `h_(s₀)(x₀) ≠ 0`, and let `ε` be
smaller than the distance from `x₀` to the roots of `h_(s₀)`. By the continuity of the complex
roots of a polynomial family of fixed degree in its coefficients (Tau Ceti
`Polynomial.eventually_exists_C_mul_prod_X_sub_C_norm_sub_lt`), for `s` near `s₀` the roots of
`h_s` can be matched, with multiplicity, to those of `h_(s₀)` within `ε`; all of them are real,
so they lie on the same side of `x₀` as their partners and `N_(h_s)(x₀) = N_(h_(s₀))(x₀)`. If
instead `x₀` is a simple root of `h_(s₀)`, the same matching shows that `N_(h_s)(x₀)` is
`N_(h_(s₀))(x₀)` or that number plus one for `s` near `s₀`. *Choice of `x₀`.* If `f = c g` then
`f = g` (both monic) and the condition holds; otherwise the polynomial `W = g f' − f g'` is not
zero (else `f/g` would be constant). Choose `x₀` in the open interval `(b_j, a_(j+1))` that is a
root of none of `f`, `g`, `W`. Then `N_f(x₀) ≥ j + 1` and `N_g(x₀) ≤ j − 1`, a difference of at
least two. The value `h_s(x₀) = g(x₀) + s (f(x₀) − g(x₀))` is affine in `s` and nonzero at both
ends. If `f(x₀)` and `g(x₀)` have the same sign it never vanishes, `s ↦ N_(h_s)(x₀)` is locally
constant on the connected `[0, 1]`, and `N_f(x₀) = N_g(x₀)`: a contradiction. Otherwise it
vanishes at exactly one `s₀ ∈ (0, 1)`. There `x₀` is a simple root of `h_(s₀)`: a double root
would give `h_(s₀)'(x₀) = 0`, and with `h_(s₀)(x₀) = 0` and `f(x₀) ≠ g(x₀)` this forces
`W(x₀) = 0`. So `N_(h_s)(x₀)` is constant on `[0, s₀)` and on `(s₀, 1]`, and both constants lie in
`{A, A + 1}` for `A = N_(h_(s₀))(x₀)`; hence `|N_f(x₀) − N_g(x₀)| ≤ 1`, a contradiction.

*Needs:* 1.1 (the definition); EigenvalueAndSingularValueInequalities 3.4; Tau Ceti
`Polynomial.eventually_exists_C_mul_prod_X_sub_C_norm_sub_lt`; Mathlib
`Matrix.IsHermitian.splits_charpoly`.

**Checks.**

- All 750 pairs of monic polynomials of degree 2 or 3 with integer roots in `[−2, 2]`, common
  roots allowed: the root condition holds exactly for the pairs whose combinations
  `t f + (1 − t) g` are real-rooted at every `t = k/48`, and every failing pair has a
  non-real-rooted combination on that grid (exact Sturm counts).
- The equal-degree hypothesis is needed: for `f = 1` and `g = x² − 1` the root condition holds
  (the list of roots of `f` is empty and `getD` returns `0`), but `3/4 + (x² − 1)/4` has no real
  root.
- Positive leading coefficients are needed: `(x − 1)(x − 2)` and `−(x − 3/2)(x − 8/5)` satisfy the
  root condition, but `(3/10) f + (7/10) g` is not real-rooted.
- The arrowhead identity of the route: `[[1, 0, 2], [0, −2, 3], [2, 3, 5]]` has characteristic
  polynomial `(x − 5)(x − 1)(x + 2) − 4(x + 2) − 9(x − 1)`.

### Examples

- The interlacing family that 3.2 uses has two values per coordinate, `S k = ℤˣ`, and its
  members are the characteristic polynomials of the signed adjacency matrices.

### Dependencies

EigenvalueAndSingularValueInequalities 3.4; Tau Ceti continuity of roots; Mathlib polynomials and
the intermediate value theorem.

## Layer 2: real stability

### 2.1 Three closure properties

Define `IsRealStable p` for `p` in `MvPolynomial σ ℝ`: `p` does not vanish at any point `z : σ → ℂ`
with every `Im (z i) > 0`. The zero polynomial is not real stable in this sense (MSS, Def 6.1,
p. 10, count it as stable; every polynomial used below is nonzero).

- **Determinantal polynomials** (`isRealStable_det`): for a real symmetric `n × n` matrix `D` and
  real vectors `a_i` (`i ∈ ι`), the polynomial `det(x I + D + Σ_i y_i a_i a_iᵀ)` in the variables
  `x = X none` and `y_i = X (some i)` is real stable.
- **Directional derivatives** (`IsRealStable.add_pderiv`): if `p` is real stable and `α, β ≥ 0`,
  then `p + α ∂p/∂z_j + β ∂p/∂z_k` is real stable.
- **Real specialisation** (`IsRealStable.splits_map_eval`): if `p` in the variables `x = X none`
  and `y_t = X (some t)` is real stable and monic as a polynomial in `x`
  (`MvPolynomial.optionEquivLeft`), then for every `c : τ → ℝ` the polynomial `p(x, c)` is
  real-rooted.

These are the three tools of MSS §6 (Lemma 6.2, p. 10, after Borcea–Brändén, for
`det(Σ z_i A_i)` with positive semidefinite `A_i`; Corollary 6.4, p. 10, from the
Borcea–Brändén characterization of stability preservers; and the restriction to real values,
p. 10, from Hurwitz's theorem). The forms stated here are the ones 2.2 needs, with `D` only
symmetric, and their proofs below are elementary: neither the Borcea–Brändén theorem nor Hurwitz's
theorem is used. The third item is stated for polynomials monic in `x`, the form that 2.2 needs;
this is what allows the elementary proof below.

*Proof route.* (a) At a point with `Im x > 0` and every `Im y_i > 0`, the evaluated matrix is
`M = R + i S` with `R` and `S` real symmetric, `S = Im x · I + Σ Im y_i a_i a_iᵀ` positive
definite. If `det M = 0` there is `w ≠ 0` with `M w = 0`, and then `w* M w = w* R w + i w* S w`
is `0` although its imaginary part `w* S w ≥ Im x ‖w‖²` is positive. Evaluation commutes with the
determinant (Mathlib `AlgHom.map_det`). (b) Fix `z` with every `Im z_i > 0` and let
`h(u) = p(z + u (α e_j + β e_k))`, a polynomial in one complex variable. For `Im u ≥ 0` every
coordinate of `z + u(α e_j + β e_k)` has positive imaginary part, so `h` has no root with
`Im u ≥ 0`. The value of the new polynomial at `z` is `h(0) + h'(0)`. If `h` is constant this is
`h(0) ≠ 0`. Otherwise `h = c Π (u − r_l)` with every `Im r_l < 0`, and
`h(0) + h'(0) = h(0) (1 − Σ_l 1/r_l)`; each `−1/r_l` has negative imaginary part, so the bracket
is not zero. (c) Write `q(x) = p(x, c)` and, for `ε > 0`, `q_ε(x) = p(x, c + iε)` (every `y_t`
moved to `c_t + iε`). Both are monic of the same degree `N` in `x`. Since `p` is real stable,
`q_ε` has no root with `Im x > 0`, so for `Im x₀ > 0`,
`|q_ε(x₀)| = Π |x₀ − r_l| ≥ (Im x₀)^N`. As `ε → 0`, `q_ε(x₀) → q(x₀)` (a polynomial in `ε`), so
`|q(x₀)| ≥ (Im x₀)^N > 0`. The real polynomial `q` therefore has no non-real roots (conjugation
handles `Im x₀ < 0`), and a real polynomial whose complex roots are all real splits over `ℝ`.

*Needs:* Mathlib `MvPolynomial.aeval`, `MvPolynomial.pderiv`, `MvPolynomial.optionEquivLeft`,
`AlgHom.map_det`, `Polynomial.splits_iff_card_roots`.

**Checks.**

- First item with `n = 1`, `D = (−5)` and `a_1 = (1)`: the polynomial is `x − 5 + y`, which does
  not vanish when `Im x, Im y > 0`; `D` need not be positive semidefinite.
- The weights of the second item must be nonnegative: `p = u v` is real stable, but
  `p + ∂p/∂u − ∂p/∂v = uv + v − u` vanishes at `u = i`, `v = (1 + i)/2`, both in the upper
  half-plane.
- Stability is needed in the third item: `x² + y²` is monic in `x` and vanishes at `x = −1 + i`,
  `y = 1 + i`; at `y = 1` it gives `x² + 1`, which is not real-rooted.

### 2.2 Expected characteristic polynomials of rank-one updates

- **Real-rootedness** (`splits_sum_prod_charpoly`): for a real symmetric `D`, real vectors `a_i`,
  `b_i` and numbers `p_i ∈ [0, 1]` (`i` in a finite type `ι`), the polynomial
  `P = Σ_(S ⊆ ι) w_S det(x I + D + Σ_(i ∈ S) a_i a_iᵀ + Σ_(i ∉ S) b_i b_iᵀ)`, with weights
  `w_S = (Π_(i ∈ S) p_i)(Π_(i ∉ S) (1 − p_i))`, is real-rooted. In Lean the determinant is the
  characteristic polynomial of `−(D + …)`.

MSS, Thm 6.6, p. 11, with Lemma 6.5, p. 11, for positive semidefinite `D`; here `D` is only
symmetric, which 2.1 (a) allows, so that 3.2 needs no shift.

*Proof route.* Let `Q = det(x I + D + Σ_i u_i a_i a_iᵀ + Σ_i v_i b_i b_iᵀ)` in the variables `x`,
`u_i`, `v_i`; it is real stable by 2.1 (a) (index set `ι ⊕ ι`) and monic of degree `n` in `x`.
(1) *Rank one.* For a matrix `A` over a commutative ring and a vector `a`,
`det(A + u a aᵀ) = det A + u · aᵀ adj(A) a` (the matrix determinant lemma, Mathlib
`Matrix.det_add_replicateCol_mul_replicateRow`, over the fraction field of the polynomial ring,
where `det A` is a nonzero monic polynomial in `x`). Hence `Q` has degree at most one in each
`u_i` and each `v_i`, and with `T_i = 1 + p_i ∂/∂u_i + (1 − p_i) ∂/∂v_i` and `Z_w` the substitution
`w = 0`, the polynomial `Z_(u_i) Z_(v_i) T_i det(A + u_i a aᵀ + v_i b bᵀ)` equals
`p_i det(A + a aᵀ) + (1 − p_i) det(A + b bᵀ)` (MSS, Lemma 6.5). (2) By induction over `ι`,
`P = Z (Π_i T_i) Q`, where `Z` sets every `u_i`, `v_i` to `0`; the operators for different `i`
involve disjoint variables and commute. (3) By 2.1 (b),
applied once for each `i` with `α = p_i ≥ 0` and `β = 1 − p_i ≥ 0`, `(Π_i T_i) Q` is real stable;
derivatives in `u_i` and `v_i` do not touch the coefficient `1` of `x^n`, so it is still monic
of degree `n` in `x`. (4) By 2.1 (c) with `c = 0`, `P` is real-rooted.

*Needs:* 2.1; Mathlib `Matrix.det_add_replicateCol_mul_replicateRow`, `Matrix.charpoly`.

**Checks.**

- 192 exact instances with `n = 3`, `|ι| = 3`: three symmetric `D` (two of them indefinite),
  fixed integer vectors, and every `p ∈ {0, 1/3, 1/2, 1}³`; each `P` is real-rooted (Sturm).
- Weights outside `[0, 1]` break it: `p = (−1, −1)`, `a_1 = b_1 = a_2 = e_1`, `b_2 = e_2`,
  `D = 0`, `n = 2` give `P = x² + 2x + 2`.

### Examples

- With `ι` the edges of a graph, `a_e = e_u − e_v`, `b_e = e_u + e_v` and `D` minus the degree
  matrix, `P` is the expected characteristic polynomial of a random signing (3.2).

### Dependencies

Layer 1 is not needed. Mathlib multivariate polynomials, determinants and the matrix determinant
lemma.

## Layer 3: 2-lifts and bipartite Ramanujan graphs

### 3.1 The spectrum of a 2-lift

Define the 2-lift `twoLift G s` on `V × Bool`: an edge `uv` with `s(uv) = 1` lifts to the edges
`(u, b) ~ (v, b)`, and an edge with `s(uv) = −1` to `(u, b) ~ (v, !b)` (Bilu–Linial, §2, p. 5).
The all-`+1` signing gives two disjoint copies of `G`, the all-`−1` signing its bipartite double
cover. Adjacency in the lift is decidable when it is in `G` (an instance with a real body).

- **Bilu–Linial** (`charpoly_adjMatrix_twoLift`): the characteristic polynomial of the adjacency
  matrix of `twoLift G s` is that of `G` times that of `signedAdjMatrix G s` (Bilu–Linial,
  Lemma 3.1, p. 5).

Facts used in 3.3, each a short consequence of the definition and not a target: the projection
`(v, b) ↦ v` maps the neighbours of `(v, b)` bijectively onto those of `v`, so the lift of a
`d`-regular graph is `d`-regular; a 2-colouring `col` of `G` gives the 2-colouring
`(v, b) ↦ col v` of the lift.

*Proof route.* Identify `V × Bool` with `V ⊕ V`. The adjacency matrix of the lift is the block
matrix `[[A₁, A₂], [A₂, A₁]]` with `A₁` and `A₂` the adjacency matrices of the edges signed `+1`
and `−1`, so `A = A₁ + A₂` and `A_s = A₁ − A₂`. Over `ℚ`, conjugating by `[[1, 1], [1, −1]]`
(inverse `[[1, 1], [1, −1]]/2`) gives `[[A, 0], [0, A_s]]`. The characteristic polynomial is
invariant under conjugation (Mathlib `Matrix.charpoly_units_conj`) and reindexing
(`Matrix.charpoly_reindex`), and is multiplicative on block-triangular matrices
(`Matrix.charpoly_fromBlocks_zero₁₂`); it commutes with `ℤ → ℚ` (`Matrix.charpoly_map`), which is
injective.

*Needs:* MatchingPolynomial 2.1 (the definition `signedAdjMatrix`); Mathlib
`Matrix.charpoly_units_conj`, `Matrix.charpoly_reindex`, `Matrix.charpoly_fromBlocks_zero₁₂`,
`Matrix.charpoly_map`.

**Checks.**

- Every signing of `K₂`, `P₃`, `K₃`, `C₄`, `C₅`, `K₄`, `K_(1,3)`, `K_(3,3)` (646 signings, 512 of
  them of `K_(3,3)`) and of the edgeless graph on three vertices satisfies the identity (exact
  integer characteristic polynomials); on the empty vertex type both sides are `1`.
- On all 64 signings of `K₄` the lift has `1 + m` connected components, `m` the multiplicity of
  the eigenvalue `3` of `A_s` (the count used in 3.3).

### 3.2 A signing below the matching polynomial

- **Weighted real-rootedness** (`splits_sum_prod_charpoly_signedAdjMatrix`): for every
  `p : G.edgeSet → ℝ` with values in `[0, 1]`, the polynomial
  `Σ_s (Π_e (p_e if s_e = 1, 1 − p_e otherwise)) · charpoly(A_s)` is real-rooted (MSS, Thm 5.1,
  p. 8, proved p. 12).
- **A good signing** (`exists_signedAdjMatrix_isRoot_le`): there is a signing `s` such that every
  root of the characteristic polynomial of `signedAdjMatrix G s` is at most some root of the
  matching polynomial of `G` (MSS, Thms 5.2 and 5.3, p. 8).

Consequence, not a separate target: if every degree is at most `d` and `d ≥ 2`, MatchingPolynomial
4.2 `abs_le_of_isRoot_matchingPolynomial` bounds the roots of the matching polynomial by
`2√(d − 1)`, so some signing has every eigenvalue at most `2√(d − 1)` (MSS, Thm 5.3, second
statement, for `d`-regular graphs). The bound is on the largest eigenvalue only: the all-`−1`
signing of `K₄` has largest eigenvalue `1 ≤ 2√2` and eigenvalue `−3`.

*Proof route.* Weighted real-rootedness: for an edge `e = uv` put `a_e = e_u − e_v` and
`b_e = e_u + e_v` (the orientation does not matter). Then `Σ_e r_e r_eᵀ`, with `r_e = a_e` where
`s_e = 1` and `r_e = b_e` where `s_e = −1`, has the degrees on its diagonal and `−s_e` at the two
positions of `e`, so `x I − A_s = x I − Deg + Σ_e r_e r_eᵀ`. With `D = −Deg`, `ι = G.edgeSet`
and `S = {e | s_e = 1}` (a bijection between signings and subsets that matches the weights), the
polynomial is 2.2's `P`, after `Matrix.charpoly_map` for `ℤ → ℝ`. A good signing: enumerate the
edges by `Fin m` and read signings as `σ : Fin m → ℤˣ`, with `f σ` the characteristic polynomial
of `A_σ` over `ℝ`, monic of degree `|V|`. Fix `k < m` and `τ`. The two children
`partialSum f (k + 1) (τ with k ↦ ±1)` are `2^(m − k − 1)` times the weighted sums of the first
item with `p_i = 1` or `0` according to `τ_i` for `i < k`, `p_k = 1` or `0`, and `p_i = 1/2` for
`i > k`; so they are real-rooted, monic up to a positive factor and of degree `|V|`. Their convex
combination with weight `λ` is `2^(m − k − 1)` times the weighted sum with `p_k = λ`, real-rooted
by the first item. By 1.2 (⇐) the two children are commonly interlaced (the definition is
invariant under reindexing `ℤˣ ≃ Fin 2`), so `f` is an interlacing family and 1.1 gives `σ` with
every root at most some root of `Σ_σ f σ`. By MatchingPolynomial 2.1
`sum_charpoly_signedAdjMatrix` this sum is `2^m` times the matching polynomial, with the same
roots.

*Needs:* 1.1, 1.2, 2.2; MatchingPolynomial 1.1 and 2.1 (`signedAdjMatrix`,
`sum_charpoly_signedAdjMatrix`), and 4.2 for the consequence; Mathlib `Matrix.charpoly_map`.

**Checks.**

- The Godsil–Gutman identity, on which the second item rests, holds on `K₃`, `C₄`, `K₄`,
  `K_(1,3)`, `K_(3,3)` and `C₅` (exact sums over all signings).
- Weighted real-rootedness for four rational weight vectors on each of `K₃`, `K₄`, `C₅` and
  `K_(3,3)`; the weights must lie in `[0, 1]`: on `K₃` with `p_e = −1` for every edge the weighted
  sum is `x³ − 3x + 54`, which has one real root.
- At every node of the signing tree of `K₃`, `C₄` and `K_(1,3)` the two children and their
  combinations at `t = k/12` are real-rooted.
- Good signings exist and are not rare: 56 of the 64 signings of `K₄`, 192 of the 512 of
  `K_(3,3)`, 16 of the 32 of `C₅`, 8 of the 16 of `C₄`, and every signing of the trees `K_(1,3)`,
  `P₃`, `K₂` (exact root comparisons).
- `d = 1` is outside the consequence: both signings of `K₂` have eigenvalue `1 > 0 = 2√(1 − 1)`.

### 3.3 Bipartite Ramanujan graphs of every degree

- **Existence** (`exists_connected_isBipartite_isRamanujan`): for every `d ≥ 3` and `k ≥ 0` there
  is a graph on `Fin (2d · 2^k)` that is `d`-regular, bipartite, connected and
  `IsRamanujan (d − 1)`; its Ihara zeta function satisfies `SatisfiesRiemannHypothesis (d − 1)`.

MSS, Lemma 5.4 and Thm 5.5, p. 9 (an infinite sequence of `d`-regular bipartite Ramanujan
graphs). The connectivity and the sizes are made explicit here; without connectivity the
statement would be empty of content, since `2^k` disjoint copies of `K_(d,d)` form a `d`-regular
bipartite graph on `2d · 2^k` vertices that is Ramanujan in the sense of IharaZetaFunction 5.3.

*Proof route.* Induction on `k`. For `k = 0` take `K_(d,d)` on `Fin (2d)` (`i ~ j` when exactly
one of `i, j` is below `d`): it is `d`-regular, bipartite and connected, and its adjacency matrix
has rank two, so its eigenvalues are `d`, `−d` and `0` (MSS, Lemma 5.4), and `0 ≤ 2√(d − 1)`.
Given `G` on `N` vertices with the four properties, take `s` from 3.2 and the bound
`2√(d − 1)` of the consequence there (`d ≥ 2`). With a 2-colouring `col` of `G` and `Δ` the
diagonal matrix with entries `±1` according to `col`, `Δ A_s Δ = −A_s`, so the spectrum of `A_s`
is symmetric and every eigenvalue of `A_s` lies in `[−2√(d − 1), 2√(d − 1)]`. By 3.1 the
eigenvalues of `twoLift G s` are those of `G` and those of `A_s`, so the lift is Ramanujan for
`q = d − 1`. It is `d`-regular and bipartite (3.1). By SpectralGraphBounds 1.4
`card_adjEigenvalues_eq_degree`, applied to the lift and to `G`, the lift has as many connected
components as its eigenvalue `d` has multiplicity, which is `1 + 0`, because `G` is connected and
`2√(d − 1) < d` for `d ≥ 3`; so the lift, on a nonempty type, is connected. Transport it to
`Fin (2d · 2^(k+1))` along an equivalence with `Fin (2d · 2^k) × Bool`: the adjacency matrix is
reindexed, the characteristic polynomial and hence the eigenvalue multiset are unchanged
(`Matrix.charpoly_reindex`). Finally IharaZetaFunction 5.3
`TauCetiRoadmap.IharaZetaFunction.isRamanujan_iff_satisfiesRiemannHypothesis`,
with `q = d − 1 ≥ 2` and the `((d − 1) + 1)`-regular graph, gives the Riemann hypothesis.

*Needs:* 3.1, 3.2; MatchingPolynomial 4.2; SpectralGraphBounds 1.4; IharaZetaFunction 5.3
(`IsRamanujan`, `SatisfiesRiemannHypothesis`,
`TauCetiRoadmap.IharaZetaFunction.isRamanujan_iff_satisfiesRiemannHypothesis`); Mathlib
`Matrix.charpoly_reindex`, `Matrix.IsHermitian.charpoly_eq`.

**Checks.**

- From `K_(3,3)`, the first good signing in lexicographic order gives a connected bipartite
  3-regular Ramanujan graph on 12 vertices, and again on 24 (exact Sturm counts against
  `2√2 = √8`).
- `d = 2` is excluded: the all-`+1` signing of `C₄` has every eigenvalue at most `2 = 2√1`, but
  its lift is two copies of `C₄`; here `2√(d − 1) = d`.
- `d = 1`: both lifts of `K₂` are disconnected.
- Bipartiteness is used: for `K₄` the all-`−1` signing has largest eigenvalue `1 ≤ 2√2` and the
  eigenvalue `−3`.
- `K₄ ⊔ K₄` satisfies `IsRamanujan 2` (eigenvalues `3, 3` and `−1` six times) and is disconnected.
- `K_(d,d)` has characteristic polynomial `x^(2d − 2)(x² − d²)` for `d = 3, 4, 5`.

### Examples

- `K_(3,3)` → 12 → 24 vertices, as in the first Check.

### Dependencies

Layers 1 and 2; MatchingPolynomial 1.1, 2.1, 4.2; SpectralGraphBounds 1.4; IharaZetaFunction 5.3.

## Layer 4: the Ramanujan property as a square-root error term

### 4.1 Counts of closed non-backtracking walks

Let `G` be `(q + 1)`-regular with `q ≥ 1`, on `n` vertices with `e` edges, and let `κ` and `β` be
the multiplicities of the eigenvalues `q + 1` and `−(q + 1)`. Write `N_m` for
`closedNonBacktrackingCount G m` and
`M_m = (e − n)(1 + (−1)^m) + κ (q^m + 1) + β ((−q)^m + (−1)^m)`.

- **The error term** (`abs_closedNonBacktrackingCount_sub_le`): if `G` is Ramanujan then
  `|N_m − M_m| ≤ 2 (n − κ − β) q^(m/2)` for every `m ≥ 1`; and `G` is Ramanujan if and only if
  there is a constant `c` with `|N_m − M_m| ≤ c q^(m/2)` for every `m ≥ 1`.

Terras remarks, p. 45, that the Riemann hypothesis gives a good bound on the error term in the
graph prime number theorem; the precise statement for the counts `N_m`, in both directions, is
proved here. IharaZetaFunction 5.3 states the equivalence of the Ramanujan property with the
Riemann hypothesis; this target is its reading in terms of `N_m`.

*Proof route.* (1) *Power sums.* IharaZetaFunction 2.1 `iharaZeta_mul_charpolyRev` gives
`ζ(u) det(1 − uB) = 1` with `ζ = exp(Σ_m N_m u^m/m)`. Over `ℂ`, `det(1 − uB) = Π_μ (1 − μu)` over
the roots `μ` of the characteristic polynomial of `B` with multiplicity (Mathlib
`Matrix.reverse_charpoly`). Applying `u d/du log` to both sides,
`Σ_(m ≥ 1) N_m u^m = Σ_μ Σ_(m ≥ 1) μ^m u^m`, so `N_m = Σ_μ μ^m` for `m ≥ 1`. (2) *The roots.*
By IharaZetaFunction 5.1 `charpoly_hashimotoMatrix_of_isRegularOfDegree`, the roots are `1` and
`−1`, each `e − n` times, and the two roots of `X² − λ_v X + q` for each eigenvalue `λ_v` of `A`.
Every `|λ_v| ≤ q + 1` (SpectralGraphBounds 1.2 `largestEigenvalue_le_maxDegree` and 1.3
`abs_adjEigenvalues_le`; the unsorted and sorted lists are permutations of each other). For
`λ_v = q + 1` the roots are `1, q`; for `λ_v = −(q + 1)` they are `−1, −q`; for `|λ_v| ≤ 2√q`
they are complex conjugate, or equal, of modulus `√q`; for `2√q < |λ_v| < q + 1` they are real,
of one sign, with moduli `ρ_v ∈ (√q, q)` and `q/ρ_v`, because `t + q/t` increases on `(√q, ∞)`
and equals `q + 1` at `t = q`. So `N_m − M_m = E_m`, the sum of `μ^m` over the roots coming from
the `n − κ − β` eigenvalues with `|λ_v| ≠ q + 1`. (3) If `G` is Ramanujan each of these
`2(n − κ − β)` roots has modulus `√q`, which gives the bound with `c = 2(n − κ − β)`. (4) If `G`
is not Ramanujan, let `ρ > √q` be the largest `ρ_v`. The roots of modulus `ρ` are real, so
`E_m = a ρ^m + b (−ρ)^m + R_m` with integers `a, b ≥ 0`, `a + b ≥ 1`, and `|R_m| ≤ 2n ρ'^m` for
some `ρ' < ρ`. For even `m`, `|E_m| ≥ ρ^m − 2n ρ'^m`; a bound `|E_m| ≤ c q^(m/2)` would give
`1 ≤ c (√q/ρ)^m + 2n (ρ'/ρ)^m`, whose right side tends to `0`.

*Needs:* IharaZetaFunction 2.1, 5.1 and 5.3 (`IsRamanujan`; `closedNonBacktrackingCount`);
SpectralGraphBounds 1.2, 1.3; Mathlib `Matrix.reverse_charpoly`, `PowerSeries.exp`.

**Checks.**

- `E_m² ≤ 4 (n − κ − β)² q^m` for `1 ≤ m ≤ 14` on `K₄` and `K_(3,3)`, for `m ≤ 12` on the Petersen
  graph and on `K₄ ⊔ K₄` (disconnected, `κ = 2`), for `m ≤ 10` on the Heawood graph (`q = 2`), and
  on `C₅` with `q = 1` for `m ≤ 14` (exact, `N_m` as the trace of the `m`-th power of the
  Hashimoto matrix). On `K₄`, `E_3 = 15` against the bound `6 · 2^(3/2)`, whose square is `288`.
- The traces agree with a direct enumeration of closed non-backtracking walks on `K₄` and
  `K_(3,3)` for `m ≤ 6`; `N₃ = N₄ = 24` on `K₄`.
- Two copies of `K₆` minus an edge, joined by two edges at the ends of the deleted edges, form a
  5-regular graph (`q = 4`) that is not Ramanujan; `E_m²/(4(n − κ − β)² q^m)` is
  `98624761/31719424`, about `3.1`, at `m = 8`, about `35` at `m = 10` and about `172` at
  `m = 12`.
- `m ≥ 1` is needed: `N_0 = n` (the walks of length zero), while `M_0 = 2(e − n) + 2κ + 2β`. For
  `K₆` (`q = 4`, Ramanujan, `κ = 1`, `β = 0`) this gives `|N_0 − M_0| = |6 − 20| = 14`, above
  `2(n − κ − β) = 10`.

### Examples

- For `K₄` (`q = 2`, `κ = 1`, `β = 0`, `e − n = 2`), `M_m = 2(1 + (−1)^m) + 2^m + 1` and the three
  eigenvalues `−1` each contribute two roots of modulus `√2`.

### Dependencies

IharaZetaFunction 2.1, 5.1, 5.3; SpectralGraphBounds 1.2, 1.3. Layers 1–3 are not needed.

## Layer 5: the regular tree and the spectra of large regular graphs

### 5.1 Closed walks and the tree

Define `treeWalkCount d ℓ h` by recursion on `ℓ`: `1` at `ℓ = 0`, `h = 0` and `0` at `ℓ = 0`,
`h > 0`; `treeWalkCount d (ℓ + 1) 0 = treeWalkCount d ℓ 1`; and
`treeWalkCount d (ℓ + 1) (h + 1) = w_h · treeWalkCount d ℓ h + treeWalkCount d ℓ (h + 2)` with
`w_0 = d` and `w_h = d − 1` for `h ≥ 1`. It counts the walks of length `ℓ` from the root of the
`d`-regular tree that end at distance `h`, summed over the vertices at that distance; the tree
numbers are `t_ℓ = treeWalkCount d ℓ 0`. No infinite graph is built.

- **Closed walks versus the tree** (`treeWalkCount_le_adjMatrix_pow_apply`): in a `d`-regular
  graph, for every vertex `v` and length `ℓ`, the number `(A^ℓ)_(vv)` of closed walks of length
  `ℓ` at `v` is at least `t_ℓ`, with equality when the vertices at distance at most `⌊ℓ/2⌋` from
  `v` (Mathlib's `edist`, so other components are not included) induce an acyclic graph.

McKay, Lemma 2.1, p. 205 (the equality, with the formula
`t_(2s) = Σ_(k=1..s) C(2s − k, s) (k/(2s − k)) d^k (d − 1)^(s − k)` for `s ≥ 1`); Hoory–Linial–
Wigderson, §5.2.2, pp. 484–485 (the inequality, "in any regular graph").

*Proof route.* A walk of length `ℓ` in the tree from the root is a sequence of moves, each
either towards the root or to one of the `d` (at the root) or `d − 1` (elsewhere) children, so
`t_ℓ` counts move sequences whose height returns to `0`. Fix at each vertex `x` of `G` an
enumeration of its `d` neighbours. Map a move sequence to a walk in `G` from `v`, keeping a stack,
a non-backtracking walk from `v` to the current vertex: a move towards the root pops the stack,
going back to the previous vertex; a move to the `i`-th child goes to the `i`-th neighbour of the
current vertex, the previous vertex of the stack omitted from the enumeration (at height `0`
nothing is omitted). The walk returns to `v` when the height does. The map is injective: from
the walk, a step to the vertex just below the top of the stack is a move towards the root, and
any other step is a move to a child whose index the enumeration determines. With Mathlib
`SimpleGraph.adjMatrix_pow_apply_eq_card_walk` this proves the inequality. For the equality, a
closed walk of length `ℓ` at `v` stays within distance `⌊ℓ/2⌋` of `v`, and so does its stack. A
closed walk not in the image ends with a nonempty stack, a closed non-backtracking walk of
positive length inside the ball; in an acyclic graph a non-backtracking walk is a path
(induction on the length with Mathlib `SimpleGraph.IsAcyclic.subsingleton_path`), and a closed path
has length `0`.

*Needs:* Mathlib `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `SimpleGraph.edist`,
`SimpleGraph.IsAcyclic.subsingleton_path`.

**Checks.**

- `t_ℓ` equals the number of closed walks at the root of a truncated `d`-regular tree for
  `d ≤ 5`, `ℓ ≤ 10`, and McKay's formula for `d ≤ 7`, `2s ≤ 16`; odd lengths give `0`;
  `t_4(3) = 15`, `t_6(3) = 87`, and `t_(2s)(2) = C(2s, s)`.
- `t_(2s) ≥ C_s (d − 1)^s` with `C_s` the Catalan number, `d ≤ 7`, `s ≤ 10` (every up-move has at
  least `d − 1` choices; Hoory–Linial–Wigderson, p. 485).
- The inequality, and the equality whenever the ball of radius `⌊ℓ/2⌋` is acyclic, for `ℓ ≤ 10`
  at every vertex of `K₄`, `K_(3,3)`, `K_(4,4)`, `Q₃`, the Petersen and Heawood graphs, `C₅`, the
  edgeless graph on three vertices (`d = 0`) and `K₄ ⊔` Heawood (disconnected; the `K₄` component
  is not in the balls of the Heawood vertices).
- Regularity is needed: the path `P₃` is acyclic, but at an end vertex `(A²)_(vv) = 1 < 2 = t_2(2)`.

### 5.2 The Kesten–McKay law

Define `kestenMcKay d` as the measure on `ℝ` with density
`d √(4(d − 1) − x²) / (2π (d² − x²))`, which is `0` for `|x| > 2√(d − 1)` because the square root of
a negative number is `0`; for `d = 2` it is the arcsine law `1/(π √(4 − x²))` on `(−2, 2)`.

- **Moments** (`kestenMcKay_moments`): for `d ≥ 2`, `kestenMcKay d` is a probability measure,
  carried by `[−2√(d − 1), 2√(d − 1)]`, and `∫ x^ℓ d(kestenMcKay d) = t_ℓ` for every `ℓ`.

The density is McKay's, Thm 1.1 and the abstract, pp. 203–204; McKay derives it from the moments
`t_ℓ` by a Chebyshev expansion, §3, pp. 210–213. The route below verifies the moments directly.

*Proof route.* (1) *Non-backtracking polynomials.* Let `P_0 = 1`, `P_1 = x`, `P_2 = x² − d` and
`P_(m+1) = x P_m − (d − 1) P_(m−1)` for `m ≥ 2`, and `N_0 = 1`, `N_m = d (d − 1)^(m − 1)`. By
induction on `ℓ` with the recursion of `treeWalkCount`,
`x^ℓ = Σ_m (treeWalkCount d ℓ m / N_m) P_m`, so the coefficient of `P_0` is `t_ℓ`.
(2) *Orthogonality.*
Put `a = d − 1` and `x = 2√a cos θ`, `θ ∈ (0, π)`. Then `√(4a − x²) = 2√a sin θ`,
`d² − x² = 1 + a² − 2a cos 2θ`, and the measure becomes
`(2 d a/π) sin²θ / (1 + a² − 2a cos 2θ) dθ`. By induction,
`P_m(x) sin θ = a^(m/2) (sin (m + 1)θ − a⁻¹ sin (m − 1)θ)` for `m ≥ 1`. For `a > 1`,
`∫_0^π cos kθ / (1 + a² − 2a cos 2θ) dθ` is `π a^(−k/2)/(a² − 1)` for even `k` and `0` for odd `k`
(the Poisson kernel `Σ_j a^(−|j|) e^(2ijθ)/(a² − 1)`, uniformly convergent). Writing
`sin θ sin jθ` as a difference of cosines, `∫ P_m` vanishes for odd `m` and, for `m = 2r ≥ 2`, is
a multiple of `(a^(−r) − a^(−r−1)) − a⁻¹ (a^(−r+1) − a^(−r)) = 0`; for `m = 0` it is
`d a (1 − a⁻¹)/(a² − 1) = 1`. For `d = 2` the measure is `dθ/π` and `P_m = 2 cos mθ`, so the same
holds. (3) Hence the total mass is `1`, the moments are `t_ℓ`, and the support statement holds
because the density vanishes outside the interval. The density is integrable (its integral is
`1`) and `x^ℓ` is bounded on the support, so the moments are honest integrals.

*Needs:* 5.1 (the definition `treeWalkCount`); Mathlib `MeasureTheory.Measure.withDensity`,
`intervalIntegral.integral_comp_mul_deriv`, `Real.cos`, `Real.sin`.

**Checks.**

- The moments computed exactly by the substitution of the route equal `t_ℓ` for
  `d ∈ {2, 3, 4, 5, 7, 10}` and `ℓ ≤ 14`.
- `∫ P_m = 0` for `1 ≤ m ≤ 9` and `d ∈ {2, 3, 4, 6}`, and the expansion of `x^ℓ` in the `P_m` holds
  for `d ∈ {2, 3, 5}`, `ℓ ≤ 9` (exact).
- `d = 2`: the even moments `C(2s, s)` of the arcsine law count the closed walks at `0` in the
  2-regular tree, which is the line `ℤ`.
- `d ≤ 1` is excluded: the formula gives the zero measure.

### 5.3 McKay's theorem

- **Weak convergence** (`tendsto_integral_spectralMeasure_kestenMcKay`): let `d ≥ 2` and let
  `G_j` be `d`-regular graphs on nonempty vertex types such that, for every `k`, the proportion
  of vertices of `G_j` that lie on a cycle of length `k` tends to `0`. Then for every bounded
  continuous `f`, `∫ f dL_(G_j) → ∫ f d(kestenMcKay d)`, where `L_G` is the empirical spectral
  measure.

McKay, Thm 1.1, p. 204, stated with the number `c_k` of `k`-cycles and with the extra hypothesis
that the number of vertices tends to infinity; Hoory–Linial–Wigderson, Thm 7.2, pp. 494–495.
For bounded degree the two cycle conditions are equivalent: a vertex lies on at most `d^(k−1)`
cycles of length `k`, and a `k`-cycle has `k` vertices. The extra hypothesis follows: a
`d`-regular graph with `d ≥ 2` on at most `N` vertices has a cycle of length at most `N`, so if
infinitely many `G_j` had at most `N` vertices, some fixed `k ≤ N` would have proportion at least
`1/N` for infinitely many `j`.

*Proof route.* By the method of moments (Tau Ceti
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`, the realisation of
RandomMatrices 3.2) with the compact set `[−2√(d − 1), 2√(d − 1)]` and the limit `kestenMcKay d`
(5.2), and then `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, it
suffices that `∫ x^ℓ dL_(G_j) → t_ℓ` for every `ℓ` (spectral measures have finite support, so
every moment is integrable). By Tau Ceti `Matrix.integral_spectralMeasure` and
`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`, `∫ x^ℓ dL_G = n⁻¹ tr A^ℓ =
n⁻¹ Σ_v (A^ℓ)_(vv)`. Let `R = ⌊ℓ/2⌋`. If the ball of radius `R` around `v` induces a graph with a
cycle, then `v` is within distance `R` of a vertex on a cycle of length at most `2R + 1`: in a
breadth-first spanning tree of the ball rooted at `v`, an edge `xy` outside the tree closes a
cycle through the tree paths from the last common ancestor of `x` and `y`, of length at most
`2R + 1`. The number of such `v` is at most `Σ_(k ≤ 2R + 1) c'_k (R + 1) d^R`, where `c'_k` is the
number of vertices on `k`-cycles, so their proportion tends to `0`. At every other vertex
`(A^ℓ)_(vv) = t_ℓ` (5.1), and at these `t_ℓ ≤ (A^ℓ)_(vv) ≤ d^ℓ`. Hence
`|n⁻¹ tr A^ℓ − t_ℓ| ≤ d^ℓ` times that proportion, which tends to `0`.

*Needs:* 5.1, 5.2; RandomMatrices 1.1 and 3.2 through Tau Ceti `Matrix.spectralMeasure`,
`Matrix.integral_spectralMeasure`, `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`,
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`.

**Checks.**

- In a `d`-regular graph of girth greater than `2⌊ℓ/2⌋ + 1` every ball of radius `⌊ℓ/2⌋` is a
  tree, so the `ℓ`-th moment of the spectral measure is exactly `t_ℓ` (5.1): the Heawood graph
  (girth 6) has `n⁻¹ tr A^4 = 15 = t_4(3)`.
- The cycle hypothesis is needed: `j` disjoint copies of `K₄` keep the spectral measure
  `(3/4) δ₋₁ + (1/4) δ₃`, whose second moment `3 = t_2(3)` agrees but whose third moment
  `(−3 + 27)/4 = 6` is not `t_3 = 0`; every vertex lies on a triangle.
- For `d = 2` the hypothesis says that short cycles carry a vanishing proportion of the vertices,
  and the limit is the arcsine law (McKay, p. 204, through the eigenvalues `2 cos(2πk/n)` of the
  `n`-cycle).

### 5.4 Serre's theorem

- **Many large eigenvalues** (`exists_pos_mul_le_card_lt_adjEigenvalues`): for every `d` and
  `ε > 0` there is `c > 0` such that every `d`-regular graph on `n` vertices has at least `c n`
  adjacency eigenvalues greater than `2√(d − 1) − ε`.

Hoory–Linial–Wigderson, Thm 5.8 and Cioabă's proof, pp. 487–488, credited there to Serre.

*Proof route.* For `d ≤ 1`: `2√(d − 1) − ε = −ε`; for `d = 0` every eigenvalue is `0`, and for
`d = 1` the graph is a perfect matching and the eigenvalue `1` has multiplicity `n/2`
(SpectralGraphBounds 1.4: one per component); take `c = 1/2`. Let `d ≥ 2`, `u = d + 2√(d − 1)`
and `T = 2√(d − 1) − ε`. Every eigenvalue lies in `[−d, d]` (SpectralGraphBounds 1.2 and 1.3). If
`T < −d`, every eigenvalue exceeds `T` and `c = 1` works. Otherwise let `N` be the number of
eigenvalues greater than `T`. For `k ≥ 1`,
`tr (A + dI)^k = Σ_i (λ_i + d)^k ≤ N (2d)^k + n (u − ε)^k`.
On the other hand `tr (A + dI)^k = Σ_j C(k, j) d^(k−j) tr A^j`, every `tr A^j ≥ 0`, and
`tr A^(2l) ≥ n t_(2l)` (5.1). Next, `t_(2l) ≥ C_l (d − 1)^l` with `C_l` the Catalan number: the
height sequences of 5.1 that return to `0` after `2l` steps are the `C_l` Dyck paths, and each has
weight at least `(d − 1)^l`, since each of its `l` up-steps has weight `d` or `d − 1`. Moreover
`C_l ≥ 4^l/((2l + 1)(l + 1)) ≥ 4^l/(k + 1)²` for `2l ≤ k`, because `C(2l, l)` is the largest of
`2l + 1` binomial coefficients with sum `4^l`. So
`tr (A + dI)^k ≥ n (k + 1)⁻² Σ_l C(k, 2l) d^(k−2l) (4(d − 1))^l`; the sum equals
`(u^k + (d − 2√(d − 1))^k)/2 ≥ u^k/2`, since `d² ≥ 4(d − 1)`. Hence
`N ≥ n (u^k/(2(k + 1)²) − (u − ε)^k)/(2d)^k`. Since `(1 − ε/u)^k · 2(k + 1)² → 0`, some `k` makes
the bracket positive, and `c` is that quotient divided by `n`, which does not depend on `G`.

*Needs:* 5.1; SpectralGraphBounds 1.1 (the definition `adjEigenvalues`), 1.2, 1.3, 1.4; Tau Ceti
`Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`.

**Checks.**

- Cioabă's lower bound `tr (A + dI)^k ≥ n Σ_l C(k, 2l) d^(k−2l) t_(2l)` holds on `K₄`, the
  Petersen graph, `Q₃` and `K_(3,3)` for `k ≤ 8` (exact).
- `C(2l, l)(2l + 1) ≥ 4^l` for `l ≤ 30`, and `d² ≥ 4(d − 1)` for `d ≤ 50`.
- `c` must depend on `d`: disjoint copies of `K_(d,d)` have only the eigenvalue `d` above
  `2√(d − 1) − ε` for `ε < 2√(d − 1)`, a proportion `1/(2d)`.

### Examples

- For `d = 3`, `u = 3 + 2√2` and `ε = 1`, the bracket is positive when
  `2(k + 1)² (1 − 1/u)^k < 1`; since `1 − 1/u = 2√2 − 2`, at `k = 60` this reads
  `2 · 61² · 4^30 < (3 + 2√2)^30`, which holds (exact). So every cubic graph on `n` vertices has
  at least `(u^60/(2 · 61²) − (u − 1)^60)/6^60 · n` eigenvalues above `2√2 − 1`.

### Dependencies

5.1 for 5.2–5.4 and 5.2 for 5.3; SpectralGraphBounds 1.1–1.4; RandomMatrices 1.1 and 3.2
through Tau Ceti. Layers 1–4 are not needed.

## Scope and ownership

This roadmap is built on five others and restates none of their theorems. From MatchingPolynomial
it copies the matching polynomial and the signed adjacency matrix (1.1, 2.1) and uses the
Godsil–Gutman average (2.1) and the root bound (4.2); that roadmap lists interlacing families,
2-lifts and the existence of Ramanujan graphs outside its scope, and this roadmap starts there.
The real-rootedness of the matching polynomial (Heilmann–Lieb), Godsil's path tree and the
interlacing of the matching polynomial under vertex deletion are MatchingPolynomial 3–4 and are
not restated. From IharaZetaFunction it copies `IsRamanujan`, `SatisfiesRiemannHypothesis`, the
Hashimoto matrix and the counts `N_m`, and uses the zeta function (2.1), the spectrum of the
Hashimoto matrix of a regular graph (5.1) and the equivalence of the Ramanujan property with the
Riemann hypothesis (5.3), which is not restated. From SpectralGraphBounds it copies the sorted
eigenvalues (1.1) and uses the eigenvalue bounds (1.2, 1.3) and the multiplicity of the degree
(1.4); the Alon–Boppana bound and Quenell's bound are SpectralGraphBounds 5.1–5.2 and are not
restated. From EigenvalueAndSingularValueInequalities, by Bastiaan Braams, it uses the converse
of Cauchy interlacing (3.4) in the route of 1.2. From RandomMatrices, on which Bastiaan Braams,
Chris Birkbeck and Kim Morrison have worked, it uses the spectral-measure convention (1.1) and
the method of moments (3.2), both as realised in Tau Ceti.

GraphSpectra, also by Bastiaan Braams, treats the spectra of graphs as such (Perron–Frobenius for
graphs, bounds on the largest eigenvalue, bipartiteness criteria, the spectra of standard
graphs); it leaves expansion to other roadmaps and names expander graphs among its downstream
consumers (its Downstream consumers and Scope and ownership). This roadmap states no expansion
property and none of the consequences of a spectral gap (mixing, walks, codes, vertex expansion,
diameter): its statements concern the spectra of lifts, the existence of Ramanujan graphs, the
spectral distribution of large regular graphs and the counts of non-backtracking walks. None of
GraphSpectra's statements is used here; closed walks as traces are taken from Mathlib.

KestenAmenabilityAndSpectralRadius 3.1 computes the spectral radius of the simple random walk on
the free group of rank `k`, whose Cayley graph is the `2k`-regular tree, and lists the
Kesten–McKay law outside its scope. Its statements are not used here: the tree numbers of 5.1 are
defined combinatorially for every `d`, odd degrees included, and their growth enters 5.4 through
the Catalan bound.

Not treated here: explicit constructions of Ramanujan graphs (Lubotzky–Phillips–Sarnak,
Margulis, Morgenstern); non-bipartite Ramanujan graphs of every degree; bipartite Ramanujan
graphs of every size (Marcus–Spielman–Srivastava, *Interlacing families IV*); `r`-lifts and
coverings by permutations; the infinite universal cover and its `ℓ²` spectral radius; biregular
graphs; mixed characteristic polynomials and the Kadison–Singer problem; the Borcea–Brändén
characterization of stability preservers; random regular graphs, Friedman's theorem and the
expected eigenvalue distribution of random regular graphs (McKay, §4); prime cycles and the
Euler product of the zeta function; algorithms for finding good signings.

## Exact supplier contracts

### From Mathlib

- Polynomials: `Polynomial.Splits`, `Polynomial.roots`, `Polynomial.splits_iff_card_roots`,
  `intermediate_value_Icc`.
- Matrices: `Matrix.charpoly`, `Matrix.charpoly_units_conj`, `Matrix.charpoly_reindex`,
  `Matrix.charpoly_fromBlocks_zero₁₂`, `Matrix.charpoly_map`, `Matrix.reverse_charpoly`,
  `Matrix.IsHermitian.splits_charpoly`, `Matrix.IsHermitian.charpoly_eq`,
  `Matrix.det_add_replicateCol_mul_replicateRow` (an invertible determinant), `AlgHom.map_det`,
  `Matrix.vecMulVec`.
- Multivariate polynomials: `MvPolynomial.aeval`, `MvPolynomial.pderiv`,
  `MvPolynomial.optionEquivLeft` (`MvPolynomial (Option τ) R ≃ₐ[R] Polynomial (MvPolynomial τ R)`).
- Graphs: `SimpleGraph.adjMatrix`, `SimpleGraph.isHermitian_adjMatrix`,
  `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`, `SimpleGraph.IsRegularOfDegree`,
  `SimpleGraph.IsBipartite`, `SimpleGraph.Connected`, `SimpleGraph.edist`,
  `SimpleGraph.IsAcyclic.subsingleton_path`, `SimpleGraph.Walk.IsCycle`, `SimpleGraph.fromRel`.
- Measures: `MeasureTheory.Measure.withDensity`,
  `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`,
  `intervalIntegral.integral_comp_mul_deriv`, `PowerSeries.exp`.

### From Tau Ceti

- `TauCeti/Analysis/Matrix/SpectralMeasure.lean`: `Matrix.spectralMeasure` (`[Nonempty n]`, a
  Hermitian matrix; a `ProbabilityMeasure ℝ`), `Matrix.integral_spectralMeasure`. Imported by
  `Suggested.lean`.
- `TauCeti/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.trace_pow_eq_sum_eigenvalues_pow`.
- `TauCeti/Probability/Moments/WeakConvergence.lean`:
  `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` (a limit carried by a compact
  set, moments eventually integrable and convergent).
- `TauCeti/Analysis/Polynomial/ContinuityOfRoots/Basic.lean`:
  `Polynomial.eventually_exists_C_mul_prod_X_sub_C_norm_sub_lt` (roots of a family of fixed degree
  with continuous coefficients, matched with multiplicity within `ε`, over an algebraically closed
  normed field).

### From TauCetiRoadmap.MatchingPolynomial

- 1.1 `matchingCount`, `matchingPolynomial` and 2.1 `signedAdjMatrix`, copied verbatim.
- 2.1 `sum_charpoly_signedAdjMatrix` (`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`): the
  characteristic polynomials of all signings sum to `2^|E|` times the matching polynomial; used in
  3.2.
- 4.2 `abs_le_of_isRoot_matchingPolynomial` (`2 ≤ d`, every degree at most `d`): every real root
  `x` has `|x| ≤ 2√(d − 1)`; used in 3.2 (consequence) and 3.3.

### From TauCetiRoadmap.IharaZetaFunction

- 1.1 `hashimotoMatrix`, 1.2 `IsNonBacktrackingCycle`, `closedNonBacktrackingCount`, 5.3
  `IsRamanujan`, `SatisfiesRiemannHypothesis`, copied verbatim.
- 2.1 `iharaZeta_mul_charpolyRev`: `ζ(u) det(1 − uB) = 1`; used in 4.1.
- 5.1 `charpoly_hashimotoMatrix_of_isRegularOfDegree` (`1 ≤ q`, `(q + 1)`-regular):
  `charpoly B = (X² − 1)^(e − n) Π_v (X² − λ_v X + q)`; used in 4.1.
- 5.3 `TauCetiRoadmap.IharaZetaFunction.isRamanujan_iff_satisfiesRiemannHypothesis`
  (`2 ≤ q`, `(q + 1)`-regular); used in 3.3.

### From TauCetiRoadmap.SpectralGraphBounds

- 1.1 `adjEigenvalues`, copied verbatim; used in 5.4.
- 1.2 `largestEigenvalue_le_maxDegree` and 1.3 `abs_adjEigenvalues_le` (`[Nonempty V]`): every
  eigenvalue has absolute value at most the maximum degree; used in 4.1 and 5.4.
- 1.4 `card_adjEigenvalues_eq_degree` (`d`-regular): the eigenvalue `d` has multiplicity the
  number of connected components; used in 3.3 and 5.4.

### From TauCetiRoadmap.EigenvalueAndSingularValueInequalities

- 3.4 `exists_hyperplane_eigenvalues_compression_eq` (a symmetric operator on a space of dimension
  `n + 1` over `RCLike 𝕜`, and `β : Fin n → ℝ` interlacing its eigenvalues): a hyperplane whose
  compression has eigenvalues `β`; used in 1.2.

### From TauCetiRoadmap.RandomMatrices

- Conventions 3 and 1.1: the empirical spectral measure `L_A = n⁻¹ Σ δ_(λ_i)` is Tau Ceti's
  `Matrix.spectralMeasure`; 3.2: moment convergence implies weak convergence for a compactly
  supported limit, Tau Ceti's `tendsto_of_tendsto_integral_pow`; used in 5.3.

## References

- Y. Bilu and N. Linial, *Constructing expander graphs by 2-lifts and discrepancy vs. spectral
  gap*, arXiv math/0312022v3 (2004), published as *Lifts, discrepancy and nearly optimal spectral
  gap*, Combinatorica 26 (2006), 495–519, doi:10.1007/s00493-006-0029-7; page numbers of
  arXiv v3: §2, p. 5 (signings and 2-lifts); Lemma 3.1, p. 5.
- S. Hoory, N. Linial and A. Wigderson, *Expander graphs and their applications*, Bull. Amer.
  Math. Soc. 43 (2006), 439–561: §5.2.2, pp. 484–485; Thm 5.8 and Cioabă's proof, pp. 487–488;
  Thm 7.2, pp. 494–495; Lemma 7.3, p. 495.
- A. W. Marcus, D. A. Spielman and N. Srivastava, *Interlacing families I: bipartite Ramanujan
  graphs of all degrees*, Ann. of Math. 182 (2015), 307–325, doi:10.4007/annals.2015.182.1.7;
  arXiv:1304.4132v2, whose page numbers are used: Def 4.1, p. 6; Lemma 4.2, Def 4.3, Thm 4.4,
  p. 7; Lemma 4.5, Thms 5.1–5.3, p. 8; Lemma 5.4, Thm 5.5, p. 9; Def 6.1, Lemma 6.2, Cor 6.4,
  p. 10; Lemma 6.5, Thm 6.6, p. 11; proof of Thm 5.1, p. 12.
- B. D. McKay, *The expected eigenvalue distribution of a large regular graph*, Linear Algebra
  Appl. 40 (1981), 203–216, doi:10.1016/0024-3795(81)90150-6 (scan on the author's web page):
  abstract, p. 203; Thm 1.1, p. 204; Lemma 2.1, p. 205; §3, pp. 207–213.
- A. Terras, *A stroll through the garden of graph zeta functions*, draft (author's web page):
  the remark on the error term after Exercise 37, p. 45.
