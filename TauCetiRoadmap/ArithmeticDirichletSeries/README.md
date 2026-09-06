# Roadmap: arithmetic Dirichlet series and Tauberian methods

This roadmap develops the analytic infrastructure shared by zeta functions, Hecke L-functions,
Chebotarev density, and explicit prime-counting arguments. It starts from arithmetic functions on
the nonzero ideals of a number field, regroups them by norm into Mathlib's `ArithmeticFunction`
and `LSeries` APIs, builds local Euler factors and Euler products, and ends with Landau-type
positivity, Perron summation,
Dirichlet-density calculus, Wiener–Ikehara, and generic prime-number-theorem transfer.

The roadmap owns no completed L-function, Hecke character, Frobenius class, Chebotarev theorem, or
zero-free region. Those objects have separate owners. The purpose here is that each downstream
roadmap uses the same ideal weight, prime carrier, density predicate, summation convention, and
Tauberian theorem.

Suggested home: `TauCeti/NumberTheory/ArithmeticDirichletSeries/`, with one file per layer and a
small `Basic.lean` exporting the declarations in the contract table below.

---

## Scope and boundaries

### Owned here

- general arithmetic functions on nonzero integral ideals and their canonical zero extension;
- completely multiplicative ideal weights as a special case;
- regrouping ideal-indexed sums by absolute norm into Mathlib `LSeries`;
- ideal convolution, logarithmic derivatives, local factors, and ideal-indexed Euler products;
- nonzero prime-ideal carriers and locally finite weighted counting functions;
- Abel–Stieltjes and Perron summation with fixed endpoint conventions;
- Dirichlet density, one-sided density bounds, finite-error invariance, squeeze, and fibre counts;
- reusable Landau positivity and Wiener–Ikehara theorems;
- the generic passage from von Mangoldt asymptotics to `ψ`, `ϑ`, and `π` asymptotics.

### Consumed

Mathlib supplies `Ideal`, `Ideal.absNorm`, unique factorization of nonzero ideals,
`IsDedekindDomain.HeightOneSpectrum`, `ArithmeticFunction`, `EulerProduct`, `LSeries`, filters and
asymptotics, interval integration, and `Mathlib/NumberTheory/AbelSummation.lean`. Mathlib master
also supplies `NumberField.Set.primeIdealZetaSum`, `NumberField.Set.HasDirichletDensity`, and
`NumberField.Set.dirichletDensity` in
`Mathlib/NumberTheory/NumberField/DirichletDensity.lean`. The repository pin predates that file;
updating the pin to a revision containing it is the first task of Layer 7. This roadmap extends
those objects and does not wrap competing series, convolution, Euler-product, Abel-summation, or
density APIs around them.

### Not owned here

- analytic-normalized completed L-function data, continuation, gamma factors, and functional
  equations (`LFunctions`);
- moduli, ray class groups, and Hecke-character carriers (`GlobalNumberFields`);
- arithmetic Frobenius and ideal Artin maps (`NumberFieldArithmetic`);
- Frobenius prime sets and Chebotarev (`Chebotarev`);
- zero counting, zero-free regions, explicit formulas, and effective estimates
  (`ZerosOfLFunctions`).

The boundary is theorem-level. A downstream roadmap may specialize a declaration below, but it
does not redefine the carrier under a domain-specific name.

`MultiplicativeIdealWeight` is the completely multiplicative degree-one carrier with finite zero
support. `UnitaryIdealWeight` is its unit-modulus subtype away from that support. Neither is the
coefficient carrier of an arbitrary Euler product: higher-dimensional Artin coefficients require
separate prime-power local data. Arbitrary complex norm twists land in the general carrier; only
purely imaginary twists preserve the unitary subtype.

---

## Pinned conventions

| Subject | Convention |
|---|---|
| ideal arithmetic functions | The primary carrier is a function on `(Ideal (𝓞 K))⁰`, so convolution never asks for a factorization of `⊥`. Its canonical extension to all ideals is `0` at `⊥`. |
| ideal weights | `MultiplicativeIdealWeight` uses Mathlib's `Ideal (𝓞 K) →*₀ ℂ` vocabulary and finite zero support. `UnitaryIdealWeight` adds modulus `1` away from that support. Both send `⊥` to `0`; neither carries arbitrary local reciprocal polynomials. |
| norm coefficients | `normCoeff` lands in `ArithmeticFunction ℂ`, so its `n = 0` coefficient is definitionally controlled by Mathlib's carrier. |
| prime carrier | A prime is `IsDedekindDomain.HeightOneSpectrum (𝓞 K)`, not an arbitrary ideal with a later proof that it is nonzero and prime. |
| density | `HasDirichletDensity S δ` is the limit of `P_S(s) / P_all(s)` as `s → 1⁺`; `HasNaturalDensity S δ` is the analogous ratio of prime-counting functions as `x → ∞`. Normalization by `log (1/(s-1))` is a theorem after the all-prime asymptotic, not the definition. |
| cutoffs | Weighted counts include norm exactly equal to `x`. Natural-number and real cutoffs are connected by named lemmas. |
| Abel summation | Finite identities use half-open intervals chosen so a boundary term is counted exactly once. |
| Perron | For the real parameterization `s = c + it`, the prefactor is `(2π)⁻¹` because `ds = i dt`. The finite-height kernel at `x = 1` is `π⁻¹ arctan(T/c)`; `1/2` is only its limit. Arithmetic applications either exclude a norm endpoint or state the half-weight limit. |
| logarithmic derivatives | Prime powers are part of the coefficient. Removing higher powers is a later estimate, never a definitional simplification. |

The zero-ideal and Perron endpoint tests are required worked examples. They prevent two errors
that otherwise survive every coprimality-guarded or off-endpoint theorem.

---

## Export contract

| Object or theorem | Layer | Required declaration | Contract |
|---|---:|---|---|
| ideal arithmetic function | 0 | `IdealArithmeticFunction`, `zeroExtend` | function on `(Ideal (𝓞 K))⁰` and canonical extension by zero at `⊥` |
| multiplicative ideal weights | 0 | `MultiplicativeIdealWeight`, `UnitaryIdealWeight` | general completely multiplicative carrier and its unitary subtype; arbitrary versus imaginary norm twists have distinct codomains |
| coefficient by norm | 1 | `normCoeff` | an `ArithmeticFunction ℂ`, formed by finite norm fibres |
| trivial-weight abscissa | 5 | `idealCount_linearBounds`, `abscissaOfAbsConv_normCoeff_one` | the exact value `1`, derived noncircularly from two-sided linear ideal counts after Layer 5 |
| regrouping | 1 | `regroupByNorm` | ungrouped absolute convergence implies grouped convergence and equality; converse needs ideal-summand nonnegativity/no cancellation |
| convolution | 2 | `IdealArithmeticFunction.convolution`, `normCoeff_convolution` | convolution on nonzero ideals, transported to Mathlib Dirichlet convolution |
| Euler-product package | 3 | `EulerProductData` | stores coprime multiplicativity explicitly and extends Mathlib `ArithmeticFunction.eulerProduct` and `EulerProduct` with ideal local factors |
| nonzero prime Dirichlet sum | 7 | `NumberField.Set.primeIdealZetaSum` | consume Mathlib's `HeightOneSpectrum`-indexed definition directly |
| weighted prime counts | 5 | `primeTheta`, `primeCount` | inclusive real cutoff and conversion to natural cutoffs |
| density predicates | 7 | `NumberField.Set.HasDirichletDensity`, `HasNaturalDensity`, `IsLowerDirichletDensityBound`, `IsUpperDirichletDensityBound` | extend Mathlib's ratio-normalized density; the latter two names denote bounds, not nonunique “densities” |
| density conversions | 7 | `hasDirichletDensity_of_upperBound_of_lowerBound`, `hasDirichletDensity_of_hasNaturalDensity` | agreement of matching bounds and the one-way natural-to-Dirichlet implication |
| Abel summation | 6 | `sum_mul_eq_sub_sub_integral_mul`, norm-indexed corollaries | consume Mathlib's exact identity and add only the Stieltjes/asymptotic bridges |
| Perron summation | 6 | `truncatedPerronKernel`, `perronFormula` | the visible finite-height kernel, its endpoint value and error estimate, and a separate arithmetic summatory form |
| cancellation and continuation | 6 | `HasCancellation`, `continuedLFunctionOfWeight` | a named continuation into the strip supplied by the ideal partial-sum estimate |
| Landau positivity | 8 | `landau` | singularity at the finite, actual abscissa for nonnegative coefficients |
| Wiener–Ikehara | 9 | `wienerIkehara`, `wienerIkehara_zero` | nonnegative residue, `LSeriesHasSum` on `Re s > 1`, a continuous boundary remainder on `Re s ≥ 1`, and an explicit zero-residue case |
| generic PNT transfer | 10 | `PrimeBoundaryRemainder`, `primePsi`, `primePsi_asymptotic_of_boundary`, `primeNumberTheoremTransfer` | exact boundary input, then `ψ`, prime-power removal to `ϑ`, and Abel transfer to `π` |

Consumers are `LFunctions`, `Chebotarev`, and `ZerosOfLFunctions`. Their contract tables name
these declarations rather than prose such as “the density lemmas” or “a Tauberian theorem.”

---

## The build, in layers

### Layer 0: arithmetic functions on nonzero ideals

**0.1 The general carrier.** Define `IdealArithmeticFunction K` as a complex-valued function on
`(Ideal (𝓞 K))⁰`. Define its canonical `zeroExtend` to all integral ideals and prove that the
extension is zero exactly at `⊥` when the original function has no zero values. All divisor sums
and factorizations in Layers 0–3 use this nonzero carrier, so the infinitely many formal
factorizations `⊥ · J = ⊥` never enter convolution.

**0.2 The completely multiplicative specializations.** Define `MultiplicativeIdealWeight K`
using Mathlib's `Ideal (𝓞 K) →*₀ ℂ` vocabulary, with a finite set of bad height-one primes and
value zero on it. Define `UnitaryIdealWeight K` as the subtype having unit norm away from the bad
set. The zero-ideal law is inherited from `map_zero`. State explicitly that these degree-one
carriers exclude the Möbius function and coefficient systems whose prime powers are independent
local-polynomial data.

**0.3 Constructors and operations.** Build the trivial weight, conjugation, pointwise product,
restriction away from a finite prime set, norm twists, and finite-order weights. Finite-order
Hecke characters land in `UnitaryIdealWeight`. An arbitrary twist
`I ↦ χ(I) N(I)^{-z}` lands in `MultiplicativeIdealWeight`; the imaginary twist with `Re z = 0`
preserves `UnitaryIdealWeight`. Supply both maps to `IdealArithmeticFunction`, and prove
functoriality under a number-field equivalence. Keep pointwise multiplication separate from ideal
convolution.

**0.4 The zero-ideal rejection test.** Show that an everywhere-one function on all ideals cannot
be the zero extension of an `IdealArithmeticFunction` and cannot underlie either ideal-weight
carrier: Mathlib's `→*₀` carrier forces its value at `⊥` to be zero. Also prove that a twist with
`Re z ≠ 0` fails the unitary modulus condition on every good ideal of norm greater than one.

*Prerequisites:* Mathlib `Ideal`, `HeightOneSpectrum`, finite sets, unique factorization.

### Layer 1: norm fibres and Mathlib `LSeries`

**1.1 Finite norm fibres.** Consume Mathlib's existing ideal-counting and finite-norm-fibre
declarations. Define `normCoeff f : ArithmeticFunction ℂ` by summing a general
`IdealArithmeticFunction` over the nonzero ideals of absolute norm `n`. Prove its values at `0`
and `1`, compatibility with conjugation, general versus imaginary norm twists, and field
equivalence. There is deliberately
no pointwise-product formula: even the trivial weight over `ℚ(i)` has two ideals of norm `5`, so
the coefficient of the pointwise product is `2`, not `2 · 2`.

**1.2 Regrouping.** Prove `regroupByNorm`: absolute convergence of the series indexed by nonzero
ideals implies `LSeriesSummable (normCoeff f) s` and equality with its sum. Consequently the
grouped absolute-convergence abscissa is at most the ideal-indexed boundary. State a converse or
equality only under nonnegativity (or another no-cancellation hypothesis) for every individual
ideal summand; nonnegative grouped coefficients alone do not suffice.

**1.3 The trivial specialization.** For the trivial unitary weight, identify `normCoeff` with the
named Dedekind-zeta coefficient away from the zero slot. At `K = ℚ`, prove the coefficient is `1`
for every positive integer. Do **not** claim the exact abscissa here: its convergence and divergence
inputs are established only in Layer 5.

*Prerequisites:* Layer 0; Mathlib `LSeries`, `Ideal.finite_setOf_absNorm_eq`.

### Layer 2: convolution and logarithmic derivatives

**2.1 Ideal convolution.** Define convolution on `IdealArithmeticFunction K` by the finite
factorizations `BC = A` of a nonzero ideal. Its codomain is again `IdealArithmeticFunction K`, so
associativity, commutativity, the delta identity, distributivity, and iterated convolution are
actual typed statements. Prove `normCoeff_convolution`, identifying it with multiplication in
Mathlib's `ArithmeticFunction ℂ` (Dirichlet convolution).

**2.2 Möbius inversion.** Define the ideal Möbius function as an `IdealArithmeticFunction`, prove
the expected prime-power values, and make it the convolution inverse of the constant-one function
on nonzero ideals. It is multiplicative on coprime ideals but belongs to neither ideal-weight
carrier: `μ(𝔭²) = 0` rules out complete multiplicativity. Export both the positive multiplicativity
statement and the rejection theorem.

**2.3 Von Mangoldt transform.** Define the ideal von Mangoldt weight and the transform attached to
a weight. Prove support on prime powers and the exact coefficient identity for the logarithmic
derivative of an Euler product on its absolute-convergence half-plane.

### Layer 3: local factors and Euler products

**3.1 Local data.** Extend Mathlib's `ArithmeticFunction.ofPowerSeries`,
`ArithmeticFunction.eulerProduct`, and `EulerProduct` APIs. `EulerProductData` explicitly stores
the coprime-multiplicativity proof for its `IdealArithmeticFunction`, as well as the prime-power
local series, finite bad set, and hypotheses needed to transport the ideal product through
`normCoeff`. A bare ideal arithmetic function has no Euler product. Supply extensionality,
restriction, product, conjugation, and trivial-weight instances without introducing a second
generic Euler-product framework.

**3.2 Finite products first.** Prove the factorization of a coefficient over the prime-power
factorization of a nonzero ideal and the equality for Euler products over a finite set of primes.

**3.3 Infinite Euler product.** Under absolute convergence, pass to the directed limit of finite
prime sets and identify the product with `LSeries (normCoeff f)`. State nonvanishing only where
absolute convergence of the reciprocal product proves it.

**3.4 Logarithm and derivative.** On a simply connected zero-free region, choose a logarithm and
prove both the prime-power logarithmic expansion and its derivative. Do not apply the principal
complex logarithm to an arbitrary Euler product.

### Layer 4: counting carriers and local finiteness

**4.1 Prime and ideal cutoff subtypes.** Package ideals and height-one primes with
`absNorm ≤ x`. Prove finiteness, monotonicity, equivalence of real and natural cutoffs, and the
empty small-cutoff cases.

**4.2 Generic summatory functions.** For nonnegative real weights define inclusive summatory
functions on ideals, prime ideals, and prime powers. Prove additivity, monotonicity, and invariance
under modification on a finite set.

**4.3 `primeTheta` and `primeCount`.** Define the logarithmically weighted and unweighted counts
for a set of height-one primes. Prove finite-union and finite-symmetric-difference lemmas.

### Layer 5: ideal and prime estimates

**5.1 Crude norm-fibre bounds.** Establish reusable polynomial bounds for ideal counts and the
number of prime powers at most `x`. The point is convergence and error control, not a best constant.
Package positive two-sided linear bounds for the total ideal count as `IdealCountingLinearBounds`
and export `idealCount_linearBounds`.

**5.1a Exact trivial abscissa.** After the two-sided bounds are available, prove
`abscissaOfAbsConv_normCoeff_one = 1`: the upper bound proves convergence for `Re(s)>1`, while the
positive lower bound proves divergence at `s=1`. This proof must not use continuation or the pole
of Dedekind zeta from downstream #248.

**5.2 Higher prime powers.** Prove the generic `O(√x log² x)` estimate under the standard
logarithmic prime-power weight. Isolate the hypotheses needed for other arithmetic weights.

**5.3 Degree-above-one primes.** For primes of a number field over rational primes, prove the
standard convergence and density-zero statements for residue degree greater than one. Chebotarev
uses this when moving between a field and a fixed subfield.

### Layer 6: Abel and Perron summation

**6.1 Abel summation.** Extend `Mathlib/NumberTheory/AbelSummation.lean`, in particular the
existing `sum_mul_eq_sub_sub_integral_mul` and zero-coefficient variants, from ordinary
arithmetic functions to the norm-indexed and Stieltjes corollaries needed here. Do not restate
Mathlib's finite summation-by-parts theorem under a new name. Keep the inclusive cutoff and
boundary term fixed by the conventions table.

**6.2 Standard transfers.** Derive `ϑ(x) ∼ δx ⟹ π(x) ∼ δ Li(x)` and
`Li(x) ∼ x/log x`, including the zero-density and `δ = 0` cases.

**6.3 Truncated Perron.** For `x > 0`, `c > 0`, and `T ≥ 1`, parameterize the vertical segment by
`s = c + it`. The real-`t` integral has prefactor `(2π)⁻¹`, since the `i` from `ds = i dt`
cancels the `i` in `(2πi)⁻¹`. Define the visible finite-height value as
`truncatedPerronKernel x c T`. Prove that this kernel is a smoothed step plus an error with a
proved universal constant, rather than hard-coding an unchecked constant or identifying it with
the sharp summatory function. Prove separately that the exact value at `x = 1` is
`π⁻¹ arctan(T/c)` and tends to `1/2`.

**6.4 Arithmetic Perron.** Interchange the integral with an absolutely convergent `LSeries` and
obtain a truncated summatory formula. State both the off-norm form and the limiting half-weight
form. `ZerosOfLFunctions` consumes this theorem for explicit formulas.

**6.5 Cancellation and a named continuation.** Define `HasCancellation χ` by the uniform
`O(X^(1-1/[K:ℚ]))` bound for ideal partial sums. Use Abel summation to construct
`continuedLFunctionOfWeight χ` for `χ : UnitaryIdealWeight K`, prove agreement with the
norm-regrouped series on `Re s > 1`,
and analyticity on `Re s > 1-1/[K:ℚ]`. Finiteness of a coefficient quotient is not a substitute:
the prime values of a finite quotient of the free ideal group can be arbitrary. Export good-ideal,
conjugation, pointwise-square, and imaginary norm-twist operations used by character-family
consumers; general complex norm twists remain in `MultiplicativeIdealWeight`. A good ideal
explicitly excludes `⊥`, even when the bad set is empty.

### Layer 7: Dirichlet density

**7.1 Adopt the Mathlib API.** Update the repository pin to include
`Mathlib/NumberTheory/NumberField/DirichletDensity.lean` and use
`NumberField.Set.primeIdealZetaSum`, `NumberField.Set.HasDirichletDensity`, and
`NumberField.Set.dirichletDensity` directly. Add finite-error, union, squeeze, normalization, and
contraction lemmas in the same namespace. Do not duplicate the sum, predicate, or junk-valued
density. Define `IsLowerDirichletDensityBound S δ` and `IsUpperDirichletDensityBound S δ` for the
epsilon inequalities used by squeeze arguments; these are deliberately called *bounds*. Actual
lower and upper densities, if needed, are liminf and limsup values and are unique.

**7.2 The all-prime normalization.** From the Dedekind Euler product and bounded higher-prime-
power contribution, prove
`P_all(s) = log(1/(s-1)) + O(1)`. The Dedekind-zeta residue alone is not enough; the Euler product
is a prerequisite. Deduce equivalence with logarithmic normalization.

**7.3 Calculus.** Prove finite-set density zero, invariance under finite symmetric difference,
monotonicity, complements, finite disjoint unions, and squeeze as extensions of Mathlib's API.
Use Layer 6's Abel-summation interface for the implication from natural to Dirichlet density, and
retain the exact all-prime denominator hypothesis
`AllPrimeDirichletDenominatorAsymptotic K` (or the accepted Mathlib theorem supplying it) in the
Lean-facing bridge. Natural density alone does not silently supply this normalization.

**7.4 Fibre counts.** If a locally finite map of prime carriers has constant finite fibre size
away from a density-zero exception, relate the two prime sums and densities. State the variant
where fibres are counted only after intersecting with residue-degree-one primes.

### Layer 8: Landau-type positivity

**8.1 Landau's theorem.** For a Dirichlet series with nonnegative real coefficients, assume the
Mathlib equality `LSeries.abscissaOfAbsConv a = (σ : EReal)`. Prove that the real point `σ` is a
singularity of every analytic continuation from `Re s > σ`. The equality both makes `σ` the
actual boundary and records finiteness; mere convergence throughout `Re s > σ` is insufficient.
Record the equality between ordinary and absolute abscissae used for nonnegative coefficients,
then derive the meromorphic-order corollary needed by nonvanishing arguments.

**8.2 Positive combinations.** Package the `3-4-1` trigonometric nonnegativity argument as a
finite nonnegative coefficient combination, keeping analytic input separate from the positivity
lemma. `LFunctions` supplies character-specific continuation and applies this package.

The package does not assert cancellation for the trivial weight or its nonzero norm twists. Their
partial sums have linear size and their series are shifted Dedekind zeta functions with a pole;
this is the required rejection test for downstream character-family hypotheses.

### Layer 9: Wiener–Ikehara

**9.1 Boundary formulation.** Let `a n ≥ 0` and require
`LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s)` for every `s` with `Re s > 1`. Assume there is a
separately named continuous function `G` on `Re s ≥ 1` agreeing on the open half-plane with
`F(s) - κ/(s-1)`, with the residue hypothesis `0 ≤ κ`. Conclude
`x⁻¹ ∑_{n≤x} a n → κ`, and export the `κ = 0` case explicitly. The `LSeriesHasSum` hypothesis is essential:
Mathlib's totalized `LSeries` is zero at nonsummable inputs.

The hypothesis is deliberately not continuity of the displayed subtraction at `s = 1`: both
terms are total functions with junk values there. The separate `G` records the continuous
extension. The proof derives its Chebyshev-type growth bound from coefficient nonnegativity,
the half-plane `LSeriesHasSum` hypothesis, and the boundary data; it does not silently assume that
bound. If the chosen formal proof instead needs it as an input, expose it in the public theorem
and prove the derived version as the exported corollary.

**9.2 Variants.** Prove versions for natural cutoffs, finite changes of coefficients, a pole at a
positive abscissa after rescaling, and coefficients in an ordered real normed algebra when the
proof permits it.

### Layer 10: generic prime-number-theorem transfer

**10.1 Exact boundary input and `ψ`.** Define `primePsi` with all prime powers present. Package
the analytic input in `PrimeBoundaryRemainder K S δ`: the hypothesis `0 ≤ δ`, named functions `F` and `G`,
`LSeriesHasSum` for the exact nonnegative von Mangoldt coefficient on `Re s > 1`, continuity of
`G` on `Re s ≥ 1`, and the identity `G(s) = F(s) - δ/(s-1)` on `Re s > 1`. Apply Layer 9 to
obtain `primePsi_asymptotic_of_boundary`. The construction of the coefficient and its series uses
Layers 2–3; no continuation or nonvanishing fact is smuggled into the transfer theorem.

**10.2 Remove higher prime powers.** For the fixed standard nonnegative logarithmic prime-power
weight, use Layer 5 to prove `standardPrimePowerRemoval : HasNegligibleHigherPrimePowers K S` and
make `primeTheta_asymptotic_of_primePsi` consume that named estimate. A generalized coefficient
system must instead state nonnegativity, prime-power support, and the logarithmic growth bound
needed to prove the same little-o estimate; no arbitrary `EulerProductData` receives it for free.

**10.3 Count primes and expose the summit.** Use Layer 6 to export
`primeCount_asymptotic_of_primeTheta`. The summit `primeNumberTheoremTransfer` accepts a
`PrimeBoundaryRemainder K S δ` and returns all three conclusions—`ψ`, `ϑ`, and `π`—so its target
matches the export table rather than assuming the middle conclusion.

**10.4 External prime-ideal input.** The trivial-set specialization is conditional on the exact
downstream export
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary :
  PrimeBoundaryRemainder K Set.univ 1`. Producing it requires continuation of `ζ_K` and a
continuous extension of `-ζ'_K/ζ_K - 1/(s-1)` across `Re s = 1`, including nonvanishing on that
line. Mathlib's one-sided residue theorem does not supply this. Until `LFunctions` proves the
named export, this roadmap proves only the conditional `primeIdealTheorem_of_boundary`; likewise,
Chebotarev supplies its own class-specific boundary package.

---

## Worked examples and rejection tests

1. The everywhere-one function on all ideals is multiplicative but defines neither ideal-weight
   carrier because it has value `1` at `⊥`; the constant-one function on nonzero ideals has
   canonical zero extension instead.
2. The trivial weight over `ℚ` regroups to the Riemann-zeta coefficient for every `n > 0`.
3. A finite prime set has Dirichlet density zero, and changing a set on finitely many primes does
   not change its density.
4. For the Perron kernel at `x = 1`, the finite-height value is
   `π⁻¹ arctan(T/c)`, not `1/2`; its limit is `1/2`.
5. Higher prime powers are visible in the logarithmic derivative before their contribution is
   estimated away.
6. Given `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the trivial prime carrier and residue
   `1` recover the prime ideal theorem. This is a conditional integration test, not an analytic
   result owned by this roadmap.
7. If `Re z ≠ 0`, twisting a unitary weight by `N(I)^{-z}` changes its modulus on every good ideal
   of norm greater than one, so the result belongs only to `MultiplicativeIdealWeight`.
8. The ideal Möbius function is multiplicative on coprime ideals but not completely
   multiplicative because of its value on `𝔭²`.
9. A nonnegative sum over a norm fibre does not imply that every ideal summand is nonnegative;
   the two-summand witness `-1 + 1 = 0` is the required logical rejection test.

---

## Ordering

```text
0 ─→ 1 ─→ 3 ────────────────→ 7.2
│    │                        ↑
└─→ 2 ─→ 3 ─→ 10.1           5
     │          ↑             ↑
1 ─→ 4 ─→ 5 ─→ 10.2          │
     └─→ 6 ─→ 10.3 and 7.3 ───┘

9 ───────────→ 10.1
LFunctions.primeIdealVonMangoldtBoundary ─→ primeIdealTheorem_of_boundary
```

Layer 6 can be developed after Layers 1 and 4. The all-prime normalization in Layer 7.2 needs
both the Euler product of Layer 3 and the higher-prime-power estimate of Layer 5; the
natural-to-Dirichlet implication in Layer 7.3 needs Layer 6. Layer 9 is analytically independent
of arithmetic ideals after its statement is expressed in Mathlib `LSeries` vocabulary. Layer
10.1 consumes Layers 2, 3, and 9; Layers 10.2 and 10.3 consume Layers 5 and 6 respectively. The
exact trivial-weight abscissa is exported only after `idealCount_linearBounds` in Layer 5. The
prime-ideal specialization additionally consumes the named external `LFunctions` boundary export.

## References

- H. Davenport, *Multiplicative Number Theory*, chapters on Dirichlet series, partial summation,
  Perron's formula, and the prime number theorem.
- G. Tenenbaum, *Introduction to Analytic and Probabilistic Number Theory*, chapters II–III for
  arithmetic functions and Tauberian transfer.
- J. Korevaar, *Tauberian Theory: A Century of Developments*, Chapter III for Wiener–Ikehara.
- J. Neukirch, *Algebraic Number Theory*, Chapter VII for ideal Euler products and prime ideals.
- J.-P. Serre, *Corps locaux*, and J. Milne, *Algebraic Number Theory*, for Dirichlet density and
  finite-error calculus.
- Titchmarsh, revised by Heath-Brown, *The Theory of the Riemann Zeta-Function*, Lemma 3.12 for
  the truncated Perron kernel and its endpoint restrictions.
