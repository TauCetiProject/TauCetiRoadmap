# Roadmap: the Laguerre and Jacobi orthogonal polynomials, and their L² bases

**Summary.** Build the two classical orthogonal polynomial families that Mathlib lacks, the
generalized Laguerre polynomials `Polynomial.laguerre` and the Jacobi polynomials
`Polynomial.jacobi`, over any `ℚ`-algebra, with their complete algebraic theory (degree,
recurrences, derivative identities, reflection symmetry, special values, analytic Rodrigues
formulas); their orthogonality relations against the Laguerre and Jacobi measures with exact
constants; the resulting Hilbert bases of `L²`, in both the weighted-measure and the `√w`
normalization, and their tensor products; and the classical specializations: Legendre,
Gegenbauer and Chebyshev, the last as a check of the Jacobi constants against what Mathlib
already proves. The foundations are Mathlib's `Real.Gamma`, `ProbabilityTheory.beta`,
`ascPochhammer`, `Polynomial.Chebyshev.measureT` and `Polynomial.shiftedLegendre`, and Tau Ceti's
family-agnostic Hilbert-basis bridge `TauCeti.hilbertBasisOfWeightedMeasure`.

Suggested homes:

```text
TauCeti/RingTheory/Polynomial/Laguerre/    (Layer 1: the algebraic family)
TauCeti/RingTheory/Polynomial/Jacobi/      (Layer 3 and the Gegenbauer family of Layer 6)
TauCeti/Analysis/SpecialFunctions/Laguerre/ (Layer 2: measure, orthogonality, bases)
TauCeti/Analysis/SpecialFunctions/Jacobi/   (Layers 4, 5 and 6: measure, orthogonality, bases)
```

## Motivation: what the two families give

Mathlib carries three classical orthogonal polynomial families as algebraic objects,
`Polynomial.hermite`, `Polynomial.Chebyshev.T` and `Polynomial.shiftedLegendre`. Tau Ceti carries a
family-agnostic `L²` Hilbert-basis layer that turns an orthogonality relation
`∫ pₘ pₙ w = cₙ δₘₙ` into a complete orthonormal basis. Mathlib has no Laguerre polynomial (no
declaration mentions `Laguerre`), no declaration is a Jacobi polynomial (the occurrences of
`jacobi` are `jacobiSum`, `jacobiTheta`, the Jacobi identity and Jacobian determinants), and there
is no Gegenbauer polynomial. `OrthogonalL2Bases`
([Completed](../../Completed/OrthogonalL2Bases/README.md)) leaves the Laguerre and Jacobi families
to a separate roadmap, since Mathlib defines neither; this is that roadmap, and it consumes that
roadmap's completeness toolkit (B1) and bridge (B2).

Both weights satisfy the hypothesis of the completeness mechanism with no new analysis: the
Laguerre weight `x^α e^{-x}` has finite exponential moments on `(0, ∞)`, and the Jacobi weight
`(1-x)^α (1+x)^β` is supported in `[-1, 1]`.

Jacobi is the general two-parameter family of the Hahn class, so its orthogonality relation
specializes to three further results the library wants:

- **Legendre.** Mathlib has `Polynomial.shiftedLegendre` with a Rodrigues formula and no
  orthogonality lemma. Legendre is Jacobi at `α = β = 0`.
- **Gegenbauer / ultraspherical.** Absent from Mathlib; a scalar multiple of Jacobi at
  `α = β = λ - 1/2`.
- **Chebyshev.** Jacobi at `α = β = -1/2`. Mathlib proves the Chebyshev orthogonality integrals, so
  this specialization is a check of the general constants against values the library already
  knows.

Laguerre repays differently: its weight is the Gamma density, so the whole development is stated
against `Real.Gamma`, and it gives the library the orthogonal family attached to the exponential
distribution, the counterpart on `(0, ∞)` of what Hermite is on `ℝ`.

## Scope and ownership

This roadmap owns two polynomial families and their `L²` structure. The split from
`OrthogonalL2Bases` is by kind of statement: an integral identity `∫ pₘ pₙ w = cₙ δₘₙ` is a target
here, because neither family exists in the library, and a Hilbert-space theorem ("the normalized
functions are a complete orthonormal basis") is consumed from `OrthogonalL2Bases`, which owns that
layer. `OrthogonalL2Bases` Part A owns the Hermite family. No Hilbert-space machinery is added
here.

It owns: the families `Polynomial.laguerre`, `Polynomial.jacobi` and `Polynomial.gegenbauer` over a
`ℚ`-algebra; the measures `Polynomial.laguerreMeasure` and `Polynomial.jacobiMeasure`; the norm
sequence `Polynomial.jacobiNormSq`; the interval form of the real Beta integral; the Hilbert
bases of the two measures and of the unweighted `L²`, and their tensor products; the Legendre
transport and orthogonality; and the comparison with Chebyshev.

It does not own:

- the general orthogonal-polynomials-of-a-measure construction (Gram–Schmidt applied to monomials),
  Favard's theorem, and abstract three-term-recurrence theory: `OrthogonalL2Bases` places these
  outside its scope for the same reason, and Mathlib has `InnerProductSpace.gramSchmidt` and `Polynomial.Sequence`
  for the ingredients;
- the rest of the Askey scheme (Hahn, Meixner, Krawtchouk, Wilson, and every `q`-analogue);
- Laguerre and Jacobi *functions* as eigenfunctions of their Sturm–Liouville operators, and the
  associated spectral and PDE theory; the PDE roadmap owns an eigenfunction-expansion statement
  and consumes the bases here;
- the classical `λ = 0` ultraspherical family, which is a renormalized limit of the family of
  Layer 6 (`lim_{λ→0} (n/λ) Cₙ^{(λ)} = 2 Tₙ` for `n ≥ 1`) and is a different definition;
- analytic continuation in the Gegenbauer parameter, and Gegenbauer functions of non-integer
  degree.

## Conventions

- **Base ring.** `variable {R : Type*} [CommRing R] [Algebra ℚ R]`, with the parameters `α β lam`
  in `R`. Both families have coefficients that require division by factorials, so `ℤ[X]`, the home
  of `Polynomial.hermite` and `Polynomial.shiftedLegendre`, cannot hold them. This is the weakest
  setting in which the definitions make sense, and it keeps `ℝ` and `ℂ` as instances rather than
  special cases.
- **Rational constants are `ℚ`-scalars.** `R` has no division, so every rational constant enters
  as a `ℚ`-scalar acting on an element of `R` (`((1 : ℚ) / 2) • p`, `algebraMap ℚ R q`), never as
  `C (a / 2)`. The `ascPochhammer` factors are genuine elements of `R` and are multiplied in `R`.
- **No second recursion for special cases.** The simple Laguerre polynomial is `laguerre 0 n` and
  Legendre is `jacobi 0 0 n`; Chebyshev `T` is a scalar multiple of `jacobi (-1/2) (-1/2) n`, and
  Gegenbauer is tied to `jacobi (lam - 1/2) (lam - 1/2) n` by a scalar identity. Each special case
  gets its own lemmas; where the classical normalization differs, a `def` is stated as a scalar
  multiple of the general one, or by its own explicit sum when no quotient exists in `R`, never by
  a new recursion.
- **Generalized binomial coefficients are `ascPochhammer` values**, evaluated at a ring element by
  `Polynomial.smeval`, not `Ring.choose`: `Ring.choose` needs a `BinomialRing` instance, and the
  instance covering `ℝ` is anonymous.
- **Measures are `(volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)`**, the shape of
  the bridge `TauCeti.hilbertBasisOfWeightedMeasure` with `μ = volume.restrict s`, so that the
  bases are literal instantiations of it. They mirror `Polynomial.Chebyshev.measureT`, which is
  built the other way round (`withDensity` first, then `restrict`).
- **Domains are the open intervals**: Laguerre on `Set.Ioi (0 : ℝ)`, Jacobi on `Set.Ioo (-1 : ℝ) 1`.
  On `Ioo` both `0 < 1 - x` and `0 < 1 + x` hold, which is what `Real.rpow` needs to be the
  classical power (at a negative base `x ^ y = exp (y log x) * cos (π y)`), so every weight lemma
  states without an endpoint case split. The domain choice does not change the measure up to null
  sets: a `withDensity` of `volume` is absolutely continuous with respect to `volume`, `{1}` is
  `volume`-null, and so `Ioo` and Mathlib's `Ioc (-1) 1` give the same Jacobi measure. §6.3 proves
  this comparison for the Chebyshev weight.
- **Parameter hypotheses are carried, never assumed globally.** `-1 < α` for Laguerre; `-1 < α`
  and `-1 < β` for Jacobi; `-1/2 < lam`, `lam ≠ 0` for Gegenbauer orthogonality. These are exactly
  the conditions for weight integrability and nondegenerate norms, so a statement that omits them
  is false, not merely weaker. Over a general `ℚ`-algebra, where `-1 < α` is not a well-formed
  hypothesis, degree statements carry an algebraic nonvanishing hypothesis, and the ordered real
  statement is a corollary.
- **Every basis target exports its element-level pin.** A `HilbertBasis ℕ 𝕜 (Lp …)` shipped only
  as a bundled term asserts nothing beyond separability: the pin states which functions the
  vectors are. In `Suggested.lean` each basis is stated as an existence statement
  `∃ b : HilbertBasis …, ∀ n, (b n : _ → 𝕜) =ᵐ[μ] f n`; a contributor may realize it as a `def` with
  a `coe_` lemma.
- **Scalar-generic.** Bases are over `[RCLike 𝕜]`, the real-valued polynomial functions being cast
  by `algebraMap ℝ 𝕜`. The API is not duplicated at `ℝ` and `ℂ`.
- **Truncated subtraction.** Derivative and recurrence identities that mention index `n - 1` are
  stated at successor indices (`n + 1`, `n + 2`), since `0 - 1 = 0` makes the `n`-form false at
  `n = 0`.

## Exact supplier contracts

### From Mathlib

- `Real.Gamma`, `Real.Gamma_eq_integral` (`0 < s → Gamma s = ∫ x in Ioi 0, exp (-x) * x ^ (s-1)`),
  `Real.Gamma_add_one`, `Real.Gamma_nat_eq_factorial` and `Real.Gamma_pos_of_pos`.
- `ProbabilityTheory.beta α β = Gamma α * Gamma β / Gamma (α + β)`, `ProbabilityTheory.beta_pos`
  and `ProbabilityTheory.beta_eq_betaIntegralReal` (`Mathlib/Probability/Distributions/Beta.lean`),
  with `ProbabilityTheory.lintegral_betaPDF`, `ProbabilityTheory.lintegral_betaPDF_eq_one`
  (`0 < α`, `0 < β`), `ProbabilityTheory.betaMeasure` and
  `ProbabilityTheory.isProbabilityMeasureBeta` in the same file. The real Beta constant, its
  `Real.rpow` density on `Ioo 0 1`, and its normalization are therefore consumed, not built.
- `integral_rpow_mul_exp_neg_mul_rpow`
  (`0 < p → -1 < q → 0 < b → ∫ x in Ioi 0, x ^ q * exp (-b * x ^ p) = b ^ (-(q+1)/p) * (1/p) * Gamma ((q+1)/p)`)
  and `integrableOn_rpow_mul_exp_neg_mul_rpow`
  (`-1 < s → 0 < p → 0 < b → IntegrableOn (fun x => x ^ s * exp (-b * x ^ p)) (Ioi 0)`), in
  `Mathlib/MeasureTheory/Integral/Gamma.lean` and
  `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` respectively. At `p = 1` these are the
  Laguerre weight moments, including the shifted exponent `b = 1 - a` that a finite exponential
  moment needs.
- `ascPochhammer`, `Polynomial.smeval`, `Polynomial.derivative`, the iterated-derivative
  lemmas (including `Polynomial.iterate_derivative_mul` and
  `Polynomial.iterate_derivative_eq_zero_of_degree_lt`), and `Polynomial.Sequence`.
- `Polynomial.shiftedLegendre` and `Polynomial.factorial_mul_shiftedLegendre_eq`.
- `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.measureT`,
  `Polynomial.Chebyshev.integral_measureT`,
  `Polynomial.Chebyshev.integral_eval_T_real_mul_eval_T_real_measureT_of_ne`,
  `Polynomial.Chebyshev.integral_eval_T_real_mul_self_measureT_zero` (value `π`) and
  `Polynomial.Chebyshev.integral_T_real_mul_self_measureT_of_ne_zero` (value `π / 2`).
- Integration by parts, two shapes with a shared base name and incompatible hypotheses, cited fully
  qualified: `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` (the `Set.Ioi` form, for
  Laguerre) and `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDeriv_right` (the
  finite-interval form that asks only `ContinuousOn` on the closed interval and a derivative on
  `Set.Ioo`, for Jacobi; the plain `intervalIntegral.integral_mul_deriv_eq_deriv_mul` wants
  derivatives at the endpoints, which the Jacobi weight lacks for noninteger exponents).
- `MeasureTheory.restrict_withDensity`: `(μ.withDensity f).restrict s = (μ.restrict s).withDensity f`
  for measurable `s`, the bridge between Mathlib's `measureT` shape and ours.

### From Tau Ceti

- `TauCeti.hilbertBasisOfWeightedMeasure`, `TauCeti.coe_hilbertBasisOfWeightedMeasure`,
  `TauCeti.hilbertBasisOfOrthogonalSystem` and `TauCeti.coe_hilbertBasisOfOrthogonalSystem`
  (`TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean`). The first takes `f`, `w`,
  `c`, a measure `μ`, `0 ≤ w` a.e., `AEMeasurable w μ`, `∀ n, 0 < c n`, the orthogonality
  relation `∫ f m * f n * w ∂μ = if m = n then c n else 0`, the `L²` membership of the normalized
  functions, and `(Submodule.span 𝕜 (Set.range (TauCeti.bareNormalizedLp f w c hmem)))ᗮ = ⊥`, and returns
  `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (μ.withDensity fun x => ENNReal.ofReal (w x)))`.
- `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`
  (`TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean`): for `p : ℕ → Polynomial ℝ`
  with `(p n).degree = n`, `c n > 0` and one finite exponential moment
  `∃ a, 0 < a ∧ Integrable (fun x => exp (a * |x|)) (μ.withDensity …)`, the orthogonal complement
  of the span of the normalized family is `⊥`. It is family-agnostic.
- `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`
  (`TauCeti/Probability/Moments/Determinacy.lean`): moment determinacy from a finite exponential
  moment, the mechanism behind the previous item.
- `MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le`
  (`TauCeti/MeasureTheory/Function/BoundedSupportExponential.lean`): for `Integrable g μ` and
  `|x| ≤ R` a.e., `x ↦ exp (a * |x|) • g x` is integrable. With `g = 1` this is the Jacobi
  exponential moment and needs `IsFiniteMeasure`.
- `TauCeti.weightL2Isometry` and `TauCeti.weightL2Isometry_apply`
  (`TauCeti/MeasureTheory/Function/WeightL2Isometry.lean`): multiplication by `√w`.
- `TauCeti.piHilbertBasis` and `TauCeti.coeFn_piHilbertBasis`
  (`TauCeti/Analysis/InnerProductSpace/L2/Pi.lean`): the product Hilbert basis of
  `Lp 𝕜 2 (Measure.pi μ)` from coordinatewise Hilbert bases, indexed by the dependent function
  type.

## How to read the build

Layers 1 and 2 are the Laguerre family and fix the proof shape: Rodrigues, repeated integration by
parts, a Gamma constant, then the bridge. Layers 3 and 4 repeat it for Jacobi, which needs the
Beta integral first and has the one genuine edge case (`n = 0`, `α + β = -1`). Layer 5 (tensor
bases) depends only on Layers 2 and 4. Layer 6 depends on Layers 3 and 4; its Chebyshev check
(§6.3) belongs with Layer 4 in practice, since it is how the Layer 4 constant is known to be right.
The Legendre export (§6.1) is the highest-value single item for existing Mathlib users.

A name in code font that is qualified by `Polynomial` or `ProbabilityTheory` and is not a Mathlib
or Tau Ceti declaration is a declaration of `Suggested.lean`, with the signature given there. The
API facts that the text states in prose are targets too; a contributor names them in the same
namespace.

## Layer 1: the Laguerre polynomials

Suggested home: `TauCeti/RingTheory/Polynomial/Laguerre/`. Names live in the namespace
`Polynomial`.

### 1.1 Definition and degree

`Polynomial.laguerre (α : R) (n : ℕ) : R[X]` is the generalized Laguerre polynomial `Lₙ^{(α)}`,
defined by the explicit sum (DLMF 18.5.12)

`Lₙ^{(α)}(X) = ∑ k ∈ Finset.range (n+1), ((-1)^k * (((1 : ℚ) / ((n-k)! * k !)) • (ascPochhammer R (n-k)).smeval (α + k + 1))) • X^k`.

The rational factorial coefficients are `ℚ`-scalars: `R` is a `CommRing` with an `Algebra ℚ R`
instance, so `/` is unavailable on `R`, and the factorials are inverted in `ℚ` and act through the
algebra structure. The same convention governs every rational constant in this roadmap.

Targets: `Polynomial.laguerre_zero` (`= 1`), `Polynomial.laguerre_one` (`= C (α + 1) - X`),
`Polynomial.coeff_laguerre`, `Polynomial.degree_laguerre` (`= n`, for `[Nontrivial R]`),
`Polynomial.natDegree_laguerre` and `Polynomial.leadingCoeff_laguerre`
(`= algebraMap ℚ R ((-1)^n / n!)`, DLMF Table 18.3.1). The degree lemma is the hypothesis `hdeg` of
the completeness theorem, so Layer 2 cannot start without it.

*Needs:* Mathlib `ascPochhammer`, `Polynomial.smeval`. *Locator:* DLMF 18.5.12; Table 18.3.1 for
`kₙ`.

**Checks.**

- `n = 0, 1`: `laguerre α 0 = 1`, `laguerre α 1 = C (α + 1) - X`; at `n = 2, α = 0`:
  `1 - 2X + X²/2`, whose leading coefficient is `1/2 = (-1)²/2!`.
- Values at the origin: `Lₙ^{(0)}(0) = 1` and `Lₙ^{(1)}(0) = n + 1` for every `n`.
- Over `ℚ`, `α = -1/2`, `n = 1`: `1/2 - X`, of degree `1`.
- The degree is `n` for every `α`, including `α` a negative integer: `laguerre (-1) 1 = -X` has
  degree `1`.

### 1.2 Recurrences and the derivative

- `Polynomial.laguerre_succ_succ`, the three-term recurrence
  `(n+2) • Lₙ₊₂^{(α)} = (C (2n + α + 3) - X) * Lₙ₊₁^{(α)} - C (n + α + 1) * Lₙ^{(α)}`.
- `Polynomial.derivative_laguerre`: `derivative (Lₙ₊₁^{(α)}) = -Lₙ^{(α+1)}`, the identity that
  moves the parameter, and the reason the parameter is a variable of the definition and not fixed
  at `0`.
- `Polynomial.laguerre_add_one_sub`: `Lₙ₊₁^{(α)} = Lₙ₊₁^{(α+1)} - Lₙ^{(α+1)}`.

Both the derivative identity and the contiguous relation are stated at `n + 1`: the `n` form
`derivative (Lₙ^{(α)}) = -Lₙ₋₁^{(α+1)}` reads at `n = 0` as `0 = -L₀^{(α+1)} = -1`, and carrying
`0 < n` would force every consumer to discharge a side condition on what is a statement about
successors.

*Needs:* §1.1, Mathlib `Polynomial.derivative`. *Locator:* DLMF 18.9.1 with Table 18.9.1 (the
recurrence), 18.9.23 (the derivative), 18.9.13 (the contiguous relation).

**Checks.**

- `derivative (laguerre α 1) = -1 = -laguerre (α+1) 0`.
- `α = 0`: `L₂^{(0)} = 1 - 2X + X²/2 = L₂^{(1)} - L₁^{(1)}`, with `L₂^{(1)} = 3 - 3X + X²/2` and
  `L₁^{(1)} = 2 - X`.
- Negative control: `derivative (laguerre α 0) = 0`, whereas the `n`-form would assert `-1`.

### 1.3 Rodrigues

`Polynomial.laguerre_rodrigues`, stated analytically on `Set.Ioi 0` with `Real.rpow` and `0 < x`:

`Lₙ^{(α)}.eval x = x ^ (-α) * exp x / n! * iteratedDeriv n (fun t => exp (-t) * t ^ (n + α)) x`.

For real `α` the function `t ^ (n + α)` is not a polynomial, so a polynomial-level Rodrigues
identity that differentiates `X ^ (n + α)` with `Polynomial.derivative` does not typecheck, and
the `Polynomial.shiftedLegendre` shape in Mathlib is not available to imitate. The analytic form is the one the
orthogonality proof consumes.

*Needs:* §1.1. *Locator:* DLMF 18.5.5 with Table 18.5.1.

**Checks.**

- `n = 0`: the right-hand side is `x^{-α} eˣ · e^{-x} x^{α} = 1`.
- `n = 1`: `x^{-α} eˣ · d/dx (e^{-x} x^{1+α}) = (1 + α) - x`.

### 1.4 Special values

`Polynomial.eval_zero_laguerre`: `Lₙ^{(α)}(0) = (α+1)ₙ / n!` (as a `ℚ`-scalar of an element of `R`),
and the simple-Laguerre lemmas as the `α = 0` specialization. At `α = 0` the value is `1`, which is
the check against `Real.Gamma_nat_eq_factorial` used in §2.3.

*Needs:* §1.1. *Locator:* DLMF 18.6.1.

**Checks.** `α = 0`: `(1)ₙ / n! = 1`; `α = 1`: `(2)ₙ / n! = n + 1`.

### Examples

- `laguerre 0 2 = 1 - 2X + X²/2` and `laguerre 1 2 = 3 - 3X + X²/2`.
- The Laguerre polynomials of degree `1`: `1 + α - X`.

### Dependencies

Mathlib `ascPochhammer` and `Polynomial.smeval`; the `ℚ`-algebra scalar action.

## Layer 2: Laguerre orthogonality and the `L²` bases

Suggested home: `TauCeti/Analysis/SpecialFunctions/Laguerre/`. Names live in the namespace
`Polynomial`.

### 2.1 The measure

`Polynomial.laguerreMeasure (α : ℝ) : Measure ℝ`, defined as
`(volume.restrict (Set.Ioi 0)).withDensity fun x => ENNReal.ofReal (x ^ α * Real.exp (-x))`.
Targets: `Polynomial.isFiniteMeasure_laguerreMeasure` for `-1 < α` (total mass `Real.Gamma (α + 1)`,
by `Real.Gamma_eq_integral`), and `Polynomial.integral_laguerreMeasure`, in the shape of
`Polynomial.Chebyshev.integral_measureT`.

*Needs:* Mathlib `Real.Gamma_eq_integral`, `integral_withDensity_eq_integral_toReal_smul`.
*Locator:* DLMF Table 18.3.1 (the weight).

**Checks.**

- `α = 0`: the total mass is `∫ e^{-x} = 1 = Γ(1)`; `α = 1`: `Γ(2) = 1`; `α = -1/2`:
  `Γ(1/2) = √π`.
- Negative control: at `α = -1` the density `x^{-1} e^{-x}` is not integrable at `0`, and
  `IsFiniteMeasure` fails; the hypothesis `-1 < α` is sharp.
- Consistency with §2.3: the integral of `laguerre α 0 * laguerre α 0` is the total mass `Γ(α+1)`.

### 2.2 The finite exponential moment

`Polynomial.integrable_exp_mul_abs_laguerreMeasure`: for `-1 < α` and `0 < a < 1`,
`Integrable (fun x => Real.exp (a * |x|)) (laguerreMeasure α)`. On `Set.Ioi 0` the absolute value
is the identity and the integrand is `x ^ α * exp (-(1 - a) * x)`, so this is
`integrableOn_rpow_mul_exp_neg_mul_rpow` at `p = 1`, `s = α`, `b = 1 - a`. It is the whole
completeness argument: one lemma, because the mechanism is already built and family-agnostic, and
named because every downstream basis lemma cites it.

*Needs:* §2.1, Mathlib `integrableOn_rpow_mul_exp_neg_mul_rpow`. *Locator:* DLMF Table 18.3.1 (the
weight).

**Checks.** `α = -1/2`, `a = 1/2`: `∫₀^∞ x^{-1/2} e^{-x/2} dx = (1/2)^{-1/2} Γ(1/2) = √(2π)` is
finite; at `a = 1` the integral `∫ x^α` diverges, so the bound `a < 1` is sharp.

### 2.3 The orthogonality relation

`Polynomial.integral_laguerre_mul_laguerre_laguerreMeasure`: for `-1 < α`,

`∫ x, (laguerre α m).eval x * (laguerre α n).eval x ∂(laguerreMeasure α) = if m = n then Real.Gamma (n + α + 1) / n! else 0`.

The proof is Rodrigues (§1.3) plus `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`, `n` times:
the `n`-fold integration by parts moves all derivatives onto the lower-degree factor and kills the
off-diagonal case by `Polynomial.iterate_derivative_eq_zero_of_degree_lt`, and the diagonal
constant is `Real.Gamma_eq_integral`. The boundary terms vanish because `exp (-t) * t ^ (n+α)`
and its derivatives of order below `n` tend to `0` at both ends. That is a target in its own right,
since it is the step an implementor otherwise waves at:

- `Polynomial.tendsto_nhdsGT_zero_iteratedDeriv_laguerreWeight`: for `-1 < α` and `j < n`, the
  `j`-th derivative of `t ↦ exp (-t) * t ^ (n + α)` tends to `0` as `t → 0⁺` (its order of
  vanishing is `n + α - j > 0`);
- `Polynomial.tendsto_atTop_iteratedDeriv_laguerreWeight`: for every `j`, it tends to `0` as
  `t → ∞`.

*Needs:* §§1.1, 1.3, 2.1; Mathlib `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`,
`Polynomial.iterate_derivative_eq_zero_of_degree_lt`, `Real.Gamma_eq_integral`.
*Locator:* DLMF Table 18.3.1 (`hₙ`).

**Checks.**

- `m = n = 0`: the value `Γ(α+1)` is the total mass of §2.1.
- `α = 0`: `∫₀^∞ L₁² e^{-x} = ∫ (1 - x)² e^{-x} = 1 - 2 + 2 = 1 = Γ(2)/1!`, and the cross term
  `∫ L₀ L₁ e^{-x} = 1 - 1 = 0`.
- `α = 1`, `n = 1`: `∫ (2 - x)² x e^{-x} = 4 - 8 + 6 = 2 = Γ(3)/1!`.
- Negative control: the unnormalized quantity `Γ(n+α+1)` without the factor `1/n!` gives `2` at
  `α = 0`, `n = 2`, whereas the true value is `Γ(3)/2! = 1`.

### 2.4 The two Hilbert bases

With §1.1's degree lemma, §2.2 and §2.3 in hand these are instantiations of the Tau Ceti bridge:

- `Polynomial.exists_hilbertBasis_laguerreMeasure` (`-1 < α`): a
  `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (laguerreMeasure α))` whose `n`-th vector is a.e.
  `algebraMap ℝ 𝕜 (Lₙ^{(α)}(x) / √(Γ(n+α+1)/n!))`, by `TauCeti.hilbertBasisOfWeightedMeasure`
  and its `coe_` pin, with completeness from `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`.
  The hypothesis `-1 < α` is necessary: even the degree-zero Laguerre function is not in `L²` near
  `0` for `α ≤ -1`.
- `Polynomial.exists_hilbertBasis_laguerreFunction` (`-1 < α`): a
  `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (volume.restrict (Set.Ioi 0)))` whose `n`-th vector is a.e.
  `Lₙ^{(α)}(x) x^{α/2} e^{-x/2} / √(Γ(n+α+1)/n!)`, the **Laguerre functions**, by
  `TauCeti.hilbertBasisOfOrthogonalSystem` and its `coe_` pin.

Both pins are required.

*Needs:* §§1.1, 2.2, 2.3; Tau Ceti `TauCeti.hilbertBasisOfWeightedMeasure`,
`TauCeti.hilbertBasisOfOrthogonalSystem`, `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`.
*Locator:* DLMF Table 18.3.1 (`hₙ`).

**Checks.**

- The `n = 0` vector of the second basis at `α = 0` is `e^{-x/2}`, which has unit norm in
  `L²((0, ∞))` because `∫₀^∞ e^{-x} dx = 1 = Γ(1)/0!`.
- The orthonormality of the first two vectors at `α = 0` follows from the Checks of §2.3.

### Examples

- The Laguerre functions `e^{-x/2}`, `(1 - x) e^{-x/2}`, `(1 - 2x + x²/2) e^{-x/2}` are the first
  three vectors of the `α = 0` basis of `L²((0, ∞))`.
- `L²((0,∞), e^{-x} dx)` is spanned by the polynomials; the Laguerre polynomials are its
  orthonormal polynomial basis.

### Dependencies

Layer 1; Mathlib `Real.Gamma`, `integrableOn_rpow_mul_exp_neg_mul_rpow`, integration by parts on
`Set.Ioi`; Tau Ceti's bridge, its `√w` envelope and its completeness theorem.

## Layer 3: the Jacobi polynomials

Suggested home: `TauCeti/RingTheory/Polynomial/Jacobi/`. Names live in the namespaces
`Polynomial` and `ProbabilityTheory`.

### 3.1 The real Beta integral

The closed-form Beta constant, its density on `Ioo 0 1` with `Real.rpow` powers, and its
normalization are in Mathlib: `ProbabilityTheory.beta`, `ProbabilityTheory.lintegral_betaPDF`
(the lower integral of `ofReal (1 / beta α β * x ^ (α - 1) * (1 - x) ^ (β - 1))` over `Ioo 0 1`),
`ProbabilityTheory.lintegral_betaPDF_eq_one` (for `0 < α`, `0 < β`), `ProbabilityTheory.betaMeasure`
and `ProbabilityTheory.isProbabilityMeasureBeta`. The single target is the Bochner
interval-integral corollary

`ProbabilityTheory.intervalIntegral_rpow_mul_rpow_one_sub_eq_beta : 0 < u → 0 < v → ∫ x in (0:ℝ)..1, x ^ (u-1) * (1-x) ^ (v-1) = ProbabilityTheory.beta u v`

with `^` the `Real.rpow`, obtained by converting the lower integral of
`ProbabilityTheory.lintegral_betaPDF_eq_one` to a Bochner integral and clearing the constant `1 / beta u v`. The
statements of §4.1 and §4.3 state their constants as `ProbabilityTheory.beta`, and no second
abbreviation for the constant is introduced.

*Needs:* Mathlib `ProbabilityTheory.lintegral_betaPDF`, `ProbabilityTheory.lintegral_betaPDF_eq_one`,
`ProbabilityTheory.betaMeasure`, `ProbabilityTheory.isProbabilityMeasureBeta`,
`ProbabilityTheory.beta_pos`. *Locator:* DLMF 5.12.1.

**Checks.**

- `(u, v) = (2, 3)`: `∫₀¹ x (1-x)² dx = 1/12 = Γ(2)Γ(3)/Γ(5)`.
- `(u, v) = (1/2, 1/2)`: `∫₀¹ x^{-1/2}(1-x)^{-1/2} dx = Γ(1/2)² / Γ(1) = π`.
- Symmetry `beta u v = beta v u`, from the substitution `x ↦ 1 - x`.

### 3.2 Definition and degree

`Polynomial.jacobi (α β : R) (n : ℕ) : R[X]` is `Pₙ^{(α,β)}`, defined by the explicit sum
(DLMF 18.5.8)

`Pₙ^{(α,β)}(X) = ((1 : ℚ) / 2^n) • ∑ k ∈ Finset.range (n+1), (((1 : ℚ) / ((n-k)! * k !)) • ((ascPochhammer R (n-k)).smeval (β + k + 1) * (ascPochhammer R k).smeval (α + (n-k : ℕ) + 1))) • ((X - 1)^(n-k) * (X + 1)^k)`.

As in §1.1, `(1 : ℚ) / 2^n` and `(1 : ℚ) / ((n-k)! * k !)` are `ℚ`-scalars acting through
`Algebra ℚ R`; the two `ascPochhammer` factors are elements of `R` multiplied in `R`; no division
in `R` is used. The orientation is part of the specification. The factors are the `ascPochhammer`
forms of `(n+β).choose (n-k)` and `(n+α).choose k`: `β` travels with `(X - 1)^(n-k)` and `α` with
`(X + 1)^k`. Swapping them gives a different family, and the reflection symmetry of §3.3 and every
`α ↔ β` argument depend on exactly this pairing.

Targets: `Polynomial.jacobi_zero` (`= 1`), `Polynomial.jacobi_one`
(`= C (α + 1) + ((1 : ℚ) / 2) • (C (α + β + 2) * (X - 1))`), `Polynomial.coeff_jacobi_self`
(the coefficient of `X^n` is `((1 : ℚ) / (2^n * n!)) • (ascPochhammer R n).smeval (n + α + β + 1)`,
because every summand `(X - 1)^(n-k) * (X + 1)^k` is monic of degree `n` and the sum collapses by
Vandermonde to `(2n + α + β).choose n`), `Polynomial.leadingCoeff_jacobi` (the same value when it
is nonzero), `Polynomial.degree_jacobi` and `Polynomial.degree_jacobi_real`.

**Degeneracy, at the right generality.** Write `z = n + α + β + 1`. The leading coefficient is
`(z)ₙ / (2ⁿ n!)` with `(z)ₙ = z (z+1) ⋯ (z+n-1)`. For `n ≥ 1` it vanishes exactly when
`z ∈ {0, -1, …, -(n-1)}`; `z = -n` leaves `(z)ₙ` nonzero, and `(z)₀ = 1`, so `n = 0` never
degenerates, in particular at `z = 0`, the Chebyshev edge `α = β = -1/2`, `n = 0`, which §6.3
exercises. Since `jacobi` is stated over `[CommRing R] [Algebra ℚ R]`, where `-1 < α` is not a
well-formed hypothesis, `Polynomial.degree_jacobi` carries the algebraic condition
`(ascPochhammer R n).smeval (n + α + β + 1) ≠ 0`. The ordered real statement is the corollary
`Polynomial.degree_jacobi_real`: over `ℝ`, `-1 < α` and `-1 < β` give `z > n - 1 ≥ 0` for `n ≥ 1`
and `(z)₀ = 1` handles `n = 0`, so the condition is discharged once and Layer 4 carries only
`-1 < α`, `-1 < β`. Making the real inequality the hypothesis of `Polynomial.degree_jacobi` would specialize
the algebraic layer to `ℝ`.

*Needs:* §1.1's conventions, Mathlib `ascPochhammer`. *Locator:* DLMF 18.5.8; Table 18.3.1 for
`kₙ`.

**Checks.**

- `n = 0`: the single summand has both `ascPochhammer` factors equal to `1`, so `jacobi α β 0 = 1`.
- `(α, β, n) = (0, 1, 1)`: `P₁ = (3X - 1)/2`, with `∫₋₁¹ P₁ (1 + x) dx = 0`, as orthogonality to
  `P₀` against the weight `(1-x)^0 (1+x)^1` requires; the swapped orientation gives `(3X + 1)/2`
  with integral `2`. Equivalently `Pₙ^{(α,β)}(1) = (n+α).choose n`: the `α`-weighted factor is on
  the `X + 1` side.
- `(α, β, n) = (0, 0, 2)`: `(3X² - 1)/2`, the Legendre polynomial.
- Degeneracy: `jacobi (-1) (-1) 1 = 0` (`z = 0`, `(z)₁ = 0`); at `n = 2`, `α + β = -3` (`z = 0`)
  the coefficient of `X²` is `0`, while at `α = β = -5/2`, `n = 2` (`z = -2`) it is
  `(−2)(−1) / (4 · 2) = 1/4 ≠ 0`.

### 3.3 Recurrences, symmetry and the derivative

- `Polynomial.jacobi_neg_comp`: `Pₙ^{(α,β)}(-X) = (-1)^n Pₙ^{(β,α)}(X)`, the reflection symmetry;
  it makes the `α ↔ β` half of every later proof free, and it is the analogue of
  `Polynomial.neg_one_pow_mul_shiftedLegendre_comp_one_sub_X_eq`.
- `Polynomial.eval_one_jacobi`: `Pₙ^{(α,β)}(1) = (α+1)ₙ / n!`.
- `Polynomial.jacobi_succ_succ`, the three-term recurrence of DLMF 18.9.2, stated at the shifted
  indices `n + 2, n + 1, n` to avoid truncated subtraction. With `s = 2n + α + β`:
  `C (2(n+2)(n+α+β+2)(s+2)) * Pₙ₊₂ = C (s+3) * (C ((s+4)(s+2)) * X + C (α² - β²)) * Pₙ₊₁ - C (2(n+1+α)(n+1+β)(s+4)) * Pₙ`.
  This is the multiplied-out form, so no division in `R` is needed.
- `Polynomial.derivative_jacobi`:
  `derivative (Pₙ₊₁^{(α,β)}) = ((1 : ℚ) / 2) • (C (n + α + β + 2) * Pₙ^{(α+1,β+1)})`. It is stated
  at `n + 1`: the `n` form is false at `n = 0`, where truncated subtraction makes the right-hand
  side `((α+β+1)/2) P₀`, generally nonzero, while `derivative 1 = 0`.

*Needs:* §3.2, Mathlib `Polynomial.derivative`. *Locator:* DLMF Table 18.6.1 (reflection and
`Pₙ(1)`), 18.9.2 (recurrence), 18.9.15 (derivative).

**Checks.**

- Reflection at `n = 1`, `(α, β) = (0, 1)`: `P₁^{(0,1)}(-X) = (-3X - 1)/2 = -P₁^{(1,0)}(X)`.
- Recurrence at `n = 0`, `(α, β) = (0, 0)`: `C 16 * P₂ = C 24 * X² - C 8`, so `P₂ = (3X² - 1)/2`.
- Derivative at `n = 0`, `(α, β) = (0, 1)`: `derivative P₁^{(0,1)} = 3/2 = (3/2) · P₀^{(1,2)}`.
- Negative control: `derivative (jacobi α β 0) = 0`, whereas the `n`-form would assert
  `((α+β+1)/2) P₀`.

### 3.4 Rodrigues

`Polynomial.jacobi_rodrigues`, analytic, on `Set.Ioo (-1) 1` (`-1 < x`, `x < 1`):

`(jacobi α β n).eval x = (-1)^n / (2^n * n!) * (1-x) ^ (-α) * (1+x) ^ (-β) * iteratedDeriv n (fun t => (1-t) ^ (n+α) * (1+t) ^ (n+β)) x`,

with `Real.rpow` powers, as in §1.3.

*Needs:* §3.2. *Locator:* DLMF 18.5.5 with Table 18.5.1.

**Checks.**

- `n = 0`: `(1-x)^{-α}(1+x)^{-β} · (1-x)^α (1+x)^β = 1`.
- `n = 1`, `(α, β) = (0, 0)`: `-1/2 · d/dx (1-x)(1+x) = -1/2 · (-2x) = x`, which is `P₁^{(0,0)}`.

### Examples

- `jacobi 0 0 n` is the Legendre polynomial; `jacobi (1/2) (1/2) 1 = 3X/2`.
- Jacobi at `α = β` is even or odd according to the parity of `n`, by `Polynomial.jacobi_neg_comp`.

### Dependencies

Layer 1's conventions; Mathlib's Beta development.

## Layer 4: Jacobi orthogonality and the `L²` bases

Suggested home: `TauCeti/Analysis/SpecialFunctions/Jacobi/`. Names live in the namespace
`Polynomial`.

### 4.1 The measure

`Polynomial.jacobiMeasure (α β : ℝ) : Measure ℝ`, namely
`(volume.restrict (Set.Ioo (-1) 1)).withDensity fun x => ENNReal.ofReal ((1-x) ^ α * (1+x) ^ β)`.
Targets: measurability of the density; `Polynomial.isFiniteMeasure_jacobiMeasure` for `-1 < α`,
`-1 < β`, with total mass `2^{α+β+1} * ProbabilityTheory.beta (α+1) (β+1)`, from
`ProbabilityTheory.isProbabilityMeasureBeta` after the affine substitution `x = 2t - 1`
(`1 - x = 2(1-t)`, `1 + x = 2t`, `dx = 2 dt`).

*Needs:* §3.1; Mathlib `ProbabilityTheory.isProbabilityMeasureBeta`. *Locator:* DLMF Table 18.3.1
(the weight).

**Checks.**

- `α = β = 0`: total mass `2^1 · B(1, 1) = 2`.
- `(α, β) = (0, 1)`: `∫₋₁¹ (1 + x) dx = 2 = 2² · B(1, 2) = 4 · 1/2`.
- `α = β = -1/2`: `2^0 · B(1/2, 1/2) = π`, the total mass of Mathlib's `measureT`.
- Negative control: at `α = -1` the density is not integrable at `1`.

### 4.2 The finite exponential moment

`Polynomial.integrable_exp_mul_abs_jacobiMeasure`: `jacobiMeasure α β` is finite and supported in
`[-1, 1]`, so `exp (a * |x|)` is integrable for every `a`, from
`MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le` with `g = 1` (an integrable constant against
a finite measure, which is why `Polynomial.isFiniteMeasure_jacobiMeasure` is needed). It is a named lemma for
the same reason as §2.2.

*Needs:* §4.1 (in particular `Polynomial.isFiniteMeasure_jacobiMeasure`); Tau Ceti
`MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le`. *Locator:* DLMF Table 18.3.1 (the interval
`(-1, 1)`).

**Checks.** `α = β = 0`, `a = 1`: `∫₋₁¹ e^{|x|} dx = 2(e - 1) = 3.43656…`, finite.

### 4.3 The orthogonality relation and the norm sequence

`Polynomial.jacobiNormSq (α β : ℝ) (n : ℕ) : ℝ` is the diagonal norm, one uniformly defined
sequence: for `n = 0` it is `2^{α+β+1} * ProbabilityTheory.beta (α+1) (β+1)`, and for `n ≥ 1`

`2^{α+β+1} / (2n+α+β+1) * (Γ(n+α+1) * Γ(n+β+1) / (Γ(n+α+β+1) * n!))`.

The case `n = 0` is separate because the quotient has a genuine edge: `2n + α + β + 1 = 0` happens
exactly at `n = 0` with `α + β = -1`, which includes `α = β = -1/2`, the Chebyshev weight. There the
classical formula is `0/0` and the correct value is the total mass `2^{α+β+1} B(α+1, β+1)`. For
`n ≥ 1` and `-1 < α`, `-1 < β` the factor `2n+α+β+1` is positive. A single uniformly positive
sequence is also what the basis construction of §4.4 needs: the bridge takes `c n > 0` and
normalizes by it, so a split formula is a proof ingredient and not an interface. Targets:
`Polynomial.jacobiNormSq_pos` (`-1 < α`, `-1 < β`, all `n`, including the edge) and
`Polynomial.jacobiNormSq_zero_eq_quotient` (for `α + β + 1 ≠ 0`, the `n = 0` value equals the
classical quotient, since `Γ(z + 1) = z Γ(z)`).

`Polynomial.integral_jacobi_mul_jacobi_jacobiMeasure`: for `-1 < α`, `-1 < β`,

`∫ x, (jacobi α β m).eval x * (jacobi α β n).eval x ∂(jacobiMeasure α β) = if m = n then jacobiNormSq α β n else 0`.

The proof is as in §2.3: Rodrigues (§3.4) and
`intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDeriv_right` (continuity on the closed
interval, derivative on the open one), `n` times. The boundary terms vanish because
`(1-t)^{n+α} (1+t)^{n+β}` has a zero of order `n + α - j > 0` (resp. `n + β - j > 0`) in its
`j`-th derivative at each endpoint, `j < n`. Since the weight is not differentiable at the
endpoints for noninteger exponents, the `n`-fold derivative step runs on the open interval and the
convergence step uses the continuity on the closed one, with the continuous extensions pinned as an
explicit target: `Polynomial.exists_continuousOn_iteratedDeriv_jacobiWeight` states that, for
`-1 < α`, `-1 < β` and `j < n`, the function
`t ↦ iteratedDeriv j (fun t => (1-t)^(n+α) * (1+t)^(n+β)) t` agrees on `Set.Ioo (-1) 1` with a
function continuous on `Set.Icc (-1) 1` and vanishing at `±1`.

*Needs:* §§3.2, 3.4, 4.1; Mathlib `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDeriv_right`,
`Polynomial.iterate_derivative_eq_zero_of_degree_lt`, `ProbabilityTheory.beta`. *Locator:* DLMF
Table 18.3.1 (`hₙ`).

**Checks.**

- `(α, β) = (0, 0)`: `jacobiNormSq 0 0 n = 2/(2n+1)`, i.e. `2, 2/3, 2/5, 2/7`, matching
  `∫₋₁¹ Pₙ² dx` for the Legendre polynomials.
- `α = β = -1/2`: `jacobiNormSq (-1/2) (-1/2) n = π, π/8, 9π/128, …`, the first value from the
  `n = 0` branch (`2⁰ B(1/2, 1/2) = π`).
- The edge off the Chebyshev point: `(α, β) = (-1/4, -3/4)`, `n = 0`: `α + β = -1`, the value is
  `B(3/4, 1/4) = π√2`, where the generic quotient has `Γ(0)` in the denominator.
- Positivity at the edge: `jacobiNormSq α β 0 > 0` for all `-1 < α`, `-1 < β`, since
  `beta (α+1) (β+1) > 0` by `ProbabilityTheory.beta_pos`.
- Negative control: `α = β = -1/2` with the generic quotient formula at `n = 0` is undefined
  (division by `0`); a statement that omits the separate `n = 0` case is false there.

### 4.4 The two Hilbert bases

With §3.2's `Polynomial.degree_jacobi_real`, §4.2 and §4.3 in hand these are instantiations,
parallel to §2.4, and both carry `-1 < α`, `-1 < β`:

- `Polynomial.exists_hilbertBasis_jacobiMeasure`: a `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (jacobiMeasure α β))`
  whose `n`-th vector is a.e. `algebraMap ℝ 𝕜 (Pₙ^{(α,β)}(x) / √(jacobiNormSq α β n))`, by
  `TauCeti.hilbertBasisOfWeightedMeasure` and its `coe_` pin.
- `Polynomial.exists_hilbertBasis_jacobiFunction`: a
  `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (volume.restrict (Set.Ioo (-1) 1)))` whose `n`-th vector is a.e.
  `Pₙ^{(α,β)}(x) √((1-x)^α (1+x)^β) / √(jacobiNormSq α β n)`, by
  `TauCeti.hilbertBasisOfOrthogonalSystem` and its `coe_` pin.

*Needs:* §§3.2, 4.2, 4.3; Tau Ceti `TauCeti.hilbertBasisOfWeightedMeasure`,
`TauCeti.hilbertBasisOfOrthogonalSystem`, `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`.
*Locator:* DLMF Table 18.3.1 (`hₙ`).

**Checks.** `α = β = 0`: the first vector is the constant `1/√2` of unit norm in `L²((-1,1))`;
`α = β = -1/2`: the first vector of the second basis is `(1 - x²)^{-1/4} / √π`.

### Examples

- The orthonormal Legendre basis of `L²((-1, 1))`: `√((2n+1)/2) · Pₙ`.
- The Chebyshev basis of `L²(measureT)` up to the scalars of §6.3.

### Dependencies

Layer 3; Mathlib's Beta development and finite-interval integration by parts; Tau Ceti's bridge.

## Layer 5: the tensor bases

Immediate instantiations of `TauCeti.piHilbertBasis` once §2.4 and §4.4 exist, listed as targets
so that "immediate" is recorded as work:

- `Polynomial.exists_hilbertBasis_pi_laguerreMeasure` (`-1 < α`): for a finite index type `ι`, a
  `HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi fun _ => laguerreMeasure α))` whose vector at `k` is
  a.e. the product over `i` of the normalized one-variable Laguerre functions at `k i`;
- `Polynomial.exists_hilbertBasis_pi_jacobiMeasure` (`-1 < α`, `-1 < β`): likewise for Jacobi.

*Needs:* §§2.4, 4.4; Tau Ceti `TauCeti.piHilbertBasis`, `TauCeti.coeFn_piHilbertBasis`.
*Locator:* Tau Ceti `TauCeti/Analysis/InnerProductSpace/L2/Pi.lean` (the product basis).

**Checks.** `ι` a singleton: the basis is the one-variable basis of §2.4 (resp. §4.4) up to the
identification `(ι → ℕ) ≃ ℕ`; for `ι = Fin 2`, `α = 0`, the vector at `k = (1, 0)` is
`(x₁, x₂) ↦ 1 - x₁`, of unit norm for `e^{-x₁-x₂} dx₁ dx₂`.

### Examples

The two-dimensional Laguerre functions `Lₘ(x) Lₙ(y) e^{-(x+y)/2}` form a basis of
`L²((0, ∞)²)`.

### Dependencies

Layers 2 and 4; Tau Ceti `TauCeti.piHilbertBasis`.

## Layer 6: the classical specializations and the consistency check

Names live in the namespace `Polynomial`.

### 6.1 Legendre

`Polynomial.integral_jacobi_zero_zero_mul_jacobi_zero_zero`: Legendre orthogonality
`∫₋₁¹ Pₘ Pₙ = if m = n then 2/(2n+1) else 0` for `Pₙ = jacobi 0 0 n`, the case `α = β = 0` of §4.3
(DLMF 14.17.6 at order `0`).

Mathlib's `Polynomial.shiftedLegendre n : ℤ[X]` is the affine transport of `jacobi 0 0 n` to `[0,1]`,
and the **orientation is part of the statement**: `Polynomial.shiftedLegendre_map_eq_jacobi_comp`
states `(shiftedLegendre n).map (Int.castRingHom R) = (jacobi 0 0 n).comp (1 - C 2 * X)`. With
`2X - 1` in place of `1 - 2X` the identity holds only for even `n`. From it,
`Polynomial.integral_shiftedLegendre_mul_shiftedLegendre` is the orthogonality lemma that Mathlib
lacks: `∫₀¹ P̃ₘ(x) P̃ₙ(x) dx = if m = n then 1/(2n+1) else 0`. The Legendre `HilbertBasis` of
`L²((-1, 1))` is the case `α = β = 0` of §4.4.

*Needs:* §§3.3, 4.3; Mathlib `Polynomial.shiftedLegendre`, `Polynomial.degree_shiftedLegendre`.
*Locator:* DLMF 14.17.6; Table 18.6.1.

**Checks.**

- `n = 1`: `shiftedLegendre 1 = 1 - 2X` and `(jacobi 0 0 1).comp (1 - 2X) = 1 - 2X`; the
  `2X - 1` reading gives `2X - 1`.
- `∫₀¹ (1 - 2x)² dx = 1/3 = 1/(2·1+1)` and `∫₀¹ (1 - 2x) dx = 0`.
- The diagonal values `1, 1/3, 1/5, 1/7` and zero off-diagonal for `m, n ≤ 3`.

### 6.2 Gegenbauer

`Polynomial.gegenbauer (lam : R) (n : ℕ) : R[X]` is the ultraspherical polynomial `Cₙ^{(λ)}`. The
definition is total, so it is given by its own explicit sum (DLMF 18.5.10) and not as a quotient of
the Jacobi family: `[CommRing R] [Algebra ℚ R]` supplies no division by the parameter-dependent
element `(lam + 1/2)ₙ`, which vanishes (at `lam = -1/2`, `n = 1`) and can be a nonzero
non-unit.

`Cₙ^{(λ)}(X) = ∑ k ∈ Finset.range (n/2 + 1), ((-1)^k * (((1 : ℚ) / (k! * (n-2k)!)) • (ascPochhammer R (n-k)).smeval lam)) • (C 2 * X)^(n - 2k)`,

that is `∑ₖ (-1)^k (λ)ₙ₋ₖ / (k! (n-2k)!) (2X)^{n-2k}`. Every coefficient is a `ℚ`-scalar acting on
an element of `R`. Targets:

- `Polynomial.gegenbauer_one` (`= C (2 * lam) * X`), `Polynomial.gegenbauer_two`
  (`= C (2 * lam * (lam + 1)) * X ^ 2 - C lam`);
- `Polynomial.coeff_gegenbauer_self`: the coefficient of `X^n` is
  `((2 : ℚ)^n / n!) • (ascPochhammer R n).smeval lam`, DLMF Table 18.3.1;
- `Polynomial.degree_gegenbauer`: degree `n` as soon as `(ascPochhammer R n).smeval lam ≠ 0`
  (over `ℝ`, for `-1/2 < lam`, `lam ≠ 0`, since the zeros of `(λ)ₙ` are in `{0, -1, …, -(n-1)}`).
  The factor is `(λ)ₙ` and not `(2λ)ₙ`: the leading coefficient is
  `2ⁿ(λ)ₙ/n!`, and `(2λ)ₙ ≠ 0` does not imply `(λ)ₙ ≠ 0`;
- `Polynomial.gegenbauer_zero_param`: `gegenbauer 0 n = 0` for `n ≥ 1`, so the family is degenerate
  at `lam = 0` and the roadmap does not treat `gegenbauer 0 n` as the classical `λ = 0` family;
- `Polynomial.ascPochhammer_smeval_smul_gegenbauer`, the multiplied-out relation to Jacobi, which
  holds over every `ℚ`-algebra with no invertibility hypothesis:
  `(ascPochhammer R n).smeval (lam + 1/2) • gegenbauer lam n = (ascPochhammer R n).smeval (2 * lam) • jacobi (lam - 1/2) (lam - 1/2) n`
  with `1/2` entering as `algebraMap ℚ R (1/2)`. The classical quotient (DLMF 18.7.1) is recovered
  whenever `(lam + 1/2)ₙ` is invertible, but the target is the identity;
- `Polynomial.integral_gegenbauer_mul_gegenbauer`: for `-1/2 < lam`, `lam ≠ 0`, against
  `jacobiMeasure (lam - 1/2) (lam - 1/2)`, the weight `(1-x²)^{lam-1/2}`, the value
  `if m = n then π 2^{1-2lam} Γ(n+2lam) / (n! (n+lam) Γ(lam)²) else 0`. The orthogonality
  hypothesis is `-1/2 < lam`, which is exactly the Layer 4 hypothesis `-1 < α` at `α = lam - 1/2`,
  stated in the `lam` variable so that no call site translates it, and `lam ≠ 0` because the
  constant has `Γ(lam)` in the denominator;
- `Polynomial.exists_hilbertBasis_gegenbauer` (`-1/2 < lam`, `lam ≠ 0`): the Hilbert basis of
  `L²(jacobiMeasure (lam - 1/2) (lam - 1/2))` of the normalized `Cₙ^{(λ)}`, with its pin.

*Needs:* §§3.2, 4.3, 4.4. *Locator:* DLMF 18.5.10 (the sum), Table 18.3.1 (weight, `hₙ`, `kₙ`),
18.7.1 (the Jacobi relation).

**Checks.**

- `C₀ = 1`, `C₁ = 2λX`, `C₂ = 2λ(λ+1)X² - λ`.
- `λ = 1`: `C₂ = 4X² - 1 = U₂`, the Chebyshev polynomial of the second kind, with norm constant
  `π 2^{-1} Γ(n+2) / (n! (n+1) · 1) = π/2`.
- `λ = 1/2`: `C₂ = (3X² - 1)/2`, the Legendre polynomial `P₂`.
- Negative control for the degree hypothesis, `Polynomial.gegenbauer_neg_one_two`: `gegenbauer (-1) 2 = 1`, of degree `0`, although
  `(2λ)₂ = (-2)(-1) = 2 ≠ 0`; here `(λ)₂ = (-1)(0) = 0`. At `λ = 3` the leading coefficients are
  `6, 24, 80` for `n = 1, 2, 3`, which are `2ⁿ(3)ₙ/n!`, while `(6)ₙ = 6, 42, 336`.
- The multiplied-out relation at `λ = -1`, `n = 2`: `(−1/2)₂ · 1 = -1/4`, and
  `(−2)₂ · P₂^{(−3/2,−3/2)} = 2 · (−1/8) = -1/4`.
- `λ = 0`, `n = 1`: `gegenbauer 0 1 = 0`.

### 6.3 The Chebyshev consistency check

`Polynomial.Chebyshev.T R n` is `jacobi (-1/2) (-1/2) n` up to an explicit constant. Mathlib already
proves the Chebyshev orthogonality integrals, so this section is not a new result but a test of
§4.3 against values the library knows, the anti-vacuity milestone of the roadmap, in the spirit of
the `coe_` pins. Targets:

- `Polynomial.jacobi_neg_half_neg_half_eq_T`, with the scale pinned as part of the statement:
  `Pₙ^{(−1/2,−1/2)} = (((1 : ℚ) / n!) • (ascPochhammer R n).smeval (algebraMap ℚ R (1/2))) • Chebyshev.T R n`,
  i.e. `Pₙ = ((1/2)ₙ / n!) Tₙ` (DLMF 18.7.3, with `Pₙ^{(−1/2,−1/2)}(1) = (1/2)ₙ/n!`). An unscaled
  equality is false already at `n = 1`, where the Jacobi polynomial is `X/2` and `T₁ = X`;
- `Polynomial.jacobiMeasure_neg_half_neg_half_eq_measureT`: `jacobiMeasure (-1/2) (-1/2)` equals
  Mathlib's `Polynomial.Chebyshev.measureT`. The two are built over `Set.Ioo (-1) 1` and
  `Set.Ioc (-1) 1` and with `withDensity`/`restrict` in opposite orders; they agree because `{1}` is
  `volume`-null (the density is absolutely continuous with respect to `volume`) and
  `(1-x)^{-1/2} (1+x)^{-1/2} = (√(1-x²))⁻¹`, and the agreement is proved with
  `MeasureTheory.restrict_withDensity` before any `measureT` lemma is consumed;
- `Polynomial.jacobiNormSq_neg_half_neg_half_zero`: `jacobiNormSq (-1/2) (-1/2) 0 = π`, and
  `Polynomial.jacobiNormSq_neg_half_neg_half_succ`:
  `jacobiNormSq (-1/2) (-1/2) (n+1) = ((1/2)ₙ₊₁ / (n+1)!)² π / 2`, so that §4.3's constants
  reproduce Mathlib's `Polynomial.Chebyshev.integral_eval_T_real_mul_self_measureT_zero` (`π`) and
  `Polynomial.Chebyshev.integral_T_real_mul_self_measureT_of_ne_zero` (`π / 2`): the norm of `Pₙ^{(−1/2,−1/2)}` is the
  norm of `Tₙ` times the square of the scale above. `α = β = -1/2` is exactly the `n = 0`,
  `α + β = -1` edge of §4.3, and `π` versus `π/2` is where a wrong constant shows up.

*Needs:* §§3.2, 4.1, 4.3; Mathlib `Polynomial.Chebyshev.T`, `Polynomial.Chebyshev.measureT`,
`Polynomial.Chebyshev.integral_eval_T_real_mul_self_measureT_zero`,
`Polynomial.Chebyshev.integral_T_real_mul_self_measureT_of_ne_zero`,
`MeasureTheory.restrict_withDensity`. *Locator:* DLMF 18.7.3.

**Checks.**

- `n = 1`: `P₁^{(−1/2,−1/2)} = X/2` and `T₁ = X`, with scale `(1/2)₁/1! = 1/2`.
- `n = 2`: `P₂^{(−1/2,−1/2)} = (3/8)(2X² − 1) = (3/8) T₂`, scale `(1/2)₂/2! = 3/8`.
- `jacobiNormSq (-1/2) (-1/2) 1 = π/8 = (1/2)² · π/2`.
- Total masses: `jacobiMeasure (-1/2) (-1/2)` has mass `π`, equal to `∫ T₀² dmeasureT`.

### Examples

- Legendre, Chebyshev and Gegenbauer bases are all specializations of Layer 4's pinned basis.
- The weight `(1-x²)^{-1/2}` is the Jacobi weight at `α = β = -1/2`.

### Dependencies

Layers 3 and 4; Mathlib's Legendre and Chebyshev developments.

## Downstream consumers

Layer 6.1's Legendre orthogonality is the case of order `0` of the Legendre orthogonality that
SpecialFunctionsLegendre states, and Layer 6.2's Gegenbauer facts (the Jacobi relation, the degree,
the norm constant) are the polynomial statements that SpecialFunctionsBessel's Gegenbauer functions
agree with; those roadmaps own their analytic-continuation parts and cite these targets for the
polynomial statements. Layers 1 and 2 are the Laguerre data used by NoncompactQuantumSymmetry and
QuantumFoundations. Layers 2 and 4 supply the bases that the PDE roadmap consumes for
eigenfunction expansions.

## References

- DLMF, *NIST Digital Library of Mathematical Functions*, <https://dlmf.nist.gov>, Chapter 18
  (open access). Locators used above: Table 18.3.1 (weights, `hₙ`, `kₙ`); 18.5.5 with Table 18.5.1
  (Rodrigues); 18.5.8, 18.5.10, 18.5.12 (the explicit sums); 18.6.1 and Table 18.6.1 (special
  values and reflection); 18.7.1 and 18.7.3 (Gegenbauer and Chebyshev in terms of Jacobi); 18.9.2,
  18.9.13, 18.9.15, 18.9.23 (recurrences and derivatives); §14.17 (Legendre orthogonality).
- G. Szegő, *Orthogonal Polynomials*, AMS Colloquium Publications 23, Ch. IV (Jacobi) and Ch. V
  (Laguerre and Hermite); §4.3 is the Jacobi orthogonality relation including the `α + β + 1 = 0`
  remark.
- M. Abramowitz and I. Stegun, *Handbook of Mathematical Functions*, Ch. 22.
- R. Askey, *Orthogonal Polynomials and Special Functions*, CBMS-NSF 21.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Ch. 6.
- S. Thangavelu, *Lectures on Hermite and Laguerre Expansions*, Princeton Mathematical Notes 42.
