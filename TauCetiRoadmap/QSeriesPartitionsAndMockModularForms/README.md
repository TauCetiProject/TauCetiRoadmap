# Roadmap: q-series, partition statistics and mock modular forms

**Summary.** Build partition statistics and congruences on native partitions and analytic completion theory on the upper half-plane, extending the supplied finite and formal q-calculus over general commutative coefficient rings. The end results are the Rogers–Ramanujan identities and counting theorems, rank/crank equidistributions and prime-power partition congruences, completed Appell–Lerch and signature-(r−1,1) theta transformations, meromorphic Jacobi decompositions, harmonic weak Maass exact sequences, and explicit third-, fifth-, seventh-order and root-of-unity rank completions with their shadows.

## Scope and ownership

This roadmap owns integer-indexed q-products, regular quotient coefficients, coefficientwise formal adapters, normalized basic hypergeometric calculus, partition rank/crank theory, the complex Zwegers smoothing kernel and its additional tail estimates, meromorphic Jacobi coefficient corrections, and harmonic/mock completion interfaces specified below. It is not a Part II of ModularForms or ThetaSeries: the former’s integral-weight arithmetic and the latter’s positive-definite lattice modularity retain their owners. HabiroCyclotomicCompletions §1.1 owns finite multiplicative Pochhammer products, their empty, shift, concatenation and scalar-change laws, and the universal integral infinite product with its formal binomial and Euler identities. ArithmeticStatisticsPartIV §3.2 owns the Gaussian polynomial, its semiring evaluation, their Pascal, symmetry, specialization and finite q-binomial laws, and its §3.9 owns the real Euler q-binomial sum. The native ring-valued formal adapter in §1.4 specializes the universal product along its completed base; §1.5 inverts two independent unit parameters rather than only the diagonal factorial parameter. Section 3.1 adds the rectangle-partition interpretation, a signed lower-index adapter and a denominator-cleared product over arbitrary commutative rings to the supplied Gaussian polynomial; the latter differs from the supplier’s field quotient formula. The complex analytic binomial and Euler identities in §2.4 add absolute convergence and specialization on their actual complex domains; its integral formal specialization transports the supplied field coefficient identity to every commutative coefficient ring. These extensions use the supplied objects, with no second elementary q-calculus or Gaussian-polynomial library. The analytic product, its zero divisor, and its analytic shift law are imported from GeometryOfNumbersAndQuadraticArithmetic §4.3. Section 1.6 adds only convergence of the native finite-prefix adapter and the finite-prefix/tail comparison.

Mathlib already supplies `Nat.Partition`, its Young-diagram conjugation, its weighted `genFun` and `hasProd_genFun`, Glaisher and odd/distinct partition theorems, native pentagonal identities, `jacobiTheta₂`, and `ModularForm.eta`. Tau Ceti already supplies the integral-weight holomorphic Eichler integral; this roadmap’s nonholomorphic shadow primitive has different weight, conjugation and cusp growth. These objects are imported, without second carriers or duplicate targets. ClassicalArithmeticCompletion §§2.31, 4.20, 4.40, 4.60–4.61 retain formal specialization, the formal triple product, the cubic Euler product and its theta specializations. GeometryOfNumbersAndQuadraticArithmetic §4.3 retains the analytic q-product, triple product and Appell–Lerch difference identity. MetaplecticAutomorphicForms §§2.4b–2.6, 4.7, 6.18–6.20 and 7.1/7.49 retain the generic cover, finite Weil representation, holomorphic Jacobi decomposition, multiplier and unitary comparison. The new Maass spaces allow every half-integral weight and exponential cusp growth, distinct from its weight-1/2 square-integrable spectral space in §7.2.

IntegralLattices Layer 1G–1H retains finite quadratic modules and Gauss invariants. Automorphic theta kernels, theta lifting and Siegel–Weil theory belong to MetaplecticAutomorphicForms Layers 5–6; the Siegel–Narain kernel is outside this roadmap. A general completed indefinite theta series or meromorphic Jacobi coefficient is not asserted to be harmonic. Habiro completions, evaluation at roots of unity as a completion operation, q-Witt vectors, geometric q-cohomology and Nahm-specific criteria belong to their own roadmaps. Analytic evaluation inside |q|<1 does not supply any boundary evaluation theorem.

PadicMeasuresIwasawaAlgebras §2.9 owns power-series Cartier extraction over commutative rings, including integral coefficients and its residue-range pullout law. ClassicalArithmeticCompletion §2.10 owns the separate field-valued Laurent-series comparison; §4.7 adds the semiring extension and comparison adapters, and §4.8a the integral eta-module estimates. ModularForms, Worked examples, target η²⁴=Δ, owns eta’s SL₂(ℤ) transformation; §5.2 adds its normalized square-root cocycle and lifted-character comparison. Tau Ceti’s real `erf` and `erfc` API supplies the real kernel laws through the normalization in §5.3; the complex entire extension and sharper Gaussian-tail bounds are the kept variant. AutomorphicSpectralTheory §1.16 owns the weight-k Laplacian Δ_k, its integral-weight slash covariance `weight_laplacian_slash` and its Powers law for every complex exponent, including the constant and quadratic zero-mode tests. Section 8.2 adds the raising/lowering and xi factorizations and their half-integral-weight covariance, using that operator rather than a second Laplacian development. StandardDistributions Layer 2 owns the real incomplete-gamma theory supplied by Tau Ceti; §8.4 adds its Fourier-kernel comparison, contour extension and ODE basis.

The three general upstream extensions are contracts for Part II of their respective owners: the classical pair model for the metaplectic cover; analytic elliptic regularity; and vector-bundle Dolbeault/Serre theory. Their exact extension contracts appear below. AutomorphicFormsOnReductiveGroups §4.5 retains square-integrable weight-zero Maass cusp eigenforms and their Bessel/Hecke theory; the exponential-growth harmonic spaces here have different growth and shadow conditions. The dissection, eta-module, general parabolic Fourier and unilateral-to-Hecke theorems are targets of this roadmap. The ten fifth-order functions, the three seventh-order functions, and the third-order functions treated by the references are included; no universal completion criterion for arbitrary q-hypergeometric series is asserted.

## Conventions

- Finite products use `P_n(a;q)=prod_(0<=j<n)(1-a*q^j)`, with lists retaining multiplicity. Coefficients are arbitrary commutative rings unless the semiring carrier suffices. Negative indices require specified unit factors. The witness `P_2(a;q)=1-a-a*q+a^2*q` pins the initial index. Finite q=1 and the zero ring are allowed; analytic |q|=1 products are not claimed.
- Formal products use native `PowerSeries`, polynomial or Laurent-polynomial coefficient rings, and coefficientwise eventual stabilization. The positive tail has constant coefficient 1 and is a unit. A displayed inverse over a ring means this specified unit inverse. The factor at index zero is retained: `P_hat(1;X)=0`, while its positive tail begins `1-X-X^2`.
- Analytically, `q=exp(2*pi*i*tau)` and `e(t)=exp(2*pi*i*t)`. A fractional q-power is `exp(2*pi*i*r*tau)`, never a branch chosen from q alone. Tau lies in the upper half-plane; q=0 is included separately for unilateral disc identities. Bilateral series require their actual two-tail summability and pole domains.
- Square roots use argument in (−π,π], with `sqrt(-i*tau)` positive at tau=i. The metaplectic pair multiplies its root functions by composition; an arbitrary independent root choice is not a cocycle. At S and tau=i the eta transformation factor is 1, while `nu_eta(S)=exp(-pi*i/4)` with `sqrt(tau)`. At −I the root is i and `nu_eta(-I)=-i`, so the factor of the completed μ under simultaneous negation is 1.
- The odd theta is the shifted native two-variable theta of 5.1. Its two central terms are `i*exp(pi*i*tau/4)*(exp(pi*i*z)-exp(-pi*i*z))`, and `theta'_odd(0)=-2*pi*eta^3`. The survey’s theta and μ differ by the factors in 5.7. All normalizations are fixed by these two terms.
- Partitions use the native positive multiset, integer-valued rank and crank, and empty value zero. The strict inequality in the crank counts parts greater than the number of ones. At size one the ordinary crank is −1 and the product correction is `(1-z)*q`.
- In the indefinite theory `Q(x)=B(x,x)/2`, the ordered kernel is `rho_c1-rho_c2`, and negative cone data include primitive integral isotropic boundary vectors with their nonintegral pairing domain. For the hyperbolic plane its same-sign boundary kernel at (1/2,1/2) is 2. Finite quadratic-module comparisons use even lattices only; odd A retains its half-diagonal T-shift.
- The representation ρ_L is the complex conjugate of MetaplecticAutomorphicForms §4.7’s ω_L, using `finiteWeil_conjugate`. Thus ρ_L(T)e_h=e(Q(h))e_h and ρ_L(Z)e_h=exp(−πi signature(L)/2)e_(−h) for Z=(−I,i).
- The holomorphic-weight Laplacian is the explicit operator of 8.2. Its zero modes include `y^(1-k)`, and `xi_k(y^(1-k))=1-k`. Xi is antilinear and targets the conjugate representation, identified with the dual for a unitary Weil module. At k=1 the second constant mode is log y. The quoted Fourier/surjectivity theorems retain k≠1; general definitions do not silently exclude it.
- Standard mock forms have shadows holomorphic at all cusps, with a specified normalized correction. The full exponential-growth harmonic space also permits polar weakly holomorphic shadows. The completion is part of the mock object; no injectivity of its underlying holomorphic-function projection is assumed. Positive index m, all cusp coordinates, finite-dimensional coefficient spaces and arbitrary pole orders remain explicit; no universe-specific replacement of native carriers is introduced.

## Exact supplier contracts

### From Mathlib

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

| Declarations | File and exact use |
| --- | --- |
| `Nat.Partition`, `Nat.Partition.ofSums`, `Nat.Partition.restricted` | `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`: positive multiset of natural parts with prescribed sum; finite carrier, constructors and the finite subset selected by a predicate on each part. |
| `Multiset.sort` | `Mathlib/Data/Multiset/Sort.lean`: increasingly sorted list retaining every multiplicity; the gap predicate uses native `List.Pairwise` on this list. |
| `Nat.Partition.genFun`, `Nat.Partition.coeff_genFun`, `Nat.Partition.hasProd_genFun` | `Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean`: arbitrary multiplicative weights in a commutative semiring; the product theorem uses a Hausdorff coefficient topology. Values at part zero and multiplicity zero are ignored. The ordinary specialization is an adapter in 3.5. |
| `Nat.Partition.hasProd_powerSeriesMk_card_restricted`, `Nat.Partition.card_restricted_eq_card_countRestricted`, `Nat.Partition.card_odds_eq_card_distincts` | `Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean`: restricted product, Glaisher for positive multiplicity bound, and odd/distinct equality. Used to check adapters. |
| `PowerSeries.expand`, `PowerSeries.coeff_expand` | `Mathlib/RingTheory/PowerSeries/Expand.lean`: substitution by X^t for t≠0 over a commutative ring, with coefficient f_(n/t) when t divides n and zero otherwise. The semiring pullout law states this coefficient formula directly. |
| `PowerSeries.isUnit_iff_constantCoeff`, `PowerSeries.invOfUnit`, `PowerSeries.mul_invOfUnit` | `Mathlib/RingTheory/PowerSeries/Inverse.lean`: over a ring, a power series is a unit exactly when its constant coefficient is; use specified units rather than field inverses over arbitrary rings. |
| `PowerSeries.pentagonalSeries`, `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow` | `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean`: the Euler product equals the integral pentagonal series in the pi topology over every commutative ring; no extra NoZeroDivisors hypothesis. |
| `jacobiTheta₂`, `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_functional_equation`, `hasDerivAt_jacobiTheta₂_fst` | `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`: the exponent is `2*pi*i*n*z+pi*i*n^2*tau`; HasSum and differentiation require Im(tau)>0. The functional equation retains the principal complex half-power. |
| `ModularForm.eta`, `ModularForm.eta_ne_zero`, `ModularForm.multipliableLocallyUniformlyOn_one_sub_pow` | `Mathlib/NumberTheory/ModularForms/DedekindEta.lean`: eta’s product and nonvanishing on the upper half-plane; local uniformity of the positive Euler tail on the unit disc. These do not by themselves give the general eta multiplier. |
| `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable` | `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean`: summability of norms gives multipliability in a complete normed commutative ring; nonvanishing additionally requires every factor nonzero and multiplicative norm. Applied over ℂ. |
| `ZMod.coe_mul_inv_eq_one`, `ZMod.val_lt`, `ZMod.natCast_zmod_val` | `Mathlib/Data/ZMod/Basic.lean`: the coprime residue-ring inverse, bounded representative for nonzero modulus, and its cast; §4.6 specializes these to the inverse of 24. |
| `Real.Gamma_eq_integral`, `Real.GammaIntegral_convergent` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`: the complete Euler integral and its convergence for positive real shape; subtract the supplied lower integral in §8.4. |
| `HasFDerivAt.log`, `Real.hasDerivAt_log` | `Mathlib/Analysis/SpecialFunctions/Log/Deriv.lean`: logarithm differentiation away from zero, used with positive imaginary coordinate in the weight-one xi Check. |
| `Finset.prod`, `map_prod` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: native commutative finite products and homomorphism transport. |

`Nat.Partition.conjugate` and `Nat.Partition.conjugate_conjugate` in `Mathlib/Combinatorics/Enumerative/Partition/YoungDiagram.lean` give the native Young-diagram transpose and its involution. `YoungDiagram.rowLens_ofPartition_eq_sort_parts` identifies its rows with the decreasing parts; §4.1 compares first row and first column lengths.

### From Tau Ceti

Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `TauCeti.CuspFormClass.eichlerIntegral_slash_apply` in `TauCeti/NumberTheory/ModularForms/EichlerIntegral/Transformation.lean` requires integral weight k=n+2, arithmetic level and positive strict periods; it fixes the boundary with the holomorphic integral-weight theory and is not a shadow-completion theorem.

The module `TauCeti.Analysis.SpecialFunctions.Erf` in `TauCeti/Analysis/SpecialFunctions/Erf.lean` supplies `TauCeti.Real.erf`, `erfc`, `erf_zero`, `erfc_zero`, `erf_neg`, `hasDerivAt_erf`, `erf_pos`, `erf_lt_one` and `abs_erf_lt_one`. Its convention is erf(x)=(2/√π)∫₀ˣexp(−u²)du and erfc=1−erf. Section 5.3 uses the real adapters E(x)=erf(√π·x) and β(t)=erfc(√(πt)) for t≥0, including t=0.

The module `TauCeti.Analysis.SpecialFunctions.IncompleteGamma` in `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean` supplies `TauCeti.lowerIncompleteGamma`, `lowerIncompleteGamma_eq_integral`, `hasDerivAt_lowerIncompleteGamma` and `tendsto_lowerIncompleteGamma_atTop`. For s>0 and x≥0 the value is ∫₀ˣt^(s−1)exp(−t)dt, its derivative formula requires x>0, and its limit at infinity is `Real.Gamma s`. Section 8.4 uses s=1−k>0 and x=−2w>0.

### From TauCetiRoadmap.HabiroCyclotomicCompletions

HabiroCyclotomicCompletions §1.1: `QToolkit.pochhammer` is the native finite product Pₙ(a;q), over every commutative ring, with the empty, shift, concatenation, coefficient-change and q=1 laws. Its `pochhammer_append` and `pochhammer_inverse_parameter` provide concatenation and the diagonal inverse-base formula. The formal coefficient series `pochhammerInf`, `reciprocalPochhammer` and `qBinomialSeries` over a field with qⁿ≠1 for n>0 obey the formal Euler and binomial identities. `integralPochhammerInf` in ℤ⟦Q⟧⟦T⟧ supplies coefficientwise Q-adic stabilization, product projections, shift, reciprocal identity and scalar change; it specializes to the arbitrary-ring adapters of §1.4 and the integral formal binomial identity. No cyclotomic-completion or root-evaluation assertion is consumed.

### From TauCetiRoadmap.ArithmeticStatisticsPartIV

§3.2, target Gaussian binomial coefficient: the Gaussian polynomial in ℕ[Q] defined by the successor recursion and its evaluation over every commutative semiring, with the zero column, diagonal value, successor recursion, vanishing for k>n, symmetry for k≤n, value Nat.choose n k at 1, and the field product formula when no Qⁱ with 1≤i≤n equals 1. §3.2, target Cauchy q binomial theorem: the finite polynomial binomial identity over every commutative ring. Section 3.1 uses these polynomials for the rectangle-partition comparison and extends only the lower index to signed integers by zero. §3.9, target Euler q-binomial sum: for real 0<q<1, Σ_(n≥0)q^(n(n+1)/2)/Pₙ(q;q)=P(−q;q) with both sides convergent; it is the compatible real instance z=q of §2.4’s complex analytic identity.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§2.9: `PowerSeries.cartier`, `PowerSeries.coeff_cartier` and `PowerSeries.cartier_expand_mul` over every commutative ring. The coefficient at n is f_(tn+a) for every natural shift a; `cartier_expand_mul` requires t≠0 and a<t. Section 4.7 compares the semiring coefficient adapter with this K-linear map and transports its ring laws, including the integral case. No Frobenius identity is used without its finite-field hypotheses.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§2.10: `LaurentSeries.cartier`, `coeff_cartier`, `cartier_add`, `cartier_smul` and `cartier_ofPowerSeries` over a field K and modulus t>0. The coefficient at n∈ℤ is the input coefficient at tn+a; the power-series comparison requires 0≤a<t. No Frobenius law is used outside a finite field with t equal to its cardinality. §2.31, §4.20, §4.40, §4.60, §4.61: Formal-to-analytic Taylor specialization; coefficientwise scalar change; the formal triple product; cubic Euler-product identity and theta specializations, with their stated coefficient rings and unit hypotheses.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§4.3: The complex qPochhammer and jacobiProduct, their shifts and zero divisors, the analytic triple product with zeros/residues, Kronecker single identity, and appell_lerch_difference_identity on the actual m(x,q,z).

### From TauCetiRoadmap.ThetaSeries

Layer 1, Layer 2, Layer 3: Full-lattice Poisson summation with Fourier phase exp(−2πi<x,ξ>), Gaussian transform, lattice model and positive-definite coset theta sums. No half-integral-weight bundling is imported from it.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

§§2.4b–2.6, §4.7, §6.18, §6.20, §7.1, §7.49: Actual metaplectic double cover and generator relations; finite Weil operators and their conjugation convention; holomorphic Jacobi carriers and theta decomposition; unitary theta multiplier and classical/unitary comparison. The square-root model comparison has the precise extension contract below.

What MetaplecticAutomorphicForms must provide (gap:classical-metaplectic-model): Provide a root-preserving equivalence to the classical square-root cover and its integral lifts.

Compare the imported real rank-one cover with pairs (g,φ), where g∈SL₂(ℝ), φ:ℍ→ℂ is holomorphic and φ(τ)²=cτ+d, product (g₁g₂,(φ₁∘g₂)φ₂), and identify the integral preimage, chosen S,T lifts, the principal-root cocycle and positive-T Weil convention. MetaplecticAutomorphicForms §§2.4b–2.6 build the cover and generators, but do not state this classical pair-model equivalence. This is the Part II extension at §§2.4b–2.6, classical rank-one comparison. The base theory stops at the interface described above.

### From TauCetiRoadmap.ModularForms

Layer 0, Layer 10B: Native integral-weight scalar slash/character comparison and line-bundle cohomology/Serre duality on compact Riemann surfaces. Worked examples, target η²⁴=Δ: eta’s product and SL₂(ℤ) transformation, including η(τ+1)=exp(πi/12)η(τ) and η(−1/τ)=√(−iτ)η(τ). The vector-bundle Dolbeault extension is a Part II extension contract.

What ModularForms must provide (gap:vector-bundle-dolbeault): Supply vector-bundle Dolbeault resolution and duality, high-divisor vanishing and global dbar-solvability on compact Riemann surfaces.

Extend ModularForms 10B’s O_D and line-bundle Serre duality to every finite-rank holomorphic vector bundle E on a compact Riemann surface, with Dolbeault resolution and H¹(E(nD))=0 for n≫0 when the effective cusp divisor D has positive degree on every connected component. On a connected compact curve this is exactly D≠0. A nonzero divisor supported on only one of two elliptic components does not kill H¹(O) on the other component, so total nonzeroness alone does not suffice on a disconnected curve. Consequently every smooth (0,1)-form with values in E(nD) is dbar-exact once H¹(E(nD))=0. The contract is generic: it contains no Fourier, cusp-growth or automorphic input; the cusp primitives, cutoffs, growth control and descent of §8.6 stay in this roadmap. This is a vector-bundle extension in the base roadmap’s direction. This is the Part II extension at Layer 10B, vector-bundle extension. The base theory stops at the interface described above.

### From TauCetiRoadmap.ContourIntegration

Layer 2, Layer 3: Residues for native meromorphic germs, the classical residue theorem for contours avoiding poles, and global Cauchy theorem. No singularity is placed on a contour. The pinned functions are `TauCeti.Contour.residue` in `TauCeti/Analysis/Contour/Residue/Basic.lean`, `TauCeti.Contour.classicalResidueTheorem_circle` in `TauCeti/Analysis/Contour/Residue/Theorem.lean` (positive radius, finitely many interior singularities and the stated meromorphic-order support condition), and `TauCeti.Contour.homologyCauchyTheorem` in `TauCeti/Analysis/Contour/HomologyCauchy.lean` (open domain, closed piecewise C¹ curve, holomorphic integrand and null homology).

### From TauCetiRoadmap.AutomorphicSpectralTheory

§1.16: the weight-k Laplacian is the holomorphic-weight operator Δ_k=−y²(∂x²+∂y²)+iky(∂x+i∂y), on C² functions on ℍ for every real k. `weight_laplacian_slash` gives covariance for integral weight, and the Powers bullet of §1.16 gives Δ_k(yˢ)=s(1−k−s)yˢ for complex s and y>0. Section 8.2 extends the operator calculus by R, L and xi, with conjugate-representation and half-integral-weight covariance; no spectral realization or self-adjoint-domain theorem is consumed.

### From TauCetiRoadmap.PDE

Lane E: The interior regularity foundation; its smooth-coefficient conclusions do not assert analytic regularity. The analytic extension is recorded as a Part II extension contract.

What PDE must provide (gap:analytic-elliptic-regularity): Supply analytic elliptic regularity with its actual analyticity and interior ellipticity hypotheses.

On a real coordinate ball, every distributional solution of a linear elliptic differential operator with real-analytic coefficients is real analytic in the interior. In particular this applies to C² classical solutions of the second-order operator Δ_k away from y=0. Smooth coefficients alone do not imply this conclusion. PDE Lane E supplies smooth/Schauder regularity, which does not imply this analytic theorem. This is the Part II extension at Lane E, analytic-coefficient extension. The base theory stops at the interface described above.

### From TauCetiRoadmap.IntegralLattices

§0G, §§1G–1H: The even unimodular hyperbolic plane, orthogonal sums, finite quadratic modules and discriminant Gauss invariants; the latter feed the finite Weil supplier. The hyperbolic-plane identity controls low-rank stabilization.

## How to read the build

Layers 1–2 build coefficient domains and the complete normalized series calculus. Layers 3–4 supply the polynomial limits, partition adapters, statistics and arithmetic extractions. Layers 5–6 fix theta/eta roots, Lerch defects, period integrals and rational characteristic transformations. Layer 7 builds the full negative-cone and isotropic-boundary theta construction. Layer 8 builds the harmonic and mock spaces on those imported automorphy structures, with the exact Fourier and xi interfaces. Layer 9 treats every pole order in meromorphic Jacobi decomposition. Layers 10–11 identify actual classical q-series and rank specializations with their completions. `Suggested.lean` is the acceptance test: it states the q-binomial, Euler, bilateral Ramanujan and Bailey theorems; both Rogers–Ramanujan counting and analytic identities; the quintuple product; rank/crank equidistribution and prime-power congruences; the full completed Lerch elliptic and modular laws; and the third-order f/rank identity. Its module docstring identifies the remaining headlines whose constructions or automorphic carriers are absent at the pins. Its finite-product notation expands to Mathlib finite products. Each subsection below retains the complete API and discriminating Checks; these specify library work independently of the acceptance-test declarations.

## Layer 1: finite, integer-indexed and formal q-products

### 1.2 integer-indexed q-Pochhammer products

Define integer-indexed q-Pochhammer products as follows. For a commutative ring K with a specified unit q, extend P to integer indices by P₋ₙ(a;q)=(∏_(j=1)^n(1−a q^(−j)))⁻¹ in Kˣ, coerced to K, whenever every displayed factor is a unit. Positive indices use Pₙ and need no unit hypotheses on their factors. The negative-index domain is explicit. (Gasper1995, (2.1.3), p. 8, line 437; Gasper1995 line 437.)

The public laws are:

- P indexed by n≥0 agrees with Pₙ.
- P₋ₙ(a;q)Pₙ(aq^(−n);q)=1.
- Pᵢ₊ⱼ(a;q)=Pᵢ(a;q)Pⱼ(aqⁱ;q) when all three products and all reciprocal factors involved are defined.
- A ring homomorphism transports the specified units and preserves P.

For the proof, invert finite products of supplied units; reduce mixed-sign concatenation to cancellation in the finite identity.

*Needs:* HabiroCyclotomicCompletions §1.1.

**Checks.**

- minus one: For a=3,q=2 over ℚ, P₋₁=−2.
- index zero: P₀=1, including a=1.
- forbidden factor: Over ℚ, for a=q=2, index −1 is outside the domain; replacing an inverse of zero by zero is rejected.

### 1.3 regular quotient coefficients

Define regular quotient coefficients as follows. For finite lists A,B and a unit q in a commutative ring, define the rational coefficient Qⱼ(A;B;q). For j≥0 it is Pⱼ(A;q)/Pⱼ(B;q); for j=−n<0 it is ∏_(i=1)^n∏_(b∈B)(1−bq^(−i))/∏_(a∈A)(1−aq^(−i)). Only the denominator in the appropriate expression must be a unit. This is the regular continuation of a quotient, even where an individual negative-index P for B has a pole. (Gasper1995, (2.1.8), p. 9, line 478; (3.1.13), p. 15, line 830; Gasper1995 line 478.)

The public laws are:

- Q₀=1.
- Q₋₁([a];[b];q)=(q−b)/(q−a).
- Where both individual integer-index products are defined and the denominator is a unit, Q is their quotient.
- Qⱼ₊₁∏(1−bqʲ)=Qⱼ∏(1−aqʲ), on the common domain.

For the proof, clear the specified unit denominators and use finite concatenation; the quotient formula proves the continuation without using 0/0.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.2.

**Checks.**

- negative ratio: Q₋₁([3];[1];2)=−1.
- one sided termination: Q₋₁([3];[2];2)=0, despite the individual denominator P₋₁(2;2) having a pole.
- numerator pole: Over ℚ, A=[2],q=2 is forbidden at −1; it cannot be assigned by cancelling unrelated zeros.

### 1.4 formal q-Pochhammer products

Construct the full formal product by specialization of the supplied integral infinite product as follows. For any commutative ring K and a∈K, define P̂(a;X)∈K⟦X⟧ by the coefficientwise limit ∏_(j≥0)(1−aXʲ). The factor at j=0 is retained. Define its positive tail P̂₊(a;X)=∏_(j≥1)(1−aXʲ), a unit with constant coefficient 1. Parameter families live in native polynomial or Laurent-polynomial coefficient rings; completion is in X only. (Gasper1995, (1.2.7), p. 3, line 127; formal interpretation via Pak2002 §2.2.1, line 442; Gasper1995 line 127.)

Construct coefficient d of the positive formal tail from the first d+1 positive factors, and prove agreement with every prefix of length N≥d. The full formal product is its product with the constant series 1−a. Both constructions use an arbitrary commutative ring.

The public laws are:

- Coefficient d is determined by factors j≤d together with j=0.
- P̂₊ has constant coefficient 1 and is a unit.
- P̂(a;X)=(1−a)P̂₊(a;X).
- Coefficientwise scalar change commutes with both products.

For the proof, specialize `integralPochhammerInf` by Q↦X and T↦aX to obtain the positive tail, then multiply by 1−a for the full product. The substitution is coefficientwise locally finite. Every positive factor first changes degree j; the supplier stabilization theorem identifies each native coefficient with the displayed prefix. Apply the native power-series unit criterion and supplier scalar-change theorem.

*Needs:* HabiroCyclotomicCompletions §1.1; Mathlib `PowerSeries.isUnit_iff_constantCoeff`; TauCetiRoadmap.ClassicalArithmeticCompletion §4.20.

**Checks.**

- P̂(a;X)=(1−a)−a(1−a)X−a(1−a)X²+terms of degree ≥3.
- formal at one: P̂(1;X)=0, while P̂₊(1;X) is a unit; the two products cannot be identified.
- Tail at parameter zero: P̂₊(0;X)=1 over every commutative ring; this distinguishes parameter zero from parameter one.
- P̂₊(1;X) over 𝔽₂ starts 1+X+X²; reduction is coefficientwise.

### 1.5 inversion for two unit parameters

Prove the finite inverse-base identity. For every commutative ring K, units a,q∈Kˣ and n≥0, Pₙ(a;q)=(−a)ⁿq^(n(n−1)/2)Pₙ(a⁻¹;q⁻¹). Prove the integer-index inverse-base identity with the same two units and every j∈ℤ: Pⱼ(a;q)=(−a)ʲq^(j(j−1)/2)Pⱼ(a⁻¹;q⁻¹) on the common reciprocal-factor domain. All integer powers are powers of the specified units. The identity for parameter lists retains multiplicities and commutes with scalar change. This is the two-independent-unit extension of the supplied diagonal inverse-parameter formula. (Gasper1995, (1.3.10), p. 6, Gasper1995 line 313.)

For the proof, factor 1−aqʲ as −aqʲ(1−a⁻¹q^(−j)) and sum j, using the supplied finite product and concatenation laws.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.2; §1.3.

**Checks.**

- inversion witness: n=2 gives (1−a)(1−aq)=a²q(1−a⁻¹)(1−a⁻¹q⁻¹).
- unit guard: a=0 in ℤ cannot enter the inversion theorem.
- Negative index: at a=3,q=2,j=−1 the inverse-base right side is (−1/3)·2·3=−2, agreeing with §1.2; using j(j+1)/2 would give −1.

### 1.6 finite-prefix limits

Prove finite-prefix limits with the following hypotheses. For complex a and |q|<1, the finite products Pₙ(a;q) tend to the supplier product P(a;q), locally uniformly in (a,q) on ℂ×{|q|<1}. The finite/infinite relation is P(a;q)=Pₙ(a;q)P(aqⁿ;q); division by the tail is stated only if that tail is nonzero. (Gasper1995, (1.2.7) and Exercise 1.1(i), pp. 3, 7, lines 127 and 328; Gasper1995 line 127.)

The public laws are:

- The displayed locally uniform limit.
- Its value at each pair (a,q).

For the proof, use geometric majorants on compact sets and the supplier product. A product of nonzero factors with summable deviations has nonzero limit. Split a finite prefix before taking limits.

*Needs:* HabiroCyclotomicCompletions §1.1; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; Mathlib `multipliable_one_add_of_summable`; Mathlib `tprod_one_add_ne_zero_of_summable`.

**Checks.**

- analytic zero base: P(a;0)=1−a; no q≠0 is needed.
- tail zero: a=q⁻¹ with 0<|q|<1 gives a zero tail at n=1; an unrestricted quotient would be 0/0.

### Examples

The length-two product and its inverse-base form agree over ℤ[a,q,q⁻¹,a⁻¹]; formal positive tails remain units over 𝔽₂ and the zero ring.

### Dependencies

HabiroCyclotomicCompletions §1.1; Mathlib `Finset.prod`; Mathlib `PowerSeries.isUnit_iff_constantCoeff`; TauCetiRoadmap.ClassicalArithmeticCompletion §4.20; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; Mathlib `multipliable_one_add_of_summable`; Mathlib `tprod_one_add_ne_zero_of_summable`.

## Layer 2: basic hypergeometric series on their actual domains

### 2.1 unilateral basic hypergeometric series

Define unilateral basic hypergeometric series as follows. For finite complex lists A,B of lengths r,s, define the unilateral coefficient cₙ=Pₙ(A;q)/Pₙ(q,B;q)·[(-1)^n q^(n(n−1)/2)]^(1+s−r) and Φ(A;B;q,z)=Σₙ≥0 cₙzⁿ whenever this is summable. Negative powers use nonzero q. A terminating numerator q^(−N) means the finite sum 0≤n≤N with denominators checked only on that range; no subsequent 0/0 is evaluated. The formal version is the coefficient sequence over the localization generated by its actual denominator factors. (Gasper1995, (3.1.6), p. 13, line 717; domain paragraph p. 14, line 761; Gasper1995 line 717.)

The public laws are:

- The displayed normalized coefficient.
- Permuting either list preserves the series.
- cₙ₊₁/cₙ=∏(1−aqⁿ)/((1−qⁿ⁺¹)∏(1−bqⁿ))·(-qⁿ)^(1+s−r), if cₙ≠0.
- A common parameter may be cancelled only where its factors are nonzero on the actual range.

For the proof, construct coefficients first; use the finite product API for adjacent ratios and cancellations. Analytic values are paired with summability assertions, rather than treating tsum outside its domain as the function.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.3; §1.5.

**Checks.**

- phi empty: For A=B=[], c₀=1 and c₁=−1/(1−q); omitting the normalization changes the sign.
- phi binomial: For A=[a],B=[], c₁=(1−a)/(1−q).
- phi stop zero: A=[1] terminates at N=0 with value 1, even if a later denominator would vanish.
- phi bad denominator: B=[1], N≥1 is inadmissible; totalized division is not convergence.

### 2.2 bilateral basic hypergeometric series

Define bilateral basic hypergeometric series as follows. For complex lists A,B with lengths r,s, q≠0 and z≠0, define Ψ by summing over j∈ℤ the terms Qⱼ(A;B;q)(−1)^((s−r)j)q^((s−r)j(j−1)/2)zʲ. The admissibility of Q is checked separately on each half-line. If a numerator parameter q^(−N) stops the positive tail, or a denominator parameter q^M with M≥1 stops the negative tail, use the resulting finite range with coefficients zero beyond its endpoint; denominator factors are checked only before stopping and no later 0/0 is evaluated. This quotient-based definition includes a vanishing negative tail when a denominator parameter equals a positive power of q. (Gasper1995, (3.1.11)–(3.1.13), pp. 14–15, lines 805–854; Gasper1995 line 805.)

The public laws are:

- Separate j≥0 and j<0 using Q₋ₙ.
- Put h=s−r. For k∈ℤ on the common admissible, absolutely summable domain, Ψ(A;B;q,z)=Q_k(A;B;q)(−1)^(hk)q^(hk(k−1)/2)z^k Ψ(Aq^k;Bq^k;q,zq^(hk)).
- list scaling is entrywise.
- It agrees with the quotient of integer Pochhammers wherever the latter is defined.

For the proof, sum the explicitly normalized terms on ℤ and use the decomposition into nonnegative and negative integers. Clear denominators before relating Q to individual integer products.

*Needs:* §1.3; §2.1.

**Checks.**

- psi negative coefficient: For r=s=1 the j=−1 coefficient is (q−b)/((q−a)z).
- psi to phi: B=[q] makes every negative term vanish, giving the binomial unilateral series when a is not a positive power of q.
- psi zero argument: z=0 is outside the bilateral domain even though the unilateral series has value 1 there.

### 2.3 convergence and base inversion

Prove convergence and base inversion with the following hypotheses. For 0<|q|<1, a nonterminating Φ converges absolutely for all z if r≤s, for |z|<1 if r=s+1, and only at z=0 if r>s+1. For |q|>1 put r₀=#nonzero A, s₀=#nonzero B and d=s−r+r₀−s₀. The positive Φ tail has asymptotic ratio magnitude |z|·|∏A≠0/ (q∏B≠0)|·|q|^(dn): d<0 gives every z, d=0 gives |z|<|q∏B≠0/∏A≠0|, and d>0 gives only zero. For Ψ, its positive tail at |q|<1 has ratio |z|·|q|^((s−r)n), while its negative tail has asymptotic ratio magnitude |∏B≠0/(z∏A≠0)|·|q|^(d(n+1)); at |q|>1 its positive tail has the latter degree d with reciprocal prefactor |z∏A≠0/∏B≠0| and its negative tail has asymptotic ratio magnitude |z|⁻¹|q|^((s−r)(n+1)). Intersect the two strict ratio domains. Every eventually zero tail is finite and overrides its nonterminating classification; on a finite nonzero-radius boundary the nonterminating terms do not tend to zero. For q=0 and e=1+s−r≥0, put C=∏(1−a)/∏(1−b): Φ=1+Cz/(1−z) if e=0 and |z|<1, and Φ=1+(−1)^e Cz if e>0. (Gasper1995, pp. 14–15, lines 761–854; corrected |q|>1 radius by (1.3.10)–(1.3.11), lines 313–323; Gasper1995 line 761.)

The public laws are:

- The displayed nonterminating interior domains.
- Intersection of the two half-line domains.
- For q and every parameter nonzero, the normalized unilateral n-th term equals Pₙ(A⁻¹;q⁻¹)/Pₙ(q⁻¹,B⁻¹;q⁻¹)·(z∏A/(q∏B))ⁿ. The normalized bilateral j-th term equals Q_j(A⁻¹;B⁻¹;q⁻¹)·(z∏A/∏B)ʲ. These are term identities on the common denominator domain.
- summation requires both actual tails.

For the proof, use the exact adjacent-term ratios, taking degrees after deleting zero parameters only in the leading products. For the negative tail use Q₋ₙ. A convergent product of the residual 1+O(|q|^n) factors proves failure of termwise decay at a finite boundary. Compute q=0 directly.

*Needs:* §1.6; §2.1; §2.2.

**Checks.**

- large base radius: q=2,a=−1/2,r=1,s=0 is nonterminating: for cₙ=Pₙ(a;2)/Pₙ(2;2), |cₙ₊₁/cₙ|→1/4, giving radius 4; z=3 is admissible.
- large base termination: At q=2,a=1/2,r=1,s=0, P₂(a;2)=0 and Φ=1−z/2 is entire; the nonterminating radius formula does not apply.
- bilateral annulus: For r=s with all parameters nonzero, 0<|q|<1 gives |∏B/∏A|<|z|<1.
- Negative-tail index shift: For A=[], B=[0], the negative terms are t₋ₙ=(−1)ⁿq^(n(n+1)/2)z^(−n), so t₋₁=−q/z and t₋₂/t₋₁=−q²/z. An exponent n in the negative-tail ratio misses a factor q.
- zero parameter: At |q|>1 a zero numerator changes d and may enlarge the radius; the generic product formula cannot be used blindly.

### 2.4 the q-binomial and Euler identities

Prove the q-binomial and Euler identities. For complex a, |q|<1 and |z|<1, Σₙ Pₙ(a;q)zⁿ/Pₙ(q;q)=P(az;q)/P(z;q). Consequently Σ zⁿ/Pₙ(q;q)=P(z;q)⁻¹ on |z|<1, and Σ q^(n(n−1)/2)zⁿ/Pₙ(q;q)=P(−z;q) for every complex z. For |q|>1 the binomial sum is P(z/q;q⁻¹)/P(az/q;q⁻¹) on |az/q|<1. (Gasper1995, (1.2.8), line 135; (1.3.6), (1.3.8), (1.3.11), lines 294, 301, 317; Gasper1995 line 135.)

The public laws are:

- `qBinomial`: the small-base analytic identity.
- `qBinomial_largeBase`: the large-base analytic identity.
- `euler_qExponential`: the two displayed Euler identities, with their absolute convergence. Prove the scalar-specialization adapter for every commutative ring K, in K[A]⟦Q⟧⟦Z⟧ the coefficient series ΣₙPₙ(A;Q)Zⁿ/Pₙ(Q;Q) equals the scalar image of `integralPochhammerInf` at T=AZ divided by its image at T=Z. Each finite denominator is a specified unit in K[A]⟦Q⟧, and each infinite denominator has Z-constant coefficient 1. This transports the supplied field coefficient identity through its integral universal model, with no independent q-binomial construction.

For the proof, compare constant terms and the recurrence (1−z)f(z)=(1−az)f(qz); the product has the same recurrence. Embed the integral universal coefficient model into ℚ(A)((Q))⟦Z⟧, apply the supplied field coefficient identity there, and descend along that injection before scalar change to K[A]⟦Q⟧⟦Z⟧. This proves the formal adapter and its Euler specializations without division by a nonunit. Use compact majorants for the entire Euler limit and finite inversion for the large-base case.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.4; §1.6; §2.3; TauCetiRoadmap.ClassicalArithmeticCompletion §§2.31, 4.20.

**Checks.**

- q zero binomial: q=0 gives 1+(1−a)z/(1−z)=(1−az)/(1−z).
- euler zero base: At q=0 the entire Euler series is 1+z, since only n=0,1 survive.
- euler finite field base: At q=1/2 the Euler series Σzⁿ/Pₙ(q;q) begins 1+2z+(8/3)z²; using the finite-field cardinality 2 as the small base would give different coefficients.

### 2.5 Ramanujan’s bilateral summation

Prove Ramanujan’s bilateral summation with the following hypotheses. If 0<|q|<1, a≠0, |b/a|<|z|<1 and every displayed denominator factor is nonzero, then Ψ([a];[b];q,z)=P(q,b/a,az,q/(az);q)/P(b,q/a,z,b/(az);q), with absolute convergence. The quotient-coefficient formulation includes b=q^N, N≥1, by its vanishing negative tail and analytic continuation. (Gasper1995, (2.1.8)–(2.1.9), p. 9, lines 478–508; Gasper1995 line 478.)

The public laws are:

- `ramanujanOnePsiOne_hasSum`: The displayed absolutely convergent equality.
- The b=q^N specialization is the shifted binomial theorem.

The bilateral coefficient `ramanujanOnePsiOneTerm` at (a,b,q,z,j) is Pⱼ(a;q)zʲ/Pⱼ(b;q) for j≥0 and, for j=−m<0, is `prod_(0<=r<m)((b-q^(r+1))/(a-q^(r+1)))*z^(-m)`. Its domain requires `1-b*q^r != 0` and `a-q^(r+1) != 0` for every r≥0. This polynomial-ratio negative tail allows b=0 and b=q^N without dividing by b. Its API is agreement with the finite quotient for j≥0; the displayed reciprocal-factor expression; `(1-b*q^j)*t_(j+1)=(1-a*q^j)*z*t_j` for every integer j on this domain. The annulus implies z≠0 and |b/(az)|<1; the factor exclusions make P(b;q) and P(q/a;q) nonzero, so every infinite denominator in the headline is nonzero. The coefficient formula is (Gasper1995, (2.1.8), pp. 8–9, lines 478–496; Gasper1995 line 478).

For the proof, prove the q^N specializations by shifting the binomial theorem. Both sides are holomorphic in b on pole-free subdomains; use the accumulating sequence q^N and continue in the annulus. This is analytic continuation, not formal Laurent substitution.

*Needs:* §1.6; §2.2; §2.4.

**Checks.**

- ramanujan zero term: `ramanujanOnePsiOneTerm(a,b,q,z,0)=1`; retaining an extra initial factor would change the constant term.
- ramanujan negative term: At j=−1 the term is `(b-q)/(a-q)/z`, fixing the direction of the reciprocal quotient and the negative z-power.
- ramanujan zero parameter: At a=2, q=z=1/2, b=0 the j=−1 term is −2/3, while b=q makes it zero. A formula dividing by b would lose the first case.
- psi binomial specialization: b=q gives the binomial product, since all negative coefficients are zero.
- annulus empty: a=b gives |b/a|=1 and an empty required annulus; there is no convergent two-sided geometric series.

### 2.6 Bailey pairs

Define `baileyPair` as follows. For a commutative ring K with all Pₙ(q;q) and Pₙ(aq;q) specified units, a Bailey pair relative to (a,q) is a pair of sequences α,β:ℕ→K satisfying βₙ=Σ_(r=0)^n αᵣ/(Pₙ₋ᵣ(q;q)Pₙ₊ᵣ(aq;q)). This is a linear relation, so normalization α₀=β₀=1 is a separate condition, not a requirement on every pair. (Andrews1986, Bailey’s Lemma (2.3), p. 114, lines 85–108; Andrews1986 line 85.)

The public laws are:

- Every α defines a unique β by the finite sum.
- The α sequence determines the pair.
- Pairs form a K-module.
- Ring homomorphisms preserving the supplied units transport pairs.

For the proof, define the finite linear transform directly and use extensionality. Its value at zero is β₀=α₀. Scalar transport applies the finite product and specified-unit inverse APIs.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.5.

**Checks.**

- bailey unit pair: For α₀=1 and αₙ=0 for n>0, βₙ=1/(Pₙ(q;q)Pₙ(aq;q)).
- bailey zero pair: The two zero sequences form a pair, while the unit pair has β₀=1.
- β₁=α₀/((1−q)(1−aq))+α₁/((1−aq)(1−aq²)); replacing n+r by n−r fails.
- bailey non-example: Over ℚ at a=1,q=1/2, the pair α=β=δ₁ fails already at n=1: its right side is 8/3 rather than 1. Replacing n+r by n−r would incorrectly give 1 in that relation.

### 2.7 the Bailey transformation and its limits

Prove the Bailey transformation and its limits with the following hypotheses. For a Bailey pair (α,β), units ρ₁,ρ₂ and t=aq/(ρ₁ρ₂), define α′ₙ=Pₙ(ρ₁,ρ₂;q)tⁿαₙ/Pₙ(aq/ρ₁,aq/ρ₂;q) and β′ₙ=Σ_(j=0)^n Pⱼ(ρ₁,ρ₂;q)Pₙ₋ⱼ(t;q)tʲβⱼ/(Pₙ₋ⱼ(q;q)Pₙ(aq/ρ₁,aq/ρ₂;q)). For the finite transformation over a commutative ring, every factor in Pₙ(aq/ρ₁;q) and Pₙ(aq/ρ₂;q), for every n≥0, is a specified unit; the original Bailey unit domain is also retained. Then (α′,β′) is a Bailey pair. Over ℂ, for |q|<1, |t|<1, all stated denominator products nonzero, and Σ|αₙtⁿ|<∞, the identity Σ Pₙ(ρ₁,ρ₂;q)tⁿβₙ=P(aq/ρ₁,aq/ρ₂;q)/P(aq,t;q)·Σ Pₙ(ρ₁,ρ₂;q)tⁿαₙ/Pₙ(aq/ρ₁,aq/ρ₂;q) holds absolutely. For the same complex Bailey pair, assume |q|<1 and P(aq;q)≠0. The two-parameter limit is Σ aⁿq^(n²)βₙ=P(aq;q)⁻¹Σ aⁿq^(n²)αₙ under Σ|aⁿq^(n²)αₙ|<∞. For fixed ρ≠0 with P(aq/ρ;q)≠0, the one-parameter limit is Σ Pₙ(ρ;q)(−aq/ρ)ⁿq^(n(n−1)/2)βₙ=P(aq/ρ;q)/P(aq;q)·Σ Pₙ(ρ;q)(−aq/ρ)ⁿq^(n(n−1)/2)αₙ/Pₙ(aq/ρ;q), under Σ|(−aq/ρ)ⁿq^(n(n−1)/2)αₙ|<∞. Both equalities assert absolute convergence. They are the termwise ρ₁,ρ₂→∞ and ρ₁→∞ specializations, proved directly from the finite Bailey relation with these bounds. (Andrews1986, Bailey’s Lemma (2.3)–(2.6), pp. 114–115, lines 93–110; limiting identity (3.1), p. 116; Andrews1986 line 93.)

The public laws are:

- `baileyLemma_transform`: The displayed finite transformation preserves the Bailey relation.
- The displayed absolutely convergent identity.
- Repeated transforms preserve the same pair relation.
- The displayed two-parameter limit with its α-weighted summability.
- The displayed fixed-ρ limit with its α-weighted summability and nonzero products.

For the proof, substitute the finite β relation, exchange the finite triangular sums, and clear all supplied unit denominators. The remaining finite kernel identity follows by q-Pascal induction, including the n=0 boundary; it gives the new pair relation. For the infinite formula take n→∞ in both expressions for β′ₙ. Product nonvanishing bounds all reciprocal tails uniformly; the α-weighted absolute summability and |t|<1 give a geometric double majorant. The same bounds justify each displayed limiting specialization before using it in a mock identity.

*Needs:* §2.6; §1.6; §2.4.

**Checks.**

- bailey zero base: At q=0,a=0 and unit ρ₁,ρ₂, the transformed unit pair remains α=δ₀, βₙ=1.
- bailey limit unit: For the unit pair, the two-parameter identity sums to 1/P(aq;q), and at a=0 both sides are 1; no inverse of a is needed.
- bailey forbidden rho: Over ℂ, ρ₁=aq≠0 makes a denominator factor 1−aq/ρ₁=0 at n=1, so the naive cancelled transform is excluded.

### Examples

At q=0 the unilateral binomial sum is 1+(1−a)z/(1−z); at q=2,a=−1/2 its nonterminating radius is 4, whereas a=1/2 gives the polynomial 1−z/2. Bilateral termination is tested through quotient coefficients.

### Dependencies

HabiroCyclotomicCompletions §1.1; §1.3; §1.5; §1.6; §1.4; TauCetiRoadmap.ClassicalArithmeticCompletion §§2.31, 4.20.

## Layer 3: polynomial identities and partition-series adapters

### 3.1 rectangle partitions and signed Gaussian indices

Define the rectangle polynomial for n and k in ℕ[Q] for 0≤k≤n by summing Q to the size of each native partition whose diagram fits inside a k by (n−k) rectangle. The finite carrier is the union of the corresponding restricted native partition types in sizes at most k(n−k). Define the signed-index Gaussian polynomial for n and k, for k∈ℤ, as the supplied Gaussian polynomial at (n, k.toNat) when k≥0 and zero otherwise. Write G(n,k) for its coefficient map to ℤ[Q], then evaluate in every commutative ring. These are combinatorial and index adapters to the supplied Gaussian polynomial. (Gasper1995, (1.3.3)–(1.3.4), pp. 5–6, Gasper1995 line 267; the rectangle interpretation is the finite-subset derivation.)

Prove that for 0≤k≤n, the rectangle sum equals the supplied polynomial. Its API identifies a rectangle partition, after adding the staircase, with a k-element subset of {0,…,n−1}, with exponent equal to its sum minus k(k−1)/2. Coefficient d counts exactly the size-d rectangle partitions. The signed-index polynomial agrees with the supplied Gaussian polynomial for k≥0 and is zero for k<0. These laws retain the integer lower index needed by Schur’s floor expressions. Prove that for every commutative ring K and 0≤k≤n, the coefficient image G(n,k) satisfies G(n,k)Pₖ(Q;Q)Pₙ₋ₖ(Q;Q)=Pₙ(Q;Q), with no unit hypothesis. Derive this integral polynomial identity from the supplied field quotient formula in ℚ(Q), then transport it along every coefficient map; quotient notation is used only when its factors are units.

For the proof, the staircase bijection gives the subset generating polynomial. Split by the last element and use the supplied Pascal law and initial values to identify it with the supplied Gaussian polynomial. Transport along coefficient maps without division.

*Needs:* TauCetiRoadmap.ArithmeticStatisticsPartIV §3.2; Mathlib `Nat.Partition` and `YoungDiagram`; HabiroCyclotomicCompletions §1.1.

**Checks.**

- Rectangle 1 by 1: the empty diagram and singleton give 1+Q; counting only full rectangles would give Q.
- Empty rectangle: G(0,0)=1, while G(0,−1)=G(0,1)=0. Truncating the signed lower index before testing its sign gives the wrong value at −1.
- Rectangle 1 by 2: evaluation at Q=1 is 3, and becomes 1 over 𝔽₂; replacing the polynomial by its leading monomial fails.
- Root of unity: the 2 by 2 rectangle polynomial G(4,2)=1+Q+2Q²+Q³+Q⁴ has value 2 at Q=−1, where its quotient P₄(Q;Q)/P₂(Q;Q)² is 0/0; the 1 by 1 case is not singular there, since (1−Q)(1−Q²)/(1−Q)² is 0/4.

### 3.2 finite Schur identities

Prove finite Schur identities with the following hypotheses. For every n≥0 the following integral polynomial identities hold: Σ_(j≥0)Q^(j²)G(n−j,j)=Σ_(h∈ℤ)(−1)^h Q^(h(5h+1)/2)G(n,⌊(n−5h)/2⌋), and Σ_(j≥0)Q^(j²+j)G(n−j,j)=Σ_(h∈ℤ)(−1)^h Q^(h(5h+3)/2)G(n+1,⌊(n−5h)/2⌋). Terms with j>n or invalid lower Gaussian index are zero; thus both displayed sums are finite. These are e_(n+1) and d_(n+2) in Warnaar’s convention. (Warnaar2001, (1.4a)–(1.4b), p. 1, lines 49–65, and (1.6), p. 2, lines 92–108; Warnaar2001 line 49.)

The public laws are:

- The first displayed polynomial identity.
- The second displayed polynomial identity.
- Write D_n and E_n for the two left sums. For n≥2, D_n=D_(n−1)+Q^(n−1)D_(n−2) and E_n=E_(n−1)+Q^n E_(n−2), with D₀=D₁=E₀=E₁=1. Each corresponding right sum satisfies the same recurrence and initial data (Warnaar2001, (1.3), p. 1, lines 45–48, with the same index shifts).

For the proof, D_n counts gap-at-least-two partitions with largest part at most n−1; E_n counts such partitions with smallest part at least 2 and largest part at most n. Splitting on the largest allowed part gives exactly the displayed recurrences. Substitute the two q-Pascal expansions on the signed right sums, split n−5h by parity, and pair adjacent h terms to obtain these same recurrences with D₀=D₁=E₀=E₁=1. Induction proves both polynomial identities without a Watson transformation or denominator cancellation.

*Needs:* §3.1.

**Checks.**

- schur length two: At n=2 the two identities give 1+Q and 1+Q².
- schur boundary: At n=0 both sides are 1; signed floor indices must remain out of range rather than truncated to zero.

### 3.3 Rogers–Ramanujan identities

Prove Rogers–Ramanujan identities with the following hypotheses. For complex |q|<1, Σ q^(n²)/Pₙ(q;q)=1/P(q,q⁴;q⁵) and Σ q^(n²+n)/Pₙ(q;q)=1/P(q²,q³;q⁵), absolutely and locally uniformly. For every commutative ring K the corresponding identities hold in K⟦X⟧ with inverses of constant-one products, and their coefficients count, respectively, partitions with successive gaps≥2 and partitions with successive gaps≥2 and all parts≥2, versus parts in residues ±1 and ±2 modulo 5, for every size including zero. (Gasper1995, (4.2.11)–(4.2.12), p. 29, line 1672; Pak2002 §§7.1.1–7.1.3, lines 3703–3755; Gasper1995 line 1672.)

Define `IsGapTwo` on p:Nat.Partition n by pairwise `a+2<=b` on its increasingly sorted list of parts; this retains multiplicities and is equivalent to successive gaps at least two. Define `IsPlusMinusOneMod5` by requiring each part to have remainder 1 or 4 modulo 5. Their API is equivalence with the successive-gap condition; the parts are distinct; agreement with the native restricted partition predicate for residues 1 and 4 (Pak2002 §7.1.1–7.1.3, pp. 38–39, lines 3703–3755; Pak2002 line 3745).

The public laws are:

- Both formal product identities over K.
- `rogersRamanujan_count`: equality of the finite counts selected by `IsGapTwo` and `IsPlusMinusOneMod5`.
- `rogersRamanujan_count_two`: equality after requiring every gap-two part to be at least 2, versus every part having remainder 2 or 3 modulo 5.
- `rogersRamanujan_hasSum`: Both absolutely convergent complex identities. Both finite-count laws quantify over every n:ℕ, including zero.

For the proof, take coefficientwise limits in 3.2: each Gaussian with both rectangle sides growing tends to the ordinary partition product; fixed j on the left tends to 1/Pⱼ. The quadratic exponents bound the indices contributing to each coefficient. Apply the imported formal triple product to the two bilateral sums and scalar-change contract. Removing the staircases (2k−1,…,1) and (2k,…,2) proves the counting interpretations. Geometric product bounds and the quadratic numerator justify analytic limits; division is by nonzero positive tails.

*Needs:* §1.4; §1.6; §3.2; TauCetiRoadmap.ClassicalArithmeticCompletion §§4.20, 4.40; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

**Checks.**

- rogers first five: First series: coefficients in degrees 0,…,4 are 1,1,1,1,2; second: 1,0,1,1,1.
- rogers at zero: Both analytic sums and products have value 1 at q=0.
- gap two singleton: At size 4, (4) satisfies `IsGapTwo`; a condition demanding two parts would fail.
- gap two boundary: (3,1) satisfies `IsGapTwo`, with gap exactly 2; a strict gap bound would reject it.
- gap two multiplicity: (2,2) fails `IsGapTwo`; sorting a set instead of the multiset would admit it.
- residue singleton: (4) satisfies `IsPlusMinusOneMod5`, testing the negative residue −1.
- residue gap distinction: (3,1) fails `IsPlusMinusOneMod5` although its gap is 2; the gap and residue predicates are different.
- residue repetition: (2,2) fails `IsPlusMinusOneMod5`; multiplicity does not make a forbidden part allowed.

### 3.4 the quintuple product

Prove the quintuple product with the following hypotheses. For 0<|q|<1 and z≠0, Σ_(n∈ℤ)(−1)^n q^(n(3n−1)/2)z^(3n)(1+zqⁿ)=P(q,−z,−q/z;q)P(qz²,q/z²;q²), absolutely and locally uniformly on the stated domain. (Gasper1995, (2.2.10), p. 11, line 605; Gasper1995 line 605.)

The public laws are:

- J(−z;q)J(qz²;q²)=P(q²;q²)(J(qz³;q³)+zJ(q²z³;q³)).
- `quintupleProduct_hasSum`: The displayed absolutely convergent identity with integer powers on ℤ.

For the proof, use the imported triple-product series in the theta-addition identity. Multiplication is justified by absolute double summability; split the integer lattice into its residue classes, pair the cancelling classes, and complete the two resulting quadratic exponents. Since P(q²;q²)≠0, division gives the stated identity. Gasper states the identity without its proof; the theta-addition equality is a named proof obligation here.

*Needs:* §1.6; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

**Checks.**

- quintuple at one: At z=1 the factor P(q;q²) occurs twice; the n=0,1,−1 terms begin 2−2q−2q².
- quintuple zero guard: z=0 and |q|=1 do not enter the identity.

### 3.5 ordinary partition-series adapters

Define ordinary partition-series adapters as follows. For every commutative semiring K define Π_K=Nat.Partition.genFun (fun _ _ => 1), with coefficient p(n)=card(Nat.Partition n) cast to K. Over commutative rings identify Π_K with the inverse of P̂₊(1;X). Its complex analytic realization is Σ p(n)qⁿ=1/P(q;q) for |q|<1. (Pak2002, §2.2.1, p. 10, lines 442–455; Pak2002 line 442.)

The public laws are:

- coeff n Π_K=(p(n):K).
- Every semiring homomorphism maps Π to Π.
- Π_K P̂₊(1;X)=1 over a commutative ring.
- The displayed complex realization.

For the proof, specialize the imported weighted theorem at weight 1. Each factor is a geometric series inverse. The native pentagonal product is the same constant-one product. Use the supplier formal-to-analytic theorem with the nonzero Euler product and its holomorphic Taylor coefficients.

*Needs:* Mathlib `Nat.Partition.genFun`; Mathlib `Nat.Partition.hasProd_genFun`; §1.4; §1.6; TauCetiRoadmap.ClassicalArithmeticCompletion §2.31.

**Checks.**

- partition empty: p(0)=1 and Π_K(0)=1; counting only nonempty partitions fails.
- partition small: p(1)=1,p(2)=2,p(4)=5.
- partition pentagonal: Multiplication by the native pentagonalSeries has coefficients 1,0,0,0,0 through degree 4.
- partition glaisher: The odd/distinct specializations agree with the imported odd/distinct partition theorem; they are applications of the adapter.

### Examples

The Rogers–Ramanujan series begin 1+X+X²+X³+2X⁴ and 1+X²+X³+X⁴. The ordinary partition series begins 1+X+2X²+3X³+5X⁴. All three have constant coefficient 1, also after reduction modulo 2.

### Dependencies

HabiroCyclotomicCompletions §1.1; TauCetiRoadmap.ArithmeticStatisticsPartIV §3.2; Mathlib `Nat.Partition.genFun`; §1.4; §1.6; TauCetiRoadmap.ClassicalArithmeticCompletion §§4.20, 4.40; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; Mathlib `Nat.Partition.hasProd_genFun`; TauCetiRoadmap.ClassicalArithmeticCompletion §2.31.

## Layer 4: rank, crank and arithmetic progressions

### 4.1 native partition rank and crank

Define `partitionRank` and `partitionCrank` as follows. For λ:Nat.Partition n define rank(λ)=max(parts,default 0)−card(parts) in ℤ. Put o=count(1,parts) and g=card(filter (o<·) parts); define crank(λ)=max(parts,default 0) if o=0, and g−o otherwise. The empty statistics are zero. Define their Laurent-polynomial coefficient series by summing z^statistic over all λ at each n. (AndrewsGarvan1988, rank line 10; crank definition lines 80–88; Zagier2009 lines 898–922; AndrewsGarvan1988 line 10.)

The public laws are:

- `partitionRank (Nat.Partition.conjugate p) = -partitionRank p`.
- Equal native partitions give equal statistics and equal Laurent monomials.
- The degree-n Laurent coefficient is the finite sum over Nat.Partition n.
- With no ones crank is the largest part.
- With ones use the displayed strict filter.

For the proof, use the existing partition and conjugation carrier. Compare first row and first column lengths for the rank sign. Finite sums define the Laurent coefficients, avoiding analytic z-convergence in the definition.

*Needs:* Mathlib `Nat.Partition.genFun`; Mathlib `Nat.Partition.conjugate_conjugate`; §3.5.

**Checks.**

- Both statistics of the empty partition are 0.
- rank crank one: For (1), rank=0 and crank=−1; a symmetric ordinary crank count at size one is false.
- rank crank strict: For (3,2,1,1), o=2, g=1, rank=−1, crank=−1; counting parts ≥o would give crank 0.
- rank crank no ones: For (3,3), rank=1 and crank=3; conjugation sends (3,3) to (2,2,2) with rank −1.

### 4.2 weighted vector partitions

Define weighted vector partitions as follows. A vector partition of n is a triple (λ,μ,ν) with λ distinct and total size n. Its weight is (−1)^card λ and its statistic is card μ−card ν. Let V_n(z) be the finite weighted Laurent sum, and V(z;X)=Σ V_n(z)Xⁿ. (AndrewsGarvan1988, (1.4)–(1.11), pp. 167–168, lines 24–64; AndrewsGarvan1988 line 24.)

The public laws are:

- Swapping μ,ν preserves the weight and negates the statistic.
- The unique size-zero triple has weight 1 and statistic 0.
- V_n is its finite weighted Laurent sum.
- V=P̂₊(1;X)/(P̂₊(z;X)P̂₊(z⁻¹;X)).

For the proof, use the weighted generating-function theorem independently for the three factors, then a finite size convolution. Exchange the two unrestricted factors for symmetry.

*Needs:* §4.1; Mathlib `Nat.Partition.genFun`.

**Checks.**

- vector size one: V₁(z)=z+z⁻¹−1; the distinct singleton supplies the negative term.
- vector size zero: V₀=1.
- vector swap: ((2),(1,1),(1)) has weight −1 and statistic 1; swapping the last two gives statistic −1.

### 4.3 rank and crank generating functions

Prove rank and crank generating functions with the following hypotheses. In ℤ[z,z⁻¹]⟦X⟧, the rank series R(z;X)=Σ_(n≥0)X^(n²)/(Pₙ(zX;X)Pₙ(z⁻¹X;X)). The ordinary crank series is C(z;X)=V(z;X)+(1−z)X. Thus rank counts are symmetric for every n, vector crank counts for every n, and ordinary crank counts for n≠1. Complex evaluations agree with these formulas wherever the displayed series converge absolutely and their denominator factors are nonzero; in particular this includes |q|<1 and |z|=1. (AndrewsGarvan1988, Theorem 1, line 87 and proof lines 97–125; Zagier2009 rank series lines 912–922; AndrewsGarvan1988 line 87.)

The public laws are:

- The displayed Durfee-square series.
- C=V+(1−z)X, including sizes 0 and 1.
- For n≠1, counts of crank m and −m are equal.

For the proof, split a Young diagram at its Durfee square to obtain two partitions of bounded length. For crank separate the number of ones; use 2.4 to sum the remaining weighted factors. At sizes >1 this identifies C and V; compute sizes 0 and 1 separately, giving the correction.

*Needs:* §4.1; §4.2; §1.6; §2.4.

**Checks.**

- crank correction: At size 1 the corrected coefficient is z⁻¹.
- rank at minus one: R(−1;q)=Σ q^(n²)/Pₙ(−q;q)²=f(q).

### 4.4 residue counts and character filters

Define `partitionResidueCount`, the finite-fiber adapter underlying the rank and crank residue counts, as follows. For every t>0 and r∈ZMod t, let N(r,t,n) and M(r,t,n) count native partitions of n whose integer rank or crank maps to r. The adapter `partitionResidueCount` counts fibers of any integer-valued statistic on native partitions, for every natural modulus t. At t=0 its target is ZMod 0=ℤ, so it counts an exact integer value; the residue-sum and character-filter laws below require t>0. Their generating series are defined coefficientwise over ℤ, with scalar change. The finite character filter is t·Σ_n N(r,t,n)qⁿ=Σ_(j=0)^(t−1)ζ_t^(−rj)R(ζ_t^j;q), and likewise for C, on |q|<1; in characteristic-free form the identity lives over ℤ[ζ_t] without division by t. (Zagier2009, §7, lines 898–925; character filtering is the finite geometric-sum derivation; Zagier2009 line 898.)

The public laws are:

- Σ_r N(r,t,n)=Σ_r M(r,t,n)=p(n).
- If t∣u, sum the u-residue counts over the fiber to get the t-residue count.
- The displayed finite filter and its crank analogue.
- For t=1 the sole count is p(n).

Prove the complex finite character filter as a specialization of the cyclotomic integral identity, and retain its scalar reductions without dividing by t.

For the proof, partition the finite native type by the residue map. Use the finite geometric sum for ζ_t to prove coefficientwise orthogonality; finite sums commute with the absolutely convergent analytic realization.

*Needs:* §4.1; §4.3.

**Checks.**

- At t=1, ζ=1, the filter is the ordinary partition series.
- At n=1, rank lies in class 0 and crank in class 1 modulo 2.
- filter characteristic: Reduction modulo a divisor of t retains the multiplied identity; division by t is not permitted.

- Zero-statistic fiber: for the constant-zero statistic, the residue-one count modulo 2 is zero at every size. A filter that forgets its residue predicate would count every partition.

### 4.4a complete rank and vector-crank dissections

Prove complete rank and vector-crank dissections with the following hypotheses. For a primitive ℓth root ζ and |q|<1, construct the complete identities R(ζ;q)=Σ_(r=0)^(ℓ−1)qʳD^R_(ℓ,r)(q^ℓ) for ℓ=5,7 and V(ζ;q)=Σ_(r=0)^(ℓ−1)qʳD^V_(ℓ,r)(q^ℓ) for ℓ=5,7,11. The coefficient of Xⁿ in D^R is Σ_a ζ^a N(a,ℓ,ℓn+r), and the analogous signed vector count gives D^V. Identify every D with its theta-product and, for rank, Lambert-series expression, not only its zero classes. The rank expressions are the complete rank-difference identities of AtkinSwinnertonDyer1954 pp. 84–106, with the empty partition convention of §4.3; the crank expressions are Garvan1988 (3.1), (5.2), (6.8) and their product definitions (3.4)–(3.7), (5.3), (6.1)–(6.14). In particular put J_(a,m)(X)=P(X^a,X^(m−a),X^m;X^m), E(X)=P(X;X), A=J_(2,5)/P(X,X^4;X^5)², B=E(X^5)/P(X,X^4;X^5), C=E(X^5)/P(X²,X³;X^5), D=J_(1,5)/P(X²,X³;X^5)². Then V(ζ₅;q)=A(q⁵)−(ζ₅+ζ₅⁻¹)²qB(q⁵)+(ζ₅²+ζ₅⁻²)q²C(q⁵)−(ζ₅+ζ₅⁻¹)q³D(q⁵). The D-functions are analytic on the disc and all sums used to obtain them are absolutely summable there. Prove D^R_(5,4)=D^R_(7,5)=D^V_(5,4)=D^V_(7,5)=D^V_(11,6)=0. (Garvan1988, §§2–6, (3.1), (3.4)–(3.7), Theorems (5.1), (6.7), lines 419–443, 609–627, 687–708; rank: AtkinSwinnertonDyer1954 pp. 84–106; rank-five comparison Garvan1988 §8.)

For the complete seven-dissection, put c_j=ζ₇ʲ+ζ₇^(−j), U(X)=P(X,X²,X⁵,X⁶;X⁷)⁻¹, V₇(X)=P(X,X³,X⁴,X⁶;X⁷)⁻¹ and W(X)=P(X²,X³,X⁴,X⁵;X⁷)⁻¹. The ordered tuple (D^V_(7,r))_(r=0,…,6) is E(X)·(U²,(c₁−1)UV₇,c₂V₇²,(c₃+1)UW,−c₁V₇W,0,−(c₂+1)W²), all functions evaluated at X. For eleven put c_j=ζ₁₁ʲ+ζ₁₁^(−j), Q_b=J_(b,33)(X), (A₀,A₃,A₇,A₈,A₉)=(Q₁₅,Q₁₂,Q₆,Q₃,Q₉), and (B₀,B₁,B₂,B₄,B₇)=(Q₁₆−X²Q₅,Q₁₄−XQ₈,Q₁₃−X³Q₂,Q₇+XQ₄,Q₁₀+X³Q₁). Then E(X)·(D^V_(11,r))_(r=0,…,10) equals (A₀B₀−X³A₇B₄, (c₁−1)(A₀B₁−X⁴A₈B₄), c₂(A₀B₂−X²A₉B₄), (c₃+1)(A₃B₀−X²A₇B₇), (c₂+c₄+1)(A₃B₁−X³A₈B₇), −(c₂+c₄)(A₃B₂−XA₉B₇), 0, (c₁+c₄)(A₀B₇−XA₃B₄), −(c₂+c₅+1)X(A₇B₁−XA₈B₀), −(c₄+1)(A₉B₀−XA₇B₂), −c₃(A₉B₁−X²A₈B₂)). Cyclotomic Galois transport gives these identities for every primitive root, not just exp(2πi/ℓ). (Garvan1988 Theorems (5.1), (6.7), lines 609–627, 687–708.) The residue-five term corrects A₈ in the printed (6.8) to A₉: the product derivation below and (6.24) give A₉ (Garvan1988 line 695, p. 64; lines 719–729 and 747–749, p. 65).

For rank, put Δ_(a,r)(X)=Σ_(n≥0)(N(a,ℓ,ℓn+r)−N(0,ℓ,ℓn+r))Xⁿ. The complete rank target is D^R_(ℓ,r)=Σ_(a=1)^(ℓ−1)ζ^aΔ_(a,r) for every 0≤r<ℓ, together with the product/Lambert evaluations of every Δ in AtkinSwinnertonDyer1954 pp. 84–106. This identity fixes the interface without adding the ordinary partition term, since Σ_(a=0)^(ℓ−1)ζ^a=0. The Lambert terms in the nonzero rank residues remain part of the target.

A source locator is Garvan1988 line 419.

The public laws are:

- The displayed residue coefficient formulas identify all components.
- The complete product/Lambert expressions with their actual pole and convergence domains.
- The five displayed zero components.
- For a,b∈ℂ with ab≠0 and 0<|q|<1, put J(z;Q)=P(z,Q/z,Q;Q). Prove P(a,q/a,b,q/b,ab,q/(ab),a/b,bq/a,q,q;q)=J(a³;q³)(J(b³q;q³)−bJ(b³q²;q³))−(a/b)J(b³;q³)(J(a³q;q³)−aJ(a³q²;q³)).
- extend to q=0 using the limits of the displayed P factors. This is the theta addition input of the eleven-dissection (Garvan1988 (6.15), lines 709–716).

For the proof, prove the displayed theta addition identity from the absolutely convergent triple-product double sums by residue-class regrouping, then specialize it for the eleven-dissection. Use Euler and Jacobi products for five and seven, retaining every residue component. For rank, use the full rank-difference identities, including their Lambert terms, and translate the source’s empty-partition convention. Product nonvanishing and geometric majorants justify coefficient extraction.

For 0<|q|<1, derive the residue-five correction by setting ζ=ζ₁₁, K=(1−ζ⁹)(1−ζ⁵)(1−ζ³)(1−ζ⁴) and N(q)=J(ζ⁵;q³)(J(ζ⁴q;q³)−ζ⁵J(ζ⁴q²;q³))−ζ⁴J(ζ⁴;q³)(J(ζ⁵q;q³)−ζ⁹J(ζ⁵q²;q³)). Substituting a=ζ⁹,b=ζ⁵ in the theta addition law gives N(q)=K E(q¹¹)V(ζ;q); K≠0 since ζ is primitive. Split each triple-product sum into its eleven index classes, equivalently using (6.4) and (6.6). The part of N with exponents congruent to 5 modulo 11 is −K(c₂+c₄)(q⁵Q₁₂Q₁₃−q³⁸Q₁₂Q₂−q¹⁶Q₉Q₁₀−q⁴⁹Q₉Q₁), where every Q is evaluated at q¹¹; the Q₁₅Q₁₁ term cancels. Factoring and dividing by the nonzero K E(q¹¹) yields −q⁵(c₂+c₄)(A₃B₂−q¹¹A₉B₇)/E(q¹¹). Thus the correction follows for every coefficient, independently of a finite coefficient comparison; q=0 follows by the disc limit (Garvan1988 (6.4), (6.6), (6.15)–(6.16), lines 668–684 and 709–729).

*Needs:* §4.3; §4.4; §2.4; ClassicalArithmeticCompletion §§4.40, 4.61.

**Checks.**

- dissection crank four: At size 4, V(ζ₅;q) has coefficient Σ_(a=0)⁴ζ₅^a=0; the target residue is absent.
- dissection nonzero: At size 1, V has coefficient ζ₅+ζ₅⁻¹−1≠0; the entire series is not zero.
- dissection theta constant: At q=0 the theta addition law becomes (1−a)(1−b)(1−ab)(1−a/b)=(1−a³)(1−b)−(a/b)(1−b³)(1−a), fixing both the sign and a/b factor.
- At size 49, all eleven ordinary crank counts are 15775, so [q⁴⁹]V(ζ₁₁;q)=0. The corrected numerator A₃B₂−XA₉B₇ is 1−X−X³−X⁴+O(X⁵), whose X⁴ coefficient after division by E(X) is 5−3−1−1=0; A₈ instead gives coefficient 1 and the false value −(c₂+c₄)≠0.
- dissection rank eleven: At size 6, rank 1 occurs twice modulo 11; the rank-five/seven zero-class law does not extend to 11.

### 4.5 equidistribution and the first congruences

Prove equidistribution and the first congruences with the following hypotheses. For every n≥0, N(r,5,5n+4) is independent of r, and N(r,7,7n+5) is independent of r. M(r,ℓ,ℓn+dℓ) is independent of r for (ℓ,dℓ)=(5,4),(7,5),(11,6). Consequently ℓ divides p(ℓn+dℓ) in these three cases. (AndrewsGarvan1988, (1.1)–(1.3), lines 10–23; Vector-Crank Theorem (1.13)–(1.15), lines 69–88; AndrewsGarvan1988 line 10.)

The public laws are:

- `rank_equidistribution_five_seven`: The two rank equalities.
- `crank_equidistribution_five_seven_eleven`: The three crank equalities.
- 5∣p(5n+4), 7∣p(7n+5), 11∣p(11n+6).

For the proof, apply §4.4a’s complete root-of-unity dissections to R and V and take coefficients in the three progressions. Use 4.3 at size >1 and finite character orthogonality from 4.4; summing equal classes gives divisibility. The nonzero residue components are retained in §4.4a.

*Needs:* §4.3; §4.4; §4.4a.

**Checks.**

- equidistribution small: At sizes 4,5,6 the equal crank class sizes are 1,1,1.
- At size 6 there are two partitions of rank 1; rank is not equidistributed modulo 11.

### 4.6 partition congruence offsets

Define the bounded inverse adapter δ for every positive integer M with gcd(24,M)=1: δ(M) is the unique natural number below M with 24δ(M)≡1 modulo M. Prove existence and uniqueness of this bounded inverse under the two modulus hypotheses. Specialize δ(ℓ,r)=δ(ℓʳ) for every natural ℓ coprime to 24 and every r≥0, without requiring primality. Define the progression series by F_M=Σ_(n≥0)p(Mn+δ(M))Xⁿ on the same positive coprime-modulus domain, with Fℓ,r=F_(ℓʳ). (BevilacquaChandranChoi2019, Introduction, p. 1, lines 39–44, for the prime-power notation; extension to positive coprime moduli by the residue-ring inverse and its unique bounded representative; BevilacquaChandranChoi2019 line 39.)

The public laws are:

- δ(M)<M and 24δ(M)≡1 modulo M holds for positive M coprime to 24.
- Every natural d<M with 24d≡1 modulo M equals δ(M).
- For positive N∣M with M coprime to 24, δ(M) mod N=δ(N), and hence δ(ℓ,r+1) mod ℓʳ=δ(ℓ,r).
- For natural M,N,d with N>0 and N∣M, the condition d<M and 24d≡1 modulo M implies d mod N<N and 24(d mod N)≡1 modulo N.
- coefficient n of F_M is p(Mn+δ(M)), including the ℓʳ specializations.

For the proof, use the supplied coprime residue-ring inverse and choose its unique bounded representative; reduction along N∣M preserves the inverse congruence and coprimality. Apply this with M=ℓʳ for the power specializations. The series uses native coefficients, without claiming convergence at |q|=1.

*Needs:* §3.5; §4.4; Mathlib `ZMod.coe_mul_inv_eq_one`, `ZMod.val_lt`.

**Checks.**

- offset first: δ(5,1)=4,δ(7,1)=5,δ(11,1)=6.
- offset thirteen: 6<13 and 24·6≡1 modulo 13 holds since 24·6=11·13+1; the construction includes ℓ=13 without claiming a partition divisibility.
- offset modulus one: 0<1 and 24·0≡1 modulo 1 holds; δ(1)=0, F₁=Π, and every r=0 specialization is defined.
- offset composite reduction: δ(65)=19 and 19 mod 13=6; divisibility reduction is not confined to consecutive prime powers.
- offset higher: δ(5,2)=24 and δ(7,3)=243: 24·243=17·343+1.
- offset zero modulus: the bounded-offset condition at modulus zero fails for every d because d<0 is impossible; positivity is required.
- offset bad prime: For M=2 or 3, the condition d<M and 24d≡1 modulo M fails for every d; those moduli and their positive powers are excluded, whereas their zeroth power is 1.

### 4.7 coefficient decimation

Define coefficient decimation as follows. For every commutative semiring K and integer t>0 define U_t:K⟦X⟧→ₗ[K]K⟦X⟧ by (U_t f)_n=f_(tn), interpreted as a K-linear map when K is a ring or semiring module. Define shifted extraction E_(t,a) f by coefficient f_(tn+a) for a≥0. These are linear coefficient operators, not ring homomorphisms. (Atkin1967, §2.1, p. 15, lines 57–64; §4.1, p. 23, lines 375–410; Atkin1967 line 57.)

The public laws are:

- Coefficient n of U_t f equals coefficient tn of f.
- U_s(U_t f)=U_(st)f.
- U_t(f(X^t)g(X))=f(X)U_t g(X).
- Coefficient ring homomorphisms commute with extraction.

Prove that for every commutative ring K, t>0 and f∈K⟦X⟧, U_t f=`PowerSeries.cartier t 0 f`. Prove that for the same K and t and every natural a, E_(t,a)f=`PowerSeries.cartier t a f`. Transport the ring coefficient, linearity and pullout laws through these comparisons, including coefficients in ℤ; the pullout law uses a=0<t. The semiring extension retains its coefficient proof (PadicMeasuresIwasawaAlgebras §2.9, `coeff_cartier`, `cartier_expand_mul`).

Prove that for every field K, t>0 and f∈K⟦X⟧, its Laurent-series embedding satisfies ι(U_t f)=`LaurentSeries.cartier t 0`(ι f). For 0≤a<t, identify ι(E_(t,a)f) with `LaurentSeries.cartier t a`(ι f) by `cartier_ofPowerSeries` (ClassicalArithmeticCompletion §2.10, `coeff_cartier`, `cartier_ofPowerSeries`). The integral eta-module estimates remain in §4.8a.

Extend the coefficient function to t=0 by (U₀f)_n=f₀ for every n; this differs from Cartier’s stipulated zero value at modulus zero. Prove U_t(f+c·g)=U_t(f)+c·U_t(g) over every commutative semiring. Its coefficient function and its bundled linear map are identified by the same formula. Over every commutative semiring, express f(X^t) as `PowerSeries.mk (fun n => if t ∣ n then PowerSeries.coeff (n / t) f else 0)`. Over a commutative ring this agrees with `PowerSeries.expand t ht f` by `PowerSeries.coeff_expand` in `Mathlib/RingTheory/PowerSeries/Expand.lean`; the pinned expansion API itself requires a commutative ring.

For the proof, compare native power-series coefficients with the supplied ring Cartier map and transport its laws. Over semirings, extensionality and the finite Cauchy coefficient formula prove the extension; the pullout identity uses that f(X^t) is supported on multiples of t.

*Needs:* Mathlib `Nat.Partition.genFun`; §3.5; TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §2.9; TauCetiRoadmap.ClassicalArithmeticCompletion §2.10.

**Checks.**

- decimation monomial: U₂(1+X+2X²)=1+2X.
- decimation identity: U₁=id and E_(1,0)=id.
- Over ℤ, U₂(X)=0 but U₂(X²)=X≠0, so U₂ is not a ring homomorphism.
- zero-index extraction: Over ℤ, coefficient 1 of U₀(1) is 1, whereas cartier 0 0(ι1)=0 by its stipulated value. The Cartier comparison and pullout formula retain t>0.
- Power-series shift beyond a residue: Over ℤ, E_(1,1)(X)=`PowerSeries.cartier 1 1 X`=1, whereas X·E_(1,1)(1)=0; the all-natural-shift comparison does not extend the pullout law beyond a<t.
- Cartier shift boundary: For t=2,a=1, E_(2,1)(X)=1 and cartier 2 1(ιX)=1. For a=t and f=1, the Laurent output is X⁻¹ whereas E_(t,t)(1)=0; the comparison must retain a<t.

### 4.8 alternating eta decimation

Prove alternating eta decimation with the following hypotheses. For ℓ∈{5,7,11} put m=(ℓ²−1)/24, φℓ=X^m P̂₊(1;X^(ℓ²))/P̂₊(1;X), L₀=1, L_(2a+1)=U_ℓ(φℓ L_(2a)), and L_(2a+2)=U_ℓ L_(2a+1). For every r≥1, L_r=X·P̂₊(1;X^ℓ)·Fℓ,r for odd r, and L_r=X·P̂₊(1;X)·Fℓ,r for even r. The analytic φℓ equals η(ℓ²τ)/η(τ). All Euler-tail products in these quotients have constant coefficient 1 and are units; φℓ has leading term X^m. The identities hold over ℤ and after scalar change. (Atkin1967, §4.1, equations (29)–(33) and Lemma 10, p. 23, lines 375–410; Watson1938 §§1–4; Atkin1967 line 375.)

The public laws are:

- The two displayed parity identities.
- Each extraction shifts the residue to the bounded inverse of 24 at the next power.

For the proof, apply the pullout identity from 4.7 and ΠP=1, alternating the two Euler factors. At each step solve the linear residue equation to obtain δ(ℓ,r); for these three ℓ the resulting shift is exactly X. The eta ratio follows directly from its native product. This target is formal and does not depend on the analytic eta multiplier of Layer 5.

*Needs:* §4.6; §4.7; §1.4; Mathlib `ModularForm.eta`.

**Checks.**

- eta decimation first: For ℓ=11, φ starts X⁵ and U₁₁φ starts p(6)X=11X.
- eta decimation second: For ℓ=5 the first two offsets are 4 and 24; their Euler factors are P(X⁵) and P(X).

### 4.8a integral eta-decimation modules

Prove the degree-five eta equation and the degree-seven eta equation. For τ∈ℍ and ℓ=5 or 7 set X=η(τ)/η(τ/ℓ) and Y=η(ℓτ)/η(τ). Every denominator is nonzero by `ModularForm.eta_ne_zero`. For ℓ=5 prove X⁵−25Y⁵X⁴−25Y⁴X³−15Y³X²−5Y²X−Y=0. For ℓ=7 prove X⁷−(343Y⁷+49Y³)X⁶−(343Y⁶+35Y²)X⁵−(147Y⁵+7Y)X⁴−49Y⁴X³−21Y³X²−7Y²X−Y=0. Prove the identities from the theta-product identities and finite product calculus before taking their Newton sums (Watson1938 §2, pp. 102–103, and (3.2), p. 105, Watson1938 line 417; §4, pp. 111–117, and (5.2), p. 118, Watson1938 line 1127).

Prove integral eta-decimation modules with the following hypotheses. Construct the following integral modules with finite supports, independently of partition divisibility. For ℓ=5,7 use x=e(τ), B=xP(x²⁴;x²⁴)=η(24τ), C=x^ℓP(x^(24ℓ);x^(24ℓ))=η(24ℓτ), b_j=Cʲ/B^(j+1), and Ω_ℓ(Σ a_nxⁿ)=Σ a_(ℓn)xⁿ on Laurent series bounded below. Put O₅=span_ℤ{5^(5n)b_(12n+5),5^(5n+2)b_(12n+11)} and E₅=span_ℤ{5^(5n)b_(12n+6),5^(5n+3)b_(12n+12)} for n≥0. Prove Ω₅O₅⊆5E₅, Ω₅E₅⊆5O₅ and Ω₅(B⁻¹)=5b₅. Put E₇=span_ℤ{7^(7n)b_(16n+4),7^(7n+2)b_(16n+8),7^(7n+3)b_(16n+12),7^(7n+5)b_(16n+16)} and O₇=span_ℤ{7^(7n)b_(16n+3),7^(7n+2)b_(16n+7),7^(7n+4)b_(16n+11),7^(7n+6)b_(16n+15)}. Prove Ω₇E₇⊆O₇, Ω₇O₇⊆7E₇, Ω₇(B⁻¹)=7b₃+49b₇ and Ω₇²(B⁻¹)∈49E₇. The first seven-step is separate: Ω₇(B⁻¹)/7 need not lie in O₇. Transport these estimates to §4.8 by L_r(x²⁴)=CΩ_ℓʳ(B⁻¹) for odd r and BΩ_ℓʳ(B⁻¹) for even r. All b_j used have integral Laurent expansions since the Euler tails are units; their eta weights and multipliers are retained. For ℓ=11 use the modular-function basis below, rather than an eta-power basis on the genus-one curve. (Watson1938, §3 (3.2), (3.21)–(3.23), (3.41)–(3.44), pp. 105–110, lines 409–698; §5 (5.2), (5.21)–(5.23), (5.41)–(5.42), pp. 118–122, lines 1081–1390; Atkin1967 Lemmas 3–8, 11–14 and Appendix A, lines 95–121, 232–247, 414–484, 514–565.)

Prove after coefficient embedding ℤ⸨x⸩→ℚ⸨x⸩, Ω_ℓ agrees with `LaurentSeries.cartier ℓ 0` for every ℓ>0. Integrality is a property of the displayed eta modules and their coefficient embeddings; the rational Cartier comparison transports the field extraction laws (ClassicalArithmeticCompletion §2.10, `coeff_cartier`).

For the level-11 module, let G₂,G₃ be functions on Γ₀(11), holomorphic on ℍ, with only a pole at infinity, vanishing at cusp 0, and principal parts q⁻²+2q⁻¹ and q⁻³−3q⁻²−5q⁻¹ respectively. Existence and uniqueness are part of the integral basis theorem. Set G₄=G₂²−11G₃, G₅=(η(τ)/η(11τ))¹², G₆=G₂G₄, and G_(n+5)=G_nG₅ for n≥2. For n=5a+r, r=2,3,4,5,6, put θ(n)=6a+(2,3,4,6,6)_r and g_n=11^(−θ(n))G_n(−1/(11τ)). Set ξ(2)=0, ξ(3)=1 and ξ(5a+r)=5a+(1,3,3,4,5)_r for r=4,5,6,7,8; set ε(2)=0, ε(3)=1 and ε(n)=ξ(n)+1 for n≥4. Define X₁₁=span_ℤ{11^ξ(n)g_n:n≥2}, Y₁₁=span_ℤ{11^ε(n)g_n:n≥2}. Prove integral Fourier embeddings, U₁₁X₁₁⊆11Y₁₁, U₁₁(φ₁₁Y₁₁)⊆11X₁₁ and U₁₁φ₁₁∈11X₁₁. These are Atkin1967 Lemmas 3, 7, 13 and the base step at lines 481–484; Lemmas 8, 14 retain the unit leading-coordinate refinement. The basis has distinct orders at infinity 5a+(1,2,3,5,4)_r for r=2,3,4,5,6, so its finite expansions are unique.

The level-11 modular-function inputs are proved here before the coefficient bounds. Let S be the space of Γ₀(11)-invariant functions holomorphic on ℍ and meromorphic at both cusps, and U₁₁F(τ)=(1/11)Σ_(0≤j<11)F((τ+j)/11). Prove meromorphic U₁₁-stability: U₁₁ maps S to S and preserves vanishing at infinity. Prove the Fricke principal-part identity 11(U₁₁F)(−1/(11τ))−11(U₁₁F)(11τ)=F(−1/(121τ))−F(τ) for F∈S, equivalently that F(−1/(11τ))+11U₁₁F is SL₂(ℤ)-invariant; for F vanishing at infinity it fixes the principal part of U₁₁F at the cusp 0. For F∈S vanishing at infinity, and for F=1, prove that U₁₁(φ₁₁F) lies in S and vanishes at infinity, and that its principal part at the cusp 0 in the local variable e(−1/(11τ)) has the coefficients of the principal part of 11⁻²φ₁₁(τ)F(−1/(121τ)) in e(τ). Let S^∞⊂S and S⁰⊂S be the subspaces of functions vanishing at infinity and at the cusp 0 respectively; G_n∈S⁰ with leading term q⁻ⁿ, and g_n∈S^∞ with a pole of order n at the cusp 0 only. Genus one of X₀(11) (index 12, two cusps, no elliptic points) and Riemann–Roch give existence and uniqueness of G₂ and G₃, and existence of a Fricke-invariant B₁₁∈S, B₁₁(−1/(11τ))=B₁₁(τ), with simple poles at both cusps and integral Fourier coefficients beginning q⁻¹; B₁₁ is unique up to an additive constant, normalized here by constant Fourier coefficient 0. Prove the full expansion: every F∈S with pole orders at most N at infinity and at most M at the cusp 0 is uniquely Σ_(2≤r≤N)A_(−r)G_r+A_(−1)B₁₁+A₀+Σ_(2≤r≤M)A_r g_r with constant coefficients. Prove the S^∞ expansion: every F∈S^∞ with pole order at most M at the cusp 0 is uniquely Σ_(2≤r≤M)A_r g_r; the gₙ alone span S^∞ and not S, and only this S^∞ theorem is applied to X₁₁ and Y₁₁. (Atkin1967, §2.1, definitions of S, S^∞, S⁰ at lines 45–50, Lemmas 1–5 at lines 54–120, Lemma 9, Lemma 11 and Appendix A; the U-identities are Lehner’s, as quoted there.)

A source locator is Watson1938 line 409.

The public laws are:

- The displayed weighted spans have injective integral Fourier embeddings.
- The displayed inclusions hold on every basis generator, with the separate seven-base steps.
- The displayed parity transport identifies Ω with the alternating U and U∘(φ·) recurrence.
- Meromorphic U₁₁-stability, the Fricke principal-part identity and the φ₁₁-twisted principal-part identity on S.
- The full expansion of S in 1, B₁₁, the G_n and the g_n, and the S^∞ expansion in the g_n alone.

For the proof, use the degree-five eta equation and the degree-seven eta equation at 24τ and the translated ℓth roots to derive the Newton-sum kernels. Their explicit polynomial coefficients give the five- and seven-adic valuation bounds by induction in the Newton recurrence; apply these bounds to every displayed weighted-span generator to prove the module stability inclusions. Handle the first two seven-steps separately. For 11 prove the U₁₁-stability and principal-part identities by coset decomposition of Γ₀(11) in SL₂(ℤ) and the trace to level one, then use the genus-one basis, its cusp principal parts and Atkin’s coefficient bounds, including the exceptional low indices. The formal Cartier law gives neither modularity nor cusp-pole control. Multiply by the parity Euler unit only after the estimates.

*Needs:* §4.7; §4.8; §1.4; §1.6; TauCetiRoadmap.ClassicalArithmeticCompletion §§2.10, 4.40, 4.61; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; TauCetiRoadmap.ModularForms Layer 10A (analytic curve X₀(11), cusp count and genus formula), Layer 10B (Riemann–Roch on the compact curve), Layer 2 (U operator conventions) and Layer 6 (Fricke normalization); the degree-five eta equation; the degree-seven eta equation precede the integral basis theorem and the module stability inclusions.

**Checks.**

- modular equation cusp: With t=e(τ/ℓ), X=t^((ℓ−1)/24)(1+t+terms of degree ≥2) and Y=t^(ℓ(ℓ−1)/24)(1+terms of degree ≥ℓ). Thus X^ℓ and Y have the same leading coefficient 1; using η(ℓτ) in X’s denominator reverses the order and fails.
- modular equation five: X⁵−Y begins 5t^(11/6), canceled by 5Y²X; changing its coefficient or sign fails at the first nonconstant term.
- modular equation seven: X⁷−Y begins 7t^(11/4), canceled by 7YX⁴. Omitting the lower-degree 7Y part of the X⁴ coefficient fails before the 147Y⁵ part contributes.
- eta module seven first: Ω₇(B⁻¹)=7b₃+49b₇; dividing by 7 leaves coefficient 7 of b₇, whereas O₇ requires 49.
- eta module seven sharp: At r=3 the gain remains 49: p(243)≡245 mod 343, so a gain of 7 at every step is false.
- eta module eleven base: L₁ begins 11q because p(6)=11; the first normalized module element is integral and nonzero.
- eleven trace constant: for F=1, F(−1/(11τ))+11U₁₁F=12=[SL₂(ℤ):Γ₀(11)], the level-one trace of 1; dropping the factor 11 gives 2, which is not the trace.
- eleven full expansion: F=1 has coordinate A₀=1 and every other coordinate 0, whereas every finite combination of the gₙ has constant coefficient 0 and every G_n vanishes at the cusp 0; so 1∈S lies outside the span of the gₙ and outside S^∞, and the full expansion needs both families, B₁₁ and the constant.
- eleven Fricke pole: B₁₁ has a simple pole at infinity, and every element of the span of 1, the G_n and the g_n has pole order 0 or at least 2 there; dropping B₁₁ from the full expansion loses every F with a simple pole at infinity, B₁₁ itself included.
- eleven genus: g=1+12/12−0−0−2/2=1, so no element of S has a single simple pole and its only functions with poles of order at most 1 at infinity alone are constants. Hence a function with leading term q⁻², pole only at infinity and zero at 0 is unique, and its q⁻¹ coefficient (2 for G₂) is determined rather than free.

### 4.9 prime-power congruences

Prove `partition_primePowerCongruences` as follows. For all r≥1 and n≥0, 5ʳ∣p(5ʳn+δ(5,r)), 11ʳ∣p(11ʳn+δ(11,r)), and 7^(⌊r/2⌋+1)∣p(7ʳn+δ(7,r)). Equivalently Fℓ,r has every coefficient divisible by the displayed power. (BevilacquaChandranChoi2019, Introduction, p. 1, lines 39–44; Atkin1967 Theorem 2, p. 14, line 28; BevilacquaChandranChoi2019 line 39.)

The public laws are:

- The two exponent-r divisibilities.
- The exponent ⌊r/2⌋+1 divisibility.

For the proof, use the coefficient-extraction recurrences and the explicit integral modules of §4.8a; induction gives divisibility of Fℓ,r, and its coefficient formula gives the result. No stronger claim for powers of 7 is inferred.

*Needs:* §4.8; §4.8a.

**Checks.**

- prime power base: r=1 recovers the three congruences of 4.5.
- r=3 gives 49∣p(243); replacing 49 by 343 is false.

### Examples

At size 4 both rank and crank give one partition in each class modulo 5. At size 1 the crank series has coefficient z⁻¹ and its vector-partition product has z+z⁻¹−1. At exponent 3 the power of 7 is 49.

### Dependencies

Mathlib `Nat.Partition.genFun`; Mathlib `Nat.Partition.conjugate_conjugate`; §3.5; §1.6; §2.4; §4.4a; §1.4; Mathlib `ModularForm.eta`; §4.8a; §4.7; §4.8; TauCetiRoadmap.PadicMeasuresIwasawaAlgebras §2.9; TauCetiRoadmap.ClassicalArithmeticCompletion §§2.10, 4.40, 4.61; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

## Layer 5: theta normalizations, error kernels and completed Lerch sums

### 5.1 the odd theta normalization

Define the odd theta normalization (`zwegersOddTheta`) as follows. For τ∈ℍ and z∈ℂ set ϑ(z;τ)=Σ_(ν∈1/2+ℤ)exp(πiν²τ+2πiν(z+1/2)). Use the identity ϑ=i·exp(πiτ/4+πiz)·jacobiTheta₂(z+(τ+1)/2,τ). Its series and all needed derivatives converge locally uniformly; it is entire in z, has simple zeros exactly at Λτ=ℤτ+ℤ, and obeys ϑ(z+1)=−ϑ(z), ϑ(z+τ)=−exp(−πiτ−2πiz)ϑ(z), ϑ(−z)=−ϑ(z). (Zwegers2002, Proposition 1.3, p. 8, lines 336–360; Zwegers2002 line 336.)

The public laws are:

- The displayed comparison with native jacobiTheta₂.
- ϑ(z;τ)=0 iff z∈Λτ.
- ϑ′(0;τ)=−2π·ModularForm.eta(τ)³.
- ϑ(z;τ+1)=exp(πi/4)ϑ(z;τ), and ϑ(z/τ;−1/τ)=−i√(−iτ)exp(πiz²/τ)ϑ(z;τ).

For the proof, reindex the native theta and differentiate its locally uniform series. The imported product gives the zero divisor and derivative at zero. Reindex for elliptic laws and use the pinned theta functional equation for S.

*Needs:* Mathlib `jacobiTheta₂`; Mathlib `hasSum_jacobiTheta₂_term`; Mathlib `jacobiTheta₂_functional_equation`; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

**Checks.**

- The ν=±1/2 pair is i·exp(πiτ/4)(exp(πiz)−exp(−πiz)); using the even native theta without a shift fails.
- odd theta at zero: ϑ(0;τ)=0 and ϑ′(0;τ)≠0.
- odd theta half period: ϑ(1/2;i)≠0, since 1/2∉ℤi+ℤ. At z=1/4 and τ=i its value is approximately −0.643589764; a zero or rescaled theta would fail this normalization.

### 5.2 the eta multiplier

Define the eta multiplier as follows. Using native eta define ν_eta(γ)=η(γτ)/(√(cτ+d)η(τ)) for γ=[[a,b],[c,d]]∈SL₂(ℤ). Transport the eta transformation from ModularForms, Worked examples, target η²⁴=Δ, to this principal-root convention and prove independence of τ. Its S and T specializations are η(τ+1)=exp(πi/12)η(τ) and η(−1/τ)=√(−iτ)η(τ). Retain the metaplectic cocycle: ν_eta is a multiplier system, not an ordinary character of SL₂(ℤ). Its lift is a character on the square-root cover. (Zwegers2002, Theorem 1.11(2), pp. 15–17, lines 734–805; Zwegers2002 line 734.)

The public laws are:

- η(γτ)=ν_eta(γ)√(cτ+d)η(τ).
- The multiplier product includes the ratio of the three square roots.
- On Mp₂(ℤ), the factor η(γτ)/(φ(τ)η(τ)) is a character.

For the proof, specialize the supplied eta transformation to S and T with the chosen roots. Eta nonvanishing makes the quotient well-defined; the root-preserving cover comparison identifies its cocycle. Compose the supplied transformation laws and use the cover multiplication to prove the lifted character law.

*Needs:* TauCetiRoadmap.ModularForms, Worked examples, target η²⁴=Δ; Mathlib `ModularForm.eta_ne_zero`; `gap:classical-metaplectic-model`.

**Checks.**

- eta multiplier t: ν_eta(T)=exp(πi/12).
- eta multiplier s: ν_eta(S)=exp(−πi/4), with √τ; at τ=i its eta transformation factor is 1.
- eta multiplier identity: ν_eta(1)=1; replacing a lift φ by −φ changes the lifted multiplier’s sign.

### 5.3 the error-function smoothing kernel

Define the complex error-function smoothing kernel as follows. Define E(w)=2∫₀ʷexp(−πt²)dt by its entire primitive. For real t≥0 define β(t)=∫_t^∞u^(−1/2)exp(−πu)du. Prove that for real x, E(x)=`TauCeti.Real.erf`(√π·x), and β(t)=`TauCeti.Real.erfc`(√(πt)), including t=0. Transport the real zero, oddness, derivative and range laws through these adapters. Prove the complex extension is odd, E′(w)=2exp(−πw²), and E(x)=sgn(x)(1−β(x²)) for real x, with sgn(0)=0. Supply the additional Gaussian upper bounds for β and every derivative used in the completion series. (Zwegers2002, Definition 1.6 and Lemma 1.7, p. 11, lines 485–505; Lemma 1.8 proof, lines 532–567; Zwegers2002 line 485.)

The public laws are:

- E(0)=0 and β(0)=1.
- E′(w)=2exp(−πw²).
- E(−w)=−E(w).
- For x>0, 0≤β(x)≤exp(−πx)/(π√x).

For the proof, take the entire primitive of a Gaussian and compare its real restriction by the substitution u=√π·x. Use the pinned erf derivative and value at zero for uniqueness on ℝ; its oddness, positivity and strict upper bound transport directly. Substituting u=v² in the tail integral identifies β with erfc, with the Gaussian half-integral handling t=0. For t>0 bound u^(−1/2) by t^(−1/2); differentiating the Gaussian gives polynomial factors with Gaussian decay.

The holomorphic-weight differential expressions are also defined here, before their use in completion formulas: the antiholomorphic Wirtinger derivative is ∂barτF=(∂xF+i∂yF)/2 and the xi operator is ξ_kF=2iy^k conj(∂barτF), for real k and differentiable complex functions on ℍ. Use real Fréchet derivatives in directions 1 and i to define these expressions on ℂ; identities needing y>0 retain that hypothesis. The modular covariance, Laplacian and harmonic-space results are in §8.2 (BruinierFunke2003, (3.1), (3.3), Proposition 3.2, BruinierFunke2003 line 375).

*Needs:* Tau Ceti `TauCeti.Real.erf`, `TauCeti.Real.erfc`, `TauCeti.Real.erf_zero`, `TauCeti.Real.erfc_zero`, `TauCeti.Real.erf_neg`, `TauCeti.Real.hasDerivAt_erf`, `TauCeti.Real.erf_pos`, `TauCeti.Real.erf_lt_one`; TauCetiRoadmap.ThetaSeries Layer 1; TauCetiRoadmap.ContourIntegration Layer 3.

**Checks.**

- error at zero: E(0)=0 and β(0)=1; assigning β(0)=0 fails.
- error derivative: E′(0)=2; the probability-normalized erf has a different derivative.
- error sign: For x>0, 0<E(x)<1 and E(−x)<0; a sign kernel alone is not the smoothing.
- Wirtinger constant: ∂barτc=0; retaining the value c instead of its derivative fails for c=1.
- Wirtinger coordinate: ∂barτy=i/2, whereas ∂barττ=0; changing +i to −i reverses the coordinate value.
- ξ_k(c)=0 for every constant c and every real k, while ξ₀(y)=1.
- xi weight one: On y>0, ξ₁(log y)=1 while ξ₁(1)=0; substituting y⁰ for the logarithmic correction would give zero shadow.
- xi imaginary scalar: ξ₀(i y)=−i; a complex-linear xi fails.

### 5.4 the Mordell integral

Define the Mordell integral as follows. For τ∈ℍ and z∈ℂ define h(z;τ)=∫_ℝ exp(πiτx²−2πzx)/cosh(πx) dx. It is absolutely integrable, entire in z, even, and the unique entire solution of h(z)+h(z+1)=2exp(πi(z+1/2)²/τ)/√(−iτ) and h(z)+exp(−2πiz−πiτ)h(z+τ)=2exp(−πiz−πiτ/4). Also h(z/τ;−1/τ)=√(−iτ)exp(−πiz²/τ)h(z;τ). (Zwegers2002, Definition 1.1 and Proposition 1.2, pp. 6–7, lines 217–320; Zwegers2002 line 217.)

The public laws are:

- h(−z;τ)=h(z;τ).
- The two displayed inhomogeneous difference equations.
- An entire function satisfying both equations equals h.
- The displayed S-law.

For the proof, gaussian bounds on compact parameter sets justify integrability and differentiation. Integrate around a rectangle shifted by i; the pole at i/2 supplies the second equation and the vertical edges vanish. The first equation is the Gaussian integral. The difference of two solutions is bounded on translated fundamental parallelograms and tends to zero, hence vanishes by Liouville. Apply uniqueness for S.

*Needs:* §5.3; TauCetiRoadmap.ThetaSeries Layer 1; TauCetiRoadmap.ContourIntegration Layers 2–3.

**Checks.**

- mordell half: h(1/2;i)=h(−1/2;i)=1, by evenness and the first shift equation.
- mordell nonzero: h(0;i)>0; a zero function cannot satisfy the shifts.
- mordell even: Changing z to −z is substitution x↦−x, with no additional sign.

### 5.5 Zwegers’ nonholomorphic correction

Define Zwegers’ nonholomorphic correction (`zwegersR`) as follows. For τ=x+iy∈ℍ, u∈ℂ and a=Im(u)/y, define R(u;τ)=Σ_(ν∈1/2+ℤ)[sgn(ν)−E((ν+a)√(2y))](−1)^(ν−1/2)exp(−πiν²τ−2πiνu). The series and its differentiated series converge locally uniformly; R is real analytic. Prove R(u+1)=−R(u), R(−u)=R(u), and R(u)+exp(−2πiu−πiτ)R(u+τ)=2exp(−πiu−πiτ/4). Its T-factor is exp(−πi/4), and R(u;τ)+exp(πiu²/τ)R(u/τ;−1/τ)/√(−iτ)=h(u;τ). (Zwegers2002, Lemma 1.8 and Propositions 1.9–1.10, pp. 12–15, lines 506–730; Zwegers2002 line 506.)

The public laws are:

- The displayed series with local uniform derivative estimates.
- ∂bar_u R=√(2/y)exp(−2πa²y)conj(ϑ(u;τ)).
- The three displayed elliptic identities.
- The displayed T- and S-laws.

For the proof, split the coefficient into a finite sign difference and the β-tail. Gaussian estimates bound all derivatives on compact sets. Reindex by one for the inhomogeneous elliptic term. Differentiate to obtain ∂bar_u R, and compare the S-defect with the uniquely characterized entire Mordell integral. Uniform convergence alone is not used as a substitute for derivative estimates.

*Needs:* §5.1; §5.3; §5.4.

**Checks.**

- r half integer pair: At u=0, the ν=±1/2 pair equals 2[1−E(√(y/2))]exp(−πiτ/4); R is even, not odd.
- r unit shift: The pair and the full series change sign under u↦u+1.
- r boundary: At y=0 the definition is outside its domain; totalized division cannot extend it.

### 5.6 the meromorphic Lerch function

Define the meromorphic Lerch function (`zwegersMu`) as follows. For τ∈ℍ and u,v∉Λτ define μ(u,v;τ)=exp(πiu)/ϑ(v;τ)·Σ_(n∈ℤ)(−1)^n exp(πi(n²+n)τ+2πinv)/(1−exp(2πi(nτ+u))). The series converges normally off the polar divisors and is meromorphic in (u,v). In u it has simple poles at Λτ, with residue −1/(2πiϑ(v;τ)) at zero. It is symmetric in u,v, is invariant under (u,v)↦(−u,−v), negates under either unit shift, and satisfies μ(u,v)+exp(−2πi(u−v)−πiτ)μ(u+τ,v)=−i exp(−πi(u−v)−πiτ/4). (Zwegers2002, Propositions 1.4–1.5, pp. 8–11, lines 362–483; Zwegers2002 line 362.)

The public laws are:

- The displayed residue and its translates.
- μ(u,v)=μ(v,u).
- μ(u,v)+exp(πi(u−v)²/τ)μ(u/τ,v/τ;−1/τ)/√(−iτ)=h(u−v;τ)/(2i).
- With q=e(τ), X=e(u−v), Z=e(v), μ=−i·exp(−πiτ/4+πi(u−v))·m(X,q,Z).

For the proof, use the imported m function through the displayed normalization comparison and the normal bilateral estimates. Reindex to obtain the shifts. The n=0 term computes the residue. The imported Appell–Lerch difference identity yields symmetry and the simultaneous-shift identity. The modular defect is entire after cancellation of residues and satisfies the Mordell difference equations, hence equals h/(2i).

*Needs:* §5.1; §5.4; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

**Checks.**

- mu residue sign: lim_(u→0)uμ(u,v)=−1/(2πiϑ(v)); the sign comes from 1−exp(2πiu).
- mu unit shift: μ(u+1,v)=−μ(u,v); replacing exp(πiu) by exp(2πiu) fails.
- mu pole guard: u=0 is a simple pole when v∉Λτ and is not an allowed evaluation.
- mu phase witness: At τ=i, u=1/3 and v=1/4 the value is approximately −0.894187284i. Replacing exp(πiu) by exp(2πiu) multiplies this value by exp(πi/3), contradicting this normalization and the unit-shift law.

### 5.7 the completed Lerch function

Define the completed Lerch function (`zwegersMuHat`) as follows. On the same pole-free domain set μHat(u,v;τ)=μ(u,v;τ)+(i/2)R(u−v;τ). It is real analytic off its singular divisors, symmetric, and invariant under simultaneous negation. For integers k,l,m,n, μHat(u+kτ+l,v+mτ+n)=(−1)^(k+l+m+n)exp(πi(k−m)²τ+2πi(k−m)(u−v))μHat(u,v). For every determinant-one integral γ, μHat(u/(cτ+d),v/(cτ+d);γτ)=ν_eta(γ)^(−3)√(cτ+d)exp(−πic(u−v)²/(cτ+d))μHat(u,v;τ). (Zwegers2002, Theorem 1.11, pp. 15–17, lines 734–812; Zagier2009 Theorem 2.1, lines 327–339; Zwegers2002 line 734.)

The acceptance test defines `zwegersOddTheta` by the shifted native theta, `zwegersR` by its integer-indexed half-integer series with E(x)=erf(√π·x), `zwegersMu` by its bilateral series, and `zwegersMuHat` by the displayed sum. Both headline laws require Im(τ)>0 and u,v outside Λτ. In `zwegersMuHat_modular`, set w=cτ+d and τ′=(aτ+b)/w; the multiplier is written equivalently as w²(η(τ)/η(τ′))³. Indeed η(τ′)/η(τ)=ν_eta(γ)√w, so w²/(ν_eta(γ)√w)³=ν_eta(γ)⁻³√w. The determinant-one condition and Im(τ)>0 give w≠0 and Im(τ′)>0; eta nonvanishing therefore justifies every quotient. No choice of a square root is needed in this equivalent statement (Zwegers2002, Theorem 1.11(2), Zwegers2002 line 741).

The public laws are:

- `zwegersMuHat_elliptic`: The displayed arbitrary integral joint shift law.
- `zwegersMuHat_modular`: The displayed full modular law.
- lim_(u→0)uμHat=−1/(2πiϑ(v)).
- ϑ_Zagier=−iϑ, μ_Zagier=iμ and μHat_Zagier=iμHat.
- R is identical.
- For u,v,u+w,v+w∉Λτ, μHat(u+w,v+w)−μHat(u,v)=ϑ′(0)ϑ(u+v+w)ϑ(w)/(2πiϑ(u)ϑ(v)ϑ(u+w)ϑ(v+w)).

For the proof, add the proven μ and R identities. Their defects cancel with the stated coefficient. Iterate the four generator elliptic shifts. Prove T and S first, then compose with the eta multiplier and cover relations. The R term depends only on u−v, so the joint difference is the imported meromorphic difference.

*Needs:* §5.2; §5.5; §5.6.

**Checks.**

- completion cancels: In the S-defect the constants h/(2i)+(i/2)h sum to 0; reversing the correction sign fails.
- completion tau shift: μHat(u+τ,v)=−exp(πiτ+2πi(u−v))μHat(u,v).
- completion diagonal shift: Shifting both u and v by τ leaves μHat unchanged.
- normalization comparison: The two ν=±1/2 theta terms give the factor i between the two μ normalizations.
- modular identity and center: At γ=I, w=1 and τ′=τ give multiplier 1. At γ=−I, w=−1 and τ′=τ also give multiplier 1, recovering simultaneous negation; using w instead of w² would incorrectly give −1.
- modular translation: At γ=T, η(τ+1)/η(τ)=exp(πi/12), so the eta-quotient multiplier is exp(−πi/4), agreeing with the completed μ T-law.
- modular inversion: At γ=S and τ=i, w=i and η(−1/i)=η(i), so the eta-quotient multiplier is −1, agreeing with ν_eta(S)⁻³√i=−1. In general w²/√(−iτ)³=−√(−iτ).
- completion sign witness: For τ=i, u=1/3 and v=1/4, μHat is approximately −0.732588891i, and shifting u by 1 gives +0.732588891i. The S-law gives +0.716779363i on both sides; the opposite correction sign gives +0.371192104i and +1.033001448i, which disagree.

### Examples

The two half-integer terms of ϑ are i·exp(πiτ/4)(exp(πiz)−exp(−πiz)). Thus ϑ′(0)=−2πη³. A unit u-shift negates μ and μHat, while shifting u by τ multiplies μHat by −exp(πiτ+2πi(u−v)).

### Dependencies

Mathlib `jacobiTheta₂`; Mathlib `hasSum_jacobiTheta₂_term`; Mathlib `jacobiTheta₂_functional_equation`; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; Mathlib `ModularForm.eta_ne_zero`; `gap:classical-metaplectic-model`; TauCetiRoadmap.ThetaSeries Layer 1; TauCetiRoadmap.ContourIntegration Layer 3; TauCetiRoadmap.ContourIntegration Layers 2–3; Tau Ceti `TauCeti.Real.erf`, `TauCeti.Real.erfc`; TauCetiRoadmap.ModularForms, Worked examples, target η²⁴=Δ.

## Layer 6: unary theta periods and torsion specialization

### 6.1 unary theta characteristics and corrections

Define unary theta characteristics and corrections as follows. For a,b∈ℝ and τ∈ℍ define g(a,b;τ)=Σ_(ν∈a+ℤ)ν exp(πiν²τ+2πiνb). Define C(a,b;τ)=Σ_(ν∈a+ℤ)sgn(ν)β(2ν²y)exp(−πiν²τ−2πiνb), assigning the ν=0 term zero. Both series and their needed derivatives converge locally uniformly. For rational a,b, g is a cusp form of weight 3/2 on the finite-index stabilizer of its characteristics, with multiplier determined by its full shift, S and T laws. (Zwegers2002, Definition 1.14, Proposition 1.15, lines 818–834; Definition 4.1 and Proposition 4.2, lines 3531–3602; Zwegers2002 line 818.)

The public laws are:

- g(a+1,b)=g(a,b), g(a,b+1)=e(a)g(a,b), g(−a,−b)=−g(a,b).
- g(a,b;τ+1)=exp(−πia(a+1))g(a,a+b+1/2;τ).
- g(a,b;−1/τ)=i e(ab)(−iτ)^(3/2)g(b,−a;τ).
- ∂barτ C(a,b;τ)=−i g(a,−b;−conj τ)/√(2y).
- ξ_(1/2) C(a,b)=−√2 g(a,b), and ξ_(1/2)[C(a,b;dτ)]=−√(2d)g(a,b;dτ) for real d>0.
- For 0<a<1, C(a,b)=−i∫_(−conj τ)^(i∞)g(a,−b;z)/√(−i(z+τ))dz.

For the proof, reindex and use the Gaussian Poisson transform for S. Polynomial Gaussian majorants justify derivatives and cusp decay. Differentiate β termwise to obtain ∂barτ and the xi normalization of §5.3; the period is the Gaussian substitution from Theorem 1.16.

*Needs:* §5.1; §5.3; `gap:classical-metaplectic-model`; TauCetiRoadmap.ThetaSeries Layer 1.

**Checks.**

- unary odd zero: g(0,0)=C(0,0)=0.
- unary first term: g(1/6,0) has leading coefficient 1/6 at exponent 1/72 in q=e(τ); it is nonzero.
- unary central sign: g(−a,−b)=−g(a,b), in contrast to the even R(u).

### 6.2 period integrals and characteristic crossings

Prove period integrals and characteristic crossings with the following hypotheses. For τ∈ℍ, −1/2<a<1/2 and b∈ℝ, ∫_(−conj τ)^(i∞)g(a+1/2,b+1/2;z)/√(−i(z+τ))dz=−exp(−πia²τ+2πia(b+1/2))R(aτ−b;τ). If also −1/2<b<1/2, the same integral from 0 to i∞ equals −exp(−πia²τ+2πia(b+1/2))h(aτ−b;τ). Extend to other a,b using the proved inhomogeneous shifts, keeping every crossing term. (Zwegers2002, Theorem 1.16 and Lemmas 1.18–1.19, pp. 18–21, lines 835–1027; Zwegers2002 line 835.)

The public laws are:

- The first displayed equality.
- The second displayed equality.
- Integer characteristic shifts use 5.5.
- At a=±1/2 a finite sign-change term must be added.

For the proof, expand the absolutely convergent unary series along the vertical ray, substitute a Gaussian integral, and compare its β-terms with 5.5. In the h formula use the contour-shift Gaussian identity for nonzero real r in Lemma 1.18; isolate r=0 before any division. Tail bounds justify all integral/sum interchanges.

*Needs:* §5.4; §5.5; §6.1; TauCetiRoadmap.ContourIntegration Layers 2–3.

**Checks.**

- period central: At a=b=0 the formula uses g(1/2,1/2), not g(0,0).
- period endpoint guard: a=1/2 is outside the unshifted formula; the ν=−1/2 sign difference no longer vanishes.

### 6.3 torsion Lerch completions

Construct torsion Lerch completions as follows. For rational α,β,γ,δ with (α,β) and (γ,δ) nonzero modulo ℤ², put u=ατ+β, v=γτ+δ and d=α−γ, e₀=β−δ. Set H=exp(−πid²τ)μHat(u,v;τ). Its finite characteristic orbit gives scalar multiplier laws on the stabilizer and a finite-dimensional vector law on the whole metaplectic group, all cusps included. Write the matrix as g=[[a,b],[c,dγ]] to distinguish its entry dγ from the characteristic difference d. On the stabilizer write (α,β)g=(α+k,β+l), (γ,δ)g=(γ+m,δ+n). The exact scalar factor is ν_eta(g)⁻³√(cτ+dγ)(−1)^(k+l+m+n) exp(πiC_g), where C_g=−d²(gτ−τ)−c((d+k−m)τ+e₀+l−n)²/(cτ+dγ)+(k−m)²τ+2(k−m)(dτ+e₀), proved independent of τ. For a matrix entry from a characteristic tuple A to its reduced image B, define integers k,l,m,n by (α_A,β_A)g=(α_B+k,β_B+l) and (γ_A,δ_A)g=(γ_B+m,δ_B+n). Write the unreduced transformed differences as d′τ+e′, the B-differences as d_Bτ+e_B, K=d′−d_B and L=e′−e_B. The entry is ν_eta(g)⁻³(−1)^(k+l+m+n)exp(πi[−d_A²(gτ)−c(d′τ+e′)²/(cτ+dγ)+K²τ+2K(d_Bτ+e_B)+d_B²τ]); it is zero off the characteristic permutation. The exponential is independent of τ, and the common factor √(cτ+dγ) is outside the matrix. Its nonholomorphic part and xi-image are finite unary-theta combinations from 6.1–6.2. (Zwegers2002, Theorem 1.11, lines 734–805; Theorem 1.16, lines 835–849; Zagier2009 lines 340–347; Zwegers2002 line 734.)

The public laws are:

- The displayed explicit scalar factor on the characteristic stabilizer.
- Between characteristic representatives the matrix entry is the displayed phase if they are related and zero otherwise.
- Transport by each cusp representative gives the corresponding Fourier and growth expansion.
- The xi-image is obtained by the explicit derivative of R, with the Gaussian prefactor retained.

For the proof, apply the modular law with u′,v′ given by right multiplication of characteristics by g, followed by the joint elliptic law. Expand the exponent; its τ derivative is zero using adγ−bc=1. The orbit is finite because all denominators divide a fixed integer; its principal congruence kernel has finite index. Use the shifted period formula and Gaussian estimates at each cusp. Normal convergence permits removable limits only after the Laurent principal parts cancel.

*Needs:* §5.3; §5.7; §6.1; §6.2; `gap:classical-metaplectic-model`.

**Checks.**

- torsion unit period: Replacing β by β+1 changes H by −1.
- torsion pole: (α,β)=(0,0) is inadmissible without a proved cancellation, even if v is nonzero.
- torsion even order: u=1/2 and v=τ/2 are pole-free for every τ∈ℍ; order 2 is included.

### Examples

g₀,₀=0 by ν↦−ν, whereas g₁/₆,₀ begins (1/6)exp(πiτ/36). The open interval restriction on the period formula prevents an omitted ν=±1/2 boundary term.

### Dependencies

§5.1; §5.3; `gap:classical-metaplectic-model`; TauCetiRoadmap.ThetaSeries Layer 1; §5.4; §5.5; TauCetiRoadmap.ContourIntegration Layers 2–3; §5.7.

## Layer 7: signature-(r−1,1) error-function theta series

### 7.1 negative-cone and isotropic-boundary data

Define negative-cone and isotropic-boundary data as follows. Let r≥1 and let A be an integral symmetric nonsingular r×r matrix with exactly one negative eigenvalue. Put Q(x)=xᵀAx/2 and B(x,y)=xᵀAy, and fix c₀ with Q(c₀)<0. A cone datum is either a real c with Q(c)<0 and B(c,c₀)<0, or a primitive integral c with Q(c)=0 and B(c,c₀)<0. Set R(c)=ℝʳ in the first case, and R(c)={a:B(c,a)∉ℤ} in the second. Positive rescaling of negative data and simultaneous integral isometry transport preserve admissibility; primitive boundary representatives are transported as integral vectors. (Zwegers2002, Definition 2.1 and preceding domains, pp. 25–27, lines 1275–1347; Zwegers2002 line 1275.)

The public laws are:

- The negative constructor requires both inequalities.
- The boundary constructor requires primitivity and the nonintegral characteristic condition.
- C∈GLᵣ(ℤ), CᵀAC=A transports c,a and preserves admissibility.
- Membership in R(c) is exactly the displayed case distinction.

For the proof, use the signature to identify the two negative components through B(c,c₀)<0. At a primitive isotropic integral vector, B(c,n) is integral for integral n, so a nonintegral B(c,a) stays uniformly away from zero on a+ℤʳ.

*Needs:* §5.3.

**Checks.**

- cone hyperbolic: For the hyperbolic A, c₀=(1,−1), both (1,0) and (0,−1) are allowed boundary data.
- cone boundary excluded: a=(0,1/2) fails the R((0,−1)) condition; ignoring boundary domains is wrong.
- cone rank one: For A=[−2], the cone c>0 is valid, and there is no nonzero isotropic boundary vector.
- cone opposite: (−1,0) belongs to the opposite boundary component and is rejected.

### 7.2 the ordered indefinite theta kernel

Define the ordered indefinite theta kernel as follows. For ordered cone data c₁,c₂, τ∈ℍ, a∈R(c₁)∩R(c₂), b∈ℝʳ, define ρ_c(ν;τ)=E(B(c,ν)√y/√(−Q(c))) for negative c and sgn(B(c,ν)) for boundary c. Put Θ^(c₁,c₂)_(a,b)=Σ_(ν∈a+ℤʳ)(ρ_c₁−ρ_c₂)(ν;τ)e(Q(ν)τ+B(ν,b)). Also define Θ_A(z;τ)=exp(−2πiQ(a)τ−2πiB(a,b))Θ_(a,b) for z=aτ+b, a,b real. These are analytic sums on the stated domain, not uncompleted divergent lattice series. (Zwegers2002, Definition 2.1, pp. 26–27, lines 1311–1347; Zwegers2002 line 1311.)

The public laws are:

- Θ^(c₂,c₁)=−Θ^(c₁,c₂).
- Positive scaling of negative cone data leaves Θ unchanged.
- Θ^(Cc₁,Cc₂)_(Ca,Cb)=Θ^(c₁,c₂)_(a,b) for an integral isometry preserving the component.
- The displayed z-adapter agrees with the characteristic sum.

For the proof, define the native sum of the displayed kernel. Reindexing and pointwise equality give the scale, swap and isometry laws. The convergence and additive cocycle laws are proved in 7.3 before any such regrouping is used.

*Needs:* §7.1; §5.3.

**Checks.**

- theta equal cone: If c₁=c₂ the series is identically zero, including rank one.
- theta boundary term: In the hyperbolic example the ν=(1/2,1/2) summand is 2e(τ/4), whereas the mixed-sign ν=(1/2,−1/2) summand is zero.
- theta no unweighted: For A=diag(1,−1), the unweighted sum has terms exp(2πy n²/2) on the negative axis and diverges.

### 7.3 convergence through the isotropic boundary

Prove convergence through the isotropic boundary with the following hypotheses. The series in 7.2 is absolutely convergent on its full domain, including either or both primitive isotropic boundary data. On compact subsets staying inside that domain it has a summable majorant for the derivatives needed in τ and negative cone variables. For Q(c)<0 the form Q_c(ν)=Q(ν)−B(c,ν)²/(2Q(c)) is positive definite. For independent c₁,c₂ with Q(c₁)<0 and Q(c₂)<0 in the chosen component, Q⁺=Q+B(c₁,c₂)B(c₁,·)B(c₂,·)/(4Q(c₁)Q(c₂)−B(c₁,c₂)²) is positive definite. Boundary limits from negative vectors hold locally on the admissible characteristic domain. (Zwegers2002, Proposition 2.4, Lemmas 2.5–2.6, pp. 27–32, lines 1351–1632; Proposition 2.7(5), boundary limits; Zwegers2002 line 1351.)

The public laws are:

- Absolute convergence on the stated full domain.
- The β-correction is bounded by exp(−2πyQ_c(ν)).
- A negative vector tending to an allowed isotropic boundary vector yields the sign-kernel series.
- Θ^(c₁,c₃)=Θ^(c₁,c₂)+Θ^(c₂,c₃) on the common domain.

For the proof, split E into its sign term minus its β-tail. Positive definiteness of Q_c gives the Gaussian bound for each negative correction. For two negative vectors the sign difference is supported between the two hyperplanes; apply Q⁺ on that region. For a pair of boundary vectors first insert an auxiliary negative vector and use the pointwise kernel cocycle, reducing to mixed pairs. In each mixed pair, the characteristic’s nonintegral pairing supplies a positive separation and exponential decay along the boundary direction. This gives a summable majorant and dominated boundary limits. Equal rays are treated separately.

*Needs:* §7.1; §7.2; §5.3; TauCetiRoadmap.ThetaSeries Layers 1–3.

**Checks.**

- indefinite dependent: Dependent cone vectors in the same ray give zero kernel and do not use the Q⁺ denominator.
- indefinite no gaussian boundary: Along a hyperbolic boundary ray with one coordinate fixed, Q grows linearly; a uniform Gaussian in the full Euclidean norm is not claimed.
- indefinite boundary auxiliary: For A=[[0,1],[1,0]], c₁=(1,0), c₂=(0,−1), the displayed Q⁺ is identically zero. Its positive-definiteness theorem requires two negative vectors; boundary convergence uses a separate argument.

### 7.4 characteristic transformation laws

Prove characteristic transformation laws with the following hypotheses. For λ∈ℤʳ and μ∈A⁻¹ℤʳ, Θ_(a+λ,b)=Θ_(a,b), Θ_(a,b+μ)=e(B(a,μ))Θ_(a,b), and Θ_(−a,−b)=−Θ_(a,b). Write v=A⁻¹diag(A). Then Θ_(a,b)(τ+1)=exp(−2πiQ(a)−πiB(v,a))Θ_(a,a+b+v/2)(τ). If both a and b belong to R(c₁)∩R(c₂), Θ_(a,b)(−1/τ)=i(−iτ)^(r/2)e(B(a,b))/√(−det A)·Σ_(p∈A⁻¹ℤʳ/ℤʳ)Θ_(b+p,−a)(τ). These laws retain the diagonal correction for odd A. (Zwegers2002, Proposition 2.7 and Corollary 2.9, pp. 32–42, especially lines 2308–2317; Zwegers2002 line 2308.)

The public laws are:

- The diagonal-corrected T-law.
- The displayed finite-discriminant S-law.
- The two shift laws and oddness.
- For even A, compare the finite transform with the conjugate/dual convention of MetaplecticAutomorphicForms §4.7.

For the proof, reindex for shifts and use nᵀAn≡diag(A)·n modulo 2 for T. For two negative cone vectors, express the kernel as an integral along a cone path; apply lattice Poisson to the resulting Schwartz Gaussian and then the finite-dual-lattice decomposition. The signature contributes i/√(−det A). Pass to boundary data by 7.3. No finite quadratic form on an odd lattice is assumed.

*Needs:* §7.3; TauCetiRoadmap.ThetaSeries Layer 1.

**Checks.**

- indefinite determinant: For the hyperbolic A, det A=−1 and r=2, the S-prefactor i(−iτ)/√1 equals τ.
- indefinite odd diagonal: A=diag(1,−1) gives v=(1,1), so its half-diagonal characteristic shift cannot be dropped.
- indefinite s domain: With a admissible and b on a boundary hyperplane, the stated S-law is unavailable.

### 7.5 finite orthogonal factorization of corrections

Prove finite orthogonal factorization of corrections with the following hypotheses. For any integral c with Q(c)<0, split a+ℤʳ into cosets μ₀+ξ+nc, where ξ∈c⊥∩ℤʳ and 0≤B(c,μ₀)/(2Q(c))<1. There are finitely many representatives μ₀ modulo ℤc+(c⊥∩ℤʳ). The signed β-correction Σ_(ν∈a+ℤʳ)sgn(B(c,ν))β(B(c,ν)²y/(−Q(c)))e(Q(ν)τ+B(ν,b)) equals −Σ_(μ₀)C(B(c,μ₀)/(2Q(c)),−B(c,b);−2Q(c)τ)·Σ_(ξ∈μ₀⊥+(c⊥∩ℤʳ))e(Q(ξ)τ+B(ξ,b⊥)), where w⊥=w−B(c,w)c/(2Q(c)). The result is independent of the chosen representatives. Zwegers states the proposition for primitive c; the finite-index decomposition and orthogonal regrouping below need only Q(c)≠0, and correction nonprimitive witnesses the nonprimitive case. (Zwegers2002, Proposition 4.3, pp. 66–67, lines 3603–3693; Zwegers2002 line 3603.)

The public laws are:

- The displayed finite factorization.
- Changing coset representatives reindexes the products.
- In rank two the positive factor is a unary positive-definite theta series.

For the proof, the sublattice ℤc+(c⊥∩ℤʳ) has finite index since Q(c)≠0. Expand Q and B after the orthogonal decomposition, use absolute convergence to regroup, and identify the negative direction with C. No modularity or harmonicity of the complete product is inferred from this factorization alone.

*Needs:* §6.1; §7.3; TauCetiRoadmap.ThetaSeries Layers 2–3.

**Checks.**

- correction sign: Since B(c,μ₀)=2Q(c)a₀ and Q(c)<0, sgn B(c,μ₀)=−sgn a₀; the leading minus is necessary.
- correction nonprimitive: For A=[−2] and c=2 the sublattice ℤc has index 2, so the factorization has two cosets. At a=1/4,b=0 its negative-direction sum is −C(1/8,0;8τ)−C(5/8,0;8τ); replacing the coset index by that for c=1 fails.
- correction rank one: For A=[−2], c=1, a=1/4 and b=0 the signed β-sum equals −C(1/4,0;2τ); the orthogonal theta factor is 1.

### Examples

For A=[[0,1],[1,0]], choose the cone containing (1,−1). Boundary vectors (1,0) and (0,−1), with a=(1/2,1/2), give kernel 2 at ν=(1/2,1/2) and 0 at ν=(1/2,−1/2). Reversing the ordered cone pair reverses the theta series.

### Dependencies

§5.3; TauCetiRoadmap.ThetaSeries Layers 1–3; TauCetiRoadmap.ThetaSeries Layer 1; §6.1; TauCetiRoadmap.ThetaSeries Layers 2–3.

## Layer 8: harmonic weak Maass spaces, Fourier parts and shadows

### 8.1 real-analytic modular spaces

Define real-analytic modular spaces as follows. For a finite-index subgroup Γ of Mp₂(ℤ), a finite-dimensional complex representation ρ and k∈(1/2)ℤ, define the space A_k(Γ,ρ) of real-analytic functions F:ℍ→V with F(γτ)=φγ(τ)^(2k)ρ(γ)F(τ). Define exponential cusp growth by requiring each normalized slash F|_k δ to be O(exp(Cy)), uniformly over a cusp period, for every rational cusp δ∞. For arbitrary ρ the cusp slash is φδ(τ)^(−2k)F(δτ), with the representation transported to δ⁻¹Γδ; it does not evaluate ρ on δ outside its domain. When ρ extends to Mp₂(ℤ), applying the additional constant factor ρ(δ)⁻¹ gives an equivalent growth condition. Define weakly holomorphic, holomorphic and cusp subspaces by holomorphy on ℍ and finite principal parts, nonnegative exponents and vanishing constant terms in the corresponding cusp expansions. Scalar multiplier spaces are the one-dimensional instances; conjugate representations are always allowed and duals are identified only with an invariant Hermitian form. (BruinierFunke2003, §3, pp. 8–10, lines 366–374 and 461–470; Zagier2009 §5, lines 640–677; BruinierFunke2003 line 366.)

The public laws are:

- Equality of the underlying functions is equality in each bundled space.
- Each space is a complex vector space.
- Restriction to a finite-index subgroup preserves automorphy and cusp conditions.
- For integral k, trivial compatible multiplier and bounded holomorphic cusps, recover the native ModularForm; vanishing gives CuspForm.

For the proof, use the imported cover and native representations; define subspaces by the explicit equations. Compare the integral scalar slash with ModularForms Layer 0. For a holomorphic cusp slash f, choose w and A as in §8.4a and use the ordinary Laurent expansion of the periodic holomorphic function exp(−2πiAτ/w)f(τ). Jordan blocks produce polynomial τ-factors. Finite principal parts allow finitely many negative real exponents; holomorphic cusp data have none and are bounded at real exponent zero, while cusp data tend to zero. This local Laurent construction needs no harmonic-space theorem. Section 8.4a constructs the harmonic splitting on these carriers.

*Needs:* `gap:classical-metaplectic-model`; TauCetiRoadmap.ModularForms Layer 0; TauCetiRoadmap.MetaplecticAutomorphicForms §§4.7, 7.1, 7.49.

**Checks.**

- automorphic zero: Zero belongs to every specified space, including incompatible central characters.
- automorphic constant: For k=0, trivial representation and full group, constant 1 is holomorphic but not cuspidal.
- automorphic central: For full SL₂(ℤ) with trivial scalar multiplier and odd integral k, a nonzero constant fails the −I equation.
- automorphic cusp representation domain: For Γ=Γ₀(2) and the cusp represented by S, an arbitrary representation of Γ need not have a value ρ(S). The weight-only slash and transported subgroup representation remain defined.

### 8.2 holomorphic-weight differential operators

Define holomorphic-weight differential operators as follows. For C² functions on ℍ put ∂τ=(∂x−i∂y)/2, R_k=2i∂τ+k/y and L_k=−2iy²∂barτ, using ∂barτ and ξ_k from §5.3 and the weight-k Laplacian Δ_k of AutomorphicSpectralTheory §1.16. Prove covariance R:A_k→A_(k+2), L:A_k→A_(k−2), ξ:A_k(ρ)→A_(2−k)(barρ), and Δ_k=−R_(k−2)L_k=−L_(k+2)R_k−k=−ξ_(2−k)ξ_k. In the unitary normalization Δ_unit,k=y^(k/2)Δ_k y^(−k/2)+(k/2)(1−k/2). (BruinierFunke2003, (3.1), (3.3), Proposition 3.2, lines 375–480; MetaplecticAutomorphicForms §7.49 supplies the weight-1/2 normalization comparison; BruinierFunke2003 line 375.)

The public laws are:

- The displayed weight shifts and conjugate-representation law.
- The three displayed factorizations of Δ.
- ξ_k(cF)=conj(c)ξ_k(F).
- At k=1, Δ₁(log y)=0.

Express the supplied Laplacian using native real Fréchet derivatives and prove its xi factorization for C² functions on Im(τ)>0, as well as the displayed raising/lowering factorizations. Prove that complex differentiability implies ∂barτF=0. The new operator identities allow every real weight k; the modular carriers specialize this to half-integral weights.

For the proof, expand the real partial derivatives and use the chain rule for Möbius maps and their square-root factors. Mixed derivatives commute by C². The displayed y-power computation fixes all signs. Unitarity identifies conjugation with the dual Weil module, rather than making that identification for arbitrary ρ.

*Needs:* §5.3; §8.1; TauCetiRoadmap.AutomorphicSpectralTheory §1.16; TauCetiRoadmap.MetaplecticAutomorphicForms §7.49.

**Checks.**

- Raising and lowering: R₀(y)=1 and L₀(y)=y². Changing the sign in either 2i coefficient fails this two-term calculation.
- Xi factorization: ξ₀(y)=1 and ξ₂(1)=0, so −ξ₂ξ₀(y)=0. At weight one, ξ₁(log y)=1 and ξ₁(1)=0, retaining the logarithmic second zero mode.
- Unitary half weight: at k=1/2, the additive conjugation constant is 3/16, with the supplied unitary normalization.

### 8.3 harmonic weak Maass spaces

Define harmonic weak Maass spaces as follows. Define H_k(Γ,ρ) as the C² functions obeying 8.1’s modular equation and at most exponential growth at every cusp, killed by 8.2’s Δ_k. Define H_k⁺ as the inverse image of cusp forms under ξ_k. Use C² as the construction predicate; prove real analyticity from analytic elliptic regularity. Weakly holomorphic forms embed in H_k, and H_k⁺ is specified by its actual shadow, not by a cusp bound at infinity alone. (BruinierFunke2003, §3 definition and regularity observation, lines 366–383; H⁺ definition lines 487–501; BruinierFunke2003 line 366.)

The public laws are:

- Equality is equality of functions.
- H is a complex vector space.
- Holomorphicity and finite cusp principal parts imply harmonicity and exponential growth.
- Membership in H⁺ iff ξ_k F is a cusp form.

For the proof, use the native C² calculus and the imported transformation equations. The principal part bounds give exponential growth of holomorphic forms. Apply analytic elliptic regularity to the analytic-coefficient elliptic operator on compact coordinate discs; this analytic, rather than merely smooth, regularity is a separate named supplier gap.

*Needs:* §8.1; §8.2; `gap:analytic-elliptic-regularity`.

**Checks.**

- maass zero: Zero is harmonic at every weight.
- maass constant: Constant 1 at weight 0 is harmonic with zero shadow and is not cuspidal.
- maass growth guard: The local solution y² at weight 0 fails Δ=0 even though it has polynomial growth; growth alone is insufficient.

### 8.4 the branch-fixed scalar Fourier kernel

Construct the branch-fixed scalar Fourier kernel as follows. For real k and real w≠0 define H_k(w)=exp(−w)Γ(1−k,−2w), using the upper-bank branch of the incomplete gamma integral. For w<0 this is the real integral from −2w to ∞. For w>0, integrate exp(−t)t^(−k) from −2w along the upper side of the negative axis, around an upper semicircle avoiding zero, and then along the positive axis to ∞; homotopy makes the value independent of the semicircle radius. Prove H solves b″−b+(k/w)(b′+b)=0 and is independent of exp(−w). At k≠1 the zero modes are 1,y^(1−k); at k=1 they are 1,log y. (BruinierFunke2003, §3, pp. 9–10, lines 395–423; BruinierFunke2003 line 395.)

Prove that for real k<1 and w<0, H_k(w)=exp(−w)·(Real.Gamma(1−k)−`TauCeti.lowerIncompleteGamma`(1−k)(−2w)), coerced to ℂ. Splitting the complete Euler integral at −2w identifies this range with the supplied real incomplete-gamma API; the contour construction retains every real weight and both half-lines (BruinierFunke2003, §3, p. 9, BruinierFunke2003 line 404; pinned `lowerIncompleteGamma_eq_integral` and `Real.Gamma_eq_integral`).

The public laws are:

- H_k(w)~(2|w|)^(−k)exp(−|w|) at −∞, and ~(−2w)^(−k)exp(w) at +∞ with the fixed branch.
- Every nonzero-frequency solution is a unique combination of exp(−w) and H_k(w).
- The displayed zero-frequency solutions with the logarithmic k=1 case.

For the proof, obtain the k<1, w<0 range from the supplied real incomplete-gamma integral, derivative and limit. Define the contour extension on the slit plane and compare contours by Cauchy, retaining the upper-bank branch for positive w and every real weight. Differentiate its moving endpoint to verify the ODE and its nonzero Wronskian. Integration by parts gives both asymptotics; elementary reduction of order gives the zero-frequency solutions.

*Needs:* §5.3; §8.2; Tau Ceti `TauCeti.lowerIncompleteGamma`, `TauCeti.lowerIncompleteGamma_eq_integral`, `TauCeti.hasDerivAt_lowerIncompleteGamma`, `TauCeti.tendsto_lowerIncompleteGamma_atTop`; Mathlib `Real.Gamma_eq_integral`, `Real.GammaIntegral_convergent`; TauCetiRoadmap.ContourIntegration Layer 3.

**Checks.**

- fourier kernel weight zero: On w<0 the incomplete-gamma comparison gives Γ(1)−γ(1,−2w)=exp(2w), hence H₀(w)=exp(w); contour continuation gives the same value on w>0; it is independent of exp(−w).
- fourier kernel negative: For w<0, H_k(w)=exp(−w)∫_(−2w)∞exp(−t)t^(−k)dt is real and nonzero.
- incomplete-gamma parameter boundary: At k=1 the supplied lower function has shape 0 and is totalized to zero, while H₁(w)>0 for w<0. The complete-minus-lower comparison must retain k<1.
- fourier kernel weight one: At k=1 the two proposed powers 1,y⁰ coincide, while log y is independent.

### 8.4a Fourier expansion with general parabolic monodromy

Prove Fourier expansion with general parabolic monodromy with the following hypotheses. Let V be finite dimensional over ℂ, Γ≤Mp₂(ℤ) finite index, ρ:Γ→GL(V), and k∈(1/2)ℤ. At a cusp choose a positive width w with the lift (T^w,1) in the transported subgroup, and let M be its action. Choose the matrix logarithm A with exp(2πiA)=M, scalar eigenvalues λ satisfying 0≤Re(λ)<1 and the nilpotent logarithm on each generalized eigenspace. For a real-analytic harmonic cusp slash f with f(τ+w)=Mf(τ) and uniform exponential growth, write f(x+iy)=Σ_n exp(2πiB_n x)v_n(y), B_n=(nI+A)/w. Prove locally uniform convergence with derivatives through order two and the matrix ODE v_n″+(k/y)v_n′+((2πk/y)B_n−4π²B_n²)v_n=0. On each generalized eigenspace of B_n with eigenvalue β, every mode is uniquely exp(−2πB_n y)a_n+K_(k,B_n)(y)b_n, where K_(k,B)(y)=exp(−2πBy)J_(k,B)(y), J_(k,B)(y)=−∫_y^∞t^(−k)exp(4πBt)dt if Re(β)<0 and J_(k,B)(y)=∫_1^y t^(−k)exp(4πBt)dt if Re(β)≥0. The negative-frequency integral converges because its exponential decay dominates all Jordan polynomials. The two resulting Fourier parts converge on every compact subset of ℍ; growth makes all sufficiently positive-frequency b_n and sufficiently negative-frequency a_n vanish. This gives normalized parts, using decay at infinity on negative frequencies and base height 1 on the remaining modes; for real β≠0, H_k(2πβy)=−(−4πβ)^(1−k)K_(k,β)(y)+δ_(β>0)H_k(2πβ)exp(−2πβ(y−1)), using §8.4’s branch. At β=0 and k≠1, y^(1−k)=(1−k)K_(k,0)(y)+1. For holomorphic slashes b_n=0 and exp(2πiB_nτ) has polynomial τ-factors on Jordan blocks. Finite principal parts, holomorphy and vanishing at a cusp mean respectively finitely many exponents with negative real part, none with negative real part, and convergence to zero; polynomial factors on the Re(exponent)=0 boundary must satisfy the stated boundedness or vanishing condition. No unitary or semisimplicity hypothesis is imposed. At k=1 the integral at B_n=0 is log y; no k=1 surjectivity is asserted. (KnoppMason2009, arXiv v1 §2.2, Lemma 2.1, Theorem 2.2 and Lemma 2.3, pp. 4–6, lines 188–241, for holomorphic logarithmic expansions; harmonic extension by the displayed ODE from §8.2 and reduction of order as in BruinierFunke2003 lines 395–423.)

A source locator is KnoppMason2009 line 188.

The public laws are:

- Gauge by exp(−2πiAx/w), then recover v_n by integration over one period.
- On Re(β)≥0 the complementary mode has zero value at y=1 and derivative exp(2πB_n) there.
- on Re(β)<0 choose the displayed decaying primitive, and its Wronskian with exp(−2πB_n y) is y^(−k)I after factoring the two exponentials.
- For finite-order M diagonalize and convert the basis to H_k and its zero modes of §8.5.
- Direct sums and intertwiners commute with the fixed-cusp coefficients.
- subgroup restriction reindexes cusp widths and transports the logarithm and mode choices.
- changing cusp or height carries the explicitly specified choices.

For the proof, use the Jordan logarithm to make the x-dependence periodic. Fourier integration and the harmonic equation yield the displayed ODE without evaluating ρ outside its domain. Reduction of order gives the integral basis with invertible Wronskian for all y>0; decay normalization on the negative-frequency tail is necessary for globally convergent parts, since using a fixed finite base height on that infinite tail can make the separated holomorphic series diverge; on Jordan blocks use finite derivatives of the scalar entire matrix functions. Fourier decay on compact strips gives convergence and growth controls the cusp tails. For finite-order M replace the height-one primitive by the scalar gamma normalization; this is a holomorphic change of splitting and fixes the comparison to §8.5.

*Needs:* §8.2; §8.3; §8.4.

**Checks.**

- parabolic jordan: For w=1, M=[[1,1],[0,1]], A=M_nil/(2πi), the holomorphic mode exp(2πiAτ)e₂=(τ,1); discarding τ breaks translation by M.
- parabolic nonunit: For scalar M=2, λ=−i log(2)/(2π) is complex; exp(2πiλτ) has multiplier 2 and is harmonic, so real-frequency kernels alone are insufficient.
- parabolic semisimple: For M=i, λ=1/4 and n=0, the scalar modes have frequency 1/4; for M=1,n=0 the integral is (y^(1−k)−1)/(1−k), or log y at k=1.

### 8.5 Weil Fourier parts and the xi kernel

Prove Weil Fourier parts and the xi kernel with the following hypotheses. For every nondegenerate even integral lattice L, every k∈(1/2)ℤ with k≠1, every finite-index Γ≤Mp₂(ℤ), and F∈H_k(Γ,ρ_L), each cusp expansion decomposes uniquely into F⁺+F⁻ using exp(−w), H_k(w), and the constant pair 1,y^(1−k). At infinity for the full group, n∈ℤ+Q(h), h∈L∨/L, F⁺=Σ a⁺(h,n)e(nτ)e_h and F⁻=Σ_h[a⁻(h,0)y^(1−k)+Σ_(n≠0)a⁻(h,n)H_k(2πny)e(nx)]e_h. Only finitely many negative a⁺ and positive a⁻ occur. ξ_k maps H onto a subspace of M!_(2−k)(Γ,ρ_(L−)); its kernel is exactly M!_k. On H⁺ the n≥0 nonholomorphic coefficients vanish at each cusp, and ξ is cuspidal. (BruinierFunke2003, (3.2), Lemmas 3.1, 3.3–3.4, Proposition 3.2, H⁺ definition, pp. 9–11, lines 384–515; ambient dimension assumption §2 line 190; BruinierFunke2003 line 384.)

For the full group the Fourier and kernel assertions are BruinierFunke2003 (3.2) and Proposition 3.2; the finite-index assertions are proved here by the cusp-width and finite-order translation argument of §8.4a. The source fixes full-group notation at BruinierFunke2003 line 383.

The public laws are:

- The uniquely normalized F⁺ at the specified cusp.
- The displayed F⁻ with its constant term.
- ξ_k F=0 iff F is weakly holomorphic.
- a⁺(h,n)=O(exp(C√n)) and a⁻(h,−n)=O(exp(C√n)).
- cusp-shadow a⁻(h,−n)=O(n^(k/2)).
- Adjoining two even unimodular hyperbolic planes preserves the finite quadratic module, signature modulo 8, and every H, M!, S and xi map by an intertwining equivalence.
- this reduces rank <3 to the source’s ambient dimension ≥3.
- At the full-group infinity cusp, the ξ-image of a⁻(h,0)y^(1−k) is (1−k)conj(a⁻(h,0)).
- For n≠0 its coefficient at e(−nτ)e_h is −conj(a⁻(h,n))conj((−4πn)^(1−k)), with the upper-bank branch of 8.4. Reindex h in the conjugate Weil module.
- Let σ=signature(L). If Z=(−I,i)∈Γ, then F_h=exp(πi(k−σ/2))F_(−h). If (I,−1)∈Γ and 2k is not congruent to σ modulo 2, H_k is zero. No central-parity restriction is imposed when the corresponding central element is absent from Γ.

For the proof, diagonalize the finite-order cusp translation supplied by the Weil representation and recover coefficients by period integration. The harmonic equation gives 8.4’s scalar ODE. Growth and the two asymptotics cut off the forbidden tails. Apply L and conjugate to compute ξ; the constant and nonzero modes prove kernel equality and the cusp-shadow characterization. Transport every step to each cusp. The coefficient bounds follow from the modular small-y bound and circle integration, as in Lemmas 3.3–3.4, lines 503–515. Bruinier–Funke §2 line 190 assumes ambient dimension at least 3; first add two even unimodular hyperbolic planes and transport the unchanged discriminant representation to justify all smaller ranks, including rank zero.

*Needs:* §8.3; §8.4; §8.4a; TauCetiRoadmap.MetaplecticAutomorphicForms §4.7; TauCetiRoadmap.IntegralLattices §§0G, 1G–1H.

**Checks.**

- fourier constant shadow: The constant nonholomorphic mode has ξ_k(a y^(1−k))=(1−k)conj(a); it need not be cuspidal.
- fourier weak shadow: A full exponential-growth form is not assumed to have only a cusp shadow.
- At k=0 the local nonholomorphic mode exp(2πy)exp(2πix)=conj(q⁻¹) has ξ₀=4πq⁻¹; exponential growth permits polar shadows.
- fourier nonzero signature: For L=⟨2⟩, signature 1 and h=1/2, Q(h)=1/4, so infinity exponents lie in ℤ+1/4 and ρ_L(Z)e_(1/2)=−i e_(−1/2). The conjugate convention would give ℤ−1/4 and +i.
- fourier central parity: For the rank-zero lattice and the full Mp₂(ℤ), weight 1/2 gives the zero space, while weight 0 contains 1. On a subgroup omitting the central kernel the latter parity obstruction is not imposed.

### 8.6 surjectivity and exact sequences

Prove surjectivity and exact sequences with the following hypotheses. In the full Weil-representation setting of 8.5, ξ_k is surjective onto M!_(2−k)(Γ,ρ_(L−)). The sequences 0→M!_k→H_k→M!_(2−k)→0 and 0→M!_k→H_k⁺→S_(2−k)→0 are exact as real vector spaces, or as complex spaces after conjugating the last term. This holds for every finite-index Γ and k≠1; it is not a surjectivity assertion for an arbitrary representation. (BruinierFunke2003, Theorem 3.7 and Corollary 3.8, pp. 13–15, lines 626–699; BruinierFunke2003 line 626.)

For the full group these are BruinierFunke2003 Theorem 3.7 and Corollary 3.8. The arbitrary finite-index case is proved here by descent from a normal torsion-free subgroup of finite index and averaging over the finite quotient, following the source’s subgroup construction and full-group descent (BruinierFunke2003 lines 663–696).

The public laws are:

- Every stated weakly holomorphic Weil form has a harmonic preimage.
- The two displayed exact sequences with the actual inclusion and ξ maps.

For the proof, pass to a normal torsion-free finite-index subgroup. To solve ∂bar F=(i/2)y^(−k)conj(g)dbarτ with pole bounds, construct local primitives of y^(−k)conj(g) at each cusp from 8.4’s Fourier kernels, multiply them by cutoffs and subtract; the remaining forcing is compactly supported. The generic vector-bundle Dolbeault and Serre-duality contract gives H¹(E(nD))=0 for large cusp divisor nD and hence a smooth global solution for that forcing; verify here that the sum keeps the original cusp growth. The factor i/2 is fixed by 8.2’s xi normalization. Holomorphy of g implies ΔF=0. Average over the finite quotient to descend; restrict to inverse images of cusp forms for the second sequence. ModularForms 10B supplies the line-bundle cohomology foundation; the recorded Part II contract supplies the required vector-bundle extension.

*Needs:* §8.5; §8.4; TauCetiRoadmap.ModularForms Layer 10B; `gap:vector-bundle-dolbeault`.

**Checks.**

- xi exact kernel: The kernel includes every weakly holomorphic form, not just holomorphic forms bounded at cusps.
- xi exact scalar: The trivial discriminant module recovers the compatible scalar case, while incompatible central eigenspaces are zero.

### 8.7 mock forms with specified completions

Define mock forms with specified completions as follows. A mock modular form is a holomorphic part h with a specified normalized nonholomorphic Fourier correction F⁻ such that F=h+F⁻ belongs to H_k(Γ,ρ); its shadow is ξ_k F, required to be holomorphic at every cusp in the standard mock space. The full space H_k, with weakly holomorphic shadows that may have cusp poles, remains a separate harmonic Maass space. Include the completion and its cusp-coordinate normalization in the object, rather than asserting a choice-free shadow for an arbitrary holomorphic function. For general ρ use the conjugate representation; with an invariant Hermitian structure identify it with the dual. Supply the scalar and vector, subgroup restriction, direct sum and intertwining-map APIs. On finite Weil modules at k≠1 use §8.5’s gamma and power normalization; at k=1 and on general cusp monodromy use §8.4a’s decaying-negative-frequency and height-one normalization. (Zagier2009, §5, pp. 986–12–14, lines 640–735; BruinierFunke2003 (3.2), lines 423–438; Zagier2009 line 640.)

The public laws are:

- Recover the actual harmonic function h+F⁻.
- The shadow is the explicit antilinear ξ-image.
- For the specified normalized correction, shadow=0 iff F⁻=0.
- In that case h=F is weakly holomorphic. Conversely a weakly holomorphic form equipped with correction 0 has shadow 0.
- Intertwining maps transport h, completion and the corresponding conjugate shadow.
- For cusp shadow g, F⁻(τ)=−(2i)⁻¹∫_(−conj τ)^(i∞)conj(g(−conj z))((z+τ)/(2i))^(−k)dz, with branches fixed by the vertical ray.

For the zero-frequency shadow g₀ in a translation-fixed cusp component, prove at k≠1 the Weil correction is conj(g₀)y^(1−k)/(1−k), whereas the height-one correction is conj(g₀)(y^(1−k)−1)/(1−k); at k=1 the height-one correction is conj(g₀)log y. Each has ξ-image g₀. The Weil correction minus the height-one correction is the holomorphic constant conj(g₀)/(1−k), so changing to height-one normalization adds that constant to h and leaves h+F⁻ unchanged. This concerns the actual zero eigenspace; nontrivial Jordan blocks use the matrix primitive of §8.4a. The law follows by differentiating these zero modes with §8.2’s ξ normalization (BruinierFunke2003 lines 396–438 for k≠1; the k=1 case is the direct logarithmic derivative).

For the proof, use §8.5 or §8.4a with the fixed logarithm, negative-frequency decay and remaining base height to normalize the correction. The injectivity of ∂bar on the normalized nonholomorphic modes proves shadow=0 iff F⁻=0; xi-kernel equality then gives weak holomorphy of F=h. The example F=conj(j−744) at weight 0 shows why polar shadows are excluded from that assertion. For a cusp shadow, differentiate the convergent Eichler integral at its moving lower endpoint: ∂bar F⁻=(i/2)y^(−k)conj(g), hence ξF⁻=g. Match its Fourier coefficients termwise; nonzero constant shadow uses the zero-frequency correction formula instead of this cusp integral, including its logarithmic k=1 case. The integral formula’s constant and orientation are verified by this derivative calculation.

*Needs:* §8.3; §8.5; §8.4a.

**Checks.**

- mock zero shadow: A weakly holomorphic form with correction 0 has shadow 0.
- mock nonzero shadow: C(1/6,0;τ) has shadow −√2g(1/6,0;τ)≠0; a completion with this correction cannot have zero shadow.
- mock scalar i: Multiplying a mock object by i multiplies its shadow by −i, not i.
- mock zero-frequency normalization: At k=0 and g₀=1, the Weil correction is y and the height-one correction is y−1; their difference is 1, so h gains 1 under the change. At k=1 and g₀=1 the correction is log y, vanishing at y=1, with shadow 1.

### Examples

For the explicit differential expression, ξ_k(y^(1−k))=1−k and Δ_k(y^(1−k))=0. At k=1 the second zero-frequency solution is log y, so the quoted k≠1 Fourier and exact-sequence theorems keep that hypothesis.

### Dependencies

`gap:classical-metaplectic-model`; TauCetiRoadmap.ModularForms Layer 0; TauCetiRoadmap.MetaplecticAutomorphicForms §§4.7, 7.1, 7.49; §8.4a; TauCetiRoadmap.MetaplecticAutomorphicForms §7.49; `gap:analytic-elliptic-regularity`; TauCetiRoadmap.AutomorphicSpectralTheory §1.16; §5.3; TauCetiRoadmap.ContourIntegration Layer 3; TauCetiRoadmap.MetaplecticAutomorphicForms §4.7; TauCetiRoadmap.IntegralLattices §§0G, 1G–1H; TauCetiRoadmap.ModularForms Layer 10B; `gap:vector-bundle-dolbeault`; §8.2; §8.3; §8.4; Tau Ceti `TauCeti.lowerIncompleteGamma`, `TauCeti.lowerIncompleteGamma_eq_integral`, `TauCeti.hasDerivAt_lowerIncompleteGamma`, `TauCeti.tendsto_lowerIncompleteGamma_atTop`; Mathlib `Real.Gamma_eq_integral`, `Real.GammaIntegral_convergent`.

## Layer 9: completed kernels and meromorphic Jacobi coefficients

### 9.1 classical theta-component coordinates

Construct classical theta-component coordinates as follows. For m≥1 and l∈ℤ/(2m), identify θ_m,l(z;τ)=Σ_(n≡l (mod 2m))exp(πin²τ/(2m)+2πinz) with exp(πil²τ/(2m)+2πilz)jacobiTheta₂(2mz+lτ,2mτ). Transport the positive-index theta decomposition of MetaplecticAutomorphicForms §6.20 through its classical-coordinate specialization: fix integral weight k, positive index m, trivial finite multiplier, the rank-one elliptic lattice and normal Fourier convergence, and impose holomorphy and cusp growth when comparing the holomorphic subspaces. Include the finite Weil convention. (Zwegers2002, (3.1)–(3.4), pp. 49–50, lines 2673–2696; Zwegers2002 line 2673.)

The public laws are:

- The displayed native theta comparison.
- Changing l by 2m leaves the component unchanged.
- A holomorphic elliptic function of index m has unique theta coefficients, transported from §6.20.

For the proof, write n=l+2mj and complete its exponent to the native jacobiTheta₂. Apply the imported holomorphic theta-component theorem with this coordinate comparison. This target adds the normalization adapter rather than reconstructing the generic holomorphic decomposition.

*Needs:* Mathlib `jacobiTheta₂`; TauCetiRoadmap.MetaplecticAutomorphicForms §§4.7, 6.20.

**Checks.**

- jacobi theta even: θ₁,₀=1+(e(2z)+e(−2z))q+terms of higher q-degree.
- jacobi theta odd: θ₁,₁=q^(1/4)(e(z)+e(−z))+terms of higher q-degree.
- jacobi index zero: m=0 is excluded: a zero-index elliptic function needs a different decomposition.

### 9.2 meromorphic Jacobi data

Define meromorphic Jacobi data as follows. For positive integral m and integral k, a meromorphic elliptic datum is a function φ(z;τ) meromorphic in z for each τ∈ℍ, with φ(z+λτ+μ;τ)=exp(−2πim(λ²τ+2λz))φ(z;τ) for every pair of integers λ,μ off its poles. Define its modular subspace by φ(z/(cτ+d);γτ)=(cτ+d)^k exp(2πimcz²/(cτ+d))φ(z;τ). Pole sets, Laurent orders and principal parts use the native meromorphic germ carrier. Poles modulo Λτ form a finite set; no regularity in τ beyond what an individual analytic corollary needs is hidden in this pointwise decomposition datum. (Zwegers2002, §3.1 conditions (E),(M), p. 49, lines 2660–2668; Theorem 3.9, line 3101; Zwegers2002 line 2660.)

The public laws are:

- Agreement off the pole divisors determines the meromorphic germs.
- Fixed-index data are closed under addition and scalar multiplication.
- The pole set is Λτ-invariant and its quotient finite.
- With empty pole divisor recover holomorphic elliptic data pointwise.
- For jointly holomorphic modular data of integral weight k, positive index m, trivial finite multiplier and the specified cusp growth, compare through the classical-coordinate specialization of MetaplecticAutomorphicForms §§6.18, 6.20.

For the proof, the elliptic multiplier is entire and never zero, so translates have the same pole orders. Discreteness of poles and compactness of a pole-free-boundary fundamental parallelogram give a finite quotient. Use 9.1 for the classical-coordinate comparison; empty poles alone impose neither holomorphy in τ nor cusp growth, so those hypotheses are required separately.

*Needs:* §9.1; TauCetiRoadmap.ContourIntegration Layer 2; TauCetiRoadmap.MetaplecticAutomorphicForms §6.18.

**Checks.**

- meromorphic jacobi theta: θ_m,l satisfies the index-m elliptic law.
- meromorphic jacobi zero: The zero datum has empty pole set and all principal parts zero.
- meromorphic jacobi constant: For m>0, the nonzero constant function fails the τ-translation law.

### 9.3 mixed real-analytic residues

Define mixed real-analytic residues as follows. For a meromorphic germ g at u with pole order at most s≥1, and a real-analytic germ f, define Res^RA_u(fg)=(1/(s−1)!)∂_v^(s−1)[f(v)(v−u)^s g(v)] at u. Equivalently this is the coefficient of (v−u)^(−1)conj(v−u)^0 in the mixed Laurent–Taylor expansion. Prove independence of s and affine coordinate covariance of the 1-form f(v)g(v)dv, including its Jacobian factor, for the coordinate changes used by Jacobi transformations. For holomorphic f it equals the ordinary residue. (Zwegers2002, Definition 3.8, pp. 56–57, lines 3082–3099; Zwegers2002 line 3082.)

The public laws are:

- Increasing a valid bound s leaves the answer unchanged.
- The residue is complex linear in each germ.
- For holomorphic f it is the native residue of fg.
- Under v=u+a w, a≠0, residues of the 1-form transform with its factor a.

For the proof, expand the analytic regularization and real-analytic f in mixed Taylor coefficients. Only the coefficient with antiholomorphic degree zero contributes. Factorials give the derivative formula, independence of s, and affine coordinate covariance.

*Needs:* §8.2; TauCetiRoadmap.ContourIntegration Layer 2.

**Checks.**

- residue double pole: At u=0, f(v)=1+v+conj v and g(v)=v⁻² give residue 1; merely evaluating f at the pole fails.
- residue anti term: f(v)=conj v and g(v)=v⁻¹ give residue 0; treating conjugate v as v fails.
- residue ordinary: f=1,g=v⁻¹ give residue 1, while g=1 gives 0.

### 9.4 the completed Jacobi polar kernel

Define the completed Jacobi polar kernel as follows. For m≥1, τ∈ℍ and z−u∉Λτ define f_m,u(z;τ)=Σ_(λ∈ℤ)exp(2πimλ²τ+4πimλz)/(1−e(λτ+z−u)). Define R_m,l(u;τ)=Σ_(λ≡l (mod 2m))[sgn(λ+1/2)−E((λ+2m Im(u)/y)√(y/m))]exp(−πiλ²τ/(2m)−2πiλu), and fHat=f−(1/2)Σ_l R_m,l(u)θ_m,l(z). Prove normal convergence and smoothness off the poles. As a function of z, fHat is meromorphic with residue −1/(2πi) at z=u and satisfies the index-m elliptic law. Its u-shift is fHat_(u+λτ+μ)=exp(2πim(λ²τ+2λu))fHat_u. Under γ, fHat_(u/(cτ+d))(z/(cτ+d);γτ)=(cτ+d)exp(2πimc(z²−u²)/(cτ+d))fHat_u(z;τ). (Zwegers2002, Definition 3.2, Proposition 3.3, Definition 3.4 and Proposition 3.5, pp. 51–55, lines 2745–3018; Zwegers2002 line 2745.)

The public laws are:

- For Im(z−u)/y∉ℤ, fHat=(1/2)Θ_A((z−u,2mu);τ) with A=[[2m,1],[1,0]], c₁=(0,1), c₂=(−1,2m).
- The displayed residue and its elliptic translates.
- The displayed z- and u-translation laws.
- The displayed full modular law.

For the proof, gaussian bounds prove the f and R series convergence. Expand the denominator geometrically first in a pole-free strip and identify the rank-two indefinite kernel; continue meromorphically in z. Apply 7.4 including its boundary domain, then use the pole continuation. Compute residues from λ=0.

*Needs:* §5.3; §7.4; §9.1.

**Checks.**

- polar kernel residue: The λ=0 term has lim_(z→u)(z−u)f=−1/(2πi); the finite theta correction does not change it.
- polar kernel zero class: R_m,0(0;τ)=1, whereas R_m,m(0;τ)=0; replacing sgn(λ+1/2) by sgn λ loses the zero term.
- polar kernel cone: For its A, Q(c₂)=−m<0, c₁ is primitive isotropic, and B(c₁,c₂)=−1; the mixed-boundary construction is necessary.

### 9.5 meromorphic Jacobi decomposition

Prove meromorphic Jacobi decomposition with the following hypotheses. For every datum φ of 9.2 and every τ∈ℍ, choose p whose parallelogram P_p=p+(0,1)τ+(0,1) has no boundary poles. Put h_l(τ)=exp(−πil²τ/(2m))∫_p^(p+1)φ(v;τ)exp(−2πilv)dv−πiΣ_(u∈P_p∩poles)Res^RA_(v=u)[R_m,l(v;τ)φ(v;τ)]. These h_l are independent of p. For z outside the poles, φ(z;τ)=Σ_(l mod 2m)h_l(τ)θ_m,l(z;τ)−2πiΣ_(u mod Λτ)Res^RA_(v=u)[fHat_m,v(z;τ)φ(v;τ)]. If φ obeys the modular law of weight k, then h_l(τ+1)=exp(−πil²/(2m))h_l(τ) and h_l(−1/τ)=τ^k/(√(−iτ)√(2m))Σ_(ν mod 2m)exp(πilν/m)h_ν(τ). (Zwegers2002, Theorem 3.9, pp. 57–59, lines 3101–3238; (3.3)–(3.4), lines 2691–2696; Zwegers2002 line 3101.)

The public laws are:

- The corrected h_l do not depend on p.
- The displayed decomposition including every residue.
- The displayed weight-k−1/2 component transformations.
- If φ has no poles, the residue sums vanish and 9.1’s holomorphic decomposition is recovered.

For the proof, integrate the meromorphic uncompleted f_m,v(z)φ(v) around the pole-free boundary. Opposite edges give the theta integrals using the inhomogeneous u-shift. The residue theorem supplies all principal-part derivatives. Substituting fHat cancels exactly half the R-theta terms and gives the displayed coefficient correction. Contour movement plus 9.3 proves independence of p; kernel covariance proves S and T. Harmonicity of h_l requires separate differential hypotheses.

*Needs:* §9.2; §9.3; §9.4; TauCetiRoadmap.ContourIntegration Layers 2–3.

**Checks.**

- jacobi no poles: For φ=θ_m,j the coefficients are the Kronecker delta h_l=δ_lj.
- jacobi higher pole: A double pole uses a first Wirtinger derivative in both correction sums; a simple-residue-only formula fails.
- jacobi weight check: k=1 gives coefficient weight 1/2; changing √(−iτ) to its reciprocal gives weight 3/2.

### Examples

For m=1, θ₁,₀ begins 1+(exp(4πiz)+exp(−4πiz))q, while θ₁,₁ begins q^(1/4)(exp(2πiz)+exp(−2πiz)). The completed polar kernel has the same residue −1/(2πi) as its meromorphic kernel. Arbitrary pole orders use Wirtinger residues, rather than an assumption of simple poles.

### Dependencies

Mathlib `jacobiTheta₂`; TauCetiRoadmap.MetaplecticAutomorphicForms §§4.7, 6.20; TauCetiRoadmap.ContourIntegration Layer 2; TauCetiRoadmap.MetaplecticAutomorphicForms §6.18; §8.2; §5.3; §7.4; TauCetiRoadmap.ContourIntegration Layers 2–3.

## Layer 10: explicit third-, fifth- and seventh-order mock theta vectors

### 10.1 third-order unilateral functions

Define the third-order mock theta functions as follows. For |q|<1 define f(q)=Σ_(n≥0)q^(n²)/Pₙ(−q;q)², ω(q)=Σ_(n≥0)q^(2n²+2n)/Pₙ₊₁(q;q²)², φ(q)=Σ_(n≥0)(−q)^(n²)/Pₙ(−q²;q²), and ψ(q)=Σ_(n≥1)(−q)^(n²)/Pₙ(−q;q²). Each has an absolutely convergent analytic and coefficientwise integral formal version. For τ∈ℍ put F₃=(q^(−1/24)f(q),2q^(1/3)ω(q^(1/2)),2q^(1/3)ω(−q^(1/2))), where fractional q-powers mean exp(2πirτ). (BringmannOno2006, (2.1)–(2.2), pp. 5–6, lines 270–278; Zagier2009 §1, pp. 986–03–04, third-order definitions; BringmannOno2006 line 270.)

The public laws are:

- The four displayed series with absolute convergence.
- f(q)=R_rank(−1;q).
- 2φ−f=f+4ψ=Σ_(n∈ℤ)(−q)^(n²)/P(−q;q).
- The displayed definitions agree coefficientwise with their complex realizations.

`thirdOrderF` is the function f on |q|<1, and `thirdOrderF_rank` identifies it with the rank specialization at −1. Prove absolute convergence of each of the four series. The first three nonconstant coefficients of f give the equivalent derivative values f′(0)=1, f″(0)=−4, f‴(0)=18.

For the proof, apply product bounds and the quadratic exponent for convergence. The rank adapter proves f=R(−1). Prove the two theta-quotient relations by clearing the constant-one products and the unilateral binomial identities; their formal versions follow coefficientwise.

*Needs:* §2.1; §1.4; §1.6; §4.3.

**Checks.**

- third at zero: f(0)=φ(0)=ω(0)=1 and ψ(0)=0.
- f begins 1+q−2q²+3q³; these are the signed rank counts.
- third omega: ω begins 1+2q+3q²+4q³; squaring the product is essential.

### 10.1a bilateral bridges for rank, f and omega

Prove the bilateral rank identity with the following hypotheses. For 0<|q|<1 and z≠0 with 1−zqⁿ≠0 for every n∈ℤ, R_rank(z;q)=(1−z)/P(q;q)·Σ_(n∈ℤ)(−1)^n q^(n(3n+1)/2)/(1−zqⁿ). At z=1 the right side has a removable singularity and equals Π(q). Here R_rank is the meromorphic Durfee-square expression of §4.3; equality with the series of rank counts is used in its absolute-convergence annulus, including |z|=1. The bilateral sum is absolutely convergent. The equality holds formally coefficientwise in the domains where each geometric expansion is locally finite, rather than as an unrestricted formal Laurent series in q. (Zagier2009, Proof of Theorem 7.1, p. 986–17, lines 937–945; Zagier2009 line 937.)

The public laws are:

- The displayed convergent equality.
- The removable value is 1/P(q;q).

For the proof, apply the binomial theorem to the Durfee-square formula and regroup using the imported single-denominator Appell–Lerch identity; absolute summability justifies the bilateral expression. Isolate n=0 to prove the removable value at z=1.

Prove that for 0<|q|<1,
P(q²;q²)ω(q)=Σ_(n∈ℤ)(−1)^n q^(3n(n+1))/(1−q^(2n+1)), absolutely. This bridge is the author’s q-binomial derivation from the unilateral definition (BringmannOno2006, (2.1), p. 5, BringmannOno2006 line 270; q-binomial input Gasper1995, (1.2.8), Gasper1995 line 135). The source locator specifies ω’s definition, not a bilateral theorem. Expand the reciprocal odd products by §2.4, telescope the finite q-Pascal kernels of §2.7, and then pass to the limit using the quadratic majorants. Pair n with −n−1 to obtain the nonnegative sum Σ_(n≥0)(−1)^n q^(3n(n+1))(1+q^(2n+1))/(1−q^(2n+1)). The displayed paired form extends to q=0 with value 1. No odd exponent 2n+1 is zero, and |q|<1 excludes every denominator zero on the punctured disc.

The bilateral rank identity has sum P(q;q)R_rank(z;q)/(1−z), and the bilateral omega identity uses the actual unilateral definition of ω. Neither bilateral series is evaluated termwise at q=0.

*Needs:* §4.3; §10.1; §2.4; §2.7; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

**Checks.**

- rank bilateral constant: As q→0 the n=0 term contributes (1−z)/(1−z)=1 and the other terms tend to zero; the value at q=0 is defined by analytic continuation, with the z=1 limit separately justified.
- rank bilateral minus one: z=−1 gives P(q;q)f(q)=2Σ(−1)^n q^(n(3n+1)/2)/(1+qⁿ).
- omega pairing: The n=0,−1 pair is (1+q)/(1−q); multiplying ω by P(q²;q²) begins 1+2q+2q²+2q³. Omitting negative indices would give 1/(1−q) and coefficient 1 at q.

### 10.2 the third-order completed vector

Prove the third-order completed vector with the following hypotheses. Put g₀(τ)=Σ_(n∈ℤ)(−1)^n(n+1/3)exp(3πi(n+1/3)²τ), g₁(τ)=−Σ_(n∈ℤ)(n+1/6)exp(3πi(n+1/6)²τ), g₂(τ)=Σ_(n∈ℤ)(n+1/3)exp(3πi(n+1/3)²τ). Define G₃=2i√3∫_(−conj τ)^(i∞)(g₁,g₀,−g₂)(z)/√(−i(z+τ))dz and H₃=F₃−G₃. Then H₃(τ+1)=T₃H₃(τ), H₃(−1/τ)=√(−iτ)S₃H₃(τ), with T₃=[[ζ₂₄⁻¹,0,0],[0,0,ζ₃],[0,ζ₃,0]] and S₃=[[0,1,0],[1,0,0],[0,0,−1]]. It is harmonic of weight 1/2, has all-cusp exponential growth, and ξH₃=−2√6·conj((g₁,g₀,−g₂)(−conj τ)). G₃ is bounded on vertical approach to every rational cusp. (BringmannOno2006, (2.3)–(2.5), Theorem 2.1, pp. 5–6, lines 279–337; Zwegers2002 §4.5 lines 5104–5121; BringmannOno2006 line 279.)

The public laws are:

- The displayed T₃ matrix.
- The displayed S₃ matrix.
- The displayed exact shadow vector.
- The correction is bounded on every vertical rational-cusp approach.
- Put Q₃=(η(τ)/η(2τ))jacobiTheta₂(1/2,2τ), the weakly holomorphic theta quotient with its inherited rational-characteristic multiplier. The completions of q^(−1/24)φ and q^(−1/24)ψ are (H₃,₁+Q₃)/2 and (Q₃−H₃,₁)/4.
- their shadows are respectively 1/2 and −1/4 of ξH₃,₁. Their T and S laws are the direct-sum laws of H₃ and this explicit theta quotient, followed by these two projections.

For the proof, use the bilateral rank identity at z=−1 and the bilateral omega identity from §10.1a to express all three components through §5.6, then apply μHat S and T and rewrite the correction with 6.1. Differentiate G₃’s lower endpoint for its shadow and apply the factorization of Δ. The unary cusp-period estimates give bounded G₃ at rational cusps; modularity and the original q-expansion give the required growth of H₃. The coefficient is pinned by the explicit period integral and Theorem 2.1 in the author version of BringmannOno2006.

*Needs:* §10.1; §10.1a (the bilateral rank identity, the bilateral omega identity); §5.7; §6.1; §6.2; §8.2; §8.7; Mathlib `jacobiTheta₂`; §5.2; TauCetiRoadmap.ThetaSeries Layers 2–3.

**Checks.**

- third s two: S₃²=I; the accompanying square-root factors account for the metaplectic central action.
- third first correction: The first correction in H₃ is −2C(1/6,0;3τ), with nonzero shadow +2√6g(1/6,0;3τ).
- third t exchange: The leading 2q^(1/3) terms in both ω components transform by ζ₃ and exchange the signs of q^(1/2).
- third related constants: The relations φ=f+2ψ and Q₃=q^(−1/24)(f+4ψ) give φ(0)=1 and ψ(0)=0; reversing the ψ projection fails its first coefficient.

### 10.3 fifth- and seventh-order unilateral functions

Define fifth- and seventh-order unilateral functions as follows. For |q|<1 and s=0,1 define f_s=Σ q^(n²+sn)/Pₙ(−q;q), F_s=Σ q^(2n²+2sn)/Pₙ₊ₛ(q;q²), φ_s=Σ q^((n+s)²)Pₙ(−q;q²), ψ₀=Σ q^((n+1)(n+2)/2)Pₙ(−q;q), ψ₁=Σ q^(n(n+1)/2)Pₙ(−q;q), χ_s=Σ qⁿ/Pₙ₊ₛ(q^(n+1);q). The ψ₁ sum starts n=0; the other displayed sums start n=0. Define the seventh-order series A₀=Σ_(n≥0)q^(n²)/Pₙ(q^(n+1);q), A₁=Σ_(n≥1)q^(n²)/Pₙ(qⁿ;q), A₂=Σ_(n≥1)q^(n(n−1))/Pₙ(qⁿ;q). All have integral formal expansions and absolutely convergent analytic realizations. (Zagier2009, §1, pp. 986–04–05, lines 163–243; Zwegers2002 §4.4 lines 4081–4124; ψ₁ indexing uses the thesis convention; Zagier2009 line 163.)

The public laws are:

- All thirteen displayed series converge absolutely on |q|<1.
- χ₀=2F₀−φ₀(−q), χ₁=2F₁+φ₁(−q)/q, with the quotient at q=0 interpreted by its divisible formal numerator.
- The thesis functions F₀,F₁,F₂ are A₀,A₁,A₂ respectively.
- The native integral formal coefficients agree with analytic Taylor coefficients.

For the proof, use finite product factors and quadratic exponent bounds. The two χ identities follow by eliminating U,V,W in the survey’s displayed 2×7 relation; identify its indices j=1,2 with s=0,1 and keep the ψ₁ constant convention. Section 10.3a proves the unilateral-to-Hecke identities, including the seventh-order dictionary, before §10.4 uses the cone models.

*Needs:* HabiroCyclotomicCompletions §1.1; §1.4; §1.6; §2.1.

**Checks.**

- fifth constants: At zero f₀=f₁=F₀=F₁=φ₀=ψ₁=χ₀=χ₁=1 and φ₁=ψ₀=0.
- seventh constants: A₀(0)=A₂(0)=1 and A₁(0)=0; starting A₁ at zero would introduce 0/0.
- fifth chi at zero: φ₁(−q)/q tends to −1, giving χ₁(0)=2−1=1.

### 10.3a unilateral-to-Hecke identities

Prove unilateral-to-Hecke identities with the following hypotheses. For |q|<1, prove the eight fifth-order and three seventh-order identities for the actual unilateral functions of §10.3. Precisely for s=0,1: P(q;q)f_s=Σ_(n≥0,|j|≤n)(−1)^j q^((5n²+(2s+1)n)/2−j²)(1−q^((4−2s)n+2−s)); P(q²;q²)F_s=Σ_(n≥0,0≤j≤2n)(−1)^n q^(5n²+(2s+2)n−j(j+1)/2)(1+q^((6−4s)n+3−2s)); φ_s=q^s P(−q;q²)/P(q²;q²)·Σ_(n≥0,|j|≤n)(−1)^j q^(5n²+(2s+2)n−3j²−j)(1−q^((6−4s)n+3−2s)); ψ₁=P(−q;q)/P(q;q)·Σ_(n≥0,|j|≤n)(−1)^j q^((5n²+3n−3j²−j)/2)(1−q^(2n+1)); and 1+2ψ₀=P(−q;q)/P(q;q)·[1+2Σ_(n≥1)(−1)^n q^(n²+n)−2Σ_(n≥1,|j|<n)(−1)^j q^((5n²−n−3j²−j)/2)(1−qⁿ)]. For A_s, put L_s=1,5,3 and e_s=0,1,0 respectively; then P(q;q)A_s=(Σ_(r,t≥0)−Σ_(r,t<0))(−1)^(r+t)q^((3r²+8rt+3t²+L_s(r+t))/2+e_s). The ψ₁ convention includes n=0 and constant 1; the seventh-order dictionary is F₀,F₁,F₂=A₀,A₁,A₂. The two χ series are then covered by §10.3’s explicit linear identities. All double sums converge absolutely. The third and eighth fifth-order formulas use the corrected expressions recorded by Zwegers, including 1+2ψ₀ and the factor q in φ₁. (Andrews1986, Theorems 3–4, 9, 13, pp. 118–119, 125, 132–133, lines 241, 266, 450, 698; Hickerson1988 pp. 665–666; corrected identities Zwegers2002 lines 3697–3720, 4085–4124.)

A source locator is Andrews1986 line 241.

The public laws are:

- The five displayed fifth-order families.
- The three displayed seventh-order cone sums.
- Instantiate the Bailey pairs of Andrews1986 Theorems 3–4 in its Theorems 9, 13.
- use the finite Bailey relation of §2.6 and the explicit limits of §2.7 before reindexing.

For the proof, prove the explicit finite Bailey-pair inputs and apply the limits of §2.7 with their quadratic-exponent majorants. Clear the nonzero products and perform the finite triangular reindexings from Andrews. Use Hickerson’s seventh-order equalities with the stated index dictionary. Check the corrected third and eighth fifth-order formulas against the unilateral definitions before passing to theta models.

*Needs:* §10.3; §2.6; §2.7; §2.4.

**Checks.**

- unilateral hecke constants: The f,F,φ₀,ψ₁,A₀,A₂ identities have constant 1; φ₁,ψ₀,A₁ have constant 0; 1+2ψ₀ has constant 1.
- unilateral hecke first: f₀=1+q−q²+terms of degree ≥3, so E(q)f₀ has zero q coefficient; the n=0 factor 1−q² and the n=1 terms reproduce this.
- unilateral hecke corrections: 1+2ψ₀ begins 1+2q and φ₁ begins q; omitting the initial 1 or the factor q in the third/eighth identities violates these coefficients.

### 10.4 cone-theta identifications

Prove cone-theta identifications with the following hypotheses. For the actual series in §10.3 with the Hecke identities of §10.3a, prove the cone-theta identifications in Zwegers Lemmas 4.8 and 4.11.  (Zwegers2002, §4.3 lines 3694–3744; §4.4 lines 4081–4124; Lemmas 4.8 and 4.11, lines 4126–4248 and 4550–4685; Zwegers2002 line 3694.)

The public laws are:

- Use A=diag(5,−2), c=(±2,5) for f,F, and A=diag(5,−3), c=(±3,5) for φ,ψ.
- Use A=[[3,4],[4,3]], c₁=(−3,4),c₂=(−4,3), with characteristics j(1,1)/14, j=1,3,5.

For the proof, apply §10.3a’s equalities to the unilateral series, then split/reindex the lattice sums and complete squares to obtain the stated cone models; this part is the direct proof of Lemmas 4.8 and 4.11. No signature-(1,2) theta modularity is used for χ.

*Needs:* §10.3; §2.4; §7.2; §7.5; TauCetiRoadmap.ClassicalArithmeticCompletion §§4.40, 4.61; §10.3a; §2.7.

**Checks.**

- hecke fifth constant: At q=0 the f₀ and f₁ numerators are 1, while 1+2ψ₀ has constant 1.
- hecke seventh order: The A₁ cone numerator begins q, whereas A₀ and A₂ begin 1.

### 10.5 the fifth-order correction vectors

Construct the fifth-order correction vectors as follows. Set F₅,₁=(q^(−1/60)f₀,q^(11/60)f₁,q^(−1/240)(F₀(q^(1/2))−1),q^(71/240)F₁(q^(1/2)),q^(−1/240)(F₀(−q^(1/2))−1),q^(71/240)F₁(−q^(1/2))). Set F₅,₂=(2q^(−1/60)ψ₀,2q^(11/60)ψ₁,q^(−1/240)φ₀(−q^(1/2)),−q^(−49/240)φ₁(−q^(1/2)),q^(−1/240)φ₀(q^(1/2)),q^(−49/240)φ₁(q^(1/2))). Let C_ab mean 6.1’s C(a,b;30τ). Define G₅,₁ as half the vector (2ζ₁₂C_(1/30,5/2)+2ζ₁₂⁻¹C_(11/30,5/2), 2ζ₁₂C_(13/30,5/2)+2ζ₁₂⁻¹C_(23/30,5/2), −C_(19/60,0)−C_(29/60,0)+C_(49/60,0)+C_(59/60,0), −C_(13/60,0)−C_(23/60,0)+C_(43/60,0)+C_(53/60,0), ζ₂₄⁻⁵C_(19/60,5/2)+ζ₂₄⁵C_(29/60,5/2)+ζ₂₄C_(49/60,5/2)+ζ₂₄⁻¹C_(59/60,5/2), ζ₂₄C_(13/60,5/2)+ζ₂₄⁻¹C_(23/60,5/2)+ζ₂₄⁻⁵C_(43/60,5/2)+ζ₂₄⁵C_(53/60,5/2)). Put G₅,₂=−G₅,₁ and H₅,j=F₅,j−G₅,j. (Zwegers2002, F₅,₁ lines 4329–4414; F₅,₂ lines 4770–4856, pp. 74–80; Zwegers2002 line 4329.)

The public laws are:

- H₅,j equals the actual six cone-theta/eta components of Lemmas 4.8 and 4.11.
- The two G vectors are negatives.
- Replace every c·C(a,b;30τ) in −G₅,j by −√60·conj(c)g(a,b;30τ) to obtain ξH₅,j exactly.

For the proof, apply the finite orthogonal-direction factorization 7.5 to each cone datum in 10.4, with the exact characteristic phases. Compare the positive unary theta factors with eta using the imported product specializations. This yields the displayed finite correction rather than postulating it as data.

*Needs:* §10.4; §6.1; §7.5.

**Checks.**

- fifth leading shift: The first component is q^(−1/60)(1+q−q²+q³+…), fixing the T-phase ζ₆₀⁻¹.
- fifth opposite: G₅,₁+G₅,₂=0 exactly.
- fifth half arguments: A unit τ-shift changes q^(1/2) to −q^(1/2), so components 3 and 5, and 4 and 6, exchange.

### 10.6 fifth-order transformation laws

Prove fifth-order transformation laws with the following hypotheses. For j=1,2, H₅,j(τ+1)=T₅H₅,j(τ), where T₅ has nonzero entries (1,1)=ζ₆₀⁻¹,(2,2)=ζ₆₀¹¹,(3,5)=(5,3)=ζ₂₄₀⁻¹,(4,6)=(6,4)=ζ₂₄₀⁷¹. Put a=sin(π/5), b=sin(2π/5); M₅ has rows (0,0,√2a,√2b,0,0), (0,0,√2b,−√2a,0,0), (a/√2,b/√2,0,0,0,0), (b/√2,−a/√2,0,0,0,0), (0,0,0,0,b,a), (0,0,0,0,a,−b). Then H₅,j(−1/τ)=√(−iτ)(2/√5)M₅H₅,j(τ). The vectors are harmonic with shadows specified in 10.5 and corrections bounded at every vertical rational cusp. Their sum F₅,₁+F₅,₂ has zero correction and is weakly holomorphic with the same matrices. Write F₅,j,i, G₅,j,i and H₅,j,i for the i-th components. By 10.3’s two linear relations, q^(−1/120)(χ₀(q)−2)=2F₅,₁,₃(2τ)−F₅,₂,₃(2τ) and q^(71/120)χ₁(q)=2F₅,₁,₄(2τ)−F₅,₂,₄(2τ); their completions are 2H₅,₁,₃(2τ)−H₅,₂,₃(2τ) and 2H₅,₁,₄(2τ)−H₅,₂,₄(2τ), that is, the holomorphic parts minus 3G₅,₁,₃(2τ) and 3G₅,₁,₄(2τ) respectively, since G₅,₂=−G₅,₁. (Zwegers2002, Propositions 4.10, 4.13–4.14, pp. 75–83, lines 4415–4456, 4857–4883, 5029–5052; Zwegers2002 line 4415.)

The public laws are:

- The displayed six-entry T law.
- The displayed full S matrix.
- Δ_(1/2)H₅,j=0.
- The sum has zero shadow and finite principal parts at all cusps.
- The two χ completions above, with the constant 2 removed from χ₀.

For the proof, use 7.4’s full characteristic transforms on the cone models and eta’s multiplier to obtain the matrices. The actual orthogonal corrections in 10.5 have unary shadows, giving harmonicity through 8.2. Opposite corrections prove zero shadow for the sum. Apply the unary period bounds at each rational cusp.

*Needs:* §10.5; §7.4; §8.7; §5.2.

**Checks.**

- fifth ssquare: ((2/√5)M₅)²=I; its unequal √2 factors are necessary in this basis.
- fifth zero shadow: F₅,₁+F₅,₂ has identically zero shadow; neither summand is assumed holomorphic modular on its own.
- fifth chi normalization: the third components carry F₀−1, so 2F₅,₁,₃(2τ)−F₅,₂,₃(2τ) is q^(−1/120)(χ₀−2), whose constant term is −1; omitting the 2 would give q^(−1/120)χ₀, which is not this combination. In the fourth components q^(−49/120)φ₁(−q)=q^(71/120)φ₁(−q)/q supplies χ₁’s second term.

### 10.7 the seventh-order correction vector

Construct the seventh-order correction vector as follows. Put F₇=(q^(−1/168)A₀,q^(47/168)A₂,q^(−25/168)A₁). Define G₇ as the negative of (ζ₈₄⁻¹³C(13/42,−1/2)+ζ₈₄C(41/42,−1/2), ζ₈₄²⁹C(11/42,−5/2)+ζ₈₄⁻⁴¹C(25/42,−5/2), ζ₂₈⁵C(23/42,−3/2)+ζ₂₈⁻⁹C(37/42,−3/2)), all C evaluated at 21τ. Put H₇=F₇−G₇. Identify it with ζ₁₄⁻¹/(2η(τ)) times the cone-theta vector with characteristics (a,b)=((1,1)/14,(1,1)/14), (3(1,1)/14,5(1,1)/14), (5(1,1)/14,3(1,1)/14), on A=[[3,4],[4,3]], c₁=(−3,4),c₂=(−4,3). (Zwegers2002, §4.3 and Proposition 4.5, pp. 67–68, lines 3694–3783; Zwegers2002 line 3694.)

The public laws are:

- The displayed cone-theta/eta comparison.
- Apply 6.1 termwise to −G₇: ξH₇=−√42 times the conjugated displayed coefficient vector with C(a,b;21τ) replaced by g(a,b;21τ).
- The shifted holomorphic parts are exactly the three specified q-series.

For the proof, rewrite the three Hecke identities in 10.4 in their stated characteristics. Apply 7.5 and the eta identities to isolate the six unary corrections. Differentiate the explicit C functions for the shadow.

*Needs:* §10.4; §6.1; §7.5; §5.2.

**Checks.**

- seventh order leading: The leading q-powers of F₇ are −1/168,47/168,143/168; the last equals −25/168+1.
- seventh cone norm: For c₁,c₂, Q=−21/2 and B(c₁,c₂)=−28; both lie in the same negative component.
- seventh order ordering: The second component uses A₂ with constant 1, and the third uses A₁ with leading q; exchanging them fails the T law.

### 10.8 seventh-order transformation laws

Prove seventh-order transformation laws with the following hypotheses. H₇(τ+1)=diag(ζ₁₆₈⁻¹,ζ₁₆₈⁴⁷,ζ₁₆₈⁻²⁵)H₇(τ), and H₇(−1/τ)=√(−iτ)M₇H₇(τ), where M₇=(2/√7)[[sin(π/7),sin(3π/7),sin(2π/7)],[sin(3π/7),−sin(2π/7),sin(π/7)],[sin(2π/7),sin(π/7),−sin(3π/7)]]. The vector is harmonic of weight 1/2 with the exact nonzero unary shadow of 10.7 and all-cusp exponential growth. G₇ is bounded on vertical approach to every rational cusp. The holomorphic S-defect is the corresponding unary period integral. (Zwegers2002, Proposition 4.5 and Corollary 4.6, pp. 68–72, lines 3781–3808 and 4018–4077; Zwegers2002 line 3781.)

The public laws are:

- The displayed diagonal T law.
- The displayed sine S matrix.
- Δ_(1/2)H₇=0.
- Subtract the transformed G₇ to express the holomorphic defect as its integral from 0 to i∞.

For the proof, apply the general characteristic S and T laws, collecting finite-dual-lattice terms with the integral isometries preserving the cone; use eta’s multiplier. The correction’s explicit unary derivative gives the shadow and harmonicity. The bounded-cusp and period statements follow from 6.2, with characteristic shifts kept.

*Needs:* §10.7; §7.4; §6.2; §8.7.

**Checks.**

- seventh ssquare: M₇²=I, fixing the factor 2/√7.
- seventh t central: The third leading q-exponent 143/168 has phase ζ₁₆₈⁻²⁵, since 143≡−25 modulo 168.

### Examples

The third-order T-matrix exchanges its last two entries with factor ζ₃, rather than acting diagonally. The fifth-order vectors have opposite shadows, so their sum is weakly holomorphic. The seventh-order vector uses the order (F₀,F₂,F₁).

### Dependencies

§2.1; §1.4; §1.6; §4.3; §5.7; §6.1; §6.2; §8.2; §8.7; Mathlib `jacobiTheta₂`; §5.2; TauCetiRoadmap.ThetaSeries Layers 2–3; HabiroCyclotomicCompletions §1.1; §2.4; §7.2; §7.5; TauCetiRoadmap.ClassicalArithmeticCompletion §§4.40, 4.61; §10.3a; §2.7; §7.4; §2.6; §10.1a; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3.

## Layer 11: rank specializations at every root of unity

### 11.2 completion at nontrivial roots of unity

Construct completion at nontrivial roots of unity as follows. For rational α∉ℤ, let ξ=e(α), D=exp(−πiα)−exp(πiα), q=e(τ), and hα=q^(−1/24)R_rank(ξ;q). Define Fα=hα−(D/2)q^(−1/6)[ξ⁻¹R(τ+3α;3τ)−ξR(−τ+3α;3τ)]. Equivalently, off the separate polar terms, Fα/D=−η(3τ)³/(η(τ)ϑ_Z(3α;3τ))+q^(−1/6)[ξ⁻¹μHat_Z(3α,−τ;3τ)−ξμHat_Z(3α,τ;3τ)], using the normalization comparison in 5.7. When 3α∈ℤ, prove cancellation of the principal parts in this combined expression before specialization; the defining correction expression itself remains regular. (Zagier2009, Theorem 7.1 and proof, lines 929–951; formula derived from line 937 with the 5.7 normalization; BringmannOno2006 Theorem 2.1 fixes the ξ=−1 witness; Zagier2009 line 929.)

The public laws are:

- The displayed normalized Lerch expression, derived by splitting 1/(1−x) into (1+x+x²)/(1−x³).
- ξ_(1/2)Fα=D/(2√6)·Σ_(n∈ℤ)χ₁₂(n)n exp(πinα)q^(n²/24), where χ₁₂ is the primitive quadratic character of conductor 12.
- Pole cancellation extends the identity to nonintegral α with 3α integral.
- For every t>1 there exist a congruence subgroup Γ_t of finite index and a common weight-1/2 multiplier χ_t such that F_(j/t)(γτ)=χ_t(γ)√(cτ+d)F_(j/t)(τ) for every 1≤j<t and γ∈Γ_t, with the fixed square-root convention. The same subgroup works after reducing j/t to lowest terms and includes the removable order-three specializations. Induction exports the finite vector representation.
- no numerical level is prescribed.

For the proof, split the denominator in §10.1a by 1/(1−x)=(1+x+x²)/(1−x³). The two noncentral terms give the μ functions with opposite theta signs; the central term uses the imported Kronecker identity. The native theta product gives ϑ_Z(τ;3τ)=−q^(−1/6)η(τ), fixing both signs and q^(−1/6). Replacing μ by μHat yields the stated correction. Express it as C(1/6,3α−1/2;3τ) and C(5/6,3α−1/2;3τ), differentiate using 6.1, and collect the two progressions to obtain χ₁₂ and the exact shadow. Apply the rational-characteristic law from 6.3, including the scaling τ↦3τ; Intersect the finitely many congruence stabilizers and the kernels of their finite rational-characteristic phase differences to obtain Γ_t and a common χ_t, including the central eta/theta quotient; use the full transformed Lerch expression of Zagier2009 Theorem 7.1, not only characteristic preservation. All-cusp growth follows from the transported expansions. The fractional prefactor and the opposite signs are determined by the bilateral identity and the ξ=−1 third-order witness.

*Needs:* §10.1a; §5.7; §6.3; §10.2; §8.7.

**Checks.**

- rank even root: At α=1/2, Fα=q^(−1/24)f(q)−2C(1/6,0;3τ), agreeing with H₃’s first component.
- rank cubic root: At α=1/3 the separate θ and μ terms have poles, but their sum and Fα have removable limits.
- rank root shadow: At ξ=−1 the shadow is √(2/3)·Σ_(n≡1 mod 6)nq^(n²/24), which is nonzero.
- rank level lower unipotent: At t=2, N=2592·2²=10368 and γ=[[1,0],[N,1]], γ₃=[[1,0],[N/3,1]], the S,T eta laws give ν_eta(γ)=exp(−πiN/12)=1 and ν_eta(γ₃)=exp(−πiN/36)=1. The rational-characteristic phase is 3N/4=7776∈2ℤ. This checks one element with c≠0; the group-level law remains the existence assertion for Γ_t.
- rank trivial root: At ξ=1, h=η⁻¹ has weight −1/2 and the nontrivial-root assertion is not applied.

### 11.3 mock modularity of rank-residue deviations

Prove mock modularity of rank-residue deviations with the following hypotheses. For every t>0 and r∈ZMod t, the series Σ_(n≥0)(N(r,t,n)−p(n)/t)q^(n−1/24) is the holomorphic part of (1/t)Σ_(j=1)^(t−1)ζ_t^(−rj)F_(j/t). Its shadow is exactly the corresponding antilinear finite combination of 11.2’s shadows. It has weight 1/2 on the congruence subgroup Γ_t with the common scalar multiplier χ_t supplied by §11.2; induction also gives the full finite characteristic representation; all rational cusps are included. At t=1 take Γ₁=Mp₂(ℤ) and χ₁=ν_eta; the object and its shadow are zero. (Zagier2009, Corollary following Theorem 7.1, pp. 986–17–18, lines 952–965; Zagier2009 line 952.)

The public laws are:

- The displayed filtered completion.
- Apply conjugation to ζ_t^(−rj)/t when taking the shadow.
- For t=1 the empty nontrivial-root sum is zero.

For the proof, separate the j=0 term in the finite filter 4.4 and substitute the actual completions from 11.2. The common scalar multiplier χ_t proved in 11.2 permits this linear combination; apply xi antilinearly, and the inherited cusp bounds to the finite sum.

*Needs:* §4.4; §11.2; §8.7.

**Checks.**

- rank residue one: N(0,1,n)−p(n)=0 for every n.
- rank residue two: For t=2 the two deviations are ±(1/2)q^(−1/24)f(q), with opposite nonzero shadows.
- rank residue conjugate: For nonreal ζ_t, a complex-linear shadow filter would use the wrong residue phase.

### Examples

At ξ=−1 the rank completion is the first component of H₃, including its factor −2 in the unary correction. At ξ=1 the shifted partition series equals η⁻¹ and has weight −1/2. Roots of order 3 require removable cancellation in the individual Lerch summands.

### Dependencies

§4.3; §2.4; TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §4.3; §5.7; §6.3; §10.2; §8.7; §4.4; §10.1a.

## Downstream consumers

HabiroNahmSeries consumes the integer-indexed and formal-specialization APIs and the actual completion, cusp transformation and shadow objects. The consumer supplies its own Nahm data and admissibility conditions; this roadmap supplies no blanket modularity assertion for a Nahm sum and no evaluation on the unit circle from a disc identity. HabiroRings and HabiroCohomologyFoundations receive the finite/formal adapters; their completion and gluing theories remain with those consumers. CountingBundlesAndHallAlgebrasOfCurves target CB.1/nilpotent-matrix-count requests the q-binomial/Heine identity; §2.4 supplies its Euler/binomial input at the reciprocal finite-field cardinality. Its Jordan-centralizer mass reduction remains with that consumer. QWittVectors remains an independent algebraic producer. ModularForms, ThetaSeries, ClassicalArithmeticCompletion and the other suppliers retain their supply direction.

## References

Locators use the source identifiers and editions below. Zwegers2002 uses the thesis printed pages in arXiv v1; BruinierFunke2003 uses arXiv v4; Gasper1995, KnoppMason2009 and Warnaar2001 use arXiv v1. Zagier2009 uses the exposé page labels 986–NN; Pak2002 uses the author draft dated 18 September 2002; BringmannOno2006 uses the 23-page author version. All statements are specifications in the author’s own words.

- **GasperRahman2004**: George Gasper and Mizan Rahman. *Basic Hypergeometric Series, second edition* (2004). Sections 1.2 and 5.1, as bibliographic background; theorem targets use Gasper1995.
- **BFOR2017**: Kathrin Bringmann, Amanda Folsom, Ken Ono and Larry Rolen. *Harmonic Maass Forms and Mock Modular Forms: Theory and Applications* (2017), bibliographic background; theorem targets use Zwegers2002, BruinierFunke2003 and Zagier2009.
- **Zwegers2002**: Sander Zwegers. *Mock Theta Functions* (2002). Propositions 1.3–1.5, Theorems 1.11 and 1.16; Definition 2.1, Proposition 2.4, Corollary 2.9; Definitions 3.2/3.4/3.8, Theorem 3.9; Propositions 4.2–4.5, 4.10, 4.13–4.14. [open-repository](https://arxiv.org/abs/0807.4834v1).
- **Gasper1995**: George Gasper. *Lecture notes for an introductory minicourse on q-series* (1995). Equations (1.2.3), (1.2.7)–(1.2.8), (1.3.6)–(1.3.11), (2.1.3), (2.1.8)–(2.1.9), (2.2.1), (2.2.10), (3.1.6), (3.1.11)–(3.1.12), (4.2.11)–(4.2.12). [open-repository](https://arxiv.org/abs/math/9509223v1).
- **Zagier2009**: Don Zagier. *Ramanujan’s Mock Theta Functions and Their Applications* (2009). Sections 2, 5 and 7; Theorems 2.1 and 7.1; pp. 986–07, 986–12–14 and 986–16–18. [author-page](https://people.mpim-bonn.mpg.de/zagier/files/aster/326/fulltext.pdf).
- **Pak2002**: Igor Pak. *Partition bijections, a survey* (2002). Sections 2.2, 6 and 7. [author-page](https://www.math.ucla.edu/~pak/papers/psurvey.pdf).
- **BruinierFunke2003**: Jan Hendrik Bruinier, Jens Funke. *On Two Geometric Theta Lifts* (2002). Section 3, Proposition 3.2, Theorem 3.7 and Corollary 3.8. [open-repository](https://arxiv.org/abs/math/0212286v4).
- **AndrewsGarvan1988**: George E. Andrews and Frank G. Garvan. *Dyson’s crank of a partition* (1988). Section 1, equations (1.1)–(1.15), crank definition, Theorem 1 and Section 2; pp. 167–170. [publisher-open](https://www.ams.org/journals/bull/1988-18-02/S0273-0979-1988-15637-6/S0273-0979-1988-15637-6.pdf).
- **BevilacquaChandranChoi2019**: Erin Bevilacqua, Kapil Chandran, Yunseo Choi. *Ramanujan Congruences for Fractional Partition Functions* (2019). Introduction, p. 1, unnumbered prime-power congruences; lines 36–44. [open-repository](https://arxiv.org/abs/1907.06716v1).
- **Andrews1976**: George E. Andrews. *The Theory of Partitions* (1976). Chapters 1, 7 and 10. [DOI](https://doi.org/10.1017/CBO9780511608650).
- **Watson1938**: G. N. Watson. *Ramanujans Vermutung über Zerfällungsanzahlen* (1938). Hauptsätze 1, 3–4, pp. 98–99, lines 76 and 123–126; §§2–5 for proof filtrations; p. 98, line 108 for p(243) modulo 343. [open-repository](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0179/LOG_0012.pdf).
- **Atkin1967**: A. O. L. Atkin. *Proof of a conjecture of Ramanujan* (1967). Theorem 2, p. 14, line 28; Lemma 10 and (29)–(33), p. 23, lines 375–410; Lemmas 8 and 14 for integral filtrations. [publisher-open](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/71DCFFC35C9742F396BD35FDC848BDE5/S0017089500000045a.pdf/proof_of_a_conjecture_of_ramanujan.pdf).
- **BringmannOno2006**: Kathrin Bringmann and Ken Ono. *The f(q) mock theta function conjecture and partition ranks* (2006). Author version §2, (2.1)–(2.5) and Theorem 2.1, pp. 5–6, lines 270–337. [author-page](https://www.mi.uni-koeln.de/Bringmann/mock2-1.pdf).
- **Garvan1988**: Frank G. Garvan. *New combinatorial interpretations of Ramanujan’s partition congruences mod 5, 7 and 11* (1988). (1.27)–(1.29), pp. 50–51, lines 154–163; §§2–6 for vector-crank dissections; §8 for the rank-five comparison. [publisher-open](https://www.ams.org/journals/tran/1988-305-01/S0002-9947-1988-0920146-8/S0002-9947-1988-0920146-8.pdf).
- **Hickerson1988**: D. R. Hickerson. *On the seventh order mock theta functions* (1988). pp. 665–666, seventh-order Hecke identities. [DOI](https://doi.org/10.1007/bf01394280).
- **Andrews1986**: George E. Andrews. *The fifth and seventh order mock theta functions* (1986). Bailey’s Lemma (2.3)–(2.6), pp. 114–115, lines 93–110; Theorems 3–4, 9 and 13, pp. 118–119, 125 and 132–133, lines 241, 266, 450, 698; corrections specified by Zwegers2002 lines 4123–4124. [publisher-open](https://www.ams.org/journals/tran/1986-293-01/S0002-9947-1986-0814916-2/S0002-9947-1986-0814916-2.pdf).
- **AtkinSwinnertonDyer1954**: A. O. L. Atkin and P. Swinnerton-Dyer. *Some Properties of Partitions* (1954). pp. 84–106, complete rank dissections modulo 5 and 7. [DOI](https://doi.org/10.1112/plms/s3-4.1.84).

- **KnoppMason2009**: Marvin Knopp and Geoffrey Mason. *Logarithmic vector-valued modular forms* (2009), arXiv v1 §2.2, Lemma 2.1, Theorem 2.2 and Lemma 2.3, pp. 4–6, KnoppMason2009 line 220 (and lines 188–241). [arXiv](https://arxiv.org/abs/0910.3976v1).

- **Warnaar2001**: S. Ole Warnaar. *Partial-sum analogues of the Rogers–Ramanujan identities* (2001), arXiv v1, (1.3)–(1.4), pp. 1–2, and (1.6), p. 2; Warnaar2001 line 45 and Warnaar2001 line 92. [open-repository](https://arxiv.org/abs/math/0108193v1).
