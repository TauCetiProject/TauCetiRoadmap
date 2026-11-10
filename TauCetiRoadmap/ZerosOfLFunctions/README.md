# Roadmap: zeros of L-functions — growth, zero-free regions, counting, and the explicit formula

**Summary.** This roadmap develops the analytic theory of the zeros of a completed L-function
that has already been continued meromorphically and given a functional equation by the
[L-functions roadmap](../LFunctions/README.md). From that roadmap's analytic records it builds the
growth theory of the completed function (Stirling's formula on vertical strips, the order of an
entire function, the analytic conductor), the continued uncompleted L-function and its convexity
bound, zero counting with multiplicity, Hadamard's factorization at order at most one, the
classical zero-free regions with their exceptional-zero alternative, the Riemann–von Mangoldt
formula in its degree-and-conductor-uniform form, the truncated and Weil explicit formulas, and
the semantics of a certified list of zeros. The end theorems are the de la Vallée Poussin region
for the Dedekind zeta function and for the L-functions of finite-order ray-class characters, the
uniform Riemann–von Mangoldt formula for both families, and the effective prime ideal theorem, the
effective prime count in a ray class, and the effective abelian Chebotarev count with error
`O(x exp(−c √log x))` and main term the offset logarithmic integral.

Suggested home: `TauCeti/NumberTheory/LFunctions/Zeros/`, divided into `Growth/`,
`GammaAsymptotics/`, `AnalyticConductor/`, `Convexity/`, `Counting/`, `Hadamard/`, `ZeroFree/`,
`RiemannVonMangoldt/`, `ExplicitFormula/` and `Certificates/`.
[`Suggested.lean`](Suggested.lean) states the headline theorems against the pinned libraries; it is
not the roadmap.

## Scope and ownership

### Owned here

- the order predicate `OrderLE` for an entire function, the entire completion of an analytic
  record, and the vertical-strip growth predicate (Layer 0);
- a holomorphic branch of `log Γ` on a sector and Stirling's asymptotics on vertical strips, the
  analytic reciprocal of a gamma factor, and the continued uncompleted L-function of a record
  (Layer 1);
- the analytic conductor of a record and its comparison with degree and arithmetic conductor
  (Layer 2), in the Iwaniec–Kowalski normalization (5.7), with its comparison 2.4 against Tau
  Ceti's newform analytic conductor `HeckeRing.GL2.Newform.analyticConductorAt`, which the
  [modular forms roadmap](../ModularForms/README.md) consumes in its supplier contracts and which
  takes the arithmetic coordinate;
- convexity bounds on vertical strips for the pole-cleared continued L-function (Layer 3);
- the signed divisor count and the natural-number zero count `zeroCount` in a region, the
  counting function `N(T)` and its symmetric variant, and the Jensen-type local counts (Layer 4);
- the Weierstrass elementary factor `E₁`, the canonical product indexed by a divisor, and
  Hadamard's factorization at order at most one for a general entire function (Layer 5);
- the zero-free regions for Dedekind zeta functions and for L-functions of primitive finite-order
  ray-class characters, with the exceptional-zero predicate (Layer 6);
- the boundary of a rectangle as a closed piecewise-`C¹` curve, its winding numbers, the argument
  principle on a rectangle in divisor language, and the Riemann–von Mangoldt formula (Layer 7);
- the contour shift for `−ζ'_K/ζ_K`, the truncated and Weil explicit formulas, the effective
  prime ideal theorem, the effective prime count in a ray class, its transport to an abelian
  extension, and the two-term comparison `Li x − x/log x ∼ x/log² x` (Layer 8);
- the semantics of a certified list of zeros and the generalized Riemann hypothesis as a `Prop`
  over the two families (Layer 9).

### Consumed, not redefined

- the analytic records, their duals, the continuation and functional-equation predicates, the
  continued Dedekind zeta and Hecke L-functions and their completions, the presentation-versus-
  conductor apparatus for ray-class characters, the partial zeta functions, and the average
  coefficient growth predicate: the [L-functions roadmap](../LFunctions/README.md), Layers 0–8, of
  which Tau Ceti realizes the records and predicates of Layer 0, the Dirichlet record of Layer 4,
  the primitive characters, presented Hecke L-functions and Euler corrections of Layer 5, the
  `3-4-1` combination of Layer 7 and the Dedekind von Mangoldt identity and positivity of Layer 8;
- the residue calculus — winding numbers, null-homology, residues, the argument principle for a
  null-homologous closed piecewise-`C¹` curve, the continuous argument lift, and the
  winding-number form of `∮ f'/f` — as Tau Ceti realizes the
  [contour integration roadmap](../../Completed/ContourIntegration/README.md);
- ideal arithmetic functions, the ideal von Mangoldt function, the prime count `π_K` and
  Chebyshev's `ϑ_K` and `ψ_K` over a set of primes, the higher-prime-power estimate for
  `ψ_K − ϑ_K`, Abel and truncated Perron summation, the offset logarithmic integral and the
  prime-number-theorem transfer, from the
  [Arithmetic Dirichlet Series roadmap](../../Completed/ArithmeticDirichletSeries/README.md),
  Layers 0–2, 4–6 and 10, as Tau Ceti realizes them, together with Tau Ceti's qualitative prime
  ideal theorem, which 8.5 strengthens;
- moduli, ray class groups, ray-class characters and the class of an ideal prime to a modulus, from the
  [Global Number Fields roadmap](../../Completed/GlobalNumberFields/README.md), Layers 2 and 9, as
  Tau Ceti realizes them;
- the Artin symbol, from the
  [Number Field Arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md), §2.3, and the
  Frobenius prime sets and Frobenius counting functions with their qualitative asymptotics, and
  the qualitative prime number theorem in arithmetic progressions, from the
  [Chebotarev roadmap](../../Completed/Chebotarev/README.md), Layers 2 and 11–14;
- the ray-class Artin map and its splitting law, from the
  [Class Field Theory roadmap](../ClassFieldTheory/README.md), Layer 12, as Tau Ceti realizes it,
  which discharges the reciprocity hypothesis of 8.8;
- the offset logarithmic integral `TauCeti.Real.logIntegral`, its first integration by parts and
  its one-term asymptotic: Arithmetic Dirichlet Series §6.2.

### Not owned here

- constructing L-functions, continuing them, or proving functional equations (the L-functions
  roadmap); no zero theorem here is stated for a bare record without the continuation of its
  family;
- proving the Riemann hypothesis, the generalized Riemann hypothesis, or the nonexistence of
  exceptional zeros; Siegel's theorem and every lower bound for `1 − β` uniform in the conductor,
  so no implied constant of an effective prime count here (8.5–8.8) is uniform in the modulus or
  the character (the width `c` of an error `O(x exp(−c √log x))` is uniform in the modulus in 8.7
  and its `K = ℚ` case);
- identifying an exceptional zero with the zero of a quadratic character's L-function (a
  Stark-type statement), and the Landau–Page statement across a family of characters;
- interval arithmetic, numerical evaluation of zeros, and decimal constants: constants in the
  zero-free regions and the effective estimates are existential, with their dependence pinned;
- Weierstrass factorization beyond genus `0` and `1`: elementary factors `E_p` for `p ≥ 2` and
  Hadamard's theorem beyond order one;
- subconvexity: no target improves the exponent `1/4` of Layer 3;
- Artin L-functions of degree greater than one, Brauer induction, and effective Chebotarev for a
  nonabelian class, which needs them; the Selberg class and converse theorems;
- the generic residue calculus itself (Tau Ceti), which Layer 7 consumes and specializes to
  rectangles.

## Conventions

- **Normalization.** Everything is in the analytic normalization: the functional equation
  reflects in `s ↦ 1 − s`, the critical strip is `0 ≤ Re s ≤ 1`, and the critical line is
  `Re s = 1/2`. An arithmetic-normalized record reaches these theorems through the L-functions
  roadmap's `NormalizationTranslation`, and every statement about the critical line of such a
  record is that translation applied to a theorem here.
- **Order and vanishing.** Order is `meromorphicOrderAt f z : WithTop ℤ` and the divisor is
  `MeromorphicOn.divisor f U`. "`f` has a zero of order `m` at `ρ`" is
  `meromorphicOrderAt f ρ = m` with `0 < m`; "`f` has no zeros and no poles on `S`" is
  `∀ z ∈ S, meromorphicOrderAt f z = 0`. Mathlib's meromorphic functions are total: at a pole the
  representative takes a junk value, `0` for `Complex.Gamma` and `Gammaℝ`, so `f z ≠ 0` is neither
  necessary nor sufficient for regularity and never characterizes a zero or a pole.
  `MeromorphicOn.divisor f U` has junk value `0` off meromorphy and at every point outside `U`, so
  meromorphy on a stated open set is a hypothesis of every theorem about a count, and a value of
  the divisor is claimed only at points of `U`.
- **Order and values.** `meromorphicOrderAt f z = 0` is a statement about the punctured germ. It
  gives neither `AnalyticAt ℂ f z` nor `f z ≠ 0`, and it does not make the image of a path through
  `z` miss `0`: the function equal to `1` near `z` except for the value `0` at `z` has order `0`
  everywhere and divisor `0`. Germ-level order is the hypothesis for a count (Layers 4 and 9);
  anything evaluated pointwise (the argument principle and the argument lift of Layer 7) takes
  `AnalyticAt ℂ f z` and `f z ≠ 0`, written out. For a record `d : TauCeti.LFunctions.AnalyticLFunctionData`
  the analyticity off the polar divisor is the field `HasMeromorphicContinuation.analyticAt`.
- **The two counts.** *divisorCount* `f U R : ℤ` is `∑ᶠ ρ ∈ R, MeromorphicOn.divisor f U ρ`, in
  which poles count negatively, and is what a contour integral computes. `zeroCount f U R : ℕ`
  sums the positive part, `(MeromorphicOn.divisor f U ρ).toNat`, and is what `N(T)`, the
  Riemann–von Mangoldt formula and every certificate use. They agree when `R` contains no pole,
  which is a hypothesis; the converse needs the divisor to have finite support in `R`, since over
  the infinitely many poles of `Γ` in `R = ℂ` both finite sums take the junk value `0`.
- **Infinite sums.** `∑ᶠ` is `0` on an infinite support, so it appears only over bounded regions
  where finiteness is proved. A sum over all zeros of an L-function — the zero side of the Weil
  formula, a Hadamard-type sum — is `∑'` together with a `Summable` statement, since `∑'` is `0` on
  a non-summable family. `meromorphicOrderAt f z ≠ 0` is not a finite-support condition: the order
  of `f = 0` is `⊤` everywhere while its divisor is `0`.
- **Rectangles.** A closed rectangle is `Set.Icc σ₁ σ₂ ×ℂ Set.Icc t₁ t₂` and a half-open one is
  `Set.Icc σ₁ σ₂ ×ℂ Set.Ioc t₁ t₂` (Mathlib's `Complex.reProdIm`); the half-open direction is the
  imaginary one. *Valid* means `σ₁ ≤ σ₂ ∧ t₁ ≤ t₂`; a reversed pair gives the empty set and count
  `0`.
- **Counting convention.** `N(T)` is `zeroCount` of the completed function `Λ` over
  `Icc 0 1 ×ℂ Ioc 0 T`: zeros with `0 < Im ρ ≤ T`, multiplicity included, a zero at height `T`
  counted. `N±(T)` is the count over `Icc 0 1 ×ℂ Icc (−T) T`. The trivial zeros of `L` do not
  appear: there the gamma factor has a pole and `Λ` is regular and nonzero.
- **Finite order.** An entire `f` has order at most `A`, `OrderLE f A`, when
  `f =O[cobounded ℂ] fun s ↦ Real.exp (‖s‖ ^ A')` for every `A' > A`. No numeric order is defined,
  and no limsup-of-`log log` or Nevanlinna order is used without a lemma relating it to
  `OrderLE`.
- **Conductors.** *arithmeticConductor* is the record's `conductor : ℕ+`; *analyticConductorAt*
  `d s` is `N ∏_j (‖s + μ_j‖ + 3) ∏_k (‖s + ν_k‖ + 3)(‖s + ν_k + 1‖ + 3)`, each `Gammaℂ(s + ν)`
  contributing the pair of shifts `ν, ν + 1` it splits into under duplication; and
  *centralAnalyticConductor* `d` is its value at `1/2`. The `+3` is part of the convention.
- **Gamma factors.** `Complex.Gammaℝ s = π^(−s/2) Γ(s/2)` and `Complex.Gammaℂ s = 2 (2π)^(−s) Γ(s)`,
  with `Complex.Gammaℝ_mul_Gammaℝ_add_one`. They have no zeros and simple poles at
  `{0, −2, −4, …}` and `{0, −1, −2, …}`; Mathlib's `Gammaℝ_eq_zero_iff` describes the junk value at
  those poles, not a vanishing.
- **Smooth test functions.** "Smooth" is `ContDiff ℝ ∞ φ` with `∞ = ((⊤ : ℕ∞) : WithTop ℕ∞)`
  (scoped notation `ContDiff`). `ContDiff ℝ ⊤ φ` is real-analyticity in Mathlib's `WithTop ℕ∞`
  indexing, and a compactly supported real-analytic function on `ℝ` is `0`, so that spelling
  would make the test class of 8.4 trivial.
- **Uniformity.** Uniformity in a parameter is a quantifier order: the constant is chosen before
  that parameter. An `=O[atTop]` after fixing a field, a modulus or a character is a fixed-object
  statement whose constant and threshold may depend on it.

## Exact supplier contracts

### From Mathlib

- `MeromorphicOn.divisor`, `MeromorphicOn.divisor_def` (the value `0` off `U`),
  `meromorphicOrderAt`, `MeromorphicOn.divisor_restrict`,
  `Function.locallyFinsuppWithin.posPart_apply`, `LocallyFiniteSupport.finite_inter_support_of_isCompact`,
  `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`, `MeromorphicOn.extract_zeros_poles`,
  `meromorphicTrailingCoeffAt` (divisors, local finiteness, identity theorem, normal form);
- `MeromorphicOn.circleAverage_log_norm`, `AnalyticOnNhd.sum_divisor_le` (Jensen's formula and
  the disc zero bound), with `AnalyticAt.analyticOrderAt_eq_natCast` (the factorization
  `f = (z − c)^m g`, `g c ≠ 0`, at a zero of finite order),
  `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE` (the value `g c` is the trailing
  coefficient of `f` at `c`) and `Complex.norm_le_of_forall_mem_frontier_norm_le` with
  `frontier_ball` (the maximum principle on a ball) for the trailing-coefficient form of 4.3;
- `ValueDistribution.logCounting`, `ValueDistribution.log_counting_zero_sub_logCounting_top`,
  `Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const` (Nevanlinna
  counting, for the comparison of 4.6);
- `PhragmenLindelof.vertical_strip` (convexity on a strip);
- `Convex.contractibleSpace`, `SimplyConnectedSpace.ofContractible` (simple connectivity of
  `Set.univ`, and of the strip `Ω_δ` of 1.1 that `exp` carries onto the sector `S_δ`, for Tau
  Ceti's holomorphic logarithm), `Complex.log_exp` and `Complex.exp_log` (`exp` maps `Ω_δ`
  injectively onto `S_δ`), `Complex.exp_eq_exp_iff_exists_int` (for 1.1 and 5.4),
  `is_const_of_deriv_eq_zero` (uniqueness of an entire logarithm modulo `2πi ℤ`, for 5.4), and
  `IsOpen.is_const_of_deriv_eq_zero` with `Convex.isPreconnected` and `IsPreconnected.image`
  (uniqueness of the branch of 1.1 on the open preconnected sector, which omits the poles of `Γ`);
- `Complex.differentiableOn_update_limUnder_of_bddAbove` (removable singularities);
- `Summable.multipliableLocallyUniformlyOn_one_add`, `tprod_one_add_ne_zero_of_summable`,
  `logDeriv_tprod_eq_tsum` (infinite products), with `multipliable_sineTerm` and
  `cot_series_rep` as the genus-`0` model;
- `Complex.borelCaratheodory`;
- `Complex.Gamma`, `Complex.digamma`, `Complex.Gammaℝ`, `Complex.Gammaℂ`,
  `Complex.differentiable_one_div_Gamma`, `Complex.differentiable_Gammaℝ_inv`,
  `Complex.differentiable_Gammaℂ_inv` (the reciprocal gamma functions are entire);
- `Complex.Gammaℝ_ne_zero_of_re_pos` and `differentiableAt_completedZeta` (`Gammaℝ` has no zero on
  `Re s > 0`, and `completedRiemannZeta` is analytic off `0, 1`; for confinement in 7.4);
- `Complex.Gamma_eq_integral`, `Real.Gamma_eq_integral`, `Real.convexOn_Gamma`,
  `Complex.Gamma_conj`, `Complex.Gammaℝ_conj`, `Complex.Gammaℂ_conj`, `deriv_conj_conj`,
  `Complex.digamma_one_sub`, `Complex.digamma_two_mul`, `completedRiemannZeta_one_sub`,
  `logDeriv_riemannZeta_one_sub`, `Complex.Gammaℝ_eq_zero_iff`, `differentiableAt_riemannZeta`,
  `logDeriv_congr_nhds`, `logDeriv_congr_nhdsNE`, `logDeriv_mul`, `logDeriv_comp` (Euler's
  integral, conjugation, and the functional equation of `ζ'/ζ`, for 1.3a and 1.4a);
- `Summable.of_nonneg_of_le` (comparison, for 5.6a);
- `completedRiemannZeta`, `completedRiemannZeta₀`, `riemannZeta`, `riemannZeta_zero`,
  `riemannZeta_def_of_ne_zero`, `riemannZetaZeros`, `isDiscrete_riemannZetaZeros`,
  `IsCompact.inter_riemannZetaZeros_finite`, `RiemannHypothesis`;
- `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`,
  `riemannZeta_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  `DirichletCharacter.norm_LFunction_product_ge_one`; `DirichletCharacter.primitiveCharacter`,
  `DirichletCharacter.changeLevel_primitiveCharacter` (a character is the change of level of its
  primitive character), `DirichletCharacter.LFunction_changeLevel` (for `s ≠ 1`, the L-function at
  level `N` is the one at level `M ∣ N` times `∏_{p ∣ N} (1 − χ(p) p^{−s})`) and
  `DirichletCharacter.changeLevel_eq_one_iff`, for 6.4 at `K = ℚ`;
- `mellin`, `mellinInv`, `mellinInv_mellin_eq` (Mellin transform and inversion);
- `Rat.HeightOneSpectrum.primesEquiv` (the height-one primes of `𝓞 ℚ` and the rational primes,
  through `Rat.HeightOneSpectrum.natGenerator`) and `ZMod.isUnit_iff_coprime`, for 8.7 at `K = ℚ`;
- `Chebyshev.psi`, `ArithmeticFunction.vonMangoldt`, `NumberField.dedekindZeta`,
  `NumberField.dedekindZeta_residue`, `Ideal.absNorm`.

### From Tau Ceti

Exact declarations of the Tau Ceti pin, each with its file under `TauCeti/`:

- holomorphic logarithms (`Analysis/Complex/BranchLogRoot.lean`):
  `TauCeti.exists_differentiableOn_eqOn_exp_comp`, a holomorphic `f` on a simply connected open
  `U` with `exp ∘ f = g` on `U` for `g` holomorphic on `U` with `0 ∉ g '' U` (Mathlib's continuous
  branch with its holomorphy added), for 1.1 at the sector `S_δ` and 5.4 at `Set.univ`;
- images under injective holomorphic maps (`Analysis/Complex/Conformal/ImageSimplyConnected.lean`):
  `TauCeti.isOpen_image_of_differentiableOn_of_injOn` and
  `TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn`, for `Ω` open and `g` holomorphic
  and injective on `Ω`, the image `g '' Ω` is open, and simply connected when `Ω` is; for 1.1, with
  `g = exp` on the strip `Ω_δ`, whose image is the sector `S_δ`;
- piecewise-`C¹` curves (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean`): `TauCeti.IsPiecewiseC1On`,
  the hypothesis on the curve in `TauCeti.Contour.argumentPrinciple_nullHomologous`;
- contour integration (`Analysis/Contour/`): `TauCeti.Contour.windingNumber`,
  `TauCeti.Contour.IsNullHomologous` with
  `TauCeti.Contour.isNullHomologous_iff`; `TauCeti.Contour.argumentPrinciple_nullHomologous`
  (`Argument/Cycle.lean`), which for `f` analytic and nonvanishing on `U` off a finite set `S`,
  meromorphic at the points of `S` with integer orders `ord`, and a closed piecewise-`C¹`
  null-homologous curve in `U` avoiding `S`, evaluates `∫ γ' · (f'/f)(γ)` as
  `2πi ∑_{z ∈ S} windingNumber γ z · ord z`; `TauCeti.Contour.residue_logDeriv_eq_meromorphicOrderAt`;
  `TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean`), the winding
  number of the image curve `f ∘ γ` about `0`, with
  `TauCeti.Contour.intervalIntegrable_deriv_smul_logDeriv`;
  `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean`), the
  continuous argument lift of a curve avoiding a point, with its partition into slit-plane
  segments; `TauCeti.Contour.windingNumber_eq_integral_of_avoidance` (`Winding/Number/Basic.lean`),
  the winding number about a point off the curve as `(2πi)⁻¹` times the index integral; and
  `TauCeti.Contour.integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im`
  (`Winding/SegmentSum.lean`), the index integral over such a partition as the log-norm difference
  of the endpoints plus `i` times the sum of `Im log` of the segment ratios, for 7.3;
- newform invariants (`NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`):
  `HeckeRing.GL2.Newform.analyticConductorAt` for `f : HeckeRing.GL2.Newform N k`, in the
  arithmetic coordinate, with `HeckeRing.GL2.Newform.analyticConductorAt_eq`
  (`analyticConductorAt f s = N (‖s‖ + 3)(‖s + 1‖ + 3)`), for the comparison 2.4;
- the logarithmic derivative of the series of a completely multiplicative ideal weight, as Tau
  Ceti realizes Arithmetic Dirichlet Series §2.3
  (`NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.lean`,
  `ArithmeticDirichletSeries/VonMangoldt.lean`, `ArithmeticDirichletSeries/Estimates.lean`):
  `TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform`
  (`logDeriv L(s) = −∑_𝔞 χ(𝔞) Λ_K(𝔞) 𝔑𝔞^{−s}` strictly right of the abscissa of absolute
  convergence), `TauCeti.MultiplicativeIdealWeight.vonMangoldtTransform_apply_prime_pow` and
  `TauCeti.idealAbscissaOfAbsConv_lt_re_of_bounded`, applied to the weight
  `TauCeti.GlobalNumberFields.RayClassCharacter.toMultiplicativeIdealWeight`
  (`NumberTheory/NumberField/Global/RayClass/Character/Weight.lean`) of a presented ray-class
  character, for 6.1 and 8.6;
- the analytic records, as Tau Ceti realizes L-functions Layer 0 and the Dirichlet record of
  Layer 4 (`NumberTheory/LFunctions/Data/Basic.lean`, `Data/Normalization.lean`,
  `Data/RiemannZeta.lean`, `Dirichlet/Basic.lean`), in the namespace `TauCeti.LFunctions`:
  `AnalyticLFunctionData` with fields `coeff`, `conductor`, `gammaR`, `gammaC`, `rootNumber`,
  `completed`, `polarOrder`; `AnalyticLFunctionData.degree`, `AnalyticLFunctionData.gammaFactor`,
  `AnalyticLFunctionData.dual` with `AnalyticLFunctionData.dual_completed`
  (`d.dual.completed = conj ∘ d.completed ∘ conj`) and `AnalyticLFunctionData.gammaFactor_dual`;
  the predicates `AnalyticLFunctionData.HasDirichletAgreement` (fields `coeff_one`, `degree_pos`,
  `completed_eq`), `AnalyticLFunctionData.HasMeromorphicContinuation` (fields `meromorphic`,
  `meromorphicOrderAt_eq`, `analyticAt`) and `AnalyticLFunctionData.HasFunctionalEquation` (fields
  `norm_rootNumber`, `polarOrder_one_sub_conj`, `completed_eq`, the last being
  `Λ(s) = ε Λ_dual(1 − s)` at points `s` with `polarOrder s = 0` and `polarOrder (1 − conj s) = 0`);
  `AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq` (the same equation as punctured germs
  at every point), `AnalyticLFunctionData.HasDirichletAgreement.dual`,
  `AnalyticLFunctionData.HasMeromorphicContinuation.dual` and
  `AnalyticLFunctionData.HasFunctionalEquation.dual`; `ArithmeticLFunctionData` and
  `NormalizationTranslation` (fields `gammaR_eq`, `gammaC_eq`, `completed_eq`, `polarOrder_eq`,
  `conductor_eq`, `rootNumber_eq`); `riemannZetaData`; `dirichletData` for a primitive Dirichlet
  character;
- presented Hecke L-functions, as Tau Ceti realizes part of L-functions Layers 2, 3 and 5
  (`NumberTheory/LFunctions/Hecke/Primitive.lean`, `Hecke/Basic.lean`,
  `LFunctions/DedekindZeta/PartialZeta.lean`, `Analysis/Meromorphic/Continuation.lean`):
  `TauCeti.LFunctions.PrimitiveRayClassCharacter` (fields `conductor`, `character`,
  `isPrimitive`), `TauCeti.LFunctions.PrimitiveRayClassCharacter.of`, its unit `1` (the trivial
  character of `TauCeti.GlobalNumberFields.Modulus.one K`, the primitive character of the Dedekind
  zeta function) and its inverse `ψ⁻¹` (primitive at the same conductor, with
  `TauCeti.LFunctions.PrimitiveRayClassCharacter.of_inv`); `TauCeti.LFunctions.heckeLFunctionC`,
  the canonical continuation `TauCeti.meromorphicContinuation 1` of the series of a ray-class
  character presented at its modulus, which is `0` when no continuation exists;
  `TauCeti.LFunctions.heckeLFunctionC_induced`, `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`
  and `TauCeti.LFunctions.heckeLFunctionC_eventuallyEq_primitive` (a half-plane equality of values
  and an equality of germs at every point);
  `TauCeti.GlobalNumberFields.RayClassCharacter.eulerCorrection` with `eulerCorrection_self` and
  `eulerCorrection_one` (the trivial character, `∏_{𝔭 ∣ 𝔫} (1 − 𝔑𝔭^{−s})`);
  `TauCeti.LFunctions.finiteEulerCorrection`; `TauCeti.meromorphicContinuation_eqOn`,
  `TauCeti.eq_of_meromorphic_of_eqOn_halfPlane` and
  `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (half-plane agreement of two meromorphic
  functions on `ℂ` gives the same punctured germ at every point);
- the ray-class characters of `ℚ` as Dirichlet characters
  (`NumberTheory/NumberField/Global/RayClass/Character/Dirichlet.lean`), for 6.4 at `K = ℚ`:
  `TauCeti.GlobalNumberFields.ratDirichletEquiv` (the characters of the ray class group of `(q)∞`
  are the Dirichlet characters modulo `q`), `TauCeti.GlobalNumberFields.onIdeals_ratDirichletEquiv_symm`
  (the ray-class character at an integral ideal prime to `q` is the Dirichlet character at its
  absolute norm) and `TauCeti.GlobalNumberFields.RayClassCharacter.absNorm_conductor_finitePart`
  (the finite part of the conductor has absolute norm the conductor of the Dirichlet character);
- for the counts of 8.3, 8.5, 8.7 and 8.8: `TauCeti.primeCount K S x`
  (`NumberTheory/ArithmeticDirichletSeries/Counting.lean`), the number, as a real number, of the
  primes in a set `S` of height-one primes of `𝓞 K` of absolute norm at most `x`, inclusive cutoff,
  with `TauCeti.primeCount_eq_card` (it is the cardinality of a finite filter of the primes below
  the cutoff); `TauCeti.primePsi K S x` (`ArithmeticDirichletSeries/Prime/Psi.lean`), Chebyshev's
  `ψ` over `S`, the sum of `log 𝔑𝔭` over the prime powers `𝔭^k`, `k ≥ 1`, of norm at most `x` whose
  base `𝔭` lies in `S`, with `TauCeti.primePsi_eq_sum_range` and `TauCeti.normCoeff_vonMangoldt`
  (at `S = Set.univ` it is `∑_{𝔑𝔞 ≤ x} Λ_K(𝔞)`); `TauCeti.primeTheta K S x` (`Counting.lean`),
  Chebyshev's `ϑ` over `S`, the sum of `log 𝔑𝔭` over the primes of `S` of norm at most `x`;
  `TauCeti.primePsi_sub_primeTheta` (`Prime/Psi.lean`: `primePsi K S x − primeTheta K S x` is the
  sum of the higher-prime-power weight `log 𝔑𝔭` over the prime powers `𝔭^k`, `k ≥ 2`, of norm at
  most `x` with base in `S`) and `TauCeti.primePowerSummatory_indicator_sub_primeTheta` (the same
  split for the standard weight restricted to any set `T` of prime powers whose members that are
  primes are exactly the primes of `S`); `TauCeti.primePowerWeight_eq_vonMangoldt_re`
  (`Prime/Psi.lean`: that standard weight, `log 𝔑𝔭` at `𝔭^k` for every `k ≥ 1`, is the real part
  of `Λ_K(𝔭^k)`); `TauCeti.higherPrimePowerTheta K x`
  (`ArithmeticDirichletSeries/HigherPrimePowers.lean`, that sum over all `𝔭^k`, `k ≥ 2`, which is
  `primePsi K Set.univ x − primeTheta K Set.univ x`) with `TauCeti.higherPrimePowerTheta_le` (for
  `x ≥ 1` it is at most `([K : ℚ]/(2 log 2)) √x log² x`), `TauCeti.higherPrimePowerTheta_isBigO`
  and `TauCeti.primePowerSummatory_isBigO_of_le_higherPrimePowerWeight` (a prime-power weight of
  norm at most `C ≥ 0` times the higher-prime-power weight has summatory function
  `O(√x log² x)`); `TauCeti.idealSummatory_eq_primePowerSummatory` (`Counting.lean`: an ideal
  weight vanishing off the prime-power ideals has the summatory function of its restriction to
  them); `TauCeti.primeCount_eq_primeTheta_div_log_add_integral`
  (`ArithmeticDirichletSeries/AbelSummation.lean`: for every real `x`,
  `primeCount K S x = primeTheta K S x / log x + ∫ t in Ioc 2 x, primeTheta K S t / (t log² t)`);
  `TauCeti.primeIdealTheorem`
  (`ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean`: `primePsi K Set.univ x ∼ x`,
  `primeTheta K Set.univ x ∼ x` and `primeCount K Set.univ x ∼ Li x`), which 8.5 strengthens;
  `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`
  (`NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean`: for `[NeZero m]` and
  `IsUnit (a : ZMod m)`, the count `primeCount ℚ {p | 𝔑p % m = a % m} x` is `∼ Li x/φ(m)`), which
  8.7 at `K = ℚ` strengthens; `Rat.HeightOneSpectrum.absNorm_asIdeal`
  (`NumberTheory/NumberField/Ideal/IntegersRat.lean`: the absolute norm of a height-one prime of
  `𝓞 ℚ` is the rational prime `natGenerator` below it); `TauCeti.Real.logIntegral`
  (`Analysis/SpecialFunctions/LogIntegral.lean`) with
  `TauCeti.Real.logIntegral_isEquivalent_div_log` and, for 8.9,
  `TauCeti.Real.intervalIntegrable_inv_log_pow` (`(log t)^(−n)` is interval integrable between any
  two points `> 1`) and `TauCeti.Real.integral_inv_log_pow_le` (for `1 < a ≤ b`,
  `∫_a^b (log t)^(−n) dt ≤ (b − a)/(log a)^n`);
  `NumberField.Chebotarev.frobeniusPrimeCount` (`NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean`,
  the primes of `K` unramified in `L`, of norm at most `x`, with Frobenius class `C`); and the ray
  classes of `TauCeti.GlobalNumberFields` listed below;
- the `3-4-1` combination and the Dedekind von Mangoldt identity, as Tau Ceti realizes L-functions
  Layers 7–8 `three_four_one_nonneg`, `dedekindZeta_idealVonMangoldt_nonneg` and
  `dedekindZeta_logDeriv_eq`: `TauCeti.LSeries.threeFourOneCombination_nonneg`
  (`NumberTheory/LSeries/ThreeFourOne.lean`; `0 ≤ 3 + 4 Re z + Re (z²)` for `‖z‖ ≤ 1`),
  `TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg` and
  `TauCeti.IdealArithmeticFunction.vonMangoldt_im`
  (`NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean`; every value `Λ_K(𝔞)` is real and
  nonnegative), and `TauCeti.hasSum_idealTerm_vonMangoldt`
  (`NumberTheory/ArithmeticDirichletSeries/Prime/DedekindZeta.lean`; on `Re s > 1` the ideal series
  `∑_𝔞 Λ_K(𝔞) 𝔑𝔞^{−s}` sums to `−ζ_K'(s)/ζ_K(s)` for Mathlib's `NumberField.dedekindZeta`), for
  6.1 and 8.3;
- ray-class reciprocity, as Tau Ceti realizes Class Field Theory Layer 12
  (`NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean` and
  `AdmissibleModulus/Basic.lean`, stated for `K L : Type` with `[IsAbelianGalois K L]`):
  `TauCeti.ClassFieldTheory.rayClassArtinMap 𝔪 h : RayClassGroup 𝔪 →* (L ≃ₐ[K] L)` for
  `h : TauCeti.ClassFieldTheory.IsAdmissibleModulus K L 𝔪`,
  `TauCeti.ClassFieldTheory.rayClassArtinMap_surjective`,
  `TauCeti.ClassFieldTheory.rayClassArtinMap_idealClass` (the conjugacy class of the image of the
  class of a prime `𝔭` prime to `𝔪` is `NumberField.artinSymbol 𝔭 hur`) and
  `TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor` (the conductor of `L/K` is
  admissible), for 8.8.

### From TauCetiRoadmap.ArithmeticDirichletSeries

The contracts are the layers of [Arithmetic Dirichlet Series](../../Completed/ArithmeticDirichletSeries/README.md)
cited below, which Tau Ceti realizes in `NumberTheory/ArithmeticDirichletSeries/` and
`Analysis/SpecialFunctions/LogIntegral.lean`, in the namespace `TauCeti`:

- Layers 0–2: `IdealArithmeticFunction` and `normCoeff`; `IdealArithmeticFunction.vonMangoldt`
  is supported on prime powers with value `log (Ideal.absNorm P)` at `P^k`, `k ≥ 1`;
- Layers 3 and 5: `EulerProductData`, `abscissaOfAbsConv_normCoeff_one` and the ideal-count bounds;
- §4.2: the inclusive summatory functions on ideals and on prime powers, with
  `idealSummatory_eq_primePowerSummatory` for a weight supported on prime powers;
- §4.3: `primeCount` (with `primeTheta`), the count of the primes of a set `S` of absolute norm
  at most `x`, inclusive cutoff, the carrier of the effective counts 8.5 and 8.7;
- §5.2: the higher prime powers, `higherPrimePowerTheta K x ≤ ([K : ℚ]/(2 log 2)) √x log² x`
  for `x ≥ 1` (`higherPrimePowerTheta_le`, `higherPrimePowerTheta_isBigO`) and its form
  `primePowerSummatory_isBigO_of_le_higherPrimePowerWeight` for a dominated weight, which remove
  `ψ − ϑ` before the prime counts of 8.5 and 8.7;
- §6.1: Abel summation with inclusive norm cutoffs, in its prime form
  `primeCount_eq_primeTheta_div_log_add_integral`, `π = ϑ/log x + ∫_2^x ϑ(t)/(t log² t) dt`, which
  passes from `ϑ`, not from `ψ`, to the prime count;
- §6.2: `TauCeti.Real.logIntegral x = ∫ t in 2..x, (Real.log t)⁻¹`,
  `logIntegral_isEquivalent_div_log`, the first integration by parts
  `logIntegral_eq_div_log_sub_add` (for `2 ≤ x`,
  `logIntegral x = x / log x − 2 / log 2 + ∫ t in 2..x, (log t ^ 2)⁻¹`) and
  `isLittleO_integral_inv_log_sq`, all in the namespace `TauCeti.Real`;
- §§6.3–6.4: `truncatedPerronKernel_one`, `truncatedPerron_LSeries`,
  `norm_truncatedPerron_LSeries_sub_sum_le` and `perronFormula`; absolute convergence on the
  integration line is required, and the finite-height endpoint is `π⁻¹ arctan(T/c)`, not `1/2`;
- Layers 9–10: `LSeries.wienerIkehara` and `primeNumberTheoremTransfer`, with the exact
  nonnegative von Mangoldt coefficient and boundary remainder specified there; §10.1 `primePsi`,
  Chebyshev's `ψ` over a set of primes with every prime power present, the carrier of `ψ_K` in
  8.3 and 8.5; §10.2 `primePsi_sub_primeTheta` and `primePowerSummatory_indicator_sub_primeTheta`,
  the exact identification of `ψ − ϑ` with the higher-prime-power sum, over a set of primes and over
  a set of prime powers.

### From TauCetiRoadmap.GlobalNumberFields

[Global Number Fields](../../Completed/GlobalNumberFields/README.md), Layer 2, supplies `Modulus`,
`Modulus.support`, `Modulus.one`, `RayClassGroup`, `integralIdealsPrimeTo`, `idealClass` and
`finite_rayClassGroup`: the ideal-class map has domain the nonzero integral ideals prime to the
modulus. Layer 9 supplies `RayClassCharacter`. Layer 3E supplies `rayClassIdealMainTerm_eq`, whose
Euler factors belong to the all-ideal count, not the prime count. Tau Ceti realizes them in
`NumberTheory/NumberField/Global/RayClass/`, in the namespace `TauCeti.GlobalNumberFields`, to
which qualified uses below refer.

### From TauCetiRoadmap.NumberFieldArithmetic

[Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md), §2.3, supplies
`artinSymbol`, the conjugacy class of arithmetic Frobenius at an unramified nonzero prime. The
unramifiedness proof is an argument. The qualified name below is `NumberField.artinSymbol`.

### From TauCetiRoadmap.Chebotarev

[Chebotarev](../../Completed/Chebotarev/README.md), Layer 2, supplies `frobeniusPrimeSet`; Layer 11
supplies `frobeniusVonMangoldtCoeff`, `frobeniusPsi` and `frobeniusTheta`; Layers 13–14 supply
`frobeniusPrimeCount`, `tendsto_frobeniusPrimeCount` and `hasNaturalDensity_frobeniusPrimeSet`,
and its arithmetic-progression specialization supplies
`primeCount_primesCongruent_isEquivalent_logIntegral`, the qualitative form of 8.7 at `K = ℚ`.
Their namespace is `NumberField.Chebotarev`. Prime powers are selected by the power of the Artin
class, and ramified primes are excluded. No second ideal weight or Frobenius carrier is defined here.

### From TauCetiRoadmap.LFunctions

What the Tau Ceti pin does not realize of the [L-functions roadmap](../LFunctions/README.md),
consumed by the names that roadmap's `Suggested.lean` declares in the layer cited (its README
states the same targets in prose):

- Layer 0: the average-coefficient-growth predicate, which that roadmap states in prose: what is
  consumed is that it makes `LSeries d.coeff` absolutely convergent on `Re s > 1` and bounded on
  every half-plane `Re s ≥ 1 + δ`, `δ > 0`, by a constant depending on `δ`.
- Layer 3: `dedekindZetaC`, `dedekindZetaC_eq`, `meromorphic_dedekindZetaC`,
  `analyticAt_dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`,
  `tendsto_sub_one_mul_dedekindZetaC`, `completedDedekindZeta`, `completedDedekindZeta_eq`,
  `meromorphic_completedDedekindZeta`, `meromorphicOrderAt_completedDedekindZeta_zero`,
  `meromorphicOrderAt_completedDedekindZeta_one`, `analyticAt_completedDedekindZeta`,
  `tendsto_sub_one_mul_completedDedekindZeta`, `tendsto_mul_completedDedekindZeta_zero`,
  `completedDedekindZeta_one_sub`, `dedekindZetaData`,
  `dedekindZetaData_hasContinuation`, `dedekindZetaData_hasFunctionalEquation`; also
  `mellinKernel`, `mellinConstant`, `continuousOn_mellinKernel`, `mellinKernel_inv`,
  `mellinKernel_sub_const_isBigO`, `completedPartialZeta_eq_mellin` and
  `completedDedekindZeta_eq_sum_completedPartialZeta`, for the split Mellin estimate; from Layer 2,
  `partialZeta`, `partialZeta_eq_lSeries`, `sum_partialZeta`.
- Layer 4: `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`.
- Layer 5: `heckeLFunctionC_eq` (the value of `heckeLFunctionC` on `Re s > 1` is the series),
  `partialZeta_eq_sum_heckeLFunctionC`, `heckeData`, `completedHeckeLFunction`,
  `differentiable_completedHeckeLFunction` (for a nontrivial character),
  `exists_mellin_completedHeckeLFunction`, `heckeRootNumber`, `norm_heckeRootNumber`,
  `completedHeckeLFunction_one_sub` (for a nontrivial character, against `χ⁻¹`),
  `completedHeckeLFunction_one_sub_eventuallyEq` (the germ form, which covers the trivial
  character).
- Layer 6: `Grossencharacter.heckeMellinTotal`, `Grossencharacter.heckeMellinConstant`,
  `Grossencharacter.continuousOn_heckeMellinTotal`, `Grossencharacter.heckeMellinTotal_inv`,
  `Grossencharacter.heckeMellinTotal_sub_const_isBigO`, `completedHeckeLFunction_eq_mellin`
  and `Grossencharacter.grossencharacterFEPair`, restricted to the finite-order characters of Layer 5. The kernels
  minus their constants decay as `O(exp(−c u^(1/n)))`, with `c > 0` and `n = [K:ℚ] ≥ 1`.
- Layer 7: `heckeLFunction_ne_zero_of_one_le_re` (nontrivial primitive characters only),
  `meromorphicOrderAt_dedekindZetaC_one_add` (nonzero height). The `3-4-1` combination of Layer 7
  and the Dedekind identities of Layer 8 are at the pin and listed under Tau Ceti.

Nothing here is polymorphic over an Artin record: the two families are Dedekind zeta functions and
L-functions of finite-order ray-class characters, which is why 8.7 is stated on the ray-class side
and nonabelian Chebotarev is not owned here.

### From TauCetiRoadmap.ClassFieldTheory

[Class Field Theory](../ClassFieldTheory/README.md), Layer 12 (`rayClassArtinMap`, its splitting
law `rayClassArtinMap_idealClass` and `rayClassArtinMap_surjective`), is consumed only as Tau Ceti
realizes it in `TauCeti.ClassFieldTheory`, listed under Tau Ceti; it discharges the reciprocity
hypothesis of 8.8 and is not used elsewhere.

## How to read the build

Layers 0–2 are general analysis over the L-functions roadmap's record: growth predicates and the
entire completion, Stirling's formula and the continued L-function, and the analytic conductor.
Layer 3 first proves finite order for the two families from split Mellin integrals, then
uses finite order as an explicit hypothesis in generic convexity and completed strip growth. Layer 4 counts zeros by
Jensen's formula, without contour integrals; Layer 5 is Hadamard's factorization, general and then
for the families. Layer 6 proves the zero-free regions, Layer 7 the exact count by the argument
principle on a rectangle, and Layer 8 the explicit formulas and the effective prime counts. Layer
9 needs Layers 0 and 4, and 7.2 for its bridge to the contour integral; everything in it except
that bridge can be built early.

## Layer 0: growth predicates and the entire completion

### 0.1 The order predicate

Define `OrderLE f A` as in the conventions: for every `A' > A`, `f(s) = O(exp ‖s‖^{A'})` as
`‖s‖ → ∞`. Entirety is a hypothesis of the theorems that use it, so the predicate composes.

- If `OrderLE f A` and `A ≤ B` then `OrderLE f B`.
- If `OrderLE f A` and `OrderLE g A` then `OrderLE (f + g) A` and `OrderLE (f * g) A`.
- Polynomials satisfy `OrderLE p 0`; `s ↦ exp (a s)` satisfies `OrderLE _ 1` for every `a : ℂ`.
- For `A < 0` an entire `f` with `OrderLE f A` is bounded, hence constant by Liouville.

*Needs:* Mathlib `Asymptotics.IsBigO`, `Bornology.cobounded`, `Differentiable.apply_eq_apply_of_bounded`.

**Checks.**

- `exp (z²)` satisfies `OrderLE _ 2` and not `OrderLE _ 1`: along the positive reals
  `exp(r²)/exp(r^{3/2}) → ∞`.
- `s ↦ 1/Γ(s)` satisfies `OrderLE _ 1` but is not `O(exp(C‖s‖))` for any `C`: reflection gives
  `‖1/Γ(−n−1/2)‖ = Γ(n+3/2)/π`, whose logarithm is `n log n + O(n)` as `n → ∞`.
  At the intervening integers `1/Γ(−n) = 0`. Thus exponential type would reject this order-one
  function; an asymptotic along the whole negative ray is false (DLMF 5.5.3 and 5.11.1).
- `exp z` satisfies `OrderLE _ 1` but not `OrderLE _ (1/2)`, since `exp r / exp(r^{3/4}) → ∞`.
- `1 − z` satisfies `OrderLE _ 0`, and the constant `1` satisfies `OrderLE _ A` for every real
  `A`, including negative `A`.

### 0.2 The entire completion

Build the **entire completion** of a record `d` satisfying `HasMeromorphicContinuation`. It is not
the pointwise product `P · Λ` with the clearing polynomial `P(s) = ∏_p (s − p)^{polarOrder p}`: at a
pole the total representative of `Λ` is junk, and for the `ζ` record the product is `0` at `0` and
`1`, fake zeros exactly where poles are meant to be cleared. Define *entireCompletion* `d` as the
analytic extension of `P · Λ` across the finite set `polarOrder.support`, where each point is a
removable singularity of order `0` by the field `HasMeromorphicContinuation.meromorphicOrderAt_eq`.

- *entireCompletion* `d` is entire and agrees with `P · Λ` off `polarOrder.support`.
- `meromorphicOrderAt (entireCompletion d) z = meromorphicOrderAt Λ z + polarOrder z` for every
  `z`; hence `divisor (entireCompletion d) univ = divisor Λ univ + polarOrder`.
- *entireCompletion* `d` does not vanish at the points of `polarOrder.support`.
- At the `ζ` record it is `zetaEntireCompletion s = s (s − 1) completedRiemannZeta₀ s + 1`. Since
  `completedRiemannZeta = completedRiemannZeta₀ − 1/s − 1/(1 − s)`, the pole terms contribute
  `−(s − 1) + s = 1`, so `zetaEntireCompletion` agrees with `s (s − 1) Λ(s)` off `{0, 1}` and is
  `1` at both points. It is twice Riemann's `ξ`.

*Needs:* L-functions Layer 0 `HasMeromorphicContinuation`; Mathlib
`Complex.differentiableOn_update_limUnder_of_bddAbove`, `completedRiemannZeta₀`.

**Checks.**

- `zetaEntireCompletion 0 = zetaEntireCompletion 1 = 1`, while the raw product
  `0 · (0 − 1) · completedRiemannZeta 0` is `0`; the raw product would add two fake zeros.
- `zetaEntireCompletion (1 − s) = zetaEntireCompletion s`, from Mathlib's
  `completedRiemannZeta₀_one_sub` and the symmetry of `s(s − 1)`; clearing only one pole, as
  `s ↦ s Λ(s)`, is neither entire nor symmetric.
- For the shifted record `Λ_ζ(s − iH) Λ_ζ(s + iH)` with `H > 0`, the clearing polynomial has
  roots `±iH, ±iH + 1`, and *entireCompletion* is nonzero at each of those four points.

### 0.3 Finite order

Define finite order, *IsFiniteOrder* `d`, as `∃ A, OrderLE (entireCompletion d) A`. It does not
imply `OrderLE (entireCompletion d) 1`; that is proved per family in 3.1. More generally, an
entire function `F` has finite order when `∃ A, OrderLE F A` (Davenport §11).

- Finite order is preserved by sums, products and multiplication by a polynomial, by the
  `OrderLE` closure laws with a common exponent.
- For `a b : ℂ`, an entire function of finite order remains so under `s ↦ a s + b`; for `a ≠ 0`
  the converse follows by the inverse affine substitution.
- If two entire completions agree, their records have equivalent *IsFiniteOrder* predicates;
  multiplying a completion by a nonzero polynomial preserves finite order in both directions.

*Needs:* Layer 0 `OrderLE` closure laws; polynomial growth and compact boundedness of entire
functions. These are adapters of the stated order definition, not extra hypotheses on records.

**Checks.**

- `zetaEntireCompletion` has finite order (3.1 proves order at most `1`).
- `exp (z²)` and `exp z` both have finite order, which does not distinguish order `1` from `2`.
  The sum `exp z − exp z = 0` and product `exp z · exp z = exp(2z)` still have finite order.
- For `F(z) = exp z`, `F(2s+1) = exp(2s+1)` has log norm `2r+1` at `s = r ≥ 0`.
  For `F(z) = exp(exp z)`, the constant pullback `F(0s+0) = e` has finite order although `F`
  does not; the converse requires `a ≠ 0`.
- `exp (exp z)` does not have finite order: `log log |exp(exp r)| = r`, beating every `A log r`.

### 0.4 Vertical-strip growth

Define **vertical-strip growth**, *HasVerticalStripGrowth* `d`: for all `σ₁ < σ₂` there are
`C > 0`, `A ≥ 0` and `T₀ ≥ 0` with `‖Λ(σ + it)‖ ≤ C (1 + |t|)^A` for `σ ∈ [σ₁, σ₂]` and
`|t| ≥ T₀`. The threshold is existential: a record may have a pole at any height.

- Restriction from a strip to a smaller strip keeps the same constants and threshold.
- For two completed functions with this property, their sum and product have it: use the
  larger threshold, the larger exponent for a sum, and the sum of the exponents for a product.
- Equal completed functions have equivalent growth predicates. Section 3.5 proves the
  finite-order implication after the gamma and convexity inputs.

*Needs:* real powers, elementary norm inequalities and the displayed quantifiers.

**Checks.**

- A completed function with a pole at `1 + 5i` is unbounded as `σ → 1` at height `5`;
  a bound with `T₀ = 5` on a strip containing `1` is impossible.
- The constant function `1` satisfies the displayed bounds with `C = 1`, `A = 0`, `T₀ = 0`.
- `exp(−s²)` fails on `[0, 1]`: at `s = it` its norm is `exp(t²)`, exceeding every
  `C(1 + |t|)^A`. Entirety alone does not give vertical-strip growth.

### Examples

- `zetaEntireCompletion` with its values `1` at `0` and `1`.
- `exp (c s)` has `OrderLE _ 1` for every `c`, with no zeros.
- The shifted record `Λ_ζ(s − iH) Λ_ζ(s + iH)`: entire completion, strict height threshold.

### Dependencies

L-functions Layer 0: `AnalyticLFunctionData`, `HasMeromorphicContinuation`,
`HasFunctionalEquation`, `HasDirichletAgreement`, the average-coefficient-growth predicate.
Mathlib: real powers, asymptotic bounds, removable singularities and `completedRiemannZeta₀`.

## Layer 1: gamma-factor asymptotics and the continued L-function

### 1.1 A holomorphic branch of log Γ

Fix `δ` with `0 < δ < π` and the sector `S_δ = {s : |arg s| < π − δ ∧ 1 < ‖s‖}`. It is the image
under `exp` of the strip `Ω_δ = {w : 0 < Re w ∧ |Im w| < π − δ}`, since `‖exp w‖ = e^(Re w)` and
`arg (exp w) = Im w` for `|Im w| < π`. `Ω_δ` is open and convex, and `exp` is injective on it
(`Complex.log_exp` inverts it there), so `S_δ` is open and simply connected
(`TauCeti.isOpen_image_of_differentiableOn_of_injOn`,
`TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn`) and preconnected as a continuous
image of a convex set. For that range `S_δ` is also free of poles of `Γ` and contains `2`. `Γ` is
holomorphic on `S_δ` (`Complex.differentiableAt_Gamma`, since `S_δ` contains no nonpositive integer)
and has no zero there (`Complex.Gamma_ne_zero`). Define *logGamma* `δ` as the branch that
`TauCeti.exists_differentiableOn_eqOn_exp_comp` supplies for `Γ` on `S_δ`, minus its value at `2`,
so that *logGamma* `δ 2 = 0`; that value lies in `2πi ℤ` because `Γ 2 = 1`, so the shift keeps
`exp ∘ logGamma δ = Γ`.

- `exp (logGamma δ s) = Γ(s)` for `s ∈ S_δ`.
- *logGamma* `δ` is holomorphic on `S_δ`: the cited branch is holomorphic, and so is its shift by a
  constant.
- `2 ∈ S_δ` for `0 < δ < π`, and `Γ 2 = 1`, so the normalization is consistent.
- Two values `δ ≤ δ'` give branches agreeing on `S_{δ'}`, which lies in `S_δ`. Route: the
  difference `h = logGamma δ − logGamma δ'` is holomorphic on `S_{δ'}` with `exp ∘ h = Γ/Γ = 1`
  there, so `h' = 0` on `S_{δ'}`; the sector is open and preconnected and `h 2 = 0`, so `h = 0` on
  it by `IsOpen.is_const_of_deriv_eq_zero`. The global `is_const_of_deriv_eq_zero` does not apply,
  since it asks for `h` differentiable on all of `ℂ`, and `h` need not be differentiable at the
  poles `0, −1, −2, …` of `Γ`, which lie in no `S_δ`.

The hypothesis `δ > 0` is the angular margin that makes the asymptotic of 1.2 uniform: at `δ = 0`
the set `S_0` is `{‖s‖ > 1}` minus the negative real axis, which is still simply connected, but the
poles of `Γ` at the negative integers lie on its boundary and the error term in 1.2 is not uniform
there. At `δ ≥ π` the set is empty.

*Needs:* Tau Ceti `TauCeti.exists_differentiableOn_eqOn_exp_comp`,
`TauCeti.isOpen_image_of_differentiableOn_of_injOn` and
`TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` (openness and simple connectivity of
`S_δ = exp '' Ω_δ`); Mathlib `Complex.differentiableAt_Gamma`, `Complex.Gamma_ne_zero`,
`Complex.exp_eq_exp_iff_exists_int`, `Complex.log_exp` and `Complex.exp_log` (`exp` injective on
`Ω_δ` with image `S_δ`), `Convex.contractibleSpace` and `SimplyConnectedSpace.ofContractible`
(simple connectivity of `Ω_δ`), and `IsOpen.is_const_of_deriv_eq_zero` with
`Convex.isPreconnected` and `IsPreconnected.image` (the uniqueness clause).

**Checks.**

- *logGamma* `δ 3 = log 2` exactly: `Γ` is positive real on `[2, 3]` and the branch is continuous
  from its value `0` at `2`; a branch shifted by `2πi` gives `log 2 + 2πi`.
- `Re (logGamma δ s) = log ‖Γ(s)‖` on `S_δ`, whatever the normalization; only the imaginary part
  is pinned by the value at `2`.
- `Complex.log ∘ Γ` is not a branch, for any `δ`: fix `θ` with `0 < θ < π − δ`, so that the ray
  `s = r e^{iθ}`, `r > 1`, lies in `S_δ`. By 1.2 the imaginary part of *logGamma* `δ` along it is
  `r sin θ log r + r (θ cos θ − sin θ) − θ/2 + O(1/r)`, which tends to `+∞`; wherever it passes an
  odd multiple of `π`, `Γ(s)` is a negative real and the principal logarithm jumps by `2πi`, so a
  definition through it fails the holomorphy clause. The first such point is near `r = 5.539` at
  `θ = π/2` (where the expansion is `t log t − t − π/4` at `s = it`, a ray inside `S_δ` only for
  `δ < π/2`), near `r = 4.151` at `θ = π/4` and near `r = 12.626` at `θ = 1/10`.

### 1.2 Stirling on the sector

For `0 < δ < π`, uniformly on `S_δ`,
`logGamma δ s = (s − 1/2) Complex.log s − s + Real.log (2π)/2 + O(1/‖s‖)` as `‖s‖ → ∞`, with
`Complex.log` the principal branch (legitimate since `S_δ` lies in the slit plane). The implied
constant depends on `δ` (NIST DLMF 5.11.1 and the remainder bounds in §5.11(ii)).

*Needs:* 1.1; Mathlib `Complex.Gamma`, `Complex.GammaIntegral`, the Binet or Euler–Maclaurin
route through `Complex.digamma`.

### 1.3 Vertical strips

For every compact `[a, b] ⊆ ℝ`,
`log ‖Γ(σ + it)‖ = (σ − 1/2) log |t| − π|t|/2 + log(2π)/2 + O(1/|t|)` uniformly for `σ ∈ [a, b]`
as `|t| → ∞`, along `cocompact ℝ` (DLMF 5.11.9, with the remainder from 5.11.1).
This additive form composes over products.

*Needs:* 1.2.

### 1.3a Bounds on vertical lines

For `0 < Re s`, `‖Γ(s)‖ ≤ Real.Gamma (Re s)`: on each vertical line in the right half-plane, `‖Γ‖`
is largest on the real axis (DLMF 5.6.6). In particular `‖Γ(s)‖ ≤ 1` for `1 ≤ Re s ≤ 2`. Both
bounds hold at every height, where 1.3 is asymptotic.

Route: for `0 < Re s`, `Complex.Gamma_eq_integral` writes `Γ(s)` as Euler's integral
`∫_0^∞ x^{s−1} e^{−x} dx`, and `‖x^{s−1}‖ = x^{Re s − 1}` for `x > 0`
(`Complex.norm_cpow_eq_rpow_re_of_pos`). So the norm of the integral is at most
`∫_0^∞ x^{Re s − 1} e^{−x} dx`, which is `Real.Gamma (Re s)` by `Real.Gamma_eq_integral`. For the
second clause, `Real.convexOn_Gamma` with `Real.Gamma_one` and `Real.Gamma_two` gives
`Real.Gamma σ ≤ 1` on `[1, 2]`.

*Needs:* Mathlib `Complex.Gamma_eq_integral`, `Complex.norm_cpow_eq_rpow_re_of_pos`,
`MeasureTheory.norm_integral_le_integral_norm`, `Real.Gamma_eq_integral`, `Real.convexOn_Gamma`,
`Real.Gamma_one`, `Real.Gamma_two`.

**Checks.**

- On `Re s = 1/2`, `Complex.Gamma_mul_Gamma_one_sub` and `Complex.Gamma_conj` give
  `‖Γ(1/2 + it)‖² = π/cosh(πt) ≤ π = Γ(1/2)²`, with equality only at `t = 0`. The second clause
  does not extend to `Re s = 1/2`, since `Γ(1/2) = √π > 1`.
- `Γ(3/2) = √π/2 < 1`, within the second clause, while `Γ(3) = 2`, so the clause fails at
  `Re s = 3`.
- At `Re s = −1/2` the right side `Real.Gamma (−1/2) = −2√π` is negative, so the first clause
  needs `0 < Re s`.

### 1.4 Digamma and the logarithmic derivatives of the gamma factors

`Complex.digamma s = Complex.log s + O(1/‖s‖)` on `S_δ`; and exactly
`logDeriv Gammaℝ s = digamma (s/2)/2 − (log π)/2` and `logDeriv Gammaℂ s = digamma s − log (2π)`
at every `s` off the poles (DLMF 5.11.2 and differentiation of the defining gamma factors).

*Needs:* 1.2; Mathlib `Complex.digamma`, `Complex.Gammaℝ`, `Complex.Gammaℂ`.

### 1.4a Conjugation, and the functional equation of ζ'/ζ

**Conjugation.** `Complex.digamma (conj s) = conj (Complex.digamma s)` for every `s : ℂ`, the poles
included; and `logDeriv Gammaℝ (conj s) = conj (logDeriv Gammaℝ s)`, and likewise for `Gammaℂ`,
for every `s`. Route: `Complex.Gamma_conj` says `Γ = conj ∘ Γ ∘ conj`, so
`deriv_conj_conj` gives `deriv Γ (conj s) = conj (deriv Γ s)`, and the quotient follows; the same
argument runs on `Complex.Gammaℝ_conj` and `Complex.Gammaℂ_conj`.

**The functional equation of `ζ'/ζ`.** Mathlib's `logDeriv_riemannZeta_one_sub` is the asymmetric
form `ζ'/ζ(s) = −ζ'/ζ(1 − s) + log 2π − ψ(s) + (π/2) tan(πs/2)` for `s ∉ ℤ` with `ζ(s) ≠ 0`, and is
consumed as it stands; applied at `1 − s` it is the classical
`ζ'/ζ(s) = log 2π + (π/2) cot(πs/2) − ψ(1 − s) − ζ'/ζ(1 − s)`. The target is the symmetric form at
every point off the zeros and poles, integers included: for `s ≠ 0, 1` with `ζ(s) ≠ 0` and
`ζ(1 − s) ≠ 0`,

```text
logDeriv riemannZeta s + logDeriv riemannZeta (1 − s)
  = −logDeriv Gammaℝ s − logDeriv Gammaℝ (1 − s),
```

whose right side is `log π − ψ(s/2)/2 − ψ((1 − s)/2)/2` by 1.4. The hypotheses keep `s` and
`1 − s` off the poles of `Gammaℝ`, since a negative even integer is a trivial zero. Route: off those
poles (`Complex.Gammaℝ_eq_zero_iff`), `riemannZeta_def_of_ne_zero` gives
`completedRiemannZeta = Gammaℝ · riemannZeta` on a neighbourhood of `s` and of `1 − s`, with both
factors analytic and nonzero there (`differentiableAt_riemannZeta`,
`Complex.differentiable_Gammaℝ_inv`); apply `logDeriv_congr_nhds`, `logDeriv_mul` and
`logDeriv_comp` to `completedRiemannZeta_one_sub`. On `ℂ \ ℤ` it agrees with
`logDeriv_riemannZeta_one_sub` through `Complex.digamma_one_sub` and `Complex.digamma_two_mul`.

**General records.** For a record with `HasMeromorphicContinuation` and `HasFunctionalEquation`, at
every `s`, `logDeriv Λ =ᶠ[𝓝[≠] s] fun z ↦ −logDeriv d.dual.completed (1 − z)`: the root number is
nonzero (`norm_rootNumber`) and cancels. The equality holds at `s` itself when `Λ` is analytic at
`s` and `d.dual.completed` at `1 − s`. Route: Tau Ceti's
`TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`, the equation
`Λ(z) = ε Λ_dual(1 − z)` as punctured germs at every point, and Mathlib's `logDeriv_congr_nhdsNE`.
With `completedDedekindZeta_one_sub` it gives the reflection `Λ_K'/Λ_K(s) = −Λ_K'/Λ_K(1 − s)` used
in 8.4.

*Needs:* 1.4; Mathlib `Complex.Gamma_conj`, `Complex.Gammaℝ_conj`, `Complex.Gammaℂ_conj`,
`deriv_conj_conj`, `logDeriv_riemannZeta_one_sub`, `completedRiemannZeta_one_sub`,
`riemannZeta_def_of_ne_zero`, `Complex.Gammaℝ_eq_zero_iff`, `differentiableAt_riemannZeta`,
`Complex.differentiable_Gammaℝ_inv`, `logDeriv_congr_nhds`, `logDeriv_mul`, `logDeriv_comp`,
`Complex.digamma_one_sub`, `Complex.digamma_two_mul`, `logDeriv_congr_nhdsNE`; Tau Ceti
`TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq` and
`HasFunctionalEquation.norm_rootNumber` (L-functions Layer 0,
`NumberTheory/LFunctions/Data/Basic.lean`); L-functions Layer 3 `completedDedekindZeta_one_sub`.

**Checks.**

- At `s = 2`, outside `logDeriv_riemannZeta_one_sub`, both sides of the symmetric form equal
  `γ_E + log 2π − 1 ≈ 1.41509`: `ζ'/ζ(2) ≈ −0.56996`, `ζ'/ζ(−1) = 12 log A − 1 ≈ 1.98505` with `A`
  Glaisher's constant, and `ψ(−1/2) = 2 − γ_E − 2 log 2`.
- At `s = −2`, a trivial zero, `logDeriv riemannZeta (−2)` and `logDeriv Gammaℝ (−2)` are the junk
  value `0`, leaving `ζ'/ζ(3) ≈ −0.1648` on the left and `−logDeriv Gammaℝ 3 ≈ 0.5541` on the right:
  the hypothesis `ζ(s) ≠ 0` cannot be dropped.
- `Im ψ(i) = 1/2 + (π/2) coth π ≈ 2.0767`, so `ψ(−i) = conj ψ(i) ≠ ψ(i)`: a conjugation law
  without the outer `conj` is false.

### 1.5 The gamma factor of a record

For `γ = d.gammaFactor` of degree `n = d.degree` and every compact `[a, b]`:
`log ‖γ(σ + it)‖ = −(π n/4)|t| + A(σ) log |t| + O(1)` uniformly for `σ ∈ [a, b]` as `|t| → ∞`, with
`A(σ) = ∑_j (σ + Re μ_j − 1)/2 + ∑_k (σ + Re ν_k − 1/2)`. Also: `γ` has no zeros, and its poles are
exactly the points `−μ_j − 2m` and `−ν_k − m` (`m : ℕ`), with orders read off `meromorphicOrderAt`
and assembled into the divisor of `γ` (DLMF 5.11.9 for growth; the shifted gamma pole orders
of L-functions Layer 0 for the divisor).

*Needs:* 1.3; L-functions Layer 0 `AnalyticLFunctionData.gammaFactor`, `degree`.

**Checks** for 1.2–1.5.

- At `d = 1`, `gammaR = {0}`, `gammaC = ∅`, 1.5 reads
  `log ‖Gammaℝ(σ + it)‖ = −π|t|/4 + ((σ − 1)/2) log |t| + O(1)`, the estimate the `ζ` count runs on.
- `logDeriv Gammaℂ 1 = digamma 1 − log 2π = −γ_E − log 2π`; a version with `log π` gives a
  different constant.
- For `gammaR = {0, 1}` the divisor of `γ` is `−1` at every nonpositive integer (the two
  `Gammaℝ` factors interleave into one `Gammaℂ` by duplication), and the `exp` rate is `π|t|/2`.

### 1.6 The analytic reciprocal and the continued L-function

Define **the analytic reciprocal gamma factor** *invGammaFactor* `d`: since `γ` has no zeros, `1/γ`
is analytic off the poles of `γ` and extends by `0` across them; for each factor it is the product
of the entire functions `Complex.differentiable_Gammaℝ_inv` and `Complex.differentiable_Gammaℂ_inv`
evaluated at the shifted points.

- *invGammaFactor* `d` is entire, and `invGammaFactor d s * d.gammaFactor s = 1` off the poles of
  `γ`.
- `meromorphicOrderAt (invGammaFactor d) z = − meromorphicOrderAt d.gammaFactor z` for every `z`.
- Its zero set is the pole set of `γ`, with the pole orders as multiplicities.
- `OrderLE (invGammaFactor d) 1`.

*Needs:* 1.5; Mathlib `Complex.differentiable_Gammaℝ_inv`, `Complex.differentiable_Gammaℂ_inv`.

**Checks.**

- For the `ζ` record, *invGammaFactor* is `s ↦ (Gammaℝ s)⁻¹` with Mathlib's total inverse, which is
  `0` at `0, −2, −4, …` and agrees with the analytic extension there; for `Gammaℂ` the same holds
  at every nonpositive integer.
- *invGammaFactor* of the degree-`0` record is the constant `1`.
- *invGammaFactor* of the `ζ` record satisfies `OrderLE _ 1` and not `OrderLE _ (1/2)`:
  `‖1/Gammaℝ(−2n−1)‖ = π^(−n−3/2) Γ(n+3/2)`, with logarithm `n log n + O(n)`.
  This subsequence excludes exponential type; at `−2n` the reciprocal is `0`
  (DLMF 5.5.3 and 5.11.1).

Define **the continued uncompleted L-function** *continuedL* `d` as the analytic extension of
`R d s = N^(−s/2) Λ(s) · invGammaFactor d s` across the finite set of points of
`polarOrder.support` at which the zero of *invGammaFactor* cancels the pole of `Λ`. It is not the
raw quotient `Λ(s)/(N^{s/2} γ(s))`: where `Λ` and `γ` share a pole that quotient divides two junk
values. At the `ζ` record, `completedRiemannZeta 0 / Gammaℝ 0 = 0` by Mathlib's division by zero,
while `ζ(0) = −1/2` (`riemannZeta_def_of_ne_zero` carries `s ≠ 0` for this reason).

- *continuedL* `d` is meromorphic on `ℂ` and agrees with `R d` off the removable set.
- `meromorphicOrderAt (continuedL d) z = meromorphicOrderAt Λ z − meromorphicOrderAt γ z` for
  every `z`, so the trivial zeros are the poles of `γ` at which `Λ` is regular and nonzero.
- `0 ≤ meromorphicOrderAt (continuedL d) z` implies `AnalyticAt ℂ (continuedL d) z`, from
  `HasMeromorphicContinuation.analyticAt` and the removable extension.
- `continuedL d s = LSeries d.coeff s` for `1 < Re s`, from `HasDirichletAgreement.completed_eq`;
  at the finitely many poles of `γ` in that half-plane by the identity theorem.
- `Λ(s) = N^{s/2} γ(s) continuedL d s` as an equality of germs at every `s`; pointwise only where
  `γ` is regular, since at a pole of `γ` the product multiplies the junk value `0` by a zero.
- The functional equation against the dual record, as germs at every `s`:
  `γ(s) continuedL d s = ε N^{1/2 − s} γ_dual(1 − s) continuedL d.dual (1 − s)`, from
  `HasFunctionalEquation.eventuallyEq`. Pointwise it holds at `s` when `γ` is regular at `s`,
  `γ_dual` is regular at `1 − s`, `polarOrder s = 0` and `polarOrder (1 − conj s) = 0`.
- `continuedL riemannZetaData = riemannZeta`, `continuedL (dedekindZetaData K) = dedekindZetaC K`
  and `continuedL (heckeData χ) = heckeLFunctionC χ.character`.

*Needs:* *invGammaFactor*; Tau Ceti `TauCeti.LFunctions.AnalyticLFunctionData.HasDirichletAgreement`,
`HasMeromorphicContinuation`, `HasFunctionalEquation.eventuallyEq` and `AnalyticLFunctionData.dual`
(L-functions Layer 0); L-functions Layers 3 and 5 for the family comparisons; Mathlib
`riemannZeta`, `riemannZeta_zero`.

**Checks.**

- `continuedL riemannZetaData 0 = −1/2` (`riemannZeta_zero`), while the raw quotient is `0`; the
  value at `0` is the one clause a quotient definition fails.
- `continuedL riemannZetaData (−2) = 0` and `meromorphicOrderAt completedRiemannZeta (−2) = 0`:
  the trivial zero is a zero of *continuedL* and not of `Λ`.
- A record with completed function `F(s) = 1/((s − 2)(s + 1))` off its poles, values `F(2) = 1`
  and `F(−1) = 0` assigned, degree `0`, conductor `1` and root number `1` has gamma factor `1`; at
  `s = 2` a pointwise functional equation with only the gamma hypotheses reads `0 = 1`, so the two
  polar exclusions are needed. Its poles are off `{0, 1}`, so a check run only at the `ζ` poles
  misses it.
- For a non-real primitive character the functional equation relates `χ` to `χ⁻¹`. Take the
  quartic character `χ` modulo `5` with `χ(2) = i`: it is odd (`χ(−1) = χ(2)² = −1`), so `d` and
  `d.dual` both have the single real gamma shift `1`, and `d.dual`, whose coefficients are the
  conjugates, has coefficient `−i` at `2` where `d` has `i`. An equation of the same shape written
  against `d` itself, with any root number `ε′`, would combine with the true one (the factor
  `N^{1/2 − s} γ(1 − s)` being a nonzero germ) to give `ε L(s, χ̄) = ε′ L(s, χ)` on `Re s > 1`;
  the coefficients at `1` force `ε′ = ε`, and those at `2` then give `−i = i`.

### Examples

- The `ζ` record: *logGamma*, the `Gammaℝ` asymptotic, *invGammaFactor* `= Gammaℝ⁻¹`, and
  *continuedL* `= riemannZeta` with `ζ(0) = −1/2`.
- The Dedekind record of an imaginary quadratic field: `γ = Gammaℂ`, divisor `−1` at every
  nonpositive integer, *continuedL* `= dedekindZetaC K`.

### Dependencies

Mathlib: the Gamma and digamma API, the entire reciprocal gamma functions, `riemannZeta`,
`IsOpen.is_const_of_deriv_eq_zero` (1.1). Tau Ceti `TauCeti.exists_differentiableOn_eqOn_exp_comp`,
`TauCeti.isOpen_image_of_differentiableOn_of_injOn` and
`TauCeti.isSimplyConnected_image_of_differentiableOn_of_injOn` (1.1). L-functions Layers 0, 3, 5.
Layer 0 for the record's predicates.

## Layer 2: the analytic conductor

### 2.1 The three conductors

Define *arithmeticConductor*, *analyticConductorAt* and *centralAnalyticConductor* as in the
conventions.

- `1 ≤ analyticConductorAt d s`, and each archimedean factor is at least `3`.

*Needs:* L-functions Layer 0 `AnalyticLFunctionData`.

**Checks.**

- For the `ζ` record, `analyticConductorAt d s = ‖s‖ + 3`, and *centralAnalyticConductor* is
  `7/2`.
- A record with conductor `1` and `gammaC = {0}` has `analyticConductorAt d 0 = (0 + 3)(1 + 3) = 12`,
  each `Gammaℂ(s + ν)` contributing its factors at `ν` and `ν + 1`; one factor per `Gammaℂ` would
  give `3`, and the factor `12^{r₂}` of 6.4d would become `3^{r₂}`.
- A record with no gamma factors has `analyticConductorAt d s = N` at every `s`, so the lower bound
  `1` is attained at `N = 1`. Without the `+3`, the `ζ` record would have conductor `0` at `s = 0`,
  where `log` takes its junk value.

### 2.2 Two-sided comparison

For `a ≤ b` there are `C₁, C₂ > 0` depending only on `a`, `b`, the degree `n` and a bound for the
spectral parameters, not on the arithmetic conductor, with
`C₁ N (|t| + 3)^n ≤ analyticConductorAt d (σ + it) ≤ C₂ N (|t| + 3)^n` for `σ ∈ [a, b]`.

*Needs:* 2.1.

**Checks.**

- For the `ζ` record on `[−5, 5]`, `|t| + 3 ≤ ‖σ + it‖ + 3 ≤ |t| + 8 ≤ (8/3)(|t| + 3)`, so
  `C₁ = 1` and `C₂ = 8/3`; on `[0, 0]` both constants are `1`.
- For `gammaR = {i}` the factor `‖s + i‖ + 3` decreases as `Im s` approaches `−1`, so
  *analyticConductorAt* is not monotone in `|Im s|`; the two-sided comparison still holds.

### 2.3 Normalization translation

For a `NormalizationTranslation` of weight `w`,
`analyticConductorAt analytic s = analyticConductorAt arithmetic (s + w/2)`, and
`continuedL analytic s = continuedL arithmetic (s + w/2)` as germs at every `s`, derived from
`completed_eq`, `gammaR_eq`, `gammaC_eq` and `conductor_eq` (the analytic shifts are the arithmetic
ones plus `w/2`).

*Needs:* 2.1; L-functions Layer 0 `NormalizationTranslation`; Layer 1.6 for *continuedL*.

**Checks.**

- At weight `w = 0` the translation is the identity; at a weight-`k` newform, arithmetic
  `gammaC = {0}` becomes analytic `gammaC = {(k − 1)/2}` and the central points `k/2` and `1/2`
  correspond. The opposite sign convention `μ_an = μ_ar − w/2` fails the second test.

### 2.4 Newform specialization

For a record `d` with conductor `N`, `gammaR = ∅` and `gammaC = {(k − 1)/2}`, the analytic record
of a weight-`k` newform of level `N`,
`analyticConductorAt d s = N (‖s + (k − 1)/2‖ + 3)(‖s + (k + 1)/2‖ + 3)`; and for every
`f : HeckeRing.GL2.Newform N k` this is
`HeckeRing.GL2.Newform.analyticConductorAt f (s + (k − 1)/2)`. Tau Ceti's function is stated in the
arithmetic coordinate, where it is `N (‖s‖ + 3)(‖s + 1‖ + 3)`
(`HeckeRing.GL2.Newform.analyticConductorAt_eq`), and the analytic point `s` is the arithmetic
point `s + (k − 1)/2`; this is the normalization translation of 2.3 at weight `w = k − 1`.

*Needs:* 2.1, 2.3; Tau Ceti `HeckeRing.GL2.Newform.analyticConductorAt` and
`HeckeRing.GL2.Newform.analyticConductorAt_eq`
(`NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`).

**Checks.**

- For a weight-`12` newform `f` of level `1` (the discriminant form `Δ`), 2.4 at the analytic
  centre `s = 1/2` gives `(6 + 3)(7 + 3) = 90`, which is
  `HeckeRing.GL2.Newform.analyticConductorAt f 6`, the value at the arithmetic centre `k/2 = 6`.
  Comparing at the same numerical point instead gives
  `HeckeRing.GL2.Newform.analyticConductorAt f (1/2) = 3.5 · 4.5 = 15.75`, so the shift by
  `(k − 1)/2` cannot be dropped.

### 2.5 The two families

*arithmeticConductor* is `|d_K|` for `dedekindZetaData K` and `|d_K| 𝔑(𝔣)` for `heckeData χ` of
conductor `𝔣`.

*Needs:* 2.1; L-functions Layers 3 and 5.

**Checks.**

- For `K = ℚ(i)`, `dedekindZetaData K` has conductor `4` and `gammaC = {0}`, so
  `analyticConductorAt d 0 = 4 · 3 · 4 = 48`.
- Over `ℚ` the odd character of conductor `(4)∞` has arithmetic conductor `|d_ℚ| 𝔑(4) = 4` and
  `gammaR = {1}`, so `analyticConductorAt d 0 = 4 (1 + 3) = 16`; dropping `𝔑(𝔣)` would give `4`.

### Examples

- `ζ`: conductor `1`, *analyticConductorAt* `‖s‖ + 3`.
- A primitive Dirichlet character modulo `q`: `q (‖s + a‖ + 3)` with `a ∈ {0, 1}` its parity.

### Dependencies

L-functions Layers 0, 3, 5; Layer 1.6 for the translation of *continuedL*. Tau Ceti
`HeckeRing.GL2.Newform.analyticConductorAt` and `HeckeRing.GL2.Newform.analyticConductorAt_eq`
(`NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean`), for 2.4.

## Layer 3: convexity in vertical strips

Convexity is a statement about the uncompleted *continuedL*. Bounding `Λ` polynomially and
dividing by `γ`, which decays like `exp(−π n |t|/4)`, gives an exponentially growing bound; the
Phragmén–Lindelöf interpolation is therefore run on the pole-cleared uncompleted function, whose
edge bounds are polynomial in the conductor.

### 3.1 Finite order from split Mellin integrals

For *entireCompletion* `Λ₀` of `dedekindZetaData K`, or of `heckeData χ` for a primitive
finite-order ray-class character, prove that there is `C > 0` such that, for every `s : ℂ`,
`‖Λ₀(s)‖ ≤ exp(C (1 + ‖s‖) log(2 + ‖s‖))`. Consequently `OrderLE Λ₀ 1` and *IsFiniteOrder* hold.
This estimate is a growth adapter of L-functions Layer 3's split Mellin continuation and Layer 6's
finite-order Hecke specialization; it does not use strip convexity.

Use `mellinKernel − mellinConstant` and its dual for Dedekind zeta, and
`Grossencharacter.heckeMellinTotal − Grossencharacter.heckeMellinConstant` and the inverse
character's kernel for Hecke L-functions. Split the Mellin integral at `u = 1` and apply the
supplied inversion law to the lower part. This expresses the continuation as two integrals over
`[1, ∞)` and the explicit rational polar terms. The Mellin variable for the partial zeta kernel
is `s/2`; in the Hecke case it is `(s + Tr p/n)/2`, with its fixed harmonic-degree shift.
Both kernel tails have bounds `C₀ exp(−c u^α)` with `c > 0` and `α = 1/[K:ℚ] > 0`;
continuity extends the bounds from a tail to all `u ≥ 1` after enlarging `C₀`.

The intervening estimate, for every `R ≥ 0`, `c, α > 0`, is
`∫_1^∞ u^R exp(−c u^α) du/u ≤ c^(−(R+1)/α) Γ((R+1)/α)/α`:
majorize `u^R` by `u^(R+1)` and substitute `v = c u^α`, then enlarge the positive integral
to `(0, ∞)`. Stirling on the positive real axis bounds its logarithm above by
`C₁(1 + R) log(2 + R)`. Taking `R` linear in `‖s‖` bounds both integrals; multiplying by the
nonzero polar-clearing polynomial removes the rational poles and adds only polynomial growth.
The values at the removed poles follow by continuity. Finally
`(1 + r) log(2 + r) = o(r^(1+ε))` for every `ε > 0`, giving `OrderLE _ 1`.
The constants here may depend on the field and character; conductor uniformity comes from the
edge bounds in convexity, not from this estimate.

*Needs:* Layer 0 *entireCompletion* and `OrderLE`; 1.2 on the positive real axis;
Mathlib `WeakFEPair.Λ₀`, `WeakFEPair.Λ` in `NumberTheory/LSeries/AbstractFuncEq.lean`; L-functions
Layer 3 `completedPartialZeta_eq_mellin`, `completedDedekindZeta_eq_sum_completedPartialZeta`,
`continuousOn_mellinKernel`, `mellinKernel_inv`, `mellinKernel_sub_const_isBigO`; Layer 6
`completedHeckeLFunction_eq_mellin`, `Grossencharacter.continuousOn_heckeMellinTotal`,
`Grossencharacter.heckeMellinTotal_inv`, `Grossencharacter.heckeMellinTotal_sub_const_isBigO`.

**Checks.**

- With `R = 0`, `c = α = 1`, the tail is `∫_1^∞ e^(−u) du/u < e^(−1) < 1`, while the
  displayed gamma bound is `Γ(1) = 1`; using `Γ(R/α)` instead would hit the pole at `R = 0`.
- For `Λ₀ = zetaEntireCompletion`, at `s = 2m` its value is
  `(2m)(2m−1) π^(−m) (m−1)! ζ(2m)`, whose logarithm is `m log m + O(m)`;
  this fits the bound and exceeds every fixed exponential in `m`.
- `g(s) = exp(sin(πs))` has norm `1` on both edges of `[0, 1]`, but
  `log ‖g(1/2+it)‖ = cosh(πt)`, exceeding `C(1+|t|) log(2+|t|)` for every `C`.
  Edge bounds alone cannot supply the finite-order premise of 3.2.

### 3.2 The Phragmén–Lindelöf input

If `g` is holomorphic on a neighbourhood of a closed strip, of finite order there, and bounded by
`C(1 + |t|)^a` and `C(1 + |t|)^b` on the two edges, then it is bounded by `C'(1 + |t|)^{ℓ(σ)}` on
the strip, `ℓ` the linear interpolation. Consume `PhragmenLindelof.vertical_strip`; the
work is its growth hypothesis: a finite-order bound `exp(C(1+‖s‖)^A)` on the strip is
`O(exp(B exp(c|Im s|)))` for any `0 < c < π/(σ₂−σ₁)`, where `[σ₁,σ₂]`, `σ₁ < σ₂`,
is the strip.
Normalize the polynomial edge bounds before applying the pinned theorem. It is never applied to
a function with a pole in the strip, and edge bounds alone do not imply finite order.

*Needs:* Mathlib `PhragmenLindelof.vertical_strip`.

### 3.3 The two edges

For `δ > 0`: on `Re s = 1 + δ`, `‖continuedL d s‖ ≤ C(δ)` by the average coefficient bound; on
`Re s = −δ`, `‖continuedL d s‖ ≤ C(δ) analyticConductorAt d s ^ (1/2 + δ)` by the functional
equation of 1.6 against `d.dual` together with the gamma-quotient estimate
`log ‖γ_dual(1 − s)/γ(s)‖ = (n/2)(1 + 2δ) log |t| + O(1)`, in which the two exponentials cancel
because conjugating the shifts changes no real part. That cancellation is a named sub-target.
These are the two edge estimates behind the convexity bound (Iwaniec–Kowalski §5.2; for `ζ`,
Titchmarsh §5.1, where the edge exponents `0` and `1/2 − σ` are read off the Dirichlet series and
the functional equation with Stirling's formula).

*Needs:* 1.5, 1.6, 2.2; L-functions Layer 0 average coefficient growth.

### 3.4 The strip bound and convexity

Define the **clearing polynomial** *clearingPoly* `d δ`, the monic `∏_p (X − p)^{n_p}` over the
poles `p` of *continuedL* `d` with `Re p ∈ [−δ, 1 + δ]`, `n_p` the pole order; and, for a
polynomial `P : ℂ[X]` with `P ≠ 0` and root multiplicities dominating those poles, the
**pole-cleared function**
*poleClearedContinuedL* `d P`, the removable analytic extension of `s ↦ P.eval s · continuedL d s`
across the removable singularities at roots of `P`. Every clause below assumes `P ≠ 0`;
the extension is meromorphic on `ℂ` and analytic near the strip. At any remaining pole outside
the strip retain the original representative. This is the removable-singularity and order-product
adapter of `MeromorphicOn.extract_zeros_poles` and `meromorphicOrderAt_mul`.

- *poleClearedContinuedL* `d P` agrees with `P · continuedL d` off the roots of `P` and is analytic
  on a neighbourhood of the closed strip.
- `meromorphicOrderAt (poleClearedContinuedL d P) z = meromorphicOrderAt (continuedL d) z +
  rootMultiplicity z P` at every `z`.
- Under the additional hypothesis *IsFiniteOrder* `d`, it has finite order on the strip:
  multiply the entire completion by the reciprocal gamma factor and `N^(−s/2)`, then
  cancel the polynomial factors using analyticity at the removable points. Section 1.6 gives
  order at most one for the reciprocal gamma factor.

*Needs:* Layer 0 *entireCompletion* and *IsFiniteOrder*; 1.6; Mathlib
`Polynomial.rootMultiplicity`, `meromorphicOrderAt_mul`, removable singularities.

**Checks.**

- `poleClearedContinuedL riemannZetaData (X − 1) 1 = 1`, the residue of `ζ` at `1`, while the raw
  product `(1 − 1) · riemannZeta 1` is `0`; an upper bound stated for the raw product is satisfied
  by `0` and bounds nothing at the pole.
- *clearingPoly* of the `ζ` record for any `δ ∈ (0, 1)` is `X − 1`: the pole of `Λ` at `0` is
  cancelled by the pole of `Gammaℝ`, so `ζ` is regular there.
- For a nontrivial primitive Dirichlet character *clearingPoly* is `1` and
  *poleClearedContinuedL* is *continuedL*.
- For the primitive character modulo `4`, at `s = 2`, clearing by `P = 1` leaves order `0`,
  while `P = X − 2` gives order `1 = 0 + 1`. The excluded polynomial `P = 0` would give the
  identically zero product, of order `⊤`, while `Polynomial.rootMultiplicity_zero` is `0`.

Assume Dirichlet agreement, meromorphic continuation, the functional equation, the average
coefficient bound and *IsFiniteOrder* `d`. Then for every `δ > 0` and every nonzero clearing
polynomial `P` as above there is `C` with
`‖poleClearedContinuedL d P s‖ ≤ C (1 + |Im s|)^{deg P} analyticConductorAt d s ^ ((1/2 + δ)(1 + δ − σ)/(1 + 2δ))`
for `σ = Re s ∈ [−δ, 1 + δ]`: Phragmén–Lindelöf between the two edges of 3.3, the convexity bound
of Iwaniec–Kowalski §5.2 (for `ζ`, Titchmarsh §5.1). The arithmetic-conductor powers
`N^{1/2+δ}` and `N^0` at the edges are carried by hand, not interpolated, and reassembled with
2.2. Corollaries:

- **central-line convexity**: at `σ = 1/2` the exponent is `1/4 + δ/2`, so for every `ε > 0`,
  `‖continuedL d (1/2 + it)‖ ≤ C analyticConductorAt d (1/2 + it)^{1/4 + ε}` for a record whose
  polar support does not meet the critical line, `C` depending on `ε`, the degree, a bound for the
  spectral parameters, the constant in the average coefficient bound and a lower bound for the
  distance from the line to the polar support, and not on the arithmetic conductor. At `K = ℚ`,
  uniformly over primitive Dirichlet characters, this is `dirichletLFunction_convexity`;
- **wide strips above the poles**: for every closed strip `[a, b]` there are `C`, `B` and `T₀`
  with `‖continuedL d (σ + it)‖ ≤ C analyticConductorAt d (σ + it)^B` for `σ ∈ [a, b]` and
  `|t| ≥ T₀`, for every `T₀` strictly larger than the heights of the poles of *continuedL*, the
  constants depending on the margin. Layer 4.4 uses it on `[−2, 6]`.

*Needs:* 3.2, 3.3, *poleClearedContinuedL*, 2.2; Layer 0 *IsFiniteOrder*,
proved for the two families in 3.1. The central-line statement uses the same hypotheses.

### 3.5 Completed growth on fixed vertical strips

For a record with Dirichlet agreement, continuation, functional equation, the average coefficient
bound and *IsFiniteOrder*, prove *HasVerticalStripGrowth* (Layer 0). Apply the wide-strip bound
of 3.4 to *continuedL* and multiply by `N^(s/2) γ(s)`; the gamma exponential dominates every
fixed power of `|t|` on a compact interval of real parts (DLMF 5.11.9, 1.5).
For any `T₀ ≥ 0` strictly larger than all pole heights of `Λ`, the intermediate compact region
is bounded by continuity. Constants depend on the strip, record and pole-height margin.
The entire completion admits any `T₀ ≥ 0`; the two families admit `T₀ = 2`.

In particular, for `δ > 0` the uncompleted series is bounded on the whole half-plane
`Re s ≥ 1+δ`. For the completed function fix also `b ≥ 1+δ`: on `[1+δ,b]` at sufficiently
large height it is bounded with exponent `A = 0`, with constants depending on `b`.
There is no completed bound uniform in unbounded real part.

*Needs:* 3.4; 1.5; Layer 0 growth predicates; L-functions Layer 0
`HasDirichletAgreement.completed_eq` and the average coefficient bound.

**Checks.**

- For `ζ`, `‖ζ(σ+it)‖ ≤ ζ(2) = π²/6` for all `σ ≥ 2`; on each `[2,b]`,
  `‖Λ(σ+it)‖ ≪_b exp(−π|t|/4)|t|^((σ−1)/2)`, so `A = 0` works for `|t| ≥ 2`.
- On the positive real axis `Λ(2m) = π^(−m)(m−1)! ζ(2m)`, unbounded as `m → ∞`.
  Even at the permitted fixed height `2`, `‖Λ(2m+2i)‖ ∼ π^(−m)(m−1)!`;
  at `m = 10,20` the norms are approximately `3.67680` and `13519751.81`.
  Thus fixing a positive height does not rescue a whole-half-plane bound.
- For the shifted record with poles at `±5i` and `1±5i`, `T₀ = 6` gives margin `1`, while
  `T₀ = 5` fails as `σ → 1` at `t = 5`. For the zeta record, `T₀ = 2` avoids its real poles.

### Examples

- `ζ(1/2 + it) ≪ |t|^{1/4 + ε}`, the `q = 1` case of `dirichletLFunction_convexity`.
- For a primitive character modulo `q`, `L(1/2, χ) ≪ q^{1/4 + ε}`.

### Dependencies

Mathlib `PhragmenLindelof.vertical_strip`. Layers 0, 1.5, 1.6, 2. L-functions Layers 0,
3, 5, 6 (the kernel inputs for 3.1).

## Layer 4: zero counting

### 4.1 The two counts

Define *divisorCount* `f U R : ℤ` and `zeroCount f U R : ℕ` as in the conventions.

- Both are finite sums when `R` is bounded and `f` is meromorphic on an open set containing its
  closure, by `LocallyFiniteSupport.finite_inter_support_of_isCompact`.
- *divisorCount* `= zeroCount` when `∀ z ∈ R, 0 ≤ divisor f U z`.
- Both are `0` when `R` is empty.
- For `R ⊆ R'` with `R'` bounded and `f` meromorphic on an open set containing the closure of `R'`,
  `zeroCount f U R ≤ zeroCount f U R'`, with equality exactly when `divisor f U` takes no positive
  value on `R' \ R`. Poles in the difference leave the count unchanged.
- **Exact additivity in height**: for `t₁ ≤ t₂ ≤ t₃`, the counts over `Icc σ₁ σ₂ ×ℂ Ioc t₁ t₃` are
  the sums of those over the two half-open pieces, under meromorphy on an open set containing the
  closed rectangle.

*Needs:* Mathlib `MeromorphicOn.divisor`, `MeromorphicOn.divisor_restrict`,
`LocallyFiniteSupport.finite_inter_support_of_isCompact`.

**Checks.**

- For `f z = z (z − 1)` and `R = closedBall 0 2`, `zeroCount = 2`; for `f z = z/(z − 1)` the
  zero count is `1` and *divisorCount* is `0`, so the two differ by the pole.
- For `f = 0` every order is `⊤` and the divisor is `0`, so both counts are `0` on every region.
- Two closed rectangles sharing an edge carrying a simple zero both count it, so closed additivity
  would give `2` for a total of `1`; the half-open split counts it once.
- `f z = 1/z`, `U = ℂ`, `R = ∅ ⊆ R' = {0}`: both zero counts are `0`, since `(−1).toNat = 0`, while
  the divisor on `R' \ R` is `−1`; a criterion "the divisor vanishes on the difference" would
  predict a change. For `f z = z` the same sets give `0` and `1`.
- `f z = sin (π z)`, `R = {0}` and `R'` the real axis: the counts are `1` and the finite-sum junk
  value `0`, so monotonicity needs `R'` bounded.

### 4.2 The zero divisor of a record

For a record satisfying `HasMeromorphicContinuation` and every `U : Set ℂ`, `divisor Λ U` is
nonnegative off `polarOrder.support` and equals `−polarOrder` at the points of
`U ∩ polarOrder.support`. Off `U` it is `0` (`MeromorphicOn.divisor_def`), so no value is claimed
at a pole outside `U`; in particular `divisor Λ univ = −polarOrder` on `polarOrder.support`.
Moreover `divisor (entireCompletion d) univ = divisor Λ univ + polarOrder`.

*Needs:* Layer 0; L-functions Layer 0; Mathlib `MeromorphicOn.divisor_def`.

**Checks.**

- The `ζ` record, `polarOrder = single 0 1 + single 1 1`, with `U = ∅`:
  `divisor completedRiemannZeta ∅ 1 = 0`, while `−polarOrder 1 = −1`; a clause giving `−polarOrder`
  on all of `polarOrder.support` for every `U` is false. With `U = univ` the value is `−1`, the
  simple pole of `Λ` at `1`.
- The `ζ` record at `−2`: `polarOrder (−2) = 0` and `divisor completedRiemannZeta univ (−2) = 0`,
  since `Λ(−2) = Λ(3) ≠ 0`; the trivial zero of `ζ` is cancelled by the pole of `Gammaℝ` and is not
  a zero of `Λ`.
- `divisor zetaEntireCompletion univ 1 = divisor completedRiemannZeta univ 1 + polarOrder 1 =
  −1 + 1 = 0`, in agreement with `zetaEntireCompletion 1 = 1 ≠ 0`; at a nontrivial zero `ρ`, where
  `polarOrder ρ = 0`, the two divisors agree.

### 4.3 Jensen's bound

From `AnalyticOnNhd.sum_divisor_le`: for `0 < r < R`, `f` analytic on `closedBall c R`,
`f c ≠ 0` and `‖f‖ ≤ M` on `sphere c R` with `1 ≤ M`, the number of zeros in `closedBall c r` is at
most `log (M/‖f c‖)/log (R/r)`. **Trailing-coefficient form**: if instead `f` has finite central
order `m` and trailing coefficient `a = meromorphicTrailingCoeffAt f c`, the count is at most
`m + (log (M/‖a‖) − m log R)/log (R/r)`, for every bound `M` on the sphere, with no lower bound on
`M`. Route: `g(z) = f(z)/(z − c)^m`, extended by `g(c) = a ≠ 0`, is analytic on `closedBall c R`,
has the zeros of `f` off `c`, and satisfies `‖g‖ ≤ M/R^m` on `sphere c R`; apply the first form
with bound `1` to `(R^m/M) g`, whose zeros are those of `g`. The scalar is positive: `M > 0`,
since otherwise `f` vanishes on the sphere and hence, by the maximum principle, on the whole ball,
against the finiteness of `m`. Applying the first form to `g` itself would need `1 ≤ M/R^m`.

*Needs:* Mathlib `AnalyticOnNhd.sum_divisor_le`, `meromorphicTrailingCoeffAt`,
`AnalyticAt.analyticOrderAt_eq_natCast` (the factorization `f = (z − c)^m g` near `c`, with `g`
analytic at `c` and `g c ≠ 0`), `AnalyticAt.meromorphicTrailingCoeffAt_of_ne_zero_of_eq_nhdsNE`
(`g c = a`), `Complex.norm_le_of_forall_mem_frontier_norm_le` and `frontier_ball` (the maximum
principle on `ball c R`, for `M > 0`).

**Checks.**

- `f z = z`, `c = 0`, `r = 1/4`, `R = 1/2`, `M = 1`: the count is `1` and the trailing form gives
  `1 + (0 + log 2)/log 2 = 2`, while replacing `‖f c‖` by `‖a‖` in the first form gives
  `log (M/‖a‖)/log (R/r) = 0`, which is false.
- `f z = z/10`, `c = 0`, `r = 1`, `R = 2`, `M = 1`: the quotient `g = 1/10` has sphere bound
  `M/R = 1/2 < 1`, so the first form does not apply to `g` unscaled, while `(R/M) g = 1/5` has bound
  `1` and at most `log 5/log 2 ≈ 2.32` zeros in `closedBall 0 1` (it has none). The trailing form
  gives `1 + (log 10 − log 2)/log 2 ≈ 3.32` against the true count `1`.
- `f z = 1 − z/2` with `c = 0`, `r = 1`, `R = 3/2` and `M = 2` (the maximum on `sphere 0 (3/2)` is
  `7/4`): its only zero is at `2`, the count in `closedBall 0 1` is `0`, and the bound
  `log 2/log (3/2) ≈ 1.71` is consistent.
- A rectangle lies in the disc through its corners, so only upper bounds transfer from discs to
  rectangles.

### 4.4 The local count for the two families

For `Λ` of `dedekindZetaData K` or of `heckeData χ`, and every `T ≥ 0`, the number of zeros of
*entireCompletion* in `closedBall (1/2 + iT) 1` is `O(log analyticConductorAt d (iT))`, the
constant depending on the degree only. At `K = ℚ` the disc lies in the strip `|Im s − T| ≤ 1`,
whose zero count is `O(log (T + 2))` for `ζ` (Davenport §15) and `O(log (q (T + 2)))` for a
primitive Dirichlet `L(s, χ)` modulo `q` (Davenport §16); the general statement is proved here.

Route: base point `c = 2 + iT`, where the Euler product gives `‖continuedL d c‖ ≥ ζ_K(2)^{−1}`;
radii `3` and `4`, so that 4.3 on `closedBall c 3` covers the disc; and the ratio bound
`sup_{sphere c 4} ‖entireCompletion d‖ / ‖entireCompletion d c‖ ≤ analyticConductorAt d (iT)^B`,
`B` depending on the degree only. The sphere has real parts in `[−2, 6]` and heights in
`[T − 4, T + 4]`, and the ratio bound is proved separately on two ranges of `T`, split at a
height `T₁` depending on the degree only. Throughout, the constants taken from 1.5 and 3.4 depend
on the degree only: the gamma shifts of the two families lie in `{0, 1}`, the only possible pole of
*continuedL* is `1`, and the coefficients are dominated by those of `ζ(s)^n`.

- **High range**, `T ≥ T₁`, where `T₁ − 4` is at least a threshold `T₀ > 0` of the wide-strip
  corollary of 3.4 (the pole `1` has height `0`) and at least the height from which the `O(1)` of
  1.5 holds for each of the finitely many gamma factors of degree `n`: the two gamma factors are
  compared on the same height range by 1.5, and the uncompleted factor is bounded by the
  wide-strip corollary of 3.4. Bounding *entireCompletion* alone and dividing would leave
  `exp(+π n T/4)` in the ratio.
- **Low range**, `0 ≤ T < T₁`: the sphere can reach heights below `T₀`, where neither input
  applies; for `ζ_K` it passes at `T = 0` through `−2`, a pole of `γ` and a trivial zero, and at
  `T = √15` through the pole `1`. Reflect instead:
  `‖entireCompletion d s‖ = ‖entireCompletion d (1 − conj s)‖` for every `s`, since
  `HasFunctionalEquation.eventuallyEq` with `dual_completed` gives `Λ(s) = ε conj Λ(1 − conj s)`
  as germs with `‖ε‖ = 1`, and `polarOrder_one_sub_conj` changes the clearing polynomial `P₀` of
  Layer 0 only by conjugation and the sign `(−1)^{deg P₀}` under `s ↦ 1 − conj s`. This carries the
  part of the sphere with `Re s < 1/2` into `[1/2, 3] × [T − 4, T + 4]`, at the same heights. On
  `Re s ≥ 1/2` every gamma shift of the two families is `0` or `1`, so `γ` is regular there and
  *entireCompletion* `d = Q · N^{s/2} γ · poleClearedContinuedL d P`, with `P` the clearing
  polynomial of 3.4 and `Q = P₀/P` (`X` for `ζ_K` and the trivial character, `1` otherwise).
  Bound `‖γ(s)‖ ≤ γ(Re s)` by 1.3a, `‖N^{s/2}‖ ≤ N³`, the pole-cleared factor by the strip bound
  of 3.4 on `1/2 ≤ Re s ≤ 1 + δ` and by `‖P(s)‖ ζ(1 + δ)^n` from the Dirichlet series on
  `Re s ≥ 1 + δ`; at `c`, bound `‖γ(c)‖` below on the compact segment
  `{2 + it : 0 ≤ t ≤ T₁}`, uniformly over the gamma factors of degree `n`. On this range
  `N ≤ analyticConductorAt d (iT) ≤ C N` (2.2), so the ratio is at most a constant times a fixed
  power of `N`, and hence at most `analyticConductorAt d (iT)^B`, since
  `analyticConductorAt d (iT) ≥ 3`.

*Needs:* 4.3, 1.3a, 1.5, 1.6, 2.2, 3.4, 3.1; Layer 0 *entireCompletion*; L-functions Layers 3 and
5 for the Euler product on `Re s = 2` and the gamma shifts of the two families; Tau Ceti
`TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`,
`TauCeti.LFunctions.AnalyticLFunctionData.dual_completed` and the fields
`HasFunctionalEquation.norm_rootNumber` and `HasFunctionalEquation.polarOrder_one_sub_conj`
(L-functions Layer 0).

**Checks.**

- For `ζ` at `T = 0` the sphere `sphere 2 4` passes through `−2`. Near it `‖Gammaℝ(s)‖` is about
  `1.6 · 10⁴` at distance `4 · 10⁻⁴` while `‖ζ(s)‖ ≈ 1.2 · 10⁻⁵`, so separate bounds for the gamma
  factor and the uncompleted factor are unbounded on the sphere; the product stays near
  `zetaEntireCompletion (−2) = zetaEntireCompletion 3 = 6 Λ(3) ≈ 1.14788`, the value the
  reflection gives.
- For `ζ` at `T = √15` the sphere about `2 + i√15` passes through `1`, since
  `‖1 − (2 + i√15)‖ = 4`: `‖ζ‖` exceeds `2500` at distance `4 · 10⁻⁴` from `1` on the sphere,
  while the pole-cleared factor `(s − 1) ζ(s)` stays near `1`.
- For `ζ` at `T = 0` the maximum of `‖zetaEntireCompletion‖` on `sphere 2 4` is
  `zetaEntireCompletion 6 ≈ 1.96865`, at the point farthest from `1/2`, against
  `zetaEntireCompletion 2 = π/3`; Jensen allows at most `log (1.96865 · 3/π)/log (4/3) ≈ 2.19`
  zeros in `closedBall 2 3`, which contains none.

### 4.5 Counting functions

For the two families, `N(T + 1) − N(T) = O(log analyticConductorAt d (iT))` for every `T ≥ 0`,
and `N(T) = O(T log analyticConductorAt d (iT))` for every `T ≥ 1`, the constants depending on the
degree only (Titchmarsh, Theorem 9.2, is the `K = ℚ` case). Route: the rectangle
`Icc 0 1 ×ℂ Ioc T (T + 1)` lies in `closedBall (1/2 + i(T + 1/2)) (√2/2)`, inside the disc of 4.4
at height `T + 1/2`; the zeros of `Λ` and of *entireCompletion* agree with multiplicity (4.2, and
*entireCompletion* does not vanish on `polarOrder.support`); and
`analyticConductorAt d (i(T + 1/2)) ≤ (7/6)^n analyticConductorAt d (iT)`, since each of the `n`
archimedean factors is at least `3` and grows by at most `1/2`. Summing the first clause at the
heights `k = 0, 1, …, ⌈T⌉ − 1`, which uses 4.4 at `1/2` and `3/2`, below `2`, gives the second, as
`analyticConductorAt d (it)` is nondecreasing in `t ≥ 0` for real shifts and `⌈T⌉ ≤ 2T`. The
second clause starts at a positive height: stated for every `T > 0` and evaluated at the least
positive ordinate `γ₁` of a member, it would give `γ₁ ≥ 1/(C log analyticConductorAt d (iγ₁))`
uniformly in the family, a lower bound no theorem here provides.

Define `N(T)` and `N±(T)` as in the conventions.

- `N` is monotone and right-continuous in `T`, and `N 0 = 0`.
- `N(T)` is finite for every `T`, and the zero set of `Λ` in the critical strip is discrete.
- `N±(T) = 2 N(T)` when the divisor of `Λ` is invariant under `ρ ↦ conj ρ` and `Λ` has no zero on
  the real segment `[0, 1]`; for `ζ_K` invariance follows from real coefficients, for a real
  character `χ` from `Λ(χ, conj s) = conj Λ(χ, s)`, and for a general `χ` the count of `χ` above
  the axis is the count of `χ⁻¹` below it.

*Needs:* 4.1, 4.2, 4.4; 2.1 for the archimedean factors.

**Checks.**

- For `ζ`, `N(14) = 0` and `N(15) = 1`, the first zero having ordinate `14.1347…`; a count over
  `Ioc 0 T` with `T` exactly an ordinate includes that zero.
- For the quartic character modulo `5`, `N` above the axis for `χ` equals `N` below the axis for
  `χ̄`, and the two differ from each other in general.
- `N±` for `ζ` at `T = 100` is `58`, twice `N(100) = 29`; a symmetric count that also included the
  real axis would add the multiplicity of any real zero.
- The square `Icc 0 1 ×ℂ Ioc 0 1` lies in `closedBall (1/2 + i/2) 1`: its farthest points `0`,
  `1`, `i` and `1 + i` are at distance `√2/2 ≈ 0.7071` from the centre. Every disc of 4.4 at a
  height `T ≥ 2` lies in `Im s ≥ 1` and misses the zeros with `0 < Im ρ < 1`, so the bound for
  `N(1)`, and with it the clause for `N(T)`, needs 4.4 at `T = 1/2`.
- For `ζ`, `analyticConductorAt d (iT) = T + 3`, and `(T + 7/2)/(T + 3) ≤ 7/6` for `T ≥ 0`, with
  equality at `T = 0`: the shift by `1/2` in height costs at most the factor `(7/6)^n` with `n = 1`.

### 4.6 The comparison with Nevanlinna theory

For `f` meromorphic on `ℂ`: `zeroCount f univ (closedBall 0 r)` is the unintegrated count
`n(r)`; its log-weighted integral is `ValueDistribution.logCounting f 0 r`, the log-counting
function of the positive part of the divisor, and not the signed
`Function.locallyFinsuppWithin.logCounting (divisor f univ) r`; and
`n(r) log (R/r) ≤ ValueDistribution.logCounting f 0 R − ValueDistribution.logCounting f 0 r` for
`0 < r < R`. The letter `N` denotes only the critical-strip count of 4.5.

*Needs:* Mathlib `ValueDistribution.logCounting`, `ValueDistribution.log_counting_zero_sub_logCounting_top`.

**Checks.**

- `f z = z`: both carriers give `log r` for `r ≥ 1`.
- `f z = 1/z`: the zero count is `0`, while the signed log-counting function is `−log r`, so the
  inequality on the signed carrier would read `0 ≤ −log (R/r)`.
- `f z = z²`: `n(r) = 2` and the log-counting function is `2 log r`.
- `f z = z² (z − 3)`, `r = 2`, `R = 4`: `n(2) = 2`, the left side is `2 log 2 ≈ 1.386` and the
  right side `2 log 2 + log (4/3) ≈ 1.674`; at `r = 3`, `R = 5` both sides are `3 log (5/3)`, since
  no zero has `3 < ‖z‖ ≤ 5`.

### Examples

- The first zero of `ζ` at height `14.1347…`.
- `ζ_{ℚ(i)} = ζ · L(χ₋₄)` (`dedekindZetaC_quadratic`), so the divisors add and a common zero would
  have order `2` on the left.

### Dependencies

Mathlib Jensen and divisor API, Nevanlinna counting. Layers 0, 1.3a, 1.5, 1.6, 2, 3.4, 3.1
(4.4–4.5). L-functions Layers 0, 3, 5; at Layer 0, for 4.4, `HasFunctionalEquation.eventuallyEq`,
`dual_completed` and the fields `HasFunctionalEquation.norm_rootNumber` and
`HasFunctionalEquation.polarOrder_one_sub_conj`.

## Layer 5: Hadamard factorization

### 5.1 Zeros of a function of finite order

For an entire `f` with `OrderLE f A` and `f 0 ≠ 0`, the number of zeros in `closedBall 0 r` is
`O(r^{A + ε})` for every `ε > 0`, from 4.3 with centre `0`. The zeros are the support of
`MeromorphicOn.divisor f univ`, countable and locally finite; the canonical product is indexed by
that support with the divisor value as multiplicity, so no enumeration is chosen.

*Needs:* 4.3, `OrderLE`.

### 5.2 The elementary factor

Define *E₁* `z = (1 − z) exp z`.

- `E₁ 0 = 1`, and `E₁ z = 0 ↔ z = 1`.
- `deriv E₁ z = −z exp z`, and `logDeriv E₁ z = −z/(1 − z)` for `z ≠ 1`.
- `‖E₁ z − 1‖ ≤ C ‖z‖²` for `‖z‖ ≤ 1/2`.
- `log ‖E₁ z‖ ≤ C (1 + ‖z‖)` for all `z ≠ 1`.

*Needs:* Mathlib `Complex.exp`, `deriv`, `logDeriv`.

**Checks.**

- `E₁ 0 = 1` and `deriv E₁ 0 = 0`, so `E₁ z = 1 − z²/2 + O(z³)` has no linear term; the genus-`0`
  factor `1 − z` has linear term `−z`.
- `E₁` has a simple zero at `1` with `deriv E₁ 1 = −e`.
- At `z = −1/2`, `‖E₁ z − 1‖ = 1 − (3/2)e^{−1/2} ≈ 0.090`, within `C ‖z‖²` for `C = 1/2`, while the
  genus-`0` factor gives `‖(1 − z) − 1‖ = 1/2`, a linear and not a quadratic deviation.

### 5.3 The canonical product

For entire `f` with `OrderLE f 1` and `f 0 ≠ 0`, `∑_ρ m_ρ ‖ρ‖^{−1−ε} < ∞` for every `ε > 0` by
partial summation from 5.1, so `∑_ρ m_ρ ‖ρ‖^{−2} < ∞`; the product `∏_ρ E₁(s/ρ)^{m_ρ}` converges
locally uniformly on `ℂ` (`Summable.multipliableLocallyUniformlyOn_one_add` with the estimate
of 5.2), its limit is entire, and its divisor is `divisor f univ`. This is the genus-one
construction of Davenport §11, adapted to the pinned divisor carrier: 4.3
(`AnalyticOnNhd.sum_divisor_le`) and Abel summation give zero summability;
`Summable.multipliableLocallyUniformlyOn_one_add` gives the product,
`TendstoLocallyUniformlyOn.differentiableOn` gives entirety, and
`tprod_one_add_ne_zero_of_summable` applied after removing the factors at a fixed zero gives
its exact multiplicity.

*Needs:* 5.1, 5.2; Mathlib `Summable.multipliableLocallyUniformlyOn_one_add`,
`tprod_one_add_ne_zero_of_summable`, `TendstoLocallyUniformlyOn.differentiableOn`.

**Checks** for the canonical product.

- For `f z = 1 − z` the product is the single factor `E₁(z)`.
- For `f z = cos z` the zeros `±(k + 1/2)π` pair up, the exponential factors cancel in each pair,
  and the product is `∏ (1 − z²/((k + 1/2)²π²))`.
- For `f = exp` the support is empty and the product is `1`.

### 5.4 The entire logarithm

A nonvanishing entire `g` is `exp ∘ h` for an entire `h`: this is
`TauCeti.exists_differentiableOn_eqOn_exp_comp` at `U = Set.univ`, whose simple connectivity
comes from `Convex.contractibleSpace convex_univ` and `SimplyConnectedSpace.ofContractible`, so
existence is consumed. The target here is uniqueness: two entire `h₁`, `h₂` with
`exp ∘ h₁ = exp ∘ h₂` differ by a constant in `2πi ℤ`. Route: differentiating gives
`h₁' exp h₁ = h₂' exp h₂`, so `h₁' = h₂'` since `exp` never vanishes, `h₁ − h₂` is constant by
`is_const_of_deriv_eq_zero`, and the constant lies in `2πi ℤ` by
`Complex.exp_eq_exp_iff_exists_int`.

*Needs:* Tau Ceti `TauCeti.exists_differentiableOn_eqOn_exp_comp`; Mathlib
`Convex.contractibleSpace`, `SimplyConnectedSpace.ofContractible`, `is_const_of_deriv_eq_zero`,
`Complex.exp_eq_exp_iff_exists_int`.

**Checks.**

- `g = exp`: `h z = z` and `h z = z + 2πi` are both entire logarithms, so uniqueness holds only
  modulo `2πi ℤ`; `h z = z + πi` fails, since `exp (z + πi) = −exp z`.
- `g z = z` vanishes at `0` and has no entire logarithm: `exp ∘ h` never vanishes, so the
  nonvanishing hypothesis is needed.
- `g z = exp (z²)`: `h z = z²` is entire although `Complex.log ∘ g` jumps by `2πi` wherever
  `Im (z²)` crosses an odd multiple of `π`, so the principal logarithm is not the branch.

### 5.5 Hadamard's theorem at order at most one

For entire `f` with `OrderLE f 1` and `f 0 ≠ 0` there are `a b : ℂ` such that for every `s` the
family `ρ ↦ E₁(s/ρ)^{m_ρ}` over `ℂ` is multipliable and `f s = exp (a + b s) ∏'_ρ E₁(s/ρ)^{m_ρ}`;
this is `hadamard_of_orderLE_one`, and its instance at `zetaEntireCompletion` is
`zetaEntireCompletion_hadamard` (Davenport, *Multiplicative Number Theory*, §11 and §12). The route:
the quotient of `f` by the product is entire and nonvanishing, hence `exp h` by 5.4; bound `Re h` on
large circles by the order hypothesis, convert by `Complex.borelCaratheodory`, and conclude by the
Cauchy estimates that `h` has degree at most `1`. Then
`logDeriv f s = b + ∑_ρ m_ρ (1/(s − ρ) + 1/ρ)`, by `logDeriv_tprod_eq_tsum`, locally uniformly on
`ℂ` minus the zeros and absolutely for each fixed `s` off them.

*Needs:* 5.3, 5.4; Mathlib `Complex.borelCaratheodory`, `logDeriv_tprod_eq_tsum`.

### 5.6 The L-function corollaries

For `Λ₀ = entireCompletion d` of one of the two families, 5.5 applies: `Λ₀` has order at most one
by 3.1, and `Λ₀(0) ≠ 0`. At the trivial character `0` is a pole of `Λ` and the entire completion does
not vanish there (Layer 0); at a nontrivial `χ` the functional equation gives `Λ(0) = ε conj Λ(1)`,
and `Λ(1) ≠ 0` because the gamma factor is regular and nonzero at `1` (1.5) and `L(1, χ) ≠ 0`. With
`a, b` the coefficients of 5.5 for `Λ₀`:

- `0 ≤ ∑_ρ m_ρ Re (1/(s − ρ))` for `Re s > 1`, as an absolutely convergent sum of real parts, each
  summand strictly positive because `0 ≤ Re ρ ≤ 1 < Re s` (5.6a);
- `Re b = −∑_ρ m_ρ Re (1/ρ)`, a convergent sum of nonnegative terms, since
  `0 ≤ Re (1/ρ) = Re ρ/‖ρ‖² ≤ ‖ρ‖^{−2}` on the closed critical strip. Route:
  `HasFunctionalEquation.eventuallyEq` and `dual_completed` give `Λ(s) = ε conj Λ(1 − conj s)` as
  germs, and `polarOrder_one_sub_conj` makes the clearing polynomial change only by the sign
  `(−1)^{deg P}` under `s ↦ 1 − conj s`, so `Λ₀(s) = κ conj Λ₀(1 − conj s)` on `ℂ` with
  `‖κ‖ = 1`. The factorization of `s ↦ conj Λ₀(conj s)` has coefficient `conj b` and zeros
  `conj ρ`, so comparing logarithmic derivatives at `s = 0` gives
  `b + conj b = −∑_ρ m_ρ (1/conj ρ + 1/(1 − conj ρ))`; taking real parts, the two nonnegative sums
  `∑ m_ρ Re (1/ρ)` and `∑ m_ρ Re (1/(1 − ρ))` are equal, since `ρ ↦ 1 − conj ρ` permutes the zeros
  with multiplicity. The identity holds for every member of the two families, real or not.
  Neither order one nor reality gives it: `exp s · zetaEntireCompletion s` is real on `ℝ`, has the
  zeros of `zetaEntireCompletion` and a `b` larger by `1`, and is excluded by the functional
  equation, since it takes the value `exp(1 − 2s)` times its value at `s` at the point `1 − s`;
- the number of zeros with `|Im ρ − T| ≤ 1` is `O(log analyticConductorAt d (iT))`, re-proved from
  the partial-fraction expansion.

At `K = ℚ` the second clause is Davenport §12 (for `ξ(s)` and for `ξ(s, χ)` with every primitive
`χ`) and the third is Davenport §§15–16. For `ζ_K` the second clause enters 6.4 through the
real-part partial-fraction formula for `−ζ'_K/ζ_K` recalled in Kadiri §2.1.2. For the two families
the three clauses are assembled here from 5.5, 3.1 and 4.4, as 6.4 is.

*Needs:* 5.5, 5.6a, 3.1, 4.4, 1.5; Layer 0 *entireCompletion*; Tau Ceti
`TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`,
`TauCeti.LFunctions.AnalyticLFunctionData.dual_completed` and the field
`HasFunctionalEquation.polarOrder_one_sub_conj` (L-functions Layer 0); L-functions Layers 3 and 5,
and Layer 7 `heckeLFunction_ne_zero_of_one_le_re` at `s = 1` for `Λ₀(0) ≠ 0`.

**Checks.**

- For `zetaEntireCompletion`, `b = −γ_E/2 − 1 + ½ log 4π ≈ −0.0230957` and
  `∑_ρ m_ρ Re (1/ρ) = 1 + γ_E/2 − ½ log 4π ≈ 0.0230957` (Davenport §12), so the identity holds
  with both sides `≈ −0.0230957`.
- `f(s) = exp s · zetaEntireCompletion s` has `f(0) = 1` and `f(1) = e ≈ 2.718`, so no `κ` with
  `‖κ‖ = 1` gives `f(s) = κ conj f(1 − conj s)` at `s = 0`; its `b ≈ 0.9769043` while
  `−∑_ρ m_ρ Re (1/ρ) ≈ −0.0230957`. A version of the clause assuming only reality on `ℝ` would
  accept `f`.
- For the odd primitive character `χ₄` modulo `4`, `Λ(χ₄, 0) = Gammaℝ(1) L(0, χ₄) = 1/2` and
  `Λ(χ₄, 1) = 2 Gammaℝ(2) L(1, χ₄) = 1/2`, so `Λ₀(0) ≠ 0` with root number `1`, as 5.5 requires.

### 5.6a Ordinate summability of the zeros

For `Λ₀ = entireCompletion d` of one of the two families and `m_ρ = (divisor Λ₀ univ ρ).toNat`:

- every zero lies in the closed critical strip: `0 < m_ρ → 0 ≤ Re ρ ∧ Re ρ ≤ 1`;
- the family `ρ ↦ m_ρ/(1 + (Im ρ)²)` over `ℂ` is summable, so `∑'_ρ m_ρ/(1 + (Im ρ)²)` is a
  convergent sum over the zeros with multiplicity.

The positive parts of `divisor Λ₀ univ` and `divisor Λ univ` agree (4.2, and *entireCompletion*
does not vanish on `polarOrder.support`), so both clauses hold for the zeros of `Λ`. At `K = ℚ` and
the trivial character this is `riemannZeta_zeros_summable_ordinate`, over the zeros of
`completedRiemannZeta`.

Route: on `Re s > 1` the Euler product does not vanish (L-functions Layers 3 and 5) and the gamma
factor has neither zeros nor poles (1.5), so `Λ₀(s) ≠ 0`; the germ functional equation
`HasFunctionalEquation.eventuallyEq` against the dual record, which lies in the same family, carries
this to `Re s < 0`. Next, `s ↦ Λ₀(s + 2)` is entire with `OrderLE _ 1`, since the bound
`exp(C(1 + ‖s‖) log(2 + ‖s‖))` of 3.1 survives the translation with a larger `C`, and it is nonzero
at `0`; so 5.3 gives `∑_ρ m_ρ ‖ρ − 2‖^{−2} < ∞`. For `0 ≤ Re ρ ≤ 1`,
`‖ρ − 2‖² ≤ 4 + (Im ρ)² ≤ 4(1 + (Im ρ)²)`, and comparison (`Summable.of_nonneg_of_le`) concludes.

*Needs:* 5.3, 3.1, 1.5, 4.2; Layer 0 *entireCompletion*; Mathlib `Summable.of_nonneg_of_le`;
Tau Ceti `TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.eventuallyEq`
(L-functions Layer 0, `NumberTheory/LFunctions/Data/Basic.lean`); L-functions Layers 3 and 5 (the
Euler products).

**Checks.**

- `s ↦ 1/Γ(s + 1/2)` has `OrderLE _ 1`, value `π^{−1/2}` at `0` and simple zeros at
  `−1/2, −3/2, …`, so `∑ ‖ρ‖^{−2}` converges by 5.3 while every summand `1/(1 + (Im ρ)²)` is `1`:
  confinement is what turns the `‖ρ‖` form of 5.3 into the ordinate form.
- Summing over the zeros of `riemannZeta` instead of `completedRiemannZeta` adds the trivial zeros
  `−2, −4, …`, each of ordinate `0` and summand `1`, and the family is not summable.
- The first zeros of `ζ`, at ordinates `±14.1347…`, contribute `2/(1 + 14.1347²) ≈ 0.00996`. The
  weight `1/(Im ρ)²` would also converge for `ζ`, but is undefined at a real zero, which no theorem
  here excludes for a real character (6.3).

### Examples

- `f s = exp (c s)`: `b = c`, `a = 0`, empty product.
- `f s = 1 − s`: `a = 0`, `b = −1`, `1 − s = exp(−s) E₁(s)`.
- `zetaEntireCompletion`, with `zetaEntireCompletion 0 = 1` and `Re b = −∑ Re (1/ρ)`.

### Dependencies

Mathlib infinite products, `Complex.borelCaratheodory`, `is_const_of_deriv_eq_zero`,
`Complex.exp_eq_exp_iff_exists_int`. Tau Ceti `TauCeti.exists_differentiableOn_eqOn_exp_comp` (5.4).
Layer 0 `OrderLE`, Layer 4.3; 5.6 additionally Layers 1.5, 3.1, 4.4 and 5.6a, Layer 0
*entireCompletion* and L-functions Layers 0, 3, 5 and 7;
5.6a additionally Layers 1.5 and 4.2, Layer 0 *entireCompletion* and L-functions Layer 0.

## Layer 6: zero-free regions

Each statement names its family: the argument needs the Euler product, nonnegativity of the von
Mangoldt coefficients and the `3-4-1` inequality, none of which a general record has.

### 6.1 Quantitative 3-4-1

For `σ > 1` and three ray-class characters `1, χ, χ²` presented at the same modulus `𝔣`,
`3 (−logDeriv L₁)(σ) + 4 Re (−logDeriv L_χ)(σ + it) + Re (−logDeriv L_{χ²})(σ + 2it) ≥ 0`, with
`L_ψ = heckeLFunctionC ψ`: on `Re s > 1` each negative logarithmic derivative `−logDeriv L_ψ` is
`∑_𝔞 Λ_K(𝔞) ψ(𝔞) 𝔑𝔞^{−s}` over the ideals prime to `𝔣`. The term of the combination at such an
`𝔞` is `Λ_K(𝔞) 𝔑𝔞^{−σ} (3 + 4 Re z + Re (z²))` with `z = χ(𝔞) 𝔑𝔞^{−it}`, `‖z‖ = 1`, since the
`χ²` term carries `χ(𝔞)² 𝔑𝔞^{−2it} = z²`; it is nonnegative by
`TauCeti.LSeries.threeFourOneCombination_nonneg` at that `z` and
`TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg` with `vonMangoldt_im`. All three series are
presented at `𝔣` so that the Euler products run over the same primes. It is a statement about
convergent series on `Re s > 1` only.
The series identity is the degree-one case of Arithmetic Dirichlet Series §2.3 for the weight of
`ψ`, the indicator of the ideals prime to `𝔣` when `ψ = 1`, and not the Dedekind identity
`TauCeti.hasSum_idealTerm_vonMangoldt`: over `ℚ` the trivial character presented at `(3)∞` has
`L₁ = (1 − 3^{−s}) ζ`, whose negative logarithmic derivative lacks the term
`log 3 · 3^{−s}/(1 − 3^{−s})` of `−ζ'/ζ`.

*Needs:* L-functions Layer 5 `heckeLFunctionC_eq` (the series on `Re s > 1`) for Tau Ceti
`TauCeti.LFunctions.heckeLFunctionC`; Tau Ceti `TauCeti.LSeries.threeFourOneCombination_nonneg`,
`TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg` and
`TauCeti.IdealArithmeticFunction.vonMangoldt_im` (L-functions Layers 7–8); Arithmetic Dirichlet
Series §2.3, at the pin
`TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` (the
logarithmic derivative of the series of a completely multiplicative weight, strictly right of its
abscissa of absolute convergence) and
`TauCeti.MultiplicativeIdealWeight.vonMangoldtTransform_apply_prime_pow` (the coefficient
`ψ(𝔭)^k log 𝔑𝔭` at `𝔭^k`), applied to
`TauCeti.GlobalNumberFields.RayClassCharacter.toMultiplicativeIdealWeight`, with
`TauCeti.idealAbscissaOfAbsConv_lt_re_of_bounded` for the abscissa on `Re s > 1`.

### 6.2 The region for the Dedekind zeta function

There is `c > 0`, depending only on `n = [K:ℚ]`, such that `ζ_K` has at most one zero `ρ` with
`Re ρ ≥ 1 − c/log analyticConductorAt d (i Im ρ)`, and such a zero is real and simple (Kadiri,
Theorem 1.1, gives explicit regions for `|Im s| ≥ 1` and `|Im s| ≤ 1` when `d_K` is large; the
passage to all fields of degree `n` is 6.4e). It is the trivial-character case of 6.4: at the unit
`1 : TauCeti.LFunctions.PrimitiveRayClassCharacter K`, of conductor `1`, whose `heckeLFunctionC` is
the continued Dedekind zeta function, `heckeLFunction_zeroFreeRegion` states it. At `K = ℚ` this is
`riemannZeta_zeroFreeRegion`, where no exceptional zero occurs because `ζ` has no real zero in
`(0, 1)`.

Define the **region constant** *heckeZeroFreeConstant* `n` as the minimum of the constant chosen
from 6.4 and `log 3/2`.

- `0 < heckeZeroFreeConstant n`.
- `heckeZeroFreeConstant n ≤ log 3/2`.
- The conclusion of 6.4 holds at *heckeZeroFreeConstant* `n`, because shrinking `c` shrinks the
  region and both branches of the disjunction pass to a subregion.

*Needs:* 6.4.

**Checks.**

- At `n = 1`, `q(χ, 0) ≥ 3` (each archimedean factor is at least `3`), so the cap gives
  `c/log q(χ, 0) ≤ 1/2` and the whole region lies in `Re s ≥ 1/2`.
- The principal character modulo `2` has `L(s) = (1 − 2^{−s}) ζ(s)`, which vanishes at `s = 0`
  through the deleted Euler factor. Its primitive source is `ζ`, with `q(1, 0) = 3`, so an uncapped
  constant with `c/log 3 ≥ 1` would put `0` in the region at that conductor, which is the region
  of 6.3 and of the comparison of 6.4b, and break that comparison: `0` would be a zero of the
  presented function in the range of 6.3 but a pole, not a zero, of the completed `ζ`. In the
  modulus coordinate of the Dirichlet statement of 6.4, `q (|Im ρ| + 3) = 6` at `ρ = 0`, so there
  `0` enters the region only at `c ≥ log 6`.
- `riemannZeta_zeroFreeRegion` and `dirichletLFunction_zeroFreeRegion` at `χ = 1` agree: the
  trivial character modulo `1` has no zero in the region.

### 6.3 The exceptional zero

Define *IsExceptionalZero* `χ β`, for a primitive character `χ` (the trivial one included) and
`β : ℝ`, as `1 − c/log q(χ, 0) ≤ β`, `β < 1` and `0 < divisor Λ(χ, ·) univ β`, with
`c = heckeZeroFreeConstant [K:ℚ]`: a real zero of the completed function lying in the region.

- At most one `β` satisfies it, with multiplicity `1`, and only for a real character (`χ² = 1`).
- Every exceptional zero has `1/2 ≤ β`, by the cap.
- For `ψ` presented at any modulus, *IsExceptionalZero* `(PrimitiveRayClassCharacter.of ψ) β` holds
  iff `β` lies in that range and is a zero of `heckeLFunctionC ψ`, since the deleted Euler factors
  vanish only on `Re s = 0` (6.4b).
- `{β | IsExceptionalZero χ β}` is a subsingleton; no total `exceptionalZero : ℝ` is defined.

*Needs:* 6.2, 6.4; L-functions Layer 5.

**Checks.**

- For `ζ` the set is empty, since `ζ` has no zero in `(0, 1)`.
- For a non-real character the set is empty by the reality clause.
- A definition with `β < 1 − c/log q` (outside the region) would describe every real zero in
  `(1/2, 1)` below the region, which no theorem here controls.

### 6.4 The region for Hecke L-functions

For `χ` a primitive finite-order ray-class character of conductor `𝔣`: if `χ` is not real,
`L(χ, ·)` has no zero in the region; if `χ` is real it has at most one, real and simple. The constant
depends on `n = [K:ℚ]` alone and is chosen before `K` and `χ`. At `K = ℚ` its case `n = 1`
gives `dirichletLFunction_zeroFreeRegion`, which also covers imprimitive characters (the
paragraph after (4f)). For every `K` it is `heckeLFunction_zeroFreeRegion`, stated
for `χ : TauCeti.LFunctions.PrimitiveRayClassCharacter K` on the function
`TauCeti.LFunctions.heckeLFunctionC χ.character` and in the coordinate
`|d_K| 𝔑𝔣 (|Im ρ| + 3)^n`. Each of the `n` archimedean factors
of `analyticConductorAt d (i Im ρ)` lies between `|Im ρ| + 3` and `|Im ρ| + 4`, so the two
logarithms differ by at most `n log (4/3)`, which is at most `(log (4/3)/log 3)` times
`log (|d_K| 𝔑𝔣 (|Im ρ| + 3)^n) ≥ n log 3`; the two regions therefore nest after multiplying `c` by
`1 + log (4/3)/log 3 < 1.27`. For every `K` and every Hecke character, with an absolute
constant `R₄` and the conductor entering through `A(χ) = |d_K| 𝔑𝔣`, the region
`Re s > 1 − 1/(R₄ (log A(χ) + n log (|Im s| + 2)))` with at most one zero is
Lagarias–Montgomery–Odlyzko, Lemma 2.3 (cited by locator; Kadiri §1, (1.5)–(1.6), reports it).
For `0 < c < 1/R₄` their region contains this one, since the archimedean factors of
`analyticConductorAt d (iγ)` are `n` in number, each at least `|γ| + 3` because the shifts of a
finite-order character are real, so that
`log analyticConductorAt d (iγ) ≥ log A(χ) + n log (|γ| + 2)`. That a zero in the region is real
and simple and occurs only for a real character is proved here, by (4c) and (4f). The route
assembles the statement from six targets.

- **(4a)** 6.1.
- **(4b) Imprimitive characters.** Consume `heckeLFunctionC_eq_primitive`: a character `ψ`
  presented at a modulus `𝔫` has the series of its primitive source
  `PrimitiveRayClassCharacter.of ψ` times `eulerCorrection`, the Euler factors at the primes
  dividing `𝔫` but not the conductor of that source. The zeros of `eulerCorrection` lie on
  `Re s = 0`, since `1 − w 𝔑𝔭^{−s} = 0` with `‖w‖ = 1` forces `𝔑𝔭^{−Re s} = 1`. For `Re s > 1`,
  `‖logDeriv eulerCorrection s‖ ≤ log 𝔑𝔫`, where `𝔑𝔫` is the absolute norm of the finite part of
  the presentation modulus: a deleted factor at `𝔭` contributes at most
  `log 𝔑𝔭 · 𝔑𝔭^{−σ}/(1 − 𝔑𝔭^{−σ}) = log 𝔑𝔭/(𝔑𝔭^σ − 1) < log 𝔑𝔭`, and the sum of `log 𝔑𝔭` over
  the distinct primes dividing `𝔫` is at most `log 𝔑𝔫`. In 6.4 the three characters of 6.1 are
  presented at the conductor `𝔣` of `χ`, where the bound reads `log 𝔑𝔣`. No bound in the conductor
  of the primitive source holds: over `ℚ` the trivial character presented at `(2)` has source
  conductor `1`, so such a bound would be `0`, while its deleted factor `1 − 2^{−s}` has
  logarithmic derivative `(log 2)/3 ≈ 0.2310` at `s = 2` (and tends to `log 2` as `s → 1⁺`). For
  the trivial character the presented series is `dedekindZetaC K` times `finiteEulerCorrection`.
- **(4c) The real and non-real split.** `χ` is real iff `χ² = 1` iff `χ⁻¹ = χ`, the inverse of
  `TauCeti.LFunctions.PrimitiveRayClassCharacter`. If `χ² ≠ 1` the third term of 6.1 is regular at `1`; if
  `χ² = 1` it carries the pole of `ζ_K`, which confines a surviving zero to the real axis.
- **(4d) Conductor dependence.** For a nontrivial primitive `χ` and `1 < σ ≤ 2`,
  `−Re (logDeriv L_χ)(σ + it) ≤ ½ log analyticConductorAt d (it) + O(1) − ∑_ρ Re (1/(σ + it − ρ))`,
  the sum over the zeros of `Λ(χ, ·)` with multiplicity, each summand positive by 5.6; and for the
  trivial character, with `d = dedekindZetaData K` and at every height `t`,
  `−Re (logDeriv ζ_K)(σ + it) ≤ Re (1/(σ − 1 + it)) + ½ log analyticConductorAt d (it) + O(1)
  − ∑_ρ Re (1/(σ + it − ρ))`, which at `t = 0` reads
  `−(logDeriv ζ_K)(σ) ≤ 1/(σ − 1) + ½ log |d_K| + O(1) − ∑_ρ Re (1/(σ − ρ))`, since
  `analyticConductorAt d 0 = 3^{r₁} 12^{r₂} |d_K|`. The constants depend on `n` alone. The identity
  behind both is the partial-fraction expansion of `Λ'/Λ`, with the terms `½ log N`, the gamma
  logarithmic derivative, the sum over zeros, and, for the trivial character only, the pole terms
  `1/s + 1/(s − 1)` (Kadiri §2.1.2); at height `t` the term `1/(s − 1)` is kept, `Re (1/s) < 1` is
  absorbed, and 1.4 bounds the real part of the gamma term by
  `½ log (analyticConductorAt d (it)/N) + O(1)`, half the logarithm of the archimedean factors
  alone, so that together with `½ log N` it gives `½ log analyticConductorAt d (it) + O(1)`; a
  bound by `½ log analyticConductorAt d (it)` for the gamma term alone would count `N` twice. For
  the `ζ` record (`N = 1`, `gammaR = {0}`) the gamma term at `s = 2` is
  `(digamma 1)/2 − (log π)/2 = −γ_E/2 − (log π)/2 ≈ −0.8610`, below `½ log 3 ≈ 0.5493`, and at
  `s = σ + it` its gap to `½ log (|t| + 3)` tends to `½ log 2π ≈ 0.9189` as `|t| → ∞`.
  The first bound fails at the
  trivial character: at `K = ℚ`, `t = 0`, `σ = 1 + u`, the left side is `1/u + O(1)` while the
  right side stays bounded as `u → 0⁺`. Both bounds use `Re b(χ) = −∑_ρ Re (1/ρ)`, which is 5.6
  for every `χ`, real or not. The
  discriminant term in the `ζ_K` bound is needed, and the witness chooses `σ` before the field.
  Without that term the bound would give `−(logDeriv ζ_K)(σ) ≤ 1/(σ − 1) + C` for every quadratic
  `K` and `1 < σ ≤ 2`, with `C` absolute, because the subtracted zero terms are positive. Since
  `−(ζ'/ζ)(σ) = 1/(σ − 1) − γ_E + O(σ − 1)` as `σ → 1⁺`, first fix `σ ∈ (1, 2]` with
  `2(−ζ'/ζ)(σ) > 1/(σ − 1) + C + 1`; then fix `B` with `2 ∑_{p^j > B} log p · p^{−jσ} < 1`; then
  take `K = ℚ(√D)` with `D` a prime `≡ 1 (mod 8 ∏_{p ≤ B} p)` (Dirichlet), so that `d_K = D`
  and every `p ≤ B` splits. Every term of `−(logDeriv ζ_K)(σ) = ∑_𝔞 Λ_K(𝔞) 𝔑𝔞^{−σ}` is
  nonnegative, and a split `p` contributes `2 log p · p^{−jσ}` at norm `p^j` (from `𝔭^j` and `𝔭'^j`), so
  `−(logDeriv ζ_K)(σ) ≥ 2 ∑_{p^j ≤ B} log p · p^{−jσ} > 1/(σ − 1) + C`. No single field is a
  witness: for fixed `D`, `ζ_K = ζ · L(·, χ_D)` with `χ_D` the quadratic character of `K` and
  `L(1, χ_D) ≠ 0`, so `−(logDeriv ζ_K)(σ) = 1/(σ − 1) + O_D(1)` as `σ → 1⁺`.

  *Off the real axis.* For every `t₀ > 1` there is `C`, depending on `n` and `t₀` alone, such that
  for `0 < δ ≤ 1` and `|t| ≥ t₀`: `−Re (logDeriv ζ_K)(1 + δ + 2it) ≤ ½ log |d_K| + C log |t|`;
  and, at a zero `β + it` of `Λ_K` of multiplicity `m`,
  `−Re (logDeriv ζ_K)(1 + δ + it) ≤ −m/(1 + δ − β) + ½ log |d_K| + C log |t|`. Route: in the
  trivial-character bound drop every zero term, or every one except the `m` at `β + it`, each equal
  to `1/(1 + δ − β)`; at height `u ∈ {t, 2t}` bound the pole term `Re (1/(δ + iu)) ≤ 1/(2|u|)` by
  `1/(2t₀)` and `analyticConductorAt d (iu)` by `C₂ |d_K| (|u| + 3)^n` (2.2), and absorb the
  constants into `C log |t|`, as `log |t| ≥ log t₀ > 0`. For `δ ≥ 1` both left sides are at most
  `n (−ζ'/ζ)(2)`, comparing Dirichlet series termwise, so with `m` replaced by `1` both bounds hold
  for every `δ > 0` after enlarging `C`. At `K = ℚ` these are the two inputs of the 3-4-1 argument
  at height `t` (Davenport §13): `−Re (ζ'/ζ)(1 + δ + 2it) ≤ C log |t|`, and
  `−Re (ζ'/ζ)(1 + δ + it) ≤ −1/(1 + δ − β) + C log |t|` at a zero `β + it` of `ζ`; this is
  `neg_re_logDeriv_riemannZeta_le`. The threshold is needed: as `t → 0` with `δ = 2|t|`,
  `−Re (ζ'/ζ)(1 + δ + 2it) = 1/(4|t|) + O(1)`, while `log |t| → −∞`.
- **(4e) Small conductors.** For fixed `n` and any `X` there are finitely many pairs `(K, χ)` with
  `[K:ℚ] = n` and `|d_K| 𝔑𝔣 ≤ X` (Hermite–Minkowski, finitely many moduli of bounded norm, and
  `TauCeti.GlobalNumberFields.finite_rayClassGroup`); the residual cases are closed by 6.5 and
  discreteness of the zeros, and `c` is the minimum of finitely many constants.
- **(4f) Uniqueness and simplicity.** For real `χ`, the argument bounds the sum of `Re (1/(σ − ρ))`
  over the zeros in the region with multiplicity, using nonnegativity of `Λ_K(𝔞)(1 + χ(𝔞))`; two
  zeros and one double zero are refuted by the same inequality. This is per character.

**At `K = ℚ`, every Dirichlet character.** `dirichletLFunction_zeroFreeRegion` is stated on
Mathlib's `DirichletCharacter.LFunction χ` for every character `χ` modulo `q ≥ 1`, primitive or
not, in the coordinate `q (|Im ρ| + 3)` with the modulus `q` in place of the conductor, and with
`0 < c ≤ log 3/2`: the constant of the case `n = 1`, capped as in 6.2. For primitive `χ` it is the
case `n = 1` of the statement above. `TauCeti.GlobalNumberFields.ratDirichletEquiv` identifies `χ`
with a ray-class character of `(q)∞` whose conductor has finite part of absolute norm `q`
(`TauCeti.GlobalNumberFields.RayClassCharacter.absNorm_conductor_finitePart`) and whose value at an
ideal `(m)` prime to `q` is `χ(m)` (`TauCeti.GlobalNumberFields.onIdeals_ratDirichletEquiv_symm`).
So the series of its primitive source and of `χ` agree on `Re s > 1`, the two continuations have
the same punctured germ at every point (`TauCeti.meromorphicContinuation_eqOn`,
`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`), and `|d_ℚ| = 1`. An imprimitive `χ` is
the change of level of its primitive source `χ* = χ.primitiveCharacter`, of conductor `q* ∣ q`
(`DirichletCharacter.changeLevel_primitiveCharacter`), and `DirichletCharacter.LFunction_changeLevel`
gives `L(s, χ) = L(s, χ*) ∏_{p ∣ q} (1 − χ*(p) p^{−s})` for `s ≠ 1`, the Dirichlet form of (4b).
Three facts carry the region from `χ*` to `χ`:

- the factors vanish only on `Re s = 0`: a factor with `χ*(p) = 0` is `1`, and otherwise
  `‖χ*(p)‖ = 1`, so `χ*(p) p^{−s} = 1` forces `p^{−Re s} = 1`;
- the cap gives `c/log (q (|t| + 3)) ≤ (log 3/2)/log 3 = 1/2`, so the region lies in
  `Re s ≥ 1/2`, where the product is analytic and nonzero and `L(·, χ)` and `L(·, χ*)` have the
  same order at every point;
- `q* ≤ q` gives `log (q* (|t| + 3)) ≤ log (q (|t| + 3))`, so the region at `q` lies inside the
  region at `q*`.

The reality clause transfers because `χ²` is the change of level of `χ*²`, which is `1` exactly
when `χ*² = 1` (`DirichletCharacter.changeLevel_eq_one_iff`); uniqueness transfers because two
zeros of `L(·, χ)` in the region at `q` are zeros of `L(·, χ*)` in the region at `q*`.

*Needs:* 6.1; 5.6; 1.4, 2.2; Layer 4; Tau Ceti `TauCeti.LFunctions.heckeLFunctionC_eq_primitive`,
`TauCeti.GlobalNumberFields.RayClassCharacter.eulerCorrection`,
`TauCeti.LFunctions.finiteEulerCorrection` and the inverse `χ⁻¹` of
`TauCeti.LFunctions.PrimitiveRayClassCharacter` (L-functions Layer 5); L-functions Layers 5 and 7
`completedHeckeLFunction_one_sub`, `norm_heckeRootNumber`; Global Number Fields Layer 2
`TauCeti.GlobalNumberFields.finite_rayClassGroup`. At `K = ℚ`: Tau Ceti
`TauCeti.GlobalNumberFields.ratDirichletEquiv`, `TauCeti.GlobalNumberFields.onIdeals_ratDirichletEquiv_symm`,
`TauCeti.GlobalNumberFields.RayClassCharacter.absNorm_conductor_finitePart`,
`TauCeti.meromorphicContinuation_eqOn`, `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`;
Mathlib `DirichletCharacter.LFunction_changeLevel`, `DirichletCharacter.changeLevel_primitiveCharacter`,
`DirichletCharacter.changeLevel_eq_one_iff`.

**Checks.**

- The principal character modulo `2`: `L(s, χ) = (1 − 2^{−s}) ζ(s)`, whose extra zeros
  `2πik/log 2` lie on `Re s = 0`. Its region lies in `Re s ≥ 1 − (log 3/2)/log 6 ≈ 0.6934` and
  inside the region of `ζ` at `q* = 1`, where `ζ` has no zero, so the statement holds for it
  through the transfer.
- The principal character modulo `6`: `L(s, χ) = (1 − 2^{−s})(1 − 3^{−s}) ζ(s)` has a double zero
  at `s = 0`, which lies in the region at `q = 6` as soon as `c ≥ log 18 ≈ 2.890`; without a cap
  on `c` the simplicity clause fails for imprimitive characters, while `log 3/2 < log 18`.
- The character modulo `6` induced from the one modulo `3`: the deleted factor at `2` is
  `1 + 2^{−s}`, since that character takes `−1` at `2`, and its zeros `iπ(2k + 1)/log 2` are not
  real; the smallest in absolute value, at height `π/log 2 ≈ 4.532`, enters the region at `q = 6`
  once `c ≥ log 45.19 ≈ 3.811`, where the reality clause would fail.
- The discriminant term of the `ζ_K` bound of (4d), at `σ = 1.1`: `−(ζ'/ζ)(1.1) ≈ 9.4410`, so
  `2(−ζ'/ζ)(1.1) − 1/(σ − 1) ≈ 8.882`, and at `B = 10⁶` the sum `2 ∑_{p^j ≤ B} log p · p^{−1.1 j}`
  is `≈ 13.858`. Every prime `D ≡ 1 (mod 8 ∏_{p ≤ 10⁶} p)` therefore gives
  `−(logDeriv ζ_K)(1.1) > 10 + 3.85` for `K = ℚ(√D)`, which refutes a bound without `½ log |d_K|`
  for every constant `C < 3.85`, while it leaves `1/(σ − 1) + ½ log |d_K| + O(1)` (the bound with
  its zero terms dropped) untouched, since `½ log D > ½ ϑ(10⁶) ≈ 4.99 · 10⁵`. At `B = 10` the
  least such prime is `3361`: `3361 ≡ 1 (mod 8)` and `(3361/p) = 1` for `p = 3, 5, 7`.

### 6.5 The edges

For `Λ` either `Λ_K` or `Λ(χ, ·)`, `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 1`, and by the functional
equation `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 0`. The first is `heckeLFunction_ne_zero_of_one_le_re`
read through the order for nontrivial primitive characters only. For the trivial character use
`meromorphicOrderAt_dedekindZetaC_one_add` at `1+it`, `t ≠ 0`, and
`meromorphicOrderAt_dedekindZetaC_one` at `t = 0`: the orders are respectively `0` and `−1`,
neither positive. The gamma factors are regular and nonzero on `Re s = 1` for these families;
transport to `Re s = 0` uses the germ functional equation, including the trivial character.
At `K = ℚ`, `riemannZeta_ne_zero_of_one_le_re` supplies the off-pole case.

*Needs:* L-functions Layer 7 `heckeLFunction_ne_zero_of_one_le_re`,
`meromorphicOrderAt_dedekindZetaC_one_add`; Layer 3 `meromorphicOrderAt_dedekindZetaC_one`;
Layer 5 `completedHeckeLFunction_one_sub_eventuallyEq`; 1.5–1.6.

**Checks.**

- For the trivial character at `s = 1`, `ord Λ = −1`; the positive-divisor premise is false.
- For `ζ` at `1+2i`, the order is `0`; reflection gives order `0` at `−2i`.
- For the odd primitive character modulo `4`, `L(1,χ) = π/4` and `Gammaℝ(2) = 1/π`, so
  its completion at `1` is `2 · (1/π) · (π/4) = 1/2`, of order `0`.

### Examples

- `riemannZeta_zeroFreeRegion`: `ζ(s) ≠ 0` for `Re s ≥ 1 − c/log(|Im s| + 3)`, `s ≠ 1`.
- `dirichletLFunction_zeroFreeRegion`, for every character modulo `q`, primitive or not, with the
  exceptional zero allowed for real characters and the cap `c ≤ log 3/2`.
- For a real character neither branch of the disjunction follows from the other targets.

### Dependencies

L-functions Layers 3, 5, 7, 8, of which Tau Ceti realizes the primitive characters, presented
Hecke L-functions and Euler corrections of Layer 5 and the `3-4-1` combination and von Mangoldt
positivity of Layers 7–8 (`TauCeti.LSeries.threeFourOneCombination_nonneg`,
`TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg`, for 6.1). Layers 1.4–1.6, 2, 4, 5.6. Global Number
Fields Layer 2 ray-class finiteness. Arithmetic Dirichlet Series §2.3 (the logarithmic derivative of the series of a
ray-class character's weight, for 6.1).

## Layer 7: the Riemann–von Mangoldt formula

Layer 4 gives inequalities; the exact count needs the argument principle, which Tau Ceti proves for
a closed piecewise-`C¹` null-homologous curve (`TauCeti.Contour.argumentPrinciple_nullHomologous`,
an ordinary interval integral with no principal value). This layer builds the rectangle on top of
it.

### 7.1 The rectangle as a contour

For a valid rectangle `R = Icc σ₁ σ₂ ×ℂ Icc t₁ t₂`, define *rectBoundary* `R : ℝ → ℂ` on `[0, 4]`,
traversing the four edges counterclockwise with breakpoints `1, 2, 3`.

- `TauCeti.IsPiecewiseC1On (rectBoundary R) 0 4` and `rectBoundary R 0 = rectBoundary R 4`.
- Its image is the topological boundary `∂R` when `R` is nondegenerate (`σ₁ < σ₂`, `t₁ < t₂`).
- `TauCeti.Contour.windingNumber (rectBoundary R) 0 4 z = 1` for `z` in the interior of `R`, and
  `0` for `z ∉ R`.
- `TauCeti.Contour.IsNullHomologous (rectBoundary R) 0 4 U` for every open `U ⊇ R`, since `R` is
  convex.

*Needs:* Tau Ceti `TauCeti.IsPiecewiseC1On`, `TauCeti.Contour.windingNumber`,
`TauCeti.Contour.IsNullHomologous`.

**Checks.**

- For `R = Icc 0 1 ×ℂ Icc 0 1` the winding number about `1/2 + i/2` is `1` and about `2` is `0`; a
  clockwise parametrization gives `−1`.
- For a degenerate `R` with `σ₁ = σ₂` the curve is a segment traversed twice, still closed and
  piecewise `C¹` (constant edges are `C¹`), with winding number `0` off it and empty interior.
- `rectBoundary R 1 = σ₂ + i t₁`: the first edge is the bottom edge from `σ₁ + i t₁`.

### 7.2 The argument principle on a rectangle

For an open `U`, a valid closed rectangle `R ⊆ U`, a finite `S ⊆ U` disjoint from `∂R`, and `f` with
`AnalyticAt ℂ f z ∧ f z ≠ 0` at every `z ∈ U \ S` and `MeromorphicAt f s` at every `s ∈ S`:
`(2πi)⁻¹ ∫_0^4 (rectBoundary R)' · (f'/f)(rectBoundary R) = ∑_{s ∈ S} windingNumber s · ord_s f`,
which is `TauCeti.Contour.argumentPrinciple_nullHomologous`, and the winding numbers of 7.1 collapse
the right side to `∑_{s ∈ S ∩ R} ord_s f`. The sum over all of `S` is false: for `U = ℂ`,
`R = Icc (−1) 1 ×ℂ Icc (−1) 1`, `f z = z − 2` and `S = {2}` every hypothesis holds, the integral is
`0` and `ord_2 f = 1`.

The divisor form: for `f` meromorphic on `U` with `∀ z ∈ U, 0 ≤ meromorphicOrderAt f z →
AnalyticAt ℂ f z` (the canonical-representative condition, which L-functions records satisfy by
`HasMeromorphicContinuation.analyticAt` and *entireCompletion* and *continuedL* inherit), and a valid rectangle `R ⊆ U` with
`meromorphicOrderAt f z = 0` on `∂R`, the normalized integral equals *divisorCount* `f U R`. Its
hypotheses are local: apply the first form on a connected relatively compact open neighbourhood
`V` of `R` with `closure V ⊆ U`; finite order on `closure V` follows from a boundary point of order
`0` and `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`; then
`S = {z ∈ V | meromorphicOrderAt f z ≠ 0}` is finite and `divisor f V = divisor f U` on `V`.

*Needs:* 7.1; Tau Ceti `TauCeti.Contour.argumentPrinciple_nullHomologous`,
`TauCeti.Contour.residue_logDeriv_eq_meromorphicOrderAt`; Mathlib
`MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`; Layer 4.1.

**Checks.**

- `f z = z`, `S = {0}`, `R = Icc (−1) 1 ×ℂ Icc (−1) 1`: both sides are `1`.
- `f z = z − 2`, `S = {2}`, same `R`: both sides are `0`.
- `f z = 1/z`, `S = {0}`: the integral is `−1`, the signed count, while `zeroCount` is `0`.
- The function equal to `1` near `∂R` except for the value `0` at one boundary point has order `0`
  on `∂R` and is not analytic there; the pointwise form does not apply to it, and the divisor form
  excludes it through the canonical-representative condition.

### 7.3 The argument variation and S(T)

For `f` analytic and nonvanishing at every point of `∂R`, the image curve
`γ = f ∘ rectBoundary R` misses `0`, and `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`
gives a partition `0 = s 0 ≤ ⋯ ≤ s N = 4`, on each segment of which `γ t / γ (s j)` lies in the slit
plane, and a continuous `θ` with `γ t = ‖γ t‖ exp(i θ t)`: `θ t` is `arg γ 0` plus the sum over the
segments of `Im log` of the segment ratios, so `θ 0 = arg γ 0` and `θ 4 − θ 0` is the sum over `j`
of `Im log (γ (s (j + 1)) / γ (s j))`. The identification `(θ 4 − θ 0)/(2π) =` *divisorCount*
`f U R` (under the hypotheses of 7.2) has three steps.
`TauCeti.Contour.windingNumber_eq_integral_of_avoidance` writes `windingNumber γ 0 4 0` as `(2πi)⁻¹`
times the index integral `∫_0^4 γ' / γ`.
`TauCeti.Contour.integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im`, on the partition of
the lift, writes that integral as `log ‖γ 4‖ − log ‖γ 0‖` plus `i` times the same segment sum; the
curve is closed, so the log-norm term vanishes and the integral is `i (θ 4 − θ 0)`. Finally
`TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` identifies the same winding number with
`(2πi)⁻¹ ∫_0^4 (rectBoundary R)' · logDeriv f (rectBoundary R)`, which 7.2 evaluates as
*divisorCount* `f U R`. Only differences `θ b − θ a` are used.
Define *S* `(T)` as `π⁻¹` times the variation of a continuous argument of `riemannZeta` along the
path `2 → 2 + iT → 1/2 + iT`, starting from the argument `0` of the positive real `ζ(2)`, for `T`
not an ordinate.

*Needs:* 7.2; Tau Ceti `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`,
`TauCeti.Contour.windingNumber_eq_integral_of_avoidance`,
`TauCeti.Contour.integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im`,
`TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` and
`TauCeti.Contour.intervalIntegrable_deriv_smul_logDeriv` (integrability of the index integrand).

**Checks.**

- On the vertical segment from `2` to `2 + iT`, `Re ζ(2 + it) ≥ 2 − ζ(2) > 0`, so the argument
  stays in `(−π/2, π/2)` there.
- For small `T > 0` the path passes just above the pole at `1`, where `ζ(s) ≈ 1/(s − 1)`, and the
  argument decreases by nearly `π`; so *S* `(T) → −1` as `T → 0⁺`, matching
  `N(T) = θ(T)/π + 1 + S(T)` with `N(T) = 0` and `θ(0) = 0` (Titchmarsh §9.3).
- Adding `2π` to a continuous lift changes both endpoint values by `2π`, so its variation
  remains `(b + 2π) − (a + 2π) = b − a`, and *S* is unchanged. The normalized endpoint value
  equals the variation only when the initial argument is `0`; on a constant positive path
  both lifts have variation `0`.
- `f z = z`, `R = Icc (−1) 1 ×ℂ Icc (−1) 1`: the image curve starts at `rectBoundary R 0 = −1 − i`,
  so `θ 0 = −3π/4` and `θ 4 = 5π/4`; the variation `2π` gives `1`, which is *divisorCount* and the
  winding number about `0`, while the endpoint value `θ 4/(2π) = 5/8` is not even an integer. For
  `f z = z − 2` the image curve winds around `−2`, not `0`, and the variation is `0`, as is the
  count.

### 7.4 Riemann–von Mangoldt for ζ, and boundary heights

`N(T) = (T/2π) log (T/(2πe)) + O(log T)` for every `T ≥ 2`: `riemannVonMangoldt` (Titchmarsh,
§§9.2–9.4, Theorem 9.4). Route: 7.2 on `Icc (−1) 2 ×ℂ Icc 0 T` applied to `zetaEntireCompletion`
(the poles of `Λ` lie on the bottom edge), 4.2 to pass back to `Λ`, confinement of the zeros to the
critical strip, the main term from 1.5 and the error from 3.4 and 7.3. Confinement is the first
clause of 5.6a; for `ζ` it also follows directly: `riemannZeta_ne_zero_of_one_le_re`,
`riemannZeta_def_of_ne_zero` and `Complex.Gammaℝ_ne_zero_of_re_pos` give `Λ(s) ≠ 0` for
`Re s ≥ 1`, `s ≠ 1`, hence order `0` there since `Λ` is analytic off `0, 1`
(`differentiableAt_completedZeta`), and `completedRiemannZeta_one_sub` carries this to `Re s ≤ 0`,
`s ≠ 0`, so the rectangle `Icc (−1) 2 ×ℂ Icc 0 T` and the strip `Icc 0 1 ×ℂ Icc 0 T` contain the
same zeros.
For `T` the ordinate of a zero, the formula follows from the case of non-ordinates by
right-continuity of `N` (4.5) and discreteness of the ordinates, the main term moving by
`O(η log T)` over an interval of length `η`.

*Needs:* 7.2, 7.3, 1.5, 3.4, 4.2, 4.5, 6.5; for confinement, 5.6a or Mathlib
`riemannZeta_ne_zero_of_one_le_re`, `riemannZeta_def_of_ne_zero`,
`Complex.Gammaℝ_ne_zero_of_re_pos`, `differentiableAt_completedZeta` and
`completedRiemannZeta_one_sub`.

### 7.5 Uniformity in the conductor

For `Λ_K` of degree `n`,
`N±_K(T) = (T/π) log(|d_K| (T/(2πe))^n) + O(log(|d_K| T^n))` for `T ≥ 2`, with the implied constant
depending only on `n` and chosen before `K`; and for `Λ(χ, ·)` the same with `|d_K| 𝔑𝔣` in place of
`|d_K|`. The one-sided form halves the whole main term, `(T/2π) log(|d_K|(T/(2πe))^n)`; halving
inside the logarithm (`|d_K|^{1/2}`) is false. The degree-one instance for a primitive Dirichlet
character modulo `q`, uniform in `q`, is `riemannVonMangoldt_dirichlet` (Bennett–Martin–O'Bryant–
Rechnitzer, Corollary 1.2, for conductor `q > 1` and `T ≥ 5/7`, with absolute constants; Davenport
§16). The Dedekind case, uniform over the fields of degree `n` with explicit constants for `T ≥ 1`,
is Hasanalizade–Shen–Wong, Corollary 1.2. Trudgian, Theorems 1 and 2, state both counts earlier,
but his proof treats one of the inequalities on its parameters as redundant when it is not, and is
incomplete (Bennett–Martin–O'Bryant–Rechnitzer §1; Hasanalizade–Shen–Wong §1). The Hecke case over
a general `K` is the argument of 7.4 run on *entireCompletion*, with 4.4–4.5 for the error.

For every `K` and every primitive `χ` the count is `riemannVonMangoldt_heckeLFunction`, stated on
`TauCeti.LFunctions.heckeLFunctionC χ.character` over the open strip `Ioo 0 1 ×ℂ Icc (−T) T`. There
its zeros are those of `Λ(χ, ·)` with the same multiplicities, since the gamma factor and
`(|d_K| 𝔑𝔣)^{s/2}` have neither zeros nor poles on `Re s > 0`, and `Λ(χ, ·)` has no zero on
`Re s = 0` or `Re s = 1` (6.5); so the open-strip count is `N±(T, χ)`, and the open strip leaves
out the trivial zero of `L(χ, ·)` at `0`. At `χ = 1` it is the count `N±_K(T)` for `Λ_K`.

A generic-record form needs Dirichlet agreement, the average coefficient bound and confinement of
the zeros of the entire completion to the closed strip, besides continuation, functional equation
and growth: the record with completed function `1`, `gammaR = {0}` and empty polar divisor has no
zeros and a main term of order `T log T`, and is rejected only by Dirichlet agreement; the record
`ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` of conductor `4` has its extra zeros on `Re s ≈ 2.19` and
`Re s ≈ −1.19`, and is rejected only by confinement. For the two families confinement is the first
clause of 5.6a.

*Needs:* 7.4, 4.4, 4.5, 1.5, 2.2, 5.6a, 6.5; L-functions Layers 3, 5; for the statement, Tau Ceti
`TauCeti.LFunctions.heckeLFunctionC` and `TauCeti.LFunctions.PrimitiveRayClassCharacter`.

### 7.6 Corollaries

For fixed `K`: `N(T)/(T log T) → n/(2π)`; `Λ` has infinitely many zeros; and
`T⁻¹ ∫_0^T (N(t + 1) − N(t)) dt / log T → n/(2π)`. No pointwise asymptotic for `N(T + 1) − N(T)`
follows, since the error in 7.5 has the size of that difference's main term. For zeta these are
corollaries of Titchmarsh Theorem 9.4, printed p. 214; the general-field assertions are adapters
of 7.5. In the averaged statement, translating the integral gives
`∫_0^T (N(t+1)−N(t)) dt = ∫_T^(T+1) N(u) du − ∫_0^1 N(u) du`, so the leading term is
`(n/(2π)) T log T` and the fixed lower integral contributes `o(T log T)`.

*Needs:* 7.5.

### Examples

- `N(100) = 29` and `N±(100) = 58` for `ζ`, given a certificate (Layer 9).
- For `K` imaginary quadratic of discriminant `D`, 7.5 reads
  `N±_K(T) = (T/π) log(|D| (T/(2πe))²) + O(log(|D| T²))`, the sum of the `ζ` count
  `(T/π) log(T/(2πe))` and the `L(χ_D)` count `(T/π) log(|D| T/(2πe))`; the halved conductor is
  short by `(T/2π) log |D|`, unbounded in `D`.

### Dependencies

Tau Ceti contour integration. Layers 1.5, 2.2, 3.4, 4, 5.6a, 6.5. Mathlib
`riemannZeta_ne_zero_of_one_le_re`, `riemannZeta_def_of_ne_zero`,
`Complex.Gammaℝ_ne_zero_of_re_pos`, `differentiableAt_completedZeta`,
`completedRiemannZeta_one_sub`. L-functions Layers 3, 5.

## Layer 8: the explicit formula and effective prime counts

Fix `r₁, r₂` the real and complex places of `K`, `γ_K = Gammaℝ^{r₁} Gammaℂ^{r₂}`, and
`Λ_K(s) = |d_K|^{s/2} γ_K(s) ζ_K(s)`.

### 8.1 Truncated Perron, consumed

Apply Arithmetic Dirichlet Series §6.4
`truncatedPerron_LSeries` and `norm_truncatedPerron_LSeries_sub_sum_le` for `x > 0`,
`c > 0`, `T ≥ 1`, assuming absolute convergence on `Re s = c` and `x` off the norms; at `x` a norm the finite-height kernel value is
`π⁻¹ arctan(T/c)` (the Arithmetic Dirichlet Series roadmap's `truncatedPerronKernel_one`).

*Needs:* Arithmetic Dirichlet Series §§6.3–6.4 `truncatedPerronKernel_one`,
`truncatedPerron_LSeries`, `norm_truncatedPerron_LSeries_sub_sum_le`, `perronFormula`.

### 8.2 The contour shift

Move the integral of `(−ζ'_K/ζ_K)(s) x^s/s` from `Re s = c` to `Re s = −(2M + 1/2)` across the
rectangle with horizontal edges at `±iT`, and let `M → ∞`. The residues: `x` at `s = 1`;
`−m_ρ x^ρ/ρ` at each zero with `|Im ρ| ≤ T`; `c_K − (r₁ + r₂ − 1) log x` at `s = 0`, where `ζ_K`
vanishes to order `r₁ + r₂ − 1` and `c_K = lim_{s→0} ((−ζ'_K/ζ_K)(s) + (r₁ + r₂ − 1)/s)`; and
`(order) x^{−m}/m` at each trivial zero `−m`, of order `r₁ + r₂` for even `m` and `r₂` for odd `m`.
The horizontal edges are bounded by 5.6 and 1.4, with `T` chosen at distance `≫ 1/log q(iT)` from
every ordinate by 4.5 (Davenport §17).

*Needs:* 8.1, 7.2, 5.6, 1.4, 1.5, 4.5.

### 8.3 The truncated formula

With `ψ_K(x) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞)` (`TauCeti.IdealArithmeticFunction.vonMangoldt`), which is
Tau Ceti's `TauCeti.primePsi K Set.univ x` (Arithmetic Dirichlet Series §10.1), for
`2 ≤ T ≤ x` and `x` not a prime-power norm,

```text
ψ_K(x) = x − ∑_{|Im ρ| ≤ T} m_ρ x^ρ/ρ − (r₁ + r₂ − 1) log x + c_K
         − ((r₁ + r₂)/2) log(1 − x^(−2)) + (r₂/2) log((x + 1)/(x − 1))
         + O(x log x log(xT)/T),
```

`m_ρ = (divisor Λ_K univ ρ).toNat`, the constant depending on `K`. With the signed divisor the poles
at `0` and `1` would be subtracted a second time. The formula is assembled here from 8.1 and 8.2:
its main terms are the residues of 8.2, the trivial zeros at the negative even integers, each of
order `r₁ + r₂`, giving `∑_{j ≥ 1} (r₁ + r₂) x^(−2j)/(2j) = −((r₁ + r₂)/2) log(1 − x^(−2))` and
those at the negative odd integers, each of order `r₂`, giving
`∑_{m odd} r₂ x^(−m)/m = (r₂/2) log((x + 1)/(x − 1))`; its error is the truncation error of 8.1
together with the horizontal edges of 8.2. At `K = ℚ` it is `chebyshevPsi_explicitFormula`
(Davenport §17), where `T ≤ x` absorbs the near-prime-power term.

*Needs:* 8.1, 8.2; Arithmetic Dirichlet Series §2.3 `IdealArithmeticFunction.vonMangoldt` and
§10.1 `TauCeti.primePsi`, with `TauCeti.primePsi_eq_sum_range` and
`TauCeti.normCoeff_vonMangoldt`; Tau Ceti `TauCeti.hasSum_idealTerm_vonMangoldt` (L-functions
Layer 8) on the line `Re s = c > 1`.

**Checks.**

- `K = ℚ`: `r₁ = 1` and `r₂ = 0`, so the `log x` term vanishes,
  `c_ℚ = −ζ'(0)/ζ(0) = −log 2π ≈ −1.8379` from `ζ(0) = −1/2` and `ζ'(0) = −(log 2π)/2`, and the
  trivial-zero term is `−½ log(1 − x^(−2))`: the formula of `chebyshevPsi_explicitFormula`. The
  opposite sign `c_ℚ = log 2π` disagrees with Davenport §17.
- `K = ℚ(√5)`: `r₁ = 2`, `r₂ = 0`, and `ζ_K(0) = ζ(0) L(0, χ₅) = 0` with a simple zero, since
  `L(0, χ₅) = 0` for the even character `χ₅`; this matches the order `r₁ + r₂ − 1 = 1`, and
  `(−ζ'_K/ζ_K)(s) x^s/s` has a double pole at `0` with residue `c_K − log x`. A formula without the
  term `−(r₁ + r₂ − 1) log x` misses that residue.
- `K = ℚ(i)`: `r₁ = 0`, `r₂ = 1`, and `ζ_K(0) = ζ(0) L(0, χ₋₄) = (−1/2)(1/2) = −1/4 ≠ 0`,
  matching the order `0`. The trivial-zero terms sum to
  `−½ log(1 − x^(−2)) + ½ log((x + 1)/(x − 1)) = −log(1 − 1/x)`, which is `log 2 ≈ 0.6931` at
  `x = 2`: the `ζ` term plus the term `½ log((x + 1)/(x − 1))` of the zeros of `L(s, χ₋₄)` at the
  negative odd integers, as `ψ_K = ψ + ψ(·, χ₋₄)` requires.

### 8.4 The Weil formula

Fix the test class: `φ : ℝ → ℂ` with `ContDiff ℝ ∞ φ`, `HasCompactSupport φ` and
`tsupport φ ⊆ Set.Ioi 0`; `φ̃ = mellin φ`, and `φ̌ y = φ(1/y)/y`, whose transform is `φ̃(1 − s)`.
Then the family `ρ ↦ m_ρ φ̃(ρ)` over `ℂ` is summable and

```text
∑' ρ, m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (log |d_K|) φ(1) + A_K(φ) − ∑_𝔞 Λ_K(𝔞) (φ(𝔑𝔞) + φ̌(𝔑𝔞)),
A_K(φ) = (2π)⁻¹ ∫ (logDeriv γ_K)(2 + it) (φ̃(2 + it) + φ̃(−1 − it)) dt,
logDeriv γ_K = r₁ (digamma(s/2)/2 − (log π)/2) + r₂ (digamma s − log 2π),
```

with `m_ρ = (divisor Λ_K univ ρ).toNat` (Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1:
the test class satisfies Barner's conditions under `x = log y`). Route: shift
`(2πi)⁻¹ ∫_{(2)} (Λ_K'/Λ_K) φ̃` to `Re s = −1`, picking up `m_ρ φ̃(ρ)` at the zeros and `−φ̃(0)`,
`−φ̃(1)` at the poles; reflect the left integral by `Λ_K'/Λ_K(s) = −Λ_K'/Λ_K(1 − s)`; and evaluate
the prime terms by Mellin inversion `mellinInv_mellin_eq`. The supporting facts are targets: `φ̃`
is entire and decays faster than any power of `|Im s|` on vertical strips; the zero side is
absolutely summable by 4.5 against that decay, stronger than Lang's symmetric limit. The zero side
is `∑'`: the summand family has infinite support in general, and the finsum would be the junk `0`.
At `K = ℚ` this is `riemannZeta_weilExplicitFormula`.

*Needs:* 8.2, 4.5, 1.4, 1.4a (the reflection of `Λ_K'/Λ_K`); Mathlib `mellin`,
`mellinInv_mellin_eq`; L-functions Layer 3 `completedDedekindZeta_one_sub`; Tau Ceti
`TauCeti.hasSum_idealTerm_vonMangoldt` (L-functions Layer 8) for the prime side on `Re s = 2`.

**Checks** for the test class and the formula.

- `φ = 0` satisfies the hypotheses and both sides are `0`.
- `ContDiff ℝ ⊤` in place of `ContDiff ℝ ∞` admits only `φ = 0`, since compactly supported
  real-analytic functions vanish; the formula would be tested on nothing.
- At `K = ℚ` with a nonnegative nonzero `φ`, `P = φ̃(0) + φ̃(1) > 0`; writing the signed divisor on
  the zero side subtracts `P` from the left, so the identity fails by exactly `P`.
- The archimedean term at `K = ℚ` contains `−(log π) φ(1)`, from the constant `−(log π)/2` of
  `logDeriv Gammaℝ` integrated against `φ̃(s) + φ̃(1 − s)`.

### 8.5 The prime ideal theorem with an error term

For fixed `K` there is `c > 0` with `ψ_K(x) = x − x^β/β + O(x exp(−c √log x))`, where
`ψ_K = TauCeti.primePsi K Set.univ`, under
*IsExceptionalZero* `1 β` (the trivial character, whose completion is `completedDedekindZeta`), and
`ψ_K(x) = x + O(x exp(−c √log x))` when there is none. For fixed `K` the two are the same estimate,
since `x^β = o(x exp(−c √log x))` for fixed `β < 1`; the term is carried for its meaning, and only a
conductor-uniform absorption would need Siegel's theorem. The prime count is reached through
`ϑ_K = TauCeti.primeTheta K Set.univ`, not through `ψ_K`: Abel summation of `ψ_K` against `1/log t`
gives each prime power `𝔭^k` the weight `1/k`, which is Riemann's prime-power count and not `π_K`.
The difference `ψ_K(x) − ϑ_K(x)` is the sum of `log 𝔑𝔭` over the `𝔭^k`, `k ≥ 2`, of norm at most
`x` (`TauCeti.primePsi_sub_primeTheta` at `S = Set.univ`), which is
`TauCeti.higherPrimePowerTheta K x ≤ ([K : ℚ]/(2 log 2)) √x log² x` for `x ≥ 1`
(`TauCeti.higherPrimePowerTheta_le`, Arithmetic Dirichlet Series §5.2) and hence
`O(x exp(−c √log x))`; so `ϑ_K` satisfies the estimate of `ψ_K`. The exact Abel identity
`π_K(x) = ϑ_K(x)/log x + ∫_2^x ϑ_K(t)/(t log² t) dt`
(`TauCeti.primeCount_eq_primeTheta_div_log_add_integral`), with
`x/log x + ∫_2^x (log t)^(−2) dt = Li x + 2/log 2` (`TauCeti.Real.logIntegral_eq_div_log_sub_add`)
for the main term and the monotonicity of `t exp(−c √log t)` for large `t` for the error, then
gives that the number `π_K(x) = TauCeti.primeCount K Set.univ x` of nonzero prime ideals of norm at
most `x` is `Li x + O(x exp(−c √log x))`, `Li = TauCeti.Real.logIntegral`: this is
`primeIdealCount_effective`, stated on the count of Tau Ceti's qualitative prime ideal theorem.
Since `x exp(−c √log x) = o(x/log x)` and `Li x ∼ x/log x`
(`TauCeti.Real.logIntegral_isEquivalent_div_log`), discarding the error recovers the conclusions
`ψ_K(x) ∼ x` and `π_K(x) ∼ Li x` of `TauCeti.primeIdealTheorem` as consistency theorems. The
estimate is assembled here from 8.3 at height `T = exp(√log x)`, the region of 6.2–6.3, which
bounds `|x^ρ|` by `x exp(−c √log x)` at every non-exceptional zero
with `|Im ρ| ≤ T`, and the count 4.5, which gives `∑_{|Im ρ| ≤ T} m_ρ/‖ρ‖ = O(log² T)`;
Davenport §18 is the `K = ℚ` case.

*Needs:* 8.3, 6.2, 6.3, 4.5; Arithmetic Dirichlet Series §4.3 `TauCeti.primeCount` and
`TauCeti.primeTheta`, §5.2 `TauCeti.higherPrimePowerTheta_le`, §§10.1–10.2 `TauCeti.primePsi` and
`TauCeti.primePsi_sub_primeTheta`, and §§6.1–6.2
`TauCeti.primeCount_eq_primeTheta_div_log_add_integral`, `TauCeti.Real.logIntegral`,
`TauCeti.Real.logIntegral_eq_div_log_sub_add`, `TauCeti.Real.logIntegral_isEquivalent_div_log`.

**Checks.**

- `K = ℚ`, `x = 10`: `ψ(10) = log 2520 ≈ 7.8320` and `ϑ(10) = log 210 ≈ 5.3471`; the difference
  `log 12 ≈ 2.4849` comes from `4`, `8` and `9`, within the bound `√10 log² 10/(2 log 2) ≈ 12.094`.
  Abel summation of `ψ` against `1/log t` gives `4 + 2/2 + 1/3 = 16/3 ≈ 5.3333`, the primes with
  weight `1`, the squares `4, 9` with weight `1/2` and the cube `8` with weight `1/3`; that of `ϑ`
  gives `π(10) = 4`. A route that sums `ψ` against `1/log t` counts the wrong function.
- `K = ℚ`, `x = 10⁶`: `ψ − ϑ ≈ 1102.42` against the bound `≈ 137682.4`, and Abel summation of `ψ`
  against `1/log t` gives `≈ 78597.11` against `π(10⁶) = 78498`. The two differ by
  `∑_{k ≥ 2} π(x^(1/k))/k ≈ 99.11`, which is `O(√x)` and so within the error term, but is not `0`.
- `K = ℚ(i)`, `x = 10`: the prime ideals of norm at most `10` are `(1 + i)`, `(2 + i)`, `(2 − i)`
  and `(3)`, of norms `2, 5, 5, 9`, and the only `𝔭^k` with `k ≥ 2` are `(1 + i)²` and `(1 + i)³`,
  of norms `4` and `8`; so `ψ_K(10) − ϑ_K(10) = 2 log 2 ≈ 1.3863`, against the bound
  `2 · 12.094 ≈ 24.19`, which depends on `K` only through `[K : ℚ] = 2`. The inert prime `(3)` has
  norm `9 = 3²` but is a prime of `K`, counted by `π_K`: removing the ideals whose norm is not a
  rational prime, in place of the `𝔭^k` with `k ≥ 2`, would take `log 9 ≈ 2.1972` from `ϑ_K` and
  `1` from `π_K(10) = 4`.

### 8.6 The Hecke instance

For `χ` primitive, nontrivial, of conductor `𝔣`, with `γ_χ = ∏_{j ≤ r₁} Gammaℝ(s + a_j) Gammaℂ^{r₂}`:
8.2–8.4 hold with `ψ_K(x, χ) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞) χ(𝔞)`; no `x` term and no `φ̃(0) + φ̃(1)`
(`Λ(χ, ·)` is entire); prime side `−∑_𝔞 Λ_K(𝔞)(χ(𝔞) φ(𝔑𝔞) + conj χ(𝔞) φ̌(𝔑𝔞))`, the conjugate
coming from the reflection to `χ⁻¹`; order `#{j : a_j = 0} + r₂` at `s = 0` (with
`Λ(χ, 0) ≠ 0` from 6.5) and `#{j : a_j ≡ m [MOD 2]} + r₂` at `−m`; and `log(|d_K| 𝔑𝔣)` in place of
`log |d_K|`. For fixed `K` and `χ`: `ψ_K(x, χ) = −x^β/β + O(x exp(−c √log x))` under
*IsExceptionalZero* `χ β`, and `O(x exp(−c √log x))` otherwise. These are assembled here as 8.3
and 8.5 are, from 8.1–8.2 for `χ`, the region of 6.4 and the count 4.5; Davenport §§19–20 is the
`K = ℚ` case.

*Needs:* 8.1–8.5, 6.3–6.5, 4.5, 1.5; Arithmetic Dirichlet Series §2.3, at the pin
`TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` for the
weight of `χ`, which makes `ψ_K(x, χ)` the summatory function of the coefficients of
`−logDeriv (heckeLFunctionC χ.character)` on `Re s > 1`, which the Dedekind identity
`TauCeti.hasSum_idealTerm_vonMangoldt` of 8.3 does not give.

**Checks.**

- The quartic character `χ` modulo `5` with `χ(2) = i` and `φ` supported in `(0.4, 0.6)` with
  `φ(1/2) = 1`: no norm lies in the support, so the prime sum reduces to its `φ̌` term at `(2)`,
  `log 2 · conj(i) · φ(1/2)/2 = −(i log 2)/2`; `χ` on both terms gives `+(i log 2)/2`.
- For a real character the two prime-side spellings coincide, so real characters cannot detect
  the conjugation.
- At `K = ℚ` and an odd character, the order at `s = 0` is `0` (`a = 1`), and the trivial zeros are
  at the negative odd integers.

### 8.7 Effective counting in a ray class

For a modulus `𝔪` and `c : TauCeti.GlobalNumberFields.RayClassGroup 𝔪`, define *rayClassPsi*
`𝔪 c x = ∑ Λ_K(𝔞)` over the ideals `𝔞` prime to `𝔪` (elements of
`TauCeti.GlobalNumberFields.integralIdealsPrimeTo 𝔪`) with `𝔑𝔞 ≤ x` and
`TauCeti.GlobalNumberFields.idealClass 𝔪 𝔞 = c`.

- *rayClassPsi* `𝔪 c` is a partial sum of `TauCeti.IdealArithmeticFunction.vonMangoldt`, the
  coefficient of `TauCeti.hasSum_idealTerm_vonMangoldt`.
- *rayClassPsi* `𝔪 c` is not `TauCeti.primePsi K S` for a set `S` of primes: `primePsi` selects a
  prime power `𝔭^k` by its base `𝔭`, whereas the class of `𝔭^k` is the `k`-th power of the class
  of `𝔭`. It selects prime powers by their own class, as `NumberField.Chebotarev.frobeniusPsi`
  selects them by the power of the Artin class.
- `∑_c rayClassPsi 𝔪 c x = ψ_K(x) − ∑_{𝔑𝔞 ≤ x, 𝔞 not prime to 𝔪} Λ_K(𝔞)`, and the subtracted sum
  is `O(log x)` for fixed `𝔪`.
- By orthogonality over the finite group,
  `#Cl_𝔪 · rayClassPsi 𝔪 c x = ∑_ψ conj ψ(c) ψ_K(x, ψ)`, the sum over the characters at `𝔪`, the
  ideals not prime to `𝔪` excluded on both sides (the logarithmic-derivative form of
  `partialZeta_eq_sum_heckeLFunctionC`).

Define the exceptional term *exceptionalRayClassTerm* `𝔪 c x` as
`(#Cl_𝔪)⁻¹ ∑_ψ ∑_{β : IsExceptionalZero (PrimitiveRayClassCharacter.of ψ) β} Re ψ(c) x^β/β`, the
outer sum over all characters at `𝔪`, the trivial one included; and *exceptionalRayClassPrimeCountTerm*
by `Li(x^β)` in place of `x^β/β`.

- Both are finite sums: the character group is finite and each inner set a subsingleton.
- Non-real characters contribute `0`, so the term has at most `#Cl_𝔪` nonzero summands of weight
  `±1/#Cl_𝔪`.
- Both vanish when no character at `𝔪` has an exceptional zero.
- For `x ≥ 2`, Abel summation sends each summand `x^β/β` to
  `Li(x^β) − Li(2^β)`; the fixed lower-endpoint constant is kept separately.

**Checks for the exceptional terms.** These conditional tests specify the value if the indicated
zero data occur; they do not assert the existence of an exceptional zero.

- With empty exceptional sets, both terms are `0`, including for the trivial modulus over `ℚ`.
  A definition that inserts a pole at `1` as a zero would produce a spurious main term.
- If the only contribution comes from a real character `ψ` with exceptional zero `β`, a class
  with `ψ(c) = 1` gives `x^β/(β #Cl_𝔪)` and `Li(x^β)/#Cl_𝔪`; a class with `ψ(c) = −1`
  gives their negatives. At `x = 2^(1/β)` the prime-count contribution is `0` because `Li 2 = 0`,
  whereas the weighted contribution is `±2/(β #Cl_𝔪)`.
- If only the trivial character contributes `β`, both terms are constant across classes,
  `x^β/(β #Cl_𝔪)` and `Li(x^β)/#Cl_𝔪`. Omitting the trivial character incorrectly gives `0`.
- If only a non-real character is tested, its exceptional set is empty by 6.3 and both
  contributions are `0`; taking the real part of an arbitrary complex zero would give a false term.

There is `c₀ > 0` depending only on the degree `n = [K : ℚ]`, and absolute at `n = 1`, such that
for every `K` of degree `n`, every modulus `𝔪` and every class `c`, as `x → ∞`,

```text
rayClassPsi 𝔪 c x = x/#Cl_𝔪 − exceptionalRayClassTerm 𝔪 c x + O(x exp(−c₀ √log x)),
```

and the number `TauCeti.primeCount K S_c x` of prime ideals of norm at most `x` in the set `S_c`
of those prime to `𝔪` in the class `c` is
`Li x/#Cl_𝔪 − exceptionalRayClassPrimeCountTerm 𝔪 c x + O(x exp(−c₀ √log x))`; the implied
constant, the threshold in `x` and the exceptional terms depend on `K` and `𝔪`. The width comes
from the region constant `c_n` of 6.4 for degree `n` (`heckeLFunction_zeroFreeRegion`): at the
height `T = exp(√log x)` of 8.5, a character at `𝔪` has conductor `𝔣` dividing `𝔪`, and
`log(|d_K| 𝔑𝔣 (T + 3)^n) ≤ n √log x + log(|d_K| 𝔑𝔪) + n log 2 ≤ 2n √log x` once `x` is large in
terms of `K` and `𝔪`. So every zero with `|Im ρ| ≤ T` other than an exceptional one has
`|x^ρ| ≤ x exp(−(c_n/2n) √log x)`; with the weight `∑_{|Im ρ| ≤ T} m_ρ/‖ρ‖ = O(log² T)` of 4.5
and the truncation error `O(x log² x exp(−√log x))` of 8.3 and 8.6 at that height,
`c₀ = min(c_n/(2n), 1)/2` serves.

The trivial character gives the main term `x/#Cl_𝔪` through 8.5. The finite Euler correction at
the primes of `𝔪` does **not** enter the main coefficient: deleting those Euler factors changes the
logarithmic derivative by a function regular at `s = 1`, and changes the prime-power sum by
`O(log x)`. The main coefficient of the prime count is therefore `1/#Cl_𝔪`, not the ideal-counting
constant `TauCeti.GlobalNumberFields.rayClassIdealMainTerm 𝔪`, which multiplies the Dedekind-zeta
residue by that correction and governs the count of all ideals in a class. Each nontrivial
character enters through 8.6 after 6.4b replaces it by its primitive source; the zeros agree on
`Re s > 0`, and on `Re s > 1` the deleted factors move the logarithmic derivative by at most
`log 𝔑𝔪`, the bound of 6.4b at the presentation modulus `𝔪`. The passage to
the prime count first removes the higher prime powers, since Abel summation of *rayClassPsi*
against `1/log t` would weight each `𝔭^k` in the class by `1/k`. *rayClassPsi* `𝔪 c x` is the
summatory function of the standard weight `log 𝔑𝔭` at `𝔭^k`
(`TauCeti.primePowerWeight_eq_vonMangoldt_re`) restricted to the set `T_c` of prime powers prime
to `𝔪` in the class `c`
(`TauCeti.idealSummatory_eq_primePowerSummatory`, `Λ_K` vanishing off the prime powers), and the
members of `T_c` that are primes are exactly the primes of `S_c`; so
`TauCeti.primePowerSummatory_indicator_sub_primeTheta` writes
`rayClassPsi 𝔪 c x − TauCeti.primeTheta K S_c x` as the sum of `log 𝔑𝔭` over the `𝔭^k ∈ T_c` with
`k ≥ 2` and `𝔑𝔭^k ≤ x`. That sum lies between `0` and
`TauCeti.higherPrimePowerTheta K x ≤ (n/(2 log 2)) √x log² x` for `x ≥ 1`
(`TauCeti.higherPrimePowerTheta_le`;
`TauCeti.primePowerSummatory_isBigO_of_le_higherPrimePowerWeight` at `C = 1` gives the
`O(√x log² x)`), a bound depending on `K` only through `n` and contained in
`O(x exp(−c₀ √log x))`; so `ϑ` over `S_c` satisfies the estimate of *rayClassPsi*. The prime count
is then the Abel identity `TauCeti.primeCount_eq_primeTheta_div_log_add_integral` for `ϑ` over
`S_c`, `x/#Cl_𝔪` becoming `Li x/#Cl_𝔪 + 2/(#Cl_𝔪 log 2)` and `x^β/β` becoming
`Li(x^β) − Li(2^β) + 2^β/(β log 2)` under `u = t^β`, legitimate because `β ≥ 1/2` (6.3); the
constants are absorbed by the error. `x/log x` is not an admissible main term:
`Li x − x/log x ∼ x/log² x`, which is not `O(x exp(−c √log x))`. For fixed `K` and `𝔪` each
exceptional summand is `O(x^β)` with `β < 1`, hence `O(x exp(−c₀ √log x))`, and the prime count
with that term absorbed is `rayClassPrimeCount_effective`: it is stated on
`TauCeti.primeCount K S_c x` for the set
`S_c` of the nonzero primes `P` of `𝓞 K` with
`P ∈ TauCeti.GlobalNumberFields.integralIdealsPrimeTo 𝔪` and
`TauCeti.GlobalNumberFields.idealClass 𝔪 P = c`, against
`TauCeti.Real.logIntegral x / Nat.card (TauCeti.GlobalNumberFields.RayClassGroup 𝔪)`, with one
width for all fields of degree `n`. Discarding the error through `Li x ∼ x/log x`, as in 8.5,
gives `primeCount K S_c x ∼ Li x/#Cl_𝔪`, the qualitative ray-class count, as a consistency
theorem. At `K = ℚ`, where the width is absolute, and `𝔪 = (q)∞` this is
`primeCounting_progression_effective` (Davenport §20), with main term `Li x/φ(q)`. It is stated on
`TauCeti.primeCount ℚ` of the set of primes of `𝓞 ℚ` whose absolute norm is `≡ a (mod q)`, under
`[NeZero q]` and `IsUnit (a : ZMod q)` (equivalently `q ≥ 1` and `gcd(a, q) = 1`, by
`ZMod.isUnit_iff_coprime`); through Mathlib's `Rat.HeightOneSpectrum.primesEquiv` and Tau Ceti's
`Rat.HeightOneSpectrum.absNorm_asIdeal` that count is the number of rational primes `p ≤ x` with
`p ≡ a (mod q)`. Discarding its error recovers
`NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`, stated on the same
count with the same hypotheses.

*Needs:* 8.5, 8.6, 6.3, 6.4 (`heckeLFunction_zeroFreeRegion`, for the width), 6.4b, 4.5;
L-functions Layers 2, 5 `partialZeta_eq_sum_heckeLFunctionC`, `PrimitiveRayClassCharacter.of`;
Global Number Fields Layers 2, 3E, 9 `RayClassGroup`,
`idealClass`, `integralIdealsPrimeTo`, `rayClassIdealMainTerm_eq`, `RayClassCharacter`;
Arithmetic Dirichlet Series §§2.3, 4.2–4.3, 5.2, 6.1–6.2, 10.2
`IdealArithmeticFunction.vonMangoldt`, `TauCeti.idealSummatory_eq_primePowerSummatory`,
`TauCeti.primeCount`, `TauCeti.primeTheta`, `TauCeti.higherPrimePowerTheta_le`,
`TauCeti.primePowerSummatory_isBigO_of_le_higherPrimePowerWeight`,
`TauCeti.primeCount_eq_primeTheta_div_log_add_integral`, `TauCeti.Real.logIntegral`,
`TauCeti.Real.logIntegral_eq_div_log_sub_add`, `TauCeti.primePowerWeight_eq_vonMangoldt_re` and
`TauCeti.primePowerSummatory_indicator_sub_primeTheta`;
at `K = ℚ`, Mathlib `Rat.HeightOneSpectrum.primesEquiv`, `ZMod.isUnit_iff_coprime` and Tau Ceti
`Rat.HeightOneSpectrum.absNorm_asIdeal`.

**Checks.**

- `K = ℚ`, `𝔪 = (3)∞`: `#Cl_𝔪 = 2`, and the primes `≡ 1` and `≡ 2 (mod 3)` each have `ψ`-coefficient
  `1/2`; `rayClassIdealMainTerm 𝔪 = (1/2)(1 − 1/3) = 1/3`, the coefficient of the count of all
  integers `≡ 1 (mod 3)` up to `x`, which is a different count.
- `K = ℚ`, `𝔪 = 1`: one class, *rayClassPsi* is `Chebyshev.psi`, and the exceptional term is `0`
  because `ζ` has no real zero in `(0, 1)`.
- `K = ℚ(√−5)`, `𝔪 = 1`: two classes, the principal and non-principal prime ideals each with
  coefficient `1/2`; the split primes `p ≡ 1, 9 (mod 20)` have principal factors.
- The width is uniform and the threshold is not. At `K = ℚ` and a character of conductor `q`, the
  bound `log(q (T + 3)) ≤ 2 √log x` at `T = exp(√log x)` holds once
  `exp(√log x) ≥ (q + √(q² + 12q))/2`, that is from `log x = 0.696` at `q = 1`, `2.496` at `q = 3`
  and `190.868` at `q = 10⁶`, while `c₀ = min(c_1/2, 1)/2` is the same for all three. A width
  chosen after `𝔪` would make the `n = 1` case weaker than `primeCounting_progression_effective`,
  whose `c` is absolute.
- `K = ℚ`, `𝔪 = (4)∞`, `c` the class of `3`, `x = 9`: the prime powers up to `9` in the class of
  `3` are `3` and `7`, since `9 ≡ 1 (mod 4)`, so *rayClassPsi* is `log 21 ≈ 3.0445`; the base-selected
  sum `TauCeti.primePsi ℚ {p ≡ 3 (mod 4)} 9` also counts `9 = 3²` through its base and is
  `log 63 ≈ 4.1431`. The prime counts agree, both `TauCeti.primeCount` of the primes `3` and `7`.
- `K = ℚ`, `𝔪 = (4)∞`, `c` the class of `1`, `x = 9`: the prime powers prime to `4` up to `9` in
  the class of `1` are `5` and `9 = 3²`, so *rayClassPsi* is `log 15 ≈ 2.7081`, while `ϑ` over the
  primes `≡ 1 (mod 4)` is `log 5 ≈ 1.6094`. The difference `log 3 ≈ 1.0986` is the prime power `9`
  and lies within the higher-prime-power sum `log 12 ≈ 2.4849` of all classes, from `4`, `8` and
  `9`. Abel summation of *rayClassPsi* against `1/log t` gives `1 + 1/2 = 3/2`, against the prime
  count `1`, the prime `5`; that of `ϑ` gives `1`.
- `K = ℚ`, `q = 4`: at `a = 3` the count `TauCeti.primeCount ℚ {p | 𝔑p % 4 = 3} 20` is `4`, from
  the primes `3, 7, 11, 19`, against `Li 20/φ(4) ≈ 4.4301`. At `a = 2` the hypothesis
  `IsUnit (2 : ZMod 4)` fails and the count is `1` for every `x ≥ 2`, from the prime `2` alone,
  while `Li x/2 ∼ x/(2 log x)` and `(x/log x)/(x exp(−c √log x)) = exp(c √log x)/log x → ∞` for
  every `c > 0`: the statement without the unit hypothesis is false.

### 8.8 Effective Chebotarev for an abelian extension

For `L/K` finite Galois and `C : ConjClasses (L ≃ₐ[K] L)`, the theorem is 8.7 transported along a
**reciprocity dictionary**, a hypothesis: a modulus `𝔪`, a surjective homomorphism
`Φ : RayClassGroup 𝔪 →* (L ≃ₐ[K] L)`, and the splitting law
`NumberField.artinSymbol 𝔭 hur = ConjClasses.mk (Φ (idealClass 𝔪 𝔭))` for every prime `𝔭` prime to
`𝔪` and unramified in `L`. The dictionary forces `Gal(L/K)` abelian. For abelian `L/K` Tau Ceti's
`TauCeti.ClassFieldTheory.rayClassArtinMap` with `rayClassArtinMap_idealClass` and
`rayClassArtinMap_surjective` (Class Field Theory Layer 12) discharges it at any admissible modulus,
for instance the conductor `TauCeti.ClassFieldTheory.abelianConductor K L`
(`isAdmissibleModulus_abelianConductor`). For fixed `L/K` there is `c₀ > 0` with

```text
frobeniusPsi C x = (#C/#G) x − exceptionalChebotarevTerm C x + O(x exp(−c₀ √log x)),
frobeniusPrimeCount C x = (#C/#G) Li x − exceptionalChebotarevPrimeCountTerm C x
                          + O(x exp(−c₀ √log x)),
```

on Chebotarev Layers 11 and 13's `NumberField.Chebotarev.frobeniusPsi` and `frobeniusPrimeCount`, where
*exceptionalChebotarevTerm* `C x` is defined from a dictionary as the sum over the characters
`ψ` of `Gal(L/K)` of `(#G)⁻¹ conj ψ(σ_C) ∑_β x^β/β`, `σ_C` the element of `C` and `β` running over
the exceptional zeros of `PrimitiveRayClassCharacter.of (ψ ∘ Φ)`. Two theorems accompany it: it
equals the sum of *exceptionalRayClassTerm* over the fibre `Φ⁻¹(σ_C)`, and it does not depend on
the dictionary, since two dictionaries induce the same primitive characters; without them the
term would be opaque and the estimate unfalsifiable. *exceptionalChebotarevPrimeCountTerm* is the
same with `Li(x^β)`. For an abelian extension, Mathlib's `IsAbelianGalois K L`, the pinned
ray-class reciprocity supplies the dictionary, and for fixed `L/K` the exceptional term is `O(x^β)` with
`β < 1`; the prime count with that term absorbed is `frobeniusPrimeCount_effective_abelian`. Then
`NumberField.Chebotarev.tendsto_frobeniusPrimeCount` and
`NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet` are recovered by discarding the error
through `Li x ∼ x/log x`, as consistency theorems. For every Galois `L/K` and every class `C`,
Lagarias–Odlyzko prove the unconditional estimate for the prime count, with an exceptional term
from a possible exceptional zero `β₀` of `ζ_L` and for `log x ≫ n_L (log d_L)²` (Lagarias–Odlyzko,
Theorem 1.3, deduced from their Theorem 9.2 for the von Mangoldt sum; cited by locator); the
nonabelian case is not owned here.

*Needs:* 8.7; Number Field Arithmetic §2.3 `NumberField.artinSymbol`;
Chebotarev Layers 11, 13–14 `NumberField.Chebotarev.frobeniusPsi`,
`NumberField.Chebotarev.frobeniusPrimeCount`, `NumberField.Chebotarev.tendsto_frobeniusPrimeCount`,
`NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet`; to discharge the hypothesis, Tau Ceti
`TauCeti.ClassFieldTheory.rayClassArtinMap`, `TauCeti.ClassFieldTheory.rayClassArtinMap_idealClass`,
`TauCeti.ClassFieldTheory.rayClassArtinMap_surjective` and
`TauCeti.ClassFieldTheory.isAdmissibleModulus_abelianConductor` (Class Field Theory Layer 12),
stated for `K L : Type`, so that in another universe the route first passes to an isomorphic pair
of fields in `Type`; Mathlib `IsAbelianGalois` for the statement.

**Checks.**

- `K = L = ℚ`, `C = ⟦1⟧`: `frobeniusPrimeCount` is `π`, the dictionary at `𝔪 = 1` is trivial, the
  exceptional term is `0`, and the estimate reads `π(x) = Li x + O(x exp(−c √log x))`.
- `L = ℚ(i)`, `K = ℚ`, `𝔪 = (4)∞`, `Φ` the isomorphism `(ℤ/4)ˣ ≅ Gal(L/ℚ)`: the class of complex
  conjugation counts the primes `≡ 3 (mod 4)`, coefficient `1/2`.
- With main term `x/log x` the `K = L = ℚ` case would assert
  `π(x) − x/log x = O(x exp(−c √log x))`, false since `(x/log² x)/(x exp(−c √log x)) → ∞`.

**Checks for the exceptional terms.** As in 8.7, these conditional tests specify the value if the
indicated zero data occur; they do not assert the existence of an exceptional zero.

- If among the characters of `Gal(L/K)` only the trivial one, whose primitive source has L-function
  `ζ_K`, has an exceptional zero `β`, then *exceptionalChebotarevTerm* `C x = x^β/(β #G)` in every
  class, and its sum over the `#G` classes (singletons, `G` being abelian) is `x^β/β`, the term of
  8.5; *exceptionalChebotarevPrimeCountTerm* is `Li(x^β)/#G`. The fibre sum of 8.7's term gives the
  same value, `#ker Φ · x^β/(β #Cl_𝔪) = x^β/(β #G)`, since `#ker Φ = #Cl_𝔪/#G`. A definition that
  omits the trivial character gives `0`; one with weight `1` in place of `(#G)⁻¹` gives `x^β/β` in
  every class and `#G · x^β/β` in total, against 8.5.
- If `L/K` is quadratic, `G = {1, σ}`, and only the nontrivial character `ψ` has an exceptional zero
  `β`, the term is `(1/2) conj ψ(1) x^β/β = x^β/(2β)` at `C = {1}` and
  `(1/2) conj ψ(σ) x^β/β = −x^β/(2β)` at `C = {σ}`, and the prime-count term is `Li(x^β)/2` and
  `−Li(x^β)/2`: the zero thins the split primes and adds the same amount to the inert ones. The
  class sum is `0`, matching 8.5 for a `ζ_K` without an exceptional zero. The weight-`1` model
  gives `±x^β/β`, twice the value.
- `L = ℚ(i)`, `K = ℚ`: the dictionaries at `(4)∞` (`Φ` the isomorphism `(ℤ/4)ˣ ≅ G`) and at
  `(8)∞` (`ker Φ = {1, 5}` in `(ℤ/8)ˣ`) induce the same primitive characters, the trivial one and
  `χ₋₄`, so they give the same term, which is `0` in both classes: `ζ` is negative on `(0, 1)`, and
  `L(s, χ₋₄) = 1 − 3^(−s) + 5^(−s) − …` is positive there, an alternating series with decreasing
  terms. A definition summing over all characters `ψ'` at `𝔪`, with `ψ'(c)` at one class
  `c ∈ Φ⁻¹(σ_C)` in place of `ψ(σ_C)`, would at `(8)∞` also take in any exceptional zero of the
  conductor-`8` characters `χ₈ = (2/·)` and `χ₋₈ = (−2/·)`, which are `−1` at `5 ∈ ker Φ` and so do not factor through `Φ`; those contributions
  change sign between `c` and `5c`, so its value would depend on the choice of `c` and of the
  dictionary.

### 8.9 The logarithmic integral

For `Li = TauCeti.Real.logIntegral` of Arithmetic Dirichlet Series §6.2 and `x ≥ 2`, the first
integration by parts `Li x = x/log x − 2/log 2 + ∫_2^x (log t)^(−2) dt` is
`TauCeti.Real.logIntegral_eq_div_log_sub_add` at the pin, and the remainder integral is
`o(x/log x)` by `TauCeti.Real.isLittleO_integral_inv_log_sq`. The target here is the second-order
term: `Li x − x/log x = x/log² x + O(x/log³ x)`, hence `Li x − x/log x ∼ x/log² x`. Route: a second
integration by parts, the derivative of `t ↦ t/log² t` being `1/log² t − 2/log³ t`, gives
`∫_2^x (log t)^(−2) dt = x/log² x − 2/log² 2 + 2 ∫_2^x (log t)^(−3) dt`; splitting the last integral
at `√x` bounds it by `√x/log³ 2 + 8x/log³ x`, which is `O(x/log³ x)`.

*Needs:* Tau Ceti `TauCeti.Real.logIntegral` and `TauCeti.Real.logIntegral_eq_div_log_sub_add`
(Arithmetic Dirichlet Series §6.2), `TauCeti.Real.integral_inv_log_pow_le` and
`TauCeti.Real.intervalIntegrable_inv_log_pow`; Mathlib
`intervalIntegral.integral_eq_sub_of_hasDerivAt` and the derivative of `Real.log`.

**Checks.**

- `TauCeti.Real.logIntegral 2 = 0`, the offset normalization; the unshifted `li` has `li 2 ≈ 1.045`.
- At `x = 10`: `Li x ≈ 5.1204`, `x/log x ≈ 4.3429`, `2/log 2 ≈ 2.8854` and
  `∫_2^10 (log t)^(−2) dt ≈ 3.6629`, consistent with the pinned identity; the second integration by
  parts gives the same `3.6629` as `10/log² 10 − 2/log² 2 + 2 ∫_2^10 (log t)^(−3) dt`.
- `Li x − x/log x` is `0.7775` against `x/log² x = 1.8861` at `x = 10` and `159.36` against `117.88`
  at `x = 10⁴`, so the ratio tends to `1` only slowly, as the `O(x/log³ x)` term predicts; the
  one-term statement `Li x ∼ x/log x` does not see this term.
- `x/log x − Li x` is negative for large `x`, so a main term `x/log x` undercounts.

### Examples

- `chebyshevPsi_explicitFormula` and `riemannZeta_weilExplicitFormula` at `K = ℚ`.
- `primeIdealCount_effective` at `K = ℚ` is `π(x) = Li x + O(x exp(−c √log x))`.
- `primeCounting_progression_effective` at `q = 4`, `a = 3`.

### Dependencies

Arithmetic Dirichlet Series §§2.3, 4.2–4.3, 5.2, 6.1–6.4, 10.1–10.2; Global Number Fields
Layers 2, 3E, 9;
Number Field Arithmetic §2.3; Chebotarev Layers 11, 13–14. Mathlib Mellin transform and
`IsAbelianGalois`. Layers 1.4,
1.4a, 1.5, 4.5, 5.6, 6, 7.2. L-functions Layers 2, 3, 5. Tau Ceti
`TauCeti.hasSum_idealTerm_vonMangoldt` (L-functions Layer 8; 8.3, 8.4), ray-class reciprocity
`TauCeti.ClassFieldTheory.rayClassArtinMap` (Class Field Theory Layer 12; 8.8) and
`TauCeti.Real.logIntegral_eq_div_log_sub_add` (Arithmetic Dirichlet Series §6.2; 8.9).

## Layer 9: certified zeros

This layer gives the meaning of a certified list of zeros; nothing here proves a numerical fact.

Define *HasZerosInRects* `f U R Bs ms`, for `U` open, `f` meromorphic on `U`, a closed valid
rectangle `R ⊆ U`, a finite list `Bs` of closed valid rectangles and `ms : List ℕ`, as the
conjunction of: `∀ z ∈ R, 0 ≤ divisor f U z`; each `B ∈ Bs` lies in `R`; the interiors of the `B`
are pairwise disjoint; `∀ z ∈ frontier R ∪ ⋃ frontier B, meromorphicOrderAt f z = 0`;
`List.Forall₂ (fun B m ↦ zeroCount f U B = m) Bs ms`; and `zeroCount f U R = ms.sum`.

- **Coverage**: every `ρ ∈ R` with `0 < divisor f U ρ` lies in some `B ∈ Bs`, proved by summing
  the nonnegative divisor without subtracting counts.
- **Stability**: shrinking `R` to `R'` keeps the predicate when `f` is regular and nonvanishing on
  `∂R'` and every `B` lies in `R'`; replacing `B` by `B' ⊆ B` keeps it when `f` is regular and
  nonvanishing on `∂B'` and the counts agree.
- **Boundary**: if `meromorphicOrderAt f z ≠ 0` for some `z ∈ ∂R`, no certificate for `R` exists.
- **Bridge to Layer 7**: a certificate together with the canonical-representative condition of
  7.2 makes `zeroCount f U R` the contour integral of 7.2; the germ-level boundary condition alone
  does not.

*Needs:* Layer 4.1; Layer 7.2 for the bridge.

**Checks.**

- `f z = (z − 1/2 − i)(z − 1/2 + i)` on `R = Icc 0 1 ×ℂ Icc (−2) 2` with two unit rectangles
  around the zeros and `ms = [1, 1]`: a certificate; dropping one rectangle breaks
  `zeroCount f U R = ms.sum`.
- `completedRiemannZeta` on `Icc 0 1 ×ℂ Icc (−1) 1` admits no certificate, because of the poles at
  `0` and `1` on the boundary; `zetaEntireCompletion` on the same rectangle admits one with
  `Bs = []`.
- With signed counts an omitted zero could cancel an omitted pole; the no-poles clause and
  natural-number multiplicities exclude it.

Define *AllOnCriticalLine* `f U R` as `∀ ρ ∈ R, 0 < divisor f U ρ → ρ.re = 1/2`.

- If every `B ∈ Bs` satisfies the same property, the certificate gives *AllOnCriticalLine*.
- If `B` is invariant under `s ↦ 1 − conj s`, the divisor of `f` is invariant under the same map,
  and `zeroCount f U B = 1`, then the zero in `B` has real part `1/2`.

**Checks.**

- A wide rectangle meeting the critical line can contain an off-line zero, so "each rectangle meets
  the line" does not give *AllOnCriticalLine*.
- The symmetry criterion fails for multiplicity `2`: a pair `ρ, 1 − conj ρ` inside `B`.
- `Λ(1 − conj s) = conj Λ(s)` for `ζ`, so the hypothesis is invariance of the divisor, not of the
  function.

Define *GRH* over the two families as `∀ ρ, 0 < divisor Λ univ ρ → ρ.re = 1/2`, and prove that at
the `ζ` instance it is Mathlib's `RiemannHypothesis`: a point of positive divisor of
`completedRiemannZeta` is a nontrivial zero of `riemannZeta`; the trivial zeros have divisor `0`;
and `0` and `1` have divisor `−1`.

**Checks.**

- `meromorphicOrderAt completedRiemannZeta (−2) = 0`, so the trivial zero at `−2` is not counted.
- `divisor completedRiemannZeta univ 1 = −1`: the pole is not a zero, although the total
  representative's value there is junk.
- The bridge to `RiemannHypothesis` would fail for a definition through `riemannZeta`, whose
  trivial zeros violate `ρ.re = 1/2`.

### Examples

- The first zero of `ζ`: a certificate for `zetaEntireCompletion` on `Icc 0 1 ×ℂ Icc 0 15` with one
  rectangle around `1/2 + 14.1347…i` and multiplicity `1`, with *AllOnCriticalLine* by the symmetry
  criterion. The numerical hypotheses are inputs.
- A certificate with `29` rectangles on `Icc 0 1 ×ℂ Icc 0 100` implies `N(100) = 29`; Layer 7.4
  alone does not, its constant being inexplicit.

### Dependencies

Layer 4.1; Layer 0 for *entireCompletion*; Layer 7.2 for the bridge. Mathlib `RiemannHypothesis`.

## Downstream consumers

- Effective prime counting in Arithmetic Dirichlet Series and Chebotarev style consumers take
  8.5, 8.7 and 8.8.
- Roadmaps needing the zeros of `Λ` in a region with multiplicity take `zeroCount` and the
  conventions of Layer 4 rather than a preimage of `{0}`.
- The Stirling and reciprocal-gamma statements of Layer 1 and Hadamard's theorem of Layer 5 are
  general complex analysis for any consumer.
- AnalyticNumberTheoryPartI consumes Layers 0–8 as stated for a general field, the
  exceptional-zero alternative of 6.3–6.4 included.

## Provenance

This section is secondary: it maps statements of this roadmap to an existing formalization and
prescribes nothing. The Lean project PrimeNumberTheoremAnd
(<https://github.com/AlexKontorovich/PrimeNumberTheoremAnd>, Apache-2.0) contains, at commit
`127b50e33f6033e2147921167a117af96d9ba4ea`, the declarations below, none of which has `sorry` in
its own proof; paths are under its `PrimeNumberTheoremAnd/` folder. Most are stated for `ζ` alone
or with a narrower range, as the table records; the general statements are the layers above.
Coordinate with the project's authors before porting any of it.

| § | Existing declarations | Files |
| --- | --- | --- |
| 1.4a | `Kadiri.kadiri_thm_3_1_q1_functional_eq`: under the same four hypotheses, `−ζ'/ζ(s) = −log π + ζ'/ζ(1 − s) + (ψ(s/2) + ψ((1 − s)/2))/2`, the symmetric form rearranged | `IEANTN/Kadiri.lean` |
| 5.2 | `Complex.weierstrassFactor` at `m = 1`, which is *E₁* | `Mathlib/Analysis/Complex/WeierstrassFactor.lean` |
| 5.3 | `Complex.Hadamard.divisorCanonicalProduct`, indexed by the nonzero zeros with multiplicity; `Complex.Hadamard.differentiable_divisorCanonicalProduct_univ` (the genus-`g` product is entire when `∑_ρ m_ρ ‖ρ‖^{−(g+1)}` over the nonzero zeros converges); `Complex.Hadamard.divisor_hadamardDenom_eq` (for entire `f` under the same summability, the product times `z^(ord_0 f)` has the divisor of `f`); `Complex.Hadamard.EntireOfOrderAtMost.summable_norm_inv_pow_divisorZeroIndex₀` (that summability at genus `⌊A⌋` for `f` of order at most `A ≥ 0` and not identically zero) | `Mathlib/Analysis/Complex/DivisorIndex.lean`, `Mathlib/Analysis/Complex/HadamardFactorization.lean`, `Mathlib/Analysis/Complex/HadamardFactorization/Order.lean` |
| 5.5 | `Complex.Hadamard.hadamard_factorization_of_order` at order `1`, for every entire function that is not identically zero (at every order `A ≥ 0`, its `EntireOfOrderAtMost A` agrees with `OrderLE _ A` on entire functions); for `ζ`, `riemannXi_hadamard_factorization_no_monomial` and the partial-fraction expansion `logDeriv_riemannXi_eq_polynomial_derivative_add_tsum`, where `riemannXi` is `zetaEntireCompletion / 2` | `Mathlib/Analysis/Complex/HadamardFactorization/Order.lean`, `Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean` |
| 5.6a | the `ζ` case in the form `∑_ρ m_ρ ‖ρ‖^{−2} < ∞` over the zeros of `riemannXi`: `summable_riemannXi_divisorZeroIndex₀_norm_inv_sq`; the ordinate form follows by comparison once the zeros lie in the critical strip | `Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean` |
| 6.2 | the `ζ` case for zeros whose ordinate has absolute value at least `2`: `ZeroInequality` | `StrongPNT.lean` |
| 6.4d | the `ζ` case for heights `t` of absolute value at least `2` and `0 < δ < 1`: `ShiftTwoBound` and `ShiftOneBound`, whose finiteness hypotheses on the zeros of `ζ` within `3/4` of `3/2 + 2it` and of `3/2 + it` respectively are discharged by `ZeroWindowFinite` at heights `2t` and `t` | `StrongPNT.lean` |
| 7.2 | the divisor form, for the normalized sum of four edge integrals `RectangleIntegral'` in place of the parametrized boundary of 7.1: `rectangleIntegral_logDeriv_eq_sum_meromorphicOrderAt` | `RectangleArgumentPrinciple.lean`, `ResidueCalcOnRectangles.lean` |
| 8.5 | the case `K = ℚ` in the `ψ` form, `ψ(x) − x = O(x exp(−c √log x))`: `StrongPNT` | `StrongPNT.lean` |

The project's zero count `riemannZeta.N` (`IEANTN/ZetaDefinitions.lean`) sums over the zeros of
`ζ` with ordinate in the open interval `(0, T)`; `N(T)` here counts a zero at height `T` (4.5), so
the two differ exactly at the ordinates.

## References

- H. Davenport, *Multiplicative Number Theory*, 3rd ed. rev. H. L. Montgomery, GTM 74 — §11
  (integral functions of order one), §12 (the infinite products for `ξ(s)` and `ξ(s, χ)`), §13
  (zero-free region for `ζ`), §14 (zero-free regions for `L(s, χ)`), §§15–16 (`N(T)` and
  `N(T, χ)`), §17 (explicit formula for `ψ`), §18 (prime number theorem), §19 (explicit formula
  for `ψ(x, χ)`), §20 (primes in progressions). Cited by locator.
- E. C. Titchmarsh, rev. D. R. Heath-Brown, *The Theory of the Riemann Zeta-Function*, 2nd ed. —
  §5.1 (convexity), §§9.2–9.4 and Theorems 9.2–9.4 (`N(T)`, `S(T)` and the Riemann–von Mangoldt
  formula). Cited by locator.
- H. Kadiri, *Explicit zero-free regions for Dedekind zeta functions*, Int. J. Number Theory 8
  (2012); arXiv:1106.1868 — Theorem 1.1 (regions for `|Im s| ≥ 1` and `|Im s| ≤ 1` when `d_K` is
  large) and §2.1.2 (the explicit formula behind 5.6 and 6.4d).
- M. A. Bennett, G. Martin, K. O'Bryant, A. Rechnitzer, *Counting zeros of Dirichlet
  L-functions*, Math. Comp. 90 (2021), 1455–1482; arXiv:2005.02989 — Corollary 1.2 (conductor
  `q > 1`, `T ≥ 5/7`, zeros with `0 < β < 1` and `|γ| ≤ T`, main term `(T/π) log(qT/2πe)`, error
  at most `0.247 log qT + 6.894`) and §1 (the gap in Trudgian's proof). Numbering of the arXiv
  version.
- E. Hasanalizade, Q. Shen, P.-J. Wong, *Counting zeros of Dedekind zeta functions*, Math. Comp.
  91 (2022); arXiv:2102.04663 — Corollary 1.2 (`T ≥ 1`, main term `(T/π) log(d_K (T/2πe)^{n_K})`,
  error at most `0.228 (log d_K + n_K log T) + 23.108 n_K + 4.520`) and §1. Numbering of the arXiv
  version.
- T. S. Trudgian, *An improved upper bound for the error in the zero-counting formulae for
  Dirichlet L-functions and Dedekind zeta-functions*, Math. Comp. 84 (2015), 1439–1450 —
  Theorem 1 (primitive nonprincipal `χ`, zeros with `0 < β < 1` and `|γ| ≤ T`, main term
  `(T/π) log(kT/2πe)`, error `C₁ log kT + C₂` with absolute constants) and Theorem 2 (the Dedekind
  case, main term `(T/π) log(d_K (T/2πe)^{n_K})`), the earlier statements of the two counts, with a
  proof that Bennett–Martin–O'Bryant–Rechnitzer §1 show to be incomplete.
- S. Lang, *Algebraic Number Theory*, 2nd ed., GTM 110 — XVII §3, Theorems 3.1 and 3.2 (Weil's
  explicit formula and `Λ'/Λ` as a limit over zeros); XVII §§1–2; XV §§4–5. Cited by locator.
- H. Iwaniec, E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53 — §5.1 (the
  analytic conductor (5.7)) and §5.2 (convexity). Cited by locator.
- J. C. Lagarias, A. M. Odlyzko, *Effective versions of the Chebotarev density theorem*, in
  A. Fröhlich (ed.), *Algebraic Number Fields: L-functions and Galois Properties*, Academic Press
  (1977), 409–464 — Theorem 1.3 (the unconditional prime count in a Galois extension, with the term
  of a possible exceptional zero of `ζ_L`, for `log x ≫ n_L (log d_L)²`) and Theorem 9.2 (its von
  Mangoldt form); the remark of 8.8. Cited by locator.
- J. C. Lagarias, H. L. Montgomery, A. M. Odlyzko, *A bound for the least prime ideal in the
  Chebotarev density theorem*, Invent. Math. 54 (1979), 271–296, doi:10.1007/BF01390234 —
  Lemma 2.3 (the region for Hecke L-functions with at most one zero and a constant independent of
  `K`, as Kadiri §1 reports it; the region of 6.4). Cited by locator.
- NIST Digital Library of Mathematical Functions, equations 5.5.3 (reflection), 5.6.6
  (`|Γ(x + iy)| ≤ |Γ(x)|`), 5.11.1 (Stirling for `log Γ`), 5.11.2 (digamma), 5.11.9 (gamma on
  bounded real-part intervals), and §5.11(ii) (remainder bounds).
- PrimeNumberTheoremAnd, Lean project (Apache-2.0),
  <https://github.com/AlexKontorovich/PrimeNumberTheoremAnd>, commit
  `127b50e33f6033e2147921167a117af96d9ba4ea` — the declarations listed under Provenance.
