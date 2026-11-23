# Roadmap: asymptotic spectra

**Summary.** Strassen's theory of asymptotic spectra compares large powers of objects that can be
added and multiplied, such as graphs and tensors. The setting is a set with `0`, `1`, addition and
multiplication and a preorder `≤` for which the commutative-semiring laws hold up to the
equivalence `a ≤ b ≤ a`, which is compatible with the operations, orders the natural numbers as
usual, and is Archimedean: every `a` lies below `r b` for some natural number `r` once `b` is not
below `0`. Such a preorder is a Strassen preorder. Its asymptotic preorder puts `a ≲ b` when
`aⁿ ≤ 2^(o(n)) bⁿ`, and its asymptotic spectrum is the set of maps to the reals that are additive,
multiplicative, monotone and equal to `1` at `1`. This roadmap proves the duality theorem and works
out the two classical instances.

The headline theorems are these.

- *Duality (Strassen).* For a Strassen preorder, `a ≲ b` if and only if `φ(a) ≤ φ(b)` for every
  point `φ` of the asymptotic spectrum. The spectrum is compact; for `a ≥ 1` the asymptotic
  rank `lim R(aⁿ)^(1/n)` is the largest value of `φ(a)`, and for `a ≥ 1` with some power at
  least `2`, or with `φ(a) = 1` for some `φ`, the asymptotic subrank is the least value.
- *Graphs (Zuiddam).* Finite graphs ordered by homomorphisms of complements form a Strassen
  preorder; the Shannon capacity of every graph is the least value at it of a point of the
  spectrum. The Lovász theta function and the fractional clique cover number are points of the
  spectrum: in particular `ϑ(G ⊔ H) = ϑ(G) + ϑ(H)` and `ϑ(G) ≤ ϑ(H)` when the complement of `G`
  maps to the complement of `H`. The clique cover numbers of the strong powers of `G` grow like
  the powers of its fractional clique cover number (McEliece and Posner), which is the largest
  value at `G` of a spectral point.
- *Tensors (Strassen).* With at least two parties, restriction of tensors over a field is a
  Strassen preorder whose rank is the tensor rank; the flattening ranks at proper nonempty sets
  of parties are spectral points, and for matrices the rank is the only one. The `2 × 2` matrix
  multiplication tensor has tensor rank at most `7` and asymptotic rank `2^ω`, where the exponent
  `ω` of matrix multiplication, defined by `R(⟨n, n, n⟩) = O(n^τ)`, satisfies `2 ≤ ω ≤ log₂ 7`.

For graphs the roadmap builds on LovaszThetaFunction (the theta function, the strong product, the
Shannon capacity and multiplicativity), on ConvexAnalysisAndDuality (linear-programming duality,
for the fractional clique cover number) and on ApproximationGuarantees (fractional covers and the
greedy bound, for McEliece and Posner's theorem). The tensor layer rests on Mathlib's matrix rank
and Tau Ceti's rank factorization of matrices.

Layer 1 proves the abstract theory, Layers 2 and 3 the graph and tensor instances; both use
Layer 1 and not each other.

## Conventions

- **Carrier.** `R` is a type with `[Zero R] [One R] [Add R] [Mul R]` and no laws; a preorder is a
  relation `le : R → R → Prop`, written `≤`, and `a ≈ b` means `a ≤ b ∧ b ≤ a`. The natural
  number `n` in `R` is Mathlib's `Nat.unaryCast n`, the element `((0 + 1) + ⋯) + 1`, written `n`;
  powers are Mathlib's `npowRec n a` (`a⁰ = 1`, `aⁿ⁺¹ = aⁿ * a`), written `aⁿ`. In an honest
  commutative semiring `Nat.unaryCast n` is the cast `(n : R)` and `npowRec n a = a ^ n`; for
  graphs and tensors they are the nested disjoint unions and products, equivalent to the usual
  objects. Laws only up to `≈` is what lets graphs and tensors, which form a semiring only on
  isomorphism classes, be instances without quotients.
- **Spectral points** are maps `R → ℝ`. From additivity and monotonicity, `φ 0 = 0`, `φ a ≥ 0`,
  `φ n = n` and `φ` is constant on `≈`-classes (route of 1.2). The spectrum carries the topology
  induced from the product topology of `R → ℝ`.
- **Junk values.** The rank is an `sInf` and the subrank an `sSup` of sets of natural numbers
  that are nonempty and bounded for a Strassen preorder (route of 1.3). The asymptotic rank and
  subrank use the powers `n + 1` only: a term for `n = 0` would be `1` (the exponent `1/0` is `0`
  in Lean), which would cap the infimum at `1` (wrong for `a = 2`) and lift the supremum to `1`
  (wrong for `a ≈ 0`).
- **Graphs.** `FinGraph` bundles a vertex type in `Type` with `Fintype` and `DecidableEq` and a
  `SimpleGraph`. Zero and one are the edgeless graphs on `Fin 0` and `Fin 1`, addition is Mathlib's
  disjoint union `⊕g` and multiplication the strong product `strongProd`, copied verbatim from
  LovaszThetaFunction 3.1 with `strongPow` and the Shannon capacity `shannonCapacity` of its 5.1
  and the theta function `lovaszTheta` of its 1.1. Mathlib has no strong product; its
  `SimpleGraph.boxProd` is the Cartesian product. The preorder `cohomLE` puts `G ≤ H` when there
  is a graph homomorphism from the complement of `G` to the complement of `H`: a map of vertices
  sending distinct nonadjacent vertices to distinct nonadjacent vertices. The natural number `n`
  is equivalent to the edgeless graph `K̄ₙ`. The clique cover number of `G` is the least `k` with
  `Gᶜ.Colorable k`, and `α(G)` is `SimpleGraph.indepNum`. The convention for `ϑ` is that of
  LovaszThetaFunction, in which `α(G) ≤ ϑ(G)` and `ϑ(G)` is at most the clique cover number.
- **Tensors.** `CoordTensor F ι` over a field `F`, with a finite type `ι` of parties, has a
  dimension `dim p : ℕ` for each party and coordinates `coeff : (∀ p, Fin (dim p)) → F`, indexed
  as in Mathlib's holors; a dimension may be `0`, and the array is then empty. Zero has every
  dimension `0`; one is the unit tensor `⟨1⟩`, every dimension `1` and coordinate `1`. Addition is
  the direct sum: dimensions add, an index `i < s.dim p` of `Fin (s.dim p + t.dim p)` stands for
  `i` in `s` and `s.dim p + j` for `j` in `t`, and the coordinates are those of `s` on tuples lying
  in `s`, those of `t` on tuples lying in `t`, and `0` on mixed tuples (with no party, the sum of
  the two scalars). Multiplication is the Kronecker product: dimensions multiply, and an index of
  `Fin (m * n)` is read as the pair `(Fin.divNat, Fin.modNat)`, the inverse of `finProdFinEquiv`,
  in the order of Mathlib's `Matrix.kronecker`. The unit tensor `⟨n⟩` has every dimension `n` and
  coordinate `1` exactly on the diagonal tuples `(i, …, i)`; with a party present,
  `Nat.unaryCast n` has dimension `n` at every party and the coordinates of `⟨n⟩`, so it is `⟨n⟩`
  up to the identification `finCongr` of the index types (induction on `n`: the last index `n` of
  `Fin (n + 1)` is the only one not below `n`), and with no party it is the scalar `n · 1`. Restriction `restrictLE`
  puts `s ≤ t` when `s.coeff` is the image of `t.coeff` under the Kronecker product of a family of
  matrices `A p : Matrix (Fin (s.dim p)) (Fin (t.dim p)) F`, the matrix with entries
  `∏ p, A p (x p) (y p)`. Every statement about restriction as a Strassen preorder assumes at
  least two parties.
- **Coordinate arrays and Mathlib.** For two parties a tensor is a matrix, the direct sum is the
  block-diagonal `Matrix.fromBlocks A 0 0 B` up to reindexing by `finSumFinEquiv`, the Kronecker
  product is `Matrix.kronecker` up to `finProdFinEquiv`, and restriction is `A = P B Qᵀ`. When all
  the matrices `A p` are one matrix, their Kronecker product is Tau Ceti's
  `Matrix.kroneckerPower`. Coordinate-free, the space of tensors of format `dim` is Mathlib's
  `PiTensorProduct F (fun p ↦ Fin (dim p) → F)`, with basis `Basis.piTensorProduct`, and
  restriction is `PiTensorProduct.map` of the maps `Matrix.toLin' (A p)`. Mathlib's holors
  `Holor F ds` (`Mathlib/Data/Holor.lean`) are coordinate arrays of the same kind, with parties
  `Fin ds.length` and dimensions the entries of `ds`; `CoordTensor.ofHolor` reads them as tensors,
  and Mathlib's CP rank `Holor.cprank` is related to `tensorRank` in 3.1. Holors are not the
  carrier: their product `Holor.mul` is the outer product, which appends the lists of dimensions
  and so adds parties, while the Strassen preorder needs the Kronecker product on a fixed set of
  parties; and the format of a holor is part of its type, while tensors of different formats must
  be added and compared. Coordinates are kept because flattening ranks are ranks of matrices of
  coordinates.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: Strassen preorders and the duality theorem

### 1.1 Strassen preorders and the asymptotic preorder

Define `IsStrassenPreorder le`, a structure of propositions with the fields: `le` is reflexive
and transitive; `a + b ≤ b + a`, `a * b ≤ b * a`; `(a + b) + c ≈ a + (b + c)`, `0 + a ≈ a`,
`(a * b) * c ≈ a * (b * c)`, `1 * a ≈ a`, `0 * a ≈ 0`, `a * (b + c) ≈ a * b + a * c`; `a ≤ b`
implies `a + c ≤ b + c` and `a * c ≤ b * c`; `m ≤ n` in `R` if and only if `m ≤ n` in `ℕ`; and
for all `a`, `b` with `b` not below `0` there is `r : ℕ` with `a ≤ r * b`. This is Zuiddam's
definition (thesis, §2.3, p. 20) with the identities read up to `≈`; Wigderson and Zuiddam use a
variant without zero in which every element is at least `1` (survey, Def. 2.4, pp. 19–20).

Define `asympLE le a b`: there is `f : ℕ → ℕ` with `f n / n → 0` and `aⁿ ≤ 2^(f n) * bⁿ` for
every `n` (survey, Def. 3.1, p. 32; thesis, Def. 2.1, p. 21, in the equivalent form with factors
`x_N` and `inf x_N^(1/N) = 1`).

Prove `isStrassenPreorder_le_and_asymptoticSpectrum_eq`: if `S` is a commutative semiring with a
partial order making it a strictly ordered semiring (`IsStrictOrderedRing S`), Archimedean
(Mathlib's `Archimedean S`) and with every element nonnegative, then `≤` is a Strassen preorder,
and its asymptotic spectrum (1.2) is the set of order ring homomorphisms `S →+*o ℝ`.
(Proved here.)

Prove `isStrassenPreorder_asympLE`: for a Strassen preorder `≤`, the asymptotic preorder `≲` is a
Strassen preorder containing `≤`, and it is closed: the asymptotic preorder of `≲` is `≲`
(thesis, Lemma 2.3, pp. 21–22, and Lemma 2.4 (iii), pp. 22–23; survey, Lemma 3.3 and Lemma 3.5,
p. 33).

Prove `asympLE_cancel`: for a Strassen preorder, (i) `a + c ≲ b + c` implies `a ≲ b`; (ii)
`a * c ≲ b * c` implies `a ≲ b` when `c` is not below `0`; (iii) if `n * a ≲ n * b + c` for
every natural number `n`, then `a ≲ b` (thesis, Lemma 2.4 (i), (ii), (iv), pp. 22–23, stated
there with `≤` in the hypotheses; applied to the Strassen preorder `≲`, which is its own
asymptotic preorder, they give the forms here).

Route. Write `≤` for `le` and `≲` for `asympLE le`.

-  *Basic facts.* From commutativity, right compatibility and transitivity, `a ≤ b` and `c ≤ d`
  give `a + c ≤ b + d` and `a * c ≤ b * d`; `≈` is an equivalence compatible with `+` and `*`; the
  laws `a + 0 ≈ a`, `a * 1 ≈ a`, `a * 0 ≈ 0` and right distributivity follow. `0 ≤ 1` from the
  natural numbers, hence `0 ≈ 0 * a ≤ 1 * a ≈ a`, and `a ≈ a + 0 ≤ a + b` (thesis, p. 20). By
  induction, the casts of `m + n` and `mn` are equivalent to `m + n` and `m * n` in `R`,
  `aᵐ⁺ⁿ ≈ aᵐ * aⁿ`, `(ab)ⁿ ≈ aⁿ * bⁿ`, and the binomial expansion of `(a + b)ᴺ` holds up to `≈`.
  Since `0 ≤ b`, `b ≤ 0` is the same as `b ≈ 0`.
- *Nonzero elements.* If `b` is not below `0`, the Archimedean field with `a = 1` gives
  `1 ≤ r * b`; so `1 ≤ rⁿ * bⁿ`, and `bⁿ` is not below `0` for any `n` (else `1 ≤ 0`).
-  *Lemma A (multiples of a period suffice).* If for every `ε > 0` there are `N ≥ 1` and `k ≤ εN`
  with `aᴺ ≤ 2ᵏ * bᴺ`, then `a ≲ b`. Suppose first `b` is not below `0`. Choose `c ≥ 1` with
  `a ≤ c * b`, and for `ε = 1/j` the pair `(N_j, k_j)`. Writing `n = q N_j + s` with `s < N_j`,
  `aⁿ ≈ (a^(N_j))^q * aˢ ≤ 2^(q k_j) cˢ bⁿ ≤ 2^(q k_j + N_j ⌈log₂ c⌉) bⁿ`. Let `f n` be the least
  of these exponents over `1 ≤ j ≤ n` (and `f 0 = 0`); then `f n / n ≤ 1/j + N_j ⌈log₂ c⌉ / n` for
  `n ≥ j`, so `f n / n → 0`. If `b ≈ 0`, the hypothesis with any `N` gives `aᴺ ≈ 0`, hence `a ≈ 0`
  by the previous item, and `a ≲ b` with `f = 0`, since `aⁿ ≈ 0` for `n ≥ 1` and `a⁰ = 1 ≈ 1 * b⁰`.
- *`≲` is a Strassen preorder containing `≤`* (thesis, Lemma 2.3). `a ≤ b` gives `aⁿ ≤ bⁿ`, so
  `a ≲ b` with `f = 0`; this gives reflexivity and the identities. Transitivity: add the two
  functions. Products: `(ac)ⁿ ≈ aⁿcⁿ ≤ 2^(f n + g n) bⁿdⁿ`. Sums: replace `f`, `g` by their
  running maxima, still `o(n)`, and expand `(a + c)ᴺ` binomially, bounding each term
  `aᵐcᴺ⁻ᵐ ≤ 2^(f N + g N) bᵐdᴺ⁻ᵐ`. Natural numbers: `m ≲ n` gives `mᴺ ≤ 2^(f N) nᴺ` in `ℕ`, so
  `m ≤ 2^(f N / N) n` for all `N`, hence `m ≤ n`. The Archimedean field is inherited from `≤`.
- *Closedness* (thesis, Lemma 2.4 (iii)). If `aᴺ ≲ 2^(f N) bᴺ` for all `N`, pick for each `N` a
  witness `g_N` and `M_N ≥ 1` with `g_N(M_N) ≤ M_N`; then
  `a^(N M_N) ≤ 2^(M_N f N + g_N(M_N)) b^(N M_N)`, the exponent is at most `(f N/N + 1/N) N M_N`,
  and Lemma A gives `a ≲ b`.
-  *Cancellation* (thesis, Lemma 2.4). Write the steps for a Strassen preorder `⊑` with `⊑` closed
  (here `⊑` is `≲`). (ii): from `ac ⊑ bc`, induction gives `aᴺc ⊑ bᴺc`; with `1 ⊑ mc ⊑ r`
  (Archimedean, `c` not below `0`), `aᴺ ⊑ aᴺmc ⊑ bᴺmc ⊑ rm bᴺ`, so `a ⊑ b` by closedness. (iv),
  which is (iii) here: if `b ≈ 0`, the hypothesis reads `n a ⊑ c` for every `n`; were `a` not below
  `0`, then `1 ⊑ m a` and `c ⊑ r` for some `m`, `r` would give `n ⊑ m n a ⊑ m c ⊑ m r` for every
  `n`, against the natural numbers; so `a ≈ 0 ⊑ b`. Otherwise take `k` with `c ⊑ k b`; then
  `kn a ⊑ kn b + k b = k b (n + 1)`, and (ii) gives `n a ⊑ (n + 1) b`; chaining, `aᴺ ⊑ (N + 1) bᴺ`,
  and `(N + 1)^(1/N) → 1` gives `a ⊑ b` by closedness. (i): induction gives `q a + c ⊑ q b + c` for
  all `q`, and (iii) applies. For the hypothesis "`c` not below `0`" with `⊑ = ≲`: `c ≲ 0` gives
  `c ≤ 2^(f 1) * 0 ≈ 0`, so `c` not below `0` for `≤` is the same as for `≲`.
- *Ordered semirings.* In `S`, the identities are equalities; compatibility with `*` uses
  `0 ≤ c`; `Nat.unaryCast n = (n : S)` by induction, and `Nat.cast_le` holds in a strictly
  ordered semiring; for `b` not below `0`, `0 < b`, and Mathlib's `Archimedean` gives `n` with
  `a ≤ n • b = n * b`. A point of the spectrum has `φ 0 = 0` (route of 1.2), so it is a semiring
  homomorphism `S → ℝ`, monotone; conversely an order ring homomorphism satisfies every clause.

**Checks.**
- `ℕ` with its order satisfies every field (a proved example in `Suggested.lean`), and so do
  `ℚ≥0` and `ℝ≥0`; the spectrum of `ℕ` is the single map `n ↦ n`.
- Positive pairs: the set of `(x, y) ∈ ℚ≥0²` with `x = 0 ↔ y = 0`, with coordinatewise operations
  and order, is a Strassen preorder (compatibility and the Archimedean field checked on 17³ sampled
  triples); the two coordinate projections are spectral points. Without the condition
  `x = 0 ↔ y = 0`, `(1, 0)` is not below `0` but `(0, 1) ≤ r * (1, 0)` fails for every `r`.

*Needs:* Mathlib `Nat.unaryCast`, `npowRec`, `IsStrictOrderedRing`, `Archimedean`,
`OrderRingHom`, `Nat.cast_le`.

### 1.2 The duality theorem

Define `asymptoticSpectrum le`, the set of `φ : R → ℝ` with `φ (a + b) = φ a + φ b`,
`φ (a * b) = φ a * φ b`, `φ 1 = 1`, and `φ a ≤ φ b` whenever `a ≤ b` (thesis, Def. 2.8, p. 25,
with values in `ℝ≥0`; nonnegativity follows here).

Prove `asympLE_iff_forall_mem_asymptoticSpectrum`: for a Strassen preorder and all `a`, `b`,
`a ≲ b` if and only if `φ a ≤ φ b` for every `φ` in the asymptotic spectrum (Strassen; thesis,
Thm. 2.12, p. 26, with Lemmas 2.5–2.11, pp. 23–26; survey, Thm. 3.22, p. 39). In particular the
spectrum is nonempty, since `2 ≲ 1` fails. The proof uses Zorn's lemma only.

Route.

- *Values of spectral points.* `φ 0 = φ (0 + 0) = 2 φ 0` (the first equality because `0 + 0 ≈ 0`
  and `φ` is monotone), so `φ 0 = 0`; `0 ≤ a` gives `φ a ≥ 0`; `φ n = n` by additivity;
  `φ (aⁿ) = (φ a)ⁿ`.
- *Easy direction.* If `aⁿ ≤ 2^(f n) bⁿ`, then `(φ a)ⁿ ≤ 2^(f n) (φ b)ⁿ`, so
  `φ a ≤ 2^(f n / n) φ b` for `n ≥ 1`, and `φ a ≤ φ b` in the limit.
- *Lemma B (one-step extension; thesis, Lemma 2.5).* Let `⊑` be a closed Strassen preorder and
  `a₂ ⋢ a₁`. Then `x ⊑' y :⟺ ∃ s, x + s a₂ ⊑ y + s a₁` is a Strassen preorder containing `⊑` with
  `a₁ ⊑' a₂`. Preorder: `s = 0`, and add the two witnesses. Compatibility: add, or multiply the
  witness by `y`. Natural numbers: if `n ⊑' m` with `n ≥ m + 1`, adding `m + 1 ⊑ n` and additive
  cancellation (1.1 (i), for the closed `⊑`) give `1 + s a₂ ⊑ s a₁`; then `s` is not below `0`
  and `s a₂ ⊑ s a₁`, so `a₂ ⊑ a₁` by 1.1 (ii), a contradiction. The Archimedean field is
  inherited.
- *Lemma C (Zorn).* The set of Strassen preorders containing a given one, viewed as sets of pairs
  ordered by inclusion, is closed under unions of nonempty chains (each field involves finitely
  many pairs, all in one member of the chain). By Mathlib's `zorn_subset_nonempty` every Strassen
  preorder is contained in a maximal one.
- *Lemma D (thesis, Lemmas 2.6, 2.7).* A maximal Strassen preorder `⊑` is closed (its asymptotic
  preorder is a Strassen preorder containing it, 1.1) and total (otherwise Lemma B enlarges it).
- *Lemma E (thesis, Lemma 2.9).* For a total Strassen preorder `⊑` put
  `φ a = inf {r/s : s ≥ 1, s a ⊑ r}`; the set is nonempty by the Archimedean field (`1` is not
  below `0`). Then also `φ a = sup {u/v : v ≥ 1, u ⊑ v a}` (if `u ⊑ va` and `sa ⊑ r` then
  `su ⊑ vr`; if a fraction `r/s` lay strictly between the two, `sa ⋢ r`, so `r ⊑ sa` by totality);
  `φ` is subadditive and submultiplicative from the infimum, superadditive and supermultiplicative
  from the supremum, monotone, and `φ 1 = 1`. So `φ` is in the spectrum of `⊑`, and of every
  preorder contained in `⊑`.
- *Lemma F (thesis, end of Lemma 2.9, and Lemma 2.11).* Suppose `a ≴ b`. By 1.1 (iii) with
  `c = 1` there is `n` with `n a ≴ n b + 1` (here `n ≥ 1`, since `0 ≲ 1`). Lemma B with `⊑ = ≲`
  (closed by 1.1), `a₂ = n a`, `a₁ = n b + 1` gives a Strassen preorder containing `≲` in which
  `n b + 1 ⊑' n a`; Lemma C extends it to a maximal `⊑*`, and Lemma E gives `φ` in the spectrum of
  `⊑*`, hence of `≤`, with `n φ b + 1 ≤ n φ a`, so `φ a > φ b`.
- *Laws up to `≈`.* The thesis uses exact semiring identities. Every step above takes place in a
  preorder that contains `≤`, in which `≈`-equal elements are interchangeable on either side of
  `⊑`, so the identities up to `≈` suffice.

**Checks.**
- `ℕ`: the spectrum is `{n ↦ n}` and `≲` is `≤`.
- Graphs (Layer 2): `α(C₅ ⊠ C₅) = 5` gives `K̄₅ ≤ C₅ ⊠ C₅`, so `φ(C₅)² ≥ 5` for every spectral
  point, and the theta function (2.2) attains `√5`.
- Positive pairs: `(1, 2) ≲ (2, 1)` fails, and the projection to the second coordinate is the
  spectral point that sees it (`2 > 1`).

*Needs:* 1.1; Mathlib `zorn_subset_nonempty`.

### 1.3 Asymptotic rank and subrank

Define `abstractRank le a`, the least `r : ℕ` with `a ≤ r`, and `abstractSubrank le a`, the largest
`s : ℕ` with `s ≤ a` (thesis, §2.8, p. 27; survey, Defs. 2.5, 2.6, p. 20). Define
`asympRank le a`, the infimum over `n` of `R(aⁿ⁺¹)^(1/(n + 1))`, and `asympSubrank le a`, the
supremum over `n` of `Q(aⁿ⁺¹)^(1/(n + 1))`. Define `IsGapped le a`: some power `aᵏ` is at least
`2`, or some spectral point takes the value `1` at `a` (survey, Def. 3.27, p. 41).

Prove `isCompact_asymptoticSpectrum`: for a Strassen preorder the asymptotic spectrum is compact
in `R → ℝ` (survey, Lemma 3.33, p. 43, there in `ℝ≥1^R`).

Prove `asympRank_spec`: for a Strassen preorder and `1 ≤ a`, `R(aⁿ)^(1/n)` tends to
`asympRank le a`, and `asympRank le a` is the largest value `φ a` over the spectrum (thesis,
Cor. 2.13, pp. 27–28; Zuiddam 2019, Cor. 3.1, p. 5; survey, Thm. 3.25, pp. 40–41, and
Cor. 3.30, p. 42).

Prove `asympSubrank_spec`: for a Strassen preorder, `1 ≤ a` and `a` gapped, `Q(aⁿ)^(1/n)` tends
to `asympSubrank le a`, and `asympSubrank le a` is the least value `φ a` over the spectrum
(survey, Thm. 3.26, p. 41, Lemma 3.28 and Cor. 3.31, p. 42; Zuiddam 2019, Cor. 3.1, p. 5, with
the hypothesis `aᵏ ≥ 2`).

Route.

- *Junk.* `a ≤ abstractRank` exists: the Archimedean field with `b = 1` gives `a ≤ r * 1 ≈ r`, so
  the set is nonempty and `Nat.sInf_mem` applies. `s ≤ a ≤ r` gives `s ≤ r`, so the set of the
  subrank is bounded by `R(a)` and contains `0`.
- *Compactness.* For `φ` in the spectrum, `0 ≤ φ a ≤ R(a)`. The product of the intervals
  `[0, R(a)]` is compact (`isCompact_univ_pi`), and the spectrum is the intersection of the sets
  cut out by the equations and inequalities of its definition, each closed because evaluation at
  a point is continuous; a closed subset of a compact set is compact.
- *Limits.* For `1 ≤ a`: `1 ≤ aⁿ`, so `R(aⁿ) ≥ 1` (else `1 ≤ aⁿ ≤ 0`), and
  `R(aᵐ⁺ⁿ) ≤ R(aᵐ) R(aⁿ)` from `aᵐ⁺ⁿ ≈ aᵐaⁿ`. Mathlib's `Submultiplicative.tendsto_lim` gives the
  limit, which by Fekete's lemma is the infimum over `n ≥ 1`. Likewise `1 ≤ Q(aⁿ) ≤ R(a)ⁿ` and
  `Q(aᵐ⁺ⁿ) ≥ Q(aᵐ) Q(aⁿ)`; `Subadditive.tendsto_lim` applied to `−log Q(aⁿ)` gives the limit, the
  supremum over `n ≥ 1`.
- *Rank.* `φ a ≤ R(aⁿ)^(1/n)` from `φ(aⁿ) ≤ R(aⁿ)`, so `φ a ≤ asympRank`. The spectrum is nonempty
  (1.2) and compact, so `x = max φ a` exists, and `x ≥ 1`. For `m ≥ 1`, every `φ` has
  `φ(aᵐ) ≤ ⌈xᵐ⌉`, so `aᵐ ≲ ⌈xᵐ⌉` by 1.2: `a^(mN) ≤ 2^(f_m N) ⌈xᵐ⌉ᴺ`, hence
  `asympRank ≤ ⌈xᵐ⌉^(1/m) ≤ (xᵐ + 1)^(1/m)`, which tends to `x` as `m → ∞`.
- *Subrank.* `Q(aⁿ) ≤ φ(aⁿ)` gives `asympSubrank ≤ φ a`, so `asympSubrank ≤ y = min φ a`, with
  `y ≥ 1`. If `φ₀ a = 1` for some `φ₀`, `y = 1 ≤ asympSubrank`. Otherwise `2 ≤ aᵏ` with `k ≥ 1`
  (`a⁰ = 1`). For `m ≥ 1`, `⌊yᵐ⌋ ≤ φ(aᵐ)` for every `φ`, so `⌊yᵐ⌋ ≲ aᵐ` by 1.2:
  `⌊yᵐ⌋ᴺ ≤ 2^(ε N) a^(mN) ≤ a^(mN + k ε N)` with `ε N = o(N)`. So
  `Q(a^(mN + kεN)) ≥ ⌊yᵐ⌋ᴺ`, and letting `N → ∞` then `m → ∞`, `asympSubrank ≥ y` (Zuiddam 2019,
  proof of Cor. 3.1, pp. 5–6).

**Checks.**
- `1 ≤ a` is needed in `asympRank_spec`: in `ℚ≥0`, `a = 1/2` has `R(aⁿ) = 1` for every `n`, so
  `asympRank = 1`, while the only spectral point gives `1/2`.
- `1 ≤ a` is needed in `asympSubrank_spec`: in the positive pairs, `a = (1, 1/2)` is gapped (the
  first projection is `1` at `a`) but `Q(aⁿ) = 0` for every `n`, so `asympSubrank = 0 < 1/2`, the
  value of the second projection.
- The gap hypothesis is needed (survey, Remark 3.32, p. 42, adapted to a semiring with zero): on
  `ℕ[x]` put `p ≤ q` when `p(2) ≤ q(2)` and, if `q` is a power of `x`, `p` is a power of `x` or
  `0`. This is a Strassen preorder (all fields checked on the 27 polynomials of degree at most
  `2` with coefficients at most `2`, and the natural numbers up to `5`), `1 ≤ x`, and
  `4 ≤ 2x ≤ 4` forces `φ x = 2` for every spectral point; but `s ≤ xⁿ` only for `s ≤ 1`, so
  `asympSubrank x = 1`, and `2 ≤ xᵏ` never holds.
- Positive pairs, `b = (2, 3)`: `R(bⁿ) = 3ⁿ` and `Q(bⁿ) = 2ⁿ`, so the asymptotic rank `3` and
  subrank `2` are the values of the two projections.

*Needs:* 1.1, 1.2; Mathlib `Nat.sInf_mem`, `Submultiplicative.tendsto_lim`,
`Subadditive.tendsto_lim`, `isCompact_univ_pi`, `IsClosed.isCompact`.

### Examples

The ordered semirings `ℕ`, `ℚ≥0`, `ℝ≥0`; the positive pairs; the preorder on `ℕ[x]` of the last
Check of 1.3; graphs (Layer 2) and tensors (Layer 3).

### Dependencies

Mathlib only.

## Layer 2: the asymptotic spectrum of graphs

### 2.1 Graphs and Zuiddam's theorem

Define `FinGraph` with its `Zero`, `One`, `Add` and `Mul` instances and `cohomLE` as in the
Conventions.

Prove `isStrassenPreorder_cohomLE`: `cohomLE` is a Strassen preorder (Zuiddam 2019, Lemmas 4.1
and 4.2, p. 6, where `⩽` is the existence of a homomorphism of complements; thesis, §2.3, p. 20;
survey, Example 2.19, pp. 24–26). (Proved here; the sources leave the verification to the
reader.)

Prove `abstractRank_cohomLE_and_abstractSubrank`: the rank of `G` is the least `k` such that `Gᶜ`
is `k`-colourable, the clique cover number, and its subrank is `α(G)` (Zuiddam 2019, p. 6).

Prove `shannonCapacity_eq_asympSubrank`: `asympSubrank cohomLE G = shannonCapacity G.G`, and this is
the least value `φ G` over the spectrum (Zuiddam 2019, Thm. 1.1 (ii), p. 2, with the proof on
p. 6).

Route.

- *Isomorphisms.* A graph isomorphism `e` maps distinct nonadjacent vertices to distinct
  nonadjacent ones, so `G ≈ H`. The identities come from `SimpleGraph.Iso.sumComm`,
  `SimpleGraph.Iso.sumAssoc`, the equivalences `Equiv.prodComm`, `Equiv.prodAssoc`,
  `Equiv.prodSumDistrib`, `Fin 0 ⊕ V ≃ V` and `Fin 1 × V ≃ V`, each an isomorphism for the strong
  product and the disjoint union (in `V × (W ⊕ U)` a pair with second coordinates on different
  sides is nonadjacent, as in `V × W ⊕ V × U`). `0 * G` has no vertex, as `0`.
- *Compatibility.* The complement of `G ⊕g H` is not `Gᶜ ⊕g Hᶜ`: every pair across the two sides is
  an edge of it. For `f : Gᶜ →g G'ᶜ`, the map `Sum.map f id` sends such a pair to a pair across
  the sides, distinct and nonadjacent in `G' ⊕g H`; within a side it acts as `f` or the identity.
  For the product, `Prod.map f id`: if `(v, w) ≠ (v', w')` are not adjacent in the strong product,
  some coordinate is distinct and nonadjacent, and its image under `f` or the identity is again
  distinct and nonadjacent.
- *Natural numbers.* `Nat.unaryCast n ≈ K̄ₙ` by induction, and a homomorphism `Kₙ → Kₘ` is an
  injective map, which exists exactly when `n ≤ m`.
- *Archimedean.* `H` is below `0` exactly when it has no vertex. If `h₀` is a vertex of `H` and
  `e : V(G) ≃ Fin r`, the map `v ↦ (e v, h₀)` into `K̄ᵣ ⊠ H` sends distinct vertices to pairs with
  distinct, nonadjacent first coordinates, which are distinct and nonadjacent.
- *Rank and subrank.* The complement of `K̄ₖ` is the complete graph, so `G ≤ K̄ₖ` is a proper
  `k`-colouring of `Gᶜ`, Mathlib's `Gᶜ.Colorable k`; and `K̄ₛ ≤ G` is an injective map onto a set
  of `s` vertices pairwise adjacent in `Gᶜ`, an independent set of `G`. Both are invariant under
  `≈`.
- *Shannon capacity.* `npowRec (n + 1) G` is isomorphic to `strongPow G.G (n + 1)` (by
  `Fin.snocEquiv`-type equivalences `(Fin 1 × V) × ⋯ × V ≃ (Fin (n + 1) → V)`, under which the
  nested strong products become `strongPow`; LovaszThetaFunction 3.1 records this in prose), and
  isomorphic graphs have equal independence numbers. So the terms of `asympSubrank cohomLE G` and
  of `shannonCapacity G.G` agree for every `n`, and so do the suprema.
- *Least value.* If `G` has no vertex, `G ≈ 0`, both sides are `0` and `φ G = 0` for every `φ`
  (the spectrum is nonempty by 1.2). Otherwise `1 ≤ G` (a vertex), and `G` is gapped: if
  `α(G) ≥ 2`, then `2 ≤ G`; if `α(G) = 1`, `Gᶜ` has no edge, every map `G → K̄₁` is a
  cohomomorphism, `G ≈ 1`, and `φ G = 1` for every `φ`. Then `asympSubrank_spec` applies.

**Checks.**
- `K̄ₙ ≤ K̄ₘ` exactly when `n ≤ m`, for `n, m ≤ 4`.
- Rank and subrank, computed from the preorder: `(3, 2)` for `C₅`, `(2, 2)` for `C₄`, `(3, 3)` for
  `C₆`, `(4, 3)` for `C₇`, `(2, 2)` for the path `P₃`, `(3, 3)` for the star `K₁,₃`, `(1, 1)` for
  `K₃`; each agrees with the clique cover number and `α`.
- Direction: the edgeless graph `K̄₂` maps homomorphically to `K₁`, but `K̄₂ ≤ K₁` fails (no
  homomorphism `K₂ → K₁` of complements), as it must since `ϑ(K̄₂) = 2 > 1 = ϑ(K₁)`. The
  homomorphism preorder of the graphs themselves is the wrong one.
- Compatibility with `⊕g` and the strong product holds on all `216` triples of six graphs on at
  most three vertices.
- Every one of the `75` labelled graphs on `1` to `4` vertices is either at least `K̄₂` or
  equivalent to `K̄₁`, the two cases of the gap.
- `α(C₅ ⊠ C₅) = 5`, so `√5 ≤ Θ(C₅)`; with `ϑ(C₅) = √5` (2.2) the least spectral value at `C₅` is
  `√5`.

*Needs:* 1.1–1.3; LovaszThetaFunction 3.1 (`strongProd`, `strongPow`, copied) and 5.1
(`shannonCapacity`, copied); Mathlib `SimpleGraph.sum`, `SimpleGraph.Iso.sumComm`,
`SimpleGraph.Iso.sumAssoc`, `SimpleGraph.Colorable`, `SimpleGraph.indepNum`, `Equiv.prodComm`,
`Equiv.prodAssoc`, `Equiv.prodSumDistrib`, `Fin.snocEquiv`.

### 2.2 The Lovász theta function

Prove `lovaszTheta_sum`: for finite graphs `G` and `H`, `ϑ(G ⊕g H) = ϑ(G) + ϑ(H)`, with no
nonemptiness hypothesis (Knuth, §18, (18.2), p. 19, with all weights `1`; Knuth's `G′ + G″` is the
disjoint union). (Proved here on the statements of LovaszThetaFunction; Knuth's proof uses his
labellings, which that roadmap does not state.)

Prove `lovaszTheta_mem_asymptoticSpectrum`: `G ↦ ϑ(G)` is a point of the asymptotic spectrum of
graphs (Zuiddam 2019, §5.1, p. 7, which states it without proof; survey, Example 3.39, p. 45). In
particular `ϑ` is monotone under cohomomorphisms: a graph homomorphism `Gᶜ →g Hᶜ` gives
`ϑ(G) ≤ ϑ(H)`. (Proved here.)

Route of `lovaszTheta_sum`.

- *Empty graphs.* If `V(G)` is empty, the set defining `ϑ(G)` is empty (the trace of the empty
  matrix is `0`), so `ϑ(G) = 0` (`Real.sSup_empty`); and `G ⊕g H` is isomorphic to `H` by
  `e : W ≃ V ⊕ W`, under which `B ↦ B.submatrix e e` matches the admissible matrices of the two
  graphs, with the same trace and entry sum, so `ϑ(G ⊕g H) = ϑ(H)` (the isomorphism invariance that
  LovaszThetaFunction 1.1 lists in prose, proved here in this line). Symmetrically for `H`.
  Assume both nonempty; then `t = ϑ(G) ≥ α(G) ≥ 1` and
  `t' = ϑ(H) ≥ 1` (LovaszThetaFunction 2.1).
- *`≤`.* Take `(N, u, c)` for `G` with value `t` and `(N', w, d)` for `H` with value `t'`
  (LovaszThetaFunction 1.2). In `EuclideanSpace ℝ (Fin (N + N'))`, split by `finSumFinEquiv`, put
  `u` in the first block and `w` in the second, and take the handle
  `e = √(t/(t + t')) c ⊕ √(t'/(t + t')) d`, a unit vector. Pairs across the sides are orthogonal,
  pairs within a side keep their inner products, and
  `(t + t') ⟪e, u v⟫² = t ⟪c, u v⟫² ≥ 1`, likewise on the second side. So `t + t'` lies in the set
  of 1.2 for `G ⊕g H`, and `ϑ(G ⊕g H) ≤ t + t'`.
- *`≥`.* Take maximizers `B` for `G` and `B'` for `H` (`isGreatest_lovaszTheta`,
  LovaszThetaFunction 1.1), so `𝟙ᵀB𝟙 = t`, `𝟙ᵀB'𝟙 = t'`. Put `b = B𝟙`, `b' = B'𝟙` and
  `C = (t + t')⁻¹ [[t B, b b'ᵀ], [b' bᵀ, t' B']]` on `V ⊕ W` (`Matrix.fromBlocks`). Then
  `C = (t + t')⁻¹ (diag(t B − b bᵀ, t' B' − b' b'ᵀ) + v vᵀ)` with `v = (b, b')`, and
  `t B − b bᵀ` is positive semidefinite by the Cauchy–Schwarz inequality for the semi-inner
  product `(x, y) ↦ xᵀ B y`: `(xᵀ B 𝟙)² ≤ (xᵀ B x)(𝟙ᵀ B 𝟙)`. So `C` is positive semidefinite
  (`Matrix.PosSemidef.add`, `Matrix.posSemidef_vecMulVec_self_star`, and the block-diagonal case
  by `x ↦ xᵀ C x`), its trace is `(t + t')⁻¹(t + t') = 1`, it vanishes on the edges of
  `G ⊕g H`, which lie within one side, and its entry sum is
  `(t + t')⁻¹ (t² + 2tt' + t'²) = t + t'`. So `ϑ(G ⊕g H) ≥ t + t'`.

Route of `lovaszTheta_mem_asymptoticSpectrum`.

- *Monotonicity.* Let `f : Gᶜ →g Hᶜ`. If `V(G)` is empty, `ϑ(G) = 0` as above, and
  `0 ≤ α(H) ≤ ϑ(H)` by `indepNum_le_lovaszTheta` (LovaszThetaFunction 2.1). Otherwise `V(H)` is
  nonempty too. By `isLeast_orthonormalRepresentation` (LovaszThetaFunction 1.2) for `H` there are
  `N`, unit vectors `w h` and a unit `d` with `⟪w h, w h'⟫ = 0` for distinct nonadjacent `h, h'`
  and `1 ≤ ϑ(H) ⟪d, w h⟫²`. Put `u v = w (f v)`: distinct nonadjacent `v, v'` are adjacent in
  `Gᶜ`, so `f v, f v'` are adjacent in `Hᶜ`, distinct and nonadjacent in `H`, and
  `⟪u v, u v'⟫ = 0`. So `ϑ(H)` lies in the set of `isLeast_orthonormalRepresentation` for `G`, and
  `ϑ(G) ≤ ϑ(H)`.
- *Operations.* Addition of `FinGraph` is `⊕g`, so additivity is `lovaszTheta_sum`;
  multiplication is `strongProd`, so multiplicativity is `lovaszTheta_strongProd`
  (LovaszThetaFunction 3.2).
- *Unit.* For the one-vertex graph `α = 1 ≤ ϑ` (`indepNum_le_lovaszTheta`) and `ϑ ≤ 1`
  (`lovaszTheta_le_of_colorable_compl` with `k = 1`, the complement having no edge), so
  `ϑ(1) = 1`.

**Checks.**
- `C₅`: the circulant `B = (1/5) I + ((√5 − 1)/10)(P² + P⁻²)` of LovaszThetaFunction 1.1 is
  admissible with entry sum `√5`, and Lovász's umbrella (five unit vectors in `ℝ³` at height
  `5^(−1/4)` over the handle, at angles `2πk/5`) puts `√5` in the set of 1.2; both verified
  exactly.
- The matrix `C` of the route, built from these, is admissible with entry sum `√5 + 1` for
  `C₅ ⊔ K₁`, `2√5` for `C₅ ⊔ C₅`, and `1 + √5` for `K₂ ⊔ C₅` (with `B = I/2` for `K₂`), and
  `√5 B − b bᵀ` is positive semidefinite; for `C₅ ⊔ K₁` the handle of the route satisfies
  `(√5 + 1)⟪e, u⟫² ≥ 1` at all six vertices. All exact.
- The block-diagonal `p B ⊕ q [1]` with `p = √5/(√5 + 1)` is admissible for `C₅ ⊔ K₁` but has entry
  sum `6/(√5 + 1) < √5 + 1`: the off-diagonal blocks are needed.
- Monotonicity along `C₅ ≤ K̄₃` (a clique cover by three cliques) and `K̄₂ ≤ C₅` gives
  `2 ≤ √5 ≤ 3`.

*Needs:* 2.1; LovaszThetaFunction 1.1 (`lovaszTheta`, copied; `isGreatest_lovaszTheta`), 1.2
(`isLeast_orthonormalRepresentation`), 2.1 (`indepNum_le_lovaszTheta`,
`lovaszTheta_le_of_colorable_compl`), 3.2 (`lovaszTheta_strongProd`); Mathlib `Real.sSup_empty`,
`Matrix.fromBlocks`, `Matrix.PosSemidef.add`, `Matrix.posSemidef_vecMulVec_self_star`,
`EuclideanSpace`, `finSumFinEquiv`, `SimpleGraph.Iso`.

### 2.3 The fractional clique cover number

Define `fracCliqueCover G`: the infimum of `∑ C, x C` over `x : Finset V → ℝ` that are fractional
covers of the system of all finite sets (`IsFractionalCover`, copied verbatim from
ApproximationGuarantees 1.1) and vanish off the cliques of `G`. It is `0` on the empty vertex
type, where the only set is `∅`. Mathlib and Tau Ceti have no fractional chromatic number; in the
usual notation `fracCliqueCover G = χ_f(Gᶜ)`.

Prove `fracCliqueCover_spec`: the infimum is attained, and it equals the largest `∑ v, y v` over
`y ≥ 0` with `∑ v ∈ C, y v ≤ 1` for every clique `C`. (Proved here.)

Prove `fracCliqueCover_mem_asymptoticSpectrum`: `G ↦ fracCliqueCover G` is a point of the asymptotic
spectrum of graphs (Zuiddam 2019, §5.2.1, p. 7, and survey, Example 3.39, p. 45, which state it
without proof). (Proved here.)

Route.

- *Duality.* Index the primal by the finite sets `C` that are cliques and the vertices `v`
  (slacks): minimize `∑ x_C` subject to `∑_{C ∋ v} x_C − z_v = 1` for every `v` and `x, z ≥ 0`.
  This is the standard form of `linearProgramming_duality` (ConvexAnalysisAndDuality 5.3) with
  `A = [M | −I]`, `M v C = [v ∈ C]`, `b = 𝟙`, `c = (𝟙, 0)`; it is feasible (singletons with weight
  `1`, `z = 0`) and bounded below by `0`. Its dual is `max 𝟙 ⬝ᵥ y` subject to `Mᵀ y ≤ 𝟙` and
  `−y ≤ 0`, the packing problem of the statement. A primal optimum gives a fractional cover
  supported on cliques, and every such cover gives a primal point (`z_v` the excess), so the
  primal value is `fracCliqueCover G` and it is attained.
- *Additivity.* Every clique of `G ⊕g H` lies in one side. Covers of `G` and `H`, moved by `inl`
  and `inr`, give a cover of `G ⊕g H` of the summed value; packings of `G` and `H` side by side
  give a packing of `G ⊕g H` of the summed value. With the duality, both inequalities follow.
- *Multiplicativity.* If `C`, `D` are cliques of `G`, `H`, then `C ×ˢ D` is a clique of the strong
  product. For optimal covers `x`, `x'` put `z E = ∑ x C x' D` over the pairs with `C ×ˢ D = E`;
  at `(v, w)` the weight covering it is `(∑_{C ∋ v} x C)(∑_{D ∋ w} x' D) ≥ 1`, and the total is
  the product of the values. For optimal packings `y`, `y'`, put `z (v, w) = y v y' w`: a clique
  `E` of the strong product has cliques as its two projections and lies in their product, so
  `∑_{E} z ≤ (∑_{π₁E} y)(∑_{π₂E} y') ≤ 1`, with total the product of the values.
- *Monotonicity.* For `f : Gᶜ →g Hᶜ` and a clique `D` of `H`, the preimage `f⁻¹ D` is a clique of
  `G`: two distinct nonadjacent vertices of it would map to distinct nonadjacent vertices of `D`.
  Pulling back an optimal cover of `H` (`z C = ∑ x D` over `D` with `f⁻¹ D = C`) gives a cover of
  `G` of the same value.
- *Unit.* On one vertex the cover `{0} ↦ 1` and the packing `0 ↦ 1` both have value `1`.

**Checks.**
- `C₅`: the five edges with weight `1/2` and the constant packing `1/2` both give `5/2`.
- `C₅ ⊠ C₅`: the product of these covers (25 cliques of size `4` with weight `1/4`) and the
  constant packing `1/4` both give `25/4 = (5/2)²`.
- `C₅ ⊔ K₁`: `7/2 = 5/2 + 1`, again with a cover and a packing.
- Preimages of cliques under cohomomorphisms are cliques: all maps from 30 graphs on at most `4`
  vertices to `C₅`, `K₂` and a three-vertex graph with one edge.
- The support condition matters: dropping "vanish off the cliques" lets the whole vertex set carry
  weight `1`, so the value of every nonempty graph would be `1`.

*Needs:* 2.1; ConvexAnalysisAndDuality 5.3 (`linearProgramming_duality`); ApproximationGuarantees
1.1 (`IsFractionalCover`, copied); Mathlib `Finset.product`.

### 2.4 The asymptotic clique cover number

Prove `asympRank_cohomLE`: `asympRank cohomLE G = fracCliqueCover G.G`, and this is the largest
value `φ G` over the spectrum. With the identification of the rank in 2.1 and `asympRank_spec`, the
clique cover numbers `χ̄(G^⊠n)` satisfy `χ̄(G^⊠n)^(1/n) → fracCliqueCover G` (McEliece and
Posner; statement in Zuiddam 2019, Remark 1.2, p. 2, and §5.2.1, p. 7, and in survey,
Example 3.39, p. 45). (Proved here: no source read proves it.)

Route.

- *Empty graph.* Both sides are `0` and every spectral value at `0` is `0`.
- *`≥`.* `fracCliqueCover` is a spectral point (2.3), so its value is at most the largest value,
  which is `asympRank` by `asympRank_spec` (`1 ≤ G`).
- *`≤`.* Fix `n ≥ 1` and let `H` be the graph of `npowRec n G`, on `d = |V|ⁿ` vertices. Consider
  the set system `S C = C` if `C` is a clique of `H` and `S C = ∅` otherwise, indexed by
  `Finset V(H)`, with unit costs. An optimal cover `x` of 2.3 for `H` is a fractional cover of `S`
  (it vanishes off the cliques), of value `fracCliqueCover H = fracCliqueCover(G)ⁿ`
  (multiplicativity, through `fracCliqueCover_mem_asymptoticSpectrum`). A complete greedy
  sequence exists: start from the empty list and, while some set has positive gain, append one of
  largest gain (with unit costs this is the rule of `IsGreedy`, ApproximationGuarantees 1.2); the
  number of uncovered elements drops at each step, so the process stops, and then every vertex,
  lying in its singleton clique, is covered (the extension bullet of ApproximationGuarantees 1.2,
  stated there in prose, proved here in these two lines). By
  `IsGreedy.sum_cost_le_harmonic_mul` with `c = 1` and `|S C| ≤ d`, its length `L` is at most
  `harmonic d · fracCliqueCover(G)ⁿ`. Colouring each vertex of `H` by the position of the first
  clique of the sequence containing it is a proper colouring of `Hᶜ` (two vertices of one colour
  lie in one clique), so the clique cover number of `H`, which is `R(Gⁿ)` by 2.1, is at most `L`.
  With `harmonic d ≤ 1 + log d = 1 + n log |V|` (`harmonic_le_one_add_log`),
  `R(Gⁿ)^(1/n) ≤ (1 + n log |V|)^(1/n) fracCliqueCover G`, and the first factor tends to `1`.

**Checks.**
- `C₅ ⊠ C₅`: every clique lies in one of the `25` products of two edges, and no `7` of these cover
  the vertices, so the clique cover number is `8`, above `25/4`; a greedy sequence of cliques by
  largest gain covers it with `L` cliques, `8 ≤ L ≤ H₂₅ · 25/4`.
- `C₅`: `χ̄(C₅) = 3 > 5/2`, and `√5 = Θ(C₅) ≤ ϑ(C₅) = √5 ≤ 5/2 ≤ 3`: the least and largest spectral
  values at `C₅` differ.

*Needs:* 1.3 (`asympRank_spec`), 2.1, 2.3; ApproximationGuarantees 1.2 (`gain`, `IsGreedy`,
`IsGreedy.sum_cost_le_harmonic_mul`); Mathlib `harmonic_le_one_add_log`.

### Examples

`C₅` throughout: `α = 2`, `Θ = ϑ = √5`, `fracCliqueCover = 5/2`, clique cover number `3`.

### Dependencies

Layer 1; LovaszThetaFunction 1.1, 1.2, 2.1, 3.1, 3.2, 5.1; ConvexAnalysisAndDuality 5.3;
ApproximationGuarantees 1.1, 1.2.

## Layer 3: the asymptotic spectrum of tensors

### 3.1 Restriction and tensor rank

Define `CoordTensor` with its `Zero`, `One`, `Add` and `Mul` instances and `restrictLE` as in the
Conventions, and `tensorRank`, the CP rank: the least `r` for which there are factor matrices
`A p : Matrix (Fin (dim p)) (Fin r) F`, one for each party, with `t x = ∑ i, ∏ p, A p (x p) i`
for every index `x`, that is, `t` is the sum of the `r` products of the `i`-th columns of the
`A p`.

Prove `isStrassenPreorder_restrictLE`: with at least two parties, restriction with direct sum,
Kronecker product and unit tensors is a Strassen preorder (survey, Example 2.20, pp. 27–28, which
leaves the verification to the reader; thesis, §2.3, pp. 20–21). (Proved here.)

Prove `abstractRank_restrictLE`: the rank of `t` for restriction is `tensorRank t`, for any finite
set of parties (survey, Example 2.20, p. 28, for three parties, without proof). (Proved here.)

Define `CoordTensor.ofHolor x` for a Mathlib holor `x : Holor F ds`: parties `Fin ds.length`,
dimension `d` at a party with entry `d` of `ds`, and the entries of `x` as coordinates. Prove
`tensorRank_ofHolor`: for `ds ≠ []` (and a field `F : Type`, as Mathlib's CP rank requires),
`tensorRank (CoordTensor.ofHolor x) = Holor.cprank x`. (Proved here.)

Route.

- *Relabelling.* Equivalences `e p : Fin (s.dim p) ≃ Fin (t.dim p)` with
  `s.coeff x = t.coeff (fun p ↦ e p (x p))` give `s ≈ t` (permutation matrices). The identities
  hold up to such equivalences, built from `finSumFinEquiv` and `finProdFinEquiv` with
  `Equiv.sumComm`, `Equiv.sumAssoc`, `Equiv.prodComm`, `Equiv.prodAssoc`, `Equiv.prodSumDistrib`,
  and `finCongr` for `0 + d = d` and `1 * d = d`; on both sides a mixed tuple has coordinate `0`.
  With a party present, no index of `Fin (0 + d)` is below `0`, so `0 + t` has the coordinates of
  `t`; `0 * t` has a dimension `0`, no coordinates, and is equivalent to `0`.
- *Zero.* With a party present, `t ≤ 0` exactly when `t.coeff = 0`: restriction from `0` is a
  sum over no tuples, and a zero array is the image of `0` under any matrices.
- *Compatibility.* If `s ≤ t` by `A`, then `s + u ≤ t + u` by the block matrices
  `Matrix.fromBlocks (A p) 0 0 1`, reindexed by `finSumFinEquiv` (a mixed tuple has coordinate `0`
  on both sides: a product over the parties meets a zero block), and `s * u ≤ t * u` by the
  Kronecker products `Matrix.kronecker (A p) 1`, reindexed by `finProdFinEquiv`.
- *Lemma G (flattening is monotone).* If `s ≤ t` by `A` and `S` is a set of parties, the flattening
  of `s` at `S` is `(⊗_{p ∈ S} A p) · M_t · (⊗_{p ∉ S} A p)ᵀ`, with the Kronecker products of the
  two subfamilies, so
  `flatRank S s ≤ flatRank S t` (`Matrix.rank_mul_le`, `Matrix.rank_reindex`).
- *Natural numbers.* With a party present, `Nat.unaryCast n` is `⟨n⟩` up to `finCongr`
  (Conventions), so the two are equivalent.
  `⟨n⟩ ≤ ⟨m⟩` for `n ≤ m` by inclusion matrices. Conversely pick a
  party `p₀`; `{p₀}` is neither empty nor everything because there are two parties, and the
  flattening of `⟨n⟩` at `{p₀}` has rank `n` (its rows are distinct unit vectors), so Lemma G gives
  `n ≤ m`.
- *Archimedean.* If `s` is not below `0`, some coordinate `s.coeff x₀ = c ≠ 0`; the matrices
  `A p₀ = c⁻¹ · e_{x₀ p₀}ᵀ` and `A p = e_{x₀ p}ᵀ` give `⟨1⟩ ≤ s`. Every `t` is a sum of `N`
  rank-one tensors, one per tuple, where `N = ∏ p, t.dim p` is the number of tuples, so
  `t ≤ ⟨N⟩ ≈ N * ⟨1⟩ ≤ N * s`
  (by the rank item below).
- *Rank.* With a party present, only the diagonal tuples `(i, …, i)` of `⟨r⟩` are nonzero, so
  `t ≤ ⟨r⟩` by matrices `A p : Matrix (Fin (t.dim p)) (Fin r) F` says exactly
  `t.coeff x = ∑_{i < r} ∏ p, A p (x p) i`: the matrices of a restriction from `⟨r⟩` are the factor
  matrices of a decomposition with `r` terms, and conversely. As `Nat.unaryCast r` is `⟨r⟩` up to
  `finCongr`, the least such `r` is both ranks. With no party a tensor is a scalar, the Kronecker product of the
  empty family is the `1 × 1` matrix `1`, so restriction is equality, `Nat.unaryCast r` is the
  scalar `r · 1`, and a sum of `r` empty products is `r · 1`: both ranks of `c` are the least `r`
  with `c = r · 1`, or `0` when there is none.
- *Holors.* Mathlib's `Holor.CPRankMax1` holors are the products `v₁ ⊗ (v₂ ⊗ ⋯ ⊗ (vₖ ⊗ c))` of
  one-dimensional holors and a scalar holor `c`, and `Holor.CPRankMax n x` says that `x` is a sum
  of `n` of them. Read through `CoordTensor.ofHolor`, such a product has coordinates
  `c · ∏ p, v_p (x p)`; with `ds ≠ []` the scalar is absorbed into the first factor, and
  conversely the product `x ↦ ∏ p, A p (x p) i` of the `i`-th columns of factor matrices is such a
  product with `c = 1`. So `Holor.CPRankMax n x` holds exactly when `x` has a decomposition with
  `n` terms in the sense of `tensorRank` (induction on `ds` for the products, on `n` for the
  sums), and the two least values agree.

**Checks.**
- Over `GF(2)`, all `256` tensors of format `2 × 2 × 2`: the least `r` with `t ≤ ⟨r⟩` equals the
  least number of rank-one terms, the maximum is `3`, and the tensor `W = e₁₀₀ + e₀₁₀ + e₀₀₁` has
  rank `3`.
- One party: the natural number `2` is the vector `(1, 1)`, the image of `1 = (1)` under the matrix
  `[[1], [1]]`, so `2 ≤ 1` and the natural numbers are not ordered: two parties are needed for the
  Strassen preorder. No party over `GF(2)`: the natural number `2` is the scalar `0`, so `2 ≤ 0`.
- No party over `ℚ`: the scalar `1/2` is not `r · 1` for any `r`, and both ranks are `0`, the
  value of `sInf ∅`; the theorem on ranks holds there with these junk values.
- `ds ≠ []` is needed in `tensorRank_ofHolor`: over `ℚ` the scalar holor `2` has
  `Holor.cprank 2 = 1` (`Holor.cprankMax_nil`, and `2 ≠ 0`), while `tensorRank` of the scalar `2`
  is `2` (both proved in Lean on the definitions). For `ds = [2, 2]` the identity matrix has both
  ranks `2`.
- With two parties over `GF(2)`, `Nat.unaryCast 3` has dimensions `3` and coordinate `1` exactly on
  the diagonal (evaluated in Lean by `decide`); with no party, `Nat.unaryCast 2` is the scalar `0`.
  Exactly, with one to three parties: `Nat.unaryCast n` has the dimensions and coordinates of
  `⟨n⟩` for `n ≤ 4`, and `0 + t`, `1 * t`, `t * 1` have those of `t` on random tensors with
  dimensions `0` to `3`.

*Needs:* 1.1; Mathlib `Matrix.mulVec`, `Matrix.fromBlocks`, `Matrix.kronecker`,
`Matrix.rank_mul_le`, `Matrix.rank_reindex`, `finSumFinEquiv`, `finProdFinEquiv`, `Fin.divNat`,
`Fin.modNat`, `finCongr`, `Equiv.sumComm`, `Equiv.sumAssoc`, `Equiv.prodComm`, `Equiv.prodAssoc`,
`Equiv.prodSumDistrib`, `Nat.sInf_mem`, `Holor`, `Holor.CPRankMax1`, `Holor.CPRankMax`,
`Holor.cprank`, `List.forall₂_iff_get`.

### 3.2 Flattening ranks and matrices

Define `flatRank S t`, the rank of the matrix with rows indexed by the index tuples of the parties
in `S`, columns by those of the other parties, and entries the coordinates of `t`, the two halves
of an index glued by `Equiv.piEquivPiSubtypeProd`.

Prove `flatRank_mem_asymptoticSpectrum`: for `S` nonempty and not the whole set of parties,
`t ↦ flatRank S t` is a point of the asymptotic spectrum of restriction (survey, Example 3.38,
p. 45, for three parties, stated without proof; Example 2.17, p. 23). (Proved here.)

Prove `asymptoticSpectrum_restrictLE_fin_two`: for two parties the spectrum consists of the matrix
rank `flatRank {0}` alone, and `s ≤ t` exactly when `flatRank {0} s ≤ flatRank {0} t` (survey,
Example 2.17, p. 23, and Example 3.37, pp. 44–45). (Proved here.)

Route.

- *Monotone* by Lemma G; `flatRank S ⟨1⟩ = 1`.
- *Additive.* Call an index of `Fin (s.dim p + t.dim p)` left if it is below `s.dim p` and right
  otherwise. In the flattening of `s + t`, a row whose indices are not all left or all right
  belongs only to mixed tuples and is zero (here `S` is nonempty); likewise a mixed column (here
  `S` is not everything). An all-left row and an all-right column also give a mixed tuple. Deleting
  zero rows and columns leaves `Matrix.fromBlocks M_s 0 0 M_t` up to reindexing. Rank of a
  block-diagonal matrix: the range of `fromBlocks A 0 0 D` is the product of the ranges, so its
  rank is `rank A + rank D` (own lemma; not in Mathlib), and zero rows and columns do not change
  the rank.
- *Multiplicative.* The flattening of `s * t` is `Matrix.kronecker M_s M_t` after reindexing rows
  and columns: `finProdFinEquiv` at each party turns an index tuple of `s * t` into a pair of
  index tuples of `s` and `t`, and its inverse reads indices by `Fin.divNat` and `Fin.modNat`, as
  the product does. Rank of a
  Kronecker product over a field: write `A = L₁ R₁` and `B = L₂ R₂` through `Fin (rank A)` and
  `Fin (rank B)` (Tau Ceti `Matrix.exists_eq_mul_fin_rank`); then `A ⊗ B = (L₁ ⊗ L₂)(R₁ ⊗ R₂)`
  (`Matrix.mul_kronecker_mul`) has rank at most `rank A · rank B`; and `L₁` has a left inverse,
  `R₁` a right inverse (their ranks equal their inner dimension), so `I` of size
  `rank A · rank B` is a restriction of `A ⊗ B`, and the rank is at least the product (own
  lemma; not in Mathlib).
- *Matrices.* For two parties, `t ≈ ⟨r⟩` with `r = flatRank {0} t`: `M_t = L R` through `Fin r`
  gives `t ≤ ⟨r⟩` with `A 0 = L`, `A 1 = Rᵀ`, and the one-sided inverses give `⟨r⟩ ≤ t`. So a
  spectral point takes the value `φ ⟨r⟩ = r`, and `flatRank {0}` is the only one; the comparison of
  ranks follows from Lemma G and `⟨r⟩ ≤ ⟨r'⟩` for `r ≤ r'`.

**Checks.**
- Flattening ranks at `{0}`, `{1}`, `{2}`: `(4, 4, 4)` for `⟨2, 2, 2⟩`, `(9, 9, 9)` for `⟨3, 3, 3⟩`,
  `(n, n, n)` for `⟨n⟩`, `n ≤ 4`.
- Additivity and multiplicativity verified exactly, with the sum and the product indexed as in
  `CoordTensor`, on `80` pairs of random integer tensors with three and four parties, dimensions
  `0` to `2` and zero tensors included, at `{0}`, `{1}`, `{0, 1}` and `{0, 2}`.
- A dimension `0` leaves no coordinates, and every flattening rank is `0`.
- `S = ∅`: the flattening is one row, its rank is `[t ≠ 0]`, and `⟨1⟩ + ⟨1⟩` gives `1`, not `2`:
  not additive. `S` equal to everything is the same by transposition.
- Two parties over `GF(2)`, all matrices of formats `2 × 2` and `2 × 3`: `A = P B Q` for some
  `P`, `Q` exactly when `rank A ≤ rank B`.

*Needs:* 3.1 (Lemma G); Tau Ceti `Matrix.exists_eq_mul_fin_rank`; Mathlib `Matrix.rank`,
`Matrix.kronecker`, `Matrix.mul_kronecker_mul`, `Matrix.fromBlocks`, `Matrix.rank_reindex`,
`Matrix.rank_one`, `Equiv.piEquivPiSubtypeProd`, `finProdFinEquiv`.

### 3.3 Matrix multiplication and the exponent ω

Define `mmTensor F n`, the tensor `⟨n, n, n⟩` on three parties of dimension `n * n`, an index
`n i + j` being read as the pair `(i, j)` by `Fin.divNat` and `Fin.modNat`, with coordinate `1`
exactly at `((i, j), (j, k), (k, i))` (survey, Example 2.21, p. 29: the trilinear form `Tr(XYZ)`).
For `n = 0` it has dimension `0` and is equivalent to `0`; for `n = 1` it is `1`. Define
`matMulExponent F`, the infimum of the `τ` such that
`R(⟨n, n, n⟩) ≤ C nᵗ` for some `C` and all `n ≥ 1`: the exponent of bilinear complexity. The set
is nonempty (`τ = log₂ 7` below) and bounded below by `2`, so the infimum is not a junk value.

Prove `matMulExponent_spec`, over every field: `tensorRank (mmTensor F 2) ≤ 7` (Strassen, by the
explicit identity below); `2 ≤ ω ≤ log₂ 7` (survey, Example 2.21, pp. 28–29, for the arithmetic
exponent); and `2^ω` is the asymptotic rank of `⟨2, 2, 2⟩` (Strassen; survey, Example 2.21, p. 29,
without proof). With `asympRank_spec`, `2^ω` is the largest value at `⟨2, 2, 2⟩` of a point of the
spectrum. (Proved here.)

Route.

- *Strassen's identity.* For `2 × 2` matrices `a`, `b` put `M₁ = (a₀₀ + a₁₁)(b₀₀ + b₁₁)`,
  `M₂ = (a₁₀ + a₁₁) b₀₀`, `M₃ = a₀₀ (b₀₁ − b₁₁)`, `M₄ = a₁₁ (b₁₀ − b₀₀)`, `M₅ = (a₀₀ + a₀₁) b₁₁`,
  `M₆ = (a₁₀ − a₀₀)(b₀₀ + b₀₁)`, `M₇ = (a₀₁ − a₁₁)(b₁₀ + b₁₁)`; then `(ab)₀₀ = M₁ + M₄ − M₅ + M₇`,
  `(ab)₀₁ = M₃ + M₅`, `(ab)₁₀ = M₂ + M₄`, `(ab)₁₁ = M₁ − M₂ + M₃ + M₆`. With `u_m (i, j)` the
  coefficient of `a_ij` in `M_m`, `v_m (j, k)` that of `b_jk`, and `w_m (k, i)` the coefficient of
  `M_m` in `(ab)_ik`, `⟨2, 2, 2⟩ = ∑_{m ≤ 7} u_m ⊗ v_m ⊗ w_m`. In the indexing of `mmTensor`
  these are factor matrices `A 0`, `A 1`, `A 2 : Matrix (Fin 4) (Fin 7) F` with
  `A 0 (2i + j) m = u_m (i, j)`, `A 1 (2j + k) m = v_m (j, k)`, `A 2 (2k + i) m = w_m (k, i)`, and
  `mmTensor F 2 = fun x ↦ ∑ m, ∏ p, A p (x p) m`, which is `tensorRank (mmTensor F 2) ≤ 7`. All
  coefficients are `0`, `1` or `−1`, so the identity holds over every field.
- *Products.* `mmTensor F n * mmTensor F m ≈ mmTensor F (n m)` by regrouping each index:
  `Fin (n n * (m m)) ≃ Fin (n m * (n m))` sends the index read as `((i₁, j₁), (i₂, j₂))` to the one
  read as `(m i₁ + i₂, m j₁ + j₂)` (`finProdFinEquiv` and `Equiv.prodProdProdComm`); the product
  of the three conditions on each factor is the condition on the regrouped indices. Hence
  `npowRec k (mmTensor F 2) ≈ mmTensor F (2ᵏ)` (for `k = 0` both are `1`). Rank is submultiplicative and invariant under `≈`
  (from 3.1 (rank) and the Strassen preorder), so `R(⟨2ᵏ⟩_MM) ≤ 7ᵏ`.
- *Monotone in `n`.* For `n ≤ n'`, `mmTensor F n ≤ mmTensor F n'` by the matrices that read off
  the coordinates whose pairs lie in `Fin n × Fin n` (the inclusion `Fin n → Fin n'` on both
  coordinates of the pair).
- *Bounds.* `R(⟨n, n, n⟩) ≤ n³` (one term per `(i, j, k)`), and `R(⟨n, n, n⟩) ≥ n²`: the flattening
  at `{0}` has `n²` nonzero rows with disjoint supports, and Lemma G.
- *`2 ≤ ω`.* If `n² ≤ C nᵗ` for all `n ≥ 1` then `τ ≥ 2`; so `2` bounds the set below.
- *`ω ≤ log₂ 7`.* For `n ≥ 1` let `k` be least with `n ≤ 2ᵏ` (`Nat.clog 2 n`). Then
  `R(⟨n, n, n⟩) ≤ R(⟨2ᵏ, 2ᵏ, 2ᵏ⟩) ≤ 7ᵏ`, and for `k ≥ 1`, `2ᵏ⁻¹ < n` gives
  `7ᵏ⁻¹ = (2ᵏ⁻¹)^(log₂ 7) < n^(log₂ 7)`, so `R(⟨n, n, n⟩) ≤ 7 n^(log₂ 7)` (also for `n = 1`).
- *`2^ω = ρ`, with `ρ = asympRank (mmTensor F 2)`.* `mmTensor F 2` is not zero, so `1 ≤ ⟨2, 2, 2⟩`
  and `R(⟨2ᵏ⟩_MM)^(1/k) → ρ` by `asympRank_spec` (three parties). If `τ` is in the set, then
  `R(⟨2ᵏ⟩_MM)^(1/k) ≤ C^(1/k) 2ᵗ`, so `ρ ≤ 2ᵗ`; the set is closed upwards (`C ≥ R(⟨1⟩) = 1 > 0`), so
  this holds for every `τ > ω`, and `ρ ≤ 2^ω`. Conversely `ρ ≥ 4` (flattening), and for `ε > 0`
  there is `C_ε` with `R(⟨2ᵏ⟩_MM) ≤ C_ε (ρ + ε)ᵏ` for all `k`; with `k = ⌈log₂ n⌉` as above,
  `R(⟨n, n, n⟩) ≤ C_ε (ρ + ε) n^(log₂(ρ + ε))`, so `ω ≤ log₂(ρ + ε)` for every `ε`, and
  `2^ω ≤ ρ`.

**Checks.**
- Strassen's identity, with the factor matrices of the route, holds exactly over `ℤ` in the
  indexing of `mmTensor`, and in Lean on the definition `mmTensor` itself over `ZMod 31` by
  `decide` (every coordinate difference over `ℤ` lies between `−8` and `8`); the seven products
  compute `ab` on `200` integer pairs.
- `mmTensor F n * mmTensor F m` equals `mmTensor F (n m)` after the regrouping of the route, a
  bijection of each index, for `n, m ≤ 3` (`0` included); `mmTensor F 1 = 1`.
- `4 < 7 < 8`, so `2 < log₂ 7 < 3`: the bounds on `ω` are not a single point. The padding
  inequality `7^k ≤ 7 n^(log₂ 7)` for `k = ⌈log₂ n⌉` and `n ≥ 2` is `k − 1 ≤ log₂ n`, which
  follows from the integer inequality `2^(k−1) < n`, true by the choice of `k`; for `n = 5` it reads
  `7³ = 343 ≤ 7 · 5^(log₂ 7)`, as `2² = 4 < 5`.

*Needs:* 1.3 (`asympRank_spec`), 3.1, 3.2 (Lemma G and the flattening bound); Mathlib
`finProdFinEquiv`, `Equiv.prodProdProdComm`, `Fin.divNat`, `Fin.modNat`, `Nat.clog`, `Real.logb`,
`Real.rpow_natCast`.

### Examples

`⟨2, 2, 2⟩`: tensor rank at most `7` (Strassen), flattening ranks `4`; `W` over `GF(2)`: rank `3`,
flattening ranks `2`.

### Dependencies

Layer 1; Tau Ceti `Matrix.exists_eq_mul_fin_rank`; Mathlib.

## Scope and ownership

This roadmap develops Strassen's theory of asymptotic spectra for preordered semirings, with
graphs and tensors as its two instances, and owns: Strassen preorders, the asymptotic preorder,
the asymptotic spectrum, abstract rank and subrank and their asymptotic versions, and the duality
theorem (Layer 1); the semiring of graphs with the cohomomorphism preorder, Zuiddam's theorem,
the additivity and cohomomorphism monotonicity of the theta function, the fractional clique cover
number and McEliece and Posner's theorem (Layer 2); restriction, tensor rank on tensors of
varying format (related in 3.1 to Mathlib's CP rank of holors), flattening ranks, matrix
multiplication tensors, Strassen's seven products and the exponent `ω` (Layer 3).

For graphs it builds on LovaszThetaFunction, whose theta function, strong product, Shannon
capacity and multiplicativity of the theta function it uses, and adds the additivity and
monotonicity that make the theta function a spectral point; it uses the linear-programming
duality of ConvexAnalysisAndDuality and the fractional covers and greedy bound of
ApproximationGuarantees. It restates none of their theorems: `Θ ≤ ϑ`, `ϑ(C₅) = √5` and
multiplicativity are LovaszThetaFunction 5.2, 5.3 and 3.2. Consequences such as
`Θ(G ⊔ H) ≤ ϑ(G) + ϑ(H)` (2.2 with LovaszThetaFunction 5.2) and `Θ ≤ fracCliqueCover` are not
stated separately.

Library survey. Pinned Mathlib has ordered semirings (`IsOrderedRing`, `IsStrictOrderedRing`,
`CanonicallyOrderedAdd`), the additive `Archimedean` class and order ring homomorphisms
`OrderRingHom`; 1.1 states how a Strassen preorder and its spectrum relate to them. It has no
preordered semiring with laws up to equivalence, no Positivstellensatz or Kadison–Dubois theorem,
no rank of a block-diagonal or Kronecker product of matrices, no strong graph product, no
fractional chromatic number and no Shannon capacity. It has holors and their CP rank,
`Holor.cprank` (`Mathlib/Data/Holor.lean`), for arrays whose dimensions form a list;
`tensorRank_ofHolor` (3.1) states that `tensorRank` agrees with it, and the Conventions say why
holors are not the carrier. It has the Kronecker product of two matrices, `Matrix.kronecker`, and
none of a family. Pinned Tau Ceti has the rank factorization `Matrix.exists_eq_mul_fin_rank`
(used in 3.2) with its companion `Matrix.rank_le_iff_exists_eq_mul`, the Kronecker power of one
matrix `Matrix.kroneckerPower` (the special case of restriction by one matrix at every party), and
nothing on asymptotic spectra.

Not treated here: Strassen's support functionals and the quantum functionals of Christandl, Vrana
and Zuiddam; border rank and degeneration; the asymptotic subrank of tensors (the survey,
Thm. 3.40, pp. 45–46, sketches that every nonzero tensor with three parties is gapped; the zero
tensor is not gapped in the sense of 1.3); Schönhage's τ-theorem and bounds on
`ω` below `log₂ 7`; the equality of the bilinear and arithmetic exponents of matrix
multiplication; arithmetic circuits and complexity classes; the Positivstellensätze of Becker and
Schwartz, Fritz and Vrana; the fractional Haemers bound and the projective rank; the asymptotic
relative cost.

These are the standard facts that the paper *VP ≠ VNP over every field* (Claude, Anthropic;
public repository `anthropics/formal-math`, branch `vp-vnp`, Apache-2.0) uses in a variant of
Strassen's theory. Its public Lean development (folder `vp-vnp/Ov`) also defines tensors with
restriction and the Kronecker product, and proves that restriction is a preorder compatible with
the product, that unit tensors multiply, and that, with a party present, a tensor is a restriction
of the unit tensor `⟨r⟩` exactly when it is a sum of `r` products of vectors. Its tensors,
restriction and product are the ones here up to enumerating index sets: there a tensor carries an
arbitrary finite index type for each party, and rank at most `r` is defined as being a
restriction of `⟨r⟩`; here a tensor has a dimension for each
party and coordinates indexed by `Fin`, as in Mathlib's holors, restriction is the action of a
Kronecker product of matrices, the rank is defined by CP decompositions, and the characterization
by restriction is the theorem `abstractRank_restrictLE`. No declaration is taken from that
development. The functionals on tensors that the paper calls spectral points are multiplicative
and subadditive over sums of restrictions rather than additive, a class it describes as larger
than Strassen's asymptotic spectrum; they are not treated here. Nothing here rests on the paper or
its development, which is not a pinned library and owns nothing here.

## Exact supplier contracts

### From Mathlib

- `Nat.unaryCast` (`Mathlib/Data/Nat/Cast/Defs.lean`) and `npowRec`: the numerals and powers of a
  type with `0`, `1`, `+`, `*`, by recursion.
- `IsStrictOrderedRing`, `Archimedean`, `OrderRingHom` (`→+*o`), `Nat.cast_le`: 1.1.
- `zorn_subset_nonempty`: 1.2. `Nat.sInf_mem`, `Submultiplicative.tendsto_lim`,
  `Subadditive.tendsto_lim`, `isCompact_univ_pi`, `IsClosed.isCompact`: 1.3.
- `SimpleGraph.sum` (`⊕g`), `SimpleGraph.Iso.sumComm`, `SimpleGraph.Iso.sumAssoc`,
  `SimpleGraph.Hom`, `SimpleGraph.Colorable`, `SimpleGraph.indepNum`, `SimpleGraph.IsClique`,
  `Equiv.prodComm`, `Equiv.prodAssoc`, `Equiv.prodSumDistrib`, `Fin.snocEquiv`: 2.1.
- `Real.sSup_empty`, `Matrix.fromBlocks`, `Matrix.PosSemidef.add`,
  `Matrix.posSemidef_vecMulVec_self_star`, `EuclideanSpace`, `finSumFinEquiv`: 2.2.
- `harmonic_le_one_add_log`: 2.4.
- `Matrix.of`, `Matrix.mulVec`, `Fin.divNat`, `Fin.modNat` (Batteries, through Mathlib),
  `Nat.sub_lt_left_of_lt_add`: the definitions of 3.1. `Matrix.rank`, `Matrix.rank_mul_le`,
  `Matrix.rank_reindex`, `Matrix.rank_one`, `Matrix.kronecker`, `Matrix.mul_kronecker_mul`,
  `Matrix.fromBlocks`, `finSumFinEquiv`, `finProdFinEquiv`, `finCongr`,
  `Equiv.piEquivPiSubtypeProd`, `Equiv.sumComm`, `Equiv.sumAssoc`: 3.1, 3.2.
  `Equiv.prodProdProdComm`, `Nat.clog`, `Real.logb`: 3.3.
- `Holor`, `Holor.CPRankMax1`, `Holor.CPRankMax`, `Holor.cprank`, `Holor.cprankMax_nil`
  (`Mathlib/Data/Holor.lean`; `Holor.cprank` needs a ring in `Type`), `List.forall₂_iff_get`: 3.1.
- For comparison only (Conventions): `PiTensorProduct`, `Basis.piTensorProduct`,
  `PiTensorProduct.map`, `Matrix.toLin'`, `SimpleGraph.boxProd`.

### From Tau Ceti

- `Matrix.exists_eq_mul_fin_rank` (`TauCeti/LinearAlgebra/Matrix/Rank.lean`): a matrix over a
  field with finitely many columns is `L * R` through `Fin (rank A)`; used in 3.2. Its companion
  `Matrix.rank_le_iff_exists_eq_mul` (rank at most `r` exactly when `A` factors through `Fin r`)
  says that for two parties `tensorRank t` is the rank of the matrix of coordinates of `t` (a
  decomposition with factor matrices `A 0`, `A 1` is the factorization `A 0 * (A 1)ᵀ`); it is not
  used.
- `Matrix.kroneckerPower` (`TauCeti/LinearAlgebra/Matrix/KroneckerPower.lean`): the matrix
  `∏ i, A (v i) (u i)` of one matrix `A` acting at every factor; for comparison only (Conventions):
  restriction uses the Kronecker product of a family of matrices, of which it is the constant
  case.

### From TauCetiRoadmap.LovaszThetaFunction

- 1.1 `lovaszTheta` (copied verbatim) and `isGreatest_lovaszTheta` (nonempty vertex type): 2.2.
- 1.2 `isLeast_orthonormalRepresentation` (nonempty vertex type; unit vectors in
  `EuclideanSpace ℝ (Fin N)`, nonadjacent distinct pairs orthogonal, `1 ≤ t ⟪c, uᵢ⟫²`): 2.2.
- 2.1 `indepNum_le_lovaszTheta` and `lovaszTheta_le_of_colorable_compl`: 2.2.
- 3.1 `strongProd` and `strongPow` (copied verbatim): 2.1. 3.2 `lovaszTheta_strongProd` (no
  hypothesis beyond `Fintype`): 2.2.
- 5.1 `shannonCapacity` (copied verbatim; the supremum over `k ≥ 1`): 2.1.

### From TauCetiRoadmap.ConvexAnalysisAndDuality

- 5.3 `linearProgramming_duality` (`A : Matrix m n ℝ`, feasibility `∃ x ≥ 0, A x = b` and a lower
  bound on `c ⬝ᵥ x`; optimal `x`, `y` with `Aᵀ y ≤ c` and equal values): 2.3.

### From TauCetiRoadmap.ApproximationGuarantees

- 1.1 `IsFractionalCover` (copied verbatim): 2.3, 2.4.
- 1.2 `gain`, `IsGreedy` and `IsGreedy.sum_cost_le_harmonic_mul` (nonnegative costs, sets of size
  at most `d`): 2.4. The extension of a greedy sequence, a prose bullet of 1.2, is proved in the
  route of 2.4.

## References

- J. Zuiddam, *Algebraic complexity, asymptotic spectra and entanglement polytopes*, PhD thesis,
  University of Amsterdam, 2018 (ILLC DS-2018-13), open access at the University of Amsterdam;
  printed pages. Cited as "thesis".
- A. Wigderson and J. Zuiddam, *Asymptotic spectra: theory, applications and extensions*, Bull.
  Amer. Math. Soc., final version 2025 from A. Wigderson's page; pages of that PDF. Cited as
  "survey".
- J. Zuiddam, *The asymptotic spectrum of graphs and the Shannon capacity*, Combinatorica 39
  (2019); arXiv:1807.00169v2. Cited as "Zuiddam 2019".
- D. E. Knuth, *The sandwich theorem*, Electron. J. Combin. 1 (1994), #A1; arXiv:math/9312214.
- V. Strassen, *Gaussian elimination is not optimal*, Numer. Math. 13 (1969); *The asymptotic
  spectrum of tensors*, J. reine angew. Math. 384 (1988). Not consulted; attributions in prose.
- R. J. McEliece and E. C. Posner, *Hide and seek, data storage, and entropy*, Ann. Math. Statist.
  42 (1971). Not consulted; the statement is taken from Zuiddam 2019.
