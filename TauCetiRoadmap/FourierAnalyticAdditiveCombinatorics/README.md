# Roadmap: Fourier-analytic additive combinatorics

**Summary.** A set of elements of an abelian group is free of three-term progressions when
`x + z = 2y` has no solutions in it except `x = y = z`. This roadmap bounds the size of such sets
in finite groups by two methods. The first is Fourier analysis: the number of progressions in a
set is a sum over the characters of the group, so a set with few progressions has a large
nontrivial character sum, which in `𝔽_pⁿ` forces a denser piece of the set on a hyperplane. The
second is the polynomial method of Croot, Lev and Pach, which bounds the rank of a matrix built
from a low-degree polynomial.

- *The counting lemma.* For a subset `A` of a finite abelian group `G`, if every nontrivial
  character sum `∑_{a ∈ A} ψ(a)` has modulus at most `M ≥ 0`, then `|A|³ ≤ |G| (N₃(A) + M |A|)`,
  where `N₃(A)` is the number of triples `(x, y, z) ∈ A³` with `x + z = 2y`. So in a nontrivial
  group a set without nontrivial progressions has a nontrivial character sum of modulus at
  least `|A|²/|G| − 1`.
- *Meshulam's theorem.* For a prime `p`, a subset of `𝔽_pⁿ` without nontrivial three-term
  progressions has at most `6 · pⁿ / n` elements, for every `n ≥ 1`. The route is a density
  increment: when `|A|² ≥ 2 · pⁿ`, the set has density at least `α + α²/4` on some coset of a
  hyperplane, where `α = |A|/pⁿ`.
- *The Ellenberg–Gijswijt theorem.* Over a finite field with `q` elements, let `α + β + γ = 0`.
  If the only solutions of `α a₁ + β a₂ + γ a₃ = 0` with all three points in `A ⊆ 𝔽_qⁿ` have
  `a₁ = a₂ = a₃`, then `|A|` is at most three times the number of monomials in `n` variables
  of total degree at most `(q − 1)n/3` in which every variable has degree at most `q − 1`. In
  `𝔽₃ⁿ` it gives `|A| ≤ 3 (1 + x + x²)ⁿ / x^(2n/3)` for every `x > 0` and every set without
  nontrivial three-term progressions; at `x = (√33 − 1)/8` this is below `3 · 2.756ⁿ`.
- *Bogolyubov's lemma.* If `A` is a nonempty subset of a finite vector space `V` over `𝔽_p`,
  then `A + A − A − A` contains a subspace whose codimension `c` satisfies `c |A|² < |V|²`. In a
  general finite abelian group `G` there are fewer than `|G|²/|A|²` characters such that every
  `x` at which all of them have nonnegative real part lies in `A + A − A − A`.

The roadmap builds on Mathlib's additive characters of finite abelian groups with their
orthogonality, its sets free of three-term progressions and its polynomials over a finite field.
Mathlib already proves the qualitative theorem of Roth and Behrend's lower bound; this roadmap
adds quantitative bounds. FourierDeligneTransform, in Layer 0, develops the Fourier transform on a
finite vector space over a finite field; nothing here uses it.

Layer 2 uses Layer 1, Layer 3 uses no other layer, and Layer 4 uses Parseval's identity (1.1).

## Conventions

- **Groups and characters.** `G` is a finite additive commutative group with decidable equality.
  Its characters are Mathlib's `AddChar G ℂ`, homomorphisms into the multiplicative group of `ℂ`;
  the trivial character is `0`, and there are `|G|` characters (`AddChar.card_eq`).
- **Character sums.** For a finite set `A ⊆ G` and a character `ψ`, `S_A(ψ) = ∑_{a ∈ A} ψ(a)`.
  It is not normalized: the normalized Fourier coefficient of the indicator of `A` at `ψ`, in
  the convention `f̂(ψ) = 𝔼_x f(x) conj ψ(x)`, is `conj S_A(ψ) / |G|`, of the same modulus as
  `S_A(ψ)/|G|`. `S_A(0) = |A|`.
- **Progressions.** `N₃(A)` is the number of triples `(x, y, z) ∈ A³` with `x + z = y + y`. It
  counts the `|A|` trivial triples `x = y = z`, and it equals the number of pairs `(x, d)` with
  `x, x + d, x + 2d ∈ A`, through `d = y − x`. A set is free of nontrivial three-term
  progressions when it satisfies Mathlib's `ThreeAPFree`: `a + c = b + b` forces `a = b` (and
  then `c = b`). In an elementary abelian `2`-group this holds only for sets with at most one
  element.
- **The space `𝔽_qⁿ`.** It is `Fin n → F` for a finite field `F` with `q = Nat.card F` elements,
  and `𝔽_pⁿ` is `Fin n → ZMod p` for a prime `p`. A hyperplane coset is a set `{x : φ x = c}`
  with `φ` a nonzero
  linear functional (`Module.Dual`); it has `qⁿ⁻¹` points.
- **Monomial counts.** For a real number `d`, `m_d = m(q, n, d)` is the number of exponent
  vectors `e : Fin n → Fin q` with `e_1 + ⋯ + e_n ≤ d`: the monomials in `n` variables of degree
  at most `q − 1` in each variable and total degree at most `d`. Polynomials are Mathlib's
  `MvPolynomial (Fin n) F`, evaluated with `MvPolynomial.eval`.
- **Real and natural numbers.** Counts are natural numbers; densities, bounds and powers with
  real exponents are in `ℝ`. Division by zero does not occur in a statement except where a
  Check says so.

## Layer 1: character sums and the count of three-term progressions

### 1.1 Parseval's identity for a set

Define `charSum`, with `charSum A ψ = S_A(ψ)`. Prove `sum_norm_charSum_sq`: for every finite
set `A ⊆ G`, `∑_ψ |S_A(ψ)|² = |G| · |A|`, the sum running over all characters (Zhao,
Theorem 6.1.3, p. 204, for `G = 𝔽_pⁿ` and the indicator of `A` in the normalized convention).

Route: `|S_A(ψ)|² = ∑_{a, b ∈ A} ψ(a − b)`, because `conj ψ(b) = ψ(−b)`
(`AddChar.map_neg_eq_conj`). Exchange the sums and apply the orthogonality
`∑_ψ ψ(x) = |G|` for `x = 0` and `0` otherwise (`AddChar.sum_apply_eq_ite`).

**Checks.**
- `A = G`: `S_G(ψ)` is `|G|` for `ψ = 0` and `0` otherwise (`AddChar.sum_eq_ite`), and the
  identity reads `|G|² = |G| · |G|`.
- `A = {0}`: every `S_A(ψ)` is `1`, and the identity reads `|G| = |G| · 1`. `A = ∅`: both sides
  are `0`.
- For `A = {0, 1} ⊆ ℤ/3`, `S_A` takes the values `2`, `1 + ω`, `1 + ω²` with `ω = e^(2πi/3)`,
  of squared moduli `4, 1, 1`; the sum `6` is `3 · 2`.

*Needs:* Mathlib `AddChar.sum_apply_eq_ite`, `AddChar.map_neg_eq_conj`. (Proved here.)

### 1.2 The counting identity

Define `threeAPCount`, with `threeAPCount A = N₃(A)`. Prove `card_mul_threeAPCount`: for every
finite set `A ⊆ G`,

    |G| · N₃(A) = ∑_ψ S_A(ψ)² · ∑_{y ∈ A} ψ(−2y),

where the inner sum is the conjugate of the character sum of `A` at the character
`y ↦ ψ(2y)` (Zhao, Proposition 6.1.9, p. 207, for `G = 𝔽_pⁿ` with `p` odd and three functions in
the normalized convention). No hypothesis on the order of `G` is needed.

Route: the indicator of `x + z − 2y = 0` is `|G|⁻¹ ∑_ψ ψ(x + z − 2y)` by
`AddChar.sum_apply_eq_ite`; sum over `x, y, z ∈ A` and factor.

**Checks.**
- `A = {0, 1} ⊆ ℤ/3`: the triples are `(0, 0, 0)` and `(1, 1, 1)`, since `0 + 1 = 2y` needs
  `y = 2`; so `N₃(A) = 2`. On the right, `ψ_k(−2y) = ω^(ky)` and the three terms are
  `2³ = 8`, `(1 + ω)³ = −1` and `(1 + ω²)³ = −1`, of sum `6 = 3 · 2`.
- Trivial progressions are counted: for `A = {0}` the identity reads `|G| · 1 = ∑_ψ 1`. A count
  of nontrivial progressions only would give `0` on the left.
- In `(ℤ/2)ⁿ`, `y + y = 0`, so `N₃(A) = |A|²` (the triples with `z = x`), and the right side is
  `|A| ∑_ψ S_A(ψ)² = |A| · 2ⁿ |A|` by 1.1, the character sums being real.

*Needs:* Mathlib `AddChar.sum_apply_eq_ite`. (Proved here.)

### 1.3 The counting lemma

Prove `card_pow_three_le`: let `A ⊆ G` and `M ≥ 0` with `|S_A(ψ)| ≤ M` for every nontrivial
character `ψ`. Then `|A|³ ≤ |G| (N₃(A) + M |A|)` (Zhao, Lemma 6.2.4, p. 210, for `G = 𝔽₃ⁿ` and
a function with values in `[0, 1]`).

Route: in 1.2 the term of `ψ = 0` is `|A|³`. If `ψ ≠ 0` and `ψ(2y) = 1` for all `y`, then `ψ`
takes the values `±1`, its term is `S_A(ψ)² · |A| ≥ 0` and is dropped. For every other `ψ ≠ 0`
the inner sum is the conjugate of a nontrivial character sum and has modulus at most `M`, so
these terms have total modulus at most `M ∑_{ψ ≠ 0} |S_A(ψ)|² ≤ M |G| |A|` by 1.1. The real part
of the identity gives the claim. No hypothesis on the order of `G` is needed: characters of
order two contribute nonnegative terms.

**Checks.**
- `G = ℤ/5`, `A = ℤ/5`: every nontrivial sum is `0`, so `M = 0` serves, and
  `125 ≤ 5 · 25` holds with equality.
- `G = ℤ/5`, `A = {0, 1}`: `N₃(A) = 2` and `|S_A(ψ_k)| = 2 |cos(πk/5)|`, at most
  `2 cos(π/5) ≈ 1.618`; the inequality reads `8 ≤ 5 (2 + 2 · 1.618) ≈ 26.2`.
- `M ≥ 0` is needed: in the trivial group there is no nontrivial character, so `M = −1` is
  allowed by the other hypothesis, and for `A = {0}` the claim would read `1 ≤ 1 · (1 − 1)`.

*Needs:* 1.1, 1.2. (Proved here.)

### 1.4 A large character sum

Prove `exists_ne_zero_norm_charSum_ge`: let `G` have at least two elements and let `A ⊆ G` be
free of nontrivial three-term progressions. Then some nontrivial character `ψ` has
`|S_A(ψ)| ≥ |A|²/|G| − 1` (Zhao, Lemma 6.2.6, p. 210, for `G = 𝔽₃ⁿ` with the weaker bound
`|A|²/(2|G|)` under `|A|² ≥ 2|G|`).

Route: under `ThreeAPFree`, the only triples are the trivial ones, so `N₃(A) = |A|`. A
nontrivial character exists because `G` has a nonzero element (`AddChar.exists_apply_ne_zero`).
Take `M` the largest modulus of a nontrivial character sum and divide 1.3 by `|G| |A|` (for
`A = ∅` the claim is `−1 ≤ |S_A(ψ)|`).

**Checks.**
- In `𝔽₃²`, `A = {(0, 0), (0, 1), (1, 0), (1, 1)}` is free of nontrivial progressions; the bound
  is `16/9 − 1 = 7/9`, and the character `x ↦ ω^(x₁)` has `S_A = 2 + 2ω`, of modulus `2`.
- In the trivial group there is no nontrivial character, while `A = {0}` is free of nontrivial
  progressions and `|A|²/|G| − 1 = 0`: the hypothesis that `G` is nontrivial is needed.

*Needs:* 1.3; Mathlib `ThreeAPFree`, `AddChar.exists_apply_ne_zero`. (Proved here.)

### Examples

The set `{0, 1}` in `ℤ/3` and `ℤ/5` with its character sums and progression count; the
four-point set free of progressions in `𝔽₃²` and its large character sum.

### Dependencies

Mathlib `AddChar`, `AddChar.sum_apply_eq_ite`, `AddChar.sum_eq_ite`, `AddChar.map_neg_eq_conj`,
`AddChar.exists_apply_ne_zero`, `AddChar.card_eq`, `ThreeAPFree`. No other layer.

## Layer 2: Meshulam's theorem in `𝔽_pⁿ`

### 2.1 The density increment

Prove `exists_hyperplane_density_increment`: let `p` be a prime, let `A ⊆ 𝔽_pⁿ` be free of
nontrivial three-term progressions with `2 · pⁿ ≤ |A|²`, and `α = |A|/pⁿ`. Then there are a
nonzero linear functional `φ` and `c ∈ 𝔽_p` such that `A` has density at least `α + α²/4` on the
coset `{φ = c}`, that is `p |{a ∈ A : φ(a) = c}| / pⁿ ≥ α + α²/4` (Zhao, Lemmas 6.2.6–6.2.8,
pp. 210–211, for `p = 3`; the route below is the same for every prime).

Route: for `p = 2` a set free of nontrivial progressions has at most one point (Conventions), so
the hypothesis fails. Let `p` be odd and `ω = e^(2πi/p)`. Every character of `𝔽_pⁿ` is
`x ↦ ω^(φ(x))` for a unique linear functional `φ`, nontrivial exactly when `φ ≠ 0`: restrict it
to the coordinate lines and use the characters of `ℤ/p` (`AddChar.zmodAddEquiv`). By 1.4, some
`φ ≠ 0` has `|S_A| ≥ |A|²/pⁿ − 1 ≥ |A|²/(2 · pⁿ)`, the second step by the hypothesis. Write
`S_A = ∑_j k_j ω^j` with `k_j` the number of points of `A` on `{φ = j}`, and
`α_j = p k_j / pⁿ`, so that `α = (∑_j α_j)/p` and
`|S_A|/pⁿ = |∑_j (α_j − α) ω^j| / p ≥ α²/2`. Since `∑_j (α_j − α) = 0`, the triangle inequality
gives `∑_j (|α_j − α| + (α_j − α)) ≥ p α²/2`, a sum of `p` terms, so some `j` has
`α_j − α ≥ α²/4`.

**Checks.**
- In `𝔽₃³` the hypothesis asks for `|A| ≥ 8`. All sets of `8` or `9` points of `𝔽₃³` free of
  nontrivial progressions satisfy the conclusion (checked by enumeration). For `|A| = 9` it is
  not a pigeonhole fact: it asks for a coset with `4` points, since
  `9/27 + (9/27)²/4 = 1/3 + 1/36` exceeds `3 · 3/27`.
- For `n = 0` there is no nonzero functional, and the hypothesis fails, since `|A| ≤ 1`: some
  hypothesis excluding `n = 0` is needed.
- In `𝔽₅²` the hypothesis asks for `|A| ≥ 8`, and the largest sets free of nontrivial
  progressions have `6` points (enumeration): the statement says nothing there.

*Needs:* 1.4; Mathlib `Module.Dual`, `AddChar.zmodAddEquiv`. (Proved here, following the cited
proof.)

### 2.2 Meshulam's theorem

Prove `card_mul_le_six_mul`: for a prime `p`, every `A ⊆ 𝔽_pⁿ` free of nontrivial three-term
progressions has `|A| · n ≤ 6 · pⁿ`. Meshulam proved `|A| = O(3ⁿ/n)` in `𝔽₃ⁿ` (Zhao,
Theorem 6.2.1, p. 208, with its proof on pp. 211–212) and the argument gives `O(pⁿ/n)` for every
odd prime (Zhao, Remark 6.2.2, p. 208); the constant `6` is derived here from the iteration
of 2.1.

Route: for `p = 2`, `|A| ≤ 1` and `n ≤ 6 · 2ⁿ`. Let `p` be odd. Restricted to a coset
`x + ker φ`, translated to `ker φ` and identified linearly with
`𝔽_pⁿ⁻¹` (`LinearMap.finrank_range_add_finrank_ker`), the set stays free of nontrivial
progressions (`ThreeAPFree.mono`, `ThreeAPFree.vadd_set`, `ThreeAPFree.image'`). Iterate 2.1
from `α₀ = α > 0` while `|A_i|² ≥ 2 · pⁿ⁻ⁱ`; then `α_(i+1) ≥ α_i + α_i²/4`, so
`1/α_i − 1/α_(i+1) ≥ 1/(4 + α_i) ≥ 1/5`. Densities are at most `1`, so the iteration stops after
`m ≤ 5/α − 5` steps (at the latest at dimension `0`, where `|A_m|² ≤ 1`), and then
`pⁿ⁻ᵐ < 2/α_m² ≤ 2/α²`. Hence `n < 5/α − 5 + log_p 2 + 2 log_p(1/α)`, which is at most
`5/α − 5 + log₃ 2 + 2 log₃(1/α)` because `log_p u ≤ log₃ u` for `u ≥ 1` and `p ≥ 3`. With
`ln u ≤ u/e` for
`u > 0` (`Real.log_le_sub_one_of_pos` at `u/e`), `2 log₃(1/α) ≤ 2/(e ln 3 · α) < 0.67/α`, so
`n < 5.67/α − 4.36 < 6/α`.

**Checks.**
- The bound is below the trivial `pⁿ` exactly when `n > 6`: for `p = 3` and `n = 6` it is
  `6 · 729 / 6 = 729`, and for `p = 3` and `n = 10` it is `35429.4 < 59049`.
- For `p = 3` and `α ≥ 6/n` (so `n ≥ 6`) the quantity `n − (5/α − 5 + log₃(2/α²))` is decreasing in
  `1/α`, so it is at least its value `n/6 + 5 − log₃ 2 − 2 log₃(n/6)` at `α = 6/n`; over the
  integers `n ≥ 6` that value is least at `n = 11`, where it is `5.099`. The last step has room.
- `A = ∅` and `n = 0` satisfy the bound trivially.

*Needs:* 2.1; Mathlib `ThreeAPFree.mono`, `ThreeAPFree.vadd_set`, `ThreeAPFree.image'`,
`LinearMap.finrank_range_add_finrank_ker`, `Real.log_le_sub_one_of_pos`. (Proved here.)

### Examples

The sets of eight and nine points free of progressions in `𝔽₃³`; the arithmetic of the iteration
for the constant `6`.

### Dependencies

Layer 1 (1.4). Mathlib `Module.Dual`, `AddChar.zmodAddEquiv`, `ThreeAPFree.mono`,
`ThreeAPFree.vadd_set`, `ThreeAPFree.image'`, `LinearMap.finrank_range_add_finrank_ker`,
`Real.log_le_sub_one_of_pos`.

## Layer 3: the polynomial method

### 3.1 Monomial counts

Define `monomialCount`, with `monomialCount q n d = m(q, n, d)`. Its properties used below, for
`q ≥ 1` (for `q = 0` and `n ≥ 1` there are no exponent vectors):

- it is monotone in `d`, it is `1` for `0 ≤ d < 1`, and it is `qⁿ` for `d ≥ (q − 1)n`;
- for every real `d`, `qⁿ − m(q, n, d) ≤ m(q, n, (q − 1)n − d)`: the map `e ↦ (q − 1) − e`
  sends the exponent vectors of degree more than `d` to those of degree less than
  `(q − 1)n − d`;
- for `q = 3`, `m(3, n, 2n/3)` is the sum of the trinomial coefficients `n!/(a! b! c!)` with
  `a + b + c = n` and `b + 2c ≤ 2n/3` (Zhao, Lemma 6.5.7, p. 225).

**Checks.**
- `m(3, n, 2n/3)` for `n = 0, …, 6` is `1, 1, 3, 10, 15, 51, 168`.
- The degree bound in each variable matters: `m(2, 1, 2) = 2` (the monomials `1` and `x`), while
  all monomials of total degree at most `2` in one variable are three.
- `m(3, 2, 4) = 9 = 3²` and `m(5, 1, 4/3) = 2`.

*Needs:* Mathlib `Finset.filter`, `Fintype.card_pi`. (Proved here.)

### 3.2 The Croot–Lev–Pach lemma

Prove `card_filter_eval_ne_zero_le`: let `F` be a finite field with `q` elements,
`α + β + γ = 0` in `F`, `A ⊆ Fⁿ`, and `P` a polynomial of total degree at most `d`. If
`P(α a + β b) = 0` for all distinct `a, b ∈ A`, then `P(−γ a) ≠ 0` for at most `2 m(q, n, d/2)`
elements `a ∈ A` (Ellenberg–Gijswijt, Proposition 2, p. 2, for `P` of degree at most `q − 1` in
each variable; Croot–Lev–Pach, Lemma 1, p. 2, for multilinear `P` and
`(α, β, γ) = (1, −1, 0)`).

Route: expand `P(α x + β y) = ∑ c_(m, m') m(x) m'(y)` over pairs of monomials with
`deg m + deg m' ≤ d`; in each pair one factor has degree at most `d/2`. As a function on `Fⁿ`,
a monomial equals a monomial of degree at most `q − 1` in each variable and of no larger total
degree, since `t^q = t` on `F` (`FiniteField.pow_card`). Grouping by that factor writes the
matrix `B(a, b) = P(α a + β b)` on `A × A` as a sum of at most `2 m(q, n, d/2)` matrices of rank
at most one (`Matrix.rank_vecMulVec_le`, `LinearMap.rank_add_le`). By hypothesis `B` is
diagonal with diagonal entries `P((α + β) a) = P(−γ a)`, and the rank of a diagonal matrix is
its number of nonzero entries (`Matrix.rank_diagonal`). The degree bound per variable in the
source is not needed, by the reduction just described.

**Checks.**
- `F = 𝔽₃`, `n = 1`, `A = 𝔽₃`, `(α, β, γ) = (1, −1, 0)`, `P = 1 − x²` of degree `2`: `P`
  vanishes at the differences `±1`, and `P(0) = 1`, so all three points count; the bound is
  `2 m(3, 1, 1) = 4 ≥ 3`. A bound `m(q, n, d/2) = 2` without the factor `2` would fail.
- Over `𝔽₂` (`n ≤ 2`), `𝔽₃` and `𝔽₅` (`n = 1`), for every nonempty `A`, every `(α, β)` and every
  `d ≤ 2(q − 1)n + 2`, the largest number of `a ∈ A` with `P(−γ a) ≠ 0` over the polynomials
  `P` allowed is at most `2 m(q, n, d/2)` (checked by enumeration; it is attained in some
  cases).

*Needs:* 3.1; Mathlib `MvPolynomial.eval`, `MvPolynomial.totalDegree`, `FiniteField.pow_card`,
`Matrix.rank_vecMulVec_le`, `Matrix.rank_diagonal`, `LinearMap.rank_add_le`. (Proved here,
following the cited proof.)

### 3.3 The Ellenberg–Gijswijt theorem

Prove `card_le_three_mul_monomialCount`: let `F` be a finite field with `q` elements,
`α + β + γ = 0`, and `A ⊆ Fⁿ` such that `α a₁ + β a₂ + γ a₃ = 0` with `a₁, a₂, a₃ ∈ A` forces
`a₁ = a₂ = a₃`. Then `|A| ≤ 3 m(q, n, (q − 1)n/3)` (Ellenberg–Gijswijt, Theorem 4, pp. 2–3,
stated there with `γ ≠ 0`).

Route: if `γ = 0`, then `β = −α` and every triple `(a, a, b)` solves the equation, so the
hypothesis forces `|A| ≤ 1`, while `m ≥ 1`. Let `γ ≠ 0` and `d = ⌊2(q − 1)n/3⌋`. The polynomials
of degree at most `q − 1` in each variable form a space on which evaluation is a linear
isomorphism onto the functions `Fⁿ → F` (`MvPolynomial.evalᵢ`, `MvPolynomial.ker_evalₗ`,
`MvPolynomial.range_evalᵢ`); those of total degree at most `d` vanishing outside `−γ A` form a
subspace `V` of dimension at least `m_d − qⁿ + |A|`. An element of `V` of largest support has
support of size at least `dim V`. It vanishes on every `α a + β b` with `a ≠ b` in `A`, which
lies outside `−γ A` by the hypothesis, so by 3.2 its support has at most `2 m_(d/2)` points.
Since degrees are integers, `m_d = m_D` for `D = 2(q − 1)n/3`, and
`|A| ≤ 2 m_(d/2) + (qⁿ − m_D) ≤ 2 m_((q−1)n/3) + m_((q−1)n − D) = 3 m_((q−1)n/3)` by 3.1, using
`d/2 ≤ D/2 = (q − 1)n/3`.

**Checks.**
- The largest sets satisfying the hypothesis, found by exhaustive search, against the bound:
  over `𝔽₃` with `(α, β, γ) = (1, 1, 1)` (the cap sets) the sizes `2, 4, 9` for `n = 1, 2, 3`
  against `3, 9, 30`; over `𝔽₅` with `n = 2` and over `𝔽₄` with `n = 1, 2` for several
  triples, within the bound.
- For `n = 4` the largest cap set has `20` points (Zhao, p. 209, after Pellegrino), and the bound
  is `3 · 15 = 45`; for `n = 6` the bound is `504`.
- `n = 0`: `Fⁿ` is a point and the bound is `3`.

*Needs:* 3.1, 3.2; Mathlib `MvPolynomial.evalᵢ`, `MvPolynomial.ker_evalₗ`,
`MvPolynomial.range_evalᵢ`, `MvPolynomial.restrictDegree`. (Proved here, following the cited
proof.)

### 3.4 Sets without three-term progressions in `𝔽_qⁿ`

Prove `card_le_of_threeAPFree`: over every finite field with `q` elements, a set `A ⊆ 𝔽_qⁿ`
free of nontrivial three-term progressions has `|A| ≤ 3 m(q, n, (q − 1)n/3)`. This is 3.3 with
`(α, β, γ) = (1, 1, −2)`: `a₁ + a₂ − 2a₃ = 0` forces `a₁ = a₂ = a₃` exactly when `A` is
`ThreeAPFree`. In characteristic `2` the hypothesis allows at most one point (Ellenberg–Gijswijt
treat odd characteristic, p. 1).

**Checks.**
- In `𝔽₄` no set of two points is free of nontrivial progressions: `a + a = b + b = 0`.
- Over `𝔽₅` with `n = 1` the bound is `3 m(5, 1, 4/3) = 6`, above the trivial `5`.

*Needs:* 3.3; Mathlib `ThreeAPFree`. (Proved here.)

### 3.5 The exponential bound in `𝔽₃ⁿ`

Prove `card_le_of_threeAPFree_zmod_three`: for every `A ⊆ 𝔽₃ⁿ` free of nontrivial three-term
progressions and every real `x > 0`, `|A| ≤ 3 (1 + x + x²)ⁿ / x^(2n/3)` (Zhao, Lemma 6.5.7 and
Remark 6.5.8, p. 225, for `0 < x ≤ 1` and the trinomial sum; Ellenberg–Gijswijt, Corollary 5,
p. 3).

Route: by 3.4 it suffices to bound `m(3, n, 2n/3)`. For `0 < x ≤ 1`, each exponent vector of
degree `k ≤ 2n/3` has `1 ≤ x^(k − 2n/3)`, and summing `x^k` over all vectors gives
`(1 + x + x²)ⁿ`. For `x ≥ 1`, the arithmetic–geometric mean inequality
(`Real.geom_mean_le_arith_mean3_weighted`) gives `1 + x + x² ≥ 3x ≥ 3x^(2/3)`, so the right side
is at least `3 · 3ⁿ ≥ |A|`.

**Checks.**
- At `x = (√33 − 1)/8 ≈ 0.59307` the base `(1 + x + x²)/x^(2/3)` is `2.75510…`, so
  `|A| ≤ 3 · 2.756ⁿ`; at `x = 0.6` it is `2.7552…`, below Zhao's `2.76`.
- `x > 0` is needed: at `x = 0` and `n ≥ 1`, `0^(2n/3) = 0` and the right side is `0` in the
  convention that division by zero gives zero, while `A = {0}` is free of progressions.

*Needs:* 3.4; Mathlib `Real.rpow`, `Real.geom_mean_le_arith_mean3_weighted`. (Proved here.)

### Examples

Cap sets in `𝔽₃ⁿ` for `n ≤ 4` against `3 m(3, n, 2n/3)`; sets avoiding `α a₁ + β a₂ + γ a₃ = 0`
over `𝔽₄` and `𝔽₅`; the exponential base `2.7551`.

### Dependencies

Mathlib `MvPolynomial`, `MvPolynomial.eval`, `MvPolynomial.totalDegree`,
`MvPolynomial.restrictDegree`, `MvPolynomial.evalᵢ`, `MvPolynomial.ker_evalₗ`,
`MvPolynomial.range_evalᵢ`, `FiniteField.pow_card`, `Matrix.rank_vecMulVec_le`,
`Matrix.rank_diagonal`, `LinearMap.rank_add_le`, `ThreeAPFree`,
`Real.geom_mean_le_arith_mean3_weighted`. No other layer.

## Layer 4: Bogolyubov's lemma

### 4.1 Bogolyubov's lemma in a finite abelian group

Prove `exists_bohr_subset_add_sub`: for every nonempty `A ⊆ G` there is a set `R` of characters
with `|R| · |A|² < |G|²` such that every `x ∈ G` with `Re ψ(x) ≥ 0` for all `ψ ∈ R` lies in
`A + A − A − A` (Zhao, Theorem 7.8.5, p. 253, for `G = ℤ/N`, where the set of such `x` is the
Bohr set `Bohr(R, 1/4)` of Definition 7.8.4).

Route: the number of ways to write `x = a₁ + a₂ − a₃ − a₄` with `aᵢ ∈ A` is
`|G|⁻¹ ∑_ψ |S_A(ψ)|⁴ ψ(−x)`, by `AddChar.sum_apply_eq_ite`. Take `R` the nontrivial characters
with `|S_A(ψ)|² > |A|³/|G|`. By 1.1, `|R| |A|³/|G| < |G| |A|` when `R` is nonempty. For `x` as
in the statement, the real part of the sum is at least `|A|⁴` (from `ψ = 0`) minus the sum of
`|S_A(ψ)|⁴` over the other characters, which is at most
`(|A|³/|G|)(|G| |A| − |A|²) < |A|⁴` by 1.1. So `x` has a representation.

**Checks.**
- `A = G`: every nontrivial sum vanishes, `R = ∅`, and the conclusion is `G ⊆ G`.
- `A = {0} ⊆ ℤ/7`: every nontrivial `|S_A(ψ)|² = 1 > 1/7`, so `R` has six characters and
  `6 < 49`; the only `x` with `cos(2πkx/7) ≥ 0` for all `k` is `0`, and `A + A − A − A = {0}`.
- In `ℤ/N`, `Re e^(2πirx/N) ≥ 0` exactly when the distance from `rx/N` to the nearest integer is
  at most `1/4`, which is the width of the Bohr sets of the source.
- Nonemptiness is needed: for `A = ∅` the point `0` satisfies every condition, but
  `A + A − A − A` is empty.
- For every nonempty subset of `ℤ/7`, `(ℤ/2)²`, `ℤ/2 × ℤ/4` and `(ℤ/3)²`, the set `R` of the
  route satisfies both conclusions (checked by enumeration).

*Needs:* 1.1; Mathlib `AddChar.sum_apply_eq_ite`, `AddChar.map_neg_eq_conj`. (Proved here,
following the cited proof.)

### 4.2 Bogolyubov's lemma in a vector space over `𝔽_p`

Prove `exists_submodule_subset_add_sub`: let `p` be prime and `V` a finite vector space over
`𝔽_p`. For every nonempty `A ⊆ V`, `A + A − A − A` contains a subspace `W` with
`(dim V − dim W) · |A|² < |V|²`, that is, of codimension less than `1/α²` with `α = |A|/|V|`
(Zhao, Theorem 7.8.3, p. 252, for `V = 𝔽_pⁿ`).

Route: take `R` from 4.1 and `W` the intersection of the kernels of the characters in `R`.
Each kernel is an additive subgroup, hence a subspace (`AddSubgroup.toZModSubmodule`), and has
codimension at most `1`, since `ψ(x)^p = ψ(px) = 1` puts the image of `ψ` among the `p`-th roots
of unity. So `W` has codimension at most `|R|`, and on `W` every `ψ ∈ R` is `1`.

**Checks.**
- `V = (ℤ/2)ⁿ` and `A` a subspace of codimension `k`: `A + A − A − A = A`, and `R` consists of
  the `2ᵏ − 1` nontrivial characters trivial on `A`; the subspace `A` itself has
  `k · 4^(n−k) < 4ⁿ`.
- For every nonempty subset of `ℤ/7`, `(ℤ/2)²` and `(ℤ/3)²`, the common kernel of `R` lies in
  `A + A − A − A` and its codimension satisfies the bound (checked by enumeration).
- `A + A` alone does not suffice: Zhao, Example 7.8.2, p. 252, gives sets of positive density
  in `(ℤ/2)ⁿ` whose sumset contains no subspace of codimension below `c √n`.

*Needs:* 4.1; Mathlib `AddSubgroup.toZModSubmodule`, `Module.finrank`. (Proved here, following
the cited proof.)

### Examples

The point `{0}` in `ℤ/7` with its six characters; subspaces of `(ℤ/2)ⁿ`.

### Dependencies

Layer 1 (1.1). Mathlib `AddChar.sum_apply_eq_ite`, `AddChar.map_neg_eq_conj`,
`AddSubgroup.toZModSubmodule`, `Module.finrank`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: character sums of sets with
Parseval's identity for them, the count of three-term progressions with its character identity,
the counting lemma and the large character sum; the density increment and Meshulam's theorem with
the constant `6` in `𝔽_pⁿ` for every prime `p`; the monomial counts, the Croot–Lev–Pach lemma,
the Ellenberg–Gijswijt
theorem, its form for sets without progressions over every finite field and the exponential
bound in `𝔽₃ⁿ`; Bogolyubov's lemma in finite abelian groups and in vector spaces over `𝔽_p`.

Already in the libraries and therefore not targets:

- Mathlib's sets free of three-term progressions and Roth numbers
  (`Mathlib/Combinatorics/Additive/AP/Three/Defs.lean`: `ThreeAPFree`, `addRothNumber`,
  `rothNumberNat`), Behrend's lower bound (`Behrend.roth_lower_bound` in `.../Behrend.lean`), and
  the corners theorem with the qualitative theorem of Roth in finite abelian groups and in the
  integers (`corners_theorem`, `roth_3ap_theorem`, `rothNumberNat_isLittleO_id` in
  `Mathlib/Combinatorics/Additive/Corner/Roth.lean`). The bounds here are quantitative and
  specific to the groups named; none restates those theorems.
- Mathlib's other additive combinatorics in `Mathlib/Combinatorics/Additive/`: the
  Plünnecke–Ruzsa inequality, Ruzsa covering, Freiman homomorphisms, additive energy, dissociated
  sets and their randomisation, the Cauchy–Davenport and Erdős–Ginzburg–Ziv theorems, small
  doubling and tripling, and the convolution count `Finset.addConvolution`. None is used or
  restated.
- Mathlib's characters of finite abelian groups (`Mathlib/Algebra/Group/AddChar.lean`,
  `Mathlib/Analysis/Fourier/FiniteAbelian/`): their number, their orthogonality and the basis of
  complex characters; and the discrete Fourier transform `ZMod.dft` on `ℤ/N`
  (`Mathlib/Analysis/Fourier/ZMod.lean`), which is not used.
- Mathlib's polynomials of degree less than `q` in each variable over a finite field with the
  evaluation isomorphism (`Mathlib/FieldTheory/Finite/Polynomial.lean`), used in 3.3.

Left to other roadmaps:

- FourierDeligneTransform, Layer 0, the finite Fourier transform (§0.2), owns the Fourier
  transform of functions on a finite vector space over a finite field, with values in a
  commutative ring, and its inversion, Plancherel and convolution identities. When `G` is such a
  vector space, 1.1 above is the case `Λ = ℂ` of that Plancherel identity applied to the
  indicators of `A` and `−A`, once the characters of `G` are matched with the dual space. 1.1 is
  kept because it is stated for every finite abelian group,
  which §0.2 does not cover, and is proved from Mathlib's orthogonality alone; nothing else of
  that roadmap is restated, and none of it is used.
- SamplingAndDiscreteFourierAnalysis, Layer 1, the discrete Fourier transform (1.1, Parseval's
  identity), states Parseval's identity for `ZMod.dft` on `ℤ/N`. For
  `G = ℤ/N` and the indicator of a set it gives 1.1 above; 1.1 is stated for every finite abelian
  group and only for sets. This roadmap does not depend on that one.
- BooleanFunctionAnalysis, Layer 1, states the Walsh expansion and Plancherel's identity (1.3)
  for real functions on `(ℤ/2)ⁿ`. For `G = (ℤ/2)ⁿ`, whose characters are the Walsh characters,
  1.1 above is that identity for the indicator of a set; 1.1 is stated for every finite abelian
  group. This roadmap does not depend on that one.
- LinearAlgebraMethodInCombinatorics owns rank bounds for set systems (oddtown, Fisher,
  Frankl–Wilson); the rank argument of 3.2 is about polynomials on `𝔽_qⁿ` and is not one of them.

Not treated here: Meshulam's bound `2|G|/rk(G)` for a general abelian group of odd order,
quantitative forms of Roth's theorem in `ℤ/N` or in `{1, …, N}`, Bohr sets as
objects with their size and the progressions they contain, Chang's lemma, the bounds of Bateman
and Katz and of Kelley and Meka, the slice rank of tensors as a notion, the theorem of Croot, Lev
and Pach in `(ℤ/4)ⁿ`, tricoloured sum-free sets, arithmetic regularity, Szemerédi's theorem for
longer progressions, and positive-definite functions on finite abelian groups.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Algebra/Group/AddChar.lean`: `AddChar` (homomorphisms from an additive monoid to a
  multiplicative one; the trivial character is `0`), `AddChar.sum_eq_ite` (the sum of a character
  over a finite group is `|G|` for the trivial character and `0` otherwise).
- `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`: `AddChar.card_eq` (a finite
  abelian group has `|G|` complex characters), `AddChar.sum_apply_eq_ite` (the sum over all
  characters of `ψ(x)` is `|G|` for `x = 0` and `0` otherwise), `AddChar.exists_apply_ne_zero`
  (a nonzero element is moved by some character), `AddChar.zmodAddEquiv` (the characters of
  `ℤ/n` correspond to `ℤ/n`).
- `Mathlib/Analysis/RCLike/Basic.lean`: `AddChar.map_neg_eq_conj` (on a finite group, `ψ(−x)`
  is the conjugate of `ψ(x)`).
- `Mathlib/Combinatorics/Additive/AP/Three/Defs.lean`: `ThreeAPFree` (`a + c = b + b` forces
  `a = b`), `ThreeAPFree.mono` (subsets), `ThreeAPFree.vadd_set` (translates),
  `ThreeAPFree.image'` (images under additive maps injective on `A + A`).
- `Mathlib/LinearAlgebra/Dual/Defs.lean`: `Module.Dual`.
  `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`:
  `LinearMap.finrank_range_add_finrank_ker` (rank–nullity).
- `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_sub_one_of_pos`
  (`log x ≤ x − 1` for `x > 0`). `Mathlib/Analysis/MeanInequalities.lean`:
  `Real.geom_mean_le_arith_mean3_weighted`. `Real.rpow` for the real power `x^(2n/3)`.
- `Mathlib/Algebra/MvPolynomial/Eval.lean`: `MvPolynomial.eval`.
  `Mathlib/Algebra/MvPolynomial/Degrees.lean`: `MvPolynomial.totalDegree`.
  `Mathlib/RingTheory/MvPolynomial/Basic.lean`: `MvPolynomial.restrictDegree` (polynomials of
  degree at most `k` in each variable). `Mathlib/FieldTheory/Finite/Polynomial.lean`:
  `MvPolynomial.evalᵢ` (the evaluation map on polynomials of degree less than `q` in each
  variable, onto the functions `Fⁿ → F`), `MvPolynomial.ker_evalₗ` (its kernel is zero),
  `MvPolynomial.range_evalᵢ` (it is onto). `Mathlib/FieldTheory/Finite/Basic.lean`:
  `FiniteField.pow_card` (`t^q = t`).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_vecMulVec_le` (an outer product has rank
  at most one), `Matrix.rank_diagonal` (the rank of a diagonal matrix over a field is its number
  of nonzero diagonal entries). `Mathlib/LinearAlgebra/Dimension/LinearMap.lean`:
  `LinearMap.rank_add_le` (rank is subadditive).
- `Mathlib/Data/Finset/Filter.lean`: `Finset.filter` (the subset cut out by a decidable
  predicate). `Mathlib/Data/Fintype/BigOperators.lean`: `Fintype.card_pi` (the cardinality of a
  finite product of finite types is the product of the cardinalities).
- `Mathlib/Algebra/Module/ZMod.lean`: `AddSubgroup.toZModSubmodule` (an additive subgroup of a
  `ℤ/n`-module is a submodule). `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:
  `Module.finrank`.

### From Tau Ceti

Nothing is consumed from Tau Ceti.

## References

- Yufei Zhao, *Graph Theory and Additive Combinatorics: Exploring Structure and Randomness*,
  Cambridge University Press, 2023; the author's version on the author's page (last updated
  June 18, 2024),
  whose page numbers are used above (they differ slightly from the printed book).
- Jordan S. Ellenberg and Dion Gijswijt, *On large subsets of `𝔽_qⁿ` with no three-term
  arithmetic progression*, arXiv:1605.09223v1 (2016); Annals of Mathematics 185 (2017). The
  numbering is that of the arXiv version.
- Ernie Croot, Vsevolod F. Lev and Péter Pál Pach, *Progression-free sets in `ℤ₄ⁿ` are
  exponentially small*, arXiv:1605.01506v2 (2016); Annals of Mathematics 185 (2017). The
  numbering is that of the arXiv version.
- Attributions made in prose without a locator: Roy Meshulam (the bound `O(3ⁿ/n)`, 1995, and
  its form `2|G|/rk(G)` for abelian groups of odd order);
  N. N. Bogolyubov (1939, as Zhao reports).
