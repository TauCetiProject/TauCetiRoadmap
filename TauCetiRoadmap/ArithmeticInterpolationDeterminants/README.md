# Polynomial interpolation and arithmetic determinants

Develop polynomial jet evaluation, algebraic Hermite interpolation, and the general
rank, divisibility, and size comparisons used for arithmetic interpolation determinants.
The construction should connect native polynomial spaces to finite matrices over rings,
their reductions, and norms in number fields. Include a usable theory of the maps,
their kernels, scalar extension, and classical examples.

`README.md` is definitive. `Suggested.lean` gives representative signatures, not an
exhaustive checklist. The library results take arbitrary points, supports, derivative
orders, ideals, and bounds. A particular auxiliary matrix, support choice, prime-exponent
formula, or parameter optimization in a research proof is outside this roadmap.

## Carriers, conventions, and suppliers

Use native `Polynomial`, `MvPolynomial`, `Submodule`, `Basis`, `LinearMap`, `Matrix`,
`Ideal`, and `Algebra.norm`. Use native polynomial degree-restricted submodules and
monomial bases; specify arbitrary finite support restrictions as submodules with their
coefficient conditions. Do not define a new polynomial, absolute value, or height.

The bivariate carrier is `MvPolynomial (Fin 2) R`: variable `0` is `Z`, variable `1`
is `W`. The ordinary derivative in `Z` is `MvPolynomial.pderiv 0`; the Hasse derivative
is the native multivariate Hasse derivative with multi-index `k e₀`. Evaluation in
`R[X]` is the native algebra homomorphism. Transport to `R[W][Z]` is a comparison
equivalence, not a separate primary carrier. Factorials are never silently cancelled
in a ring of positive characteristic or in an integral divisibility argument.

| Supplier | Consume | New work here |
| --- | --- | --- |
| Mathlib polynomial Hasse derivatives, Taylor expansion, root multiplicity, and polynomial CRT | Univariate derivatives, product formula, root count, coprimality of distinct linear factors | Finite jet-map and interpolation comparisons |
| Tau Ceti [`Algebra/Polynomial/HasseDeriv.lean`](https://github.com/TauCetiProject/TauCeti/blob/29bc6871728983707bc42137a8a1cd941b898bd7/TauCeti/Algebra/Polynomial/HasseDeriv.lean) | `exists_eval_hasseDeriv_ne_zero_of_natDegree_lt` and finite-set jet bounds | Adapters to the finite polynomial spaces and matrices below |
| Tau Ceti `RingTheory/MvPolynomial/HasseDeriv/Taylor.lean` and `RingTheory/MvPolynomial/Kronecker.lean` | Multivariate Hasse calculus, `injOn_aeval_X_pow`, `linearIndependent_aeval_X_pow` | Two-variable degree-strip and Frobenius specializations |
| [DiophantineApproximationAndTranscendence §§0.1–0.3, 1.4](../DiophantineApproximationAndTranscendence/README.md) | Polynomial lengths/heights, evaluation bounds, native Wronskians, coefficient-map comparisons | Jet matrices and determinant applications, without another height or Wronskian |
| Mathlib matrix rank, determinant, and basis APIs | Rank, determinant functoriality, basis matrices, finite-dimensional linear algebra | Missing full-row minors and reduction/coordinate adapters |
| Tau Ceti `LinearAlgebra/Matrix/AbsoluteValue.lean` and Mathlib Hadamard bounds | `Matrix.abv_det_le_prod_sum_abv`, `Matrix.det_le`, existing expansion bounds | Row-dependent, embedding, and logarithmic interfaces |
| [GlobalNumberFields](../../Completed/GlobalNumberFields/README.md) / [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md); Mathlib number-field norms and rings of integers | Integral norms, norm multiplicativity, product over embeddings, integral bases | Scalar divisibility and determinant-size packages |
| [GrothendieckNotesLemmas](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1431) and [CharacterSumsOverFiniteFields §4.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1712) | General Hasse, multiplicity, rank, and determinant results in their stated generality | Use one supplier for each general theorem; this roadmap owns the interpolation assembly |

The Tau Ceti source paths are in [Tau Ceti](https://github.com/TauCetiProject/TauCeti).
Existing results are inputs, not tasks to prove a second time. Missing prerequisites
within a cited supplier are targets of that supplier; the targets below specify the
additional comparisons that join these developments.

For Hadamard bounds, follow the finite-matrix API in
[Mathlib PR #40683](https://github.com/leanprover-community/mathlib4/pull/40683) where
it overlaps I4. Consume the existing absolute-value and determinant-expansion
estimates as well; build missing row/embedding adapters in Tau Ceti, adopting the
upstream interface rather than waiting for that PR or creating another norm.

## I0. Finite polynomial spaces and jet evaluation

For a finite set of monomial exponents, construct its coefficient-supported submodule
and monomial basis. Prove coefficient extensionality, dimension, inclusions for nested
supports, and scalar-extension comparisons. Compare degree boxes, weighted-degree
restrictions, and univariate degree bounds with the corresponding native spaces.
Do not equate multivariate total degree with every possible support restriction.

For finite points and prescribed derivative multi-indices, define the jet evaluation
linear map on these spaces. Give its matrix in the monomial basis, entries as evaluated
derivatives, kernel as the vanishing conditions, coefficient-map naturality, and
compatibility with reduction modulo an ideal. Include the ordinary/Hasse factorial
comparison and the matrix row factors it induces. Handle zero polynomials, empty
point sets, empty supports, and order-zero derivatives.

Use the existing finite-set multiplicity bound: if a nonzero univariate polynomial
has degree less than `#S * (k+1)`, some Hasse derivative of order at most `k` is nonzero
at a point of `S`. This result does not assert that a particular bivariate matrix
has independent rows.

For `B > 0`, write `φ_B(F) = F(X,X^B)`. Export the following consequences of existing
Kronecker substitution and derivative calculus:

1. `φ_B` is injective on polynomials whose `Z`-degree is less than `B`. Give the
   coefficient formula at exponent `i+Bj` for `0 ≤ i < B` and the resulting support
   and degree bounds. This uses uniqueness of quotient and remainder by `B`.
2. In characteristic a prime `p`, every ordinary derivative order satisfies
   `D^k φ_p(F) = φ_p(∂_Z^k F)`.
3. For Hasse derivatives, `D^[k] φ_p(F) = φ_p(∂_Z^[k] F)` when `k < p`.
   Include the failure at `k = p`, witnessed by `F = W`.

The Hasse identity follows coefficientwise because the intermediate Hasse derivatives
of `X^(pj)` vanish at orders `0 < k < p`. Thus it works over any characteristic-`p`
coefficient field, even when that field has more than `p` elements. The ordinary
identity follows from the chain rule and `D(X^p) = 0`. Give scalar-extension and
evaluation versions. Combined with injectivity and the univariate multiplicity bound,
these are the elementary nonvanishing interfaces for Frobenius substitution.

**Sources:** [IK], §11.6, Lemmas 11.16–11.17, and the displayed elementary extension
of the monomial proof to larger coefficient fields. For injective weights use the
existing Kronecker API, [P] §3.3, Exercise 3.5, and [BG], proof of Proposition 6.3.10.

## I1. Algebraic Hermite interpolation

Let `a : Fin r → K` be injective over a field, `m : Fin r → ℕ`, and `M = Σ_i m_i`.
Prove that the Hasse-jet map on polynomials of degree less than `M` is a linear
equivalence with `Π i, Fin (m i) → K`. Include existence, uniqueness, inverse evaluation,
and a basis adapted to the jets. Multiplicity zero at a node contributes no condition.

For the map on all polynomials the kernel is the ideal generated by
`P = ∏_i (X-a_i)^(m_i)`. For its restriction to degree less than `M`, the kernel is
zero. Give the quotient-algebra comparison and CRT decomposition into
`K[X]/((X-a_i)^(m_i))`, including the Taylor-coordinate description of each local
factor. Prove coefficient-extension naturality for field embeddings and transport of
the interpolating polynomial. Do not identify the restricted kernel with the nonzero
ideal `(P)`.

Give the ordinary-derivative version when every needed factorial is invertible.
Use the lexicographic order on jet rows `(i,k)`, `i < r`, `k < m_i`, and increasing
degree columns `j = 0,…,M-1`. For the Hasse confluent Vandermonde matrix with entry
`D^[k](X^j)(a_i)`, prove

\[
\det V=\prod_{i<j}(a_j-a_i)^{m_i m_j}.
\]

The ordinary matrix has the extra factor `∏_i ∏_{k<m_i} k!`. State the row-index
equivalence to `Fin M` and its orientation, so the sign is unambiguous. Include
permutations of nodes, translation, and affine change of variable.

**Derivation:** distinct linear factors are coprime, so polynomial CRT identifies the
quotient by `P` with the local Taylor quotients. The degree-restricted representative
is unique by division by monic `P`. The triangular Hermite/Newton basis, ordered as
above, gives the determinant formula. This is an algebraic proof in every characteristic;
no numerical-analysis remainder theorem is needed. CRT and determinant calculus are
the prerequisites, not a stronger analytic interpolation theorem.

**Checks:** `M = 0`, one node, zero node multiplicities, ordinary Vandermonde when all
`m_i = 1`, and noninjective nodes where the claimed equivalence fails. In characteristic
`p`, ordinary jets through order `p` cannot recover the polynomial `X^p`; Hasse jets do.

## I2. Rank, minors, and coefficient coordinates

For a matrix over a field with independent rows, export an injective choice of columns
giving a square nonzero minor using every row. Include the empty case and the implied
inequality between the numbers of rows and columns. Conversely, such a minor detects
row independence. Consume existing rank and basis-selection theorems before adding
the missing statement forms.

For a ring homomorphism, nonvanishing of a mapped minor implies nonvanishing of that
same original minor, without an injectivity hypothesis. Preservation of nonvanishing
in the other direction requires an injective homomorphism. Prove reduction and lifting
with the column selection retained, and determinant compatibility with scalar maps.

Extension of coefficient fields preserves and reflects independence of a family of
coordinate vectors. State this for matrices over the smaller field mapped into the
larger one, rather than for arbitrary vectors of an unrelated vector space. General
ring base-change statements carry the appropriate flatness or faithful-flatness
hypotheses; do not infer them from the field case without those hypotheses.

For a finite free coefficient algebra with basis `b`, construct the coefficient matrix
of an algebra-valued linear map over the base ring and prove the corresponding
linear-map diagram. If `J` is an ideal of the base ring, membership in its extended
ideal `JA` is equivalent to membership of each coordinate in `J`. Give the reduction
diagram and the induced basis over the quotient. This criterion is not asserted for
an arbitrary ideal of `A`. Coordinate splitting is not a ring homomorphism from
algebra-valued matrices, so it does not take determinants entrywise.

**Derivation:** finite-dimensional basis extension and determinant functoriality;
for ideals, the basis identifies `A` as a direct sum of copies of the base ring.

## I3. Ideal divisibility and changes of rows

For a square matrix over a commutative ring, if every entry in row `i` belongs to
the ideal `J_i`, its determinant belongs to `∏_i J_i`. Give the column, common-ideal,
principal-ideal, and explicit scalar-row-factor forms. Apply the same statements to
every selected square column minor retaining all rows. Include the empty product.

For an ordered finite row index, prove that multiplication by a lower or upper
unitriangular coefficient matrix preserves each such determinant. Give the
coefficient conditions, determinant one, composition/inverse comparisons, and the
corresponding column results. The implementation uses native triangular matrix and
determinant APIs, not a structure that assumes determinant preservation.

For a family of `h` univariate factors and a point `a`, suppose every ordinary
derivative of each factor through order `K` evaluates into an ideal `J`. Prove that
every derivative through order `K` of the product, multiplied by any polynomial
cofactor, evaluates into `J^h`. Include `h = 0`, zero factors, and `K = 0`.
Prove the multivariate version for arbitrary variables and a chosen ordinary partial
derivative, with its bivariate `∂_Z` specialization.

Give the Hasse product statement with hypotheses on the Hasse derivatives themselves.
It follows from the Hasse Leibniz rule, but ordinary-derivative hypotheses do not imply
those hypotheses. For `X^p` over the integers, the `p`-th ordinary derivative is
`p!` while its `p`-th Hasse derivative is `1`. Do not divide out factorials when
counting prime divisibility.

**Derivation:** determinant expansion supplies one ideal factor per row; triangular
matrix multiplication gives determinant preservation. Iterated Leibniz expresses each
evaluated product derivative as a sum with one derivative of every factor, hence
one factor of `J` from each. The cofactor is unrestricted and adds no required ideal
factor. These derivations work without field or characteristic-zero hypotheses.

## I4. Determinant size estimates

Consume Hadamard and determinant-expansion bounds. Export row-dependent bounds

\[
|\det A|\le n!\prod_i B_i\quad\text{if } |A_{ij}|\le B_i,\quad B_i\ge0.
\]

Give versions for native absolute values and for complex matrices after an embedding,
as well as the sharper existing Hadamard estimates in the norms they use. State the
logarithmic consequence when the determinant is nonzero and all `B_i > 0`; the bound
includes `log(n!)`. The empty matrix has determinant one and logarithm zero.

For polynomial derivative-evaluation entries, bound ordinary and Hasse derivatives
using coefficient bounds, degrees, derivative orders, and bounds on the point
coordinates. A concrete univariate export is, for `f = Σ_{j≤d} c_j X^j`,
`|c_j| ≤ H`, `H ≥ 0`, `|a| ≤ A`, `A ≥ 1`:

\[
|D^{[k]}f(a)|\le H\sum_{j=k}^{d}\binom jk A^{j-k}.
\]

The ordinary bound multiplies by `k!`; orders above degree give zero. Give the
multivariate product-binomial bound on an arbitrary finite support, then package
the resulting row bounds for a jet matrix. Reuse the polynomial length and height
normalizations from the transcendence roadmap.

**Derivation:** apply the coefficient formula and triangle inequality, then the
existing determinant bound. Supply coarse degree-cap versions as consequences.

## I5. Integral norms and divisibility lower bounds

For a finite free algebra, expose scalar multiplicativity of `Algebra.norm` with its
rank. For number fields, consume the ring of integers, the integral norm, its
comparison with the field norm, and the product over complex embeddings. Export:

- A nonzero algebraic integer has a nonzero integer norm.
- If `a = (m^e)b` with `a,b` integral and the field degree is `n`, then
  `m^(n*e)` divides the integral norm of `a`.
- Upper bounds for `‖σ(a)‖` at every embedding bound the absolute norm by their
  product; a common upper bound gives its `n`-th power.
- Divisibilities at finitely many distinct rational primes combine into the product
  divisibility. For nonzero norm and primes `p ≥ 2`, export the lower bound
  `Σ_p e_p log p ≤ log |norm a|` when `∏_p p^e_p` divides the norm.

Keep integral scalar divisibility distinct from membership in one prime ideal above
`p`: the latter does not automatically supply `p^n` in the norm. Nonvanishing of
norms needs the field/domain hypotheses and is not true for all nonzero elements
of a split algebra. Apply the results to an arbitrary determinant in a number field
after integrality, divisibility, and embedding bounds have been proved.

**Derivation:** norm multiplicativity and the determinant of scalar multiplication
give the scalar power; the field norm detects nonzero elements. Integral norms,
unique factorization in `ℤ`, and the embedding product give the comparisons.
See [M], Chapter II, for norm and integrality theory.

## I6. Examples and completion checks

Supply ordinary and confluent Vandermonde examples, Hermite interpolation at integer
nodes, and finite matrices over a quadratic order. Check empty/singleton data,
coincident nodes rejected by injectivity, and the factorial difference between the
ordinary and Hasse matrices. Include detection of nonvanishing after reduction and
a nonzero integral determinant that reduces to zero, demonstrating the one-way lift.
Check ideal row factors on every minor retaining all rows and norm bounds for both
real and imaginary quadratic fields.

I0–I5 have no dependence on a particular interpolation matrix's full rank or on a
prime-sum improvement. Full Hermite surjectivity and the confluent determinant are
library targets in their own right; finite-set root bounds do not depend on completing
them. Examples must not assemble a new exclusion of exceptional zeros.

## References and related work

- **[IK]** H. Iwaniec and E. Kowalski, [*Analytic Number Theory*, Chapter 11](https://people.math.ethz.ch/~kowalski/ik-ant-exp-sums.pdf#page=15)
  (2004), §11.6, Lemma 11.16, pp. 283–284, and Lemma 11.17, p. 284.
- **[P]** L. Pottmeyer, [*Diophantine Approximation*](https://esaga.uni-due.de/f/lukas.pottmeyer/DioApp.pdf),
  version 17 January 2022, §3.3, especially Exercise 3.5.
- **[BG]** E. Bombieri and W. Gubler, *Heights in Diophantine Geometry* (2006),
  proof of Proposition 6.3.10.
- **[M]** J. S. Milne, [*Algebraic Number Theory*](https://www.jmilne.org/math/CourseNotes/ANT.pdf),
  version 3.08 (2020), Chapter II, norms, integral elements, and embeddings.
- M. Laurent, [Sur quelques résultats récents de transcendance](https://www.numdam.org/item/AST_1991__198-199-200__209_0/),
  Astérisque 198–200 (1991), 209–230, for arithmetic interpolation determinants.
- M. Waldschmidt, [*Diophantine Approximation on Linear Algebraic Groups*](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf)
  (2000), for the interpolation-determinant context. The explicit elementary derivations
  in I1–I5 specify the targets independently of any one application.
