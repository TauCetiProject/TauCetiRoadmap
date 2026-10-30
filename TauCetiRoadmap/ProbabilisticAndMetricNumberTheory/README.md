# Roadmap: probabilistic, metric and ergodic number theory

**Summary.** Build the arithmetic probability and dynamical interfaces behind normal orders, Gaussian prime-factor laws, uniform distribution, metric rational approximation and continued-fraction statistics. The main results are Hardy–Ramanujan and Erdős–Kac, Weyl's polynomial theorem and Borel normality, Duffin–Schaeffer and Hausdorff mass transference, the pointwise ergodic theorem with Gauss digit/Khinchin/Lévy laws and quantitative Gauss–Kuzmin convergence, and the proved short-interval and logarithmic correlation theorems for multiplicative functions. Exact finite counting laws and explicit error terms connect the arithmetic statements to native probability measures.

## Scope and ownership

This roadmap owns additive arithmetic predicates and their prime-power representations, arithmetic specializations of empirical laws, growing-prime probabilistic comparisons, asymptotic equidistribution and its Fourier criteria, reduced-rational approximation and the GCD-graph method, mass transference, pointwise ergodic convergence, the Gauss system, and the specified multiplicative statistics. It also owns the concrete number-theoretic applications of modular homogeneous dynamics described in Layer 4.

Mathlib supplies `ArithmeticFunction`, `cardDistinctFactors` (ω), `cardFactors` (Ω), native continued fractions and positional digits, Haar measure on circles and tori, Gaussian measures and weak convergence. Tau Ceti supplies `Probability.empiricalMeasure`, Gaussian centered moments, conditional-expectation and martingale tools, and mean ergodic convergence. These are prerequisites. The pointwise theorem in §4.1 applies to every integrable observable; the existing L2 mean theorem and its L1 consequence under an L2 hypothesis supply a different statement. The Gaussian moment-to-weak specialization in §1.5 uses characteristic-function Taylor remainders. General moment convergence to a determinate law, with reusable tightness and uniform-integrability machinery, belongs to RandomMatrices Milestone 3 (the shared-foundations contract of FreeProbability).

Generic arithmetic functions, summation and Dirichlet series remain with Mathlib, Tau Ceti and [ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) (Export contract). AnalyticNumberTheoryPartI §§0.19, 0.21 owns reciprocal-prime estimates, §1.5 Dirichlet-polynomial mean squares, and §§3.18, 3.33 pretentious distance and Halász estimates; §§3.12a, 3.32, 3.41 supply analytic counts for the restricted squarefree family. The stronger analytic inputs are mathematical targets in §§0.13, 3.7, 5.1 and 5.2. The finite van der Corput estimate and the entropy-decrement argument belong here. DiophantineApproximationAndTranscendence §0.6 owns BadlyApproximable; this roadmap owns its characterization by bounded native partial denominators. AdelicAlgebraicGroups AA.2–AA.3 owns homogeneous quotients and finite invariant volume; GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 owns Howe–Moore, Moore ergodicity and Mahler compactness. IntegralLattices concerns integral quadratic and bilinear lattices. Möbius orthogonality to nilsequences is outside this roadmap. General Chowla and Sarnak are conjectures, not conclusions of Layer 5.

The finite weighted sums and exact remainder formulas specialize native counting, CRT and empirical-measure declarations; their generic counting and probability theorems are consumed under the pinned names below. The stronger summed rough-number, restricted Dirichlet, long-mean, high-twist Liouville, modulated short-sum, prime fourth-moment and divisor-bounded-mean statements are owned in §§0.13, 3.7, 5.1–5.2. These strengthen the generic mean-square and Halász inputs rather than treating those inputs as the desired conclusions. The sieve targets concern the full smooth/rough decomposition and arbitrary bounded prime phases; no smaller prime family is selected.

The arithmetic Lévy criterion is a specialization of Mathlib’s `MeasureTheory.tendstoInDistribution_iff_tendsto_charFun`; its finite empirical formula is recorded as a comparison, with no additional theorem required. Pointwise Birkhoff and finite Shannon entropy are owned here (§§4.1–4.3, 5.2). The finite Shannon API is independent of entropy decrement and the multiplicative correlation theorems. ArithmeticDynamics §§2.6–2.7 owns finite measurable partitions, their joins, dynamical entropy, Shannon–McMillan–Breiman and ergodic decomposition; the foundational interface offered to that development is specified under Downstream consumers.

The constant-tail conditional-expectation and reverse-L¹ statements are supplied by the two Tau Ceti declarations below rather than separate targets. The explicit constant-four cylinder bound in §4.6 supplies the Rényi comparison used here. The summability and Gauss logarithmic-integral statements each have one owning target in §4.7; their uses in integrability and growth consume those targets.

## Conventions

Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` as implementation pins. Use native measures, probability measures and conditional expectations. Real, complex and torus carriers have their Borel structures; the abstract probability spaces in Layers 0 and 4 may have arbitrary measurable structures. Finite sets use `Finset`; repeated observations keep their multiplicity. Real and complex arithmetic functions retain their value zero at input zero. Multiplication in `ArithmeticFunction` is Dirichlet convolution; a pointwise product of observations is written explicitly.

For m∈ℕ put N=m+1 and let μ_N be the existing `TauCeti.Probability.empiricalMeasure (fun k => k+1) m`. It samples exactly 1,…,N, with

```text
∫ F dμ_N = (1/N) Σ_{0≤k<N} F(k+1).
```

This is notation for a specialization. There is no empty-sample probability theorem. All functions on the discrete natural carrier are measurable, and the finite Dirac decomposition gives integrability. Probabilities in numerical formulas are real values (`Measure.real` or `toReal`). Floor division of naturals takes place before casting. All denominators in finite arithmetic probability formulas are positive. Finite prime sets have no repeats, but ordered tuples in moment expansions may repeat a prime.

Use `UnitAddCircle` = ℝ/ℤ and `UnitAddTorus d` = d→ℝ/ℤ for finite d. Write e(t)=exp(2πit) and k·α=Σ_i k_i•α_i. Sequence averages include indices 0,…,n and have denominator n+1. Classical averages over 1,…,N agree after a finite shift. Positional digit cylinders are half open, with the native terminating expansion at base-adic endpoints. The basic one-dimensional approximation sets in Layer 3 use closed rational intervals; power-law and simultaneous approximation use their displayed strict inequalities; comparison with native open circle balls includes the stated factor two and irrationality hypothesis.

For dynamics write A_n f(x)=`birkhoffAverage ℝ T f n x`, with A_0=0. The total Gauss map is T(x)=fract(x⁻¹), including T(0)=0. `gaussDigit x n` observes T^n x, so digit zero is the first positive partial quotient on irrational x∈(0,1). The Gauss measure μ_G has density 1/((1+x)log 2) on (0,1]. Initial Lebesgue probability m is volume restricted to (0,1); endpoint nullity identifies the two unit-interval restrictions when needed. D is the irrational part of (0,1), a conull invariant Borel set. Native continued-fraction denominators are q_n=`(GenContFract.of x).dens n`, with q_0=1 and the auxiliary `q_{−1}=0`. Rational termination is kept separate from irrational growth.

Hausdorff gauges use `Measure.mkMetric` with diameter argument. A source formula using ball radius is transported by the explicit comparison in Layer 3; exact scalar equality between the two conventions is not assumed. In homogeneous applications use column lattices G/Γ, G=SL₂(ℝ), Γ=SL₂(ℤ), left a_t=diag(exp t,exp(−t)) and positive time t≥0.

## Exact supplier contracts

### From Mathlib

The finite-law boundary consists of `ArithmeticFunction` and its zero/extensionality API; `ArithmeticFunction.cardDistinctFactors`, `cardFactors` and their factorization/prime-power formulas; `Nat.card_multiples`; `Nat.factorization`; `Nat.primeFactors`; `Nat.primesLE`; finite coprime-product divisibility; and `ZMod.prodEquivPi`. `TauCeti.Probability.empiricalMeasure_apply_toReal` and `integral_empiricalMeasure` evaluate the existing empirical probability without constructing another uniform law.

The exact finite carriers are in `Mathlib/NumberTheory/ArithmeticFunction/Defs.lean` and `Misc.lean`, `Mathlib/Data/Nat/Factorization/Basic.lean` and `Mathlib/Data/ZMod/QuotientRing.lean`. `ZMod.prodEquivPi` requires pairwise coprime natural moduli; finite probability applications here additionally require every modulus nonzero. `ArithmeticFunction` is a zero-preserving function; it does not assert additivity or multiplicativity. Native `Measure.mkMetric`, in `Mathlib/MeasureTheory/Measure/Hausdorff.lean`, accepts a diameter gauge; continuity, positivity and ratio monotonicity are additional hypotheses of this roadmap’s theorems. In that file, `MeasureTheory.Measure.le_mkMetric` (lines 490–493) turns a measure bound on every sufficiently small set into domination by the metric measure for an arbitrary extended gauge. `MeasureTheory.Measure.le_hausdorffMeasure` (lines 541–543) is its power-gauge specialization, with a real exponent.

For distribution limits consume `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, its bounded-continuous test-function formulation, the native CDF and characteristic function, the Lévy convergence theorem and the existing Gaussian law. The exact finite multinomial expansion is `Finset.sum_pow_eq_sum_piAntidiag`; multiplicity coefficients use `Nat.multinomial_spec`. Tau Ceti's `Probability.Distributions.Gaussian.Moments` supplies even and odd centered Gaussian moments. Moment convergence, arithmetic normalization and cutoff removal remain distinct mathematical targets below.

For §5.2 consume `DirichletCharacter.LSeries_eulerProduct_exp_log` in `Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean`, and `DirichletCharacter.LFunction_eq_LSeries`, `DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta` and `DirichletCharacter.differentiableAt_LFunction` in `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`. The Euler product and series comparison require Re s>1; the principal-character formula is used off s=1. `DirichletCharacter.LFunction_ne_zero_of_one_le_re` in `Mathlib/NumberTheory/LSeries/Nonvanishing.lean` requires Re s≥1 and either a nonprincipal character or s≠1. Compact-height bounds extend the reciprocal through the principal pole by zero. These inputs supply no quantitative estimate over a growing height interval.

For tori consume native continuous Fourier characters, density of trigonometric polynomials and their integrals against the Haar probability fixed above. The native irrational-circle dense-orbit/ergodicity results (`AddCircle.denseRange_zsmul_iff`, `AddCircle.ergodic_add_left`) and expanding-circle ergodicity are used for their exact hypotheses. General sequence equidistribution and canonical digit-frequency transport are developed below.

For metric approximation consume Borel–Cantelli, the native additive well-approximable circle sets and their zero–one theorem, native Hausdorff measure/dimension and bounded variation. For dynamics consume `MeasurableSpace.invariants`, `MeasureTheory.condExp`, change of variables under measure preservation, measurable representatives and native conditional-expectation convergence along filtrations and decreasing sigma-algebras. The existing Tau Ceti mean theorem identifies the invariant L2 projection; Layer 4 extends the pointwise and L1 conclusions to arbitrary integrable real functions. Native `GenContFract.IntFractPair.stream`, `GenContFract.of`, `nums`, `dens` and their recurrence/nontermination bounds supply the continued-fraction carrier; no second carrier is constructed.

### From Tau Ceti

`TauCeti.Probability.empiricalMeasure`, `TauCeti.Probability.empiricalMeasure_apply_toReal` and `TauCeti.Probability.integral_empiricalMeasure` in `TauCeti/Probability/Process/EmpiricalMeasure.lean` provide the successor-sized probability, its measurable-event evaluation and its strongly measurable integral evaluation. They retain multiplicities and do not supply arithmetic independence.

`TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` and `TauCeti.Probability.centralMoment_id_two_mul_add_one_gaussianReal`, in `TauCeti/Probability/Distributions/Gaussian/Moments.lean`, evaluate Gaussian centered moments, including zero variance. `TauCeti.Probability.birkhoffAverage_tendsto_metProjection`, in `TauCeti/Probability/Ergodic/MeanErgodic.lean`, supplies L² mean convergence. The native conditional-expectation and martingale convergence interfaces used in Layer 4 are specified at their use sites; none is substituted for almost-everywhere Birkhoff convergence for arbitrary L¹ observables.

`TauCeti.MeasureTheory.condExp_ae_eq_integral_of_forall_zero_or_one`, in `TauCeti/MeasureTheory/Function/ConditionalExpectation.lean`, identifies conditional expectation on a trivial sub-σ-algebra for an integrable observable in a complete normed real vector space. `MeasureTheory.tendsto_eLpNorm_condExp_iInf`, in `TauCeti/Probability/Martingale/Convergence.lean`, gives L¹ convergence along decreasing sub-σ-algebras below the ambient one, for a finite measure. In Layer 4 the measure is a probability and the functions are real indicators; these declarations give the constant-tail and reverse-L¹ inputs directly.

### From TauCetiRoadmap.ArithmeticDirichletSeries

Consume the Export contract, Layer 6, `truncatedPerronKernel` and `perronFormula`: the finite-height kernel includes its half-weight endpoint value and an explicit remainder, and the separate arithmetic summatory formula retains its stated coefficient and convergence hypotheses. The finite polynomial in §5.1 is absolutely summable, and endpoint equalities lie in a null set of real starting points.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5 and 3.18–3.45

Consume §0.19's explicit reciprocal-prime estimate for x≥286 and §0.21's Mertens asymptotic, including their common constant. The weaker bound `|Σ_{p≤x}1/p−log log x−B|≤1/(log x)²` suffices here (RS1962, Theorem 5). Subtraction gives the prime-block sum; partial summation and the convergent prime-square correction give `∏_{p≤x}(1+1/p)≍log x`. Prime-power remainders in the additive normalization use the convergent geometric tails. These are consequences of the supplied prime estimates.

Consume §1.5, `dirichlet_polynomial_mean_square`, for arbitrary finite complex coefficients and its stated integration range; §§3.18 and 3.33, `pretentiousDist` and `halasz_mean`, for unit-disc multiplicative functions with the infimum over the full compact twist interval. Consume §§3.12a, 3.32 and 3.41 for the compact-parameter Selberg–Delange expansion, `restricted_squarefree_landau_count` and the fixed-A restricted squarefree Sathe–Selberg bounds. The local conditional moment estimate in §1.6 differentiates that supplied analytic expansion; it does not reprove it.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence §§0.5–0.6

Consume the §0.5 native convergent-error inequalities and §0.6 BadlyApproximable, defined by irrationality and a positive lower bound for q·dist(qx,ℤ) for every integer q≥1, and its quadratic-irrational examples. The bounded-native-partial-denominator characterization is the target bounded_partial_denominators_iff_badlyApproximable in §4.10 here.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 and TauCetiRoadmap.AdelicAlgebraicGroups AA.2–AA.3

Consume GeometryOfNumbersAndQuadraticArithmetic §4.2.1 howe_moore on the mean-zero quotient L² representation and §4.2.2 moore_ergodicity for a closed noncompact subgroup, applied to the subgroup generated by a₁. Howe–Moore along a₁ⁿ gives strong mixing of the time-one map. Consume §4.5 Mahler compactness in the max norm. Consume AdelicAlgebraicGroups AA.2 quotient-Haar integration and AA.3 Reduction.arithmetic_finite_volume_iff for SL₂(ℤ), the quotient topology and Borel structure, the normalized invariant probability and the continuous left action. Transpose Γ\G→G/Γ is the local comparison in §4.10, not an additional supplier theorem.

## How to read the build

Layer 0 supplies exact finite laws and arithmetic probability interfaces. Layer 1 separates Gaussian pairing estimates, deterministic prime cutoffs and analytic normalization before proving additive limit laws. Layer 2 develops weak equidistribution, Fourier criteria, rational subtorus decompositions and discrepancy; its normality theorem consumes the pointwise result in Layer 4. Layer 3 builds reduced approximation and the GCD-graph argument, then transfers Lebesgue conclusions to Hausdorff conclusions. Layer 4 first proves pointwise convergence and its native conditional-expectation identification, then constructs the Gauss system, proves its statistics and quantitative transfer estimates, and applies the specified homogeneous-space inputs. Layer 5 uses the supplied mean-value foundations and the local analytic targets for multiplicative statistics, keeping random-model expectation identities separate from deterministic cancellation. The dependency from digit normality to Layer 4 is acyclic: the pointwise proof uses neither equidistribution nor normality.

## Layer 0: Arithmetic probability

### 0.1 Additive functions in the native arithmetic carrier

Begin with the coprime-product law. Prime-power representation then determines which prime data a later mean-square estimate must control.

Define `IsAdditive`. For f:ArithmeticFunction R with R an additive commutative monoid, IsAdditive f means
f(1)=0 and f(mn)=f(m)+f(n) for positive coprime m,n. Native f(0)=0 is retained; multiplication is on inputs,
not Dirichlet convolution. ([ElsholtzTao2011](#references) Appendix A, additive convention and Lemma A.2,
physical pp.37–38.)

Its basic API consists of these facts.

- An additive arithmetic function has value 0 at 1.
- For positive coprime m,n, its value at mn is the sum of its values at m and n.
- Pointwise addition preserves additivity.

Introduce the displayed predicate on the native carrier. The positive-input guards avoid imposing a false law
at zero. The API is used by prime-power representation and the quadratic mean bound.

**Checks.**

- The native zero arithmetic function is additive.

- The real cast of native omega is additive.

- The real cast of native Omega is additive.

- The convolution unit takes value 1 at input 1 and is not additive.

*Needs:* Mathlib `ArithmeticFunction`.

Prove IsAdditive.map_one. If f is additive, f(1)=0. ([ElsholtzTao2011](#references) Appendix A,
Lemma A.2, physical pp.37–38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Prove IsAdditive.map_mul. Additivity on positive coprime products, retaining both positivity hypotheses.
([ElsholtzTao2011](#references) Appendix A, Lemma A.2, physical pp.37–38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Prove IsAdditive.add. The pointwise sum of additive arithmetic functions is additive.
([ElsholtzTao2011](#references) Appendix A, Lemma A.2, physical pp.37–38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Define strong additivity for f:ArithmeticFunction R to mean IsAdditive f and
f(p^k)=f(p) for every natural prime p and k≥1. It is different from complete additivity f(mn)=f(m)+f(n) on all
positive inputs. ([ElsholtzTao2011](#references) Appendix A, Lemma A.3, defining paragraph, physical
p.38.)

Its basic API consists of these facts.

- Strong additivity implies additivity on positive coprime inputs.
- For every prime p and integer k≥1, its value at pᵏ equals its value at p.
- Pointwise addition preserves strong additivity.

Add the explicit prime-power clause to IsAdditive; no change of arithmetic-function carrier. This clause is
needed to replace the prime-power representation by the distinct-prime sum.

**Checks.**

- Zero is strongly additive.

- Native omega, cast to real arithmetic functions, is strongly additive.

- Native Omega is not strongly additive: Omega(4)=2 but Omega(2)=1.

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Prove that a strongly additive function is additive.
([ElsholtzTao2011](#references) Appendix A, Lemma A.3, defining paragraph, physical p.38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Prove the prime-power evaluation of a strongly additive function. For p prime and k>0, f(p^k)=f(p).
([ElsholtzTao2011](#references) Appendix A, Lemma A.3, defining paragraph, physical p.38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

Prove that pointwise addition preserves strong additivity.
([ElsholtzTao2011](#references) Appendix A, Lemma A.3, defining paragraph, physical p.38.)

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

**Prime-power representation of additive functions**. For additive f:ArithmeticFunction R and n>0,
`f(n)=Σ_{p∈n.primeFactors}f(p^(n.factorization` p)); this is the empty sum at n=1. ([ML-PM79](#references)
ArithmeticFunction.Defs and Nat.factorization; elementary specialization of native factorization.)

Factor n as the product of its positive prime powers. Distinct prime powers are pairwise coprime. Induct on
that finite product using IsAdditive.map_mul and f(1)=0. No independent random model is used.

*Needs:* §0.1 (additive functions in the native arithmetic carrier); Mathlib `ArithmeticFunction`; Mathlib
`Nat.prod_primeFactors_pow_factorization`; Mathlib `Nat.pairwise_coprime_pow_primeFactors_factorization`.

**Distinct-prime representation**. For strongly additive f and n>0, `f(n)=Σ_{p∈n.primeFactors}f(p)`.
([ElsholtzTao2011](#references) Appendix A, Lemma A.3, defining paragraph, physical p.38.)

One route uses the prime-power representation and positivity of every factorization exponent on primeFactors. Apply
the prime-power clause of strong additivity term by term.

*Needs:* §0.1 (additive functions in the native arithmetic carrier).

### 0.2 Weighted finite prime sums

Finite truncations are elementary arithmetic functions on the existing carrier. The guard at zero and the distinction between strong and complete additivity are part of their specification.

P is a finite set; a is real-valued.

Define `primeDivisibilitySum`. Construct S(P,a) : ArithmeticFunction real for a finite set P of natural
indices and real weights a. Set S(P,a)(0)=0 and, for n>0, `S(P,a)(n)=sum_{p in P}` (if p divides n then a(p)
else 0). Only the arithmetic interpretation and the prime-power/coprime laws require every member of P to be
prime. ([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and
cardDistinctFactors_apply_prime_pow.)

Its basic API consists of these facts.

- The function vanishes at 0 and an empty prime set gives the zero arithmetic function.
- For n>0 it is the weighted sum over indices in P dividing n; equal weights on P give equal functions.
- Pointwise addition of weights adds the sums; with prime P the sum is additive on positive coprime inputs and counts each prime power once.

One route uses the existing ArithmeticFunction=ZeroHom carrier. Define the function by the displayed zero guard and
finite sum; check its zero field by evaluation. Export positive evaluation before using the construction in
averages.

**Checks.**

- For P={2,3} and a(p)=p, S(P,a)(12)=5, not 7; prime powers are counted once.

- For P={2,3} and a(p)=p, S(P,a)(0)=0, although every p divides 0; the unguarded indicator sum would wrongly
  give 5.

- For every finite set of primes P and every a, S(P,a)(1)=0.

- For P=12.primeFactors and unit weights, S(P,1)(12)=cardDistinctFactors(12)=2, whereas cardFactors(12)=3.

- For P={2} and a(2)=2, S(P,a)(4)=2 differs from S(P,a)(2)+S(P,a)(2)=4.

- Zero, positive and empty evaluations agree with the stated convention.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `ArithmeticFunction.ext`; Mathlib `ArithmeticFunction.map_zero`.

n>0; P finite; a real-valued.

Prove the positive-input evaluation formula. For n>0, S(P,a)(n)=sum over p in P of a(p) times the indicator of p
dividing n. ([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and
cardDistinctFactors_apply_prime_pow.)

**Checks.**

- For P={2,3} and a(p)=p, S(P,a)(12)=5, not 7; prime powers are counted once.

*Needs:* §0.2 (weighted finite prime sums).

a real-valued.

Prove primeDivisibilitySum_empty. S(empty,a)=0 as an ArithmeticFunction, including at n=0.
([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and
cardDistinctFactors_apply_prime_pow.)

**Checks.**

- The equality is an equality of arithmetic functions, not only an almost-everywhere identity.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `ArithmeticFunction.ext`; Mathlib
`ArithmeticFunction.map_zero`.

P finite; a(p)=b(p) for every p in P.

Prove primeDivisibilitySum_congr. If a(p)=b(p) for p in P then S(P,a)=S(P,b). ([ML-ARITH](#references)
Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and cardDistinctFactors_apply_prime_pow.)

**Checks.**

- Changing weights outside P has no effect.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `ArithmeticFunction.ext`.

P finite; a,b real-valued.

Prove primeDivisibilitySum_add. S(P,a+b)=S(P,a)+S(P,b), where the additions are pointwise.
([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and
cardDistinctFactors_apply_prime_pow.)

**Checks.**

- Cancellation a+(-a) produces the zero function; this is not a convolution formula.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `ArithmeticFunction.ext`.

Every p in P is prime; m,n>0; gcd(m,n)=1.

Prove primeDivisibilitySum_mul_of_coprime. For prime P and coprime positive m,n,
S(P,a)(mn)=S(P,a)(m)+S(P,a)(n). ([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean:
cardDistinctFactors and cardDistinctFactors_apply_prime_pow; [ML-PRIME](#references) Prime.dvd_of_dvd_pow;
Prime.dvd_iff_eq; GCD/Basic.lean: Coprime.lcm_eq_mul.)

For p in P, primality gives p divides mn iff p divides m or p divides n. The two events cannot both hold: a
common prime divisor would divide gcd(m,n)=1. Thus their 0/1 indicators add without a double contribution.
Multiply by a(p), sum, and apply positive evaluation at m,n,mn.

**Checks.**

- For P={2}, a(2)=2, m=n=2, the identity fails: the coprimality hypothesis cannot be removed.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `Nat.Prime.dvd_iff_eq`; Mathlib `Nat.Prime.dvd_mul`.

All p in P are prime; q prime; k>=1.

Prove primeDivisibilitySum_prime_pow. For prime P, prime q and k>=1, S(P,a)(q^k)=a(q) if q is in P, and 0
otherwise. ([ML-ARITH](#references) Defs.lean: ArithmeticFunction; Misc.lean: cardDistinctFactors and
cardDistinctFactors_apply_prime_pow; [ML-PRIME](#references) Prime.dvd_of_dvd_pow; Prime.dvd_iff_eq;
GCD/Basic.lean: Coprime.lcm_eq_mul.)

For p in P, p divides q^k iff p divides q, using the prime divisor-of-power theorem and its elementary
converse. Since p and q are prime this holds iff p=q. The finite sum has at most the q summand.

**Checks.**

- At P={2,3}, weights a(p)=p, evaluate q=2,k=3 to 2 and q=5,k=1 to 0.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `Nat.Prime.dvd_of_dvd_pow`; Mathlib `Nat.Prime.dvd_iff_eq`.

n is any natural number, including 0 and 1.

Prove primeDivisibilitySum_primeFactors. S(n.primeFactors,constant 1)(n) equals the real cast of the
existing cardDistinctFactors n, for every natural n. ([ML-ARITH](#references) Defs.lean: ArithmeticFunction;
Misc.lean: cardDistinctFactors and cardDistinctFactors_apply_prime_pow.)

At n=0 the existing arithmetic-function zero laws give both sides zero. At positive n each member of
n.primeFactors divides n, so the sum is the cardinal of n.primeFactors. Identify that finite set with the
deduplicated prime-factor list and use the existing cardDistinctFactors_apply theorem.

**Checks.**

- At 12 the value is 2; at 0 and 1 it is 0. Never substitute the multiplicity-counting Omega.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `ArithmeticFunction.cardDistinctFactors`; Mathlib
`ArithmeticFunction.cardDistinctFactors_apply`; Mathlib `ArithmeticFunction.map_zero`.

### 0.3 Divisibility probabilities and the lcm

Counting positive multiples gives exact probabilities before any independence statement is available. Intersections use an lcm, including on the diagonal.

m is a natural number; N=m+1; mu_N is the existing empiricalMeasure of k->k+1 at index m, hence a probability
on {1,...,N}. d>0.

**Exact divisibility probability**. For every positive d, the real probability mu_N({n : d divides n}) equals
(Nat.div N d)/N. This is a probability specialization of existing counting, not a new multiples-counting
theorem. ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about factorizations of
particular functions; [TC-EMP](#references) empiricalMeasure_apply_toReal and integral_empiricalMeasure.)

Apply empiricalMeasure_apply_toReal to the measurable divisibility set on discrete naturals. Its indicator sum
is the real cast of the number of k<N with d dividing k+1. Substitute the already proved Nat.card_multiples
and move the finite natural cast through the sum.

**Checks.**

- N=5,d=2 gives 2/5; d>N gives 0; d=1 gives 1.

*Needs:* Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.empiricalMeasure_apply_toReal`; Mathlib `Nat.card_multiples`.

**Signed finite counting error**. Let e_N(d)=mu_N(d divides n)-1/d, in the reals. For d>0, e_N(d)=-(N mod
d)/(N*d), so -1/N<e_N(d)<=0; in particular |e_N(d)|<=1/N. This notation is a local expression, not another
probability definition. ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about
factorizations of particular functions.)

Write N=d*(Nat.div N d)+(N mod d) with 0<=N mod d<d. Substitute the exact probability, cast the
quotient-remainder equality to the reals, and divide by positive N*d. The sign and strict lower bound follow
from the remainder bounds. Retain the sign for exact-period specialization.

**Checks.**

- N=5,d=2 gives -1/10. If d divides N the error is exactly zero.

*Needs:* §0.3 (divisibility probabilities and the lcm).

d,e>0.

**Joint divisibility and the lcm**. For positive d,e, mu_N({n : d divides n and e divides n})=(Nat.div N
(Nat.lcm d e))/N. For distinct primes p,q, the denominator inside Nat.div becomes p*q; for equal primes it is
p, not p^2. ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about factorizations of
particular functions; [ML-PRIME](#references) Prime.dvd_of_dvd_pow; Prime.dvd_iff_eq; GCD/Basic.lean:
Coprime.lcm_eq_mul.)

The joint event is exactly the event that lcm(d,e) divides n, by the defining universal property of lcm. This
lcm is positive. Apply divisibility-probability. Use Coprime.lcm_eq_mul only when coprimality has been proved;
distinct primes are coprime since a common divisor is 1 or each of them.

**Checks.**

- N=12,d=4,e=6 gives 1/12 rather than floor(12/24)/12=0.

- N=5,p=2,q=3 gives 0 while the product of marginal probabilities is 2/25.

*Needs:* §0.3 (divisibility probabilities and the lcm); Mathlib `Nat.Coprime.lcm_eq_mul`; Mathlib
`Nat.Prime.dvd_iff_eq`.

### 0.4 First and second moments with the model center

The reciprocal-prime center A need not equal the empirical mean. Expand all ordered prime pairs, retain diagonal terms, and account for the finite remainder.

m is a natural number; N=m+1; mu_N is the existing empiricalMeasure of k->k+1 at index m, hence a probability
on {1,...,N}. P finite, all its members prime; a real-valued.

**Exact mean of a finite truncation**. For prime P and real a, integral S(P,a) dmu_N = `sum_{p in P}`
a(p)*(Nat.div N p)/N. All the quantities are real. ([ML-COUNT](#references) Nat.card_multiples, in the
section Lemmas about factorizations of particular functions; [TC-EMP](#references)
empiricalMeasure_apply_toReal and integral_empiricalMeasure.)

Apply integral_empiricalMeasure to S(P,a); on the discrete natural carrier it is strongly measurable. For k<N,
k+1>0, so use positive-evaluation. Interchange the two finite sums. For each p, the sum of divisibility
indicators is Nat.card_multiples N p. Pull out the constant real weight. No independence enters the proof.

**Checks.**

- At N=5,P={2,3},a(p)=p, the values 0,2,3,2,0 have mean 7/5.

*Needs:* §0.2 (weighted finite prime sums); Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`; Mathlib
`Nat.card_multiples`.

P finite and prime; a real-valued.

**Centering error**. Write `A=sum_{p in P}` a(p)/p and `L=sum_{p in P}|a(p)|`. Then |integral S(P,a)
dmu_N-A|<=L/N. ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about factorizations of
particular functions; [TAO-RESIDUES](#references) Section 3, first six paragraphs; paragraph beginning
However, one can still hope.)

Subtract A from the exact mean and obtain sum a(p)*e_N(p). Apply the finite triangle inequality and
divisibility-error, noting that each p is positive.

**Checks.**

- Weights may have either sign. The centering A is not asserted to be the exact empirical mean.

*Needs:* §0.4 (first and second moments with the model center); §0.3 (divisibility probabilities and the lcm).

p,q>0; primality is not needed for this identity.

**Exact centered pair average**. For positive p,q, let I_d(n) be the real 0/1 indicator of d dividing n. Then
integral (I_p-1/p)*(I_q-1/q) dmu_N equals (Nat.div N (Nat.lcm p q))/N -(Nat.div N p)/(N*q) -(Nat.div N
q)/(N*p)+1/(p*q). ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about factorizations of
particular functions; [TC-EMP](#references) empiricalMeasure_apply_toReal and integral_empiricalMeasure.)

Convert the integral to its finite average and expand the product into four terms. The product I_p*I_q is the
indicator of the joint divisibility event; the constant term averages to itself because there are exactly N
terms. Use divisibility-probability and joint-divisibility for the three nonconstant terms.

**Checks.**

- When p=q use I_p^2=I_p. When N=5,p=2,q=3 the centered average is -1/15.

*Needs:* §0.3 (divisibility probabilities and the lcm); Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

p,q prime.

**Uniform prime-pair error**. For primes p,q, put D(p,q)=1/p-1/p^2 when p=q, and 0 otherwise. Then |integral
(I_p-1/p)*(I_q-1/q) dmu_N-D(p,q)|<=2/N. Repeated primes are included. ([ML-PRIME](#references)
Prime.dvd_of_dvd_pow; Prime.dvd_iff_eq; GCD/Basic.lean: Coprime.lcm_eq_mul; [TAO-RESIDUES](#references)
Section 3, first six paragraphs; paragraph beginning However, one can still hope.)

Replace each floor probability in centered-pair-identity by 1/d+e_N(d). If p=q then lcm(p,p)=p, and the
nonerror part is 1/p-1/p^2. If p!=q, coprimality gives lcm(p,q)=p*q and the nonerror part is zero. The
remaining expression is e_N(lcm(p,q))-e_N(p)/q-e_N(q)/p. Each error has magnitude at most 1/N. Since p,q>=2,
1+1/p+1/q<=2. The triangle inequality proves the bound, including the diagonal.

**Checks.**

- At p=q=2, the centered square equals 1/4 pointwise and the error is actually zero.

- Distinct-prime indicators under mu_N need not be independent.

*Needs:* §0.4 (first and second moments with the model center); §0.3 (divisibility probabilities and the lcm);
Mathlib `Nat.Coprime.lcm_eq_mul`.

P finite and prime; a real-valued, with no sign or boundedness hypothesis beyond finiteness of P.

Prove `primeDivisibilitySum_secondMoment_error`. For prime P and real a, write A=sum a(p)/p, L=sum |a(p)|,
V=sum a(p)^2*(1/p-1/p^2). Then |integral (S(P,a)-A)^2 dmu_N - V| <= 2*L^2/N. This is a centered second moment
about A, not a formula for variance about the empirical mean. ([TAO-RESIDUES](#references) Section 3,
first six paragraphs; paragraph beginning However, one can still hope; [TC-EMP](#references)
empiricalMeasure_apply_toReal and integral_empiricalMeasure.)

For n in the positive sample, S(P,a)(n)-A=sum a(p)*(I_p(n)-1/p). Square and distribute as a double sum over
all ordered pairs (p,q), including the diagonal. Convert the integral to a finite average and interchange
these finite sums. Subtract the sum of a(p)*a(q)*D(p,q). Its off-diagonal terms vanish and its diagonal is
exactly V. Apply centered-pair-error and the triangle inequality, obtaining
`(2/N)*sum_{p,q}|a(p)|*|a(q)|=(2/N)*L^2`. No probabilistic independence or central limit theorem is used.

**Checks.**

- P empty gives 0=0. Signed weights and repeated pair indices must survive expansion.

- The bound is useful only when L^2/N is controlled; it is not the Turan-Kubilius inequality and does not
  discharge the large-prime tail of Erdos-Kac.

*Needs:* §0.2 (weighted finite prime sums); §0.4 (first and second moments with the model center); Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`.

P finite and prime; a real-valued; `product_{p in P}p` divides N.

Prove primeDivisibilitySum_secondMoment_completePeriod. Under the second-moment-comparison hypotheses,
assume `Q=product_{p in P}p` divides N. Then integral (S(P,a)-A)^2 dmu_N=V. Also the already stated
weighted-mean formula gives integral S(P,a) dmu_N=A, so this centered moment is the actual variance in this
case. ([ML-COUNT](#references) Nat.card_multiples, in the section Lemmas about factorizations of particular
functions; [TAO-RESIDUES](#references) Section 3, first six paragraphs; paragraph beginning However, one
can still hope.)

Each p in P divides Q and thus N. For p,q in P their lcm divides Q, whether p=q or not. All three remainder
terms in the centered-pair-identity are zero. The exact pair average is D(p,q). Repeat the explicit finite
double-sum argument of second-moment-comparison with equality. The exact first moment follows by replacing
each floor quotient by N/p in weighted-mean.

**Checks.**

- For N=6,P={2,3},a(p)=p, A=2 and V=3. For N=5 the corresponding mean is 7/5 and centered second moment is 9/5,
  so completeness of the period cannot be silently removed.

- For P empty, Q=1; every positive N satisfies the condition and both moments vanish.

*Needs:* §0.4 (first and second moments with the model center); §0.3 (divisibility probabilities and the lcm).

### 0.5 Boolean patterns and complete periods

Inclusion–exclusion supplies every finite divisibility pattern. Exact product laws require a complete prime period; a finite error estimate supplies the comparison at other sample sizes.

m is a natural number; N=m+1; mu_N is the existing empiricalMeasure of k->k+1 at index m. Probabilities below
are real-valued. P is a finite set of natural primes; Q_P is its product, including Q_empty=1.

**Simultaneous prime-divisibility probability**. mu_N({n: every p in P divides n}) = floor(N/Q_P)/N.
([ML-FINITE-PRODUCT](#references) Finset.lcm_eq_prod and lcm_dvd_iff; Ring/Finset.lean
prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237; [TAO-RESIDUES](#references)
Section 3, first six paragraphs: product-modulus joint comparison and the following paragraph on weaker
statistics.)

Distinct members of P are coprime by Nat.coprime_primes. Finset.lcm_eq_prod therefore identifies Q_P with the
finite lcm. By Finset.lcm_dvd_iff, the event of all divisibilities is exactly Q_P dividing n. This also treats
P empty: the empty lcm and product are 1. Every prime is positive, hence Q_P is positive; apply
divisibility-probability with d=Q_P. All sets of naturals are measurable.

**Checks.**

- P empty gives probability 1 for every positive N.

- P={2,3},N=5 gives 0; N=6 gives 1/6.

- Dropping primality fails for P={2,4},N=4: the event has probability 1/4, while floor(4/8)/4=0.

*Needs:* Mathlib `Nat.coprime_primes`; Mathlib `Finset.lcm_eq_prod`; Mathlib `Finset.lcm_dvd_iff`; §0.3
(divisibility probabilities and the lcm).

S,T are disjoint finite sets of natural primes. Write `Q_R=product_{p in R}p`, with Q_empty=1; E(S,T)={n: every
p in S divides n and no q in T divides n}. These are local expressions, not new carriers.

**Signed formula for prime-divisibility patterns**. mu_N(E(S,T)) = `sum_{U subset T}` (-1)^|U| `floor(N/Q_{S`
union U})/N. ([ML-FINITE-PRODUCT](#references) Finset.lcm_eq_prod and lcm_dvd_iff; Ring/Finset.lean
prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237; [TAO-RESIDUES](#references)
Section 3, first six paragraphs: product-modulus joint comparison and the following paragraph on weaker
statistics.)

At each natural n put I_p(n)=1 if p divides n and 0 otherwise. The event indicator is `(product_{p in S}`
`I_p(n))*(product_{q in T}(1-I_q(n)))`. Apply Finset.prod_one_add with f(q)=-I_q(n), then distribute the first
product. The U term is (-1)^|U| times the indicator of all primes in S union U dividing n. Because U is
contained in T, it is disjoint from S; repeated indicators would also be idempotent. Apply
empiricalMeasure_apply_toReal to the event and each all-divisibility event; commute the two finite real sums.
This avoids any unjustified signed subtraction in extended nonnegative reals. Use simultaneous-divisibility
for S union U, whose members are primes. Natural division is performed before casting to the real normalized
probability.

**Checks.**

- T empty recovers simultaneous-divisibility; S=T=empty gives 1.

- S={2},T={3},N=5 gives 2/5 rather than the model value 1/3.

- S empty,T={2,3},N=6 gives 1-1/2-1/3+1/6=1/3.

*Needs:* Mathlib `Finset.prod_one_add`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`; §0.5 (boolean
patterns and complete periods).

**Bernoulli-product error for one pattern**. Put `b(S,T)=(product_{p in S}1/p)*(product_{q in T}(1-1/q))`. Then
|mu_N(E(S,T))-b(S,T)| <= 2^|T|/N. ([ML-FINITE-PRODUCT](#references) Finset.lcm_eq_prod and
lcm_dvd_iff; Ring/Finset.lean prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237;
[TAO-RESIDUES](#references) Section 3, first six paragraphs: product-modulus joint comparison and the
following paragraph on weaker statistics.)

For U contained in T, disjointness gives `Q_{S union U}=Q_S*Q_U`. Positivity permits the reciprocal product
identity. Expand `product_{q in T}(1-1/q)` with Finset.prod_one_add at f(q)=-1/q. Multiplying by 1/Q_S yields
`b(S,T)=sum_{U subset T}(-1)^|U|/Q_{S union U}`. Subtract this identity from divisibility-pattern-formula. The
difference is `sum_{U subset T}(-1)^|U|` `e_N(Q_{S union U})`, with e_N from divisibility-error. Each product
divisor is positive and each error has absolute value at most 1/N. The finite triangle inequality and
Finset.card_powerset give 2^|T|/N.

**Checks.**

- No restriction `Q_{S union T}<=N` is needed for this inequality, but the bound can exceed 1 and then conveys
  little information.

- Disjointness cannot be dropped from the model interpretation: S=T={2} has an empty event while b=1/4, even
  when N is a multiple of 2.

- For N=5,S={2},T={3}, the error is 1/15.

*Needs:* §0.5 (boolean patterns and complete periods); §0.3 (divisibility probabilities and the lcm); Mathlib
`Finset.prod_one_add`; Mathlib `Finset.card_powerset`.

`Q_{S union T}` divides N.

**Complete-period Bernoulli law**. If `Q_{S union T}` divides N, then mu_N(E(S,T))=b(S,T), with
`b(S,T)=(product_{p in S}1/p)*(product_{q in T}(1-1/q))`. Thus the statement for S contained in P and T=P minus
S specifies every Boolean divisibility atom for a finite prime set P on a complete period.
([ML-FINITE-PRODUCT](#references) Finset.lcm_eq_prod and lcm_dvd_iff; Ring/Finset.lean
prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237; [TAO-RESIDUES](#references)
Section 3, first six paragraphs: product-modulus joint comparison and the following paragraph on weaker
statistics.)

For every U contained in T, `Q_{S union U}` divides `Q_{S union T}`, hence divides N. Product divisibility follows
by splitting the finite product into the subset and its complement. Each remainder `e_N(Q_{S union U})` is zero,
by the exact signed remainder in divisibility-error, not just its upper bound. Use the signed-subset formula
and the reciprocal-product expansion from the proof of divisibility-pattern-error. Every summand is now exact,
giving b(S,T). For S contained in P, the sets S and P minus S are disjoint prime sets with union P, so this
same equality covers all zero/one coordinate patterns. No new product-measure carrier or theorem about all
nonzero residue classes is asserted.

**Checks.**

- N=6,P={2,3}: the atoms none, only 2, only 3, both have probabilities 1/3,1/3,1/6,1/6.

- N=5 gives 2/5,2/5,1/5,0; the complete-period hypothesis is essential.

- For P empty there is exactly one pattern, of mass 1.

*Needs:* §0.5 (boolean patterns and complete periods); §0.3 (divisibility probabilities and the lcm); Mathlib
`Finset.prod_one_add`.

P is a finite set of natural primes; each S ranges over its powerset, and P minus S is the finite set
difference.

Prove `divisibility_pattern_summed_error`. For a finite prime set P, `sum_{S subset P}` |mu_N(E(S,P minus
S))-b(S,P minus S)| <= 3^|P|/N, with E and b as in divisibility-pattern-error.
([ML-FINITE-PRODUCT](#references) Finset.lcm_eq_prod and lcm_dvd_iff; Ring/Finset.lean
prod_one_add, lines 196-198, and sum_pow_mul_eq_add_pow, lines 231-237; [TAO-RESIDUES](#references)
Section 3, first six paragraphs: product-modulus joint comparison and the following paragraph on weaker
statistics.)

For every S contained in P, the disjoint prime sets S and P minus S satisfy divisibility-pattern-error. Their
atom error is at most 2^|P minus S|/N. Sum these inequalities and factor out 1/N. Since S is contained in P,
|P minus S|=|P|-|S|. Apply Finset.sum_pow_mul_eq_add_pow with real a=1,b=2 to evaluate `sum_{S subset P}`
2^(|P|-|S|)=3^|P|. The atoms partition the finite Boolean pattern set and the nonnegative model masses sum to
`product_{p in P}(1/p+(1-1/p))=1` by finite distributivity. The exported declaration is the displayed sum bound;
a measure-theoretic total-variation interface is not introduced.

**Checks.**

- For N=5,P={2,3}, the summed error is 1/3 and the bound is 9/5.

- For complete prime periods all atom errors vanish by complete-period-joint-law.

- For P empty the summed error is zero. The estimate alone is useful for varying P only when 3^|P|/N is small;
  it is not a general Kubilius growing-prime theorem.

*Needs:* §0.5 (boolean patterns and complete periods); Mathlib `Finset.sum_pow_mul_eq_add_pow`.

### 0.6 Mixed products and higher finite moments

Group repeated coordinates of an ordered tuple by multiplicity. This extends the pair calculation without assuming that the empirical prime indicators are independent.

P is a finite set of natural primes; m is a natural number, N=m+1, and mu_N is the existing empiricalMeasure
of k -> k+1 at index m. alpha is a natural-valued function on primes, with exponent zero allowed. Put u_p=1/p,
f_p(n)=I_p(n)-u_p, v_p=(-u_p)^alpha_p, w_p=(1-u_p)^alpha_p-v_p, and `Q_D=product_{p in D}` p. All these are
local expressions, not new carriers; real arithmetic and empty products equal to one are used.

**Exact centered prime-product average**. The mu_N-average of `product_{p in P}` f_p(n)^alpha_p equals `sum_{D`
subset P} `(product_{p in D}` `w_p)(product_{p in P minus D}` v_p) floor(N/Q_D)/N. ([GS-SIEVING](#references)
Author copy, proof of Proposition 2, pp.4-5: f_r and the finite average preceding (9).)

For each prime p and each n, split on p dividing n to obtain f_p(n)^alpha_p=v_p+w_p I_p(n), also when
alpha_p=0. Apply Finset.prod_add with the w_p I_p(n) term first and v_p second. Products of zero-one
indicators give the event that every p in D divides n. Use integral_empiricalMeasure to replace the integral
by the finite average, interchange finite sums, and apply simultaneous-divisibility to D. Every member of D is
prime, and the natural quotient N/Q_D is cast to the reals only after division. The empty subset has Q_D=1 and
normalized count one; in particular zero exponents and empty P introduce no exceptional undefined term.

**Checks.**

- All alpha_p=0 gives average one; P empty also gives one.

- For P={2},alpha_2=2, v_2=1/4 and w_2=0; the average is exactly 1/4 for every N, including odd N.

- For P={2,3},alpha_2=alpha_3=1,N=5 the average is -1/15, not zero.

*Needs:* §0.5 (boolean patterns and complete periods); Mathlib `Finset.prod_add`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`.

**Explicit centered-product remainder**. Put `G(P,alpha)=product_{p in P}(v_p+w_p/p)`. The absolute difference
between the mu_N-average of product f_p^alpha_p and G(P,alpha) is at most `[product_{p in`
`P}(|v_p|+|w_p|)-product_{p` in P}|v_p|]/N. ([GS-SIEVING](#references) Author copy, proof of Proposition 2,
pp.4-5: factorization of G(r) and remainder O(tau(R)).)

Expand G by Finset.prod_add with factors w_p/p and v_p; the D coefficient is the same as in
centered-product-expansion, multiplied by 1/Q_D. All Q_D are positive. Subtract the exact centered-product
expansion. Each term has coefficient (product_D `w_p)(product_{P minus D}` v_p) times the signed divisor error
e_N(Q_D) from divisibility-error. For D empty that error is zero because Q_D=1. For every other subset its
absolute value is at most 1/N; apply the finite triangle inequality and multiplicativity of absolute value.
Apply Finset.prod_add to |w_p| and |v_p|. The sum of absolute coefficients excluding the empty subset is
exactly product(|v_p|+|w_p|)-product|v_p|, which is nonnegative.

**Checks.**

- The bound is zero when P is empty or all alpha_p are zero.

- For P={2},alpha_2=2 the bound is zero, recovering the exact square average even when 2 does not divide N.

- The model center is G, not a product of empirical centered means; the two-prime N=5 error is 1/15.

*Needs:* §0.6 (mixed products and higher finite moments); §0.3 (divisibility probabilities and the lcm); Mathlib
`Finset.prod_add`.

**Uniform mixed-moment comparison**. With nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e, the absolute difference
between the mu_N-average of `product_{p in P}` f_p(n)^alpha_p and `product_{p in P}nu_p(alpha_p)` is at most
(3/2)^|P|/N, for all natural exponents. ([GS-SIEVING](#references) Author copy, proof of Proposition 2,
pp.4-5, and weighted extension in proof of Proposition 4, pp.10-11.)

The identity v_p+w_p/p=nu_p(alpha_p) follows by real ring algebra. Since p is prime, 0<u_p<=1/2. If alpha_p=0,
|v_p|+|w_p|=1. Otherwise pow_le_of_le_one gives u_p^alpha_p<=u_p and (1-u_p)^alpha_p<=1-u_p. The triangle
inequality gives |w_p|<=(1-u_p)^alpha_p+u_p^alpha_p<=1; hence |v_p|+|w_p|<=1+u_p<=3/2. No parity or positive
exponent hypothesis is suppressed. In centered-product-error discard the nonnegative subtracted product, then
multiply these nonnegative bounds over P.

**Checks.**

- The estimate permits zero exponents and all N>=1, without a restriction on Q_P.

- For alpha_p=1, nu_p(1)=0, but the corresponding arithmetic centered average need not vanish on incomplete
  periods.

- For p=3,e=3, nu_p(e)=2/27; odd individual centered moments are not identically zero.

*Needs:* §0.6 (mixed products and higher finite moments); Mathlib `pow_le_of_le_one`.

Q_P divides N.

**Complete-period mixed moments**. If Q_P divides N, the mu_N-average of `product_{p in P}` f_p(n)^alpha_p
equals `product_{p in P}[u_p(1-u_p)^alpha_p+(1-u_p)(-u_p)^alpha_p]` exactly. ([GS-SIEVING](#references)
Author copy, definition of G(r) in proof of Proposition 2, p.4; square-full-support observation, p.5.)

For every D contained in P, split the prime product into D and its complement to see that Q_D divides Q_P and
therefore N. The signed remainder formula in divisibility-error gives e_N(Q_D)=0. In the exact subset formula
every normalized floor can be replaced by 1/Q_D. Apply Finset.prod_add to factor the resulting sum as
product(v_p+w_p/p), then use elementary algebra to obtain the displayed expression. Each factor is already the
centered moment of the existing Bernoulli measure at 1 and 0, by integral_bernoulliMeasure. This
interpretation does not introduce a second distribution carrier or claim independence on incomplete periods.

**Checks.**

- N=3,p=3,e=3 gives 2/27, and N=6,P={2,3},both exponents one gives zero.

- If any alpha_p=1 the model product vanishes; this is the square-full-support cancellation used in the moment
  method, not a claim that every square-full product has nonzero model value.

- Repeated prime coordinates must be merged into their exponent: p=2 twice gives 1/4, not the product of two
  zero means.

*Needs:* §0.6 (mixed products and higher finite moments); §0.3 (divisibility probabilities and the lcm); Mathlib
`Finset.prod_add`; Mathlib `ProbabilityTheory.integral_bernoulliMeasure`.

P is a finite set of natural primes, a has arbitrary real weights (including negative and zero values), m,k
are natural numbers, N=m+1, and mu_N samples 1,...,N. Tuples are ordered and can repeat primes. The empty
tuple exists when k=0 even if P is empty, so M_0=1 and L^0=1. When P is empty and k>0 the tuple set is empty
and M_k=0.

**Finite weighted moment comparison**. Let k>=0 and a:P->R, `A=sum_{p in P}a(p)/p`, and `L=sum_{p in P}|a(p)|`.
For each ordered tuple t:{0,...,k-1}->P let T_t be its image, alpha_t(p) the number of coordinates equal to p,
and `G(t)=product_{p in T_t}nu_p(alpha_t(p))`, with nu_p(e)=(1/p)(1-1/p)^e+(1-1/p)(-1/p)^e. Put M_k=sum_t
`(product_{j<k}a(t(j)))G(t)`. Then |integral (S(P,a)(n)-A)^k dmu_N - M_k| <= (3/2)^k L^k/N. S(P,a) is the
existing zero-extended primeDivisibilitySum; all auxiliary expressions are local finite sums/products.
([GS-SIEVING](#references) Author copy, proof of Proposition 2, p.4, and opening weighted expansion in
proof of Proposition 4, p.10.)

At every sampled n>0, positive-evaluation gives `S(P,a)(n)-A=sum_{p in P}a(p)f_p(n)`. Apply Finset.sum_pow' and
integral_empiricalMeasure, commuting finite sums. For a tuple t, apply Finset.prod_fiberwise_of_maps_to' with
target its image to group product_j `f_{t(j)}(n)` into `product_{p in T_t}f_p(n)^alpha_t(p)`. Distinct image
primes satisfy centered-product-uniform-error. Finset.card_image_le gives |T_t|<=k. Since 3/2>=1,
pow_le_pow_right₀ bounds (3/2)^|T_t| by (3/2)^k. Multiply by |product_j a(t(j))| and sum using the triangle
inequality. Finset.sum_pow' applied to |a| evaluates sum_t product_j |a(t(j))|=L^k, yielding the claimed
bound, also in the empty-index cases. The model interpretation uses existing integral_bernoulliMeasure and
iIndepFun.integral_fun_prod_comp: for an independent Bernoulli(1/p) family, first group each repeated
coordinate into its power, then factor only across distinct primes. Thus M_k is its weighted centered k-th
moment. This interpretation is already generic library mathematics; it is not a separate node or an
independence assumption on mu_N.

**Checks.**

- For k=0 both arithmetic and model moments equal one; for P empty and k>0 both vanish.

- For P={3},a(3)=-1,k=3,N=3, both sides' moments are -2/27. Taking absolute weights inside the model would be
  wrong.

- For k=2 the model is sum a(p)^2(1/p-1/p^2). Keep the sharper error 2L^2/N; the new general bound gives
  9L^2/(4N), not an improvement in that special case.

- A Gaussian approximation needs separate pairing/collision estimates and normalization; this finite comparison
  is not an Erdos-Kac theorem.

*Needs:* §0.2 (weighted finite prime sums); §0.6 (mixed products and higher finite moments); Mathlib
`Finset.sum_pow'`; Mathlib `Finset.prod_fiberwise_of_maps_to'`; Mathlib `Finset.card_image_le`; Mathlib
`pow_le_pow_right₀`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`; Mathlib
`ProbabilityTheory.integral_bernoulliMeasure`; Mathlib `ProbabilityTheory.iIndepFun.integral_fun_prod_comp`.

### 0.7 Residues with a shifted remainder

The sample starts at one. The remainder therefore singles out residues by (a−1).val, and its positive and negative errors give a sharp event bound.

m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete
naturals. All probabilities and normalized expressions below are real. d is a positive natural modulus; a
ranges over the existing ZMod d. Put R=N mod d and rho(a)=(a-1).val, so 0<=rho(a)<d. Put p(a)=mu_N({n : the
cast of n in ZMod d equals a}). These are local expressions, not new definitions.

**Exact residue probability**. For every a in ZMod d, `p(a)=[floor(N/d)+1_{rho(a)<R}]/N`. Natural division is
taken before the real cast. The shift rho(a)=(a-1).val is essential because the sample starts at 1.
([TAO-RESIDUES](#references) Section 3, Equidistribution of residues, first six paragraphs:
single-residue counts, Chinese remainder passage, and the large-product obstruction.)

For each sample index k<N, cast(k+1)=a is equivalent to cast(k)=a-1, hence to k congruent to rho(a) modulo d,
by natCast_zmod_val and natCast_eq_natCast_iff. Apply the existing empiricalMeasure_apply_toReal. Its finite
indicator sum is the natural count of this congruence predicate, cast to the reals. Use the existing
Nat.count_modEq_card with b=N and v=rho(a); val_lt reduces rho(a) mod d to rho(a).

**Checks.**

- N=5,d=3: masses at residues 0,1,2 are 1/5,2/5,2/5.

- d=1 gives mass 1. For N<d the supported residues are 1,...,N, not 0,...,N-1.

*Needs:* Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`; Mathlib `Nat.count_modEq_card`; Mathlib
`Nat.count_eq_card_filter_range`; Mathlib `ZMod.natCast_zmod_val`; Mathlib `ZMod.natCast_eq_natCast_iff`;
Mathlib `ZMod.val_lt`.

**Residue atom error**. For every a, |p(a)-1/d|<1/N. More precisely the proof computes the signed difference
as `[1_{rho(a)<R}-R/d]/N`; its sign depends on the residue. ([TAO-RESIDUES](#references) Section 3,
Equidistribution of residues, first six paragraphs: single-residue counts, Chinese remainder passage, and the
large-product obstruction.)

Cast N=d*floor(N/d)+R to the reals and substitute residue-probability. If rho(a)<R, then R>0 and the error is
(d-R)/(N*d), strictly between 0 and 1/N. Otherwise the error is -R/(N*d), between -1/N and 0, since 0<=R<d. At
R=0 both are zero.

**Checks.**

- At N=5,d=3, residue 1 has positive error 1/15 while residue 0 has negative error -2/15.

- For residue zero this specializes to the signed divisibility error; it does not extend its nonpositive sign to
  all residues.

*Needs:* §0.7 (residues with a shifted remainder).

**Exact summed residue error**. The finite sum over all a in ZMod d of |p(a)-1/d| equals 2*R*(d-R)/(N*d). Thus
it vanishes on complete periods. If N<d it is exactly 2*(1-N/d). ([TAO-RESIDUES](#references) Section 3,
Equidistribution of residues, first six paragraphs: single-residue counts, Chinese remainder passage, and the
large-product obstruction.)

The translation a mapped to a-1 is a permutation. Composing with the native equivalence between ZMod d and Fin
d shows exactly R residues satisfy rho(a)<R, and d-R do not. The signed differences computed in
residue-atom-error have absolute values (d-R)/(N*d) on the first group and R/(N*d) on the second. Sum the two
constants with their group cardinalities and simplify. At R=0 the sum is zero. If N<d, Nat.mod_eq_of_lt gives
R=N and cancellation gives the displayed specialization.

**Checks.**

- N=5,d=3 gives 4/15. N=2,d=5 gives 6/5; summed absolute error can exceed 1.

- N=6,d=3 and d=1 give zero. Half this finite sum is the finite-law total variation; no new variation carrier is
  defined.

*Needs:* §0.7 (residues with a shifted remainder); Mathlib `ZMod.finEquiv`; Mathlib `ZMod.val_injective`; Mathlib
`ZMod.val_natCast_of_lt`; Mathlib `Finset.card_range`; Mathlib `Equiv.prod_comp`.

A is represented by a Finset of the finite native residue carrier.

**Sharp residue event bound**. For every subset A of ZMod d, |mu_N({n : cast(n) belongs to A})-|A|/d| <=
R*(d-R)/(N*d). The bound is attained by A={a : rho(a)<R}. ([TAO-RESIDUES](#references) Section 3,
Equidistribution of residues, first six paragraphs: single-residue counts, Chinese remainder passage, and the
large-product obstruction.)

Partition the empirical event into its disjoint residue atoms and sum their probabilities, using finite
empirical indicators. The sum of all signed differences is zero. Each positive atom error is (d-R)/(N*d) and
there are R such atoms; their total is R*(d-R)/(N*d). The negative total is its negative. The sum over any A
lies between these negative and positive totals. The heavy-residue set selects exactly the positive errors,
giving equality, including R=0 with an empty set.

**Checks.**

- N=5,d=3,A={1,2}: discrepancy is 2/15, exactly half the summed error.

- Empty and full A have zero error; cardinality is taken in ZMod d, so duplicate integer representatives do not
  count twice.

*Needs:* §0.7 (residues with a shifted remainder); Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `Finset.prod_le_prod'`.

L,U are real with L<=U and F has pointwise values in [L,U].

**Bounded residue statistic bound**. For F:ZMod d->R and real L<=U with L<=F(a)<=U for every a, |integral
F(cast(n)) dmu_N - (1/d) sum_a F(a)| <= (U-L)*R*(d-R)/(N*d). ([TAO-RESIDUES](#references) Section 3,
Equidistribution of residues, first six paragraphs: single-residue counts, Chinese remainder passage, and the
large-product obstruction.)

One route uses integral_empiricalMeasure and regroup the finite sample by its residue, obtaining sum_a F(a)*p(a).
Subtract the uniform finite mean. The atom errors sum to zero, so replacing F by F-L leaves the discrepancy
unchanged. This shifted function lies between 0 and U-L. Split the finite sum by the sign of the atom errors.
Its positive and negative bounds are (U-L) times the common positive error mass computed in
residue-event-error. Apply the absolute-value bound. All integrals are finite empirical integrals; no target
measurability or integrability assumption is missing.

**Checks.**

- Constant F has exactly zero error even if its constant is negative.

- At N=5,d=3 take F=1 on {1,2} and -1 on {0}: the error is 4/15, attained with U-L=2.

*Needs:* §0.7 (residues with a shifted remainder); Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`;
Mathlib `Finset.prod_fiberwise`; Mathlib `Finset.prod_le_prod'`.

### 0.8 Joint residue laws through CRT

Transport the preceding formulas through the native CRT equivalence. Composite coprime moduli, unit moduli and an empty index family are all included.

m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m, on discrete
naturals. All probabilities and normalized expressions below are real. I is any finite index type, possibly
empty; q:I->N has positive values and is pairwise coprime. Put Q=product_i q(i), R=N mod Q, E=ZMod.prodEquivPi
q, and J(a)=mu_N({n : for every i, the cast of n in ZMod(q(i)) equals a(i)}). The tuple a lies in the native
dependent product of ZMod(q(i)). Moduli 1 and composite coprime moduli are allowed.

**Joint residue atom formula**. For every residue tuple a, put `c=E^{-1}(a)` in ZMod Q. Then
`J(a)=[floor(N/Q)+1_{(c-1).val<R}]/N`. ([TAO-RESIDUES](#references) Section 3, Equidistribution of
residues, first six paragraphs: single-residue counts, Chinese remainder passage, and the large-product
obstruction.)

The native ring equivalence E takes cast(n) to the tuple of its coordinate casts, by prodEquivPi_apply and
preservation of natural casts. Injectivity identifies the entire tuple event with the single event
`cast(n)=E^{-1}(a)`. Every q(i)>0 implies Q>0, including the empty product Q=1. Apply residue-probability at Q.
This is a probability specialization of an implemented CRT, not a new CRT construction.

**Checks.**

- For q=(2,3),N=5, tuple (0,0) has mass 0 and tuple (1,1) mass 1/5.

- The empty index type has one tuple of probability 1. Noncoprime q=(2,4) is excluded: incompatible tuples
  cannot have uniform positive mass.

*Needs:* §0.7 (residues with a shifted remainder); Mathlib `ZMod.prodEquivPi`; Mathlib `ZMod.prodEquivPi_apply`;
Mathlib `Finset.prod_pos`.

Q divides N.

Prove crt_complete_period_law. If Q divides N, every tuple a has J(a)=product_i(1/q(i)). These atom
identities are exactly the joint uniform product law on the finite residue spaces.
([TAO-RESIDUES](#references) Section 3, Equidistribution of residues, first six paragraphs:
single-residue counts, Chinese remainder passage, and the large-product obstruction.)

The divisibility assumption makes R zero, so crt-residue-probability gives J(a)=1/Q. Move the natural product
through the real cast and invert it to obtain product_i(1/q(i)). Every factor is nonzero. Finite tuples
exhaust all outcomes, so these atom masses specify the joint product law. Summing over any coordinate
rectangle factors into the product of coordinate uniform probabilities by the existing finite product-of-sums
identity. In particular, the all-zero tuple on distinct primes agrees with the complete-period divisibility
law. No independence is asserted without the complete-period or explicit approximation condition.

**Checks.**

- q=(4,9),N=36 gives 1/36 at every tuple, so primality is unnecessary.

- q=(2,3),N=5 is a counterexample; at N=6 every tuple has mass 1/6.

*Needs:* §0.8 (joint residue laws through crt); Mathlib `Finset.prod_inv_distrib`; Mathlib `Fintype.prod_sum`.

**Exact joint residue error**. The sum over all tuples a of |J(a)-product_i(1/q(i))| equals 2*R*(Q-R)/(N*Q).
([TAO-RESIDUES](#references) Section 3, Equidistribution of residues, first six paragraphs:
single-residue counts, Chinese remainder passage, and the large-product obstruction.)

Rewrite the model atom as 1/Q and the arithmetic atom using the event identity in crt-residue-probability.
Reindex the finite sum through the native CRT equivalence E. Apply residue-summed-error at the positive
product Q. For N<Q the exact value is 2*(1-N/Q), giving the source small-support obstruction. For all Q the
half-error is at most Q/(4N), from R*(Q-R)<=Q^2/4; this is useful when Q/N is small, not a general
growing-prime approximation.

**Checks.**

- q=(2,3),N=5 gives 1/3; q=(4,9),N=2 gives 17/9.

- The empty product gives zero error for every N. Noncoprime moduli cannot be inserted into this formula.

*Needs:* §0.8 (joint residue laws through crt); §0.7 (residues with a shifted remainder); Mathlib
`ZMod.prodEquivPi`; Mathlib `Equiv.prod_comp`; Mathlib `Finset.prod_inv_distrib`.

F is real-valued on the finite tuple space; L,U are real and L<=U, with pointwise L<=F<=U.

Prove `crt_statistic_error`. For a real function F on residue tuples with L<=F(a)<=U and L<=U, |integral
F((cast(n) in ZMod(q(i)))_i) dmu_N - [product_i(1/q(i))]*sum_a F(a)| <= (U-L)*R*(Q-R)/(N*Q).
([TAO-RESIDUES](#references) Section 3, Equidistribution of residues, first six paragraphs:
single-residue counts, Chinese remainder passage, and the large-product obstruction.)

Compose F with the existing CRT equivalence E. Its range remains in [L,U]. The empirical statistic becomes the
single-modulus statistic because E preserves natural casts. Apply residue-statistic-error at Q. Reindex the
uniform sum through E, and identify 1/Q with the product of coordinate reciprocal moduli. Indicators of tuple
events have L=0,U=1 and give the event comparison with half the exact summed error. Coordinate products can
use any proved finite range bound; no heuristic replacement of arithmetic statistics is assumed.

**Checks.**

- At q=(2,3),N=5, the indicator of all tuples except (0,0) has discrepancy 1/6.

- Constants have zero error, and all statistics have zero discrepancy when Q divides N.

*Needs:* §0.7 (residues with a shifted remainder); §0.8 (joint residue laws through crt); Mathlib
`ZMod.prodEquivPi`; Mathlib `Equiv.prod_comp`; Mathlib `Finset.prod_inv_distrib`.

### 0.9 Repeated prime factors and finite distribution sandwiches

One route uses the existing ω and Ω. Their nonnegative difference has an exact finite prime-power expansion, yielding a uniform mean bound and a one-sided CDF comparison.

omega and Omega are the existing cardDistinctFactors and cardFactors. Write D(n)=(Omega(n):R)-(omega(n):R),
with casts before real subtraction. D is a local expression, not a new arithmetic-function or random-variable
definition.

**Repeated-factor decomposition**. D(n)=sum over p in n.primeFactors of ((n.factorization(p):R)-1). This holds
for every natural n, including zero and one under the native zero-extension conventions.
([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities and Exercise 46(i),
k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

Rewrite the existing Omega as the Finsupp sum of factorization exponents and use support_factorization to
index by n.primeFactors. Rewrite omega as the cardinality of this finite set using cardDistinctFactors_apply,
primeFactors and List.card_toFinset. Distribute the real subtraction through the finite sum. For n=0 or 1 both
finite supports are empty. Nonnegativity D(n)>=0 follows directly from List.toFinset_card_le; no real cast of
truncated subtraction is silently substituted.

**Checks.**

- D(0)=D(1)=0; D(72)=3 from exponents 3 at 2 and 2 at 3.

- A prime power p^k with k>=1 contributes k-1, not k and not merely the indicator of a repeated prime.

*Needs:* Mathlib `ArithmeticFunction.cardFactors_eq_sum_factorization`; Mathlib `Nat.support_factorization`;
Mathlib `ArithmeticFunction.cardDistinctFactors_apply`; Mathlib `ArithmeticFunction.cardFactors_apply`;
Mathlib `List.card_toFinset`; Mathlib `List.toFinset_card_le`.

n,N,p are natural, 0<n<=N, and p is prime.

**Repeated powers of one prime**. Sum over j in the natural closed interval [2,N] of `1_{p^j divides n}` equals
n.factorization(p)-1, where the right subtraction is natural truncated subtraction.
([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities and Exercise 46(i),
k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

One route uses Prime.pow_dvd_iff_le_factorization to replace each divisibility test by j<=v, with v=n.factorization(p).
Nat.factorization_lt and n<=N imply v<=N. The filtered interval is exactly [2,v]; Nat.card_Icc gives
v+1-2=v-1. When v=0 or 1 this interval is empty. The assumption n>0 is essential: every prime power divides
zero while its native factorization is zero.

**Checks.**

- At n=N=12,p=2 the sum is 1; at p=3 or 5 it is 0.

- At n=N=8,p=2 it is 2. Composite p=4,n=N=16 would give 1 on the left but 0 on the right, so primality cannot be
  dropped.

*Needs:* Mathlib `Nat.Prime.pow_dvd_iff_le_factorization`; Mathlib `Nat.factorization_lt`; Mathlib `Nat.card_Icc`.

n,N are natural and 0<n<=N; primesLE uses the inclusive native prime cutoff.

**Finite repeated-prime-power expansion**. For 0<n<=N, D(n)=sum over p in Nat.primesLE(N), sum over j in
[2,N], `1_{p^j divides n}`, with real indicators. ([TAO-PRIME-FACTORS](#references) Section 4,
opening divisor-sum identities and Exercise 46(i), k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv)
as motivation only.)

Start with excess-factorization. Every supported exponent is positive by Prime.factorization_pos_of_dvd. Thus
its real contribution v-1 is the real cast of the natural v-1 from prime-power-tail-count. Every prime factor
p of n satisfies p<=n<=N. Enlarge the prime-factor sum to primesLE(N); outside the support the exponent is
zero and the tail count is zero. Use prime-power-tail-count on each prime. Both cutoffs are finite. N is
deliberately a crude exponent bound, avoiding logarithmic rounding conventions.

**Checks.**

- At n=72,N=100 the nonzero terms are (2,2),(2,3),(3,2).

- For n=1 or for N=1 the sum is zero. n=0 is excluded, although D(0)=0.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib
`Nat.Prime.factorization_pos_of_dvd`; Mathlib `Nat.mem_primeFactors`; Mathlib `Nat.mem_primesLE`.

m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m on discrete
naturals. Only 1,...,N are sampled.

**Exact repeated-factor mean**. Integral D dmu_N equals sum over p in primesLE(N), sum over j in [2,N],
floor(N/p^j)/N. Natural division is performed before casting to the reals.
([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities and Exercise 46(i),
k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

One route uses integral_empiricalMeasure to express the integral as a finite average. Each sampled n=k+1 satisfies
0<n<=N, so apply excess-prime-power-expansion with this fixed N. Exchange the three finite sums. The average
of each prime-power divisibility indicator is divisibility-probability with positive modulus p^j. This
argument uses counting, not independence; repeated powers of one prime are nested events.

**Checks.**

- At N=4 the mean is 1/4, at N=12 it is 5/12, and at N=16 it is 1/2.

- At N=1,2,3 it is zero. No empty-sample normalization is introduced.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); §0.3 (divisibility probabilities and the
lcm); Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti
`TauCeti.Probability.empiricalMeasure_apply_toReal`.

**Uniform repeated-factor mean bound**. 0<=integral D dmu_N<=1-1/N. In particular the mean is at most 1,
uniformly in the positive sample size. ([TAO-PRIME-FACTORS](#references) Section 4, opening
divisor-sum identities and Exercise 46(i), k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as
motivation only.)

Nonnegativity follows from omega<=Omega, supplied by the existing list finite-set cardinality bound, and
finite empirical integration. Apply excess-mean-formula and divisibility-error termwise to bound
floor(N/p^j)/N by 1/p^j. For each p>=2 the existing geom_sum_Ico_le_of_lt_one at x=1/p,m=2,n=N+1 bounds the
inner sum by (1/p)^2/(1-1/p)=1/[p(p-1)]. Enlarge the nonnegative sum from primes to all integers 2<=r<=N by
the existing sum_le_sum_of_subset_of_nonneg. Rewrite 1/[r(r-1)]=1/(r-1)-1/r and use the existing sum_Icc_sub
telescope to obtain 1-1/N. Treat N=1 separately as an empty sum. No infinite series or Mertens estimate is
used.

**Checks.**

- N=1 gives equality zero; N=12 gives 5/12<=11/12.

- This is an average bound, not D(n)<=1 pointwise: D(16)=3. It gives no bound on higher moments by itself.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); §0.3 (divisibility probabilities and the
lcm); Mathlib `ArithmeticFunction.cardFactors_apply`; Mathlib `ArithmeticFunction.cardDistinctFactors_apply`;
Mathlib `List.toFinset_card_le`; Mathlib `geom_sum_Ico_le_of_lt_one`; Mathlib
`Finset.prod_le_prod_of_subset_of_one_le'`; Mathlib `Finset.prod_Icc_div`; Mathlib `Nat.mem_primesLE`; Tau
Ceti `TauCeti.Probability.integral_empiricalMeasure`.

t is real and strictly positive.

**Repeated-factor tail bound**. For every real t>0, mu_N({n : t<=D(n)}).toReal <= (1-1/N)/t.
([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities and Exercise 46(i),
k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

Apply the existing real Markov inequality to the nonnegative D, whose integrability follows from the finite
empirical Dirac decomposition on discrete naturals. Equivalently, use the empirical indicator formula and the
pointwise inequality `t*1_{t<=D(n)}<=D(n)`; summing finite terms proves the same application without any new
general Markov lemma. Insert excess-mean-bound and divide by positive t. The event is inclusive at t; the
stronger strict-event estimate follows by inclusion if needed.

**Checks.**

- At N=12 the probabilities for t=1,2,3 are 1/3,1/12,0.

- t=0 is forbidden: the event is the whole sample whereas Lean's totalized division would make the proposed
  upper bound zero.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg`; Tau Ceti
`TauCeti.Probability.empiricalMeasure_apply_toReal`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`;
Mathlib `List.toFinset_card_le`; Mathlib `ArithmeticFunction.cardFactors_apply`; Mathlib
`ArithmeticFunction.cardDistinctFactors_apply`.

s is real and strictly positive.

**Scaled repeated-factor L1 bound**. For every real s>0, integral |D(n)/s| dmu_N <= (1-1/N)/s.
([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities and Exercise 46(i),
k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

D>=0 and s>0 give |D/s|=D/s on every natural input, including the zero-extension value. Use
integral_empiricalMeasure and distribute division by s through the finite sum. Apply excess-mean-bound and
positive division monotonicity. The result permits an arbitrary positive scale, independent of any Mertens or
logarithmic normalization theorem; it is not a convergence theorem by itself.

**Checks.**

- At N=12,s=2 the left side is 5/24.

- The scale must be positive in this displayed form; a negative denominator cannot bound a nonnegative integral.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Mathlib `List.toFinset_card_le`; Mathlib
`ArithmeticFunction.cardFactors_apply`; Mathlib `ArithmeticFunction.cardDistinctFactors_apply`.

b,x,s,delta are real, s>0 and delta>0; the same center b and scale s are used for both observations.

**Finite omega-to-Omega distribution comparison**. Put X(n)=(omega(n)-b)/s and Y(n)=(Omega(n)-b)/s, with real
casts. For every real x, mu_N({X<=x-delta}).toReal-(1-1/N)/(s*delta) <= mu_N({Y<=x}).toReal <=
mu_N({X<=x}).toReal. ([TAO-PRIME-FACTORS](#references) Section 4, opening divisor-sum identities
and Exercise 46(i), k=1; Theorem 47 repeated-factor conclusion; Exercise 51(iv) as motivation only.)

The pointwise identity Y=X+D/s and D>=0 give {Y<=x} subset {X<=x}. Apply finite real-measure monotonicity for
the upper bound. If X<=x-delta and Y>x, then D>s*delta. Thus {X<=x-delta} is contained in {Y<=x} union
{s*delta<=D}. Apply real-measure subadditivity. Use excess-tail-bound at t=s*delta and rearrange. The two
sides form one sandwich from the same event comparison. There is no continuity assumption because this is a
finite inequality. Convergence of the X laws and a scale tending to infinity make this sandwich an input to
transfer at continuity points. Such convergence and the generic CDF/weak-convergence dictionary are still
separate obligations, not hypotheses silently discharged here.

**Checks.**

- N=4,b=0,s=1,x=1: the Omega probability is 3/4 while the omega probability is 1; reversing the upper-bound
  direction fails.

- Using different centers or a negative scale invalidates the displayed inclusion. No iid assumption is used.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib
`MeasureTheory.measureReal_mono`; Mathlib `MeasureTheory.measureReal_union_le`; Mathlib
`List.toFinset_card_le`; Mathlib `ArithmeticFunction.cardFactors_apply`; Mathlib
`ArithmeticFunction.cardDistinctFactors_apply`.

### 0.10 Arithmetic laws and convergence in distribution

Native pushforward laws identify arithmetic frequencies, CDFs and characteristic functions. The vanishing repeated-factor error transfers weak limits even when the limiting law has atoms.

m is natural, N=m+1, and mu_N is the existing empiricalMeasure of k mapped to k+1 at index m on discrete
naturals. Samples are 1,...,N, never zero. Repeated observation values retain their multiplicities. All law,
CDF, characteristic-function and convergence objects are native. nu denotes a Borel probability measure on the
real line when present; convergence is along natural m tending to infinity.

**Arithmetic observation frequencies**. For f:N→R and every Borel set B, (map f mu_N).real(B)=#{k in
{0,...,m}: f(k+1) in B}/N. ([TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation (5),
Theorem 13 and its proof.)

Apply native measurability of every map from discrete naturals, then map_measureReal_apply to pull back B.
Apply empiricalMeasure_apply_toReal on the natural-number preimage. Convert its finite sum of 0/1 indicators
to the cardinality of the filtered range and replace inverse multiplication by division. Count indices, not
the image set; no injectivity of f is assumed.

**Checks.**

- A constant observation 7 on N=4 has mass 1 at 7, not 1/4.

- For N=1 and f(n)=n, the law gives mass 1 to {1}, not {0}.

*Needs:* Mathlib `measurable_of_countable`; Mathlib `MeasureTheory.map_measureReal_apply`; Tau Ceti
`TauCeti.Probability.empiricalMeasure_apply_toReal`.

**Arithmetic cumulative distribution counts**. For every f:N→R and x in R, the native cdf of map f mu_N at x
equals #{k in {0,...,m}: f(k+1)<=x}/N. ([TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2
equation (5), Theorem 13 and its proof.)

One route uses native cdf_eq_real for the pushforward probability measure. Apply arithmetic-law-count to the closed
half-line (-infinity,x]. The endpoint is inclusive; no continuity of the finite atomic CDF is assumed.

**Checks.**

- For N=2,f(n)=n,x=1 the CDF is 1/2; a strict endpoint gives 0.

- For N=4,f(n)=n,x=0 the CDF is 0.

*Needs:* §0.10 (arithmetic laws and convergence in distribution); Mathlib `ProbabilityTheory.cdf_eq_real`.

**Arithmetic characteristic-function average**. For every f:N→R and real t, charFun(map f mu_N)(t)=(1/N)
`sum_{k=0}^m` exp(i*t*f(k+1)). The complex division uses the cast of the positive integer N.
([TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation (5), Theorem 13 and its proof.)

Expand native charFun_apply_real: its phase is +i*t*x, without a 2*pi factor. Use integral_map with the
measurable arithmetic observation and continuous complex exponential. Apply the existing complex-valued
integral_empiricalMeasure to the composition on naturals. Rewrite real scalar multiplication on C as division
by the complex cast of N. This identity requires no integrability hypothesis on the infinite observation
sequence: only a finite population is integrated.

**Checks.**

- At t=0 the characteristic function equals 1 for every m and f.

- The constant observation 1 at t=pi/2 has characteristic function i, not -i and not the 2*pi Fourier phase.

*Needs:* Mathlib `measurable_of_countable`; Mathlib `MeasureTheory.charFun_apply_real`; Mathlib
`MeasureTheory.integral_map`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

Use the existing omega=cardDistinctFactors and Omega=cardFactors, with real casts before subtraction.
D=Omega-omega>=0. Put X_m(n)=(omega(n)-b_m)/s_m and Y_m(n)=(Omega(n)-b_m)/s_m with the SAME center and scale.
These are local expressions, not new carriers.

**Lipschitz comparison of prime-factor laws**. For real b, positive s, and a real-valued L-Lipschitz function
g with L>=0, |E_muN[g((Omega-b)/s)]-E_muN[g((omega-b)/s)]| <= L*(1-1/N)/s.
([TAO-PRIME-FACTORS](#references) Section 4 Exercise 46(i), k=1, and Exercise 51(iv);
[TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation (5), Theorem 13 and its proof.)

Rewrite both empirical integrals as finite normalized sums. Thus even globally unbounded g is integrable here.
For every sampled n, the common center cancels and |Y-X|=|D/s|. The native Lipschitz inequality bounds
|g(Y)-g(X)| by L*|D/s|. Apply the existing finite triangle inequality and termwise sum monotonicity, pull out
the nonnegative factor L, and rewrite the resulting average as the empirical integral of |D/s|. Apply
excess-scaled-l1. The bound is not a pointwise claim D<=1, and requires no independence, differentiability or
boundedness of g.

**Checks.**

- A constant statistic has comparison error zero at every sample size.

- At N=4,b=0,s=1,g=id the signed mean gap is +1/4.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib `lipschitzWith_iff_dist_le_mul`;
Mathlib `Finset.abs_sum_le_sum_abs`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

**Vanishing normalized repeated-factor mean**. For any real sequence s_m tending to positive infinity,
E_mu(m+1)[|D/s_m|] tends to 0. Finitely many zero or negative scales are allowed by native total division and
do not affect the limit. ([TAO-PRIME-FACTORS](#references) Section 4 Exercise 46(i), k=1, and
Exercise 51(iv); [TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation (5), Theorem 13
and its proof.)

Divergence of s_m implies s_m>0 eventually, so the existing excess-scaled-l1 applies on that tail. The
integral is nonnegative and is at most (1-1/N)/s_m<=1/s_m eventually. Here N=m+1>=1 and 1/N>=0. Compose
tendsto_inv_atTop_zero with the scale limit and use the native eventual squeeze theorem. Do not require
positivity at m=0.

**Checks.**

- The scale s_m=m gives the zero limit although its first term is zero.

- At fixed scale 1 and N=4 the absolute mean is 1/4; scale divergence cannot be dropped from the proof.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib `tendsto_inv_atTop_zero`;
Mathlib `squeeze_zero'`.

**Vanishing repeated-factor tail frequencies**. For s_m tending to positive infinity and every epsilon>0,
mu_(m+1).real{n: epsilon<=|D(n)/s_m|} tends to 0. This is a tail-frequency limit for changing measures, not a
fixed-measure TendstoInMeasure statement. ([TAO-PRIME-FACTORS](#references) Section 4 Exercise
46(i), k=1, and Exercise 51(iv); [TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation
(5), Theorem 13 and its proof.)

For each m the absolute normalized excess is a nonnegative integrable finite-population observation;
integrability follows directly from the native finite Dirac sum. Apply the native real Markov inequality at
epsilon. Divide by epsilon>0 to bound the event mass by E[|D/s_m|]/epsilon. Apply excess-l1-limit, continuity
of division by the nonzero constant epsilon and the nonnegative squeeze theorem. No assertion about
convergence of the observations on one common probability space is needed.

**Checks.**

- For s_m=m+1 and threshold epsilon=1, the tail frequency tends to zero.

- At epsilon=0 the event has mass 1 for every m and scale, so a nonnegative threshold premise is insufficient.

*Needs:* §0.10 (arithmetic laws and convergence in distribution); Mathlib
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg`; Mathlib `squeeze_zero`; Tau Ceti
`TauCeti.Probability.empiricalMeasure`.

Prove `excess_distribution_transfer`. For arbitrary real centers b_m, a real scale s_m tending to positive
infinity, and any Borel probability measure nu on R, (omega-b_m)/s_m under mu_(m+1) converges in distribution
to nu if and only if (Omega-b_m)/s_m does. The limit law need not have a continuous CDF.
([TAO-PRIME-FACTORS](#references) Section 4 Exercise 46(i), k=1, and Exercise 51(iv);
[TAO-CLT-2010](#references) Section 1 Exercise 5; Section 2 equation (5), Theorem 13 and its proof.)

All observations are measurable on discrete naturals; their pushforward laws are native probability measures.
*Needs:* the existing bounded-Lipschitz integral characterization of weak convergence. For each bounded L-Lipschitz
test function g, integral_map rewrites integrals against the two laws as the arithmetic expectations. On the
eventual positive-scale tail, excess-lipschitz-bound gives their absolute difference at most L/s_m. The last
bound tends to zero by reciprocal convergence. Apply the eventual squeeze theorem to the absolute difference,
then the native metric criterion and addition/subtraction of limits to transfer the limiting integral from
either law to the other. Apply the reverse direction of the same bounded-Lipschitz characterization. No new
Slutsky theorem is planned, and its existing fixed-sampling-measure helper is not misapplied. Specializing the
center and scale to the log-log Erdős–Kac normalization is valid once their scale divergence and the omega
Gaussian-limit premise are supplied.

**Checks.**

- The equivalence holds for s_m=m+1 and arbitrary common b_m and target probability nu.

- At N=4, the unnormalized Omega law assigns mass 1/4 to {2}, whereas the omega law assigns mass 0. Only the
  stated asymptotic equivalence is claimed.

*Needs:* §0.10 (arithmetic laws and convergence in distribution); Mathlib `MeasureTheory.TendstoInDistribution`;
Mathlib `MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto`; Mathlib `MeasureTheory.integral_map`;
Mathlib `measurable_of_countable`; Mathlib `tendsto_inv_atTop_zero`; Mathlib `squeeze_zero'`; Mathlib
`tendsto_iff_dist_tendsto_zero`.

Prove `cdf_weak_criterion`. For ν_m,ν:ProbabilityMeasure ℝ, ν_m converges weakly to ν if and only if
cdf(ν_m,x)→cdf(ν,x) at every continuity point x of the limiting native CDF. Atoms of ν are allowed; no
convergence is demanded at their jumps. ([ML-PM79](#references) CDF.cdf_eq_real and
Portmanteau.IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem.)

Forward: apply the native null-frontier Portmanteau theorem to Iic at a continuity point. Reverse: subtract
CDF limits on half-open intervals with continuity endpoints; these form a measurable pi-system and arbitrarily
small neighborhoods. Apply the native pi-system theorem. Continuity points of the limiting CDF are dense because a finite measure has countably many atoms.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`; Mathlib `ProbabilityTheory.cdf_eq_real`; Mathlib
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`.

### 0.11 Exponential and fixed-moment bounds for repeated factors

A positive geometric expansion at each prime gives a finite Euler bound. Its explicit exponential moment controls every fixed power and every real tail threshold.

m,n,N,k are natural. Where m occurs set M=m+1 and use mu_M, the existing empiricalMeasure of k mapped to k+1
at index m, on discrete naturals. Its support is 1,...,M, never zero. D(n)=(Omega(n):R)-(omega(n):R), with
real casts before subtraction and the native cardFactors/cardDistinctFactors. D is nonnegative. Put a=3/2 and
t=log(a)>0 only as local scalar notation; no new definition or carrier is exported. All finite sums use their
displayed inclusive cutoffs.

**Positive geometric expansion at one prime**. For n>0, n<=N and prime p, `a^(v_p(n)-1)=1+sum_{j=2}^N`
`1_{p^j|n}·(1/2)·a^(j-2)`, where v_p(n)=n.factorization p and both subtractions in natural exponents are
truncated. ([TAO-PRIME-FACTORS](#references) Section 4, Exercise 46(ii); Exercise 46(i), Theorem 47
and Exercise 51(iv) explain the uses.)

Set v=v_p(n). The native divisibility criterion says p^j|n iff j<=v; positivity of n is essential. Native
factorization_lt gives v<n<=N. If v=0 or v=1, the indicated exponent interval contributes nothing and the
natural exponent v-1 is zero, so both sides equal one. For v>=2, reindex j=i+2 over i=0,...,v-2. The native
finite geometric identity at a=3/2 gives `(1/2)·sum_{i=0}^{v-2}a^i=a^(v-1)-1`. No contribution from j=1 is
permitted: the weight measures repeated factors, not all factors.

**Checks.**

- At n=1 and p=2 the local weight is 1.

- At n=8 and p=2 the local weight is 9/4.

- At n=p=2 the local weight is 1, not 3/2.

*Needs:* Mathlib `Nat.Prime.pow_dvd_iff_le_factorization`; Mathlib `Nat.factorization_lt`; Mathlib `geom_sum_mul`.

**Finite prime product for the excess exponential**. For n>0 and n<=N, `exp(tD(n))=product_{p<=N, prime}`
a^(v_p(n)-1), with truncated natural exponents. ([TAO-PRIME-FACTORS](#references) Section 4,
Exercise 46(ii); Exercise 46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

One route uses the finite repeated-prime-power expansion and single-prime count to write D(n) as the sum over primes p<=N
of the real cast of v_p(n)-1. Distribute multiplication by t over this finite sum and apply native exp_sum.
For each natural exponent e, native exp_nat_mul and exp_log(a)=a identify exp(te)=a^e. No real-power
convention is substituted for the natural exponent. If N=1, the product is empty and n=1 has D=0. The positive
sample ensures the zero-divisibility pathology is never used.

**Checks.**

- At n=72, exp(tD)=27/8.

- At the squarefree n=30, exp(tD)=1.

*Needs:* §0.9 (repeated prime factors and finite distribution sandwiches); Mathlib `Real.exp_sum`; Mathlib
`Real.exp_nat_mul`; Mathlib `Real.exp_log`.

**Finite Euler upper bound for the excess mean**. For M=m+1, `E_mu_M[exp(tD)]<=product_{p<=M`,
`prime}(1+sum_{j=2}^M` (1/2)·a^(j-2)/p^j). ([TAO-PRIME-FACTORS](#references) Section 4, Exercise
46(ii); Exercise 46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

On the positive sample, replace exp(tD) by the finite prime product and then replace each local factor by its
positive geometric expansion. Expand the product using the native finite product-of-sums theorem. At each
prime the choices are the constant term or an exponent j in [2,M]. Give the constant choice exponent zero,
weight one and modulus p^0=1. For a chosen exponent family, powers of distinct primes are pairwise coprime by
the native theorem. Identify all zero-residue events with divisibility via natCast_eq_zero_iff. The CRT atom
formula gives joint probability floor(M/Q)/M for Q=product p^j. To see the remainder indicator vanish at the
zero tuple, its inverse CRT residue is zero and (-1).val=Q-1; the remainder R is always less than Q. This
includes Q=1, where R=0. Thus no event is assumed independent. Every coefficient is nonnegative. Replace
floor(M/Q)/M by 1/Q, factor that denominator over the chosen prime powers, and reverse the finite product
expansion. All integration is the native finite empirical sum. There is no limiting product or infinite
interchange of sums.

**Checks.**

- For M=4 the exponential mean is exactly 9/8.

- For M=3 every sampled integer is squarefree and the exponential mean is 1.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); §0.8 (joint residue laws through crt);
Mathlib `Nat.coprime_pow_primes`; Mathlib `ZMod.natCast_eq_zero_iff`; Mathlib `Fintype.prod_sum`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`.

**Uniform bound for one repeated-factor Euler term**. For any prime p and natural N, `sum_{j=2}^N`
(1/2)·a^(j-2)/p^j <= 2/p^2. ([TAO-PRIME-FACTORS](#references) Section 4, Exercise 46(ii); Exercise
46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

If N<2 the sum is empty and the right side is positive. Otherwise reindex j=i+2. The sum is
`[1/(2p^2)]·sum_{i=0}^{N-2}(3/(2p))^i`. Since p>=2, the ratio is in (0,3/4], strictly less than one. The native
finite geometric bound gives at most 1/[p(2p-3)]. The inequality 1/[p(2p-3)]<=2/p^2 follows by positive
cross-multiplication from p>=2. It is equality at p=2 at the infinite-sum bound, not at a finite cutoff. The
fixed base a=3/2 is below 2. At base 2 the local ratio at p=2 is one and this uniform argument fails.

**Checks.**

- For p=2,N=2 the sum is 1/8.

- At N=1 the sum is zero for every p.

- Replacing a by 2 gives `sum_{j=2}^{10}2^(j-2)/2^j=9/4`; geometric decay is lost.

*Needs:* Mathlib `geom_sum_Ico_le_of_lt_one`.

**Uniform finite excess Euler product bound**. For any finite set P of primes and any natural N, `product_{p in`
`P}(1+sum_{j=2}^N` (1/2)·a^(j-2)/p^j)<=exp(2). ([TAO-PRIME-FACTORS](#references) Section 4, Exercise
46(ii); Exercise 46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

All local sums are nonnegative. Apply excess-local-euler-bound and finite product monotonicity to bound the
product by `product_{p in P}(1+2/p^2)`. Use native prod_one_add_le_exp_sum with the globally nonnegative
function n mapped to 2/(n:R)^2; total division at n=0 still gives a nonnegative value. The result is
`exp(2·sum_{p in P}1/p^2)`. Take B=max(2,max P), with any native finite supremum implementing the empty case.
Because all p>=2, enlarge the nonnegative sum to integers r=2,...,B. For r>=2, 1/r^2<=1/[r(r-1)]=1/(r-1)-1/r.
The existing additive form generated by prod_Icc_div telescopes the latter finite sum to 1-1/B<=1. The
subset-sum monotonicity is the additive form of the native multiplicative supplier. Monotonicity of exp now
gives exp(2). Empty P has product one and satisfies the same bound. No prime-reciprocal asymptotic, Mertens
theorem or infinite Euler product enters.

**Checks.**

- The empty prime-family product is 1.

- For P={2,3},N=2 the product is 19/16.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); Mathlib `Real.prod_one_add_le_exp_sum`;
Mathlib `Real.exp_le_exp`; Mathlib `Finset.prod_Icc_div`; Mathlib `Finset.prod_le_prod_of_subset_of_one_le'`.

Prove `excess_exponential_mean`. For every M=m+1>=1, E_mu_M[exp(log(3/2)·D)]<=exp(2), with an absolute
constant independent of M. ([TAO-PRIME-FACTORS](#references) Section 4, Exercise 46(ii); Exercise
46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

Apply excess-exponential-euler at M=m+1. The native primesLE membership theorem supplies primality of every
member; apply excess-finite-euler-bound to that finite set with cutoff M. Compose the inequalities. This is a
finite-sample theorem, not an assertion that the prime-power events are independent or that the distribution
has a limit.

**Checks.**

- For M=1 the exponential mean is 1.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); Mathlib `Nat.mem_primesLE`.

Prove excess_all_moments. For every natural k and M=m+1, E_mu_M[|D|^k]<=exp(2)·k!/[log(3/2)]^k. In
particular `sum_{n=1}^M` D(n)^k is bounded by M times this explicit k-dependent constant.
([TAO-PRIME-FACTORS](#references) Section 4, Exercise 46(ii); Exercise 46(i), Theorem 47 and
Exercise 51(iv) explain the uses.)

D>=0 follows from distinct-factor cardinality at most total-factor cardinality (or the nonnegative
factorization sum). Thus |D|=D, including the arithmetic zero extension. For t=log(3/2)>0, apply the native
inequality (tD)^k/k!<=exp(tD). Both t^k and k! are strictly positive, even for k=0. Rearrange pointwise to
D^k<=[k!/t^k]exp(tD). Average over the finite positive sample using its native sum formula and then apply
excess-exponential-mean. The implied constant depends on k and is not claimed uniform in growing k. At k=0 the
actual mean is one. The unnormalized sum version follows by multiplying by M; for a real cutoff x>=1, take
M=floor(x)<=x.

**Checks.**

- The zeroth moment is exactly 1 for every positive sample, not zero.

- For M=8 the second excess moment is 5/8.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); §0.9 (repeated prime factors and finite
distribution sandwiches); Mathlib `List.toFinset_card_le`; Mathlib `Real.pow_div_factorial_le_exp`; Mathlib
`Real.log_pos`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

Prove excess_exponential_tail. For every M=m+1 and every real threshold u,
mu_M{n:u<=D(n)}<=exp(2-log(3/2)·u), with inclusive threshold and real-valued probability.
([TAO-PRIME-FACTORS](#references) Section 4, Exercise 46(ii); Exercise 46(i), Theorem 47 and
Exercise 51(iv) explain the uses.)

The function exp(tD) is nonnegative and integrable for the finite empirical measure. Native Markov bounds
exp(tu) times the probability of exp(tu)<=exp(tD) by its mean. Because t>0 and exp preserves and reflects
order, this event is exactly u<=D. There is no strict-versus-weak threshold change. Divide by exp(tu)>0, use
the exponential mean bound, and apply native exp_sub. The argument permits every real u; for u<=0 the bound
may exceed one but remains valid.

**Checks.**

- For M=8 the inclusive tail probability P(D>=2) is 1/8.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); Mathlib
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg`; Mathlib `Real.exp_le_exp`; Mathlib `Real.exp_sub`; Mathlib
`Real.log_pos`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

**Scaled repeated-factor moment bounds**. For every natural k, M=m+1 and real s>0,
E_mu_M[|D/s|^k]<=exp(2)·k!/([log(3/2)]^k·s^k). ([TAO-PRIME-FACTORS](#references) Section 4,
Exercise 46(ii); Exercise 46(i), Theorem 47 and Exercise 51(iv) explain the uses.)

Since s>0, |D/s|^k=|D|^k/s^k, with s^k>0 even when k=0. Pull the positive scalar through the native finite
empirical sum and apply excess-all-moments. This gives the quantitative finite input for higher-moment
comparisons at diverging scales. It does not assert an arithmetic Gaussian limit or a uniform growing-order
estimate.

**Checks.**

- For M=8,s=2,k=2 the scaled moment is 5/32.

- At s=2,k=0 the scaled moment is 1 for every positive sample.

*Needs:* §0.11 (exponential and fixed-moment bounds for repeated factors); Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`.

### 0.12 Concentration of real laws

One route uses strict real intervals of radius δ. The resulting concentration function supports the equal-radius Kolmogorov–Rogozin estimate with its separate zero-denominator case.

Define `concentration`. For ν:ProbabilityMeasure ℝ and δ∈ℝ, `Q(ν,δ)=sup_{u∈ℝ}ν.real((u−δ,u+δ))`. The intervals
are strict and δ is the radius, not the length. For δ≤0 the value is zero. ([BSKK2023](#references) Lemma
7.2, physical p.36, concentration convention.)

Its basic API consists of these facts.

- For every real radius, the concentration lies in [0,1] and is 0 at nonpositive radii.
- The concentration is monotone in the radius and invariant under translating the law.
- For a≠0, scaling the observation by a divides the radius by |a|.

One route uses native real measure on Ioo and real sSup. All terms lie in [0,1], so the supremum is bounded. Consumers
pass native pushforward laws of measurable real observations. Do not apply the real theorem directly to
complex observations.

**Checks.**

- A dirac law has zero concentration at zero radius because the interval is strict.

- A dirac law has concentration one at every positive radius.

- For equal atoms at 0 and 1, radius 1/2 has Q=1/2; closed intervals would wrongly give 1. A positive-radius interval captures an entire Dirac mass, giving concentration 1.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`.

Prove concentration_bounds. For every real radius, 0≤Q≤1. ([BSKK2023](#references) Lemma 7.2, physical
p.36, concentration convention.)

*Needs:* §0.12 (concentration of real laws).

Prove concentration_mono. Increasing the radius cannot decrease Q. ([BSKK2023](#references) Lemma 7.2,
physical p.36, concentration convention.)

*Needs:* §0.12 (concentration of real laws).

Prove concentration_translate. Translation of a real law leaves Q unchanged. ([BSKK2023](#references)
Lemma 7.2, physical p.36, concentration convention.)

*Needs:* §0.12 (concentration of real laws).

Prove concentration_scale. For a≠0, Q(law(aX),δ)=Q(law(X),δ/|a|). ([BSKK2023](#references) Lemma 7.2,
physical p.36, concentration convention.)

*Needs:* §0.12 (concentration of real laws).

Prove `kolmogorov_rogozin`. There is an absolute C>0 such that for every finite independent family of a.e.
measurable real random variables X_j on a probability space, every δ>0, and D=Σ_j(1−Q(law X_j,δ))>0, Q(law(Σ_j
X_j),δ)≤C/sqrt(D). Radii are equal; the D=0 case is the separate trivial bound Q≤1. ([BSKK2023](#references)
Lemma 7.2, physical p.36; references [19,33,34].)

Match equal-radius real Kolmogorov–Rogozin, with native iIndepFun and native pushforwards.

*Needs:* §0.12 (concentration of real laws).

### 0.13 The growing-prime valuation model

**Summed rough-number comparison.** Uniformly for N≥3 and 2≤y≤N, the sum over y-smooth d of |Φ(N/d,y)/N−V(y)/d| is at most C exp(−c log N/log y), with Φ(X,y) counting positive y-rough integers ≤X and `V(y)=∏_{p≤y}(1−1/p)`, and absolute positive C,c. Here y-smooth means that every prime divisor is ≤y; y-rough means that every prime divisor is >y, and 1 belongs to both classes. The sum includes every positive smooth d, including d>N; Φ(N/d,y)=0 there. (Kubilius2021, (1.1), physical p.2; Kubilius1964, small-prime valuation comparison.)

**Checks.**

- For N=4,y=2, V=1/2, the smooth d=1,2,4 have arithmetic masses 1/2,1/4,1/4 and model masses 1/2,1/4,1/8; the smooth tail d≥8 has model mass 1/8. The summed absolute error is 1/4 and total variation is 1/8.

*Needs:* §0.3 finite divisibility counts; §0.5 inclusion–exclusion; native prime factorization and positive geometric series.

The Kubilius comparison concerns full prime valuations on a growing index set. Its exponential total-variation bound is an additional theorem; it does not follow by summing finite-head errors when the prime product is too large.

Prove `kubilius_small_prime_model`. For each positive integer N sample J_N uniformly from {1,…,N}. Let β_N>0
tend to infinity and P_N={p prime:p≤N^(1/β_N)}. The joint valuation vector (J_N.factorization p)_(p∈P_N) is
compared with independent geometric exponents G_p having P(G_p=k)=(1−1/p)p^(−k), k≥0. There are C,δ>0
(independent of N) such that, eventually, their total variation distance is at most C exp(−δβ_N). Total
variation is one-half the sum of absolute atom-probability differences. Positive support is essential; a
coordinate is an exponent, not merely a divisibility bit. ([Kubilius2021](#references) Classical uniform
result (1.1), physical p.2, and exact atom convention (1.6), p.3.)

One route uses the native factorization map on the finite positive integer sample and the native finite product of
geometricMeasure with success parameter 1−1/p. The bound (1.1) is quoted there from Kubilius [10], not proved
by the finite CRT comparison. Apply the summed rough-number comparison of this section: for y=N^(1/β_N), every exponent vector has y-smooth product d and arithmetic atom Φ(N/d,y)/N, while its independent atom is V(y)/d. The summed rough-number error, divided by two, is exactly the required total-variation bound. For y<2 both vectors have the empty law. No restriction to divisibility bits is made. The model is specified by its native product atom laws; its independence alone
does not imply this arithmetic comparison.

*Needs:* Mathlib `ProbabilityTheory.geometricMeasure`; Mathlib `ProbabilityTheory.geometricMeasure_real_singleton`;
Mathlib `Nat.primesLE`; §0.5 (boolean patterns and complete periods); summed rough-number comparison.

### Examples

Take P={2,3} and a(p)=p. On 1,…,5 the truncation values are 0,2,3,2,0. Hence
A=2, L=5 and V=3, while the actual mean is 7/5 and the second moment about A is
(4+0+1+0+4)/5=9/5. The comparison error is 6/5, within 2L²/N=10. On 1,…,6 the extra
value 5 gives mean 2 and centered second moment 3 exactly. This calculation detects both a wrong
center and an independence claim outside a complete period. The corresponding Boolean atoms at
N=6 have probabilities 1/3,1/3,1/6,1/6 for neither, only 2, only 3, both.

For d=3 and N=5 the residue masses at 0,1,2 are 1/5,2/5,2/5. Here R=2 and the signed
errors are −2/15,1/15,1/15. Their absolute sum is 4/15, while the event {1,2} has error
2/15, attaining half that sum. For CRT moduli 2 and 3, the complete period 1,…,6 visits
each ordered residue pair once. Coprime composite moduli 4 and 9 give the same conclusion
on a period of 36. Omitting positivity would allow an infinite residue space at modulus zero.

At n=12, ω(n)=2 and Ω(n)=3, so the excess is 1. At n=16 it is 3. For N=4 its values
are 0,0,0,1; with b=0, s=1 and g=id, the Ω mean exceeds the ω mean by 1/4. A tail
threshold t≤0 has probability one and is handled by the same exponential bound. At k=0
the moment integrand is one, including at excess zero. These examples use the finite
factorization and counting identities of §§0.9–0.11.

The law giving mass 1/2 to each of 0 and 1 has concentration 1/2 at radius 1/2: a strict
interval of that radius cannot contain both atoms. A closed-interval definition would give
one. At radius zero every strict interval is empty, even for a Dirac law. Finally, the
prime-valuation model gives P(v₂=2)=1/8; Bernoulli observations cannot encode this atom.

### Dependencies

One route uses the arithmetic-function, factorization, positive-multiples, finite-product, CRT and
empirical-measure APIs specified in the supplier contracts. The concentration and weak-law
interfaces use native probability, independent random variables, CDFs and characteristic
functions. The Kubilius bound is a further number-theoretic input, separate from the elementary
finite residue comparison. No later layer is used.

## Layer 1: Additive limit laws

### 1.1 The finite centered prime model

Write the local centered Bernoulli moment explicitly and expand the finite model by multiplicities. No asymptotic hypothesis is used at this stage.

Write u_p=1/p, nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e and v_p=u_p(1-u_p). These are local expressions, not new
carriers. Since p is prime, 0<u_p<=1/2. The exponent is a natural number at least two. No assertion of
vanishing for odd exponents is made.

**Centered prime factor bounds**. For a natural prime p and e>=2, 0<=nu_p(e)<=v_p.
([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing and
smaller-support discussion on p.5.)

Write e=j+2 and factor nu_p(e)=u_p(1-u_p)((1-u_p)^(j+1)-(-u_p)^(j+1)). Since 0<=u_p<=1-u_p<=1, power
monotonicity and the absolute-value bound give a nonnegative bracket. Each of the two absolute powers is
bounded by its base, so the bracket is at most (1-u_p)+u_p=1. Multiply by v_p>=0. Direct algebra also gives
nu_p(0)=1, nu_p(1)=0 and nu_p(2)=v_p; these evaluations are routine uses of the expression, not new
definitions.

**Checks.**

- At p=3,e=3 and e=4 the factor is 2/27, positive and at most 2/9.

- At p=2 all odd factors vanish, while e=2 gives 1/4.

- Do not extend the conclusion to signed weighted factors a(p)^e.

*Needs:* Mathlib `pow_le_pow_left₀`; Mathlib `pow_le_of_le_one`.

P is a finite set of natural primes, u_p=1/p, nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e, v_p=u_p(1-u_p), `V=sum_{p`
in P}v_p and `Q=sum_{p in P}v_p^2`. These are local expressions, not new carriers. In particular 0<u_p<=1/2 and
v_p>=0. k is any natural number, including zero. The empty tuple and zero multiplicity assignment both
contribute one when k=0.

**Prime model multinomial expansion**. Let M_k be the unit-weight ordered-tuple model: sum over
t:{0,...,k-1}->P of `product_{p in image(t)}nu_p(|t^{-1}(p)|)`. Then `M_k=sum_{alpha in piAntidiag(P,k)}`
multinomial(P,alpha) `product_{p in P}nu_p(alpha(p))`. Here piAntidiag consists of natural-valued functions,
zero off P, with total k; `multinomial(P,alpha)=k!/product_{p in P}alpha(p)!`. ([GS-SIEVING](#references)
Author copy, proof of Proposition 2, internal pp.4-6; pairing and smaller-support discussion on p.5.)

One route uses the positive complete period `N=product_{p in P}p` (equal to one for empty P). The existing
complete-period-centered-product formula evaluates every mixed product exactly. Expand the centered prime sum
to the k-th power once with Finset.sum_pow' and group repeated positions by image fibers, as in
weighted-moment-comparison. Integrating gives M_k exactly, because this chosen period is complete. Expand the
same power with Finset.sum_pow_eq_sum_piAntidiag and integrate term by term. Complete-period-centered-product
gives the stated multinomial sum. Equate these two finite averages. This argument imports the generic
multinomial identity and uses an auxiliary complete period only to identify finite model expressions. It makes
no independence assertion at an arbitrary empirical sample length.

**Checks.**

- M_0=1 also for empty P; M_k=0 for empty P and k>0.

- For P={2,3}, k=4, the expression is 203/432, not its paired contribution 1/3.

- An assignment with some multiplicity one contributes zero; zero multiplicities contribute factors one.

*Needs:* §0.6 (mixed products and higher finite moments); Mathlib `Finset.sum_pow_eq_sum_piAntidiag`; Mathlib
`Nat.multinomial`; Mathlib `Finset.mem_piAntidiag`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`.

### 1.2 Paired supports and collision control

The leading even contribution comes from multiplicity two. A collision bound and an exact composition count control every remaining support without division by the total variance.

P is a finite set of natural primes, u_p=1/p, nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e, v_p=u_p(1-u_p), `V=sum_{p`
in P}v_p and `Q=sum_{p in P}v_p^2`. These are local expressions, not new carriers. In particular 0<u_p<=1/2 and
v_p>=0. The portion means the sum of multinomial(P,alpha) `product_{p in P}nu_p(alpha(p))` over alpha in
piAntidiag(P,2r) satisfying the displayed multiplicity restriction.

**Paired prime contribution**. For r>=0 let `H_r=sum_{S subset P, |S|=r}` `product_{p in S}v_p`. The portion of
the multinomial model M_(2r) over assignments alpha(p) in {0,2} is ((2r)!/2^r) H_r.
([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing and
smaller-support discussion on p.5.)

Such an assignment is uniquely determined by S={p in P:alpha(p)=2}; its total forces |S|=r, and conversely
each r-subset gives an assignment. At that assignment nu_p(0)=1 and nu_p(2)=v_p. The product of multiplicity
factorials is 2^r. Use Nat.multinomial_spec to identify the coefficient with (2r)!/2^r in the reals. Reindex
the finite sum by the r-subsets. For r=0 all products and factorials are one.

**Checks.**

- For P={2,3},r=2 the contribution is 6(1/4)(2/9)=1/3.

- For |P|<r it is zero; this is not the whole even moment.

- The r=0 formula remains one for empty P.

*Needs:* §1.1 (the finite centered prime model); Mathlib `Nat.multinomial_spec`; Mathlib `Finset.mem_powersetCard`.

The tuple is ordered and injective. Empty-index sums/products use the usual conventions.

**Distinct prime variance tuples**. For r>=0 put D_r=sum over injective t:{0,...,r-1}->P of
`product_{j<r}v_{t(j)}`. Then D_r=r! H_r, where H_r sums products of v_p over r-element subsets of P.
([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing and
smaller-support discussion on p.5.)

Group the injective tuples by image S. Only r-subsets occur. For each S the fiber consists of bijections from
Fin r to the subtype of elements of S. Since |S|=r, fix one such equivalence and apply Fintype.card_equiv to
get exactly r! bijections. The product along every such bijection is `product_{p in S}v_p`. Sum the constant
fiber values, also handling the unique empty bijection at r=0.

**Checks.**

- For P={3},r=2 the tuple set is empty.

- For P={2,3},r=2 the two orders contribute 1/9 in total.

- For r=0 both D_r and H_r are one.

*Needs:* Mathlib `Fintype.card_equiv`; Mathlib `Finset.mem_powersetCard`; §1.2 (paired supports and collision
control).

No lower bound on V and no nonemptiness hypothesis on P are needed; there is no division by V.

**Prime variance collision estimate**. For r>=2, with D_r the injective ordered variance tuple sum,
0<=V^r-D_r<=binom(r,2) Q V^(r-2). ([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal
pp.4-6; pairing and smaller-support discussion on p.5.)

Expand V^r as the sum of products over all ordered r-tuples. Nonnegative weights show the injective sub-sum is
at most the full sum. A noninjective tuple has some equal pair of distinct positions. Bound its weight by the
sum of its memberships in those collision events; this is a finite union bound with multiplicities allowed.
For a fixed two-position subset, sum first over the common prime. Its squared weight sums to Q. The remaining
r-2 freely chosen positions contribute V^(r-2). Finset.card_powersetCard counts the two-position subsets as
binom(r,2). Add their equal contributions. The r=2 empty remaining product is one even if V=0.

**Checks.**

- For r=2 the difference is exactly Q.

- For P={3},r=2 the difference is (2/9)^2.

- Empty P satisfies the inequality, including r=2 with exponent zero.

*Needs:* §1.2 (paired supports and collision control); Mathlib `Finset.sum_pow'`; Mathlib
`Finset.card_powersetCard`.

S is a finite set of natural primes. Write u_p=1/p, nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e and v_p=u_p(1-u_p).
These are local expressions. s=|S|>=1 and k>=2s are essential for the exact composition count. Values of alpha
off S are zero.

**Fixed prime support moment bound**. Let S be a nonempty finite prime set of size s and k>=2s. Sum over alpha
in piAntidiag(S,k) with alpha(p)>=2 on S, writing B=sum_alpha multinomial(S,alpha) `product_{p in`
S}nu_p(alpha(p)). Then 0<=B<=k! binom(k-s-1,s-1) `(product_{p in S}v_p)/2^s`. ([GS-SIEVING](#references)
Author copy, proof of Proposition 2, internal pp.4-6; pairing and smaller-support discussion on p.5.)

Set beta(p)=alpha(p)-2 on S and zero off S. This gives a bijection with the nonnegative assignments of total
k-2s on S. Read the existing piAntidiag/finsuppAntidiag correspondence and apply
card_finsuppAntidiag_nat_eq_choose. The count is binom(s+(k-2s)-1,k-2s)=binom(k-s-1,s-1), not the larger
printed count in the author copy. Every local factor lies in [0,v_p] by local-factor-bound. Every alpha(p)! is
at least 2, so their product is at least 2^s. Nat.multinomial_spec therefore bounds the nonnegative real
coefficient by k!/2^s. Bound each summand by k! product v_p/2^s and multiply by the exact number of
assignments. All denominators are positive.

**Checks.**

- For s=2,k=5 the admissible multiplicities are (2,3) and (3,2), so the count is two, not three.

- For k=2s the only assignment is constantly two.

- For S={3},k=4 the actual contribution is 2/27; the bound is an upper bound, not an identity.

*Needs:* §1.1 (the finite centered prime model); Mathlib `Nat.multinomial_spec`; Mathlib `Finset.finsuppAntidiag`;
Mathlib `Finset.card_finsuppAntidiag_nat_eq_choose`.

The support of an assignment is {p in P:alpha(p) is nonzero}; all sums use natural multiplicities of total k.
For k=1 or 2 the displayed s-sum is empty and R_k=0.

**Smaller prime support bound**. For k>=1 let B_k be the part of the multinomial model over assignments with
support size at most floor((k-1)/2). Define R_k=k! `sum_{s=1}^{floor((k-1)/2)}` binom(k-s-1,s-1) V^s/(2^s s!).
Then 0<=B_k<=R_k. ([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing
and smaller-support discussion on p.5.)

Since k>0, every assignment has nonempty support. If any multiplicity equals one, its factor nu_p(1) is zero,
so discard such terms. Group the remaining assignments by their support S. Outside S the zero-multiplicity
factors and factorials are one. Apply fixed-support-bound with s=|S|, since all nonzero multiplicities are at
least two. Sum over all s-subsets to obtain k! binom(k-s-1,s-1) H_s/2^s for each permitted s. From
distinct-prime-tuples and nonnegative weights, s! H_s=D_s<=V^s by inclusion among all tuples and
Finset.sum_pow'. Divide by positive s! and sum over s to obtain R_k.

**Checks.**

- For k=1,2 there are no nonzero smaller-support terms.

- For P={2,3},k=4 the smaller-support contribution is 1/16+2/27=59/432.

- For odd k there is no all-paired support; every nonzero model summand belongs to this bound.

*Needs:* §1.2 (paired supports and collision control); Mathlib `Finset.sum_pow'`.

### 1.3 Comparison with Gaussian moments

Compare the empirical moments to the finite model and then to the existing Gaussian centered-moment formulas. The Gaussian parameter is variance V, not its square root.

P is a finite set of natural primes, u_p=1/p, nu_p(e)=u_p(1-u_p)^e+(1-u_p)(-u_p)^e, v_p=u_p(1-u_p), `V=sum_{p`
in P}v_p and `Q=sum_{p in P}v_p^2`. These are local expressions, not new carriers. In particular 0<u_p<=1/2 and
v_p>=0. m is natural and mu_N samples exactly 1,...,N. S is the existing zero-extended primeDivisibilitySum
with unit weights. r>=2, so the zero-th and sharper second-moment results remain inherited. Use the existing
Gaussian measure and centralMoment carrier; V>=0 identifies Real.toNNReal V with V, including the degenerate
empty-prime case.

**Finite even Gaussian moment bound**. For r>=2, N=m+1 and `A=sum_{p in P}1/p`, let C_(2r)=(2r)!/(2^r r!),
epsilon_k=(3/2)^k |P|^k/N, and R_k=k! `sum_{s=1}^{floor((k-1)/2)}` binom(k-s-1,s-1) V^s/(2^s s!). Then |integral
(S(P,1)-A)^(2r) dmu_N - centralMoment(id,2r,gaussianReal(0,V))| <= epsilon_(2r)+C_(2r) binom(r,2) Q
V^(r-2)+R_(2r). The Gaussian variance argument is the nonnegative real V, not its square root.
([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing and
smaller-support discussion on p.5.)

The weighted-moment-comparison at unit weights bounds the arithmetic moment minus M_(2r) by epsilon_(2r). Use
model-multinomial-expansion. A singleton exponent kills its term. All other supports have size at most r; a
support of size exactly r must have every exponent two. Use paired-support-formula and distinct-prime-tuples
to write that leading part as C_(2r) D_r; smaller-support-bound bounds the nonnegative remainder by R_(2r).
Prime-collision-bound controls |C_(2r)D_r-C_(2r)V^r| by the collision term. The coefficient is nonnegative.
Tau Ceti's existing even Gaussian central-moment theorem evaluates the target as V^r (2r-1)!!. The pinned
factorial/double-factorial identities identify this with C_(2r)V^r. Add the three errors by the triangle
inequality.

**Checks.**

- For P={2,3}, V=17/36, model fourth moment=203/432 and Gaussian fourth moment=289/432; their difference is
  -43/216.

- Empty P has zero positive-order moments and zero right-hand side.

- This is a finite unweighted estimate. It does not establish Mertens normalization, large-prime removal, a
  growing-order asymptotic range or convergence in distribution.

*Needs:* §0.6 (mixed products and higher finite moments); §1.1 (the finite centered prime model); §1.2 (paired
supports and collision control); Tau Ceti `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal`; Mathlib
`Nat.factorial_eq_mul_doubleFactorial`; Mathlib `Nat.doubleFactorial_two_mul`; Mathlib
`ProbabilityTheory.centralMoment`.

mu_N samples exactly the positive integers 1,...,N; S is the existing unit-weight finite prime sum. The
absolute value is required even though the unit-weight model odd moment is nonnegative.

**Finite odd prime moment bound**. For r>=0, N=m+1, `A=sum_{p in P}1/p` and k=2r+1, |integral (S(P,1)-A)^k
dmu_N| <= (3/2)^k |P|^k/N + R_k, where R_k=k! `sum_{s=1}^{floor((k-1)/2)}` binom(k-s-1,s-1) V^s/(2^s s!).
([GS-SIEVING](#references) Author copy, proof of Proposition 2, internal pp.4-6; pairing and
smaller-support discussion on p.5.)

One route uses model-multinomial-expansion and nu_p(1)=0. A nonzero summand has all nonzero multiplicities at least two,
so its support size is at most floor(k/2)=r. Because k is odd, there is no all-paired support of size k/2.
Thus the entire M_k equals B_k from smaller-support-bound, giving 0<=M_k<=R_k. Apply the unit-weight moment
comparison and the triangle inequality. This uses the nonnegative model, not a nonnegativity assertion about
the arithmetic moment. The existing odd Gaussian central-moment theorem evaluates the comparison target as
zero. It is a supplier interpretation, not a new Gaussian theorem.

**Checks.**

- For P={3},N=3,k=3 the arithmetic/model moment is 2/27, not zero.

- For P={3},N=1,k=3 the arithmetic moment is -1/27.

- For r=0, R_1=0; the first-mean estimate is sharper than the displayed 3/2 bound.

- For empty P every positive-order moment and bound vanish.

*Needs:* §0.6 (mixed products and higher finite moments); §1.1 (the finite centered prime model); §1.2 (paired
supports and collision control); Tau Ceti `TauCeti.Probability.centralMoment_id_two_mul_add_one_gaussianReal`.

### 1.4 Removing a prime cutoff

Separate the deterministic large-prime count from the change of center. Binomial expansion and adjacent even moments bound every fixed-order cutoff error.

One route uses the existing ArithmeticFunction.cardDistinctFactors as omega and existing unit-weight primeDivisibilitySum
S. No new prime-count, cutoff, moment or measure carrier is introduced. For real z>=0, P_z denotes the
existing Nat.primesLE(floor_nat(z)); a prime p belongs precisely when p<=z. On positive n put T_z(n)={p in
n.primeFactors: z<p}, `A_z=sum_{p in P_z}1/p`, and Y_z(n)=S(P_z,1)(n)-A_z. All casts, logarithms and error terms
are real. n is a positive natural number. The identity needs only z>=0, not z>1.

**Prime cutoff decomposition of omega**. For every n>0 and z>=0, omega(n)=S(P_z,1)(n)+|T_z(n)|. In particular
a prime equal to z is retained, and every prime power contributes once, not its exponent.
([GS-SIEVING](#references) Author copy, internal p.4, Deduction of Theorem 1, first three displayed
formulas and Cauchy–Schwarz step.)

One route uses positive-evaluation to express S(P_z,1)(n) as a sum of divisibility indicators. Nat.mem_primesLE and
Nat.le_floor_iff identify its nonzero terms with the members of n.primeFactors whose real value is at most z,
using Nat.mem_primeFactors and n>0. Use omega-compatibility and positive-evaluation on n.primeFactors to
express omega(n) as the cardinality of that finite set. Partition n.primeFactors by p<=z and z<p; add their
cardinalities. This uses finite-set partition identities, not an asymptotic estimate.

**Checks.**

- At n=60,z=3 the head is 2 and the tail is 1; at z=5 the tail is 0.

- At n=8,z=3/2 the head is 0 and tail is 1, not 3; n=1 gives two zero summands.

*Needs:* §0.2 (weighted finite prime sums); Mathlib `Nat.primesLE`; Mathlib `Nat.mem_primesLE`; Mathlib
`Nat.le_floor_iff`; Mathlib `Nat.mem_primeFactors`.

n is positive and z>1, so log(z)>0.

**Logarithmic bound for discarded prime factors**. For n>0 and z>1, |T_z(n)| <= log(n)/log(z). The bound
counts distinct prime divisors; it permits n=1 and real nonintegral z, and has no assumption z<=n.
([GS-SIEVING](#references) Author copy, internal p.4, Deduction of Theorem 1, first three displayed
formulas and Cauchy–Schwarz step.)

For T=T_z(n), Nat.mem_primeFactors supplies prime, positive divisors of n. The existing Finset.prod_primes_dvd
proves product T divides n. Its positive product is at most n. Every p in T satisfies log(z)<=log(p) by
Real.log_le_log, so |T| `log(z)<=sum_{p in T}log(p)`. Apply Real.log_prod to identify the sum with log(product
T), then Real.log_le_log to bound this by log(n). Divide by the positive Real.log_pos z. The empty product is
one, so no nonempty-tail hypothesis is used.

**Checks.**

- At n=1 the estimate is 0<=0; z>n gives empty T.

- At n=30,z=2 the tail count is 2, consistent with 2 log(2)<=log(30).

- The logarithmic quotient is not claimed for z=1 or for n=0.

*Needs:* Mathlib `Nat.mem_primeFactors`; Mathlib `Finset.prod_primes_dvd`; Mathlib `Real.log_prod`; Mathlib
`Real.log_le_log`; Mathlib `Real.log_pos`.

m is natural, N=m+1; b is any real center, not an assumed empirical or model mean. z>1 and 1<=n<=N.

**Centered prime cutoff error**. For N=m+1, z>1, b real, and 1<=n<=N, set D=log(N)/log(z)+|A_z-b|. Then
|(omega(n)-b)-Y_z(n)|<=D. The two summands in D respectively control discarded primes and the change of
center. ([GS-SIEVING](#references) Author copy, internal p.4, Deduction of Theorem 1, first three
displayed formulas and Cauchy–Schwarz step.)

Omega-cutoff-identity gives (omega(n)-b)-Y_z(n)=|T_z(n)|+(A_z-b). Apply the triangle inequality and
nonnegativity of a finite cardinality. Use large-prime-log-bound and Real.log_le_log for n<=N, dividing by
log(z)>0. This proves the displayed D bound. D is nonnegative because N>=1. No Mertens estimate for |A_z-b|,
and no numerical choice of b or z, is inserted without a separate proof.

**Checks.**

- For b=A_z, the pointwise difference is exactly the nonnegative tail count.

- For n=N=1, the log contribution vanishes; the error equals |A_z-b|, even when P_z contains primes absent from
  the sample.

- A center mismatch is retained even if every prime factor lies below the cutoff.

*Needs:* §1.4 (removing a prime cutoff); Mathlib `Real.log_le_log`; Mathlib `Real.log_pos`.

m,k are natural, z>1, b real and 1<=n<=m+1. D=log(m+1)/log(z)+|A_z-b|.

**Binomial prime cutoff power error**. For N=m+1, z>1, b real, 1<=n<=N and k>=0, with D as above,
|(omega(n)-b)^k-Y_z(n)^k| <= `sum_{j=0}^{k-1}` binom(k,j) D^(k-j) |Y_z(n)|^j. The sum is empty at k=0.
([GS-SIEVING](#references) Author copy, internal p.4, Deduction of Theorem 1, first three displayed
formulas and Cauchy–Schwarz step.)

Let d=(omega(n)-b)-Y_z(n). The preceding centered-cutoff-error gives |d|<=D and D>=0. Apply the pinned
binomial theorem to (Y_z(n)+d)^k. Isolate its j=k term, which is Y_z(n)^k, leaving exactly j<k; at k=0 both
the remainder and its bound are zero. Apply Finset.abs_sum_le_sum_abs. Replace the absolute value of each
product by binom(k,j)|Y_z(n)|^j|d|^(k-j), and use monotonicity of nonnegative powers to replace |d| by D.
Signs of Y and d are not discarded before this step.

**Checks.**

- For k=0 the bound is 0; for k=1 it is D, and for k=2 it is D^2+2D|Y|.

- When Y is negative, |Y| cannot be replaced by Y in the bound. At n=1,N=2,z=3,b=A_z,k=2, Y=-5/6 and
  0<D=log(2)/log(3)<1, so D^2+2DY is negative.

*Needs:* §1.4 (removing a prime cutoff); Mathlib `add_pow`; Mathlib `Finset.abs_sum_le_sum_abs`; Mathlib
`pow_le_pow_left₀`.

mu_(m+1) is the existing empirical probability measure on 1,...,m+1. P is any finite set of natural indices, a
has arbitrary real values and b is real. No primality or independence hypothesis is needed for this
finite-sample inequality.

**Odd absolute prime moments from adjacent even moments**. For m,r natural, finite P, real weights a and real
b, let Z(n)=S(P,a)(n)-b and E_j=integral Z^j dmu_(m+1). Then integral |Z|^(2r+1) dmu_(m+1) <=
sqrt(E_(2r)*E_(2r+2)). Both even factors are nonnegative. At r=0, E_0=1. ([GS-SIEVING](#references) Author
copy, internal p.4, Deduction of Theorem 1, first three displayed formulas and Cauchy–Schwarz step.)

Rewrite all three integrals using the existing integral_empiricalMeasure. Every real function on the discrete
natural carrier is strongly measurable; each resulting sum is finite. Apply the existing
Finset.sum_mul_sq_le_sq_mul_sq to f(n)=|Z(n)|^r and g(n)=|Z(n)|^(r+1) over the N=m+1 sample indices. Their
product is |Z|^(2r+1), and their squares equal Z^(2r) and Z^(2r+2). Divide the squared Cauchy–Schwarz
inequality by N^2. The same positive normalization occurs in each average. Nonnegative square roots and
Real.sq_sqrt give the stated bound. This is an arithmetic specialization, not a new generic Cauchy–Schwarz
theorem.

**Checks.**

- For P={2},a=1,b=1/2 all |Z| equal 1/2, so equality holds for every N and r.

- For P={3},N=3,a=1,b=1/3, the signed first moment is 0 but the absolute first moment is 4/9; the r=0 upper
  bound is sqrt(2/9).

- Signed weights and constant nonzero centers are allowed. An empty P with b=0 gives zero odd absolute moments,
  while E_0 remains 1.

*Needs:* Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`; Mathlib `Finset.sum_mul_sq_le_sq_mul_sq`;
Mathlib `Real.sq_sqrt`.

m,k are natural, N=m+1, z>1 and b is real. E_j and U_j are local expressions, not new moment carriers. For odd
j, j>=1 and j-1,j+1 are even.

**Finite prime cutoff moment transfer**. For N=m+1, z>1, b real and k>=0, put D=log(N)/log(z)+|A_z-b|,
E_j=integral Y_z^j dmu_N, and U_j=E_j for even j, while U_j=sqrt(E_(j-1)*E_(j+1)) for odd j. Then |integral
(omega-b)^k dmu_N-E_k| <= `sum_{j=0}^{k-1}` binom(k,j) D^(k-j) U_j. The formula is an exact finite bound with no
unspecified constant. ([GS-SIEVING](#references) Author copy, internal p.4, Deduction of Theorem 1, first
three displayed formulas and Cauchy–Schwarz step.)

Rewrite the integral difference as the difference of the two empirical finite averages. Apply the triangle
inequality for that finite sum and cutoff-power-error at every n=1,...,N. Interchange the two finite sums and
pull out the nonnegative constant binom(k,j)D^(k-j). The remaining factor is the empirical absolute j-th
moment of Y_z. For even j, |Y_z|^j=Y_z^j. For odd j=2r+1, apply absolute-odd-moment at P=P_z, weights 1 and
center A_z. This proves the U_j bound without any iid premise. At k=0 both original moments are 1 and the
right side is empty. For later asymptotics, even U_j inputs can use second-moment-comparison and
finite-even-gaussian-bound; their growth and D's size must still be established, and are not conclusions of
this theorem.

**Checks.**

- At k=0 the two normalized moments equal 1; at k=1 the right side is D because U_0=1.

- At k=2 the bound is D^2+2D sqrt(E_2), since E_0=1.

- The formula holds for N=1 and for z>N; it does not remove the separate center discrepancy |A_z-b|.

- No convergence in distribution, Mertens estimate or uniform growing-order range follows without additional
  bounds.

*Needs:* §1.4 (removing a prime cutoff); Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`; Mathlib
`Finset.abs_sum_le_sum_abs`.

### 1.5 Quadratic mean, normal order and the Gaussian law

The full prime-power quadratic estimate supplies normal order. Erdős–Kac additionally needs a cutoff chosen for each fixed moment order, analytic normalization and a valid moment-convergence argument.

Prove `turan_kubilius`. For real additive f and N≥2, put `A_N=Σ_{p prime,k≥1,p^k≤N}f(p^k)/p^k` and `B_N²=Σ_{p prime,k≥1,p^k≤N}|f(p^k)|²/p^k`. Then `Σ_{1≤n≤N}|f(n)−A_N|²≤30` N B_N². Elsholtz–Tao Lemma A.2 gives this for
N>2; at N=2 the left side is f(2)²/2 and the right side is 30 f(2)². A different centering with (1−1/p)
is not substituted. ([ElsholtzTao2011](#references) Appendix A,
Lemma A.2, physical p.38.)

The displayed finite prime-power expressions use the native prime set and factorization convention.

*Needs:* §0.1 (additive functions in the native arithmetic carrier); Mathlib `Nat.primesLE`; AnalyticNumberTheoryPartI §§0.19, 0.21.

Prove `hardy_ramanujan`. For every ε>0, both fractions #{1≤n≤N: |ω(n)−log log N|>ε log log N}/N and #{1≤n≤N:
|Ω(n)−log log N|>ε log log N}/N tend to zero. These are normal-order laws, with ω and Ω the native distinct
and repeated factor counts. ([ElsholtzTao2011](#references) Appendix A, discussion after Lemma A.2,
physical p.38.)

Apply the exact source mean-square estimate to omega, compare its source A_N and B_N² to log log N using the
requested reciprocal-prime asymptotic. Use the quadratic Markov bound. Transfer to Omega using the uniform
O(1) mean of Omega−omega and a linear Markov estimate.

*Needs:* §1.5 (quadratic mean, normal order and the gaussian law); §0.9 (repeated prime factors and finite
distribution sandwiches); AnalyticNumberTheoryPartI §§0.19, 0.21.

Prove `gaussian_weak_convergence_of_moments`. Let μₙ be Borel probability measures on ℝ with ∫|x|^k dμₙ finite for every n,k. If ∫x^k dμₙ tends to ∫x^k d(gaussianReal 0 1) for every k, then μₙ converges weakly to that Gaussian. No uniform subgaussian bound on μₙ is assumed. (TAO-CLT-2010, §3, Theorem 25 proof, Taylor-remainder argument; the asymptotic-even-moment version follows by the argument below.)

One specialized route fixes t∈ℝ and Taylor order 2k−1, for k≥1. The integrated remainder is at most |t|^(2k)∫x^(2k)dμₙ/(2k)!. Moment convergence passes the finite Taylor polynomial and the limiting even moment; comparing with the Gaussian remainder gives `limsup_n |φ_μₙ(t)−φ_G(t)|≤2|t|^(2k)/(2^k k!)`. Let k tend to infinity and apply native Lévy convergence. This proves the Gaussian specialization directly, without constructing a general moment-determinacy or compactness API.

**Checks.**

- Order zero is mass one, order one tends to zero, and order two tends to one; δ₀ fails the second moment.
- The constant standard Gaussian sequence satisfies all hypotheses and the conclusion.
- Matching only mean and variance does not suffice: the fixed fair law on {−1,1} has fourth moment 1, whereas the standard Gaussian has fourth moment 3.

*Needs:* native characteristic functions and Lévy convergence; Taylor’s integral remainder for the complex exponential on a real segment; the Gaussian moments supplied above.

Prove `erdos_kac`. For every real x, the fractions of positive n≤N with (ω(n)−log log N)/sqrt(log log N)≤x
tend to cdf(gaussianReal(0,1),x); the same statement holds for Ω. The scale is sqrt(log log N), and Gaussian
variance is 1. ([GS-SIEVING](#references) Author copy physical pp.2–4: (5), Theorem 1 and its deduction.)

Choose a moment-order-dependent prime cutoff, normalize the pairing and collision bounds and show their errors
tend to zero for each fixed order. Use reciprocal-prime asymptotics and gaussian_weak_convergence_of_moments. Apply the continuity-point CDF bridge (the Gaussian CDF is continuous) and the
omega/Omega transfer.

*Needs:* gaussian_weak_convergence_of_moments; §1.3 (comparison with gaussian moments); §1.4 (removing a prime cutoff); §0.10 (arithmetic laws and
convergence in distribution); AnalyticNumberTheoryPartI §§0.19, 0.21.

### 1.6 A restricted squarefree family

A thin family supported on specified residue classes of primes has a different center. Its relative exceptional-set estimate is a separate arithmetic concentration target.

Prove `restricted_squarefree_second_moment`. For D(N) below and L=log log N, there are absolute C>0 and N₀≥3 such that, for N≥N₀, `Σ_{d∈D(N)}(ω(d)−L/2)²≤C|D(N)|L`. (KoymansPagano2022, Theorem 7.2(a), (7.2), p.60 motivates this quantitative strengthening; analytic input: AnalyticNumberTheoryPartI §§3.12a, 3.32.)

For complex z near 1, consume the supplied uniform expansion `Σ_{d∈D(N)}z^ω(d)=N(log` N)^(z/2−1)(A(z)+O(1/log N)), with analytic remainder, A analytic and A(1)>0. Cauchy’s formula differentiates the remainder twice. After dividing by |D(N)|, the first factorial moment is L/2+O(1), and the second is L²/4+O(L); retaining the same A′(1) terms shows the centered second moment is L/2+O(1). This proves the displayed bound and identifies its analytic prerequisites. It uses the full marked-prime expansion, not just two-sided estimates for single slices.

**Checks.**

- D includes 1, whose ω is zero; squarefree even d are permitted because 2 is an allowed prime.
- At N=14, D={1,2,5,10,13}, giving the distinct ω values 0,1,1,2,1.
- The center is L/2; substituting L gives a squared bias of order L² and cannot give this bound.

*Needs:* AnalyticNumberTheoryPartI §§3.12a, 3.32 compact-parameter analytic expansion and positive count asymptotic; native finite sums and Cauchy differentiation.

Prove `restricted_squarefree_window`. For D(N)={d∈ℕ:0<d<N, d squarefree, and every prime divisor is 1 or 2
modulo 4}, there are absolute C,N₀>0 such that for N≥N₀ the number of d∈D(N) with |ω(d)−(1/2)log log N|≥(log
log N)^(2/3) is at most C|D(N)|/(log log N)^(1/100). The count is the sum of the disjoint slice cardinalities.
([KoymansPagano2022](#references) Theorem 7.2(a), (7.2), physical p.60; family physical p.2.)

One route uses restricted_squarefree_second_moment and Chebyshev at threshold L^(2/3): the exceptional fraction is at most C L^(−1/3), hence at most C L^(−1/100) once L≥1. Summing the disjoint r-slices gives the stated count. Ordinary Erdős–Kac with center L is not a prerequisite.

*Needs:* restricted_squarefree_second_moment; native finite sums and Markov’s inequality.

### Examples

For one centered divisibility indicator at p=3, the values are 2/3 and −1/3 with model
probabilities 1/3 and 2/3. Thus ν₃(2)=2/9 and ν₃(3)=2/27: odd local moments need not
vanish. For an empty prime set all positive-order moments vanish; the zeroth moment is one.
These checks prevent replacing every finite model by an exactly symmetric Gaussian.

For fourth moments the paired supports contribute `6Σ_{p<q}v_pv_q`, whereas the Gaussian
fourth moment is 3(Σ_p v_p)². Their difference is 3Σ_p v_p², precisely a repeated-index
collision contribution. A singleton prime set has no distinct two-prime support and still
has a nonzero fourth moment. The local fourth powers therefore belong in the remainder.

If n≤N and every discarded prime exceeds z>1, their distinct product divides n, so their
number is at most log N/log z. For a fixed moment order k, choose z=N^c with c small enough
that the finite arithmetic error tends to zero after normalization; the discarded count is
then at most 1/c. Letting k grow requires additional uniform estimates and is a distinct
assertion. Mertens normalization and a moment-convergence theorem complete the fixed-order
Erdős–Kac argument of Granville–Soundararajan, Theorem 1 and Proposition 2, pp.3–5.

The restricted squarefree set in §1.6 contains 1,2,5,10 but excludes 3 and 9. Its center
is (1/2)log log N; centering by log log N gives a different exceptional set. The estimate
is relative to this set's cardinality, not to N.

### Dependencies

Layer 0 supplies all finite model comparisons and the transfer from ω to Ω. Native finite
multinomial expansion and Tau Ceti Gaussian moments supply the exact coefficients. AnalyticNumberTheoryPartI §§0.19, 0.21
supplies Mertens estimates and prime-power remainders. The restricted-family theorem needs
its conditional quantitative concentration input; it is not derived from an unconditional
normal-order estimate.

## Layer 2: Uniform distribution, discrepancy and normal digits

### 2.1 Equidistribution as weak convergence

Define convergence through the existing empirical probability measures. Bounded-continuous tests, frequency limits and uniqueness require the exact topological hypotheses below.

The definition and bounded-continuous integral criteria require a topological space X with
OpensMeasurableSpace X. The frequency, open-set lower-bound and dense-range API additionally assumes
HasOuterApproxClosed X. Uniqueness and the constant-sequence iff additionally assume BorelSpace X. Compact
metric Borel spaces, including the tori used here, satisfy these assumptions. x : ℕ → X; μ :
ProbabilityMeasure X.

Define `AsympEquidistributed`. For a topological measurable space X whose open sets are measurable (in particular its Borel σ-algebra), a sequence x : ℕ → X and a
Borel probability measure μ, AsympEquidistributed x μ means that the empirical measures of x converge to μ in
ProbabilityMeasure X: Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ). Equivalently (1.1):
(n+1)⁻¹ `∑_{i≤n}` f(x i) → ∫ f dμ for every bounded continuous f, which for compact X is every f ∈ C(X). Tau
Ceti's empiricalMeasure x n averages x 0, …, x n where the source averages x(1), …, x(N); the two notions
agree because equidistribution ignores any finite shift of the index. ([TAO-HOFA-1.1](#references)
§1.1.1, printed p. 3, the definition (1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after
(1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.1;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2; [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Example 1.1.1.)

Its API includes the following facts.

- `AsympEquidistributed`: Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝
μ)
- asympEquidistributed_const_iff: Under HasOuterApproxClosed X and BorelSpace X, AsympEquidistributed (fun
_ => p) μ ↔ μ = diracProba p.

Define AsympEquidistributed x μ := Tendsto (empiricalMeasure x) atTop (𝓝 μ); no new measure or averaging
carrier is introduced. Characterise it by bounded continuous test functions: combine
ProbabilityMeasure.tendsto_iff_forall_integral_tendsto (and its RCLike form for complex tests) with Tau Ceti's
integral_empiricalMeasure, which evaluates ∫ f against the empirical measure as the average. Index shift: the
averages of x and of n ↦ x (n + m) differ by at most 2m‖f‖∞/(n+1) → 0, so the two notions coincide; this
reconciles the ℕ-indexing with the source's [N] = {1, …, N}. Uniqueness of μ from the Hausdorff property of
ProbabilityMeasure X (instance t2Space, under HasOuterApproxClosed and BorelSpace), the formal counterpart of
the source's appeal to the Riesz representation theorem. Frequencies: Portmanteau
(tendsto_measure_of_null_frontier_of_tendsto) applied to the empirical measures gives #{i ≤ n : x i ∈ E}/(n+1)
→ μ E whenever μ (frontier E) = 0, via empiricalMeasure_apply_toReal. Positive lower density of visits to an
open U with μ U > 0 (Exercise 1.1.2) from the lim-inf half of Portmanteau for open sets, and density of the
range when μ charges every nonempty open set.

**Checks.**

- AsympEquidistributed (fun _ => p) (diracProba p): the empirical measures are all diracProba p.

- Source Example 1.1.1: on Bool, x n = true iff `2^{2j}` ≤ n < `2^{2j+1}` for some j is equidistributed for no μ,
  since the frequency of true oscillates between about 1/3 and 2/3. A definition by a lim inf or along a
  subsequence would accept it.

- x n = decide (n % 2 = 1) on Bool is equidistributed for the uniform measure (PMF.uniformOfFintype
  Bool).toMeasure.

- Changing x 0 does not change equidistribution: the source's [N] omits x(0), Tau Ceti's empiricalMeasure
  includes it.

- The constant sequence 0 in UnitAddCircle is not equidistributed for circleHaar: it is for diracProba 0, and
  limits are unique.

- A constant sequence at p is equidistributed for diracProba p. Under HasOuterApproxClosed X and BorelSpace X
  this is its only limiting measure.

- The source's Example 1.1.1 sequence is equidistributed for no μ at all.

- Changing finitely many terms, or shifting the index, never changes equidistribution.

*Needs:* Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti `TauCeti.Probability.integral_empiricalMeasure`;
Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

One route uses the ambient types, measurability and finiteness hypotheses of Layer 2, Asymptotic equidistribution of a
sequence. Any additional assumptions are stated explicitly above.

Prove asympEquidistributed_iff_integral_tendsto. AsympEquidistributed x μ ↔ ∀ f : X →ᵇ ℝ, (n+1)⁻¹ `∑_{i≤n}` f
(x i) → ∫ f dμ. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the definition (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove asympEquidistributed_iff_integral_tendsto_complex. The same with bounded continuous complex-valued f;
this is the form the Weyl criterion uses. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the
definition (1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Exercise 1.1.2; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove asympEquidistributed_comp_add_iff. AsympEquidistributed (fun n => x (n + m)) μ ↔ AsympEquidistributed
x μ. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the definition (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove AsympEquidistributed.congr_of_eventuallyEq. Sequences that agree for all large n are equidistributed
for the same measures. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the definition (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove AsympEquidistributed.unique. Under HasOuterApproxClosed X and BorelSpace X, a sequence is
equidistributed for at most one μ. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the definition
(1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1); [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove AsympEquidistributed.tendsto_frequency. Assume HasOuterApproxClosed X. If μ (frontier E) = 0 then #{i
≤ n : x i ∈ E}/(n+1) → μ E (Portmanteau). ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the
definition (1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Exercise 1.1.2; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove AsympEquidistributed.eventually_frequency_ge. Assume HasOuterApproxClosed X. For open U with μ U > 0
there is c > 0 with #{i ≤ n : x i ∈ U}/(n+1) ≥ c for all large n. ([TAO-HOFA-1.1](#references) §1.1.1,
printed p. 3, the definition (1.1); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Exercise 1.1.2; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

Prove AsympEquidistributed.denseRange. Assume HasOuterApproxClosed X. If μ charges every nonempty open set,
then x has dense range. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 3, the definition (1.1);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Exercise 1.1.2;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, Example 1.1.1.)

*Needs:* §2.1 (equidistribution as weak convergence); Tau Ceti `TauCeti.Probability.empiricalMeasure`; Tau Ceti
`TauCeti.Probability.integral_empiricalMeasure`; Tau Ceti `TauCeti.Probability.empiricalMeasure_apply_toReal`;
Mathlib `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.ProbabilityMeasure.t2Space`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`; Mathlib
`MeasureTheory.diracProba`.

### 2.2 Progressions and two-sided integer indexing

Total equidistribution tests every infinite arithmetic progression. On integer indices both positive and negative halves must converge, and the value at zero is irrelevant.

q, r : ℕ with q ≥ 1.

Define `TotallyAsympEquidistributed`. TotallyAsympEquidistributed x μ means AsympEquidistributed (fun n => x
(q * n + r)) μ for every q ≥ 1 and r ≥ 0: equidistribution along every infinite arithmetic progression of
indices. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, after (1.1).)

Its API includes the following facts.

- `TotallyAsympEquidistributed`: ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x
(q * n + r)) μ
- TotallyAsympEquidistributed.asympEquidistributed: Total equidistribution implies
equidistribution (q = 1, r = 0)
- TotallyAsympEquidistributed.comp_affine: If x is totally equidistributed
then so is n ↦ x (q * n + r) for q ≥ 1.

Define TotallyAsympEquidistributed x μ := ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ.
Taking q = 1 and r = 0 gives plain equidistribution. Along n ↦ q' n + r', the sequence n ↦ x (q n + r) becomes
n ↦ x ((q q') n + (q r' + r)), again a progression with q q' ≥ 1, so the notion is stable under passing to x
(q n + r).

**Checks.**

- n ↦ n • (1/2 : ℝ/ℤ) is totally equidistributed for no μ: along 2n it is constantly 0 and along 2n + 1
  constantly 1/2, though it is equidistributed for the average of the two Dirac masses.

- The constant sequence at p is totally equidistributed for diracProba p.

- q = 1, r = 0: TotallyAsympEquidistributed x μ → AsympEquidistributed x μ.

- Total equidistribution implies equidistribution.

- n (1/2) in ℝ/ℤ is equidistributed for (δ₀ + `δ_{1/2})/2` but not totally, for any μ.

- Constant sequences are totally equidistributed for their Dirac measure.

*Needs:* §2.1 (equidistribution as weak convergence).

Define AsympEquidistributedInt. A sequence x : ℤ → X is asymptotically equidistributed for μ
(AsympEquidistributedInt x μ) when both halves n ↦ x (n + 1) and n ↦ x (−(n + 1)), n ∈ ℕ, are
AsympEquidistributed for μ; x(0) is omitted, as in the source. It is totally equidistributed when n ↦ x (q n +
r) is AsympEquidistributedInt for every integer q ≥ 1 and every r ∈ ℤ. ([TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, footnote 2.)

Its API includes the following facts.

- AsympEquidistributedInt: Both halves n ↦ x (n + 1) and n ↦ x (−(n + 1)) are
AsympEquidistributed
- TotallyAsympEquidistributedInt: ∀ q ≥ 1, ∀ r : ℤ, AsympEquidistributedInt (fun n => x
(q * n + r))
- asympEquidistributedInt_update_zero: Changing x 0 does not change AsympEquidistributedInt
- TotallyAsympEquidistributedInt.asympEquidistributedInt: Total implies plain (q = 1, r = 0).

Define AsympEquidistributedInt x μ := AsympEquidistributed (fun n : ℕ => x (n + 1)) μ ∧ AsympEquidistributed
(fun n : ℕ => x (-(n + 1))) μ. Define TotallyAsympEquidistributedInt x μ := ∀ q : ℕ, 0 < q → ∀ r : ℤ,
AsympEquidistributedInt (fun n => x (q * n + r)) μ. The positive half with the shift by one is
AsympEquidistributed (fun n : ℕ => x n) μ by asympEquidistributed_comp_add_iff, so the value x(0) never
matters (the source's footnote 2).

**Checks.**

- The sequence (fun n : ℤ => n • ((√2 : ℝ) : UnitAddCircle)), using integer scalar multiplication, is
  AsympEquidistributedInt for circleHaar.

- x n = if 0 ≤ n then 0 else n • √2 is not AsympEquidistributedInt for circleHaar, although its negative half
  is.

- Function.update x 0 p is AsympEquidistributedInt iff x is.

- n ↦ n α with α irrational in T is equidistributed on ℤ for circleHaar: both halves are linear sequences with
  irrational steps ±α.

- A sequence that is 0 for n ≥ 0 and n √2 for n < 0 is not: its positive half is constant.

- Changing x 0 does not change either notion.

*Needs:* §2.1 (equidistribution as weak convergence); §2.2 (progressions and two-sided integer indexing).

One route uses the ambient types, measurability and finiteness hypotheses of Layer 2, Equidistribution of doubly infinite
sequences. Any additional assumptions are stated explicitly above.

Prove AsympEquidistributedInt.natCast. AsympEquidistributedInt x μ → AsympEquidistributed (fun n : ℕ => x n)
μ. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 4; [TAO-HOFA-1.1](#references) §1.1.1, printed
p. 4, footnote 2.)

*Needs:* §2.2 (progressions and two-sided integer indexing); §2.1 (equidistribution as weak convergence).

Prove TotallyAsympEquidistributedInt.totallyAsympEquidistributed_natCast. Totally equidistributed on ℤ
implies n ↦ x n totally equidistributed on ℕ. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 4;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 4, footnote 2.)

*Needs:* §2.2 (progressions and two-sided integer indexing); §2.1 (equidistribution as weak convergence).

### 2.3 Irrational torus points and characters

The existing circle measure `AddCircle.haarAddCircle` and product `Measure.pi` are used throughout. The names `circleHaar` and `torusHaar` at d in the signature file merely bundle these measures as `ProbabilityMeasure`; they introduce no new measure. Their coercions are native volume, translation invariance is the native additive Haar property, and native Fourier orthogonality gives integral 1 at frequency zero and 0 otherwise. In dimension zero the product is the point mass on the unique point; projecting the one-dimensional product gives circle Haar probability. These normalizations fix both the total mass and interval lengths on [0,1). The frequency (1,−1) on the two-torus has integral zero. The required declarations are `AddCircle.haarAddCircle`, its probability instance, `Measure.pi`, `UnitAddTorus.orthonormal_mFourier` and `orthonormal_fourier` (take one frequency to be zero). Their API is consumed here rather than reproved.

- The coercion of `circleHaar` is the native circle Haar measure and has total mass 1.
- The coercion of `torusHaar` is the native finite product; projection to one coordinate preserves Haar probability.
- Native Fourier orthogonality evaluates the integral at frequency zero as 1 and at every nonzero frequency as 0.

**Checks.**

- The empty coordinate type has exactly one torus point and its Haar mass is 1; an empty measure would give 0.
- In one coordinate, the image of [0,1/2) has Haar mass 1/2; unnormalized Lebesgue measure on all real lifts would have infinite mass.
- On the two-torus, frequency (1,−1) has Haar integral 0 and frequency (0,0) has integral 1; a diagonal-subtorus law would give 1 for both.

*Needs:* Mathlib `AddCircle.haarAddCircle`, `Measure.pi`, `UnitAddTorus.orthonormal_mFourier` and `orthonormal_fourier`.

A vector is irrational when no nonzero integral frequency annihilates it. Coordinatewise irrationality is insufficient in dimension greater than one.

d a finite type; α : UnitAddTorus d; the pairing k · α := ∑ i, k i • α i ∈ UnitAddCircle.

Define `TorusIrrational`. α ∈ UnitAddTorus d is irrational if ∑ i, k i • α i ≠ 0 in UnitAddCircle for every
nonzero k : d → ℤ, i.e. k · α ≠ 0 for every nonzero frequency. Equivalently mFourier k α ≠ 1 for every k ≠ 0.
For one coordinate it is Mathlib's addOrderOf a = 0, the condition of AddCircle.denseRange_zsmul_iff and
AddCircle.ergodic_add_left. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after (1.2); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 6, after Remark 1.1.4.)

Its API includes the following facts.

- `TorusIrrational`: ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0.

Define TorusIrrational α := ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0. Relate to characters: mFourier k α =
fourier 1 (∑ i, k i • α i), since toCircle is additive, and fourier 1 y = 1 iff y = 0 on UnitAddCircle. For d
with one element, identify it with addOrderOf a = 0: k • a = 0 for k ≠ 0 is exactly finite order. Stability: m
• α is irrational for every nonzero integer m, because k · (m • α) = (m k) · α and m k ≠ 0.

**Checks.**

- ![√2, √2] has two irrational coordinates but is not TorusIrrational: the nonzero frequency (1, −1) annihilates
  it. This rejects a definition that only checks coordinatewise irrationality.

- ![√2, √3] is irrational, by ℚ-linear independence of 1, √2, √3.

- Every α : UnitAddTorus (Fin 0) is irrational: there is no nonzero k.

- For a : UnitAddCircle, TorusIrrational (fun _ : Unit => a) ↔ addOrderOf a = 0, Mathlib's condition for dense
  and ergodic rotation.

- (√2, 1/2) is not irrational (k = (0, 2)), although √2 is.

- (√2, √3) is irrational.

- For an empty index type every point is irrational, matching the fact that every sequence equidistributes on a
  point.

*Needs:* Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`; Mathlib `fourier`; Mathlib
`AddCircle.denseRange_zsmul_iff`.

One route uses the ambient types, measurability and finiteness hypotheses of Layer 2, Irrational points of the torus. Any
additional assumptions are stated explicitly above.

Prove torusIrrational_iff_mFourier. TorusIrrational α ↔ ∀ k ≠ 0, mFourier k α ≠ 1.
([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after (1.2); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 6, after Remark 1.1.4.)

*Needs:* §2.3 (irrational torus points and characters); Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`;
Mathlib `fourier`; Mathlib `AddCircle.denseRange_zsmul_iff`.

Prove mFourier_eq_fourier_sum. mFourier k α = fourier 1 (∑ i, k i • α i). ([TAO-HOFA-1.1](#references)
§1.1.1, printed p. 6, Exercise 1.1.5 (iv); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after
(1.2); [TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, after Remark 1.1.4.)

*Needs:* §2.3 (irrational torus points and characters); Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`;
Mathlib `fourier`; Mathlib `AddCircle.denseRange_zsmul_iff`.

Prove torusIrrational_unique_iff. For d with exactly one element, TorusIrrational α ↔ addOrderOf (α default)
= 0. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after (1.2); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 6, after Remark 1.1.4.)

*Needs:* §2.3 (irrational torus points and characters); Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`;
Mathlib `fourier`; Mathlib `AddCircle.denseRange_zsmul_iff`.

Prove TorusIrrational.zsmul. If α is irrational and m ≠ 0 then m • α is irrational.
([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after (1.2); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 6, after Remark 1.1.4.)

*Needs:* §2.3 (irrational torus points and characters); Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`;
Mathlib `fourier`; Mathlib `AddCircle.denseRange_zsmul_iff`.

Prove TorusIrrational.nsmul. If α is irrational and m ≠ 0 then m • α is irrational, for m : ℕ.
([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv);
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, after (1.2); [TAO-HOFA-1.1](#references) §1.1.1,
printed p. 6, after Remark 1.1.4.)

*Needs:* §2.3 (irrational torus points and characters); Mathlib `UnitAddTorus`; Mathlib `UnitAddTorus.mFourier`;
Mathlib `fourier`; Mathlib `AddCircle.denseRange_zsmul_iff`.

### 2.4 Weyl criteria for Haar and arbitrary limits

Trigonometric approximation turns weak convergence into character convergence. Rational twists detect every progression, while the general-measure version keeps all Fourier coefficients, including frequency zero.

d a finite type; x : ℕ → UnitAddTorus d.

Prove `weyl_criterion`. A sequence x : ℕ → UnitAddTorus d is equidistributed for torusHaar d if and only if,
for every nonzero k : d → ℤ, (n+1)⁻¹ `∑_{i≤n}` mFourier k (x i) → 0. ([TAO-HOFA-1.1](#references) §1.1.1,
printed p. 5, Proposition 1.1.2; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, proof of Proposition
1.1.2.)

Only if: mFourier k is a bounded continuous complex function with ∫ mFourier k d(torusHaar d) = 0 for k ≠ 0;
apply the complex integral characterisation of the definition. If: the hypothesis and the value 1 at k = 0
give convergence of the averages for every mFourier k, hence by linearity for every trigonometric polynomial,
the span of the mFourier k. The span is dense in C(UnitAddTorus d, ℂ) (span_mFourier_closure_eq_top). For f
continuous and ε > 0 pick a trigonometric polynomial within ε uniformly; averages and integrals of f and of it
differ by at most ε, so the lim sup of |average − ∫ f| is at most 2ε. Every bounded continuous real function
on the compact torus is a continuous complex function; conclude with the real integral characterisation.

**Checks.**

- For d empty the right side is vacuous and every sequence is equidistributed on the point.

- For d nonempty a constant sequence fails the criterion: its average at any k ≠ 0 is mFourier k (x 0), of
  modulus one.

- Only nonzero k are tested; the k = 0 average is identically 1.

*Needs:* §2.1 (equidistribution as weak convergence); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.span_mFourier_closure_eq_top`; Mathlib `UnitAddTorus.mFourier`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`.

**Equidistribution in T^d through one-dimensional projections**. x : ℕ → UnitAddTorus d is equidistributed for
torusHaar d if and only if, for every nonzero k : d → ℤ, the sequence n ↦ ∑ i, k i • x n i in UnitAddCircle is
equidistributed for circleHaar. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Corollary 1.1.3.)

Apply weyl-criterion on T^d and on T (d = one point). For nonzero k and nonzero m ∈ ℤ, fourier m (k · x) =
mFourier (m k) x, and m k ≠ 0; so the one-dimensional criteria for all k · x are the d-dimensional criterion
for all nonzero frequencies, each frequency m k being reached from k.

**Checks.**

- For d a single point it is weyl-criterion itself.

- Coordinatewise equidistribution is not enough: (√2 n, √2 n) has equidistributed coordinates but k = (1, −1)
  gives the constant 0.

- The frequency m k with m ≠ 0 is again nonzero, so no frequency is lost or gained.

*Needs:* §2.4 (weyl criteria for haar and arbitrary limits); the native Haar/Fourier boundary; Mathlib `fourier`;
Mathlib `UnitAddTorus.mFourier`; §2.3 (irrational torus points and characters).

d a finite type; x : ℕ → UnitAddTorus d; μ a Borel probability measure on the torus.

**Weyl's criterion for an arbitrary limit measure on the torus**. For x : ℕ → UnitAddTorus d and any μ :
ProbabilityMeasure (UnitAddTorus d), x is equidistributed for μ if and only if, for every k : d → ℤ, (n+1)⁻¹
`∑_{i≤n}` mFourier k (x i) → ∫ mFourier k dμ. The measure μ is thus determined by its Fourier coefficients, and
weyl-criterion is the case μ = torusHaar d. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, proof of
Proposition 1.1.2.)

Only if: mFourier k is bounded continuous; use the complex integral characterisation of the definition. If: by
linearity the averages of every trigonometric polynomial converge to its μ-integral; trigonometric polynomials
are dense in C(UnitAddTorus d, ℂ) (span_mFourier_closure_eq_top), and averages and integrals are 1-Lipschitz
in the sup norm, so every continuous function converges (ε/3 argument), which is the definition on a compact
space.

**Checks.**

- For μ = torusHaar d it is weyl-criterion, since ∫ mFourier k = [k = 0].

- For μ = diracProba p the criterion reads mFourier k (x i) averages → mFourier k p for all k.

- If two Borel probability measures on UnitAddTorus d have equal Fourier coefficients at every integer
  frequency, density of the Fourier span gives equality of bounded continuous integrals; finite-measure
  extensionality then identifies the measures. No existence of a generic equidistributed sequence is assumed.

*Needs:* §2.1 (equidistribution as weak convergence); Mathlib `UnitAddTorus.mFourier`; Mathlib
`UnitAddTorus.span_mFourier_closure_eq_top`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`; the native Haar/Fourier boundary.

**Total equidistribution by rational twists**. x : ℕ → UnitAddTorus d is totally equidistributed for torusHaar
d if and only if, for every nonzero k : d → ℤ and every rational a/b (b ≥ 1), (n+1)⁻¹ `∑_{i≤n}` mFourier k (x i)
· e(a i / b) → 0. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.4.)

If: for q ≥ 1 and r, the indicator of the progression {i ≡ r mod q} is a combination of the characters i ↦ e(a
i / q), a = 0, …, q − 1 (finite Fourier inversion on ℤ/q); so the averages of mFourier k over the progression
tend to 0, which by weyl-criterion is equidistribution of n ↦ x (q n + r). Only if: split the average over
residues i mod b; on each residue class e(a i / b) is constant, and the average of mFourier k along the class
tends to 0 by total equidistribution and weyl-criterion.

**Checks.**

- With only the untwisted averages (a = 0) the condition is plain equidistribution, which is strictly weaker.

- x n = n • (1/2) in T: the twist a/b = 1/2 at k = 1 gives the constant average 1, so it is not totally
  equidistributed.

- For a fixed positive progression modulus q, Fourier inversion uses the q twists a/q with 0 ≤ a < q. The total
  criterion quantifies over all positive q; no single finite denominator bound suffices for all progressions.

*Needs:* §2.2 (progressions and two-sided integer indexing); §2.4 (weyl criteria for haar and arbitrary limits);
Mathlib `UnitAddTorus.mFourier`; Mathlib `ZMod.dft_apply`; Mathlib `ZMod.invDFT_apply`; Mathlib
`ZMod.stdAddChar_coe`.

### 2.5 Linear and polynomial sequences

Geometric sums prove the linear result. Positive-lag differencing reduces polynomial degree, and the character formulation supplies the general polynomial criterion.

d a finite type; α, β : UnitAddTorus d; n acts by natural-number scalar multiplication.

Prove `linear_equidistribution_tfae`. For α, β ∈ UnitAddTorus d the following are equivalent: (i) n ↦ n • α +
β is equidistributed for torusHaar d; (ii) it is totally equidistributed; (iii) α is irrational
(TorusIrrational α). ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 6, Exercise 1.1.5 (iv).)

(iii) ⇒ (i): by weyl-criterion it suffices that the averages of mFourier k (n α + β) = mFourier k β · ζⁿ
vanish in the limit, where ζ = mFourier k α ≠ 1 by irrationality; the geometric sum `∑_{i≤n}` ζ^i = `(ζ^{n+1}` −
1)/(ζ − 1) is bounded by 2/|ζ − 1|. (iii) ⇒ (ii): along q n + r the sequence is n ↦ n • (q α) + (r α + β), and
q α is irrational (TorusIrrational.nsmul); apply (iii) ⇒ (i). (ii) ⇒ (i) is
TotallyAsympEquidistributed.asympEquidistributed. (i) ⇒ (iii): if k · α = 0 with k ≠ 0 then mFourier k (n α +
β) = mFourier k β is constant of modulus one, so its averages do not tend to 0, contradicting weyl-criterion.

**Checks.**

- For d = 1, (i) implies Mathlib's density of the orbit (denseRange_zsmul_iff) via denseRange, and (iii) is its
  hypothesis addOrderOf α = 0.

- α = (√2, 1/2): not irrational, and the sequence is not equidistributed on T² (it lives on β + (T × {0, 1/2})).

- β plays no role: the conditions do not depend on it.

*Needs:* §2.4 (weyl criteria for haar and arbitrary limits); §2.1 (equidistribution as weak convergence); §2.2
(progressions and two-sided integer indexing); §2.3 (irrational torus points and characters); Mathlib
`geom_sum_eq`; Mathlib `AddCircle.denseRange_zsmul_iff`; Mathlib `AddCircle.ergodic_add_left`.

d a finite type; α, β : UnitAddTorus d.

**The equidistribution theorem on ℤ**. For α, β ∈ UnitAddTorus d, n ↦ n • α + β (n ∈ ℤ) is totally
equidistributed on ℤ for torusHaar d if and only if α is irrational. ([TAO-HOFA-1.1](#references)
§1.1.1, printed p. 6, Exercise 1.1.5 (iii)–(iv).)

For z(m)=x(qm+r), x(m)=m • α+β and q≥1, the positive half z(n+1) has step q • α and shift (q+r) • α+β. The
negative half z(−(n+1)) has step (−q) • α and shift (r−q) • α+β. Both nonzero integer multiples of an
irrational α remain irrational, so apply the one-sided linear criterion to each half. Conversely, plain
bilateral equidistribution implies one-sided equidistribution after restriction and a finite index shift; use
the one-sided linear criterion. Total implies plain by q=1,r=0.

**Checks.**

- For nonempty d, a finite-order α gives a periodic orbit and fails equidistribution for torus Haar. For d empty
  the torus is a singleton and both irrationality and equidistribution hold.

- For q=2,r=3, the positive and negative halves start at 5 • α+β and α+β respectively, confirming both shift
  signs.

*Needs:* §2.2 (progressions and two-sided integer indexing); §2.5 (linear and polynomial sequences); §2.3
(irrational torus points and characters).

d a finite type; x : ℕ → UnitAddTorus d; the hypothesis for every positive integer h.

**Van der Corput's difference theorem**. If x : ℕ → UnitAddTorus d is such that for every h ≥ 1 the difference
sequence n ↦ x (n + h) − x n is equidistributed for torusHaar d, then x is equidistributed for torusHaar d.
([TAO-HOFA-1.1](#references) §1.1.1, printed p. 8, Corollary 1.1.7; [TAO-HOFA-1.1](#references)
§1.1.1, printed p. 7, Lemma 1.1.6; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 8, end of the proof of
Corollary 1.1.7.)

By weyl-criterion fix k ≠ 0 and put b(n) = mFourier k (x (n − 1)) for 1 ≤ n ≤ N and 0 otherwise, so |b| ≤ 1
and b vanishes outside (0, N]. Apply the finite_lag_inequality: `H²|∑_{n≤N}` b(n)|² ≤ (N + H − 1)(H·N + `2∑_{h=1}^{H−1}` (H − h)|C(h)|), with C(h) = `∑_{n=1}^{N−h}` b(n + h)
conj b(n). Prove this finite_lag_inequality for arbitrary complex b supported on {1,…,N}, with H·Σ|b(n)|² replacing H·N before using |b|≤1: pad by zero, average the H translates and apply Cauchy–Schwarz. This is TAO-HOFA-1.1, Lemma 1.1.6, p.7, with every lag paired with its conjugate. For fixed h ≥ 1,
C(h)/N = average of mFourier k (x (n + h) − x n) over n < N − h, up to O(h/N): it tends to 0 by weyl-criterion
applied to the difference sequence (mFourier k is a character, so b(n+h) conj b(n) = mFourier k (x(n+h−1) −
x(n−1))). Divide by H²N² and let N → ∞ with H fixed: lim sup |average of mFourier k (x i)|² ≤ 1/H. Let H → ∞.

**Checks.**

- For x n = n² α with α = a/q rational the difference at h = q is constantly 0, so the hypothesis fails, as it
  must: x is periodic and not equidistributed.

- Only h ≥ 1 is assumed; the difference at h = 0 is constantly 0 and is never equidistributed for d nonempty.

*Needs:* §2.4 (weyl criteria for haar and arbitrary limits); the native Haar/Fourier boundary;
the finite_lag_inequality in this section.

d a finite type; s ≥ 1; α 0, …, α s ∈ UnitAddTorus d, the higher values of α ignored; TorusIrrational (α s).

Prove `weyl_polynomial`. Let s ≥ 1 and α : ℕ → UnitAddTorus d with α s irrational. Then n ↦ `∑_{j=0}^{s}` n^j •
α j is equidistributed for torusHaar d. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 8, Corollary
1.1.9; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 9, proof of Corollary 1.1.9.)

Induct on s. For s = 1 the sequence is n • α 1 + α 0, and linear-equidistribution applies. For s > 1 and h ≥
1, P(n + h) − P(n) = `∑_{j<s}` n^j • β_j with `β_{s−1}` = (s h) • α s, by the binomial theorem in each coefficient
(n^j • is additive in the coefficient). Its leading coefficient s h α_s is irrational by
TorusIrrational.nsmul. By the induction hypothesis every difference sequence is equidistributed; conclude by
van-der-corput-lemma.

**Checks.**

- For s = 1 it is the linear case, and the constant term plays no role.

- n² α with α rational, of denominator q, is periodic mod q and not equidistributed: the irrationality
  hypothesis cannot be dropped.

- Only the leading coefficient needs to be irrational: n² √2 + n/2 is equidistributed.

*Needs:* §2.5 (linear and polynomial sequences); §2.3 (irrational torus points and characters); §2.1
(equidistribution as weak convergence).

u : ℕ → ℝ; UnitAddCircle = ℝ/ℤ with circleHaar; fourier k (u i) = e(k u i).

Prove `uniformDistribution_mod_one_tfae`. For a real sequence u : ℕ → ℝ the following are equivalent: (a) n ↦
(u n : ℝ/ℤ) is equidistributed for circleHaar; (b) for all 0 ≤ a ≤ b ≤ 1, #{i ≤ n : Int.fract (u i) ∈ [a,
b)}/(n+1) → b − a; (c) for every nonzero integer k, (n+1)⁻¹ `∑_{i≤n}` e(k u i) → 0. This is the classical
definition of uniform distribution mod 1 and Weyl's criterion for it. ([TAO-HOFA-1.1](#references)
§1.1.1, printed p. 4, Exercise 1.1.1; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, before
Proposition 1.1.2; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 5, Proposition 1.1.2.)

(a) ⇔ (c) is weyl-criterion for d a single point, since fourier k of the class of u i is e(k u i). (a) ⇒ (b):
the image of [a, b) in ℝ/ℤ has frontier of at most two points, which are circleHaar-null, and its measure is b
− a; apply AsympEquidistributed.tendsto_frequency. (b) ⇒ (a): by (b) the averages of the indicator of every
such arc converge to its length, hence by linearity for every step function on arcs. A continuous f on ℝ/ℤ is
uniformly continuous, so it is within ε of a step function uniformly; conclude as in weyl-criterion. This is
the circle case of the source's Exercise 1.1.1.

**Checks.**

- u n = n √2 satisfies all three.

- u n = log n satisfies none: its frequencies in [0, 1/2) oscillate.

- u n = n/2: the frequency of [0, 1/4) tends to 1/2, not 1/4, so (b) fails, although the frequency of [0, 1/2)
  is the correct 1/2.

*Needs:* §2.1 (equidistribution as weak convergence); the native Haar/Fourier boundary; §2.4 (weyl criteria for
haar and arbitrary limits); Mathlib `Int.fract`; Mathlib `fourier`; Mathlib
`MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`.

d a finite type; s ≥ 1; α_0, …, α_s ∈ UnitAddTorus d.

Prove `polynomial_equidistribution_iff` and `polynomial_total_equidistribution_iff`. **Equidistribution criterion for polynomial sequences**. For P(n) = `∑_{j=0}^{s}` n^j • α_j with α_0, …, α_s ∈
UnitAddTorus d, the following are equivalent: (i) n ↦ P(n) (n ∈ ℕ) is equidistributed for torusHaar d; (ii) it
is totally equidistributed; (iii) n ↦ P(n) (n ∈ ℤ) is totally equidistributed on ℤ; (iv) there is no nonzero k
: d → ℤ with k · α_1 = ⋯ = k · α_s = 0. Equivalently: for every nonzero k some k · α_j with 1 ≤ j ≤ s is
irrational in T. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 9, Exercise 1.1.6;
[TAO-HOFA-1.1](#references) §1.1.1, printed p. 9, Exercise 1.1.6 (iv).)

(iv) ⇔ 'for each k ≠ 0 some k · α_j (j ≥ 1) has infinite order': if all k · α_j have finite order, a common
multiple m gives (m k) · α_j = 0. By weyl-criterion-projections it suffices to treat k · P, a polynomial in T
with coefficients k · α_j. d = 1, (iv) ⇒ (ii): let j₀ be the largest j ≥ 1 with α_j of infinite order and Q a
common order of the α_j with j > j₀. Along n = Q m + r the terms of degree > j₀ are constant, and the rest is
a polynomial in m whose leading coefficient `Q^{j₀}` `α_{j₀}` has infinite order; weyl-polynomial-equidistribution
(with the n ↦ Q m + r substitution preserving that leading coefficient up to the factor `Q^{j₀})` makes n ↦ P(Q
m + r) equidistributed for each r. For a general progression q m + r, split m further by its residue mod Q:
each of the Q interleaved subsequences is of the previous kind (step q Q), so the progression is
equidistributed. (ii) ⇒ (i) trivially; (i) ⇒ (iv): if k ≠ 0 kills α_1, …, α_s then mFourier k (P(n)) =
mFourier k (α_0) is constant of modulus one, so its averages do not tend to 0, contradicting weyl-criterion.
(iii) follows from (ii) for both halves, since P(−n) is again a polynomial with coefficients ± α_j; (iii) ⇒
(i) by restriction.

**Checks.**

- For s = 1 it is linear-equidistribution.

- P(n) = n²/2 + n/2 in T is constant 0 (n(n+1) is even): k = 2 kills both coefficients, as (iv) predicts.

- P(n) = n²/2 + n √2 is totally equidistributed, although its leading coefficient is rational: Weyl's theorem
  alone does not show this.

*Needs:* §2.4 (weyl criteria for haar and arbitrary limits); §2.5 (linear and polynomial sequences); §2.2
(progressions and two-sided integer indexing); §2.3 (irrational torus points and characters).

### 2.6 Subtori and rational decompositions

Matrix-parametrized connected subgroups carry pushforward Haar probability. Character annihilators make that measure independent of the parametrization and lead to finite periodic mixtures of coset Haar laws.

d a finite type; n : ℕ; M : Matrix d (Fin n) ℤ.

Define Subtorus. A subtorus datum S of UnitAddTorus d consists of n : ℕ and an integer matrix M : Matrix d
(Fin n) ℤ; its homomorphism is S.toHom : UnitAddTorus (Fin n) →+ UnitAddTorus d, y ↦ (i ↦ ∑_j M i j • y j),
its carrier is the range (a compact connected subgroup), and its Haar measure S.haar is the pushforward of
torusHaar (Fin n) along S.toHom. A character mFourier k of the big torus has S.haar-integral 1 if k vanishes
on the carrier (k M = 0) and 0 otherwise, so S.haar depends only on the carrier. In the source's language
S.carrier is a subtorus, and the separate classification assertion says that every compact connected Lie
subgroup arises this way, using the first d′ columns of L⁻¹ when L ∈ SL_d(ℤ) sends it to `T^{d′}` × `{0}^{d−d′}`
(Exercise 1.1.22). ([TAO-HOFA-1.1](#references) §1.1.2, printed p. 16, complexity of a subtorus;
[TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

Its API includes the following facts.

- Subtorus: Structure: n : ℕ, M : Matrix d (Fin n) ℤ
- Subtorus.toHom:
UnitAddTorus (Fin n) →+ UnitAddTorus d, y ↦ (i ↦ ∑ j, M i j • y j)
- Subtorus.carrier: The additive subgroup
S.toHom.range
- Subtorus.haar: The pushforward of torusHaar (Fin n) along toHom, as a ProbabilityMeasure
- Subtorus.top: The full torus: n = #d, M = 1, with haar = torusHaar d
- Subtorus.bot: The zero subtorus: n =
0, with haar = diracProba 0.

S.toHom is a continuous additive homomorphism (finite sums of integer multiples of coordinates). carrier :=
S.toHom.range, compact (IsCompact.image of the compact torus) and connected (isConnected_range). haar := ⟨map
S.toHom (torusHaar (Fin n)), _⟩, a probability measure; haar (carrier) = 1. integral_mFourier_haar: ∫ mFourier
k d(S.haar) = ∫ mFourier (k M) d(torusHaar (Fin n)) = [k M = 0], by integral_map and
integral_mFourier_torusHaar, since mFourier k ∘ S.toHom = mFourier (k M). haar depends only on the carrier: k
M = 0 iff mFourier k is 1 on the carrier, so two data with the same carrier have the same Fourier
coefficients, hence equal measures (FiniteMeasure.ext_of_forall_integral_eq with density of trigonometric
polynomials). Translation invariance by carrier elements, from translation invariance of torusHaar (Fin n).

**Checks.**

- (Subtorus.top d).haar = torusHaar d.

- (Subtorus.bot d).haar = diracProba 0.

- For the diagonal of T² (M = column (1, 1)): ∫ mFourier (1, −1) = 1 and ∫ mFourier (1, 0) = 0; a measure spread
  over all of T² gives 0 for both.

- M = (2) on T: toHom is x ↦ 2x, not injective, yet the carrier is all of T and haar = circleHaar. A definition
  that required toHom to be injective, or that weighted by the kernel, would treat this parametrisation of T
  differently from M = (1).

- The full torus (n = #d, M = 1) has haar = torusHaar d.

- The zero subtorus (n = 0) has haar = diracProba 0.

- The diagonal of T² (M = column (1, 1)) has ∫ mFourier (1, −1) = 1 and ∫ mFourier (1, 0) = 0.

*Needs:* the native Haar/Fourier boundary; Mathlib `UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`;
Mathlib `MeasureTheory.integral_map`; Mathlib `IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

One route uses the ambient types, measurability and finiteness hypotheses of Layer 2, Subtori of the standard torus and
their Haar measures. Any additional assumptions are stated explicitly above.

Prove Subtorus.continuous_toHom. toHom is continuous. ([TAO-HOFA-1.1](#references) §1.1.2, printed p.
16, complexity of a subtorus; [TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.isCompact_carrier. The carrier is compact, hence closed. ([TAO-HOFA-1.1](#references)
§1.1.2, printed p. 16, complexity of a subtorus; [TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17,
Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.isConnected_carrier. The carrier is connected. ([TAO-HOFA-1.1](#references) §1.1.2,
printed p. 16, complexity of a subtorus; [TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise
1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.haar_carrier. S.haar (S.carrier) = 1. ([TAO-HOFA-1.1](#references) §1.1.2, printed p.
16, complexity of a subtorus; [TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.integral_mFourier_haar. ∫ mFourier k d(S.haar) = if k ᵥ* M = 0 then 1 else 0.
([TAO-HOFA-1.1](#references) §1.1.2, printed p. 16, complexity of a subtorus;
[TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.mFourier_eq_one_iff. mFourier k is identically 1 on S.carrier iff k ᵥ* M = 0.
([TAO-HOFA-1.1](#references) §1.1.2, printed p. 16, complexity of a subtorus;
[TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`.

Prove Subtorus.haar_eq_of_carrier_eq. S.carrier = S'.carrier → S.haar = S'.haar.
([TAO-HOFA-1.1](#references) §1.1.2, printed p. 16, complexity of a subtorus;
[TAO-HOFA-1.1](#references) §1.1.2, printed pp. 16–17, Exercise 1.1.22.)

*Needs:* §2.6 (subtori and rational decompositions); the native Haar/Fourier boundary; Mathlib
`UnitAddTorus.mFourier`; Mathlib `MeasureTheory.Measure.map`; Mathlib `MeasureTheory.integral_map`; Mathlib
`IsCompact.image`; Mathlib `isConnected_range`; Mathlib
`MeasureTheory.FiniteMeasure.ext_of_forall_integral_eq`; §2.4 (weyl criteria for haar and arbitrary limits).

d a finite type; α_1, …, α_s ∈ UnitAddTorus d.

**Rational decomposition of torus points along a subtorus**. Let α_1, …, α_s ∈ UnitAddTorus d and Γ := {k : d
→ ℤ | every k · α_j has finite order}. Then there is a subtorus datum S with S.toHom injective such that (a) k
vanishes on S.carrier iff k ∈ Γ, and (b) every α_j = α′_j + α″_j with α′_j ∈ S.carrier and α″_j of finite
order. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 7, proof of Proposition 1.1.5;
[TAO-HOFA-1.1](#references) §1.1.2, printed p. 16.)

Γ is a saturated subgroup of ℤ^d: if m k ∈ Γ with m ≠ 0 then k ∈ Γ, because k · α has finite order iff m k · α
does. Smith normal form (Submodule.smithNormalForm) for Γ ≤ ℤ^d gives a basis b of ℤ^d with Γ = span(a_1 b_1,
…, a_r b_r); saturation forces a_i = ±1, so Γ = span(b_1, …, b_r) is a direct summand. Let L be the matrix
with rows b_1, …, b_d (in GL_d(ℤ)); L acts on the torus as an automorphism. Take S := the image of {0}^r ×
`T^{d−r}` under L⁻¹, i.e. M := the last d − r columns of L⁻¹; toHom is injective. (a): k vanishes on S.carrier
iff k L⁻¹ has zero last d − r entries iff k ∈ span(b_1, …, b_r) = Γ. (b): in the coordinates y = L α_j the
first r entries b_i · α_j have finite order; subtract the torsion point with those first r entries (and zeros
elsewhere) pulled back by L⁻¹, leaving α′_j with first r coordinates zero, i.e. in S.carrier.

**Checks.**

- If s≥1 and at least one α_j is TorusIrrational, Γ=0 and S can be the whole torus, with all α″_j=0.

- If every α_j has finite order, Γ = ℤ^d and S is the zero subtorus.

- For α = (√2, 1/2) in T², Γ = ℤ (0, 1), S = T × {0}, α′ = (√2, 0), α″ = (0, 1/2).

- For s=0 the condition defining Γ is vacuous: Γ=ℤ^d and S is the zero subtorus. This must not be classified as
  the full torus in positive dimension.

*Needs:* §2.6 (subtori and rational decompositions); §2.3 (irrational torus points and characters); Mathlib
`Submodule.smithNormalForm`; Mathlib `IsOfFinOrder`.

Define `torusPolynomial` on the native coordinate type d (finite in the headline theorems) by `P(n)=Σ_{0≤j≤s}n^j • α_j` for n∈ℤ, including the constant coefficient. This uses native integer scalar multiplication, not a new polynomial carrier. Its API consists of evaluation at zero, finite additivity in the coefficient sequence and restriction to natural indices. (TAO-HOFA-1.1, §1.1.1, Exercise 1.1.7, printed p.9.)

Its basic API has the following statements.

- At the integer index 0 its value is α₀, including when s=0.
- Pointwise addition of coefficient sequences adds their values at every integer index.
- Restriction along ℕ→ℤ agrees with the natural-power formula used in the equidistribution theorems.

**Checks.**

- For s=0, P(n)=α₀ even at n=0; the native value 0^0=1 preserves the constant term.
- For α₀=0, α₁=(√2,1/2) and s=1, P(2)=(2√2,0) in T², while P(1)=(√2,1/2).
- For P(n)=α₀+nα₁+n²α₂, P(−1)=α₀−α₁+α₂; using natural exponents with an unsigned argument would lose the odd-term sign.

*Needs:* native integer scalar multiplication on UnitAddTorus; §2.5 polynomial sequences.

d a finite type; s ≥ 0; α_0, …, α_s ∈ UnitAddTorus d.

Prove `polynomial_haar_mixture` (equidistribution of abelian polynomial sequences). For P(n) = `∑_{j=0}^{s}` n^j • α_j with α_0, …,
α_s ∈ UnitAddTorus d there are a subtorus datum S and a decomposition P = P′ + P″, where P′(n) = `∑_{j=1}^{s}`
n^j • α′_j with every α′_j ∈ S.carrier and P″(n) = α_0 + `∑_{j=1}^{s}` n^j • α″_j with every α″_j (j ≥ 1) of
finite order, such that n ↦ P′(n) is totally equidistributed for S.haar on ℕ and on ℤ. P″ is periodic, and P
is equidistributed for the average, over one period of P″, of the translates of S.haar by P″(n): a finite
combination of Haar measures of cosets of S.carrier. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 9,
Exercise 1.1.7; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 9, after Exercise 1.1.7.)

Apply torus-rational-decomposition to α_1, …, α_s to get S (with injective toHom) and α_j = α′_j + α″_j. P″ is
periodic: each α″_j has finite order, so n ↦ n^j • α″_j is periodic with period the order. For each fixed
ambient frequency k, project P′ to the circle by k·P′. If k annihilates S, its character is identically one.
Otherwise k∉Γ and some nonconstant coefficient k·α′_j has infinite order; apply the one-dimensional polynomial
Weyl criterion to this scalar polynomial on each progression and each half. This supplies the required Fourier
coefficient without claiming full equidistribution of a coordinate lift from a single tested frequency. The ℤ
statement follows in the same way from (iii) of the criterion. In the signature S is a native closed connected additive subgroup, μ is a probability supported on S and invariant under every translation in S, and ν is exactly the average of its translated measures over a positive period Q. These properties determine the subgroup Haar law, including S={0}. No supplier carrier is assumed. The limit law of P: along each residue class
mod a period Q of P″, P = P′ + constant, and P′ restricted to that class is equidistributed for S.haar;
average over the Q classes.

**Checks.**

- If s≥1 and every α_j for 1≤j≤s is TorusIrrational, S can be the whole torus and P″=α_0. For s=0 the measure is
  diracProba α_0, obtained from the zero subtorus.

- The source's example n ↦ (√2 n, n²/3) is equidistributed for (1/3)·Haar(T × {0}) + (2/3)·Haar(T × {1/3}).

- For P(n)=(n√2,n/2), the limit gives weight 1/2 to Haar(T×{0}) and weight 1/2 to Haar(T×{1/2}); every nonzero signed progression of the connected part has Haar(T×{0}) limit.

- For s = 1 it is abelian-ratner-linear.

*Needs:* §2.6 (subtori and rational decompositions); §2.5 (linear and polynomial sequences); §2.4 (weyl criteria
for haar and arbitrary limits); §2.2 (progressions and two-sided integer indexing); Mathlib
`Function.Periodic`.

d a finite type; α, β : UnitAddTorus d.

**Equidistribution for abelian linear sequences**. For α, β ∈ UnitAddTorus d there are a subtorus datum S and
α = α′ + α″ with α′ ∈ S.carrier and α″ of finite order, such that n ↦ n • α′ is totally equidistributed for
S.haar on ℕ and on ℤ, and n ↦ n • α″ + β is periodic. ([TAO-HOFA-1.1](#references) §1.1.1, printed p. 7,
Proposition 1.1.5; [TAO-HOFA-1.1](#references) §1.1.1, printed p. 6.)

The case s = 1 of abelian-ratner-polynomial, with α_1 = α and α_0 = β. The source's own proof inducts on d,
splitting off one primitive k′ with k′ · α rational at a time; the Smith-normal-form route of
torus-rational-decomposition replaces that induction.

**Checks.**

- For α irrational, S is the whole torus and α″ = 0: linear-equidistribution.

- For α = (√2, 1/2): S = T × {0}, α′ = (√2, 0), α″ = (0, 1/2).

- For α of finite order, S is the zero subtorus and the sequence is periodic.

*Needs:* §2.6 (subtori and rational decompositions).

### 2.7 Discrepancy and quadrature

Strict initial intervals define star discrepancy. Fourier approximation bounds it, and one-dimensional bounded variation converts it into a quadrature error.

Define `starDiscrepancy`. For x:Fin N→ℝ, `D*(x)=sup_{0≤t≤1}|#{j:x_j<t}/N−t|` when N>0; define D*(empty)=0.
Arithmetic samples must lie in [0,1). The cut is strict and the normalization is N.
([StrauchPorubsky2018](#references) §1.9 and §1.11.2, physical pp.73–74,95.)

Its basic API consists of these facts.

- For every finite real sample the value lies in [0,1], with the prescribed empty value 0.
- Permuting the sample preserves its discrepancy.
- For two [0,1) samples of the same size with corresponding distances at most ε≥0, the discrepancies differ by at most ε.

One route uses Finset.univ.filter and native real sSup over t∈Icc 0 1; guard the empty sample. Use this same
normalization in Koksma and the one-dimensional Erdős–Turán estimate.

**Checks.**

- The guarded empty sample has discrepancy zero.

- A single point at zero has discrepancy one.

- A single point at one half has discrepancy one half.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`.

Prove starDiscrepancy_bounds. 0≤D*≤1 for every finite real sample.
([StrauchPorubsky2018](#references) §1.9 and §1.11.2, physical pp.73–74,95.)

*Needs:* §2.7 (discrepancy and quadrature).

Prove starDiscrepancy_perm. Reordering the finite sample preserves star discrepancy.
([StrauchPorubsky2018](#references) §1.9 and §1.11.2, physical pp.73–74,95.)

*Needs:* §2.7 (discrepancy and quadrature).

Prove starDiscrepancy_perturb. If both samples lie in [0,1) and corresponding points differ by at most ε≥0,
their star discrepancies differ by at most ε. ([StrauchPorubsky2018](#references) §1.9 and
§1.11.2, physical pp.73–74,95.)

For each t, compare the two empirical counts using the inclusions {x_j<t−ε}⊆{y_j<t}⊆{x_j<t+ε}. Clip t±ε to
[0,1], using the support assumptions, then take the two suprema.

*Needs:* §2.7 (discrepancy and quadrature).

Prove `erdos_turan`. For N,H≥1 and x_j∈[0,1), `D*(x)≤3/(H+1)+3Σ_{h=1}^H` |N⁻¹Σ_j exp(2πihx_j)|/h. This is the
s=1 consequence of the exact extremal-discrepancy constant (3/2)^s in Strauch–Porubský Theorem 1.11.2.1,
pairing ±h; no sharp constant is claimed. ([StrauchPorubsky2018](#references) Theorem 1.11.2.1,
physical p.95; D*≤D comparison.)

One route uses interval trigonometric majorants/minorants of degree H to bound count minus length. Pair positive and
negative Fourier frequencies, apply D*≤D, and retain the stated factor 3.

*Needs:* §2.7 (discrepancy and quadrature).

Prove `koksma`. For N≥1, x_j∈[0,1), and f:ℝ→ℝ with native BoundedVariationOn f [0,1], |N⁻¹Σ_j f(x_j)−∫_[0,1] f
dvolume|≤(eVariationOn f [0,1]).toReal D*(x). Variation is finite by hypothesis. Values at sampled
discontinuities are retained. ([StrauchPorubsky2018](#references) Theorem 1.9.0.3, physical
p.74.)

First prove bv_empirical_integral_bound: for a finite signed Borel measure σ supported on [0,1], with σ([0,1])=0, and native BoundedVariationOn f [0,1], if |σ([0,t))|≤D and |σ([0,t])|≤D for every t∈[0,1], then |∫f dσ|≤D·(eVariationOn f [0,1]).toReal. Interpret the signed integral using its Jordan positive and negative measures. The one-sided distribution bounds retain the actual values of f at jumps. Prove the monotone-function case by layer-cake integration and split a BV function into the difference of two monotone functions with the variation sum equal to its total variation (StrauchPorubsky2018, Theorem 1.9.0.3, physical p.74). Apply to empirical probability minus restricted Lebesgue; the closed initial-interval bound follows from the open bound by right limits, including the endpoint. The native inputs are SignedMeasure, its Jordan decomposition, finite integrals, BoundedVariationOn and eVariationOn.

**Checks.**

- The constant f has zero variation and zero signed integral

- The right jump indicator 1_[a,1] pairs with −σ([0,a))

- The left jump indicator 1_(a,1] pairs with −σ([0,a]). Both one-sided bounds are required for arbitrary sampled jump values.

*Needs:* §2.7 (discrepancy and quadrature); Mathlib `BoundedVariationOn`; Mathlib `eVariationOn`.

The strict-interval singleton values D*({0})=1 and D*({1/2})=1/2 are Checks of this definition.

### 2.8 Canonical normal digits

Count overlapping blocks in the native canonical expansion. The digit/circle-cylinder bridge and the pointwise theorem of Layer 4 give normality in each base, then simultaneously in all bases.

Define `IsNormalBase`. For b≥2 and x∈[0,1), IsNormalBase b x means that every block w:Fin k→Fin b, including
overlapping blocks, has frequency b^(−k) in the canonical native Real.digits x b sequence. Count starting
positions 0≤j<N; digits beyond N may occur in the final k−1 windows. The empty block has frequency one.
([Smyth2020](#references) Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via
cylinder observables.)

Its basic API consists of these facts.

- Every specified overlapping block of length k has limiting frequency b^(−k).
- Every single digit has limiting frequency 1/b.
- The empty block is counted at all N starts and has limiting frequency 1.

State the predicate using canonical native digits and finite windows, not a second digit-expansion carrier.
Cylinder indicators for the expanding circle map give the simultaneous countable block-frequency theorem.

**Checks.**

- Zero is not normal in base 2.

- One half has terminating canonical binary digits and is not normal.

- Base one is excluded even though its single digit sequence satisfies a spurious frequency-one formula.

- For every integer base b≥2, some x∈[0,1) is normal in base b, by the almost-everywhere Borel theorem and
  positive measure of the interval. This rules out the identically false predicate.

*Needs:* Mathlib `Real.digits`.

Prove IsNormalBase.block. For a normal x each specified block has the stated overlapping frequency.
([Smyth2020](#references) Lesson 5 pointwise frequency discussion, physical pp.28–29; block version via
cylinder observables.)

*Needs:* §2.8 (canonical normal digits).

Prove IsNormalBase.digit. Each single digit has frequency 1/b. ([Smyth2020](#references) Lesson 5
pointwise frequency discussion, physical pp.28–29; block version via cylinder observables.)

*Needs:* §2.8 (canonical normal digits).

Prove IsNormalBase.empty_block. The empty block is counted at all N positions, giving limiting frequency
one. ([Smyth2020](#references) Lesson 5 pointwise frequency discussion, physical pp.28–29; block version
via cylinder observables.)

*Needs:* §2.8 (canonical normal digits).

**Digit cylinders and expanding circle orbits**. For b≥2, except the countable b-adic endpoint set, the
length-k canonical digit block beginning at j equals w if and only if the jth iterate of x↦fract(bx) lies in
the half-open base-b cylinder determined by w. Each cylinder has Lebesgue measure b^(−k). The same count is
the corresponding Birkhoff indicator sum. ([Smyth2020](#references) Lesson 1 digits/dynamics and Lesson 5,
physical pp.5–7,28–29; native digit refinement.)

Evaluate the floor-based native digits on the half-open interval and identify the affine cylinder endpoint by
its finite positional sum. Iterate the digit shift and sum indicators. The floor/circle/cylinder comparison is
a separate native comparison theorem; do not identify dense orbits with digit frequencies.

*Needs:* Mathlib `Real.digits`.

The terminating binary expansions 0 and 1/2 are non-examples: the digit-one frequencies tend to zero.

Prove `borel_normal`. For each b≥2, IsNormalBase b x holds for volume-almost every x∈[0,1);
([Smyth2020](#references) Lesson 5 pointwise frequency theorem, physical pp.28–29, applied to base-b
cylinders.)

One route uses native AddCircle.ergodic_nsmul for multiplication by b, with its positive-period volume hypothesis. Apply
the pointwise ergodic theorem to each cylinder indicator and transport to native digits by the bridge. Take a
countable union of null sets over lengths, words and bases. A mean/L1 theorem does not establish the needed
pointwise frequencies.

*Needs:* §2.8 (canonical normal digits); §4.1 (pointwise averages, truncated limsups and first hits); Mathlib
`AddCircle.ergodic_nsmul`.

Prove `borel_normal_all_bases`. For volume-almost every x∈[0,1), for every natural b≥2, the canonical native
digits make x normal in base b simultaneously. ([Smyth2020](#references) Lesson 5 pointwise frequency
theorem, physical pp.28–29; countable intersection refinement.)

Intersect the full-measure sets from the fixed-base theorem over natural b≥2. Introduce the native
nonzero-base instance from b≥2; no uncountable intersection is used.

*Needs:* §2.8 (canonical normal digits).

### Examples

The constant zero circle sequence has Dirac limit and fails Haar equidistribution. The zero-dimensional torus has a single point and no nonzero
character, so every sequence is equidistributed for its unique probability. On the
two-torus, (α,α) with irrational α has irrational coordinates but is annihilated by (1,−1).
Its linear orbit lies on the diagonal circle. The matrix column (1,1) gives that subtorus;
the frequency (r,s) restricts trivially exactly when r+s=0. These instances fix the
character, dimension and parametrization conventions in §§2.1–2.6.

For a single sample at 0, star discrepancy is one; for a single sample at 1/2 it is 1/2;
for no samples it is zero by definition. The strict interval [0,t) excludes a sample equal
to t, and taking the supremum over t still captures its jump. These computations detect
using ordinary interval discrepancy or omitting the empty-sample guard.

In base two the empty word has frequency one. The number zero has zero frequency of digit
one and is not normal. A finite terminating binary expansion has an eventual zero tail,
so it also fails normality. For the word (1,0), its initial digit cylinder is [1/2,3/4)
and has length 1/4. The right endpoint 3/4 belongs to the cylinder (1,1), in accordance
with the native canonical expansion. Overlapping windows are counted at every starting
index, not in disjoint blocks. The bridge of §2.8 transports these cylinders to doubling
on the circle.

### Dependencies

One route uses the native empirical probability, weak topology, compact circle and torus, Haar measure,
Fourier characters and trigonometric approximation APIs in the supplier contracts. The
polynomial argument uses positive-lag differencing; the subtorus argument uses finite
integer linear algebra and compact pushforwards. Discrepancy requires the stated Fourier
majorants and native bounded variation. Normality uses Layer 4 pointwise convergence and
native expanding-circle ergodicity. There is no reverse dependency from the pointwise proof.

## Layer 3: Metric approximation and Hausdorff transference

### 3.1 Reduced and unrestricted approximation sets

Keep the numerator ranges, closed endpoints and reducedness conditions explicit. Transfer to the native open circle convention only with the stated irrationality and radius comparison.

ψ is arbitrary and nonnegative; the intervals are closed, as in the source. Mathlib's addWellApproximable on
UnitAddCircle is the open-ball version of 𝒜 on the circle. The two agree up to the choice of radius: the open
version for ψ lies in 𝒜, and an irrational point of 𝒜 lies in the open version for 2ψ. Since Σφ(q)ψ(q)/q and
Σφ(q)ψ(q)/(2q) diverge together, the almost-everywhere zero/full conclusions transfer between these
conventions. This argument does not identify individual finite sets, their exact overlap measures, or exact
radius-dependent constants.

Define `dsSet`, `dsLimsup`, `khinchinSet` and `khinchinLimsup`. For ψ: ℕ → ℝ and q ≥ 1 let 𝒜_q = [0,1] ∩ `⋃_{1≤a≤q`,
gcd(a,q)=1} [a/q − ψ(q)/q, a/q + ψ(q)/q] (1.3), and let 𝒜 = `limsup_{q→∞}` 𝒜_q, the set of α ∈ [0,1] lying in
infinitely many 𝒜_q (1.4). Khinchin's 𝒦_q (1.2) uses every 0 ≤ a ≤ q, and 𝒦 = limsup 𝒦_q. The definitions admit arbitrary real ψ; measure and monotonicity conclusions carry their displayed nonnegativity hypotheses. At q=0, the reduced set is empty and the unrestricted set is {0} under native total division; changing this one index leaves either limsup unchanged.
([KM-2020](#references) §1, (1.2)–(1.4), pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

Its API includes the following facts.

- TauCeti.DuffinSchaeffer.dsLimsup: 𝒜 = `limsup_{q→∞}` 𝒜_q
- TauCeti.DuffinSchaeffer.khinchinSet: Khinchin's 𝒦_q, over every 0 ≤ a ≤ q
- TauCeti.DuffinSchaeffer.khinchinLimsup: 𝒦 = limsup 𝒦_q. The definitions admit arbitrary real ψ
- measure and monotonicity conclusions carry their displayed nonnegativity hypotheses. At q=0, the reduced set is empty and the unrestricted set is {0} under native total division
- changing this one index leaves either limsup unchanged.

Define 𝒜_q, 𝒦_q as finite unions of closed intervals intersected with [0,1], and 𝒜, 𝒦 as Filter.limsup along
atTop. Measure bounds: 𝒜_q is a union of φ(q) intervals of length 2ψ(q)/q, so λ(𝒜_q) ≤ 2φ(q)ψ(q)/q. When ψ(q)
≤ 1/2 the intervals around a/q with 1 ≤ a ≤ q−1 are disjoint up to endpoints and lie in [0,1], and for q = 1
half of the interval survives; so λ(𝒜_q) ≥ φ(q)ψ(q)/q. Circle comparison: for x ∈ [0,1] and q ≥ 2, if the
circle distance from x to a reduced m/q is less than δ, then some reduced a/q with 1 ≤ a ≤ q (m or its
reflection q − m) is within δ of x on the line; q = 1 affects only one index. Conversely an irrational x in
the closed interval of radius ψ(q)/q has ψ(q) > 0 and lies in the open interval of radius 2ψ(q)/q.

**Checks.**

- With ψ ≡ 1/2, 𝒜_1 = [1/2, 1]: only the interval around 1/1 is present, cut at 1.

- With ψ ≡ 1/2, 𝒜_2 = [1/4, 3/4]: only a = 1 is coprime to 2.

- ψ ≡ 0 gives λ(𝒜_q) = 0: 𝒜_q is a finite set of reduced fractions.

- With ψ ≡ 1/2, 0 ∈ 𝒦_2 but 0 ∉ 𝒜_2: the non-reduced fraction 0/2 is used by Khinchin's set and not by the
  Duffin–Schaeffer set.

- min{ψ(q), 1/2} ≤ λ(𝒦_q) ≤ 2 min{ψ(q), 1/2} (p. 252) follows in the same way; only the upper bound is used.

*Needs:* Mathlib `Nat.totient`; Mathlib `UnitAddCircle.mem_addWellApproximable_iff`.

One route uses the ambient types, measurability and finiteness hypotheses of Layer 3, Duffin–Schaeffer approximation sets
𝒜_q, 𝒜, 𝒦_q and 𝒦. Any additional assumptions are stated explicitly above.

Prove TauCeti.DuffinSchaeffer.volume_dsSet_le. λ(𝒜_q) ≤ 2φ(q)ψ(q)/q for ψ ≥ 0. ([KM-2020](#references) §1,
(1.2)–(1.4), pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

Prove TauCeti.DuffinSchaeffer.le_volume_dsSet. λ(𝒜_q) ≥ φ(q)ψ(q)/q for q ≥ 1 and 0 ≤ ψ(q) ≤ 1/2.
([KM-2020](#references) §1, (1.2)–(1.4), pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

Prove TauCeti.DuffinSchaeffer.dsSet_mono. 𝒜_q is monotone in ψ. ([KM-2020](#references) §1, (1.2)–(1.4),
pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

Prove TauCeti.DuffinSchaeffer.dsSet_subset_khinchinSet. 𝒜_q ⊆ 𝒦_q. ([KM-2020](#references) §1, (1.2)–(1.4),
pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

Prove TauCeti.DuffinSchaeffer.mem_dsLimsup_of_mem_addWellApproximable. For x ∈ [0,1], if the image of x on
the circle is in Mathlib's addWellApproximable for δ(n) = ψ(n)/n, then x ∈ 𝒜. ([KM-2020](#references) §1,
(1.2)–(1.4), pp. 252–253; [KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

Prove TauCeti.DuffinSchaeffer.mem_addWellApproximable_of_mem_dsLimsup. An irrational x ∈ 𝒜 maps into
addWellApproximable for δ(n) = 2ψ(n)/n. ([KM-2020](#references) §1, (1.2)–(1.4), pp. 252–253;
[KM-2020](#references) §1, (1.2), p. 252.)

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `Nat.totient`; Mathlib
`UnitAddCircle.mem_addWellApproximable_iff`.

### 3.2 Duffin–Schaeffer, Catlin and Khinchin

The reduced theorem has no monotonicity assumption. Catlin reduces unrestricted fractions to reduced ones, and monotone series comparison yields the stated Khinchin consequence.

No monotonicity or size condition on ψ. All denominator indices and divisor multiples in this node are
positive integers; no q=0 or n=0 term is included.

Prove `volume_dsLimsup_eq_zero`. If ψ ≥ 0 and Σ_q φ(q)ψ(q)/q < ∞, then λ(𝒜) = 0. ([KM-2020](#references) §1,
(1.5), p. 253.)

λ(𝒜_q) ≤ 2φ(q)ψ(q)/q, so Σ λ(𝒜_q) < ∞. Borel–Cantelli (Mathlib measure_limsup_atTop_eq_zero) gives λ(limsup
𝒜_q) = 0.

**Checks.**

- This is the 'easy' direction of the Duffin–Schaeffer conjecture (1.5).

*Needs:* §3.1 (reduced and unrestricted approximation sets); Mathlib `MeasureTheory.measure_limsup_atTop_eq_zero`.

ψ is arbitrary. The proof below works with the open intervals of Mathlib's addWellApproximable (same measures,
contained in 𝒜), which is enough since a set of measure 1 inside 𝒜 ⊆ [0,1] forces λ(𝒜) = 1.

Prove `volume_dsLimsup_eq_one`. Let ψ: ℕ → ℝ with ψ(q)≥0 for every q and `Σ_{q≥1}` ψ(q)φ(q)/q = ∞. Then the set 𝒜 of α ∈ [0,1] for
which |α − a/q| ≤ ψ(q)/q has infinitely many coprime solutions a, q has Lebesgue measure 1.
([KM-2020](#references) §1, Theorem 1, p. 253; [KM-2020](#references) §5, proof of Theorem 1 assuming
Proposition 5.4, pp. 265–268.)

Split ψ = ψ₁ + ψ₂ with ψ₁ = `ψ·𝟙_{ψ>1/2}`. If Σψ₁φ/q = ∞, Lemma 5.2 (Layer 3, Duffin–Schaeffer when ψ takes only
large values (Lemma 5.2)) gives λ(𝒜(ψ₁)) = 1 and 𝒜(ψ₁) ⊆ 𝒜(ψ). Otherwise Σψ₂φ/q = ∞ and 𝒜(ψ₂) ⊆ 𝒜(ψ); so
assume ψ ≤ 1/2. Gallagher's zero-one law (Mathlib addWellApproximable_ae_empty_or_univ; ψ(q)/q → 0 because ψ ≤
1/2) makes the open-interval limsup set null or full, so it suffices to show it has positive measure. For
large X pick Y minimal with `Σ_{X≤q≤Y}` φ(q)ψ(q)/q ∈ [1,2]; this exists because every term is at most 1/2. Since
𝒜 = ⋂_j `⋃_{q≥j}` 𝒜_q, it suffices that `λ(⋃_{X≤q≤Y}` 𝒜_q) ≫ 1 uniformly in X (5.5). By the second-moment union
bound, `λ(⋃𝒜_q)·Σ_{q,r}` λ(𝒜_q ∩ 𝒜_r) ≥ (Σλ(𝒜_q))² ≥ 1, so it suffices that `Σ_{X≤q,r≤Y}` λ(𝒜_q ∩ 𝒜_r) ≪ 1 (5.6).
The diagonal contributes at most 4. Off the diagonal apply the overlap estimate (Lemma 5.3, with the indicator
`1_{2M ≥ gcd})`. Pairs whose prime product ∏(1+1/p) is below `e^{100}` contribute at most `4e^{100}`. For the other
pairs `Σ_{p | qr/gcd²}` 1/p ≥ 100. Let j be maximal with `Σ_{p | qr/gcd², p ≥ exp exp j}` 1/p ≥ 10. By Mertens'
theorem (requested from AnalyticNumberTheoryPartI §§0.19, 0.21), `∏_{p > M/gcd}(1+1/p)` ≪ 1 if M/gcd ≥ exp exp j and ≪ e^j otherwise, and in the
latter case (q,r) ∈ `ℰ_{exp exp j}`. So (5.7) reduces to `Σ_{j≥0}` e^j `Σ_{(q,r)∈ℰ_{exp exp j}}` μ(q)μ(r) ≪ 1 (5.8),
which follows from Proposition 5.4: the inner sum is O(1/exp exp j) and Σ e^j/exp exp j < ∞.

**Checks.**

- ψ(q) = 1/q (Dirichlet's theorem regime) gives Σφ(q)/q² = ∞ and λ(𝒜) = 1.

- The convergence half is Layer 3, The convergence half (1.5); together they give the zero-one dichotomy with an
  explicit criterion.

- Mathlib's WellApproximable.lean records that this theorem is not formalized there.

*Needs:* §3.1 (reduced and unrestricted approximation sets); §3.3 (second moments and overlap estimates); Mathlib
`AddCircle.addWellApproximable_ae_empty_or_univ`; AnalyticNumberTheoryPartI §§0.19, 0.21.

The maximum exists because ψ(n)/n ≤ 1/(2n) → 0.

**Catlin's reduction to reduced fractions (2.2)**. Let 0 ≤ ψ ≤ 1/2 and define ξ by ξ(q)/q = `max_{n ∈ ℕ, q | n}`
ψ(n)/n. Then 𝒞 \ ℚ = 𝒦 \ ℚ, where 𝒞 = limsup 𝒞_q is the Duffin–Schaeffer set for ξ and 𝒦 is Khinchin's set for
ψ. ([KM-2020](#references) §2, Case 2 and (2.2), pp. 257–258.)

If α ∈ 𝒞 \ ℚ, pick infinitely many reduced aⱼ/qⱼ with |α − aⱼ/qⱼ| ≤ ξ(qⱼ)/qⱼ = ψ(nⱼ)/nⱼ for some multiple nⱼ
of qⱼ. Then mⱼ = aⱼnⱼ/qⱼ satisfies |α − mⱼ/nⱼ| ≤ ψ(nⱼ)/nⱼ, and nⱼ ≥ qⱼ → ∞, so α ∈ 𝒦. If α ∈ 𝒦 \ ℚ, reduce
mⱼ/nⱼ to aⱼ/qⱼ with qⱼ | nⱼ, so |α − aⱼ/qⱼ| ≤ ψ(nⱼ)/nⱼ ≤ ξ(qⱼ)/qⱼ. Infinitely many aⱼ/qⱼ are distinct, since
otherwise |α − a/q| ≤ 1/(2nⱼ) → 0 forces α = a/q ∈ ℚ.

**Checks.**

- Rational α are excluded on both sides: they may lie in 𝒦 through infinitely many non-reduced representations.

*Needs:* §3.1 (reduced and unrestricted approximation sets).

ψ* takes values in [0,∞]: the supremum may be infinite, and then the series is ∞.

Prove `catlin`. Let ψ: ℕ → ℝ with ψ(q)≥0 for every q and ψ*(q) = φ(q)·sup{ψ(n)/n : n ∈ ℕ, q | n} ∈ [0,∞]. Then (a) if Σ_q ψ*(q) <
∞, λ(𝒦) = 0; (b) if Σ_q ψ*(q) = ∞, λ(𝒦) = 1. ([KM-2020](#references) §1, Theorem 2, p. 253;
[KM-2020](#references) §2, pp. 256–258.)

Case 1: ψ(qᵢ) ≥ 1/2 for infinitely many qᵢ. Pass to a subsequence with `q_{i+1}` ≥ 2qᵢ²; then `𝒦_{qᵢ}` = [0,1], so
𝒦 = [0,1], and `Σ_{q_{i−1}<q≤qᵢ}` ψ*(q) ≥ `(1/(2qᵢ))(Σ_{q|qᵢ}` φ(q) − `Σ_{q≤q_{i−1}}` φ(q)) ≥ 1/4 (2.1), so Σψ* = ∞.
Case 2: finitely many q have ψ(q) ≥ 1/2. Replacing ψ by min{ψ, 1/2} changes neither 𝒦 nor the convergence of
Σψ*, so assume ψ ≤ 1/2; the supremum is a maximum, and ψ*(q) = φ(q)ξ(q)/q with ξ as in the Catlin reduction.
By the reduction, λ(𝒦) = λ(𝒞). Now (a) is the convergence half for ξ and (b) is Theorem 1 for ξ.

**Checks.**

- For qψ(q) decreasing, ψ*(q) = φ(q)ψ(q)/q, and the theorem becomes the Duffin–Schaeffer dichotomy for ψ; with
  the series comparison it contains Khinchin's theorem.

*Needs:* §3.2 (duffin–schaeffer, catlin and khinchin); §3.1 (reduced and unrestricted approximation sets).

Derived consequence: the source notes that Khinchin's theorem and the Duffin–Schaeffer conjecture agree for
qψ(q) decreasing (Walfisz), which is the use made here.

**Totient weights do not change divergence for decreasing ψ**. If ψ ≥ 0 is decreasing and Σ_q ψ(q) = ∞, then
Σ_q φ(q)ψ(q)/q = ∞. ([KM-2020](#references) §1, p. 253.)

Φ(x) = `Σ_{n≤x}` φ(n)/n = `Σ_{d≤x}` μ(d)/d·⌊x/d⌋ ≥ x `Σ_{d≤x}` μ(d)/d² − `Σ_{d≤x}` 1/d ≥ (2 − ζ(2))x − 1 − log x,
using φ(n)/n = `Σ_{d|n}` μ(d)/d and `|Σ_{d≥2}` μ(d)/d²| ≤ ζ(2) − 1 < 1. So Φ(x) ≥ x/4 for x ≥ x₀. Abel summation
with ψ decreasing: `Σ_{q≤N}` φ(q)ψ(q)/q = `Σ_{q<N}` (ψ(q) − ψ(q+1))Φ(q) + ψ(N)Φ(N) ≥ `(1/4)Σ_{x₀≤q≤N}` ψ(q) − O(1).

**Checks.**

- ψ(q) = 1/(q log q) (q ≥ 2): both series diverge.

- Without monotonicity the implication can fail, because φ(q)/q can be small on the support of ψ; this is why
  Duffin and Schaeffer passed to reduced fractions (p. 252).

*Needs:* Mathlib `Nat.totient`; Mathlib `ArithmeticFunction.moebius`; Mathlib `hasSum_zeta_two`.

(a) holds without monotonicity.

Prove `khinchin`. Let ψ: ℕ → [0,∞) with (qψ(q)) decreasing, and 𝒦 the set of α ∈ [0,1] for which |α − a/q| ≤
ψ(q)/q has infinitely many solutions (a,q) with 0 ≤ a ≤ q. (a) If Σψ(q) < ∞ then λ(𝒦) = 0. (b) If Σψ(q) = ∞
then λ(𝒦) = 1. ([KM-2020](#references) §1, Khinchin's theorem, p. 252.)

(a): λ(𝒦_q) ≤ 2 min{ψ(q), 1/2} ≤ 2ψ(q); Borel–Cantelli. (b): qψ(q) decreasing makes ψ(n)/n decreasing, so
ψ*(q) = φ(q)ψ(q)/q. ψ is decreasing, so by the series comparison Σψ* = ∞, and Catlin's theorem (b) gives λ(𝒦)
= 1.

**Checks.**

- ψ(q) = 1/(q log q): λ(𝒦) = 1. ψ(q) = 1/(q (log q)²): λ(𝒦) = 0.

*Needs:* §3.2 (duffin–schaeffer, catlin and khinchin); §3.1 (reduced and unrestricted approximation sets); Mathlib
`MeasureTheory.measure_limsup_atTop_eq_zero`.

### 3.3 Second moments and overlap estimates

Finite union second moments first give positive mass; a zero–one or local-full argument is needed for full measure. The arithmetic overlap estimate retains the factor two in its nonempty-intersection condition.

A general measure-theoretic inequality (Chung–Erdős form). All denominator indices and divisor multiples in
this node are positive integers; no q=0 or n=0 term is included.

**Second-moment lower bound for a finite union**. For measurable sets A_i of finite measure and a finite index
set s, `(Σ_{i∈s}` λ(A_i))² ≤ `λ(⋃_{i∈s}` `A_i)·Σ_{i,j∈s}` λ(A_i ∩ A_j). ([KM-2020](#references) §5, proof of
Theorem 1, p. 266.)

Let Q = Σ_i `1_{A_i}`. Then ∫Q = Σλ(A_i), ∫Q² = `Σ_{i,j}` λ(A_i ∩ A_j), and Q vanishes off ⋃A_i. Cauchy–Schwarz:
`(∫Q·1_{⋃A_i})²` ≤ λ(⋃A_i)∫Q².

**Checks.**

- Pairwise disjoint sets give equality.

*Needs:* Mathlib `MeasureTheory.lintegral_indicator`; Mathlib `ENNReal.lintegral_mul_le_Lp_mul_Lq`.

**Second moment for limsup events**. For measurable events E_n in a probability space, suppose Σμ(E_n)=∞ and
there is C≥1 such that for every M there are arbitrarily large N≥M with
`Σ_{M≤i,j≤N}μ(E_i∩E_j)≤C(Σ_{M≤i≤N}μ(E_i))²`. Then μ(limsup E_n)≥1/C. Full measure needs an additional zero-one
or local-full-measure input; it does not follow from this positive bound alone.
([BeresnevichVelani](#references) §2.2 and Lemmas 4–6, printed pp.976,979; finite-tail
second-moment consequence.)

Apply the finite second-moment union bound to each tail interval with nonzero total mass. Take continuity from
below for unions and from above for the decreasing tail unions under a probability measure.

*Needs:* §3.3 (second moments and overlap estimates).

**Duffin–Schaeffer when ψ takes only large values (Lemma 5.2)**. Let ψ: ℕ → ℝ with ψ(q)≥0 for every q and ψ(q) = 0 or ψ(q) ≥ 1/2
for every q, and Σψ(q)φ(q)/q = ∞. Then λ(𝒜) = 1. ([KM-2020](#references) §5, Lemma 5.2, p. 264.)

*Needs:* §3.1 (reduced and unrestricted approximation sets).

The indicator: distinct reduced fractions satisfy |a/q − b/r| ≥ gcd(q,r)/(qr), so the intervals can meet only
if rψ(q) + qψ(r) ≥ gcd(q,r), which needs 2M ≥ gcd, not the printed M > gcd.

**Overlap estimate for 𝒜_q ∩ 𝒜_r (Lemma 5.3, corrected)**. Let ψ: ℕ → [0,1/2] and M(q,r) = max{rψ(q), qψ(r)}.
For q ≠ r, λ(𝒜_q ∩ 𝒜_r) ≪ `λ(𝒜_q)λ(𝒜_r)·𝟙_{2M(q,r) ≥ gcd(q,r)}·∏_{p | qr/gcd(q,r)², p > M(q,r)/gcd(q,r)}` (1 +
1/p). ([KM-2020](#references) §5, Lemma 5.3, p. 264.)

The vanishing part is elementary: if 2M(q,r) < gcd(q,r) then every pair of centres is at distance at least
gcd/(qr) > ψ(q)/q + ψ(r)/r.

**Checks.**

- q = 2, r = 3, ψ ≡ 3/10: M = 9/10 < 1 = gcd, yet λ(𝒜_2 ∩ 𝒜_3) = 1/6 (exact computation), so the printed
  indicator is wrong; the corrected indicator is 1 here.

*Needs:* §3.1 (reduced and unrestricted approximation sets).

The implied constant is absolute.

**The second-moment bound (Proposition 5.4)**. Let ψ: ℕ → [0,1/2], Y ≥ X ≥ 1 with 1 ≤ `Σ_{X≤q≤Y}` ψ(q)φ(q)/q ≤
2, and L_t(a,b) = `Σ_{p | ab/gcd(a,b)², p ≥ t}` 1/p. For t ≥ 1 let ℰ_t = {(v,w) ∈ [X,Y]² : gcd(v,w) ≥
`t^{−1}M(v,w)`, L_t(v,w) ≥ 10}. Then `Σ_{(v,w)∈ℰ_t}` (φ(v)ψ(v)/v)(φ(w)ψ(w)/w) ≪ 1/t. ([KM-2020](#references) §5,
Proposition 5.4, p. 265; §6, its proof from Proposition 6.3, p. 270.)

Let μ(v) = ψ(v)φ(v)/v and 𝒱 = ℤ ∩ [X,Y], so μ(𝒱) ∈ [1,2]. The bipartite graph (𝒱, 𝒱, ℰ_t) with trivial
multiplicative data is a GCD graph; Proposition 6.3 gives μ(ℰ_t) ≪ 1/t, which is the claim.

**Checks.**

- t = exp exp j is the case used in (5.8).

*Needs:* §3.7 (arithmetic anatomy and the good subgraph); §3.4 (weighted gcd graphs).

### 3.4 Weighted GCD graphs

Finite positive vertex sets and an arbitrary set of recorded primes encode exact edge valuations. The quality balances edge density against valuation information; all normalizations are guarded at zero mass.

Allow an arbitrary set 𝒫 of primes. Finite metadata is a specialization for the iterative construction, not a restriction on the general carrier. Condition
(ii) is stated with p-adic valuations: the valuation of gcd(v,w) at p is min(f(p), g(p)).

Define GCDGraph. A GCD graph is G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) with `μ:ℕ→ℝ_{≥0}` an individually finite nonnegative
weight (no finite-total-mass assumption) (extended to pairs by μ(𝒩) = `Σ_{(n₁,n₂)∈𝒩}` μ(n₁)μ(n₂)), 𝒱, 𝒲 finite
sets of positive integers, ℰ ⊆ 𝒱 × 𝒲, 𝒫 a set of primes and f, g: 𝒫 → `ℤ_{≥0}` such that for p ∈ 𝒫: (i) `p^{f(p)}`
| v for v ∈ 𝒱 and `p^{g(p)}` | w for w ∈ 𝒲; (ii) `p^{min(f(p),g(p))}` ∥ gcd(v,w) for (v,w) ∈ ℰ; (iii) if f(p) ≠
g(p) then `p^{f(p)}` ∥ v for all v ∈ 𝒱 and `p^{g(p)}` ∥ w for all w ∈ 𝒲. G is non-trivial if μ(ℰ) > 0. G' ⪯ G (a
GCD subgraph) if μ' = μ, 𝒱' ⊆ 𝒱, 𝒲' ⊆ 𝒲, ℰ' ⊆ ℰ, 𝒫' ⊇ 𝒫 and f', g' extend f, g. ([KM-2020](#references) §6,
Definitions 6.1, 6.2 and 6.4, pp. 269–270; [KM-2020](#references) §6, Lemma 6.7, p. 273.)

Its API includes the following facts.

- TauCeti.DuffinSchaeffer.GCDGraph.vertexMeasure: μ(𝒮) = `Σ_{n∈𝒮}` μ(n)
- TauCeti.DuffinSchaeffer.GCDGraph.edgeMeasure: μ(𝒩) = `Σ_{(n₁,n₂)∈𝒩}` μ(n₁)μ(n₂)
- TauCeti.DuffinSchaeffer.GCDGraph.IsNontrivial: μ(ℰ) > 0 (Definition 6.2)
- TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph: The relation G' ⪯ G of Definition 6.4.

Encode G as a structure with fields for the data and the conditions (i)–(iii), with f, g: ℕ → ℕ read only on
𝒫. Define the vertex and edge measures, non-triviality and the subgraph relation. Lemma 6.7: transitivity and
reflexivity of ⪯, and ℛ monotone along ⪯ (ℛ of Layer 3, Edge density, ℛ(G) and the quality of a GCD graph
(Definition 6.6)), are immediate from the definitions; non-trivial graphs have vertex sets of positive
measure.

**Checks.**

- With ℰ = {(2,3)} and μ ≡ 1, μ(ℰ) = 1.

- V=W={1}, E={(1,1)}, μ(1)=1, 𝒫 all primes and f=g=0 is a nontrivial graph; its quality is the convergent positive product ∏_p(1−p^(−31/30))^(−10). A finite-metadata carrier would exclude it.

- An empty edge set gives a trivial graph.

- For p ∈ 𝒫 and (v,w) ∈ ℰ, `p^{min(f(p),g(p))+1}` does not divide gcd(v,w): condition (ii) is exact divisibility,
  not mere divisibility.

- The graph of Proposition 5.4 (vertex sets two copies of ℤ ∩ [X,Y], edge set ℰ_t, trivial primes) is a GCD
  graph.

*Needs:* Mathlib `Nat.factorization`; Mathlib `Nat.primeFactors`.

`𝒱_{p^k}` = {v ∈ 𝒱 : p^k ∥ v}; `𝒱_{p⁰}` is the set of v coprime to p. In ℛ♯ the exponent k can be bounded by the
largest vertex without changing the set.

Define GCDGraph.quality. For a GCD graph G: the edge density δ(G) = μ(ℰ)/(μ(𝒱)μ(𝒲)) (0 if a vertex set has
measure 0); the neighbourhoods Γ_G(v), Γ_G(w); ℛ(G) = {p ∉ 𝒫 : p | gcd(v,w) for some (v,w) ∈ ℰ}; ℛ♯(G) = {p ∈
ℛ(G) : ∃k with `μ(𝒱_{p^k})/μ(𝒱)`, `μ(𝒲_{p^k})/μ(𝒲)` ≥ 1 − 10⁴⁰/p}, ℛ♭(G) = ℛ(G) \ ℛ♯(G); and the quality q(G) =
δ¹⁰ μ(𝒱)μ(𝒲) `∏_{p∈𝒫}` `p^{|f(p)−g(p)|}/((1` − `𝟙_{f(p)=g(p)≥1}/p)²(1` − `p^{−31/30})¹⁰)`. ([KM-2020](#references)
§6, Definition 6.6 and the remark after it, pp. 271–273.)

Its API includes the following facts.

- TauCeti.DuffinSchaeffer.GCDGraph.edgeDensity: δ(G) = μ(ℰ)/(μ(𝒱)μ(𝒲)), or 0
- TauCeti.DuffinSchaeffer.GCDGraph.nbhdV: Γ_G(v) = {w ∈ 𝒲 : (v,w) ∈ ℰ}
- TauCeti.DuffinSchaeffer.GCDGraph.nbhdW: Γ_G(w) = {v ∈ 𝒱 : (v,w) ∈ ℰ}
- TauCeti.DuffinSchaeffer.GCDGraph.R:
ℛ(G), the primes outside 𝒫 dividing the gcd of an edge
- TauCeti.DuffinSchaeffer.GCDGraph.Vpow: `𝒱_{p^k}`
- TauCeti.DuffinSchaeffer.GCDGraph.Wpow: `𝒲_{p^k}`
- TauCeti.DuffinSchaeffer.GCDGraph.RSharp: ℛ♯(G)
- TauCeti.DuffinSchaeffer.GCDGraph.RFlat: ℛ♭(G) = ℛ(G) \ ℛ♯(G).

Define each quantity as displayed; ℛ(G) is a finite set because ℰ is finite. For quality, set q(G)=0 when μ(ℰ)=0; otherwise use the native infinite product over the subtype 𝒫. Prove GCDGraph.quality_product_convergent: choose an edge (v,w); every p with f(p)>0 or g(p)>0 divides vw, so such p form a finite set. Outside it the local factor is (1−p^(−31/30))^(−10), whose logarithms are summable by comparison with `Σ_{n≥2}n^(−31/30)`. Thus the product exists, is finite and strictly positive. Prove GCDGraph.quality_finite: finite 𝒫 gives exactly the displayed finite product. With no edges, f and g need not have finite support; the explicit zero-quality guard prevents an undefined product from affecting that case. (KM-2020, Definition 6.1(d), Definition 6.6 and following remark, pp.269–273.) Remark after Definition 6.6: when
μ(𝒱), μ(𝒲) > 0, q(G) = `μ(ℰ)¹⁰/(μ(𝒱)⁹μ(𝒲)⁹)·∏_{p∈𝒫}(…)`. Lemma 6.7(d): non-trivial ⟺ δ > 0 ⟺ q(G) > 0, since the
product over 𝒫 is positive. δ ≤ 1 because ℰ ⊆ 𝒱 × 𝒲 and μ ≥ 0.

**Checks.**

- ℰ = ∅ gives q(G) = 0.

- With 𝒫 = ∅ and μ(𝒱), μ(𝒲) > 0, q(G) = δ⁹μ(ℰ), the identity used in the proof of Proposition 6.3.

- If every edge has coprime ends then ℛ(G) = ∅.

- The factor ∏(1 − `p^{−31/30})^{−10}` lies in [1, ζ(31/30)¹⁰]; the factor ∏(1 − `𝟙_{f=g≥1}/p)^{−2}` is what the
  φ(q)/q weights pay for (Section 15).

*Needs:* §3.4 (weighted gcd graphs).

The source requires only p ∉ 𝒫 for the definition.

Define GCDGraph.restrictPow. For a GCD graph G, a prime p ∉ 𝒫 and k, ℓ ≥ 0, `G_{p^k,p^ℓ}` = (μ, `𝒱_{p^k}`,
`𝒲_{p^ℓ}`, ℰ ∩ `(𝒱_{p^k}` × `𝒲_{p^ℓ})`, 𝒫 ∪ {p}, `f_{p^k}`, `g_{p^ℓ})` with `f_{p^k}` extending f by k at p and `g_{p^ℓ}`
extending g by ℓ. It is a GCD subgraph of G. ([KM-2020](#references) §6, Definition 6.5, p. 271.)

Its basic API consists of these facts.

- The vertex sets are the exact p-adic valuation classes k and ℓ, and the edges are their restriction.
- The new graph is a subgraph extending the old valuation metadata by p.
- Its residual prime set is contained in the old residual set with p deleted; the quality ratio is the formula below when all its denominators are positive.

Check (i)–(iii) at p: p^k ∥ v on `𝒱_{p^k}`, p^ℓ ∥ w on `𝒲_{p^ℓ}`, and the gcd of an edge has valuation min(k,ℓ) at
p. At primes of 𝒫 the conditions are inherited. The subgraph relation and `ℛ(G_{p^k,p^ℓ})` ⊆ ℛ(G) \ {p} are
immediate.

**Checks.**

- On the complete bipartite graph 𝒱={1,2,4}, 𝒲={1,2,8}, with unit weights and empty prime metadata, (p,k,ℓ)=(2,0,0) retains {1}×{1}, with quality (1−2^(−31/30))^(−10).

- On that graph (2,1,3) retains {2}×{8}; the gcd valuation is exactly 1 and the quality is 4(1−2^(−31/30))^(−10). Keeping merely divisible vertices would also retain 4 on the left and give the wrong graph.

- On that graph (2,3,0) has no left vertices, no edges and quality zero, testing the zero-quality guard.

*Needs:* §3.4 (weighted gcd graphs).

Assume p ∉ 𝒫.

Prove TauCeti.DuffinSchaeffer.GCDGraph.quality_restrictPow. If G is non-trivial, p ∉ 𝒫 and `μ(𝒱_{p^k})`,
`μ(𝒲_{p^ℓ})` > 0, then `q(G_{p^k,p^ℓ})/q(G)` =
`(μ(ℰ_{p^k,p^ℓ})/μ(ℰ))¹⁰(μ(𝒱)/μ(𝒱_{p^k}))⁹(μ(𝒲)/μ(𝒲_{p^ℓ}))⁹·p^{|k−ℓ|}/((1` − `𝟙_{k=ℓ≥1}/p)²(1` − `p^{−31/30})¹⁰)`.
([KM-2020](#references) §11, Lemma 11.1, p. 288.)

**Checks.**

- k = ℓ = 0 gives the factor (1 − `p^{−31/30})^{−10}` > 1.

*Needs:* §3.4 (weighted gcd graphs).

One route uses the ambient types, measurability and finiteness hypotheses of Layer 3, GCD graph and GCD subgraph
(Definitions 6.1, 6.2, 6.4). Any additional assumptions are stated explicitly above.

Prove TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.trans. Lemma 6.7(a): ⪯ is transitive.
([KM-2020](#references) §6, Definitions 6.1, 6.2 and 6.4, pp. 269–270; [KM-2020](#references) §6, Lemma 6.7,
p. 273.)

*Needs:* §3.4 (weighted gcd graphs); Mathlib `Nat.factorization`; Mathlib `Nat.primeFactors`.

Prove TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.refl. G ⪯ G. ([KM-2020](#references) §6, Definitions 6.1,
6.2 and 6.4, pp. 269–270; [KM-2020](#references) §6, Lemma 6.7, p. 273.)

*Needs:* §3.4 (weighted gcd graphs); Mathlib `Nat.factorization`; Mathlib `Nat.primeFactors`.

Prove TauCeti.DuffinSchaeffer.GCDGraph.R_subset_of_isSubgraph. Lemma 6.7(b): G' ⪯ G implies ℛ(G') ⊆ ℛ(G).
([KM-2020](#references) §6, Definitions 6.1, 6.2 and 6.4, pp. 269–270; [KM-2020](#references) §6, Lemma 6.7,
p. 273.)

*Needs:* §3.4 (weighted gcd graphs); Mathlib `Nat.factorization`; Mathlib `Nat.primeFactors`.

Prove TauCeti.DuffinSchaeffer.GCDGraph.vertexMeasure_pos_of_isNontrivial. Lemma 6.7(c): a non-trivial G has
μ(𝒱), μ(𝒲) > 0. ([KM-2020](#references) §6, Definitions 6.1, 6.2 and 6.4, pp. 269–270;
[KM-2020](#references) §6, Lemma 6.7, p. 273.)

*Needs:* §3.4 (weighted gcd graphs); Mathlib `Nat.factorization`; Mathlib `Nat.primeFactors`.

One route uses the ambient types, measurability and finiteness hypotheses of Layer 3, Edge density, ℛ(G) and the quality
of a GCD graph (Definition 6.6). Any additional assumptions are stated explicitly above.

Prove TauCeti.DuffinSchaeffer.GCDGraph.isNontrivial_iff. Lemma 6.7(d): non-trivial ⟺ δ > 0 ⟺ q > 0.
([KM-2020](#references) §6, Definition 6.6 and the remark after it, pp. 271–273.)

*Needs:* §3.4 (weighted gcd graphs).

Prove TauCeti.DuffinSchaeffer.GCDGraph.quality_eq. q(G) = μ(ℰ)¹⁰/(μ(𝒱)⁹μ(𝒲)⁹)·∏ when μ(𝒱), μ(𝒲) > 0.
([KM-2020](#references) §6, Definition 6.6 and the remark after it, pp. 271–273.)

*Needs:* §3.4 (weighted gcd graphs).

Prove TauCeti.DuffinSchaeffer.GCDGraph.edgeDensity_le_one. δ(G) ≤ 1. ([KM-2020](#references) §6, Definition
6.6 and the remark after it, pp. 271–273.)

*Needs:* §3.4 (weighted gcd graphs).

One route uses the ambient types, measurability and finiteness hypotheses of Layer 3, The special GCD subgraphs
`G_{p^k,p^ℓ}` (Definition 6.5). Any additional assumptions are stated explicitly above.

Prove TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_isSubgraph. `G_{p^k,p^ℓ}` ⪯ G. ([KM-2020](#references) §6,
Definition 6.5, p. 271.)

*Needs:* §3.4 (weighted gcd graphs).

Prove TauCeti.DuffinSchaeffer.GCDGraph.R_restrictPow. `ℛ(G_{p^k,p^ℓ})` ⊆ ℛ(G) \ {p}. ([KM-2020](#references)
§6, Definition 6.5, p. 271.)

*Needs:* §3.4 (weighted gcd graphs).

### 3.5 Pruning vertices and finding weighted pieces

Prune low-degree vertices and concentrate on finite valuation classes. These operations preserve the arithmetic graph conditions while controlling quality and density.

G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g) is a GCD graph (Layer 3, GCD graph and GCD subgraph (Definitions 6.1, 6.2, 6.4))
with edge density δ; μ(ℰ) = `Σ_{(v,w)∈ℰ}` μ(v)μ(w), `𝒱_{p^k}` = {v ∈ 𝒱 : p^k ∥ v}, and `G_{p^k,p^ℓ}` is the special
subgraph of Definition 6.5.

**High degree or a quality increment (Lemma 10.1)**. If δ > 0, either every vertex has μ(Γ(v)) ≥ (9δ/10)μ(𝒲)
and μ(Γ(w)) ≥ (9δ/10)μ(𝒱), or there is G' ⪯ G with the same multiplicative data, δ' ≥ δ, q(G') ≥ q(G), and 𝒱'
⊊ 𝒱 or 𝒲' ⊊ 𝒲. ([KM-2020](#references) §10, Lemma 10.1 and proof, pp. 286–287.)

If v has μ(Γ(v)) < (9δ/10)μ(𝒲), delete v: μ(ℰ') = μ(ℰ) − μ(v)μ(Γ(v)) > μ(ℰ)/10 > 0. δ' ≥ δ(1 + (μ(v)/10)/(μ(𝒱)
− μ(v))), and by Bernoulli (δ')¹⁰μ(𝒱 \ {v})μ(𝒲) ≥ δ¹⁰μ(𝒱)μ(𝒲), so q(G') ≥ q(G). The case of w is symmetric.

**Checks.**

- Deleting a vertex of zero weight changes nothing.

*Needs:* §3.4 (weighted gcd graphs).

**Subgraph with high-degree vertices (Lemma 8.5)**. If δ > 0, there is G' = (μ, 𝒱', 𝒲', ℰ', 𝒫, f, g) ⪯ G with
δ' ≥ δ, q(G') ≥ q(G), and `μ(Γ_{G'}(v))` ≥ (9δ'/10)μ(𝒲'), `μ(Γ_{G'}(w))` ≥ (9δ'/10)μ(𝒱') for all vertices.
([KM-2020](#references) §8, Lemma 8.5, p. 280; §10, proof, p. 287.)

Apply Lemma 10.1 repeatedly; each application removes a vertex without lowering δ or q, so the process stops,
at a graph satisfying the degree conditions.

**Checks.**

- The multiplicative data never change.

*Needs:* §3.5 (pruning vertices and finding weighted pieces).

**One part has limited quality loss (Lemma 11.2)**. If δ > 0 and 𝒱 = 𝒱₁ ⊔ … ⊔ 𝒱_I, 𝒲 = 𝒲₁ ⊔ … ⊔ 𝒲_J, there are
i, j such that G' = (μ, 𝒱ᵢ, 𝒲ⱼ, ℰ ∩ (𝒱ᵢ × 𝒲ⱼ), 𝒫, f, g) has δ' ≥ δ/(IJ) > 0 and q(G') ≥ q(G)/(IJ)¹⁰.
([KM-2020](#references) §11, Lemma 11.2 and proof, p. 288.)

Pigeonhole: some `ℰ_{i,j}` has `μ(ℰ_{i,j})` ≥ μ(ℰ)/(IJ). δ'/δ ≥ `μ(ℰ_{i,j})/μ(ℰ)` and q'/q ≥ `(μ(ℰ_{i,j})/μ(ℰ))¹⁰`,
because the vertex ratios are at least 1.

**Checks.**

- I = J = 1 returns G.

*Needs:* §3.4 (weighted gcd graphs).

Assume p ∉ 𝒫.

**Few edges between unbalanced sets (Lemmas 11.3 and 11.4)**. Let δ > 0, p ∉ 𝒫 prime, r ≥ 1, k ≥ 0 with p^r >
10²⁰⁰⁰ and `μ(𝒲_{p^k})` ≥ (1 − 10⁴⁰/p)μ(𝒲), and `L_{k,r}` = {ℓ : |ℓ − k| ≥ r + 1}. Then either (a) some ℓ ∈
`L_{k,r}` has `q(G_{p^k,p^ℓ})` > 2q(G) and `δ_{p^k,p^ℓ}q(G_{p^k,p^ℓ})` > 2δq(G), or (b) `Σ_{ℓ∈L_{k,r}}` `μ(ℰ_{p^k,p^ℓ})`
≤ `μ(ℰ)/(4p^{31/30})`. Lemma 11.4 is the same with the roles of 𝒱 and 𝒲 exchanged. ([KM-2020](#references) §11,
Lemmas 11.3 and 11.4, pp. 288–290.)

If (b) fails, some ℓ ∈ `L_{k,r}` has `μ(ℰ_{p^k,p^ℓ})` > `μ(ℰ)/(300·2^{|k−ℓ|/20}p^{31/30})`, since Σ_j `2^{−|j|/20}` ≤
60. `μ(𝒲_{p^ℓ})` ≤ 10⁴⁰μ(𝒲)/p. By Lemma 11.1, `q(G_{p^k,p^ℓ})/q(G)` ≥ `p^{−4/3}(p/2^{1/2})^{|k−ℓ|}/10³⁸⁵` ≥
`p^{r/3}/(2^{4/3}·10³⁸⁵)` > 2, using |k−ℓ| ≥ r + 1 ≥ 2r/3 + 4/3 and p^r > 10²⁰⁰⁰. Likewise (δ'/δ)(q'/q) ≥
`p^{−41/30}(p/2^{11/20})^{|k−ℓ|}/10⁴²⁸` ≥ `(p^{9/20})^{19r/30}/(2^{41·11/600}·10⁴²⁸)` > 2.

**Checks.**

- If p ≤ 10⁴⁰ the density hypothesis is vacuous.

*Needs:* §3.4 (weighted gcd graphs).

**Few edges between small sets (Lemma 11.5)**. Let δ > 0 and η ∈ (0,1). Either every A ⊆ 𝒱, B ⊆ 𝒲 with μ(A) ≤
ημ(𝒱), μ(B) ≤ ημ(𝒲) has μ(ℰ ∩ (A × B)) ≤ `η^{9/5}μ(ℰ)`, or there is G' ⪯ G with the same multiplicative data,
q(G') > q(G), 𝒱' ⊊ 𝒱 and 𝒲' ⊊ 𝒲. ([KM-2020](#references) §11, Lemma 11.5 and proof, p. 290.)

If A, B violate the bound, G' = (μ, A, B, ℰ ∩ (A × B), 𝒫, f, g) is non-trivial, A ⊊ 𝒱 and B ⊊ 𝒲 (η < 1), and
q(G')/q(G) > `(η^{9/5})¹⁰/(η⁹η⁹)` = 1.

**Checks.**

- The exponent 9/5 balances 10 against 9 + 9.

*Needs:* §3.4 (weighted gcd graphs).

**Subgraph with few edges between small sets (Lemma 11.6)**. Let δ > 0 and η ∈ (0,1). There is G' ⪯ G with the
same multiplicative data, δ' > 0, q(G') ≥ q(G), and μ(ℰ' ∩ (A × B)) ≤ `η^{9/5}μ(ℰ')` whenever μ(A) ≤ ημ(𝒱'),
μ(B) ≤ ημ(𝒲'). ([KM-2020](#references) §11, Lemma 11.6 and proof, pp. 291.)

Iterate Lemma 11.5; the vertex sets strictly shrink, so the process stops, and the quality strictly increases
along the way.

**Checks.**

- Used in Lemma 14.1 with η = 10⁴⁰/p.

*Needs:* §3.5 (pruning vertices and finding weighted pieces).

### 3.6 Prime-by-prime quality increments

The iteration either gains quality or identifies a dominant valuation. Small primes incur a bounded global loss; large flat and sharp primes remove the residual shared-prime set.

Require μ(ℰ)>0, equivalently δ>0. This makes all normalized edge and vertex measures well defined. It is
satisfied by the callers in Lemmas 12.2 and 13.1; the printed Lemma 12.1 omits it. G = (μ, 𝒱, 𝒲, ℰ, 𝒫, f, g)
is a GCD graph (Layer 3, GCD graph and GCD subgraph (Definitions 6.1, 6.2, 6.4)) with edge density δ; μ(ℰ) =
`Σ_{(v,w)∈ℰ}` μ(v)μ(w), `𝒱_{p^k}` = {v ∈ 𝒱 : p^k ∥ v}, and `G_{p^k,p^ℓ}` is the special subgraph of Definition 6.5.
Assume p ∉ 𝒫.

**Some pair of prime-power classes carries many edges (Lemma 12.1)**. Let G be non-trivial and p ∉ 𝒫 be prime,
α_k = `μ(𝒱_{p^k})/μ(𝒱)`, β_ℓ = `μ(𝒲_{p^ℓ})/μ(𝒲)`. There are k, ℓ with α_k, β_ℓ > 0 and `μ(ℰ_{p^k,p^ℓ})/μ(ℰ)` ≥
`(α_kβ_k)^{9/10}` if k = ℓ, and ≥ (α_k(1−β_k) + β_k(1−α_k) + α_ℓ(1−β_ℓ) + `β_ℓ(1−α_ℓ))/(2^{|k−ℓ|/20}·1000)` if k ≠
ℓ. ([KM-2020](#references) §12, Lemma 12.1 and proof, pp. 291–293.)

Otherwise 1 = `Σ_{(k,ℓ)}` `μ(ℰ_{p^k,p^ℓ})/μ(ℰ)` < S₁ + S₂ with S₁ = `Σ(α_kβ_k)^{9/10}` and S₂ the off-diagonal sum.
`Σ_{|j|≥1}` `2^{−|j|/20}` ≤ 100 gives S₂ ≤ `(2/5)Σ_{k≠ℓ}α_kβ_ℓ` ≤ (2/5)(1 − γ), γ = max α_kβ_k. Cauchy–Schwarz gives
S₁ ≤ `γ^{2/5}`. `x^{2/5}` + 2(1−x)/5 ≤ 1 on [0,1], a contradiction.

**Checks.**

- If all vertices have the same p-valuation k, the lemma returns (k,k) with the full edge set.

*Needs:* §3.4 (weighted gcd graphs).

Assume p ∉ 𝒫. In case (a), 𝒫' = 𝒫 ∪ {p} and ℛ(G') ⊆ ℛ(G) \ {p}.

**Quality increment unless a prime power divides almost all (Lemma 12.2)**. Let δ > 0 and p ∉ 𝒫 a prime with p
> 10⁴⁰. Either (a) some G' = `G_{p^k,p^ℓ}` has δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ `2^{𝟙_{k≠ℓ}}`, or (b) some k
has `μ(𝒱_{p^k})` ≥ (1 − 10⁴⁰/p)μ(𝒱) and `μ(𝒲_{p^k})` ≥ (1 − 10⁴⁰/p)μ(𝒲). ([KM-2020](#references) §12, Lemma 12.2
and proof, pp. 293–295.)

Take k, ℓ from Lemma 12.1. If k = ℓ, Lemma 11.1 gives q'/q ≥ 1 and δ'/δ ≥ `(α_kβ_k)^{−1/10}` ≥ 1. If k ≠ ℓ, with
S = α_k(1−β_k) + β_k(1−α_k) + α_ℓ(1−β_ℓ) + β_ℓ(1−α_ℓ) ≥ α_kβ_ℓ: min{q'/q, (δ'/δ)(q'/q)} ≥
`S²/(1000¹¹α_kβ_ℓ)·(p/2^{11/20})^{|k−ℓ|}` (12.3). If (a) fails, S ≤ 10³⁴/p ≤ 1/5, and S ≥ (α_k + β_ℓ)(1 −
max{α_ℓ, β_k}) with AM–GM gives max{α_ℓ, β_k} ≥ 1/2. If β_k ≥ 1/2 then 1 − α_k ≤ 2S and then 1 − β_k ≤ 2S,
both ≤ 10⁴⁰/p; the other case is symmetric.

**Checks.**

- Case (b) is exactly p ∈ ℛ♯ when p ∈ ℛ(G).

*Needs:* §3.6 (prime-by-prime quality increments); §3.4 (weighted gcd graphs).

**Small quality loss or a dominant prime power (Lemma 13.1)**. Let δ > 0 and p ∉ 𝒫 prime. Either (a) some G' =
`G_{p^k,p^ℓ}` has δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ `10^{−40}`, or (b) some k has `μ(𝒱_{p^k})` ≥ (9/10)μ(𝒱) and
`μ(𝒲_{p^k})` ≥ (9/10)μ(𝒲). ([KM-2020](#references) §13, Lemma 13.1 and proof, p. 296.)

Proceed as in Lemma 12.2 up to (12.3), which does not use the size of p. If k = ℓ, (a) holds. If k ≠ ℓ and (a)
fails, S ≤ S²/(α_kβ_ℓ) ≤ `10^{−7}`, so max{α_ℓ, β_k} ≥ 9/10; if β_k ≥ 9/10 then 1 − α_k ≤ 2S, so α_k ≥ 9/10. The
other case is symmetric.

**Checks.**

- No lower bound on p is needed.

*Needs:* §3.6 (prime-by-prime quality increments); §3.4 (weighted gcd graphs).

**Adding a small prime to 𝒫 (Lemma 13.2)**. Let δ > 0 and p ∈ ℛ(G) with p ≤ 10²⁰⁰⁰. There is G' ⪯ G with 𝒫' =
𝒫 ∪ {p}, ℛ(G') ⊆ ℛ(G) \ {p}, δ' > 0 and min{1, δ'/δ}·q(G')/q(G) ≥ `10^{−50}`. ([KM-2020](#references) §13,
Lemma 13.2 and proof, pp. 297–299.)

Apply Lemma 10.1 until every v has μ(Γ(v)) ≥ (9δ⁽¹⁾/10)μ(𝒲⁽¹⁾); δ and q do not drop. (p may leave ℛ(G⁽¹⁾); the
lemmas below need only p ∉ 𝒫.) Lemma 13.1: (a) finishes; otherwise some k has both classes of density ≥ 9/10.
If p > 10⁴¹, Lemma 12.2 either finishes or gives a class of density ≥ 1 − 10⁴⁰/p, which must be the same k
(13.2). Fix r ≤ 6644 with p^r > 10²⁰⁰⁰ and apply Lemma 11.3: (a) finishes; (b) leaves at most μ(ℰ)/4 on
classes |ℓ − k| > r. Restricting to `𝒱_{p^k}` and the classes |ℓ − k| ≤ r keeps at least 56% of the edges, so δ
and q lose at most 2 and 2¹⁰. Lemma 11.2 on the at most 2·6644 + 1 ≤ 15000 classes gives some ℓ with q ≥
q/(15000¹⁰·2¹⁰) ≥ q/10⁵⁰ and δq ≥ δq/10⁵⁰; `G_{p^k,p^ℓ}` has at least this quality.

**Checks.**

- `2^{6644}` > 10²⁰⁰⁰, so r ≤ 6644 exists for every prime.

*Needs:* §3.5 (pruning vertices and finding weighted pieces); §3.6 (prime-by-prime quality increments); §3.4
(weighted gcd graphs).

**Quality increment even when a prime power divides almost all (Lemma 14.1)**. Let δ > 0 and p ∈ ℛ(G) with p ≥
10²⁰⁰⁰. There is G' ⪯ G with 𝒫' = 𝒫 ∪ {p}, ℛ(G') ⊆ ℛ(G) \ {p} and q(G') ≥ q(G) > 0. ([KM-2020](#references)
§14, Lemma 14.1 and proof, pp. 300–304.)

By Lemma 11.6 with η = 10⁴⁰/p assume few edges between small sets (14.1); p may leave ℛ, which does not
matter. Lemma 12.2 either finishes or gives k with both classes of density ≥ 1 − 10⁴⁰/p. Lemmas 11.3 and 11.4
with r = 1 either finish or bound the edges from class k to classes at distance ≥ 2 by `μ(ℰ)/(4p^{31/30})`
(14.3)–(14.4). With (14.2), the edge set ℰ* = `ℰ(𝒱_{p^k}`, `𝒲̃_{p^k})` ∪ `ℰ(𝒱̃_{p^k}`, `𝒲_{p^k})` keeps a proportion
(1 − `p^{−31/30})^{2/3}`, so q(G*) ≥ (1 − `p^{−31/30})^{20/3}q(G)` (14.5). Split ℰ* into G⁺ (classes k, k+1 with
f(p) = g(p) = k) and `G_{p^k,p^{k−1}}`, `G_{p^{k−1},p^k}`. If k = 0 then q(G⁺) ≥ q(G*)/(1 − `p^{−31/30})¹⁰` ≥ q(G);
the source writes equality here. If k ≥ 1, write the (k−1)-classes as densities A/p, B/p with A, B ≤ 10⁴⁰. One
of (14.13)–(14.15) holds because S < 1 (using 1 − x ≤ `e^{−x}` ≤ 1 − x + x²/2 and the weighted AM–GM (9A + 1)/10
≥ `A^{9/10})`; the corresponding graph among G⁺, `G_{p^k,p^{k−1}}`, `G_{p^{k−1},p^k}` has q ≥ q(G).

**Checks.**

- The factor (1 − `𝟙_{f=g≥1}/p)^{−2}` in the quality is what makes G⁺ gain when k ≥ 1.

*Needs:* §3.5 (pruning vertices and finding weighted pieces); §3.6 (prime-by-prime quality increments); §3.4
(weighted gcd graphs).

**Iteration when ℛ♭(G) ≠ ∅ (Proposition 8.1)**. If δ > 0, ℛ(G) ⊆ {p > 10²⁰⁰⁰} and ℛ♭(G) ≠ ∅, there is G' ⪯ G
with δ' > 0, 𝒫 ⊊ 𝒫' ⊆ 𝒫 ∪ ℛ(G), ℛ(G') ⊊ ℛ(G) and min{1, δ'/δ}·q(G')/q(G) ≥ 2^N, N = #{p ∈ 𝒫' \ 𝒫 : f'(p) ≠
g'(p)}. ([KM-2020](#references) §8, Proposition 8.1, p. 279; §12, proof, p. 295.)

Pick p ∈ ℛ♭(G); then p > 10²⁰⁰⁰ > 10⁴⁰. Conclusion (b) of Lemma 12.2 contradicts p ∉ ℛ♯(G), so conclusion (a)
holds, with N = `𝟙_{f'(p)≠g'(p)}`.

**Checks.**

- Only one prime is added per step.

*Needs:* §3.6 (prime-by-prime quality increments).

**Iteration when ℛ♭(G) = ∅ (Proposition 8.2)**. If δ > 0, ℛ(G) ⊆ {p > 10²⁰⁰⁰}, ℛ♭(G) = ∅ and ℛ♯(G) ≠ ∅, there
is G' ⪯ G with 𝒫 ⊊ 𝒫' ⊆ 𝒫 ∪ ℛ(G), ℛ(G') ⊊ ℛ(G) and q(G') ≥ q(G). ([KM-2020](#references) §8, Proposition 8.2,
p. 279; §14, proof, p. 304.)

Any p ∈ ℛ(G) exceeds 10²⁰⁰⁰; apply Lemma 14.1.

**Checks.**

- The quality does not decrease; there is no increment.

*Needs:* §3.6 (prime-by-prime quality increments).

**Bounded quality loss for small primes (Proposition 8.3)**. If G has trivial primes and δ > 0, there is G' ⪯
G with δ' > 0, 𝒫' ⊆ {p ≤ 10²⁰⁰⁰}, ℛ(G') ⊆ {p > 10²⁰⁰⁰} and min{1, δ'/δ}·q(G')/q(G) ≥ `10^{−10^{3000}}`.
([KM-2020](#references) §8, Proposition 8.3, p. 279; §13, proof, pp. 299–300.)

If ℛ(G) has no prime ≤ 10²⁰⁰⁰, take G' = G. Otherwise apply Lemma 13.2 to such primes repeatedly; each step
removes one small prime from ℛ and loses at most 10⁵⁰ in q and δq (13.3). At most 10²⁰⁰⁰ steps occur, and
`(10⁵⁰)^{10²⁰⁰⁰}` ≤ `10^{10^{3000}}`.

**Checks.**

- The loss is enormous but independent of G and t.

*Needs:* §3.6 (prime-by-prime quality increments).

**Removing the effect of ℛ(G) from L_t (Lemma 8.4)**. Let t ≥ 300, ℛ♭(G) = ∅, δ ≥ (10/t)⁵⁰ and ℰ ⊆ {L_t ≥ 10}.
Then there is G' = (μ, 𝒱, 𝒲, ℰ', 𝒫, f, g) ⪯ G with q(G') ≥ q(G)/2 > 0 and `Σ_{p | vw/gcd(v,w)², p ≥ t, p ∉`
ℛ(G)} 1/p ≥ 5 for every (v,w) ∈ ℰ'. ([KM-2020](#references) §8, Lemma 8.4, p. 280; §9, proof, pp. 285–286.)

Let S(v,w) = `Σ_{p | vw/gcd², p ∈ ℛ(G), p ≥ t⁵⁰}` 1/p. Every p ∈ ℛ(G) is in ℛ♯(G), so a p dividing vw/gcd²
separates the two sides of a dominant class p^k, and μ{(v,w) ∈ ℰ : p | vw/gcd²} ≤ 2·10⁴⁰μ(𝒱)μ(𝒲)/p. Hence Σ_ℰ
μ(v)μ(w)S(v,w) ≤ 2·10⁴⁰μ(𝒱)μ(𝒲)/t⁵⁰ < μ(ℰ)/100, using δ ≥ (10/t)⁵⁰. Keep ℰ' = {S ≤ 1}: μ(ℰ') ≥ 0.99μ(ℰ) and
q(G')/q(G) = (μ(ℰ')/μ(ℰ))¹⁰ ≥ 1/2. `Σ_{t≤p≤t⁵⁰}` 1/p ≤ log 50 + 1/(log t)² ≤ 4 for t ≥ 300 (Rosser–Schoenfeld
Theorem 5, requested from AnalyticNumberTheoryPartI §§0.19, 0.21). So the primes of ℛ(G) contribute at most 5 to L_t on ℰ', leaving at least 5.

**Checks.**

- In the application t > 10²⁰⁰⁰, so any effective form of Mertens' second theorem suffices.

*Needs:* §3.4 (weighted gcd graphs); AnalyticNumberTheoryPartI §§0.19, 0.21.

### 3.7 Arithmetic anatomy and the good subgraph

An elementary multiplicative bound and Mertens estimates control integers with many large prime factors. Apply the good-subgraph alternative to bound the exceptional edge mass and close the Duffin–Schaeffer second moment.

**Divisor-bounded multiplicative mean.** Prove the general multiplicative mean bound: for every integer k≥1, every multiplicative f with 0≤f(n)≤τ_k(n) on positive integers, and every x≥1,
`Σ_{1≤n≤x}f(n)≤C_k` x `exp(Σ_{p≤x}(f(p)−1)/p)`, where C_k depends only on k. Here τ_k is the native k-fold Dirichlet convolution power of the constant-one arithmetic function. One proof route combines the finite upper sieve `BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius` with prime-power tails from divisor domination (KM-2020, Lemma 7.2, p.274; Koukoulopoulos2019, Theorem 14.2, p.145).

**Checks.**

- For f=τ₂ one has f(p^ν)=ν+1, so it is covered by the general estimate

- The constant-one function is covered at k=1

- F(p)=0 is allowed, so nonnegativity of f does not imply f(p)≥1.

The following constant-one refinement has an elementary proof and is kept separately. Take x≥1 and sum over positive integers 1≤n≤x. Multiplicativity includes f(1)=1; the convolution in the proof is native Dirichlet
convolution, not pointwise multiplication.

**Rankin-type bound for multiplicative functions (case of Lemma 7.2)**. Let f be multiplicative with f(p^ν) =
f(p) ≥ 1 for every prime p and ν ≥ 1. Then `Σ_{n≤x}` f(n) ≤ `x·exp(Σ_{p≤x}` (f(p) − 1)/p).
([KM-2020](#references) §7, Lemma 7.2, p. 274.)

Write f = 1 * h with h multiplicative, h(p) = f(p) − 1 ≥ 0 and h(p^ν) = 0 for ν ≥ 2. `Σ_{n≤x}` f(n) = `Σ_{d≤x}`
h(d)⌊x/d⌋ ≤ x `Σ_{d≤x}` h(d)/d ≤ x `∏_{p≤x}(1` + h(p)/p) ≤ x `exp(Σ_{p≤x}` h(p)/p).

**Checks.**

- f ≡ 1 gives ⌊x⌋ ≤ x.

- Lemma 7.3 uses f(p^ν) = `e^{2T/p}` for p ≥ T and 1 otherwise.

*Needs:* Mathlib `ArithmeticFunction`.

The decay exponent is `t^{exp(c−1)}`.

**Few integers with many large prime factors (Lemma 7.3)**. For x, t ≥ 1 and c ∈ [1,10], #{n ≤ x : `Σ_{p|n`,
p≥t} 1/p ≥ c} ≪ `x·exp(−t^{e^{c−1}})`, with an absolute implied constant. ([KM-2020](#references) §7, Lemma 7.3
and proof, pp. 274–275.)

For bounded t the claim is trivial. Put T = `t^{e^{c−1}}`; by Mertens' theorem (requested from AnalyticNumberTheoryPartI §§0.19, 0.21) `Σ_{t≤p<T}`
1/p ≤ c − 1/2 for large t, so the set lies in {n ≤ x : `Σ_{p|n,p≥T}` 1/p ≥ 1/2} (7.1). Rankin: that set has at
most `e^{−T}Σ_{n≤x}` `∏_{p|n,p≥T}` `e^{2T/p}` elements. Apply the multiplicative-function bound with f(p^ν) =
`e^{2T/p}` for p ≥ T and 1 for p < T. `Σ_{T≤p≤x}` `(e^{2T/p}` − 1)/p = `O(Σ_{p≥T}` T/p²) = O(1), so the count is ≪ x
`e^{−T}`.

**Checks.**

- c = 2 gives ≪ x exp(−t^e), used in Case (d)(ii) of Proposition 6.3.

*Needs:* §3.7 (arithmetic anatomy and the good subgraph); AnalyticNumberTheoryPartI §§0.19, 0.21.

The implied constants are absolute (explicitly, powers of `10^{10^{3000}})`.

**Existence of a good GCD subgraph (Proposition 7.1)**. Let G = (μ, 𝒱, 𝒲, ℰ, ∅, f_∅, g_∅) have edge density δ
> 0, ℰ ⊆ {L_t ≥ 10}, t ≥ `10δ^{−1/50}` and t > 10²⁰⁰⁰. Then there is G' ⪯ G with δ' > 0, ℛ(G') = ∅, `μ(Γ_{G'}(v))`
≥ (9δ'/10)μ(𝒲') for v ∈ 𝒱', `μ(Γ_{G'}(w))` ≥ (9δ'/10)μ(𝒱') for w ∈ 𝒲', and either (i) q(G') ≫ δt⁵⁰q(G), or (ii)
q(G') ≫ q(G) and L_t(v',w') ≥ 4 for every edge, where v = `v'∏_{p∈𝒫'}p^{f'(p)}`, w = w'∏ `p^{g'(p)}`.
([KM-2020](#references) §7, Proposition 7.1, p. 273; §8, its proof, pp. 280–284.)

It suffices to get (a) and (d); Lemma 8.5 then adds the degree conditions without changing 𝒫 or ℛ = ∅. Stage
1: Proposition 8.3 gives G⁽¹⁾ with ℛ(G⁽¹⁾) ⊆ {p > 10²⁰⁰⁰} and q, δq losing at most `10^{10^{3000}}` (8.1). Stage
2: iterate Proposition 8.1 while ℛ♭ ≠ ∅ (ℛ strictly shrinks) to reach G⁽²⁾ with ℛ♭(G⁽²⁾) = ∅, gaining 2^N, N =
#{p ∈ 𝒫⁽²⁾ \ 𝒫⁽¹⁾ : f ≠ g} (8.3). Case (a), q(G⁽²⁾)/q(G) ≥ `(t/10)⁵⁰δ/10^{10^{3000}}:` iterate Proposition 8.1
or 8.2 until ℛ = ∅; the quality never drops, giving (d)(i). Case (b): δ⁽²⁾ ≥ (10/t)⁵⁰ and 2^N ≤ t⁵⁰. Lemma 8.4
gives G⁽³ᵇ⁾ with 𝒫 unchanged, q ≥ q/2, and `Σ_{p | vw/gcd², p≥t, p∉ℛ(G⁽²⁾)}` 1/p ≥ 5 (8.8). The primes of 𝒫⁽²⁾
with f ≠ g contribute at most N/t < 1, giving (8.10). Stage 4b: iterate Propositions 8.1/8.2 to reach ℛ = ∅.
Every prime p with p | vw/gcd² but p ∤ v'w' lies in 𝒫_diff⁽²⁾ ∪ ℛ(G⁽²⁾), so (8.10) gives L_t(v',w') ≥ 4, which
is (d)(ii).

**Checks.**

- The iteration terminates because ℛ strictly decreases and is finite.

*Needs:* §3.6 (prime-by-prime quality increments); §3.5 (pruning vertices and finding weighted pieces); §3.4
(weighted gcd graphs).

ℰ_t as in Proposition 5.4: gcd(v,w) ≥ M(v,w)/t and L_t(v,w) ≥ 10.

**Edge-set bound (Proposition 6.3)**. Let ψ: ℕ → `ℝ_{≥0}`, t ≥ 1, μ(v) = ψ(v)φ(v)/v, and G = (μ, 𝒱, 𝒱, ℰ, ∅,
f_∅, g_∅) with 0 < μ(𝒱) ≪ 1 and ℰ ⊆ ℰ_t. Then μ(ℰ) ≪ 1/t. ([KM-2020](#references) §6, Proposition 6.3, p.
269; §7, its proof, pp. 275–279.)

If δ ≤ 1/t or t ≤ 10²⁰⁰⁰, μ(ℰ) ≤ δμ(𝒱)² ≪ 1/t. Otherwise δ ≥ 1/t, t > 10²⁰⁰⁰ and t ≥ `10δ^{−1/50}`; apply
Proposition 7.1 to get G'. With a = `∏_{p∈𝒫'}` `p^{f'(p)}`, b = ∏ `p^{g'(p)}:` a | v, b | w, and gcd(v,w) = gcd(a,b)
on ℰ' (ℛ(G') = ∅). Then `∏p^{|f'−g'|}` = ab/gcd(a,b)² and ∏(1 − `𝟙/p)^{−2}` ≤ ab/(φ(a)φ(b)), so q(G') ≪
δ'⁹μ(ℰ')(ab/gcd²)(ab/φ(a)φ(b)) (7.2). From M ≤ t·gcd on edges, ψ(v) ≤ t·gcd(a,b)/w_max(v) and ψ(w) ≤
t·gcd(a,b)/v_max(w) (7.3). Restricting to the edges ℰ'' at the largest w₀ keeps μ(ℰ'') ≥ δ'μ(ℰ')/2 by the
degree conditions, and φ(v)/v ≤ φ(a)/a, so q(G') ≪ t²ab `Σ_{(v,w)∈ℰ'}` 1/(v_max(w)w₀) (7.6). Case (d)(i): the
sum is ≤ 1/(ab), so q(G') ≪ t², and μ(ℰ) = `δ^{−9}q(G)` ≪ `δ^{−10}t^{−50}q(G')` ≪ 1/t. Case (d)(ii): L_t(v',w') ≥
4 forces `Σ_{p|v',p≥t}` 1/p ≥ 2 or the same for w'; Lemma 7.3 with c = 2 bounds the sum by ≪ 1/(ab t² e^t), so
q(G') ≪ `e^{−t}` and μ(ℰ) ≪ `t⁹e^{−t}` ≪ 1/t.

**Checks.**

- The φ(v)/v factor in μ is what cancels ab/(φ(a)φ(b)) in (7.2); without it the argument fails (Section 15).

*Needs:* §3.7 (arithmetic anatomy and the good subgraph); §3.4 (weighted gcd graphs).

### 3.8 Gauges and disjoint expanded coverings

One route uses the native diameter-gauge Hausdorff construction. Radius comparison and a finite disjoint covering lemma prepare the mass-transference construction.

Define `IsDimensionGauge`. IsDimensionGauge f for f:ℝ≥0→ℝ≥0 means f(0)=0, f(r)>0 for r>0, f is monotone, and f
is continuous. This extends the source’s positive-radius convention continuously at zero. Its Hausdorff
measure is the existing Measure.mkMetric diameter-gauge construction, with the ENNReal extension retaining f
on every finite radius; no new measure carrier is introduced. ([BeresnevichVelani](#references)
§2.1, printed p.974.)

Its basic API consists of these facts.

- The gauge has value 0 at 0 and is strictly positive at every positive radius.
- It is monotone on the nonnegative real radii.
- Continuity gives convergence to 0 at radius 0.

Bundle only the precise hypotheses on the existing scalar function, retaining positivity and the zero limit.
The diameter/radius comparison is a separate lemma; its constants are not an equality of normalizations.

**Checks.**

- The identity gauge is a dimension function.

- The square gauge is a dimension function.

- A positive constant gauge violates the zero-limit convention.

- The zero function violates positive-radius positivity.

*Needs:* Mathlib `MeasureTheory.Measure.mkMetric`.

Prove IsDimensionGauge.zero. A dimension gauge vanishes at zero.
([BeresnevichVelani](#references) §2.1, printed p.974.)

*Needs:* §3.8 (gauges and disjoint expanded coverings).

Prove IsDimensionGauge.positive. Every positive radius has positive gauge value.
([BeresnevichVelani](#references) §2.1, printed p.974.)

*Needs:* §3.8 (gauges and disjoint expanded coverings).

Prove IsDimensionGauge.tendsto_zero. The gauge tends to zero as the radius tends to zero.
([BeresnevichVelani](#references) §2.1, printed p.974.)

*Needs:* §3.8 (gauges and disjoint expanded coverings).

**Radius versus diameter Hausdorff conventions**. For a dimension gauge f with f(r)/r^k monotone near zero,
compare the source’s ball-radius H^f to native diameter mkMetric(f). When f(r)/r^k tends to infinity,
f(2r)≤2^k f(r) near zero, so the two constructions have the same null sets and full/infinite-measure
conclusions on open balls. If the ratio has finite limit, treat zero or a constant multiple of k-dimensional
measure separately. No exact scalar normalization equality is asserted.
([BeresnevichVelani](#references) §2.1, Remark 3 and proof of Theorem 2, pp.974,977,979–980.)

Replace a radius cover by a diameter cover and conversely, tracking the factor two in scale. Apply native
mkMetric_mono_smul to compare gauges once a bounded doubling ratio is established. Handle the
zero/finite-ratio cases separately. Extend the gauge by the `extendedGauge` formula of §3.10.
All comparisons use sufficiently small finite diameters, so no continuity at infinity is required.

*Needs:* §3.8 (gauges and disjoint expanded coverings); Mathlib `MeasureTheory.Measure.mkMetric`; Mathlib
`MeasureTheory.Measure.mkMetric_apply`.

**Disjoint finite covering for mass transference**. Under Theorem 2’s expanded-ball full-measure hypothesis,
each positive-radius ball B and each index cutoff G admit a finite family of expanded balls of indices at
least G, disjoint and inside B, whose union has at least κ times the k-dimensional measure of B. Here κ>0
depends only on dimension and the fixed ball-volume comparison constants, not on B or G.
([BeresnevichVelani](#references) Lemma 5 and its proof, printed pp.978–979.)

Restrict sufficiently small expanded balls to half B and use the native 5r covering lemma. Use volume
doubling/comparison and continuity of the disjoint series to select a finite initial subfamily with at least
half the obtained mass. Use the expanded radius f(r)^(1/k) and the gauge comparison above.

*Needs:* §3.8 (gauges and disjoint expanded coverings).

### 3.9 Separated Cantor levels and their probability measure

Construct a nested family with several separated local sublevels. Gauge-proportional child masses extend to a native Borel probability; the small-ball estimate must have a constant independent of the parameter η.

Define MassTransferenceCantor. For k≥1, η>1, a bounded positive-radius root B₀, and the full expanded-ball
limsup hypothesis with f(r)/r^k→∞, construct finite labelled closed-ball levels K(n), finite local sublevels
K(n,B,i) and increasing source index cutoffs, with K(1)={B₀}. (P1) All triples3L of children of B are
disjoint, contained in B and contained in L^f. (P2) Expanded L^f are disjoint inside each sublevel and
contained in B. (P3) Each sublevel has Σ_L V^k(L^f)≥c₃V^k(B). (P4) Every next-sublevel M satisfies
f(r_M)≤f(r_L)/2 for every previous-sublevel L. (P5) l_B₀=floor(c₂η/(c₃H^k(B₀)))+1; for later B,
l_B=floor(f(r_B)/(c₃r_B^k))+1≥2. Here V^k(B)=r_B^k and c₁,c₂ are the source Hausdorff/volume comparison
constants, c₃=κc₁²/(2c₂²10^k). The compact intersection Kη lies in B₀∩limsup B_i.
([BeresnevichVelani](#references) §§5.1–5.2, printed pp.980–986.)

Its basic API consists of these facts.

- Every child triple is contained in its parent and child triples are pairwise disjoint.
- Increasing source cutoffs place every point of the compact intersection in infinitely many original balls.
- Expanded balls in each sublevel are disjoint and their volume sum has the stated uniform lower bound; successive sublevels halve gauge sizes.

One route uses Lemma 5 for the first sublevel and estimate volume of previously selected quadruple balls by a small
gauge/volume ratio. Apply the 5r lemma to the remaining half-parent region, then Lemma 5 after a larger cutoff
to enforce half-mass, triple separation and increasing source indices. Induct over the finite sublevels and
levels. The construction includes the finite parent maps, sublevel labels and radii as part of its data.

**Checks.**

- For root [0,1], children centred at 1/4 and 3/4 with radius 1/20 have disjoint triples [1/10,2/5] and [3/5,9/10]. A child centred at 19/20 with radius 1/10 is rejected: its triple reaches 5/4.

- A construction repeating a fixed finite collection of balls is rejected by the increasing-cutoff requirement.

- For f(r)=√r, consecutive sublevels with radii 1/16 and 1/64 give f-values 1/4 and 1/8 and satisfy P4 with equality. Repeating radius 1/16 would require the false inequality 1/4≤1/8. These test individual constraints on the construction.

*Needs:* §3.8 (gauges and disjoint expanded coverings).

Prove MassTransferenceCantor.nested. Every level lies inside its parent level.
([BeresnevichVelani](#references) §§5.1–5.2, printed pp.980–986.)

*Needs:* §3.9 (separated cantor levels and their probability measure).

Prove MassTransferenceCantor.limsup. Every point of Kη belongs to infinitely many original balls with
unbounded indices. ([BeresnevichVelani](#references) §§5.1–5.2, printed pp.980–986.)

*Needs:* §3.9 (separated cantor levels and their probability measure).

Prove MassTransferenceCantor.separated. Distinct child triples are disjoint; the stronger expanded-ball
disjointness holds within each sublevel. ([BeresnevichVelani](#references) §§5.1–5.2, printed
pp.980–986.)

*Needs:* §3.9 (separated cantor levels and their probability measure).

Define MassTransferenceMeasure. On the source Cantor levels attach weight 1 to B₀ and weight μ(L)=f(r_L)
`μ(B)/Σ_{M child of B}f(r_M)` to each child L of B. Extend these compatible finite masses to a Borel probability
supported on Kη. ([BeresnevichVelani](#references) §§5.3–5.5, printed pp.986–990.)

Its basic API has the following statements.

- The Borel probability gives the root ball mass 1 and is supported on the Cantor intersection.
- For each parent, the sum of child masses equals its mass; the positive sum of child gauge weights is the denominator.
- For every sufficiently small positive-radius ball A, its mass is at most Cₖf(r_A)/η, with Cₖ independent of η.

Normalize each finite child mass; positive denominator follows from (P3) and (P5). Prove the compact
nested-set extension theorem used in the source at [3, Proposition 1.7]. Apply that theorem to the disjoint
compatible finite distributions, and prove the resulting Borel probability is supported on their compact
intersection.

**Checks.**

- Every selected positive-radius ball has positive normalized mass.

- If a parent has exactly two children of equal gauge size, each receives half the parent mass.

- Exactly three children of equal gauge size each receive a third of the parent mass; for two children
  with gauge weights in ratio 1:3, their masses are respectively one quarter and three quarters of the parent mass.

- The constant C_k cannot grow with η; otherwise infinite Hausdorff measure does not follow.

*Needs:* §3.9 (separated cantor levels and their probability measure); Mathlib
`MeasureTheory.Measure.le_mkMetric`.

Prove MassTransferenceMeasure.root. The root mass is one. ([BeresnevichVelani](#references)
§§5.3–5.5, printed pp.986–990.)

*Needs:* §3.9 (separated cantor levels and their probability measure).

Prove MassTransferenceMeasure.children. The sum of finite child masses equals the parent mass.
([BeresnevichVelani](#references) §§5.3–5.5, printed pp.986–990.)

*Needs:* §3.9 (separated cantor levels and their probability measure).

Prove MassTransferenceMeasure.ball_bound. For A of radius below the construction cutoff, μ(A)≤C_k f(r_A)/η
with C_k independent of η and A. ([BeresnevichVelani](#references) §§5.3–5.5, printed pp.986–990.)

Apply the separate arbitrary-ball bound, retaining its dimension-only constant and construction-dependent
cutoff.

*Needs:* §3.9 (separated cantor levels and their probability measure).

**Bounds on selected level-ball masses**. For every selected level ball L below the root, μ(L)≤f(r_L)/η. Use
exactly the root and nonroot floor-plus-one sublevel counts from the Cantor construction; the comparison
H^k(B)≤c₂r_B^k is retained. ([BeresnevichVelani](#references) §5.4, printed p.987.)

At the root each sublevel has f-mass at least c₃r_B₀^k≥(c₃/c₂)H^k(B₀), so the prescribed root count makes the
denominator at least η. At a later parent the denominator is at least c₃l_Br_B^k≥f(r_B); substitute the
inductive parent bound into the exact child-mass recursion.

*Needs:* §3.9 (separated cantor levels and their probability measure).

**Ball intersection geometry**. For closed Euclidean balls A,M and c≥3, if A meets M and A has a point outside
the concentric c-fold dilate of M, then r_M≤r_A and cM is contained in the concentric 5-fold dilate of A. In
the proof the final triangle inequality is non-strict; the point outside cM makes the first inequality strict.
([BeresnevichVelani](#references) Lemma 7, printed p.988, with corrected proof inequality.)

Combine center distances from a point in A∩M with the distance of the point of A outside cM to get
(c−1)r_M<2r_A. For y∈cM, d(y,center A)≤r_A+(c+1)r_M≤5r_A by the sharper preceding inequality when c≥3.

*Needs:* §3.9 (separated cantor levels and their probability measure).

**Arbitrary small-ball mass bound**. There are constants C_k>0 and r₀>0, where C_k depends only on the
dimension and covering constants and r₀ may depend on the construction, such that every ball A with 0<r_A<r₀
satisfies μ(A)≤C_k f(r_A)/η for the Cantor probability. C_k is independent of η.
([BeresnevichVelani](#references) §5.5, printed pp.988–990.)

One route uses the deepest parent for which A meets at least two children; all its relevant children have radius at most
r_A by triple separation and Lemma 7. For sublevels with a single hit, use their f-mass halving property to
sum a geometric series bounded by 2f(r_A). For multiple-hit sublevels, expanded disjointness inside 5A gives
the bound (5^k c₂/(c₁η)) r_A^k l_B. Use l_B≤2 f(r_B)/(c₃ r_B^k), r_A<r_B and monotonic f(r)/r^k to obtain at
most (2·5^k c₂/(c₁c₃η)) f(r_A). The normalization denominator is at least (c₃/c₂) l_B H^k(B), by (P3) and (8).
Keep every covering constant.

*Needs:* §3.9 (separated cantor levels and their probability measure).

### 3.10 Mass transference and Hausdorff consequences

The general Euclidean transference theorem yields the line power-gauge case, Jarník–Besicovitch and Hausdorff Duffin–Schaeffer. A convergence exponent describes the reduced limsup dimension.

Define `extendedGauge` by extending f:ℝ≥0→ℝ≥0 to ENNReal: its value at finite r is f(r), and its value at ∞ is ∞. Native Measure.mkMetric applies this gauge to diameters. The API preserves every finite value, the zero value for dimension gauges and equality of gauges at finite arguments; the value at ∞ does not affect the small-scale Hausdorff construction. (Mathlib, MeasureTheory/Measure/Hausdorff.lean, Measure.mkMetric; [BeresnevichVelani](#references), §2.1, printed p.974.)

Its basic API has the following statements.

- At every finite ENNReal argument, the extension equals the cast of f.
- For a dimension gauge the value at 0 is 0 and the value at ∞ is ∞.
- Gauges agreeing at all finite arguments induce the same small-scale metric measure.

**Checks.**

- For f(r)=r², the extended value at 1/2 is 1/4, whereas at ∞ it is ∞; an extension by zero at ∞ would lose the chosen convention.
- For f(r)=√r, the extended value at 1/4 is 1/2, retaining the finite radius.
- For f(r)=r, the extended value at 0 is 0. Finite diameter 2r receives 2r, not r; for f(r)=r² and r=1/4 the diameter gauge gives 1/4 rather than the radius gauge's 1/16.
- The bounded dimension gauge f(r)=r/(1+r) has f(1)=1/2 and f(2)=2/3, with f(r)→1 as r→∞, whereas its extended value at ∞ is ∞. For k=1 its ratio f(r)/r=1/(1+r) is antitone on positive radii; requiring continuity at infinity would wrongly exclude this admissible gauge.

Define `GaugeRatioMonotone` for k and f to mean that some R>0 makes f(r)/r^k monotone or antitone on 0<r≤R. Only the behavior near zero enters Hausdorff measure; this is the local form of the source's ratio hypothesis. Its API restricts the cutoff R, admits either direction and ignores the totalized quotient at r=0. ([BeresnevichVelani](#references), Theorem 2 and Remark 3, printed p.977.)

Its basic API has the following statements.

- If the ratio is monotone or antitone on (0,R], the same direction holds on every (0,R′] with 0<R′≤R.
- Either direction of monotonicity supplies the predicate; no value of the ratio at 0 is constrained.
- Multiplication of the gauge by a positive scalar preserves the predicate.

**Checks.**

- For k=2 and f(r)=r² the ratio is 1 on positive radii; both directions hold and the expanded radius is r.
- For k=1 and f(r)=√r, the ratio at 1/16 is 4 and at 1/4 is 2: it is antitone.
- For k=1 and f(r)=r², the same ratios are 1/16 and 1/4: it is monotone. Rejecting this direction would incorrectly exclude the zero-Hausdorff-measure case.

*Needs:* §3.8 dimension gauges and native Measure.mkMetric.

Prove `mass_transference` (the mass transference principle). BV Theorem 2: for k≥1, closed balls B_i⊂ℝ^k of positive radii tending to zero, a dimension
function f with GaugeRatioMonotone k f, and expanded balls B_i^f of radius f(r_i)^(1/k), assume limsup B_i^f has
full Lebesgue measure in every ball. Then H^f(B∩limsup B_i)=H^f(B) for every ball B. Use native mkMetric
through the explicit normalization comparison; no claim about a general metric space without §6.1’s local
compactness/doubling hypotheses. ([BeresnevichVelani](#references) Theorem 2 and §5, printed
pp.977–990.)

If f(r)/r^k has finite zero/positive limit, use the comparison of Hausdorff measures and the
covering/full-measure argument. For the infinite ratio, apply the Cantor construction and arbitrary-ball
bound, then native mass distribution to get H^f≥cη for all η. More precisely, for the Cantor
probability μ with μ(A)≤Cₖf(r_A)/η, apply `MeasureTheory.Measure.le_mkMetric` to the measure
(η/Cₖ)μ and `extendedGauge f`. A nonempty set of sufficiently small positive diameter d lies in a
closed ball of radius d about any of its points, so its scaled mass is at most f(d). Empty sets have
mass zero; diameter-zero sets have mass zero by the small-ball bound and f(r)→0. Since μ(Kη)=1,
this yields H^f(Kη)≥η/Cₖ, with Cₖ>0 independent of η.

**Checks.**

- For k=1, f(r)=r^s, 0<s<1 and 0<r<1, the expanded radius r^s is larger than r; reversing the two limsups would be wrong.
- For k=2 and f(r)=r² the expanded radius is √(r²)=r for r>0, giving the identity implication.
- Dimension k=0 is excluded before forming the reciprocal exponent 1/k.
- For the non-power gauge f(r)=r+r², diameter 1/2 has gauge value 3/4; the radius 1/4 has value 5/16. The small-set comparison uses the diameter value.
- If η=8 and Cₖ=2, the scaled measure is 4μ and the lower bound is H^f(Kη)≥4. Using the inverse scaling would instead give 1/4.
- A singleton has diameter 0 and mass 0 under the small-ball bound as f(r)→0; a Dirac probability fails that bound because its small centered balls have mass 1.

*Needs:* §3.8 (gauges and disjoint expanded coverings); §3.9 (separated cantor levels and their probability
measure); Mathlib `MeasureTheory.Measure.le_mkMetric`.

The power-gauge Checks include admissibility of f(r)=r^s for s>0, expansion r<r^s when 0<r<1 and s<1, and the identity r^1=r.

Prove `mass_transference_power`. For 0<s<1, centers c_i∈ℝ, positive radii r_i→0, and E=limsup
closedBall(c_i,r_i), assume every nonempty open ball meets limsup closedBall(c_i,r_i^s) in full Lebesgue
measure. Then every positive-radius ball meets E in infinite native s-dimensional Hausdorff measure.
([BeresnevichVelani](#references) Theorem 2 specialized to k=1, f(r)=r^s.)

Apply the general mass transference principle with the power dimension function; its ratio r^(s−1) tends to
infinity. Use the radius/diameter normalization bridge; it changes finite factors and preserves infinity.

**Checks.**

- For k=1, f(r)=r^s, 0<s<1 and 0<r<1, the expanded radius r^s is larger than r; reversing the two limsups would be wrong.
- For k=2 and f(r)=r² the expanded radius is √(r²)=r for r>0, giving the identity implication.
- Dimension k=0 is excluded before forming the reciprocal exponent 1/k.

*Needs:* §3.10 (mass transference and hausdorff consequences); Mathlib `MeasureTheory.Measure.hausdorffMeasure`.

Define `powerApproximationSet` at v as the set of x∈[0,1] such that for unbounded positive q there is a∈ℤ with gcd(|a|,q)=1 and |x−a/q|<q^(−v). Its API identifies the strict reduced-rational limsup, retains the unit-interval bound and decreases the set as v increases above zero. ([BeresnevichVelani](#references), §3.2, printed pp.977–978.)

Its basic API has the following statements.

- Every member lies in [0,1] and admits reduced numerators at unbounded positive denominators.
- For v≤w, the set at exponent w is contained in the set at exponent v, since q≥1.
- Changing finitely many denominator neighborhoods leaves the limsup unchanged.

**Checks.**

- For v=3, x=1/2, q=2, a=1 gives error 0<1/8. The equivalent fraction 2/4 is rejected since gcd(2,4)=2.
- At q=3 and v=3 the radius is 1/27, rather than 1/9; q=0 is excluded before forming approximation radii.
- For x=0, v=3 and q≥2, every nonzero a has |a/q|≥1/q>q^(−3), while a=0 is not reduced. Thus 0 is outside this limsup despite its exact unrestricted rational approximations.

*Needs:* §3.1 approximation sets; native integer coprimality and real powers.

Prove `jarnik_besicovitch` (the Jarník–Besicovitch dimension theorem). For v>2, let W_v consist of x∈[0,1] with |x−a/q|<q^(−v) for
infinitely many coprime integers a and positive q. Then native dimH(W_v)=2/v and its critical (2/v)-Hausdorff
measure is infinite. At v=3, the dimension and critical exponent are 2/3 and the critical measure is infinite. The source writes ψ(q)=q^(−τ), τ=v−1, so the exponent is 2/(1+τ), not 2/(2+τ).
([BeresnevichVelani](#references) §3.2, printed pp.977–978.)

One route uses Dirichlet’s theorem for the expanded radius q^(−2), and the critical power mass-transference statement for
the lower bound and infinity. For s>2/v the rational-ball cover has summable q·q^(−vs) cost, giving zero
Hausdorff measure and the upper dimension bound. Compare strict and closed approximation radii by
constant-radius sandwiches before applying native Hausdorff dimension.

*Needs:* §3.10 (mass transference and hausdorff consequences); §3.1 (reduced and unrestricted approximation sets);
Mathlib `MeasureTheory.Measure.hausdorffMeasure`.

Prove `hausdorff_duffin_schaeffer` (Hausdorff Duffin–Schaeffer). For the one-dimensional reduced approximation limsup and dimension
function f with GaugeRatioMonotone 1 f, convergence of Σ_q φ(q) f(ψ(q)/q) gives zero H^f-measure; divergence gives
H^f equal to that of [0,1]. No monotonicity of ψ is imposed. The divergence follows by the Lebesgue
Duffin–Schaeffer theorem for θ(q)=q f(ψ(q)/q), followed by mass transference.
([BeresnevichVelani](#references) Theorem 1 and §3.1, printed pp.973,977.)

Treat nonshrinking radii separately, enumerate reduced rational balls without retaining zero-radius empty
approximants, and use the series transformation for θ. Apply the Lebesgue theorem and MTP locally. A direct
covering/tsum argument supplies the convergence half.

*Needs:* §3.10 (mass transference and hausdorff consequences); §3.2 (duffin–schaeffer, catlin and khinchin).

Prove `duffin_schaeffer_dimension`. KM Corollary3: for 0≤ψ(q)≤1/2, let A be the closed reduced-rational
limsup. Put `s=inf{b≥0:Σ_{q≥1}φ(q)(ψ(q)/q)^b converges}`, with inf(empty)=∞. Then native dimH(A)=min(s,1). The
bound ψ≤1/2 belongs to this exact source statement. ([KM-2020](#references) Published Corollary 3, printed
p.255.)

For any b>s the direct rational cover has summable b-gauge cost and hence zero Hausdorff measure. For
0<b<min(s,1) the Hausdorff Duffin–Schaeffer divergence theorem gives infinite b-measure. Supremum/infimum
comparisons in native dimH yield equality, with the ambient line bound.

*Needs:* §3.10 (mass transference and hausdorff consequences); §3.1 (reduced and unrestricted approximation sets);
Mathlib `dimH`; Mathlib `dimH_empty`; Mathlib `dimH_mono`; Mathlib `Real.dimH_univ`.

### 3.11 Simultaneous coordinatewise reduced approximation

In higher dimension every coordinate numerator is coprime to the common denominator. This hypothesis is stronger than joint primitivity of the whole vector.

Define `coordinatewiseReducedLimsup` for k and nonnegative real ψ on the native finite product Fin k→ℝ. Require every coordinate in [0,1] and unbounded positive denominators q with a numerator tuple a∈ℤ^k, gcd(|a_i|,q)=1 separately for each i, and |x_i−a_i/q|<ψ(q)/q. The API gives the unit-cube inclusion, coordinatewise reduction and monotonicity in ψ. (PollingtonVaughan1990, pp.190–200.)

Its basic API has the following statements.

- Every member lies in the closed unit cube.
- Every numerator coordinate is coprime to the common positive denominator.
- Pointwise increase of ψ enlarges the limsup.

**Checks.**

- At k=2 and ψ=0, the strict inequality 0<0 is impossible at every denominator, so the limsup is empty and its volume is zero.
- For k=2, q=2 and ψ(2)=1/4, the single reduced centre (1/2,1/2) gives the square (3/8,5/8)² of volume 1/16. This tests the finite-denominator neighborhoods, not membership in the limsup from a single denominator.
- At q=2, (1/2,0) with numerator (1,0) fails coordinatewise reduction since gcd(0,2)=2, although gcd(1,0,2)=1; with ψ(2)=1/4 it is outside that denominator's square.

*Needs:* finite product Lebesgue measure; native integer coprimality; §3.1 approximation sets.

Prove `simultaneous_duffin_schaeffer` (higher-dimensional Duffin–Schaeffer). For k≥2 and ψ:ℕ→[0,∞), let S_k(ψ) consist of x∈[0,1]^k such
that for infinitely many q≥1 there are a_i∈ℤ with gcd(a_i,q)=1 separately for every coordinate and
max_i|x_i−a_i/q|<ψ(q)/q. Its Lebesgue measure is zero if Σ_q(φ(q)ψ(q)/q)^k converges and one if the sum
diverges. The coordinatewise coprimality is stronger than gcd(a₁,…,a_k,q)=1.
(PollingtonVaughan1990, divergence theorem and proof, pp.190–200; [BeresnevichVelani](#references), introduction pp.971–972 records the attribution.)

Prove coordinatewise_reduced_overlap: fix k≥2 and 0≤ψ(q)≤1/2, and let A_q be the k-fold product of the one-dimensional coordinatewise-reduced rational neighborhoods. If Σ_q(φ(q)ψ(q)/q)^k diverges, there is C_k>0 such that for each Q₀≥1 there are arbitrarily large Q≥Q₀ with
`Σ_{Q₀≤q,r≤Q} volume(A_q∩A_r) ≤ C_k(Σ_{Q₀≤q≤Q}volume(A_q))²`.
Both coordinates in each overlap are separately reduced. Products give volume(A_q∩A_r)=volume(𝒜_q∩𝒜_r)^k. The arithmetic summation of these k-th powers is a distinct target; the one-dimensional generic second-moment bound does not supply it. Use PollingtonVaughan1990, pp.190–200, divergence proof, as the primary locator; no unstated intermediate lemma number is assumed.

Prove coordinatewise_reduced_zero_one: for k≥2 and arbitrary nonnegative ψ, the coordinatewise-reduced limsup in [0,1]^k has volume zero or one. Combine the coordinatewise scaling invariance and density argument with the preceding overlap estimate to turn a positive limsup measure into full measure. For arbitrary ψ remove the ≤1/2 restriction by the source’s large-radius reduction before applying the overlap contract. (PollingtonVaughan1990, pp.190–200, zero–one step in the divergence proof.)

The convergence direction is direct covering and Borel–Cantelli. For divergence use the overlap target on every tail and the second-moment inequality to get positive measure, then the zero–one target. Compare the finite coordinatewise reduced sets with product cube volume, keeping boundary nullity. This roadmap owns both arithmetic and zero–one prerequisites.

**Checks.**

- For ψ=0 the divergence hypothesis fails and rational points do not give full measure

- At q=2 and k=2 each coordinate has the single reduced center 1/2

- The vector (1/2,0) is jointly primitive at denominator 2 but its second numerator is not coprime to 2 and it is excluded by the coordinatewise convention.

*Needs:* §3.3 one-dimensional overlaps and native second moments; product volume and Borel–Cantelli; coordinatewise_reduced_overlap and coordinatewise_reduced_zero_one.

### Examples

With ψ(q)=1/2, the reduced q=1 set is [1/2,1], while the unrestricted q=1 set is [0,1].
At q=2 only numerator 1 is reduced, giving [1/4,3/4]. Thus removing reducedness or silently
adding numerator zero changes individual approximation sets. Closed endpoints do not make
them equal to the native strict circle sets; the limsup comparison in §3.1 uses its own
irrationality and radius conditions.

For a graph with V=W={2}, one edge and unit weights, the edge density is one. Recording
p=2 with equal exponents one gives quality 4(1−2^(−31/30))^(−10). Recording
unequal exponents one and zero fails the exact-gcd condition on this edge. With no edges,
quality is zero by the guarded normalization. Multiplying the common weight function μ
by c>0 leaves density fixed and multiplies quality by c². These calculations distinguish
edge density, vertex mass and prime bookkeeping.

For a power gauge f(r)=r^s with 0<s<1, f(r)/r→∞ as r↓0, and an interval of positive length
has infinite s-dimensional Hausdorff measure. Taking s=1 gives finite length and cannot
satisfy that infinite-measure conclusion. In the approximation |x−a/q|≤q^(−v), v>2,
Jarník–Besicovitch gives dimension 2/v; v=3 therefore gives 2/3. This exponent refers to
the actual approximation radius, not to q times that radius.

The Cantor construction needs both nesting and sibling separation: two children with
identical closed balls cannot be two disjoint atoms of positive prescribed mass. The
root's mass is one, and at each parent the normalized child weights sum to its mass.
A compatible finite-level assignment alone is not yet a Borel measure; the extension
and support statements in §3.9 provide that step.

### Dependencies

Layer 0 contributes finite second moments. Use native Borel–Cantelli, approximation zero–one,
metric balls, Borel measures and Hausdorff constructions. AnalyticNumberTheoryPartI §§0.19, 0.21 supplies the Mertens and
prime-block products used by the GCD-graph iteration. The overlap and large-values inputs
are the precise arithmetic inequalities of §3.3. General-gauge mass distribution and the
compatible-tree Borel extension are the targets stated in §§3.8–3.9; native power-gauge
Hausdorff estimates alone do not supply their full generality.

## Layer 4: Pointwise ergodic theory and continued fractions

### 4.1 Pointwise averages, truncated limsups and first hits

The aim is native invariant conditional expectation for every L1 real observable. Start the proof with finite real truncations of a possibly infinite limsup and least positive threshold-crossing lengths.

Prove `birkhoff_pointwise`. For a measure-preserving map T of a probability space and integrable f:Ω→ℝ, native
birkhoffAverage ℝ T f N converges almost everywhere to the native conditional expectation of f on
MeasurableSpace.invariants T. This is pointwise convergence of a representative, not just mean/L1 convergence.
([Sarig2023](#references) Theorems 2.2–2.3 and their complete proof, physical pp.45–49.)

For nonnegative f, the coloring/truncated-limsup estimate and the complementary liminf estimate force equality
of limsup and liminf almost everywhere. The limit is invariant and integrable; its integrals over every
invariant measurable set equal those of f, identifying native conditional expectation. Split signed f into
positive/negative parts. The coloring and identification nodes below are direct prerequisites; no existing
mean-ergodic result is claimed as the pointwise proof.

*Needs:* Mathlib `birkhoffAverage`; Mathlib `MeasurableSpace.invariants`; §4.1 (pointwise averages, truncated
limsups and first hits); §4.2 (finite coloring and signed convergence); §4.3 (the canonical limit and
conditional expectation).

**Coloring estimate for Birkhoff limsup**. For a nonnegative integrable real observable on a
probability-preserving system, for M≥0 the integrable real truncation g_M of the nonnegative extended-real
limsup, namely min(limsup_N A_N f,M) has integral at most ∫f. Apply the statement with its source measurable
invariant limsup representative; positive limsup may be infinite before this bound.
([Sarig2023](#references) Theorem 2.2 proof, physical pp.45–47.)

For ε>0 choose finite orbit blocks with average above g_M−ε on a set whose measure tends to one as the
permitted block length grows. Color disjoint blocks along a long orbit; boundary and bad-set contributions are
bounded by M times their frequency. Integrate using preservation. First let the long orbit length tend to
infinity, then remove the bad set and ε. Use upperOrbitTruncation, firstOrbitHit and greedyOrbitBlocks with
their measurable and finite-partition APIs below.

*Needs:* Mathlib `birkhoffAverage`; §4.2 (finite coloring and signed convergence).

**Invariant limit and conditional expectation**. If the almost-everywhere Birkhoff limit g of an integrable f
is integrable and invariant, the coloring/liminf argument gives ∫_A g=∫_A f for every native invariant
measurable set A; hence g equals native condExp(invariants T,μ,f) almost everywhere.
([Sarig2023](#references) Theorem 2.3, physical pp.48–49.)

Restrict the probability-preserving system to an invariant set, normalizing when its mass is positive;
zero-mass sets are immediate. Use the signed coloring argument to identify the restricted integrals and the
native uniqueness criterion for conditional expectation. Prove equality with native conditional expectation by
its invariant-set integral characterization, including the restriction and completion comparisons.

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits); Mathlib `MeasurableSpace.invariants`; §4.3
(the canonical limit and conditional expectation).

Prove `birkhoff_pointwise_ergodic`. For native Ergodic T μ on a probability space and integrable real f, A_N
f(x)→∫f dμ for μ-almost every x. ([Sarig2023](#references) Theorem 2.2, ergodic conclusion, physical
pp.45–47.)

Identify the pointwise limit as conditional expectation on the invariant sigma-algebra. Ergodicity makes this
invariant function almost surely constant; its integral is the integral of f.

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits); Mathlib `Ergodic`.

Define upperOrbitTruncation. For arbitrary T:Ω→Ω, real f, L≥0 and x, define U_L(T,f,x) as the real value of
min(limsup over n of ENNReal.ofReal(A_(n+1)f(x)), ENNReal.ofReal L). A_n is native birkhoffAverage real T f n.
The minimum is finite even before any integrability assertion. ([Sarig2023](#references) Theorem 2.2,
physical pp.45–48, finite coloring proof.)

Its basic API consists of these facts.

- For L≥0 the total real value lies between 0 and L.
- It is measurable when T and f are measurable.
- If f≥0 pointwise, the truncation is strictly invariant under T.

Take the extended-nonnegative limsup along positive averaging lengths, truncate in ENNReal, then take its real
value.

**Checks.**

- For f=0 and L≥0, U_L=0.

- For f=constant c≥0, U_L=constant min(c,L); in particular c=3,L=2 gives 2.

- For Ω=natural, T(k)=k+1, f(k)=k and L≥0, U_L(0)=L, although the untruncated limsup is infinite.

*Needs:* Mathlib `birkhoffAverage`.

Prove upperOrbitTruncation_bounds. For L≥0 and all T,f,x, 0≤U_L(T,f,x)≤L. ([Sarig2023](#references)
Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits).

Prove upperOrbitTruncation_measurable. For measurable T and measurable real f, U_L(T,f,·) is measurable for
every L≥0. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Every finite orbit average is measurable by finite sums and measurable iterates. Write the limsup as the
countable infimum of countable suprema, then compose with minimum and ENNReal.toReal on its bounded range.

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits); Mathlib `birkhoffAverage`.

Prove upperOrbitTruncation_comp. If f≥0 pointwise, then U_L(T,f,Tx)=U_L(T,f,x) for all x and L≥0.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

One route uses A_(n+1)f(x)=f(x)/(n+1)+n/(n+1) A_n f(Tx). For nonnegative averages and finite f(x), the extended limsup is
unchanged by the vanishing additive term and factor tending to one; handle infinite limsup by arbitrary finite
lower thresholds. Apply finite truncation.

**Checks.**

- The assertion is strict pointwise invariance; no almost-everywhere replacement is passed to
  MeasurableSpace.invariants.

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits).

Define firstOrbitHit. For an endomap T:Ω→Ω and real-valued f,c:Ω→real, define τ(T,f,c,x) as the least
positive natural n with A_n f(x)>c(x), and 0 if no such n exists. It depends on no measure.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Its basic API consists of these facts.

- The sentinel is positive exactly when some positive averaging length crosses the threshold strictly.
- At a positive sentinel value the corresponding average is strictly above the threshold.
- For measurable T,f,c, the natural-valued sentinel is measurable.

*Needs:* the well-ordering of positive natural lengths when the crossing set is nonempty and the zero sentinel
otherwise.

**Checks.**

- For f=constant 2 and c=constant 1, τ=1.

- For f=constant 2 and c=constant 2, τ=0; strict inequality matters.

- On Bool with T negation, f(false)=0,f(true)=4,c=constant 1, τ(false)=2 and τ(true)=1.

*Needs:* Mathlib `birkhoffAverage`.

Prove firstOrbitHit_pos_iff. τ(T,f,c,x)>0 iff ∃n≥1, A_n f(x)>c(x). ([Sarig2023](#references) Theorem 2.2,
physical pp.45–48, finite coloring proof.)

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits).

Prove firstOrbitHit_average. If τ(T,f,c,x)>0, A_τ(x) f(x)>c(x). ([Sarig2023](#references) Theorem 2.2,
physical pp.45–48, finite coloring proof.)

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits).

Prove firstOrbitHit_measurable. For measurable T,f,c, τ(T,f,c,·) is measurable. ([Sarig2023](#references)
Theorem 2.2, physical pp.45–48, finite coloring proof.)

For n≥1, {τ=n} is {A_n>c} minus the finite union of earlier crossing sets. The zero fiber is the complement of
the countable union of crossing sets; use the countable discrete Borel structure of natural numbers.

*Needs:* §4.1 (pointwise averages, truncated limsups and first hits); Mathlib `birkhoffAverage`.

### 4.2 Finite coloring and signed convergence

A finite greedy partition into good blocks, bad singletons and a short tail supplies the upper and lower integral bounds. Conull transport and positive/negative parts extend the result to integrable real functions.

Define greedyOrbitBlocks as the unique finite ordered list of colored consecutive intervals in [0,N), for σ:ℕ→ℕ and integers N≥0, M≥1, satisfying these endpoint rules. The first interval starts at 0; adjacent intervals share an endpoint. At a start k<N, a blue interval has length σ(k) when 1≤σ(k)≤M and k+σ(k)≤N; a red interval has length 1 when σ(k)=0 or σ(k)>M. The terminal endpoint is N or a k<N with 1≤σ(k)≤M and N<k+σ(k). Existence, uniqueness, the partition of the covered initial segment, and the bound N−k<M are finite combinatorial targets. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Its basic API has the following statements.

- The intervals form a consecutive disjoint partition of a unique initial segment [0,k), with k≤N.
- Each blue interval has its prescribed positive length at most M; each red interval is a singleton.
- The uncovered terminal interval has length less than M, including N=0.

Existence follows by induction on the number of remaining indices, since each interval has positive length. The endpoint rules force uniqueness and allow a terminal interval only when the next prescribed blue interval would exceed N.

**Checks.**

- N=0 gives the empty list for every σ and M≥1.

- σ=constant 1,M=1,N=3 gives [(0,1,true),(1,1,true),(2,1,true)].

- σ=constant 2,M=2,N=5 gives [(0,2,true),(2,2,true)], with a single uncovered terminal point.

- σ=constant 0,M=2,N=3 gives three red singletons, not a zero-length blue loop.

Prove greedyOrbitBlocks_partition. The greedy list covers exactly an initial natural interval [0,k), has
pairwise disjoint consecutive block intervals, and the sum of block lengths is k≤N.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.2 (finite coloring and signed convergence).

Prove greedyOrbitBlocks_blue. Every blue block has length σ(start) with 1≤σ(start)≤M and start+length≤N.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.2 (finite coloring and signed convergence).

Prove greedyOrbitBlocks_red. Every red block has length 1 and σ(start)=0 or σ(start)>M.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.2 (finite coloring and signed convergence).

Prove greedyOrbitBlocks_tail. For M≥1, the uncovered terminal interval after greedy coloring has length
strictly less than M. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.2 (finite coloring and signed convergence).

**Finite lower bound from blue blocks**. Let f≥0 pointwise, g≥0 with g(Tx)=g(x), ε>0, σ(k)=τ(T,f,g−ε,T^k x)>0
for every k, and N≥M≥1. Then Σ_(k<N) [f(T^k `x)+g(x)·1_{σ(k)>M}]` ≥ (N−M)(g(x)−ε). ([Sarig2023](#references)
Theorem 2.2, physical pp.45–48, finite coloring proof.)

If g(x)<ε the right side is nonpositive and the left side is nonnegative. Otherwise sum the strict average
lower bound on each blue block; invariance fixes its threshold at g(x). Each red singleton is bad and
contributes g(x) through the additional term. Ignore the nonnegative terminal sum; at least N−M points are
covered.

*Needs:* §4.2 (finite coloring and signed convergence); §4.1 (pointwise averages, truncated limsups and first
hits).

**Integrated upper-limsup coloring inequality**. On a probability space, let T be measure preserving, f
measurable, nonnegative and integrable, L≥0, ε>0, and τ=τ(T,f,U_L−ε). For N≥M≥1, ∫f ≥ `∫_{τ≤M}` U_L − ε − ML/N.
Here τ>0 everywhere because a limsup strictly exceeds U_L−ε. ([Sarig2023](#references) Theorem 2.2,
physical pp.45–48, finite coloring proof.)

The limsup characterization gives a positive crossing at every point. Integrate the finite inequality; every
iterate has the same f integral, and U_L is strictly invariant. Rearrange the bad-set term and bound its
boundary loss by ML/N.

**Checks.**

- The finite bound remains valid for L=0; take N→∞ before M→∞.

*Needs:* §4.2 (finite coloring and signed convergence); §4.1 (pointwise averages, truncated limsups and first
hits); Mathlib `MeasureTheory.integral_map`.

**Removal of the bad-set and coloring boundary**. With the preceding hypotheses, ∫ U_L dμ ≤ ∫ f dμ for every
L≥0. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

For fixed M,ε let N→∞ in the integrated inequality. Since τ is finite and positive everywhere, `1_{τ≤M}` U_L
tends to U_L and is dominated by L; apply dominated convergence as M→∞. Let ε↓0. This supplies the
birkhoff-coloring declaration without declaring it again.

*Needs:* §4.2 (finite coloring and signed convergence); §4.1 (pointwise averages, truncated limsups and first
hits); Mathlib `MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Finite integrable lower orbit limit**. For measurable nonnegative integrable f on a probability-preserving
system, the extended liminf of A_(n+1)f is finite almost everywhere, and its finite real representative ℓ is
integrable with ∫ℓ≤∫f. Take ℓ=0 on the infinite exceptional set. ([Sarig2023](#references) Theorem 2.2,
physical pp.45–48, finite coloring proof.)

Apply the nonnegative Fatou inequality to positive-length orbit averages. Every average has integral ∫f by
measure preservation. Finite total extended integral implies the liminf is finite almost everywhere; take its
real value and set zero on the invariant infinite set.

**Checks.**

- Do not take ENNReal.toReal of an infinite liminf and silently use its default zero as evidence of finiteness.

*Needs:* Mathlib `MeasureTheory.lintegral_liminf_le`; Mathlib `MeasureTheory.integral_map`; Mathlib
`birkhoffAverage`.

**Finite upper bound for truncated blue sums**. Let f≥0, ℓ≥0 strictly invariant, ε>0 and θ(x)>0 satisfy
A_θ(x)f(x)<ℓ(x)+ε. Let f_M=min(f,M), M≥1. For the greedy list using σ(k)=θ(T^k x), Σ_(k<N) f_M(T^k `x)·1_{θ(T^k`
x)≤M} ≤ N(ℓ(x)+ε)+M². ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Red starts are bad and contribute zero to the left side. Inside blue blocks dropping bad nonnegative terms and
replacing f_M by f bounds the sum by length times ℓ+ε. The terminal interval has fewer than M terms each
bounded by M; bound it by M².

*Needs:* §4.2 (finite coloring and signed convergence).

**Integrated lower-limsup coloring inequality**. For measurable nonnegative integrable f and
probability-preserving T, let ℓ be the finite real liminf representative and θ the first positive length with
A_θ f<ℓ+ε on its conull finite-liminf invariant set. Then ∫f≤∫ℓ+ε, hence ∫f≤∫ℓ after ε↓0.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Set θ=firstOrbitHit(T,−f,−ℓ−ε); it is positive on the invariant conull finite-liminf set. Integrate the finite
inequality; fixed M, N→∞ removes M²/N. As M→∞, `min(f,M)1_{θ≤M}→f` almost everywhere and is bounded by the
integrable f. The exceptional complement has measure zero and is ignored throughout.

*Needs:* §4.2 (finite coloring and signed convergence); §4.1 (pointwise averages, truncated limsups and first
hits); Mathlib `MeasureTheory.integral_map`; Mathlib
`MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Almost-everywhere convergence for nonnegative observables**. For a probability-preserving T and nonnegative
measurable integrable real f, A_n f converges almost everywhere to an integrable real g, and ∫g=∫f.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Let L→∞ monotonically in the upper bound. This bounds the extended limsup integral by ∫f and proves it finite
almost everywhere. The complementary liminf integral is at least ∫f. Since liminf≤limsup, the nonnegative
difference has zero integral and is zero almost everywhere. Equality of finite liminf and limsup yields real
convergence and the common integral.

*Needs:* §4.2 (finite coloring and signed convergence); Mathlib `MeasureTheory.lintegral_iSup`.

**Conull transport of a measurable representative**. Let T be measure preserving and f,g real functions with
f=g almost everywhere. There is a T-forward-invariant conull set E on which f(T^n x)=g(T^n x) for all n, hence
all native averages agree. In particular an integrable f can be replaced by a measurable real representative
before pointwise coloring. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring
proof.)

Intersect the countably many pullbacks of the agreement conull set along T^n. Measure preservation keeps every
pullback conull; the intersection is forward invariant. Use the native measurable representative of the
integrable function.

**Checks.**

- Forward invariance alone is used for orbit transport; the strict invariant limit is constructed separately.

*Needs:* Mathlib `MeasureTheory.Measure.QuasiMeasurePreserving.ae`; Mathlib
`MeasureTheory.AEStronglyMeasurable.mk`.

**Almost-everywhere convergence for integrable real observables**. For probability-preserving T and integrable
real f, A_n f converges almost everywhere to an integrable real g with ∫g=∫f. ([Sarig2023](#references)
Theorem 2.2, physical pp.45–48, finite coloring proof.)

Take a measurable representative and its positive and negative parts, both integrable and nonnegative.
Intersect the two convergence sets and subtract their limits using linearity of native averages. Transport the
result back to the original f on the orbit-conull agreement set.

*Needs:* §4.2 (finite coloring and signed convergence); Mathlib `birkhoffAverage`.

### 4.3 The canonical limit and conditional expectation

Choose the unique real orbit limit, with a fixed zero default on divergent orbits. Bounded approximation gives L1 convergence, and invariant-set integrals identify the native conditional expectation.

Define orbitLimit. For T and real f, define orbitLimit(T,f,x) as the unique real limit of the sequence A_n
f(x) if such a limit exists, and zero otherwise. No measure or selected convergence proof is part of the data.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Its basic API consists of these facts.

- Convergence of the orbit averages to a real c forces the chosen value to equal c.
- For measurable T,f the totalized limit is measurable.
- For every T,f the totalized limit has the same value at x and Tx, including on divergent orbits.

*Needs:* uniqueness of a convergent real sequence to choose its limit, and use zero on the complement.

**Checks.**

- For constant real c, orbitLimit(T,c,x)=c.

- For Bool negation and f(false)=0,f(true)=4, orbitLimit is the constant 2.

- For natural successor T and f(k)=k, orbitLimit(T,f,0)=0; divergence does not define an extended-real limit as
  a real number.

*Needs:* Mathlib `birkhoffAverage`.

Prove orbitLimit_of_tendsto. If A_n f(x) tends to c∈real, orbitLimit(T,f,x)=c. ([Sarig2023](#references)
Theorem 2.2, physical pp.45–48, finite coloring proof.)

*Needs:* §4.3 (the canonical limit and conditional expectation).

Prove orbitLimit_measurable. For measurable T and measurable f:Ω→ℝ, orbitLimit(T,f,·) is measurable.
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

**Check.** For T=id on the Borel real line, a non-Borel set E gives f=1_E and orbitLimit=f. Thus measurable T alone does not suffice. For merely integrable f, use a measurable representative and the orbit-conull agreement set separately.

The real Cauchy criterion expresses the convergence set by countable unions/intersections of measurable
comparisons of orbit averages. On this measurable set, the pointwise limit is measurable; extend by zero.

*Needs:* §4.3 (the canonical limit and conditional expectation); Mathlib `birkhoffAverage`.

Prove orbitLimit_comp. For every T,f and x, orbitLimit(T,f,Tx)=orbitLimit(T,f,x).
([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

One route uses the finite-average recurrence to show real convergence at x iff convergence at Tx, with the same limit. On
the invariant nonconvergence set both values are zero.

*Needs:* §4.3 (the canonical limit and conditional expectation).

**Integral convergence for bounded observables**. For probability-preserving T and measurable real f bounded
in absolute value by C, ∫|A_n f−orbitLimit(T,f)|→0. ([Sarig2023](#references) Theorem 2.2, physical
pp.45–48, finite coloring proof.)

The averages and their limit are bounded by C. Apply dominated convergence with constant bound 2C to the
pointwise-convergent absolute differences.

*Needs:* §4.2 (finite coloring and signed convergence); §4.3 (the canonical limit and conditional expectation);
Mathlib `MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Integral convergence for every L1 observable**. For probability-preserving T and integrable real f, ∫|A_n
f−orbitLimit(T,f)|→0. ([Sarig2023](#references) Theorem 2.2, physical pp.45–48, finite coloring proof.)

Truncate a measurable representative to [−C,C]; its L1 distance to f tends to zero by dominated convergence.
The averaging operator contracts this distance because triangle inequality and preservation give
∫|A_n(f−f_C)|≤∫|f−f_C|. Fatou gives the same bound for the difference of limits. Combine these two bounds with
the bounded-observable convergence.

*Needs:* §4.3 (the canonical limit and conditional expectation); §4.2 (finite coloring and signed convergence);
Mathlib `MeasureTheory.integral_map`; Mathlib `MeasureTheory.lintegral_liminf_le`; Mathlib
`MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Equality of integrals on native invariant sets**. For integrable real f and probability-preserving T, every
s measurable for MeasurableSpace.invariants T satisfies ∫_s orbitLimit(T,f)=∫_s f.
([Sarig2023](#references) Theorem 2.3, physical pp.48–49.)

Strict invariance gives (T^n)⁻¹(s)=s. Thus ∫_s A_n f=∫_s f, by preservation applied to the indicator of f. L1
convergence controls the absolute difference of these restricted integrals. Let n→∞; this avoids a separate
renormalized restricted-probability argument.

*Needs:* §4.3 (the canonical limit and conditional expectation); Mathlib
`MeasurableSpace.measurableSet_invariants`; Mathlib `MeasureTheory.integral_map`.

**Identification with native invariant conditional expectation**. For probability-preserving T and integrable
real f, orbitLimit(T,f) equals μ-almost everywhere μ[f | MeasurableSpace.invariants T].
([Sarig2023](#references) Theorem 2.3, physical pp.48–49.)

For measurable f, the strictly invariant measurable orbitLimit is measurable for the native invariant
sigma-algebra, hence strongly measurable there because real is separable. Its integrability follows from the
signed limit; apply native conditional-expectation uniqueness using the invariant-set integral identities. For
arbitrary integrable f use a measurable representative and almost-everywhere congruence of native conditional
expectation and all orbit averages.

**Checks.**

- Finite probability measure supplies sigma finiteness for the trimmed invariant sigma-algebra.

*Needs:* §4.2 (finite coloring and signed convergence); §4.3 (the canonical limit and conditional expectation);
Mathlib `MeasurableSpace.measurable_invariants_dom`; Mathlib
`MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq`; Mathlib `MeasurableSpace.invariants`.

### 4.4 The Gauss map, measure, digits and invariance

The Gauss map is total, but its nonterminating metric theory lives on D. Inverse-branch change of variables and the density telescope prove invariance with all endpoint sets accounted for.

Define `gaussMap`. Define T:ℝ→ℝ by T(x)=Int.fract(x⁻¹), using native total inversion so T(0)=0. Its
measure-theoretic domain is [0,1]; all metric digit theorems exclude rationals, and T preserves irrational
points in (0,1). ([SarigTransfer](#references) §2.3 and Appendix A.2, physical pp.11,32.)

Its basic API consists of these facts.

- Its value at 0 is 0 under total inversion.
- Every real input maps into [0,1), and irrational points in (0,1) map to irrational points there.
- The total real map is Borel measurable.

One route uses the native floor/fractional-part operation rather than a second continued-fraction algorithm. Match the
inverse branches x↦1/(a+x) for integers a≥1 on the irrational domain; rational boundary values are handled
separately.

**Checks.**

- T(1/2)=0, showing rational termination.

- T(2/3)=1/2.

- The endpoint convention is T(0)=0.

*Needs:* Mathlib `GenContFract.of`.

Prove gaussMap_zero. T(0)=0. ([SarigTransfer](#references) §2.3 and Appendix A.2, physical pp.11,32.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussMap_range. Every real input maps into [0,1). ([SarigTransfer](#references) §2.3 and
Appendix A.2, physical pp.11,32.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussMap_measurable. The total Gauss map is Borel measurable. ([SarigTransfer](#references)
§2.3 and Appendix A.2, physical pp.11,32.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Define `gaussMeasure`. Use native μ_G=(volume restricted to (0,1]).withDensity(ofReal(1/((1+x)log 2))). It is
a Borel probability measure equivalent to the restricted Lebesgue measure; on its support the density lies
between 1/(2 log 2) and 1/log 2. Outside the support density values do not affect μ_G.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33, density with corrected upper bound.)

Its basic API consists of these facts.

- The total mass is 1.
- For 0≤a≤b≤1, the mass of (a,b] is (log(1+b)−log(1+a))/log 2.
- Its null sets agree with those of restricted Lebesgue measure on the unit interval.

Integrate the density explicitly by log(1+x); the mass of (0,1] is one. Use positive finite density on the
support to prove mutual absolute continuity. The erroneous printed upper bound 2 log 2 is not used.

**Checks.**

- μ_G((0,1])=1.

- μ_G((1/2,1])=log(4/3)/log 2, the frequency of digit 1.

- The totalized endpoint has no mass.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `MeasureTheory.ProbabilityMeasure`.

The upper-half interval Check is μ_G((1/2,1])=log(4/3)/log 2.

Prove `gaussMeasure_probability`: the displayed Gauss measure is a native probability measure, equivalently its total mass is one.  ([SarigTransfer](#references) Appendix
A.2, physical pp.32–33, density with corrected upper bound.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussMeasure_interval. For 0≤a≤b≤1, μ_G((a,b])=(log(1+b)−log(1+a))/log 2.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33, density with corrected upper bound.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussMeasure_equivalent. Gauss and restricted Lebesgue measure have the same null sets.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33, density with corrected upper bound.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Define `gaussDigit`. For real x define `a_{n+1}(x)=gaussDigit(x,n)=Nat.floor((T^[n]x)⁻¹)`, n indexed from zero.
On irrational x∈(0,1), all digits are positive and this agrees with the n-indexed native GenContFract.of x
partial denominator stream. At rational termination the observable is zero, without inventing an infinite
native continued fraction. ([SarigTransfer](#references) §2.3, physical p.11, corrected iterate/digit
index; native partial denominator bridge.)

Its basic API consists of these facts.

- Digit 0 is the natural floor of x⁻¹.
- Digit n at Tx equals digit n+1 at x.
- On irrational x∈(0,1), each digit is positive and agrees with the corresponding native partial denominator.

One route uses the single floor observable on native iterates. At n=0 it is the first fractional continued-fraction
digit. For irrational inputs the native computation stream is nonterminating and its next
inverse-fractional-part step matches T.

**Checks.**

- The first digit of 1/2 is 2.

- The next digit of 1/2 is zero under totalization.

- The digits of 2/3 start 1,2,0.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `GenContFract.of`.

Prove gaussDigit_zero. The first digit is floor(x⁻¹). ([SarigTransfer](#references) §2.3, physical
p.11, corrected iterate/digit index; native partial denominator bridge.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussDigit_shift. Digit n at T(x) equals digit n+1 at x. ([SarigTransfer](#references) §2.3,
physical p.11, corrected iterate/digit index; native partial denominator bridge.)

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove gaussDigit_native. On irrational x in (0,1), native partial denominator n is some real cast of
gaussDigit(x,n). ([SarigTransfer](#references) §2.3, physical p.11, corrected iterate/digit index;
native partial denominator bridge.)

Induct on n through native GenContFract.of and IntFractPair.stream, using irrational nontermination and
positivity of each inverse fractional part. Match the first fractional denominator to digit zero and the next
stream step to the iterate of the total Gauss map.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `GenContFract.of`; Mathlib `Irrational`.

**Gauss inverse branches and Jacobians**. For integer a≥1, v_a(x)=1/(a+x) maps (0,1) to its ath Gauss cylinder
and T(v_a(x))=x. The derivative needed for measure transport is a separate lemma.
([SarigTransfer](#references) §2.3 and Appendix A.2, physical pp.12,32.)

*Needs:* a< a+x<a+1 on (0,1), so floor(a+x)=a, and evaluate the total inverse/fractional-part formula.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

**Absolute Gauss inverse-branch derivative**. For a≥1 and x∈[0,1], v_a(x)=1/(a+x) has real derivative
−1/(a+x)² and absolute derivative 1/(a+x)². ([SarigTransfer](#references) §2.3 transfer formula and
Appendix A.2, physical pp.12,32.)

Differentiate the reciprocal away from its zero denominator, using a+x≥1. The determinant sign is removed only
when forming the unsigned measure Jacobian.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

**Invariant density telescope**. For x∈[0,1], `Σ_{a≥1}1/((a+x)(a+x+1))=1/(1+x)`. Therefore the Lebesgue transfer
operator sends h(x)=1/((1+x)log 2) to h(x). ([SarigTransfer](#references) §2.3 transfer formula,
physical p.12; the exact density telescope.)

Write each summand as 1/(a+x)−1/(a+x+1) and telescope finite partial sums. Let the final reciprocal tend to
zero; then substitute the density into the inverse-branch Jacobian formula.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove `gauss_invariant`. The native total Gauss map is MeasurePreserving for μ_G. The statement is equality of
pushforward and μ_G on the Borel real line, with support and endpoints explicitly handled.
([SarigTransfer](#references) Transfer duality Proposition 1.1 and §2.3, physical pp.6,12.)

Partition the irrational support into countably many branches and use nonnegative/absolutely integrable change
of variables. Use the density telescope, then native measure extensionality; all omitted rational boundaries
have zero measure.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

### 4.5 Words, matrices and native convergents

Ordered inverse branches and their native two-by-two matrices fix the digit and denominator indices. Their derivative and Fibonacci bounds provide cylinder geometry and the bounded logarithmic denominator error.

Define gaussCylinder. For a finite natural word w, define C_w={x:0<x<1 and Irrational x and, for every
i<length w, gaussDigit(x,i)=w_i}. The digit convention is the zero-based convention: digit 0 is the first
positive partial quotient. A word containing 0 has empty cylinder; C_empty is the irrational unit interval D.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Its basic API consists of these facts.

- The empty word gives exactly the irrational unit interval.
- For a≥1, prepending a intersects the first-digit-a cylinder with the pullback of the remaining cylinder.
- Every cylinder is Borel, and any word containing 0 has empty cylinder.

Intersect the irrational unit interval with the finitely many digit fibers. Do not choose half-open rational
endpoints: all rational points are excluded from this definition.

**Checks.**

- C_empty=D.

- C_[0] is empty.

- C_[1]=D∩(1/2,1).

- C_[1,2]=D∩(2/3,3/4); C_[2,1]=D∩(1/3,2/5), so reversing words changes the cylinder.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

The zero-digit and reversed length-two words are cylinder Checks.

Prove gaussCylinder_nil. C_empty=D. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33
(printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Prove gaussCylinder_cons. For a≥1 and every finite word w, C_(a::w)=D∩{x:digit0(x)=a}∩T⁻¹(C_w).
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents); §4.4 (the gauss map, measure, digits and invariance).

Prove gaussCylinder_measurable. C_w is Borel measurable for every finite natural word w.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Digit fibers are Borel because floor, inverse and Gauss iterates are measurable. The irrational set is the
complement of the countable rational range; take the finite intersection.

*Needs:* §4.5 (words, matrices and native convergents); §4.4 (the gauss map, measure, digits and invariance).

Prove gaussCylinder_zero. If 0 occurs in w, then C_w=empty. ([SarigTransfer](#references) Appendix
A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents); §4.4 (the gauss map, measure, digits and invariance).

**Irrational points form a conull Borel domain**. D={x:0<x<1 and Irrational x} is Borel and has measure one
for m=volume restricted to (0,1), and for the Gauss measure μ_G. Every Gauss iterate maps D into D.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Rational real numbers are the countable range of the rational cast and hence have zero Lebesgue measure.
Equivalence transfers this conull statement to μ_G. For irrational x, a rational fractional part of 1/x would
make x rational; positivity and the unit-interval range give preservation of D.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `Set.countable_range`; Mathlib
`MeasureTheory.NullSingletonClass`; Mathlib `Set.Countable.measure_zero`; Mathlib `Irrational`.

Define ordered inverse-word map. For w=[a_0,…,a_(n−1)], define v_w=v_a0∘…∘v_a(n−1), with v_a(y)=1/(a+y), and v_empty=id.
This total real function is defined for every natural word, but geometric statements assume all entries
positive. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse
cylinders and tail-event exactness.)

Its basic API consists of these facts.

- The empty word is the identity map ℝ→ℝ.
- Prepending a composes with the real map y↦1/(a+y).
- Concatenating words composes their inverse-word maps in the displayed left-to-right order.

Fold the ordered list from the right, preserving the source’s composition order.

**Checks.**

- v_empty(2)=2.

- v_[1,2](0)=2/3 and v_[1,2](1)=3/4.

- v_[2,1](0)=1/3, not 2/3; word order is composition order.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove that v_empty(y)=y for all real y. ([SarigTransfer](#references) Appendix A.2,
physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Prove that v_(a::w)(y)=1/(a+v_w(y)) for every natural a, word w and real y.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Prove that v_(u++w)=v_u∘v_w for all finite natural words u,w.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Define wordMatrix. Construct W_w as the ordered product in Matrix(Fin 2,Fin 2,real) of B_a=[[0,1],[1,a]] for
a in w; W_empty=identity. This is a native matrix, not a second continued-fraction carrier.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Its basic API consists of these facts.

- The empty word has the identity matrix.
- Prepending a left-multiplies by the matrix with rows (0,1) and (1,a).
- A word of length n has determinant (−1)ⁿ; the comparison with native numerators and denominators is the formula below.

*Needs:* the native matrix monoid and the list product in word order.

**Checks.**

- W_empty is identity.

- W_[3]=[[0,1],[1,3]].

- W_[1,2]=[[1,2],[1,3]], whereas W_[2,1]=[[1,1],[2,3]].

*Needs:* Mathlib `Matrix`.

Prove wordMatrix_nil. W_empty=identity matrix. ([SarigTransfer](#references) Appendix A.2, physical
pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Prove wordMatrix_cons. W_(a::w)=[[0,1],[1,a]] W_w. ([SarigTransfer](#references) Appendix A.2,
physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents).

Prove wordMatrix_det. det W_w=(-1)^(length w). ([SarigTransfer](#references) Appendix A.2, physical
pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `Matrix.det_mul`.

**Positive ordered matrix denominators**. For a positive word w of length n≥1, put q=W_w(1,1), r=W_w(1,0).
Then 1≤q and 0<r≤q; for the empty word q=1,r=0. The denominator q+r y is positive for 0≤y≤1.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Equivalently use the append recurrence q_(n+1)=a_n q_n+q_(n−1) starting q_0=1,q_(−1)=0. Induct with a_n≥1. The
n=1 case permits equality q=r when a_0=1.

*Needs:* §4.5 (words, matrices and native convergents).

**Native fractional-part stream equals Gauss iterates**. For x∈D and n≥0, native
GenContFract.IntFractPair.stream x (n+1) is some pair whose integer component is gaussDigit(x,n) and
fractional component is T^(n+1)x. Therefore GenContFract.of x has all partial numerators one and its n-th
partial denominator equal to the real cast of gaussDigit(x,n). ([SarigTransfer](#references) Appendix
A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

The stream at zero has floor x=0 and fract x=x. Induct on n using the stream’s reciprocal-fractional-part
recursion; irrationality prevents the zero-fract termination branch. Read the of constructor’s one-step tail
offset: stream index n+1 supplies partial denominator n.

**Checks.**

- Stream index zero is the integer part; the first Gauss digit uses stream index one.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `GenContFract.IntFractPair.stream`; Mathlib
`GenContFract.of`.

**Irrational Gauss fractions never terminate**. For x∈D, GenContFract.of x is not terminated at any natural
index, its denominators are positive, and dens n≥fib(n+1). ([SarigTransfer](#references) Appendix A.2,
physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

Apply the native termination/rationality equivalence and irrationality. The native Fibonacci lower bound
applies at every index; fib(n+1) is positive.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `GenContFract.terminates_iff_rat`; Mathlib
`GenContFract.succ_nth_fib_le_of_nth_den`.

Prove wordMatrix_native. For x∈C_w and n=length w≥1, W_w=[[g.nums(n−1),g.nums n],[g.dens(n−1),g.dens n]],
where g=GenContFract.of x. For n=0 W_w=identity, with the conventional previous numerator 1 and previous
denominator 0. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31),
inverse cylinders and tail-event exactness.)

Check the first branch against native integer part zero and the first convergent. Induct using the native nums
and dens recurrences and the identified partial denominator. Keep n=0 separate instead of applying natural
subtraction to the formal index −1.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `GenContFract.nums_recurrence`; Mathlib
`GenContFract.dens_recurrence`.

**Möbius formula for inverse words**. For a positive word w and 0≤y≤1,
v_w(y)=(W_w(0,0)y+W_w(0,1))/(W_w(1,0)y+W_w(1,1)). ([SarigTransfer](#references) Appendix A.2, physical
pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

Induct on the word, composing the fractional-linear branch with the preceding formula. Use positive
denominators before cross multiplication.

*Needs:* §4.5 (words, matrices and native convergents).

**Signed inverse-word derivative**. For a positive word w of length n and y∈[0,1], v_w has within-interval
derivative (-1)^n/(q+r y)^2, where q=W_w(1,1),r=W_w(1,0). Its absolute derivative is (q+r y)^(-2).
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Differentiate the fractional-linear formula on a neighborhood where its denominator is positive. Use det
W_w=(-1)^n, including n=0.

**Checks.**

- One branch is decreasing; an unsigned positive derivative is not substituted for the Jacobian.

*Needs:* §4.5 (words, matrices and native convergents).

**Uniform shrinking of positive-word intervals**. For every positive word w of length n, q=W_w(1,1)≥fib(n+1),
and the diameter of v_w([0,1]) is at most 1/(fib(n+1)^2). These bounds tend to zero as n→∞.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Induct on the continuant recurrence with positive digits to obtain the Fibonacci bound. Bound the absolute
derivative by q^(-2) and apply the interval mean-value inequality. Use growth of the Fibonacci sequence; it
suffices to prove fib(n+2)≥n+1 by induction and eventual positivity.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `Nat.fib`.

**Inverse words parametrize cylinders**. For every positive word w, v_w maps D bijectively onto C_w, with
inverse T^(length w) on C_w. C_w is the open interval between v_w(0) and v_w(1), intersected with D, and has
strictly positive m and μ_G mass. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33
(printed pp.30–31), inverse cylinders and tail-event exactness.)

The one-branch floor identity holds on irrational points in (0,1); iterate in word order. The nonzero
determinant makes v_w strictly monotone and maps irrational points to irrational points in its
rational-endpoint image interval. The image interval has distinct rational endpoints; its Lebesgue length is
positive and rational removal changes no mass.

*Needs:* §4.5 (words, matrices and native convergents).

Prove orbit_product_identity. For x∈D and N≥0, (∏_(j<N) T^j x)^(-1)=g.dens N+r_N·T^N x, where
g=GenContFract.of x, r_0=0 and r_N=g.dens(N−1) for N≥1. Hence the denominator-log bridge has error in [0,log
2]. ([Smyth2020](#references) Lesson 9 problem 2.4, physical p.49, printed p.46.)

One route uses x=v_w(T^N x) for the first N digits; multiply the successive branch denominators to obtain the bottom-row
expression. Alternatively induct directly with the native continuant recurrence and T^j x=1/(a_j+T^(j+1)x).
Since 0≤r_N≤dens N and 0<T^N x<1, divide by dens N to get a factor in [1,2], then take logarithms.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `GenContFract.of_den_mono`.

**Uniform logarithmic distortion of one Gauss branch**. For a≥1 and x,y∈[0,1], the logarithms of the absolute
derivatives of v_a(x)=1/(a+x) differ by at most 2|x−y|. This does not assert Lip(v_a′)≤1.
([SarigTransfer](#references) Exercise 2.5(c),(d), physical pp.12–13; one-branch consequence by direct
differentiation.)

For a≥1 on [0,1], the branch derivative is −1/(a+x)², so log|v_a′(x)|=−2log(a+x). Differentiate this scalar
function: its derivative has absolute value 2/(a+x)≤2. The mean-value inequality on the segment between x and
y gives the claimed bound. No continued-fraction continuant lemma is needed for this one-branch assertion.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

**Uniform finite-word cylinder distortion**. For every positive-digit finite word w=(a₁,…,a_n), n≥1, put
v_w=v_a₁∘…∘v_a_n. Its absolute derivative is (q_n+x q_(n−1))⁻², with the word continuants q₀=1,q₋₁=0. For all
x,y∈[0,1], 1/4≤|v_w′(x)|/|v_w′(y)|≤4, and |log|v_w′(x)|−log|v_w′(y)||≤2|x−y|.
([SarigTransfer](#references) Exercise 2.5(c),(d), physical pp.12–13.)

Induct on the finite word using the existing continuant/matrix recurrence and determinant ±1. Use q_(n−1)≤q_n
to compare denominators between q_n and 2q_n, then differentiate their logarithm. Use word-native-continuants
for the native index comparison and word-derivative for the signed branch derivative; word-matrix-positive
bounds the two adjacent denominators.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `GenContFract.of`; Mathlib `GenContFract.dens`;
§4.4 (the gauss map, measure, digits and invariance).

**Convergent denominators and orbit logarithms**. For irrational x∈(0,1) and N≥0, |log((GenContFract.of
x).dens `N)+Σ_{j<N}log(T^[j]x)|≤log` 2. Use the exact identity `∏_{j<N}(T^[j]x)⁻¹=q_N+q_(N−1)T^[N]x`, with
q_(−1)=0, q_0=1. Rational terminated streams are excluded. ([Smyth2020](#references) Lesson 7 continuants
and Lesson 9 exercise 2.4, physical pp.34–37,48–49; sharper bounded-error refinement.)

Induct on the native continuant recurrence to obtain the exact product identity. Use 0≤q_(N−1)≤q_N and
0<T^[N]x<1 to trap the product between q_N and 2q_N; take logs.

*Needs:* Mathlib `GenContFract.of`; Mathlib `GenContFract.dens`; §4.4 (the gauss map, measure, digits and
invariance); §4.5 (words, matrices and native convergents).

### 4.6 Cylinder filtrations, exactness and mixing

The finite-digit filtration generates the Borel trace on D. Cylinder distortion forces tail zero–one; reverse conditional expectations then give strong mixing and ergodicity.

Define `IsStrongMixing`. IsStrongMixing T μ for native μ:ProbabilityMeasure Ω means MeasurePreserving T μ μ
and, for all measurable A,B, μ.real(A∩(T^[n])⁻¹B)→μ.real(A)μ.real(B). This is a general probability-system
predicate; Gauss is an application. ([SarigTransfer](#references) Appendix A.2, physical p.32.)

Its basic API consists of these facts.

- The predicate includes measure preservation of the probability.
- For measurable A,B it gives the specified correlation limit.
- It implies native ergodicity.

Define the precise mixing limit using native iterates, preimages and real measure. General consumers include
Gauss mixing here and homogeneous dynamics at GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 and AdelicAlgebraicGroups AA.2–AA.3. Ergodicity is imported as the native notion, not
redefined.

**Checks.**

- Identity on a one-point dirac probability is mixing.

- Identity on a fair two-atom measure is not mixing: take A=B={0}.

- The swap x↦1−x on that fair two-atom space is ergodic but not mixing.

*Needs:* Mathlib `MeasureTheory.ProbabilityMeasure`; Mathlib `Ergodic`.

Prove IsStrongMixing.measurePreserving. Mixing includes measure preservation.
([SarigTransfer](#references) Appendix A.2, physical p.32.)

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove IsStrongMixing.ergodic. A strongly mixing probability system is native Ergodic.
([SarigTransfer](#references) Appendix A.2, physical p.32.)

For a measurable strictly invariant A, the iterated preimage is A; apply mixing with B=A to obtain μ(A)=μ(A)².
Since 0≤μ(A)≤1, the mass is zero or one; with the measure-preserving projection this is native Ergodic.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); Mathlib `Ergodic`.

Prove IsStrongMixing.correlation. Exports the defining measurable-set correlation limit.
([SarigTransfer](#references) Appendix A.2, physical p.32.)

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Define `IsExact`. IsExact T μ means T preserves the native probability μ and every set measurable for the tail
sigma-algebra inf_n comap(T^[n],mΩ) is μ-null or μ-conull. This is exactness for a noninvertible system,
stronger than ergodicity. ([SarigTransfer](#references) Appendix A.2, physical p.32.)

Its basic API consists of these facts.

- The predicate includes measure preservation of the probability.
- Every measurable event in the pullback tail is null or conull.
- Reverse conditional-expectation convergence proves strong mixing.

One route uses native MeasurableSpace.comap and its indexed infimum, not a private sigma-algebra carrier. Keep the
explicit tail zero-one condition; invariance of a single set is not exactness.

**Checks.**

- Identity on a dirac probability is exact.

- Identity on a fair two-atom measure is not exact.

- An invertible two-point swap is not exact even though it is ergodic.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove IsExact.measurePreserving. Exactness includes measure preservation.
([SarigTransfer](#references) Appendix A.2, physical p.32.)

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove IsExact.tail_zero_one. Exports the native tail-sigma zero-one law.
([SarigTransfer](#references) Appendix A.2, physical p.32.)

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove IsExact.strongMixing. An exact probability system is strongly mixing, by reverse martingale
convergence. ([SarigTransfer](#references) Appendix A.2, physical p.32.)

For each bounded observable, apply reverse-martingale conditional-expectation convergence to the decreasing
sigma-algebras comap(T^[n]). Tail triviality identifies the limit as the constant expectation. Measure
preservation converts these conditional expectations into the measurable-set mixing correlation.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Define gaussCylinderFiltration. Construct a native Filtration natural on the Borel real line, F_n generated
by D and all C_w with length w≤n. Its positive-mass atoms for m=volume|(0,1) are the positive-word cylinders
of length n; the complement of D is a null atom. Do not claim F_n generates all ambient Borel sets away from
D. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders
and tail-event exactness.)

Its basic API consists of these facts.

- Every cylinder of length at most n is measurable at level n.
- The positive words of length n partition the irrational domain into the atoms of its restricted level-n σ-algebra.
- Every ambient Borel set intersected with the irrational domain is measurable for the supremum filtration.

*Needs:* MeasurableSpace.generateFrom of the displayed collection, monotone in n and bounded by the real Borel
sigma-algebra.

**Checks.**

- F₀ consists exactly of ∅, D, Dᶜ and ℝ; the all-Borel choice for F₀ is excluded.

- C_[1]=D∩(1/2,1) has Lebesgue mass 1/2. It separates 1/√2 (first digit 1) and √2−1 (first digit 2) in F₁, while F₀ cannot separate these irrational points.

- C_[1,1]=D∩(1/2,2/3) has Lebesgue mass 1/6. It is not F₁-measurable, since it splits C_[1], and is F₂-measurable. A filtration stopping at first digits fails this test.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib `MeasureTheory.Filtration`.

Prove gaussCylinderFiltration_cylinder. If length w≤n then C_w is F_n-measurable.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove gaussCylinderFiltration_atoms. For each n, the positive natural words of length n give a countable
pairwise-disjoint partition of D into C_w; each C_w is an atom of F_n restricted to D.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

Every shorter cylinder is the countable union of its length-n extensions. Thus the generated sigma-algebra is
the sigma-algebra of unions of these partition cells.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.5 (words, matrices and native convergents).

Prove gaussCylinderFiltration_generates. For every Borel subset B of real, B∩D is measurable for ⨆n F_n.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

For every relative open neighborhood of x∈D, a sufficiently long prefix cylinder containing x lies inside it
because diameters shrink uniformly. There are countably many words; every open set intersected with D is a
countable union of such cylinders. A monotone-class or sigma-algebra argument gives all Borel traces.

**Checks.**

- The complement of D stays one atom; equality with ambient Borel real is false.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.5 (words, matrices and native convergents).

**Conditional expectation on a cylinder atom**. For Borel B and every positive length-n word w, on C_w almost
everywhere for m, m[1_B | F_n] is the constant m.real(B∩C_w)/m.real(C_w). ([SarigTransfer](#references)
Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

Define the measurable step function by the displayed cell average on the countable cylinder partition and zero
outside D. Its values lie in [0,1]; integrals over each cell agree with 1_B, and countable unions give the
same identity for every F_n-measurable set. Apply native conditional-expectation uniqueness.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.5 (words, matrices and native convergents); Mathlib
`MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq`.

**Cylinder conditional expectations recover indicators**. For Borel B, m[1_B | F_n](x)→1_B(x) for m-almost
every x. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse
cylinders and tail-event exactness.)

Replace 1_B by 1_(B∩D), which agrees m-almost everywhere and is strongly measurable for ⨆n F_n. Apply the
native upward conditional-expectation convergence theorem and transfer the almost-everywhere equality back.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.5 (words, matrices and native convergents); Mathlib
`MeasureTheory.Integrable.tendsto_ae_condExp`.

**Native pullback tail sigma-algebras decrease**. For measurable T on a measurable space (Ω,m0),
Ftail_n=MeasurableSpace.comap(T^n,m0) is antitone and Ftail_0=m0; hence its infimum is ≤m0.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

T^(n+1)=T∘T^n and comap T m0≤m0 by measurability. Use comap composition and monotonicity.

*Needs:* Mathlib `MeasurableSpace.comap`; Mathlib `MeasurableSpace.comap_mono`.

**A tail event has measurable pullback representatives**. If B is measurable for ⨅n comap(T^n,m0), then for
every n there is m0-measurable B_n with B=(T^n)⁻¹(B_n). ([SarigTransfer](#references) Appendix A.2,
physical pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

Infimum measurability implies measurability for each pullback sigma-algebra. Use the native characterization
of comap-measurable sets as measurable preimages.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); Mathlib `MeasurableSpace.measurableSet_comap`.

**Correct Lebesgue lower bound for a tail preimage**. For a Gauss tail event B and B_n as above,
m.real(B_n)≥(log 2)μ_G.real(B)≥m.real(B)/2. ([SarigTransfer](#references) Appendix A.2, physical
pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

Gauss invariance gives μ_G(B_n)=μ_G(B). The exact density bounds 1/(2 log 2)≤h≤1/log 2 give the two
comparisons.

**Checks.**

- The printed source’s reversed density estimate is not used; the lower comparison constant is one half.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.4 (the gauss map, measure, digits and invariance).

**Explicit constant-four cylinder measure comparison**. For every finite word w of positive natural digits,
including the empty word, and every Borel B⊆real, m.real(C_w)·m.real(B)/4 ≤ m.real(C_w∩(T^length(w))⁻¹(B)) ≤
4·m.real(C_w)·m.real(B), where C_w is the irrational cylinder and m is Lebesgue measure restricted to (0,1).
([SarigTransfer](#references) Exercise 2.5(c),(d), physical p.13 (printed p.11); Appendix A.2, physical
pp.32–33 (printed pp.30–31).)

For a nonempty word, put q=W_w(1,1) and r=W_w(1,0). The positive-entry and derivative lemmas give q≥1, 0<r≤q
and the absolute Jacobian J(y)=1/(q+r y)² on [0,1]. Hence 1/(q+r)²≤J≤1/q² and the ratio of these bounds is at
most 4. Use the cylinder-image bijection and the native injective change-of-variables theorem on B∩D, and on D
for the whole cylinder. Rational points are null. Compare the two Jacobian integrals: the numerator is between
J_min·m.real(B) and J_max·m.real(B), and the denominator between J_min and J_max. For the empty word C_w=D and
T^0=id, so conullness of D gives the inequalities directly.

**Checks.**

- The constant is the specified value 4, independent of the word and event; an existential unspecified
  distortion constant is insufficient for the downstream 1/8 bound.

- The empty word and removal of rational endpoints preserve the native restricted-Lebesgue masses.

*Needs:* §4.5 (words, matrices and native convergents); Mathlib
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`.

**Uniform conditional lower bound for positive tail events**. For Borel Gauss tail B and every n,
m[1_B|F_n](x)≥m.real(B)/8 for m-almost every x∈D. ([SarigTransfer](#references) Appendix A.2, physical
pp.32–33 (printed pp.30–31), inverse cylinders and tail-event exactness.)

For each positive length-n cylinder, identify B∩C_w with v_w(B_n∩D), modulo rational null sets. Apply
cylinder-measure-distortion with its specified constant 4: m(B∩C_w)/m(C_w)≥m(B_n)/4≥m(B)/8. Cylinder
positivity allows the division, including depth zero. Apply the cell formula and countable union over the
cylinders.

**Checks.**

- The 1/8 constant comes from 1/4 distortion and 1/2 density comparison, not independence of digits.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

**Gauss tail events are null or conull**. Every event B measurable for the native Gauss tail sigma-algebra has
μ_G(B)=0 or μ_G(B)=1. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31),
inverse cylinders and tail-event exactness.)

Tail measurability implies ambient Borel measurability. If m(B)>0, the positive lower bound passes to the
indicator limit and forces m(B complement)=0. Transfer null/conull to μ_G by equivalence and use its
probability normalization.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.4 (the gauss map, measure, digits and invariance).

**Exactness supplies the strong-mixing correlation bound**. For measurable A,B in the preceding probability
system, |μ.real(A∩(T^n)⁻¹B)−μ.real(A)μ.real(B)|≤∫|μ[1_A|Ftail_n]−μ.real(A)|.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33 (printed pp.30–31), inverse cylinders and
tail-event exactness.)

The preimage (T^n)⁻¹B is Ftail_n-measurable, so replace 1_A by its conditional expectation in the intersection
integral. Preservation gives μ((T^n)⁻¹B)=μ(B); subtract the constant product. Bound the restricted absolute
integral by the full L1 error; its convergence yields the exact-system strong-mixing API.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); Mathlib `MeasureTheory.setIntegral_condExp`; Mathlib
`MeasureTheory.integral_map`.

Prove `gauss_exact`. The Gauss map with μ_G is exact in the native tail-sigma sense. Any tail measurable B
with positive mass has full mass. ([SarigTransfer](#references) Appendix A.2, physical pp.32–33,
corrected density estimate.)

Write a tail set as T^(-n)B_n and apply the explicit constant-four cylinder lower bound in every depth-n cylinder. Use the correct density
bounds to obtain a uniform positive lower bound m(B∩[a])/m([a])≥m(B)/(2C). The cylinders generate the Borel σ-algebra on the conull irrational domain; increasing conditional expectations converge to 1_B, forcing its positivity almost everywhere.
Match this native martingale/generation input rather than inventing it.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing); §4.4 (the gauss map, measure, digits and invariance).

Prove `gauss_mixing`. For μ_G, all Borel A,B satisfy μ_G(A∩T^(-n)B)→μ_G(A)μ_G(B).
([SarigTransfer](#references) Appendix A.2: exactness implies mixing, physical p.32.)

Apply the general exact-to-mixing theorem through native reverse conditional expectations. Export the precise
measurable-set mixing predicate, with the Gauss probability instance.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

Prove `gauss_ergodic`. The total Gauss map is native Ergodic for the Gauss probability measure.
([SarigTransfer](#references) Appendix A.2, physical pp.32–33.)

Apply the generic mixing-to-ergodicity API with the existing Gauss probability instance.

*Needs:* §4.6 (cylinder filtrations, exactness and mixing).

### 4.7 Metric digit laws and logarithmic constants

Apply pointwise averages to digit cylinders and integrable logarithms. A single full-measure set supports all finite words; no independence of successive digits is assumed.

Prove `gauss_digit_frequency`. For Lebesgue-almost every irrational x∈(0,1), simultaneously for every a≥1,
#{0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2,
physical pp.45–46.)

Identify a single-digit cylinder with (1/(a+1),1/a), up to zero-mass endpoints, and apply ergodic pointwise
averages to its indicator. Evaluate its Gauss measure by the interval formula and take a countable common null
set over digits. Transport almost-everywhere statements through the positive density to restricted Lebesgue
measure.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); §4.6 (cylinder filtrations, exactness and mixing);
§4.1 (pointwise averages, truncated limsups and first hits).

Prove `gauss_word_frequency`. For each positive-digit word w:Fin k→ℕ with k≥1, let
C_w={y∈(0,1):∀i<k,gaussDigit(y,i)=w_i}. For Lebesgue-almost every x∈(0,1), simultaneously for every such w,
the frequency of starts j<N with ∀i<k,gaussDigit(x,j+i)=w_i tends to μ_G(C_w). The digits are not asserted
independent. ([Smyth2020](#references) Lesson 5 cylinder indicators and Lesson 9, physical pp.28–29,45–46.)

Apply pointwise ergodicity to the measurable finite intersection defining C_w and use the digit-shift API.
Take the countable common null set over finite words and transport via Gauss/Lebesgue equivalence.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); §4.6 (cylinder filtrations, exactness and mixing);
§4.1 (pointwise averages, truncated limsups and first hits).

Define `khinchinConstant`. Define `K=exp(Σ_{a≥1}log(a)·log(1+1/(a(a+2)))/log` 2). The positive series converges
by comparison with log(a)/a². This is the exponential of the Gauss integral of log of the first digit; it is
not an independence product. The printed factor a(a+1) in the school notes is corrected.
([Smyth2020](#references) Theorem 21, physical p.46, corrected using the preceding digit-frequency
formula.)

Its basic API consists of these facts.

- The logarithmic series is summable with the stated positive-term majorant.
- The exponential defining the constant is strictly positive.
- Its logarithm is the Gauss integral of the logarithm of the first digit.

Define the scalar using native tsum and real exp, prove summability separately by comparison. Identify the
series with the integral of log of the digit observable by the countable cylinder partition.

**Checks.**

- The digit-1 logarithmic term is zero.

- The digit-2 logarithmic term is log(9/8), distinguishing a(a+2) from the printed a(a+1).

- The constant exceeds one, unlike the all-digit-1 exceptional orbit.

*Needs:* §4.4 (the gauss map, measure, digits and invariance).

Prove `khinchin_series_summable`. The logarithmic series defining K is summable. ([Smyth2020](#references)
Theorem 21, physical p.46, corrected using the preceding digit-frequency formula.)

One route uses log(1+u)≤u for u≥0 to dominate the summand by log(k+1)/((k+1)(k+3)log 2). Compare log(k+1)/(k+1)² with a
summable power tail; the finitely many endpoint terms are immediate.

*Needs:* §4.7 (metric digit laws and logarithmic constants).

Prove khinchinConstant_pos. K is positive. ([Smyth2020](#references) Theorem 21, physical p.46, corrected
using the preceding digit-frequency formula.)

*Needs:* §4.7 (metric digit laws and logarithmic constants).

Prove khinchinConstant_log_integral. log K equals the Gauss integral of log of the first digit.
([Smyth2020](#references) Theorem 21, physical p.46, corrected using the preceding digit-frequency
formula.)

Partition (0,1) by the first-digit cylinders and compute their masses by the Gauss interval formula. Use the
summability API and integral over the measurable countable partition to identify the tsum, then log(exp(t))=t.

*Needs:* §4.7 (metric digit laws and logarithmic constants); §4.4 (the gauss map, measure, digits and invariance).

**Integrability of Gauss logarithmic observables**. The real functions x↦log(gaussDigit(x,0)) and x↦−log x are
integrable for μ_G. ([Smyth2020](#references) Lesson 9 §1.2 and exercises 2.3–2.4, physical pp.46,48–49.)

For log of the digit, sum the positive cylinder integral weights and compare with the summable logarithmic
series. For −log x use the bounded positive Gauss density and the classical integral of |log x| on (0,1). The
divergent digit mean can be established separately by truncation.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); §4.7 (metric digit laws and logarithmic constants).

Prove `khinchin_geometric_mean`. For Lebesgue-almost every x∈(0,1), `(∏_{0≤j<N}gaussDigit(x,j))^(1/N)` tends to
K. The exponent is real, N→∞, and irrational positive-digit inputs hold outside one null set.
([Smyth2020](#references) Theorem 21 and exercise 2.3(c), physical pp.46,48, corrected constant.)

Apply the pointwise ergodic theorem to the integrable logarithmic first-digit observable. Use the digit-shift
identity and positivity to turn the log average into the logarithm of the geometric mean; exponentiate and
transport measure.

*Needs:* §4.7 (metric digit laws and logarithmic constants); §4.1 (pointwise averages, truncated limsups and first
hits); §4.6 (cylinder filtrations, exactness and mixing); §4.4 (the gauss map, measure, digits and
invariance).

Prove `levy_denominator`. For Lebesgue-almost every x∈(0,1), log((GenContFract.of x).dens N)/N tends to π²/(12
log 2). The native denominator index is fixed by q_0=1, not shifted to the first fractional digit.
([Smyth2020](#references) Lesson 9 §1.2 and exercise 2.4, physical pp.46,48–49.)

Apply the pointwise ergodic theorem to −log x and use the explicit integral. Divide the bounded
log-denominator error by N; it tends to zero.

*Needs:* §4.5 (words, matrices and native convergents); §4.7 (metric digit laws and logarithmic constants); §4.1
(pointwise averages, truncated limsups and first hits); §4.6 (cylinder filtrations, exactness and mixing);
§4.4 (the gauss map, measure, digits and invariance).

**Integrability of logarithmic first digits**. The real function x↦log(gaussDigit(x,0)) is μ_G-integrable,
with integral equal to the Khinchin logarithmic series. ([Smyth2020](#references) Lesson 9, physical
pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

Partition D into single-digit cylinders with positive natural digit a. On each cylinder the function is
constant log a and the mass is log(1+1/(a(a+2)))/log 2. Sum its nonnegative integrals using the established
summability; outside D is null.

**Checks.**

- Integrability is established before applying pointwise Birkhoff to log digit.

*Needs:* §4.7 (metric digit laws and logarithmic constants); §4.5 (words, matrices and native convergents); §4.6
(cylinder filtrations, exactness and mixing); §4.4 (the gauss map, measure, digits and invariance).

**Integrability of negative logarithm for Gauss measure**. The real function x↦−log x is μ_G-integrable. Its
restricted Lebesgue absolute integral is one, and the density upper bound 1/log 2 controls its Gauss integral.
([Smyth2020](#references) Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

On (0,1), −log x≥0 and the pinned log integral from 0 to 1 is −1. Use interval integrability and endpoints of
zero Lebesgue mass to get the restricted integral one. Multiply by the positive bounded density to transfer
absolute integrability.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); Mathlib `integral_log`; Mathlib
`intervalIntegral.intervalIntegrable_log'`.

**Logarithmic monomial integral**. For every n≥0, ∫_(0,1) (−log x)x^n dx=1/(n+1)².
([Smyth2020](#references) Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

Integrate by parts first on [ε,1], using antiderivative x^(n+1)/(n+1). The boundary ε^(n+1)log ε tends to
zero; the omitted integral tends to zero by integrability and 0≤x^n≤1. Evaluate the remaining polynomial
integral.

**Checks.**

- The n=0 case is one; no division by natural n at zero is introduced.

*Needs:* §4.7 (metric digit laws and logarithmic constants); Mathlib `integral_log`; Mathlib
`intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt`; Mathlib `tendsto_log_mul_rpow_nhdsGT_zero`;
Mathlib `integral_pow`; Mathlib `MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Alternating reciprocal squares**. Σ_(n≥0) (-1)^n/(n+1)²=π²/12, and this series is absolutely summable.
([Smyth2020](#references) Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

Reindex the pinned reciprocal-square series, whose n=0 term is zero. Separate even and odd positive indices;
the even subsum is one fourth of π²/6. Odd minus even is one half of the total, namely π²/12.

*Needs:* Mathlib `hasSum_zeta_two`.

**Interchange for the Gauss logarithmic integral**. ∫_(0,1) (−log x)/(1+x) dx=Σ_(n≥0) (-1)^n/(n+1)².
([Smyth2020](#references) Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

For 0<x<1, the geometric series Σ(-x)^n is 1/(1+x). The sum of the absolute integrals of (−log x)(−x)^n is
Σ1/(n+1)², finite by the pinned zeta theorem. Apply native integral/series interchange, avoiding an
unjustified boundary-uniform geometric series at x=1.

*Needs:* §4.7 (metric digit laws and logarithmic constants); Mathlib
`MeasureTheory.hasSum_integral_of_summable_integral_norm`.

**Evaluation of the Gauss logarithmic observable**. ∫ (−log x) dμ_G=π²/(12 log 2).
([Smyth2020](#references) Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4.)

One route uses the withDensity integral and its scalar normalization 1/log 2. Apply the established alternating-square
evaluation. This completes the proof input of the gauss-density-log-integral.

*Needs:* §4.7 (metric digit laws and logarithmic constants); §4.4 (the gauss map, measure, digits and invariance).

### 4.8 Density transfer and normalized transfer

The Lebesgue density operator L and its normalized conjugate P have different constant-function behavior. Work directly with real functions and native continuity/differentiability predicates on [0,1].

Define `gaussDensityTransfer`. For a real function f define (L f)(x)=Σ_(a≥1) f(1/(a+x))/(a+x)², using the
native real infinite sum. Statements on I=[0,1] require f continuous on I (or the stated boundedness) so the
series converges there. Values outside I are totalized by the native sum convention and have no dynamics
claim. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Its basic API consists of these facts.

- The zero function is sent to zero; real scalar multiplication and addition hold on [0,1] for continuous inputs.
- Nonnegative continuous inputs have nonnegative output on [0,1].
- For a continuous density f and Borel ψ bounded on [0,1], integrating ψLf equals integrating (ψ∘T)f.

*Needs:* the native real sum indexed by a=n+1, retaining the positive branch indexing.

**Checks.**

- L(0)(0)=0.

- L(1)(0)=π²/6, so L does not preserve the constant one pointwise.

- For x∈I and h(x)=1/((1+x)log 2), Lh(x)=h(x).

*Needs:* §4.5 (words, matrices and native convergents).

The endpoint value L(1)(0)=π²/6 and the fixed density L(h)=h on [0,1] are Checks.

Prove gaussDensityTransfer_zero. L(0)=0 as a real function. ([Sun2017](#references) Theorem 2, physical
pp.3–6, specialized to p=1.)

*Needs:* §4.8 (density transfer and normalized transfer).

**Absolute convergence of the density transfer**. For f continuous on I, the defining series for Lf converges
absolutely and uniformly on I; its a-th absolute summand is bounded by C/a² where C bounds |f| on I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Compactness bounds the continuous f on I, and every inverse branch maps I into I. Use (a+x)²≥a² for a≥1 and
x∈I, then the reciprocal-square majorant.

*Needs:* §4.8 (density transfer and normalized transfer); Mathlib `hasSum_zeta_two`.

Prove gaussDensityTransfer_add. If f,g are continuous on I, then L(f+g)(x)=Lf(x)+Lg(x) for x∈I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

*Needs:* §4.8 (density transfer and normalized transfer).

Prove gaussDensityTransfer_duality. For f continuous on I and ψ Borel and bounded on I, ∫_I ψ(x)Lf(x) dx=∫_I
ψ(Ty)f(y) dy. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

On each branch interval substitute y=1/(a+x), with absolute Jacobian (a+x)^(-2). Endpoint values and rational
branch boundaries are null. The bounded ψ,f and square-summable branch domination justify summing the branch
integrals; the intervals partition the unit interval modulo a null set.

**Checks.**

- This duality is relative to restricted Lebesgue measure; the normalized operator P below is different.

*Needs:* §4.8 (density transfer and normalized transfer); §4.4 (the gauss map, measure, digits and invariance);
§4.5 (words, matrices and native convergents); Mathlib
`MeasureTheory.hasSum_integral_of_summable_integral_norm`; Mathlib
`MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`.

Define `normalizedGaussTransfer`. For real g define (P g)(x)=Σ_(a≥1) h_a(x)g(v_a(x)), where v_a(x)=1/(a+x) and
h_a(x)=(1+x)/((a+x)(a+1+x)). On I these are nonnegative weights summing to one. P acts directly on real
functions; no new C1 or Lipschitz Banach-space carrier is created. ([Sun2017](#references) Theorem 2,
physical pp.3–6, specialized to p=1.)

Its basic API consists of these facts.

- Every real constant is fixed on [0,1].
- For continuous f, applying the operator to (1+x)f gives (1+x)Lf on [0,1].
- The weighted integral with weight 1/(1+x) is preserved; addition, scalar multiplication and positivity hold for continuous inputs.

*Needs:* native infinite sum and the explicitly normalized branch weights.

**Checks.**

- P(0)(0)=0.

- For all x∈I, P(1)(x)=1.

- P(id)(0)=π²/6−1, not 0; the operator is not the identity.

*Needs:* §4.8 (density transfer and normalized transfer); §4.4 (the gauss map, measure, digits and invariance).

The identities P(1)=1 on [0,1] and P(id)(0)=π²/6−1 are Checks.

Prove normalizedGaussTransfer_const. For x∈I and real c, P(constant c)(x)=c. ([Sun2017](#references)
Theorem 2, physical pp.3–6, specialized to p=1.)

*Needs:* §4.8 (density transfer and normalized transfer); §4.4 (the gauss map, measure, digits and invariance).

Prove normalizedGaussTransfer_conjugate. For f continuous on I, P((1+·)f)(x)=(1+x)Lf(x) for all x∈I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

At v_a, (1+v_a)h_a=(1+x)/(a+x)². Use summability and factor the constant 1+x from the native sum.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove normalizedGaussTransfer_integral. For g continuous on I, ∫_I Pg(x)/(1+x) dx=∫_I g(x)/(1+x) dx.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Put f=g/(1+x), continuous on I, in the conjugacy. Apply Lebesgue duality with ψ=1.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove gaussDensityTransfer_smul. For c real, f continuous on I and x∈I, L(c f)(x)=c Lf(x).
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

One route uses absolute convergence of the branch series for f and c f. Factor the fixed scalar through the native sum.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove gaussDensityTransfer_nonnegative. For f continuous on I with f≥0 on I, Lf(x)≥0 for every x∈I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Every inverse branch maps I into I and every Jacobian weight is nonnegative. Finite partial sums are
nonnegative; their limit is Lf.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove normalizedGaussTransfer_add. For continuous g,h on I and x∈I, P(g+h)(x)=Pg(x)+Ph(x).
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Apply the conjugacy to g/(1+x) and h/(1+x), continuous since 1+x≥1 on I. Use additivity of L and simplify the
nonzero factors.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove normalizedGaussTransfer_smul. For c real, g continuous on I and x∈I, P(c g)(x)=c Pg(x).
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

*Needs:* §4.8 (density transfer and normalized transfer).

Prove normalizedGaussTransfer_bounds. If g is continuous on I and c≤g(x)≤C there, then c≤Pg(x)≤C for x∈I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

One route uses positive transfer of g−c and C−g through conjugacy. Use linearity and constant preservation to obtain both
bounds.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove gaussDensityTransfer_continuous. For f continuous on I, Lf is continuous on I.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Every finite sum of branch terms is continuous on I because a+x≥1. Apply the native uniform-limit continuity
theorem to the uniformly convergent branch partial sums.

*Needs:* §4.8 (density transfer and normalized transfer); Mathlib `TendstoUniformlyOn.continuousOn`.

### 4.9 An explicit derivative contraction and Gauss–Kuzmin rate

Subtract a common branch value before estimating the derivative. Absolute coefficient bounds for the first four branches and the tail give a uniform contraction strictly below 9/10, which yields the density and marginal error estimates.

**C1 branch summands and their uniform majorants**. For g of native class ContDiffOn real 1 on I, each
x↦h_a(x)g(v_a(x)) is C1 on I. If |g| and |derivWithin g I| are bounded by C, then its absolute derivative is
bounded by 4C/(a(a+1)) uniformly for a≥1 and x∈I; its value is bounded by 2C/(a(a+1)).
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

One route uses native within-interval product and chain rules, since v_a(I)⊆I. Compute
h_a′=(a²−a−1−2x−x²)/((a+x)²(a+1+x)²). Bound |h_a′|≤3/(a(a+1)) and h_a/(a+x)²≤1/(a(a+1)); bound h_a≤2/(a(a+1)).

*Needs:* §4.8 (density transfer and normalized transfer); §4.4 (the gauss map, measure, digits and invariance);
Mathlib `contDiffOn_one_iff_derivWithin`.

**Termwise derivative on the open interval**. For C1 g on I and 0<x<1, (Pg)′(x)=Σ_(a≥1)
[h_a′(x)g(v_a(x))−h_a(x)/(a+x)²·g′(v_a(x))]. The derivative series converges uniformly on I when expressed
using derivWithin g I. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

The telescoping majorant Σ1/(a(a+1)) is summable and bounds the derivatives uniformly. Apply the pinned
smooth-series theorem on the open preconnected interval (0,1), using the value-series summability at a base
point. Interior ordinary derivatives of g agree with its within-interval derivatives; at v_1(0)=1 endpoint
derivatives are reserved for the endpoint lemma.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); Mathlib
`hasDerivAt_tsum_of_isPreconnected`.

**Endpoint derivatives and C1 closure of P**. If g is C1 on I, then Pg is native ContDiffOn real 1 on I, and
the displayed derivative series equals derivWithin(Pg) I at every x∈I, including 0 and 1.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Uniformly convergent value and derivative series of continuous branch terms give continuous functions on the
closed interval. On its interior the derivative equality is already proved. At 0 apply the native
right-endpoint extension theorem, and at 1 its left-endpoint counterpart, using these continuous derivative
limits. Restrict the half-line within derivatives to I; unique differentiability of I identifies derivWithin.
*Needs:* the native C1 characterization by differentiability and continuous within derivative.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); Mathlib
`hasDerivWithinAt_Ici_of_tendsto_deriv`; Mathlib `hasDerivWithinAt_Iic_of_tendsto_deriv`; Mathlib
`contDiffOn_one_iff_derivWithin`; Mathlib `TendstoUniformlyOn.continuousOn`.

**Cancellation of derivative weights**. For C1 g on I and x∈I, derivWithin(Pg) I x equals Σ_(a≥1)
[h_a′(x)(g(v_a(x))−g(v_1(x)))−h_a(x)/(a+x)²·derivWithin g I (v_a(x))]. ([Sun2017](#references) Theorem 2,
physical pp.3–6, specialized to p=1.)

Differentiate the uniformly convergent identity Σh_a=1, obtaining Σh_a′=0 with the same closed-interval
argument. Subtract g(v_1(x)) times this zero series.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); §4.8 (density transfer and normalized
transfer).

**Correct absolute coefficient estimate**. If g is C1 on I and |derivWithin g I|≤M there, M≥0, then for x∈I,
|derivWithin(Pg) I x|≤M Σ_(a≥1) c_a(x), where c_a=δ_a|h_a′|+h_a/(a+x)² and δ_a=(a−1)/((1+x)(a+x)).
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Apply the native interval mean-value bound to |g(v_a)−g(v_1)|≤M|v_a−v_1|=Mδ_a. Take absolute values of every
derivative-weight contribution before summing. Use absolute summability established by the C1 majorant.

**Checks.**

- h_2′(1)=−1/72. Replacing |h_a′| by h_a′ in this triangle estimate is invalid.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); Mathlib
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`.

**First branch coefficient**. For x∈I, c_1(x)=1/((1+x)²(2+x))≤1/2. ([Sun2017](#references) Theorem 2,
physical pp.3–6, specialized to p=1.)

δ_1=0; bound each positive denominator from below.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Second branch coefficient**. For x∈I, c_2(x)≤5/72. ([Sun2017](#references) Theorem 2, physical pp.3–6,
specialized to p=1.)

One route uses δ₂≤1/2, |h₂′|≤1/18 and hence δ₂|h₂′|≤1/36. For the other term, clear the positive denominator:
(2+x)^3(3+x)−24(1+x)=20x+30x²+9x³+x⁴≥0 on I, giving h₂/(2+x)²≤1/24. Add the bounds to obtain c₂≤5/72.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Positive derivative coefficients after the second branch**. For a≥3 and x∈I, h_a′≥0 and
c_a(x)=[a(a−1)²+(2+x)(1+x)²]/[(1+x)(a+x)^3(a+1+x)^2]. ([Sun2017](#references) Theorem 2, physical pp.3–6,
specialized to p=1.)

The derivative numerator is at least a²−a−4≥2. Combine the two fractions using positive denominators.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Third branch coefficient**. For x∈I, c_3(x)≤7/216. ([Sun2017](#references) Theorem 2, physical pp.3–6,
specialized to p=1.)

One route uses the positive coefficient formula. After clearing denominators,
14·den(x)−432·num(x)=12960x+12762x²+6596x³+1848x⁴+252x⁵+14x⁶≥0.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Fourth branch coefficient**. For x∈I, c_4(x)≤19/800. ([Sun2017](#references) Theorem 2, physical pp.3–6,
specialized to p=1.)

One route uses the positive coefficient formula. After clearing denominators,
38·den(x)−1600·num(x)=122720x+95592x²+37806x³+8170x⁴+874x⁵+38x⁶≥0.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Reciprocal-square bound for branches with a≥5**. For a≥5 and x∈I, c_a(x)≤1/a². ([Sun2017](#references)
Theorem 2, physical pp.3–6, specialized to p=1.)

The positive formula numerator is at most a(a−1)²+12 and its denominator is at least a³(a+1)². The required
inequality is 12≤4a².

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Telescoping bound on the reciprocal-square tail**. Σ_(a≥5) 1/a²≤1/4. ([Sun2017](#references) Theorem 2,
physical pp.3–6, specialized to p=1.)

For a≥5, 1/a²≤1/(a(a−1))=1/(a−1)−1/a. Telescope finite tails and pass to the summable limit.

*Needs:* Mathlib `hasSum_zeta_two`.

**Uniform corrected contraction coefficient**. For every x∈I, Σ_(a≥1)c_a(x)≤18913/21600<9/10.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Split branches 1,2,3,4 and the tail. Add 1/2+5/72+7/216+19/800+1/4=18913/21600; its distance below 9/10 is
527/21600.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

Prove `transfer_derivative_contraction`. For C1 g on I, M≥0 and |derivWithin g I|≤M on I, |derivWithin(Pg)
I|≤(9/10)M on I. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**C1 derivative bound for every iterate**. For C1 g on I and derivative bound M≥0, P^n g is C1 on I and its
within derivative is bounded by (9/10)^n M. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized
to p=1.)

Induct on n starting with P^0 g=g, using C1 closure and the contraction at each step.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate).

**Conserved weighted mean pins the transfer constant**. For C1 g on I, set c=(∫_I g(x)/(1+x) dx)/log 2. If
|derivWithin g I|≤M, then for every n and x∈I, |P^n g(x)−c|≤(9/10)^n M. ([Sun2017](#references) Theorem 2,
physical pp.3–6, specialized to p=1.)

The weighted mean of P^n g is the same as that of g, and the positive weight integrates to log 2. Translate
∫_0^1(1+x)^(-1) by x↦1+x to the pinned positive reciprocal integral from 1 to 2. For fixed x, integrate the
mean-value bound |P^n g(x)−P^n g(y)|≤(9/10)^n M|x−y|≤(9/10)^n M against the normalized weight. This directly
bounds distance to its weighted mean without choosing a zero of the derivative or invoking a spectral
decomposition.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); §4.8 (density transfer and normalized
transfer); Mathlib `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`; Mathlib `integral_one_div_of_pos`.

**Iterated densities of the Gauss map**. For f continuous on I and nonnegative with ∫_I f=1, the pushforward
under T^n of m.withDensity(ENNReal.ofReal∘f) equals m.withDensity(ENNReal.ofReal∘L^n f). In particular
map(T^n,m) has density L^n 1. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1;
[SarigTransfer](#references) Proposition 1.1, physical p.6 (printed p.4); §2.3, physical p.12 (printed
p.10).)

The defining density is continuous, nonnegative and integrable. Duality for bounded indicators identifies
one-step pushforward measures. The uniformly convergent branch series is continuous and nonnegative on I,
allowing induction. Apply the formula to f=1.

*Needs:* §4.8 (density transfer and normalized transfer).

Prove `density_uniform_error`. For every n≥0 and x∈I, |L^n 1(x)−1/((1+x)log 2)|≤(9/10)^n.
([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

Take g_0(x)=1+x, whose within derivative on I is 1 and whose weighted mean is 1/log 2. Induct the conjugacy
P^n g_0=(1+x)L^n 1. Divide the weighted-mean estimate by 1+x≥1.

**Checks.**

- This proves an explicit sufficient rate, not the source’s sharper Q_1 or the Gauss–Kuzmin–Wirsing optimal
  rate.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); §4.8 (density transfer and normalized
transfer).

Prove digit_marginal_error. For every a≥1 and n≥0, |m.real{x:gaussDigit(x,n)=a}−log((a+1)²/(a(a+2)))/log
2|≤(9/10)^n. ([Sun2017](#references) Theorem 2, physical pp.3–6, specialized to p=1.)

One route uses the nth digit as the first-digit cylinder pulled back under T^n. Integrate the uniform density error over
that cylinder, whose Lebesgue length is at most one. Its Gauss mass is the logarithmic digit probability. The
gauss-kuzmin target holds with C=1 and ρ=9/10.

*Needs:* §4.9 (an explicit derivative contraction and gauss–kuzmin rate); §4.4 (the gauss map, measure, digits and
invariance).

Prove `gauss_kuzmin`. There are absolute C>0 and 0<ρ<1 such that for every a≥1 and n≥0, the Lebesgue
probability that gaussDigit(x,n)=a differs from log((a+1)^2/(a(a+2)))/log 2 by at most Cρ^n. This is
convergence of the nth marginal law from Lebesgue initial data; pointwise ergodic frequency alone gives no
exponential rate. ([SarigTransfer](#references) §2.3 Gauss–Kuzmin theorem and Doeblin–Fortet proof,
physical pp.11–13; [Sun2017](#references) Theorem 2, arXiv:1705.02921v2, physical pp.3–6; corrected p=1
absolute-coefficient estimate from the absolute-coefficient calculation of §4.9.)

One route uses the native Lebesgue transfer operator L and its fixed Gauss density, with density-pushforward identifying
L^n1 as the n-th image density. Use the closed-interval C1 derivative contraction of §4.9 for the normalized
transfer P. Absolute weight derivatives give a sufficient rate 9/10; weighted-mean-pins-limit and conjugacy
give density-uniform-error. Integrate density-uniform-error over the first-digit event. The digit shift gives
digit-marginal-error uniformly in a. Choose C=1 and rho=9/10. The unused Hennion/Lipschitz route is not a
prerequisite of this target.

*Needs:* §4.4 (the gauss map, measure, digits and invariance); §4.6 (cylinder filtrations, exactness and mixing);
§4.5 (words, matrices and native convergents); §4.9 (an explicit derivative contraction and gauss–kuzmin
rate).

### 4.10 Modular homogeneous-space consumers

Prove bounded_partial_denominators_iff_badlyApproximable. For irrational 0<x<1, the native partial denominators of GenContFract.of x are bounded if and only if BadlyApproximable x from DiophantineApproximationAndTranscendence §0.6. Use the native upper convergent error and the lower bound 1/(q_n(q_n+q_(n+1))), with q_(n+1)=a_(n+1)q_n+q_(n−1); Legendre’s criterion reduces sufficiently close rationals to convergents. The characterization is Smyth2020, Lesson 10, §2.5, Exercise 2.20, physical p.55 (printed Lesson 10, p.52); Theorems 25, 27 and 29 provide the convergent-error and Legendre inputs. The supplier’s §0.5 supplies the stated convergent-error inequalities on the native carrier.

**Checks.**

- The irrational (√5−1)/2 has every digit 1 and is badly approximable

- A rational such as 1/2 has a bounded terminating stream but is not badly approximable, so irrationality is essential

- An irrational with unbounded positive partial denominators has convergent products q_n|q_nx−p_n| tending to zero along a subsequence and fails bad approximation.

*Needs:* DiophantineApproximationAndTranscendence §§0.5–0.6; §4.5 native-stream comparison and native denominators.

Translate the row-lattice source convention to column lattices and positive time. The Diophantine/short-vector comparison combines with DiophantineApproximationAndTranscendence §0.6 and GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 and AdelicAlgebraicGroups AA.2–AA.3; Haar-typical pointwise averages on the quotient are a distinct assertion from Lebesgue-typical behavior on one horocycle.

**Row/column and diagonal-time comparison**. Transpose identifies the source’s row-lattice class Γg in
Γ\SL(2,real) with gᵀΓ in SL(2,real)/Γ. The row lattice {(p+xq,q)} uses g=u_xᵀ, and right multiplication by
diag(exp(s/2),exp(−s/2)) becomes left multiplication by a_(s/2). Thus source positive time s corresponds to
this document’s t=s/2. ([Gorodnik2010](#references) Lecture 1, physical pp.3–8, bounded geodesics and
lattices.)

Transpose reverses multiplication and sends the integer subgroup to itself, so it descends to the two quotient
conventions. Check the row basis and the two diagonal entries explicitly. The induced homeomorphism preserves
relative compactness.

*Needs:* AdelicAlgebraicGroups AA.2–AA.3; GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5; Mathlib `Matrix.SpecialLinearGroup`; Mathlib
`Matrix.SpecialLinearGroup.map`; Mathlib `QuotientGroup.mk`; Mathlib `QuotientGroup.instTopologicalSpace`;
Mathlib `borel`.

**Bad approximation gives a uniform short-vector lower bound**. Assume c>0 and q|qx−round(qx)|≥c for every
positive natural q. For t≥0 and integers p,q not both zero, max(|exp(t)(p+xq)|,|exp(−t)q|)≥min(1,sqrt c).
([Gorodnik2010](#references) Lecture 1, physical pp.3–8, bounded geodesics and lattices.)

For q=0, |p|≥1 and exp t≥1. For q≠0, nearest-integer minimality and the bound at |q| give |p+xq||q|≥c. The
product of the two scaled coordinates is the same; their maximum is at least sqrt c.

*Needs:* DiophantineApproximationAndTranscendence §0.6.

**Uniform short vectors give a badly-approximable constant**. If 0<δ≤1 and for every t≥0 and integer pair
(p,q)≠(0,0), max(|exp(t)(p+xq)|,|exp(−t)q|)≥δ, then q|qx−round(qx)|≥δ²/2 for every positive natural q.
([Gorodnik2010](#references) Lecture 1, physical pp.3–8, bounded geodesics and lattices.)

Choose p=−round(qx) and t=log(2q/δ)≥0. The second coordinate has absolute value δ/2; hence the first has
absolute value at least δ. Use exp t=2q/δ and rearrange.

Prove `homogeneous_birkhoff`. Let G=SL(2, real), Γ=SL(2, integer) embedded entrywise, X=G/Γ with its quotient
Borel structure (the native aliases `homogeneousGroupTopology` and `homogeneousQuotientMeasurableSpace`), μ the normalized G-invariant Haar probability, a_t=diag(exp t, exp(-t)), and S(gΓ)=a_1 gΓ.
For every μ-integrable real f, native Birkhoff averages of S converge μ-almost everywhere to ∫f dμ.
([Gorodnik2010](#references) Lecture 1, physical pp.3–8, bounded geodesics and lattices.)

Consume AdelicAlgebraicGroups AA.2–AA.3 for the quotient, lattice, normalized measure and left action. The
subgroup {a_t:t∈real} is closed and noncompact; to conclude time-one ergodicity use the stronger GeometryOfNumbersAndQuadraticArithmetic §4.2.1
Howe–Moore mixing restriction, since continuous-flow ergodicity alone does not imply time-one ergodicity.
Apply the pointwise ergodic theorem to S and f.

**Checks.**

- At t=log 2 and x=1, a_t u_x=[[2,2],[0,1/2]], whereas u_x a_t=[[2,1/2],[0,1/2]]. Thus the positive column-lattice action uses the first product; on the column (−1,1) it gives (0,1/2).

- For f=1, every nonempty time-one average and the Haar integral equal 1. At N=0 the totalized average is 0, which does not affect the limit.

- The identity transformation is excluded by a₁=diag(e,e⁻¹): its first diagonal entry 1 differs from e. Time-one mixing follows from Howe–Moore, rather than being an extra hypothesis.

- This is Haar-almost-everywhere on X. It makes no assertion about every point u_xΓ or Lebesgue-almost-everywhere on a single horocycle.

*Needs:* AdelicAlgebraicGroups AA.2–AA.3; GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5; GeometryOfNumbersAndQuadraticArithmetic /
§4.2.2 moore_ergodicity; §4.1 (pointwise averages, truncated limsups and first hits);
GeometryOfNumbersAndQuadraticArithmetic / §4.2.1 howe_moore; Mathlib `Matrix.SpecialLinearGroup`; Mathlib
`Matrix.SpecialLinearGroup.map`; Mathlib `QuotientGroup.mk`; Mathlib `QuotientGroup.instTopologicalSpace`;
Mathlib `borel`.

Prove `bounded_digits_compact_orbit`. For irrational real x with 0<x<1, let u_x=[[1,x],[0,1]] and a_t=diag(exp
t,exp(-t)). There exists B∈natural with every Gauss digit a_n(x)≤B if and only if the closure in
SL(2,real)/SL(2,integer) of {a_t u_x Γ:t≥0} is compact. ([Gorodnik2010](#references) Lecture 1, physical
pp.3–8, bounded geodesics and lattices.)

Apply bounded_partial_denominators_iff_badlyApproximable and the native-stream comparison, retaining irrationality. Use the two explicit short-vector estimates and GeometryOfNumbersAndQuadraticArithmetic §4.5 Mahler compactness
to obtain the diagonal-semiorbit criterion. Translate the source’s row-vector Γ\G convention by transpose and
use source time s=2t.

**Checks.**

- The rational x=0 has the short vector (0,exp(-t)) and an unbounded orbit; irrationality is essential.

*Needs:* DiophantineApproximationAndTranscendence §0.6; GeometryOfNumbersAndQuadraticArithmetic /
§4.5 Mahler compactness; §4.10 (modular homogeneous-space consumers); Mathlib `Matrix.SpecialLinearGroup`;
Mathlib `Matrix.SpecialLinearGroup.map`; Mathlib `QuotientGroup.mk`; Mathlib
`QuotientGroup.instTopologicalSpace`; Mathlib `borel`.

Prove `typical_unbounded_semiorbit`. For restricted Lebesgue-almost every x∈(0,1), the positive diagonal
semiorbit a_t u_x Γ is not relatively compact. More precisely, on one conull irrational set, every a≥1 occurs
with its positive Gauss frequency, so the digit sequence is unbounded and the bounded-digits criterion
applies. ([Gorodnik2010](#references) Lecture 1, physical pp.3–8, bounded geodesics and lattices.)

Intersect the countably many conull digit-frequency sets and the irrational set. If digits were bounded by B,
the positive-frequency digit B+1 could not occur. Apply the compact-orbit comparison and equivalence of Gauss
and restricted Lebesgue measure.

**Checks.**

- No rate of cusp escape and no homogeneous equidistribution along a horocycle is inferred.

*Needs:* §4.10 (modular homogeneous-space consumers); §4.7 (metric digit laws and logarithmic constants); §4.4 (the
gauss map, measure, digits and invariance).

### Examples

For T=id and f≡c, all positive-length averages equal c. The upper truncation at L is
min(c,L) when c≥0, and the canonical orbit limit is c. For successor on ℕ with f(k)=k,
the orbit at zero diverges, so the canonical real limit is zero while its nonnegative
upper truncation is L. A first-hit selector with threshold c−ε for a constant c and ε>0
returns one. A zero-valued hit selector in the greedy coloring produces red singletons:
M=2,N=3 gives three singleton red blocks, rather than an empty blue loop. These examples
fix the finite defaults used in §§4.1–4.3. The identity map with Dirac probability at zero
is both strongly mixing and exact: every event has mass zero or one. Thus neither
definition should impose a nonatomicity hypothesis.

The total Gauss map sends 1/2 to 0. The first two observations at x=1/2 are therefore
2 and 0; irrational positivity cannot be extended through rational termination. For the
word (1,2), v₁(v₂(0))=2/3 and W=[[1,2],[1,3]], of determinant −1 squared, namely 1.
Reversing the word gives v₂(v₁(0))=1/3. At word length one the determinant is −1. Native
q₀=1 and q₁=2 for a point beginning with digit 2; an index shift would break the orbit
product identity of §4.5. The empty word has cylinder D, inverse map id and identity matrix.
A word containing zero has empty cylinder.

The first-digit-2 probability is log(9/8)/log 2. The corresponding summand in log K is
log 2·log(9/8)/log 2=log(9/8); replacing a(a+2) by a(a+1) would give a different value.
The observable −log x is nonnegative on (0,1) and has mean π²/(12log 2), giving positive
Lévy denominator growth. The golden-ratio reciprocal has every Gauss digit equal to one,
so it is an exceptional orbit for these almost-everywhere statements.

For the Lebesgue density transfer, `L(1)(0)=Σ_{a≥1}a^(−2)=π²/6`. For the normalized transfer,
P(1)=1 but `P(id)(0)=Σ_{a≥1}1/(a²(a+1))=π²/6−1`. The derivative-weight sum is zero; taking
absolute values only after this cancellation avoids a false signed bound. At a=1,x=0 the
coefficient c₁ is 1/2, while the total bound is 18913/21600<9/10. The uniform density
error of §4.9 consequently uses (9/10)^n, including n=0 and the interval endpoints.

In column convention a_tu_x(p,q)=(e^t(p+xq),e^(−t)q). At t=0 and q=0, a nonzero
integer p has max norm at least one. For q≠0, the product of the two coordinate absolute
values is |q||p+xq|. A badly-approximable constant c therefore gives max norm at least
min(1,√c). Conversely, a uniform max-norm lower bound δ and the time choice in §4.10
give c=δ²/2. Transpose sends this to the source's row-lattice convention with time parameter
2t. Haar almost-everywhere statements on the quotient do not by themselves restrict to
Lebesgue almost-everywhere statements on one horocycle.

### Dependencies

One route uses native Birkhoff averages, invariant sigma-algebras, conditional expectation, L1 approximation
and forward/reverse martingale convergence. Gauss words use native continued fractions and
finite matrices; logarithmic integrals use native power series and reciprocal-square sums.
The quantitative transfer proof uses C1 functions on the closed unit interval and explicit
uniform majorants, without a spectral-gap hypothesis. Homogeneous applications consume DiophantineApproximationAndTranscendence §0.6
and GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 and AdelicAlgebraicGroups AA.2–AA.3 exactly as specified above. The generic pointwise proof uses no digit normality.

## Layer 5: Short intervals, logarithmic correlations and random models

### 5.1 Inclusive short intervals and prime-block restrictions

**Stability of real multiplicative long means.** There are absolute C>0 and X₀>1 such that, for every real multiplicative f with |f(n)|≤1 on positive integers, real X≥X₀, X≤x≤2X and X/(log X)^(1/5)≤y≤X, `|y⁻¹Σ_{x≤n≤x+y}f(n)−X⁻¹Σ_{X≤n≤2X}f(n)|≤C(log X)^(−1/20)`, uniformly in f, x and y (MatomakiRadziwill Lemma 4, §3, physical pp.13–14).

**Checks.**

- For f=1, integer X and x=X,y=X, both inclusive means are (X+1)/X and their difference is 0. If y=X/2 is integral, the means differ by 1/X, recording the inclusive endpoint error.

*Needs:* AnalyticNumberTheoryPartI §§0.19, 0.21 and §3.33 Halász, together with the inclusive interval convention of this section.

**Restricted Dirichlet-polynomial mean square.** For 0<η<1/6, real multiplicative |f(n)|≤1, X≥X₀(η), and S_X with increasing prime intervals satisfying the two spacing inequalities (2)–(3) and cutoff Q_J≤exp(√log X) specified in §5.1, the polynomial `F(s)=Σ_{n∈S_X}f(n)n^(−s)` satisfies ∫_((log X)^(1/15))^T |F(1+it)|²dt ≤ C_η(T/(X/Q₁)+1)((log Q₁)^(1/3)/P₁^(1/6−η)+(log X)^(−1/50)) for every T≥(log X)^(1/15), with C_η independent of f, X, T and the admissible intervals (MatomakiRadziwill Proposition 1, §8, physical p.23).

**Checks.**

- At T=(log X)^(1/15) the integral is 0 and the bound is nonnegative. For f=1 and a dense S_X, F(1) approaches log 2; an estimate including t=0 with a vanishing right side would fail.

*Needs:* AnalyticNumberTheoryPartI §1.5 Dirichlet-polynomial mean squares and §3.33 Halász; the prime-block sets and spacing hypotheses in this section.

Short means include both endpoints and divide by h. The good-prime-factor mean-square estimate, with its real start variable, supplies the exceptional-integer conclusion of Matomäki–Radziwiłł.

Define `shortMean`. For real arithmetic f, natural x,h, `shortMean(f,x,h)=h⁻¹Σ_{x≤n≤x+h}f(n)`. The source
includes both endpoints but normalizes by h, giving h+1 terms. Native total division gives shortMean(f,x,0)=0.
Its long dyadic mean is the same expression shortMean(f,X,X). ([MatomakiRadziwill](#references)
Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.)

Its basic API consists of these facts.

- At h=0 its value is 0 under total division.
- Pointwise addition of arithmetic functions adds their means.
- If h>0 and |f|≤1 on the interval, its absolute value is at most (h+1)/h.

One route uses native Finset.Icc with exactly the source normalization; do not replace the denominator by h+1. The
exceptional set is a finite set of integer x∈[X,2X] for Theorem 1; the source’s intermediate L2 estimate
integrates real starting points separately.

**Checks.**

- The zero arithmetic function has zero means.

- A length-one interval includes f(x) and f(x+1), with denominator one.

- For x,h>0 and f(n)=1 on positive inputs, the mean is (h+1)/h, not one.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `ArithmeticFunction.IsMultiplicative`.

Prove shortMean_zero. The totalized zero-length mean is zero. ([MatomakiRadziwill](#references)
Theorem 1, physical p.1; collated published pp.1015–1017,1020–1021.)

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions).

Prove shortMean_add. The mean is linear for pointwise addition of arithmetic functions.
([MatomakiRadziwill](#references) Theorem 1, physical p.1; collated published
pp.1015–1017,1020–1021.)

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions).

Prove shortMean_bound. If |f(n)|≤1 on the interval and h>0, |shortMean|≤(h+1)/h.
([MatomakiRadziwill](#references) Theorem 1, physical p.1; collated published
pp.1015–1017,1020–1021.)

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions).

Prove `matomaki_radziwill`. There are absolute C,C′>1 such that for every real multiplicative f with |f(n)|≤1
on positive integers, natural 2≤h≤X and δ>0, all but at most C X[(log h)^(1/3)/(δ² h^(δ/25))+1/(δ²(log
X)^(1/50))] integer x∈[X,2X] satisfy |shortMean(f,x,h)−shortMean(f,X,X)|≤δ+C′log log h/log h. C,C′ are
independent of f,h,X,δ. Complex-valued functions are not covered by this source theorem.
([MatomakiRadziwill](#references) Theorem 1, physical p.1; collated published
pp.1015–1017,1020–1021.)

One route uses Theorem 3’s mean-square comparison on the source set with one prime factor in each specified prime
interval. For h≤X/(log X)^(1/5), control the excluded integers using the finite-set estimate with f=1 and apply Markov with δ; the terminal loss is absorbed by (log X)^(−1/50). For longer intervals, apply the unrestricted long-interval comparison on [X,3X], rather than discarding the terminal interval: the real bounded multiplicative long-mean estimate in MatomakiRadziwill Lemmas 4–5 compares every interval of length at least X/(log X)^(1/5) with the dyadic mean, with error O((log X)^(−1/20+o(1))). Apply the stability-of-long-means target of this section for this uniform comparison; Halász alone does not include its stability conclusion. The argument retains the inclusive-endpoint O(1/h) error. The restricted Dirichlet-polynomial inequality is restricted dirichlet-polynomial mean square, and the Parseval short-interval bound below converts it to real-start mean squares; the good-integer counting uses the supplied Mertens estimates; no proved conclusion is derived from a random model.

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions); Mathlib
`ArithmeticFunction.IsMultiplicative`; AnalyticNumberTheoryPartI §§3.18, 3.33; AnalyticNumberTheoryPartI §1.5; restricted dirichlet-polynomial mean square; stability of real multiplicative long means.

**Parseval short-interval bound.** For X sufficiently large, complex coefficients |a_m|≤1 and 1≤h₁≤h₂=X/(log X)^(1/5), put `S_j(x)=Σ_{x≤m≤x+h_j}a_m`, `A(s)=Σ_{X≤m≤4X}a_m m^(−s)`, and E(t)=|A(1+it)|²+|A(1−it)|². Prove

`X⁻¹∫_X^(2X)|S₁(x)/h₁−S₂(x)/h₂|²dx ≤ C[(log X)^(−2/15)+∫_((log X)^(1/15))^(X/h₁)E(t)dt+sup_{T≥X/h₁}(X/(h₁T))∫_T^(2T)E(t)dt]`,

with absolute C. Perron's formula and its two frequency halves give this complex form of MatomakiRadziwill Lemma 14, §7, physical p.21; for real coefficients E(t)=2|A(1+it)|². Endpoint equalities affect only a null set of real x. *Needs:* the Perron summation contract of ArithmeticDirichletSeries, Export contract; AnalyticNumberTheoryPartI §1.5 and its mean-square theorem.

**Checks.**

- If every a_m=0, both sides except the nonnegative error term vanish: the discrepancy and both spectral integrals are zero.
- For h₁=h₂ the two short sums coincide and the left side is zero, independently of a_m.
- For a_m=m^(−it₀), t₀>0, `A(1−it₀)=Σ_{X≤m≤4X}1/m`, which tends to log 4. Conjugating the coefficients swaps the two frequency integrals and leaves E unchanged; retaining only positive frequencies would miss this peak.

**Prime-condition inclusion–exclusion.** For the J prime intervals of this section and positive n, let χ(n) indicate the condition that each interval contains a prime divisor of n. For I⊆{1,…,J}, let g_I(n) be 1 when no prime in the union of intervals indexed by I divides n, and 0 otherwise; extend g_I by zero at input zero. Each g_I is a native real multiplicative arithmetic function. Prove χ(n)=Σ_I(−1)^|I|g_I(n), by expanding `∏_j(1−g_{ {j} }(n))`. Consequently the restricted sums of any observation on an interval equal the corresponding signed sum of unrestricted sums of its pointwise products with g_I. In particular 1_(S_X)=1_[X,2X]χ; this identity retains the finite support. (MatomakiRadziwill, Lemma 5, physical p.15.)

The spacing conditions also give 2^J=(log X)^o(1), uniformly for fixed η: the j=2 term forces log Q₂≥64 log 2/η, and subsequent steps give log Q_j≥(8j²/η)log Q_(j−1). Factorial growth and log Q_J≤√log X imply J=O_η(log log X/log log log X). Thus summing the long-mean errors over I gives O_η((log X)^(−1/20+o(1))). *Needs:* finite product expansion; the displayed interval constraints; stability of real multiplicative long means for the mean comparison.

**Checks.**

- With J=0 the sole subset is empty and g_empty(n)=1 for n>0, so the identity reads 1=1.
- With a single interval containing only prime 2, n=2 gives 1−0=1, while n=3 gives 1−1=0.
- With intervals containing only 2 and only 3, n=6 gives 1−0−0+0=1; n=2 gives 1−0−1+0=0; n=1 gives 1−1−1+1=0. Coprimality assumptions between the intervals are unnecessary for the product expansion.

**Good-integer mean-square input**. MR Theorem 3: let f be real multiplicative with |f(n)|≤1 on positive
integers and let 2≤h≤X. For η∈(0,1/6), increasing prime intervals [P_j,Q_j] with 1<P_j≤Q_j, Q₁≤exp(sqrt(log
X)), and every j≥2, (log log Q_j)/(log P_(j−1)−1)≤η/(4j²) and (η/j²)log P_j≥8log Q_(j−1)+16log j. Let J be the
largest j with Q_j≤exp(sqrt(log X)), and S_X={n∈[X,2X]: each interval [P_j,Q_j],1≤j≤J, contains a prime
divisor of n}. If [P₁,Q₁]⊂[1,h], then for X≥X₀(η),
`∫_X^(2X)|h⁻¹Σ_{x≤n≤x+h,n∈S_X}f(n)−X⁻¹Σ_{X≤n≤2X,n∈S_X}f(n)|²dx` ≤ C_η X[(log h)^(1/3)/P₁^(1/6−η)+(log
X)^(−1/50)+h/X]. The start x is real and both finite sums retain the inclusive endpoints. Formula (4) is one
admissible choice, not the complete hypothesis. ([MatomakiRadziwill](#references) Theorem 3 and
(4), physical pp.6–7; collated published pp.1015–1017,1020–1021.)

One route uses restricted dirichlet-polynomial mean square, the Parseval short-interval bound and prime-condition inclusion–exclusion. For h≤h₂, compare the auxiliary mean on x≤2X−h₂ with its dyadic mean using the long-mean contract on each multiplicative product f·g_I. For h>h₂, make that comparison directly on x≤2X−h. On these ranges the finite-set and unrestricted prime-condition sums agree. The terminal interval has length h; both means are bounded by 3/2 for X≥h≥2, so its squared discrepancy contributes at most 9h. This gives the displayed h/X loss. In the comparison with the auxiliary length h₂=X/(log X)^(1/5), its terminal loss h₂/X is absorbed by (log X)^(−1/50). Keep both spacing inequalities (2)–(3); formula (4) is only one choice.

**Checks.**

- For f=1, h=X and |S_X|/X→1, x≥7X/4 gives a short mean at most 1/4+1/X against a long mean tending to 1. The integral is at least X/36 eventually; the added term contributes C_ηX.
- If h=o(X), the additional normalized loss h/X tends to zero. For η=1/12, P₁=(log X)^1000 and Q₁=exp(√log X), the missing density is O(log log X/√log X), and the two analytic errors tend to zero.
- For h≤h₂, the endpoint correction of the auxiliary comparison is (log X)^(−1/5), bounded by (log X)^(−1/50) when log X≥1.

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions); AnalyticNumberTheoryPartI §§3.18, 3.33;
AnalyticNumberTheoryPartI §1.5; restricted dirichlet-polynomial mean square; stability of real multiplicative long means.

### 5.2 Harmonic two-point averages

**Prime Fourier fourth moment.** For fixed a≥1 and 0<ε<1, H sufficiently large divisible by a, and arbitrary |c_p|≤1 on primes ε²H/2≤p≤ε²H, prove `Σ_{k mod aH}|Σ_p(c_p/p)e(kp/(aH))|⁴≤C_(a,ε)/(log H)⁴`, as in TaoLogChowla Lemma 3.7, equation (3.21).

**Checks.**

- If every c_p=0, every Fourier coefficient and the fourth moment equal 0. For a singleton prime p with c_p=1 the sum is aH/p⁴, independent of the phase convention.

*Needs:* native finite Fourier inversion, prime counting and divisibility; §0.5 inclusion–exclusion and finite weighted moment bounds.

**High-height prime phases.** For every fixed B>0 and 0<ε<1/3, prove that there are C>0 and x₀>e such that, for all real x≥x₀ and `2≤|u|≤x^B`, putting `y=exp((log x)^(2/3+ε))` gives `|Σ_{y<p≤x}p^(−1−iu)|≤C`. This is the growing-height analytic target, including the Vinogradov–Korobov high-prime estimate used in MatomakiRadziwill, Lemma 2 proof, physical p.12 (MatomakiRadziwill line 520). It is owned here at every fixed B, rather than inferred by partial summation from an untwisted character estimate. With the supplied reciprocal-prime asymptotic it gives `Σ_{p≤x}(1−cos(u log p))/p≥(1/3−ε)log log x−C′`, uniformly in the same range.

**Checks.**

- At ε=1/12, log y=(log x)^(3/4), so the reciprocal-prime mass of (y,x] is `(1/4)log log x+O(1)`. At log x=64 its main term is (log 64)/4, not (log 64)/3.
- At u=0 the phase sum is the reciprocal-prime mass of (y,x] and diverges; the lower height bound excludes this case.
- Each term in the separation sum is nonnegative. For phase u log p=π it is 2/p, whereas phase zero gives 0; the complex-exponential sign does not change its real part.

*Needs:* native finite prime sums and complex powers; AnalyticNumberTheoryPartI §§0.19, 0.21 for the reciprocal-prime mass. The displayed high-height estimate is the additional analytic target.

**Compact-height Euler comparison.** For every fixed q≥1 and Dirichlet character χ modulo q, prove, uniformly for x≥e² and real t, with `σ=1+1/log x`, that `Re Σ_{p≤x}conj(χ(p))p^(−1−it)=log |L(σ+it,conj χ)|+O(1)`. The error may be chosen absolute: the prime powers of exponent at least two have bounded absolute sum, and the damping error below x and prime tail above x are bounded using reciprocal-prime estimates. For each fixed T>0, deduce `log |L(σ+it,conj χ)|≥−C_(χ,T)` for |t|≤T. Use native nonvanishing on Re s≥1 and compactness; at the principal pole extend the reciprocal analytically by value zero, so no value of L at its pole is asserted. These are the compact-height inputs to TaoLogChowla, the paragraph after Remark 1.6, physical p.6 (TaoLogChowla line 270).

**Checks.**

- At the principal character modulo 1 and t=0 the prime sum and log ζ(σ) both equal log log x+O(1); the sign of log |L| is positive in the comparison.
- For the principal character modulo 2 the omitted p=2 Euler factor changes log ζ(σ+it) by log |1−2^(−σ−it)|, bounded because σ>1. No primitive-character hypothesis is required.
- At σ→1 and t=0 the principal reciprocal tends to 0; boundedness of the reciprocal gives a lower bound for log |L|, not an upper bound near the pole.

*Needs:* native Dirichlet Euler products, `DirichletCharacter.LFunction_ne_zero_of_one_le_re` and the principal-character pole formula; AnalyticNumberTheoryPartI §§0.19, 0.21; native compactness and continuity.

**Uniform character twists of Liouville.** For every fixed q≥1, Dirichlet character χ modulo q and A≥1, prove inf over |t|≤Ax of `Σ_{p≤x}(1−Re(λ(p)conj(χ(p))p^(−it)))/p` tends to infinity, uniformly in that full height interval. The constants and threshold may depend on χ and A. (TaoLogChowla, Theorem 1.2, Corollary 1.5 and the paragraph after Remark 1.6, physical pp.2,5–6; TaoLogChowla line 270.)

Here is a route using high-height prime phases without a growing-height reciprocal-L bound. Fix r≥1 such that χ(p)^r=1 at every p∤q, and put `z_p=λ(p)conj(χ(p))p^(−it)`. For p∤q, `z_p^(2r)=p^(−2rit)` and `1−Re(z_p^(2r))≤4r²(1−Re z_p)`. When 1/r≤|t|≤Ax, apply high-height prime phases with u=2rt, B=2 and ε=1/12; x≥2rA ensures |u|≤x². Removing primes dividing q costs at most `2Σ_{p|q}1/p`, so the required distance sum is at least `(log log x)/(16r²)−C_(χ,A)` for sufficiently large x. For |t|≤1/r, the compact-height Euler comparison instead gives `log log x−C_χ`, since λ(p)=−1. Both ranges have constants independent of t, proving the full infimum statement. The finite order r belongs to the character on units; values at primes dividing q remain zero.

**Checks.**

- At the principal character modulo 1 and t=0 each prime contributes 2/p; replacing λ by 1 gives 0 and fails the conclusion.
- At the principal character modulo 2 and x=3,t=0 the Liouville sum is 1/2+2/3=7/6; replacing λ by 1 leaves 1/2. In general these replacement sums are the bounded sums `Σ_{p|q,p≤x}1/p`.
- At r=1 and z=exp(iπ/3), the powering inequality reads 3/2≤2. For ε=1/12 its resulting logarithmic coefficient is 1/16; a fixed positive r is essential for a positive uniform coefficient.

*Needs:* high-height prime phases and compact-height Euler comparison in this section; AnalyticNumberTheoryPartI §3.18 pretentious distance; native Liouville complete multiplicativity and finite order of a character on the finite unit group.

The logarithmic window and harmonic weights are fixed before the cancellation theorems. Uniform nonpretentiousness supplies the corrected Elliott hypothesis; a weaker ordinary Liouville bound is stated separately.

Define `logCorrelation`. For complex native arithmetic f,g, positive natural slopes a₁,a₂, integer shifts
b₁,b₂ and real x,w, logCorrelation is `[Σ_{floor(x/w)<n≤floor(x)}` f((a₁n+b₁).toNat)g((a₂n+b₂).toNat)/n]/log w.
The range is x/w<n≤x when x≥w≥1. Native zero-extension makes negative/zero linear forms contribute zero; those
finitely many initial terms do not affect limits with log w→∞. No complex conjugation is inserted.
([TaoLogChowla](#references) Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published
Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

Its basic API consists of these facts.

- Swapping both observations and their linear forms preserves the average.
- The average is linear in the first observation for pointwise addition.
- For x≥0 and w=1 the window is empty and the totalized average is 0.

One route uses the exact half-open interval, harmonic weight and logarithmic normalization. Integer shifts use the native
zero-extended arithmetic carrier; positive slopes guarantee eventual positive arguments.

**Checks.**

- For Liouville at forms n,n+1, x=w=2, the value is 1/(2 log 2).

- At x=w=4 the n,n+1 numerator is −1/12, distinguishing harmonic from uniform averaging.

- At x=w=4 identical Liouville forms give numerator 13/12, demonstrating the determinant exclusion.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `ArithmeticFunction.liouville`.

Prove logCorrelation_swap. Swapping the observations and both linear forms leaves the product average
unchanged. ([TaoLogChowla](#references) Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated
published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

*Needs:* §5.2 (harmonic two-point averages).

Prove logCorrelation_add_left. The average is linear in the first observation for pointwise
arithmetic-function addition. ([TaoLogChowla](#references) Theorems 1.2–1.3 and Corollary 1.5, physical
pp.1–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

*Needs:* §5.2 (harmonic two-point averages).

The harmonic Liouville Checks are: the forms n,n+1 give 1/(2 log 2) at x=w=2 and −1/(12 log 4) at x=w=4.

Prove logCorrelation_one_window. When w=1 the summation interval is empty and the totalized average is zero.
([TaoLogChowla](#references) Theorems 1.2–1.3 and Corollary 1.5, physical pp.1–6; collated published
Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

*Needs:* §5.2 (harmonic two-point averages).

Prove `logarithmic_chowla`. For fixed positive slopes a₁,a₂ and integer shifts b₁,b₂ with a₁b₂−a₂b₁≠0, and
1≤w(x)≤x eventually with w(x)→∞, logCorrelation(λ,λ,a₁,a₂,b₁,b₂,x,w(x))→0 as x→∞. This is source Theorem 1.2
with harmonic weighting, not ordinary two-point cancellation on every prefix.
([TaoLogChowla](#references) Theorem 1.2, physical p.2 and Corollary 1.5, pp.5–6; collated published
Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

Apply the corrected logarithmic Elliott theorem to Liouville, consuming uniform character twists of liouville for its full uniform twisted-character nonpretentiousness. Bound the finitely many nonpositive linear-form terms by an absolute
constant and divide by log w.

*Needs:* §5.2 (harmonic two-point averages); Mathlib `ArithmeticFunction.liouville`; Mathlib
`ArithmeticFunction.liouville_apply_mul`; AnalyticNumberTheoryPartI §§3.18, 3.33; AnalyticNumberTheoryPartI §1.5; restricted dirichlet-polynomial mean square;
modulated multiplicative short sums; prime fourier fourth moment.

Prove `logarithmic_elliott_finite`. Fix positive integers a₁,a₂ and integers b₁,b₂ with a₁b₂−a₂b₁≠0. For every ε>0 there is A₀≥1, depending only on ε and these four integers, such that for every A≥A₀, real x≥w≥A and multiplicative complex f,g bounded by one, if

`Σ_{p≤x}(1−Re(f(p)conj(χ(p))p^(−it)))/p ≥ A`

for every Dirichlet character χ of period at most A and every real |t|≤Ax, then

`|Σ_{x/w<n≤x} f(a₁n+b₁)g(a₂n+b₂)/n| ≤ ε log w`.

Nonpositive arguments use the native zero extension; finitely many such terms are absorbed by enlarging A₀. Conjugating all characters permutes the family, so this is the same hypothesis as the source’s convention. (TaoLogChowla, Theorem 1.3, (1.6)–(1.7), physical p.5.)

The proof has the following individually owned inputs, with quantifiers in source order. Propositions 2.1–2.2 reduce to unit-circle completely multiplicative functions, equal positive slope a and fixed nonzero shift h, and to w≤x/log x (TaoLogChowla, Propositions 2.1–2.2, physical pp.8–12). The hierarchy is: fix small ε>0 and a,b,h; choose H₋ large in these; choose finite H₊ sufficiently large in H₋; then choose A sufficiently large in all preceding parameters. All ensuing estimates are uniform in x≥w≥A, w≤x/log x, and H∈[H₋,H₊]. This hierarchy is part of each following contract.

Prove logarithmic_affine_invariance: let n have mass (1/n)/Z on x/w<n≤x, Z the positive harmonic sum. For every η>0 and fixed finite H₊, increasing A makes
`|E[X(n)1_{n≡r (q)}]−q⁻¹E[X(qn+r)]|≤η`
uniformly for |X|≤1, 1≤q≤H₊, and integers |r|≤H₊. The bounded observation is defined on integers so that negative shifts have a domain. Rescale the finite harmonic sums and bound the changed endpoints; Z/log w tends to one uniformly in the stated range. (TaoLogChowla, Lemma 2.5, pp.14–15.)

**Modulated multiplicative short sums.** Prove modulated_short_sum_bound: under the finite character/height hypothesis, for every H in this hierarchy,
`sup_α Σ_{x/w<n≤x} |Σ_{j=1}^H f(n+j)e(jα)|/(Hn) ≤ C(log log H/log H)log w`.
After the affine-invariance transport this gives sup_α `E|Σ_{j=1}^H` f(an+j)e(jα)|=o(H), uniformly over the allowed H. (TaoLogChowla, Proposition 2.4, (2.5)–(2.9), pp.13–15.)

**Checks.**

- For the multiplicative function equal to 1 at n=1 and 0 elsewhere, all sampled f(n+j) with n,j≥1 vanish, so the modulated average is 0. For f=1, the principal character modulo 1 at t=0 gives separation 0, excluding that negative control.

*Needs:* AnalyticNumberTheoryPartI §1.5 mean squares and §3.33 Halász; the finite character/height hypothesis and scale hierarchy in this section.

Define finiteEntropy of a finite-valued random variable as −Σ_v P(X=v)log P(X=v), with 0log0=0, and finiteMutualInformation(X,Y)=finiteEntropy(X)+finiteEntropy(Y)−finiteEntropy(X,Y). Prove the finite chain rule, nonnegativity of mutual information and entropy at most log of the alphabet size. This finite probability API depends only on finite sums, native probability and real logarithms; it is an independent prerequisite of entropy decrement. The measurable-partition and dynamical-entropy constructions use it through the interface under Downstream consumers. ([TaoLogChowla](#references), §3, (3.1)–(3.8), pp.19–20.)

Its basic API has the following statements.

- For a finite nonempty alphabet with atom probabilities pᵢ, entropy is −Σpᵢlog pᵢ, with zero-mass terms equal to 0.
- The finite chain rule expresses joint entropy as marginal entropy plus the probability-weighted conditional entropies, omitting zero-mass conditioning atoms.
- Mutual information is nonnegative and entropy is at most the natural logarithm of the alphabet cardinality.

**Checks.**

- A constant variable has entropy zero

- A fair two-atom law has entropy log 2

- Two independent fair bits have mutual information zero, whereas a fair bit paired with itself has mutual information log 2.

Prove entropy_decrement_scale. Let f,g be the unit-circle completely multiplicative functions in the reduction. For p in P_H={p prime:ε²H/2≤p≤ε²H}, put `M_H=∏_{p∈P_H}p`. Let Y_H=n mod M_H and X_H be the pair of length-H blocks (f(an+j),g(an+j)), quantized on the ε² square mesh by fixed nearest-point choices. Then some integer H∈[H₋,H₊] divisible by a satisfies
`I(X_H,Y_H) ≤ H/(log H·log log log H)`.
All logarithms in this denominator are positive by choosing H₋>exp(exp(exp 1)). Use the finite chain rule, alphabet-size bound O_ε(H), and approximate affine invariance to prove entropy-rate subadditivity with the mutual-information decrement; iterate that inequality over the finite scale interval. (TaoLogChowla, Lemma 3.2, (3.12), pp.21–22.)

Prove entropy_decoupling. Define F_H(X,y) as `Σ_{p∈P_H}c_p` `Σ_{1≤j,j+ph≤H}1_{ay+j≡pb (ap)}X_(1,j)X_(2,j+ph)`, where c_p=conj(f(p)g(p)); thus c_p f(pn)g(p(n+h))=f(n)g(n+h) for positive n,n+h. At the selected scale,
`|E F_H(X_H,Y_H)−E_X [M_H⁻¹Σ_{y mod M_H}F_H(X,y)]| ≤ C_(a,h) ε²H/log H`.
The entropy conditioning bound of Lemma 3.3 controls exceptional residue sets; CRT makes distinct prime residues independent under the uniform law, and the bounded-summand Hoeffding argument of Lemma 3.5 gives exceptional fraction ≤exp(−ε⁷H/log H). Increase H₋ and A to absorb the source’s vanishing errors. This gives (3.16) from (2.17), with every expectation taken in its specified law. (TaoLogChowla, Lemmas 3.3, 3.5 and (3.16), pp.23–26.)

Prove prime_fourier_large_spectrum_bound: for fixed a≥1, h≠0, b and ε, H divisible by a sufficiently large, arbitrary |c_p|≤1, `S_H(α)=Σ_{p∈P_H}(c_p/p)e(pα)`, and
`Ξ_H={ξ mod H: ∃η mod a, |S_H(−(b+h)η/a−hξ/H)|≥ε²/log H}`,
one has |Ξ_H|≤C_(a,h,ε). Apply the prime Fourier fourth-moment target of this section and Markov; each frequency in its finite grid has at most a|h| preimages. (TaoLogChowla, Lemma 3.7, (3.21), p.28.)

Prove elliott_circle_bound: for any two length-H arrays |x_(i,j)|≤1, the absolute value of
`Σ_{p∈P_H}(c_p/p)Σ_{1≤j,j+ph≤H}1_{j≡pb (a)}x_(1,j)x_(2,j+ph)`
is at most `C_(a,h)(H/log H)(ε²+Σ_{ξ∈Ξ_H}H⁻¹|Σ_{j=1}^H x_(1,j)e(−jξ/H)|)`.
*Needs:* finite Fourier inversion and Parseval after periodically extending the arrays; the removed boundary has size O_(a,h)(ε²H/log H). (TaoLogChowla, Lemma 3.6, (3.18)–(3.20), pp.26–27.)

The nonzero initial correlation gives the all-scale lower bound of Proposition 2.6, (2.11), after multiplicativity and affine invariance. Entropy decrement and decoupling preserve a lower bound at one scale. Remove the mesh approximation, paying O_(a,h)(ε²H/log H), to obtain unit-circle arrays for the Fourier estimate. The circle estimate, bounded large spectrum and modulated short-sum estimate contradict it after the hierarchy is chosen. This proves the finite theorem and then the limiting corrected Elliott theorem. The argument retains the coefficients c_p=conj(f(p)g(p)) throughout the lower-bound transport, decoupling and Fourier estimate; the Liouville pair has c_p=1.

**Checks.**

- With f(2)=i and g=1 in the completely multiplicative unit-circle reduction, c₂=−i and c₂f(2)g(4)=1=f(1)g(2); the unconjugated coefficient would give −1. For the Liouville pair c₂=(−1)(−1)=1.

- The constant-one f violates finite nonpretentiousness at the principal character modulo 1 and t=0

- The character periods and the whole |t|≤Ax interval are quantified together

- Independent blocks would give I=0 but are not assumed to model the actual arithmetic blocks.

*Needs:* native finite probability, CRT and Fourier inversion; AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5, 3.18, 3.33; modulated multiplicative short sums; prime fourier fourth moment; the named finite probability and entropy targets above.

Prove `logarithmic_elliott` (corrected logarithmic Elliott). For native complex multiplicative f,g bounded by 1, fixed positive
slopes and distinct nonproportional linear forms, assume: for every fixed Dirichlet character χ and A≥1,
`inf_{|t|≤Ax}Σ_{p≤x}(1−Re(f(p)conj(χ(p))p^(−it)))/p→∞`. Then for every eventually 1≤w(x)≤x with w→∞, the
normalized logarithmic two-point correlation tends to zero. This is Corollary 1.5; divergence for each fixed t
alone is explicitly insufficient. ([TaoLogChowla](#references) Corollary 1.5 and Remark 1.6, physical
pp.5–6; collated published Theorem 2 (p.3), Theorem 3 (p.5) and Corollary 5 (p.6).)

Apply logarithmic_elliott_finite, with characters of bounded period and the
entire |t|≤Ax range. For each ε choose its threshold and apply the stated uniform divergence condition, then
let ε tend to zero. Use the character-distance hypothesis stated above and the entropy-decrement and
modulated short-sum targets of this section.

*Needs:* §5.2 (harmonic two-point averages); Mathlib `ArithmeticFunction.IsMultiplicative`; AnalyticNumberTheoryPartI §§3.18, 3.33; modulated multiplicative short sums; prime fourier fourth moment.

Prove `real_multiplicative_two_point_nontrivial`. Let f be a real native arithmetic function with f(1)=1, f(mn)=f(m)f(n) on positive integers, |f(n)|≤1 for n>0, and f(n₀)<0 for some n₀>0. For every h≥1 there are δ(f,h)>0 and X₀(f,h) such that for X≥X₀, `|Σ_{1≤n≤X}f(n)f(n+h)|≤(1−δ(f,h))X`. (MatomakiRadziwill, Corollary 2, p.3, including its generality clause.) Use the short-interval/sign-change argument with complete multiplicativity; the constants may depend on both f and h.

**Checks.**

- Liouville satisfies the negative-value hypothesis at 2

- The constant positive-one function fails that hypothesis and has normalized correlation 1

- A multiplicative function with f(2^k)=−1 for k≥1 and f(p^k)=1 at odd primes is not completely multiplicative and is excluded.

*Needs:* §5.1 Matomäki–Radziwiłł; AnalyticNumberTheoryPartI §3.33 Halász; native positive-integer complete multiplicativity.

Prove `liouville_two_point_nontrivial`. For each fixed integer h≥1 there are δ(h)>0 and X₀(h) such that for
X≥X₀, `|Σ_{1≤n≤X}λ(n)λ(n+h)|≤(1−δ(h))X`. MR Corollary 2 proves a bound separated from 1; it is not o(X) and is
not an ordinary Chowla theorem. ([MatomakiRadziwill](#references) Corollary 2, physical pp.2–3;
collated published pp.1015–1017,1020–1021.)

Specialize real_multiplicative_two_point_nontrivial to Liouville, using λ(2)=−1. Keep δ
dependent on h; this assertion supplies no explicit uniform formula for δ(h).

*Needs:* §5.1 (inclusive short intervals and prime-block restrictions); Mathlib `ArithmeticFunction.liouville`;
Mathlib `ArithmeticFunction.liouville_apply_mul`.

### 5.3 Outcome-wise multiplicative models and their laws

Construct arithmetic functions from prime observations first, then assume independent prime laws for their expectation identities. Squarefree support distinguishes the Rademacher model from complete multiplicativity.

Define Rademacher prime-sign model. Given a measurable family ξ_p of independent fair signs on a native probability
space, construct for each outcome the native real arithmetic function `R(n)=∏_{p|n}ξ_p` when n is squarefree and
R(n)=0 otherwise, including n=0. R(1)=1. This is the standard squarefree-supported Möbius model, not a
completely multiplicative sign model. ([Harper](#references) Introduction, printed p.2277.)

Its basic API consists of these facts.

- On positive squarefree n the value is the product of its prime signs.
- On nonsquarefree n, including 0, the value is 0; the value at 1 is 1.
- For every outcome the arithmetic function is multiplicative on coprime positive inputs.

Construct the zero hom by the displayed squarefree guard and finite prime-factor product; randomness is in the
supplied independent family. Coprime multiplicativity follows from the native squarefree-product and
prime-factor union laws; no deterministic arithmetic cancellation is inferred.

**Checks.**

- The empty product at one is one.

- The value at four is zero, unlike a completely multiplicative sign model.

- The value at six is ξ₂ξ₃.

*Needs:* Mathlib `ArithmeticFunction`.

Prove that on squarefree n the value is the product of its prime signs.
([Harper](#references) Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

Prove that on nonsquarefree n the value is zero. ([Harper](#references)
Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

Prove that for every outcome the native arithmetic function is multiplicative.
([Harper](#references) Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

Define Steinhaus prime-phase model. Given independent uniform unit-circle prime observations ζ_p, construct
`S(n)=∏_{p|n}ζ_p^(v_p(n))` for n>0 and S(0)=0 in the native complex arithmetic-function carrier. Unlike the
Rademacher squarefree model, S(p²)=ζ_p² and every positive input has unit modulus. ([Harper](#references)
Introduction, printed p.2277.)

Its basic API consists of these facts.

- For each outcome the positive-input arithmetic function is completely multiplicative.
- For a prime p and k≥1 its value at pᵏ is ζₚᵏ.
- Every positive-input value has modulus 1, while the arithmetic extension at 0 is 0.

One route uses the native factorization exponents and the explicit zero extension. Factorization addition gives complete
multiplicativity on positive inputs; zero cases follow from the native guard.

**Checks.**

- The native zero extension gives S(0)=0.

- The empty positive-input product gives S(1)=1.

- S(4)=ζ₂² rather than zero.

*Needs:* Mathlib `ArithmeticFunction`; Mathlib `Nat.prod_primeFactors_pow_factorization`.

Prove that the model is completely multiplicative for every outcome. ([Harper](#references)
Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

Prove that for prime p and k>0, the value at p^k is ζ_p^k. ([Harper](#references)
Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

Prove that unit modulus of prime observations gives unit modulus at every positive input.
([Harper](#references) Introduction, printed p.2277.)

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

**Rademacher covariance**. For independent fair signs on the primes and positive m,n, E[R(m)R(n)]=1 if m=n is
squarefree, and zero otherwise. ([Harper](#references) Printed p.2278, finite moment counting.)

If either input is not squarefree its value vanishes. For squarefree inputs factor the expectation prime by
prime; an odd exponent has zero fair-sign mean, while an even exponent contributes one. Specify the finite
prime marginals by native independent fair-sign laws before taking expectations.

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

**Steinhaus covariance**. For independent unit-circle Haar phases at primes and positive m,n,
E[S(m)conj(S(n))]=1 if m=n and zero otherwise. ([Harper](#references) Printed p.2278, finite moment counting.)

Factor the finite expectation over the prime support of mn, with conjugation on the second factor. Haar phase
integration annihilates every nonzero exponent difference; unique factorization identifies the diagonal.
Specify independent Haar probability on unit-circle prime observations before taking expectations.

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

**Finite random-model second moments**. For N≥1 the Rademacher partial sum over 1≤n≤N has second moment equal
to #{n≤N:squarefree n}; the Steinhaus partial sum has absolute-square second moment N. These identities are
model expectations and imply no deterministic Möbius/Liouville cancellation. ([Harper](#references) Printed
p.2278, finite diagonal counting.)

Expand the finite sum square and use linearity of expectation. Insert the separate covariance formulas and sum
the surviving diagonal terms. Use the corresponding independent prime law for each model.

*Needs:* §5.3 (outcome-wise multiplicative models and their laws).

### Examples

At h=1, the short mean is f(x)+f(x+1), not their average; at h=0 Lean's total division
makes it zero. For the arithmetic function equal to one on positive integers and zero at
zero, x≥1 gives short mean (h+1)/h when h>0. This pins the inclusive convention before
the exceptional-set theorem is used.

For λ and the forms n,n+1 with x=w=2, the numerator of the harmonic sum is 1/2 and the
normalized correlation is 1/(2log 2). With x=w=4 the numerator is −1/12. With identical
forms n,n the numerator at x=w=4 is 1/2+1/3+1/4=13/12, so no cancellation conclusion
can omit the determinant condition. At w=1 the summation interval is empty and the totalized expression is zero.
There is no conjugation between the two observations in the definition.

Outcome-wise Rademacher functions satisfy R(1)=1 and R(4)=0, whereas a completely
multiplicative extension with prime sign −1 would have value 1 at 4. A Steinhaus outcome
satisfies S(4)=ζ₂² and S(12)=ζ₂²ζ₃, so it retains prime multiplicity. Its prime law is
uniform on the unit circle; arbitrary bounded phases cannot replace that law in the
orthogonality theorem. Fair independent Rademacher signs give `E|Σ_{n≤X}R(n)|²` equal to
the number of squarefree positive n≤X; Steinhaus phases give exactly floor X. These are
random-model identities and assert no deterministic Möbius or Liouville cancellation.

### Dependencies

AnalyticNumberTheoryPartI §§0.19, 0.21 supplies prime-block counts and products, §1.5 the unrestricted Dirichlet-polynomial mean square, and §§3.18, 3.33 pretentious distance and Halász estimates. The restricted-prime mean values, long-mean stability, uniform Liouville twists, modulated short sums and prime restriction fourth moment are the local targets of §§5.1–5.2; the growing-valuation comparison and divisor-bounded mean are §§0.13 and 3.7. The random-model
construction uses native product probabilities and finite prime-factorization, with Layer 0
as the finite-law interface. No general Chowla or Sarnak conjecture is assumed as a theorem.

## Downstream consumers

The foundational interface for ArithmeticDynamics §§2.6–2.7 consists of `birkhoff_pointwise` from §4.1, with its invariant conditional-expectation limit, `birkhoff_pointwise_ergodic` from §4.1, and the independent finite Shannon API of §5.2. For a finite measurable partition (Pᵢ) of a probability space, the label variable X(x)=i for x∈Pᵢ has masses μ(Pᵢ); hence its Shannon entropy is `−Σ_i μ(Pᵢ)log μ(Pᵢ)`, and the pair of label variables represents the join. This supplies finite partition entropy and its chain rule without a dependence on entropy decrement, logarithmic Chowla or the other number-theoretic applications.

Arithmetic applications may consume Hardy–Ramanujan and Erdős–Kac as probability-law statements, with the exact normalization and the ω/Ω transfer. Koymans–Pagano's restricted squarefree family consumes the separate conditional window estimate. Equidistribution applications use the native torus, character and subtorus interfaces; normal digits consume the pointwise theorem through the expanding-circle bridge. Metric approximation applications consume both the unrestricted and reduced limsup conventions and the precise power or general-gauge Hausdorff conclusion. Continued-fraction applications use the native denominators, the single digit indexing convention, the logarithmic constants and the explicit Gauss–Kuzmin rate. GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5 and AdelicAlgebraicGroups AA.2–AA.3 supplies the generic homogeneous structures, and the local bounded_partial_denominators_iff_badlyApproximable supplies the bounded-digits characterization using the predicate from DiophantineApproximationAndTranscendence §0.6; the number-theoretic consumers remain in Layer 4. Multiplicative applications may use the proved short-interval and logarithmic estimates. Nilsequence orthogonality is outside this roadmap; neither ordinary Chowla cancellation nor general Sarnak orthogonality follows from the random-model identities.

## References

The locators above use the linked author, preprint or published version. Page numbers refer to the source's printed numbering unless a physical PDF page is specified. Web notes are located by their named exercise, theorem or section.

- **TAO-RESIDUES** — Terence Tao, [254A, Supplement 4: Probabilistic models and heuristics for the primes (optional)](https://terrytao.wordpress.com/2015/01/04/254a-supplement-4-probabilistic-models-and-heuristics-for-the-primes-optional/). Author web exposition dated 4 January 2015

- **ML-ARITH** — Mathlib contributors, [Mathlib arithmetic functions and prime-factor counting](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/ArithmeticFunction/Defs.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **ML-COUNT** — Mathlib contributors, [Mathlib counting of positive multiples](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Nat/Factorization/Basic.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **ML-PRIME** — Mathlib contributors, [Mathlib natural prime and least-common-multiple arithmetic](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Nat/Prime/Basic.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **TC-EMP** — The Tau Ceti contributors, [Empirical measures of sequences](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Probability/Process/EmpiricalMeasure.lean). a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039

- **ML-UNIFORM** — Kexing Ying and Bhavik Mehta, [Classical probability: uniformOn](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/UniformOn.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **ML-FINITE-PRODUCT** — Mathlib contributors, [Mathlib finite coprime products and subset expansions](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/BigOperators/Ring/Finset.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **GS-SIEVING** — Andrew Granville and K. Soundararajan, [Sieving and the Erdos-Kac theorem](https://dms.umontreal.ca/~andrew/PDF/ErdosKac.pdf). Author typeset copy with 2006 footer and internal pages 1-13; related published chapter in Equidistribution in Number Theory, An Introduction (2007), pp.15-27, DOI 10.1007/978-1-4020-5404-4_2. The author copy is not identified as the version of record.

- **ML-MOMENT-TOOLS** — Mathlib contributors, [Pinned finite-moment and power-estimate suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/Distributions/Bernoulli.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **ML-MULTINOMIAL** — Mathlib contributors, [Pinned multinomial and fixed-support counting suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Nat/Choose/Multinomial.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **TC-GAUSSIAN-MOMENTS** — The Tau Ceti contributors, [Existing real Gaussian centered moments](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Probability/Distributions/Gaussian/Moments.lean). a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039

- **ML-CUTOFF-TOOLS** — Mathlib contributors, [Pinned prime-cutoff, logarithmic and finite moment-transfer suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/NumberTheory/PrimeCounting.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **TAO-PRIME-FACTORS** — Terence Tao, [254A, Notes 1: Elementary multiplicative number theory](https://terrytao.wordpress.com/2014/11/23/254a-notes-1-elementary-multiplicative-number-theory/). Author web exposition dated 23 November 2014.

- **ML-EXCESS-TOOLS** — Mathlib contributors, [Pinned repeated-prime-factor and finite comparison suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Nat/Factorization/Basic.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **TAO-CLT-2010** — Terence Tao, [254A, Notes 2: The central limit theorem](https://terrytao.wordpress.com/2010/01/05/254a-notes-2-the-central-limit-theorem/). Author web exposition dated 5 January 2010.

- **ML-ARITHMETIC-LIMITS** — Mathlib contributors, [Pinned probability-law and weak-convergence suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/MeasureTheory/Measure/LevyConvergence.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **ML-EXCESS-MOMENTS** — Mathlib contributors, [Pinned finite geometric, exponential and CRT suppliers](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Complex/Exponential.lean). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **TAO-HOFA-1.1** — Terence Tao, [Higher order Fourier analysis, Section 1.1: Equidistribution of polynomial sequences in tori](https://terrytao.wordpress.com/wp-content/uploads/2012/12/gsm-142-tao7-higher-book-05june2012.pdf). Graduate Studies in Mathematics 142, American Mathematical Society, 2012; author's preliminary version of 5 June 2012, available with the publisher's permission, linked from the author's book page.

- **KM-2020** — Dimitris Koukoulopoulos and James Maynard, [On the Duffin–Schaeffer conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n1-p05-s.pdf). Annals of Mathematics 192 (2020), no. 1, 251–307, doi:10.4007/annals.2020.192.1.5, publisher PDF (printed page = PDF page + 250).

- **BSKK2023** — Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma, [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3 (2023)

- **KoymansPagano2022** — Peter Koymans and Carlo Pagano, [On Stevenhagen's conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv:2201.13424v1 (2022)

- **ElsholtzTao2011** — Christian Elsholtz and Terence Tao, [Counting the number of solutions to the Erdős–Straus equation on unit fractions](https://terrytao.wordpress.com/wp-content/uploads/2011/07/egyptian-count13.pdf). Author manuscript, egyptian-count13 (2011)

- **Sarig2023** — Omri Sarig, [Lecture Notes on Ergodic Theory](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf). Author notes, 3 April 2023

- **SarigTransfer** — Omri Sarig, [Introduction to the transfer operator method](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf). HMI/Bonn author lecture notes (2020 file)

- **Smyth2020** — Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth, [Ergodic Theory with Applications to Continued Fractions](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf). UNCG summer school, 18–22 May 2020, final author notes

- **StrauchPorubsky2018** — Oto Strauch and Štefan Porubský, [Distribution of Sequences: A Sampler](https://musavsrv.mat.savba.sk/musav/O_Strauch-S_Porubsky_Distribution_of_Sequences_A_Sampler-20180118.pdf). Author-hosted version dated 18 January 2018

- **BeresnevichVelani** — Victor Beresnevich and Sanju Velani, [A Mass Transference Principle and the Duffin–Schaeffer conjecture for Hausdorff measures](https://annals.math.princeton.edu/wp-content/uploads/annals-v164-n3-p06.pdf). Annals of Mathematics 164 (2006), 971–992, version of record

- **MatomakiRadziwill** — Kaisa Matomäki and Maksym Radziwiłł, [Multiplicative functions in short intervals](https://arxiv.org/pdf/1501.04585v4). arXiv:1501.04585v4, 15 October 2017

- **TaoLogChowla** — Terence Tao, [The logarithmically averaged Chowla and Elliott conjectures for two-point correlations](https://arxiv.org/pdf/1509.05422v4). arXiv:1509.05422v4, 29 July 2016

- **ML-PM79** — Mathlib contributors, [Pinned native metric probability interfaces](https://github.com/leanprover-community/mathlib4/tree/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib). 6b7abb3c7686292736be2955bd3eb9ebf63b456a

- **Harper** — Adam J. Harper, [Moments of random multiplicative functions, II: High moments](https://msp.org/ant/2019/13-10/ant-v13-n10-p02-s.pdf). Algebra & Number Theory 13:10 (2019), 2277–2321, version of record

- **Sarnak** — Peter Sarnak, [Three Lectures on the Möbius Function, Randomness and Dynamics, Lecture 1](https://publications.ias.edu/sites/default/files/MobiusFunctionsLectures%282%29.pdf). IAS author lecture notes, 2010/2011

- **Kubilius2021** — Louis H. Y. Chen, Arturo Jaramillo and Xiaochuan Yang, [A generalized Kubilius–Barban–Vinogradov bound for prime multiplicities](https://arxiv.org/pdf/2111.07361v1). arXiv:2111.07361v1,14 November2021

- **Sun2017** — Peng Sun, [A Generalization of Gauss-Kuzmin-Lévy Theorem](https://arxiv.org/pdf/1705.02921v2). arXiv:1705.02921v2, 9 November 2017; version of record Acta Mathematica Scientia 38(3) (2018), 965–972

- **Gorodnik2010** — Alexander Gorodnik, [TIFR lectures on homogeneous dynamics, Lecture 1](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf). Author course notes, Mumbai 2010, scanned lecture1.pdf

- **Koukoulopoulos2019** — Dimitris Koukoulopoulos, *The Distribution of Prime Numbers*, 2019, Theorems 13.2 and 14.2 (p.145); cited by locator.
- **Kubilius1964** — Jonas Kubilius, *Probabilistic Methods in the Theory of Numbers*, 1964, small-prime valuation comparison; cited by locator.
- **RS1962** — J. Barkley Rosser and Lowell Schoenfeld, *Approximate formulas for some functions of prime numbers*, 1962, Theorem 5; cited by locator.
- **Falconer1990** — Kenneth Falconer, *Fractal Geometry: Mathematical Foundations and Applications*, 1990, Proposition 1.7; cited by locator.
- **PollingtonVaughan1990** — A. D. Pollington and R. C. Vaughan, *The k-dimensional Duffin and Schaeffer conjecture*, Mathematika 37 (1990), 190–200, DOI 10.1112/S0025579300012900, divergence theorem and proof; cited by locator.
- **Rogozin1961a** — B. A. Rogozin, *An estimate of the concentration functions*, 1961, concentration inequality; cited by locator.
- **Rogozin1961b** — B. A. Rogozin, *On the increase of dispersion of sums of independent random variables*, 1961, concentration inequality; cited by locator.
