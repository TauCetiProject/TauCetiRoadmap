# Roadmap: heights, filtrations and adapted bases of nilpotent Lie algebras

**Summary.** A finite-dimensional nilpotent Lie algebra `L` over a field of characteristic zero
carries a group law, the Baker–Campbell–Hausdorff (BCH) product, and every quantitative theory of
nilpotent groups (nilmanifolds of bounded complexity, polynomial sequences, the inverse theory of
the Gowers norms) measures its objects through a basis of `L` and the heights of the rational
numbers that appear. This roadmap builds the algebra and arithmetic underneath: rational linear
algebra with explicit height bounds; structure constants and how their heights move under changes
of basis, subalgebras and quotients; filtrations of Lie algebras indexed by degrees, by degree–rank
pairs and by multidegrees, their adapted bases and associated graded algebras; the free nilpotent
models of each kind of filtration; squarefree polarisation; and the arithmetic of the BCH product
in coordinates of the first and second kind. Heights are those of Green and Tao: the height of a
rational `a/b` in lowest terms is `max(|a|, b)`.

The headline theorems are the following.

- **Effective rational linear algebra.** If an integer matrix of rank `r` has entries of absolute
  value at most `M`, its kernel over `ℚ` has a basis of integer vectors with entries at most
  `r! Mʳ`, and the projections, generalized inverses, annihilators, intersections and quotients
  built from it have entries of height at most `r! Mʳ` (or a stated power of it). Every flag
  whose members are spanned by vectors from a set `S` has an adapted basis drawn from `S`.
- **Universal BCH denominators.** In `log(exp X₁ ⋯ exp X_k)`, computed in the free associative
  algebra over `ℚ`, the coefficient of every word of length `n ≥ 1` lies in
  `(n! · lcm(1, …, n))⁻¹ ℤ`, and the absolute values of the coefficients of the words of length
  `n` sum to at most `20 (3k/2)ⁿ`.
- **Products in coordinates.** Let `L` have nilpotency class at most `s`, a basis `e` of dimension
  `d`, and rational structure constants in `D⁻¹ℤ` of absolute value at most `M`. The coordinates
  of a product of `k` elements are polynomials of total degree at most `s` in the coordinates of
  the factors, with coefficients in `(s! · lcm(1, …, s)² · D^{s−1})⁻¹ ℤ` and an explicit bound on
  the sum of their absolute values. Consequently products of any number of elements with
  coordinates in `q⁻¹ℤ` have coordinates in `(s! · lcm(1, …, s)² · D^{s−1} · qˢ)⁻¹ ℤ`, and the
  lattice `B · ⊕ᵢ ℤ eᵢ` is a subgroup as soon as `D · s! · lcm(1, …, s)²` divides `B`.
- **Coordinates of the second kind.** For a basis with Green and Tao's nesting property
  `[L, eⱼ] ⊆ span(e_{j+1}, …, e_d)`, the map `t ↦ exp(t₁e₁) ⋯ exp(t_d e_d)` is a bijection
  `Kᵈ → L`; it, its inverse and the group law in these coordinates are triangular polynomial maps,
  of degree at most `s` when the basis is adapted to a filtration, with coefficients of height
  polynomial in `D(M+1)` with exponents depending only on `d` and `s`.
- **Filtrations and free models.** Every degree filtration generates a canonical degree–rank
  filtration, the smallest one compatible with it. The free nilpotent Lie algebras of each kind
  (weighted, multidegree, degree–rank) have bases of bracketed Lyndon words with integer structure
  constants, and the free nilpotent Lie algebra of class `s` on `q` generators has dimension
  `Σ_{n ≤ s} (1/n) Σ_{m ∣ n} μ(m) q^{n/m}` (Witt).

The roadmap sits between these neighbours:

- **ScatteringDiagrams** §0.4 supplies the BCH group of a nilpotent Lie algebra over a
  commutative `ℚ`-algebra, the universal element `bchElement` and Dynkin's form of it. This
  roadmap computes with that group and does not rebuild it.
- **NilmanifoldsAndNilsequences** consumes the filtrations, adapted and nesting bases, height
  conventions, coordinate polynomials and grid theorems of this roadmap to define rational
  filtered nilmanifolds of bounded complexity, their Mal'cev coordinates, metrics and polynomial
  sequences.
- **ComplexKahlerGeometry** §8.2 owns Mal'cev rationality from a lattice and Γ-adapted Mal'cev
  bases; **RepresentationTheory/LieGroups** §§3.3 and 5.3 own the analytic BCH series and the
  global BCH group of a real nilpotent Lie group. This roadmap is purely algebraic and
  arithmetic, and needs neither.
- Mathlib supplies free Lie algebras, lower central series, bases, matrices and heights of
  rationals; Tau Ceti supplies bases adapted to a descending filtration.

**How to read the build.**

| Layer | Content |
|---|---|
| 0 | Heights of rationals, integral forms, grids and rational structures |
| 1 | Effective linear algebra over `ℚ`: kernels, images, intersections, projections, flags, echelon forms, lattices |
| 2 | Structure constants: heights under brackets, changes of basis, subalgebras, quotients |
| 3 | Filtrations of Lie algebras, adapted and nesting bases, the associated graded, Rees algebras |
| 4 | Lie trees, degree–rank filtrations and multidegree filtrations |
| 5 | Free nilpotent models: Lyndon bases, Witt's formula, weighted, multidegree and degree–rank models |
| 6 | Squarefree models and polarisation |
| 7 | Arithmetic of the BCH product in coordinates of the first kind |
| 8 | Coordinates of the second kind |

Layers 0–2 are linear algebra and need no filtration. Layers 3–6 are the filtration theory, over
an arbitrary commutative ring wherever no basis is chosen. Layers 7–8 combine Layers 2–3 with the
BCH group of ScatteringDiagrams §0.4.

## Conventions

1. **Scalars.** `R` is a commutative ring and `K` a field of characteristic zero, which contains
   `ℚ` (Mathlib's `algebraRat`). Statements that involve no basis are made over `R`; statements
   about bases over `K`; statements about heights over `ℚ`, or over `K` for a basis whose
   structure constants are rational. `ℝ` appears only in the real size estimates of 7.5.
2. **Heights.** The height of `q ∈ ℚ` is Mathlib's `Height.mulHeight₁ q`, which equals
   `max(|q.num|, q.den)` by `Rat.mulHeight₁_eq_max`; this is Green and Tao's height (GT,
   Definition 2.3). A vector, matrix, family or polynomial "has height at most `H`" when each of
   its entries, coordinates or coefficients does; statements spell this out as
   `∀ i, Height.mulHeight₁ (x i) ≤ H` and introduce no predicate. Coordinates are taken in a
   stated basis `e` through `e.repr`. This entrywise height is not Tau Ceti's projective entry
   height `Matrix.mulHeight` nor the height of a subspace (`Submodule.relativeSubspaceHeight`);
   0.2 compares them.
3. **Integral forms.** Sharp statements use the *integral form*: a family `x` of rationals "lies
   in `D⁻¹ℤ` with numerators at most `M`" when `D ≥ 1` and every `D xᵢ` is an integer of absolute
   value at most `M`. Statements spell this out as
   `∀ i, ∃ z : ℤ, (D : ℚ) * x i = z ∧ |z| ≤ M`. Layer 0 converts between the two forms.
4. **Grids.** For a basis `e` of a `K`-vector space `V` and an integer `q ≥ 1`, the grid
   `denomGrid e q` is the `ℤ`-span of the vectors `q⁻¹ eᵢ`, that is, the vectors whose
   `e`-coordinates lie in `q⁻¹ℤ`. The lattice `B · ⊕ᵢ ℤ eᵢ` is written `Λ_B(e)`.
5. **Rational structures.** For a `ℚ`-vector space `V` and a field `K ⊇ ℚ`, `V_K` is
   `K ⊗[ℚ] V`, and a `K`-subspace of `V_K` is *defined over `ℚ`* when it is
   `Submodule.baseChange K U` for a `ℚ`-subspace `U` of `V`. For `K = ℝ` this is the real
   realisation used by nilmanifold theory.
6. **Structure constants.** For a basis `e : Basis ι K L` of a Lie algebra,
   `lieStructureConst e i j l = e.repr ⁅e i, e j⁆ l`. The basis has *rational structure
   constants* when each of these is the image of a rational number; the rationals are then
   written `c i j l`.
7. **Filtrations.** An *ordering* is a commutative monoid `I` with a partial order, as in GTZ,
   Definition 6.7; the three used are `ℕ` (degree), `σ → ℕ` with the product order
   (multidegree), and the sector `DR = {(d, r) : r ≤ d}` of `ℕ ×ₗ ℕ` with the lexicographic order
   (degree–rank). An `I`-filtration of a Lie algebra `L` over `R` is a family of `R`-submodules
   `F_i`, `i ∈ I`, antitone in `i`, with `⁅F_i, F_j⁆ ⊆ F_{i+j}` (`LieFiltration I R L`; GTZ,
   Definition 6.8, for groups). It has *degree at most `d`* when `F_i = 0` for `i ⋠ d`, and
   *degree in `J`*, for a downset `J`, when `F_i = 0` for `i ∉ J`. Like GTZ, the structure does
   not require `F₀ = L`; for `ℕ`-filtrations the hypothesis `F₁ = L` (hence `F₀ = L`) is stated
   wherever it is used, and with it a filtration of degree at most `s` makes `L` nilpotent of
   class at most `s`.
8. **Lower central series.** Mathlib's `LieModule.lowerCentralSeries R L L n` is 0-based:
   `lowerCentralSeries R L L 0 = L`. In the 1-based Green–Tao indexing of filtrations its `n`-th
   term is `F_{n+1}`; class at most `s` means `lowerCentralSeries R L L s = ⊥`.
9. **Adapted bases.** A basis `e : Basis ι K L` with weights `ω : ι → ℕ`, all `ω i ≥ 1`, is
   *adapted* to an `ℕ`-filtration `F` when `F_j = span {e i | j ≤ ω i}` for every `j ≥ 1`
   (`IsAdapted F e ω`). These are the weights of Tau Ceti's
   `TauCeti.exists_basis_weight_of_antitone` applied to `k ↦ F_{k+1}`. A basis
   `e : Basis (Fin d) K L` has the *nesting property* when `⁅L, e j⁆ ⊆ span {e l | j < l}`
   for every `j`, that is `e.repr ⁅e i, e j⁆ l = 0` whenever `l ≤ j` (`IsNesting e`; GT,
   condition (A.1) of Lemma A.2). Corwin and Greenleaf call such bases strong Malcev bases, with
   the order of the basis reversed.
10. **The BCH group.** For a Lie algebra `L` of class at most `s` over a commutative `ℚ`-algebra,
    `BCHGroup L` is the group of ScatteringDiagrams §0.4 on the carrier `L`, written
    multiplicatively as `x ⋆ y`, with identity exponential. `exp(t x)` denotes the element `t x`
    of `BCHGroup L`. The `k`-fold product `x₁ ⋆ ⋯ ⋆ x_k` is associated in any way.
11. **Words and trees.** A *word* in an alphabet `X` is an element of `FreeMonoid X`, of length
    `|w|`; `[w]` is its right-normed bracket `[w₁, [w₂, …, [w_{n−1}, w_n]…]]` in a Lie algebra,
    with `[x] = x`. A *Lie tree* is an element of `FreeMagma X`; its leaves are its letters,
    `FreeMagma.length` counts them, and for `v : X → L` the evaluation `lieTreeEval v t` replaces
    each leaf `x` by `v x` and each product by a bracket.
12. **Constants.** `L_n = lcm(1, …, n)`, with `L₀ = 1`; `a! = ∏_σ a_σ!` and
    `binom(a + b, a) = ∏_σ binom(a_σ + b_σ, a_σ)` for multi-indices. "A constant depending only
    on `d` and `s`" means one natural number, given by the proof, independent of every other
    parameter; theorems with such constants are stated `∃ C E, ∀ …`.
13. **Names.** Names in code font are declarations of Mathlib or of the pinned Tau Ceti, or
    declarations of [`Suggested.lean`](Suggested.lean), which declares everything in its own
    namespace and uses plain names for what is proposed here as Mathlib-style
    (`LieFiltration`, `Module.Basis.IsNesting`, …). Names in italics are proposed names for
    targets not prototyped there. This README is the specification.

## Layer 0: heights of rationals, integral forms and grids

### 0.1 Heights and integral forms

Prove for rationals:

- `Height.mulHeight₁ q ≥ 1`, `Height.mulHeight₁ (-q) = Height.mulHeight₁ q`,
  `Height.mulHeight₁ q⁻¹ = Height.mulHeight₁ q`, and `Height.mulHeight₁ (n : ℚ) = max |n| 1` for
  integers `n`.
- `H(pq) ≤ H(p) H(q)` and `H(p + q) ≤ 2 H(p) H(q)`, with `H = Height.mulHeight₁`; more generally
  a sum of `n ≥ 1` rationals of height at most `H` has height at most `n Hⁿ`.
- **Integral form to height.** If `D ≥ 1` and `D q` is an integer of absolute value at most `M`,
  then `Height.mulHeight₁ q ≤ max D M`.
- **Height to integral form.** If `x : ι → ℚ` has height at most `H` and `ι` has `N` elements,
  then `D = ∏ᵢ (x i).den ≤ H^N` and every `D xᵢ` is an integer of absolute value at most `H^N`.
  The lcm of the denominators divides `D` and gives the same bounds.

**Checks.**

- `Height.mulHeight₁ (-3/4) = 4`, while `-3/4` lies in `4⁻¹ℤ` with numerator `3`.
- The integral form of `1/2` with `D = 4` has numerator `2`, and `max 4 2 = 4 ≥ 2 = H(1/2)`: the
  bound of the third item is not an equality.

*Needs:* Mathlib `Height.mulHeight₁`, `Rat.mulHeight₁_eq_max`.

### 0.2 Coordinate heights and comparisons

For a basis `e` of a `ℚ`-vector space, the coordinate height of a vector is the largest height of
its `e`-coordinates. Prove that it is invariant under reindexing `e` and under signs of basis
vectors, and that it does not increase under coordinate projections. Prove the comparison with
the projective height: for a nonzero `x ∈ ℚⁿ`, Mathlib's `Height.mulHeight x` is at most the
`n`-th power of the largest `Height.mulHeight₁ (x i)`, and for a vector of coprime integers it is
`max |xᵢ|` (Mathlib's `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`). Similarly, for a rational matrix
`A`, Tau Ceti's projective `Matrix.mulHeight A` is at most the product of the heights of its
entries.

*Needs:* 0.1; Mathlib `Height.mulHeight`; Tau Ceti `Matrix.mulHeight`
(NumberTheory/Height/Matrix.lean).

### 0.3 Grids and polynomial maps

Define `denomGrid e q` (Convention 4) and prove: `x ∈ denomGrid e q` if and only if every
`e.repr x i` lies in `q⁻¹ℤ`; `denomGrid e q ⊆ denomGrid e q'` when `q ∣ q'`; for `K = ℝ` the grid is
closed and discrete in the usual topology of the finite-dimensional space `V`; and
`Λ_B(e) = {x | ∀ i, e.repr x i ∈ Bℤ}`.

Prove the grid lemma for polynomials. If `P ∈ ℚ[x₁, …, x_N]` has total degree at most `s` and
`A · P` has integer coefficients, then `P` maps `(q⁻¹ℤ)^N` into `(A qˢ)⁻¹ℤ`. If the coefficients
of `P` have absolute values summing to at most `N₁`, then `|P(x)| ≤ N₁ · max(1, ‖x‖_∞)ˢ` for real
`x`.

Prove the counting lemma: a set of points of `q⁻¹ℤᵈ` whose coordinates have absolute value at most
`T` has at most `(2qT + 1)ᵈ` elements.

**Checks.**

- `P = x²/2` (so `A = 2`, `s = 2`) maps `x = 1/3` to `1/18 ∈ (2 · 3²)⁻¹ℤ`; it does not map `ℤ`
  into `ℤ`.

*Needs:* 0.1; Mathlib `Submodule.span`, `MvPolynomial`.

### 0.4 Rational structures

For a `ℚ`-vector space `V` and a field `K` of characteristic zero, prove that
`Submodule.baseChange K` is injective and order preserving, and commutes with `⊓`, `⊔`, images
and preimages under `ℚ`-linear maps, kernels and ranges; that `(V/U)_K ≅ V_K/U_K`; and that a
`K`-subspace of `V_K` is defined over `ℚ` if and only if it is spanned by vectors of `V`. For a
`ℚ`-Lie algebra `L`, `LieSubmodule.baseChange` of a Lie subalgebra or ideal is a Lie subalgebra
or ideal of `L_K`, and a basis of `L` gives a basis of `L_K` with the same structure constants.
These statements hold for any field extension and are stated for one.

*Needs:* Mathlib `Submodule.baseChange`, `LieSubmodule.baseChange`, `LieSubmodule.lie_baseChange`,
`Module.Flat`.

## Layer 1: effective linear algebra over `ℚ`

Throughout, `A` is an `m × n` integer matrix of rank `r` (over `ℚ`, Mathlib's `Matrix.rank` of
its image) with `|A i j| ≤ M`, `M ≥ 1`. Every theorem has a rational corollary through 0.1: a
rational matrix of height at most `H` with `n` columns has, row by row, an integer multiple with
the same kernel and entries at most `Hⁿ`. Every existence statement that does not mention a
height holds over any field and is stated over `K`.

### 1.1 Minors and Cramer's rule

Every `r × r` minor of `A` has absolute value at most `r! Mʳ` (Mathlib's `Matrix.det_le`), and
there are row and column sets `P`, `Q` of size `r` with `δ = det A_{P,Q} ≠ 0`. Prove the row-wise
form: if `|A i j| ≤ Mᵢ` then `|det A| ≤ n! ∏ᵢ Mᵢ`; and for a square `A` with `det A ≠ 0`, the
entries of `adjugate A` are at most `(n−1)! M^{n−1}` and the solution of `A x = b` for integer
`b` with `|bᵢ| ≤ M'` is `δ⁻¹` times an integer vector with entries at most `n! M^{n−1} M'`.

Prove that a matrix with linearly independent columns over a field has a nonzero maximal minor,
that among these there is one with lexicographically least row set, and that this minor is
unchanged by left multiplication by a lower unitriangular matrix.

*Needs:* Mathlib `Matrix.det_le`, `Matrix.adjugate`, `Matrix.cramer`, `Matrix.rank`.

### 1.2 Kernels, images, intersections, preimages

Prove:

- **Kernel.** `ker A` (over `ℚ`) has a basis of `n − r` integer vectors with entries of absolute
  value at most `r! Mʳ`: for each column `j ∉ Q`, the Cramer vector with `x_j = δ`, the other
  coordinates outside `Q` zero, and `x_Q` the solution of `A_{P,Q} x_Q = −δ A_{P,j}`.
- **Image.** `range A` has a basis consisting of `r` columns of `A`.
- **Intersection.** If `U = span(u₁, …, u_k)` and `W = span(w₁, …, w_l)` with integer entries at
  most `M`, then `U ∩ W` has a basis of integer vectors with entries at most `k · r! · M^{r+1}`,
  where `r` is the rank of the matrix `[u | −w]`. The intersection of kernels is the kernel of the
  stacked matrix.
- **Preimage and image under a map.** For `f` given by `A` and `W` as above, `f⁻¹(W)` is spanned
  by integer vectors with entries at most `r! Mʳ`, `r` the rank of `[A | −w]`, and `f(U)` by the
  integer vectors `A uᵢ`, with entries at most `n M²`.
- **Annihilator.** The annihilator of `span(u₁, …, u_k)` in the dual of `ℚⁿ` has a basis of
  integer functionals with coefficients at most `r! Mʳ`, `r` the dimension of the span.
- **Selection.** Each spanning family contains a basis of its span, so every bound above is also
  a bound for a basis.

**Checks.**

- `A = [1 1 1]` (`r = 1`, `M = 1`): the Cramer basis of `ker A` is `(−1, 1, 0)`, `(−1, 0, 1)`,
  with entries at most `1! · 1 = 1`.
- `A = [2 3]`: `ker A` is spanned by `(−3, 2)`, and no integer kernel vector has entries at most
  `1`, so the factor `Mʳ` cannot be replaced by `r!`.

*Needs:* 1.1.

### 1.3 Complements, projections and generalized inverses

Prove, with `P`, `Q`, `δ` as in 1.1:

- `ℚⁿ = ker A ⊕ span {e_j | j ∈ Q}`, and the projection onto `ker A` along it is `δ⁻¹ Π` with
  `Π` an integer matrix with entries at most `r! Mʳ`; hence all its entries have height at most
  `r! Mʳ`.
- The matrix `S` with `S_{Q,P} = A_{P,Q}⁻¹` and zeros elsewhere satisfies `A S A = A`, and its
  entries have height at most `r! Mʳ`. `1 − A S` is idempotent with kernel `range A`, and
  `1 − S A` is idempotent with range `ker A`, both of the same height bound.
- **Sections.** A surjective `A` (`r = m`) has a right inverse of height at most `r! Mʳ`; an
  injective `A` (`r = n`) has a left inverse of the same height.
- **Quotients.** For `U = span(u₁, …, u_k)` with integer entries at most `M` and `dim U = r`,
  there is a set `J` of `n − r` coordinates such that the images of `e_j`, `j ∈ J`, form a basis
  of `ℚⁿ/U`, and the coordinates in that basis of the image of every `eᵢ` have height at most
  `r! Mʳ`.
- **Block compatibility.** If `ℚⁿ` and `ℚᵐ` are direct sums of coordinate blocks indexed by a set
  `Δ` and `A` maps each block into the block with the same label, then the projections, `S` and
  the sections above can be chosen block-diagonal with the same bounds, by working block by block.
- **Filtered sections.** If `φ` maps each member `V_j` of a flag onto the member `W_j` of a
  flag, then `φ` has a right inverse mapping each `W_j` into `V_j` (over any field). Over `ℚ`, if
  the matrix of `φ` in bases adapted to the flags (1.4) is an integer matrix with entries at most
  `M`, the right inverse can be chosen with entries of height at most `C_n M^{E_n}`, for
  constants depending only on `n = dim V`.

*Needs:* 1.1, 1.2.

### 1.4 Bases adapted to flags

Over a field `K`: let `V = P₀ ⊇ P₁ ⊇ ⋯ ⊇ P_m` be subspaces of a finite-dimensional space and
`S ⊆ V` a set with `span (S ∩ P_i) = P_i` for every `i`. Prove that `S` contains a basis of `V`
adapted to every `P_i` (each `P_i` is spanned by the basis vectors it contains), and that the
basis can be indexed by `Fin (dim V)` with weights `w j = max {i | e_j ∈ P_i}` monotone. For
`S = V` this is Tau Ceti's `TauCeti.exists_basis_weight_of_antitone`. Over `ℚ`: if every `P_i`
is spanned by vectors of height at most `H` in a basis `e`, then the flag has an adapted basis of
vectors of height at most `H`.

**Checks.**

- In `ℚ²` with `P₁ = ℚ(1, 1)` and `S = {(1, 0), (0, 1), (1, 1)}`, the adapted basis must contain
  `(1, 1)`; the standard basis, though contained in `S`, is not adapted.

*Needs:* Tau Ceti `TauCeti.exists_basis_weight_of_antitone`; Mathlib `exists_linearIndependent`.

### 1.5 Reduced echelon bases

A `k`-dimensional subspace `U ⊆ Kⁿ` has a unique reduced column echelon basis: there is a
lexicographically least set `P` of `k` coordinates on which the projection `U → K^P` is
bijective, and the basis is the preimage of the standard basis of `K^P`. Prove:

- if `U` is spanned by the columns of an integer `n × k` matrix whose `k × k` minors have absolute
  value at most `C`, the entries of the reduced echelon basis are ratios of two such minors, hence
  rationals of height at most `C`;
- if `U ⊆ Kⁿ` is spanned by `k` vectors of `(l⁻¹ℤ)ⁿ` whose `k × k` minors have absolute value at
  most `C`, then `U` is defined over `ℚ` and its reduced echelon basis has height at most `lᵏ C`.

**Checks.**

- `U = span((2, 1))`: the reduced echelon basis is `(1, 1/2)`, the ratio of the minors `1` and
  `2`.

*Needs:* 1.1, 0.4.

### 1.6 Lattices cut out by rational maps

Let `B` be an integer `n × k` matrix of rank `k` with entries at most `M` and `δ` a nonzero
`k × k` minor (so `|δ| ≤ k! Mᵏ`). Prove
`ℤᵏ ⊆ {y ∈ ℚᵏ | B y ∈ ℤⁿ} ⊆ δ⁻¹ ℤᵏ` and `δ (ℤⁿ ∩ range B) ⊆ B ℤᵏ ⊆ ℤⁿ ∩ range B`. Prove that a
rational matrix whose entries lie in `D⁻¹ℤ` maps `(q⁻¹ℤ)ᵏ` into `(Dq)⁻¹ℤⁿ`.

Prove the counting bound: at most `((2M + 1)ⁿ + 1)ⁿ` subspaces of `ℚⁿ` are spanned by integer
vectors with entries at most `M`.

**Checks.**

- `B = (2)` (`n = k = 1`): `{y | 2y ∈ ℤ} = 2⁻¹ℤ`, so the outer inclusion is an equality for
  `δ = 2`.

*Needs:* 1.1, 1.2.

## Layer 2: structure constants

Let `L` be a Lie algebra over `K` with a basis `e : Basis ι K L`, `d = |ι|`, with rational
structure constants `c i j l` in `D⁻¹ℤ` with numerators at most `DM` (so `|c| ≤ M`).

### 2.1 Brackets in coordinates

Define `lieStructureConst`. Prove antisymmetry `c i j l = −c j i l` and the Jacobi identity in
coordinates, and conversely that any family `c` with these two identities is the family of
structure constants of a Lie algebra on `Kᵈ`. Prove: if the coordinates of `x` lie in `D_x⁻¹ℤ`
with absolute value at most `A`, and those of `y` in `D_y⁻¹ℤ` with absolute value at most `B`,
then those of `⁅x, y⁆` lie in `(D D_x D_y)⁻¹ℤ` with absolute value at most `d² A B M`; a
right-normed bracket of `n ≥ 1` such vectors, each with coordinates of absolute value at most `A`
in `D_x⁻¹ℤ`, has coordinates of absolute value at most `(d² M)^{n−1} Aⁿ` in
`(D^{n−1} D_xⁿ)⁻¹ℤ`. In particular the coordinates of `[e_{i₁}, …, e_{i_n}]` are at most
`d^{n−2} M^{n−1} ≤ (dM)^{n−1}` for `n ≥ 2`.

**Checks.**

- The Heisenberg algebra `TauCeti.heisenberg ℚ` with basis `X, Y, Z` (Tau Ceti's
  `TauCeti.heisenbergBasis`, of the vectors `heisenbergX`, `heisenbergY`, `heisenbergZ`) has `c X Y Z = 1`, `c Y X Z = −1` and all other
  constants zero, so `D = M = 1`.

*Needs:* Mathlib `Module.Basis`, `LieAlgebra`; Tau Ceti `TauCeti.heisenberg`.

### 2.2 Changes of basis

Let `b_i = Σ_a P_{ia} e_a` with `P` an invertible integer matrix with entries at most `M_P`.
Prove that the structure constants of `b` lie in `(D · det P)⁻¹ℤ` and have absolute value at most
`d³ (d−1)! M_P^{d+1} M`, through the transport formula
`c'_{ij}{}^l = Σ_{a, a', m} P_{ia} P_{ja'} c_{aa'}{}^m (P⁻¹)_{ml}` and 1.1. Prove the rational
version: if `b` has height at most `H` in `e` and `e` has structure constants of height at most
`H`, the structure constants of `b` have height at most `C_d H^{E_d}` for constants depending only
on `d`.

*Needs:* 2.1, 1.1, 0.1.

### 2.3 Subalgebras, ideals, quotients and homomorphisms

Prove:

- **Subalgebras.** If a Lie subalgebra `S ⊆ L` of dimension `k` has a basis `b` of integer
  vectors in `e`-coordinates with entries at most `M_b`, and `δ` is a nonzero `k × k` minor of
  its coordinate matrix, then the structure constants of `S` in `b` lie in `(D δ)⁻¹ℤ` with
  absolute value at most `k! d² M_b^{k+1} M`.
- **Generated subalgebras.** If `L` has class at most `s`, the Lie subalgebra generated by a set
  `T` is spanned by the right-normed brackets of at most `s` elements of `T`; with 2.1 and 1.2
  this gives bounded bases of generated subalgebras and ideals.
- **Quotients.** If an ideal `I` is spanned by integer vectors with entries at most `M_I` and has
  dimension `r`, the images of `e_j`, `j ∈ J` (1.3), form a basis of `L/I` whose structure
  constants lie in `(D δ)⁻¹ℤ` with absolute value at most `d · r! · M · M_I^r`.
- **Homomorphisms.** An injective Lie homomorphism whose matrix is an integer matrix with
  entries at most `M'` has a linear left inverse, and a surjective one a linear section, of the
  heights of 1.3. The image of `e` under an injective homomorphism is a basis of its image with
  the structure constants of `e`; for a surjective one, a basis of the target formed by images of
  basis vectors has the structure constants of the quotient bullet.
- **Products and scalars.** The union of bases of `L₁` and `L₂` is a basis of `L₁ × L₂` with the
  structure constants of the factors, and likewise for finite products; base change to `K ⊇ ℚ`
  keeps the structure constants (0.4).

*Needs:* 2.1, 2.2, 1.2, 1.3.

## Layer 3: filtrations, adapted bases and the associated graded

### 3.1 Filtrations

Define `LieFiltration I R L` (Convention 7) and, for `ℕ`, prove:

- every `F_i` with `F₁ = L` is a Lie ideal, `⁅L, F_i⁆ ⊆ F_{i+1}`, and the top nonzero layer of a
  filtration of degree at most `s` is central;
- the lower central filtration `F_n = lowerCentralSeries R L L (n − 1)` (with `F₀ = L`) is a
  filtration with `F₁ = L`, and it is the smallest: every filtration with `F₁ = L` contains it
  termwise; hence `F₁ = L` and degree at most `s` give class at most `s`;
- products, pullbacks along Lie homomorphisms, pushforwards along surjections, quotients by ideals
  `(F_i + I)/I`, restrictions `F_i ∩ S` to subalgebras, base change, and the rescaling
  `F^{(m)}_i = F_{⌈i/m⌉}` are filtrations (GTZ, Examples 6.13 and 6.14, for groups), with the
  evident degrees (`m s` for the rescaling);
- for an ordering `I`, an `I`-filtration `F` and an additive monoid homomorphism `ν : I → ℕ`, the
  family `n ↦ ⨆_{ν i ≥ n} F_i` is an `ℕ`-filtration; 4.3 uses it for total and weighted
  degree.

**Checks.**

- For the Heisenberg algebra the lower central filtration is `F₁ = L`, `F₂ = RZ`, `F₃ = 0`.
- `F₀ = L`, `F_i = 0` for `i ≥ 1` is a filtration of degree at most `0` of every Lie algebra,
  nilpotent or not; it shows why `F₁ = L` is needed for the class bound.

*Needs:* Mathlib `LieModule.lowerCentralSeries`, `LieIdeal`, `LieSubmodule.Quotient`; Tau Ceti
`TauCeti.lie_lowerCentralSeries_le`.

### 3.2 Adapted bases and the nesting property

Over `K`, for an `ℕ`-filtration with `F₁ = L` and degree at most `s`:

- there is a basis adapted to `F` (`IsAdapted`), indexed by `Fin (dim L)` with monotone weights in
  `[1, s]` (from 1.4 or `TauCeti.exists_basis_weight_of_antitone`);
- for an adapted basis, `e.repr ⁅e i, e j⁆ l = 0` unless `ω l ≥ ω i + ω j` (compare
  `Module.Basis.repr_lie_eq_zero_of_weight_lt` in Tau Ceti for the lower central series);
- a basis adapted with monotone weights has the nesting property (`IsNesting`), and a basis with
  the nesting property makes every `span {e l | l ≥ j}` an ideal and `L` nilpotent of class at
  most `dim L`;
- for nilpotent `L`, `IsNesting e` holds if and only if every `span {e l | l ≥ j}` is an ideal;
- **heights.** Over `ℚ`, with a reference basis `e₀` of structure constants in `D⁻¹ℤ` of size at
  most `M`: if every `F_j` is spanned by integer vectors (in `e₀`-coordinates) with entries at
  most `M_F`, then there is a basis adapted to `F` with monotone weights, hence nesting,
  consisting of such vectors, with structure constants as in 2.2 with `M_P = M_F`.

**Checks.**

- The Heisenberg basis `(X, Y, Z)` with weights `(1, 1, 2)` is adapted to the lower central
  filtration and nesting; the order `(X, Z, Y)` is not nesting, since `[X, Y] = Z` is not in the
  span of the basis vectors after `Y`.

*Needs:* 3.1, 1.4, 2.2; Tau Ceti `TauCeti.exists_basis_weight_of_antitone`,
`TauCeti.exists_basis_weight_lowerCentralSeries`, `Module.Basis.repr_lie_eq_zero_of_weight_lt`.

### 3.3 The associated graded Lie algebra

For an `ℕ`-filtration with `F₁ = L` over `R`, define *assocGraded F* as the external direct sum
`⊕_{j ≥ 1} F_j / F_{j+1}` with the bracket induced by `F_i × F_j → F_{i+j}`; prove it is a Lie
algebra over `R`, graded by `ℕ` with pieces in positive degrees, of class at most `s` when `F`
has degree at most `s`. Define the piece maps `σ_j : F_j → gr_j` (kernel `F_{j+1}`, with
`σ_{i+j} ⁅x, y⁆ = ⁅σ_i x, σ_j y⁆`) and prove functoriality for filtered homomorphisms
(`φ(F_j) ⊆ G_j`), surjectivity of `gr φ` for strict surjections, and that an `ℕ`-graded Lie
algebra with its degree filtration is isomorphic to its associated graded. Prove:

- an adapted basis `(e, ω)` gives the basis `σ_{ω i}(e i)` of the associated graded, whose
  structure constants are `c i j l` when `ω l = ω i + ω j` and `0` otherwise, so heights do not
  increase;
- a basis has *homogeneous brackets* for `ω` when `c i j l = 0` unless `ω l = ω i + ω j`; then
  the spans of the `e i` with `ω i = j` grade `L` and `L ≅ assocGraded F`;
- **refiltration.** For a graded Lie subalgebra `U ⊆ assocGraded F`, the sets
  `{x ∈ F_j | σ_j x ∈ U_j}` form a filtration of the Lie subalgebra `{x | σ₁ x ∈ U₁}`.

**Checks.**

- The lower central filtration of the Heisenberg algebra is its own associated graded: the basis
  has homogeneous brackets for `ω = (1, 1, 2)`. The filtration `F₁ = L`, `F₂ = F₃ = RZ`,
  `F₄ = 0` of the same algebra has abelian associated graded (`gr₁ = L/RZ`, `gr₂ = 0`,
  `gr₃ = RZ`): the associated graded depends on the filtration.

*Needs:* 3.1, 3.2; Mathlib `DirectSum`, `GradedLieAlgebra`, `LieSubmodule.Quotient`.

### 3.4 Rees algebras

For an `(σ → ℕ)`-filtration `F` with `F₀ = L`, the *Rees algebra* is the Lie subalgebra
`Rees F = {Σ_a t^a ⊗ x_a | x_a ∈ F_a}` of `R[t_σ] ⊗[R] L` (the Lie algebra of Mathlib's
`LieAlgebra.ExtendScalars`), and `Rees⁺ F` its ideal of elements with `x₀ = 0`. Prove that these
are Lie subalgebras, graded by monomials; that a degree filtration with weights `w : σ → ℕ`
pulls back to the multidegree filtration `a ↦ F_{Σ w_σ a_σ}`, whose Rees algebra is the algebra
of `w`-adapted polynomials `{Σ_a t^a ⊗ x_a | x_a ∈ F_{Σ w_σ a_σ}}`; and that substitutions
`t_σ ↦ λ_σ t_σ` with `λ ∈ Rˣ` act by graded automorphisms. NilmanifoldsAndNilsequences builds
polynomial sequences on these algebras.

*Needs:* 3.1; Mathlib `MvPolynomial`, `LieAlgebra.ExtendScalars.instLieAlgebra`.

## Layer 4: Lie trees, degree–rank filtrations and multidegree filtrations

### 4.1 Lie trees

Define `lieTreeEval` and the weight of a tree for `w : X → ℕ` (the sum of the weights of its
leaves). Prove: `lieTreeEval` is natural under Lie homomorphisms; it is multilinear in the leaf
occurrences; for an `ℕ`-filtration and leaves `v x ∈ F_{w x}`, a tree of weight `n` evaluates
into `F_n`; for positive weights, a tree has at most its weight many leaves; and the number of
trees with at most `n` leaves over an alphabet with `q` letters is at most `(q + 2)^{3ⁿ}`. The
Lie subalgebra generated by `v(X)` is spanned by the evaluations of trees, and already by the
right-normed brackets of words.

*Needs:* Mathlib `FreeMagma`, `FreeMagma.length`, `FreeLieAlgebra.lift`.

### 4.2 Degree–rank filtrations

A *degree–rank filtration* is a `DR`-filtration `G` with `G_{(0,0)} = L` and
`G_{(d,0)} = G_{(d,1)}` for `d ≥ 1` (`DegreeRankLieFiltration`; GTZ, Definition 6.9 and the
paragraph after it). Its degree–rank is at most `(s, r)` when it has degree at most `(s, r)` in
the lexicographic order. Prove:

- `d ↦ G_{(d,0)}` is an `ℕ`-filtration of degree at most `s` (GTZ, Example 6.11);
- the layers listed in lexicographic order form a descending chain, and when `G_{(1,0)} = L`,
  `⁅L, G_p⁆ ⊆ G_{p⁺}` with `p⁺` the successor of `p` in `DR`, so the chain is a central series;
- iterated brackets of `x_j ∈ G_{(i_j,0)}` with `Σ i_j > s`, or `Σ i_j = s` and more than `r`
  terms, vanish (GTZ, Example 6.10).

**The canonical degree–rank filtration.** For an `ℕ`-filtration `F` with `F₁ = L`, define for
`(d, r) ∈ DR` the layer `F_{(d,r)} = F_{d+1} + span T(d, max(r, 1))`, where `T(d, r)` is the set
of evaluations of trees with at least `r` leaves, each leaf an element `x_j ∈ F_{i_j}` with
`i_j ≥ 1` and `Σ i_j = d` (*canonicalDegreeRank*; this is the construction of GTZ, Example 6.11,
with leaves of positive degree). Prove:

- it is a degree–rank filtration with `F_{(d,0)} = F_{(d,1)} = F_d`; if `F` has degree at most
  `s`, its degree–rank is at most `(s, s)`;
- **minimality.** If `G` is a degree–rank filtration and `φ : L → L'` a Lie homomorphism with
  `φ(F_d) ⊆ G_{(d,0)}` for every `d`, then `φ(F_{(d,r)}) ⊆ G_{(d,r)}`;
- **generators.** If `(e, ω)` is an adapted basis, `F_{(d,r)}` is `F_{d+1}` plus the span of the
  evaluations at basis vectors of trees of weight `d` (for `ω`) with at least `max(r, 1)` leaves.

**Checks.**

- `ℝ` with `G_{(d',r')} = ℝ` for `(d', r') ≤ (d, 1)` and `0` otherwise has degree–rank at most
  `(d, 1)` (GTZ, Example 6.12).
- For the free nilpotent algebra of class 3 on two generators of degree 1 (5.3), `F_{(3,3)}` is
  spanned by `[x, [x, y]]` and `[y, [y, x]]` and `F_{(3,2)} = F_{(3,1)} = F_3`, since a leaf may be
  the degree-2 element `[x, y]`.

*Needs:* 3.1, 4.1.

### 4.3 Multidegree filtrations

A multidegree filtration is an `(σ → ℕ)`-filtration `F` with `F₀ = L`, of degree at most
`β ∈ ℕ^σ` or in a finite downset `J`. Prove (GTZ, Example 6.11):

- the total-degree filtration `T_n = ⨆_{|a| ≥ n} F_a` is an `ℕ`-filtration of degree at most
  `max_{a ∈ J} |a|`, with `T₁ = L` when `⨆_{a ≠ 0} F_a = L`;
- more generally, for weights `c : σ → ℕ`, `T^c_n = ⨆_{Σ c_σ a_σ ≥ n} F_a` is an `ℕ`-filtration
  of degree at most `max_{a ∈ J} Σ c_σ a_σ`;
- conversely an `ℕ`-filtration `F` of degree at most `s` gives the multidegree filtration
  `a ↦ F_{|a|}` in the downset `{|a| ≤ s}`;
- the strict upper layer `F_{>a} = ⨆_σ F_{a + e_σ}` lies in `F_a`, is stable under brackets
  with `F_0`, contains `⁅F_b, F_a⁆` for every `b ≠ 0`, and vanishes at the maximal elements of
  `J`;
- products, pullbacks and quotients as in 3.1.

**Checks.**

- Multidegree at most `(1, 1)` (compare GTZ, Example 6.10): `F_{(1,0)}` and `F_{(0,1)}` are
  abelian and stable under brackets with `F_0`, and `⁅F_{(1,0)}, F_{(0,1)}⁆ ⊆ F_{(1,1)}`. If
  moreover `⨆_{a ≠ 0} F_a = L`, then `F_{(1,1)}` is central. Without that hypothesis it need not
  be: on the two-dimensional Lie algebra with `[a, b] = b`, the layers `F_{(0,0)} = L` and
  `F_{(1,0)} = F_{(0,1)} = F_{(1,1)} = Rb` form a filtration of multidegree at most `(1, 1)` whose
  layer `F_{(1,1)}` is not central.

*Needs:* 3.1.

## Layer 5: free nilpotent models

### 5.1 Lyndon bases and Witt's formula

Fix a total order on `X`. A *Lyndon word* is a nonempty word strictly smaller, in the
lexicographic order, than each of its proper suffixes; its *standard bracketing* is defined by
splitting at its longest proper Lyndon suffix. Prove over every commutative ring `R`:

- `FreeLieAlgebra R X` is graded by `ℕ^{(X)}` (multidegree in the letters), hence by word length,
  and the degree-`≥ n+1` part is `lowerCentralSeries R _ _ n`;
- the standard bracketings of Lyndon words form a basis of `FreeLieAlgebra R X` as an `R`-module;
  in particular it is free, and `FreeLieAlgebra R X ≅ R ⊗[ℤ] FreeLieAlgebra ℤ X`;
- the structure constants in this basis are integers, independent of `R`;
- for finite `X` with `q` letters, the number of Lyndon words of length `n` is
  `w_q(n) = (1/n) Σ_{m ∣ n} μ(m) q^{n/m}` (Witt's formula), and for a field this is the dimension
  of the degree-`n` piece.

*Route:* in the free associative algebra (Mathlib's
`FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra`), the word expansion of the standard
bracketing of a Lyndon word `w` is `w` plus larger words, which gives independence over every
ring; rewriting brackets of basis elements with integer coefficients gives spanning over `ℤ`, and
base change gives every `R`. Over `ℚ`, PBW
(`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`) and the Lyndon factorisation of
words compare Hilbert series and give Witt's formula.

**Checks.**

- `q = 2`: `w_2(n) = 2, 1, 2, 3, 6` for `n = 1, …, 5`; with letters `x < y` the Lyndon words of
  length at most 3 are `x, y, xy, xxy, xyy`.

*Needs:* Mathlib `FreeLieAlgebra`, `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra`,
`FreeMonoid`, `ArithmeticFunction.moebius`; Tau Ceti
`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`.

### 5.2 Word expansions

Through `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra` and
`FreeAlgebra.equivMonoidAlgebraFreeMonoid`, every element of `FreeLieAlgebra R X` has word
coefficients. Prove: the word expansion of a Lie tree with `n` leaves has integer coefficients
whose absolute values sum to at most `2^{n−1}`; the Dynkin–Specht–Wever identity
`[P] = n P` for homogeneous Lie elements of degree `n`, where `[·]` right-brackets words linearly
(for `X = Fin 2` over `ℚ` this is the route of ScatteringDiagrams §0.4 and is consumed from
there); an element lies in `lowerCentralSeries R _ _ s` if and only if its word coefficients of
length at most `s` vanish; and lifting into a Lie algebra of class at most `s` factors through
truncation at length `s`.

*Needs:* 5.1.

### 5.3 Free nilpotent, weighted and multidegree models

Let `X` carry multidegrees `μ : X → ℕ^σ ∖ {0}` and let `J ⊆ ℕ^σ` be a finite downset. The *free
`J`-model* is `FreeLieAlgebra R X` modulo the span of homogeneous elements whose multidegree is
not in `J`, filtered by `F_a` = the span of homogeneous elements of multidegree `≥ a`. Prove:

- that span is a Lie ideal, and the model is free with basis the Lyndon words of multidegree in
  `J`, with integer structure constants; its filtration has degree in `J`;
- **universal property.** For a multidegree filtration `G` of degree in `J` on `L` and
  `f : X → L` with `f x ∈ G_{μ x}`, there is a unique Lie homomorphism from the model extending
  `f`, and it maps `F_a` into `G_a`.

Special cases, each with its own name and statement: the *free nilpotent Lie algebra*
`FreeLieAlgebra R X ⧸ lowerCentralSeries R _ _ s` (`σ = Unit`, `μ = 1`,
`J = {0, …, s}`), of dimension `Σ_{n ≤ s} w_q(n)` over a field; and the *free weighted model* of
class `s` (`σ = Unit`, weights `w = μ ≥ 1`), with basis the Lyndon words of weight at most `s`,
of dimension at most `(s + 1)(q + 1)ˢ`.

**Checks.**

- The free nilpotent Lie algebra of class 2 on two generators is the Heisenberg algebra
  (dimension `2 + 1 = 3`); of class 3, dimension `2 + 1 + 2 = 5`.

*Needs:* 5.1, 4.3, 3.1.

### 5.4 Free degree–rank models

For weights `w : X → ℕ_{≥1}` and `r ≤ s`, the *free degree–rank model* of degree–rank at most
`(s, r)` is `FreeLieAlgebra R X` modulo the span of the homogeneous elements of weight `> s`, or of
weight `s` and length `> r`. Prove:

- this is an ideal; the model has basis the Lyndon words of weight `< s`, or of weight `s` and
  length `≤ r`, with integer structure constants;
- its canonical degree–rank filtration (4.2, from the weight filtration) is spanned, in layer
  `(d, r')`, by the basis words of weight `> d`, or of weight `d` and length `≥ max(r', 1)`, and
  has degree–rank at most `(s, r)`;
- **universal property.** For a degree–rank filtration `G` of degree–rank at most `(s, r)` and
  `f : X → L` with `f x ∈ G_{(w x, 1)}`, there is a unique Lie homomorphism from the model
  extending `f`, and it maps the canonical layers into `G`.

**Checks.**

- Letters `x < x'` of weight 1 and `y` of weight 2, `(s, r) = (3, 2)`: the basis is
  `x, x', y, [x, x'], [x, y], [x', y]` (dimension 6), while the free weighted model of class 3
  also keeps the Lyndon words `xxx'`, `xx'x'` (dimension 8).

*Needs:* 5.1, 5.3, 4.2.

## Layer 6: squarefree models and polarisation

Let `F` be a multidegree filtration indexed by `σ → ℕ`, `ι` a finite set and `π : ι → σ` a block
map; for `S ⊆ ι` write `blockDeg S ∈ ℕ^σ` for the numbers of elements of `S` in each block. Let
`Λ_ι = R[h_i | i ∈ ι] / (h_i² | i ∈ ι)`, a free `R`-module with basis `h^S`, `S ⊆ ι`, and
`h^S h^T = h^{S ∪ T}` for disjoint `S`, `T` and `0` otherwise.

### 6.1 The squarefree algebra

Define *squarefreeAlgebra F π* as the set of `Σ_{S ≠ ∅} h^S ⊗ x_S` in `Λ_ι ⊗[R] L` with
`x_S ∈ F_{blockDeg S}`. Prove it is a Lie subalgebra, of class at most `|ι|`; that
`c ↦ span {h^S ⊗ x | 1_S ≥ c}` is an `(ι → ℕ)`-filtration of degree at most `(1, …, 1)` and
`n ↦ span {h^S ⊗ x | |S| ≥ n}` an `ℕ`-filtration of degree at most `|ι|`; and that every
permutation `τ` of `ι` with `π ∘ τ = π` acts by Lie automorphisms preserving both filtrations
(permuting the first), giving an action of `∏_σ Sym(π⁻¹ σ)`.

*Needs:* 4.3; Mathlib `MvPolynomial`, `Ideal.Quotient`, `LieAlgebra.ExtendScalars`.

### 6.2 Polarisation

The algebra map `ρ_π : R[t_σ] → Λ_ι`, `t_σ ↦ Σ_{π i = σ} h_i`, satisfies
`ρ_π(t^a) = a! Σ_{blockDeg S = a} h^S`. Prove that `ρ_π ⊗ id` is a Lie homomorphism mapping
`Rees⁺ F` (3.4) into `squarefreeAlgebra F π`, invariant under the block permutations of 6.1. For
`a ∈ ℕ^σ` let `P_a x = Σ_{blockDeg S = a} h^S ⊗ x`; prove the polarisation identity
`⁅P_a x, P_b y⁆ = binom(a + b, a) · P_{a+b} ⁅x, y⁆`. For the replicated block map
`π : Σ_σ Fin β_σ → σ`, prove that the coefficient of `h^ι` is invariant under the block
permutations and equals `β! x_β` on `ρ_π(Σ_a t^a ⊗ x_a)`.

**Checks.**

- `ι = {1, 2}`, one block, `a = 1`: `⁅x(h₁ + h₂), y(h₁ + h₂)⁆ = 2 ⁅x, y⁆ h₁h₂`, matching
  `binom(2, 1) = 2`.

*Needs:* 6.1, 3.4.

## Layer 7: arithmetic of the BCH product

### 7.1 Universal coefficients

For `k, s ≥ 1`, let `β_k(w)` be the coefficient of the word `w ∈ FreeMonoid (Fin k)` in
`Σ_{j=1}^{s} ((−1)^{j+1}/j) uʲ`, where `u = ∏_{a<k} (Σ_{m ≤ s} X_a^m/m!) − 1` in
`FreeAlgebra ℚ (Fin k)` (`bchWordCoeff k s w`). Prove that `β_k(w)` does not depend on `s ≥ |w|`,
and:

- **denominators.** For `|w| = n ≥ 1`, `n! · L_n · β_k(w) ∈ ℤ`;
- **size.** `Σ_{|w| = n} |β_k(w)| ≤ 20 (3k/2)ⁿ`.

*Route:* the coefficient of a word in `u` is `1/∏_a m_a!` for a nondecreasing word with letter
multiplicities `m_a`, and `0` otherwise; a product of such coefficients over a decomposition of a
word of length `n` has denominator dividing `n!`, and `j ≤ n`. For the size, the `ℓ¹` norm of the
degree-`n` part of `uʲ` is at most the coefficient of `tⁿ` in `(e^{kt} − 1)ʲ`, and for a power
series `g` with nonnegative coefficients `[tⁿ] g ≤ g(ρ)/ρⁿ`; take
`g = Σ_{j≥1} (e^{kt} − 1)ʲ = (e^{kt} − 1)/(2 − e^{kt})` and `ρ = 2/(3k)`, where
`g(ρ) = (e^{2/3} − 1)/(2 − e^{2/3}) < 19`.

**Checks.**

- `k = 2`: `β(XY) = 1/2`, `β(YX) = −1/2`, `β(XXY) = 1/12`; `2! · L_2 · 1/2 = 2` and
  `3! · L_3 · 1/12 = 3` are integers.

*Needs:* Mathlib `FreeAlgebra`, `FreeAlgebra.equivMonoidAlgebraFreeMonoid`, `FreeMonoid`.

### 7.2 The `k`-fold Dynkin form

For a Lie algebra `L` of class at most `s` over a commutative `ℚ`-algebra and `x : Fin k → L`,
prove `x₀ ⋆ ⋯ ⋆ x_{k−1} = Σ_{n=1}^{s} Σ_{|w| = n} (β_k(w)/n) [x ∘ w]` in `BCHGroup L`
(`dynkinProduct s x` in `Suggested.lean` is the right-hand side). For `k = 2` this is
ScatteringDiagrams' Dynkin form of `bchElement`; for general `k` it follows from the identity
`exp(X₀) ⋯ exp(X_{k−1}) = exp(b)` in the truncated enveloping algebra of the free Lie algebra on
`k` letters, obtained by iterating ScatteringDiagrams §0.4, and the Dynkin–Specht–Wever identity
(5.2). Deduce: with `D_s = s! · L_s²`, every coefficient `β_k(w)/n` with `n ≤ s` lies in
`D_s⁻¹ℤ`.

**Checks.**

- In the Heisenberg algebra, `X ⋆ Y = X + Y + Z/2` and `Y ⋆ X = X + Y − Z/2`.

*Needs:* 7.1, 5.2; ScatteringDiagrams §0.4 (`BCHGroup`, `bchElement`, its Dynkin form).

### 7.3 Product polynomials in coordinates of the first kind

Let `L` over `K` have class at most `s ≥ 1` and a basis `e : Basis (Fin d) K L` with rational
structure constants in `D⁻¹ℤ` of absolute value at most `M`. Prove that for every `k ≥ 1` there
are polynomials `P_l ∈ ℚ[x_{a,i} | a < k, i < d]` such that:

- the `l`-th coordinate of `x₀ ⋆ ⋯ ⋆ x_{k−1}` is `P_l` evaluated at the coordinates of the `x_a`;
- `P_l` has total degree at most `s`, and `D_s · D^{s−1} · P_l` has integer coefficients;
- the absolute values of the coefficients of `P_l` sum to at most
  `20 Σ_{n=1}^{s} (3kd/2)ⁿ (dM)^{n−1}`;
- the part of `P_l` of degree one is `Σ_a x_{a,l}`.

*Route:* expand 7.2 multilinearly in the basis and use 2.1 and 7.1.

Prove also:

- **conjugation.** The matrix of `y ↦ x ⋆ y ⋆ x⁻¹`, which is `Σ_{j<s} (ad x)ʲ/j!`
  (ScatteringDiagrams §0.4: conjugation by `exp x` is `TauCeti.expAd`), has entries that are
  polynomials of degree at most `s − 1` in the coordinates of `x`, with coefficients in
  `((s−1)! D^{s−1})⁻¹ℤ` whose absolute values sum to at most `Σ_{j<s} (d² M)ʲ / j!`;
- **inverses.** `x⁻¹ = −x`.

**Checks.**

- Heisenberg (`d = 3`, `D = M = 1`, `s = 2`, `k = 2`): `P_Z = x_{0,Z} + x_{1,Z} +
  (x_{0,X} x_{1,Y} − x_{0,Y} x_{1,X})/2`, with denominator `2`, which divides `D_2 = 8`.

*Needs:* 7.1, 7.2, 2.1.

### 7.4 Grids and lattices closed under products

Prove, with `e`, `D`, `s` as in 7.3:

- **grid closure.** If `x₀, …, x_{k−1} ∈ denomGrid e q`, then
  `x₀ ⋆ ⋯ ⋆ x_{k−1} ∈ denomGrid e (D_s D^{s−1} qˢ)`, for every `k`;
- **lattice criterion.** An additive subgroup `Λ ⊆ L` with `⁅Λ, Λ⁆ ⊆ D_s · Λ` is a subgroup of
  `BCHGroup L`: a bracket of `n ≥ 2` elements of `Λ` lies in `D_s^{n−1} Λ`;
- **stable lattices.** If `D · D_s` divides `B`, then `Λ_B(e)` is a subgroup of `BCHGroup L`, and
  so is every `Λ_{B'}(e)` with `B ∣ B'`; hence every subgroup `Γ` with `Λ_l(e) ⊆ Γ` contains
  the subgroup `Λ_{lcm(l, D D_s)}(e)`;
- **maps.** Under a Lie homomorphism whose matrix has entries in `D'⁻¹ℤ`, grids and stable
  lattices map into grids with denominators multiplied by `D'`, and preimages under an injective
  one obey 1.6.

**Checks.**

- Heisenberg: `Λ_2(e)` is a subgroup (`2X ⋆ 2Y = 2X + 2Y + 2Z`), but `Λ_1(e) = ℤ³` is not, since
  `X ⋆ Y = X + Y + Z/2`. The criterion asks for `8 ∣ B`, so it is sufficient, not necessary.

*Needs:* 7.3, 0.3, 1.6.

### 7.5 Real size estimates

For `K = ℝ`, prove: if the coordinates of the `x_a` are at most `T ≥ 1` in absolute value, those of
their product are at most `N_P Tˢ`, with `N_P` the bound of 7.3; and on that box each
coordinate of the product is Lipschitz in each factor for the sup norm on coordinates, with
constant `s N_P T^{s−1}`.

*Needs:* 7.3, 0.3.

## Layer 8: coordinates of the second kind

Let `L` over `K` have class at most `s` and a basis `e : Basis (Fin d) K L` with the nesting
property and rational structure constants in `D⁻¹ℤ` of absolute value at most `M`. Write
`ψ(t) = exp(t₀ e₀) ⋆ ⋯ ⋆ exp(t_{d−1} e_{d−1})` (GT, Definition A.1).

### 8.1 The coordinate map

Prove (GT, Lemma A.2 (i)):

- the first-kind coordinates of `ψ(t)` are `t_l + p_l(t₀, …, t_{l−1})` with polynomials `p_l` of
  total degree at most `s` and no terms of degree below two;
- `ψ : Kᵈ → L` is a bijection, and its inverse is `u ↦ t` with `t_l = u_l + p̃_l(u₀, …, u_{l−1})`
  for polynomials `p̃_l` of degree at most `s^{l}`;
- if `e` is adapted to a filtration with monotone weights `ω`, the `p_l` and `p̃_l` are of weighted
  degree at most `ω l` when `t_i` has weight `ω i`, hence of degree at most `s`, and
  `ψ(t) ∈ F_j` if and only if `t_i = 0` for every `i` with `ω i < j`;
- there are constants `C`, `E` depending only on `d` and `s` such that all coefficients of the
  `p_l` and `p̃_l` are rationals of height at most `C (D (M + 1))^E`.

**Checks.**

- Heisenberg, `(e₀, e₁, e₂) = (X, Y, Z)`: `ψ(a, b, c) = aX + bY + (c + ab/2) Z`, matching the
  matrix `[[1, a, ab + c], [0, 1, b], [0, 0, 1]]` under `X = E₁₂`, `Y = E₂₃`, `Z = E₁₃`.

*Needs:* 7.3, 3.2.

### 8.2 The group law and changes of basis

Prove (GT, Lemma A.3, and Lemma A.2 (ii)):

- `ψ(t) ⋆ ψ(u) = ψ(v)` with `v_l = t_l + u_l + P_l(t_{<l}, u_{<l})` and `ψ(t)⁻¹ = ψ(t')` with
  `t'_l = −t_l + P̃_l(t_{<l})`, for polynomials of degree bounded in terms of `d` and `s`, of
  weighted degree at most `ω l` (hence of degree at most `s`) for an adapted basis with monotone
  weights, and with coefficients of height at most `C (D(M+1))^E`;
- for a Lie subalgebra `S` with a nesting basis `e'` whose vectors have rational `e`-coordinates
  of height at most `H`, the maps `ψ_e⁻¹ ∘ ψ_{e'}` and `ψ_{e'}⁻¹ ∘ ψ_e` (on `ψ_e(S)`) are
  polynomial, of degree bounded in terms of `d` and `s`, with coefficients of height at most
  `C (D (M + 1) H)^E`;
- **grids.** If `t ∈ (q⁻¹ℤ)ᵈ` then the first-kind coordinates of `ψ(t)` lie in
  `(A qˢ)⁻¹ℤ` for a common denominator `A` of the `p_l`, and conversely with a common
  denominator and the degrees of the `p̃_l`.

**Checks.**

- Heisenberg: `ψ(a, b, c) ⋆ ψ(a', b', c') = ψ(a + a', b + b', c + c' − a' b)`, the product of the
  two matrices of 8.1.

*Needs:* 8.1, 7.3, 2.2.

## Worked examples

- **Heisenberg.** The running example: structure constants (2.1), adapted and nesting bases
  (3.2), the BCH product and its denominators (7.2–7.4), and coordinates of the second kind
  (8.1–8.2), all checked against unitriangular matrices.
- **Free nilpotent algebras.** Class 3 on two generators: dimension 5 by Witt's formula (5.1),
  its canonical degree–rank filtration (4.2) and its free degree–rank quotients (5.4).

## Downstream consumers

NilmanifoldsAndNilsequences takes from this roadmap the definition of filtrations (3.1, 4.2,
4.3), adapted and nesting bases with their heights (3.2), the height conventions and grids
(Layer 0), the coordinate polynomials and lattice criteria (7.3–7.4), and the coordinates of the
second kind (Layer 8), and adds lattices, nilmanifolds, metrics and polynomial sequences. The
quantitative inverse theorem for the Gowers norms (NilsequenceEquidistribution and
GowersInverseTheorem) uses the free degree–rank and multidegree models (5.3–5.4), the squarefree
polarisation (Layer 6) and the effective linear algebra (Layer 1). PolynomialOrbitsAndCubeGroups
uses the filtrations and the associated graded.

## Scope and ownership

This roadmap owns:

- the conversion between heights and integral forms of rationals, coordinate heights, grids
  `denomGrid` and the grid lemma for polynomial maps;
- effective rational linear algebra with entrywise heights: Cramer bounds, kernel, image,
  intersection, preimage, annihilator and quotient bases, projections, generalized inverses and
  sections (block-diagonal and filtered forms included), flag-adapted bases drawn from spanning
  sets, reduced echelon bases and their heights, lattices cut out by rational maps, counts of
  height-bounded subspaces;
- structure constants, their behaviour under brackets, changes of basis, subalgebras, generated
  subalgebras, quotients, homomorphisms and products;
- `I`-filtrations of Lie algebras for an ordering `I`, the lower central filtration, adapted bases,
  the nesting property, the associated graded Lie algebra, homogeneous-bracket bases,
  refiltrations and Rees algebras;
- Lie trees, degree–rank filtrations of Lie algebras, the canonical degree–rank filtration and its
  minimality, and multidegree filtrations with their total and weighted degree filtrations;
- the multidegree grading and Lyndon basis of free Lie algebras over a commutative ring, Witt's
  formula, word expansions of Lie trees, and the free nilpotent, weighted, multidegree and
  degree–rank models with their universal properties;
- the squarefree algebra of a multidegree filtration, its block-permutation action and the
  polarisation map;
- the universal BCH word coefficients `β_k(w)`, their denominators and `ℓ¹` bounds, the `k`-fold
  Dynkin form, coordinate polynomials of products and conjugation, grid closure, the lattice
  criterion and real size estimates;
- coordinates of the second kind for nesting bases, their polynomial transition maps and group law
  with height bounds.

It does not own:

- **ScatteringDiagrams §0.4:** `bchElement`, `BCHGroup` and its functoriality, subgroups and
  quotients, Dynkin's form for two letters, the nilpotent exponential and logarithm, conjugation
  as `TauCeti.expAd`, and the word-length grading of `FreeLieAlgebra ℚ (Fin 2)`. 5.1 proves the
  grading for every alphabet and ring; §0.4 needs only its special case and need not consume it.
- **RepresentationTheory/LieGroups §§3.3 and 5.3:** the analytic BCH series, the global BCH group
  of a real nilpotent Lie group, its Lie group structure, and the exponential map of an abstract
  Lie group with its one-parameter subgroups.
- **ComplexKahlerGeometry §8.2:** lattices `Γ` in simply connected nilpotent Lie groups, Mal'cev
  rationality `𝔤_ℚ = span_ℚ(log Γ)`, Γ-adapted Mal'cev bases and the lattice and quotient
  arguments. Layers 3 and 8 here start from a given rational structure and need no lattice.
- **NilmanifoldsAndNilsequences:** nilmanifolds, Mal'cev bases in the sense of GT, Definition 2.1
  (conditions (iii)–(iv) on `G` and `Γ`), rationality of subgroups relative to a lattice, metrics
  on `G` and `G/Γ` (GT, Definition 2.2 and Lemma A.4 onwards), polynomial sequences, the
  Lazard–Leibman group, polynomial symbols, nilsequences and nilcharacters.
- **NilsequenceEquidistribution and GowersInverseTheorem:** every construction whose only use is
  the inverse theorem: square and dilation-pair filtrations, comparison and additive-triple
  layers, symbol factorisations and corrections, and the quasi-polynomial budgets of that
  argument.
- **PolynomialOrbitsAndCubeGroups:** Host–Kra cube groups. The squarefree algebra of Layer 6
  satisfies `h_i² = 0` and is not the Lie algebra of a cube group.
- **SuccessiveMinima, DiophantineApproximationAndTranscendence and Tau Ceti:** Siegel's lemma
  (Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le`), the Bombieri–Vaaler theorem,
  projective and Arakelov heights of matrices and subspaces, successive minima, Mahler bases and
  lattice reduction. Layer 1 gives elementary Cramer bounds for whole bases, not shortest
  vectors.
- **AnabelianGeometryAndNonabelianChabauty:** unipotent algebraic groups over a field of
  characteristic zero as schemes.
- **YoungIntegrationAndRoughPaths:** free nilpotent groups as group-like elements of truncated
  tensor algebras.
- **Mathlib:** free Lie algebras and their universal property, lower central series, bases,
  determinants, adjugates, Smith normal form and `ZLattice`.

The following are outside this roadmap: saturated sublattices and bases adapted to flags of
sublattices of `ℤⁿ`; Hall bases other than the Lyndon basis; explicit sizes of the integer
structure constants of free nilpotent Lie algebras.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- **Heights.** `Height.mulHeight₁`, `Height.mulHeight`, `Rat.mulHeight₁_eq_max`,
  `Rat.mulHeight_eq_max_abs_of_gcd_eq_one` (NumberTheory/Height/Basic.lean,
  NumberTheory/Height/NumberField.lean).
- **Linear algebra.** `Module.Basis`, `exists_linearIndependent`, `Matrix.det_le`
  (LinearAlgebra/Matrix/AbsoluteValue.lean), `Matrix.adjugate`, `Matrix.cramer`
  (LinearAlgebra/Matrix/Adjugate.lean), `Matrix.rank` (LinearAlgebra/Matrix/Rank.lean),
  `Submodule.baseChange` (LinearAlgebra/TensorProduct/Tower.lean), `Module.Flat`,
  `Int.Matrix.exists_ne_zero_int_vec_norm_le` (NumberTheory/SiegelsLemma.lean, boundary only).
- **Lie algebras.** `LieAlgebra`, `LieSubalgebra`, `LieIdeal`, `LieSubmodule.lieSpan`,
  `LieSubmodule.Quotient`, `LieModule.lowerCentralSeries`, `LieRing.IsNilpotent`,
  `LieSubmodule.baseChange`, `LieSubmodule.lie_baseChange` (Algebra/Lie/BaseChange.lean),
  `LieAlgebra.ExtendScalars.instLieAlgebra`, `GradedLieAlgebra` (Algebra/Lie/Graded.lean).
- **Free objects.** `FreeLieAlgebra`, `FreeLieAlgebra.lift`,
  `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra` (Algebra/Lie/Free.lean), `FreeAlgebra`,
  `FreeAlgebra.equivMonoidAlgebraFreeMonoid` (Algebra/FreeAlgebra.lean), `FreeMonoid`,
  `FreeMagma`, `FreeMagma.length`.
- **Other.** `MvPolynomial`, `DirectSum`, `ArithmeticFunction.moebius`, `IsNilpotent.exp`.

### From Tau Ceti

At Tau Ceti `2fd255d`:

- `TauCeti.exists_basis_weight_of_antitone` (LinearAlgebra/Basis/Filtration.lean).
- `TauCeti.exists_basis_weight_lowerCentralSeries`, `TauCeti.lie_lowerCentralSeries_le`,
  `Module.Basis.repr_lie_eq_zero_of_weight_lt` (Algebra/Lie/LowerCentralSeries.lean).
- `TauCeti.heisenberg`, `TauCeti.heisenbergX`, `TauCeti.heisenbergY`, `TauCeti.heisenbergZ`,
  `TauCeti.heisenbergBasis` (Algebra/Lie/Heisenberg.lean).
- `TauCeti.expAd` (Algebra/Lie/InnerAutomorphism.lean).
- `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`
  (Algebra/Lie/UniversalEnveloping/PBW/Injective.lean).
- `Matrix.mulHeight` (NumberTheory/Height/Matrix.lean), compared in 0.2.

### From TauCetiRoadmap.ScatteringDiagrams

§0.4: *bchElement c* in `FreeLieAlgebra ℚ (Fin 2)` modulo `lowerCentralSeries c`, with the
identity `exp(X) exp(Y) = exp(ι_c(bchElement c))` in `U(𝔣)/(U⁺)^{c+1}`; *BCHGroup* of a Lie
algebra of class at most `c` over a commutative `ℚ`-algebra, with identity exponential, inverse
`−x`, functoriality *BCHGroup.map*, and conjugation by `exp x` equal to `TauCeti.expAd x`; Dynkin's
form of *bchElement c*; and the Dynkin–Specht–Wever identity for two letters used in its route.
Layers 7 and 8 use no other item.

## Provenance

This roadmap was extracted from a Lean development of Hindman's finite sums-and-products
theorem, part of whose code is derived from openai/math (Apache-2.0, commit `adc7f124`). That
source contains quantitative versions over `ℚ` of the following:
- denominators of BCH coordinate polynomials, with non-explicit universal constants, and the
  closure of grids under products with quasi-polynomial bounds;
- BCH-stable integral lattices `Bℤᵈ` with `B` bounded by a universal constant times `H^{d³} l`;
- height-bounded kernel, image and intersection bases through iterated Cramer bounds, bounded
  sections and projections, block-compatible and realified versions;
- filtration-adapted central bases selected from bounded spanning sets, and structure-constant
  heights under changes of basis;
- degree–rank filtrations generated by filtered Lie trees, multidegree filtrations, weighted free
  nilpotent models with tree generators, and the squarefree polarisation algebra.

This roadmap sharpens the bounds (explicit universal denominators `n! L_n`, kernel bounds
`r! Mʳ`), generalises from `ℚ` to fields of characteristic zero and commutative rings where no
height appears, and adds the Lyndon basis, Witt's formula, the multidegree and degree–rank free
models with integer structure constants, and coordinates of the second kind. The source is not
prescriptive.

## References

- [GT] B. Green and T. Tao, *The quantitative behaviour of polynomial orbits on nilmanifolds*,
  Ann. of Math. 175 (2012) 465–540, arXiv:0709.3562: Definitions 2.1, 2.3, 2.4, A.1 and Lemmas
  A.2, A.3 (Layer 0 heights, Layer 8).
- [GTZ] B. Green, T. Tao and T. Ziegler, *An inverse theorem for the Gowers U^{s+1}[N]-norm*,
  Ann. of Math. 176 (2012) 1231–1372, arXiv:1009.3998: Definitions 6.7–6.9, Examples 6.10–6.14
  (Layers 3–4).
- L. J. Corwin and F. P. Greenleaf, *Representations of nilpotent Lie groups and their
  applications, Part I*, Cambridge University Press 1990, Chapter 1 (Malcev bases, Layer 3.2).
- C. Reutenauer, *Free Lie Algebras*, London Math. Soc. Monographs 7, Oxford University Press
  1993 (Lyndon bases, Witt's formula, Dynkin–Specht–Wever; Layer 5).
- J.-P. Serre, *Lie Algebras and Lie Groups*, Lecture Notes in Math. 1500, Springer 1992,
  Part I, Chapter IV (free Lie algebras, Hall bases, the Hausdorff series).
- J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds for the inverse theorem for the Gowers
  U^{s+1}[N]-norm*, arXiv:2402.17994 (the consumer of Layers 1, 5 and 6).
- OpenAI, openai/math at commit `adc7f124` (Apache-2.0): the formalization summarised under
  Provenance.
