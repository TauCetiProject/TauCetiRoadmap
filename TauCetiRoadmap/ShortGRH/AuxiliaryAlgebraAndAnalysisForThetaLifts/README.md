# Auxiliary algebra and analysis for theta lifts

**Summary.** This roadmap states the auxiliary results of general algebra, linear algebra and analysis that the
other roadmaps of the family `ShortGRH` use, that are targets in their own right, and that neither Mathlib nor the
Tau Ceti library states in the form needed. They are independent of one another and of the data of the argument.

The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane free of zeros
of Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for the covolume of
a lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The formal proof uses the results here at
scattered places of that comparison and of its background:

- Amitsur's theorem (1.1) puts the characteristic polynomials of a matrix representation over the base ring in
  Ribet's method (CongruencesOfTwistedThetaLifts, congruences to first order).
- The statement on multiplicative functions of finite modules (1.2) gives the exact cocycle counts that replace
  duality and the Greenberg–Wiles formula (IdelicReciprocityCountsAndCyclotomicClassGroups).
- The weighted Combinatorial Nullstellensatz with multiplicity (1.3) enters the bound for the elementary divisors of
  a Hecke operator (CompositeThetaLiftsAndShortForms).
- Auerbach's lemma for a compact family of linear forms (2.1) gives bases with bounded coordinates for the stable
  lattices of ℓ-adic representations (GaloisRepresentationsOfUnitaryEigenforms, SelmerBoundsForAnticyclotomicTwists).
- Gelfand's trick for `GL_n` over a valuation ring (2.2) makes the Hecke operators at split places commute and gives
  their adjoints (WeilRepresentationsOnBanachSpacesOfData, IntegralRepresentationsOfGeneralLinearGroups,
  GaloisRepresentationsOfUnitaryEigenforms).
- The complex Gaussian integral for accretive matrices (3.1) normalises the Fock model of the Weil representation
  (WeilRepresentationsOnBanachSpacesOfData) and enters Gauss sums of good reduction
  (AbelianSchemesWithThetaStructuresAndTheirCohomology).
- Hua's integral bound (3.2) enters the bound for the remaining terms of the second moment at one real place
  (RemainingAndMainTermsOfSecondMoments).

There are three layers. Layer 1 is algebra (1.1–1.3), Layer 2 linear algebra and Hecke operators (2.1, 2.2), Layer 3
analysis (3.1, 3.2). The two sections before the references list the auxiliary results of the shorter proof that
other roadmaps state, and those that the library already provides.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line, and every name on that line is
  a declaration of [ShortProof], also where it lies outside its namespace `New` (such as `Matrix.IsAccretive` in 3.1).
- *Modest statements.* Where a general section of another roadmap also implies a statement here, the section says so
  in a closing sentence. The statement here is the case that the family uses, and it has a proof that does not pass
  through the general theorem.
- *Data of the argument.* The letters that OneSidedPrimeSumBoundsAndAdmissibleData fixes for the data of the argument
  do not occur here. Each section fixes its own notation, with the conventions below.

### Table of symbols

| Symbol | Meaning |
|---|---|
| `Aᴴ`, `x*` | the conjugate transpose of a complex matrix `A`, of a column vector `x` |
| `H ≥ 0`, `H > 0` | `H` is hermitian positive semidefinite, positive definite |
| `dx` on `ℂ^n` | Lebesgue measure on `ℂ^n`, identified with `ℝ^{2n}` by real and imaginary parts |
| `M_{m×n}(R)`, `M_n(R)` | matrices over a ring `R` |
| `χ_A(X)` | the characteristic polynomial `det(X − A)` of a square matrix `A` |
| `𝔪_z` | in 1.3, for a field `K` and a point `z ∈ K^ι`, the ideal of the polynomials over `K` that vanish at `z` |
| `cost_κ(α)` | for weights `κ : ι → ℤ_{>0}` and a monomial `X^α`, the weighted degree `Σ_u α_u/κ_u` |
| `R[Δ]`-module | for a group `Δ` and a commutative ring `R`, an `R`-module with an `R`-linear action of `Δ` |
| `O`, `K = GL_n(O)` | in 2.2, a valuation ring of a field `F`, and the subgroup of `GL_n(F)` of matrices that have, with their inverse, all entries in `O` |
| `T_f` | the Hecke operator of a function `f` on `GL_n(F)`, defined in 2.2 |
| `ᵗg` | the transpose of a matrix `g` |

## Layer 1: Algebra

### 1.1 Amitsur's theorem on characteristic polynomials over the base ring

*Origin:* adapted from Amitsur's theorem on the characteristic polynomial of a sum of matrices (Amitsur, *On the
characteristic polynomial of a sum of matrices*, 1980; Chenevier, *The p-adic analytic space of pseudocharacters of a
profinite group and pseudorepresentations over arbitrary rings*, 2014, (1.5)): here, the integrality consequence for a
homomorphism of an algebra to matrices, tested on a spanning set.

*Method of the formal proof:* for (a), a polynomial `Q` over `B` lifting the characteristic polynomial of `ρ(−w)`
gives, through the Cayley–Hamilton theorem, `F = Q(0)` and `v` as the value at `−w` of `(Q − Q(0))/X`. For (b), the
coefficients of `χ_{ρ(w)}` are those of the reversed polynomial `det(1 − t·ρ(w))`, so it suffices that this
determinant, taken in `A[t]` modulo a power of `t` beyond the coefficient wanted, comes from `B[t]`. Writing `w` as a
combination of spanning elements `s`, the matrix `1 − t·ρ(w)` is a product of matrices `1 − t^j·c·ρ(s)` (`j ≥ 1`,
`c` from `B[t]`), whose determinants come from `B[t]`, up to corrections of higher order in `t`; a downward induction
on that order disposes of the corrections.

Let `B` be a commutative ring, `A` a commutative `B`-algebra, `Λ` a `B`-algebra (associative and unital, not
necessarily commutative) and `ρ : Λ → M_n(A)` a homomorphism of `B`-algebras. Call `w ∈ Λ` *integral for `ρ`* if every
coefficient of `χ_{ρ(w)}` lies in the image of `B → A`.

(a) If `w` is integral for `ρ`, there are `v ∈ Λ` and `F ∈ B` such that `det ρ(w)` is the image of `F` and
`ρ(v)ρ(w) = ρ(w)ρ(v) = F·1`.

(b) If `Λ` is spanned as a `B`-module by elements that are integral for `ρ`, then every element of `Λ` is integral
for `ρ`.

The formal proof proves the case of (a) in which every element of `Λ` is integral for `ρ`; its argument uses this
only for `−w`, which is integral for `ρ` when `w` is, since the coefficients of `χ_{ρ(−w)}` are those of `χ_{ρ(w)}`
up to sign.

The applications take spanning sets that are closed under multiplication (matrices over `Λ` with a single non-zero
row, products of constants with powers of a variable, the elements of a group); for such spanning sets (b) also
follows from Amitsur's formula for determinants and the descent of a determinant to the subring of its
coefficients, IntegralHeckeAndGaloisDeterminants §0.5.

*Needs:* Mathlib `Matrix.charpoly`, `Matrix.aeval_self_charpoly` (the Cayley–Hamilton theorem),
`Matrix.reverse_charpoly`, `AdjoinRoot` (the quotient `A[t]/(t^e)`).

[ShortProof], `Lib/General/LinearAlgebra/Eigenvalues` (`New.exists_adjugate_of_charpoly_mem`,
`New.amitsur_charpoly_mem_of_span`)

### 1.2 Multiplicative functions of finite modules that are trivial on projective modules

*Origin:* adapted from the finiteness of the cokernel of the Cartan map of a group algebra in positive
characteristic (Serre, *Linear Representations of Finite Groups*, 1977, Theorem 35): here, a form for functions with
values in `ℚ_{≥0}` that are multiplicative in exact sequences, on the finite modules killed by `ℓ` on which a central
element fixes no non-zero vector, with projectivity read through Higman's criterion.

*Method of the formal proof:* a dévissage through permutation modules, in place of Brauer characters and of the
induction from cyclic subgroups by which Milne, *Arithmetic Duality Theorems*, I 2.10–2.12, treats the local Euler
characteristic. The group is first replaced by its quotient `Δ̄` by the subgroup generated by a power of `z` whose
order is prime to `ℓ`, a normal subgroup as `z` is central. For a finite `Δ̄`-set `Y`, the module of maps `Y → M`
with the diagonal action again lies in `𝒞`, and `φ` of it is the product over the orbits of `Y`. The two affine
hyperplanes of `(ℤ/ℓ)^{Δ̄}` on which the coordinates sum to `0` and to `1` carry the same linear part of the action,
so their function modules have the same value of `φ`; those of the second satisfy Higman's criterion. An induction
over the subgroups `H` of `Δ̄` then gives `φ = 1` on the maps from every orbit `Δ̄/H`, and `M` is the module of maps
from a point.

Let `Δ` be a finite group, `z ∈ Δ` a central element, `ℓ` a prime and `R` a commutative ring. Let `𝒞` be the class of
the finite `R[Δ]`-modules `M` with `ℓM = 0` on which `z` fixes no non-zero vector; if `0 → M′ → M → M″ → 0` is an
exact sequence of `R[Δ]`-modules with `M ∈ 𝒞`, then `M′` and `M″` lie in `𝒞`. Say that `P ∈ 𝒞` satisfies Higman's
criterion if some additive map `τ : P → P` has `Σ_{g∈Δ} g∘τ∘g⁻¹ = id_P`. (Higman's criterion is the classical test
for `P`, a module over `𝔽_ℓ[Δ]` with `𝔽_ℓ = ℤ/ℓ`, to be projective over `𝔽_ℓ[Δ]`; the statement below uses the
condition on `τ` as written.)

Let `φ` assign to every `M ∈ 𝒞` a number `φ(M) ∈ ℚ_{≥0}` such that `φ(M) = φ(M′)·φ(M″)` for every exact sequence
`0 → M′ → M → M″ → 0` of `R[Δ]`-modules with `M ∈ 𝒞`. If `φ(P) = 1` for every `P ∈ 𝒞` that satisfies Higman's
criterion, then `φ(M) = 1` for every `M ∈ 𝒞`.

The formal proof states this for a compact topological group `G`, an open normal subgroup `U` and an element `z ∈ G`
whose commutators with all elements of `G` lie in `U`, on the discrete `R`-linear `G`-modules (as in
IdelicReciprocityCountsAndCyclotomicClassGroups §3.1) on which `U` acts trivially, with Higman's criterion summed over
representatives of `G/U`; this is the statement above for `Δ = G/U`. The library has the Cartan map
(`TauCeti.cartanMap`) and Artin's induction identity in the Grothendieck group of a group algebra
(`TauCeti.natCard_nsmul_eq_sum_artinCoeff_indK0_resK0`), not the finiteness of the cokernel.
The statement also follows from the non-singularity of the Cartan matrix over a splitting field,
RepresentationTheory/ModularCharactersAndBlocks §3.1, applied to the composition factors.

*Needs:* Mathlib `QuotientGroup.mk` (quotients of groups), `Representation` (`R[Δ]`-modules), `ZMod`.

[ShortProof], `Lib/General/Algebra/CartanMap` (`New.DiscreteModule.IsHigmanProjective`,
`New.DiscreteModule.FiniteKilledFixedInj`, `New.DiscreteModule.IsMultiplicative`,
`New.DiscreteModule.IsMultiplicative.eq_one_of_eq_one_on_isHigmanProjective`)

### 1.3 The weighted Combinatorial Nullstellensatz with multiplicity

*Origin:* adapted from the Combinatorial Nullstellensatz and its forms with multiplicity (Alon, *Combinatorial
Nullstellensatz*, 1999; Ball and Serra, *Punctured combinatorial Nullstellensätze*, 2009): here, with a weight `1/κ_u`
for each variable, total degree replaced by the weighted degree, and in place of a grid any set of at least `∏ κ_u`
points at which each `X_u^{κ_u}` agrees with a polynomial of weighted degree below `1`.

*Method of the formal proof:* a dimension count for jets. The polynomials `ψ_u = X_u^{κ_u} − g_u` vanish at every
`z_t`, and replacing `X_u^{κ_u}` by `ψ_u + g_u` lowers the cost; so, by well-founded induction on the cost, every
polynomial of cost `< d` is a linear combination of products `X^α·ψ^γ` with all `α_u < κ_u` and `|γ| < d`, and
every polynomial at all is such a combination plus one whose jets of order `< d` vanish at all the `z_t`. By the
Chinese remainder theorem the jets of order `< d` at the `#T` distinct points take all values, and since
`#T ≥ ∏ κ_u` there are at least as many jet coordinates as products. Hence the jets of the products are linearly
independent, and a polynomial of cost `< d` whose jets vanish is `0`.

Let `K` be a field, `ι` a finite set, `κ : ι → ℤ_{>0}` and `cost(α) = cost_κ(α) = Σ_{u∈ι} α_u/κ_u` for exponents
`α ∈ ℕ^ι`. Let `(z_t)_{t∈T}` be a finite family of pairwise distinct points of `K^ι` with `#T ≥ ∏_{u∈ι} κ_u`, and for
each `u ∈ ι` let `g_u ∈ K[X_u : u ∈ ι]` be a polynomial all of whose monomials have cost `< 1`, with
`g_u(z_t) = (z_t)_u^{κ_u}` for every `t ∈ T`. Let `d ≥ 0` be an integer and let `f ≠ 0` be a polynomial with
`f ∈ 𝔪_{z_t}^d` for every `t ∈ T`. Then some monomial `X^α` with non-zero coefficient in `f` has `cost(α) ≥ d`.

The hypotheses force `#T = ∏ κ_u`: modulo the ideal generated by the polynomials `X_u^{κ_u} − g_u`, which vanish at
all the `z_t`, every polynomial is congruent to a combination of the monomials with all `α_u < κ_u`, and evaluation at
distinct common zeros is onto `K^T` on that quotient. For a grid `∏_u S_u` with `#S_u = κ_u` one may take
`g_u = X_u^{κ_u} − ∏_{s∈S_u}(X_u − s)`. Mathlib has the multiplicity-free theorem on grids
(`MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`), which does not give this statement.

*Needs:* Mathlib `MvPolynomial`, `Finsupp.weight` (weighted degree of an exponent), `MvPolynomial.vanishingIdeal`.

[ShortProof], `Lib/General/Algebra/MultivariatePolynomials` (`New.exists_le_weight_of_mem_vanishingIdeal_pow`)

## Layer 2: Linear algebra and Hecke operators

### 2.1 Auerbach's lemma for a compact family of linear forms

*Origin:* adapted from the published theory of Auerbach bases of finite-dimensional normed spaces: here, for a
compact family of linear forms over any field, measured through a ring homomorphism into a normed field.

*Method of the formal proof:* the classical argument by a determinant of largest size. Against a fixed basis of
`U`, the norm of `φ` of the determinant of `n` forms of the family is a continuous function of their indices on the
compact space `𝒜^n`; it attains its maximum, which is positive because the forms span the dual space. The forms at a
maximising tuple are a basis of the dual space, and `z` is the basis dual to it. Cramer's rule expresses each value
`ℓ_a(z_k)` as a quotient of two such determinants whose denominator is the largest one, so the bound follows.

Let `U` be a vector space of finite dimension `n` over a field `K`, `𝒜` a compact topological space and
`(ℓ_a)_{a∈𝒜}` a family of linear forms on `U` whose only common zero is `0`. Let `φ : K → L` be a ring homomorphism
into a normed field `L` such that `a ↦ φ(ℓ_a(v))` is continuous on `𝒜` for every `v ∈ U`. Then there are
`a_1, …, a_n ∈ 𝒜` and a basis `z_1, …, z_n` of `U` such that `ℓ_{a_1}, …, ℓ_{a_n}` is the dual basis of `(z_k)`, that is
`ℓ_{a_j}(z_k) = δ_{jk}`, and `‖φ(ℓ_a(z_k))‖ ≤ 1` for all `a ∈ 𝒜` and all `k`.

For `K = L = ℝ` or `ℂ` and the unit sphere of the dual of a norm on `U` this is Auerbach's lemma. The library has a
real affine analogue (`IsCompact.exists_affineBasis_abs_coord_le_one`), which does not give the statement over other
fields.

*Needs:* Mathlib `Module.Basis.dualBasis`, `Module.Basis.det`, `Module.Basis.det_smul_mk_coord_eq_det_update`
(Cramer's rule), `Continuous.exists_forall_ge'` (maximum on a compact space).

[ShortProof], `Lib/General/LinearAlgebra/MatrixNormBounds` (`New.exists_auerbach`)

### 2.2 Gelfand's trick for `GL_n` over a valuation ring

*Origin:* adapted from the commutativity of the spherical Hecke algebra of `GL_n` (Gelfand's trick, by the
transpose; Tits, *Reductive groups over local fields*, Corvallis 1979, 3.3.3; Tamagawa, *On the zeta functions of a
division algebra*, 1963): here, for `GL_n` over any field with a valuation ring, as operators on fixed vectors of any
representation over a commutative semiring.

*Method of the formal proof:* everything rests on the automorphism `g ↦ ᵗg⁻¹` of `G`, which preserves `K`. For (a),
elimination with pivots over `O` (for non-zero `a, b ∈ F`, `a/b` or `b/a` lies in `O`) gives `g = k·D·k′` with
`k, k′ ∈ K` and `D` diagonal, and `D` is its own transpose. By (a) the automorphism carries each double coset `KgK`
to `Kg⁻¹K`; it also permutes the cosets `gK`, and reindexing the sum that defines `T′_{f^∨}` along it, together with
the invariance of `β`, gives (b). For (c), each composite of two Hecke operators acts on `W^K` as the operator of a
convolution of `f` and `f′`, and a bijection of `G/K` made from the same automorphism matches the terms of the two
convolutions.

Let `F` be a field, `O` a valuation ring of `F`, `n ≥ 1`, `G = GL_n(F)` and `K = GL_n(O)`. Let `A` be a commutative
semiring, `π` a representation of `G` by `A`-linear maps of an `A`-module `W`, and `W^K` the vectors fixed by `K`. Call
`f : G → A` a *Hecke function* if `f(kgk′) = f(g)` for all `k, k′ ∈ K` and `f` vanishes outside finitely many cosets
`gK`. For a Hecke function `f` and `v ∈ W^K` put `T_f v = Σ_{gK∈G/K} f(g)·π(g)v`, a finite sum that does not depend on
the representatives and lies in `W^K`.

(a) For every `g ∈ G`, `ᵗg ∈ KgK`.

(b) Let `σ` be a ring endomorphism of `A`. If `f` is a Hecke function, so is `f^∨(g) = σ(f(g⁻¹))`. If `π′` is a second
representation of `G` on an `A`-module `W′`, with Hecke operators `T′`, and `β : W × W′ → Z`, with values in an
`A`-module, is `σ`-semilinear in the first variable, `A`-linear in the second and invariant under `G`, then
`β(T_f v, v′) = β(v, T′_{f^∨} v′)` for all `v ∈ W^K` and `v′ ∈ W′^K`.

(c) For Hecke functions `f, f′` and `v ∈ W^K`, `T_f(T_{f′}v) = T_{f′}(T_f v)`.

Over a non-archimedean local field and with `A = ℂ`, (c) also follows from the commutativity of the spherical Hecke
algebra, AutomorphicFormsOnReductiveGroups §3.5, through the Satake transform. The library has the abstract
criterion that a Hecke ring is commutative when an anti-involution fixes every double coset
(`HeckeCosetModule.mul_comm_of_antiInvolution`), with its instance for `SL_n(ℤ)` and the integral matrices of
positive determinant in `GL_n(ℚ)` (`HeckeRing.GLn.commSemiringHeckeRing`), and the Smith normal form over a discrete
valuation ring (`Matrix.exists_smith_normal_form_of_isDiscreteValuationRing`); its Hecke pairs ask finite coset
decompositions of the double cosets, which a general valuation ring does not give, so the local instance and the
passage to operators on fixed vectors are missing. On Tau Ceti's main branch, later than the revision pinned here:
the instance for `GL_n(ℤ) ⊂ GL_n(ℚ)` (`HeckeRing.GLn.mul_comm_fullHeckeRing`).

*Needs:* Mathlib `ValuationSubring`, `Matrix.GeneralLinearGroup`, `Representation`.

[ShortProof], `Lib/General/LinearAlgebra/IntegralLattices` (`New.IsValuationPair.smith_normal_form`,
`New.isValuationPair_valuationSubring`, `New.exists_invTransposeGL_inv_eq`, `New.IsHeckeFunction.heckeFun_adjoint`,
`New.IsHeckeFunction.heckeFun_comm`)

## Layer 3: Analysis

### 3.1 The complex Gaussian integral for accretive matrices

*Origin:* adapted from the published theory of Gaussian integrals on `ℂ^n`: here, for a matrix with positive definite
hermitian part, not necessarily hermitian, and a shift on one side of the quadratic form.

*Method of the formal proof:* (a) comes from the Ostrowski–Taussky inequality for `H = A + Aᴴ`. (b) is reduced to
one complex variable. Writing `A + Aᴴ = CᴴC` and diagonalising the skew-hermitian part of `A` by a matrix that is
unitary for the inner product of `A + Aᴴ` makes `A` congruent to a diagonal matrix: `A = Pᴴ·diag(d)·P` with `P`
invertible and `Re d_i > 0`. After the linear substitution by `P`, whose real Jacobian is `|det P|²`, the integral
splits into `n` integrals over `ℂ`, each a Gaussian integral on `ℝ²` with value `π/d_i`, and
`det A = |det P|²·∏ d_i`.

Let `A ∈ M_n(ℂ)` be accretive, that is, `A + Aᴴ > 0`.

(a) `det A ≠ 0`.

(b) For every `a ∈ ℂ^n` the function `x ↦ exp(−x*A(x − a))` is integrable on `ℂ^n` and
`∫_{ℂ^n} exp(−x*A(x − a)) dx = π^n·(det A)⁻¹`.

Part (a) also has a direct proof: if `Ax = 0`, then `x*(A + Aᴴ)x = 2·Re(x*Ax) = 0`, so `x = 0`. The library has
the integral for a hermitian positive definite matrix in the form of the density of a proper complex Gaussian
distribution (`TauCeti.Probability.integral_properComplexGaussianPDFReal_eq_one`), with a shift on both sides and a
real integrand, which does not give (b) for a matrix that is not hermitian.

*Needs:* EigenvalueAndSingularValueInequalities §4.2 (the Ostrowski–Taussky inequality), only for (a) along the route
of the formal proof; Mathlib `GaussianFourier.integral_cexp_neg_mul_sum_add` (the Gaussian integral on `ℝ²`),
`MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar` (Lebesgue measure under linear maps),
`MeasureTheory.integral_fintype_prod_volume_eq_prod` (products of integrals).

[ShortProof], `Lib/General/Analysis/GaussianIntegral` (`Matrix.IsAccretive`, `Matrix.IsAccretive.det_ne_zero`,
`New.Fock.integral_gauss`)

### 3.2 Hua's bound for integrals of negative powers of determinants

*Origin:* adapted from Hua's integrals over the classical domains (Hua, *Harmonic Analysis of Functions of Several
Complex Variables in the Classical Domains*, AMS, 1963): here, an upper bound, not an evaluation, with an affine change
of the rows.

*Method of the formal proof:* (a) peels off one row at a time, by induction on `s`. Fixing one row and integrating
over the others first, the fixed row joins `M`, which stays positive definite, and `r` goes up by one, so the
induction hypothesis bounds the inner integral by a constant times `|det(M + wᴴw)|^{−(r+1)}`. This leaves an integral
over one row: with `M = CᴴC` and the linear substitution that turns `w` into `yC`, the matrix determinant lemma gives
`|det(M + wᴴw)| = |det C|²·(1 + |y|²)`, and since `r ≥ k` the integrand is at most a constant times
`(1 + |y|²)^{−(k+1)}`, whose integral over `ℂ^k` is `π^k/k!` by the Gamma integral and the Gaussian integral. (b)
applies (a) to all the rows with `S = 1`, `a = 0` and `r = #κ`, after the linear change of variables `X ↦ SX + c`
(real Jacobian `|det S|^{2#κ}`), and uses `π^k/k! ≤ 1` for `k ≥ 7`.

(a) Let `k ≥ 0`, `M ∈ M_k(ℂ)` with `M > 0`, `S ∈ M_k(ℂ)` invertible, `γ ≥ 0` and `r ≥ k` an integer. Let `s` be a finite
set and `(a_i)_{i∈s}` row vectors in `ℂ^k`, and for row vectors `y_i ∈ ℂ^k` put `w_i = y_iS + a_i`. Then

`∫_{(ℂ^k)^s} γ·|det(M + Σ_{i∈s} w_iᴴw_i)|^{−(#s + r)} ∏_{i∈s} dy_i ≤ γ·(π^k/(k!·|det S|²))^{#s}·|det M|^{−r}`.

(b) Let `ι`, `κ` be finite sets with `#κ ≥ 7`, `G ∈ M_κ(ℂ)` with `G > 0`, `S ∈ M_ι(ℂ)` invertible, `c ∈ M_{ι×κ}(ℂ)` and
`γ ≥ 0`. Then

`∫_{M_{ι×κ}(ℂ)} γ·|det(G + (SX + c)ᴴ(SX + c))|^{−(#κ + #ι)} dX ≤ γ·|det S|^{−2#κ}·|det G|^{−#κ}`,

`dX` Lebesgue measure on `M_{ι×κ}(ℂ) = ℂ^{ι×κ}`.

The bound `#κ ≥ 7` in (b) cannot be dropped: for one row (`#ι = 1`), `G = 1`, `S = 1` and `c = 0` the integral in (b)
is `γ·π^{#κ}/#κ!`, which exceeds `γ` when `γ > 0` and `1 ≤ #κ ≤ 6` (at `#κ = 6`, `π^6/6! ≈ 1.34`).

*Needs:* Mathlib `MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar` (Lebesgue measure under linear maps),
`Real.integral_rpow_mul_exp_neg_mul_Ioi`, `Real.Gamma_nat_eq_factorial` (the Gamma integral),
`GaussianFourier.integral_rexp_neg_mul_sq_norm` (the Gaussian integral on `ℂ`),
`MeasureTheory.lintegral_eq_lmarginal_univ` (iterated integrals over the rows),
`Matrix.det_one_add_replicateCol_mul_replicateRow` (the matrix determinant lemma),
`CStarAlgebra.isStrictlyPositive_iff_eq_star_mul_self` (positive definite as `CᴴC`). The integral
`∫_{ℂ^k} (1 + |y|²)^{−(k+1)} dy = π^k/k!` is part of this section.

[ShortProof], `Lib/General/Analysis/HolomorphicIntegrals` (`New.lintegral_norm_det_add_vecMulVec_inv_pow_le`,
`New.hua_integral_le`, `New.lintegral_norm_det_add_inv_pow_le`)

## Results taken from other roadmaps

- The Ostrowski–Taussky inequality, in the form `|det H| ≤ 2^n·|det Θ|` for complex `n × n` matrices with `H ≥ 0` and
  `Θ + Θᴴ − H ≥ 0`: EigenvalueAndSingularValueInequalities §4.2 (`det H ≤ |det A|` for `A` with positive semidefinite
  hermitian part `H`), with the monotonicity of the determinant on positive semidefinite matrices.
- The integrality of the exponential of a power series without constant term whose coefficients have valuation at
  least `1/(p − 1)`, over `ℂ_p`, in several variables: RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups
  §4.1 (c), at radius `0`.
- An integral point of `ℚ̄_ℓ^m` at which each of finitely many polynomials over `ℚ̄_ℓ` takes a value at least as large
  as each of its coefficients: RestrictedPowerSeries §2.4 (maximum principle), applied to the product of the
  polynomials over a finite extension of `ℚ_ℓ` that contains their coefficients, with the multiplicativity of the
  Gauss norm of RestrictedPowerSeries §1.1.
- The identity `Σ_{U≤W} (−X)^{dim U} q^{dim U(dim U−1)/2} = ∏_{l<dim W}(1 − q^lX)` over the subspaces of a subspace
  `W` of `𝔽_q^n`, which combines the `q`-binomial theorem with the number of subspaces of a given dimension:
  ArithmeticStatisticsPartIV §3.2, which states both ingredients (both are on Tau Ceti's main branch, see the end of
  the next list).
- For an integral scheme with a projective embedding over a field and its base change to a noetherian ring, the
  monomials of degree `m` span the sections of the `m`-th power of the line bundle for all large `m`: GroebnerGeometry
  §4.10, on the library's projective schemes and line bundles.
- Embeddings into `ℂ` extending an embedding of a countable ring, and isomorphisms `ℂ ≅ L` for algebraically closed
  `L` of the cardinality of `ℂ` matching two embeddings: DeligneWeightsAndPurity §0.5 (i), (ii), through the fraction
  field.
- For finitely many groups `G_v` with subgroups `H_v`, the index of `∏_v H_v` in `∏_v G_v` is `∏_v [G_v : H_v]`:
  AdelicAlgebraicGroups §4.4 (index of product subgroups), with Mathlib's `Subgroup.index_pi` for one ambient group.
- Absolutely integrally closed rings: the definition, fields, quotients and localisations: ArcTopologyAndDescent §0.1.
- Polar decomposition `g = kz` in the unitary group of a diagonal sign form (existence): RepresentationTheory/LieGroups
  §9.2, the general Cartan decomposition applied to this group, realified as a closed subgroup of `GL_{2n}(ℝ)` stable
  under transpose; the group is not one of the matrix applications that section works out.
- The Cauchy–Binet formula for `det(AX)`, `A` of size `k × I` and `X` of size `I × k`: PadicMeasuresIwasawaAlgebras §6.4.

## What the library already provides

- The mean value property of holomorphic functions on a disc, and entire functions determined by their Taylor
  series at `0`: `DiffContOnCl.circleAverage`, `Complex.taylorSeries_eq_of_entire'`.
- Dirichlet's `S`-unit theorem and a class number bound stronger than `h ≤ (2^n·|d|)^{n+1}`:
  `TauCeti.finrank_sUnits_numberField`, `Set.unit_fg_of_units`, `NumberField.classNumber_le_bound`.
- Line bundles on schemes, their Picard group and triviality over local rings:
  `TauCeti.AlgebraicGeometry.LineBundleClass`,
  `TauCeti.AlgebraicGeometry.LineBundleClass.subsingleton_spec_of_isLocalRing`.
- The chain rule for substitution in multivariate power series, and Legendre's bounds for `v_p(n!)` and `‖n!‖`:
  `MvPowerSeries.pderiv_subst`, `Nat.Prime.sub_one_mul_multiplicity_factorial`, `Padic.rpow_neg_div_le_norm_factorial`.
- Degree against order for multivariate power series, and continuity of partial derivatives for the coefficientwise
  topology: `MvPowerSeries.degree_le_order_prod_pow`, `MvPowerSeries.WithPiTopology.continuous_pderiv`.
- The Frobenius on power series in characteristic `p` and `(Σ f_i)^{p^n} = Σ f_i^{p^n}`: `PowerSeries.map_frobenius_expand`,
  `sum_pow_char_pow`.
- The bialternant formula for Schur polynomials: `TauCeti.diagramSchurPoly_mul_alternant`.
- Extension of scalars of commutative algebras is left adjoint to restriction: `CommAlgCat.extendRestrictScalarsAdj`.
- Fitting ideals of finite modules and their base change: `TauCeti.fittingIdeal_baseChange`.
- The length of the cokernel of a square matrix over a noetherian domain of dimension at most one is the order of
  its determinant: `Matrix.length_quotient_range_mulVecLin_eq_ord_det`.
- Gauss's lemma for polynomials: `Polynomial.gaussNorm_mul`; the maximum principle for restricted power series:
  `MvPowerSeries.exists_norm_restrictedEval₂_eq_norm`.
- `log ∘ exp` and `exp ∘ log` for power series: `PowerSeries.logOf_subst_exp`, `PowerSeries.subst_exp_logOf`.
- The étale criterion for a ring with a finite group action (Chase–Harrison–Rosenberg): `TauCeti.MulSemiringAction.etale`;
  isomorphisms of algebraically closed fields extending a given one: `IsTranscendenceBasis.exists_ringEquiv_comp_algebraMap`.
- Stone–Weierstrass for star subalgebras and Fourier inversion on the circle:
  `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
  `has_pointwise_sum_fourier_series_of_summable`.
- Teichmüller representatives in adically complete rings and in local fields: `Perfection.teichmuller`,
  `TauCeti.eq_teichmullerLift_iff`.
- Jacobi's formula for the derivative of the determinant and `det(exp A) = exp(tr A)`: `Matrix.hasFDerivAt_det`,
  `Matrix.det_exp`; Fischer's and Hadamard's inequalities: the files `TauCeti/Analysis/InnerProductSpace/Gram/Fischer.lean`
  and `TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`.

On Tau Ceti's main branch, later than the revision pinned here:

- Uniqueness of Taylor expansions, two functions analytic at a point with the same Taylor series there agreeing near
  it: `TauCeti.taylorSeries_inj`.
- fpqc descent of sections and of morphisms into quasi-coherent modules:
  `AlgebraicGeometry.Scheme.Modules.isSheaf_bigPresheaf_fpqcTopology`,
  `TauCeti.AlgebraicGeometry.Descent.existsUnique_pullback_map_eq_of_mem_fpqcTopology`. Descent of quasi-coherent
  modules along fpqc coverings is SchemeAndStackFoundations §1.1; at the pins the library has the pseudofunctor of
  quasi-coherent modules (`TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor`).
- Divisibility of a multivariate power series by a constant: `MvPowerSeries.C_dvd_iff_dvd_coeff`; at the pins the
  library has the one-variable form (`PowerSeries.C_dvd_iff_dvd_coeff`).
- The `q`-binomial theorem and the count of the subspaces of `𝔽_q^n` of a given dimension:
  `TauCeti.prod_one_add_pow_mul_eq_sum_gaussianBinomial`, `TauCeti.card_submodule_finrank_eq_gaussianBinomial`; both
  are stated in ArithmeticStatisticsPartIV §3.2.
- The product formula for the Fitting ideals of an extension whose quotient is quadratically presented:
  `TauCeti.fittingIdeal_eq_mul_of_exact`, stated in PadicMeasuresIwasawaAlgebras §6.6.
- The coefficient bound for `exp(xX)` over extensions of `ℚ_p`: `PowerSeries.norm_coeff_rescale_exp_mul_pow_le`.
- Decay of Fourier transforms from bounds on derivatives:
  `TauCeti.one_add_norm_pow_mul_norm_fourier_le_of_tsupport_subset`.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers results of `src/Lib/General` in the files
  `Algebra/CartanMap`, `Algebra/MultivariatePolynomials`, `Analysis/GaussianIntegral`, `Analysis/HolomorphicIntegrals`,
  `LinearAlgebra/Eigenvalues`, `LinearAlgebra/IntegralLattices` and `LinearAlgebra/MatrixNormBounds`.
- N. Alon, *Combinatorial Nullstellensatz* (1999).
- S. A. Amitsur, *On the characteristic polynomial of a sum of matrices*, Linear and Multilinear Algebra 8 (1980),
  no. 3, 177–182.
- S. Ball, O. Serra, *Punctured combinatorial Nullstellensätze* (2009).
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over
  arbitrary rings*, LMS Lecture Note Ser. 414 (2014).
- Hua, *Harmonic Analysis of Functions of Several Complex Variables in the Classical Domains*, AMS (1963).
- J. Milne, *Arithmetic Duality Theorems*.
- J.-P. Serre, *Linear Representations of Finite Groups* (1977).
- T. Tamagawa, *On the zeta functions of a division algebra*, Ann. Math. 77 (1963).
- J. Tits, *Reductive groups over local fields*, Corvallis 1979.
