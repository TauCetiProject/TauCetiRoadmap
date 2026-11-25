# Roadmap: the Lovász theta function

**Summary.** For a finite simple graph `G` on `n` vertices, the Lovász theta function `ϑ(G)` is
the largest value of the sum of the entries of a positive semidefinite real matrix `B` of trace
one that vanishes on the edges of `G`. It is a real number that can be described in three
equivalent ways (as this maximum, as a minimum over orthonormal representations of `G`, and as
the least largest eigenvalue of a symmetric matrix with prescribed entries off the edges), and
it is squeezed between two hard integer invariants of the graph. This roadmap defines `ϑ`, proves
that the three descriptions agree and that each extremum is attained, and proves the classical
theorems about it: the sandwich theorem, multiplicativity under the strong product, its value on
odd cycles, its behaviour under complementation, and Lovász's determination of the Shannon
capacity of the pentagon. All graphs are finite and simple; no other hypothesis is standing.

The headline theorems are these.

- *The three forms.* On a nonempty vertex set, `ϑ(G)` equals the least `t` such that there are
  unit vectors `uᵢ` and `c` in some `ℝᴺ` with `uᵢ ⊥ uⱼ` for distinct nonadjacent `i`, `j` and
  `⟨c, uᵢ⟩² ≥ 1/t` for every `i`; and it equals the least largest eigenvalue of a real symmetric
  matrix whose entries are `1` at every pair of nonadjacent vertices and on the diagonal.
- *The sandwich theorem.* `α(G) ≤ ϑ(G) ≤ χ(Ḡ)`: the independence number of `G` is at most
  `ϑ(G)`, which is at most the least number of cliques covering the vertices of `G`.
- *Multiplicativity and Shannon capacity.* `ϑ(G ⊠ H) = ϑ(G) ϑ(H)` for the strong product. The
  Shannon capacity `Θ(G)`, the limit of `α(G^⊠k)^(1/k)`, satisfies `α(G) ≤ Θ(G) ≤ ϑ(G)`, and
  `Θ(C₅) = ϑ(C₅) = √5`.
- *Cycles, complements and symmetry.* For odd `n ≥ 3`, `ϑ(Cₙ) = n cos(π/n)/(1 + cos(π/n))`.
  For every graph `ϑ(G) ϑ(Ḡ) ≥ n`, with equality when the automorphism group of `G` is transitive
  on vertices; and for a `d`-regular graph with smallest adjacency eigenvalue `λₙ`,
  `ϑ(G) (d − λₙ) ≤ n (−λₙ)`.

The roadmap builds on Mathlib's positive semidefinite matrices, Gram matrices, Kronecker products
and the separation theorem for closed convex cones, and on Mathlib's independence number,
colourings, cycle graphs and Fekete's subadditive lemma; Tau Ceti supplies the factorization of a
positive semidefinite matrix as a Gram matrix. It takes the sorted adjacency eigenvalues of the
roadmap SpectralGraphBounds, whose Hoffman ratio bound for the independence number it sharpens
to a bound for `ϑ`. The equality of the three forms is proved by Knuth's direct cone argument,
not by a general duality theorem for semidefinite programs.

Layer 1 below defines `ϑ` and proves the three forms equal. Layer 2 proves the sandwich theorem
and the complement inequality from Layer 1. Layer 3 defines the strong product and strong powers
and proves multiplicativity from Layer 1. Layer 4 computes `ϑ` of odd cycles and treats
vertex-transitive and regular graphs; it uses Layers 1 and 2. Layer 5 defines the Shannon
capacity and proves Lovász's bound and `Θ(C₅) = √5`; it uses Layers 2, 3 and 4.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]`, and `n = Fintype.card V`.
  The complement is `Gᶜ`, written `Ḡ` in prose. The independence number is `SimpleGraph.indepNum`
  (a natural number, coerced to `ℝ`), an independent set is `SimpleGraph.IsIndepSet`, and the
  chromatic number of `Ḡ` enters only through every `k` with `Gᶜ.Colorable k`, which avoids the
  `ℕ∞`-valued `SimpleGraph.chromaticNumber`; a `k`-colouring of `Ḡ` is a cover of the vertices
  of `G` by `k` cliques. The cycle `Cₙ` is Mathlib's `SimpleGraph.cycleGraph n` on `Fin n`, which
  is the `n`-cycle for `n ≥ 3`. Vertex-transitivity is the hypothesis that for all vertices `u`,
  `v` there is a graph automorphism `φ : G ≃g G` with `φ u = v`; Mathlib has no name for it.
- **The convention for ϑ.** This roadmap uses the convention in which `α(G) ≤ ϑ(G) ≤ χ(Ḡ)` and
  orthonormal representations of `G` make nonadjacent vertices orthogonal. Knuth's caution on
  p. 2 names it as the convention of Lovász's paper on the Shannon capacity and of the book of
  Grötschel, Lovász and Schrijver, and notes that Lovász's 1986 CBMS lecture notes call the same
  function `ϑ(Ḡ)`. Knuth's notes use this function `ϑ(G)`: his orthogonal labellings make
  nonadjacent vertices orthogonal, his inequality (4.9) is `α(G) ≤ ϑ(G) ≤ χ(Ḡ)`, and his
  displayed sandwich (∗), `ω(G) ≤ ϑ(Ḡ) ≤ χ(G)`, is the same inequality applied to the
  complement. The plausible wrong variant, the semidefinite form with `B` vanishing on the
  non-edges, computes `ϑ(Ḡ)` instead (Check in 1.1).
- **Matrices.** Matrices are `Matrix V V ℝ`; positive semidefinite is `Matrix.PosSemidef`, the
  trace is `Matrix.trace`, and `J` is the all-ones matrix, so that `⟨J, B⟩ = ∑ᵢ ∑ⱼ B i j`. The
  largest eigenvalue of a real symmetric matrix `A` on a nonempty index type is
  `hA.eigenvalues₀ ⟨0, _⟩` for `hA : A.IsHermitian`, Mathlib's eigenvalues listed in nonincreasing
  order.
- **Junk values.** `lovaszTheta G` is an `sSup` of a set of reals; on the empty vertex type the
  set is empty (no matrix has trace `1`) and `ϑ = 0`, which agrees with `α = 0` and with the
  empty cover. The minimum forms are stated as `IsLeast` facts on a nonempty vertex type. The
  cost `1/⟨c, uᵢ⟩²` is never written as a quotient: the condition is `1 ≤ t ⟨c, uᵢ⟩²`, which
  fails when `⟨c, uᵢ⟩ = 0`, so a representation with a vector orthogonal to the handle gives no
  bound. The Shannon capacity is a supremum over powers `k ≥ 1`, never `k = 0`.

## Layer 1: the theta function and its three forms

### 1.1 The semidefinite form

Define `lovaszTheta`: for a graph `G`, `lovaszTheta G` is the supremum of `∑ᵢ ∑ⱼ B i j` over real
matrices `B` that are positive semidefinite, have trace `1`, and satisfy `B i j = 0` whenever `i`
and `j` are adjacent. Prove `isGreatest_lovaszTheta`: on a nonempty vertex type the supremum is
attained, that is, `lovaszTheta G` is the greatest element of that set of values (Knuth, §7,
definition (7.1) with all weights `1`, the matrix form stated after it, p. 10; that the maximum
exists is used without comment in Lemma 10, p. 13).

Route: the set of admissible `B` is nonempty (`B = I/n`), closed, and bounded, because a positive
semidefinite matrix of trace `1` has `|B i j| ≤ √(B i i B j j) ≤ 1`; the objective is continuous,
so a maximum exists (Mathlib `IsCompact.exists_isMaxOn`). The set of values is bounded above by
`n`, since `⟨J, B⟩ ≤ λ_max(J) tr B = n`, so `sSup` is the maximum. (Proved here.)

API, stated in prose:

- `ϑ(G) ≥ 1` on a nonempty vertex type (take `B = Eᵢᵢ`, a single diagonal entry `1`), and
  `0 ≤ ϑ(G) ≤ n` always.
- Monotonicity: if every edge of `G` is an edge of `G'` on the same vertices, then
  `ϑ(G') ≤ ϑ(G)` (Knuth, (4.3), p. 7).
- Invariance under graph isomorphism, by permuting rows and columns of `B`.

**Checks.**
- Empty vertex type: no `B` has trace `1`, the set is empty and `ϑ = 0`; it has no greatest
  element, which is why `isGreatest_lovaszTheta` assumes a nonempty vertex type.
- Edgeless graph on `n ≥ 1` vertices: `B = J/n` gives `n`, and `⟨J, B⟩ ≤ n tr B` gives `ϑ = n`.
  Complete graph `Kₙ`: `B` must be diagonal, so `⟨J, B⟩ = tr B = 1` and `ϑ = 1`.
- Convention: on `K₃` the plausible wrong form with `B` vanishing on the non-edges allows
  `B = J/3` and gives `3`, which is `ϑ` of the edgeless complement, not `ϑ(K₃) = 1`.
- The pentagon `C₅` with vertices in `ℤ/5`: `B = (1/5) I + ((√5 − 1)/10)(P² + P⁻²)`, where `P`
  is the cyclic shift, vanishes on the edges `{i, i ± 1}`, has trace `1`, and its circulant
  eigenvalues `1/5 + ((√5 − 1)/5) cos(4πk/5)` are `√5/5`, `0`, `0`, `(5 − √5)/10`,
  `(5 − √5)/10`, all nonnegative. Its entry sum is `1 + 10 (√5 − 1)/10 = √5`, so `ϑ(C₅) ≥ √5`.

*Needs:* Mathlib `Matrix.PosSemidef`, `Matrix.trace`, `IsCompact.exists_isMaxOn`.

### 1.2 The orthonormal representation form

An orthonormal representation of `G` in `ℝᴺ` is a family of unit vectors `uᵢ`, one per vertex,
with `⟨uᵢ, uⱼ⟩ = 0` whenever `i ≠ j` are not adjacent; a handle is a unit vector `c`. Prove
`isLeast_orthonormalRepresentation`: on a nonempty vertex type, `ϑ(G)` is the least real `t` for
which some dimension `N`, some orthonormal representation `u` of `G` in
`EuclideanSpace ℝ (Fin N)` and some handle `c` satisfy `1 ≤ t ⟨c, uᵢ⟩²` for every vertex `i`;
the dimension is part of the existential, and the least value is attained (Knuth, §5,
definition (5.2) with all weights `1`, p. 8, and Theorem 12, (12.1), p. 15; Knuth allows vectors
of any length and measures them by the cost `c(a) = a₁²/‖a‖²`, which is `⟨c, uᵢ⟩²` after
normalizing `aᵢ` and taking `c` to be the first coordinate vector).

**Checks.**
- The pentagon: step 2 of 1.4 applied to the matrix `A` of the Check in 1.3, whose largest
  eigenvalue is `√5`, gives five unit vectors in `ℝ⁶` with a common handle `c`,
  `⟨c, uᵢ⟩² = 1/√5` and nonadjacent ones orthogonal, so `t = √5` lies in the set.
- Division junk: on two nonadjacent vertices take `u₁ = e₁`, `u₂ = e₂`, `c = e₁`. The quotient
  form `max 1/⟨c, uᵢ⟩²` with Lean's `1/0 = 0` would give `1`, below `ϑ = 2`; the condition
  `1 ≤ t ⟨c, u₂⟩² = 0` excludes this representation.
- Empty vertex type: every `t` qualifies (take `N = 1` and any handle), so there is no least
  element; the nonemptiness hypothesis is needed.

*Needs:* 1.1 and the route 1.4; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`;
Mathlib `Matrix.posSemidef_gram`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`Matrix.IsHermitian.spectral_theorem`, `ProperCone.hyperplane_separation'`,
`Orthonormal.exists_orthonormalBasis_extension`, `EuclideanSpace`, `inner`.

### 1.3 The eigenvalue form

Prove `isLeast_eigenvalue`: on a nonempty vertex type, `ϑ(G)` is the least value of the largest
eigenvalue of a real symmetric matrix `A` with `A i j = 1` whenever `i` and `j` are not adjacent
(in particular on the diagonal), the other entries being free; the least value is attained
(Knuth, §6, definitions (6.1) and (6.3) with all weights `1`, pp. 8–9, and Theorem 12, (12.1),
p. 15).

**Checks.**
- Edgeless graph: the only admissible `A` is `J`, with largest eigenvalue `n = ϑ`. Complete
  graph: `A = I` is admissible, largest eigenvalue `1 = ϑ`.
- The pentagon: `A = J − ((5 − √5)/2)(P + P⁻¹)` equals `1` on the diagonal and on the non-edges
  `{i, i ± 2}`. Its circulant eigenvalues `5·[k = 0] − (5 − √5) cos(2πk/5)` are `√5` for `k = 0`,
  `(5 − 3√5)/2` for `k = 1, 4` and `√5` for `k = 2, 3`, so its largest eigenvalue is `√5`, and
  with the Check of 1.1, `ϑ(C₅) = √5`.

*Needs:* 1.1 and the route 1.4; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`;
Mathlib `Matrix.posSemidef_gram`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`Matrix.IsHermitian.spectral_theorem`, `ProperCone.hyperplane_separation'`,
`Orthonormal.exists_orthonormalBasis_extension`, `Matrix.IsHermitian.eigenvalues₀`,
`Matrix.IsHermitian.eigenvalues₀_antitone`.

### 1.4 Route of 1.2 and 1.3: the three forms agree

This section is the common route of 1.2 and 1.3; it states nothing beyond them. Write `S` for the
semidefinite maximum `ϑ(G)`, `O` for the orthonormal representation form and `E` for the
eigenvalue form, on a nonempty vertex type. By Tau Ceti's Gram factorization every admissible `B`
is the Gram matrix of vectors `bᵢ` with `bᵢ ⊥ bⱼ` for adjacent `i`, `j` (an orthogonal labelling
of `Ḡ`) and `∑ ‖bᵢ‖² = 1`.

1. `S ≤ t` for every `t` in the set of 1.2. Given `B` with vectors `bᵢ`, rotate so that
   `∑ᵢ bᵢ` points along the first axis; then `⟨J, B⟩ = ‖∑ bᵢ‖² ≤ ∑ᵢ c(bᵢ)` by Cauchy–Schwarz,
   with `c(b) = b₁²/‖b‖²` (Knuth, Lemma 10, (10.2)–(10.4), pp. 13–14). For an orthonormal
   representation `u` of `G` with handle `c`, the matrices `uᵢ bᵢᵀ` are pairwise orthogonal in
   the trace inner product (nonadjacent pairs are killed by `u`, adjacent pairs by `b`), so
   `∑ᵢ ⟨c, uᵢ⟩² c(bᵢ) ≤ 1` (Knuth, Lemma 11, (11.1)–(11.3), p. 14, with Lemma 1, (1.1), p. 5).
   With `⟨c, uᵢ⟩² ≥ 1/t` this gives `∑ c(bᵢ) ≤ t`.
2. Every admissible `A` of 1.3 gives a point of the set of 1.2 with `t = λ_max(A)`. Put
   `λ = λ_max(A)`; then `λ ≥ tr A / n = 1 > 0`, and `λI − A` is positive semidefinite, the Gram
   matrix of vectors `xᵢ`. The vectors `aᵢ = (1, xᵢ)` satisfy `‖aᵢ‖² = λ` and
   `⟨aᵢ, aⱼ⟩ = 1 − A i j = 0` for nonadjacent `i ≠ j`, so `uᵢ = aᵢ/√λ` with `c` the first
   coordinate vector has `⟨c, uᵢ⟩² = 1/λ` (Knuth, Lemma 6, (6.5)–(6.6), p. 9).
3. Some admissible `A` has `λ_max(A) ≤ S` (Knuth, Lemma 7, (7.2)–(7.3), p. 10, with the Fact
   proved in §9, pp. 12–13). In the space of real symmetric matrices with the trace inner
   product, let `D` be the cone of positive semidefinite matrices and `𝓕` the subspace of
   symmetric matrices vanishing on the diagonal and on the non-edges. The cone `D + 𝓕` is closed:
   if `Xₖ + Yₖ → M` with `Xₖ ⪰ 0` and `Yₖ ∈ 𝓕`, the diagonals of the `Xₖ` converge because those
   of the `Yₖ` vanish, so the `Xₖ` are bounded, a subsequence converges to some `X ⪰ 0`, and
   `Yₖ → M − X ∈ 𝓕`. Suppose `S·I − J ∉ D + 𝓕`. The separation theorem for closed convex cones
   (Mathlib `ProperCone.hyperplane_separation'`) gives a symmetric `B` with `⟨M, B⟩ ≥ 0` on
   `D + 𝓕` and `⟨S·I − J, B⟩ < 0`. Nonnegativity on `D` makes `B` positive semidefinite (`D` is
   self-dual, Knuth, F9, p. 12), and nonnegativity on the subspace `𝓕` makes `B` vanish on the
   edges (Knuth, F8, p. 12); so `B ≠ 0` is admissible in 1.1 after scaling to trace `1`, and
   `⟨J, B⟩ ≤ S tr B` contradicts `⟨S·I − J, B⟩ < 0`. Hence `S·I − J = X + Y` with `X ⪰ 0`,
   `Y ∈ 𝓕`, and `A = J + Y = S·I − X` is admissible with `λ_max(A) ≤ S`. (Knuth reaches the same
   decomposition through his F6, p. 12, which states the dual of an intersection of two closed
   cones as the sum of their duals; in general that sum must be closed first, and the closedness
   of `D + 𝓕` above is supplied here.)

From 2 and 3, some point `λ_max(A) ≤ S` lies in the set of 1.2, which is closed upwards, so
`S` lies in it; with 1, `O = S` and the minimum is attained. From 1 and 2, every admissible `A`
has `λ_max(A) ≥ S`, and with 3 the matrix found there has `λ_max(A) = S`, so `E = S` and the
minimum is attained.

### Examples

The edgeless graph and the complete graph (1.1, 1.3), and the pentagon, for which the matrix `B`
of 1.1 and the matrix `A` of 1.3 certify `ϑ(C₅) = √5` exactly.

### Dependencies

1.1 uses Mathlib only. 1.2 and 1.3 use 1.1 through the route 1.4, which uses Tau Ceti's Gram
factorization and Mathlib's eigenvalues and cone separation. No other roadmap is used.

## Layer 2: the sandwich theorem

### 2.1 The sandwich theorem

Prove `indepNum_le_lovaszTheta`, `α(G) ≤ ϑ(G)`, and `lovaszTheta_le_of_colorable_compl`: if `Gᶜ`
is `k`-colourable then `ϑ(G) ≤ k` (Knuth, (4.9), p. 7, with Lemma 2, (2.1), p. 5, and Theorem 12,
p. 15; in his display (∗), p. 2, the same inequality appears for the complement). Together these
are `α(G) ≤ ϑ(G) ≤ χ(Ḡ)`. No hypothesis is needed: on the empty vertex type all three are `0`.

Route. Lower bound: for a nonempty independent set `S`, the matrix `B = 𝟙_S 𝟙_Sᵀ/|S|` is
admissible in 1.1 and has entry sum `|S|`. Upper bound: the colour classes of a `k`-colouring of
`Ḡ` are cliques `Q₁, …, Q_k` of `G` covering the vertices. For an admissible `B` with Gram
vectors `bᵢ`, the vectors in one clique are pairwise orthogonal, so `sₐ = ∑_(i ∈ Qₐ) bᵢ` has
`‖sₐ‖² = ∑_(i ∈ Qₐ) ‖bᵢ‖²`, and by Cauchy–Schwarz
`⟨J, B⟩ = ‖∑ₐ sₐ‖² ≤ k ∑ₐ ‖sₐ‖² = k tr B = k`. (This route is written here; Knuth's passes
through his convex body `TH(G)`.)

**Checks.**
- The pentagon: `α(C₅) = 2 < √5 < 3`, and `C̄₅ ≅ C₅` needs three colours.
- The edgeless graph on `n` vertices: `α = ϑ = χ(Ḡ) = n`; the complete graph: all equal `1`.
- The bound by `χ(G)` instead of `χ(Ḡ)` is false: the edgeless graph on 3 vertices has
  `ϑ = 3 > 1 = χ`.

*Needs:* 1.1; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`; Mathlib
`SimpleGraph.indepNum`, `SimpleGraph.IsIndepSet.card_le_indepNum`, `SimpleGraph.Colorable`,
`SimpleGraph.Coloring`.

### 2.2 The complement inequality

Prove `card_le_lovaszTheta_mul_compl`: for every graph on `n` vertices, `n ≤ ϑ(G) ϑ(Ḡ)` (Knuth,
Lemma 23, (23.2)–(23.4), p. 27, with all weights `1`). On the empty vertex type both sides are
`0`.

Route: take by 1.2 an orthonormal representation `u` of `G` with handle `c` and
`⟨c, uᵢ⟩² ≥ 1/ϑ(G)`, and one `w` of `Ḡ` with handle `d` and `⟨d, wᵢ⟩² ≥ 1/ϑ(Ḡ)`. The tensors
`uᵢ ⊗ wᵢ` are orthonormal (for `i ≠ j` one of the two factors is orthogonal), so
`∑ᵢ ⟨c ⊗ d, uᵢ ⊗ wᵢ⟩² ≤ 1`, and each term is at least `1/(ϑ(G) ϑ(Ḡ))` (Knuth, (11.1), p. 14).

**Checks.**
- Strict inequality: the path `P₃` has `ϑ(P₃) = 2` (by 2.1, `α = 2` and two cliques cover it),
  and its complement, an edge plus an isolated vertex, also has `ϑ = 2`; the product `4` exceeds
  `n = 3`. So the equality of 4.2 needs a hypothesis.

*Needs:* 1.2; Mathlib `EuclideanSpace`, `inner`, `Orthonormal`.

### Examples

The pentagon (2.1) and the path on three vertices (2.2).

### Dependencies

2.1 uses 1.1; 2.2 uses 1.2. Layer 2 uses only Layer 1.

## Layer 3: the strong product and multiplicativity

### 3.1 The strong product and strong powers

Define `strongProd`: for graphs `G` on `V` and `H` on `W`, `strongProd G H` lives on `V × W`,
and distinct pairs `(g, h)` and `(g', h')` are adjacent when `g = g'` or `g ~ g'`, and `h = h'`
or `h ~ h'`; in other words, the reflexive closures multiply (Knuth, §20, (20.2)–(20.3), p. 21).
Define `strongPow`: `strongPow G k` lives on words `Fin k → V`, and distinct words are adjacent
when in every coordinate the letters are equal or adjacent. Mathlib has the box
product `SimpleGraph.boxProd` but no strong product.

API, stated in prose:

- `strongPow G 1` is isomorphic to `G`, `strongPow G 0` has one vertex and no edge, and
  `strongPow G (k + 1)` is isomorphic to `strongProd (strongPow G k) G` (split off the last
  letter).
- Supermultiplicativity of independent sets: if `S` and `T` are independent in `strongPow G a`
  and `strongPow G b`, then the concatenations form an independent set of size `|S| |T|` in
  `strongPow G (a + b)`.

**Checks.**
- `K₂ ⊠ K₂ = K₄`, whereas the box product of two edges is the 4-cycle; more generally
  `Kₘ ⊠ Kₙ = Kₘₙ` and the strong product of edgeless graphs is edgeless (Knuth, p. 21).
- If `G` is `r`-regular and `H` is `s`-regular, `G ⊠ H` is `((r + 1)(s + 1) − 1)`-regular; for
  `C₅ ⊠ C₅` this is `8`.
- `α(C₅ ⊠ C₅) = 5`, attained by `{(i, 2i mod 5)}`, while the box product `C₅ □ C₅` has
  independence number `10`: the strong product is the one that models confusable pairs of words.

*Needs:* Mathlib `SimpleGraph`, `SimpleGraph.Iso`.

### 3.2 Multiplicativity

Prove `lovaszTheta_strongProd`: `ϑ(G ⊠ H) = ϑ(G) ϑ(H)` for all finite graphs `G`, `H`; and
`lovaszTheta_strongPow`: `ϑ(G^⊠k) = ϑ(G)^k` for every `k ≥ 0` (Knuth, §20, Lemma (20.5), p. 22,
stated for product weights; all weights `1` is the case used here). The power statement holds
also at `k = 0` (one vertex, `ϑ = 1`) and on the empty vertex type.

Route. Upper bound: tensor products `uᵍ ⊗ uʰ` of orthonormal representations, with handle
`c ⊗ c'`, form an orthonormal representation of `G ⊠ H`, because distinct nonadjacent pairs are
nonadjacent and distinct in one coordinate, and `⟨c ⊗ c', uᵍ ⊗ uʰ⟩² = ⟨c, uᵍ⟩²⟨c', uʰ⟩²`; so by
1.2 `ϑ(G ⊠ H) ≤ ϑ(G) ϑ(H)` (Knuth, (20.6)–(20.8), p. 22). Lower bound: for maximizers `B`, `B'`
of 1.1, the Kronecker product `B ⊗ B'` is positive semidefinite (Mathlib
`Matrix.PosSemidef.kronecker`), has trace `1` and entry sum `ϑ(G) ϑ(H)`, and vanishes on the edges
of `G ⊠ H`, since an edge has an edge of `G` or of `H` in one coordinate; this is Knuth's
construction for the labelling `b`, written for Gram matrices. If either vertex type is empty both
sides are `0`. The power statement follows by induction on `k` from the isomorphism of 3.1 and
invariance of `ϑ` under isomorphism (1.1).

**Checks.**
- `ϑ(C₅ ⊠ C₅) = 5 = √5 · √5`, which equals `α(C₅ ⊠ C₅)`.
- `ϑ(K₂ ⊠ K̄₂) = 2 = 1 · 2`: the strong product of an edge and two isolated vertices is two
  disjoint edges.

*Needs:* 1.1, 1.2, 3.1; Mathlib `Matrix.PosSemidef.kronecker`, `Matrix.kroneckerMap`.

### Examples

The strong square of the pentagon (3.1, 3.2) and products of complete and edgeless graphs.

### Dependencies

3.1 uses Mathlib only; 3.2 uses 1.1, 1.2 and 3.1. Layer 3 uses only Layer 1.

## Layer 4: cycles, symmetric graphs and regular graphs

### 4.1 Odd cycles

Prove `lovaszTheta_cycleGraph`: for odd `n ≥ 3`, `ϑ(Cₙ) = n cos(π/n)/(1 + cos(π/n))` (Knuth, §22,
(22.11), p. 26). Both hypotheses are needed (Checks).

Route. Upper bound by 1.3: the circulant `A = J + x(P + P⁻¹)` is admissible, its eigenvalues are
`n + 2x` and `2x cos(2πk/n)` for `1 ≤ k < n`, and `x = −n/(2(1 + cos(π/n)))` makes the largest
of them `−2x cos(π/n)`, the claimed value, because the most negative cosine `cos(2πk/n)` for odd
`n` is `−cos(π/n)` (Knuth, (22.14)–(22.17), pp. 26–27). Lower bound by 1.1: with
`φ = π(n − 1)/n` and `a² = cos(π/n) = −cos φ`, the vectors `bᵥ = (a, cos vφ, sin vφ)` are
orthogonal for adjacent `v`, `v ± 1`, and the normalized Gram matrix
`B = (bᵤ · bᵥ)/(n(1 + a²))` has trace `1`; since `nφ` is a multiple of `2π` and `φ` is not,
`∑ᵥ e^(ivφ) = 0`, so the entry sum is `n a²/(1 + a²)`, the claimed value (Knuth, (22.2)–(22.5),
p. 24, where the same vectors are used as a labelling of `C̄ₙ`).

**Checks.**
- `n = 3`: `cos(π/3) = 1/2` gives `1 = ϑ(K₃)`. `n = 5`: `cos(π/5) = (1 + √5)/4` gives
  `5(1 + √5)/(5 + √5) = √5`. `n = 7`: `7 cos(π/7)/(1 + cos(π/7)) ≈ 3.3177`, between `α(C₇) = 3`
  and `χ(C̄₇) = 4`.
- Oddness is needed: for `n = 4` the formula gives `4 cos(π/4)/(1 + cos(π/4)) ≈ 1.657`, while
  `C₄` is bipartite and `ϑ(C₄) = 2` by 2.1.
- `n ≥ 3` is needed: `cycleGraph 1` is a single vertex with `ϑ = 1`, while `1 + cos π = 0` and the
  formula evaluates to `0` under division by zero.

*Needs:* 1.1, 1.3; Mathlib `SimpleGraph.cycleGraph`, `SimpleGraph.cycleGraph_adj`,
`Real.cos_pi_div_five` (for the Check).

### 4.2 Vertex-transitive graphs

Prove `lovaszTheta_mul_compl_of_forall_exists_iso`: if for all vertices `u`, `v` some automorphism
of `G` sends `u` to `v`, then `ϑ(G) ϑ(Ḡ) = n` (Knuth, §25, Theorem 25, pp. 29–30).

Route. The inequality `≥` is 2.2. For `≤` (with `n ≥ 1`), average a maximizer `B` of 1.1 over
the automorphism group: each conjugate `PᵀBP` is admissible with the same entry sum, so the
average `B̄` is a maximizer fixed by every automorphism. Transitivity gives `B̄ᵢᵢ = 1/n` and makes
all row sums equal, hence each row sum is `ϑ(G)/n`. With Gram vectors `bᵢ` of `B̄` and
`s = ∑ bᵢ`, `‖s‖² = ϑ(G)`, the unit vectors `wᵢ = √n bᵢ` form an orthonormal representation of
`Ḡ` (adjacent vertices of `G` have orthogonal `bᵢ`), and the handle `s/‖s‖` gives
`⟨s/‖s‖, wᵢ⟩² = n (ϑ(G)/n)²/ϑ(G) = ϑ(G)/n`; by 1.2, `ϑ(Ḡ) ≤ n/ϑ(G)`. (Knuth's proof reaches the
same labelling through the equality case of Cauchy–Schwarz in Theorem 12; the row-sum step is
written here.)

**Checks.**
- `C₅`: `√5 · √5 = 5`. `C₇`: by 4.1 and Knuth's (22.12), `ϑ(C̄₇) = (1 + cos(π/7))/cos(π/7)`, and
  the product is exactly `7`.
- The Petersen graph (2-subsets of a 5-set, adjacent when disjoint): `ϑ = 4` (4.3) and
  `ϑ(complement) = 10/4`.
- The hypothesis is needed: the path `P₃` gives `4 > 3` (2.2).

*Needs:* 1.1, 1.2, 2.2; Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self`; Mathlib
`SimpleGraph.Iso`, `Matrix.submatrix`.

### 4.3 The ratio bound for ϑ

Copy `adjEigenvalues` and `smallestEigenvalue` verbatim from SpectralGraphBounds 1.1. Prove
`lovaszTheta_mul_le`: for a `d`-regular graph on a nonempty vertex type with smallest adjacency
eigenvalue `λₙ`, `ϑ(G) (d − λₙ) ≤ n (−λₙ)`; for `d ≥ 1` this reads `ϑ(G) ≤ n(−λₙ)/(d − λₙ)`
(Knuth, §24, Lemma 24, (24.2), pp. 27–28, written with `Λ(B) = d` and `Λ(−B) = −λₙ`).

Route: if `d = 0` both sides vanish. Otherwise `λₙ < 0 < d` and `A = J + xB` with
`x = −n/(d − λₙ) < 0` is admissible in 1.3. For `y = c𝟙 + z` with `z ⊥ 𝟙`, regularity gives
`B𝟙 = d𝟙` and `Bz ⊥ 𝟙`, so `yᵀAy = c² n (n + xd) + x zᵀBz ≤ x λₙ (c² n + ‖z‖²)`, using
`n + xd = xλₙ` and the Rayleigh bound `zᵀBz ≥ λₙ ‖z‖²` of SpectralGraphBounds 1.1. Hence
`λ_max(A) ≤ n(−λₙ)/(d − λₙ)`.

**Checks.**
- Petersen graph: 3-regular, eigenvalues `3`, `1`, `−2` (its adjacency matrix satisfies
  `A² + A − 2I = J`), so `ϑ ≤ 10 · 2/5 = 4`; the four 2-subsets containing a fixed point pairwise
  intersect, so `α ≥ 4`, and `ϑ = α = 4`.
- Pentagon: `λₙ = 2 cos(4π/5) = −(1 + √5)/2`, and the bound `5(1 + √5)/(5 + √5) = √5` is
  attained.
- Regularity is needed: the star `K₁,₃` with `d = 3`, its maximum degree, has `ϑ = 3` (by 2.1)
  and `λₙ = −√3`, and `3 (3 + √3) ≈ 14.20 > 4√3 ≈ 6.93`.

*Needs:* 1.3; SpectralGraphBounds 1.1 (the definitions `adjEigenvalues` and `smallestEigenvalue`,
the Rayleigh bound, and the sign facts: all eigenvalues are `0` exactly when there is no edge,
otherwise `λₙ < 0`); Mathlib `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.adjMatrix`,
`SimpleGraph.adjMatrix_mulVec_const_apply`, `Matrix.IsHermitian.mulVec_eigenvectorBasis` (an
eigenvector of `A` for its largest eigenvalue turns the quadratic-form bound into a bound on
`λ_max(A)`).

### Examples

Odd cycles (4.1), the Petersen graph (4.2, 4.3), and the path on three vertices as the
non-example for 4.2.

### Dependencies

4.1 uses 1.1 and 1.3; 4.2 uses 1.1, 1.2 and 2.2; 4.3 uses 1.3 and SpectralGraphBounds 1.1.
Layer 4 uses Layers 1 and 2.

## Layer 5: the Shannon capacity

### 5.1 The Shannon capacity as a limit

Define `shannonCapacity`: `shannonCapacity G` is the supremum over `k ≥ 1` of
`α(G^⊠k)^(1/k)`, with `G^⊠k = strongPow G k`. Prove `tendsto_shannonCapacity`: the sequence
`α(G^⊠k)^(1/k)` converges to `Θ(G)` as `k → ∞`. The supremum is finite since `α(G^⊠k) ≤ nᵏ`.
(Shannon's zero-error capacity, attributed in prose; the limit statement is proved here.)

Route: on a nonempty vertex type `α(G^⊠k) ≥ 1`, and by the supermultiplicativity of 3.1 the
sequence `−log α(G^⊠k)` is subadditive and `−log α(G^⊠k)/k ≥ −log n`; Fekete's lemma (Mathlib
`Subadditive.tendsto_lim`) gives convergence of `−log α(G^⊠k)/k` to its infimum over `k ≥ 1`, and
exponentiating gives the limit `Θ(G)`. On the empty vertex type every term with `k ≥ 1` is `0`.

**Checks.**
- The edgeless graph on `n` vertices has `α(G^⊠k) = nᵏ` and `Θ = n`; the complete graph has
  `Θ = 1`.
- `k = 0` must be excluded from the supremum: `strongPow G 0` has one vertex, and with Lean's
  `x^(1/0) = x^0 = 1` the term would be `1`, which would make `Θ = 1` on the empty vertex type,
  above `ϑ = 0`.

*Needs:* 3.1; Mathlib `Subadditive`, `Subadditive.tendsto_lim`, `Real.rpow`, `Real.log`.

### 5.2 Lovász's bound

Prove `indepNum_le_shannonCapacity_le_lovaszTheta`: `α(G) ≤ Θ(G) ≤ ϑ(G)`. (Lovász's theorem,
attributed in prose; proved here.)

Route: the term `k = 1` is `α(G)`. For the upper bound, `α(G^⊠k) ≤ ϑ(G^⊠k) = ϑ(G)ᵏ` by 2.1 and
3.2, so every term is at most `ϑ(G)`.

**Checks.**
- The pentagon: `α = 2 ≤ Θ ≤ √5` before 5.3. For every graph on at most five vertices other than
  `C₅`, `α = χ(Ḡ)`, so all three numbers agree by 2.1.

*Needs:* 2.1, 3.1, 3.2, 5.1; Mathlib `le_ciSup`, `ciSup_le`.

### 5.3 The capacity of the pentagon

Prove `shannonCapacity_cycleGraph_five`: `Θ(C₅) = √5`. (Lovász's theorem; proved here from the
statements above.)

Route: `{(i, 2i mod 5)}` is an independent set of five vertices in `C₅ ⊠ C₅` (two of its pairs
differ by `(j, 2j)` with `j ≠ 0`, and `j` and `2j` are not both in `{0, ±1}` modulo 5), so
`Θ(C₅) ≥ 5^(1/2)`; and `Θ(C₅) ≤ ϑ(C₅) = √5` by 5.2 and 4.1.

**Checks.**
- `α(C₅ ⊠ C₅) = 5` exactly, so the term `k = 2` already reaches `√5`; `α(C₅^⊠3) = 10`, and
  `10^(1/3) ≈ 2.154 < √5`.

*Needs:* 3.1, 4.1, 5.1, 5.2; Mathlib `SimpleGraph.IsIndepSet.card_le_indepNum`, `le_ciSup`,
`Real.cos_pi_div_five`.

### Examples

The pentagon, whose capacity `√5` lies strictly between `α = 2` and `5/2`, the largest value of
`x₀ + ⋯ + x₄` over nonnegative `x` with `xᵢ + xᵢ₊₁ ≤ 1` for every edge (Knuth, §4, p. 7).

### Dependencies

5.1 uses 3.1; 5.2 uses 2.1, 3.1, 3.2 and 5.1; 5.3 uses 3.1, 4.1, 5.1 and 5.2. Layer 5 uses Layers
2, 3 and 4.

## Scope and ownership

This roadmap owns the Lovász theta function in its three forms with the equality of the forms and
attainment of each extremum, the sandwich theorem, the complement inequality and its equality
for vertex-transitive graphs, the strong product and strong powers, multiplicativity, the value
on odd cycles, the ratio bound for `ϑ` of regular graphs, the Shannon capacity as a limit,
Lovász's bound `α ≤ Θ ≤ ϑ`, and `Θ(C₅) = √5`.

Already in the libraries and therefore not targets: Mathlib's independence and clique numbers,
colourings and the chromatic number, cycle graphs, the box product, positive semidefinite
matrices with Gram matrices and Kronecker products, sorted eigenvalues of Hermitian matrices, the
separation theorem and bipolar theorem for closed convex cones (`ProperCone.innerDual_innerDual`),
and Fekete's lemma; Tau Ceti's Gram factorization of a positive semidefinite matrix.

Left to other roadmaps:

- SpectralGraphBounds 1.1 defines the sorted adjacency eigenvalues and states their Rayleigh
  bounds; 4.3 copies its two definitions verbatim and uses the bound. SpectralGraphBounds 3.2
  states Hoffman's ratio bound `α (d − λₙ) ≤ n (−λₙ)` with its equality clause. 4.3 above is a
  different statement, about `ϑ`; with 2.1 and `d − λₙ ≥ 0` it implies the inequality of
  SpectralGraphBounds 3.2 but not its equality clause, and SpectralGraphBounds does not state it.
- PerfectAndChordalGraphs 4.2 states the perfect graph theorem. For a perfect graph `G` it gives
  `χ(Ḡ) = ω(Ḡ) = α(G)`, and then `ϑ(G) = α(G)` follows from 2.1 at once; that corollary is not
  stated here, and this roadmap does not depend on that one.
- TopologicalCombinatorics 3.1 defines Kneser graphs. The value of `ϑ` on Kneser graphs and the
  Erdős–Ko–Rado theorem through `ϑ` are not treated here; the Petersen graph appears only in
  Checks, described directly.
- ConvexAnalysisAndDuality 5.4 states conic duality for a closed convex cone under a Slater
  condition, with semidefinite programs as an instance, and QuantumOptimization Layer 2 treats
  the semidefinite relaxation of Max-Cut. Neither is used or restated: 1.4 proves only the
  equality of the three forms of `ϑ`, by Knuth's direct argument from Mathlib's separation
  theorem, and this roadmap depends on neither.

Outside the scope: weighted theta functions `ϑ(G, w)` and the convex body `TH(G)` (the unweighted
statements above do not need them), the variants `ϑ'` and `ϑ⁺` of Schrijver and Szegedy, the
value of `ϑ` on Kneser graphs and on perfect graphs, Haemers' rank bound and other bounds on the
Shannon capacity, the capacity of odd cycles of length at least 7, and every procedure for
computing `ϑ`.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.indepNum` (supremum in `ℕ` of
  the sizes of independent sets), `SimpleGraph.IsIndepSet`,
  `SimpleGraph.IsIndepSet.card_le_indepNum` (on a finite type, an independent finset has at most
  `indepNum` elements).
- `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`: `SimpleGraph.Colorable`,
  `SimpleGraph.Coloring`.
- `Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`: `SimpleGraph.cycleGraph` (on `Fin n`),
  `SimpleGraph.cycleGraph_adj` (on `Fin (n + 2)`, `u ~ v` iff `u − v = 1` or `v − u = 1`).
- `Mathlib/Combinatorics/SimpleGraph/Prod.lean`: `SimpleGraph.boxProd` (named only to
  distinguish it from the strong product). `Mathlib/Combinatorics/SimpleGraph/Maps.lean`:
  `SimpleGraph.Iso`. `Mathlib/Combinatorics/SimpleGraph/Finite.lean`:
  `SimpleGraph.IsRegularOfDegree`. `Mathlib/Combinatorics/SimpleGraph/AdjMatrix.lean`:
  `SimpleGraph.adjMatrix`, `SimpleGraph.adjMatrix_mulVec_const_apply`.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean` and `Mathlib/Analysis/Matrix/PosDef.lean`:
  `Matrix.PosSemidef`, `Matrix.PosSemidef.trace_nonneg`.
  `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`: `Matrix.gram`, `Matrix.posSemidef_gram`
  (a Gram matrix is positive semidefinite). `Mathlib/Analysis/Matrix/Order.lean`:
  `Matrix.PosSemidef.kronecker` (the Kronecker product of positive semidefinite matrices is
  positive semidefinite).
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvalues₀` (for
  `[DecidableEq n]`, sorted eigenvalues on `Fin (Fintype.card n)`),
  `Matrix.IsHermitian.eigenvalues₀_antitone`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
  `Matrix.IsHermitian.spectral_theorem`, `Matrix.IsHermitian.mulVec_eigenvectorBasis`.
- `Mathlib/Analysis/Convex/Cone/InnerDual.lean`: `ProperCone.hyperplane_separation'` (in a
  complete real inner product space, a point outside a closed convex cone is separated from it by
  a vector `y` with `0 ≤ ⟨x, y⟩` on the cone and `⟨x₀, y⟩ < 0`).
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace`,
  `Orthonormal.exists_orthonormalBasis_extension`.
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a continuous function on a
  nonempty compact set attains its maximum).
- `Mathlib/Analysis/Subadditive.lean`: `Subadditive`, `Subadditive.tendsto_lim` (for subadditive
  `u : ℕ → ℝ` with `u n / n` bounded below, `u n / n` converges).
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/`: `Real.cos_pi_div_five`
  (`cos(π/5) = (1 + √5)/4`).

### From Tau Ceti

- `TauCeti/Analysis/Matrix/GramFactorization.lean`:
  `Matrix.posSemidef_iff_eq_conjTranspose_mul_self` (a square matrix is positive semidefinite
  exactly when it is `Aᴴ A` for a square `A`); used to write admissible matrices as Gram
  matrices in 1.4, 2.1 and 4.2.

### From TauCetiRoadmap.SpectralGraphBounds

- Section 1.1: the definitions `adjEigenvalues` (the eigenvalues `eigenvalues₀` of
  `G.adjMatrix ℝ`, nonincreasing) and `smallestEigenvalue` (the last of them, on a nonempty
  vertex type), copied verbatim into `Suggested.lean`; the Rayleigh bound `xᵀ A x ≥ λₙ ‖x‖²`
  for the adjacency matrix `A`; and the sign facts (all eigenvalues are `0` exactly when there
  is no edge, otherwise `λₙ < 0`). Used in 4.3.

## References

- Donald E. Knuth, The sandwich theorem, *Electronic Journal of Combinatorics* 1 (1994), #A1;
  arXiv:math/9312214 (notes last revised 6 December 1993), read on arXiv. Locators are to its
  numbered sections, results and equations and to the journal page numbers printed in that file:
  (∗) and the caution on conventions, p. 2; Lemma 1, (1.1), p. 5; Lemma 2, (2.1), p. 5; (4.3),
  (4.9), p. 7; (5.2), p. 8; (6.1)–(6.6) and Lemma 6, pp. 8–9; Lemma 7, (7.1)–(7.3), p. 10; §8,
  F1–F8, pp. 11–12; §9, F9, pp. 12–13; Lemma 10, (10.2)–(10.4), pp. 13–14; Lemma 11,
  (11.1)–(11.3), p. 14; Theorem 12, p. 15; §20, (20.2)–(20.8), pp. 21–22; §22, (22.2)–(22.17),
  pp. 24–27; Lemma 23, (23.2)–(23.4), p. 27; Lemma 24, (24.2), pp. 27–28; Theorem 25,
  pp. 29–30.
- Lovász's paper on the Shannon capacity of a graph (reference 12 of Knuth's notes, to which he
  credits the product construction of his §20) and Shannon's paper on the zero-error capacity of a
  channel (his reference 18) are attributed in prose only; neither was opened, and no locator into
  them is given.
