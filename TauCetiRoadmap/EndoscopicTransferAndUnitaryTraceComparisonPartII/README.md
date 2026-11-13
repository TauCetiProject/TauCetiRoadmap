# Roadmap: endoscopic transfer and unitary trace comparison, part II — relative endoscopy for unitary Friedberg–Jacquet periods

**Summary.** This roadmap is EndoscopicTransferAndUnitaryTraceComparison, Part II. The base roadmap develops ordinary endoscopy for unitary Lie algebras (stable classes, κ-orbital integrals, the Laumon–Ngô fundamental lemma and Waldspurger's smooth transfer) and stops before symmetric spaces. Part II develops relative endoscopy for the infinitesimal symmetric space of the pair (U(W₁⊕W₂), U(W₁)×U(W₂)): the off-diagonal representation Hom_E(W₂,W₁), its two signed contractions to Hermitian endomorphisms, and the comparison of relative orbital integrals with ordinary ones. From there it builds relative endoscopic data and the relative transfer relation, the full spherical module of K-invariant functions on invertible Hermitian matrices with Hironaka's spherical Fourier isomorphism, the germ, descent and Weil reductions of Leslie's method, and reaches three end theorems over an unramified quadratic extension of p-adic fields in every residue characteristic: the cyclic spherical endoscopic fundamental lemma (Leslie25 Theorem 3.5), the adjacent-rank spherical Jacquet–Rallis comparison (Leslie25 Theorem 5.3, from an independent product-group comparison), and the endoscopic fundamental lemma for unitary Friedberg–Jacquet periods (Leslie25 Theorem 2.12). A final layer transports the Levi map to the whole spherical module through Hironaka's transform.

## Scope and ownership

EndoscopicTransferAndUnitaryTraceComparison supplies ordinary unitary Lie-algebra endoscopy: crossed-module Galois cohomology (§1.1), abelianized cohomology (§1.5), rational classes in a stable class (§1.14), centralizers, matching and the endoscopic character for unitary Lie algebras (§1.17), endoscopic data (§1.4), the characteristic-coefficient quotient (§3.3), orbital integrals and κ-sums (§§2.1, 2.4), Lie transfer factors and transfer classes (§§2.9, 2.11), the unitary factor formula (§2.12) and Waldspurger's smooth transfer (§4.7). It stops before symmetric-space endoscopy, and this Part II begins there. This roadmap owns the relative symmetric-space geometry and the relative transfer relation, the unramified spherical base-change homomorphism BC_n for GL_n, defined by its Satake substitution (§2.2; it is the GL_n case of the base-change map b_(E/F) whose orbital association EndoscopicTransferAndUnitaryTraceComparison §4.9(b) states, and §2.2 fixes it by the normalized substitution Z_i↦T_i², which that section takes from its sources), the Hermitian spherical module on X_n with Hironaka's transform, the germ and descent reductions, the Friedberg–Jacquet unit theorem and the Fourier-defined full-module operator. The local Jacquet–Rallis inputs it consumes are supplier contracts of the base roadmap, stated below.

Signed Hermitian carriers and their adjoint belong to GeometryOfNumbersAndQuadraticArithmetic §2.9, integral Hermitian lattices and their duals to its §2.7, and local Hermitian representation densities to its §3.2; that roadmap's §3.2 also owns Hironaka's spherical functions on U(2n)/(U(n)×U(n)) and the Hermitian Siegel series, which live on a different space from the X_n of Layer 2 here. The finite self-dual-overlattice count and its normalization against the density are the relative adapter of §4.7. Quotient measures belong to AdelicAlgebraicGroups §2.2; the spherical Satake isomorphism, the Hall–Littlewood polynomials and the determinant-twisted spherical parabolic descent for GL_n(E) belong to SmoothRepresentationsOfLocalGroups §§SR.4.1 and SR.4.3; the Weil index and Weil operators belong to MetaplecticAutomorphicForms §§2.1 and 2.5; and the split étale Hermitian carrier A⊕A∨ over E=F×F, with its pairing and the identification of its isometry group with GL(A), belongs to MetaplecticAutomorphicForms §3.2a. None is constructed a second time; on the split carrier Layer 0 adds only the paired-map description of Hom maps between two such carriers, their exchange adjoint and the off-diagonal block. The matrix Hermitian-product and characteristic-polynomial identities used in coordinates are in the pinned Mathlib (`Matrix.isHermitian_mul_conjTranspose_self`, `Matrix.charpoly_mul_comm`) and are used, not restated. Tau Ceti's Hecke rings for GL_n (`TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean`) are the arithmetic p-local Hecke rings over ℤ; they are not the analytic spherical Hecke algebras of compactly supported K-biinvariant functions used here.

Unrestricted relative smooth transfer is open (Leslie19 Conjecture 4.4, p. 15), and so is full-module orbital transfer with augmented factors (Leslie25 Remark 3.7, p. 27); neither is a target of this roadmap. Layer 5 constructs the precisely defined Fourier operator on the full module and proves its algebraic properties, not a transfer statement for it. Exchanging the roles of the two contractions requires an explicit transport of nonisometric form data and is not a separate theorem here.

## Conventions

F is a nonarchimedean local field of characteristic zero. Three standing settings are used, and each subsection names the one it works in.

- *Étale setting.* E/F is a quadratic étale algebra with involution z↦z̄, a field extension or F×F. Layers 0 and 1 work here.
- *Field setting.* E/F is a quadratic field extension, ramified or unramified, of any residue characteristic. The germ statements §§3.1–3.3 and the determinant identity of §3.5 work here.
- *Unramified setting.* E/F is an unramified quadratic field extension, with common uniformizer π, q=#k_F≥2, Λ_n=O_E^n, K_n,E=GL_n(O_E), K_n,F=GL_n(O_F), and hyperspecial Haar volumes one. Residue characteristic two is included. Layers 2, 4 and 5, §3.4, the descent identity of §3.5 and §§3.6–3.8 work here.

The spaces W₁,W₂ are nondegenerate Hermitian E-modules of the same finite rank n; forms are conjugate-linear in the first variable and linear in the second. In every setting V_n=(E^n,I_n) is the identity form of rank n (for E=F×F it is the split carrier of §0.1 with M=F^n), and V_α=(E^a,α) for a Hermitian form α on E^a. Test functions are complex-valued, locally constant and compactly supported in their stated domain. All carriers live in fixed universes.

The adjoint X^τ:W₁→W₂ of X∈Hom_E(W₂,W₁) satisfies h₁(Xv,w)=h₂(v,X^τw). The block representation is δ(X)=[[0,X],[−X^τ,0]], with action (g₁,g₂)·X=g₁Xg₂⁻¹. The contractions are r₁(X)=−XX^τ and r₂(X)=−X^τX. Herm(W) denotes the self-adjoint endomorphisms of W rather than the skew-adjoint Lie algebra; multiplication by a fixed nonzero trace-zero element of E identifies the two for ordinary endoscopy. In rank one with W_i=⟨a_i⟩, X^τ=(a₁/a₂)z̄ and r_i(z)=−(a₁/a₂)N(z). For E=F×F the norm is (u,v)↦uv and U(W)=GL_n; there is one form class in each rank and no proper elliptic block datum with a,b>0, and the symmetric pair is the linear Friedberg–Jacquet pair (GL_2n, GL_n×GL_n).

Haar measures are fixed before quotient integration. Regular centralizers have maximal compact subgroup of volume one (Leslie25 §1.5.4, p. 12; Source corrections, E21), transported through the stabilizer isomorphisms of §0.5. Quotients use integration in stages, so scaling a torus Haar measure by c>0 scales an orbital integral by c⁻¹. In the unramified setting q_E=q² and |π|_E=q⁻². Proper endoscopic decompositions have a,b>0 and n=a+b; rank zero enters as GL_0=U_0={1} at n=1 in the adjacent-rank comparison and as the one-point spaces X_0 and Herm(V_0) of §§2.1 and 4.7.

The quadratic character is η=η_E/F (trivial for split E). The cyclic determinant uses ordered columns v,xv,…,x^(n−1)v and the block volume form Ω_a∧Ω_b; D_ab=∏(λ_a−λ_b), and disjoint block spectra make D_ab≠0. The general cyclic ratio is η((−1)^(ab)D_ab); in the unramified setting η(−1)=1 removes the sign. Weil transforms use an additive character ψ of conductor O_F and self-dual measures for the trace pairing: the Hermitian kernel is ψ(Tr_E/F h(u,w)) and the linear kernel is ψ(v*w+w*v). The raw regularized germ of §3.2 has no finite-Fourier averaging built into it.

**Checks.**

- With standard rank-one forms and X=1, δ²=−I and r_i(1)=−1. In the unramified setting a unit c with N(c)=−1 gives r₁(c)=−N(c)=1, the value at 1 of the unsigned Gram map z↦N(z) (the map r₊ of §4.1); such a unit exists in every residue characteristic, including two.
- For a=b=1 and λ_a−λ_b=π, the unramified nice-match factor is η(π)|π|_F=−q⁻¹. Reversing the order of the cyclic columns instead contributes η(−1), which is −1 for E=ℚ₃(√3).
- For q=2, q_E=4 and |π|_E=1/4; rescaling the stabilizer measure from 1 to 2 changes a unit orbital value from 1 to 1/2. These distinguish the field and measure normalizations.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib, consume `Matrix.conjTranspose` (`Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean`), `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self` and `Matrix.isHermitian_conjTranspose_mul_self` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean`), `Matrix.charpoly` and `Matrix.charpoly_mul_comm` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`), `MvPolynomial.hsymm` (`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean`) and `MvPolynomial.bind₁` (`Mathlib/Algebra/MvPolynomial/Monad.lean`). Conjugate transpose transposes and applies star entrywise; `Matrix.IsHermitian A` means Aᴴ=A and carries no arithmetic or measure structure. `Matrix.charpoly_mul_comm` is the identity charpoly(AB)=charpoly(BA) for square matrices over a commutative ring. `MvPolynomial.bind₁ f` is the algebra homomorphism of multivariate polynomial rings substituting the polynomial f(i) for the variable X_i; it covers polynomial substitutions, not Laurent ones, and §4.8 uses it for the scaled substitution Z_i↦q⁻ᵇX_i, Z_j↦q⁻ᵃY_j applied to the polynomial q^(d(n−1))h_d(Z₁,…,Z_n), with h_d=`MvPolynomial.hsymm`. `HasStrictFDerivAt.implicitFunction` (`Mathlib/Analysis/Calculus/Implicit.lean`, in its finite-dimensional section) applies over a complete nontrivially normed field to a map from a complete space to a finite-dimensional space whose strict derivative is surjective; the complement of the kernel is then supplied automatically. That implicit function is the one of the datum `HasStrictFDerivAt.implicitFunctionDataOfComplemented` (same file), whose left function is the given map and whose right function is the affine continuous projection x↦P(x−a) onto the kernel; the Mathlib statements assert strict differentiability, not analyticity. Applying it over F uses a complete absolute value on F extending the normalized one on ℚ_p.

### From Tau Ceti

At the pinned Tau Ceti, consume `TauCeti.map_normUnits_unitFiltration` and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (`TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean`). For a finite-dimensional unramified extension of nonarchimedean local fields with compatible valuations, the first says that the norm maps the i-th unit filtration subgroup of the top field onto that of the bottom field, for every i; the second says that a nonzero element of the bottom field is a norm exactly when the inertia degree divides its normalized valuation. At i=0 the first gives N(O_E^×)=O_F^×. Neither asserts anything about ramified extensions.

Consume `ImplicitFunctionData.analyticAt_implicitFunction` (`TauCeti/Analysis/Analytic/Inverse.lean`): over any nontrivially normed field, with complete source, target and parameter spaces, the implicit function of an `ImplicitFunctionData` whose left and right functions are analytic at the base point is analytic there. It supplies the analyticity of the local sections of §0.6, which the Mathlib implicit function alone does not.

Consume `TauCeti.ClassFieldTheory.artinMap_norm` and `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`) and `TauCeti.index_normGroup_of_isCyclic` (`TauCeti/NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean`). For a finite extension L/K of nonarchimedean local fields, the first says that the absolute local Artin symbol of N_(L/K)(x) is the image of the Artin symbol of x under the inclusion of absolute Galois groups; the second says that if a representative of the absolute Artin symbol of x∈K^× fixes pointwise a finite Galois extension M/K inside the algebraic closure, then x is a norm from M; the third says that for a cyclic extension L/K of nonarchimedean local fields the norm group has index [L:K] in K^×. Together they give, for a finite extension F_i/F not containing E, that η_(E/F)∘N_(F_i/F) is the quadratic character of the field E⊗_F F_i over F_i and is nontrivial; §3.2 uses this.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §1.1 (Galois cohomology with crossed-module coefficients), §1.5 (abelianized cohomology), §1.14 (rational classes inside a stable class), §1.17(a)–(c) (centralizers, the matching relation, the isometry torsor and inv across pure forms, and the endoscopic character, in norm coordinates), §1.4 with §1.17(c) (local unitary elliptic endoscopic data), §3.3 (the characteristic-coefficient quotient for GL_n), §§2.1 and 2.4 (centralizer normalization, convergent normalized orbital integrals, stable and κ sums and their basepoint change), §§2.9 and 2.11 (Lie transfer factors and transfer classes, including vanishing at unmatched strongly G-regular orbits) and §4.7 (Waldspurger's Lie smooth transfer in characteristic zero, any residue characteristic). The spherical base-change homomorphism BC_n is defined in §2.2 here by its Satake substitution; the orbital association of §4.9(b) is not an input of any target here. For split E the GL_n specializations are used, not a two-form unitary classification. The unitary factor formula of §2.12 is stated there for unramified E and odd p; its larger scope is the gap below, not an import.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-local-comparison): Supply the augmented and block/group Jacquet–Rallis invariant quotients, regular matching across all pure forms, η(det)-twisted orbital distributions, the cyclic factors (4.1) and (4.6), the transfer relations (4.3) and (4.7) as relations between test functions, and the product-to-conjugation identities (7.5)–(7.7) with Definition 7.4, with the measures and unmatched-zero clauses of Leslie25 §§4.1 and 7.1–7.2.

Its parts have the following consumers here: the augmented and block invariant quotients with regular matching across both forms (Leslie25 §4.1.3, (4.2), p. 33) in §§3.1, 3.7, 3.8, 4.4 and 4.5; the η(det)-twisted orbital distributions with the factor (4.1) and the relation (4.3) in §§3.2, 3.3, 3.5, 3.6, 3.7, 3.8 and 4.5; the block relation (4.7) with the factor (4.6) in §§3.8 and 4.4; and the identities (7.5)–(7.7) with Definition 7.4 in §4.3. Every consumer takes the transfer relation as a hypothesis on named test functions or proves it; the existence of Jacquet–Rallis smooth transfer (Leslie25 Theorem 4.2, p. 34) and its compatibility with partial Fourier transforms are not inputs of any target here.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-weil-descent): Descend the Weil operators supplied by MetaplecticAutomorphicForms §§2.1 and 2.5 to the linear and unitary orbital-image spaces and prove agreement on their intersection, with self-dual trace-pairing measures as in BP21 Proposition 1, p. 7.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-product-base-change): Prove Leslie25 Theorem 11.1, p. 78, for GL_m×GL_(m+1) in every m≥0 and every residue characteristic, two included, with its factor Ω, spherical base change and all nonreference-form zero components, from an independent spectral proof that does not assume the Friedberg–Jacquet unit theorem; at a dyadic place the source's argument applies Lemma 10.6, p. 76, whose unit normalization is Lemma 8.6, p. 61, stated for odd residue characteristic (Source corrections, E18).

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:unitary-factor-all-quadratic): For every quadratic extension of characteristic-zero p-adic fields, including p=2 and ramified E, identify the §2.9 factor for U(V_a)×U(V_b) with κ(inv(δ,δ′))η(D(δ))|D(δ)|_F in the normalization of Leslie25 (2.7), p. 19.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.7 `IntegralHermitianLattice.ofCarrier` (integral Hermitian lattices in a finite space over a field with involution) and `IntegralHermitianLattice.dual` (the dual lattice over a Dedekind domain, integrality being L⊆L∨), §2.9 `SignedHermitianSpace` with `signedHermitianAdjoint`, `signedHermitianAdjoint_comp` and `signedHermitianAdjoint_involutive` (the carrier and the adjoint of an endomorphism of one space, with composition reversal and involutivity, over any commutative field with involution and finite-dimensional space; the adjoint between two different spaces is constructed from it in §0.1), and §3.2 (local Hermitian representation densities over an unramified quadratic extension, dyadic residue fields allowed). The classification theorems of §2.9 are stated for odd residue characteristic. Generic densities do not by themselves supply the congruence-orbit or unit-vector transitivity contracts below.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:hermitian-field-classification): Classify nondegenerate Hermitian spaces over every quadratic extension of nonarchimedean local fields of characteristic zero by dimension and discriminant, including dyadic and ramified extensions, as used in Xiao18 §2.2, p. 5, and Leslie19 Lemma 4.6, p. 16.

**Checks.**

- The archimedean extension ℂ/ℝ is excluded: diag(1,1) and diag(−1,−1) both have dimension 2 and discriminant 1 in ℝ^×/N(ℂ^×)={±1}, but signatures (2,0) and (0,2), so they are not isometric.
- At rank zero the discriminant is 1 and there is a single form, not two.
- At positive rank one, ⟨1⟩ and ⟨ε⟩ with ε∉N(E^×) have distinct discriminants in F^×/N(E^×), so they are not isometric even though their unitary groups are isomorphic.
- Over F×F the norm (u,v)↦uv is onto and there is one Hermitian class in each rank; a two-class field statement does not apply there.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:unramified-hermitian-lattice-orbits): For unramified quadratic E/F in every residue characteristic prove the unique dominant-integral congruence representatives K_n,E∗π^λ of Leslie25 (3.7), p. 26, including that every self-dual rank-n lattice is integrally isometric to O_E^n with Gram I_n.

**Checks.**

- In rank one the classes π^jO_F^× for j=0,1,−1 have distinct valuations and none may be dropped.
- A self-dual rank-one lattice has unit Gram determinant; Gram π has dual quotient of O_E-length 1 and is not self-dual.
- At q=2, N(𝔽₄^×)=𝔽₂^× and Tr(𝔽₄/𝔽₂) is onto; division by 2 is unavailable integrally and is not used.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:unramified-unit-vector-transitivity): For unramified quadratic E/F in every residue characteristic prove U(Λ_n) transitive on {w∈Λ_n:h(w,w)=1}, including n=1 and p=2, as used in BP21 §2, Lemma 1, pp. 4–5.

**Checks.**

- In rank one any norm-one unit w is taken to 1 by multiplication by w⁻¹∈U(Λ₁).
- For h(w,w)=1 the integral projector p(v)=w·h(w,v) has p(w)=w and p²=p, in residue characteristic two as well.
- The vector 0 has norm 0 and is excluded; enlarging the claim to all vectors would put 0 in the orbit of a unit vector, which is impossible.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §2.2 (parabolic modulus and homogeneous integration): its invariant measure on a coset space (*quotient-measure*), its Weil formula for integrable functions, and its quotient measures in stages. The groups there are second countable, locally compact and Hausdorff, the subgroups closed, and the restricted modular characters agree. Local reductive groups and their regular centralizer tori are unimodular, so these hypotheses hold for every quotient used here. Local sections and surjectivity on compact test functions are proved in §0.6.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.1.1.2 (the local Tate zeta integral z(s,ω;f) of a unitary character ω of K^× and a Schwartz–Bruhat function f on a local field K, absolutely convergent and holomorphic on Re(s)>0, with the multiplicative measure giving O_K^× volume one), AL.1.2.1 (for unramified ω, z(s,ω;f)=L(s,ω)z₀(s,ω;f) with z₀ entire and L(s,ω)=(1−ω(ϖ)q_K^(−s))⁻¹, which continues z meromorphically to all s) and AL.1.2.3 (for ramified ω, z(s,ω;f) is entire). These are applied over each finite extension F_i/F, a nonarchimedean local field, to the nontrivial quadratic character η∘N_(F_i/F) of §3.2. For it, ω(ϖ)=−1 in the unramified case, so L(s,ω)=(1+q_i^(−s))⁻¹, with q_i the residue cardinality of F_i, is holomorphic and nonzero at s=0, and in the ramified case z is entire; either way the continued integral has a value at s=0. For the trivial character the factor (1−q_i^(−s))⁻¹ has a pole at s=0, so the nontriviality is load-bearing.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §SR.4.1 (*satake-isomorphism*) and, from §SR.4.3, *hall-littlewood* and *parabolic-descent*. The Hall–Littlewood target supplies, for every dominant integral λ∈ℤ^n (negative entries included), the polynomial P_λ(X;t) as a symmetric Laurent polynomial over ℤ[t], homogeneous of degree |λ|, so that it may be specialized at t=−q⁻¹ as in §2.3. For E/F unramified quadratic, *parabolic-descent* supplies normalized spherical descent on GL_n(E) to GL_a(E)×GL_b(E) and Leslie's twisted Levi map ξ_E, which twists the two determinants by |det m₁|_E^(b/2) and |det m₂|_E^(a/2) and acts on normalized Satake variables by Z_i↦q⁻ᵇX_i, Z_j↦q⁻ᵃY_j. Its statement is for GL_n(E) only; the analogous map ξ_F on GL_n(F), with |·|_F twists and substitution T_i↦q^(−b/2)X_i, T_j↦q^(−a/2)Y_j, is defined in §2.2 here by the same construction. Layer 3 constructs additive Lie descent and compares it with these group maps.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §1.24 (semilinear automorphisms and Galois descent) for affine Galois descent of the split-coordinate equivariant coordinate-ring isomorphisms of §0.3. The invariant-ring computation of §0.3 is given directly and invokes no Igusa criterion.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume §RG2.0.2 (*smooth-group-analytic-charts*): characteristic-zero local analytic charts on the F-points of smooth affine groups. Together with the explicit contraction torsor and the pinned implicit function theorem this supplies the local sections of §0.6; smoothness alone does not assert surjectivity on F-points.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §2.1 `weilIndex` and §2.5 `weil_generators`, retaining the specified Weyl element, Weil scalars and self-dual polar-pairing measures. The quadratic spaces here have even F-dimension: the hyperbolic linear form q(v,v*)=v*v and the Hermitian norm form q(w)=h(w,w). Agreement after descent to orbital images is gap:jr-weil-descent, not a second construction of the Weil operators.

Consume §3.2a `splitHermitianOscillator` with sign ε=+1, for the carrier only: over a field F of characteristic not two and E=F×F with the exchange involution, a finite projective E-module with a perfect Hermitian pairing is identified by the two idempotents with A⊕A∨, with pairing h((x,ℓ),(y,k))=(ℓ(y),k(x)), conjugate-linear in the first variable, and its isometry group is GL(A) acting by (g,(g⁻¹)∨). This covers rank zero (A=0). Its oscillator comparison is not used here.

## How to read the build

Layer 0 constructs the off-diagonal representation, the two contractions, the invariant quotients and the contraction torsor, establishes local sections and fibre integration, and proves that contraction preserves orbital integrals. Layer 1 pulls the supplied ordinary endoscopic data back through contraction, defines the relative transfer relation and proves transfer for tests supported away from singular Hom maps. Layer 2 builds the full spherical module on invertible Hermitian matrices, defines spherical base change by its Satake substitution, compares it with the Levi maps and fixes Hironaka's normalized Fourier isomorphism. Layer 3 proves the germ inversion, Lie descent and Weil reductions that turn an augmented Jacquet–Rallis comparison into cyclic endoscopic transfer. Layer 4 takes the independent product-group comparison through its supplier contract, derives the adjacent-rank and augmented comparisons and cyclic endoscopy, and recovers the full relative lattice-unit theorem from compact determinant grades. Layer 5 transports the Levi map to the whole spherical module through Hironaka's transform. The supplier gaps are prerequisites of their individual consumers only, and the product-group comparison never consumes the relative lattice-unit theorem.

## Layer 0: the symmetric representation and contraction

Construct the off-diagonal representation, its invariant quotients and stabilizer identifications; establish local sections and compact fibre integration; compare relative and ordinary orbital integrals.

### 0.1 The off-diagonal unitary representation

Work in the étale setting. For nondegenerate Hermitian E-modules W₁,W₂ of the same rank n, put W=W₁⊕W₂ and θ=Ad(1,−1). Identify the (−1)-eigenspace of θ in Lie U(W) with Hom_E(W₂,W₁) by sending X to the block matrix δ(X)=[[0,X],[−X^τ,0]], where h₁(Xv,w)=h₂(v,X^τw); the fixed group U(W₁)×U(W₂) acts by (g₁,g₂)·X=g₁Xg₂⁻¹ (Leslie25, §2.1, pp. 13–14; §1.2, pp. 3–4). For split E=F×F, take each Hermitian module to be the split carrier M_i⊕M_i∨ of MetaplecticAutomorphicForms §3.2a with sign +1, pairing h((v,ℓ),(w,m))=(ℓ(w),m(v)) and unitary group GL(M_i), with g acting on M_i∨ by the transpose of g⁻¹. On these carriers an E-linear Hom map is a pair of maps A:M₂→M₁ and B:M₁→M₂ (B the transpose of the M₂∨→M₁∨ component), and the adjoint exchanges them: (A,B)^τ=(B,A). For nonsplit E each W_i is a `SignedHermitianSpace` of GeometryOfNumbersAndQuadraticArithmetic §2.9 with sign +1. Its `signedHermitianAdjoint` is the adjoint of an endomorphism of one space, so the adjoint between the two spaces is constructed here: on W=W₁⊕W₂ with the orthogonal sum form h₁⊕h₂, which is nondegenerate, X^τ is the W₁→W₂ block of `signedHermitianAdjoint` applied to the endomorphism (v₁,v₂)↦(Xv₂,0), whose adjoint is (w₁,w₂)↦(0,X^τw₁).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9 (`SignedHermitianSpace`, `signedHermitianAdjoint`, `signedHermitianAdjoint_comp`, `signedHermitianAdjoint_involutive`); MetaplecticAutomorphicForms §3.2a (`splitHermitianOscillator`); Mathlib `Matrix.conjTranspose`.

A proof route reads off X^τ from the endomorphism adjoint on W₁⊕W₂, obtains (X^τ)^τ=X from involutivity and the transformation law from composition reversal and g*=g⁻¹ for unitary g, and solves the skew-adjoint block equations with this adjoint for nonsplit E and, for split E, on the imported split carrier, where the adjoint of (A,B) is (B,A); the fixed-group action is transported through the block identification.

The supporting API comprises:

- For X∈Hom_E(W₂,W₁), X^τ is the unique E-linear map W₁→W₂ with h₁(Xv,w)=h₂(v,X^τw) for all v∈W₂ and w∈W₁, and (X^τ)^τ=X.
- The block embedding X↦[[0,X],[−X^τ,0]] lands in the (−1)-eigenspace of θ in Lie U(W).
- The top-right projection and the block embedding are mutually inverse F-linear isomorphisms between that eigenspace and Hom_E(W₂,W₁).
- The formula (g₁,g₂)·X=g₁Xg₂⁻¹ is an F-linear algebraic representation of U(W₁)×U(W₂), and the block embedding intertwines it with conjugation by diag(g₁,g₂).
- For g₁∈U(W₁) and g₂∈U(W₂), the adjoint of g₁Xg₂⁻¹ is g₂X^τg₁⁻¹.

**Checks.**

- For W₁=⟨1⟩, W₂=⟨π⟩ and X=z, the block of the adjoint of (v₁,v₂)↦(zv₂,0) on ⟨1⟩⊕⟨π⟩ is π⁻¹z̄, since conj(zv)w=conj(v)·π·(π⁻¹z̄w); at z=1 this is π⁻¹, whereas the conjugate z̄ alone, the adjoint for equal forms, gives 1 and violates h₁(Xv,w)=h₂(v,X^τw).
- For standard rank one, X=1 gives δ=[[0,1],[−1,0]] with δ*=−δ; a positive lower-left entry would give δ*=δ, a self-adjoint rather than skew-adjoint matrix.
- In the split model the two GL_n actions become (A,B)↦(gAh⁻¹,hBg⁻¹); for n=1 and (g,h)=(2,1), (A,B)=(1,1) goes to (2,1/2), preserving AB=1. An action g·B·h⁻¹ on the second component would give (2,2) and change AB.
- For n=2 and standard X=diag(1,π), δ²=diag(−1,−π²,−1,−π²); the unsigned off-diagonal model [[0,X],[X^τ,0]] gives the opposite square.

Used by §§0.2 and 1.1.

### 0.2 The two signed contractions

Work in the étale setting. Define r₁(X)=−XX^τ in Herm(W₁) and r₂(X)=−X^τX in Herm(W₂), where Herm(W_i) is the F-space of h_i-self-adjoint endomorphisms. Both are F-polynomial maps; r₁ is U(W₁)-equivariant and U(W₂)-invariant, and r₂ has the opposite behaviour (Leslie25, §2.1, equation (2.1), p. 14). In standard Gram coordinates the formulas use `Matrix.conjTranspose`, not the plain transpose.

*Needs:* §0.1; Mathlib `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self`, `Matrix.isHermitian_conjTranspose_mul_self`, `Matrix.charpoly_mul_comm`.

A proof route applies the adjoint to both products, using that the adjoint reverses products and is an involution, and uses the adjoint law of §0.1 for the transformation laws.

The supporting API comprises:

- In standard Gram coordinates, r₁(X) is minus X times its conjugate transpose and r₂(X) is minus the conjugate transpose times X; both are Hermitian matrices.
- r₁(g₁Xg₂⁻¹)=g₁r₁(X)g₁⁻¹, and r₂(g₁Xg₂⁻¹)=g₂r₂(X)g₂⁻¹.
- Exchanging W₁ and W₂, r₂(X)=r₁(X^τ).
- Both contractions send 0 to 0.
- For square standard-coordinate X over a commutative star ring, r₁(X) and r₂(X) have the same characteristic polynomial (charpoly_mul_comm applied to −X and its conjugate transpose).

**Checks.**

- For standard rank-one forms, r₁(1)=−1; the unsigned Gram map would give +1.
- For W₁=⟨1⟩ and W₂=⟨ε⟩ with ε a nonnorm, r₁(1)=−ε⁻¹, and the image of the nonzero elements is −ε⁻¹N(E^×), the norm class opposite to −N(E^×).
- For standard X=diag(1,π), both contractions are diag(−1,−π²), with characteristic polynomial (T+1)(T+π²).
- For split E and X=(u,v) in rank one, X^τ=(v,u) and both contractions are −uv; (1,0) maps to zero and is singular.

Used by §§0.3, 0.4, 1.1 and 4.1.

### 0.3 Invariant quotients of the symmetric representation

Work in the étale setting. The morphism r₁ realizes the categorical quotient Hom_E(W₂,W₁)//U(W₂) as Herm(W₁), U(W₁)-equivariantly. The categorical quotient by both unitary groups is affine n-space, with quotient map the n nonleading coefficients of charpoly(r₁(X)) (Leslie25, Proposition 2.1 and Lemma 2.2, p. 14). These are categorical quotients of F-varieties; no claim is made that every F-point of the quotient has an F-rational preimage.

*Needs:* §0.2; SchemeAndStackFoundations §1.24; EndoscopicTransferAndUnitaryTraceComparison §3.3; Mathlib `Matrix.charpoly`.

A proof route: over a splitting field write the representation as pairs (A,B), the second GL_n acting by (Ah⁻¹,hB), with signed contraction −AB. On the locus det(B)≠0, taking h=B⁻¹ gives P(A,B)=P(AB,I) for every invariant polynomial P; both sides are polynomials, so density extends the identity everywhere, and conversely every polynomial in AB is invariant. The section Z↦(−Z,I) makes the pullback injective. This identifies the invariant coordinate ring directly. The remaining conjugation quotient is EndoscopicTransferAndUnitaryTraceComparison §3.3, and the equivariant coordinate-ring isomorphisms descend by SchemeAndStackFoundations §1.24.

**Checks.**

- For rank-one forms ⟨a₁⟩,⟨a₂⟩ the quotient map is z↦−(a₁/a₂)N(z); for ⟨1⟩,⟨ε⟩ it sends 1 to −ε⁻¹, not −1.
- Over the split algebra in rank one, (A,B)=(0,1) and (1,0) have the same invariant 0 but lie in different orbits: a categorical quotient does not classify singular orbits.
- In rank two the section Z↦(−Z,I) gives −AB=Z, and charpoly(diag(1,π))=(T−1)(T−π); keeping only the determinant would lose the trace 1+π.

### 0.4 Regular semisimplicity excludes singular Hom maps

Work in the étale setting. For the symmetric representation, X is regular semisimple if its geometric orbit is closed of maximal dimension. Prove that X is regular semisimple exactly when r₁(X) is invertible and regular semisimple in Herm(W₁); in particular X is invertible and its stabilizer H_X in U(W₁)×U(W₂) is a torus of rank n. Prove that the off-diagonal block has characteristic polynomial charpoly(δ(X))(T)=charpoly(r₁(X))(T²) (Leslie25, §2.1 before Proposition 2.1, and Lemma 2.4, pp. 13–15).

*Needs:* §§0.2, 0.3; EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17; Mathlib `Matrix.charpoly_mul_comm`.

A proof route identifies, in split coordinates, closed regular orbits with separable nonzero eigenvalues of the product; computes the block characteristic polynomial by a Schur-complement identity, det(T²+XX^τ), so that a zero eigenvalue of the product produces a repeated root 0; and descends the criterion, using the centralizer description of EndoscopicTransferAndUnitaryTraceComparison §1.17(a).

**Checks.**

- For rank-one forms W_i=⟨a_i⟩, r₁(z)=−(a₁/a₂)N(z) and charpoly δ=T²+(a₁/a₂)N(z); z=0 gives T² and is not regular semisimple. At a₁=1, a₂=π and z=1 the constant coefficient is π⁻¹, whereas the standard-form formula T²+N(z) would give 1.
- For standard X=diag(1,π), charpoly r₁=(T+1)(T+π²) and charpoly δ=(T²+1)(T²+π²); the eigenvalues of r₁ are distinct and nonzero.
- In the split rank-two model A=diag(1,0), B=I gives charpoly δ=T²(T²+1). Although −AB has distinct eigenvalues, its zero eigenvalue prevents regular semisimplicity in the symmetric representation.

### 0.5 The contraction torsor and rational-class kernels

Work in the étale setting. On invertible Hom maps, r₁ is a right U(W₂)-torsor over Herm(W₁)^inv as a morphism of F-varieties. On F-points its image is the open and closed subset Ω(W₁,W₂) of invertible y∈Herm(W₁) for which the Hermitian form −h₁(·,y⁻¹·) is isometric to h₂; no rational surjectivity onto all invertible Hermitian endomorphisms is asserted. At X, the projection (g₁,g₂)↦g₁ identifies H_X with the centralizer T_r₁(X) of r₁(X) in U(W₁), with inverse t↦(t,X⁻¹tX). For regular semisimple X it induces an isomorphism D(H_X,U(W₁)×U(W₂);F)≅D(T_r₁(X),U(W₁);F), compatible with inv and with the rational orbits inside a stable class (Leslie25, Lemma 2.3, p. 15; Leslie19, Lemmas 3.6 and 3.9, pp. 12–13; Source corrections, E19 and E20).

*Needs:* §0.4; EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.5, 1.14, 1.17; gap:hermitian-field-classification.

A proof route checks that the geometric fibres are free transitive right U(W₂)-orbits and descends the torsor; solves tX=Xg₂ for the inverse stabilizer map; and uses the determinant description of unitary H¹ to identify the two kernel conditions, the two component obstruction maps agreeing on H¹(F,H_X).

**Checks.**

- For unramified standard rank one, −N(E^×) consists of the elements of even valuation: −1 has a lift and −π does not, although the algebraic quotient map is surjective after separable closure.
- For rank one with W₂=⟨ε⟩, r₁(1)=−ε⁻¹, the fibre is a translate of U(1), and the inverse stabilizer map t↦(t,t) projects back to t.
- In the split rank-one case, r(u,v)=−uv and the fibre over T≠0 is {(u,−T/u):u∈F^×}, on which F^× acts freely and transitively.

### 0.6 Local sections, fibre integration and invariant cutoffs

Work in the étale setting. For the contraction torsor r:Iso_E(W₂,W₁)(F)→Ω(W₁,W₂), prove that every point of Ω has an open neighbourhood with an analytic section, and that integration over the right U(W₂)(F)-fibres maps compactly supported locally constant functions onto C_c^∞(Ω). Prove that for every closed regular orbit O and every f∈C_c^∞(Hom_E(W₂,W₁)) there is a compactly supported locally constant function supported on invertible maps that agrees with f on an open neighbourhood of O (Leslie25, §2.1, p. 16, before Lemma 2.5; Leslie19, Appendix A, Proposition A.3, pp. 25–26).

*Needs:* §§0.3, 0.4, 0.5; ReductiveGroupsPartII §RG2.0.2 (*smooth-group-analytic-charts*); Mathlib `HasStrictFDerivAt.implicitFunction`, `HasStrictFDerivAt.implicitFunctionDataOfComplemented`; Tau Ceti `ImplicitFunctionData.analyticAt_implicitFunction`; AdelicAlgebraicGroups §2.2 (*quotient-measure*).

A proof route: in local analytic coordinates the torsor projection has surjective differential, so the implicit function theorem gives local sections on the F-point image, the split algebra included. They are analytic: the implicit function is that of the datum `HasStrictFDerivAt.implicitFunctionDataOfComplemented`, whose left function is the polynomial contraction and whose right function is an affine continuous projection onto the kernel of the differential, both analytic, so `ImplicitFunctionData.analyticAt_implicitFunction` applies; the spaces are finite-dimensional over the complete field F, hence complete. Cover the compact support of a target function by finitely many compact open trivializing sets and refine to disjoint compact open pieces; on each product chart B×J, with J a compact open subgroup of the fibre group, lift h to h(b)1_J(u)/vol(J). Since 0<vol(J)<∞, the fibre integral is exactly h. For the cutoff, let χ be the invariant quotient map of §0.3 and choose a compact open B containing χ(O) inside the locus where the contracted characteristic polynomial is separable with nonzero constant term; U=χ⁻¹(B) is open and closed and lies in the regular invertible locus by §0.4, and f·1_U is the required function. U itself need not be compact.

**Checks.**

- For unramified standard rank one, f=1_O_E and B=O_F^× give U=O_E^× and f·1_U=1_O_E^×, whose fibre integral is 1_O_F^× when vol U(1)=1.
- On a product chart B×J, the lift h(b)1_J(u)/vol(J) integrates to h(b); omitting the denominator multiplies the answer by 2 when vol(J)=2.
- With the same f, cutting by "determinant a unit" removes 0 and keeps the whole orbit r=−1; the uncut support O_E is not a compact subset of E^× because it contains 0.

### 0.7 Relative orbital integrals

Work in the étale setting. For f∈C_c^∞(Hom_E(W₂,W₁)), regular semisimple X, Haar measures dh₁, dh₂ on U(W₁), U(W₂) and dt on H_X, define RO(f,X) as the integral over the coset space H_X∖(U(W₁)×U(W₂)) of f(h₁⁻¹Xh₂), which is invariant under left translation by H_X since (t₁,t₂)∈H_X means t₁⁻¹Xt₂=X, with the quotient measure determined by dh₁dh₂ and dt. Prove that the integral converges absolutely. The torus measure dt is transported to the centralizer of r₁(X) through the projection of §0.5 (Leslie25, equation (2.3), p. 15; §1.5.4, pp. 11–12).

*Needs:* §§0.5, 0.6; AdelicAlgebraicGroups §2.2 (*quotient-measure*; Weil's formula for integrable functions); EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4.

A proof route forms the invariant quotient measure using the imported modular condition, and obtains convergence from closedness of the regular orbit and compact support.

The supporting API comprises:

- RO(f,X) is the quotient integral above for the supplied Haar measures.
- RO is complex-linear in f.
- Replacing X by g₁Xg₂⁻¹ and transporting the centralizer measure leaves RO unchanged.
- Rescaling dh₁, dh₂, dt by c₁, c₂, c_T>0 rescales RO by c₁c₂/c_T.

**Checks.**

- For unramified standard rank one and a unit X, RO(1_O_E,X)=1 with vol U(1)=1; the zero functional would give 0.
- Keeping the group Haar measures fixed and doubling the stabilizer measure changes that value from 1 to 1/2.
- In the same example, multiplying the two group measures by 2 and 3 and the stabilizer measure by 4 gives 6/4=3/2.

Used by §§0.9 and 1.3.

### 0.8 Orbital pushforward along contraction

Work in the étale setting. For T=r₁(X)∈Ω(W₁,W₂) set r_!f(T)=∫_U(W₂) f(Xu)du, and r_!f(T)=0 for invertible T∉Ω. Prove that r_!f is independent of the lift X; that for f compactly supported in the invertible Hom locus, r_!f is compactly supported and locally constant on the invertible Hermitian locus; that for arbitrary f∈C_c^∞(Hom_E(W₂,W₁)) it is locally constant on the invertible locus with support relatively compact in Herm(W₁), but in general not compact inside the invertible locus; and that r_! maps the compactly supported functions on invertible maps onto C_c^∞(Ω) (Leslie25, equation (2.4) and discussion, p. 16; Leslie19, §3.2, pp. 12–13, and Appendix A, Proposition A.3, pp. 25–26; Source corrections, E19).

*Needs:* §§0.5, 0.6; AdelicAlgebraicGroups §2.2 (*quotient-measure*; Weil's formula for integrable functions).

A proof route compares two lifts by right multiplication and Haar invariance, and proves local constancy and surjectivity for compactly supported f on invertible maps with the local sections and compact partitions of §0.6. For arbitrary f and an invertible T, regular or not, it chooses a compact open neighbourhood B of T inside the invertible locus of Herm(W₁) and replaces f by f·1_(r₁⁻¹(B)): the set r₁⁻¹(B) is open and closed, the support of the product is a closed subset of supp f on which det r₁ lies in the compact set det(B)⊂F^×, so the product is compactly supported in the invertible Hom locus, and it has the same fibre integrals as f at every point of B, because the right U(W₂)-action preserves r₁. The regular-orbit cutoff of §0.6 is needed only in §0.9.

The supporting API comprises:

- r_!f is the right-unitary fibre integral, extended by zero outside the F-point image Ω.
- At T=r₁(X) its value is ∫_U(W₂) f(Xu)du for every lift X.
- r_! is complex-linear.
- For f compactly supported in the invertible locus, the support of r_!f lies in r₁(supp f), a compact subset of the invertible locus.
- Every compactly supported locally constant function on Ω is r_!f for some f compactly supported in the invertible locus.

**Checks.**

- For unramified rank one and f=1_O_E, r_!f(t)=1 if v_F(−t) is even and nonnegative and 0 otherwise, with vol U(1)=1.
- That pushforward is not compactly supported in F^×: its support accumulates at 0 in F.
- For f=1_O_E^× it is the indicator of O_F^×, since −1 is the norm of a unit in the unramified case.
- For unramified standard rank two, f=1_(M₂(O_E)) and the invertible but not regular point T=−I₂, the cutoff by B=−I₂+πHerm₂(O_E) keeps exactly the integral X with XX* in I₂−πHerm₂(O_E), all of which lie in GL₂(O_E). Every T′∈B is −XX* for some X∈GL₂(O_E), and its fibre integral is vol U(Λ₂)=1, so r_!f is constant equal to 1 near −I₂; a cutoff built only around regular orbits gives no statement at −I₂.

Used by §§0.9, 1.5, 4.1, 4.2 and 4.7.

### 0.9 Contraction preserves the orbital integral

Work in the étale setting. Prove that for regular semisimple X and every f∈C_c^∞(Hom_E(W₂,W₁)), RO(f,X)=Orb(r_!f,r₁(X)), where the torus measure is transported by the stabilizer projection of §0.5 and Orb is the ordinary orbital integral of EndoscopicTransferAndUnitaryTraceComparison §2.1; the right side converges although r_!f need not be compactly supported in the invertible locus. Prove that the identity extends termwise to stable and κ-sums through the kernel isomorphism of §0.5 (Leslie25, Lemma 2.5, p. 16).

*Needs:* §§0.5, 0.6, 0.7, 0.8; AdelicAlgebraicGroups §2.2 (quotient measures in stages); EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4.

A proof route integrates in stages through the right-unitary fibre and the projected centralizer; for arbitrary f it first replaces f by a cutoff of §0.6 with the same values near the orbit; the finite stable-class sums follow from the kernel isomorphism.

**Checks.**

- For unramified standard rank one and unit X, RO(1_O_E,X)=1=Orb(r_!1_O_E,−N(X)).
- At X=π⁻¹ both sides for 1_O_E are 0, since v(N(X))=−2; at X=π both sides are 1.
- Doubling the transported torus measure makes both unit-orbit values 1/2; changing the measure on one side only would give 1/2≠1.

### Examples

In unramified standard rank one the whole layer is explicit. The representation is E with (g₁,g₂)·z=g₁zg₂⁻¹ for g_i∈U(1); r₁(z)=−N(z); the regular semisimple elements are z≠0; the torsor fibre over −N(z) is zU(1); H_z≅U(1) by t↦(t,t). For f=1_O_E, RO(f,π^k)=1 for k≥0 and 0 for k<0, and r_!f is the indicator of {t: v(−t) even, ≥0}, which agrees with RO through −N(π^k)=−π^(2k). The cutoff of §0.6 replaces f by 1_O_E^× near the unit orbit.

### Dependencies

Mathlib `Matrix.conjTranspose`, `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self`, `Matrix.isHermitian_conjTranspose_mul_self`, `Matrix.charpoly`, `Matrix.charpoly_mul_comm`, `HasStrictFDerivAt.implicitFunction`, `HasStrictFDerivAt.implicitFunctionDataOfComplemented`; Tau Ceti `ImplicitFunctionData.analyticAt_implicitFunction`; GeometryOfNumbersAndQuadraticArithmetic §2.9; MetaplecticAutomorphicForms §3.2a; SchemeAndStackFoundations §1.24; ReductiveGroupsPartII §RG2.0.2; AdelicAlgebraicGroups §2.2; EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.5, 1.14, 1.17, 2.1, 2.4, 3.3; gap:hermitian-field-classification.

## Layer 1: relative endoscopic data and transfer

Transport ordinary endoscopic data through contraction, keeping form labels, characters, rational-orbit corrections and unmatched vanishing. Existence of transfer is proved for tests supported in the invertible Hom locus.

### 1.1 Relative endoscopic data and their symmetric spaces

Work in the étale setting, with n=a+b and a,b>0. A relative endoscopic datum Ξ consists of an ordinary elliptic endoscopic datum (U(V_a)×U(V_b),s,ξ) for U(W₁) together with Hermitian forms α on E^a and β on E^b. Its symmetric representation is Hom_E(V_α,V_a)⊕Hom_E(V_β,V_b), with acting group (U(V_a)×U(V_α))×(U(V_b)×U(V_β)), and its contraction is r_α,β=(r₁,r₁) into Herm(V_a)⊕Herm(V_b) (Leslie25, §2.3, p. 20). The reference spaces V_a,V_b and the varying spaces V_α,V_β are kept separately even when their unitary groups are isomorphic. For split E there is one Hermitian class in each rank, U(W)=GL_n, and no proper elliptic datum of this block shape exists; the construction is applied only to an existing ordinary datum.

*Needs:* §§0.1, 0.2; EndoscopicTransferAndUnitaryTraceComparison §§1.4, 1.17; gap:hermitian-field-classification.

A proof route imports the ordinary datum and the local Hermitian isometry classes and applies §0.1 separately in ranks a and b.

The supporting API comprises:

- A relative datum is built from an ordinary datum and representatives α,β of Hermitian isometry classes.
- Its representation is Hom(V_α,V_a)⊕Hom(V_β,V_b), and its contraction is (r₁,r₁) into Herm(V_a)⊕Herm(V_b).
- An isometry of α or of β induces an equivariant linear isomorphism of the symmetric representations that preserves the contraction.

**Checks.**

- For a=b=1 over a quadratic field extension, the labels (1,1),(1,ε),(ε,1),(ε,ε) give four elements of (F^×/N(E^×))².
- At the reference labels the representation is End(V_a)⊕End(V_b). At a=b=1 and β=ε the second contraction at 1 is −ε⁻¹, so replacing the form label by the abstract unitary group loses data.
- For E=F×F there is one form class and U(W)=GL_n. The centre of GL_a×GL_b has dimension 2 and that of GL_n dimension 1, so a,b>0 gives no elliptic block datum.

Used by §1.2.

### 1.2 Relative matching and the pullback factor

Work in the étale setting. A regular semisimple element δ_H=(δ_a,δ_b) of the representation of Ξ is source-regular when r₁(δ_a) and r₁(δ_b) have coprime characteristic polynomials, equivalently when the cross-resultant D_ab=∏(λ_a−λ_b) over their eigenvalues is nonzero. Each contracted block is already invertible with separable characteristic polynomial by §0.4, so source-regularity says exactly that the product polynomial is separable; it is the strong G-regularity of EndoscopicTransferAndUnitaryTraceComparison §2.11 read through contraction, and for these unitary Lie algebras, whose regular centralizers are tori, strong and ordinary G-regularity agree. Regular semisimple δ and (δ_a,δ_b) match for Ξ exactly when r₁(δ) and r_α,β(δ_a,δ_b) match in the sense of EndoscopicTransferAndUnitaryTraceComparison §1.17(b); the target of a matching pair is then source-regular, since matching preserves the characteristic polynomial and that of r₁(δ) is separable. Define Δ_rel(δ_H,δ)=Δ(r_α,β(δ_H),r₁(δ)), with Δ the normalized factor of EndoscopicTransferAndUnitaryTraceComparison §§2.9, 2.11, and Δ_rel=0 on nonmatching pairs. The character κ on D(H_δ,U(W₁)×U(W₂);F) is the pullback through the kernel isomorphism of §0.5 of the ordinary character of §1.17(c), trivial on the a-components and nontrivial on the b-components (Leslie25, §2.3, p. 20; §§2.2.2–2.2.3, pp. 18–19).

*Needs:* §§0.5, 1.1; EndoscopicTransferAndUnitaryTraceComparison §§1.17, 2.1, 2.4, 2.9, 2.11; gap:unitary-factor-all-quadratic.

A proof route pulls the ordinary factor back along the pair of contractions and the character along the torsor. For nicely matching contractions the reference factor is η(D)|D|_F with D the cross-resultant, with the κ(inv) correction otherwise (gap:unitary-factor-all-quadratic beyond odd unramified p).

The supporting API comprises:

- A regular target element is source-regular exactly when its two contracted blocks have no common eigenvalue.
- Relative matching is ordinary matching of the contractions; both members of a matching pair are regular, and the target is source-regular.
- Δ_rel(δ_H,δ)=Δ(r_α,β(δ_H),r₁(δ)).
- κ is the pullback of the ordinary endoscopic character to D(H_δ,U(W₁)×U(W₂);F).
- Changing the source rational orbit multiplies the factor by the ordinary κ(inv) correction, in the orientation fixed by the base roadmap.

**Checks.**

- For a=b=1 with distinct nonzero contracted scalars x,y and a nice match, Δ=η(x−y)|x−y|_F; for unramified E and x−y=π this is −q⁻¹, also at q=2.
- For two blocks whose characteristic polynomials do not multiply to the source polynomial, matching fails and Δ=0 even if each block is separately regular.
- For x−y a unit in the unramified case, Δ=1; for x=y the cross-resultant vanishes, the pair is not source-regular, and the nonzero formula is not invoked.

Used by §§1.3 and 1.4.

### 1.3 Stable and weighted relative orbital sums

Work in the étale setting. For regular semisimple δ in a fixed symmetric representation and a character κ of D(H_δ,U(W₁)×U(W₂);F), set RO^κ(f,δ)=Σ κ(inv(δ,δ′))RO(f,δ′), the sum over the rational orbits δ′ in the stable class of δ, with inv transported from contraction in the orientation of EndoscopicTransferAndUnitaryTraceComparison §1.14. SRO is the case κ=1. The sum ranges over the fixed symmetric space, not over all pure inner forms (Leslie25, §2.3.1, p. 20).

*Needs:* §§0.5, 0.7, 1.2; EndoscopicTransferAndUnitaryTraceComparison §§1.14, 2.4.

A proof route indexes the finite sum by the kernel of §0.5 and transports the centralizer measure consistently to each class.

The supporting API comprises:

- RO^κ is the character-weighted sum of RO over the finite D-torsor of rational orbits.
- SRO is RO^κ for the trivial κ.
- RO^κ is complex-linear in f.
- Moving the basepoint by d₀ multiplies RO^κ by κ(d₀)⁻¹, transported from EndoscopicTransferAndUnitaryTraceComparison §2.4.

**Checks.**

- For a stable class with D=C₂ and orbital values 2 at the base orbit and 5 at the other, SRO=7; the zero functional gives 0 and a sum over the base orbit alone gives 2.
- In the same example the nontrivial character gives 2−5=−3; the trivial character would give 7.
- Moving the base orbit by the nontrivial d₀ gives 5−2=3=κ(d₀)⁻¹(−3) with κ(d₀)=−1; omitting κ(d₀)⁻¹ would leave −3.

Used by §1.4.

### 1.4 The relative smooth-transfer relation

Work in the étale setting. Compactly supported locally constant functions f on the source representation and f_Ξ on the representation of Ξ are transfers if SRO(f_Ξ,δ_H)=Δ_rel(δ_H,δ)RO^κ(f,δ) for every matching regular pair, and SRO(f_Ξ,δ_H)=0 for every source-regular δ_H (§1.2) with no regular source match (Leslie25, Definition 2.10, p. 21; Source corrections, E17). Target orbits that are regular but not source-regular are not tested, as in the ordinary relation of EndoscopicTransferAndUnitaryTraceComparison §2.11. This is a relation between functions, well defined on orbital-integral classes; no preferred representative is selected.

*Needs:* §§0.9, 1.2, 1.3.

A proof route shows that the identity is independent of the source rational representative using the basepoint law of §1.3 and the κ(inv) correction of §1.2; the unmatched clause is kept as a separate condition.

The supporting API comprises:

- The relation is the conjunction of the matching identity and the unmatched-vanishing condition at source-regular targets.
- The sum of two transfer pairs is a transfer pair.
- Multiplying both members by one complex scalar preserves the relation.
- Changing the target by a function whose stable relative orbital integrals vanish at every source-regular target orbit preserves the relation.

**Checks.**

- At one matching orbit with Δ=−q⁻¹ and source κ-integral A, the target stable integral must be −A/q; the value A is a different relation whenever A≠0.
- At an unmatched source-regular target orbit, target stable integral 1 violates transfer of the zero source, which requires 0.
- For the same source, targets with orbital values B and B+C, where C=0 at every source-regular target orbit, define the same transfer class; C≠0 at one source-regular orbit changes it.
- Unramified, a=b=1, reference labels, c∈O_E^× with N(c)=−1: the target (c,c) has contracted blocks (1,1), each regular, with cross-resultant 0, so it is not source-regular and no regular source element matches it; the tensor lattice unit 1_(End(Λ₁))⊗1_(End(Λ₁)) has stable value 1·1=1 there. Imposing the zero clause at every regular unmatched target would contradict §4.10 by 1≠0. Replacing the second block by c′ with −N(c′)=1+π gives resultant −π: that target is source-regular, matched, with factor η(−π)|π|_F=−q⁻¹.

Used by §§1.5, 3.6, 4.9 and 4.10.

### 1.5 Transfer for tests supported on invertible maps

Work in the étale setting. Prove that if f has compact support inside the invertible Hom locus, then for every relative datum Ξ of §1.1 there is a compactly supported locally constant transfer f_Ξ supported in the invertible locus of the target representation (Leslie25, Definition 2.10 and the discussion after it, p. 21; Leslie19, Proposition 1.3, p. 4, and Proposition 4.5, p. 15; Source corrections, E19). This concerns support away from the singular locus and is not general relative transfer.

*Needs:* §§0.6, 0.8, 0.9, 1.4; EndoscopicTransferAndUnitaryTraceComparison §4.7.

A proof route pushes f to the ordinary Hermitian space and extends by zero from the invertible locus; applies EndoscopicTransferAndUnitaryTraceComparison §4.7; multiplies the ordinary transfer by a compact open cutoff on the characteristic-coefficient base equal to one on the invariant support of the source and zero near determinant zero, which preserves every transfer identity; restricts to the stable component Ω(V_a,V_α)×Ω(V_b,V_β) of the target contraction; and lifts by fibre integration (§0.6). Matching and unmatched vanishing at source-regular targets follow from §0.9 and the ordinary relation at G-regular targets.

**Checks.**

- In unramified rank one, 1_O_E^× has compact support in the invertible locus and pushes to 1_O_F^×; 1_O_E contains 0 and does not satisfy the hypothesis.
- 1_O_E pushes to a function equal to 1 at π^(2j) for every j≥0; these points accumulate at 0, so it is not a compact test on F^× and the ordinary transfer theorem does not apply to it without a cutoff.
- On a target chart with vol(J)=2 and h=1_B, the lift (1/2)1_(B×J) pushes to 1_B; the lift 1_(B×J) would give 2·1_B and the wrong orbital identity.

### Examples

For a=b=1 over an unramified quadratic field extension, with source spaces W₁=W₂=V₂, the four relative data on one ordinary datum have labels (1,1),(1,π),(π,1),(π,π). For the first, a source orbit with contraction diag(x,y), v(x)=2, v(y)=0, matches the target pair (x,y), with Δ_rel=η(x−y)|x−y|_F=1 since x−y is a unit; for the label (π,1) every target contraction (x,y) has v(x) odd and v(y) even, so x≠y, the target is source-regular, and its determinant xy has odd valuation. Every source contraction has determinant det(−XX*)=N(det X), of even valuation, although its eigenvalues may each have odd valuation, as for the regular element z=diag(π,πu) with u∈O_F^× different from 1: the form −h₁(·,z⁻¹·) has determinant π⁻²u⁻¹, of even valuation, so it is isometric to the standard rank-two form and z∈Ω(V₂,V₂). Hence no source orbit matches, and transfer imposes only the unmatched-vanishing clause there. The source spaces matter: for W₁=V₂ and W₂=(E²,diag(1,π)), X=I₂ has X^τ=diag(1,π⁻¹) and r₁(X)=−diag(1,π⁻¹), of determinant valuation −1; with these source spaces every target (x,y) of label (π,1) has a matching source orbit, since −h₁(·,diag(x,y)⁻¹·) then has odd discriminant valuation, as diag(1,π) does.

### Dependencies

§§0.1, 0.2, 0.5, 0.6, 0.7, 0.8, 0.9; EndoscopicTransferAndUnitaryTraceComparison §§1.4, 1.14, 1.17, 2.1, 2.4, 2.9, 2.11, 4.7; gap:hermitian-field-classification; gap:unitary-factor-all-quadratic.

## Layer 2: Hermitian spherical functions and base change

Keep every dominant integral coweight and, in positive rank, both Hermitian form classes. Hironaka's transform identifies the full module; its cyclic base-change submodule is strictly smaller in positive rank.

### 2.1 The spherical module on all invertible Hermitian matrices

Work in the unramified setting. Let X_n={y∈GL_n(E): y*=y}, with GL_n(E) acting by g∗y=gyg*. For n>0 both GL_n(E)-orbits of Hermitian forms are kept; X_0 is a single point and H(X_0)=ℂe_0. Define H(X_n)=C_c^∞(X_n)^(K_n,E), a module over the spherical Hecke algebra H_n,E of GL_n(E) by (φ∗f)(y)=∫φ(g)f(g⁻¹∗y)dg with vol K_n,E=1. Its basis consists of the indicators e_λ of the K_n,E-orbits K_n,E∗π^λ, for dominant λ∈ℤ^n, negative entries included; e_0 is the indicator of the integral unimodular orbit (Leslie25, §3.2, equation (3.7), p. 26). No convolution product on X_n is implicit in this definition.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9; gap:hermitian-field-classification; gap:unramified-hermitian-lattice-orbits; SmoothRepresentationsOfLocalGroups §SR.4.1 (*satake-isomorphism*); AdelicAlgebraicGroups §2.2 (Weil's formula for integrable functions).

A proof route classifies K_n,E-orbits by dominant integral tuples using integral Hermitian diagonalization (gap:unramified-hermitian-lattice-orbits), notes that a compactly supported invariant function meets finitely many of these open orbits, and obtains the module laws by group convolution and Fubini.

The supporting API comprises:

- H(X_n) is the complex vector space of compactly supported locally constant K_n,E-invariant functions on X_n.
- For dominant λ∈ℤ^n, e_λ is the indicator of the orbit of π^λ; distinct λ give disjoint orbits.
- The e_λ form a basis: each element has a unique finite expansion.
- The displayed integral is a unital H_n,E-module structure.
- Extension by zero sends H(X_n) into the compactly supported locally constant functions on Herm(V_n).

**Checks.**

- For n=1, e_(1) is nonzero and lies on the other GL_1(E)-orbit from e_(0).
- For n=1, e_(−1) is the indicator of π⁻¹O_F^× and is a valid compactly supported function.
- The Hecke unit 1_K acts as the identity on every e_λ.
- Distinct dominant λ have disjoint supports; e_(0) and e_(1) are linearly independent in rank one.
- For n=0 the only coweight is the empty tuple, X_0 is one point with det=1 and valuation 0, and the basis is {e_0}; a two-orbit count would be wrong.

Used by §§2.3, 3.7, 3.8, 4.2, 4.3, 4.7 and 4.8.

### 2.2 Quadratic base change commutes with the twisted Levi maps

Work in the unramified setting, with n=a+b. For every m≥0 define BC_m:H_m,E→H_m,F as the unique complex-algebra homomorphism whose composite with the normalized Satake isomorphisms of SmoothRepresentationsOfLocalGroups §SR.4.1, over E and over F, is the substitution Z_i↦T_i² of symmetric Laurent polynomials, Z_i being the normalized E-Satake variables and T_i the normalized F-Satake variables, with the positive square roots of q_E=q² and q. The substitution maps symmetric Laurent polynomials in Z to symmetric Laurent polynomials in T and distinct monomials to distinct monomials, so BC_m exists, is unital and is injective; it is the unramified base-change homomorphism of spherical Hecke algebras, whose orbital association EndoscopicTransferAndUnitaryTraceComparison §4.9(b) states and no target here uses. Define ξ_F on the spherical Hecke algebra of GL_n(F) by the construction of ξ_E in SmoothRepresentationsOfLocalGroups §SR.4.3 with |·|_F in both twists and in normalized descent; on normalized Satake variables it substitutes T_i↦q^(−b/2)X_i for i≤a and T_j↦q^(−a/2)Y_j for j>a. Prove that BC_(a,b)∘ξ_E=ξ_F∘BC_n; both composites substitute q⁻ᵇX_i² and q⁻ᵃY_j² (Leslie25, proof of Proposition 4.8, p. 39; Lemma 3.2, p. 24). The identity does not imply that base change is supported on coweights with all entries even.

*Needs:* SmoothRepresentationsOfLocalGroups §§SR.4.1 (*satake-isomorphism*), SR.4.3 (*parabolic-descent*).

A proof route defines BC_m by transporting the substitution through the two Satake isomorphisms, computes both composites of the square on Laurent variables and descends to symmetric Laurent polynomials by injectivity of the Satake transform (Source corrections, E10).

The supporting API comprises:

- BC_m:H_m,E→H_m,F is a unital injective homomorphism of complex algebras, and the normalized F-Satake transform of BC_m(φ) is that of φ with each Z_i replaced by T_i².
- For m=1 and d∈ℤ, BC_1 sends 1_(π^dO_E^×) to 1_(π^(2d)O_F^×); BC_0 is the identity of ℂ.
- ξ_F maps H_n,F=H(GL_n(F),K_n,F) to H_a,F⊗H_b,F, the spherical Hecke algebra of GL_a(F)×GL_b(F) for K_a,F×K_b,F.
- For f∈H_n,F, ξ_F(f)(m₁,m₂)=|det m₁|_F^(b/2)|det m₂|_F^(a/2)f^P(m₁,m₂), where f^P is the δ_P^(1/2)-normalized descent along the upper parabolic P_(a,b) with vol N_(a,b)(O_F)=1 and δ_P(m₁,m₂)=|det m₁|_F^b|det m₂|_F^(−a); equivalently ξ_F(f)(m)=|det m₁|_F^b∫_N f(mu)du.
- The normalized Satake transform of ξ_F(f) is that of f with T_i↦q^(−b/2)X_i for i≤a and T_j↦q^(−a/2)Y_j for j>a.
- ξ_F is a unital homomorphism of complex algebras, being normalized descent followed by multiplication by an unramified character of the Levi.
- With BC_(a,b)=BC_a⊗BC_b, the square BC_(a,b)∘ξ_E=ξ_F∘BC_n commutes.

**Checks.**

- For a=b=1 the first Satake variable goes by either composite to q⁻¹X²: (q^(−1/2)X)²=q⁻¹X².
- The central monomial Z₁Z₂ goes under ξ_E to q⁻²XY; at q=2 the coefficient 1/4 excludes untwisted Levi restriction.
- For n=2, BC(T_(1,0),E)=T_(2,0),F−(q−1)T_(1,1),F; at q=2 the coefficient −1 of the odd coweight (1,1) is nonzero, although the Satake substitution squares the variables.
- For m=1, BC_1(1_(πO_E^×))=1_(π²O_F^×): the E-Satake transform Z goes to T², the transform of 1_(π²O_F^×). The unsquared substitution Z↦T would give 1_(πO_F^×), supported on non-norms, where the base-change image of a GL_1(E) function must vanish.

### 2.3 Hironaka's normalized spherical Fourier isomorphism

Work in the unramified setting. Fix the invariant measure dμ(y)=C|det y|_F^(−n)dy on X_n, where dy is the additive Haar measure on Herm_n(E) giving the integral lattice volume one and C>0 makes μ(K_n,E∗I_n)=1; the orbit K_n,E∗I_n is nonempty, compact and open, so C exists. Use Hironaka's normalized spherical functions Y_z(y)=ω(y;z)/ω(I_n;z) as rational functions of U_i=q^(−z_i) under Hironaka's change of variables (2.2), and the transform f̂(U)=∫_(X_n)f(y)Y_z(y⁻¹)dμ(y); the denominator is a nonzero rational function by Hironaka's explicit formula, and f̂ is a symmetric Laurent polynomial in U₁,…,U_n. The Hecke algebra H_n,E acts on transforms through Hironaka's (2.3), the normalized E-Satake transform evaluated at Z_i=U_i². Fix the spectral dictionary U_i↦−T_i in every rank, T₁,…,T_n being the normalized F-Satake variables, and define H_n(f) as the spherical function on GL_n(F) whose normalized Satake transform is f̂(−T₁,…,−T_n). Prove that H_n:H(X_n)→H(GL_n(F),K_n,F) is a complex-linear isomorphism with H_n(e_0)=1_K_n,F and H_n(φ∗f)=BC_n(φ)∗H_n(f); that H(X_n) is a free H_n,E-module of rank 2^n; and that the cyclic map φ↦φ∗e_0 is injective, and for n>0 not surjective (Leslie25, Proposition 3.4 and Remarks 3.6–3.7, pp. 26–27; Hironaka99, equations (2.2)–(2.3), p. 566, Theorem 1, p. 569, equations (2.5)–(2.7) and Theorem 2, p. 571). Through H_n, the convolution algebra of GL_n(F) transports to an algebra structure on H(X_n).

The dictionary is part of the definition. It sends U_i² to T_i², the base-change substitution; since ê_λ is homogeneous of degree |λ| in U, the opposite dictionary U_i↦T_i has the same unit, module law and cyclic values but changes the sign of H_n(e_λ) for every λ with |λ| odd, which is the whole nonreference orbit, since the discriminant π^|λ| of π^λ is a norm exactly when |λ| is even (`TauCeti.mem_normGroup_iff_dvd_normalizedValuation`).

*Needs:* §§2.1, 2.2; SmoothRepresentationsOfLocalGroups §SR.4.1 (*satake-isomorphism*) and §SR.4.3 (*hall-littlewood*); Tau Ceti `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`.

A proof route uses Hironaka's Theorem 2 with q and the reference orbit matched: Hironaka's (2.6) gives ê_λ as a multiple of the Hall–Littlewood polynomial P_λ(U;−q⁻¹) of SmoothRepresentationsOfLocalGroups §SR.4.3 (*hall-littlewood*), and (2.7) the orbit volumes. The dictionary is an automorphism of the symmetric Laurent algebra sending U_i² to T_i²; composing with the inverse normalized F-Satake transform gives H_n. The symmetric Laurent algebra is free of rank 2^n over its squared-variable subalgebra, which gives freeness and cyclic injectivity.

The supporting API comprises:

- H_n is the normalized isomorphism from the full Hermitian module onto the spherical Hecke algebra of GL_n(F).
- The normalized F-Satake transform of H_n(f) is f̂ with U_i replaced by −T_i.
- H_n(e_0)=1_K_n,F.
- H_n(φ∗f)=BC_n(φ)∗H_n(f) for φ∈H_n,E.
- The inverse sends BC_n(φ) to φ∗e_0, and both composites with H_n are the identity on the full spaces.
- φ↦φ∗e_0 is injective, and its image under H_n is exactly the base-change subalgebra.

**Checks.**

- H_1(e_(0))=1_O_F^×.
- The Hecke indicator of π^dO_E^× sends e_(0) to e_(2d), and H_1(e_(2d)) is the indicator of π^(2d)O_F^×.
- In rank one e_(1) is not of the form φ∗e_(0).
- For f=e_(1), H_1⁻¹(H_1(f))=f; the inverse identity includes the noncyclic part.
- In rank one ê_j=(−1)^jU^j, so H_1(e_j)=1_(π^jO_F^×) for every j∈ℤ; the opposite dictionary would give H_1(e_1)=−1_(πO_F^×).
- In rank two the orbit of π^(1,0) has μ-volume q−1 and ê_(1,0)=√q(U₁+U₂). Since normalized Satake sends T_(1,0),F to √q(T₁+T₂), H_2(e_(1,0))=−T_(1,0),F; the opposite dictionary gives +T_(1,0),F while agreeing on every cyclic Check.
- In rank two ê_(2,0)=q(U₁²+U₂²)+(q+1)U₁U₂ and ê_(1,1)=−U₁U₂, so H_2(e_(2,0)+(q+1)e_(1,1))=T_(2,0),F−(q−1)T_(1,1),F=BC_2(T_(1,0),E). The rule H_n(e_λ)=T_λ,F already fails at e_(1,1), which lies on the reference orbit but outside the cyclic image.

Used by §§3.6, 4.3, 4.6 and 5.1.

### Examples

In rank one everything is explicit: X_1=F^×, the orbits are π^jO_F^× (j even on the reference form, odd on the other), e_j is the indicator of π^jO_F^×, the Hecke indicator of π^dO_E^× acts by e_j↦e_(j+2d), ê_j=(−1)^jU^j, and H_1(e_j)=1_(π^jO_F^×). The cyclic image is the span of the e_(2d), and the module has basis {e_0,e_1} over H_1,E, of rank 2=2¹.

### Dependencies

§2.1 for §§2.2–2.3; GeometryOfNumbersAndQuadraticArithmetic §2.9; SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.3; AdelicAlgebraicGroups §2.2; Tau Ceti `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`; gap:hermitian-field-classification; gap:unramified-hermitian-lattice-orbits.

## Layer 3: local comparison reductions

Use the imported orbit torsor and the local Jacquet–Rallis contracts to derive normalized finite inversion, descent and the spherical implications. The germ statements allow ramified extensions; the spherical applications keep the unramified hypotheses.

### 3.1 The orbit torsor across both Hermitian forms

Work in the field setting. Use the isometry torsor and inv of EndoscopicTransferAndUnitaryTraceComparison §1.17(b) across pure forms. For regular semisimple x∈gl_n(F) with F[x]=∏F_i, put E_i=E⊗_F F_i and S₁={i: E_i is a field}. Prove that matching (x,v,v*ζ) with (y_ζ,w_ζ), for a cyclic reference triple, gives a bijection F[x]^×/N(E[x]^×)→S onto the set S of regular Hermitian orbits matching x on both forms, equivariant for the imported H¹(F,T_y)-action; in these coordinates the character attached to Σ⊆S₁ is κ_Σ(ζ)=∏_(i∈S₁∖Σ)η_(E_i/F_i)(ζ_i) (Leslie25, Proposition 4.5, Lemma 4.6 and the definition of κ_Σ, pp. 35–36; Xiao18, Proposition 3.8, pp. 11–12, and Lemma 4.6, pp. 19–20).

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17; gap:hermitian-field-classification; gap:jr-local-comparison.

A proof route imports the torsor from EndoscopicTransferAndUnitaryTraceComparison §1.17(b), identifies each factor form with its norm class by equality of the cyclic Gram invariants, uses nondegeneracy and cyclicity for injectivity and surjectivity, and evaluates the complementary-coordinate characters; no second torsor or inv map is constructed.

**Checks.**

- For rank one over a field extension, S consists of the two norm classes 1,ε, with one orbit on each fixed Hermitian form; the bijection has size 2, not 1.
- If S₁ is empty, the norm quotient is trivial and every κ_Σ is 1.
- For two nonsplit factors, ζ=(ε,1) and Σ={1}, κ_Σ(ζ)=1, while Σ={2} gives −1; interchanging Σ with its complement fails this Check.

### 3.2 Regularized generalized nilpotent orbital distributions

Work in the field setting; all torus maximal compact subgroups have volume one, and quotient measures are transported through the fixed stabilizer identifications. Fix regular semisimple x∈gl_n(F), cyclic v and v*, and F[x]=∏F_i and S₁ as in §3.1. Let T=F[x]^× and T₁=∏_(i∈S₁)F_i^×. For Σ⊆S₁ let v_Σ have components v_i for i∈Σ and 0 otherwise, and v*_(S₁∖Σ) analogously, with every component outside S₁ zero. Define G_Σ(f) as the integral over GL_n(F)/T of the value at s=0 of the meromorphic continuation of the T₁-integral of f(gxg⁻¹, gtv_Σ, v*_(S₁∖Σ)t⁻¹g⁻¹)η(det t)η(det g)∏_(i∈Σ)|t_i|^s∏_(i∈S₁∖Σ)|t_i|^(−s) (Leslie25, §4.2, p. 36; Xiao18, §2.1, equation (2) and Lemma 2.1, pp. 3–5, and §4.1, p. 15). This is the raw regularized integral; the finite-Fourier averaging enters only in §3.3.

*Needs:* §3.1; AdelicAlgebraicGroups §2.2 (*quotient-measure*; Weil's formula for integrable functions); AutomorphicLFunctionsAndLocalFactors AL.1.1.2, AL.1.2.1, AL.1.2.3; Tau Ceti `TauCeti.ClassFieldTheory.artinMap_norm`, `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`, `TauCeti.index_normGroup_of_isCyclic`; EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4; gap:jr-local-comparison.

A proof route factors compactly supported functions near the orbit into finite sums of pure tensors in the coordinates t_i∈F_i^×, i∈S₁. For i∈S₁ the character η_i=η∘N_(F_i/F) of F_i^× is the quadratic character of the field E_i=E⊗_F F_i over F_i. Its kernel contains N(E_i^×) by transitivity of the norm through E_i/E and E/F. Conversely, suppose N_(F_i/F)(x)=N_(E/F)(y). By `TauCeti.ClassFieldTheory.artinMap_norm` for E/F the Artin symbol of N_(E/F)(y) is represented by an element of Gal(F̄/E), and by the same theorem for F_i/F the image in Gal(F̄/F) of a representative τ of the Artin symbol of x represents the same class; since E/F is abelian, two representatives of one class agree on E, so τ fixes E as well as F_i, hence E_i, and x is a norm from E_i (`TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`). Hence the kernel is N(E_i^×), which has index 2 in F_i^× (`TauCeti.index_normGroup_of_isCyclic`), so η_i is nontrivial. Each factor integral is then a local Tate zeta integral over F_i with the nontrivial character η_i, after t_i↦t_i⁻¹ for the covector factors (AutomorphicLFunctionsAndLocalFactors AL.1.1.2); its continuation is regular at s=0, being L(s,η_i)z₀ with L(s,η_i)=(1+q_i^(−s))⁻¹, q_i the residue cardinality of F_i, when η_i is unramified (AL.1.2.1) and entire when η_i is ramified (AL.1.2.3). The route then checks that the value at s=0 is independent of the T-coset representative, and uses compactness on GL_n(F)/T for the outer integral.

The supporting API comprises:

- G_Σ is the regularized integral above, for x, Σ and the chosen cyclic reference data.
- G_Σ is a complex-linear functional on the augmented linear test space gl_n(F)×F^n×(F^n)*.
- Conjugating the triple by g multiplies the distribution by η(det g).
- Scaling the surviving v_i by c_i≠0 for i∈Σ and the surviving v_i* by d_i≠0 for i∈S₁∖Σ multiplies G_Σ by ∏_(i∈Σ)η_i(c_i)∏_(i∈S₁∖Σ)η_i(d_i), with η_i=η∘N_(F_i/F).

**Checks.**

- In unramified rank one with Σ={1}, x fixed and vector test 1_O_F^×, the raw Tate integral is 1.
- With vector test 1_(πO_F^×) it is η(π)=−1.
- With vector test 1_O_F the Tate expression is Σ_(k≥0)(−q^(−s))^k=1/(1+q^(−s)), whose value at s=0 is 1/2, not 1.

Used by §§3.3 and 3.5.

### 3.3 Germ inversion with an explicit finite-Fourier normalization

Work in the field setting with volume-one torus measures. Suppose f and the family {f_V} are augmented Jacquet–Rallis transfers for the cyclic-vector factor ω. Prove that for regular semisimple x with r=#S₁, matching reference data (y,w) and Σ⊆S₁, ω(x,v,v*)G_Σ(f)=2^(−r)Σ_(ζ∈S)κ_Σ(ζ)Orb_U(V_ζ)(f_(V_ζ)(·,0),y_ζ), the orbit sum running over both Hermitian forms (Leslie25, Theorem 4.7, p. 36; Xiao18, §§4.1–4.5, pp. 15–21, in particular Theorem 4.7 and the inversion before it, pp. 20–21). Equivalently, the Fourier-normalized germ is 2^rG_Σ (Source corrections, E11).

*Needs:* §§3.1, 3.2; EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4; gap:jr-local-comparison.

A proof route starts from the forward identities of Xiao18, (7), p. 19: for each norm-class coordinate ζ the ordinary orbital integral is ω times a character-weighted sum of raw germs. Lemma 4.6 of Xiao18 identifies the coordinates with the torsor of §3.1. For A=(ℤ/2)^r, Σ_(ζ∈A)κ(ζ)κ′(ζ)=2^r if κ=κ′ and 0 otherwise, so the forward identities invert with the factor 2^(−r). The maximal-compact-volume-one centralizer measures of Leslie25 §1.5.4, p. 12, are used in both expansions; the averaging factor comes only from the character table.

**Checks.**

- In unramified rank one with the augmented lattice unit and v=v*=1, ω=1, the raw germ is 1/2 and the orbital values on the two forms are (1,0): 1/2=(1/2)(1+0), whereas the unaveraged sum is 1.
- With v=π and v*=π⁻¹ in the same regular triple, ω=−1 and the raw germ is −1/2, so ωG=1/2=(1/2)(1+κ·0); the sign changes on both sides.
- For r=2 the character table H has HHᵗ=4I and inverse Hᵗ/4; on the vector (1,0,0,0) each inverse coefficient is 1/4, not 1; for r=0 the coefficient is 1.

### 3.4 Additive parabolic descent on augmented linear tests

Work in the unramified setting, with n=a+b. For an augmented linear test f(x,v,v*), define f_p(m₁,m₂,v,v*)=∫∫f(k[[m₁,u],[0,m₂]]k⁻¹, kv, v*k⁻¹)dk du, over u∈Lie N_(a,b)(F) and k∈K_n,F, where du is additive with Lie N(O_F) of volume one and vol K_n,F=1; no δ_P^(1/2) occurs in the definition. With L_n=O_F^n⊕(O_F^n)*, prove that for spherical φ on GL_n(F), extended by zero to gl_n(F), the descent of φ⊗1_(L_n) is ξ_F(φ)⊗1_(L_a×L_b) (Leslie25, Definition 4.9, p. 38, and the Jacobian computation in the proof of Proposition 4.8, p. 39).

*Needs:* §2.2; SmoothRepresentationsOfLocalGroups §§SR.4.1 (*satake-isomorphism*), SR.4.3 (*parabolic-descent*); AdelicAlgebraicGroups §2.2 (*quotient-measure*; Weil's formula for integrable functions).

A proof route uses K-stability of L_n to factor out the vector-lattice indicator; changes variables u=m₁u′, with Jacobian |det m₁|_F^b; and compares with δ_P^(1/2) and the two half-power twists to identify ξ_F.

The supporting API comprises:

- f_p is the double integral over Lie N_(a,b)(F) and K_n,F above.
- Descent is a complex-linear map between augmented test spaces.
- For spherical φ on GL_n(F), (φ⊗1_(L_n))_p=ξ_F(φ)⊗1_(L_a×L_b).
- On invertible Levi matrices the additive integral is |det m₁|_F^b times unnormalized group descent; after δ_P-normalization this is ξ_F.

**Checks.**

- For n=2, a=b=1, the descent of 1_(M_2(O_F))⊗1_(L_2) is 1_(O_F)⊗1_(O_F)⊗1_(L_1)⊗1_(L_1).
- If a vector coordinate has negative valuation, the descended lattice-vector test vanishes even when both Levi matrices are integral.
- For a=b=1 and m₁=π, the substitution u=m₁u′ multiplies additive measure by q⁻¹; omitting this factor breaks ξ_F-compatibility.

Used by §§3.5 and 3.6.

### 3.5 Cyclic determinant factors and the descent Jacobian

Let x=diag(x_a,x_b) with separable, disjoint block spectra, v=(v_a,v_b) and v*=(v_a*,v_b*) cyclic in each block, Ω=Ω_a∧Ω_b and D_ab=∏_(λ_a,λ_b)(λ_a−λ_b)≠0. In the field setting, prove that ω=η(det[v,xv,…,x^(n−1)v]/Ω) satisfies ω_n=η((−1)^(ab)D_ab)ω_aω_b, every displayed cyclic determinant being nonzero; this identity uses the full cyclic vectors. For the descent, decompose F[x_a]=∏F_i and F[x_b]=∏F_j separately into field factors, so that F[x]=F[x_a]×F[x_b] and S₁=S₁(a)⊔S₁(b), where S₁(a) and S₁(b) are the factors of the two blocks with E⊗_F F_i a field. In the unramified setting, prove that additive parabolic descent satisfies G_(S₁(a))(f)=|D_ab|_F⁻¹G_(a,b)(f_p), where the left side is the distribution of §3.2 in rank n at (x,v,v*) with Σ=S₁(a), and G_(a,b) is the product of the §3.2 distributions G_(S₁(a)) at (x_a,v_a,v_a*) and G_∅ at (x_b,v_b,v_b*), extended from pure tensors by linearity. So the vector survives exactly on the factors in S₁(a) and the covector exactly on the factors in S₁(b), both coordinates are zero on every factor outside S₁, the mixed case with factors outside S₁ is included, and the compact average and Haar measures are those of §3.4. Thus in the unramified endoscopic diagram the reciprocal descent Jacobian and the cyclic factor give η(D_ab)|D_ab|_F, the rational-class correction being the imported κ(inv) (Xiao18, §2.1, conditions (1)–(3) before equation (2), p. 4; Lemma 5.1, pp. 21–22; proof of Theorem 6.1, p. 24; Source corrections, E14).

*Needs:* §§3.1, 3.2, 3.3, 3.4; gap:jr-local-comparison; gap:unitary-factor-all-quadratic.

A proof route factors the ordered Vandermonde determinant: the cross factors are λ_b−λ_a, and pulling out the two block determinants leaves (−1)^(ab)D_ab. For the descent, write g=knm with m in the Levi; the centralizer T of x lies in the Levi, and since the surviving vector has zero b-block and the surviving covector zero a-block, both are fixed by the upper unipotent radical, so the N-integral passes to the matrix argument alone. On the off-block matrix space the map u↦x_au−ux_b has determinant D_ab, so the change of additive variables gives |D_ab|_F⁻¹. The unramified character is trivial on K_n,F, so the compact average agrees with §3.4. Since the arguments in each rank are those of §3.2, the inner values at s=0 are constant on T-cosets in both ranks; a nonzero coordinate on a factor outside S₁ breaks this (fourth Check). The normalization comparison uses the ordinary factor of gap:unitary-factor-all-quadratic.

**Checks.**

- For a=b=1, v_a=v_b=1 and x=diag(x_a,x_b), the cyclic determinant is x_b−x_a=−D_ab; over an unramified extension η(−1)=1, so ω_n=η(D_ab)ω_aω_b.
- For F=ℚ₃, E=ℚ₃(√3), x_a=0, x_b=1: D_ab=−1, η(−1)=−1 and ω_n=η(1)=1. The signed formula gives η((−1)D_ab)=η(1)=1; the unsigned formula would give η(−1)=−1.
- In the unramified a=b=1 descent with x_a−x_b=π, the off-block map is multiplication by π, of modulus q⁻¹, and the raw orbital integral acquires the factor q=|D_ab|_F⁻¹; the ordinary factor is η(π)|π|_F=−q⁻¹.
- Mixed factors: F=ℚ₃, E=ℚ₃(√2) (unramified, 2 being a nonsquare mod 3), a=2, b=1, x=diag(x_a,1) with x_a=[[0,2],[1,0]], v=(1,0,1) and v*=e₁*+e₃*, cyclic in each block. Then F[x_a]≅E, so E⊗_F F[x_a] is split, S₁(a)=∅ and S₁(b) is the single b-factor; the prescribed arguments are the vector 0 and the covector e₃*. Here D_ab=(√2−1)(−√2−1)=−1, and the full cyclic matrix [[1,0,2],[0,1,0],[1,1,1]] has determinant −1=(−1)^(ab)D_ab·1·1. Take the test 1_(x+3M₃(ℤ₃))(z)·1_(e₁+3ℤ₃³)(u)·1_(ℤ₃²×ℤ₃^×)(u*). Keeping instead the vector e₁ on the split a-factor gives inner value 1 at g=I and 0 at g=diag(3,3,1), which lies in T and represents the same coset, so the outer integral over GL₃(F)/T is not defined. With the prescribed vector 0 both values are 0, and replacing the vector factor by 1_(3ℤ₃³) gives 1 at both.

### 3.6 From augmented Jacquet–Rallis to cyclic endoscopic transfer

Work in the unramified setting. Assume that for every positive rank m and every φ∈H_m,E, the augmented tests BC_m(φ)⊗1_(L_m) and {(φ∗e_0)⊗1_(Λ_m),0} are Jacquet–Rallis transfers. Prove that then for every n=a+b with a,b>0 and every φ∈H_n,E, the functions φ∗e_0 on Herm(V_n) and ξ_E(φ)∗e_0 on Herm(V_a)⊕Herm(V_b) are ordinary endoscopic transfers in the sense of EndoscopicTransferAndUnitaryTraceComparison §2.11, with the factor of §2.12 and the unmatched-vanishing clause (Leslie25, Proposition 4.8, pp. 37–39). The hypothesis is needed in all ranks used by the two Levi blocks, not only in rank n.

*Needs:* §§1.4, 2.2, 2.3, 3.1, 3.3, 3.4, 3.5; SmoothRepresentationsOfLocalGroups §SR.4.3 (*parabolic-descent*); EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11; gap:jr-local-comparison; gap:unitary-factor-all-quadratic.

A proof route takes the upper test (φ∗e_0)⊗1_(Λ_n), whose value at zero vector is φ∗e_0 (Source corrections, E07); applies §3.3 to the source κ-sums and the target stable sums at the arguments of §3.5, that is with Σ=S₁(a) in rank n and with Σ=S₁(a) and Σ=∅ in the a- and b-blocks. Then κ_(S₁(a))=∏_(i∈S₁(b))η_i is the endoscopic character on the source, the a-block character is trivial, and the b-block character ∏_(i∈S₁(b))η_i(ζ_i)=η(N_(F[x_b]/F)(ζ)) is constant on each Hermitian form of rank b, since the discriminant of the form attached to ζ is that of ζ=1 times N_(F[x_b]/F)(ζ). With the nonreference lower-rank tests zero, the a-block sum is a stable sum and the b-block sum is the stable sum on the reference form times the value of that character there, which is κ_(S₁(a)) at the rank-n orbit whose two block components lie on the reference forms; basing the source κ-sum at that orbit cancels it. The counts satisfy r_n=r_a+r_b, so the averaging factors cancel. The route then identifies the descended linear test by §§3.4 and 2.2 and applies §3.5 with the ordinary factor contract. Only the reference/reference lower-rank test is nonzero, so no general signed four-form operator is used (Source corrections, E12).

**Checks.**

- For F[x]=F×F, a=b=1 and unramified E, r_n=2 and r_a=r_b=1; the source averaging coefficient is 1/4=(1/2)(1/2), so no factor 2 remains.
- For a=b=1 and x−y=π the factor comparison gives −q⁻¹; omitting the descent modulus would give −1.
- The nonreference lower-rank tests are 0, so the four-form combination is the reference/reference term plus three zero terms, and no sign convention for those terms enters.
- For a=b=1, F[x]=F×F, v=(1,1) and v*=(c_a,c_b), the b-block form attached to ζ_b is ⟨c_bζ_b⟩, so its reference orbits have η(ζ_b)=η(c_b) and the b-block sum is η(c_b) times the stable sum; the rank-n orbit with both block components on ⟨1⟩ has κ_(S₁(a))=η(c_b) as well. For c_b a nonnorm, dropping this sign on one side only gives the negative of the correct identity.

### 3.7 The Weil action on the sum of orbital-image spaces

Work in the unramified setting, with ψ of conductor O_F and self-dual additive measures. Let I_GL and I_U be the images of the augmented linear and reference-unitary test spaces as locally constant functions on their common regular invariant base A^rss(F), the cyclic-vector factor ω included in I_GL and the unitary image extended by zero off its matching image. Given descended SL_2(F) Weil actions W_GL on I_GL and W_U on I_U agreeing on I_GL∩I_U, prove that W(g)(A+B)=W_GL(g)A+W_U(g)B is a well-defined action on I_GL+I_U, the unique one extending both. For φ∈H_n,E the spherical defect D=O_U((φ∗e_0)⊗1_Λ)−O_GL(BC_n(φ)⊗1_L) is acted on in this sum; it is not assumed to lie in the intersection (Leslie25, Proposition 5.1, p. 41, and proof of Proposition 5.2, p. 43; BP21, §3, equations (4)–(5), pp. 5–6, and Proposition 1, p. 7; Source corrections, E13).

*Needs:* §2.1; AdelicAlgebraicGroups §2.2 (*quotient-measure*); MetaplecticAutomorphicForms §§2.1 (`weilIndex`), 2.5 (`weil_generators`); EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4; gap:jr-weil-descent; gap:jr-local-comparison.

A proof route: if A+B=A′+B′ then A−A′=B′−B lies in the intersection, where the two actions agree, so the value is independent of the decomposition; the group law and uniqueness are checked on the two generating subspaces.

**Checks.**

- If A+B=A′+B′ and C=A−A′=B′−B lies in the intersection, the two candidate images differ by W_GL(g)C−W_U(g)C=0.
- If the intersection is zero and A,B are nonzero, A−B lies in the sum, while membership in the intersection would force A=B=0; the defect must be acted on in the sum.
- At u=w=w′=1, Tr(h(u,w+w′))=Tr(2)=4 equals Tr(h(u,w))+Tr(h(u,w′))=2+2, whereas a norm kernel gives N(2)=4 against N(1)+N(1)=2 and is not additive (Source corrections, E08).

### 3.8 The Weil reduction from rank-shifted to augmented transfer

Work in the unramified setting. Fix n≥1 and φ∈H_n,E. Suppose that BC_n(φ) and {φ∗e_0,0} match for the conjugation action of GL_(n−1)(F) on GL_n(F) against U(V_(n−1)) on the invertible part of Herm(V_(n−1)⊕Ee₀), in the block Jacquet–Rallis sense. Prove that then BC_n(φ)⊗1_(L_n) and {(φ∗e_0)⊗1_(Λ_n),0} are augmented Jacquet–Rallis transfers in rank n, the nonreference-form zero clause included (Leslie25, Proposition 5.2, pp. 42–43; BP21, §2, Lemma 1, pp. 4–5, and §3, Proposition 1 and its proof, pp. 5–8).

*Needs:* §§2.1, 3.7; GeometryOfNumbersAndQuadraticArithmetic §2.7 (`IntegralHermitianLattice.ofCarrier`, `IntegralHermitianLattice.dual`); MetaplecticAutomorphicForms §§2.1 (`weilIndex`), 2.5 (`weil_generators`); Tau Ceti `TauCeti.map_normUnits_unitFiltration`; gap:unramified-hermitian-lattice-orbits; gap:unramified-unit-vector-transitivity; gap:jr-weil-descent; gap:jr-local-comparison.

A proof route: the lattice indicators vanish when |q(a)|>1. For |q(a)|=1, `TauCeti.map_normUnits_unitFiltration` at depth zero rescales to norm one, and gap:unramified-unit-vector-transitivity moves the vector to a fixed unit vector w. The projection v↦w·h(w,v)/h(w,w), whose denominator is a unit, splits off an integral unit-norm line; the complement is self-dual and of reference type by gap:unramified-hermitian-lattice-orbits. This gives the rank-(n−1) reduction on both forms without division by 2. The lattice indicators are Fourier self-dual for the trace and hyperbolic pairings, so on the orbital-image sum of §3.7 the defect is fixed by the Weyl element; since the defect is supported where q(a)∈πO_F, every upper unipotent n(t) with t∈π⁻¹O_F fixes it; these elements and the Weyl element generate SL_2(F). For q(a)≠0, choosing t with ψ(tq(a))≠1 forces the defect to vanish there, and local constancy and density finish the proof.

**Checks.**

- For an integral unit-norm vector w, p(v)=w·h(w,v)/h(w,w) satisfies p(w)=w and p²=p; no factor 1/2 occurs, including over ℤ₂.
- For q(a)=π and t∈π⁻¹O_F, ψ(tq(a))=1; if q(a) is a unit, some t∈π⁻¹O_F has ψ(tq(a))≠1. These distinguish the supported defect from an arbitrary orbital image.
- The Weyl element and n(π⁻¹O_F) generate diag(π⁻¹,π), whose conjugation multiplies the unipotent parameter by π⁻²; the union of the resulting π^(−1−2j)O_F is F, so every upper unipotent occurs.

### Examples

In unramified rank one with the augmented lattice unit 1_(O_F)⊗1_(L_1) and a unit scalar x, the regular triples with v=v*=1 have ω=1 and match the reference Hermitian orbit with value 1 and the other form with value 0. The raw germ for Σ={1} is 1/2, and germ inversion (§3.3) reads 1/2=2⁻¹(1+κ·0). Rescaling to v=π, v*=π⁻¹ changes ω to −1 and the raw germ to −1/2, leaving ωG unchanged, as the scaling law of §3.2 predicts with η(π)=−1.

### Dependencies

§§1.4, 2.1, 2.2, 2.3; GeometryOfNumbersAndQuadraticArithmetic §2.7; MetaplecticAutomorphicForms §§2.1, 2.5; SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.3; AdelicAlgebraicGroups §2.2; AutomorphicLFunctionsAndLocalFactors AL.1.1.2, AL.1.2.1, AL.1.2.3; EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17, 2.1, 2.4, 2.9, 2.11; Tau Ceti `TauCeti.map_normUnits_unitFiltration`, `TauCeti.ClassFieldTheory.artinMap_norm`, `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`, `TauCeti.index_normGroup_of_isCyclic`; gap:hermitian-field-classification; gap:jr-local-comparison; gap:jr-weil-descent; gap:unitary-factor-all-quadratic; gap:unramified-hermitian-lattice-orbits; gap:unramified-unit-vector-transitivity.

## Layer 4: the unit fundamental lemma

Use the independent product-group comparison through its supplier contract, derive the adjacent-rank and augmented comparisons and cyclic endoscopy, and recover the full relative lattice indicator from compact determinant grades.

### 4.1 The sign convention for the lattice pushforward

Work in the unramified setting. Choose c∈O_E^× with N_(E/F)(c)=−1, and put r₊(X)=XX* and r₋(X)=−XX* in reference coordinates. Prove that r₋(cX)=r₊(X), that multiplication by c preserves every integral Hom lattice and its indicator, all group actions and stabilizer measures, and hence that the signed-contraction pushforward of the lattice unit equals its positive-contraction pushforward; the same holds separately in each endoscopic block (Leslie25, equation (2.1), p. 14, compared with equation (3.8) and Lemma 3.11, pp. 28–30).

*Needs:* §§0.2, 0.8; Tau Ceti `TauCeti.map_normUnits_unitFiltration`.

A proof route applies `TauCeti.map_normUnits_unitFiltration` at depth zero to the unit −1 to get c in every residue characteristic, computes −(cX)(cX)*=−N(c)XX*=XX*, and uses invariance of the lattice indicator and of the fibre measures.

**Checks.**

- For unramified rank one, N(c)=−1 gives r₋(c)=−N(c)=1=r₊(1), and cO_E=O_E in residue characteristic two as well.
- For X=diag(1,π), r₋(cX)=diag(1,π²)=r₊(X); a norm-one unit in place of c would leave diag(−1,−π²).
- For E=ℚ₃(√3), −1 is not the norm of a unit (unit norms are ≡a² mod 3, and 2 is not a square mod 3), so no such c exists and the comparison is not extended to ramified extensions.

### 4.2 The cyclic embedding is contraction pushforward

Work in the unramified setting. Prove that for every φ∈H_n,E, viewed as a compactly supported function on invertible matrices, the positive-contraction pushforward r₊,!φ equals φ∗e_0 on X_n, and for n>0 it vanishes on the other GL_n(E)-orbit of Hermitian forms. The signed pushforward gives the same function, because multiplication by the unit c of §4.1 preserves a K_n,E-biinvariant φ (Leslie25, Lemma 3.11, pp. 29–30).

*Needs:* §§0.8, 2.1, 4.1.

A proof route computes r₊,!(1_K)=e_0 from vol U(Λ_n)=1 and the description of the unimodular orbit, proves r₊,!(φ∗φ₁)=φ∗r₊,!φ₁ by quotient Fubini, and sets φ₁=1_K; for the signed comparison, cI_n∈K_n,E.

**Checks.**

- In rank one, the Hecke indicator of π^dO_E^× pushes to e_(2d) with coefficient vol U(1)=1; d=1 gives e_2.
- d=−1 gives e_(−2): spherical pushforward allows compactly supported functions of negative valuation, unlike the integral lattice unit.
- At valuation 1 in F^× the same functions push to 0, since norm valuations are even; an unsigned shift by d would give a false nonzero value.

Used by §§4.3, 4.8.

### 4.3 Contraction of the spherical product-group test

Work in the unramified setting. Put m=n−1 and embed GL_m in GL_n by h↦diag(h,1). For φ∈H_n,E take Φ=1_(K_m,E)⊗φ on GL_m(E)×GL_n(E). Prove that its left contraction Φ̃(g)=∫_(GL_m(E))Φ(h⁻¹,diag(h⁻¹,1)g)dh equals φ; that the corresponding Hermitian contraction at the reference pair (I_m,I_n) equals φ∗e_0; that the F-linear contraction of BC_(m,n)(Φ) equals BC_n(φ); that the product transfer factor is Ω(γ)=ω(diag(γ₁⁻¹,1)γ₂); and that, with compatible quotient measures, product relative orbital integrals become the rank-shifted GL_m and U(V_m) orbital integrals (Leslie25, §11.2, p. 86; equations (7.5)–(7.7) and Definition 7.4, pp. 50–51).

*Needs:* §§2.1, 2.2, 2.3, 4.2; AdelicAlgebraicGroups §2.2 (quotient measures in stages); gap:jr-local-comparison; gap:jr-product-base-change.

A proof route applies the supplied product-group contraction formulas with n there replaced by n−1; K-invariance and vol K_m,E=1 give Φ̃=φ; §4.2 gives the Hermitian contraction; base change preserves the two units, and the factor comparison is the cyclic determinant formula.

**Checks.**

- For Φ=1_(K_m)⊗φ and h∈K_m, φ(diag(h⁻¹,1)g)=φ(g), so the contraction is vol(K_m)φ(g)=φ(g); vol(K_m)=2 would give 2φ(g).
- For n=1, m=0 and GL_0=U_0={1}, both contractions are the rank-one tests themselves, with no volume factor.
- For γ₁=I_m the contracted element is γ₂ and Ω(γ₁,γ₂)=ω(γ₂); in rank one this is η(det[e₁])=η(1)=1.

### 4.4 Spherical rank-shifted Jacquet–Rallis comparison

Work in the unramified setting. Prove that for n≥1, φ∈H_n,E and X∈GL_n(F) regular semisimple for GL_(n−1)(F)-conjugation, ω(X)Orb_(GL_(n−1),η)(BC_n(φ),X)=Orb_(U(V_(n−1)))(φ∗e_0,Y) when X matches Y∈X_n for the reference block Hermitian form, and ω(X)Orb_(GL_(n−1),η)(BC_n(φ),X)=0 when X matches only for the other (n−1)-dimensional Hermitian form. Here ω(X)=η(det[e_n,Xe_n,…,X^(n−1)e_n]), the determinant being nonzero by regularity (Leslie25, Theorem 5.3, p. 43, proved in §11.2, p. 86, from Theorem 11.1, p. 78; Source corrections, E18).

*Needs:* §4.3; gap:jr-local-comparison; gap:jr-product-base-change.

A proof route imports the product-group base-change fundamental lemma in ranks (n−1,n), with all nonreference-form vanishing, applies it to Φ=1_(K_(n−1),E)⊗φ, uses §4.3 and Ω=ω after taking matching lifts, and transports the reference split forms to identity forms by integral isometries.

**Checks.**

- For n=1 and φ=1_(π^dO_E^×), GL_0 is trivial, ω=1, and both sides are 1_(π^(2d)O_F^×).
- For n=1 at an odd valuation in F^×, BC_1(φ)=0 and φ∗e_0=0; a base-change map shifting by d would fail.
- On the nonreference block form the left side must be 0, including at orbits with the same characteristic invariants; matching on the reference form alone does not give this zero clause.

### 4.5 Augmented spherical Jacquet–Rallis transfer

Work in the unramified setting. Prove that in every positive rank n and for every φ∈H_n,E, the test BC_n(φ)⊗1_(L_n) transfers to the family {(φ∗e_0)⊗1_(Λ_n),0} in the augmented Jacquet–Rallis comparison of gl_n(F)×F^n×(F^n)* with Herm(V)×V, the zero entry being the other Hermitian isometry class (Leslie25, Proposition 5.2 and Theorem 5.3, pp. 42–43).

*Needs:* §§3.8, 4.4; gap:jr-local-comparison.

A proof route applies §3.8 in each rank, with hypothesis supplied by §4.4, keeping the self-dual vector lattices and the form labels.

**Checks.**

- For φ=1_K in unramified rank one, the augmented reference unit has normalized regular orbital value 1 on the norm-unit component, and the other-form test is 0.
- For the same test the raw germ at v=1 is 1/2; augmented transfer does not identify the singular-vector regularization with the unaveraged value 1.
- For n=1 and φ=1_(πO_E^×), the matrix argument of the Hermitian cyclic test has valuation 2, matching BC_1(φ); a valuation-one matrix gives 0 for both spherical tests.

### 4.6 The cyclic spherical endoscopic fundamental lemma

Work in the unramified setting. Prove that for n=a+b with a,b>0 and φ∈H_n,E, the Hermitian functions φ∗e_0 on Herm(V_n) and ξ_E(φ)∗e_0 on Herm(V_a)⊕Herm(V_b) are ordinary smooth endoscopic transfers for the matching and factor of EndoscopicTransferAndUnitaryTraceComparison §§1.17, 2.11, 2.12 (Leslie25, Theorem 3.5, p. 27; final paragraph of §5.2, p. 43). On the target, ξ_E(φ)∗e_0 means the tensor product of the cyclic embeddings in ranks a and b, extended linearly; ξ_E(φ) need not be a pure tensor. The theorem covers the cyclic H_n,E-submodule of H(X_n), not all of H(X_n).

*Needs:* §§2.3, 3.6, 4.5; SmoothRepresentationsOfLocalGroups §SR.4.3 (*parabolic-descent*); gap:unitary-factor-all-quadratic.

A proof route feeds §4.5 in all three ranks into §3.6, applies the target cyclic embeddings termwise to a finite tensor expansion of ξ_E(φ), and checks unmatched vanishing through the corresponding ordinary clause.

**Checks.**

- For φ=1_K the two cyclic functions are e_0 and e_0⊗e_0; ξ_E preserves the unit.
- For n=2, a=b=1 and φ=c_(2,1) (§4.8), the target is e_2⊗e_0+e_0⊗e_2, each degree distribution with coefficient 1.
- In rank one e_1 is nonzero and outside the span of the e_(2d), so the theorem does not apply to an arbitrary full-module vector such as e_1.

### 4.7 The contracted lattice unit and its determinant grades

Work in the unramified setting. Put Φ_n=r₋,!1_(End(Λ_n)), equal to r₊,!1_(End(Λ_n)) by §4.1. For d∈ℤ let X_n,d={T∈X_n: v_F(det T)=d} and Φ_n,d=Φ_n·1_(X_n,d) (pointwise product). Prove that each Φ_n,d lies in H(X_n); that Φ_n,d=0 for d<0 or d odd; and that for d≥0, Φ_n,2d=Σ m₀(π^λ)e_λ, the sum over dominant λ with nonnegative entries and |λ|=2d, where m₀(T) is the number of self-dual integral lattices L′ with L⊆L′⊆L∨ for the lattice L of Gram matrix T (Leslie25, equation (3.8), Lemma 3.8 and Remark 3.9, pp. 28–29). Prove that m₀(T) equals the representation density of GeometryOfNumbersAndQuadraticArithmetic §3.2 for representing T by the rank-n unimodular lattice, divided by the reference self-density ∏_(j=1)^n(1−(−q)^(−j)), which is positive for q≥2 (the empty product being 1). For n>0, Φ_n has infinitely many nonzero grades and is not in H(X_n); for n=0, X_0 is a point and Φ_0=Φ_0,0=e_0.

*Needs:* §§0.8, 2.1, 4.1; GeometryOfNumbersAndQuadraticArithmetic §§2.7 (`IntegralHermitianLattice.ofCarrier`, `IntegralHermitianLattice.dual`), 3.2; Tau Ceti `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`; gap:unramified-hermitian-lattice-orbits.

A proof route: integral Gram matrices have nonnegative elementary divisors, and the reference norm component has even determinant valuation, since det(XX*)=N(det X) and norms have valuation divisible by the inertia degree 2 (`TauCeti.mem_normGroup_iff_dvd_normalizedValuation`); fixing the grade leaves finitely many nonnegative dominant tuples. For T=xx* put L=x*Λ_n; the cosets hU(Λ_n) with xh integral correspond to self-dual L′ with L⊆L′⊆L∨ via L′=hΛ_n, and finiteness follows from finiteness of L∨/L. Self-dual transitivity is gap:unramified-hermitian-lattice-orbits.

The supporting API comprises:

- Φ_n is the fibre integral of the indicator of the integral Hom lattice, as a function on X_n.
- Φ_n,d is the restriction of Φ_n to determinant valuation d.
- The support of Φ_n,d lies in the integral Hermitian matrices of determinant valuation d, and is empty for d negative or odd.
- For d≥0 even, the coefficient of e_λ in Φ_n,d is the self-dual-overlattice count m₀(π^λ), equal to the normalized density.
- Each grade is a finite combination of the e_λ; for n>0 the total function is not in H(X_n), while Φ_0=e_0 lies in H(X_0).

**Checks.**

- Φ_1,2=e_(2), with coefficient 1.
- Φ_1,1=0, although e_(1) is a nonzero spherical function.
- Φ_n,d=0 for d<0.
- Φ_1 takes the value 1 at π^(2d) for every d≥0, so it is not compactly supported in X_1=F^×.
- Φ_2,2=e_(2,0)+(q+1)e_(1,1): for Gram diag(π²,1), L∨/L≅O_E/π² has one self-dual overlattice; for Gram πI_2, L∨/L≅k_E² with a nondegenerate Hermitian form, whose isotropic lines, q+1 in number, are the self-dual overlattices.
- At n=0 the single grade is Φ_0,0=e_0, with self-density 1 and overlattice count 1; a claim of infinitely many nonzero grades without n>0 would be false here.

Used by §§4.8 and 4.9.

### 4.8 Determinant-degree identities in the spherical Hecke algebra

Work in the unramified setting. For d≥0 let c_n,d∈H_n,E be the indicator of the integral invertible E-matrices with v_E(det)=d, that is, the sum of the 1_(Kπ^λK) over nonnegative dominant λ with |λ|=d. Prove that its normalized Satake transform is q^(d(n−1))h_d(Z₁,…,Z_n), with h_d the complete homogeneous symmetric polynomial (Mathlib `MvPolynomial.hsymm`); that Φ_n,2d=c_n,d∗e_0; and that ξ_E(c_n,d)=Σ_(d_a+d_b=d)c_a,d_a⊗c_b,d_b. All sums are finite (Leslie25, Proposition 3.12, equations (3.9)–(3.10), pp. 30–31).

*Needs:* §§2.1, 4.2, 4.7; SmoothRepresentationsOfLocalGroups §§SR.4.1 (*satake-isomorphism*), SR.4.3 (*parabolic-descent*); Mathlib `MvPolynomial.hsymm`, `MvPolynomial.bind₁`.

A proof route counts upper-unipotent entries in the Iwasawa decomposition: for a diagonal valuation tuple m the measure is q^(Σ2(i−1)m_i), and the normalized Satake modulus combines with it to the uniform coefficient q^(d(n−1)); equivalently, summing the Macdonald formula of SmoothRepresentationsOfLocalGroups §SR.4.3 (*macdonald-formula*), S(1_λ)=q^⟨λ,2ρ⟩P_λ(Z;q⁻²), over the partitions λ of d into at most n parts gives q^(d(n−1))h_d(Z). The two scalings of ξ_E split total degree between the a and b blocks: the substitution `MvPolynomial.bind₁` sending Z_i to q⁻ᵇX_i and Z_j to q⁻ᵃY_j maps h_d(Z₁,…,Z_n) to Σ_(d_a+d_b=d)q^(−bd_a−ad_b)h_d_a(X)h_d_b(Y), by homogeneity. For the pushforward, determinant valuation doubles under the Gram map, and §4.2 applies to c_n,d.

The supporting API comprises:

- c_n,d is the indicator of the compact open set of g∈M_n(O_E) with v_E(det g)=d, a K_n,E-biinvariant element of H_n,E.
- c_n,d is the finite sum of the 1_(Kπ^λK) over dominant λ with λ_n≥0 and |λ|=d, one term for each partition of d into at most n parts.
- c_n,0=1_(K_n,E), the unit of H_n,E.
- The normalized Satake transform of c_n,d is q^(d(n−1))h_d(Z₁,…,Z_n).
- The contraction grade is c_n,d∗e_0=Φ_n,2d.
- ξ_E(c_n,d)=Σ_(d_a+d_b=d)c_a,d_a⊗c_b,d_b, a sum of d+1 terms; on Satake transforms this is the exponent identity d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1).

**Checks.**

- For n=2, d=1, Sat(c_(2,1))=q(Z₁+Z₂), and ξ_E substitutes q⁻¹X, q⁻¹Y, giving X+Y=Sat(c_(1,1)⊗1+1⊗c_(1,1)).
- For d=0, c_(n,0)=1_K and Φ_(n,0)=e_0, so the degree identity reads 1↦1⊗1.
- For a=b=1 and d=2 the degree pairs are (2,0),(1,1),(0,2), and both Satake expressions are X²+XY+Y²; the middle term rules out a two-term splitting.

### 4.9 The lattice theorem is equivalent to compact graded transfer

Work in the unramified setting. Fix n=a+b with a,b>0 and an ordinary elliptic datum (U(V_a)×U(V_b),s,ξ). Prove that the relative unit fundamental lemma of §4.10 for all relative data Ξ=(U(V_a)×U(V_b),s,ξ,α,β) on this ordinary datum, that is for every pair (α,β) of Hermitian isometry classes in ranks a and b simultaneously, is equivalent to the following family of ordinary transfer identities: for every d≥0, Φ_n,2d on Herm(V_n) and Σ_(d_a+d_b=d)Φ_a,2d_a⊗Φ_b,2d_b on Herm(V_a)⊕Herm(V_b) are ordinary smooth transfers, with the matching identity and the unmatched-vanishing clause at every G-regular target orbit, that is every regular target orbit whose two blocks have no common eigenvalue, as in EndoscopicTransferAndUnitaryTraceComparison §2.11 (Leslie25, Corollary 3.10, p. 29; Lemma 2.5, p. 16; Source corrections, E17). Through contraction these are exactly the source-regular relative target orbits of §1.2. The invertible locus of Herm(V_a)⊕Herm(V_b) is the disjoint union of the open and closed contraction images Ω(V_a,V_α)×Ω(V_b,V_β) over the four pairs (α,β); the displayed target is supported in the (I_a,I_b) image and vanishes on the other three. For a single Ξ, the relative assertion is equivalent only to these ordinary identities at the target orbits of its own image. Matching preserves the product of characteristic polynomials and hence determinant valuation, so each regular matching pair tests exactly one total grade.

*Needs:* §§0.9, 1.4, 4.1, 4.7.

A proof route compares, for each pair (α,β), relative and ordinary orbital integrals by §0.9 on both sides, with target lift 1_(End(Λ_a))⊗1_(End(Λ_b)) for (I_a,I_b) and 0 otherwise, which gives the equivalence on that image; every invertible regular target orbit lies in exactly one image, and contraction matches source-regular relative targets with G-regular ordinary ones. Source orbits outside the norm component and target orbits with a zero eigenvalue give 0=0, all functions being supported in the invertible norm components.

**Checks.**

- For a=b=1 and d=1 the target is e_2⊗e_0+e_0⊗e_2. At block valuations (2,0) it is 1, in the reference image; at (1,1) it is 0, and that orbit lies in the (π,π) image, where the ordinary identity is the relative assertion with zero target.
- For a=b=1 and the single datum with (α,β)=(π,1), target contractions have odd and even valuations while every source contraction on W₁=W₂=V₂ has even determinant valuation; no source orbit matches and the assertion for this Ξ alone holds for every source test. Replacing the source by twice the lattice indicator keeps it true, while the ordinary identity at (2,0) then requires 2 instead of 1: a single Ξ is not equivalent to the ordinary family.
- If the total determinant valuation is odd or negative, the source grade and every target grade product vanish, giving 0=0.
- On a matching pair with (d_a,d_b)=(2,4), exactly the total grade 6 contributes, so each orbital identity involves one grade rather than an infinite sum.

### 4.10 The unitary Friedberg–Jacquet fundamental lemma

Work in the unramified setting, for every characteristic-zero F, residue characteristic two included. Let n=a+b with a,b>0, V_n=(E^n,I_n), Λ_n=O_E^n=Λ_a⊕Λ_b and W₁=W₂=V_n. Fix a relative elliptic datum Ξ=(U(V_a)×U(V_b),s,ξ,α,β), with the unramified ordinary transfer normalization and hyperspecial Haar volumes one. Prove that the source test 1_(End(Λ_n)) transfers, in the sense of §1.4, to 1_(End(Λ_a))⊗1_(End(Λ_b)) if (α,β)=(I_a,I_b), and to the zero test for every other pair of Hermitian isometry classes (Leslie25, Theorem 2.12, p. 21; Proposition 3.12, pp. 30–31; §11.2, p. 86; Source corrections, E18).

*Needs:* §§1.4, 4.6, 4.8, 4.9; GeometryOfNumbersAndQuadraticArithmetic §2.7 (`IntegralHermitianLattice.ofCarrier`); gap:unramified-hermitian-lattice-orbits; gap:unitary-factor-all-quadratic.

A proof route applies §4.6 to each determinant-shell function c_n,d, identifies the transferred compact grade pair by §4.8, and applies §4.9, which gives the assertion for all four pairs (α,β) on the fixed ordinary datum at once; §4.1 recovers the full relative lattice indicators from the signed contraction.

**Checks.**

- For a=b=1 the targets are the tensor unit at (I_1,I_1) and 0 at (I_1,π),(π,I_1),(π,π); the last pair has the same total discriminant class as the reference pair but still receives 0.
- At an unramified dyadic place with x−y=π and a nice regular match, the factor is −q⁻¹; at q=2 it is −1/2, which the positive resultant alone would get wrong.
- For total grade 2 and a=b=1, contraction gives the two terms e_2⊗e_0 and e_0⊗e_2 with coefficient 1; a single ungraded compact unit on X_1 would omit e_2.
- For a=b=1 at the reference labels and c∈O_E^× with N(c)=−1, the target (c,c) contracts to (1,1); the tensor unit has stable value 1 there, and the theorem asserts nothing at this orbit because its block spectra collide and it is not source-regular. A target with contracted blocks (1,1+π) is source-regular and nicely matched by a source element δ with r₁(δ)=diag(1,1+π), and the theorem reads 1=−q⁻¹·RO^κ(1_(End(Λ₂)),δ), so that κ-integral is −q, the value the ordinary unit fundamental lemma gives at diag(1,1+π) through §0.9.

### Examples

For n=2, a=b=1 the chain is explicit. The determinant-degree function c_2,1 has Satake transform q(Z₁+Z₂), and Φ_2,2=c_2,1∗e_0=e_(2,0)+(q+1)e_(1,1). Its Levi image is ξ_E(c_2,1)=c_1,1⊗1_K+1_K⊗c_1,1, whose cyclic image is e_2⊗e_0+e_0⊗e_2=Φ_1,2⊗Φ_1,0+Φ_1,0⊗Φ_1,2, the graded target of §4.9 at d=1. Through Hironaka's transform, H_2(Φ_2,2) has Satake transform q(T₁²+T₂²), and ξ_F sends it to X²+Y², which is the Satake transform of (H_1⊗H_1)(e_2⊗e_0+e_0⊗e_2).

### Dependencies

§§0.2, 0.8, 0.9, 1.4, 2.1, 2.3, 3.6, 3.8; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 3.2; SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.3; AdelicAlgebraicGroups §2.2; EndoscopicTransferAndUnitaryTraceComparison §§1.17, 2.11, 2.12; Mathlib `MvPolynomial.hsymm`, `MvPolynomial.bind₁`; Tau Ceti `TauCeti.map_normUnits_unitFiltration`, `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`; gap:jr-local-comparison; gap:jr-product-base-change; gap:unitary-factor-all-quadratic; gap:unramified-hermitian-lattice-orbits.

## Layer 5: the full spherical operator

Construct the full-module operator through Hironaka's transform, with the transported algebra structure and its restriction to the cyclic submodule.

### 5.1 The Fourier-defined extension to the full spherical module

Work in the unramified setting, with n=a+b and a,b>0. Define ξ_X=(H_a⁻¹⊗H_b⁻¹)∘ξ_F∘H_n on all of H(X_n), using the normalized isomorphisms of §2.3, each with the dictionary U_i↦−T_i. Prove that ξ_X is a unital homomorphism for the algebra structures transported by H, and that ξ_X(φ∗e_0)=ξ_E(φ)∗e_0 for φ∈H_n,E (Leslie25, Remarks 3.6 and 3.7, p. 27; the ξ_F diagram in the proof of Proposition 4.8, p. 39). This specifies the extension as an operator; no transfer statement for noncyclic vectors is claimed.

*Needs:* §§2.2, 2.3; SmoothRepresentationsOfLocalGroups §SR.4.3 (*parabolic-descent*).

A proof route transports ξ_F across H_n, H_a, H_b and uses their cyclic normalization with the commuting square of §2.2 for the cyclic restriction; the algebra laws follow from the transported convolutions and ξ_F.

The supporting API comprises:

- ξ_X is the composite of H_n, ξ_F and the inverse of H_a⊗H_b.
- ξ_X(φ∗e_0)=ξ_E(φ)∗e_0.
- ξ_X(e_0)=e_0⊗e_0.
- ξ_X is multiplicative for the convolution structures transported by H.
- (H_a⊗H_b)(ξ_X(f))=ξ_F(H_n(f)) for every f∈H(X_n).

**Checks.**

- ξ_X(e_0)=e_0⊗e_0.
- For n=2, a=b=1 and f=c_2,1∗e_0, ξ_X(f)=e_(2)⊗e_(0)+e_(0)⊗e_(2).
- For the noncyclic f=H_n⁻¹(1_(K diag(π,1,…,1) K)), (H_a⊗H_b)(ξ_X(f)) is ξ_F of that double-coset indicator; it is not zero.
- For f=1_(πK_n,E)∗e_0 the image is q^(−2ab) times the tensor product of the two central cyclic indicators.
- For n=2, a=b=1 and the noncyclic f=e_(1,0): H_2(e_(1,0))=−T_(1,0),F; ξ_F sends √q(T₁+T₂) to X+Y, so ξ_F(T_(1,0),F)=T_1⊗1+1⊗T_1, and H_1⁻¹(T_1)=e_1. Hence ξ_X(e_(1,0))=−(e_1⊗e_0+e_0⊗e_1). Changing the dictionary to U_i↦T_i in every rank leaves this value unchanged: then H_2(e_(1,0))=T_(1,0),F, ξ_F gives T_1⊗1+1⊗T_1, and H_1⁻¹(T_1)=−e_1. In general the simultaneous sign substitution commutes with the two Levi scalings, so it cancels in ξ_X. The mixed convention, with U_i↦T_i in rank two and the inverses of the rank-one isomorphisms with U_i↦−T_i, gives +(e_1⊗e_0+e_0⊗e_1) and is excluded by this value.

### Examples

In rank n=2 with a=b=1, three basis vectors of H(X_2) show the three behaviours. On the unit, ξ_X(e_0)=e_0⊗e_0. On the nonreference vector e_(1,0), ê_(1,0)=√q(U₁+U₂) gives H_2(e_(1,0))=−T_(1,0),F and ξ_X(e_(1,0))=−(e_1⊗e_0+e_0⊗e_1). On the reference but noncyclic vector e_(1,1), ê_(1,1)=−U₁U₂ gives H_2(e_(1,1))=−T_(1,1),F, whose Satake transform −T₁T₂ goes under ξ_F to −q⁻¹XY; hence ξ_X(e_(1,1))=−q⁻¹e_1⊗e_1. On the cyclic vector e_(2,2)=1_(πK_2,E)∗e_0, ê_(2,2)=U₁²U₂² goes to q⁻²X²Y², so ξ_X(e_(2,2))=q⁻²e_2⊗e_2=ξ_E(1_(πK_2,E))∗e_0, as the cyclic compatibility requires.

### Dependencies

§§2.2, 2.3; SmoothRepresentationsOfLocalGroups §SR.4.3.

## Downstream consumers

No other roadmap names this roadmap as a supplier. The local Jacquet–Rallis contracts that GanGrossPrasadUnitaryGroups declares on EndoscopicTransferAndUnitaryTraceComparison (its finite-place transfer and its fundamental lemma for GL_n×GL_(n+1) against the unitary groups U_h) ask for objects that gap:jr-local-comparison here also requires of that roadmap, so one supplier serves both; the global geometric and archimedean relative comparisons of that roadmap are separate contracts and do not follow from the lattice theorem. The local results here, symmetric-space transfer, the unramified unit theorem in every residue characteristic and the explicitly normalized reductions, are available to a roadmap on unitary Friedberg–Jacquet periods.

## Source corrections

The following corrections refer to the versions listed in References.

**E01 (misprint), Leslie25, Lemma 1.8, p. 12.** The centralizer is labelled with U(W) although the surrounding datum is V; read U(V). The lemma starts from δ∈Herm(V), and the proof and the cohomology map use the same V.

**E02 (misprint), Leslie25, §2.2.3, transfer-factor paragraph after Remark 2.8, p. 19.** The embedding symbol of the endoscopic triple changes to η in this display; keep ξ, the embedding of the fixed datum. The letter η already denotes the quadratic character.

**E03 (misprint), Leslie25, after Theorem 2.12, p. 22.** The first reduction refers to an unresolved proposition; it is Proposition 3.12, pp. 30–31, whose statement is exactly the implication from the spherical theorem to Theorem 2.12.

**E04 (misprint), Leslie25, §4.1.2, p. 32.** The Hermitian invariant formula uses powers of the linear-side variable; read powers of the Hermitian variable y in h(w,y^iw). The invariant is a function on Herm(V)×V.

**E05 (misprint), Leslie25, §4.1.4, p. 33.** The upper-left block of the Hermitian embedding is labelled x; it is y. The embedding takes the Hermitian pair (y,w).

**E06 (misprint), Leslie25, Remark 4.4, p. 35.** The surname of the contributor of the characteristic-zero transfer appendix is misspelled; it is Julia Gordon.

**E07 (misprint), Leslie25, proof of Proposition 4.8, p. 38.** The upper augmented test is written as φ tensor the vector-lattice indicator, with value φ at zero; read (φ∗e_0)⊗1_(Λ_n), with value φ∗e_0 at zero. The upper test must be a function on Herm(V_n)×V_n, and the hypothesis and the desired orbital integral both use the cyclic image.

**E08 (error), Leslie25, §5.1, Hermitian Fourier formula, p. 40.** The kernel is formed from the norm of a Hermitian pairing; use ψ(Tr_(E/F)h(u,w)) with the self-dual measure and the Hermitian matrix argument y fixed, as in BP21, pp. 5–6. A norm is quadratic, so it is not a bilinear Fourier kernel; the trace is the polar form of h(w,w) and works in residue characteristic two.

**E09 (misprint), Leslie25, Lemma 3.1, modular-character display, p. 23.** The E-parabolic modular character carries F-absolute values on E-valued determinants; read |det m₁|_E^b|det m₂|_E^(−a). The F-group formula on p. 39 correctly uses |·|_F; the E-parabolic acts on Mat_(a,b)(E), whose additive Jacobian uses the normalized E-absolute value.

**E10 (error), Leslie25, proof of Proposition 4.8, p. 39.** The commutation of BC with ξ is justified by asserting support on double cosets whose coweights have all entries even. That support claim is false: for n=2, Sat_E(T_(1,0))=q(Z₁+Z₂) and Sat_F(T_(2,0))=q(T₁²+T₂²)+(q−1)T₁T₂, so BC(T_(1,0),E)=T_(2,0),F−(q−1)T_(1,1),F. Commutation holds by the Satake substitutions of §2.2, since squaring the variables commutes with the two Levi scalings.

**E11 (error), Leslie25, Theorem 4.7, p. 36; Xiao18, inversion before Theorem 4.7, pp. 20–21.** The raw regularized germ is equated with a finite character sum without averaging. With volume-one measures the inversion requires the factor 2^(−#S₁), or an explicitly rescaled germ (§3.3). In unramified rank one, the integral augmented unit with x a fixed unit scalar and v=v*=1, with vol O_F^×=vol U(1)=1, transfers to the reference unit and to 0 on the other form; the Σ={1} raw germ is the continuation of Σ_(k≥0)(−q^(−s))^k, equal to 1/2 at s=0, while the unaveraged unitary sum is 1. Block exponents add, so this does not by itself affect the final Friedberg–Jacquet theorem.

**E12 (gap), Leslie25, four-form sum in Proposition 4.8, p. 38; Xiao18, construction in Theorem 6.1, p. 23.** The four-form signs differ between the cited construction and its use: Xiao's signs depend on the second form, Leslie's on the parity of the two split-form labels. A conversion between the two transfer-factor conventions is needed before the general four-form operator is used. In the spherical reduction only the reference/reference term is nonzero (§3.6), so the gap does not affect it.

**E13 (gap), Leslie25, proof of Proposition 5.2, p. 43.** The Weil action is applied to the defect inside the intersection of the two orbital-image spaces; before transfer is proved the images need not coincide, and the defect lies in their sum. Extend the agreeing actions to the sum (§3.7); the ambiguity of a decomposition lies in the intersection, where the actions agree. The sum-space construction is explicit in BP21, §4, p. 8.

**E14 (ordered determinant sign), Xiao18, proof of Theorem 6.1, p. 24.** With Ω=Ω_a∧Ω_b and D_ab=∏(λ_a−λ_b), the ordered cyclic determinant has cross product ∏(λ_b−λ_a)=(−1)^(ab)D_ab, so over a ramified extension the formula is η((−1)^(ab)D_ab)ω_aω_b; over an unramified extension η(−1)=1 gives the form used in the spherical comparison (§3.5).

**E15 (gap), Leslie25, Proposition 4.8, pp. 37–38.** The hypothesis is stated in rank n only, but the proof invokes it again in the block ranks a and b; §3.6 assumes it in every positive rank.

**E16 (error), Leslie25, §2.3, p. 20.** Two orbit representatives are asserted in every rank; at n=0 there is one (§2.1).

**E17 (gap), Leslie25, §2.2.3, p. 19, and Definition 2.10, p. 21.** The vanishing clauses for unmatched targets are stated for every regular semisimple target element, without requiring the blocks to have disjoint spectra. Read literally they contradict Theorem 2.12: for a=b=1, the reference labels and a unit c with N(c)=−1, the relative target (c,c) contracts to (1,1), has no regular source match, and the tensor lattice unit has stable value 1 there; the ordinary target (1,1) and e_0⊗e_0 behave the same way. Restrict both clauses to G-regular ordinary targets and source-regular relative targets, as in §§1.2, 1.4 and 4.9 and in the strongly regular convention of EndoscopicTransferAndUnitaryTraceComparison §2.11.

**E18 (gap), Leslie25, Lemma 10.6, p. 76, Corollary 10.8, p. 78, and the proof of Theorem 11.1, pp. 78–85.** Theorem 11.1 is stated for every unramified extension of p-adic fields, but Lemma 10.6 evaluates the normalized unitary-period functional (8.7) on the spherical Whittaker vector as 1, and that value is Lemma 8.6, p. 61, which is stated for odd residue characteristic; Corollary 10.8 and the last step of the proof of Theorem 11.1 apply Lemma 10.6 at the place under study. The dyadic case of Theorem 11.1, hence of §§4.4, 4.6 and 4.10 here, needs either that evaluation at residue characteristic two or an argument without it. In the source's argument the value enters both places as the same factor: if it is a nonzero number c depending only on Π_v0, Lemma 10.6 holds with the factor c, Corollary 10.8 gives C(Π_v0,x,y)=c, and c cancels in (11.6). gap:jr-product-base-change asks for Theorem 11.1 in every residue characteristic.

**E19 (scope), Leslie19, §3, p. 9.** The section on the Lie algebra of the symmetric space, which contains Lemmas 3.6 and 3.9 and §3.2 and on which Proposition 4.5, p. 15, rests, assumes a quadratic field extension of odd residue characteristic. §§0.5, 0.8 and 1.5 here are stated in the étale setting in every residue characteristic, as Leslie25 states the corresponding Lemma 2.3 and equation (2.4) (Part 1, p. 13: any nonarchimedean F and any quadratic étale algebra). Their routes use the geometric torsor, gap:hermitian-field-classification for the determinant description of unitary H¹ and, for split E, H¹(F,GL_n)=1, and Waldspurger's transfer through EndoscopicTransferAndUnitaryTraceComparison §4.7, none of which needs the hypothesis.

**E20 (error), Leslie19, proof of Lemma 3.9, p. 13.** The proof reduces the lemma to |C(H_x/F)|=2^(|S₁|−1) and squeezes |C(H_x/F)| between 2^(|S₁|−1) and itself. When S₁ is empty both kernels are trivial and have one element, not 2^(−1). The statement of the lemma is unaffected: for S₁ empty, Lemma 2.1 read with the empty product makes C(T_δ/F) trivial, so the injection C(H_x/F)→C(T_δ/F) is an isomorphism of trivial groups, and for S₁ nonempty the source's count applies as written (§0.5).

**E21 (error), Leslie19, the measure paragraph after Lemma 2.1, p. 6.** The maximal compact subgroup of T_δ is described as the centre times the factors indexed by S₁. For every i∈S₂ the factor (F_i^××F_i^×)/F_i^×≅F_i^× of T_δ(F) contributes its unit group O_(F_i)^×, so the maximal compact subgroup is the centre times ∏_(i∈S₁)E_i^×/F_i^× times ∏_(i∈S₂)O_(F_i)^×; the normalization of the Conventions gives this whole subgroup volume one. For n=2 and F[δ]≅E, S₁ is empty and T_δ(F)≅E^×; the S₁-description gives the centre E¹, a closed subgroup of Haar measure zero in E^×, so no Haar measure gives it volume one, while O_E^× has positive finite volume.

## References

- **Leslie25:** Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, Annals of Mathematics 201 (2025), 551–645. All locators use [arXiv:1911.07907v3](https://arxiv.org/abs/1911.07907v3) with its own pagination.
- **Leslie19:** Spencer Leslie, *Endoscopy for unitary symmetric spaces*, [arXiv:1910.09685v2](https://arxiv.org/abs/1910.09685v2).
- **Xiao18:** Jingwei Xiao, *Endoscopic transfer for unitary Lie algebras*, [arXiv:1802.07624v1](https://arxiv.org/abs/1802.07624v1), 2018.
- **Hironaka99:** Yumiko Hironaka, *Spherical functions and local densities on Hermitian forms*, Journal of the Mathematical Society of Japan 51 (1999), 553–581, [doi:10.2969/jmsj/05130553](https://doi.org/10.2969/jmsj/05130553); locators use the printed pages.
- **BP21:** Raphaël Beuzart-Plessis, *A new proof of Jacquet–Rallis's fundamental lemma*, Duke Mathematical Journal 170 (2021). All locators use [arXiv:1901.02653v3](https://arxiv.org/abs/1901.02653v3) with its own pagination.
