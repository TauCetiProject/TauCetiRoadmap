# Roadmap: effective lower bounds for class numbers of imaginary quadratic fields

**Summary.** This is ImaginaryQuadraticClassNumber, Part II: the base roadmap supplies imaginary quadratic arithmetic, the analytic class-number formula and Siegel finiteness; this extension develops effective lower bounds and class number three. Goldfeld's analytic principle, made quantitative by Oesterlé and fed with the two rank-three elliptic curves of Gross–Zagier and Buhler–Gross–Zagier, gives an effective lower bound for the class number h(K) of an imaginary quadratic field K in terms of log|disc K|; with the exclusion computations of Montgomery–Weinberger and Lehmer–Lehmer–Shanks it determines the sixteen fields of class number three.

This roadmap builds the effective solution of Gauss's class number problem for imaginary quadratic fields, in the form proved by Goldfeld, Gross–Zagier and Oesterlé. It starts from the class group, the discriminant and genus theory of an imaginary quadratic field as Mathlib and Tau Ceti provide them, and from the named modularity, L-function and Diophantine-methods suppliers, with the classical Gross–Zagier specialization constructed in Layer 2. Its end theorems are: the effective technical theorem of Oesterlé, which turns an L-function with a central zero of order three into a uniform lower bound for h(K) (§1.8); the two elliptic curves of conductors 37·139² and 5077 whose analytic and arithmetic ranks are both three (§2.12, §2.13); the uniform bounds θ(d)·log d ≤ 7000·h(K) for every K and θ(d)·log d ≤ 55·h(K) for discriminants prime to 5077 (§3.6, §3.7); the effective bound h(K) > κ(q)(log|disc K|)^(1−q) with an explicit rational κ(q) for every rational q > 0, and the resulting computable cutoff for every fixed class number (§4.7, §4.8); and the list of the sixteen imaginary quadratic fields of class number three, the largest being ℚ(√−907) (§5.8).

`README.md` is the roadmap. `Suggested.lean` is its acceptance test: it states the headline theorems against the pinned libraries, using only the simple definitions their statements need. It also states the integrated lattice-point estimate (§0.7) and Montgomery–Weinberger exclusion (§5.4). Its module docstring identifies the missing arithmetic Heegner and symmetric-square L-function carriers that prevent the full formulas of §§2.8, 2.11 and 3.1 from being stated there. All its declarations live under `TauCetiRoadmap.EffectiveClassNumbers`. The API targets and Checks below are mathematical specifications in prose. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source, and the earlier statements or library declarations it rests on. Numbers taken from the historical computations (zeros of L-functions, least primes with a prescribed character pattern, the constants 7000 and 55) are never assumed: each is stated here as a theorem, an explicit inequality or equality between explicitly defined numbers, whose proof is a finite computation. The roadmap states these theorems; their proofs include the required exact arithmetic and analytic error bounds.

## Scope and ownership

The roadmap owns:

- the arithmetic of imaginary quadratic fields that the argument needs beyond the libraries: the discriminant-sign adapter to the base roadmap, the real quadratic radicand extension and the field-level theorem that the discriminant of every quadratic field is fundamental (the underlying integer-predicate comparison is ImaginaryQuadraticClassNumber H2.1's), the ramified-prime weight θ(d), the split-prime obstruction p^h ≥ d/4 and the agreement of the quadratic character with Liouville's function below it, Oesterlé's reduced-form decomposition of ζ_K(s)/ζ(2s) and the integrated lattice-point estimate for its nonaxial part (Layer 0);
- Goldfeld's analytic principle in Oesterlé's quantitative form: the degree-four completion, the positive inverse Mellin kernels, the positive-measure comparison, the fundamental contour identity, the truncated residue, the three remainder estimates and the uniform technical theorem under Oesterlé's conditions C1–C4 (Layer 1);
- the two rank-three curves E₁₃₉ and E₅₀₇₇ with their models, local data, Mordell–Weil ranks, the Buhler–Gross–Zagier kernels with explicit remainder bounds and the explicit values of the central derivatives, the classical Heegner trace and Gross–Zagier formula with their height comparisons, the Heegner height-gap argument, the modular unit (η(z)/η(37z))² on X₀(37) and the vanishing of the conductor-37 Heegner trace over ℚ(√−139) (Layer 2);
- the symmetric-square factorization of the Liouville product attached to a weight-two newform, Goldfeld's modular analytic systems with every ramified twist correction, the explicit evaluation of Oesterlé's constant for the two curves, the two uniform logarithmic bounds and the exclusion of the discriminant −5077 (Layer 3);
- the explicit prime-product majorants, the asymptotics of prime sums over the first primes, the rational witness κ(q), the effective logarithmic class-number theorem, the computable cutoff for a fixed class number and its comparison with Siegel's ineffective bound (Layer 4);
- the class number three problem: reduction to prime discriminants, the Hardy functions of odd real characters with Stirling's remainder, the three Montgomery–Weinberger zeros and the phase exclusion, the least primes with a prescribed quadratic-character pattern, the Lehmer–Lehmer–Shanks small-range exclusion and the final enumeration (Layer 5).

It leaves to named roadmaps:

- the imaginary quadratic radicand classification, integral basis and discriminant transport, maximal-order Picard/class-group comparison and unweighted reduced-form count, primitive quadratic character and its splitting values, zeta factorization, analytic class-number formula and Siegel lower bound to **ImaginaryQuadraticClassNumber**, H1.1–H1.3 and H2.1–H2.4; its H3.1 supplies complex uniformization and CM reciprocity. The binary-form/ideal dictionary for general quadratic orders belongs to **IntegralLattices**, B1, B2 and B5. The new geometric inequality on reduced forms is §0.2;
- Vélu quotient isogenies, local reduction types, Tate's algorithm and minimal models, quadratic twists, Mordell–Weil, explicit two-descent, canonical heights and the reduction bound on torsion to TauCetiRoadmap **EllipticCurves**, Layers 1, 4, 5 and 6;
- Dedekind's η, Δ = η²⁴ and the Ligozat criterion for η-quotients to TauCetiRoadmap **ModularForms** (worked examples), and the modular curve X₀(N) over ℚ to TauCetiRoadmap **ModularCurves**, Layer 10;
- the residue theorem for null-homologous cycles to the Completed **ContourIntegration** roadmap;
- the real-character version of Siegel's theorem, the slit-plane log-Gamma remainder and the reciprocal-zeta boundary estimate to **AnalyticNumberTheoryPartI**, §§0.9, 0.23a and 0.33; §4.4 uses only the qualitative prime number theorem at the Tau Ceti pin;
- Rankin–Selberg theory for GL₂ × GL₂ (global poles, functional equation and vertical-strip bounds) and general central sign parity to **AutomorphicLFunctionsAndLocalFactors**, AL.3 and AL.5; §2.3 adds the elliptic motivic-normalization adapter;
- the newform attached to an elliptic curve over ℚ, the equality of conductor and level, minimal-model point counts, every bad Euler factor and all coefficient recurrences, the modular parametrisation and the entire continuation of L(E,s) with its functional equation to **EllipticCurveModularity**, R29.3–R29.6;
- the enumeration of rational points of bounded naive height, the local images of the two-descent map, the descent rank bound, Cremona's height-difference bound, canonical heights computed by doubling, independence and regulator bounds from heights, lower bounds for the canonical height by a complete search, saturation, torsion and Mordell–Weil bases to **EffectiveDiophantineMethods**, Layers 0 and 3.

Already stated or built elsewhere, and therefore cited rather than stated here:

- The class number `NumberField.classNumber K`, the discriminant `NumberField.discr K`, the Dedekind zeta function `NumberField.dedekindZeta` with its real residue limit `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, Liouville's function `ArithmeticFunction.liouville`, Mellin transforms `mellin` and `mellinInv` with `mellinInv_mellin_eq`, `analyticOrderAt` and `analyticOrderNatAt`, the Dirichlet L-function `DirichletCharacter.LFunction` with its nonvanishing on Re s ≥ 1 for nontrivial characters, Legendre and Kronecker symbols `legendreSym` and `ZMod.χ₈`, `Nat.nth Nat.Prime` with `Nat.add_two_le_nth_prime`, the Weierstrass curve carrier with its affine equation and point group, its formal L-function `WeierstrassCurve.LFunction` (an arithmetic function whose Euler factor at a prime of additive, split or nonsplit multiplicative reduction is 1, (1−T)⁻¹ or (1+T)⁻¹) and the totalized series `WeierstrassCurve.LSeries`, Dedekind's `ModularForm.eta` and the product formula `ModularForm.discriminant_eq_q_prod` for Δ, and Mathlib's fundamental-discriminant predicate `Int.IsFundamentalDiscr`: all Mathlib.
- Genus theory in the form "for K = ℚ(√d) with d < −1 squarefree, given by an integral generator θ with minimal polynomial X² − d, the number t of ramified primes satisfies t − 1 ≤ 2-rank of the class group": Tau Ceti `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`; together with `NumberField.two_pow_classGroupTwoRank_dvd_classNumber` this gives 2^(t−1) | h. The radicand discriminant formula, with the same squarefree generator hypotheses, is Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, the fundamental-discriminant predicate is `TauCeti.Multiquadratic.IsFundamentalDiscriminant`, and ramification is divisibility of the discriminant by `NumberField.mem_ramifiedPrimes_iff_dvd_discr`. ImaginaryQuadraticClassNumber H1.1 supplies the negative radicand; §0.1 adds the discriminant-sign transport, the real quadratic extension and genus adapters, including K = ℚ(i).
- Integral binary quadratic forms, Gauss reduction and the bijection between reduced forms of discriminant −D and SL₂(ℤ)-classes of positive definite forms: the pinned Tau Ceti library, `TauCeti.BinaryQuadraticForm`, `TauCeti.IsReducedForm`, `TauCeti.reducedForms`, `TauCeti.BinaryQuadraticForm.orbit_mk_reducedForms_bijective` (`NumberTheory/BinaryQuadraticForm/`); ImaginaryQuadraticClassNumber H1.3 supplies the class-number comparison; §0.2 adds the geometric bound on the last coefficient.
- The residue of a function at a point and the residue theorem for a null-homologous cycle: Tau Ceti `TauCeti.Contour.residue` and `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`.
- Quadratic twists of Weierstrass curves `WeierstrassCurve.quadraticTwistOf`, the free quotient `WeierstrassCurve.Affine.PointModTorsion`, the canonical height `WeierstrassCurve.Affine.Point.canonicalHeight` and entire extensions of L-series `LSeries.HasEntireExtension`: Tau Ceti.
- The qualitative prime number theorem `TauCeti.primeCount_univ_isEquivalent_div_log`, the transfer from boundary data to prime asymptotics `TauCeti.primeNumberTheoremTransfer` and the Wiener–Ikehara theorem `TauCeti.LSeries.wienerIkehara`: Tau Ceti; §4.4 uses them only to read off the n-th prime and the sum of p^(−1/2) over the first primes.

## Conventions

K is a number field of degree two over ℚ with negative discriminant D = `NumberField.discr K`; write d = |D| and h = h(K) = `NumberField.classNumber K`, the order of the ideal class group of the maximal order 𝓞_K (never the class number of a non-maximal order). D is a fundamental discriminant, so d ≥ 3, and d = 3, 4 are the fields ℚ(√−3), ℚ(i) with 6 and 4 roots of unity. The integer −243 is a discriminant of a quadratic order but not fundamental, and −5077 is not a discriminant at all (it is ≡ 3 mod 4). Mathlib's and Tau Ceti's fundamental-discriminant predicates both accept D = 1; every use here carries D < 0 separately.

The quadratic character χ = χ_D is the primitive character of conductor d attached to K, with χ(n) = 0 when gcd(n,d) > 1 and with the Kronecker value at 2 determined by D mod 8 (χ(2) = 1 for D ≡ 1 mod 8, −1 for D ≡ 5 mod 8, 0 for even D). A prime p splits, ramifies or is inert in K according as χ(p) = 1, 0, −1. The Legendre symbol at an odd prime never replaces the value at 2. λ is Liouville's function, λ(p) = −1 for every prime p, completely multiplicative.

Binary quadratic forms q(x,y) = ax² + bxy + cy² are integral and positive definite, with discriminant b² − 4ac = −d (Oesterlé writes 4ac − b² = d). A form is reduced when |b| ≤ a ≤ c, and b ≥ 0 whenever |b| = a or a = c; a reduced form has a ≤ √(d/3) and c ≥ √d/2. Each proper equivalence class of primitive forms of discriminant −d contains exactly one reduced form, so for fundamental −d there are exactly h reduced primitive forms. For a reduced form q, a(q) = a is its first coefficient and N_q(t) = #{(m,n) ∈ ℤ × ℤ_(≥1) : q(m,n) ≤ t} counts its nonaxial values.

t = t(d) is the number of distinct primes dividing d, P(d) is the set of those primes with the largest one removed (empty when t ≤ 1), and θ(d) = ∏_(p ∈ P(d)) (1 − ⌊2√p⌋/(p + 1)), with ⌊·⌋ the floor on nonnegative reals; the factor is 1/3, 1/4, 1/3, 3/8 at p = 2, 3, 5, 7 and at least 1/2 for p ≥ 11. Genus theory gives 2^(t−1) | h; in particular h odd forces t = 1 and θ(d) = 1. p_j = `Nat.nth Nat.Prime j` is the j-th prime counted from p₀ = 2.

L-functions. Complex powers a^s with a > 0 are exp(s log a). An elliptic curve E/ℚ of conductor N has L(E,s) = Σ a_n n^(−s), absolutely convergent on Re s > 3/2, and L(E,s) also denotes its entire continuation; the totalized Mathlib series is never evaluated outside the half-plane of convergence. The completed function is Λ(E,s) = N^(s/2)(2π)^(−s)Γ(s)L(E,s), with Λ(E,2−s) = w_E Λ(E,s) and root number w_E = ±1; the centre is s = 1 (the motivic normalization). The analytic rank is ord_(s=1) L(E,s), a natural number only once L(E,·) is known not to vanish identically; arithmetic rank is the ℤ-rank of E(ℚ)/E(ℚ)_tors. For a newform f of weight two and level N, a_n are its Fourier coefficients and |a_n| ≤ τ(n)√n with τ the divisor-counting function. Euler factors are written in the variable p^(−s).

Heights. On an elliptic curve, ĥ is the Néron–Tate height for 2(O): over ℚ it is lim h(x(2ⁿP))/4ⁿ, with h(a/b) = log max(|a|,|b|). Pinned `WeierstrassCurve.Affine.Point.canonicalHeight` and EffectiveDiophantineMethods §§3.12–3.15 use exactly this full x-coordinate height, as do the Buhler–Gross–Zagier tables. Heights over a number field are relative: ĥ_K(P) = [K:ℚ]ĥ_ℚ(P) for rational P. The (O)-height is half of this; the elliptic formulas below use 2(O) throughout. On the Jacobian J₀(N) over a number field H, ĥ_H is the relative Néron–Tate height for 2Θ, Θ a symmetric theta divisor; its pairing ⟨·,·⟩_H is extended to J₀(N)(H) ⊗_ℤ ℂ as a Hermitian form (conjugate-linear in the second variable), so ĥ_H(c) = ⟨c,c⟩_H ≥ 0 there. A complex-bilinear extension would not be nonnegative. The elliptic height is recovered from it by the quotient-polarisation height comparison of §2.8.

The right-half-plane expression of Layer 1 is d^(s−1) M^s Γ(s)² Ψ(s) G(s), with the reflection s ↦ 2 − s. When ΨG = L(E,s)L(E⊗χ,s) and M = √(N N_χ)/(4π² d), its entire continuation is F(s) = Λ(E,s)Λ(E⊗χ,s)/d: the positive factor 1/d does not affect zeros or reflection, but it enters every residue and tail constant. For coefficient series A(s) = Σ α_n n^(−s) and B(s) = Σ β_n n^(−s), "A ≪ B" means |α_n| ≤ β_n for every n (domination of coefficients, not of values).

Effectivity. A constant is effective when it is the output of a stated finite computation on rational data. A theorem with an effective constant states the constant, or states an explicit rational function of rational parameters that computes it; for a real parameter ε the effective statement takes as input a rational q with 0 < q ≤ ε. A numerical value read from a table, or produced by floating-point computation, is never a proof: every numerical input is a theorem of this roadmap, stated as an explicit inequality or equality between rational numbers and explicitly defined real numbers, and the finite computation that proves it is part of its proof, not a separate target.

The suggested signatures take number fields in `Type`; the ℚ-algebra isomorphisms and class-number transports of ImaginaryQuadraticClassNumber H1.1–H1.2 identify their invariants across presentations.

Standing assumptions shared by several layers: K is imaginary quadratic with d and h as above; when K is varied in a uniform statement, the constant is independent of K and of the class number. Each statement records its own extra hypotheses (d > 4, coprimality with a conductor, a sign of χ at a prime).

## Exact supplier contracts

The vocabulary is pinned to Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reduced forms and the full canonical height are present at these pins. Each supplier is consumed only within its stated hypotheses; the additional adapters below are targets of this extension.

### From Mathlib

| Use here | Exact declarations |
|---|---|
| quadratic fields | `NumberField.classNumber`, `NumberField.classNumber_pos`, `NumberField.discr`, `ClassGroup`, `Ideal.absNorm`, `minpoly`, `Algebra.adjoin`, `Int.IsFundamentalDiscr` with `isFundamentalDiscr_iff_squarefree`, `Nat.primeFactors`, `Squarefree` |
| zeta and L-functions | `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re`, `NumberField.dedekindZeta`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `LSeries`, `LSeriesSummable`, `DirichletCharacter`, `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re` (requiring χ ≠ 1 or s ≠ 1), `DirichletCharacter.IsPrimitive`, `legendreSym`, `ZMod.χ₈`, `ArithmeticFunction.liouville`, `ArithmeticFunction.sigma` |
| complex analysis | `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.cpow`, `Real.rpow`, `PhragmenLindelof.vertical_strip`, `mellin`, `mellinInv`, `mellinInv_mellin_eq`, `analyticOrderAt`, `analyticOrderNatAt`, `AnalyticAt`, `AnalyticOnNhd`, `iteratedDeriv`, `Differentiable`, `HasDerivAt`, `MeasureTheory.Measure`, `MeasureTheory.Integrable`, `intervalIntegral`, `ConvexOn`, `AntitoneOn` |
| primes | `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Nat.add_two_le_nth_prime`, `Nat.primeCounting`, `Rat.HeightOneSpectrum.primesEquiv` and `IsIntegralClosure.intEquiv` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean`), `Real.exp_bound`, `Real.pi_gt_d20`, `Real.pi_lt_d20` |
| elliptic curves | `WeierstrassCurve` with `a₁ … a₆`, `Δ`, `c₄`, `IsElliptic`, `toAffine`, `Affine.Equation`, `Affine.Point` and its group law, `WeierstrassCurve.LFunction` (formal Dirichlet series with the Euler factors 1 − a_pT + pT², 1 − T, 1 + T, 1 at good, split, nonsplit and additive primes), `WeierstrassCurve.LSeries` |
| modular forms | `ModularForm.eta` (η(z) = q^(1/24)∏(1 − qⁿ)), `ModularForm.discriminant_eq_q_prod` (Δ = q∏(1 − qⁿ)²⁴), `ModularForm.discriminant_ne_zero`, `UpperHalfPlane`, `CongruenceSubgroup.Gamma0` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| genus theory and discriminants (`NumberTheory/Multiquadratic/`, including `Quadratic/Discriminant.lean`) | `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank` (hypotheses: θ ∈ 𝓞_K with `minpoly ℤ θ = X² − C d`, `Algebra.adjoin ℚ {θ} = ⊤`, d squarefree, d < −1), `NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant` (squarefree radicand with the stated minimal polynomial and generation; no sign restriction), `TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `TauCeti.Multiquadratic.exists_sq_sub_fundamentalDiscriminant_mul_sq_eq_four_mul_norm`, `NumberField.mem_ramifiedPrimes_iff_dvd_discr` |
| contour integration (`Analysis/Contour/`) | `TauCeti.Contour.residue`, `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (an open set, a finite singular set, meromorphic germs there, a cycle avoiding them and null-homologous in the set) |
| elliptic curves (`AlgebraicGeometry/EllipticCurve/`) | `WeierstrassCurve.quadraticTwistOf` (`QuadraticTwist/Basic.lean`) with its coefficient simp lemmas, `WeierstrassCurve.Affine.PointModTorsion`, `WeierstrassCurve.Affine.Point.canonicalHeight` (`CanonicalHeight/Basic.lean`) with `canonicalHeight_zero` and `canonicalHeight_neg`, `WeierstrassCurve.Affine.regulator` (`MordellWeil/Regulator.lean`) |
| L-series | `LSeries.HasEntireExtension` (a differentiable extension agreeing on a right half-plane, unique) |
| binary quadratic forms (`NumberTheory/BinaryQuadraticForm/`) | `TauCeti.BinaryQuadraticForm ℤ` with `discrim` and the SL₂(ℤ) action, `TauCeti.IsReducedForm`, `TauCeti.reducedForms` with `mem_reducedForms`, `exists_smul_isReducedForm`, `orbit_mk_injOn_isReducedForm`, `orbit_mk_reducedForms_bijective` |
| quadratic characters (`NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean`) | `TauCeti.Multiquadratic.fundamentalDiscriminantChar`, `isPrimitive_fundamentalDiscriminantChar`, `fundamentalDiscriminantChar_neg_one`, `fundamentalDiscriminantChar_natCast_eq_legendreSym` |
| primes | `TauCeti.primeCount_univ_isEquivalent_div_log` (`NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean`, counting prime ideals of a number field), `TauCeti.primeCount_eq_card` (`NumberTheory/ArithmeticDirichletSeries/Counting.lean`), `TauCeti.primeNumberTheoremTransfer` (`NumberTheory/ArithmeticDirichletSeries/Prime/Boundary.lean`), `TauCeti.LSeries.wienerIkehara` (`NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean`); §4.4 identifies the ℚ-prime-ideal count with `Nat.primeCounting` through the native prime equivalence |

### From TauCetiRoadmap.IntegralLattices, Layer B

B1 and B2 supply the quadratic-order/form–ideal correspondence, and B5 its reduced representatives. Only this arithmetic correspondence is consumed here; §0.6 owns the additional partial-zeta/Epstein comparison. [IntegralLattices, Layer B](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralLattices#layer-b-binary-lattices-and-quadratic-orders).

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

H1.1 supplies `exists_negative_squarefree_presentation`, the unique negative squarefree radicand and its model equivalences. H1.2 supplies integral-basis/discriminant and class-number transports (`classNumber_congr`); H1.3 supplies Pic(𝓞_K) = ClassGroup(𝓞_K), the primitive-form correspondence and unweighted reduced-form count. H2.1 supplies χ_D, its complex/real casts and the splitting dictionary, including 2, and the comparison of Mathlib's `Int.IsFundamentalDiscr` with the Tau Ceti predicate `TauCeti.Multiquadratic.IsFundamentalDiscriminant` used by the quadratic-character modules, with the sign and mod-4 conditions retained and for every fundamental D ≠ 1; §0.1 consumes this bridge for its field-discriminant theorem and does not prove a second one; H2.2 supplies ζ_K = ζL on Re s > 1 and h(D) = w_D√|D|L(1,χ_D)/(2π). H2.4 supplies `quadratic_LFunction_siegel` and `imaginary_classNumber_lower_bound`. H3.1 supplies the analytic/algebraic CM comparison and ideal-class Galois action. [ImaginaryQuadraticClassNumber, H1–H3](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ImaginaryQuadraticClassNumber).

The H1.3 primitive-form comparison is applied to the full pinned set `TauCeti.reducedForms d` only when −d is fundamental. Primitivity follows directly: if a prime ℓ divides a, b and c, then D/ℓ² is again an integral form discriminant, hence is 0 or 1 modulo 4. For odd ℓ this contradicts squarefreeness of D or D/4; for ℓ = 2 it contradicts squarefreeness in the odd branch, and D/4 ≡ 2 or 3 modulo 4 in the even branch. Thus the primitive restriction in H1.3 is the identity on this finite set. The form/class-group correspondence and count retain H1.3 ownership; no additional supplier declaration is assumed.

For §§5.3 and 5.5, the odd-prime `legendreSym` and dyadic `ZMod.χ₈` values are those of `fundamentalDiscriminantChar (-k)` after the H2.1 scalar cast. Here k = 1 is excluded because −1 is not a fundamental discriminant. The separate trivial fundamental discriminant D = 1 is excluded by D < 0.

### From TauCetiRoadmap.EllipticCurves, Layers 1, 4, 5 and 6

Layer 1: the quotient isogeny by a finite subgroup through Vélu’s formulas, with its kernel and degree; §2.1 uses the order-three subgroup of E₃₇. Layer 4: minimal models over a discrete valuation ring, the reduction types (good, split and nonsplit multiplicative, additive) and Tate's algorithm with its correctness theorems, including invariance under integral changes of variables, the split/nonsplit test and the algorithmic (Ogg) conductor exponent. Layer 5: quadratic twists. Layer 6: the weak Mordell–Weil theorem, the explicit two-descent in the square classes of the étale algebra ℚ[X]/(f) with the resulting Mordell–Weil rank bound, canonical heights and the injection of rational torsion into the reduction at a good odd prime. [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii). The identification of the Ogg exponent with the conductor of the Galois representation is EllipticCurveModularity R29.4's, below.

### From TauCetiRoadmap.ModularForms and TauCetiRoadmap.ModularCurves

ModularForms supplies η, its transformation law under SL₂(ℤ), Δ = η²⁴ and the Ligozat criterion for an η-quotient ∏ η(δz)^(r_δ) to be a modular function on Γ₀(N), as worked examples ([ModularForms, worked examples](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms#worked-examples-acceptance-criteria-keeping-the-theory-honest)). ModularCurves, Layer 10, supplies the modular curve X₀(N) over ℚ with its cusps ∞ and 0. §2.9 uses both for the single η-quotient (η(z)/η(37z))².

### From the Completed ContourIntegration roadmap

The residue theorem for a null-homologous cycle and the Cauchy theorem on rectangles ([ContourIntegration, Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ContourIntegration#layer-2-residues-the-cauchy-primitive-and-the-classical-residue-theorem)), as implemented by the Tau Ceti declarations above. §§1.5–1.6 add only rectangle adapters and limits of horizontal sides.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

| Use here | Statement consumed |
|---|---|
| §4.9 | [§0.9](../AnalyticNumberTheoryPartI/README.md#s0-9), Siegel's lower bound for real quadratic Dirichlet L-values, with an ineffective constant |
| §3.1 | [§0.23a](../AnalyticNumberTheoryPartI/README.md#s0-23a), `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral`, with the compact domination and sector bounds; §3.1 derives the uniform Gamma modulus and balanced-quotient bounds on fixed vertical strips, shifting by `Complex.Gamma_add_one` when the real part is nonpositive |
| §3.1 | [§0.33](../AnalyticNumberTheoryPartI/README.md#s0-33), the reciprocal-zeta bound near Re s = 1 |

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors, AL.3 and AL.5

AL.3 [Continuation and the Rankin–Selberg pole criterion](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-poles) supplies poles at iσ and 1+iσ in the contragredient norm-twist case; the self-pair π_f × π_f∨ has poles at 0 and 1. Consume its [functional equation](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-global-functional-equation), [boundary nonvanishing](../AutomorphicLFunctionsAndLocalFactors/README.md#rs-boundary-nonvanishing) and [Hecke, eigensystem and Rankin–Selberg data](../AutomorphicLFunctionsAndLocalFactors/README.md#automorphic-l-data), whose completed-function strip bounds exclude fixed neighbourhoods of poles when poles are present. `IsNicePinned` is consumed only for pairs outside the pole case. Section 3.1 owns the adapter to polynomial growth of the finite self-pair L-function; bounded completed functions alone do not give that growth after division by gamma factors.

AL.3 supplies local Weil–Deligne parameter comparison; AL.5 [Conductor and test-vector compatibility](../AutomorphicLFunctionsAndLocalFactors/README.md#local-conductor-test-vector-comparison) supplies the ramified-character twist only for an originally unramified representation. Sections 2.3 and 3.3 own the elliptic comparisons for already ramified representations, including wild primes.

AL.5 [The functional-equation sign at the centre](../AutomorphicLFunctionsAndLocalFactors/README.md#central-sign-vanishing) supplies parity of the first nonzero Taylor term and equality of finite and completed orders through a finite nonzero Gamma factor. The analytic-rank parity adapter of §2.3 translates the centre from 1/2 to 1, supplies the elliptic completion and excludes an identically zero function using a₁ = 1.

### From TauCetiRoadmap.EllipticCurveModularity, R29.3–R29.6

For an elliptic curve E/ℚ: the normalized rational newform F_E of weight two attached to E (R29.3); equality of its level with the conductor N_E and, for every prime ℓ, equality of Mathlib's local polynomial of E with that of F_E, so that the formal L-functions coincide at good and bad primes (R29.4, "The level is the conductor" and "The bad factors and all Dirichlet coefficients"); the modular parametrisation φ_E : X₀(N_E) → E with φ_E(∞) = O, through the quotient of J₀(N_E) attached to F_E and a chosen isogeny (R29.5, "Isogeny from the modular quotient" and "The morphism from X₀ at the conductor"); and the entire continuation of Λ(E,s) with Λ(E,2−s) = w_E Λ(E,s), agreeing with the Dirichlet series on Re s > 3/2 (R29.6, "Continuation and the functional equation"). [EllipticCurveModularity](../EllipticCurveModularity/README.md). This roadmap writes L(E,s) for that entire function.

R29.4's coefficient contract is `IsNewformOf.localPolynomial_eq`, `localPolynomial_completion_eq_padic` and `IsNewformOf.coeff_eq`, including multiplicativity and the good/bad prime-power recurrences. Its good-prime count uses the reduction of a minimal model at p; the comparison preserves minimality and reduction under the completion equivalence. Its local determinant uses homological arithmetic Frobenius on inertia coinvariants, equivalently geometric Frobenius on dual cohomology invariants with monodromy retained. Sections 2.3 and 2.7 specialize this contract after minimality of the displayed models in §2.3.


### From TauCetiRoadmap.EffectiveDiophantineMethods, Layers 0 and 3

Enumeration of rational points of bounded naive height (§0.11); the local image of the two-descent map and its completeness test (§§3.2–3.4), the 2-Selmer group and the descent rank upper bound (§§3.5–3.7), Cremona's height-difference bound (§3.12), canonical-height enclosures by doubling (§3.13), independence and regulator lower bounds from heights (§3.14), a lower bound for the canonical height of non-torsion points by a complete search (§3.15), p-saturation from reductions (§§3.17–3.18), torsion (§3.20) and Mordell–Weil bases (§3.22). [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md). §§3.12–3.15 use the same full x-height ĥ. Its interval-arithmetic and enclosure layers are not consumed: the numerical statements here are theorems in their own right.

## How to read the build

The layers are built in the order Layer 0 → 1 → 2 → 3 → 4 → 5, and each `### k.n` subsection lists its statements in dependency order; *Needs:* at the end of a statement names the earlier statements, by subsection or by Lean name, and the library declarations and supplier statements it rests on. Layer 0 delivers the arithmetic of imaginary quadratic fields: the discriminant-sign transport, genus divisibility, the consumed reduced-form count, the weight θ(d), the split-prime obstruction and the agreement of χ with λ, and Oesterlé's reduced-form decomposition with its integrated lattice estimate. Layer 1 delivers Goldfeld's principle in Oesterlé's form: a fixed pair (Ψ, M) satisfying C1 and C4 gives a constant C with C·h ≥ min(1, ∏_(p∈P(d)) |G_p(1)|/(1 + 1/p))·log d for every K and every G and entire continuation satisfying C1–C3. Layer 2 delivers the two curves of rank three, each with an arithmetic proof (descent upper bound and independent points) and an analytic one (exact vanishing of L′(1) through a Heegner argument and explicit rational bounds showing L‴(1) ≠ 0). Layer 3 inserts these curves into Layer 1, with every ramified correction and with the explicit evaluation of Oesterlé's constant, and proves the bounds 7000 and 55. Layer 4 converts the weighted bounds into explicit functions of the number t of ramified primes, then into the effective bound h > κ(q)(log d)^(1−q) and a computable cutoff for each class number. Layer 5 solves the class number three problem: the 55 bound gives d < 10⁷², and two complete exclusion computations leave d ≤ 907, where reduced forms are enumerated. Each subsection opens with its references and the declarations it is built on; each definition gives its API in prose and its checks as a **Checks.** list; every layer ends with its examples and its dependencies.

## Layer 0: imaginary quadratic fields, discriminant weights and small split primes

A small class group forces many small primes to be inert. This layer makes that precise in the two forms the analytic argument uses: a split prime p satisfies p^h ≥ d/4, so below (d/4)^(1/h) the character χ agrees with Liouville's λ; and the Dedekind zeta function decomposes over the h reduced forms, with an integrated lattice-point bound for the nonaxial terms. It also supplies the adapters that let Tau Ceti's genus theory and the binary-form dictionary of IntegralLattices be applied to an arbitrary imaginary quadratic field given only as a number field of degree two.

Standing assumptions for this layer: K is a number field with `Module.finrank ℚ K = 2` and `NumberField.discr K < 0`; d = |disc K|, h = `NumberField.classNumber K`, t the number of primes dividing d. No lower bound on d is assumed unless a statement says so; d = 3 and d = 4 are the fields with extra units and are excluded exactly where the statement says d > 4.

### 0.1 Quadratic fields, radicands and genus divisibility

References: O85 §1.1, p. 311, for the conventions; the genus consequence 2^(t−1) | h is recalled in O85, p. 310, after Theorem 1. Built on Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, `TauCeti.Multiquadratic.ncard_ramifiedPrimes_sub_one_le_twoRank`, `NumberField.two_pow_classGroupTwoRank_dvd_classNumber` and `NumberField.mem_ramifiedPrimes_iff_dvd_discr`.

**Sign transport and the real extension.** Prove the discriminant-sign equivalence: for a degree-two number field K, `NumberField.IsTotallyComplex K` if and only if disc K < 0, by Mathlib `NumberField.sign_discr` and r₁ + 2r₂ = 2. For the imaginary branch apply ImaginaryQuadraticClassNumber H1.1's `exists_negative_squarefree_presentation`; no second imaginary radicand classification is constructed here. Prove the real-radicand presentation: if disc K > 0 and [K:ℚ] = 2, there are an integer d₀ > 1, squarefree, and θ ∈ 𝓞_K with minimal polynomial X² − d₀ and ℚ[θ] = K. Complete the square in a primitive quadratic polynomial and remove rational square factors; the sign follows from the signature. This extends the base roadmap only to the real branch (O85 §1.1, p. 311 for the imaginary convention; the real assertion follows from the displayed elementary proof). *Needs:* Mathlib `minpoly`, `Algebra.adjoin`, `Squarefree`, `NumberField.sign_discr`; ImaginaryQuadraticClassNumber H1.1.

**Checks.**

- ℚ(i) has r₂ = 1 and disc −4; the sign adapter installs the H1.1 hypothesis even though its radicand is −1.
- ℚ(√5) has positive radicand 5 and disc 5, and is not totally complex.
- Degree one is excluded: ℚ has positive discriminant 1 but no nonsquare quadratic radicand.

**The discriminant is fundamental.** Prove the field-discriminant comparison: for every degree-two number field K, real or imaginary, disc K satisfies both `TauCeti.Multiquadratic.IsFundamentalDiscriminant` and `Int.IsFundamentalDiscr`, and is different from 1. Apply the radicand presentations and the pinned `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, and pass from its integer predicate to Mathlib's by ImaginaryQuadraticClassNumber H2.1's predicate comparison. The radicand discriminant formula itself is consumed from that declaration, whose hypotheses are precisely the squarefree generator/minimal-polynomial data (O85 §1.1, p. 311 for the imaginary convention). *Needs:* the discriminant-sign equivalence, ImaginaryQuadraticClassNumber H1.1 and H2.1 (predicate comparison), the real-radicand presentation, Tau Ceti `discr_eq_fundamentalDiscriminant` and `isFundamentalDiscriminant_fundamentalDiscriminant`; Mathlib `Int.isFundamentalDiscr_iff_squarefree`.

**Genus divisibility for every imaginary quadratic field.** Prove the genus divisibility: if disc K < 0 then 2^(t−1) divides h, where t = `(NumberField.discr K).natAbs.primeFactors.card`. For d₀ < −1 combine the radicand with Tau Ceti's lower bound t − 1 ≤ 2-rank (whose t is the number of ramified primes, equal to the number of primes dividing disc K by `NumberField.mem_ramifiedPrimes_iff_dvd_discr`) and with the divisibility of h by 2^(2-rank). The remaining field ℚ(i), radicand −1, has t = 1 and the statement is 1 | h. *Needs:* the discriminant-sign equivalence, ImaginaryQuadraticClassNumber H1.1, Tau Ceti `ncard_ramifiedPrimes_sub_one_le_twoRank`, `NumberField.two_pow_classGroupTwoRank_dvd_classNumber`, `NumberField.mem_ramifiedPrimes_iff_dvd_discr`.

**Fields with one ramified prime.** Prove the one-prime classification: if disc K < 0 and t = 1, then disc K ∈ {−4, −8} or disc K = −p for a prime p ≡ 3 mod 4. A negative fundamental discriminant divisible by exactly one prime is −4, −8 (the 4m branch with m = −1, −2) or an odd −p with −p ≡ 1 mod 4. With genus divisibility this gives: h odd implies t = 1. *Needs:* the field-discriminant comparison, the genus divisibility of §0.1.

**Checks.**

- ℚ(√−5): radicand −5, disc −20 (−5 ≡ 3 mod 4), t = 2, so 2 | h; indeed h = 2 (Tau Ceti's computation for −5). A statement with 2^t in place of 2^(t−1) would require 4 | 2 and fails.
- ℚ(i): radicand −1, disc −4, t = 1; the genus statement is the trivial 1 | h, and ℚ(i) is outside the hypothesis d₀ < −1 of Tau Ceti's lower bound, so a proof that only cites that bound is incomplete here.
- ℚ(√−3): θ = √−3 is integral with minimal polynomial X² + 3 although 𝓞_K = ℤ[(1+√−3)/2] ≠ ℤ[θ]; disc K = −3 because −3 ≡ 1 mod 4. A definition of the radicand that demanded 𝓞_K = ℤ[θ] has no witness here.
- Non-examples: −243 = −3⁵ and −5077 ≡ 3 mod 4 fail both fundamental-discriminant predicates, so neither is disc K for any K.

### 0.2 Reduced forms and the class number

References: O85 §1.2 and §1.3, conditions (i)–(ii), pp. 311–312. Built on the reduced binary forms of the pinned Tau Ceti library (`TauCeti.NumberTheory.BinaryQuadraticForm.Reduced` and `.Reduction`), on IntegralLattices B1 and B2, and on Mathlib `ClassGroup`.

**The last coefficient of a reduced form.** Consume `TauCeti.IsReducedForm`, `TauCeti.reducedForms`, `mem_reducedForms` (with d ≠ 0) and the reduction bijection named in Scope and ownership. Prove the last-coefficient bound: for q : `TauCeti.BinaryQuadraticForm ℤ`, d > 0, q.discrim = −d and q reduced, d ≤ 4c²; if gcd(a,b,c) = 1 and d ≠ 4, then d < 4c². Equality forces a = c and b = 0, so primitivity forces a = c = 1 and d = 4. This geometric bound extends the base roadmap's count rather than repeating it (O85 §1.3, p. 312). *Needs:* `TauCeti.mem_reducedForms`, ImaginaryQuadraticClassNumber H1.3 (primitive-form restriction and unweighted count, applied with the fundamental-discriminant argument in Exact supplier contracts).

The class-number count used below is ImaginaryQuadraticClassNumber H1.3, after its primitive restriction and the pinned `TauCeti.BinaryQuadraticForm.orbit_mk_reducedForms_bijective`. The small count identities, including the count three at discriminant −907, are Checks on this comparison.

**Checks.**

- d = 23: the reduced forms are (1,1,6), (2,1,3), (2,−1,3), and h(ℚ(√−23)) = 3.
- d = 20: the reduced forms are (1,0,5) and (2,2,3); (2,−2,3) is excluded by the boundary convention, which is what makes the count 2 = h(ℚ(√−5)) rather than 3.
- d = 907: the reduced forms are (1,1,227), (13,9,19), (13,−9,19); (13,−9,19) is kept because neither |b| = a nor a = c.
- d = 139: the reduced forms are (1,1,35), (5,1,7), (5,−1,7), so h = 3. This is the class-number input for the conductor-37 Heegner trace in Layer 2.
- d = 4: the only reduced form is (1,0,1), and 4c² = d there, so the strict inequality 4c² > d needs d ≠ 4.
- Non-example for the strict inequality without primitivity: d = 16 has the reduced forms (1,0,4) and the imprimitive (2,0,2), and (2,0,2) has 4c² = 16 = d; −16 is not a fundamental discriminant.
- Non-example: for the non-fundamental d = 12 the set contains the imprimitive (2,2,2), so identifying the full reduced-form set with its primitive restriction genuinely needs −d fundamental, and h of the order of discriminant −12 is not #`TauCeti.reducedForms 12`.

### 0.3 The ramified-prime weight

References: O85, Theorem 1 and the definition of P(d) and θ(d), p. 310, and the values of the factors, p. 311. Built on Mathlib `Nat.primeFactors`, `Real.sqrt` and `Nat.floor`.

**The weight θ.** Define `ramifiedWeight (d : ℕ) : ℝ` as the product, over the distinct prime factors of d with the largest one removed, of 1 − ⌊2√p⌋/(p + 1), where ⌊·⌋ is the natural floor; the product is empty (value 1) for d = 0, 1 and for prime powers. In Lean the removed prime is the maximum of `d.primeFactors`, taken as 0 for the empty set. It is not a product over the primes of a conductor, and prime multiplicities do not enter. Its API includes:

- For every natural d, 0 < θ(d) ≤ 1; every factor lies in [1/4, 1].
- For prime p and k ≥ 1, θ(p^k) = 1.
- If d and e have the same distinct prime divisors, θ(d) = θ(e).
- For an imaginary quadratic field of odd class number, θ(d) = 1, by §0.1.

*Needs:* the genus divisibility of §0.1, the one-prime classification of §0.1.

**Checks.**

- θ(0) = 1 and θ(907) = 1: the empty product, and a prime.
- θ(15) = 1/4: the primes are 3 and 5, the largest 5 is removed, and 1 − ⌊2√3⌋/4 = 1 − 3/4. Removing the smallest prime instead would give 1 − ⌊2√5⌋/6 = 1/3.
- θ(84) = 1/12: the primes are 2, 3, 7, the largest 7 is removed, and (1 − 2/3)(1 − 3/4) = 1/12. Using the multiplicity of 2 in 84 = 2²·3·7, or keeping 7 (factor 3/8), changes the value.
- The factors at p = 2, 3, 5, 7 are 1/3, 1/4, 1/3, 3/8: they are not monotone in p, so no argument may assume the floor factors decrease (§4.2 compares them with a smooth majorant instead).

### 0.4 Small split primes

References: O85 §1.4(a), p. 312. Built on Mathlib `NumberField.classNumber` and `Ideal.absNorm`.

**Split-prime size bound.** Prove the split-prime bound: for every imaginary quadratic K, if p is a prime not dividing d, and some prime ideal of 𝓞_K has norm p (so p splits), then d ≤ 4p^h. Proof: the h-th power of a prime 𝔭 of norm p is principal, generated by (a + b√−d)/2 with integers a ≡ bd mod 2; its norm is p^h = (a² + db²)/4; b ≠ 0 because 𝔭^h is not stable under conjugation (𝔭 and its conjugate are distinct, as p is unramified), so 4p^h ≥ d. For d = 3, 4 the unit group is larger and the same computation applies. *Needs:* the discriminant-sign equivalence of §0.1, ImaginaryQuadraticClassNumber H1.1, Tau Ceti `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`, Tau Ceti `exists_sq_sub_fundamentalDiscriminant_mul_sq_eq_four_mul_norm`.

**Checks.**

- d = 3, h = 1, p = 7: 3 ≤ 28; d = 4, h = 1, p = 5: 4 ≤ 20. Both split unramified boundary fields are included. Compute h = 1 and exhibit a norm-7 or norm-5 prime ideal in the respective field; the split-prime bound then gives these inequalities.
- d = 23, h = 3: 2 splits (−23 ≡ 1 mod 8) and 4·2³ = 32 ≥ 23.
- d = 907, h = 3: every prime p with 4p³ < 907, that is p ≤ 5, must be inert; indeed (−907/2) = −1 (−907 ≡ 5 mod 8), (−907/3) = −1 and (−907/5) = −1.
- The factor 4 cannot be dropped: for d = 7, h = 1, the prime 2 splits (−7 ≡ 1 mod 8) and 4·2 = 8 ≥ 7, but 2 < 7.
- d = 20, h = 2: 3 splits in ℚ(√−5), as (3) = (3, 1+√−5)(3, 1−√−5), and 4·3² = 36 ≥ 20; the exponent is the class number h, not the order of the class of 𝔭 (here also 2).

### 0.5 Agreement with Liouville's function

References: O85 §1.4, p. 312, and §3.5, p. 318. Built on Mathlib `ArithmeticFunction.liouville` and the character χ_D of ImaginaryQuadraticClassNumber H2.1.

**Quadratic character and Liouville agreement.** Prove the character–Liouville agreement: if d > 4, 1 ≤ n < (d/4)^(1/h) and gcd(n,d) = 1, then χ_D(n) = λ(n). Every prime divisor q of n is below the threshold, cannot split by §0.4 and cannot ramify by coprimality, so χ_D(q) = −1 = λ(q); complete multiplicativity of both functions finishes, including n = 1. Use the arithmetic fact that a completely multiplicative function with value −1 at every prime factor of a positive n agrees with λ at n. *Needs:* the split-prime bound of §0.4, Mathlib `ArithmeticFunction.liouville`, ImaginaryQuadraticClassNumber H2.1 (χ_D and its values at split, ramified and inert primes).

**Checks.**

- Coprimality is necessary: for a prime p | d, χ_D(p) = 0 while λ(p) = −1.
- d = 907, h = 3: (907/4)^(1/3) ≈ 6.1, so the statement covers n ≤ 6, and χ(4) = 1 = λ(4), χ(6) = 1 = λ(6), χ(5) = −1 = λ(5).

### 0.6 The reduced-form decomposition of ζ_K(s)/ζ(2s)

References: O85 §1.2, the partial zeta function of a class as w⁻¹ times the Epstein sum of the corresponding form, p. 311; §1.3, formulas (1.3.1) and (1.3.2), p. 312; §1.4(b), p. 312. Built on Mathlib `NumberField.dedekindZeta`, `riemannZeta`, `LSeries`, and §0.2.

**Partial zeta and the ideal normalization.** Prove the partial-zeta/Epstein comparison: for D < 0 fundamental, a primitive positive definite form q = (a,b,c) with discriminant D and Re s > 1, put I_q = aℤ + ((b + √D)/2)ℤ, of norm a. Then q(m,n) = N(am + ((b + √D)/2)n)/N(I_q), and the partial zeta function of the inverse ideal class [I_q]⁻¹ equals w(D)⁻¹ times Σ_((m,n)≠(0,0)) q(m,n)^(−s). The map sends nonzero α ∈ I_q to the integral ideal (α)I_q⁻¹; each fibre is a unit orbit of cardinality w(D). With IntegralLattices B2's minus-b convention the class is conjugated; this inverse is explicit (O85 §1.2, p. 311). *Needs:* IntegralLattices B2; ImaginaryQuadraticClassNumber H1.2–H1.3 (norms and units); Mathlib `NumberField.dedekindZeta`.

**Checks.**

- For q = (1,1,6), I_q = 𝓞_(−23), q(1,0) = 1 and w = 2; each ideal has two unit generators.
- For q = (2,1,3), the ideal (2,(1+√−23)/2) has norm 2 and q(1,0) = N(2)/2 = 2; omitting the ideal norm changes 2 to 4.
- For D = −3 and −4 the unit factors are 6 and 4; the half-Epstein convention w = 2 fails there. The bridge includes them, whereas the following simplified decomposition requires d > 4.

**Reduced-form decomposition.** Prove the reduced-form zeta decomposition: for d > 4 and Re s > 1,

```text
ζ_K(s) = Σ_{q reduced} ( a(q)^(−s) ζ(2s) + Σ_{m ∈ ℤ, n ≥ 1} q(m,n)^(−s) ),
ζ_K(s)/ζ(2s) = ∏_p (1 + p^(−s))/(1 − χ(p)p^(−s))
             = Σ_{q reduced} ( a(q)^(−s) + Σ_{m ∈ ℤ, n ≥ 1, gcd(m,n) = 1} q(m,n)^(−s) ),
```

the sums running over the h reduced forms of §0.2. The axial terms come from the vectors (m, 0), the nonaxial ones from n ≥ 1, and the factor w = 2 of units is absorbed by the sign symmetry (m,n) ↦ (−m,−n). The Euler product follows from ζ_K = ζ·L(s,χ) and the local identity (1 − p^(−2s))/((1 − p^(−s))(1 − χ(p)p^(−s))) = (1 + p^(−s))/(1 − χ(p)p^(−s)) at unramified p, with the factor (1 + p^(−s)) at ramified p. Its coefficient API includes:

- Each ν_n is a nonnegative integer, counting the primitive nonaxial vectors together with the axial contribution.
- The coefficient ν₁ is 1.
- For d > 4, Σ_(n ≤ √d/2) ν_n ≤ h: a primitive nonaxial value is at least c ≥ √d/2 and strictly greater unless d = 4 (O85 §1.4(b)).

*Needs:* ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count), the last-coefficient bound of §0.2, the partial-zeta/Epstein comparison, Mathlib `NumberField.dedekindZeta`, ImaginaryQuadraticClassNumber H2.2 (ζ_K = ζ·L(s,χ_D)).

**Checks.**

- d = 23: the three reduced forms give ν₁ = 1 (from a = 1), ν₂ = 2 (from the two forms with a = 2), and Σ_(n ≤ √23/2) ν_n = ν₁ + ν₂ = 3 = h: the bound of the small-coefficient sum bound is attained.
- The Euler factor at a ramified prime is 1 + p^(−s), not 1: at d = 23, p = 23 contributes ν₂₃ ≥ 1 from the factor 1 + 23^(−s); a decomposition that dropped ramified factors would miss it.
- Non-example: the full Epstein sums Σ_((m,n)≠0) q(m,n)^(−s) of §1.2 count each value twice (sign symmetry); the decomposition above uses n ≥ 1 and the half-line of axial vectors, and the factor w is the one that distinguishes d = 3, 4 (w = 6, 4), excluded by d > 4.

### 0.7 The integrated nonaxial lattice-point estimate

References: O85 §1.3, p. 312 (the count N_q(t), its vanishing below c ≥ √d/2, its asymptotic πt/√d, and the integrated inequality, there attributed to Oesterlé's own work). Built on §0.2 and Mathlib's Lebesgue integral.

**Nonaxial count and its integrated bound.** Define `nonaxialCount` for an integral binary quadratic form q and real t as the natural cardinality of {(m,n) ∈ ℤ² : n ≥ 1 and q(m,n) ≤ t}, and write N_q(t) for it. For a reduced form of discriminant −d with d > 0 the set is finite; the counting definition is used analytically only under these hypotheses. Its API includes:

- For t ≤ t′, inclusion of the finite sublevel sets gives N_q(t) ≤ N_q(t′).
- For t < c, N_q(t) = 0, since every nonaxial value is at least c.
- On every bounded real interval the count is a step function with finitely many jumps, and is integrable.

Prove vanishing of N_q below c (N_q(t) = 0 for t < c, in particular for t < √d/2), the nonaxial asymptotic (N_q(t) ∼ πt/√d as t → ∞; πt/√d is the area of the half-ellipse q ≤ t, y > 0), and the main estimate `integral_nonaxialCount_le`: for every d > 0, every integral reduced q with q.discrim = −d and every A ≥ 0,

```text
∫₀^A N_q(t) dt ≤ ∫₀^A (πt/√d)·1_{[√d/2, ∞)}(t) dt.
```

Equivalently, for the measure ν_q = Σ_((m,n), n ≥ 1) δ_(q(m,n)) and the comparison measure ν = (π/2)δ_(√d/2) + (π/√d)·(Lebesgue on [√d/2, ∞)), whose cumulative mass is (πt/√d)·1_([√d/2,∞))(t), the integrated cumulative masses satisfy ∫₀^T ν_q((0,t])dt ≤ ∫₀^T ν((0,t])dt for every T ≥ 0; this is exactly the hypothesis of the positive Mellin comparison §1.4, and ν has Mellin transform ∫ x^(−s) dν = (π/2)·(s/(s − 1))·(√d/2)^(−s) for Re s > 1. Write ∫₀^A N_q(t)dt = Σ_(n ≥ 1) Σ_m (A − q(m,n))₊ and prove O85 §1.3’s integrated lattice estimate using the reduction inequalities and q(m,n) ≥ dn²/(4a). A separate estimate for each fixed n must retain its lattice error: an uncorrected comparison of that sum with the integral in m is false, as the Check below shows. *Needs:* Tau Ceti `TauCeti.mem_reducedForms` (3a² ≤ d), the last-coefficient bound of §0.2, Mathlib `MeasureTheory.Measure`, `intervalIntegral`.

**Checks.**

- For q = (1,0,1), N_q(0) = 0, N_q(1) = 1, N_q(2) = 3; counting both signs of n would give 2 and 6 at 1 and 2. At A = 0 both integrals are 0; at A = 2 they are 1 and 3π/4.
- The reduced form (0,0,1) has discriminant 0 and infinitely many points below t = 1; its natural cardinality is totalized to 0. The hypothesis d > 0 excludes this from the finite-count and integral assertions.
- For q = (1,1,6) (d = 23) the nonaxial values up to 12 are 6, 6, 8, 8, 12, 12 (at (0,1), (−1,1), (1,1), (−2,1), (2,1), (−3,1)), so N_q(t) = 0 for t < 6 = c, which is stronger than vanishing below √23/2 ≈ 2.40.
- At A = √d/2 the right side is 0, so the left side must vanish: N_q(t) = 0 for t < c and c ≥ √d/2 make ∫₀^(√d/2) N_q = 0.
- Counting all (m,n) ≠ (0,0) instead of n ≥ 1 doubles the left side asymptotically (to about πA²/√d), while the right side is (π/(2√d))(A² − d/4); the inequality then fails for large A, so the restriction to n ≥ 1 is essential.
- For q = (1,0,1), n = 1 and A = 17/16, the sum over m of (A − q(m,1))₊ is 1/16, whereas its integral over real m is 1/48. Thus a termwise sum ≤ integral argument is false even for a primitive reduced form; the target concerns the complete integrated count.
- The Mellin transform of ν at s = 2 is (π/2)·2·(√d/2)^(−2) = 4π/d: a comparison measure without the atom (π/2)δ_(√d/2) would have transform (π/√d)(√d/2)^(1−s)/(s − 1), which at s = 2 is 2π/d, and its cumulative mass would be smaller by π/2 just above √d/2.

### Examples

- K = ℚ(√−23): radicand −23, disc −23, t = 1, θ = 1; reduced forms (1,1,6), (2,±1,3), h = 3; 2 splits and 4·2³ ≥ 23; ν₁ + ν₂ = 3 = h.
- K = ℚ(√−5): disc −20, t = 2, 2 | h = 2; the boundary convention removes (2,−2,3); θ(20) = 1 − ⌊2√2⌋/3 = 1/3.
- K = ℚ(√−907): h = 3, θ = 1, the primes 2, 3, 5 are inert, and the three reduced forms are (1,1,227), (13,±9,19).

### Dependencies

Mathlib (`NumberField.classNumber`, `NumberField.discr`, `NumberField.dedekindZeta`, `riemannZeta`, `ClassGroup`, `Int.IsFundamentalDiscr`, `ArithmeticFunction.liouville`, the Lebesgue integral); Tau Ceti's genus theory and quadratic discriminants (`TauCeti.Multiquadratic`); TauCetiRoadmap IntegralLattices, Layer B (B1, B2, B5); TauCetiRoadmap ImaginaryQuadraticClassNumber H1.1–H1.3 and H2.1–H2.2. No earlier layer.

## Layer 1: Goldfeld's effective analytic principle

The analytic engine compares a contour integral of a degree-four L-function, which vanishes because of a central zero of order at least three and a plus-sign functional equation, with its residue at s = 1, whose size is governed by log d and by the Euler factors at the small primes. A fixed pair (Ψ, M) is used for every K; only the auxiliary quotient G varies with K. The output is a uniform constant C, depending only on Ψ and M, with C·h ≥ min(1, ∏_(p∈P(d)) |G_p(1)|/(1 + 1/p))·log d.

Standing assumptions for this layer: d ∈ ℕ with d > 0 (d > 4 where K is involved), M > 0 real, Ψ and G complex functions; complex powers of positive reals are principal; integrals along vertical lines are oriented upwards and normalized by 1/(2πi). Coefficient domination ≪ is coefficient-wise, as in the Conventions.

### 1.1 The degree-four completion

References: O85, condition C3, p. 314, and §4.2, p. 320. Built on Mathlib `Complex.cpow` and `Complex.Gamma`.

**Goldfeld's completion.** Define `goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : ℂ → ℂ` by the pointwise expression d^(s−1) M^s Γ(s)² Ψ(s) G(s), with no new gamma-factor or L-function carrier. Its API includes:

- At s = 1 the expression is MΨ(1)G(1), including d = 0 since d⁰ = 1; at s = 2 it is dM²Ψ(2)G(2).
- Equal pairs of functions Ψ, G give equal completions.
- For positive d, N, N_χ, if ΨG = LL_χ on Re s > 3/2 and M = √(N N_χ)/(4π²d), the expression there equals Λ(s)Λ_χ(s)/d, with Λ(s) = N^(s/2)(2π)^(−s)Γ(s)L(s) and likewise for L_χ.
- For d > 0 and M > 0, if ΨG is analytic at 1 with finite order, this expression has the same order at 1: the remaining factor is analytic and nonzero there.

*Needs:* Mathlib `Complex.cpow`, `Complex.Gamma`, `Complex.Gamma_one`, `analyticOrderNatAt`.

**Checks.**

- d = 2, M = 3, Ψ ≡ 2, G ≡ 5: F(1) = 3·2·5 = 30 (d^0 = 1, Γ(1) = 1).
- d = 2, M = 3, Ψ ≡ G ≡ 1: F(2) = 2·9·Γ(2)² = 18. A completion with d^s in place of d^(s−1) would give 36.
- Ψ ≡ 0 gives the pointwise product identically 0. At s = 0, `Complex.Gamma 0 = 0` makes the pointwise product zero even for nonzero Ψ and G; it cannot prescribe the value of the C3 continuation there. This continuation is required to agree only on Re s > 3/2.
- With ΨG = L(E,s)L(E⊗χ,s) the scale M = √(N N_χ)/(4π²d) produces Λ(E,s)Λ(E⊗χ,s)/d, not Λ(E,s)Λ(E⊗χ,s): the factor 1/d is visible at s = 1, where F(1) = M·L(E,1)L(E⊗χ,1) while Λ(E,1)Λ(E⊗χ,1) = √(N N_χ)(2π)^(−2)L(E,1)L(E⊗χ,1) = dM·L(E,1)L(E⊗χ,1).

### 1.2 Oesterlé's conditions C1–C4

References: O85 §3, conditions C1–C4, p. 314, and §3.5, Theorem 2, p. 318. This subsection fixes the hypotheses of §§1.5–1.8; it has no proof obligation of its own.

For d, M, Ψ, G as above, and K imaginary quadratic of discriminant −d:

- **C1** (coefficient domination). Ψ(s) = Σ a_n n^(−s) with Ψ ≪ ζ(2s − 1)², absolutely convergent for Re s > 1; G(s) = Σ b_n n^(−s) with G ≪ (ζ_K(s − 1/2)/ζ(2s − 1))², absolutely convergent for Re s > 3/2. In terms of coefficients: |a_n| ≤ m·τ(m) when n = m² and a_n = 0 otherwise, and |b_n| ≤ √n·Σ_(q|n) ν_q ν_(n/q) with ν the nonnegative coefficients of ζ_K(s)/ζ(2s) from §0.6. A bound on the values |Ψ(s)| or |G(s)| on one line does not imply C1.
- **C2** (Euler product). G(s) = ∏_p G_p(s) on Re s > 3/2 with G_p(s) = (1 + α_p p^(−s))(1 + β_p p^(−s)) / ((1 + α′_p p^(−s))(1 + β′_p p^(−s))) and |α_p|, |β_p|, |α′_p|, |β′_p| ≤ √p.
- **C3** (completed function). Supply an entire F : ℂ → ℂ agreeing with `goldfeldCompletion d M Ψ G` on Re s > 3/2; F decreases faster than every power of |Im s| on every bounded vertical strip, satisfies F(2 − s) = F(s), and vanishes to order at least three at s = 1.
- **C4** (the fixed factor). Ψ is holomorphic on a neighbourhood of the closed half-plane Re s ≥ 1, has a simple zero at s = 1, and M^sΓ(s)²Ψ(s) decreases faster than every power of |Im s| on every bounded vertical strip of the closed half-plane Re s ≥ 1 (O85 asks for the strips of that half-plane, not of the neighbourhood; the indentation of §1.6 leaves the half-plane only on a compact set).

Reflection F(2 − s) = F(s) kills every odd Taylor coefficient at 1; together with C3 this gives vanishing to order at least four, including the identically zero case.

### 1.3 The positive inverse Mellin kernels

References: O85 §3.3, Lemmas 1 and 2, pp. 315–316. Built on Mathlib `Real.rpow`, `Real.log`, `mellin` and `mellinInv_mellin_eq`.

**The kernel I_(a,m).** For a ∈ ℝ and m ∈ ℕ with m ≥ 2 define the real kernel I_(a,m) by I_(a,m)(x) = x^(−a)(log(1/x))^(m−1)/(m−1)! for 0 < x ≤ 1 and 0 otherwise; so I(1) = 0 and I(x) = 0 for x ≤ 0 and x ≥ 1. Its API includes:

- The displayed formula holds on (0,1], and the kernel vanishes off (0,1).
- For m ≥ 2 it is nonnegative.
- For a ≥ 0 and m ≥ 2 it is nonincreasing and convex on (0,∞).
- For Re s > a its absolutely convergent Mellin transform is (s − a)^(−m). For m ≥ 2 this transform is integrable on vertical lines, allowing Mellin inversion.

*Needs:* Mathlib `mellin`, `mellinInv_mellin_eq`, `ConvexOn`, `AntitoneOn`.

**Checks.**

- I_(0,2)(1/2) = log 2 and I_(1,2)(1/2) = 2 log 2: the factor x^(−a) is x^(−1) = 2 at x = 1/2.
- I_(0,3)(1/2) = (log 2)²/2 > 0: omitting (m−1)! doubles this nonzero value.
- I_(0,3)(1) = 0 and I_(0,2)(2) = 0: the kernel vanishes at 1 and beyond.
- For a = −1, m = 2 the values at 1/16 and 1/4 are (log 2)/4 and (log 2)/2; the increase is a negative control for antitonicity without a ≥ 0.
- For a = 0, m = 2 the kernel is −log x on (0,1): convex and decreasing there, with a corner at x = 1 where it meets 0; for a < 0 monotonicity fails (I_(−1,2)(x) = −x log x increases on (0, 1/e)), so a ≥ 0 is needed for the comparison of §1.4.

### 1.4 Positive Mellin comparison

References: O85 §3.3, Lemmas 1–3 and Examples 1–2, pp. 315–316. Built on §1.3 and Mathlib `MeasureTheory.Measure` and Fubini–Tonelli.

**Comparison of positive measures.** Prove the positive Mellin comparison: let a ≥ 0, m ≥ 2, x > 0, and let μ_j, ν_j (j in a finite index set) be positive measures on (0, ∞) with finite mass on every (0, t]. Suppose their Mellin transforms μ̂_j(s) = ∫ t^(−s) dμ_j converge on a common line Re s = σ > a, that (s − a)^(−m)∏_j μ̂_j(s) and (s − a)^(−m)∏_j ν̂_j(s) are absolutely integrable on that line, and that for every j and every T ≥ 0,

```text
∫₀^T μ_j((0,t]) dt ≤ ∫₀^T ν_j((0,t]) dt.
```

Then the inverse Mellin transforms of (s − a)^(−m)∏_j μ̂_j(s) and (s − a)^(−m)∏_j ν̂_j(s) at x are nonnegative and ordered in the same way. Proof: by Fubini (justified by the absolute integrability) each inverse transform equals ∫ I_(a,m)(x ∏_j t_j) ∏_j dμ_j(t_j); for fixed x the function t ↦ I_(a,m)(xt) is nonnegative, nonincreasing and convex with support bounded on the right, so it is a positive combination of hinges (u − t)₊ (its distributional second derivative is a positive measure, with an atom at the corner when m = 2); by Tonelli ∫ (u − t)₊ dμ(t) = ∫₀^u μ((0,t])dt, which gives the comparison for one factor; replace the factors one at a time. Pointwise domination μ_j((0,t]) ≤ ν_j((0,t]) for all t implies the integrated hypothesis (the cumulative-domination corollary). The application in §1.7 uses the integrated form for the nonaxial measures of §0.7, and the discrete comparison of ζ(2s) through the pushforward of counting measure along n ↦ n². *Needs:* kernel nonnegativity of §1.3, kernel antitonicity of §1.3, kernel convexity of §1.3, the kernel Mellin-transform formula of §1.3, Mathlib `mellinInv_mellin_eq`, `MeasureTheory.integral_prod`.

**Checks.**

- μ = δ₁ and ν = (δ_(1/2) + δ_(3/2))/2 satisfy the integrated hypothesis for every T (the two sides are (T − 1)₊ and ((T − 1/2)₊ + (T − 3/2)₊)/2, equal for T ≥ 3/2), but pointwise domination fails for 1 ≤ t < 3/2, where μ((0,t]) = 1 > 1/2 = ν((0,t]). For a = 0, m = 2, x = 1 the kernel integrals are ∫ I_(0,2)(t)dμ = I_(0,2)(1) = 0 and ∫ I_(0,2)(t)dν = (log 2)/2, in the predicted order; the theorem must cover this example, so it may not assume pointwise domination.
- Positivity of the measures is needed for the nonnegativity part: the signed μ = −δ_(1/2) and ν = 0 satisfy the integrated inequality, but ∫ I_(0,2)(t) dμ = −log 2 < 0.
- Monotonicity of the kernel needs a ≥ 0: for a = −1 the hinge representation fails because I_(−1,2) is not monotone (§1.3).

### 1.5 The fundamental contour identity

References: O85 §3.1, identity (3.1.1), p. 314. Built on Tau Ceti `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` and Mathlib `analyticOrderNatAt`.

**Vanishing of the central contour integral.** Prove the fundamental contour identity: if F is entire, F(2 − s) = F(s), F has a zero of order at least three at s = 1, and on every bounded vertical strip |F(s)| decreases faster than every power of |Im s|, then for every σ > 3/2

```text
(1/2πi) ∫_{Re s = σ} F(s)/(s − 1)³ ds = 0.
```

Proof: reflection and the three vanishing Taylor coefficients force vanishing through degree three, so F(s)/(s − 1)³ has an entire removable extension; integrate around the rectangle with vertical sides Re s = σ and Re s = 2 − σ and horizontal sides at height ±T, which encloses no singularity; the horizontal sides tend to 0 by strip decay, so the residue theorem gives I(σ) = I(2 − σ) for the two upward vertical integrals; the substitution s ↦ 2 − s maps the left line onto the right one, reverses orientation and multiplies the integrand by −1 (odd power of s − 1), so I(2 − σ) = −I(σ); hence I(σ) = 0. (O85 §3.1, p. 314, instead moves the line to Re s = 1, where the same symmetry makes the integral vanish.) With F the C3 continuation, its agreement with `goldfeldCompletion d M Ψ G` on the integration line gives Oesterlé's identity J = 0. *Needs:* `goldfeldCompletion`, Tau Ceti `classicalResidueTheorem_nullHomologous`, Mathlib `analyticOrderNatAt`.

**Checks.**

- The plus sign is required: F(s) = (s − 1)³e^((s−1)²) is entire, decays on vertical strips, vanishes to order three at 1 and satisfies F(2 − s) = −F(s); its integrand is e^((s−1)²), whose line integral (1/2πi)∫ e^((σ−1+iy)²) i dy equals (1/2)π^(−1/2) ≠ 0.
- The order condition is necessary: F(s) = e^((s−1)²) is even with order 0 at 1; the integrand has a triple pole there with residue F″(1)/2 = 1, the rectangle gives I(σ) − I(2 − σ) = 1, the reflection gives I(2 − σ) = −I(σ), and so the line integral is 1/2, not 0.

### 1.6 The truncated Euler-product residue

References: O85 §3.1, formula (3.1.2), and §3.2, formulas (3.2.1)–(3.2.2), p. 315. Built on Tau Ceti `TauCeti.Contour.residue` and the residue theorem.

**Residue of the truncated integrand.** Assume C4, write γ(s) = M^sΓ(s)² and let H be the analytic function on a neighbourhood of 1 equal to γ(s)Ψ(s)/(s − 1) off s = 1 (the removable extension; H(1) = γ(1)Ψ′(1) = MΨ′(1) ≠ 0). For U ≥ 1 let G_U(s) = ∏_(p < U) G_p(s) with the local factors of C2; the cutoff is strict, p < U, the primes p ≥ U forming the complementary tail. Prove the truncated residue formula: with c₁ = H(1) and c₂ = H′(1)/H(1), the residue at s = 1 of d^(s−1)γ(s)Ψ(s)G_U(s)/(s − 1)³ is

```text
c₁ G_U(1) [ log d + G_U′(1)/G_U(1) + c₂ ].
```

Moreover, let Δ be the upward contour that follows the line Re s = 1 except near s = 1, where it detours to the left along the boundary of the rectangle [1 − η, 1] × [−η′, η′], with 0 < η ≤ 1/4 and η′ > 0 small enough that Ψ is holomorphic on the region between Δ and the line Re s = σ (O85 §3.2, figure, p. 315); on Δ one has Re s ≥ 3/4, so no local denominator of C2 vanishes there. Then the integral J(U) = (1/2πi)∫_(Re s = σ) d^(s−1)γΨG_U (s − 1)^(−3) ds equals the residue plus the Δ-integral, and the Δ-integral is bounded by c₃·sup_Δ |G_U|, where c₃ = (1/2π)∫_Δ |γ(s)Ψ(s)(s − 1)^(−3)||ds| depends only on Ψ, M and Δ. Proof: at s = 1 every local denominator is nonzero because |α′_p|/p ≤ p^(−1/2) < 1; the integrand is d^(s−1)H(s)G_U(s)/(s − 1)², a double pole, whose residue is the derivative of d^(s−1)H(s)G_U(s) at 1; then apply the residue theorem to the region between Δ and Re s = σ truncated at height ±T, which contains the single pole s = 1, and let T → ∞ using the strip decay of C4. *Needs:* the fundamental contour identity of §1.5, Tau Ceti `TauCeti.Contour.residue`, `classicalResidueTheorem_nullHomologous`.

**Checks.**

- The residue is independent of how H is presented: replacing H by any analytic function agreeing with γΨ/(s − 1) near 1 gives the same c₁, c₂; evaluating the totalized quotient γΨ/(s − 1) at s = 1 (value 0 in Lean's convention for division by 0) would give c₁ = 0, which is wrong.
- Expanded residue identity: for H, G analytic at 1, the residue of d^(s−1)H(s)G(s)/(s − 1)² at 1 is H(1)G(1)log d + H(1)G′(1) + H′(1)G(1); with H ≡ G ≡ 1 it is log d, a check of the factor d^(s−1).
- The strict cutoff matters when U is prime: with U = 2 the product G_U is empty (G_U ≡ 1) and the residue is c₁(log d + c₂), whereas a non-strict cutoff would include the factor at 2.

### 1.7 The three remainder estimates

References: O85 §3.4, equations (3.4.2)–(3.4.9) and Proposition 1, pp. 316–318. Built on §§0.6, 0.7, 1.4 and 1.6.

**The tail J*.** Under C1 and C2, with d > 4 and U ≥ 1, let G* = G − G_U and J* = (1/2πi)∫_(Re s = σ) d^(s−1)γ(s)Ψ(s)G*(s)(s − 1)^(−3) ds. Prove the three-piece tail bound: |J*| ≤ J₁ + J₂ + J₃ with

```text
J₁ ≤ (M/96)·h²·U^(−1/2)·(|log(dM/U)| + 3)⁴,
J₂ ≤ (2π⁴/3)·M^(3/2)·h·Σ_q a(q)^(−1),
J₃ ≤ 4π²e·M^(3/2)·max(2, log 4M)·h²·d^(−1/2),
```

the sum in J₂ running over the h reduced forms. Proof: shift s by 1/2 and dominate the coefficients of G* by those of (ζ_K(s)/ζ(2s))² from which the pairs with a(q)a(q′) < U removed by the truncation are discarded (C1 and §0.6); split the reduced-form expansion into axial/axial, axial/nonaxial and nonaxial/nonaxial products; replace each nonaxial measure by the comparison measure ν of §0.7 using the positive Mellin comparison §1.4 with its integrated hypothesis, and the measure of ζ(2s) by the pushforward of counting measure along n ↦ n²; evaluate the resulting gamma-kernel integrals by residues for J₁ and by the elementary vertical integrals (3.4.8)–(3.4.9) for J₂, J₃. *Needs:* the reduced-form zeta decomposition of §0.6, nonnegativity of ν in §0.6, `integral_nonaxialCount_le`, the positive Mellin comparison of §1.4, the truncated residue formula of §1.6, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count).

**Checks.**

- Normalization of J₂: with M = N/(4π²) the coefficient (2π⁴/3)M^(3/2) equals πN^(3/2)/12.
- The absolute value in |log(dM/U)| is needed: for dM < U the logarithm is negative and (log(dM/U) + 3)⁴ could be smaller than the true contribution.
- The sum Σ_q a(q)^(−1) at d = 23 is 1 + 1/2 + 1/2 = 2, using the three reduced forms of §0.2.

### 1.8 Oesterlé's effective technical theorem

References: O85 §3.5, Theorem 2 and equations (3.5.1)–(3.5.6), pp. 318–319; §3.6, p. 319. Built on §§0.1, 0.4, 0.6, 1.5–1.7.

**The technical theorem.** Prove `oesterleTechnical`: fix M > 0 and Ψ satisfying the Ψ-part of C1 and C4. There is C > 0, depending only on Ψ and M, such that for every imaginary quadratic field K with d > 4, every G satisfying the G-part of C1 and C2, and every entire F agreeing with the right-half-plane product and satisfying the reflection, vanishing and decay of C3,

```text
C·h ≥ min(1, ∏_{p∈P(d)} |G_p(1)|/(1 + 1/p))·log d.
```

C is independent of K, G and h, and it is effective: it is an explicit function of rational bounds for M, for c₁ and c₂ (the Taylor data of H at 1), for the C4 neighbourhood and for the strip and contour integrals defining c₃. Proof: choose U = (√d/2)^(1/m), where m is the least positive integer with m² + m ≥ h/2, except that h = 4 uses m = 3/2; then at most one prime p ≤ U splits in K, and such a p satisfies p ≥ (d/4)^(1/h) (O85 §3.5, Lemma 1, p. 318, from §0.4 and the small-coefficient sum bound of §0.6); and the largest prime divisor of d exceeds U, using genus theory (§0.1), t ≤ 2m and squarefreeness of d or d/4 (O85 §3.5, Lemma 1); apply the four estimates (3.5.1)–(3.5.4) for the reduced-form sum Σ a(q)^(−1), for |G_U(1)|, for Re(G_U′/G_U)(1) and for sup_Δ |G_U|; combine the residue of §1.6 with J(U) = −J* from §1.5 and the tail bound of §1.7; for d ≥ exp(λh) the error ratio α₅/α₆ is at most 1 + c₇(λ) with α₆ > 0 and c₇(λ) → 0 as λ → ∞, which gives C = max(λ, c₅(1 + c₇(λ))/|c₁|), while for d < exp(λh) the inequality log d < λh holds directly. Every constant in this choice is given by an explicit rational bound; analyticity of Ψ given as an arbitrary function, without such bounds, does not determine C algorithmically. *Needs:* the three-piece tail bound of §1.7, the truncated residue formula of §1.6, the fundamental contour identity of §1.5, the split-prime bound of §0.4, the small-coefficient sum bound of §0.6, the genus divisibility of §0.1.

**Checks.**

- The constant does not depend on G or on K: a version with C depending on d (for instance through U) would be vacuous, since log d/h is what is being bounded.
- h = 4 uses m = 3/2, not the least integer m = 1 with m² + m ≥ 2: genus theory allows t = 3 when h = 4 (2² | 4), and the step t ≤ 2m that puts the largest prime divisor of d above U fails for m = 1.
- When all p ∈ P(d) have |G_p(1)| ≥ 1 + 1/p (for instance P(d) = ∅, t = 1), the minimum is 1 and the conclusion is log d ≤ C·h.

### Examples

- With Ψ ≡ 2, G ≡ 5, d = 2, M = 3: F(1) = 30 and F(2) = d·M²·Ψ(2)·G(2) = 2·9·2·5 = 180, which pins the factors d^(s−1) and M^s.
- The measures δ₁ and (δ_(1/2) + δ_(3/2))/2 illustrate the integrated hypothesis of §1.4 without pointwise domination.
- For the comparison measure ν of §0.7 at d = 23, the Mellin transform at s = 2 is 4π/23.

### Dependencies

Layer 0 (§§0.1, 0.4, 0.6, 0.7); Mathlib (`Complex.Gamma`, `Complex.cpow`, `mellin`, `mellinInv_mellin_eq`, measures, Fubini); Tau Ceti contour integration (`TauCeti.Contour.residue`, `classicalResidueTheorem_nullHomologous`) and the Completed ContourIntegration roadmap.

## Layer 2: two elliptic curves of rank three

Goldfeld's principle needs an L-function with a central zero of order at least three. The zero can be shown to exist only indirectly: a numerical enclosure of L′(1) close to 0 proves nothing, but the Gross–Zagier formula expresses L′(1), times a nonzero twisted central value, as a positive multiple of the height of a rational point, and a point of small height must be torsion. This layer produces the two classical curves, E₁₃₉ of conductor 37·139² (Gross–Zagier) and E₅₀₇₇ of conductor 5077 (Buhler–Gross–Zagier), each with an arithmetic proof of rank three (a complete descent bound and three independent points) and an analytic one (exact vanishing of L′(1) and explicit rational bounds excluding L‴(1) = 0), kept independent of each other.

Standing assumptions for this layer: curves are `WeierstrassCurve ℚ` with integral coefficients; L(E,s) is the entire continuation supplied by EllipticCurveModularity R29.6, agreeing with Σ a_n n^(−s) on Re s > 3/2; heights are ĥ (normalization 2(O)) unless stated; every numerical claim is a stated inequality between rational numbers and explicitly defined real numbers.

### 2.1 The Gross–Zagier curve E₁₃₉

References: GZ86, I, Proposition (7.4), p. 231; O85 §4.3, p. 320; O88 §8, p. 66. Built on Mathlib `WeierstrassCurve` and `WeierstrassCurve.Affine.Equation`.

**The curve.** Define `curve139 : WeierstrassCurve ℚ` with coefficients (a₁, a₂, a₃, a₄, a₆) = (0, −1, 1, −64403, −6220110), the equation Y² + Y = X³ − X² − 64403X − 6220110, and E₃₇ over ℚ with coefficients (0, 1, 1, −3, 1), the equation y² + y = x³ + x² − 3x + 1 of discriminant 37. Their API includes:

- E₁₃₉ has Δ = 37·139⁶ = 266864328286957, and E₃₇ has Δ = 37; both are nonsingular.
- The invariants are c₄(E₁₃₉) = 3091360 = (−139)²·160 and c₆(E₁₃₉) = 5392722952 = (−139)³·(−2008), where (160,−2008) are those of E₃₇. Both have j = 4096000/37.
- Construct a ℚ-isomorphism from E₁₃₉ to the −139 quadratic twist of E₃₇ using `WeierstrassCurve.quadraticTwistOf` and an explicit change of variables.
- The substitution x = (4X + 462)/(−139), y = (8Y + 4)/139² identifies E₁₃₉ with −139y² = x³ + 10x² − 20x + 8, the GZ86 model. Its inverse is X = (−139x − 462)/4, Y = (139²y − 4)/8; extend it to an isomorphism fixing infinity.

The model printed in O88, p. 66, with coefficients (0, −1, 1, −450823, 112971139) and discriminant 37³·139⁶, has j-invariant 1404928000/37³ and is the −139 twist of E₀ : y² + y = x³ + x² − 23x − 50 (discriminant 37³, the conductor-37 curve used in O85 §4.3, p. 320), which lies in the isogeny class of E₃₇. Prove the degree-three isogeny: a ℚ-isogeny of degree three from E₁₃₉ to this displayed O88 model, carrying O to O. Its untwisted kernel is {O, (1,0), (1,−1)} on E₃₇: the chord-and-tangent law gives 2(1,0) = (1,−1), so (1,0) has order three. Apply EllipticCurves Layer 1’s Vélu quotient and twist by −139. Their L-functions and ranks agree by isogeny invariance; their different j-invariants exclude an isomorphism. *Needs:* Mathlib `WeierstrassCurve`, `WeierstrassCurve.Affine.Equation`; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; EllipticCurves Layer 1 (Vélu quotient) and Layer 5 (twists).

**Checks.**

- For E₃₇, Δ = 37; replacing its a₂=1 by −1 changes the discriminant.
- For E₃₇, (c₄,c₆) = (160,−2008); the negative sign of c₆ pins the odd twist exponent.
- For E₃₇, (0,0) is excluded, whereas (1,0) and (1,−1) satisfy y²+y=x³+x²−3x+1; the latter pair gives the nonzero kernel points of the degree-three isogeny. This distinguishes the constant term and the two signs of the kernel.
- a₂ = −1, a₄ = −64403, a₆ = −6220110 (sign errors in the printed sources are common; these are the values of the integral model above).
- (0, 0) is not on E₁₃₉: the right side is −6220110 ≠ 0.
- (−156, 77) is on E₁₃₉: 77² + 77 = 6006 = (−156)³ − (−156)² − 64403·(−156) − 6220110.
- Δ = 37·139⁶ while Δ(E₃₇) = 37: twisting by −139 multiplies the minimal discriminant by 139⁶, and the conductor becomes 37·139² (§2.3); the discriminant is not the conductor.

### 2.2 The Buhler–Gross–Zagier curve E₅₀₇₇

References: BGZ85, equation (2), p. 473, and §2, pp. 475–476; GZ86, I §8, p. 232. Built on Mathlib `WeierstrassCurve`.

**The curve.** Define `curve5077 : WeierstrassCurve ℚ` with coefficients (0, 0, 1, −7, 6), the equation y² + y = x³ − 7x + 6. Its API includes:

- Its discriminant is 5077 and c₄ = 336, so the curve is nonsingular.
- Its affine equation is the displayed plus-y equation.
- The map y ↦ −y identifies it with the minus-y equation y² − y = x³ − 7x + 6 of GZ86 I §8; transport points and heights through this isomorphism.
- The points P₀ = (0,2), P₁ = (1,0), P₂ = (2,0) lie on the plus-y model.

*Needs:* Mathlib `WeierstrassCurve`, `WeierstrassCurve.Affine.Equation`.

**Checks.**

- (0, 2), (1, 0), (2, 0) satisfy y² + y = x³ − 7x + 6 (values 6, 0, 0).
- (0, −2) is not on the plus-y model (4 − 2 = 2 ≠ 6); it is on the minus-y model, where the three generators appear with y negated.
- Δ = 5077 is prime, so E₅₀₇₇ has multiplicative reduction at 5077 and good reduction elsewhere.

### 2.3 Conductors, reduction types and root numbers

References: O85 §4.3, p. 320; BGZ85 §2 and §4, pp. 475 and 477–478; GZ86, I §§7–8, pp. 231–232. Built on EllipticCurves Layer 4, EllipticCurveModularity R29.4, the twist coefficient, conductor, root-number and local Weil–Deligne comparisons of §2.3 and Mathlib's `Nat.Prime`.

**Analytic order and quadratic twists.** Prove the analytic-rank parity adapter: if L is an entire continuation of an elliptic Euler series with positive conductor N and completed reflection Λ(2−s) = wΛ(s), w ∈ {±1}, then `analyticOrderAt L 1 ≠ ⊤` and (−1)^(analyticOrderNatAt L 1) = w. This is the elliptic motivic-normalization adapter to AutomorphicLFunctionsAndLocalFactors AL.5 `central-sign-vanishing`: translate its centre from 1/2 to 1 and supply R29.6's continuation/reflection. The series is nonzero at sufficiently large real s because a₁ = 1; the identity theorem transports the completion identity from Re s > 3/2 to a neighbourhood of 1, where its gamma/conductor factor is analytic and nonzero (O85 §2.1, p. 313; GZ86 I (7.1), p. 231). *Needs:* EllipticCurveModularity R29.6; AutomorphicLFunctionsAndLocalFactors AL.5 `central-sign-vanishing`; Mathlib `analyticOrderAt`.

Prove the twist coefficient comparison, the coprime twist conductor formula, the coprime twist root-number formula: for an elliptic E/ℚ of conductor N and quadratic field discriminant D prime to N, its quadratic twist Eᴰ has a_n(Eᴰ) = χ_D(n)a_n(E) for n ≥ 1, conductor N|D|², and w(Eᴰ) = χ_D(−N)w(E). In the pinned trace/norm constructor the generator (1+√D)/2 has trace 1 and norm (1−D)/4; use `quadraticTwistOf 1 ((1-D)/4)`, whose parameter discriminant is D, rather than confusing D with the constructor's norm argument. The coprimality condition is equivalently that every prime dividing D has local polynomial of degree two. For shared conductor primes prove the local Weil–Deligne twist comparison: at every p, the local Weil–Deligne pair of Eᴰ is V_p(E)⊗χ_(D,p), where V_p = H¹_et(Ē,ℚ_ℓ), ℓ ≠ p, is dual to T_ℓ(E)⊗ℚ_ℓ and uses geometric Frobenius. If A is homological arithmetic Frobenius, arithmetic Frobenius on the dual is A^(−transpose), so geometric Frobenius there is A^transpose; its good characteristic polynomial is X²−a_pX+p. Transport inertia and monodromy through this duality as well. The conductor is its Artin conductor, the Euler polynomial is det(1−Fr_p T | (V_p⊗χ)^(I_p)∩ker N_p), and the root number is its normalized epsilon constant. The invariant/ker-N determinant agrees with the homological arithmetic determinant on inertia coinvariants, as fixed by R29.4. Transport this to Mathlib's local polynomial, including wild inertia at 2 and 3; zero extension χ_D(p)=0 does not replace this local character (O85 §2.2, p. 313; DEL73 §8, (8.12.1)–(8.12.4), p. 572). *Needs:* EllipticCurves Layers 4–5; EllipticCurveModularity R29.4 and R29.6; AutomorphicLFunctionsAndLocalFactors AL.3 local parameter comparison and AL.5 epsilon normalization.

**Checks.**

- D = 1 is the split trivial character and is outside the quadratic-field hypothesis; the trace/norm parameter discriminant must be D, not 4D.
- At a good prime ramified in D the twisted Euler factor is 1 and its conductor exponent is twice the character conductor; a prime unramified in D keeps the coefficient χ_D(p)a_p.
- Twisting twice by the same local quadratic character restores V_p, so a quadratic twist of good reduction can regain its degree-two factor. Additive potentially multiplicative and wild potentially good types must also use the tensor representation, not the coprime conductor formula.
- At the good trace-zero prime 5 of E₃₇, A has characteristic polynomial X²+5. Dualization followed by inversion gives det(1−A^transpose T) = 1+5T²; inversion alone gives 1+T²/5. At its split multiplicative prime 37 the cohomological invariant/ker-N line gives 1−T, agreeing with homological arithmetic coinvariants; homological invariants would give 1−37T. Both identities test the local-polynomial comparison.

**Local data of the two curves.** Prove the local curve data: E₁₃₉ has conductor 37·139² = 714877 and root number −1; E₅₀₇₇ has conductor 5077, nonsplit multiplicative reduction at 5077, good reduction elsewhere, root number −1 and bad Euler factor (1 + 5077^(−s))^(−1). In terms of Mathlib's formal L-functions: the coefficient of 139 in `curve139.LFunction` is 0 (additive reduction) and that of 5077 in `curve5077.LFunction` is −1 (nonsplit). Proof: 37, 139 and 5077 are prime (Mathlib's `norm_num` primality extension decides this); for E₅₀₇₇, Δ = 5077 and c₄ = 336 ≢ 0 mod 5077 give multiplicative reduction, and the node of (2y + 1)² = 4x³ − 28x + 25 mod 5077 is at x = 92 with tangent slopes the square roots of 12·92 = 1104, a non-square mod 5077, so the reduction is nonsplit; the local root number at a nonsplit multiplicative prime is +1 and at ∞ is −1. For E₁₃₉, use the twist description of §2.1: E₃₇ has conductor 37 and root number +1: Δ=37 and c₄=160 show multiplicative reduction, and −c₆=2008≡10=11² mod 37 makes it split, so the local root number is −1 and the archimedean root number is −1, −139 is prime to 37, so the coprime twist conductor formula gives conductor 37·139² and the coprime twist root-number formula gives root number χ_(−139)(−37)·(+1) = χ_(−139)(−1)χ_(−139)(37) = (−1)(+1) = −1, since 37 splits in ℚ(√−139) ((−139/37) = 1). The conductor is the intrinsic (Galois) conductor of EllipticCurveModularity R29.4, matched with Tate's algorithm of EllipticCurves Layer 4 at each bad prime. *Needs:* the twist isomorphism of §2.1, the discriminant computation of §2.2, the c₄ computation of §2.2, EllipticCurves Layer 4 (reduction types and Tate's algorithm), EllipticCurveModularity R29.4 (level = conductor, bad factors), the twist coefficient, conductor, root-number and local Weil–Deligne comparisons of §2.3, Mathlib `Nat.Prime` (`Mathlib.Tactic.NormNum.Prime`).

Prove minimality of the displayed models: each displayed model in §§2.1–2.2 is minimal over ℤ_p for every prime p. Its discriminant valuation is 0, 1 or 6, below 12; passing to an isomorphic integral equation with a smaller discriminant valuation would subtract a positive multiple of 12, by Mathlib `WeierstrassCurve.variableChange_Δ` (`AlgebraicGeometry/EllipticCurve/VariableChange.lean`). Prove the local-polynomial identities: the polynomials at 5, 37 and 7 are respectively 1+5T², 1−T and 1+T+7T², and the scaled model of §2.7 has the same intrinsic polynomial at 7 after minimalization. *Needs:* the discriminant computation of §2.1, the discriminant of E₃₇ in §2.1, the discriminant computation of §2.2; EllipticCurves Layer 4 minimal-model theory; EllipticCurveModularity R29.4 coefficient contract.

**Checks.**

- 714877 = 37·139², and no prime outside {37, 139} divides the conductor of E₁₃₉; in particular 2 is a prime of good reduction because Δ is odd.
- a₃(E₅₀₇₇) = −3 and a₅(E₅₀₇₇) = −4 (from #E(𝔽₃) = 7 and #E(𝔽₅) = 10), and a_p(E₁₃₉) = χ_(−139)(p)a_p(E₃₇) at p = 3, 5, 7, 11, 13 (values −1, 0, −1, 3, −4).
- At 5077 a split node would give the factor (1 − 5077^(−s))^(−1) and local root number −1, hence global root number +1 and even analytic rank: the nonsplit computation is what makes the order odd.

### 2.4 Arithmetic ranks

References: BGZ85 §§1–2, pp. 473–476, especially the height bound and the 2-descent on p. 476; GZ86, I, Proposition (7.4), p. 231. Built on EllipticCurves Layer 6, EffectiveDiophantineMethods §§3.5–3.7, 3.13–3.15, 3.17–3.22, and Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`.

**Mordell–Weil ranks.** Prove the arithmetic rank computations: the ℤ-rank of E₁₃₉(ℚ)/E₁₃₉(ℚ)_tors is 3, and E₅₀₇₇(ℚ) is free of rank 3 with basis P₀ = (0, 2), P₁ = (1, 0), P₂ = (2, 0). Each assertion is the conjunction of a complete descent upper bound and an independence lower bound; neither uses the analytic rank or any part of the conjecture of Birch and Swinnerton-Dyer.

- E₅₀₇₇, torsion: #E(𝔽₃) = 7 and #E(𝔽₅) = 10 have gcd 1, and E(ℚ)_tors injects into both (EllipticCurves Layer 6 at good odd primes), so E(ℚ) is torsion-free.
- E₅₀₇₇, independence: the height matrix (⟨P_i, P_j⟩) has entries approximately 0.9909, 0.6682, 0.7670 on the diagonal and −0.2365, −0.2764, 0.0333 off it, with determinant the regulator 0.41714… (BGZ85, p. 476); rational bounds for these entries (EffectiveDiophantineMethods §3.13, in the same 2(O) normalization) giving a positive lower bound for the determinant prove independence (§3.14 there).
- E₅₀₇₇, upper bound and saturation: a complete 2-descent (EffectiveDiophantineMethods §§3.5–3.7 on EllipticCurves Layer 6) shows that E(ℚ)/2E(ℚ) has 𝔽₂-dimension 3 and that P₀, P₁, P₂ generate it; the height-difference bound (7) of BGZ85, p. 475, and a complete search of the points of small naive height show that O and ±P₀, ±P₁, ±P₂ are the only points with ĥ < 1, so every non-torsion point has ĥ ≥ ĥ(P₁) ≈ 0.6682 > 1/2 (EffectiveDiophantineMethods §3.15); together with torsion-freeness this gives E(ℚ) = ℤP₀ ⊕ ℤP₁ ⊕ ℤP₂ (§3.22 there).
- E₁₃₉, torsion: #E₁₃₉(𝔽₃) = 5 and #E₁₃₉(𝔽₇) = 9 are coprime, so the torsion is trivial.
- E₁₃₉, independence: the integral points Q₁ = (−156, 77), Q₂ = (510, 9660), Q₃ = (1344, 48302) lie on E₁₃₉ (and (350, 3740) = −2Q₂); their height Gram matrix is approximately (4.5803, −0.3583, −0.6590; −0.3583, 1.5516, −0.2874; −0.6590, −0.2874, 2.3720), with determinant about 15.36; rational bounds for the entries giving a positive lower bound for the determinant prove that Q₁, Q₂, Q₃ are independent.
- E₁₃₉, upper bound: the 2-Selmer group of E₁₃₉ over ℚ has 𝔽₂-dimension 3 (a complete 2-descent, EffectiveDiophantineMethods §§3.2–3.7), which bounds the rank by 3. Prove this Selmer dimension by a complete descent with its local-image conditions; the rank assertion is GZ86 I Proposition (7.4), p. 231. The Birch–Swinnerton-Dyer quotient formed from the numerical derivative of §2.12, Ω ≈ 0.29985, the regulator above and the Tamagawa numbers c₃₇ = 1, c₁₃₉ = 4 is approximately 1.000, a consistency Check rather than a descent proof.

*Needs:* the local curve data of §2.3, the three rational points of §2.2, Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`, `WeierstrassCurve.Affine.Point.canonicalHeight`, EllipticCurves Layer 6, EffectiveDiophantineMethods §§3.2–3.7, 3.13–3.15, 3.17–3.22.

**Checks.**

- A nonsingular 3 × 3 height matrix proves only rank ≥ 3; without the descent bound it does not give rank = 3.
- (350, 3740) is not independent of Q₂: 2Q₂ = (350, −3741), the negative of (350, 3740); a Gram matrix that used it with Q₂ would have determinant 0.
- BGZ's heights are for 2(O); the pinned Tau Ceti `canonicalHeight` of P₁ is 0.6682….

### 2.5 The Buhler–Gross–Zagier kernels

References: BGZ85 §4, formulas (12)–(14), pp. 478–479. Built on Mathlib's Lebesgue integral on [1, ∞), `mellinInv` and `Complex.Gamma`.

**The kernels G_r.** For r ∈ ℕ define the real kernel G_r by G₀(x) = e^(−x) and, for r ≥ 1, G_r(x) = (1/(r − 1)!)∫₁^∞ e^(−xy)(log y)^(r−1) dy/y, for x > 0; for x ≤ 0 the value is 0, a convention kept away from every analytic statement. Its API includes:

- For x > 0, G₀(x) = e^(−x); for x ≤ 0, every G_r(x) = 0.
- For x > 0, every G_r(x) is strictly positive.
- For r ≥ 1 and x > 0, G_r′(x) = −G_(r−1)(x)/x; justify differentiation under the integral by a compact-interval dominating function.
- For x > 0, G_r(x) ≤ e^(−x)/x^r, using log y ≤ y − 1 and y = 1 + u.
- For r ≥ 1, x > 0 and c > 0, inverse Mellin transformation of Γ(s)s^(−r) on Re s = c gives G_r(x), as in BGZ85 (13).
- For r ∈ ℕ and x > 0, G_r(x) = P_r(log(1/x)) + Σ_(n≥1)(−1)^(n−r)x^n/(n^r·n!), where P_r is the degree-r residue polynomial at s = 0 of Γ(s)x^(−s)s^(−r). Its coefficients come from Γ(1+s); at r = 0 the constant polynomial is 1, and at r = 1 this gives −γ − log x − Σ_(n≥1)(−x)^n/(n·n!).

*Needs:* Mathlib `MeasureTheory.integral`, `mellinInv`, `Complex.Gamma`, `HasDerivAt`.

**Remainder bounds.** Prove the series remainder bound: for r ≥ 1, x > 0 and every integer K ≥ 0, the truncation of the residue-polynomial series after the term n = K differs from G_r(x) by at most x^(K+1)/((K + 1)^r·(K + 1)!), the first omitted term, as follows. Put E_K(t)=exp(−t)−Σ_(n=0)^K(−t)^n/n!. The remainder is (−1)^r/(r−1)! times ∫₀ˣ E_K(t)(log(x/t))^(r−1)dt/t. Taylor's integral remainder gives E_K a fixed sign and |E_K(t)|≤t^(K+1)/(K+1)!; integrating yields the bound. The decreasing-term argument also works under the sufficient condition K ≥ x. Prove the integral tail bound: for r ≥ 1, x > 0 and Y ≥ e^(r−1), the part ∫_Y^∞ of the defining integral, divided by (r − 1)!, is at most e^(−xY)(log Y)^(r−1)/(xY(r − 1)!), because (log y)^(r−1)/y is nonincreasing on [e^(r−1), ∞). With Mathlib's `Real.exp_bound` and the Taylor coefficients of Γ(1 + s) at 0, these give explicit rational bounds for G_r(x) at rational x, which is how the numerical statements of §2.7 are proved. *Needs:* the residue-polynomial series, the kernel upper bound, Mathlib `Real.exp_bound`.

**Checks.**

- G₀(1) = e^(−1); G₃(0) = 0 and G₁(−1) = 0 by the boundary convention. The positive-argument Checks below also test the r = 3 bound.
- 0 < G₁(1) < e^(−1): G₁(1) = E₁(1) ≈ 0.2194, and the bound e^(−x)/x^r with r = 1 gives e^(−1) ≈ 0.3679.
- G₃(2) ≤ e^(−2)/8 (numerically G₃(2) ≈ 0.00354 against e^(−2)/8 ≈ 0.0169); an asymptotic G_r(x) ∼ x^(−r)e^(−x) is not a bound and is not used.
- At x = 5, r = 1, K = 1 the omitted terms 25/4 and 125/18 initially increase, but the actual error is about 2.812198 < 25/4. This tests the integrated Taylor remainder; increasing terms do not give a counterexample.
- G₁′(x) = −G₀(x)/x = −e^(−x)/x: the derivative relation fixes the normalization by (r − 1)! (with 1/r! instead, G₂′ = −G₁/x would fail by a factor 2).

### 2.6 Odd central derivatives as kernel series

References: BGZ85 §4, formulas (10)–(12), pp. 478–479. Built on §2.5, EllipticCurveModularity R29.4 and R29.6, and Mathlib `mellin`.

**The derivative series.** Prove the central-derivative series: let E/ℚ have conductor N and root number −1, with coefficients a_n and entire L(E,s). For odd r ≥ 1 such that L(E,·) vanishes to order at least r at 1,

```text
L^(r)(E,1) = 2·r!·Σ_{n≥1} (a_n/n)·G_r(2πn/√N),
```

the series converging absolutely. For root number +1 the same argument at r = 0 gives L(E,1) = 2·Σ_(n≥1) (a_n/n)e^(−2πn/√N). Proof: with f(iy) = Σ a_n e^(−2πny), Λ(E,s) = ∫₀^∞ f(iy/√N)y^(s−1)dy (formula of BGZ before (10)); the Fricke relation f(i/(√N y)) = w·y²·f(iy/√N), equivalent to Λ(E,2 − s) = wΛ(E,s), splits the integral at y = 1 into ∫₁^∞ f(iy/√N)(y^(s−1) + w·y^(1−s))dy, which for w = −1 is BGZ's formula (10); differentiate r times at s = 1 under an integrable majorant, expand f and integrate by parts once, using the vanishing of the lower derivatives, to reach the coefficient a_n/n. The lower vanishing is essential: applied at r = 3 before L′(E,1) = 0 is known, the right side computes a different expression. *Needs:* the kernel derivative relation of §2.5, the kernel upper bound of §2.5, EllipticCurveModularity R29.6 (Λ(E,2 − s) = w_E Λ(E,s) and the newform F_E), R29.4 (coefficients), Mathlib `mellin`.

**Tail bound.** Prove the central-derivative tail bound: for N > 0 and r, B ∈ ℕ, with α = 2π/√N and |a_n| ≤ τ(n)√n, the tail Σ_(n>B) satisfies |2·r!·Σ_(n>B) (a_n/n)G_r(αn)| ≤ 2·r!·Σ_(n>B) τ(n)n^(−1/2)e^(−αn)/(αn)^r, and, using τ(n) ≤ 2√n, this is at most 4·r!·e^(−α(B+1))/((α(B + 1))^r(1 − e^(−α))). The coefficient bound comes from |a_p| ≤ 2√p (Hasse, EllipticCurves Layer 3), multiplicativity and the Hecke recursion at good primes, and |a_p| ≤ 1 at bad primes. *Needs:* the central-derivative series, the kernel upper bound of §2.5, Mathlib `ArithmeticFunction.sigma`.

**Checks.**

- The summand carries a_n/n: for E₅₀₇₇ at n = 2 (a₂ = −2) the r = 1 term is 2·(−2/2)·G₁(2α) ≈ −2.6538, taking the partial sum from 3.8748 to 1.2211 as in BGZ's Table 2; without the factor 1/n it would be −5.3075.
- For r = 1 and root number −1 the order is automatically at least 1, so no hypothesis beyond the sign is needed; for r = 3 the hypothesis L′(E,1) = 0 must be supplied (by §2.8 or §2.11).

### 2.7 Central values and derivatives of the explicit curves

References: BGZ85 §4, pp. 478–479, and Table 2, p. 480; GZ86, I §8, p. 232. Built on §§2.3, 2.5 and 2.6.

**Coefficients from minimal reductions.** Specialize EllipticCurveModularity R29.4's coefficient contract to §§2.1–2.3 using minimality of the displayed models in §2.3 and the local curve data of §2.3. At each good p the point count is that of the minimal reduction Ẽ_p, so a_p = p + 1 − #Ẽ_p(𝔽_p). Use the supplier's bad factors, good/bad prime-power recurrences and multiplicativity for all remaining coefficients; `IsNewformOf.coeff_eq` identifies them with the newform coefficients. The −7 twist uses its minimal model at each p, regardless of whether the trace/norm constructor's equation is minimal. *Needs:* minimality of the displayed models in §2.3, the local curve data of §2.3; EllipticCurveModularity R29.4 `IsNewformOf.localPolynomial_eq`, `localPolynomial_completion_eq_padic`, `IsNewformOf.coeff_eq`.

**Numerical inputs before exact vanishing.** Prove the following three bounds by rational enclosures of the finite kernel sums and the central-derivative tail bound of §2.6; exact lower-derivative vanishing is supplied explicitly when r > 1.

- the first-derivative enclosure: |L′(E₅₀₇₇,1)| < 10^(−12). Use B = 400: the geometric tail bound of §2.6 is < 10^(−15), and require the enclosed finite sum to lie within 999·10^(−15) of 0. Their sum is < 10^(−12). BGZ85, p. 479 supplies the comparison value; the rational enclosures are the proof obligation. *Needs:* the local curve data of §2.3 (w = −1), EllipticCurveModularity R29.4 coefficient contract, the central-derivative series of §2.6 at r = 1, the central-derivative tail bound of §2.6, both kernel remainder bounds of §2.5.
- the −7-twist central-value interval: 4 < L(E₅₀₇₇⊗χ_(−7),1) < 5. The conductor is 248773 and root number +1 by the coprime twist conductor formula of §2.3 and the coprime twist root-number formula of §2.3; 5077 splits in ℚ(√−7). With α = 2π/√248773 > 1/80, the sum 2Σ_(n≤2048) (a_nχ_(−7)(n)/n)e^(−αn) and tail 4e^(−2049α)/(1−e^(−α)) < 10^(−8) enclose the value about 4.4768. *Needs:* the twist coefficient comparison of §2.3, the coprime twist conductor formula of §2.3, the coprime twist root-number formula of §2.3, EllipticCurveModularity R29.4 coefficient contract, the r = 0 form of §2.6 and its tail.
- the conductor-37 central-value interval: 72/100 < L(E₃₇,1) < 73/100, using its conductor 37 and root number +1; the r = 0 series gives about 0.72568. *Needs:* the local curve data of §2.3, EllipticCurveModularity R29.4 coefficient contract, the r = 0 form of §2.6 and its tail.

The third-derivative bounds are in §§2.12 and 2.13, after exact first-derivative vanishing.

**Checks.**

- A bound |L′(E,1)| < ε does not prove L′(E,1) = 0; the exact vanishing is §2.8's conclusion, not this subsection's.
- For E₅₀₇₇ the first terms of the series 2·Σ (a_n/n)·G₃(2πn/√N) for L‴(E,1)/3! are those of BGZ's Table 2 (partial sums 4.5335, 2.5635, 1.4644, 1.8080, …, converging to 1.7318…); the series for L‴(E,1) itself, as displayed in §2.6, has partial sums six times as large. A kernel normalized without the factor 1/(r − 1)! would multiply every term by 2.
- Scale E₃₇ by x′ = 49x, y′ = 343y to (0,49,343,−7203,117649). This rationally isomorphic equation reduces modulo 7 to y² = x³, with eight raw projective points, while the minimal E₃₇ reduction has nine. The intrinsic a₇ remains −1 and its polynomial is 1+T+7T² for both equations (the local-polynomial identities of §2.3); applying the good-prime formula to the nonminimal singular equation would give 0. Compute both raw projective point sets to distinguish the reductions.

### 2.8 Exact vanishing from a Heegner height gap

References: GZ86 I §§3–6, (5.1), (6.3)–(6.5), pp. 227–230, and §7, pp. 230–231; BGZ85 §4, p. 479. Built on §§2.3–2.7, ImaginaryQuadraticClassNumber H3.1, EllipticCurveModularity R29.5 and EffectiveDiophantineMethods §3.15.

**Classical Heegner construction.** For an imaginary quadratic K of fundamental discriminant D and N ≥ 1, choose an integral ideal 𝔑 of norm N with additive quotient 𝓞_K/𝔑 ≃ ℤ/N. Define the classical Heegner trace from the CM isogenies ℂ/a → ℂ/a𝔑⁻¹, their points x_a ∈ X₀(N)(H) and the sum of divisor classes x_a−∞ over Cl(K), mapped to an elliptic quotient by a fixed nonconstant parametrisation φ with φ(∞)=O. Its API includes:

- For arithmetic Artin σ_b, prove σ_b(x_a) = x_(b⁻¹a), comparing the inverse with ImaginaryQuadraticClassNumber H3.1 through the CM quotient isogeny.
- The trace is an actual point in E(K).
- Complex conjugation sends P_K to −w_E P_K + h(K)φ(0), where w_E is the elliptic root number and φ(0) is torsion.

Supply the comparison of the Fricke eigenvalue −w_E with conjugation and the cuspidal torsion input (GZ86 I §3, pp. 227–228, and II §1, pp. 234–236; GZ86 I §9, p. 232 for cuspidal torsion). For arbitrary N the cyclic maximal-order construction exists precisely when each p|N either splits, or ramifies and has v_p(N)=1; this condition is separate from the hypotheses of the next formula. *Needs:* ImaginaryQuadraticClassNumber H3.1; IntegralLattices B2; ModularCurves Layer 10 for the prime-level geometric examples and EllipticCurveModularity R29.5 for X₀(N), its cusps and parametrisation at general conductor.

**Checks.**

- For a class b of order three, arithmetic Artin sends x₁ to x_(b⁻¹) and then to x_b; a principal b fixes x_a. This pins the inverse in the CM action before forming the trace.
- N = 37, D = −139: the ideals generated by (3±√−139)/2 have norm 37 and cyclic quotient; h(K)=3 gives three points for each chosen ideal.
- N = 5077, D = −7: 5077 splits and h(K)=1, so the trace consists of one CM point minus ∞.
- N = 27, D = −3: the ideal of norm 27 is 𝔭³, with additive quotient ℤ/9 × ℤ/3; no cyclic degree-27 maximal-order construction exists. At N = 3 the ramified ideal does have cyclic quotient, although the following coprime-discriminant formula excludes it.

**Gross–Zagier with exact constants.** Prove the class-character Gross–Zagier formula: for a normalized weight-two newform f of level N, an odd negative fundamental D prime to N, every p|N split in K, and any character ψ of Cl(K), transported to Gal(H/K) by arithmetic Artin, let c_ψ = Σ_σ ψ(σ)⁻¹(x−∞)^σ ∈ J₀(N)(H) ⊗_ℤ ℂ and let c_(ψ,f) ∈ J₀(N)(H) ⊗_ℤ ℂ be its f-isotypic part, the image under the projection onto the f-eigenspace of the Hecke operators T_m, (m,N)=1, acting on J₀(N)(H) ⊗_ℤ ℂ (GZ86 I §6, p. 230). Here ĥ_H is the Hermitian extension of the 2Θ height of Conventions (GZ86 I (4.3), p. 228). With u = #𝓞_Kˣ/2 and (f,f) = ∫_(Γ₀(N)\ℍ)|f(z)|² dx dy, prove `L′(f,ψ,1) = 8π²(f,f)·ĥ_H(c_{ψ,f})/(h(K)u²√|D|)`. The trace is a sum, not an average. Prove the elliptic Gross–Zagier formula: for a nonconstant elliptic quotient φ:X₀(N)→E, with φ*ω_E=C·2πif(z)dz (so deg φ > 0 and C ≠ 0), the trivial-class-character specialization is `L′(E/K,1) = c·ĥ_K(P_K)`, where `c = 8π²(f,f)/(deg φ·u²√|D|) = ‖ω_E‖²/(C²u²√|D|) > 0`, and ‖ω_E‖² is the positive integral ∫_(E(ℂ))ω_E∧iω̄_E. Include the quotient-polarisation height comparison: for the Albanese map φ_*: J₀(N) → E and its dual φ^∨, φ_*φ^∨ = [deg φ], the f-isotypic part of c is φ^∨φ_*c/deg φ, and ĥ_H(c_f) = ĥ_(E,H)(φ_*c)/deg φ for c ∈ J₀(N)(H); together with ĥ_H = h(K)ĥ_K on E(K); these equalities fix every degree and factor 2 (GZ86 I (6.3)–(6.5), p. 230, and the elliptic application I §7, p. 231). *Needs:* the classical Heegner trace, the Heegner Galois-action law; ModularForms Layer 3 Petersson product; EllipticCurveModularity R29.5; EllipticCurves Layer 6 canonical heights; §2.3 twist comparison.

The base-change factorization gives, without a vanishing hypothesis, `L′(E/K,1) = L′(E,1)L(Eᴰ,1) + L(E,1)L′(Eᴰ,1)`. Use the first summand alone only when L(E,1)=0; §2.11 instead uses L(Eᴰ,1)=0. No formula from GZ86 is asserted for even D or D sharing primes with N.

**Checks.**

- w_E = −1 forces L(E,1)=0, so the first product-rule summand suffices; w_E=+1 by itself does not force it to vanish.
- For rational P and quadratic K, ĥ_K(P)=2ĥ_ℚ(P); averaging the trace by h(K) would divide its height by h(K)² and change the displayed constant.
- For a nonzero integer m, replacing φ by [m]φ multiplies its trace by m and its degree and C² by m²; the displayed formula is unchanged. Positivity alone is insufficient for a uniform numerical lower bound on c across these choices.

**The height-gap principle.** Prove the height-gap principle: from ab=cη, c>0, b≠0, η=0 or η≥δ, and |ab|<cδ, conclude η=0 and a=0. Applied to the preceding formula under L(E,1)=0, a=L′(E,1), b=L(Eᴰ,1), η=ĥ_K(P_K), and a proved height gap δ>0, it makes P_K torsion and gives L′(E,1)=0; the analytic-rank parity adapter of §2.3 gives order at least 3 when w_E=−1. *Needs:* the elliptic Gross–Zagier formula, the analytic-rank parity adapter of §2.3, Tau Ceti canonical-height torsion criterion.

**The quantitative data for E₅₀₇₇.** Put K=ℚ(√−7), choose φ₅₀₇₇ of minimal degree onto this model with φ₅₀₇₇(∞)=O and a Néron differential ω_E. Prove the rational height gap: for every nonzero rational P, ĥ_ℚ(P)≥1/2, by §2.4 and the full-height lower bound of EffectiveDiophantineMethods §3.15. Prove the rational Heegner descent: its trace P_K equals the image of an actual rational point. Indeed the trace-conjugation law gives σP_K=P_K up to torsion; E(K) is torsion-free because the reductions at the inert good primes 3 and 5 have orders 7 over 𝔽₉ and 20 over 𝔽₂₅. Thus the torsion correction is zero and coordinates descend. Prove the positive constant lower bound: for this fixed minimal-degree φ₅₀₇₇ and the displayed differential/height normalizations, `c=‖ω_E‖²/(C²√7)>5·10^(−12)`. Prove the required period enclosure and parametrisation-degree (or C) bound for this choice; the target is quantitative, not merely c>0. Finally prove exact first-derivative vanishing for E₅₀₇₇: |L′|<10^(−12), 4<L(Eᴰ,1)<5, c>5·10^(−12), and δ=1 for ĥ_K from actual rational descent give |L′L(Eᴰ,1)|<cδ; the height-gap principle proves L′=0. *Needs:* the rational Heegner descent, the positive constant lower bound, the rational height gap, the first-derivative enclosure of §2.7, the −7-twist central-value interval of §2.7, the elliptic Gross–Zagier formula, the local curve data of §2.3, the analytic-rank parity adapter of §2.3; EffectiveDiophantineMethods §3.15.

**Checks.**

- A small bound for |L′(E,1)| alone proves nothing; both the twisted nonvanishing and the height gap are used.
- The trace P_K, not the normalized average (1/h_K)P_K, enters the formula the elliptic Gross–Zagier formula; for K = ℚ(√−7), h_K = 1 and the two agree, but the height normalization relative to K (factor 2 for points of E(ℚ)) does not disappear.
- In the pinned Tau Ceti normalization the gap statement is `canonicalHeight P ≥ 1/2` for P ≠ 0 in E₅₀₇₇(ℚ).

### 2.9 The modular unit on X₀(37)

References: GZ83, Corollary 6 and its proof, p. 87. Built on ModularForms (η, Δ = η²⁴, the Ligozat criterion), ModularCurves Layer 10 (X₀(37) over ℚ), and Mathlib `ModularForm.eta` and `ModularForm.discriminant_eq_q_prod`.

**The η-quotient u.** Define u(z) = (η(z)/η(37z))² on the upper half-plane. Prove invariance of the η-quotient: u is invariant under Γ₀(37) (the Ligozat conditions hold: 1·2 + 37·(−2) = −72 ≡ 0 and 37·2 + 1·(−2) = 72 ≡ 0 mod 24, weight 0, and 37^(−2) is a square); the η-quotient q-expansion: u = q^(−3)∏_(n≥1)(1 − qⁿ)²/(1 − q^(37n))², with integer coefficients; and the η-quotient divisor: as a function on X₀(37), u has a pole of order 3 at the cusp ∞, a zero of order 3 at the cusp 0, and no other zeros or poles. By the q-expansion principle u is a rational function on X₀(37) defined over ℚ, of degree 3. Moreover u¹² = Δ(z)/Δ(37z). *Needs:* ModularForms worked examples (η, Δ = η²⁴, Ligozat criterion), ModularCurves Layer 10, Mathlib `ModularForm.eta`, `ModularForm.discriminant_eq_q_prod`, `ModularForm.discriminant_ne_zero`.

**Checks.**

- The order at ∞ is (1/24)(1·2 + 37·(−2)) = −3 and at 0 is (1/24)(37·2 + 1·(−2)) = +3; they sum to 0, as for any function on a compact curve.
- (η(z)/η(37z)) itself (exponents ±1) fails the Ligozat congruences (1 − 37 = −36 ≢ 0 mod 24), so the square is needed.
- The q-expansion begins q^(−3) − 2q^(−2) (from (1 − q)²) and has integer coefficients; its pole order 3 at ∞ is the degree of u as a map X₀(37) → ℙ¹, which is why u − c has exactly three zeros, with multiplicity, in §2.11.

### 2.10 CM values of u at Heegner points of discriminant −139

References: GZ83, Corollary 6 and its proof, p. 87. Built on §§0.2, 2.9 and the class-character Gross–Zagier formula of §2.8.

**The CM relation.** Let K = ℚ(√−139) (h = 3 by §0.2, with reduced forms (1,1,35), (5,±1,7)), H its Hilbert class field, [H:K] = 3, and 𝔫 one of the two ideals of 𝓞_K of norm 37 (37 splits). For each ideal class [a] let x_a ∈ X₀(37)(H) be the Heegner point of the cyclic isogeny ℂ/a → ℂ/a𝔫^(−1) (the class-character Gross–Zagier formula of §2.8). Prove the CM twelfth-power identity: u(x_a)¹² = λ¹², where λ ∈ 𝓞_K, of norm 37, generates the ideal conjugate to 𝔫 (λ is one of (3 ± √−139)/2). Proof: choose a basis adapted to the cyclic inclusion a ⊂ a𝔫^(−1), writing a = ω⟨1, τ⟩ and a𝔫^(−1) = (ω/37)⟨1, 37τ⟩; homogeneity of Δ of weight 12 gives Δ(τ)/Δ(37τ) = 37¹²Δ(a)/Δ(a𝔫^(−1)), and with 𝔫 = (μ), a𝔫^(−1) = μ^(−1)a, so Δ(a𝔫^(−1)) = μ¹²Δ(a) and the quotient is (37/μ)¹² = μ̄¹². Then prove equality of the three CM values: all three values u(x_a) are equal to the same element ±λ of K. Proof: u is defined over ℚ and x_a ∈ X₀(37)(H), so u(x_a) ∈ H and u(x_a) = ζλ with ζ¹² = 1; since K contains neither i nor a primitive cube root of unity, K(i) and K(ζ₃) have degree 2 over K and are not contained in H, so ζ = ±1 and u(x_a) ∈ K; Gal(H/K) permutes the three points x_a (the Heegner Galois-action law of §2.8, §2.8) and fixes u(x_a), so the three values coincide. *Needs:* the η-quotient divisor of §2.9, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count), the class-character Gross–Zagier formula of §2.8 (Heegner points over H and the Galois action), Mathlib `ModularForm.discriminant_eq_q_prod`.

**Checks.**

- 37 = N((3 + √−139)/2) = (9 + 139)/4, and (−139/37) = 1, so 37 splits in K and the Heegner hypothesis of §2.8 holds at N = 37.
- The argument needs the twelfth roots of unity in H, not only the units of K: knowing u(x_a)/λ is a root of unity in H does not place it in K without the degree argument.
- The two choices of 𝔫 give conjugate Heegner points with values ±λ̄ and ±λ; the trace in §2.11 uses one choice.

### 2.11 The conductor-37 Heegner trace vanishes

References: GZ83, Corollary 6, p. 87; GZ86, I, Proposition (7.4), p. 231. Built on §§2.3, 2.7, 2.9, 2.10, the class-character Gross–Zagier formula of §2.8 and EllipticCurveModularity R29.5.

**Vanishing of L′(E₁₃₉,1).** Prove vanishing of the conductor-37 Heegner trace: with K, 𝔫 and x_a as in §2.10, the divisor Σ_([a])(x_a) − 3(∞) on X₀(37) is principal, so the Heegner trace P_K = Σ_([a])(x_a − ∞) is 0 in J₀(37)(K) and its f-isotypic part vanishes for the newform f of E₃₇. Proof: with c the common value of §2.10, u − c has polar divisor 3(∞) (§2.9) and vanishes at the three distinct points x_a, so div(u − c) = Σ(x_a) − 3(∞). Then prove exact first-derivative vanishing for E₁₃₉: L′(E₁₃₉,1) = 0. Proof: f has root number +1 and L(f,1) ≠ 0 (the conductor-37 central-value interval of §2.7, §2.7); by the class-character Gross–Zagier formula of §2.8 for f and K, L′(f/K,1) = L(f,1)·L′(f⊗χ_(−139),1), because L(f⊗χ_(−139),1)=0 by its sign −1. The left side is a positive multiple of the height of the f-isotypic part of P_K, which is 0; f⊗χ_(−139) is the newform of E₁₃₉ (§2.1, §2.3), so L′(E₁₃₉,1) = 0. Through the modular parametrisation of EllipticCurveModularity R29.5 the same vanishing holds on the curve. *Needs:* equality of the three CM values in §2.10, the η-quotient divisor of §2.9, the twist isomorphism of §2.1, the conductor-37 central-value interval of §2.7, the class-character Gross–Zagier formula of §2.8, EllipticCurveModularity R29.5, the twist coefficient comparison of §2.3 and the coprime twist conductor formula of §2.3.

**Checks.**

- The class number of ℚ(√−139) is computed directly from the reduced forms (1,1,35), (5,1,7), (5,−1,7) of §0.2, not taken from the final enumeration of Layer 5 (which depends on this subsection).
- L(f,1) ≠ 0 is needed: if L(f,1) = 0, the Gross–Zagier formula would say nothing about L′(f⊗χ,1).

### 2.12 Gross–Zagier's rank-three example

References: GZ86, I, Proposition (7.4), p. 231. Built on §§2.4, 2.7, 2.11 and the analytic-rank parity adapter of §2.3.

**Third derivative after vanishing.** Prove the third-derivative interval: 1842/100 < L‴(E₁₃₉,1)/3! < 1844/100. With N=714877 and B=6000, enclose the divided third-derivative series 2·Σ (a_n/n)·G₃(2πn/√N), equal to L‴(E₁₃₉,1)/3!, near 18.4294. *Needs:* exact first-derivative vanishing for E₁₃₉ in §2.11, the analytic-rank parity adapter of §2.3 and the local curve data of §2.3 (which give all derivatives of order <3 zero), the central-derivative series of §2.6, the central-derivative tail bound of §2.6, EllipticCurveModularity R29.4 coefficient contract, both kernel remainder bounds of §2.5. This numerical enclosure is a target, not a value printed in GZ86.

For every entire L agreeing with `curve139.LSeries` on Re s > 3/2, the following rank assertion includes `analyticOrderAt L 1 ≠ ⊤` and uses `Module.finrank ℤ curve139.toAffine.PointModTorsion` for the arithmetic rank.

**Rank three for E₁₃₉.** Prove `rankThree_139`: ord_(s=1) L(E₁₃₉,s) = rank E₁₃₉(ℚ) = 3, with conductor 714877. Proof: L′(E₁₃₉,1) = 0 (§2.11) and root number −1 (§2.3) give order at least 3 by the analytic-rank parity adapter of §2.3; the bounds 1842/100 < L‴(E₁₃₉,1)/3! < 1844/100 just established give order exactly 3, and in particular L(E₁₃₉,·) is not identically zero, so the order is finite; the arithmetic rank is §2.4. *Needs:* exact first-derivative vanishing for E₁₃₉ in §2.11, the third-derivative interval, the arithmetic rank computations of §2.4, the local curve data of §2.3, the analytic-rank parity adapter of §2.3.

**Checks.**

- No statement about the Tate–Shafarevich group or the leading coefficient of the conjecture of Birch and Swinnerton-Dyer is made or used.
- The order is finite because a derivative is nonzero; the natural-number analytic order of Mathlib returns 0 for a function vanishing identically, so finiteness is stated separately.

### 2.13 Buhler–Gross–Zagier's rank-three example

References: BGZ85 §§2, 4–5, pp. 476 and 478–481; GZ86, I §8, p. 232. Built on §§2.4, 2.7, 2.8 and the analytic-rank parity adapter of §2.3.

**Third derivative after vanishing.** Prove the third-derivative interval: 173/100 < L‴(E₅₀₇₇,1)/3! < 174/100 (BGZ85 (14), p. 479). *Needs:* exact first-derivative vanishing for E₅₀₇₇ in §2.8, the analytic-rank parity adapter of §2.3 and the local curve data of §2.3 (vanishing below order 3), the central-derivative series of §2.6, the central-derivative tail bound of §2.6, EllipticCurveModularity R29.4 coefficient contract, both kernel remainder bounds of §2.5.

For every entire L agreeing with `curve5077.LSeries` on Re s > 3/2, the following rank assertion includes `analyticOrderAt L 1 ≠ ⊤` and uses `Module.finrank ℤ curve5077.toAffine.PointModTorsion` for the arithmetic rank.

**Rank three for E₅₀₇₇.** Prove `rankThree_5077`: ord_(s=1) L(E₅₀₇₇,s) = rank E₅₀₇₇(ℚ) = 3, with conductor 5077. The preceding targets give L′(E₅₀₇₇,1) = 0 and 173/100 < L‴(E₅₀₇₇,1)/3! < 174/100. The same holds for the minus-y model. Proof: §2.8 gives L′ = 0 and order at least 3; the preceding target gives the bounds for L‴(1)/3!, which exclude 0; §2.4 gives the basis P₀, P₁, P₂. *Needs:* exact first-derivative vanishing for E₅₀₇₇ in §2.8, the third-derivative interval, the arithmetic rank computations of §2.4, the change to the minus-y model of §2.2, the analytic-rank parity adapter of §2.3.

**Checks.**

- 10.38 < L‴(E₅₀₇₇,1) < 10.44 is a statement about the uncompleted L-function after the exact vanishing of L′(1), and it agrees with Ω·R = 1.7318499… of BGZ85, p. 480, times 3! only as a numerical observation, not as an input.
- The minus-y model is the same curve up to the isomorphism y ↦ −y, so no separate proof is needed for it.

### Examples

- E₅₀₇₇: Δ = 5077, basis (0,2), (1,0), (2,0) with regulator 0.41714…, L′(1) = 0 by the height gap with the twist by ℚ(√−7), L‴(1)/6 ≈ 1.73185.
- E₁₃₉: the −139 twist of y² + y = x³ + x² − 3x + 1, Δ = 37·139⁶, conductor 714877, independent points (−156, 77), (510, 9660), (1344, 48302), L′(1) = 0 by the vanishing of the Heegner trace on X₀(37).
- The η-quotient (η(z)/η(37z))² has q-expansion q^(−3) − 2q^(−2) + … and divisor 3(0) − 3(∞) on X₀(37).

### Dependencies

Layer 0 (§0.2 for the class number of ℚ(√−139)); Mathlib (Weierstrass curves and their formal L-functions, η and Δ, Mellin transforms); Tau Ceti (quadratic twists, `PointModTorsion`, `canonicalHeight`); TauCetiRoadmap EllipticCurves Layers 1 and 3–6, ModularForms, ModularCurves Layer 10; EllipticCurveModularity R29.3–R29.6; AutomorphicLFunctionsAndLocalFactors AL.5 `central-sign-vanishing`; ImaginaryQuadraticClassNumber H1.3 and H3.1; EffectiveDiophantineMethods §§0.11, 3.2–3.22.

## Layer 3: uniform logarithmic class-number bounds

For a rational newform f of weight two whose L-function has a central zero of order at least three, put Ψ = L(f)L(f⊗λ) and G = L(f⊗χ_D)/L(f⊗λ), where f⊗λ is the coefficient-wise Liouville twist. Then ΨG = L(f)L(f⊗χ_D), whose completion is Λ(f)Λ(f⊗χ_D)/d, and Ψ has a simple zero at s = 1 coming from the pole of ζ(2s − 1) in the symmetric-square factorization, whatever the order of L(f) at 1. This layer verifies C1–C4 for these data, including every case in which d shares primes with the level, evaluates Oesterlé's constant for E₁₃₉ and E₅₀₇₇, and proves θ(d)·log d ≤ 7000·h for every K and θ(d)·log d ≤ 55·h when 5077 ∤ d.

Standing assumptions for this layer: f is a normalized newform of weight two on Γ₀(N) with rational coefficients a_n, attached to an elliptic curve over ℚ by EllipticCurveModularity R29.3; K is imaginary quadratic with discriminant −d and character χ = χ_(−d). Series are first defined on their common half-plane of absolute convergence, Re s > 3/2, and then continued.

### 3.1 The symmetric-square factorization of the Liouville product

References: O85 §2.3, formulas (2.3.1)–(2.3.3), p. 313. Built on AutomorphicLFunctionsAndLocalFactors AL.3 (`rs-global-poles`, `rs-boundary-nonvanishing`, `automorphic-l-data`, `rs-global-functional-equation`), AnalyticNumberTheoryPartI §§0.23a and 0.33 and Mathlib `riemannZeta_ne_zero_of_one_le_re`.

**The Liouville product and its local factors.** Define L(f⊗λ,s)=Σ λ(n)a_n n^(−s) and Ψ_f=L(f)L(f⊗λ) on Re s > 3/2. Its local-factor API is as follows. Writing X = p^(−s), at good p with α + β = a_p and αβ = p, the factor is `((1−α²X²)(1−β²X²))⁻¹`; at p∥N it is `(1−X²)⁻¹`; at additive p²|N it is 1. A good prime with a_p = 0 has factor `(1+pX²)⁻²` (O85 §2.3, (2.3.1), p. 313). *Needs:* EllipticCurveModularity R29.4; Mathlib `ArithmeticFunction.liouville`.

**Every bad symmetric-square factor.** Use §2.3's dual cohomological V_p with geometric Frobenius, transporting inertia and monodromy along the same duality. Define L(Sym² f,w) at every finite p by `det(1−Fr_p p^(−w) | (Sym² V_p)^{I_p}∩ker N_p)⁻¹`, for the motivic Weil–Deligne pair V_p of the elliptic curve (good Frobenius eigenvalues have absolute value √p). Its local-factor API includes:

- At good p the symmetric-square roots are α², p, β².
- At multiplicative p the sole root is 1.
- At a quadratic twist of good reduction the three good roots of the untwisted representation remain.
- At every other potentially multiplicative or potentially good prime, including wild p = 2,3, use the same inertia/monodromy determinant with all factors retained.

Prove that the local correction

```text
R_p(s) = (1−p^(1−2s)) L_p(Sym² f,2s) / Ψ_{f,p}(s)
```

is 1 at good p, is 1−p^(1−2s) at multiplicative p, and is `((1−α_g²p^(−2s))(1−β_g²p^(−2s)))⁻¹` at an additive quadratic twist of good g. At every bad type it is holomorphic and nonzero on Re s≥1, by the inertia-invariant Frobenius weight bounds. Prove the symmetric-square/Rankin–Selberg comparison: `L(u,π_f×π_f∨)=ζ(u)L(Sym² f,u+1)` with all finite factors, from V⊗V=Sym²V⊕det V and the unitary-to-motivic shift u=w−1. Consequently `L(Sym² f,2s)=ζ(2s−1)Ψ_f(s)∏_{p|N}R_p(s)` (O85 §2.3, pp. 313–314 for the factorization and finite bad corrections; DEL73 §8, (8.12.1)–(8.12.4), p. 572 for the local determinant convention). *Needs:* the local Weil–Deligne twist comparison of §2.3; AutomorphicLFunctionsAndLocalFactors AL.3 local parameter comparison and Rankin–Selberg factors.

**The finite self-pair growth adapter.** Prove finite self-pair polynomial growth: for a unitary cuspidal π of GL₂/ℚ, put A(u)=L(u,π×π∨), the full finite Euler product and its meromorphic continuation. Then u(u−1)A(u) is entire and, on each strip a≤Re u≤b, is bounded by C(1+|Im u|)^k for some C>0 and k∈ℕ. Prove finite order from the completed integral estimates, remove the completed poles at 0 and 1, use absolute convergence to the right and the functional equation with the explicit tensor archimedean gamma factors on the left, and apply Phragmén–Lindelöf. Derive the required Gamma estimates from AnalyticNumberTheoryPartI §0.23a `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral`: for fixed real a ≤ b there are positive constants c,C,T such that, uniformly for a ≤ σ ≤ b and |t| ≥ T, c|t|^(σ−1/2)e^(−π|t|/2) ≤ |Γ(σ+it)| ≤ C|t|^(σ−1/2)e^(−π|t|/2). First use the sector remainder in a positive-real-part strip, then shift back across nonpositive real parts with `Complex.Gamma_add_one`; take T large enough to avoid all shifted poles. Apply the same bounds to each fixed shifted/scaled Gamma argument. In the functional equation the numerator and denominator have equal total archimedean degree, so their exponential factors cancel and the balanced Gamma quotient has polynomial growth. Retain every archimedean factor before dividing; completed boundedness alone does not imply this finite polynomial bound (COG04, Lecture 9 §§3–6, pp. 71–74; DLMF §5.11(i), (5.11.9), and §5.11(ii)). *Needs:* AL.3 `rs-global-poles`, `rs-global-functional-equation`, `automorphic-l-data` and archimedean realization; AnalyticNumberTheoryPartI §0.23a; Mathlib `PhragmenLindelof.vertical_strip` and `Complex.Gamma_add_one`.

**Checks.**

- π×π∨ is the pole case at u=1 and cannot satisfy the entire `IsNicePinned` predicate; u(u−1) removes the two completed polar points before a strip argument.
- A norm-twisted pair can have poles at iσ and 1+iσ. The adapter is for the actual self-pair, not every pair of unitary representations.
- With u=2s−1 and Re s≥1, |Im s|≥1 keeps the divisor u(u−1) away from zero; the polynomial bound for A(2s−1), multiplied by the uniform strip bound |Γ(s)|² ≤ C|Im s|^(2 Re s−1)e^(−π|Im s|) from §0.23a, gives exponential decay. Omitting this finite-function adapter would leave an unjustified gamma division.

**Continuation and the simple zero.** Prove the Liouville-product continuation and simple zero: Ψ_f extends holomorphically to an open neighbourhood of Re s ≥ 1, has a simple zero at s = 1 with Ψ_f′(1) = 2·L(Sym² f, 2)/∏_(p|N) R_p(1) ≠ 0, and M^sΓ(s)²Ψ_f(s) decreases faster than every power of |Im s| on every bounded vertical strip of the half-plane Re s ≥ 1, for every M > 0. Proof: use the symmetric-square/Rankin–Selberg comparison, with the self-dual self-pair π_f × π_f∨, and divide by ζ(w−1); by AL.3 the Rankin–Selberg function is holomorphic on Re w ≥ 2 except for a simple pole at w = 2 and has no zeros there (`rs-global-poles`, `rs-boundary-nonvanishing`), and ζ(w − 1) has a simple pole at w = 2 and no zeros on Re w ≥ 2, so L(Sym² f, ·) is holomorphic and nonzero on Re w ≥ 2, in particular at w = 2; the set where ζ(2s − 1) ≠ 0 is open and contains Re s ≥ 1 minus the pole, which gives the neighbourhood; ζ(2s − 1) ∼ 1/(2(s − 1)) at s = 1 gives the simple zero and the derivative; finite self-pair polynomial growth for the finite Rankin–Selberg function on strips and of 1/ζ near the line Re = 1 (AnalyticNumberTheoryPartI §0.33), against the Gamma strip decay derived above from AnalyticNumberTheoryPartI §0.23a, give the strip decay. The simple zero holds also when ord_(s=1)L(f,s) > 3: it comes from ζ(2s − 1), not from L(f). *Needs:* the Liouville-product local factors, finite self-pair polynomial growth, AL.3 `rs-global-poles`, `rs-boundary-nonvanishing`, AnalyticNumberTheoryPartI §§0.23a and 0.33, Mathlib `riemannZeta_ne_zero_of_one_le_re`.

**Checks.**

- At a good prime the product of the two Euler factors is ((1 − αp^(−s))(1 − βp^(−s))(1 + αp^(−s))(1 + βp^(−s)))^(−1) = ((1 − α²p^(−2s))(1 − β²p^(−2s)))^(−1): the Liouville twist has the factor (1 + αX)(1 + βX), not (1 − αX)(1 + βX).
- At 139 the additive quadratic twist of good E₃₇ has the same Sym² factor as E₃₇, though its original Ψ factor is 1; killing every bad symmetric-square factor would lose this case.
- At the good prime 5 of E₃₇, the trace-zero computation at five states a₅=0 (six points over 𝔽₅), so Ψ has factor `(1+5·5^(−2s))⁻²`, not 1. At an additive prime a_p=0 the factor really is 1.
- For E₅₀₇₇ (N = 5077 prime, a₅₀₇₇ = −1) the correction is R₅₀₇₇(s) = 1 − 5077^(1−2s); omitting it changes Ψ′(1) by the factor 1 − 1/5077.
- L(f⊗λ, s) is a coefficient series, not the L-function of a Dirichlet character: λ is not periodic, and L(f⊗λ) has no functional equation of its own.

### 3.2 Goldfeld's modular analytic system

References: O85 §2.3, formulas (2.3.1)–(2.3.3), p. 313, and §4.1, Proposition 2, pp. 319–320. Built on §§1.2, 3.1, §2.3 (twist coefficients, conductors, root numbers and local Weil–Deligne comparison) and EllipticCurveModularity R29.6.

**The system for coprime discriminants.** Prove the coprime modular analytic system: let f have level N, rational coefficients and ord_(s=1)L(f,s) ≥ 3. For K with gcd(d, N) = 1 and χ(−N) = 1, the data M = N/(4π²), Ψ = Ψ_f and G = L(f⊗χ)/L(f⊗λ) satisfy C1–C4 of §1.2. Proof: C1 for Ψ from |a_n| ≤ τ(n)√n and the factorization of §3.1; C1 for G by comparing local factors with those of (ζ_K(s − 1/2)/ζ(2s − 1))²; C2 with α_p, β_p from the factor of L(f⊗χ) and α′_p, β′_p from that of L(f⊗λ), all of absolute value at most √p; C3 because ΨG = L(f)L(f⊗χ) and its separately supplied continuation F = Λ(f)Λ(f⊗χ)/d agrees with `goldfeldCompletion d M Ψ G` on Re s>3/2 (the completed-product identity of §1.1, with N_χ = Nd² by the coprime twist conductor formula of §2.3), which is entire with root number w(f)w(f⊗χ) = w(f)²χ(−N) = +1 (the coprime twist root-number formula of §2.3) and vanishes to order at least 3 + 0 at 1; C4 by the Liouville-product continuation and simple zero of §3.1. The sign hypothesis χ(−N) = 1 is not automatic from the order of L(f): for χ(−N) = −1 the product has root number −1. *Needs:* the Liouville-product continuation and simple zero of §3.1, the completed-product identity of §1.1, the coprime twist conductor formula of §2.3 and the coprime twist root-number formula of §2.3, EllipticCurveModularity R29.6.

**Checks.**

- At a prime p | d with p ∤ N, G_p(1) = 1 + a_p/p + 1/p, and |a_p| ≤ ⌊2√p⌋ gives G_p(1) ≥ 1 + 1/p − ⌊2√p⌋/p; this is the source of the factor 1 − ⌊2√p⌋/(p + 1) in θ(d) after division by 1 + 1/p.
- For f of E₅₀₇₇ and K = ℚ(√−23): 5077 ≡ 17 mod 23 and 17 is not a square mod 23, so χ(5077) = −1 and χ(−5077) = χ(−1)χ(5077) = 1, and the system applies. For K = ℚ(√−7), χ(5077) = 1 and χ(−5077) = −1: the system does not apply, and the split-prime branch of §3.7 is used instead.

### 3.3 Ramified twist systems

References: O85 §4.2, p. 320, and §4.3, pp. 320–321. Built on §3.2, the local Weil–Deligne twist comparison of §2.3 and the coprime twist root-number formula of §2.3, EllipticCurves Layers 4–5 and AutomorphicLFunctionsAndLocalFactors `local-conductor-test-vector-comparison`.

**Overlapping conductors.** Prove the ramified modular analytic system: let f have rational coefficients, weight two, level N and central order ≥3; let g be its genuine newform twist by χ_D, with w(f)w(g)=+1. Start with Ψ_f. At p|d where f is additive and g regains a nontrivial Euler factor, with its nonzero roots α_i (one for multiplicative, two for good reduction), replace Ψ's factor by `B_p(s)=∏_i(1−α_i²p^(−2s))⁻¹`. Keep Ψ_f at the other primes. Put G=L(f)L(g)/Ψ and M=√(N N_g)/(4π²d). Prove C1–C4 for all local reduction types. The possible corrected Ψ and scales M form a finite list for fixed f because the local quadratic characters at each p|N form a finite set (O85 §§4.2–4.3, pp. 320–321, with the square-supported factor forced by C1; local comparisons use DEL73 §8, (8.12.1)–(8.12.4), p. 572). *Needs:* the local Weil–Deligne twist comparison of §2.3, the coprime modular analytic system of §3.2, the Liouville-product continuation and simple zero of §3.1, the completed-product identity of §1.1; EllipticCurves Layers 4–5; AL.3 local parameter comparison and AL.5 conductor/epsilon normalization.

Prove the ramified local-factor comparison: at a ramified quadratic character, f and g cannot both have nontrivial elliptic local Euler factors. If f has good or multiplicative reduction and g is additive, the original Ψ_f gives G_p=∏_i(1+α_i(f)X); if f is additive and g good or multiplicative, the corrected factor gives G_p=∏_i(1+α_i(g)X); if both are additive, Ψ_p=G_p=1. At unramified χ keep the usual ratio, including the unramified sign. Prove the assertion from the inertia/monodromy representations, with wild inertia retained at p=2,3. These formulas give C2 with zero roots padding the missing factors; |α_i|≤√p gives C1, since Ψ_p is square-supported and G_p is bounded coefficientwise by (1+√pX)² at a ramified prime. C4 follows from the finitely many B_p and their nonvanishing on Re s≥1; C3 is the genuine entire product of modular completions agreeing only on the convergence half-plane. *Needs:* the local Weil–Deligne twist comparison of §2.3, the symmetric-square local-factor comparison of §3.1, the C1 local majorants in §1.2.

**The cases for E₁₃₉.** The four scales remain M=37^α139^β/(4π²), α=1 if 37∤d and α=1/2 if 37|d, β=2 if 139∤d and β=0 if 139|d. When 139|d, write ε=±1 for the primitive product character's unramified value there, and X=139^(−s). The restored twist has polynomial 1+4εX+139X², while the factor of Ψ is

```text
B(s) = ((1−α_g²X²)(1−β_g²X²))⁻¹
     = (1+262X²+19321X⁴)⁻¹,
G_139(s) = 1−4εX+139X²,
B(1)=19321/19584,   B′(1)/B(1)=11 log(139)/408.
```

Thus both signs use the same Ψ and Taylor correction. At 37|d the original multiplicative factor of Ψ remains; G₃₇=1+a₃₇(f)37^(−s). The conductor and sign comparisons include both overlaps together.

**Checks.**

- The coefficient at 139 in B is zero and that at 139² is −262; |−262|≤2·139. The unsquared restored factor would have coefficient −4ε at 139 and fail C1.
- G₁₃₉(1)/(1+1/139)=1−ε/35≥34/35, stronger than the θ factor 1−23/140; both signs are included. ε is the primitive unramified character value, not zero extension at a ramified prime.
- At 37|d the conductor scale has 37-part √(37·37²)/37=√37. At additive potentially multiplicative and wild potentially good primes, the preceding three local branches are determined by inertia/monodromy, not by a good-prime formula.


### 3.4 Oesterlé's constant for the two curves

References: O85 §3 (the construction of C), §4.1 (for M = N/(4π²): c₁ = 2π∏_(p|N)(p/(p − 1)) times the integral of |f(τ)|²·|dτ ∧ dτ̄| over a fundamental domain of Γ₀(N), and c₅ = πN^(3/2)/12), pp. 319–320, and §5.1, p. 321 (the constants 7000 and 55); O88 §9, pp. 66–67 (the consequences). Built on §§1.8, 3.2, 3.3, 2.12, 2.13 and ModularForms Layer 3.

**Petersson normalization.** Prove the Petersson normalization: for every normalized rational weight-two newform f, with (f,f)=∫|f|²dxdy as in §2.8 and the bad factors of §3.1, `L(Sym² f,2)/∏_{p|N}R_p(1)=(8π³/N)(f,f)∏_{p|N}p/(p−1)`. This is the all-factor transport of O85 (2.3.3), p. 313. Consequently at M=N/(4π²), c₁=MΨ_f′(1)=4π(f,f)∏_(p|N)p/(p−1). *Needs:* the symmetric-square/Rankin–Selberg comparison of §3.1; ModularForms Layer 3 Petersson product; O85 §2.3.

**The explicit constants.** Prove the constant-7000 estimate: for f = f₁₃₉ and each local case of §3.3 (the four scales M = 37^α·139^β/(4π²) and, when 139 | d, both signs ε at 139), the conclusion of `oesterleTechnical` holds with C = 7000 for every imaginary quadratic field K in that case for which the system of §3.2 or §3.3 applies. Prove the constant-55 estimate: for f = f₅₀₇₇ and M = 5077/(4π²), the conclusion holds with C = 55 for every K with χ(5077) = −1. Proof: C is the explicit function of §1.8, C = max(λ, (c₅/|c₁|)(1 + c₇(λ))), of the Taylor data c₁ = H(1) = MΨ′(1) and c₂ = H′(1)/H(1), the contour constant c₃ of §1.6 for a fixed admissible indentation, the strip integrals of §1.7 and the choice of λ. Bound each of these by rational numbers: c₁ through the Liouville-product continuation and simple zero of §3.1 and the Petersson normalization; c₂ through the logarithmic derivative of the same factors at 1; c₃ and the strip integrals by explicit integration of γΨ along Δ; then verify the inequality C ≤ 7000 (respectively C ≤ 55) for a chosen λ. For each fixed scale let c₁⁰,c₂⁰ be the Taylor data before restoring the 139 factor. The corrected data are c₁=(19321/19584)c₁⁰ and c₂=c₂⁰+11 log(139)/408. Recompute c₃ by integrating |γΨ_f B| on the chosen indentation; on Re s≥3/4 use |B(s)|≤(1−139^(−1/2))⁻², with denominator positive. The same bound transports every strip integral, and the four scales are substituted separately into c₅=(2π⁴/3)M^(3/2). The targets assert C≤7000 for these corrected data and C≤55 for the unaltered 5077 system; no intermediate values from an unsquared local replacement are inputs. O85 §5.1 states the resulting constants, and establishing rational enclosures for the corrected expression of §1.8 is part of these targets. *Needs:* `oesterleTechnical`, the ramified modular analytic system of §3.3, the coprime modular analytic system of §3.2, the Liouville-product continuation and simple zero of §3.1, `rankThree_139`, `rankThree_5077`, the Petersson normalization of §3.4.

**Checks.**

- Every local case of §3.3 is a separate case of the constant-7000 estimate: a computation covering only the coprime scale 37·139²/(4π²) does not prove the bound for d divisible by 37 or 139.
- At prime d, θ(d)=1 and C≤55 yields log d≤55h. For h=3, p≤e¹⁶⁵<10⁷², so the cutoff uses no strict improvement to the constant.
- For M = N/(4π²), the leading ratio c₅/c₁ of O85 §4.1 has c₅ = (2π⁴/3)M^(3/2) = πN^(3/2)/12; a computation with c₅ = (2π⁴/3)M (wrong power of M) would be off by the factor M^(1/2) ≈ 11.3 for N = 5077.

### 3.5 The discriminant −5077 does not occur

References: O85 §1.1, p. 311, and §5.1, p. 321. Built on §0.1 and Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`.

**Exclusion of −5077.** Prove the discriminant exclusion: no imaginary quadratic field has |disc K| = 5077. Negativity would force disc K = −5077, which is odd with −5077 ≡ 3 mod 4, so it satisfies neither branch of the fundamental-discriminant predicate, contradicting the field-discriminant comparison of §0.1. No class-number hypothesis is needed; consequently gcd(d, 5077) = 1 for every K with d prime, which is how §5.7 applies the coprime bound. *Needs:* the field-discriminant comparison of §0.1.

**Checks.**

- (−5077) mod 4 = 3 and (−5077) mod 8 = 3; `TauCeti.Multiquadratic.IsFundamentalDiscriminant (−5077)` is false (a decidable check).
- +5077 ≡ 1 mod 4 is squarefree and fundamental, the discriminant of the real field ℚ(√5077); the negativity of disc K is what excludes it.

### 3.6 Oesterlé's universal bound

References: O85, Theorem 1, p. 310, and §§4.3, 5.1, pp. 320–321. Built on §§0.3, 0.4, 3.3, 3.4.

**The constant 7000.** Prove `global_7000`: for every imaginary quadratic field K, θ(d)·log d ≤ 7000·h(K). The statement includes d = 3, 4 and every d sharing primes with 37·139. Proof: for f₁₃₉ the sign condition of §3.2 is χ(−37·139²) = χ(−1)χ(37) = −χ(37) = 1 when 139 ∤ d. If 37 splits in K (χ(37) = 1), §0.4 gives log(d/4) ≤ h·log 37, which implies the bound since θ ≤ 1; if 37 is inert (χ(37) = −1), apply §1.8 with the system of §3.2 when 139 ∤ d and with the corrected system of §3.3 when 139 | d; if 37 ramifies, apply §1.8 with the corrected systems of §3.3; in each case use the constant 7000 of §3.4 (the constant-7000 estimate of §3.4); the factor ∏_(p∈P(d)) |G_p(1)|/(1 + 1/p) is at least θ(d) by the local bound of §3.2; the finitely many small d are checked directly. *Needs:* `oesterleTechnical`, the ramified modular analytic system of §3.3, the constant-7000 estimate of §3.4, the split-prime bound of §0.4, the bound θ ≤ 1 of §0.3, `rankThree_139`.

**Checks.**

- For odd h, θ(d) = 1 (§0.3), so the statement reads log d ≤ 7000h; for h = 1, d ≤ e^7000.
- d = 3, 4, 7, 8, 11, 19, 43, 67, 163 (class number one) satisfy log d ≤ log 163 < 6 ≤ 7000.

### 3.7 The improved bound away from 5077

References: O85 §5.1, p. 321; O88 §9, p. 67; GZ86, I §8, bound (8.2), p. 232. Built on §§0.4, 3.2, 3.4, 3.5, 2.13.

**The constant 55.** Prove `coprime_55`: for every imaginary quadratic field K with gcd(d, 5077) = 1, θ(d)·log d ≤ 55·h(K). Proof: χ(5077) ≠ 0 by coprimality. If χ(5077) = 1, 5077 splits and §0.4 gives log(d/4) ≤ h log 5077 < 8.6h; if χ(5077) = −1, then χ(−5077) = χ(−1)χ(5077) = 1, which is the sign condition of §3.2 for N = 5077; apply §1.8 with the system of §3.2 for f₅₀₇₇, M = 5077/(4π²), the nonsplit factor at 5077 and the constant of §3.4 (the constant-55 estimate of §3.4). No bound with 55 is asserted when 5077 | d. *Needs:* the coprime modular analytic system of §3.2, `oesterleTechnical`, the constant-55 estimate of §3.4, the split-prime bound of §0.4, `rankThree_5077`.

**Checks.**

- At h = 3 and prime d ≠ 5077 the bound gives log d ≤ 165, hence d ≤ e¹⁶⁵ < 10⁷².
- The coprimality hypothesis stays in the statement: for d divisible by 5077 the conductor of f₅₀₇₇ ⊗ χ changes and the system of §3.2 does not apply.
- log 5077 ≈ 8.53 < 55, so the split branch is far from the constant.

### Examples

- For f₅₀₇₇ and a field with χ(5077) = −1, the data of §3.2 are M = 5077/(4π²) ≈ 128.6, Ψ = L(f)L(f⊗λ) with the correction 1 − 5077^(1−2s), and G = L(f⊗χ)/L(f⊗λ).
- For f₁₃₉ and 139 | d, the corrected factor of Ψ at 139 is (1+262·139^(−2s)+19321·139^(−4s))^(−1), and M = 37^α/(4π²).
- Class number one fields satisfy log d ≤ log 163 ≈ 5.09, far inside both bounds.

### Dependencies

Layers 0–2 (§§0.3, 0.4, 1.1, 1.2, 1.8, 2.3, 2.12, 2.13); AutomorphicLFunctionsAndLocalFactors AL.3 (Rankin–Selberg poles, boundary nonvanishing, completed integral bounds, functional equation and local parameters) and AL.5 (unramified-source twist conductor and epsilon comparisons); AnalyticNumberTheoryPartI §§0.23a and 0.33; §2.3 (twist coefficients, conductors, root numbers and local Weil–Deligne comparison); EllipticCurveModularity R29.3, R29.4, R29.6; EllipticCurves Layers 4–5; ModularForms Layer 3; Mathlib (`riemannZeta`, `ArithmeticFunction.liouville`).

## Layer 4: explicit constants and effective finiteness

The weighted bounds of Layer 3 are converted into bounds depending only on the number t of ramified primes: θ(d)^(−1) is dominated by a product over the first t − 1 primes, whose logarithm grows like 4√(t/log t). Genus theory bounds t by 1 + log₂ h, and a generous elementary estimate then yields an explicit rational κ(q) with h > κ(q)(log d)^(1−q) for every rational q > 0, and a computable cutoff for each class number. The comparison with Siegel's ineffective bound h ≫_η d^(1/2−η) is recorded without changing either theorem's quantifiers.

Standing assumptions for this layer: p_j = `Nat.nth Nat.Prime j` (p₀ = 2); c ≥ 0 real; t ∈ ℕ; natural subtraction t − 1 is 0 for t = 0.

### 4.1 The prime-product majorant

References: GZ86, I §8, bound (8.2) and the sentence after it, p. 232; O85, Theorem 1, pp. 310–311. Built on Mathlib `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`.

**The majorant C_c(t).** Define the real majorant C_c(t) by C_c(t) = c·∏_(j=0)^(t−2) (p_j + 1)/(p_j + 1 − 2√p_j), the product being empty for t = 0, 1. Each denominator p + 1 − 2√p = (√p − 1)² is positive for p ≥ 2. Its API includes:

- C_c(0) = C_c(1) = c.
- For t ≥ 1, C_c(t+1) = C_c(t)·(p_(t−1)+1)/(p_(t−1)+1−2√p_(t−1)).
- For c > 0 the majorant is positive; for c ≥ 0 it is nondecreasing in t because each factor exceeds 1.

*Needs:* Mathlib `Nat.nth`, `Nat.prime_nth_prime`, `Nat.nth_prime_zero_eq_two`, `Real.sqrt`.

**Checks.**

- C_7000(0) = 7000 and C_55(1) = 55.
- C_55(2) = 55·3/(3 − 2√2) = 165/(3 − 2√2) ≈ 961.7, the factor at p₀ = 2.
- C_55(3) = 165/(3 − 2√2)·4/(4 − 2√3) = 660/((3 − 2√2)(4 − 2√3)); replacing t − 1 by t in the range would give C_55(1) = 165/(3 − 2√2), which would break the prime-discriminant endpoint C_55(1) = 55.

### 4.2 Prime-product domination of the ramified weight

References: O85, Theorem 1 and the factors 1 − ⌊2√p⌋/(p + 1), pp. 310–311; GZ86, I §8, p. 232. Built on §§0.3, 4.1 and Mathlib `Nat.add_two_le_nth_prime`.

**Domination and growth.** Prove weight domination: for d > 1 with t distinct prime factors and c ≥ 0, θ(d)·C_c(t) ≥ c; and the elementary logarithmic growth bound: for c > 0, log C_c(t) ≤ log c + 16√t. Proof: each floor factor satisfies 1 − ⌊2√p⌋/(p + 1) ≥ 1 − 2√p/(p + 1) = (p + 1 − 2√p)/(p + 1); the function p ↦ (p + 1)/(p + 1 − 2√p) = (p + 1)/(√p − 1)² is decreasing for p > 1, so after listing the t − 1 primes of P(d) increasingly, the i-th is at least p_i and its smooth factor is at most that of p_i; this gives θ(d)^(−1) ≤ ∏_(j<t−1)(p_j + 1)/(p_j + 1 − 2√p_j). The floor factors themselves are not monotone (1/3, 1/4, 1/3, 3/8 at 2, 3, 5, 7), so the comparison goes through the smooth factor. For the growth, log((p + 1)/(p + 1 − 2√p)) ≤ 8/√p for p ≥ 2 by elementary calculus, p_j ≥ j + 2, and Σ_(j<t−1) 8/√(j + 2) ≤ 16√t. *Needs:* `ramifiedWeight`, the prime-product majorant of §4.1, Mathlib `Nat.add_two_le_nth_prime`.

**Checks.**

- d = 84: θ(84)·C_c(3) = (1/12)·c·(3/(3 − 2√2))·(4/(4 − 2√3)) ≈ (1/12)·c·17.49·7.46 ≈ 10.9c ≥ c.
- At p = 2 the smooth factor is 3/(3 − 2√2) ≈ 17.49, whose logarithm 2.86 is below 8/√2 ≈ 5.66; no prime number theorem is used.
- A comparison that assumed the floor factors decrease would conclude 1/4 ≥ 1/3 at (3, 5), which is false.

### 4.3 Explicit t-dependent bounds

References: GZ86, I, bound (8.2), p. 232. Built on §§3.6, 3.7, 4.2.

**Bounds in terms of t.** Prove the t-dependent class-number bounds: for every imaginary quadratic field K with t primes dividing d, log d ≤ C_7000(t)·h(K); and if gcd(d, 5077) = 1, log d ≤ C_55(t)·h(K). In particular, for prime d coprime to 5077, log d ≤ 55·h. Proof: multiply the weighted bounds of §§3.6–3.7 by C_c(t)/c and use θ(d)C_c(t) ≥ c; the case t = 1 uses the empty product. *Needs:* `global_7000`, `coprime_55`, weight domination of §4.2.

**Checks.**

- t ≥ 1 for every imaginary quadratic field (d ≥ 3), and C_55(1) = 55 recovers GZ86 (8.2) for prime discriminants.
- The two constants have different domains: C_7000 for all K, C_55 only when 5077 ∤ d.

### 4.4 Prime sums over the first primes

References: GZ86, I §8, the sentence after (8.2), p. 232 (the asymptotic it requires); Tau Ceti's qualitative prime number theorem. Built on Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log` and Mathlib `Nat.nth`.

**Rational-prime specialization.** Prove the rational-prime counting adapter: for every real x, `TauCeti.primeCount ℚ Set.univ x = (Nat.primeCounting ⌊x⌋₊ : ℝ)`. Use `Rat.HeightOneSpectrum.primesEquiv` and `IsIntegralClosure.intEquiv` to identify a prime ideal with (p) in ℤ; its absolute norm is p, so the correspondence preserves the inclusive cutoff. This is the degree-one counting adapter before applying the prime-ideal theorem (the ℚ specialization of the prime number theorem used after GZ86 I (8.2), p. 232). *Needs:* Mathlib `Rat.HeightOneSpectrum.primesEquiv`, `Nat.primeCounting`; Tau Ceti `TauCeti.primeCount_eq_card`.

**The n-th prime and the sum of p^(−1/2).** Prove the n-th-prime asymptotic: p_n ∼ n log n as n → ∞, with p_n = `Nat.nth Nat.Prime n`; and the reciprocal-square-root prime sum asymptotic: Σ_(j<n) p_j^(−1/2) ∼ 2√(n/log n). Proof: invert the prime number theorem π(x) ∼ x/log x at x = p_n, where π(p_n) = n + 1 with zero-based indexing; by partial summation Σ_(p≤x) p^(−1/2) = ∫_(2^−)^x t^(−1/2)dπ(t) ∼ 2√x/log x; substitute x = p_(n−1) ∼ n log n, using log(n log n) ∼ log n. *Needs:* the rational-prime counting adapter; Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log ℚ`; Mathlib `Nat.nth`, `Nat.primeCounting`.

**Checks.**

- At x = 1, 2 and 5/2, the rational-prime-ideal count and π(⌊x⌋₊) are respectively 0, 1 and 1; using a strict cutoff would fail at x = 2.
- Indexing: p₀ = 2, p₁ = 3, p₄ = 11, and π(p_n) = n + 1; an off-by-one in the index does not change the asymptotic but does change every finite check.
- The sum is not ∼ 2√n: Σ_(j<n) p_j^(−1/2) ≤ Σ_(j<n) (j + 2)^(−1/2) ≤ 2√(n + 1), and the extra factor (log n)^(−1/2) is what the prime number theorem contributes.

### 4.5 The asymptotic of the constant

References: GZ86, I §8, the sentence after (8.2), p. 232. Built on §§4.1, 4.4.

**Growth of log C_c(t).** Prove the majorant logarithm asymptotic: for every fixed c > 0, log C_c(t)/(4√(t/log t)) → 1 as t → ∞ through ℕ. Proof: log((p + 1)/(p + 1 − 2√p)) = 2/√p + O(1/p) uniformly for p ≥ 2; sum over j < t − 1 with §4.4 (the omitted last factor and the shift by one are negligible), and bound Σ_(j<t) 1/p_j = O(log log t) as a lower-order term; the constant log c is negligible. *Needs:* the prime-product majorant of §4.1, the reciprocal-square-root prime sum asymptotic of §4.4.

**Checks.**

- The asymptotic does not depend on c (55 or 7000), and it is not used to compute κ: the effective statements of §§4.6–4.8 use only the elementary bound of §4.2.
- log C_c(t) = o(t^(1/2+ε)) for every ε > 0 but is not O(√t/log t): the exponent 1/2 with the factor (log t)^(−1/2) is sharp.

### 4.6 The rational witness κ(q)

References: GZ86, I, Theorem (8.1), p. 232 (an effective constant for every positive loss in the exponent); O85, Theorem 1 and the genus consequence, pp. 310–311. The explicit rational formula is derived here. Built on Mathlib `Rat`, `Int.ceil`.

**The witness.** Define `effectiveKappa (q : ℚ) : ℚ` by κ(q) = 0 for q ≤ 0, κ(q) = 1/2 for q ≥ 1, and κ(q) = 2^(−(46 + ⌈256(1 − q)/q⌉)) for 0 < q < 1. It is computed by exact rational comparison, ceiling and integer powers, with no analytic limit or real-number oracle. Its API includes:

- For q ≤ 0 the value is 0; for q ≥ 1 it is 1/2.
- For 0 < q < 1 the value is the displayed ceiling formula.
- For q > 0 the value is strictly positive.
- It is nondecreasing on (0,∞): the ceiling decreases with q, and 2^(−46) < 1/2 at the jump to q = 1.

The exponent comes from log C_7000(t) ≤ log 7000 + 16√t (§4.2), t ≤ 1 + log₂ h (§0.1), 16√(u/log 2) ≤ δu + 64/(δ log 2) with u = log h and δ = q/(1 − q), log 2 ≥ 1/2, e^x ≤ 2^(2x) for x ≥ 0 and 7000 < 2¹³, which together give C_7000(t) < 2^(45+⌈256/δ⌉)·h^δ; one more factor 2 makes the final inequality strict. *Needs:* Mathlib `Int.ceil`.

**Checks.**

- κ(0) = 0 and κ(1) = 1/2.
- κ(1/2) = 2^(−302): ⌈256·(1/2)/(1/2)⌉ = 256 and 46 + 256 = 302.
- κ(1/4) = 2^(−814): ⌈256·(3/4)/(1/4)⌉ = 768.

### 4.7 The effective logarithmic class-number theorem

References: GZ86, I, Theorem (8.1), p. 232. Built on §§0.1, 4.2, 4.3, 4.6.

**The effective bound.** Prove `effectiveLogarithmic_bound`: for every imaginary quadratic field K and every rational q > 0, h(K) > κ(q)·(log d)^(1−q); and for every real ε ≥ q, h(K) > κ(q)·(log d)^(1−ε). So κ(q) is a uniform effective constant for every exponent loss at least q, and a real ε is handled by supplying a rational 0 < q ≤ ε. Proof: for 0 < q < 1 put u = log h and δ = q/(1 − q); genus theory gives t ≤ 1 + u/log 2, so C_7000(t) < 2^(45+⌈256/δ⌉)h^δ (§4.6); with log d ≤ C_7000(t)h (§4.3), h^(1+δ) > 2^(−(45+⌈256/δ⌉))log d; raise to the power 1/(1 + δ) = 1 − q and use the extra factor 2 for strictness. For q ≥ 1 use h ≥ 1 and κ = 1/2. Since d ≥ 3, log d > 1, so (log d)^(1−ε) ≤ (log d)^(1−q) for ε ≥ q. *Needs:* `effectiveKappa`, the t-dependent class-number bounds of §4.3, the elementary logarithmic growth bound of §4.2, the genus divisibility of §0.1, Mathlib `NumberField.classNumber_pos`.

**Checks.**

- At q = 1/2: h > 2^(−302)(log d)^(1/2); no Siegel zero, no generalized Riemann hypothesis and no unknown constant enters.
- Replacing κ(q) by an unspecified "effectively computable" constant gives a weaker statement; the quantitative content here includes the displayed rational function.
- For q ≥ 1, (log d)^(1−q) ≤ 1 because log d > 1, so κ(q)(log d)^(1−q) ≤ 1/2 < 1 ≤ h: the case is trivial but must be covered for the statement to hold for every rational q > 0.

### 4.8 Effective finiteness for a fixed class number

References: O85 §3.6, p. 319; GZ86, I §8, p. 232. Built on §§0.2, 4.7.

**A computable cutoff.** Prove `effective_cutoff`: if h(K) = H ≥ 1, then d < exp(2^604·H²) and d < B(H) := 2^(2^605·H²); consequently the imaginary quadratic fields of class number H are among the finitely many fundamental discriminants −d with d < B(H), and listing the reduced forms of §0.2 for each such d decides the list. Proof: square the case q = 1/2 of §4.7, log d < 2^604H², and use e^x ≤ 4^x. The bound is deliberately enormous; it expresses effectivity, not practicality. *Needs:* `effectiveLogarithmic_bound`, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count).

**Checks.**

- B(1) = 2^(2^605) is a natural number given by an explicit formula; its decimal expansion is not needed to decide d < B(1).
- The cutoff concerns d = |disc K| with K imaginary quadratic; real quadratic fields are outside the statement.

### 4.9 Effective logarithmic versus ineffective power bounds

References: G77 §1, p. 219; O85, Introduction, pp. 309–310; AnalyticNumberTheoryPartI §0.9 and ImaginaryQuadraticClassNumber H2.4.

**Comparison.** Record the comparison with Siegel’s bound: Siegel's theorem (ImaginaryQuadraticClassNumber H2.4: for every η > 0 there is c_η > 0 with h ≥ c_η d^(1/2−η), the proof giving no procedure for c_η) and §4.7 hold together, with their quantifiers unchanged: §4.7 provides an explicit rational κ(q) and a weaker growth (log d)^(1−q); Siegel provides the stronger growth d^(1/2−η) with an existential constant. Neither implies an effective form of the other. The class-number value L(1, χ_D) = πh/(u√d) (ImaginaryQuadraticClassNumber H2.2) translates both into lower bounds for L(1, χ_D). *Needs:* `effectiveLogarithmic_bound`, AnalyticNumberTheoryPartI §0.9; ImaginaryQuadraticClassNumber H2.2 and H2.4.

**Checks.**

- For d = 907, h = 3: §4.7 at q = 1/2 asks only 3 > 2^(−302)·(log 907)^(1/2) ≈ 2^(−302)·2.61, while L(1, χ_(−907)) = 3π/√907 ≈ 0.313 by ImaginaryQuadraticClassNumber H2.2.
- The comparison asserts no implication: an effective c_η does not follow from §4.7, and §4.7 does not follow from Siegel's theorem.

### Examples

- C_55(1) = 55, C_55(2) = 165/(3 − 2√2) ≈ 961.7, C_7000(3) ≈ 7000·17.49·7.46.
- κ(1/2) = 2^(−302), giving h > 2^(−302)√(log d) and d < 2^(2^605·H²) for class number H.
- p₄ = 11 and Σ_(j<5) p_j^(−1/2) = 2^(−1/2) + 3^(−1/2) + 5^(−1/2) + 7^(−1/2) + 11^(−1/2) ≈ 2.41, against 2√(5/log 5) ≈ 3.52: the asymptotic is approached slowly.

### Dependencies

Layers 0 and 3 (§§0.1, 0.2, 0.3, 3.6, 3.7); Mathlib (`Nat.nth`, `Nat.primeCounting`, `Int.ceil`, `NumberField.classNumber_pos`); Tau Ceti `TauCeti.primeCount_univ_isEquivalent_div_log`; AnalyticNumberTheoryPartI §0.9; ImaginaryQuadraticClassNumber H2.2 and H2.4.

## Layer 5: the sixteen fields of class number three

Class number three forces a prime discriminant −p with p ≡ 3 mod 4, so θ = 1 and the bound of §3.7 gives log p ≤ 165, that is p < 10⁷². Two independent exclusion computations remove the range 907 < p < 10⁷²: Montgomery–Weinberger's phase argument at zeros of three auxiliary L-functions covers 10¹² ≤ p ≤ 10²⁵⁰⁰, and the least primes with prescribed quadratic-character patterns, combined with the split-prime obstruction of §0.4, cover 907 < p < 10¹². Below 907 the reduced forms are enumerated.

Standing assumptions for this layer: K is imaginary quadratic with h(K) = 3 where stated; for k > 0 with −k a fundamental discriminant, χ_(−k) is the primitive real character of conductor k attached to ℚ(√−k), odd (χ(−1) = −1), with values (−k/q) at odd primes q and the Kronecker value at 2.

### 5.1 Class number three forces a prime discriminant

References: GZ86, I §8, p. 232 (genus divisibility); LLS70, pp. 445–446. Built on §§0.1, 0.2.

**Reduction to prime discriminants.** Prove the prime-discriminant reduction: if h(K) = 3, then disc K = −p for a prime p ≡ 3 mod 4; in particular t = 1 and θ(p) = 1. Proof: 3 is odd, so 2^(t−1) | 3 forces t = 1 (§0.1); by the one-prime classification of §0.1, disc K ∈ {−4, −8} or disc K = −p with p ≡ 3 mod 4; the reduced forms of discriminants −4 and −8 are (1,0,1) and (1,0,2) only, so those fields have h = 1. Moreover, if p ≡ 7 mod 8 then 2 splits and §0.4 gives p ≤ 4·2³ = 32. *Needs:* the genus divisibility of §0.1, the one-prime classification of §0.1, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count), the split-prime bound of §0.4, the prime-power value θ(p^k) = 1 of §0.3.

**Checks.**

- −3 is a fundamental discriminant with h = 1; −243 = −3⁵ is not a field discriminant and is outside the statement.
- p = 23 and p = 31 are the two class-number-three primes ≡ 7 mod 8, both below 32.

### 5.2 Hardy functions of odd real characters

References: MW74 §5, the approximate functional equation and the gamma factor for odd characters, pp. 539–540; DLMF §5.11, Stirling's series with the error bounds of §5.11(ii). Built on Mathlib `DirichletCharacter.LFunction`, `Complex.Gamma` and `Complex.log`.

**The completed function and its Hardy function.** For an odd primitive real character χ of conductor k, Λ(s, χ) = (k/π)^((s+1)/2)Γ((s + 1)/2)L(s, χ) is entire and satisfies Λ(1 − s, χ) = Λ(s, χ) (the root number of a real primitive character is 1). Define the Hardy function Z_χ(t) = e^(iϑ_χ(t))L(1/2 + it, χ), where ϑ_χ(t) is the continuous real argument of (k/π)^(it/2)Γ((3/2 + it)/2) with ϑ_χ(0) = 0. Prove the reality and zero comparison: Z_χ is real-valued and continuous on ℝ, and Z_χ(t) = 0 exactly when L(1/2 + it, χ) = 0. Prove the phase and Stirling remainder: ϑ_χ(t) = (t/2)·log(k/π) + Im log Γ((3/2 + it)/2), with log Γ the branch continuous along the vertical line and real on the real axis, and for every integer J ≥ 1 the truncation of Stirling's series for log Γ((3/2 + it)/2) after J terms has error at most the explicit bound of DLMF §5.11(ii) (the first omitted term times a factor depending only on the argument of (3/2 + it)/2). Prove the Hardy-function expansion: Z_χ(t) is given by the two rapidly convergent series of MW74 (8), p. 539 (Lavrik's form, with incomplete gamma functions), at s = 1/2 + it; truncating each after B terms leaves an error bounded by an explicit tail. Together these give explicit rational bounds for Z_χ(t) at rational t, which is how the sign statements of §5.3 are proved. *Needs:* Mathlib `DirichletCharacter.LFunction`, `Complex.Gamma`, ImaginaryQuadraticClassNumber H2.1 (primitivity and parity of χ_(−k)).

**Checks.**

- For an odd character the gamma factor is Γ((s + 1)/2), not Γ(s/2); with Γ(s/2), Λ(1 − s) = Λ(s) fails and the phase ϑ_χ is wrong by arg((1/2 + it)/2)-type terms, so sign changes of the resulting function need not be zeros.
- Z_χ(0) = L(1/2, χ) is real; for χ = χ_(−3) it is about 0.4808 > 0.
- Bounds for Z_χ(t) that straddle 0 say nothing about the sign; only one-sided bounds (an upper bound below 0 or a lower bound above 0) are used.

### 5.3 The Montgomery–Weinberger zeros

References: MW74, Table I, p. 537, and §5, pp. 539–542. Built on §5.2, ImaginaryQuadraticClassNumber H2.1 and Mathlib `Nat.Prime`.

**Three zeros on the critical line.** Prove the three zero brackets: for k = 17923, 115147, 123204 the character χ_(−k) has a zero 1/2 + iγ_k of L(s, χ_(−k)) with γ₁₇₉₂₃ ∈ [30985/10⁶, 30987/10⁶], γ₁₁₅₁₄₇ ∈ [3157/10⁶, 3159/10⁶] and γ₁₂₃₂₀₄ ∈ [10649/10⁶, 10651/10⁶]. Proof: −17923, −115147 and −123204 are fundamental discriminants (17923 is prime, 115147 = 113·1019, 123204 = 4·3·10267 with 10267 prime; −17923 ≡ −115147 ≡ 1 mod 4 and −123204 = 4·(−30801) with −30801 ≡ 3 mod 4 squarefree), so χ_(−k) is primitive of conductor k and odd; prove opposite strict signs of Z_χ at the two rational endpoints with the explicit bounds of §5.2 and apply the intermediate value theorem to the continuous real Z_χ. The statement asserts existence of a zero in each bracket, not that it is the lowest zero, not simplicity, and nothing about the generalized Riemann hypothesis; the brackets are refined as far as the phase inequalities of §5.4 require, and Table I of MW74 supplies only starting approximations. *Needs:* the reality and zero comparison of §5.2, the phase and Stirling remainder of §5.2, the Hardy-function expansion of §5.2, Mathlib `Nat.Prime` (primality of 17923, 113, 1019 and 10267 by `norm_num`), `legendreSym`, `ZMod.χ₈`.

**Checks.**

- χ_(−17923)(−1) = −1 and χ_(−17923)(3) = (−17923/3) = −1 (17923 ≡ 1 mod 3); using +17923 instead would give (17923/3) = +1.
- The values at 2 are χ_(−17923)(2) = −1, χ_(−115147)(2) = −1 (−17923 ≡ −115147 ≡ 5 mod 8) and χ_(−123204)(2) = 0 (even discriminant); a Legendre symbol at 2 is not defined and cannot replace these.
- A small value of |L(1/2 + iγ, χ)| at a single point does not prove a zero; the sign change of the real Z_χ does.

### 5.4 The Montgomery–Weinberger exclusion

References: MW74, Theorem, p. 530; §§2–4, Lemmas 1–9, pp. 530–539; §5, pp. 539–542. Built on §§0.2, 0.4, 5.1, 5.3 and ImaginaryQuadraticClassNumber H2.1.

**No class number three for 10¹² ≤ d ≤ 10²⁵⁰⁰.** Prove `montgomeryWeinberger`: no imaginary quadratic field with 10¹² ≤ d ≤ 10²⁵⁰⁰ has class number 3. Proof: by §5.1, d = p is prime, so gcd(p, k) = 1 for the three auxiliary conductors. MW's Lemma 1 (from the Epstein zeta functions of the reduced forms) writes (k√p/2π)^(s−1/2)Γ(s)L(s, χ_(−k))L(s, χ_(−k)χ_(−p)) as T(s) + T(1 − s) + U(s), where T(s) involves ζ(2s), the finite product ∏_(q|k)(1 − q^(−2s)) and the sum A(s) = Σ_Q χ_(−k)(a)a^(−s) over the three reduced forms Q = (a, b, c) of discriminant −p, and U(s) is an explicit series of Bessel functions. At s = 1/2 + iγ_k the left side vanishes, which gives M(γ_k)·|sin φ(γ_k)| ≤ γ_k·E(γ_k) with the amplitude M, phase φ and error E of MW (3)–(5). For h = 3 the two non-principal reduced forms have a ≥ (p/4)^(1/3) (MW Lemma 3, the norm form of §0.4), which with Lemma 4 bounds M from below; Lemma 5 shows φ(t) = t(C + log(k√p/8π)) up to explicit terms of order t³ and t·Σ_(q|k) log q/(q − 1), C being Euler's constant (every log-gamma term is kept); Lemmas 6–9 bound E. Hence φ(γ_k) lies within an explicit distance of a multiple of π, which confines log p to short windows spaced about 2π/γ_k apart. Verify, with explicit rational bounds and monotonicity of the phase on each subinterval, that the windows avoid the stated ranges: k = 17923 covers 10¹² ≤ p ≤ 10⁵², k = 115147 covers 10⁵² ≤ p ≤ 10²⁵⁰⁰ except the windows 10⁸⁵⁰ ≤ p ≤ 10⁸⁶⁰ and 10¹⁷⁰⁵ ≤ p ≤ 10¹⁷³⁵, and k = 123204 covers both windows; the closed intervals overlap at their endpoints. Only the existence of the three zeros is used. *Needs:* the three zero brackets of §5.3, the prime-discriminant reduction of §5.1, the split-prime bound of §0.4, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count), ImaginaryQuadraticClassNumber H2.1.

**Checks.**

- The theorem says nothing about 907 < d < 10¹²; that range is §5.6's, and MW's introduction refers to the earlier computation for it.
- Point evaluations of the phase at sample values of p do not prove a bound on an interval; the proof uses monotonicity on each subinterval.

### 5.5 Least primes with a prescribed quadratic-character pattern

References: LLS70, the prescribed-character searches and tables, pp. 433–444, and Table III, p. 440. Built on ImaginaryQuadraticClassNumber H2.1 and Mathlib `legendreSym` and `Nat.Prime`.

**Inert patterns.** Define the x-inert-prime condition by the following condition for all natural x, including x < 2: a prime p is x-inert when p ≡ 3 mod 8 and (−p/q) = −1 for every odd prime q ≤ x; for x ≥ 2 and p ≡ 3 mod 4 these are exactly the primes in which every prime q ≤ x is inert in ℚ(√−p), the condition at 2 being the Kronecker value χ_(−p)(2) = −1. Prove that the least 43-inert prime is 1333963, the least 67-inert prime is 51599563 and the least 163-inert prime is 1432817816347 (LLS70, Table III, p. 440, column of least prime solutions, where the condition is written (N/p_i) = −(−1/p_i) with N ≡ 3 mod 8). Its API includes:

- If x ≤ y and p is y-inert, it is x-inert.
- Every x-inert p is prime and satisfies p ≡ 3 mod 8.
- For each odd prime q ≤ x, the symbol (−p/q) is −1.

Each minimum is a finite statement: membership of the stated prime, and the absence of a smaller one, which a sieve over residue classes modulo the products of the small primes establishes. *Needs:* Mathlib `legendreSym`, `ZMod.χ₈`, `Nat.Prime`, ImaginaryQuadraticClassNumber H2.1 (the splitting of q in ℚ(√−p) read off from χ_(−p)(q)).

**Checks.**

- the 0-inert condition at p = 3 holds by the small-x convention, while the 3-inert condition at p = 3 fails because (−3/3)=0.
- The condition at 2 is p ≡ 3 mod 8: a pattern that only asked p ≡ 3 mod 4 would admit p ≡ 7 mod 8, where 2 splits.
- 1333963 is 43-inert and 47-inert (Table III lists it for both 43 and 47), while the least 41-inert prime is 222643; the least integer N ≡ 3 mod 8 with the 43-pattern is the composite 77683 = 131·593, so the statement must ask for primes.
- The thresholds 1333963 and 51599563 can be checked by a direct search of the primes p ≡ 3 mod 8 below them; 1432817816347 needs the residue-class sieve.

### 5.6 The small-range exclusion

References: LLS70, the class number three application, pp. 445–447, and Table III, p. 440. Built on §§0.2, 0.4, 5.1, 5.5.

**No class number three for 907 < d < 10¹².** Prove the small-range exclusion: no imaginary quadratic field with 907 < d < 10¹² has class number 3. Proof: by §5.1, d = p is a prime ≡ 3 mod 8 (p > 32); for 907 < p ≤ 318028 = 4·43³ enumerate the reduced forms of §0.2 and check h ≠ 3 directly; for p > 318028, §0.4 forces every prime q ≤ 43 to be inert, and the least-prime theorem of §5.5 says that the least such prime is 1333963; since 4·67³ = 1203052 < 1333963, every q ≤ 67 is inert, and the least 67-inert prime of §5.5 says the least such prime is 51599563; since 4·163³ = 17322988 < 51599563, every q ≤ 163 is inert, and the least 163-inert prime of §5.5 says the least such prime is 1432817816347 > 10¹². The longer iteration of LLS70 with larger patterns is not needed for this range. *Needs:* the prime-discriminant reduction of §5.1, the split-prime bound of §0.4, ImaginaryQuadraticClassNumber H1.3 (unweighted reduced-form count), the least 43-inert prime of §5.5, the least 67-inert prime of §5.5, the least 163-inert prime of §5.5.

**Checks.**

- 4·43³ = 318028, 4·67³ = 1203052, 4·163³ = 17322988 and 1432817816347 > 10¹² are exact integer facts used in the chain.
- The thresholds 1333963, 51599563 and 1432817816347 are least primes with the 43-, 67- and 163-patterns (LLS70, Table III); the least integers with the patterns may differ, and only primes matter here.

### 5.7 The cutoff d ≤ 907

References: GZ86, I §8, p. 232; O88 §9, p. 67. Built on §§3.5, 3.7, 5.1, 5.4, 5.6.

**The cutoff.** Prove the discriminant cutoff: if h(K) = 3 then d ≤ 907. Proof: by §5.1, d = p is prime with θ = 1; by §3.5, p ≠ 5077, so gcd(p, 5077) = 1 and §3.7 gives log p ≤ 165; hence p≤e¹⁶⁵<10⁷² ≤ 10²⁵⁰⁰; split p > 907 into p < 10¹² (§5.6) and 10¹² ≤ p ≤ 10²⁵⁰⁰ (§5.4). *Needs:* the prime-discriminant reduction of §5.1, the discriminant exclusion of §3.5, `coprime_55`, the small-range exclusion of §5.6, `montgomeryWeinberger`, Mathlib `Real.exp_one_lt_d9` (for e¹⁶⁵ < 10⁷²).

**Checks.**

- 72·log 10 ≈ 165.78 > 165: from e < 2.7182818286 (`Real.exp_one_lt_d9`) and the exact rational inequality 2.7182818286¹⁶⁵ < 10⁷² (165·log₁₀ 2.7182818286 ≈ 71.66).
- The analytic bound alone gives only p < 10⁷²; both exclusion computations are needed to reach 907.

### 5.8 The sixteen discriminants

References: GZ86, I §8, final paragraph, p. 232; LLS70, pp. 445–447; O85, Introduction, p. 309. Built on §§0.2, 5.7.

**The list.** Define `classThreeDiscriminants : Finset ℤ` as the set below. Its API includes:

- The finite set has cardinality sixteen.
- Membership is equivalent to the sixteen displayed alternatives.
- Every member is negative.

Prove `classThree_enumeration`: for every imaginary quadratic field K, h(K) = 3 if and only if disc K ∈ {−23, −31, −59, −83, −107, −139, −211, −283, −307, −331, −379, −499, −547, −643, −883, −907}. All sixteen are negative fundamental discriminants, and the largest |disc K| is 907, attained by ℚ(√−907). Proof: by §5.7 it suffices to treat d ≤ 907; for each negative fundamental discriminant −d with d ≤ 907 count the reduced forms of §0.2 (an exact finite computation), and compare with the list; for each listed d, ImaginaryQuadraticClassNumber H1.1 constructs ℚ(√−d), and H1.2's integral-basis/discriminant transport gives discriminant −d because d is squarefree and −d ≡ 1 mod 4. The one-way field-discriminant comparison of §0.1 filters discriminants of an already given K. *Needs:* the discriminant cutoff of §5.7, ImaginaryQuadraticClassNumber H1.1–H1.2 (model construction and discriminant transport), H1.3 (unweighted reduced-form count), the field-discriminant comparison of §0.1 (only the forward filter), Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`.

**Checks.**

- The list has cardinality 16, contains −907, and excludes −163 (which has class number one); an endpoint-only or odd-prime-only list fails these tests.
- d = 907: the reduced forms are (1,1,227), (13,9,19), (13,−9,19), so h = 3.
- d = 23 and d = 31 are the members ≡ 7 mod 8; the other fourteen are ≡ 3 mod 8.
- −243 is rejected by the fundamental-discriminant filter although b² − 4ac = −243 has reduced forms.

### Examples

- ℚ(√−907): h = 3, the primes 2, 3, 5 are inert, and the three reduced forms are listed above.
- The chain of §5.6: 318028 → 1333963 → 51599563 → 1432817816347.
- χ_(−17923): primitive, odd, conductor 17923, with a zero 1/2 + iγ, γ ≈ 0.030986.

### Dependencies

Layers 0, 3 and 4 (§§0.1, 0.2, 0.4, 3.5, 3.7); Mathlib (`DirichletCharacter.LFunction`, `Complex.Gamma`, `legendreSym`, `ZMod.χ₈`); Tau Ceti `TauCeti.Multiquadratic.IsFundamentalDiscriminant`; ImaginaryQuadraticClassNumber H1.1–H1.3 and H2.1.

## Downstream consumers

Its natural consumers are further effective class-number problems (class numbers 4 to 100, imaginary quadratic orders, CM fields) and the explicit determination of CM points of small degree, all of which would cite Layer 1's technical theorem, Layer 2's rank-three theorems and the explicit constants of Layers 3–4.

## References

- **[O85]** Joseph Oesterlé, [Nombres de classes des corps quadratiques imaginaires](https://www.numdam.org/item/SB_1983-1984__26__309_0.pdf), Séminaire Bourbaki, exposé 631 (1983–84), Astérisque 121–122 (1985), 309–323. Used: Introduction and Theorem 1, pp. 309–311; §1 (quadratic fields, reduced forms, (1.3.1)–(1.3.2), §1.4), pp. 311–312; §2.3 ((2.3.1)–(2.3.3)), p. 313; §3 (conditions C1–C4, Theorem 2, Lemmas 1–3, (3.1.1)–(3.5.6)), pp. 314–319; §4 (Proposition 2, §§4.2–4.3), pp. 319–321; §5.1, p. 321.
- **[O88]** Joseph Oesterlé, [Le problème de Gauss sur le nombre de classes](https://doi.org/10.5169/seals-56588), L'Enseignement Mathématique 34 (1988), 43–67. Used: §8, p. 66 (the curves and the height argument); §9, pp. 66–67 (the constants and the class number three consequence).
- **[GZ86]** Benedict H. Gross and Don B. Zagier, [Heegner points and derivatives of L-series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Inventiones mathematicae 84 (1986), 225–320. Used: Chapter I, §3, pp. 227–228; §5, (5.1), p. 229; §6 ((6.3)–(6.5)), p. 230; §7, Proposition (7.4), p. 231; §8, Theorem (8.1), bound (8.2) and the class number three consequence, p. 232; Chapter II, §1, pp. 234–236 (CM and conjugation).
- **[GZ83]** Benedict H. Gross and Don B. Zagier, [Points de Heegner et dérivées de fonctions L](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PointsHeegner/fulltext.pdf), C. R. Acad. Sci. Paris, Série I 297 (1983), 85–87. Used: Theorem 1 and Corollaries 2–6, pp. 85–87, in particular Corollary 6 and its proof, p. 87.
- **[BGZ85]** Joe P. Buhler, Benedict H. Gross and Don B. Zagier, [On the conjecture of Birch and Swinnerton-Dyer for an elliptic curve of rank 3](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.2307/2007967/fulltext.pdf), Mathematics of Computation 44 (1985), 473–481. Used: equation (2), p. 473; §§1–2 (heights, (7), the Mordell–Weil group and the regulator (8)), pp. 474–476; §4 ((10)–(14)), pp. 477–479; Table 2 and §5, p. 480.
- **[MW74]** Hugh L. Montgomery and Peter J. Weinberger, [Notes on small class numbers](https://matwbn.icm.edu.pl/ksiazki/aa/aa24/aa2457.pdf), Acta Arithmetica 24 (1974), 529–542. Used: Theorem, p. 530; §§2–4, Lemmas 1–9, pp. 530–539; Table I, p. 537; §5, pp. 539–542.
- **[LLS70]** D. H. Lehmer, Emma Lehmer and Daniel Shanks, [Integer sequences having prescribed quadratic character](https://www.ams.org/journals/mcom/1970-24-110/S0025-5718-1970-0271006-X/), Mathematics of Computation 24 (1970), 433–451. Used: the prescribed-character searches and tables, pp. 433–444; Table III, p. 440; the class number three application, pp. 445–447.
- **[G77]** Dorian M. Goldfeld, [The conjectures of Birch and Swinnerton-Dyer and the class numbers of quadratic fields](https://www.numdam.org/item/AST_1977__41-42__219_0.pdf), Astérisque 41–42 (1977), 219–227. Used: §1, p. 219, and §§2–5, pp. 220–225.
- **[DLMF]** [NIST Digital Library of Mathematical Functions](https://dlmf.nist.gov/5.11), §5.11, Stirling's series (5.11.1), the vertical asymptotic (5.11.9) and the error bounds of §5.11(ii).
- **[DEL73]** Pierre Deligne, [Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), Lecture Notes in Mathematics 349 (1973), 501–597, §8, (8.12): local L- and epsilon-factor conventions and Weil–Deligne tensor operations.
- **[COG04]** James W. Cogdell, [Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), author Fields Institute lecture notes (2004), Lecture 9 §§3–6, printed pp. 71–74: self-pair poles, functional equation and completed integral estimates.
- The supplier roadmaps cited by section above: TauCetiRoadmap [IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralLattices), [ImaginaryQuadraticClassNumber](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ImaginaryQuadraticClassNumber), [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), [ModularForms](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularForms), [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves), [ContourIntegration](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ContourIntegration); [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md), [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md), [EllipticCurveModularity](../EllipticCurveModularity/README.md), [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md).
