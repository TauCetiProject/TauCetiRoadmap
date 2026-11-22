# Roadmap: zero-dimensional ideals

**Summary.** A system of polynomial equations in finitely many variables over a field `k` has
only finitely many solutions over an algebraically closed field exactly when its quotient ring
`A = k[x]/I` is a finite-dimensional vector space over `k`. Such an ideal is called
zero-dimensional, and the roadmap studies what `A` knows about the solutions: how many there are,
where they are, how many are real, and when they can be written in triangular form. Variables
form an arbitrary type, finite where a statement says so. Apart from the finiteness theorem
itself, every theorem assumes `A` finite-dimensional, since Lean gives an infinite-dimensional
space dimension `0`.

The main results:

- *Counting points.* The number of solutions in any field extension of `k` is at most `dim A`.
  Over a perfect field, with solutions counted over an algebraically closed extension, equality
  holds exactly when `I` is radical; over `𝔽₂(t)` the prime ideal `(x² + t)` has one solution.
- *Stickelberger's theorem.* Over an algebraically closed field, the characteristic polynomial of
  multiplication by `f` on `A` is the product of `(X − f(a))^μ(a)` over the solutions `a`, where
  `μ(a)` is the dimension of the local ring of `A` at `a`. The eigenvalues of multiplication by
  `f` are the values of `f` at the solutions.
- *Real solutions.* Over `ℝ`, the quadratic form `α ↦ trace(α² h)` on `A` has signature equal to
  the number of real solutions where `h > 0` minus the number where `h < 0`, each solution counted
  once. The trace form of a finite-dimensional commutative real algebra has `r₁ + r₂` positive and
  `r₂` negative squares, with `r₁` and `r₂` the numbers of maximal ideals with residue field `ℝ`
  and `ℂ`.
- *Radical and shape.* Over a perfect field, `I` is radical exactly when the minimal polynomial
  of each variable in `A` is squarefree. If `I` is proper and has `dim A` solutions over some
  field, with distinct last coordinates, its reduced lexicographic Gröbner basis is
  `x_i − q_i(x_n)`, `r(x_n)` with `deg r = dim A`. Over an infinite field, a linear form then
  separates the solutions of any such ideal, so a linear change of coordinates gives distinct
  last coordinates; over `𝔽₂`, no linear form separates the four points of `𝔽₂²`.

The roadmap builds on the Gröbner-basis layer of GroebnerGeometry, proved in Tau Ceti: its
standard-monomial basis turns finite dimension into a statement about leading monomials, its
elimination theorem computes the univariate polynomials of the radical criterion, and its reduced
Gröbner bases carry the shape lemma. Mathlib supplies the Nullstellensatz, Artinian rings,
semisimple endomorphisms and signatures of quadratic forms.

Layer 1 proves the finiteness theorem and the count of points. Layer 2 defines the multiplicity
of a point and proves the eigenvalue theorem, Stickelberger's formula and the joint eigenvectors.
Layer 3 treats trace forms. Layer 4 proves the radical criterion and the formula for the
radical. Layer 5 characterises ideals with a shape lemma and proves the shape lemma with its
linear change of coordinates.

## Conventions

- **Rings and points.** `k` and `K` are fields, `σ` is a type of variables, `I` an ideal of
  Mathlib's `MvPolynomial σ k`, and `A = MvPolynomial σ k ⧸ I`, with `x_i` the class of `X i`.
  The points of `I` over a field `K` with `[Algebra k K]` are Mathlib's
  `MvPolynomial.zeroLocus K I`, the `a : σ → K` at which every member of `I` vanishes.
  A point `a` is the same as the
  `k`-algebra map `A → K` sending `x_i` to `a i`; this bijection is used throughout.
- **Finite dimension.** Zero-dimensionality is always the hypothesis
  `Module.Finite k (MvPolynomial σ k ⧸ I)`, never `finrank ≠ 0`: Mathlib's `Module.finrank` is
  `0` for an infinite-dimensional space, and `Nat.card` and `Set.ncard` are `0` for an infinite
  set. The unit ideal is allowed: `A = 0`, no points, `dim A = 0`, and `I` is radical.
- **Multiplication maps.** For `f` the map `m_f` is Mathlib's `Algebra.lmul k A (mk I f)`, a
  `k`-linear endomorphism of `A`. In the standard-monomial basis of Tau Ceti's
  `MonomialOrder.IsGroebnerBasis.basisQuotient` the matrix of `m_(x_i)` is what Sturmfels (2002),
  §2.3, p. 17, calls the `i`-th companion matrix of `I`.
  Characteristic polynomials are Mathlib's `LinearMap.charpoly`, the
  monic `det(X − m_f)`; Cox writes `det(m_f − X)`, which differs by `(−1)^(dim A)`.
- **Monomial orders.** Monomial orders are Mathlib's `MonomialOrder σ`; leading monomials are
  `m.degree`. The lexicographic order `MonomialOrder.lex` on `Fin (n + 1)` follows the antitone
  convention of GroebnerGeometry G1: `X 0 > X 1 > ⋯ > X n`, so the last variable
  `X (Fin.last n)` is the smallest and plays the part of `x_n` in the shape lemma.
- **Signature.** For a real quadratic form `Q`, `sigPos Q` and `sigNeg Q` are Mathlib's maximal
  dimensions of subspaces on which `Q` is positive, respectively negative, definite; the signature
  is `sigPos Q − sigNeg Q`. For a symmetric matrix they are the numbers of positive and negative
  eigenvalues (Sylvester's law of inertia, Mathlib's
  `QuadraticForm.sigPos_of_equiv_weightedSumSquares`).

**Checks.**
- Charpoly sign: for `A = K[x]/(x − 2)` and `f = x`, `m_f` is the `1 × 1` matrix `(2)` and
  `LinearMap.charpoly` gives `X − 2`; Cox's `det(m_f − X)` is `2 − X`.
- Lex direction: in `ℚ[X 0, X 1]` the leading monomial of `X 1 ^ 5 + X 0` for `MonomialOrder.lex`
  is `X 0`; a convention with `X 1` largest would give `X 1 ^ 5`.

## Layer 1: finite dimension and the number of points

### 1.1 The finiteness theorem

Prove `finiteness_tfae`: for a finite type of variables `σ`, a monomial order `m`, an ideal `I`
of `MvPolynomial σ k` and an algebraically closed field `K` with `[Algebra k K]`, the following
are equivalent:

1. `A` is finite-dimensional over `k`;
2. the set `m.standardMonomials I` of exponents divisible by no leading monomial of a nonzero
   member of `I` is finite;
3. for every variable `i` some pure power `single i n` is the leading monomial of a nonzero member
   of `I`;
4. for every variable `i` some nonzero univariate polynomial `p` has `p(X i) ∈ I`;
5. `zeroLocus K I` is finite.

The equivalence of 1 and 5 is stated in Cox (2020), p. 1, with a reference to Cox–Little–O'Shea,
*Ideals, Varieties, and Algorithms*, Chapter 5, §3, Theorem 6; Sturmfels (2002), Proposition 2.1,
p. 13, states the equivalence of 2 and 5 over `ℚ` without proof. (Proved here.)

Route.
- (1 ⇔ 2) Over a field `I` is a Gröbner basis of itself (Tau Ceti
  `MonomialOrder.isGroebnerBasis_self`) whose nonzero members have unit leading coefficients, so
  `MonomialOrder.IsGroebnerBasis.basisQuotient` is a basis of `A` indexed by
  `m.standardMonomials I`; a module with a basis is finite exactly when the index set is
  (`Module.Finite.finite_basis`, `Module.Finite.of_basis`).
- (2 ⇒ 3) The exponents `single i n`, `n ∈ ℕ`, are pairwise distinct, so one of them is not
  standard: it lies above the leading monomial of a nonzero `p ∈ I`, and an exponent below
  `single i n` is `single i n'` for some `n' ≤ n`.
- (3 ⇒ 2) If `single i nᵢ` is a leading monomial of `I` for every `i`, a standard exponent `c`
  has `c i < nᵢ` for every `i`, so it lies in a finite box (here `σ` finite is used).
- (1 ⇒ 4) Each `x_i` is integral over `k`; its minimal polynomial is nonzero and vanishes at
  `x_i`, that is, maps into `I`.
- (4 ⇒ 1) `A` is generated by the finitely many integral elements `x_i`, hence finite
  (`Algebra.finite_adjoin_of_finite_of_isIntegral`).
- (1 ⇒ 5) Points are `k`-algebra maps `A → K`; distinct such maps are linearly independent over
  `K` (Dedekind, `linearIndependent_monoidHom`) in the `K`-space of `k`-linear maps `A → K`, whose
  dimension is `dim A`, so there are finitely many.
- (5 ⇒ 1) Put `J = I.map (MvPolynomial.map (algebraMap k K))`; it has the same points. For each
  `i` the polynomial `pᵢ = ∏ (T − a i)` over the finitely many points vanishes on them, so
  `pᵢ(X i)` lies in `J.radical` by the Nullstellensatz
  (`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`, `σ` finite) and a power of it lies in `J`.
  By (4 ⇒ 1) over `K`, `K[x]/J` is finite over `K`. It is the base change `K ⊗ A`
  (`MvPolynomial.algebraTensorAlgEquiv`, `Algebra.TensorProduct.quotIdealMapEquivTensorQuot`), and
  a `k`-basis of `A` is a `K`-basis of `K ⊗ A` (`Algebra.TensorProduct.basis`), so `A` is finite.

**Checks.**
- `K` algebraically closed is needed for 5: `I = (x² + y²) ⊆ ℝ[x, y]` is a lexicographic Gröbner
  basis of itself with leading monomial `x²`, so every `x^a y^b` with `a ≤ 1` is standard and `A`
  is infinite-dimensional, while `(0, 0)` is the only real point. No pure power of `y` is a
  leading monomial, so 3 fails as well.
- `σ` finite is needed for 3 ⇒ 1: with `σ = ℕ` and `I` generated by all `X i ^ 2`, condition 3
  holds, but the squarefree monomials are standard and `A` is infinite-dimensional.
- For `(x² − y, y² − 1) ⊆ ℚ[x, y]` the generators are a Gröbner basis for both the graded reverse
  lexicographic and the lexicographic order `x > y`; the standard monomials are `1, y, x, xy`, so
  `dim A = 4`, and the leading monomials `x²`, `y²` are the pure powers of 3.
- The unit ideal: `1 ∈ I` has leading monomial `single i 0 = 0` for every `i`, no exponent is
  standard, and all five conditions hold.

*Needs:* Tau Ceti `MonomialOrder.standardMonomials`, `MonomialOrder.isGroebnerBasis_self`,
`MonomialOrder.IsGroebnerBasis.basisQuotient` (GroebnerGeometry G1); Mathlib
`MvPolynomial.zeroLocus`, `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`, `minpoly`,
`Algebra.finite_adjoin_of_finite_of_isIntegral`, `linearIndependent_monoidHom`,
`Module.Finite.finite_basis`, `Module.Finite.of_basis`, `MvPolynomial.algebraTensorAlgEquiv`,
`Algebra.TensorProduct.quotIdealMapEquivTensorQuot`, `Algebra.TensorProduct.basis`.

### 1.2 The number of points and the radical

Prove `card_zeroLocus_eq_finrank_iff_isRadical`: if `k` is perfect, `K` is algebraically closed
with `[Algebra k K]` and `A` is finite-dimensional, then
`Nat.card (zeroLocus K I) = finrank k A` if and only if `I` is radical. (Proved here; Sturmfels
(2002), Proposition 2.1, p. 13, states over `ℚ` that the number of points counted with
multiplicity is the number of standard monomials, which is the content of 2.3 below.)

When `A` is finite-dimensional, the inequality `Nat.card (zeroLocus K I) ≤ finrank k A`, for every
field `K ⊇ k`, is Mathlib's `card_algHom_le_finrank` read through the bijection between points and
`k`-algebra maps `A → K`; it is not a separate target. Without finite dimension it fails:
`ℝ[x, y]/(x² + y²)` has the real point `(0, 0)` and `finrank` `0`.

Route. (⇒, any `K`) If `I` is not radical, `A` has a nonzero nilpotent element, every map
`A → K` kills the nilradical `N`, and so the maps factor through `A/N`, of dimension
`< dim A`; by `card_algHom_le_finrank` there are fewer than `dim A` of them. (⇐) If `I` is
radical, `A` is reduced (`Ideal.isRadical_iff_quotient_reduced`) and Artinian
(`IsArtinianRing.of_finite`), so `A ≅ ∏ L_𝔪` over its maximal ideals with `L_𝔪 = A/𝔪` finite
field extensions of `k` (`IsArtinianRing.equivPi`). Each `L_𝔪` is separable because `k` is perfect
(`Algebra.IsAlgebraic.isSeparable_of_perfectField`). A map from a finite product of fields to a
field factors through exactly one factor, and a finite separable extension `L` has exactly
`[L : k]` embeddings into the algebraically closed `K`
(`Field.finSepDegree_eq_finrank_of_isSeparable` with `Field.embEquivOfIsAlgClosed`).
Summing, there are `∑ [L_𝔪 : k] = dim A` points.

**Checks.**
- Perfectness is needed: over `k = 𝔽₂(t)` the polynomial `x² + t` is irreducible (Eisenstein at
  `t`), so `I = (x² + t)` is prime and `dim A = 2`; its derivative is `0`, and over an algebraic
  closure `x² + t = (x + s)²` with `s² = t`, so there is one point.
- `K` algebraically closed is needed: `(x² + 1) ⊆ ℝ[x]` is radical with `dim A = 2` and no real
  point.
- Finite dimension is needed: for `(x²) ⊆ ℂ[x, y]` the points `(0, b)` are infinitely many, so
  `Nat.card` is `0`, as is `finrank`; the equality holds although the ideal is not radical.
- `(x²) ⊆ ℚ[x]` has one complex point and `dim A = 2`; `(x² − y, y² − 1) ⊆ ℚ[x, y]` is radical
  with the four complex points `(±1, 1)`, `(±i, −1)` and `dim A = 4`.

*Needs:* Mathlib `card_algHom_le_finrank`, `Ideal.Quotient.liftₐ`,
`Ideal.isRadical_iff_quotient_reduced`, `IsArtinianRing.of_finite`, `IsArtinianRing.equivPi`,
`Algebra.IsAlgebraic.isSeparable_of_perfectField`, `Field.finSepDegree_eq_finrank_of_isSeparable`,
`Field.embEquivOfIsAlgClosed`.

### Examples

- `I = (x³ − x) ⊆ ℚ[x]` is radical with `dim A = 3` and the three points `0, ±1`; the standard
  monomials for any order are `1, x, x²`.
- Over `𝔽_p(t)` the ideal `(x^p − t, y)` is prime, `dim A = p`, and it has one point over an
  algebraic closure: the count of 1.2 fails for every prime `p` without perfectness.

### Dependencies

1.1 uses Tau Ceti's standard-monomial basis (GroebnerGeometry G1) and Mathlib. 1.2 uses only
Mathlib.

## Layer 2: multiplication maps and Stickelberger's theorem

In this layer `K` is a field and `I` an ideal of `MvPolynomial σ K`; the points are taken over
`K` itself.

### 2.1 The multiplicity of a point

Define `pointMultiplicity I a`, for `a : σ → K`, as the dimension over `K` of the localization of
`MvPolynomial σ K` at the maximal ideal `vanishingIdeal K {a}` of polynomials vanishing at `a`,
divided by the extension of `I`. By the exactness of localization this is the dimension of the
local ring of `A` at the maximal ideal of `a` (Cox (2020), p. 1, defines `μ(a)` as this
dimension; Sturmfels (2002), Proposition 2.5, p. 16, identifies the local ring with a quotient of
the polynomial ring).

- If `a` is not a point of `I`, some member of `I` is a unit in the local ring and the
  multiplicity is `0`. For a point and finite-dimensional `A` it is positive (route of 2.3).

**Checks.**
- For `I = (x²(x − 1)) ⊆ K[x]` the multiplicities are `2` at `0`, `1` at `1` and `0` elsewhere.
- For `I = (x², y²) ⊆ K[x, y]` the multiplicity at `(0, 0)` is `4`; the plausible wrong variants
  `dim A/𝔪 = 1` and `1 + dim 𝔪/𝔪² = 3` (with `𝔪` the maximal ideal of the point) both differ.

### 2.2 The eigenvalue theorem

Prove `hasEigenvalue_lmul_iff`: if `K` is algebraically closed and `A` is finite-dimensional,
then `μ` is an eigenvalue of `m_f` if and only if `μ = f(a)` for some point `a` of `I` (Cox (2020),
Theorem 1.1, p. 1, statement only; Sturmfels (2002), Theorem 2.6, p. 17, in the joint form of 2.4).
(Proved here.)

Route. `μ` is an eigenvalue exactly when it lies in the spectrum of `m_f`
(`Module.End.hasEigenvalue_iff_mem_spectrum`), that is, when `m_(f − μ)` is not invertible; since
`a ↦ m_a` is injective (`Algebra.lmul_injective`) and `A` is finite-dimensional, this says that
`f − μ` is not a unit of `A`, so lies in a maximal ideal `𝔪`. The field `A/𝔪` is finite over the
algebraically closed `K`, hence equal to `K` (`IsAlgClosed.algebraMap_bijective_of_isIntegral`),
so `𝔪` is the kernel of the map `A → K` of a point `a`, and `f − μ ∈ 𝔪` says `f(a) = μ`. The
converse runs the same way back; it holds over every field.

**Checks.**
- `K` algebraically closed is needed: for `(x² + 1) ⊆ ℝ[x]` and `f = x²`, `m_f = −1` has the
  eigenvalue `−1`, and there is no real point.
- Finite dimension is needed: for `I = 0` in `K[x]` multiplication by `x` has no eigenvalue, since
  `K[x]` is a domain, while every `a ∈ K` is a point.
- For `(x² − y, y² − 1)` and `f = xy` the eigenvalues `1, −1, ±i` are the values of `xy` at
  `(1, 1)`, `(−1, 1)`, `(i, −1)`, `(−i, −1)`.

*Needs:* 2.1 is not used. Mathlib `Module.End.hasEigenvalue_iff_mem_spectrum`,
`Algebra.lmul_injective`, `IsAlgClosed.algebraMap_bijective_of_isIntegral`, `Ideal.Quotient.liftₐ`.

### 2.3 Stickelberger's formula

Prove `charpoly_lmul_eq_finprod`: if `K` is algebraically closed and `A` is finite-dimensional,
then for every `f`

    (m_f).charpoly = ∏ᶠ a ∈ zeroLocus K I, (X − C (f a)) ^ pointMultiplicity I a

(Cox (2020), Theorem 1.2 and formula (1.2), p. 1, statement only, with Cox's sign convention).
(Proved here.)

Route. `A` is Artinian; its nilradical is nilpotent (`IsArtinianRing.isNilpotent_jacobson`), say
of index `s`, and `IsArtinianRing.quotNilradicalPowEquivPi A s` splits `A` as the product of the
local rings `A/𝔪^s` over its maximal ideals. By the route of 2.2 these are the kernels `𝔪_a` of
the points `a`, and `A/𝔪_a^s` is the local ring of `A` at `𝔪_a`, of dimension
`pointMultiplicity I a`, which is therefore positive. Multiplication by `f` preserves the
factors, and on the factor of `a` the map `m_f − f(a)` is multiplication by an element of `𝔪_a`,
hence nilpotent, so its characteristic polynomial is `X ^ μ(a)`
(`IsNilpotent.charpoly_eq_X_pow_finrank`) and that of `m_f` there is `(X − f(a)) ^ μ(a)`.
Characteristic polynomials multiply over a product (`LinearMap.charpoly_prodMap`). Comparing
degrees, the multiplicities sum to `dim A`; for `dim A ≥ 1`, reading off the coefficient of
`X^(dim A − 1)` gives Cox's trace formula `trace(m_f) = ∑ μ(a) f(a)` (Cox (2020), (1.3), p. 2,
and Corollary 4.2, p. 7), and for `A = 0` both sides of it are `0`.

**Checks.**
- For `(x²(x − 1)) ⊆ K[x]` and `f = x` the characteristic polynomial is `X² (X − 1)` and the trace
  is `1 = 2 · 0 + 1 · 1`.
- For `(x² − y, y² − 1)` the characteristic polynomials of `m_x` and `m_y` in the basis
  `1, y, x, xy` are `(X − 1)(X + 1)(X² + 1)` and `(X − 1)²(X + 1)²`, matching the four points,
  each of multiplicity `1`.
- `K` algebraically closed is needed: over `ℝ`, `(x² + 1)` has no real points, so the product is
  `1`, while the characteristic polynomial of `m_x` is `X² + 1`.

*Needs:* 2.1; the route of 2.2; Mathlib `IsArtinianRing.of_finite`,
`IsArtinianRing.isNilpotent_jacobson`, `IsArtinianRing.quotNilradicalPowEquivPi`,
`IsNilpotent.charpoly_eq_X_pow_finrank`, `LinearMap.charpoly_prodMap`, `finprod`.

### 2.4 Joint eigenvectors

Prove `zeroLocus_eq_setOf_exists_eigenvector`: if `A` is finite-dimensional, over any field `K`
the points of `I` are exactly the `a : σ → K` for which some nonzero `v ∈ A` satisfies
`x_i v = a i · v` for every `i` (Sturmfels (2002), Theorem 2.6, display (2.5), p. 17; the proof
printed there, pp. 17–18, gives the inclusion of eigenvalues into points in general and the
reverse inclusion for radical `I`, "the general case left to the reader"; Sturmfels works over `ℚ`
with complex points). (Proved here in general.)

Route. If `v ≠ 0` is a joint eigenvector, `p(x) v = p(a) v` for every polynomial `p`, so `p ∈ I`
gives `p(a) v = 0` and `p(a) = 0`. Conversely let `a` be a point and `𝔪` the kernel of its map
`A → K`. In the product decomposition of 2.3 the factor of `𝔪` is a local Artinian ring whose
maximal ideal `𝔫` is nilpotent; with `t ≥ 1` least such that `𝔫^t = 0`, a nonzero element of
`𝔫^(t − 1)`, extended by `0` in the other factors, is killed by `𝔪` and so by every `x_i − a i`.

**Checks.**
- The non-radical case: for `(x², y²)` the common kernel of `m_x` and `m_y` in the basis
  `1, y, x, xy` is spanned by `xy`, a joint eigenvector for `(0, 0)`.
- Finite dimension is needed: for `I = 0` in `K[x]`, `(x − a) v = 0` forces `v = 0`, yet every
  `a` is a point.

*Needs:* the decomposition of the route of 2.3; Mathlib `IsArtinianRing.quotNilradicalPowEquivPi`,
`IsArtinianRing.isNilpotent_jacobson`.

### Examples

- For `(x², y²)` the map `m_x` satisfies `m_x² = 0` and `m_x ≠ 0`, so it is not diagonalizable,
  although `(0, 0)` is a joint eigenvalue; compare 4.1.
- For `I = (x − 2)` the algebra is `K`, the multiplicity of `2` is `1`, and the characteristic
  polynomial of `m_x` is `X − 2`.

### Dependencies

2.1 is a definition. 2.2 uses Mathlib only. 2.3 uses 2.1 and the route of 2.2. 2.4 uses the
decomposition of 2.3.

## Layer 3: trace forms and real solutions

The trace form of a commutative `ℝ`-algebra `A` is Mathlib's `Algebra.traceForm ℝ A`,
`(α, β) ↦ trace(m_(αβ))`, and its quadratic form is `LinearMap.BilinMap.toQuadraticMap`.

### 3.1 The type of the trace form

Prove `sigPos_sigNeg_traceForm`: for a finite-dimensional commutative `ℝ`-algebra `A`, the trace
form has `sigPos = r₁ + r₂` and `sigNeg = r₂`, where `r₁` and `r₂` are the numbers of maximal
ideals `𝔪` of `A` with `dim A/𝔪` equal to `1` and to `2` (Cox (2020), Theorem 5.1, p. 8, proof
p. 9, from the Stickelberger trace formula, Theorem 4.1, p. 6, proof pp. 6–7, after Scheja and
Storch).

Route. The residue fields `L_𝔪 = A/𝔪` are `ℝ` or `ℂ`. Cox's Theorem 4.1 gives
`trace_A(m_α) = ∑ λ_𝔪 trace_(L_𝔪)(α mod 𝔪)` with `λ_𝔪 = dim A_𝔪 / [L_𝔪 : ℝ]`; a direct route
splits `A` into its local factors (route of 2.3) and filters the factor `B` of `𝔪` by the powers
`𝔫^j` of its maximal ideal `𝔫`, whose successive quotients are `L_𝔪`-vector spaces on which `m_α`
acts as multiplication by `α mod 𝔪`. Traces add along each short exact sequence
`0 → 𝔫^j/𝔫^(j+1) → B/𝔫^(j+1) → B/𝔫^j → 0` of finite-dimensional real vector spaces, which are
free (Tau Ceti `LinearMap.trace_eq_add_of_exact`), so the trace on `B` is the sum of the traces on
the graded pieces, and on a piece of dimension `e` over `L_𝔪` the real trace is
`e · trace_(L_𝔪/ℝ)(α mod 𝔪)`. Hence the trace form `Q` is the pullback `P ∘ π`, along the
surjection `π : A → ∏ L_𝔪`, of `P = ⊕ λ_𝔪 T_(L_𝔪)`. The two forms have the same indices of
inertia: a subspace on which `Q` is positive definite meets `ker π` only in `0`, since `Q`
vanishes there, and `π` maps it isomorphically onto a subspace on which `P` is positive definite;
conversely a linear section of `π` carries a subspace on which `P` is positive definite to one on
which `Q` is (`exists_finrank_eq_sigPos_and_posDef`, `le_sigPos_of_posDef`; the same for `sigNeg`,
which is `sigPos` of the negated form). Equivalently, `ker π` lies in the radical of `Q`, and `Q`
and `P` induce isometric forms on their quotients by their radicals, whose indices are theirs by
Tau Ceti `QuadraticForm.sigPos_lift_radical` and `QuadraticForm.sigNeg_lift_radical`. In the
bases `1` and `1, i` the forms `T_ℝ`, `T_ℂ` are `(1)` and `diag(2, −2)`, and `λ_𝔪 > 0`; conclude
with
`QuadraticForm.sigPos_of_equiv_weightedSumSquares` and
`QuadraticForm.sigNeg_of_equiv_weightedSumSquares`.

**Checks.**
- `A = ℂ` as an `ℝ`-algebra: in the basis `1, i` the trace form is `diag(2, −2)`, type `(1, 1)`,
  with `r₁ = 0`, `r₂ = 1`. The plausible wrong count "positive index = number of maps `A → ℂ`"
  gives `2`.
- `A = ℝ[x]/(x²)`: the trace form is `diag(2, 0)`, type `(1, 0)`, one maximal ideal with residue
  field `ℝ`.
- `A = ℝ[x, y]/(x² − y, y² − 1)`, basis `1, y, x, xy`: the Gram matrix has rows `(4, 0, 0, 0)`,
  `(0, 4, 0, 0)`, `(0, 0, 0, 4)`, `(0, 0, 4, 0)`, type `(3, 1)`; here `r₁ = 2` (the points
  `(±1, 1)`) and `r₂ = 1` (the pair `(±i, −1)`).
- Finite dimension is needed: for `A = ℝ[x, y]/(x² + y²)` the maximal ideal `(x, y)` has residue
  field `ℝ` and infinitely many have residue field `ℂ`, so the right sides are `1 + 0` and `0`
  while both indices are `0` (Mathlib's `sigPos` is `0` in infinite dimension).

*Needs:* the decomposition of the route of 2.3; Mathlib `Algebra.traceForm`,
`Algebra.traceForm_apply`, `sigPos`, `sigNeg`, `exists_finrank_eq_sigPos_and_posDef`,
`le_sigPos_of_posDef`, `QuadraticForm.sigPos_of_equiv_weightedSumSquares`,
`QuadraticForm.sigNeg_of_equiv_weightedSumSquares`, `MaximalSpectrum`; Tau Ceti
`LinearMap.trace_eq_add_of_exact`, `QuadraticForm.sigPos_lift_radical`,
`QuadraticForm.sigNeg_lift_radical`.

### 3.2 Counting real solutions

Define `traceFormOf I h`, for `I ⊆ MvPolynomial σ ℝ` and `h ∈ MvPolynomial σ ℝ`, as the bilinear
form `(α, β) ↦ trace(m_(α h β))` on `A`, that is, Mathlib's trace form composed in the second
argument with `m_h`; its quadratic form is `α ↦ trace(m_(α² h))` (Sturmfels (2002), §2.4, p. 20,
calls it the trace form for `h`).

Prove `signature_traceFormOf`: if `A` is finite-dimensional, the signature of `traceFormOf I h`
is the number of real points `a` of `I` with `h(a) > 0` minus the number with `h(a) < 0`; each
real point is counted once, whatever its multiplicity (Cox (2020), Theorem 5.3, pp. 9–10, proof
printed, with the `2 × 2` computation left to the reader; the case `h = 1` is Corollary 5.2,
p. 9; Sturmfels (2002), Theorem 2.8 and Corollary 2.9, p. 20, statement only).

Route. As in 3.1, the form is the pullback of `⊕ λ_𝔪 Q_(L_𝔪, h)` with
`Q_(L, h)(α) = trace_(L/ℝ)(α² h̄)`, `h̄ = h mod 𝔪`. The maximal ideals with residue field `ℝ` are
the kernels of the real points `a`, with `h̄ = h(a)`, and contribute the sign of `h(a)`. For
`L ≅ ℂ`, write `h̄ = u + i v`: in the basis `1, i` the form is
`[[2u, −2v], [−2v, −2u]]`, zero when `h̄ = 0` and otherwise of determinant `−4 |h̄|² < 0`, so its
signature is `0` in both cases.

**Checks.**
- `A = ℝ[x, y]/(x² − y, y² − 1)`, real points `(1, 1)` and `(−1, 1)`: for `h = 1`, `y`, `x`,
  `x − 2`, `2x + 1` the type of the form is `(3, 1)`, `(3, 1)`, `(2, 2)`, `(1, 3)`, `(2, 2)`, so
  the signatures are `2, 2, 0, −2, 0`, and the counts `#{h > 0} − #{h < 0}` are the same.
- Multiplicities are not counted: for `ℝ[x]/(x²(x − 1))` and `h = 1` the Gram matrix in the basis
  `1, x, x²` has rows `(3, 1, 1)`, `(1, 1, 1)`, `(1, 1, 1)`, type `(2, 0)`: two real points, while
  `dim A = 3`.
- For one variable the count is the sum of the signs of `h` at the distinct real roots of the
  generator, which Tau Ceti's Sturm–Tarski theorem `TauCeti.Sturm.sum_sign_sturmSeq_univ` computes
  by sign variations; for `x²(x − 1)` and `h = 1` both give `2`.
- Finite dimension is needed: for `ℝ[x, y]/(x² + y²)` and `h = 1` both indices are `0`, but there
  is one real point.

*Needs:* the route of 3.1; Mathlib `Algebra.traceForm`, `LinearMap.BilinForm`, `LinearMap.compl₂`,
`Set.ncard`, `exists_finrank_eq_sigPos_and_posDef`, `le_sigPos_of_posDef`,
`QuadraticForm.sigPos_of_equiv_weightedSumSquares`,
`QuadraticForm.sigNeg_of_equiv_weightedSumSquares`; Tau Ceti `QuadraticForm.sigPos_lift_radical`,
`QuadraticForm.sigNeg_lift_radical`.

### Examples

- `ℝ[x]/(x² + 1) ≅ ℂ`: no real point; the trace form `diag(2, −2)` has signature `0`.
- `ℝ[x]/(x³ − x)`: three real points; the trace form in the basis `1, x, x²` has rows
  `(3, 0, 2)`, `(0, 2, 0)`, `(2, 0, 2)`, positive definite.

### Dependencies

3.1 uses the decomposition of the route of 2.3 and Mathlib's signature. 3.2 uses the route of 3.1.

## Layer 4: the radical

### 4.1 The radical criterion

Prove `isRadical_iff_squarefree_minpoly`: if `k` is perfect and `A` is finite-dimensional, `I` is
radical if and only if the minimal polynomial `minpoly k x_i` is squarefree for every variable
`i` (Sturmfels (2002), Theorem 2.2, p. 14, over `ℚ`, statement only, with a reference to
Cox–Little–O'Shea, *Using Algebraic Geometry*, Proposition 2.7, not opened). (Proved here.)

The minimal polynomial generates the elimination ideal: `I ∩ k[x_i]`, the preimage of `I` under
`p ↦ p(X i)`, is the kernel of `p ↦ p(x_i)` on `k[T]`, which is generated by `minpoly k x_i`
(`minpoly.ker_aeval_eq_span_minpoly`). For the lexicographic order with `X i` the smallest variable
the members of a Gröbner basis of `I` involving only `X i` generate it (Tau Ceti
`MonomialOrder.IsGroebnerBasis.comap_rename_lex` and
`MonomialOrder.IsGroebnerBasis.comap_rename_eq_span`, the elimination theorem of GroebnerGeometry
G1). Since a nonzero principal ideal of `k[T]` is radical exactly when its generator is
squarefree, the criterion says that `I` is radical exactly when its elimination ideals in one
variable are.

Route. (⇒, any field) If `A` is reduced and `minpoly k x_i = q² s` with `q` nonconstant, then
`(q s)(x_i)` squares to `p(x_i) s(x_i) = 0`, so `(q s)(x_i) = 0`, which contradicts minimality of
degree. (⇐) The map `a ↦ m_a` is an injective algebra map (`Algebra.lmul_injective`), so
`minpoly k m_(x_i) = minpoly k x_i` (`minpoly.algHom_eq`), and a squarefree polynomial killing
`m_(x_i)` makes it semisimple (`Module.End.isSemisimple_of_squarefree_aeval_eq_zero`).
Every `m_f` is a polynomial in finitely many of the commuting `m_(x_i)`, hence semisimple over the
perfect field
`k` (`Module.End.IsSemisimple.add_of_commute`, `Module.End.IsSemisimple.mul_of_commute`,
`Module.End.IsSemisimple_smul`). If `f` is nilpotent, `m_f` is nilpotent and semisimple, so
`m_f = 0` (`Module.End.eq_zero_of_isNilpotent_isSemisimple`) and `f = m_f(1) = 0`; thus `A` is
reduced and `I` radical (`Ideal.isRadical_iff_quotient_reduced`).

The same argument shows that, over a perfect field and for finite-dimensional `A`, `I` is radical
if and only if every `m_(x_i)` is semisimple (`Module.End.IsSemisimple.minpoly_squarefree` gives
the converse); over an algebraically closed field this is Sturmfels's Corollary 2.7, p. 18, on
simultaneous diagonalization of the companion matrices. It is not a separate target.

**Checks.**
- Perfectness is needed: over `𝔽₂(t)`, `I = (x² + t, y² + t)` is a Gröbner basis (coprime leading
  monomials `x²`, `y²`), and the minimal polynomials of `x` and `y` are the irreducible `T² + t`;
  but `(x + y)² = x² + y² ≡ 2t = 0` while `x + y` is a nonzero remainder, so `I` is not radical.
- For `(x², y²)` over `ℚ` the minimal polynomial of `x` is `T²`, and `m_x² = 0 ≠ m_x`.
- For `(x² − y, y² − 1)` over `ℚ` the minimal polynomials are `T⁴ − 1` and `T² − 1`, both
  squarefree, and the ideal is radical.

*Needs:* Mathlib `minpoly`, `minpoly.algHom_eq`, `minpoly.ker_aeval_eq_span_minpoly`,
`Algebra.lmul_injective`, `Module.End.isSemisimple_of_squarefree_aeval_eq_zero`,
`Module.End.IsSemisimple.add_of_commute`, `Module.End.IsSemisimple.mul_of_commute`,
`Module.End.IsSemisimple_smul`, `Module.End.eq_zero_of_isNilpotent_isSemisimple`,
`Ideal.isRadical_iff_quotient_reduced`. The elimination remark uses Tau Ceti
`MonomialOrder.IsGroebnerBasis.comap_rename_lex`,
`MonomialOrder.IsGroebnerBasis.comap_rename_eq_span`.

### 4.2 The radical from the eliminants

Prove `radical_eq_sup_span`: if `k` is perfect and `A` is finite-dimensional,

    I.radical = I ⊔ span {rad(minpoly k x_i)(X i) | i ∈ σ}

where `rad p` is Mathlib's `UniqueFactorizationMonoid.radical p`, the product of the distinct monic
irreducible factors of `p` (Sturmfels (2002), Theorem 2.2, p. 14, over `ℚ`, statement only, with
the squarefree part written `p / gcd(p, p′)`). (Proved here.)

Route. Write `J` for the right side and `pᵢ = minpoly k x_i ≠ 0`. Some power of `rad pᵢ` is
divisible by `pᵢ` (`UniqueFactorizationMonoid.exists_dvd_radical_self_pow`), so
`rad(pᵢ)(X i) ∈ I.radical` and `J ≤ I.radical`. The quotient by `J` is a quotient of `A`, hence
finite-dimensional, and there `x_i` is killed by the squarefree `rad pᵢ`
(`UniqueFactorizationMonoid.squarefree_radical`), so its minimal polynomial divides `rad pᵢ` and
is squarefree (`Squarefree.squarefree_of_dvd`). By 4.1, `J` is radical, and `I ≤ J` gives
`I.radical ≤ J`.

**Checks.**
- `(x², y) ⊆ ℚ[x, y]`: the minimal polynomials are `T²` and `T`, and the formula gives `(x, y)`.
- In positive characteristic `p / gcd(p, p′)` is not the squarefree part: over `𝔽₂`, `p = T²` has
  `p′ = 0`, so `p / gcd(p, p′) = 1`, while `rad p = T`; for `I = (x²) ⊆ 𝔽₂[x]` the formula with
  `rad` gives the radical `(x)`, the other would give the unit ideal.
- In characteristic `0` the two agree: for Sturmfels's degree-8 eliminant
  `x⁸ + (6/25) x⁶ + (17/625) x⁴ + (8/15625) x²` both are
  `x⁷ + (6/25) x⁵ + (17/625) x³ + (8/15625) x`.
- Perfectness is needed: for `(x² + t, y² + t)` over `𝔽₂(t)` the radicals of the minimal
  polynomials are the polynomials themselves, so the right side is `I`, which is not radical.

*Needs:* 4.1; Mathlib `UniqueFactorizationMonoid.radical`,
`UniqueFactorizationMonoid.exists_dvd_radical_self_pow`,
`UniqueFactorizationMonoid.squarefree_radical`, `Squarefree.squarefree_of_dvd`, `minpoly.dvd`.

### Examples

- `I = ((x − 1)², (x − 1)(y − 2), (y − 2)²) ⊆ ℚ[x, y]` has minimal polynomials `(T − 1)²` and
  `(T − 2)²`, so it is not radical, and its radical is `(x − 1, y − 2)`.

### Dependencies

4.1 uses Mathlib, and Tau Ceti's elimination theorem for the remark. 4.2 uses 4.1.

## Layer 5: the shape lemma

An ideal has a *shape lemma* with respect to a variable `x_j` when it is generated by one
polynomial in `x_j` and the polynomials `x_i − gᵢ(x_j)` for `i ≠ j`; equivalently, `x_j`
generates `A` as a `k`-algebra.

### 5.1 When an ideal has a shape lemma

Prove `exists_shape_iff`: let `K` be algebraically closed, `I ⊆ MvPolynomial σ K` with `A`
finite-dimensional, and `j` a variable whose coordinate takes distinct values at distinct points
of `I`. Then `I` has a shape lemma with respect to `x_j` if and only if every point `a` has
`pointMultiplicity I a` equal to the multiplicity of `a j` as a root of `minpoly K x_j`
(Cox–D'Andrea (2023), Lemma 2.2, (2) ⇔ (4), pp. 6–7, with Lemma 2.1, p. 6, proofs printed;
their standing hypotheses of at least two variables and of a complete intersection are not used
in these two implications).

Route (Cox–D'Andrea). Put `r = minpoly K x_j`; `T ↦ x_j` embeds `K[T]/(r)` into `A`
(`minpoly.ker_aeval_eq_span_minpoly`). (⇒) If `I` has a shape lemma, every `x_i` lies in the
image, so `A ≅ K[T]/(r) ≅ ∏ K[T]/(T − ξ)^(e_ξ)` with `r = ∏ (T − ξ)^(e_ξ)`; the local factor at a
point `a` is the factor of `ξ = a j`, of dimension the root multiplicity. (⇐) The values `a j` are
distinct, and each is a root of `r` of multiplicity `μ(a)`, so `∏ (T − a j)^(μ(a))` divides `r`
and `deg r ≥ ∑ μ(a) = dim A` (route of 2.3). The embedding gives `deg r ≤ dim A`, so it is onto:
each `x_i` is `gᵢ(x_j)`, and `I` is generated by `r(x_j)` and the `x_i − gᵢ(x_j)`, the quotient by
these being already `K[T]/(r)`.

**Checks.**
- `(x², y²)` with `j = y`: one point, of multiplicity `4`, while `0` is a double root of
  `minpoly y = T²`; indeed `dim A = 4 > 2`, and `x` is not a polynomial in `y` modulo `I`.
- `(y², x − y)` with `j = y`: multiplicity `2` equals the root multiplicity of `0` in `T²`, and
  `{x − y, y²}` is the lexicographic Gröbner basis.
- Injectivity is needed: `(x² − 1, y)` with `j = y` has the two points `(±1, 0)` on the same
  value `y = 0`; both have multiplicity `1`, the root multiplicity of `0` in `minpoly y = T`, but
  `dim A = 2 > 1`, so `y` does not generate `A`.
- `K` algebraically closed is needed: over `ℝ`, `(x² + 1, y)` with `j = y` has no real point, so
  the condition holds vacuously, but `A ≅ ℂ` is not generated by `y = 0`.

*Needs:* 2.1; the route of 2.3; Mathlib `minpoly.ker_aeval_eq_span_minpoly`,
`Polynomial.rootMultiplicity`, `Algebra.adjoin_singleton_eq_range_aeval`.

### 5.2 The shape lemma

Prove `isReducedGroebnerBasis_lex_shape`: let `I ⊆ MvPolynomial (Fin (n + 1)) k` be a proper
ideal with `A` finite-dimensional, and `K ⊇ k` a field over which `I` has exactly `d = dim A`
points, with distinct last coordinates. Then there are a monic `r ∈ k[T]` of degree `d` and
`q_0, …, q_(n−1) ∈ k[T]` of degree `< d` such that `{x_i − q_i(x_n) | i < n} ∪ {r(x_n)}` is the
reduced lexicographic Gröbner basis of `I` (Sturmfels (2002), Proposition 2.3, p. 15, statement
only, for radical ideals over `ℚ` with distinct last coordinates of the complex points). (Proved
here.)

By 1.2, over a perfect field and for algebraically closed `K` the hypothesis on the number of
points says that `I` is radical, which is Sturmfels's setting.

Route. Let `r = minpoly k x_n`. Each of the `d` points `a` gives `r(a n) = 0`, and the `a n` are
distinct, so `r` has at least `d` roots in `K` (`Polynomial.card_roots'`) and degree at least `d`;
since `minpoly.natDegree_le` gives at most `dim A = d`, `k[x_n]` has dimension `d`, so it is all
of `A` (`Algebra.adjoin_singleton_eq_range_aeval`). Hence `x_i = q_i(x_n)` with `deg q_i < d`
after division by `r`. The set `G` of the statement lies in `I`, and its leading monomials are
`X i` (`i < n`, by the lexicographic convention) and `X n ^ d`. The exponents divisible by none
of them are the `d` exponents `X n ^ e`, `e < d`; every standard monomial of `I` is among them,
and there are `d` standard monomials (Tau Ceti `MonomialOrder.IsGroebnerBasis.basisQuotient` with
`Module.finrank_eq_nat_card_basis`), so they are exactly these. A nonzero `p ∈ I` therefore has
its leading monomial divisible by one in `G`, and `G` is a Gröbner basis
(`MonomialOrder.isGroebnerBasis_iff_forall_exists_degree_le_degree`). It is monic, and no term of
a member is divisible by the leading monomial of another, so it is the reduced basis, unique by
`MonomialOrder.existsUnique_isReducedGroebnerBasis`.

**Checks.**
- `(x² − 1, y − x) ⊆ ℚ[x, y]`, `x > y`: the reduced lexicographic basis is `{x − y, y² − 1}`, with
  `q = T`, `r = T² − 1`, `d = 2`.
- `(x² − y, y² − 1)` with `x` as the last variable (order `y > x`): the basis is
  `{y − x², x⁴ − 1}`, `d = 4`, since `x` takes the four values `±1`, `±i`.
- Distinct last coordinates are needed: `(x² − 1, y)` has the lexicographic basis `{x² − 1, y}`,
  not of this shape; its two points share `y = 0`.
- The count of points is needed: `(x², y)` has one point, `d = 2`, and basis `{x², y}`.
- Over `𝔽₂(t)`, `(x² + t, y)` is radical but has one point over an algebraic closure with
  `d = 2`; its basis `{x² + t, y}` is not of this shape, so radicality alone does not suffice over
  an imperfect field.
- Properness is needed: the unit ideal has `d = 0` points as required and reduced basis `{1}`,
  and no `q_i` has degree `< 0` when `n ≥ 1`.

*Needs:* Tau Ceti `MonomialOrder.IsReducedGroebnerBasis`, `MonomialOrder.lex` conventions,
`MonomialOrder.isGroebnerBasis_self`, `MonomialOrder.IsGroebnerBasis.basisQuotient`,
`MonomialOrder.isGroebnerBasis_iff_forall_exists_degree_le_degree`,
`MonomialOrder.existsUnique_isReducedGroebnerBasis` (GroebnerGeometry G1); Mathlib `minpoly`,
`minpoly.natDegree_le`, `Polynomial.card_roots'`, `Algebra.adjoin_singleton_eq_range_aeval`,
`Module.finrank_eq_nat_card_basis`.

### 5.3 A linear change of coordinates

Prove `exists_surjective_aeval_linearForm`: if `σ` is finite, `k` is infinite, `A` is
finite-dimensional and `I` has exactly `dim A` points over a field `K ⊇ k`, there are
`c : σ → k` such that the linear form
`ℓ = ∑ c_i x_i` generates `A` as a `k`-algebra, so `A ≅ k[T]/(minpoly k ℓ)` (Sturmfels (2002),
p. 15, the sentence before Proposition 2.3, "possibly after a linear change of variables").
(Proved here.) After the change of coordinates that makes `ℓ` the last variable, 5.2 applies.

Route. For each pair of distinct points `a ≠ b` pick `i` with `a i ≠ b i` and a `k`-linear
functional `λ : K → k` with `λ(a i − b i) ≠ 0`; then `c ↦ λ(∑ c_i (a i − b i))` is a nonzero
linear form on `k^σ`. The product of these finitely many forms is a nonzero polynomial over the
infinite field `k`, so it does not vanish at some `c` (`MvPolynomial.funext`), and `ℓ` takes `dim A`
distinct values at the points. As in 5.2, `minpoly k ℓ` then has `dim A` roots in `K`, so
`k[ℓ] = A`.

**Checks.**
- `k` infinite is needed: over `𝔽₂`, `I = (x² − x, y² − y)` has the four points of `𝔽₂²` and
  `dim A = 4`; every `ℓ = a x + b y` with `a, b ∈ 𝔽₂` takes at most the two values `0, 1` and
  satisfies `ℓ² = ℓ` in `A`, so `k[ℓ]` has dimension at most `2`.
- The count of points is needed: in `ℚ[x, y]/(x², y²)` every linear form `ℓ` has `ℓ³ = 0`
  (`(x + y)² = 2xy`), so `k[ℓ]` has dimension at most `3 < 4`.
- For `(x² − y, y² − 1)` the form `ℓ = x` already works: modulo `I`, `y = x²` and
  `A ≅ ℚ[T]/(T⁴ − 1)`.

*Needs:* Mathlib `MvPolynomial.funext`, `minpoly`, `minpoly.natDegree_le`, `Polynomial.card_roots'`,
`Algebra.adjoin_singleton_eq_range_aeval`.

### Examples

- Cox and D'Andrea's example `(x₁² − x₂ − 1, x₁² + x₁ x₂ − 2) ⊆ ℂ[x₁, x₂]` has the shape lemma
  `x₂³ + 2 x₂ − 1`, `x₁ − (x₂² + 1)` with respect to `x₂` (Cox–D'Andrea (2023), Example 1.1, p. 1).

### Dependencies

5.1 uses 2.1 and the route of 2.3. 5.2 uses Tau Ceti's Gröbner bases (GroebnerGeometry G1) and
Mathlib; 1.2 is used only to read its hypothesis. 5.3 uses Mathlib and the route of 5.2.

## Scope and ownership

This roadmap owns the finiteness theorem for zero-dimensional ideals, the count of points with
its radical case, the multiplicity of a point, the eigenvalue theorem, Stickelberger's formula,
the joint eigenvectors, the type of real trace forms and the count of real solutions, the radical
criterion and the radical formula, the characterisation of ideals with a shape lemma, the shape
lemma and the linear change of coordinates, all stated above.

Already in the libraries, and consumed rather than restated:

- The Gröbner-basis theory of GroebnerGeometry G1 (Layer 1 in its sectioned form), proved in Tau
  Ceti: Gröbner bases, remainders and normal forms, the standard-monomial basis
  `MonomialOrder.IsGroebnerBasis.basisQuotient`, Buchberger's criterion, reduced bases, and the
  elimination theorem `MonomialOrder.IsGroebnerBasis.comap_rename`,
  `MonomialOrder.IsGroebnerBasis.comap_rename_eq_span`,
  `MonomialOrder.IsGroebnerBasis.comap_rename_lex`.
  The elimination theorem is not restated: it computes the minimal polynomials of 4.1 and 5.1.
- Mathlib's bound `card_algHom_le_finrank`, which is the inequality between the number of points
  and the dimension; its Nullstellensatz (`MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`); the
  structure of Artinian rings (`IsArtinianRing.equivPi`, `IsArtinianRing.quotNilradicalPowEquivPi`);
  semisimple endomorphisms; the signature of a quadratic form.
- Tau Ceti's Sturm–Tarski theorem (`TauCeti/Algebra/Polynomial/Sturm/`) counts the real roots of
  one polynomial, with signs of a second, by sign variations; 3.2 for one variable gives the same
  number by a trace form, and no statement here uses it.
- Tau Ceti's full sets of sections (`TauCeti.IsFullSetOfSections`,
  `TauCeti.IsFullSetOfSections.charpoly_eq_prod`) express a characteristic-polynomial identity of
  the shape of 2.3 over a general base; no statement here uses them.

Not treated here: toric ideals and Markov bases; positive-dimensional ideals, Hilbert polynomials
and degrees (GroebnerGeometry G2); primary decomposition and the localization at a known point
by saturation (Sturmfels (2002), §2.2); resultants and subresultants; rational univariate
representations; every procedure that computes a Gröbner basis, a normal form or a solution.

## Exact supplier contracts

### From Mathlib

- `Mathlib/RingTheory/Nullstellensatz.lean`: `MvPolynomial.zeroLocus` (for
  `[Field k] [Field K] [Algebra k K]`, the points over `K` of an ideal of `MvPolynomial σ k`),
  `MvPolynomial.vanishingIdeal`
  (with the instances that `vanishingIdeal K {a}` is maximal for `a : σ → K` over `K`),
  `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical` (`[IsAlgClosed K] [Finite σ]`).
- `Mathlib/LinearAlgebra/FreeModule/Finite/Matrix.lean`: `card_algHom_le_finrank`
  (`[Module.Free K M] [Module.Finite K M] [IsDomain L]`).
- Artinian rings: `IsArtinianRing.of_finite`, `IsArtinianRing.equivPi` (`[IsReduced R]`),
  `IsArtinianRing.quotNilradicalPowEquivPi`, `IsArtinianRing.isNilpotent_jacobson`;
  `Ideal.isRadical_iff_quotient_reduced`; `MaximalSpectrum`.
- Fields: `IsAlgClosed.algebraMap_bijective_of_isIntegral`,
  `Algebra.IsAlgebraic.isSeparable_of_perfectField`, `Field.finSepDegree_eq_finrank_of_isSeparable`,
  `Field.embEquivOfIsAlgClosed`, `linearIndependent_monoidHom`.
- Linear algebra: `Algebra.lmul`, `Algebra.lmul_injective`, `LinearMap.charpoly`,
  `LinearMap.charpoly_prodMap`, `IsNilpotent.charpoly_eq_X_pow_finrank`,
  `Module.End.HasEigenvalue`, `Module.End.hasEigenvalue_iff_mem_spectrum`;
  `Module.Finite.finite_basis`, `Module.Finite.of_basis`,
  `Module.finrank_eq_nat_card_basis`; `Algebra.finite_adjoin_of_finite_of_isIntegral`;
  `MvPolynomial.algebraTensorAlgEquiv`, `Algebra.TensorProduct.quotIdealMapEquivTensorQuot`,
  `Algebra.TensorProduct.basis`; `Ideal.Quotient.liftₐ`; `Localization.AtPrime`.
- Semisimple endomorphisms (`Mathlib/LinearAlgebra/Semisimple.lean`):
  `Module.End.IsSemisimple`, `Module.End.isSemisimple_of_squarefree_aeval_eq_zero`,
  `Module.End.IsSemisimple.minpoly_squarefree`, `Module.End.IsSemisimple.add_of_commute` and
  `Module.End.IsSemisimple.mul_of_commute` (`[FiniteDimensional K M] [PerfectField K]`),
  `Module.End.IsSemisimple_smul`, `Module.End.eq_zero_of_isNilpotent_isSemisimple`.
- Polynomials: `minpoly`, `minpoly.algHom_eq`, `minpoly.ker_aeval_eq_span_minpoly`, `minpoly.dvd`,
  `minpoly.natDegree_le`, `Polynomial.rootMultiplicity`, `Polynomial.card_roots'`,
  `Algebra.adjoin_singleton_eq_range_aeval`, `MvPolynomial.funext` (`[Infinite R]`),
  `UniqueFactorizationMonoid.radical`, `UniqueFactorizationMonoid.exists_dvd_radical_self_pow`,
  `UniqueFactorizationMonoid.squarefree_radical`, `Squarefree.squarefree_of_dvd`.
- Quadratic forms (`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`): `sigPos`, `sigNeg`,
  `exists_finrank_eq_sigPos_and_posDef`, `le_sigPos_of_posDef`,
  `QuadraticForm.sigPos_of_equiv_weightedSumSquares`,
  `QuadraticForm.sigNeg_of_equiv_weightedSumSquares`; `Algebra.traceForm`,
  `Algebra.traceForm_apply`, `LinearMap.BilinMap.toQuadraticMap`, `LinearMap.compl₂`.

### From Tau Ceti

- `TauCeti/RingTheory/MvPolynomial/Groebner/NormalForm.lean` (GroebnerGeometry G1):
  `MonomialOrder.standardMonomials` (the exponents `c` with `¬ m.degree p ≤ c` for every nonzero
  `p ∈ I`), `MonomialOrder.IsGroebnerBasis.basisQuotient` (a basis of `MvPolynomial σ R ⧸ I`
  indexed by the standard monomials, for a Gröbner basis whose nonzero members have unit leading
  coefficients).
- `TauCeti/RingTheory/MvPolynomial/Groebner/Basic.lean`: `MonomialOrder.IsGroebnerBasis`,
  `MonomialOrder.isGroebnerBasis_self`,
  `MonomialOrder.isGroebnerBasis_iff_forall_exists_degree_le_degree`
  (for sets whose nonzero members have unit leading coefficients).
- `TauCeti/RingTheory/MvPolynomial/Groebner/Reduced.lean`: `MonomialOrder.IsReducedGroebnerBasis`
  (a Gröbner basis of nonzero monic polynomials, no term of a member divisible by the leading
  monomial of another), `MonomialOrder.existsUnique_isReducedGroebnerBasis` (over a field).
- `TauCeti/RingTheory/MvPolynomial/Groebner/Elimination.lean`:
  `MonomialOrder.IsGroebnerBasis.comap_rename_lex` (`StrictMono e`, `IsUpperSet (Set.range e)`),
  `MonomialOrder.IsGroebnerBasis.comap_rename_eq_span`; used in the remark of 4.1.
- `TauCeti/LinearAlgebra/Trace/Exact.lean`: `LinearMap.trace_eq_add_of_exact` (the trace of an
  endomorphism of a finite module is the sum of the traces on a free submodule and a free quotient
  that it preserves), for the route of 3.1.
- `TauCeti/LinearAlgebra/QuadraticForm/Signature.lean`: `QuadraticForm.sigPos_lift_radical`
  (with its negative counterpart `QuadraticForm.sigNeg_lift_radical`), for the routes of 3.1 and
  3.2.
- Named in the scope section and a Check, not used by a route:
  `TauCeti/Algebra/Polynomial/Sturm/Infinity.lean`, `TauCeti.Sturm.sum_sign_sturmSeq_univ`;
  `TauCeti/RingTheory/Norm/FullSetOfSections/Basic.lean`, `TauCeti.IsFullSetOfSections`,
  `TauCeti.IsFullSetOfSections.charpoly_eq_prod`.

### From TauCetiRoadmap.GroebnerGeometry

- G1, ideals, normal forms and elimination (Layer 1 of its sectioned form): the declarations
  listed under Tau Ceti above realise it, and the routes of 1.1, 4.1 and 5.2 use them. No statement
  of that roadmap is restated, and nothing of G2–G6 is used.

## References

- B. Sturmfels, *Solving Systems of Polynomial Equations*, CBMS Regional Conference Series in
  Mathematics 97, AMS, 2002; the author's preprint at `math.berkeley.edu/~bernd/cbms.pdf`, whose
  page numbers are those of the book: Chapter 2, Proposition 2.1 (p. 13), Theorem 2.2 (p. 14),
  Proposition 2.3 and the sentence before it (p. 15), Proposition 2.5 (p. 16), Theorem 2.6 with
  (2.5) (p. 17, proof pp. 17–18), Corollary 2.7 (p. 18), §2.4 with Theorem 2.8 and Corollary 2.9
  (p. 20).
- D. A. Cox, *Stickelberger and the Eigenvalue Theorem*, arXiv:2007.12573v3 (2020): Theorems 1.1
  and 1.2 with (1.2) (p. 1), (1.3) (p. 2), Theorem 4.1 (p. 6, proof pp. 6–7), Corollary 4.2
  (p. 7), Theorem 5.1 (p. 8, proof p. 9), Corollary 5.2 (p. 9), Theorem 5.3 (pp. 9–10).
- D. A. Cox and C. D'Andrea, *Subresultants and the Shape Lemma*, arXiv:2112.10306v2 (2023):
  Example 1.1 (p. 1), Lemma 2.1 (p. 6), Lemma 2.2 (pp. 6–7).
- D. Cox, J. Little and D. O'Shea, *Ideals, Varieties, and Algorithms* and *Using Algebraic
  Geometry*, are cited by the sources above for the finiteness theorem and the radical criterion;
  they were not consulted.
