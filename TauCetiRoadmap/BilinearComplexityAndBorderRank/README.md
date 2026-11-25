# Roadmap: bilinear complexity and border rank

**Summary.** The cost of multiplying matrices is governed by the tensor rank of the matrix
multiplication tensors `⟨a, b, c⟩` (an `a × b` matrix times a `b × c` matrix) and by its
approximate version, the border rank, the least number of terms of a decomposition whose factor
vectors are polynomials in a parameter `ε` and which gives `εʰ t` up to higher powers of `ε`.
This roadmap develops both for the coordinate tensors of AsymptoticSpectra over an arbitrary
field: the algebra of rectangular matrix multiplication tensors, the comparison of rank with the
number of multiplications of a circuit, border rank and its interpolation into rank, and the
classical bounds on the exponent `ω` of matrix multiplication that border rank gives. There is no
hypothesis on the field anywhere: no characteristic, no size.

The headline theorems are these.

- *Multiplications and rank.* For bilinear forms with coefficient array `T`, the least number
  `L` of nonscalar multiplications of a circuit without divisions computing all of them and the
  tensor rank `R` of `T` satisfy `L ≤ R ≤ 2L`, over every field.
- *Border rank.* A three-party tensor with an approximate decomposition of degree `h` with `r`
  terms has rank at most `C(h + 2, 2) r`, and, with at least one party, every flattening rank is
  at most the border rank. The tensor of multiplication of linear polynomials modulo `X²` has
  rank `3` and border rank `2`.
- *Bini's theorem.* `(abc)^(ω/3)` is at most the border rank of `⟨a, b, c⟩`. With the five
  approximate products of Bini, Capovani, Lotti and Romani this gives `12^(ω/3) ≤ 10`, that is,
  `ω ≤ 3 log₁₂ 10 < 2.78`.
- *Schönhage's asymptotic sum inequality.* For every finite family of rectangular matrix
  multiplication tensors, `∑ᵢ (kᵢ mᵢ nᵢ)^(ω/3)` is at most the border rank of their direct sum.
  For `k, n ≥ 1`, Schönhage's example `⟨k, 1, n⟩ ⊕ ⟨1, (k − 1)(n − 1), 1⟩` has rank
  `kn + (k − 1)(n − 1)` and border rank at most `kn + 1`; at `k = n = 4` it gives
  `16^(ω/3) + 9^(ω/3) ≤ 17`, so `ω < 2.55`.

The roadmap builds on AsymptoticSpectra, whose tensors, restriction, tensor rank, flattening
ranks, square matrix multiplication tensors and exponent `ω` it uses, together with the
statement that restriction is a Strassen preorder whose rank is the tensor rank; it supplies the
border rank and Schönhage's theorem that AsymptoticSpectra leaves out. It uses the circuits of
AlgebraicCircuitsAndValiantsClasses for the comparison of multiplications with rank.

Layer 1 treats rectangular matrix multiplication tensors and circuits; Layer 2 border rank,
interpolation, the tensor `W` and Bini's theorem; Layer 3 disjoint copies, Schönhage's example
and the asymptotic sum inequality. Each layer uses the earlier ones.

## Conventions

- **Field.** `F` is an arbitrary field. Every statement holds over every field, `𝔽₂` included.
- **Tensors.** `CoordTensor F ι` with its `Zero`, `One`, `Add` (direct sum) and `Mul` (Kronecker
  product) instances, restriction `restrictLE`, the tensor rank `tensorRank`, the flattening rank
  `flatRank`, the square matrix multiplication tensor `mmTensor F n` and the exponent
  `matMulExponent F` are copied verbatim from AsymptoticSpectra 3.1–3.3. `R(t)` is the tensor
  rank, `s ≤ t` is restriction, and `s ≈ t` means `s ≤ t` and `t ≤ s`. For three parties,
  restriction is a Strassen preorder (AsymptoticSpectra 3.1): the commutative-semiring laws hold
  up to `≈`, sums and products are monotone, and `Nat.unaryCast r`, written `⟨r⟩`, is the unit
  tensor of size `r`. A decomposition of `t` with `r` terms, that is, factor matrices `A p` with
  `t x = ∑ i, ∏ p, A p (x p) i`, is the same thing as a bilinear algorithm with `r` products
  (Bläser, p. 16).
- **Arrays.** `ofArray3 F a b c T` is the three-party tensor with dimensions `a`, `b`, `c` and
  coordinate `T i j l` at `(i, j, l)`.
- **Rectangular matrix multiplication tensors.** `mmRect F a b c`, written `⟨a, b, c⟩`, has
  dimensions `a * b`, `b * c`, `c * a`; an index of `Fin (u * v)` is read as the pair
  `(x / v, x % v)` by `Fin.divNat` and `Fin.modNat`, and the coordinate is `1` exactly at the
  triples `((i, j), (j, k), (k, i))`. This is the cyclic convention of `mmTensor` (the trilinear
  form `Tr(XYZ)`; Bläser, p. 21, transposes the third index for the same reason), in which a
  cyclic permutation of `a, b, c` is a rotation of the parties. The tensor `mmRect F a a a` has
  the coordinates of `mmTensor F a`, but its dimension function `![a * a, a * a, a * a]` is not
  syntactically `fun _ => a * a`, so the two are related by restriction both ways (1.1).
- **Direct sums of families.** `(List.ofFn fun i => t i).sum` is the direct sum of a family and
  `(List.replicate f t).sum`, written `f ⊙ t`, is `f` disjoint copies of `t`. Both end with
  `+ 0`, which changes nothing up to `≈`: the zero tensor has every dimension `0`.
- **Circuits.** `Gate`, `Circuit` and `Circuit.val` are copied verbatim from
  AlgebraicCircuitsAndValiantsClasses 1.1: gates read a variable or a constant or add or multiply
  two earlier values; there is no division and no subtraction gate. A multiplication gate is
  *nonscalar*, `IsNonscalarMul`, when both its argument values have positive total degree (are not
  constant polynomials); `nonscalarCount c` is their number. `mulComplexity f` is the least
  number of nonscalar multiplications of a circuit having every `f i` among its values: this is
  Ostrowski's measure, in which additions, constants and multiplications by constants are free,
  in its variant without divisions (Bläser, Example 2.7, p. 6, where it is written `C*`). For a
  finite family the set is nonempty (each polynomial has a circuit), so the infimum is attained.
  `bilinearForms a b c T` is the family `l ↦ ∑ i, ∑ j, T i j l x_i y_j` in the variables
  `x_i = X (inl i)` and `y_j = X (inr j)` of `MvPolynomial (Fin a ⊕ Fin b) F`.
- **Approximate decompositions and border rank.** `IsBorderDecomp F t h r` says that there are
  factor matrices `A p` with entries in the polynomial ring `F[X]` and `r` columns such that, for
  every index `x`, the polynomial `∑ i, ∏ p, A p (x p) i` has coefficient `t x` at `Xʰ` and
  coefficient `0` at every lower power. The parameter `X` plays the role of `ε` (Bläser, Def. 6.1,
  p. 26, writes `Rₕ(t)` for the least such `r`). `borderRank F t`, written `R̲(t)`, is the least
  `r` for which some degree `h` works. This is the polynomial definition, valid over every field;
  the definition by Zariski closure of the set of tensors of rank at most `r` is not used.
- **Parties.** With no party a tensor is a scalar `c`, a decomposition with `r` terms forces
  `c = r · 1`, and over `ℚ` the scalar `1/2` has no approximate decomposition at all, so its
  border rank and tensor rank are the junk value `sInf ∅ = 0`, while `1/2 + 1/2 = 1` has border
  rank `1`. Every statement about border rank on a general set of parties therefore assumes
  `[Nonempty ι]`; with a party, every tensor has a decomposition (one term per index), so the
  infima are not junk.
- **The exponent.** `ω = matMulExponent F` is the infimum of the `τ` with `R(⟨n, n, n⟩) ≤ C nᵗ`
  for some `C` and all `n ≥ 1`. AsymptoticSpectra states `2 ≤ ω ≤ log₂ 7`
  (`matMulExponent_spec`), so `ω / 3` lies in `[2/3, 1)` and `0 ^ (ω / 3) = 0`. Real powers are
  taken of natural numbers formed in `ℕ` and then cast, as in `((a * b * c : ℕ) : ℝ)`.
- "Proved here" means that the route is written out in full in this README; it claims no
  novelty.

## Layer 1: matrix multiplication tensors and multiplicative complexity

### 1.1 Rectangular matrix multiplication tensors

Define `ofArray3` and `mmRect` as in the Conventions. Prove `mmRect_spec`: for all natural
numbers `a, b, c, a', b', c'` (zero allowed),

- `⟨a, b, c⟩ ⊗ ⟨a', b', c'⟩ ≈ ⟨aa', bb', cc'⟩` (Bläser, p. 24);
- `R(⟨b, c, a⟩) = R(⟨a, b, c⟩)` and `R(⟨c, b, a⟩) = R(⟨a, b, c⟩)`, so the rank of `⟨a, b, c⟩`
  is invariant under all six permutations of `a, b, c` (Bläser, Lemma 5.5, p. 22);
- `⟨a, a, a⟩ ≈ mmTensor F a`.

(Proved here.)

Route.

- *Products.* An index of the product at party `0` is a pair, read by `Fin.divNat` and
  `Fin.modNat`, of an index `(i₁, j₁)` of `⟨a, b, c⟩` and an index `(i₂, j₂)` of `⟨a', b', c'⟩`.
  Send it to the index `(a' i₁ + i₂, b' j₁ + j₂)` of `⟨aa', bb', cc'⟩`, and likewise at parties
  `1` and `2` with the pairs `(j, k)` and `(k, i)` (`finProdFinEquiv`,
  `Equiv.prodProdProdComm`). This is a bijection of each index set, and since `j₂, j₂' < b'`,
  `j₁ = j₁'` and `j₂ = j₂'` hold together exactly when `b' j₁ + j₂ = b' j₁' + j₂'`; so the
  product of the two coordinates (each `1` or `0`) is the coordinate of the regrouped index. The
  permutation matrices of these bijections and their inverses give restriction both ways.
- *Rotation.* The coordinate of `⟨b, c, a⟩` at `(x₀, x₁, x₂)` is the coordinate of `⟨a, b, c⟩`
  at `(x₂, x₀, x₁)`, and the dimensions correspond. If `A₀, A₁, A₂` are factor matrices of a
  decomposition of `⟨a, b, c⟩` with `r` terms, then `A₁, A₂, A₀` are factor matrices of one of
  `⟨b, c, a⟩`; applying this three times gives the equality of ranks.
- *Transposition.* Write `σ` for the map `(u, v) ↦ (v, u)` of index pairs. The coordinate of
  `⟨c, b, a⟩` at `(y₀, y₁, y₂)` is the coordinate of `⟨a, b, c⟩` at `(σ y₁, σ y₀, σ y₂)`
  (`AB = C` implies `BᵀAᵀ = Cᵀ`). Factor matrices `A₀, A₁, A₂` of `⟨a, b, c⟩` give the factor
  matrices `A₁ ∘ σ, A₀ ∘ σ, A₂ ∘ σ` of `⟨c, b, a⟩`, and the construction is its own inverse.
- *Square case.* The two tensors have the same dimension `a * a` at every party and the same
  coordinates; identity matrices (with `Fin.cast` along the equal dimensions) give restriction
  both ways.

**Checks.**
- The regrouping of the first item turns `⟨a, b, c⟩ ⊗ ⟨a', b', c'⟩` into `⟨aa', bb', cc'⟩`
  exactly, in the indexing of `CoordTensor`, for all `a, …, c'` in `0..2`, and each regrouping is
  a bijection.
- The rotation and transposition identities hold exactly for all `a, b, c` in `0..3`, and
  `mmRect F a a a` has the coordinates of `mmTensor F a` for `a ≤ 4`.
- The non-cyclic convention, with third index `(i, k)` instead of `(k, i)`, is not turned into
  itself by rotating the parties: at `(a, b, c) = (2, 1, 2)` the rotated support differs. The
  cyclic convention is what makes the rotation clause a statement about parties.

*Needs:* AsymptoticSpectra 3.1 (`CoordTensor`, its instances, `restrictLE`, `tensorRank`) and
3.3 (`mmTensor`); Mathlib `finProdFinEquiv`, `Equiv.prodProdProdComm`, `Fin.divNat`,
`Fin.modNat`.

### 1.2 Multiplicative complexity and rank

Define `IsNonscalarMul`, `nonscalarCount`, `mulComplexity` and `bilinearForms` as in the
Conventions, on the circuits of AlgebraicCircuitsAndValiantsClasses 1.1. Prove
`mulComplexity_le_tensorRank_le_two_mul`: over every field, for every array
`T : Fin a → Fin b → Fin c → F`, the multiplicative complexity `L` of its bilinear forms and the
tensor rank `R` of `ofArray3 F a b c T` satisfy `L ≤ R ≤ 2L` (Bläser, Theorem 4.7, p. 17, in
Ostrowski's measure with divisions; Shpilka and Yehudayoff, Theorem 3.23, p. 46, give the lower
bound of circuit size by tensor rank, after Strassen). (Proved here.) The statement here is for
circuits without divisions and holds over every field: Bläser's proof first removes divisions
(Theorem 4.1, p. 14), which needs an infinite field, and this step is not needed here.

Route.

- *`L ≤ R`.* Take a decomposition with `R` terms and factor matrices `A₀, A₁, A₂`. Build a
  circuit with the variables, the constants `A₀ i λ`, `A₁ j λ`, `A₂ l λ`, the linear forms
  `u_λ = ∑ i, A₀ i λ x_i` and `v_λ = ∑ j, A₁ j λ y_j` by multiplications by constants and
  additions, the `R` products `u_λ v_λ`, and the forms `∑ λ, A₂ l λ u_λ v_λ` by multiplications
  by constants and additions. The last are the bilinear forms of `T`. Every multiplication by a
  constant has a constant argument (total degree `0`), so only the `R` products can be nonscalar.
  (With `c = 0` the empty circuit computes the empty family.)
- *`R ≤ 2L`.* Let `H₁`, `H₂` be the homogeneous components of degrees `1` and `2`
  (`MvPolynomial.homogeneousComponent`). By strong induction on the position `k`, `H₂` of the
  value at `k` lies in the span of the products `H₁(g_λ) H₁(h_λ)` over the nonscalar
  multiplication gates `λ ≤ k`, where `g_λ, h_λ` are the argument values of `λ`: for a variable
  or a constant `H₂ = 0`; for a sum `H₂` is additive; for a product `g h`,
  `H₂(g h) = H₀(g) H₂(h) + H₁(g) H₁(h) + H₂(g) H₀(h)`, and if the gate is not nonscalar one
  argument is a constant `C e` (`MvPolynomial.totalDegree_eq_zero_iff_eq_C`), so `H₂(g h)` is
  `e` times `H₂` of the other argument. Each form `f_l` is homogeneous of degree `2` or zero, so
  `f_l = H₂(f_l)` lies in the span of `L` products of linear forms. Write
  `H₁(g_λ) = u_λ(x) + u'_λ(y)` and `H₁(h_λ) = v_λ(x) + v'_λ(y)`. The projection onto the span of
  the monomials `x_i y_j` is linear, fixes `f_l` and sends the product to
  `u_λ(x) v'_λ(y) + v_λ(x) u'_λ(y)` (Bläser, p. 17). Hence each `f_l` is a linear combination of
  `2L` products (linear form in `x`) × (linear form in `y`), and comparing coefficients of
  `x_i y_j` gives a decomposition of `T` with `2L` terms. Nothing divides by `2`, so every
  characteristic is allowed.

**Checks.**
- Winograd's program (Bläser, Example 4.8, p. 18) computes the four entries of a `2 × 2` by
  `2 × 2` product as `(x₁ + y₂)(x₂ + y₁) − x₁x₂ − y₁y₂` with `8` nonscalar products; the `16`
  bilinear parts `u(x)v'(y)` and `u'(y)v(x)` of these products span the four forms (exact rank
  test), and the `x·y` part of each product is the sum of its two bilinear parts.
- Counting every multiplication gate instead of the nonscalar ones would break `L ≤ R`: over
  `ℚ`, for `a = b = c = 1` and `T = 1/2`, the form `½ x y` has rank `1`, but a circuit with one
  multiplication gate multiplies two values with integer coefficients at the variables (only
  additions produce them), so the coefficient of `x y` of every value is an integer; two
  multiplications, one of them by the constant `1/2`, are needed.

*Needs:* AlgebraicCircuitsAndValiantsClasses 1.1 (`Gate`, `Circuit`, `Circuit.val`);
AsymptoticSpectra 3.1 (`tensorRank`); 1.1 (`ofArray3`); Mathlib
`MvPolynomial.homogeneousComponent`, `MvPolynomial.sum_homogeneousComponent`,
`MvPolynomial.totalDegree_eq_zero_iff_eq_C`.

### Examples

`⟨2, 2, 2⟩` and `⟨n, n, n⟩` are the square tensors of AsymptoticSpectra; `⟨2, 2, 3⟩` and its five
permutations have the same rank; `⟨k, 1, n⟩` is the outer product of two vectors and `⟨1, m, 1⟩`
their scalar product.

### Dependencies

AsymptoticSpectra 3.1, 3.3; AlgebraicCircuitsAndValiantsClasses 1.1; Mathlib.

## Layer 2: border rank

### 2.1 Approximate decompositions and border rank

Define `IsBorderDecomp` and `borderRank` as in the Conventions. Prove `isBorderDecomp_spec`: for
a finite nonempty set of parties and tensors `s`, `t`,

- `R̲(t) ≤ r` exactly when `t` has an approximate decomposition with `r` terms of some degree;
- an approximate decomposition of degree `0` with `r` terms exists exactly when `R(t) ≤ r`
  (Bläser, Remark 6.2, p. 27);
- an approximate decomposition of degree `h` with `r` terms is also one of any degree `h' ≥ h`
  with any `r' ≥ r` terms (Remark 6.2);
- if `s ≤ t`, an approximate decomposition of `t` gives one of `s` with the same degree and the
  same number of terms;
- decompositions of `s` (degree `h`, `r` terms) and `t` (degree `h'`, `r'` terms) give one of
  `s ⊕ t` of degree `max h h'` with `r + r'` terms, and one of `s ⊗ t` of degree `h + h'` with
  `r r'` terms (Bläser, Theorem 6.3, p. 27).

(Proved here.) In particular `R̲(t) ≤ R(t)`, the border rank is monotone under restriction, and
it is subadditive and submultiplicative.

Route.

- *Degree `0`.* The constant coefficient is a ring homomorphism, so the constant terms of the
  factor matrices form a decomposition with `r` terms. Conversely a decomposition with `R(t)`
  terms exists (with a party, the set defining `R(t)` is nonempty, so `Nat.sInf_mem`), and zero
  columns pad it to `r` terms; constant polynomials give degree `0`.
- *Raising.* Multiply the factor matrix of one fixed party by `X^(h' − h)`; add zero columns.
- *Border rank.* The set defining `R̲(t)` contains `R(t)` by the degree-`0` item, so `R̲(t)` is
  in it (`Nat.sInf_mem`), and raising the number of terms gives every `r ≥ R̲(t)`; conversely
  `Nat.sInf_le`.
- *Restriction.* If `s.coeff` is the image of `t.coeff` under the Kronecker product of matrices
  `B p` and `A p` are the factor matrices for `t`, the products `B p · A p` (with `B p` read in
  `F[X]`) are factor matrices for `s`: expanding `∏ p, ∑ y, B p (x p) y · A p y i` over tuples
  (`Finset.prod_univ_sum`) and summing over `i` gives the image of the polynomials of `t`, and
  taking coefficients is linear.
- *Sum.* Say `h ≥ h'`. Put the factor matrices of `s` in the first `r` columns, with zero rows at
  the indices of `t`; put those of `t` in the last `r'` columns, with zero rows at the indices of
  `s`, multiplied at one fixed party by `X^(h − h')`. On a tuple all of whose indices lie in `s`
  the polynomial is that of `s`, on one lying in `t` that of `t` times `X^(h − h')`, and on a
  mixed tuple every term has a zero factor. With a party, no tuple lies in both.
- *Product.* At each party take the matrix with entry `A p (x.divNat) i · A' p (x.modNat) i'` at
  row `x` and column `(i, i')` (reindexed by `finProdFinEquiv`). The polynomial at `x` is the
  product of the polynomials of `s` and `t`, whose lowest possibly nonzero coefficients are at
  `Xʰ` and `X^h'` (`Polynomial.coeff_mul`).

**Checks.**
- The tensor `W` of 2.3 has the approximate decomposition
  `(1, X) ⊗ (1, X) ⊗ (0, 1) + (1, 0) ⊗ (1, 0) ⊗ (X, −1)` of degree `1` with `2` terms (exact).
- The vanishing of the lower coefficients is needed: if only the coefficient at `Xʰ` were
  prescribed, `W` would have the one-term "decomposition" `(1, X) ⊗ (1, X) ⊗ (X, 1)` of degree
  `1`, whose coefficient at `X` is `W` and whose constant coefficient is `e₀ ⊗ e₀ ⊗ e₁ ≠ 0`;
  its flattening ranks are `2` (2.3), so that variant would violate 2.2.
- No party: a tensor is a scalar, and a decomposition with `r` terms is the constant polynomial
  `r`. The scalar `1` has an approximate decomposition of degree `0` with `1` term and none of
  degree `1` (its constant coefficient would be `1`), so raising the degree needs a party. With
  the scalar `0` (degree `1`, no term), `1 + 0` is the scalar `1`, which has none of degree
  `max 0 1 = 1` with `1` term, so the sum item needs one too. Over `ℚ` the scalar `1/2` has no
  approximate decomposition, so its tensor rank and border rank are the junk value `0` while it
  has no decomposition of degree `0` with `0` terms: the degree-`0` item needs a party, and
  `1/2 + 1/2 = 1` has border rank `1 > 0 + 0`.

*Needs:* AsymptoticSpectra 3.1 (`CoordTensor`, its instances, `restrictLE`, `tensorRank`);
Mathlib `Polynomial.coeff`, `Polynomial.coeff_mul`, `Polynomial.constantCoeff`,
`Finset.prod_univ_sum`, `finProdFinEquiv`, `Nat.sInf_mem`, `Nat.sInf_le`.

### 2.2 Interpolation and the flattening bound

Prove `tensorRank_le_choose_mul`: over every field, a three-party tensor with an approximate
decomposition of degree `h` with `r` terms has tensor rank at most `C(h + 2, 2) r` (Bläser,
Lemma 6.4, p. 28). Prove `flatRank_le_borderRank`: with a nonempty finite set of parties, for
every set `S` of parties (empty and full included), `flatRank S t ≤ R̲(t)` (Bläser, Lemma 7.1(2),
p. 29, argues with independent slices over `K(ε)`; matrix rank is lower semicontinuous, p. 25).
(Proved here.) The bound `2h + 1` of Bläser's Remark 6.5, which needs an infinite field, is not
claimed.

Route.

- *Interpolation.* Write `A p x i = ∑_α a_{p,α} x i Xᵅ`. The coefficient of `Xʰ` in
  `A₀ x₀ i · A₁ x₁ i · A₂ x₂ i` is the sum over the triples `(α, β, γ)` with `α + β + γ = h`
  (`Finset.Nat.antidiagonalTuple 3 h`) of `a_{0,α} x₀ i · a_{1,β} x₁ i · a_{2,γ} x₂ i`
  (`Polynomial.coeff_mul` twice). Summing over `i`, `t` is a sum of `r` times as many rank-one
  terms as there are triples, namely `C(h + 2, 2)`: for each `α ≤ h` there are `h − α + 1` pairs
  `(β, γ)`, and `∑_{α ≤ h} (h − α + 1) = (h + 1)(h + 2)/2`. Reindexing the columns
  `Fin r × triples` by `Fin (C(h + 2, 2) * r)` gives factor matrices over `F`. Only the
  coefficients up to `Xʰ` are used, so no evaluation point and no size of `F` is needed.
- *Flattening.* Let `A` be an approximate decomposition of degree `h` with `r = R̲(t)` terms
  (2.1). Over the field `K = RatFunc F`, the flattening matrix `M` of the polynomials, with
  entries `∑ i, ∏_{p ∈ S} A p (x p) i · ∏_{p ∉ S} A p (y p) i`, is the product of a matrix with
  `r` columns and a matrix with `r` rows, so its rank is at most `r` (Tau Ceti
  `Matrix.rank_le_iff_exists_eq_mul`). By the vanishing of the lower coefficients,
  `M = Xʰ (M_t + X N)` with `M_t` the flattening of `t` and `N` a matrix over `F[X]`, so
  `M' = M_t + X N` has the same rank over `K`. If rows `x₁, …, x_d` of `M_t` are linearly
  independent over `F`, the same rows of `M'` are linearly independent over `K`: from a relation
  with coefficients in `K`, clear denominators to get polynomial coefficients, not all zero, and
  divide by the highest power of `X` dividing all of them; setting `X = 0` gives a relation among
  the rows of `M_t` with coefficients not all zero. As the rank is the dimension of the row span
  (`Matrix.rank_eq_finrank_span_row`), `flatRank S t ≤ r`.

**Checks.**
- For the decomposition of `W` above (`h = 1`, `2` terms), the `C(3, 2) · 2 = 6` products of
  coefficient vectors of the route add up to `W` exactly; for the decomposition of Schönhage's
  example `⟨3, 1, 3⟩ ⊕ ⟨1, 4, 1⟩` of 3.2 (`h = 2`, `10` terms) the `6 · 10` products add up to the
  tensor exactly.
- No party: the flattening at `∅` of the scalar `1/2` over `ℚ` has rank `1`, while its border
  rank is `0`; the flattening bound needs `[Nonempty ι]`.

*Needs:* 2.1; AsymptoticSpectra 3.2 (`flatRank`); Tau Ceti `Matrix.rank_le_iff_exists_eq_mul`;
Mathlib `Polynomial.coeff_mul`, `Finset.Nat.antidiagonalTuple`,
`Finset.Nat.mem_antidiagonalTuple`, `Sym.card_sym_eq_choose`, `RatFunc`, `Matrix.rank`,
`Matrix.rank_eq_finrank_span_row`.

### 2.3 The tensor W

Define `wTensor F`, the tensor `W` of format `2 × 2 × 2` with coordinate `1` exactly at
`(0, 0, 0)`, `(0, 1, 1)` and `(1, 0, 1)`: the two bilinear forms `a₀b₀` and `a₀b₁ + a₁b₀` of the
product of `a₀ + a₁X` and `b₀ + b₁X` modulo `X²` (Bläser, p. 25). Prove `tensorRank_wTensor`:
over every field, `R(W) = 3` and `R̲(W) = 2` (Bläser, pp. 25–26). (Proved here.)

Route.

- *`R(W) ≤ 3`*: one term per nonzero coordinate.
- *`R(W) ≥ 3`.* The slices of `W` along the last party are the matrices `E₀₀` and `[[0, 1],
  [1, 0]]`, which span the space `S` of matrices `[[α, β], [β, 0]]`, of dimension `2`. If
  `W = ∑_{λ ≤ 2} u_λ ⊗ v_λ ⊗ w_λ` (at most two terms), each slice is a combination of the matrices
  `u_λ v_λᵀ`, so `S` lies in their span, which has dimension at most `2`; hence the span is `S`
  and each `u_λ v_λᵀ` lies in `S`. A matrix `[[α, β], [β, 0]]` of rank at most `1` has
  determinant `−β² = 0`, so `β = 0` in a field; so `S` would lie in the span of `E₀₀`, of
  dimension `1`. This argument uses no property of the field.
- *`R̲(W) ≤ 2`*: the decomposition of the Check of 2.1 (Bläser's two terms of p. 25, multiplied
  by `ε`), with 2.1.
- *`R̲(W) ≥ 2`*: the flattening of `W` at `{2}` has the two independent rows `E₀₀` and
  `[[0, 1], [1, 0]]`, so rank `2`, and 2.2.

**Checks.**
- Over `GF(2)` and `GF(3)`, `W` is not a sum of two rank-one tensors (exhaustive).
- The flattening ranks of `W` at `{0}`, `{1}`, `{2}` are `2`, `2`, `2`.

*Needs:* 2.1, 2.2; AsymptoticSpectra 3.1 (`tensorRank`), 3.2 (`flatRank`).

### 2.4 Bini's theorem and the bound of Bini, Capovani, Lotti and Romani

Prove `rpow_le_borderRank_mmRect`: over every field, for all `a, b, c`,
`(abc)^(ω/3) ≤ R̲(⟨a, b, c⟩)` (Bini; Bläser, Theorem 6.6, p. 28, in the form `ω ≤ 3 log_{abc} r`
for `abc ≥ 2`); and `12^(ω/3) ≤ 10` (Bläser, p. 26 and Corollary 6.7, p. 28). (Proved here.) For
`abc ≤ 1` the first clause holds trivially (`0 ^ (ω/3) = 0`; `1 ≤ R̲(⟨1, 1, 1⟩)` as the tensor
is not zero), so no hypothesis is needed. With 2.1 (`R̲ ≤ R`) the first clause contains
`(abc)^(ω/3) ≤ R(⟨a, b, c⟩)` (Bläser, Theorem 5.9, p. 24) and, at `a = b = c = n`,
`n^ω ≤ R(⟨n, n, n⟩)` (Wigderson and Zuiddam, p. 53); the second clause says
`ω ≤ 3 log₁₂ 10`, and `2.77 < 3 log₁₂ 10 < 2.78`.

Route.

- *Square lower bound (inline).* For `n ≥ 1`, `n^ω ≤ q` where `q = R(mmTensor F n)`. The tensor
  is nonzero, so `q ≥ 1`. By 1.1 (products and the square case),
  `mmTensor F (nʲ) ≈ npowRec j (mmTensor F n)` (for `j = 0` both are `≈ 1`), and by 2.1 at degree
  `0` (restriction and products) `R(mmTensor F (nʲ)) ≤ qʲ`. For `N ≤ N'`,
  `mmTensor F N ≤ mmTensor F N'` by the inclusion `Fin N → Fin N'` on both coordinates of each
  index pair, so the rank is monotone in `N`. If `n = 1` the claim is `1 ≤ q`. If `n ≥ 2`, put
  `ρ = log_n q ≥ 0`; for `N ≥ 1` let `j = Nat.clog n N`, so `N ≤ nʲ` and, if `j ≥ 1`,
  `n^(j − 1) < N`. Then `R(mmTensor F N) ≤ qʲ = q (n^(j − 1))^ρ ≤ q N^ρ`, and for `j = 0`
  (`N = 1`) `R = 1 ≤ q`. So `ρ` lies in the set defining `ω` (with `C = q`). That set is bounded
  below by `0`: for `τ < 0`, `C Nᵗ` tends to `0` while `R(mmTensor F N) ≥ 1`. Hence `ω ≤ ρ`
  (`csInf_le`) and `n^ω ≤ q` (`Real.rpow_le_rpow_left_iff`).
- *First clause.* If `abc = 0` the left side is `0`. Otherwise let `r = R̲(⟨a, b, c⟩)` with an
  approximate decomposition of degree `h` (2.1). The rotation of 1.1, applied to the polynomial
  factor matrices (the coordinates of `⟨b, c, a⟩` at `(x₀, x₁, x₂)` are those of `⟨a, b, c⟩` at
  `(x₂, x₀, x₁)`), gives approximate decompositions of `⟨b, c, a⟩` and `⟨c, a, b⟩` of degree `h`
  with `r` terms. By 2.1 (product) the product of the three has one of degree `3h` with `r³`
  terms, and by 1.1 the product is `≈ ⟨N, N, N⟩ ≈ mmTensor F N`, `N = abc`. Powers (2.1 and 1.1
  again) give an approximate decomposition of `mmTensor F (Nˢ)` of degree `3hs` with `r^(3s)`
  terms, so `R(mmTensor F (Nˢ)) ≤ C(3hs + 2, 2) r^(3s)` by 2.2, and the square lower bound gives
  `N^(sω) ≤ C(3hs + 2, 2) r^(3s)`. Taking `3s`-th roots, `N^(ω/3) ≤ C(3hs + 2, 2)^(1/(3s)) r`,
  and the factor tends to `1` because `C(3hs + 2, 2) ≤ (3h + 2)² (s + 1)²` grows polynomially.
- *Second clause.* Bini, Capovani, Lotti and Romani's five products approximate three entries of
  a `2 × 2` matrix product to first order (Bläser, p. 26); two copies, the first on rows `(0, 1)`
  of the left factor and columns `(0, 1)` of the right factor, the second on rows `(1, 0)` and
  columns `(2, 1)`, give an approximate decomposition of `⟨2, 2, 3⟩` of degree `1` with `10`
  terms and integer coefficients (Check), valid in every field. So `R̲(⟨2, 2, 3⟩) ≤ 10` by 2.1,
  and the first clause with `abc = 12` gives `12^(ω/3) ≤ 10`.

**Checks.**
- The two glued copies of the five products, written in the indexing of `mmRect F 2 2 3` (party
  `2` index `k * 2 + i` for the entry `(i, k)` of the product), form an approximate decomposition
  of degree `1` with `10` terms: at every index the constant coefficient is `0` and the
  coefficient of `X` is the coordinate (exact, integer coefficients).
- `12^278 > 10^300` and `12^277 < 10^300`, so `2.77 < 3 log₁₂ 10 < 2.78`: the second clause is a
  bound below `log₂ 7` but not below `2.77`.

*Needs:* 1.1, 2.1, 2.2; AsymptoticSpectra 3.1 (`isStrassenPreorder_restrictLE`: transitivity of
restriction and compatibility of `≈` with products), 3.3 (`mmTensor`, `matMulExponent`,
`matMulExponent_spec` for `2 ≤ ω`); Mathlib `Nat.clog`, `Real.rpow_natCast`,
`Real.rpow_le_rpow_left_iff`, `Real.logb`, `csInf_le`, `tendsto_pow_const_div_const_pow_of_one_lt`.

### Examples

`W`: rank `3`, border rank `2`. `⟨2, 2, 3⟩`: border rank at most `10`.

### Dependencies

Layer 1; AsymptoticSpectra 3.1–3.3; Tau Ceti `Matrix.rank_le_iff_exists_eq_mul`; Mathlib.

## Layer 3: Schönhage's asymptotic sum inequality

### 3.1 Disjoint copies

Prove `rpow_le_ceil_div`: over every field, for `f ≥ 1`, if `g` is the tensor rank of
`f ⊙ ⟨k, m, n⟩`, then `(kmn)^(ω/3) ≤ ⌈g / f⌉` (Bläser, Lemma 7.7, p. 32, in the form
`ω ≤ 3 log⌈g/f⌉ / log(kmn)`). (Proved here.)

Route. Put `q = ⌈g / f⌉`, so `g ≤ q f`. If `kmn = 0` the left side is `0`.

- *Claim: `R(f ⊙ ⟨kˢ, mˢ, nˢ⟩) ≤ qˢ f` for `s ≥ 1`* (Bläser, p. 32). For `s = 1` this is
  `g ≤ q f`. For the step, by distributivity up to `≈` and 1.1,
  `f ⊙ ⟨k^(s+1), m^(s+1), n^(s+1)⟩ ≈ (f ⊙ ⟨k, m, n⟩) ⊗ ⟨kˢ, mˢ, nˢ⟩`. By AsymptoticSpectra 3.1
  (`abstractRank_restrictLE`), `g` is the infimum of the `r` with `f ⊙ ⟨k, m, n⟩ ≤ ⟨r⟩`. That set
  is nonempty: `1 ≤ 0` fails (`⟨1⟩ = 0 + 1 ≈ 1`, `⟨0⟩ = 0`, and `Nat.unaryCast` reflects the
  order), so the Archimedean law of `isStrassenPreorder_restrictLE` with `b = 1` gives
  `f ⊙ ⟨k, m, n⟩ ≤ ⟨r⟩ ⊗ 1 ≈ ⟨r⟩` for some `r`. Hence `f ⊙ ⟨k, m, n⟩ ≤ ⟨g⟩` (`Nat.sInf_mem`), so
  the product is
  `≤ ⟨g⟩ ⊗ ⟨kˢ, mˢ, nˢ⟩ ≈ g ⊙ ⟨kˢ, mˢ, nˢ⟩ ≤ (q f) ⊙ ⟨kˢ, mˢ, nˢ⟩ ≈ q ⊙ (f ⊙ ⟨kˢ, mˢ, nˢ⟩)`,
  using `u ≤ u + v` (the zero tensor is a restriction of every tensor, and sums are monotone).
  Rank is monotone, subadditive and submultiplicative (2.1 at degree `0`), so the rank is at most
  `q · qˢ f`.
- *Conclusion.* As `f ≥ 1`, `⟨kˢ, mˢ, nˢ⟩ ≤ f ⊙ ⟨kˢ, mˢ, nˢ⟩`, so
  `R(⟨kˢ, mˢ, nˢ⟩) ≤ qˢ f`. Bini's theorem (2.4) with `R̲ ≤ R` (2.1) gives
  `(kmn)^(sω/3) ≤ qˢ f`, so `(kmn)^(ω/3) ≤ q f^(1/s)` for every `s ≥ 1`, and `f^(1/s) → 1`.

**Checks.**
- `f ≥ 1` is needed: for `f = 0` and `k = m = n = 1` the empty sum is the zero tensor, of rank
  `0`, and `⌈0/0⌉ = 0`, while the left side is `1`.

*Needs:* 1.1, 2.1, 2.4; AsymptoticSpectra 3.1 (`isStrassenPreorder_restrictLE`,
`abstractRank_restrictLE`), 3.3 (`matMulExponent`); Mathlib `Nat.ceil`, `Nat.le_ceil`,
`Nat.sInf_mem`, `Real.rpow_natCast`.

### 3.2 Schönhage's example

Prove `tensorRank_add_and_borderRank_le`: over every field, for all `k, n, m`,
`R(⟨k, 1, n⟩ ⊕ ⟨1, m, 1⟩) = kn + m`, and
`R̲(⟨k, 1, n⟩ ⊕ ⟨1, (k − 1)(n − 1), 1⟩) ≤ kn + 1` (Schönhage; Bläser, Lemma 7.1, p. 29, with the
construction written for `k = n = 3` on p. 30). (Proved here.) The subtraction is in `ℕ`: for
`k = 0` or `n = 0` the second summand is `⟨1, 0, 1⟩`, the zero tensor up to `≈`, and the bound
holds trivially. Since the flattening ranks give `R̲(⟨k, 1, n⟩) = kn` and `R̲(⟨1, m, 1⟩) = m`, the
second statement shows that border rank is not additive.

Route.

- *Upper bound for the rank.* `⟨k, 1, n⟩` has `kn` nonzero coordinates and `⟨1, m, 1⟩` has `m`;
  one term each, and 2.1 (degree `0`, sum).
- *Lower bound for the rank.* Let `A₀, A₁, A₂` be factor matrices of a decomposition with `r`
  terms. At party `0` the first `k` indices belong to `⟨k, 1, n⟩` (variables `a_i`) and the last
  `m` to `⟨1, m, 1⟩` (variables `u_l`); at party `1`, `n` indices `b_j` and `m` indices `v_l`; at
  party `2`, `nk` indices and one last index for the scalar product. Restricting the coordinates
  to the `u`-rows, the `v`-rows and the last index of party `2` gives the identity matrix of size
  `m` as `U D Vᵀ`, with `U` the `m × r` block of `A₀` on the `u`-rows. So `U` has rank `m`, and
  some `m` columns `λ₁, …, λ_m` of `U` form an invertible matrix. Choose `G` (`k × m`) with
  `A₀ i λ_j + ∑ l, G i l · A₀ (k + l) λ_j = 0` for all `i < k` and `j ≤ m`, and restrict by the
  matrices `[I | G]` at party `0`, `[I | 0]` at party `1` and `[I | 0]` at party `2`: the image is
  `⟨k, 1, n⟩` (the `v`-rows and the last output are deleted, and mixed tuples have coordinate
  `0`). Its coordinate at `x` is `∑ y, ∏ p, B p (x p) (y p) · ∑ i, ∏ p, A p (y p) i` for these
  matrices `B p`, which is `∑ i, ∏ p, (B p · A p) (x p) i` (`Finset.prod_univ_sum`); so the
  factor matrices `[I | G] A₀`, `[I | 0] A₁`, `[I | 0] A₂` decompose it, and their columns
  `λ₁, …, λ_m` vanish at party `0`. So `R(⟨k, 1, n⟩) ≤ r − m`. The flattening of `⟨k, 1, n⟩` at
  `{2}` has `kn` rows with disjoint supports, so `R(⟨k, 1, n⟩) ≥ kn` (2.2 and 2.1), and
  `r ≥ kn + m`. Bläser sketches this lower bound by the substitution method; the route above is
  its form in matrices.
- *Border rank.* For `k, n ≥ 1`, index the `m = (k − 1)(n − 1)` variables of `⟨1, m, 1⟩` by pairs
  `(i, j)` with `i < k − 1`, `j < n − 1` (`finProdFinEquiv`). The `kn + 1` products are
  `(a_i + X u_ij)(b_j + X v_ij)` for `i < k − 1`, `j < n − 1`;
  `(a_{k−1} − X ∑_{i'} u_{i'j}) b_j` for `j < n − 1`; `a_i (b_{n−1} − X ∑_{j'} v_{ij'})` for
  `i < k − 1`; `a_{k−1} b_{n−1}`; and `(∑ a)(∑ b)`. The first `kn` products are each
  `a_i b_j + O(X)` and are sent to `X² e_(j,i) + e_*`, the last to `−e_*`, where `e_(j,i)` is the
  output of `a_i b_j` and `e_*` that of the scalar product. The coefficient of `X²` is then the
  tensor and the lower coefficients vanish: in the sum of the first `kn` products the terms of
  order `X` cancel and the terms of order `X⁰` add up to `(∑ a)(∑ b)`, leaving
  `X² ∑ u_ij v_ij` (Check). So the degree is `2` and 2.1 gives the bound.

**Checks.**
- The construction is an approximate decomposition of degree `2` with `kn + 1` terms, in the
  indexing of the direct sum of `CoordTensor`, for all `k, n` in `1..4` with `kn ≤ 9` and for
  `k = n = 4` (`⟨4, 1, 4⟩ ⊕ ⟨1, 9, 1⟩`, `17` terms), exactly.
- The flattening ranks of `⟨3, 1, 3⟩ ⊕ ⟨1, 4, 1⟩` and `⟨4, 1, 4⟩ ⊕ ⟨1, 9, 1⟩` reach `10` and `17`,
  so by 2.2 the border rank bound is attained there.
- Over `GF(2)`, `⟨2, 1, 1⟩ ⊕ ⟨1, 1, 1⟩`, `⟨1, 1, 2⟩ ⊕ ⟨1, 2, 1⟩` and `⟨2, 1, 2⟩ ⊕ ⟨1, 1, 1⟩` are
  not sums of `2`, `3`, `4` rank-one tensors (exhaustive), as `R = kn + m` predicts.

*Needs:* 2.1, 2.2; AsymptoticSpectra 3.1 (`tensorRank`, `restrictLE`); Mathlib
`finProdFinEquiv`, `Finset.prod_univ_sum`.

### 3.3 The asymptotic sum inequality

Prove `sum_rpow_le_borderRank`: over every field, for every `p` and all
`k, m, n : Fin p → ℕ`,
`∑ᵢ (kᵢ mᵢ nᵢ)^(ω/3) ≤ R̲(⟨k₀, m₀, n₀⟩ ⊕ ⋯ ⊕ ⟨k_{p−1}, m_{p−1}, n_{p−1}⟩)`; and
`16^(ω/3) + 9^(ω/3) ≤ 17` (Schönhage's τ-theorem; Bläser, Theorem 7.5, p. 31, with proof on
pp. 32–34, and Corollary 7.8, p. 34, which draws `ω ≤ 2.55` from Schönhage's example;
Wigderson and Zuiddam, Theorem 4.12 and its footnote 51, p. 53, state this form, with the
algebro-geometric border rank). (Proved here.)
Bläser assumes `r > p` and concludes `ω ≤ 3τ` with `∑ᵢ (kᵢmᵢnᵢ)^τ = r`; the statement here has no
hypothesis, and the route below proves it directly.

Route. Write `Nᵢ = kᵢ mᵢ nᵢ`, `τ₀ = ω/3`, `P` for the set of `i` with `Nᵢ ≥ 1` and `q` for its
size, `T` for the direct sum and `r = R̲(T)`. Since `τ₀ > 0` (AsymptoticSpectra,
`matMulExponent_spec`), the terms with `Nᵢ = 0` are `0`, and the left side is
`S = ∑_{i ∈ P} Nᵢ^τ₀`.

1. *`q ≤ r`.* `flatRank {0}` is a point of the asymptotic spectrum (AsymptoticSpectra 3.2,
   `flatRank_mem_asymptoticSpectrum`, as `{0}` is neither empty nor everything), hence additive,
   with value `0` at the zero tensor, so `flatRank {0} T = ∑ᵢ flatRank {0} ⟨kᵢ, mᵢ, nᵢ⟩`
   (induction along the list). If `abc ≥ 1`, the flattening of `⟨a, b, c⟩` at `{0}` has `ab`
   nonzero rows with disjoint supports, so rank `ab ≥ 1`. Hence `flatRank {0} T ≥ q`, and 2.2
   gives `q ≤ r`. If `q = 0` then `S = 0`; assume `q ≥ 1`.
2. *Powers.* By 2.1 there is an approximate decomposition of `T` of degree `h` with `r` terms,
   and by the product item of 2.1 (induction, starting from the constant decomposition of `1`)
   one of `npowRec s T` of degree `hs` with `rˢ` terms.
3. *Expansion.* By the Strassen preorder laws for three parties (AsymptoticSpectra 3.1,
   `isStrassenPreorder_restrictLE`: distributivity, associativity and commutativity up to `≈`,
   and compatibility of `≈` with sums and products), `npowRec s T` is `≈` the direct sum over all
   words `w ∈ (Fin p)ˢ` of the products `⟨k_{w₁}, m_{w₁}, n_{w₁}⟩ ⊗ ⋯ ⊗ ⟨k_{wₛ}, m_{wₛ}, n_{wₛ}⟩`
   (induction on `s`; the empty word gives `1`, which is `≈ ⟨1, 1, 1⟩` by identity matrices, both
   having dimension `1` at every party and coordinate `1`), and by 1.1 each product is
   `≈ ⟨k^σ, m^σ, n^σ⟩`, where `σᵢ` counts the
   letters `i` of `w` (the type of `w`) and `k^σ = ∏ᵢ kᵢ^σᵢ`.
4. *One type.* Fix a type `σ` supported in `P` with `∑ σᵢ = s`, and let `f_σ ≥ 1` be the number
   of words of type `σ`. Grouping these words first, `npowRec s T ≈ f_σ ⊙ ⟨k^σ, m^σ, n^σ⟩ + V`
   for some `V`, and `u ≤ u + V`; so by 2.1 (restriction) `f_σ ⊙ ⟨k^σ, m^σ, n^σ⟩` has an
   approximate decomposition of degree `hs` with `rˢ` terms, and by 2.2 its rank is at most
   `g_s = C(hs + 2, 2) rˢ`.
5. *Disjoint copies.* By 3.1, `(N^σ)^τ₀ ≤ ⌈R / f_σ⌉ < R / f_σ + 1` with `N^σ = ∏ᵢ Nᵢ^σᵢ` and
   `R ≤ g_s` the rank of step 4 (`Nat.ceil_lt_add_one`), so `f_σ (N^σ)^τ₀ ≤ g_s + f_σ`.
6. *Counting.* `f_σ ≤ qˢ ≤ rˢ`, since the words of type `σ` use only the `q` letters of `P`, and
   `q ≤ r` by step 1.
7. *Choice of the type.* `Sˢ = ∑_{w ∈ Pˢ} ∏ⱼ N_{wⱼ}^τ₀` (`Finset.prod_univ_sum`), and grouping the
   words by type, `Sˢ = ∑_σ f_σ (N^σ)^τ₀` (`Real.mul_rpow` for nonnegative factors). There are at
   most `(s + 1)^q` types, so some type has `f_σ (N^σ)^τ₀ ≥ Sˢ / (s + 1)^q`.
8. *Combination.* By steps 5–7, `Sˢ ≤ (s + 1)^q (g_s + rˢ) = c_s rˢ` with
   `c_s = (s + 1)^q (C(hs + 2, 2) + 1) ≤ (h + 2)² (s + 1)^(q + 2)`.
9. *Limit.* So `S ≤ c_s^(1/s) r` for every `s ≥ 1`. For every `ε > 0`, `c_s ≤ (1 + ε)ˢ` for large
   `s` (`tendsto_pow_const_div_const_pow_of_one_lt`), so `S ≤ (1 + ε) r`, and `S ≤ r`.

*Second clause.* For `k = n = 4`, 3.2 gives `R̲(⟨4, 1, 4⟩ ⊕ ⟨1, 9, 1⟩) ≤ 17`. The family
`(4, 1, 4), (1, 9, 1)` has direct sum `⟨4, 1, 4⟩ + (⟨1, 9, 1⟩ + 0)`, which is `≈` that tensor
(zero laws), so its border rank is at most `17` (2.1), and the first clause gives
`16^(ω/3) + 9^(ω/3) ≤ 17`.

**Checks.**
- The flattening ranks of `⟨a, b, c⟩` at `{0}`, `{1}`, `{2}` are `ab`, `bc`, `ca` for all
  `a, b, c` in `1..3`, and `0` for `⟨0, 2, 2⟩` (step 1).
- The number of types, `C(s + q − 1, q − 1)`, is at most `(s + 1)^(q − 1)` for `s, q ≤ 12`.
- `10.55⁵ < 2¹⁷` and `6.46¹⁰ < 3¹⁷`, so `16^(17/20) + 9^(17/20) > 17.01`; as `x ↦ 16ˣ + 9ˣ` is
  increasing, the second clause forces `ω/3 < 17/20`, that is, `ω < 2.55`.

*Needs:* 1.1, 2.1, 2.2, 3.1, 3.2; AsymptoticSpectra 3.1 (`isStrassenPreorder_restrictLE`), 3.2
(`flatRank_mem_asymptoticSpectrum`), 3.3 (`matMulExponent_spec`); Mathlib
`Finset.prod_univ_sum`, `Real.mul_rpow`, `Nat.ceil_lt_add_one`,
`tendsto_pow_const_div_const_pow_of_one_lt`.

### Examples

Schönhage's example at `k = n = 4`: border rank at most `17` and `ω < 2.55`; at `k = n = 3`:
border rank `10`, rank `13`. One summand (`p = 1`) is Bini's theorem 2.4.

### Dependencies

Layers 1 and 2; AsymptoticSpectra 3.1–3.3; Mathlib.

## Scope and ownership

This roadmap develops bilinear complexity and border rank for the tensors of AsymptoticSpectra
and owns: the three-party tensor of an array and the rectangular matrix multiplication tensors
with their product formula and symmetries (1.1); nonscalar multiplications, multiplicative
complexity and the comparison `L ≤ R ≤ 2L` for division-free circuits (1.2); approximate
decompositions and border rank with their algebra (2.1); interpolation and the flattening bound
(2.2); the tensor `W` (2.3); Bini's theorem and the bound of Bini, Capovani, Lotti and Romani
(2.4); Bläser's lemma on disjoint copies (3.1); Schönhage's example (3.2); and Schönhage's
asymptotic sum inequality (3.3).

It builds on AsymptoticSpectra (Layer 3), whose `CoordTensor`, instances, `restrictLE`,
`tensorRank`, `flatRank`, `mmTensor` and `matMulExponent` are copied verbatim, and whose
statements `isStrassenPreorder_restrictLE`, `abstractRank_restrictLE`,
`flatRank_mem_asymptoticSpectrum` and `matMulExponent_spec` are used in the routes. It restates
none of them: Strassen's seven products, `2 ≤ ω ≤ log₂ 7`, `2^ω` as an asymptotic rank, the
flattening ranks as spectral points, the Strassen preorder and `n² ≤ R(⟨n, n, n⟩) ≤ n³` are
AsymptoticSpectra 3.1–3.3. It supplies the border rank and Schönhage's τ-theorem that
AsymptoticSpectra lists as not treated there. It uses the circuits of
AlgebraicCircuitsAndValiantsClasses (Layer 1.1, copied verbatim) and restates none of its
theorems; that roadmap lists tensor rank, matrix multiplication tensors and border complexity as
not treated there.

Library survey. Pinned Mathlib has holors with their CP rank `Holor.cprank`
(`Mathlib/Data/Holor.lean`), related to `tensorRank` by AsymptoticSpectra 3.1, and no border
rank, approximate decomposition, matrix multiplication tensor, multiplicative complexity or
exponent of matrix multiplication. Pinned Tau Ceti has the rank factorization of matrices
(`Matrix.rank_le_iff_exists_eq_mul`, used in 2.2) and the Kronecker power of one matrix, and no
tensor rank, border rank, circuit or exponent of matrix multiplication.

These are standard facts of the theory of fast matrix multiplication of the kind the preprint
*The matrix multiplication exponent is nine fourths* (OpenAI, 2026; public repository
`openai/math`, Apache-2.0) recalls in its historical introduction; nothing here rests on it, none
of its results is stated, and no declaration here is taken from its Lean development.

Not treated here: the elimination of divisions (Strassen) and the equality of the bilinear
exponent with the exponent of arithmetic circuits over infinite fields; the equality of `ω` with
the exponent of division-free circuit size is not treated either. Also not treated: the
definition of border rank by Zariski closure and its agreement with the one here over
algebraically closed fields; lower bounds such as `R(⟨n, n, n⟩) ≥ 2n² − 1`, `R(⟨2, 2, 2⟩) = 7`
and the border rank of `⟨2, 2, 2⟩`; Strassen's laser method, the method of Coppersmith and
Winograd and the upper bounds on `ω` that followed; the group-theoretic approach to `ω`;
asymptotic spectra beyond the statements of AsymptoticSpectra used above.

## Exact supplier contracts

### From Mathlib

- `MvPolynomial`, `MvPolynomial.X`, `MvPolynomial.C`, `MvPolynomial.totalDegree`,
  `MvPolynomial.totalDegree_eq_zero_iff_eq_C` (`Mathlib/Algebra/MvPolynomial/Degrees.lean`; total
  degree `0` exactly for constants), `MvPolynomial.homogeneousComponent`,
  `MvPolynomial.sum_homogeneousComponent` (`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`):
  1.2.
- `Polynomial` (`F[X]`), `Polynomial.coeff`, `Polynomial.coeff_mul`
  (`Mathlib/Algebra/Polynomial/Coeff.lean`), `Polynomial.constantCoeff` (a ring homomorphism):
  2.1, 2.2. `RatFunc` (the field of rational functions over a field): 2.2.
- `Matrix.rank`, `Matrix.rank_eq_finrank_span_row` (over a field, finitely many rows;
  `Mathlib/LinearAlgebra/Matrix/Rank.lean`): 2.2.
- `Finset.Nat.antidiagonalTuple`, `Finset.Nat.mem_antidiagonalTuple`
  (`Mathlib/Data/Fin/Tuple/NatAntidiagonal.lean`), `Sym.card_sym_eq_choose`
  (`Mathlib/Data/Sym/Card.lean`): 2.2.
- `Finset.prod_univ_sum` (a product of sums is a sum over choice functions,
  `Mathlib/Algebra/BigOperators/Ring/Finset.lean`): 2.1, 3.2, 3.3.
- `finProdFinEquiv` (`Mathlib/Logic/Equiv/Fin/Basic.lean`), `Equiv.prodProdProdComm`
  (`Mathlib/Logic/Equiv/Prod.lean`), `Fin.divNat`, `Fin.modNat`: 1.1, 2.1, 3.2.
- `Nat.sInf_mem` (a nonempty set of natural numbers contains its infimum), `Nat.sInf_le`
  (`Mathlib/Order/Lattice/Nat.lean`): 2.1, 3.1; `csInf_le` (a member of a set bounded below is at
  least its infimum; `Mathlib/Order/ConditionallyCompleteLattice/Defs.lean`): 2.4.
- `Nat.clog` (`Mathlib/Data/Nat/Log.lean`), `Real.logb`, `Real.rpow_natCast`,
  `Real.rpow_le_rpow_left_iff` (base `> 1`), `Real.mul_rpow` (nonnegative factors)
  (`Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`): 2.4, 3.1, 3.3.
- `Nat.ceil`, `Nat.le_ceil`, `Nat.ceil_lt_add_one` (nonnegative argument;
  `Mathlib/Algebra/Order/Floor/Semiring.lean`): 3.1, 3.3.
- `tendsto_pow_const_div_const_pow_of_one_lt` (`nᵏ / aⁿ → 0` for `a > 1`;
  `Mathlib/Analysis/SpecificLimits/Normed.lean`): 2.4, 3.3.
- `List.ofFn`, `List.replicate`, `List.sum` (needs only `Add` and `Zero`): the direct sums of the
  Conventions.

### From Tau Ceti

- `Matrix.rank_le_iff_exists_eq_mul` (`TauCeti/LinearAlgebra/Matrix/Rank.lean`; over a field,
  finitely many columns): the rank of a matrix is at most `r` exactly when it is a product through
  `Fin r`; used in 2.2 over `RatFunc F`.

### From TauCetiRoadmap.AsymptoticSpectra

- 3.1 `CoordTensor`, its `Zero`, `One`, `Add`, `Mul` instances, `restrictLE`, `tensorRank`
  (copied verbatim): every layer.
- 3.1 `isStrassenPreorder_restrictLE` (`2 ≤ Fintype.card ι`; here three parties): 2.4, 3.1, 3.3.
- 3.1 `abstractRank_restrictLE` (any finite set of parties: `t ≤ ⟨r⟩` exactly when
  `R(t) ≤ r`): 3.1.
- 3.2 `flatRank` (copied verbatim): 2.2, 2.3, 3.2, 3.3; `flatRank_mem_asymptoticSpectrum`
  (`S` nonempty and not everything): 3.3.
- 3.3 `mmTensor`, `matMulExponent` (copied verbatim) and `matMulExponent_spec` (over every
  field, `2 ≤ ω ≤ log₂ 7`): 1.1, 2.4, 3.1, 3.3.

### From TauCetiRoadmap.AlgebraicCircuitsAndValiantsClasses

- 1.1 `Gate`, `Circuit`, `Circuit.val` (copied verbatim; over a commutative semiring, here a
  field): 1.2.

## References

- M. Bläser, *Fast matrix multiplication*, Theory of Computing Library, Graduate Surveys 5
  (2013), pp. 1–60, open at the journal's site (`theoryofcomputing.org`); printed page numbers.
  Cited as "Bläser". Used: Ex. 2.7, p. 6; Thm 4.1, p. 14; Def. 4.4 and p. 16; Thm 4.7, p. 17;
  Ex. 4.8, p. 18; p. 21; Lemma 5.5, p. 22; p. 24 and Thm 5.9, p. 24; p. 25; p. 26 and Def. 6.1,
  p. 26; Remark 6.2 and Thm 6.3, p. 27; Lemma 6.4, Remark 6.5, Thm 6.6, Cor. 6.7, p. 28;
  Lemma 7.1, p. 29; p. 30; Thm 7.5, p. 31; Lemma 7.7, p. 32; pp. 32–34; Cor. 7.8, p. 34.
- A. Wigderson and J. Zuiddam, *Asymptotic spectra: theory, applications and extensions*, Bull.
  Amer. Math. Soc., final version 2025 from A. Wigderson's page; pages of that PDF. Used:
  Thm 4.12 and footnote 51, p. 53.
- A. Shpilka and A. Yehudayoff, *Arithmetic circuits: a survey of recent results and open
  questions*, Foundations and Trends in Theoretical Computer Science 5 (2010), authors' PDF
  (printed page numbers). Used: Thm 3.23, p. 46.
- Attributed in prose without locators (no open copy was read): V. Strassen, *Vermeidung von
  Divisionen*, J. reine angew. Math. 264 (1973); D. Bini, M. Capovani, F. Romani and G. Lotti,
  *O(n^2.7799) complexity for n × n approximate matrix multiplication*, Inform. Process. Lett.
  8 (1979); A. Schönhage, *Partial and total matrix multiplication*, SIAM J. Comput. 10 (1981).
