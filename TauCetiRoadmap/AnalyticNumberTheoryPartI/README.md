# Roadmap: analytic number theory, Part I

**Summary.** Quantitative primes, the uniform exclusion of Landau–Siegel zeros with its effective consequences, explicit formulas, Hecke and Artin comparisons, multiplicative means, smooth numbers and proved zeta moments.

`Suggested.lean` states the headline theorems on native library carriers: the uniform exclusion of Landau–Siegel zeros with its classification, Landau-deduction and inert-prime targets (§0.34), the effective lower bound for `L(1,χ)` (§0.9), Weierstrass primary products with equal-divisor factorization, finite-order and paired Hadamard factorization, effective Siegel–Walfisz, Chebyshev's factorial identity, Mertens's von Mangoldt sum with its constant `γ`, and the local expansion and half-plane bounds of `ζ′/ζ` (Layer 0); Davenport cancellation, half-interval and Weil explicit formulas (Mestre's general formula and the `C¹` formula for `ζ` with Gauss's digamma integral), Dirichlet-polynomial means, Selberg density and conditional prime errors (Layer 1); the K-Bessel kernel, the level-one Eisenstein series with its completed continuation, Artin and Swan conductors with their integrality, Hecke's continuation for unitary characters, Zaman's prime-ideal count, Louboutin and bounded-degree Brauer–Siegel (Layer 2); and Shiu, Halász, Dickman, Landau–Ramanujan, restricted Sathe–Selberg, Atkinson, zeta moments with the divisor-square Euler identity and the Beurling remainder equivalence (Layer 3). Every published finite computation a theorem rests on is a named proposition there and an explicit hypothesis of that theorem. Its definitions serve those statements. Other API names below specify library targets.

## Scope and ownership

This part owns Layers 0–3: quantitative refinement and arithmetic comparison. It consumes ArithmeticDirichletSeries Layers 1–10, LFunctions Layers 0–7 and ZerosOfLFunctions Layers 0–8 for order-one growth, Gamma estimates, degree-one zeros, rational explicit formulas and prime-number estimates.

This part owns the entire-function theory it uses beyond ZerosOfLFunctions' order-one canonical products and entire logarithm: Weierstrass primary factors and products of every genus with equal-divisor factorization (§§0.15–0.15a), finite-order Hadamard factorization with its summability, good-circle estimate and polynomial-degree bound (§0.23), and centered order-one growth with the paired Hadamard theorem (§§0.29–0.29b). It also owns the analytic and arithmetic objects behind its Hecke, Artin and quadratic-period targets: the K-Bessel kernel (§2.1a); the level-one nonholomorphic Eisenstein series with its completion, Fourier expansion, continuation and critical-line cusp estimates (§2.1b); real quadratic reduced cycles, genus characters and Nielsen surfaces (§2.1c); Artin and Swan conductors with their integrality, induction formula and conductor–discriminant formula (§2.2a); Hecke's continuation and functional equation for every unitary idele-class character, by Hecke's theta method (§2.3a); finite-image Artin `L`-functions with their local factors, induction formula, one-dimensional comparison and Brauer continuation (§2.18a); the CM quadratic completion with its gamma correction (§2.22a); and the first-kind Bessel API on Mathlib's `Complex.besselJ` (§3.23b).

This roadmap belongs to the analytic-number-theory cluster (with AnalyticNumberTheoryPartII, ZerosOfLFunctions, SieveMethodsAndPrimePatterns, ProbabilisticAndMetricNumberTheory, ArithmeticDirichletSeries and the explicit prime-counting roadmaps), which depends only on Mathlib, on roadmaps already on main and on the other cluster roadmaps; the automorphic `L`-function, adelic-group, Galois-representation, global holomorphic-function, automorphic spectral, effective class-number and progression-power roadmaps that use the material above import it from here rather than supply it.

This part owns the uniform exclusion of Landau–Siegel zeros (§0.34): an effective absolute `c_LS>0` with `(1−β)log q≥c_LS` for every real zero `β∈(0,1)` of every primitive nonprincipal real Dirichlet `L`-function of conductor `q≥3`. It also owns the effective consequences drawn here: the lower bound `L(1,χ)≥c/log q` and Siegel's bound `L(1,χ)≥c_ε q^(−ε)` with effective constants (§0.9), the emptiness of the exceptional-zero predicate at width `c_LS` (§0.1), the exception-free bounded-height Landau–Page theorem (§0.6), the character prime-number estimate without an exceptional term (§§0.18, 0.28), the effective zero gap (§0.31b) and effective Siegel–Walfisz (§0.32). ImaginaryQuadraticClassNumber H2.3–H2.4 keeps its own ineffective two-character proof of Siegel's theorem and of `h(D)≥c_ε|D|^(1/2−ε)`; this part plans no step of that proof and takes nothing from H2.3–H2.4. The real quadratic bound `h⁺(D)log ε_D≥c_ε D^(1/2−ε)` of §2.13, effective here, is kept in this part because H2.4 states only the imaginary case. This part also owns the classification of primitive nonprincipal real Dirichlet characters as the Kronecker characters of fundamental discriminants (§0.34a); QuadraticCharactersAndReduction §Q2 consumes it. ZerosOfLFunctions and ImaginaryQuadraticClassNumber stand before this part and keep their statements: the exception-free forms over `ℚ` of ZerosOfLFunctions 6.3–6.4 and 8.6–8.8 and the effective forms of ImaginaryQuadraticClassNumber H2.3–H2.4 are stated in this part (§§0.1, 0.6, 0.9, 0.18, 0.32), where later roadmaps consume them.

Downstream consumers of §0.34 and its corollaries include SieveMethodsAndPrimePatterns, QuadraticCharactersAndReduction and the explicit prime-counting roadmaps; the section Downstream consumers lists the statements concerned.

### Prerequisites and boundaries

ArithmeticDirichletSeries supplies norm-indexed ideal coefficients, genuine Euler products, partial-sum continuation, Abel and Perron summation, Landau positivity, Wiener–Ikehara and the qualitative transfer from logarithmic derivatives to prime counts. Mathlib supplies arithmetic functions, ordinary Dirichlet-series continuation and functional equations, nonvanishing on the closed right half-plane, the real Dedekind residue limit, and the circle-valued real Hurwitz zeta function. None of these is constructed again here.

Integral Brauer induction and nilpotent monomiality are already in Tau Ceti; their exact combination is specified under From RepresentationTheory. The Artin targets add arithmetic Euler-factor and continuation comparisons, rather than another representation-theoretic induction theorem.

Qualitative prime counts use `TauCeti.primeIdealTheorem` and `TauCeti.primeCount_univ_isEquivalent_div_log` (`TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.PrimeIdealTheorem`), and `NumberField.Chebotarev.tendsto_frobeniusPrimeCount` (`TauCeti.NumberTheory.Chebotarev.PrimeCounting.FrobeniusPrimeCount`). Chebotarev Layers 13–14 supply rational progression/total-prime specializations. Its `NumberField.Chebotarev.frobeniusVonMangoldtCoeff_galEquivZMod_symm_of_coprime` compares inclusive rational sums on coprime inputs; the all-input `frobeniusVonMangoldtCoeff_galEquivZMod_symm` needs `q%4≠2`. Otherwise discard prime powers dividing `q`: prime 2 in the conductor-reduced cyclotomic field is not a unit modulo 6. This roadmap adds quantitative errors.

`TauCeti.NumberTheory.ArithmeticDirichletSeries.Cancellation.Nonvanishing` supplies `continuedLFunctionOfWeight_ne_zero_of_one_lt_re`, `continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and `continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`: respectively `Re s>1`, square cancellation on `Re s≥1`, and quadratic weights away from 1. The Hecke boundary adapter identifies the ray character and transports LFunctions Layer 7’s quadratic endpoint to canonical Hecke continuation.

ContourIntegration supplies residues and the argument principle with the exact path, singularity and null-homology hypotheses below. The local additions are rectangle adapters, branch/phase bounds, safe heights and infinite-height limits.

DifferentialGeometry supplies oriented integration and Stokes/Green identities as specified below. The local `core_stokes` adapter applies these identities to the Nielsen surfaces and oriented boundary maps of §2.1c.

Use the form-class and unit suppliers below; the real quadratic Nielsen surfaces, normalized quadratic period comparisons, general-eigenfunction Stokes and the imaginary-quadratic CM-point adapter are targets here.

## Conventions

All number fields have characteristic zero. A finite Galois representation is finite-dimensional over `ℂ` and uses **arithmetic** Frobenius. At a ramified prime its local polynomial acts on inertia invariants. Positive real powers mean `exp(s log x)` with the real logarithm and require `x>0`. A complex parameter power uses a specified logarithm branch or a specified covering-space lift. Pole values of totalized Lean functions never stand for meromorphic germs.

The functions `ψ` and `θ` use inclusive prime-power and prime cutoffs, respectively. A residue-class sum is defined for every residue, including a nonunit; asymptotics assume a unit class and positive modulus. Explicit formulas use `ψ₀` with half weight at an endpoint prime power. The distance term excludes the endpoint prime power itself. Zeros carry analytic multiplicities. Every strict or inclusive height cutoff is stated at its use; changing it requires a local multiplicity bound. A low-zero estimate uses a bounded kernel such as `min(1,1/|ρ|)` and never divides by `Im ρ`.

A character modulus, its primitive conductor and an Artin conductor are distinct. A primitive quadratic character is obtained from a fundamental discriminant, including its 2-adic possibilities; the trivial discriminant 1 is allowed only where expressly stated. Standard Dirichlet and Hecke functional equations retain the conductor, the base discriminant, archimedean parities and the root number. Removing finitely many Euler factors multiplies an ordinary simple-pole residue by their values at 1; it preserves the coefficient of the logarithmic-derivative pole, not the original residue.

Write `Γℝ(s)=π^(−s/2)Γ(s/2)` and `Γℂ(s)=2(2π)^(−s)Γ(s)`. For an imaginary quadratic discriminant `D`, `ω_D=|O_Kˣ|/2`; thus `ω₋₄=2` and `ω₋₃=3`. For a real quadratic field the norm-one units are `{±ε_D^n : n∈ℤ}`, where `ε_D>1` generates the totally positive norm-one subgroup. The full group modulo `{±1}` defines the geodesic stabilizer in `PSL₂`, and its length is `2 log ε_D`. Ordinary and narrow classes are not interchanged without the norm-minus-one unit dichotomy.

For the quadratic genus-period formulas, write `Λ_DIT(s,χ_d)=|d|^(s/2)π^(−s/2)Γ((s+α_d)/2)L(s,χ_d)`, with `α_d=(1−sign d)/2`, as a meromorphic completion (Duke–İmamoğlu–Tóth (5.13), p.964). Thus `Λ_DIT=π^(α_d/2)|d|^(s/2)·DirichletCharacter.completedLFunction(χ_d,s)`. This differs for odd characters from the completion `Λ_std=(|d|/π)^((s+α_d)/2)Γ((s+α_d)/2)L` used for the imaginary quadratic endpoint values: `Λ_std=(|d|/π)^(α_d/2)Λ_DIT`. In particular the two completions agree for `d>0`; for `d=−4, Λ_DIT(0)=Λ_DIT(1)=√π/2` whereas `Λ_std(0)=Λ_std(1)=1`; for `d=−3`, the corresponding values are `√π/3` and `1/√3`. These comparisons use canonical continued values at the endpoints.

Use the supplier’s `OrderLE` predicate for upper order. For an entire function and `ρ≥0` its cobounded formulation is equivalent, by compact boundedness, to: for every `b>ρ` there is `C_b>0` with `|f(z)|≤C_b exp(|z|^b)`. Hadamard factorization requires a nonzero function. Strict positivity of every derivative additionally requires nonpolynomiality and the stated parity and real-sign conditions.

A Beurling prime system is an indexed locally finite nondecreasing sequence, with multiplicities; generalized integers are indexed finite prime multisets and can have coincident real values.

For all quadratic-period targets, `E(z,s)=(1/2)Σ_(gcd(c,d)=1)(Im z)^s/|cz+d|^(2s)` on `Re s>1`, and `E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s)`; its continuation and functional equation are §2.1b.

## Exact supplier contracts

### From ArithmeticDirichletSeries

Consume [ArithmeticDirichletSeries Layer 1][R4] for `IdealArithmeticFunction`, `normCoeff`, finite norm fibres and regrouping, including ordinary/narrow class restrictions. Fix coefficient zero to 0. [Layer 5][R7] supplies total ideal-count domination and hence absolute convergence of class restrictions on `Re s>1`; Layer 1 alone does not.

[Layer 3][R2] supplies genuine multiplicative ideal Euler products and their norm-regrouped series on `Re s>1`, with finite bad-prime omission. Its degree-one completely multiplicative weight carrier is not a carrier for higher-dimensional Artin factors.

[Layer 4][R8] supplies `HeightOneSpectrum`-indexed nonzero-prime counts, local finiteness and inclusive norm cutoffs. [Layer 5][R7] supplies ideal Mangoldt coefficients, higher-prime-power and finite ramification discard bounds. The degree/discriminant-dependent quantitative lower bounds and splitting errors required here are local targets; qualitative PNT alone does not give them.

[Layer 6][R1] supplies Abel and truncated Perron summation, uniform errors and off-endpoint/half-weight endpoint forms for the actual Mangoldt `LSeries`. The finite-height kernel at 1 is `arctan(T/c)/π`. Its quantitative Abel identity converts progression θ bounds to π with the Li main term and lower-endpoint term, uniformly for `q≤(log x)^B`. For quadratic Hecke logarithmic coefficients use smoothing `1−N𝔞/Y` and kernel `Y^s/(s(s+1))`; contour shifts and quantitative residues are local targets, not supplier outputs.

[Layer 8][R3] supplies the nonnegative logarithmic-coefficient 3–4–1 inequality, meromorphic boundary nonvanishing with pole order at most one, and Landau’s singularity at the finite convergence abscissa. Use its endpoint positivity/convergence corollary for holomorphy across that abscissa.

[Layer 9][R5] supplies Wiener–Ikehara: for nonnegative b, `b(0)=0`, `κ≥0`, `LSeriesHasSum b s (F s)` on `Re s>1`, and G continuous on `Re s≥1` agreeing there off the boundary with `F−κ/(s−1)`, the inclusive summatory sum divided by x tends to κ. No totalized subtraction at 1 is asserted. [Layer 10][R6] transfers ψ to θ to π, including higher powers and `Li(x)∼x/log x`, for ordinary primes and fixed coprime classes.

### From ImaginaryQuadraticClassNumber

H2.2 supplies `ζ_K(s)=ζ(s)L(s,χ_D)` on `Re s>1` for a quadratic field `K` of discriminant `D` and the imaginary quadratic class-number formula `h(D)=w_D√|D|L(1,χ_D)/(2π)` with the exact unit orders `w₋₃=6`, `w₋₄=4` and `w_D=2` otherwise. Nothing from H2.3–H2.4 is consumed. Their statements `quadratic_LFunction_siegel` (for every `ε>0` some `c_ε>0` with `c_ε q^(−ε)≤Re L(1,χ)` for every primitive nonprincipal `χ` modulo `q` with `χ²=1`, Mathlib's `MulChar.IsQuadratic`) and `imaginary_classNumber_lower_bound` (`c_ε|D_L|^(1/2−ε)≤h_L` for every imaginary quadratic field `L`) follow, with effective constants, from §0.9 together with H2.2. The effective exponent-`1/2` zero gap of §0.12 uses only the class-number formula and §0.31a.

### From LFunctions Layers 0–7 and ZerosOfLFunctions Layers 0–8

[LFunctions Layer 1][R9] supplies Poisson summation on the mixed space `K⊗ℝ` and the theta identities of Hecke's method, Layer 5 the finite-order Hecke functions and Layer 6 the algebraic Hecke characters of type `A₀`; §2.3a extends Hecke's method to continuous infinity types. Use [LFunctions Layers 0–7][R9]’s completed-function records and Layer 7’s intrinsic finite-order Hecke boundary nonvanishing (including quadratic characters and meromorphic pole orders) and [ZerosOfLFunctions][R10]’s meromorphic germs. §0.30 compares Mathlib’s rational functions, conductors, parities and deleted factors with them.

| ZerosOfLFunctions section | Exact contract |
| --- | --- |
| [ZerosOfLFunctions 0.1–0.2][R11] | `OrderLE f A`: cobounded big-`O` of `exp(‖z‖^b)` for each `b>A`, with entirety separate. `entireCompletion` is the unique analytic pole-cleared extension with its exact divisor and nonzero former-pole values; for `ζ` it is `s(s−1)Λ`, without 1/2. |
| [ZerosOfLFunctions 1.2–1.4][R12] | Analytic `logΓ` on `|arg z|<π−δ, |z|>1`, normalized at 2, Stirling remainder, vertical-strip modulus/phase, digamma and balanced Gamma quotients. §0.23a supplies the normalized slit-plane extension, its Stieltjes representation and higher remainder derivatives. |
| [ZerosOfLFunctions 3.3–3.4][R13] | Pole-cleared conductor-uniform convexity at fixed degree and bounded shifts; order at most one for `ζ` and primitive Hecke entire completions. Finite order alone does not suffice. |
| [ZerosOfLFunctions Layer 4][R14] | Locally finite analytic zero divisor, multiplicity-weighted restrictions, finite counts and high-height `O(log analyticQ)` local counts. Bounded-height conductor uniformity is refined here. |
| [ZerosOfLFunctions 5.2–5.7][R15] | Zero summability/tails, `E₁(w)=(1−w)exp(w)` and its API, locally uniform unordered products, Hadamard at order `≤1` for `f(0)≠0`, and logarithmic derivative. The origin-zero adapter extends this locally. |
| [ZerosOfLFunctions 6.2–6.4][R16] | Fixed-degree conductor-uniform regions, including `ζ`, with at most one simple real exception for real characters: `IsExceptionalZero`, `.unique`, `.divisor_eq_one`, `.sq_eq_one`. Use the supplied width; §0.1 compares `c` before inheriting these assertions, and §0.34b uses the conductor bound 6.4d. Family Landau–Page is additional, and §0.34 shows that the exception does not occur at width `c_LS`. |
| [ZerosOfLFunctions 7.4][R17] | Multiplicity-sensitive Riemann–von Mangoldt formula with Gamma phase and safe heights. |
| [ZerosOfLFunctions 8.2–8.8][R18] | Truncated explicit formulas with endpoint/admissible-height conventions, rational PNT remainder, fixed-character and fixed-field abelian effective estimates. Conductor-uniform character PNT and nonabelian effective Chebotarev are refinements here. |

Restrict the supplier divisor to the critical strip and `|Imρ|<T`, excluding height endpoints; pass through zero-avoiding heights. Complex characters pair with their conjugates. ArithmeticDirichletSeries supplies half-weight Perron endpoints; ZerosOfLFunctions owns the generic rational explicit formula.

### From GlobalNumberFields

[Layer 9][R19] supplies `HeckeCharacter`, `unitaryPart`, local components, finite conductors, the finite-order/ray-class dictionary and ideal coefficients in the arithmetic-Frobenius normalization. [Layer 10][R20] supplies infinity types and CM sign components; global Artin sends a negative real element to conjugation.

[Layer 2][R21] supplies ray classes; [Layer 11][R35] supplies `NumberFieldOrder.narrowToPic`, surjectivity and `Oˣ→{±1}^r₁→NarrowPic O→Pic O→1`, with maximal-order `narrowClassToClass`. Only invertible proper ideals occur; other proper ideals belong to the class monoid. LFunctions Layer 2 partitions actual ideals into ordinary/narrow partial series at trivial finite modulus. Geometric form-class and coefficient-presentation comparisons are local adapters.

[Layer 10][R20] supplies finite cyclotomic Galois identifications, compatible transitions and arithmetic Frobenius. Their inverse-limit identification `Gal(ℚcycl/ℚ)=Ẑ×` is an adapter here, not an assumed global reciprocity theorem. [Layer 4][R22] supplies restricted finite adeles and the integral compact-open subgroup.

### From NumberFieldArithmetic

[Layer 2][R24] supplies decomposition/inertia groups, arithmetic Frobenius modulo inertia at every nonzero prime, conjugacy independence and tower compatibility. For `K/ℚ`, its residue action is `x↦x^p`. The polynomial uses inertia invariants, not an arbitrary lift on the whole representation. [§1.4][R25] supplies `doubleCosetEquiv`, between `H∖G/D` and primes of `L^H` above p, with ramification/residue degrees and norm powers. The inertia-orbit determinant adapter is local.

[Layer 7][R26] supplies normal closures and the faithful action on the `2g` embeddings, giving `[L:ℚ]≤(2g)!` for a degree-`2g` CM field. The uniform normal-closure discriminant power and general Artin-conductor budget are proved here, not assumed from a ray-modulus estimate.

### From ClassFieldTheory

[Layer 11][R27] identifies finite one-dimensional Galois characters with primitive finite-order Hecke/ray characters via `globalArtinMap`, `globalArtinMap_local` and the ideal Artin map, retaining arithmetic Frobenius and conductors. This also gives the abelian Dedekind product. [Layer 7][R29] supplies `characterConductorExp` and exponent zero iff inertia-triviality. [Layer 13][R28] supplies conductor–discriminant; for quadratic `E/F`, `f_η=D_(E/F)` and `D_F N(f_η)=D_E/D_F`.

### From LocalFieldsRamification

Completed LocalFieldsRamification supplies, for a finite Galois extension of nonarchimedean local fields, the lower ramification groups `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, the Herbrand functions and the upper numbering with its quotient compatibility, the Hasse–Arf theorem for abelian extensions, the different exponent `TauCeti.differentExponent` with Hilbert's formula, and the abelian conductor exponent `TauCeti.LocalFieldsRamification.artinConductorExponent`. Tau Ceti's `TauCeti.IsLocalRing.ramificationGroup` is the same filtration for a group acting on a local ring. §2.2a builds the conductors of higher-dimensional representations on these.

### From RepresentationTheory

[InductionRestriction Layer 6][R30] supplies rational Artin induction; [Layer 3, Mackey §3a][R31] supplies the representation-level restriction/induction isomorphism with conjugated intersections. The ramified invariant-space cyclic-block determinant is local.

Integral Brauer is `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (`TauCeti.RepresentationTheory.Induction.Brauer.Induction`), over an algebraically closed characteristic-zero field. Elementary groups are nilpotent by `TauCeti.IsElementary.isNilpotent` (`TauCeti.GroupTheory.Elementary`); their irreducibles are induced-linear by `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (`TauCeti.RepresentationTheory.Induction.Monomial`). Transitivity `TauCeti.indClassFun_indClassFun_subgroupOf` (`TauCeti.RepresentationTheory.Induction.ClassFunction`) gives `χ_ρ=Σn_jInd_(H_j)^Gχ_j`, `n_j∈ℤ`, `dimχ_j=1`. `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` (`TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField`) uses this reduction. Rational induction alone only gives a meromorphic power.

For the CM finite-family bound, transport groups of order `m≤(2g)!` to `Fin m`. There are finitely many laws and irreducibles. Choose an integral induced-linear expression for each and maximize term count and sum of absolute coefficients, enlarged to 1, obtaining `B_g` independent of `E`. Isomorphism transport preserves it. Conductor/discriminant bounds are separate.

### From Mathlib Bessel theory

Mathlib `Analysis/SpecialFunctions/Bessel.lean` supplies `Complex.besselJ`, `Complex.besselJ_neg_int`, `Complex.besselJ_zero`, `Complex.analyticOnNhd_besselJ` and `Complex.analyticOnNhd_besselJ_int`. §3.23b proves its series, positive-axis differential equation, recurrence and half-order formula; the K-Bessel kernel is §2.1a, and the second-kind integral and remainders are §3.23b.

### From FuchsianOrbifolds

Layers 2–3 of FuchsianOrbifolds supply hyperbolic polygons with Mathlib's `UpperHalfPlane.volume`, measurable fundamental domains, the Gauss–Bonnet area formula for finite hyperbolic polygons and cusp neighbourhoods; Layer 6 supplies the standard fundamental polygon of `PSL₂(ℤ)`. §2.1c builds the real quadratic Nielsen surfaces on these.

### From DifferentialGeometry

[Layer 12][R32] supplies Riemannian volume, `laplaceBeltrami` and `integral_mul_laplaceBeltrami`, with sign div grad; the positive operator here is its negative. Layers 5.3–5.5 supply oriented top-form integration, `integralTopForm_mextDeriv` and corner Stokes; §§5.6.2–5.6.3 supply planar Green, integer-weighted arc cancellation and manifold-orientation comparison. The general-eigenfunction Stokes comparison on the orbifold surfaces of §2.1c is local; real Nielsen geometry and boundary multiplicities are §2.1c, and the Eisenstein cusp limits are §2.1b.

### From IntegralLattices and Mathlib's Minkowski bound

Mathlib's `NumberField.abs_discr_ge'` supplies Minkowski's lower bound `|D_K|≥d^(2d)/((4/π)^(2r₂)(d!)²)`. IntegralLattices Layer B, B2/B4/B5, supplies imaginary quadratic proper form/ideal classes and units. GlobalNumberFields Layer 11’s narrow/ordinary map is the one above. §2.1c constructs the real reduced periods, genus characters and full-norm-one stabilizers, with length `2logε_D`; the imaginary-quadratic CM-point adapter is local in §2.1.

### From Tau Ceti, Multiquadratic and ContourIntegration

For squarefree `d≠0,1`, use Tau Ceti’s `fundamentalDiscriminant d` (`TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.OfSquarefree`). In its `Character` module, `TauCeti.Multiquadratic.fundamentalDiscriminantChar`, `fundamentalDiscriminantChar_apply_int`, `fundamentalDiscriminantChar_neg_one`, `fundamentalDiscriminantChar_isQuadratic` and `isPrimitive_fundamentalDiscriminantChar` supply the canonical character, integer values, parity and conductor. Cast from `ℤ` to `ℂ`. The conductor is `|D(d)|`, with `D(d)=d` for `d≡1 mod4`, otherwise `4d`; values include the 2-primary Kronecker factor. Consume these Completed Multiquadratic exports; §0.30 compares ray data.

Completed ContourIntegration Layer 4 and `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (`TauCeti.Analysis.Contour.Cycle.Residue`), `TauCeti.Contour.argumentPrinciple_nullHomologous` (`TauCeti.Analysis.Contour.Argument.Cycle`) supply the residue theorem and argument principle. Match rectangles to native piecewise-`C¹` closed paths/cycles, with open neighbourhood, finite singularities, meromorphic germs/orders, off-divisor trace, null-homology and winding conventions. Phase bounds and infinite symmetric contours are local adapters.

### From Chebotarev

[Layer 13][R43] supplies `frobeniusTheta`, `frobeniusPrimeCount` and their progression comparison: for `ℚ(ζ_q)/ℚ` and unit a, `ϑ_C(x)/x→1/φ(q)` and `π_C(x)∼x/(φ(q)logx)`. [Layer 14][R44] supplies `ψ_K(x)∼x` and consistency at `K=ℚ`. [Layer 11][R45] supplies `frobeniusVonMangoldtCoeff`, `frobeniusPsi`, `frobeniusTheta` and §11.3’s `o(x)` discards. [Layer 8][R46] supplies Deuring’s cyclic fixed-field fibre count for `L/L^⟨g⟩` and g. The exact pinned AP and count declarations, including the `q%4≠2` restriction, are stated under Prerequisites and boundaries.

## How to read the build

Targets retain their original layer and subsection numbers. Named prerequisite links give the order within each layer; every prerequisite is in this part or an earlier supplier. A source and locator apply to the numbered topic and its subsidiary ingredients unless a nearer citation is supplied. Constants are uniform only in the stated parameters. A source's external proof input remains a target requiring proof, never an assumption that the result is formalized.

### Prerequisite abbreviations

Each abbreviation expands to the exact prerequisite list below; these are shared lists, not additional mathematical targets.

- **B1:** §2.18a; [NumberFieldArithmetic 1][R25]; [NumberFieldArithmetic 2][R24]; [RepresentationTheory/InductionRestriction 3][R31]; §2.18; §2.5; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2]; §2.3; [ClassFieldTheory 11][R27]; [ClassFieldTheory 7][R29]; [GlobalNumberFields 9][R19]; §2.28; §2.28a.
- **B2:** IntegralLattices Layer B, B2/B4/B5 (imaginary quadratic form/ideal classes and units); §2.1 (general-eigenfunction Stokes and imaginary-quadratic CM points); §2.1b (normalized Eisenstein theory, critical-line cusp decay and integrability); §2.1c (real quadratic cycles, genus characters, Nielsen surfaces and oriented boundary maps).
- **B3:** §2.5; [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27].
- **B4:** `B3`; §2.7; §2.3a; §2.17a.

## Layer 0: Entire functions and quantitative prime estimates

Start with entire-function factorization and the pole-cancelled `ξ`-function. The prime estimates specify their zero-free regions and numerical ranges. The milestone of this layer is the uniform exclusion of Landau–Siegel zeros (§0.34), which rests on the prime sums of §§0.11–0.11b, the dictionary of §0.30 and the effective gap of §0.12. It precedes the emptiness statement of §0.1 and §§0.6, 0.9, 0.18, 0.28, 0.31b and 0.32, none of which carries an exceptional-zero alternative; their Siegel-type constants are effective. An effective constant includes an effective threshold. Published finite computations enter the affected literal bounds as explicit hypotheses, as specified below. No enumeration or numerical verification is a target.

### 0.1 Exceptional real zero

For `c>0` define the `c`-exceptional predicate for a nontrivial primitive quadratic character `χ` of conductor `N>1` by `L(β,χ)=0` and `1−c/log N<β<1`, with `β` real. The exceptional zero used in Proposition 7.1 is this predicate specialized to its effective absolute `c_star>0`; its conductor is called exceptional. The general parameter does not assert the existence of any zero. The exceptional predicate increases with the positive width parameter.

By §0.34 the predicate is empty at every width `0<c≤c_LS`: a zero in the window would have `(1−β)log N<c≤c_LS`. The constant `c_star` is fixed with `c_star≤c_LS` (below), so no `c_star`-exceptional zero and no exceptional conductor exists, and §0.24 holds vacuously. This unconditional emptiness is the stronger form and is the one stated; the predicate is kept at every width for the comparison with ZerosOfLFunctions and for statements quantified over the width.

- `ExceptionalRealZero.iff`: For `c>0` and `N>1`, the predicate holds exactly when `χ` is primitive, nonprincipal and quadratic, `L(β,χ)=0`, and `1−c/log N<β<1`. Equivalently, for arbitrary `c,N` it is the conjunction of all these conditions, including `c>0` and `N>1`.
- `ExceptionalRealZero.bounds`: An exceptional `β` lies strictly below 1 and strictly above the specified logarithmic cutoff.
- `ExceptionalRealZero.mono`: For `0<c≤c′` the `c`-exceptional predicate implies the `c′`-exceptional predicate, with `N>1`.
- `ExceptionalRealZero.empty`: For `0<c≤c_LS` the `c`-exceptional predicate holds for no `χ`, `N` and `β`.

**Checks.**

- `β=1` is excluded even if a chosen totalized function vanishes there.
- `β=1−c/log N` is excluded by the strict inequality.
- The principal character and `N=1` are outside the domain; `log 1` is never used as a denominator.
- Given `c>0, N>1`, a primitive nonprincipal quadratic `χ`, a real `β` with `L(β,χ)=0` and `1−c/log N<β<1`, the `c`-exceptional predicate holds. This is conditional and makes no existence assertion.
- At width `c_LS` the predicate is empty by §0.34; at a larger width it is a window condition and asserts neither existence nor emptiness.

See [47][R47], Section 7, Proposition 7.1 and following paragraph, pp. 373-374; [109], Theorem 1, for the emptiness.

`ExceptionalRealZero.to_supplier`: for the degree-one constant `c₁>0` of [ZerosOfLFunctions 6.3–6.4][R16] and `0<c≤min(c₁/3,log3/2)`, `c`-exceptional `β` satisfies `IsExceptionalZero` through §0.30. Indeed `N≥3`, `β>1/2` and `log analyticQ(χ,0)≤log(4N)≤3logN`, so `c/logN≤c₁/log analyticQ(χ,0)`. Conversely require the supplier predicate, stricter cutoff and primitive nonprincipal quadratic conditions. Inherit uniqueness/simplicity only at this width. Reducing `c` preserves exclusion, not existence. The width comparison for `c_star` is `0<c_star≤min(c₁/3,log3/2,c_LS)`.

*Needs:* `DirichletCharacter.LFunction`; §0.30; [ZerosOfLFunctions 6.3–6.4][R16]; §0.34.

### 0.2 Chebyshev sum in a residue class

For `x≥2`, the zero class modulo 2 contributes exactly `log 2`.

For `q≥1` and `a∈ZMod q, θ(x;a,q)=Σ_{p prime, p≤x, p≡a mod q} log p`. Inclusive real cutoff, empty for `x<2`. This specializes the Chebyshev sum; a coprimality hypothesis is required by asymptotic theorems, not by the finite sum. The Lean carrier is `thetaAP`; the `ψ` and prime-count signatures use `psiAP` and `primeCountAP`.

- `theta_ap.sum`: Evaluation is the finite filtered prime sum just displayed.
- `theta_ap.level_one`: `θ(x;0,1)=Chebyshev.theta x`.
- `theta_ap.sum_classes`: For `q≥1`, summing over all residue classes modulo `q` gives `Chebyshev.theta x`. The finite sum is not specified at `q=0`, where `ZMod 0` is infinite.

**Checks.**

- `θ(1;a,q)=0`.
- `θ(x;0,2)=log 2` for `x≥2`; the noncoprime class cannot satisfy `x/φ(2)` asymptotics.

See [47][R47], §§6–9, especially p. 369.

*Needs:* `Chebyshev.theta`.

### 0.3 Schoenfeld explicit Chebyshev bound

`theta_lt_of_schoenfeld`: under `SchoenfeldFiniteRangeInput`, `θ(x)=Σ_{p prime,p≤x}log p<1.000081x` for every `x>0`.

- `SchoenfeldFiniteRangeInput`: `θ(x)<1.000081x` for every real `0<x<exp(10000)`. Source: [47][R47], Equation (10), p.362, from Schoenfeld 1976, concluding note p.360.

For `x≥exp(10000)` prove the bound from the explicit zero-free-region Chebyshev error of [Rosser–Schoenfeld (1962)](https://doi.org/10.1215/ijm/1255631807), Theorem 11, (3.34), p.71, whose relative error at `log x=10000` is below `0.000081` and decreases thereafter. Every use of this literal constant, including §3.2, carries `SchoenfeldFiniteRangeInput`.

*Needs:* `Chebyshev.theta`.

### 0.4 Prime powers do not erase the character-sum margin

Put `ε=0.002811`. For real `k≥2*10^10`, the prime-power mass `M=ψ(k)−θ(k)−ψ(k/2)+θ(k/2)` is smaller than `(((1−3*ε)/8)−0.1239)*k`. For `b:ℕ→ℂ` with `|b(n)|≤1` whenever `k/2<n≤k`, put `P=Σ_{k/2<p≤k, p prime}b(p)log p` and `V=Σ_{k/2<n≤k}b(n)Λ(n)`. Then `|V−P|≤M`, so `|P|≥(1−3*ε)*k/8` implies `|V|>0.1239*k`.

Use `Λ(p)=logp` and `|b(p^j)|≤1` to get `|V−P|≤M`, hence `|V|≥|P|−M`. Estimate higher powers by `θ` at `k^(1/j)` after subtracting endpoints; retain the strict margin.

Mathlib's `Chebyshev.theta_le_log4_mul_x` and `log4<2` give `θ(t)≤2t` for `t≥0`. Thus `M≤ψ(k)−θ(k)≤2(√k+(log k/log2)k^(1/3))`. After division by `k` both terms decrease for `k≥k₀=2·10^10`: for the second use `log k>3/2`. At `k₀, √k₀>140000, k₀^(1/3)>2700` and `log k₀/log2<35`. Therefore `M/k≤2(1/140000+35/7290000)<367/8000000=((1−3ε)/8)−0.1239`, an exact rational inequality. The prime-power sum has at most `log k/log2` terms with exponent `≥3`; no rounding of `k` is needed. The weighted implication requires the same coefficient sequence in both sums and the bound `|b(n)|≤1` at higher prime powers, not only at primes.

See [47][R47], §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*).

*Needs:* `Chebyshev.psi`; `Chebyshev.theta`; `Chebyshev.theta_le_log4_mul_x`.

### 0.5 Rosser–Schoenfeld explicit prime-count bounds

`primeCounting_bounds_of_rosserSchoenfeld`: under `RosserSchoenfeldFiniteRangeInput`, for `x≥59`, `(x/log x)(1+1/(2 log x))<π(x)<(x/log x)(1+3/(2 log x))`.

- `RosserSchoenfeldFiniteRangeInput`: both displayed strict inequalities for every real `59≤x<exp(10000)`. Source: Rosser–Schoenfeld (1962), Theorem 1 and §7, pp.81–82; [47][R47], §9 proof, p.382.

For `x≥exp(10000)` prove the pair from Rosser–Schoenfeld (1962), §7, Lemmas 1–5, and its analytic Chebyshev estimates.

*Needs:* `Nat.primeCounting`.

### 0.6 Bounded-height Landau–Page theorem

The theorem expresses the absence of any exceptional zero in a bounded-height family of primitive characters.

There is an effective absolute `c>0` such that, for `T≥2`, no primitive Dirichlet character of modulus `q≤T` has a zero `ρ=β+i*t` with `|t|≤T` and `β>1-c/log T`. Page's theorem and the classical Landau–Page form (at most one such zero, a simple real zero of a real character) follow at once; this exception-free form is the stronger one and is the one stated.

Use ZerosOfLFunctions §§6.2–6.4 through §0.30. For `q,|t|≤T`, `log(q(|t|+2))≤3logT+O(1)`; shrink one effective width so that a zero in the region can only be a simple real zero of a real nonprincipal character. §0.34 excludes it, since such a zero has `1−β≥c_LS/log q≥c_LS/log T`. Shrink again for bounded `T`, with cutoff `>1/2` at `T=2`. For the principal character, the `ζ` region excludes nonreal zeros and `η(s)>0` gives `ζ(s)=η(s)/(1−2^(1−s))<0` on `(0,1)`. Count multiplicities.

See [47][R47], §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26; [109], §1 and Theorem 1.

*Needs:* `DirichletCharacter.LFunction`; `DirichletCharacter.conductor`; §0.30; §0.34.

### 0.7 Quadratic real-zero separation from one

`quadratic_real_zero_le_of_bmor`: assume `BMORFiniteInput` and `BMORClassNumberInput`. For `q≥3` and a nonprincipal quadratic Dirichlet character modulo `q`, a real zero `β>0` satisfies `β≤1-40/(√(q)*(log q)^2)`.

- `BMORFiniteInput`: `L(β,χ)≠0` for real `0<β<1` and every primitive nonprincipal quadratic `χ` of conductor `3≤q≤400000`; and `√q·L(1,χ)>12`, equivalently `h⁺(ℚ(√q))log η_q>12`, for every even primitive quadratic `χ` of conductor `400000≤q<26500000000`. Source: [48][R48], §6.1, Lemma 6.3 and proof of Proposition 1.11, pp.491–494.
- `BMORClassNumberInput`: `h(ℚ(√d))≥46` for every negative fundamental discriminant `d<−319867`; by the class-number formula of ImaginaryQuadraticClassNumber H2.2, `√q·L(1,χ)≥46π` for every odd primitive quadratic `χ` of conductor `q>319867`. Source: [48][R48], Lemma 6.3, pp.491–492, from Watkins' classification (Table 4).

For primitive `q≥400000` these give `L(1,χ)≥12/√q`; above `26500000000` the even case follows analytically from `η_q≥(√(q+4)+√q)/2`. BMOR Lemmas 6.4–6.5 give `|L′(σ,χ)|<0.27356 log²q` on `1−1/(4√q)≤σ≤1`, by partial summation, explicit Pólya–Vinogradov and cutoff `q^0.655`. The mean-value theorem with `12/0.27356>40`, and `log²q>160` farther left, gives the bound. Deleted factors have no positive real zeros and `√q log²q` increases for `q≥3`, which gives the imprimitive case. Every use of the literal constant 40 carries both hypotheses.

See [48][R48], Proposition 1.11, p.436, and its proof, pp.491–494; Bennett–Siksek §12, p.387, uses this estimate.

*Needs:* `DirichletCharacter.LFunction`; ImaginaryQuadraticClassNumber H2.2.

### 0.8 Weighted-prime sum input to the factorial estimate

There exists an absolute real constant `E` such that, for every real `x≥319, log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x)`. The same `E` applies at both endpoints of every interval subtraction.

Use the published two-sided estimate with a single constant `E`, on `x≥319`. The interval corollary is a separate subtraction lemma below.

See [47][R47], §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* `Chebyshev.theta`.

### 0.9 Siegel's theorem

The signature is `quadratic_LFunction_one_lower_bound`. There is an effective absolute `c>0` with `L(1,χ)≥c/log q` for every primitive real nonprincipal character `χ` of conductor `q≥3`. Consequently, for each `ε>0`, Siegel's bound `L(1,χ)≥c_ε q^(−ε)` holds with the effective constant `c_ε=ecε`, because `log q≤q^ε/(eε)`. This effective form is stronger than Siegel's ineffective theorem and is the one stated; it implies ImaginaryQuadraticClassNumber H2.4's `quadratic_LFunction_siegel`.

By §0.34 and the conductor-uniform region of [ZerosOfLFunctions 6.3–6.4][R16] through §0.30, whose only possible exception is a real zero of a real character, every zero `ρ` of `L(s,χ)` with `|Im ρ|≤1` has `Re ρ≤1−c₂/log q` for an effective absolute `c₂>0`. Put `σ₁=1+1/log q` and `σ′=1+2/log q`. For real `1≤σ≤σ₁` and such a zero, `Re 1/(σ−ρ)≤(1+2/c₂)Re 1/(σ′−ρ)`. With the local expansion of §0.30a, `|L′/L(σ,χ)|` is at most the zero sum `Σ_(|Imρ|≤1)Re 1/(σ−ρ)` plus `O(log q)`, this sum is at most `1+2/c₂` times the same sum at `σ′`, and the sum at `σ′` is `L′/L(σ′,χ)+O(log q)=O(log q)` because `|L′/L(σ′,χ)|≤−ζ′/ζ(σ′)` (§0.11b). Hence `|L′/L(σ,χ)|=O(log q)` on `[1,σ₁]`, and integrating `log L(σ,χ)` from `σ₁` down to 1 loses a bounded factor. Finally the real Euler product gives `L(σ₁,χ)≥ζ(2σ₁)/ζ(σ₁)≥(σ₁−1)/σ₁`. `L(σ,χ)` is real and positive on `[1,σ₁]` by the Euler product and Mathlib's nonvanishing on `Re s≥1`.

The fundamental-discriminant form used below, `L(1,χ_D)≥c/log|D|` and hence `L(1,χ_D)≥c_ε|D|^(−ε)` for every fundamental discriminant `D≠1`, is the same statement read through the Multiquadratic field-character dictionary (From Tau Ceti, Multiquadratic and ContourIntegration): `χ_D` is primitive, real and nonprincipal of conductor `|D|`, so the conductor and discriminant powers coincide. This part draws on it in §2.13; the zero gap of §0.31b, and through it §§1.2a and 2.31e, and Siegel–Walfisz (§0.32) come from §0.34 directly.

Checks: `D=−4` gives `L(1,χ₋₄)=π/4` and `D=−3` gives `L(1,χ₋₃)=π/(3√3)`, so at these conductors the bound holds with any `c≤(π/(3√3))log 3`; `D=1` is excluded, since `L(s,χ₁)=ζ(s)` has a pole at 1; the conductor of `χ_D` is `|D|` and not the radicand, so `D=−8` enters with `q=8`, not `q=2`; through the class-number formula of ImaginaryQuadraticClassNumber H2.2 the bound gives `h(D)≥c√|D|/log|D|` effectively.

See [109], Theorem 1 and §1; [113] for the relation between the logarithmic zero gap and lower bounds for `L(1,χ)`; Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem 12.9, p.125, for Siegel's ineffective statement, which the effective form implies.

*Needs:* §0.34; §0.30; §0.30a; §0.11b; [ZerosOfLFunctions 6.3–6.4][R16]; `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; the Multiquadratic field-character dictionary (From Tau Ceti, Multiquadratic and ContourIntegration).

### 0.10 Prime-number input

For all sufficiently large `x`, the number of primes in `(x,3x]` lies between `4+x/log x` and `3x/log x`.

Apply the rational PNT at `x` and 3x, subtract, and choose the threshold to absorb the constant 4.

See [50][R50], §3.5, proof of Theorem2, p.25.

*Needs:* the qualitative prime asymptotics listed under Prerequisites and boundaries.

### 0.11 Mertens's first theorem and `Σ_{p | N} log p/p = O(log log N)`

For `X≥2, Σ_{p<X}(log p)/p=log X+O(1)`, with an absolute implied constant.

Sum `log n=Σ_(d|n)Λ(d)` to get `Σ_(n≤x)log n=Σ_(d≤x)Λ(d)floor(x/d)`. Chebyshev `ψ(x)=O(x)` controls floor replacement. Insert `xlog x−x+O(log x)`, divide by `x`, and remove higher powers with the convergent majorant `Σ_(m≥2)log m/[m(m−1)]`. The layer's Mertens note specifies both elementary inputs. Changing `p≤x` to `p<x` costs at most `log x/x` for `x≥2`.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(a) and proof, p.40.

*Needs:* §0.11d; `ArithmeticFunction.vonMangoldt_sum`; `Chebyshev.psi_le_const_mul_self`; `sum_mul_eq_sub_sub_integral_mul`.

#### 0.11a Prime-cutoff and tail exports

State the rational Mertens estimates on Mathlib's finite set of primes `Nat.primesLE n`
(the primes `p ≤ n`), with the prime weight `(log p)/p` and the von Mangoldt weight
`Λ(n)/n` as coefficients on that finite sum. Arbitrary bounded weights in §0.11c are
coefficients on this native prime sum, not another prime carrier.

Export §0.11's Mertens estimate on the native finite prime sum with inclusive real
cutoff `p ≤ x`, `x ≥ 2`, retaining its strict/inclusive comparison. Consume Mathlib's
`Chebyshev.theta_le_log4_mul_x` for `θ(x) = Σ_{p≤x} log p ≤ (log 4) x`, and derive by
partial summation one absolute `C ≥ 0` such that `Σ_{p≥y} (log p)/p² ≤ C/y` for every
real `y ≥ 2`.

State summability of the tail and give strict/inclusive, finite/infinite, and interval
adapters. Retain the endpoint prime in exactly one interval and include prime `2`.
The boundary term at infinity vanishes by Chebyshev.

Use rational prime carriers and absolute constants. Specialization of the existing
Tau Ceti number-field Mertens theorem to the fixed field `ℚ`, together with its
prime-ideal/rational-prime transport, also supplies the rational estimate. A constant
for a varying quadratic field is not an absolute constant over its characters.

**Checks.**

- `y = 2`: the tail is the whole series `Σ_p (log p)/p²`, including the term `(log 2)/4` of the prime `2`, which a strict cutoff `p > y` would omit.
- The constant: Stieltjes integration by parts gives `Σ_{p≥y} (log p)/p² = −θ(y⁻)/y² + 2∫_y^∞ θ(t) t⁻³ dt ≤ 2 log 4 ∫_y^∞ t⁻² dt`, so `C = 2 log 4` serves.
- The exponent: with the weight `(log p)/p` in place of `(log p)/p²` the tail diverges by Mertens, so no `C` exists; the bound separates the two weights.

*Needs:* §0.11; the completed ArithmeticDirichletSeries summation and prime-power
APIs; native Chebyshev (`Chebyshev.theta_le_log4_mul_x`) and Abel summation
(`sum_mul_eq_sub_sub_integral_mul`). The tail derivation is the Stieltjes
integration-by-parts identity for `dθ(t)` against `t^(-2)`, with `θ(t)=O(t)`.

#### 0.11b Uniform Euler logarithmic derivatives

For any complex Dirichlet character and `1<σ≤2`, prove absolute convergence and a
character-independent bound for the prime-power contribution with exponents at least
two. The geometric sum is bounded by `Σ_{n≥2} log n/(n(n−1))`, which is summable and
contains no character or conductor. Consume Mathlib's `DirichletCharacter.LSeries_twist_vonMangoldt_eq`
and the continued-function comparison on `Re s>1` to export
`|L′/L(σ,χ) + Σ_p χ(p) (log p)/p^σ| ≤ C`.

The constant is chosen before the modulus, character, and evaluation point. State
summability of the displayed prime series. Include the real-valued form for real
characters, retaining the scalar-cast comparisons and the zero values at primes
dividing the modulus. Primitivity and nonprincipality are not needed for this
half-plane formula.

Export also one absolute bounded error in `−ζ′/ζ(1+η) = η⁻¹ + O(1)` for `0 < η ≤ 1`.

Use `ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux` at level
one and `DirichletCharacter.continuousOn_neg_logDeriv_LFunctionTrivChar₁` to identify
the regularized logarithmic derivative. Check its sign and the pole-removal identity
before taking its bound on the compact interval. This is a consequence of the
existing regularized function, not a new Laurent-series construction. All functions
here are canonical continued L-functions, with series comparisons used only in their
convergence half-plane.

**Checks.**

- Level `1`, `σ = 2`: `−ζ′/ζ(2) − Σ_p (log p)/p²` is the positive prime-power tail `Σ_p (log p)/(p²(p²−1))`, which a definition identifying `−L′/L` with the prime sum alone would set to zero.
- The regularized error `−ζ′/ζ(1+η) − η⁻¹` tends to `−γ` as `η → 0⁺`, by the Laurent expansion `ζ(s) = 1/(s−1) + γ + O(s−1)`, which gives `ζ′/ζ(1+η) = −η⁻¹ + γ + O(η)`; subtracting the pole with the wrong sign, `−ζ′/ζ(1+η) + η⁻¹ = 2η⁻¹ − γ + O(η)`, is unbounded as `η → 0⁺`.
- The principal character modulo `q` is allowed: `L(s,χ₀) = ζ(s) ∏_{p∣q} (1−p^(−s))`, so `−L′/L(σ,χ₀) − Σ_{p∤q} (log p)/p^σ` differs from the level-`1` quantity by `−Σ_{p∣q} (log p)/(p^σ(p^σ−1))`, of absolute value at most `Σ_p (log p)/(p(p−1))`, independent of `q`.

*Needs:* §0.11a for prime carriers; Mathlib Euler logarithmic derivatives and the
regularized zeta function; ArithmeticDirichletSeries prime-power regrouping. The
geometric-majorant argument above supplies the uniformity without any zero-free
region to the left of one.

#### 0.11c Weighted-prime Mellin smoothing

For bounded weights on primes, define the weighted prime sum `A(x) = Σ_{p≤x} a_p (log p)/p`
as the finite sum over Mathlib's `Nat.primesLE ⌊x⌋₊` with the scalar `(log p)/p` acting on
the weight `a_p`; do not introduce another prime type. The weights take values in a real
Banach space, so the real, signed and complex versions are one definition on the same
finite sum and scalar maps. Its API:

- `A(x) = 0` for `x < 2`, and `A(x)` depends on `a` only through its values at primes.
- `A` is linear in `a`, and for `|a_p| ≤ 1` Mertens (§0.11a) gives `|A(t)| ≤ C + log t` for `t ≥ 1`.
- For `|a_p| ≤ 1` and `η > 0`: the series `Σ_p a_p (log p)/p^(1+η)` is summable, `t ↦ t^(−1−η) A(t)` is Bochner integrable on `(1,∞)`, and `Σ_p a_p (log p)/p^(1+η) = η ∫₁^∞ A(t) t^(−1−η) dt`.

Give the finite-cutoff integration-by-parts formula first, then prove the boundary
term tends to zero and the truncated integrals and series converge. The bound
`|A(t)|≤C+log t` justifies the limit for every `η>0`. The initial interval
`1≤t<2` contributes zero to `A`.

Export linearity and monotonicity of the weighted integral `η ∫₁^∞ f(t) t^(−1−η) dt`
under explicit integrable domination, and the scalar identities
`η ∫₁^∞ t^(−1−η) dt = 1` and `η ∫₁^∞ (log t) t^(−1−η) dt = η⁻¹`.

Prove integrability and Jensen's bound `η ∫₁^∞ log log(3t) t^(−1−η) dt ≤ log(log 3 + η⁻¹)`,
then a single absolute bound `log(log3+η⁻¹)≤C log(2/η)` for `0<η≤1`.
After `u=log t` the measure is the probability density `η exp(−ηu)du` on `u≥0`;
its mean is `η⁻¹`, and concavity of `log` gives the inequality.
A linear majorant in `u` gives the required integrability before applying Jensen.

**Checks.**

- `A(1) = 0`, since `Nat.primesLE 1` is empty, and `A(2) = (log 2)/2` for `a ≡ 1`; `A(2.9) = A(2)`, the cutoff being `⌊x⌋₊ = 2`. A sum over all `n ≤ x` without the primality filter would give `A(4) = (log 2)/2 + (log 3)/3 + (log 4)/4` in place of `(log 2)/2 + (log 3)/3`.
- Altering `a` at the non-primes `1`, `4`, `6` leaves `A` unchanged; replacing `a_p` by `−a_p` negates `A` and both sides of the Mellin identity, so the identity's sign follows the coefficients.
- The Mellin identity at `a ≡ 1`: each prime contributes `(log p)/p · η ∫_p^∞ t^(−1−η) dt = (log p)/p^(1+η)`, so at `η = 1` both sides equal `Σ_p (log p)/p²`; without the factor `η` the right side at `η = 2` would be `Σ_p (log p)/(2p³)`, half the left side.
- The scalar identities at `η = 2`: `2 ∫₁^∞ t⁻³ dt = 1` and `2 ∫₁^∞ (log t) t⁻³ dt = 1/2`, so the log moment is `η⁻¹` and not `η⁻²`.

*Needs:* §0.11a, existing Abel summation, improper-integral convergence and Bochner
integral calculus, exponential moments, and Jensen for the logarithm. These are
classical partial summation and scalar-integral consequences; the derivations above
specify their complete prerequisite chain.

This section owns neither a new prime-sum improvement, the choice of smoothing parameter
in a particular proof, nor its combination with a selected-zero inequality. The
latter analytic interface is supplied directly by ZerosOfLFunctions §6.4 on the
primitive Dirichlet record; §0.30's ray-class dictionary remains a downstream consumer.

#### 0.11d Logarithmic factorials and Chebyshev's identity

`log_floor_factorial_eq_sum_vonMangoldt`: for every real `x`,
`log⌊x⌋!=Σ_(1≤n≤x)Λ(n)⌊x/n⌋=Σ_(1≤m≤x)ψ(x/m)`, with `⌊x⌋=⌊x⌋₊` and inclusive cutoffs; all three
sides vanish for `x<2`. By `Real.sum_log_eq_log_factorial` the left side is `Σ_(1≤n≤x)log n`.
Expand each `log n=Σ_(d∣n)Λ(d)` (`ArithmeticFunction.vonMangoldt_sum`) and count the pairs
`(d,m)` with `dm≤⌊x⌋`: for fixed `d` there are `⌊⌊x⌋/d⌋=⌊x/d⌋` of them (`Nat.floor_div_natCast`),
and for fixed `m` the sum of `Λ(d)` over `d≤⌊x/m⌋` is `ψ(x/m)` (`Chebyshev.psi_eq_psi_coe_floor`).

Mathlib supplies explicit bounds at every real `x≥1`: through `Real.sum_log_eq_log_factorial`,
`Real.le_sum_log` and `Real.sum_log_le` read `x log x−x−log x+1≤log⌊x⌋!≤x log x−x+log x+1`. They
are consumed, not restated. `log_floor_factorial_bounds` halves both logarithmic terms: for every
real `x≥1`,
`x log x−x−(1/2)log x+(1/2)log π≤log⌊x⌋!≤x log x−x+(1/2)log x+1`,
so `|log⌊x⌋!−x log x+x|≤(1/2)log x+1`. For the upper bound, concavity of `log` makes each
trapezoid `(log k+log(k+1))/2` at most `∫_k^(k+1)log t dt`, so `log n!≤n log n−n+1+(1/2)log n` at
`n=⌊x⌋`, and `t log t−t+(1/2)log t` increases on `[1,∞)`. For the lower bound apply
`Stirling.le_log_factorial_stirling`, `log n!≥n log n−n+(1/2)log(2πn)`, at `n=⌊x⌋`; then
`x log x−x−(n log n−n)=∫_n^x log t dt≤log x` and `log n≥log x−log 2`.

**Checks.**

- `x=4`: `log 24=2Λ(2)+Λ(3)+Λ(4)=3log2+log3`, and `ψ(4)+ψ(2)+ψ(4/3)+ψ(1)=(2log2+log3)+log2`;
  replacing `⌊x/n⌋` by `x/n` gives `3log2+(4/3)log3`, not `log 24`.
- `x=1`: the upper bound is the equality `0≤0`, and the lower bound reads `(1/2)log π−1≈−0.43≤0`.
- `x=2`: the upper bound reads `log2≤(5/2)log2−1≈0.733`; without the term `(1/2)log x` it would
  read `log2≤2log2−1≈0.386`, which is false.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(a) and proof, p.40. *Needs:*
`Real.sum_log_eq_log_factorial`; `Real.le_sum_log`; `Real.sum_log_le`;
`Stirling.le_log_factorial_stirling`; `ArithmeticFunction.vonMangoldt_sum`;
`Chebyshev.psi_eq_psi_coe_floor`; `Nat.floor_div_natCast`.

### 0.12 Effective distance of a quadratic real zero from one

For each `ε>0` there is an effectively computable `c_ε>0`, fixed before `D` and `β`, such that for every nonzero squarefree integer `D≠1` and real zero `β∈(1/2,1)` of the canonical continued primitive field-character `L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε)`. The conductor is `Q_D=|Disc(Q(√D))|`, with `|D|≤Q_D≤4|D|`; conductor/radicand conversion only changes `c_ε` effectively.

Quadratic class-number formulas give `L(1,χ)≥c/√Q`: imaginary fields use `h≥1,w≤6`; real fields use `h≥1,ε≥(1+√5)/2` from integral trace and `norm±1`. §0.31a gives `|L′|≤C log²Q` on `[1−1/logQ,1]`. Mean value treats zeros there; otherwise `1−β≥1/logQ`. Use `Q_D≤4|D|` and effectively absorb logs into `|D|^ε`. This is the effective exponent 1/2; it does not use §0.34, which uses it for its finitely many small conductors.

Only real zeros in(1/2,1) are used; trivial negative zeros are outside the interface. No ineffective Siegel constant can discharge the effective `c_ε` contract. At `D=−1` or2 the positive conductor is4 or8, respectively; the finite small-conductor range is included effectively.

See [51][R51], §7.2 proof of Proposition7.6, p.62, immediately after(7.7).

*Needs:* `DirichletCharacter.LFunction`; `NumberField.classNumber`; §0.31a.

### 0.13 Exceptional quadratic squareclasses

For `0<c<1/2` let `S(c)` consist of nonzero squarefree `d≠1` such that the primitive quadratic character of `Q(√d)` has a real zero `β∈[1−c/log(|d|+4),1]`. The conductor is `|d|` or `4|d|` as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing `|d|`; an infinite enumeration requires infinitude, which is not asserted.

Use the canonical primitive field character with `D(d)=d` for `d≡1 mod4`, otherwise `4d`; values are `(D(d)/n)`, including the separated 2-primary Kronecker factor. Use continued `L`-values on the stated real interval. Height-bounded selections are finite; neither zero existence nor an infinite enumeration is asserted.

- `exceptional_squareclasses.membership`: Membership is the stated near-one zero condition for the primitive field character.
- `exceptional_squareclasses.mono`: If `0<c≤c′<1/2` then `S(c)⊆S(c′)`.
- `exceptional_squareclasses.finite_height`: For each `B` there are finitely many `d∈S(c)` with `|d|≤B`.
- `exceptional_squareclasses.conductor`: Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

**Checks.**

- `d=1` is excluded, so a principal pole cannot be called an exceptional zero.
- `d=−1` has conductor 4, not conductor 1.
- `d=2` has conductor 8, not 2.
- The definition permits an empty or finite `S(c)`; it does not fabricate an infinite sequence.

See [51][R51], §7.2 Definition7.5 and its enumeration paragraph, p.61.

*Needs:* [GlobalNumberFields 10][R20]; `DirichletCharacter.LFunction`.

### 0.14 Pole-cancelled Riemann xi

`ξ(s)=1/2+(1/2)s(s−1)completedRiemannZeta₀(s)`. This is the entire extension of `(1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s)` away from the completed poles, not the pointwise pole-multiplication convention at `s=0,1`. Prove the identity off 0 and 1 and the reflection for this pole-cancelled entire function.

The comparison is `2 * riemannXi = entireCompletion (dirichletData 1)`, using [LFunctions 4][R52] and [ZerosOfLFunctions 0.2][R11]. This equality is of analytic extensions, including 0 and 1. Entirety, symmetry and order one are inherited from that completion. In particular `ξ(0)=ξ(1)=1/2` and `ξ(2)=ξ(−1)=π/6`; omitting the factor 2 would fail both pairs of values.

Entirety and reflection follow from the pole-subtracted completion and finite algebra; `completedRiemannZeta_eq` compares off 0,1. Comparison with `Γ·ζ` also uses Gamma nonvanishing.

- `riemann_xi.entire`: `ξ` is entire by differentiability of the pole-subtracted completion.
- `riemann_xi.reflection`: `ξ(1−s)=ξ(s)` for all complex `s`.
- `riemann_xi.comparison`: For `s≠0,1, ξ(s)=(1/2)s(s−1)completedRiemannZeta(s)`.
- `riemann_xi.endpoints`: `ξ(0)=ξ(1)=1/2`.

**Checks.**

- `ξ(0)=1/2`, not0.
- `ξ(1)=1/2`, not0.
- `ξ(2)=ξ(−1)=π/6`, fixing both the centre 1/2 and the factor 2 against the supplier completion.

See [53][R53], §5.1 (5.1.4), xi definition and reflection, pp.34–35; Lemma8.3 p.47.

*Needs:* `completedRiemannZeta₀`; `differentiable_completedZeta₀`; `completedRiemannZeta₀_one_sub`; `completedRiemannZeta_eq`.

### 0.15 Weierstrass primary factors and locally uniform products

Define `elementaryFactor` by `E_p(w)=(1−w)exp(Σ_(j=1)^p w^j/j)`, with an empty sum for `p=0`. Let `ι` be countable, `a:ι→ℂ` nonzero points repeated according to multiplicity and `p:ι→ℕ` genera, with `|a_i|→∞` along the cofinite filter (so finite and empty families are included) and `Σ_i(R/|a_i|)^(p_i+1)<∞` for every `R>0`. Then `∏_i E_(p_i)(z/a_i)` converges locally uniformly on `ℂ` to an entire `F` with `analyticOrderAt F z=#{i : a_i=z}` for every `z` (`exists_entire_primary_product_exact`). Fixed and variable genera are the same statement; the empty product is 1.

- Every `E_p` is entire, `E_p(0)=1`, and its only zero is a simple zero at `w=1`.
- `|1−E_p(w)|≤|w|^(p+1)` for `|w|≤1`, including `p=0` and `w=1`.
- For holomorphic `u_j` on an open `U` with `Σ_j sup_K|u_j|<∞` for every compact `K⊂U`, `∏_j(1+u_j)` converges locally uniformly on `U` to a holomorphic function. At each `z` only finitely many factors vanish; if none of them vanishes identically near `z`, their orders add to the order of the product and the remaining tail is a holomorphic unit germ.
- Reindexing by an equivalence and grouping finite multiplicity fibres preserve the product.
- `canonical_factor.one_genus`: `E₁` is [ZerosOfLFunctions 5.3][R15]'s `(1−w)exp(w)`, by equality of the defining formulas.
- `canonical_factor.log_tail`: there is `C_n>0` with `|log(1−w)+Σ_(j=1)^n w^j/j|≤C_n|w|^(n+1)` for `|w|≤1/2`, with the principal logarithm.

The power series of `1−E_p` has nonnegative real coefficients, vanishing through degree `p` and summing to 1 at `w=1`; hence the sharp estimate on the closed disc. For the product put `u_i(z)=E_(p_i)(z/a_i)−1`: on `|z|≤R` all but finitely many `i` have `|a_i|≥R`, and for those `sup|u_i|≤(R/|a_i|)^(p_i+1)`, a summable majorant depending on the compact set. Apply Mathlib's `Summable.hasProdUniformlyOn_one_add` on each compact set, assemble the conclusions into `HasProdLocallyUniformlyOn`, and use that locally uniform limits of holomorphic functions are holomorphic. For the orders, discard the finitely many factors with `|u_i|>1/2`, sum the logarithmic series of the remaining tail, which is therefore a unit germ, and add the orders of the finitely many discarded factors. For `log_tail` cancel the first `n` Taylor terms and bound the geometric tail.

**Checks.**

- `E_p(0)=1` and `E_p(1)=0` for every `p`; `E₀(w)=1−w`, with no exponential factor.
- `E₁(w)E₁(−w)=1−w²`.
- `E₀(−1)=2`, `E₁(−1)=2exp(−1)` and `E₂(−1)=2exp(−1/2)`, distinguishing the genera at one argument.
- Two genus-zero factors at `a=1` give `(1−z)²` and order 2 at 1, not the cardinality 1 of the distinct support.

See [114], Theorem 15.6, Lemma 15.8 and Theorem 15.9; [54][R54], Appendix B.1, definition preceding (B.1), p.901.

*Needs:* [ZerosOfLFunctions 5.3][R15]; Mathlib `Summable.hasProdUniformlyOn_one_add`, `HasProdLocallyUniformlyOn`, `analyticOrderAt` and holomorphic locally uniform limits; the Taylor series of `Complex.log` on the unit disc.

**§0.15a Equal-divisor factorization.** `exists_entire_exp_mul_of_divisor_eq`: if `f` and `F` are entire, neither is identically zero, and `MeromorphicOn.divisor f univ=MeromorphicOn.divisor F univ`, then `f=exp(g)F` for an entire `g`, unique up to an additive constant in `2πiℤ`. Extend `f/F` through the common zeros: equal orders make every singularity removable and the extension `q` zero-free, with `f=qF` everywhere; then take the entire logarithm of `q` from [ZerosOfLFunctions Layer 5][R15]. Both nontriviality hypotheses are needed: the divisor of the zero function is also zero, and `f=0`, `F=1` have equal divisors while `exp(g)·1` never vanishes. With §0.15 this gives every nonzero entire `f` the form `z^m exp(g(z))∏E_(p_a)(z/a)^(m_a)` over its nonzero zeros, for admissible genera and an entire `g`, without a growth hypothesis. Source: [114], Theorem 15.10. *Needs:* §0.15; [ZerosOfLFunctions Layer 5][R15]; native analytic orders and removable singularities.

### 0.16 Mod-eight prime mass

`thetaAP_eight_interval_ge`: assume `ModEightFiniteInput`. With `ε=0.002811`, for `a=3` or 5 and `k≥2*10^10, θ(k;a,8)-θ(k/2;a,8)≥(1-3*ε)*k/8`.

- `ModEightFiniteInput`: `|θ(x;a,8)−x/4|≤0.002811x/4` for `a∈{3,5}` and every real `10^10≤x<exp(10000)`; and every zero of `L(s,χ)` with `0<Re s<1` and `|Im s|≤10000`, for every Dirichlet character `χ` modulo 8, has `Re s=1/2`. Source: [47][R47], §6, pp.369, 372, and [Ramaré–Rumely][RR-primes], Theorem 2.1.1, p.399, at the primitive conductors 1, 4 and 8.

For `x≥exp(10000)` prove the same theta bound from the zero hypothesis, the high-height zero-free region and the smoothed explicit estimate of [Ramaré–Rumely][RR-primes], §§3.6 and 4.1–4.3, especially Theorem 4.3.1, pp.415–416: the low zeros contribute a bounded zero count times `x^(−1/2)`, and the zero-free region bounds the high-zero integral at `log x≥10000`. Combine the two ranges and subtract at `k` and `k/2`; the errors sum to `3εk/8`.

*Needs:* §0.2.

### 0.17 Two-real-zero inequality

There is an effective absolute `c_star>0` such that if distinct real primitive quadratic characters of conductors `N1,N2>1` have real zeros `beta1,beta2`, then `min(beta1,beta2)<1-3*c_star/log(N1*N2)`.

Put `χ₁,χ₂` and their nonprincipal product at a common level dividing `N₁N₂`. The nonnegative logarithmic factor of `ζLχ₁Lχ₂Lχ₁χ₂` is `(1+χ₁(p)^k)(1+χ₂(p)^k)`. ZerosOfLFunctions §§6.4b–d controls primitive-source, Gamma and logarithmic-derivative terms. Discard other zero terms to obtain, for `1<σ≤2`,
`1/(σ−β₁)+1/(σ−β₂)≤1/(σ−1)+C log(N₁N₂)`.
With `ℒ=log(N₁N₂)`, `a=1/(4(C+1))`, `b=a/4`, `σ=1+a/ℒ`, both `β_j≥1−b/ℒ` would give `1.6ℒ/a≤ℒ/a+Cℒ`, a contradiction. Choose `3c_star≤b`, also satisfying §0.1’s width comparison. This includes zeros on the lower boundary and supplies Landau–Page’s family step.

See [47][R47], Proposition 7.1(i), (23), p. 373.

*Needs:* §0.1; `DirichletCharacter.LFunction`.

### 0.18 Effective character prime-number estimate

No exceptional-zero term occurs; absolute constants are chosen before the conductor.

For a primitive nonprincipal character `χ` of conductor `N>1` and `X` sufficiently large, `Σ_{m≤X}χ(m)*Λ(m)=O(X*exp(-c*log X/(√(log X)+log N))*(log N)^4)`; `c>0`, the implied constant and the threshold are absolute and effective. This form, without the term `−X^β/β` of an exceptional zero, is the stronger one and is the one stated.

Use the character explicit formula. The conductor-uniform region of ZerosOfLFunctions 6.3–6.4 (through §0.30 and §0.1's supplier comparison) contains no zero except possibly one simple real zero `β≥1/2` of a real `χ`. §0.34 gives `1−β≥c_LS/log N`, so its term satisfies `X^β/β≤2X exp(−c_LS log X/log N)`, which the stated error absorbs once `c≤c_LS`. Optimize the height using the conductor-uniform region; preserve `log N` and the effective constants.

See [47][R47], Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27; both carry the exceptional term that §0.34 removes.

*Needs:* §0.1; §0.30; §0.34.

### 0.19 Explicit reciprocal-prime estimate

There is the prime Mertens constant `B=0.26149`.. such that for `x≥286, |Σ_{p≤x}1/p-log log x-B|<1/(2*(log x)^2)`.

Use the original reciprocal-prime theorem and its common prime Mertens constant. Keep `x≥286`; the rounded decimal is a label, not the definition of `B`.

See [47][R47], §9 proof, p. 382; Rosser–Schoenfeld Theorem 5.

*Needs:* §0.8.

### 0.20 Weighted prime sum on an interval

For `x≥y≥319`, `Σ_(y<p≤x)(logp)/p>log(x/y)−1/(2logx)−1/(2logy)`.

Subtract the lower bound at `x` and the upper bound at `y`; the same `E` cancels. Use the `log` quotient identity for positive `x,y`.

See [47][R47], §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* §0.8.

### 0.21 Mertens's second theorem: the reciprocal-prime sum

There is a real `B` such that `Σ_{p≤x}1/p=log log x+B+O(1/log x)` for real `x≥2`, with an absolute implied constant.

Pass to inclusive primes at cost `≤log x/x`. For bounded `R(t)=Σ_(p≤t)log p/p−log t`, Abel summation with `1/log t` gives `Σ_(p≤x)1/p=log log x+B+R(x)/log x−∫_x^∞R(t)/[t(log t)²]dt`. The defining integral for `B` converges absolutely; the remaining tail `≤sup|R|/log x`, for `x≥2`.

One `B` and one absolute error constant work for every real `x≥2`. At `x=2` the prime 2 is included; changing the endpoint convention only changes the bounded remainder.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(b) and its proof, pp.40–41.

*Needs:* §0.11; `sum_mul_eq_sub_sub_integral_mul`.

### 0.22 Origin-zero adapter for Hadamard factorization

Let `f` be entire, not identically zero, with `OrderLE f 1`, and let `m` be its finite analytic order at 0. Extend `f(z)/z^m` analytically across 0 to `g`. Then `g(0)≠0` and `OrderLE g 1`. Apply [ZerosOfLFunctions 5.4–5.6][R15] to `g` and multiply by `z^m`. The resulting product has precisely the nonzero divisor of `f`, with multiplicities and the supplier's locally uniform unordered convergence. Only removal of the origin zero belongs here; the canonical product, zero estimates and affine logarithm are imported.

Use the finite analytic-order factorization near 0 and the quotient elsewhere. They agree on the punctured neighbourhood. At infinity `|z|≥1` implies `|g(z)|≤|f(z)|`, which preserves the supplier's cobounded growth predicate. No assertion is made for identically zero `f`.

**Checks.**

- For `f(z)=z²exp(z), m=2` and `g=exp`, so the nonzero-zero product is empty.
- For `f(z)=1−z², m=0` and `E₁(z)E₁(−z)=1−z²`, fixing the pairing sign.
- For `f=1` the divisor and `m` are zero; for `f=0` the finite-order-at-origin hypothesis fails.

See [53][R53], Theorem 8.7 proof, p.49, and Exercise 8.4.10, p.52. This adapter extends the supplier's `f(0)≠0` hypothesis.

*Needs:* `AnalyticAt.analyticOrderAt_eq_natCast`; analytic factorization at a finite-order zero; [ZerosOfLFunctions 0.1 (OrderLE)][R11]; [ZerosOfLFunctions 5.4–5.6][R15].

### 0.23 Finite-order Hadamard factorization

The signature `finite_order_hadamard` states the locally uniform canonical product, polynomial degree bound and multiplicity-weighted zero summability directly using native analytic multiplicities. Its growth hypothesis spells out the compact-boundedness formulation of the supplier’s `OrderLE`.

For nonzero entire `f` of finite order at most `ρ≥0`, set `n=floor ρ`. Its nonzero zeros `α` with multiplicity satisfy `Σ|α|^(−n−1)<∞` and `f(z)=z^m exp(h(z))∏E_n(z/α)`, where `E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h` is a polynomial of degree `≤n` and the product converges locally uniformly. Finite/empty zero sets are allowed.

For `ρ<σ<s<n+1`, Jensen gives `N(r)=O(r^σ)`, hence summability at `n+1`. Apply §0.15's product theorem at the fixed genus `n` to this repeated zero list, and §0.15a to write `f=z^m exp(h)P` with `h` entire. For this genus-`n` product `P`, prove `canonicalProduct.good_circles`: there are `R_j→∞` and `C>0` with `|P(z)|≥exp(−C R_j^s)` on `|z|=R_j`. Split zeros at `2|z|`; exclude discs of radii `|α|^(−n−1)`, whose tail radii are summable, and absorb `N(2|z|)log|z|` into `|z|^s`. On these circles the entire logarithm has real part `O(R_j^s)`. Borel–Carathéodory and Cauchy force its derivatives of order `≥n+1` to vanish. Finite zero sets use the same estimates with finite products.

Checks: `f=1` has an empty zero product and a constant logarithm; `f(z)=z²exp(z)` has `m=2`, an empty nonzero-zero product and degree-one exponent; `f(z)=(z−1)²` uses two occurrences of the same zero and genus zero; `f(z)=exp(z²)` has order two and a quadratic exponent, so a degree-one conclusion would fail.

See [54][R54], Appendix B.1, (B.1)–(B.3), pp.901–902; [Kupers][R95], Theorem14.1.1 and proof, Lemmas14.1.4–14.1.5 and Corollary14.1.6, pp.89–93. Use the strict upper endpoint `ρ<n+1` required by that proof.

*Needs:* [ZerosOfLFunctions Entire order at most `ρ`][R11]; §0.15; §0.15a; `AnalyticOnNhd.sum_divisor_le`; `Complex.borelCaratheodory`.

**§0.23a Higher derivatives of the Gamma remainder.** The intermediate target `gammaRemainder.slit_logGamma` constructs the holomorphic logarithm `logΓ` on the slit plane `ℂ∖(−∞,0]`, normalized by `logΓ(1)=0`, with `exp(logΓ(z))=Γ(z)` and real values on the positive real axis. With the principal `Log z`, define `R(z)=logΓ(z)−(z−1/2)Log z+z−log(2π)/2`. Prove the Stieltjes identity `R(z)=∫₀^∞Q(t)/(z+t)²dt`, where `Q(t)=({t}−{t}²)/2`. On every compact slit-plane subset prove absolute convergence and a common integrable majorant. On the supplier sector `|arg z|<π−δ, |z|>1`, `0<δ<π`, identify this logarithm with [ZerosOfLFunctions 1.2–1.4][R12]’s branch: both take value 0 at 2, and their difference is a constant in `2πiℤ`.

For every integer `j≥1` and `z` in the slit plane,
`R^(j)(z)=(-1)^j (j+1)! ∫₀^∞ Q(t)/(z+t)^(j+2) dt`,
`|R^(j)(z)|≤j! sec^(j+2)(arg(z)/2)/(8|z|^(j+1))`.
The slit-plane Stieltjes identity is a local extension of the supplier’s sectorial Stirling and digamma estimates. Fix `δ>0` before taking a uniform constant on `|arg z|≤π−δ`.

Differentiate the Stieltjes integral under the integral sign: every compact subset of the slit plane has `|z+t|≥c_K(1+t)`. Use `0≤Q≤1/8` and `|z+t|≥cos(arg(z)/2)(|z|+t)`, then integrate the resulting power. API: `gammaRemainder.stieltjes_integral`, `.compact_domination`, `.supplier_branch`, `.iteratedDeriv_integral`, `.iteratedDeriv_sector_bound`. **Checks:** `logΓ(1)=logΓ(2)=0` and `R(1)=1−log(2π)/2`; `R′(x)<0` for `x>0`; at `x=1, R′(1)=1/2−EulerGamma`; the kernel `(z+1)⁻²` has first derivative `−1/4` and second derivative 3/8 at `z=1`, fixing the sign and factorial; `δ=0` and `z=0` are excluded. The geometric estimate remains valid when `Re z<0` inside the slit sector.

See [Nemes, Gamma error bounds][R55], (2.5) and Lemma 2.1, §2 p.6; the displayed derivative formula follows by dominated differentiation. *Needs:* [ZerosOfLFunctions 1.2–1.4][R12]; dominated differentiation of parameter integrals.

### 0.24 Repulsion of exceptional conductors

With `c_star` from Proposition 7.1, two distinct exceptional quadratic conductors `N1<N2` satisfy `N2>N1^2`.

Apply the two-real-zero inequality at the same effective `c_star`. If `N₂≤N₁²` then `log(N₁N₂)≤3 log N₁`, contradicting both strict exceptional cutoffs.

See [47][R47], Proposition 7.1 and equation (25), pp. 373-374.

*Needs:* §0.1; §0.17.

### 0.25 Explicit prime Euler-product bound

`prod_one_add_inv_prime_le`: assume `PrimeProductFiniteInput`. For real `x≥10^8, ∏_{p prime,p≤x}(1+1/p)≤2*log x`.

- `PrimeProductFiniteInput`: `Σ_(p≤x)1/p≤log log x+0.27+5/log x` for every real `10^8≤x<exp(10000)`. Source: Rosser–Schoenfeld (1962), Theorem 5, (3.17), p.70, whose upper bound `Σ_(p≤x)1/p<log log x+B+1/(2log²x)` for `x>1`, with `B=0.2614…`, implies the displayed inequality since `B<0.27` and `1/(2log²x)<5/log x`.

For `x≥exp(10000)` prove the same reciprocal-prime bound from Rosser–Schoenfeld Theorem 5, (3.17), p.70, and its zero-free-region estimates. In both ranges use `log(1+1/p)≤1/p` and `exp(0.27+5/log x)<2` for `x≥10^8`.

See [47][R47], §5 proof of Lemma 5.1, p.365, which prints the product form `∏_(p≤x)(1+1/p)≤exp(0.27+5/log x)log x` from Tenenbaum, Theorem 9, and deduces `≤2log x` for `x≥10^8`; Rosser–Schoenfeld Theorem 8 (3.29), p.70.

*Needs:* §0.19.

### 0.26 Mertens's third theorem: the Euler product

For real `x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1)`, with `γ` Euler’s constant and an absolute implied constant.

From reciprocal-prime Mertens and `−log(1−u)−u=O(u²), 0≤u≤1/2`, obtain `log∏_(p≤x)(1−1/p)^−1=log log x+κ+O(1/log x)`; the square-power tail is `O(1/x)`. Identify `κ=γ` through the real Euler product at `1+ε/log x` and Exercise5.4(c)–(d)'s corrected integral. The tilted-product, prime-tail and Euler-constant comparisons remain required named inputs. Exponentiating after identifying `κ` gives the additive `O(1)`; a two-sided comparison alone cannot identify it.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(c), (3.6), pp.40–41; Exercise5.4, p.61.

*Needs:* §0.21.

**§0.26a Mertens's second theorem in von Mangoldt form, and its constant.** `mertens_vonMangoldt_eulerGamma`: there is an absolute `C` such that for every real `x≥2`, `|Σ_(2≤n≤x)Λ(n)/(n log n)−log log x−γ|≤C/log x`, with `γ` Mathlib's `Real.eulerMascheroniConstant` and an inclusive cutoff. Since `Λ(p^k)/log p^k=1/k`, the sum is `Σ_(p^k≤x)1/(kp^k)`. `mertens_reciprocal_prime_constant` identifies the constant `B` of §0.21: the series `Σ_p(log(1−1/p)+1/p)` converges absolutely, its terms are negative, and `B=γ+Σ_p(log(1−1/p)+1/p)`, so that `|Σ_(p≤x)1/p−log log x−B|≤C/log x` for `x≥2` with this `B`.

Taking logarithms in §0.26, with the identification `κ=γ` made there, gives `log∏_(p≤x)(1−1/p)^(−1)=log log x+γ+O(1/log x)` for `x≥2`, the compact range being absorbed by the constant. Expanding each factor, the left side is `Σ_(p≤x)Σ_(k≥1)1/(kp^k)`, which exceeds the von Mangoldt sum by the terms with `p≤x<p^k`. For `p≤√x` these total at most `2/x` for each prime, hence `2/√x` in all; for `p>√x` they have `k≥2` and total at most `Σ_(n>√x)1/n²≤2/√x`. Both are `O(1/log x)`. For `B`, the von Mangoldt sum minus `Σ_(p≤x)1/p` is `Σ_(p^k≤x,k≥2)1/(kp^k)`, which differs from `Σ_pΣ_(k≥2)1/(kp^k)=−Σ_p(log(1−1/p)+1/p)` by `O(x^(−1/2))`, by the same two estimates; comparing with §0.21 identifies `B`.

Checks: at `x=4` the sum is `1/2+1/3+1/8=23/24`, the prime square `4` contributing `Λ(4)/(4log4)=1/8`, whereas `Σ_(p≤4)1/p=5/6`. The constant of the prime-only sum is `B<γ`: the prime 2 alone lowers it by `log2−1/2>0`, so the constants of the two sums cannot be interchanged. The weight is `Λ(n)/(n log n)`; §0.11's weight `Λ(n)/n` has the different sum `log x+O(1)`.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(b)–(c), pp.40–41, and Exercise5.4, p.61. *Needs:* §0.21; §0.26; `ArithmeticFunction.vonMangoldt`; `Real.eulerMascheroniConstant`.

### 0.27 Landau repulsion for exceptional squareclasses

There is an effective absolute `0<c_Landau<1/2` such that distinct `d,e∈S(c_Landau)` with `|d|≤|e|` satisfy `|d|²≤|e|`. This pairwise form applies to every existing finite ordered segment; no infinitude of `S(c_Landau)` is asserted.

Distinct squareclasses give distinct primitive characters with `|d|≤Q_d≤4|d|`. If `|d|≤|e|<|d|²`, then `Q_dQ_e<16|d|³` and `log(Q_dQ_e)≤5log(|d|+4)`, since `16a³≤(a+4)^5`. Both zeros have the same lower cutoff `1−c_Landau/log(|d|+4)`; choose `0<c_Landau≤3c_star/5`, also `<1/2`, to contradict §0.17.

The conclusion is pairwise and vacuous for an empty/singleton exceptional set. Retain `Q_−1=4` and `Q_2=8`; replacing conductor by `|d|` breaks the cited analytic input. Use the explicit slack `c_Landau≤3c_star/5` and `log(Q_d Q_e)≤5log(|d|+4)`. This keeps the factor4 and the `+4` height convention.

See [51][R51], §7.2 Definition7.5 and following paragraph, p.61.

*Needs:* §0.13; §0.17.

### 0.28 Quadratic prime-character interval estimate

There are positive absolute effective constants `c,C` such that for every nonzero squarefree integer `D≠1`, its primitive field character `χ_D` of conductor `Q_D=|Disc(Q(√D))|`, and real `2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴`. No exceptional term `v^β` occurs, since §0.18 carries none; this form is the stronger one and is the one stated. Equivalently extend `χ_D` by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.

Apply the character PNT of §0.18, remove higher powers and Abel-sum to strict prime counts. Subtract the endpoint formulas and dominate the `u`-error by an increasing `v`-envelope, shrinking `c`/enlarging `C` for bounded heights. `|D|≤Q_D≤4|D|` gives the printed (7.7), which carries an additional exceptional term, including `log(v|D|)≥log2` at `d=−1`. These uniform power-removal and Abel/envelope adapters are targets here.

If `(u,v)` contains no unramified prime the sum is0; no unproved prime-existence claim is hidden in this bound. For `D=−1` use `χ_−4` and conductor `4; p=2` is excluded or contributes0. Both constants are independent of `D,u,v`.

See [51][R51], §7.2 proof of Proposition7.6, (7.7), p.62.

*Needs:* §0.18.

### 0.29 Strict derivative positivity requires nonpolynomiality

The specialization asserts reality and strict positivity for every derivative.

**Centered growth.** `IsCenteredOrderOne f` means that `f` is entire and for every `ε>0` there is `C>0` with `|f(z)|≤exp(C(1+|z|^(1+ε)))` for all `z`. It holds if and only if `f` is entire with `OrderLE f 1`. Given the centered bound with `ε=(b−1)/2` for a `b>1`, `C(1+r^(1+ε))≤r^b` for all large `r`, so `f=O(exp(‖z‖^b))` on a cobounded set; conversely the `OrderLE` bound with `b=1+ε` holds off a compact set, on which `f` is bounded, and one `C` absorbs both. Products, translations and polynomials preserve the predicate.

`pairedHadamard_derivatives_positive`: let `f` satisfy `IsCenteredOrderOne f`, `f(−z)=δf(z)` with `δ∈{1,−1}`, have every zero on the imaginary axis, and be positive real at all sufficiently large positive real `x`. If `f` is not a polynomial, every derivative `f^(k)(x)` is strictly positive for `x>0`, and with `m` the order of `f` at 0 its Taylor coefficients of degrees `m+2j`, `j≥0`, are positive. Expand the paired product of §0.29a: each factor `1+z²/λ_j²` has nonnegative coefficients, so every coefficient of `f` is nonnegative; a nonpolynomial `f` has infinitely many factors, so every coefficient of degree `m+2j` is positive, and every derivative at `x>0` is a positive series.

`cosh(z)` has infinitely many purely imaginary zero pairs and strictly positive same-parity Taylor coefficients. The polynomial `1+z²` satisfies the pairing hypotheses but its fourth derivative is zero; nonpolynomiality is essential. Coefficients of degree below `m` vanish, including same-parity ones; positivity starts at degree `m`. Negating `cosh` preserves its zero locations and parity but makes its even derivatives negative; eventual positivity is essential.

See [54][R54], Appendix B.1, order definition, (B.3), Proposition B.1 and its proof, pp.902–903.

*Needs:* §0.29a; [ZerosOfLFunctions 0.1–0.2][R11].

**§0.29a Pairing imaginary zeros.** `pairedHadamard_factorization`: under the hypotheses of §0.29 without nonpolynomiality, there are `m≥0`, `c>0` and a finite or countable multiset of positive reals `λ_j`, one for each positive-imaginary zero occurrence and with `Σ_jλ_j⁻²<∞`, such that `f(z)=c z^m∏_j(1+z²/λ_j²)` locally uniformly on `ℂ` and `δ=(−1)^m`. Finite and empty families are included.

Eventual positivity excludes `f≡0`, so `m` is finite; let `g` be the entire extension of `f(z)/z^m`, with `g(0)=f^(m)(0)/m!≠0` and `OrderLE g 1` by the growth equivalence of §0.29. Apply §0.22 and [ZerosOfLFunctions 5.4–5.6][R15] to `g`: its zero divisor, genus-one product and affine exponential `exp(a+bz)`. Parity of `f` makes the zeros of `g` symmetric under `z↦−z` with equal multiplicities; pair `±iλ_j`, and `E₁(z/(iλ))E₁(z/(−iλ))=1+z²/λ²` cancels the exponentials of each pair. Then `g` even forces `b=0`, `δ=(−1)^m`, and positivity at large real `x` fixes `c=e^a>0`.

Checks: `f=z^m` has an empty family and `c=1`; `f=1+z²` has the single pair `±i`; `f=(1+z²)²` retains that pair twice; `f=1−z²` violates the imaginary-zero hypothesis.

See [54][R54], Appendix B.1, (B.3) and Proposition B.1, pp.902–903. *Needs:* §0.22; §0.29; [ZerosOfLFunctions 5.4–5.6][R15].

**§0.29b Nonnegative coefficients of the paired product.** `pairedHadamard_derivatives_nonnegative`: under the hypotheses of §0.29a every Taylor coefficient of `f` is nonnegative, coefficients of parity opposite to `m` are zero, and every derivative at a nonnegative real point is real and nonnegative. Expand the locally uniformly convergent product of nonnegative-coefficient factors. Nonpolynomiality is not needed for these non-strict conclusions.

Checks: `1+z²` has fourth derivative zero; `z³(1+z²)` has zero coefficients below degree 3, including degree 1 of the same parity; `cosh z` has positive even coefficients and zero odd coefficients, while its odd derivatives are positive for `x>0`.

See [54][R54], Appendix B.1, proof of Proposition B.1, pp.902–903. *Needs:* §0.29a.

### 0.30 Rational Dirichlet-to-ray-class dictionary

For `q≥1`, the narrow ray class group of `ℚ` of finite modulus `(q)` and the real place identifies with `(ℤ/qℤ)ˣ`: an ideal prime to `q` maps to the residue of its positive rational generator. For an integral ideal `(n), n>0`, evaluate the corresponding ray character as `χ(n)`, with no inverse or conjugation. Its primitive finite conductor is the Dirichlet conductor `f`; its infinite conductor contains the real place exactly when `χ(−1)=−1`. The narrow presentation is allowed for even characters, but is then imprimitive at infinity.

The adapter `dirichletRayEquiv` uses GlobalNumberFields' ray-class carrier; `dirichletData_eq_rayData` compares [LFunctions 4–5][R52]. The primitive continued functions agree on `Re s>1` by their Euler series, hence as meromorphic germs everywhere. Their finite conductor is `f`, the gamma factor is `Γ_R(s+a), a=0` or 1 according to parity, and the completion is `f^(s/2)Γ_R(s+a)L(s,χ)`. Compare root numbers in that normalization. At level `q` retain exactly `∏_{p|q, p∤f}(1−χ*(p)p^(−s))`; their zeros lie on `Re s=0`. Equality at a pole always means equality of germs, not equality of totalized values.

API: `.ideal_nat`, `.conductor`, `.parity`, `.primitive_source`, `.continued_eq`, `.completion_eq`, `.deleted_factors`, and transport of the supplier divisor and zero counts. Construct the group equivalence by clearing denominators prime to `q` and using positive generators; its kernel is the narrow ray principal subgroup. Character transport and the absolutely convergent Euler products determine the analytic comparison uniquely.

**Checks.**

- At `q=1` the functions are `ζ` and its normalization-1 entire completion is `2ξ`.
- At `χ₋₄` the conductor is 4 and `a=1`, giving `Γ_R(s+1)`.
- For the principal character of level 6 the primitive conductor is 1 and `L=(1−2^(−s))(1−3^(−s))ζ`; the two factors cannot be discarded.
- For the quartic character modulo 5 with `χ(2)=i`, the ideal (2) has value `i` and `χ(2)−χ(2)⁻¹=2i`; replacing it by its inverse changes the sign. Thus the comparison fixes conjugation as well as parity.

Use [ZerosOfLFunctions 6.2–6.4][R16] through this dictionary for the conductor-uniform Dirichlet region and its exceptional-zero API. Those results are not targets here.

See [56][R56], V §1, Example 1.4 and Theorem 1.7, pp.149–151 (ray classes over `ℚ`), and LFunctions 4–5 for the analytic records. *Needs:* GlobalNumberFields Layers 2 and 9; [LFunctions 4–5][R57]; Mathlib `DirichletCharacter.LFunction_changeLevel` and the primitive completed functional equation.

**§0.30a Conductor-uniform rational logarithmic-derivative adapter.** For primitive nonprincipal `χ` of conductor `q≥3`, combine the imported divisor, fixed-degree conductor-uniform strip growth and high-height count from [ZerosOfLFunctions Layers 3–4][R14] with the following compact-height specialization. The local contour interface has absolute constants before `χ,q`, rather than constants after fixing a character.

For `|u|≤2,|s−(2+iu)|≤12`, wide-strip growth gives `|L(s,χ)|≤Cq^B`, with absolute `C,B` and no nonprincipal pole; the Euler lower bound at `2+iu` is `1/ζ(2)`. Jensen §4.5 at radii 6,12 gives `O(logq)` zeros in the radius-6 disc. Constants precede `q`, including compact heights.

Refine to
`L′/L(s,χ)=Σ_(nontrivialρ,|Imρ−Ims|≤1)mρ/(s−ρ)+O(log(q(|s|+2)))`,
for `−1≤Res≤2`, away from all zeros and at distance `≥1/2` from trivial zeros. At compact height remove the disc zeros of `L(2+iu+z,χ)`, normalize the remaining logarithm at 0, then apply finite Blaschke maximum principle and Borel–Carathéodory on nested discs. Terms outside the unit window have distance `≥1` and count `O(logq)`; trivial zeros contribute `O(1)` under the distance condition. At high height use the same argument with conductor-uniform strip growth/counts.

API: `primitiveL.bounded_height_count`, `.local_log_derivative`, `.safe_height_both_characters`. For a safe height in `[T,T+1], T≥2`, remove intervals of radius `c/log(q(T+2))` around the imported `O(log(q(T+2)))` ordinates, for `χ` and its conjugate together. Choose one absolute `c` so their total length is `<1/2`. The local expansion is then `O(log²(q(T+2)))` on the fixed contour strip. This is a simultaneous two-character choice, as required for the positive and negative contour edges of a complex character.

**Checks.**

- `u=0` retains `O(log q)`, rather than an unspecified constant depending on `χ`.
- Conjugation reflects zeros of `χ` to those of its conjugate, generally a different character; both families enter the safe-height choice.
- A zero of analytic multiplicity 2 contributes `2/(s−ρ)`, not one copy.
- Imprimitive deleted factors have zeros on `Re s=0` and are outside this primitive signature; a trivial zero at 0 must be separated before dividing.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Lemma11.2 p.113, Lemma11.4 pp.114–115 and Lemmas8.5–8.6 pp.89–91. *Needs:* §0.30; ZerosOfLFunctions 3.3–3.4 and 4.5–4.8; its Gamma bounds; native finite analytic orders, maximum modulus and Cauchy estimates.

**The case of `ζ` in §0.30a.** The principal character of conductor 1, whose `L`-function is `ζ`, is outside the signature above; its specialization keeps the pole term at 1 and is stated separately.

`riemannZeta_local_logDeriv`: for every real `σ₀>1` and radii `0<r<r′` there is `C`, depending only on `σ₀,r,r′`, such that for every `s₀` with `Re s₀=σ₀` and every `s≠1` with `|s−s₀|≤r` and `ζ(s)≠0`,
`|ζ′/ζ(s)+1/(s−1)−Σ_(|ρ−s₀|≤r′)m(ρ)/(s−ρ)|≤C log(|Im s₀|+2)`,
the sum running over every zero `ρ` of `ζ` in the closed disc, trivial zeros included, with `m(ρ)` its analytic order. Equivalently `−ζ′/ζ(s)=1/(s−1)+Σ_(|ρ−s₀|≤r′)m(ρ)/(ρ−s)+O(log(|Im s₀|+2))`; once `|Im s₀|≥r+1` the pole term is at most 1 and joins the error. Run the nested-disc argument above for the entire function `(s−1)ζ(s)` on `|s−s₀|≤r′+1`: at the centre `|(s₀−1)ζ(s₀)|≥(σ₀−1)ζ(2σ₀)/ζ(σ₀)` by the Euler product (`riemannZeta_eulerProduct_tprod`), on the disc `|(s−1)ζ(s)|≤C(|Im s₀|+2)^B` by the wide-strip growth of ZerosOfLFunctions 3.4 and compactness at bounded height, and Jensen's bound (ZerosOfLFunctions 4.3) gives `O(log(|Im s₀|+2))` zeros in the disc of radius `r′`.

`riemannZeta_logDeriv_window` is the conductor-one form of the display above: with an absolute constant, for `−1≤Re s≤2`, `s≠1` and `ζ(s)≠0`,
`ζ′/ζ(s)+1/(s−1)=Σ_(0<Re ρ<1,|Im ρ−Im s|≤1)m(ρ)/(s−ρ)+O(log(|Im s|+2))`.
Take `s₀=2+i Im s`, `r=3`, `r′=4`: every nontrivial zero of the window lies in the disc, and the other zeros of the disc, the trivial zero `−2` included, are at distance at least 1 from `s` and number `O(log(|Im s|+2))`.

`riemannZeta_safe_height`: there is an absolute `C` such that every `T≥2` has some `T′∈[T,T+1]` with `ζ(σ±iT′)≠0` and `|ζ′/ζ(σ±iT′)|≤C log²(T+2)` for `−1≤σ≤2`. Remove intervals of radius `c/log(T+2)` about the `O(log(T+2))` ordinates in `[T−1,T+2]` (ZerosOfLFunctions 4.5), with `c` absolute and small enough that their total length is below `1/2`, and apply the window form. One height serves both edges, since `ζ(s̄)` is the conjugate of `ζ(s)`.

Checks: at `s₀=2` and `r′≥4` the disc contains the trivial zero `−2`, which the sum counts; near `s=1`, `ζ′/ζ(s)=−1/(s−1)+γ+O(s−1)`, so the left side without `+1/(s−1)` is unbounded at bounded height; a zero of order 2 contributes `2/(s−ρ)`; conjugation fixes the zero set of `ζ`, so a single safe height suffices, unlike the two-character choice above.

See [112], Chapters 15 and 17, for the window form and the heights; Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., §3.9, for the nested-disc expansion. *Needs:* ZerosOfLFunctions 3.4, 4.3 and 4.5; `riemannZeta_eulerProduct_tprod`; `differentiableAt_riemannZeta`; native finite analytic orders, maximum modulus and Cauchy estimates.

### 0.31 Mertens product input

For `y≥2, ∏_{p≤y}(1−1/p)` is comparable to `1/log y`, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

Use the reciprocal Mertens product asymptotic and positivity. Extend the two-sided comparison over the compact starting range `y≥2`.

For `y=2` the product is 1/2; extend the eventual comparison to `y≥2` using its finitely many values below any fixed threshold. Removing a fixed finite set of primes multiplies the product by finitely many positive inverse factors; the resulting constants may depend on that set.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.4(c), pp.40–41; [58][R58], Lemma4.9, pp.712–714; Lemma4.11 and proof pp.715–716.

*Needs:* §0.26.

**§0.31a Near-one Dirichlet derivative bounds.** Uniformly for nonprincipal `χ` modulo `q≥3` and real `σ∈[1−1/log q,1]`, `|L′(σ,χ)|≤C log²q` with an effective absolute `C`. To prove it without a zero-free hypothesis, split `−Σχ(n)log n/n^σ` at `N=q`. The finite part is at most `eΣ_{n≤q}log n/n≤C log²q`. Partial summation of the tail with `|Σ_{q<n≤v}χ(n)|≤2q` gives at most `2q∫_q^∞(σ log v+1)v^(−σ−1)dv≤C log q`; for `q≥3, σ≥1−1/log3>0`, so its denominators are uniformly bounded. The differentiated series and this integral agree by locally uniform Abel convergence on `Re s>0`.

API: `dirichletL.near_one_derivative`. Checks: the principal character is excluded; `q=3` keeps a positive lower bound for `σ`; the bound is used only on the real segment `[1−1/log q,1]`, where `σ>0` and no functional equation enters; it is unconditional, and no exceptional-zero alternative enters its uses, since by §0.34 no real zero lies in `[1−c_LS/log q,1)`. Source: Koukoulopoulos Lemma11.2, p.113. *Needs:* native character partial sums and Abel summation.

**§0.31b Quadratic zero separation from an `L`-value.** Let `χ` be a primitive real nonprincipal character of conductor `q≥3`. If `β` is a real zero in `[1−1/log q,1)`, the real mean-value theorem gives `1−β≥L(1,χ)/(C log²q)` (`.gap_of_lvalue`); a zero farther left has `1−β≥1/log q`. The uniform gap `.siegel_gap` is `1−β≥c_LS/log q` for every real zero `β∈(0,1)`, with the effective constant of §0.34; for each `ε>0` it gives `1−β≥c_ε q^(−ε)` with effective `c_ε`. This effective logarithmic gap is stronger than the ineffective `c_ε q^(−ε)` gap and is the one stated; `.gap_of_lvalue` with §0.9 alone gives only `1−β≫1/log³q`. The effective quadratic class-number/regulator lower bound `L(1,χ_D)≥c/√Q_D` gives the effective exponent `1/2+ε` result `.effective_quadratic_gap`, using `h≥1`, the explicit imaginary roots-of-unity factor and the elementary real unit lower bound `(sqrt(D+4)+sqrt D)/2` for the positive norm-one generator.

API: `dirichletL.near_one_derivative`, `.gap_of_lvalue`, `.siegel_gap`, `.effective_quadratic_gap`. Checks: a zero left of `1−1/log q` uses the distance alternative, not the derivative interval; `q=3` is included; the principal character is excluded; `Q_D≤4|D|` is applied before absorbing logarithms. Source: Koukoulopoulos, *The Distribution of Prime Numbers*, Lemma11.2 p.113 and (12.11)–(12.12) p.124; [48][R48], Lemma6.3 pp.491–492 for the effective unit and class-number normalization; [109], Theorem 1, for `.siegel_gap`.

*Needs:* §0.31a; §0.34; native partial summation; the quadratic class-number formula and native unit carriers; the Multiquadratic field-character dictionary (From Tau Ceti, Multiquadratic and ContourIntegration).

### 0.32 Siegel–Walfisz theorem

The prime-count signature is `siegel_walfisz_primeCount`, with `Li(x)=∫₂^x dt/log t` and the same uniform modulus range.

For each `A,B>0`, uniformly for `q≤(log x)^B` and `gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A)` as `x→∞`. The implied constant and the threshold are effective; this effective form is stronger than the classical ineffective theorem and is the one stated. The representative inclusive `ψ` signature is `siegel_walfisz`.

Use the exception-free character PNT of §0.18, imprimitive corrections and finite progression orthogonality. For a primitive character of conductor `N≤q≤(log x)^B`, `log N≤B log log x≤√log x` for large `x`, so §0.18's error is at most `x exp(−(c/2)√log x)(B log log x)^4`, absorbing every logarithmic power; no exceptional term occurs, because §0.34 removes it in §0.18. Averaging preserves the uniform bound. Remove `ψ−θ` and use ADS Abel transfer. Choose the effective constants and threshold depending on `A,B` before `q,a,x`.

The assertion is restricted to reduced classes and logarithmic modulus growth; it is not a uniform theorem for every modulus.

See [53][R53], §10.5 Theorem10.9 pp.62–63 and Theorem10.11 p.63; the statement here requires `a` coprime to `q` and restricts `q` to a logarithmic range. The source's constant is ineffective through Siegel's theorem; here effectivity comes from §0.34 through §0.18.

*Needs:* §0.30; §0.18; §0.34; `DirichletCharacter.sum_char_inv_mul_char_eq`; `DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`; `Chebyshev.isBigO_psi_sub_theta_sqrt`; [ArithmeticDirichletSeries 6][R1].

### 0.33 Zero-free zeta strip and logarithmic bounds

There exist `0<β<1` and `C>0` such that for `Z={s:1−β/log(|Im s|+2)≤Re s≤10}, ζ` is meromorphic with its only pole in `Z` a simple pole at1 of residue1 and no zeros away from1. The functions `G(s)=ζ(s)−1/(s−1)` and `R(s)=1/ζ(s)`, initially defined off1, have analytic extensions to a neighbourhood of `Z`, with `R(1)=0` and `|G(s)|,|R(s)|≤C log(|Im s|+2)` throughout `Z`. Values at1 refer to these extensions, not to totalized `ζ(1)`.

Join the imported high-height zero-free region to bounded-height real-line nonvanishing and the pole germ by shrinking `β`. Bound `ζ` after pole subtraction and `1/ζ` logarithmically at high height; compact bounds enter `C`. These quantitative proofs remain required: nonvanishing alone gives no logarithmic bound.

See [59][R59], AppendixA LemmaA.1, p.541.

*Needs:* [ZerosOfLFunctions 6.2][R16]; [ZerosOfLFunctions its local logarithmic derivative and zero counts][R14]; [ZerosOfLFunctions its Gamma estimates][R12]; native right-half-plane nonvanishing and the pole germ at 1; compact continuity.

**§0.33a Derivative and logarithmic-derivative bounds right of the curve.** `riemannZeta_deriv_logDeriv_bound`: there are `0<β<1` and `C>0` such that every `s≠1` with `Re s≥1−β/log(|Im s|+2)` has `ζ(s)≠0`, `|ζ′(s)+1/(s−1)²|≤C log²(|Im s|+2)` and `|ζ′/ζ(s)+1/(s−1)|≤C log(|Im s|+2)`. The region is the whole half-plane to the right of the curve, with no upper bound on `Re s`; at width `β` it contains the strip `Z` of §0.33. The two left sides are `G′` and the analytic extension of `ζ′/ζ+1/(s−1)` across 1, so the bounds hold at 1 as well. Where `|Im s|≥1` the pole terms are at most 1 and `log(|Im s|+2)>1`, so `|ζ′(s)|` and `|ζ′/ζ(s)|` are at most `(C+1)log²(|Im s|+2)`. Since `log(|Im s|+2)≥log 2`, the polylogarithmic forms follow: for every integer `k≥1` the region `Re s≥1−β(log 2)^(k−1)/log^k(|Im s|+2)` lies in the one above, and on it `|ζ′/ζ(s)+1/(s−1)|≤C(log 2)^(1−k)log^k(|Im s|+2)`; likewise `|ζ′(s)+1/(s−1)²|≤C(log 2)^(2−k)log^k(|Im s|+2)` for `k≥2`.

Let `β₀` and `C₀` be the width and constant supplied by §0.33, put `β=β₀/4` and write `L=log(|Im s|+2)`. Every `z` with `|Im z|≤|Im s|+1` has `log(|Im z|+2)≤2L`, because `|Im s|+3≤(|Im s|+2)²`. For `G′` with `Re s<2`, Cauchy's estimate on the disc of radius `β/L` about `s` applies: the disc lies in `Z` at width `β₀`, where §0.33 gives `|G|≤2C₀L`, so `|G′(s)|≤2C₀L²/β`; for `Re s≥2`, `|ζ′(s)|≤Σ_(n≥2)log n/n²` and `|s−1|≥1`. For `H=ζ′/ζ+1/(s−1)` at `|Im s|≥2` put `s₁=1+1/L+i Im s`. If `Re s≥Re s₁`, then `|ζ′/ζ(s)|≤−ζ′/ζ(Re s)≤−ζ′/ζ(1+1/L)≤L+O(1)` by the Mangoldt series and §0.11b. Otherwise subtract the window expansions of §0.30a (`riemannZeta_logDeriv_window`) at `s` and `s₁`. Every window zero has `Re ρ≤1−β₀/(2L)=1−2β/L` by §0.33 at width `β₀`, so `|s−ρ|≥β/L`, `|s₁−s|≤(1+β)/L`, `|s₁−ρ|≤(2+1/β)|s−ρ|` and `|1/(s−ρ)−1/(s₁−ρ)|≤(1+β)(2+1/β)Re 1/(s₁−ρ)`. The window expansion at `s₁` and `|ζ′/ζ(s₁)|≤L+O(1)` bound `Σ Re 1/(s₁−ρ)` by `O(L)`, hence `H(s)=O(L)`. Below height 2, `H` is analytic on a neighbourhood of the part of the region with `Re s≤2`, which is compact and contains no zero of `ζ`, and the Mangoldt series bounds it for `Re s≥2`.

Checks: near `s=1`, `ζ′(s)=−1/(s−1)²+O(1)` and `ζ′/ζ(s)=−1/(s−1)+γ+O(s−1)`, so without the subtracted pole terms neither bound holds at bounded height. The bound for `ζ′/ζ` does not follow from §0.33 by multiplying: `ζ′/ζ=ζ′·(1/ζ)` with §0.33's bound for `1/ζ` gives only `log³(|Im s|+2)`. On `Re s≥2` both functions are bounded, so dropping the upper limit `Re s≤10` of `Z` costs nothing.

See Montgomery–Vaughan, *Multiplicative Number Theory I. Classical Theory*, §1.3 for `ζ′` and Theorem6.7 for `ζ′/ζ`; Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., §§3.9–3.11.

*Needs:* §0.33; §0.30a (`riemannZeta_logDeriv_window`); §0.11b; [ZerosOfLFunctions 6.2][R16]; `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; native Cauchy estimates.

### 0.34 Uniform exclusion of Landau–Siegel zeros

The signature is `landau_siegel_exclusion`. There is an absolute, effectively computable constant `c_LS>0` such that every real zero `β∈(0,1)` of `L(s,χ)`, for every primitive nonprincipal real Dirichlet character `χ` of conductor `q≥3`, satisfies `(1−β)log q≥c_LS`. Real means `χ²=1`, Mathlib's `MulChar.IsQuadratic`; `L(s,χ)` is the canonical continued `DirichletCharacter.LFunction`. The constant includes its threshold: every conductor `q≥3` is covered and no finite range is set aside. For an imprimitive real nonprincipal character of modulus `m` the same bound holds with `log m` in place of `log q`, since its deleted Euler factors vanish only on `Re s=0` and `m` is at least the conductor.

Combine §0.34b with §0.34c at `X=q^C`, for a fixed multiple `C` of 3 with `C≥C₀` (§0.34c) and `C≥8(1+A)` (§0.34b). Mertens's estimate (§0.11a) gives `Σ_{p≤X}(log p)/p≥log X−B` with an absolute `B`, the primes dividing `q` contribute at most `log q`, and the remaining primes have `χ(p)=±1`. With `δ=(1−β)log q` the two estimates give `(C/4−1−A−AC²δ)log q≤B+K_C`, hence `δ≥1/(16AC)` once `log q>16(B+K_C)/C`. Below this effective threshold there are finitely many conductors: a zero `β≤1/2` has `δ≥(log 3)/2`, and a zero `β>1/2` has `1−β≥c q^(−1)` by the effective exponent-`1/2` gap of §0.12 at `ε=1/2`, applied to the field character that §0.34a identifies with `χ`. Take `c_LS` the least of the three effective constants.

**§0.34a Real primitive characters are Kronecker characters.** `quadratic_character_kronecker`: a primitive nonprincipal real Dirichlet character `χ` of conductor `q` is the complexification of Tau Ceti's `fundamentalDiscriminantChar D`, transported to level `q`, for the fundamental discriminant `D=χ(−1)q`. In particular, with `d` the squarefree part of `D`, one has `d≠1`, `|d|≤q` and `χ(p)=(d/p)` for every odd prime `p∤q`. Decompose `χ` into its prime-power components by the Chinese remainder theorem; the only primitive real character of an odd prime-power conductor is the Legendre character of conductor `p`, and those of 2-power conductor are `ZMod.χ₄`, `ZMod.χ₈` and `ZMod.χ₈'`. Assemble with `jacobiSym.quadratic_reciprocity` and the Multiquadratic value table. Checks: `q=3` gives `D=−3`; `q=4` gives `D=−4`, `d=−1`; conductor 8 carries two characters, `D=8` and `D=−8`, with `d=2` and `d=−2`; `q=12` gives `D=12`, `d=3`; conductors `≡2 mod 4` carry none. Source: [112], Chapter 5. *Needs:* the Multiquadratic field-character dictionary (From Tau Ceti, Multiquadratic and ContourIntegration); `DirichletCharacter.IsPrimitive`; `MulChar.IsQuadratic`; `jacobiSym`.

**§0.34b The Landau deduction: a real zero leaves few split primes.** `split_prime_sum_le_of_real_zero`: there is an absolute effective `A>0` such that, for `χ` and `q` as in §0.34, every real zero `β∈(0,1)` of `L(s,χ)` and every real `X≥3`, `Σ_{p≤X, χ(p)=1}(log p)/p≤A(log q+(1−β)(log X)²)`. The zero `β` is a zero of the completed function, since the Gamma factor has neither zeros nor poles on `(0,1)`. For real `1<s≤2`, ZerosOfLFunctions 6.4d (through §0.30) gives `−L′/L(s,χ)≤(1/2)log q+O(1)−Σ_ρ Re 1/(s−ρ)`, a sum of nonnegative terms over the nontrivial zeros; keep only `ρ=β`. §0.11b gives `−ζ′/ζ(s)≤1/(s−1)+O(1)`. Hence `−ζ′/ζ(s)−L′/L(s,χ)≤C log q+1/(s−1)−1/(s−β)`, and at `s=1+1/log X` the right side is at most `C log q+(1−β)(log X)²`, because `1/(s−1)−1/(s−β)=(1−β)/((s−1)(s−β))`. The left side is the series `Σ_n Λ(n)(1+χ(n))n^(−s)`, with nonnegative terms by §0.11b's Euler logarithmic derivatives, and its primes `p≤X` with `χ(p)=1` contribute at least `(2/e)Σ(log p)/p`. At `X=q^C` the bound reads `A(1/C+Cδ)log X`, so a zero with small `δ` leaves almost all of the Mertens mass `log X` to the primes with `χ(p)=−1`. Source: [109], §2, Lemma 2. *Needs:* §0.11b; §0.30; [ZerosOfLFunctions 6.4][R16].

**§0.34c Inert primes carry at most three quarters of the Mertens mass.** `inert_prime_sum_le`: there is an absolute, effectively computable `C₀` such that for every integer `C≥C₀` divisible by 3 there is an effectively computable `K_C` with `Σ_{p≤X, χ(p)=−1}(log p)/p≤(3/4)log X+K_C`, `X=q^C`, for every `χ` and `q` as in §0.34. By Mertens the trivial bound is `log X+O(1)`.

The proof is a determinant method. Let `d` be as in §0.34a, `K=ℚ(√d)`, `R=X`, `S=⌊X/C⌋` and `N=X^(2/3)`, an integer because `3∣C`. Take the `N²` points `P=(x+y√d,x−y√d)` with integers `0≤x,y<N`, and for `0≤r<R`, `0≤s<S` let `v_(r,s)` be the vector of the values `∂_z^j(z^r z′^s)` at these points, `0≤j<N`; its entries lie in `ℤ[√d]`. Let `G` be the `RS×RS` Gram matrix of these vectors for the pairing `⟨α,β⟩=Tr_(K/ℚ)(αβ̄)`, which is positive definite for either sign of `d` (the bar is the nontrivial automorphism when `d<0` and the identity when `d>0`); its entries are rational integers, and through the embeddings of `K` it is a Mathlib `Matrix.gram` of real vectors. Three facts about `det G` give the estimate.

1. `det G` is a positive integer. `G` is positive semidefinite (`Matrix.posSemidef_gram`) and nonsingular (`Matrix.det_gram_ne_zero_iff_linearIndependent`), because the vectors are linearly independent: a nonzero polynomial of degree `<R` in `z` and `<S` in `z′` cannot vanish to order `N` in `z` at all the points. This multiplicity estimate needs only that the second coordinates are distinct and that a nonzero `F` of total degree `k` vanishes at no more than `Nk` of the points (Schwartz–Zippel on the grid, `MvPolynomial.schwartz_zippel_totalDegree`); it bounds the vanishing order along each irreducible factor `F_ℓ` by `1+ord Res_z(F_ℓ,∂_zF_ℓ)` and uses `deg_(z′)Res_z(F_ℓ,∂_zF_ℓ)≤2deg_z F_ℓ·deg_(z′)F_ℓ` (`Polynomial.resultant`, `Polynomial.resultant_eq_zero_iff`), so it applies because `N²>2RS/N+R+S`.
2. An archimedean upper bound. Both conjugates satisfy `|x±y√d|≤N(1+√|d|)≤2N√q`, every entry of `v_(r,s)` is at most `R^N(2N√q)^(r+s)` in absolute value, and Hadamard's inequality `det G≤∏G_ii` gives `log det G≤RS(R+S)log(2N√q)+O(X³)`.
3. A `p`-adic lower bound at each odd prime `p≤X` with `χ(p)=−1`. Then `(d/p)=−1`, so `(x+y√d)^p≡x−y√d mod pℤ[√d]` and `z^p−z′` vanishes modulo `p` at every point. Replacing `z^r z′^s` by `z^(r−ph)(z^p−z′)^h z′^s` with `h=min(⌊r/p⌋,S−1−s)` changes the row by earlier rows only, which preserves `det G`, and makes every entry of the new row divisible by `p^h`; hence `v_p(det G)≥2Σ_(r,s)min(⌊r/p⌋,S−1−s)`.

Comparing `Σ_p v_p(det G)log p≤log det G` with facts 2 and 3, and using `Σ_(s<S)min(k,S−1−s)≥Sk−k²` and `⌊r/p⌋≥r/p−1`, gives `Σ_(p≤X,χ(p)=−1)(log p)/p≤(1+1/C)(2/3+1/(2C))log X+O_C(1)`, which is at most `(3/4)log X+O_C(1)` for large `C`; the prime 2 contributes `O(1)`. Hadamard's inequality for positive semidefinite real matrices, the resultant multiplicity bound and the multiplicity estimate are targets here: Mathlib has no Hadamard inequality at the pin, and `Matrix.det_le` alone loses a factor 2 in the exponent, which destroys the saving. Source: [110], Theorem 1.1, §§2–6 and Appendix A; the source takes `R=X`, `S=J=⌊X/C⌋`, `N=2X^(1/2)` and `C` even and obtains the constant `1/2+O(1/C)`, while the parameters `N=X^(2/3)`, `J=N` and `3∣C` above are this roadmap's own choice and `3/4` is the weakened constant they give, not a constant of the source. *Needs:* §0.34a; `Matrix.gram`; `Matrix.posSemidef_gram`; `Matrix.det_gram_ne_zero_iff_linearIndependent`; `Polynomial.resultant_eq_zero_iff`; `MvPolynomial.schwartz_zippel_totalDegree`.

**Checks.**

- Fact 3 needs `p` odd and `χ(p)=−1`; primes dividing `q` have `χ(p)=0`, and the prime 2 changes the sum by at most `(log 2)/2`.
- The sign of `d` is immaterial: the trace pairing is positive definite for `d<0` and for `d>0`.
- `q=3`: §0.34 holds with no excluded range, and a zero `β≤1/2` already gives `(1−β)log q≥(log3)/2`.
- The principal character is excluded; its function `ζ` has no zero in `(0,1)`.
- A zero `β=1` is impossible by `DirichletCharacter.LFunction_apply_one_ne_zero`, so the statement is about `(0,1)` only.

See [109], Theorem 1, §2 and §6 for the theorem and the deduction from the prime bias; [110], Theorem 1.1 for the inert-prime estimate; [111] for an exposition.

*Needs:* §§0.11a–0.11b (Mertens's estimate on native prime carriers and the uniform Euler logarithmic derivatives, including the regularized `−ζ′/ζ(1+η)`); §0.30 and [ZerosOfLFunctions 6.4][R16] (the conductor bound 6.4d for `−L′/L` on the real segment); §0.12 (the effective gap below the threshold); §§0.34a–0.34c; `DirichletCharacter.LFunction`; `DirichletCharacter.IsPrimitive`; `MulChar.IsQuadratic`; `DirichletCharacter.LFunction_apply_one_ne_zero`.

### Proof-route checks

- **Finite order / Gamma:** §0.23 requires reciprocal-power summability at `floor(ρ)+1`, a compact-normal product and the polynomial logarithm bound (Yun–Zhang Appendix B.1, pp.901–902; Kupers §§14.1.1–14.1.2, pp.90–93). §0.23a adds explicit higher-derivative sector constants to the imported Stirling theory; §0.33 separately needs quantitative reciprocal bounds.
- **Primitive formulas:** §0.30a uses imported strip growth, Euler product and divisor to obtain conductor-uniform compact-height counts and simultaneous safe heights with multiplicities. §1.4a includes parity, both safe heights and endpoint corrections. Full unsubtracted formulas and imprimitive deleted factors remain separate. Low zeros use `min(1,1/|ρ|)`, never `1/|Imρ|`.
- **Exceptional families:** supplier6.3–6.4 gives per-character uniqueness/simplicity, and §0.34 empties the exceptional set at width `c_LS`, so §§0.6, 0.18 and 0.28 carry no exceptional term and §0.24 holds vacuously at `c_star≤c_LS`. Local family repulsion (§§0.17, 0.27) still requires the two-character positivity proof, conductor-product width and numerical constants. Siegel–Walfisz uses §0.18 and logarithmic-modulus optimization.
- **Computational hypotheses:** `SchoenfeldFiniteRangeInput`, `RosserSchoenfeldFiniteRangeInput`, `BMORFiniteInput`, `BMORClassNumberInput`, `ModEightFiniteInput` and `PrimeProductFiniteInput` are explicit hypotheses of §§0.3, 0.5, 0.7, 0.16 and 0.25 and of every use of their literal constants. The analytic tails beyond `exp(10000)`, the progression subtraction at `k,k/2` for `k≥2·10^10`, the strict higher-power bound of §0.4 and the thresholds 286 and 319 of §§0.19–0.20 are proved here.
- **Landau–Siegel / Mertens:** §0.34 requires the classification §0.34a, the Landau deduction §0.34b and the determinant method §0.34c, whose Hadamard inequality, resultant multiplicity bound and multiplicity estimate are targets; its finitely many small conductors use §0.12, not a computation. §0.9 deduces the effective `L(1,χ)≥c/log q` from §0.34 and §0.30a; ImaginaryQuadraticClassNumber's ineffective H2.4 bounds are not inputs. §0.11 uses only `Σ_(n≤x)log n=xlog x−x+O(log x)` and convergence of `Σlog m/[m(m−1)]`, without quantitative PNT. §0.26 additionally needs the tilted finite product, prime-tail integral, positive-real Euler product/pole adapter and `κ=∫(1_[0,1](u)−exp(−u))/u du=γ`; reversing this integrand changes the sign.
- **KP contracts:** §3.12a and §3.41 cover every fixed A. Keep `Q_d≤4|d|, log(Q_dQ_e)≤5log(|d|+4), c_Landau≤3c_star/5`, and higher-power/Abel/envelope prime-interval transfer. §2.31e supplies Aramata, integral orders, cyclic restriction and subgroup averages without general Artin holomorphy. Exact repulsion constants and original density proofs remain requirements.
- **Green–Tao:** high-height logarithmic/reciprocal bounds, bounded-height completion and weak convexity are required. Before applying Siegel–Walfisz to growing `W(N)`, prove `W(N)≤(log N)^B`; fixed-modulus PNT is insufficient.

### Examples

At modulus 1 the progression sums recover the ordinary Chebyshev sums. At modulus 2 the nonunit class 0 contains the prime 2 but no other prime, so `θ(x;0,2)=log 2` for `x≥2`. No exceptional zero exists at width `c_LS` (§0.34); at every width `β=1` and the lower cutoff are excluded by definition. The constant function 1 satisfies every upper-order bound but cannot satisfy strict derivative positivity; this explains the nonpolynomiality hypothesis.

### Dependencies

Mathlib complex analysis, arithmetic functions, Chebyshev sums, Dirichlet continuation and nonvanishing; Mathlib Gram matrices, resultants, Schwartz–Zippel and the Jacobi symbol for §0.34; ArithmeticDirichletSeries Layers 3, 6 and 8; LFunctions Layers 4–5 and ZerosOfLFunctions Layers 0–6; the local higher-genus and `ξ` adapters. Qualitative prime theorems are consumed only through the boundary contracts.

## Layer 1: Explicit formulas, mean values and conditional prime estimates

Use finite analytic-order zero data and half-weight arithmetic sums to state exact contour formulas. Uniform Gamma estimates are independent analytic inputs. Primitive-character and ray-class density results retain conductor and field-degree dependence. The RH and GRH propositions form an explicit conditional interface; no unconditional proof consumes them.

### 1.1 Reciprocal zeta on the line one

Let `Zinv` be the meromorphic reciprocal of the continued `ζ`, extended at `s=1` by zero. For all real `t, |Zinv(1+2it)|≤C log(2+|t|)`, and `Zinv(1+2it)→0` as `t→0`.

Use the zero-free region and pole-cleared reciprocal estimates away from `t=0`. Extend `1/ζ` through the pole by the removable value 0; no totalized value of 1/riemannZeta 1 is used.

See [60][R60], Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for `ζ(2s)`'); [60][R60], Proof of Proposition2, p.969, sentence preceding (6.7).

*Needs:* [ZerosOfLFunctions Classical high-height zero-free region][R16].

### 1.2 Davenport uniform Möbius exponential cancellation

The uniform frequency signature is `davenport_moebius`.

For each `A>0` there is `C_A` such that for `y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}`. The constant `C_A` is effective, because the zero gap of §0.31b is; this effective form is the one stated. The additive normalization `e^{irα}` is obtained from `e(rθ)=exp(2πirθ)` by `θ=α/(2π)`.

Apply the following exact convolution identity, the type-I/type-II estimates proved in Koukoulopoulos §23, and a reciprocal-`L` major-arc contour estimate. These contracts establish the full uniform result; they do not use a fixed-modulus qualitative prime theorem as a substitute.

See [58][R58], Lemma3.2 and proof reference, p.690.

**§1.2a Uniform Möbius major/minor arcs.** Use the authorized Koukoulopoulos, *The Distribution of Prime Numbers*, §23 pp.237–249, especially the proofs of Theorems23.5–23.6, pp.242–246, and Exercise23.4, pp.248–249. Fix `A>0`, choose `D>2(A+5)`, then `C>D+A+6`. Dirichlet approximation with `Q=x/(log x)^C` gives coprime `a,q` with `q≤Q` and `|θ−a/q|≤1/(qQ)≤1/q²`. All subsequent estimates are eventual in `x`; the remaining bounded range is absorbed in `C_A`.

For `(log x)^C≤q≤x/(log x)^C`, put `U=V=(log x)^D` and use the exact identity
`μ=−μ_(≤U)∗μ_(≤V)∗1+μ_(>U)∗μ_(>V)∗1+μ_(≤U)+μ_(≤V).`
Expand `μ∗1=δ` to prove it, retaining `n=1` and real cutoffs. The two short terms cost `O(U)`. The type-I coefficient `c=μ_(≤U)∗μ_(≤V)` is supported on `[1,U²]` and `|c(k)|≤τ(k)≤2√k≤2U`. Theorem23.5 with `v=0` therefore gives
`|Σ_(n≤x)(c∗1)(n)e(nθ)|≪U(U²+x/q+q)log x`.
Its proof opens the inner geometric sum, partitions `k` into blocks of length `floor(q/2)`, uses spacing1/(2q), and sums the resulting harmonic bounds; this proves the displayed uniform estimate for the actual coefficients, without an uncontrolled `x^ε` factor.

For the long convolution set `f=μ_(>U)` and `g=μ_(>V)∗1`. Both supports begin beyond `U`. Decompose each variable into dyadic intervals with upper endpoints `Y,Z` and `YZ≤4x`; terms with `YZ>4x` vanish after a finer endpoint split. Then `Y,Z≤2x/U, |f|≤1` and `|g|≤τ`. Theorem23.6, with its retained hyperbolic cutoff, gives
`|Σ_(k≤Y,l≤Z,kl≤x)f(k)g(l)e(θkl)|≪[Y+Z+YZ/q+q]^(1/2)(log(2q))^(1/2)||f||₂||g||₂`.
Use `Σ_(n≤Z)τ(n)²≪Z log³(2Z)`, since `τ²≤τ₄` and three harmonic sums bound `Στ₄`. Summing `O(log²x)` dyadic pieces yields the sufficient bound
`|Σ_(n≤x)(f∗g)(n)e(nθ)|≪(x/√U+x/√q+√(xq))log⁴(2x)`.
The type-I bound is `O(log^(3D+1)x+x log^(D+1−C)x)`, and the type-II bound is `O(x log^(4−D/2)x+x log^(4−C/2)x)`. The choices of `D,C` make each `O_A(x/log^A x)`. In particular a pointwise divisor estimate with a fixed `x^ε` loss is not used on the `x/√q` or `√(xq)` terms.

For `q<(logx)^C`, prove `mobius_small_modulus_progressions`: for each `B,C>0`, all residues `b` and `0≤y≤x`, `Σ_(n≤y,n≡b(q))μ(n)≪_(B,C)x/log^Bx`. Unit classes use orthogonality and `1/L(s,χ)`. Put `L=logx,T=exp(L^(1/3)),δ=c/log²(q(T+2))`. The zero-free region and the effective zero gap `.siegel_gap` of §0.31b place all zeros left of the wider `Re s≥1−c₀/log(q(T+2))` rectangle, for `c₀≤c_LS`. On `|Ims|≤T,|Res−1|≤δ`, local expansion gives `|L′/L|≪log²(q(T+2))`. At `1+δ`, `|1/L|≤ζ(1+δ)≪1/δ`; horizontal integration over length `≤2δ` preserves this up to an absolute factor. Separate the principal pole and its reciprocal zero. This gives a fixed logarithmic-power reciprocal bound.

Finite Perron at the half-integer nearest `y` avoids endpoints. Shifting to `1−δ` costs `≪yexp(−c′L^(1/3))` times a `log` power; horizontal/truncation errors are `≪x/T` times a `log` power. For `y≥x/log^Ex`, `logy∼logx`; smaller `y` uses the trivial bound with `E>B`. Deleted factors cost another `log` power. For nonunit `b` put `d=(b,q),n=dm`: nonsquarefree `d` contributes 0; otherwise `μ(dm)=μ(d)μ(m)1_((m,d)=1)`. Orthogonality modulo `q/d` and finite prime exclusions give the same bounds. Choose `B` after `A,C` to absorb polylogarithmically many residues/divisors. Abel summation costs `1+x|θ−a/q|≤1+(logx)^C`. All constants are effective.

The named interfaces are `mobius_vaughan_identity`, `mobius_type_I_bound`, `mobius_type_II_bound`, `mobius_reciprocal_narrow_rectangle`, `mobius_small_modulus_progressions` and `mobius_major_minor_uniform`. The source's elementary type-I/type-II proofs and its exercise supply the decomposition route; the explicit polylogarithmic cutoffs and narrow reciprocal contour above provide the quantitative adapters. At `θ=0` choose `q=1`, so the major-arc branch is indispensable. At `n=1` the identity reads `−1+0+1+1=1`. A fixed rational denominator cannot be declared a minor arc.

*Needs:* `ArithmeticFunction.moebius`; §0.30; §0.31b; §0.30a; ADS.6 finite Perron and Abel summation.

### 1.3 Admissible Weil test function

For `c≥0` and `F:R→R, weil_test_function(c,F)` means that some `ε>0` makes `G(x)=F(x)exp((1/2+c+ε)|x|)` Lebesgue integrable and of bounded variation on `R`, that `F(x)=(F(x−)+F(x+))/2` at every `x`, and that the difference quotient `q(x)=(F(x)−F(0))/x` for `x≠0`, set to0 at `x=0`, has bounded variation on `R`. The quotient may have distinct finite one-sided limits at0; no differentiability at0 is imposed. These symmetric-tail hypotheses are a strengthening of Mestre’s printed one-signed weight. They supply both `F` and its reflection in the contour proof.

Use native bounded variation and strict one-sided limits. Weighted variation gives local variation of `F` and its one-sided limits. Set `q(0)=0` by real division; a finite point change preserves integrability/variation. Bounded `q` gives `F(x)−F(0)=O(|x|)`. On the transform strip, dominate by `|G(x)|e^(−ε|x|)`; reflection and real linear combinations preserve the conditions after decreasing `ε`.

- `weil_test_function.transform`: Define `Φ_F(s)=∫_R F(x)exp((s−1/2)x)dx` with the complex exponential. For an admissible `F`, the integrand is absolutely integrable whenever `−c≤Re s≤1+c`; totalized integration is never a convergence claim.
- `weil_test_function.reflection`: `x↦F(−x)` is admissible with the same `c,ε`.
- `weil_test_function.add`: Real linear combinations of admissible functions are admissible, after decreasing `ε` if needed.
- `weil_test_function.normalization`: `F` equals the mean of its two one-sided limits, fixing boundary values in the summation formula.
- `weil_test_function.mono`: If `F` is admissible for `c` and `0≤c′≤c` then `F` is admissible for `c′`, using `ε′=ε+c−c′`.
- `weil_test_function.continuous_at_zero`: Admissibility implies a finite constant `C≥0` with `|F(x)−F(0)|≤C|x|` for all `x`, hence continuity at0; the one-sided derivatives need not agree.

**Checks.**

- `F=0` is admissible and `Φ=0`.
- For `c≥0, F(x)=exp(−x²)` is admissible and `Φ_F(1/2)=√π`.
- `F(x)=exp(−2x)` on all `R` satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected.
- `F(x)=exp(−|x|)` is admissible for `c=0`, although `(F(x)−F(0))/x` has one-sided limits1 and `−1` at0. A removable-continuous-quotient requirement would wrongly reject it.
- `F(x)=exp(x/4)` for `x<0` and `exp(−2x)` for `x≥0` satisfies Mestre’s one-signed weighted integrability/BV conditions at `c=0, ε=1/4` and the difference-quotient condition, but is not admissible here and its ordinary transform integral at `s=0` diverges.

See [61][R61], §I.2, pp.212–214.

*Needs:* `BoundedVariationOn`; `Function.leftLim`; `Function.rightLim`; `MeasureTheory.Integrable`; `MeasureTheory.integral`.

### 1.4 Half-interval explicit formula and low-zero-safe bound

The inclusive-height signature is `half_interval_explicit_formula`; its finite-support zero sum uses `analyticOrderAt` multiplicities.

There are absolute `C>0` and `k₀≥2` such that for every primitive nonprincipal Dirichlet character `χ` of conductor `q`, integer `k≥k₀` and real `2≤T≤k, Σ_(k/2<m≤k)χ(m)Λ(m)=−Σ_(nontrivial zeros |Imρ|≤T)mρ(k^ρ−(k/2)^ρ)/ρ+E`, with `|E|≤C[k log²(qk)/T+log²(qk)]`. Endpoint sums are over positive integers; powers use `exp(ρ log x)`.

Use `k₀=4` and the direct subtracted Perron contour below. Its entire kernel removes the character constant before any estimate; the only parity contribution is bounded by `log2`. This proves the stated uniform error without requiring an absolute bound on the individual constant `b(χ)`, or on a reciprocal of a zero near0. Imprimitive characters require separate deleted local Euler factors and are not included in this signature.

For odd `k, k/2` is a half integer; for even `k` both integer endpoint corrections are included. The constant is independent of `q,k,T`; nonprincipal and primitive are actual hypotheses. An arbitrarily small real zero has a bounded half-interval kernel; no absolute `1/|ρ|` bound is assumed.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya §§10.1–10.2 pp.59–60, where the parity `a` of the character is assigned oppositely in Theorem10.2 and after Lemma10.3, while here `a=0` for even and `a=1` for odd characters throughout; [53][R53], §10.2 Lemma10.3 p.60, uniform local count used in the explicit-formula route.

*Needs:* §0.30; [ZerosOfLFunctions Layer 4 divisor and high-height estimates][R14]; [ZerosOfLFunctions its Gamma estimates][R12]; Completed/ArithmeticDirichletSeries Layer 6 finite Perron; §0.30a; §1.4a; §1.4c; §1.4d.

**§1.4a Primitive-character subtracted Perron contour.** For a primitive nonprincipal `χ` modulo `q≥3, k≥4` an integer and `2≤T≤k`, put `K_k(s)=(k^s−(k/2)^s)/s`, extended by `K_k(0)=log2`. Finite Perron on `c=1+1/log k` expresses the half-weighted interval sum as the integral of `−(L′/L)(s,χ)K_k(s)` over `[c−iT,c+iT]`, divided by `2πi`, with error `O(k log²(qk)/T+log k)`. All constants here are absolute.

Apply the imported finite Perron remainder separately at the integer or half-integer endpoints, using their distance `≥1/2` from every other integer and `|χ(n)Λ(n)|≤log n`. The two main vertical integrals have the same `c` and subtract to this kernel; the bound permits `T` up to `k` although the smaller endpoint is `k/2`. The dyadic remainder estimate at that endpoint uses `T≤2(k/2)`, changing only its absolute constant. Choose `T′∈[T,T+1]` avoiding the union of zero ordinates near both `+T` and `−T` by `c₁/log(q(T+2))`; for complex `χ` these two bands need not be conjugate. The local count makes this possible. The local logarithmic-derivative expansion then gives `O(log²(qk))` on the two horizontal edges for `−1≤Re s≤c`.

Move the left edge to `Re s=−N−1/2`, so it stays `≥1/2` from every trivial zero. For `Re s≤−1` the functional equation, Gamma reflection and the absolutely convergent right-half-plane `L`-series give `|L′/L|≪log(q(|s|+2))` away from those trivial zeros. The horizontal kernel bound is `(k^σ+(k/2)^σ)/T′`. Its integral from−∞ to `c` is `O(k/T)`, since `log(k/2)≥log2`. The distant vertical integral tends to0 as `N→∞`, by exponential decay `(k/2)^(−N)`. Hence the only nontrivial residues are `−mρK_k(ρ)`. For even `χ` the simple trivial zero at0 contributes `−log2`; for odd `χ` it is absent. All negative trivial-zero contributions sum absolutely to `O(1)`, since `|K_k(−j)|≤2(2/k)^j/j`. There is no pole of the kernel at0 and no residual character constant. These facts are the reason for subtracting before shifting.

Removing zeros with `T<|Imρ|≤T′` costs `O(k log(q(T+2))/T)`, by the local count and `|K_k(ρ)|≤2k/T` there. Converting the half weights at the two endpoints costs `O(log k)`. This yields §1.4, including its inclusive cutoff and parity conventions. The primary contour model is Koukoulopoulos, *The Distribution of Prime Numbers*, Chapter8 proof of Theorem5.1, pp.85–86; its conductor-uniform local expansion is Lemma11.4, pp.114–115, preceding Theorem11.3. The modification here replaces `x^s/s` by the entire difference `K_k`, rather than quoting the unspecified `b(χ)` in another explicit formula.

Checks: `K_k(0)=log2` while the separate `k^s/s` terms have poles; at `k=4` the negative-trivial-zero tail is bounded by `2Σ2^(−j)/j`; a complex character requires safe heights in both bands, not just the positive one. The near-zero kernel Check in §1.4 applies unchanged. *Needs:* ArithmeticDirichletSeries Layer6 finite Perron and its endpoint remainder; §0.30a; [ZerosOfLFunctions 1.2–1.4][R12]; native finite residue theorem.

**§1.4b Bounded right-edge logarithmic derivative.** For each complex `s` with `Re s≥2, |ζ′(s)/ζ(s)|≤Σ_(n≥1)Λ(n)n^−2<∞`, with the same absolute constant for every imaginary part.

Use the absolutely convergent Mangoldt logarithmic-derivative series on `Re s>1`. Since `Λ(n)≥0` and `n^−Re s≤n^−2` for `Re s≥2`, sum the termwise norm bound. Convergence at 2 is supplied, not rebuilt.

See [53][R53], §8.3 negative log-derivative series, p.50; `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`.

**§1.4c Low-zero-safe interval kernel.** For each real `x≥2` and complex `ρ` with `0<Reρ<1, |(x^ρ−(x/2)^ρ)/ρ|≤2x^(Reρ)min(1,1/|ρ|)`. Positive-real powers use `exp(ρ log x)`; the bound remains finite as `ρ` approaches0.

Integrate the derivative of `t^ρ` on `[x/2,x]`: the quotient is `∫t^(ρ−1)dt`, bounded by `x^Reρlog2`. The direct numerator bound is `2x^Reρ/|ρ|`. Split at `|ρ|=1`, using `log2≤2`. The limit at `ρ=0` is `log2`; subtract before taking norms.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387; the half-interval deduction is completed here.

**§1.4d Logarithmic-square sum of zero weights.** There is an absolute `C>0` such that for every primitive Dirichlet character `χ` of conductor `q≥1` and every `T≥2, Σ_(nontrivial zeros |Imρ|≤T)mρ min(1,1/|ρ|)≤C log²(q(T+2))`. Nontrivial means `0<Reρ<1`, and multiplicity is analytic order.

The conductor-uniform local count gives `O(logq)` low zeros, each weighted `≤1`. In a unit band `m≤|Imρ|<m+1`, `m≥1`, the weight `≤1/m` and count `≤C₀log(q(m+2))`. Summation to `⌈T⌉` gives `O(logq log(T+2)+log²(T+2))≤O(log²(q(T+2)))`. Primitive principal conductor 1 uses the supplier’s `ζ` local count and the same bands. No unbounded `1/|ρ|` estimate at low zeros is used.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya Lemma10.3 p.60.

### 1.5 Mean square of a Dirichlet polynomial

For each integer `N≥0`, real `T≥0` and complex `a₁,…,a_N`, the absolute difference between `∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt` and `2TΣ|a_n|²` is at most `6πΣn|a_n|²`. Empty sums are zero. Suggested form: `dirichlet_polynomial_mean_square`.

Expand and integrate the finite square; the diagonal is `2TΣ|a_n|²`. The off-diagonal is the difference of weighted Hilbert forms for `a_n exp(±iTlogn)`, divided by `i`. Since `log(1+1/n)≥1/(n+1)≥1/(2n)`, each form gives the required combined `6πΣn|a_n|²` bound. Treat empty/singleton sums before spacing minima; no `Λ`-support premise is used.

See [62][R62], Theorem2 and Corollary2 pp.74–75, Corollary3 p.75, proof §4 p.82. GHS Lemma2.6 is used only for the separate Λ-supported estimate.

*Needs:* `intervalIntegral`; §1.5a.

**§1.5a Weighted finite Hilbert inequality.** For a finite set I of cardinality `≥2`, distinct real `λ_r, δ_r=min_{s≠r}|λ_r−λ_s|>0` and arbitrary complex `u_r`,
`|Σ_{r≠s} u_r conjugate(u_s)/(λ_r−λ_s)| ≤ (3π/2)Σ_r |u_r|²/δ_r`.
The cardinality0 and1 forms are zero without defining a minimum over an empty set. This statement has no coefficient support restriction.

Conjugate the finite skew-Hermitian cosecant matrix by square roots of the positive weights and apply the spectral theorem. At an extremizing eigenvector the cosecant–cotangent identity cancels the two triple sums ((3.10)–(3.17), pp.80–81). Lemmas 2,4,5 bound diagonal/mixed terms by convex integration on disjoint half-spacing intervals, cotangent partial fractions and a semicircle integral (§2 pp.76–78); Lemma 3 pairs positive partial fractions for the endpoint fourth-power bound. This gives weighted cosecant (1.3). Doubling (p.81) removes the temporary spacing restriction. Substitute `ελ_r`, multiply by `πε` and take the finite termwise `ε↓0` limit, giving (1.7)’s constant `3π/2` (§4 p.82). For `λ=(0,1), u=(1,i)`, each off-diagonal term is `i`, summing to 2i; conjugation and denominator direction matter.

API: `weightedHilbert.finite`, `.empty`, `.singleton`, `.frequency_shift`, `.frequency_scale`, `.log_frequency_spacing`, `.mean_square_error`. Checks: a singleton has zero error for every `T`; translating all `λ` leaves the form and `δ` unchanged; scaling `λ` by `c≠0` scales both bounds by `1/|c|`; two coefficients1 at frequencies0,1 have an off-diagonal integral bounded independently of `T`, whereas replacing `δ_r` by a fixed spacing for `log n` would fail at large `n`. These use the existing finite matrix and real/complex trigonometric carriers.

*Needs:* pinned Mathlib finite-dimensional Hermitian spectral theorem; `Complex.cot`; `Complex.sin`; finite sums; completed ContourIntegration residue theorem for the semicircle computation.

### 1.6 Riemann and generalized Riemann hypotheses as statements

For a Dirichlet character `χ` modulo `N ≥ 1`, DirichletGRH `χ` is the proposition: for every `s ∈ ℂ` with `Re s > 0`, (`χ ≠ 1` or `s ≠ 1`) and `L(s,χ) = 0` imply `Re s = 1/2`, where `L(s,χ)` is `DirichletCharacter.LFunction χ s`. GRH is the proposition that DirichletGRH `χ` holds for every `N ≥ 1` and every `χ` modulo `N`. The Riemann hypothesis is Mathlib’s RiemannHypothesis. These are statements, never assumptions of an unconditional theorem; a theorem that uses one carries it as an explicit hypothesis.

The strict `Re s>0` excludes trivial zeros and imprimitive deleted-factor zeros on `Re s=0`; the principal-character clause excludes its totalized pole value. `DirichletCharacter.LFunction_ne_zero_of_one_le_re` leaves only the open critical strip.

- `DirichletGRH`: The proposition defined above, for one character.
- `GRH`: For all `N ≥ 1` and all `χ` modulo `N`, DirichletGRH `χ`.
- Zero location: If DirichletGRH `χ, 0 < Re s`, (`χ ≠ 1` or `s ≠ 1`) and `L(s,χ) = 0`, then `Re s = 1/2`.
- Conductor one: For the trivial character modulo 1, DirichletGRH holds if and only if RiemannHypothesis holds: `L(s,1) = ζ(s)`, and `ζ` has no zeros with `Re s ≤ 0` other than the trivial zeros `−2, −4, …`.
- Primitive induction: DirichletGRH `χ` holds if and only if DirichletGRH holds for the primitive character inducing `χ`: the two `L`-functions differ by finitely many Euler factors, whose zeros lie on `Re s = 0`.
- Riemann specialization: GRH implies RiemannHypothesis.

**Checks.**

- For the trivial character modulo 1, the trivial zero `s = −2` of `ζ` does not contradict DirichletGRH: `Re(−2) ≤ 0` is outside the constrained region.
- For the principal character modulo `2, L(s,χ) = (1 − 2^{−s})ζ(s)` vanishes at `s = 2πi/log 2`; this zero has real part 0 and is not constrained, so a definition over `Re s ≥ 0` would be wrong.
- For `χ = 1` the value of the totalized LFunction at `s = 1` is not constrained.
- DirichletGRH (1 : DirichletCharacter `ℂ 1`) ↔ RiemannHypothesis.

See [53][R53], §7.3, Conjecture 7.8, p. 45; §10.3, Conjecture 10.4 and Remark 10.5, pp. 60–61.

*Needs:* `RiemannHypothesis`; `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; `riemannZeta`.

### 1.7 Selberg zero-density input

The signature `selberg_zero_density` counts zeros with `Re ρ≥σ`, `Re ρ<1` and `|Im ρ|≤T`, using their analytic multiplicities.

For `ε>0, Q≥2, T≥2`, and `1/2≤σ≤1, Σ_{q≤Q} Σ_{χ primitive mod q} N(σ,T,χ) ≤ C_ε (Q^(5+ε)*T^(3+ε))^(1-σ)`. The bound is log-free: at `σ=1−1/log(QT)` the right side is at most `C_ε e^(5+ε)`, so the count includes a possible exceptional zero without a separate term; and `(Q^(5+ε)T^(3+ε))^(1−σ)≥1` throughout the range, so no additive constant is needed.

Route, in two ranges. For `4/5≤σ≤1`, Jutila's Theorem 1, (1.8), gives `Σ_{q≤Q}Σ*_χ N(σ,T,χ)≪_ε (Q²T)^((2+ε)(1−σ))` uniformly for `T≥1`, by Selberg pseudocharacters, a zero-detecting Dirichlet polynomial averaged over the pseudocharacter parameter, the large sieve and Halász's inequality; since `Q^(4+2ε)T^(2+ε)≤Q^(5+2ε)T^(3+2ε)` for `Q,T≥1`, the statement follows on that range with `ε` replaced by `2ε`. For `1/2≤σ≤4/5`, Montgomery's density theorem gives `Σ_{q≤Q}Σ*_χ N(σ,T,χ)≪(Q²T)^(3(1−σ)/(2−σ))(log QT)^A` with an absolute `A`, uniformly for `1/2≤σ≤1` and `T≥2`; there `3/(2−σ)≤5/2`, so the power is at most `(Q⁵T^(5/2))^(1−σ)≤(Q⁵T³)^(1−σ)`, and since `1−σ≥1/5` the logarithm is absorbed: `(log QT)^A≤C_ε(QT)^(ε/5)≤C_ε(QT)^(ε(1−σ))`. Neither input alone covers the statement: Jutila's theorem is stated only for `σ≥4/5`, and Montgomery's logarithmic factor is not absorbed as `σ→1`. At `σ=3/4` and `Q=1` the second range gives `N(3/4,T)≪T^(3/5)(log T)^A≤C_εT^((3+ε)/4)`, which is what the statement asserts there. Selberg's estimate `(Q⁵T³)^((1+ε)(1−σ))`, quoted as (1.4) in the same paper, is unpublished and is not an input. A density bound whose exponent carries an additive `+ε`, such as `(Q²T)^(A(σ)(1−σ)+ε)`, or a factor `(log QT)^A`, is not bounded at `σ=1−1/log(QT)` and does not imply this statement.

See [Jutila][R97], Math. Scand. 41 (1977), p.46, Theorem 1, (1.8), and its proof §3, pp.51–54; [Bombieri][R99], §10, Théorème 20, p.77, with its proof pp.77–82, for Montgomery's theorem in the form used here (primitive characters, `(log QT)^A`); Montgomery [108], *Zeros of L-functions*, Invent. Math. 8 (1969), 334–345, for the original, and Montgomery [100], Theorem 12.1, for the textbook form; [47][R47], §12, p.386, for the form of the bound used there.

*Needs:* §1.5; `DirichletCharacter.LFunction`; native large-sieve inequality for Dirichlet polynomials.

### 1.8 Weil's explicit formula (Mestre's formalism)

The signature `weil_explicit_formula` uses `WeilTestFunction`, `weilTransform` and `weilGammaTerm` for the admissible test, bilateral transform and combined Gamma subtraction.

The consumer is Chenevier–Taïbi §2.3, pp.275–276, (2.3.5), applied to automorphic Rankin–Selberg pairs in the classical-group multiplicity programme. Their gamma factors and paired functional equations are not confined to the degree-one Dedekind/Hecke families of [ZerosOfLFunctions 8.2–8.4][R18]. This target retains that generality and its test-function carrier; the degree-one specializations use the supplier.

Let `A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M)` with `Σ a_i = Σ a′_i, b_i, b′_i ∈ C` with non-negative real parts, and `Λ_1, Λ_2` meromorphic on `C` with `(i) Λ_1(1 − s) = wΛ_2(s)` for some `w ∈ C^×`; (ii) finitely many poles; (iii) `Λ_i` minus its singular parts bounded in every vertical strip of finite width; (iv) for some `c ≥ 0` and `Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1}` and `Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1}` with `|α_i(p)|, |β_i(p)| ≤ p^c`. Let `F` satisfy `weil_test_function(c,F)`. For each zero gamma slope `a_i=0` (respectively `a′_i=0`), assume `b_i≠0` (respectively `b′_i≠0`), so its constant gamma factor is finite and nonzero. Then `Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}`, where `ρ` (resp. `μ`) runs over the zeros (resp. poles) of `Λ_1` with `−c ≤ Re ≤ 1 + c`, with multiplicity, `Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx` and `J(a, b)` is the same with `F(−ax)`. For `a>0` the displayed `I,J` are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For `a=0` set `I(0,b)=J(0,b)=0` after removing its constant gamma factor; this is not0 times an undefined integral.

Remove finite nonzero zero-slope Gamma constants; this changes only `w`, leaving `A,B` and equal positive slope sums. Pole-clearing and strip bounds give polynomial growth, local zero counts and safe-height logarithmic derivatives on the needed strip (possibly wider than Remark 1.1.3’s `−1<σ<2`). Integrate `Φ_FΛ′₁/Λ₁` around a rectangle with zero/pole multiplicities. Reflection converts the left edge; symmetric tails justify both. Fourier inversion gives prime powers. For `a>0` combine Gamma subtraction using Lemmas 1.2.1–2 and Poitou pairing, with the bounded difference quotient cancelling near 0. Take the symmetric zero limit. Good heights and uniform Fourier limits are part of this target.

For `F=0` every term vanishes. For the completed Riemann zeta take `c=0, a=a′=1/2, b=b′=0, A=B=π^(−1/2), α=β=1`. Its two pole terms are `Φ_F(0)+Φ_F(1)`, and the prime side has both `±k log p` contributions. Adding a finite nonzero constant gamma factor with slope0 changes no explicit-formula term; a zero-slope `Γ(0)` is excluded. The asymmetric `F` in test `weil_test_function.asymmetric_tail` is excluded: `Φ_F(0)` in the Riemann pole term would diverge under the printed one-signed conditions.

See [61][R61], §I.1–I.2, pp.211–215; Remark1.1.3, Lemmas1.2.1–1.2.2; [63][R63], §2.3 pp.275–276, (2.3.5).

*Needs:* §1.3; `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`.

**§1.8a Weil's explicit formula for `ζ` with `C¹` test functions.** The signature `zeta_weil_explicit_formula` uses the test predicate `WeilC1TestFunction`, and Gauss's integral is `digamma_eq_integral`. `WeilC1TestFunction F` means that `F:ℝ→ℂ` is `C¹` and that, for some `ε>0`, both `F(x)e^((1/2+ε)|x|)` and `F′(x)e^((1/2+ε)|x|)` are Lebesgue integrable on `ℝ`. Every `C¹` function with `|F(x)|+|F′(x)|≤Ce^(−(1/2+δ)|x|)` for some `δ>0` qualifies, with `ε=δ/2`; the class is closed under `x↦−x` and complex linear combinations, after decreasing `ε`. It is not contained in §1.3's class, whose bounded variation of `(F(x)−F(0))/x` can fail for a `C¹` function, and does not contain it: `e^(−|x|)` is admissible there but not `C¹`.

For such `F` put `Φ_F(s)=∫_ℝF(x)e^((s−1/2)x)dx` and `F̌(x)=F(−x)`. Then `Σ_(n≥1)Λ(n)n^(−1/2)(F(log n)+F(−log n))` converges absolutely, the archimedean integrand below is absolutely integrable on `(0,∞)`, and
`lim_(T→∞)Σ_(0<Re ρ<1,|Im ρ|<T)m(ρ)Φ_F(ρ)=Φ_F(0)+Φ_F(1)−W_∞(F)−Σ_(n≥1)Λ(n)n^(−1/2)(F(log n)+F(−log n))`,
`W_∞(F)=F(0)log π+(1/2)∫_0^∞[(F(x/2)+F(−x/2))e^(−x/4)/(1−e^(−x))−2F(0)e^(−x)/x]dx`,
where `ρ` runs over the nontrivial zeros of `ζ` and `m(ρ)` is the analytic order. In §1.8's notation `W_∞(F)=F(0)log π+I(1/2,0)+J(1/2,0)`, so for real `F` in both classes this is §1.8 at the data of the completed Riemann zeta (`c=0`, `a=a′=1/2`, `b=b′=0`, `A=B=π^(−1/2)`). The compactly supported smooth tests of [ZerosOfLFunctions 8.4][R18] at `K=ℚ` are the case `F(x)=φ(e^x)e^(x/2)`, for which `Φ_F` is the Mellin transform of `φ` and the zero side converges absolutely; for a general `F` here only the symmetric limit is asserted.

The contour steps are targets here; `0<δ<min(ε,1)` is fixed.

- `.pointwise`: `|F(x)|≤Ce^(−(1/2+ε)|x|)`. The function `F(x)e^((1/2+ε)|x|)` is continuous with integrable derivative on each half-line, so it has limits at `±∞`, which vanish by integrability. This gives the absolute convergence of the prime series.
- `.transform_decay`: `Φ_F` is holomorphic on `−ε<Re s<1+ε` and continuous on the closed strip, where `|Φ_F(s)|≤C/(1+|Im s|)` by one integration by parts, `(s−1/2)Φ_F(s)=−∫F′(x)e^((s−1/2)x)dx`; and `Φ_F(1−s)=Φ_(F̌)(s)`.
- `.rectangle`: for a height `T′` of `riemannZeta_safe_height` (§0.30a), the residue theorem for `Φ_F Λ′/Λ`, with `Λ=completedRiemannZeta`, on the rectangle with sides `Re s=−δ`, `Re s=1+δ`, `Im s=±T′` gives `Σ_(|Im ρ|<T′)m(ρ)Φ_F(ρ)−Φ_F(0)−Φ_F(1)`: `Λ` has simple poles at 0 and 1 and its zeros are the nontrivial zeros of `ζ`. `Λ(1−s)=Λ(s)` moves the left side to `Re s=1+δ` with `F̌` in place of `F`.
- `.horizontal_edges`: on `Im s=±T′`, `Λ′/Λ(s)=−(1/2)log π+(1/2)ψ(s/2)+ζ′/ζ(s)` is `O(log²T′)` by the safe height and [ZerosOfLFunctions 1.4][R12], and `Φ_F=O(1/T′)`, so these sides tend to 0.
- `.prime_side`: `(2πi)⁻¹∫_(1+δ−iT)^(1+δ+iT)Φ_F(s)(−ζ′/ζ)(s)ds→Σ_(n≥1)Λ(n)n^(−1/2)F(log n)`. Expand `−ζ′/ζ` by `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; each term is `n^(−1−δ)` times a truncated Fourier inversion integral of `G(y)=F(y)e^((1/2+δ)y)` at `y=log n`. Since `G` and `G′` are integrable, `G` has bounded variation, so these truncated integrals converge pointwise and are bounded uniformly in `T` and `n` (Dirichlet–Jordan), and dominated convergence over `n` applies.
- `.archimedean_side`: with `ψ=Complex.digamma`, `(2πi)⁻¹∫_(1+δ−iT)^(1+δ+iT)(Φ_F(s)+Φ_(F̌)(s))((1/2)ψ(s/2)−(1/2)log π)ds→−W_∞(F)`. Move the segment to `Re s=1/2`; this crosses no singularity and costs `O(log T/T)` on the horizontal sides. At `s=1/2+it` the factor `Φ_F(s)+Φ_(F̌)(s)=F̂(t)+F̂(−t)`, with `F̂(t)=∫F(x)e^(itx)dx`, is even in `t`, so `ψ(1/4+it/2)` may be replaced by its even part. Insert Gauss's integral and exchange the finite `t`-integral with the absolutely convergent `x`-integral: with `F_e(x)=(F(x)+F(−x))/2` and `S_T` the truncated inversion integral, the `x`-integrand is `S_TF_e(0)e^(−x)/x−S_TF_e(x/2)e^(−x/4)/(1−e^(−x))`. Since `S_TF_e` is bounded uniformly in `T` and tends to `F_e` pointwise, dominated convergence handles `x≥1` and the bounded part of the integrand on `(0,1)`. The remaining part `∫_0^1(S_TF_e(0)−S_TF_e(x/2))x⁻¹dx` equals `−∫_ℝF_e′(u)(S_Tℓ)(u)du` for `ℓ(u)=log(1/(2u))` on `(0,1/2]` and 0 elsewhere. Plancherel (`MeasureTheory.Lp.norm_fourier_eq`) gives `S_Tℓ→ℓ` in `L²`, which suffices on `|u|≤1`, where `F_e′` is bounded; on `|u|>1`, `|S_Tℓ(u)|≤C/|u|` and Riemann–Lebesgue give dominated convergence. Along the line the integral converges in general only as a symmetric limit, since `Φ_F` decays like `1/|Im s|` while `ψ(s/2)` grows like `log|Im s|`; this is why `W_∞` is written as the combined integral, which converges absolutely.
- `.height_limit`: the zeros with `T′≤|Im ρ|<T`, for consecutive safe heights, number `O(log T)` and have `|Φ_F(ρ)|=O(1/T)`, so the limit along safe heights is the limit over all `T`.

`digamma_eq_integral` (Gauss): for `Re z>0`, `ψ(z)=∫_0^∞(e^(−t)/t−e^(−zt)/(1−e^(−t)))dt`, the combined integrand being absolutely integrable. Mathlib's `Complex.digamma` has no integral representation at the pin, so it is proved here. `Complex.digamma_apply_add_nat`, `Complex.digamma_one` and the asymptotic `ψ(w)=log w+O(1/|w|)` of [ZerosOfLFunctions 1.4][R12] give `ψ(z)=−γ+Σ_(n≥0)(1/(n+1)−1/(n+z))`. Write `1/(n+w)=∫_0^∞e^(−(n+w)t)dt` and sum under the majorant `|e^(−t)−e^(−zt)|/(1−e^(−t))`. Finally `−γ=∫_0^∞(e^(−t)/t−e^(−t)/(1−e^(−t)))dt` follows from `γ=lim(H_N−log N)`, `H_N=∫_0^∞e^(−t)(1−e^(−Nt))/(1−e^(−t))dt` and `log N=∫_0^∞(e^(−t)−e^(−Nt))t⁻¹dt`, the last by Tonelli on `∫_1^N∫_0^∞e^(−ut)dt du`.

**Checks.**

- `F=0`: every term vanishes.
- Replacing `F` by `F̌` exchanges `Φ_F(0)` and `Φ_F(1)` and sends `Φ_F(ρ)` to `Φ_F(1−ρ)`, which permutes the zero side because `ρ↦1−ρ` preserves the nontrivial zeros, their orders and `|Im ρ|`; `W_∞` and the prime side are unchanged. A prime side with `F(log n)` alone would fail this.
- The poles enter with a plus sign; counting them in the signed divisor on the zero side would subtract `Φ_F(0)+Φ_F(1)` a second time.
- The archimedean integrand tends to `(5/2)F(0)` as `x→0⁺`; integrating `(F(x/2)+F(−x/2))e^(−x/4)/(1−e^(−x))` apart from the subtracted term diverges at 0 unless `F(0)=0`.
- Gauss's integral at `z=1` is `−γ<0` by `Complex.digamma_one`, and its integrand `e^(−t)(1/t−1/(1−e^(−t)))` is indeed negative, since `1−e^(−t)<t`; the reversed integrand would give `+γ`.

See [61][R61], §I.2, Lemmas1.2.1–1.2.2, pp.212–215, for the archimedean term; [112], Chapter 17, for the contour at well-chosen heights; Whittaker–Watson, *A Course of Modern Analysis*, §12.3, for Gauss's integral.

*Needs:* §0.30a (`riemannZeta_logDeriv_window`, `riemannZeta_safe_height`); [ZerosOfLFunctions 1.4][R12]; [ZerosOfLFunctions 4.5][R14]; the residue theorem of the ContourIntegration contract (`TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous`); `completedRiemannZeta_one_sub`; `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `MeasureTheory.Lp.norm_fourier_eq`; `Complex.digamma`; `Complex.digamma_apply_add_nat`; `Complex.digamma_one`; `Real.eulerMascheroniConstant`.

### 1.9 Prime error terms under RH and GRH

`(i)` If RiemannHypothesis holds, then for every `ε > 0, ψ(x) − x = O_ε(x^{1/2+ε})` as `x → ∞`. (ii) Fix `q ≥ 1`. If DirichletGRH `χ` holds for every character `χ` modulo `q`, then for every `ε > 0` and every a with `gcd(a,q) = 1, ψ(x;a,q) − x/φ(q) = O_{q,ε}(x^{1/2+ε})`, where `ψ(x;a,q) = Σ_{n≤x, n≡a mod q} Λ(n)`. The hypotheses are explicit; neither conclusion is used by an unconditional target. The fixed-modulus representative signatures are `psi_sub_self_isBigO_of_riemannHypothesis` and `psiAP_isBigO_of_dirichletGRH`.

`(i)` Insert `Re ρ = 1/2` into the imported ZerosOfLFunctions 8.2–8.4 truncated formula, bound `Σ_{|γ|<T} 1/|ρ|` by `O(log² T)` using the Riemann–von Mangoldt count, and take `T = x`. (ii) Expand `ψ(x;a,q)` by orthogonality of characters modulo `q` into `φ(q)^{−1} Σ_χ χ̄(a) ψ(x,χ)`; the principal character gives `ψ(x)` up to `O(log q · log x)`, and each nonprincipal `χ` is handled by the fixed-character explicit formula from ZerosOfLFunctions 8.6, transported by the rational dictionary with its zeros on `Re s = 1/2`.

The hypothesis appears in the statement; dropping it leaves only the de la Vallée Poussin error of Layer 0. (ii) fixes `q`: the implied constant may depend on `q`, and no Bombieri–Vinogradov-type average is claimed (that is a downstream sieve roadmap’s averaged-prime estimates).

See [53][R53], §7.3, equation (7.3.1), p. 46; §10.3, equation (10.3.1), p. 61.

*Needs:* §1.6; [ZerosOfLFunctions Truncated von Mangoldt formula][R18]; [ZerosOfLFunctions Riemann–von Mangoldt zero count][R17]; §1.4; `Chebyshev.psi`; `DirichletCharacter.sum_char_inv_mul_char_eq`.

### Proof-route checks

- The half-interval contour retains multiplicities and bounded low-zero kernels; ZerosOfLFunctions Layer 8 supplies the generic rational formula/residues.
- §1.5a uses Montgomery–Vaughan's cosecant matrix, finite spectral theorem, spacing, doubling and `ε`-limit to give `6πΣn|a_n|²` for every `T≥0`. Check empty/singleton polynomials and two-term conjugation (§1.5).
- Reciprocal `ζ` on line 1 needs quantitative small-value bounds beyond Stirling; higher Gamma derivatives are local.
- §1.2a requires the exact convolution, polylogarithmic cutoffs, hyperbolic type-II bound and narrow reciprocal-`L` rectangle, including nonunit residues. The distinct coprime Möbius estimates for `q≤T^4` need prime-exclusion proofs; shifted `q≤√T` uses `U=T/q` and one extra logarithm. Long-divisor/bilinear Fourier cancellation retains positive truncation and the separate zero term, the latter from ordinary Möbius cancellation plus Abel.
- Mestre's contour needs strip growth, local counts, safe-height logarithmic derivatives, transform decay/Fourier inversion and Poitou pairing. Combine Gamma subtractions before limits; remove nonzero zero-slope constants. Both reflected tails are required, including Chenevier–Taïbi (§1.8).

### Examples

For `ψ₀(4)`, the contribution at 4 is `(log 2)/2`, whereas `ψ(4)` includes `log 2`. The residue of `−ζ′(s)/ζ(s)` at a trivial zero `−2n` is `−1`; hence the summed trivial-zero contribution is `−(1/2)log(1−x⁻²)`. Its constant term is `−ζ′(0)/ζ(0)`, whose denominator is `ζ(0)=−1/2`. In the Gamma quotient with `α=β=1` the remaining height exponent is 1/2; with `α=β=0` it is `−1/2`. For the real Weil test `F(x)=exp(−a|x|), a>1/2+c`, the difference quotient has two different one-sided limits at zero and is still admissible.

### Dependencies

Mathlib analytic orders, bounded variation, one-sided limits and integration; completed ContourIntegration via its exact boundary contracts; Layer 0 higher-genus and origin-zero adapters. ZerosOfLFunctions Layers 1, 4–8 supply the Gamma estimates, zero-free regions, the divisor, zero-count phase, rational explicit formula and PNT remainder.

## Layer 2: Hecke and Artin comparisons and quantitative number-field estimates

Identify ideal Euler series with canonical Hecke continuations (§2.3a) before taking values or derivatives. Normalize all primitive completions and deleted factors. Build the Artin theory of §2.18a on the conductors of §2.2a, compare norm-regrouped coefficients and completed normalizations, and keep Artin holomorphy as a proposition. The fixed-degree estimates require uniform arithmetic conductor bounds, not merely continuation for each fixed field.

### 2.1 Stokes on the Nielsen surfaces and the CM-point adapter

Use §2.1c's `quadratic_weyl_domains` with its real quadratic reduced periods, Γ_A, Nielsen surfaces, genus characters, oriented boundary projection with multiplicities, area `πℓ_A` and length `2logε_D`. For a Γ_A-invariant `C²` eigenfunction satisfying `ΔF=s(1−s)F`, integrable on the core and with upper truncation boundary integral tending to zero, prove `core_stokes`: the integral of `i∂_z F dz` on the intrinsic oriented boundary is `s(1−s)/2` times the area integral. Descend DifferentialGeometry's Stokes formula through finite orbifold charts, cancel identified sides with their signed multiplicities and take the cusp-exhaustion limit under these hypotheses. For Eisenstein series on `Re s=1/2`, §2.1b's `cusp_decay` and `eisenstein_core_integrable` discharge them.

On that surface, prove `core_signature`: genus zero, `ℓ_A` elliptic points of order 2, one cusp and one geodesic boundary component. Prove `core_boundary_period`: integration along the intrinsic boundary equals integration along the full oriented geodesic `C_A`, with its parametrization and arc multiplicities. Here `ε_D>1` generates the totally positive norm-one units; the full norm-one group is `{±ε_D^n : n∈ℤ}`, whose central sign acts trivially in `PSL₂`.

For negative fundamental `D`, construct the separate CM-point adapter from IntegralLattices B2/B4/B5: a primitive positive definite integral form `[a,b,c]` of discriminant `D` maps to `z_A=(−b+i√|D|)/(2a)` in the upper half-plane. Prove compatibility with the proper form/ideal-class dictionary, independence up to `PSL₂(ℤ)`, and stabilizer weight `1/ω_D`, with `ω_D=|O_Kˣ|/2`. This supplies the points used in §2.23; the form/ideal dictionary alone does not construct them. Source: [60][R60], §7 (7.1), p.970. Checks: `[1,0,1]` gives `i` and `ω₋₄=2`; `[1,1,1]` gives `(−1+i√3)/2` and `ω₋₃=3`; a proper change of form gives the same modular point and the same evaluation of an invariant function.

API: `core_stokes` supplies the eigenfunction identity under the integrability and vanishing-cusp hypotheses above, compatible with §2.1c's oriented boundary-period comparison.

**Checks.**

- For the sign convention `Δ=−y²(∂ₓ²+∂ᵧ²)`, take `F=log y` on `0≤x≤1, 1≤y≤2`. Then `i∂F dz=dz/(2y)`, its counterclockwise boundary integral is `1/2−1/4=1/4`, and `(1/2)∫ΔF dμ=1/4`. Reversing the boundary orientation reverses this value.
- The projected modular fundamental domain has area `π/3`, so replacing either core by that domain or by its unweighted projected image gives the wrong area. Identified polygon sides do not contribute to the intrinsic boundary.
- The unit `−1` has norm 1 and is not a power of `ε_D>1`; quotienting by its central action preserves the length `2logε_D`.
- A nondecaying constant term proportional to `y^s` with `Re s>1` fails the cusp and area-integrability conditions. It cannot justify the initial Eisenstein area integral on that half-plane.

See Duke–İmamoğlu–Tóth, [60][R60], §2 (2.1), (2.8)–(2.10), §3 (3.1)–(3.3) and Theorem 1, pp.951–958; §7 Lemma 2, (7.10)–(7.11), p.972. The finite-orbifold-chart descent and general-eigenfunction cusp-limit adapter to DifferentialGeometry Layer 5 are required proofs here. General manifold Stokes is consumed through its existing oriented integration interface.

*Needs:* IntegralLattices Layer B, B2/B4/B5; GlobalNumberFields Layers 2 and 11; DifferentialGeometry Layers 5 and 12; §2.1b; §2.1c; measure and differential-form integration.

### 2.1a The K-Bessel kernel

`besselK`: for `ν∈ℂ` and real `x>0`, `K_ν(x)=(1/2)∫₀^∞exp(−x(u+u⁻¹)/2)exp(ν log u)du/u`, with the real logarithm on `u>0`; `x≤0` is outside the interface.

- The integral converges absolutely, locally uniformly on `ℂ×(0,∞)`, and `K_ν(x)=∫₀^∞exp(−x cosh t)cosh(νt)dt`.
- `besselK_neg`: `K_(−ν)(x)=K_ν(x)`.
- `ν↦K_ν(x)` is entire, and its `j`-th derivative inserts `(log u)^j` in the defining integral; `x↦K_ν(x)` is smooth on `(0,∞)` and satisfies `x²K″+xK′−(x²+ν²)K=0`.
- `|K_ν(x)|≤K_(Re ν)(x)`, and `K_σ(x)>0` for real `σ`.
- Decay: for `ν` in a compact set there is `C` with `|K_ν(x)|≤Cx^(−1/2)e^(−x)` for `x≥1`.
- `besselK_one_half`: `K_(1/2)(x)=√(π/(2x))e^(−x)`.

Substitute `u=e^t` and pair `t` with `−t` for the cosh form; evenness in `ν` is `u↦u⁻¹`. Holomorphy and the order derivatives follow by dominated differentiation, with majorant `exp(−x(u+u⁻¹)/2)u^(|Re ν|+1)` on compact sets; the differential equation follows by differentiating under the integral and integrating by parts. For the decay use `cosh t≥1+t²/2` and `cosh(σt)≤e^(|σ|t)`, giving `K_σ(x)≤e^(−x)√(2π/x)e^(σ²/(2x))`. The half-order value is the Gaussian integral `∫₀^∞exp(−au−b/u)u^(−1/2)du=√(π/a)e^(−2√(ab))`.

**Checks.**

- `K_(1/2)(1)=√(π/2)/e`, and `K_(−1/2)(2)=K_(1/2)(2)`.
- At `x=0, ν=0` the integral diverges, so the positivity restriction cannot be dropped.

See [DLMF-Bessel], 10.25.1, 10.27.3, 10.32.9, 10.32.10 and 10.39.2.

*Needs:* Mathlib dominated differentiation of parameter integrals, `integral_gaussian` and `Complex.integral_cpow_mul_exp_neg_mul_Ioi`.

### 2.1b The level-one nonholomorphic Eisenstein series

`nonholomorphic_eisenstein`: for `z=x+iy` in the upper half-plane and `Re s>1`, `E(z,s)=Σ_(γ∈Γ_∞\PSL₂(ℤ))Im(γz)^s=(1/2)y^sΣ_(gcd(c,d)=1)|cz+d|^(−2s)`; the factor `1/2` counts `±(c,d)` once. With `Λ(s)=π^(−s/2)Γ(s/2)ζ(s)`, Mathlib's `completedRiemannZeta`, put `E*(z,s)=Λ(2s)E(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s)`, as in the Conventions.

- Convergence and automorphy: the primitive-pair series converges absolutely and locally normally on `ℍ×{Re s>1}`; `E(γz,s)=E(z,s)` for `γ∈PSL₂(ℤ)`; and `ΔE=s(1−s)E` for `Δ=−y²(∂ₓ²+∂ᵧ²)`.
- `completed_eisenstein_fourier`: `E*(z,s)=Λ(2s)y^s+Λ(2−2s)y^(1−s)+2√y Σ_(n≠0)|n|^(s−1/2)σ_(1−2s)(|n|)K_(s−1/2)(2π|n|y)e(nx)`, with `e(x)=exp(2πix)`, `σ_w(n)=Σ_(d|n)d^w` and `K` from §2.1a. The series converges absolutely and locally uniformly on `ℍ×ℂ`.
- `completed_eisenstein_continuation`: `E*(z,·)` continues meromorphically to `ℂ`, holomorphic off `{0,1}`, with simple poles at 0 and 1 of residues `−1/2` and `1/2` and `E*(z,1−s)=E*(z,s)`. The continuation is `PSL₂(ℤ)`-invariant with `ΔE*=s(1−s)E*`, and the uncompleted continuation has residue `3/π` at 1. On `Re s=1/2`, `E` means the continued value, a limit at `t=0`.
- `cusp_decay`: for `s=1/2+it`, `E(z,s)` minus its constant term `y^s+(Λ(2−2s)/Λ(2s))y^(1−s)`, and each first derivative of that difference, is `O(e^(−πy))` as `y→∞`, uniformly in `x`; the derivatives of the constant term are `O(y^(−1/2))`. Hence on a horizontal segment of fixed width at height `Y` the integral of `i∂_zE dz` tends to 0 as `Y→∞`.
- `eisenstein_core_integrable`: for `Re s=1/2`, `E(·,s)` is absolutely integrable for `dμ=y^(−2)dxdy` over every region of `ℍ` that is compact apart from finitely many cusp ends of finite width, in particular over each `F_A` of §2.1c.

For the expansion, take `Re s>1` and write `ζ(2s)E(z,s)=(1/2)y^sΣ_((c,d)≠0)|cz+d|^(−2s)`. The terms with `c=0` give `ζ(2s)y^s`. For each `c≠0` apply Mathlib's Poisson summation `Real.tsum_eq_tsum_fourier_of_rpow_decay` in `d`, with `|x+iy|^(−2s)=Γ(s)^(−1)∫₀^∞t^(s−1)e^(−t(x²+y²))dt`, the Gaussian Fourier transform and §2.1a's integral, which give the Fourier coefficients `π^sΓ(s)^(−1)2|n|^(s−1/2)y^(1/2−s)K_(s−1/2)(2π|n|y)` for `n≠0` and `√πΓ(s−1/2)Γ(s)^(−1)y^(1−2s)` for `n=0`. Sum over `c`, multiply by `π^(−s)Γ(s)`, and use `Λ(2s−1)=Λ(2−2s)`. Every term of the series is entire in `s`, and §2.1a's decay makes it converge locally uniformly in `s`, so the expansion continues `E*`. The poles come from `Λ(2s)y^s+Λ(2−2s)y^(1−s)`: `Λ` has simple poles at 0 and 1 of residues `−1` and `1`, the two poles at `s=1/2` cancel, and those at 0 and 1 have residues `−1/2` and `1/2`. The equation `s↦1−s` fixes the constant term, and on the series `σ_(−w)(n)=n^(−w)σ_w(n)` and `besselK_neg`. Invariance and the eigen-equation continue by the identity theorem, and `Λ(2)=π/6` gives the residue `3/π`. The decay statements read off the expansion with §2.1a's bound.

**Checks.**

- Along the imaginary axis `E(iy,2)/y²→1` as `y→∞`.
- Summing primitive pairs without the factor `1/2` doubles `E`; at `s=1` the primitive-pair series diverges.
- An uncompleted period of `E` cannot replace an `E*` period without dividing by `Λ(2s)`.

See [60][R60], §5, (5.2)–(5.5), pp.961–962, and the remark that `E` is integrable by (5.3), p.963; proof of Lemma 1, p.972, for the cusp decay.

*Needs:* §2.1a; Mathlib `completedRiemannZeta`, `completedRiemannZeta_one_sub`, `Real.tsum_eq_tsum_fourier_of_rpow_decay` and the Gaussian Fourier transform; `UpperHalfPlane` and the action of `PSL₂(ℤ)`.

### 2.1c Real quadratic reduced cycles, genus characters and Nielsen surfaces

`quadratic_weyl_domains`: let `K` be the real quadratic field of fundamental discriminant `D>1` and `ε_D>1` the generator of its totally positive norm-one units.

- The narrow class group `Cl⁺(K)` and the class `J` of principal ideals generated by an element of negative norm; `J` is trivial exactly when a unit of norm `−1` exists. Proper equivalence classes of primitive integral binary quadratic forms of discriminant `D` correspond to `Cl⁺(K)`.
- For each factorization `D=d′d` into fundamental discriminants, the trivial discriminant 1 allowed, the genus character `χ` of `Cl⁺(K)`, built from `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom` as in §2.10, with `χ(𝔭)=(d/N𝔭)` for every prime `𝔭` with `N𝔭` prime to `d` and `χ(𝔭)=(d′/N𝔭)` when `N𝔭` is prime to `d′`. It is well defined, multiplicative, independent of the representing ideal, and `χ(J)=sgn d=sgn d′`; the factorization `1·D` gives the trivial character.
- For `A∈Cl⁺(K)`, the reduced quadratic irrationals of `A` (`w>1>w′>0`) form one periodic minus-continued-fraction cycle, of length `ℓ_A`. The cycle determines DIT's infinite-index subgroup `Γ_A⊆PSL₂(ℤ)`, and `F_A=Γ_A\N_A` is the quotient of its Nielsen region `N_A`, the hyperbolic convex hull of its limit set. Changing the reduced representative conjugates `Γ_A` and transports the surface, its measures and boundary by an isometry.
- `F_A` is a finite-area hyperbolic orbifold of genus 0 with `ℓ_A` elliptic points of order 2, one cusp and one geodesic boundary component `∂F_A`. It decomposes into a compact core and one cusp end of finite width, `area(F_A)=πℓ_A` for `dμ=y^(−2)dxdy`, and `length(∂F_A)=2 log ε_D` for `y^(−1)|dz|`.
- The projection `F_A→PSL₂(ℤ)\ℍ` retains multiplicities. `∂F_A` maps onto the closed geodesic `C_A` joining `w′` to `w`, modulo the full norm-one unit group `{±ε_D^n}` acting through `PSL₂(ℤ)`, with its quadratic-class orientation. The area measure, the boundary arclength and the boundary orientation are compatible with Stokes' theorem on `F_A`.

The form–ideal dictionary takes an ideal with an oriented basis `(α,β)` to `N(xα−yβ)/N𝔞`; the narrow class records the orientation. Reduction theory for minus continued fractions makes the reduced irrationals of a class a single cycle, and the product of the cycle's matrices is the hyperbolic element of `PSL₂(ℤ)` given by multiplication by `ε_D` in that basis. Its eigenvalues `ε_D^(±1)` give translation length `2 log ε_D` along the axis from `w′` to `w`. The Nielsen region of `Γ_A` is a finite-sided hyperbolic polygon modulo `Γ_A`, so FuchsianOrbifolds' Gauss–Bonnet formula gives `2π(−2+1+1+ℓ_A/2)=πℓ_A` for genus 0, one cusp, one boundary geodesic and `ℓ_A` cone points of order 2. The genus character is the Kronecker symbol of `d` on norms. Multiplicativity, class invariance and `χ(J)=sgn d` reduce to quadratic reciprocity for the Kronecker symbol and to the sign of the norm of a generator of `J`.

**Checks.**

- Replacing a reduced representative by the next element of its cycle gives the same surface and the same weighted integrals, by the induced isometry.
- When `d,d′<0`, `χ(J)=−1`, distinguishing the boundary sign case from `d,d′>0`.

See [60][R60], §§2–3, pp.951–959, especially Theorem 1 and (3.1)–(3.3), pp.957–958, and §7, genus characters, p.971.

*Needs:* GlobalNumberFields Layers 2 and 11; FuchsianOrbifolds Layers 2–3 and 6; `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`; `jacobiSym.quadratic_reciprocity`; NumberFieldArithmetic units.

### 2.2 Artin analytic conductor normalization

For a finite Galois extension `L/F` and a `d`-dimensional complex representation `ρ`, define `artinAnalyticConductor` by `f_ρ=|Disc F|^d·Norm(N(ρ))>0`, using the finite Artin conductor ideal `𝔣(ρ)` of §2.2a. This adds the base-discriminant normalization required by the completed analytic function.

- `artinAnalyticConductor.pos`: `f_ρ` is positive, including dimension zero.
- `artinAnalyticConductor.directSum`: `f_(ρ⊕σ)=f_ρ f_σ`; the zero representation gives1.
- `artinAnalyticConductor.regular`: for the regular representation, `f_ρ=|Disc L|`, by transitivity of discriminants.
- `artinAnalyticConductor.linear`: over `ℚ`, a primitive character gives its positive conductor; over `F` retain `|Disc F|`.

**Checks.**

- The trivial representation has every exponent zero and conductor ideal one, including at ramified primes.
- For a tame one-dimensional ramified character, only `G₀` contributes and its exponent is one. For an unramified character it is zero.
- For `ℚ(i)/ℚ` the nontrivial quadratic character has conductor 4, not the tame guess 2; the ramification filtration must retain the wild contribution at 2.
- The regular representation of that quadratic group gives discriminant ideal (4), whereas its trivial summand alone gives (1).

- The trivial one-dimensional representation over `F` has `f=|Disc F|`, although its conductor ideal is one. For `F=ℚ(i)`, this gives4; omitting the base discriminant gives the wrong value1.
- The zero-dimensional representation has `f=1` over every `F`, rather than `|Disc F|`.

See Tsimerman, [64][R64], proof of Corollary3.3, pp.383–384, for this analytic normalization and its conductor application. The quantitative normal-closure and conductor budgets are proved in §2.31d.

*Needs:* §2.2a; the number-field discriminant tower formula; `Ideal.absNorm`.

### 2.2a Artin conductors

For a group `G` acting by ring automorphisms on a local ring `B`, with lower ramification groups `G_i=TauCeti.IsLocalRing.ramificationGroup G B i`, and a representation `ρ` of `G` on a vector space `V` over a field, `lowerArtinConductor` and `lowerSwanConductor` are the rational sums `Σ_(i≥0)(|G_i|/|G_0|)codim V^(G_i)` and `Σ_(i≥1)(|G_i|/|G_0|)codim V^(G_i)`. For a finite group acting faithfully on a discrete valuation ring, `G_i=1` for large `i`, so both sums are finite.

Let `L/F` be a finite Galois extension of number fields, `G=Gal(L/F)` and `ρ` a finite-dimensional representation of `G` on `V`, over `ℂ` or over any field of characteristic 0 or prime to the residue characteristic. For a finite place `v` of `F` and a place `w|v` of `L`, let `a_v(ρ)` and `Sw_v(ρ)` be these two sums for the decomposition group `G_w` acting on `O_(L_w)` and the restriction of `ρ` to `G_w`:

`a_v(ρ)=Σ_(i≥0)(|G_(w,i)|/|G_(w,0)|)codim V^(G_(w,i))`, `Sw_v(ρ)=Σ_(i≥1)(|G_(w,i)|/|G_(w,0)|)codim V^(G_(w,i))`.

The finite Artin conductor is the ideal `𝔣(ρ)=∏_v𝔭_v^(a_v(ρ))`.

- `lowerConductors_integral` (Artin): for a finite group acting faithfully on a complete discrete valuation ring with perfect residue field, both sums are natural numbers.
- `a_v=codim V^(G_(w,0))+Sw_v`. Both are independent of `w|v` and of the isomorphism class of `ρ`, additive on direct sums and unchanged under duals and unramified twists. `a_v(ρ)=0` exactly when inertia acts trivially, and both vanish for `V=0`.
- Inflation from `Gal(L/F)` to `Gal(L′/F)` for Galois `L′⊇L` preserves `a_v`.
- For a character `χ` of `G`, `a_v(χ)` is the conductor exponent `characterConductorExp` of `χ∘Art_(F_v)` and Tau Ceti's `TauCeti.LocalFieldsRamification.artinConductorExponent`. Globally `𝔣(χ)` is the finite conductor of the primitive Hecke character attached by global reciprocity.
- Induction: for `F⊆M⊆L`, `H=Gal(L/M)` and a representation `σ` of `H`, `𝔣_F(Ind_H^Gσ)=𝔡_(M/F)^(dim σ)·Nm_(M/F)𝔣_M(σ)`, with `𝔡_(M/F)` the relative discriminant. Locally, `a_v(Ind σ)=Σ_(u|v)(v(𝔡_(M_u/F_v))dim σ+f(u/v)a_u(σ))`.
- Conductor–discriminant: `𝔡_(L/F)=∏_ρ𝔣(ρ)^(dim ρ)` over the irreducible `ρ`, and `a_v` of the regular representation is `v(𝔡_(L/F))`.

Write `a_v(ρ)=⟨χ_ρ,a_(G_w)⟩` with the Artin character `a_(G_w)`. Herbrand's quotient compatibility of the upper numbering gives inflation invariance. Restriction of the Artin character to a subgroup `H` gives `a_H` plus a multiple of the regular character of `H` by the different exponent, which yields the induction formula. On a cyclic subgroup the pairing with a character is that character's conductor, an integer by Hasse–Arf. By Brauer's characterization of virtual characters, `a_(G_w)` is therefore a virtual character, so `a_v(ρ)` is an integer, and nonnegative by its definition. For coefficients of positive characteristic prime to the residue characteristic, the wild group is a `p`-group of order invertible in the coefficients: decompose `V` under it into isotypic parts permuted by `G_0`, lift each simple constituent to characteristic 0 with the same invariant dimensions, extend it to its stabilizer in `G_0` (cyclic modulo the wild group), and apply the characteristic-0 case to the induced representations. For characters, local reciprocity carries `U_v^n` onto the upper ramification group `G^n`. The induction formula with `σ` trivial and `Ind 1=⊕ρ^(dim ρ)` gives the conductor–discriminant formula.

**Checks.**

- The trivial representation and `V=0` have conductor ideal 1; an unramified character has exponent 0 and a tame ramified character exponent 1.
- For `ℚ(i)/ℚ` the nontrivial character has `a_2=2`, the two terms `i=0,1` each contributing 1; keeping only the tame term gives the wrong conductor 2.
- Over `ℚ_2`, `χ_8` has `a=3`, while the term `i=0` alone gives 1.

See [115], Chapter VI §§1–3 and Chapter XV §2; [98], Chapter VII §11.

*Needs:* LocalFieldsRamification (lower and upper numbering, Herbrand functions, Hasse–Arf, the different); [ClassFieldTheory 7][R29], `characterConductorExp`; [ClassFieldTheory 11][R27]; [ClassFieldTheory 13][R28]; [RepresentationTheory/InductionRestriction 3][R31] and [6][R30], Mackey and Brauer's characterization; [NumberFieldArithmetic 2][R24].

### 2.3 Hecke ideal-series comparison

Let `K` be a number field, `c` a unitary idele-class character unramified outside a finite set `S` containing every archimedean place, and `χ` its ideal-character presentation from GlobalNumberFields Layer 9. On `Re s>1`, identify the norm-regrouped ideal series with the finite-Euler-deleted canonical Hecke function:

`L_S(s,χ)=Σ_(𝔞 integral, prime to S)χ(𝔞)N(𝔞)^(−s)=∏_(v∉S)(1−χ(v)N(v)^(−s))⁻¹`.

Use GlobalNumberFields' local/ideal character dictionary and ArithmeticDirichletSeries Layer 3's absolutely convergent ideal Euler products. The all-unitary canonical Hecke function is §2.3a. For finite-order characters the primitive function and deleted-factor formula (`eulerCorrection`) come from [LFunctions Layer 5][R57].

**Checks.**

- For `K=ℚ` and trivial `c`, deleting a finite prime `p` gives `(1−p^(−s))ζ(s)`.
- Increasing a presentation exponent at an already deleted prime introduces no second factor.
- At a prime outside `S`, the ideal coefficient of its first power is `χ(v)`, without inverse or conjugation.

Source: [ArithmeticDirichletSeries Layer 3][R2]; [LFunctions Layer 5][R57], primitive versus presented functions.

*Needs:* §2.3a; [GlobalNumberFields 9][R19]; [ArithmeticDirichletSeries 3][R2].

### 2.3a Hecke continuation and functional equation

`heckeContinuation`: let `K` be a number field and `ω` a continuous unitary idele-class character, Tau Ceti's `HeckeCharacter K` of absolute value 1. Put `A=|D_K|N𝔣(ω)` (`heckeConductorScale`). Let `L_v(s,ω_v)=(1−ω_v(ϖ_v)Nv^(−s))⁻¹` at finite places where `ω` is unramified and 1 at ramified ones (`heckeFiniteFactor`). Let the archimedean factor be `Γ_ℝ(s+it_w+ε_w)` at a real place where `ω_w(x)=sgn(x)^(ε_w)|x|^(it_w)`, and `Γ_ℂ(s+it_w+|k_w|/2)` at a complex place where `ω_w(z)=(z/|z|)^(k_w)|z|_ℂ^(it_w)` (`heckeArchFactor`). Then `Λ_H(ω,s)=A^(s/2)L_∞(s,ω)∏_vL_v(s,ω_v)` converges absolutely on `Re s>1`, continues meromorphically to `ℂ`, and satisfies

`Λ_H(ω,s)=W(ω)Λ_H(ω⁻¹,1−s)`, `|W(ω)|=1`,

as an identity of meromorphic germs.

- `Λ_H(ω,·)` is entire unless `ω=|·|^(it)` for a real `t`; then its only poles are simple, at `−it` and `1−it`, `Λ_H(|·|^(it),s)=|D_K|^(−it/2)Λ_H(1,s+it)` and `W(|·|^(it))=|D_K|^(−it)`.
- The unbalanced completion `Λ(s,ω)=A^(−s/2)Λ_H(ω,s)=L_∞(s,ω)∏_vL_v(s,ω_v)` satisfies `Λ(s,ω)=W(ω)A^(1/2−s)Λ(1−s,ω⁻¹)`.
- Complex norm twists translate: `Λ_H(ω|·|^u,s)=A^(−u/2)Λ_H(ω,s+u)`.
- On `Re s>1` the Euler product is the ideal series `Σ_𝔞χ(𝔞)N𝔞^(−s)` of the ideal character `χ` of `ω` over ideals prime to `𝔣(ω)`, with `χ(𝔭_v)=ω_v(ϖ_v)`.
- For finite-order `ω`, `Λ_H` is the primitive completion of [LFunctions Layer 5][R57], with the same root number. For an algebraic type-`A₀` character `χ₀` of primitive conductor `𝔣₀`, written `χ₀=χ₀,u|·|^σ` with `χ₀,u` unitary and `σ` LFunctions Layer 6's ideal-side shift, and for `t∈ℂ`, LFunctions' balanced completion of `χ₀` at `s+t` is `Λ_H(χ₀,u,s+t−σ)`, with the same root number and polar divisor transported by `s↦s+t−σ`. The conductor power uses the primitive conductor `A=|D_K|N𝔣₀`, never a presentation modulus; an imprimitive presentation at `𝔪` multiplies the finite series by LFunctions Layer 5's `eulerCorrection` at the primes dividing `𝔪` and not `𝔣₀`.
- Any continuation agreeing with the full Euler product and archimedean factors on `Re s>1` is this one, including its principal parts.
- `W(ω)` is the normalized Gauss sum of the finite part of `ω` times the archimedean signs.

The proof is Hecke's theta method for continuous infinity types. For each class of the ray class group modulo `𝔣(ω)` and integral ideal `𝔞` in it, form the theta series over `𝔞` on the mixed space `K⊗ℝ=ℝ^(r₁)×ℂ^(r₂)`. Its weight is the Gaussian times `x_w^(ε_w)` at real and `z_w^(|k_w|)` or its conjugate at complex places, twisted by the finite part of `ω`. Poisson summation on the lattice (LFunctions Layer 1) and the Fourier self-duality of these weighted Gaussians give its inversion formula. The Gauss sum of the finite part appears there. Mellin transform the theta series over the torus `(ℝ_(>0))^(r₁+r₂)` modulo the totally positive units, where `|y_w|^(it_w)` enters as a shift of the Mellin variable. Dirichlet's unit theorem makes the unit quotient compact, and the split at `|y|=1` gives the continuation and the reflected equation. The norm-power case leaves the two poles of the trivial character, translated by `it`. Algebraic characters reduce to LFunctions Layer 6 by uniqueness of continuation.

**Checks.**

- For `K=ℚ` and `ω=1`, `Λ_H` is `completedRiemannZeta`, with residues `−1,+1` at `0,1` and `W=1`.
- For the odd quadratic character of conductor 4 over `ℚ`, `W=1`, and the conductor power `4^(s/2)` makes the equation symmetric.
- For `ω` nontrivial on the norm-one idele classes the completion is entire; nontriviality on the whole idele class group does not exclude a norm character.
- Over `ℚ(√2)` with `ε=1+√2` and `r=π/log ε`, the character with infinity component `|x₁/x₂|^(ir)` and ideal value `|α₁/α₂|^(−ir)` on `(α)` is well defined because `ε^(2ir)=1`. Its real gamma shifts are `ir` and `−ir`, and it is neither a norm character nor an algebraic character times a norm power, so only this target, not LFunctions Layer 6, continues it.

See [98], Chapter VII §§6–8, especially (8.5); [53][R53], §§22.1–22.2 for the Euler product.

*Needs:* [LFunctions Layers 1, 5 and 6][R9]; [GlobalNumberFields 9][R19] and [10][R20]; [ArithmeticDirichletSeries 3][R2]; Mathlib Dirichlet unit theorem, `Complex.Gammaℝ`, `Complex.Gammaℂ` and Mellin transforms.

### 2.4 Hecke boundary adapter for Landau positivity

For the canonical ray-character product, transport [LFunctions Layer 7][R9]’s meromorphic boundary orders to the norm-regrouped presentation. Regular boundary points have order 0 and the product’s order at 1 is −1. The supplier owns the finite-character orthogonality and Landau nonvanishing argument.

Use nonnegative real coefficients, norm-regrouped from ideals, and a meromorphic product near `Re s≥1` with no poles except at most a simple pole at 1.

Checks: the principal factor has a simple pole at 1; every other ray character, including a quadratic one, has order 0 there; common finite Euler deletions are nonzero on the boundary and scale the leading coefficient without changing the order.

See [53][R53], §3.3, Lemma 3.6 and Exercise 3.6.1, pp. 19 and 21.

*Needs:* [LFunctions Layer 7][R9]; [ArithmeticDirichletSeries 8][R3].

### 2.5 Dedekind continuation and real-side comparison

The trivial-character Dedekind continuation supplied by LFunctions Layer 5 agrees with `NumberField.dedekindZeta K` on `Re s>1`. Its complex residue at 1 equals `NumberField.dedekindZeta_residue K`, by agreement with the real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized `LSeries` everywhere.

Import the trivial-character continuation from LFunctions Layer 5 and use the ideal Euler-product comparison on `Re s>1`. Multiply the continued function by `s−1` and remove the simple singularity. Take its real right-hand limit using the Dedekind residue theorem; uniqueness of the continuous extension identifies the complex residue.

No evaluation of the totalized `LSeries` at `−2` is used. For `Q(i)`, the positive residue expression is `π/4`. The completed functional equation and trivial zeros are separate declarations.

Source: [LFunctions Layer 5][R57], trivial-character continuation and completion; Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` for the real residue.

*Needs:* [LFunctions Layer 5][R57]; `NumberField.dedekindZeta`; `NumberField.dedekindZeta_residue`; `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; `Complex.Gammaℝ`; `Complex.Gammaℂ`.

### 2.6 Sufficient conductor-discriminant estimate

Fix `g≥1`. Let `E` be any degree2g CM field, `L` its normal closure over `Q` (not an arbitrary Galois overfield), `G=Gal(L/Q)`, and `c` the central complex conjugation. Let `F(E)` be the finite set of isomorphism classes of nontrivial irreducible complex `G`-representations `ρ` satisfying `ρ(c)=−Id`. Then `|G|≤M_g=(2g)!, |F(E)|≤M_g` and `dim ρ≤M_g`. All constants below are uniform in `E` and `ρ∈F(E)`. The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value `≤B_g`; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor `f_ρ`, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. There exists `C_g>0` such that `log f_ρ≤C_g(1+log D_E)`.

Use §2.2a's integral conductor–discriminant comparison and lower filtration. Combine the finite-group dimension bound, `D_L≤D_E^A_g` and the normal-closure/different budget `f_ρ≤D_L^(2dimρ/|G|)`. The resulting degree-dependent power suffices; `f_ρ≤D_E` is unnecessary.

See [64][R64], Theorem 3.2 and proof of Corollary 3.3, pp.383–384.

*Needs:* [NumberFieldArithmetic 7][R26]; §2.2a; `Representation.IsIrreducible`; `NumberField.IsCMField.complexConj`; §2.31d.

### 2.7 Quadratic zeta factorization and the residue quotient

For a quadratic extension `E/F` of number fields with its canonical nontrivial finite-order Hecke character `η`, the primitive quadratic ray character of conductor `D_(E/F)`, `ζ_E(s)=ζ_F(s)L_f(s,η)` on `Re s>1`, including every ramified Euler factor.

Route: §2.18a's ramified induction formula with `L=E`, `H=1` and `σ` trivial gives, at each prime `p` of `F`, `P_(p,Ind 1)(T)=∏_(q|p)(1−T^(f(q/p)))`, and `Ind_1^(Gal(E/F))1=1⊕η_Artin` splits it as `(1−T)P_(p,η_Artin)(T)`: a split `p` gives `(1−T)²`, an inert `p` gives `1−T²=(1−T)(1+T)`, and a ramified `p` gives `1−T`, with `η_Artin` inertia-nontrivial there so that `P_(p,η_Artin)=1`. The one-dimensional Artin–Hecke comparison of §2.18a and ClassFieldTheory Layer 11 identify `L_F(s,η_Artin)` with `L_f(s,η)` factor by factor, the conductor `D_(E/F)` coming from ClassFieldTheory Layer 13, so `η(p)=0` exactly at the ramified primes. Extend the identity to the canonical continuations; the residue quotient `κ_E/κ_F=L(1,η)` is a separate result.

Checks: `F=ℚ` recovers ImaginaryQuadraticClassNumber H2.2's `ζ_K=ζ·L(s,χ_D)` and LFunctions Layer 4's `dedekindZetaC_quadratic`; for `E=ℚ(i)`, `p=2` is ramified with one prime above it of residue degree 1, so both sides have the factor `1−T` and `χ₋₄(2)=0`; `p=5` splits and gives `(1−T)²`; `p=3` is inert and gives `1−T²`.

See Neukirch [98], Chapter VII §10, Definition (10.1) with its inertia-invariant local factors and the corollary expressing `ζ_L` as the product of the Artin `L`-series `L(L|K,χ,s)^(χ(1))` over the irreducible characters, specialized to a quadratic extension.

*Needs:* §2.18a; [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27]; [ClassFieldTheory 13][R28].

### 2.8 Partial ideal zeta series

The coefficient partition gives the ordinary and narrow analytic class sums on `Re s>1`.

For a number field `K`, choose its ordinary or narrow ideal class group, and a class A. Write `ζ_A` for [LFunctions Layer 2][R9]’s partial ray-class zeta series transported through the class equivalence at trivial finite modulus, with empty infinity part for ordinary classes and all real places for narrow classes. Its coefficient `a_A` is the supplier's `normCoeff` of the class indicator. Prove the adapter formula counting nonzero integral ideals of norm `n` in A, with `a_A(0)=0`. Quadratic period applications use narrow classes for real quadratic `K` and ordinary classes for imaginary quadratic `K`. Index ideals, not their generators. The finite class sum agrees with `NumberField.dedekindZeta` as an `LSeries`: the latter may have a different zeroth coefficient, which `LSeries` ignores. Use `TauCeti.normCoeff` of the ordinary-class indicator, with its cardinality expression. The analytic function and its continuation are the supplier's throughout.

Identify the supplier's ray classes with `ClassGroup` or `NumberField.NarrowClassGroup` at these two moduli, and transport its indicator before applying `normCoeff`, fixing coefficient 0. Convergence and class sums are consumed from LFunctions Layer 2; the class-character identity is the specialization of Layer 5 in §2.12. The local extension is quadratic conjugation and the subsequent period-normalization comparisons. Quadratic conjugation preserves norms and inverts narrow classes, hence ordinary classes through the quotient. The general conjugation identity assumes class inversion; the canonical quadratic specialization proves it.

- `partial_ideal_zeta.coeff`: `a_A(n)` is the finite cardinality of integral ideals of positive `norm n` in `A; a_A(0)=0`.
- `partial_ideal_zeta.sum_classes`: The sum of `ζ_A` over all ideal classes is the Dedekind series on `Re s>1`.
- `partial_ideal_zeta.character_sum`: For a class character `χ, Σ_A χ(A)ζ_A(s)` is its ideal-character `LSeries` on `Re s>1`.
- `partial_ideal_zeta.conjugation`: For a ring-of-integers automorphism `τ` whose induced map on the selected class group is inversion, norm preservation gives `ζ_A(s)=ζ_(A⁻¹)(s)` on `Re s>1`. The quadratic specialization uses the canonical quadratic conjugation; its narrow-class inversion is already available.

**Checks.**

- For `K=Q`, the unique partial series equals the Riemann series on `Re s>1`.
- `a_A(1)=1` for the principal class and 0 otherwise.
- The unit ideal contributes once, even when the unit group is infinite.
- The zero ideal contributes to no coefficient; no norm-zero negative power occurs.
- A nontrivial finite ray modulus instead gives the Dedekind series with its bad Euler factors deleted; it is outside the ordinary/narrow trivial-finite-modulus specialization.

The `ℚ` test is in the domain of this general coefficient definition; a real/imaginary quadratic restriction applies only to the subsequent period identities. Class-sum coefficient agreement is required for `n≥1`; do not infer equality of the zeroth coefficients from equality of `LSeries`.

See [60][R60], §7, p970.

*Needs:* [LFunctions Layer 2][R9]; `NumberField.dedekindZeta`; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 5][R7]; [GlobalNumberFields 2][R21]; `TauCeti.IdealArithmeticFunction`; `TauCeti.normCoeff`; `ClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv`.

### 2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals)

`primeIdeal_lower_thirtyfive_nineteen`: assume `ZamanDigammaInput` of §2.9a. For each fixed degree `n` there is a positive effective `c_n` and an absolute effective `D₀` such that `π_k(Y)≥c_n D_k^(−19)Y/log Y` whenever `[k:Q]=n, D_k≥D₀` and `Y≥D_k^35`.

Fix `n=[k:ℚ]≥1`; `D_k` is the absolute discriminant; one absolute effective threshold `D₀≥2` and an effective `c_n>0` precede all `k,Y; Y≥D_k^35`.; `π_k` counts nonzero prime ideals of `norm≤Y`. The `caseD_k=1` is outside the discriminant threshold, not a counterexample.

Use the §2.9a below, including the exponent 35 in place of the printed 40 and the integer-rounding margin. Retain the absolute discriminant threshold and `Y≥D^35`.

See [66][R66], Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19; [66][R66], §4, Lemma4.4 and ensuing discussion, p.22; [67][R67], Theorem1.3.1, pp.11–12; conventions §1.5 p.26; selected §7.2.1 pp.159–160 and §7.2.4 pp.166–169.

*Needs:* [ArithmeticDirichletSeries 4][R8].

**§2.9a The exact 35/19 prime-ideal adapter.** The primary source is [67][R67], Theorem1.3.1, pp.11–12, with proof §7.2, pp.159–169. Its Lemma7.2.3, pp.159–160, still prints 40 in both its premise and conclusion. The proof of that lemma uses no inequality specific to 40: it converts any verified range `B≥B₀` into `x≥D_L^(B₀)`. Under `ZamanDigammaInput` below, the following contract makes the substitution `B₀=35` explicit and also leaves room for the rounding of `ℓ` in the final case.

Put `ℒ=log D_L` and `x=exp(Bℒ)`. For `ℓ≥2,A>0,B>2ℓA` let `f` be the translate of the convolution of `2ℓ` probability densities `A^(−1)1_[−A/2,A/2]`, supported on `[B−2ℓA,B]`, with `0≤f≤A^(−1)`. Its Laplace transform is
`F(z)=exp(−(B−2ℓA)z)((1−exp(−Az))/(Az))^(2ℓ), F(0)=1.`
Use removable values at `z=0`. Define `S=Σ_𝔭 (log N𝔭)/(N𝔭) f(log N𝔭/ℒ)`, over unramified degree-one primes of `F` with Frobenius in `C`, and `T=|G|S/(|C|ℒ)`. Lemmas7.1.1–7.1.5, pp.153–158, give
`π_C(x)≥A exp(−2ℓAℒ)S x/log x`.
The error from ramification, prime powers and higher-degree primes in the weighted explicit formula is `O(A^(−1)ℒ² exp(−(B−2ℓA)ℒ/2))` after normalizing by `|G|/|C|`. This uses `log` of the relative discriminant, the at-most-`[F:Q]` primes over a rational prime, and Minkowski `[L:Q]≪ℒ`, with absolute constants.

The local analytic contracts, taken in this order, are:

- `dedekind_weighted_zero_formula`: Lemma7.2.4, pp.160–161, writes `|T−1|≤Σ_(|Imρ|<T*)|F((1−ρ)ℒ)|` plus the four errors in `(7.9): O(ℒ(2/(AT*ℒ))^(2ℓ)+ℒ² A^(−1)e^(−(B−2ℓA)ℒ/2)+ℒ(Aℒ)^(−2ℓ)e^(−(B−2ℓA)ℒ)+ℒ(2/(Aℒ))^(2ℓ)e^(−3(B−2ℓA)ℒ/2))`. Zeros retain multiplicities. Deuring's cyclic reduction makes every continued factor a Hecke function; shift to `Re s=−1/2` at zero-avoiding heights, use the Gamma logarithmic derivative there and sum the unit-height zero counts. Thus this does not assume Artin holomorphy.
- `dedekind_weighted_zero_partition`: Lemma7.2.5, pp.161–163, for `2≤R_j≤ℒ` individually and `0=T₀<T₁≤…≤T_J=T*`, removes the zeros outside `β>1−R_j/ℒ, T_(j−1)≤|γ|<T_j` with error at most a constant times `min((2/A)^(2ℓ),ℒ)e^(−(B−2ℓA)R₁)+Σ_(j≥2)ℒ(2/(AT_(j−1)ℒ))^(2ℓ)e^(−(B−2ℓA)R_j)`. Its first error uses small rectangles of side `1/ℒ`, not just an `O(ℒ)` count. The printed lemma also assumes the `R_j` increase, but its proof estimates each height band separately and never uses that assumption. The local contract omits it, as required by the decreasing `R_j` used on p.168.
- `dedekind_low_zero_weight`: Lemma7.2.6, pp.163–165, bounds `Σ′|((1−e^(−Az))/(Az))^(2ℓ)|, z=(1−ρ)ℒ`, by
`((1−e^(−Aλ))/(Aλ))^(2ℓ−2) [φ(1−e^(−2Aλ))/(A²λ)+(2Aλ−1+e^(−2Aλ))/(2A²λ²)+η]`,
where `φ=(1−1/√5)/2`, all zeros have `β<1−λ/ℒ` at `|γ|≤1`, and the restricted sum has `β≥1−R/ℒ`. The `λ=0` value is its limit `2φ/A+1+η`. Its proof uses the positive-real-part Laplace transform of `A^(−2)sinh((A−t)λ)1_[0,A]`. Piecewise smooth tests are obtained by smoothing and dominated limits. The original smooth explicit formula and its positivity hypotheses are [Kadiri–Ng][R68], Theorem3 and proof §4, pp.3,15–18; real-zero repulsion is Theorem4 and proof §5, pp.3–4,19–24. These pages supply the test conditions, rather than an appeal to an unspecified zero-density result.
- `dedekind_repulsion_table` and `dedekind_real_zero_gap`: Zaman Theorems6.1.2–6.1.3 and Corollary6.1.4, pp.139–140, with proofs §§6.2–6.3, pp.141–152. The power-sum lemma finds `1≤k≤(12+ε)M` with `Re Σ z_j^k≥ε|z₁|^k/(48+5ε)`. Its proof uses the nonnegative Fejér weights and the split `|z_j/z₁|≥1/3`. The completed logarithmic derivative controls `M` by the explicit digamma quantities (6.7), (6.25); compare the zero-gap upper bound with this power-sum lower bound. For real secondary zeros the missing translated copy halves `M`, giving `24·0.6882<16.6` and `1−β₁≫D_L^(−16.6)`. For height `T`, use the `(T,α,C)` entries of p.151, not an optimized decimal with no witness. The signature includes an effective threshold and positive `c(T)`, with `β′≤1−log(c(T)/λ₁)/(C(T)ℒ)`.

The discriminant input is unconditional: [Odlyzko][R69], Theorem 1(4), p.210 gives `log D≥r₁log60.1+2r₂log22.2−254`, since `f₁≥0`. Hence `r₁log60+2r₂log22≤log D` for sufficiently large `D`: absorb the fixed left side in bounded degree and 254 by the positive logarithmic gaps in growing degree. The harmonic maximum principle reduces pp.212–215’s estimate to positivity of its rational function on `x=1`; its positive-denominator polynomial inequality on `y²∈[0,1600]` and leading-term tail for `y≥40` are the analytic inputs. The finite input is one named hypothesis:

- `ZamanDigammaInput`: with `ψ=Γ′/Γ`, `δ(x,t)=Re ψ((x+it)/2)`, `G₁(α,t)=(δ(α+1,0)+δ(α+1,t))/2−logπ`, `G₂(α,t)=(δ(α+1,0)+δ(α+2,0)+δ(α+1,t)+δ(α+2,t))/4−logπ`, `W₁(α)=Σ_(k≥0)(α+1+2k)^−2`, `W₂(α)=Σ_(k≥0)(α+1+k)^−2` and `Q(α,t)=((α+1/2)²/α)[1/α+max(0,(G₁(α,t)+αW₁(α))/(αlog60),(G₂(α,t)+αW₂(α)/2)/(αlog22))]`, one has `Q(α,T)<C/24` at the eleven triples `(T,α,C)=(1,3.50,31.4)`, `(3.5,3.77,32.7)`, `(8.7,5.39,35)`, `(22,7.30,38.4)`, `(54,8.92,42)`, `(134,10.17,45.9)`, `(332,11.21,49.7)`, `(825,12.26,53.6)`, `(2048,13.22,57.4)`, `(5089,14.17,61.2)`, `(12646,15.23,65)`, and `((α+1)²/(2α))[1/α+max(0,G₁(α,0)/(αlog60),G₂(α,0)/(αlog22))]<0.6882` at `α=5.8`. Source: [67][R67], (6.7), (6.25), (6.29) and the `(T,α,C)` entries of p.151, pp.145, 151–152.

The positive slack in each strict inequality absorbs the additive terms in (6.25) and the power-sum ε after an effective discriminant threshold. Every numerical repulsion, real-zero-gap and 35/19 counting conclusion in §§2.9–2.9a carries `ZamanDigammaInput`.

Here is the final range deduction, using those contracts. Let `ρ₁` have maximal real part among `|γ|≤1` and `λ₁=(1−Reρ₁)ℒ`. The one-zero region is [Kadiri][R70], Theorem1.1(1.8), p.3, proof §§2–3: `λ₁<0.0784` implies a simple real zero. For each `B≥35` choose parameters as follows.

| Range | `(ℓ,A)`, zero estimates and resulting bound |
| --- | --- |
| `λ₁≥0.0784` | `(2,1.5); B−2ℓA≥29`, hence also `≥1.41`. The low-zero bound at `λ=0.0784` is `<1.1166`, and `e^(−1.41·0.0784)1.1166<1`. Choose the partition cutoff `R` large and errors small; `T≫1`. |
| `η≤λ₁<0.0784` | `(2,0.1)`; retain the weaker `B−2ℓA≥2.23`. Kadiri–Ng gives `λ′≥0.6546log(1/λ₁)`. The normalized lower bound is `1−e^(−2.23λ₁)−6.5279λ₁^(1.4597)−ε≥0.0097λ₁−ε`. Choose `ε≤10^(−6)η`. |
| `ℒ^(−200)≤λ₁<η` | `(101,1/404)`, with `B−2ℓA≥34.5` and in particular `≥31.5`. Repulsion at `T*=1` and `C=31.4` empties the remaining zero sum. The error is `O(ℒ^(−201)+λ₁^(31.5/31.4))`; fix `η` small after its constants. Thus `T≫λ₁`. |
| `0<λ₁<ℒ^(−200)` | `(⌈ℒ⌉,0.88/ℒ)`. For `ℒ≥176, B−2ℓA≥33.23` and `ℓA≤1`. Use the ten bands below; remove `β₁` and `1−β₁` explicitly. Their reflected term is `O(e^(−33ℒ))`. The errors are `o(λ₁)`, giving `T≫λ₁`. |

The ten `(T_j,C_j)` pairs are `(3.5,32.7)`,`(8.7,35)`,`(22,38.4)`,`(54,42)`,`(134,45.9)`,`(332,49.7)`,`(825,53.6)`,`(2048,57.4)`,`(5089,61.2)`,`(12646,65)`. Put `R_j=log(c_j/λ₁)/C_j`. These cutoffs need not increase; use the bandwise partition contract just stated. The real-zero gap gives `R_j≤ℒ` and `λ₁→0` gives `R_j≥2` after one absolute threshold. In the last row the partition errors are
`O(ℒλ₁^(33.23/32.7)+Σ_(j=2)^10 ℒe^[2log(2/(0.88T_(j−1)))ℒ]λ₁^(33.23/C_j)+ℒ³e^(−16.615ℒ)).`
Here `33.23/32.7−1/200>1.011` and, for all nine `j, 2log(2/(0.88T_(j−1)))+16.6(1−33.23/C_j)<−0.02`. Combine `λ₁≫ℒe^(−16.6ℒ)` with `λ₁<ℒ^(−200)` to obtain `o(λ₁)`. The rounding margin 33.23 replaces the literal p.168 inequality `35−2⌈ℒ⌉·0.88/ℒ≥33.24`, which is not valid for noninteger `ℒ`. All inequalities needed by p.169 survive this weakening.

Finally `T≫1` with `A≥0.01,ℓA≤3` gives `π_C(x)≫D_L^(−6)(|C|/|G|)x/log x`. In the other case `T≫λ₁` with `A≫1/ℒ,ℓA≤1` gives `π_C(x)≫D_L^(−2)λ₁(|C|/|G|)x/log x≫D_L^(−19)(|C|/|G|)x/log x`. All thresholds are absolute and effective, fixed before `L,F,C,B`. This is Lemma7.2.3's proof with `B≥35`; the printed constant 40 is not used. Apply `L=F=k` and `C={1}`; counting all prime ideals only increases this degree-one lower count. This gives the deduction of §2.9 under `ZamanDigammaInput`.

Required final interfaces are `zaman_weight_to_prime_count`, `zaman_weight_positive_ge_thirtyfive`, and `primeIdeal_lower_thirtyfive_nineteen` with the displayed quantifier order. These are arithmetic/analytic adapters owned here.

**Checks.**

- `D=1` is outside the absolute threshold; `log D` is never divided by in that case.
- At `B=35` all four parameter rows remain valid. Replacing the final row's ceil by an exact real parameter would invalidate its integer convolution definition.
- The secondary zero `1−β₁` is retained even when other zeros are repelled; symmetry alone does not eliminate it.
- A least-prime existence theorem does not imply this counting lower bound; the explicit weight-to-count inequality supplies the multiplicity of primes.

### 2.10 Imaginary quadratic genus-character classification

For an imaginary quadratic field `K` of fundamental discriminant `D<0`, genus characters are homomorphisms `Cl_K→{±1}`, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations `{D₁,D₂}, D=D₁D₂`, one positive and one negative; permit the trivial discriminant1 with `ε_1=1`. For an integral ideal a prime to `D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a)`. This comparison is the arithmetic classification/compatibility dictionary. The analytic equality `L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂})` is the local target §2.25, built after this classification and prime-to-`D` compatibility dictionary.

Apply genusCharFunNarrowClassGroupHom to a chosen quadratic generator, squarefree radicand, distinct prime discriminants (at most one even), their total fundamentalDiscriminant, and a subset. Under IsTotallyComplex `K` transport via toClassGroupEquiv; the equivalence creates no such instance. The quadratic arithmetic owner proves subset/complement classification onto all quadratic ordinary-class characters, identified with unordered `{D₁,D₂}`. Match prime-to-`D` ideal values to Kronecker characters, `ε₁=1`. The analytic genus-factorization theorem is separate; the two existing constructors alone prove no classification.

For `D=−4` only `{1,−4}` occurs and the genus character is trivial. The prime-to-`D` condition is essential: extending a Dirichlet character by0 at ramified primes cannot define `a{±1}`-valued class character there.

See [71][R71], ChapterIV introduction after(0.3), p.268.

*Needs:* `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`; `NumberField.NarrowClassGroup.toClassGroupEquiv`.

### 2.11 Primitive Hecke functional-equation comparison

For a primitive finite-order Hecke character `χ` with finite conductor `f` and the imported archimedean parity data, the canonical continued `L`-function, multiplied by the conductor/discriminant and the real/complex gamma factors of §2.3a, satisfies `Λ(s,χ)=ε(χ)Λ(1−s,χ̄)` as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

Assume `K` a number field; `𝔪` a modulus (an integral ideal times a set of real places); `χ` a character of the ray class group `Cl_𝔪(K)` (finite order), identified with a finite-order idele-class character `ω_χ` by GlobalNumberFields Layer `9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s}` for `Re s > 1`.; `χ` primitive of conductor `𝔣` for the functional equation.

Consume LFunctions Layer 5’s finite-order Hecke functional equation. Compare its conductor-balanced completion with the ideal series of §2.3 and the local factors of §2.3a. The comparison retains the base discriminant, primitive conductor, archimedean parities and root-number orientation.

For `K = ℚ` and a primitive Dirichlet character `χ` of positive conductor `N`, distinguish the conductor-completed meromorphic function `Λ(s,χ)=N^(s/2)·DirichletCharacter.completedLFunction χ s` from Mathlib’s `completedLFunction`, which omits that conductor power. Mathlib states `completedLFunction χ (1−s)=N^(s−1/2)·rootNumber χ·completedLFunction χ⁻¹ s`. Multiplying by `N^((1−s)/2)` gives `Λ(1−s,χ)=rootNumber χ·Λ(s,χ⁻¹)`; compare orientations before identifying `ε(χ)`. At poles use meromorphic identities, not a product of totalized point values. Check that an imprimitive character's `L`-function acquires zeros on `Re s = 0` from the removed Euler factors, which is why the functional equation is stated only for the primitive function.

Source: [LFunctions Layer 5][R57], primitive completed equation and finite-order normalization.

*Needs:* §2.3a; §2.3; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

### 2.12 Ideal-character Hecke `L`-function

For a finite narrow-class character `χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1`, and `L=Σ_Aχ(A)ζ_A`. The Euler product retains `χ(p)`; use the corrected one.

Specialize [LFunctions Layer 5][R9]'s Hecke series at trivial finite modulus and all real places. Its finite class decomposition is `L=Σ_Aχ(A)ζ_A` for the supplied partial functions of §2.8, and ADS Euler products retain `χ(p)` in every local factor.

See [60][R60], §7, p970.

*Needs:* [LFunctions Layers 2 and 5][R9]; §2.8; §2.3.

### 2.13 Siegel lower bound for real quadratic class number times regulator

For each `ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε)` for fundamental `D>1`, with an effective `c_ε>0` and the narrow regulator convention of the quadratic regulator dictionary; indeed `h⁺(D)log ε_D≥c√D/log D` with an effective absolute `c`. This effective form is stronger than Siegel's ineffective bound and is the one stated.

Import the narrow/ordinary class-number and norm-minus-one unit dichotomy. Apply the effective bound `L(1,χ_D)≥c/log D` of §0.9 and the positive real-quadratic residue formula with the specified fundamental unit. The imaginary quadratic companion `h(D)≥c_ε|D|^(1/2−ε)` is ImaginaryQuadraticClassNumber H2.4's `imaginary_classNumber_lower_bound` and is not restated.

The nontrivial real quadratic field has fundamental discriminant `D>1`; its fundamental unit and narrow regulator retain the DIT convention.

See [60][R60], §6, pp967–968.

*Needs:* §0.9; §2.5.

### 2.15 Explicit residue bound for Dedekind zeta functions (Louboutin)

The native residue signature is `dedekindZeta_residue_le`.

For each number field `K` of degree `d>1` and absolute discriminant `D_K`, the residue `κ_K` of the continued Dedekind zeta function satisfies `κ_K≤(e log D_K/(2(d−1)))^(d−1)`.

The original proof is the positive Mellin comparison below. Optimize its parameter at `s=1+2(d−1)/log D_K`; its Gamma-factor endpoint inequalities retain the constant `e/2`. Keep `d>1` and the exact degree-dependent exponent; this upper bound alone does not prove a lower bound.

See [72][R72], Theorem1(1), p.1195; proof §6.1, pp.1214–1215, using Theorem21, pp.1209–1210 and Lemmas24–26, pp.1212–1214.

*Needs:* §2.5; §2.15a.

**§2.15a Positive Mellin comparison with the sharp residue constant.** Write `d=r₁+2r₂>1, A=√D_K/(2^r₂π^(d/2)), Γ_K(s)=Γ(s/2)^r₁Γ(s)^r₂` and `F_K(s)=A^sΓ_K(s)ζ_K(s)`. If `λ=AΓ_K(1)κ_K`, the Mellin functional equation split at1 gives
`F_K(s)=λ/[s(s−1)]+∫₁^∞S_K(x)(x^(s−1)+x^(−s))dx`.
Here `S_K(x)=Σ_(n≥1)a_K(n)H_K(nx/A)`, where `H_K` is the multiplicative convolution of `r₁` copies of `2exp(−x²)` and `r₂` copies of `exp(−x)`; those kernels have Mellin transforms `Γ(s/2)` and `Γ(s)`. Thus `H_K,S_K` are nonnegative, and the split formula follows by Mellin inversion, the functional equation and the two residues, with normal tail convergence. For real `s>1` it implies `λ/[s(s−1)]≤F_K(s)`. At each rational prime the map `(x_i)↦(f_ix_i)` injects the ideal norm fibre `Σf_ix_i=k` into compositions of `k` into at most `d` parts. Consequently `0≤a_K(n)≤d_d(n)`, including ramified primes, and `ζ_K(s)≤ζ(s)^d`.

The duplication formula now yields
`κ_K≤D_K^((s−1)/2)(s−1)^(1−d)g(s)`,
where `g(s)=s^(−(r₁+r₂−1))Λ(s)^dG(s)^r₂`,
`Λ(s)=s(s−1)π^(−s/2)Γ(s/2)ζ(s), G(s)=√πΓ((s+1)/2)/(sΓ(s/2))`. Both factors are positive and `log`-convex for real `s>0`. For `G` this follows directly from the positive integral `G(s)=(1/2)∫₀¹t^((s−1)/2)(1−t)^(−1/2)dt` and Hölder. For `Λ` a theta proof also supplies the step cited externally in Louboutin Lemma24: put `f(x)=Σ_(n≥1)e^(−πn²x)` and `P(x)=(4(x∂x)²+2x∂x)f(x)`. Termwise `P(x)=Σ(4π²n⁴x²−6πn²x)e^(−πn²x)>0` for `x≥1`. Theta inversion gives `P(x)=x^(−1/2)P(1/x)`, so `P` is positive everywhere and decreases exponentially at both endpoints after that change of variable. Twice integrating by parts gives `Λ(s)=∫₀^∞P(x)x^(s/2−1)dx`, first for `Re s>1` then by normal continuation. Hölder proves the stated real `log`-convexity. The cancelled endpoint is `Λ(1)=G(1)=1`.

Minkowski gives `D_K≥(d^d/d!)²(π/4)^d≥π^d/4≥exp(2(d−1)/5)`, for `d≥2`; the middle inequality follows by the consecutive-degree ratio `≥π`. Hence `s*=1+2(d−1)/log D_K≤6`. The function `log g` is convex. For all signatures except `(r₁,r₂)=(0,1)`,
`g(6)=6(2π³/189)^r₁(5π⁷/47628)^r₂≤1`,
because `r₁+r₂≥2,2π³/189<0.329,5π⁷/47628<0.318` and `6·0.329²<1`. For the imaginary quadratic signature `D_K≥3` gives `s*<3`, and `ζ(3)≤1+1/8+∫₂^∞t^(−3)dt=5/4` gives `g(3)=6ζ(3)²/π²≤75/(8π²)<1`. These strict bounds follow from Mathlib's `Real.pi_gt_d2` and `Real.pi_lt_d4`. Convexity bounds `g(s*)≤1` in both cases. Substitution gives `D_K^((s*−1)/2)=e^(d−1)`, proving exactly §2.15. No imaginary-quadratic discriminant is assumed `≥5`.

Checks: degree1 is excluded and would divide by0; the signature(0,1) uses endpoint3 rather than the false assertion `g(6)≤1; D=3` lies in that branch. The ramified prime norm-fibre injection needs no unramified hypothesis. *Needs:* §2.5 and §2.16a for the continued Dedekind functional equation; Mellin inversion and the positive-kernel split specified here; GlobalNumberFields discriminant and signature, Mathlib's Minkowski bound `NumberField.abs_discr_ge'`; native Gamma duplication and Hölder; finite compositions. This is Louboutin §6.1(1) with the `log`-convexity step made explicit, not a restatement of its application in Lipnowski–Tsimerman.

### 2.16 Imaginary quadratic completion and root number

For negative fundamental `D`, put `δ=|D|` and let `ε_D` be the canonical primitive odd Dirichlet character of `Q(√D)`, of conductor `δ`. On `Re s>1, Λ_std(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D)`. Its canonical entire continuation is `δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s)`. The new quadratic normalization assertion is that the root number is `+1` and `Λ_std(1−s,ε_D)=Λ_std(s,ε_D)`. Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.

Multiply Mathlib's nontrivial primitive `completedLFunction` by `δ^((s+1)/2)`, using `logδ` for `δ>0`. Compare `ζ_K=ζ_QLε_D` on `Re s>1` and then meromorphically. The number-field completion and Gamma duplication give `Γ_C/Γ_R=Γ_R(s+1)`, after the canonical odd-character/conductor identification. Cancel on a nonzero open half-plane to force `root+1` and continue. Neither `|root|=1` nor totalized `Γ·L` at a cancelled pole fixes this sign.

At `D=−4` the conductor is4, the character is odd and `Λ_std(0)=Λ_std(1)=1`; at `D=−3` both endpoints are `1/√3`. Mathlib’s unnormalized completed function alone has the conductor factor `δ^(s−1/2)` in its functional equation; that factor cancels only after multiplying by the specified conductor power. The completion is its canonical entire continuation. At negative odd integers, a divergent gamma factor times a vanishing `L`-value must not be assigned the naive product value0.

See [71][R71], ChapterIV§4, p.282, proof of(4.1), and§5 p.290 after(5.4).

*Needs:* `DirichletCharacter.differentiable_completedLFunction`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; §2.7; §2.5; §2.16a.

**§2.16a Dedekind completion normalization.** For a number field `K` with absolute discriminant `D_K`, real-place count `r₁` and complex-pair count `r₂`, identify LFunctions Layer 5's trivial-character completion, off its two poles, with

`Λ_K(s)=D_K^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s)`,

where `Γ_R=Complex.Gammaℝ` and `Γ_C=Complex.Gammaℂ`. Use §2.5's convergence-half-plane comparison and the identity theorem for meromorphic functions. The equation `Λ_K(1−s)=Λ_K(s)` is supplied by LFunctions Layer 5's finite-order Hecke functional equation at the trivial character (with Layer 3's Dedekind completion), including the trivial root number, rather than proved from an idele integral here.

Source: [LFunctions Layer 5][R57], trivial primitive completion and the displayed conductor/gamma normalization.

**Checks.**

- For `K=ℚ`, the expression is `Γ_R(s)ζ(s)`.
- For an imaginary quadratic field it is `D_K^(s/2)Γ_C(s)ζ_K^cont(s)`; the factor 2 in `Γ_C` is retained.
- The trivial finite conductor is the unit ideal, while the discriminant factor remains; at `s=0,1` compare meromorphic germs.

*Needs:* §2.5; [LFunctions Layer 5][R57].

### 2.17 Imaginary quadratic class-number value at one

For an imaginary quadratic field of fundamental discriminant `D<0, δ=|D|`, class number `h` and `w=2u` roots of unity, `L(1,ε_D)=πh/(u√δ)`.

Use `L(1,ε_D)=κ_K/κ_Q` with `κ_Q=1` and the continued/norm-series comparison. The residue `2^r₁(2π)^r₂R_Kh_K/(w_K√δ)`, at `r₁=0,r₂=1,R_K=1,w_K=2u`, is `πh/(u√δ)`. The regulator/embedding dictionaries and continuation adapter are required beyond the library's one-sided real residue limit.

`D=−4` gives `L(1,ε_−4)=π/4 (h=1,u=2)`. `D=−3` gives `L(1,ε_−3)=π/(3√3) (h=1,u=3)`. For `h,u>0` this value is positive; confusing roots of unity `w` with half-`units u` loses a factor2.

Derived from Mathlib `NumberField.dedekindZeta_residue_def` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`NumberTheory/NumberField/DedekindZeta.lean`), with the positive residue quotient §2.17a. Gross–Zagier [71][R71], Chapter IV §4, pp.283–284, applies quadratic special values in Rankin L-series formulas; its Propositions (4.4)–(4.5) are not the class-number formulas.

*Needs:* `B4`; `NumberField.dedekindZeta_residue`.

**§2.17a Quadratic Hecke value as residue quotient.** For a quadratic extension `E/F, L_f(1,η)=κ_E/κ_F>0`, where `κ_K` is the positive residue of the continued Dedekind function. Here `η` is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.

Multiply the continued quadratic factorization by `s−1` and take the limit at 1. Cancel the positive `κ_F` and use holomorphy of the nonprincipal Hecke factor.

See [64][R64], Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

### 2.18 Norm-regrouped Artin coefficient comparison

For a finite Galois `L/K` and finite-dimensional complex `ρ`, use §2.18a's canonical Artin function and inertia-invariant local polynomials. Construct its norm-regrouped coefficient sequence and compare its `LSeries` with that supplied Euler product on `Re s>1`. The coefficients are multiplicative, not completely multiplicative; this coefficient comparison is the extension here.

For `P(0)=1` recursively set `a₀=1, a_(n+1)=−Σ_(j=0)^nP_(j+1)a_(n−j)`, and extend by unique ideal factorization multiplicatively, not completely multiplicatively. Expanding each reciprocal polynomial into `m=dim V^I≤d` geometric factors bounds its absolute coefficients by `(1−Np^−σ)^−d`. The `d`-fold Dedekind majorant proves ideal-indexed absolute convergence in artin-absolute-convergence. ADS1 regroupByNorm and ADS3 EulerProductData identify the canonical normCoeff `LSeries` and unordered all-prime product on `Re s>1`. Trivial `ρ` recovers all Dedekind factors, including ramified primes; zero `ρ` gives1.

- `artin_euler_series.series`: The absolutely convergent Euler product equals the norm-regrouped coefficient `LSeries` on `Re s>1`.
- `artin_euler_series.deleted`: Omitting a finite bad-prime set multiplies `L_K` by exactly `∏_{p bad}P_p((Np)^−s)`. Use the native norm-regrouped coefficients and their restriction away from the deleted primes.

The coefficient construction gives native `TauCeti.EulerProductData` from polynomials `P_v(T)=∏_(i<d)(1−α_(v,i)T)` with `|α_(v,i)|≤1`. Its local power series is the formal reciprocal of `P_v`; its ideal series and norm-regrouped `LSeries` converge absolutely on `Re s>1`, and the latter is the unrestricted product of `P_v((Nv)^(−s))⁻¹`. For finite-image Artin representations, use the inertia-invariant Frobenius eigenvalues and pad to the common dimension with zeros. For unitary Hecke characters use `d=1`, with zero at a deleted prime. This coefficient construction applies to all bounded-degree unit-disc inverse-root systems, independently of a representation. Identify it with the canonical continued Artin function of §2.18a or Hecke function of §2.3a.

**Checks.**

- The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.
- The zero representation gives1: take `d=0`, so every local polynomial and its reciprocal series are 1.
- A one-dimensional character ramified at `p` contributes local factor1 there.
- For `P_v(T)=(1−T)²`, the local coefficients are `a_(v^n)=n+1`; in particular `a_(v²)=3≠a_v²=4`. The native coefficient carrier permits ordinary multiplicativity.

See [53][R53], §22.2 pp.127–128 incomplete Euler product and ramified-factor prescription.

*Needs:* §2.18a; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2].

### 2.18a Artin `L`-functions: local factors, induction and Brauer continuation

Let `ρ` be a continuous finite-image representation of `Gal(F̄/F)` on a finite-dimensional complex space `V`, `F` a number field. For a finite place `v`, a place `v̄|v` with inertia `I_v⊆D_v` and an arithmetic Frobenius lift `Φ_v` (`x↦x^(Nv)` on residue fields), put `P_v(ρ,T)=det(1−Tρ(Φ_v)|V^(I_v))` and `L_v(ρ,s)=P_v(ρ,Nv^(−s))⁻¹`. The Artin `L`-function is `L(s,ρ)=∏_vL_v(ρ,s)` on `Re s>1`.

- `P_v` is independent of the Frobenius lift, of `v̄|v` and of the isomorphism class of `ρ`, and is unchanged under inflation. It is multiplicative in direct sums. Its degree is `dim V^(I_v)` and its reciprocal roots are roots of unity. The trivial line gives `1−T` and the Dedekind factor of `ζ_F`; the zero representation and an inertia-nontrivial line give 1.
- Induction at every finite place, ramified ones included: for a finite separable `M/F` and a continuous finite-image `σ` of `Gal(F̄/M)`, `P_v(Ind σ,T)=∏_(u|v)P_u(σ,T^(f(u/v)))`, hence `L_F(s,Ind σ)=L_M(s,σ)` on `Re s>1`. In particular `L_F(s,Ind 1)=ζ_M(s)`.
- One-dimensional comparison: for a finite-order character `ψ` with primitive Hecke character `ψ̃` given by global reciprocity, `ψ̃([𝔭])=ψ(Frob_𝔭)` at unramified `𝔭`, the local factors agree at every place, both being 1 where `ψ` is ramified, so `L(s,ψ)=L(s,ψ̃)`. The conductor of `ψ̃` is the Artin conductor `𝔣(ψ)` of §2.2a, and at a real place `w` the archimedean component of `ψ̃` is the sign character exactly when `ψ` is nontrivial on the complex conjugation at `w`. At a presentation modulus `𝔪` divisible by `𝔣(ψ)`, the presented Hecke function is this one times LFunctions' `eulerCorrection` at the primes dividing `𝔪` and not `𝔣(ψ)`.
- Brauer continuation: write `χ_ρ=Σ_jn_jInd_(H_j)^Gψ_j` with integers `n_j` and linear `ψ_j` (integral Brauer induction). Then `L(s,ρ)=∏_jL(s,ψ̃_j)^(n_j)` on `Re s>1`, which continues `L(s,ρ)` meromorphically to `ℂ` independently of the expression. With `r=dim V^G=Σ_jn_jδ_j`, `δ_j=1` exactly for trivial `ψ_j`, `(s−1)^rL(s,ρ)` has a finite nonzero limit at `s=1`. For `ρ` realized over `ℚ` this limit is positive.

On a decomposition group the restriction of `Ind σ` splits along the double cosets `D_v\G/H`, one for each `u|v`. On the summand of `u` the inertia invariants form cyclic blocks of length `f(u/v)` on which `Φ_v^(f(u/v))` acts as `Φ_u`, and a block of length `f` contributes `det(1−T^fA)`. For the one-dimensional comparison, a line on which inertia acts nontrivially has zero invariants. Brauer continuation multiplies the induction identities along the expression. Each nontrivial `L(s,ψ̃_j)` is holomorphic and nonzero at 1 ([LFunctions Layers 5 and 7][R9]), each trivial one is a Dedekind zeta function with a simple pole, and Frobenius reciprocity gives `Σ_jn_jδ_j=⟨χ_ρ,1⟩`. For rational `ρ` the Euler factors are positive for real `s>1`.

**Checks.**

- For `ℚ(i)/ℚ` at 2, inertia swaps the two basis vectors of `Ind 1`; the invariants are the diagonal line and both sides of the induction identity are `(1−2^(−s))⁻¹`. The full two-dimensional space would square the factor.
- At the inert prime 3 the factor of `Ind 1` is `(1−3^(−2s))⁻¹`, the product of the factors of `ζ` and `L(s,χ₋₄)`, not `(1−3^(−s))⁻²`.
- `χ₋₄` presented at `12∞` gains the factor `1+3^(−s)` from `eulerCorrection`, while its Artin function is unchanged.

See [98], Chapter VII §10; [53][R53], §§22.1–22.4, pp.127–129.

*Needs:* §2.2a; [NumberFieldArithmetic 1][R25] and [2][R24]; [RepresentationTheory/InductionRestriction 3][R31], integral Brauer induction and Frobenius reciprocity (From RepresentationTheory); [ClassFieldTheory 11][R27]; [LFunctions Layers 5 and 7][R9]; §2.28.

### 2.19 Negative even zeros of the continuation

For a number field `K` and every integer `n≥1`, the canonical holomorphic Dedekind continuation at `−2n` has a zero of exact order `r₁+r₂`, where `r₁` and `r₂` are its real-place and complex-pair counts. In particular `ζ_K^cont(−2n)=0`, since `r₁+r₂≥1`. This evaluates the continuation, not the totalized ideal `LSeries`.

At `1+2n` the convergent positive ideal series is `≥1`, from the unit ideal; all completed factors are finite and nonzero. Reflect the meromorphic functional equation. Each `Γ_R,Γ_C` has a simple pole at `−2n` with nonzero residue, giving total order `−(r₁+r₂)`. Add orders to get `ζ_K`'s exact order `r₁+r₂≥1`. Totalized Gamma values cannot replace this germ calculation.

For `Q` the order is 1, agreeing with the existing negative-even Riemann zeros. For a real quadratic field the order is 2, whereas for an imaginary quadratic field it is 1.

Source: [LFunctions Layer 5][R57], the finite-order Hecke functional equation at the trivial character, with §2.5's archimedean factors; the order calculation above gives the negative-even specialization.

*Needs:* §2.5; [LFunctions Layer 5][R57]; §2.16a.

### 2.20 Canonical ray-character comparison and the quadratic endpoint

For a nonprincipal quadratic character `χ` of a finite ray class quotient, identify its canonical Hecke continuation with the continued norm-regrouped ideal-weight function, including finite omitted Euler factors. Transport LFunctions Layer 7’s nonvanishing at 1 through this comparison. The comparison identifies the supplier’s primitive/presented functions with the concrete norm-regrouped functions; no second boundary carrier is introduced.

Assume `K` a number field; `𝔪` a modulus (an integral ideal times a set of real places); `χ` a character of the ray class group `Cl_𝔪(K)` (finite order), identified with a finite-order idele-class character `ω_χ` by GlobalNumberFields Layer `9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s}` for `Re s > 1`.

Identify canonical continuations by their absolutely convergent ideal series and uniqueness on the connected domain. Consume [LFunctions Layer 5][R9]’s primitive/presented Euler correction and Layer 7’s meromorphic boundary orders, including the nonprincipal quadratic endpoint. Transport these results to the Hecke and norm-regrouped presentations; the endpoint proof belongs to the supplier.

Checks: over `ℚ` agree with `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; a quadratic nonprincipal character has order 0 at 1; the principal character has order −1 there, multiplied by the finite correction’s nonzero value for its leading coefficient.

See [LFunctions Layers 5 and 7][R9]; [53][R53], §3.4, Theorems 3.10–3.11, pp.19–20 and §22.5, Theorem 22.4, p.129.

*Needs:* [LFunctions Layers 5 and 7][R9]; §2.11; [GlobalNumberFields 9][R19]; §2.3.

### 2.21 Explicit degree-uniform Hecke convexity

This is the Rademacher–Thorner–Zaman refinement of [ZerosOfLFunctions 3.3][R13]: its one implied constant is absolute, independent of `K, n` and `r`. All degree and strip-width dependence remains in the displayed `ζ(1+r)^n, (2π)^n` and height factors. The supplier’s generic fixed-degree, `ε`-dependent convexity estimate is consumed, not restated as a target.

Let `χ` be a primitive finite-order Hecke character over a degree-`n` number field `K, Q=D_K*N(f_chi), 0<r≤1/2`, and -`r≤σ≤1+r`. For `s=σ+it` with `χ` nontrivial or `s≠1, |L_f(s,χ)| ≪ |(1+s)/(1-s)|^δ(χ) * ζ_ℚ(1+r)^n * (Q*(3+|t|)^n/(2π)^n)^((1+r-σ)/2)`, with an absolute implied constant. Define the pole factor to be `|(1+s)/(1-s)|` for the trivial character, and 1 for every nontrivial character (including at `s=1`); `ζ_ℚ` means the Riemann zeta function.

Use the primitive completed functional equation and the absolutely convergent right-edge bound. Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor.

The trivial character at `s=1` is outside this finite-value inequality; do not interpret its meromorphic pole via totalized division. Nontrivial characters may be evaluated at `s=1`.

See [73][R73], Lemma2.3 [Rademacher 1959], unnumbered bound, p.1142.

*Needs:* §2.11.

### 2.22 Logarithmic functional equation at zero and one

Let `E` be a CM number field, `F` its maximal totally real subfield, `[F:ℚ]=g≥1`, and `η=η_E/F` the canonical nontrivial primitive quadratic Hecke character. Write `D_K=|Disc(K)|, f_η` for its finite conductor, and `Q=D_F N(f_η)=D_E/D_F`. For `ℓ_j=L_f ′(j,η)/L_f(j,η)`, both denominators are nonzero and `ℓ_0+ℓ_1=-log Q+g*(γ+log(2π))`, where `γ` is Euler constant. Differentiate the completed functional equation; `Γ_R` prime/`Γ_R` at 1 and 2 sum to -`γ-log(2π)`. Nonvanishing at 0 follows from the functional equation and `L_f(1)>0`. Each real local component of `η` is the sign character, so the conductor-normalized completion is `Q^(s/2) Γ_R(s+1)^g L_f(s,η)`, with `Γ_R(s)=π^(−s/2)Γ(s/2)`. This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.

Use §2.22a's CM completion and gamma correction. After endpoint nonvanishing differentiate at0,1 and use Gamma logarithmic derivatives at1,2. Keep `Q` distinct from `D_E` until arithmetic identification; export the finite Hecke endpoint sum.

For `E=ℚ(i), F=ℚ, Q=4: L_f(0,η)=1/2` and `L_f(1,η)=π/4`; the claimed sum becomes `γ+log(π/2)`. Exclude `E=ℚ(√2), F=ℚ`: its even primitive character `χ_8` has `L_f(0,χ_8)=0`, so the displayed logarithmic quotient at 0 is undefined.

See [64][R64], Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors; [73][R73], (2-3)–(2-7), pp.1140–1141; specialized using CM sign characters.

*Needs:* `B4`; §2.11; §2.22a; [ClassFieldTheory 13][R28]; [GlobalNumberFields 10][R20].

### 2.22a CM quadratic completion and gamma correction

Let `E/F` be a CM quadratic extension, `F` totally real of degree `g`, `η` the nontrivial quadratic idele-class character of `E/F` and `Q=|D_F|N(𝔣_η)=|D_E|/|D_F|`. Then `Λ_η(s)=Q^(s/2)Γ_ℝ(s+1)^gL_f(s,η)` is entire of order at most one with `Λ_η(1−s)=Λ_η(s)`, root number 1. The unbalanced `L_η(s)=Γ_ℝ(s+1)^gL_f(s,η)` satisfies `L_η(s)=Q^(1/2−s)L_η(1−s)`. If `L_f(0,η)` and `L_f(1,η)` are nonzero, then

`L_η′(0)/L_η(0)=L_f′(0,η)/L_f(0,η)−(g/2)(γ+log(4π))`, `L_η′(0)/L_η(0)+L_η′(1)/L_η(1)=−log Q`,

and balancing adds `(1/2)log Q` to each logarithmic derivative.

Every real place of `F` becomes complex in `E`, so each archimedean component of `η` is the sign character and contributes `Γ_ℝ(s+1)`. The conductor–discriminant formula ([ClassFieldTheory 13][R28]) gives `|D_E|=|D_F|²N(𝔣_η)`, hence `Q=|D_E|/|D_F|`. By §2.7 and `Γ_ℂ(s)=Γ_ℝ(s)Γ_ℝ(s+1)`, `Λ_η=Λ_E/Λ_F` for the Dedekind completions of §2.16a, both symmetric under `s↦1−s`, so the root number is 1. Entirety and order one come from [LFunctions Layer 5][R57] and [ZerosOfLFunctions 3.3–3.4][R13]. The gamma correction is `(d/ds)logΓ_ℝ(s+1)|_(s=0)=−(1/2)log π+(1/2)ψ(1/2)=−(1/2)(γ+log 4π)`, and the second identity is the logarithmic derivative of the unbalanced equation.

**Checks.**

- `E=ℚ(i)`, `F=ℚ` gives `Q=4` and gamma factor `Γ_ℝ(s+1)`; `E=ℚ(√−3)` gives `Q=3`.
- Multiplying the unbalanced completion by `Q^(s/2)` cancels the conductor power in the reflected equation and keeps root number 1.

See [73][R73], §2, (2-3)–(2-7), pp.1140–1141.

*Needs:* §2.7; §2.16a; [ClassFieldTheory 13][R28]; [LFunctions Layer 5][R57]; [ZerosOfLFunctions 3.3–3.4][R13]; `Complex.Gammaℝ`.

### 2.23 Hecke CM partial-zeta identity

For fundamental `D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s)`, initially `Re(s)>1` then by continuation. Here `K=ℚ(√D)`, A is an ordinary ideal class, `z_A` is its associated CM lattice point in the upper half-plane, and `ω_D=|O_K^×|/2` (thus `ω_−4=2` and `ω_−3=3`). Use the Eisenstein normalization in the conventions.

Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer. Match `E*` and the gamma/discriminant normalization on `Re s>1`.

For `D=−4` use `ω_D=2`, not the full unit count 4; for `D=−3` use `ω_D=3`. Match the primitive Eisenstein half-sum convention before comparing constants.

See [60][R60], §7 (7.1), p.970; the half-unit convention is `ω_D=|O_Kˣ|/2`.

*Needs:* `B2`; §2.8; §2.12.

### 2.24 Hecke positive-sign real quadratic formula

For fundamental `D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds`, initially `Re(s)>1` and then by continuation. The proof divides by the full norm-one unit action. Here `K=ℚ(√D), A∈Cl^+(K), J` is the narrow class of a principal ideal generated by an element of negative norm, and `C_A` is the oriented quadratic geodesic modulo the full norm-one unit group. With `ε_D` the least norm-one unit greater than 1, its arc length is `2 log ε_D`. Use the Eisenstein normalization in the conventions. The integration measure denoted `ds` in the displayed formula is hyperbolic arc length `y^(−1)|dz|`, not the complex variable `s`.

Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action. Sum the A and JA branches; match arc length and the even gamma factor.

See [60][R60], (7.2), p.970 (Hecke; a cited result, 'He showed').

*Needs:* `B2`; §2.8; §2.12.

### 2.25 Genus Hecke factorization

(p.971.) Let `D = d'd ≠ 1` be a fundamental discriminant, with `d`' and `d` fundamental discriminants (hence coprime), `K = Q(√D)`, and `χ` the associated genus character of `Cl^+(K)`. Either factor may be the trivial discriminant 1. For `D > 0, χ(J) = sign d = sign d`'. Kronecker's decomposition holds: `L(s,χ) = L(s,χ_{d'})L(s,χ_d)`. Equivalently `Λ_DIT(s,χ) = Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d)`, with the genus completion as in (7.4)–(7.5) and the Dirichlet completion fixed in the conventions by (5.13).

For `D>0`, use §2.1c's real genus character, its value on J and its coprime-ideal evaluation; for `D<0`, use §2.10’s imaginary-quadratic dictionary. Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity.

See [60][R60], §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8).

*Needs:* §2.10; §2.12; §2.1c; `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`.

### 2.26 Hecke negative-sign real quadratic formula

For fundamental `D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz`, initially `Re(s)>1` and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here `K=ℚ(√D), A∈Cl^+(K), J` is the narrow class of a principal ideal generated by an element of negative norm, and `C_A` is the oriented quadratic geodesic modulo the full norm-one unit group. With `ε_D` the least norm-one unit greater than 1, its arc length is `2 log ε_D`. Use the Eisenstein normalization in the conventions. The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.

Unfold the oriented differential `i∂_zE* dz` over the full norm-one unit quotient. Take the `A−JA` difference and retain `Γ((s+1)/2)^2`, rather than the even gamma factor.

See [60][R60], §7 (7.3), p.970; full norm-one-unit geodesic convention.

*Needs:* `B2`; §2.8; §2.12.

### 2.27 Imaginary quadratic class-number value at zero

With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies `L(0,ε_D)=h/u`.

Use the canonical root-number-one continuation from `imaginary_quadratic_root_number_one`, not a pointwise product at a gamma pole. At0 and1 the gamma factors are regular; `Γ(1/2)=√π` and `Γ(1)=1` give `Λ_std(0)=√δ L(0)` and `Λ_std(1)=(δ/π)L(1)`. Insert `L(1)=πh/(u√δ)` from `imaginary_quadratic_lvalue_one`, obtaining `L(0)=h/u`. Both gamma values are library declarations.

`D=−4` gives `L(0,ε_−4)=1/2; D=−3` gives `L(0,ε_−3)=1/3`. This is for odd characters from negative fundamental discriminants. An even nontrivial quadratic character has a trivial zero at0 and cannot satisfy this formula.

Derived from §2.17, Mathlib’s Dedekind residue formula and limit cited there, and the root-number-one completed equation §2.16. Gross–Zagier [71][R71], Chapter IV §4, pp.283–284, uses these quadratic values in its Rankin L-series formulas.

*Needs:* §2.16; §2.17; `Complex.Gamma_one`; `Complex.Gamma_one_half_eq`.

### 2.28 Quantitative Artin Euler convergence

For fixed dimension `d` and `ε>0`, uniformly on `Re s≥1+ε`, the local factors satisfy `|P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s`. Their product converges absolutely and locally uniformly and is nonzero there.

Apply §2.28a with `θ=2^(−1−ε)` and `t=(Np)^−Re s`. Since `Np≥2`, the nonzero factors and their reciprocals have deviations dominated by `C_(d,ε)(Np)^(−1−ε)`. Dedekind convergence majorizes this prime-ideal sum; the coefficient series has the `d`-fold convolution majorant with sum `ζ_K(1+ε)^d`, including `d=0`. ADS Layer 3 then identifies the absolutely convergent unordered product and series, locally uniformly. Summable reciprocal deviations give a nonzero limit. Global bounds may depend on `K`; local constants depend only on `d,ε`.

See [53][R53], §22.2 p.128 absolute convergence paragraph.

**§2.28a Uniform finite Artin factor bound.** For `d∈N,0≤m≤d,0≤t≤θ<1` and `α₁,…,α_m∈C` with `|α_j|=1`, put `A(z)=∏_{j=1}^m(1−α_j z)`. For `|z|=t, A(z)≠0, |A(z)^−1|≤(1−θ)^−d` and `|A(z)^−1−1|≤d t(1−θ)^−d`. The assertion includes `d=m=0`.

Each `|1−α_jz|≥1−θ>0`. Telescoping the reciprocal product bounds each of its `m` difference terms by `t(1−θ)^−m`, giving `mt(1−θ)^−m≤dt(1−θ)^−d`. A finite-order invariant-space automorphism has roots `α^N=1` for a positive group exponent `N`, hence unit modulus; its polynomial splits over `ℂ`. Thus the Artin factors satisfy these hypotheses.

See [53][R53], §22.2 p.128 local `O(p^−s)` estimate.

### 2.29 Imprimitive Hecke deleted factors

Let `χ` be the ray ideal character modulo a modulus `m` induced from a primitive finite-order Hecke character `χ₀` of conductor `f₀` dividing `m`. If `m_fin` is the finite part, then `L_m^cont(s,χ)=L^cont(s,χ₀)∏_{p|m_fin, p∤f₀_fin}(1−χ₀(p)exp(−s log Np))`. Each prime occurs once even if its exponent in `m` grows; real-place conditions enter the conductor dictionary but do not delete finite Euler factors. Equality is meromorphic.

Consume [LFunctions Layer 5][R9]’s `eulerCorrection` and primitive/presented meromorphic identity. Identify its modulus support and primitive character with the concrete ideal presentation through GNF’s dictionary and §2.3. This is a presentation comparison, including equality of germs at the trivial pole and at correction zeros.

For `K=Q` and primitive trivial character, agree with Mathlib’s principal-character finite Euler correction. Changing a finite modulus `p` to `p²` deletes the same single factor; an added real place creates no new finite prime factor.

Source: [LFunctions Layer 5][R57], primitive/presented Euler correction (`eulerCorrection`) and its finite omitted factors.

*Needs:* [LFunctions Layer 5][R9]; §2.11; [GlobalNumberFields 9][R19]; §2.3.

### 2.30 Sign of the quadratic Gauss sum from the Dedekind functional equation

Let `D ≠ 1` be a fundamental discriminant, `δ = |D|, ε_D` the primitive quadratic Dirichlet character of conductor `δ` attached to `ℚ(√D)`, and `κ(D) = 1` if `D > 0, κ(D) = i` if `D < 0`. Then `(i) DirichletCharacter.rootNumber ε_D = 1`; equivalently (ii) the Gauss sum `Σ_{n mod δ} ε_D(n) e(n/δ)` equals `κ(D) δ^{1/2}`, and for every integer `r, Σ_{n mod δ} ε_D(n) e(rn/δ) = ε_D(r) κ(D) δ^{1/2}` (zero when `gcd(r,δ) > 1`); (iii) if `D` is odd and `gcd(R,δ) = 1`, then `Σ_{n mod δ} e(Rn²/δ) = κ(D) δ^{1/2} ε_D(R)`. Prove the root-number assertion for the canonical primitive quadratic character.

Continue `ζ_K=ζLε_D` for `K=Q(√D)`. The root-one Dedekind and Riemann completed equations, with `Γ_R(s+a)`, give reflection for the quotient. Compare Mathlib `IsPrimitive.completedLFunction_one_sub` and use `ε_D⁻¹=ε_D` and a nonzero function to force `rootNumber=1` (the imaginary case is §2.16). Its definition `gaussSumχ/(I^a√N)` gives(i); `gaussSum_mulShift_of_isPrimitive` gives shifted sums for every residue, including nonunits. For squarefree odd `δ`, expand the root count `∏_(p|δ)(1+(m/p))`; only the full product survives, yielding the shifted `ε_D` Gauss sum at `R`.

`D = −4: Σ_{n mod 4} ε_{−4}(n) e(n/4) = i − (−i) = 2i = κ(−4)·4^{1/2}`. `D = 5`: the Gauss sum is `√5` (positive), not `−√5`. `D = −3, R = 1: Σ_{n mod 3} e(n²/3) = 1 + 2e(1/3) = i√3`. The sign is the content: Tau Ceti and Mathlib give only the square of the Gauss sum or its modulus.

See [71][R71], Chapter IV, §2, proof of (2.3), p. 275; §3, proof of (3.2), p. 278.

*Needs:* §2.7; §2.5; §2.16; `DirichletCharacter.rootNumber`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `gaussSum_mulShift_of_isPrimitive`; `completedRiemannZeta_one_sub`.

### 2.31 Artin continuation near the line one

Let `K/ℚ` be finite Galois and `ρ` a finite-dimensional complex representation of `Gal(K/ℚ)`. The incomplete Artin `L`-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of `{Re(s)≥1}`; it is holomorphic and nonzero on `Re(s)=1` away from `s=1`, and its pole order at 1 is `dim(V^G)`. This statement asserts neither global Artin holomorphy nor Chebotarev density.

Use §2.18a's canonical Artin continuation, finite nonzero leading coefficient at 1, and Brauer assembly from Hecke factors. LFunctions Layer 7 gives order 0 for every primitive Hecke factor on the rest of the boundary. Identify the incomplete presentation with the canonical complete function times the local polynomials of §2.18. Each correction is nonzero on `Re s>0`, so it preserves boundary orders; its value at 1 scales the leading coefficient.

Checks: the trivial representation gives `ζ` times the omitted polynomials and order −1 at 1; a nontrivial line gives the corresponding presented Hecke function and order 0; ramified factors act on inertia invariants, and deleting one has no zero on the line one.

See [53][R53], Chapter22, Theorems22.3–22.4, pp.128–129.

*Needs:* §2.18a; [LFunctions Layer 7][R9]; §2.18; §2.20.

**§2.31d Normal-closure discriminants and conductor budgets.** If `E/Q` has degree `d` and `L` is its normal closure, `m=[L:Q]≤d!` and `D_L≤D_E^m≤D_E^(d!)`. For any intermediate `K, D_K≤D_L^(1/[L:K])`. For a complex representation `χ` of `H=Gal(L/K)`, its analytic conductor is `Q_χ=D_K^(χ(1))N(f_χ)` and satisfies `Q_χ≤D_L^(2χ(1)/|H|)`. These are all-prime conductors. For a quadratic `E/F, Q_η=D_F N(f_η)=D_E/D_F`.

Locally, the extended different of `K₁K₂/K₁` divides that of `K₂/ℚ`. Iteration and the different tower formula give `D_(K₁…K_r)≤∏D_(K_i)^(m/[K_i:ℚ])`. The at most `d` conjugates of `E` yield exponent sum at most `m` ([Stark][R74], Lemmas 6–7, p.143). The subfield bound follows from `D_L=D_K^[L:K]N(D_(L/K))`.

For nontrivial `H_i`, `codim V^(H_i)≤χ(1)` and `|H_i|≤2(|H_i|−1)`; trivial groups contribute zero. Compare the lower-ramification sum with the regular discriminant exponent, then include `D_K^χ(1)` and the discriminant tower formula. This gives the factor 2 ([Cho–Lemke Oliver–Zaman][R75], Lemma 4.2, pp.9–10). For quadratic `η` the regular character `1+η` instead gives equality. Wild groups are retained.

Required interfaces are `normalClosure_discriminant_le`, `subfield_discriminant_le`, `artin_analyticConductor_le` and `quadratic_analyticConductor_eq`. They use §2.2a's conductors and LocalFieldsRamification's different; their inequalities are local adapters here.

**Checks.**

- For `d=1,E=Q` the normal closure has `D=1`; every inequality is equality.
- For a quadratic `E/Q, L=E` and the exact conductor of `η` is `D_E`. The coarse inequality `D_L≤D_E²` is permitted but is not used as an equality.
- A wildly ramified prime contributes through every `H_i`. Keeping only `H_0` would fail the different comparison, including at 2 and 3.
- The normal-closure hypothesis matters: adjoining unrelated ramification to an arbitrary Galois overfield gives no bound in terms of `D_E`.

**§2.31e Fixed-degree residue lower bound, including nonnormal fields.** For `n≥1` and `a>0` there is `c_(n,a)>0` such that `κ_K≥c_(n,a)D_K^(−a)` for every degree-`n` number field `K`. The constant is allowed to be ineffective. For the upper bound `κ_K≤C_(n,a)D_K^a`, use the pole-aware convexity estimate of Thorner–Zaman Lemma2.3, pp.1142–1143, on `|s−1|=r` with `0<r≤min(a,1/4)`. It gives `sup|(s−1)ζ_K(s)|≤C_(n,r)D_K^r`; the maximum principle bounds its value `κ_K` at the centre. This subpower upper bound uses neither the sharper Louboutin constant nor an unproved lower bound.

For `K≠ℚ`, [Stark][R74], Lemmas 2–4, pp.137–141 give `κ_K≥c min(1/logD_K,1−β_K)` for the possible real zero in the one-zero rectangle. Integrate the completed logarithmic derivative from `σ₀=1+1/(4logD_K)` to 1, isolate the zero and use `ζ_K(σ₀)≥1` and bounded Gamma derivatives. No unknown signed Artin-value product is used.

If `1−β_K≥1/(4n!logD_K)`, the bound follows. Otherwise Stark Lemma 8 pp.145–146 gives a quadratic `F⊂K` without normality. Pass to normal closure `B`: Aramata makes `β_K a ζ_B` zero; `logD_B≤n!logD_K` puts it in `B`’s one-zero rectangle, where Stark Lemma 1 pp.136–137 makes it simple. For `H≤Gal(B/ℚ)`, put `Θ_H=Σ_χord_βL(s,χ)χ`. Artin induction/reciprocity gives `Res_HΘ_G=Θ_H`. On cyclic `H` the factors are holomorphic Hecke functions with nonnegative orders summing to `ord_βζ_B=1`, so `Θ_H` is linear and `|Θ_G(g)|=1`. Orthogonality gives `Σord_β(L_χ)²=1; Θ_G(1)=1` forces a unique coefficient `+1`. Reality of `β` makes that character real; `ζ_ℚ(β)≠0` excludes triviality, so it is quadratic. Its fixed field `F` lies in `K` because `ord_βζ_K` is the average over `Gal(B/K)`. This is Stark Theorem 3 pp.144–145 and also proves §2.39; Aramata alone does not imply simplicity.

For that quadratic `F`, §0.31b's zero gap `.siegel_gap` gives `1−β_K≥c_LS/log D_F`, hence `1−β_K≥c_bD_F^−b` for each `b>0`. The different tower gives `D_F≤D_K`; take `b=a`. The finite remaining discriminant range has positive residues, and `ℚ` has `κ=1`. The residue/class-number formula and degree-bounded archimedean factors give §§2.32,2.46. Roots of unity have bounded order since `φ(w)≤n` leaves finitely many `w`.

Required interfaces are `dedekind_residue_lower_of_zero_gap`, `simple_dedekind_zero_linear_character`, `near_one_dedekind_zero_quadratic_subfield`, and `dedekind_residue_subpower_lower`. Their prerequisites are the §2.39b, §2.31d, meromorphic Artin/Hecke comparison, finite cyclic character orthogonality and §0.31b.

**Checks.**

- `K=Q` uses `κ=1` and does not invoke `log D_K=0` in a denominator.
- A nonnormal cubic field is included: the closure has degree at most 6, and no normality premise is added to the residue result.
- The near-zero character argument begins with possibly negative Artin orders. Nonnegativity is used only after restriction to cyclic groups, where Hecke holomorphy proves it.
- The conclusion permits an exceptional zero and ineffective constants; it does not assert a computable `D^(−a)` bound for every a.

**§2.31f Uniform regularized finite-order Hecke endpoints.** Fix `n,m≥1`. Let `K` have degree `≤n`, let `ψ` be a primitive finite-order Hecke character of order `≤m, Q=D_K N(f_ψ), δ=1` for the trivial character and 0 otherwise, and let `H` extend `(s−1)^δ L(s,ψ)` holomorphically at 1. For each `a>0`,
`|H(1)|+|H(1)|^(−1)+|H′(1)|≤C_(n,m,a)max(1,Q)^a`.
All endpoints are nonzero. Constants may be ineffective. The derivative and upper-value bounds are effective; ineffectivity occurs only in the lower bound.

Apply Thorner–Zaman Lemma 2.3, p.1142 on `|s−1|=r≤1/4`, strip parameter `r`. Multiplication by `(s−1)^δ` cancels the principal pole, leaving bounded `|1+s|^δ`; the convexity exponent is at most `r`. Thus `sup|H|≤C_(n,r)Q^r` and Cauchy gives `|H′(1)|≤C_(n,r)Q^r/r`. Choose `r≤a`; absorb small `Q`. This uses no zero-free disc.

For nontrivial `ψ` of order `h≤m`, reciprocity gives a cyclic `N/K`, `[N:K]=h`, and `ζ_N=∏_(j=0)^(h−1)L(s,ψ^j)` with primitive full factors. Hence `∏_(j=1)^(h−1)L(1,ψ^j)=κ_N/κ_K`. Conductor–discriminant gives `D_N≤Q^h` and `[N:ℚ]≤nm`. Bound `κ_N` below, `κ_K` and the other factors above, and isolate `|L(1,ψ)|` using absolute values. Individual exponent `a/(4m)` suffices. For trivial `ψ` use `H(1)=κ_K`. This reciprocal bound is independent of the derivative estimate and needs no logarithm choice.

For §§2.33,2.45, `Q≤D_E^(2M_g)` and `Σ|n_j|≤B_g`. Reciprocity gives `Σn_jδ_j=⟨χ_ρ,1⟩=0`, so `L_ρ=∏H_j^n_j` has no pole. Divide endpoint exponents by `2M_gB_g` for the two-sided §2.33 bounds. Apply exponent a/2 to `H′` and `1/H`, then sum `n_jH′_j/H_j` for §2.45 and §2.44, without Artin holomorphy. §2.51 needs only the quadratic endpoint `κ_E/κ_F>0`.

Required interfaces are `regularizedHecke_circle_bound`, `regularizedHecke_value_subpower`, `regularizedHecke_inverse_subpower`, `regularizedHecke_deriv_subpower`, and `regularizedHecke_logDeriv_subpower`. The source for the convexity bound and its proof is [73][R73], Lemma2.3, pp.1142–1143; the lower bound is the residue/product argument above, not a consequence of Cauchy alone.

**Checks.**

- For the trivial character over `Q, H=(s−1)ζ` has `H(1)=1; L(1)` itself is not a finite value.
- For `h=2` the product has one nontrivial factor, giving exactly `L(1,ψ)=κ_N/κ_K>0`.
- For `h=3` the two conjugate factors have product `|L(1,ψ)|²`. Taking an absolute value before isolating one factor is consistent with this positive product.
- A holomorphic function with a tiny nonzero endpoint may have a large logarithmic derivative even if its derivative is bounded. The separate reciprocal estimate is essential.

### 2.32 Bounded-degree Brauer-Siegel

For number fields of bounded degree and discriminant `D` tending to infinity, `log(h_K R_K)=(1/2+o(1)) log D`. Keep fixed-degree uniformity and possible ineffectivity explicit. The signature `bounded_degree_brauer_siegel` gives the hR comparison uniformly in degree at most a fixed bound.

Use the §2.31e, which includes nonnormal fields, and the explicit residue upper bound. Apply the real analytic class-number formula; bounded degree bounds the roots-of-unity and archimedean factors, and finite adjustment handles bounded discriminants.

See [64][R64], 2.2, p. 382; proof of Corollary 3.3, p. 384; [Stark][R74], §§2–3, pp.137–146.

*Needs:* §2.5; §2.15; §2.18a; `NumberField.dedekindZeta_residue`; `NumberField.classNumber`; `NumberField.Units.regulator`; §2.31e.

### 2.33 Two-sided subpolynomial values at one

For the CM normal-closure family `F(E)` of §2.6, with the same degree-uniform constants, For each `ρ∈F(E)`, import an integral monomial Brauer expression `χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j` with one-dimensional finite-order `ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g` and `[L^(H_j):Q]≤M_g`. Bound each Hecke analytic conductor (including the base-field discriminant) by `D_E^C_g`, with `D_E=|Disc(E)|`. For `δ_j=1` if `ψ_j` is trivial and0 otherwise, take the holomorphic, nonzero extension `H_j(s)` of `(s−1)^δ_j L(s,ψ_j)` at1. Prove `Σ_j n_jδ_j=0` and the local germ identity `L(s,ρ)=∏_j H_j(s)^n_j`. For each `ε>0` there is `C_(g,ε)>0` such that `|L(1,ρ)|≤C_(g,ε)D_E^ε` and `|L(1,ρ)|⁻¹≤C_(g,ε)D_E^ε`. The constants may be ineffective. Continued `L`-functions are required to match the all-prime Euler series on `Re s>1` and be analytic, nonzero at1.

Use the stated finite family and no general Artin-holomorphy assumption. The §2.31f supplies both directions, including positive residues of trivial factors; its reciprocal bound is independent of Cauchy.

Use `χ_ρ=Σ_(j∈J)n_jInd_(H_j)^Gψ_j` with `|J|,Σ|n_j|≤B_g` and base degrees `≤M_g`. Bound each full Hecke analytic conductor by `D_E^C_g`. Regularize `H_j=(s−1)^δ_jL_j, δ_j=1` for trivial `ψ_j`, and prove `Σn_jδ_j=0` and `Lρ=∏H_j^n_j` as nonzero holomorphic germs at1. Fixed-degree upper/reciprocal subpower estimates with exponent `ε/(C_gB_g)` give both signed-product bounds; never take the absolute value of a trivial pole separately.

See [64][R64], Theorem 3.2 and proof of Corollary 3.3, pp.383–384.

*Needs:* `B1`; §2.20; §2.6; [RepresentationTheory/InductionRestriction 6][R30]; §2.31d; §2.31f.

### 2.34 A fixed small circle gives a subpolynomial derivative

Let `E` be a CM number field, `F` its maximal totally real subfield, `[F:ℚ]=g≥1`, and `η=η_E/F` the canonical nontrivial primitive quadratic Hecke character. Write `D_K=|Disc(K)|, f_η` for its finite conductor, and `Q=D_F N(f_η)=D_E/D_F`. For fixed `g` and every `ε>0, |L_f prime(1,eta_E/F)| ≪_(g,ε) D_E^ε`. Set `r=min(ε,1/4)>0`. The closed circle `|s-1|=r` is in `[-r,1+r]` in real part, `|t|≤r`, and the convexity exponent is at most `r`. Hence its supremum is at most `C_(g,r)*Q^r`, and Cauchy gives `|L_f prime(1)|≤C_(g,r)*Q^r/r`. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

Choose `r=min(ε,1/4)`, and apply the finite-order convexity bound on the complete circle `|s−1|=r`. Use Cauchy on the holomorphic disk, with bound `Q^r/r`; no zero-free disk is assumed.

See [64][R64], Cauchy-circle adapter for Tsimerman, Corollary 3.3, p.384; Thorner–Zaman Lemma 2.3, p.1142, supplies the required pole-aware convexity statement.

*Needs:* §2.21; [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27]; [ClassFieldTheory 13][R28]; §2.22a; §2.31f.

### 2.35 Theorem3 negative factors

For `s=1/2+it`, coprime negative fundamental `d,d′` and `D=d′d>0, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ`. Use §2.1c's real genus dictionary and oriented surfaces; continue the compact boundary Hecke identity from `Re(s)>1` to the critical line, then apply §2.1’s `core_stokes` with §2.1b's cusp hypotheses. The raw core integral diverges when `Re(s)>1` and is not its initial definition.

Apply the odd compact-boundary Hecke identity and the genus Euler factorization. Continue this identity to the critical line before applying Stokes; never start from the divergent `Re s>1` core integral.

See [60][R60], §5 Theorem 3, first branch, p.964; §7 (7.8), Lemma 2 (7.10)–(7.11), p.972.

*Needs:* `B2`; §2.26; §2.25.

### 2.36 Theorem3 positive factors

Let `D > 1` be a fundamental discriminant and `D = d′d` a factorization into positive fundamental discriminants (equivalently, `d′, d > 0` coprime fundamental discriminants with `d′d > 1`; then `D` is fundamental). Let `χ` be the genus character. Then `Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|`, as meromorphic functions of `s (7.8)`. On `Re(s) = 1/2` this is the second case of Theorem 3, where `∫_{∂F_A}` replaces `∫_{C_A}`.

Sum the even compact-geodesic identity against `χ` and use genus factorization. Identify geodesic and boundary arcs on the critical line using §2.1c's oriented boundary-period map.

See [60][R60], Theorem 3, second case, p.964; for all s by (7.8), p.972.

*Needs:* `B2`; §2.24; §2.25.

### 2.37 Theorem3 CM factors

For coprime fundamental `d,d′` of opposite `sign, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s)`, as a meromorphic identity. Here `D=dd′<0`, the sum is over ordinary ideal classes of `ℚ(√D), χ` is the genus character, and `ω_D=|O_K^×|/2` as in the CM partial-zeta comparison; use the same `E*` normalization.

Use §2.1’s imaginary-quadratic CM-point adapter and sum the CM point partial-zeta identity against the genus character. Match the two Dirichlet gamma factors and the unit factor `2√π/ω_D`.

See [60][R60], Theorem 3, third case, p.964 (`Re(s) = 1/2`); for all s by the display after 'By (7.6) we have when `D < 0`', p.971.

*Needs:* `B2`; §2.23; §2.25.

### 2.38 Ray-class `L`-function zero-density estimate

There is `c = c([k : ℚ]) > 0` such that for `Q, T > 1, 1/2 ≤ σ < 1` and `ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}`, the inner sum over primitive ray class characters of conductor `𝔮` and `N_χ(σ, T)` counting zeros with `ℜρ ∈ (σ, 1), |ℑρ| ≤ T`.

Assume `k` is a number field of fixed degree `n; D_k` is its absolute discriminant; `Q,T>1; 1/2≤σ<1; ε>0`.; Count nontrivial zeros with analytic multiplicity and strict `σ<Reρ<1`, inclusive `|Imρ|≤T`. Sum once over each primitive finite-order ray class character of exact conductor ideal `𝔮`, including its infinity component.

Use canonical finite-order ray-class functions and [ZerosOfLFunctions Layer4][R14]'s multiplicity-weighted divisor. Specialize the original family-density theorem to trivial GL1 base, retaining `ε`, LOW Theorem4.2's degree dependence and full conductor/character family. The Pasten appendix/Thorner–Zaman density proof is local; constructing another zero divisor is unnecessary.

See [66][R66], Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19; [66][R66], §4, Theorem4.2, p.20.

*Needs:* §2.11; §2.20.

### 2.39 Heilbronn's theorem on real zeros of Dedekind zeta functions

If `K/Q` is finite Galois and the canonical continued `ζ_K` has a simple real zero `β` with `0<β<1`, then a quadratic subfield `k⊆K` satisfies `ζ_k(β)=0`. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.

Use §2.31e’s Stark finite-character argument for the theorem. Heilbronn’s subgroup-average proof gives the same reduction: Aramata makes intermediate zeta orders 0 or 1; form `φ=Σm_χχ` with integer, possibly negative Artin orders. If maximal abelian zeta were nonzero, a minimal subgroup `H*` of the commutator with average 0 has proper-subgroup averages 1. Cyclic Möbius inversion makes `H*` cyclic; conjugate nonreal factors exclude odd-prime quotients, leaving a nontrivial 2-group. Writing `φ=φ₊−φ₋` with real genuine characters, determinant triviality on the commutator makes both `−1`-eigenvalue multiplicities even, whereas the average difference forces their difference to be 1. In the maximal abelian extension nonreal Hecke factors pair, so a simple real zero comes from a real character. `ζ_ℚ(β)≠0` excludes the trivial character, yielding a quadratic subfield. The cyclic decomposition and entire quotient are targets below ([Stark][R74], Theorem 3, pp.144–145; Heilbronn’s locators below).

`K=Q` cannot satisfy the premise: `ζ_Q` has no zero on(0,1). For `K` quadratic over `Q` the conclusion is its own field, by `ζ_K=ζ_Q L(s,χ_K)`. An Artin factor may have a pole: nonnegative `m_χ` are never assumed in the virtual-character argument.

See [76][R76], Theorem1 p.870; complete proof pp.871–873; postscript p.873; [51][R51], §8.3 p.92, proof following Theorem8.13.

*Needs:* `B1`; §2.39b; `LinearMap.charpoly_prodMap`; §2.7.

**§2.39a Positive cyclic decomposition of the augmentation character.** For a finite group `G`, there exist a positive integer `N` and finitely many cyclic subgroups `C_j≤G`, nontrivial one-dimensional complex characters `ψ_j` of `C_j` and nonnegative integers `n_j` such that `N(Reg_G−1_G)=Σ_j n_j Ind_(C_j)^G ψ_j`. The trivial group permits the empty sum. This positive rational decomposition is stronger than the signed integral Brauer expression used for meromorphic continuation; no claim of nonnegative coefficients for arbitrary irreducible characters is made.

Group elements by conjugacy of the cyclic subgroups they generate. For each nonidentity class of this relation, Aramata's Satz5 constructs a class function supported on that class and the identity. Its expression in cyclic induced characters has coefficients proportional to `φ(k)−μ(k)`, which vanish for `k=1` and are positive for `k>1`. Satz6 sums these functions to `Reg_G−1_G`. Clear the finitely many positive rational denominators to obtain `N` and `n_j`.

See [77][R77], Sätze4–6 and proof of the main theorem, pp.32–34; divisor identities Sätze1–3, p.31.

*Needs:* From RepresentationTheory, for finite-group class functions, linear characters, induction and their character formulas; finite cyclic character orthogonality and Möbius divisor inversion.

**§2.39b Aramata entire quotient.** For a finite Galois extension `K/E` of number fields, the meromorphic quotient `ζ_K/ζ_E` extends to an entire function, agreeing with the quotient on `Re s>1`. For `K=E` this is the constant1. This assertion includes removal of the apparent singularities at zeros of `ζ_E`.

Apply §2.39a to `Gal(K/E)`. Ramified Artin induction makes the quotient’s Nth power a product of nonnegative powers of entire nontrivial finite-order Hecke functions. The quotient is meromorphic by §2.18a; a pole of order `m` would give order `Nm` in that entire power. Thus it has no poles, without Artin holomorphy.

See [77][R77], main theorem p.31 and proof p.34.

*Needs:* §2.39a; §2.18a; §2.11.

### 2.40 Eisenstein series at a CM point equals a partial zeta function

Let `D<0` be a fundamental discriminant, `K=Q(√D), u=#O_K^×/2` and A an ordinary ideal class. Choose its CM lattice point `τ_A` in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant `D`. Let `E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s)`, the uncompleted level-one Eisenstein series. For `Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s)`, equivalently `2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s)`. All positive-base powers use the real logarithm. Changing A to `A^(−1)` leaves its partial zeta unchanged.

Substitute `E*=π^−sΓ(s)ζ(2s)E` and `ω_D=u` in `hecke_cm_partial_zeta_identity`. On `Re s>1` cancel nonzero `π^−sΓ(s)`, retaining `ζ(2s)`, the primitive half-sum and `u=#units/2`. Use IntegralLattices' lattice/ordinary-class choice; inverse classes agree only through the conjugation/partial-zeta adapter. Nonfundamental order discriminants are excluded. This is a normalization comparison, not a second CM-period construction.

For `D=−4, τ=i, u=2` and the single class, `ζ_Q(i)(s)=2^s ζ(2s)E(i,s)/(2·4^(s/2))=ζ(2s)E(i,s)/2`. For `D=−3` the unit factor is `u=3`, not1. A primitive form with nonfundamental discriminant `−16` represents a nonmaximal order in `Q(i)`; it cannot be substituted into this field-discriminant formula.

See [71][R71], ChapterII§4, p.248, immediately after(4.1).

*Needs:* §2.23.

### 2.41 Artin holomorphy as a hypothesis

For a finite Galois extension `L/K` of number fields and a finite-dimensional complex representation `ρ` of `Gal(L/K)`, ArtinHolomorphy `ρ` is the proposition: the meromorphic continuation of the Artin Euler series `L_K(s,ρ)` of this layer (Brauer continuation) has no poles in `ℂ ∖ {1}`, and its order at `s = 1` is minus the multiplicity of the trivial representation in `ρ`. The Artin conjecture is the proposition that ArtinHolomorphy `ρ` holds for every such `ρ`. Both are used only as hypotheses.

Define the predicate on the unique Brauer meromorphic continuation, including inertia-invariant ramified factors. Uniqueness removes expression dependence. Finite Euler deletion preserves ArtinHolomorphy in both directions, with the same order at 1. The deleted polynomial is nonzero on `Re s>0` and at 1. For the converse also prove complete holomorphy on `Re s≤0` using the completed functional equation.

The required completed-equation adapter is local: assemble the primitive Hecke equations along §2.18a’s integral Brauer expression to obtain `Λ(s,ρ)=w(ρ)Λ(1−s,ρ∨)`, with nonzero root number, conductor `|D_K|^dimρ N(f_ρ)` and the archimedean factors from the actual local representation. At a real place these are `Γ_R(s)^a Γ_R(s+1)^b` for its ± eigenspace dimensions; at a complex place use `Γ_C(s)^dimρ`. Compare factors and conductors under induction before cancelling signed products as meromorphic germs. This uses the conductors of §2.2a and the finite-order Hecke equation of §2.11. For `Re s<0`, the reflected Euler function and Gamma factors are regular and nonzero, and reciprocal Gamma is entire. On `Re s=0` away from 0 use Hecke boundary orders on the reflected line. At 0 put `r=dim V^G` and `a₀=Σ_(v real)dim V^(c_v=1)+r₂(K)dim V`. The Gamma pole order is `a₀`, so `ord₀ L=a₀−r≥0`: every invariant vector contributes at each archimedean place, and `r₁+r₂≥1`. This proves the boundary cancellation independently of Artin holomorphy.

- `ArtinHolomorphy`: The proposition defined above.
- `ArtinConjecture`: ArtinHolomorphy `ρ` for all `L/K` and all `ρ`.
- `ArtinHolomorphy.add`: ArtinHolomorphy `ρ₁` and ArtinHolomorphy `ρ₂` imply ArtinHolomorphy `(ρ₁ ⊕ ρ₂)`, since the Euler series multiply and the multiplicities of the trivial representation add.
- `ArtinHolomorphy.of_dim_one`: A one-dimensional `ρ` satisfies ArtinHolomorphy, because by §2.18a its Euler series is a primitive finite-order Hecke `L`-function, continued by §2.3a.
- `ArtinHolomorphy.induced`: ArtinHolomorphy is invariant under induction: `L_K(s, Ind_{L/M}^{L/K} σ) = L_M(s,σ)`, so `ρ` induced from a one-dimensional character satisfies it.

**Checks.**

- For the trivial representation of `Gal(L/K)`, the Euler series is `ζ_K`, which has a simple pole at 1, matching multiplicity one; ArtinHolomorphy holds.
- For the regular representation, `L_K(s,ρ) = ζ_L(s)`, with a simple pole at 1, and the trivial representation occurs once.
- Brauer meromorphy alone does not give ArtinHolomorphy: a virtual combination with negative coefficients may have poles, so the predicate is not a consequence of the continuation target.
- Complete and finite-Euler-deleted ArtinHolomorphy are equivalent. For the trivial line over `ℚ`, the reflected simple pole and the `Γ_R` pole cancel at 0, giving `ζ(0)=−1/2`; zeros of a deleted polynomial on `Re s=0` do not conceal a complete-function pole.
- For the zero representation, `a₀=r=0` and both complete and incomplete functions are 1; for a trivial line over a real quadratic field, `a₀−r=1` is the zero order at 0.

No unconditional target of this roadmap uses the predicate; it records the requirement that general continuation statements stay visible hypotheses.

See [53][R53], §22.2–22.3, Conjecture 22.2, p.128; [Cogdell, On Artin L-functions][Artin-FE], pp.13–14, for the archimedean factors and functional equation. The deletion equivalence follows from that equation and the supplied boundary orders.

*Needs:* §2.18; §2.18a; §2.2a; §2.3a; §2.11; [LFunctions Layer 7][R9].

### 2.42 Extended Riemann hypothesis for Dedekind and Hecke `L`-functions

For a number field `K`, DedekindERH `K` is the proposition: every zero `s` of the continued Dedekind zeta function `ζ_K` (the Hecke continuation identified with `NumberField.dedekindZeta` on `Re s > 1` by this layer) with `0 < Re s < 1` has `Re s = 1/2`. For a primitive finite-order Hecke character `χ` of `K`, HeckeGRH `χ` is the same proposition for the continued `L(s,χ)`. Both are hypotheses only; they extend the Layer 1 register from Dirichlet characters to number fields.

Definition on the continued functions of this layer. The strip condition removes the trivial zeros `(Re s ≤ 0)` and the pole at 1; zeros with `Re s ≥ 1` are excluded by line-one nonvanishing.

- `DedekindERH`: The proposition defined above.
- `HeckeGRH`: The proposition for one primitive Hecke character.
- `dedekindERH_rat_iff`: DedekindERH `ℚ` is equivalent to RiemannHypothesis, since `ζ_ℚ = ζ`.
- `DedekindERH.of_abelian`: For `K/ℚ` abelian, `ζ_K` is the product of the Dirichlet `L`-functions of the primitive characters of its conductor, so GRH for those characters implies DedekindERH `K`.
- `HeckeGRH.trivial`: HeckeGRH of the trivial character of `K` is DedekindERH `K`.

**Checks.**

- DedekindERH `ℚ ↔` RiemannHypothesis.
- For `K = ℚ(i), ζ_K = ζ · L(·,χ₋₄)`, so DedekindERH `ℚ(i)` is equivalent to RiemannHypothesis together with DirichletGRH `χ₋₄`.
- For a real quadratic `K, ζ_K` vanishes at `s = 0` to order `1 (r₁ + r₂ − 1 = 1)`; this zero is outside the strip and does not contradict the predicate.

The conditional Chebotarev targets below carry this hypothesis explicitly; the unconditional targets do not use it.

See [53][R53], §10.3, Remark 10.5, p. 61.

*Needs:* §1.6; §2.5; §2.11; §2.20.

### 2.43 Explicit exceptional-zero region for an abelian character product

Consume per-character zero-free regions and simplicity from [ZerosOfLFunctions 6.2–6.4][R16]. The additional target is simultaneous uniqueness over all characters of an abelian extension, with the numerical constant 0.0875. Per-character uniqueness alone cannot give uniqueness for the product. The trivial-extension case below is a check of this product theorem.

`(i)` Let `L/K` be an abelian extension of number fields, `Q = Q(L/K)` the maximum of the norms of the conductors of the Hecke characters `χ` of `K` attached to `L/K, n_K = [K:ℚ]` and `D_K = |disc(K/ℚ)|`. If `D_K Q n_K^{n_K}` is sufficiently large, the product `Π_χ L(s,χ,K)` of these continued Hecke `L`-functions has at most one zero, counted with multiplicity, in `σ ≥ 1 − 0.0875/log(D_K Q n_K^{n_K}), |t| ≤ 1 (s = σ + it)`; if it exists it is a simple real zero and its character is real. (ii) In particular, if `D_K n_K^{n_K}` is sufficiently large, `ζ_K` has at most one zero in `σ ≥ 1 − 0.0875/log(D_K n_K^{n_K}), |t| ≤ 1`, and such a zero is real. The possible zero is the exceptional zero `β₁` of the effective Chebotarev theorem.

Assume `L/K` abelian; “sufficiently large” is an absolute threshold.; The `L`-functions are the continuations identified with the ideal series in this layer.

Apply Zaman Theorem4.1.1 to the congruence-character product of orders `≥r`. Its positivity/trigonometric-polynomial proof uses each completed Hadamard product and explicit Gamma bounds; for `r=1` retain `c₀=.0875` and denominator `logD_K+(3/4)logQ+n_Kν(n_K), |t|≤T⋆`. CFT identifies the `L/K` character family. The trivial extension gives `ζ_K` and `Q=1` for(ii).

`K = ℚ, L = ℚ(ζ_q): (i)` is the classical statement that `Π_{χ mod q} L(s,χ)` has at most one zero near 1, a simple real zero of a real character (compare the conductor-uniform Dirichlet region of Layer 0). The region contains at most one zero; it is not claimed zero-free, so no unconditional statement may drop `β₁`.

See [67][R67], §1.3.2, Theorem 1.3.5 and Corollary 1.3.6, p. 16; §4.1, Theorem 4.1.1, p. 69.

*Needs:* `B3`; §2.11; §2.29; §2.20; [ZerosOfLFunctions 5.4–5.6][R15].

### 2.44 Logarithmic functional equation

For the CM normal-closure family `F(E)` of §2.6, with the same degree-uniform constants, Use the canonical positive Artin conductor `f_ρ`, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. Write `Γ_R(s)=π^(−s/2)Γ(s/2), d=dimρ` and `Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^d L(s,ρ)`. Import `Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s), |w_ρ|=1`. Odd parity makes the gamma factors finite and nonzero at0 and1; boundary nonvanishing and the equation make `L_ρ(0), L_(ρ̄)(1)` finite and nonzero. Then `L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d((Γ_R′/Γ_R)(1)+(Γ_R′/Γ_R)(2))`. A general even factor would instead require a regularized derivative at0.

Use the same CM family and canonical full Euler-series continuation; endpoint germs are finite, nonzero and conjugation-compatible.

Integral Brauer and finite-order Hecke equations give the completed Artin identity with its arithmetic conductor and odd infinity type. Verify nonzero analytic endpoints, then differentiate. The Lean calculus adapter keeps the arithmetic conductor identification separate.

See [64][R64], Theorem 3.2 and proof of Corollary 3.3, pp.383–384.

*Needs:* `B3`; §2.6; §2.31; §2.18; §2.3; §2.18a; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2]; [ClassFieldTheory 7][R29]; `Complex.Gammaℝ`; §2.28; §2.28a; §2.31d; §2.31f.

### 2.45 Factorwise logarithmic derivative at one

For the CM normal-closure family `F(E)` of §2.6, with the same degree-uniform constants, For each `ρ∈F(E)`, import an integral monomial Brauer expression `χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j` with one-dimensional finite-order `ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g` and `[L^(H_j):Q]≤M_g`. Bound each Hecke analytic conductor (including the base-field discriminant) by `D_E^C_g`, with `D_E=|Disc(E)|`. For `δ_j=1` if `ψ_j` is trivial and0 otherwise, take the holomorphic, nonzero extension `H_j(s)` of `(s−1)^δ_j L(s,ψ_j)` at1. Prove `Σ_j n_jδ_j=0` and the local germ identity `L(s,ρ)=∏_j H_j(s)^n_j`. For each `ε>0` there exists `C_(g,ε)>0` with `|L′(1,ρ)/L(1,ρ)|≤C_(g,ε)D_E^ε`. Use the exact identity `L′(1,ρ)/L(1,ρ)=Σ_j n_j H_j′(1)/H_j(1)` and fixed-degree subpower bounds for these regularized Hecke logarithmic derivatives. The §2.31f supplies these bounds: Cauchy controls `H′`, and a separate cyclic product/residue argument controls `1/H(1)`.

Use the same finite family and normalization, with conductor-uniform regularized Hecke estimates and possibly ineffective constants.

Differentiate the regularized Brauer product at1. The nonzero-factor condition permits division and removes all principal parts by `Σ n_jδ_j=0`. Sum the individual Hecke logarithmic-derivative estimates using `Σ|n_j|≤B_g`, choosing the exponent to absorb the conductor comparison. This route supplies the ratio itself; general Artin holomorphy in a fixed-radius disc is not assumed.

See [64][R64], Proof of Corollary 3.3, p. 384; [64][R64], Theorem3.2 and proof of Corollary3.3, pp.383–384.

*Needs:* `B1`; §2.33; [RepresentationTheory/InductionRestriction 6][R30]; §2.31d; §2.31f.

### 2.46 Uniform subpolynomial Dedekind residues

For each `n≥1` and `ε>0` there are `c,C>0` depending only on `n,ε` such that `c*D_K^(-ε)≤κ_K≤C*D_K^ε` for every number field of degree at most `n`. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

Use bounded-degree Brauer–Siegel and the explicit positive residue formula. Uniformly bound roots of unity by degree and absorb the finite small-discriminant range.

See [64][R64], Tsimerman §§2–3, pp.380–384, uses the Brauer–Siegel input; the §2.31e above supplies the uniform result without normality.

*Needs:* §2.32; §2.5; §2.31e.

### 2.47 Eisenstein `Weyl` sums bounded by Dirichlet `L`-values

There is an absolute `C > 0` such that, for every `ε > 0`, every fundamental `D = d'd ≠ 1` with genus character `χ`, and every `s` with `Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}`. The paper prints the left side as '`Weyl(s,χ)`'.

Assume `d,d′` are coprime fundamental discriminants with fundamental product `D≠1`, and `s=1/2+it` for `t∈ℝ`.; `Weyl` is the three-branch class sum of DIT (5.12): `(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E(z,s)dμ` for negative factors, the boundary arc-length integral over `∂F_A` for positive factors (compared separately to `C_A`), and the CM point sum weighted by `1/ω_D` for mixed signs. The real branches use §2.1c's genus dictionary and boundary multiplicities, with §2.1b discharging the critical-line cusp hypotheses; the CM branch uses §2.1’s point adapter.; The implied constant depends only on `ε`; the height exponent `C` is absolute.

Apply the appropriate one of the three genus-period identities. Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and `|D|^(1/4+ε)` remain visible.

Checks: at `s=1/2` the negative-branch coefficient is `1/8`, while the uncompleted Eisenstein series itself vanishes; at `s=1/2+i` the coefficient is `5/8`; for `D=−4` the CM weight is `1/2`.

See [60][R60], (5.12), p.963, and (6.7), proof of Proposition 2, p.969.

*Needs:* `B2`; §2.35; §2.36; §2.37; [ZerosOfLFunctions Critical-line gamma quotient][R12]; §1.1.

### 2.48 Many split primes outside a small quadratic exception set

For `ε₁ > 0` and `X ≥ 2` there is `E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X}` with `|E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}`, such that for `F ∉ E` and `4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k))` with `σ₁ = max(1 − ε₁/(4c), 1/2)`. `E` consists of the `F` whose character `χ_{F/k}` has a zero with `ℜρ > σ₁, |ℑρ| ≤ X^{1/2}`; the proof is the explicit formula with Lemma 4.1.

Assume `k` is a number field of fixed degree `n, D_k` its absolute discriminant; quadratic `F/k` have relative discriminant `norm≤X; ε₁>0` and `X≥2`.; Take one positive degree-dependent `c` from the density theorem and `σ₁=max(1−ε₁/(4c),1/2)`. `E` is fixed before `Y` ranges over `4≤Y≤X`, and a single constant `C_{n,ε₁}` works for all eligible `k,F,X,Y`. All prime-ideal counts include the norm endpoint.

Select exceptional quadratic fields through the canonical primitive ray characters' zeros `σ₁<Reρ<1, |Imρ|≤√X`. Density at `Q=X,T=√X`, with exponent small relative to `ε₁` and degree-bounded infinity types, gives `#E≪_(n,ε₁)D_k^ε₁X^ε₁`. Outside `E, (1+χ(𝔭))/2` selects unramified split primes. Apply smoothed ideal Perron with weight `1−N𝔞/Y` and kernel `Y^s/[s(s+1)]`. Shift at safe heights, retaining all zeros and double-pole residues at `0,−1`; LOW Lemma4.1 supplies the unit-height count/local logarithmic derivative, not integrability on every vertical line. At `T=√X`, high/low zeros cost `O_n(Ylog(XD_kT)/T)` and `O_(n,ε₁)(Y^σ₁log(XD_kT))`, using `Y≤X`. Supply the Iwaniec–Kowalski estimates, safe heights and residue calculations. Quantitatively discard ramification/higher powers and partially sum off `logN𝔭`, giving1/8 with one uniform error constant beyond qualitative PNT transfer.

The same set `E` and one degree/`ε₁`-dependent constant work simultaneously for every `4≤Y≤X`; allowing `Y`-dependent constants would make the target empty. When `X<4` there are no eligible `Y`, but the exceptional-set cardinality assertion is still required. The source weights all prime powers before transferring to split unramified primes; its1/8 main factor cannot be replaced by1/2 without a separate argument.

See [66][R66], Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19; [66][R66], §4, Lemma4.3 and full proof, pp.20–22.

*Needs:* §2.38; §2.7; §2.11; [ArithmeticDirichletSeries 4][R8]; [ArithmeticDirichletSeries 6][R1]; [ArithmeticDirichletSeries 5][R7]; §2.20.

### 2.49 Effective Chebotarev density theorem

Let `L/F` be a finite Galois extension, `G` its group, `n=[L:ℚ]>1, D=|Disc L|` and `C` one conjugacy class. Count unramified prime ideals of `F` with `norm≤x` and arithmetic Frobenius in `C` by `π_C(x)`. There is at most one `ζ_L` zero in `Re s≥1−1/(4 log D), |Im s|≤1/(4 log D)`; if present it is a simple real `β₀`. For `x≥exp(10n(log D)²)`, prove `|π_C(x)−(|C|/|G|)Li(x)|≤(|C|/|G|)Li(x^β₀)+C₁x exp(−C₂ √(log x/n))`, omitting the `Li` term when there is no exceptional zero; `C₁,C₂>0` are effective absolute constants. A bound with this `Li` term absorbed requires a separate zero-separation estimate and an enlarged range; no field-uniform absorption at the displayed threshold is asserted. Under DedekindERH `L` the error is `O(x^(1/2)log(Dx^n))` for `x≫(log D)²`. Some unramified degree-one prime in `C` has `norm≪D^B` with effective absolute `B>0`; under DedekindERH it has `norm≪(log D)²`. The degree-one field `L=F=ℚ` is covered separately by the rational prime estimates, with the conditional least-prime bound written using `max(1,log D)²`.

Assume `L/F` finite Galois; `C` a conjugacy class of `Gal(L/F)`.; (ii) and the conditional part of (iii) assume DedekindERH `L`.; Ineffective and effective constants are distinguished in `(i)`.

For `g∈C, H=⟨g⟩` and `E=L^H`, use Chebotarev8,11–12's cyclic fixed-field fibre count and contraction/ramified/higher-degree errors. The remaining degree-one count is the abelian `L/E` problem at `g`. Express it as a Hecke-character average of `−L′/L`, apply ADS6 truncated Perron and shift. Use `ζ_L=∏χLχ, N(T)≪Tlog(D_LT^n_L)` and this layer's region, retaining `β₁`; optimize `T` for `(i)`, or insert `Reρ=1/2` for(ii). For(iii) additionally prove near-one density and Lagarias–Montgomery–Odlyzko power-sum repulsion. Absorb `Li(x^β₀)` only after a quantitative gap enlarges the `x`-range. Separate `D=1` before dividing by `logD`.

`F = ℚ, L = ℚ(ζ_q): (i)` is a prime number theorem in progressions with error `x exp(−c (log x/φ(q))^{1/2})` for `x ≥ exp(10 φ(q) (log D_L)²)`, much weaker in `q` than Siegel–Walfisz, as Zaman notes after (1.18). Dropping the error terms recovers Tau Ceti’s `tendsto_frobeniusPrimeCount`; no qualitative statement is restated. The exceptional zero is named, never assumed absent.

See [67][R67], §1.2, equations (1.18), (1.20), (1.21), pp. 7–8; [78][R78], §1.1, Theorems A and B, p.2 of arXiv:1709.09637; Theorem B (1.3)–(1.4) retains the exceptional-zero term.

*Needs:* `B3`; §2.43; §2.42; §2.20; [Chebotarev 8][R46]; [Chebotarev 11][R45]; [Chebotarev 13][R43]; [ArithmeticDirichletSeries 6][R1].

### 2.50 Two-sided quadratic Hecke value bound

Let `E` be a CM number field, `F` its maximal totally real subfield, `[F:ℚ]=g≥1`, and `η=η_E/F` the canonical nontrivial primitive quadratic Hecke character. Write `D_K=|Disc(K)|, f_η` for its finite conductor, and `Q=D_F N(f_η)=D_E/D_F`. For each fixed `g` and `ε>0, D_E^(-ε) ≪_(g,ε) L_f(1,eta_E/F) ≪_(g,ε) D_E^ε`. Constants may be ineffective. Use `kappa_E/kappa_F`, the degree bounds 2g and `g`, and `D_F≤D_E^(1/2)`, choosing each residue exponent at most `2*ε/3`.

Apply the positive residue quotient and both residue bounds with exponent `≤2ε/3`. Use `D_F≤D_E^(1/2)` to keep the total exponent `≤ε`.

See [64][R64], Derived residue-quotient adapter for Tsimerman, Corollary 3.3, p.384; positivity and the conductor comparison are separate inputs.

*Needs:* `B4`; §2.46; [ClassFieldTheory 13][R28]; §2.31f.

### 2.51 Subpolynomial logarithmic derivative at one

Let `E` be a CM number field, `F` its maximal totally real subfield, `[F:ℚ]=g≥1`, and `η=η_E/F` the canonical nontrivial primitive quadratic Hecke character. Write `D_K=|Disc(K)|, f_η` for its finite conductor, and `Q=D_F N(f_η)=D_E/D_F`. For each fixed `g` and `ε>0, |L_f prime(1,η)/L_f(1,η)| ≪_(g,ε) D_E^ε`. Apply the derivative bound with `ε/2` and the reciprocal value bound with `ε/2`. The latter, rather than Cauchy, is the possible ineffective input.

Apply the derivative estimate with `ε/2`. Multiply by the reciprocal positive-value estimate with `ε/2`.

See [64][R64], Derived quotient adapter for Tsimerman, Corollary 3.3, p.384; use both the derivative bound and the separately proved positive value lower bound.

*Needs:* §2.34; §2.50; [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27]; §2.31f.

### Proof-route checks

- **Artin comparisons:** retain inertia conjugacy, finite-order spectrum, coefficient-convolution convergence and ramified Mackey/Frobenius cyclic blocks; RepresentationTheory supplies integral induced-linear Brauer.
- **Fixed degree:** §2.31d, §2.31e, §2.31f give residues, Brauer–Siegel and CM value/reciprocal/derivative estimates. The lower endpoint uses `κ_N/κ_K`, not Cauchy. §3.3–3.4 supplies divisor domination. In a quadratic CM extension retain `D_F≤√D_E, Q=D_E/D_F`, odd parity, positivity, a full Cauchy circle and cancellation of trivial-factor orders.
- **Quadratic periods:** use §2.1c's real genus dictionary, Nielsen surfaces and multiplicity-preserving boundary maps, and §2.1b's Eisenstein cusp estimates. Complete the imaginary prime-discriminant/genus dictionary, half-unit CM adapter and §2.1’s general-eigenfunction Stokes comparison before the negative-factor period; its critical-line boundary integral differs from the divergent `Re s>1` area integral. Retain the Gross–Zagier normalization source boundary. For §2.13 first prove the regulator/norm-minus-one dichotomy before narrow/ordinary conversion.
- **Residues / primes:** §2.15a includes Louboutin's imaginary-quadratic exception and `log`-convexity; convexity independently gives the weaker subpower upper bound in the lower-residue chain. §2.9a retains all four Zaman cases, integer `ℓ` rounding and35/19 loss under `ZamanDigammaInput`. Family Hecke density and the multiplicity-sensitive local logarithmic derivative down to `Re s=−3/2` remain source boundaries. Smoothed Perron uses `Y^s/[s(s+1)]`, safe contours, all residues and low/high zeros; discard ramification/higher powers before split-prime counting.
- **Genus / completion:** §2.10's generator, squarefree radicand, total complexity, subset/complement and prime-to-`D` Kronecker dictionaries precede genus products. §2.16 needs the odd character/conductor and Gamma duplication to force `root+1`; modulus 1 does not fix sign. Retain regulator/embedding/unit normalization before residues.
- **Canonical characters:** identify ray/idele/Hecke continuations, Artin/analytic conductors and CM real reciprocity before comparisons; fixed-field equations do not imply uniform convexity.
- **Gamma / deleted factors:** retain the discriminant normalization with `Γ_C`, exact negative-even order `r₁+r₂` by positivity, and deleted-factor equality continued from convergence (§§2.16,2.19,2.29).
- **Finite CM family:** use integral Brauer/`B_g` and §2.31d's degree/dimension/conductor budgets with `M_g=(2g)!`; §2.31f regularizes `H_j=(s−1)^δ_jL_j` and cancels `Σn_jδ_j` before evaluation. Family membership and bounded Colmez coefficients are downstream obligations, not inputs (§§2.6,2.33,2.44–45).
- **Effective Chebotarev:** prove the abelian Hecke explicit formula, uniform Dedekind zero count and Deuring–Heilbronn least-prime repulsion. Retain `Li(x^β₀)` until quantitative separation permits absorption on its enlarged range. Zaman's weighted route supplies least-prime zero-count/power-sum/repulsion contracts; it does not prove the field-uniform counting estimate's separate explicit-formula contract (§2.49).

### Examples

For `ℚ(i)`, the Dedekind residue is `π/4`, the quadratic character has conductor 4, its root number is 1, and its values are `L(1)=π/4` and `L(0)=1/2`. The corresponding CM unit factor is `ω₋₄=2`. For `ℚ(√−3), ω₋₃=3`. In a totally real field the negative-even trivial-zero order is its degree; in an imaginary quadratic field it is one. A trivial Artin representation has local polynomial `1−T` and a simple pole at 1; the zero-dimensional representation has local polynomial 1 and `L`-function 1.

### Dependencies

LFunctions Layers 1 and 5–7; GlobalNumberFields Layers 2, 9, 10 and 11; ClassFieldTheory Layers 7, 11 and 13; NumberFieldArithmetic Layers 1, 2 and 7; InductionRestriction Layers 3 and 6; LocalFieldsRamification, with Tau Ceti's lower ramification groups and different exponent; FuchsianOrbifolds Layers 2–3 and 6; DifferentialGeometry Layers 5 and 12; IntegralLattices Layer B, B2/B4/B5. The K-Bessel kernel, Eisenstein series, Nielsen surfaces, Artin conductors, unitary Hecke continuation, Artin `L`-functions and the CM completion are targets of this layer (§§2.1a–2.1c, 2.2a, 2.3a, 2.18a, 2.22a). Analytic inputs are the Gamma and explicit-formula targets of Layer 1 and the zero-free estimates of Layer 0.

## Layer 3: Multiplicative means, smooth numbers and moments

Separate arithmetic coefficient bounds from mean-value theorems. The logarithmic-derivative coefficient class is not the class of all bounded multiplicative functions. The smooth-number and Beurling theories use actual indexed counting functions. Proven second and fourth moments are distinct from the general moment conjecture and its model constants.

### 3.1 Explicit divisor subpower bound

For `ε>0` and any natural `B≥exp(1/ε)`, all positive integers `n` satisfy `τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε`. Thus the displayed constant is at least 1 and independent of `n`.

Set `D=max(1,(ε log 2)⁻¹)`. Apply the local uniform bound to each prime `p≤B`. For `p>B`, the assumed cutoff implies `exp(1/ε)≤p`; apply the large-prime bound. Apply divisor-bound-from-local-bounds. An upper integer `B` is a permitted input: no exact ceiling evaluation is required.

`n=1` is covered. `B` may be increased without invalidating the estimate. The constant depends only on `ε` and the chosen `B`, never on `n`.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* `Real.log_pos`; `Real.log_le_log`; `Real.add_one_le_exp`; `Real.rpow_def_of_pos`; `Real.le_log_iff_exp_le`; `Nat.card_divisors`; `Nat.prod_primeFactors_pow_factorization`; `Nat.prime_of_mem_primeFactors`; `Finset.prod_le_prod`; `Real.mul_rpow`; `Real.rpow_mul`; `Real.rpow_natCast`; §3.1a; §3.1b; §3.1c.

**§3.1a Uniform prime-power divisor bound.** For `ε>0`, integers `p≥2` and `a≥0`, put `D=max(1,(ε log 2)⁻¹)`. Then `a+1≤D p^(aε)`. `D` is notation for a real expression, not a new carrier.

Logarithm monotonicity gives `log p≥log 2>0`. Thus `D≥1` and `D ε log p≥1`. Multiply the latter inequality by `a≥0` and add `1≤D` to obtain `a+1≤D(1+aε log p)`. Use `1+t≤exp t` and `p^(aε)=exp(aε log p)`.

**§3.1b Large-prime divisor factor bound.** For `ε>0`, positive integer `p` and `a≥0, exp(1/ε)≤p` implies `a+1≤p^(aε)`.

Apply the exponential/logarithm equivalence to get `ε log p≥1`. Multiply by a, add 1 and apply `1+t≤exp t`; identify the real power.

**§3.1c Divisor bounds from local factors.** Let `ε∈ℝ, D≥1` and `B∈ℕ`. Suppose for every prime `p` and `a∈ℕ` that `a+1≤D p^(aε)` if `p≤B`, and `a+1≤p^(aε)` if `p>B`. For each `n>0, τ(n)≤D^B n^ε`, with `τ(n)=card(n.divisors)`.

Write `τ(n)=∏_(p|n)(a_p+1)` by `Nat.card_divisors` and `n=∏_(p|n)p^a_p` by factorization. Split at `p≤B`, multiply nonnegative local bounds and identify the power product using `Real.mul_rpow`/`Real.rpow_mul`. There are at most `B` small prime divisors, so `τ(n)≤D^r n^ε≤D^B n^ε`.

### 3.2 Largest prime factor of a quadratic conductor

`largest_prime_factor_quadratic_conductor`: assume `SchoenfeldFiniteRangeInput` and `QuadraticConductorFiniteInput`. If `N>1` is the conductor of a primitive quadratic character, then `P(N)>0.94*log(N)`, where `P(N)=max{p:p prime,p|N}`.

- `QuadraticConductorFiniteInput`: `P(N)>0.94log N` for every conductor `1<N<12000000000` of a primitive nonprincipal quadratic character. Source: [47][R47], Lemma 7.3 and its proof, p.375.

For `N≥12000000000`, the fundamental-discriminant description gives `log N≤θ(P(N))+2log2`, and §0.3 reduces the claim to `(log N−2log2)/1.000081>0.94log N` at the threshold and beyond.

See [47][R47], Lemma 7.3, p. 375.

*Needs:* `DirichletCharacter.conductor`; §0.3; `Chebyshev.theta`.

### 3.3 Uniform coefficient bound by a divisor function

For a degree-`n` number field `K, n≥1`, let `a_K(m)` count nonzero integral ideals of `norm m`. For each `m≥1, a_K(m)≤d_n(m)`, where `d_n` counts ordered `n`-tuples of positive integers with product `m`. At each rational prime the Euler factor product over `p`-adic prime ideals `(1-T^f_i)^(-1)` is coefficientwise bounded by `(1-T)^(-n)`, since `f_i≥1` and the number of factors is `≤n`; multiply over primes.

See [64][R64], Elementary Euler-factor adapter for Tsimerman §2.2, pp.380–381; count split prime-power exponents and compare with `d_n`.

*Needs:* `Ideal.absNorm`; `Nat.factorization`.

### 3.4 Subpolynomial fixed-order divisor function

For each integer `n≥1` and `ε>0` there is `C_(n,ε)` with `d_n(m)≤C_(n,ε)*m^ε` for every `m≥1`. Use `d_n(p^a)=binomial(a+n-1,n-1)`. For large `p` this is `≤n^a≤p^(ε*a)`; for the finitely many smaller primes the supremum of the polynomial in a divided by `p^(ε*a)` is finite. The product of those finitely many constants is independent of `m`.

See [64][R64], Elementary fixed-degree adapter for Tsimerman §2.2, pp.380–381, using the small/large-prime split of the divisor bound.

*Needs:* `Nat.factorization`.

### 3.5 Products of distinct medium primes

For `x≥2` and `m≥0, N_m(x)` is the finite set of natural products over `m`-element subsets of `{p prime:x/2≤p≤x}`. `N_0(x)={1}`; subsets are unordered and primes are distinct.

For the inclusive prime set `P_x`, take products of its `m`-element subsets. `Nat.primeFactors_prod` recovers the subset, so the product map is injective; finite-image and `powersetCard` cardinalities give the count. Empty products give 1. The recovered prime support also gives squarefreeness and size bounds.

- `medium_prime_products.membership`: `n∈N_m(x)` iff `n` is a product of an `m`-element subset of primes in `[x/2,x]`.
- `medium_prime_products.card`: Unique factorization gives `#N_m(x)=binomial(#{p prime:x/2≤p≤x},m)`.
- `medium_prime_products.squarefree`: Every element is squarefree with exactly `m` prime factors.
- `medium_prime_products.support`: Every prime factor lies in the closed interval `[x/2,x]`.
- `medium_prime_products.zero`: For each `x≥2, N_0(x)={1}`.
- `medium_prime_products.size_bounds`: For `x≥2, m≥0` and `n∈N_m(x), (x/2)^m≤n≤x^m`, with the natural `n` cast to the reals.

**Checks.**

- `N_0(10)={1}`.
- `N_1(10)={5,7}`.
- `N_2(10)={35}` and `N_3(10)=∅`.
- `25∉N_2(10)`, excluding repeated primes and ordered-tuple multiplicity.
- `N_1(4)={2,3}`; the prime 2 at the lower endpoint is included.

See [50][R50], §3.6, definition immediately preceding (3.4), p.26.

*Needs:* `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`.

### 3.6 Inverse-totient counting input

For real `x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x)`, with an absolute constant.

Use the original inverse-totient counting theorem, with positive integers and `φ(d)≤x`. No implication is made from a pointwise lower bound on `φ` alone.

See [80][R80], Introduction pp.143–145; stated effective theorem p.145.

*Needs:* `Nat.totient`.

### 3.7 Maximal-order divisor upper bound

For each real `ε>0` there is a natural `K>e` such that for every natural `n≥K, τ(n)≤exp((log 2+ε)log n/log log n)`. This is the upper bound; no matching lower-order limit is asserted here.

Put `δ=ε/(4log2+2ε)∈(0,1)`, so `log2/(1−δ)≤log2+ε/2`. Set `L=log n`, `y=L^(1−δ)` and increase the natural threshold until `L≥e,y≥2` and §3.7c applies with `η=ε/2`. Factorization gives `logτ(n)=Σ_(p|n)log(v_p(n)+1)`. §§3.7a,c bound the small-prime part by `εL/(2log L)`; §3.7b bounds the large part by `(log2)L/((1−δ)log L)`. Add and exponentiate. The uniform subpower theorem is not an input.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Exercise2.9(b),(e),(f), pp.33–34, `k=2`; [50][R50], arXiv v3, proof of Lemma 3.1, p. 18, citing [18, §18.1, Theorem 317] (Hardy–Wright, sixth edition); subpower use in the proof of Lemma 12.3, p. 60.

*Needs:* `Nat.prime_of_mem_primeFactors`; `Nat.prod_primeFactors_pow_factorization`; `Real.log_pow`; `Real.log_le_log`; `Real.log_prod`; `isLittleO_log_rpow_rpow_atTop`; `Real.log_rpow`; `Nat.card_divisors`; `exists_nat_ge`; §3.7a; §3.7b; §3.7c.

**§3.7a Small-prime divisor logarithm.** For a natural `n≥2` and real `y≥2, Σ_{p∈primeFactors(n), p≤y} log(v_p(n)+1) ≤ y log(1+log n/log 2)`.

Since `p^v_p(n)|n` and `p≥2`, `v_p(n)≤log n/log2`. Bound each summand by `log(1+log n/log2)` and use at most `⌊y⌋` prime divisors.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Exercise2.9(b),(e),(f), pp.33–34, `k=2`.

**§3.7b Large-prime divisor logarithm.** For a natural `n≥2` and real `y>1, Σ_{p∈primeFactors(n), y<p} log(v_p(n)+1) ≤ (log 2)log n/log y`.

Induction gives `a+1≤2^a`, hence `log(a+1)≤a log2`. Factorization gives the nonnegative sum `Σ_(p|n)v_p(n)log p=log n`. Its large-prime part satisfies `log y Σv_p(n)≤log n`; divide by `log y>0`.

**§3.7c Vanishing small-prime contribution.** For real `0<δ<1` and `η>0` there is `L₀≥e` such that for every real `L≥L₀, L^(1−δ)log(1+L/log 2) ≤ η L/log L`.

For large `L`, `log(1+L/log2)≤C log L`. Dividing by `L/log L>0` bounds the ratio by `C(log L)²/L^δ→0`, using `isLittleO_log_rpow_rpow_atTop` at `r=2,s=δ`. Increase the threshold to `e`.

### 3.8 Even von Mangoldt function

`Λ_even(n)=ArithmeticFunction.vonMangoldt(|n|)` for `n∈ℤ`, including `Λ_even(0)=0`.

- `even_von_mangoldt.nat`: For positive `n` this is the von Mangoldt value.
- `even_von_mangoldt.neg`: `Λ_even(−n)=Λ_even(n)`.
- `even_von_mangoldt.zero`: `Λ_even(0)=0`.

**Checks.**

- `Λ_even(0)=0`.
- `Λ_even(−2)=log 2`.
- `Λ_even(−8)=log 2; Λ_even(−6)=0`.

See [58][R58], §3.1, definitions preceding Corollary3.3, p.691.

*Needs:* `ArithmeticFunction.vonMangoldt`.

### 3.9 Coprime Möbius sums weighted by `log t/t`

For each `A>0`, uniformly in positive integers `q≤T^4` and real `T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A)`.

Use a coprimality Euler factor and a conductor-uniform Möbius PNT. Prove `q≤T^4` uniformity with a sufficiently large logarithmic power before replacing it by A.

See [58][R58], Equation(3.6), proof of Lemma3.11, p.699.

*Needs:* `ArithmeticFunction.moebius`.

### 3.10 Gamma Euler-product truncation

For fixed `n∈ℕ` and real `x≥e²`, define `γ_n(p)=1−1/p+(1+1/(p−1))^n/p` for each rational prime `p`. The convergent product over `p>log x` is `1+O_n(1/log x)`, uniformly after retaining any subset of those primes. In particular `γ_0(p)=1`; the equivalent expression `p^(n−1)/(p−1)^n` uses an integer exponent `n−1`, never truncated natural subtraction.

For `p>log x≥2`, use `0<1/(p−1)<1` and the finite binomial expansion to obtain `1≤γ_n(p)≤1+K_n/(p(p−1)); n=0` gives equality 1 directly. For any finite prime subset in this range, `0≤Σlog γ_n(p)≤K_nΣ_{k>log x}1/(k(k−1))≤2K_n/log x`. Exponentiation bounds the finite product minus 1 by a constant depending only on `n` divided by `log x`. Pass from finite products to the convergent product using the summable nonnegative logarithms. Apply Mathlib `Real.hasProd_of_hasSum_log` and `Real.rexp_tsum_eq_tprod` to these positive factors and their summable nonnegative logarithms; the finite bound is uniform in the retained subset.

`n=0` gives product `1; n=1` has local factor `1+1/(p(p−1))`. For any retained subset, the product is at least 1 and obeys the same upper error bound, with no subset-dependent constant. At `x=e²` the tail excludes the prime 2; no strict inequality is applied at `1/(2−1)=1`.

See [58][R58], Lemma4.5 and full proof, pp.708–709.

*Needs:* `Nat.Prime`.

### 3.11 Size of `1/φ(n)` and of the divisor function (3.7)

For `n≥3, 1/φ(n)≤C log log n/n`, with an absolute `C>0`.

`Nat.totient_eq_mul_prod_factors` gives `n/φ(n)=∏_(p|n)(1−1/p)^−1` for `n≥3`. Split at `y=log n`. Mertens bounds the small-prime part by `O(loglog n)`. The `r` larger prime divisors satisfy `y^r≤n`, hence their `log` product is at most `2r/y≤2/log y`, using `−log(1−1/p)≤2/p`. Absorb the finite range `n≥3` below the threshold in `C`.

See [58][R58], Equation(3.7), p.699; cited Montgomery–Vaughan Theorem2.9.

*Needs:* §0.26; `Nat.totient_eq_mul_prod_factors`.

### 3.12 Coprime Möbius sums weighted by `1/t`

For each `A>0`, uniformly in positive integers `q≤T^4` and `T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A)`.

Use the same uniform coprimality Euler factor argument as the logarithmic sum, with one extra partial summation.

See [58][R58], Equation(3.6), proof of Lemma3.11, p.699.

*Needs:* `ArithmeticFunction.moebius`.

**§3.12a Compact-parameter multiplicative transfer.** Fix a compact parameter set `Z`, an integer `k≥1` and a family of coprime-multiplicative functions `f_z` with `|f_z(n)|≤τ_k(n)`. Suppose `α(z)` is bounded and, for every `A>0, Σ_{p≤x}f_z(p)log p=α(z)x+O_A(x/log^A x)`, uniformly in `z∈Z`. Put `Q_z(s)=(s−1)^{α(z)}Σ_n f_z(n)n^(−s)`, with the logarithm real on `s>1`. For each `J≥1`,
`Σ_{n≤x}f_z(n)=x Σ_{j<J} q_j(z)(log x)^{α(z)−j−1}/Γ(α(z)−j)+O_(Z,k,J)(x(log x)^{Re α(z)−J−1}),`
where `q_j` are the Taylor coefficients of `Q_z(s)/s` at1, understood through its smooth right-half-plane extension. All constants are fixed before `z` and `x`. If `f_z` is analytic in `z` on a neighbourhood of a closed disk and has the same uniform bounds there, `q_j` are analytic on its interior; the remainder is analytic in `z` for each fixed `x`. A weaker error `O(x/log^B x)`, for any prescribed `B`, also suffices for the coefficient application below.

Use [Granville–Koukoulopoulos][R81], Theorem 1 pp.2–3, §2 Lemmas 2–3 pp.3–7, §3 pp.7–10; compare Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem 13.2 pp.134–139 at `Q=2`. Arbitrary prime-error exponents give arbitrarily many terms; constants depend only on divisor bounds, derivative count and uniform prime errors. Factor the square-full remainder (normal convergence on `Re s>1/2`), integrate prime errors for `Q`’s closed-half-plane derivatives, and use Cauchy for Taylor remainders. Smooth at relative width `1/T` with `|ψ^(j)|≤C_jT^j`. Repeated Mellin integration bounds `|t|≥1` by prime-error derivatives and `|t|≤1` by Taylor terms. Evaluate via twice-integrated Perron/Gamma–Laplace, remove smoothing by the short-interval divisor majorant and remove the logarithmic weight by parts. Choose the prime-error exponent after all derivative indices. This gives the compact-`Z` uniformity.

Here `f_z(p^a)` is bounded by a fixed power of `a+1`, or vanishes for `a≥2` with `|f_z(p)|≤R`; choose `k≥max(1,R)` for divisor domination. Higher-power logarithms converge normally for `Re s>1/2` by `Σ_pp^−2σ<∞`, after separating finitely many small primes. Keep small-prime factors finite analytic factors even when they vanish; fixed-modulus nonvanishing fixes the remaining branches near 1.

API: `multiplicative_transfer.uniform_expansion`, `.residual_coefficients`, `.analytic_parameter`, `.positive_residue` (positive real Euler factors), `.strict_cutoff` (one endpoint has weight `O`(`τ_k`(floor `x`)) and is absorbed). Checks: `f=1` gives `x+O(1); f=μ` has `α=−1` and every displayed main term vanishes; a squarefree indicator has local factor `1+p^(−s)`, distinct from the unrestricted factor; `α=0` is permitted and uses reciprocal Gamma's zero, not division by its totalized value.

*Needs:* §0.32; `Complex.Gamma_eq_integral`; the fixed-parameter Gamma–Laplace change of variables in Granville–Koukoulopoulos Lemma3 p.7; [ArithmeticDirichletSeries layer6][R1]; §3.1.

**§3.12b Eisenstein norm criterion.** For a positive integer `m`, there exist `a,b∈Z` with `m=a²−ab+b²` iff every prime `p≡2` mod3 has even valuation in `m`. The criterion includes `p=2`. This is a local arithmetic adapter for the exceptional-family counts, not the Gaussian criterion or a new general quadratic-field roadmap.

Use `E={a+bω:a,b∈ℤ}`, `ω²+ω+1=0`, `Imω>0`, with multiplicative norm `a²−ab+b²`, zero only at 0. Rounding quotient coordinates leaves `|u|,|v|≤1/2` and `norm≤3/4`, making `E` Euclidean; consume generic PID/UFD theory. For `p≡2 mod3`, `T²+T+1` has no root in `𝔽_p` (nontrivial roots have order 3; check `p=2` directly), so `E/(p)` is a field and norm valuations at `p` are even. For `p≡1 mod3`, choose a nontrivial cube `root r` in `𝔽_p×`; `gcd(p,r−ω)` is a proper nonunit divisor: reduction `ω↦r` excludes a unit, while the coefficient `−1` excludes divisibility by `p`. Its norm divides `p²` and is neither 1 nor `p²`, hence is `p`. Finally `N(1−ω)=3` and `N(p)=p²` for inert primes. Multiplying rational prime factors proves both directions, including `p=3`.

API: `eisensteinNorm.mul`, `.euclidean_remainder`, `.inert_prime`, `.split_prime_norm`, `.represented_iff_even_inert_valuation`, `.shifted_witness_iff`. Checks: 2 is excluded; `3=2²−2·1+1²` is represented; `7=3²−3·1+1²` is represented; `4=2²` is represented despite its inert prime; `m=0` is a separate represented value and is excluded from the valuation iff. This derivation supplies the arithmetic input used in Ghosh–Sarnak, [82][R82], exceptional families p.3 and §4.1 pp.12–13; it does not attribute the Euclidean proof to that application.

*Needs:* `Complex`; `EuclideanDomain`; `Nat.factorization`; finite-field multiplicative-group cyclicity.

### 3.13 Landau–Ramanujan count of sums of two squares

The signature `landau_ramanujan` uses `sumsOfTwoSquaresCount` and specifies the positive constant by its convergent Euler product.

For `K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K` with the positive Landau–Ramanujan constant `C_L`.

Assume `K` tends to infinity through positive real cutoffs; `u,v` are integers and represented integers are counted once, not by representation multiplicity.

Convert integer-square witnesses to natural-square witnesses and use the `Nat.eq_sq_add_sq_iff`; no new arithmetic representation criterion is planned. For the 0/1 indicator `b`, the Euler factors are `(1−p^(−s))^(−1)` for `p=2` or `p≡1` mod4, and `(1−p^(−2s))^(−1)` for `p≡3` mod4. Thus `B(s)²=ζ(s)L(s,χ_−4)(1−2^(−s))^(−1)∏_{p≡3 mod4}(1−p^(−2s))^(−1)` on `Re s>1`. Use fixed-modulus Siegel–Walfisz to verify the weighted-prime input (13.1) with `κ=1/2; b≤1` satisfies (13.2). Apply the missing Selberg–Delange interface of Theorem13.2 and evaluate `c₀/Γ(1/2)`. The compact-parameter transfer above gives this specialization. At `s=1` the residual value is positive; absolute summability of `p^(−2)` and the positive logarithmic branch give the displayed convergent product.

`C_L=(1/√2)∏_{p≡3 mod4}(1−p^(−2))^(−1/2)`, with a convergent positive product; using `L(1,χ_−4)=π/4` and `Γ(1/2)=√π`. At `K=1` the count is1; at `K=5` it is4 `(1,2,4,5)`. The count at `K=3` is2, so3 is excluded. `9=0²+3²` is counted: the forbidden prime3 may occur to an even power. Counting only integers supported on `p=2` or `p≡1` mod4 would fail this test.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); Koukoulopoulos, *The Distribution of Prime Numbers*, Chapter13, (13.1)–(13.2), Theorem13.2 pp.130–134 and Exercise13.4 p.140; [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* `Nat.eq_sq_add_sq_iff`; §0.32; §3.12a.

### 3.14 Landau upper bound for shifted Eisenstein norms

For real `K≥2`, the count of positive integers `k≤K` with `4(k−1)=u²+3v²` for some integers `u,v` is at most `C K/√log K` for one absolute `C>0`; the `k=1 norm`-zero case is counted once.

Put `m=k−1≥0`. The equation forces `u` and `v` to have the same parity. The integral change `a=(u+v)/2, b=v` gives `m=a²−ab+b²`, and conversely `u=2a−b, v=b`. For positive `m` use the exact Eisenstein-norm criterion: every prime `p≡2` mod3 has even valuation, including `p=2`. Use the separate Eisenstein criterion above. Apply the fixed-modulus multiplicative-mean theorem with `κ=1/2`, supplied prime distribution, and the positive residual Euler factor. More precisely, the positive-norm count is asymptotic `C_E X/√log X`, where `C_E=(2√3)^(−1/2)∏_{p≡2(3)}(1−p^(−2))^(−1/2)`. Its squared Euler series is `ζ(s)L(s,χ_−3)(1−3^(−s))^(−1)∏_{p≡2(3)}(1−p^(−2s))^(−1); L(1,χ_−3)=π/(3√3)` evaluates the constant. The norm-zero case contributes1 and the shift by1 preserves this asymptotic and the stated upper bound.

`k=1` and2 are counted (norms0,1). `k=3` is excluded because2 has odd valuation at the inert prime2. `k=4` is counted `(u,v)=(3,1)`, although `k−1=3` is not a sum of two integer squares. `k=5` is counted `(u,v)=(4,0)`, exercising the even exponent of2.

See [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13; §8 p.24, arXiv:1706.06712v3.

*Needs:* §0.32; §3.12b; §3.12a.

### 3.15 Elementary shifted-square count

`#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0)`, for `K≥1`.

For `K<4` the set is empty. For `K≥4`, replace each integer square witness by its nonnegative absolute value; `k↦u` is inverse to the injective map `u↦u²+4`. For an integer cutoff `N≥4, Nat.le_sqrt`' identifies the witness interval `0≤u≤Nat`.`√(N−4); Set.InjOn.ncard_image` and `Set.ncard_Iic_nat` give its exact cardinality `Nat`.`√(N−4)+1`. For a real cutoff use `N=floor K` and the real square-root comparison to get the displayed upper bound. The finite/real floor adapter is routine; the `k=4, u=0` point must be retained.

For integer `N`, the count is0 when `N<4` and `Nat`.`√(N−4)+1` when `N≥4`. At `K=3` the count is0; at `K=4` it is1; at `K=5` it is2; at `K=13` it is4 `(4,5,8,13)`. At `K=4` the bound is exactly1, so the square-zero case is included.

See [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13; §8 p.24, arXiv:1706.06712v3.

*Needs:* `Nat.le_sqrt'`; `Set.InjOn.ncard_image`; `Set.ncard_Iic_nat`.

### 3.16 Counts supported on half the reduced prime classes

Fix a positive modulus `M` and `R⊆(ZMod M)^×` with `2#R=φ(M)`; primes dividing `M` are excluded. Let `H` be the subgroup generated by `R`. For each fixed `a∈H` there are `C₁,C₂>0` and `X₀≥2`, depending only on `M,R,a`, such that for all `X≥X₀` the count of positive `ν≤X` with every prime factor lying in `R` modulo `M` and `ν≡a` mod `M` lies between `C₁ X/√log X` and `C₂ X/√log X`. If `a∉H`, that count is0. The empty factorization of `ν=1` is included only in the identity class.

Assume `M,R`,a are fixed before `X` tends to infinity; the exact half-cardinality condition is `2#R=φ(M)`, with no rounded integer division.; All prime factors are tested, including repeated factors and the primes dividing `M`, which are forbidden; `ν≥1`.

Use the unrestricted-power0/1 indicator with Euler factors `(1−p^−s)⁻¹` at allowed primes, not a squarefree indicator. Orthogonality selects `ν≡a` mod `M`; fixed-modulus Siegel–Walfisz gives `κ_χ=Σ_(r∈R)χ(r)/φ(M)`. `Reκ_χ=1/2` exactly when `χ|H=1`. Those twists agree on support and add for `a∈H`; all others have a strict gap for fixed `M,R`. Apply compact-parameter transfer to this finite family. Dirichlet nonvanishing and convergent higher powers give the untwisted positive residual: integrate the real prime discrepancy against1/(tlog `t`), then exponentiate its finite logarithmic constant. There are `φ(M)/#H` maximal twists, giving the positive coefficient/`#H`. Supported products lie in `H`, including `ν=1`; outside `H` the count is0.

For `M=4, R={1}, H={1}`; class3 has count0. Allowing arbitrary reduced classes would give a false positive count. For `M=4, R={3}, H={1,3}`; both classes have positive asymptotic-sized counts; the identity class includes `ν=1` and products of an even number of3 mod4 primes. 9 is allowed when `M=4,R={3}`, whereas3 is forbidden for `R={1}`; this distinguishes the unrestricted-support and squarefree indicators. The exact half-cardinality condition has no solution for `M=1` or2, since `φ(M)=1`; rounding `φ(M)/2` would falsely admit the empty prime family.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [82][R82], §8, Proposition8.1 and ensuing density discussion, pp.22–24; Koukoulopoulos, *The Distribution of Prime Numbers*, Chapter13 (13.1)–(13.2), Theorem13.2 pp.130–134.

*Needs:* §0.32; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; §3.12a.

### 3.17 Logarithmic weight of prime divisors

For each integer `N≥2, Σ_{p|N}(log p)/p≤log log N+C` for one absolute real `C`.

For `N≥e²` split the distinct primes at `X=log N≥2`. Apply Mertens’s first theorem to `p<X`; primes at the endpoint belong to the large-prime group. `Nat.prod_primeFactors_dvd` gives a positive squarefree kernel at most `N`. Apply `Real.log_prod` and `Real.log_le_log` to get `Σ_{p|N}log p≤log N`; no divisor-product equality with `N` is assumed. For `p≥X` use `1/p≤1/X`, so that `Σ_{p|N,p≥X}log p/p≤1`. Combine the groups; for `2≤N<e²` absorb the finite many values into `C`, retaining possible negative `log logN`.

`N=2` is included even though `log log2<0`; the constant must absorb that value. For `N=2^a` with `a≥1`, the left side islog2/2, independent ofa; primes must be counted distinctly. Prove the finite splitting identity first with an independent real `X`: for `N=6,X=2`, prime 2 lies in the `p≥X` part and the `p<X` part is empty. Then specialize `X=log N`.

See [83][R83], Proof of Proposition 5.2, p.27.

*Needs:* §0.11; `Nat.prod_primeFactors_dvd`; `Real.log_prod`; `Real.log_le_log`.

### 3.18 Pretentious distance

For complex-valued `f,g` on positive integers and `x≥1, D(f,g;x)=√(Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p)`, used under `|f(p)|,|g(p)|≤1`. This is a distance on prime data, not a metric on all multiplicative functions: `D(f,f;x)` can be positive if `|f(p)|<1`. The prime-data distance used in Halász’s theorem is `pretentiousDist`; prove its multiplicative triangle inequality for disk-valued functions.

Use finite primes `p≤⌊x⌋` and the real square root. Unit-disc values make every summand nonnegative; finite sums and square-root laws give evaluation, symmetry, prime-data dependence and cutoff monotonicity. The squared-sum identity is §3.18b.

- `pretentious_distance.square`: `D²` is the displayed nonnegative finite prime sum under the unit-disc hypotheses.
- `pretentious_distance.symmetric`: `D(f,g;x)=D(g,f;x)`.
- `pretentious_distance.cutoff`: For `1≤x≤y` the squared distance is nondecreasing.
- `pretentious_distance.unit_diagonal`: If `|f(p)|=1` for `p≤x`, then `D(f,f;x)=0`.
- `pretentious_distance.prime_data`: Equal values on all primes `≤x` give equal distances.
- `pretentious_distance.triangle`: If `|f_j(p)|, |g_j(p)| ≤ 1` at every prime, then `D(f₁f₂, g₁g₂; x) ≤ D(f₁, g₁; x) + D(f₂, g₂; x)` (proof ingredient pretentious-product-triangle, from the unit-disc inequality `√(1 − Re(zw)) ≤ √(1 − Re z) + √(1 − Re w)`).

**Checks.**

- `D(1,1;x)=0`.
- `D(1,−1;x)²=2Σ_{p≤x}1/p`.
- `D(0,0;2)²=1/2`, disproving an unqualified metric diagonal axiom.
- `D(f,g;1)=0`.

See [84][R84], pp.2–4: M(x,T) on p.2 and weighted unit-disc product norm on pp.3–4.

*Needs:* `Nat.Prime`; `Real.sqrt`; §3.18a; §3.18b; §3.18c.

**§3.18a Triangle inequality for pretentious products.** For `|f_j(p)|,|g_j(p)|≤1, D(f₁f₂,g₁g₂;x)≤D(f₁,g₁;x)+D(f₂,g₂;x)`. If all `g_j` have unit modulus on the primes, this gives the usual triangle inequality for prime data.

Apply unit-disc-product-distance to `z=f₁(p)conj(g₁(p)), w=f₂(p)conj(g₂(p))` for each prime `p≤x`. Multiply by `√(1/p)`, sum the squares, and apply finite Cauchy–Schwarz to obtain the weighted Euclidean product triangle. For `D(f,h)≤D(f,g)+D(g,h)`, the intermediate `g` must have `|g(p)|=1` so `f(p)conj(g(p))g(p)conj(h(p))=f(p)conj(h(p))`. Do not impose a zero diagonal on arbitrary unit-disc functions.

See [84][R84], pp.3–4, inequality(5) and the unit-disc weight example.

**§3.18b Squared pretentious-distance formula.** Under the prime unit-disc hypotheses, `D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0`.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [84][R84], Weighted norm discussion pp3–4.

**§3.18c Unit-disc product distance inequality.** For complex `z,w` with `|z|,|w|≤1, √(1−Re(zw))≤√(1−Re z)+√(1−Re w)`.

Put `a=1−Re z` and `b=1−Re w`, so `a,b≥0` and `(Im z)²≤2a, (Im w)²≤2b` by the unit-disc assumptions. Then `1−Re(zw)=a+b−ab+(Im z)(Im w)≤a+b+2√(ab)=(sqrt a+sqrt b)²`. Both sides are nonnegative, so take square roots. This proves the extension from the unit circle without assuming it.

See [84][R84], p.4 first paragraph, extension of the η product inequality to the closed unit disc.

### 3.19 Logarithmic-derivative coefficient class

The definition `HalaszCoefficientClass` supplies the coefficient hypothesis for the Shiu and integral Halász signatures.

For `κ>0, C(κ)` is a predicate on the ArithmeticFunction `C`, with its fixed value `f(0)=0` and ordinary coprime multiplicativity `f(1)=1`. Membership is witnessed by an ArithmeticFunction `C` coefficient `b=Λ_f` with `|b(n)|≤κΛ(n)` for every `n`, including0,1. For each `Re s>1` the three series `F(s)=LSeries f s, LSeries b s` and `H(s)=LSeries (n↦b(n)/log n) s` are absolutely convergent, `F(s)=exp(H(s))`, and `−F′(s)/F(s)=LSeries b s`. Division at `n=0,1` is totalized to0, since `b(0)=b(1)=0`. This exponential identity fixes the Euler logarithm branch; it is not an arbitrary Prop field or an unrelated logarithm. Coefficient uniqueness follows from the logarithmic derivative and `LSeries` uniqueness, including the normalized zero coefficient.

Use `ArithmeticFunction ℂ` and its coprime multiplicativity. The concrete zero-extended witness `b` satisfies the majorant, three summability conditions and both analytic identities. Choice exposes `b`; `LSeries.eq_of_LSeries_eventually_eq` proves uniqueness at positive indices, with zero fixed separately. The exponential gives nonvanishing; the coefficient bound gives monotonicity in `κ`. Extensionality uses the underlying functions; the Checks compare their exact coefficients.

- `halasz_coefficient_class.log_coeff`: Given `h:f∈C(κ)`, expose the uniquely determined zero-extended arithmetic function `Λ_f` together with its summability and logarithmic-derivative identity. Any two membership witnesses choose the same `Λ_f`.
- `halasz_coefficient_class.majorant`: `|Λ_f(n)|≤κΛ(n)` for every `n`, hence they vanish away from prime powers.
- `halasz_coefficient_class.nonzero`: The Euler-compatible exponential identity gives `F(s)≠0` on `Re s>1`.
- `halasz_coefficient_class.mono`: If `κ≤κ′, C(κ)⊆C(κ′)`.
- `halasz_coefficient_class.log_coeff_unique`: If a zero-extended `b` has an absolutely convergent `LSeries` on `Re s>1` equal there to `−F′/F`, it equals the exposed `Λ_f`. The zero coefficient is fixed; `LSeries` itself ignores it.
- `halasz_coefficient_class.constructor`: Coprime-multiplicative `f` and a coefficient `b` with the stated majorant, three summability conditions, exponential identity and logarithmic-derivative identity produce membership in `C(κ)`, for `κ>0`.

**Checks.**

- The arithmetic function with `f(0)=0` and `f(n)=1` for `n≥1` belongs to `C(1)`, with `Λ_f=Λ`.
- `μ` belongs to `C(1)`, with `Λ_f=−Λ`.
- The arithmetic function with `f(0)=0` and `f(n)=n^(it)` for `n≥1` belongs to `C(1)`, with `Λ_f(n)=n^(it)Λ(n)`.
- `f(n)=n` belongs to no fixed `C(κ)`, since `|Λ_f(p)|=p log p`.

See [85][R85], §1 p.1, first three displayed series and definition of C(κ).

*Needs:* `ArithmeticFunction.IsMultiplicative`; `LSeries.eq_of_LSeries_eventually_eq`; `LSeriesSummable`.

### 3.20 Smooth-number counting function

For `x≥1,y≥2, Ψ(x,y)=#{1≤n≤floor x:every prime factor of n is≤y}`. Express the set using `Nat.smoothNumbers`(floor `y+1`); the carrier uses prime factors strictly below its cutoff. The representative inclusive count is `smoothCount`; compare it with the library’s strict prime cutoff.

Use `Nat.smoothNumbersUpTo ⌊x⌋ (⌊y⌋+1)`, with positive naturals and inclusive arithmetic cutoff. On `x≥1,y≥2`, strict prime cutoff is equivalent to `p≤y`. Floor monotonicity and finite inclusion give monotonicity; `p|n` implies `p≤n`, giving the large-`y` case. For `x<1`, the count is zero. The finite Checks fix the endpoints.

- `smooth_count.floor`: `Ψ(x,y)` counts the positive naturals `≤floor x` in `Nat.smoothNumbers`(floor `y+1`).
- `smooth_count.mono`: `Ψ` is nondecreasing in each real parameter.
- `smooth_count.large_y`: For `y≥x≥2, Ψ(x,y)=floor x`.
- `smooth_count.unit`: For `x≥1` the integer1 contributes once.

**Checks.**

- 0 is never counted.
- `Ψ(0,2)=0`.

See [86][R86], Introduction, p.411 (terminology); Introduction p.412 and §1 p.414 formula(1.3).

*Needs:* `Nat.smoothNumbers`; `Nat.smoothNumbersUpTo`; `Nat.mem_smoothNumbersUpTo`.

### 3.21 Dickman function

The signature `smoothCount_dickman` includes construction and uniqueness, specifying the negative extension separately from continuity on `[0,∞)`. Prove positivity, monotonicity and the integral identity, with the negative extension required only for the identity on the whole real line.

`ρ:R→R` is0 for `u<0`, equals1 for `0≤u≤1`, is continuous on `[0,∞)`, and satisfies `uρ′(u)=−ρ(u−1)` on `u>1`. Construct it recursively on intervals `[k,k+1]` by integration; the value at0 is1, so no continuity across negative `u` is claimed.

Set `ρ=0` below 0 and `ρ=1` on `[0,1]`. For integer `k≥1` use `ρ(u)=ρ(k)−∫_k^uρ(t−1)dt/t` on `[k,k+1]`. Continuous endpoint gluing and FTC give the delay equation; at 1 the one-sided derivatives are `0,−1`. Telescope for the global recursion and induct for uniqueness. The interval identity follows directly for `u≤1` and by differentiation/matching above 1. A first-zero contradiction gives positivity and hence strict decrease above 1, as in Hildebrand–Tenenbaum Lemma 2.5.

- `dickman_function.initial`: `ρ(u)=1` on`[0,1]`.
- `dickman_function.recursion`: For `u≥1, ρ(u)=1−∫_1^u ρ(t−1)/t dt`.
- `dickman_function.unique`: These initial values and the delay equation determine `ρ` uniquely on `[0,∞)`.
- `dickman_function.positive`: `ρ(u)>0` for every finite `u≥0`, and `ρ` is nonincreasing on `[0,∞)`.
- `dickman_function.negative`: `ρ(u)=0` for `u<0`; no continuity across0 is asserted.
- `dickman_function.continuous`: `ContinuousOn ρ [0,∞)`.
- `dickman_function.delay`: For `u>1`, HasDerivAt `ρ(−ρ(u−1)/u) u`; do not claim differentiability at1.
- `dickman_function.interval_identity`: For each real `u, uρ(u)=∫_{u−1}^uρ(v)dv`, with the fixed negative extension.

**Checks.**

- `ρ(0)=ρ(1)=1`.
- `ρ(2)=1−log2`.
- `ρ(−1)=0`; extending1 to negative `u` would violate the convention.

`ρ(0)=ρ(1)=1`. `ρ(2)=1−log2`. The delay derivative holds at integers `≥2`, but not at1.

See [86][R86], Introduction, p.411 (terminology); p.414 equation(1.5); §2 Lemma2.5 and complete proof p.426.

*Needs:* `intervalIntegral`.

### 3.22 Dirichlet divisor average

For `x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x)`, with an absolute constant and inclusive real cutoff.

Put `M=⌊√x⌋≥1` and use §3.22b. Replacing `⌊x/a⌋` by `x/a` costs `O(M)`; §3.22a gives `H_M=log M+γ+O(1/M)`. With `δ=√x−M∈[0,1)`, expansion shows `2xlog M−M²=xlog x−x+O(1)` and `x/M=O(√x)`. Combine with absolute constants, without divisor subpower bounds.

The exact divisor sums at `x=1` and `x=4` are1 and8; the asymptotic is asserted on `x≥2` with a single absolute constant. A perfect-square endpoint is included once. The error `O(sqrt x)` requires the harmonic remainder rate, not merely existence of the Euler-constant limit.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem3.3 and complete hyperbola proof, pp.38–39; Theorem1.11 pp.15–16.

*Needs:* `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`; `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`; `Real.log_le_sub_one_of_pos`; §3.22a; §3.22b.

**§3.22a Harmonic sum remainder.** For each integer `N≥1, 0<H_N−log N−γ<log(1+1/N)≤1/N`, where `H_N=Σ_{1≤n≤N}1/n` and `γ` is the Euler–Mascheroni constant.

Subtract the Euler-sequence inequalities to obtain `0<H_N−log N−γ<log(N+1)−log N`. Rewrite this as `log(1+1/N)≤1/N`. The Euler constant is Mathlib’s.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Theorem1.11 and complete proof, pp.15–16; Euler-sequence inequalities.

**§3.22b Divisor hyperbola identity.** For real `x≥1` and `M=floor(sqrt x), Σ_{1≤n≤floor x}τ(n)+M²=2Σ_{1≤a≤M}floor(x/a)`. The equality is exact, including `x` at a perfect square.

Partition positive pairs `ab≤x` into `a≤M` and `b≤M`, since `(M+1)²>x`. Transposition equates their counts; the intersection has `M²` pairs. Regroup by ab using the divisor carrier.

See Koukoulopoulos, *The Distribution of Prime Numbers*, Hyperbola discussion, pp.37–39, (3.4)–(3.5) and Theorem3.3 proof.

### 3.23 Second moment of zeta

As `T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T)`, with an absolute constant. This is Ingham's unconditional theorem; only the explicit endpoint below assumes `BBRFiniteInput`.

Define `zetaSecondMoment.error` by `E(T)=∫_0^T|ζ(1/2+it)|²dt−T log(T/(2π))−(2γ−1)T`, using the existing `riemannZeta` and Euler constant. Under `BBRFiniteInput` of §3.23a, the sufficient quantitative target is `zetaSecondMoment.atkinson_bound`: `|E(T)|≤110√T log T` for `T≥10^30`. The proof uses the endpoint divisor remainder, the Voronoi transform and the two saddle families below, followed by Atkinson's finite sums. It requires no smoothed second-moment theorem.

- Lower endpoint: `E(0)=0` with the native interval-integral and real-`log` conventions.
- Continuity: `E` is continuous on `[0,∞)`; the factor `T log T` has its continuous value zero at0.
- Increments: for `0<S≤T, E(T)−E(S)=∫_S^T|ζ(1/2+it)|²dt−[T log(T/(2π))−S log(S/(2π))]−(2γ−1)(T−S)`.
- `zetaSecondMoment.mean_square`: the displayed asymptotic is unconditional. It follows from `atkinson_formula` with `N` in `[T/2,T]`, the bounds `0<e(T,n)≤1` of §3.23g and the weighted divisor sums of §3.23a: `|S₁(T,N)|≤√2(T/2π)^(1/4)Σ_(n≤N)d(n)n^(−3/4)≪√T log T`; the cutoff `Z=Z(T,N+1/2)` is decreasing in `N` and satisfies `Z<T/30`, so every denominator `log(T/(2πn))`, `n≤Z`, exceeds 1 and `|S₂(T,Z)|≤2Σ_(n≤Z)d(n)n^(−1/2)≪√T log T`; the `O(log²T)` remainder and the compact initial interval are absorbed. No BBR inequality enters.

**Checks.**

- `E(0)=0`. This tests the endpoint extension, without applying an asymptotic at0.
- If the main term is instead written `T log T+cT`, its linear coefficient is `c=2γ−1−log(2π)`, not `2γ−1`. At `T=2π` the first logarithmic term is zero.
- On `[S,S]` the increment identity gives0. On `[S,T]` and `[T,U]`, its two integral and main-term increments add to the `[S,U]` increment; reversing an endpoint changes the sign.

See [87][R87], (1) p.1, Theorem2 p.4 and §7 (109) p.35; [88][R88] gives the classical attribution.

*Needs:* §3.23a–§3.23g; Layer1 zeta functional equation, Stirling and contour adapters; `riemannZeta`; `Real.eulerMascheroniConstant`; `intervalIntegral`.

**§3.23a Endpoint divisor remainder and explicit summation estimates.** Put `d(n)=#n.divisors` for positive integers. Give the inclusive sum of §3.22 the light name `divisorSummatory`, `D(x)=Σ_(1≤n≤x)d(n)`, and define `divisorError`, `Δ(x)=D(x)−x(log x+2γ−1)`. The real cutoff is inclusive. Define

`Δ*(x)=D(x)−(if x is a positive integer m then d(m)/2 else0)−x(log x+2γ−1)−1/4.`

Call this function `divisorErrorStar`. The half-weight at an integer is part of the definition. For `x>0` it is the average of the left and right limits of `D`, minus the smooth main term and1/4. At `x=0` use the displayed totalized formula, so `Δ*(0)=−1/4`; no Voronoi identity is asserted there.

- `divisorSummatory.floor`, `divisorSummatory.jump`: `D(x)=D`(floor `x`) for `x≥0; D=0` on `[0,1)`, and its jump at `m≥1` is `d(m)`. The hyperbola identity is §3.22b.
- `divisorRemainder.midpoint`: `Δ*(m)=(Δ*(m−)+Δ*(m+))/2` for `m≥1`; its right minus left jump is `d(m)`.
- `divisorRemainder.off_integer`: `Δ*(x)=Δ(x)−1/4` off positive integers; at `m≥1, Δ*(m)=Δ(m)−d(m)/2−1/4`.
- `divisorRemainder.sqrt_bound`: `|Δ(x)|≤√x` for `x≥1`. Strengthen the qualitative hyperbola estimate of §3.22 quantitatively; [BBR], Theorem1.1 p.1025 proves the stronger coefficient0.961.
- `divisorRemainder.cubic_bound`: `|Δ(x)|≤0.764 x^(1/3)log x` for `x≥9995` ([BBR], Theorem1.2 p.1026, inequality(10.2) and Lemma10.7 p.1043). Consequently `|Δ*(x)|≤x^(1/3)log`(ex) for `x≥9995`, using one-sided limits and their average at integers. For `1≤x<9995` boundedness follows from the finite hyperbola formula; the analytic continuation argument needs only the eventual bound. All later numerical uses have `x≥0.9·10^30`.
- `divisorRemainder.weighted_sums`: for `Y≥5, Σ_(n≤Y)d(n)/√n≤2√Y log Y`; for `Y≥2, Σ_(n≤Y)d(n)n^(−3/4)≤4Y^(1/4)log Y`; for `X≥1, Σ_(n>X)d(n)n^(−5/4)≤X^(−1/4)(4log X+8(γ+2))+(8/3)X^(−3/4)`. These include exactly the stated endpoints ([87][R87], Lemmas7–9 pp.30–31).
- `divisorRemainder.transition_sum`: define `c(u)=1/max(1,|u|)`, including `c(0)=1`. For `Z≥5`,

  `Σ_(n≥1)d(n)n^(−3/4)c(2√n−2√Z) ≤ Z^(−1/4)(1.445log²Z+15.35log Z+50.276)+2.71Z^(−3/4)`.

  The series here is absolutely convergent. Split it at `Z/2, Z−√Z, Z+√Z,2Z`. Abel summation gives the two gap sums bounded respectively by `(1/2)log²Z−(log2−γ)log Z+2.365` and `(1/2)log²Z+γlog Z+3.721` for `Z>4`; the central band is bounded by `Z^(−1/4)(2^(7/4)log Z+12.21)`. The weighted-sum bounds handle the two tails ([87][R87], Lemma6 pp.29–30, (96)–(98) pp.30–31 and pp.33–34). The cap prevents any singularity when `Z` is an integer.

The cubic bound requires [BBR], Lemma 5.1 p.1031’s triangular estimate, beyond `O(√x)`. For positive `D₀`, its coefficient is `Σ_(uv=n,gcd(u,v,D₀)=1)1`, whose error is `Σ_(δ|D₀)μ(δ)Δ(t/δ²)` by Möbius inversion. Abel summation (4.1), (4.6)–(4.7), pp.1029–1030 reduces its weighted sums to that error and integrals with weights `t^(−3/2),t^(−7/4)`. Use Mellin continuation of `ζ(s)²`, the hyperbola remainder and [BBR] §§8–10, pp.1037–1043’s integrated estimates, at `D₀=1` then `D₀=6` for (10.2). The finite input is `BBRFiniteInput`, stated below; the analytic integral and triangular estimates outside its ranges are proof targets.

Use `divisorCoprimeError D t = Σ_(δ|D)μ(δ)Δ(t/δ²)` for `D>0`, and `divisorRemainderIntegral D T σ = ∫_1^T divisorCoprimeError D u·u^(−σ)du`; these are the BBR (4.5), (8.1) quantities. Write `I_D(T,σ)` for the latter, `κ₇=ζ(3/4)²/(3/4)+8γ−20`, and `κ₃=2ζ(1/2)²+4γ−6`, with the real continued zeta values.

- `BBRFiniteInput`: `|Δ(x)|≤0.961√x` for `1≤x≤10^10`; `|Δ(x)|≤0.764x^(1/3)log x` for `9995≤x≤10^10`; `|Δ(x)|≤1.146x^(1/3)log x` for `3≤x≤10^6`; `|Δ(x)|≤0.475√x` for `4033≤x≤10^10`; `|divisorCoprimeError 2 x|≤0.883√x` and `|divisorCoprimeError 6 x|≤0.927√x` for `1≤x≤10^7`; `T^(1/4)|I_1(T,7/4)−κ₇|≤1/2` for `1≤T≤2`, `≤0.302` for `2≤T≤10^5` and `≤0.00979` for `1260≤T≤10^7`; `|I_1(T,7/4)|≤0.4077`, `|I_1(T,3/2)|≤κ₃`, `|I_2(T,7/4)|≤0.902`, `|I_6(T,7/4)|≤0.0945` and `|I_6(T,3/2)|≤0.131` for `1≤T≤10^7`; and `|I_6(10^7,3/2)+0.056667|≤10^−6`, all over real arguments. Source: [BBR], (4.8) and (8.1)–(8.5), pp.1030, 1037–1038; §§6–7, pp.1034–1037; Lemmas 8.3, 8.6, 8.9, pp.1040–1041; Lemmas 9.1, 9.4, p.1042; Lemmas 10.1, 10.3, pp.1042–1043.

The global square-root and cubic bounds, every literal bound in §§3.23a–g that uses them, the explicit Atkinson remainder bound and `zetaSecondMoment.atkinson_bound` carry `BBRFiniteInput`; `zetaSecondMoment.mean_square` is unconditional (§3.23), and the qualitative divisor and moment-error identities need no such input. Prove the analytic tails by [BBR] §§8–10, including (10.1)–(10.2), substituting the finite bounds only at the split points. Put `R₇(T)=T^(1/4)|I_1(T,7/4)−κ₇|`. The finite clauses give `R₇≤1/2` on `[1,10^7]` and, at `T=10^7`, `κ₇<0.408`. The hyperbola inequality `|Δ(u)|≤√u+1/2` gives `R₇(T)≤4+2/(3√T)` by integration from `T` to ∞, hence `|I_1(T,7/4)|<0.479` for `T≥10^7`, and [BBR] Lemma 8.2 gives `|I_1(T,3/2)|≤κ₃+4+7/(6√T)+(9/2)T^(−0.72)<4.71`. [BBR] §9 with the finite clauses gives `|Δ(u)|≤0.475√u` for `u≥4033`; tail integration then gives `R₇≤1.90` there, and on `[1,4033]` by the finite clauses; Lemma 8.2 then gives `|I_1(T,3/2)|<2.61` for `T≥10^7`. Thus §10 retains the constants 0.953, 0.163 for the two coprime `7/4` integrals and 3.91, 5.98 for the two coprime `3/2` integrals. In (10.1) every scaled argument has `T/δ²≥10^7/36>4033`, and in the `3/2` comparison it exceeds 1, so `R₇≤1.90` applies. These give the cubic divisor bound and the Atkinson budget of §3.23g.

The coefficient API is finite Möbius inversion and specialization: `divisorCoprimeError 1 x=Δ(x)` and `divisorCoprimeError 2 x=Δ(x)−Δ(x/4)`, with every summand 0 at `x=0`. The integral API is its defining interval integral, reversal of endpoints and additivity on positive compact intervals: `I_D(1,σ)=0`, `I_1(T,σ)=∫_1^T Δ(u)u^(−σ)du`, and `I_D(T,σ)−I_D(S,σ)=∫_S^T divisorCoprimeError D u·u^(−σ)du` for positive `S,T`, including `S=T` and reversed endpoints. Local integrability follows from finitely many divisor jumps on compact positive intervals.

Prove that the cap is nonnegative, at most one, even, continuous everywhere, and equal to `|u|⁻¹` for `|u|≥1`. Real reciprocal totalization must not replace its value at zero.

**Checks of the divisor remainders.**

- At `x=0, D=Δ=0` and `Δ*=−1/4`; the positive-argument transform is inapplicable.
- At `x=1, D=1, Δ=2−2γ` and `Δ*=5/4−2γ`. The integer midpoint differs from the inclusive remainder by3/4.
- At `x=4, D=8, Δ=12−4log4−8γ` and `Δ*=41/4−4log4−8γ`. The right and left values differ by `d(4)=3` and are each3/2 from the midpoint. At `x=3/2, Δ*=9/4−(3/2)log(3/2)−3γ`, with no endpoint half-weight.

**Checks of the endpoint cap.**

- `c(0)=1`, whereas `min 1 |0|⁻¹` in a totalized field is0.
- `c(1/2)=c(−1/2)=1`.
- `c(2)=c(−2)=1/2`; replacing the cap by the constant1 would lose the summable tail.

*Needs:* §3.22, its harmonic remainder and exact hyperbola identity; finite Möbius inversion and Abel summation; Layer1 Mellin/contour adapters and `ζ²`; [BBR], Lemma5.1 and §§8–10 as the proof route of the named explicit bounds.

**§3.23b Second-kind Bessel function and positive-axis remainders.** Use §2.1a's `K_ν` and Mathlib's `J_ν(z)=Complex.besselJ ν z`, with the following first-kind API for every complex order `ν`:

- `J_ν(y)=Σ_(k≥0)(−1)^k(y/2)^(ν+2k)/(k!Γ(ν+k+1))`, with `1/Γ` read as entire, converges absolutely for every `y`; at `y=0` Mathlib's `0^0=1` gives `J₀(0)=1`.
- For `y>0`, `y²J″+yJ′+(y²−ν²)J=0` and `J_(ν−1)(y)+J_(ν+1)(y)=(2ν/y)J_ν(y)`.
- `J_(1/2)(y)=√(2/(πy))sin y` for `y>0`, and `J_(−n)=(−1)^nJ_n` for integers `n≥0` (`Complex.besselJ_neg_int`).

Differentiate the series termwise and compare coefficients, using `Γ(z+1)=zΓ(z)` and the totalized reciprocal Gamma at its poles; the half-order value is the sine series. For positive `x`, `x^s=exp(s log x)`, with `x^(s+t)=x^sx^t` and order derivative `log x·x^s`. Source: [DLMF-Bessel], 10.2.1, 10.2.2, 10.4.1, 10.6.1, 10.16.1. Define `besselY : ℂ → ℂ → ℂ` for arbitrary complex order `ν` and `Re z>0` by

`Y_ν(z)=π⁻¹∫_0^π sin(z sinθ−νθ)dθ−π⁻¹∫_0^∞[exp(νt)+cos(πν)exp(−νt)]exp(−z sinh t)dt.`

Prove the connection, differential equation, recurrence and half-order normalizations.

Both integrals are absolutely convergent on this domain, locally uniformly in `(ν,z)`. Outside it the native totalized integral is only a value, with no asserted analytic identity. This representation avoids division by `sin(πν)` at integral orders.

- `besselY.integrable`, `besselY.holomorphic`: prove the stated convergence, entire dependence on `ν`, and holomorphy in `z` on `Re z>0`, by super-exponential domination at∞ and differentiation under the integral.
- `besselY.connection`: if `sin(πν)≠0` and `Re z>0, Y_ν(z)=[cos(πν)J_ν(z)−J_(−ν)(z)]/sin(πν)`. The limits at integral orders agree with the integral definition. Derive the identity using the supplied `J` series and its Schläfli integral comparison, or its equivalent Hankel contour obtained by deforming the same convergent integral.
- `besselY.ode`, `besselY.recurrence`: on `Re z>0, z²Y″+zY′+(z²−ν²)Y=0` and `Y_(ν−1)+Y_(ν+1)=(2ν/z)Y_ν`. In particular `Y_(−m)=(−1)^mY_m` for integers `m`. Integration by parts includes the boundary contributions from both integrals.
- `besselY.half`: for real `x>0, Y_(1/2)(x)=−√(2/(πx))cos x` and `Y_(−1/2)(x)=√(2/(πx))sin x`; values are real for real `ν` and `x>0`.

See [DLMF-Bessel], 10.9.7 (integral), 10.2.3, 10.4.1, 10.6.1 and10.16.1. The integral/series comparison is local work; the first-kind function is not constructed again.

For real `ν` define `besselAsymptoticCoeff(ν,j)` by `a_j(ν)=∏_(1≤r≤j)(4ν²−(2r−1)²)/(8^j j!)`, with empty product1. The API is the empty value, the recurrence `a_(j+1)=a_j(4ν²−(2j+1)²)/(8(j+1))`, and the following actual remainder estimates. For `x>0` and integer `m≥1` with `|ν|<m+1/2`,

`K_ν(x)=√(π/(2x))e^(−x)[Σ_(j<m)a_j(ν)x^(−j)+R_m],  |R_m|≤|a_m(ν)|x^(−m).`

For integers `r,s≥1` with `|ν|<min(2r+1/2,2s+3/2)`, set `ω=x−πν/2−π/4`. Then

`Y_ν(x)=√(2/(πx)){sinω[Σ_(j<r)(−1)^j a_(2j)(ν)x^(−2j)+U]+cosω[Σ_(j<s)(−1)^j a_(2j+1)(ν)x^(−2j−1)+V]},`

where `|U|≤|a_(2r)(ν)|x^(−2r)` and `|V|≤|a_(2s+1)(ν)|x^(−2s−1)`. At half-integral orders use the exact terminating expressions: a remainder is zero once its cutoff is beyond the last nonzero coefficient. This does not assert a first-omitted-term bound for a truncation outside the displayed order restrictions. Prove `besselKY.positive_axis_remainders` from the convergent integral definitions, contour deformation and integration by parts, retaining the integral remainders; no merely formal asymptotic series is used. [Nemes], (1.9), (1.14) pp.2–3, (1.22)–(1.23) p.5, Theorem1.5 and (1.30) p.6, AppendixA (A.3) p.25 supply this route. The positive-axis specialization needs no incomplete-Gamma or terminant carrier.

Prove the real second-kind remainder bounds and the terminating half-order boundary.

The proof of these positive-axis bounds can stay entirely with positive-axis `K` values. For integer `N≥1` and real `|ν|<N+1/2`, prove `besselKY.remainder_integrals`: with `C_ν=√(2/π)cos(πν)/π`,

`R_N^K(x)=(−1)^N C_ν x^(−N)∫_0^∞t^(N−1/2)e^(−t)K_ν(t)/(1+t/x)dt,`
`R_N^J(x)=(−1)^floor(N/2) C_ν x^(−N)∫_0^∞t^(N−1/2)e^(−t)K_ν(t)/(1+(t/x)²)dt,`
`a_N(ν)=(−1)^N C_ν∫_0^∞t^(N−1/2)e^(−t)K_ν(t)dt.`

Here `R_N^J` is the scalar remainder appearing in the even/odd expansion, not a new first-kind function: `U=R_(2r)^J` and `V=−R_(2s+1)^J`. Each displayed integral is absolutely convergent in this domain. Obtain the comparisons by finite geometric expansion of the transformed `K` and `Y` integrals, and evaluate the coefficient moment using §2.1a's `cosh` integral, Gamma/Beta integration and reflection. For real `ν` the `cosh` integral makes `K_ν(t)>0`; each rational denominator is at least1. The moment identity therefore gives both first-omitted-term bounds directly. This is the positive-axis content of [Nemes], (1.22)–(1.23), p.5, and (A.3), p.25; it introduces neither a general terminant nor a hypergeometric-function supplier.

In particular, for `u>0`, `besselKY.order_one` gives

`K₁(u)=√(π/(2u))e^(−u)R₁(u),  |R₁(u)|≤1+3/(8u),`

`Y₁(u)=−√(2/(πu))[cos(u−π/4)−(3/(8u))sin(u−π/4)]+R₂(u),`

`|R₂(u)|≤(15/128)√(2/π)(1+7/(8u))u^(−5/2)`.

These are the one-order adapters of [87][R87], proof of Lemma1 p.`8; u=0` is excluded from every displayed estimate.

**Checks of `Y`.**

- `Y_(1/2)(π/2)=0` and `Y_(−1/2)(π/2)=2/π`.
- `Y_(1/2)(π)=√2/π`. The first two values alone would not detect the wrong overall cosine sign.
- For `x>0, Y_(−1)(x)=−Y₁(x)`, whereas §2.1a's `K` has `K_(−1)=K₁`. A naive quotient at integral order has denominator zero and fails this check.

**Checks of the coefficients and remainders.**

- `a₀(1)=1` and `a₁(1)=3/8`.
- `a₂(1)=−15/128` and `a₃(1)=105/1024`; these fix the sign and the ratio7/8 in the order-one error.
- At `ν=±1/2` all `a_j` with `j≥1` vanish and the `K` expansion is exact. In the `Y₁` bracket, the phase `u−π/4=π/2` gives the positive correction `+√(2/(πu))3/(8u)`; the leading cosine alone is zero there.

*Needs:* §2.1a; Mathlib `Complex.besselJ`; `Complex.exp`, `Complex.sin`, `Complex.cos`, `Complex.Gamma`; complex Cauchy/contour theory of Layer1; differentiation under a dominated integral and the native real/complex Gaussian integrals.

**§3.23c Quantitative saddle deformation with endpoint terms.** Prove `saddlePoint.quantitative` for real `a<b,k` and complex functions `f,φ` holomorphic on a neighborhood of the closed discs `|z−x|≤μ(x), a≤x≤b`. Here `μ` is positive `C¹, Φ,F` are positive continuous functions, `f` is real on `[a,b], f″(x)>0` there, `f″(z)≠0` throughout these discs, and `A₁,A₂,A₃>0` satisfy, throughout each closed disc,

`|φ(z)|≤A₁Φ(x),  |f′(z)|≤A₂F(x)/μ(x),  1/|f″(z)|≤A₃μ(x)²/F(x)`.

For `0<η<min{1/((1+2A₂A₃/3)√2), A₃(1+2A₂)/2, (48A₃³/π³)^(1/6)}`, put `β=2η√2 A₂A₃/[3(1−η√2)]<1` and

`B₁=(1−β)⁻¹+π⁻¹exp(−π/(2(1−β))),`
`B₂=2πη²(1−β)/(A₃(1+2A₂)),`
`B₃=48√2(1+(1−β)^(−4))/(π⁴η⁷).`

For the last constant put

`w₁=πη³A₂[4√2/3+27η/(128(1−η√2))],`
`w₂=exp(w₁)(4πA₂/3)²[1+3η/(√2−2η)(1+3√2η/(8(1−η√2)))],`
`w₃=4π√2 A₂/3+2πηA₂/(1−η√2)+η³w₂,`

`B₄=(1+η³w₃)/[(2π/A₃)(1−η√2)]+3[(2πA₂)/(1−η√2)+√2w₃]/(4π/A₃)²+15w₂/(4π/A₃)³.`

The light tuple `saddleConstants(A₂,A₃,η)` consists of `(β,B₁,B₂,B₃,B₄)`. These are explicit numerical functions, not unspecified constants. Their API is positivity, continuity on the displayed open parameter domain, `β<1` and the following error inequalities. If `f′(x₀)+k=0` for `x₀∈[a,b]`, this zero is unique and

`∫_a^b φ(x)e^(2πi(f(x)+kx))dx=φ(x₀)e^(2πi(f(x₀)+kx₀+1/8))/√f″(x₀)+R_end+R_far+R_loc,`

`|R_end|≤A₁B₁[Φ(a)/(|f′(a)+k|+√f″(a))+Φ(b)/(|f′(b)+k|+√f″(b))]`,

`|R_far|≤A₁∫_a^b Φ(x)exp(−B₂(|k|μ(x)+F(x)))(1+η√2|μ′(x)|)dx`,

`|R_loc|≤A₁(A₃⁴B₃+√A₃B₄)Φ(x₀)μ(x₀)F(x₀)^(−3/2)`.

If there is no such zero, omit both the main term and `R_loc`. A saddle at a or `b` is allowed with these endpoint errors; there is no claim that its full Gaussian main term is an asymptotic without a boundary correction. For the less restrictive domain holomorphic on the open union of discs, first shrink the discs and pass to the limit while retaining the same bounds.

Deform the real segment along `x±η(1+i)μ(x)`, choose the sign away from the saddle, and retain both connecting endpoint segments. Cauchy estimates through order4 control the local Taylor remainder; the odd terms cancel on the symmetric central segment. Integrate the remaining quadratic Gaussian exactly and bound its tails. This proves all three estimates, including the no-saddle case, from existing contour and Gaussian theory. See [87][R87], Proposition1 pp.9–10, (27)–(36), Lemmas2–3 p.10–11 and proof pp.11–15, particularly (41), (43), (45) for `w₁,w₂,w₃`. No qualitative stationary-phase theorem is used in place of these quantitative bounds.

**Checks.**

- For `f(x)=λx²/2, φ=1, k=0` and `λ>0`, the full-line improper Gaussian main term is `exp(πi/4)/√λ; λ=1` and4 give the ratio2. Reversing the contour phase conjugates it. A Bochner integral of the undamped full-line phase is not asserted.
- On `[−1,1]` the same phase with `k=3λ` has no saddle, so there is no Gaussian main term. With `k=λ` the saddle is the left endpoint and `R_end` cannot be discarded.

*Needs:* Layer1 contour/Cauchy estimates; real and complex Gaussian integration (including `integral_gaussian_complex`); finite-segment integration by parts; positive real powers and elementary exponential bounds. The parameter functions are numerical formulas, not extra analytic carriers.

**§3.23d Logarithmic saddle family.** For positive `α,β,γ` with `α≠1, T≥T₀≥1, k≥1, 0<a≤min(1,T/(8πk))` and `b≥T`, put `atkinson.logRatio(y)=L(y)=log((1+y)/y)` for `y>0` and `atkinson.logarithmicWeight(α,β,γ,y)=y^(−α)(1+y)^(−β)L(y)^(−γ)`. Their API is positivity and smoothness on `y>0, L′(y)=−1/(y(1+y))`, and the weight comparison `Φ` and derivative estimates below. Prove the logarithmic saddle estimate for

`I_±=∫_a^b y^(−α)(1+y)^(−β)L(y)^(−γ)exp(i[TL(y)±2πky])dy.`

For the plus sign the unique saddle is `y₀=√(T/(2πk)+1/4)−1/2∈[a,b]`, and the main term is

`y₀^(−α)(1+y₀)^(−β)L(y₀)^(−γ)√(2π/ψ″(y₀))exp(i[ψ(y₀)+π/4]),  ψ(y)=TL(y)+2πky`.

For the minus sign there is no saddle and no main term. Both remainders are bounded by the three quantities `R_end,R_far,R_loc` of §3.23c, with `R_loc` omitted for minus, using

`f(z)=T log((1+z)/z)/(2π), φ(z)=z^(−α)(1+z)^(−β)(log((1+z)/z))^(−γ),`
`μ(x)=x/2, F(x)=T/(1+x), Φ(x)=x^(−α)(1+x)^(γ−β),`
`A₁=2^(α+β−γ)3^γ, A₂=1/π, A₃=27π, η=129/(3800√2).`

All complex logarithms and powers are principal on these discs, which avoid the cut. The uniform logarithmic saddle estimate bounds these explicit remainder expressions uniformly in either range `1≤k≤A″T` or `k≥A′T`, for fixed positive A′,A″. The respective local-error scales are

`T^((γ−α−β)/2−1/4)k^(−(γ−α−β)/2−5/4)`,  and  `T^(−1/2−α)k^(α−1)`.

Endpoint scales are `a^(1−α)/T`, `b^(γ−α−β)/k`; retain the far error’s exponential integral and split at `1,√(T/k),T` for the explicit [87][R87] refinement, Proposition 2 (47)–(55), pp.15–20. For `β=1/2,γ=1`, individual integrals converge at infinity for `α>1/2`, but generally fail at `α=1/2` (amplitude `→1`). First pair their imaginary parts as `2sin(TL(y))cos(2πky)`; the extra `O(T/y)` gives uniform integration-by-parts tails for `α∈[1/2,3/4]`. Take `a↓0,b→∞` at `α>1/2`, then `α↓1/2` only in this paired expression. These quantitative remainders supply §3.23g.

**Checks.**

- With `T=4π,k=1, y₀=1` and `ψ′(1)=0`; the minus-phase derivative there is `−4π`, so it must have no main term.
- Here `ψ(1)=4πlog2+2π` and `ψ″(1)=3π`. The Gaussian phase has `+π/4` and scale `√(2/3)`, fixing both the `2π` convention and orientation.
- For the first moment-sum parameters `α=β=1/2,γ=1`, the amplitude behaves like1 at∞. Each unpaired complex improper integral fails to converge at this boundary. In the paired imaginary parts the sine supplies decay; with `α>1/2` the endpoint `b^(1/2−α)` first vanishes in the required order of limits.

The logarithmic boundary theorem states failure of the ordinary unpaired improper limit at `T=4π,k=1,α=β=1/2,γ=1`; it retains the paired-integral convention above.

**Checks of the `log` ratio and weight.**

- At `y=1, L=log2` and the weight with `α=β=1/2,γ=1` is `1/(√2 log2)`.
- At `y=1/2, L=log3` and that weight is `2/(√3 log3)`.
- At `y=2, L=log(3/2)` and that weight is `1/(√6 log(3/2))`. The analytic domain excludes `y=0` even though the light Lean formulas totalize there.

*Needs:* §3.23c, elementary `log/arcsinh` identities, dominated convergence on finite intervals, and integration-by-parts control of the oscillatory tails.

**§3.23e Moving-cutoff saddle family.** For `α,A,A′>0,T≥1,n≥1` and `A√T≤a≤A′√T`, put

`atkinson.movingWeight(T,x)=Q_T(x)={asinh(x√(π/(2T)))[√(T/(2πx²)+1/4)+1/2](T/(2πx²)+1/4)^(1/4)}⁻¹`,

`atkinson.movingPhase(T,x)=h_T(x)=−2T asinh(x√(π/(2T)))−√(2πx²T+π²x⁴)+πx²`.

Their API is positivity of `Q` for `T,x>0`, smoothness in both positive parameters, `Q_(c²T)(cx)=Q_T(x)` and `h_(c²T)(cx)=c²h_T(x)` for `c>0`, and `h′_T(x)=2πx−2√(π²x²+2πT)`. Every denominator in `Q` is strictly positive on this domain.

Prove the moving saddle estimate for the improper integral `∫_a^∞x^(−α)Q_T(x)exp(i[4πx√n+h_T(x)])dx`. There is a saddle in `[a,∞)` exactly when `n<T/(2π)` and `(T/(2π)−n)²/n≥a²`. Its position is `x₀=(T/(2π)−n)/√n` and its main term is

`(4π/T)n^((α−1)/2)(log(T/(2πn)))⁻¹(T/(2π)−n)^(3/2−α)exp(i[T−Tlog(T/(2πn))−2πn+π/4])`.

With `c` from §3.23a, the remainder satisfies

`|R|≤V₁T^(−α/2)c(2√n+a−√(a²+2T/π))`
`+V₂T^(−3/2)n^((α−1)/2)(T/(2π)−n)^(1−α)`
`+V₃T^(−α/2)n^(−1/2)exp(−B₂(T+A√T))`.

For `η` satisfying §3.23c with `A₂=1/π,A₃=8/A²+9π`, use its `B_j` and put

`A₁=2^(α+1/2)/asinh((A/2)√(π/2)),`
`V₁=A₁B₁A^(−α)[1−(1+1/(2π(A′)²))^(−1/2)]^(−1/2),`
`V₂=(1/2)A₁(A₃⁴B₃+√A₃B₄),`
`V₃=(A₁/B₂)A^(−α)(1+η/√2).`

If the saddle condition fails, omit the main term and the entire second error term, so its possibly nonpositive base is never used. Replacing `√n` by `−√n` gives the no-saddle version; its first endpoint cap has argument `−2√n+a−√(a²+2T/π)`. The exponential tail is unchanged. These statements hold for every `α>0`; the Voronoi application uses3/2 and5/2.

Apply §3.23c to `f=h_T/(2π), k=2√n, μ=x/2,F=T,Φ=x^(−α)`. Its real second derivative is `1−(1+2T/(πx²))^(−1/2)>0`. Verify the complex disc bounds with the displayed `A_j`, then let the finite upper endpoint tend to∞; its connecting endpoint contribution tends to zero. This proves the explicit `V_j` without concealing the distance from the lower endpoint. See [87][R87], Proposition3 (67)–(78), Lemma5 and proof pp.21–23.

Define `atkinson.cutoff(T,b)=(√(b+2T/π)−√b)²/4` for `T,b>0`. Its API is positivity, strict inequality cutoff `<T/(2π)`, continuity, strict decrease in `b` and the equivalence

`n≤cutoff(T,b) ↔ n<T/(2π)` and `(T/(2π)−n)²/n≥b,  n>0`.

Prove positivity and the strict upper cutoff.

Thus for `b=N+1/2, a=√b`, the finite main-sum cutoff includes `n` exactly at the saddle endpoint. Also `2√cutoff=√(b+2T/π)−√b`, so its endpoint error is precisely `c(2√n−2√cutoff)`. For proportional `b/T` these formulas give compact positive lower and upper multiples of `T` for cutoff and for `T/(2π)−cutoff`; the explicit inequalities are [87][R87], (100)–(102) p.32.

**Checks of the saddle family.**

- `T=4π,n=1,a=1` gives `x₀=1`, an endpoint saddle. Its capped endpoint factor is1, not the totalized value of1/0.
- For the same `T,n` with `a=2` the saddle lies outside the interval and the main term and `V₂` term disappear. Replacing `√n` by `−√n` also removes them even at `a=1`.
- At `T=4π,n=1`, the main phase is `4π−4πlog2−2π+π/4`, with positive Gaussian shift `π/4`. At `n=T/(2π)` the logarithmic denominator is zero; that `n` is excluded from the saddle branch.

**Checks of the moving weight and phase.**

- At `T=4π,x=1, Q=√(2/3)/log2` and `h=−4πlog2−2π`. Adding `4πx` makes the phase at the `n=1` endpoint saddle equal `2π−4πlog2`, before the positive Gaussian shift.
- At `T=16π,x=2, Q` has the same value while `h=−16πlog2−8π`. This distinguishes the quadratic scaling of `h` from a linear scaling.
- At `x=0`, the native totalized real formulas give `Q=h=0`. The analytic statements exclude this input: `Q`'s `arcsinh` denominator is zero there.

**Checks of the cutoff.**

- `cutoff(4π,1)=1` and `T/(2π)=2`, so `n=1` is included and `n=2` is excluded.
- `cutoff(12π,1)=4`; doubling both `T` and `b` doubles cutoff, giving `cutoff(8π,2)=2`.
- At `T=0` the displayed algebraic expression is0, but none of its positive-domain denominator or saddle consequences applies. Increasing `b` strictly decreases cutoff when `T>0`.

*Needs:* §§3.23a,c; `log/arcsinh` differentiation; integration by parts at∞; real square-root algebra. §3.23f's integrated exchange uses these estimates after this theorem has been proved, so the two theorems do not depend circularly on one another.

**§3.23f Divisor Voronoi identity, convergence and integrated exchange.** For each `x>0`, prove `divisorVoronoi.endpoint_identity` as the limit of partial sums in increasing positive integer `n`:

`Δ*(x)=−(2√x/π) Σ_(n≥1)d(n)n^(−1/2)[K₁(4π√(nx))+(π/2)Y₁(4π√(nx))].`

The partial sums are uniformly bounded on every compact interval in (0,∞), and converge uniformly on every compact interval avoiding the positive integers. At an integer the limit is the midpoint value in §3.23a. The oscillatory series is conditional; it is not a `tsum` justified by absolute summability, and it does not converge uniformly across a divisor jump.

A proof from earlier inputs is the damped Poisson argument of [Meurman], theorem p.265 and §§2–8 pp.266–274. Insert `exp(−v(u+nx/u)), v>0`, into `∫_0^∞cos(2πu)sin(2πnx/u)du`; finite truncation, Poisson summation and Abel summation identify the `v↓0` limit with the half-endpoint divisor sum. The undamped integral is an improper limit, not an absolutely integrable Bochner integral. The identity

`∫_0^∞cos(2πu)sin(2πt/u)du=−√t[K₁(4π√t)+(π/2)Y₁(4π√t)],  t>0,`

is `divisorVoronoi.kernel_comparison`. Obtain it by substituting `u=√t exp v` in the damped integral, separating its two exponential phases and deforming to §2.1a's `K` integral and the `Y` integral of §3.23b; take the damping limit only after the integration-by-parts tail estimate. This also fixes the factor `4π` and the minus sign. Prove `divisorVoronoi.bounded_convergence` using the same finite Poisson formula and the uniformly summable damped remainder. Meurman's p.266 records the comparison, while pp.267–274 give the damping, stationary-phase and convergence arguments (convergence is §8, (8.1)–(8.3), pp.272–274); the estimate needed in his proof follows from §3.23c's Gaussian deformation, not an extra Bessel supplier.

§3.23b gives `divisorVoronoi.two_term` for `x≥x₀≥1`:

`Δ*(x)=x^(1/4)/(π√2) Σ_(n≥1)d(n)n^(−3/4)[cos(4π√(nx)−π/4)−3/(32π√(nx))sin(4π√(nx)−π/4)]+x^(−3/4)V(x),`

`|V(x)|≤15ζ(7/4)²/(2^11π³√2)+105ζ(9/4)²x₀^(−1/2)/(2^16π⁴√2)+ζ(11/4)²(1+3/(32π√x₀))x₀^(−1)/(π√2)`.

Keep ordered convergence for the leading series. The correction and discarded Bessel tails are absolutely summable, by `Σd(n)n^−s=ζ(s)²` for real `s>1` and `e^(−4πu)≤u^−4` for `u≥1` ([87][R87], Lemma 1 pp.8–9), uniformly in `x₀`.

`divisorVoronoi.integrated_exchange` applies in §3.23e’s two integrals, at `α=3/2,5/2` with weights `d(n)n^−3/4,d(n)n^−5/4`. On compact `[a,b]`, split at finitely many divisor jumps and use bounded convergence. For `b>T+1`, the phase derivative is bounded below by a fixed multiple of `√n`; integration by parts gives nth tail `C(T,a)b^−αn^−1/2`, summable starting at `d(n)n^−5/4`. §3.23e and the transition sum handle the finite saddle range `n≤Z` and capped endpoint error. Direct Fubini on the conditional leading series is not used.

**Checks.**

- The transform at `x=1` equals `5/4−2γ`, not the inclusive value `2−2γ` or the right-limit value `7/4−2γ`.
- At `x=4` the transform equals `41/4−4log4−8γ` and averages a jump of3. Uniform convergence across4 would force a continuous limit and is false.
- For the `n=1` and `n=2` terms the arguments are `4π√x` and `4π√(2x)`; the coefficients in the leading series are1 and `2^(1/4)`, both positive. The next terms have the negative sine coefficient `3/(32π√(nx))`. In contrast, the first two Atkinson coefficients in §3.23g have opposite signs.

*Needs:* §§3.23a–b and §3.23c; Mathlib's Poisson summation `Real.tsum_eq_tsum_fourier_of_rpow_decay` with its actual decay hypotheses (apply it while `v>0`); finite hyperbola/Abel summation; real `s>1` divisor Dirichlet series; dominated convergence on compact intervals; §3.23e for the unbounded integrated exchange.

**§3.23g Atkinson sums, error budget and the quantitative endpoint.** For `T>0,n>0` put

`e(T,n)=(1+πn/(2T))^(−1/4)√(πn/(2T))/asinh√(πn/(2T)),`
`f(T,n)=2T asinh√(πn/(2T))+√((πn)²+2πnT)−π/4,`
`g(T,n)=Tlog(T/(2πn))−T+π/4.`

Extend `e(T,0)=1` for `T>0` by its continuous right limit; `f(T,0)=−π/4`. Define the finite sums

`S₁(T,N)=√2(T/(2π))^(1/4)Σ_(1≤n≤N)(−1)^n d(n)n^(−3/4)e(T,n)cos f(T,n),`
`S₂(T,Z)=−2Σ_(1≤n≤Z)d(n)n^(−1/2)(log(T/(2πn)))⁻¹cos g(T,n).`

The light Lean names for `e,f,g,S₁,S₂` are respectively `atkinson.amplitude`, `atkinson.phase₁`, `atkinson.phase₂`, `atkinson.firstSum`, `atkinson.secondSum`. Here `N` is a natural number, `Z` is a real cutoff, and the analytic domain of `S₂` is `0≤Z<T/(2π)`; it is not defined analytically by a sum containing a zero logarithmic denominator. The light totalized Lean formula outside this domain asserts no analytic identity. The API is continuous extension of `e` at `0, 0<e(T,n)<1` for `0<πn/(2T)≤50`, homogeneous scaling `e(cT,cn)=e(T,n)` for `c>0`, finite-sum cutoff and jump identities, and the phase evaluations below. See [87][R87], (5)–(10) p.2 and the beginning of §7 p.35.

Prove the continuous amplitude extension. The proportional-truncation signature is `zetaSecondMoment.atkinson_formula`.

`atkinson.formula`: for any fixed `0<A′≤A″`, uniformly for positive integers `N` with `A′T≤N≤A″T` as `T→∞`,

`E(T)=S₁(T,N)+S₂(T,cutoff(T,N+1/2))+O_(A′,A″)(log²T).`

Assume `BBRFiniteInput` for the explicit remainder and moment bounds in this target. For the explicit specialization `T≥10^30, (9/10)T≤N≤(11/10)T`, prove the explicit Atkinson remainder bound with the actual remainder `ℛ=E−S₁−S₂`:

`|ℛ|≤95log²T+275log T+7.3·10^18`.

Here is the proof chain and the quantitative accounting. For `b=N+1/2`, apply the zeta functional equation to the two-variable off-diagonal Dirichlet series, subtract the Gamma main term, and use finite Poisson/Stieltjes summation. Continue the divisor tail from `Re u<1/2` to `Re u<2/3` using §3.23a's cubic estimate. It yields the contour decomposition, `E=E₁−E₂+E₃−E₄+R`, with

`E₁=4Σ_(n≤N)d(n)∫_0^∞sin(TL(y))cos(2πny)/[√(y(1+y))L(y)]dy,`
`E₂=4Δ*(b)∫_0^∞sin(TL(y))cos(2πby)/[√(y(1+y))L(y)]dy,`
`E₃=−(2/π)(log b+2γ)∫_0^∞sin(TL(y))sin(2πby)/[y√(y(1+y))L(y)]dy`
`+1/(πi)∫_0^∞[sin(2πby)/y]∫_(1/2−iT)^(1/2+iT)((1+y)/y)^u du/u dy`,
`E₄=4∫_b^∞[Δ*(x)/x]∫_0^∞{cos(2πxy)/[(1+y)√(y(1+y))L(y)]}{Tcos(TL(y))−(1/2+1/L(y))sin(TL(y))}dy dx,`

`|R|≤(T/2)log(1+1/(4T²))+1/(12T)+1/(90T³)`.

Integrals over an unbounded interval are successive improper limits in the displayed order. First perform the finite truncations and avoid poles, then prove convergence by the saddle/tail estimates before passing to these limits. The derivation is [87][R87], §2 (16)–(21) pp.5–7; the exact `b=N+1/2` removes the divisor endpoint from the Stieltjes cutoff. The residue at `u=0` and the Gamma remainder give the displayed `E₃` and `R`; they are not suppressed in an `O`-term.

Estimate `E₁−S₁` using §3.23d at `α↓1/2`, `E₂` using the cubic divisor bound, and `E₃` by splitting at `1/(2N+1),1`, retaining the residue `u=0`, then applying §3.23d at `α=3/2`. For `E₄` split into Tcos, `−sin/2` and `−sin/L`; use §3.23d inside. Apply §3.23f only to the first outer integral: §3.23e at `α=3/2` gives main term `−S₂`, at `α=5/2` controls the correction; §3.23a’s transition sum controls endpoints. Absolute Voronoi remainder and the cubic bound control other tails. Thus the `−E₄ sign` produces `+S₂`.

Retain §3.23c’s `R_end,R_far,R_loc` and §3.23e’s `V_j`. Equations (81), (86), (93)–(95), (104), (106) of [87][R87], pp.24–35 bound the four errors. At `A′=0.9,A″=1.1,T₀=10^30,η=1/20`, use `A=√0.9` and §3.23e’s `A′=√(1.1+1/(2T₀))`. Collect all errors, including `R`, into `b₁log²T+b₂logT+b₃(T)` as in the proof of Theorem 2. Prove the combined budget estimate: `b₁≤95,b₂≤275,b₃(T)≤7.3·10^18` for `T≥T₀`; more precisely `94.38860<b₁<94.38861`, `274.80674<b₂<274.80675`. The bound retains the decreasing exponential terms. Elementary `π,γ,log,exp`, square-root/`arcsinh` inequalities and the integral-test `ζ` tail give these combined bounds (Theorem 2 and Table 1 p.4; §6 pp.34–35), with the displayed analytic errors retained.

At these fixed parameters, set `u=1+√(1+20/(9π)), v=1+√(1+20/(11π)), H=V₁(3/2)/√π·(11/10+1/(2T₀))^(1/4)√v`, with `V₁` evaluated at the preceding `A,A′,η`. Then `b₁=1.445H` and `b₂=H[15.35−2.89log((9/10)π²u²)]`. Define `b₃(T)` as the sum of the remaining positive error terms in (81), (86), (93)–(95), (104), (106)–(108) and (21), after extracting those two logarithmic terms. Its bound is the combined `7.3·10^18` allowance above.

Check of the residual scale: at `a=0.9,T=T₀`, let `η_a=√(1/(2πa)+1/4)−1/2` and `U₄₄=3.5·10^19(aη_a)^(−1/2)(1+1/(2πa))²` as in (54). The positive term `6(7+log(aT))/(aT)^(1/6)·12U₄₄` from (95) lies between `7.264·10^18` and `7.265·10^18`. This term belongs to the upper error envelope for the combined remainder; it is not a lower bound for the oscillatory remainder itself.

Take `N=⌊T⌋`, so `0.9T≤N≤1.1T`, and `Z=cutoff(T,N+1/2)` lies between fixed positive multiples of `T` below `T/(2π)`. From `e≤1` and §3.23a prove the finite main-sum bound: `|S₁|+|S₂|≤3.87√TlogT−1.1√T`. For the explicit comparison put `z₊=(√(0.9+2/π)−√0.9)²/4`, `C₁=4√2/(2π)^(1/4)`, `C₂=4√z₊/log(1/(2πz₊))`. Then `Z≤z₊T`, `C₁+C₂<3.862`, `C₂logz₊<−1.111`; monotonicity of `√ZlogZ/log(T/(2πZ))` gives the bound, with positive logarithmic denominator by (100)–(102). Add the remainder and discard `−1.1√T`: the normalized error is at most `3.87+95logT/√T+275/√T+7.3·10^18/(√TlogT)<109.55` at `T₀`, decreasing thereafter. Hence `|E(T)|≤110√TlogT` at the full endpoint ([87][R87], §7 (109), p.35).

**Checks of `e`.**

- `e(T,0)=1` for `T>0`; the unextended quotient would give0/0 in Lean.
- `e(π/2,1)=2^(−1/4)/asinh1`.
- `e(π/2,4)=2·5^(−1/4)/asinh2`. These values distinguish the factor2T and the fourth-root amplitude.

**Checks of the phases.**

- `f(T,0)=−π/4`, whereas `g(2π,1)=−7π/4`.
- `f(π/2,1)=π asinh1+π√2−π/4; f(π/2,4)=π asinh2+2π√5−π/4`.
- `g(4π,1)=4πlog2−15π/4` and `g(4π,2)=−15π/4`. Thus the two logarithmic frequencies cannot be identified.

**Checks of the finite sums.**

- `S₁(T,0)=0` and `S₂(T,0)=0`. They have no `n=0` term.
- `S₁(T,1)=−√2(T/(2π))^(1/4)e(T,1)cos f(T,1)`; its next term at `N=2` has positive coefficient `2·2^(−3/4)`. This pins the alternating sign and the divisor multiplicity.
- For `T>4π, S₂(T,1)=−2cos g(T,1)/log(T/(2π))`; increasing `Z` from1 to2 adds `−2√2 cos g(T,2)/log(T/(4π))`. Its integer endpoint is included in full. The divisor transform's midpoint convention does not halve these finite sums.

*Needs:* §§3.23a,b,c; §3.23f’s transform and §§3.23d,e; §3.23f’s integrated exchange after §3.23e; Layer1 zeta functional equation, Gamma/Stirling remainder, finite contour and Poisson adapters; real `s>1` Euler products; exact finite arithmetic and elementary real inequalities. All quantitative constants refer to these explicit targets, rather than to an unnamed mean-value or stationary-phase supplier.

### 3.24 Fourth moment of zeta

The main signature is `zetaFourthMoment.asymptotic`.

As `T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3)`, with an absolute constant.

Use the unshifted specialization of [Kösters][R96], §3 pp.9–15, keeping the error rates in its proof, rather than only the limit in Theorem1.3. Put `A(t)=Σ_(n≤t/(2π))τ(n)n^(−1/2−it)` and `S(t)=χ(1/2+it)^(-1)A(t)`, where `χ` is the actual zeta functional-equation multiplier, of modulus1. The auxiliary targets are:

- `zetaFourthMoment.approximateFE`: `ζ(1/2+it)²=A(t)+χ(1/2+it)²·conj(A(t))+O(log t)`, uniformly for `t≥2` (p.9). Construct the two truncated Perron contours, apply the zeta functional equation and Stirling, and bound their tails; the pole and cutoff endpoint terms belong to this estimate.
- `zetaFourthMoment.divisorDiagonal`: `Σ_(n≤X)τ(n)²=X(log X)³/π²+O(X(log X)²)`, and `Σ_(n≤X)τ(n)²/n=(log X)^4/(4π²)+O((log X)³), X≥2` (AppendixA, LemmasA.5–A.6, p.20). The Euler identity `Στ(n)²n^(−s)=ζ(s)^4/ζ(2s)`, finite divisor hyperbola summation and Abel summation give these estimates; the coefficient is `(1/3!)/ζ(2)=1/π²`.
- `zetaFourthMoment.divisorOffDiagonal`: `Σ_(1≤m<n≤X)τ(m)τ(n)/(√(mn)log(n/m))=O(X(log X)³), X≥2` (LemmaA.4 p.20). For `n≥2m`, use the divisor average. For comparable `m,n` on a dyadic interval of size `Y`, put `h=n−m`; the denominator is `≫h`. Splitting each divisor at its square root and applying CRT gives `Σ_(n≍Y)τ(n)τ(n+h)≪Y(log Y)²Σ_(d|h)1/d+Y` for `1≤h≤2Y`. Sum with weight `1/h`, using `Σ_(h≤2Y)(1/h)Σ_(d|h)1/d≪log Y`, then sum dyadic intervals.
- `zetaFourthMoment.oscillation`: on a compact interval, a real `C²` phase with monotone derivative `|F′|≥λ>0` has `|∫exp(iF)|≤4/λ`; if `|F″|≥λ>0`, the bound is `8/√λ` (LemmasA.1–A.2 p.20). Integration by parts gives the first; split at `|F′|=√λ` for the second.

On `[T,2T]`, `|ζ|²=2ReS+O(logt)`. The diagonal of `∫|S|²` is `T(logT)^4/(4π²)+O(T(logT)³)`, including the moving-cutoff correction. The off-diagonal target controls both `∫|S|²` and `∫S²`; the latter diagonal is `O(√T(logT)^4)` by second-derivative oscillation. Thus `∫(2ReS)²` has coefficient `1/(2π²)`; Cauchy–Schwarz makes the approximate-equation error `O(T(logT)³)`. Sum dyadically and absorb the bounded initial interval. [89][R89], p.1 independently gives `2/(4!ζ(2))`; its stronger error is unnecessary.

*Needs:* §3.22; §3.24a; §3.26; zeta functional equation and imported Stirling theory; truncated Perron and contour adapters; finite divisor hyperbola/CRT and Abel summation; the four auxiliary targets above.

**§3.24a The divisor-square Euler identity.** `riemannZeta_pow_four_eq_mul_LSeries_divisor_sq`: for `Re s>1` the series `Σ_(n≥1)τ(n)²n^(−s)` converges absolutely and `ζ(s)⁴=ζ(2s)Σ_(n≥1)τ(n)²n^(−s)`, with `τ(n)=#n.divisors`; equivalently `Σ_(n≥1)τ(n)²n^(−s)=ζ(s)⁴/ζ(2s)` there, since `ζ(2s)≠0`.

Both `τ²` and `τ₄=1∗1∗1∗1` are multiplicative, so the Dirichlet-convolution identity `τ₄=τ²∗1_□`, with `1_□` the indicator of the positive squares, reduces to prime powers, where it reads `C(k+3,3)=Σ_(0≤j≤k/2)(k−2j+1)²`; equivalently the Euler factors agree, `(1−X²)/(1−X)⁴=(1+X)/(1−X)³=Σ_(k≥0)(k+1)²X^k`. The same prime-power comparison gives `τ(n)²≤τ₄(n)`, since `(k+1)²≤C(k+3,3)`, so absolute convergence follows from that of `ζ(σ)⁴`. Take `L`-series with `LSeries_convolution'`, `LSeries_one_eq_riemannZeta` and `Σ_(m≥1)(m²)^(−s)=ζ(2s)`.

Checks: at a prime the coefficient is `τ(p)²=4=τ₄(p)`, whereas the series of `τ(n²)`, with coefficient `τ(p²)=3` at `p`, is `ζ(s)³/ζ(2s)`; at `p²`, `τ₄(p²)=10=τ(p²)²+1`, the `1` coming from the square `p²` in `1_□`, so dropping `ζ(2s)` fails at the first square. The leading coefficient `(1/3!)/ζ(2)=1/π²` of `zetaFourthMoment.divisorDiagonal` is read off this identity.

See [Kösters][R96], AppendixA, LemmasA.5–A.6, p.20, where the identity is used; Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., §1.2. *Needs:* `ArithmeticFunction.IsMultiplicative`; `ArithmeticFunction.isMultiplicative_sigma`; `LSeries_convolution'`; `LSeries_one_eq_riemannZeta`; `Nat.divisors`.

### 3.25 Beurling prime system

The exponent-vector definitions are `BeurlingPrimeSystem.integerNorm` and `BeurlingPrimeSystem.integerCount`. Prove that their bounded fibres are finite. Two separate indices at value 2 are counted twice when the third prime is larger.

A discrete Beurling prime system is a nondecreasing sequence of real numbers `1<p₁≤p₂≤…` tending to∞. Generalized integers are finite-support exponent vectors `a:N→N`, with `norm∏p_j^(a_j)`; coincident real values are counted with multiplicity. `N(x)` counts these vectors of `norm≤x`, and `π_P(x)` counts the prime indices with `p_j≤x`. The representative structure is `BeurlingPrimeSystem`, with indexed count `BeurlingPrimeSystem.primeCount`; the ordinary prime sequence gives such a system.

Use the indexed sequence and exponent vectors `ℕ→₀ℕ`. For `x≥1`, escape to infinity leaves finitely many indices `p(i)≤x`, and every contributing exponent is at most `log x/log p(0)`; all positive exponents use these indices. The vectors embed in a finite product of finite intervals. For `x<1`, `norm≥1` leaves none. Coordinatewise addition multiplies norms and zero has norm 1. Ordinary unique factorization gives compatibility without identifying coincident generalized norms.

- `beurling_prime_system.norm`: The norm is the finite product with exponent multiplicities.
- `beurling_prime_system.finite`: Only finitely many exponent vectors have `norm≤x`, because only finitely many primes `≤x` occur and `p₁>1` bounds every exponent.
- `beurling_prime_system.unit`: The zero exponent vector has norm1 and is counted once.
- `beurling_prime_system.multiplicity`: Equal real products from different vectors contribute separately to `N`.
- `beurling_prime_system.ordinary`: Taking the increasing ordinary prime sequence recovers the ordinary positive integers and prime count.
- `beurling_prime_system.ext`: Two systems with identical indexed prime sequences are equal; proof fields do not change the carrier.
- `beurling_prime_system.norm_pos`: For each exponent vector `a,1≤norm(a)`, in particular `norm(a)>0`.
- `beurling_prime_system.norm_add`: For exponent vectors `a,b, norm(a+b)=norm(a)norm(b)`.
- `beurling_prime_system.prime_finite`: For each real `x` the prime indices `i` with `p(i)≤x` form a finite set.

**Checks.**

- If `p₁=p₂=2<p₃, N(2)=3` and `π_P(2)=2`, counting prime indices separately.
- For `1≤x<p₁, N(x)=1` and `π_P(x)=0`.
- A sequence with `p₁=1` is rejected because `N(x)` would have infinitely many unit powers.
- For `x=0` both `N(x)` and `π_P(x)` are0; the unit appears at `x=1`.

See [90][R90], Introduction p.1, definition and counting functions (1); §2.1 p.3.

*Needs:* `Nat.primeCounting`.

### 3.26 Uniform divisor subpower bound

For each `ε>0` there is a real `C≥1` such that `τ(n)≤C n^ε` for every positive integer `n`. One choice is `C=max(1,(ε log 2)⁻¹)^B` for any natural `B≥exp(1/ε)`.

Choose natural `B≥exp(1/ε)` by `exists_nat_ge`; the explicit bound of §3.1 gives `C≥1`, uniformly for `n>0`. This is existence for arbitrary real `ε>0`.

`ε=1/(64c), c>0`, supplies the exact ES.0 request for every `M>0`. `C` is retained at small inputs; setting `C=1` for all `n` fails at `n=2, ε=1/2`. No squarefreeness, primitivity or coprimality hypothesis appears.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* §3.1; `exists_nat_ge`.

### 3.27 Uniform bounded-norm ideal count

For each fixed `g≥1` and `ε>0` there is `C(g,ε)>0` such that for every number field `E` of degree 2g and every integer `n≥1`, the number of nonzero integral ideals of `norm n` is at most `C(g,ε)n^ε`. Consequently, for every real `X≥1` the number of such ideals of norm at most `X` is `O_(g,ε)(X^(1+ε))`. Both constants are uniform in `E`.

Combine the coefficient divisor majorant and the fixed-order divisor bound. Sum `m^ε` for `m≤X`; no field-dependent constant is introduced.

See [64][R64], 2.2, p. 382.

*Needs:* §3.3; §3.4.

### 3.28 Cardinality of medium-prime products

For fixed integer `m≥0, #N_m(x)∼(x/log x)^m/(2^m m!)` as `x→∞; m` is fixed, not uniform in `m`.

Apply the rational PNT at `x` and `x/2` to obtain `k(x)=#P_x∼x/(2log x)`; the closed lower endpoint differs from `π(x)−π(x/2)` by at most one prime. In particular `k(x)→∞`. Use the distinct-product cardinality result and compose `isEquivalent_choose(m)` with `k(x)→∞`. This includes `m=0` exactly, and yields `(x/log x)^m/(2^m m!)`.

See [50][R50], §3.6 (3.4), p.26.

*Needs:* §3.5; qualitative prime asymptotics; `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`; `isEquivalent_choose`; §3.28a.

**§3.28a Distinct-product cardinality.** For `x≥2,m≥0, #N_m(x)=binomial(#{p prime:x/2≤p≤x},m)`.

For two `m`-element subsets `s,t` of `P_x` with the same product, apply `Nat.primeFactors_prod` to both sides to get `s=t`. Apply `Finset.card_image_of_injOn` and `Finset.card_powersetCard` to the image defining `N_m(x)`.

See [50][R50], §3.6, definition and (3.4), p.26.

### 3.29 Truncated von Mangoldt function

For real `z≥1` and `n∈Z, Λ_z(n)=−Σ_{d∈N,1≤d≤z,d|n} μ(d)log d`. Divisibility of zero includes every positive `d`; the sum is finite by its cutoff.

Take the finite sum over positive naturals `d≤floor z` whose integer cast divides `n`; retain all positive `d` at `n=0` rather than substituting the empty native divisors(0). For `n≠0` and `z≥|n|`, identify this finite set with `Nat.divisors(n.natAbs)`. Apply `ArithmeticFunction.sum_moebius_mul_log_eq` at `n.natAbs` and negate. Divisibility is invariant under `n↦−n`. Evaluate `z=1`, the prime cutoff and `z=2,n=0` directly; these require no analytic cancellation theorem.

- `truncated_von_mangoldt.sum`: Evaluation is the cutoff positive-divisor sum.
- `truncated_von_mangoldt.neg`: `Λ_z(−n)=Λ_z(n)`.
- `truncated_von_mangoldt.zero`: `Λ_z(0)=−Σ_{1≤d≤z} μ(d)log d`.
- `truncated_von_mangoldt.large_cutoff`: For `n≠0` and `z≥|n|, Λ_z(n)=Λ_even(n)`.

**Checks.**

- `Λ_2(0)=log 2`, so truncation is not zero at zero.
- For a prime `p, Λ_z(p)=0` when `z<p` and `log p` when `p≤z`.
- `Λ_1(n)=0` for all `n`.

See [58][R58], §3.1, definitions preceding Corollary3.3, p.691.

*Needs:* §3.8; `ArithmeticFunction.moebius`; `ArithmeticFunction.sum_moebius_mul_log_eq`.

### 3.30 Shifted coprime Möbius sum

For each `A>0` there are constants `C_A>0` and `T_A≥2` such that for every real `T≥T_A` and every positive integer `1≤q≤√T, |Σ_{1≤t≤T/q,(t,q)=1}μ(t)log(qt)/t+q/φ(q)|≤C_A(log T)^(−A)`. The constants are independent of `q`.

Set `U=T/q≥√T`. Then `q≤U`, hence `q≤U^4`, so the two coprime Möbius supplier statements apply at `U`, with logarithmic exponent `A+1`. Expand `log(qt)=log q+log t`. Bound `log q≤(log T)/2` and `log U≥(log T)/2` to absorb the first sum into `O_A((log T)^−A)`.

See [58][R58], Lemma3.11 and proof, p.699.

*Needs:* §3.9; §3.12.

### 3.31 Asymptotic count of the three exceptional families

The union of `k=u²+v², 4(k−1)=u²+3v²` and `k−4=u²`, with `k` positive and `≤K`, has cardinality `∼C′ K/√log K` for a positive `C′`.

The constant is `C′=C_L+C_E`, with `C_E` specified in §3.14. Apply the two norm asymptotics, the intersection estimate below and finite inclusion-exclusion. Every intersection involving the shifted-square family is `O(√K)`. The only remaining pair has size `O(K/log K)`, hence is `o(K/√log K)`. The zero-norm and shifted endpoints change the counts by `O(1)`.

**§3.31a Shifted norm intersection sieve.** Let `A(k)` say `k` is a sum of two squares and `B(k)` say `k−1` is an Eisenstein norm. For each rational prime `p`, exclude the classes ap mod `p², 1≤a<p`, if `p≡3` mod4, and the classes `1+ap` mod `p²` if `p≡2` mod3. The two lists are disjoint because their reductions modulo `p` are0 and1. `A(k)∧B(k)` avoids their union `Ω_p`. Put `ω(p)=#Ω_p=(p−1)(1_{p≡3(4)}+1_{p≡2(3)})` and `g(p)=ω(p)/p²<1`. This retains `p=2` and3. For squarefree `d`, CRT gives exactly `ω(d)=∏_{p|d}ω(p)` forbidden joint classes mod `d²`, and their count up to `X` is `Xg(d)+O(ω(d))`.

Use Mathlib's `BoundingSieve` in `NumberTheory/SelbergSieve.lean`. For `X≥1,z≥1`, send each `1≤k≤X` to the squarefree product of primes `p≤z` with `g(p)>0` for which `k mod p²∈Ω_p`; give each product the cardinality of its fibre. This finite weighted support has nonnegative weights. Extend `g` multiplicatively with `g(0)=0` and `g(p^j)=g(p)^j`. Set `prodPrimes=∏_(p≤z,g(p)>0)p`, `totalMass=⌊X⌋` and `nu=g`. Native divisor counts are then the CRT counts with remainder bounded by `ω(d)` for divisors of `prodPrimes`, and the sifted sum counts integers avoiding these forbidden classes.

Use squarefree-supported real weights `λ_d`, `d≤z`, `λ₁=1`, omitting zero-density primes. Consume `BoundingSieve.upperMoebius_lambdaSquared` and `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius` for `count≤XQ+Σ_(d,e≤z)|λ_dλ_e|ω([d,e])`, `Q=Σλ_dλ_e g([d,e])`. Put `h(p)=g(p)/(1−g(p))`, `y_r=Σ_(r|d)λ_dg(d)`. With `selbergTerms=h`, `BoundingSieve.mainSum_lambdaSquared_eq_sum_mul_sum_sq` gives `Q=Σy_r²/h(r)`. Möbius inversion gives `λ₁=Σμ(r)y_r`; the minimizer is `y_r=μ(r)h(r)/G(z)`, `G=Σ_(r≤z)μ²(r)h(r)`, giving `Q=1/G`. Inversion bounds `|λ_d|≤∏_(p|d)(1−g(p))^−1≤d²`; with `ω([d,e])≤d²e²`, the remainder is `O(z^10)`.

To prove `G(z)≫log z`, fixed-modulus distribution modulo 12 gives `Σ_(p≤y)g(p)=loglog y+O(1)` and `Σg(p)logp≤C logy`, `C≥1`. Thus `W(y)=∏(1+h(p))≍logy`. On squarefree primorial divisors use probability `h(d)/W(y)`; its expected `log d` is `Σg(p)logp`. At `y=z^(1/(2C))`, Markov gives probability `d≤z` at least 1/2, so `G(z)≥W(y)/2`. Choose `z=X^(1/40)` to get `X/G(z)+O(z^10)≪X/logX`. Exact-valuation-one exclusions are necessary conditions, not exclusion of all inert prime factors.

API: `shiftedNorm.forbidden_card`, `.crt_count`, `.selberg_quadratic_diagonal`, `.weights_remainder`, `.intersection_bound`, `.union_constant`. Checks: for `p=2` the forbidden set is `{3 mod4}`, of size1; for `p=3` it is `{3,6 mod9}`, of size2; for `p=11` both families contribute and `#Ω_11=20`, not10 or `121; k=9` is allowed in A because `v_3(9)=2`; an integer avoiding every `Ω_p` maps to the empty product 1 and is retained by the native sieve. The local Selberg adapter transports the mod-`p²` counts and weights through the three supplied Mathlib theorems. The standard square-majorant method is in Koukoulopoulos, *The Distribution of Prime Numbers*, Chapter21 §§21.1–21.2 pp.213–218. The particular forbidden classes and the primorial probability lower bound are derived here for this application.

Prove the source asymptotic independently of two-sided comparison. At cutoff 13 the union is `{1,2,4,5,8,9,10,13}`, size 8; subtract overlaps. Removing `k=0` changes the count by at most 1.

See [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13; §8 p.24, arXiv:1706.06712v3.

*Needs:* Mathlib `NumberTheory/SelbergSieve.lean`; §3.13; §3.14; §3.15.

### 3.32 Restricted squarefree Landau asymptotic

For `D(X)={n∈N:1≤n<X, n squarefree, every odd prime factor p satisfies p≡1 mod4}`, there is a positive absolute `C_D` such that `#D(X)=C_D X/√log X·(1+O(1/log X))` as `X→∞`. The cutoff is strict, as in KP§1. `C_D=(3/(4√2))∏_{p≡1(4)}(1−p^(−2))∏_{p≡3(4)}(1−p^(−2))^(1/2)`, with positive convergent products.

For `Re s>1` the squarefree indicator has Euler series `D(s)=(1+2^(−s))∏_{p≡1(4)}(1+p^(−s))`. Factor `D(s)=ζ(s)^(1/2)L(s,χ_−4)^(1/2)H(s)`, choosing the positive branch on real `s>1`. Here `H(s)=(1+2^(−s))(1−2^(−s))^(1/2)∏_{p≡1(4)}(1−p^(−2s))∏_{p≡3(4)}(1−p^(−2s))^(1/2)`. Use a quantitative Selberg–Delange transfer with leading coefficient `L(1,χ_−4)^(1/2)H(1)/Γ(1/2)`; insert `L(1,χ_−4)=π/4` and `Γ(1/2)=√π`. The compact-parameter transfer gives this expansion with `J=2`. Absolute summability of `p^(−2)` proves positive product convergence. A strict versus inclusive height changes the count by at most1, which fits this error as `X→∞`.

`D(2)={1}; D(14)={1,2,5,10,13}`. The integer9 is excluded despite being a sum of two squares. The `p=2` Euler factor is `1+2^(−s)`, not `(1−2^(−s))^(−1); n=4` is excluded by squarefreeness. Every factor in `C_D` is positive; the logarithmic series is absolutely convergent.

See [51][R51], §1 pp.2–3, D(X) and classical asymptotic.

*Needs:* §3.16; `Squarefree`; `DirichletCharacter.LFunction`; `riemannZeta`; §3.12a.

### 3.33 Pretentious Halász mean bound

The ordinary-multiplicative signature is `halasz_mean`; its twist minimum is expressed as the infimum of the continuous squared distance on the compact twist interval.

For multiplicative `|f(n)|≤1, x≥2,T≥1`, let `M(x,T)=min_{|t|≤2T}D(f,n^(it);x)²`. Then `|Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2)`, with an absolute `C`; increasing `C` handles bounded `x`.

For completely multiplicative `g`, `|g|≤1` gives membership in `C(1)` with `Λ_g(p^j)=g(p)^jlogp`. GHS’s triple-convolution Perron, Shiu and Plancherel arguments give Theorem 1.1/Corollary 1.2, pp.7–13. Their normalized bound is `(1+M_F)e^−M_F+loglogx/logx`, where `e^−M_Flogx=max_(|t|≤logx)|F(1+1/logx+it)/(1+1/logx+it)|`. The maximum-principle rectangle bounds interior maxima by the left-edge maximum plus `O(1)`. With `|F(1+σ+it)|≤ζ(1+σ)`, integrate `min(e^−M_Flogx,1/σ)dσ/σ`, splitting at `σ=e^M_F/logx`. This yields `1+M_F`; bounded/negative `M_F` is absorbed in an absolute constant.

The Euler logarithm and Chebyshev partial summation give
`|F(1+1/log x+it)|≤C log x exp(−D(g,n^(it);x)²)`, uniformly in `t`.
Indeed the prime powers contribute `O(1)`; replacing `p^(−1−1/log x)` by `p^(−1)` on `p≤x` and discarding `p>x` costs `O(1)` in the logarithm. For `|t|≤2T` this bounds the maximum by `C e^(−M)log x`. For `|t|>2T` the denominator gives `C log x/T`. If `T≤log x`, then `e^(−M_F)≤C(e^(−M)+1/T)`, giving the desired first term plus `O((1+log T)/T)`; also `log log x/log x≪T^(−1/2)`. If `T>log x`, there is no second range. GHS Lemma2.7 supplies a positive absolute lower bound for the same maximum, so `M≤log log x+O(1)`; this absorbs `log log x/log x` into `(1+M)e^(−M)`. Bounded `x` and `T` are handled by the trivial mean bound. The phase is `Re(g(p)p^(−it))`, as required by the distance convention.

For general `f`, take completely multiplicative `g(p)=f(p)` and `f=g∗h`, where `h(p)=0`, `h(p^j)=f(p^j)−f(p)f(p^(j−1))`, `j≥2`. Thus `|h(p^j)|≤2` and `Σ|h(d)|/d^σ` is uniformly bounded for fixed `σ>1/2`. For `d≤√x`, apply the `g` bound at `y=x/d`; Mertens gives `M(y,T)≥M(x,T)−O(1)` since `Σ_(√x<p≤x)1/p=O(1)`. Sum with `|h(d)|/d`. The remaining normalized tail is `O(x^−1/8)` using `σ=3/4`; absorb it in `T^−1/2` if `T≤logx`, otherwise in the main term via the lower-maximum bound. This retains all prime powers without imposing `|Λ_f|≤Λ`.

API: `halasz_complete_euler_comparison`, `halasz_complete_height_split`, `halasz_prime_power_convolution`. Shiu’s independent sieve is below. Retain `h`: replacing `f` by its completely multiplicative prime extension alone is false.

For `f(n)=n^(it₀), |t₀|≤2T`, the twist minimum `M` is0, so the bound allows a nonzero mean. For `f` identically0 on primes the distance diagonal is not assumed to vanish; no completely-multiplicative hypothesis is imposed on general `f`.

See [85][R85], Theorem1.1 and Corollary1.2 p.2; full §2, especially Lemmas2.1–2.2 pp.7–9, Lemma2.6 pp.11–12, Lemma2.7 and the Corollary1.2 proof p.13. Their C(1) theorem applies directly to g; the Euler convolution above supplies general f. The classical twist convention is also stated in [84][R84], p.2.

*Needs:* §3.18; §3.45; the local complete-Euler, height-splitting and prime-power-convolution adapters stated here.

### 3.34 Dickman fixed-`u` asymptotic

The signature `smoothCount_dickman` constructs the unique continuous delay-equation solution and gives uniform convergence on each fixed compact interval of positive parameters, including the fixed-parameter limit.

For each fixed `u>0, Ψ(x,x^(1/u))/x→ρ(u)` as `x→∞`. This statement is not uniform for `u` tending to infinity.

Prove uniform convergence on each fixed `[a,U]`, `0<a≤U`. Put `Q(x,u)=Ψ(x,x^(1/u))/x`; for `u≤1` it is `⌊x⌋/x`. Induct on `U` by §3.34a. The adapter `prime_harmonic_rescaling` states `Σ_(x^b<p≤x^c)h(logp/logx)/p→∫_b^ch(t)dt/t` for continuous `h` and `[b,c]⊂(0,1)`, by §0.21’s uniform interval-mass `O(1/logx)` and step approximation. Discard `p>x^(1−η)` at cost `−log(1−η)+o(1)`, using `0≤Q≤1`. Else `x/p≥x^η` and the recursive parameter is in `[η/(1−η),U−1]`, so compact induction applies. The limit is `1−∫_(1/u)^1ρ(1/t−1)dt/t=1−∫₀^(u−1)ρ(v)dv/(v+1)=ρ(u)`. Send `x→∞` then `η↓0`; continuity handles `u=1` and moving endpoints. No growing-`U` claim is made.

The specialization `u=1` has exact `Ψ(x,x)=floor x` for `x≥2`. At `u=2` the limit is `1−log2`. Constants may depend on a fixed compact `u` range; this yields no growing-`u` uniformity.

See [86][R86], Introduction p.411 (terminology); unnumbered fixed-u limit preceding (1.5)–(1.6), p.414. Equations (1.5)–(1.6) specify the delay equation and initial data.

*Needs:* §3.20; §3.21; §0.21; `Nat.mem_smoothNumbersUpTo`; §3.34a; the compact-limit and prime-rescaling adapters above.

**§3.34a Largest-prime-factor smooth decomposition.** For `x≥1,y≥2, Ψ(x,y)+∑_{y<p≤x, p prime}Ψ(x/p,p)=floor x`. Each positive non-`y`-smooth integer has a unique largest prime divisor `p>y`, and dividing by one copy of `p` leaves a `p`-smooth integer. Repeated largest primes are permitted.

**Checks.**

- If `y≥x`, the prime sum is empty and `Ψ(x,y)=floor x`.
- At `x=1`, the smooth fibre contains 1 and the prime sum is empty.

Partition positive `n≤⌊x⌋` by smoothness and largest prime `p>y`. Division by one `p` identifies each nonsmooth fibre with positive `p`-smooth `m≤⌊x/p⌋`, inverse `m↦pm`. Repeated `p` is allowed; 1 belongs to the smooth fibre. Sum the disjoint cardinalities.

See [86][R86], Introduction, p.411 (terminology); p.414 unnumbered fixed-u limit preceding (1.5)–(1.6); elementary largest-prime partition used for its limiting recursion.

### 3.35 Rankin smooth-number upper bound

For `x≥1,y≥2` and `σ>0, Ψ(x,y)≤x^σ∏_{p≤y}(1−p^−σ)^−1`. The finite-prime Euler product is finite and each geometric series converges.

For counted `n`, `1≤(x/n)^σ`. Enlarge the resulting finite reciprocal-power sum to the nonnegative `y`-smooth series and apply §3.35a. At `x=1`, the count is 1 and all Euler factors exceed 1.

The bound is valid for every `σ>0`, including `σ≤1`; only finitely many primes occur. For `x=1` the count is `1; σ=0` is excluded because the geometric factors are not summable.

See [86][R86], Introduction, p.411 (terminology); p.414 equation(1.3), page image.

*Needs:* §3.20; `Nat.equivProdNatFactoredNumbers`; §3.35a.

**§3.35a Finite-prime smooth Dirichlet series.** For `y≥2` and `σ>0`, the nonnegative real series `∑_{n≥1, n y-smooth}n^(−σ)` is summable and equals `∏_{p≤y}(1−p^(−σ))^(−1)`. This is a finite-prime identity valid for every positive `σ`, even `σ≤1`.

Use `Nat.equivProdNatFactoredNumbers` to index positive smooth integers by exponents on the finite primes `p≤y` (equivalently `p<⌊y⌋+1`). Each ratio satisfies `0<p^−σ<1`. Summable geometric series, finite Tonelli and real-power multiplication give the product. Zero is excluded; no `σ>1` premise is needed.

See [86][R86], Introduction, p.411 (terminology); p.414 equation(1.3), finite-prime geometric factorization.

### 3.36 Zeta function of an indexed Beurling system

Prove absolute summability and the indexed Euler product under absolute real convergence for every `σ>1`.

For an indexed Beurling prime system `P` and `Re s>1` with `Σ_(a∈N^(N))norm_P(a)^−σ` summable for every real `σ>1`, define `ζ_P(s)=Σ_a exp(−s log(norm_P(a)))` over finitely supported exponent vectors. Repeated prime values remain different indices. The totalized sum outside this domain is not its analytic continuation.

Compact subsets of `Re s>1` admit a fixed summable real majorant from a smaller real exponent `σ₀>1`. Independent geometric sums on finite prime-index sets converge to the vector series. Summable logarithmic factors give a nonzero limit.

- `beurling_zeta.summable`: The exponent-vector complex series is absolutely summable on `Re s>1` under the stated real convergence hypothesis.
- `beurling_zeta.nonzero`: `ζ_P(s)≠0` on `Re s>1` under the same hypothesis.
- `beurling_zeta.analytic`: `ζ_P` is analytic on a neighbourhood of every point of `Re s>1`.

**Checks.**

- For the indexed ordinary primes, `ζ_P(s)=ζ(s)` on `Re s>1`.
- On `Re s>1`, if every ordinary prime appears at two consecutive indices, `ζ_P(s)=ζ(s)²`.
- The zero exponent vector contributes exactly1 for every `s`.

See [90][R90], §2.1, (5)–(7) and discrete Euler product, pp.2–3.

*Needs:* §3.25; §3.36a.

**§3.36a Beurling counting growth from summability.** For a Beurling system `P`, real `σ>0` and `S=Σ_a norm(a)^−σ` with summable nonnegative summands, `N(x)≤S x^σ` for `x≥1`, and `π_P(x)≤N(x)`. Thus convergence for every `σ>1` gives `N(x),π_P(x)=O_ε(x^(1+ε))` for every `ε>0`.

Each counted vector satisfies `1≤x^σ norm(a)^−σ`. Bound its finite sum by the full summable nonnegative sum. Map each counted prime index injectively to its unit exponent vector. Repeated equal real primes remain distinct vectors.

See [90][R90], §2.1 p.3, growth deduction after (6).

**§3.36b Rough progression sieve with its remainder.** For integers `q≥1, (a,q)=1`, real `X≥H>q` and `z≥2`, the count of `X−H<n≤X, n≡a` mod `q`, with no prime divisor `≤z` is at most `C H/(φ(q)log z)+Cz²`, with an absolute `C`. Modulus one is included. This supplies Shiu Lemma2 p.164, whose printed proof refers to a sieve book.

Write `n=a+qt`. Each `p∤q` excludes one `t`-class; `p|q` excludes none. CRT gives density `1/d` and error `≤1` for squarefree `d⊥q`. The §3.31a quadratic diagonalization with `g(p)=1/p,h(p)=1/(p−1)` gives `Q=1/G_q(z)`, `G_q=Σ_(d≤z,d⊥q)μ²(d)/φ(d)`. Inversion gives `|λ_d|≤d/φ(d)` and `Σ_(d≤z)|λ_d|≤Cz`, by `d/φ(d)=Σ_(e|d)μ²(e)/φ(e)` and convergence of `Σμ²(e)/(eφ(e))`; hence the CRT error is `Cz²`. Splitting each squarefree integer into `q`-part and coprime part gives `G₁≤(q/φ(q))G_q`. Also `G₁≥Σ_(d≤z)μ²(d)/d≫logz`, by the square-divisor union bound `Σ_(m≥2)m^−2<1` and partial summation. Combine with `t`-interval length `H/q`. No distribution-level assumption enters.

API: `roughProgression.crt_density`, `.selberg_weights`, `.weight_l1_bound`, `.uniform_modulus`, `.upper_bound`. Checks: `q=1` uses the same proof; a not coprime to `q` is rejected (a progression divisible by a small `p` has a different density); `z>H` is allowed because the `z²` term is retained; replacing the local density by `1/φ(d)` would already fail at `p=2`. Source: Shiu, [91][R91], Lemma2 p.164 and its uses pp.167–169; the finite weight computation here supplies the previously external step.

*Needs:* §3.31a; `Nat.chineseRemainder`; finite Möbius inversion; [ArithmeticDirichletSeries layer6][R1].

### 3.37 Shiu bound for the Halász coefficient class

The signature `shiu_bound` keeps its constant and threshold uniform in the function, interval and reduced residue class.

For fixed `κ>0` and `0<ε<1` there are `C(κ,ε)>0` and `X(κ,ε)>1` such that for every `f∈C(κ), x≥X, x^ε≤z≤x`, positive integer `q≤z^(1−ε)`, and integer a coprime to `q`, the sum of `|f(n)|` over positive integers `x−z≤n≤x` with `n≡a` mod `q` is at most `C z/(φ(q) log x) exp(Σ_{p≤x, p∤q}|f(p)|/p)`. The constants are independent of `f,a,q,z`. Modulus one is included.

The coefficient majorant gives `|f(p^j)|≤d_κ(p^j)≤d_r(p^j)≤(j+1)^r` and `d_κ(p^j)≤r^j`, `r=⌈max(1,κ)⌉`. Thus `|f(n)|≤τ(n)^r`, and §3.1 gives uniform subpower growth depending only on `κ,δ`, verifying Shiu’s hypotheses. Factor by increasing primes with full prime powers, hence coprime factors. In his four classes, I/IV apply the rough-progression sieve after fixing the small factor `b≤z₀=y^(α/10)`; Lemmas 1,3,4 control smooth/reciprocal sums. The local Lemma 2 proof retains its `z²` error and `q`-uniformity. Classes II/III have count `O((y/q)z₀^−1/4)` and weighted bound `O((y/q)z₀^−1/8)` by subpower growth. IV sums the convergent `(r+1)A₅^r exp(−rlogr/10)`. Remainders are absorbed as `q<y^(1−α)`. Choose `0<α,β<min(ε,1/2)` for inclusive endpoint ranges and `q=1`. A lower-endpoint term is absorbed using subpower exponent `<ε²/2`, since the majorant is at least `z/(qlogx)≥x^ε²/logx`. Distinguish Shiu’s sieve cutoff from interval length `z`.

Retain the reduced-residue hypothesis and the uniform dependence on `κ,ε`. For `q=1` and `z=x` this gives the usual multiplicative mean majorant. The function `n↦2^Ω(n)` fails the subpower condition: its values at powers of 2 prevent applying Shiu’s theorem.

See [91][R91], Theorem 1, pp.162–163; Lemmas 1–4 and proof §§4–5, pp.164–169; [85][R85], Lemma 2.3 and its application, pp.9–11.

*Needs:* §3.19; §3.1; `ArithmeticFunction.IsMultiplicative`; `Chebyshev.psi_le_const_mul_self`; §3.36b.

### 3.38 Eventual unit-constant divisor bound

For each `δ>0` there is a natural `N≥1` such that every natural `n≥N` satisfies `τ(n)≤n^δ`. If `C≥1` is the uniform constant at `ε=δ/2`, any natural `N≥max(1,C^(2/δ))` suffices.

Use uniform-divisor-subpower-bound with `ε=δ/2`. Choose natural `N≥max(1,C^(2/δ))` using `exists_nat_ge`. For `n≥N`, monotonicity of positive real powers and `Real.rpow_mul` give `C≤n^(δ/2)`. Apply absorb-divisor-bound-constant.

`N≥1` excludes the library's totalized zero input. Replacing `δ` by `2ε` gives the equivalent eventual form used in the divisor estimate. The result makes no universal claim at `n=2`.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* §3.26; `Real.rpow_add`; `Real.rpow_nonneg`; `exists_nat_ge`; `Real.rpow_le_rpow`; `Real.rpow_mul`; §3.38a.

**§3.38a Absorption of the divisor-bound constant.** For `n>0` and `ε,δ,C∈ℝ`, if `τ(n)≤C n^ε` and `C≤n^(δ−ε)`, then `τ(n)≤n^δ`.

Multiply `C≤n^(δ−ε)` by `n^ε≥0` and compose with the first inequality. Apply `Real.rpow_add` at positive `n` and simplify `(δ−ε)+ε=δ`.

### 3.39 Von Mangoldt truncation error

`E_z(n)=Λ_even(n)−Λ_z(n)` for `n∈ℤ` and `z≥1`.

Subtract the two real-valued functions on `ℤ`. Their evenness yields evenness of `E_z`. At `n=0` use `vonMangoldt(0)=0` and the finite cutoff sum, giving `E_z(0)=Σ_{1≤d≤z}μ(d)log d`. At `n≠0` and `z≥|n|` use the divisor identity through `truncated_von_mangoldt.large_cutoff`, giving `E_z(n)=0`.

- `mangoldt_truncation_error.sub`: `E_z` is the displayed difference.
- `mangoldt_truncation_error.neg`: `E_z(−n)=E_z(n)`.
- `mangoldt_truncation_error.zero`: `E_z(0)=Σ_{1≤d≤z} μ(d)log d`.

**Checks.**

- `E_2(0)=−log 2`.
- For `p>z, E_z(p)=log p`.
- For `n≠0` and `z≥|n|, E_z(n)=0`.

See [58][R58], §3.1, definitions preceding Corollary3.3, p.691.

*Needs:* §3.8; §3.29.

### 3.40 Wintner-type mean over prime divisors

For fixed `n∈N,c>0` and `f` on rational primes with `|f(p)|≤c/p`, set `a(t)=∏_{p|t}(1+f(p))^n` for `t≥1`. Then `Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1`, where `C=∏_p(1+((1+f(p))^n−1)/p)`; the product is absolutely convergent and `f` may be complex.

Set `g(1)=1, g(d)=|μ(d)|∏_(p|d)((1+f(p))^n−1)` for `d>0` and `g(0)=0`. Finite expansion gives `a=1∗g`. Binomial bounds give `|g(p)|≤K_(n,c)/p, K≥1`; for squarefree `d, |g(d)|≤K^ω(d)/d≤τ(d)^α/d, α=max(1,logK/log2)`. Divisor subpower at `1/(4α)` gives `|g(d)|≤B_(n,c)d⁻³ᐟ⁴`, so `M=Σ|g(d)|/√d<∞` uniformly after `n,c`. Apply Mathlib `ArithmeticFunction.IsMultiplicative.eulerProduct_tprod` to the multiplicative arithmetic function `d↦g(d)/d`, with value 0 at 0. Its norm is summable by the preceding bound. Squarefree support reduces the local series at `p` to `1+g(p)/p`, identifying `C=Σg(d)/d` with the Euler product. In `Σ_(t≤x)a(t)=Σ_(d≤x)g(d)floor(x/d)`, floor replacement and the `C`-tail each cost `≤√xM`. No new generic Wintner supplier is needed.

For `n=0, a(t)=1` and `C=1`; the discrepancy is `floor(x)−x`, of absolute value at most 1. For `n=1` with `f(2)=1/2` and `f(p)=0` for all odd primes, `C=5/4` and the exact sum is `floor(x)+(1/2)floor(x/2)`. For complex `f(p)`, all error estimates use absolute values and the constant depends only on `n,c`, not on the particular function `f`.

See [58][R58], Lemma4.3 and full proof, pp.705–706, equations(4.2)–(4.3).

*Needs:* `ArithmeticFunction.mul_apply`; `ArithmeticFunction.moebius`; §3.26.

**§3.40a Integrated prime-divisor mean.** With `a,C` as in §3.40, `∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1`.

The indicator integral is `T−t` for `t≤T`, and zero otherwise. Interchange the finite nonzero sum, then integrate the mean estimate on `[1,T]`. The interval `[0,1)` costs `O_(n,c)(1)` and the error integral is `O_(n,c)(T^(3/2))`.

Checks: at `T=1` the weighted sum is 0; for `n=0,T=2` the integral is 1, equal to `(2−1)`; at integral `T` the endpoint term is zero, so including `t=T` introduces no jump in the integral.

See [58][R58], Lemma4.3, pp.705–706. *Needs:* §3.40; finite-sum integration.

### 3.41 Restricted squarefree Sathe–Selberg bounds

The signature `restricted_sathe_selberg` uses `restrictedSquarefreeCount` and keeps one pair of constants throughout each fixed positive A range.

Let `D_r(N)={n∈D(N):ω(n)=r}`, with `D(N)` the strict-cutoff squarefree family defined in `restricted_squarefree_landau_count` and `ω(n)` the number of distinct prime divisors. For each fixed `A>0` there are `C₁,C₂>0` and `N₀≥3`, depending only on A, such that for every real `N≥N₀` and integer `1≤r≤A log log N, C₁(N/log N)(½ log log N)^(r−1)/(r−1)!≤#D_r(N)≤C₂(N/log N)(½ log log N)^(r−1)/(r−1)!`. No `r=0` or varying-A uniformity is asserted.

Mark primes by `z` in `D(s,z)=(1+z2^−s)∏_(p≡1(4))(1+zp^−s)` and extract `z^r`. The exponent is `z/2`. Apply §3.12a on `|z|≤R`, `R>2A+2`, with `|f_z|≤τ_k`, `k≥R`. Put `λ=loglogN/2`. The leading term is `(N/logN)zA₀(z)e^λz`, `A₀(z)=Q_z(1)/(2Γ(1+z/2))`, analytic on fixed discs, positive for real `z≥0`, and `A₀(0)=1/2`. Each lower term is `z` times a bounded analytic factor with another inverse `logN`. Take enough terms for uniform error `N(logN)^−B`, for any `B`.

For `A₀=Σa_jz^j`, `m=r−1≤2Aλ`,
`[z^m](A₀e^λz)/(λ^m/m!)=Σ_(j≤m)a_j(m)_j/λ^j=A₀(m/λ)+O_A(1/λ)`.
Cauchy gives `|a_j|≤CR^−j`; use `|m^j−(m)_j|≤j(j−1)m^(j−1)/2` and the geometric tail, with `m=0` exact. The positive minimum/finite maximum on `[0,2A]` give both constants; apply the same estimate to lower terms. Cauchy on `|z|=r/λ` (`1/λ` at `r=1`) and Stirling bound the absolute remainder relative to the main scale by `O_A((logN)^(−B+1+A)√(r+1)λ)`, so `B>A+3` suffices. The strict endpoint change has weight `R^ω(n)≤τ_k(n)`, negligible by subpower growth. This proves the full fixed-A range; CKMP p.13 supplies only its smaller displayed range.

For `r=1` the family counts2 and primes `≡1` mod4 below `N`, and has size asymptotic `N/(2 log N)`. `D_0(N)={1}` for `N>1` and is outside the theorem; at `N=14` the `r=1` and `r=2` counts are3 and1 respectively. Constants are fixed after A, before `N` and `r`; a fixed-`r` theorem alone cannot justify `r` of order `log log N`.

See [51][R51], §7.1 Theorem7.2, (7.3), p.60; proof citing[8] p.13; [92][R92], §4 opening, p.13.

*Needs:* §3.32; §3.12a.

### 3.42 Beurling PNT with all logarithmic remainders

The two-sided remainder signature is `BeurlingPrimeSystem.pnt_iff_integerCount`, with one density `a>0` preceding all remainder exponents.

For a discrete Beurling system whose `ζ` converges on `Re s>1, π_P(x)=Li(x)+O_m(x/log^m x)` for every `m≥1` iff `N(x)=ax+O_m(x/log^m x)` for every `m≥1` for some `a>0`. Each error constant may depend on `m` and the system.

Use §3.42c to replace `π` by `Π`. Fix `Li(x)=∫₂^xdt/logt`, `x≥2`; additive constants fit every eventual remainder. Apply §3.42a to `S(u)=N(e^u)`, `T(u)=ae^u` and the smooth extension of `ζ_P−a/(s−1)`. Debruyne–Vindas Theorem 3(ii) has one `ε` for all derivatives; (iii) is uniform on `σ>1` for each `ε` and derivative. Proposition 1 supplies the Abelian direction and Theorem 2 the converse. Lemma 1’s 3–4–1 argument gives closed-half-plane nonvanishing of `(s−1)ζ_P` and reciprocal subpower bounds. Apply the same pair to `S₁(u)=Π(e^u)`, `T₁(u)=∫₁^(e^u)(1−1/y)dy/logy`, whose transform is `G₁=log((s−1)ζ_P)−Log s` on the real-normalized branch. The stronger Abelian `G₁=o(log|t|)` controls exponentiation; `a=expG₁(1)>0`. §3.42a supplies all derivative, smoothing and pole-division estimates.

The density `a>0` is quantified once, before all `m`. Error constants and eventual cutoffs may depend on `P` and `m`. Taking each ordinary prime twice gives `N(x)∼x log x` and `π_P(x)∼2Li(x)`, so neither side holds. Convergence alone does not force density1. The residue-subtracted boundary at1 is the extension value; no equality with the totalized series value there is asserted.

See [90][R90], Theorem1 p.2; entire §§3–4 pp.4–11, Theorem2, Proposition1, Theorem3, Lemma1.

*Needs:* §3.25; §3.36; §3.42b; §3.36a; §3.42c.

**§3.42a Smooth Laplace boundary and one-sided remainder.** Use Debruyne–Vindas, [On general prime number theorems with remainder][R90], Theorem2 and its proof pp.4–5, Proposition1 pp.6–7, Theorem3 and Lemma1 pp.7–11, with their Fourier convention `f̂(t)=∫e^(−itu)f(u)du`. The input is a nondecreasing, right-continuous `S` supported on `[0,∞)`, a locally bounded-variation `T`, eventually absolutely continuous with `T′≤Ae^u`, and convergence of `L(dS−dT)` for `Re s>1`. The boundary is a `C∞` extension of this transform, with `|G^(n)(1+it)|≤C_n(1+|t|)^{β_n}` and `β_n/n→0`. No ordinary prime spacing or density hypothesis is added.

To prove `S−T=O_m(e^u/u^m)` for all `m`, modify `T` on a bounded interval and split its signed variation so `0≤T′≤Ae^u`. Put `Δ=e^−u(S−T)`, zero for negative `u`. Integration by parts gives `LΔ(s)=G(s+1)/(s+1)`. Damped Laplace limits against Schwartz tests identify the distributional Fourier boundary with `G(1+it)/(1+it)`; after making `β_n` nondecreasing, its nth derivative is `O_n((1+|t|)^(β_n−1))`. This justifies Fourier pairing without assuming `Δ` integrable.

Monotonicity gives persistence: for `Δ(h)>0` and `0≤v≤min(Δ(h)/(2A),log(4/3))`, `Δ(h+v)≥Δ(h)/4`; for negative `Δ` use the backward interval. For `A=0` use the fixed interval. A nonnegative smooth unit-mass bump on `(0,1)` or `(−1,0)`, rescaled to `δ`, and `n` integrations by parts give
`|Δ(h)|≤C_nh^−nδ^−β_n`,
uniformly for `0<δ≤log(4/3)` by Schwartz seminorms and vanishing boundary terms. Fixed width first gives `Δ→0`; then `δ=|Δ(h)|/(2A)` yields `|Δ(h)|≤C_nh^(−n/(β_n+1))`. For each `m` choose `n` with `n/(β_n+1)>m`.

Conversely fix `T` and all remainder exponents. Split the Stieltjes integral at `X`, integrate the tail by parts and differentiate `n` times. For `γ>n+1`, compact and tail bounds are `C_nX^(n+1)` and `C_(n,γ)(1+|t|)X^(n−γ+1)`, uniformly `1≤σ≤2`. At `X=|t|^(1/γ)`, arbitrarily large `γ` gives `O_(n,ε)((1+|t|)^ε)`; `σ≥2` is absolutely convergent. If `T′≤Be^u/u`, the `n=0` compact term is `O(logX)`, giving `G=o(log|t|)`. Choose `m` after `n` for differentiated absolute convergence. Uniform interior derivative bounds and FTC on compact rectangles give the smooth boundary, including Theorem 3(iii)→(ii).

The Euler logarithm gives `|ζ(η)^3ζ(η+it)^4ζ(η+2it)|≥1`, `η>1`. Since `ζ(η)∼a/(η−1)`, a boundary zero would imply `(η−1)^3=O((η−1)^4)` by a local derivative bound. At large height, `|ζ(σ+it)−ζ(η+it)|≤C(η−1)|t|^ε`; choose `η−1=c|t|^−5ε`. The 3–4–1 bound gives `|ζ(σ+it)|≥c′|t|^−4ε` both for `σ≤η` and directly for `η≤σ≤2`. Compact heights use nonvanishing of `(s−1)ζ`, and `σ≥2` the Euler product. Relabel `ε` and differentiate for reciprocal/logarithmic subpower bounds.

Use the real-normalized analytic branch `G₁=log((s−1)ζ)−Log s`. Reciprocal bounds give its boundary derivative growth; conversely `G₁=o(log|t|)` gives `expG₁=O_ε(|t|^ε)`. At 1, `a=expG₁(1)>0` is fixed before error exponents. Smooth pole division uses
`(F(s)−a)/(s−1)=∫₀¹F′(1+v(s−1))dv`,
for `F(1)=a` on the closed right half-plane, with all derivatives dominated as above. The `S₁,T₁` transform identity completes both implications.

API: `beurlingBoundary.laplace_fourier`, `.one_sided_persistence`, `.smoothed_remainder`, `.all_remainders`, `.abelian_derivatives`, `.sublogarithmic_bound`, `.reciprocal`, `.pole_division`. Checks: a is unchanged when `m` changes; doubled ordinary primes fail the simple-pole hypothesis; `ζ_P`'s totalized value at1 is never used; `β_n=n` would not yield all `m` and is rejected; additive constants in `Li` are absorbed in all eventual remainders.

**§3.42b Beurling zeta and Euler product.** If `Σ_n n^−σ` (with generalized-integer multiplicities) converges for every real `σ>1`, then `ζ_P(s)=Σ_n n^−s=∏_j(1−p_j^−s)^−1` on `Re s>1`, absolutely and locally uniformly. The convergence hypothesis is additional to the prime-system axioms.

Use the exponent-vector series and its real summability for every `σ>1`. Geometric summation over the first `M` prime indices gives the finite products. Exhaust finite-support vectors; on compact `K⊂{Re s>1}`, choose `1<σ₀<inf_K Re s`, so the summable `norm(a)^−σ₀` majorizes all terms and gives uniform convergence. The prime-index injection bounds `Σ_jp_j^−σ₀`; summable local logarithms then give the nonzero product and the analytic logarithm normalized on the real half-line.

See [90][R90], §2.1 pp.2–3, (5)–(7) and displayed discrete Euler product.

**§3.42c Beurling higher-prime-power correction.** For `x≥1, J=floor(log x/log p₁)` and `Π_P(x)=Σ_{1≤j≤J}π_P(x^(1/j))/j`, all later terms are0. For `x≥p₁, 0≤Π_P(x)−π_P(x)≤π_P(sqrt x)+π_P(x^(1/3))log x/log p₁`. Under convergence for every `σ>1`, the difference is `O_ε(x^(1/2+ε))` for every `ε>0`.

Use `p₁>1` to bound `j` for any prime power `≤x`. Isolate `j=1` and `j=2`; for `3≤j≤J` use `x^(1/j)≤x^(1/3)` and bound `1/j≤1`. Apply the counting-growth lemma at exponent `1+η` with `0<η<2ε`. Absorb the logarithm in the strictly smaller exponent for the `j≥3` contribution. The finite low-`x` range changes only the constant.

See [90][R90], §2.1 p.3, (7) and subsequent prime-power bounds.

### 3.43 Mangoldt weight in a Fourier window

For each fixed `c₀>0` there is `C(c₀)>0` such that for every real `T≥1` and `m≥T², Σ_{n≥1, |log(n/m)|≤c₀/T}Λ(n)≤C(c₀)m/T`. The sum includes all prime powers, with `Λ(1)=0`.

Put `X=mexp(c₀/T), H=m(exp(c₀/T)−exp(−c₀/T))≈_(c₀)m/T`. If `H≈X` use Chebyshev; absorb bounded `m` in `C(c₀)`. Otherwise large-window primes exceed `m^1/4`. The rough indicator (all prime factors `>m^1/4`) belongs to `C(1)`, with logarithmic coefficients `Λ` at allowed powers. Apply uniform Shiu at `q=1` and fixed `ε<1/2; H≳√m` ensures its range. Chebyshev/partial summation bounds `Σ_(m^1/4<p≤X)1/p=O_(c₀)(1)`, giving `O_(c₀)(H/log m)` primes and `Λ`-mass `O(H)`. Higher powers cost `Σ_(j≥2)θ(X^1/j)≤C√X`: the `j≥3` sum `≤X^1/3log₂X=O(√X)`. Since `m≥T², √X≲_(c₀)m/T`. Add both contributions.

The Fourier support radius is `c₀` and its contribution to `C` is explicit in the quantifiers. The proof includes prime squares and higher powers; a prime-count estimate alone does not establish the statement. The condition `m≥T²` is retained. A window with `m=2^j` and `T` arbitrarily large would contain weight `log 2` while `m/T` tends to zero.

See [85][R85], Lemma 2.6, p.11, last paragraph of its proof; [91][R91], Theorem 1, pp.162–163.

*Needs:* §3.37; §3.19; `Chebyshev.psi_le_const_mul_self`; [ArithmeticDirichletSeries 6][R1].

### 3.44 Uniform cancellation of the truncation error `E_z` (Corollary 3.3)

For `A>0` and `y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A`.

Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff. Keep `y,z≥2` so no negative power of log1 occurs.

See [58][R58], Corollary3.3 and proof reference, p.691.

*Needs:* §3.39; §1.2.

**§3.44a Two-sided error and the zero term.** For `y,z≥2` and `A>0` the two-sided sum `Σ_{|r|≤y}E_z(r)e^(irα)` has absolute value `≤2C_A y(log y)(log z)^−A+|E_z(0)|`. The zero term is bounded separately by `O_A(z(log z)^−A)`.

Pair the positive and negative summands using evenness; apply the positive estimate to `α` and `−α`. Use Möbius cancellation and partial summation for the finite zero sum.

See [58][R58], §3.1 definitions and Corollary3.3, p.691.

*Needs:* §3.44; §1.2; evenness of `E_z`; Abel summation.

### 3.45 Halász integral mean bound

The signature `halasz_integral_mean` uses the compact supremum of `|F(s)/s|` and fixes its threshold before the coefficient-class member.

For fixed `κ>0, f∈C(κ)` and sufficiently large `x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x`. The constant is uniform in `f`.

Use the small/large-prime convolution, Lemma 2.2’s exact double integral, local Shiu/Lemma 2.3, Lemmas 2.4–2.5 and Proposition 2.1. Set `T=(logx)^(κ+1)`, `y=T²`, `η=1/logy`; eventually `1≤T≤x^0.9`, `10≤y≤√x`. Apply §3.45a’s single-`Λ` mean bound to both large-prime polynomials, then Cauchy–Schwarz and Chebyshev summation (2.6). Integrate `α`, put `σ=β+1/logx`, and reduce the height maximum to `(logx)^κ` using `|F(1+σ+it)|≤ζ(1+σ)^κ` and the denominator `s`. The discarded height tail is `O_κ(x/logx)`; enlarge `σ` to 1 and collect `O_κ(x(loglogx)^κ/logx)` errors. Unweighted mean square does not replace §3.45a.

Constants and the sufficiently-large-`x` threshold depend only on `κ`, before quantifying over `f∈C(κ)`. The maximum is of `|F(s)/s|`, not `|F(s)|`; the final `t` range is `(log x)^κ`, while the proof uses the larger auxiliary `T`.

See [85][R85], Theorem1.1 p.2; §2 pp.7–12, Lemmas2.2–2.6, Proposition2.1 and final proof.

*Needs:* §3.37; §3.43; §3.19; [ArithmeticDirichletSeries 6][R1]; `Chebyshev.psi_le_const_mul_self`; §3.45a.

**§3.45a Prime-weighted Dirichlet-polynomial mean bound.** There is an absolute `C>0` such that for `T≥1, x≥1` and any complex coefficients `a(n)`, the integral from `−T` to `T` of `|∑_{T²≤n≤x}a(n)Λ(n)exp(−it log n)|²` is at most `C∑_{T²≤n≤x}n|a(n)|²Λ(n)`. The finite sums use inclusive real cutoffs. If `x<T²` they are empty.

Use `Φ(t)=(sint/t)²/(sin1)²` with continuous value at 0. Expand the finite square under this nonnegative majorant; its angular Fourier transform is `π(2−|u|)_+/(2sin²1)`, supported on `[−2,2]`. Thus off-diagonal pairs satisfy `|log(n/m)|≤2/T`. Apply `2|a(m)a(n)|≤|a(m)|²+|a(n)|²`, symmetry and §3.43 at `c₀=2`; retain the diagonal and `κ,T,y` dependence. The rough indicator’s `C(1)` witness has logarithmic coefficient `Λ` on allowed prime powers and zero elsewhere; `ζ` majorizes its convergent series.

See [85][R85], §2.3 Lemma2.6 and its complete proof, p.11.

**Checks.**

- If `x<T²`, both finite sums are empty, including when the lower cutoff is not an integer.
- For one supported prime power `n≥T²`, the integral is `2T|a(n)|²Λ(n)²`; the right side retains one `Λ(n)` and the factor `n`.
- At `T=2,x=4`, the lower endpoint includes `n=4` with `Λ(4)=log2`. A coefficient supported at a positive non-prime-power contributes zero.

### Proof-route checks

- §3.33 deduces Halász's distance form through complete Euler products, height splitting and prime-power convolution from the GHS integral theorem. §3.36b supplies Shiu's finite-remainder sieve, including `q=1`. Keep generalized-binomial/divisor domination, exact double-integral Perron, weighted Plancherel and the rough-number `C(1)` witness. The Fourier window has angular support`[−2,2]` and all prime powers (§3.19, §3.45, §3.33, §3.37, §3.43).
- Dickman construction glues consecutive intervals with the negative-argument convention. Its fixed-`u` limit needs quantitative prime partial summation in the largest-prime recursion, terminal control and compact-`u` convergence; it gives no growing-`u` asymptotic (§3.21, §3.34, §3.35).
- §3.22 uses the finite divisor-pair bijection and Euler harmonic bounds, without PNT. The quantitative second moment uses the half-endpoint divisor remainder, positive-axis Bessel remainders, conditional Voronoi convergence, both quantitative saddle families and the explicit Atkinson budget (§§3.23a–g). Their build order is `a,b,c,d,e,f,g`; in particular the moving-saddle estimates precede the Voronoi integrated exchange. The fourth moment uses the four explicit auxiliary estimates and diagonal/off-diagonal decomposition of §3.24; no Heath-Brown error estimate is assumed.
- §3.42a requires Laplace–Stieltjes integration by parts, tempered Fourier boundary, one-sided bump and `β_n/n→0` optimization. Conversely retain all-derivative Abelian bounds, `o(log|t|)`, weak-boundary upgrade,3–4–1 reciprocal bounds and smooth pole division. Ordinary Wiener–Ikehara cannot replace these measure adapters (§3.42).
- §3.6 needs a complete proof of the inverse-totient `O(x)` bound.
- §3.12a retains every truncation order, divisor bound, branch, residual derivatives and compact-parameter constants. §3.12b and §3.14 give positivity; §3.31a's `O(K/log K)` intersection suffices for `C_L+C_E`. Retain residue-character expansion, maximal exponent, positive residual and outside-subgroup zero counts, without varying-modulus uniformity (§3.13, §3.14, §3.31, §3.16).
- §3.40 retains `a=1∗g`, uniform `Σ|g(d)|/√d<∞` and `C=Σg(d)/d`. §3.10 uses binomial bounds/summable logs for arbitrary retained prime subsets.

### Examples

The divisor bounds include `n=1`, where `τ(1)=1`, and exclude `n=0`. The strict-cutoff Mathlib parameter is `⌊y⌋+1`. Pretentious distance from 1 to itself is zero; the completely multiplicative function taking `−1` at each prime has positive distance from 1 once the range contains a prime. A finite reciprocal sum over `y`-smooth integers up to `x` is bounded by the full finite-prime Euler product, and is generally smaller: at `x=y=2` the values are 3/2 and 2.

### Dependencies

Mathlib prime factorization, divisors, convolution, Möbius and von Mangoldt functions; ArithmeticDirichletSeries Euler products, Abel and Perron summation; Layer 0 prime estimates; Layer 1 Dirichlet-polynomial means and Fourier estimates. The second moment also uses the K-Bessel kernel of §2.1a and Mathlib's first-kind `J` (From Mathlib Bessel theory); its `Y` function, divisor transform and quantitative saddle adapters are local. The short-interval and Mangoldt-window estimates are owned here, so no later sieve or circle-method roadmap is a prerequisite.

## Downstream consumers

Downstream consumers AnalyticNumberTheoryPartII, the ArithmeticStatistics parts and ModularityAndLanglandsExtensions use the prime-error, Hecke/Artin, class-number and multiplicative-mean interfaces. They supply no input to this roadmap.

The uniform exclusion of Landau–Siegel zeros (§0.34) and its effective corollaries (§§0.1, 0.6, 0.9, 0.18, 0.28, 0.31b, 0.32, 1.2, 2.13) have these downstream consumers:

- QuadraticCharactersAndReduction: its §Q2 classification of primitive real characters by fundamental discriminants, through §0.34a.
- SieveMethodsAndPrimePatterns: its small-conductor and Bombieri–Vinogradov estimates, through §§0.18 and 0.32.
- The explicit prime-counting roadmaps, through Siegel–Walfisz (§0.32) and the real-character estimates (§§0.18, 0.31b), and AnalyticNumberTheoryPartII, through §2.31e, whose quadratic step uses the effective gap of §0.31b.

ZerosOfLFunctions and ImaginaryQuadraticClassNumber stand before this part and keep their statements; what this part takes from them (ZerosOfLFunctions Layers 0–8, ImaginaryQuadraticClassNumber H2.2) precedes §0.34. The exception-free forms over `ℚ` of ZerosOfLFunctions 6.3–6.4 and 8.6–8.8 and the effective forms of ImaginaryQuadraticClassNumber H2.3–H2.4 (`quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound`) are stated here (§§0.1, 0.6, 0.9, 0.18, 0.32) and consumed from here by the roadmaps above.

## References

- **47.** [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums][R47].
- **48.** [Michael A. Bennett, Greg Martin, Kevin O'Bryant and Andrew Rechnitzer — Explicit bounds for primes in arithmetic progressions][R48].
- **49.** Dimitris Koukoulopoulos — The Distribution of Prime Numbers.
- **50.** [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures][R50].
- **51.** [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture][R51].
- **53.** [Kiran S. Kedlaya — Notes on analytic number theory][R53].
- **54.** [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions][R54].
- **56.** [J.S. Milne — Class Field Theory][R56].
- **58.** [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points][R58].
- **59.** [Ben Green and Terence Tao — The primes contain arbitrarily long arithmetic progressions][R59].
- **60.** [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields][R60].
- **61.** [Jean-François Mestre — Formules explicites et minorations de conducteurs de variétés algébriques][R61].
- **62.** [H. L. Montgomery and R. C. Vaughan — Hilbert’s inequality][R62].
- **63.** [Gaëtan Chenevier, Olivier Taïbi — Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms][R63].
- **64.** [Jacob Tsimerman — The André–Oort conjecture for `A_g`][R64].
- **66.** [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions][R66].
- **67.** [Asif Ali Zaman — Analytic estimates for the Chebotarev Density Theorem and their applications][R67].
- **71.** [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series][R71].
- **72.** [Stéphane Louboutin — Explicit upper bounds for residues of Dedekind zeta functions and values of L-functions at `s=1`, and explicit lower bounds for relative class numbers of CM-fields][R72].
- **73.** [Jesse Thorner and Asif Zaman — An explicit bound for the least prime ideal in the Chebotarev density theorem][R73].
- **76.** [Hans Heilbronn — On real zeros of Dedekind `ζ`-functions][R76].
- **77.** [Hideo Aramata — Über die Teilbarkeit der Dedekindschen Zetafunktionen][R77].
- **78.** [Lillian B. Pierce, Caroline L. Turnage-Butterbaugh and Melanie Matchett Wood — An effective Chebotarev density theorem for families of number fields, with an application to ℓ-torsion in class groups][R78].
- **79.** [Terence Tao — The divisor bound][R79].
- **80.** [A. Smati — Evaluation effective du nombre d’entiers `n` tels que `φ(n) ≤ x`][R80].
- **82.** [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces][R82].
- **83.** [Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou — Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields][R83].
- **84.** [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function][R84].
- **85.** [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences][R85].
- **86.** [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors][R86].
- **87.** [Aleksander Simonič and Valeriia V. Starichkova — Atkinson’s formula for the mean square of `ζ(s)` with an explicit error term][R87].
- **88.** [A. E. Ingham — Mean-value theorems in the theory of the Riemann zeta-function][R88].
- **89.** [J. B. Conrey — A note on the fourth power moment of the Riemann zeta-function][R89].
- **90.** [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder][R90].
- **91.** [P. Shiu — A Brun–Titchmarsh theorem for multiplicative functions][R91].
- **92.** [Stephanie Chan, Peter Koymans, Djordjo Milovic, Carlo Pagano — On the negative Pell equation][R92].

- [95][R95] A. Kupers, *Lectures on complex analysis*, 30 April 2020, §14.1 pp.89–93.
- [96][R96] `H`. Kösters, *The Riemann Zeta-Function and the Sine Kernel*, arXiv:0803.1141v1, §3 pp.9–15 and AppendixA p.20.
- [97][R97] Matti Jutila, *On Linnik's constant*, Math. Scand. 41 (1977), 45–62; Theorem 1 and §3.
- [98] Jürgen Neukirch, *Algebraic Number Theory*, Grundlehren der mathematischen Wissenschaften 322, Springer, 1999; Chapter VII §§6–8 (Hecke's theta method), §10 (Artin `L`-series) and §11 (Artin conductors).
- [99][R99] Enrico Bombieri, *Le grand crible dans la théorie analytique des nombres*, Astérisque 18 (second edition, 1987); §10, Théorème 20.
- [100] Hugh L. Montgomery, *Topics in Multiplicative Number Theory*, Lecture Notes in Mathematics 227, Springer, 1971; Theorem 12.1.
- [101][R55] Gergő Nemes, *Error bounds and exponential improvements for the asymptotic expansions of the gamma function and its reciprocal*, Proc. Roy. Soc. Edinburgh Sect. A 145 (2015), 571–596; arXiv:1310.0166v2.
- [102][R68] Habiba Kadiri and Nathan Ng, *Explicit zero density theorems for Dedekind zeta functions*, J. Number Theory 132 (2012), 748–775; arXiv:1201.3932v1.
- [103][R69] Andrew M. Odlyzko, *Lower bounds for discriminants of number fields II*, Tôhoku Math. J. 29 (1977), 209–216.
- [104][R70] Habiba Kadiri, *Explicit zero-free regions for Dedekind zeta functions*, Int. J. Number Theory 8 (2012), 125–147.
- [105][R74] Harold M. Stark, *Some effective cases of the Brauer–Siegel theorem*, Invent. Math. 23 (1974), 135–152.
- [106][R75] Peter J. Cho, Robert J. Lemke Oliver and Asif Zaman, *Effective Brauer–Siegel theorems for Artin `L`-functions*, arXiv:2510.02309v2.
- [107][R81] Andrew Granville and Dimitris Koukoulopoulos, *Beyond the LSD method for the partial sums of multiplicative functions*, Ramanujan J. 49 (2019), 287–319; arXiv:1710.01389v2.
- [108] Hugh L. Montgomery, *Zeros of L-functions*, Invent. Math. 8 (1969), 334–345.
- [109] OpenAI, *Uniform exclusion of Landau–Siegel zeros*, OpenAI mathematics release of 1 October 2026, repository `openai/math`, file `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`, 9 pages; the numbering is that of the 1 October 2026 version, not of the community revision of 26 October 2026; Theorem 1 (statement), §2 Lemma 2 (prime bias forced by a real zero), §6 (completion of the proof).
- [110] Ben Green, *On Landau–Siegel zeros*, Hexagon 2610.00311, 2026; Theorem 1.1, §§2–6 (the Gram determinant and its three bounds) and Appendix A (resultants).
- [111] Terence Tao, *A sketch of the proof of non-existence of Siegel zeroes*, blog post, 2026; an exposition of the argument.
- [112] Harold Davenport, *Multiplicative Number Theory*, 2nd ed., revised by Hugh L. Montgomery, Graduate Texts in Mathematics 74, Springer, 1980; Chapter 5 (real primitive characters).
- [113] John B. Friedlander and Henryk Iwaniec, *A note on Dirichlet L-functions*, Expo. Math. 36 (2018), 343–350, doi:10.1016/j.exmath.2018.06.003.
- [114] Walter Rudin, *Real and Complex Analysis*, 3rd ed., McGraw–Hill, 1987; Chapter 15 (infinite products and Weierstrass factorization).
- [115] Jean-Pierre Serre, *Local Fields*, Graduate Texts in Mathematics 67, Springer, 1979; Chapter VI (Artin and Swan representations, conductors) and Chapter XV §2 (upper numbering and local reciprocity).

- **Bessel functions.** [NIST Digital Library of Mathematical Functions, Chapter10][DLMF-Bessel], particularly §§10.2,10.4,10.6,10.9,10.16; equation numbers are the locators in this unpaginated reference.
- **Nemes.** [Gergő Nemes — Error bounds for the large-argument asymptotic expansions of the Hankel and Bessel functions][Nemes], arXiv:1606.07961v2, 2017; positive-axis remainder theory and AppendixA.
- **Meurman.** [Tom Meurman — A simple proof of Voronoi’s identity][Meurman], Astérisque209 (1992), pp.265–274; endpoint identity, damping and convergence.
- **BBR.** [Djamel Berkane, Olivier Bordellès and Olivier Ramaré — Explicit upper bounds for the remainder term in the divisor problem][BBR], Mathematics of Computation81 (2012), pp.1025–1051; explicit divisor inputs and their proofs.

[R1]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-6-abel-and-perron-summation
[Artin-FE]: https://people.math.osu.edu/cogdell.1/artin-www.pdf
[RR-primes]: https://ramare-olivier.github.io/Maths/rumely.pdf
[R2]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-3-local-factors-and-euler-products
[R3]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-8-landau-type-positivity
[R4]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-1-norm-fibres-and-mathlib-lseries
[R5]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-9-wienerikehara
[R6]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-10-generic-prime-number-theorem-transfer
[R7]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-5-ideal-and-prime-estimates
[R8]: ../../Completed/ArithmeticDirichletSeries/README.md#layer-4-counting-carriers-and-local-finiteness
[R9]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md
[R10]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md
[R11]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-0-growth-predicates-and-the-entire-completion
[R12]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-1-gamma-factor-asymptotics-and-the-continued-l-function
[R13]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-3-convexity-in-vertical-strips
[R14]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-4-zero-counting
[R15]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-5-hadamard-factorization
[R16]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-6-zero-free-regions
[R17]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-7-the-riemannvon-mangoldt-formula
[R18]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-8-the-explicit-formula
[R19]: ../GlobalNumberFields/README.md#layer-9-hecke-and-ray-class-characters
[R20]: ../GlobalNumberFields/README.md#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
[R21]: ../GlobalNumberFields/README.md#layer-2-moduli-and-ray-class-carriers
[R22]: ../GlobalNumberFields/README.md#layer-4-finite-adeles
[R24]: ../NumberFieldArithmetic/README.md#layer-2-frobenius-elements-and-the-artin-symbol
[R25]: ../NumberFieldArithmetic/README.md#layer-1-the-splitting-dictionary
[R26]: ../NumberFieldArithmetic/README.md#layer-7-subfields-integral-bases-monogenicity-and-explicit-units
[R27]: ../ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity
[R28]: ../ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields
[R29]: ../ClassFieldTheory/README.md#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors
[R30]: ../RepresentationTheory/InductionRestriction/README.md#layer-6-the-virtual-character-ring-artin-and-brauer-induction
[R31]: ../RepresentationTheory/InductionRestriction/README.md#layer-3-the-mackey-decomposition-formula
[R32]: ../DifferentialGeometry/README.md#layer-12-riemannian-metrics-and-the-laplacebeltrami-operator
[R35]: ../GlobalNumberFields/README.md#layer-11-orders-and-picard-groups
[R43]: ../Chebotarev/README.md#layer-13-ϑ_c-and-π_c
[R44]: ../Chebotarev/README.md#layer-14-natural-density-and-consistency-theorems
[R45]: ../Chebotarev/README.md#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions
[R46]: ../Chebotarev/README.md#layer-8-the-cyclic-fixed-field-fibre
[R47]: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf
[R48]: https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf
[R50]: https://arxiv.org/pdf/2007.14567v3
[R51]: https://arxiv.org/pdf/2201.13424v1
[R52]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md#layer-4-dirichlet-l-functions-and-factorizations
[R53]: https://kskedlaya.org/papers/ant-ptx.pdf
[R54]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf
[R55]: https://arxiv.org/pdf/1310.0166v2
[R56]: https://www.jmilne.org/math/CourseNotes/CFT.pdf
[R57]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md#layer-5-finite-order-hecke-l-functions
[R58]: https://eprints.gla.ac.uk/292484/1/292484.pdf
[R59]: https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf
[R60]: https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf
[R61]: https://www.numdam.org/item/CM_1986__58_2_209_0.pdf
[R62]: https://personal.science.psu.edu/rcv4/personal/Publications/s2-8-1-73.pdf
[R63]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf
[R64]: https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf
[R66]: https://doi.org/10.1017/S2050508625000009
[R67]: https://www.math.toronto.edu/zaman/files/thesis.pdf
[R68]: https://arxiv.org/pdf/1201.3932v1
[R69]: https://www.jstage.jst.go.jp/article/tmj1949/29/2/29_2_209/_pdf/-char/ja
[R70]: https://www.cs.uleth.ca/~kadiri/articles/zero-free-region-Dedekind-June07-2011.pdf
[R71]: https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf
[R72]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2672D419BA7EA98C5C7C757259F2DA83/S0008414X00028418a.pdf/explicit-upper-bounds-for-residues-of-dedekind-zeta-functions-and-values-of-l-functions-at-s-1-and-explicit-lower-bounds-for-relative-class-numbers-of-cm-fields.pdf
[R73]: https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf
[R74]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0023/LOG_0016.pdf
[R75]: https://arxiv.org/pdf/2510.02309v2
[R76]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf
[R77]: https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf
[R78]: https://arxiv.org/pdf/1709.09637
[R79]: https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/
[R80]: https://www.impan.pl/shop/publication/transaction/download/product/107486
[R81]: https://arxiv.org/pdf/1710.01389v2
[R82]: https://arxiv.org/pdf/1706.06712v3
[R83]: https://doi.org/10.1017/fmp.2022.14
[R84]: https://arxiv.org/pdf/math/0608407
[R85]: https://arxiv.org/pdf/1706.03749v1
[R86]: https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf
[R87]: https://arxiv.org/pdf/2105.06821v3
[R88]: https://doi.org/10.1112/plms/s2-26.1.273
[R89]: https://arxiv.org/pdf/math/9509224
[R90]: https://arxiv.org/pdf/1601.05324
[R91]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf
[R92]: https://arxiv.org/pdf/1908.01752


[R95]: https://www.utsc.utoronto.ca/people/kupers/wp-content/uploads/sites/50/2020/12/complex-analysis-2019.pdf
[R96]: https://arxiv.org/pdf/0803.1141v1
[R97]: https://journals.msp.org/mscand/article/download/1943/1942
[R99]: https://www.numdam.org/item/AST_1987__18__1_0/

[DLMF-Bessel]: https://dlmf.nist.gov/10
[Nemes]: https://arxiv.org/pdf/1606.07961v2
[Meurman]: https://numdam.org/item/AST_1992__209__265_0.pdf
[BBR]: https://ramare-olivier.github.io/Maths/Divisors-mcom2535.pdf

