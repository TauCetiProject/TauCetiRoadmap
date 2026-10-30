# Roadmap: sieve methods, prime gaps and prime patterns

**Summary.** Build weighted sieves from finite divisibility and local residue data, develop Brun and Selberg bounds and additive, character and quadratic large sieves, and use them to obtain maximal prime distribution, Maynard's prime clusters and Chen's prime-plus-almost-prime theorem. The same interfaces support polynomial sieves, binary quadratic values, conditional joint-spin cancellation and affine almost-prime saturation. Each application keeps its local obstructions, quantitative constants and analytic assumptions visible.

## Scope and ownership

This roadmap owns the sieve inequalities and their quantitative distribution interfaces. It also owns Vaughan's identity, the prime-tuple statement register, the tuple version of the W-trick, Maynard's variational argument, weighted almost-prime sieves, and the sieve-specific adapters for binary polynomials, polynomial vectors, number-field spin-sign distributions and affine orbits.

The native `BoundingSieve` and `SelbergSieve` carriers, weighted sums, signed remainders, upper-Möbius condition, squared Selberg weights and diagonalization are Mathlib inputs. Their constructions and existing upper inequalities are supplier contracts. Native `IsApproximateSubgroup`, its subgroup specialization and small-tripling construction are also consumed; §5.4 adds the quantitative measure theorem and squarefree product growth. Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv` also supply the coefficient parametrization and cardinality qʲ of degree-j monic polynomials; §0.10 retains only the irreducible-count and harmonic consequences. The finite-family and arbitrary-residue constructions below add preservation of indexed multiplicities and nonzero bad residue classes; they do not replace these carriers. An existing Selberg truncation level supplies no estimate on the remainders.

IntegralLattices Layers 0 and 3 own even-bilinear half-norms and integral local quadratic classification. Only the count-preserving rank-two conic comparison belongs here. GlobalNumberFields Layers 3/3C and 11 own generators, units, class representatives, orders and invertible ideals. ArithmeticDirichletSeries owns ideal norm fibres and ideal arithmetic functions; ClassFieldTheory Layer 14 owns Hilbert reciprocity; Chebotarev Layer 13 owns the principal-class natural prime count. None of these arithmetic theories is reconstructed as sieve data. Tau Ceti at the pins has `TauCeti.Multiquadratic.fundamentalDiscriminantChar`, the quadratic Dirichlet character of a fundamental discriminant; ThetaSeries §2H owns the Kronecker symbol and the character for every nonzero discriminant D≡0,1 mod 4. Layer 0 owns only its numerical natural-argument, real-valued sieve adapter, with zero value at zero and comparison for |D|>1. ErdosProgressionPowers §3.1 owns the uniform Gram-row, maximum-row and diagonal/off-diagonal inequalities; the weighted denominator inequality here is stronger and remains a target.

AnalyticNumberTheoryPartI §§0.10–0.11, 0.21, 0.26, 0.32, 1.2a, 3.22, 3.26, 3.34–3.35 supplies the quantitative prime, small-conductor, divisor-subpower and smooth-number inputs at their stated strengths. InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 owns fixed-model Lang–Weil. GeometryOfNumbersAndQuadraticArithmetic §4.1 owns general lattice counting, and AdelicAlgebraicGroups §4.2 owns algebraic-group strong approximation. The additional subgroup, analytic and curvature estimates are owned in §§0.11, 1.1, 2.7, 3.0 and 5.4.

AnalyticNumberTheoryPartII §5.29 owns the odd-squarefree quadratic large sieve, its primitive-real form and square-pair correction, uniformly in both cutoffs and arbitrary complex coefficients. Layer 2 retains the unrestricted bilinear consequence and prime-denominator applications. ArithmeticStatisticsPartV §3.30, “Conditional joint-spin prime bound”, owns the arithmetic setup, unit-averaged sequence, generator independence, Type I and Type II estimates and prime-ideal cancellation. Layer 5 retains the general short-character progression/subset transfer, the ideal-symbol comparison, the generic coefficient and prime-extraction interfaces, and the spin-sign equidistribution consequence. The generic prime-extraction theorem allows any bounded ideal sequence satisfying its two estimates; it does not reconstruct the supplied joint-spin chain.

The tuple W-trick here is a construction for Maynard weights. Layer 5 states the conjectural short-character input Cₘ and its reduced-conductor progression consequence; every spin conclusion retains Cₘ as a hypothesis. Elliott–Halberstam, the prime-tuple conjecture, Bouniakowsky and Schinzel H remain named conjectures. The general affine endpoint uses lazy walks on the same group whose squarefree congruence expansion is assumed. The explicit free-tree bound separately requires mixing for its chosen free subgroup.

The general subgroup reduction, squarefree-ring sum-product and noncommutative flattening inputs belong to §5.4; rational-point strong approximation in AdelicAlgebraicGroups §4.2 is consumed only at its stated strength. Curvature discrepancies (§0.11), uniform multiplicative means (§1.1), Jutila's unweighted mean (§2.7), reciprocal-totient moments and maximal small-conductor estimates (§3.0), and conductor-prime norm counts (§0.9) are owned here. The sliced-lattice, exceptional-tail and spin-kernel arguments are consumed within ArithmeticStatisticsPartV §3.30's conditional joint-spin theorem and have no second construction here.

## Conventions

Use real nonnegative sample weights and the native natural-number divisibility carrier. For a `BoundingSieve` write P=s.prodPrimes, X=s.totalMass, ν=s.nu, A_d=s.multSum(d), R_d=s.rem(d), and S=s.siftedSum. The integer P is nonzero and squarefree; ν is multiplicative on coprime arguments, with 0<ν(p)<1 for p|P. The parameter X is an approximation, not necessarily A₁, and is not positive unless a theorem says so. Thus R₁=A₁−X must be retained. Naturals and integers are cast to the indicated scalar field before division or real exponentiation.

Divisor finsets contain positive divisors; the native divisor finset of zero is empty. An indexed population can map repeatedly to one value, and its pushforward weight sums all fibres. Residue labels may delete empty local bad sets, but a full bad set is an obstruction handled before constructing a sieve with strict prime-density bounds. A zero sample value is divisible by every prime; it survives only when the sieve prime product is one.

The symbols ω(n) and Ω(n) count distinct prime factors and prime factors with multiplicity, respectively. Almost-primality always uses Ω. For example, ω(12)=2, Ω(12)=3, and 8 is not a P₂. Units may belong to an auxiliary at-most-almost-prime locus; Chen's final representations require 1≤Ω(m)≤2.

Write e(t)=exp(2πit)=`Real.fourierChar`(t), and d(t)=‖(t:`UnitAddCircle`)‖. Finite real frequency families are separated modulo one by δ>0 when d(xᵢ−xⱼ)≥δ for distinct labels. The inner product is conjugate-linear in its first argument. In particular, the Fourier vector uses e(−nx), so pairing it in the first argument with a coefficient vector yields Σaₙe(nx). At frequency −1 and x=1/4 the vector coordinate is i.

Every cutoff is specified locally: `Ioc(a,b)` means a<n≤b, a sieve prime range p<z is strict, and `remainderMass(s,D)` uses d<D. Empty sums and products are zero and one. Finite suprema over an empty index are zero where stated; maxima without a default require a nonempty index. Division is totalized in Lean; positivity or nonvanishing is supplied whenever its mathematical use requires it. The sine quotient for a geometric sum requires sin(πt)≠0; at integral t the squared finite sum is M².

Prime indices start at zero: pⱼ=`Nat.nth Nat.Prime` j. Prime counts include primes at the upper endpoint. Maynard's discrepancy is centred at π(x)/φ(q), whereas the arbitrary-function discrepancy uses the sum over integers coprime to q. Maximal von Mangoldt distribution is centred at y/φ(q) and includes prime powers. These three conventions are not interchangeable without their named transfer theorems.

Binary polynomials lie in ℤ[x₀,x₁]. Ordinary local densities count all residue zeros; corrected densities count smooth zeros and singular zeros with no lift. The quadratic discriminant character uses its explicit dyadic factor. At prime denominator two the separate Skorobogatov–Sofos symbol is one on odd numerators; it is not the Kronecker value. For conics the integral bilinear matrix is [[2a,b],[b,2c]], whose half-norm is ax²+bxy+cy². Its discriminant is b²−4ac, with this sign fixed throughout.

All asymptotic constants are chosen after the fixed parameters listed in the statement and before the varying population, cutoff or modulus. In particular, Maynard uses fixed 0<δ<θ/2, and the extremely-smooth estimate fixes α before its constant. A geometric bound, a remainder bound and a conjectural character bound each remain separate inputs.

## Exact supplier contracts

These are the precise inputs required from each owner. Only the stated exports are consumed. Subgroup strong approximation, maximal character estimates and curvature-uniform lattice errors are owned below. The analytic requirement subsections identify where each input is consumed. Additional analytic and geometric statements are targets of the layers below.

### From Mathlib

The pinned APIs are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The local *Needs* sentences identify the declarations used. Continuous and L² functions, integrals, finite measures, `Asymptotics.IsBigO`, real powers and Gamma functions use existing Mathlib carriers. Unit-interval and simplex integrals retain their measures and integrability hypotheses.

Reuse the native sieve declarations described under Scope and ownership: `BoundingSieve.multSum`, `rem`, `siftedSum`, `mainSum`, `errSum`, `multSum_eq_main_err`, `siftedSum_eq_sum_support_mul_ite`, `IsUpperMoebius`, `siftedSum_le_mainSum_errSum_of_upperMoebius`, `lambdaSquared`, `upperMoebius_lambdaSquared`, `selbergTerms` and `mainSum_lambdaSquared_eq_sum_mul_sum_sq`. The squared-weight upper inequality needs normalization at one; its diagonal identity does not choose an optimizer or bound the absolute remainder.

For simplex mollification, use the supremum norm on `Fin k → ℝ`: `Pi.norm_def` and `norm_le_pi_norm` in `Mathlib/Analysis/Normed/Group/Constructions.lean` (lines 310 and 346). Use `ContDiffBump.normed`, `ContDiffBump.integral_normed` and `ContDiffBump.tsupport_normed_eq` from `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean` (lines 32, 68 and 76) with Lebesgue measure; the normalization denominator is positive by `ContDiffBump.integral_pos` (line 63). For affine escape, `Nat.exists_prime_lt_and_le_two_mul` from `Mathlib/NumberTheory/Bertrand.lean` (line 222) supplies a prime between n and 2n for n≥1.

For finite polynomial counts, use `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv` from `Mathlib/RingTheory/Polynomial/Basic.lean` (lines 141 and 114): their composition identifies monic polynomials of degree j over a finite field with its j coefficient choices. Neither equivalence counts irreducibles.

Reuse native `ArithmeticFunction`, Dirichlet convolution, Möbius, von Mangoldt, Liouville, multiplicative functions, prime-factor finsets and lists, `Nat.IsAtMostAlmostPrime`, `Nat.primeCounting`, totients and prime enumeration. Reuse `Matrix.gram`, finite Euclidean spaces, inner products, the period-one additive circle and Fourier characters. For characters use `DirichletCharacter`, its conductor, primitive-character reduction, Gauss sums and unit-group orthogonality, including modulus one. Native finite fields, `Polynomial`, `MvPolynomial`, derivatives, Schwartz–Zippel, power series, ideal factorization, absolute norms and finite residue-field quadratic characters provide the algebraic carriers. They supply none of the analytic large-sieve or prime-distribution conclusions specified below.

For approximate groups use `IsApproximateSubgroup`, `IsApproximateSubgroup.subgroup` and `IsApproximateSubgroup.of_small_tripling` from `Mathlib/Combinatorics/Additive/ApproximateSubgroup.lean` (lines 63, 119 and 127). The native fields are identity membership, invariance under inversion and a bound on the number of translates covering the square. They include no finiteness or probability-mass hypothesis; §5.4 states those separately.

For the finite-character Gram estimate use `AddChar.sum_eq_zero_of_ne_one` and `AddChar.sum_eq_card_of_eq_one` from `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:240` and `:250`: summing a character over a finite additive group gives zero for a nontrivial character and its cardinality for the trivial one. The quotient here is the product of two copies of ZMod a, of cardinality a².

### From Tau Ceti

For ideal coefficients consume `TauCeti.IdealArithmeticFunction.vonMangoldt` and `TauCeti.IdealArithmeticFunction.norm_vonMangoldt_le_log` from `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean` (lines 84 and 180). The carrier is nonzero integral ideals, the codomain is ℂ, its values are real and nonnegative, and the norm bound is log of the absolute norm. For τ_K use the real value of native ideal convolution of the constant-one function with itself: `TauCeti.IdealArithmeticFunction.convolution_one_one_apply` in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution.lean:369` identifies it with the ideal divisor count. This convolution is distinct from pointwise multiplication. The ideal divisor-subpower and coefficient-moment estimates in §5.6 add analytic strength beyond these identities.

The pinned comparison is `TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD` in `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`, with the explicit proof hD.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

Use §0.32 at q=1 for the prime number theorem with every fixed logarithmic saving; §0.10 for primes in a fixed multiplicative interval; §0.11 for Σ_(p≤x)(log p)/p=log x+O(1); §0.21 for reciprocal-prime Mertens and uniform intervals; §§0.26 and 0.31 for positive prime Euler products; §0.32 for Siegel–Walfisz in its stated range; and §§3.1, 3.26 for divisor subpower bounds. The additional uniform analytic statements are targets below. In particular, no small-conductor estimate is inferred from Bombieri–Vinogradov itself.

Use §3.34, `smoothCount_dickman`, for the fixed-parameter positive-density count and §3.35, “Rankin smooth-number upper bound”, for the Rankin estimate with x≥1,y≥2,σ>0. The native count is positive integers only: #Nat.smoothNumbersUpTo(N,z+1)≤N^δ∏_(p≤z)(1−p^(−δ))⁻¹ for δ>0. Treat N=0, z=0,1 and N<1 directly. Distinct integers are counted once. The extremely-smooth tail is proved in §1.4 from the Rankin estimate.

Use §3.22 for the summatory divisor bound and §1.2a for Σ_(n≤Y)τ(n)²≪Y log³(2Y), obtained from τ²≤τ₄ and three harmonic sums. These are the divisor inputs to Jutila’s argument.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

Use §5.29 for the odd-squarefree quadratic large sieve and its primitive-real and square-pair versions: for every ε>0 the constant is uniform in M,N≥1 and all complex coefficients. Both odd squarefree ranges include 1; the square-pair version retains all pairs whose product is square. For M=1,N=3 and a₁=1,a₃=−1 the squared sum is 0 and energy is 2; with a₃=1 they are 4 and 2.

### From TauCetiRoadmap.ArithmeticStatisticsPartV

Use §3.30, “Conditional joint-spin prime bound”, with a fixed finite Galois K/ℚ of degree n, nonempty inverse-disjoint S, the positive-unit square hypothesis in the totally real case, and its fixed class representatives, modulus F and unit-square-invariant residue weight ψ. It supplies the unit-averaged ideal sequence, generator independence, Type I uniformly in every nonzero ideal m, Type II for coefficients bounded by 1, and prime cancellation under C_(|S|n). The Type I saving is δ/(54n|S|²), the Type II exponents are 1/(6n), and prime cancellation saves δ/[54|S|²n(12n+1)]. The totally complex sequence retains every torsion/free-unit coset; constants depend on fixed ψ and auxiliary choices. At n=3,|S|=1,δ=1 the prime saving is 1/5994; ψ=0 gives the zero sequence; an involution cannot belong to S.

For the supplied kernel reciprocity comparison, write Φ(α,β)=∏_(σ∈S)(α/[σ(β)σ⁻¹(β)])_(K,2). When the exchanged kernels are nonzero, the factor in Φ(α,β)=ε(α,β)Φ(β,α) is ∏_(σ∈S,v|2∞)(α,σ(β))_v(α,σ⁻¹(β))_v. A shared odd denominator prime makes both exchanged kernels zero. On totally positive generator domains the infinite factors are 1; for totally complex fields there are no real factors (KM-21 §4, (4.3), properties (P1)–(P3), lines 1238–1276; FIMR-13 Lemma 2.1).

**Checks.**

- In ℚ(t), t³+t²−2t−1=0, with σ(t)=t²−2, S={σ}, α=1+8t and β=1+16σ(t), the norms are 377=13·29 and 3569=43·83. Choose the two ideal-class representatives over 41 and 71; their resulting F is coprime to both norms. Both residues are 1 modulo 8, but Φ(α,β)=1 and Φ(β,α)=−1. The dyadic factors are 1 and the infinite factor is −1, giving 1=(−1)(−1).
- In that field Φ(α,1)=Φ(1,α)=1. Residue data alone would assign the same exchange sign to this pair and the preceding pair.
- With α=β=3, both kernels vanish. Cancelling a kernel without its nonvanishing hypothesis would be invalid.


### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Use GeometryOfNumbersAndQuadraticArithmetic §4.1 for its Henk and Davenport bounds. Curvature-uniform errors belong to §0.11; the sliced-domain and codimension-two estimates used by joint spins belong to ArithmeticStatisticsPartV §3.30.

### From TauCetiRoadmap.AdelicAlgebraicGroups

AdelicAlgebraicGroups §4.2 supplies strong approximation for algebraic-group rational points; the finitely generated subgroup theorem and finite-ring expansion inputs belong to §5.4.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 supplies fixed-model Lang–Weil; the uniform finite-presentation version is a §5.4 target.

### From TauCetiRoadmap.IntegralLattices

IntegralLattices Layers 0 and 3 supply even-bilinear half-norms and integral local GL₂ changes, including dyadic cases; Layer 0 here supplies the residue bijections.

### From TauCetiRoadmap.GlobalNumberFields

GlobalNumberFields §§3, 3C supplies generator domains, units and class representatives away from fixed moduli; Layer 11 supplies quadratic orders and invertible ideals, with extension/contraction only away from the conductor. The conductor-prime norm counts are constructed in §0.9.

### From TauCetiRoadmap.ArithmeticDirichletSeries

[ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) Layers 1–2 supply maximal-order ideal norm fibres and convolution, and Layer 5 supplies prime-power and higher-residue-degree removal. The ideal divisor and logarithmic coefficient estimates are owned in §5.6 here.

### From TauCetiRoadmap.ClassFieldTheory

ClassFieldTheory Layer 14 supplies cohomological Hilbert reciprocity.

### From TauCetiRoadmap.QuadraticFormInvariants

QuadraticFormInvariants §6C supplies `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` and the odd, dyadic and infinite local symbols. The ideal-symbol reciprocity adapter in §5.6 compares them.

### From TauCetiRoadmap.Chebotarev

Chebotarev Layer 13 supplies the principal-class natural prime count ∼li(X)/h_K.

### From TauCetiRoadmap.ThetaSeries

ThetaSeries §2H supplies `kroneckerSym` and `kroneckerChar`; use only their natural-argument real adapter in §0.6.

### From TauCetiRoadmap.ErdosProgressionPowers

ErdosProgressionPowers §3.1 supplies the uniform-row, maximum-row and diagonal/off-diagonal finite Gram inequalities, including empty families. For x=1,y=(1,2) the unweighted left side is 5 and maximal row is 6; two repeated unit vectors give 2=2, while an empty family gives 0≤B for B≥0. §0.4 here supplies the weighted denominator theorem.

### From TauCetiRoadmap.Isoperimetry

Isoperimetry I2 supplies convex-body isoperimetry.

### From TauCetiRoadmap.RiemannianGeometry

RiemannianGeometry R4.9.6a supplies signed planar turning and the tangent-angle comparison for smooth Jordan curves. Their specialization and C² approximation give the curvature-to-area comparison of §1.4.

### Short-character conjecture owned in Layer 5

For each integer m≥3, Cₘ asserts that some δ(m)>0 has this property: for every ε>0 there is C(m,ε)>0 such that every integer Q≥3, real nonprincipal Dirichlet character χ of modulus 1<q≤Q, integer interval origin M and integer length 0≤N≤Q^(1/m) satisfy

`|Σ_(M<n≤M+N)χ(n)| ≤ C(m,ε) Q^((1−δ(m))/m+ε)`.

This is the explicitly conjectural uniform-modulus input of KM-21 §2.5, Conjecture Cₙ (KM-21 lines 340–345), also used in FIMR-13 §9. It includes imprimitive characters. Taking ε=δ(m)/(2m) gives an ε-free exponent after replacing the saving by δ(m)/2; δ in the spin endpoints denotes that smaller saving. The reduced-conductor progression corollary and subset transfer are §5.3 targets here: for odd squarefree q>1 and q∤k, retain q/gcd(q,k)>1. Passing from C_(tn) to C_(|T|n) partitions intervals and replaces δ by δ|T|/t. Every dependent conclusion retains this input.



## How to read the build

Layer 0 establishes finite weighted identities, local-density adapters, dimension predicates and finite Gram inequalities. Layer 1 builds Brun and Selberg bounds and their polynomial and binary applications; the convex-domain Gram estimate precedes those applications. Layer 2 develops Fourier and character large sieves, Vaughan's identity, quadratic estimates and the sharp variants. Layer 3 obtains maximal distribution and its first- and second-moment transfers. Layer 4 combines that distribution with Maynard's multidimensional weights, exact variational certificates and admissible tuples. Layer 5 follows three branches: weighted almost primes and Chen, conditional ideal spins, and affine saturation. Read each claim with its local hypotheses and its *Needs* sentence. Construction and analytic proof requirements remain part of the mathematics; an imported near miss does not supply a stronger contract. `Suggested.lean` states the headline theorems statable on the pinned carriers and only the simple definitions they require. This README specifies the entire build.



## Layer 0: finite weighted sieves and local data

Finite identities come before analytic estimates. The weighted carrier permits signed coefficients but only nonnegative sample weights. The local-count branch distinguishes smooth lifting from singular zeros without lifts, and the Gram branch allows dependence and zero rows.

### 0.1 weighted divisibility identities

Throughout this subsection, unless a statement says otherwise: s is the existing BoundingSieve: P=s.prodPrimes, A=s.support, w=s.weights, X=s.totalMass, nu=s.nu; A_d=s.multSum(d), R_d=s.rem(d), S=s.siftedSum. Divisors are positive natural divisors.

**Weighted divisibility interchange.** For every coefficient function c:N→R, `sum_{d|P}` c(d) A_d = `sum_{n in A}` w(n) `sum_{d|gcd(P,n)}` c(d).

c is arbitrary; its values need not be nonnegative.

([HB-SIEVES](#references), Section 1, p.5, interchange in (1.7).)

*Proof sketch.* Expand each A_d and interchange two finite sums; retain c(d) with its sign. For each n, divisibility by both P and n is equivalent to divisibility by gcd(P,n). Since P is nonzero and gcd(P,n) divides P, apply Nat.divisors_filter_dvd_of_dvd to identify the inner finite set.

For P=1 this reduces to c(1) times the total support weight, including a possible weight at zero. For P=6 the four divisor coefficients account separately for 1,2,3,6; no coprimality condition is imposed on n.

*Needs:* Mathlib `BoundingSieve`; Mathlib `BoundingSieve.multSum`; Mathlib `BoundingSieve.prodPrimes_ne_zero`; Mathlib `Nat.divisors_filter_dvd_of_dvd`.

**Exact Legendre sieve identity.** S = `sum_{d|P}` mu(d) A_d, where mu is the existing integer Möbius function cast to R.

([HB-SIEVES](#references), Section 1, p.2, equation (1.1).)

*Proof sketch.* Specialize the weighted interchange to c(d)=mu(d). The existing identity mu*zeta=1, evaluated using the existing convolution-with-zeta formula and arithmetic-function unit, gives `sum_{d|r}mu(d)=1` if r=1 and zero otherwise. Set r=gcd(P,n) and identify the existing sifted-sum indicator. This also covers n=0, since P is nonzero.

Empty support gives zero; P=1 returns all support weight. For support {1,...,10}, P=6 and unit weights, S=10-5-3+1=3. For support {0,1,2,3,6}, P=6 and unit weights, S=5-3-3+2=1: zero must be excluded.

*Needs:* Layer 0 §0.1 weighted divisibility interchange; Mathlib `BoundingSieve.siftedSum_eq_sum_support_mul_ite`; Mathlib `ArithmeticFunction.coe_moebius_mul_coe_zeta`; Mathlib `ArithmeticFunction.coe_mul_zeta_apply`; Mathlib `ArithmeticFunction.one_apply`.

**Euler-product main term with signed remainder.** S = X `product_{p in primeFactors(P)}(1-nu(p))` + `sum_{d|P}` mu(d)R_d.

No sign assumption on X and no normalization X=A_1 is added.

([HB-SIEVES](#references), Section 1, p.3, (1.2)-(1.3).)

*Proof sketch.* Substitute A_d=nu(d)X+R_d into the exact Legendre identity, distribute the finite sum and factor out X. Apply the existing squarefree multiplicative Euler-product identity with f=nu and n=P. Keep the remainder sum signed.

For P=1 the identity reads A_1=X+R_1. For P=6 the signed error is R_1-R_2-R_3+R_6.

*Needs:* Layer 0 §0.1 exact legendre sieve identity; Mathlib `BoundingSieve.multSum_eq_main_err`; Mathlib `ArithmeticFunction.IsMultiplicative.prodPrimeFactors_one_sub_of_squarefree`.

**Absolute Legendre error bound.** |S-X `product_{p in primeFactors(P)}(1-nu(p))|` <= `sum_{d|P}|R_d|.`

([HB-SIEVES](#references), Section 1, p.3, Corollary 1.1.)

*Proof sketch.* Subtract the Euler-product term in the exact identity. Apply the triangle inequality to the finite signed sum. Every d dividing squarefree P is squarefree, so |mu(d)|=1. Do not drop the divisor d=1 unless the additional normalization X=A_1 has actually been proved.

With P=1, A_1=10 and X=7 the error is exactly |R_1|=3. The right-hand side is nonnegative even when X is negative.

*Needs:* Layer 0 §0.1 euler-product main term with signed remainder; Mathlib `BoundingSieve.squarefree_of_mem_divisors_prodPrimes`; Mathlib `ArithmeticFunction.abs_moebius_eq_one_of_squarefree`.

**Lower sieve coefficient inequality.** If c:N→R satisfies `sum_{d|r}` c(d) <= `1_{r=1}` for every r dividing P, then `sum_{d|P}c(d)A_d` <= S.

The displayed lower coefficient condition is required only for positive divisors r of this P, not for all naturals.

([HB-SIEVES](#references), Section 1, p.5, (1.5), compared with derivation (1.7).)

*Proof sketch.* Apply the coefficient condition at r=gcd(P,n), which divides P. Multiply the pointwise inequality by the nonnegative w(n), sum over the finite support and use the weighted interchange. Use the existing coprimality-indicator presentation of S. Coefficients c may have either sign.

c=mu on the divisors of P gives equality. For P=1 the coefficient condition is just c(1)<=1, and the result applies to any nonnegative weight at zero.

*Needs:* Layer 0 §0.1 weighted divisibility interchange; Mathlib `BoundingSieve.siftedSum_eq_sum_support_mul_ite`.

**Lower main term minus absolute remainder.** Under the lower coefficient condition, X mainSum(c) - errSum(c) <= S, using exactly the existing mainSum and errSum.

For every r dividing P, `sum_{d|r}c(d)<=1_{r=1}.`

([HB-SIEVES](#references), Section 1, p.5, (1.5) and the main/error calculation (1.7)-(1.8).)

*Proof sketch.* Expand each A_d in the lower coefficient inequality and collect X sum c(d)nu(d). For every d, c(d)R_d >= -|c(d)||R_d|. Sum this inequality and identify the existing error term. No multiplication of an inequality by X occurs, so no nonnegativity hypothesis on X is needed.

The zero coefficient function yields the elementary inequality 0<=S. Choosing c=mu recovers the lower half of the absolute Legendre estimate. Opposite coefficient signs do not permit cancellation inside errSum.

*Needs:* Layer 0 §0.1 lower sieve coefficient inequality; Mathlib `BoundingSieve.mainSum`; Mathlib `BoundingSieve.errSum`; Mathlib `BoundingSieve.multSum_eq_main_err`.

**Remainder bound at a coefficient cutoff.** Let D be a natural number and C a nonnegative real. If c(d)=0 for every d|P with D<d, and |c(d)|<=C for d|P with d<=D, then errSum(c)<=C `sum_{d|P,d<=D}|R_d|.`

D>=0 is an integer cutoff; the bound includes d=D. The support and absolute-coefficient assumptions are both necessary inputs; they are stated explicitly, not packaged in a new predicate.

([HB-SIEVES](#references), Section 1, p.5, (1.8); Section 2, p.7, support condition before the quadratic-form calculation.)

*Proof sketch.* Split the divisor sum into d<=D and D<d. The latter terms vanish by the support condition. On each remaining term multiply |c(d)|<=C by the nonnegative |R_d| and sum. Factor out C. This is exact finite bookkeeping; a separate family estimate is required to bound the remaining sum asymptotically.

For D=0 the supported divisor coefficients all vanish, so errSum=0. For c(1)=1 and c(d)=0 at every other divisor, errSum=|R_1|; D=1 does not remove mass error. If P=6, c(2)=1, c(3)=-1, other divisor coefficients zero, and R_2=R_3=1, the error equals 2, not zero.

*Needs:* Mathlib `BoundingSieve.errSum`.

**First Bonferroni lower sieve bound.** A_1 - `sum_{p in primeFactors(P)}` A_p <= S.

([KED-ANT-11](#references), Section 11.2, Lemma 11.1 and its pointwise proof; compare Heath-Brown p.5 (1.5).)

*Proof sketch.* For each n, let k count the sieving primes dividing n. If gcd(P,n)=1 then k=0; otherwise the existing prime-divisor existence theorem gives a prime dividing both P and n, so k>=1. Thus `1-k<=1_{gcd(P,n)=1}.` Multiply by the nonnegative weight and sum over support. Interchange the finite prime and support sums to identify A_1 and the A_p terms.

For P=1 there are no sieving primes, so equality holds. For support {6}, P=6 and weight 1 at 6, the left side is -1 and S=0. This bound can be negative; it does not imply a positive lower bound for primes or evade sieve parity.

*Needs:* Mathlib `BoundingSieve.multSum`; Mathlib `BoundingSieve.siftedSum_eq_sum_support_mul_ite`; Mathlib `BoundingSieve.prodPrimes_ne_zero`; Mathlib `Nat.ne_one_iff_exists_prime_dvd`; Mathlib `Nat.mem_primeFactors_of_ne_zero`.

### 0.2 weighted finite families

Throughout this subsection, unless a statement says otherwise: s is an existing BoundingSieve; A is a finite set of indices in any type; f maps indices to naturals; w is real-valued and nonnegative on A. No injectivity or positivity of f is assumed.

**Weighted finite-family sieve.** Construct s.ofFiniteFamily(A,f,w) as a BoundingSieve with support f(A), weight at n equal to `Σ_{a∈A,f(a)=n}w(a),` and the same prime product, density and approximate mass as s.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Construction.* Use the existing BoundingSieve record, replacing only support and weights by the displayed finite image and fiber sums. Every fiber weight is nonnegative because all its indices belong to A. Retain the template's squarefreeness and both strict prime-density bounds unchanged. The projection and off-image API follow from the record and finite sums. For identity-family compatibility, interchange finite fibers using the existing additive fiber theorem; only observables, not unrestricted off-support weights, agree.

The definition exposes the following operations and laws:

- The new support is the finite image f(A).
- For every natural n the weight is `Σ_{a∈A,f(a)=n}w(a),` including repeated labels and zero labels.
- The prime product is exactly the template's prime product.
- The approximate mass is exactly the template's arbitrary real mass X.
- The entire multiplicative density function is exactly the template's density.
- If n is outside the finite image f(A), its new weight is zero.
- Taking A equal to the template support, f the identity and w the template weights preserves its sifted sum. Equality of the full records is not asserted: the original may have nonzero weights outside its support.

**Checks.**

- Two indices mapping to 7, of weights 2 and 3, give weight 5 at 7, not 1, 2 or 3.
- An empty index set gives sifted sum zero for any template.
- Using the template support, identity label and original weights preserves multSum(1).
- The seven parameters 2≤n≤8 map under n(10−n) to four distinct values, but their unit-weight pushforward has multSum(1)=7, not 4.

All repeated labels contribute to the weight; this is not an unweighted image sieve. The map may take the value zero. Its divisibility and survival follow the existing natural conventions. Replacing a population does not prove that the retained X approximates its mass.

*Needs:* Mathlib `BoundingSieve`; Mathlib `Finset.prod_fiberwise_eq_prod_filter`.

**Divisibility sums of a weighted family.** For every natural d, multSum(d) of s.ofFiniteFamily(A,f,w) equals `Σ_{a∈A,d|f(a)}w(a).`

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Expand only the new support and weights and the existing multSum. Use Finset's generated additive fiberwise identity on the finite image restricted by d dividing the image value. An index lies over that restricted image exactly when d divides its label; no injectivity is used. In particular d=0 picks exactly zero labels.

At d=1 the result is the total indexed weight, not the cardinality of the image. At d=0 retain all indices whose label is zero.

*Needs:* Layer 0 §0.2 weighted finite-family sieve; Mathlib `BoundingSieve.multSum`; Mathlib `Finset.prod_fiberwise_eq_prod_filter`.

**Sifted sums of a weighted family.** The sifted sum of s.ofFiniteFamily(A,f,w) equals `Σ_{a∈A,gcd(s.prodPrimes,f(a))=1}w(a).`

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Expand the carrier's sifted sum and restrict the finite image by coprimality with the unchanged prime product. Apply the existing finite fiber-sum identity. The preimage of this restricted image is exactly the displayed subset of A. No information about ν or X is used in this equality.

When the prime product is 1, even zero labels survive. For any larger prime product zero labels are removed, but their multiplicities still appear in divisibility sums.

*Needs:* Layer 0 §0.2 weighted finite-family sieve; Mathlib `BoundingSieve.siftedSum`; Mathlib `Finset.prod_fiberwise_eq_prod_filter`.

### 0.3 residue labels and residue-class sieves

Throughout this subsection, unless a statement says otherwise: A is a finite index set, x maps indices to integers, w is real-valued and nonnegative on A, Q is a finite set consisting of primes, Ωp is a finite subset of ZMod p for each natural p, card(Ωp)<p for p∈Q, and X is an arbitrary real. Write ρ(p)=card(Ωp)/p, Q+= {p∈Q : Ωp is nonempty}, `P=∏_{p∈Q+}p` and `L(b)=∏_{p∈Q,b mod p∈Ωp}p.` All products are finite, with empty product 1. These are local expressions, not new carriers or functions here.

**Prime divisibility of a residue label.** Let Q be a finite set of primes and Ωp a finite subset of ZMod p. For any integer a and p∈Q, p divides `L(a)=∏_{q∈Q,a mod q∈Ωq}q` if and only if a mod p belongs to Ωp.

No properness, nonemptiness, sign or interval condition is needed for Ω or a.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* The factors in L(a) are distinct primes, so the existing primeFactors_prod theorem identifies its prime-factor set with the defining filtered set. The product is nonzero, including when the filter is empty. Apply prime-factor membership at the prime p and use p∈Q to eliminate the redundant membership condition.

The result handles negative integers by the existing integer cast to ZMod. An empty bad set can never contribute its prime to the label.

*Needs:* Mathlib `Nat.primeFactors_prod`; Mathlib `Nat.mem_primeFactors_of_ne_zero`.

**Simultaneous local conditions as divisibility.** Under the same finite prime data, for every d dividing `∏_{p∈Q}p` and every integer a, d divides L(a) if and only if a mod p belongs to Ωp for every p∈primeFactors(d).

The divisor hypothesis is on the squarefree prime product; d=1 is allowed, and d=0 is excluded by that hypothesis.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Distinct primes are pairwise coprime, so the existing squarefree-product theorem makes the ambient product squarefree; hence its divisor d is squarefree. Replace d by the product of its prime factors. Use prod_primeFactors_dvd_iff and primeFactors_prod to translate divisibility into containment of prime supports. Every prime of d already lies in Q because d divides the ambient product, leaving precisely the displayed simultaneous residue conditions.

At d=1 the local condition is vacuous and every label is divisible by d. Do not extend to d=4 with Q={2}: a label containing the prime 2 once is not divisible by 4.

*Needs:* Mathlib `Finset.squarefree_prod_of_pairwise_isCoprime`; Mathlib `Nat.coprime_primes`; Mathlib `Nat.coprime_iff_isRelPrime`; Mathlib `Nat.prod_primeFactors_of_squarefree`; Mathlib `Nat.prod_primeFactors_dvd_iff`; Mathlib `Nat.primeFactors_prod`.

**Local avoidance as coprimality.** For the same data, `gcd(∏_{p∈Q}p,L(a))=1` if and only if a mod p is outside Ωp for every p∈Q.

Q consists of primes; no assumption that the bad residue is zero. Empty and full local sets are allowed.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Use the finite-product coprimality equivalence to reduce to coprimality of each p∈Q with L(a). A prime is coprime to a natural number exactly when it does not divide it. Use prime-dvd-residue-label at each p and negate its equivalence.

Bad residue {1} modulo 2 keeps the original integer zero and removes one. The empty prime set gives label 1 and all samples survive.

*Needs:* Layer 0 §0.3 prime divisibility of a residue label; Mathlib `Nat.coprime_prod_left_iff`.

**Sieve with arbitrary excluded residue classes.** Construct BoundingSieve.ofResidueClasses(A,x,w,Q,Ω,X) with prime product P, multiplicative density prodPrimeFactors(ρ), approximate mass X, support the image of L∘x on A, and weights the sums over its fibers.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Construction.* Remove precisely the empty local sets to form Q+. The product P is squarefree by the existing distinct-prime product theorem. Use the existing arithmetic function prodPrimeFactors(ρ), not a new multiplicative-extension construction. Its prime value is ρ(p), and its value at zero is zero. For p∈Q+, nonempty Ωp gives ρ(p)>0; the properness hypothesis gives ρ(p)<1. Empty densities occur only outside P, where the carrier imposes no strict bound. Build the existing carrier with this prime/density/mass data and apply finite-family-sieve to the label map L∘x. This supplies global nonnegativity of the fiber weights. Verify the projection, prime-value and inactive-prime API directly. The error theorem uses the separate supported divisibility and sifted-sum laws.

The definition exposes the following operations and laws:

- The carrier's prime product is `P=∏_{p∈Q,Ωp nonempty}p;` empty local conditions are removed.
- The density is the existing arithmetic function prodPrimeFactors(ρ), with ρ(p)=card(Ωp)/p: ν(0)=0 and `ν(d)=∏_{p|d}ρ(p)` for d>0.
- The approximate mass equals the supplied real X, without a sign or normalization assumption.
- The support is the finite image of a↦L(x(a)), where `L(b)=∏_{p∈Q, b mod p∈Ωp}p.`
- At a natural n the weight is the sum of w(a) over indices a∈A with L(x(a))=n. Equal labels retain all their multiplicities.
- For every prime p, including those outside Q, ν(p)=card(Ωp)/p.
- If p∈Q and Ωp is empty, then p does not divide the carrier prime product. The zero density is not forced into a strictly positive carrier field.

**Checks.**

- With no sieving primes, three integer samples −1,0,1 of weight 2 give sifted sum 6, independently of unused residue data.
- For Q={2,3} and both local residue sets empty, the carrier has prime product 1 and all three weight-2 samples survive.
- For Q={2}, bad residue {1}, sample 0 of weight 2 and sample 1 of weight 3, the sifted sum is 2. A divisibility-only interpretation would incorrectly give 3.
- For Q={2,3}, empty bad set at 2 and bad residue {1} at 3, the prime product is 3 and the six unit-weight samples −2,…,3 have sifted sum 4.
- The existing prodPrimeFactors extension at a single bad residue modulo 2 has ν(4)=1/2, not 1/4. Complete multiplicativity is neither required nor asserted.

All-empty local data are valid and give P=1. Do not impose card(Ωp)>0 on the original Q. If a local set has card p, use full-residue-obstruction rather than forcing density 1 into this carrier. The chosen density extension is only multiplicative on coprime inputs: at prime powers it repeats no factor. On the squarefree divisors actually used, it is exactly the product of local densities. The natural labels record local membership, not the magnitude of the original integer samples; no linear cutoff follows.

*Needs:* Layer 0 §0.2 weighted finite-family sieve; Mathlib `Finset.squarefree_prod_of_pairwise_isCoprime`; Mathlib `Nat.coprime_primes`; Mathlib `Nat.coprime_iff_isRelPrime`; Mathlib `Nat.primeFactors_prod`; Mathlib `ArithmeticFunction.prodPrimeFactors`; Mathlib `ArithmeticFunction.IsMultiplicative.prodPrimeFactors`; Mathlib `ArithmeticFunction.prodPrimeFactors_apply`; Mathlib `Nat.Prime.primeFactors`.

**Divisibility sum equals the local intersection.** For s=ofResidueClasses(A,x,w,Q,Ω,X) and every d|s.prodPrimes, `s.multSum(d)=Σ_{a∈A,∀p∈primeFactors(d),x(a) mod p∈Ωp}w(a).`

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* The active prime product P divides the full Q prime product by finite-subset product divisibility, so d also divides the latter. Apply finite-family-multsum to the residue constructor's label map. Use divisor-dvd-residue-label at each index to identify the filter. For d=1 this is the entire indexed population.

The local conditions are simultaneous, not a sum of separate prime conditions. Repeated integer or label values remain weighted with all of their preimages.

*Needs:* Layer 0 §0.3 sieve with arbitrary excluded residue classes; Layer 0 §0.2 divisibility sums of a weighted family; Layer 0 §0.3 simultaneous local conditions as divisibility; Mathlib `Finset.prod_dvd_prod_of_subset`.

**Sifted sum equals the original local avoidance count.** For s=ofResidueClasses(A,x,w,Q,Ω,X), `s.siftedSum=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a).`

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Apply finite-family-siftedsum to the label map and active prime product. For each index, filtering Q by bad-residue membership already removes every empty Ωp. Thus its label equals the label formed using Q+. Apply residue-label-survival on Q+. Avoidance on Q+ is equivalent to avoidance on all Q because empty local sets cannot contain any residue.

Zero survives when it avoids the chosen residues; it is not automatically removed just because the carrier is a divisibility sieve. The mixed empty/nonempty example at negative integers has P=3 and sifted sum 4.

*Needs:* Layer 0 §0.3 sieve with arbitrary excluded residue classes; Layer 0 §0.2 sifted sums of a weighted family; Layer 0 §0.3 local avoidance as coprimality.

**Deleting empty local conditions preserves the Euler product.** For s=ofResidueClasses(A,x,w,Q,Ω,X), `∏_{p∈primeFactors(s.prodPrimes)}(1−s.nu(p))` = `∏_{p∈Q}(1−card(Ωp)/p).`

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Use primeFactors_prod to identify the carrier prime factors with Q+. Evaluate prodPrimeFactors(ρ) at each prime, obtaining ρ(p). Extend the product from Q+ to Q. Every added prime has empty local set, hence density zero and factor one.

Empty local sets contribute factors one, not zero. With Q empty both products are one, independent of X and the population.

*Needs:* Layer 0 §0.3 sieve with arbitrary excluded residue classes; Mathlib `Nat.primeFactors_prod`; Mathlib `ArithmeticFunction.prodPrimeFactors_apply`; Mathlib `Nat.Prime.primeFactors`.

**A fully excluded residue space leaves no survivors.** For any finite indexed population A, integer sample map x, arbitrary real weights w, finite prime set Q and finite local sets Ωp, if p∈Q and card(Ωp)=p, then `Σ_{a∈A,∀q∈Q,x(a) mod q∉Ωq}w(a)=0.`

No nonnegativity of weights and no properness of the other local sets is needed. This result is stated before constructing a BoundingSieve; density one is outside its permitted prime-density range.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Since p is prime it is nonzero. The finite residue ring ZMod p has cardinality p. A finite subset of that cardinality equals the full residue space, by eq_univ_of_card. Every index fails the avoidance condition at p, so the filtered set is empty. For completeness of the input split, card_le_univ ensures no local set at a prime has cardinality above p: either this obstruction applies or every local set is proper.

**Checks.**

- Excluding every residue modulo 3 leaves weighted sum zero on −2,…,3.

The obstruction handles nonempty sample sets, not just the trivial empty-population case. Do not replace the density-one local set by a positive but smaller artificial density.

*Needs:* Mathlib `ZMod.card`; Mathlib `Finset.eq_univ_of_card`; Mathlib `Finset.card_le_univ`.

**Legendre error for arbitrary local residue conditions.** Under the proper local-set hypotheses, let `S=Σ_{a∈A,∀p∈Q,x(a) mod p∉Ωp}w(a),` ρ(p)=card(Ωp)/p and `P=∏_{p∈Q,Ωp nonempty}p.` Then `|S−X∏_{p∈Q}(1−ρ(p))|` ≤ `Σ_{d|P}|Σ_{a∈A,∀p∈primeFactors(d),x(a)` mod `p∈Ωp}w(a)−X∏_{p∈primeFactors(d)}ρ(p)|.`

The divisor sum includes d=1; X need not equal the indexed total weight. No analytic remainder, dimension or distribution hypothesis is implied.

([KED-ANT-11](#references), §11.2, weighted inclusion-exclusion and proof; §11.4, Definition 11.6.)

*Proof sketch.* Apply the non-sharp legendre-error theorem to the residue-class constructor. Use residue-class-siftedsum to replace its sifted sum by S, and residue-euler-product to restore the full Q Euler product. Expand the existing signed remainder using residue-class-multsum. Every d|P is positive, so the existing prodPrimeFactors evaluation gives the displayed product of local densities. Reorder real multiplication to place X first. All errors remain inside absolute values; no source-claimed cutoff or quantitative estimate is imported.

**Checks.**

- For bad residues {0,−2} and Q={3,5,7,11}, the integer 33 has prime-product label 1155; the label is not bounded by the original sample's size.

All-empty local data give the identity |Σw−X|≤|Σw−X|, retaining the mass-normalization error at d=1. The indexed Goldbach polynomial example retains seven parameters, not four image points. Even labels larger than the original sample bound are allowed; quantitative sieve applications still need independently proved cutoff or tail hypotheses.

*Needs:* Layer 0 §0.3 sieve with arbitrary excluded residue classes; Layer 0 §0.3 divisibility sum equals the local intersection; Layer 0 §0.3 sifted sum equals the original local avoidance count; Layer 0 §0.3 deleting empty local conditions preserves the euler product; Layer 0 §0.1 absolute legendre error bound; Mathlib `BoundingSieve.rem`; Mathlib `ArithmeticFunction.prodPrimeFactors_apply`.

### 0.4 finite Gram inequalities

Throughout this subsection, unless a statement says otherwise: 𝕜 is ℝ or ℂ, represented by the existing RCLike structure; E is a normed inner-product space over 𝕜. Completeness and finite dimensionality are not assumed. I is a finite indexing type, possibly empty unless stated otherwise; y:I→E is an arbitrary indexed family. Repetitions, zero vectors and linear dependence are allowed. Use Mathlib's inner product, conjugate-linear in the first argument. Write Gᵢⱼ=⟨yᵢ,yⱼ⟩ and rᵢ=Σⱼ|Gᵢⱼ|. This is the existing Matrix.gram and an ordinary finite real sum, not a new carrier. Real division by zero is zero.

**Vanishing Gram row detects the zero vector.** For each i∈I, rᵢ=0 if and only if yᵢ=0.

([BOMBIERI-1971](#references), p.402, Proposition 1, denominator in the statement.)

*Proof sketch.* Each summand defining rᵢ is nonnegative. The diagonal term |⟨yᵢ,yᵢ⟩| is at most rᵢ by finite-sum monotonicity. If rᵢ=0 the diagonal inner product is zero, so the existing positive-definite inner-product lemma gives yᵢ=0. Conversely, a zero vector makes every entry of its row zero.

A family containing a zero vector has a zero row without making any other denominator invalid. A nonzero vector always has positive row sum, even in a dependent family.

*Needs:* Mathlib `Matrix.gram`; Mathlib `Matrix.gram_apply`; Mathlib `inner_self_eq_zero`.

**Gram-row bound for a finite linear combination.** For every scalar family c:I→𝕜, ‖Σᵢcᵢyᵢ‖² ≤ Σᵢ|cᵢ|²rᵢ.

([BOMBIERI-1971](#references), p.402, equation (4) in the proof of Proposition 1.)

*Proof sketch.* Expand the squared norm as the real part of Σᵢⱼ conjugate(cᵢ)cⱼGᵢⱼ, using the existing Gram quadratic identity, or its finite inner-product sum laws. Bound each real part by its modulus and then use 2|cᵢ||cⱼ|≤|cᵢ|²+|cⱼ|²; this follows by expanding the nonnegative square (|cᵢ|−|cⱼ|)². Interchange indices in the terms containing |cⱼ|². Norm symmetry of the inner product makes the two half-sums equal, leaving exactly Σᵢ|cᵢ|²rᵢ.

The empty family gives 0≤0. Repeated unit vectors with all coefficients 1 attain equality; no orthogonality is assumed. Changing Gᵢⱼ to its real part without taking absolute values is invalid: the family 1,−1 has cancelling signed rows.

*Needs:* Mathlib `InnerProductSpace`; Mathlib `Matrix.star_dotProduct_gram_mulVec`; Mathlib `sum_inner`; Mathlib `inner_sum`; Mathlib `inner_smul_left`; Mathlib `inner_smul_right`; Mathlib `norm_inner_symm`; Mathlib `RCLike.re_le_norm`.

**Selberg's normalized projection defect bound.** Set cᵢ=⟨yᵢ,x⟩/rᵢ, casting the real denominator to 𝕜. Then ‖x−Σᵢcᵢyᵢ‖² ≤ ‖x‖²−Σᵢ|⟨x,yᵢ⟩|²/rᵢ.

x is any vector of E.

([BOMBIERI-1971](#references), p.402, equation (3), equation (4), and coefficient choice immediately after (4).)

*Proof sketch.* Use the existing norm_sub_sq expansion with the finite linear combination. Apply gram-row-quadratic to its squared norm. For each i, conjugate symmetry and z·conjugate(z)=|z|² give Re(cᵢ⟨x,yᵢ⟩)=|⟨x,yᵢ⟩|²/rᵢ. Since rᵢ≥0, scalar norm/division gives |cᵢ|²rᵢ=|⟨x,yᵢ⟩|²/rᵢ. Split rᵢ=0 before field cancellation; both sides of this identity are zero in that case. Sum the two identities and collect the −2 and +1 contributions. Use the corrected single row sum, not the printed global sum of squared Gram entries recorded in the source convention below.

For x=1 and y=i in ℂ the coefficient is −i, and its multiple of y is 1. The opposite convention gives −1 and does not prove the defect estimate. For x=1,y=2 in ℝ the corrected coefficient is 1/2 and the defect is zero; the printed coefficient 1/8 gives defect 9/16.

*Needs:* Layer 0 §0.4 gram-row bound for a finite linear combination; Mathlib `norm_sub_sq`; Mathlib `inner_sum`; Mathlib `inner_smul_right`; Mathlib `inner_conj_symm`; Mathlib `norm_inner_symm`; Mathlib `RCLike.mul_conj`; Mathlib `RCLike.norm_ofReal`; Mathlib `RCLike.div_re_ofReal`.

**Selberg's weighted inner-product inequality.** Prove `SieveGram.selberg_weighted_inner`. Σᵢ |⟨x,yᵢ⟩|²/rᵢ ≤ ‖x‖².

x is any vector of E; zero rows contribute zero.

([BOMBIERI-1971](#references), p.402, Proposition 1 (statement and complete proof).)

*Proof sketch.* The left-hand squared norm in selberg-defect is nonnegative. Move the weighted sum to the other side. The proof is finite over either scalar field. Thus the Hilbert-space statement extends to normed inner-product spaces without a completeness assumption.

An empty or all-zero family has weighted sum zero. For a single nonzero vector this is Cauchy–Schwarz after dividing by its squared norm. For x=1 and real y=(1,2), the two terms are 1/3 and 4/6, summing to 1; replacing the denominators by their squares fails already at y=1/2. For an orthonormal family all rows equal one, so the result agrees with the existing finite Bessel inequality; it does not rebuild the orthonormal theory.

*Needs:* Layer 0 §0.4 selberg's normalized projection defect bound.

### 0.5 dimension, remainder mass and Rankin bounds

**Logarithmic sieve dimension.** HasLogSieveDimension(P,g,κ,C) means: for every real z≥2, `Σ_{p∈P, p prime, p≤z}` g(p) log p ≤ κ log z+C. The sum is finite. P is a fixed set of naturals and g is a fixed real function; constants do not depend on z or on an application population.

The predicate records only the displayed inequality. Positivity of g, κ and C are separate theorem hypotheses; it does not assert a local density or any distribution estimate. In Chapter 11 g(p)=ω(p)/p.

([KED-ANT-11](#references), §11.4, (11.4.1).)

*Construction.* Use the finite prime set obtained by filtering naturals up to floor z. Quantify the bound over every real z≥2, not merely a single cutoff.

The definition exposes the following operations and laws:

- Equivalent to the displayed bound for every z≥2.
- mono constant: Increase C and retain the same dimension bound.
- mono dimension: Increasing κ preserves the condition because log z≥0 on the quantified domain.
- mono density: If h(p)≤g(p) at all selected primes, the bound for g implies the same bound for h.
- For empty P and nonnegative κ,C the predicate holds.

**Checks.**

- P empty, κ=C=0 satisfies the bound with sum zero.
- P empty, κ=0,C=−1 does not satisfy the bound.
- P={2}, g(2)=1/2, κ=0,C=log 2/2 satisfies the bound exactly at z=2.
- A bound checked only at z=2 is not the all-z predicate; an unbounded density at larger primes is not constrained by that check.

A finite set at a single cutoff does not supply constants uniform across a varying prime family.

*Needs:* Mathlib `Real.log`.

**Euler-product sieve dimension.** HasProductSieveDimension(P,g,κ,K) means: for every real 2≤w≤z, `∏_{p∈P, p prime, w≤p<z}(1−g(p))⁻¹` ≤ K (log z/log w)^κ.

All endpoint choices are part of the definition: p=w is included and p=z is excluded. The acceptance specialization `SieveBrun.HasProductDimension` takes P=primeFactors(s.prodPrimes) and g=ν. The general predicate alone does not require g(p)<1; every sieve theorem requires 0≤g(p)<1 separately.

([KED-ANT-12](#references), §12.3, (12.3.1).)

*Construction.* Take the finite product over primes below ceil z and filter by w≤p. Use real powers and the strictly positive logarithm of w.

The definition exposes the following operations and laws:

- Unfold to the exact interval product and logarithmic ratio.
- mono constant: K≤K′ preserves the bound since the logarithmic power is nonnegative.
- mono dimension: For K≥0 and κ≤κ′ increase the exponent of a ratio at least one.
- interval bound: Apply the predicate on any explicit interval with 2≤w≤z.
- For g identically zero and κ≥0,K≥1 every product is one, so the predicate holds.

**Checks.**

- Zero density with κ=0,K=1 satisfies the condition.
- At w=z the empty product is one and the logarithmic ratio is one; K<1 cannot satisfy the predicate.
- For P={2},g(2)=1/2, the interval [2,2) has product 1, whereas [2,3) has product 2.
- g(2)=1 is forbidden by the sieve theorem even if the totalized inverse in the bare predicate is zero.

Do not infer this product-ratio condition from the logarithmic condition without controlling primes with g(p) near one.

*Needs:* Mathlib `Real.log`.

**Truncated remainder mass.** Define `SieveBrun.remainderMass`. For an existing BoundingSieve s and real D, `remainderMass(s,D)=Σ_{d|s.prodPrimes, d<D}|s.rem(d)|.` Divisors are positive; the cutoff is strict.

D can be any real. The sum is zero if D≤1. If D>1 it includes d=1 and hence the mass-normalization error.

([KED-ANT-12](#references), §12.2, display R(x,y) preceding §12.3.)

*Construction.* Filter the native positive divisor finset and sum absolute values of the existing remainder.

The definition exposes the following operations and laws:

- Every remainder mass is nonnegative.
- D≤E implies remainderMass(s,D)≤remainderMass(s,E).
- D≤1 implies remainderMass(s,D)=0.
- The same prime product and equal remainders on its divisors give equal remainder masses.
- Coefficients of modulus≤L on divisors, vanishing for d≥D, have errSum≤L remainderMass(s,D), for L≥0.

**Checks.**

- P=6 and all four remainders equal one give masses 0 at D=1, 1 at D=2, 2 at D=3, 3 at D=6 and 4 at D=7.
- R_2=1 and R_3=−1 contribute 2 once D>3, not zero.
- P=1,D=2 gives |A_1−X|.
- D=−3 gives zero even if zero belongs to the sample support.

This is not SelbergSieve.level, and signed cancellation cannot reduce it.

*Needs:* Mathlib `BoundingSieve`; Mathlib `BoundingSieve.rem`.

**Level of distribution of a sieve family.** HasSieveLevel(F,θ) for a fixed family F:real→BoundingSieve means θ>0, X_F(x)≥0 for all x≥2, and: for every A>0 there exist B>0,C>0,x₀≥2 such that for all x≥x₀, remainderMass(F(x), x^θ/(log x)^B)≤ C X_F(x)/(log x)^A.

F and θ are fixed before A is chosen. B,C,x₀ may depend on F,θ,A, not on the varying x. This is a weighted sieve-family predicate, not Maynard’s π-centred prime-distribution predicate.

([KED-ANT-12](#references), §12.1 remainder discussion and §12.2 R(x,y).)

*Construction.* Write out the order of quantifiers. Retain the absolute divisor sum, its strict cutoff and its mass-normalization remainder.

The definition exposes the following operations and laws:

- Equivalent to the full quantified family estimate with positivity conditions.
- bound: For a specified A>0 obtain one B,C,x₀ uniform for every x≥x₀.
- mono: If 0<η≤θ a family of level θ has level η, using monotonicity of remainder mass and x≥2.
- mass nonneg: Every x≥2 has nonnegative approximate mass.
- A nonnegative-mass family with every divisor remainder zero has every positive level.

**Checks.**

- A nonnegative-mass family with all remainders zero satisfies the condition at θ=1.
- θ=0 fails the stated positive-level predicate even for an exact family.
- A family with X=1 and |R_1|=1 for every x≥2 has no positive level: the cutoff eventually exceeds 1 but no logarithmic saving controls R_1.
- The empty exact family X=0 is permitted and has every positive level.

An arbitrary coefficient level, a pointwise error without summed uniformity, or a negative approximate mass is not this condition.

*Needs:* Layer 0 §0.5 truncated remainder mass; Mathlib `BoundingSieve`.

**Coefficient error controlled by remainder mass.** If L≥0, |c(d)|≤L on the divisors of P and c(d)=0 on every divisor d≥D, then s.errSum(c)≤L remainderMass(s,D).

s is a BoundingSieve; D is real and the cutoff is strict. Brun’s estimate uses this remainderMass law.

([KED-ANT-12](#references), §12.2, error estimate for R±.)

*Proof sketch.* Split the finite divisor sum by d<D. The complementary coefficients vanish. Bound each remaining nonnegative term by L|R_d| and factor the constant out.

D≤1 forces every contributing coefficient to vanish; L=0 gives zero error.

*Needs:* Layer 0 §0.5 truncated remainder mass; Mathlib `BoundingSieve.errSum`.

**Finite tilted density Euler product.** For any real a and BoundingSieve s, `Σ_{d|P}` ν(d)d^a = `∏_{p|P}(1+ν(p)p^a).`

P=s.prodPrimes is nonzero squarefree; all powers have positive natural bases, including d=1.

([KED-ANT-11](#references), §11.3, Rankin proof; Exercise 11.6.1.)

*Proof sketch.* Use the native squarefree-divisor/subset correspondence. Multiplicativity of ν and real powers on positive products identify each subset term. Expand the finite product by choosing either 1 or ν(p)p^a at each prime.

P=1 gives 1=1 for every a; a=0 gives Σν(d)=∏(1+ν(p)).

*Needs:* Mathlib `BoundingSieve`; Mathlib `BoundingSieve.prod_primeFactors_nu`; Mathlib `Nat.sum_divisors_filter_squarefree`.

**Weighted Rankin cutoff bound.** For x>0 and σ≥0, `Σ_{d|P, d≤x}` dν(d) ≤ x^σ `∏_{p|P}(1+ν(p)p^(1−σ)).`

s is a BoundingSieve. The inclusive cutoff is explicit; x<1 gives an empty sum.

([KED-ANT-11](#references), §11.3, Rankin proof; §11.4, Lemma 11.7 and Exercise 11.6.1.)

*Proof sketch.* For d≤x compare d^σ≤x^σ, multiply by ν(d)d^(1−σ), and sum. Extend the sum by nonnegative terms and apply the finite Euler-moment identity with exponent 1−σ.

σ=0 remains valid; x=1 retains the d=1 contribution; do not include d=0.

*Needs:* Layer 0 §0.5 finite tilted density euler product; Mathlib `BoundingSieve.nu_pos_of_dvd_prodPrimes`.

**Weighted Rankin remainder-tail bound.** For x>0 and a≥0, `Σ_{d|P, x<d}` ν(d) ≤ x^(−a) `∏_{p|P}(1+ν(p)p^a).`

s is a BoundingSieve; the tail is strict.

([KED-ANT-11](#references), §11.3, Rankin proof; §11.4, Lemma 11.8.)

*Proof sketch.* On the tail use 1≤(d/x)^a, retain nonnegative ν(d), and extend to all divisors. Apply the Euler-moment identity.

At x=P the tail is empty; x<1 includes d=1; a=0 gives the full density sum as an upper bound.

*Needs:* Layer 0 §0.5 finite tilted density euler product; Mathlib `BoundingSieve.nu_pos_of_dvd_prodPrimes`.

**Tilted Euler-product estimate from logarithmic dimension.** Fix a set P and function g, with κ>0,C≥0, nonnegative g(p) for selected primes and HasLogSieveDimension(P,g,κ,C). There exist K>0,z₀≥exp(2) such that for every z≥z₀, `∏_{p∈P,p prime,p≤z}(1+g(p)p^(1/log` z)) ≤ K(log z)^κ.

All data P,g,κ,C are fixed before K,z₀ are chosen. The constants are independent of z and of every application population.

([KED-ANT-11](#references), §11.4, Lemma 11.7; Exercise 11.6.1.)

*Proof sketch.* Set `A(t)=Σ_{p≤t,p∈P}g(p)log` p. Apply the native Abel formula on [2,z] to 1/log t, isolating p=2, to obtain Σg(p)≤κ log log `z+O_{κ,C}(1).` Its derivative is −1/(t(log t)²), integrable on this domain. For α=1/log z and 2≤p≤z, use exp(u)−1≤exp(1)u for 0≤u=α log p≤1. Thus Σg(p)(p^α−1)≤exp(1)(κ+C/log z), uniformly bounded. Extend the finite summand by zero off the selected primes before using Real.prod_one_add_le_exp_sum, whose input is globally nonnegative. Exponentiate the two bounds and absorb only fixed constants in K.

The lower endpoint is at least exp(2), so 0<1−1/log z<1 in the cutoff applications. No Mertens theorem is required when the logarithmic condition is given.

*Needs:* Layer 0 §0.5 logarithmic sieve dimension; Mathlib `sum_mul_eq_sub_sub_integral_mul`; Mathlib `Real.prod_one_add_le_exp_sum`.

**Dimension-controlled weighted divisor count.** For fixed data of log-dimension-euler-bound, there exist K>0,z₀≥exp(2) such that for every z≥z₀, every x>0 and every BoundingSieve s whose prime factors are exactly the selected primes p≤z and whose ν(p)=g(p), `Σ_{d|P_s,d≤x}dν(d)` ≤ K x(log z)^κ exp(−log x/log z).

Constants are uniform in x and s; all density data and dimension constants are fixed. This implies the strict-cutoff version of source Lemma 11.7.

([KED-ANT-11](#references), §11.4, Lemma 11.7 and Exercise 11.6.1.)

*Proof sketch.* Apply weighted Rankin with σ=1−1/log z, then bound its finite Euler product by the preceding theorem. Rewrite x^σ as x exp(−log x/log z).

The inclusive cutoff is a stronger conclusion than the source’s d<x; x<1 gives an empty divisor sum.

*Needs:* Layer 0 §0.5 weighted rankin cutoff bound; Layer 0 §0.5 tilted euler-product estimate from logarithmic dimension.

**Dimension-controlled divisor-density tail.** For the same fixed data there exist K>0,z₀≥exp(2) such that for every z≥z₀,x>0 and matching sieve s, `Σ_{d|P_s,x<d}ν(d)` ≤ K(log z)^κ exp(−log x/log z).

For a fixed L>0 replace x by Lx and absorb the bounded factor L^(−1/log z) in K.

([KED-ANT-11](#references), §11.4, Lemma 11.8 and (11.4.2).)

*Proof sketch.* Use weighted Rankin with a=1/log z and the tilted Euler-product estimate. This avoids integration of a divisor-count bound and so removes the extra log z loss of the source integral argument.

This stronger finite-tail estimate follows from the argument below; the source gives the weaker (log z)^(κ+1) bound. No infinite divisor tail is asserted.

*Needs:* Layer 0 §0.5 weighted rankin remainder-tail bound; Layer 0 §0.5 tilted euler-product estimate from logarithmic dimension.

**Eratosthenes estimate with a justified mass and divisor cutoff.** Let x>0,c,M≥0 and 0<σ<1. If 0≤X≤Mx, |R_d|≤c dν(d) for divisors d≤x, and A_d=0 for divisors d>x, then `|S−X∏_{p|P}(1−ν(p))|≤(c+M)x^σ∏_{p|P}(1+ν(p)p^(1−σ)).`

s is the native BoundingSieve; A_d is its weighted multSum. The mass bound and the divisor cutoff are assumptions to prove in an application, never consequences of the residue-label representation.

([KED-ANT-11](#references), §11.4, Theorem 11.9 and Exercise 11.6.3; proof of Theorem 11.11.)

*Proof sketch.* Split the native absolute Legendre remainder into d≤x and d>x. Bound the first piece by c times the weighted prefix. On the tail, A_d=0 gives |R_d|=Xν(d); apply weighted Rankin with a=1−σ and X≤Mx. Combine the common Euler product. With σ=1−1/log z and the dimension estimate obtain `O_{fixed data,c,M}(x(log` z)^κ exp(−log x/log z)).

This conditional statement does not claim the exact advertised Theorem 11.9 under its weaker printed hypotheses, nor does it repair the two-residue cutoff step of the Brun application (see Source-sensitive conventions).

*Needs:* Layer 0 §0.1 absolute legendre error bound; Layer 0 §0.5 weighted rankin cutoff bound; Layer 0 §0.5 weighted rankin remainder-tail bound; Mathlib `BoundingSieve.multSum_eq_main_err`.

### 0.6 the real discriminant character

**Real discriminant character adapter.** Define `SieveRealCharacters.discriminantValue` by χ_D(0)=0 and, for n>0, χ_D(n)=∏_(p|n)c(D,p)^(v_p(n)), as a real number. For odd p put c(D,p)=jacobiSym(D,p); put c(D,2)=1 for D≡1,7 mod 8, −1 for D≡3,5 mod 8, and 0 otherwise. Compare the finite numerical product with ThetaSeries §2H's `kroneckerSym D n`. The source and target are ℤ×ℕ and ℝ. For |D|>1 and D≡0,1 mod 4 this is its discriminant Dirichlet character restricted to naturals. The general Kronecker construction, multiplicativity, periodicity and dyadic laws are consumed from that owner.

([JUTILA-ORIGINAL](#references), notation before Theorem 1, p.192; Lemma 3, pp.194–195.)

The adapter exposes these laws:

- Its value at zero is zero; for positive odd n it is the real coercion of `jacobiSym D n`.
- For a proof hD that D is fundamental, with 1<D.natAbs, and every n∈ℕ, it equals the real coercion of `TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD` at n modulo D.natAbs.
- Its nonzero-argument values and the |D|>1 character comparison are compatible with the supplier's coercions; no modulus-one equality is claimed.

**Checks.**

- At D=5,n=2 its value is −1; at D=8,n=2 it is 0.
- At D=8,n=3 it is −1; the odd Jacobi comparison retains this sign.
- At D=5,n=0 it is 0. At D=1,n=0 it is also 0, whereas the native modulus-one character is 1; hD alone does not suffice for the comparison.
- At D=1,n=1 it is 1, so the zero extension is not periodic modulo one.

*Needs:* Mathlib `Nat.primeFactors`; Mathlib `Nat.factorization`; Mathlib `jacobiSym`; ThetaSeries §2H for the comparison and character laws; the pinned fundamental-discriminant character and its explicit fundamentalness proof.

### 0.7 binary polynomial local densities and the growth class

**Binary polynomial local densities.** For Q∈Z[x₀,x₁] and a>0, ρ_Q(a) counts zeros in (Z/aZ)², with ρ_Q(0)=0. For prime p and k≥1 a zero modulo p^k is smooth if some partial derivative is nonzero modulo p. Let ρsing_Q(p^k) count the remaining zeros, and let ρ̃_Q(p^k) count zeros which are smooth OR have no zero lift modulo p^(k+1). Extend ρ̃ multiplicatively to positive a, with ρ̃(1)=1 and ρ̃(0)=0. Do not replace it by a smooth-only count.

Native two-variable polynomial over Z; positive moduli for counts; p prime and k≥1 for the singular correction.

([KHAYUTIN-19](#references), Definition 9.1 and Lemma 9.3, pp.221–222.)

*Construction.* Use finite native residue spaces and polynomial evaluation; define the reduction of a lift coordinatewise. The corrected prime-power density explicitly includes singular points with no lift. Use prime factorization for its multiplicative extension.

The definition exposes the following operations and laws:

- ρ_Q(1)=1.
- ρ_Q(0)=0, an explicit extension outside the source’s positive domain.
- For coprime positive a,b, ρ_Q(ab)=ρ_Q(a)ρ_Q(b), by native CRT.
- Count the prime-power zero classes which are smooth or have no lift.
- Count the prime-power zero classes with both derivatives zero modulo p.
- Multiplicative extension of the corrected counts.
- ρ̃_Q(1)=1.
- ρ̃_Q(a)≤ρ_Q(a) for every positive a.
- ρ̃_Q is multiplicative on positive coprime arguments.
- For p prime,k≥1, p²ρ̃_Q(p^k)=p²ρ_Q(p^k)−ρsing_Q(p^(k+1)); use integer equality to avoid truncated natural subtraction.

**Checks.**

- For Q=x₀, ρ_Q(9)=9 and ρ̃_Q(9)=9.
- For Q=0, ρ_Q(4)=16 but ρ̃_Q(4)=0.
- For Q=2, ρ̃_Q(2)=4 and ρ̃_Q(4)=0; all the first-level zeros are singular with no lift.
- For Q=x₀², ρ_Q(4)=8 and ρ̃_Q(4)=4.
- Every Q has ρ_Q(1)=ρ̃_Q(1)=1.

*Needs:* Mathlib `MvPolynomial.eval₂`; Mathlib `MvPolynomial.pderiv`; Mathlib `ZMod`; Mathlib `Nat.factorization`.

**Curve lifting and singular correction.** For prime p,k≥1, every smooth zero modulo p^k has exactly p zero lifts to p^(k+1); a singular zero has either p² lifts or no lift. Thus p²ρ̃_Q(p^k)=p²ρ_Q(p^k)−ρsing_Q(p^(k+1)).

p prime; k≥1.

([KHAYUTIN-19](#references), Definition 9.1(3)–(5), Lemma 9.3, pp.221–222.)

*Proof sketch.* Taylor-expand Q at x+p^k t modulo p^(k+1); higher terms vanish for k≥1. Count solutions to the resulting one linear equation in two F_p coordinates. Smoothness gives p solutions; a zero gradient gives all or none. Singular zeros upstairs all reduce to singular points, giving the correction formula.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Mathlib `MvPolynomial.pderiv`.

**Binary Schwartz–Zippel specialization.** If p is prime and the reduction of Q modulo p is nonzero, then ρ_Q(p)≤p·totalDegree(Q). This statement is the local-count adapter of Mathlib’s Schwartz–Zippel theorem.

p prime; Q mod p nonzero, not merely Q≠0 over Z.

([KHAYUTIN-19](#references), Lemma 9.2, p.221.)

*Proof sketch.* Apply the native theorem to the full finite field and two variables. Clear its nonzero denominator p², and bound the degree after coefficient reduction by the original total degree.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Mathlib `MvPolynomial.schwartz_zippel_totalDegree`.

**Multiplicative sieve growth class.** For a native real arithmetic function f, define M(A,B,ε) by A≥1,B>0,ε>0, multiplicativity, nonnegativity, and f(n)≤min(A^Ω(n),B n^ε) for every n>0. Ω counts prime factors with multiplicity. ArithmeticFunction already makes f(0)=0; no estimate at Q=0 is silently inferred.

Native ArithmeticFunction R; A≥1,B>0,ε>0 included in the predicate.

([KHAYUTIN-19](#references), Definition 9.6, p.222; Proposition 10.10, p.245.)

*Construction.* Use the native arithmetic-function and multiplicativity APIs, with a concrete conjunction of the two growth inequalities.

The definition exposes the following operations and laws:

- nonneg: f(n)≥0 for every n.
- prime power: f(p^k)≤min(A^k,B p^(kε)) for prime p,k≥1.
- mono: Increasing A,B or ε preserves membership when the new parameters are positive and A≥1.
- mul coprime: For coprime a,b, f(ab)=f(a)f(b).
- The native all-ones-on-positive-integers ζ has M(1,1,ε) for every ε>0.

**Checks.**

- ζ belongs to M(1,1,1).
- −ζ fails nonnegativity and multiplicativity.
- The multiplicative function f(n)=2^Ω(n) for n>0 has f(4)=4, not 2, and belongs to M(2,1,1).
- The same f fails M(1,1,1) at n=2.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `ArithmeticFunction.cardFactors`; Mathlib `ArithmeticFunction.IsMultiplicative`.

**Binary density correction factor.** Define θ_Q multiplicatively by θ_Q(p^k)=1+2ρ_Q(p)/p² when Q mod p≠0 and θ_Q(p^k)=1 at content primes, for k≥1. Define λ_Q(n)=μ(n)²2^ω(n)ρ_Q(n)/n² when n is coprime to every content prime, and zero otherwise, with λ_Q(1)=1 and λ_Q(0)=0. Then θ_Q=ζ*λ_Q for native Dirichlet convolution; ζ is the positive all-ones function, not the convolution unit.

Positive integer arguments; content means all coefficients divisible by p.

([KHAYUTIN-19](#references), Definition 9.15, Remark 9.16 and Corollary 9.17, pp.227–228.)

*Construction.* Use explicit prime-factor products for θ and the squarefree formula for λ, then prove the identity by multiplicativity and prime powers.

The definition exposes the following operations and laws:

- θ_Q(1)=1.
- The factor is independent of the positive exponent.
- Squarefree Möbius inversion factor with content primes removed.
- `θ_Q(n)=Σ_{d|n}λ_Q(d)` for n>0.
- θ_Q(n)≥1 for n>0.
- If f has M(A,B,ε), then fθ_Q has M(A′,B′,ε+ε′), for each ε′>0, with A′,B′ depending only on the indicated original parameters and degree.

**Checks.**

- For Q=x₀, θ_Q(9)=5/3 and λ_Q(9)=0.
- For Q=0, θ_Q(n)=1 for all n>0 and λ_Q(n)=0 for n>1.
- θ_Q(1)=λ_Q(1)=1.
- For Q=x₀, θ_Q(6)=10/3, not a factor evaluated only at 6.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Mathlib `ArithmeticFunction.zeta`; Mathlib `ArithmeticFunction.moebius`; Mathlib `ArithmeticFunction.cardDistinctFactors`.

### 0.8 conic local-count comparisons

**Integral local normal forms for conic counts.** For primitive q=ax²+bxy+cy² of negative discriminant D=b²−4ac, the existing integral-local classification specializes to the following count-preserving changes of variables over Z_p: diagonal ux²+Ay² with u a unit if p is odd or p=2,D≡0 mod 4; xy if p=2,D≡1 mod 8; x²+xy+y² if p=2,D≡5 mod 8. Reduce the isometries modulo every p^n to obtain bijections of the counted residue spaces. Use the imported local classification for these count comparisons.

Primitive q; D<0; integral GL₂(Z_p) equivalence, not just equivalence over Q_p.

([KHAYUTIN-19](#references), Lemma B.1 and Remark B.2, p.265.)

*Proof sketch.* Import integral localization, odd-prime orthogonal bases and dyadic unimodular classification from IntegralLattices Layer 3. Supply the specific rank-two half-norm adapter and its reductions modulo p^n. Its exact coefficient/discriminant normalization requires proof; rational quadratic-form diagonalization alone does not suffice.

*Needs:* Layer 0 §0.7 binary polynomial local densities; IntegralLattices Layers 0 and 3 (half-norm dictionary and integral local classification).

**Regular-prime conic densities.** For primitive q of discriminant D<0, Q=q−ωD, prime p with p∤ωD and n≥1, ρ_Q(p^n)=ρ̃_Q(p^n)=p^(n−1)(p−χ_D(p)), where χ_D is the Kronecker discriminant character. At 2 use the explicit dyadic value, not the native odd Jacobi convention.

Primitive q; D<0; p∤ωD; n≥1.

([KHAYUTIN-19](#references), Proposition B.3, pp.265–266.)

*Proof sketch.* The reduction is smooth; count the projective conic and remove its zero, one or two points at infinity according to the splitting character. For p=2 use xy or x²+xy+y² directly: their nonzero-level affine counts are respectively 1 and 3. Every zero is smooth and each lift multiplies the count by p.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.7 curve lifting and singular correction; Layer 0 §0.8 integral local normal forms for conic counts; Layer 0 §0.6 real discriminant character adapter.

**Singular-prime conic density recursion.** For odd p and an integral binary quadratic form q₀ whose discriminant is a unit modulo p, let R(n,m) count q₀(x,y)≡u₃p^m mod p^n, with u₃ a unit. Set R(0,m)=1 for every m≥0; for n≥1 put R(n,0)=p^(n−1)(p−χ) where χ is its discriminant Legendre symbol. For n,m≥1 its smooth part is (p−1)(1+χ)p^(n−1); its singular part is p²R(n−2,m−2) when n,m≥2, zero for n≥2,m=1, and 1 for n=1. For a diagonal conic with p^ℓ exactly dividing D, n≤ℓ gives ρ_Q(p^n)=p^(n+floor(n/2)). For n>ℓ, rescale x=p^ceil(ℓ/2)x₀ and use the equation u p^(ℓ mod 2)x₀²+u_Ay²+4ωu u_A≡0 mod p^(n−ℓ), with multiplicity p^(ℓ+floor(ℓ/2)).

Odd prime p; unimodular q₀; unit u₃ and the stated diagonal unit coefficients; primitive conic; ℓ is the actual valuation of D. Dyadic diagonal case uses a separate bound.

([KHAYUTIN-19](#references), Lemma B.4, equation (67), pp.266–268; Proposition B.5, equation (68), pp.268–269.)

*Proof sketch.* Separate primitive residue pairs from pairs divisible by p. For a split form the nonzero zero-level fibre has 2(p−1) points; for an anisotropic form it has none. Scaling pairs divisible by p gives the exact recursion. This corrects the source’s 1−χ where (p−1)(1+χ) is required. In the ramified normal form, 2ceil(ℓ/2)−ℓ is ℓ mod 2, not twice that number, and Q=q−ωD gives the plus sign before 4ωu u_A. Count the free discarded digits explicitly.

p=3,q₀=x²−y²,m=n=1 gives 5 roots, not 1. p=3,q=x²+3y²,ω=1,n=2 gives 0 roots; at n=1 all 3 roots are non-lifting.

*Needs:* Layer 0 §0.8 integral local normal forms for conic counts; Layer 0 §0.7 curve lifting and singular correction; Layer 0 §0.6 real discriminant character adapter.

**Uniform conic local-density bound.** For primitive integral q=ax²+bxy+cy² of D<0, any integer ω, prime p and n≥1, `ρ_{q−ωD}(p^n)≤16` p^(3n/2); therefore the same bound holds for corrected densities and supplies r=1/2,C=16. Constants do not depend on q,D,ω.

Primitive q; D<0; every prime, including 2; n≥1.

([KHAYUTIN-19](#references), Corollary B.6, p.269.)

*Proof sketch.* A primitive binary quadratic has a primitive vector of unit value modulo p, so an integral basis change makes its leading coefficient a unit. For each second coordinate, bound the roots of the resulting unit-leading quadratic modulo p^n by a constant times p^(n/2), using valuation and square-root lifting; retain the dyadic loss in the constant 16. Sum over p^n second coordinates. This direct finite-root argument is preferable to relying on the source’s incorrect singular closed forms; the exact dyadic root bound and integral normal-form adapter remain proof targets.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.8 integral local normal forms for conic counts; Layer 0 §0.8 singular-prime conic density recursion.

**Genus-restricted conic density sum.** For odd p, unit integers u,u_A, q=ux²+p u_Ay², D=−4u u_Ap, p∤ω, ε=±1, and k=0 or 1, sum `ρ_{q−ωD}(p^k` a;p²) over unit a mod p^(2−k) with (a/p)=ε. For k=0 the sum is p³(p−1) if (u/p)=ε and 0 otherwise. For k=1 it is p²[p−1−ε(u_A/p)−(−ωu/p)]/2. The last sign is required by the source’s definition Q=q−ωD.

p odd prime; u,u_A,ω units mod p; ε=±1; congruence local counts as `ρ_{Q−t}(modulus).`

([KHAYUTIN-19](#references), Proposition B.8, equations (69)–(72), pp.270–271.)

*Proof sketch.* Introduce a nonzero square variable w so that p^k a=p^k u_εw², and divide the resulting count by the exact multiplicity 2p^k. For k=0 every contributing point is smooth. For k=1 reduce the correctly signed equation to u_Ay²−u_εw²+4ωu u_A=0 modulo p, subtract w=0, and count free lifted digits. The paper’s final factor has (ωu/p) in place of (−ωu/p). A finite check at p=3,u=u_A=ω=1,k=1,ε=−1 gives 18 for the actual count and 9 for the printed factor. The corrected formula is a finite-count specialization, not a global genus theory.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.7 curve lifting and singular correction; Layer 0 §0.6 real discriminant character adapter.

### 0.9 ideal counts of imaginary quadratic orders

**Quadratic-order ideal counts in the growth class; conductor-prime norm counts.** For a fixed imaginary quadratic order Λ, let r_Λ(n) be the number of integral invertible Λ-ideals of norm n, with r_Λ(0)=0. Use GlobalNumberFields Layer 11’s order and invertible-ideal carrier; construct the finite norm fibres here, comparing maximal-order fibres with ArithmeticDirichletSeries Layers 1–2. The sieve specialization proves r_Λ is multiplicative and belongs to `M(A_Λ,B_{Λ,ε},ε)` for every ε>0, with the conductor-prime factors treated explicitly. For maximal orders one may take the standard divisor-count majorant.

Fixed imaginary quadratic order; invertible ideals, not all proper ideals; ε>0.

([KHAYUTIN-19](#references), Definition 10.5, p.242, and its use in Proposition 10.10, §10.3, p.245.)

*Proof sketch.* Construct the conductor-local ideal-count formula and coprime norm multiplicativity here on GlobalNumberFields Layer 11’s invertible-ideal carrier. At unramified primes there are at most k+1 ideals of norm p^k. Absorb the finitely many conductor primes into the fixed-order constants and apply the divisor-function n^ε estimate. For every rational prime p and exponent k, compute the local invertible-ideal fibre, including p dividing the conductor, and prove finiteness and the fixed-order subpower majorant. This norm-count specialization adds to the supplied order arithmetic (KHAYUTIN-19, Definition 10.5, p.242; Proposition 10.10, p.245).

The norm-count API consists of:

- The zero extension r_Λ(0)=0 and unit value r_Λ(1)=1.
- Finite norm fibres on integral invertible ideals and their bijections under isomorphisms of orders.
- Multiplicativity on positive coprime norms, with conductor primes retained.
- For every ε>0, constants A_Λ≥1 and B_(Λ,ε)>0 giving the two bounds in the growth class; all constants depend on the fixed order.

**Checks.**

- For the maximal order ℤ[i], r(1)=1, r(5)=2 and r(25)=3; the repeated split prime is counted with its exponent.
- In the same order, r(3)=0 and r(9)=1 because 3 is inert; complete multiplicativity would wrongly give r(9)=0.
- The zero norm has count 0 by convention, and is excluded from the positive norm-fibre theorems. It must not be assigned the unit-ideal count 1.

*Needs:* GlobalNumberFields Layer 11 orders and Picard groups; Layer 0 §0.7 multiplicative sieve growth class; AnalyticNumberTheoryPartI §3.26.

### 0.10 polynomial-vector sieve data

**Polynomial-vector sieve data.** For finitely many prime labels p_i use the native vector Π_i F_(p_i)[T], with monic sample components of fixed degree n and an arbitrary joint probability law. Define ||D||=∏p_i^deg D_i for nonzero components, zero when a component is zero; E_D is componentwise D_i|A_i. For finite sets I_i of monic irreducibles define E_(D,I) by D_i|A_i and no D_iJ dividing A_i for J∈I_i. This equals no J|A_i/D_i on the divisibility event. No independence of the reductions is assumed.

Prime labels; monic D and A in sieve applications; finite I_i; normalized nonnegative mass.

([BSKK-23](#references), Notation before Proposition 8.1 and Lemma 8.2, p.39.)

*Construction.* Use dependent native polynomial types. Finite samples may be presented by coefficient tuples and a normalized finite mass, an adapter to the native probability-law carrier. Use product norms and componentwise divisibility; record zero and empty-vector conventions.

The definition exposes the following operations and laws:

- The explicit product norm with zero-component convention.
- The all-one vector has norm one, including an empty index set.
- For prime labels and nonzero native polynomial components, ||DG||=||D||||G||.
- A finite normalized-mass presentation of Pr(D|A).
- Pr(D|A and no candidate J divides the quotient).
- The rough-divisibility probability is at most Pr(D|A).
- Empty candidate sets give the divisibility event.
- Pr(D|A)−1/||D||, for monic D.
- For monic D dividing A, D J∤A iff J∤A/D.

**Checks.**

- At one label p=2, ||T³||=8.
- The empty polynomial vector has norm 1; components T over 𝔽₂ and T² over 𝔽₃ have joint norm 2·9=18.
- A vector with a zero component has norm zero, not one.
- With an empty candidate set and D=1, the probability is one.
- For A=T²,D=T,I={T}, the rough event fails, although D|A.
- For two distinct labels p=2 and p=3 whose coefficients are equal Bernoulli bits, Pr(T divides both components)=1/2, not the product 1/4.

*Needs:* Mathlib `Polynomial`; Mathlib `Nat.Prime`; Mathlib `ZMod`.

**Finite-field irreducible counts for the vector sieve.** For a finite field of cardinality q and j≥1, the number Π_q(j) of monic irreducibles of degree j satisfies jΠ_q(j)≤qʲ, hence Σ_(1≤deg J≤ℓ)q^(−deg J)≤1+log ℓ for ℓ≥1. These are finite polynomial-counting inputs to the vector branch, rather than assumed exports of another roadmap.

([BSKK-23](#references), §6.1 and §8, irreducible harmonic sums.)

**Checks.**

- Over 𝔽₂, degree zero has one monic polynomial, namely 1; it is not irreducible.
- Over 𝔽₂, degree one has two monic irreducibles, so jΠ₂(j)=2=qʲ at j=1.
- Over 𝔽₂, degree two has one monic irreducible, T²+T+1, giving 2Π₂(2)=2≤4. Up to degree two the reciprocal irreducible sum is 2/2+1/4=5/4≤3/2.

*Needs:* Mathlib finite-field and polynomial factorization carriers; factorization of T^(qʲ)−T; Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv` for the monic counts.

### 0.11 translated lattice discrepancies

**Translated lattice discrepancies.** For a bounded strictly convex planar C² domain E with positive curvature and maximal curvature radius R, define L(C,θ) by C>0, θ>0 and the following law: for every integer a≥1 and v∈ℤ², if area(E)≥a² then

`|#(a⁻¹(E−v)∩ℤ²)−area(E)/a²| ≤ C(R/a)^θ`.

Fix whether the boundary belongs to E. Keep that convention in every count. Prove the C² bound with θ=2/3+ε for each ε>0, and the ellipse bound θ=131/208+ε with the C³ regularity and uniformity of the cited estimate (KHAYUTIN-19, Definition 9.4 and Remark 9.5, p.222). This is the analytic lattice-discrepancy theorem, beyond the Henk and Davenport counts consumed from GeometryOfNumbersAndQuadraticArithmetic §4.1.

The definition's API consists of:

- The displayed estimate at each admissible translated and scaled domain.
- Increasing C preserves membership; increasing θ preserves membership when R/a≥1, which must be proved or assumed at that use.
- Integer translation preserves area, R, and the discrepancy class.
- For integer a≥1 and v∈ℤ², replacing E by a⁻¹(E−v) preserves the class: its area is area(E)/a² and radius R/a, and a subsequent integer scale b and translation w use the original scale ab and translation v+aw. Retain the scaled-area threshold.

**Checks.**

- The open and closed unit disks have counts 1 and 5, area π, and R=1; at a=1 their errors are π−1 and 5−π. A convention that equates their counts fails.
- Translating either disk by (1,0) leaves those counts and errors unchanged.
- At a=2 the unit disk has scaled area π/4<1, so the defining estimate makes no assertion there. The scaled open disk nevertheless has count 1 and error 1−π/4; this prevents using the law outside its area range.

*Needs:* Mathlib planar volume and finite lattice counts; RiemannianGeometry R4.9.6a signed planar turning for the curvature convention; the analytic lattice-counting bounds at KHAYUTIN-19 Remark 9.5, p.222, with their stated regularity.

### Construction requirements

Each Eratosthenes application proves 0≤X≤Mx and A_d=0 for d>x; neither an approximate mass nor a residue label supplies them.

Conic comparison specializes integral local classification through the half-norm dictionary, with GL₂(ℤ_p) changes and residue bijections for every pⁿ. The dyadic unit-leading quadratic root estimate must handle repeated-root valuations; summation over the second coordinate retains constant 16. Odd-prime tests do not establish this dyadic estimate.

For quadratic orders prove the conductor-prime formula controlling invertible-ideal norm counts r_Λ(pᵏ) uniformly in k and their coprime norm multiplicativity. Properness and finite norm fibres alone supply neither estimate.

### Examples

With ten unit-weight integers 1,…,10 and P=6, Legendre gives S=10−5−3+1=3, the survivors 1,5,7. On support {0,1,2,3,6} it gives 5−3−3+2=1: zero contributes to every divisor sum and is removed. At P=1,A₁=10,X=7 the error is R₁=3, so the divisor one cannot be omitted.

Indices 2,…,8 labelled n(10−n) have seven units of mass although only four labels occur. Two indices labelled 7 with weights 2 and 3 give weight 5 there. Excluding residue 1 modulo two leaves sample 0 of weight 2 and removes sample 1 of weight 3; divisibility at zero would reverse this result.

For repeated unit vectors y₁=y₂ each Gram row is 2 and the weighted left side is |⟨x,y₁⟩|². A zero vector has row zero and contributes zero; an empty family gives left side zero. Dependence, zero rows and empty indices require no completeness assumption.

Q=x₀² modulo 9 has three x₀ values and nine x₁ values, giving ρ_Q(9)=27. For Q=x₀²+3x₁²+12 the three zeros modulo 3 have no zero lift modulo 9. In the restricted genus count p=3,u=u_A=ω=1,k=1,ε=−1 the correct value is 18. The split form x₀²−x₁² has five zeros modulo three.

### Dependencies

External inputs: AnalyticNumberTheoryPartI §3.26; ArithmeticDirichletSeries Layer 1 norm fibres and Mathlib `LSeries`; GlobalNumberFields Layer 11 orders and Picard groups; IntegralLattices Layers 0 and 3 half-norms and integral local classification.

## Layer 1: Brun and Selberg sieves and polynomial values

Brun brackets supply a relative fundamental estimate; Selberg optimization supplies an upper bound with its absolute lcm remainder. Binary and polynomial applications require the precise local densities and the geometric or joint-law error estimates stated here.

### 1.1 Selberg diagonal sums in dimension one

Throughout this subsection, unless a statement says otherwise: γ is multiplicative, A₁>1, A₂≥0 and L≥1. (Ω₁): 0 ≤ γ(p)/p ≤ 1 − 1/A₁ for every prime p. (Ω₂(1,L)): −L ≤ `Σ_{w≤p<z}` γ(p)log p/p − log(z/w) ≤ A₂ for 2≤w≤z. g(d) = `∏_{p|d}` γ(p)/(p − γ(p)) on squarefree d. GGPY formulate (2.3) as γ(p)/p ≤ 1 − 1/A₁; Maynard's Lemma 6.1 writes 1 − A₁, an equivalent reparametrization.

**Uniform multiplicative mean values.** Establish the squarefree mean below with its positive Euler/Gamma constant. Its dimension-one uniform form is the following: under (Ω₁) and (Ω₂(1,L)) of this subsection, the diagonal error is O(c_γ L), uniformly in γ and L with only A₁,A₂ fixed. The smoothly weighted error is O(c_γ L G_max). Prove these uniform forms in the next two targets, including prime deletion γ(p)=0 for p dividing a varying W. Also prove that there is an absolute c>0 such that for every integer k≥1 and real z≥2,

`Σ_(1≤d<z,(d,k)=1) μ(d)²/φ(d) ≥ c (φ(k)/k) log z`.

This last lower estimate is uniform in k, unlike a fixed-k asymptotic (HB-SIEVES, (3.5)–(3.6), pp.17–18). Prove also the degree-uniform squarefree Euler lower bound of §1.4 directly by its complementary prime-value convolution; it does not require a claim that a general analytic supplier proves it.

**Checks.**

- At k=1,z=2 the sum is 1, so the bound requires c log 2≤1.
- At k=2,z=3 the sum is 1, so the right side is c log 3/2.
- At k=6,z=4 the sum is again 1, with right side c log 4/3. Deleting modulus primes changes the totient factor as well as the allowed divisors.

*Needs:* AnalyticNumberTheoryPartI §§0.11, 0.21 and 0.26; Möbius convolution and Abel summation; the full uniform argument of HR-SIEVE Lemmas 5.3–5.4 as reproduced in GGPY-2009 Lemmas 3–4, pp.9–10.

**Selberg denominator in dimension κ.** Let g be nonnegative multiplicative, supported on squarefree integers, with g(p)<1, Σ_(p≤x)g(p)log p=κlog x+O(1), κ>0, and Σ_p g(p)²log p<∞. Then Σ_(1≤d<z)μ(d)²∏_(p|d)g(p)/(1−g(p))∼(log z)^κ/[Γ(κ+1)H_g], where H_g=∏p(1−g(p))(1−1/p)^(-κ). The limit product is positive under the stated hypotheses.

κ>0; both prime-sum hypotheses; strict d<z.

**Checks.**

- For g(n)=μ(n)²/n, κ=1, the squarefree denominator is asymptotic to log z.
- Omitting μ(d)² makes every d=2ᵃ3ᵇ with a,b≥1 contribute 1/2, giving at least quadratic growth in log z.
- At z=1 the strict sum is 0; the asymptotic concerns z tending to infinity.

([KED-ANT-14](#references), §14.1, Wirsing calculation (14.1.1)–(14.1.5), and §14.2, display(14.2.1) and the following denominator calculation.)

*Proof sketch.* Prove the Wirsing/Levin–Fainleib squarefree mean-value theorem under precisely the displayed two prime-sum hypotheses; apply it to g/(1−g) on squarefree integers. Identify its Euler constant H_g and Gamma factor. Do not reuse the dimension-one result without the changed normalization.

*Needs:* AnalyticNumberTheoryPartI §0.26.

**Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1).** Under (Ω₁) and (Ω₂(1,L)), the partial products of ∏_p (1 − `γ(p)/p)^{−1}(1` − 1/p) converge to some c_γ, and for z≥2, `Σ_{d<z}` μ²(d)g(d) = c_γ log z + O(c_γ L). The implied constant depends only on A₁ and A₂.

Only squarefree d contribute, so g need only be defined on squarefree integers. Maynard calls it totally multiplicative.

([GGPY-2009](#references), §2, Lemma 3 with (2.3)–(2.5), pp. 9–10 (arXiv v1); [MAYNARD-2015](#references), §6, Lemma 6.1 and its proof, p. 400.)

*Proof sketch.* Use the complete Halberstam–Richert Lemmas 5.3–5.4 argument under (Ω₁),(Ω₂), as stated in GGPY Lemma 3 (GGPY-2009 lines 410–440). Retain the coprimality-correction terms throughout the convolution and Levin–Fainleib iteration. Neither (Ω₁) nor (Ω₂) implies Σ_p g(p)²log p<∞, so that estimate cannot justify replacing coprime sums by unrestricted ones. Identify the positive Euler constant by partial summation of (Ω₂) and the convergent unweighted square terms; the general-dimension theorem in §1.6 has its own stronger hypotheses.

**Checks.**

- Choose one prime pⱼ in each (2ʲ,2ʲ⁺¹), j≥2, and set γ(pⱼ)/pⱼ=log 2/log pⱼ, zero elsewhere. The prime-sum error is bounded because each occupied interval contributes log 2; (Ω₁) holds with a fixed margin.
- For the same data, g(pⱼ)²log pⱼ=(log 2)²log pⱼ/(log pⱼ−log 2)²≥log 2/(j+1), so the weighted square sum diverges. This does not contradict the diagonal theorem.
- For γ(p)=1, g(p)=1/(p−1) and c_γ=1; the weighted square sum converges in this special case and the main term is log z.

γ(p) = 1 for p∤W and γ(p) = 0 for p|W gives g(d) = 1/φ(d) on d coprime to W and c_γ = φ(W)/W, so `Σ_{d<z,(d,W)=1}` μ²(d)/φ(d) = (φ(W)/W)(log z + O(L)) with L ≪ 1 + `Σ_{p|W}` log p/p (Maynard (6.7)–(6.8)). The constant is independent of L and of γ beyond A₁ and A₂. Maynard uses this uniformity with L ≪ log log N.

*Needs:* Mathlib `ArithmeticFunction.moebius`; Mathlib `Squarefree`; Mathlib `sum_mul_eq_sub_sub_integral_mul`; AnalyticNumberTheoryPartI §§0.11, 0.26; AnalyticNumberTheoryPartI §0.11.

**Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4).** Under (Ω₁) and (Ω₂(1,L)), for G: [0,1]→ℝ of class C¹ with G_max = `sup_{[0,1]}(|G|` + |G′|): `Σ_{d<z}` μ²(d)g(d)G(log d/log z) = c_γ log z ∫_0^1 G(x) dx + O(c_γ L G_max). The implied constant depends only on A₁ and A₂, not on L or G.

GGPY formulate Lemma 4 for piecewise differentiable F evaluated at log(z/d)/log z. With G(x) = F(1−x) this is Maynard's form, with ∫_0^1 G = ∫_0^1 F(1−x) dx. In Maynard the notation is S for c_γ.

([MAYNARD-2015](#references), §6, Lemma 6.1, p. 400; [GGPY-2009](#references), §2, Lemma 4 and its proof, p. 10 (arXiv v1).)

*Proof sketch.* Write the sum as the Stieltjes integral `∫_{1−}^{z}` G(log u/log z) d𝒢(u), where 𝒢(u) = `Σ_{d<u}` μ²(d)g(d) = c_γ log u + E(u) and |E(u)| ≤ C c_γ L by Layer 1 selberg's diagonal sum in dimension one (ggpy lemma 3, κ=1). Main part: the substitution u = z^x gives c_γ log z ∫_0^1 G(x) dx. The E part: integrate by parts (Abel summation). The boundary terms are at most G_max·C c_γ L, and ∫_1^z |E(u)||G′(log u/log z)| du/(u log z) ≤ C c_γ L G_max.

Maynard applies it with γ from (6.7), (6.11) and (6.19), obtaining (6.9), (6.13) and (6.21). G ≡ 1 recovers Layer 1 selberg's diagonal sum in dimension one (ggpy lemma 3, κ=1).

*Needs:* Layer 1 §1.1 selberg's diagonal sum in dimension one (ggpy lemma 3, κ=1); Mathlib `sum_mul_eq_sub_sub_integral_mul`.

### 1.2 Brun coefficients and the fundamental estimate

**Brun combinatorial coefficients.** For squarefree P, y>1, β>1 and parity ε∈{0,1}, put λ_ε(d)=μ(d) if d|P and the decreasing prime factors p₁>⋯>p_r of d satisfy p_m<(y/(p₁⋯p_m))^(1/β) for every 1≤m≤r with m≡ε mod 2; otherwise put λ_ε(d)=0. Put λ⁺=λ₁ and λ⁻=λ₀. The empty prime list makes λ⁺(1)=λ⁻(1)=1.

Only positive divisors contribute. Prefix p₁⋯p_m includes p_m. Both coefficient systems retain every admissible prefix, not just divisors whose whole number of prime factors has one parity.

([KED-ANT-12](#references), §12.2 definition of D± and §12.3 parameter choice.)

*Construction.* Sort the native finite prime-factor set decreasingly. Test the specified one-based prefix constraints, then use the existing Möbius coefficient with its sign. Define zero outside the positive divisor finset.

The definition exposes the following operations and laws:

- P squarefree,y>1 implies both coefficients at 1 are one.
- The coefficient is zero outside the positive divisors of P, including d=0.
- Each coefficient has modulus at most one.
- For squarefree P and d∣P, the selected coefficient equals μ(d) exactly when every parity-selected prime-prefix inequality holds; otherwise it is 0. The squarefree divisor hypotheses prevent the zero Möbius ambiguity.
- If all primes of P are <z≤y, y>1,β>1, every nonzero coefficient satisfies d<y.

**Checks.**

- P=1,y=2,β=2: both coefficients are 1 at d=1 and zero elsewhere.
- P=6,y=100,β=2: both coefficient lists at 1,2,3,6 are 1,−1,−1,1.
- P=6,y=4,β=2,z=4: λ⁻(1)=1, λ⁻(2)=λ⁻(3)=−1, λ⁻(6)=0; its full divisor sum is −1.
- For P=2,β=2,y=8 the positive coefficient at 2 is zero: 2³=8 fails the strict prefix constraint.

For P=6,y=100,β=2, both systems retain d=1,2,3,6 and agree with μ on those divisors. For P=6,y=4,β=2,z=4, λ⁺ retains only 1 whereas λ⁻ retains 1,2,3; the first-order lower sum is negative on the two-prime obstruction.

*Needs:* Mathlib `BoundingSieve`; Mathlib `Finset.sort`; Mathlib `ArithmeticFunction.moebius`.

**Brun pointwise divisor brackets.** For the Brun construction and every r|P, `Σ_{d|r}λ⁻(d)` ≤ `1_{r=1}` ≤ `Σ_{d|r}λ⁺(d).` Hence `Σ_{d|P}λ⁻(d)A_d≤S≤Σ_{d|P}λ⁺(d)A_d` for nonnegative sample weights.

P squarefree,y>1,β>1; no distribution estimate is assumed.

([KED-ANT-12](#references), Lemma 12.1, its specialization after the proof, and (12.2.1)–(12.2.2).)

*Proof sketch.* Use the decreasing-prime first-failure expansion of source Lemma 12.1 with the consistent strict prime cutoff and left-limit product at the last prime, specialized to density one on the factors of r. Finite inclusion-exclusion leaves a sum of nonnegative first-failure contributions with the required parity sign. The combinatorial identity is polynomial and does not require the analytic strict-density hypothesis when specialized to one. Apply the native-carrier weighted divisor interchange at each sample. Multiply both brackets by its nonnegative weight and sum.

For r=1 both brackets equal one; for P=6,y=4,β=2 and r=6 the lower sum is −1, indicator zero and upper sum one.

*Needs:* Layer 1 §1.2 brun combinatorial coefficients; Layer 0 §0.1 weighted divisibility interchange; Layer 0 §0.1 lower sieve coefficient inequality.

**Brun coefficient modulus bound.** For every P,y,β,ε and d, |λ_ε(d)|≤1.

The assertion is valid even outside the analytic parameter range: each coefficient is zero or the existing Möbius value.

([KED-ANT-12](#references), §12.2 definition of λ± and error estimate.)

*Proof sketch.* Split by the explicit coefficient condition and apply the native Möbius modulus bound after casting to the reals.

No positivity of λ is claimed: selected one-prime divisors have coefficient −1.

*Needs:* Layer 1 §1.2 brun combinatorial coefficients; Mathlib `ArithmeticFunction.abs_moebius_le_one`.

**Strict Brun coefficient support.** For squarefree P,y>1,β>1 and ε∈{0,1}, if every prime of P is <z≤y, then λ_ε(d)≠0 implies d<y.

The single-prime lower-coefficient exception is controlled by p<z≤y. The unit needs y>1.

([KED-ANT-12](#references), §12.3, support exception for single primes in D−.)

*Proof sketch.* For a nonempty decreasing list with last position of the required parity, its last prefix condition directly bounds the full product. Otherwise use the penultimate prefix condition and `p_r<p_{r−1}≤p_{r−1}^β.` Handle a one-prime lower list using the explicit prime cutoff; handle the empty list by y>1.

The result is a strict d<y bound; a large single prime in λ⁻ without the prime cutoff would be a counterexample.

*Needs:* Layer 1 §1.2 brun combinatorial coefficients.

**Dimension-controlled Brun main terms.** Let κ>0,K>1, β=9κ+1, u≥β,y>1,z=y^(1/u), all primes of P satisfy p<z, and g(p)=ν(p) on P and zero off P. Under HasProductSieveDimension(P,g,κ,K), with `V=∏_{p|P}(1−ν(p))` and δ=exp(β−u)K^10, (1−δ)V ≤ mainSum(λ⁻) ≤ V ≤ mainSum(λ⁺) ≤ (1+δ)V.

P in the dimension predicate means the set of its prime factors. Strict prime-density bounds are supplied by BoundingSieve. The displayed non-strict inequalities include every degenerate empty-prime case.

([KED-ANT-12](#references), §12.4 and Theorem 12.2, first two displays.)

*Proof sketch.* Use the finite first-failure expansion with strict prime cutoffs and the last-prime left-limit product: V⁺−V is the sum of odd-length failure masses, and V−V⁻ the sum of even-length failure masses. Each summand is nonnegative. The prefix constraints give p_n≥z_n=z^(1−1/β)^n. Enlarge each summation domain; an ordered distinct-prime sum is at most the n-th power of the unrestricted prime sum divided by n!. The product-dimension bound controls V(z_n)/V(z); if z_n<2 use the identical empty-prime interval or the interval starting at 2. Use the source’s b=9, a=exp(1+1/9)/9<exp(−1), its factorial bound n!≥exp(1)(n/exp(1))^n, and vanishing for n+β≤u. Sum the geometric tail to obtain δ. The lower main term has 1−δ, not the source display’s 1+δ.

δ may exceed one; then the lower bound can be negative and asserts no positive prime lower bound. Empty P gives V⁺=V⁻=V=1.

*Needs:* Layer 1 §1.2 brun combinatorial coefficients; Layer 0 §0.5 euler-product sieve dimension; Mathlib `BoundingSieve`; Mathlib `BoundingSieve.mainSum`.

**Brun fundamental sieve estimate.** Prove `SieveBrun.fundamental_estimate`. Under the Brun main-term hypotheses and X≥0, (1−δ)V X−remainderMass(s,y) ≤ S ≤ (1+δ)V X+remainderMass(s,y), where β=9κ+1,u≥β,z=y^(1/u), δ=exp(β−u)K^10.

This is the proved parameter range of this elementary combinatorial sieve. It is not a sharp beta-sieve theorem, a parity-breaking input or a Chen theorem.

([KED-ANT-12](#references), Theorem 12.2, consequence display.)

*Proof sketch.* Expand A_d=ν(d)X+R_d in both weighted brackets. The modulus and support lemmas give |λ±|≤1 and support d<y. Apply the remainder-mass error lemma, then multiply the main-term inequalities by nonnegative X.

**Checks.**

- P=1, X=S=1, R₁=0, κ=1,K=2,y=exp(10),u=10 gives δ=1024 and −1023≤1≤1025.
- With the same sieve, y=exp(20),u=20 gives δ=1024exp(−10)≈0.04649 and 0.95351≤1≤1.04649. A lower factor 1+δ would fail.
- With P=1, X=0, A₁=S=1 and y>1, R₁=1 and the bounds are −1≤1≤1; omitting R₁ makes the upper bound false.

The range u≥9κ+1 and nonnegativity of X are explicit. A positive sifted lower bound requires both δ<1 and a sufficiently small actual remainder mass.

*Needs:* Layer 1 §1.2 dimension-controlled brun main terms; Layer 1 §1.2 brun pointwise divisor brackets; Layer 0 §0.5 coefficient error controlled by remainder mass; Layer 1 §1.2 brun coefficient modulus bound; Layer 1 §1.2 strict brun coefficient support; Mathlib `BoundingSieve.multSum_eq_main_err`.

### 1.3 Selberg's optimal weights and upper bound

**Selberg optimal weights.** For a native BoundingSieve s and real z>1, put `G(s,z)=Σ_{d|P,d<z}` s.selbergTerms(d). Define λ_z(d)=μ(d)/(ν(d)G(s,z)) times `Σ_{l|P,d|l,l<z}` s.selbergTerms(l) for d|P and d<z, and zero otherwise. Then G>0, λ_z(1)=1 and |λ_z(d)|≤1 on divisors of P. The native quadratic form has minimum 1/G among all weights supported on d<z and normalized at 1.

P is the native squarefree prodPrimes and 0<ν(p)<1 on its prime factors. The cutoff is strict d<z. z>1 is essential: at z=1 the d=1 term is absent. Optimization concerns the main term, not the absolute remainder; the latter remains separate.

([HB-SIEVES](#references), §2, Lemma 2.1 and equations (2.2)–(2.6), pp.8–11.)

*Construction.* Use the native diagonalization, rather than introducing a second quadratic form. Möbius inversion of `y_l=Σ_{d|P,l|d}ν(d)λ(d)` gives the displayed λ when y_l=μ(l)g(l)/G for l<z. Weighted Cauchy–Schwarz gives 1≤G times the diagonal form because λ(1)=1. The displayed y attains equality. For the modulus bound, factor the coprime Euler sums and compare the numerator with G.

The definition exposes the following operations and laws:

- `SieveSelberg.diagonalMass`: G(s,z), using the strict divisor cutoff.
- For z>1, λ_z(1)=1.
- λ_z(d)=0 if d does not divide P or d≥z.
- For z>1 and d|P, |λ_z(d)|≤1.
- s.mainSum(s.lambdaSquared λ_z)=1/G(s,z).
- Every normalized weight w vanishing for d≥z satisfies 1/G≤s.mainSum(s.lambdaSquared w).

**Checks.**

- For P=1 and z>1, G=1 and λ is the indicator of d=1.
- For P=2, ν(2)=1/2 and z=2, G=1 and λ(2)=0.
- For P=2, ν(2)=1/2 and z=3, G=2, λ(2)=−1 and the main sum is 1/2.
- For P=6, ν(2)=1/2, ν(3)=1/3 and z=4, G=5/2, λ(2)=−4/5, λ(3)=−3/5 and λ(6)=0.

*Needs:* Mathlib `BoundingSieve.selbergTerms`; Mathlib `BoundingSieve.mainSum_lambdaSquared_eq_sum_mul_sum_sq`; Mathlib `BoundingSieve.lambdaSquared`; Mathlib `ArithmeticFunction.moebius`.

**Selberg upper-bound sieve.** Prove `SieveSelberg.selberg_upper_bound`. For z>1, `S(s)≤X/G(s,z)+Σ_{d|P,d<z²}3^{ω(d)}|r_d|,` where ω is Mathlib cardDistinctFactors. More precisely S≤X/G+errSum(lambdaSquared λ_z); the displayed absolute-error bound follows from |λ_z|≤1 and the count of ordered squarefree divisor pairs with lcm d.

The native weights are nonnegative; X is totalMass and r_d is the native rem, including d=1. No estimate of the remainder sum is assumed or inferred from the cutoff.

([HB-SIEVES](#references), §2, the Fundamental Theorem for Selberg's sieve and its proof, pp.11–12.)

*Proof sketch.* Apply the native upper-Möbius theorem to λ_z(1)=1. At a squarefree d each prime is in the first divisor, second divisor, or both, giving 3^ω(d) pairs. Nonzero λ_z(d₁)λ_z(d₂) forces lcm(d₁,d₂)<z². Keep the exact error before bounding it.

*Needs:* Layer 1 §1.3 selberg optimal weights; Mathlib `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius`; Mathlib `ArithmeticFunction.cardDistinctFactors`.

### 1.4 the binary polynomial sieve

**Binary sieve Euler denominator.** For each integer degree bound d≥1 there is c_d>0 such that a nonnegative multiplicative g with 0≤g(p)≤d satisfies `Σ_{n≤z}` μ(n)²g(n)/n≥c_d `∏_{d<p≤z}(1−g(p)/p)⁻¹` for z>1. The source starts with arbitrary real d>0; the integer version suffices for polynomial degree.

Native multiplicative arithmetic function; nonnegative; prime values bounded by d; z>1.

([KHAYUTIN-19](#references), Lemma 9.8 and equations (35)–(37), pp.223–224.)

*Proof sketch.* Extend g’s prime values completely multiplicatively and compare with h(p)=d−g(p). Their squarefree Dirichlet convolution is d^ω. Use the squarefree d^ω/n lower estimate and the Mertens product comparison; the squarefree lower estimate uses the complementary convolution proof in this target and the product comparison uses AnalyticNumberTheoryPartI §§0.21, 0.26.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.7 binary schwartz–zippel specialization; AnalyticNumberTheoryPartI §§0.21, 0.26; Layer 1 §1.1 uniform multiplicative mean values.

**Curvature-to-area and lcm cutoff comparison.** For a bounded strictly convex C² planar domain with maximal curvature radius R>0 and area A, prove A≤πR². The domain may use either open or closed boundary conventions: its closure has the same area and curvature radius, while its lattice population keeps the original convention. Consequently, if θ∈(0,2], z≥2 and z⁵R^θ≤A, then R>1 and z≤A^(1/5)≤A^(1/4); in particular z²≤√A. This comparison closes the lcm-domain requirement in the full binary-sieve range.

([KHAYUTIN-19](#references), Definition 9.4 and Lemma 9.9 proof, lines 3460–3473 and 3611–3645.)

*Proof sketch.* For a smooth boundary use RiemannianGeometry R4.9.6a to parameterize by tangent angle: its length is the integral of the curvature radius, hence at most 2πR. For a C² boundary, convolve its continuous positive curvature-radius function in tangent-angle coordinates with a positive mass-one periodic mollifier. This preserves its zero first sine/cosine moments (closure), positivity, and the bound by R; integrate to obtain smooth convex boundaries and pass to the C² limit in length and area. Apply Isoperimetry I2 to the closure to obtain A≤πR²; its C² boundary has planar area zero, so closing the domain changes neither area nor curvature radius. No closure is taken in the lattice count. If R≤1 then z⁵≤πR^(2−θ)≤π<32, contrary to z≥2. Thus R>1; the remaining inequalities follow from A≥z⁵.

**Checks.**

- A circle has A=πR² and attains the area bound; at R=1 no z≥2 satisfies z⁵R^θ≤A.
- For a circle R=32, θ=1, z=2, z⁵R=1024≤1024π=A and z²=4≤√A.
- The open and closed unit disks have the same area π and radius R=1 but lattice populations 1 and 5. The L-domain count must retain its stated boundary convention.
- Treating R as an unrelated positive parameter fails: A=10⁸,R=10⁻⁸,θ=1,z=120 gives z⁵R=248.832≤A but z²=14400>√A=10000. The curvature relation excludes this data.

*Needs:* Isoperimetry I2 convex-body isoperimetry; RiemannianGeometry R4.9.6a signed planar turning; the C² approximation argument in this comparison; the maximal-curvature-radius definition in the L-domain contract.

**Finite-character Gram bound from lattice discrepancies.** For Cₗ>0 and 0<θ≤2, let E be a bounded convex C² L(Cₗ,θ) domain with its specified boundary convention of area A≥1 and maximal curvature radius R>0. Let w≥1 satisfy w²≤√A, and write N=#(E∩ℤ²). Use the finite family of additive characters

`χ_(m,u)(x)=e((u₁x₁+u₂x₂)/m)`,

where 1≤m≤w is squarefree, 0≤u₁,u₂<m, and gcd(m,u₁,u₂)=1. The modulus-one member is the constant character. For arbitrary complex coefficients a_x on E∩ℤ², prove

`Σ_(m,u)|Σ_(x∈E∩ℤ²) a_x χ_(m,u)(x)|² ≤ (N+2CₗR^θw^(7−2θ)) Σ_(x∈E∩ℤ²)|a_x|²`.

This general finite-character estimate is an owned prerequisite to the binary sieve. It has no polynomial or forbidden-residue hypothesis.

([KHAYUTIN-19](#references), Lemma 9.9, discrepancy construction following (38), pp.224–225; KHAYUTIN-19 lines 3611–3646. The bound here uses the elementary complete-character count rather than the sharper row summation in the source.)

*Proof sketch.* Use negative-phase vectors so the first-slot pairing recovers the displayed character sum. Distinct primitive frequency labels give distinct characters on their lcm quotient, so the uniform main-term correlation is zero off the diagonal. For a=lcm(m,n)≤w²≤√A, the two L-domain errors give |r_a(y)|≤2Cₗ(R/a)^θ: the population-normalization error is divided by a², and a⁻²≤a⁻θ. Summing over a² residue points bounds each off-diagonal correlation by 2CₗR^θa^(2−θ). There are at most n² character labels at modulus n. The row error is therefore at most

`2CₗR^θ w^(2−θ) Σ_(n≤w)n^(4−θ) ≤ 2CₗR^θ w^(7−2θ)`.

The supplied finite Gram-row inequality gives the result, including an empty population. The number of character labels is bounded by n² uniformly; the smaller factor n in the source is not needed for this proof.

**Checks.**

- At w=1 the only character is constant. A constant coefficient on N sample points gives squared sum N² and coefficient energy N; the main population term cannot be omitted.
- At moduli one and two, the two sample points (0,0),(1,0) with coefficients 1,−1 give character sums 0,2,0,2 over the four primitive character labels. The squared sum is 8 and the coefficient energy is 2.
- At θ=1/4, the proved error exponent is 7−2θ=13/2. The binary proof uses w=z^(10/13), so w^(13/2)=z⁵ exactly. The Euler-product comparison costs a fixed power (13/10)^degree, rather than changing the theorem's θ range.

*Needs:* ErdosProgressionPowers §3.1 finite Gram inequality; Layer 0 §0.11 translated lattice discrepancies; Mathlib `AddChar.sum_eq_zero_of_ne_one` and `AddChar.sum_eq_card_of_eq_one`; primitive-frequency uniqueness as proved in this target; Mathlib finite Euclidean spaces and `Real.fourierChar`.

**Binary sieve cutoff comparison.** For a polynomial of degree d≥1, z≥2 and s≥1, with content primes omitted on both sides, `∏_{d<p<z^(1/s)}(1−ρ_Q(p)/p²)≤C_d` s^d `∏_{d<p<z}(1−ρ_Q(p)/p²).` Constants depend only on d. Requiring s≥1 removes the false vanishing right side as s tends to zero.

s≥1; z≥2; nonzero reduction at every included prime.

([KHAYUTIN-19](#references), Lemma 9.11, p.225.)

*Proof sketch.* Use Schwartz–Zippel to bound the local factors and a uniform Mertens estimate between the two cutoffs. Bound primes in the fixed small range separately.

*Needs:* Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.7 binary schwartz–zippel specialization; AnalyticNumberTheoryPartI §0.21.

**Binary-form large sieve with a conservative cutoff.** For Q with nonzero reduction at every prime p<z and a bounded strictly convex C² domain E in L(Cₗ,θ), with area A≥1, maximal curvature radius R>0 and 0<θ≤2, the number of points in E∩ℤ² with Q>0 and no prime p<z dividing Q is at most C A∏_(deg Q<p<z)(1−ρ_Q(p)/p²), with C depending only on degree and Cₗ, for 2≤z≤min((A/R^θ)^(1/5),A^(1/4)). This intermediate has lcm(m,n)≤z²≤√A directly. Use the same finite-character bound with the bounded-power cutoff and Euler-product comparison; the full-cutoff theorem below follows from the curvature-to-area comparison.

([KHAYUTIN-19](#references), Lemma 9.9, proof (38), pp.224–225.)

*Needs:* The Euler denominator; the owned finite-character Gram bound and the Euler cutoff comparison; Layer 0 §0.11 translated lattice discrepancies.

**Binary-form large sieve on convex domains.** For a planar domain in L(C_l,θ), area A≥1 and radius R>0, θ∈(0,2], and 2≤z≤min((A/R^θ)^(1/5),A^(1/2)), the number of integer points with positive Q-value and no prime p<z dividing that value is at most C `A∏_{deg Q<p<z}(1−ρ_Q(p)/p²).` C depends only on degree and C_l. Here R is the maximal curvature radius of the compact strictly convex C² boundary, and L(Cₗ,θ) is the uniform translated/scaled discrepancy class of §0.11. The full source range is retained with the strict prime cutoff p<z.

Q mod p nonzero for every p<z; the stated convex C² geometry; L-domain input; θ≤2. The lcm cutoff follows from the curvature-to-area comparison above.

([KHAYUTIN-19](#references), Lemma 9.9 and proof (38), pp.224–225.)

*Proof sketch.* Set b=max(5,7−2θ), so 5≤b<7, and w=z^(5/b)≤z. The curvature-to-area comparison gives w²≤√A, and R^θw^b=R^θz⁵≤A. The finite-character Gram bound is at most (1+3Cₗ)A, since N≤A+CₗR^θ and w≥1. For coefficients masked to the survivors, finite Parseval and Cauchy–Schwarz at a prime p give nontrivial-character energy at least ρ_Q(p)/(p²−ρ_Q(p)) times the squared survivor count. Iterate this inequality over squarefree moduli by CRT; this tensor calculation is part of this proof. A full local bad set makes the survivor count zero and is handled first. Otherwise the resulting denominator H includes d=1, hence H≥1; the character bound gives S(w)²H≤(1+3Cₗ)A S(w). Handle S(w)=0 separately and cancel only a positive count, then use the Euler denominator at w, retaining only primes p<w. The rough-point count at z is at most that at w. The Euler cutoff comparison with s=b/5≤7/5 bounds the latter product by C_degree·s^degree times the product at z. For 1<w<2 the only modulus is one and H=1, so exactly the same Euler-product comparison applies. Thus the full result has constants depending only on degree and Cₗ, for every 0<θ≤2.

*Needs:* Layer 1 §1.4 finite-character Gram bound from lattice discrepancies; Layer 1 §1.4 binary sieve cutoff comparison; Layer 0 §0.7 binary polynomial local densities; Layer 0 §0.7 binary schwartz–zippel specialization; Layer 1 §1.4 binary sieve euler denominator; ErdosProgressionPowers §3.1 uniform Gram-row inequality; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

**Binary polynomial sieve at power level.** If A≥1, R^θ≤A^(1−η), 0<η<1/2, θ∈(0,2], and 1≤z≤A^ς for fixed ς>0, the positive-value rough-point count is ≤C `A∏_{deg Q<p<z}(1−ρ_Q(p)/p²),` with C depending only on degree,C_l,η,ς. Content primes below z give an empty sifted set.

L(C_l,θ) domain; polynomial nonzero; η∈(0,1/2); ς>0; positive Q-values.

([KHAYUTIN-19](#references), Lemma 9.12, pp.225–226.)

*Proof sketch.* Apply the safe-cutoff large sieve at z₀=min(z,A^(η/5)); since η<1/2 this also satisfies z₀≤A^(1/4). The rough-point set decreases as the cutoff increases. Compare Euler products with s=max(1,5ς/η), retaining all constant dependence. Handle bounded area directly.

*Needs:* Layer 1 §1.4 binary-form large sieve on convex domains; Layer 1 §1.4 binary sieve cutoff comparison; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

**Binary sieve with divisibility conditions.** For A≥1, R^θ≤A^(1−3η), η∈(0,1/2), θ∈(0,2], a≥1 with a≤A^η, and 1≤z≤A^ς, the count of points with a|Q, gcd(a,Q/a)=1 and Q/a positive and z-rough is at most C Aρ̃_Q(a)/a² times `∏_{deg Q<p<z,p∤a}(1−ρ_Q(p)/p²).` Without the gcd condition use ordinary ρ_Q(a).

L-domain as above; positive quotient; integer a≥1; fixed ς>0.

([KHAYUTIN-19](#references), Lemma 9.13 and Corollary 9.14, pp.226–227.)

*Proof sketch.* Split into the zero residue classes modulo a and rescale the domain by a. The gcd condition removes precisely the classes with maximal singular lifts, leaving corrected density; removing the condition retains every zero class. At primes not dividing a the translated quotient polynomial has the same local count. Check the rescaled area and radius inequalities before applying the level theorem.

*Needs:* Layer 0 §0.7 curve lifting and singular correction; Layer 1 §1.4 binary polynomial sieve at power level; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

**Multiplicative decoupling inequality.** For nonnegative multiplicative native arithmetic functions g,ψ, h=ζ*ψ, integer Z≥1 and prime-power tails `Σ_{j≥v}g(p^j)` summable, `Σ_{a≤Z}g(a)h(a)≤Σ_{a≤Z}g(a)·∏_{p≤Z}[1+Σ_{1≤v≤floor(log` Z/log `p)}ψ(p^v)Σ_{j≥v}g(p^j)].` A finite-tail version with the full admissible exponent cutoff avoids unnecessary convergence assumptions.

Nonnegative multiplicative functions; positive Z; summability required for real infinite sums.

([KHAYUTIN-19](#references), Lemma 9.18 and Remark 9.19, p.228.)

*Proof sketch.* Expand the native divisor convolution. Write the cofactor as a part supported on primes of the divisor and a coprime part. Use multiplicativity for the coprime part, enlarge its finite sum, and factor the remaining nonnegative sum by primes. Infinite tails are justified by monotone finite truncation and the stated summability.

*Needs:* Mathlib `ArithmeticFunction.IsMultiplicative`; Mathlib `ArithmeticFunction.zeta`; Mathlib `ArithmeticFunction.coe_zeta_mul_apply`.

**Average absorption of the density correction.** Assume ρ̃_Q(p^k)≤C `p^{k(2−r)},` C>0,0<r≤1, and a nonnegative multiplicative f with f(n)≤B n^ε for n>0, B>0,0<ε<r. Then `Σ_{a≤z}` `f(a)ρ̃_Q(a)θ_Q(a)/a²≤C′Σ_{a≤z}f(a)ρ̃_Q(a)/a²` for every z≥1, with C′ depending only on degree,B,C,r,ε.

Positive arguments; corrected local bound on every prime power.

([KHAYUTIN-19](#references), Lemma 9.20, p.229.)

*Proof sketch.* Apply decoupling with g=fρ̃/a² and ψ=λ_Q. Only v=1 contributes because λ_Q is squarefree. Each prime correction is O(p^(−1−r+ε)); sum the convergent Euler corrections with uniform constants.

*Needs:* Layer 0 §0.7 binary density correction factor; Layer 1 §1.4 multiplicative decoupling inequality; Layer 0 §0.7 binary schwartz–zippel specialization; Mathlib `Real.summable_one_div_nat_rpow`.

**Large smooth-factor saving.** Under M(A,B,ε), the corrected density power bound C,r with 0<ε<r, α,s,κ>0,z>1 and κ≤(r−ε)log z/(2s), the sum of f(a)ρ̃_Q(a)/a² over z^α≤a≤z with every prime divisor≤z^(1/s) is ≤C′ `exp(−sακ)Σ_{a≤z}f(a)ρ̃_Q(a)/a²,` with C′ depending only on κ,A,B,ε,C,r,degree.

All displayed positive parameters and their inequality.

([KHAYUTIN-19](#references), Lemma 9.21 and equations (41)–(44), pp.229–231.)

*Proof sketch.* Use Rankin’s trick with β=κs/log z, then decouple the multiplicative tilt n^β. A uniform bound needs the actual difference p^(jβ)−p^((j−1)β). The source replaces it by a coarser term whose prime sum grows like log log z; that displayed proof does not close the claimed constant. Prove the uniform Euler-factor estimate retaining these differences.

This estimate concerns the unshifted multiplicative weight. It gives no uniform saving for the shifted weight f(a)ρ̃_Q(k₀a)/(k₀a)²: primes dividing k₀ can force a large smooth factor of a. The fixed-divisor objective below separates that part before using a smooth-factor estimate.

*Needs:* Layer 0 §0.7 multiplicative sieve growth class; Layer 1 §1.4 multiplicative decoupling inequality.

**Extremely smooth-factor saving.** For ρ̃_Q(p^k)≤C `p^{k(2−r)},` C>0,0<r≤1, α∈[0,1],β>0, and z≥3, `Σ_{z^α≤a≤z, P⁺(a)≤log z·log log z}ρ̃_Q(a)/a²≤C′` z^(−rα+β). Here P⁺(1)=1 and zero is excluded. The constant C′ may depend on C,r,α,β; α is fixed before choosing it.

z≥3; positive a; α∈[0,1]; β>0. Fixed α; no uniform-in-α constant is inferred from the printed two-case proof.

([KHAYUTIN-19](#references), Lemma 9.23, p.231.)

*Proof sketch.* Bound corrected density by C^ω(a)a^(2−r), then prove the required extremely-smooth count from AnalyticNumberTheoryPartI §3.35’s Rankin inequality, choosing its tilt with the fixed α and β before its constant. Treat α=0 without log α: use C^ω(a)≪_(C,ε)a^ε and the extremely-smooth count with a smaller error exponent. For fixed α>0 the printed bounded-z argument is valid, with a constant depending on α; absorb that interval into the constant.

*Needs:* Layer 0 §0.7 binary polynomial local densities; AnalyticNumberTheoryPartI §§3.26 and 3.35; the Rankin optimization in this target.

**Binary multiplicative-function sieve.** For a domain in L(C_l,θ), A≥1,R^θ≤A^(1−3η), η∈(0,1/2), θ∈(0,2], positive polynomial values ≤X≤A^δ with X≥1,δ>0, corrected densities ρ̃_Q(p^k)≤C `p^{k(2−r)},C>0,0<r≤1,` and f∈M(A_f,B,ε) with 0<ε<min(r,ηr/(4δ)), the sum of f(Q) over integer points is ≤C′ `A∏_{deg Q<p≤X,p not content}(1−ρ_Q(p)/p²)Σ_{a≤X}f(a)ρ̃_Q(a)/a².` C′ depends only on the listed fixed parameters and degree.

Positive Q-values explicitly required because f is defined on naturals; every analytic parameter and bound shown above.

([KHAYUTIN-19](#references), Theorem 9.7, pp.222–223; proof §9.6, pp.231–235.)

*Proof sketch.* Split each value at the longest increasing-prime-power prefix below A^η, keeping the coprime factorization. Bound rough complementary factors by divisibility sieving; absorb θ_Q on average. Very smooth factors use the two averaging savings. The R₂ treatment in the source uses an ordinary prime-power density bound not implied at that strength by the stated corrected-density hypothesis. This is a separate proof target; e.g. Q=x₀² has ρ_Q(p²)=p³. Do not declare the full theorem proved from the other three ranges.

**Analytic proof requirement.** The ordinary-density R₂ estimate used in Khayutin Theorem 9.7, equation (47), p.233, does not follow from the corrected-density hypothesis: Q=x₀² has ρ_Q(p²)=p³. The named conclusion here is a construction objective requiring a valid replacement for that R₂ estimate at precisely these hypotheses. Its congruence consequences also require that replacement. An additional ordinary-density hypothesis would give a separately scoped theorem, not discharge this objective.

*Needs:* Layer 1 §1.4 binary sieve with divisibility conditions; Layer 1 §1.4 average absorption of the density correction; Layer 1 §1.4 large smooth-factor saving; Layer 1 §1.4 extremely smooth-factor saving; Layer 1 §1.4 binary sieve cutoff comparison; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

**Binary sieve with a fixed divisor.** For k₀≥1, the binary multiplicative sieve bounds `Σ_{k₀|Q}f(Q/k₀)` by C′A times the Euler product over deg Q<p≤X/k₀ excluding content primes and p|k₀, times `Σ_{a≤X/k₀}` f(a)ρ̃_Q(k₀a)/(k₀a)². Require the rescaled curvature inequality (R/k₀)^θ≤(A/k₀²)^(1−3η), X≤A^δ k₀^(1−2δ), positive quotients, and the same fixed parameters. Constants are independent of k₀.

All main-sieve hypotheses; k₀≥1; strengthened rescaled hypotheses displayed.

([KHAYUTIN-19](#references), Proposition 9.25 and proof (50), pp.235–236.)

*Proof sketch.* If X<k₀ there are no positive quotient values. Otherwise the value bound implies k₀²≤A, so the rescaled area is at least one. Keep the original polynomial and split by the exact valuations of Q at primes dividing k₀. For a prime p and n≥0, let d_Q(p,n) be the proportion of pairs modulo p^(n+1) at which Q has exact valuation n. Thus d_Q(p,0)=1−ρ_Q(p)/p², while for n≥1,

`d_Q(p,n)=ρ_Q(p^n)/p^(2n)−ρ_Q(p^(n+1))/p^(2n+2)=ρ̃_Q(p^n)/p^(2n)−(ρ_Q(p^n)−ρsing_Q(p^n))/p^(2n+1)`.

The exact-valuation proportions have the following API.

- At n=0 the proportion is 1−ρ_Q(p)/p², including constant and zero polynomials.
- At n≥1 the two displayed expressions agree by the smooth/singular lifting counts.
- Under the original corrected-density power bound, 0≤d_Q(p,n)≤ρ̃_Q(p^n)/p^(2n)≤C p^(−rn) for every n≥1, with C independent of p,n.
- For a finite set of distinct primes with prescribed nonnegative valuations, the proportion in the residue space modulo the product of p^(n+1) is the product of their exact-valuation proportions, by CRT.

If p^e exactly divides k₀, quotient valuation j≥0 uses n=e+j, including j=0; it never uses a density bound for a quotient polynomial. Write each positive quotient Q/k₀=c b, where every prime dividing c divides k₀ and gcd(b,k₀)=1, taking the entire prime-power part at these primes into c. Separate the sum over c, with local weight f(p^j) and exact-valuation proportion d_Q(p,e+j), before decomposing b into smooth and rough parts. The required analytic estimate is the displayed fixed-divisor bound, with its constant chosen before k₀: prove the summed lattice errors and all four factor ranges uniformly with these valuation restrictions, including the R₂ replacement required by the main theorem. A local proportion bound alone does not prove that global estimate. Keep X/k₀ and the strengthened rescaled curvature condition throughout.

**Short-modulus rough-point estimate.** Put B=A/k₀²≥1. Under the fixed-divisor geometry (R/k₀)^θ≤B^(1−3η), with 0<η<1/2, 0<θ≤2, fixed ς>0, and the same L(Cₗ,θ) domain, prove uniformly for 1≤a≤B^η, n=k₀a and 1≤z≤B^ς that

`#{x∈E∩ℤ²:n|Q(x), gcd(n,Q(x)/n)=1, Q(x)/n>0 and z-rough} ≤ C A ρ̃_Q(n)/n² ∏_(deg Q<p<z,p∤n)(1−ρ_Q(p)/p²)`.

Here deg Q≥1 and C depends only on degree,Cₗ,η,ς; a content prime p<z not dividing n makes the population empty. This estimate needs no corrected-density bound for a quotient polynomial. It extends the residue-class proof of the binary sieve with divisibility conditions (KHAYUTIN-19 line 3718, Lemma 9.13, pp.226–227): at modulus n retain at most ρ̃_Q(n) classes, then apply the degree-uniform rough-point sieve to Q(nu+r)/n. Its area is B/a²≥B^(1−2η)≥1, and

`(R/n)^θ ≤ B^(1−3η)a^(−θ) ≤ (B/a²)^(1−η)`,

while z≤(B/a²)^(ς/(1−2η)). At primes not dividing n, the unit coordinate change preserves ordinary densities. The exact-valuation restriction is retained at primes dividing n.

Use this estimate only while the selected quotient prefix a, including c, is at most B^η. The range c>B^η requires a separate uniform estimate in the fixed-divisor construction objective: it is not a rare smooth tail of the shifted weight. This requirement is additional to the ordinary-density R₂ replacement. The unshifted saving (KHAYUTIN-19 line 3968, Lemma 9.21, (41)) supplies neither of these estimates for the shifted weight.

For comparison, if r runs over the zero classes modulo k₀ and Q_r(u)=Q(k₀u+r)/k₀, the exact finite recombination is

`Σ_r ρ̃_(Q_r)(a)=∏_(p|k₀, p∤a)ρ_Q(p^e) · ∏_(p|k₀, p|a)ρ̃_Q(p^(e+j)) · ∏_(p|a, p∤k₀)ρ̃_Q(p^j)`,

where e=v_p(k₀) and j=v_p(a). The zero-exponent factors are ordinary densities. This identity follows by partitioning residue pairs modulo p^(e+j) and preserving derivatives and one-step lifts when j≥1; at j=0 it counts the original zero classes. It is not an unrestricted identity with ρ̃_Q(k₀a).

**Checks.**

- For Q=x₀²,k₀=p and a=1 there are p zero classes, so Σ_r ρ̃_(Q_r)(1)=p whereas ρ̃_Q(p)=0. The mixed-density formula gives p.
- For Q=x₀²,k₀=p and a=p, the recombination gives p(p²−p)=(p−1)p²=ρ̃_Q(p²). With k₀=p²,a=1 it instead gives p³=ρ_Q(p²), which differs from (p−1)p². At p=2 these totals are 4 and 8.
- For the same Q and k₀=p, every Q_r=pu² has ρ̃_(Q_r)(p)=p²−p. At p=2,3,5 these are 2,6,20; their ratio to p^(3/2) is unbounded. The original densities retain C=1,r=1/2.
- For Q=x₀², d_Q(p,1)=0 and d_Q(p,2)=ρ̃_Q(p²)/p⁴=(p−1)/p². At p=2 these values are 0 and 1/4; the exact quotient valuation zero contributes no mass when k₀=p.
- For Q=x₀, d_Q(p,n)=(p−1)/p^(n+1) for n≥0. At p=2,n=0,1,2 the values are 1/2,1/4,1/8, testing both the zero-exponent branch and the smooth correction. Requiring v₂(Q)=v₃(Q)=1 gives 72 pairs modulo 36, hence proportion 72/36²=(1/4)(2/9)=1/18.
- For Q=x₀², ρ̃_Q(p^(2m))=(p−1)p^(3m−1) for m≥1 and ρ̃_Q(p^(2m+1))=0 for m≥0, also at p=2. With f=1 and squarefree k₀=k, the shifted weight is positive exactly at a=kb²; consequently its total mass for a≤k is φ(k)/k², all at a=k. At k=6 this is 1/18, while every a<6 has weight zero.
- Let k be the product of primes at most P, z=k, α=κ=1, r=1/2, ε=1/4 and s=log k/log P. The smooth tail contains all the preceding mass, so its ratio to the full mass is 1. The admissibility inequality is 1≤log P/8 for P≥exp(8), while exp(−s) tends to zero. This excludes a constant uniform in k in the shifted smooth-saving assertion.
- In the short-modulus estimate, k₀=1 gives n=a and the ordinary divisibility sieve. For Q=x₀² and n=2, gcd(2,Q/2)=1 is impossible, and ρ̃_Q(2)=0; for n=4 the permitted first coordinates are 2 modulo 4 and ρ̃_Q(4)=4. Thus replacing the corrected density by a smooth-only count would lose nonempty populations.
- For B=4096,η=1/6,θ=1 and a=4=B^η, the rescaled area is 256 and the radius bound is (R/n)≤16≤256^(5/6). The cutoff exponent changes from ς to 3ς/2, since 4096^ς=256^(3ς/2). Values with c>4 are outside this short-modulus range.

*Needs:* Layer 1 §1.4 binary multiplicative-function sieve and its factor-range estimates with the stated valuation restrictions; Layer 1 §1.4 binary polynomial sieve at power level and binary sieve with divisibility conditions for the short-modulus estimate; Layer 0 §0.7 curve lifting and singular correction; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

**Binary sieve with a unit congruence.** For k₀,k₁,k₂≥1, prime support(k₁)⊆prime support(k₂), gcd(k₀,k₂)=1, k₀k₁k₂≤A^(η/2), ℓ a unit modulo k₂, R^θ≤A^(1−4η), X≤A^(δ/2), the sum of f(Q/k₀) restricted by Q≡k₀k₁ℓ mod k₀k₁k₂ is bounded by C′A f(k₁)ρ_Q(k₀k₁ℓ;k₁k₂)/(k₁k₂)² times the Euler product to X/(k₀k₁) excluding content primes and p|k₀k₂, times `Σ_{a≤X/(k₀k₁),gcd(a,k₂)=1}` f(a)ρ̃_Q(k₀a)/(k₀a)². Here `ρ_Q(t;k)=ρ_{Q−t}(k).`

All main-sieve hypotheses and displayed strengthened restrictions; positive quotient values.

([KHAYUTIN-19](#references), Definition 9.24 and Proposition 9.26, pp.235–237.)

*Proof sketch.* Put m=k₁k₂ and split the classes r with Q(r)≡k₀k₁ℓ modulo m. Define Q₁(u)=Q(mu+r)/k₁. At p∤m the coordinate change and division are units, so every ordinary and corrected prime-power count agrees with Q's; at p|m, Q₁≡k₀ℓ modulo p is a unit, so those counts are zero. Thus Q₁ satisfies the original corrected-density bound with the same C,r. Since gcd(k₀,m)=1, apply the valuation-restricted fixed-divisor theorem to Q₁ with divisor k₀; no further quotient-by-k₀ density transport is used. On the chosen class Q₁/k₀ is coprime to k₁, giving f(Q/k₀)=f(k₁)f(Q₁/k₀). Sum the ρ_Q(k₀k₁ℓ;m) classes, each of area A/m². The displayed size bounds imply the fixed-divisor curvature and value restrictions after this scaling. This consequence requires the uniform valuation-restricted analytic estimate, as well as the main theorem's R₂ replacement.

**Checks.**

- For Q=x₀,k₀=2,k₁=1,k₂=3,ℓ=1 the residue is Q≡2 modulo 3; its Q₁ is a unit at 3 and has ρ̃_(Q₁)(3^j)=0 for j≥1.
- For Q=x₀,k₀=1,k₁=k₂=2,ℓ=1, a selected class gives Q₁=2u+1. Its densities at 2 vanish, while at 3 it has ρ̃_(Q₁)(3)=3, equal to Q's density.
- For Q=x₀,k₀=2,k₁=k₂=3,ℓ=1, choose x₀=9u+6. Then Q₁=3u+2 and, when 2|Q₁, Q₁/2 is a unit modulo 3. At u=0 the identity for multiplicative f reads f(3)=f(3)f(1).

*Needs:* Layer 1 §1.4 binary sieve with a fixed divisor; Layer 0 §0.7 binary polynomial local densities; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

### 1.5 Brun's sieve for polynomial vectors

**Polynomial Bonferroni brackets.** For a finite candidate set I and the subset B of candidates dividing the quotient, the alternating sum over subsets G⊆B of size≤2v−1 is ≤1_(B empty), and the sum through 2v is ≥ that indicator. The upper bracket is nonnegative, so its componentwise product is valid.

Finite sets; v≥1 for the lower odd bracket; v=0 upper bracket equals one.

([BSKK-23](#references), Equations (8.1)–(8.3), pp.39–40.)

*Proof sketch.* Apply the finite binomial alternating-sum identity to |B|. The subsets select distinct irreducibles; do not count ordered tuples. Use nonnegativity before multiplying upper brackets across prime components.

*Needs:* Layer 0 §0.10 polynomial-vector sieve data; Mathlib `Finset`.

**Brun sieve for polynomial vectors.** For r prime labels, arbitrary joint law on monic degree-n components, monic D_i, finite monic irreducible sets I_i of degrees≤ℓ_i with ℓ_i≥11, Pr(E_(D,I))≤2^r/||D||·∏i∏J∈I_i(1−p_i^(−deg J))+Σ_G|Pr(DG|A)−1/||DG|||. G_i runs over products of distinct J∈I_i with ω(G_i)≤6logℓ_i; hence deg G_i≤6ℓ_i logℓ_i. Independence is not required.

ℓ_i≥11; finite candidate sets; prime labels; normalized probability law.

([BSKK-23](#references), Lemma 8.2 and equations (8.4)–(8.7), pp.39–41.)

*Proof sketch.* Choose v_i=ceil(3/2+2logℓ_i), so 2v_i≤6logℓ_i. Take expectation of the product of nonnegative upper brackets. Separate the idealized product main term and the actual joint defects, with coefficient modulus one. Use the prime-polynomial harmonic sum≤1+logℓ and the factorial bound to show each truncated main factor≤2 times its full Euler product.

*Needs:* Layer 1 §1.5 polynomial bonferroni brackets; Layer 0 §0.10 polynomial-vector sieve data; Layer 0 §0.10 finite-field irreducible counts.

**Polynomial Euler product excluding T.** For a prime p and integer m≥0, let I be every monic irreducible of degree≤m except T. Then ∏J∈I(1−p^(−deg J))≤2/(m+1). At m=0 the product is empty and equals one. Omitting an arbitrary further set does not preserve this bound.

All irreducibles in the stated degree range, with T the only excluded one.

([BSKK-23](#references), Lemma 8.3, pp.41–42.)

*Proof sketch.* Expand the reciprocal Euler product over monic m-smooth polynomials and retain all monics of degrees 0,…,m. Their exact number is p^j. The omitted T contributes (1−1/p)≥1/2, giving the bound. Keep the m=0 convention explicit.

*Needs:* Layer 0 §0.10 polynomial-vector sieve data; Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv`.

### 1.6 classical Selberg applications and parity

**Prime upper bound in intervals.** Prove `SieveApplications.prime_interval_upper`. For real x,y≥2, π(x+y)−π(x)≤2y/log y+C y loglog(3y)/(log y)² with an absolute C. The cutoff sieves consecutive integers; primes below it contribute O(z).

x,y≥2; constants independent of x.

([HB-SIEVES](#references), §3, first application of Corollary 3.1 (p.12), estimate (3.3), p.16.)

*Proof sketch.* Use density 1/p and interval remainder≤1. Choose z=sqrt(y)/(log y)³, so that the remainder z²(1+log z)³ is O(y/(log y)³); the native Selberg quadratic main term is optimized before estimating its denominator. Account for primes below z and the 3^ω remainder separately.

*Needs:* Layer 1 `SieveSelberg.selberg_upper_bound`; Layer 1 §1.1 selberg’s diagonal sum in dimension one; AnalyticNumberTheoryPartI §1.2a for the τ₄ harmonic-sum majorant.

**Prime upper bound in progressions.** Prove `SieveApplications.progression_upper`. There is an absolute C such that for k≥1, gcd(a,k)=1 and x≥4k, π(x;k,a)≤C x/[φ(k)log(x/k)]. Retaining C=4 requires the precise denominator estimate in the source; this target uses an unspecified absolute constant.

x≥4k; reduced residue class.

([HB-SIEVES](#references), §3, second application of Corollary 3.1, (3.5)–(3.6), pp.17–18.)

*Proof sketch.* Sieve the progression using primes not dividing k. The interval length is x/k; the local density is 1/p off k and zero at its prime divisors. Use the k-dependent Euler product estimate uniformly, not an asymptotic with fixed k.

*Needs:* Layer 1 `SieveSelberg.selberg_upper_bound`; Layer 1 §1.1 uniform multiplicative mean values for progression-prime deletion.

**Selberg bounds for twin primes and Goldbach.** Prove `SieveApplications.twin_goldbach_upper`. For x≥3 the number of p≤x with p,p+2 prime is O(x/log²x). For even N≥4 the number of p with p,N−p prime is O(C₂·∏_(odd p|N)(p−1)/(p−2)·N/log²N), where C₂=∏_(p>2)(1−1/(p−1)²). The prime-two local factor is handled separately.

Even N in the Goldbach bound; all constants absolute.

([HB-SIEVES](#references), §3, third application: Corollary 3.2 (p.14) and Theorems 3.1–3.2, pp.18–21.)

*Proof sketch.* Use the union of the two forbidden residues at each odd prime. At divisors of N the two residues coincide. At two choose the surviving odd class before forming the product. Write ρ_N(p)=p g_N(p), equal to 1 when p|N and 2 otherwise, for odd p; set ρ_N(2)=0 after separating parity and extend multiplicatively. The Selberg diagonal dominates the squarefree sum with prime factors ρ_N(p)/p. Apply §1.4's binary sieve Euler denominator with degree bound 2, whose constant is independent of N. For the strict diagonal d<z use its inclusive lower bound at z/2, with z≥4. Extract the factors using

`1−2/p=(1−1/p)²(1−1/(p−1)²)` and `(1−1/p)/(1−2/p)=(p−1)/(p−2)`.

Mertens gives the uniform reciprocal-denominator bound with the displayed Goldbach correction; extending that correction from p≤z/2 to every odd p|N only increases it. A sufficiently small fixed power of the population size for z controls the elementary divisor-sum remainder. Bound small prime exceptions and bounded population sizes separately. The twin-prime case uses the same degree-two estimate with no varying collision primes.

**Checks.**

- For N=6 at p=3 the forbidden classes coincide, ρ_N(3)=1, and the ratio of local products is (1−1/3)/(1−2/3)=2. For N=10 at p=3 they are distinct and this ratio is 1.
- At p=5 the collision correction is (1−1/5)/(1−2/5)=4/3; both identities give 3/5=(4/5)²·15/16 when there is no collision. Omitting the varying collision factors loses the uniform N-dependence.
- With odd-prime support {3,5} and strict z=5, the diagonal is 1+2=3 for two forbidden residues at 3. The inclusive comparison at z/2=5/2 has only d=1, hence value 1≤3; an inclusive diagonal at z=5 would additionally count the excluded d=5 with weight 2/3.

*Needs:* Layer 1 `SieveSelberg.selberg_upper_bound`; Layer 1 §1.4 binary sieve Euler denominator with degree bound 2; AnalyticNumberTheoryPartI §0.26 for Mertens and §1.2a for divisor sums.

**Brun reciprocal convergence.** Prove `SieveApplications.brun_reciprocals`. The sum of 1/p over primes p for which p+2 is prime converges, as does the sum including 1/(p+2).

Twin-prime index set; positive terms.

([HB-SIEVES](#references), Corollary 3.3 (Brun), p.21.)

*Proof sketch.* Partial summation of the counting upper bound O(x/log²x) gives a convergent tail integral. The finitely many small primes have finite mass.

*Needs:* Layer 1 `SieveApplications.twin_goldbach_upper`.

**Selberg parity sequences.** For n>0 put a_odd(n)=(1−(-1)^Ω(n))/2 and a_even(n)=(1+(-1)^Ω(n))/2, with both weights zero at n=0. Here Ω counts prime factors with multiplicity. Their divisor sums have the same main term x/(2d), and remainders differing by the Liouville partial sum. At z>sqrt(x), the even sequence has only the survivor 1 and the odd sequence the primes≥z.

Positive integer support 1≤n≤x with x≥1; all primes p<z sieved.

([HB-SIEVES](#references), §4, the sequences A± and estimate (4.2), pp.24–25.)

*Construction.* Use native arithmetic functions, not a new factor-count convention. Exact divisor counts use complete multiplicativity of Liouville and the floor discrepancy.

The definition exposes the following operations and laws:

- The displayed zero-at-zero weights, true for odd parity.
- Both weights vanish at zero.
- For n>0 the two weights sum to one.
- Each weight is zero or one.
- The exact floor/Liouville divisor-count identity.
- Above sqrt(x), the even survivor is 1 and the odd survivors are primes≥z.

**Checks.**

- 1 has even weight 1 and odd weight 0.
- 4 is even parity, although it has only one distinct prime.
- 12 has odd weight 1 since Ω(12)=3.
- Zero has neither weight 1.

*Needs:* Mathlib `ArithmeticFunction.cardFactors`; Mathlib `ArithmeticFunction.liouville`.

### Analytic requirements

Use the lattice-point discrepancy only at scaled area at least one. The curvature-to-area comparison in §1.4 shows that the full source cutoff implies z≤A^(1/5)≤A^(1/4), so lcm(m,n)≤z²≤√A.

Establish degree-uniform squarefree Euler lower bounds, absorption of θ_Q after increasing the growth exponent, and both smooth-factor savings with constants depending only on the stated parameters. Fix α before the extremely-smooth constant and treat α=0 separately.

The ordinary-density R₂ requirement for the binary multiplicative conclusion is stated at that target. For the fixed-divisor conclusion prove the separate uniform valuation-restricted estimate of §1.4 on the original polynomial: the local bound d_Q(p,e+j)≤C p^(−r(e+j)) is available, but quotient-by-quotient constants are not uniform. Separate the entire quotient part supported on primes dividing k₀ before decomposing the remaining part. Use the short-modulus rough-point estimate only up to (A/k₀²)^η; prove a separate bound when the compulsory part exceeds that cutoff. The unshifted smooth-factor saving cannot bound this latter range uniformly. Its finite recombination formula retains ordinary densities when j=0. Retain (R/k₀)^θ≤(A/k₀²)^(1−3η) and the transformed value bound. For the unit-congruence consequence transport Q≡k₀k₁ℓ modulo k₁k₂; its preliminary quotient Q₁ has unchanged densities off k₁k₂ and zero densities on it, and then consumes the uniform fixed-divisor estimate.

Prove positive H_g, the Γ(κ+1) normalization and uniformity under deletion of progression-modulus primes, tracking interval logarithms and totients. The dimension-one diagonal sums additionally require the precise remainder and uniform L estimate behind GGPY Lemmas 3–4; its cited Halberstam–Richert Lemmas 5.3–5.4 need an accessible proof.

Polynomial Brun requires joint-law discrepancy after Bonferroni truncation with every coordinate dependence retained, the §0.10 irreducible harmonic count, and the separate exclusion of T. Independent marginals do not replace joint total-variation control.

### Examples

At P=6,ν(2)=1/2,ν(3)=1/3 and strict z=4, G=1+1+1/2=5/2. The weights λ(1)=1,λ(2)=−4/5,λ(3)=−3/5,λ(6)=0 give diagonal main term 2/5. At P=2,z=2, G=1 and λ(2)=0; at z=3, G=2 and λ(2)=−1.

At P=2,β=2,y=8 the upper Brun coefficient at 2 is zero because 2³<8 is strict, while the lower coefficient is −1. At P=6,y=4,β=2 the lower coefficients are 1,−1,−1,0 and sum to −1; lower brackets need not be nonnegative.

Parity counts multiplicity: 1 and 4 have even weight one, 12 has odd weight one and both weights at zero vanish. At z>√x a rough positive n≤x is a unit or prime, explaining the different survivors despite matching first-order divisor terms.

### Dependencies

Layer 0. External inputs: AnalyticNumberTheoryPartI §§0.11, 0.21, 0.26 and 1.2a; Layer 1 §1.1 uniform multiplicative mean values; AnalyticNumberTheoryPartI §0.11; AnalyticNumberTheoryPartI §§3.34–3.35; Layer 1 §1.4 extremely smooth-factor saving; Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv`; Layer 0 §0.10 finite-field irreducible counts; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies.

## Layer 2: large sieves and Vaughan decomposition

The non-sharp additive theorem follows from tapering, and primitive-character energy follows from Gauss sums and orthogonality. The sharp and quadratic variants require additional analytic proofs. Vaughan decomposition keeps every short-range boundary term and dyadic loss.

### 2.1 tapered Fourier vectors

Throughout this subsection, unless a statement says otherwise, use only local expressions e(t)=(Real.fourierChar t:ℂ), T_M(n)=max(0,M−|n|), `W_{N,L}(n)=(T_{N+L}(n)−T_N(n))/L,` and `K_M(t)=|Σ_{k=0}^{M−1}e(kt)|².` The latter is the unnormalized finite Fejér expression, not a new kernel carrier. Cast naturals/integers to the displayed scalar field. For natural N,L use the existing EuclideanSpace ℂ (Fin (2(N+L)+1)), with frequency n_k=k−(N+L). Mathlib's inner product is conjugate-linear in its first argument. Every sum here is finite.

**Multiplicity of an integer difference.** For M∈ℕ and n∈ℤ, the number of ordered pairs 0≤a,b<M with a−b=n is M−|n|, using natural truncated subtraction M−n.natAbs.

M may be zero; the difference a−b is in ℤ, not natural subtraction.

([BOMBIERI-1971](#references), p.403, finite expansion underlying the displayed formula for K_M.)

*Proof sketch.* For n≥0, send b in 0,…,M−n−1 to (b+n,b). For n<0, send a in 0,…,M−|n|−1 to (a,a+|n|). These are inverse coordinate projections on the filtered pair set. Check the empty ranges when |n|≥M and M=0 before using endpoint arithmetic. The native finite-cardinality bijection and interval count give the common truncated value.

M=3,n=−1 gives two pairs; M=3,n=3 gives none. Natural subtraction inside the filter would incorrectly count extra pairs at n=0.

*Needs:* Mathlib `Finset.card_bij`; Mathlib `Int.card_Icc`.

**Triangular Fourier sum as a squared modulus.** For every M∈ℕ and t∈ℝ, `Σ_{n=−M}^{M}T_M(n)e(nt)=K_M(t),` with the real right side cast to ℂ.

([BOMBIERI-1971](#references), p.403, displayed definition and evaluation of K_M.)

*Proof sketch.* Expand the squared modulus of `Σ_{a<M}e(at)` as its product with its complex conjugate. The native Fourier character laws turn each pair term into e((a−b)t). Group the finite pair sum by its integer difference in [−M,M], using the additive companions of the cited finite product/fiber lemmas. Every pair's difference belongs to that interval. Apply difference-pair-count to each fiber and cast its truncated natural value to max(0,M−|n|). The endpoints ±M have coefficient zero, also when M=0.

At t=0 the sum is M², not M; no normalized Fejér kernel is being used. For M=1 the expression is constantly 1; for M=0 it is zero.

*Needs:* Layer 2 §2.1 multiplicity of an integer difference; Mathlib `RCLike.mul_conj`; Mathlib `AddChar.map_sub_eq_div`; Mathlib `Circle.coe_inv_eq_conj`; Mathlib `Circle.coe_div`; Mathlib `Finset.prod_product`; Mathlib `Finset.prod_fiberwise_of_maps_to'`.

**Sine quotient for a finite Fourier sum.** If sin(πt)≠0, then K_M(t)=(sin(πMt)/sin(πt))² for every M∈ℕ.

The nonzero denominator is essential. At integer t the finite sum is instead M, and K_M(t)=M²; a totalized quotient would incorrectly give zero.

([BOMBIERI-1971](#references), p.403, sine-quotient evaluation of K_M.)

*Proof sketch.* Write e(kt)=e(t)^k using the native additive-character power law. The native exponential-difference norm identity gives |e(t)−1|=2|sin(πt)|, so the hypothesis permits the native finite geometric-series formula. Take norms of (e(t)^M−1)/(e(t)−1). Apply the same exponential identity to the numerator, square, cancel the factor 4, and commute scalar products to obtain the displayed real quotient. M=0 is valid without a separate nonempty-sum assumption.

M=2,t=1/2 gives zero; M=1,t=1/2 gives one. At t=0,M=3 the actual value is 9, demonstrating why the sine-denominator hypothesis cannot be omitted.

*Needs:* Mathlib `Real.fourierChar_apply`; Mathlib `AddChar.map_nsmul_eq_pow`; Mathlib `geom_sum_eq`; Mathlib `Complex.norm_exp_I_mul_ofReal_sub_one`.

**Piecewise taper weights and their bounds.** For L>0, `W_{N,L}(n)` equals 1 if |n|≤N, equals (N+L−|n|)/L if N<|n|≤N+L, and equals 0 otherwise. In all cases `0≤W_{N,L}(n)≤1.`

N,L∈ℕ, n∈ℤ; all inequalities in this formula are real after casting.

([BOMBIERI-1971](#references), p.403, definition of φ_i and the split into its core and taper.)

*Proof sketch.* Split at |n|≤N and |n|≤N+L. In each branch evaluate the two maxima defining T. Since L>0, subtraction of the two affine expressions gives L on the core and a number between 0 and L on the taper. Divide by positive L. Outside both supports the numerator is zero.

N=1,L=2,n=2 gives 1/2; at |n|=N the value is 1, and at |n|=N+L it is zero. L=0 is excluded here; the totalized expression is zero everywhere, not an indicator of the core.

*Needs:* Mathlib `max_def`; Mathlib `Int.cast_abs`.

**Finite tapered Fourier vector.** Construct `φ_{N,L}(x)` with coordinate k equal to `√W_{N,L}(n_k)·e(−n_k` x), as a vector in the existing finite Euclidean space. Real square roots are cast to ℂ.

The constructor allows every natural L, including zero under totalized real division. The useful identities below require L>0.

([BOMBIERI-1971](#references), pp.402–403, finite support of f and the definition of φ_i.)

*Construction.* Use the native WithLp.toLp 2 constructor on the displayed coordinate function; no new vector-space or kernel structure is introduced. The finite range contains every integer frequency from −(N+L) to N+L, including zero endpoint coordinates. It is the support-restricted version of the source's ℓ² vector. The negative phase translates the source's linear-first convention to Mathlib's conjugate-linear-first convention. With L=0 the numerator and quotient are zero, making the entire vector zero.

The definition exposes the following operations and laws:

- For every k, `φ_{N,L}(x)_k=√W_{N,L}(n_k)·e(−n_kx).`
- For all N and x, `φ_{N,0}(x)=0` under totalized real division.
- If L>0 and |n_k|≤N, then `φ_{N,L}(x)_k=e(−n_kx).`

**Checks.**

- For every N and x, `φ_{N,0}(x)` is the zero vector.
- `φ_{0,1}(0)` is the native Euclidean vector (0,1,0).
- For N=L=1,x=1/4, coordinate k=1 (frequency −1) is i, not −i.
- For N=0,L=2,x=0, coordinate k=1 (frequency −1) has squared modulus 1/2, not 1/4.
- The native Euclidean squared norm of `φ_{1,2}(0)` is 4.

Do not replace √W by W: that changes the squared norm and the Gram kernel. The phase sign is tested at a quarter turn; the zero-width case must not assert a positive diagonal mass.

*Needs:* Mathlib `Real.fourierChar`; Mathlib `EuclideanSpace`; Layer 2 §2.1 piecewise taper weights and their bounds.

**Coordinates of the tapered Fourier vector.** For every k, `φ_{N,L}(x)_k=√W_{N,L}(n_k)·e(−n_kx).`

N,L∈ℕ and x∈ℝ; L may be zero.

([BOMBIERI-1971](#references), p.403, definition of φ_i.)

*Proof sketch.* Evaluate the native finite vector constructor at k. The coordinate formula allows the inner-product proof to avoid unfolding a new abstraction.

The frequency is k−(N+L), not k; the endpoints have zero weight when L>0.

*Needs:* Layer 2 §2.1 finite tapered fourier vector.

**Untapered coordinates on the core.** If L>0 and |n_k|≤N, then `φ_{N,L}(x)_k=e(−n_kx).`

([BOMBIERI-1971](#references), p.403, inner-product identification with S(x_i).)

*Proof sketch.* Use the coordinate interface and the first branch of taper-weight. The native real square root of 1 is 1, leaving precisely the phase.

The boundary frequencies ±N belong to the core; strict inequality would discard an actual coefficient in the pairing theorem.

*Needs:* Layer 2 §2.1 coordinates of the tapered fourier vector; Layer 2 §2.1 piecewise taper weights and their bounds.

**Signed Gram kernel of tapered vectors.** For L>0, `⟨φ_{N,L}(x),φ_{N,L}(y)⟩=(K_{N+L}(x−y)−K_N(x−y))/L,` with the real quotient cast to ℂ.

([BOMBIERI-1971](#references), p.403, displayed off-diagonal inner-product formula after K_M.)

*Proof sketch.* Expand the native finite inner product. The nonnegative square root has squared value W, and conjugation changes e(−n_kx) to e(n_kx), so the term is W(n_k)e(n_k(x−y)). Reindex k to the integer interval [−(N+L),N+L] by n_k=k−(N+L), with inverse n↦n+N+L. Split the two triangular sums and divide by L. Use triangular-fourier for N+L. Extend the smaller N interval by zero using the additive companion of the cited subset-product lemma, then use triangular-fourier for N. The result is a signed real difference. Only after taking its absolute value does it give the norm of the inner product; the source convention below records the source display's missing absolute value on this difference.

N=L=1 and x−y=1/2 give Gram value −1 and norm 1, not a negative norm. At x=y the two kernel values are (N+L)² and N².

*Needs:* Layer 2 §2.1 coordinates of the tapered fourier vector; Layer 2 §2.1 piecewise taper weights and their bounds; Layer 2 §2.1 triangular fourier sum as a squared modulus; Mathlib `EuclideanSpace.inner_toLp_toLp`; Mathlib `Real.sq_sqrt`; Mathlib `AddChar.map_sub_eq_div`; Mathlib `Circle.coe_inv_eq_conj`; Mathlib `Circle.coe_div`; Mathlib `Finset.prod_eq_of_subset`.

**Squared norm of the tapered Fourier vector.** For L>0, `‖φ_{N,L}(x)‖²=2N+L.`

([BOMBIERI-1971](#references), p.403, displayed diagonal inner product.)

*Proof sketch.* Set y=x in the signed Gram identity. Every phase in K_M(0) is one, so K_M(0)=M². Use the native inner-self identity and expand ((N+L)²−N²)/L=2N+L, cancelling only after L>0.

N=0,L=1 has squared norm 1; N=1,L=2 has squared norm 4. This mass is not the ambient dimension 2(N+L)+1, and not merely the core length 2N+1.

*Needs:* Layer 2 §2.1 signed gram kernel of tapered vectors; Mathlib `inner_self_eq_norm_sq`; Mathlib `AddChar.map_zero_eq_one`.

**Off-diagonal tapered Gram bound.** If L>0 and sin(π(x−y))≠0, then `|⟨φ_{N,L}(x),φ_{N,L}(y)⟩|≤1/(L` sin²(π(x−y))).

([BOMBIERI-1971](#references), p.403, off-diagonal estimate preceding the separation sum.)

*Proof sketch.* Put A=1/sin²(π(x−y)), which is positive. The sine-square formula and the native upper bound sin²≤1 give 0≤K_M(x−y)≤A for both M=N and M=N+L. Two numbers in [0,A] have difference with absolute value at most A, not merely 2A. Apply this elementary interval bound to the corrected signed Gram formula and divide by positive L. Do not assume the kernel difference nonnegative; its sign changes in the half-turn example.

N=L=1,x−y=1/2 attains the bound 1, despite negative Gram value. Coincident phases modulo one are excluded by the nonzero-sine hypothesis; totalized division cannot justify a zero upper bound there.

*Needs:* Layer 2 §2.1 signed gram kernel of tapered vectors; Layer 2 §2.1 sine quotient for a finite fourier sum; Mathlib `Real.sin_sq_le_one`.

**Tapered pairing recovers a core Fourier sum.** For L>0 and f with f_k=0 whenever |n_k|>N, `⟨φ_{N,L}(x),f⟩=Σ_k` f_k e(n_kx).

f is any vector in the same native Euclidean space; coefficients may be arbitrary complex numbers.

([BOMBIERI-1971](#references), p.403, (f,φ_i)=S(x_i), translated to the native convention.)

*Proof sketch.* Expand the finite inner product and split coordinates by |n_k|≤N. On the core apply tapered-core, then conjugate its negative phase to obtain e(n_kx). Outside the core both sides vanish because f_k=0. The identity keeps the full core including both endpoints, without assuming f real or introducing a new padding constructor.

The phase sign and order of the inner-product arguments matter for complex coefficients. Without the support hypothesis a tapered coordinate has an extra square-root factor, so this identity is false.

*Needs:* Layer 2 §2.1 untapered coordinates on the core; Mathlib `EuclideanSpace.inner_toLp_toLp`; Mathlib `AddChar.map_sub_eq_div`; Mathlib `Circle.coe_inv_eq_conj`; Mathlib `Circle.coe_div`.

**Large-sieve bound from cosecant row control.** Let x_i be a finite real family and C≥0. Suppose sin(π(x_i−x_j))≠0 for i≠j and `Σ_{j≠i}1/sin²(π(x_i−x_j))≤C` for every i. For L>0 and core-supported f, Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+L+C/L).

The indexing type may be empty. N,L∈ℕ, L>0, and f_k=0 whenever |n_k|>N. The explicit cosecant row bound is a hypothesis, not an inferred consequence of separation.

([BOMBIERI-1971](#references), pp.403–404, reduction to (5) and its diagonal/off-diagonal decomposition.)

*Proof sketch.* For each i split the Gram row into its diagonal and its erased off-diagonal sum using the native additive erase identity. Use tapered-diagonal on the diagonal and tapered-offdiagonal term by term elsewhere. Factor 1/L out of the finite sum and use the assumed row bound C. The resulting bound B=2N+L+C/L is nonnegative even for an empty family. Apply ErdosProgressionPowers §3.1’s uniform Gram-row inequality to the family of tapered vectors and f. Use norm symmetry of the inner product and tapered-fourier-pairing to identify every summand. No maximum or nonempty-family hypothesis is needed. Do not replace the row hypothesis by the paper's final separation constant here: corrected bin packing, the cosecant sum, the integer taper choice, and interval translation/parity remain separate proof requirements.

The empty family gives 0≤‖f‖²B; a singleton has C=0. This conditional theorem is not the full additive large-sieve theorem with constant length+2/δ.

*Needs:* Layer 2 §2.1 squared norm of the tapered fourier vector; Layer 2 §2.1 off-diagonal tapered gram bound; Layer 2 §2.1 tapered pairing recovers a core fourier sum; ErdosProgressionPowers §3.1 uniform Gram-row inequality; Mathlib `Finset.mul_prod_erase`; Mathlib `norm_inner_symm`.

### 2.2 separated points, interval padding and Bombieri's additive large sieve

Throughout this subsection, unless a statement says otherwise, write d(t)=‖(t:UnitAddCircle)‖ using the native real circle of period one, and e(t)=(Real.fourierChar t:ℂ)=exp(2πit). These are notation, not new carriers. Finite point families x:ι→ℝ are δ-separated when δ≤d(x_i−x_j) for all distinct labels i,j. δ>0 is explicit; no assumption that the family is nonempty.

**Sine lower bound from circular distance.** For every real t, 4d(t)²≤sin²(πt).

([BOMBIERI-1971](#references), p.404, the sine inequality preceding the reciprocal-square sum.)

*Proof sketch.* Put r=t−round t and a=|r|=d(t). Native rounding gives 0≤a≤1/2. Integer π-shift invariance after squaring and the oddness of sine give sin²(πt)=sin²(πa). The sign of r and integer-shift sign disappear only after squaring. Apply Real.le_sin_mul to y=2a: 2a≤sin(πa). Both sides are nonnegative, so square.

At t=0 both sides vanish; at t=1/2 both sides equal one. Positive d(t) implies sin(πt)≠0; the inequality does not falsely exclude integer t.

*Needs:* Mathlib `UnitAddCircle.norm_eq`; Mathlib `abs_sub_round`; Mathlib `Real.le_sin_mul`; Mathlib `Real.sin_sub_int_mul_pi`.

**Two-point bound for circular radial bins.** For a δ-separated finite real family, fixed i and m∈ℕ, #{j≠i: floor(d(x_i−x_j)/δ)=m}≤2. No upper restriction on m is imposed.

([BOMBIERI-1971](#references), p.404, radial intervals I_m and their at-most-two assertion, with the boundary correction recorded under Source-sensitive conventions.)

*Proof sketch.* For each j reduce x_j−x_i to r_j=(x_j−x_i)−round(x_j−x_i)∈[−1/2,1/2). Its absolute value is d(x_i−x_j), by native norm symmetry. Within one floor bin, each |r_j| lies in [mδ,(m+1)δ). Two representatives of the same sign therefore differ in absolute value by strictly less than δ. Zero cannot occur because j≠i and δ>0. For j≠k, round_le applied to x_j−x_k and the integer round(x_j−x_i)−round(x_k−x_i) bounds d(x_j−x_k) by |r_j−r_k|. This contradicts separation for two distinct labels with the same sign. Thus the map recording whether r_j<0 is injective from the bin into the two signs. Apply the native finite-cardinality inequality. The representative of an antipode is −1/2, never +1/2. The unrestricted floor-bin statement keeps the final partial bin and exact distance 1/2; it corrects the endpoint step recorded under Source-sensitive conventions.

With δ=3/10 and x=(0,2/5), the off-diagonal point lies in m=1 although (m+1)δ>1/2. For δ=1/4 an antipode lies in m=2 and is counted once; bin zero is empty for j≠i.

*Needs:* Mathlib `UnitAddCircle.norm_eq`; Mathlib `round_eq_iff`; Mathlib `round_le`; Mathlib `round_sub_intCast`; Mathlib `Finset.card_le_card_of_injOn`; Mathlib `Nat.floor_le`; Mathlib `Nat.lt_floor_add_one`.

**Separated cosecant-square row bound.** For every row i of a δ-separated finite family with δ>0, `Σ_{j≠i}1/sin²(π(x_i−x_j))≤π²/(12δ²).`

([BOMBIERI-1971](#references), p.404, displayed reciprocal-square row estimate.)

*Proof sketch.* For j≠i separation gives positive distance, hence nonzero sine by circular-sine-square. Put m_j=floor(d(x_i−x_j)/δ); then m_j≥1 and d(x_i−x_j)≥m_jδ. The sine bound implies 1/sin²(π(x_i−x_j))≤1/(4m_j²δ²). Group the erased finite sum by the finite image of m_j using native sum_fiberwise_of_maps_to. Each fiber contains at most two labels by circular-bin-packing. The row is at most (1/(2δ²)) times the sum of 1/m² over that finite image. Native hasSum_zeta_two and the additive form of prod_le_hasProd bound that nonnegative finite sum by π²/6. The zero natural term is zero but never occurs in the finite image. Multiplication yields π²/(12δ²).

Empty off-diagonal sums and singleton point families are allowed. This proves the row estimate without assuming δ≤1/2; if there is an off-diagonal point, that upper bound follows automatically.

*Needs:* Layer 2 §2.2 sine lower bound from circular distance; Layer 2 §2.2 two-point bound for circular radial bins; Mathlib `Nat.le_floor_iff`; Mathlib `Nat.floor_le`; Mathlib `Finset.prod_fiberwise_of_maps_to`; Mathlib `hasSum_zeta_two`; Mathlib `prod_le_hasProd`.

**Explicit positive integer taper width.** If 0<δ≤1/2 and L=floor(1/δ)∈ℕ, then L>0 and L+[π²/(12δ²)]/L≤2/δ.

([BOMBIERI-1971](#references), p.404, final integer choice after the row estimate.)

*Proof sketch.* The floor inequalities give L≥2, Lδ≤1 and (L+1)δ>1. Set r=Lδ. Since L≥2, r>L/(L+1)≥2/3. The native bound π<3.15 implies π²/12≤8/9. For 2/3≤r≤1, (r−2/3)(r−4/3)≤0, so r²−2r+8/9≤0. Consequently r²+π²/12≤2r. Divide by positive rδ to obtain the stated taper bound. This explicit floor choice proves the source's desired bound, not a transcription of the source's nearest-integer choice to π/(√12δ). No claim is made that the choices coincide.

At δ=1/2, L=2; at δ=3/10, L=3. For δ=2 the floor is zero: the hypothesis δ≤1/2 cannot be dropped from this taper-width lemma.

*Needs:* Mathlib `Nat.le_floor_iff`; Mathlib `Nat.floor_le`; Mathlib `Nat.lt_floor_add_one`; Mathlib `Real.pi_lt_d2`.

**Large sieve on the centered finite core.** Let 0<δ≤1/2, L=floor(1/δ), N∈ℕ, and x be δ-separated. In EuclideanSpace ℂ (Fin(2(N+L)+1)), write n_k=k−(N+L). If f_k=0 for |n_k|>N, then Σ_i|Σ_k f_k e(n_kx_i)|²≤‖f‖²(2N+2/δ).

The ambient width is this chosen L; the theorem does not silently alter an arbitrary input vector's dimension.

([BOMBIERI-1971](#references), pp.403–404, estimate (5) after the separation sum.)

*Proof sketch.* Set C=π²/(12δ²)≥0. Separation and circular-sine-square supply every nonzero sine required by tapered-row-large-sieve. Cosecant-row-bound supplies its row hypotheses. Integer-taper-choice supplies L>0 and L+C/L≤2/δ. Apply the non-sharp conditional theorem to the same f, then multiply the scalar inequality by the nonnegative squared norm.

N=0 is allowed; the single central coefficient is embedded in the stated larger native space. The number 2N is a centered half-width parameter, not yet an arbitrary original interval length.

*Needs:* Layer 2 §2.2 sine lower bound from circular distance; Layer 2 §2.2 separated cosecant-square row bound; Layer 2 §2.2 explicit positive integer taper width; Layer 2 §2.1 large-sieve bound from cosecant row control.

**Centered interval coefficient vector.** For H,L∈ℕ and a:Fin H→ℂ, put N=floor(H/2), o=L+1−(H mod 2), and D=2(N+L)+1. Define intervalVector H L a∈EuclideanSpace ℂ (Fin D) by coordinate k equal to `Σ_{j∈Fin H}` [k=o+j]a_j. The bracket is the ordinary finite indicator, not a new scalar or carrier.

Natural subtraction in o is nontruncating because H mod 2≤1≤L+1; no positivity of H or L is required.

([BOMBIERI-1971](#references), p.402, replacing the interval length by 2N or 2N+1 and translating the exponential sum.)

*Construction.* Use the native EuclideanSpace constructor on the finite coordinate function; no new coefficient-vector space or quotient is introduced. The expression k=o+j uses natural indices. This fixes which endpoint is padded when H is even; the four coordinate laws establish the usable support, norm and phase properties.

The definition exposes the following operations and laws:

- For k in the ambient finite index, (intervalVector H L `a)_k=Σ_{j∈Fin H, k=o+j}a_j,` with o=L+1−(H mod 2).
- Every coordinate with |k−(floor(H/2)+L)|>floor(H/2) is zero.
- The native squared norm equals `Σ_{j∈Fin H}|a_j|².`
- For c=M+ceil(H/2), the original interval sum equals e(cx) times the centered Fourier sum.

**Checks.**

- For every L and a:Fin 0→ℂ, intervalVector 0 L a is the zero native vector.
- For a,b∈ℂ, intervalVector 2 1 (a,b)=(0,0,a,b,0) in the five-dimensional native Euclidean space.
- For a,b,c∈ℂ, intervalVector 3 1 (a,b,c)=(0,a,b,c,0) in the five-dimensional native Euclidean space.
- For a,b∈ℂ, intervalVector 2 0 (a,b)=(0,a,b). Padding itself is valid at L=0 even though the taper theorem requires L>0.

Its uses and four discriminating tests are specified below.

*Needs:* Mathlib `EuclideanSpace`.

**Coordinates of the centered interval vector.** With N=floor(H/2), o=L+1−(H mod 2), each coordinate of intervalVector H L a is `Σ_{j∈Fin H}[k=o+j]a_j.`

H,L∈ℕ; no positivity assumption.

([BOMBIERI-1971](#references), p.402, centered coefficient family.)

*Proof sketch.* Unfold only the construction and the native Euclidean coordinate map; this is the canonical evaluation rule. For fixed k there is at most one contributing j, because translation of natural indices is injective.

The four construction tests distinguish empty, even, odd and zero-width indexing.

*Needs:* Layer 2 §2.2 centered interval coefficient vector.

**Core support of the interval vector.** For H,L∈ℕ, N=floor(H/2) and n_k=k−(N+L), |n_k|>N implies (intervalVector H L a)_k=0.

([BOMBIERI-1971](#references), p.402, replacement by even/odd centered intervals.)

*Proof sketch.* Write H=2N+ε with ε∈{0,1}. The offset is o=L+1−ε. For j<H, the occupied frequency is `n_{o+j}=j+1−N−ε.` If ε=0, occupied frequencies are 1−N through N, so the −N endpoint is zero. If ε=1, they are −N through N. If H=0 there are no occupied coordinates. Thus a coordinate outside [−N,N] cannot match o+j for any j; all indicator summands in interval-coordinate vanish.

H=2 occupies frequencies 0 and 1, not −1 and 0 under this translation. No separate cutoff assumption is passed to the final theorem.

*Needs:* Layer 2 §2.2 coordinates of the centered interval vector.

**Norm preservation under interval padding.** For every H,L∈ℕ and a:Fin H→ℂ, ‖intervalVector H L a‖²=Σ_j|a_j|².

([BOMBIERI-1971](#references), p.402, preservation of the coefficient-square sum under translation.)

*Proof sketch.* The index map j↦o+j is injective. Using H=2N+ε and o=L+1−ε, verify 0≤o+j<2(N+L)+1 for every j<H; H=0 is empty. Apply EuclideanSpace.norm_sq_eq. At each occupied coordinate, the indicator sum is exactly its unique coefficient; unoccupied coordinates contribute zero. Reindex the finite coordinate-square sum along the injective map, using singleton fibers of native sum_fiberwise_of_maps_to. No cross terms and no multiplicities occur.

For complex (1,i) and H=2,L=1, the squared norm is 2. The conclusion includes H=0 and L=0.

*Needs:* Layer 2 §2.2 coordinates of the centered interval vector; Mathlib `EuclideanSpace.norm_sq_eq`; Mathlib `Finset.prod_fiberwise_of_maps_to`.

**Fourier translation of the padded interval.** For M∈ℤ, H,L∈ℕ, a:Fin H→ℂ, x∈ℝ, N=floor(H/2), c=M+floor((H+1)/2), one has Σ_j a_j e((M+j+1)x)=e(cx)Σ_k(intervalVector H L a)_k e((k−(N+L))x).

([BOMBIERI-1971](#references), p.402, translation and the resulting trigonometric polynomial.)

*Proof sketch.* Expand interval-coordinate, interchange the finite sums and retain the unique coordinate k=o+j. The index is inside the ambient dimension by H=2N+ε. The integer identity c+(o+j−(N+L))=M+j+1 holds for ε=0 and ε=1, since floor((H+1)/2)=N+ε. The native additive character turns the frequency sum into a product. This is equivalently obtained from the existing subtraction/division law; multiply by the nonzero unit phase. Keep the positive 2π Fourier phase and the original starting frequency M+1; do not replace c by M+N for odd H.

For H=2,M=−2,a=(1,i),x=1/4 the original sum is 0; changing the phase sign makes it 2i. For H=1,M=0,a=(1),x=1/4 the original sum is i; this distinguishes the starting frequency M+1 from M and the positive phase from the negative phase.

*Needs:* Layer 2 §2.2 coordinates of the centered interval vector; Mathlib `Finset.prod_fiberwise_of_maps_to`; Mathlib `AddChar.map_sub_eq_div`.

**Cardinality above the circle diameter.** If δ>1/2 and a finite real family is δ-separated modulo one, its indexing type has cardinality at most one.

([BOMBIERI-1971](#references), p.401, separated-point hypothesis of the main theorem.)

*Proof sketch.* Two distinct labels would have δ≤d(x_i−x_j)≤1/2 by the native half-period bound, a contradiction. Hence all labels are equal; the finite type is empty or a singleton.

For δ=2 a singleton is allowed, while floor(1/δ)=0. This does not infer δ≤1/2 from a vacuous separation condition.

*Needs:* Mathlib `AddCircle.norm_le_half_period`.

**Bombieri's additive large sieve.** Prove `SieveTaper.additive_largeSieve`. Let M∈ℤ, H∈ℕ, a:Fin H→ℂ, δ>0 and x:ι→ℝ be a finite δ-separated family modulo one. Then `Σ_i|Σ_{j=0}^{H−1}a_j` `e((M+j+1)x_i)|²≤(H+2/δ)Σ_{j=0}^{H−1}|a_j|².`

Empty coefficient and point families are allowed. No restriction δ≤1/2 or normalization of coefficients is imposed.

([BOMBIERI-1971](#references), p.401, main Theorem; pp.402–404, complete finite proof.)

*Proof sketch.* When 0<δ≤1/2, set N=floor(H/2), L=floor(1/δ), and f=intervalVector H L a. Its support is interval-support, so separated-core applies. Use interval-phase and norm one of e(cx) to identify each original summand; interval-norm identifies the coefficient-square sum. Since 2floor(H/2)≤H, increase the nonnegative scalar bound to H+2/δ. When δ>1/2, separation-card-small leaves at most one point. Native norm_sum_le gives |Σ_j a_j e(...)|≤Σ_j|a_j|. Squared finite Cauchy–Schwarz against the constant one gives its square at most HΣ_j|a_j|²; this is bounded by the claimed expression. The empty point family gives zero on the left. H=0 also gives zero, so all branches include both degenerate cases.

The theorem has the original interval length H, not the centered N. It is Bombieri's H+2/δ constant, not the sharper H−1+1/δ large sieve and not a multiplicative-character or quadratic-symbol large sieve.

*Needs:* Layer 2 §2.2 large sieve on the centered finite core; Layer 2 §2.2 core support of the interval vector; Layer 2 §2.2 norm preservation under interval padding; Layer 2 §2.2 fourier translation of the padded interval; Layer 2 §2.2 cardinality above the circle diameter; Mathlib `Circle.norm_coe`; Mathlib `norm_sum_le`; Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`.

### 2.3 reduced fractions, Gauss sums and the primitive-character large sieve

Throughout this subsection, unless a statement says otherwise, use e(t)=(Real.fourierChar t:ℂ)=exp(2πit), the existing UnitAddCircle norm, and the native DirichletCharacter ℂ q, its conductor-based IsPrimitive predicate and its inverse. There is no new Fourier, character or Farey carrier. q is a positive natural number. The finite ring ZMod q and its unit group use their native instances, including the trivial ring q=1. Write φ(q)=q.totient and τ(χ)=gaussSum χ ZMod.stdAddChar. M is any integer, H and Q are natural numbers, and a:Fin H→ℂ is arbitrary. Write n_j=M+j+1 and `S(t)=Σ_{j<H}a_j` e(n_j t). Empty intervals and Q=0 are permitted.

**Circular separation of reduced fractions.** For natural a,b,p,q,Q with 0<p,q≤Q, a<p, b<q, gcd(a,p)=gcd(b,q)=1 and (a,p)≠(b,q), one has ‖(a/p−b/q:UnitAddCircle)‖≥1/Q².

([KED-ANT-16](#references), §16.1, (16.1.1)–(16.1.2).)

*Proof sketch.* Put t=a/p−b/q and z=round(t). Since both fractions lie in [0,1), t lies strictly between −1 and 1. If t were an integer, it would therefore be zero. Equality of the rational fractions would force a=b and p=q by the native reduced-fraction uniqueness theorem, contradicting the hypothesis. The integer D=aq−bp−zpq is consequently nonzero. Thus |D|≥1. Clear only the positive denominators p and q to obtain |t−z|=|D|/(pq)≥1/(pq). The native circle-norm formula identifies |t−z| with the required norm. Since pq≤Q² and Q>0, reciprocal monotonicity gives the result. This argument includes wraparound, not just the linear separation of real fractions.

The sole reduced pair with numerator zero is (0,1); the endpoint 1/1 is excluded by a<p. 0/1 and 3/4 have circle distance 1/4 although their linear distance is 3/4. Dropping coprimality allows labels (1,2) and (2,4) at the same point.

*Needs:* Mathlib `Rat.div_int_inj`; Mathlib `UnitAddCircle.norm_eq`.

**Additive large sieve over reduced residues.** `Σ_{1≤q≤Q}Σ_{u∈(Z/qZ)×}|S(val(u)/q)|²` ≤ `(H+2Q²)Σ_{j<H}|a_j|².`

([KED-ANT-16](#references), §16.1, Theorem 16.1 and its proof.)

*Proof sketch.* For Q>0 index the family by the native dependent sum of q∈Fin Q and u∈(ZMod(q+1))ˣ, assigning the real point val(u)/(q+1). Native residue bounds and unit coprimality give the hypotheses of reduced-fraction-separation. Distinct labels give distinct reduced pairs: equal moduli and equal natural representatives imply equal residues and then equal units. Thus the family is separated by δ=Q⁻². Apply the non-sharp additive_largeSieve with this positive δ. The additive companion of Finset.prod_sigma rewrites its single family sum as the displayed double sum. Substitute 2/δ=2Q². For Q=0 the modulus indexing type is empty and the right side is nonnegative. H=0 is already admitted by the non-sharp theorem.

Modulus one contributes its single unit at phase zero; it is not discarded. The source Theorem 16.1 has H−1+Q². This statement deliberately uses the weaker H+2Q² supported by the non-sharp additive theorem.

*Needs:* Layer 2 §2.3 circular separation of reduced fractions; Layer 2 `SieveTaper.additive_largeSieve`; Mathlib `ZMod.val_lt`; Mathlib `ZMod.val_coe_unit_coprime`; Mathlib `Finset.prod_sigma`.

**Integer phase of the standard residue character.** For u∈ZMod q and n∈ℤ, stdAddChar(u·n)=e(n·val(u)/q).

([KED-ANT-16](#references), §16.2, the exponential convention in τ and S.)

*Proof sketch.* Replace u by the integer cast of its native natural representative. Combine the residue casts into the cast of the integer product val(u)n. Apply the native standard-character formula at that integer product and the real Fourier-character formula. Rearrange scalar products in the complex exponential. This also handles negative n and nonunit u.

At q=4,u=1,n=−1 the value is −i, detecting a sign reversal. At q=1 every phase is one, including the unique residue zero.

*Needs:* Mathlib `ZMod.stdAddChar_coe`; Mathlib `Real.fourierChar_apply`.

**Squared norm of a primitive Dirichlet Gauss sum.** For a primitive Dirichlet character χ modulo q>0, |τ(χ)|²=q.

χ.IsPrimitive is required; χ≠1 alone is not a substitute at composite modulus.

([KED-ANT-16](#references), §16.2, proof of Theorem 16.2, |τ(χ)|=√q.)

*Proof sketch.* Conductor invariance under inverse makes χ⁻¹ primitive. The native finite Fourier formula gives Dχ(k)=χ⁻¹(−k)τ(χ), using the unnormalized negative-phase DFT. Apply the native DFT twice and evaluate at −1. Its inversion formula gives qχ(1)=q. Factoring constants and commuting reflection with DFT identifies the same value as χ(−1)τ(χ⁻¹)τ(χ). The native Gauss conjugation formula gives conjugate(τ(χ))=gaussSum χ⁻¹ (stdAddChar⁻¹). The inverse additive character is its shift by −1. The native primitive shift theorem identifies this as χ(−1)τ(χ⁻¹). Combine the two equalities and take real parts of τ(χ)conjugate(τ(χ))=q. This proves the square-norm formula without a finite-field assumption, a squarefree modulus assumption or a new Parseval theorem.

For q=1 the unique character is primitive and its Gauss sum is 1. Treating zero as a nonunit in this trivial ring would break the statement. The principal character modulo 4 has Gauss sum 0 and does not satisfy the conclusion.

*Needs:* Mathlib `DirichletCharacter.conductor_inv`; Mathlib `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum`; Mathlib `ZMod.dft_dft`; Mathlib `ZMod.dft_mul_const`; Mathlib `ZMod.dft_comp_neg`; Mathlib `star_gaussSum_eq`; Mathlib `AddChar.inv_mulShift`; Mathlib `gaussSum_mulShift_of_isPrimitive`; Mathlib `RCLike.mul_conj`.

**Gauss expansion of a finite character sum.** For primitive χ modulo q>0, `τ(χ⁻¹)Σ_{j<H}a_jχ(n_j)=Σ_{u∈(Z/qZ)×}χ⁻¹(u)S(val(u)/q).`

χ.IsPrimitive; Q is unused in this single-modulus statement.

([KED-ANT-16](#references), §16.2, proof of Theorem 16.2, primitive Gauss expansion.)

*Proof sketch.* Apply the native primitive Gauss-shift theorem to χ⁻¹ and the residue n_j. Inversion of χ⁻¹ yields χ(n_j), even when n_j is not a unit. Multiply the equality by a_j and sum over the finite interval. Expand the existing Gauss sum and interchange the two finite sums. Terms indexed by nonunits vanish because χ⁻¹ vanishes there. Reindex the remaining residues by the native unit group; this is a bijection onto the unit residues. Apply standard-character-phase at each unit and each integer n_j. Collect the inner finite sum S. Multiplication by τ avoids making an unproved nonzero-denominator cancellation.

The coefficients can be complex, and M can be negative. The formula must hold at nonunit frequencies. A formula proved only for gcd(n_j,q)=1 would be insufficient for an arbitrary interval.

*Needs:* Layer 2 §2.3 integer phase of the standard residue character; Mathlib `DirichletCharacter.conductor_inv`; Mathlib `gaussSum`; Mathlib `gaussSum_mulShift_of_isPrimitive`; Mathlib `MulChar.map_nonunit`.

**Parseval identity over Dirichlet characters.** For arbitrary F:(ZMod q)ˣ→ℂ, `Σ_{χ mod q}|Σ_u` χ⁻¹(u)F(u)|²=φ(q)Σ_u|F(u)|², summing over all Dirichlet characters modulo q.

([KED-ANT-16](#references), §16.2, character-orthogonality step in Theorem 16.2.)

*Proof sketch.* Expand each squared norm as its complex product with its conjugate. Finite interchange gives a sum over pairs u,v of F(u)conjugate(F(v)) multiplied by Σχχ⁻¹(u)χ(v). On units the inverse-character value is χ(u⁻¹). Apply the pinned character orthogonality formula with first argument u. Complex numbers have the required roots of unity; q>0 supplies the finite residue and character instances. Only the diagonal u=v survives, with coefficient φ(q). Units.val is injective, so equality of residues is equality of unit indices. Take real parts to obtain the exact real square-norm identity.

For q=4 and F≡1 on the two units, the left side is 4, equal to 2·2. Using q instead of φ(q) gives the wrong normalization. At q=1 the equality is |F(1)|²=|F(1)|²; no nontriviality of ZMod q is assumed.

*Needs:* Mathlib `DirichletCharacter.sum_char_inv_mul_char_eq`; Mathlib `MulChar.star_apply'`; Mathlib `MulChar.inv_apply`; Mathlib `RCLike.mul_conj`.

**Primitive character energy at one modulus.** `(q/φ(q))Σ_{χ primitive mod q}|Σ_{j<H}a_jχ(n_j)|²` ≤ `Σ_{u∈(Z/qZ)×}|S(val(u)/q)|².`

([KED-ANT-16](#references), §16.2, weighted equality and enlargement to all characters.)

*Proof sketch.* For each primitive χ, take squared norms of finite-gauss-expansion. The inverse is primitive, so its Gauss square norm is q. Divide by positive φ(q), obtaining the source weighted identity. Sum these identities over the finite subset of primitive characters. On the Fourier side only, enlarge that subset to all characters, since every squared modulus is nonnegative. Apply character-parseval to F(u)=S(val(u)/q). Cancel φ(q)>0. The arithmetic character sum itself is never extended to imprimitive χ using the primitive Gauss formula.

The factor is q/φ(q); neither it nor the primitive filter is suppressed. At modulus one both sides equal |Σ_j a_j|². H=0 gives zero.

*Needs:* Layer 2 §2.3 gauss expansion of a finite character sum; Layer 2 §2.3 squared norm of a primitive dirichlet gauss sum; Layer 2 §2.3 parseval identity over dirichlet characters; Mathlib `Nat.totient_pos`.

**Primitive-character large sieve.** Prove `SieveCharacters.primitive_largeSieve`. `Σ_{1≤q≤Q}(q/φ(q))Σ_{χ` primitive mod `q}|Σ_{j<H}a_jχ(M+j+1)|²` ≤ `(H+2Q²)Σ_{j<H}|a_j|².`

([KED-ANT-16](#references), §§16.1–16.2, Theorems 16.1–16.2 and full reduction proof.)

*Proof sketch.* Sum primitive-modulus-energy over moduli 1 through Q, represented in the seed by q∈Fin Q with actual modulus q+1. Apply reduced-fraction-large-sieve to the resulting double sum of Fourier values. Its constant is exactly H+2Q². When Q=0 or H=0 the appropriate sums are empty. No asymptotic range, primality of the moduli, coprimality of the frequencies, or restriction on the complex coefficients is introduced.

This is the Bombieri–Davenport reduction with the non-sharp Bombieri constant. It does not claim the source sharp H−1+Q² constant. The theorem estimates primitive characters of every positive modulus, including nonsquarefree moduli and modulus one. It is not a quadratic-symbol or polynomial-function-field large sieve.

*Needs:* Layer 2 §2.3 primitive character energy at one modulus; Layer 2 §2.3 additive large sieve over reduced residues.

### 2.4 Vaughan's decomposition

Throughout this subsection, unless a statement says otherwise: U,V,N,L,M,n,m,ℓ are natural numbers. Divisors are the native positive divisor finsets; n=0 has no divisors. μ is the native integer Möbius function, Λ the native real von Mangoldt function, and log is the real logarithm with its native value at zero. Write λ_V for incompleteLog V. All cutoffs are inclusive below and strict above. Ioc(a,b) means a<k≤b and is empty when b≤a. No positivity of U or V is needed for the finite identities.

**Incomplete logarithm.** Construct λ_V:ArithmeticFunction ℝ by `λ_V(n)=Σ_{d|n,V<d}Λ(d).` This is a cutoff divisor sum, not log(n/V) and not a multiplicative function.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Construction.* Use the existing zero-preserving arithmetic-function carrier. The finite formula is zero at n=0 because the native divisor finset is empty. For the convolution proof, let h_V(n) be Λ(n) when V<n and zero otherwise, as a local zero-preserving function. Native convolution with ζ gives λ_V=h_V*ζ by coe_mul_zeta_apply. This local abbreviation is not a new exported truncation carrier. The source uses V=floor(x^(1/5)); natural V keeps every endpoint exact and admits independent U,V. Its subtraction formula is established by the next lemma.

The definition exposes the following operations and laws:

- `λ_V(n)=Σ_{d|n,V<d}Λ(d).`
- λ_V(n)=log `n−Σ_{d|n,d≤V}Λ(d).`
- n≤V implies λ_V(n)=0.
- 0≤λ_V(n)≤log n for every natural n.
- (μ*λ_V)(n)=Λ(n) if V<n, and zero otherwise.
- λ_0 is the existing arithmetic logarithm.

**Checks.**

- λ_2(0)=0, as required by the existing carrier.
- λ_4(4)=0; replacing V<d by V≤d would give log 2.
- λ_2(4)=log 2, not log 4: the retained divisor is 4.
- λ_2(12)=log 2+log 3, retaining the prime-power divisors 4 and 3.
- λ_0(n)=log n for every n, including zero and one.

Keep every prime-power divisor, not just prime divisors. At V=0 the result is the full logarithm, while λ_V(n)=0 for n≤V.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `ArithmeticFunction.vonMangoldt`; Mathlib `ArithmeticFunction.coe_mul_zeta_apply`.

**Subtracting the short von Mangoldt divisor sum.** λ_V(n)=log `n−Σ_{d|n,d≤V}Λ(d).`

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Partition the finite positive divisors into V<d and d≤V; these are complementary predicates, including equality. Apply the native vonMangoldt_sum to the unfiltered sum and rearrange the two real finite sums. At n=0 all divisor sums and the native real logarithm vanish.

For n=4,V=2 the subtraction removes Λ(1)+Λ(2), leaving Λ(4). No analytic convergence or inversion theorem is needed.

*Needs:* Layer 2 §2.4 incomplete logarithm; Mathlib `ArithmeticFunction.vonMangoldt_sum`.

**Vanishing below the incomplete-log cutoff.** If n≤V then λ_V(n)=0.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Every divisor in the defining sum satisfies d≤n by Nat.divisor_le. Under n≤V, the additional strict inequality V<d is impossible; the filtered finset is empty. This argument includes n=0.

The equality case n=V must vanish. This is only a sufficient condition: some n>V also have λ_V(n)=0.

*Needs:* Layer 2 §2.4 incomplete logarithm; Mathlib `Nat.divisor_le`.

**Pointwise incomplete-log coefficient bounds.** For every V,n, 0≤λ_V(n) and λ_V(n)≤log n.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Every summand in the tail formula is nonnegative, so the finite sum is nonnegative. In the subtraction formula the short sum is nonnegative, proving the upper bound. No assertion that Λ itself equals log on general n is used.

For n=0 or 1 both bounds are equalities at zero. At V=0 the upper bound is equality for every n.

*Needs:* Layer 2 §2.4 incomplete logarithm; Layer 2 §2.4 subtracting the short von mangoldt divisor sum; Mathlib `ArithmeticFunction.vonMangoldt_nonneg`.

**Möbius inversion of the incomplete logarithm.** (μ*λ_V)(n) equals Λ(n) if V<n and zero otherwise, where μ is cast to ArithmeticFunction ℝ and * is native Dirichlet convolution.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Use the local high-part h_V from the construction and the identity λ_V=h_V*ζ. In the native commutative convolution ring, μ*(h_V*ζ)=h_V*(μ*ζ)=h_V by the native Möbius–zeta inverse. Evaluate at n. In particular, this is an identity for all natural n rather than a formula requiring the later small-number error to be discarded.

For n≤V the convolution vanishes, not Λ(n). For V=0 this specializes to native μ*log=Λ.

*Needs:* Layer 2 §2.4 incomplete logarithm; Mathlib `ArithmeticFunction.coe_moebius_mul_coe_zeta`.

**Vaughan's identity with its boundary term.** Prove `SieveVaughan.vaughan_identity`. `Λ(n)=1_{n≤V}Λ(n)+Σ_{b|n,b≤U}μ(b)log(n/b)−Σ_{b|n,b≤U}μ(b)Σ_{c|n/b,c≤V}Λ(c)+Σ_{b|n,U<b}μ(b)Σ_{c|n/b,V<c}Λ(c).` All μ values are cast to ℝ, and n/b is exact natural division at divisor indices.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Expand (μ*λ_V)(n) using native mul_apply and the generated additive companion of prod_divisorsAntidiagonal. This gives `Σ_{b|n}μ(b)λ_V(n/b).` Add the complementary boundary `1_{n≤V}Λ(n).` By moebius-incomplete-log, the result is Λ(n), including n=0. Partition b-divisors at b≤U. In the low part insert incomplete-log-sub and distribute the finite sum over subtraction; in the high part insert the construction's tail-divisor formula. For n>V the boundary term is zero and the result is exactly the source three-term identity. At positive n, c|(n/b) is equivalent to bc|n when b|n, so the nested divisor form has exactly the printed indexing, with no extra multiplicities.

At n=V=2 the three nonboundary terms cancel to zero; the retained boundary is log 2. U=0 and V=0 are permitted; there is no division by a cutoff and no loss factor.

*Needs:* Layer 2 §2.4 möbius inversion of the incomplete logarithm; Layer 2 §2.4 subtracting the short von mangoldt divisor sum; Layer 2 §2.4 incomplete logarithm; Mathlib `ArithmeticFunction.mul_apply`; Mathlib `Nat.prod_divisorsAntidiagonal`.

**Weighted Vaughan identity on a finite hyperbola.** For arbitrary w:ℕ→ℂ, `Σ_{n∈Ioc(0,N)}Λ(n)w(n)=Σ_{n∈Ioc(0,min(N,V))}Λ(n)w(n)+Σ_{m∈Ioc(0,N)}μ(m)Σ_{ℓ∈Ioc(0,⌊N/m⌋)}λ_V(ℓ)w(mℓ).` Real and integer coefficients are cast to ℂ.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Evaluate moebius-incomplete-log and separate the boundary at each n. Cast to ℂ, multiply by w(n) and sum; the boundary condition n≤V identifies Ioc(0,min(N,V)). For the convolution part expand mul_apply. At 0<n≤N rewrite n.divisorsAntidiagonal as the filtered product Ioc(0,N)×Ioc(0,N), using the native divisor-antidiagonal theorem. Interchange finite sums. For any positive m,ℓ, summing the equality test mℓ=n over n∈Ioc(0,N) leaves the unique term w(mℓ) precisely when mℓ≤N. Thus arbitrary w stays attached to the product, not to either factor separately. For m>0 the product restriction is ℓ≤⌊N/m⌋. Apply the same finite domain conversion as the pinned unweighted sum_Ioc_mul_eq_sum_sum, now retaining w(mℓ). This is the specialized weighted adapter; use the native unweighted convolution summation with the displayed weight retained.

N=0 makes every sum empty. The weight need not be multiplicative, nonnegative, bounded or periodic. Replacing w(mℓ) with w(m)w(ℓ) is invalid.

*Needs:* Layer 2 §2.4 möbius inversion of the incomplete logarithm; Mathlib `ArithmeticFunction.mul_apply`; Mathlib `Nat.divisorsAntidiagonal_eq_prod_filter_of_le`; Mathlib `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum`.

**Exact support of the bilinear Vaughan term.** If λ_V(ℓ)≠0 and mℓ≤N, then V<ℓ and m≤⌊N/(V+1)⌋.

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Contraposition of incomplete-log-support gives V<ℓ, hence V+1≤ℓ. Multiply by m and use mℓ≤N. Since V+1 is positive, native natural division gives m≤N/(V+1). The denominator never vanishes, even at V=0.

No converse is claimed: lying in this region does not imply a nonzero coefficient. For V=2,N=12, ℓ=3,m=4 reaches the exact cofactor endpoint; replacing the bound by a strict inequality would lose it.

*Needs:* Layer 2 §2.4 vanishing below the incomplete-log cutoff.

**Finite Type I–Type II Vaughan decomposition.** Put B=⌊N/(V+1)⌋. For arbitrary w:ℕ→ℂ, `Σ_{0<n≤N}Λ(n)w(n)=Σ_{0<n≤min(N,V)}Λ(n)w(n)+Σ_{0<m≤min(U,B)}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ)+Σ_{U<m≤B}μ(m)Σ_{V<ℓ≤⌊N/m⌋}λ_V(ℓ)w(mℓ).`

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* Start with weighted-vaughan-hyperbola. Remove ℓ≤V by incomplete-log-support; every removed summand is zero. Remove m>B by vaughan-bilinear-support: for every retained inner index, nonzero λ_V(ℓ) would contradict that m-bound. The zero coefficients can be removed without any condition on w. Partition Ioc(0,B) into Ioc(0,min(U,B)) and Ioc(U,B). These sets are disjoint and cover even if U>B. Distribute the finite sum. The first block is the small-Möbius-factor Type I contribution; the second is a bilinear sum with both factors above their cutoffs. Its inner upper limit remains dependent on m. Turning this hyperbola into independent rectangles requires a separate analytic argument, not an equality asserted here.

Both degenerate regimes U≥B (empty Type II) and V≥N (boundary only) are included. A point-mass weight at n=V detects loss of the boundary; a complex nonmultiplicative weight detects incorrect weight factoring. Fourier applications substitute w(n)=e(αn), and Layer 3 substitutes progression indicators; neither specialization supplies the required analytic estimates.

*Needs:* Layer 2 §2.4 weighted vaughan identity on a finite hyperbola; Layer 2 §2.4 exact support of the bilinear vaughan term; Layer 2 §2.4 vanishing below the incomplete-log cutoff.

**Elementary Vaughan coefficient energies.** For L≤M, `Σ_{ℓ∈Ioc(L,M)}λ_V(ℓ)²≤(M−L)(log` M)² and `Σ_{m∈Ioc(L,M)}(μ(m):ℝ)²≤M−L.`

([KED-ANT-18](#references), §18.2, (18.2.1)–(18.2.2); Exercises 18.4.1–2.)

*Proof sketch.* If M=0 then L=0 and both sums are empty. Otherwise each index is positive and at most M. Use incomplete-log-bounds and monotonicity of log on positive inputs to obtain 0≤λ_V(ℓ)≤log M. Square this nonnegative inequality and sum. Use the native |μ(m)|≤1, cast from ℤ to ℝ, square and sum. The two constant sums have cardinal M−L by the native interval cardinality formula. These coefficient-only upper bounds are available to a later bilinear Cauchy–Schwarz step. They claim no cancellation and do not turn the dependent hyperbola into a rectangle.

At L=M both energies are zero. For V≥M the incomplete-log energy is zero, even though the displayed upper bound may be positive. The Möbius bound is an inequality, not equality: the squarefree filter excludes m=4.

*Needs:* Layer 2 §2.4 pointwise incomplete-log coefficient bounds; Mathlib `Real.log_le_log`; Mathlib `ArithmeticFunction.abs_moebius_le_one`; Mathlib `Nat.card_Ioc`.

### 2.5 dyadic bilinear character estimates

Throughout this subsection, unless a statement says otherwise: M,N are arbitrary integers; H,K are natural interval lengths; a:Fin H→ℂ and b:Fin K→ℂ are arbitrary. Write `Aχ=Σ_{j<H}a_jχ(M+j+1),` `Bχ=Σ_{j<K}b_jχ(N+j+1),` E_a=Σ|a_j|² and E_b=Σ|b_j|². Character values use the native residue cast. φ(q) is the native totient. Every character sum is over primitive Dirichlet characters modulo the positive integer q. Write `T(R,Q)=Σ_{R<q≤Q}φ(q)⁻¹Σχ*|Aχ||Bχ|;` this is display notation, not a new carrier or bound predicate. Empty intervals and zero coefficients are allowed.

**Primitive character energy on a dyadic band.** `Σ_{P<q≤2P}φ(q)⁻¹Σχ*|Aχ|²` ≤ ((H+8P²)/P)E_a.

P is a positive natural number.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* For each q>P, φ(q)>0 and 1/φ(q)≤q/(Pφ(q)). Multiply by the nonnegative primitive character energy. Extend the resulting positive sum to all 1≤q≤2P, factor out 1/P, and apply primitive-large-sieve with upper cutoff 2P. The non-sharp constant is H+2(2P)²=H+8P². The source sharper H−1+4P² is not substituted for it.

At H=0 the energy is zero for every P and M. For P=2 the band is {3,4}: q=2 is excluded and q=4 retained. No application of a primitive Gauss identity to imprimitive characters occurs.

*Needs:* Layer 2 `SieveCharacters.primitive_largeSieve`; Mathlib `Nat.totient_pos`.

**Bilinear primitive character bound on one band.** T(P,2P) ≤ P⁻¹√(H+8P²)√(K+8P²)√E_a√E_b.

P is a positive natural number.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* Flatten the finite family of pairs (q,χ), P<q≤2P and χ primitive. Apply real finite Cauchy–Schwarz to the entries |Aχ|/√φ(q) and |Bχ|/√φ(q). The squares of these entries recover the two weighted energies because φ(q)>0. Apply dyadic-primitive-energy to each. Factor their nonnegative square roots. The product of the two factors P^(−1/2) is P⁻¹. Neither coefficient family depends on q or χ; their integer translations can differ.

Setting b=a and K=H, N=M gives the same one-band energy bound. If either family is zero, both sides are zero. The single common character in the two factors is retained, not replaced by two independently summed characters.

*Needs:* Layer 2 §2.5 primitive character energy on a dyadic band; Mathlib `Real.sum_mul_le_sqrt_mul_sqrt`; Mathlib `Real.sqrt_mul`; Mathlib `Real.sq_sqrt`; Mathlib `Real.sqrt_nonneg`; Mathlib `Real.sqrt_le_sqrt`.

**Exact partition of the dyadic modulus interval.** For R,J∈ℕ and arbitrary c:ℕ→ℝ, `Σ_{R<q≤R2^J}c(q)=Σ_{i=0}^{J−1}Σ_{R2^i<q≤2R2^i}c(q).`

R and J are natural numbers, including zero. The real coefficient c may have either sign. Every interval is lower-open and upper-closed.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* Use the generated additive companion of the indexed prod_Ioc_consecutive, or specialize that indexed statement to Multiplicative ℝ. This supplies the native adjacent-interval sum identity. Induct on J. For J=0 both sides are empty. At J+1 join (R,R2^J] and (R2^J,2R2^J]; their union is (R,R2^(J+1)] and the shared endpoint lies only in the first interval. The endpoint order follows from R≥0 and 2^J≥1. For R=0 all intervals are empty. No new general interval partition API is needed.

At R=2,J=2 a point mass at q=4 contributes exactly once. At R=2,J=3 a point mass at q=16 contributes once and one at q=2 contributes zero. Signed test coefficients verify equality, not only a bound for positive terms.

*Needs:* Mathlib `Finset.prod_Ioc_consecutive`.

**Finite sum of the bilinear dyadic coefficients.** For real R>0, H,K≥0 and natural J, put P_i=R2^i. Then `Σ_{i<J}√(H+8P_i²)√(K+8P_i²)/P_i` ≤ 9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K.

R is a positive real number; H and K are nonnegative real numbers; J is natural, including zero. The reciprocal power is 2^(−J)=(1/2)^J, never natural subtraction in an exponent.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* For any P>0 and X≥0, square the nonnegative proposed upper bound √X+3P to prove √(X+8P²)≤√X+3P. This is deliberately weaker than using √8. Multiply the two bounds and divide by P. The result is at most 9P+3(√H+√K)+√H√K/P. Sum the first and last terms using the existing finite geometric-sum formula with ratios 2 and 1/2: ΣP_i=R(2^J−1) and Σ1/P_i=(2/R)(1−(1/2)^J). The middle term does not decay with i and contributes exactly 3J(√H+√K). Retain this factor; dropping it is not justified by the block estimates. All expressions vanish at J=0.

At H=K=0, R=2,J=3 the left side is 112; the displayed upper bound is 126. At J=0 both sides are zero. The scale-independent sum over four bands is four times its summand, not once.

*Needs:* Mathlib `Real.sqrt_le_iff`; Mathlib `Real.sq_sqrt`; Mathlib `Real.sqrt_nonneg`; Mathlib `geom_sum_eq`.

**Primitive bilinear tail through a dyadic endpoint.** For R>0 and J∈ℕ, T(R,R2^J) ≤ [9R(2^J−1)+3J(√H+√K)+(2/R)(1−2^(−J))√H√K]√E_a√E_b.

R is a positive natural number and J is any natural number. Every power and scalar factor on the right is interpreted in ℝ.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* In the exact partition set c(q)=φ(q)⁻¹Σχ*|Aχ||Bχ| for q>0, and c(0)=0. No character family at modulus zero needs to be summed. Each band has positive lower endpoint R2^i. Apply dyadic-primitive-bilinear in each band, using the same a,b and translations. Factor √E_a√E_b out of the scale sum and apply dyadic-bilinear-kernel. Nonnegativity of the energy factor preserves the inequality. The R=q boundary is excluded and the top R2^J boundary is included. With J=0 the tail is exactly empty, and the complete right side is zero.

The empty-scale case is equality at zero, not an asymptotic exception. For R=2,J=3 the character energy at q=16 is retained. No coprimality between the two translations or primality of the moduli is required.

*Needs:* Layer 2 §2.5 exact partition of the dyadic modulus interval; Layer 2 §2.5 bilinear primitive character bound on one band; Layer 2 §2.5 finite sum of the bilinear dyadic coefficients.

**Primitive bilinear tail at an arbitrary cutoff.** If R>0 and Q≤R2^J≤2Q, then T(R,Q) ≤ [18Q+3J(√H+√K)+(2/R)√H√K]√E_a√E_b.

R,Q,J are natural numbers with R>0 and Q≤R2^J≤2Q. These explicit cover and size hypotheses replace a hidden logarithmic rounding convention.

([KED-ANT-18](#references), §18.1, Theorem 18.3 proof: large-r dyadic block estimates and their summation, after (18.1.2).)

*Proof sketch.* Use the positivity of every modulus contribution to enlarge (R,Q] to (R,R2^J], rather than discarding the last partial band. Apply primitive-bilinear-dyadic-tail. From R2^J≤2Q obtain 9R(2^J−1)≤18Q. Since 0≤(1/2)^J≤1, bound 1−(1/2)^J by one. Preserve the middle term 3J(√H+√K). All factors multiplying these comparisons are nonnegative. For R≤Q a valid J can be chosen as the least integer with Q≤R2^J: J=0 if Q=R, while minimality at J>0 gives R2^J<2Q. The theorem requires the explicit two inequalities and does not assert a floating-point logarithm identity. If Q<R the original tail is empty and can be treated directly.

R=2,Q=5,J=2 satisfies the hypotheses and keeps q=5 in the partial last band; J=1 fails the cover condition. Zero-length or zero-coefficient families give zero without dividing by an energy. Applying this to coprimality-filtered coefficients is valid, but extending from primitive to imprimitive characters still requires the separate conductor argument.

*Needs:* Layer 2 §2.5 primitive bilinear tail through a dyadic endpoint.

### 2.6 finite large-sieve duality

**Squared finite large-sieve duality.** For finite index sets I,J, a complex matrix A and C≥0, the inequality Σ_i |Σ_j A_ij a_j|²≤CΣ_j|a_j|² for every a is equivalent to Σ_j |Σ_i conjugate(A_ij)b_i|²≤CΣ_i|b_i|² for every b. With the conjugate the second family is the adjoint; the unconjugated form of the source is equivalent after replacing b by its conjugate. C is the squared norm bound.

I,J finite; C≥0.

([KED-chap-largesieve](#references), §15.2, Lemma 15.4.)

*Proof sketch.* Realize the finite matrix as a continuous map between native finite l² spaces. A squared inequality is equivalent to the operator norm being at most √C. Apply the native isometric adjoint and its involutivity; expand its coordinates.

*Needs:* Mathlib `ContinuousLinearMap.adjoint`.

### 2.7 quadratic large sieves and real-character means

**Heath-Brown quadratic bilinear estimate.** For each ε>0 there is Cε>0 such that M,N≥1 and complex coefficients with |a_m|,|b_n|≤1 satisfy `|Σ_{m≤M,m odd}Σ_{n≤N}` a_m b_n (n/m)|≤Cε(MN)^ε(M√N+√M N). Here squarefree restrictions have been removed using square-part decomposition; denominator m remains odd.

ε>0; M,N≥1; coefficient sup norms at most 1.

([HB-REAL-95](#references), Corollary 4, p.238; proof in §9, p.267.)

*Proof sketch.* As in the source proof of Corollary 4, write the odd denominator as m=kr² with k squarefree. For squarefree k apply Cauchy–Schwarz and the source's Corollary 3, a real-character mean square that allows numerators which are not squarefree; then sum over r≤√M, removing the numerators not coprime to r. Homogeneous scaling restores arbitrary sup norms.

*Needs:* AnalyticNumberTheoryPartII §5.29 odd-squarefree, primitive-real and square-pair quadratic large sieves; Mathlib `jacobiSym`.

**Prime-denominator quadratic symbol.** Define `SieveQuadratic.primeDenominatorSymbol`. Define symbol₂(a,p) to be the native Jacobi symbol (a/p) for odd p; at p=2 it is 0 when a is even and 1 when a is odd. This is the convention of Skorobogatov–Sofos, not the Kronecker symbol at 2.

Integer a; natural p; arithmetic applications assume p prime.

([SS-23](#references), Lemma 6.3 and the preceding convention, §6, pp.725–726.)

*Construction.* Use the native symbol off 2 and an explicit parity branch at 2.

The definition exposes the following operations and laws:

- At an odd prime it equals the native Jacobi/Legendre symbol.
- At 2 it is the indicator that the numerator is odd.
- Absolute value is at most 1 at every prime.
- For prime p, symbol₂(ab,p)=symbol₂(a,p)symbol₂(b,p).

**Checks.**

- symbol₂(3,2)=1 whereas the Kronecker value is −1.
- symbol₂(6,2)=0.
- symbol₂(2,3)=−1.
- symbol₂(9,3)=0.

*Needs:* Mathlib `jacobiSym`.

**Prime quadratic-symbol bilinear estimate.** Prove `SieveQuadratic.prime_quadratic_bilinear`. For ε>0 there is Cε>0 such that K,L≥1 and arbitrary complex coefficients a_k,b_p satisfy `|Σ_{k≤K}Σ_{p≤L,p` prime}a_k b_p symbol₂(k,p)|≤Cε `sup_{k≤K}|a_k|` `sup_{p≤L,p prime}|b_p|` ((KL)^(1+ε)/√min(K,L)+K). Suprema on empty sets are 0. The additive K term covers p=2.

ε>0; K,L≥1; finite restricted sup norms.

([SS-23](#references), Lemma 6.3, pp.725–726; [HB-REAL-95](#references), Corollary 4, p.238; proof p.267.)

*Proof sketch.* Apply the odd-denominator bilinear estimate with M=L,N=K and the prime indicator on denominators. Bound the single p=2 row by K times the two sup norms. Use K√L+√K L≤2KL/√min(K,L).

*Needs:* Layer 2 §2.7 heath-brown quadratic bilinear estimate; Layer 2 `SieveQuadratic.primeDenominatorSymbol`.

**Jutila unweighted mean square.** There is an absolute C>0 such that for integers X≥3,Y≥1,

`Σ_(|D|≤X, D≡0,1 mod 4, D not a square) |Σ_(1≤n≤Y) χ_D(n)|² ≤ C X Y (log X)^8`.

Here χ_D is precisely §0.6's numerical adapter, including nonfundamental discriminants (JUTILA-ORIGINAL, Lemma 2, printed p.194). Prove the real-character mean-square estimate and then the weighted Lemma 3 below; the odd-squarefree theorem consumed from AnalyticNumberTheoryPartII §5.29 is a different input.

**Checks.**

- X=3,Y=1 has only D=−3, giving left side 1 and right side 3C(log 3)⁸.
- X=3,Y=2 has χ_(−3)(1)+χ_(−3)(2)=1−1=0, so its left side is zero.
- Adding square D=1 would contribute Y², rather than a uniformly linear Y term. At Y=2 that extra contribution is 4.

*Needs:* Layer 0 §0.6 real discriminant character adapter; ThetaSeries §2H reciprocity and characters; AnalyticNumberTheoryPartI §§3.22 and 1.2a divisor moments; JUTILA-ORIGINAL Lemma 2, p.194.

**Jutila mean value lemma.** Prove `SieveQuadratic.jutila_mean_value`. There is an absolute C>0 such that X≥3,N≥2 and complex a_1,…,a_N satisfy `Σ_{|D|≤X, D≡0,1 mod 4, D not a square}|Σ_{n=1}^N` a_n χ_D(n)|²≤C[X `Σ_{m,n≤N,mn a square}|a_m` a_n|+√X `N^(7/4)(Σ_{n≤N}|a_n|⁸)^(1/4)(log` N)^6]. The discriminants are not restricted to fundamental discriminants.

Integer X≥3,N≥2; all non-square discriminants in the indicated interval.

([JUTILA-ORIGINAL](#references), Lemma 3, equation (12), and proof (13)–(17), pp.194–195.)

*Proof sketch.* Expand the square and retain the exact square-product diagonal. For the off-diagonal apply Jutila’s earlier mean-square estimate to the reciprocity-transformed discriminant sum. Cauchy–Schwarz and divisor-function fourth-moment estimates give the displayed eighth moment. Use Layer 2 §2.7 Jutila unweighted mean square for Lemma 2 and AnalyticNumberTheoryPartI §§3.22 and 1.2a for the divisor and squared-divisor sums in (17). The scanned display (12) has (log N)⁶; the proof uses (log N)⁸ in (16).

**Checks.**

- For X=3,N=2,a₂=1 and other coefficients zero, D=−3 is the sole discriminant and the squared character sum is 1; the square-product sum is 1.
- For X=8,N=2 and the same coefficients, D=−8,−7,−4,−3,5,8 give squares 0,1,0,1,1,0, totaling 3. The first main term is 8C and the moment term is nonnegative.
- For the Lemma 2 input, X=3,Y=1 gives 1≤3C(log 3)⁸. At Y=2 the divisor and squared-divisor sums are 3 and 5. Square discriminants must stay excluded as Y grows.

*Needs:* Layer 0 §0.6 real discriminant character adapter; Layer 2 §2.7 Jutila unweighted mean square; AnalyticNumberTheoryPartII §5.29; AnalyticNumberTheoryPartI §§3.22 and 1.2a; Mathlib `jacobiSym.quadratic_reciprocity`.

**Smith prime Legendre-symbol estimate.** Prove `SieveQuadratic.smith_prime_legendre_bilinear`. For ε>0 there is Cε>0 such that disjoint finite sets X₁,X₂ of odd primes bounded by t₁,t₂≥2 satisfy `Σ_{p∈X₁}|Σ_{q∈X₂}` jacobiSym(p,q)|≤Cε[t₁ t₂^(3/4+ε)+t₂ t₁^(3/4+ε)].

Disjoint sets of odd primes; t₁,t₂≥2; ε>0.

([SMITH-17](#references), Proposition 6.6 and proof, printed p.62; Koymans–Pagano §7.2, Proposition 7.6, equation (7.11), p.63.)

*Proof sketch.* Specialize Jutila to coefficients supported on X₂, with arbitrary signs. The square-product diagonal is then exactly Σ|a_q|². Cauchy–Schwarz bounds every signed bilinear form. Partition both prime sets by their residues modulo 4 and use reciprocity to obtain the symmetric orientation. Choose outer signs to recover the row absolute values and absorb logarithmic powers into ε. Small bounds are handled by increasing Cε.

*Needs:* Layer 2 §2.7 jutila mean value lemma; Mathlib `jacobiSym.quadratic_reciprocity`.

**Koymans–Pagano normalized row mean.** Prove `SieveQuadratic.koymans_pagano_row_mean`. Fix c₂,c₄,a>0. For every ε>0 there is C>0 such that finite disjoint odd-prime sets X₁,X₂ bounded by 3≤t₁≤t₂, with log t₂≤t₁^c₂ and |X_i|≥a t_i/(log t_i)^c₄ for i=1,2, satisfy Σ_(p∈X₁)|Σ_(q∈X₂)(p/q)|≤C|X₁||X₂| t₁^(−1/4+c₂c₄+ε). The constant depends only on c₂,c₄,a,ε. This is the normalized form of equation (7.11); it does not include the consumer’s prebox equidistribution induction.

All c₂,c₄,a,ε positive; disjoint odd-prime sets; the displayed growth and lower-cardinality conditions.

([KP-22](#references), §7.2, Proposition 7.6 assumptions (ii),(iii), pp.61–63; equation (7.11), p.63.)

*Proof sketch.* Since t₁≤t₂, the Smith bound is O_ε(t₂t₁^(3/4+ε/2)). Divide by the two cardinality lower bounds. Bound (log t₂)^c₄ by t₁^(c₂c₄), and absorb (log t₁)^c₄ into t₁^(ε/2). This proves the advertised dependence without a log t₂ factor hidden in ε.

An exponentially large t₂ is allowed; no logarithm in t₂ may be absorbed into a t₁^ε factor without the explicit growth assumption.

*Needs:* Layer 2 `SieveQuadratic.smith_prime_legendre_bilinear`.

### 2.8 polynomial Farey estimates

**Polynomial Farey coefficient adapter.** Define `SievePolynomialFarey.coefficient`. For prime p, monic H of degree ℓ and deg G<ℓ, define c_j(G/H) as the coefficient of U^j in [Σ_(0≤i<ℓ)G_(ℓ−1−i)U^i]·(H.reverse(U))⁻¹. The unit constant coefficient of the reversed monic denominator is one. c_j is the coefficient of T^(−j−1) in G/H at infinity, and ψ_p(T^jG/H)=exp(2πi c_j.val/p). Use native Polynomial and PowerSeries.

Monic H; deg G<ℓ, allowing G=0; prime p.

([BSKK-23](#references), §6.1 and Lemma 6.2, pp.31–33.)

*Construction.* Reverse the denominator at its native degree and shift the numerator to the fixed denominator degree. Use invOfUnit with unit one; no new Laurent-series field is needed for this finite coefficient adapter.

The definition exposes the following operations and laws:

- The displayed native power-series coefficient.
- Zero numerator gives every coefficient zero.
- For monic H of positive degree ℓ, c₀=G_(ℓ−1).
- It is additive in the numerator.
- For monic H the reciprocal recurrence determines each coefficient beyond the prescribed initial terms.
- For monic H of degree ℓ and degree G<ℓ, the j-th coefficient is the coefficient of T^(−j−1) in the formal expansion at infinity; prove the comparison with native Laurent series using U=T⁻¹ (BSKK-23, §6.1, pp.31–32).

**Checks.**

- For p=2,G=1,H=T, c₀=1 and c₁=0.
- For p=3,G=1,H=T+1, c₀=1 and c₁=−1.
- G=0 makes all coefficients zero, including denominator degree zero.
- For G=1,H=T², c₀=0 and c₁=1; reversing G at its own degree would give the wrong shift.

*Needs:* Mathlib `Polynomial`; Mathlib `PowerSeries.coeff`; Mathlib `PowerSeries.invOfUnit`; Mathlib `Polynomial.reverse`.

**Polynomial Farey large sieve.** Prove `SievePolynomialFarey.large_sieve`. For prime p, m,ℓ≥0 with 2ℓ≥m, and nonnegative f_j:F_p→R, Σ_(H monic degℓ)Σ_(deg G<ℓ,(G,H)=1)∏_(j<m)f_j(c_j(G/H))≤p^(2ℓ−m)∏_(j<m)Σξ∈F_p f_j(ξ). This finite-field formulation is exactly the R/Z test-function statement after evaluating at ξ.val/p.

Prime p; all f_j nonnegative; 2ℓ≥m; denominators monic and coprime numerator.

([BSKK-23](#references), Lemma 6.2, pp.32–33.)

*Proof sketch.* Distinct reduced fractions of denominator degree ℓ differ at some coefficient before index 2ℓ; otherwise GH′−G′H would have incompatible degree. Thus each initial m-coefficient word occurs at most p^(2ℓ−m) times. Sum the nonnegative product by words and factor the full finite-field coordinate sum. This finite counting proof is equivalent to the paper’s disjoint Laurent balls/Haar integral argument.

**Checks.**

- At p=2,ℓ=1,m=2 the reduced fractions 1/T and 1/(T+1) have words (1,0),(1,1). For every f_j=1 the bound is 2≤4.
- At ℓ=m=0 there is exactly 0/1; both empty products equal 1, giving 1=1. The numerator range is degree G<ℓ, using degree 0=−∞. In the acceptance theorem native `Polynomial.ofFn` presents every polynomial of degree<ℓ, including zero when ℓ=0, and the denominators are T^ℓ plus those polynomials.
- At p=2,ℓ=1,m=1, taking f₀ to be the indicator of 0 gives left side 0 and right side 2; the two fractions both have c₀=1. At m=2, the indicator of the word (1,0) gives equality 1=1.

*Needs:* Layer 2 §2.8 polynomial farey coefficient adapter; Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv`; Mathlib `Polynomial.ofFn`.

**Additive sieve for bounded integer coefficients.** For H,Y≥1 and complex a_n supported on integers −H≤n≤H, Σ_(1≤q≤Y)Σ_(a modq,(a,q)=1)|Σ_(|n|≤H)a_n exp(2πian/q)|²≤3(H+Y²)Σ|a_n|². The bound follows from the non-sharp H_interval+2Y² sieve with interval length 2H+1.

H,Y positive integers; primitive rational phases; arbitrary complex coefficients.

([BSKK-23](#references), Equation (3.5) in the proof of Lemma 3.7, p.26.)

*Proof sketch.* Apply the separated reduced-fraction inequality on an integer interval of length 2H+1. Since H≥1,2H+1+2Y²≤3(H+Y²).

*Needs:* Layer 2 §2.3 additive large sieve over reduced residues.

### 2.9 the Hilbert inequality, sharp large sieves and Linnik's theorem

**Separated Hilbert inequality.** For a finite family of real λ_i with |λ_i−λ_j|≥δ>0 for i≠j and complex z_i, the absolute value of Σ_(i≠j) z_i conjugate(z_j)/(λ_i−λ_j) is at most (π/δ)Σ_i|z_i|².

Positive δ; separation on all distinct indices; empty and singleton families are included.

([KED-chap-largesieve](#references), Lemma 15.1 and Exercise 15.4.2, §15.2 and §15.4.)

*Proof sketch.* Prove the separated Hilbert-transform norm bound of Exercise 15.4.2, then apply Cauchy–Schwarz. Its analytic proof is required; squared matrix duality alone supplies no Hilbert constant.

*Needs:* Mathlib `Complex.normSq`.

**Sharp separated additive large sieve.** Prove `SieveTaper.sharp_additive_largeSieve`. For N≥1, δ>0 with δ≤1/2, distinct frequencies x_i separated modulo 1 by at least δ, and a_j on an interval of N consecutive integers, Σ_i `|Σ_{j=1}^N` a_j exp(2πi(M+j)x_i)|²≤(N−1+δ⁻¹)Σ_j|a_j|². The empty coefficient interval is handled separately by zero, not by extending a negative constant.

N≥1; 0<δ≤1/2; finite frequency family; circular separation.

([KED-chap-largesieve](#references), §15.3, Theorem 15.5; Exercises 15.4.2 and 15.4.4.)

*Proof sketch.* Use the Hilbert inequality to control the off-diagonal geometric kernel, retaining both endpoints of the interval. The author proof yields N+δ⁻¹; the sharp endpoint improvement is its Exercise 15.4.4. This improvement and the Hilbert input remain explicit proof requirements, rather than inferred from the weaker taper constant.

*Needs:* Layer 2 §2.6 squared finite large-sieve duality; Layer 2 `SieveTaper.additive_largeSieve`; Layer 2 §2.9 separated hilbert inequality.

**Sharp primitive-character large sieve.** Prove `SieveApplications.sharp_primitive_largeSieve`. For a complex sequence supported on H consecutive integers, H≥1, and Q≥1, Σ_(q≤Q)q/φ(q)Σ_(χ primitive modq)|Σ_n a_nχ(n)|²≤(H−1+Q²)Σ_n|a_n|².

H,Q≥1; primitive characters; integer interval.

([KED-ANT-16](#references), Theorem 16.2, §16.2.)

*Proof sketch.* For Q=1 the only primitive character is the modulus-one character, of value one, and q/φ(q)=1. Cauchy–Schwarz gives |Σ_j a_j|²≤HΣ_j|a_j|², exactly the constant H−1+Q². For Q≥2 reduced rational phases up to Q are Q⁻²-separated with 0<Q⁻²≤1/4≤1/2. Use the sharp additive theorem, the native Gauss expansion and character Parseval.

**Checks.**

- At Q=H=1,a₁=2+i both sides are 5.
- At Q=1,H=2,a=(1,1), the bound is 4≤2·2=4; δ=Q⁻²=1 would violate the additive theorem's δ≤1/2 hypothesis.
- At Q=2 the additive parameter is δ=1/4, and the sharp constant is H+3. Modulus two has no primitive character, but modulus one remains in the sum.

*Needs:* Layer 2 `SieveTaper.sharp_additive_largeSieve`; Layer 2 §2.3 squared norm of a primitive dirichlet gauss sum; Layer 2 §2.3 parseval identity over dirichlet characters.

**Large sieve for forbidden residues.** Let finite prime set P have forbidden Ω_p⊆F_p, |Ω_p|<p. Suppose a_n vanishes on every forbidden residue and is supported on H consecutive integers. Put h(d)=μ²(d)∏_(p|d,p∈P)|Ω_p|/(p−|Ω_p|), zero if any prime factor is outside P, and J(Q)=Σ_(d≤Q)h(d). Then J(Q)|Σa_n|²≤(H−1+Q²)Σ|a_n|². The multiplied form includes J=0.

Support actually avoids forbidden residues; squarefree moduli; Q,H≥1.

([KED-ANT-16](#references), Theorem 16.4 and Lemma 16.5, §16.3.)

*Proof sketch.* For Q=1 only d=1 occurs, J(1)=1, and Cauchy–Schwarz gives the stated constant H. For Q≥2 use δ=Q⁻²≤1/2 in the sharp additive theorem. For one prime, sum over allowed residue totals and apply Cauchy; finite additive orthogonality gives the missing nontrivial-phase energy. For coprime primes use the additive CRT phases a₁/q₁+a₂/q₂, preserving all other avoidance conditions under twisting. Sum the positive squarefree moduli and apply the sharp additive inequality.

*Needs:* Layer 2 `SieveTaper.sharp_additive_largeSieve`; Mathlib `ZMod`; Mathlib `Finset`.

**Least quadratic nonresidue.** Define `SieveApplications.leastNonresidue`. For odd prime p, q(p) is the least integer n≥1 with Jacobi(n,p)=−1; set q(p)=0 when p is not an odd prime. Divisible integers have symbol 0 and are not nonresidues.

Odd prime domain; explicit value outside it.

([KED-ANT-16](#references), Definition 16.6, §16.3.)

*Construction.* Use finite-field quadratic-character nontriviality to obtain existence, then native Nat.find. Do not include zero as a nonresidue.

The definition exposes the following operations and laws:

- `SieveApplications.leastNonresidue`: The least positive symbol−1 value, or 0 outside odd primes.
- At odd prime p it is positive and has symbol−1.
- All positive n below it have symbol different from−1.
- q(p)<p at an odd prime.
- It is 0 outside odd primes.

**Checks.**

- q(3)=2.
- q(7)=3, since 2 is a residue.
- q(2)=0 by the declared outside-domain convention.
- 3 is not a nonresidue modulo 3.

*Needs:* Mathlib `jacobiSym`; Mathlib `Nat.find`.

**Linnik bounded exceptional primes.** Prove `SieveApplications.linnik_exceptional`. For each ε>0 there is C_ε such that for every N≥2, #{odd primes p≤N:q(p)>N^ε}≤C_ε.

ε>0; odd primes; constant independent of N.

([KED-ANT-16](#references), Theorem 16.7 and proof, §16.3.)

*Proof sketch.* If ε≥1 there are no exceptional primes, since q(p)<p≤N≤N^ε. For 0<ε<1, use population length H=N², modulus cutoff Q=N and smoothness cutoff N^ε=H^(ε/2). For an exceptional odd prime p, q(p)>N^ε implies p>N^ε because q(p)<p. Every positive N^ε-smooth integer is therefore coprime to p, and multiplicativity makes its quadratic symbol 1. Forbid precisely the nonresidues, allowing the zero class. AnalyticNumberTheoryPartI §3.34 with fixed parameter 2/ε gives at least c_ε N² distinct smooth integers for sufficiently large N. If E is the exceptional-prime count, the forbidden-residue diagonal has J(N)≥E/3, since its prime summands (p−1)/(p+1) are at least 1/3. The sieve bound is at most (H−1+Q²)/J(N)<2N²/J(N), hence E≤6/c_ε. Absorb bounded N into the constant. This is the square-root-cutoff reformulation in KED-ANT-16 line 565; count distinct integers, rather than ordered prime-factor tuples.

**Checks.**

- At N=16,ε=1/2, H=256,Q=16 and the smoothness cutoff is 4. There are 28 distinct 4-smooth positive integers at most 256; the numerator is H−1+Q²=511, and the Dickman parameter is 4=2/ε.
- For a forbidden prime p=3 the prime diagonal term is (3−1)/(3+1)=1/2≥1/3. For p=7 it is 3/4; the zero class is permitted in both cases.
- At ε=1,N=7, q(3)=2<3 and q(7)=3<7≤N^ε, so neither prime is exceptional. For N=2 the odd-prime population is empty for every ε>0.

*Needs:* Layer 2 `SieveApplications.leastNonresidue`; Layer 2 §2.9 large sieve for forbidden residues; AnalyticNumberTheoryPartI §3.34.

### Analytic requirements

Establish π/δ in the separated Hilbert inequality and its periodic adapter before using H−1+δ⁻¹, including arbitrary origins, H≥1 and singleton frequencies. Squared duality does not give the sharp constant.

Use AnalyticNumberTheoryPartII §5.29 for Heath-Brown’s odd-squarefree and real-character estimates, retaining reciprocity signs and (MN)^ε loss in the bilinear consequence. Jutila (1975), Lemmas 2–3 use Layer 2 §2.7 Jutila unweighted mean square and AnalyticNumberTheoryPartI §§3.22 and 1.2a for the separate Jutila, Smith and Koymans–Pagano route, including (log N)⁶ in Lemma 3.

Linnik uses a multiplicity-safe positive-proportion smooth count up to H=N² with cutoff N^ε, so the fixed Dickman parameter is 2/ε and H+Q²=2N² at Q=N. For p>N^ε all such smooth integers are coprime to p; forbid only symbol−1 classes. Treat ε≥1 directly by q(p)<p, and absorb bounded N into the constant. Ordered prime tuples overcount the population.

Polynomial Farey uses the reversed-denominator power-series coefficients and injectivity of the first 2ℓ coefficients on reduced fractions of denominator degree ℓ. Counting the extensions of an m-coordinate word gives the factor p^(2ℓ−m).

### Examples

The taper vector at N=L=1,x=1/4 has coordinate i at frequency −1. At N=0,L=2 the squared modulus at frequency −1 is 1/2, because the coordinate uses a square root. L=0 gives the zero vector. Padding (a,b) at H=2,L=1 gives (0,0,a,b,0); H=3 gives (0,a,b,c,0).

An empty coefficient interval has zero energy. One unit coefficient and one frequency give left side one; the sharp theorem uses H≥1 and 0<δ≤1/2. Modulus one has one primitive character and contributes its full coefficient sum.

The blocks (R,2R] and (2R,4R] count 2R only once. At J=0 the sum is empty. An arbitrary Q is covered by R2^J≤2Q with its factor-two allowance.

The denominator-two symbol gives symbol₂(3,2)=1, whereas χ₅(2)=−1 and χ₈(2)=0. Symbol₂(9,3)=0 rather than −1, so nonunits are not nonresidues. The least nonresidues are q(3)=2,q(7)=3 and q(2)=0.

### Dependencies

Layer 0. External inputs: AnalyticNumberTheoryPartI §§1.2a, 3.22, 3.34–3.35; AnalyticNumberTheoryPartII §5.29; ThetaSeries §2H; ErdosProgressionPowers §3.1; Mathlib `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv`.

## Layer 3: maximal prime distribution

Maximality in the cutoff is retained throughout the von Mangoldt theorem. Character-conductor reduction separates the small-conductor analytic input from large-sieve estimates, and transfers to prime counts or divisor-weighted sums increase the logarithmic budget.

### 3.0 divisor moments and maximal character estimates

**Divisor moments over reciprocal totients.** For every fixed integer j≥0 there is C_j>0 such that for every real Q≥2,

`Σ_(1≤q≤Q) τ(q)^j/φ(q) ≤ C_j (1+log Q)^(2^j)`.

Prove the cofactor versions by retaining the actual coprimality mask, with all constants chosen before Q and the varying cofactor. For example, restricting the summation to (q,s)=1 preserves this bound uniformly in s. Multiplying the summand by τ(s)^j is allowed only with that explicit external factor. This is stronger than the divisor subpower bound (KED-ANT-18, Theorem 18.3 proof after (18.1.2); Theorem 18.5 proof, §§18.1,18.3).

**Checks.**

- At Q=2,j=0 the sum is 2, not 3/2: φ(1)=φ(2)=1.
- At Q=2,j=1 and 2 the sums are 3 and 5.
- At Q=3,j=1 the sum is 1+2+1=4; restricting to (q,2)=1 gives 2, so cofactor deletion is a subsum, not a new multiplicativity law at q=2.

*Needs:* AnalyticNumberTheoryPartI §§1.2a, 3.22 and 3.26; native totient Euler factors and nonnegative Euler-product comparison.

**Maximal small-conductor estimates.** For every A,B>0 there are C>0 and x₀≥3 such that x≥x₀, a nonprincipal primitive χ of positive conductor r≤(log x)^B, and every positive integer s satisfy

`sup_(0≤y≤x) |Σ_(1≤n≤y,(n,s)=1) Λ(n)χ(n)| ≤ C x/(log x)^A + C log(2s) log x`.

The constant is uniform in χ,s,x. Prove the maximal estimate from conductor-uniform Siegel–Walfisz, splitting small y and retaining the removed prime powers dividing s. Apply this to the original von Mangoldt sum before Vaughan decomposition; arbitrary convolution coefficients are not asserted to cancel. For the switched Chen sequence prove the separate nonprincipal estimate M₂≪N/(log N)^2.01 at the moduli ≤log¹⁰⁰N of CHEN-73-CN Lemma 6, equations (5)–(11), pp.117–123, in §5.5's switched triple target, with the actual coefficients and contour/fourth-moment argument there.

**Checks.**

- For χ modulo 3 at x=y=3 and s=1, the sum is −log 2; its norm is log 2.
- With the same χ,x,y and s=2 the sum is zero: the only contributing prime power 2 is removed.
- The principal character at modulus 1 gives ψ(3)=log 6; it is excluded, and its growing main term must not be treated as a small-conductor error.

*Needs:* AnalyticNumberTheoryPartI §0.32, including conductor-uniform character PNT and its exceptional-zero treatment; prime-power support of native von Mangoldt; Layer 2 §2.4 Vaughan identity only after the original small-conductor contribution is separated.

### 3.1 the prime level of distribution

**Level of distribution of the primes (Maynard (1.3)).** Define `SieveDistribution.PrimesHaveLevel`. For real θ the primes have level of distribution θ if, for every A>0, `Σ_{1≤q≤x^θ}` `max_{(a,q)=1}` |π(x;q,a) − π(x)/φ(q)| = O_A(x/(log x)^A) as x→∞. Here π(x;q,a) counts the primes p≤x with p≡a (mod q), π(x) counts all primes p≤x and φ is Euler's function. The Elliott–Halberstam conjecture is the statement that the primes have level of distribution θ for every θ<1.

x is real; q runs over the integers 1≤q≤⌊x^θ⌋ and a over the reduced residues 0≤a<q. The term q=1 vanishes identically. The comparison term is π(x)/φ(q), counting all primes up to x, exactly as in Maynard (1.3). His footnote 1 notes that other authors use slightly different definitions; this statement fixes (1.3). Elliott–Halberstam is a named hypothesis. No statement of this roadmap asserts it, and every consumer carries it as an explicit hypothesis.

([MAYNARD-2015](#references), §1, definition (1.3), footnote 1 and Elliott–Halberstam conjecture, p.384; [MAYNARD-2015](#references), §1, p. 384.)

*Construction.* Define π(x;q,a) as the number of primes p≤⌊x⌋ with p≡a (mod q), the discrepancy as the supremum over reduced residues a<q of |π(x;q,a) − π(x)/φ(q)|, and PrimesHaveLevel θ as the family of big-O statements along x→∞ indexed by A>0. Define windowError(N,q) = 1 + `sup_{(a,q)=1}` |#{N≤n<2N : n prime, n≡a} − #{N≤n<2N : n prime}/φ(q)|, which is Maynard's E(N,q) of (5.16). The window API follows from the level estimates at x=2N−1 and x=N−1, since windowError(N,q) ≤ 1 + discrepancy(2N−1,q) + discrepancy(N−1,q), together with `Σ_{q≤N^θ′}1` ≤ N^θ′ for θ′<θ<1. Monotonicity in θ: for x≥1 the sum over q≤x^θ′ is a subsum of the sum over q≤x^θ, and every term is nonnegative. For θ≤0 only q=1 can occur.

The definition exposes the following operations and laws:

- `SieveDistribution.primeCountAP`: π(x;q,a), the number of primes p≤⌊x⌋ with p≡a (mod q).
- `SieveDistribution.discrepancy`: max over reduced a<q of |π(x;q,a) − π(x)/φ(q)|; the supremum over an empty index is zero.
- Maynard's E(N,q) of (5.16): 1 plus the largest deviation of the prime count in [N,2N) in a reduced class mod q from 1/φ(q) of the total.
- `SieveDistribution.ElliottHalberstam`: The Elliott–Halberstam conjecture: PrimesHaveLevel θ for every θ<1. It is a named hypothesis, never asserted.
- discrepancy(x,1) = 0.
- mono: If θ′≤θ and the primes have level θ, they have level θ′.
- Every θ≤0 is a level of distribution.
- sum window error: If the primes have level θ<1 and θ′<θ, then `Σ_{1≤q≤N^θ′}` windowError(N,q) = O_A(N/(log N)^A) for every A>0. This is the form Maynard uses in (5.20).

**Checks.**

- discrepancy(10,3) = 1: π(10;3,1) = 1 (the prime 7), π(10;3,2) = 2 (the primes 2 and 5), and π(10)/φ(3) = 4/2 = 2.
- The primes have level 0: only q=1 occurs, and its discrepancy vanishes.
- For fixed θ>1 the level fails. For all sufficiently large x and every x<q≤x^θ, some prime p≤x does not divide q: q has O_θ(log x) distinct prime factors, whereas π(x)≫x/log x. Its reduced class has prime count 1. Summing max discrepancy ≥ 1−π(x)/φ(q) gives ≫x^θ, since `Σ_{q≤x^θ}1/φ(q)=O_θ(log` x). This contradicts the level bound. The needed prime-count and totient-sum estimates are supplied by AnalyticNumberTheoryPartI §0.10 and Layer 3 §3.0 divisor moments over reciprocal totients at j=0.
- primeCountAP(x,1,0) = Nat.primeCounting ⌊x⌋₊: modulo 1 every prime up to x is counted, which agrees with Mathlib's prime-counting function.

Further Checks distinguish the auxiliary definitions separately:

- primeCountAP(5,1,0)=3 includes the endpoint prime 5; primeCountAP(10,2,0)=1 includes the nonunit prime 2. At modulus zero the congruence is equality, so primeCountAP(5,0,5)=1 and primeCountAP(4,0,5)=0.
- discrepancy(5,3)=3/2, since the reduced classes contain 0 and 2 primes while the mean is π(5)/2=3/2. Averaging only the two coprime primes would incorrectly give discrepancy 1. At q=0 the empty supremum is 0.
- windowError(N,1)=1 and windowError(0,q)=1. For N=2,q=3, the window primes are 2 and 3: the two reduced class counts are 0 and 1 against mean 1, hence windowError(2,3)=2.
- The Elliott–Halberstam range includes the distinct levels 1/2 and 3/4 and excludes 1. Requiring level 2 would make the statement false; requiring only level 0 would impose no nontrivial distribution assertion. These compare the quantified index ranges without asserting a conjectural estimate.

The level is a statement for every A>0, with an implied constant depending on A. It is not a single-A bound. Levels θ>1 fail (non-example test), so the Elliott–Halberstam range θ<1 is the natural limit. The Friedlander–Granville obstruction that Maynard mentions (p. 384) is outside this scope.

*Needs:* Mathlib `Nat.primeCounting`; Mathlib `Nat.totient`; Mathlib `Nat.ModEq`; Mathlib `Asymptotics.IsBigO`.

### 3.2 arithmetic discrepancies and the maximal Bombieri–Vinogradov theorem

**Arithmetic progression discrepancy.** For f:N→C, x≥0, q≥1 and integer a, `D_f(x;q,a)=Σ_{1≤n≤floor x,n≡a modq}f(n)−φ(q)⁻¹Σ_{1≤n≤floor` x,(n,q)=1}f(n). The modulus-zero extension is explicitly zero. The reduced-residue mean is not Σall f/φ(q).

Native natural/integer congruences, totient and finite sums.

([KED-ANT-18](#references), Definition 18.1, §18.1.)

*Construction.* Use finite interval sums and the native unit-residue predicate. Record the zero-modulus convention separately from every theorem’s positive-modulus hypothesis.

The definition exposes the following operations and laws:

- The displayed finite formula, zero at q=0.
- D_(f+g)=D_f+D_g.
- D_(c f)=cD_f.
- Congruent a,b give identical discrepancies.
- D_f(x;1,a)=0.
- The sum over reduced residue classes is zero.
- For a unit a and q≥1, D=φ(q)⁻¹Σχ≠1 conjχ(a)Σf(n)χ(n).

**Checks.**

- For `f=1_{n=2},x=2,q=2,a=1` the discrepancy is zero, since the mass at a nonunit is omitted from the mean.
- For `f=1_{n=1},x=1,q=3,` D at a=1 is 1/2 and at a=2 is −1/2.
- At modulus one every discrepancy vanishes.
- For f,g at a fixed positive modulus, D_(2f−g)=2D_f−D_g.

*Needs:* Mathlib `Nat.totient`; Mathlib `DirichletCharacter`.

**Discrepancy to restricted character sums.** Let x≥1,0<Δ≤1, `E_f²=Σ_{1≤n≤floor x}|f(n)|².` Assume |D_f(x;N,a)|≤sqrt(x)Δ^9 E_f for every positive N and unit a. For a nonprincipal native character χ modr,r≥1 and s≥1, `|Σ_{n≤x,(n,s)=1}f(n)χ(n)|≤2sqrt(x)Δ³rτ(s)E_f.` The factor 2 is retained.

The discrepancy hypothesis is quantified over every modulus, not one N.

([KED-ANT-18](#references), Lemma 18.2 and its proof, §18.1.)

*Proof sketch.* Möbius-expand the condition coprime to s. For divisors d>Δ⁻⁶ use Cauchy–Schwarz and the count of multiples d. For small squarefree d rewrite its divisibility indicator by the coprimality inversion over ℓ|d, then use unit residues modulo lcm(ℓ,r). Terms with (d,r)>1 vanish. Nonprincipal orthogonality removes the reduced-residue mean. The sum of φ(lcm(ℓ,r)) is at most r d≤rΔ⁻⁶. Add the two bounds, giving the explicit factor 2.

*Needs:* Layer 3 §3.2 arithmetic progression discrepancy; Mathlib `MulChar.sum_eq_zero_of_ne_one`; Mathlib `ArithmeticFunction.moebius`.

**Primitive-conductor reduction of discrepancies.** For finite-support f,g, positive Q, their Dirichlet convolution h and cutoff xy containing both supports, `Σ_{q≤Q}max_unit` `a|D_h(xy;q,a)|≤Σ_{s≤Q}φ(s)⁻¹Σ_{2≤r≤Q/s}φ(r)⁻¹Σ_{χ` primitive `modr}|Σ_{m≤x,(m,s)=1}f(m)χ(m)|` `|Σ_{n≤y,(n,s)=1}g(n)χ(n)|.` Keep rs≤Q rather than replacing the inner bound by Q unless recording that enlargement.

Positive moduli; f,g supported in positive integer intervals; native character conductor/primitive API.

([KED-ANT-18](#references), Theorem 18.3, equation (18.1.2), §18.1.)

*Proof sketch.* Expand the discrepancy by nonprincipal characters and split every character according to its primitive conductor r. The missing primes of the cofactor s appear as coprimality masks in both sums. Use φ(rs)≥φ(r)φ(s); exclude r=1 because principal characters were removed.

*Needs:* Layer 3 §3.2 arithmetic progression discrepancy; Mathlib `DirichletCharacter.conductor`; Mathlib `DirichletCharacter.IsPrimitive`; Mathlib `ArithmeticFunction`.

**Convolution discrepancy mean value.** Under the preceding all-moduli discrepancy hypothesis for f and finite supports x,y≥1, Q≥2, `Σ_{q≤Q}max_unit|D_(f*g)(xy;q,a)|≤C` E_f E_g(Δsqrt(xy)+sqrt x+sqrt y+Q)(1+log Q)^3. This is a conservative finite replacement for the printed log²Q statement: the non-sharp dyadic J loss is absorbed, not dropped.

0<Δ≤1; x,y≥1; Q≥2; support and global discrepancy hypotheses as in the transfer theorem.

([KED-ANT-18](#references), Theorem 18.3, §18.1.)

*Proof sketch.* Split primitive r at Δ⁻¹. Apply the corrected transfer for small r and Cauchy–Schwarz for the g sum. For large r import the retained finite dyadic bound including its J factor, use J≪1+log Q, then sum the cofactor using Στ(s)/φ(s)≪(1+log Q)². The stated log³ exponent is the target; the sharper log² exponent is outside its scope.

*Needs:* Layer 3 §3.2 primitive-conductor reduction of discrepancies; Layer 3 §3.2 discrepancy to restricted character sums; Layer 2 §2.5 primitive bilinear tail through a dyadic endpoint; Layer 3 §3.0 divisor moments over reciprocal totients at j=1.

**Maximal Bombieri–Vinogradov theorem.** Prove `SieveArithmeticDistribution.bombieri_vinogradov_maximal`. For every A>0 there exist B,C>0 and x₀≥3 such that x≥x₀ and 1≤Q≤sqrt x/(log x)^B imply `Σ_{1≤q≤Q}` `max_{(a,q)=1}` `sup_{0≤y≤x}|ψ(y;q,a)−y/φ(q)|≤Cx/(log` x)^A. ψ includes prime powers through native von Mangoldt. Maximality in y is explicitly required by Chen and weighted sieves. The source’s fixed-x version is a consequence.

Unconditional conclusion; constants depend on A. Separate analytic small-conductor and hyperbola/maximal proof inputs remain explicit proof requirements.

([KED-ANT-18](#references), Theorem 18.4, §18.2; KED-chap-bombieri Theorem 17.1.)

*Proof sketch.* Use the exact Vaughan identity and coefficient energies, then split Type I/II regions with an actual complete hyperbola covering. Treat small conductors with a uniform Siegel–Walfisz/exceptional-zero estimate; large conductors use the finite large sieve with all cofactor/dyadic losses retained. For the maximum in y add the required maximal decomposition and rebalance B against its logarithmic losses. Change the mean from ψ(y)/φ(q) to y/φ(q) using AnalyticNumberTheoryPartI §0.32 at q=1 and totient sum. Prove a complete hyperbola covering and retain the incomplete-logarithm boundary; the source-sensitive conventions give the necessary corrections.

*Needs:* Layer 3 §3.2 arithmetic progression discrepancy; Layer 2 §2.4 weighted vaughan identity on a finite hyperbola; Layer 2 §2.5 primitive bilinear tail through a dyadic endpoint; Layer 3 §3.2 convolution discrepancy mean value; AnalyticNumberTheoryPartI §0.32; Layer 3 §3.0 maximal small-conductor estimates; Layer 3 §3.0 divisor moments over reciprocal totients; AnalyticNumberTheoryPartI §0.32 at q=1.

### 3.3 Bombieri–Vinogradov gives every level below one half

**Bombieri–Vinogradov: every level θ<1/2.** Prove `SieveDistribution.primesHaveLevel_of_lt_half`. For every θ<1/2 the primes have level of distribution θ in the sense of Maynard (1.3).

The input is the Bombieri–Vinogradov theorem in ψ-form at a fixed cutoff (Kedlaya Theorem 18.4), which Layer 3 `SieveArithmeticDistribution.bombieri_vinogradov_maximal` contains: for every A>0 there are c(A),B(A) with `Σ_{q≤Q}` `max_{(a,q)=1}|ψ(x;q,a)−x/φ(q)|≤c·x(log` `x)^{−A}` for `Q=x^{1/2}(log` `x)^{−B}.` The argument below applies it at every cutoff t in (t₀,x]. The conclusion compares with π(x)/φ(q), as Maynard does, and not with li(x)/φ(q).

([MAYNARD-2015](#references), §1, p. 384; [KED-ANT-18](#references), §18.2, Theorem 18.4 (Bombieri–Vinogradov).)

*Proof sketch.* Input: Kedlaya Theorem 18.4. Its N=1 term alone gives |ψ(x) − x| ≤ c·x(log `x)^{−A}.` Prime powers: in every progression |ψ(t;q,a) − θ(t;q,a)| ≤ |ψ(t) − θ(t)| ≤ 2√t·log t (Mathlib abs_psi_sub_theta_le_sqrt_mul_log). Summed over q≤x^θ this costs `O(x^{θ+1/2}` log x), which is O(x/(log x)^A) because θ<1/2. Abel summation with f = 1/log (sum_mul_eq_sub_sub_integral_mul): π(x;q,a) = θ(x;q,a)/log x + ∫_2^x θ(t;q,a)/(t log²t) dt, and the same holds for π(x) with θ(t). Hence |π(x;q,a) − π(x)/φ(q)| ≤ E(x;q)/log x + ∫_2^x E(t;q)/(t log²t) dt + `φ(q)^{−1}(|θ(x)` − x|/log x + ∫_2^x |θ(t) − t|/(t log²t) dt), where E(t;q) = `max_{(a,q)=1}` |θ(t;q,a) − t/φ(q)|. Split the integrals at t₀ = x/(log `x)^{A+2}.` For t≤t₀ the trivial bound E(t;q) ≤ (t/q + 1 + t/φ(q))·log t suffices. For t₀<t≤x and x large, x^θ ≤ `t^{1/2}(log` `t)^{−B}` because θ<1/2, so Theorem 18.4 at t covers every q≤x^θ. Sum over q≤x^θ using `Σ_{q≤y}` 1/φ(q) = O(log y). Every term is O(x/(log x)^A).

θ<1/2 is strict: the theorem gives no level 1/2 (Maynard, p. 384). Instance: θ = 1/2 − ε is the input of Maynard Theorem 1.3. The implied constants are ineffective, through Siegel's theorem inside Theorem 18.4. Maynard's remark after Lemma 5.2 records this.

*Needs:* Layer 3 `SieveDistribution.PrimesHaveLevel`; Mathlib `Chebyshev.psi`; Mathlib `Chebyshev.theta`; Mathlib `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`; Mathlib `sum_mul_eq_sub_sub_integral_mul`; Layer 3 `SieveArithmeticDistribution.bombieri_vinogradov_maximal`; Layer 3 §3.0 divisor moments over reciprocal totients at j=0.

### 3.4 transfers, variance and the Barban–Davenport–Halberstam theorem

**Weighted prime-distribution transfer.** The maximal ψ estimate yields the maximal prime-counting estimate with supremum over real 2≤y≤x for π(y;q,a)−li(y)/φ(q), where li(y)=∫₂^y dt/log t, and the fixed-x discrepancy π(x;q,a)−π(x)/φ(q), with arbitrary prescribed log saving after increasing B. For a fixed integer j≥0, weighting the modulus sum by τ(q)^j is allowed after increasing the log budget and using second moments; it is not inferred by a pointwise bound τ(q)≤log^j q.

Every A>0; j fixed; same Q≤sqrt x/(log x)^B; reduced residue classes.

([KED-ANT-18](#references), Theorem 18.4 and Maynard (1.3), §§18.2 and source application.)

*Proof sketch.* Remove prime powers with their explicit sqrt x log²x cost, split the range 2≤y≤x at a logarithmic threshold, and apply partial summation on [2,y] to each maximal error. Obtain divisor-weighted versions by Cauchy–Schwarz, high divisor moments and a crude global discrepancy bound; increase B to absorb all losses. State dependence on j.

The maximal π target weighted_prime_distribution_pi takes the supremum over real 2≤y≤x and reduced residue classes and centers at li(y)/φ(q). The target weighted_prime_distribution_pi_centered is the separate fixed-x π(x)/φ(q) estimate. The maximal ψ target retains 0≤y≤x.

**Checks.**

- At y=2,q=2,a=1, π(2;2,1)=li(2)=0, so the discrepancy is zero.
- At y=2,q=1,a=0, π(2)=1 and li(2)=0, so the discrepancy is one; the lower integration endpoint does not remove the prime 2.
- For q=2,a=1 and 1<y<2, π(y;2,1)=0 but li(y) tends to −∞ as y decreases to 1. Including this excluded range would make the maximal error unbounded.

*Needs:* Layer 3 `SieveArithmeticDistribution.bombieri_vinogradov_maximal`; Layer 3 §3.0 divisor moments over reciprocal totients for the fixed divisor powers; AnalyticNumberTheoryPartI §0.32 at q=1.

**Arithmetic discrepancy second moment.** With the transfer theorem’s all-moduli hypothesis, x≥1,Q≥2, `Σ_{q≤Q}Σ_{a` units modq}|D_f(x;q,a)|²≤C E_f²(Δx+Q)(1+log Q)^5. The power five is a conservative replacement retaining conductor and dyadic losses. For arbitrary f the corresponding estimate uses x+Q and no Δ improvement.

0<Δ≤1; support in [1,x]; all positive moduli in the discrepancy hypothesis.

([KED-ANT-18](#references), Theorem 18.5 and Exercise 18.4.4, §18.3.)

*Proof sketch.* Use finite Parseval and primitive-conductor reduction. Apply transfer below r=Δ⁻¹ and large sieve on dyadic intervals above it. Sum τ(s)²/φ(s) with its four logarithmic powers and retain the remaining dyadic logarithm. Do not use the source’s unexplained norm symbol as a first moment.

*Needs:* Layer 3 §3.2 arithmetic progression discrepancy; Layer 3 §3.2 discrepancy to restricted character sums; Layer 2 §2.5 primitive bilinear tail through a dyadic endpoint; Layer 3 §3.0 divisor moments over reciprocal totients at j=2.

**Barban–Davenport–Halberstam theorem.** Prove `SieveArithmeticDistribution.barban_davenport_halberstam`. For every A>0 there are B,C>0,x₀≥3 such that x≥x₀ and 1≤Q≤x/(log x)^B imply `Σ_{q≤Q}Σ_{a` units modq}|ψ(x;q,a)−x/φ(q)|²≤Cx²/(log x)^A. This is a second moment, not a maximum over residues.

Unconditional theorem; all constants quantified; prime powers included.

([KED-chap-bombieri](#references), Theorem 17.4; KED-18 Theorem 18.5 and Exercise 18.4.4.)

*Proof sketch.* Apply the variance route to a Vaughan decomposition, importing small-conductor estimates and bounding all cofactor sums. Use the PNT error to replace the reduced-residue mean by x/φ(q). Prove the course’s exercise with the retained logarithmic losses; no implication from BV alone at Q≈x is asserted.

*Needs:* Layer 3 §3.4 arithmetic discrepancy second moment; Layer 3 `SieveArithmeticDistribution.bombieri_vinogradov_maximal`; AnalyticNumberTheoryPartI §0.32; Layer 3 §3.0 maximal small-conductor estimates; Layer 3 §3.0 divisor moments over reciprocal totients; AnalyticNumberTheoryPartI §0.32 at q=1.

**Bilinear congruence correlation.** For a,b nonzero integers, x,y≥1,Q≥2, supports [1,x],[1,y] and the all-moduli Δ hypothesis for f, sum over q≤Q coprime to ab of the absolute deviation of `Σ_{am≡bn modq,(mn,q)=1}f(m)g(n)` from φ(q)⁻¹(Σ_(m,q)=1 f(m))(Σ_(n,q)=1 g(n)) is ≤C E_f E_g sqrt(Δx+Q)sqrt(y+Q)(1+log Q)^4. The Δ improvement stays on f’s x variable.

0<Δ≤1; a,b nonzero and q coprime to ab.

([KED-ANT-18](#references), Corollary 18.6 and Exercise 18.4.5, §18.3.)

*Proof sketch.* Expand the congruence through characters with the correct conjugation, and use Cauchy–Schwarz across characters and moduli. Apply the improved variance to f and the ordinary finite large sieve to g, retaining conservative logarithmic powers. This corrects the source’s assignment of Δ to y although its hypothesis is on f.

*Needs:* Layer 3 §3.4 arithmetic discrepancy second moment; Layer 3 §3.2 arithmetic progression discrepancy; Layer 2 `SieveCharacters.primitive_largeSieve`.

### Analytic requirements

Write q=rs with primitive conductor r and cofactor s=q/r; r and s need not be coprime. The induced character is its primitive character times 1_(gcd(n,s)=1). Retain this coprimality mask in every coefficient sequence and use the all-cofactor estimates. Use an exact Vaughan hyperbola covering, retaining dyadic J until a stronger aggregate removes it. Choose U,V and the mesh for every prescribed saving, including maximal cutoff decomposition. AnalyticNumberTheoryPartI §0.32 and Layer 3 §3.0 maximal small-conductor estimates give the required small-conductor, cofactor and exceptional-zero estimates and their conductor/log ranges.

The variance retains log⁵Q and the cofactor τ(s)²/φ(s) sum. Each divisor exponent j and saving A requires a fresh BV budget. Partial summation for π is uniform in real 2≤y≤x and centred at li(y)/φ(q); the ψ maximum still ranges over 0≤y≤x; fixed-x π(x)/φ(q) centering is a separate transfer.

### Examples

The primes up to 10 are 2,3,5,7. Modulo three the reduced classes contain one and two primes, while the all-prime mean is 4/2=2, giving Maynard discrepancy one. For a point mass at n=2 modulo two, the reduced-residue discrepancy is zero. For a point mass at n=1 modulo three the two discrepancies are 1/2 and −1/2.

Inflating the primitive character modulo 4 to modulus 8 gives r=4,s=2 and gcd(r,s)=2. Its values at 1,3,2 are 1,−1,0; the cofactor mask is 1 on odd arguments and 0 on even arguments.

At modulus one both discrepancies vanish. Nonpositive prime levels therefore hold. For θ>1 and x<q≤x^θ choose a prime p≤x not dividing q, including when 6|q. Its class has one prime and discrepancy ≥1−π(x)/φ(q). The prime-count input of AnalyticNumberTheoryPartI §0.10 and the reciprocal-totient estimate of Layer 3 §3.0 divisor moments over reciprocal totients at j=0 give a total ≫x^θ, contradicting the level bound.

### Dependencies

Layer 2. External inputs: AnalyticNumberTheoryPartI §0.32; Layer 3 §3.0 divisor moments over reciprocal totients; Layer 3 §3.0 maximal small-conductor estimates.

## Layer 4: prime tuples and Maynard clusters

A common local residue class makes the multidimensional weights nonnegative. Exact simplex integrals and rational polynomial witnesses certify the variational lower bounds; the prime-distribution input then gives infinitely many prime clusters.

### 4.1 admissible tuples and the prime-tuple conjecture

**Admissible tuple.** Define `SieveMaynard.IsAdmissible`. A finite set H of nonnegative integers is admissible if, for every prime p, there is an integer a_p with a_p ≢ h (mod p) for every h∈H.

H is a Finset ℕ. The empty set is admissible. Only primes p≤#H can obstruct admissibility, since #H elements meet at most #H residue classes.

([MAYNARD-2015](#references), §1, p. 383.)

*Construction.* Define IsAdmissible H as: for every prime p there is a with ¬ h ≡ a [MOD p] for all h∈H. Characterisation: H misses a class mod p exactly when the image of reduction mod p has fewer than p elements, which is automatic for p>#H. This makes the predicate decidable. Monotonicity under subsets and invariance under translation h ↦ h+c (replace a_p by a_p + c) are immediate. isAdmissible_of_forall_not_dvd: if no element is divisible by a prime p≤#H, residue 0 is missed for those p.

The definition exposes the following operations and laws:

- H is admissible iff, for every prime p≤#H, the image of H in ℤ/p has fewer than p elements.
- mono: Subsets of admissible sets are admissible.
- map add: Translating an admissible set by c gives an admissible set.
- If for every prime p≤#H no element of H is divisible by p, then H is admissible.

**Checks.**

- {0,2} is admissible: it misses 1 mod 2.
- {0,2,4} is not admissible: it meets all three classes mod 3. A definition that checked only p=2, or only p>#H, would accept it.
- {0,2,6,8,12} is admissible: it misses 1 mod 2, 1 mod 3 and 4 mod 5.
- ∅ is admissible.
- {0,1} is not admissible: it covers ℤ/2.

{0,2,6,8,12} (Theorem 1.4) and Engelsma's 105-element set (footnote 2) are admissible. {0,2,4} is not, since it covers ℤ/3.

*Needs:* Mathlib `Nat.ModEq`.

**The prime k-tuples conjecture, as a named statement.** For a finite H⊂ℕ let primeTranslates(H) = {n : n+h is prime for every h∈H}. The prime k-tuples conjecture asserts that primeTranslates(H) is infinite for every admissible H.

It is a named statement, not an assumption. The conjectural statement remains separate from Maynard's theorems.

([MAYNARD-2015](#references), §1, p. 383.)

*Construction.* Define primeTranslates and PrimeTuplesConjecture as displayed. Necessity: if H covers every class mod p, then for each n some n+h is divisible by p, hence equals p. So n ≤ p, and primeTranslates(H) is finite. The singleton {0} gives the set of primes (Mathlib infinite_setOfPred_prime), and {0,2} gives the twin primes.

The definition exposes the following operations and laws:

- `SieveMaynard.primeTranslates`: The set of n such that n+h is prime for every h∈H.
- If primeTranslates(H) is infinite, then H is admissible.
- primeTranslates({0}) is the set of primes.
- infinite twin: The conjecture implies that there are infinitely many twin primes.

**Checks.**

- primeTranslates({0}) is infinite: this is Mathlib's infinitude of primes.
- primeTranslates({0,1}) = {2}. The set is finite but nonempty, so 'nonempty' cannot replace 'infinite' in the conjecture.
- primeTranslates({0,2,4}) = {3}: one of n, n+2, n+4 is divisible by 3.
- primeTranslates(∅) is all of ℕ.

Maynard's proven statement (Layer 4 `SieveMaynard.positive_proportion_prime_tuples`) is a positive-proportion result, not this conjecture. The twin prime conjecture is the case H = {0,2}, and it is not proved.

*Needs:* Layer 4 `SieveMaynard.IsAdmissible`; Mathlib `Nat.infinite_setOfPred_prime`.

### 4.2 the W-trick and Maynard's weights

**The W-trick residue v₀ (Maynard (4.1)).** For real D₀ let W = `∏_{p≤D₀}` p, the primorial of ⌊D₀⌋. For admissible H there is v₀ with 0≤v₀<W and gcd(v₀+h, W) = 1 for every h∈H; wResidue(H,D₀) is the least such v₀ (0 if none exists). Maynard takes D₀ = log log log N, and then W ≪ (log log N)².

H is admissible. Only ⌊D₀⌋ matters. This W-trick chooses a single residue avoiding every form in the tuple simultaneously.

([MAYNARD-2015](#references), §4, (4.1) and the following sentence, pp. 388–389.)

*Construction.* For each prime p≤D₀, admissibility gives a class a_p missed by H. Require v₀ ≡ −a_p (mod p); then v₀+h ≡ h − a_p ≢ 0 (mod p) for every h∈H. The primes p≤D₀ are pairwise coprime, so Nat.chineseRemainderOfFinset gives v₀ mod W. Minimality: take Nat.find of the decidable existence statement over v<W. W ≤ `4^{⌊D₀⌋}` ≤ `4^{D₀}` by primorial_le_four_pow. With D₀ = log log log N, `4^{D₀}` = (log log `N)^{log 4}` ≤ (log log N)² for large N.

The definition exposes the following operations and laws:

- W = primorial ⌊D₀⌋.
- For admissible H, gcd(wResidue(H,D₀) + h, W) = 1 for every h∈H.
- wResidue(H,D₀) < W.
- W ≤ `4^{D₀}` for D₀ ≥ 0.
- wModulus(log log log N) ≤ (log log N)² for all large N.

**Checks.**

- wModulus(3) = 6.
- wResidue({0,2}, 3) = 5.
- wModulus(1) = 1: there are no primes ≤ 1, and wResidue(H,1)=0 for every H. For H=∅ at D₀=3 the least residue is also 0.
- For H = {0,1} and W = wModulus(2) = 2, no v makes both v and v+1 coprime to 2, and the outside-domain value is 0. The construction needs admissibility for its avoidance law.

For H = {0,2} and D₀ = 3: W = 6 and v₀ = 5, since 5 and 7 are both coprime to 6.

*Needs:* Layer 4 `SieveMaynard.IsAdmissible`; Mathlib `primorial`; Mathlib `primorial_le_four_pow`; Mathlib `Nat.chineseRemainderOfFinset`.

**Maynard's multidimensional sieve weights.** Fix k, W, R>1 and F: ℝ^k→ℝ. For r∈ℕ^k put y_r = F(log r₁/log R, …, log r_k/log R) when ∏rᵢ is squarefree, coprime to W and less than R, and y_r = 0 otherwise (6.3). Define λ_d = (∏ μ(dᵢ)dᵢ) `Σ_{r: dᵢ|rᵢ}` y_r/∏φ(rᵢ) (5.8), and the weight w_n = `(Σ_{d in the finite support of λ, dᵢ|n+hᵢ ∀i}` λ_d)² (2.4), including zero values n+hᵢ. With these, S₁ = `Σ_{N≤n<2N, n≡v₀ (W)}` w_n, `S₂^{(m)}` = `Σ_{same n}` χ_P(n+h_m)w_n, and `y⁽ᵐ⁾_r` = (∏ μ(rᵢ)g(rᵢ)) `Σ_{rᵢ|dᵢ, d_m=1}` λ_d/∏φ(dᵢ), where g is totally multiplicative with g(p) = p−2 ((4.2), (5.14), (5.23)).

λ built from a general y (maynardLambdaOfY) is what Lemmas 5.1–5.3 use; maynardLambda specializes to (6.3). Proposition 4.1 writes λ directly from F and replaces ∏rᵢ<R by 'F supported on ℛ_k'. The two differ only at ∏rᵢ = R, which does not affect the asymptotics. All sums are finite: rᵢ and dᵢ run below ⌈R⌉, and every other term vanishes by the support condition.

([MAYNARD-2015](#references), §2, (2.4)–(2.5), p. 387; [MAYNARD-2015](#references), §4, Proposition 4.1, p. 388; §5, (5.7)–(5.8), p. 393; §6, (6.3), p. 400.)

*Construction.* Define y, λ, w, S₁, `S₂^{(m)},` g and `y⁽ᵐ⁾` as displayed. Support: if dᵢ|rᵢ for all i, then ∏dᵢ divides ∏rᵢ. So some y_r in the sum can be nonzero only if ∏dᵢ is squarefree, coprime to W and less than R. Inversion (5.7)–(5.8): substitute the definition and use `Σ_{dᵢ|rᵢ|eᵢ}` μ(rᵢ) = μ(dᵢ)·[eᵢ = dᵢ] for squarefree eᵢ. Dimension one: `(Σ_{d|m}` λ_d)² = `Σ_{e|m}` `Σ_{lcm(d₁,d₂)=e}` `λ_{d₁}λ_{d₂}` = `Σ_{e|m}` lambdaSquared(λ)(e).

The definition exposes the following operations and laws:

- The permitted tuple indices have ∏rᵢ squarefree, coprime to W, and less than R.
- The smooth choice (6.3): F(log rᵢ/log R) on the support, and 0 elsewhere.
- λ_d = (∏ μ(dᵢ)dᵢ) `Σ_{dᵢ|rᵢ}` y_r/∏φ(rᵢ) for an arbitrary y (5.8).
- w_n = `(Σ_{dᵢ|n+hᵢ}` λ_d)².
- S₁ = `Σ_{N≤n<2N, n≡v₀ (W)}` w_n (4.2).
- `S₂^{(m)}` = `Σ_{N≤n<2N, n≡v₀ (W)}` χ_P(n+h_m)w_n (5.14). S₂ is the sum over m.
- The totally multiplicative g with g(p) = p−2.
- `y⁽ᵐ⁾_r` of (5.23). It vanishes unless r_m = 1.
- If y vanishes off the support, then λ_d = 0 whenever d is not supported.
- For supported r, y_r = (∏ μ(rᵢ)φ(rᵢ)) `Σ_{rᵢ|dᵢ}` λ_d/∏dᵢ; this is (5.7), which inverts (5.8).
- w_n ≥ 0.
- For k = 1 and n+h₁>0, w_n = `Σ_{e|n+h₁}` BoundingSieve.lambdaSquared(λ)(e), which is Mathlib's Λ² sieve. At n+h₁=0 use the finite support sum directly.

**Checks.**

- For k=1,W=1,h₁=v₀=0,F≡1 and R=4, y₁=y₂=y₃=1, λ₁=5/2,λ₂=−2,λ₃=−3/2. With N=2, w₂=1/4,w₃=1, so S₁=S₂=S₂⁽¹⁾=5/4; y⁽¹⁾₁=5/2 and y⁽¹⁾_r=0 for r>1.
- For the same data at R=2,N=2, y₁=λ₁=1,w₂=w₃=1,S₁=S₂=S₂⁽¹⁾=2,y⁽¹⁾₁=1. These finite Checks do not require the asymptotic cutoff relations.
- For F=0, every y,λ,w,S₁,S₂ and y⁽ᵐ⁾ is zero; setting only λ to zero would not test the sums.
- The totally multiplicative g has g(1)=1,g(2)=0,g(5)=3,g(25)=9; squarefree-only extension would give the wrong last value.
- R = 2: w_n = F(0)², including zero labels.
- With k=1, n=h₁=0, R=2, W=1 and F(0)=1, the finite supported weight is 1, while the native divisor sum at zero is 0.
- k = 2 and d = (2,2): each dᵢ is squarefree but ∏dᵢ = 4 is not, so λ_d = 0. A definition that tested squarefreeness coordinatewise would get this wrong.

For R = 2 only r = (1,…,1) is supported, so `λ_{(1,…,1)}` = F(0), every other λ_d vanishes, and w_n = F(0)² for every n. The weights depend on (d₁,…,d_k) jointly, not only on ∏dᵢ. This is the new feature of the method (p. 387).

*Needs:* Layer 4 §4.2 the w-trick residue v₀ (maynard (4.1)); Mathlib `ArithmeticFunction.moebius`; Mathlib `Nat.totient`; Mathlib `Squarefree`; Mathlib `BoundingSieve.lambdaSquared`.

### 4.3 the variational quantity M_k

**Maynard's variational quantity M_k.** Define `SieveMaynard.maynardM`. Let ℛ_k = {t∈[0,1]^k : Σtᵢ ≤ 1}. For F: [0,1]^k→ℝ put I_k(F) = ∫F² and `J_k^{(m)}(F)` = ∫(∫_0^1 F dt_m)² `dt₁…dt_{m−1}dt_{m+1}…dt_k.` Let 𝒮_k be the set of F supported on ℛ_k with I_k(F) ≠ 0 and `J_k^{(m)}(F)` ≠ 0 for every m. Then M_k = `sup_{F∈𝒮_k}` Σ_m `J_k^{(m)}(F)/I_k(F).`

Maynard's 𝒮_k consists of Riemann-integrable functions; here it consists of square-integrable functions on the cube. The suprema agree: every Riemann-integrable function is square-integrable, and Layer 4 exists smooth maynard ratio gt approximates every square-integrable member by smooth functions supported on ℛ_k. `J^{(m)}` is integrated over the whole cube. Its integrand does not depend on t_m, so this is the (k−1)-fold integral of the source. `G_{b,j}` of Lemma 8.1 is included as data, with the r = 0 term.

([MAYNARD-2015](#references), §4, Proposition 4.1, p. 388, and Proposition 4.2, p. 389; [MAYNARD-2015](#references), §6, remark after Lemma 6.3, p. 404.)

*Construction.* Define ℛ_k, I_k, `J_k^{(m)},` the admissible class, the ratio, and M_k as the supremum of a set of reals bounded above by k. Upper bound: by Cauchy–Schwarz, (∫_0^1 F dt_m)² ≤ ∫_0^1 F² dt_m. So `J^{(m)}` ≤ I and M_k ≤ k. Replacing F by cF multiplies I and each `J^{(m)}` by c². Permuting the coordinates permutes the `J^{(m)}.` Radial case F = G(Σtᵢ) on ℛ_k: slice by s = `Σ_{i≠m}` tᵢ, whose density on `ℛ_{k−1}` is `s^{k−2}/(k−2)!.` This gives the GPY integrals of the remark after Lemma 6.3.

The definition exposes the following operations and laws:

- `SieveMaynard.maynardSimplex`: ℛ_k = {t : tᵢ ≥ 0, Σtᵢ ≤ 1}.
- `SieveMaynard.maynardI`: I_k(F) = `∫_{[0,1]^k}` F².
- `SieveMaynard.maynardJ`: `J_k^{(m)}(F)` = `∫_{[0,1]^k}` (∫_0^1 F(t with t_m := s) ds)² dt.
- `SieveMaynard.IsMaynardAdmissible`: F vanishes off ℛ_k, lies in L²([0,1]^k), I_k(F) ≠ 0, and `J_k^{(m)}(F)` ≠ 0 for every m.
- `SieveMaynard.maynardRatio`: Σ_m `J_k^{(m)}(F)/I_k(F).`
- `G_{b,j}(x)` = b! `Σ_{r=0}^{b}` C(x,r) `Σ_{b₁,…,b_r ≥ 1, Σ = b}` ∏ (jbᵢ)!/bᵢ!, including the term r = 0.
- The ratio of cF equals the ratio of F for c ≠ 0.
- If F is symmetric in its coordinates, `J_k^{(m)}(F)` does not depend on m.
- M_k ≤ k.
- The ratio of every admissible F is at most M_k.
- For F = G(Σtᵢ) on ℛ_k with k ≥ 2: I = ∫_0^1 G(t)² `t^{k−1}/(k−1)!` dt and `J^{(m)}` = ∫_0^1 (∫_t^1 G)² `t^{k−2}/(k−2)!` dt, which are the one-dimensional GPY integrals.

**Checks.**

- M₁ = 1.
- For k = 2 and F the indicator of ℛ₂: I = 1/2 and `J^{(1)}` = ∫_0^1 (1−t)² dt = 1/3, so the ratio is 4/3.
- F = 0 is excluded, because I_k(0) = 0.
- F ≡ 1 on [0,1]² is not supported on ℛ₂ and has ratio 2. Without the support condition every M_k would be at least k.
- `G_{0,2}(5)` = 1: the r = 0 term that the printed formula omits.

Further discriminating Checks for each functional are:

- The simplex in dimension zero contains its unique empty vector; in dimension two (1/2,1/2) belongs, (1,1) does not, and (−1,0) does not.
- I on the two-dimensional zero function is 0; on the triangle indicator it is 1/2; on twice that indicator it is 2.
- Each J on those three functions is respectively 0, 1/3 and 4/3. For F=x on the triangle and zero elsewhere, I=1/12, the x-fibre J=1/20 and the y-fibre J=1/30. Thus the coordinate functionals need not coincide. Squaring before the fibre integral would give a different operation.
- The triangle indicator is admissible; zero fails its I condition; the global constant one fails simplex support. The polynomial 4xy+8x³y+8xy³−12x²y−12xy²+18x²y² on the triangle has I=1/3150 and both J=0, so it fails the separate J conditions.
- The ratio is 0 on zero, 4/3 on the triangle indicator, and 4/3 on twice that indicator; outside the admissible class the cube constant has ratio 2.
- M₀=0, M₁=1, and M₂≥4/3 from the triangle. M_k≤k bounds the supremum; it does not make every function admissible.
- For the auxiliary radial polynomial, G_(0,2)(5)=1, G_(1,1)(x)=x and G_(2,1)(x)=x²+x, so at x=2 its value is 6.

M₁ = 1: `J^{(1)}` = (∫F)² ≤ ∫F², with equality for F = 1 on [0,1]. The support condition is essential: F ≡ 1 on the cube has ratio k.

*Needs:* Mathlib `MeasureTheory.MemLp`; Mathlib `Finset.Nat.antidiagonalTuple`.

**Smooth approximation within the simplex.** For F∈𝒮_k and δ>0 there is a smooth F₁∈𝒮_k, supported on ℛ_k, with I_k(F₁) > 0 and ratio(F₁) > ratio(F) − δ. In particular M_k is also the supremum over smooth functions supported on ℛ_k.

𝒮_k is the L² class of Layer 4 `SieveMaynard.maynardM`. At k=0 the unique empty-coordinate cube has measure one, every nonzero function on it is smooth, and the ratio is zero; the shrink-and-mollify argument below is for k≥1 and 0<η<1/(k+1).

([MAYNARD-2015](#references), §4, proof of Proposition 4.2, p. 389.)

*Proof sketch.* Shrink: F_η(t) = F((t − η𝟙)/(1 − (k+1)η)) vanishes unless tᵢ ≥ η and Σtᵢ ≤ 1 − η. I scales by (1 − (k+1)η)^k and each `J^{(m)}` by (1 − `(k+1)η)^{k+1},` so the ratio is multiplied by 1 − (k+1)η. Mollify on the native coordinate carrier `Fin k → ℝ`, with its supremum norm: convolve F_η with a nonnegative smooth bump normalized to integral one using `ContDiffBump.normed`, with outer radius 0<r<η/k. If ‖u‖∞≤r then every |uᵢ|≤r, so tᵢ+uᵢ≥η−r>0 and Σ(tᵢ+uᵢ)≤1−η+kr<1 for t in the shrunken support. Thus even the closed support of the convolution stays in ℛ_k. The result is smooth and converges to F_η in L²(cube) as r tends to 0. Continuity: F ↦ ∫_0^1 F dt_m is 1-Lipschitz from L²(cube) to L²(cube) by Cauchy–Schwarz, so I and each `J^{(m)}` are continuous. For η and the radius small enough, the ratio moves by less than δ and I and the `J^{(m)}` stay nonzero.

Maynard's proof of Proposition 4.2 uses this step without proof; it is supplied here.

**Checks.**

- At k=4, η=1/10, t=(9/40,9/40,9/40,9/40) lies on the shrunken face with sum 9/10. The displacement u=(1/30,1/30,1/30,1/30) has supremum norm 1/30<η/√4=1/20 but gives sum 31/30>1; it is excluded by r<η/k=1/40.
- With the same t and r=1/80<1/40, the two displacements ±(r,r,r,r) give sums 19/20 and 17/20, both inside the simplex. At the lower shrunken corner (η,η,η,η), subtracting that displacement leaves each coordinate 7/80>0.
- At k=1, η=1/4, the shrunken interval is [1/4,3/4]; r=1/8 enlarges it only to [1/8,7/8]. At k=0 the empty vector has sum 0 and ratio 0; the separate direct case avoids division by k.

*Needs:* Layer 4 `SieveMaynard.maynardM`; Mathlib `ContDiffBump.normed`, `ContDiffBump.integral_normed`, `ContDiffBump.tsupport_normed_eq` and `norm_le_pi_norm`.

### 4.4 the sieve sums S₁ and S₂

Throughout this subsection, unless a statement says otherwise: N is large, D₀ = log log log N, W = `∏_{p≤D₀}p,` v₀ is the W-trick residue of the admissible H = {h₁,…,h_k} (distinct), R = `N^{θ/2−δ}` with 0<θ≤1 and 0<δ<θ/2 fixed. The implied constants depend on k, H, θ and δ, and not on N, y or F. All divisor tuples in the diagonal sums are positive and supported, hence coprime to W; in the S₂ sum also require r_m=1. Take N large enough that D₀≥2, so every prime of a supported tuple is greater than 2 and each g(r_i)>0. Thus the displayed denominators do not use 0/0 at g(2)=0.

**Size of λ in terms of y (Maynard (5.9)).** If y vanishes off the support (∏rᵢ squarefree, coprime to W, less than R) and |y_r| ≤ y_max, then |λ_d| ≤ y_max `Σ_{u<R}` μ²(u)τ_k(u)/φ(u) for every d. The right-hand side is O_k(y_max (log R)^k).

τ_k(u) is the number of ordered factorizations u = c₁⋯c_k.

([MAYNARD-2015](#references), §5, (5.9) and the following sentence, pp. 393–394.)

*Proof sketch.* Insert |y_r| ≤ y_max into (5.8) and write rᵢ = dᵢr′ᵢ. Since ∏rᵢ is squarefree, the r′ᵢ are coprime to ∏dᵢ. Use d/φ(d) = `Σ_{e|d}` 1/φ(e) for squarefree d and the multiplicativity of φ to combine everything into `Σ_{u<R}` μ²(u)τ_k(u)/φ(u), with u = dr′ and τ_k(dr′) ≥ τ_k(r′) (5.9). `Σ_{u<R}` μ²(u)τ_k(u)/φ(u) ≤ `∏_{p<R}(1` + k/(p−1)) ≤ exp(k `Σ_{p<R}` 1/(p−1)) = O_k((log R)^k). This uses `Σ_{p<R}` 1/p = log log R + O(1), which follows from Mertens' first theorem (supplied by AnalyticNumberTheoryPartI §0.21) by partial summation.

The O_k((log R)^k) bound is what turns the error O(λ_max²R²(log `R)^{2k})` of (5.3) into O(y_max²R²(log `R)^{4k}).`

*Needs:* Layer 4 §4.2 maynard's multidimensional sieve weights; AnalyticNumberTheoryPartI §0.21.

**Diagonal form of S₁ (Maynard Lemma 5.1).** Let y vanish off the support, with |y_r| ≤ y_max, and λ = λ(y). Then S₁ = (N/W) Σ_r y_r²/∏φ(rᵢ) + O(y_max² φ(W)^k N(log `R)^k/(W^{k+1}D₀)).`

([MAYNARD-2015](#references), §5, Lemma 5.1 and proof, (5.1)–(5.13), pp. 392–395.)

*Proof sketch.* Expand the square and swap the sums (5.1). By the Chinese remainder theorem, the count of N≤n<2N with n≡v₀ (W) and [dᵢ,eᵢ] | n+hᵢ is N/q + O(1), q = W∏[dᵢ,eᵢ], when W, [d₁,e₁], …, [d_k,e_k] are pairwise coprime. Otherwise it is 0: a prime dividing [dᵢ,eᵢ] and [dⱼ,eⱼ] divides hᵢ − hⱼ and exceeds D₀ > max|hᵢ − hⱼ| (5.2). The O(1) terms: λ is supported on ∏dᵢ < R, so they total ≪ `λ_max²(Σ_{d<R}` τ_k(d))² ≪ λ_max²R²(log `R)^{2k}` (5.3), with λ_max ≪ y_max(log R)^k (Layer 4 abs maynard lambda of y le). Main term: 1/[dᵢ,eᵢ] = `(dᵢeᵢ)^{−1}` `Σ_{uᵢ|dᵢ,eᵢ}` φ(uᵢ) (5.4). Remove the remaining conditions (dᵢ,eⱼ) = 1 (i≠j) with Möbius sums over `s_{i,j},` restricted as in the source (5.5)–(5.6). Substitute the change of variables (5.7)–(5.8) to get (5.11). Every `s_{i,j}` ≠ 1 is coprime to W, hence exceeds D₀; these terms contribute O(y_max²φ(W)^kN(log `R)^k/(W^{k+1}D₀))` (5.12), using `Σ_{u<R,(u,W)=1}` μ²(u)/φ(u) ≪ (φ(W)/W) log R (Layer 1 abs sum squarefree diagonal sub le). R² ≤ `N^{1−2δ}` and W ≪ N^δ, so the O(y_max²R²(log `R)^{4k})` error is smaller than the first (5.13).

The main term is diagonal in y: the change of variables diagonalizes the quadratic form S₁, as in the main term of Selberg's one-dimensional sieve (compare Mathlib's lambdaSquared).

*Needs:* Layer 4 §4.2 maynard's multidimensional sieve weights; Layer 4 §4.4 size of λ in terms of y (maynard (5.9)); Layer 4 §4.2 the w-trick residue v₀ (maynard (4.1)); AnalyticNumberTheoryPartI §1.2a for the ordered-divisor harmonic-sum majorant; Layer 1 §1.1 selberg's diagonal sum in dimension one (ggpy lemma 3, κ=1).

**Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2).** Assume in addition that the primes have level of distribution θ, that k ≥ 2, and fix A>0. Then `S₂^{(m)}` = N/(φ(W) log N) Σ_r `(y⁽ᵐ⁾_r)²/∏g(rᵢ)` + `O((y⁽ᵐ⁾_max)²` `φ(W)^{k−2}N(log` `N)^{k−2}/(W^{k−1}D₀))` + O(y_max² N/(log N)^A).

`y⁽ᵐ⁾_max` bounds `|y⁽ᵐ⁾_r|` for every r.

([MAYNARD-2015](#references), §5, Lemma 5.2 and proof, (5.14)–(5.27), pp. 395–398.)

*Proof sketch.* Expand as for S₁ (5.15). The inner sum runs over one class mod q = W∏[dᵢ,eᵢ] and is coprime to q exactly when d_m = e_m = 1. It equals X_N/φ(q) + O(E(N,q)), where X_N = #{N≤n<2N : n prime} and E is windowError (5.16)–(5.18). Error: q is squarefree and less than R²W, and each q arises from at most `τ_{3k}(q)` tuples. With λ_max ≪ y_max(log R)^k the error is ≪ y_max²(log `R)^{2k}` `Σ_{q<R²W}` `μ²(q)τ_{3k}(q)E(N,q).` Cauchy–Schwarz with E(N,q) ≪ N/φ(q) and PrimesHaveLevel.sum_windowError (R²W < `N^{θ−δ}` for large N) give ≪ y_max²N/(log N)^A (5.19)–(5.20). Main term: write 1/φ([dᵢ,eᵢ]) = `(φ(dᵢ)φ(eᵢ))^{−1}` `Σ_{uᵢ|dᵢ,eᵢ}` g(uᵢ) (5.21), remove the cross coprimality with Möbius sums, and substitute `y⁽ᵐ⁾` (5.23) to get (5.24). Terms with `s_{i,j}` ≠ 1 contribute the D₀ error (5.25). Replace X_N by N/log N + O(N/(log N)²), by the prime number theorem (AnalyticNumberTheoryPartI §0.32 at q=1); the error is absorbed (5.26)–(5.27).

This is the only use of the arithmetic hypothesis. Unconditional results come from Layer 3 `SieveDistribution.primesHaveLevel_of_lt_half`. The implied constants are ineffective through Bombieri–Vinogradov (remark after Lemma 5.2).

*Needs:* Layer 4 §4.2 maynard's multidimensional sieve weights; Layer 4 §4.4 size of λ in terms of y (maynard (5.9)); Layer 4 §4.2 the w-trick residue v₀ (maynard (4.1)); Layer 3 `SieveDistribution.PrimesHaveLevel`; Layer 3 §3.0 divisor moments over reciprocal totients; AnalyticNumberTheoryPartI §0.32 at q=1; Layer 1 §1.1 selberg’s diagonal sum in dimension one.

**y⁽ᵐ⁾ in terms of y (Maynard Lemma 5.3).** If r_m = 1, then `y⁽ᵐ⁾_r` = `Σ_{a_m}` `y_{r₁,…,r_{m−1},a_m,r_{m+1},…,r_k}/φ(a_m)` + O(y_max φ(W) log R/(W D₀)).

([MAYNARD-2015](#references), §5, Lemma 5.3 and proof, (5.28)–(5.32), pp. 398–399.)

*Proof sketch.* Substitute (5.8) into (5.23) (5.28), then swap the d and a sums (5.29). Evaluate `Σ_{rᵢ|dᵢ|aᵢ}` μ(dᵢ)dᵢ/φ(dᵢ) = μ(aᵢ)rᵢ/φ(aᵢ) for squarefree aᵢ (5.30). Since (aⱼ,W) = 1, either aⱼ = rⱼ or aⱼ > D₀rⱼ. The terms with aⱼ > D₀rⱼ contribute O(y_max φ(W) log R/(WD₀)), using `Σ_{a_m<R,(a_m,W)=1}` μ²(a_m)/φ(a_m) ≪ (φ(W)/W) log R (5.31). When aⱼ = rⱼ for every j≠m, the factor ∏g(rᵢ)rᵢ/φ(rᵢ)² is 1 + O(1/D₀), because g(p)p/φ(p)² = 1 − 1/(p−1)² and every prime factor exceeds D₀ (5.32).

`y⁽ᵐ⁾` vanishes unless r_m = 1; the lemma is the only link between `y⁽ᵐ⁾` and y.

*Needs:* Layer 4 §4.2 maynard's multidimensional sieve weights; Layer 4 §4.4 size of λ in terms of y (maynard (5.9)); Layer 4 §4.2 the w-trick residue v₀ (maynard (4.1)); Layer 1 §1.1 selberg's diagonal sum in dimension one (ggpy lemma 3, κ=1).

**Asymptotic for S₁ (Maynard Lemma 6.2).** S₁ = φ(W)^k N(log R)^k `I_k(F)/W^{k+1}` + O(F_max² φ(W)^k N(log `R)^k/(W^{k+1}D₀)).`

F is of class C¹ and supported on ℛ_k, and F_max = `sup_{[0,1]^k}` (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

([MAYNARD-2015](#references), §6, Lemma 6.2 and proof, (6.4)–(6.9), pp. 401–402.)

*Proof sketch.* Insert (6.3) into Lemma 5.1 (6.4); y_max ≤ F_max. Drop the pairwise coprimality of the uᵢ: two integers coprime to W with a common factor share a prime greater than D₀. This costs O(F_max²φ(W)^kN(log `R)^k/(W^{k+1}D₀))` (6.5). Apply Layer 1 abs sum squarefree diagonal smooth sub le k times, once in each variable, with γ(p) = 1 for p∤W and γ(p) = 0 for p|W. Then c_γ = φ(W)/W and L ≪ 1 + `Σ_{p|W}` log p/p ≪ log D₀ by Mertens (6.7)–(6.9). Combine: the error O(log D₀ (log `R)^{k−1})` is smaller than (log R)^k/D₀.

The main term is positive whenever I_k(F) ≠ 0.

*Needs:* Layer 4 §4.4 diagonal form of s₁ (maynard lemma 5.1); Layer 1 §1.1 smoothly weighted diagonal sum (maynard lemma 6.1, ggpy lemma 4); Layer 4 `SieveMaynard.maynardM`; AnalyticNumberTheoryPartI §0.11.

**Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3).** If the primes have level of distribution θ, then `S₂^{(m)}` = φ(W)^k N(log `R)^{k+1}` `J_k^{(m)}(F)/(W^{k+1}` log N) + O(F_max² φ(W)^k N(log `R)^k/(W^{k+1}D₀)).`

F is of class C¹ and supported on ℛ_k, and F_max = `sup_{[0,1]^k}` (|F| + Σᵢ|∂F/∂tᵢ|); y = y(F) is given by (6.3).

([MAYNARD-2015](#references), §6, Lemma 6.3 and proof, (6.10)–(6.22), pp. 402–404.)

*Proof sketch.* If k=0 there is no m. For k=1, on prime n+h₁>R the only divisor is d₁=1, so `S₂^{(1)}=λ₁²` times the prime count in the W-residue class. Apply the level-window estimate (W is smaller than any fixed positive power of N), the prime number theorem and the one-variable smooth diagonal sum for λ₁. This gives the same error. For k≥2 use Lemma 5.2 in the steps below. By Lemma 5.3 and (6.3): if r_m = 1 and ∏rᵢ is squarefree and coprime to W, then `y⁽ᵐ⁾_r` = `Σ_{(u,W∏rᵢ)=1}` μ²(u)/φ(u)·F(…, log u/log R, …) + O(F_max φ(W) log R/(WD₀)) (6.10). In particular `y⁽ᵐ⁾_max` ≪ φ(W)F_max log R/W. Apply Layer 1 abs sum squarefree diagonal smooth sub le in u with γ(p) = 1 for p∤W∏rᵢ, where L ≪ log log N (6.11)–(6.12). This gives `y⁽ᵐ⁾_r` = (log `R)(φ(W)/W)∏(φ(rᵢ)/rᵢ)·F^{(m)}_r` + O(…), where `F^{(m)}_r` = ∫_0^1 F(…, t_m, …) dt_m (6.13)–(6.14). Substitute into Lemma 5.2 (6.15)–(6.16) and drop the coprimality of the rᵢ at the cost (6.17). Apply Layer 1 abs sum squarefree diagonal smooth sub le to each rᵢ (i≠m) with γ(p) = 1 − (p²−3p+1)/(p³−p²−2p+1) for p∤W, for which γ(p)/(p−γ(p)) = φ(p)²/(g(p)p²) (6.19). The result is `J_k^{(m)}` (6.21)–(6.22).

Check of (6.19): p(p−1)²/(p³−p²−2p+1) = 1 − (p²−3p+1)/(p³−p²−2p+1). arXiv v2 printed a different γ; v3 and the published text agree on this one.

*Needs:* Layer 4 §4.4 diagonal form of s₂⁽ᵐ⁾ (maynard lemma 5.2); Layer 4 §4.4 y⁽ᵐ⁾ in terms of y (maynard lemma 5.3); Layer 1 §1.1 smoothly weighted diagonal sum (maynard lemma 6.1, ggpy lemma 4); Layer 4 `SieveMaynard.maynardM`; AnalyticNumberTheoryPartI §§0.11, 0.32; Layer 3 `SieveDistribution.PrimesHaveLevel`.

**Maynard's asymptotics for S₁ and S₂ (Proposition 4.1).** Let the primes have level of distribution θ∈(0,1], let R = `N^{θ/2−δ}` with 0<δ<θ/2 fixed, and let F be smooth and supported on ℛ_k with I_k(F) ≠ 0 and `J_k^{(m)}(F)` ≠ 0 for every m. With λ built from F: S₁ = (1+o(1)) φ(W)^k N(log R)^k `I_k(F)/W^{k+1},` and for every m, `S₂^{(m)}` = (1+o(1)) φ(W)^k N(log `R)^{k+1}` `J_k^{(m)}(F)/(W^{k+1}` log N); hence S₂ = Σ_m `S₂^{(m)}` has the stated asymptotic.

Maynard states Proposition 4.1 with 'exponent of distribution θ'; it is the level of distribution of (1.3).

([MAYNARD-2015](#references), §4, Proposition 4.1, p. 388.)

*Proof sketch.* Apply Lemmas 6.2 and 6.3 with F fixed: F_max is a constant and D₀ → ∞, so each error term is o(main term), because I_k(F) and `J_k^{(m)}(F)` are nonzero. The λ of Proposition 4.1 is the construction from (6.3), by the inversion (5.8).

The S₂ asymptotic, summed over m, is Proposition 4.1's display with Σ_m `J_k^{(m)}(F).`

*Needs:* Layer 4 §4.4 asymptotic for s₁ (maynard lemma 6.2); Layer 4 §4.4 asymptotic for s₂⁽ᵐ⁾ (maynard lemma 6.3).

### 4.5 the positivity criterion and prime clusters

**The GPY positivity criterion.** Let H be finite, N∈ℕ, w_n ≥ 0 and ρ∈ℝ. If `Σ_{N≤n<2N}` (#{h∈H : n+h prime} − ρ)w_n > 0, then some n∈[N,2N) has more than ρ, hence at least ⌊ρ+1⌋, of the n+h prime.

No arithmetic input. The weights need only be nonnegative.

([MAYNARD-2015](#references), §2, (2.1) and the following paragraph, p. 386.)

*Proof sketch.* If every n had at most ρ of the n+h prime, each summand (#{…} − ρ)w_n would be ≤ 0, because w_n ≥ 0, and so would the sum. An integer c > ρ satisfies c ≥ ⌊ρ⌋ + 1 = ⌊ρ + 1⌋.

With ρ = θM_k/2 − ε this is the positivity step of Proposition 4.2. For small ε>0, ⌊ρ+1⌋ = ⌈θM_k/2⌉.

*Needs:* Mathlib finite sums, nonnegative real weights and the native prime predicate.

**From prime clusters to prime gaps.** Let H be finite and nonempty and r ≥ 1. If infinitely many n have at least r of the n+h (h∈H) prime, then `p_{j+r−1}` − p_j ≤ max H − min H for infinitely many j, i.e. liminf_j `(p_{j+r−1}` − p_j) ≤ max H − min H. Here p_j is the j-th prime, counted from 0.

Maynard's p_n is 1-indexed. Differences `p_{n+m}` − p_n are unaffected by the shift.

([MAYNARD-2015](#references), §4, Proposition 4.2, last sentence, p. 389.)

*Proof sketch.* For such an n, let q₁ < … < q_r be r of the primes among the n+h, and let j be the index of q₁. The r primes lie in [q₁, q_r], so `p_{j+r−1}` ≤ q_r and `p_{j+r−1}` − p_j ≤ q_r − q₁ ≤ max H − min H. Distinct large n give arbitrarily large q₁, hence infinitely many j.

With r = 2 and H of diameter 600 this is the step from Proposition 4.2 to `liminf(p_{n+1}` − p_n) ≤ 600.

*Needs:* Mathlib `Nat.nth`; Mathlib `Nat.prime_nth_prime`.

**Primes in admissible tuples (Maynard Proposition 4.2).** Prove `SieveMaynard.infinite_many_primes_of_level`. Let the primes have level of distribution θ∈(0,1] and let H = {h₁,…,h_k} be admissible. With r_k = ⌈θM_k/2⌉, there are infinitely many n such that at least r_k of n+h₁, …, n+h_k are prime. In particular liminf_n `(p_{n+r_k−1}` − p_n) ≤ `max_{i,j}(hᵢ` − hⱼ).

The hᵢ are distinct. M_k is the quantity of Layer 4 `SieveMaynard.maynardM`. For the prime-gap consequence require k≥1. The empty tuple gives the trivial zero-prime count only; it has no maximum or minimum.

([MAYNARD-2015](#references), §4, Proposition 4.2 and proof, (4.4), p. 389.)

*Proof sketch.* For k=0 the prime count in the statement is zero and every n works. For k=1, Cauchy–Schwarz and smooth approximation give M₁=1; infinitely many translated primes supply the one prime in the statement. For k≥2 use the variational argument below with 0<δ<θ/2. Choose F₀∈𝒮_k with ratio > M_k − δ, and then a smooth F₁ with ratio > M_k − 2δ (Layer 4 exists smooth maynard ratio gt). Proposition 4.1 gives S=S₂−ρS₁=(φ(W)^k N(log `R)^k/W^{k+1})·((log` R/log N)Σ_m `J^{(m)}(F₁)−ρI_k(F₁)+o(1)).` Factoring out I_k(F₁)>0 then gives a lower bound with bracket (θ/2−δ)(M_k−2δ)−ρ+o(1). This is (4.4), whose printed sum index j should be m. Take ρ = θM_k/2 − ε, with δ small in terms of ε. Then S > 0 for all large N. The weights are nonnegative, so the positivity criterion gives, for each large N, some n∈[N,2N) with at least ⌊ρ+1⌋ = ⌈θM_k/2⌉ of the n+hᵢ prime (ε small). Since this holds for every large N, there are infinitely many such n. The gap statement is Layer 4 from prime clusters to prime gaps.

k = 105 and θ = 1/2 − ε give r₁₀₅ ≥ 2 (Theorem 1.3). k = 5 and θ = 1 − ε give r₅ ≥ 2 under Elliott–Halberstam (Theorem 1.4).

*Needs:* Layer 4 §4.4 maynard's asymptotics for s₁ and s₂ (proposition 4.1); Layer 4 §4.3 smooth approximation within the simplex; Layer 4 §4.5 the gpy positivity criterion; Layer 4 `SieveMaynard.maynardM`; Layer 4 `SieveMaynard.IsAdmissible`; Layer 4 §4.5 from prime clusters to prime gaps; Mathlib `Nat.infinite_setOfPred_prime`.

### 4.6 lower bounds for M_k

**Lower bound for M_k when k is large (Maynard Proposition 4.3(3)).** Prove `SieveMaynard.eventually_log_sub_lt_maynardM`. For all sufficiently large k, M_k > log k − 2 log log k − 2.

The implied constants in §7 are independent of k.

([MAYNARD-2015](#references), §7, (7.1)–(7.21), pp. 405–408.)

*Proof sketch.* Take F(t) = ∏g(ktᵢ) on ℛ_k (7.3), with g supported on [0,T], γ = ∫g², and μ = ∫ug²/γ < 1 − T/k (7.8). Then I_k ≤ `k^{−k}γ^k` (7.4), and J_k ≥ J′_k − E_k with J′_k = `k^{−k−1}γ^{k−1}(∫g)²` (7.5)–(7.7). Bound E_k by a second moment. With η = (k−T)/(k−1) − μ > 0, 1 ≤ `η^{−2}(Σ_{i≥2}uᵢ/(k−1)` − μ)² on the error region (7.9). Drop the constraint `Σ_{i=2}^k` uᵢ > k−T (printed with i=1, the source convention below) and expand the square: E_k ≤ `η^{−2}μTk^{−k−1}γ^{k−1}(∫g)²/(k−1)` (7.10)–(7.13). Hence kJ_k/I_k ≥ ((∫g)²/∫g²)·(1 − T/(k(1 − T/k − μ)²)) (7.14). This uses (k−1)η² ≥ k(1 − T/k − μ)², which holds because η = x + (k−T)/(k(k−1)) with x = 1 − T/k − μ and 2(k−T)/k ≥ x. Choose g(t) = 1/(1+At) on [0,T] with 1 + AT = e^A (7.16)–(7.18), and A = log k − 2 log log k (7.20)–(7.21).

Only the leading term log k matters for Theorem 1.1. The −2 absorbs the loss log k/((log k)² + O(1)) in (7.21).

*Needs:* Layer 4 `SieveMaynard.maynardM`.

**Moments on the simplex (Maynard Lemma 8.1, corrected).** For integers k ≥ 1 and a, b, j ≥ 0: `∫_{ℛ_k}` (1 − P₁)^a P_j^b dt = (a! b!/(k+a+jb)!) `Σ_{b₁+…+b_k=b}` ∏ᵢ (jbᵢ)!/bᵢ! = `(a!/(k+jb+a)!)·G_{b,j}(k).` Here P_j = Σtᵢ^j and `G_{b,j}(x)` = b! `Σ_{r=0}^{b}` C(x,r) `Σ_{b₁,…,b_r≥1, Σbᵢ=b}` ∏(jbᵢ)!/bᵢ!. The term r = 0, which makes `G_{0,j}` = 1, is needed; the printed formula starts at r = 1.

The multinomial form, summed over all (b₁,…,b_k) including zero entries, needs no convention at b = 0.

([MAYNARD-2015](#references), §8, Lemma 8.1 and proof, (8.2)–(8.6), pp. 409–410.)

*Proof sketch.* Dirichlet integral (8.2): `∫_{ℛ_k}(1−Σtᵢ)^a` `∏tᵢ^{aᵢ}` = a!∏aᵢ!/(k + a + Σaᵢ)!. Prove it by induction on k: integrate t₁ over [0, 1 − `Σ_{i≥2}tᵢ]` with v = t₁/(1 − `Σ_{i≥2}tᵢ)` and use the Beta integral ∫_0^1 t^a(1−t)^b dt = a!b!/(a+b+1)! (from Mathlib's Γ–Beta identity) (8.3). Expand P_j^b by the multinomial theorem (8.4) and apply (8.2); this gives (8.5). Group the tuples by the number r of nonzero bᵢ (8.6). For b = 0 the only tuple is zero, which is the r = 0 term.

k = 5, a = 2, b = 0: the integral is 2!/7! = 1/2520, while the printed formula gives 0. k = 1, a = 0, b = 1, j = 1: ∫_0^1 t dt = 1/2.

*Needs:* Layer 4 `SieveMaynard.maynardM`; Mathlib `Finset.Nat.antidiagonalTuple`; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`.

**I_k and J_k as quadratic forms (Maynard Lemma 8.2).** For P = `Σ_{i=1}^d` aᵢ(1 − `P₁)^{bᵢ}P₂^{cᵢ}` and F = P on ℛ_k (0 elsewhere), with k ≥ 2: I_k(F) = `Σ_{i,j}` aᵢaⱼ(bᵢ+bⱼ)! `G_{cᵢ+cⱼ,2}(k)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ)!,` and `J_k^{(m)}(F)` = `Σ_{i,j}` aᵢaⱼ `Σ_{c′₁≤cᵢ, c′₂≤cⱼ}` `C(cᵢ,c′₁)C(cⱼ,c′₂)·γ·G_{c′₁+c′₂,2}(k−1)/(k+bᵢ+bⱼ+2cᵢ+2cⱼ+1)!.` Here γ = bᵢ!bⱼ!(2cᵢ−2c′₁)!(2cⱼ−2c′₂)!(bᵢ+bⱼ+2cᵢ+2cⱼ−2c′₁−2c′₂+2)!/((bᵢ+2cᵢ−2c′₁+1)!(bⱼ+2cⱼ−2c′₂+1)!), and G includes the r = 0 term. So I_k and Σ_m `J_k^{(m)}` are quadratic forms aᵀA₁a and aᵀA₂a with rational A₁, A₂.

F is symmetric, so `J_k^{(m)}` does not depend on m and Σ_m `J_k^{(m)}` = `kJ_k^{(1)}.`

([MAYNARD-2015](#references), §8, Lemma 8.2 and proof, (8.7)–(8.10), pp. 410–411.)

*Proof sketch.* I_k: expand P² and apply the corrected Lemma 8.1 with j = 2 (8.7). J: expand P₂^c = Σ `C(c,c′)(P′₂)^{c′}` `t₁^{2c−2c′}` and integrate in t₁ with the Beta integral (8.8); then square (8.9). Apply Lemma 8.1 on `ℛ_{k−1}:` `∫_{ℛ_{k−1}}(1−P′₁)^B(P′₂)^{c′}` = B! `G_{c′,2}(k−1)/(k−1+B+2c′)!.` The printed (8.10) has (k+b+c−1)! and `G_{c,2}.` With B = bᵢ+bⱼ+2cᵢ+2cⱼ−2c′₁−2c′₂+2 the denominator is (k+bᵢ+bⱼ+2cᵢ+2cⱼ+1)!, as in the lemma.

k = 5 with (8.16): exact rational arithmetic with these formulas gives I₅ = 29509/1222452000 and ratio 1417255/708216, which agrees with direct integration. The printed G (r ≥ 1) gives I₅ = 17753/977961600 and ratio 26784/17753 ≈ 1.509. For a linearly independent polynomial basis on the simplex, A₁ is positive definite and A₂ is positive semidefinite. Whitening A₁ gives the largest generalized Rayleigh quotient even when A₂ has a kernel. A lower bound needs only one explicit coefficient vector. The blanket positive-definiteness claim for A₂ on p.411 is false.

*Needs:* Layer 4 §4.6 moments on the simplex (maynard lemma 8.1, corrected); Layer 4 `SieveMaynard.maynardM`.

**M₅ > 2 (Maynard Proposition 4.3(1)).** Prove `SieveMaynard.maynardM_five_ge`. M₅ ≥ 1417255/708216 > 2.

F = `P·1_{ℛ₅}` with P = (1−P₁)P₂ + (7/10)(1−P₁)² + (1/14)P₂ − (3/14)(1−P₁) (8.16).

([MAYNARD-2015](#references), §8, (8.16)–(8.17), p. 412.)

*Proof sketch.* F is bounded and supported on ℛ₅, with I ≠ 0 and every `J^{(m)}` ≠ 0, so it is admissible. Lemma 8.2 with these four monomials gives I₅(F) = 29509/1222452000, Σ_m `J₅^{(m)}(F)` = `5J₅^{(1)}(F),` and the ratio exactly 1417255/708216 (8.17). maynardRatio_le_maynardM.

1417255/708216 ≈ 2.001162. Direct Dirichlet-integral expansion and the corrected Lemma 8.2 give the same exact value. θM₅/2 > 1 needs θ > 2·708216/1417255 ≈ 0.99942, which is why Theorem 1.4 needs Elliott–Halberstam.

*Needs:* Layer 4 §4.6 i_k and j_k as quadratic forms (maynard lemma 8.2); Layer 4 `SieveMaynard.maynardM`.

**M₁₀₅ > 4 (Maynard Proposition 4.3(2)).** Prove `SieveMaynard.four_lt_maynardM_105`. M₁₀₅ > 4.

P is a linear combination of the 42 monomials (1−P₁)^bP₂^c with b + 2c ≤ 11, and k = 105.

([MAYNARD-2015](#references), §8, (8.15) and the following sentence, p. 412.)

*Proof sketch.* Form the 42×42 rational matrices A₁, A₂ of Lemma 8.2 at k = 105. The largest eigenvalue of `A₁^{−1}A₂` is ≈ 4.0020697 (8.15). Instead of bounding an eigenvalue, take a rational approximation a of the eigenvector and check aᵀA₂a > 4aᵀA₁a in exact arithmetic, as the source suggests. maynardRatio_le_maynardM.

An approximate eigenvalue about 4.00206976 motivates the polynomial choice. The rational certificate below supplies the lower bound 4.000543795842…>4 without identifying the optimal eigenvalue. (1/2 − ε)M₁₀₅/2 > 1 for small ε: this is the input of Theorem 1.3.

Take P=Σa_(b,c)(1−P₁)^bP₂^c with the following exact coefficients. The factorial/G formulas give I>0 and ΣJ>4I by rational cross multiplication; this proves a lower bound and does not assert an optimal eigenvalue.

| b | c | rational coefficient a_(b,c) |
| --- | --- | --- |
| 0 | 0 | -7959504348236574171698535907224883807458440923/500000000000000000000000000000000000000000000000000000000000 |
| 1 | 0 | -8226304044054793420259518452307497324875488574313/1000000000000000000000000000000000000000000000000000000000000 |
| 2 | 0 | -1381024523110021981075977294446146317788676442433/20000000000000000000000000000000000000000000000000000000000 |
| 3 | 0 | -900688796131919014018001420502987124011154423181387/1000000000000000000000000000000000000000000000000000000000000 |
| 4 | 0 | 248062716921567419511116596593875987941930556206682957/1000000000000000000000000000000000000000000000000000000000000 |
| 5 | 0 | -352278682472027784628003160852398361531128421256344269/500000000000000000000000000000000000000000000000000000000000 |
| 6 | 0 | -32171607742238853969593917986349773988727778607027220961/1000000000000000000000000000000000000000000000000000000000000 |
| 7 | 0 | 89988713206766199847841848476167434583933689164669640409/1000000000000000000000000000000000000000000000000000000000000 |
| 8 | 0 | 133729280896555832234867127543976136445217801183042518387/200000000000000000000000000000000000000000000000000000000000 |
| 9 | 0 | 345409768764135417804631879582428792969398355758722641933/125000000000000000000000000000000000000000000000000000000000 |
| 10 | 0 | -18097325249658249912665943072021721263269963883082054895781/500000000000000000000000000000000000000000000000000000000000 |
| 11 | 0 | 67378640723274614887128315378385922915799240745690793292853/1000000000000000000000000000000000000000000000000000000000000 |
| 0 | 1 | 755333237876125683153576088949183073049291036687/200000000000000000000000000000000000000000000000000000000000 |
| 1 | 1 | 473710841127898284974586018353284816317767022831059/250000000000000000000000000000000000000000000000000000000000 |
| 2 | 1 | 5624687142848131010332994990393670724020573257369643/250000000000000000000000000000000000000000000000000000000000 |
| 3 | 1 | -269224931149896395068162893912381850951448901066875527/1000000000000000000000000000000000000000000000000000000000000 |
| 4 | 1 | -46742083442661270043792071667542428296375033689589249701/1000000000000000000000000000000000000000000000000000000000000 |
| 5 | 1 | 28680217790119391254600235402434507261911501327314774173/125000000000000000000000000000000000000000000000000000000000 |
| 6 | 1 | 1109378564649753330351628300593826171562573974580296534071/250000000000000000000000000000000000000000000000000000000000 |
| 7 | 1 | -2310407433006155019546184649979165197025074143865782574187/200000000000000000000000000000000000000000000000000000000000 |
| 8 | 1 | -7015364824080514948031258301462041917069798045806482541687/50000000000000000000000000000000000000000000000000000000000 |
| 9 | 1 | 217380369838340653295678103574060545183134321261941125642357/500000000000000000000000000000000000000000000000000000000000 |
| 0 | 2 | -366884309322016665897304051153354168757185797164219/1000000000000000000000000000000000000000000000000000000000000 |
| 1 | 2 | -3509973120672230968607873466626535345412962339801391/20000000000000000000000000000000000000000000000000000000000 |
| 2 | 2 | -611442981274554491668257697087407507947668040036330743/250000000000000000000000000000000000000000000000000000000000 |
| 3 | 2 | 13133118297801224478495002133287650651565956633239819411/200000000000000000000000000000000000000000000000000000000000 |
| 4 | 2 | 3005097953214044772053529714082571520307920127754973297231/1000000000000000000000000000000000000000000000000000000000000 |
| 5 | 2 | -21284675971444268343631618981906260073019012628836687421931/1000000000000000000000000000000000000000000000000000000000000 |
| 6 | 2 | -95879616756225812990528036323448950155644270929978678679903/500000000000000000000000000000000000000000000000000000000000 |
| 7 | 2 | 1 |
| 0 | 3 | 2317813448193801743728007668269904929245118909552061/125000000000000000000000000000000000000000000000000000000000 |
| 1 | 3 | 8264067473266183438377843244816172919038717601093691999/1000000000000000000000000000000000000000000000000000000000000 |
| 2 | 3 | 111628886251164136482509530042589066650822902742613102973/1000000000000000000000000000000000000000000000000000000000000 |
| 3 | 3 | -2135979963258043669265965035293447020801152320160298375087/500000000000000000000000000000000000000000000000000000000000 |
| 4 | 3 | -17009742187588430639694714381365010699741729408298905925331/250000000000000000000000000000000000000000000000000000000000 |
| 5 | 3 | 140717460778941566019730476128307591424120210861763781171377/200000000000000000000000000000000000000000000000000000000000 |
| 0 | 4 | -247414538761529771242574573074156116346760947023190593/500000000000000000000000000000000000000000000000000000000000 |
| 1 | 4 | -100475989278642031773267233927135803600495803780682319917/500000000000000000000000000000000000000000000000000000000000 |
| 2 | 4 | -1869957415760311221148546369705832362195334514830264292099/1000000000000000000000000000000000000000000000000000000000000 |
| 3 | 4 | 45850062329923695868372726832024370745910007475628680479007/500000000000000000000000000000000000000000000000000000000000 |
| 0 | 5 | 2809008817533307505265163706150029726563634668966742923/500000000000000000000000000000000000000000000000000000000000 |
| 1 | 5 | 2056635676700897886048289641857281036790415959742580276807/1000000000000000000000000000000000000000000000000000000000000 |

The exact values are

```text
I = 623175844096011471471769405170468799747306260895147598500801461974217784833845377078007509036136439618790079017702635431298083/154428634378677361490535674381273580183154725339727092683822230757848997435328098235561681528023095431683856566950834296074312813613199455934543180015187588172158214083916595200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
sumJ = 2577422148586207415524935988461372234661832848149160309489025997367457012178671486982971016102663638154802413755719463394702679867/159655449696109518340984574129562839820123039120456317359274675491191578886985356945072999979740800200140848635370708687633751093458569283673866179954163168079523569022141464576000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ratio = 33506487931620696401824167849997839050603827025939084023357337965776941158322729330778623209334627296012431378824353024131134838271/8375483344650394176580580805491100668603796146430783723850771648933487028166881867928420921445673748476538661997923420196646235520
```

*Needs:* Layer 4 §4.6 i_k and j_k as quadratic forms (maynard lemma 8.2); Layer 4 `SieveMaynard.maynardM`.

### 4.7 admissible sets and bounded gaps between primes

**Engelsma's admissible 105-tuple of diameter 600.** The 105-element set H₁₀₅ = {0, 10, 12, 24, 28, …, 594, 598, 600} of Maynard's footnote 2 is admissible, contains 0 and 600, and lies in [0,600].

The full 105-element set is given in the worked examples below.

([MAYNARD-2015](#references), §4, footnote 2, p. 390.)

*Proof sketch.* By isAdmissible_iff_card_image_lt, only the 27 primes p ≤ 103 need checking. For each, exhibit a missed residue: for example 1 mod 2, 2 mod 3, 1 mod 5, 4 mod 7, 7 mod 11 and 6 mod 13. This is a finite, decidable computation.

The 105 elements are distinct and sorted, the set is admissible, and its diameter is 600. The list in the published text agrees with arXiv v3.

*Needs:* Layer 4 `SieveMaynard.IsAdmissible`.

**The first k primes above k are admissible.** For every k, the first k primes greater than k form an admissible set. With primes indexed from 0, its diameter for k≥1 is `p_{π(k)+k−1}−p_{π(k)},` and is O(k log k) as k→∞. The empty k=0 set is admissible.

In 0-indexed form the set is {nth prime (π(k) + i) : i < k}.

([MAYNARD-2015](#references), §4, proof of Theorem 1.1, p. 391.)

*Proof sketch.* Every element is a prime greater than k, so none is divisible by a prime p ≤ k = #H; apply isAdmissible_of_forall_not_dvd. The published argument says 'less than k', and so omits p = k when k is prime. Diameter: π(k) + k ≤ 2k, and Chebyshev's lower bound π(x) ≥ c·x/log x (Mathlib pi_ge') gives p_n ≪ n log n.

k = 5: {7, 11, 13, 17, 19}. It misses 0 mod 5 because no element is divisible by 5; this is the case p = k.

*Needs:* Layer 4 `SieveMaynard.IsAdmissible`; Mathlib `Nat.nth`; Mathlib `Nat.prime_nth_prime`; Mathlib `Chebyshev.pi_ge'`.

**Bounded gaps between primes (Maynard Theorem 1.3).** Prove `SieveMaynard.frequently_nth_prime_succ_sub_le_600`. liminf_n `(p_{n+1}` − p_n) ≤ 600.

Unconditional. It uses Bombieri–Vinogradov and none of Zhang's technology.

([MAYNARD-2015](#references), §1, Theorem 1.3, p. 385; proof, p. 390.)

*Proof sketch.* Bombieri–Vinogradov gives level θ = 1/2 − ε. Since M₁₀₅ > 4, θM₁₀₅/2 > 1 for small ε, so r₁₀₅ = ⌈θM₁₀₅/2⌉ ≥ 2. Proposition 4.2 with Engelsma's admissible H₁₀₅ (diameter 600): infinitely many n have two primes among the n + H₁₀₅. Hence `liminf(p_{n+1}` − p_n) ≤ 600.

This is not the twin prime conjecture, and 600 is not optimal (Maynard, p. 385).

*Needs:* Layer 4 `SieveMaynard.infinite_many_primes_of_level`; Layer 4 `SieveMaynard.four_lt_maynardM_105`; Layer 4 §4.7 engelsma's admissible 105-tuple of diameter 600; Layer 3 `SieveDistribution.primesHaveLevel_of_lt_half`; Layer 4 §4.5 from prime clusters to prime gaps.

**Gaps under Elliott–Halberstam (Maynard Theorem 1.4).** Prove `SieveMaynard.elliottHalberstam_gaps`. If the primes have level of distribution θ for every θ < 1 (the Elliott–Halberstam conjecture), then `liminf(p_{n+1}` − p_n) ≤ 12 and `liminf(p_{n+2}` − p_n) ≤ 600.

Conditional on the named hypothesis ElliottHalberstam of Layer 3 `SieveDistribution.PrimesHaveLevel`.

([MAYNARD-2015](#references), §1, Theorem 1.4, p. 385; proof, p. 390.)

*Proof sketch.* Take k = 105 and θ = 1 − ε: θM₁₀₅/2 > 2, so three primes occur among n + H₁₀₅ infinitely often, and `liminf(p_{n+2}` − p_n) ≤ 600. k = 5, H = {0,2,6,8,12} (admissible, diameter 12) and θ = 1 − ε: θM₅/2 > 1, so `liminf(p_{n+1}` − p_n) ≤ 12.

12 appears to be optimal for the method in this form (Maynard, p. 385).

*Needs:* Layer 4 `SieveMaynard.infinite_many_primes_of_level`; Layer 4 `SieveMaynard.maynardM_five_ge`; Layer 4 `SieveMaynard.four_lt_maynardM_105`; Layer 4 §4.7 engelsma's admissible 105-tuple of diameter 600; Layer 4 `SieveMaynard.IsAdmissible`; Layer 3 `SieveDistribution.PrimesHaveLevel`; Layer 4 §4.5 from prime clusters to prime gaps.

**m + 1 primes in bounded intervals (Maynard Theorem 1.1).** Prove `SieveMaynard.exists_frequently_nth_prime_sub_le`. There is an absolute constant C such that liminf_n `(p_{n+m}` − p_n) ≤ C m³ `e^{4m}` for every m ≥ 1.

Unconditional.

([MAYNARD-2015](#references), §1, Theorem 1.1, p. 384; proof, p. 391.)

*Proof sketch.* Take θ = 1/2 − 1/k (Bombieri–Vinogradov). By Proposition 4.3(3), θM_k/2 ≥ (1/4 − 1/(2k))(log k − 2 log log k − 2) (4.5), which exceeds m once k ≥ `C₀m²e^{4m}` for an absolute C₀. Take k = `⌈C₀m²e^{4m}⌉` and H the first k primes above k, which is admissible with diameter ≪ k log k. Proposition 4.2 gives m + 1 primes among n + H infinitely often, so `liminf(p_{n+m}` − p_n) ≪ k log k ≪ `m³e^{4m}.`

Under Elliott–Halberstam the bound improves to `O(m³e^{2m})` (Maynard, p. 385); that is outside this scope.

*Needs:* Layer 4 `SieveMaynard.infinite_many_primes_of_level`; Layer 4 `SieveMaynard.eventually_log_sub_lt_maynardM`; Layer 4 §4.7 the first k primes above k are admissible; Layer 3 `SieveDistribution.primesHaveLevel_of_lt_half`; Layer 4 §4.5 from prime clusters to prime gaps.

**A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2).** Prove `SieveMaynard.positive_proportion_prime_tuples`. For every m ≥ 1 there are r₀ and c > 0 such that every set A of r ≥ r₀ distinct nonnegative integers has at least c·C(r,m) subsets {h₁,…,h_m} ⊆ A for which infinitely many n make every n + hᵢ prime.

The source allows arbitrary integers. Translating A by a constant changes neither count, so natural numbers suffice.

([MAYNARD-2015](#references), §1, Theorem 1.2, p. 385; proof, p. 391.)

*Proof sketch.* With k = `⌈Cm²e^{4m}⌉` as in Theorem 1.1, every admissible k-set contains an m-subset with infinitely many prime translates. Thin A: for each prime p ≤ k, delete the residue class mod p with the fewest elements. The remainder A₂ has s ≥ `r∏_{p≤k}(1` − 1/p) elements, and every k-subset of it is admissible. Double count: each of the C(s,k) k-subsets contains a good m-subset, and each m-subset lies in C(s−m,k−m) of them. So there are at least C(s,k)/C(s−m,k−m) ≫_m s^m ≫_m r^m good m-subsets, while C(r,m) ≤ r^m.

This is a positive-proportion statement, not the prime m-tuples conjecture for any given tuple.

*Needs:* Layer 4 `SieveMaynard.infinite_many_primes_of_level`; Layer 4 `SieveMaynard.eventually_log_sub_lt_maynardM`; Layer 4 `SieveMaynard.IsAdmissible`; Layer 4 `SieveMaynard.primeTranslates`; Layer 3 `SieveDistribution.primesHaveLevel_of_lt_half`.

### 4.8 polynomial prime conjectures

**Bouniakowsky and Schinzel hypotheses.** For f∈ℤ[X], IsBouniakowskyPolynomial means positive leading coefficient and, for every prime p, an integer n with p∤f(n). IsSchinzelTuple means every entry has positive leading coefficient and, for each p, one n avoids divisibility in every entry. BouniakowskyAdmissible and SchinzelAdmissible additionally require irreducibility of each polynomial. The Bouniakowsky conjecture and Schinzel H assert infinitely many natural arguments yielding positive primes for every admissible polynomial or tuple. These conjectures are named hypotheses, never asserted.

Polynomials are in the native Polynomial ℤ carrier. The local condition is on the product, with a common n for each prime; separate admissibility is insufficient. The empty tuple has the vacuous simultaneous-primality condition. Constant irreducible polynomials are excluded automatically by the local condition.

([SS-23](#references), §1, pp.674–675, definitions preceding Theorems 1.1 and 1.2.)

*Construction.* Use native irreducibility, leadingCoeff and evaluation; define only the admissibility and conjecture predicates. For an integer polynomial, evaluation modulo p depends only on n modulo p. The residue formulation agrees by lifting residues. The singleton tuple is exactly the Bouniakowsky case; finite products express the shared local condition.

The definition exposes the following operations and laws:

- Positive leading coefficient and absence of a fixed prime divisor; irreducibility is a separate hypothesis.
- Positive leading coefficients and absence of a fixed prime divisor of the product, with one common argument per prime.
- Pointwise irreducibility and positive leading coefficient, and a shared local avoidance condition.
- Every Bouniakowsky-admissible f has infinitely many n∈ℕ with 0<f(n) and f(n).natAbs prime.
- Every Schinzel-admissible finite tuple has infinitely many n∈ℕ with all values positive primes.
- A one-entry tuple is Schinzel-admissible exactly when its entry is Bouniakowsky-admissible.
- bouniakowsky: Schinzel H implies the Bouniakowsky conjecture.
- The shared local condition is equivalent to p not dividing the product of the values, for every prime p and a suitable n.

**Checks.**

- X+1 is Bouniakowsky-admissible.
- X²+X+2 is not admissible because every integer value is even.
- X and X+1 are separately admissible but their pair fails the shared condition at 2.
- The empty tuple is Schinzel-admissible and its simultaneous-primality set is all ℕ.
- X(X+2) is a Bouniakowsky polynomial in the source sense but is not BouniakowskyAdmissible, because it is reducible.

*Needs:* Mathlib `Nat.Prime`.

### Analytic requirements

Prove L²-to-smooth simplex approximation with the same supremum, diagonal estimates and uniform errors using the stated Layer 1 diagonal estimates, AnalyticNumberTheoryPartI §§0.11, 0.21, 0.32 and 1.2a, and Layer 3 §3.0 divisor moments over reciprocal totients. The six growing cutoffs require 0<δ<θ/2. Separate k=1 direct counting from k≥2 diagonalization; the empty tuple gives trivial counting only. Rational M₅/M₁₀₅ and finite admissibility certificates do not establish the analytic distribution input.

### Examples

For the triangle indicator I₂=1/2, each J₂=1/3 and the ratio is 4/3. Zero fails positive energy; a constant one on the square violates simplex support and would give ratio two. G_(0,2)(5)=1 uses the empty-composition term.

At k=5, P=(1−P₁)P₂+(7/10)(1−P₁)²+(1/14)P₂−(3/14)(1−P₁) gives I₅=29509/1222452000 and ratio 1417255/708216>2. The 42-coefficient k=105 certificate above gives ratio 4.000543795842…>4 in exact arithmetic.

On the triangle F=∂ₓ∂ᵧ[x²y²(1−x−y)²], extended by zero, is symmetric, satisfies F(1/4,1/4)=1/128 and I₂=1/3150, and has both fibre integrals zero. Thus the J matrix may have a kernel; the I matrix is positive definite only on an independent polynomial basis.

The full 105-element admissible set is:

~~~text
{0, 10, 12, 24, 28, 30, 34, 42, 48, 52, 54, 64, 70, 72, 78, 82, 90,
      94, 100, 112, 114, 118, 120, 124, 132, 138, 148, 154, 168, 174, 178, 180, 184, 190, 192,
      202, 204, 208, 220, 222, 232, 234, 250, 252, 258, 262, 264, 268, 280, 288, 294, 300, 310,
      322, 324, 328, 330, 334, 342, 352, 358, 360, 364, 372, 378, 384, 390, 394, 400, 402, 408,
      412, 418, 420, 430, 432, 442, 444, 450, 454, 462, 468, 472, 478, 484, 490, 492, 498, 504,
      510, 528, 532, 534, 538, 544, 558, 562, 570, 574, 580, 582, 588, 594, 598, 600}
~~~

Its endpoints are 0 and 600. Only the 27 primes ≤105 require checking. The first k primes above k miss residue zero at p≤k and cannot cover p>k with only k points. The empty set is admissible; for k≥1 its zero-based diameter is p_(π(k)+k−1)−p_(π(k)).

The nonadmissible tuples {0,1} and {0,2,4} have prime translates {2} and {3}; these nonempty finite sets show why the conjecture requires infinitude.

### Dependencies

Layers 1 and 3. External inputs: AnalyticNumberTheoryPartI §§0.11, 0.21, 0.32 and 1.2a; Layer 3 §3.0 divisor moments over reciprocal totients; AnalyticNumberTheoryPartI §0.21.

## Layer 5: weighted almost primes, joint spins and affine saturation

The almost-prime branch counts factors with multiplicity and retains square exceptions. The spin branch uses native ideal arithmetic and an explicit short-character conjecture. The affine branch requires simultaneous primitivity and actual congruence mixing for its chosen population.

### 5.1 roughness and multiplicity

**From roughness to an almost-prime bound.** Let natural z≥2, n≠0 and k≥0. If every prime p dividing n satisfies z≤p and n<z^(k+1), then Nat.IsAtMostAlmostPrime(k,n).

Prime factors are counted with multiplicity. The upper bound is strict and the unit n=1 is allowed.

([KED-ANT-11](#references), §11.1 rough-number observation.)

*Proof sketch.* Every entry of the native prime factor list is at least z. Hence n, its product, is at least z raised to the list length Ω(n). If Ω(n)≥k+1, monotonicity of natural powers contradicts the strict upper bound. Use the existing at-most predicate, not the exact-k or distinct-factor predicate.

n=8,z=2,k=2 violates the strict cutoff and has Ω=3 although it has only one distinct prime factor; n=1 gives Ω=0; n=0 is excluded.

*Needs:* Mathlib `Nat.IsAtMostAlmostPrime`; Mathlib `ArithmeticFunction.cardFactors`; Mathlib `Nat.prod_primeFactorsList`.

### 5.2 the linear sieve, Rosser's weights and Richert's weighted sieve

**Linear sieve functions.** On s>0, F(s)=2e^γ/s for s≤3 and f(s)=0 for s≤2. Extend by sF(s)=2e^γ+∫_3^s f(t−1)dt when s>3 and sf(s)=∫_2^s F(t−1)dt when s>2. Successive unit-interval extensions uniquely determine continuous positive-domain functions. Use the usual Euler constant γ.

s>0; upper extension starts at 3, lower at 2.

([HB-SIEVES](#references), §4, p.27 and §5pp.35–38; Iwaniec delay equationspp.174–175.)

*Construction.* Define a pair of approximants by the displayed integral operator and iterate ceil(max(s,0))+1 times; values on the required interval stabilize. Prove compatibility of adjacent intervals and the integral equations before deriving differentiability.

The definition exposes the following operations and laws:

- The upper function F through stabilized integral iteration.
- The lower function f through the same iteration.
- F(s)=2e^γ/s for 0<s≤3.
- f(s)=0 for 0<s≤2.
- The two integral equations above.
- For 2≤s≤4, f(s)=2e^γ log(s−1)/s.
- For s>0,0≤f(s)≤1≤F(s).
- Both tend to 1 as s tends to infinity; quantitative exponential decay is a separate proof target.

**Checks.**

- F(1)=2e^γ.
- F(2)=e^γ; the third upper evaluation F(3)=2e^γ/3 tests the inverse-s scaling.
- f(2)=0, so the linear lower sieve does not detect primes at s=2.
- f(3)=2e^γlog 2/3>0.
- f(4)=e^γlog 3/2; extending f=0 past 2 fails both positive evaluations.
- F(3)=2e^γ/3; extending the initial formula beyond 3 would fail the delay equation.

*Needs:* Mathlib `Real.eulerMascheroniConstant`; Mathlib `intervalIntegral`.

**Rosser sieve weights.** For squarefree d<D list its prime divisors p₁>…>p_r. The upper weight is μ(d) if p₁…p_(j−1)p_j³<D at every odd j≤r, and 0 otherwise; the lower weight uses every even j≤r. Both are 0 for d≥D and nonsquarefree d. The d=1 prefix conditions are vacuous, giving weight 1 when D>1.

D>1; descending distinct prime order; strict cutoff.

([HB-SIEVES](#references), §5 equations (5.1)–(5.3), pp.30–34.)

*Construction.* Sort native prime factors descending; use prefixes and the cubic stopping condition. The ambient d<D restriction is present even when the parity conditions are vacuous.

The definition exposes the following operations and laws:

- The displayed upper/lower weights.
- At D>1 both give 1 at d=1.
- Weights vanish outside squarefree d<D.
- Coefficient modulus≤1.
- For squarefree P all of whose prime factors are<D, the lower divisor sum over gcd(n,P) is≤1_(gcd=1), and the upper sum is≥that indicator.
- Native BoundingSieve error is bounded by Σ_(d<D)|R_d|.

**Checks.**

- Both weights at d=1,D=2 are 1.
- At d=2,D=8 the upper weight is 0 because 2³<8 fails.
- At d=2,D=8 the lower weight is−1 because there is no even prefix.
- At d=D=2 the lower weight is 0 despite its vacuous even-prefix conditions.
- At d=4,D=100 both are 0.

*Needs:* Mathlib `ArithmeticFunction.moebius`; Mathlib `Nat.primeFactorsList`.

**Rosser–Iwaniec linear sieve.** Assume the dimension-one product condition ∏_(w≤p<v)(1−g(p))⁻¹≤(log v/log w)(1+K/log w) for 2≤w≤v≤z, with K≥0 and 0≤g(p)<1, and put V(z)=∏_(p<z)(1−g(p)), s=log D/log z. The upper Rosser main term M⁺(z,D) is at most V(z)[F(s)+C_K e^(−s)(log D)^(−1/3)] for D≥z≥2. The lower Rosser main term M⁻(z,D) is at least V(z)[f(s)−C_K e^(−s)(log D)^(−1/3)] for D≥z²≥4.

For a native weighted sieve with nonnegative mass X and correct density/remainder data, these give the corresponding upper and lower sifted-sum brackets with error E(D)=Σ_(d<D)|R_d| on their respective domains. When z≤D<z², f(s)=0 and nonnegativity gives S(z)≥0≥XV(z)[f(s)−C_K e^(−s)(log D)^(−1/3)]−E(D); this is a lower bound for S, not for the signed main term M⁻.

Nonnegative mass; correct density/remainder data; upper main term for D≥z≥2, lower main term for D≥z²; fixed product-condition constant K.

([IWA-ROSSER](#references), Theorem 1, pp.172–174; HB Theorem 5.1/Corollary 5.1, pp.35–36.)

*Proof sketch.* Combinatorial brackets and coefficient support are finite. The analytic main terms require Iwaniec’s switching integrals and error-control proof §§3–5, retaining the separate domains. Multiply the main-term inequalities by X≥0 before applying the absolute remainder bound. For 1≤s<2 use nonnegativity of S directly. HB Theorem 5.1 requires both its lower sign correction and the lower-main-term range restriction.

**Checks.**

- For D=z and g(p)=1/p on D^(1/4)≤p<D, zero elsewhere, M⁻=1−Σg(p) tends to 1−log 4<0, while V(z) tends to 1/4 and f(1)=0. Thus a lower main-term estimate cannot be extended to s=1 with a vanishing error depending only on K.
- At D=z², s=2 and f(2)=0: the lower main-term estimate is available, with its negative error retained.
- For the empty population X=0,R_d=0, both sifted-sum brackets give 0≤0; no division by X is needed.

*Needs:* Layer 5 §5.2 linear sieve functions; Layer 5 §5.2 rosser sieve weights; Layer 0 §0.5 euler-product sieve dimension.

**Upper sifted-sum bound below s=1.** Under the same product condition and nonnegative mass, for z≥D≥2 and s=log D/log z∈(0,1], prove

`S(z)≤XV(z)[F(s)+C_K s⁻¹((log D)^(−1/3)+(log D)⁻¹)]+E(D)`.

Here E(D) is the same absolute remainder sum on squarefree sieving divisors d<D. In particular the relative main-term error is O_(K,s₀)((log D)^(−1/3)+(log D)⁻¹), uniformly for s₀≤s≤1 with fixed s₀>0. This is an upper bound for the sifted sum; it makes no assertion about raw Rosser main terms below s=1.

*Proof sketch.* Monotonicity gives S(z)≤S(D). Apply the upper s=1 estimate to S(D), with the same level D, and use V(D)/V(z)≤s⁻¹(1+K/log D). Since F(1)/s=F(s)=2e^γ/s, multiplication gives the displayed bound, absorbing the product of the two errors using log D≥log 2. Divisors of the smaller prime product form a subset of the original d<D remainder range, so E(D) is unchanged (HB-SIEVES, Corollary 5.1, p.36; the product comparison is the stated dimension-one hypothesis).

**Checks.**

- At s=1, D=z, the product ratio is one and F(s)=2e^γ, agreeing with the upper endpoint theorem.
- At s=1/2, z=D², F(s)=4e^γ; replacing it by F(1) loses a factor two.
- In the Richert choice r=3, α=γ/4, β=27γ/28, the limiting parameter (γ−β)/α=1/7 has F=14e^γ and D_p≥N^(γ/28). Thus log D_p tends to infinity uniformly, although D_p<z near the upper prime endpoint.

*Needs:* Layer 5 §5.2 rosser–iwaniec linear sieve (upper s=1 case); Layer 5 §5.2 linear sieve functions; Layer 0 §0.5 truncated remainder mass.

**Beta sieve in general dimension.** For each κ>0 the Iwaniec constants β_κ,A_κ,B_κ and delay functions F_κ,f_κ satisfy s^κF=A_κ for 0<s≤β_κ+1, s^κf=B_κ for 0<s≤β_κ, with the stated delayed derivatives beyond those endpoints and normalization at infinity. Under the corresponding κ product condition, Theorem 1 bounds the sifted sum by XV(z) times these functions with error e^sqrt(K)Q_κ(s)(log D)^(-1/3), plus/minus the absolute remainder sum. For κ=1,β=2,A=2e^γ,B=0. The error control is Q_κ(s)≪_κ exp(−s log s+s log log(3s)+O_κ(s)). For 0<κ<1/2, β=1 and B>0; atκ=1/2, β=1,A=2sqrt(e^γ/π),B=0; forκ>1/2,β>1,B=0. Prove their normalized existence and precise κ-dependent constants, including β_t<9t for integer t≥1 and f_t(s)>0 for s>β_t, the lower-sifting properties used below (BGS-10, Theorem 3.1 and §3.3).

κ>0; the κ-specific product condition with K≥2 and 0<g(p)<1; D≥z≥2, so s≥1, with no additional s≥β_κ restriction.

([IWA-ROSSER](#references), Theorem 1 and equations (1.5)–(1.10), pp.172–176.)

*Proof sketch.* Import the complete κ-dependent delay-system existence and normalization proof from the original §§3–5. The linear signature does not define general β_κ. Maintain the original function Q_κ(s), not an unproved dimension-independent exponential replacement.

*Needs:* Layer 0 §0.5 euler-product sieve dimension; Layer 5 §5.2 rosser–iwaniec linear sieve.

**Positive lower sieve above 9t.** For an integer t≥1, fixed s>9t, A₁>1 and K≥0, prove that there are c>0 and z₀≥2, depending only on these parameters, with the following property. Let z≥z₀, X>0 and a finite nonnegative weighted population have multiplicative divisibility main term Xg(d), g(1)=1, 0≤g(p)≤1−1/A₁ for every prime p<z, and remainder R_d. Assume, for 2≤w≤v≤z,

`∏_(w≤p<v)(1−g(p))⁻¹ ≤ (log v/log w)^t (1+K/log w)`.

Writing V(z)=∏_(p<z)(1−g(p)), if Σ_(d<z^s, d squarefree)|R_d|≤c X V(z), then S(z)≥c X V(z). Constants and the remainder threshold are uniform in the population. Empty local bad sets may be deleted; fixed excluded primes and full local obstructions are dealt with before the theorem is used.

([BGS-10](#references), Theorem 3.1 and §3.3, equations (3.41)–(3.47), pp.580–581, the lower-sieve application.)

*Proof sketch.* Use the lower beta-sieve with its dimension-t sifting limit strictly below 9t. For fixed s>9t its main coefficient has a positive lower bound; bounded lower weights leave at most the displayed absolute remainder mass. Choose c smaller than half that main coefficient. This is a separate lower-sieve proof, not a consequence of the elementary estimate with u≥9t+1.

**Checks.**

- At t=1,s=9.5 the range is nonempty; the elementary u≥10 estimate cannot be applied.
- At u=10 and K=2 the elementary error exp(10−u)K¹⁰=1024, so it yields no positive lower bound.
- A fixed obstruction g(2)=1 makes V(z)=0 for z>2 and violates the strict local margin; the theorem cannot certify a positive count for this population.

*Needs:* Layer 5 §5.2 general-dimension beta sieve, including its lower sifting limit β_t<9t for integer t≥1 and strict positivity beyond that limit; weighted divisibility interchange and the absolute remainder bound of Layer 0.

**Fundamental lemma for the linear sieve.** For a dimension-one family with X>0 eventually, V(z)>0, Σ_(d<D)|R_d|=o(XV(z)), D≥z→∞ and log z=o(log D), the sifted sum is asymptotic to XV(z). The conclusion needs both the main-term functions tending to 1 and a remainder small relative to XV, not merely relative to X.

Uniform dimension constant; eventually positive main scale XV(z); relative remainder; s→∞.

([IWA-ROSSER](#references), Theorem 4, pp.176–177; HB Fundamental Lemma, p.38.)

*Proof sketch.* Since s tends to infinity, eventually D≥z² and both main-term estimates apply. Apply both brackets and divide by positive XV. Control the linear-function error and the relative remainder independently.

*Needs:* Layer 5 §5.2 rosser–iwaniec linear sieve; Layer 5 §5.2 linear sieve functions.

**Richert logarithmic weights.** For N>1,0<α<β,(r+1)β>1, define w_p=[β/((r+1)β−1)](1−log p/(βlog N)) when N^α≤p<N^β is prime, and 0 otherwise. W(A)=Σ_(n∈A,n N^α-rough)(1−Σ_(p|n)w_p). The inner sum counts distinct prime factors; Ω almost-prime conclusions require a separate prime-square exception estimate.

Positive n≤N; full prime set, or every prime factor outside it treated explicitly; nonnegative family mass.

([HB-SIEVES](#references), §6, equations (6.1)–(6.4), pp.39–44.)

*Construction.* Use native prime-factor sets for the weight and native Ω for the conclusion. Pointwise positivity excludes ω(n)≥r+1; repeated prime factors below N^β form the exception.

The definition exposes the following operations and laws:

- The displayed prime weight with strict upper endpoint.
- The rough weighted family sum.
- Weights are nonnegative under the stated parameter range.
- W=S(A,z)−Σp w_pS(A_p,z).
- For rough 1≤n≤N with ω(n)≥r+1, the summand is nonpositive.
- W≤weighted count of Ω(n)≤r plus the mass of n having some p²|n with N^α≤p<N^β.

**Checks.**

- A prime p<N^α has weight 0.
- At p=N^β the weight is 0.
- For N=8,α=1/4,β=1,r=1, n=8 has only one weighted distinct prime, yet Ω(8)=3; it is caught by the square exception.
- The empty family has W=0.

*Needs:* Mathlib `Nat.primeFactors`; Mathlib `ArithmeticFunction.cardFactors`; Layer 5 §5.2 linear sieve functions.

**Richert weighted sieve.** For a family A_N⊆[1,N] with positive mass scale X_N, nonnegative multiplicative density g with g(1)=1 and g(p)=ω(p)/p, require a fixed A₁>1 with 0≤g(p)≤1−1/A₁ at every sieving prime and the uniform dimension-one Euler-product condition of linear_sieve_estimate, then assume the dimension-one prime-sum condition Σ_(z<p≤w)g(p)log p=log(w/z)+O(1), square-exception mass O(X_N/log²N), and remainder Σ_(d<N^γ)|R_d|=O(X_N/log²N), choose 0<α<β<γ,(r+1)β>1. If f(γ/α)>[β/((r+1)β−1)]∫_α^β(1/v−1/β)F((γ−v)/α)dv, then the mass of P_r values is ≫X_N/log N. Uniform constants and sufficiently large N are part of the statement.

All these hypotheses hold uniformly in N; the strict integral margin is fixed; weights are nonnegative. Every prime omitted from the sieve is explicitly accounted for in the Ω transfer.

**Checks.**

- For A_N={30m≤N}, g(2)=g(3)=g(5)=1, so the strict local condition fails. Every member has Ω≥3, ruling out a P₂ lower count.
- In that family g(d)=gcd(30,d)/d has |R_d|≤1; a small remainder alone does not remove the obstruction.
- For g(p)=1/p and all primes included, A₁=2 is a uniform local margin; no prime is silently omitted.

([HB-SIEVES](#references), Theorems 6.1–6.2 and equations (6.3)–(6.6), pp.42–45.)

*Proof sketch.* Apply the lower sifted-sum bracket to A. For A_p use level D_p=N^γ/p and cutoff z=N^α: at s_p=log D_p/log z≥1 use the upper linear sieve, and at s_p<1 use the upper sifted-sum bound below s=1. The latter applies uniformly because s_p≥(γ−β)/α>0 and D_p≥N^(γ−β)≥2 for sufficiently large N. Both ranges give the same leading F(s_p) and o(1) relative main-term error. Each resulting error is a sum of |R_(pd)| with pd<N^γ; such an integer has at most γ/α prime divisors p≥N^α. Thus the same absolute remainder budget suffices. Partial summation with the two-sided prime-sum estimate gives the displayed integral; use the separate square exception to convert distinct factors to Ω.

*Needs:* Layer 5 §5.2 richert logarithmic weights; Layer 5 §5.2 rosser–iwaniec linear sieve; Layer 5 §5.2 upper sifted-sum bound below s=1; the stated uniform dimension-one and prime-sum hypotheses.

**Richert explicit level threshold.** For integer r≥1 put Λ_r=r+1−log(4/(1+3^(−r)))/log 3. Under the other Richert assumptions, γ>1/Λ_r yields ≫X/log N P_r values by α=γ/4 and β=γ/(1+3^(−r)). In particular γ<1/2 sufficiently near 1/2 gives Goldbach prime+P₃, whereas this criterion does not yield prime+P₂.

Strict γ threshold; Λ_r>0; square and remainder hypotheses retained.

([HB-SIEVES](#references), Theorem 6.2 and Example 2, pp.45–46.)

*Proof sketch.* Integrate the explicit small-range linear functions, then substitute α,β. Verify the strict threshold before invoking the transferred prime progression estimates.

*Needs:* Layer 5 §5.2 richert weighted sieve; Layer 3 §3.4 weighted prime-distribution transfer.

### 5.3 short-character progression and subset transfer

**Short character input for joint spins.** Use C_m with m=|S|n≥3 in the uniform-Q form of Exact supplier contracts, including all real nonprincipal characters of moduli q≤Q. Derive its ε-free version by shrinking the saving as stated there; the primitive conductor-q specialization takes Q=max(3,q). The progression corollary for odd squarefree q>1 and q∤k uses the reduced nonprincipal conductor q/gcd(q,k), with a possibly smaller positive saving. C_m remains an explicit hypothesis, not a theorem asserted here.

C_|S|n; arbitrary interval origin; the source progression coprimality/reduction hypotheses. The progression corollary has odd squarefree q>1 and q∤k; gcd(q,k)=1 is not required. The reduced nonprincipal conductor is q/gcd(q,k).

([KM-21](#references), §2.5, Conjecture C_n and Corollary 2.2, pp.6–7; [FIMR-ERRATUM-2015](#references), Items 1,3–5,7, pp.923–925.)

*Proof sketch.* Assume C_m, as stated under the short-character conjecture contract, uniformly in the interval origin; derive here the progression form of KM Corollary 2.2, recording the exponent (1−δ)/m. For joint-pattern moments at subsets T⊆S, partition longer intervals to transfer C_|S|n to a weaker C_|T|n; the loss must be explicit. Use the corrected progression reduction of the published FIMR2015 erratum; when q∤k, the reduced conductor is greater than 1. The actual spin exceptional-set argument must also incorporate the different and the corrected norm divisibility condition from that erratum.

**Checks.**

- An interval of length zero has sum zero, regardless of origin or character.
- For the nonprincipal character modulo 3 with values 1,−1,0, the interval (0,2] has sum 0 while (1,3] has sum −1. Uniformity in the origin cannot be omitted.
- For q=15,k=3 the reduced conductor is 5>1; for k=15 it is 1 and the progression condition fails. A principal character modulo 3 has sum 2 on every complete period of length 3, so it cannot satisfy an arbitrarily long power-saving version of this conjectural bound.

*Needs:* The explicit Cₘ hypothesis in Exact supplier contracts; ArithmeticStatisticsPartV §3.30 joint-spin arithmetic data.

### 5.4 affine sieve data and saturation

**Subgroup reduction images.** For a fixed finitely generated Zariski-dense integral subgroup Γ of a connected simply connected absolutely almost simple ℚ-group G, and every M≥1, prove the existence of q₀ divisible by M and the bad-reduction primes such that Γ surjects onto G(𝔽_p) for p∤q₀, and onto Γ mod q₀ times ∏_(p|d)G(𝔽_p) for every squarefree d coprime to q₀ (BGS-10, Theorem 2.1, p.571). Include the finite-index congruence-subgroup and primitive-coset comparisons of Proposition 2.1, p.572; no prime is discarded from the final primitivity condition.

**Checks.**

- SL₂(𝔽₂) has 6 elements and SL₂(𝔽₃) has 24; their CRT product at modulus 6 has 144 elements.
- The subgroup congruent to 1 modulo 2 has image of size 1 at 2, so the theorem must allow 2|q₀.
- At d=1 the squarefree product is the one-element group, leaving only the image modulo q₀.

*Needs:* AdelicAlgebraicGroups §4.2 arithmetic-group carriers; native subgroup reductions and CRT; the finitely generated subgroup theorem at the displayed source locator.

**Uniform algebraic point counts.** For fixed ambient dimension n, number of equations r and degree bound d, prove a constant C_(n,r,d) such that over every finite field 𝔽_q each geometrically irreducible affine variety V of dimension e≥0 presented by at most r equations of degree≤d satisfies |#V(𝔽_q)−q^e|≤C_(n,r,d)q^(e−1/2). Prove also #W(𝔽_q)≤C_(n,r,d)q^e for arbitrary varieties W of dimension≤e in that presentation class, including reducible ones. Apply the latter to proper hypersurface intersections. These uniform statements extend the fixed-model contract of InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 (BGS-10, (3.34)–(3.40), pp.580–581; (3.52)–(3.53), p.582, Lang–Weil applications).

**Checks.**

- An affine line over 𝔽₂ has 2 points, matching p^e=2 exactly.
- The union xy=0 in 𝔽₃² has 5 points and dimension one. It needs the reducible upper bound, rather than an irreducible leading coefficient 1.
- Two distinct affine lines meet in one point; coincident lines meet in a line with 3 points over 𝔽₃. The local-factor application must retain distinct geometric factors.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 fixed-model Lang–Weil and the uniform finite-presentation proof; native affine varieties, dimension and finite fields.

**Squarefree-ring sum-product.** Fix 0<δ₁≤δ₂<1. Prove that some δ₃>0 gives |A+A|+|AA|>q^δ₃|A| for every squarefree q>1 and A⊆ℤ/qℤ satisfying |A|<q^(1−δ₁) and |π_d A|>d^δ₂ for every d|q with d>q^(δ₁/3) (BGS-10, Theorem 1.3, p.565; proof §5). Constants depend only on δ₁,δ₂.

**Checks.**

- A={0} has |A+A|+|AA|=2, but each nontrivial projection has size 1 and fails the hypothesis.
- The full ring at q=6 has size 6 and sum/product sets both of size 6; it fails the strict upper-size condition.
- For A={0,1} in 𝔽₇ the sumset has 3 elements and product set 2, giving total 5 against q^δ₃·2; the projection at d=7 has size 2. For δ₁=δ₂=1/4 both input inequalities hold.

*Needs:* Native finite rings and additive/multiplicative finite sets; the projection and amplification arguments of BGS-10 §5, rather than prime-modulus expansion alone.

**Noncommutative flattening.** Establish the finite-group Balog–Szemerédi–Gowers input with its quantitative constants: for a symmetric probability mass μ on a finite group and K≥2, if ‖μ∗μ‖₂≥‖μ‖₂/K, find a finite set H with native `IsApproximateSubgroup (K^C) (H : Set G)`, K^(−C)‖μ‖₂^(−2)≤|H|≤K^C‖μ‖₂^(−2), and μ(gH)≥K^(−C) for some g. Here C is absolute, convolution is counting convolution, and the L² norm uses counting measure. For each κ₀,κ₁>0, prove the existence of κ₂,κ₃,η>0 and q₁ such that every squarefree q≥q₁ and A⊆SL₂(ℤ/qℤ) with q^κ₀<|A|<q^(3−κ₀), |π_d A|>d^κ₁ whenever d|q and d>q^(κ₀/40), and #{x∈A:gcd(q,tr(gx)−t)>q^κ₂}≤η|A| for every t modulo q and every matrix g nonzero modulo each p|q, satisfy |AAA|>q^κ₃|A| (BGS-10, Proposition 4.3, (4.62)–(4.65), p.595); use it to prove Proposition 4.2's flattening for the projected free random-walk measures. The product-growth comparison and its nonconcentration verification are part of this target, including the representation multiplicity and small-prime cases (BGS-10, §4.1, (4.21)–(4.60), pp.589–595; §4.2).

**Checks.**

- A point mass at 1 has squared L² norm 1 before and after convolution, with H={1}; it has no decay without a nonconcentration input.
- Uniform probability on S₃ has squared norm 1/6 before and after convolution; uniform probability on its subgroup A₃ has squared norm 1/3. Both satisfy the approximate-subgroup alternative and distinguish counting from probability-normalized L².
- For a subgroup H of a finite group, uniform mass on H has HH=H, so X={1} suffices. An abelian sum-product theorem cannot exclude this noncommutative obstruction.

*Needs:* Native finite groups, `IsApproximateSubgroup` and finite mass convolution; the quantitative group Balog–Szemerédi–Gowers argument and squarefree product growth just specified; squarefree-ring sum-product in this subsection. The squarefree SL₂ spectral conclusion also uses the multiplicity estimate dim ρ≥(p−1)/2 for nontrivial irreducible representations of SL₂(𝔽_p) at odd p, and its CRT new-representation version (BGS-10, (4.8)–(4.17), pp.587–588).

**Primitive affine sieve pair.** For O⊆Z^d and integer polynomial f integral on O, (O,f) is primitive if for every integer q≥2 there is x∈O with gcd(|f(x)|,q)=1. This is stronger than gcd of all values being 1: the surviving point must avoid every prime dividing a composite q simultaneously. Integer polynomial coordinates use native MvPolynomial.

O nonempty follows from primitivity; integer-valued polynomial; nonzero/nonunit target hypotheses are additional.

([BGS-10](#references), Definition of primitive pair §1, pp.560–561; local obstruction discussion §2.4, pp.571–573.)

*Construction.* Use native integer evaluation and simultaneous congruence avoidance. Strong approximation supplies the finite local-obstruction reduction for the algebraic-group applications.

The definition exposes the following operations and laws:

- The displayed all-composite-moduli coprimality predicate.
- Primitive O is nonempty.
- Replacing f by−f preserves primitivity.
- If one prime divides every value then the pair is not primitive.
- It suffices to test squarefree moduli, retaining simultaneous avoidance.
- If reduction images split over the prime factors by CRT, primitivity is equivalent to avoiding each local zero locus.

**Checks.**

- For O=Z and f(T)=T, choose 1; the pair is primitive.
- For f(T)=2T+2 on Z the pair is not primitive.
- Values{2,3} have gcd 1 and individually avoid 2 and 3, but fail primitivity atq=6.
- An empty orbit fails primitivity.

*Needs:* Mathlib `MvPolynomial`.

**Affine almost-prime locus and saturation.** For integer polynomial f and orbit O, O_r={x∈O:f(x)≠0 and Ω(|f(x)|)≤r}. The pair saturates when some O_r is Zariski dense in the Zariski closure of O, and its saturation number is the least such r. Use signed values through absolute value. For the affine-coordinate signature, relative polynomial density means every rational polynomial vanishing on O_r vanishes on O; identify this adapter with the native Zariski closure before packaging.

Finite coordinate dimension; native polynomial evaluation; no positivity restriction.

([BGS-10](#references), Saturation definition §1, pp.560–561; signed-prime conventionp.563.)

*Construction.* Define the arithmetic locus using native Ω, excluding 0. Reuse native zero loci/topology rather than constructing a second algebraic geometry. Prove that the polynomial-density characterization agrees with native Zariski closure on the affine coordinate carrier.

The definition exposes the following operations and laws:

- The displayed subset O_r.
- The rational-polynomial vanishing adapter for relative Zariski density.
- Existence of an r with the relative-density property.
- The least such r, with 0 as the non-saturating convention.
- The loci increase with r.
- Replacing f by−f gives the same locus.
- Zeros never belong to the locus.
- For a saturated pair its least r has the relative-density property.

**Checks.**

- A value−6 belongs to O₂; omitting absolute value fails.
- A value 8 fails O₂ since Ω(8)=3, despite one distinct prime factor.
- A value 0 fails every locus, despite native Ω(0)=0.
- Values±1 belong to O₀; the main theorem separately excludes a unit polynomial.
- On a singleton orbit with f=6, the least dense locus is O₂, so the saturation number is 2. For f=1 it is O₀, so the least index is 0.
- On a singleton with f=0, every locus is empty and none is dense; saturation fails and the outside-domain convention gives 0. The constant polynomial 1 separates the empty locus from that nonempty orbit, distinguishing this convention from the preceding true minimum zero.

*Needs:* Mathlib `MvPolynomial`; Mathlib `ArithmeticFunction.cardFactors`; Mathlib `Nat.IsAtMostAlmostPrime`.

**Affine walk sieve data.** Fix a nonempty finite symmetric generating set S of the original group Γ, let m=|S|≥1, and form an alphabet A with one letter evaluating to each s∈S and m separately labelled letters evaluating to the identity. Let Ω_L=A^L be all labelled words of length exactly L, with no reduction, and evaluate a word by multiplying its letters in their written order, starting at the identity. Push counting mass through Γ to the integral orbit point and then to |f| using the finite-family bridge of §0.2. The full word mass is X_L=(2m)^L; polynomial-value collisions and identity labels keep their multiplicities. For every squarefree d≥1 write H_d=Γ mod d, β(d)=#{h∈H_d:f(h)=0}/|H_d|, and R_d=count_d−β(d)X_L. At d=1 set β(1)=1, so R₁=0.

Integral orbit evaluation; fixed finite generators; nonnegative counting mass; the evaluation of f is reduced modulo d. A zero polynomial value is handled by the sifted zero-locus exception. Empty local bad sets are deleted before constructing native BoundingSieve data, whose prime densities must be strictly between zero and one.

([BGS-10](#references), §3.3, p.583, (3.56)–(3.57) and the following paragraph, for walks on the original group; §3.1, pp.573–574, for the sieve adapter.)

*Construction.* Use the existing finite-family bridge and the actual finite reduction image. The uniform probability on letters induces T_d=(I+P_(S,d))/2, where P_(S,d) averages right multiplication by generators on H_d. Relations in Γ do not change the population. Multiplicative β on good squarefree moduli requires the subgroup reduction-image/CRT theorem.

The definition exposes the following operations and laws:

- The evaluation from labelled words to Γ, and then to the integral orbit and natural absolute polynomial value, preserves all fibre multiplicities under pushforward.
- Total support weight equals X_L=(2m)^L; the native main scale may instead be X_L/|H_b| when conditioning below.
- Divisor sums count the corresponding word preimages; their signed remainders are count minus the specified main term, including the term at one.
- Appending a uniformly chosen letter gives the transition T_d, with initial point mass at the identity.
- On good coprime squarefree moduli β is multiplicative; the sifted sum counts words avoiding the specified local zero sets.

**Checks.**

- For m=2 and L=1 there are four words: two generator labels and two identity labels. The identity therefore has mass 2, even before any further collisions.
- At L=0 there is one empty word evaluating to the identity, and X₀=1. In the unconditioned population R₁=1−1=0.
- In the two-element quotient with S={s}, s²=1, the length-one endpoints have masses 1 at each element; P has eigenvalues 1,−1 and T has eigenvalues 1,0. A non-lazy walk alternates point masses instead.
- For a word with f=0 every positive d divides its value; it contributes no sifted mass once a prime is sieved. With no local primes the full word mass survives.

*Needs:* Layer 0 §0.2 weighted finite-family sieve; native finite reduction maps; Layer 5 §5.4 subgroup reduction images.

**Local densities for affine orbits.** For connected simply connected absolutely almost simple G/ℚ, finitely generated Zariski-dense integral Γ, and an integral regular function f nonzero and nonunit on G, let t≥1 be the number of distinct geometric irreducible components of its zero locus. No individual component need be defined over ℚ, and repeated factors of f are allowed. Outside a finite modulus q₀, let t_p count the components of the reduced zero locus individually fixed by Frobenius. Prove β(p)=t_p/p+O(p^(−3/2)), hence β(p)≤t/p+O(p^(−3/2)). If f=c∏_(j=1)^t f_j with distinct f_j∈ℚ[G] absolutely irreducible over the algebraic closure, every t_p=t outside q₀ and the equality with leading coefficient t follows. Multiplicativity on good squarefree moduli comes from the reduction-image theorem; primitivity implies β(p)<1 at every local prime used, including the finite exceptional part.

With the finite exceptional primes represented by the primitive-coset modulus, prove that some K≥0 satisfies, for every 2≤w≤v,

`∏_(w≤p<v,p∤q₀)(1−β(p))⁻¹ ≤ (log v/log w)^t (1+K/log w)`.

Consequently V(z)=∏_(p<z,p∤q₀)(1−β(p))≥c(log z)^(−t) for z≥2 and some c>0. These are an upper dimension-t product condition and a lower bound for V, with constants depending on the fixed group, polynomial, generators and modulus; an asymptotic with leading t is not required. The finite-prime adapter retains simultaneous primitivity at every prime.

([BGS-10](#references), §3.2, (3.6), pp.574–575, for the rational absolutely irreducible factor case; (3.34)–(3.40), pp.580–581, for the point-count inputs. The component-wise upper bound follows by the intersection argument below.)

*Proof sketch.* Apply the uniform algebraic point counts of this subsection to each Frobenius-fixed geometric component and to G. Each fixed component contributes p^(dim G−1)+O(p^(dim G−3/2)). A rational point on a non-fixed component lies also on its distinct Frobenius conjugate, whose intersection has dimension at most dim G−2; sum the corresponding O(p^(dim G−2)) counts. The uniform presentation bound applies to the union of these intersections, which descends to the finite field. Divide by #G(𝔽_p)=p^dim G+O(p^(dim G−1/2)), enlarging q₀ to make the denominator positive and at least a fixed multiple of p^dim G. Use the subgroup reduction-image theorem; the rational-point strong-approximation contract alone is insufficient. The upper bound β(p)≤t/p+O(p^(−3/2)) and AnalyticNumberTheoryPartI §§0.21, 0.26 give the displayed product inequality: the reciprocal-prime error is O(1/log w) and the summable local error tail is O(w^(−1/2)). Enlarge K for the bounded prime range. Repeated factors do not change the zero locus, but their multiplicities remain in deg f for the height bound.

**Checks.**

- On SL₂ with f=a²+b² and Γ=SL₂(ℤ), f(I)=1 gives primitivity and t=2. At p=3 there are no zero first rows compatible with determinant one, so β(3)=0 and t₃=0. At p=5 there are 2(5−1)·5=40 zeros among 5(5²−1)=120 matrices, so β(5)=1/3=2/(5+1) and t₅=2. The equality 2/p+O(p^(−3/2)) cannot hold along the inert primes. At the exceptional prime 2 the count is 2/6=1/3, still strictly below one and retained by the finite-prime adapter.
- For f=a on SL₂, at p=3 the zero first rows number 2 and each has 3 completions, giving β(3)=6/24=1/4=1/(p+1), with t=1. For f=a² the same six matrices vanish and t is still 1, while deg f changes from 1 to 2.
- For f=a²+b² the product over p=3,5 is V=(1−0)(1−1/3)=2/3; the inverse product is 3/2. A zero local density contributes factor one and is allowed by the upper dimension condition.
- The constant f=2 has β(2)=1 and fails primitivity; it cannot be repaired by omitting the prime 2. A unit f=1 has empty zero locus and t=0, outside the nonunit endpoint hypotheses.

*Needs:* Layer 5 §5.4 primitive affine sieve pair; AdelicAlgebraicGroups §4.2; Layer 5 §5.4 subgroup reduction images; Layer 0 §0.10 finite-field polynomial counts; InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 and Layer 5 §5.4 uniform algebraic point counts; AnalyticNumberTheoryPartI §§0.21, 0.26 for the dimension product and lower bound for V.

**Fixed-modulus conditioning and walk remainders.** Under the algebraic hypotheses of local densities above, suppose the normalized symmetric operators P_(S,q) have every nonconstant eigenvalue at most 1−ε, uniformly over all squarefree q≥1 on their actual images H_q, for some 0<ε≤1. This includes squarefree q containing exceptional primes. The lazy operators then have nonconstant spectrum in [0,ρ], with ρ=1−ε/2∈[1/2,1). For any h∈H_q prove

`|#{w∈Ω_L:w mod q=h}−X_L/|H_q|| ≤ X_L ρ^L`.

Set τ=1+log ρ/log(2m)<1, so X_Lρ^L=X_L^τ, including L=0. Choose the exceptional modulus q₀ using the subgroup reduction-image theorem and local-density theorem, and let b be its squarefree radical (b=1 is allowed). Their CRT comparison gives H_(bd)=H_b×∏_(p|d)G(𝔽_p) for good squarefree d coprime to b. Assume (Γ,f) is primitive. Choose γ∈Γ with gcd(|f(γ)|,b)=1 by simultaneous primitivity and set c=γ mod b; if b=1 choose its unique class. Retain exactly the words reducing to c modulo b, with their original unit weights, and use main scale Y_L=X_L/|H_b|, not their actual cardinality. For d coprime to b put

`R_(d,c)=#{w∈Ω_L:w mod b=c, d divides f(w)}−β(d)Y_L`.

Prove, uniformly in L≥0 and good squarefree d≥1, that |R_(d,c)|≤C X_L^τ d^(dim G−1), with C depending only on the fixed data and b. In particular the retained mass is Y_L+R_(1,c), eventually at least Y_L/2; every retained word avoids every prime dividing b. No normalization of the restricted weights or replacement of Y_L by the exact count is made.

([BGS-10](#references), §3.3, p.583, (3.56)–(3.57), for walk equidistribution; §2.4, Proposition 2.1, p.572, for simultaneous primitivity and exceptional moduli.)

*Proof sketch.* On counting L²(H_q), self-adjointness and laziness give ‖T_q^L(δ₁−uniform)‖₂≤ρ^L, hence the pointwise estimate. For a subset B⊆H_(bd), Cauchy–Schwarz also gives error at most X_Lρ^L√|B|. Apply it to B={c}×{f=0 mod d}; CRT makes its uniform main term β(d)Y_L. If g=dim G, fixed-model point counts and CRT give |H_d|≪_a d^(g+a) for every fixed a>0, by absorbing a fixed factor per prime into d^a. As g≥3, choose a=g−2 to obtain √|B|≤√|H_d|≪d^(g−1), including d=1. The term at one records the conditioning error. Reduction from q₀ to b preserves the CRT comparison, and coprimality with b is precisely avoidance of all exceptional primes; no expansion for a subgroup extracted from Γ is invoked.

**Checks.**

- In the two-element quotient above, take b=2, c=s, f(1)=0 and f(s)=1. At L=0 the retained count is 0, Y₀=1/2 and R_(1,c)=−1/2; at L=1 these are 1, 1 and 0. The main scale need not be the actual count for small L.
- For m=2, ρ=1/2 and L=2, X_L=16, τ=1/2 and X_Lρ^L=4=X_L^τ. If |H_b|=2 the main scale is 8, not 16; the bound at d=1 is still 4.
- A value 2 fails c modulo b=6, as does 3; a value 5 survives since gcd(5,6)=1. Separate avoidance by values {2,3} cannot supply the required class at b=6.
- For S₃ and its three transpositions, m=3, P has eigenvalues 1,0,−1 and T has 1,1/2,0. At L=1 the three transpositions have mass 1 each and the identity mass 3, for total X₁=6; the two 3-cycles have mass 0. Multiplicities and a negative eigenvalue are both visible in this nonabelian example.

*Needs:* Layer 5 §5.4 affine walk sieve data, subgroup reduction images, primitive affine sieve pair and local densities for affine orbits; finite-dimensional self-adjoint spectral theory; AnalyticNumberTheoryPartI §3.26 for divisor-subpower absorption.

**Free-word affine sieve data.** Separately, for a chosen free Zariski-dense subgroup Γ₁ of rank k≥2, let Ω_L be its reduced words of length at most L and push counting mass to |f|. Use the actual growth scale X_L≍(2k−1)^L and its own reduction images, CRT densities and signed remainders, including any fixed primitive coset. The explicit free-tree bound below requires an independent estimate |R_d|≤C X_L^τ d^(dim G−1) with τ<1 for this population. Expansion for Γ is not a hypothesis supplying this estimate for Γ₁.

([BGS-10](#references), §3.1, pp.573–574; §3.3, (3.24)–(3.32), pp.577–579.)

The adapter preserves word multiplicities, counts each divisor preimage, and identifies the sifted sum with the rough-word count; its local densities multiply only on the stated CRT range.

**Checks.**

- The length-zero ball contains its identity word. In rank two the length-one ball has 1+4=5 words, whereas its exact-length-one lazy population has 8 labels.
- In rank two the length-two ball has 1+4+12=17 words; counting unreduced four-letter words would give 1+4+16=21.
- Two distinct words with the same absolute f-value contribute mass 2. If f=0 that mass is removed once any prime is sieved.

*Needs:* Layer 0 §0.2 weighted finite-family sieve; Layer 5 §5.4 subgroup reduction images and primitive affine sieve pair; the chosen subgroup's own mixing estimate as an explicit hypothesis.

**Affine sieve level from expansion.** For the original-group lazy population conditioned at (b,c), with Y_L=X_L/|H_b| and τ<1 as above, prove Σ_(d<D,d squarefree,(d,b)=1)|R_(d,c)|≤C′X_L^τ D^dim G for every D≥1. For every 0<δ<(1−τ)/dim G, D=X_L^δ gives remainder o(Y_L/(log X_L)^t) as L→∞, and hence an admissible power level for the positive lower sieve.

([BGS-10](#references), §3.3, (3.29)–(3.33), pp.578–580, for the level calculation, and (3.56)–(3.57), p.583, for the original-group population.)

*Proof sketch.* Sum the conditioned remainder estimate in d. Since b is fixed, the normalized error is O((log X_L)^t X_L^(τ+δ dim G−1)), which tends to zero by the strict δ margin. Empty local zero sets can be deleted without changing this bound. An ordinary squarefree gap supplies the required τ through the lazy population on Γ itself.

**Checks.**

- For dim G=3, τ=1/2 and δ=1/12, the exponent τ+3δ−1 is −1/4. At δ=1/6 it is 0 and gives no logarithmic saving, so that endpoint is excluded.
- At D=1 the strict sum is empty and equals 0; at D>1 the d=1 conditioning error is included.
- For X_L=16, |H_b|=2, τ=1/2 and D=2 the error majorant without C′ is 4·8=32, while Y_L=8. The theorem asserts asymptotic usefulness, not a positive small-L sieve count.

*Needs:* Layer 5 §5.4 fixed-modulus conditioning and walk remainders; Layer 5 §5.4 local densities for affine orbits.

**Escape from proper algebraic subvarieties.** Under the same squarefree expansion assumption on Γ and for every fixed proper algebraic subvariety W⊊G defined over ℚ, prove that the original lazy word count in W, and hence its (b,c)-conditioned subcount, is at most C_W X_L^(1−δ_W) for some δ_W>0 and C_W>0, uniformly in L≥0. In particular it is o(Y_L/(log X_L)^t).

([BGS-10](#references), Proposition 3.2 and the original-group walk argument, §3.3, pp.582–584.)

*Proof sketch.* Outside finitely many primes depending on W, its reduction has at most C_W p^(dim G−1) points, whereas |H_p| is at least a fixed positive multiple of p^dim G. The pointwise lazy mixing bound therefore gives count/X_L≤C_W(1/p+ρ^L p^(dim G−1)). Choose a good prime p comparable to ρ^(−L/dim G) by `Nat.exists_prime_lt_and_le_two_mul`, after L is large enough to exceed all exceptional primes; enlarge C_W for the finitely many remaining L. This gives δ_W=(1−τ)/dim G>0. Restricting to c only lowers the count and Y_L differs from X_L by the fixed factor |H_b|. The rational points of a proper subvariety over an extension field lie in a proper ℚ-defined subvariety: take a nonzero ℚ-linear coefficient component of a polynomial vanishing on it.

**Checks.**

- For dim G=3, ρ=1/2 and L=12, the balancing scale is 16 and Bertrand supplies p=17. The two terms are 1/17 and 17²/4096=289/4096; at the ideal balancing value 16 they are both 1/16.
- For W empty the actual count is 0 for every L. For W={1}, L=0 gives count 1, so C_W must cover small L; for W=G the count is X_L and no positive escape exponent is possible.
- With X_L=16 and |H_b|=2 a restricted count can be 0 while Y_L=8; restriction never increases the unconditioned count. As L grows, X_L^(−δ_W)(log X_L)^t tends to 0, whereas δ_W=0 would fail to beat the sieve count.

*Needs:* Layer 5 §5.4 fixed-modulus conditioning and walk remainders, subgroup reduction images and uniform algebraic point counts; Mathlib `Nat.exists_prime_lt_and_le_two_mul`.

**Affine sieve saturation with expansion.** For connected simply connected absolutely almost simple G/ℚ, finitely generated Zariski-dense Γ⊆G(ℚ)∩GL_n(ℤ), integral f nonzero and nonunit on G whose zero locus has t≥1 distinct geometric irreducible components, and primitive(Γ,f), uniform squarefree congruence expansion implies finite saturation number. Components need not be individually defined over ℚ; multiplicities in f are unrestricted. The same follows for integral orbit images under the source’s pullback/covering hypotheses.

All algebraic hypotheses; squarefree expansion; signed |f|; dominant orbit map for transfer.

([BGS-10](#references), Theorem 1.1, p.564; §3.3equations(3.41)–(3.51), pp.581–584.)

*Proof sketch.* Keep the original Γ and its fixed symmetric generating set. Choose b and c by the fixed-modulus conditioning theorem, retaining simultaneous avoidance at every exceptional prime; use its lazy walk population and main scale Y_L=X_L/|H_b|. Use the one-sided local-density bound, its upper dimension-t product condition and V(z)≥c(log z)^(−t), without assuming each component is rational. The positive lower sieve above 9t in §5.2 supplies ≫Y_L/(log X_L)^t words rough at z=X_L^(δ/s). For a lazy word of length L and matrix-entry bound C^(L+1), the polynomial-height bound is |f|≤K_f C^(d(L+1)), where d is the original degree and K_f is the sum of the absolute values of its coefficients. It converts roughness to a finite Ω bound, including repeated factors. The escape theorem excludes f=0 as well as every proper W, with count o(Y_L/(log X_L)^t); the remaining rough values are nonzero. Compare log|f|≤log K_f+d(L+1)log C with log z=(δ/s)L log(2m) to obtain a fixed finite Ω bound. Avoid asserting primality or a conjectured optimal saturation number.

*Needs:* Layer 5 §5.4 affine almost-prime locus and saturation; Layer 5 §5.4 affine walk sieve data and fixed-modulus conditioning and walk remainders; Layer 5 §5.4 local densities for affine orbits, including the upper dimension product and lower bound for V; Layer 5 §5.4 affine sieve level from expansion; Layer 5 §5.4 escape from proper algebraic subvarieties; Layer 5 §5.2 positive lower sieve above 9t.

**Explicit affine almost-prime bound.** Under the preceding algebraic and primitivity hypotheses, with t counting distinct geometric components regardless of their fields of definition, choose a free rank-k Zariski-dense subgroup, its primitive-coset adapter, word growth r=2k−1>1, matrix-entry height base C>1, and f of original polynomial degree d. Assume its own reduced-word population has the uniform remainder estimate with mixing exponent τ<1 specified in free-word affine sieve data, and its own power-saving escape bound. These inputs give every integer R strictly larger than 9t dim(G)d log C/[(1−τ)log r] as an admissible saturation bound after the source’s finite local modifications. Repeated factors leave t unchanged but contribute to d. Strict inequality permits the distribution and Brun endpoint losses.

Actual free-word growth and height estimate; non-sharp primitive-coset and expansion hypotheses.

([BGS-10](#references), Equation (3.51), p.581.)

*Proof sketch.* Apply the positive lower sieve above 9t of §5.2; choose δ<(1−τ)/dim G and s>9t close enough to their endpoints. Use the local-density theorem's strict local margin, upper dimension product and lower bound for V; logarithmic factors in summing the remainders are absorbed by the strict δ margin. Compare Ω≤log|f|/log z, retaining the original degree d, and let L grow. The constant and any finite bad-prime contribution must be tracked under the primitive coset reduction; a claimed endpoint ceiling without this work is not justified.

**Checks.**

- For t=2,dim G=3,d=2,τ=1/2 and C=r=3 the threshold is 216. Taking δ=333/2000<1/6 and s=1801/100>18 gives d s/δ=72040/333<217, so R=217 has a strict margin.
- Replacing f=a by a² on SL₂ leaves t=1 and changes d from 1 to 2; with the same other parameters the thresholds are 54 and 108. Counting only distinct factors in the height bound would lose this factor of two.
- For f=a²+b², K_f=2. An entry bound 3^(L+1) gives |f|≤2·3^(2(L+1)); at L=0 and the identity, the actual value is 1≤18. If k=1 then r=1 and log r=0, so the rank-one case is outside the r>1 hypotheses.

*Needs:* Layer 5 §5.4 free-word affine sieve data with its independent remainder and escape hypotheses; Layer 5 §5.4 local densities for affine orbits; Layer 5 §5.2 positive lower sieve above 9t; Layer 5 §5.1 from roughness to an almost-prime bound.

**Squarefree congruence expansion for SL₂.** For finitely generated Zariski-dense Γ≤SL₂(Z) and a finite symmetric generating set, the Cayley graphs Γ/Γ(q) over squarefree q form a uniform expander family, in the ordinary spectral-gap sense. The original-group lazy population converts this ordinary gap into the mixing estimate for SL₂ saturation, including conditioning at its fixed exceptional squarefree modulus.

Squarefree q; actual image quotient Γ/Γ(q); no claim for arbitrary prime powers or arbitrary G.

([BGS-10](#references), Theorem 1.2, p.565; proof §4, pp.584–615.)

*Proof sketch.* Use the squarefree-ring sum-product and noncommutative flattening targets of this subsection. Prove the flattening, representation-multiplicity and product-growth argument of BGS §4 with those inputs. Do not present the conditional finite mixing inequality as a proof of expansion.

*Needs:* Layer 5 §5.4 subgroup reduction images, Layer 5 §5.4 squarefree-ring sum-product and Layer 5 §5.4 noncommutative flattening; Layer 5 §5.4 squarefree-ring sum-product and noncommutative flattening; AdelicAlgebraicGroups §4.2; Layer 5 §5.4 subgroup reduction images.

### 5.5 Chen's weight, the Goldbach local factor and Chen's theorems

**Chen switching weight.** For N>1,z=N^(1/10) and 0<n<N, let a_N(n) indicate a representation n=p₁p₂p₃ with primes p₁<N^(1/3)≤p₂≤p₃. Put c_N(n)=1_(n z-rough)[1−ω_[z,N^(1/3))(n)/2−a_N(n)/2]. On squarefree n, c_N(n)≤1_(Ω(n)≤2). Non-squarefree mass must be estimated separately.

Strict n<N; full small-prime roughness, apart from fixed prime divisors of N that cannot divide N−p except finitely many primes.

([HB-SIEVES](#references), Sketch of Chen’s theorem, pp.47–48, equation (6.7).)

*Construction.* Count distinct small factors and distinguish the three-factor configuration with exactly one below N^(1/3). This is a weight inequality, not the analytical switched-sequence estimate.

The definition exposes the following operations and laws:

- The prime-factor triple indicator a_N.
- The explicit rough switching weight.
- For 0<n<N, c_N(n)≤1.
- On squarefree 0<n<N, c_N(n)≤1_(Ω(n)≤2).
- The weighted sum is bounded by the P₂ count plus the mass of nonsquarefree terms.

**Checks.**

- For N=1000, n=11 has weight 1.
- For N=1000,n=2·11·13, the small factor 2 and triple correction give weight 0.
- For N=1000,n=3, the rough single-prime weight is 1/2, not 1.
- For N=1000,n=3³=27 the weight is 1/2 even though Ω=3; the squarefree restriction is necessary.

*Needs:* Mathlib `Nat.primeFactors`; Mathlib `ArithmeticFunction.cardFactors`.

**Goldbach local factor.** Let C₂=∏_(p>2 prime)(1−1/(p−1)²) and C_N=C₂∏_(odd p|N)(p−1)/(p−2) for N>0; use C₀=0. The infinite product converges to a positive constant and each finite correction is≥1. It is the same factor in Chen’s two main estimates.

Natural N; odd primes in both products; the finite product uses distinct factors.

([CHEN-73-CN](#references), Theorem 1, p.112; Lemmas 7–9, pp.123–125.)

*Construction.* The sum of 1/(p−1)² converges and each factor is positive; invoke the convergent positive-product criterion. The finite correction depends on the radical, not Ω.

The definition exposes the following operations and laws:

- The displayed C_N including its zero convention.
- C_N>0 for N>0.
- Positive N,M with the same odd prime divisors have equal factors.
- C₂ at N=2 equals the universal odd-prime product.
- For odd prime p∤N, C_(Np)=C_N(p−1)/(p−2).

**Checks.**

- C_6=2C_2.
- C_10=(4/3)C_2.
- C_18=C_6; multiplicity does not add another local factor.
- C_0=0; the infinite-divisor convention is not used.

*Needs:* Mathlib `Nat.primeFactors`; Mathlib `Real.summable_one_div_nat_pow`; Mathlib `Summable.of_nonneg_of_le`; Mathlib `Real.multipliable_one_add_of_summable`; Mathlib `Real.summable_log_one_add_of_summable`.

**Chen switched triple upper bound.** For even N sufficiently large, set Q_N=∏_(2≤q<N^(1/4),q prime)q. Count ordered prime triples satisfying N^(1/10)<p₁≤N^(1/3)<p₂≤sqrt(N/p₁), p₂≤p₃≤N/(p₁p₂), and gcd(N−p₁p₂p₃,Q_N)=1. Their count T_N is≤3.9404 C_N N/log²N, with C_N the Goldbach local factor. Each triple has its ordering and multiplicity; this is an upper bound for the switched correction, not ordinary BV.

Even N above an absolute threshold; strict/inclusive cutoffs as displayed; all three entries prime; all primes dividing N retained in the local factor.

([CHEN-73-CN](#references), Definition of Ω, p.116; Lemmas 5–7, pp.117–124; Lemma 8 and equations (23)–(24), pp.124–125.)

*Proof sketch.* Use the explicit Selberg coefficients supported on d≤N^(1/4−ε/2), replace the p₃ sum by a smoothed von Mangoldt sum, and separate principal and primitive character contributions (original equations (5)–(11)). Lemma 6 bounds the nonprincipal M₂ by O(N/(log N)^2.01), not O(N/(log N)^20). Its contour/zero-free and fourth-moment arguments remain the analytic proof target; this o(N/log²N) bound is sufficient for the final constant. Partial summation reduces the principal sum to ∫_(1/10)^(1/3) log(2−3α)/(α(1−α))dα. Certify the rational/logarithmic upper envelope of equation (24), pp.124–125, below 0.49255; multiplying by 8 leaves room for the stated 3.9404 bound.

An independent rational-log interval calculation bounds the equation (24) envelope by 0.492463256408<0.49255. Its exact formula is recorded in the worked example below; Prove the displayed rational/logarithmic bound by exact interval estimates.

*Needs:* Layer 5 §5.5 goldbach local factor; Layer 1 §1.3 selberg optimal weights; Layer 2 `SieveCharacters.primitive_largeSieve`; AnalyticNumberTheoryPartI §0.32; Layer 3 §3.0 maximal small-conductor estimates.

**Chen primes with an almost-prime shift.** Prove `SieveWeighted.chen_prime_shift`. For each fixed positive even h there are c_h>0,x_h such that for x≥x_h, #{p≤x:p prime,1≤Ω(p+h)≤2}≥c_hx/log²x. Thus there are infinitely many such primes.

Fixed h>0 even; threshold and constant may depend on h.

([CHEN-73-CN](#references), Theorem 2, p.112.)

*Proof sketch.* Repeat the original switched argument for p+h with its h-dependent local factors; do not infer the shifted theorem merely from Goldbach.

*Needs:* Layer 5 §5.5 chen switched triple upper bound; Layer 5 §5.5 chen switching weight; Layer 3 §3.4 weighted prime-distribution transfer.

**Chen original-family lower estimate.** Let P_N(z) count primes p≤N for which q∤N−p for every prime 3≤q<z. Let P_N(q,z) count those same primes additionally satisfying q|N−p. For even N sufficiently large, at z=N^(1/10), P_N(z)−(1/2)Σ_(z<q≤N^(1/3),q prime)P_N(q,z)≥2.6408 C_N N/log²N. The finite exceptional primes dividing N and endpoint equalities are estimated separately in the final conversion.

N even and above an absolute threshold; cutoffs exactly as stated; q=2 omitted from the original-family sieve.

([CHEN-73-CN](#references), Lemma 9, pp.125–127, equations (25)–(27).)

*Proof sketch.* Apply Richert 1969 TheoremA and its uniform progression estimates at the displayed levels N^(1/2−ε) and N^(1/2−ε)/q. Theorem A and its proof are a proof requirement at that locator. Use the delay functions through f(5), the exact integral in equations (26)–(27), and the logarithm bounds. The expression in (27) is approximately−0.0164726270754, so the printed lower endpoint−0.0164725 is false. Replace it by−0.0164727. Exact rational log intervals still give a final lower margin greater than 2.6408077, hence 2.6408. Prove the displayed bound by exact rational log intervals.

*Needs:* Layer 5 §5.5 goldbach local factor; Layer 5 §5.2 rosser–iwaniec linear sieve; Layer 3 §3.4 weighted prime-distribution transfer.

**Chen’s Goldbach theorem.** Prove `SieveWeighted.chen_goldbach`. There are absolute c>0,N₀ such that every even N≥N₀ has at least cN/log²N representations N=p+m with p prime and 1≤Ω(m)≤2. A singular-factor refinement multiplies the bound by ∏_(odd p|N)(p−1)/(p−2); the absolute-c headline does not prescribe the numerical constant 0.67 in Chen’s normalization.

Even sufficiently large N; Ω counts multiplicity, so prime squares are allowed.

([CHEN-73-CN](#references), Theorem 1, p.112; HB Chen’s theorem, p.46.)

*Proof sketch.* Original equation (28), p.128 bounds the desired count below by the original weighted prime count minus T_N/2 minus N^0.91, after accounting for square and endpoint exceptions. Insert Lemmas 8–9: 2.6408−3.9404/2=0.6706. Use the 0.0006 margin to absorb N^0.91 and any finite exceptions; C_N≥C₂>0 gives the weaker absolute-c theorem.

*Needs:* Layer 5 §5.5 chen switching weight; Layer 5 §5.5 chen switched triple upper bound; Layer 1 `SieveSelberg.selberg_upper_bound`; Layer 5 §5.5 chen original-family lower estimate.

### 5.6 ideal residue symbols, joint spins and their oscillation

**Quadratic ideal residue symbol adapter.** For a number field K, an element α∈O_K and nonzero ideal a of odd absolute norm, define (α/a) as the product over prime-ideal factors p^e of quadraticChar(O_K/p)(α modp)^e. At the unit ideal the empty product is 1. Extend by 0 at the zero ideal and at even-norm ideals. This is an adapter of native finite-field characters and ideal factorization, not a competing finite-field character or Hilbert symbol. For a nonzero odd element β write (α/β)=(α/(β)).

Odd means coprime to 2, equivalently odd positive absolute norm; ideal factors include multiplicity.

([FIMR-13](#references), §2, pp.5–6, ideal quadratic symbol definition; Lemma 2.1, p.6.)

*Construction.* Use unique factorization of nonzero ideals and native finite prime-ideal quotient fields. Multiply the native quadratic characters with their ideal valuations. The zero/even extension is outside the source’s odd-denominator domain.

The definition exposes the following operations and laws:

- The unit-ideal denominator gives 1 for every numerator, including 0.
- The zero ideal has value 0 by the explicit out-of-domain convention.
- For positive odd-norm ideals a,b, (α/ab)=(α/a)(α/b), without a coprimality requirement on a,b.
- For an odd nonzero ideal a, (αβ/a)=(α/a)(β/a).
- If α−β∈a then (α/a)=(β/a), for a nonzero odd ideal.
- For nonzero odd a, the symbol vanishes exactly when (α)+a is a proper ideal.
- Multiplying α by a square unit preserves the symbol.
- Over Q, the symbol for the ideal(n), n positive odd, agrees with jacobiSym(α,n) for integer α.

**Checks.**

- For K=Q, (0/O_K)=1; the empty denominator product is not 0.
- For K=Q, (2/(5))=−1.
- For K=Q, (4/(5))=1.
- For K=Q, (15/(5))=0.
- For K=Q, every symbol with denominator ideal (2) is 0 by the explicit even-norm extension; the odd-denominator reciprocity theorem makes no assertion about it.
- For any degree-two number field K/Q, (2/(5O_K))=1, although the rational Legendre symbol (2/5)=−1. A rational ideal denominator is not a rational-prime denominator.

A repeated prime-ideal factor squares its character; taking only the radical would change values.

*Needs:* Mathlib `quadraticChar`; Mathlib `Ideal.absNorm`; Mathlib `Ideal.uniqueFactorizationMonoid`; Mathlib `Ideal.Quotient.field`.

**Ideal-symbol reciprocity adapter.** For any number field K and nonzero coprime odd integral elements α,β, prove

`(α/(β)) (β/(α)) = ∏_(v|2∞) (α,β)_v`.

The ideal symbols on the left are the adapter above; the symbols on the right are the classical Hilbert symbols of QuadraticFormInvariants §6C. Identify an odd finite-place symbol with `(β/p)^v_p(α)` when p divides (α), with `(α/p)^v_p(β)` when p divides (β), and with 1 when both are local units. There are finitely many nontrivial local factors. Coprimality makes these the only odd-prime cases. The cohomological product formula and the classical comparison then give the displayed exchange identity; dyadic and real-place factors are retained.

([FIMR-13](#references), §2, Lemma 2.1; QuadraticFormInvariants §6C; ClassFieldTheory Layer 14.)

**Checks.**

- Over ℚ, α=3,β=7 gives (3/7)(7/3)=−1; the dyadic Hilbert symbol is −1 and the real one is 1.
- Over ℚ, α=−1,β=−1 gives left side 1; the dyadic and real symbols are both −1, whose product is 1.
- Over ℚ, α=3,β=3 is excluded by coprimality: the ideal-symbol product is 0, while every Hilbert-symbol product is ±1.

*Needs:* The quadratic ideal-symbol adapter; QuadraticFormInvariants §6C classical/cohomological comparison, finite support and local computations; ClassFieldTheory Layer 14 cohomological product formula.

**Ideal divisor and logarithmic coefficient bounds.** For each fixed number field K, write τ_K(a) for the native ideal divisor count described in Exact supplier contracts, evaluated on a nonzero integral ideal a and use the native ideal von Mangoldt coefficient Λ_K with its logarithmic bound from the supplier contract. Prove that for every ε>0 there is C_(K,ε)>0 with τ_K(a)≤C_(K,ε)(Na)^ε. For fixed nonnegative integers j,k and ε>0, prove

`Σ_(0≠a, Na≤X) τ_K(a)^k (1+log Na)^j ≤ C_(K,j,k,ε) X^(1+ε)` for X≥1.

These bounds supply precisely the Λ_K and τ_K coefficient absorption in the Type II conversion; no optimal logarithmic moment is asserted.

([FIMR-13](#references), §5, Propositions 5.1–5.2 and coefficient hypotheses; [KM-21](#references), §2.6.)

*Proof sketch.* At each rational prime there are at most [K:ℚ] prime ideals. Bound τ_K(a) by a fixed power of τ(Na), apply AnalyticNumberTheoryPartI §3.26 with a divided ε, and sum by the norm-fibre divisor majorant of AnalyticNumberTheoryPartI §§3.3–3.4, with another divided ε. Absorb each fixed power of 1+log Na with another divided ε. Define neither the zero-ideal divisor finset nor log of norm zero in these estimates.

**Checks.**

- Over ℚ the unit ideal has τ=1 and Λ=log 1=0; j=0,k=2,X=1 gives moment 1.
- Over ℚ the ideal (4) has τ=3 and Λ=log 2≤log 4; removing repeated prime factors would incorrectly give τ=2.
- Over ℚ, j=0,k=2,X=4 gives 1²+2²+2²+3²=18. The zero ideal is excluded from every sum.

*Needs:* ArithmeticDirichletSeries Layers 1–2 norm fibres and convolution; Tau Ceti `TauCeti.IdealArithmeticFunction.norm_vonMangoldt_le_log`; AnalyticNumberTheoryPartI §§3.3–3.4 norm-fibre divisor majorant and §3.26 divisor subpower.

**FIMR sieve conversion to prime ideals.** Let |a_a|≤1 on nonzero integral ideals of a fixed number field. Suppose every ideal-divisibility sum A_d(X) is O_ε(X^(1−ϑ+ε)), uniformly in d, and the ideal bilinear sums with |v_m|≤Λ(m),|w_n|≤τ(n) are O_ε((M+N)^θ(MN)^(1−θ+ε)), where 0<ϑ,θ<1. Then Σ_(Na≤X)a_aΛ(a)=O_ε(X^(1−ϑθ/(2+θ)+ε)). Removing prime powers yields the same power saving for the unweighted prime sum, after partial summation.

Uniform TypeI; divisor/logarithmic coefficient norms; the owned ideal divisor and logarithmic coefficient bounds above; X≥2.

([FIMR-13](#references), Propositions 5.1–5.2, pp.21–24.)

*Proof sketch.* Proposition 5.1 uses the exact ideal von Mangoldt convolution identity, the hyperbola separation kernel and a cutoff y with z=X/y≥y. In the dyadic decomposition use M≤z and N≤2z (or both≤2z), with MN≤2X. The last dyadic block may exceed z when y=z; the factor 2 only changes absolute constants. Choose y=X^(ϑ/(2+θ)); control smaller S(z) iteratively. The integrable separation kernel uses DFI-1997, Lemma 9, cited by its theorem locator. Divisor/logarithmic coefficient bounds in KM follow from bounded TypeII after absorbing their growth into ε; keep these bounds visible.

*Needs:* Layer 5 §5.6 ideal divisor and logarithmic coefficient bounds; ArithmeticDirichletSeries Layer 1 norm fibres and Mathlib `LSeries`; the stated uniform Type I and coefficient-weighted Type II hypotheses. This generic conversion is independent of the supplied joint-spin construction.

**Equidistribution of joint spin signs.** For totally real Galois K/Q with the positive-unit square property, admissible nonempty S={σ₁,…,σ_t}, and C_tn, each sign vector e∈{±1}^t has asymptotic proportion 2^(−t) among principal prime ideals of norm≤X as X→∞.

Real field; principal prime denominator; no inverse pairs; short-character hypothesis.

([KM-21](#references), Theorem 2, p.2; proof in §2.6, pp.7–8.)

*Proof sketch.* Expand the sign indicator into the finite Fourier sum over subsets of S. Apply ArithmeticStatisticsPartV §3.30 to each nonempty subset using the explicit transferred short-character bound. Remove the finitely many ramified/bad primes and the O(sqrt X) higher-residue-degree primes where spin vanishes. Import the prime ideal theorem in the principal class to normalize.

*Needs:* ArithmeticStatisticsPartV §3.30 conditional joint-spin prime bound; Layer 5 §5.3 short character input for joint spins; ArithmeticDirichletSeries Layer 1 norm fibres and Mathlib `LSeries`; Chebotarev Layer 13 ϑ_c and π_c.

### Analytic and native-interface requirements

Construct Iwaniec's normalized general-κ functions and constants, proving existence, uniqueness, delay equations and normalization at infinity. For Richert certify integral positivity and optimization with α=γ/4, β=γ/(1+3^(−r)), a strict margin and a square-divisor exceptional mass before concluding a bound on Ω.

For Chen prove the original-family lower bound 2.6408 C_N N/log²N and ordered switched-triple upper bound 3.9404 C_N N/log²N. Retain Lemma 3's fourth moment (statement p.114, proof p.115), switched discrepancies, certified integral estimates and Lemma 6 error N/log^(2.01)N. Lemma 9 uses RICHERT-1969, Theorem A, cited by its theorem locator. Keep 0.6706−0.67 when absorbing the N^0.91 exception; a switched complement need not be prime. For each even h>0 reconstruct the shifted family, local factors and switching estimates with h-dependent constants.

The ideal-symbol comparison and the generic ideal coefficient/prime-extraction interfaces have their stated hypotheses. Spin-sign moments use ArithmeticStatisticsPartV §3.30 with ArithmeticStatisticsPartV §3.30 conditional joint-spin prime bound; each nonempty subset retains C_(|T|n) through §5.3. The imported chain keeps its sliced-lattice and codimension-two exceptional estimates, uniformity in all nonzero ideals, and dyadic/infinite-place reciprocity factors.

For affine sieves supply native subgroup, reduction-image, labelled-walk orbit and CRT density comparisons, identifying relative polynomial density with rational Zariski closure. The general endpoint uses original-group lazy walks, the fixed squarefree modulus b, a simultaneously primitive class c, main scale X_L/|H_b| and its signed remainder at one. Reconstruct SL₂ squarefree expansion from sum-product/flattening and convert its ordinary gap to lazy mixing. Prove conditioned remainders and effective power-saving escape for that same population. The separate free-tree bound retains its chosen subgroup’s independent mixing and escape inputs, primitive-coset reduction, heights, growth r=2k−1 and strict saturation margin.

### Examples

Multiplicity gives 1 at-most-zero-almost-prime, 25 a P₂, 8 not a P₂ and zero excluded. Richert can leave positive weight at 8, so the square exception is necessary. Chen at N=1000 gives weights one at 11, zero at 2·11·13 and 1/2 at 3 and 27; the last tests squarefreeness.

Certify Chen's logs by setting t=(r−1)/(r+1), r≥1, summing 2Σ_(j=0)^199 t^(2j+1)/(2j+1), and using remainder ≤2t^401/[401(1−t²)]. For equation (24), sum over i=0,…,6, with a=(16−i)/10,

~~~text
(log a+(4+i)/(16−i)) log((108+23i−i²)/(78+23i−i²))
  −(3/a) log((27−i)/(26−i)).
~~~

The upper rational endpoint is <0.49255, with value about 0.49246325640747. Put V=1/2+(3/4)log(9/8)−(3/2)log(4/3)−(1/4)log 2. Then −0.0164727<V<−0.0164725 and 8(log 4−(1/2)log 8+V)>2.6408. The corrected safe endpoint preserves the margin. These rational checks do not replace the analytic integral reductions.

C₆=2C₂,C₁₀=(4/3)C₂ and C₁₈=C₆ test distinct Goldbach corrections. Over ℚ, ideal symbols give (0/𝒪)=1,(2/(5))=−1,(4/(5))=1,(15/(5))=0; in degree two (2/(5𝒪_K))=1, so rational ideal and rational prime denominators differ.

In a cyclic cubic group S={σ} is permitted but S={σ,σ²} is not; identity and involutions are excluded. Odd rational m>1 has individual spin zero, unit squares preserve spin, and ψ=0 makes every joint coefficient zero.

Affine values {2,3} have gcd one but fail simultaneous avoidance at modulus six. The empty orbit is not primitive. The r=2 locus includes −6 and excludes 8, every locus excludes zero, and r=0 includes ±1. The length-zero lazy population has its identity word; at m=2,L=1 its two identity labels give mass 2, and all collisions retain word multiplicity. The separate rank-two free-word ball has 5 words at length at most one.

### Dependencies

Layers 0, 1, 2 and 3. External inputs: Layer 5 §5.4 squarefree-ring sum-product and noncommutative flattening; AdelicAlgebraicGroups §4.2; Layer 5 §5.4 subgroup reduction images; AnalyticNumberTheoryPartI §0.32; ArithmeticStatisticsPartV §3.30; ArithmeticStatisticsPartV §3.30 conditional joint-spin prime bound; Layer 3 §3.0 maximal small-conductor estimates; Layer 5 §5.3 conjecture Cₘ; Layer 0 §0.10 finite-field polynomial counts; InverseGaloisAndArithmeticFundamentalGroups §IG.2.5 and Layer 5 §5.4 uniform algebraic point counts; GeometryOfNumbersAndQuadraticArithmetic §4.1; Layer 0 §0.11 translated lattice discrepancies; ArithmeticDirichletSeries Layer 1 norm fibres and Mathlib `LSeries`; Chebotarev Layer 13 ϑ_c and π_c; ClassFieldTheory Layer 14; QuadraticFormInvariants §6C; Layer 5 §5.6 ideal-symbol reciprocity adapter; GlobalNumberFields Layer 3 geometry of numbers and ray class ideal counting.

## Downstream consumers



Maynard clusters feed quantitative prime-pattern applications. The binary and conic branches supply the sieve estimates used in Khayutin's CM-point analysis. Polynomial-vector and Farey bounds support the random-polynomial arguments of Bary-Soroker–Koukoulopoulos–Kozma. Prime quadratic-symbol estimates support Bennett–Siksek, Skorobogatov–Sofos, Smith and Koymans–Pagano. The ideal-spin branch supplies Koymans–Milovic joint-spin distributions under the stated short-character input; it leaves subsequent arithmetic or equidistribution arguments to their respective roadmaps. The affine branch supplies saturation after the subgroup, local-density, absolute-mixing and escape inputs have been established.

## Source-sensitive conventions

The following conventions fix the mathematical statements at the cited versions. They record the correction needed by a formula or proof step; they make no claim about another edition.

**HB-SIEVES, arXiv v1 p.1, introductory question (i).** The binary Goldbach conjecture concerns even n>=4. Two primes are both at least 2, so their sum is at least 4; n=2 is a counterexample to the printed range.

**HB-SIEVES, arXiv v1 p.2, Example 1; related divisor-count equality on p.4.** For sqrt(x)<z<=x and positive integer samples, S=1+pi(x)-#{p prime:p<z}. Equivalently add 1 plus the indicator that z is prime to the printed expression. On p.4 use `#divisors(Pi)=2^{#{p<z}}<=2^{pi(z)};` the final error upper bound is unchanged. The unit survives every prime sieve, and a prime equal to z also survives the strict cutoff. For x=10,z=5 the survivors are 1,5,7, whereas pi(10)-pi(5)=1. At z=5 the prime product is 6 and has four divisors, not `2^{pi(5)}=8.`

**HB-SIEVES, arXiv v1 pp.2-3, Example 2 image set and the next page's first counting equality.** If A is the literal image set of n(2N-n), do not replace its cardinality by the number of parameters n. To retain the printed residue-class computation with X=2N, use an indexed multiset, or attach to each image value its number of preimages as its weight. State the corresponding sifted output as an indexed count. For 2N=10 and d=1 the image is {16,21,24,25}, of size 4, while the parameters 2<=n<=8 number 7. In general the image has N-1 distinct values, rather than 2N-3 parameters; choosing X=2N therefore cannot give the asserted bounded R_1 for the literal image set.

**HB-SIEVES, arXiv v1 p.2, Example 2 displayed prime-pair count; distinct from the image-multiplicity convention above.** The prime-pair interpretation requires both p>=sqrt(2N) and 2N-p>=sqrt(2N), as well as a choice between ordered parameter counting and distinct image values. For a literal image set one may count the prime p<=N with the corresponding two-sided cutoff. With 2N=10, p=7 satisfies the printed conditions and has prime complement 3, but the product 21 is removed by the sieving prime 3<sqrt(10). The literal sifted image is {25}, while the printed prime set is {5,7}.

**HB-SIEVES, arXiv v1 p.2, Example 3 primitive sum-of-two-squares interpretation.** For positive n the primitive integer sum-of-two-squares criterion needs 4 not dividing n in addition to absence of prime divisors congruent to 3 modulo 4. Specify nonnegative/integer coordinates permitting zero if the unit is included. For x>4, n=4 has no prime divisor congruent to 3 modulo 4 and survives, but the only integer representations have coordinates (±2,0) or (0,±2), with gcd 2. Removing the word primitive would not fix the equivalence: 9 is a nonprimitive sum of two squares and does not survive.

**HB-SIEVES, arXiv v1 p.4, Corollary 1.2 and its immediately preceding asymptotic argument.** State the asymptotic along x→infinity and z=z(x)→infinity with z<=log x. At fixed z retain the exact finite Euler product, not its Mertens asymptotic. The relative O(1/log z) error in the preceding display tends to zero only if z grows. For fixed z in (2,3), the sifted density is always 1/2, while `e^{-gamma}/log` z varies with z; the stated range alone cannot imply all these asymptotics.

**KED-ANT-11, §11.5, proof of Theorem 11.11 invoking Theorem 11.9.** Supply a version of the sieve estimate valid for the two-residue setup, or verify its missing cutoff hypothesis before applying it. The proof as written checks the remainder bound but does not establish #A_d=0 for d>Cx with a fixed C. No claim is made that Brun's upper bound is false. For residue classes 0,-2, membership means d divides n(n+2), not d divides n; n<=x yields only the immediate quadratic cutoff d<=x(x+2). At x=33,z=11,n=33, d=1155=3*5*7*11 is an allowed squarefree divisor and A_d is nonempty despite d>x. This illustrates why the usual linear cutoff for divisibility samples cannot simply be imported; it is not asserted to disprove every possible fixed C.

**KED-ANT-11, §11.5, proof of Theorem 11.11 between (11.5.1) and the asserted sieve estimate.** Invoke the stronger precise estimate `sum_{p<=z}(log` p)/p=log z+O(1), or another result giving the coefficient 1 with bounded additive error, to obtain (11.4.1) with kappa=2 for omega(p)=2. A merely unspecified O(log z) bound is insufficient for that particular value of kappa. Multiplying an O(log z) estimate by 2 does not fix its leading constant or bound the excess over 2 log z. The stronger standard estimate repairs this step; the displayed inference requires the stronger prime-sum estimate with leading constant one.

**BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.402, coefficient choice immediately after equation (4).** Use `ξᵢ=(f,φᵢ)/(Σ_{j=1}^R` |(φᵢ,φⱼ)|), with i fixed and first powers of the moduli. For zero rows take ξᵢ=0 and omit their zero numerator terms. In Mathlib's opposite inner-product convention the numerator is ⟨φᵢ,f⟩. Equation (4) has row weight rᵢ=Σⱼ|(φᵢ,φⱼ)|, so the substitution needs that same denominator to combine the linear and quadratic terms into −|(f,φᵢ)|²/rᵢ. In the real singleton f=1,φ₁=2, the printed denominator is 16 and coefficient 1/8 gives defect 9/16, whereas the required denominator 4 and coefficient 1/2 give defect zero and the asserted sharp identity. This is a correction of the displayed proof choice, not a counterexample to Proposition 1.

**BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.403, display immediately after the definition of K_M.** The signed inner product equals the real kernel difference divided by L. Its modulus equals `|K_{L+N}(x_j−x_i)−K_N(x_j−x_i)|/L;` the absolute value of the difference is missing from the printed right side. Take N=L=1 and phase difference 1/2. K_2(1/2)=0 and K_1(1/2)=1, so the printed right side is −1 while the inner-product modulus is 1. Both kernels lie in [0,1/sin²(πt)], so their absolute difference still obeys the source's subsequent bound; the main theorem is not refuted.

**BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.404, opening definition of I_m and the immediately following assertion that the bins cover all points.** For the off-diagonal points take all m≥1 whose radial bin intersects [0,1/2], retaining the final partial bin and any point at distance exactly 1/2. Equivalently intersect each bin [mδ,(m+1)δ) with [0,1/2] instead of requiring its upper endpoint to be at most 1/2. Prove the at-most-two assertion with the two oriented half-circles and count the antipodal point only once. For δ=3/10 and the two points 0 and 2/5 modulo one, separation holds. The distance 2/5 lies in the m=1 bin, but its upper endpoint is 3/5>1/2, so that bin is excluded as printed. No permitted bin contains this point. The same restriction also omits the half-circle endpoint when a bin ends at 1/2. This is a boundary omission in the proof, not a counterexample to the desired cosecant sum; the corrected packing argument remains an explicit obligation.

**KED-ANT-16, §16.1, display (16.1.2), and §16.3, proof of Theorem 16.7.** Use the quantified integer m in (16.1.2); index the exponential sum by n consistently; the smooth-number asymptotic has some positive constant c as N grows, rather than some N. The first two displayed formulas use a different free dummy name from the one quantified. In the third phrase N is the asymptotic variable already fixed by the argument, while c is the unspecified constant. These are local notation slips; the intended statements are identifiable.

**KED-ANT-16, §16.3, Definition 16.3, Theorem 16.4 and Lemma 16.5.** Before applying the local energy lemma, replace the coefficients by b_n=a_n on the surviving residue classes and zero elsewhere. Define S from b. State h(p)=0 for primes outside P, or restrict the denominator sum to squarefree products of primes in P. For Theorem 16.4 use S_b(0)=Z and Σ|b_n|²≤Σ|a_n|²; for the indicator specialization Σ|b_n|²=Z. As written Definition 16.3 allows nonzero coefficients on excluded classes. Take P={2}, Ω₂={0}, a₁=a₂=1, all other coefficients zero. Then h(2)=1 and S(0)=2, while S(1/2)=0, so the displayed lemma asserts 4≤0. The exercise hint’s removal of excluded classes changes S(0); it is valid only after the coefficients and target have been adjusted. Theorem 16.4 itself is not refuted by this example.

**KED-ANT-16, §16.3, proof of Theorem 16.4.** Invoke the additive reduced-residue bound Theorem 16.1 when summing the corrected Lemma 16.5 over q. Lemma 16.5 provides a lower bound for reduced additive exponential-sum energies. Theorem 16.2 bounds a different sum over primitive multiplicative characters; its proof compares the multiplicative sum below the additive one, which is the wrong direction for inferring the needed additive upper bound. Theorem 16.1 gives that upper bound directly.

**KED-ANT-16, §16.3, proof of Lemma 16.5, Chinese-remainder display.** The phase is a₁/q₁+a₂/q₂, with q₁ and q₂ coprime divisors of squarefree q. The map to the numerator modulo q is a₁q₂+a₂q₁ and is a bijection on reduced residues. The braces place the second fraction inside the first denominator. At q₁=2,q₂=3,a₁=a₂=1 the printed phase is 3/7 instead of 5/6. It does not have the required denominator q=6 or define the stated CRT reindexing.

**KED-ANT-16, §16.3, proof of Theorem 16.7, the density of the sieved classes.** The ratio (p−1)/(p+1) tends to 1, so its asymptotic equivalent is 1. The earlier density ω(p)/p tends to 1/2. Subtracting 1 gives −2/(p+1), which tends to zero. The bound h(p)≥1/3 used in the subsequent argument is unaffected for odd primes.

**KED-ANT-16, §16.3, proof of Theorem 16.7, final lower bound for smooth integers.** Choose an integer k, for instance after decreasing ε to a reciprocal integer, and control the number of representations of each smooth integer. Insert a proved multiplicity factor in the lower bound. Supply the positive-density estimate with its dependence on ε. The distinct-smooth-integer count supplies the positive-density input to Linnik’s theorem. The displayed sum counts ordered prime tuples and can count one integer several times. With ε=1/2, N=100000, k=2, and the exact strict window p⁴>N and p²<N, the printed sum is 36745 while the number of integers up to N with all prime divisors at most √N is 35819. Direct integer sieving reproduces the false inequality. At N=1000000 the two values are 387659 and 344299. Also ε⁻¹ is not an integer for arbitrary ε, so it cannot serve as an unrestricted tuple length.

**KED-ANT-16, §16.3, Definition 16.6.** Restrict the definition to odd primes, or state a separate convention and treatment for p=2. The least positive nonsquare residue exists for each odd prime. Every element of ZMod 2 is a square: 0=0² and 1=1². Hence no positive integer is a quadratic nonresidue modulo 2 under the literal nonsquare-residue definition. The finitely many exceptional primes can be treated separately in the counting theorem.

**KED-ANT-18, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2).** Retain the x^(1/2) factor supplied by Lemma 18.2, and write the coefficient norms consistently as |f|₂, |g|₂. Lemma 18.2 contributes x^(1/2)Δ^3rτ(s)|f|₂. Cauchy–Schwarz bounds the g sum by y^(1/2)|g|₂. Their product contains (xy)^(1/2); the displayed small-r line omits the x factor. The final theorem does contain the expected Δ(xy)^(1/2).

**KED-ANT-18, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates.** Supply a sharper summation argument or retain the logarithmic loss from the stated block bounds; the displayed estimates alone do not imply the quoted uniform bound. Take R=1, Q=t=2^k, x=t^4, y=1. Each displayed block upper-bound expression P^(-1)√(4P²+x)√(4P²+y) is at least 2t² for P=1,2,…,t/2. Their sum is at least 2kt², whereas the claimed aggregate expression is t+2t²+1. No absolute constant compares these as k grows. This challenges the inference from the printed estimates, not the actual character sum or classical theorem.

**KED-ANT-18, §18.2, boundary explanation following (18.2.2).** The omitted small-number part includes n≤x^(1/5), including a prime-power endpoint. For x=32 the cutoff is 2. At n=2 the incomplete-log convolution is zero but Λ(2)=log 2. The discrepancy boundary must include this endpoint. The stated order-of-magnitude error can still absorb it.

**KED-ANT-18, §18.2, multiplicative partition parameter after (18.2.3).** At minimum the lower bound must be changed to permit 0<δ≤1 for x>1; the expected small negative power and all needed lower-range constraints require a fresh proof. For x>1 the printed interval is empty. The later choice δ=Δ^(1/2) is at most one and cannot satisfy its lower bound. The lower-range exponent remains a proof requirement.

**KED-ANT-18, §18.2, multiplicative partition and rectangles after (18.2.3).** Specify the actual covered interval and count, the rectangle selection below the hyperbola and every boundary strip. A partition of [1,x] into consecutive multiplicative intervals generally needs a log x factor. After k consecutive intervals of ratio 1+δ starting at 1, the endpoint is (1+δ)^k, so reaching x requires k≥log x/log(1+δ). Moreover the printed boxes have ℓ>L and m>M with LM=x, hence ℓm>x throughout: they cannot cover terms with ℓm≤x. The original proof may intend a different restricted interval and selection, but it must be stated and justified.

**KED-ANT-18, §18.2, display defining D(L,M;N,m).** Use a distinct residue a and product congruence ℓm≡a mod N; include λ(ℓ)μ(m) in the reduced-residue average, with the same two interval restrictions. The source display repeats m as residue and summation variable and leaves the second sum without a summand. Definition 18.1 applied to the finite bilinear coefficients determines the corrected expression.

**KED-ANT-18, §18.2, last aggregate bound and substitution δ=Δ^(1/2).** Re-establish the aggregate bound. The expression (δ+δ^(-1)Δ)x(log x)^3 would balance at the stated choice, but this is only a candidate correction until the preceding rectangle argument is supplied. Substitution in the printed expression yields (Δ^(-1/2)x+Δ)x(log x)^3, not Δ^(1/2)x(log x)^3. For x≥1 and 0<Δ≤1 their ratio is at least x/Δ, unbounded. This is an invalid proof step, not a counterexample to Bombieri–Vinogradov.

**KED-ANT-18, §18.3, Theorem 18.5 display.** Replace the free residue m by the bound variable a in the summand and read |f|² as the squared ℓ² norm consistently with Definition 18.1/Lemma 18.2. The sum binds a while its summand uses a different free variable m. A variance over residue classes must evaluate the discrepancy at the residue being summed. Only this syntactic correction is asserted; the theorem's proof remains an explicit exercise target.

**MAYNARD-2015, Proof of Proposition 4.2, display (4.4), p. 389 (arXiv v3 p. 6)** The sum runs over m: `Σ_{m=1}^{k}` `J_k^{(m)}(F₁).` The summation index j does not occur in the summand, while m is free. Proposition 4.1, which (4.4) applies, has `Σ_{m=1}^{k}` `J_k^{(m)}(F).`

**MAYNARD-2015, Proof of Lemma 5.1, display (5.8), p. 393 (arXiv v3 p. 9)** The left side of (5.8) is `λ_{d₁,…,d_k}/∏_{i=1}^{k}` μ(d_i)d_i, with the Möbius function μ; no functions μ_i are defined. The step `Σ_{d_i|r_i|e_i}` μ(r_i) = μ(d_i)[e_i = d_i] produces μ(d_i).

**MAYNARD-2015, Proof of Theorem 1.1, p. 391 (arXiv v3 p. 7)** 'less than k' should be 'at most k': no element, being a prime greater than k, is divisible by any prime p ≤ k. As printed, the argument does not cover p = k when k is prime: k elements can meet all k classes mod k. For k = 5 the set {7, 11, 13, 17, 19} misses 0 mod 5 only because no element is divisible by 5, which is the case the printed wording omits. The conclusion is true.

**MAYNARD-2015, §7, sentence before (7.10), p. 407 (arXiv v3 p. 19)** The dropped constraint is `Σ_{i=2}^{k}` u_i > k − T: the error integral E_k of (7.7) is over u₂,…,u_k, and there is no variable u₁ in (7.7)–(7.10).

**MAYNARD-2015, Lemma 8.1, definition of `G_{b,j},` p. 409 (arXiv v3 p. 21); also (8.6)** The sum must start at r = 0, so that `G_{0,j}` = 1 (the empty composition of 0). Equivalently use the multinomial form (8.5), which is correct for every b. For b = 0 the printed `G_{0,j}` is an empty sum, 0, so Lemma 8.1 gives `∫_{ℛ_k}(1` − P₁)^a = 0 instead of a!/(k+a)!; for k = 5, a = 2 the true value is 1/2520. Lemma 8.2 uses `G_{c_i+c_j,2}` and `G_{c′₁+c′₂,2}` with index 0 whenever a monomial has no P₂ factor. For (8.16) exact rational arithmetic with the printed G gives I₅ = 17753/977961600 and ratio 26784/17753 ≈ 1.509 < 2, while with `G_{0,j}` = 1 it gives I₅ = 29509/1222452000 and the stated ratio 1417255/708216, which agrees with direct integration. The paper's numerical results (8.15) and (8.17) are therefore correct: the author's computations evidently used `G_{0,j}` = 1. The eigenvalue 4.0020697 of (8.15) was also reproduced with the corrected formula.

**MAYNARD-2015, Proof of Lemma 8.2, display (8.10), p. 411 (arXiv v3 p. 23)** The right side of (8.10) is b!/(k + b + 2c′ − 1)! · `G_{c′,2}(k` − 1): Lemma 8.1 with k − 1 variables, j = 2 and exponent c′ gives a!/((k−1) + 2c′ + a)! · `G_{c′,2}(k−1).` The printed right-hand side uses c instead of c′, and the coefficient 1 instead of 2. The statement of Lemma 8.2 is consistent with the corrected display: with B = b_i+b_j+2c_i+2c_j−2c′₁−2c′₂+2, (k − 1) + B + 2(c′₁+c′₂) = k + b_i + b_j + 2c_i + 2c_j + 1.

**KED-ANT-12, §12.4, Theorem 12.2, second inequality.** It should read V⁻(z) > (1 − exp(β−s) K^10) V(z); the printed factor 1 + exp(β−s) K^10 has the wrong sign. The theorem here uses non-strict endpoint-safe bounds. Lemma 12.1 gives V−V⁻ as a sum of nonnegative even first-failure masses, so V⁻≤V. The printed inequality forces V⁻>V because exp(β−s)K^10>0 and V>0. Empty P already has V⁻=V=1. The very next consequence display has the correct minus sign.

**KED-ANT-12, §12.1, paragraph beginning with the all-prime specialization, and the prime-indicator example before §12.2** With the displayed divisibility setup and `P(z)=∏_{p≤z}p,` in the range sqrt(x)≤z≤x and positive samples, `S(x,z)=f(1)+Σ_{z<p≤x}f(p).` For twin primes use bad classes n≡−2 modulo p and explicitly account for primes p+2≤z and the shifted size bound; the unshifted prime-indicator sieve does not count twins. At x=25,z=5 and f the prime indicator, the displayed coprimality sieve retains 7,11,13,17,19,23, so S=6. There are nine primes≤25, and four primes p≤25 with p+2 prime (3,5,11,17). The prime 13 survives the displayed sieve though 15 is composite. For general f, the unit also survives.

**KED-ANT-12, §12.1 inclusive P(z) definition versus Lemma 12.1 V(p_n) and p₁<z, and Exercise 12.6.1 hint** Use the strict convention `P(z)=∏_{p<z,p∈P}p` and `V(p)=∏_{q<p,q∈P}(1−g(q))` consistently throughout the first-failure identity. Alternatively retain inclusive P(z), replace the outer cutoff by p≤z, and use the left-limit product V(p−) in each summand. The Brun system uses strict prime cutoffs; it is not silently identified with Chapter 11’s inclusive convention. For selected primes {2},g(2)=1/2,z=3 the printed inclusive V(z)=1/2 and V(2)=1/2, whereas the hinted right-hand side is 1−(1/2)(1/2)=3/4. In Lemma 12.1 with y=2,β=2, the upper coefficient at 2 vanishes; V⁺=1 and the printed first-failure term g(2)V(2)=1/4 also gives the wrong V=3/4. The strict left-limit factor V(2−)=1 restores 1/2. At prime z the mismatch also omits the outer boundary prime.

**KHAYUTIN-19, Published Lemma 9.9, pp.224–225, lcm discrepancy step** Use the maximal-curvature-radius geometry before estimating the lcm discrepancy. For z≥2, θ≤2 and z⁵R^θ≤A, the area bound A≤πR² forces R>1 and z≤A^(1/5)≤A^(1/4). Hence lcm(m,n)≤z²≤√A throughout the full source range; the rescaled area is at least 1. The source's separate coarse Gram-row power estimate requires θ≥1/2. The owned character bound instead counts at most n² labels and uses exponent 7−2θ; a bounded-power cutoff followed by the Euler-product comparison proves the binary theorem for every 0<θ≤2.

**KHAYUTIN-19, Published Lemma 9.11, pp.225–226** Use s≥1, as needed by the power-level application, or change the factor/range for s<1. Fix z=1 and a positive-degree polynomial. Both products are 1 but the proposed uniform right side tends to 0 as s tends to 0.

**KHAYUTIN-19, Published Theorem 9.7 proof, equation (47), p.233** Supply an additional ordinary-density input or repair this contribution using the stated corrected-density power bound. Q=x₀² has ρ_Q(p²)=p³, whereas corrected prime-power densities satisfy a power saving with r=1/2. The needed ordinary bound does not follow.

**KHAYUTIN-19, Published Proposition 9.25, p.236, identity after (50)** The sum of corrected quotient densities has ordinary factors ρ_Q(p^e) at primes p^e exactly dividing k₀ with p∤a, and corrected factors ρ̃_Q(p^(e+j)) when j=v_p(a)≥1. At Q=x₀²,k₀=p,a=1 the two sides of the printed unrestricted identity are p and 0. Quotient polynomials pu² also have corrected density p²−p at p, so their power-bound constants are not uniform. The fixed-divisor target uses the separate valuation-restricted analytic estimate of §1.4.

**KHAYUTIN-19, Published Proposition 9.25, pp.235–236, scaled-domain hypothesis** To use the same η in that theorem require (R/k₀)^θ≤(A/k₀²)^(1−3η), with the corresponding value range. After scaling, the theorem requires the power 1−3η of the new area; a bound by the new area does not imply it for large area.

**KHAYUTIN-19, Published Proposition 9.26, pp.236–237, local factor and first proof congruence** Use Q≡k₀k₁ℓ mod k₁k₂ and ρ_Q(k₀k₁ℓ;k₁k₂); transport the unit residue after dividing by k₀. Reduction of the original congruence retains k₀. Coprimality of k₀ and k₂ permits inverse transport for Q/k₀ but does not remove k₀ from Q itself.

**KHAYUTIN-19, Published Lemma B.4, pp.266–267, m≥1 smooth term and closed formula** Its smooth contribution at level n is (p−1)(1+χ)p^(n−1); combine this with the verified singular recursion. For p=3,q₀=x²−y²,m=n=1 there are 5 zeros, four smooth and the origin; the printed count gives 1.

**KHAYUTIN-19, Published Proposition B.5, equation (68) and odd-valuation branch, pp.268–269** Use exponent ℓ mod 2 and plus 4ωu u_A for Q=q−ωD. When ℓ is odd and p∤4ω, the root criterion is (−ωu/p)=1. Since 2ceil(ℓ/2)−ℓ=ℓ mod 2 and D=−4u u_Ap^ℓ, both corrections follow algebraically. For p=3,q=x²+3y²,ω=1,n=2 there are 0 zeros; the printed odd branch gives 18.

**KHAYUTIN-19, Published Proposition B.5, p.268, second displayed branch** The left side is ρ_Q(p^n). The branch concerns n>ℓ and the following proof counts roots modulo p^n.

**KHAYUTIN-19, Published Corollary B.7, p.269, n≤ℓ branch and n=ℓ formula** The pre-threshold branch uses n<ℓ. At n=ℓ use the actual non-lifting count from the rescaled equation, with the corrected odd root criterion. At p=3,q=x²+3y²,ω=1,ℓ=n=1 all 3 roots modulo 3 have no lift modulo 9, so the corrected density is 3 rather than 0.

**KHAYUTIN-19, Published Proposition B.8, equations (69)–(72), pp.270–271** The k=1 sum is p²[p−1−ε(u_A/p)−(−ωu/p)]/2, using u_Ay²−u_εw²+4ωu u_A=0. For p=3,u=u_A=ω=1,ε=−1,k=1 the actual residue sum is 18, while the printed formula gives 9.

**HB-SIEVES, arXiv math/0209360v1, Theorem 5.1, p.35** Use M⁻≥W(z)(f(s)−the error bound) only for D≥z² (s≥2); the upper main term uses D≥z (s≥1). For 1≤s<2 the actual sifted sum has its lower bracket from nonnegativity, with no corresponding lower estimate for M⁻. For g(p)=1/p on D^(1/4)≤p<D and D=z, M⁻ tends to 1−log 4<0 although f(1)=0.

**HB-SIEVES, arXiv math/0209360v1, Example 1 after Corollary 5.1, p.36** Use y=x/(log x)² in that example. The O(1) discrepancy per modulus yields O(y) after summing d<y, and the ensuing displayed bound uses x/(log x)².

**HB-SIEVES, arXiv math/0209360v1, Example 4, p.38** Take 2/5<θ<1/2 for this four-factor application. Here log y/log z tends to 1/θ; positivity needs θ<1/2. Values are at most x²+1, so a uniform four-factor conclusion from roughness requires θ>2/5.

**HB-SIEVES, arXiv math/0209360v1, fundamental lemma at end of §5, p.38** Require the absolute remainder to be o(XW(z)), together with s→∞ and a vanishing relative sieve-function error. A bound expressed in x does not imply relative smallness when XW(z) may be much smaller. The corrected statement states the relative condition directly.

**HB-SIEVES, arXiv math/0209360v1, partial summation after (6.3), p.44** The upper endpoint is N^β. The preceding integration-by-parts formula and the following integral from α toβ determine the interval.

**HB-SIEVES, arXiv math/0209360v1, Chen theorem local constant, p.46** C₂=2∏_(p>2)(1−1/(p−1)²); the N-dependent correction is a separate product. The source’s §3 definition is the universal product. The theorem factors out the primes dividing N separately; restricting both products loses all other local factors.

**KM-21, arXiv:1809.09597v1, definition (2.4), pp.5–6** Extend ψ by 0 off the unit residue classes, equivalently set the coefficient to 0 for ideals not coprime to F. Oddness alone does not imply coprimality with the discriminant and class-representative factors in F; the printed evaluation is otherwise outside the function domain.

**KM-21, arXiv:1809.09597v1, Lemma 4.1 domain, p.20** Use nonzero elements w∈O_K coprime to f and O_K for the second factor, with zero extension where required. w∈D_i, multiplication of elements and their norms are not operations on the declared mixed ideal/element domain.

**KM-21, arXiv:1809.09597v1, Lemma 4.1(P3), p.20** Index the complete sum modulo |N(w)|O_K, as in the preceding desired property for Φ. The rational norm ideal supplies the stated period and quotient; the principal ideal(w) is a different quotient and its complete sum does not follow from this period statement.

**KM-21, arXiv:1809.09597v1, Theorem 1, p.2, implied-constant dependence** Allow dependence on the fixed ψ, or explicitly bound/normalize its supremum norm and the unit average. The coefficient sequence and its prime sums are linear in ψ; unrestricted scaling cannot retain a ψ-independent bound. The cited locators refer to the specified preprint edition.

**HB-SIEVES, arXiv math/0209360v1, p.24, definition of E_c and the Liouville summatory bound; p.25 second-moment calculation** Use E_c(x)=x exp(−c√log x) in these unnormalized estimates, or explicitly put the x multiplier in every use. The p.25 calculation substitutes E_c(x/d)²=x²d⁻²exp(−2c√log(x/d)); this requires the missing x/d factor. A bound tending to 0 for all large real x would force the integer Liouville partial sum eventually to vanish, impossible since its consecutive differences are±1.

**HB-SIEVES, arXiv math/0209360v1, p.25, cutoff choice following (4.2)** After correcting E_c as in the preceding convention, use y=x exp(−√log x) and z=√y. The printed definition gives y<1 for x>1, hence no growing sieve cutoff and no logarithmic asymptotic. With the restored x factor, log z=(log x−√log x)/2 and the remainder estimate is of the claimed scale.

**HB-SIEVES, arXiv math/0209360v1, p.33, (5.3) and the immediately following normalized main-sum display** Write S=XΣμ⁺(d)/d−Σ_tail+O(Σ|R_d|), so Σμ⁺(d)/d=S/X+Σ_tail/X+O(Σ|R_d|/X). The earlier divisor identity gives the full Möbius sum as the upper sum minus its nonnegative first-failure tail. Summing over samples fixes the minus sign, and dividing by X must normalize every term.

**HB-SIEVES, arXiv math/0209360v1, p.28, Theorem 4.1 induction, before (4.5)** Use this bound only for x^(1/3)≤p<x; treat the remaining prime ranges with the appropriate sieve-function formula and p=x separately. For s=4 and p=x^(1/4) the argument equals 3. At p=x it equals 0, violating the strict lower endpoint.

**MAYNARD-2015, Published Ann. Math. 181 (2015), p.404, (6.18)** The product excludes i=m. The preceding m-coordinate integration removes precisely that coordinate. The printed free index j cannot define the expression.

**MAYNARD-2015, Published Ann. Math. 181 (2015), p.411, matrix-positivity assertion after Lemma 8.2** A₁ is positive definite on a linearly independent basis; A₂ is only guaranteed positive semidefinite. Whitening A₁ still gives the generalized Rayleigh maximum. At k=2 take F=∂_x∂_y[x²y²(1−x−y)²]. This nonzero symmetric polynomial has I₂=1/3150, but each fiber integral vanishes by the boundary terms, hence J₁=J₂=0. It is in the stated symmetric polynomial span. Repeated basis monomials also make A₁ singular.

**KHAYUTIN-19, Published Ann. Math. 189 (2019), pp.230–231, Lemma 9.21, (43)–(44) and final prime-sum estimate** Retain the Möbius-difference factors p^(jβ)−p^((j−1)β) and prove a uniform Euler-factor bound; the displayed coarse bound does not suffice. For fixed s,κ and z→∞ every summand is at least 1/p, so the sum diverges like log log z. This flags the last proof step, not a counterexample to the target.

**KHAYUTIN-19, Published Ann. Math. 189 (2019), p.231, Lemma 9.23, the two-case proof** Handle α=0 separately using C^ω(a)≪_(C,ε) a^ε and the extremely-smooth count. For fixed α>0 the printed bounded-z case is valid, with its constant depending on α. log α is undefined at α=0. The bounded-z inference is valid because a²≤z²≪_(C,α,β)1; it is not an additional error.

**FIMR-13, Public author manuscript, §5, Proposition 5.1 proof, pp.21–24, dyadic block sizes** Permit M≤z and N≤2z (or both≤2z) with MN≤2x; absorb the fixed factor 2 into bilinear constants. At y=z=√x a last m block beginning just above y can have its next dyadic endpoint near 2z. The product bound does not force that endpoint≤z. The corrected constant-factor range preserves Proposition 5.2.

**FIMR-13, Published Invent. Math. 193 (2013), pp.723,727–730 and §9 progression reduction, as corrected by the published 2015 erratum, pp.923–925** Use the 2015 erratum: include the different, use q∤m, retain the revised prime-square norm condition, and reduce the progression conductor to q/gcd(q,k) with q∤k. The authors’ published erratum replaces these steps and explicitly preserves the main results. The corrected nonprincipal conductor is greater than 1 when q∤k.

**BGS-10, Published Invent. Math. 179 (2010), p.577, (3.23) and (3.28)** Exclude a nonconstant−2k eigenspace, or treat bipartite quotient cosets/lazy walks explicitly and prove the mixing estimate for the chosen sieve population. A connected bipartite 2k-regular Cayley graph has a nonconstant−2k eigenvalue while satisfying an ordinary one-sided expander gap. Its alternating word recurrence is not bounded by the asserted smaller exponential.

**BGS-10, Published Invent. Math. 179 (2010), p.581, (3.47), compared with Theorem 3.1 and (3.33)** Choose δ<(1−τ)/dim G and s>9t, then z=X^(δ/s); state the resulting factor bound with a strict margin. The earlier estimates need a smaller distribution power and a strict Brun parameter. Simultaneous equality cannot be inferred from them. The stated strict factor bound is retained.

**CHEN-73-CN, Chinese original, p.127, (27)** Replace that endpoint by −0.0164727. The final lower estimate still exceeds 2.6408. Exact rational log intervals give an expression between−0.016472627076 and−0.016472627074, below the printed endpoint. Combining the preceding terms gives a lower margin greater than 2.6408077.

## References

- **HB-SIEVES.** D. R. Heath-Brown; notes taken by Boris Moroz. [Lectures on sieves](https://arxiv.org/pdf/math/0209360v1). arXiv:math/0209360v1, 25 September 2002; published separately in Bonner Mathematische Schriften 360 (2003), which is not the edition cited here.

- **KED-ANT-11.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 11: Revisiting the sieve of Eratosthenes](https://kskedlaya.org/ant/chap-eratosthenes.html). Author's HTML notes (unpaginated), accessed 27 September 2026.

- **KED-ANT-12.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 12: Brun’s combinatorial sieve](https://kskedlaya.org/ant/chap-brun.html). Author's HTML notes (unpaginated).

- **KED-ANT-14.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 14: Applying the Selberg sieve](https://kskedlaya.org/ant/chap-selberg2.html). Author's HTML notes (unpaginated), accessed 11 October 2026.

- **KED-chap-largesieve.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 15: An additive large sieve inequality](https://kskedlaya.org/ant/chap-largesieve.html). Author's HTML notes (unpaginated), accessed 10 October 2026.

- **KED-ANT-16.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 16: A multiplicative large sieve inequality](https://kskedlaya.org/ant/chap-largesieve2.html). Author's HTML notes (unpaginated).

- **KED-chap-bombieri.** Kiran S. Kedlaya. [Notes on analytic number theory, Chapter 17: The Bombieri–Vinogradov theorem: statement](https://kskedlaya.org/ant/chap-bombieri.html). Author's HTML notes (unpaginated), accessed 11 October 2026.

- **KED-ANT-18.** Kiran S. Kedlaya; identity attributed to R. C. Vaughan. [Notes on analytic number theory, Chapter 18: The Bombieri–Vinogradov theorem: proof](https://kskedlaya.org/ant/chap-bombieri2.html). Author's HTML notes (unpaginated).

- **BOMBIERI-1971.** Enrico Bombieri; Proposition 1 and its proof attributed to Atle Selberg. [A note on the large sieve](https://www.impan.pl/shop/en/publication/transaction/download/product/97707). Acta Arithmetica 18 (1971), 401–404, DOI 10.4064/aa-18-1-401-404.

- **BENNETT-SIKSEK-2020.** Michael A. Bennett and Samir Siksek. [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2.

- **MAYNARD-2015.** James Maynard. [Small gaps between primes](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p07-p.pdf). Annals of Mathematics 181 (2015), no. 1, 383–413, DOI 10.4007/annals.2015.181.1.7 (printed page = PDF page + 382). The published edition is cited; the preprint editions are arXiv:1311.4600 v1, v2 and v3.

- **GGPY-2009.** D. A. Goldston, S. W. Graham, J. Pintz, C. Y. Yıldırım. [Small gaps between products of two primes](https://arxiv.org/pdf/math/0609615v1). arXiv:math/0609615v1, the preprint of Proc. London Math. Soc. (3) 98 (2009), 741–774. The locators here refer to the preprint.

- **SS-23.** Alexei N. Skorobogatov and Efthymios Sofos. [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Inventiones Mathematicae 231 (2023), 673–739, DOI 10.1007/s00222-022-01153-6 (open access).

- **JUTILA-ORIGINAL.** Matti Jutila. [On mean values of Dirichlet polynomials with real characters](https://matwbn.icm.edu.pl/ksiazki/aa/aa27/aa27116.pdf). Acta Arithmetica 27 (1975), 191–198.

- **HB-REAL-95.** D. R. Heath-Brown. [A mean value estimate for real character sums](https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf). Acta Arithmetica 72 (1995), 235–275.

- **SMITH-17.** Alexander Smith. [2∞-Selmer groups, 2∞-class groups, and Goldfeld’s conjecture](https://arxiv.org/pdf/1702.02325v2). arXiv:1702.02325v2; only Proposition 6.6 is used.

- **KP-22.** Peter Koymans and Carlo Pagano. [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv:2201.13424v1, 31 January 2022; the published version is not the edition cited here.

- **KHAYUTIN-19.** Ilya Khayutin. [Joint equidistribution of CM points](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf). Annals of Mathematics 189 (2019), 145–276.

- **BSKK-23.** Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma. [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3, 2 June 2023.

- **IWA-ROSSER.** Henryk Iwaniec. [Rosser’s sieve](https://matwbn.icm.edu.pl/ksiazki/aa/aa36/aa36210.pdf). Acta Arithmetica 36 (1980), 171–202.

- **CHEN-73-CN.** Jingrun Chen. On the representation of a large even integer as the sum of a prime and the product of at most two primes. Science in China (Chinese edition), no. 3 (1973), 111–128; public scan of the Chinese original. The separately paginated English edition in Scientia Sinica is not the edition cited here.

- **KM-21.** Peter Koymans and Djordjo Milovic. [Joint distribution of spins](https://arxiv.org/pdf/1809.09597v1). arXiv:1809.09597v1, 25 September 2018; published in Duke Mathematical Journal 170 (2021).

- **FIMR-13.** John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin. [The spin of prime ideals](https://arxiv.org/pdf/1110.6331v2). arXiv:1110.6331v2; published in Inventiones Mathematicae 193 (2013).

- **FIMR-ERRATUM-2015.** John Friedlander, Henryk Iwaniec, Barry Mazur and Karl Rubin. [Erratum to: The spin of prime ideals](https://link.springer.com/content/pdf/10.1007/s00222-015-0613-9.pdf). Inventiones Mathematicae 202 (2015), 923–925, DOI 10.1007/s00222-015-0613-9.

- **BGS-10.** Jean Bourgain, Alex Gamburd and Peter Sarnak. [Affine linear sieve, expanders, and sum-product](https://link.springer.com/content/pdf/10.1007/s00222-009-0225-3.pdf). Inventiones Mathematicae 179 (2010), 559–644 (open access).

Two inputs have secondary cross-references: Halberstam–Richert, Lemmas 5.3–5.4, as cited by GGPY §2, and Richert (1969), Theorem A, as cited by Chen, Lemma 9. The statements used here are the versions reproduced at those exact secondary locators. The Heath-Brown sieve citations use arXiv:math/0209360v1, the Koymans–Milovic citations arXiv:1809.09597v1 and the GGPY citations arXiv:math/0609615v1. The published 2015 erratum of Friedlander–Iwaniec–Mazur–Rubin is applied in addition to its preprint.

- **HR-SIEVE.** H. Halberstam and H.-E. Richert, Sieve Methods (1974), Lemmas 5.3–5.4, as used in GGPY Lemmas 3–4.
- **RICHERT-1969.** H.-E. Richert, Selberg's sieve with weights (1969), Theorem A, as used in Chen Lemma 9.
- **KM-16RANK-published.** Peter Koymans and Djordjo Milovic, On the 16-Rank of Class Groups of ℚ(√−2p) for Primes p≡1 mod 4 (2018), Proposition 3.6; the published numbering is cited.
- **DFI-1997.** W. Duke, J. Friedlander and H. Iwaniec, Bilinear forms with Kloosterman fractions (1997), Lemma 9, the hyperbola-separation input used in FIMR-13 Proposition 5.1.
