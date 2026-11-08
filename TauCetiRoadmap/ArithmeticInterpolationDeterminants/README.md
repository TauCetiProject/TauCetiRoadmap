# Roadmap: polynomial interpolation and arithmetic determinants

**Summary.** Build polynomial jet evaluation on finite coefficient-supported spaces, the Frobenius
power substitution `Z ↦ X, W ↦ X^p` with its derivative identities and nonvanishing test,
algebraic Hermite interpolation with arbitrary multiplicities over any field, the Hasse confluent
Vandermonde determinant with its sign, and the general rank, ideal-divisibility, row-change,
Hadamard-size and integral-norm comparisons that an arithmetic interpolation determinant is
estimated with. Everything is stated on Mathlib's native `Polynomial`, `MvPolynomial`, `Submodule`,
`Basis`, `LinearMap`, `Matrix`, `Ideal`, `Matrix.gram` and `Algebra.norm` carriers, from Mathlib's
Hasse derivatives and Taylor expansion and Tau Ceti's multivariate Hasse calculus, Kronecker
substitution and Gram–Hadamard inequalities. The end theorems are the Hermite interpolation
equivalence `hermiteJet_bijective`, the determinant formula `det_confluentVandermonde`, the
Frobenius-graph nonvanishing test `exists_nonzero_ordinary_jet_on_frobenius_graph` and the Gram
change-of-family identity `det_gram_matrix_smul`. A particular auxiliary matrix, support choice,
prime-exponent formula or parameter optimisation of a research proof is an application and stays
with the roadmap that makes it.

`README.md` is definitive. `Suggested.lean` states the headline theorems above against the pinned
libraries and the three definitions they need, `powerSubstitution`, `hermiteJet` and
`confluentVandermonde`; every other target, API list and Check lives here.

## Scope and ownership

**Owned here.**

- Layer 0: comparisons of coefficient-supported submodules (`MvPolynomial.restrictSupport`) with
  degree boxes, weighted-degree restrictions and `Polynomial.degreeLT`; the jet evaluation map on
  such a space with its monomial-basis matrix, kernel, naturality and reduction; the power
  substitution `powerSubstitution B` with its injectivity on `Z`-degree below `B`, the ordinary and
  Hasse derivative identities through `powerSubstitution p` in characteristic `p`, the comparison
  of ordinary and Hasse jets of order below `p`, and the Frobenius-graph nonvanishing test.
- Layer 1: Hermite interpolation with arbitrary multiplicities `m : Fin r → ℕ` at injective nodes
  over any field, as the linear equivalence `hermiteJet a m` from `Polynomial.degreeLT K (∑ m i)`
  to `∀ i, Fin (m i) → K`; the kernel of the unrestricted jet map; the confluent Vandermonde matrix
  `confluentVandermonde a m` over any commutative ring and its determinant with the sign fixed by
  the lexicographic row order `finSigmaFinEquiv`.
- Layer 2: existence of a nonzero full-row minor of an independent-row matrix over a field; lifting
  and reduction of minors along ring maps; the coefficient matrix of an algebra-valued linear map
  over a finite free algebra and the extended-ideal membership criterion.
- Layer 3: the determinant of a matrix whose row `i` lies in an ideal `J_i` lies in `∏ J_i`;
  invariance of full-row minors under unitriangular row changes; the Gram change-of-family identity
  `Gram(U v) = U Gram(v) Uᵀ` and its complex form; ideal-power divisibility of derivatives of a
  product of `h` factors.
- Layer 4: the row-dependent Hadamard-type bound `‖det A‖ ≤ n! ∏ B_i` and its logarithm; the
  adapters that feed Tau Ceti's sharp Gram–Hadamard inequality to a jet matrix; coefficient bounds
  on evaluated Hasse derivatives.
- Layer 5: scalar-power divisibility of integral norms, nonvanishing of norms, embedding bounds and
  the prime-sum logarithmic lower bound.

**Left to other roadmaps and to the libraries.**

- *The Hasse multiplicity criterion and the root-count inequality* (`x` is a root of multiplicity
  `≥ k` of a nonzero `f` iff `D^[j] f (x) = 0` for all `j < k`; a nonzero `f` of degree `D` with
  multiplicity `≥ k` on a set `S` has `k · #S ≤ D`): CharacterSumsOverFiniteFields §4.1. The
  finite-set form used in 0.6 (nonzero `f` with `natDegree f < #S · (K + 1)` has some
  `D^[j] f (a) ≠ 0` with `a ∈ S`, `j ≤ K`) is its contrapositive and is not restated.
- *The kernel of the Hasse derivatives of orders `0 < k < p^e` and their linearity over
  `R[X^(p^e)]`* (`hasseDeriv k (expand R (p^e) f * g) = expand R (p^e) f * hasseDeriv k g` for
  `k < p^e`): GrothendieckNotesLemmas §§1.3–1.4. Target 0.4 is the evaluated bivariate
  specialisation `e = 1` read through `powerSubstitution p`, which that statement does not
  mention; its own route is Tau Ceti's Kronecker chain rule.
- *Hermite interpolation at first jets* (`m_i = 2` at every node, rank `min(d + 1, 2n)` over any
  field): GenericDoublePointInterpolation §4.6 `univariateHermiteRank`. Target 1.1 keeps arbitrary
  multiplicities, including `0`, and states a linear equivalence rather than a rank.
- *Hermite interpolation with ultrametric bounds* (equal multiplicity `S` at every node of the
  closed unit disc of an ultrametric field, with coefficient bounds): IntegralIwasawaTheory §4.1c
  `exists_hasseDeriv_eval_eq_ite`. Target 1.1 is over an arbitrary field, with arbitrary
  multiplicities and no bound; an ultrametric consumer takes its bounds from that section.
- *The Chinese remainder decomposition* `K[X] ⧸ (P) ≃ ∏ K[X] ⧸ ((X − a_i)^(m_i))` for pairwise
  coprime factors: Mathlib's `Ideal.quotientInfRingEquivPiQuotient`, consumed in 1.2 and never
  restated.
- *The one-node Hasse Wronskian* `det (D^[k] g_l)`: DiophantineApproximationAndTranscendence §1.4
  `Polynomial.hasseWronskian`. The matrix of 1.3 with a single node `a` of multiplicity `M` is the
  Hasse Wronskian of the monomials `1, X, …, X^(M−1)` evaluated at `a`; 1.3 owns the several-node
  matrix and its determinant.
- *The multivariate Hasse derivative and its Taylor expansion*: Tau Ceti's `MvPolynomial.hasseDeriv`
  with DiophantineApproximationAndTranscendence §1.2 for its API; *the coefficient length
  `Polynomial.l1Norm` and the bound `|P(z)| ≤ ‖P‖₁ max(1, |z|)^(deg P)`*: that roadmap's §1.1. Target
  4.3 is the order-`k` bound from a coefficient sup bound, which §1.1 does not state.
- *Hadamard's inequality*: Tau Ceti's `Matrix.det_gram_le_prod_norm_sq`,
  `Matrix.re_det_gram_le_prod_norm_sq`, `Matrix.re_det_gram_le_pow` and
  `OrthonormalBasis.norm_det_le_prod_norm`, and the `ℓ¹` row bound `Matrix.abv_det_le_prod_sum_abv`;
  Mathlib's uniform entry bound `Matrix.det_le`. Target 4.1 is the row-dependent entry bound, which
  none of them states.
- *Block-linear substitutions* `X ↦ A Y` and their jets: DiophantineApproximationAndTranscendence
  §1.7 and Tau Ceti's `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm`. The power
  substitution of 0.3 is not linear and is owned here.
- *Applications*: an interpolation determinant built for a specific theorem (its Gram matrix, trace
  pairing, support, exponent counts and parameter choices) belongs to the roadmap that proves that
  theorem; this roadmap supplies the general interfaces only and plans no exclusion of exceptional
  zeros.

## Conventions

- **Bivariate carrier.** `MvPolynomial (Fin 2) R` with variable `0` written `Z` and variable `1`
  written `W`. The `Z`-degree is `MvPolynomial.degreeOf 0`. The ordinary partial derivative in `Z`
  is `MvPolynomial.pderiv 0`, iterated as `(pderiv 0)^[k]` and written `∂_Z^k`; the Hasse
  derivative of order `k` in `Z` is `MvPolynomial.hasseDeriv (Finsupp.single 0 k)`, written
  `∂_Z^[k]`.
- **Univariate derivatives.** `D^k f` is `(Polynomial.derivative)^[k] f` and `D^[k] f` is
  `Polynomial.hasseDeriv k f`; Mathlib's `Polynomial.factorial_smul_hasseDeriv` gives
  `D^k f = k! • D^[k] f` over every commutative semiring. Factorials are never cancelled in positive
  characteristic or inside an integral divisibility argument; where a factorial is a unit, the
  statement says so.
- **Characteristic `p`.** Statements in prime characteristic carry `[Fact p.Prime] [CharP R p]`.
- **Power substitution.** `powerSubstitution B : MvPolynomial (Fin 2) R →ₐ[R] R[X]` is
  `MvPolynomial.aeval` of `Z ↦ X`, `W ↦ X^B`; the Frobenius substitution is `powerSubstitution p`,
  which sends `F` to `X ↦ F(X, X^p)`, and the Frobenius graph of `a` is the point `(a, a^p)`.
- **Jets and jet rows.** For nodes `a : Fin r → K` and multiplicities `m : Fin r → ℕ`, the jet of
  `f` at `(i, k)` with `k < m i` is `D^[k] f (a i)`. Jet rows are ordered lexicographically by
  `(i, k)`: the row index is `finSigmaFinEquiv ⟨i, k⟩ = ∑_{i' < i} m i' + k`. Columns of a
  confluent Vandermonde matrix are the monomials `X^j` in increasing degree `j = 0, …, M − 1`.
  With this orientation and `m = (1, 1)` the matrix is Mathlib's `Matrix.vandermonde a` and the
  determinant formula of 1.3 has the sign of `Matrix.det_vandermonde`.
- **Gram matrices.** `Matrix.gram 𝕜 v i j = ⟪v i, v j⟫_𝕜` with Mathlib's inner product,
  conjugate-linear in the first argument. Over `ℝ` the Gram matrix is symmetric; over `ℂ` it is
  Hermitian and its determinant is real.
- **Norms and absolute values.** `‖·‖` on `ℂ` is the modulus; `Algebra.norm ℤ` on `𝓞 K` is the
  integral norm of a number field, and `Algebra.norm ℚ` its field norm; the two agree through
  `Algebra.coe_norm_int`.
- **Finite index types.** Matrices of this roadmap are indexed by `Fin n`; a statement over an
  arbitrary `Fintype` is transported through `Fintype.equivFin` where a consumer needs it.

## Exact supplier contracts

### From Mathlib

- `Polynomial.hasseDeriv`, `hasseDeriv_apply`, `hasseDeriv_coeff`, `hasseDeriv_monomial`,
  `hasseDeriv_mul`, `factorial_smul_hasseDeriv`, `hasseDeriv_eq_zero_of_lt_natDegree`,
  `natDegree_hasseDeriv_le` (`Mathlib/Algebra/Polynomial/HasseDeriv.lean`); `Polynomial.taylor`,
  `taylor_coeff`, `taylor_eval` (`Mathlib/Algebra/Polynomial/Taylor.lean`); `Polynomial.derivative`,
  `derivative_X_pow`, `iterate_derivative_X_pow_eq_smul`; `Polynomial.leval`
  (`Mathlib/Algebra/Polynomial/Eval/SMul.lean`); `Polynomial.rootMultiplicity`,
  `lt_rootMultiplicity_iff_isRoot_iterate_derivative` (characteristic zero only);
  `Polynomial.pairwise_coprime_X_sub_C`, `Polynomial.isCoprime_X_sub_C_of_isUnit_sub`.
- `Polynomial.degreeLT`, `mem_degreeLT`, `degreeLT_eq_span_X_pow`, `degreeLTEquiv`
  (`Mathlib/RingTheory/Polynomial/Basic.lean`); `MvPolynomial.restrictSupport`,
  `basisRestrictSupport`, `restrictSupport_mono`, `restrictTotalDegree`, `restrictDegree`,
  `mem_restrictTotalDegree`, `mem_restrictDegree` (`Mathlib/RingTheory/MvPolynomial/Basic.lean`);
  `MvPolynomial.degreeOf`, `degreeOf_lt_iff`; `MvPolynomial.pderiv`; `MvPolynomial.aeval`,
  `MvPolynomial.eval`.
- `Ideal.quotientInfRingEquivPiQuotient` (`Mathlib/RingTheory/Ideal/Quotient/Operations.lean`),
  taken on pairwise coprime ideals; `Ideal.map`; `Ideal.prod_mem_prod`; `Basis`, `Basis.repr`.
- `Matrix.det`, `det_apply`, `det_mul`, `det_smul`, `det_transpose`, `det_isEmpty`, `det_fin_zero`,
  `det_submatrix_equiv_self`, `Matrix.submatrix`, `submatrix_map`, `RingHom.map_det`,
  `Matrix.of`, `Matrix.map`; `Matrix.vandermonde`, `det_vandermonde`
  (`Mathlib/LinearAlgebra/Vandermonde.lean`); `Matrix.IsLowerTriangular`,
  `det_of_isLowerTriangular`, `det_of_isUpperTriangular`; `Matrix.rank`,
  `rank_eq_finrank_span_row`, `linearIndependent_row_iff_isUnit`; `Matrix.det_le`, `det_sum_le`
  (`Mathlib/LinearAlgebra/Matrix/AbsoluteValue.lean`, uniform entry bound `n! • x^n`).
- `finSigmaFinEquiv`, `finSigmaFinEquiv_apply` (`Mathlib/Algebra/BigOperators/Fin.lean`): the
  lexicographic bijection `(i : Fin r) × Fin (m i) ≃ Fin (∑ i, m i)`.
- `Matrix.gram`, `gram_apply`, `posSemidef_gram`, `det_gram_ne_zero_iff_linearIndependent`,
  `gram_eq_conjTranspose_mul` (`Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`);
  `Matrix.PosSemidef.det_nonneg`.
- `Algebra.norm`, `Algebra.norm_algebraMap` (`norm R (algebraMap R S x) = x ^ finrank R S`),
  `norm_algebraMap_of_basis`, `norm_eq_zero_iff`, `norm_ne_zero_iff`, `norm_eq_prod_embeddings`
  (`Mathlib/RingTheory/Norm/`); `NumberField.RingOfIntegers`, `RingOfIntegers.rank`,
  `Algebra.coe_norm_int` (`Mathlib/NumberTheory/NumberField/`).

### From Tau Ceti

- `MvPolynomial.hasseDeriv`, `hasseDeriv_monomial`, `hasseDeriv_coeff`,
  `factorial_smul_hasseDeriv_single`, `hasseDeriv_eq_zero_of_degreeOf_lt`, `degreeOf_hasseDeriv_le`,
  `hasseDeriv_map` (`TauCeti/Algebra/MvPolynomial/HasseDeriv/Basic.lean`); the multivariate Leibniz
  rule `MvPolynomial.hasseDeriv_mul` and the Taylor expansion `eval_add_eq_finsum_hasseDeriv`
  (`TauCeti/RingTheory/MvPolynomial/HasseDeriv/Taylor.lean`).
- The Kronecker substitution `Xₛ ↦ T^(e s)`: `MvPolynomial.coeff_aeval_X_pow_weight`,
  `injOn_aeval_X_pow`, `linearIndependent_aeval_X_pow`, `taylor_aeval_X_pow` and the chain rule
  `eval_hasseDeriv_aeval_X_pow` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean`). The power
  substitution of 0.3 is the case `e = (1, B)`, on which `weight e μ = μ 0 + B · μ 1` is injective
  for `μ 0 < B`.
- Hadamard: `Matrix.det_gram_le_prod_norm_sq`, `re_det_gram_le_prod_norm_sq`,
  `re_det_gram_le_pow`, `re_det_gram_nonneg`, `det_gram_eq_norm_det_sq`,
  `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`;
  hypotheses `[RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [Fintype ι]
  [DecidableEq ι]`, any `E`); the `ℓ¹` row and column bounds `Matrix.abv_det_le_prod_sum_abv`,
  `abv_det_le_prod_sum_abv'`, `abs_det_le_prod_sum_abs` (`TauCeti/LinearAlgebra/Matrix/AbsoluteValue.lean`).

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

§4.1: the Hasse multiplicity criterion, `hasseDeriv k (f^q) = 0` for `0 < k < q`, and the
root-count inequality `k · #S ≤ D` for a nonzero `f` of degree `D` with multiplicity `≥ k` at every
point of `S`. Target 0.6 uses the inequality in its contrapositive form.

### From TauCetiRoadmap.GrothendieckNotesLemmas

§1.4 `Polynomial.hasseDeriv_expand_mul`: in characteristic `p` and for `k < p^e`,
`hasseDeriv k (expand R (p^e) f * g) = expand R (p^e) f * hasseDeriv k g`. Target 0.4 names it as
the input of its coefficientwise route; its other route uses only Tau Ceti.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§1.1: the coefficient length `Polynomial.l1Norm` with `|P(z)| ≤ ‖P‖₁ max(1, |z|)^(deg P)` and
`‖D^[k] P‖₁ ≤ 2^(natDegree P) ‖P‖₁`, consumed by the coarse forms of 4.3; §1.2: the API of
`MvPolynomial.hasseDeriv`; §1.4: `Polynomial.hasseWronskian`, the one-node comparison of 1.3.

## How to read the build

Layer 0 fixes the finite polynomial spaces and the jet evaluation map, then builds the Frobenius
power substitution and its nonvanishing test on the univariate multiplicity inequality of
CharacterSumsOverFiniteFields. Layer 1 is the univariate Hermite theory: the jet equivalence, the
kernel through the Chinese remainder theorem, and the confluent Vandermonde determinant. Layer 2
supplies the rank and coordinate adapters (full-row minors, reduction of minors, extended-ideal
coordinates) that move a jet matrix between a number field, its ring of integers and a residue
field. Layer 3 proves the ideal-divisibility and row-change invariances of such minors, including
the Gram change-of-family identity. Layer 4 bounds determinants from above by row bounds and Gram
norms and bounds the entries of a jet matrix. Layer 5 bounds a nonzero integral determinant from
below through its norm. Layers 2–5 use Layer 1 only in the examples; Layer 0 is used by nothing
later, so an implementer of the determinant estimates starts at Layer 2.

## Layer 0: finite polynomial spaces, jets and the Frobenius substitution

### 0.1 Coefficient-supported submodules

For a finite set `T` of exponent vectors in `Fin n →₀ ℕ`, use Mathlib's
`MvPolynomial.restrictSupport R T`, the submodule of polynomials whose support lies in `T`, with
its monomial basis `MvPolynomial.basisRestrictSupport R T` indexed by `T`. Prove coefficient
extensionality (two elements with equal coefficients on `T` are equal), that its rank over a
nontrivial `R` is `#T`, inclusion `restrictSupport R T ≤ restrictSupport R T'` for `T ⊆ T'`
(Mathlib's `restrictSupport_mono`), and compatibility with a ring map `R → S`: the image of
`restrictSupport R T` under `MvPolynomial.map` lies in `restrictSupport S T` and the map carries
the monomial basis to the monomial basis.

Compare the support restrictions with the native degree spaces: the degree box `{μ | ∀ s, μ s ≤ d s}`
gives the spaces `MvPolynomial.restrictDegree` compares with, the total-degree ball gives
`MvPolynomial.restrictTotalDegree`,
the weighted strip `{μ | μ 0 < B, μ 0 + B μ 1 < N}` is the space the power substitution of 0.3 is
injective on, and for `n = 1` the box `{μ | μ 0 < N}` corresponds to `Polynomial.degreeLT R N`
under Mathlib's `MvPolynomial.pUnitAlgEquiv`. Multivariate total degree and a general support
restriction are different notions and are never identified. *Needs:* Mathlib
`MvPolynomial.restrictSupport`, `basisRestrictSupport`, `restrictTotalDegree`, `restrictDegree`,
`Polynomial.degreeLT`.

**Checks.**

- For `n = 2` and the box `{μ | μ 0 ≤ 1, μ 1 ≤ 2}` the rank is `6`; the total-degree ball of radius
  `2` in two variables has rank `6` as well, but the two spaces differ: `Z W²` lies in the box and
  not in the ball, `Z²` in the ball and not in the box.
- The empty support gives the zero submodule of rank `0`; the singleton `{0}` gives the constants.
- Over the zero ring every `restrictSupport` is the zero module, so the rank statement carries
  `[Nontrivial R]`.
- For `n = 1`, `N = 3`, the polynomial `X²` lies in `degreeLT R 3` and `X³` does not; the
  comparison with the box `{μ | μ 0 < 3}` is an equality of submodules, not an inclusion.

### 0.2 The jet evaluation map

For a finite family of points `a : ι → (Fin n → R)` and derivative multi-indices `d : ι → Fin n →₀ ℕ`
(one multi-index per point, repeated points allowed), define the jet evaluation map on
`restrictSupport R T` as the `R`-linear map `f ↦ (fun i => MvPolynomial.eval (a i) (hasseDeriv (d i) f))`
into `ι → R`. Give its matrix in the monomial basis, with rows `i : ι` and columns `μ ∈ T`, whose
entry is `eval (a i) (hasseDeriv (d i) (monomial μ 1)) = (∏_s choose (μ s) (d i s)) (a i)^(μ − d i)`
(Tau Ceti `MvPolynomial.hasseDeriv_monomial`). Prove: the kernel is the set of `f ∈ restrictSupport R T`
whose jets `hasseDeriv (d i) f` all vanish at `a i`; the map is natural for a ring map `R → S` (the
matrix over `S` is the entrywise image of the matrix over `R`); for an ideal `J` of `R` the map
over `R ⧸ J` is the reduction of the map over `R`; the ordinary-derivative jet map with multi-indices
`k e_s` equals `(k)!` times the Hasse one (Tau Ceti `factorial_smul_hasseDeriv_single`), so its
matrix is the Hasse matrix with row `i` multiplied by `(d i s)!`. The empty point family gives the
zero map into the zero module, the empty support gives the zero map, and a zero multi-index gives
plain evaluation. *Needs:* 0.1; Tau Ceti `MvPolynomial.hasseDeriv`, `hasseDeriv_monomial`,
`hasseDeriv_map`, `factorial_smul_hasseDeriv_single`.

**Checks.**

- `n = 1`, `T = {0, 1, 2}`, points `0` and `1` with `d = (0, 1)`: the matrix is
  `[[1, 0, 0], [0, 1, 2]]`, the second row being `D^[1](1, X, X²)` at `1`; a definition that forgot
  the binomial coefficient would put `1` in the last entry.
- `n = 2`, `T = {(1, 1)}` (the monomial `Z W`), the point `(2, 3)` with `d = (1, 0)`:
  `∂_Z^[1](Z W) = W`, evaluated `3`; with `d = (1, 1)` the value is `1`; with `d = (2, 0)` it is `0`.
- Over `ZMod 2`, `n = 1`, `T = {2}`, the point `0` with `d = 2`: the Hasse entry is
  `D^[2] X² = 1` while the ordinary entry is `D² X² = 2 = 0`; the ordinary jet map is not the Hasse
  jet map in characteristic `2`.
- Reduction: over `ℤ` with `T = {0, 1}`, point `3`, `d = 0`, the row is `[1, 3]`; modulo `3` it is
  `[1, 0]`, the entrywise reduction.

### 0.3 The power substitution

Define `powerSubstitution B : MvPolynomial (Fin 2) R →ₐ[R] R[X]` as `MvPolynomial.aeval` of
`Z ↦ X`, `W ↦ X^B`, so that `powerSubstitution B F = F(X, X^B)`. Prove
`powerSubstitution_injOn`: for `B > 0`, the substitution is injective on the set of `F` with
`Z`-degree below `B`. The coefficient of `X^(i + B j)` in `powerSubstitution B F` is the
coefficient of `Z^i W^j` in `F` whenever `i < B`, by uniqueness of quotient and remainder on division
by `B`; this is Tau Ceti's `coeff_aeval_X_pow_weight` for the weight `e = (1, B)` on the strip
`{μ | μ 0 < B}`, on which `weight e μ = μ 0 + B μ 1` is injective. Derive `natDegree (powerSubstitution B F) ≤ degreeOf 0 F + B · degreeOf 1 F`,
the support bound (the exponents of the image are the weights of the exponents of `F`), the
scalar-extension naturality `powerSubstitution B (map f F) = map f (powerSubstitution B F)`, and the
evaluation formula `eval a (powerSubstitution B F) = MvPolynomial.eval ![a, a^B] F`. For `B = 0`
the substitution sends `W` to `1` and is not injective on any strip containing `W` and `1`.
(IK, Lemma 11.17, the substitution `h(X, X^q)`; P, §3.3, Theorem 3.3.7 and Exercise 3.5, the
Kronecker substitution `x_i ↦ t^(d^(i−1))`.) *Needs:* Tau Ceti `MvPolynomial.coeff_aeval_X_pow_weight`,
`injOn_aeval_X_pow`, `linearIndependent_aeval_X_pow`; Mathlib `MvPolynomial.aeval`, `degreeOf_lt_iff`.

**Checks.**

- `B = 2`: `Z + W ↦ X + X²` and `Z + Z W ↦ X + X³`, two distinct images of two distinct
  polynomials of `Z`-degree `1 < 2`; the coefficient of `X³ = X^(1 + 2·1)` in the second is the
  coefficient of `Z W`, namely `1`.
- `B = 2`: `Z²` and `W` both map to `X²`, so injectivity fails without the `Z`-degree hypothesis
  (`Z²` has `Z`-degree `2`, not below `B`).
- `B = 3`, `F = Z² W + Z W²`: image `X⁵ + X⁷`; the exponents `5 = 2 + 3·1` and `7 = 1 + 3·2` are
  the weights of `(2, 1)` and `(1, 2)`, and `natDegree 7 ≤ 2 + 3·2 = 8`.
- Evaluation: `B = 2`, `F = Z W`, `a = 3`: `eval 3 (X³) = 27 = MvPolynomial.eval ![3, 9] (Z W)`.

### 0.4 Derivatives through the Frobenius substitution

In characteristic `p`, prove `iterate_derivative_powerSubstitution`: for every `k`,
`D^k (powerSubstitution p F) = powerSubstitution p (∂_Z^k F)`. Route: the chain rule for the
algebra map, `D(F(X, X^p)) = (∂_Z F)(X, X^p) + (∂_W F)(X, X^p) · D(X^p)`, and `D(X^p) = p X^(p−1) = 0`
(Mathlib `derivative_X_pow`); iterate. Prove `hasseDeriv_powerSubstitution`: for `k < p`,
`D^[k] (powerSubstitution p F) = powerSubstitution p (∂_Z^[k] F)`. Two routes. Coefficientwise:
write `F = ∑_i f_i(W) Z^i` over the `Z`-exponents `i`, so that
`powerSubstitution p F = ∑_i expand R p (f_i) · X^i`, and use
`hasseDeriv k (expand R p g · X^i) = expand R p g · hasseDeriv k (X^i)` for `k < p`
(GrothendieckNotesLemmas §1.4), whose right side is `powerSubstitution p` of `f_i(W) ∂_Z^[k] Z^i`. Evaluated: Tau Ceti's Kronecker chain rule `eval_hasseDeriv_aeval_X_pow` with
`e = (1, p)` expresses `D^[k](F(X, X^p))(a)` through the coefficients of `T^k` in
`(T + a)^(ν 0) ((T + a)^p − a^p)^(ν 1) = (T + a)^(ν 0) T^(p ν 1)` in characteristic `p`, which
vanish for `k < p` unless `ν 1 = 0`, and then equal `choose (ν 0) k a^(ν 0 − k)`, the coefficient of
the evaluated `∂_Z^[k]`. Record the failure at `k = p` with the witness `F = W`:
`D^[p] (X^p) = 1` while `∂_Z^[p] W = 0`. Both identities hold over every commutative ring of
characteristic `p`, with no bound on the number of elements. Give the scalar-extension and
evaluation versions: `eval a (D^[k] (powerSubstitution p F)) = MvPolynomial.eval ![a, a^p] (∂_Z^[k] F)`
for `k < p`, and the same with ordinary derivatives for every `k`. (IK, Lemma 11.17, for a finite
field with `q` elements and `k < q`; the proof is the vanishing of `choose (p j) k` in characteristic
`p` for `0 < k < p`, which is characteristic-`p` ring arithmetic.) *Needs:* 0.3; Tau Ceti
`MvPolynomial.eval_hasseDeriv_aeval_X_pow`, `taylor_aeval_X_pow`, `hasseDeriv_monomial`; Mathlib
`Polynomial.derivative_X_pow`, `hasseDeriv_monomial`, `Polynomial.expand`;
GrothendieckNotesLemmas §1.4 for the coefficientwise route.

**Checks.**

- `p = 2`, `F = Z W`: `D(X³) = 3 X² = X²` over `ZMod 2`, and `powerSubstitution 2 (∂_Z (Z W)) = powerSubstitution 2 W = X²`.
- `p = 2`, `F = W`: `D(X²) = 2 X = 0` and `∂_Z W = 0`; the ordinary identity holds at every order.
- `p = 3`, `k = 2`, `F = Z² W`: `D^[2] X⁵ = choose 5 2 · X³ = 10 X³ = X³` over `ZMod 3`, and
  `∂_Z^[2] (Z² W) = W ↦ X³`.
- `p = 2`, `k = 2 = p`, `F = W`: `D^[2] X² = 1` but `∂_Z^[2] W = 0`; the Hasse identity needs
  `k < p`, and the bound is sharp.
- Over `ZMod 2` the identity at `k = 1` holds for `F = Z W` with coefficient `1`, and over the
  field with four elements for `c · Z W` with `c² + c + 1 = 0`, giving `c X²` on both sides: no
  hypothesis on the size of the coefficient ring enters.

### 0.5 Ordinary and Hasse jets below the characteristic

Over a field `K` of characteristic `p` and for `k < p`, prove that `k!` is a unit of `K` and that
`D^k f (a) = 0 ↔ D^[k] f (a) = 0`, from `D^k f = k! • D^[k] f` (Mathlib
`factorial_smul_hasseDeriv`). Deduce, for a jet map through order `K < p` as in 0.2 with
multi-indices `k e_0`, `k ≤ K`, that the ordinary and Hasse jet maps have the same kernel and the
same rank, the ordinary matrix being the Hasse matrix with row `(i, k)` scaled by the unit `k!`.
For `k ≥ p` no such comparison holds: `D^p` vanishes identically in characteristic `p` while
`D^[p] X^p = 1`. The ordinary substitution identity of 0.4 holds at every order and supplies no
multiplicity criterion at orders `≥ p`. *Needs:* 0.2; Mathlib `Polynomial.factorial_smul_hasseDeriv`,
`Nat.factorial`, `CharP.cast_eq_zero_iff`, `Nat.Prime.dvd_factorial`.

**Checks.**

- `p = 3`, `k = 2`, `f = X²`, `a = 0`: `D² f = 2`, `D^[2] f = 1`, both nonzero.
- `p = 3`, `k = 3`: `D³ (X³) = 6 = 0` and `D^[3] (X³) = 1`; the comparison fails exactly at `k = p`.
- `p = 2`, `k = 1`: `1! = 1` is a unit and `D f = D^[1] f` for every `f` (Mathlib `hasseDeriv_one`).

### 0.6 The Frobenius-graph nonvanishing test

Prove `exists_nonzero_ordinary_jet_on_frobenius_graph`: over a field `K` of characteristic `p`, for
a nonzero `F ∈ MvPolynomial (Fin 2) K` with `Z`-degree below `p`, a finite set `S ⊆ K`, an order
bound `m < p` and `natDegree (powerSubstitution p F) < #S · (m + 1)`, there are `a ∈ S` and `k ≤ m`
with `MvPolynomial.eval ![a, a^p] (∂_Z^k F) ≠ 0`. Route: `f = powerSubstitution p F` is nonzero by
0.3; the contrapositive of the root-count inequality of CharacterSumsOverFiniteFields §4.1 gives
`a ∈ S` and `k ≤ m` with `D^[k] f (a) ≠ 0`; by 0.4 this is `MvPolynomial.eval ![a, a^p] (∂_Z^[k] F)`,
and by 0.5 the ordinary jet `∂_Z^k F` at the same point is nonzero since `k ≤ m < p`. Every
hypothesis is used: `F ≠ 0` and the `Z`-degree bound for nonvanishing of `f`, the degree inequality
for the multiplicity bound, `m < p` for the passage to ordinary jets. The test says nothing about the
rank of any particular jet matrix, and Hermite surjectivity is not an input. (IK, Lemma 11.16 for the
multiplicity criterion and Lemma 11.17 for the substitution.) *Needs:* 0.3, 0.4, 0.5;
CharacterSumsOverFiniteFields §4.1.

**Checks.**

- `p = 2`, `F = Z + W`, `S = {0, 1, c}` in the field with four elements (`c² + c + 1 = 0`), `m = 0`:
  `f = X + X²` has `natDegree 2 < 3 · 1`; `F(0, 0) = 0`, `F(1, 1) = 0` and `F(c, c²) = c + c² = 1 ≠ 0`,
  so the witness is `a = c`, `k = 0`.
- `p = 2`, `F = Z + W`, `S = {0, 1}`, `m = 0`: `2 < 2 · 1` fails and indeed `F` vanishes at both
  Frobenius-graph points; the degree hypothesis cannot be dropped.
- `p = 2`, `F = Z² + W` has `Z`-degree `2`, not below `p`, and `powerSubstitution 2 F = 0`; the
  `Z`-degree hypothesis cannot be dropped.

### Examples

The Frobenius substitution of `F = Z W + Z` for `p = 3` is `X⁴ + X`, with `D^[1] = 4 X³ + 1 = X³ + 1`
and `D^[2] = 6 X² = 0` over `ZMod 3`, matching `∂_Z^[1] F = W + 1 ↦ X³ + 1` and `∂_Z^[2] F = 0`.
The jet matrix of 0.2 for `T = {0, 1, 2}`, points `0, 1` and `d = (0, 1)` is `[[1, 0, 0], [0, 1, 2]]`,
of rank `2`.

### Dependencies

0.1 needs Mathlib only. 0.2 needs 0.1 and Tau Ceti's multivariate Hasse derivative. 0.3 needs Tau
Ceti's Kronecker substitution. 0.4 needs 0.3, Tau Ceti's Kronecker chain rule, and for its
coefficientwise route GrothendieckNotesLemmas §1.4. 0.5 needs 0.2 and Mathlib. 0.6 needs 0.3–0.5 and
CharacterSumsOverFiniteFields §4.1. Nothing later in this roadmap depends on Layer 0.

## Layer 1: Hermite interpolation and the confluent Vandermonde determinant

### 1.1 The Hermite jet map

For a field `K`, nodes `a : Fin r → K` and multiplicities `m : Fin r → ℕ` with `M = ∑ i, m i`,
define `hermiteJet a m : Polynomial.degreeLT K M →ₗ[K] (∀ i, Fin (m i) → K)` as the map
`f ↦ (fun i k => D^[k] f (a i))`, the composite of the subtype inclusion, `Polynomial.hasseDeriv k`
and `Polynomial.leval (a i)`. A node with `m i = 0` contributes no coordinate.

Prove `hermiteJet_bijective`: for injective `a`, `hermiteJet a m` is bijective (every `m`). Route:
both sides have dimension `M`; injectivity is the restricted kernel statement of 1.2 (a polynomial
of degree below `M` divisible by the monic `P = ∏ (X − C (a i))^(m i)` of degree `M` is zero).
Package the inverse as the Hermite interpolation polynomial: for every jet datum `c` there is a
unique `f` of degree below `M` with `D^[k] f (a i) = c i k` for all `i` and `k < m i`, and the
inverse is `K`-linear. Prove the adapted basis: the preimages of the standard basis vectors of
`∀ i, Fin (m i) → K` form a basis of `degreeLT K M`, with `f = ∑_{i,k} (D^[k] f (a i)) · b_{i,k}`
for every `f` of degree below `M`. Prove coefficient-extension naturality: for a field embedding
`K → L`, the Hermite jet map over `L` at the image nodes restricts to the map over `K`, and the
interpolating polynomial of `K`-valued data has coefficients in `K`. Prove the ordinary-derivative
version: when `k!` is a unit of `K` for every `k < max m i` (in particular in characteristic `0` or
when `max m i ≤ p` in characteristic `p`), the ordinary jet map `f ↦ (D^k f (a i))` is bijective
too, its coordinates being `k!` times the Hasse ones. (IK, Lemma 11.16, the multiplicity criterion
through Hasse jets, valid in every characteristic.) *Needs:* 1.2; Mathlib `Polynomial.degreeLT`,
`degreeLTEquiv`, `Polynomial.hasseDeriv`, `Polynomial.leval`, `LinearMap.pi`,
`Polynomial.factorial_smul_hasseDeriv`.

The map differs from GenericDoublePointInterpolation §4.6 (first jets only, a rank formula) and from
IntegralIwasawaTheory §4.1c (equal multiplicities with ultrametric coefficient bounds) by admitting
arbitrary multiplicities over an arbitrary field and asserting a linear equivalence without bounds.

**Checks.**

- `r = 1`, `m = (2)`, node `c`: `c₀ + c₁ X ↦ (c₀ + c₁ c, c₁)`, a bijection of `K²`.
- `r = 2`, `a = (0, 1)`, `m = (1, 1)`: `c₀ + c₁ X ↦ (c₀, c₀ + c₁)`, the ordinary Vandermonde
  interpolation.
- `r = 0`: `degreeLT K 0 = 0` and the target is the one-point type; the map is bijective.
- `r = 2`, `a = (0, 0)` (not injective), `m = (1, 1)`: `X ↦ (0, 0)`, so the kernel is nonzero and
  the injectivity hypothesis on `a` is necessary.
- `m = (0, 3)`, `a = (5, 0)`: the first node contributes nothing and the map is
  `c₀ + c₁ X + c₂ X² ↦ (c₀, c₁, c₂)`, the identity on coefficients; a definition that counted the
  node of multiplicity `0` as one condition would have mismatched dimensions.
- In characteristic `p`, `r = 1`, `a = (0)`, `m = (p + 1)`: the ordinary jets of `X^p` are
  `(0, …, 0, p!) = 0`, so the ordinary map is not injective, while the Hasse jet of order `p` is `1`.

### 1.2 The kernel of the unrestricted jet map

Prove `all_jets_vanish_iff_dvd`: for injective `a` and every `f ∈ K[X]`, all jets `D^[k] f (a i)`
with `k < m i` vanish iff `P = ∏ i, (X − C (a i))^(m i)` divides `f`. Route: at one node,
`(X − C a)^m ∣ f` iff `D^[k] f (a) = 0` for `k < m`, by Taylor's formula
`f = ∑_k (D^[k] f (a)) (X − a)^k` (Mathlib `taylor_coeff`, `taylor_eval`; this is the multiplicity
criterion of CharacterSumsOverFiniteFields §4.1 in the form that admits `f = 0`); the factors
`(X − C (a i))^(m i)` are pairwise coprime for injective `a` (Mathlib `pairwise_coprime_X_sub_C`), so
divisibility by each is divisibility by the product. For the restriction to `degreeLT K M` the
kernel is zero, since a nonzero multiple of the monic `P` has degree at least `M`; the restricted
kernel is never identified with the ideal `(P)`. Give the quotient comparison: `K[X] ⧸ (P)` is
`∏ i, K[X] ⧸ ((X − C (a i))^(m i))` by Mathlib's `Ideal.quotientInfRingEquivPiQuotient` applied to
the pairwise coprime ideals, and the local factor `K[X] ⧸ ((X − C a)^m)` has the Taylor coordinates
`f ↦ (D^[k] f (a))_{k < m}` as a `K`-linear isomorphism with `Fin m → K` (Mathlib
`Polynomial.taylor`); the Hermite jet map is the composite of the projection to the quotient, the
Chinese remainder isomorphism and the local Taylor coordinates. (IK, Lemma 11.16.) *Needs:* Mathlib
`Polynomial.taylor_coeff`, `taylor_eval`, `pairwise_coprime_X_sub_C`,
`Ideal.quotientInfRingEquivPiQuotient`, `Polynomial.hasseDeriv_eq_zero_of_lt_natDegree`.

**Checks.**

- `r = 1`, `m = (2)`, `a = 0`, `f = X`: `D^[1] X (0) = 1 ≠ 0` and `X² ∤ X`; `f = X²`: both jets
  vanish and `X² ∣ X²`.
- `r = 0`: the condition is vacuous and `P = 1` divides everything.
- `f = 0`: all jets vanish and `P ∣ 0`; the unrestricted criterion admits the zero polynomial,
  unlike Mathlib's `rootMultiplicity`, which is `0` at `f = 0`.
- `r = 2`, `a = (0, 1)`, `m = (1, 1)`, `f = X² − X`: jets `f(0) = 0`, `f(1) = 0`, and
  `X (X − 1) ∣ f`; `f = X`: `f(1) = 1 ≠ 0` and `X (X − 1) ∤ X`.

### 1.3 The confluent Vandermonde matrix and its determinant

For a commutative ring `R`, nodes `a : Fin r → R` and multiplicities `m`, define
`confluentVandermonde a m : Matrix (Fin M) (Fin M) R` with `M = ∑ i, m i`, row `ρ` corresponding
to `⟨i, k⟩ = finSigmaFinEquiv.symm ρ` and column `j`, by the entry
`D^[k] (X^j) (a i) = choose j k · (a i)^(j − k)` (Mathlib `hasseDeriv_monomial`, `0` for `k > j`).
This is the matrix of the Hermite jet map of 1.1 in the monomial basis of `degreeLT K M` and the
standard basis of the jet space, rows in the lexicographic order of the Conventions.

Prove `det_confluentVandermonde`: `det (confluentVandermonde a m) = ∏_{i < j} (a j − a i)^(m i · m j)`
over every commutative ring, with no injectivity hypothesis. Route: the Newton–Hermite basis
`N_{(i,k)} = (X − a_i)^k ∏_{i' < i} (X − a_{i'})^(m_{i'})`, ordered lexicographically, has
`deg N_{(i,k)} = finSigmaFinEquiv ⟨i, k⟩` and leading coefficient `1`, so the change of basis from
the monomials is unitriangular and `det V` equals the determinant of the jet matrix of the
`N_{(i,k)}`, which is block lower triangular with diagonal blocks the jets of
`(X − a_i)^k ∏_{i' < i} (X − a_{i'})^(m_{i'})` at `a_i`, lower unitriangular in `k` with diagonal
entry `∏_{i' < i} (a_i − a_{i'})^(m_{i'})`; the product over `k < m_i` and over `i` gives the formula
(Mathlib `det_of_isLowerTriangular`, `det_mul`). Record the ordinary-derivative matrix with entries
`D^k (X^j) (a i)`: its determinant is `(∏ i, ∏_{k < m i} k!) · det (confluentVandermonde a m)`,
each row being scaled by `k!`. Prove the symmetries: permuting the nodes by `σ` with the
multiplicities permutes the row blocks and multiplies the determinant by the sign of the induced
permutation of `Fin M`, consistent with the formula since each transposed pair `(i, j)` changes the
sign of `(a_j − a_i)^(m_i m_j)` exactly when `m_i m_j` is odd; translation `a ↦ a + c` leaves the
determinant unchanged; scaling `a ↦ u a` multiplies it by `u^(∑_{i<j} m_i m_j)`. For `m = 1` the
matrix is `Matrix.vandermonde a` and the formula is Mathlib's `det_vandermonde`. The determinant is a
unit of a field iff `a` is injective (or `M ≤ 1`), which gives 1.1 a second proof. (Laurent, §6.2,
for determinants of this shape in interpolation; the formula is classical.) *Needs:* 1.1;
Mathlib `finSigmaFinEquiv`, `finSigmaFinEquiv_apply`, `hasseDeriv_monomial`, `det_vandermonde`,
`det_of_isLowerTriangular`, `det_mul`, `det_submatrix_equiv_self`.

**Checks.**

- `a = (0, 1)`, `m = (2, 1)`: rows `(0,0): [1, 0, 0]`, `(0,1): [0, 1, 0]`, `(1,0): [1, 1, 1]`,
  determinant `1 = (1 − 0)^(2·1)`.
- `a = (1, 0)`, `m = (1, 1)`: `[[1, 1], [1, 0]]`, determinant `−1 = (0 − 1)^1`; the formula with
  `(a_i − a_j)` in place of `(a_j − a_i)` gets the wrong sign here.
- `a = (1, 0)`, `m = (2, 1)`: rows `[1, 1, 1], [0, 1, 2], [1, 0, 0]`, determinant `1 = (0 − 1)^2`.
- `a = (0, 1, 2)`, `m = (2, 1, 1)`: determinant `4 = 1^2 · 2^2 · 1`.
- `a = (2, 5, 7)`, `m = (1, 1, 1)`: determinant `30 = 3 · 5 · 2`, Mathlib's `det_vandermonde`.
- One node `a = (5)`, `m = (3)`: the matrix is upper unitriangular (`D^[k] X^j (5) = choose j k · 5^(j−k)`),
  determinant `1`, the empty product; the ordinary matrix at the node `0` is `diag(0!, 1!, 2!)` with
  determinant `2`.
- `r = 0` or `m = 0`: the `0 × 0` matrix has determinant `1`.
- `a = (0, 0)`, `m = (1, 1)`: determinant `0 = 0^1`; the formula needs no injectivity.

### Examples

Hermite interpolation at the integer nodes `0, 1` with multiplicities `(2, 1)`: the datum
`f(0) = 1, f'(0) = 0, f(1) = 0` has the unique solution `f = 1 − X²` of degree below `3`, and the
matrix of 1.3 for this datum has determinant `1`. The confluent Vandermonde determinant for
`a = (0, 1, 2)`, `m = (2, 1, 1)` is `4`, while the ordinary-derivative matrix has determinant
`4 · 1! = 4` as well, since every `k < 2` has `k! = 1`.

### Dependencies

1.1 needs 1.2 and Mathlib; 1.2 needs Mathlib and the multiplicity criterion of
CharacterSumsOverFiniteFields §4.1 in its divisibility form; 1.3 needs 1.1 and Mathlib. Layer 1 does
not use Layer 0.

## Layer 2: rank, minors and coefficient coordinates

### 2.1 Full-row minors

Prove `exists_full_row_minor`: for a field `K` and `A : Matrix (Fin m) (Fin n) K` whose rows are
linearly independent, there is an injective `c : Fin m → Fin n` with `det (A.submatrix id c) ≠ 0`.
Route: the row space has dimension `m` (Mathlib `rank_eq_finrank_span_row`), so some `m` columns
span the column space of the row-reduced form; equivalently, extend the independent rows and read
off a nonzero minor through `linearIndependent_row_iff_isUnit` on the square submatrix. Include the
empty case `m = 0` (the empty minor is `1`) and the consequence `m ≤ n`. Prove the converse: a
nonzero minor `det (A.submatrix id c) ≠ 0` for some `c` implies that the rows of `A` are linearly
independent. *Needs:* Mathlib `Matrix.rank`, `rank_eq_finrank_span_row`,
`linearIndependent_row_iff_isUnit`, `Matrix.submatrix`, `det_fin_zero`.

**Checks.**

- `A = [[1, 0, 0], [0, 1, 0]]`: `c = (0, 1)` gives the minor `1`; `c = (0, 2)` gives `0`, so the
  choice of columns is part of the statement.
- `A = [[1, 1], [2, 2]]`: the rows are dependent and every `2 × 2` minor (there is one) is `0`.
- `m = 0`: the empty submatrix has determinant `1 ≠ 0`, and `c` is the empty map.
- `m = 2`, `n = 1`: no injective `c` exists, consistent with the rows of a `2 × 1` matrix being
  dependent over a field.

### 2.2 Minors under ring maps and field extension

For a ring homomorphism `f : R →+* S`, prove that `det ((A.map f).submatrix id c) ≠ 0` implies
`det (A.submatrix id c) ≠ 0`, with no injectivity hypothesis on `f`: the mapped minor is `f` of the
minor (Mathlib `submatrix_map`, `RingHom.map_det`). Prove the converse direction under injectivity
of `f`. Prove reduction with the column selection retained: a column choice `c` found over `S`
serves over `R`. For a field extension `K ⊆ L`, prove that the rows of `A : Matrix (Fin m) (Fin n) K`
are independent over `K` iff the rows of `A.map (algebraMap K L)` are independent over `L`, through
2.1 and the previous statement; this is stated for matrices over `K` mapped into `L`, not for
arbitrary vectors of an unrelated `L`-space. A base change along a ring map that is not a field
extension carries the flatness or faithful-flatness hypothesis it needs and is not inferred from the
field case. *Needs:* 2.1; Mathlib `RingHom.map_det`, `Matrix.submatrix_map`,
`LinearIndependent.map_injOn`.

**Checks.**

- `f : ℤ → ZMod 2`, `A = [[1]]`: the reduced minor `1 ≠ 0` lifts to `1 ≠ 0` over `ℤ`.
- `f : ℤ → ZMod 2`, `A = [[2]]`: the integral minor `2 ≠ 0` reduces to `0`; the converse needs
  injectivity, which this `f` lacks.
- `K = ℚ ⊆ L = ℝ`, `A = [[1, √2]]` is not a matrix over `ℚ`; the statement concerns `A` over `ℚ`
  such as `[[1, 2]]`, whose single row is independent over both fields.

### 2.3 Coefficient matrices over a finite free algebra

For a commutative ring `R`, a commutative `R`-algebra `A` with a finite basis `b : Basis ι R A`, and
an `R`-linear map `φ : V →ₗ[R] A` from a free module `V` with basis `v`, define the coefficient matrix
of `φ` as the matrix over `R` with rows `ι` and columns the basis of `V`, entry `b.repr (φ (v j)) i`.
Prove that it is the matrix of `φ` composed with `b.repr`, so that `φ (∑ x_j v_j)` has coordinate
`i` equal to the `i`-th row applied to `x`. Prove `coordinates_mem_extended_ideal`: for an ideal `J`
of `R` and `x ∈ A`, `x ∈ J.map (algebraMap R A)` iff every coordinate `b.repr x i` lies in `J`.
Route: the basis identifies `A` with `ι → R` as `R`-modules and carries `J A` to `ι → J`; one
direction since `J A` is spanned by `j · b i`, the other by writing `x = ∑ (b.repr x i) · b i`.
Give the reduction diagram: `A ⧸ J A` is free over `R ⧸ J` on the image of `b`, and the coefficient
matrix over `R ⧸ J` is the entrywise reduction. The criterion concerns the extended ideal `J A`
only, not an arbitrary ideal of `A`. Coordinate splitting `A → ι → R` is not a ring homomorphism, so
a determinant of an `A`-valued matrix is not computed coordinatewise. *Needs:* Mathlib `Basis.repr`,
`Ideal.map`, `Ideal.map_span`, `Submodule.mem_span`, `Basis.linearCombination_repr`.

**Checks.**

- `A = R`, `b = 1`: `J A = J` and the criterion is the identity.
- `A = ℤ[i]` with basis `1, i`, `J = 2ℤ`: `2 + 2i ∈ 2ℤ[i]` with coordinates `2, 2`; `1 + i ∉ 2ℤ[i]`
  and its coordinate `1 ∉ 2ℤ`.
- `A = ℤ[i]`, the ideal `(1 + i)` of `A` is not of the form `J A`: `1 + i` lies in it but its
  coordinates do not lie in any `J` with `J A = (1 + i)` (there is none); the criterion is stated for
  extended ideals only.
- Determinants are not coordinatewise: over `ℤ[i]`, `det [[i]] = i` has coordinates `(0, 1)`,
  while the coordinate matrices `[[0]]` and `[[1]]` have determinants `0` and `1`.

### Examples

For the Hermite matrix of 1.3 with `a = (0, 1)`, `m = (2, 1)` over `ℤ`, reduced modulo `2`, the
minor on all three columns is `1 ≠ 0` modulo `2`, hence `≠ 0` over `ℤ` by 2.2. The `2 × 3` matrix of
the Examples of Layer 0 has the full-row minor on columns `(0, 1)` equal to `1`.

### Dependencies

2.1 needs Mathlib; 2.2 needs 2.1 and Mathlib; 2.3 needs Mathlib. Layer 2 does not use Layers 0–1.

## Layer 3: ideal divisibility and changes of rows

### 3.1 Determinants in products of row ideals

Prove `det_mem_prod_row_ideals`: for a commutative ring `R`, `A : Matrix (Fin n) (Fin n) R` and
ideals `J : Fin n → Ideal R` with `A i j ∈ J i` for all `i, j`, `det A ∈ ∏ i, J i`. Route: the
Leibniz expansion `det A = ∑_σ sign σ ∏_i A (σ i) i` (Mathlib `det_apply`); each product has one
factor from every row, hence lies in `∏ J i` (Mathlib `Ideal.prod_mem_prod`), and the ideal is
closed under sums and signs. Give the column form (transpose), the common-ideal form
(`det A ∈ J^n` when every entry lies in `J`), the principal-ideal form (`r^n ∣ det A` when `r`
divides every entry), and the scalar-row-factor form (`det (fun i j => r i * A i j) = (∏ r i) det A`).
Apply each to every full-row minor `det (A.submatrix id c)` of a rectangular `A` whose rows lie in
the `J i`. The empty product is `⊤` and the `0 × 0` determinant `1 ∈ ⊤`. *Needs:* Mathlib
`Matrix.det_apply`, `Ideal.prod_mem_prod`, `det_transpose`, `Matrix.det_smul`.

**Checks.**

- `A = [[2, 4], [3, 9]]` over `ℤ`, `J = (2ℤ, 3ℤ)`: `det A = 18 − 12 = 6 ∈ 6ℤ`.
- `A = [[2, 2], [1, 1]]`, `J = (2ℤ, ℤ)`: `det A = 0 ∈ 2ℤ`.
- `n = 0`: `det = 1 ∈ ⊤`, the empty product of ideals.
- The row hypothesis is on rows, not on columns: `A = [[2, 3], [2, 3]]` has columns in `2ℤ` and `3ℤ`
  and determinant `0 ∈ 6ℤ`, while `A = [[2, 3], [4, 9]]` has `det = 6 ∈ 6ℤ` by the column form and
  `[[2, 3], [1, 1]]` has `det = −1 ∉ 6ℤ`, so without a row or column hypothesis nothing holds.

### 3.2 Unitriangular row changes

Prove `unitriangular_mul_minor`: for `U : Matrix (Fin m) (Fin m) R` with `U i i = 1` and `U i j = 0`
for `i < j` (lower unitriangular), every `A : Matrix (Fin m) (Fin n) R` and every column choice `c`,
`det ((U * A).submatrix id c) = det (A.submatrix id c)`. Route: `(U * A).submatrix id c = U * A.submatrix id c`,
`det_mul`, and `det U = 1` by `det_of_isLowerTriangular`. Give the upper unitriangular form, the
column form (`A * U` with `U` unitriangular, for square `A`), the statement that `det U = 1` is all
that is used, closure of unitriangular matrices under products and inverses, and the composite form
for a product of unitriangular changes. The hypothesis is on the coefficient matrix, not a structure
assuming determinant preservation. *Needs:* Mathlib `Matrix.det_mul`, `det_of_isLowerTriangular`,
`det_of_isUpperTriangular`, `Matrix.submatrix`.

**Checks.**

- `U = [[1, 0], [1, 1]]`, `A = [[1, 2, 0], [0, 1, 5]]`, `c = (0, 1)`: `U A = [[1, 2, 0], [1, 3, 5]]`,
  minor `3 − 2 = 1`, equal to the minor `1 · 1 − 2 · 0 = 1` of `A`.
- `U = [[1, 2], [0, 1]]` (upper unitriangular): `U A = [[1, 4, 10], [0, 1, 5]]`, minor `1`; the
  upper form holds as well.
- `U = 2 · I`: `det U = 4` and the minor on `c = (0, 1)` becomes `4`, excluded by `U i i = 1`.
- `U = [[0, 1], [1, 0]]`: a permutation changes the sign of the minor to `−1`; it is not
  unitriangular.

### 3.3 The Gram change-of-family identity

Prove `det_gram_matrix_smul`: for a finite type `ι`, a real inner product space `E`, a matrix
`U : Matrix ι ι ℝ` and a family `v : ι → E`, with `w i = ∑ j, U i j • v j`,
`det (Matrix.gram ℝ w) = (det U)^2 · det (Matrix.gram ℝ v)`. Route: `gram ℝ w = U * gram ℝ v * Uᵀ`
by bilinearity of the inner product (`⟪w i, w k⟫ = ∑_{j,l} U i j U k l ⟪v j, v l⟫`), then `det_mul`
and `det_transpose`. No independence of `v` and no hypothesis on `dim E` is needed; dependent `v`
gives `0 = (det U)^2 · 0`. In particular a lower or upper unitriangular `U` preserves the Gram
determinant, and a diagonal `U = diag (r i)` multiplies it by `∏ (r i)^2`. Prove the complex form:
for `U : Matrix ι ι ℂ` and `v` in a complex inner product space,
`gram ℂ w = U.map conj * gram ℂ v * Uᵀ` (the inner product is conjugate-linear in its first
argument) and `det (gram ℂ w) = ((‖det U‖^2 : ℝ) : ℂ) · det (gram ℂ v)`, since
`det (U.map conj) = conj (det U)`. *Needs:* Mathlib `Matrix.gram`, `gram_apply`, `inner_sum`,
`sum_inner`, `inner_smul_left`, `inner_smul_right`, `det_mul`, `det_transpose`, `RingHom.map_det`.

**Checks.**

- `U = [[1, 0], [1, 1]]`, `v = (e₁, e₂)` orthonormal: `w = (e₁, e₁ + e₂)`, `gram w = [[1, 1], [1, 2]]`,
  determinant `1 = 1^2 · 1`.
- `U = 2 · I₂`, `v = (e₁, e₂)`: `gram w = 4 · I₂`, determinant `16 = 4^2 · 1`; a formula with
  `det U` in place of `(det U)^2` would give `4`.
- `v = (e₁, e₁)`: `det (gram v) = 0` and both sides vanish for every `U`.
- `ι` empty: both Gram determinants are `1` and `det U = 1`.
- Complex: `U = [[i]]`, `v = (e₁)`: `w = (i e₁)`, `⟪i e₁, i e₁⟫ = conj(i) · i = 1 = conj(U) gram(v) Uᵀ`,
  and the factor is `‖i‖^2 = 1`; a formula with `(det U)^2 = −1` would be wrong.

### 3.4 Derivatives of products in ideal powers

Prove `derivative_prod_mem_ideal_pow`: for a commutative ring `R`, a finite family `f : ι → R[X]`,
a cofactor `g ∈ R[X]`, a point `a`, an ideal `J` and an order bound `K`, if `D^k (f i) (a) ∈ J` for
all `i` and all `k ≤ K`, then `D^k (g * ∏ i, f i) (a) ∈ J^(card ι)` for all `k ≤ K`. Route: the
iterated Leibniz rule writes `D^k (g ∏ f i)` as a sum of products with one derivative of each
factor, of orders summing to at most `k ≤ K`, so each term contributes one factor from `J` per `i`;
the cofactor is unrestricted. Prove `hasseDeriv_prod_mem_ideal_pow`, the same with Hasse derivatives
`D^[k]` and hypotheses on Hasse derivatives, from Mathlib's `hasseDeriv_mul`, and
`pderiv_prod_mem_ideal_pow`, the bivariate form for `∂_Z^k` and `MvPolynomial.eval a` at a point
`a : Fin 2 → R`; give the version for an arbitrary variable set and a chosen partial derivative.
Ordinary hypotheses do not imply Hasse hypotheses: for `X^p` over `ℤ`, `D^p (X^p) = p!` while
`D^[p] (X^p) = 1`. No factorial is cancelled, and no `K < p` enters: the bound `K < p` of 0.5
concerns multiplicity detection in a residue field, not these integral statements, which hold for
every `K`. Include `card ι = 0` (`J^0 = ⊤`), a zero factor, and `K = 0`. *Needs:* Mathlib
`Polynomial.derivative_mul`, `Polynomial.hasseDeriv_mul`, `Finset.prod`, `Submodule.mul_mem_mul`,
`Submodule.pow_mem_pow`; Tau Ceti `MvPolynomial.hasseDeriv_mul` and Mathlib `MvPolynomial.pderiv_mul`
for the multivariate forms.

**Checks.**

- `ι` empty: the conclusion is membership in `J^0 = ⊤`.
- One factor `f = X`, `g = 1`, `a = 0`, `J = (0)`, `K = 0`: `f(0) = 0 ∈ J` and the product `X`
  evaluates to `0 ∈ J^1`.
- Two factors `X, X`, `a = 0`, `J = (0)`, `K = 1`: `D(X²)(0) = 0 ∈ J²`; at `K = 2`, `D²(X²)(0) = 2 ∉ J²`
  over `ℤ` (while `D² X (0) = 0 ∈ J`), so the bound `K` on the orders is essential.
- `f = (X), g = X^5`, `J = (0)`, `a = 0`, `K = 3`: `D^k (X^6)(0) = 0` for `k ≤ 3`, in `J^1`; the
  cofactor adds no hypothesis and no factor.
- `R = ℤ`, `p = 3`, one factor `X³`, `J = (3)`, `a = 0`: ordinary derivatives at `0` are
  `0, 0, 0, 6 ∈ (3)` for `k ≤ 3`, while the Hasse derivatives are `0, 0, 0, 1 ∉ (3)`; the Hasse
  statement needs Hasse hypotheses.

### Examples

For `A = [[2, 4], [3, 9]]` the determinant `6` lies in `2ℤ · 3ℤ`; after the unitriangular change
`U = [[1, 0], [1, 1]]` the matrix is `[[2, 4], [5, 13]]` with the same determinant `6`. The real
family `v = (e₁, e₂)` changed by `U` has Gram determinant `1`.

### Dependencies

3.1, 3.2 and 3.4 need Mathlib (and Tau Ceti for the multivariate Leibniz rule); 3.3 needs Mathlib's
Gram matrix. Layer 3 does not use Layers 0–2.

## Layer 4: determinant size estimates

### 4.1 Row-dependent determinant bounds

Prove `norm_det_le_factorial_prod`: for `A : Matrix (Fin n) (Fin n) ℂ` and `B : Fin n → ℝ` with
`0 ≤ B i` and `‖A i j‖ ≤ B i` for all `i, j`, `‖det A‖ ≤ n! · ∏ i, B i`. Route: the Leibniz
expansion has `n!` terms, each a product with one entry from every row (Mathlib `det_apply'`,
`norm_sum_le`, `norm_prod`). Give the form for an arbitrary absolute value `abv : AbsoluteValue R S`
over a commutative ring (the row-dependent refinement of Mathlib's `Matrix.det_le`, whose bound is
`n! • x^n` for a single `x`), the column form, and the form for a matrix over a number field after
an embedding `σ : K →+* ℂ` applied entrywise (`‖σ (det A)‖ ≤ n! ∏ B i` when `‖σ (A i j)‖ ≤ B i`).
State the logarithmic consequence: if `det A ≠ 0` and every `B i > 0`, then
`log ‖det A‖ ≤ log (n!) + ∑ i, log (B i)`. For `n = 0` the determinant is `1`, the product is
empty and the logarithm is `0`. (W, §§2.4 and 10.2, the shape of the archimedean estimate of an
interpolation determinant; the bound itself is the triangle inequality on the Leibniz expansion.)
*Needs:* Mathlib `Matrix.det_apply'`, `norm_sum_le`, `norm_prod`, `Fintype.card_perm`,
`Matrix.det_le`, `Real.log_le_log`, `Real.log_mul`, `Real.log_prod`.

**Checks.**

- `n = 0`: `‖1‖ = 1 ≤ 0! · 1 = 1`.
- `A = [[1, 1], [1, −1]]`, `B = (1, 1)`: `‖det A‖ = 2 ≤ 2! · 1 = 2`, an equality.
- `A = [[1, 1], [1, −1]]` with `B = (1, 2)` (a valid but looser bound): `2 ≤ 2! · 2 = 4`.
- Row bounds, not column bounds: `A = [[1, 0], [10, 1]]` has `‖A i j‖ ≤ B i` for `B = (1, 10)` and
  `‖det A‖ = 1 ≤ 2 · 10`; swapping the roles of rows and columns in the hypothesis is the column form.

### 4.2 Gram determinants and the sharp Hadamard bound

Consume Tau Ceti's `Matrix.det_gram_le_prod_norm_sq`, `re_det_gram_le_prod_norm_sq` and
`re_det_gram_le_pow` for a finite family `v : ι → E` in a real or complex inner product space `E`,
with no independence hypothesis and no bound on `dim E`, so that rectangular coordinate matrices are
covered; and `re_det_gram_nonneg` with `det_gram_ne_zero_iff_linearIndependent`. Prove the
logarithmic form: for a linearly independent real family, `0 < det (gram ℝ v)` and
`log (det (gram ℝ v)) ≤ ∑ i, 2 log ‖v i‖`, with the complex form on the real part. Prove the
adapter to a square matrix: for `A : Matrix (Fin n) (Fin n) ℝ` with rows `v i = A i` in
`EuclideanSpace ℝ (Fin n)`, `det (gram ℝ v) = (det A)^2` and hence `|det A| ≤ ∏ i, ‖A i‖`, the
classical Hadamard inequality, sharper than 4.1 once the row norms are compared with
`√n · max_j |A i j|`: the two bounds then differ by the factor `n! / n^(n/2)`, which exceeds `1`
from `n = 3` on. The factorial entry bound of 4.1 never replaces this
estimate in an adapter: a consumer that has Euclidean row norms takes this section. *Needs:* Tau
Ceti `Matrix.det_gram_le_prod_norm_sq`, `re_det_gram_le_prod_norm_sq`, `re_det_gram_le_pow`,
`re_det_gram_nonneg`, `det_gram_eq_norm_det_sq`; Mathlib `Matrix.det_gram_ne_zero_iff_linearIndependent`,
`Matrix.PosSemidef.det_nonneg`, `Real.log_le_log`.

**Checks.**

- `v = (e₁, e₂)`: `det (gram v) = 1 ≤ 1 · 1`, `log 1 = 0 ≤ 0`.
- `v = ((1, 0), (1, 1))`: `gram v = [[1, 1], [1, 2]]`, determinant `1 ≤ 1 · 2 = 2`, and the square
  matrix with these rows has `det = 1`, `|det| = 1 ≤ 1 · √2`.
- `v = (e₁, e₁)`: determinant `0`, no logarithm; the independence hypothesis of the logarithmic
  form excludes it.
- `n = 2`, `A = [[1, 1], [1, −1]]`: Hadamard gives `|det A| = 2 ≤ √2 · √2 = 2`, 4.1 gives `2 ≤ 2`;
  for `n = 3` and the `3 × 3` matrix with entries `±1` and `det = 4`, Hadamard gives `4 ≤ 3^(3/2) ≈ 5.2`
  while 4.1 gives `6`.

### 4.3 Bounds on evaluated derivatives

Prove `norm_hasseDeriv_eval_le`: for `f ∈ ℂ[X]` with `natDegree f ≤ d`, coefficient bound
`‖coeff f j‖ ≤ H` (`H ≥ 0`) and `‖a‖ ≤ A`, `‖D^[k] f (a)‖ ≤ H · ∑_{j = k}^{d} choose j k · A^(j − k)`.
Route: `D^[k] f (a) = ∑_j coeff f j · choose j k · a^(j − k)` (Mathlib `hasseDeriv_coeff`) and the
triangle inequality; terms with `j < k` vanish. The ordinary bound is `k!` times this one; for
`k > d` the left side is `0` and the sum is empty. Give the coarse versions
`‖D^[k] f (a)‖ ≤ H (d + 1) 2^d max(1, A)^d` and the form in terms of the coefficient length of
DiophantineApproximationAndTranscendence §1.1. Prove the multivariate product-binomial bound on an
arbitrary finite support `T`: for `F ∈ restrictSupport ℂ T` with `‖coeff μ F‖ ≤ H` and a point
`a` with `‖a s‖ ≤ A s`, `‖eval a (hasseDeriv d F)‖ ≤ H ∑_{μ ∈ T} ∏_s choose (μ s) (d s) (A s)^(μ s − d s)`.
Package the row bounds of a jet matrix of 0.2 or 1.3: row `(i, d)` of the matrix of
`T`-supported polynomials has entries bounded by `∏_s choose (μ s) (d s) (A i s)^(μ s − d s)`, so
4.1 applies with `B_(i,d)` the maximum over `μ ∈ T`, and 4.2 applies with the Euclidean norm of the
row. *Needs:* Mathlib `Polynomial.hasseDeriv_coeff`, `Polynomial.eval_eq_sum_range`,
`norm_sum_le`, `norm_mul`, `norm_pow`; Tau Ceti `MvPolynomial.hasseDeriv_coeff`,
`abv_coeff_hasseDeriv_le`; DiophantineApproximationAndTranscendence §1.1 for the length form.

**Checks.**

- `f = X²`, `k = 1`, `d = 2`, `H = 1`, `A = 2`, `a = 2`: `D^[1] f (2) = 4 ≤ 1 · (choose 1 1 · 1 + choose 2 1 · 2) = 5`.
- `f = X²`, `k = 3 > d`: the left side is `0` and the sum over `Finset.Icc 3 2` is empty, `0 ≤ 0`.
- `f = 1 + X + X²`, `k = 0`, `A = 1`, `a = 1`, `H = 1`: `f(1) = 3 ≤ 1 + 1 + 1 = 3`, an equality; the
  coarse bound gives `3 · 4 = 12`.
- Bivariate: `F = Z W`, `d = (1, 0)`, `a = (2, 3)`, `A = (2, 3)`, `H = 1`: `∂_Z^[1] F (2, 3) = 3 ≤ 1 · choose 1 1 · 2^0 · 3^1 = 3`.

### Examples

The confluent Vandermonde matrix for `a = (0, 1)`, `m = (2, 1)` over `ℂ` has row bounds
`B = (1, 1, 1)` from 4.3 with `H = 1`, `A = 1`, and 4.1 gives `|det| = 1 ≤ 3! = 6`; its rows have
Euclidean norms `1, 1, √3`, and 4.2 gives `1 ≤ √3`.

### Dependencies

4.1 needs Mathlib; 4.2 needs Tau Ceti's Hadamard file and Mathlib; 4.3 needs Mathlib, Tau Ceti and
DiophantineApproximationAndTranscendence §1.1 for its coarse form; the row packaging uses 0.2 and
1.3 only to name the matrices.

## Layer 5: integral norms and divisibility lower bounds

### 5.1 Norms of scalar multiples and nonvanishing

For a finite free algebra `S` over a commutative ring `R` of rank `n`, consume
`Algebra.norm_algebraMap`: `norm R (algebraMap R S r) = r^n`, and multiplicativity. For a number
field `K` with ring of integers `𝓞 K` of rank `n = finrank ℚ K` (Mathlib `RingOfIntegers.rank`),
prove: if `a = (m : 𝓞 K)^e · b` with `a, b ∈ 𝓞 K` and `m ∈ ℤ`, then `m^(n e)` divides
`Algebra.norm ℤ a` in `ℤ`; a nonzero `a ∈ 𝓞 K` has nonzero integral norm (Mathlib
`Algebra.norm_ne_zero_iff` with `𝓞 K` a domain, through `Algebra.coe_norm_int`); the norm is the
product over the complex embeddings, `(Algebra.norm ℚ a : ℂ) = ∏_{σ : K →ₐ[ℚ] ℂ} σ a`
(Mathlib `norm_eq_prod_embeddings`). Nonvanishing of norms needs the domain hypothesis: in the
split algebra `ℚ × ℚ` the element `(1, 0)` is nonzero with norm `0`. (M, Chapter 2, "Review of
norms and traces".) *Needs:* Mathlib `Algebra.norm_algebraMap`, `Algebra.norm_mul`,
`norm_ne_zero_iff`, `norm_eq_prod_embeddings`, `NumberField.RingOfIntegers.rank`,
`Algebra.coe_norm_int`.

**Checks.**

- `K = ℚ(i)`, `a = 2 (1 + i)`, `m = 2`, `e = 1`: `norm a = 8` and `2^(2 · 1) = 4 ∣ 8`.
- `K = ℚ(i)`, `a = 1 + i`: `norm a = 2`, and `4 ∤ 2`; membership in the prime ideal `(1 + i)` above
  `2` does not give the factor `2^n`, only scalar divisibility does.
- `m = 0`, `e ≥ 1`: `a = 0` and `0 ∣ 0`.
- `ℚ × ℚ`: `(1, 0) ≠ 0` with norm `0`; the nonvanishing statement carries `IsDomain`.

### 5.2 Embedding bounds and the prime-sum lower bound

Prove: for `a ∈ 𝓞 K` and bounds `‖σ a‖ ≤ C σ` at every complex embedding `σ`,
`|Algebra.norm ℤ a| ≤ ∏_σ C σ`; for a common bound `C`, `|norm a| ≤ C^n`. Prove: for distinct
rational primes `p ∈ P` and exponents `e p` with `∏_{p ∈ P} p^(e p)` dividing a nonzero integer `z`,
`∑_{p ∈ P} e p · log p ≤ log |z|` (the divisor is at most `|z|`, and `log` is monotone); combine
divisibilities at finitely many distinct primes into the product divisibility (coprime divisors
multiply, `Nat.Coprime.mul_dvd_of_dvd_of_dvd` and Mathlib `Finset.prod_primes_dvd`). Apply the
package to a determinant `δ ∈ 𝓞 K` after its integrality, divisibility (Layer 3) and embedding
bounds (Layer 4) are in hand: `∑ e_p log p ≤ log |norm δ| ≤ n log C`. The nonvanishing of `δ` is a
hypothesis of the lower bound and is never derived here. (M, Chapter 2, "Review of norms and
traces"; W, §10.2, for the use in interpolation determinants.) *Needs:* 5.1; Mathlib
`norm_eq_prod_embeddings`, `Int.le_of_dvd`, `Real.log_le_log`, `Real.log_prod`,
`Nat.Coprime.mul_dvd_of_dvd_of_dvd`, `Finset.prod_primes_dvd`.

**Checks.**

- `K = ℚ(i)`, `a = 1 + i`: the embeddings give `‖1 ± i‖ = √2`, product `2 = |norm a|`, equality.
- `z = 12`, `P = {2, 3}`, `e = (2, 1)`: `2 log 2 + log 3 = log 12 ≤ log 12`.
- `P = ∅`: the left side is `0 ≤ log |z|` since `|z| ≥ 1`.
- `z = 12`, `P = {2}`, `e = 3`: `8 ∤ 12`, the hypothesis fails and `3 log 2 = log 8 ≤ log 12` holds
  anyway; the bound is a consequence of divisibility, not equivalent to it.

### Examples

In `ℚ(√2)`, `a = 3 (1 + √2)`, `m = 3`, `e = 1`: `norm a = 9 · (1 − 2) = −9`, divisible by `3^2`,
with `|σ a| = 3 (1 + √2)` and `3 (√2 − 1)`, product `9`. In `ℚ(√−5)`, `a = 2 + √−5` has norm `9`
and embeddings of modulus `3`, so `|norm a| = 9 = 3^2`.

### Dependencies

5.1 needs Mathlib; 5.2 needs 5.1 and Mathlib. Layer 5 does not use Layers 0–4; its application to a
determinant takes Layers 3–4 as hypotheses.

## Downstream consumers

No roadmap on the main branch or earlier in the merge order cites this roadmap. A consumer that
builds an arithmetic interpolation determinant takes from here: the jet matrix and its full-row
minors (0.2, 2.1), the reduction and lifting of minors (2.2), the ideal-divisibility and
unitriangular invariances of a minor (3.1, 3.2, 3.4), the Gram change of family (3.3), the upper
bounds (4.1–4.3) and the norm lower bound (5.1–5.2). Its own Gram matrix, trace pairing, support,
exponent counts and parameter choices stay with the consumer.

## Worked examples

- Over `ℤ`, the Hermite matrix with nodes `0, 1` and multiplicities `(2, 1)` has determinant `1`;
  modulo `2` it still has determinant `1`, so the nonvanishing lifts by 2.2. The matrix `[[2]]`
  has a nonzero integral determinant that reduces to `0` modulo `2`, the one-way lift.
- Over the quadratic order `ℤ[√2]`, the matrix `[[1, √2], [√2, 2]]` has determinant `0`, while
  `[[1, √2], [√2, 3]]` has determinant `1`, with coordinates `(1, 0)` in the basis `1, √2`.
- Over `ℤ`, every full-row minor of `[[2, 4, 6], [3, 6, 12]]` lies in `2ℤ · 3ℤ = 6ℤ`: the three
  minors are `0, 6, 12`.
- For `ℚ(i)` and `ℚ(√2)`, the elements `1 + i` and `1 + √2` have norms `2` and `−1`, bounded by
  the products of the embedding moduli `√2 · √2 = 2` and `(1 + √2)(√2 − 1) = 1`.

## References

- **[IK]** H. Iwaniec and E. Kowalski, *Analytic Number Theory*, Chapter 11, Sums over finite
  fields (AMS Colloquium Publications 53, 2004), §11.6, Lemma 11.16, pp. 283–284, and Lemma 11.17,
  p. 284; author-page copy of the chapter.
- **[P]** L. Pottmeyer, *Diophantine Approximation*, lecture notes, version of 17 January 2022,
  §3.3, Theorem 3.3.7 and Exercise 3.5, pp. 91–95.
- **[M]** J. S. Milne, *Algebraic Number Theory*, version 3.08 (2020), Chapter 2, Rings of
  Integers, the review of norms and traces.
- **[Laurent]** M. Laurent, *Sur quelques résultats récents de transcendance*, Astérisque 198–200
  (1991), 209–230, §6.2, determinants in interpolation.
- **[W]** M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups* (Grundlehren 326,
  2000), §§2.4 and 10.2, interpolation determinants and their archimedean and arithmetic estimates.
