# Roadmap: toric ideals and Markov bases

**Summary.** Fix an integer matrix `A` with `r` rows and finitely many columns. Its fibres are the
sets `F(b) = {u ∈ ℕⁿ : A u = b}` of nonnegative integer solutions, its moves are the integer
vectors `m` with `A m = 0`, and its toric ideal `I_A` is the kernel of the ring map sending the
variable `x_j` to the monomial `t^(a_j)` of the `j`-th column. A move `m` is recorded by the
binomial `x^(m⁺) − x^(m⁻)` of its positive and negative parts. The roadmap relates four questions
about these objects: which sets of moves connect every fibre, which binomials generate `I_A`, which
binomials form Gröbner bases, and which moves solve the integer programs over the fibres.

The main results are these.

- *The fundamental theorem of Markov bases* (Diaconis and Sturmfels). Over any nontrivial
  commutative ring, a set `M` of moves connects every fibre (each two points of `F(b)` are joined by
  steps `± m`, `m ∈ M`, inside `F(b)`) if and only if the binomials of `M` generate `I_A`.
- *The fibre chain.* If a finite set of moves connects a finite nonempty fibre and `p` is a
  positive finite weight on it, the Metropolis–Hastings chain that proposes `x ± m` for a random
  move and sign is irreducible, reversible for `p`, and has exactly one invariant probability, the
  normalisation of `p`.
- *Integer programming* (Conti and Traverso). Over a nontrivial coefficient ring and for any
  monomial order, the standard monomials of `I_A` are exactly the least points of their fibres; if
  the order refines a cost vector `c`, the normal form of `x^u` modulo `I_A` is `x^(u*)` with `u*`
  a point of least cost in the fibre of `u`.
- *Graver bases.* The conformally minimal moves form a finite set, the Graver basis. Over a field,
  every element of every reduced Gröbner basis of `I_A` is the binomial of a Graver element, and
  every circuit (primitive move of minimal support) occurs, up to sign, in the reduced Gröbner
  basis for some monomial order. If, for `d` the rank of `A`, some `d` rows of `A` have a nonzero
  `d × d` minor and all their nonzero `d × d` minors share one absolute value (as when `A` is
  totally unimodular), the Graver basis is the set of circuits. The Graver basis is the least set
  of moves that improves every non-optimal point of every bounded integer program `min c·v`,
  `A v = A u`, `0 ≤ v ≤ a`.

The roadmap rests on the Tau Ceti library's toric ideals, Gröbner bases, standard monomials and
normal forms (realising GroebnerGeometry's first two layers); on TensorProductCombinatorics for
the fibre; on MarkovChainsAndRenewal for the invariant probability of a finite irreducible chain;
on LangevinAndHamiltonianMonteCarlo for the Metropolis–Hastings kernel; and on
IntegerPolyhedraAndTotalUnimodularity for integral vertices of unimodular polytopes.

Layer 1 states the fundamental theorem and the fibre chain, Layer 2 the fibre minima and the
Conti–Traverso theorem, and Layer 3 the Graver basis, circuits, the unimodular case and test sets.

## Conventions

- **Matrices and fibres.** `A : Matrix (Fin r) ι ℤ` with `ι` a finite type (`[Fintype ι]`).
  The fibre `Fibre A b` is the subtype of `c : ι → ℕ` with `∑ j, A i j * c j = b i` for every
  row `i`, copied verbatim from TensorProductCombinatorics §1.5. A move is a vector `m : ι → ℤ`
  with `A *ᵥ m = 0`; moves are not assumed nonzero, and a fibre may be empty or infinite.
- **Toric ideals.** For a commutative ring `R`, the toric ideal of `A` is Tau Ceti's
  `TauCeti.toricIdeal R (fun j i => A i j)`, the kernel of the `R`-algebra map from
  `MvPolynomial ι R` to the monoid algebra of `Fin r → ℤ` sending `X j` to the basis element of the
  column `fun i => A i j`. Exponents are `u : ι →₀ ℕ`, and the fibre of an exponent is the value
  `Finsupp.linearCombination ℕ (fun j i => A i j) u = ∑ j, u j • (fun i => A i j)`, which is the
  vector `A u`. A point `x` of `Fibre A b` corresponds to the exponent
  `Finsupp.equivFunOnFinite.symm x.1`, whose value is `b`.
- **Binomials of moves.** For `m : ι → ℤ` put `m⁺ j = (m j).toNat` and `m⁻ j = (-m j).toNat`, as
  exponents through `Finsupp.equivFunOnFinite.symm`; `moveBinomial R m = X^(m⁺) − X^(m⁻)`. The
  exponents `m⁺` and `m⁻` have disjoint supports, `m = m⁺ − m⁻`, and
  `moveBinomial R (-m) = -moveBinomial R m`.
- **Monomial orders.** Mathlib's `MonomialOrder ι`, with `m.toSyn` the order isomorphism onto
  the ordered synonym and `m.degree` the leading exponent. Divisibility of monomials is the
  pointwise order `≤` on `ι →₀ ℕ`. Standard monomials are Tau Ceti's `m.standardMonomials I`:
  the exponents `c` such that no nonzero `p ∈ I` has `m.degree p ≤ c`.
- **Costs** are real vectors `c : ι → ℝ`, with `c·u = ∑ j, c j * u j`.
- **Measures on a fibre.** `Fibre A b` carries the subspace σ-algebra of the product σ-algebra
  on `ι → ℕ`; it is countable and has measurable singletons, so every set is measurable.
  Irreducibility is Mathlib's `Kernel.IsIrreducible Measure.count κ`: every nonempty set is
  reached with positive probability from every point in some number of steps.

## Layer 1: Markov bases and the fibre chain

### 1.1 The fundamental theorem of Markov bases

Define `IsMoveStep M x y` for `M : Set (ι → ℤ)` and `x y : ι → ℕ`: some `m ∈ M` has `y = x + m`
or `x = y + m` coordinatewise. Define `IsMarkovBasis A M`: for every `b`, any two points of
`Fibre A b` are joined by a finite sequence of points of `Fibre A b`, each related to the next by
`IsMoveStep M` (`Relation.ReflTransGen`). Define `moveBinomial R m` as in the conventions.

Prove `isMarkovBasis_iff_span_eq_toricIdeal`: for a nontrivial commutative ring `R` and a set `M`
of moves of `A`, `M` is a Markov basis of `A` if and only if
`Ideal.span (moveBinomial R '' M) = TauCeti.toricIdeal R (fun j i => A i j)`. The theorem is due
to Diaconis and Sturmfels (1998, not consulted); Drton, Sturmfels and Sullivant state it as
Theorem 1.3.6 (p. 31) for a lattice in `ℤᵏ` meeting `ℕᵏ` only in `0` and polynomials over `ℝ`,
Almendra-Hernández, De Loera and Petrović as Theorem 2.6 (p. 5), and Aoki as Theorem 2.3
(PDF p. 18), all without proof. Here `M` is any set of moves, not necessarily finite, and the
coefficient ring is any nontrivial commutative ring. (Proved here.)

Route. Write `J` for the span. Each binomial of a move lies in the toric ideal, since `A m = 0`
gives `A m⁺ = A m⁻` (Tau Ceti `TauCeti.monomial_sub_monomial_mem_toricIdeal`), so `J` is
contained in it. *If `M` is a Markov basis:* by `TauCeti.toricIdeal_eq_span` the toric ideal is
generated by the `X^u − X^v` with `A u = A v`. Join `u` and `v` by a path `u = x₀, …, x_k = v` in
their fibre. If `x_(i+1) = x_i + m`, then `x_i ≥ m⁻` coordinatewise, and with `w = x_i − m⁻` one
has `x_i = w + m⁻`, `x_(i+1) = w + m⁺`, so `X^(x_(i+1)) − X^(x_i) = X^w · moveBinomial R m ∈ J`;
the other direction of a step is the same with the roles exchanged. The telescoping sum gives
`X^u − X^v ∈ J`. *If the span is the toric ideal:* let `u`, `v` be points of one fibre and `C`
the set of points of `ℕ^ι` joined to `u` by steps of `IsMoveStep M`. Let `λ` be the `R`-linear
form on `MvPolynomial ι R` sending `X^w` to `1` if `w ∈ C` and to `0` otherwise. For every `m ∈ M`
and exponent `w`, the points `w + m⁺` and `w + m⁻` differ by `m`, so both or neither lie in `C`, and
`λ` vanishes on `X^w · moveBinomial R m`; as these products span `J` over `R`, `λ` vanishes on `J`.
Since `X^u − X^v ∈ J`, `1 − λ(X^v) = 0`, and as `1 ≠ 0` in `R`, `v ∈ C`. Every step of
`IsMoveStep M` from a point of `Fibre A b` stays in `Fibre A b`, because `A m = 0`; so the path lies
in the fibre.

**Checks.**
- *A lattice basis need not be a Markov basis.* For the twisted cubic `A = (1 1 1 1; 0 1 2 3)`, the
  moves `(1, −2, 1, 0)` and `(0, 1, −2, 1)` span the kernel lattice over `ℤ`, but the fibre over
  `(2, 3)` is `{(0, 1, 1, 0), (1, 0, 0, 1)}`, and neither move applies to either point inside the
  fibre; correspondingly `x₁x₄ − x₂x₃` is its own remainder modulo the Gröbner basis of the two
  binomials `x₁x₃ − x₂²` and `x₂x₄ − x₃²`, so it is not in their ideal. Adding `(1, −1, −1, 1)`
  gives the three `2 × 2` minors `x₁x₃ − x₂²`, `x₁x₄ − x₂x₃`, `x₂x₄ − x₃²`, which generate the toric
  ideal (their reduced Gröbner basis coincides with that of the toric ideal), and these three moves
  connect every fibre with `b₀ ≤ 5`.
- *Moves must lie in the kernel.* For `A = (1)` every fibre has one point, so `M = {(1)}` is a
  Markov basis, but `x₁ − 1` is not in the toric ideal, which is `0`.
- *`R` must be nontrivial.* Over the zero ring both ideals are the zero ideal of the zero ring, so
  the right side holds for every `M`; for `A = (1 1)` and `M = ∅` the fibre over `1` has the two
  points `(1, 0)`, `(0, 1)` and is not connected.
- `A` the `2 × 2` identity: the kernel is `0`, every fibre has at most one point, the empty set is
  a Markov basis, and the toric ideal is `0`.

*Needs:* Tau Ceti `TauCeti.toricIdeal`, `TauCeti.toricIdeal_eq_span`,
`TauCeti.monomial_sub_monomial_mem_toricIdeal`; the copy of TensorProductCombinatorics §1.5
`Fibre`; Mathlib `Relation.ReflTransGen`, `Ideal.span`, `MvPolynomial.monomial`,
`Finsupp.equivFunOnFinite`, `Finsupp.linearCombination`.

### 1.2 The fibre chain

Copy verbatim from LangevinAndHamiltonianMonteCarlo 1.1–1.2 the Metropolis–Hastings kernel
`mhKernel Q a = Q.withDensity a + (Kernel.id).withDensity (fun x _ ↦ 1 − Q.withDensity a x univ)`
(move along `a x y · Q x (dy)`, stay with the remaining mass) and the acceptance probability
`mhAcceptance p q x y = min 1 (p y * q y x / (p x * q x y))`. Define `fibreStep x v`, for a point
`x` of `Fibre A b` and `v : ι → ℤ`: the point `x + v` if it lies in the fibre, and `x` otherwise.
For a finite set `M : Finset (ι → ℤ)` define the proposal `fibreProposal A b M`, the kernel on the
fibre that sends `x` to the average over `s ∈ M × Bool` of the Dirac masses at `fibreStep x (± s)`,
with the sign given by the Boolean; its total mass is `1` for `M` nonempty and `0` for `M` empty,
and the instance `IsFiniteKernel` records the bound `1`. Define `fibreChain A b M p` as
`mhKernel (fibreProposal A b M) (mhAcceptance p q)` with `q x y = fibreProposal A b M x {y}`.

Prove `fibreChain_isIrreducible`: if the fibre `Fibre A b` is finite and nonempty, `M` is a finite
set of vectors such that any two points of the fibre are joined inside it by steps of
`IsMoveStep M`, and `p` is a weight on the fibre with `0 < p x < ∞` for every `x`, then
`fibreChain A b M p` is a Markov kernel, irreducible for the counting measure, reversible for the
measure `Measure.count.withDensity p` of weights `p`, and has exactly one invariant probability.
By reversibility this probability is `(∑ x, p x)⁻¹ • Measure.count.withDensity p`. The chain is
the sampler of Drton, Sturmfels and Sullivant, Algorithm 1.1.13 and Theorem 1.1.14 (pp. 16–17),
stated there for a Markov basis and the conditional distribution of a log-linear model, without
proof; here the weight is any positive weight, the moves need only connect the one fibre, and the
proposal also draws a sign. No aperiodicity statement is made. (Proved here.)

Route. *Markov.* If `M` is empty, the proposal is the zero kernel, the chain is `Kernel.id`, and
the connection hypothesis forces the fibre to be a single point. If `M` is nonempty, the proposal
is a Markov kernel and `mhAcceptance` is at most `1`, so LangevinAndHamiltonianMonteCarlo 1.1
`TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.isMarkovKernel_mhKernel` applies. *Reversible.*
Apply LangevinAndHamiltonianMonteCarlo 1.2
`TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.mhKernel_mhAcceptance_isReversible` with the
reference measure `Measure.count` (s-finite on a countable type) and the densities `p` and `q`: on a
countable type with measurable singletons every function is measurable and
`fibreProposal A b M x = Measure.count.withDensity (q x)`; the weights are finite by hypothesis and
`q x y ≤ 1`. *Irreducible.* If `y ≠ x` and `IsMoveStep M x y`, some `(m, sign)` proposes `y` from
`x` and the opposite sign proposes `x` from `y`, so `q x y ≥ 1 / (2 |M|)` and `q y x > 0`; with
`p x`, `p y` positive and finite the acceptance is positive, and the off-diagonal mass of the chain
at `y` is `mhAcceptance p q x y * q x y > 0`. Along a path `x = x₀, …, x_k = y` the
Chapman–Kolmogorov inequality `(κ ^ (n + 1)) x {z} ≥ (κ ^ n) x {w} * κ w {z}` gives
`(κ ^ k) x {y} > 0`; a nonempty set contains some `y`. *Unique invariant probability.*
MarkovChainsAndRenewal Layer 3, item 2, `existsUnique_invariant_probability`, for a Markov kernel
on a finite, countable, nonempty state space with measurable singletons (the fibre is all of these:
it is a finite subtype of the countable `ι → ℕ` with its product σ-algebra). Its hypothesis is that
roadmap's own `IsIrreducible κ`: for all `x`, `y` some `n` has `(κ ^ n) x {y} > 0`. This follows
from Mathlib's `Kernel.IsIrreducible Measure.count κ` by taking the measurable set `{y}`, of
counting measure `1`; conversely a set of positive counting measure contains some `y`, and
`(κ ^ n) x {y} > 0` bounds `(κ ^ n) x` of that set below. The measure
`Measure.count.withDensity p` is finite and nonzero, and it is invariant by Mathlib
`Kernel.IsReversible.invariant`, which identifies the invariant probability.

**Checks.**
- *2 × 3 tables.* For `2 × 3` tables with row sums `(2, 2)` and column sums `(1, 2, 1)`, written
  row by row, the fibre is `{(0,1,1,1,1,0), (0,2,0,1,0,1), (1,0,1,0,2,0), (1,1,0,0,1,1)}`, the moves
  are the three basic moves `e_(1k) − e_(1l) − e_(2k) + e_(2l)`, and the hypergeometric weights
  `1/∏ u_ij!` are `(1, 1/2, 1/2, 1)`. The chain has rows `(2/3, 1/12, 1/12, 1/6)`,
  `(1/6, 2/3, 0, 1/6)`, `(1/6, 0, 2/3, 1/6)`, `(1/6, 1/12, 1/12, 2/3)`; it is irreducible, satisfies
  detailed balance for the weights, and its invariant probability is `(1/3, 1/6, 1/6, 1/3)`.
- *Connection is needed.* For the twisted cubic, the fibre over `(2, 3)` and the lattice basis of
  1.1, every proposal stays put: the chain is the identity on two points and is not irreducible.
- *Positivity and finiteness of `p` are needed.* For `A = (1 1)`, `b = 1` and `M = {(1, −1)}` the
  fibre is `{(0, 1), (1, 0)}`; with `p = (1, 1)` both rows are `(1/2, 1/2)`. With `p = (1, 0)` the
  second point is never entered, and with `p = (∞, 1)` the first point is never left: in both cases
  the first row is `(1, 0)` and the chain is not irreducible.
- *Finiteness of the fibre is needed.* For `A = (0)`, `b = 0`, `M = {(1)}` and `p = 1` the fibre is
  `ℕ`, the moves connect it, and the chain is the reflected walk with `κ(k, k ± 1) = 1/2` for
  `k ≥ 1` and `κ(0, 0) = κ(0, 1) = 1/2`. An invariant measure `π` has `π(1) = π(0)` from the
  equation at `0` and `π(k + 1) = 2π(k) − π(k − 1)` at `k ≥ 1`, so it is constant, and there is
  no invariant probability.
- *Nonemptiness is needed* for the last clause: on an empty fibre there is no probability measure.

*Needs:* LangevinAndHamiltonianMonteCarlo 1.1 `mhKernel`,
`TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.isMarkovKernel_mhKernel` and 1.2 `mhAcceptance`,
`TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.mhKernel_mhAcceptance_isReversible`;
MarkovChainsAndRenewal Layer 3 `existsUnique_invariant_probability`; the copy of
TensorProductCombinatorics §1.5 `Fibre`; Mathlib `Kernel.IsIrreducible`, `Kernel.IsReversible`,
`Kernel.IsReversible.invariant`, `Kernel.Invariant`, `Kernel.ofFunOfCountable`,
`Kernel.withDensity`, `Measure.count`, `Measure.withDensity`, `Kernel.comp_apply`.

### Examples

- *Finite Markov bases exist.* Tau Ceti `TauCeti.exists_finset_toricIdeal_eq_span` gives finitely
  many pairs `(u, v)` with `A u = A v` whose binomials generate the toric ideal over every
  commutative ring. With `w = u ⊓ v`, `X^u − X^v = X^w · moveBinomial R (u − v)`, so the finitely
  many moves `u − v` have binomials generating the toric ideal, and by 1.1 over `ℚ` they form a
  Markov basis.
- *2 × 2 tables.* For the `2 × 2` tables with fixed margins the single move
  `(1, −1, −1, 1)` is a Markov basis; its binomial `x₁₁x₂₂ − x₁₂x₂₁` generates the toric ideal.

### Dependencies

1.1 uses the Tau Ceti toric-ideal library and the copied fibre. 1.2 uses the copied fibre,
LangevinAndHamiltonianMonteCarlo Layer 1 and MarkovChainsAndRenewal Layer 3; it does not use 1.1.

## Layer 2: standard monomials and integer programming

### 2.1 Standard monomials are fibre minima

Prove `mem_standardMonomials_toricIdeal_iff`: for a nontrivial commutative ring `R`, a monomial
order `m` on `ι` and an exponent `u : ι →₀ ℕ`, `u` is a standard monomial of
`TauCeti.toricIdeal R (fun j i => A i j)` if and only if `m.toSyn u ≤ m.toSyn v` for every `v` in
the fibre of `u`. A fibre may be infinite; it contains at most one standard monomial, since
`m.toSyn` is injective. Over a field the pinned Tau Ceti already counts the standard monomials in
each fibre: `MonomialOrder.card_standardMonomials_toricIdeal`, with the grading
`AddMonoidHom.id (Fin r → ℤ)`, says that the fibre over `b` contains exactly as many standard
monomials as there are elements equal to `b` in the semigroup generated by the columns, so exactly
one in each nonempty fibre. 2.1 identifies that monomial as the `m`-least point of the fibre, and
holds over every nontrivial commutative ring, where no count is available; over a field it also
follows in a few lines from the count and the second half of the route below. The combinatorial
form, that the optimal points of a generic cost form an order ideal whose minimal non-members give a
test set, is Sturmfels' Lemma 2.1 (stated with a one-line justification) and Theorem 2.3 (with
proof) (Algebraic recipes, pp. 3–4); the algebraic statement here is in the work of Conti and
Traverso (1991, not consulted). (Proved here.)

Route. A polynomial `p = ∑ c_w X^w` lies in the toric ideal exactly when, for each value `β`, the
coefficients `c_w` with `A w = β` sum to `0` (the kernel of `X^w ↦ single (A w) 1`,
`TauCeti.mem_toricIdeal_iff`). *If `u` is least in its fibre:* suppose `p` in the ideal is nonzero
with `d = m.degree p ≤ u`. The coefficients of `p` on the fibre of `d` sum to `0` and the one at `d`
is nonzero, so some `w ≠ d` in the support of `p` has `A w = A d`, and `w` is smaller than `d`.
Then `v = u − d + w` lies in the fibre of `u` and `m.toSyn v < m.toSyn u`, since `m.toSyn` is
additive and strictly monotone in each summand; this contradicts minimality. *If `u` is standard:*
for `v` in the fibre of `u` with `m.toSyn v < m.toSyn u`, the polynomial `X^u − X^v` is a nonzero
element of the ideal (Tau Ceti `TauCeti.monomial_sub_monomial_mem_toricIdeal`; nonzero as `R` is
nontrivial) of degree `u ≤ u`.

**Checks.**
- For the twisted cubic, every monomial order lexicographic, graded lexicographic or graded reverse
  lexicographic for one of the `24` orderings of the variables (`72` orders), and every exponent of
  total degree at most `4` (the fibres of these exponents lie in that range, as the first row of `A`
  is `(1, 1, 1, 1)`), `u` is standard for the reduced Gröbner basis exactly when it is least in its
  fibre.
- *`R` must be nontrivial.* Over the zero ring every polynomial is `0`, so every exponent is
  standard, while for `A = (1 1)` only one of `(1, 0)`, `(0, 1)` is least in the fibre over `1`.
- `A` with no rows (`r = 0`): there is one fibre, `ℕ^ι`, the toric ideal is the augmentation ideal
  generated by the `X j − 1`, and the only standard monomial is `0`, the least exponent.

*Needs:* Tau Ceti `MonomialOrder.standardMonomials`, `TauCeti.mem_toricIdeal_iff`,
`TauCeti.monomial_sub_monomial_mem_toricIdeal` (and, for the field case only, the count
`MonomialOrder.card_standardMonomials_toricIdeal`); Mathlib `MonomialOrder.toSyn`,
`MonomialOrder.degree`, `MonomialOrder.degree_mem_support`, `MonomialOrder.le_degree`.

### 2.2 The Conti–Traverso theorem

Prove `normalForm_monomial_eq`: let `R` be a nontrivial commutative ring, `m` a monomial order on
`ι` and `c : ι → ℝ` a cost such that `c·u < c·v` implies `m.toSyn u < m.toSyn v` for all exponents
(`m` refines `c`). For a Gröbner basis `G` of the toric ideal whose nonzero members have unit
leading coefficients, and every exponent `u`, the normal form `h.normalForm hG (monomial u 1)`
(Tau Ceti) is `monomial w 1` for an exponent `w` in the fibre of `u` that is `m`-least there and has
`c·w ≤ c·v` for every `v` in the fibre. The method is due to Conti and Traverso (1991, not
consulted); Sturmfels proves the combinatorial form (Algebraic recipes, Theorem 2.3, pp. 3–4) for
generic costs, where the optimum is unique. (Proved here.)

Route. A monomial order is well founded, so the fibre of `u` has an `m`-least element `w`. By 2.1
`w` is a standard monomial, so `monomial w 1` is supported on the standard monomials, and
`X^u − X^w` lies in the toric ideal. Tau Ceti's characterisation of the normal form,
`MonomialOrder.IsGroebnerBasis.normalForm_eq_iff`, gives the normal form `monomial w 1`. If some `v`
in the fibre had `c·v < c·w`, the refinement hypothesis would give `m.toSyn v < m.toSyn w`.

**Checks.**
- *A weight alone does not determine the optimum.* For `A = (1 2 3)`, `c = (1, 1, 1)` and `b = 4`
  the fibre is `{(4,0,0), (2,1,0), (1,0,1), (0,2,0)}` with costs `4, 3, 2, 2`: two optima. The
  graded lexicographic order with `x₁ > x₂ > x₃` refines `c` and picks `(0, 2, 0)`: the normal forms
  of `x₁⁴`, `x₁²x₂`, `x₁x₃` and `x₂²` are all `x₂²`. With `x₂ > x₁ > x₃` it picks `(1, 0, 1)`, and
  the normal form of `x₁⁴` is `x₁x₃`.
- *Refinement forces `c ≥ 0`.* If `c_j < 0`, then `c·e_j < c·0`, but `0` is the least exponent of
  every monomial order, so no order refines `c`. For `c = (1, …, 1)` Mathlib's
  `MonomialOrder.degLex` refines `c`, as it compares total degrees first.
- For `A = (1 2 3)` and `b = 7` the two optima `(0, 2, 1)` and `(1, 0, 2)` of the cost `(1, 1, 1)`
  are separated in the same way.

*Needs:* 2.1; Tau Ceti `MonomialOrder.IsGroebnerBasis.normalForm`,
`MonomialOrder.IsGroebnerBasis.normalForm_eq_iff`; Mathlib `MvPolynomial.restrictSupport`,
`MonomialOrder.toSyn`, `MonomialOrder.wellFoundedLT_syn`.

### Examples

- For `A = (1 2 3)` the toric ideal has the graded lexicographic reduced Gröbner basis
  `x₁² − x₂`, `x₁x₂ − x₃`, `x₁x₃ − x₂²`, `x₂³ − x₃²` (for `x₁ > x₂ > x₃`); by 2.1 the standard
  monomials are `x₁` and the `x₂^a x₃^e` with `a ≤ 2`, the least points of their fibres.

### Dependencies

2.1 uses the Tau Ceti toric-ideal and standard-monomial library. 2.2 uses 2.1 and the Tau Ceti
normal form.

## Layer 3: Graver bases, circuits and test sets

### 3.1 Graver bases and circuits

Define `IsConformal h g` for `h g : ι → ℤ`: `0 ≤ h j * g j` and `|h j| ≤ |g j|` for every `j` (the
conformal order `h ⊑ g`). Define `graverBasis A`: the nonzero moves `g` such that every nonzero
move `h ⊑ g` equals `g`. Define `circuits A`: the nonzero moves `c` of minimal support (every
nonzero move whose support lies in that of `c` has the same support) whose entries have no common
divisor other than a unit. Both sets are closed under `g ↦ −g`. The Graver basis is the union over
the orthants of the minimal generating sets of the semigroups of moves in each orthant, the
definition of Drton, Sturmfels and Sullivant (p. 30) and of Sturmfels (Algebraic recipes, (3.2)
and (3.3), pp. 5–6): a move of an orthant is a minimal generator exactly when it is not the sum of
two nonzero moves of that orthant, that is when no nonzero move `h ⊑ g` other than `g` exists.

Prove `graverBasis_finite`: the Graver basis is finite (Graver 1975, not consulted; Drton,
Sturmfels and Sullivant, pp. 30–31, from the finiteness of the minimal generating set of each
orthant semigroup; Sturmfels, Algebraic recipes, the sentence after (3.3), p. 6, from Gordan's
finiteness of Hilbert bases, Proposition 3.1, p. 5; both without proof). (Proved here.)

Route. For a sign vector `σ ∈ {±1}^ι`, the Graver elements `g` with `σ j g j ≥ 0` for all `j` are
sent injectively to `ι → ℕ` by `g ↦ |g|`, and their images form an antichain for `≤`: if `|h| ≤ |g|`
with both in the orthant `σ`, then `h ⊑ g`, so `h = g`. By Dickson's lemma (Mathlib
`Finsupp.wellQuasiOrderedLE`, transported along `Finsupp.equivFunOnFinite`, and
`IsAntichain.finite_of_wellQuasiOrdered`) each antichain is finite; there are `2^|ι|` orthants.

**Checks.**
- *The twisted cubic.* Its Graver basis is `±(1, −2, 1, 0)`, `±(0, 1, −2, 1)`, `±(1, −1, −1, 1)`,
  `±(1, 0, −3, 2)`, `±(2, −3, 0, 1)` (ten vectors); the circuits are the same without
  `±(1, −1, −1, 1)`, whose support is all four columns although `(1, −2, 1, 0)` has smaller support.
  The move `(1, −3, 3, −1) = (1, −2, 1, 0) + (0, −1, 2, −1)` is a conformal sum and is not in the
  Graver basis; `(2, −4, 2, 0)` has minimal support but is not primitive, so it is not a circuit.
- `A = (1 2)`: the Graver basis and the circuits are `±(2, −1)`. `A` the `2 × 2` identity: both are
  empty. `A = (1 0 1)`: both are `±(0, 1, 0)`, `±(1, 0, −1)`; the zero column gives the move `e₂`.
- Every move of the twisted cubic with entries at most `3` in absolute value is a sum of Graver
  elements conformal to it.

*Needs:* Mathlib `Finsupp.wellQuasiOrderedLE`, `IsAntichain.finite_of_wellQuasiOrdered`,
`Finsupp.equivFunOnFinite`, `Matrix.mulVec`.

### 3.2 Reduced Gröbner bases consist of Graver binomials

Prove `exists_mem_graverBasis_of_isReducedGroebnerBasis`: for a field `k`, a monomial order `m`
and a reduced Gröbner basis `G` of `TauCeti.toricIdeal k (fun j i => A i j)` in the sense of Tau
Ceti's `MonomialOrder.IsReducedGroebnerBasis`, every `g ∈ G` equals `moveBinomial k v` for some
`v ∈ graverBasis A`, with `m.degree g = v⁺`. The inclusion of the universal Gröbner basis in the
Graver basis is due to Sturmfels (*Gröbner Bases and Convex Polytopes*, not consulted); it is
stated by Drton, Sturmfels and Sullivant (p. 26 and p. 30), by Sturmfels (Algebraic recipes,
Proposition 3.2, p. 6, which refers to the book) and by Conca ((7), p. 5), all without proof.
(Proved here.)

Route. Let `u = m.degree g`. Every other exponent `w` in the support of `g` is a standard monomial:
a nonzero `p` in the ideal with `m.degree p ≤ w` gives, by the Gröbner property (Tau Ceti
`MonomialOrder.IsGroebnerBasis.exists_degree_le_degree`), a nonzero `h ∈ G` with
`m.degree h ≤ w`; `h ≠ g` is excluded by reducedness, and `h = g` by `w < u`. By 2.1 each fibre
contains at most one standard monomial, and the coefficients of `g` on each fibre sum to `0`. On
the fibre of `u` the coefficient at `u` is `1` (monic), so exactly one other exponent `w` occurs,
with coefficient `−1`; on every other fibre only standard monomials occur, at most one, with
coefficient `0`. So `g = X^u − X^w`. If `d = u ⊓ w` were nonzero, `w − d` would be standard (it
divides `w`) and `u − d`, in the same fibre, would not; a nonzero `h ∈ G` with
`m.degree h ≤ u − d < u` contradicts reducedness. So `u` and `w` have disjoint supports and
`g = moveBinomial k v` with `v = u − w`. If a nonzero move `h ⊑ v` differed from `v`, then
`h⁺ ≤ u`, `h⁻ ≤ w` and `h⁺ ≠ h⁻`. If `h⁻` is the smaller, `h⁺` is not standard, so some
`h' ∈ G` has `m.degree h' ≤ h⁺ ≤ u`, which forces `h' = g` and `h⁺ = u`; then `h⁻ ≠ w` are two
standard monomials (divisors of `w`) in one fibre, which is impossible. If `h⁺` is the smaller,
`h⁻` is not standard although it divides the standard `w`.

**Checks.**
- For the twisted cubic and each of the `72` orders of 2.1, every element of the reduced Gröbner
  basis is `X^(v⁺) − X^(v⁻)` with `v` in the Graver basis, leading term first; all five Graver
  elements up to sign occur, `(1, −1, −1, 1)` as `x₁x₄ − x₂x₃` already for lexicographic `x₁ > x₂ >
  x₃ > x₄`.

*Needs:* 2.1; Tau Ceti `MonomialOrder.IsReducedGroebnerBasis`,
`MonomialOrder.IsGroebnerBasis.exists_degree_le_degree`, `TauCeti.mem_toricIdeal_iff`,
`TauCeti.monomial_sub_monomial_mem_toricIdeal`; Mathlib `MonomialOrder.Monic`,
`MonomialOrder.degree`.

### 3.3 Every circuit lies in a reduced Gröbner basis

Prove `exists_isReducedGroebnerBasis_of_mem_circuits`: for a field `k` and a circuit `c` of `A`,
there are a monomial order `m` and a reduced Gröbner basis `G` of the toric ideal for `m` with
`moveBinomial k c ∈ G` or `moveBinomial k (−c) ∈ G`. The inclusion of the circuits in the
universal Gröbner basis is due to Sturmfels (*Gröbner Bases and Convex Polytopes*, not consulted;
stated by Conca, (7), p. 5, without proof). (Proved here.)

Route. Let `S` be the support of `c` and `m` a lexicographic order (Mathlib `MonomialOrder.lex`,
for a linear order on `ι` transported from an enumeration) in which the variables outside `S`
come first. Then a monomial containing a variable outside `S` is larger than every monomial in
the variables of `S`. Let `G` be the reduced Gröbner basis (Tau Ceti
`MonomialOrder.existsUnique_isReducedGroebnerBasis`), and replace `c` by `−c` if needed so that
`m.degree (moveBinomial k c) = c⁺`. This binomial is a nonzero element of the ideal, so some
`h ∈ G` has `m.degree h ≤ c⁺`; by 3.2, `h = moveBinomial k w` with `w` Graver and `m.degree h = w⁺`.
Then `w⁺` lives on `S`, and so does `w⁻`, which is smaller. By minimality of the support of `c`,
`w` has support `S`; for `j ∈ S` the move `c j • w − w j • c` has smaller support, so it is `0`, and
as the entries of `c` are coprime, `w = t c` for an integer `t ≠ 0`. Since `w` is Graver and
`sign(t) c ⊑ w`, `w = ±c`. If `w = −c`, then `w⁺ = c⁻ ≤ c⁺` forces `c⁻ = 0` and `m.degree h = 0`,
although `h = 1 − X^(c⁺)` has degree `c⁺ ≠ 0`. So `w = c` and `h = moveBinomial k c`.

**Checks.**
- For the twisted cubic the circuit `(1, 0, −3, 2)` appears as `x₁x₄² − x₃³` in the
  lexicographic basis with `x₂ > x₁ > x₃ > x₄` (`x₂` outside its support first), and
  `(2, −3, 0, 1)` as `x₁²x₄ − x₂³` with `x₃ > x₁ > x₂ > x₄`; neither appears for
  `x₁ > x₂ > x₃ > x₄`, where the reduced basis is the three quadrics.
- The non-circuit Graver element `(1, −1, −1, 1)` also lies in reduced Gröbner bases (3.2), so the
  circuits are in general a proper part of the union of the reduced Gröbner bases.

*Needs:* 3.1, 3.2; Tau Ceti `MonomialOrder.existsUnique_isReducedGroebnerBasis`,
`MonomialOrder.IsGroebnerBasis.exists_degree_le_degree`; Mathlib `MonomialOrder.lex`.

### 3.4 The unimodular case

Prove `graverBasis_eq_circuits`: let `d` be the real rank of `A`
(`(A.map ((↑) : ℤ → ℝ)).rank = d`), `ρ : Fin d → Fin r` a choice of `d` rows and `δ` an integer.
If every `d × d` minor `(A.submatrix ρ e).det`, `e : Fin d → ι`, of the chosen rows lies in
`{0, δ, −δ}`, and one of them is nonzero, then `graverBasis A = circuits A`. A nonzero minor forces
`ρ` to be injective and `δ ≠ 0`. The theorem applies to every totally unimodular `A`, of any rank
(`δ = 1` and `ρ` any `d` linearly independent rows), and to every `A` of rank `r` whose `r × r`
minors lie in `{0, 1, −1}` (`ρ = id`, `δ = 1`). This is Sturmfels' theorem for unimodular matrices
(*Gröbner Bases and Convex Polytopes*, not consulted; stated by Conca, (8), p. 6, and by
Almendra-Hernández, De Loera and Petrović, p. 13, for totally unimodular matrices, without
proof). (Proved here.)

Route. *Reduction to independent rows with minors in `{0, ±1}`.* Write `A_ρ = A.submatrix ρ id`,
choose columns `e₀` with `det (A.submatrix ρ e₀) ≠ 0` and put `Q = A.submatrix ρ e₀`, so
`det Q = ±δ ≠ 0`. The `d` rows `ρ` are linearly independent (`Q` is invertible), so they are a
basis of the row space of `A`, which has dimension `d` (`Matrix.rank_eq_finrank_span_row`); every
row of `A` is a rational combination of them, so `A` and `A_ρ` have the same integer kernel, hence
the same moves, Graver basis and circuits (both sets are defined through the moves alone). Put
`A' = Q⁻¹ A_ρ = (det Q)⁻¹ • (adjugate Q * A_ρ)`. By Cramer's rule
(`Matrix.cramer_eq_adjugate_mulVec`, `Matrix.cramer_apply`), its entry `(i, j)` is the minor
`det (A.submatrix ρ (Function.update e₀ i j))` divided by `det Q`; that minor lies in
`{0, δ, −δ}`, so the entry lies in `{0, 1, −1}` and `A'` is an integer matrix, `A' : Matrix (Fin d)
ι ℤ`. As `Q` is invertible, `A'` has the kernel of `A_ρ`, hence that of `A`, and real rank `d`, and
its `d × d` minors are `det (A.submatrix ρ e) / det Q ∈ {0, 1, −1}` (`Matrix.det_mul`). So
`graverBasis A = graverBasis A'` and `circuits A = circuits A'`, and it suffices to prove the
theorem for `A'`, which has real rank equal to its number of rows and all maximal minors in
`{0, 1, −1}`. For the rest of the route, write `A` for `A'` and `r` for `d`.

*Circuits are Graver elements* (for every `A`): if `h ⊑ c` is a nonzero move, its support
lies in that of `c`, so it equals it, and `c j • h − h j • c` has smaller support for `j` in the
support, hence is `0`; so `h = t c` with `t` rational, `0 < t ≤ 1`, and integral as `c` is
primitive, so `h = c`. *Graver elements are circuits:* let `g` be Graver, `σ` its sign vector
(`σ j = 1` where `g j = 0`) and `D` the diagonal matrix of `σ`. The matrix
`B = (A D, 0; I, I)` with rows `Fin r ⊕ ι` and columns `ι ⊕ ι` (reindexed to `Fin (r + |ι|)`) has
rank `r + |ι|`, and its maximal minors are, up to sign, maximal minors of `A` or `0` (expand along
the identity blocks). By IntegerPolyhedraAndTotalUnimodularity 2.1,
`forall_det_mem_iff_forall_extremePoints_realFibre`, every vertex of the polytope
`P = realFibre B (0, |g|) = {(y, s) ≥ 0 : A D y = 0, y + s = |g|}` is integral. `P` is compact and
convex, so it is the closure of the convex hull of its vertices (Mathlib
`closure_convexHull_extremePoints`); the vertices are integral points of the bounded set `P`, hence
finitely many, so that hull is already closed and equals `P`. Its integral points are the
`(D h, |g| − D h)` with `h` an integral move, `h ⊑ g`; by minimality of `g` these are `h = 0` and
`h = g`. So `P` is the segment between `(0, |g|)` and `(|g|, 0)`. Now let `y` be a nonzero rational
move with `y j g j ≥ 0` for all `j` and `y j = 0` wherever `g j = 0`, of least support among such
moves (`g` itself is one). Its support is minimal among all nonzero moves: for a nonzero move `z`
whose support is strictly contained in that of `y`, replacing `z` by `−z` if needed, some `j` has
`y j z j > 0`, and `y − λ z` with `λ` the least ratio `y j / z j` over these `j` is a nonzero move,
still sign-compatible with `g`, with smaller support (it is nonzero at the coordinates where `y`
is nonzero and `z` vanishes). If the support of `y` were strictly contained in that of `g`, then
for small `t > 0` the point `(D t y, |g| − D t y)` would lie in `P` but not on the segment, as
`t y` is not a multiple of `g`. So `g` has minimal support, and it is primitive since
`g / d ⊑ g`, a nonzero move different from `g`, for every common divisor `d > 1`.

**Checks.**
- *2 × 3 tables, no row deleted.* The margin matrix of `2 × 3` tables (two row sums, three column
  sums) has five rows of rank `4` and is totally unimodular. For each of the `120` injective
  choices `ρ` of four of its rows, every `4 × 4` minor of the chosen rows lies in `{0, 1, −1}` and
  some is nonzero, so 3.4 applies with `δ = 1`. Its Graver basis and its circuits are the six
  vectors `±(e_(1k) − e_(1l) − e_(2k) + e_(2l))`. For `ρ` the two row sums and the first two column
  sums, and `e₀` the columns `11, 12, 13, 21`, the matrix `A'` of the route is
  `(1 0 0 0 −1 −1; 0 1 0 0 1 0; 0 0 1 0 0 1; 0 0 0 1 1 1)`, and for each of the `64` sign vectors
  the matrix `B` built from `A'` has rank `10` and maximal minors in `{0, 1, −1}`.
- *A common value `δ > 1`.* `A = (2 2)` has rank `1` and minors `2, 2`; its Graver basis and
  circuits are both `±(1, −1)`. `A = (1 1 0; 1 −1 2)` has rank `2` and minors `−2, 2, 2`; with
  `e₀` the first two columns, `A' = (1 0 1; 0 1 −1)`, and the Graver basis and the circuits are
  both `±(1, −1, −1)`.
- *Unimodularity is needed.* The twisted cubic has rank `2`, and the nonzero `2 × 2` minors of its
  two rows (in either order) have the absolute values `1, 2, 3`; its Graver basis is larger than
  its circuits (3.1).
- *Some chosen minor must be nonzero.* Repeating the second row of the twisted cubic gives a
  `3 × 4` matrix of rank `2`. For `ρ` the two equal rows every `2 × 2` minor is `0`, so the minor
  condition holds for every `δ`, but the Graver basis is still not the set of circuits.
- *`d` must be the rank of `A`.* The first row `(1 1 1 1)` of the twisted cubic has all its
  `1 × 1` minors equal to `1`, but the rank of the twisted cubic is `2`, not `1`, and its Graver
  basis is not the set of circuits.
- *The converse fails.* `A = (1 2)` has the minors `1` and `2`, yet its Graver basis and circuits
  are both `±(2, −1)`.
- `A = 0` (any `r`): `d = 0`, `ρ` is the empty choice, the only minor is the empty one, of
  determinant `1`, so `δ = ±1`; every vector is a move, and the Graver basis and the circuits are
  the `±e_j`.

*Needs:* 3.1; IntegerPolyhedraAndTotalUnimodularity 2.1
`forall_det_mem_iff_forall_extremePoints_realFibre` and its copy of `realFibre`; Mathlib
`Set.extremePoints`, `closure_convexHull_extremePoints`, `Matrix.rank`,
`Matrix.rank_eq_finrank_span_row`, `Matrix.det`, `Matrix.det_mul`, `Matrix.adjugate`,
`Matrix.cramer_eq_adjugate_mulVec`, `Matrix.cramer_apply`, `Matrix.submatrix`, `Matrix.reindex`.

### 3.5 Graver bases are the least test sets

Define `IsTestSet A T` for `T : Set (ι → ℤ)`: for every bound `a : ι → ℕ`, cost `c : ι → ℝ` and
feasible `u ≤ a`, if some `v ≤ a` in the fibre of `u` has `c·v < c·u`, then some `t ∈ T` is a move
with `t j ≤ u j` and `−t j ≤ a j − u j` for every `j` and `c·t > 0`; then `u − t` is a feasible
point of smaller cost. Prove `isLeast_graverBasis`: `graverBasis A` is the least set, for inclusion,
with `IsTestSet A`. This is Sturmfels' Theorem 3.4 (Algebraic recipes, p. 7, with proof) in
corrected form, stated there for integer costs; the proof is the same for real costs. As printed,
the theorem's characterisation of non-optimal points omits the condition `c·g > 0`, and its "if"
direction then fails: for the twisted cubic, `a = (1, 1, 1, 1)` and `c = (1, 0, 0, 0)`, the point
`u = (0, 1, 1, 0)` is optimal, yet the Graver element `g = (−1, 1, 1, −1)` has `g⁺ ≤ u` and
`g⁻ ≤ a − u`, and `u − g = (1, 0, 0, 1)` costs more. `IsTestSet` keeps the condition, as the first
half of that proof does.

Route. *A test set.* Let `v` be a better feasible point and `x = v − u`, a move. Write `x` as a sum
of Graver elements `g_1, …, g_s` conformal to `x` (induction on `∑ |x j|`: a nonzero move that is
not Graver has a nonzero `h ⊑ x` other than `x`, and `x − h ⊑ x` too). Since `c·x < 0`, some
`c·g_i < 0`; put `t = −g_i`. Conformality gives `t⁺ = g_i⁻ ≤ x⁻ ≤ u` and `t⁻ = g_i⁺ ≤ x⁺ ≤ a − u`.
*Least.* For `g` Graver, `a = g⁺ + g⁻`, `u = g⁺` and `c = g`: a feasible `v` in the fibre of `g⁺`
has `h = v − g⁺ ⊑ −g`, so `h ∈ {0, −g}` and `v ∈ {g⁺, g⁻}`, with `c·g⁻ < c·g⁺`. A test set `T` gives
a move `t` with `g⁺ − t` feasible and `c·t > 0`, so `g⁺ − t = g⁻` and `t = g ∈ T`.

**Checks.**
- For the twisted cubic, every bound `a ∈ {0, 1, 2}⁴`, the costs `(1, 1, 1, 1)`, `(0, 1, 0, 1)`,
  `(3, −1, 2, −5)`, `(1/2, 2, −1, 0)` and every feasible `u`: non-optimality and the existence of an
  improving Graver element agree (`5184` cases).
- *Circuits are not a test set for the twisted cubic.* For `a = (1, 1, 1, 1)`, `u = (1, 0, 0, 1)`
  and `c = (1, 0, 0, 0)` the point `(0, 1, 1, 0)` is better, and the only move with the required
  bounds is `(1, −1, −1, 1)`, a Graver element that is not a circuit; neither is any lattice basis
  vector of 1.1 usable here.
- For every Graver element `g` of the twisted cubic, the box `0 ≤ v ≤ g⁺ + g⁻` meets the fibre of
  `g⁺` exactly in `{g⁺, g⁻}`, as in the route.

*Needs:* 3.1; Mathlib `IsLeast`, `Matrix.mulVec`.

### Examples

- *Unimodular matrices.* If `A` satisfies the hypotheses of 3.4, then by 3.2 every reduced
  Gröbner basis of the toric ideal consists of circuit binomials, and these generate the ideal
  (Tau Ceti `MonomialOrder.IsGroebnerBasis.ideal_eq_span`); by 1.1 over `k = ℚ` the circuits form
  a Markov basis. For `m × n` tables with fixed margins, the margin matrix, with no row deleted, is
  the incidence matrix of the complete bipartite graph `K_(m,n)`; it has rank `m + n − 1` and is
  totally unimodular, so the hypotheses hold with `δ = 1` and any `m + n − 1` of its `m + n` rows,
  and the circuits are the alternating moves along the cycles of `K_(m,n)` (Conca, p. 6).
- *The general chain of inclusions.* For any `A`, 3.3 and 3.2 give circuits ⊆ (reduced Gröbner
  basis vectors, up to sign) ⊆ Graver basis, and by 1.1 the Graver basis is a Markov basis. For the
  twisted cubic the first inclusion is strict and the second an equality.

### Dependencies

3.1 uses only Mathlib. 3.2 uses 2.1. 3.3 uses 3.1 and 3.2. 3.4 uses 3.1 and
IntegerPolyhedraAndTotalUnimodularity 2.1. 3.5 uses 3.1.

## Scope and ownership

- The toric ideal of a family of exponents, its binomial generation over every commutative ring,
  finite binomial generation, the semigroup-algebra presentation, Gröbner bases, remainders,
  standard monomials, normal forms and reduced Gröbner bases are in the Tau Ceti library
  (`TauCeti/RingTheory/MvPolynomial/ToricIdeal/`, `…/Groebner/`), realising GroebnerGeometry G1
  (ideals, normal forms and elimination) and G2 (semigroup presentations, binomial generation and
  the Hilbert-function count). They are cited above and not restated. Weight initials and their
  refinement by a term order are GroebnerGeometry G1; 2.2 assumes a refining order and does not
  construct one.
- The fibre `Fibre` is TensorProductCombinatorics §1.5's, copied verbatim; the finiteness of fibres
  under a positive height and the counting of fibres are owned there and not restated. 1.2 assumes
  the fibre finite.
- The uniqueness of the invariant probability of a finite irreducible chain is
  MarkovChainsAndRenewal Layer 3, cited above; mixing times and aperiodicity of the fibre chain are
  not treated here.
- The Metropolis–Hastings kernel and its reversibility are LangevinAndHamiltonianMonteCarlo
  1.1–1.2, copied (the kernel and the acceptance) and cited (the theorems). MathematicalStatistics
  Foundations 9.4 describes a Metropolis–Hastings kernel on a finite type in its README, with no
  Lean declaration; it is not used.
- The integrality of vertices for unimodular and totally unimodular matrices, including the
  Hoffman–Kruskal theorem, is IntegerPolyhedraAndTotalUnimodularity's (2.1, 2.2), cited above.
- Not treated here: minimal Markov bases and the invariance of their fibre multiset, Markov bases of
  hierarchical and decomposable models, Lawrence liftings, degree bounds for Graver and Gröbner
  bases, the Gröbner fan and state polytope, lattice ideals of lattices not of the form `ker A`, and
  primary decomposition of binomial ideals. Every procedure (Buchberger's algorithm, completion for
  toric ideals, enumeration of Graver bases, sampling algorithms as programs) is outside the scope.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Finsupp/MonomialOrder.lean`: `MonomialOrder` (with `toSyn` and `wellFoundedLT_syn`),
  `MonomialOrder.lex` (for `[LinearOrder σ]`, `[WellFoundedGT σ]`);
  `Mathlib/Data/Finsupp/MonomialOrder/DegLex.lean`: `MonomialOrder.degLex`;
  `Mathlib/RingTheory/MvPolynomial/MonomialOrder.lean`: `MonomialOrder.degree`,
  `MonomialOrder.Monic`, `MonomialOrder.degree_mem_support`, `MonomialOrder.le_degree`.
- `Mathlib/RingTheory/MvPolynomial/Basic.lean`: `MvPolynomial.restrictSupport`.
- `Mathlib/Probability/Kernel/Irreducible.lean`: `ProbabilityTheory.Kernel.IsIrreducible`.
  `Mathlib/Probability/Kernel/Invariance.lean`: `Kernel.Invariant`, `Kernel.IsReversible`,
  `Kernel.IsReversible.invariant` (for `[IsMarkovKernel κ]`). `Kernel.ofFunOfCountable` (countable
  domain with measurable singletons), `Kernel.withDensity`, `Kernel.id`, `Kernel.comp_apply`,
  `IsFiniteKernel`, `IsMarkovKernel`; `Measure.count`, `Measure.withDensity`, `Measure.dirac`.
- `Mathlib/Data/Finsupp/PWO.lean`: `Finsupp.wellQuasiOrderedLE`;
  `Mathlib/Order/WellQuasiOrder.lean`: `IsAntichain.finite_of_wellQuasiOrdered`.
- `Mathlib/Analysis/Convex/KreinMilman.lean`: `closure_convexHull_extremePoints`;
  `Set.extremePoints`; `Matrix.mulVec`, `Matrix.rank`, `Matrix.det`, `Matrix.submatrix`,
  `Matrix.reindex`, `SignType.cast`; `Relation.ReflTransGen`; `Finsupp.equivFunOnFinite`,
  `Finsupp.linearCombination`; `IsLeast`.

### From Tau Ceti

- `TauCeti/RingTheory/MvPolynomial/ToricIdeal/Basic.lean`: `TauCeti.toricIdeal` (for
  `[AddCommMonoid M]` and `[CommSemiring R]`, the kernel of `X i ↦ single (a i) 1`),
  `TauCeti.mem_toricIdeal_iff`, `TauCeti.toricIdeal_eq_span` (`[CommRing R]`),
  `TauCeti.monomial_sub_monomial_mem_toricIdeal`, `TauCeti.exists_finset_toricIdeal_eq_span`
  (`[Finite ι]`).
- `TauCeti/RingTheory/MvPolynomial/ToricIdeal/HilbertFunction.lean`:
  `MonomialOrder.card_standardMonomials_toricIdeal` (over a field, for a grading `deg : M →+ D`).
- `TauCeti/RingTheory/MvPolynomial/Groebner/Basic.lean`: `MonomialOrder.IsGroebnerBasis`,
  `MonomialOrder.IsGroebnerBasis.exists_degree_le_degree`,
  `MonomialOrder.IsGroebnerBasis.ideal_eq_span`.
- `TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean`: `MonomialOrder.standardMonomials`,
  `MonomialOrder.IsGroebnerBasis.normalForm` (for a Gröbner basis whose nonzero members have unit
  leading coefficients), `MonomialOrder.IsGroebnerBasis.normalForm_eq_iff`.
- `TauCeti/RingTheory/MvPolynomial/Groebner/Reduced.lean`: `MonomialOrder.IsReducedGroebnerBasis`
  (a Gröbner basis of nonzero monic polynomials no term of which is divisible by the leading
  monomial of another member), `MonomialOrder.existsUnique_isReducedGroebnerBasis` (over a field).

### From TauCetiRoadmap.TensorProductCombinatorics

- §1.5: `Fibre`, copied verbatim (the definition and its `variable` line).

### From TauCetiRoadmap.MarkovChainsAndRenewal

- Layer 3, item 2: `existsUnique_invariant_probability` (`[Countable S]`,
  `[MeasurableSingletonClass S]`, `[Nonempty S]`, `[IsMarkovKernel κ]`, `[Finite S]`): a kernel
  that is irreducible in that roadmap's sense `IsIrreducible κ` (every state reaches every state,
  `Reaches κ x y := ∃ n, 0 < (κ ^ n) x {y}`) has exactly one invariant probability.

### From TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo

- 1.1: `mhKernel` (copied verbatim, with its `variable` line) and
  `TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.isMarkovKernel_mhKernel` (a Markov proposal and
  an acceptance function at most `1` give a Markov kernel).
- 1.2: `mhAcceptance` (copied verbatim) and
  `TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo.mhKernel_mhAcceptance_isReversible` (for an
  s-finite reference measure, measurable finite densities `p` and `q` and a proposal with densities
  `q x`, the kernel is reversible for the measure of density `p`).

### From TauCetiRoadmap.IntegerPolyhedraAndTotalUnimodularity

- 2.1: `forall_det_mem_iff_forall_extremePoints_realFibre` (for `A : Matrix (Fin r) ι ℤ` of real
  rank `r`: all `r × r` column minors in `{0, ±1}` if and only if every vertex of
  `realFibre A b` is integral for every integral `b`), with its copy of `realFibre`.

## References

- M. Drton, B. Sturmfels, S. Sullivant, *Lectures on Algebraic Statistics*, Oberwolfach Seminars
  39, Birkhäuser, 2009; version of September 27, 2008, on Sturmfels' page
  (`math.berkeley.edu/~bernd/owl.pdf`), whose page numbers are cited: Algorithm 1.1.13 and
  Theorem 1.1.14 (pp. 16–17), §1.3 (pp. 26–31), Remark 1.3.4 and the Graver basis (p. 30),
  Proposition 1.3.5 and Theorem 1.3.6 (p. 31).
- B. Sturmfels, *Algebraic recipes for integer programming*, arXiv:math/0310194 (2003): Lemma 2.1,
  Definition 2.2 and Theorem 2.3 with proof (pp. 3–4), Proposition 3.1 and (3.2)–(3.3) (pp. 5–6),
  Proposition 3.2 (p. 6), Theorem 3.4 with proof (p. 7).
- C. Almendra-Hernández, J. A. De Loera, S. Petrović, *Markov bases: a 25 year update*,
  arXiv:2306.06270: Definition 2.5 and Theorem 2.6 (p. 5), p. 13.
- S. Aoki, *An introduction to computational algebraic statistics*, arXiv:1607.07600:
  Theorem 2.3 (PDF p. 18).
- A. Conca, *A universal tale of determinants and Gröbner bases*, arXiv:2403.07098: (7) and (8)
  (pp. 5–6).
- Attributed by name only, not consulted: P. Diaconis and B. Sturmfels, Algebraic algorithms for
  sampling from conditional distributions, Ann. Statist. 26 (1998), 363–397; P. Conti and
  C. Traverso, Buchberger algorithm and integer programming, AAECC-9, Lecture Notes in Computer
  Science 539 (1991), 130–139; J. E. Graver, On the foundations of linear and integer linear
  programming I, Math. Programming 9 (1975), 207–226; B. Sturmfels, *Gröbner Bases and Convex
  Polytopes*, University Lecture Series 8, AMS, 1996.
