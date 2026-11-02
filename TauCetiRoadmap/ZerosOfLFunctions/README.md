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
  (Layer 2), in the Iwaniec–Kowalski normalization (5.7); the newform analytic conductor that the
  [modular forms roadmap](../ModularForms/README.md) displays in its Layer 7 is the specialization
  proved in 2.4;
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
  coefficient growth predicate: the [L-functions roadmap](../LFunctions/README.md), Layers 0–5, 7
  and 8;
- the residue calculus — winding numbers, null-homology, residues, the argument principle for a
  null-homologous closed piecewise-`C¹` curve, the continuous argument lift, and the
  winding-number form of `∮ f'/f` — as Tau Ceti realizes the
  [contour integration roadmap](../../Completed/ContourIntegration/README.md);
- ideal arithmetic functions, the ideal von Mangoldt function, Abel and truncated Perron
  summation, and the prime-number-theorem transfer, as Tau Ceti realizes the
  [Arithmetic Dirichlet Series roadmap](../../Completed/ArithmeticDirichletSeries/README.md),
  Layers 0–2, 6 and 10;
- moduli, ray class groups, ray-class characters and the class of an ideal prime to a modulus, as
  Tau Ceti realizes the [Global Number Fields roadmap](../GlobalNumberFields/README.md), Layer 2;
- the Artin symbol, as Tau Ceti realizes the
  [Number Field Arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md), and the
  Frobenius prime sets and Frobenius counting functions with their qualitative asymptotics, as Tau
  Ceti realizes the [Chebotarev roadmap](../../Completed/Chebotarev/README.md);
- the ray-class Artin map and its splitting law, from the
  [Class Field Theory roadmap](../ClassFieldTheory/README.md), Layer 12, which discharges the
  reciprocity hypothesis of 8.8;
- the offset logarithmic integral `TauCeti.Real.logIntegral` and its one-term asymptotic.

### Not owned here

- constructing L-functions, continuing them, or proving functional equations (the L-functions
  roadmap); no zero theorem here is stated for a bare record without the continuation of its
  family;
- proving the Riemann hypothesis, the generalized Riemann hypothesis, or the nonexistence of
  exceptional zeros; Siegel's theorem and every lower bound for `1 − β` uniform in the conductor,
  so no effective estimate here is uniform in the modulus or the character;
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
  `MeromorphicOn.divisor` has junk value `0` off meromorphy, so meromorphy on a stated open set is
  a hypothesis of every theorem about a count.
- **Order and values.** `meromorphicOrderAt f z = 0` is a statement about the punctured germ. It
  gives neither `AnalyticAt ℂ f z` nor `f z ≠ 0`, and it does not make the image of a path through
  `z` miss `0`: the function equal to `1` near `z` except for the value `0` at `z` has order `0`
  everywhere and divisor `0`. Germ-level order is the hypothesis for a count (Layers 4 and 9);
  anything evaluated pointwise (the argument principle and the argument lift of Layer 7) takes
  `AnalyticAt ℂ f z` and `f z ≠ 0`, written out. For a record of the L-functions roadmap the
  analyticity is its `HasMeromorphicContinuation.regular_away`.
- **The two counts.** *divisorCount* `f U R : ℤ` is `∑ᶠ ρ ∈ R, MeromorphicOn.divisor f U ρ`, in
  which poles count negatively, and is what a contour integral computes. `zeroCount f U R : ℕ`
  sums the positive part, `(MeromorphicOn.divisor f U ρ).toNat`, and is what `N(T)`, the
  Riemann–von Mangoldt formula and every certificate use. They agree exactly when `R` contains no
  pole, which is a hypothesis.
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

- `MeromorphicOn.divisor`, `meromorphicOrderAt`, `MeromorphicOn.divisor_restrict`,
  `Function.locallyFinsuppWithin.posPart_apply`, `LocallyFiniteSupport.finite_inter_support_of_isCompact`,
  `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected`, `MeromorphicOn.extract_zeros_poles`,
  `meromorphicTrailingCoeffAt` (divisors, local finiteness, identity theorem, normal form);
- `MeromorphicOn.circleAverage_log_norm`, `AnalyticOnNhd.sum_divisor_le` (Jensen's formula and
  the disc zero bound);
- `ValueDistribution.logCounting`, `ValueDistribution.log_counting_zero_sub_logCounting_top`,
  `Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const` (Nevanlinna
  counting, for the comparison of 4.11);
- `Complex.PhragmenLindelof.vertical_strip` (convexity on a strip);
- `Complex.exists_continuousOn_eqOn_exp_comp` (a continuous logarithm on a simply connected open
  set);
- `Complex.differentiableOn_update_limUnder_of_bddAbove` (removable singularities);
- `multipliableLocallyUniformlyOn_one_add`, `tprod_one_add_ne_zero_of_summable`,
  `logDeriv_tprod_eq_tsum` (infinite products), with `Complex.multipliable_sineTerm` and
  `Complex.cot_series_rep` as the genus-`0` model;
- `Complex.borelCaratheodory`;
- `Complex.Gamma`, `Complex.digamma`, `Complex.Gammaℝ`, `Complex.Gammaℂ`,
  `Complex.differentiable_one_div_Gamma`, `Complex.differentiable_Gammaℝ_inv`,
  `Complex.differentiable_Gammaℂ_inv` (the reciprocal gamma functions are entire);
- `completedRiemannZeta`, `completedRiemannZeta₀`, `riemannZeta`, `riemannZeta_zero`,
  `riemannZeta_def_of_ne_zero`, `riemannZetaZeros`, `isDiscrete_riemannZetaZeros`,
  `IsCompact.inter_riemannZetaZeros_finite`, `RiemannHypothesis`;
- `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`,
  `riemannZeta_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  `DirichletCharacter.norm_LFunction_product_ge_one`;
- `mellin`, `mellinInv`, `mellinInv_mellin_eq` (Mellin transform and inversion);
- `Chebyshev.psi`, `ArithmeticFunction.vonMangoldt`, `NumberField.dedekindZeta`,
  `NumberField.dedekindZeta_residue`, `Ideal.absNorm`.

### From Tau Ceti

Exact declarations of the Tau Ceti pin, each with its file under `TauCeti/`:

- contour integration (`Analysis/Contour/`): `TauCeti.Contour.IsPiecewiseC1On`,
  `TauCeti.Contour.windingNumber`, `TauCeti.Contour.IsNullHomologous` with
  `TauCeti.Contour.isNullHomologous_iff`; `TauCeti.Contour.argumentPrinciple_nullHomologous`
  (`Argument/Cycle.lean`), which for `f` analytic and nonvanishing on `U` off a finite set `S`,
  meromorphic at the points of `S` with integer orders `ord`, and a closed piecewise-`C¹`
  null-homologous curve in `U` avoiding `S`, evaluates `∫ γ' · (f'/f)(γ)` as
  `2πi ∑_{z ∈ S} windingNumber γ z · ord z`; `TauCeti.Contour.residue_logDeriv_eq_meromorphicOrderAt`;
  `TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean`), the winding
  number of the image curve `f ∘ γ` about `0`; and
  `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean`), the
  continuous argument lift of a curve avoiding a point;
- the logarithmic integral (`Analysis/SpecialFunctions/LogIntegral.lean`):
  `TauCeti.Real.logIntegral`, defined as `∫ t in 2..x, (Real.log t)⁻¹`,
  `TauCeti.Real.logIntegral_isEquivalent_div_log`, `TauCeti.Real.logIntegral_eq_div_log_sub_add`;
- arithmetic Dirichlet series (`NumberTheory/ArithmeticDirichletSeries/`):
  `TauCeti.IdealArithmeticFunction.vonMangoldt` (`VonMangoldt.lean`), `TauCeti.normCoeff`
  (`NormCoeff.lean`), `TauCeti.abscissaOfAbsConv_normCoeff_one` (`Estimates.lean`),
  `TauCeti.EulerProductData` (`EulerProduct/Data.lean`),
  `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`AbelSummation.lean`),
  `TauCeti.truncatedPerron_LSeries` and `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`
  (`Perron/Formula.lean`), `TauCeti.perronFormula` (`Perron/Ideal.lean`),
  `TauCeti.primeNumberTheoremTransfer` (`Prime/Boundary.lean`), and
  `TauCeti.LSeries.wienerIkehara` (`NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean`); the
  finite-height endpoint value of the Perron kernel, `π⁻¹ arctan(T/c)` rather than `1/2`, is
  the Arithmetic Dirichlet Series roadmap's `truncatedPerronKernel_one` (Layer 6);
- ray classes (`NumberTheory/NumberField/Global/RayClass/`): `TauCeti.GlobalNumberFields.Modulus`,
  `Modulus.support`, `Modulus.one`, `TauCeti.GlobalNumberFields.RayClassGroup`,
  `TauCeti.GlobalNumberFields.integralIdealsPrimeTo`, `TauCeti.GlobalNumberFields.idealClass`
  (`Basic.lean`, `Modulus.lean`), `TauCeti.GlobalNumberFields.RayClassCharacter`
  (`Character/Basic.lean`), and the instance `TauCeti.GlobalNumberFields.finite_rayClassGroup`
  (`Finite.lean`);
- the Artin symbol `NumberField.artinSymbol` (`NumberTheory/NumberField/ArtinSymbol.lean`),
  defined at a prime unramified in `L` and taking the unramifiedness proof as an argument;
- Chebotarev (`NumberTheory/Chebotarev/`): `NumberField.Chebotarev.frobeniusPrimeSet`
  (`FrobeniusPrimeSet.lean`); `NumberField.Chebotarev.frobeniusPsi`, `frobeniusTheta`,
  `frobeniusPrimeCount` and `frobeniusVonMangoldtCoeff` (`PrimeCounting/VonMangoldt.lean`); and
  `NumberField.Chebotarev.tendsto_frobeniusPrimeCount`, `hasNaturalDensity_frobeniusPrimeSet`
  (`PrimeCounting/FrobeniusPrimeCount.lean`), the qualitative endpoint recovered in 8.8.

What is assumed of them is their stated types. No `primeTheta`, `primeCount`, density predicate,
Frobenius carrier or second ideal weight is defined here.

### From TauCetiRoadmap.LFunctions

- Layer 0: `AnalyticLFunctionData` with fields `coeff`, `conductor`, `gammaR`, `gammaC`,
  `rootNumber`, `completed`, `polarOrder`; `AnalyticLFunctionData.degree`,
  `AnalyticLFunctionData.gammaFactor`, `AnalyticLFunctionData.dual`,
  `AnalyticLFunctionData.dualCompleted`, `AnalyticLFunctionData.reflectedPoint`,
  `AnalyticLFunctionData.dual_gammaFactor`; the predicates `AnalyticLFunctionData.HasDirichletAgreement`
  (fields `coeff_one`, `degree_pos`, `completes`), `AnalyticLFunctionData.HasMeromorphicContinuation`
  (fields `meromorphic`, `exact_pole_order`, `regular_away`) and
  `AnalyticLFunctionData.HasFunctionalEquation` (fields `norm_rootNumber`, `polarOrder_reflect`,
  `eq_away`, the last being `Λ(s) = ε Λ_dual(1 − s)` at points `s` with `polarOrder s = 0` and
  `polarOrder (reflectedPoint s) = 0`); `AnalyticLFunctionData.hasFunctionalEquation_eventuallyEq`,
  `AnalyticLFunctionData.dual_hasDirichletAgreement`,
  `AnalyticLFunctionData.dual_hasMeromorphicContinuation`; `ArithmeticLFunctionData` and
  `NormalizationTranslation` (fields `gammaR_eq`, `gammaC_eq`, `completed_eq`, `polarOrder_eq`,
  `conductor_eq`, `rootNumber_eq`); `riemannZetaData`. From Layer 0 also the
  average-coefficient-growth predicate, which that roadmap states in prose: what is consumed is
  that it makes `LSeries d.coeff` absolutely convergent on `Re s > 1` and bounded on every
  half-plane `Re s ≥ 1 + δ`, `δ > 0`, by a constant depending on `δ`.
- Layer 3: `dedekindZetaC`, `dedekindZetaC_eq`, `meromorphic_dedekindZetaC`,
  `analyticAt_dedekindZetaC`, `meromorphicOrderAt_dedekindZetaC_one`,
  `tendsto_sub_one_mul_dedekindZetaC`, `completedDedekindZeta`, `completedDedekindZeta_eq`,
  `meromorphic_completedDedekindZeta`, `meromorphicOrderAt_completedDedekindZeta_zero`,
  `meromorphicOrderAt_completedDedekindZeta_one`, `analyticAt_completedDedekindZeta`,
  `tendsto_sub_one_mul_completedDedekindZeta`, `tendsto_mul_completedDedekindZeta_zero`,
  `completedDedekindZeta_one_sub`, `eq_of_meromorphic_of_eqOn_halfPlane`, `dedekindZetaData`,
  `dedekindZetaData_hasContinuation`, `dedekindZetaData_hasFunctionalEquation`; from Layer 2,
  `partialZeta`, `partialZeta_eq_lSeries`, `finiteEulerCorrection`, `sum_partialZeta`.
- Layer 4: `dirichletData`, `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`.
- Layer 5: `PrimitiveRayClassCharacter` (fields `conductor`, `character`, `isPrimitive`),
  `PrimitiveRayClassCharacter.of`, `PrimitiveRayClassCharacter.inv`, `heckeLFunctionC`,
  `heckeLFunctionC_eq`, `eulerCorrection`, `eulerCorrection_one`, `heckeLFunctionC_induced`,
  `heckeLFunctionC_eq_primitive` (a half-plane equality of values and an equality of germs at
  every point), `partialZeta_eq_sum_heckeLFunctionC`, `heckeData`, `completedHeckeLFunction`,
  `differentiable_completedHeckeLFunction` (for a nontrivial character),
  `exists_mellin_completedHeckeLFunction`, `heckeRootNumber`, `norm_heckeRootNumber`,
  `completedHeckeLFunction_one_sub` (for a nontrivial character, against
  `PrimitiveRayClassCharacter.inv`), `completedHeckeLFunction_one_sub_eventuallyEq` (the germ
  form, which covers the trivial character).
- Layers 7 and 8: `heckeLFunction_ne_zero_of_one_le_re`, `three_four_one_nonneg`,
  `dedekindZeta_logDeriv_eq`, `dedekindZeta_idealVonMangoldt_nonneg`.

Nothing here is polymorphic over an Artin record: the two families are Dedekind zeta functions and
L-functions of finite-order ray-class characters, which is why 8.7 is stated on the ray-class side
and nonabelian Chebotarev is not owned here.

### From TauCetiRoadmap.ClassFieldTheory

- Layer 12: `rayClassArtinMap`, `rayClassArtinMap_idealClass` (the splitting law at an admissible
  modulus) and `rayClassArtinMap_surjective`. They discharge the reciprocity hypothesis of 8.8 and
  are not used elsewhere.

## How to read the build

Layers 0–2 are general analysis over the L-functions roadmap's record: growth predicates and the
entire completion, Stirling's formula and the continued L-function, and the analytic conductor.
Layer 3 proves convexity and, for the two families, finite order. Layer 4 counts zeros by
Jensen's formula, without contour integrals; Layer 5 is Hadamard's factorization, general and then
for the families. Layer 6 proves the zero-free regions, Layer 7 the exact count by the argument
principle on a rectangle, and Layer 8 the explicit formulas and the effective prime counts. Layer
9 needs only Layers 0 and 4 and can be built early.

## Layer 0: growth predicates and the entire completion

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
- `s ↦ 1/Γ(s)` satisfies `OrderLE _ 1` but is not `O(exp(C‖s‖))` for any `C`: along the negative
  reals `‖1/Γ(−x)‖` grows like `exp(x log x)`. A predicate defined by exponential type would reject
  it, and with it every completed L-function, which grows like `exp(c r log r)` on the real axis.
- `exp z` satisfies `OrderLE _ 1` but not `OrderLE _ (1/2)`, since `exp r / exp(r^{3/4}) → ∞`.
- `1 − z` satisfies `OrderLE _ 0`, and the constant `1` satisfies `OrderLE _ A` for every real
  `A`, including negative `A`.

Build the **entire completion** of a record `d` satisfying `HasMeromorphicContinuation`. It is not
the pointwise product `P · Λ` with the clearing polynomial `P(s) = ∏_p (s − p)^{polarOrder p}`: at a
pole the total representative of `Λ` is junk, and for the `ζ` record the product is `0` at `0` and
`1`, fake zeros exactly where poles are meant to be cleared. Define *entireCompletion* `d` as the
analytic extension of `P · Λ` across the finite set `polarOrder.support`, where each point is a
removable singularity of order `0` by `exact_pole_order`.

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

Define finite order, *IsFiniteOrder* `d`, as `∃ A, OrderLE (entireCompletion d) A`. It does not
imply `OrderLE (entireCompletion d) 1`; that is proved per family in 3.4.

**Checks.**

- `zetaEntireCompletion` has finite order (3.4 proves order at most `1`).
- `exp (z²)` and `exp z` both have finite order, which does not distinguish order `1` from `2`.
- `exp (exp z)` does not have finite order: `log log |exp(exp r)| = r`, beating every `A log r`.

Define **vertical-strip growth**, *HasVerticalStripGrowth* `d`: for all `σ₁ < σ₂` there are
`C > 0`, `A ≥ 0` and `T₀ ≥ 0` with `‖Λ(σ + it)‖ ≤ C (1 + |t|)^A` for `σ ∈ [σ₁, σ₂]` and
`|t| ≥ T₀`. The threshold is existential: a record may have a pole at any height.

Prove that *IsFiniteOrder* together with `HasFunctionalEquation` and the average coefficient bound
implies *HasVerticalStripGrowth*, by Phragmén–Lindelöf applied to *entireCompletion* `d` and
division by the clearing polynomial, with `T₀` any number **strictly** larger than
`max {|Im p| : p ∈ polarOrder.support}` and the constants depending on the margin between them.
A non-strict bound fails: for the shifted record above with `T₀ = H`, `‖Λ(σ + iH)‖ → ∞` as
`σ → 1`, so no `C (1 + H)^A` bounds it. For *entireCompletion* every `T₀ ≥ 0` works, and for the
two families, whose polar supports are real, `T₀ = 2` works.

*Needs:* *entireCompletion*, *IsFiniteOrder*; L-functions Layer 0 `HasFunctionalEquation` and the
average-coefficient-growth predicate; Mathlib `Complex.PhragmenLindelof.vertical_strip`.

**Checks.**

- The shifted record with `H = 5` satisfies the growth predicate with `T₀ = 6` and fails it with
  `T₀ = 5`, at `σ → 1` and `t = 5`.
- The `ζ` record satisfies it with `T₀ = 2` on every strip, including strips containing `0` and
  `1`, since both poles have height `0`.
- On the right half-plane `Re s ≥ 2` the record of `ζ` has `‖Λ(σ + it)‖` decaying like
  `exp(−π|t|/4)|t|^{(σ−1)/2}`, so the predicate holds there with `A = 0`; a predicate demanding
  a lower bound would be refuted.

Prove the starting edge: a record with the average coefficient bound has `LSeries d.coeff`
bounded on `Re s ≥ 1 + δ`, and hence, by `HasDirichletAgreement.completes` and the gamma
asymptotic of 1.5, `Λ` has at most polynomial growth there.

*Needs:* L-functions Layer 0 `HasDirichletAgreement` and the average-coefficient-growth predicate;
Layer 1.5 for the gamma factor.

### Examples

- `zetaEntireCompletion` with its values `1` at `0` and `1`.
- `exp (c s)` has `OrderLE _ 1` for every `c`, with no zeros.
- The shifted record `Λ_ζ(s − iH) Λ_ζ(s + iH)`: entire completion, strict height threshold.

### Dependencies

L-functions Layer 0: `AnalyticLFunctionData`, `HasMeromorphicContinuation`,
`HasFunctionalEquation`, `HasDirichletAgreement`, the average-coefficient-growth predicate.
Mathlib: `Complex.PhragmenLindelof.vertical_strip`, removable singularities,
`completedRiemannZeta₀`. The starting-edge statement also needs Layer 1.5.

## Layer 1: gamma-factor asymptotics and the continued L-function

### 1.1 A holomorphic branch of log Γ

Fix `δ` with `0 < δ < π` and the sector `S_δ = {s : |arg s| < π − δ ∧ 1 < ‖s‖}`. For that range
`S_δ` is open, simply connected (its image under `log` is a convex set), free of poles of `Γ`, and
contains `2`. Define *logGamma* `δ` by `Complex.exists_continuousOn_eqOn_exp_comp` applied to `Γ`
on `S_δ`, normalized by *logGamma* `δ 2 = 0`.

- `exp (logGamma δ s) = Γ(s)` for `s ∈ S_δ`.
- *logGamma* `δ` is holomorphic on `S_δ`, since `exp` is a local biholomorphism.
- `2 ∈ S_δ` for `0 < δ < π`, and `Γ 2 = 1`, so the normalization is consistent.
- Two values `δ ≤ δ'` give branches agreeing on `S_{δ'}`.

The hypothesis `δ > 0` is the angular margin that makes the asymptotic of 1.2 uniform: at `δ = 0`
the set `S_0` is `{‖s‖ > 1}` minus the negative real axis, which is still simply connected, but the
poles of `Γ` at the negative integers lie on its boundary and the error term in 1.2 is not uniform
there. At `δ ≥ π` the set is empty.

*Needs:* Mathlib `Complex.exists_continuousOn_eqOn_exp_comp`, `Complex.Gamma_ne_zero`.

**Checks.**

- *logGamma* `δ 3 = log 2` exactly: `Γ` is positive real on `[2, 3]` and the branch is continuous
  from its value `0` at `2`; a branch shifted by `2πi` gives `log 2 + 2πi`.
- `Re (logGamma δ s) = log ‖Γ(s)‖` on `S_δ`, whatever the normalization; only the imaginary part
  is pinned by the value at `2`.
- `Complex.log ∘ Γ` is not a branch: along the ray `arg s = π/2` the argument of `Γ(it)` is
  `t log t − t − π/4 + o(1)`, which crosses every odd multiple of `π`, where the principal
  logarithm jumps by `2πi`; a definition through it fails the holomorphy clause.

### 1.2 Stirling on the sector

For `0 < δ < π`, uniformly on `S_δ`,
`logGamma δ s = (s − 1/2) Complex.log s − s + Real.log (2π)/2 + O(1/‖s‖)` as `‖s‖ → ∞`, with
`Complex.log` the principal branch (legitimate since `S_δ` lies in the slit plane). The implied
constant depends on `δ` (NIST DLMF §5.11).

*Needs:* 1.1; Mathlib `Complex.Gamma`, `Complex.GammaIntegral`, the Binet or Euler–Maclaurin
route through `Complex.digamma`.

### 1.3 Vertical strips

For every compact `[a, b] ⊆ ℝ`,
`log ‖Γ(σ + it)‖ = (σ − 1/2) log |t| − π|t|/2 + log(2π)/2 + O(1/|t|)` uniformly for `σ ∈ [a, b]`
as `|t| → ∞`, along `cocompact ℝ`. This additive form composes over products.

*Needs:* 1.2.

### 1.4 Digamma and the logarithmic derivatives of the gamma factors

`Complex.digamma s = Complex.log s + O(1/‖s‖)` on `S_δ`; and exactly
`logDeriv Gammaℝ s = digamma (s/2)/2 − (log π)/2` and `logDeriv Gammaℂ s = digamma s − log (2π)`
at every `s` off the poles.

*Needs:* 1.2; Mathlib `Complex.digamma`, `Complex.Gammaℝ`, `Complex.Gammaℂ`.

### 1.5 The gamma factor of a record

For `γ = d.gammaFactor` of degree `n = d.degree` and every compact `[a, b]`:
`log ‖γ(σ + it)‖ = −(π n/4)|t| + A(σ) log |t| + O(1)` uniformly for `σ ∈ [a, b]` as `|t| → ∞`, with
`A(σ) = ∑_j (σ + Re μ_j − 1)/2 + ∑_k (σ + Re ν_k − 1/2)`. Also: `γ` has no zeros, and its poles are
exactly the points `−μ_j − 2m` and `−ν_k − m` (`m : ℕ`), with orders read off `meromorphicOrderAt`
and assembled into the divisor of `γ`.

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
- *invGammaFactor* of the `ζ` record satisfies `OrderLE _ 1` and not `OrderLE _ (1/2)`, since
  `1/Gammaℝ(−x)` grows like `exp((x/2) log x)` along the negative reals; the exponential-type
  model is excluded as in Layer 0.

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
  `regular_away` and the removable extension.
- `continuedL d s = LSeries d.coeff s` for `1 < Re s`, from `HasDirichletAgreement.completes`;
  at the finitely many poles of `γ` in that half-plane by the identity theorem.
- `Λ(s) = N^{s/2} γ(s) continuedL d s` as an equality of germs at every `s`; pointwise only where
  `γ` is regular, since at a pole of `γ` the product multiplies the junk value `0` by a zero.
- The functional equation against the dual record, as germs at every `s`:
  `γ(s) continuedL d s = ε N^{1/2 − s} γ_dual(1 − s) continuedL d.dual (1 − s)`, from
  `hasFunctionalEquation_eventuallyEq`. Pointwise it holds at `s` when `γ` is regular at `s`,
  `γ_dual` is regular at `1 − s`, `polarOrder s = 0` and `polarOrder (reflectedPoint s) = 0`.
- `continuedL riemannZetaData = riemannZeta`, `continuedL (dedekindZetaData K) = dedekindZetaC K`
  and `continuedL (heckeData χ) = heckeLFunctionC χ.character`.

*Needs:* *invGammaFactor*; L-functions Layer 0 `HasDirichletAgreement`,
`HasMeromorphicContinuation`, `hasFunctionalEquation_eventuallyEq`, `AnalyticLFunctionData.dual`,
Layers 3 and 5 for the family comparisons; Mathlib `riemannZeta`, `riemannZeta_zero`.

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
- For a non-real primitive character the functional equation relates `χ` to `χ⁻¹`; a statement of
  the form `continuedL d s ↔ continuedL d (1 − s)` fails at the quartic character modulo `5`.

### Examples

- The `ζ` record: *logGamma*, the `Gammaℝ` asymptotic, *invGammaFactor* `= Gammaℝ⁻¹`, and
  *continuedL* `= riemannZeta` with `ζ(0) = −1/2`.
- The Dedekind record of an imaginary quadratic field: `γ = Gammaℂ`, divisor `−1` at every
  nonpositive integer, *continuedL* `= dedekindZetaC K`.

### Dependencies

Mathlib: `Complex.exists_continuousOn_eqOn_exp_comp`, the Gamma and digamma API, the entire
reciprocal gamma functions, `riemannZeta`. L-functions Layers 0, 3, 5. Layer 0 for the record's
predicates.

## Layer 2: the analytic conductor

Define *arithmeticConductor*, *analyticConductorAt* and *centralAnalyticConductor* as in the
conventions.

- `1 ≤ analyticConductorAt d s`, and each archimedean factor is at least `3`.
- **Two-sided comparison.** For `a ≤ b` there are `C₁, C₂ > 0` depending only on `a`, `b`, the
  degree and a bound for the spectral parameters, not on the arithmetic conductor, with
  `C₁ N (|t| + 3)^n ≤ analyticConductorAt d (σ + it) ≤ C₂ N (|t| + 3)^n` for `σ ∈ [a, b]`.
- **Normalization translation.** For a `NormalizationTranslation` of weight `w`,
  `analyticConductorAt analytic s = analyticConductorAt arithmetic (s + w/2)`, and
  `continuedL analytic s = continuedL arithmetic (s + w/2)` as germs at every `s`, derived from
  `completed_eq`, `gammaR_eq`, `gammaC_eq` and `conductor_eq` (the analytic shifts are the
  arithmetic ones plus `w/2`).
- **Newform specialization (2.4).** For the record of a weight-`k` newform of level `N`, with
  `gammaR = ∅` and `gammaC = {(k − 1)/2}`,
  `analyticConductorAt d s = N (‖s + (k − 1)/2‖ + 3)(‖s + (k + 1)/2‖ + 3)`, the modular forms
  roadmap's displayed quantity.
- **Families.** *arithmeticConductor* is `|d_K|` for `dedekindZetaData K` and `|d_K| 𝔑(𝔣)` for
  `heckeData χ` of conductor `𝔣`.

*Needs:* L-functions Layer 0 `AnalyticLFunctionData`, `NormalizationTranslation`, Layers 3 and 5;
Layer 1.6.

**Checks.**

- For the `ζ` record, `analyticConductorAt d s = ‖s‖ + 3`, and *centralAnalyticConductor* is
  `7/2`.
- For `gammaR = {i}` the factor `‖s + i‖ + 3` decreases as `Im s` approaches `−1`, so
  *analyticConductorAt* is not monotone in `|Im s|`; the two-sided comparison still holds.
- At weight `w = 0` the translation is the identity; at a weight-`k` newform, arithmetic
  `gammaC = {0}` becomes analytic `gammaC = {(k − 1)/2}` and the central points `k/2` and `1/2`
  correspond. The opposite sign convention `μ_an = μ_ar − w/2` fails the second test.

### Examples

- `ζ`: conductor `1`, *analyticConductorAt* `‖s‖ + 3`.
- A primitive Dirichlet character modulo `q`: `q (‖s + a‖ + 3)` with `a ∈ {0, 1}` its parity.

### Dependencies

L-functions Layers 0, 3, 5; Layer 1.6 for the translation of *continuedL*.

## Layer 3: convexity in vertical strips

Convexity is a statement about the uncompleted *continuedL*. Bounding `Λ` polynomially and
dividing by `γ`, which decays like `exp(−π n |t|/4)`, gives an exponentially growing bound; the
Phragmén–Lindelöf interpolation is therefore run on the pole-cleared uncompleted function, whose
edge bounds are polynomial in the conductor.

### 3.1 The Phragmén–Lindelöf input

If `g` is holomorphic on a neighbourhood of a closed strip, of finite order there, and bounded by
`C(1 + |t|)^a` and `C(1 + |t|)^b` on the two edges, then it is bounded by `C'(1 + |t|)^{ℓ(σ)}` on
the strip, `ℓ` the linear interpolation. Consume `Complex.PhragmenLindelof.vertical_strip`; the
work is its growth hypothesis, which order-one growth satisfies. It is never applied to a function
with a pole in the strip.

*Needs:* Mathlib `Complex.PhragmenLindelof.vertical_strip`.

### 3.2 The two edges

For `δ > 0`: on `Re s = 1 + δ`, `‖continuedL d s‖ ≤ C(δ)` by the average coefficient bound; on
`Re s = −δ`, `‖continuedL d s‖ ≤ C(δ) analyticConductorAt d s ^ (1/2 + δ)` by the functional
equation of 1.6 against `d.dual` together with the gamma-quotient estimate
`log ‖γ_dual(1 − s)/γ(s)‖ = (n/2)(1 + 2δ) log |t| + O(1)`, in which the two exponentials cancel
because conjugating the shifts changes no real part. That cancellation is a named sub-target.

*Needs:* 1.5, 1.6, 2.2; L-functions Layer 0 average coefficient growth.

### 3.3 The strip bound and convexity

Define the **clearing polynomial** *clearingPoly* `d δ`, the monic `∏_p (X − p)^{n_p}` over the
poles `p` of *continuedL* `d` with `Re p ∈ [−δ, 1 + δ]`, `n_p` the pole order; and, for a
polynomial `P` whose roots dominate those poles, the **pole-cleared function**
*poleClearedContinuedL* `d P`, the removable analytic extension of `s ↦ P.eval s · continuedL d s`
across the roots of `P`.

- *poleClearedContinuedL* `d P` agrees with `P · continuedL d` off the roots of `P` and is analytic
  on a neighbourhood of the closed strip.
- `meromorphicOrderAt (poleClearedContinuedL d P) z = meromorphicOrderAt (continuedL d) z +
  rootMultiplicity z P` at every `z`.
- It has finite order on the strip.

*Needs:* 1.6; Mathlib `Polynomial.rootMultiplicity`, removable singularities.

**Checks.**

- `poleClearedContinuedL riemannZetaData (X − 1) 1 = 1`, the residue of `ζ` at `1`, while the raw
  product `(1 − 1) · riemannZeta 1` is `0`; an upper bound stated for the raw product is satisfied
  by `0` and bounds nothing at the pole.
- *clearingPoly* of the `ζ` record for any `δ ∈ (0, 1)` is `X − 1`: the pole of `Λ` at `0` is
  cancelled by the pole of `Gammaℝ`, so `ζ` is regular there.
- For a nontrivial primitive Dirichlet character *clearingPoly* is `1` and
  *poleClearedContinuedL* is *continuedL*.

Then, for every `δ > 0` there is `C` with
`‖poleClearedContinuedL d P s‖ ≤ C (1 + |Im s|)^{deg P} analyticConductorAt d s ^ ((1/2 + δ)(1 + δ − σ)/(1 + 2δ))`
for `σ = Re s ∈ [−δ, 1 + δ]`. The arithmetic-conductor powers `N^{1/2+δ}` and `N^0` at the edges are
carried by hand, not interpolated, and reassembled with 2.2. Corollaries:

- **central-line convexity**: at `σ = 1/2` the exponent is `1/4 + δ/2`, so for every `ε > 0`,
  `‖continuedL d (1/2 + it)‖ ≤ C analyticConductorAt d (1/2 + it)^{1/4 + ε}` for a record whose
  polar support does not meet the critical line, `C` depending on `ε`, the degree, a bound for the
  spectral parameters, the constant in the average coefficient bound and a lower bound for the
  distance from the line to the polar support, and not on the arithmetic conductor. At `K = ℚ`,
  uniformly over primitive Dirichlet characters, this is `dirichletLFunction_convexity`;
- **wide strips above the poles**: for every closed strip `[a, b]` there are `C`, `B` and `T₀`
  with `‖continuedL d (σ + it)‖ ≤ C analyticConductorAt d (σ + it)^B` for `σ ∈ [a, b]` and
  `|t| ≥ T₀`, for every `T₀` strictly larger than the heights of the poles of *continuedL*, the
  constants depending on the margin. Layer 4.7 uses it on `[−2, 6]`.

*Needs:* 3.1, 3.2, *poleClearedContinuedL*, 2.2.

### 3.4 Finite order for the two families

*entireCompletion* of `dedekindZetaData K`, and of `heckeData χ` for a primitive finite-order
ray-class character, satisfies `OrderLE _ 1`; with Layer 0 both families have vertical-strip growth
with `T₀ = 2`. The route is the Mellin representation `exists_mellin_completedHeckeLFunction` (the
trivial character gives `completedDedekindZeta`) for `Re s > 1`, the functional equation for the
reflected half-plane, and 3.1 between them.

*Needs:* L-functions Layers 3 and 5 `exists_mellin_completedHeckeLFunction`,
`completedHeckeLFunction_one_sub_eventuallyEq`; 3.1; Layer 0.

### Examples

- `ζ(1/2 + it) ≪ |t|^{1/4 + ε}`, the `q = 1` case of `dirichletLFunction_convexity`.
- For a primitive character modulo `q`, `L(1/2, χ) ≪ q^{1/4 + ε}`.

### Dependencies

Mathlib `Complex.PhragmenLindelof.vertical_strip`. Layers 0, 1.5, 1.6, 2. L-functions Layers 0,
3, 5 (3.4 only).

## Layer 4: zero counting

### 4.1 The two counts

Define *divisorCount* `f U R : ℤ` and `zeroCount f U R : ℕ` as in the conventions.

- Both are finite sums when `R` is bounded and `f` is meromorphic on an open set containing its
  closure, by `LocallyFiniteSupport.finite_inter_support_of_isCompact`.
- *divisorCount* `= zeroCount` when `∀ z ∈ R, 0 ≤ divisor f U z`.
- Both are `0` when `R` is empty.
- `zeroCount f U R` is monotone in `R` where the divisor is nonnegative, and unchanged under
  enlargement exactly when the divisor vanishes on the difference.
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

### 4.2 The zero divisor of a record

For a record satisfying `HasMeromorphicContinuation`, `divisor Λ U` is nonnegative off
`polarOrder.support` and equals `−polarOrder` on it, and
`divisor (entireCompletion d) univ = divisor Λ univ + polarOrder`.

*Needs:* Layer 0; L-functions Layer 0.

### 4.3 Jensen's bound

From `AnalyticOnNhd.sum_divisor_le`: for `0 < r < R`, `f` analytic on `closedBall c R`,
`f c ≠ 0` and `‖f‖ ≤ M` on `sphere c R` with `1 ≤ M`, the number of zeros in `closedBall c r` is at
most `log (M/‖f c‖)/log (R/r)`. **Trailing-coefficient form**: if instead `f` has finite central
order `m` and trailing coefficient `a = meromorphicTrailingCoeffAt f c`, the count is at most
`m + (log (M/‖a‖) − m log R)/log (R/r)`, by applying the first form to `f(z)/(z − c)^m`.

*Needs:* Mathlib `AnalyticOnNhd.sum_divisor_le`, `meromorphicTrailingCoeffAt`.

**Checks.**

- `f z = z`, `c = 0`, `r = 1/4`, `R = 1/2`, `M = 1`: the count is `1` and the trailing form gives
  `1 + (0 + log 2)/log 2 = 2`, while replacing `‖f c‖` by `‖a‖` in the first form gives
  `log (M/‖a‖)/log (R/r) = 0`, which is false.
- `f z = 1 − z/2` with `c = 0`, `r = 1`, `R = 3/2` and `M = 2` (the maximum on `sphere 0 (3/2)` is
  `7/4`): its only zero is at `2`, the count in `closedBall 0 1` is `0`, and the bound
  `log 2/log (3/2) ≈ 1.71` is consistent.
- A rectangle lies in the disc through its corners, so only upper bounds transfer from discs to
  rectangles.

### 4.4 The local count for the two families

For `Λ` of `dedekindZetaData K` or of `heckeData χ`, and `T ≥ 2`, the number of zeros of
*entireCompletion* in `closedBall (1/2 + iT) 1` is `O(log analyticConductorAt d (iT))`, the
constant depending on the degree only. Route: base point `c = 2 + iT`, where the Euler product
gives `‖continuedL d c‖ ≥ ζ_K(2)^{−1}`; radii `3` and `4`; and the ratio bound
`sup_{sphere c 4} ‖entireCompletion d‖ / ‖entireCompletion d c‖ ≤ analyticConductorAt d (iT)^B`,
in which the two gamma factors are compared on the same height range by 1.5 and the uncompleted
factor is bounded by the wide-strip corollary of 3.3. Bounding *entireCompletion* alone and
dividing would leave `exp(+π n T/4)` in the ratio.

*Needs:* 4.3, 1.5, 1.6, 2.2, 3.3, 3.4; L-functions Layers 3 and 5 for the Euler product on
`Re s = 2`.

### 4.5 Counting functions

`N(T + 1) − N(T) = O(log analyticConductorAt d (iT))` for `T ≥ 2`, and
`N(T) = O(T log analyticConductorAt d (iT))`, from 4.4 by subdividing into unit-height rectangles
inside discs of radius `√2/2` centred on the critical line (Titchmarsh, Theorem 9.2, is the
`K = ℚ` case).

Define `N(T)` and `N±(T)` as in the conventions.

- `N` is monotone and right-continuous in `T`, and `N 0 = 0`.
- `N(T)` is finite for every `T`, and the zero set of `Λ` in the critical strip is discrete.
- `N±(T) = 2 N(T)` when the divisor of `Λ` is invariant under `ρ ↦ conj ρ` and `Λ` has no zero on
  the real segment `[0, 1]`; for `ζ_K` invariance follows from real coefficients, for a real
  character `χ` from `Λ(χ, conj s) = conj Λ(χ, s)`, and for a general `χ` the count of `χ` above
  the axis is the count of `χ⁻¹` below it.

*Needs:* 4.1, 4.4.

**Checks.**

- For `ζ`, `N(14) = 0` and `N(15) = 1`, the first zero having ordinate `14.1347…`; a count over
  `Ioc 0 T` with `T` exactly an ordinate includes that zero.
- For the quartic character modulo `5`, `N` above the axis for `χ` equals `N` below the axis for
  `χ̄`, and the two differ from each other in general.
- `N±` for `ζ` at `T = 100` is `58`, twice `N(100) = 29`; a symmetric count that also included the
  real axis would add the multiplicity of any real zero.

### 4.6 The comparison with Nevanlinna theory

For `f` meromorphic on `ℂ`: `zeroCount f univ (closedBall 0 r)` is the unintegrated count
`n(r)`; its log-weighted integral is `ValueDistribution.logCounting f 0 r`, the log-counting
function of the positive part of the divisor, and not the signed
`Function.locallyFinsuppWithin.logCounting (divisor f univ) r`; and
`n(r) log (R/r) ≤ N(R) − N(r)` for `0 < r < R`.

*Needs:* Mathlib `ValueDistribution.logCounting`, `ValueDistribution.log_counting_zero_sub_logCounting_top`.

**Checks.**

- `f z = z`: both carriers give `log r` for `r ≥ 1`.
- `f z = 1/z`: the zero count is `0`, while the signed log-counting function is `−log r`, so the
  inequality on the signed carrier would read `0 ≤ −log (R/r)`.
- `f z = z²`: `n(r) = 2` and the log-counting function is `2 log r`.

### Examples

- The first zero of `ζ` at height `14.1347…`.
- `ζ_{ℚ(i)} = ζ · L(χ₋₄)` (`dedekindZetaC_quadratic`), so the divisors add and a common zero would
  have order `2` on the left.

### Dependencies

Mathlib Jensen and divisor API, Nevanlinna counting. Layers 0, 1.5, 1.6, 2, 3.3, 3.4 (4.4–4.5).
L-functions Layers 0, 3, 5.

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
locally uniformly on `ℂ` (`multipliableLocallyUniformlyOn_one_add` with the estimate of 5.2), its
limit is entire, and its divisor is `divisor f univ`.

*Needs:* 5.1, 5.2; Mathlib `multipliableLocallyUniformlyOn_one_add`,
`tprod_one_add_ne_zero_of_summable`.

**Checks** for the canonical product.

- For `f z = 1 − z` the product is the single factor `E₁(z)`.
- For `f z = cos z` the zeros `±(k + 1/2)π` pair up, the exponential factors cancel in each pair,
  and the product is `∏ (1 − z²/((k + 1/2)²π²))`.
- For `f = exp` the support is empty and the product is `1`.

### 5.4 The entire logarithm

A nonvanishing entire `g` is `exp ∘ h` for an entire `h`, unique up to `2πi ℤ`: consume
`Complex.exists_continuousOn_eqOn_exp_comp` on `Set.univ` and upgrade continuity to holomorphy.

*Needs:* Mathlib `Complex.exists_continuousOn_eqOn_exp_comp`.

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

For `Λ₀ = entireCompletion d` of one of the two families:

- `0 ≤ ∑_ρ m_ρ Re (1/(s − ρ))` for `Re s > 1`, as an absolutely convergent sum of real parts, each
  summand strictly positive because `0 ≤ Re ρ ≤ 1 < Re s`;
- `Re b = −∑_ρ m_ρ Re (1/ρ)` under the reality hypothesis `Λ₀(conj s) = conj Λ₀(s)`, which `ζ_K`
  and a real character satisfy; it is false for a general entire function of order one, since
  multiplying by `exp (c s)` changes `b` and no zero. The non-real case is 6.4d;
- the number of zeros with `|Im ρ − T| ≤ 1` is `O(log analyticConductorAt d (iT))`, re-proved from
  the partial-fraction expansion.

*Needs:* 5.5, 3.4, 4.4; L-functions Layers 3 and 5.

### Examples

- `f s = exp (c s)`: `b = c`, `a = 0`, empty product.
- `f s = 1 − s`: `a = 0`, `b = −1`, `1 − s = exp(−s) E₁(s)`.
- `zetaEntireCompletion`, with `zetaEntireCompletion 0 = 1` and `Re b = −∑ Re (1/ρ)`.

### Dependencies

Mathlib infinite products, `Complex.borelCaratheodory`, `Complex.exists_continuousOn_eqOn_exp_comp`.
Layer 0 `OrderLE`, Layer 4.3; 5.6 additionally Layers 3.4 and 4.4 and L-functions Layers 3, 5.

## Layer 6: zero-free regions

Each statement names its family: the argument needs the Euler product, nonnegativity of the von
Mangoldt coefficients and the `3-4-1` inequality, none of which a general record has.

### 6.1 Quantitative 3-4-1

For `σ > 1` and three ray-class characters `1, χ, χ²` presented at the same modulus `𝔣`,
`3 (−logDeriv L₁)(σ) + 4 Re (−logDeriv L_χ)(σ + it) + Re (−logDeriv L_{χ²})(σ + 2it) ≥ 0`, with
`L_ψ = heckeLFunctionC ψ`: on `Re s > 1` each logarithmic derivative is
`∑_𝔞 Λ_K(𝔞) ψ(𝔞) 𝔑𝔞^{−s}` over the ideals prime to `𝔣`, and termwise the combination is
`Λ_K(𝔞) 𝔑𝔞^{−σ}(3 + 4 cos θ + cos 2θ)`, nonnegative by `three_four_one_nonneg` and
`dedekindZeta_idealVonMangoldt_nonneg`. All three series are presented at `𝔣` so that the Euler
products run over the same primes. It is a statement about convergent series on `Re s > 1` only.

*Needs:* L-functions Layers 5, 7, 8 `heckeLFunctionC`, `three_four_one_nonneg`,
`dedekindZeta_idealVonMangoldt_nonneg`, `dedekindZeta_logDeriv_eq`.

### 6.2 The region for the Dedekind zeta function

There is `c > 0`, depending only on `n = [K:ℚ]`, such that `ζ_K` has at most one zero `ρ` with
`Re ρ ≥ 1 − c/log analyticConductorAt d (i Im ρ)`, and such a zero is real and simple (Kadiri,
Theorem 1.1, gives explicit regions for `|Im s| ≥ 1` and `|Im s| ≤ 1` when `d_K` is large; the
passage to all fields of degree `n` is 6.4e). It is the trivial-character case of 6.4. At `K = ℚ`
this is `riemannZeta_zeroFreeRegion`, where no exceptional zero occurs because `ζ` has no real zero
in `(0, 1)`.

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
  through the deleted Euler factor; an uncapped constant with `c/log 3 ≥ 1` would put `0` in the
  region and break the comparison of 6.4b.
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
depends on `n = [K:ℚ]` alone and is chosen before `K` and `χ`. At `K = ℚ` this is
`dirichletLFunction_zeroFreeRegion`. No source proves the statement at this generality; it is
assembled from six targets.

- **(4a)** 6.1.
- **(4b) Imprimitive characters.** Consume `heckeLFunctionC_eq_primitive`. The zeros of
  `eulerCorrection` lie on `Re s = 0`, since `1 − w 𝔑𝔭^{−s} = 0` with `‖w‖ = 1` forces
  `𝔑𝔭^{−Re s} = 1`; `‖logDeriv eulerCorrection s‖ ≤ 2 log 𝔑𝔣` for `Re s > 1`; and for the trivial
  character the presented series is `dedekindZetaC K` times `finiteEulerCorrection`.
- **(4c) The real and non-real split.** `χ` is real iff `χ² = 1` iff
  `PrimitiveRayClassCharacter.inv χ = χ`. If `χ² ≠ 1` the third term of 6.1 is regular at `1`; if
  `χ² = 1` it carries the pole of `ζ_K`, which confines a surviving zero to the real axis.
- **(4d) Conductor dependence.** For a nontrivial primitive `χ` and `1 < σ ≤ 2`,
  `−Re (logDeriv L_χ)(σ + it) ≤ ½ log analyticConductorAt d (it) + O(1) − ∑_ρ Re (1/(σ + it − ρ))`,
  the sum over the zeros of `Λ(χ, ·)` with multiplicity, each summand positive by 5.6; and for the
  trivial character,
  `−(logDeriv ζ_K)(σ) ≤ 1/(σ − 1) + ½ log |d_K| + O(1) − ∑_ρ Re (1/(σ − ρ))`. The constants depend
  on `n` alone. The identity behind both is the partial-fraction expansion of `Λ'/Λ`, with the
  terms `½ log N`, the gamma logarithmic derivative, the sum over zeros, and, for the trivial
  character only, the pole terms `1/s + 1/(s − 1)` (Kadiri §2.1.2). The first bound fails at the
  trivial character: at `K = ℚ`, `t = 0`, `σ = 1 + u`, the left side is `1/u + O(1)` while the
  right side stays bounded as `u → 0⁺`. For a non-real `χ`, `Re b(χ) = −∑_ρ Re (1/ρ)` is proved
  here: the functional equation against `PrimitiveRayClassCharacter.inv χ` (`completedHeckeLFunction_one_sub`)
  gives `b(χ) + b(χ⁻¹) = −∑_ρ (1/ρ + 1/(1 − ρ))`, conjugation `Λ(χ⁻¹, s) = conj Λ(χ, conj s)` gives
  `b(χ⁻¹) = conj b(χ)`, and the composite `ρ ↦ 1 − conj ρ` permutes the zeros of `Λ(χ, ·)`. The
  discriminant term in the `ζ_K` bound is needed: for `K = ℚ(√D)` with `D` a prime
  `≡ 1 (mod 8 ∏_{p ≤ B} p)` every `p ≤ B` splits, which pushes `−ζ'_K/ζ_K(σ)` above
  `2/(σ − 1) − O(1)` for `σ` near `1` and defeats any degree-two constant.
- **(4e) Small conductors.** For fixed `n` and any `X` there are finitely many pairs `(K, χ)` with
  `[K:ℚ] = n` and `|d_K| 𝔑𝔣 ≤ X` (Hermite–Minkowski, finitely many moduli of bounded norm, and
  `TauCeti.GlobalNumberFields.finite_rayClassGroup`); the residual cases are closed by 6.5 and
  discreteness of the zeros, and `c` is the minimum of finitely many constants.
- **(4f) Uniqueness and simplicity.** For real `χ`, the argument bounds the sum of `Re (1/(σ − ρ))`
  over the zeros in the region with multiplicity, using nonnegativity of `Λ_K(𝔞)(1 + χ(𝔞))`; two
  zeros and one double zero are refuted by the same inequality. This is per character.

*Needs:* 6.1; 5.6; 2.2; Layer 4; L-functions Layers 5 and 7 `heckeLFunctionC_eq_primitive`,
`eulerCorrection`, `finiteEulerCorrection`, `PrimitiveRayClassCharacter.inv`,
`completedHeckeLFunction_one_sub`, `norm_heckeRootNumber`; Tau Ceti
`TauCeti.GlobalNumberFields.finite_rayClassGroup`.

### 6.5 The edges

For `Λ` either `Λ_K` or `Λ(χ, ·)`, `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 1`, and by the functional
equation `∀ ρ, 0 < divisor Λ univ ρ → ρ.re ≠ 0`. The first is `heckeLFunction_ne_zero_of_one_le_re`
read through the order; at `K = ℚ` it is `riemannZeta_ne_zero_of_one_le_re`.

*Needs:* L-functions Layer 7 `heckeLFunction_ne_zero_of_one_le_re`, Layer 5
`completedHeckeLFunction_one_sub_eventuallyEq`.

### Examples

- `riemannZeta_zeroFreeRegion`: `ζ(s) ≠ 0` for `Re s ≥ 1 − c/log(|Im s| + 3)`, `s ≠ 1`.
- `dirichletLFunction_zeroFreeRegion`, with the exceptional zero allowed for real characters and
  the cap `c ≤ log 3/2`.
- For a real character neither branch of the disjunction follows from the other targets.

### Dependencies

L-functions Layers 3, 5, 7, 8. Layers 2, 4, 5.6. Tau Ceti ray-class finiteness.

## Layer 7: the Riemann–von Mangoldt formula

Layer 4 gives inequalities; the exact count needs the argument principle, which Tau Ceti proves for
a closed piecewise-`C¹` null-homologous curve (`TauCeti.Contour.argumentPrinciple_nullHomologous`,
an ordinary interval integral with no principal value). This layer builds the rectangle on top of
it.

### 7.1 The rectangle as a contour

For a valid rectangle `R = Icc σ₁ σ₂ ×ℂ Icc t₁ t₂`, define *rectBoundary* `R : ℝ → ℂ` on `[0, 4]`,
traversing the four edges counterclockwise with breakpoints `1, 2, 3`.

- `TauCeti.Contour.IsPiecewiseC1On (rectBoundary R) 0 4` and `rectBoundary R 0 = rectBoundary R 4`.
- Its image is the topological boundary `∂R` when `R` is nondegenerate (`σ₁ < σ₂`, `t₁ < t₂`).
- `TauCeti.Contour.windingNumber (rectBoundary R) 0 4 z = 1` for `z` in the interior of `R`, and
  `0` for `z ∉ R`.
- `TauCeti.Contour.IsNullHomologous (rectBoundary R) 0 4 U` for every open `U ⊇ R`, since `R` is
  convex.

*Needs:* Tau Ceti `TauCeti.Contour.IsPiecewiseC1On`, `TauCeti.Contour.windingNumber`,
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
`regular_away` and *entireCompletion* and *continuedL* inherit), and a valid rectangle `R ⊆ U` with
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

For `f` analytic and nonvanishing at every point of `∂R`, the image curve misses `0`, and
`TauCeti.Contour.exists_continuousOn_arg_lift_with_partition` gives a continuous `θ` with
`f(rectBoundary R t) = ‖f(rectBoundary R t)‖ exp(i θ t)`;
`TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv` identifies
`(θ 4 − θ 0)/(2π)` with *divisorCount* `f U R` through 7.2. Only differences `θ b − θ a` are used.
Define *S* `(T)` as `π⁻¹` times the variation of a continuous argument of `riemannZeta` along the
path `2 → 2 + iT → 1/2 + iT`, starting from the argument `0` of the positive real `ζ(2)`, for `T`
not an ordinate.

*Needs:* 7.2; Tau Ceti `TauCeti.Contour.exists_continuousOn_arg_lift_with_partition`,
`TauCeti.Contour.windingNumber_comp_eq_integral_logDeriv`.

**Checks.**

- On the vertical segment from `2` to `2 + iT`, `Re ζ(2 + it) ≥ 2 − ζ(2) > 0`, so the argument
  stays in `(−π/2, π/2)` there.
- For small `T > 0` the path passes just above the pole at `1`, where `ζ(s) ≈ 1/(s − 1)`, and the
  argument decreases by nearly `π`; so *S* `(T) → −1` as `T → 0⁺`, matching
  `N(T) = θ(T)/π + 1 + S(T)` with `N(T) = 0` and `θ(0) = 0` (Titchmarsh §9.3).
- A definition started at the argument `2π` of `ζ(2)` shifts every value of *S* by `2`.

### 7.4 Riemann–von Mangoldt for ζ, and boundary heights

`N(T) = (T/2π) log (T/(2πe)) + O(log T)` for every `T ≥ 2`: `riemannVonMangoldt` (Titchmarsh,
§§9.2–9.4, Theorem 9.4). Route: 7.2 on `Icc (−1) 2 ×ℂ Icc 0 T` applied to `zetaEntireCompletion`
(the poles of `Λ` lie on the bottom edge), 4.2 to pass back to `Λ`, confinement of the zeros to the
critical strip, the main term from 1.5 and the error from 3.3 and 7.3. For `T` the ordinate of a
zero, the formula follows from the case of non-ordinates by right-continuity of `N` (4.5) and
discreteness of the ordinates, the main term moving by `O(η log T)` over an interval of length `η`.

*Needs:* 7.2, 7.3, 1.5, 3.3, 4.2, 4.5, 6.5.

### 7.5 Uniformity in the conductor

For `Λ_K` of degree `n`,
`N±_K(T) = (T/π) log(|d_K| (T/(2πe))^n) + O(log(|d_K| T^n))` for `T ≥ 2`, with the implied constant
depending only on `n` and chosen before `K`; and for `Λ(χ, ·)` the same with `|d_K| 𝔑𝔣` in place of
`|d_K|`. The one-sided form halves the whole main term, `(T/2π) log(|d_K|(T/(2πe))^n)`; halving
inside the logarithm (`|d_K|^{1/2}`) is false. The degree-one instance for a primitive Dirichlet
character modulo `q`, uniform in `q`, is `riemannVonMangoldt_dirichlet` (Trudgian, Theorem 1, for
`χ` nonprincipal, with absolute constants; Theorem 2 is the Dedekind case; Davenport §16). The
Hecke case over a general `K` is the argument of 7.4 run on *entireCompletion*, with 4.4–4.5 for
the error.

A generic-record form needs Dirichlet agreement, the average coefficient bound and confinement of
the zeros of the entire completion to the closed strip, besides continuation, functional equation
and growth: the record with completed function `1`, `gammaR = {0}` and empty polar divisor has no
zeros and a main term of order `T log T`, and is rejected only by Dirichlet agreement; the record
`ζ(s)(1 + 5·2^{−s} + 2·4^{−s})` of conductor `4` has its extra zeros on `Re s ≈ 2.19` and
`Re s ≈ −1.19`, and is rejected only by confinement.

*Needs:* 7.4, 4.4, 4.5, 1.5, 2.2, 6.5; L-functions Layers 3, 5.

### 7.6 Corollaries

For fixed `K`: `N(T)/(T log T) → n/(2π)`; `Λ` has infinitely many zeros; and
`T⁻¹ ∫_0^T (N(t + 1) − N(t)) dt / log T → n/(2π)`. No pointwise asymptotic for `N(T + 1) − N(T)`
follows, since the error in 7.5 has the size of that difference's main term.

*Needs:* 7.5.

### Examples

- `N(100) = 29` and `N±(100) = 58` for `ζ`, given a certificate (Layer 9).
- For `K` imaginary quadratic of discriminant `D`, 7.5 reads
  `N±_K(T) = (T/π) log(|D| (T/(2πe))²) + O(log(|D| T²))`, the sum of the `ζ` count
  `(T/π) log(T/(2πe))` and the `L(χ_D)` count `(T/π) log(|D| T/(2πe))`; the halved conductor is
  short by `(T/2π) log |D|`, unbounded in `D`.

### Dependencies

Tau Ceti contour integration. Layers 1.5, 3.3, 4, 6.5. L-functions Layers 3, 5.

## Layer 8: the explicit formula and effective prime counts

Fix `r₁, r₂` the real and complex places of `K`, `γ_K = Gammaℝ^{r₁} Gammaℂ^{r₂}`, and
`Λ_K(s) = |d_K|^{s/2} γ_K(s) ζ_K(s)`.

### 8.1 Truncated Perron, consumed

Apply `TauCeti.perronFormula` and `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` for `x > 0`,
`c > 0`, `T ≥ 1`, with `x` off the norms; at `x` a norm the finite-height kernel value is
`π⁻¹ arctan(T/c)` (the Arithmetic Dirichlet Series roadmap's `truncatedPerronKernel_one`).

*Needs:* Tau Ceti `TauCeti.perronFormula`, `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le`.

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

With `ψ_K(x) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞)` (`TauCeti.IdealArithmeticFunction.vonMangoldt`), for
`2 ≤ T ≤ x` and `x` not a prime-power norm,

```text
ψ_K(x) = x − ∑_{|Im ρ| ≤ T} m_ρ x^ρ/ρ − (r₁ + r₂ − 1) log x + c_K
         − ((r₁ + r₂)/2) log(1 − x^(−2)) + (r₂/2) log((x + 1)/(x − 1))
         + O(x log x log(xT)/T),
```

`m_ρ = (divisor Λ_K univ ρ).toNat`, the constant depending on `K`. With the signed divisor the poles
at `0` and `1` would be subtracted a second time. At `K = ℚ` it is
`chebyshevPsi_explicitFormula` (Davenport §17), where `T ≤ x` absorbs the near-prime-power term.

*Needs:* 8.2; Tau Ceti `TauCeti.IdealArithmeticFunction.vonMangoldt`; L-functions Layer 8
`dedekindZeta_logDeriv_eq`.

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

*Needs:* 8.2, 4.5, 1.4; Mathlib `mellin`, `mellinInv_mellin_eq`; L-functions Layer 8.

**Checks** for the test class and the formula.

- `φ = 0` satisfies the hypotheses and both sides are `0`.
- `ContDiff ℝ ⊤` in place of `ContDiff ℝ ∞` admits only `φ = 0`, since compactly supported
  real-analytic functions vanish; the formula would be tested on nothing.
- At `K = ℚ` with a nonnegative nonzero `φ`, `P = φ̃(0) + φ̃(1) > 0`; writing the signed divisor on
  the zero side subtracts `P` from the left, so the identity fails by exactly `P`.
- The archimedean term at `K = ℚ` contains `−(log π) φ(1)`, from the constant `−(log π)/2` of
  `logDeriv Gammaℝ` integrated against `φ̃(s) + φ̃(1 − s)`.

### 8.5 The prime ideal theorem with an error term

For fixed `K` there is `c > 0` with `ψ_K(x) = x − x^β/β + O(x exp(−c √log x))` under
*IsExceptionalZero* `1 β` (the trivial character, whose completion is `completedDedekindZeta`), and
`ψ_K(x) = x + O(x exp(−c √log x))` when there is none. For fixed `K` the two are the same estimate,
since `x^β = o(x exp(−c √log x))` for fixed `β < 1`; the term is carried for its meaning, and only a
conductor-uniform absorption would need Siegel's theorem. By Abel summation
(`TauCeti.idealSummatory_mul_eq_sub_integral_mul`) the number of nonzero prime ideals of norm at
most `x` is `Li x + O(x exp(−c √log x))`, `Li = TauCeti.Real.logIntegral`: this is
`primeIdealCount_effective` (Davenport §18 for `K = ℚ`).

*Needs:* 8.3, 6.2, 6.3; Tau Ceti `TauCeti.idealSummatory_mul_eq_sub_integral_mul`,
`TauCeti.Real.logIntegral`.

### 8.6 The Hecke instance

For `χ` primitive, nontrivial, of conductor `𝔣`, with `γ_χ = ∏_{j ≤ r₁} Gammaℝ(s + a_j) Gammaℂ^{r₂}`:
8.2–8.4 hold with `ψ_K(x, χ) = ∑_{𝔑𝔞 ≤ x} Λ_K(𝔞) χ(𝔞)`; no `x` term and no `φ̃(0) + φ̃(1)`
(`Λ(χ, ·)` is entire); prime side `−∑_𝔞 Λ_K(𝔞)(χ(𝔞) φ(𝔑𝔞) + conj χ(𝔞) φ̌(𝔑𝔞))`, the conjugate
coming from the reflection to `χ⁻¹`; order `#{j : a_j = 0} + r₂` at `s = 0` (with
`Λ(χ, 0) ≠ 0` from 6.5) and `#{j : a_j ≡ m [MOD 2]} + r₂` at `−m`; and `log(|d_K| 𝔑𝔣)` in place of
`log |d_K|`. For fixed `K` and `χ`: `ψ_K(x, χ) = −x^β/β + O(x exp(−c √log x))` under
*IsExceptionalZero* `χ β`, and `O(x exp(−c √log x))` otherwise (Davenport §§19–20 for `K = ℚ`).

*Needs:* 8.2–8.5, 6.3–6.5, 1.5.

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
  coefficient of `dedekindZeta_logDeriv_eq`.
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

For fixed `K` and `𝔪` there is `c₀ > 0` with

```text
rayClassPsi 𝔪 c x = x/#Cl_𝔪 − exceptionalRayClassTerm 𝔪 c x + O(x exp(−c₀ √log x)),
```

and the number of prime ideals prime to `𝔪`, of norm at most `x`, in the class `c` is
`Li x/#Cl_𝔪 − exceptionalRayClassPrimeCountTerm 𝔪 c x + O(x exp(−c₀ √log x))`. The trivial
character gives the main term `x/#Cl_𝔪` through 8.5. The finite Euler correction at the primes of
`𝔪` does **not** enter the main coefficient: deleting those Euler factors changes the logarithmic
derivative by a function regular at `s = 1`, and changes the prime-power sum by
`O(log x)`. The main coefficient of the prime count is therefore `1/#Cl_𝔪`, not the ideal-counting
constant `TauCeti.GlobalNumberFields.rayClassIdealMainTerm 𝔪`, which multiplies the Dedekind-zeta
residue by that correction and governs the count of all ideals in a class. Each nontrivial
character enters through 8.6 after 6.4b replaces it by its primitive source; the zeros agree on
`Re s > 0`, and the deleted factors move the logarithmic derivative by `O(log 𝔑𝔪)`. The passage to
the prime count is Abel summation, `x^β/β` becoming `Li(x^β) − Li(2^β)` under `u = t^β`, legitimate
because `β ≥ 1/2` (6.3). `x/log x` is not an admissible main term: `Li x − x/log x ∼ x/log² x`,
which is not `O(x exp(−c √log x))`. At `K = ℚ` and `𝔪 = (q)∞` this is
`primeCounting_progression_effective` (Davenport §20), with main term `Li x/φ(q)`.

*Needs:* 8.5, 8.6, 6.3, 6.4b; L-functions Layers 2, 5 `partialZeta_eq_sum_heckeLFunctionC`,
`PrimitiveRayClassCharacter.of`; Tau Ceti `TauCeti.GlobalNumberFields.RayClassGroup`,
`TauCeti.GlobalNumberFields.idealClass`, `TauCeti.GlobalNumberFields.integralIdealsPrimeTo`,
`TauCeti.IdealArithmeticFunction.vonMangoldt`, `TauCeti.idealSummatory_mul_eq_sub_integral_mul`,
`TauCeti.Real.logIntegral`.

**Checks.**

- `K = ℚ`, `𝔪 = (3)∞`: `#Cl_𝔪 = 2`, and the primes `≡ 1` and `≡ 2 (mod 3)` each have `ψ`-coefficient
  `1/2`; `rayClassIdealMainTerm 𝔪 = (1/2)(1 − 1/3) = 1/3`, the coefficient of the count of all
  integers `≡ 1 (mod 3)` up to `x`, which is a different count.
- `K = ℚ`, `𝔪 = 1`: one class, *rayClassPsi* is `Chebyshev.psi`, and the exceptional term is `0`
  because `ζ` has no real zero in `(0, 1)`.
- `K = ℚ(√−5)`, `𝔪 = 1`: two classes, the principal and non-principal prime ideals each with
  coefficient `1/2`; the split primes `p ≡ 1, 9 (mod 20)` have principal factors.

### 8.8 Effective Chebotarev for an abelian extension

For `L/K` finite Galois and `C : ConjClasses (L ≃ₐ[K] L)`, the theorem is 8.7 transported along a
**reciprocity dictionary**, a hypothesis: a modulus `𝔪`, a surjective homomorphism
`Φ : RayClassGroup 𝔪 →* (L ≃ₐ[K] L)`, and the splitting law
`NumberField.artinSymbol 𝔭 hur = ConjClasses.mk (Φ (idealClass 𝔪 𝔭))` for every prime `𝔭` prime to
`𝔪` and unramified in `L`. The dictionary forces `Gal(L/K)` abelian, and Class Field Theory's
`rayClassArtinMap` with `rayClassArtinMap_idealClass` and `rayClassArtinMap_surjective`
discharges it at an admissible modulus. For fixed `L/K` there is `c₀ > 0` with

```text
frobeniusPsi C x = (#C/#G) x − exceptionalChebotarevTerm C x + O(x exp(−c₀ √log x)),
frobeniusPrimeCount C x = (#C/#G) Li x − exceptionalChebotarevPrimeCountTerm C x
                          + O(x exp(−c₀ √log x)),
```

on Tau Ceti's `NumberField.Chebotarev.frobeniusPsi` and `frobeniusPrimeCount`, where
*exceptionalChebotarevTerm* `C x` is defined from a dictionary as the sum over the characters
`ψ` of `Gal(L/K)` of `(#G)⁻¹ conj ψ(σ_C) ∑_β x^β/β`, `σ_C` the element of `C` and `β` running over
the exceptional zeros of `PrimitiveRayClassCharacter.of (ψ ∘ Φ)`. Two theorems accompany it: it
equals the sum of *exceptionalRayClassTerm* over the fibre `Φ⁻¹(σ_C)`, and it does not depend on
the dictionary, since two dictionaries induce the same primitive characters; without them the
term would be opaque and the estimate unfalsifiable. *exceptionalChebotarevPrimeCountTerm* is the
same with `Li(x^β)`. Then `NumberField.Chebotarev.tendsto_frobeniusPrimeCount` and
`NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet` are recovered by discarding the error
through `Li x ∼ x/log x`, as consistency theorems. Lagarias–Odlyzko prove the estimate for every
Galois `L/K` through Artin L-functions; the nonabelian case is not owned here.

*Needs:* 8.7; Tau Ceti `NumberField.artinSymbol`, `NumberField.Chebotarev.frobeniusPsi`,
`NumberField.Chebotarev.frobeniusPrimeCount`, `NumberField.Chebotarev.tendsto_frobeniusPrimeCount`,
`NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet`; Class Field Theory Layer 12 to
discharge the hypothesis.

**Checks.**

- `K = L = ℚ`, `C = ⟦1⟧`: `frobeniusPrimeCount` is `π`, the dictionary at `𝔪 = 1` is trivial, the
  exceptional term is `0`, and the estimate reads `π(x) = Li x + O(x exp(−c √log x))`.
- `L = ℚ(i)`, `K = ℚ`, `𝔪 = (4)∞`, `Φ` the isomorphism `(ℤ/4)ˣ ≅ Gal(L/ℚ)`: the class of complex
  conjugation counts the primes `≡ 3 (mod 4)`, coefficient `1/2`.
- With main term `x/log x` the `K = L = ℚ` case would assert
  `π(x) − x/log x = O(x exp(−c √log x))`, false since `(x/log² x)/(x exp(−c √log x)) → ∞`.

### 8.9 The logarithmic integral

`Li x − x/log x ∼ x/log² x` for `TauCeti.Real.logIntegral`, from
`TauCeti.Real.logIntegral_eq_div_log_sub_add` and one more integration by parts.

*Needs:* Tau Ceti `TauCeti.Real.logIntegral_eq_div_log_sub_add`.

**Checks.**

- `TauCeti.Real.logIntegral 2 = 0`, the offset normalization; the unshifted `li` has `li 2 ≈ 1.045`.
- `Li x − x/log x − x/log² x = O(x/log³ x)`.
- `x/log x − Li x` is negative for large `x`, so a main term `x/log x` undercounts.

### Examples

- `chebyshevPsi_explicitFormula` and `riemannZeta_weilExplicitFormula` at `K = ℚ`.
- `primeIdealCount_effective` at `K = ℚ` is `π(x) = Li x + O(x exp(−c √log x))`.
- `primeCounting_progression_effective` at `q = 4`, `a = 3`.

### Dependencies

Tau Ceti arithmetic Dirichlet series, ray classes, Artin symbol, Chebotarev counting, logarithmic
integral. Mathlib Mellin transform. Layers 1.4, 1.5, 4.5, 5.6, 6, 7.2. L-functions Layers 2, 3,
5, 8. Class Field Theory Layer 12 (8.8).

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
  large) and §2.1.2 (the explicit formula behind 6.4d).
- T. S. Trudgian, *An improved upper bound for the error in the zero-counting formulae for
  Dirichlet L-functions and Dedekind zeta-functions*, Math. Comp. 84 (2015), 1439–1450 —
  Theorem 1 (primitive nonprincipal `χ`, zeros with `0 < β < 1` and `|γ| ≤ T`, main term
  `(T/π) log(kT/2πe)`, error `C₁ log kT + C₂` with absolute constants) and Theorem 2 (the Dedekind
  case, main term `(T/π) log(d_K (T/2πe)^{n_K})`).
- S. Lang, *Algebraic Number Theory*, 2nd ed., GTM 110 — XVII §3, Theorems 3.1 and 3.2 (Weil's
  explicit formula and `Λ'/Λ` as a limit over zeros); XVII §§1–2; XV §§4–5. Cited by locator.
- H. Iwaniec, E. Kowalski, *Analytic Number Theory*, AMS Colloquium Publications 53 — §5.1 (the
  analytic conductor (5.7)) and §5.2 (convexity). Cited by locator.
- J. C. Lagarias, A. M. Odlyzko, *Effective versions of the Chebotarev density theorem*, in
  *Algebraic Number Fields* (1977) — effective counting in a fixed Galois extension.
- NIST Digital Library of Mathematical Functions, §5.11 — Stirling's expansion of `log Γ` on a
  sector.
