# Integral representations of general linear groups

**Summary.** This roadmap states the background on general linear groups that the shorter proof uses, in the forms
in which it uses it. It has two halves.

The first half (Layers 1–3) is the theory of the polynomial representations of a product `∏_τ GL(n_τ)` over an
arbitrary commutative ring, in a model by polynomials in a matrix of variables. The representation of a weight `κ`
(numbers of columns of each height) is the dual `W_R(κ)` of the module `∇_R(κ)` of polynomials that are
semi-invariant under upper triangular matrices acting on the columns. This module has a basis of products of minors
that is the same over every ring (1.2); a family of matrices acts on `W_R(κ)` by its Schur matrix (1.3). Over the
integers `W_ℤ(κ)` carries an integral, symmetric, positive definite Gram matrix, the restriction of the standard form
on tensors (2.1). The Fock (Fischer) pairing of polynomials inverts this Gram matrix up to one integer, the hook
number, which therefore bounds every denominator between the lattice and its dual (2.2). Then come the adjoint formula
and a bound of Schur matrices by singular values (2.3), Schur's lemma, irreducibility under the compact group and
Schur orthogonality (2.4), multiplication of semi-invariants (2.5), duals and the invariant pairing of dual weights
(3.1), mixed weights and their Cartan product (3.2), and integral branching maps from `GL(n + 1)` to
`GL(n) × GL(1)` (3.3, 3.4), whose norm bound does not see the short columns of the diagram.

The second half (Layers 4–6) is `GL_n` over finite and over local fields. Over a finite field `k`, Green's cuspidal
functions and the characters `Ξ_c` attached to squarefree polynomials `c` (labels) are defined by Green's formula in
the ring of class functions on all square matrices, with parabolic induction as product; no Deligne–Lusztig
induction is used (Layer 4). They are shown to be orthonormal irreducible characters through lifts to
`GL_n(k′) ⋊ Gal(k′/k)` for extensions `k′/k`, which also give Shintani lifting of the `Ξ_c` in prime degree
(Layer 5). Over a non-archimedean local field, Layer 6 states the pro-`p` Iwahori level structure of `GL_N`: a
decomposition and a twisted conjugacy statement, the operators `U_t`, and *exponents*, linear forms that are
eigenforms of the `U_t` and stand in for Jacquet modules; Satake's formula on exponents, the fact that a sorted
unramified exponent is seen by spherical vectors, and chains of roots of the Hecke polynomial of a spherical vector in
a unitary representation.

**Where this sits in the argument.** A one-sided bound for a sum over primes gives a half-plane free of zeros of
Dirichlet L-functions, and the bound comes from comparing an upper and a lower bound for the covolume of a lattice of
theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The forms that are lifted are algebraic modular forms on
definite unitary groups with values in representations of `∏_τ GL` over the infinite places of a CM field
(AdelicUnitaryGroupsAndAlgebraicModularForms); Layers 1–3 give these values their integral structure and their norms.
The norm bound of Schur matrices bounds the size of the composite lift (CompositeThetaLiftsAndShortForms), the
branching map of 3.4 restricts the chains of lifts (ThetaLiftChainsAndTheSeesawIdentity), and the invariant pairing,
the Cartan product and the hook-number denominators enter the lower bound (DeterminantsOfThetaLiftChains,
NormsOfThetaLiftsAndExchangeIdentities). The labels and their idempotents (5.3) name the good forms and the target
forms; the degree bound of 5.3 enters the main term of the second moment (RemainingAndMainTermsOfSecondMoments).
Shintani lifting and the Iwahori-level statements enter the Galois representations of eigenforms
(GaloisRepresentationsOfUnitaryEigenforms), and the chains of 6.8 enter the congruences to first order
(CongruencesOfTwistedThetaLifts).

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *Rings and matrices.* `R` is a commutative ring. For finite sets `a`, `b`, `M_{a×b}(R)` is the set of matrices with
  rows `a` and columns `b`; `z*` is the conjugate transpose of a complex matrix and `zᵀ` the transpose; `diag(x)` is
  the diagonal matrix of a vector `x`. `U(n)` is the group of complex unitary matrices with rows and columns `n`, with
  its Haar probability measure. A *character* of a finite group is the character of a finite-dimensional complex
  representation; a *virtual character* is a `ℤ`-combination of characters; for functions `f`, `f′` on a finite
  group `G`, `⟨f, f′⟩_G := |G|^{−1} Σ_g conj(f(g))·f′(g)`.
- *Places and rows.* `Φ` is a finite set (of places; in the applications, the infinite places of a CM field). For each
  `τ ∈ Φ`, `n_τ` is a finite set of rows with a fixed numbering by `0, …, N_τ − 1`, `N_τ := |n_τ|`. The weights,
  modules and matrices of Layers 1–3 are those of 1.1.
- *Finite fields.* `k` is a finite field with `q` elements, `K` a field containing `k`; the objects of Layers 4 and 5
  are those of 4.1 and 5.1.
- *Local fields.* `F` is a field with a valuation with values in `ℤ ∪ {∞}` whose ring of integers `𝒪` is compact
  (a non-archimedean local field), `𝔭` the maximal ideal, `𝓀 = 𝒪/𝔭` the residue field with `q` elements, `ϖ` a
  uniformiser, `|x| = q^{−ord(x)}` the normalised absolute value. The objects of Layer 6 are those of 6.1.

| Symbol | Meaning | Defined in |
|---|---|---|
| `y = (y_{(τ,a),i})` | matrix of variables, row `(τ, a)` with `a ∈ n_τ`, column `i ∈ ℕ` | 1.1 |
| `κ`, `λ_κ(τ, i)`, `‖κ‖` | weight: `κ_τ(h)` columns of height `h` at `τ`; row lengths; number of boxes | 1.1 |
| `Δ_I`, `Π_T` | minor on the rows `I` and the first columns; product of the minors of a filling `T` | 1.1 |
| `∇_R(κ)` | Borel semi-invariant polynomials of weight `κ` | 1.1 |
| `B(κ)`, `b_i` | standard basis of products of minors, indexed by `B(κ)` | 1.1, 1.2 |
| `W_R(κ) = R^{B(κ)}` | the Weyl module, dual to `∇_R(κ)` | 1.1 |
| `ev_y` | evaluation vector `(b_i(y))_i` | 1.1 |
| `S_κ(z)`, `d_τ` | Schur matrix of a family `z` of matrices; its determinant exponents | 1.1, 1.3 |
| `ρ_{κ,e}` | representation of weight `(κ, e)`, `e ∈ ℤ^Φ` | 1.1 |
| `K_κ`, `G_κ` | kernel `v_κ(yᵀx)`; integral Gram matrix | 1.1, 2.1 |
| `⟨ξ, η⟩_G`, `‖ξ‖²_G` | hermitian Gram form `ξ*G_κη` and its norm | 1.1 |
| `P_κ(ξ)` | polynomial `Σ_i (G_κξ)_i b_i` of a vector | 1.1 |
| `ι_κ`, `Λ_κ(g)` | integral embedding of `W(κ)` into tensors; action on tensors | 1.1 |
| `⟨p, p′⟩_F`, `H(κ)` | Fock pairing `p(∂)p′(0)`; hook number `⟨v_κ, v_κ⟩_F` | 1.1 |
| `𝓗(k)`, `∗`, `𝟙`, `μ` | class functions on all square matrices over `k`; parabolic-induction product; constant function 1; its inverse | 4.1, 4.2 |
| `A\|_n`, `⟨A, A′⟩_n`, `δA` | rank-`n` part; inner product on `GL_n(k)`; block average | 4.1 |
| `β_η`, `C_η` | eigenvalue sum of `η : K → ℂ`; Green's cuspidal function `(β_η·μ) ∗ 𝟙` | 4.1 |
| `ω`, `θ_x`, `τ_P` | injective character of `K^×`; the power of `ω` attached to `x`; Green's function of an irreducible `P` | 4.4 |
| `Ξ_c`, `e_c`, `x_χ` | character of a label `c`; its central idempotent; the unit naming a character `χ` of `k^×` | 4.4, 5.3 |
| `Lift_Z(A, A′)` | lift along `k′/k` by `Z`-combinations of characters of `GL_m(k′) ⋊ Gal(k′/k)` | 5.1 |
| `I₁`, `P_b`, `T⁺` | pro-`p` Iwahori subgroup; parahoric subgroup of a level function; dominant diagonal elements | 6.1 |
| `e_C`, `U_t` | mean over a compact open subgroup `C`; `U_t = e_{I₁}∘ρ(t)` | 6.1 |
| `ξ_θ` | torus character `t ↦ ∏_i θ_i(t_i)\|t_i\|^{N−1−i}` | 6.1 |
| `T_j`, `T_{r,j}`, `P_x` | Hecke operators of `GL_N(𝒪)`; partial Hecke sums; Hecke polynomial of a spherical eigenvector | 6.1 |

## Layer 1: Polynomial representations of products of general linear groups over rings

This layer sets up the model (1.1), proves that the products of minors of one family of fillings are a basis of the
semi-invariants over every ring, with Weyl's character (1.2), and gives the Schur matrices their properties (1.3).

### 1.1 The polynomial model

*Origin:* definitions and conventions.

*Method of the formal proof:* the formal proof makes these definitions; the standard sets of fillings in (d) are chosen
once and for all by a choice function among the sets with the stated properties, and the Schur and Gram matrices are
defined as the unique coefficients of the expansions in (f) and (g).

(a) *Variables and minors.* `R[y]` is the polynomial ring in the variables `y_{(τ,a),i}`, `τ ∈ Φ`, `a ∈ n_τ`, `i ∈ ℕ`;
the row `(τ, a)` has colour `τ`. For an `h`-tuple `I` of rows of one colour, `Δ_I := det(y_{I(s),t})_{s,t<h}` is the
minor on the rows `I` and the first `h` columns (`Δ_I = 1` for `h = 0`).

(b) *Weights and fillings.* A *weight* `κ` for `n` is a family of integers `κ_τ(h) ≥ 0`, `τ ∈ Φ`, `1 ≤ h < N_τ`: the
diagram of `κ` at `τ` has `κ_τ(h)` columns of height `h`. Its row lengths are
`λ_κ(τ, i) := Σ_{i<h<N_τ} κ_τ(h)` (`0 ≤ i < N_τ`) and its number of boxes is `‖κ‖ := Σ_τ Σ_h h·κ_τ(h)`. A *filling* `T`
of `κ` gives each column of height `h` at `τ` an `h`-tuple of rows of colour `τ`, and `Π_T` is the product over the
columns of the minors `Δ` of these tuples.

(c) *Semi-invariants.* `∇_R(κ)` is the `R`-module of `f ∈ R[y]` with `f(yβ) = ∏_{τ,i} β_{τ,ii}^{λ_κ(τ,i)}·f(y)` as an
identity of polynomials in `y` and in the entries of generic upper triangular matrices `β_τ` (indexed by `ℕ`), where
`(yβ)_{(τ,a),j} := Σ_{i≤j} y_{(τ,a),i}·β_{τ,ij}`: one upper triangular matrix for each colour, acting on the columns.
More generally, for a colouring `c` of a finite set of rows and a finitely supported weight `l(τ, i)`, `∇_R(c, l)` is
defined by the same identity. For one colour, `∇_R(κ)` is the module `∇_R(ν)` of
IntegralWeylModulesOfGeneralLinearGroups §0.1 for the `N × (N − 1)` matrix of the variables in the first `N − 1`
columns and `ν_i = λ_κ(i)` (when `N ≥ 2`): the identity for diagonal `β` says that `f` is homogeneous of degree `λ_κ(i)` in the column
`i` (so that no later column occurs), and the identity for unitriangular `β` is the invariance under adding a multiple
of an earlier column to a later one. That roadmap writes `λ` for the row lengths; with `λ = (λ_κ(0), …, λ_κ(N − 1))`,
whose last entry is `0`, `∇_R(κ)` is its dual Weyl lattice `∇_R(λ)` (its Conventions).

(d) *Standard basis.* For each `τ` fix a finite set `B_τ` of fillings of the one-place diagram of `κ_τ` by the rows
`n_τ` such that, over every commutative ring, the products of minors `Π_T`, `T ∈ B_τ`, are linearly independent and
span the span of all products of minors of fillings of `κ_τ`, and such that the character identity 1.2 (c) holds;
such sets exist by 1.2. They need not be the semistandard tableaux. Put `B(κ) := ∏_τ B_τ` and, for `i ∈ B(κ)`,
`b_i := ∏_τ Π_{i_τ}` (each factor in the rows of colour `τ`).

(e) *The Weyl module.* `W_R(κ) := R^{B(κ)}`, read as `Hom_R(∇_R(κ), R)` through the dual basis of `(b_i)`. For an array
`y` over `R` (rows `(τ, a)`, columns `ℕ`), `ev_y := (b_i(y))_{i∈B(κ)} ∈ W_R(κ)`.

(f) *Schur matrices.* Let `n′` be a second family with `N_τ ≤ N′_τ`, and `κ` a weight for `n′` that *fits* `n`:
`κ_τ(h) = 0` for `N_τ < h < N′_τ`. Put `d_τ := κ_τ(N_τ)` if `N_τ < N′_τ` and `d_τ := 0` otherwise. For
`z = (z_τ)`, `z_τ ∈ M_{n′_τ×n_τ}(R)`, let `zy` be the array `(zy)_{(τ,b),i} := Σ_{a∈n_τ} z_τ(b, a)·y_{(τ,a),i}`, and
`y_τ` the square block of `y` in the rows `n_τ` and the columns `0, …, N_τ − 1`. The *Schur matrix*
`S_κ(z) ∈ M_{B′(κ)×B(κ)}(R)` is the matrix with
`b′_i(zy) = Σ_j S_κ(z)_{ij}·b_j(y)·∏_τ det(y_τ)^{d_τ}` for every `i`, where `b′` is the basis of (d) for `n′` and `κ`,
and `b` that for `n` and the restriction of `κ` to the heights `< N_τ` (its existence and uniqueness are 1.3 (a)). For
`n′ = n` and `e ∈ ℤ^Φ`, `ρ_{κ,e}(g) := ∏_τ det(g_τ)^{e_τ}·S_κ(g)` for `g ∈ ∏_τ GL(n_τ, R)` is the *representation of
weight `(κ, e)`*, of highest weight `λ_κ + e`.

(g) *Kernel and Gram matrix.* `v_κ := ∏_τ ∏_{1≤h<N_τ} Δ_{τ,h}^{κ_τ(h)}`, with `Δ_{τ,h}` the leading `h × h` minor of the
rows of colour `τ` in the fixed numbering, and
`K_κ(x, y) := ∏_τ ∏_{1≤h<N_τ} det(Σ_{a∈n_τ} y_{(τ,a),s}·x_{(τ,a),t})_{s,t<h}^{κ_τ(h)} ∈ ℤ[x, y]`, that is `v_κ(yᵀx)`.
The *Gram matrix* `G_κ ∈ M_{B(κ)}(ℤ)` is the matrix of coefficients in `K_κ(x, y) = Σ_{i,j} (G_κ)_{ij}·b_i(x)·b_j(y)`
(existence and uniqueness: 2.1 (b)). For complex vectors, `⟨ξ, η⟩_G := ξ*G_κη` and `‖ξ‖²_G := ⟨ξ, ξ⟩_G`. The
*polynomial* of `ξ ∈ W_R(κ)` is `P_κ(ξ) := Σ_i (G_κξ)_i·b_i ∈ ∇_R(κ)`.

(h) *Tensors.* `CF(κ)` is the set of fillings of `κ` whose columns are strictly increasing sequences of row numbers;
it indexes the basis tensors of `⊗_{columns} Λ^h(R^{n_τ})`. The *tensor embedding* `ι_κ ∈ M_{CF(κ)×B(κ)}(ℤ)` has as row
`T` the coordinates of `Π_T` in the basis `(b_i)`. For square `g_τ`, `Λ_κ(g) ∈ M_{CF(κ)}(R)` has entry at `(T, T′)` the
product over the columns of the minors of `g_τ` with rows from `T` and columns from `T′`.

(i) *Fock pairing and hook number.* For polynomials `p = Σ_α p_α y^α`, `p′ = Σ_α p′_α y^α`,
`⟨p, p′⟩_F := Σ_α α!·p_α·p′_α` (`α! = ∏ α_x!`), which is `p(∂)p′` at `0`. The *hook number* is
`H(κ) := ⟨v_κ, v_κ⟩_F ∈ ℤ`. This pairing is bilinear over every `R`; the Fischer form of
IntegralWeylModulesOfGeneralLinearGroups (Conventions), which is conjugate-linear in the first argument, is
`(p, p′) ↦ ⟨p̄, p′⟩_F` on complex polynomials, and the two agree on real ones. For one colour, `v_κ` is the
highest-weight vector `v_λ` of that roadmap, `λ` the row lengths of `κ`, and `H(κ)` is its `⟨v_λ, v_λ⟩_F`; for several
colours `H(κ)` is the product of these numbers over `τ`, the pairing being multiplicative on products of polynomials
in disjoint sets of variables.

*Needs:* 1.2 (b), (c) (existence of the standard sets of (d)); Mathlib `MvPolynomial`, `Matrix.det`.

[ShortProof], `Lib/GLn/SchurModule/Basic` (`New.MatrixPoly`, `New.minor`, `New.tableauPoly`, `New.diagramWeight`,
`New.nabla`, `New.IsTableauBasis`, `New.BasisTableau`, `New.WeylIndexFamily`, `New.nablaBasis`, `New.weylEval`,
`New.schurDetExp`, `New.FitsRanks`, `New.schur`, `New.highestPoly`, `New.weylKernel`, `New.weylGram`, `New.toPoly`,
`New.fockPairing`, `New.hookNumber`); `Lib/GLn/SchurModule/SchurMatrix` (`New.weylRep`);
`Lib/GLn/SchurModule/TensorModel` (`New.ColumnFilling`, `New.fillingPoly`, `New.fillingMatrix`, `New.minorsMatrix`)

### 1.2 A basis of products of minors over every ring, and its character

*Origin:* adapted from De Concini, Eisenbud and Procesi (1980), the standard bideterminants of a given shape form a
basis of the span of the bideterminants on initial columns, over any commutative ring: here for rows of several
colours at once, with the span identified with the module of semi-invariants over every commutative ring (zero
divisors allowed), for some family of fillings that is the same over every ring and is not identified with the
semistandard tableaux, and with Weyl's quotient of alternants for one colour.

*Method of the formal proof:* induction on the number of rows. One row `x` is singled out, polynomials are written as
polynomials in the variables of `x` over the polynomial ring in the other rows, and exponents are compared
lexicographically from the highest column down. The leading exponent of a semi-invariant in the row `x` is an
interlacing exponent `γ` (`γ_i ≤ l_i − l_{i+1}` for the weight `l` at the colour of `x`), and its leading coefficient
is a semi-invariant of the other rows of the weight lowered by `γ`. Conversely, every filling of the other rows for the
lowered weight can be bordered by the row `x` so that its product of minors has leading term `y_x^γ` times the old
product, with coefficient `1`. The bordered families of the smaller problems, over all `γ`, give independence (distinct
leading terms with unit coefficients) and spanning (subtract and induct), over every ring at once. The character
identity follows from the same recursion and the expansion of the alternant along the row `x`.

Let `m` be a finite set of rows with a colouring `c : m → Φ`, and `J` a finite set of columns, the column `j` of colour
`τ_j` and height `h_j ≥ 0`; let `l(τ, i) := #{j : τ_j = τ, h_j > i}`. A filling `I` gives each column `j` an
`h_j`-tuple of rows of colour `τ_j`, and `Π_I := ∏_j Δ_{I_j}`.

(a) Every `Π_I` lies in `∇_R(c, l)`, for every `R`.

(b) There are a finite set `X` and fillings `I_x`, `x ∈ X`, such that for every commutative ring `R` the polynomials
`Π_{I_x}` are linearly independent over `R` and span `∇_R(c, l)`.

(c) If there is only one colour, `M = |m|`, every `h_j ≤ M`, and `e : {0, …, M − 1} → m` is a bijection, then for every
`u ∈ ℂ^m`:
`(Σ_{x∈X} ∏_j ∏_{s<h_j} u_{I_x(j,s)})·det(u_{e(a)}^{b})_{a,b<M} = det(u_{e(a)}^{l(M−1−b)+b})_{a,b<M}`.

(d) Consequently, with the standard sets of 1.1 (d): for every `R` and every `e ∈ ℕ^Φ`, the products
`b_i·∏_τ det(y_τ)^{e_τ}`, `i ∈ B(κ)`, form an `R`-basis of the semi-invariants of the weight `κ` with `e_τ` further
columns of height `N_τ` at each `τ`; for `e = 0`, `(b_i)` is a basis of `∇_R(κ)`. If an additive subgroup `A ⊂ R`
contains all coefficients of `Σ_j x_j·b_j·∏_τ det(y_τ)^{e_τ}`, it contains all `x_j`.

The library has the case of a single column height, for the algebra generated by the maximal minors, over any
commutative ring (`TauCeti.pluckerBasisSubalgebra`), to build on; it has neither general column heights over a ring
nor the identification of the span with the semi-invariants. IntegralWeylModulesOfGeneralLinearGroups §0.1 states
(a) and (b) for one colour over integral domains, for the semistandard family.

*Needs:* 1.1 (a)–(c) (minors, weights, semi-invariants), and for (d) 1.1 (d)–(f) (the standard sets and the blocks
`y_τ`); Mathlib `MvPolynomial`, `MonomialOrder`, `Matrix.det`.

[ShortProof], `Lib/GLn/SchurModule/MinorBasis` (`New.GL.minorProduct_mem_nabla`, `New.GL.exists_bordering`,
`New.GL.degree_rowExpansion_mem_interlacing`, `New.GL.HasLeadingTerm.leadingCoeff_mem_nabla`,
`New.GL.IsStdMinorFamily`, `New.GL.exists_isStdMinorFamily`); `Lib/GLn/SchurModule/SchurMatrix`
(`New.exists_isTableauBasis`, `New.linearIndependent_nablaBasis`, `New.nabla_le_span_nablaBasis_mul_detPow`,
`New.range_nablaCombination`, `New.GL.linearIndependent_nablaBasis_mul_detPow`, `New.GL.coord_mem_of_coeff_mem`)

### 1.3 Schur matrices

*Origin:* adapted from the published theory of the polynomial representations of general linear groups and of their
characters as Schur polynomials: here in the model of 1.1, for rectangular matrices and products over places, over
every commutative ring.

*Method of the formal proof:* `b′_i(zy)` is a semi-invariant of the weight of `κ` for `n` with `d_τ` further full
columns, so 1.2 (d) gives the coefficients and their uniqueness; the expansion is defined over the polynomial ring in
the entries of `z` with integer coefficients, which gives base change. Multiplicativity is substitution twice. Each
`b_j` is a weight vector, so diagonal matrices act diagonally, and the trace is the product over the places of the
sums of 1.2 (c). For one row, the basis elements are monomials in the first column.

Let `n`, `n′` and `κ` be as in 1.1 (f).

(a) For every `z`, the coefficients `S_κ(z)` exist and are unique. Their entries are polynomials with integer
coefficients in the entries of `z`, the same over every ring; so `S_κ(φ(z)) = φ(S_κ(z))` for every ring homomorphism
`φ` applied entrywise. For `n′ = n`, `S_κ(1) = 1`, and `S_κ(g)` is continuous in `g` over a topological ring.

(b) `S_κ(gz) = S_κ(g)·S_κ(z)` for square `g_τ` with rows `n′_τ`; `S_κ(zg) = ∏_τ det(g_τ)^{d_τ}·S_κ(z)·S_κ(g)` for
square `g_τ` with rows `n_τ`; `S_κ(tz) = ∏_τ t_τ^{‖κ_τ‖}·S_κ(z)` for scalars `t_τ`, `‖κ_τ‖` the number of boxes at
`τ`; and each entry of `S_κ(z)` is the product over `τ` of the entries of the one-place Schur matrices of `z_τ`. In
particular `ρ_{κ,e}` is a homomorphism from `∏_τ GL(n_τ, R)` to the invertible matrices.

(c) For every array `y` over `R`: `∏_τ det(y_τ)^{d_τ}·S_κ(z)·ev_y = ev_{zy}`.

(d) For diagonal matrices, `S_κ(diag(x))` is diagonal with entry `∏_τ ∏_{a∈n_τ} x_{τ,a}^{w_{τ,a}(i)}` at `i`,
`w_{τ,a}(i)` the number of entries of `i_τ` equal to `a`. For `x_τ ∈ ℂ^{n_τ}` and bijections
`e_τ : {0, …, N_τ − 1} → n_τ`:
`tr S_κ(diag(x))·∏_τ det(x_{τ,e_τ(a)}^{b})_{a,b<N_τ} = ∏_τ det(x_{τ,e_τ(a)}^{λ_κ(τ,N_τ−1−b)+b})_{a,b<N_τ}`.

(e) If `R` is a field with an ultrametric absolute value and every entry of `z` has absolute value at most `1`, then
`max_i |(S_κ(z)ξ)_i| ≤ max_j |ξ_j|` for every `ξ`.

(f) For one place, `n′ = n`, `N > 1` and the one-row diagram (`κ(1) = a`, `κ(h) = 0` for `1 < h < N`), there is a bijection
`φ` from `B(κ)` to the exponent vectors `α ∈ ℕ^n` with `Σ_s α_s = a` such that, over `ℂ`, `S_κ(z)_{ij}` is the
coefficient of `X^{φ(j)}` in `∏_s (Σ_t z_{st}X_t)^{φ(i)_s}`: `S_κ` is the `a`-th symmetric power.

The formal proof states (e) for families with the same rows at every place, and (f) over `ℂ`. The library states the
character formula of (d) for its own model of the Weyl modules of one `GL_n` in characteristic `0`
(`TauCeti.diagramSchurPoly_mul_alternant` with `TauCeti.char_weylRepOfShape_diagonal_eq_eval_diagramSchurPoly`); a
comparison of the two models is not in the library.

*Needs:* 1.1, 1.2; Mathlib `Matrix.det`, `Matrix.vandermonde`.

[ShortProof], `Lib/GLn/SchurModule/SchurMatrix` (`New.sum_schur_smul_nablaBasis`, `New.GL.schur_eq_of_expansion`,
`New.schur_map`, `New.schur_one`, `New.schur_mul_left`, `New.schur_mul_right`, `New.schur_smul`,
`New.schur_apply_eq_prod`, `New.schur_mulVec_weylEval`, `New.schur_diagonal`, `New.weyl_character`,
`New.exists_equiv_schur_one_row_eq_symPowMatrix`, `New.continuous_schur`, `New.weylRep`); `Lib/GLn/Dual`
(`New.Rows.norm_schur_mulVec_le`)

## Layer 2: The Gram matrix over the integers and the hook number

This layer puts the integral Gram matrix on the Weyl module (2.1), shows that the Fock pairing inverts it up to the
hook number (2.2), proves the adjoint formula, the norm bound by singular values and the invariance of the Gram form
(2.3), Schur's lemma, irreducibility and Schur orthogonality on the compact group (2.4), and treats multiplication of
semi-invariants (2.5).

### 2.1 The Gram matrix

*Origin:* adapted from the published theory of the contravariant form on Weyl modules (positive definite, invariant
under the unitary group, making `g` and its transpose adjoint): here on the integral lattice `W_ℤ(κ)` with its basis of
products of minors, through its embedding into the integral tensors, for products over places and rectangular
matrices.

*Method of the formal proof:* the Cauchy–Binet formula expands `K_κ(x, y)` as the sum over `T ∈ CF(κ)` of
`Π_T(x)·Π_T(y)`, and each `Π_T` is expanded in the basis, which gives `G_κ = ι_κᵀι_κ`. The tensor embedding has an
integral left inverse because `∇_ℤ(κ)` is free and spanned by the `Π_T`; so `G_κ` is positive definite. Adjointness
of `g` and `gᵀ` is inherited from the tensors, where it is the transpose of a matrix of minors. The other clauses are
read off the kernel, after reduction to evaluation vectors, which span over an infinite domain.

Let `κ` be a weight for `n`.

(a) `ι_κ·S_κ(g) = Λ_κ(g)·ι_κ` for every family of square matrices `g_τ` over `R`, and the `Π_T`, `T ∈ CF(κ)`, span
`∇_R(κ)`.

(b) `G_κ` exists, is unique, and `G_κ = ι_κᵀι_κ`; it is symmetric and positive definite.

(c) `G_κ·S_κ(g) = S_κ(gᵀ)ᵀ·G_κ` for every family of square matrices `g_τ` over `R`.

(d) `P_κ(ev_y) = K_κ(·, y)` for every array `y` over `R`.

(e) Let `R` be an integral domain of characteristic `0`. Then `P_κ` is injective, and for `n ⊂ n′`, `κ` fitting `n`,
`z_τ ∈ M_{n′_τ×n_τ}(R)` and `ξ ∈ W_R(κ)`: `P_κ(S_κ(z)ξ)(y′) = (P_κ(ξ)·∏_τ det(y_τ)^{d_τ})(zᵀy′)` (the left side for
`n′`, the right side substituted by `zᵀ`). Over `ℂ`, `P_κ` is onto `∇_ℂ(κ)`.

*Needs:* 1.1, 1.2, 1.3; IntegralWeylModulesOfGeneralLinearGroups §0.1 (third and fourth items: `∇_ℤ` is free and
spanned by the bideterminants of the column-strict fillings, which gives the integral left inverse of `ι_κ`);
Mathlib `Matrix.PosDef`.

[ShortProof], `Lib/GLn/SchurModule/TensorModel` (`New.fillingMatrixOver_mul_schur`, `New.span_fillingPoly`,
`New.exists_fillingMatrix_leftInverse`); `Lib/GLn/SchurModule/Basic` (`New.sum_weylGram_smul_eq_weylKernel_of_exists`);
`Lib/GLn/SchurModule/WeylKernel` (`New.toPoly_weylEval`, `New.fillingMatrix_transpose_mul_self`,
`New.weylGram_isSymm`, `New.weylGramOver_posDef`, `New.weylGramOver_mul_schur`, `New.toPoly_schur`,
`New.toPoly_injective`, `New.range_toPoly`)

### 2.2 The Fock pairing and the hook number as a denominator

*Origin:* adapted from Jantzen (2003), II.8, the duality of the Weyl and dual Weyl lattices for the contravariant
form, as read on Gram determinants in IntegralWeylModulesOfGeneralLinearGroups §3.2 (b): here the Gram matrix of
`W_ℤ(κ)` times the matrix of Fock pairings of the basis of `∇_ℤ(κ)` is the hook number, with an explicit bound for the
hook number in place of its value.

*Method of the formal proof:* the two pairings of a vector `ξ` with a polynomial, `ξ(Σ c_k b_k) = Σ ξ_k c_k` and the
Fock pairing with `P_κ(ξ)`, are both invariant in the appropriate sense, so by Schur's lemma (2.4 (a)) they are
proportional; the factor is computed at the highest vector, where it is `⟨v_κ, v_κ⟩_F`. Positivity holds because
`v_κ` is a nonzero integral polynomial; the bound comes from expanding each minor into at most `h!` monomials and
bounding the Fock pairing of monomials by factorials. The tight frame is `H(κ)` times the orthogonal projections of the
basis tensors.

Let `κ` be a weight for `n` and `H := H(κ)`.

(a) `G_κ·(⟨b_i, b_j⟩_F)_{i,j} = H·1`. Equivalently, over every `R`, `⟨P_κ(ξ), b_k⟩_F = H·ξ_k` for all `k`, and
`⟨P_κ(ξ), P_κ(η)⟩_F = H·ξᵀG_κη`.

(b) `0 < H`, and `H ≤ (L^L)^3` whenever `‖κ‖ ≤ L`.

(c) *Denominators.* For every `R` and every `f ∈ ∇_R(κ)` there is `ζ ∈ W_R(κ)` with `P_κ(ζ) = H·f`. For every integral
tensor `v ∈ ℤ^{CF(κ)}` there is `η ∈ W_ℤ(κ)` with `G_κη = H·ι_κᵀv`.

(d) *A tight frame.* There are integral vectors `η_T ∈ W_ℤ(κ)`, `T ∈ CF(κ)`, with `Σ_T ⟨η_T, ξ⟩_G·η_T = H²·ξ` for every
`ξ ∈ ℂ^{B(κ)}` and `‖η_T‖²_G ≤ H²` for every `T`.

(e) *One row.* If `N_τ > 1` and `κ_τ(h) = 0` for `1 < h < N_τ` at every `τ`, then `H = ∏_τ κ_τ(1)!`; and over a field
`R` of characteristic `0`, for every subring `A ⊂ R`, a vector `ξ` has all coordinates in `A` if and only if `P_κ(ξ)`
lies in the `A`-span of the polynomials `∏_τ (|α_τ|!/α_τ!)·u_τ^{α_τ}`, `|α_τ| = κ_τ(1)`, where `u_τ` is the first
column of the variables of colour `τ`.

By IntegralWeylModulesOfGeneralLinearGroups §3.1 (for one colour, §3.2 (a)), `H` is the product of the hook lengths of
the diagrams; the formal proof uses only the bound (b).

*Relation to IntegralWeylModulesOfGeneralLinearGroups.* Let there be one colour and `λ` the row lengths of `κ`, a
dominant weight of `GL_N` with last entry `0`. By (a), `P_κ` carries the Gram form `⟨·,·⟩_G` on `W_ℂ(κ)` to the
normalised form `⟨·,·⟩_λ = ⟨·,·⟩_F/⟨v_λ, v_λ⟩_F` of that roadmap on `∇_ℂ(λ)`, and `⟨P_κ(ξ), f⟩_λ = ξ(f)` for
`ξ ∈ W_ℚ(κ)` and `f ∈ ∇_ℚ(λ)`; so `P_κ(W_ℤ(κ))` is the dual of `∇_ℤ(λ)` for `⟨·,·⟩_λ`, which is the Weyl lattice
`Δ_ℤ(λ)` by the duality recorded in its Conventions. By 2.1 (e), `P_κ` carries `S_κ(g)` to the action
`f ↦ f(gᵀ·)` of that roadmap, and `ρ_{κ,e}(g)` to its action for the weight `λ + e·(1, …, 1)`. In these terms
(a) is the duality of `Δ_ℤ(λ)` and `∇_ℤ(λ)` in coordinates, and (c) says `H·∇_R(λ) ⊂ Δ_R(λ)`, a bound for the same
inclusion that IntegralWeylModulesOfGeneralLinearGroups §0.3 bounds prime by prime. The sections of this roadmap use
the coordinates of 1.1 and do not use this identification.

*Needs:* 1.1, 1.2, 2.1, 2.4 (a).

[ShortProof], `Lib/GLn/SchurModule/GramMatrix` (`New.weylGram_mul_fockPairing`, `New.fockPairing_toPoly_nablaBasis`,
`New.fockPairing_toPoly_toPoly`, `New.GL.exists_toPoly_eq_hookNumber_smul`,
`New.exists_weylGram_mulVec_eq_hookNumber_smul`, `New.GL.exists_tightFrame`, `New.hookNumber_one_row`,
`New.toPoly_mem_span_multinomialMonomial_iff`); `Lib/GLn/SchurModule/WeylKernel` (`New.hookNumber_pos`,
`New.hookNumber_le`)

### 2.3 The adjoint formula, the norm bound by singular values, and invariance

*Origin:* adapted from the published theory of the contravariant form on Weyl modules (unitary invariance): here the
adjoint of a Schur matrix of rectangular matrices for the integral Gram forms, a bound of its operator norm by the
singular values, and invariance of the Gram form under rational points of a definite unitary group after any
embedding of the CM field.

*Method of the formal proof:* the adjoint formula is computed on tensors, where the Schur matrix becomes a matrix of
minors and the Cauchy–Binet formula applies to `w*z`, the full columns giving the determinant factor. For the norm
bound, the adjoint formula reduces `‖S_κ(z)ξ‖²` to the form of `S_κ(z*z)`; writing `z*z = UDU*` with `U` unitary and `D`
diagonal with entries `ρ_{τ,i} ≥ 0` (sorted), on tensors a column of height `h` contributes at most
`ρ_{τ,0}⋯ρ_{τ,h−1}`, and the columns of full height give powers of `det(z*z)`. Invariance under `U(n)` is the adjoint
formula with `w = z` unitary; for a CM field every embedding commutes with complex conjugation, so the images of a
rational unitary matrix are unitary.

Let `n ⊂ n′` and `κ` fit as in 1.1 (f); `G` and `G′` are the Gram matrices for `n` and for `n′`.

(a) For `w_τ, z_τ ∈ M_{n′_τ×n_τ}(ℂ)`: `S_κ(w)*·G′·S_κ(z) = ∏_τ det(w_τ*z_τ)^{d_τ}·G·S_κ(w*z)`, where
`(w*z)_τ = w_τ*z_τ`.

(b) For every `z` there are numbers `ρ_{τ,i} ≥ 0`, `0 ≤ i < N_τ`, with `Σ_i ρ_{τ,i} ≤ Σ_{a,b} |z_τ(a, b)|²` at every `τ`,
such that `‖S_κ(z)ξ‖²_{G′} ≤ ∏_τ ∏_{i<N_τ} ρ_{τ,i}^{λ′(τ,i)}·‖ξ‖²_G` for every `ξ ∈ ℂ^{B(κ)}`, where
`λ′(τ, i) = Σ_{i<h<N′_τ} κ_τ(h)` are the row lengths of `κ` as a weight for `n′`.

(c) For `n′ = n`, every `e ∈ ℤ^Φ` and every `u ∈ ∏_τ U(n_τ)`, `S_κ(u)` and `ρ_{κ,e}(ū)` preserve `⟨·,·⟩_G`.

(d) Let `E` be a CM field with complex conjugation `c`, `n_τ = n` for all `τ`, and `γ ∈ GL_n(E)` with `c(γ)ᵀγ = 1`.
For every family `(σ_τ)_{τ∈Φ}` of ring homomorphisms `E → ℂ`, the matrices `σ_τ(γ)` are unitary, so `ρ_{κ,e}((σ_τ(γ))_τ)`
preserves `⟨·,·⟩_G`. In particular, if `Φ` is a set of embeddings `E → ℂ` and `γ` acts on `ℂ^{B(κ)}` by
`ρ_{κ,e}((τ(c(γ)))_τ)`, as in AdelicUnitaryGroupsAndAlgebraicModularForms §6.1 for the standard space, then for every
ring endomorphism `σ` of `ℂ`, applied to the coordinates, `⟨σ(γ·u), σ(γ·v)⟩_G = ⟨σ(u), σ(v)⟩_G`.

The formal proof proves the last sentence of (d), for `Φ` the set of infinite places of `E` with the embeddings of a
CM type, that is, the second sentence for the families `σ_τ = σ∘τ∘c` with `σ` a ring endomorphism of `ℂ`. The second
sentence in general follows from (c), because every ring homomorphism `E → ℂ` commutes with complex conjugation.

The library has a positive definite contravariant hermitian form on its own model of the Weyl modules of one
`GL_n` over `ℝ` or `ℂ` (`TauCeti.weylForm`, `TauCeti.weylForm_apply_self_pos`, `TauCeti.weylForm_rationalWeylRep_apply`);
the integral Gram matrix, the formula (a) for rectangular matrices and the bound (b) are not there.

*Needs:* 1.3, 2.1; AdelicUnitaryGroupsAndAlgebraicModularForms §6.1 (action of rational unitary matrices); Mathlib
`Matrix.IsHermitian` (spectral theorem, for the singular values).

[ShortProof], `Lib/GLn/SchurModule/SchurNorm` (`New.GL.schur_conjTranspose_weylGram_schur`, `New.weylNormSq_schur_le`,
`New.gramForm_conjWeylRep`, `New.map_weightRep`, `New.gramForm_map_weightRep`)

### 2.4 Schur's lemma, irreducibility, Schur orthogonality and the highest coefficient

*Origin:* adapted from the published theory of the irreducibility of the Weyl modules of `GL_n(ℂ)` under the unitary
group (the unitarian trick) and of the orthogonality relations of Schur on compact groups: here for the Schur matrices
of 1.1 on products of unitary groups, with the highest coefficient as a product of principal minors, and the
polarisation of products of determinants that irreducibility gives.

*Method of the formal proof:* the evaluation vector at the identity frame spans the highest weight space; a matrix that
commutes with the action preserves that space, so it multiplies the vector by a scalar, hence also its translates,
which span; commuting with `S_κ(u)` for unitary `u` is a polynomial condition, and the unitary groups are Zariski dense
in the general linear groups. Schur orthogonality follows by averaging a matrix over the compact group and applying
Schur's lemma, and irreducibility from Schur orthogonality. The highest coefficient is the kernel evaluated at a
permutation array. Polarisation applies irreducibility to the semi-invariant `∏ det(η_{τ,k}Y_τ)`.

(a) *Schur's lemma.* A complex matrix that commutes with `S_κ(u)` for every `u ∈ ∏_τ U(n_τ)` is a scalar.

From here on `n_τ = n` for all `τ`, and `ρ(u) := ρ_{κ,e}(ū)` for `u ∈ U(n)^Φ` (`ū` the complex conjugate).

(b) *Irreducibility.* For every `e ∈ ℤ^Φ` the translates `ρ(u)v`, `u ∈ U(n)^Φ`, of any nonzero `v ∈ ℂ^{B(κ)}` span
`ℂ^{B(κ)}`. Equivalently, for every nonzero `f ∈ ∇_ℂ(κ)` the polynomials `y ↦ f(uᵀy)`, `u ∈ U(n)^Φ`, span `∇_ℂ(κ)`.

(c) *Schur orthogonality.* For every linear form `ℓ` on `ℂ^{B(κ)}` and all `a, b, c ∈ ℂ^{B(κ)}`:
`∫_{U(n)^Φ} ℓ(ρ(u)c)·⟨a, ρ(u^{−1})b⟩_G du = |B(κ)|^{−1}·⟨a, c⟩_G·ℓ(b)`, `du` the Haar probability measure.

(d) *The highest coefficient.* Let `p_τ : n_τ → {0, …, N_τ − 1}` be bijections, `y_p` the array with `(y_p)_{(τ,a),i} = 1`
if `i = p_τ(a)` and `0` otherwise, and `v := ev_{y_p}`. Then `⟨v, v⟩_G = 1`, and for `g ∈ ∏_τ GL(n_τ, ℂ)`,
`vᵀ·G_κ·ρ_{κ,e}(g)·v = ∏_τ m_{w_τ}(g_τ)` with `w_τ(a) := e_τ + λ_κ(τ, p_τ(a))`, where `m_w(g)` is the product over
`t ∈ ℤ` of the principal minors of `g` on `{a : w_a ≥ t}`, each factor with `t ≤ 0` divided by `det g`, as in
HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (a). Here (d) holds for arbitrary families `n_τ`.

(e) *Polarisation.* Let `p` be a finite set with `|p| < |n|`, `r : p → n` injective, `E_r ∈ M_{p×n}(ℂ)` the matrix with
rows the standard basis vectors at `r(k)`, and `η_{τ,k} ∈ M_{p×n}(ℂ)` for `k` in finite sets `Ω_τ`. There is a finitely
supported function `c` on `U(n)^Φ` such that for every commutative `ℂ`-algebra `S` and all `Y_τ ∈ M_{n×p}(S)`:
`∏_τ ∏_{k∈Ω_τ} det(η_{τ,k}Y_τ) = Σ_u c(u)·∏_τ det(E_r u_τᵀ Y_τ)^{|Ω_τ|}`.

The library has Schur orthogonality for continuous representations of compact groups
(`ContRepresentation.schur_orthogonality_self`) and irreducibility of its own Weyl modules under `U(n)`
(`TauCeti.IsRationalRep.isIrreducible_comp_toUnits_iff` with `TauCeti.isIrreducible_rationalWeylRep`), to build on;
(c) follows from the first once the Schur matrices are seen as a continuous representation for the Haar probability
measure. The corresponding roadmap sections are RepresentationTheory/CompactGroups §4.1 (Schur orthogonality for one
irreducible unitary representation) and RepresentationTheory/ClassicalGroups §3.3 (the rational irreducible
representations of `GL_n` by highest weight); (a)–(c) would follow from them, for a family by the external tensor
product over `τ`, given a comparison of the model of 1.1 with the Weyl modules of the library, which no roadmap
states (see 1.3).

*Needs:* 1.3, 2.1, 2.3 (c); HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (a) (products of principal minors); Mathlib
`MeasureTheory.Measure.haar`.

[ShortProof], `Lib/GLn/SchurModule/WeylKernel` (`New.GL.zariski_dense_unitary`, `New.mem_range_scalar_of_commute_schur`);
`Lib/GLn/SchurModule/SchurOrthogonality` (`New.conjWeylRep`, `New.gramForm`, `New.schur_orthogonality`,
`New.weylRep_coeff_eq_prod_weightMinors`, `New.gramForm_highestVector_self`); `Lib/GLn/SchurModule/GramMatrix`
(`New.GL.weylNormSq_weylEval_permArray`); `Lib/GLn/SchurModule/Polarisation` (`New.span_conjWeylRep_eq_top`,
`New.mem_span_rowSubst_unitary`, `New.exists_pairedDetProd_eq_sum_unitary`)

### 2.5 Multiplication of semi-invariants

*Origin:* adapted from the published theory of the Cartan component `V(λ + μ) ⊂ V(λ) ⊗ V(μ)`: here as an integral
isometric embedding of Weyl lattices, dual to the multiplication of semi-invariants, with an integral left inverse.

*Method of the formal proof:* the product of two semi-invariants is a semi-invariant of the sum of the weights, so the
matrix `C` is defined over `ℤ`; it carries an evaluation vector to the tensor product of two, and isometry and
equivariance are checked on evaluation vectors through the factorisation `K_{κ+κ′} = K_κ·K_{κ′}`. The left inverse comes
from splitting the columns of a standard filling of `κ + κ′` into those of `κ` and of `κ′`. The inequality is
Cauchy–Schwarz for the positive form `G_κ ⊗ G_{κ′}`.

Let `κ`, `κ′` be weights for `n`, and `C ∈ M_{(B(κ)×B(κ′))×B(κ+κ′)}(ℤ)` the matrix whose row `(p, p′)` holds the
coordinates of `b_p·b_{p′}` in the basis for `κ + κ′`.

(a) `C·ev_y = ev_y ⊗ ev_y` (for `κ + κ′` on the left, `κ` and `κ′` on the right), for every array `y`.

(b) Over every infinite integral domain: `Cᵀ(G_κ ⊗ G_{κ′})C = G_{κ+κ′}`, and `(S_κ(g) ⊗ S_{κ′}(g))·C = C·S_{κ+κ′}(g)` for
square `g`.

(c) `C` has a left inverse with integer entries.

(d) If `ξ`, `η`, `ζ` are complex vectors with `P_{κ+κ′}(ζ) = P_κ(ξ)·P_{κ′}(η)`, then `‖ζ‖²_G ≤ ‖ξ‖²_G·‖η‖²_G`.

*Needs:* 1.2, 1.3, 2.1.

[ShortProof], `Lib/GLn/SchurModule/GramMatrix` (`New.GL.comulMatrix`, `New.GL.comulMatrix_mulVec_weylEval`,
`New.GL.comulMatrix_isometry`, `New.GL.comulMatrix_equivariant`, `New.GL.hasLeftInv_comulMatrix`,
`New.weylNormSq_le_mul_of_toPoly_eq`)

## Layer 3: Duals, mixed weights and branching

This layer identifies the dual of a Weyl lattice by complementary minors and builds the invariant pairing of dual
weights (3.1), embeds the representation of a mixed weight into a tensor product with a multiplicative Cartan product
(3.2), and constructs integral branching maps (3.3, 3.4).

### 3.1 Duality by complementary minors, and the pairing of dual weights

*Origin:* adapted from the published theory of duals of irreducible representations (the dual of the representation
of highest weight `λ` has highest weight `−w₀λ`), realised on complementary minors by Jacobi's identity: here as a
unimodular, isometric, equivariant integer matrix between the Weyl lattices of complementary diagrams, with the hook
number of the dual weight as a denominator and an integral invariant pairing of dual weights.

*Method of the formal proof:* the Hodge star in each column, which replaces a set of rows by its complement with a
sign, is a signed bijection of basis tensors; Jacobi's identity for the complementary minors of an invertible matrix
shows that it intertwines `g` with `g^{−ᵀ}` up to a power of the determinant, and restricted to the Weyl lattices
inside the tensors (2.1) it gives `J`, unimodular and isometric. The pairing is `A := G_{κ′}J`; its invariance follows
from 2.1 (c) and the equivariance of `J`, and its left inverse up to `H(κ′)` from 2.2 (a).

Let `κ`, `κ′` be weights for `n` with `κ′_τ(h) = κ_τ(N_τ − h)` for `1 ≤ h < N_τ`, and `D_τ := Σ_{1≤h<N_τ} κ_τ(h)`. Let
`p_τ : n_τ → {0, …, N_τ − 1}` be bijections, `p′_τ := N_τ − 1 − p_τ`, and `y_p`, `y_{p′}` the arrays of 2.4 (d).

(a) There is `J ∈ M_{B(κ)×B(κ′)}(ℤ)` with an inverse with integer entries such that `JᵀG_κJ = G_{κ′}` and, over every
field `R` of characteristic `0`, `J·ev_{y_p} = ev_{y_{p′}}` (for `κ′` on the left, `κ` on the right) and
`S_κ(g^{−ᵀ})·J = J·ρ_{κ′,−D}(g)` for every `g ∈ ∏_τ GL(n_τ, R)`.

(b) There is `C ∈ M_{B(κ)}(ℤ)` with `G_κC = H(κ′)·1`; for every `R` and `f ∈ ∇_R(κ)` there is `ζ ∈ W_R(κ)` with
`P_κ(ζ) = H(κ′)·f`.

(c) Let `n_τ = n` for all `τ`, `e, e′ ∈ ℤ^Φ` with `e_τ + e′_τ = −D_τ` (so that `(κ′, e′)` is the dual of `(κ, e)`). There
is `A ∈ M_{B(κ′)×B(κ)}(ℤ)` such that: (i) `(ρ_{κ′,e′}(g)v′)ᵀ·A·ρ_{κ,e}(g)v = v′ᵀAv` for all vectors and all
`g ∈ GL_n(R)^Φ`, over every field `R` of characteristic `0`; (ii) `C′A = H(κ′)·1` for some `C′` with integer entries;
(iii) for every `v ∈ ℂ^{B(κ)}` there is `v′ ∈ ℂ^{B(κ′)}` with `‖v′‖_G = ‖v‖_G` and `uᵀAv = ⟨v′, u⟩_G` for every `u`.

The formal proof states (c) for `Φ` the set of infinite places of a CM field (which enters only as an index set) and
`N ≥ 1`, with the duality of `(κ, e)` and `(κ′, e′)` expressed through their Harish-Chandra parameters (twice the
parameter of one is minus that of the other), together with a clause that evaluates algebraic modular forms of weight
`(κ′, e′)` through this pairing, which is the subject of AdelicUnitaryGroupsAndAlgebraicModularForms §6.1
(forms through a highest vector).

*Needs:* 1.3, 2.1, 2.2; Tau Ceti `Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`
(Jacobi's identity for complementary minors).

[ShortProof], `Lib/GLn/Dual` (`New.GL.exists_star_matrix`, `New.GL.exists_int_duality_matrix`, `New.GL.IsDualIsometry`,
`New.exists_isDualIsometry`, `New.exists_dual_isometry`, `New.GL.exists_weylGram_mul_eq_hookNumber_dual_smul`,
`New.GL.exists_toPoly_eq_hookNumber_dual_smul`, `New.IsHCParam.columns_eq_of_neg`,
`New.IsHCParam.add_eq_neg_sum_of_neg`, `New.IsDualPairing`, `New.exists_isDualPairing_of_isHCParam`)

### 3.2 Mixed weights and the Cartan product

*Origin:* adapted from the published theory of the Cartan component of a tensor product: here for a mixed weight, the
sum of a polynomial weight and of the dual of another, integrally, as an isometric embedding with an integral left
inverse, and with a Cartan product of vectors of two smaller groups whose norm is multiplicative.

*Method of the formal proof:* the mixed weight is `κ⁺ + κ^c` with `κ^c` the complementary diagram of `κ⁻`; the matrix
`M` is the multiplication matrix of 2.5 for `κ⁺` and `κ^c`, followed by the duality matrix of 3.1 on the second factor.
For the Cartan product, the images of the two vectors under the Schur matrices of the inclusions lie in the image of
`M` by a computation on evaluation vectors, and the norm identity follows from the isometry of `M`.

Let `n_τ = n` for all `τ`, `|n| = N`, and `κ⁺`, `κ⁻` weights for `n`. The *mixed weight* is
`κ^±_τ(i) := κ⁺_τ(i) + κ⁻_τ(N − i)`, `1 ≤ i < N`; put `D⁻_τ := Σ_{1≤i<N} κ⁻_τ(i)`, and let `y_id`, `y_rev` be the arrays of
2.4 (d) for the identity numbering and for the reversed one.

(a) There is `M ∈ M_{(B(κ⁺)×B(κ⁻))×B(κ^±)}(ℤ)` with a left inverse `M♭` with integer entries, with
`Mᵀ(G_{κ⁺} ⊗ G_{κ⁻})M = G_{κ^±}`, and such that over every field `R` of characteristic `0`:
`M·ev_{y_id} = ev_{y_id} ⊗ ev_{y_rev}` (for `κ^±` on the left, `κ⁺` and `κ⁻` on the right) and
`M·ρ_{κ^±,−D⁻}(g) = (S_{κ⁺}(g) ⊗ S_{κ⁻}(g^{−ᵀ}))·M` for `g ∈ GL_n(R)^Φ`.

(b) *Cartan product.* Let `ε : a ⊔ a′ → n` be a bijection from the disjoint union of two finite sets, `ε_a ∈ M_{n×a}`
and `ε_{a′} ∈ M_{n×a′}` the matrices of the restrictions of `ε` to `a` and to `a′`, and suppose that `κ⁺` has no
column of height `h` with `|a| ≤ h < N` and `κ⁻` none with `|a′| ≤ h < N`. For a field `R` of characteristic `0`, `y ∈ R^{B_a(κ⁺)}` (the Weyl module of
`κ⁺` for the rows `a`), `η ∈ R^{B_{a′}(κ⁻)}` and `g ∈ GL_n(R)^Φ`, put
`y ⋆_g η := M♭·(S_{κ⁺}(gε_a)y ⊗ S_{κ⁻}(g^{−ᵀ}ε_{a′})η)`. Then `M·(y ⋆_1 η) = S_{κ⁺}(ε_a)y ⊗ S_{κ⁻}(ε_{a′})η`,
`ρ_{κ^±,−D⁻}(g)·(y ⋆_1 η) = y ⋆_g η`, and over `ℂ`, `‖y ⋆_1 η‖²_G = ‖y‖²_G·‖η‖²_G`.

*Needs:* 1.3, 2.1, 2.5, 3.1.

[ShortProof], `Lib/GLn/Dual` (`New.mixedWeight`, `New.GL.MixedCartanEmbedding`, `New.nonempty_mixedCartanEmbedding`,
`New.mixedCartan`, `New.Rows.mixedCartanLeftInv`, `New.Rows.cartanProduct`, `New.Rows.mixedCartan_mulVec_cartanProduct`,
`New.Rows.weylRep_mulVec_cartanProduct`, `New.Rows.weylNormSq_cartanProduct`)

### 3.3 Leading-row fillings

*Origin:* particular to this proof: the Levi-summand case of integral branching, from `GL(n_τ)` to the group of its
last rows, for any number of removed leading rows, with the hook number of the smaller diagram as a denominator.

*Method of the formal proof:* evaluating a product of minors of a completed filling at an array whose leading block is
invertible gives, by the determinant formula through the Schur complement, a factor that does not depend on the
filling times the product of minors of the given filling at the Schur complement; at `diag(1, y)` the factor is `1`.
So the map on tensors carries evaluation vectors to evaluation vectors, which span; the hook-number statement is 2.2
(c) for the smaller diagram, carried over by this map.

At each `τ` let the rows `n_τ`, in the fixed numbering, be `q_τ` leading rows followed by the rows `m_τ`
(`N_τ = q_τ + |m_τ|`). For a weight `κ` for `n`, the diagram without its first `q_τ` rows is the weight `κ♭` for `m` with
`κ♭_τ(h) := κ_τ(q_τ + h)`, `1 ≤ h < |m_τ|`. For `T₀ ∈ CF(κ♭)` let `T₀⁺ ∈ CF(κ)` be the filling whose columns of height
`h ≥ q_τ` are the `q_τ` leading rows followed by the corresponding column of `T₀`, and whose columns of height `h < q_τ`
are the first `h` rows; let `Λ♭` be the integer matrix that sends the basis tensor `T₀` to the basis tensor `T₀⁺`. For an
array `y` with rows `m`, `diag(1, y)` is the array with rows `n` whose leading row number `s` is the unit vector at
column `s` and whose rows `m_τ` are those of `y` moved to the columns `q_τ, q_τ + 1, …`.

(a) For every integer array `y`: `Λ♭·ι_{κ♭}·ev_y = ι_κ·ev_{diag(1,y)}`.

(b) `Λ♭` maps the image of `W_ℤ(κ♭)` into that of `W_ℤ(κ)`: for every `ζ ∈ W_ℤ(κ♭)` there is `η ∈ W_ℤ(κ)` with
`ι_κη = Λ♭ι_{κ♭}ζ`.

(c) For every `T₀ ∈ CF(κ♭)` there is `η ∈ W_ℤ(κ)` with `P_κ(η) = H(κ♭)·Π_{T₀⁺}`.

IntegralWeylModulesOfGeneralLinearGroups §1.1 builds the branching maps for one removed row and every interlacing
weight through Capelli determinants; it does not state (c).

*Needs:* 1.3, 2.1, 2.2 (c); Mathlib `Matrix.det_fromBlocks₁₁`.

[ShortProof], `Lib/GLn/SchurModule/LeadingRows` (`New.flatColumns`, `New.leadingWedge`, `New.blockArray`,
`New.leadingWedgeMatrix`, `New.aeval_fillingPoly_leadingWedge`, `New.leadingWedgeMatrix_mulVec_weylEval`,
`New.exists_fillingMatrix_mulVec_eq_leadingWedgeMatrix_mulVec`, `New.exists_toPoly_eq_hookNumber_smul_leadingWedge`)

### 3.4 Integral branching from `GL(n + 1)` to `GL(n) × GL(1)`

*Origin:* particular to this proof: for one interlacing pair, an integer matrix from the representation of
`∏_τ GL(n_τ + 1)` to that of `∏_τ GL(n_τ)`, equivariant over every field of characteristic `0`, with an operator-norm
bound in which the columns of height below a given `q` do not count, and spanning the maps that are equivariant for the
unitary block group; nearest published result: Hara, Miyazaki and Namikawa (2023), the integrality of the branching maps
from `GL_N` to `GL_{N−1}` on the lattice of minors away from small primes, by Gelfand–Tsetlin bases.

*Method of the formal proof:* the *branching vector* is the product of the leading minors of the larger rows to the
powers `γ`, with the new row first, and to the powers `κ′`, with the new row last; by 3.3, applied to fillings that
begin with the new row, an integer `0 < c ≤ (L^L)^3` (a hook number) times it is the polynomial of an integral vector of
the smaller Weyl module. An equivariant integer matrix is built from this value at one point. The norm bound is proved
by contracting with explicit tensors of the larger group, which turn the Gram form of the smaller module into the
tensor form, and an inequality of Cauchy–Schwarz type, giving `c²`. Spanning comes from a cyclic vector for the
lower triangular block matrices and the Zariski density of the unitary group, which give multiplicity at most one.

For each `τ` let `n⁺_τ := n_τ ⊔ {∗}` (one new row), and embed `GL(n_τ) × GL(1)` into `GL(n⁺_τ)` by `(g, s) ↦ diag(g, s)`. Let
`κ` be a weight for `n⁺` and `e ∈ ℤ^Φ`. Write `κ = γ + κ′` (of the `κ_τ(h)` columns of height `h`, `γ_τ(h)` lose a box and
`κ′_τ(h)` keep it), put `κ₀_τ(h) := κ′_τ(h) + γ_τ(h + 1)` for `1 ≤ h < N_τ` and `e₀_τ := e_τ + κ′_τ(N_τ)`, and let `q ≥ 0`
be such that every column of height below `q` loses a box (`κ′_τ(h) = 0` for `h < q`). Put `λ_γ(τ) := Σ_{h≥1} γ_τ(h)`. There
is `br ∈ M_{B_n(κ₀)×B_{n⁺}(κ)}(ℤ)` such that:

(a) over every field `R` of characteristic `0`, `br·ρ_{κ,e}(diag(g, s)) = ∏_τ s_τ^{λ_γ(τ)+e_τ}·ρ_{κ₀,e₀}(g)·br` for all
`g ∈ ∏_τ GL(n_τ, R)` and `s ∈ (R^×)^Φ`;

(b) if `Σ_τ Σ_{q≤h<N_τ} h·κ₀_τ(h) ≤ L`, then `‖br·ξ‖²_G ≤ (L^{3L})²·‖ξ‖²_G` for every `ξ ∈ ℂ^{B_{n⁺}(κ)}`;

(c) every complex matrix `T` with `T·ρ_{κ,e}(diag(u, 1)) = ρ_{κ₀,e₀}(u)·T` for all `u ∈ ∏_τ U(n_τ)` is a complex multiple of
`br`.

That `br ≠ 0` is not part of the statement. IntegralWeylModulesOfGeneralLinearGroups §1.1 builds integral branching
maps with an explicit nonzero constant; its norm bound goes through `dim V_λ` and grows with the length of the first
row, so it does not give (b). The multiplicity one behind (c) is, for one `GL_n` and its own model,
RepresentationTheory/ClassicalGroups §6.1 (`rationalWeyl_branching`).

*Needs:* 1.3, 2.1, 2.2, 2.3 (c), 2.4 (a), 3.3.

[ShortProof], `Lib/GLn/Branching/NormBound` (`New.GL.branchVector`, `New.GL.exists_smul_weylKernel_mul_eq_toPoly`,
`New.GL.extendedTensor`, `New.GL.weylNormSq_mulVec_le_of_equivariant`); `Lib/GLn/Branching/IntegralMap`
(`New.SpansBranchingMaps`, `New.GL.exists_cyclic_lower_triangular`, `New.GL.exists_int_branching_of_weylKernel`,
`New.GL.spansBranchingMaps_of_equivariant`, `New.exists_branching_matrix`)

## Layer 4: Class functions on `GL_n` over a finite field: the Hall algebra and Green's cuspidal functions

This layer defines the ring of class functions on all square matrices over a finite field with the parabolic-induction
product (4.1), proves its structure (4.2), studies its cuspidal elements and Green's cuspidal function `C_η` (4.3), and
defines Green's functions `τ_P` of irreducible polynomials (4.4).

### 4.1 The ring of class functions on all square matrices

*Origin:* definitions and conventions.

*Method of the formal proof:* the formal proof makes these definitions, with classes as similarity classes of
endomorphisms of the spaces `k^d`.

Let `k` be a field. A *class* is a similarity class of endomorphisms `g` of finite-dimensional `k`-vector spaces `V`,
invertible or not; it has a dimension `dim V` and a characteristic polynomial.

(a) `𝓗(k)` is the set of functions from classes to `ℂ`. For finite `k`, the *product* is
`(A ∗ A′)(g) := Σ_W A(g|_W)·A′(g|_{V/W})`, the sum over the subspaces `W ⊂ V` with `gW ⊂ W`; the unit `1` is the function
that is `1` on the class of dimension `0` and `0` elsewhere; `𝟙` is the constant function `1`. For `n ≥ 0`, `A|_n` is `A` on
the classes of dimension `n` and `0` elsewhere; for `g ∈ GL_n(k)`, `A(g)` is the value at the class of `g`.

(b) `⟨A, A′⟩_n := |GL_n(k)|^{−1} Σ_{g∈GL_n(k)} conj(A(g))·A′(g)`. The *block average* `δA(a, b)`, for classes `a` on `V_a`
and `b` on `V_b`, is the mean over `x ∈ Hom(V_b, V_a)` of `A` at the class of the endomorphism of `V_a ⊕ V_b` with
blocks `a`, `x` (upper right) and `b`. `A` is *cuspidal* if `δA(a, b) = 0` whenever `dim a ≠ 0` and `dim b ≠ 0`. For
`f ∈ 𝓗(k)` and `d ≥ 0`, `∂_{d,f}A` is the function `a ↦ ⟨f, δA(a, ·)⟩_d`.

(c) For a field `K ⊇ k` and any function `η : K → ℂ`, `β_η(g)` is the sum of `η(α)` over the roots `α ∈ K` of the
characteristic polynomial of `g`, with multiplicity. With `μ := 𝟙^{−1}` (4.2 (a)) and `·` the pointwise product,
*Green's cuspidal function* is `C_η := (β_η·μ) ∗ 𝟙`.

*Needs:* none.

[ShortProof], `Lib/LocalGL/Green/HallAlgebra` (`New.SimClass`, `New.Hall`, `New.Hall.constOne`, `New.Hall.rankPart`,
`New.Hall.evalGL`, `New.Hall.blockAverage`, `New.Hall.IsCuspidal`, `New.Hall.rankInner`, `New.Hall.skew`,
`New.Hall.moebius`, `New.Hall.mulMoebius`, `New.Hall.brauerLift`, `New.Hall.greenCuspidal`)

### 4.2 The Hall algebra: Mackey's formula, adjunction and Frobenius reciprocity

*Origin:* adapted from the published theory of the ring of class functions of the finite general linear groups under
parabolic induction: here on all square matrices, invertible or not, with Mackey's formula for block averages, the
adjoint of multiplication, and the Leibniz rule for the adjoint of a cuspidal element.

*Method of the formal proof:* the ring laws are checked on the sums over stable subspaces; commutativity holds because
an endomorphism is similar to its transpose (its dual map), which exchanges stable subspaces and quotients. `𝟙` is
invertible because `(1 − 𝟙)^m` vanishes in dimensions below `m`. Mackey's formula comes from a bijection between the stable subspaces of a block triangular map and
the triples formed by a pair of stable subspaces of the blocks, a map between them and a shear. Adjunction and the
Leibniz rule follow from Mackey's formula and cuspidality; Frobenius reciprocity is an induction on the levels.

Let `k` be finite.

(a) `(𝓗(k), +, ∗)` is a commutative `ℂ`-algebra with unit `1`, and `𝟙` is invertible; `μ := 𝟙^{−1}`.

(b) *Mackey's formula.* For classes `a` on `V` and `b`:
`δ(A ∗ A′)(a, b) = Σ_W (δA(a|_W, ·) ∗ δA′(a|_{V/W}, ·))(b)`, the sum over the `a`-stable subspaces `W ⊂ V`.

(c) *Adjunction.* If `f` vanishes off the classes of dimension `d`, then `⟨f ∗ A′, A⟩_{d+n} = ⟨A′, ∂_{d,f}A⟩_n`.

(d) For `c` cuspidal and `d ≠ 0`: `∂_{d,f}c = ⟨f, c⟩_d·1` for every `f`, and `∂_{d,c}` is a derivation:
`∂_{d,c}(A ∗ A′) = ∂_{d,c}A ∗ A′ + A ∗ ∂_{d,c}A′`.

(e) *Frobenius reciprocity.* Let `b` map a finite set `r` of size `n` to a finite totally ordered set `I`, `P_b ⊂ GL_r(k)`
the block upper triangular matrices for the levels `b`, `g_a` the diagonal block of level `a`, `n_a := |b^{−1}(a)|`, and
`A_a ∈ 𝓗(k)` for `a ∈ I`. For every class function `Y` on `GL_r(k)`:
`⟨(∏_a A_a|_{n_a})|_{GL_r(k)}, Y⟩_{GL_r(k)} = ⟨(g ↦ ∏_a A_a(g_a)), Y|_{P_b}⟩_{P_b}`, the product `∏_a` on the left taken
with `∗`. So on `GL_n(k)` the product `∗` is Harish-Chandra (parabolic) induction.

*Needs:* 4.1; Mathlib `Module.End`, `Submodule`.

[ShortProof], `Lib/LocalGL/Green/HallAlgebra` (`New.Hall.mul_simClassOf`, `New.simClassOf_eq_dualMap`,
`New.Hall.one_sub_constOne_pow_apply_eq_zero`, `New.Hall.isUnit_constOne`, `New.Hall.blockAverage_mul`,
`New.Hall.rankInner_mul_eq_rankInner_skew`, `New.Hall.skew_of_isCuspidal`, `New.Hall.rankInner_mul_of_isCuspidal`,
`New.Hall.skew_mul`, `New.classInner_evalGL_prod`)

### 4.3 Cuspidal functions, `μ`, and the torus identity

*Origin:* adapted from Green (1955), Lemma 3.2 and Theorems 2 and 5, his virtual characters and the expansion of the
eigenvalue sums through them (as in FiniteReductiveGroups §5.6 (b)): here `C_η ∗ 𝟙 = −β_η` with `C_η` cuspidal, in the
ring of 4.1, without Deligne–Lusztig characters; the vanishing of `μ` off semisimple classes stands in for the Steinberg
character, and the inner product of `C_η` with `B·μ` is a mean over the torus `L^×`.

*Method of the formal proof:* `Σ_W μ(g|_W) = 1(g)` (the unit) says that `μ` is a Möbius function on the modular lattice of
stable subspaces, and a form of Crapo's complementation theorem shows that this lattice is complemented, so `g` is
semisimple, wherever `μ(g) ≠ 0`. The identity `C_η ∗ 𝟙 = −β_η` is the termwise identity
`β_η(g|_W)μ(g|_W) + μ(g|_W)β_η(g|_{V/W}) = β_η(g)μ(g|_W)` summed over `W`. Cuspidality is computed with Mackey's formula. A
cuspidal function vanishes off the classes whose characteristic polynomial is a power of an irreducible one, by the
Fitting decomposition. The values at multiplication by a generator are counts of subspaces; the torus identity
follows by grouping the semisimple classes of `GL_m(k)` with irreducible characteristic polynomial as conjugates of
multiplication operators of `L`.

Let `k` be finite with `q` elements, `K ⊇ k` a field and `η : K → ℂ` any function.

(a) If `μ(g) ≠ 0` then `g` is semisimple.

(b) `C_η ∗ 𝟙 = −β_η`; `C_η` vanishes in dimension `0` and is cuspidal.

(c) If `A` is cuspidal and `A(g) ≠ 0`, the characteristic polynomial of `g` is `P^j` with `P` irreducible.

(d) If `g` acts on a space of dimension `d`, and `η′(z) = a·η(z)` for every `z ∈ K` with `z^{q^d} = z` whose orbit
`z, z^q, …, z^{q^{d−1}}` lists the eigenvalues of `g` in `K` with multiplicity, then `C_{η′}(g) = a·C_η(g)`.

(e) Let `k′ = k[z]` be a finite extension with `Q` elements, `V` a `k′`-vector space of dimension `d ≥ 1`, `g` the
multiplication by `z` on `V` as a `k`-linear map, and `N(X) := ∏_{0≤i<d}(X − Q^i)`. Then `μ(g) = N(0)`,
`C_η(g) = −N′(1)·Σ_α η(α)` (`N′` the derivative of `N`, the sum over the roots in `K` of the minimal polynomial of
`z`), and
`(C_η·μ)(g)·(|V| − 1) = Σ_α η(α)·|{h ∈ GL_k(V) : hz = zh}|`.

(f) *The torus identity.* Let `L` be a finite extension of `k` of degree `m` and `φ : L → K` a `k`-algebra map. For every
`B ∈ 𝓗(k)`: `⟨C_η, B·μ⟩_m = |L^×|^{−1} Σ_{z∈L^×} conj(η(φ(z)))·B(z·)`, where `B(z·)` is the value at the class of
multiplication by `z` on `L`.

FiniteReductiveGroups §5.6 (b) also gives that `β_η` is a virtual character, through Deligne–Lusztig characters; (f)
is the form "cuspidal times Steinberg is induced from a torus" in which the formal proof uses it.

*Needs:* 4.1, 4.2; Mathlib `IsModularLattice`, `Module.End.IsSemisimple`, `minpoly`.

[ShortProof], `Lib/LocalGL/Green/CuspidalFunctions` (`New.Hall.crapo_complementation`,
`New.Hall.sum_moebius_simClassOf_endOnSub`, `New.Hall.isSemisimple_of_moebius_ne_zero`,
`New.Hall.greenCuspidal_mul_constOne`, `New.Hall.greenCuspidal_eq_zero_of_dim_lt_one`,
`New.Hall.isCuspidal_greenCuspidal`, `New.Hall.IsCuspidal.exists_charpoly_eq_pow`, `New.greenCuspidal_simClassOf_eq_mul`,
`New.moebius_and_greenCuspidal_lsmul`, `New.mulMoebius_greenCuspidal_lsmul`, `New.rankInner_greenCuspidal_mulMoebius`)

### 4.4 Green's cuspidal functions `τ_P`

*Origin:* adapted from Green (1955), the cuspidal characters of `GL_n(𝔽_q)`, their degree and their values, with the
orbit criterion in his Lemma 6.3 (as in FiniteReductiveGroups §5.2): here defined by Green's formula in the ring of 4.1,
named by irreducible polynomials through a fixed injective character of `K^×`, with cuspidality, orthonormality and
independence of the root.

*Method of the formal proof:* cuspidality is 4.3 (b). Independence of the root: the roots of `P` are the Frobenius
conjugates of one of them, and the corresponding characters `θ_x` agree, up to the conjugation, on the eigenvalues that
matter (4.3 (d)). Orthonormality: with `L` of degree `d` over `k`, every irreducible `S` of degree `d` with `S(0) ≠ 0` has
a root named by a character of `L^×`; writing `τ_S` through `(β·μ) ∗ 𝟙`, the Leibniz rule for pairing with the cuspidal
`τ_P` (4.2 (d)) and the torus identity 4.3 (f) turn the inner product into a mean over `L^×` of a product of characters,
which is `1` or `0` by the orthogonality of the characters of `L^×`; for `S` of another degree `τ_S` lives in another
rank.

Let `k` be finite with `q` elements, `K` an algebraically closed field containing `k`, and `ω : K^× → ℂ^×` an injective
character. For `Q ≥ 2` and `x ∈ K` with `x^{Q−1} = 1`, let `θ_x := ω^j` on `K^×` and `θ_x(0) := 0`, where `j ∈ ℕ`
satisfies `ω(x) = e^{2πij/(Q−1)}`. For a monic irreducible `P ∈ k[X]` of degree `d` with `P(0) ≠ 0` and a root `x` of `P`, with
`Q := q^d`, *Green's cuspidal function* of `P` is `τ_P := (−1)^d·(C_{θ_x})|_d`.

(a) `τ_P` does not depend on the choice of the root `x`, and it is cuspidal.

(b) For every monic irreducible `S` with `S(0) ≠ 0`: `⟨τ_P, τ_S⟩_d = 1` if `S = P` and `0` otherwise.

(c) If `P(1) ≠ 0`, then `∂_{d,τ_P}𝟙 = 0`.

(d) For `Q = q`, the map `a ↦ θ_a|_{k^×}` is an isomorphism from `k^×` onto the group of characters of `k^×`; for a character
`χ` of `k^×`, `x_χ ∈ k^×` denotes the unit with `θ_{x_χ}|_{k^×} = χ`.

The formal proof fixes one exponent `j` for each `x`. That `τ_P` does not depend on `j` either follows from 4.3 (d)
with `a = 1`: two admissible `j` differ by a multiple of `Q − 1`, so the two characters agree at every `z` with
`z^Q = z`.

FiniteReductiveGroups §5.2 with §5.6 (b) (which identifies Green's class function with `R_{T_{(n)}}^G`) also implies (a) and
(b), through Deligne–Lusztig theory; the formal proof avoids it.

*Needs:* 4.1, 4.2, 4.3.

[ShortProof], `Lib/LocalGL/Green/TauFunctions` (`New.thetaChar`, `New.greenTau`, `New.labelChar`, `New.IsLabel`,
`New.charName`, `New.labelChar_eq_greenTau`, `New.isCuspidal_greenTau`, `New.greenTau_eq`, `New.rankInner_greenTau`,
`New.thetaChar_charName`)

## Layer 5: Lifts along extensions of finite fields and Green's characters of labels

This layer defines descent from `GL_n(k′) ⋊ Gal(k′/k)` and lifts of class functions (5.1), shows that lifts are
multiplicative and that the eigenvalue sums lift (5.2), deduces that the characters `Ξ_c` of labels are orthonormal
irreducible characters with their degree bound, twists and idempotents (5.3), and proves Shintani lifting of the `Ξ_c`
in prime degree (5.4).

### 5.1 Descent along a coset, and the extension of invariant characters

*Origin:* adapted from Shintani (1976), Lemma 2-6 with its Corollary and Lemmas 2-8 and 2-9 (as in FiniteReductiveGroups
§5.11 (a), (b)), for the choice of roots over a coset and the preservation of inner products, and from Shintani (1976),
the argument of Lemma 2-11 (as in TensorInductionAndFiniteGroupInputs §6.2 (b)), for (c): here descent is stated through
a choice of roots `r(γ)` with `r(γ)^{ord σ} = γ` in the coset of `σ`, in place of the norm map, and the extension
criterion is stated for any finite group `Γ` with two numerical conditions.

*Method of the formal proof:* roots over `σ` are constructed in a group algebra: in `k′[C]`, `C` cyclic of order
`|GL_n(k₀)|` with `σ` acting on the coefficients, a generator of `C` is the norm of a unit (the norm is onto the
`σ`-fixed units, a form of Hilbert's Theorem 90), and evaluating that unit at `γ` gives the matrix part of `r(γ)`, which
makes the choice equivariant and lets it lie in every subalgebra containing `γ`. Descent then preserves inner products
because every element over `σ` is conjugate, by a matrix, to a chosen root, with the number of conjugates counted by
centralisers. For the extension criterion, the function `f` equal to `Y` on `G` and `Θ` off `G` has norm one by the
first condition, a value at `1` with nonnegative real part, and integral inner products with all characters by the
second, which characterises an irreducible character.

Let `k ⊂ k′` be finite fields, `Γ := Gal(k′/k)` acting on `GL_n(k′)` entrywise, and `E_n := GL_n(k′) ⋊ Γ`.

(a) *Definitions.* For a field `k₀` with `k ⊂ k₀ ⊂ k′` and `X ∈ 𝓗(k₀)`, a function `Ψ` on `E_n` *descends* to `X` if
`Ψ(s) = X(s^{ord σ})` for every `σ ∈ Γ` with fixed field `k₀` and every `s ∈ E_n` over `σ` with `s^{ord σ} ∈ GL_n(k₀)`. For
a commutative semiring `Z` with a homomorphism to `ℂ` (in practice `ℕ`, `ℤ` or a ring) and `A ∈ 𝓗(k)`, `A′ ∈ 𝓗(k′)`, `A`
*lifts* to `A′`,
`Lift_Z(A, A′)`, if for every `m ≥ 0` some `Z`-combination of characters of `E_m` descends both to `A` (over `k`) and to
`A′` (over `k′`, that is, it equals `A′` on `GL_m(k′)`).

(b) *Roots and isometry.* Let `σ ∈ Γ` have fixed field `k₀`. There is `r : GL_n(k₀) → E_n` with `r(γ)` over `σ`,
`r(γ)^{ord σ} = γ`, `r(vγv^{−1}) = v·r(γ)·v^{−1}` for `v ∈ GL_n(k₀)`, and such that every `x ∈ GL_n(k′)` with
`x·r(δ)·x^{−1} = r(γ)` lies in `GL_n(k₀)`; every element of `E_n` over `σ` is conjugate by a matrix to some `r(γ)`. If class
functions `Ψ`, `Ψ′` on `E_n` descend over the coset of `σ` to `X`, `X′`, then
`|Γ|·|E_n|^{−1} Σ_{s over σ} conj(Ψ(s))·Ψ′(s) = ⟨X, X′⟩_{GL_n(k₀)}`; and induction from a parabolic subgroup of `E_n`
commutes with descent (the induced function descends to the product `∗` of the descended functions).

(c) *Extension of invariant characters.* Let `Γ` be any finite group acting on a finite group `G`, `Y` a `Γ`-invariant
irreducible character of `G`, and `Θ` a virtual character of `G ⋊ Γ` with `|Γ|·⟨Θ, Θ⟩ = ⟨Θ|_G, Θ|_G⟩ + |Γ| − 1` and
`⟨Y, Θ|_G⟩ = 1 + |Γ|·m` for an integer `m`. Then the function equal to `Y` on `G` and to `Θ` off `G` is an irreducible
character of `G ⋊ Γ`.

FiniteReductiveGroups §5.11 (a), (b) give (b) through Lang's theorem and norm classes, and TensorInductionAndFiniteGroupInputs
§6.2 gives a form of (c) for a normal subgroup of prime index with a virtual character of norm one on one coset.

*Needs:* 4.1, 4.2 (e); GaloisRepresentationsOfUnitaryEigenforms §5.2 (c), (d) (norms onto fixed units, tame actions);
Tau Ceti `TauCeti.exists_eq_irreducibleCharacter_or_neg` (virtual characters of norm one).

[ShortProof], `Lib/LocalGL/Shintani/CosetRootChoice` (`New.DescendsOnCoset`, `New.IsRootChoice`, `New.exists_isRootChoice`,
`New.IsRootChoice.exists_conj_eq_of_map_eq`, `New.IsRootChoice.index_mul_finMean_eq_classInner`, `New.induceClassFn`,
`New.classInner_induceClassFn_of_surjective`, `New.DescendsOnCoset.induce`, `New.IsIrreducibleChar.extend_semidirect`);
`Lib/LocalGL/Shintani/CosetDescent` (`New.GalSemidirect`, `New.DescendsTo`, `New.Lift`, `New.exists_isRootChoice_GL`,
`New.DescendsTo.induceClassFn_parabolic`)

### 5.2 Lifts are multiplicative, and the eigenvalue sums lift

*Origin:* adapted from Green (1955), Lemma 3.2 and Theorems 2 and 5, the eigenvalue sums as virtual characters (as in
FiniteReductiveGroups §5.6 (b)), and from Shintani (1976), Lemma 2-6 with its Corollary and Lemmas 2-8 and 2-9, for the
compatibility of lifting with Harish-Chandra induction (as in the first part of FiniteReductiveGroups §5.11 (c)): here in the stronger form of a lift along any extension `k′/k`, proved without Brauer's
induction theorem and without Deligne–Lusztig characters, by inducing a character of `(k′ ⊗_k L)^× ⋊ Gal(k′/k)`.

*Method of the formal proof:* differences are immediate; products use 5.1 (b) for parabolic induction; for the factor `μ`,
in the ranks below `N` the element `μ·(1 − (1 − 𝟙)^N)` agrees with `μ` and is a polynomial in `𝟙`, which lifts to itself. The
character of `(k′ ⊗_k L)^× ⋊ Gal(k′/k)` given by `θ` of the norm is induced to `E_m`; by 4.3 (f) and the isometry of
5.1 (b) it descends to `C_θ·μ`. The eigenvalue sum then lifts by recursion on the rank through `β_θ = −C_θ ∗ 𝟙` (4.3 (b)).

Let `k ⊂ k′` be finite fields and `Z`, `R` as in 5.1 (a), `R` a ring.

(a) `Lift_Z(𝟙, 𝟙)` and `Lift_Z(1, 1)`; `Lift_R(A, A′)` and `Lift_R(B, B′)` imply `Lift_R(A − B, A′ − B′)`; `Lift_Z(A, A′)` and
`Lift_Z(B, B′)` imply `Lift_Z(A ∗ B, A′ ∗ B′)`; `Lift_R(A, A′)` implies `Lift_R(A·μ, A′·μ)` and
`Lift_R((−1)^m·((A·μ) ∗ 𝟙)|_m, (−1)^m·((A′·μ) ∗ 𝟙)|_m)` for every `m`.

(b) If `Lift_Z(A, A′)` along the trivial extension `k′ = k` for some `A′`, then `A|_{GL_n(k)}` is a `Z`-combination of characters
of `GL_n(k)` for every `n`.

(c) Let `K ⊇ k′` be a field, `θ` a multiplicative character of `K`, `L` an extension of `k` of degree `m`, and
`φ : k′ ⊗_k L → K` a `k′`-algebra map. There is a character `Ψ` of `E_m` that descends over `k` to `C_θ·μ` and descends over
`k′` to every `X ∈ 𝓗(k′)` with `⟨X, Y⟩_m = |(k′ ⊗_k L)^×|^{−1} Σ_t conj(θ(φ(∏_{τ∈Gal(k′/k)} τ(t))))·Y(t·)` for all
`Y ∈ 𝓗(k′)`, the sum over `t ∈ (k′ ⊗_k L)^×`, `τ` acting on the factor `k′`, and `Y(t·)` the value at multiplication by
`t` on `k′ ⊗_k L`.

(d) For `K ⊇ k′` algebraically closed and every multiplicative character `θ` of `K`, there is `B ∈ 𝓗(k′)` with
`Lift_ℤ(β_θ, B)`; taking `k′ = k` and (b), `β_θ|_{GL_n(k)}` is a virtual character of `GL_n(k)` for every `n`.

FiniteReductiveGroups §5.6 (b) also gives the last clause of (d) through Deligne–Lusztig characters; the lift itself is used
in 5.3 and 5.4.

*Needs:* 4.2, 4.3, 5.1.

[ShortProof], `Lib/LocalGL/Shintani/CosetDescent` (`New.Lift.lift_constOne`, `New.Lift.one`, `New.Lift.sub`, `New.Lift.mul`,
`New.Lift.mulMoebius`, `New.Lift.rankPart_mulMoebius_mul_constOne`, `New.Lift.evalGL_mem_virtualChars`,
`New.exists_norm_char_semidirect`, `New.exists_torus_induced_descendsTo`, `New.exists_lift_brauerLift`)

### 5.3 The characters of labels

*Origin:* adapted from Green (1955) and Macdonald (1995), Ch. IV, the characteristic map of `GL_n(𝔽_q)`, of which this is
the case of a squarefree label, and Zelevinsky (1981), the irreducibility of Harish-Chandra products of distinct cuspidal
characters (as in FiniteReductiveGroups §5.4): here the characters are products, for the induction product of 4.1, of the
functions `τ_P` of 4.4, with orthonormality, a lower bound for the degree in place of its value, the twist by `χ∘det`,
and their central idempotents.

*Method of the formal proof:* orthonormality is an induction on the irreducible factors of the labels, through the
adjunction and the Leibniz rule of 4.2 (c), (d) and the orthonormality of the `τ_P` (4.4). That `Ξ_c` is a character comes
from 5.2: each `τ_P` is `(−1)^d((β_θ·μ) ∗ 𝟙)|_d` and lifts by 5.2 (a) from the lift of `β_θ`, so `Ξ_c` is a virtual character
of norm one with integral inner products with all characters and a degree of nonnegative real part, hence an
irreducible character. For the degree bound, pairing `Ξ_c` with the indicator of the identity times `μ` (whose value at
the identity is `∏_{i<r}(−q^i)` by 4.3 (e)) gives `Ξ_c(1)·∏_{i<r} q^i·m = |GL_r(k)|` for a natural number `1 ≤ m ≤ q^r`, and
`∏_{i<r}(1 − q^{−i−1}) ≥ 1 − r/q`. The twist computes `θ` of a determinant as `θ` of the product of the eigenvalues.

Let `k`, `q`, `K`, `ω` be as in 4.4. A *label* of degree `r` is a monic squarefree `c ∈ k[X]` of degree `r` with `c(0) ≠ 0`;
`Ξ_c := ∏_{P|c} τ_P ∈ 𝓗(k)`, the product `∗` over the monic irreducible factors.

(a) `Ξ_c = Ξ_c|_r`; for labels `c`, `c′` of degree `r`, `⟨Ξ_c, Ξ_{c′}⟩_r = 1` if `c = c′` and `0` otherwise; `Ξ_c|_{GL_r(k)}` is an
irreducible character of `GL_r(k)`.

(b) `Re Ξ_c(1) ≥ 0` and `|Ξ_c(1)|²/|GL_r(k)| ≥ (1 − r/q)/q^r`.

(c) For a character `χ` of `k^×`: `Ξ_{X−x_χ} = (χ∘det)|_1`, and `Ξ_c(g)·χ(det g) = Ξ_{c_χ}(g)` for `g ∈ GL_r(k)`, where `c_χ`
is the label whose roots are `x_χ` times those of `c`.

(d) If `c(1) ≠ 0`, then `⟨Ξ_c, A ∗ 𝟙⟩_r = ⟨Ξ_c, A⟩_r` for every `A ∈ 𝓗(k)`.

(e) *Idempotents.* Let `e_c := |GL_r(k)|^{−1}·Ξ_c(1)·Σ_g conj(Ξ_c(g))·g ∈ ℂ[GL_r(k)]` for labels `c` of degree `r` (and `e_c := 0`
for other `c`). The `e_c` are orthogonal central idempotents. For a nonzero `l ∈ k^r` and a character `χ` of `k^×` such that
`x_χ` is not a root of `c`: `(Σ_h χ(det h)^{−1}·h)·e_c = 0`, the sum over the invertible `h = 1 + u·lᵀ`, `u ∈ k^r`. For a finite
family of finite fields `k_w` and labels `c_w` of degree `r`, the tensor products `⊗_w e_{c_w}` in `ℂ[∏_w GL_r(k_w)]` are
orthogonal central idempotents, and so is any sum of them.

The formal proof states (e) for one fixed choice of `ω`, on an algebraic closure of `k`. FiniteReductiveGroups §5.4 with §5.2
and §5.6 (b) also implies (a), and gives the exact degree, through Deligne–Lusztig theory; the formal proof avoids it.

*Needs:* 4.2, 4.3, 4.4, 5.1 (a), 5.2.

[ShortProof], `Lib/LocalGL/Green/LabelCharacters` (`New.labelChar_X_sub_C`, `New.rankPart_labelChar`,
`New.rankInner_labelChar_mul_constOne`, `New.rankInner_labelChar`, `New.IsLabel.isIrreducibleChar_labelChar`,
`New.IsLabel.isChar_labelChar`, `New.lift_labelChar_self`, `New.labelIdem_orthogonal`, `New.hyperplaneSum_mul_labelIdem`,
`New.tupleIdem`, `New.isCentralProj_tupleIdem`, `New.tupleIdem_orthogonal`, `New.isCentralProj_sum_tupleIdem`,
`New.evalGL_labelChar_mul_det`); `Lib/LocalGL/Green/TauFunctions` (`New.labelIdem`, `New.hyperplaneSum`,
`New.labelChar_degree_bounds`)

### 5.4 Shintani lifting of the characters of labels in prime degree

*Origin:* adapted from Shintani (1976), Lemma 2-6 with its Corollary and Lemmas 2-8 and 2-9, and Kawanaka (1987), the lift of
a cuspidal character (as in FiniteReductiveGroups §5.11 (b), (d), (e)): here, in prime degree and for every label, one
character of `GL_r(k′) ⋊ Gal(k′/k)` equal to `Ξ_c` over `k′` on `GL_r(k′)` and to `Ξ_c` of the `l`-th power on the other cosets,
with sign `+1`; no norm map on classes and no bijection of characters is stated.

*Method of the formal proof:* induction on the irreducible factors of the label, by 5.2 (a). For an irreducible label `P`
of degree `r`, the character of 5.2 (c) for `L = k[X]/(P)` descends both to `C_{θ_x}·μ` over `k` and to `(−1)^r·Ξ_P·μ` over
`k′`; with the lift of the eigenvalue sum it gives a virtual character over the cosets, whose inner products are computed
by the formula (c); the extension criterion 5.1 (c) with the congruence modulo the degree then makes it a true
character.

Let `k ⊂ k′` be finite fields with `[k′ : k] = l` prime, `K ⊇ k′` algebraically closed and `ω` an injective character of
`K^×`; `Ξ` over `k` and over `k′` are formed with the same `ω`.

(a) For every label `c` over `k`: `Lift_ℕ(Ξ_c, Ξ_{c′})`, where `c′` is the image of `c` in `k′[X]`.

(b) For characters `χ` of `k^×` and `χ′` of `k′^×` with `x_{χ′} = x_χ` (in `k′`): `Lift_ℕ((χ∘det), (χ′∘det))` (on all ranks).

(c) If class functions `Ψ`, `Ψ′` on `E_n` descend to `A`, `A′ ∈ 𝓗(k)`, then
`l·⟨Ψ, Ψ′⟩_{E_n} = ⟨Ψ|_{GL_n(k′)}, Ψ′|_{GL_n(k′)}⟩ + (l − 1)·⟨A, A′⟩_n`.

FiniteReductiveGroups §5.11 (d) states the lift of a cuspidal character in prime degree up to a sign and on the coset of
the Frobenius, and §5.11 (e) only the label of a constituent for products; they do not give (a).

*Needs:* 4.4, 5.1, 5.2, 5.3.

[ShortProof], `Lib/LocalGL/Shintani/LiftingGreenCharacters` (`New.sum_evalGL_prod_eq_zero_iff`,
`New.exists_rankInner_labelChar_eq_finMean`, `New.exists_isChar_descendsTo_labelChar`, `New.lift_detChar`,
`New.DescendsTo.card_mul_classInner`, `New.shintani_lift_labelChar`)

## Layer 6: `GL_N` over a local field at pro-`p` Iwahori level

This layer defines the level structure, the operators `U_t`, exponents and Hecke operators (6.1), proves a decomposition
(6.2) and a twisted conjugacy statement (6.3), the quadratic relation and the injectivity of some `U_t` (6.4), Satake's
formula on exponents (6.5), the sorting of exponents (6.6), the survival of sorted unramified exponents on spherical
vectors (6.7), and the chains of roots of the Hecke polynomial of a spherical vector (6.8).

### 6.1 Parahoric subgroups, the operators `U_t`, exponents and Hecke operators

*Origin:* definitions and conventions.

*Method of the formal proof:* the formal proof makes these definitions; the parahoric subgroups are preimages of
subgroups of `GL_N(𝓀)` under reduction, which makes them compact and open.

Let `F`, `𝒪`, `𝔭`, `𝓀`, `q`, `ϖ`, `|·|` be as in the Conventions, `N ≥ 1`, and `ρ` a smooth complex representation of
`GL_N(F)` on `V` (every vector is fixed by an open subgroup).

(a) For a level function `b : {0, …, N − 1} → ℕ`, the *parahoric subgroup* `P_b` is the set of `g ∈ GL_N(𝒪)` with
`g_{ij} ∈ 𝔭` whenever `b(j) < b(i)`. The *pro-`p` Iwahori subgroup* `I₁` is the set of `g ∈ GL_N(𝒪)` with `g_{ij} ∈ 𝔭` for
`i > j` and `g_{ii} ≡ 1 (mod 𝔭)`. `T⁺` is the monoid of diagonal `t = diag(t_0, …, t_{N−1})` with `|t_0| ≤ |t_1| ≤ ⋯ ≤ |t_{N−1}|`;
`t` is *strictly dominant* if the inequalities are strict.

(b) For a compact open subgroup `C`, `e_C` is the mean over `C`, `V^C` the space of vectors fixed by `C`, and, for
`g ∈ GL_N(F)`, the *Hecke operator* of `CgC` is `x ↦ Σ_h ρ(h)x`, the sum over representatives `h` of `CgC/C`, as in
AdelicUnitaryGroupsAndAlgebraicModularForms §1.4. For `t ∈ T⁺`, `U_t := e_{I₁}∘ρ(t)` on `V^{I₁}`.

(c) For characters `θ_0, …, θ_{N−1}` of `F^×`, `ξ_θ(t) := ∏_i θ_i(t_i)·|t_i|^{N−1−i}`. For a character `ξ` of the diagonal
torus, a linear form `ℓ` on `V` is an *exponent* for `ξ` if `ℓ(ρ(t)e_{I₁}x) = ξ(t)·ℓ(x)` for all `x ∈ V` and `t ∈ T⁺`. A vector
`x` is an *Iwahori eigenvector* for `ξ` if `x ≠ 0`, `x ∈ V^{I₁}` and `U_t x = ξ(t)x` for every `t ∈ T⁺`.

(d) For `0 ≤ j ≤ N`, `T_j` is the Hecke operator of the double coset `GL_N(𝒪)·diag(ϖ, …, ϖ, 1, …, 1)·GL_N(𝒪)` (`j` entries
`ϖ`), the set of `g` with `g` and `ϖg^{−1}` integral and `|det g| = q^{−j}`, as in
AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 and WeilRepresentationsOnBanachSpacesOfData §9.1. For `0 ≤ r ≤ N`, the
*partial Hecke sum* `T_{r,j}` is `x ↦ Σ_g ρ(g)x`, the sum over the cosets `g·GL_N(𝒪)` in that double coset whose lattice
`g𝒪^N` contains the first `r` standard basis vectors; `T_{0,j} = T_j`. For `x ∈ V^{GL_N(𝒪)}` with `T_j x = t_j x` for all `j`, the *Hecke polynomial* of
`x` is `P_x(X) := Σ_{j=0}^{N} (−1)^j·q^{j(j−1)/2}·t_j·X^{N−j}`, the polynomial `H_{q,N}(t)` of
GaloisRepresentationsOfUnitaryEigenforms §1.1.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 1.5, 3.1 (compact means, Hecke operators);
WeilRepresentationsOnBanachSpacesOfData §9.1 (basic double cosets); GaloisRepresentationsOfUnitaryEigenforms §1.1 (Hecke
polynomial).

[ShortProof], `Lib/LocalGL/Iwahori/ParahoricStructure` (`New.residuePreimage`, `New.blockParahoric`, `New.proIwahori`,
`New.dominantTorus`, `New.IsExponent`, `New.IsIwahoriEigen`, `New.normAbsChar`, `New.torusChar`, `New.iwahoriDoubleCoset`);
`Lib/LocalGL/Iwahori/HeckeDegrees` (`New.partialCosets`, `New.partialHecke`, `New.partialHecke_zero_eq_heckeGL`);
`Lib/LocalGL/SphericalChainLemma` (`New.Patching.HasRootChain`)

### 6.2 The Iwasawa–Bruhat decomposition and the Iwahori factorisation

*Origin:* adapted from the published theory of the Iwahori decomposition of `p`-adic groups: here for `GL_N`, as the
existence of a factorisation `g = u·t·σ·k` with `k` in the pro-`p` Iwahori subgroup and, with the same `u`, the Iwahori
factorisation of the elements of `I₁`, together with the multiplicativity of `t ↦ U_t`.

*Method of the formal proof:* row reduction from the last row upwards: in each row the pivot is the first entry of
largest absolute value, and multiples of the pivot row are subtracted from the rows above, by an upper unitriangular
matrix; this leaves a monomial matrix times an element of `I₁`, and when `g ∈ I₁` the reducing matrix lies in `I₁` and leaves a
lower triangular matrix. Multiplicativity of `U_t` on `V^{I₁}`: every `k ∈ I₁` is a product `u·k′` in which `t` conjugates
`u` into `I₁` and `k′` fixes `ρ(t′)x` (because `t′^{−1}k′t′ ∈ I₁`), so the inner mean drops out.

(a) For every `g ∈ GL_N(F)` there is an upper unitriangular `u ∈ GL_N(F)` such that `g = u·t·σ·k` with `t` diagonal, `σ` a
permutation matrix and `k ∈ I₁`, and such that, if `g ∈ I₁`, then `u ∈ I₁` and `u^{−1}g` is lower triangular.

(b) `t ↦ U_t` is a homomorphism of monoids from `T⁺` to the endomorphisms of `V^{I₁}`, for every smooth representation.

ReductiveGroupsPartII §RG2.4.2 (the Iwahori–Bruhat decomposition and the Iwahori factorisation) and §RG2.4.4 (the Iwasawa
decomposition) also imply (a), through Bruhat–Tits theory; the formal proof avoids it.

*Needs:* 6.1.

[ShortProof], `Lib/LocalGL/Iwahori/ParahoricStructure` (`New.exists_row_reduction`, `New.exists_iwasawa_bruhat`,
`New.compactMean_diagGL_compactMean_diagGL`, `New.iwahoriHeckeHom`)

### 6.3 Twisted conjugacy in `I₁tI₁`

*Origin:* adapted from the published theory of `σ`-conjugacy classes in Iwahori double cosets: here for the pro-`p` Iwahori
subgroup of `GL_N`, a strictly dominant diagonal `t`, and conjugacy to `t` up to a diagonal element of `I₁`.

*Method of the formal proof:* successive approximation: an element of `I₁tI₁` is twisted-conjugated by elements of `I₁` into
the conjugates of `I₁` by increasing powers of `t`, which shrink towards the diagonal; compactness of `I₁` gives a cluster
point of the conjugating elements, and the closed conditions pass to it.

Let `σ` be a continuous ring endomorphism of `F` with `|σ(x)| = |x|` whose entrywise action on `GL_N(F)` is surjective
(`σ = id` is allowed), and `t` diagonal with `|t_0| < |t_1| < ⋯ < |t_{N−1}|`. For every `g ∈ I₁tI₁` there are `k ∈ I₁` and a
diagonal `d ∈ I₁` with `k^{−1}·g·σ(k) = t·d`.

*Needs:* 6.1.

[ShortProof], `Lib/LocalGL/Iwahori/ParahoricStructure` (`New.eventually_v_mul_pow_le_one`,
`New.eventually_pow_mul_mem_dominantTorus`, `New.exists_inv_mul_mul_map_eq_diagGL_mul`)

### 6.4 The quadratic relation, and injectivity of a `U_t`

*Origin:* adapted from the published theory of the Iwahori–Hecke algebra (the quadratic relation `(T_s − q)(T_s + 1) = 0`)
and of the injectivity of Iwahori-fixed vectors into the Jacquet module: here as an identity for linear forms invariant
under `I₁`, and as the injectivity of one `U_t` with `t` strictly dominant on `V^{I₁}`, for every smooth representation.

*Method of the formal proof:* the mean of `x` over `I₁` is computed, after `φ` and `ρ(s)`, as the average of the translates of
`x` by `1 + wE_{ab}` with `w` running over representatives of `𝓀`. For `w ∈ 𝔭`, `s(1 + wE_{ab})s^{−1} ∈ I₁` and the term is
`φ(ρ(s)x)`. For a unit `w`, `s(1 + wE_{ab}) = (1 + w^{−1}E_{ab})·d·(1 + w^{−1}E_{ba})` with `d` diagonal of the shape in (a): the left
factor lies in `I₁`, the right one fixes `x`, and the term is `c`. For the injectivity, the operators `U_t` with zero kernel form a
submonoid, so it is enough that each `U_{s_a}`, `s_a = diag(1, …, 1, ϖ^{−1}, …, ϖ^{−1})` (from position `a` on), is injective;
after a cyclic permutation `s_a` becomes an element that normalises `I₁`, and the vanishing of `U_{s_a}x` is carried across
transpositions by the quadratic relation with `c = 0`, removing one inversion at a time, until it says `x = 0`.

(a) Let `b = a + 1`, `s` the permutation matrix of the transposition of `a` and `b`, `φ` a linear map on `V` with
`φ(ρ(k)z) = φ(z)` for `k ∈ I₁`, and `x ∈ V` fixed by `1 + wE_{ba}` for every `w ∈ 𝒪`. If `φ(ρ(d)x) = c` for every diagonal
`d` with entry `−v^{−1}` at `a`, `v` at `b` and `1` elsewhere (`|v| = 1`), then `q·φ(ρ(s)e_{I₁}x) = φ(ρ(s)x) + (q − 1)·c`.

(b) There is a strictly dominant `t` such that `U_t` is injective on `V^{I₁}`.

(c) An exponent `ℓ` for `ξ` satisfies `ℓ∘e_{I₁} = ℓ`, `ℓ∘ρ(k) = ℓ` for `k ∈ I₁`, and `ℓ(ρ(t)z) = ξ(t)·ℓ(z)` for every diagonal `t` with
unit entries and every `z ∈ V`.

*Needs:* 6.1, 6.2.

[ShortProof], `Lib/LocalGL/Iwahori/QuadraticRelation` (`New.conj_monomial_mem_blockParahoric`, `New.quadratic_relation`,
`New.exists_iwahoriHeckeHom_injective`, `New.IsExponent.apply_compactMean`, `New.IsExponent.apply_proIwahori`,
`New.IsExponent.apply_diagGL_unit`, `New.IsExponent.apply_monomial_translate`)

### 6.5 Iwahori degrees, partial Hecke sums and Satake's formula

*Origin:* adapted from Macdonald (1979), chapter V, the Satake transform of the characteristic functions of double cosets of
`GL_n` over a nonarchimedean local field (as in LocalFactorsOfTwistsAndTypes §3.2): here only the cosets of
`diag(ϖ, …, ϖ, 1, …, 1)`, as the value of an exponent on the partial Hecke sums of a spherical vector, in stages, in the
unnormalised convention `|t_i|^{N−1−i}`.

*Method of the formal proof:* the operator of `I₁tI₁` on `V^{I₁}` is computed by listing its cosets by upper unitriangular
representatives. For the partial sums, a count of hyperplanes over the residue field, through the rows
`(0, …, 0, 1, ∗, …, ∗)` that kill a lattice, relates the sums for `r` and `r + 1`; on an exponent the translate by
`diag(1, …, ϖ, …, 1)` (at `r`) acts by `θ_r(ϖ)/q^{N−1−r}` on the vectors fixed by the parahoric subgroup that fixes the partial
sum, which gives the recursion `e_{j+1}(y_r, y_{r+1}, …) = e_{j+1}(y_{r+1}, …) + y_r·e_j(y_{r+1}, …)`; descending induction on
`r` from `r = N`.

Let `F` be a non-archimedean local field, `ρ` smooth.

(a) For `t ∈ T⁺` and `x ∈ V^{I₁}`, the Hecke operator of `I₁tI₁` sends `x` to `deg(t)·U_t x`, where
`deg(t) := ∏_{i<j} |t_j/t_i|` is the number of cosets in `I₁tI₁/I₁`.

(b) *Satake's formula, in stages.* Let `x ∈ V^{GL_N(𝒪)}`, `θ_0, …, θ_{N−1}` characters of `F^×`, `ℓ` an exponent for `ξ_θ`, and
`y_i := θ_i(ϖ)`. For `0 ≤ r ≤ N` and `j ≥ 0`: `ℓ(T_{r,j}x) = q^{−j(j−1)/2}·e_j(y_r, …, y_{N−1})·ℓ(x)`, `e_j` the elementary
symmetric function. For `r = 0` this is the value of `ℓ` on `T_j x`.

(c) *The hyperplane count.* For `x ∈ V^{GL_N(𝒪)}`, `0 ≤ r < N`, and every linear map `ψ` on `V` invariant under `ρ(k^{−1})` for
the `k` with `k^{−1} ∈ I₁` whose off-diagonal entries lie in row `r`:
`q^{N−1−r}·ψ(ρ(b_r)T_{r+1,j}x) = ψ(q^j·(T_{r,j+1}x − T_{r+1,j+1}x))`, `b_r` the diagonal matrix with `ϖ` at `r` and `1` elsewhere.

(d) *Duality.* For `x ∈ V^{GL_N(𝒪)}` and `r + i + j = N`, the partial sum `T_{r,j}` of the representation `g ↦ ρ(g^{−ᵀ})` sends `x`
to `ρ(c)T_{r,i}x`, `c` diagonal with entries `1` at the first `r` places and `ϖ^{−1}` at the others.

LocalFactorsOfTwistsAndTypes §3.2 (Macdonald's formula for every residue cardinality, as a corollary of
SmoothRepresentationsOfLocalGroups §SR.4.3a) gives the Satake transform of these double cosets in the Hecke algebra; passing
from it to (b) needs that an exponent factors through the Jacquet module, which is not stated there. The formal proof
proves (a)–(d) for `F` the completion of a number field at a finite place.

*Needs:* 6.1, 6.2, 6.4 (c); WeilRepresentationsOnBanachSpacesOfData §9.1 (basic double cosets, duality
`T_i ↔ T_{N−i}`).

[ShortProof], `Lib/LocalGL/Iwahori/HeckeDegrees` (`New.iwahoriDegree`, `New.heckeFun_iwahoriDoubleCoset_eq_iwahoriDegree_smul`,
`New.echelonRows`, `New.card_echelonRows_mem_residueKer`, `New.partialHecke_hyperplane_count`,
`New.IsExponent.apply_partialHecke`, `New.partialHecke_dual`)

### 6.6 Sorting exponents

*Origin:* adapted from the published theory of the exponents of the Jacquet modules of principal series representations of
`p`-adic groups: here for `GL_N` at pro-`p` Iwahori level, with exponents in the sense of 6.1: an exponent that is
nonzero on a suitable `I₁`-fixed vector can be permuted so that `|θ_i(ϖ)|` does not increase, and in a unitary representation
eigenvectors give exponents.

*Method of the formal proof:* if two adjacent characters are in the wrong order, the quadratic relation 6.4 (a) for that
transposition shows that the exponent with the two characters exchanged is nonzero at the translate of `x`; induction on the
number of inversions. For unitary `ρ`, the finite-dimensional space of `I₁`-fixed vectors of a cyclic span is stable under the
commuting operators `U_t` and their adjoints, so a joint eigenvector of the duals of the `U_t` exists at the eigenvalue of `y`, and
the invariant form turns it into an exponent. The last statement takes the eigenvectors along a sum over `GL_N(𝓀)` against
the Harish-Chandra induced character of the `χ_a∘det` (4.2 (e)).

Let `ρ` be smooth.

(a) Let `x ∈ V^{I₁}` be such that the diagonal matrices with unit entries act on `x` by a character `τ` (`ρ(t)x = τ(t)x`), and
such that every permutation matrix whose permutation `σ` satisfies `τ(ε e_i) = τ(ε e_{σ(i)})` for all units `ε` and all `i`
acts on `x` by a scalar (`ε e_i` the diagonal matrix with `ε` at `i` and `1` elsewhere). If `ℓ` is an exponent for `ξ_θ` with
`ℓ(x) ≠ 0`, there is a permutation `σ` such that some exponent for `ξ_{θ∘σ}` is nonzero at `ρ(σ^{−1})x` and
`i ↦ |θ_{σ(i)}(ϖ)|` does not increase.

(b) Let `x ∈ V` be any vector, let `ρ` carry an invariant positive definite hermitian form `B`, and let the `I₁`-fixed vectors
of the span `⟨ρ(GL_N(F))x⟩` form a finite-dimensional space. If this span contains an Iwahori eigenvector `y` for `ξ`, it
contains `w` with `B(w, w) ≠ 0` such that `B(w, ·)` is an exponent for `ξ`.

(c) Let `x ≠ 0` satisfy the hypotheses of (a), and let `ρ`, `B` and `x` satisfy those of (b). Then there are characters `θ_i`
such that some exponent for `ξ_θ` is nonzero at `x`, `θ_i(ε) = τ(ε e_i)` for units `ε`, and for some permutation `σ` the values
`|θ_{σ(i)}(ϖ)|` do not increase and the span of `x` contains an Iwahori eigenvector for `ξ_{θ∘σ}`.

(d) Let `ρ` be unitary as in (b) with finite-dimensional `I₁`-fixed vectors in every cyclic span, and let `x ∈ V` be any
vector fixed by the kernel of `GL_N(𝒪) → GL_N(𝓀)`. Let `χ_1, …, χ_s` be distinct characters of `𝓀^×`, `m_1 + ⋯ + m_s = N`,
`Y := (∏_a (χ_a∘det)|_{m_a})|_{GL_N(𝓀)}` (product `∗` of 4.1), `λ : GL_N(𝓀) → GL_N(𝒪)` a section of the reduction, and
suppose `Σ_{g∈GL_N(𝓀)} conj(Y(g))·ρ(λ(g))x ≠ 0`. Then the span of `x` contains an Iwahori eigenvector for some `ξ_θ` with `|θ_i(ϖ)|` non-increasing in `i`, and there is a labelling
`c : {0, …, N − 1} → {1, …, s}` taking each value `a` exactly `m_a` times with `θ_i(ε) = χ_{c(i)}(ε mod 𝔭)` for every unit `ε`.

*Needs:* 4.1, 4.2 (e), 6.1, 6.2, 6.4.

[ShortProof], `Lib/LocalGL/Iwahori/SortedExponents` (`New.IsExponent.apply_permGL_swap_diagGL_compactMean`,
`New.IsExponent.exists_sorted`, `New.IsIwahoriEigen.exists_isExponent`, `New.exists_sorted_isIwahoriEigen_of_diagGL_smul`,
`New.exists_sorted_of_detChar`)

### 6.7 Sorted unramified exponents are seen by spherical vectors

*Origin:* adapted from the published theory of the unramified principal series of `p`-adic groups: here, for
`GL_N` and exponents in the sense of 6.1, a nonzero exponent with unramified characters and non-increasing `|θ_i(ϖ)|` does not
vanish on the `GL_N(𝒪)`-fixed vectors; with ties between the `|θ_i(ϖ)|` allowed and no regularity or admissibility assumed. With
a statement on the Hecke operator of `diag(ϖ, 1, …, 1)` at level `I₁` on eigenvectors of the stabiliser of a line.

*Method of the formal proof:* by induction over the parahoric subgroups `P_{min(m,·)}`, whose columns before `m` lie in `𝔭` below
the diagonal: the mean over the next parahoric subgroup is written, on an `I₁`-invariant form, as an explicit sum over the
translates of `x` by the transpositions `(m j)` (orbit sums, counted by the last nonzero coordinate of residue vectors); the
sorting hypothesis makes the coefficients of these sums such that an exponent vanishing on the larger fixed space vanishes on
the smaller one; at `m = N` the fixed space is `V^{GL_N(𝒪)}`.

(a) Let `ρ` be smooth, `ℓ` an exponent for `ξ_θ` with every `θ_i` trivial on `𝒪^×` and `|θ_0(ϖ)| ≥ |θ_1(ϖ)| ≥ ⋯ ≥ |θ_{N−1}(ϖ)|`. If
`ℓ` vanishes on `V^{GL_N(𝒪)}`, then `ℓ = 0`.

(b) Let `P_1 := P_{min(1,·)}` (the `k ∈ GL_N(𝒪)` with `k_{i0} ∈ 𝔭` for `i ≠ 0`), `χ` a function on `F`, and
`V_χ := {z ∈ V^{I₁} : ρ(k)z = χ(k_{00})·z for all k ∈ P_1}`. Then `V_χ` is stable under the Hecke operator of
`I₁·diag(ϖ, 1, …, 1)·I₁`.

The formal proof proves (b) for `F` the completion of a number field at a finite place.

*Needs:* 6.1, 6.2, 6.4 (c), 6.5 (a).

[ShortProof], `Lib/LocalGL/Iwahori/SphericalExponents` (`New.sum_by_last_nonzero_coord`, `New.exists_compactMean_and_swap_eq_sum`,
`New.Patching.parahoricEigenspace`, `New.Patching.parahoricEigenspace_mem_invtSubmodule`,
`New.IsExponent.eq_zero_of_apply_permGL_swap_eq_zero`, `New.IsExponent.eq_zero_of_eq_zero_on_spherical`)

### 6.8 Chains of roots of the Hecke polynomial of a spherical vector

*Origin:* adapted from the published theory of the unitary dual of the general linear groups over `p`-adic fields (the
classification by segments, and the inequality at the ends of segments): here, without any classification and without
irreducibility, for the roots of the Hecke polynomial of one spherical eigenvector in a smooth representation with an
invariant positive definite form: a lower bound for the top root of a chain, the chain property, and an orthogonality at pro-`p`
Iwahori level in which only the top root of a chain survives.

*Method of the formal proof:* two counts of hyperplanes over the residue field (6.5 (c)) express `T_j x` through the operator `U`
of `diag(ϖ, 1, …, 1)` at level `I₁` and partial sums; positivity of the form along the vectors so obtained gives `|c|² ≥ q^{N−2}`
for a root `c` with `qc` not a root. Unitarity and the duality of `T_j` and `T_{N−j}` make the roots stable under `y ↦ q^{N−1}/ȳ`,
which with the bound gives the chains. The same counts let the roots of a chain below the top one be cancelled one at a time
against `x`.

Let `E` be a number field, `w` a finite place with residue field of `q` elements, `F = E_w`, `N ≥ 1`, `ρ` a smooth representation of
`GL_N(F)` on `V` with a positive definite hermitian form `B` invariant under `ρ`, and `x ≠ 0` in `V^{GL_N(𝒪)}` with `T_j x = t_j x`
for `0 ≤ j ≤ N`; `P := P_x`. Let `U` be the Hecke operator of `I₁·diag(ϖ, 1, …, 1)·I₁`.

(a) If `P(c) = 0` and `P(qc) ≠ 0`, then `|c|² ≥ q^{N−2}`.

(b) If `P(c) = 0` and `|c|²·q^k = q^N`, then `c, cq, …, cq^{k−1}` are roots of `P`.

(c) Let `d ≠ 0`, `k ≥ 0` and `R ∈ ℂ[X]`, and suppose `P(X/d) = ∏_{i=0}^{k}(X − q^i)·S(X)` with `S` dividing `R` (so `c, cq, …, cq^k` are roots
of `P` for `c = 1/d`). Then `B(x, ((dU − q^k)·R(dU))y) = 0` for every `y ∈ V^{I₁}`.

LocalFactorsOfTwistsAndTypes §3.4 and §7.2 (i) bound the Satake parameters of a
spherical vector of a unitary representation in an annulus (`Q^{−(n−1)/2} ≤ |α_i| ≤ Q^{(n−1)/2}`); they give neither
the bound (a) at the top of a chain nor (b) or (c).

*Needs:* 6.1, 6.5 (c), (d); AuxiliaryAlgebraAndAnalysisForThetaLifts §2.2 (b) (adjoints of spherical Hecke operators);
WeilRepresentationsOnBanachSpacesOfData §9.1 (b) (duality `T_i ↔ T_{N−i}`). The library's `TauCeti.glnHeckePolynomial` is
the same formal polynomial as `P_x`.

[ShortProof], `Lib/LocalGL/SphericalChainLemma` (`New.Patching.HasRootChain`, `New.Patching.chain_lemma_of_adjoint`,
`New.Patching.chain_lemma`, `New.Patching.le_norm_sq_of_isRoot_of_not_isRoot_mul`, `New.Patching.isRoot_chain_of_norm`,
`New.Patching.pairing_aeval_heckeCoset_eq_zero`)

## Results taken from other roadmaps

- The module `∇_ℤ(ν)` of one `GL_N` is free and spanned by the bideterminants of the column-strict fillings, so that the Weyl
  lattice `W_ℤ = Hom(∇_ℤ, ℤ)` is a direct summand of the integral tensors (for products over places, applied over the
  polynomial ring in the variables of the other places): IntegralWeylModulesOfGeneralLinearGroups §0.1 (third and fourth
  items). Used in 2.1.

## What the library already provides

- Jacobi's identity for the complementary minors of a matrix with invertible determinant and of its inverse:
  `Matrix.det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`
  (`TauCeti/LinearAlgebra/Matrix/Determinant/ComplementaryMinor.lean`). Used in 3.1.
- A virtual character of norm one of a finite group, over `ℂ`, is an irreducible character or the negative of one:
  `TauCeti.exists_eq_irreducibleCharacter_or_neg`, on the virtual characters `TauCeti.virtualCharacters`
  (`TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean`). Used in 5.1.
