# Auxiliary algebra and analysis for theta lifts

**Summary.** This roadmap states the auxiliary results of general algebra, linear algebra and analysis that the
other roadmaps of the family `ShortGRH` use, that are targets in their own right, and that neither Mathlib nor the
Tau Ceti library states in the form needed. They are independent of one another and of the data of the argument.

The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane free of zeros
of Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for the covolume of
a lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The results here enter at scattered places of
that comparison and of its background:

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
analysis (3.1, 3.2). The two closing sections list the auxiliary results of the shorter proof that the library
already provides, and those that other roadmaps state.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
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

*Origin:* adapted from the published theory of the characteristic polynomial of a sum of matrices (Amitsur's
theorem): here, the integrality consequence for a homomorphism of an algebra to matrices, tested on a spanning set.

*Method of the formal proof:* (a) is the Cayley–Hamilton theorem for `ρ(w)`, read through a polynomial over `B`
that lifts the characteristic polynomial. For (b) the proof fixes the degree `k` in question, works in the
truncated polynomial ring `A[t]/(t^e)` over the image of `B[t]`, and shows by descending induction on the power of
`t` that adding `t^j·γ` to an element `β` keeps `det(1 − t·ρ(β))` in that image; the coefficient sought is a
coefficient of the reversed characteristic polynomial `det(1 − t·ρ(w))`.

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

*Origin:* adapted from the published theory of the Cartan map of a group algebra in positive characteristic (its
cokernel is finite): here, a form for functions with values in `ℚ_{≥0}` that are multiplicative in exact sequences,
on the finite modules killed by `ℓ` on which a central element fixes no non-zero vector, with projectivity read
through Higman's criterion.

*Method of the formal proof:* the proof uses neither Brauer characters nor induction from cyclic subgroups. It
passes to the quotient `Δ̄` of `Δ` by a normal subgroup of order prime to `ℓ` that contains a power of `z`, and to
the modules of `M`-valued functions on finite `Δ̄`-sets with the diagonal action, which stay in the class. Their
values of `φ` are multiplicative along decompositions into orbits. Comparing the functions on the hyperplane of
sum `0` in `(ℤ/ℓ)^{Δ̄}` with those on the parallel hyperplane of sum `1`, whose function modules satisfy Higman's
criterion, gives `φ = 1` on the functions on every orbit `Δ̄/H`, and the orbit `Δ̄/Δ̄` gives `φ(M) = 1`.

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

*Needs:* Mathlib `QuotientGroup.mk` (quotients of groups), `Sylow`, `Representation` (`R[Δ]`-modules), `ZMod`.

[ShortProof], `Lib/General/Algebra/CartanMap` (`New.DiscreteModule.IsHigmanProjective`,
`New.DiscreteModule.FiniteKilledFixedInj`, `New.DiscreteModule.IsMultiplicative`,
`New.DiscreteModule.IsMultiplicative.eq_one_of_eq_one_on_isHigmanProjective`)

### 1.3 The weighted Combinatorial Nullstellensatz with multiplicity

*Origin:* adapted from the published theory of the Combinatorial Nullstellensatz and its forms with multiplicity:
here, with a weight `1/κ_u` for each variable, total degree replaced by the weighted degree, and in place of a grid
any set of at least `∏ κ_u` points at which each `X_u^{κ_u}` agrees with a polynomial of weighted degree below `1`.

*Method of the formal proof:* put `ψ_u = X_u^{κ_u} − g_u`, which vanishes at the points. Division by the `ψ_u`, by
well-founded induction on the cost, shows that the products `X^α ψ^γ` with `α_u < κ_u` for all `u` and `|γ| < d`
span, modulo the polynomials whose jets of order below `d` vanish at all the points, every polynomial of cost below
`d`. These products are at most as many as the jet conditions, which they span, so they are independent modulo that
kernel; a polynomial of cost below `d` whose jets vanish is therefore `0`.

Let `K` be a field, `ι` a finite set, `κ : ι → ℤ_{>0}` and `cost(α) = cost_κ(α) = Σ_{u∈ι} α_u/κ_u` for exponents
`α ∈ ℕ^ι`. Let `(z_t)_{t∈T}` be a finite family of pairwise distinct points of `K^ι` with `#T ≥ ∏_{u∈ι} κ_u`, and for each
`u ∈ ι` let `g_u ∈ K[X_u : u ∈ ι]` be a polynomial all of whose monomials have cost `< 1`, with
`g_u(z_t) = (z_t)_u^{κ_u}` for every `t ∈ T`. Let `d ≥ 0` be an integer and let `f ≠ 0` be a polynomial with `f ∈ 𝔪_{z_t}^d` for every
`t ∈ T`. Then some monomial `X^α` with non-zero coefficient in `f` has `cost(α) ≥ d`.

For a grid `∏_u S_u` with `#S_u = κ_u` one may take `g_u = X_u^{κ_u} − ∏_{s∈S_u}(X_u − s)`. Mathlib has the
multiplicity-free theorem on grids (`MvPolynomial.combinatorial_nullstellensatz_exists_eval_ne_zero`), which does not
give this statement.

*Needs:* Mathlib `MvPolynomial`, `Finsupp.weight` (weighted degree of an exponent), `MvPolynomial.vanishingIdeal`.

[ShortProof], `Lib/General/Algebra/MultivariatePolynomials` (`New.exists_le_weight_of_mem_vanishingIdeal_pow`)

## Layer 2: Linear algebra and Hecke operators

### 2.1 Auerbach's lemma for a compact family of linear forms

*Origin:* adapted from the published theory of Auerbach bases of finite-dimensional normed spaces: here, for a
compact family of linear forms over any field, measured through a ring homomorphism into a normed field.

*Method of the formal proof:* choose indices `a_1, …, a_n` that maximise `‖φ(det(ℓ_{a_k}(b_j)))‖` for a basis `(b_j)`;
the maximum exists by compactness and continuity and is non-zero because the forms span the dual space. Let `(z_k)`
be the basis dual to `(ℓ_{a_k})`; by Cramer's rule `ℓ_a(z_k)` is the determinant with `a_k` replaced by `a`, divided
by the maximal one.

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

*Origin:* adapted from the published theory of spherical Hecke algebras (Gelfand's trick, by the transpose): here,
for `GL_n` over any field with a valuation ring, as operators on fixed vectors of any representation over a
commutative semiring.

*Method of the formal proof:* row and column operations over `O` bring every invertible matrix over `F` to diagonal
form (a Smith normal form over a valuation ring: of two elements one divides the other), so `g` and `ᵗg` lie in the
same double coset, which is (a). For (b) the inverse transpose permutes the cosets `gK` and serves as the system of
representatives for the adjoint. For (c) both composites are operators of convolutions, `T_{f′}T_f = T_{f′∗f}` on
`W^K`, and the bijection of cosets built from (a) and the inverse transpose exchanges the two convolutions term by
term.

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
(`HeckeCosetModule.mul_comm_of_antiInvolution`), with the instance `GL_n(ℤ) ⊂ GL_n(ℚ)`
(`HeckeRing.GLn.mul_comm_fullHeckeRing`) and the Smith normal form over a discrete valuation ring
(`Matrix.exists_smith_normal_form_of_isDiscreteValuationRing`); its Hecke pairs ask finite coset decompositions of the
double cosets, which a general valuation ring does not give, so the local instance and the passage to operators on
fixed vectors are missing.

*Needs:* Mathlib `ValuationSubring`, `Matrix.GeneralLinearGroup`, `Representation`.

[ShortProof], `Lib/General/LinearAlgebra/IntegralLattices` (`New.IsValuationPair.smith_normal_form`,
`New.isValuationPair_valuationSubring`, `New.exists_invTransposeGL_inv_eq`, `New.IsHeckeFunction.heckeFun_adjoint`,
`New.IsHeckeFunction.heckeFun_comm`)

## Layer 3: Analysis

### 3.1 The complex Gaussian integral for accretive matrices

*Origin:* adapted from the published theory of Gaussian integrals on `ℂ^n`: here, for a matrix with positive definite
hermitian part, not necessarily hermitian, and a shift on one side of the quadratic form.

*Method of the formal proof:* (a) is the Ostrowski–Taussky inequality applied to `H = A + Aᴴ`. For (b), a congruence
diagonalises an accretive matrix: `A = Pᴴ·diag(d)·P` with `P` invertible and `Re d_i > 0`. The change of variables
`y = Px`, whose real Jacobian is `|det P|²`, turns the integrand into a product of one-variable Gaussians, each of
integral `π/d_i`.

Let `A ∈ M_n(ℂ)` be accretive, that is, `A + Aᴴ > 0`.

(a) `det A ≠ 0`.

(b) For every `a ∈ ℂ^n` the function `x ↦ exp(−x*A(x − a))` is integrable on `ℂ^n` and
`∫_{ℂ^n} exp(−x*A(x − a)) dx = π^n·(det A)⁻¹`.

The library has the integral for a hermitian positive definite matrix in the form of the density of a proper complex
Gaussian distribution (`TauCeti.Probability.integral_properComplexGaussianPDFReal_eq_one`), with a shift on both sides
and a real integrand, which does not give (b) for a matrix that is not hermitian.

*Needs:* EigenvalueAndSingularValueInequalities §4.2 (the Ostrowski–Taussky inequality), for (a); Mathlib
`GaussianFourier.integral_cexp_neg_mul_sum_add` (the Gaussian integral on `ℝ²`),
`MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar` (Lebesgue measure under linear maps),
`MeasureTheory.integral_fintype_prod_volume_eq_prod` (products of integrals).

[ShortProof], `Lib/General/Analysis/GaussianIntegral` (`Matrix.IsAccretive`, `Matrix.IsAccretive.det_ne_zero`,
`New.Fock.integral_gauss`)

### 3.2 Hua's bound for integrals of negative powers of determinants

*Origin:* adapted from the published theory of Hua's integrals over the classical domains: here, an upper bound, not
an evaluation, with an affine change of the rows.

*Method of the formal proof:* induction on the number of rows. For one row `w = vS + a`, write `M = CᴴC`; the
substitution `vS + a = yC` changes the measure by `|det C/det S|²`, and the matrix determinant lemma gives
`|det(M + wᴴw)| = |det C|²(1 + |y|²)`. Since `r ≥ k`, `(1 + |y|²)^{−(r+1)} ≤ (1 + |y|²)^{−(k+1)}`, whose integral over
`ℂ^k` is `π^k/k!`: write `(1 + |y|²)^{−(k+1)} = (1/k!)·∫_0^∞ t^k e^{−t(1 + |y|²)} dt` and integrate the Gaussian in `y`
first. In the induction the integrated row is absorbed into `M`, and the exponent `r` grows by one. (b) is (a) for all
rows with `S = 1`, `a = 0`, `r = #κ`, followed by the change of variables `X ↦ SX + c`, whose real Jacobian is
`|det S|^{2#κ}`, and `π^k/k! ≤ 1` for `k ≥ 7`.

(a) Let `k ≥ 1`, `M ∈ M_k(ℂ)` with `M > 0`, `S ∈ M_k(ℂ)` invertible, `γ ≥ 0` and `r ≥ k` an integer. Let `s` be a finite
set and `(a_i)_{i∈s}` row vectors in `ℂ^k`, and for row vectors `y_i ∈ ℂ^k` put `w_i = y_iS + a_i`. Then

`∫_{(ℂ^k)^s} γ·|det(M + Σ_{i∈s} w_iᴴw_i)|^{−(#s + r)} ∏_{i∈s} dy_i ≤ γ·(π^k/(k!·|det S|²))^{#s}·|det M|^{−r}`.

(b) Let `ι`, `κ` be finite sets with `#κ ≥ 7`, `G ∈ M_κ(ℂ)` with `G > 0`, `S ∈ M_ι(ℂ)` invertible, `c ∈ M_{ι×κ}(ℂ)` and
`γ ≥ 0`. Then

`∫_{M_{ι×κ}(ℂ)} γ·|det(G + (SX + c)ᴴ(SX + c))|^{−(#κ + #ι)} dX ≤ γ·|det S|^{−2#κ}·|det G|^{−#κ}`,

`dX` Lebesgue measure on `M_{ι×κ}(ℂ) = ℂ^{ι×κ}`.

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
  `W` of `𝔽_q^n`, which combines the `q`-binomial theorem with the number of subspaces of a given dimension (both
  ingredients are in the library, see the next list): ArithmeticStatisticsPartIV §3.2.
- For an integral scheme with a projective embedding over a field and its base change to a noetherian ring, the
  monomials of degree `m` span the sections of the `m`-th power of the line bundle for all large `m`: GroebnerGeometry
  §4.10, on the library's projective schemes and line bundles.
- Embeddings into `ℂ` extending an embedding of a countable ring, and isomorphisms `ℂ ≅ L` for algebraically closed
  `L` of the cardinality of `ℂ` matching two embeddings: DeligneWeightsAndPurity §0.5 (i), (ii), through the fraction
  field.
- The index of a product of subgroups in a finite product of groups is the product of the indices:
  AdelicAlgebraicGroups §4.4 (index of product subgroups), with Mathlib's `Subgroup.index_pi` for one ambient group.
- Absolutely integrally closed rings: the definition, fields, quotients and localisations: ArcTopologyAndDescent §0.1.
- Polar decomposition `g = kz` in the unitary group of a diagonal sign form (existence): RepresentationTheory/LieGroups
  §9.2, the general Cartan decomposition applied to this group, realified as a closed subgroup of `GL_{2n}(ℝ)` stable
  under transpose; the group is not one of the matrix applications that section works out.
- The Cauchy–Binet formula for `det(AX)`, `A` of size `k × I` and `X` of size `I × k`: PadicMeasuresIwasawaAlgebras §6.4.

## What the library already provides

- The mean value property of holomorphic functions on a disc, and entire functions determined by their Taylor
  series at `0`: `DiffContOnCl.circleAverage`, `Complex.taylorSeries_eq_of_entire'`, `TauCeti.taylorSeries_inj`.
- Dirichlet's `S`-unit theorem and a class number bound stronger than `h ≤ (2^n·|d|)^{n+1}`:
  `TauCeti.finrank_sUnits_numberField`, `Set.unit_fg_of_units`, `NumberField.classNumber_le_bound`.
- Line bundles on schemes, their Picard group, triviality over local rings, and fpqc descent of sections and of
  morphisms into quasi-coherent modules: `TauCeti.AlgebraicGeometry.LineBundleClass`,
  `TauCeti.AlgebraicGeometry.LineBundleClass.subsingleton_spec_of_isLocalRing`,
  `AlgebraicGeometry.Scheme.Modules.isSheaf_bigPresheaf_fpqcTopology`,
  `TauCeti.AlgebraicGeometry.Descent.existsUnique_pullback_map_eq_of_mem_fpqcTopology`.
- The chain rule for substitution in multivariate power series, and Legendre's bounds for `v_p(n!)` and `‖n!‖`:
  `MvPowerSeries.pderiv_subst`, `Nat.Prime.sub_one_mul_multiplicity_factorial`, `Padic.rpow_neg_div_le_norm_factorial`.
- Divisibility of a multivariate power series by a constant, degree against order, and continuity of partial
  derivatives for the coefficientwise topology: `MvPowerSeries.C_dvd_iff_dvd_coeff`,
  `MvPowerSeries.degree_le_order_prod_pow`, `MvPowerSeries.WithPiTopology.continuous_pderiv`.
- The Frobenius on power series in characteristic `p` and `(Σ f_i)^{p^n} = Σ f_i^{p^n}`: `PowerSeries.map_frobenius_expand`,
  `sum_pow_char_pow`.
- The bialternant formula for Schur polynomials: `TauCeti.diagramSchurPoly_mul_alternant`; the `q`-binomial theorem and
  the count of subspaces: `TauCeti.prod_one_add_pow_mul_eq_sum_gaussianBinomial`,
  `TauCeti.card_submodule_finrank_eq_gaussianBinomial`.
- Extension of scalars of commutative algebras is left adjoint to restriction: `CommAlgCat.extendRestrictScalarsAdj`.
- Fitting ideals of finite modules and their base change: `TauCeti.fittingIdeal_baseChange`; their product formula
  for special exact sequences: `TauCeti.fittingIdeal_eq_mul_of_exact`.
- The length of the cokernel of a square matrix over a noetherian domain of dimension at most one is the order of
  its determinant: `Matrix.length_quotient_range_mulVecLin_eq_ord_det`.
- Gauss's lemma for polynomials: `Polynomial.gaussNorm_mul`; the maximum principle for restricted power series:
  `MvPowerSeries.exists_norm_restrictedEval₂_eq_norm`.
- `log ∘ exp` and `exp ∘ log` for power series, and the coefficient bound for `exp(xX)` over extensions of `ℚ_p`:
  `PowerSeries.logOf_subst_exp`, `PowerSeries.subst_exp_logOf`, `PowerSeries.norm_coeff_rescale_exp_mul_pow_le`.
- The étale criterion for a ring with a finite group action (Chase–Harrison–Rosenberg): `TauCeti.MulSemiringAction.etale`;
  isomorphisms of algebraically closed fields extending a given one: `IsTranscendenceBasis.exists_ringEquiv_comp_algebraMap`.
- Stone–Weierstrass for star subalgebras, Fourier inversion on the circle, and decay of Fourier transforms from
  bounds on derivatives: `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`,
  `has_pointwise_sum_fourier_series_of_summable`, `TauCeti.one_add_norm_pow_mul_norm_fourier_le_of_tsupport_subset`.
- Teichmüller representatives in adically complete rings and in local fields: `Perfection.teichmuller`,
  `TauCeti.eq_teichmullerLift_iff`.
- Jacobi's formula for the derivative of the determinant and `det(exp A) = exp(tr A)`: `Matrix.hasFDerivAt_det`,
  `Matrix.det_exp`; Fischer's and Hadamard's inequalities: the files `TauCeti/Analysis/InnerProductSpace/Gram/Fischer.lean`
  and `TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`.
