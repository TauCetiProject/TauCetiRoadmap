# Roadmap: the Laguerre and Jacobi orthogonal polynomials, and their L² bases

## Overview

Mathlib carries three classical orthogonal polynomial families as **algebraic** objects —
`Polynomial.hermite` (probabilists'), `Polynomial.Chebyshev.T`, `Polynomial.shiftedLegendre` — and,
since the `OrthogonalL2Bases` roadmap, a family-agnostic **L² Hilbert-basis layer** that turns an
orthogonality relation `∫ pₘ pₙ w = cₙ·δₘₙ` into a complete orthonormal basis. The remaining two
classical families are simply **not there**: a search of Mathlib finds *no* occurrence of
`Laguerre`, and every `Jacobi` is `jacobiSum`, `jacobiTheta`, or the unrelated `Jacobian`
coordinates of `WeierstrassCurve`. `Gegenbauer` is likewise absent.

`OrthogonalL2Bases` names this gap and defers it deliberately:

> **A separate future roadmap:** Laguerre and Jacobi L² bases. Unlike Chebyshev, **Mathlib has
> neither the Laguerre nor the Jacobi polynomials**, so grounding them means defining the families
> first — which belongs in its own roadmap, not here.

This is that roadmap. It has two halves, and only the first is new mathematics for the library:

1. the **algebraic families** `Polynomial.laguerre α n` and `Polynomial.jacobi α β n`, each with its
   complete basic theory — degree, leading coefficient, three-term recurrence, derivative identity,
   Rodrigues formula, and the classical special values;
2. their **orthogonality relations and L² bases**, which are then *instances* of the existing
   `OrthogonalL2Bases` bridge rather than new Hilbert-space theory.

The second half is short by design. The completeness mechanism that upgrades "orthogonal" to
"complete orthonormal basis" already exists and is family-agnostic, and — this is the reason these
two families are the right next step — **both of their weights already satisfy its hypothesis**:
the Laguerre weight `x^α e^{-x}` has finite exponential moments on `(0, ∞)`, and the Jacobi weight
`(1-x)^α (1+x)^β` is compactly supported, which the same lemma accepts automatically. Neither
family needs a new completeness argument.

### Why these two families repay more than their own statements

Jacobi is the general two-parameter family of the Hahn class, so its orthogonality relation
specializes to three further results the library wants:

- **Legendre.** Mathlib has `Polynomial.shiftedLegendre` with a Rodrigues formula
  (`Polynomial.factorial_mul_shiftedLegendre_eq`) and *no orthogonality lemma at all*. Legendre is
  Jacobi at `α = β = 0`, so this roadmap closes that gap as a specialization rather than a
  separate development.
- **Gegenbauer / ultraspherical.** Absent from Mathlib; Jacobi at `α = β = λ - 1/2`.
- **Chebyshev.** Jacobi at `α = β = -1/2`. Mathlib *already* proves the Chebyshev orthogonality
  integrals, which makes this specialization a **check on the general theorem rather than a new
  result** — see *Part F*, where it is used exactly that way.

Laguerre repays differently: its weight is the Gamma density, so the entire development is stated
against `Real.Gamma` and gives the library the orthogonal family attached to the exponential
distribution, the counterpart on `(0, ∞)` of what Hermite is on `ℝ`.

## Scope boundary (what this area is, and is not)

This area owns **two polynomial families and their L² structure**. The split from
`OrthogonalL2Bases` is by *kind of statement*, the same line that roadmap already drew:

- an **integral identity** (`∫ pₘ pₙ w = cₙδₘₙ`) is a target *here*, because neither family exists
  yet and so neither does its orthogonality relation;
- a **Hilbert-space theorem** ("…hence the normalized functions are a complete orthonormal basis of
  L²") is *consumed* from `OrthogonalL2Bases`, which owns that layer. This roadmap adds no new
  Hilbert-space machinery and should not: if a milestone here appears to need one, that is a defect
  in this roadmap or a gap in that one, not licence to build a second copy.

**Deliberately out of scope**, with reasons:

- The general orthogonal-polynomials-**of-a-measure** construction (Gram–Schmidt applied to
  monomials), Favard's theorem, and any abstract three-term-recurrence theory. `OrthogonalL2Bases`
  already places these out of scope for the same reason: they are the polynomial-identity layer, not
  a per-family development. Mathlib has `gramSchmidt` for inner product spaces and
  `Polynomial.Sequence` for degree-graded families; connecting them is its own roadmap.
- The rest of the Askey scheme (Hahn, Meixner, Krawtchouk, Wilson, and every q-analogue). Jacobi and
  Laguerre are the two classical continuous families Mathlib lacks; the discrete and basic
  hypergeometric families are a much larger programme.
- **Laguerre and Jacobi *functions*** as eigenfunctions of their Sturm–Liouville operators, and the
  associated PDE/spectral theory. The `PDE` roadmap is where an eigenfunction-expansion statement
  belongs; this roadmap supplies the basis it would consume.
- The multidimensional (tensor) Laguerre and Jacobi bases. `OrthogonalL2Bases` **B3** already proves
  the product and `pi` basis lemmas family-agnostically, so these are immediate instantiations once
  Parts B and D land, and are stated as targets in *Part E* rather than left implicit.

## Generality bar (decided up front; do not silently specialize)

- **Base ring: a ℚ-algebra, with the parameters in that ring.** Both families have coefficients
  that require division by factorials, so `ℤ[X]` — the home of `Polynomial.hermite` and
  `Polynomial.shiftedLegendre` — cannot hold them. Fix
  `variable {R : Type*} [CommRing R] [Algebra ℚ R]` and take `α β : R`. This is the weakest setting
  in which the definitions make sense, it keeps `ℝ` and `ℂ` as instances rather than special cases,
  and it matches how `Polynomial.Chebyshev.T` is stated over a general `CommRing` and used at `ℝ`.
- **No separate definition for the simple/classical special cases.** The simple Laguerre `Lₙ` is
  `laguerre 0 n`, Legendre is `jacobi 0 0 n`, Gegenbauer is `jacobi (lam - 1/2) (lam - 1/2) n` up to
  the classical normalizing factor. Each gets its own **lemmas** (and, where the classical
  normalization differs, its own `def` stated *as* a scalar multiple of the general one), never its
  own recursion. A second recursion is a second theory to maintain and to keep in sync.
- **Express generalized binomial coefficients with `ascPochhammer`, not `Ring.choose`.**
  `Ring.choose` needs a `BinomialRing` instance, and the instance covering `ℝ` is anonymous, so it
  cannot be cited in a proof or a docstring. `ascPochhammer` is polynomial-valued and evaluates at a
  ring element, which is exactly what a real parameter needs. Pin this: contributors will otherwise
  reach for `Ring.choose` and produce statements that are awkward to use downstream.
- **Measures are named, explicit definitions**, mirroring `Polynomial.Chebyshev.measureT` — which is
  the existing worked precedent in Mathlib for "orthogonality against a weighted restricted measure"
  and should be followed rather than re-invented.
- **Domains are the open intervals.** Laguerre on `Set.Ioi (0 : ℝ)`, Jacobi on `Set.Ioo (-1 : ℝ) 1`.
  The Jacobi weight is unbounded at both endpoints for negative parameters, and `Real.rpow` at a
  negative base is *not* the classical power (`x ^ y = exp (y log x) * cos (π y)` there), so every
  statement about the weight either carries `0 < 1 - x` and `0 < 1 + x` or escapes to natural-number
  exponents via `Real.rpow_natCast`. Chebyshev's `measureT` uses `Set.Ioc (-1) 1`; the half-open
  choice is harmless for its bounded weight but not for a general Jacobi weight, so this roadmap
  deliberately differs and says so.
- **Parameter hypotheses are carried, never assumed globally.** `-1 < α` for Laguerre; `-1 < α` and
  `-1 < β` for Jacobi. These are exactly the conditions for weight integrability, so a statement
  that omits them is false, not merely weaker.
- **Every basis milestone exports its element-level `coe_*` pin.** Inherited verbatim from
  `OrthogonalL2Bases`, and for the same reason: a `HilbertBasis ℕ 𝕜 (Lp …)` shipped only as a
  bundled term asserts nothing beyond separability. The `coe_*` lemma is what carries the Laguerre
  or Jacobi content, and downstream obligations are undischargeable without it.
- **Scalar-generic where the L² layer is.** Bases are stated through
  `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 μ)` over `[RCLike 𝕜]`, with the real-valued polynomial functions cast by
  `algebraMap ℝ 𝕜`. Do not duplicate the API at `ℝ` and `ℂ`.

## What Mathlib already has (consume)

Verified present at the pinned toolchain; names are exact.

**Gamma and Beta.**
- `Real.Gamma`, with `Real.Gamma_eq_integral` (`0 < s → Gamma s = ∫ x in Ioi 0, exp (-x) * x ^ (s-1)`),
  `Real.Gamma_add_one`, `Real.Gamma_nat_eq_factorial` (`Gamma (n+1) = n !`), `Real.Gamma_pos_of_pos`,
  and `Real.GammaIntegral_convergent`.
- `Complex.betaIntegral`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
  `Complex.betaIntegral_eq_Gamma_mul_div`. **There is no real-valued Beta function** — see **C1**,
  which makes it a target.

**The weight integrals, already evaluated.**
- `integral_rpow_mul_exp_neg_mul_rpow : 0 < p → -1 < q → 0 < b → ∫ x in Ioi (0:ℝ), x ^ q * exp (-b * x ^ p) = b ^ (-(q+1)/p) * (1/p) * Gamma ((q+1)/p)`.
  At `p = 1` this is precisely the Laguerre weight moment, **including the shifted exponent `b = 1 - a`
  that the finite-exponential-moment hypothesis needs**, which is why **B2** below is grounded rather
  than aspirational.
- `integrableOn_rpow_mul_exp_neg_mul_rpow : -1 < s → 1 ≤ p → 0 < b → IntegrableOn (fun x => x ^ s * exp (-b * x ^ p)) (Ioi 0)`.
  Note `1 ≤ p`, so `p = 1` is the boundary case and is covered.

**Polynomial infrastructure.**
- `ascPochhammer` and `descPochhammer` (polynomial-valued, evaluable at a ring element via `smeval`).
- `Polynomial.derivative`, the `Polynomial.iterate_derivative_*` family (including
  `Polynomial.iterate_derivative_mul`, the Leibniz rule, and
  `Polynomial.iterate_derivative_eq_zero_of_degree_lt`), which is the toolkit a Rodrigues formula is
  proved with — `Polynomial.factorial_mul_shiftedLegendre_eq` is the existing worked example.
- `Polynomial.Sequence` (a degree-graded family, `degree_eq'`), consumed by the completeness bridge.

**Integration by parts**, needed for the orthogonality proofs, in two shapes that must be cited
fully qualified because they share a base name and have incompatible hypotheses:
- `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` — the `Set.Ioi` form, for Laguerre;
- `intervalIntegral.integral_mul_deriv_eq_deriv_mul` — the finite-interval form, for Jacobi.

**The existing precedent to follow.** `Polynomial.Chebyshev.measureT` and the lemmas around it
(`integral_measureT`, `integrable_measureT`,
`integral_eval_T_real_mul_eval_T_real_measureT_of_ne`, `integral_T_real_mul_self_measureT_of_ne_zero`)
are Mathlib's one worked "orthogonality against a weighted restricted measure" development. Parts B
and D should read like it.

## What `OrthogonalL2Bases` already has (consume — cited dependency)

This roadmap depends on the following, by name. Each is merged and carries no `sorry`.

- `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` — moment determinacy from
  a finite exponential moment. **The completeness mechanism.**
- `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot` — the completeness conclusion for an
  **exact-degree** polynomial family: given `p : ℕ → Polynomial ℝ` with `(p n).degree = n`, a weight
  `w`, constants `c n > 0`, and the exponential-moment hypothesis on `μ.withDensity w`, the
  orthogonal complement of the span of the normalized family is `⊥`. It is family-agnostic: Laguerre
  and Jacobi are new *arguments* to it, not new proofs of it.
- `TauCeti.hilbertBasisOfWeightedMeasure` and `TauCeti.coe_hilbertBasisOfWeightedMeasure` — the basis
  of `L²(w·μ)` and its element-level pin.
- `TauCeti.hilbertBasisOfOrthogonalSystem` and `TauCeti.coe_hilbertBasisOfOrthogonalSystem` — the
  `√w`-envelope basis of `L²(μ)` and its pin, obtained through `weightL2Isometry` with no separate
  proof.
- `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le` — bounded support supplies the exponential moment
  automatically. **This is what makes the Jacobi completeness argument free**, and it is the same
  route the Chebyshev instance took.
- **B3**, the product and `pi` Hilbert bases, consumed by *Part E*.

## What is missing (build here)

The two polynomial families and their complete basic theory; a real-valued Beta function; the two
orthogonality relations with their exact normalizing constants; the four L² bases (two families ×
two normalizations) with their `coe_*` pins; the classical specializations; and the tensor bases.

---

## Part A — the Laguerre family (algebraic)

Sequenced first: it is the simpler of the two families and its orthogonality proof is the shorter,
so it validates the shape that Part C then follows.

**A1. Definition and degree.**

`Polynomial.laguerre (α : R) (n : ℕ) : R[X]`, the generalized Laguerre polynomial `Lₙ^{(α)}`,
defined by the explicit coefficient formula

`Lₙ^{(α)}(X) = ∑ k ∈ Finset.range (n+1), (-1)^k • ((ascPochhammer R (n-k)).smeval (α + k + 1) / ((n-k)! * k!)) • X^k`

with, as targets: `Polynomial.degree_laguerre` (`= n`), `Polynomial.natDegree_laguerre`,
`Polynomial.coeff_laguerre`, and `Polynomial.leadingCoeff_laguerre` (`= (-1)^n / n!`). The degree
lemma is not decoration — it is the hypothesis `hdeg` of the completeness theorem cited above, and
without it Part B cannot start.

**A2. The recurrences and the derivative.**

- `Polynomial.laguerre_zero` (`= 1`), `Polynomial.laguerre_one` (`= C (α + 1) - X`).
- `Polynomial.laguerre_succ_succ`, the three-term recurrence
  `(n+2) • Lₙ₊₂^{(α)} = (C (2n + α + 3) - X) * Lₙ₊₁^{(α)} - C (n + α + 1) * Lₙ^{(α)}`.
- `Polynomial.derivative_laguerre` : `derivative (Lₙ^{(α)}) = -Lₙ₋₁^{(α+1)}`, the identity that
  moves the parameter, and the reason the parameter must be a variable of the definition rather than
  fixed at `0`.
- `Polynomial.laguerre_add_one_sub` relating `Lₙ^{(α+1)}` to `Lₙ^{(α)}` and `Lₙ₋₁^{(α+1)}`.

**A3. Rodrigues.**

`Polynomial.laguerre_rodrigues`, the polynomial-level identity in the shape Mathlib already uses for
`shiftedLegendre`: `n ! • Lₙ^{(α)}` equals the `n`-fold `Polynomial.derivative` of `X^(n+α)`
weighted appropriately. Because the exponent `α` is not a natural number, the honest statement is
the **analytic** one on `Set.Ioi 0`,

`Lₙ^{(α)}.eval x = x ^ (-α) * exp x / n ! * iteratedDeriv n (fun t => exp (-t) * t ^ (n + α)) x`,

stated with `Real.rpow` and the hypothesis `0 < x`. This is the form the orthogonality proof in B3
consumes, so it is stated the way it is used.

**A4. Special values.** `Polynomial.laguerre_eval_zero` (`= ascPochhammer` at `α+1` over `n!`), and
the simple-Laguerre lemmas as the `α = 0` specialization.

## Part B — Laguerre orthogonality and the L² bases

**B1. The measure.** `Polynomial.laguerreMeasure (α : ℝ) : Measure ℝ`, defined as
`(volume.withDensity fun x => ENNReal.ofReal (x ^ α * Real.exp (-x))).restrict (Set.Ioi 0)`,
following `measureT`. Targets: measurability of the density, `IsFiniteMeasure` for `-1 < α` (which
is `Real.Gamma_eq_integral` after `rpow`), and `integral_laguerreMeasure` in the shape of
`integral_measureT`.

**B2. The finite exponential moment.** For `-1 < α` and any `0 < a < 1`,
`Integrable (fun x => Real.exp (a * |x|)) (laguerreMeasure α)`. On `Set.Ioi 0` the absolute value is
the identity and the integrand is `x ^ α * exp (-(1-a) * x)`, so this is
`integrableOn_rpow_mul_exp_neg_mul_rpow` at `p = 1`, `s = α`, `b = 1 - a`. **This is the whole
completeness argument.** It is one lemma because the mechanism was already built and is
family-agnostic; stating it as a named target rather than inlining it is deliberate, since it is the
hypothesis every downstream basis lemma cites.

**B3. The orthogonality relation.**

`Polynomial.integral_laguerre_mul_laguerre_laguerreMeasure` :
for `-1 < α`,

`∫ x, (laguerre α m).eval x * (laguerre α n).eval x ∂(laguerreMeasure α) = if m = n then Real.Gamma (n + α + 1) / n ! else 0`

proved by the Rodrigues formula A3 and `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul`,
repeatedly: `n`-fold integration by parts moves all derivatives onto the lower-degree factor and
kills the off-diagonal case by `Polynomial.iterate_derivative_eq_zero_of_degree_lt`. The diagonal
constant is then `Real.Gamma_eq_integral`. The boundary terms vanish because `exp (-t) * t ^ (n+α)`
and its derivatives tend to `0` at both ends — a target in its own right, since it is the step an
implementor will otherwise wave at.

**B4. The two Hilbert bases.** With A1's degree lemma, B2, and B3 in hand these are instantiations,
not proofs:

- `Polynomial.laguerreHilbertBasisOfWeightedMeasure α : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (laguerreMeasure α))`
  via `TauCeti.hilbertBasisOfWeightedMeasure`, with its `coe_` pin;
- `Polynomial.laguerreHilbertBasis α : HilbertBasis ℕ 𝕜 (Lp 𝕜 2 ((volume).restrict (Set.Ioi 0)))`,
  the `√w`-envelope basis whose elements are the **Laguerre functions**
  `x ↦ Lₙ^{(α)}(x) · x^{α/2} e^{-x/2} / √(Γ(n+α+1)/n!)`, via
  `TauCeti.hilbertBasisOfOrthogonalSystem`, with its `coe_` pin.

Both pins are required, per the generality bar.

## Part C — the Jacobi family (algebraic)

**C1. A real Beta function.** `Real.betaIntegral (u v : ℝ) : ℝ := ∫ x in (0:ℝ)..1, x ^ (u-1) * (1-x) ^ (v-1)`,
with `Real.betaIntegral_convergent`, `Real.betaIntegral_symm`, and
`Real.betaIntegral_eq_Gamma_mul_div : 0 < u → 0 < v → betaIntegral u v = Gamma u * Gamma v / Gamma (u + v)`,
each obtained from the existing `Complex` development by taking real parts. Mathlib has the complex
Beta function and no real one; the Jacobi weight integral is a Beta integral, so rather than route
every statement through `Complex.betaIntegral` and re-extract, this roadmap builds the real
counterpart and states the Jacobi results against it. This is a target here because the roadmap
needs it and it does not exist — not a dependency assumed to appear.

**C2. Definition and degree.** `Polynomial.jacobi (α β : R) (n : ℕ) : R[X]`, defined by the
classical explicit sum

`Pₙ^{(α,β)}(X) = (2^n)⁻¹ • ∑ k ∈ Finset.range (n+1), (binomial in ascPochhammer form) • (X - 1)^(n-k) * (X + 1)^k`,

with `Polynomial.degree_jacobi` (`= n`, under the standing parameter hypotheses), `natDegree_jacobi`,
`coeff_jacobi`, and `leadingCoeff_jacobi`
(`= (ascPochhammer R n).smeval (n + α + β + 1) / (2^n * n !)`).

**Degeneracy to pin now, not discover later.** The leading coefficient vanishes exactly when
`n + α + β + 1` hits a non-positive integer, so `degree_jacobi = n` is *false* without a hypothesis.
Carry `-1 < α`, `-1 < β` (which suffice) rather than the sharper arithmetic condition, and say so in
the docstring.

**C3. The recurrences, symmetry, and the derivative.**
- `Polynomial.jacobi_zero` (`= 1`), `Polynomial.jacobi_one`.
- `Polynomial.jacobi_neg_comp` : `Pₙ^{(α,β)}(-X) = (-1)^n Pₙ^{(β,α)}(X)`, the reflection symmetry;
  it is what makes the `α ↔ β` half of every later proof free, and it is the analogue of the
  existing `Polynomial.neg_one_pow_mul_shiftedLegendre_comp_one_sub_X_eq`.
- `Polynomial.jacobi_succ_succ`, the three-term recurrence.
- `Polynomial.derivative_jacobi` : `derivative (Pₙ^{(α,β)}) = C ((n + α + β + 1)/2) * Pₙ₋₁^{(α+1,β+1)}`.

**C4. Rodrigues.** `Polynomial.jacobi_rodrigues`, in the analytic form on `Set.Ioo (-1) 1`:

`(jacobi α β n).eval x = (-1)^n / (2^n * n !) * (1-x) ^ (-α) * (1+x) ^ (-β) * iteratedDeriv n (fun t => (1-t) ^ (n+α) * (1+t) ^ (n+β)) x`

with `-1 < x` and `x < 1`. As in A3, stated as the orthogonality proof consumes it.

## Part D — Jacobi orthogonality and the L² bases

**D1. The measure.** `Polynomial.jacobiMeasure (α β : ℝ) : Measure ℝ`, namely
`(volume.withDensity fun x => ENNReal.ofReal ((1-x) ^ α * (1+x) ^ β)).restrict (Set.Ioo (-1) 1)`,
with density measurability, and `IsFiniteMeasure` for `-1 < α`, `-1 < β` — the latter being
`Real.betaIntegral` from C1 after the affine change of variables `x = 2t - 1`.

**D2. Completeness is automatic.** `jacobiMeasure α β` is supported in `[-1, 1]`, so the finite
exponential moment follows from `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le` with no analytic
work. State it as a named lemma anyway, for the same reason as B2.

**D3. The orthogonality relation, and its genuine edge case.**

For `-1 < α`, `-1 < β`, and `m ≠ n`, the integral vanishes. On the diagonal, for
`2n + α + β + 1 ≠ 0`,

`∫ x, ((jacobi α β n).eval x)^2 ∂(jacobiMeasure α β) = 2^(α+β+1)/(2n+α+β+1) * (Γ(n+α+1) * Γ(n+β+1))/(Γ(n+α+β+1) * n !)`.

**The excluded case is real and must be a separate target, not a hypothesis swept under the rug.**
`2n + α + β + 1 = 0` happens exactly at `n = 0` with `α + β = -1` — which includes
`α = β = -1/2`, the Chebyshev weight. There the classical quotient is `0/0` and the correct value is
the limit; state `n = 0`, `α + β = -1` separately, where the integral is `2^{α+β+1}·B(α+1,β+1)`
directly. An implementor who states only the general formula will produce something false at
precisely the parameters Part F then checks against.

Proof route as in B3: Rodrigues C4 plus `intervalIntegral.integral_mul_deriv_eq_deriv_mul`, `n`
times, with boundary terms vanishing because `(1-t)^{n+α}(1+t)^{n+β}` has a zero of order at least
`n + α > n - 1` at each endpoint.

**D4. The two Hilbert bases.** `Polynomial.jacobiHilbertBasisOfWeightedMeasure` and
`Polynomial.jacobiHilbertBasis`, exactly parallel to B4, each with its `coe_` pin.

## Part E — the tensor bases

Immediate instantiations of `OrthogonalL2Bases` **B3** once B4 and D4 exist, and listed as targets
so that "immediate" is recorded as work rather than assumed:

- `Polynomial.laguerrePiHilbertBasis (ι) [Fintype ι] : HilbertBasis (ι → ℕ) 𝕜 (Lp 𝕜 2 (Measure.pi fun _ => laguerreMeasure α))`,
  the multidimensional Laguerre basis, with its `coe_` pin;
- `Polynomial.jacobiPiHilbertBasis` likewise.

## Part F — the classical specializations, and the consistency check

**F1. Legendre.** `Polynomial.jacobi 0 0 n` is the Legendre polynomial. Mathlib's
`Polynomial.shiftedLegendre` is its affine transport to `[0,1]`; prove
`Polynomial.shiftedLegendre_eq_jacobi_comp` relating them, and then export
`Polynomial.integral_shiftedLegendre_mul_shiftedLegendre` — **the orthogonality lemma Mathlib
currently lacks entirely** — as a corollary of D3. Also the Legendre `HilbertBasis` of `L²[-1,1]`.

**F2. Gegenbauer.** `Polynomial.gegenbauer (lam : R) (n : ℕ) : R[X]`, defined as the classical
scalar multiple of `jacobi (lam - 1/2) (lam - 1/2) n` — a `def` because the classical normalization
genuinely differs, not a second recursion — with its degree, recurrence, and orthogonality
inherited from Part C and D3.

**F3. The Chebyshev consistency check.** `Polynomial.Chebyshev.T ℝ n` is `jacobi (-1/2) (-1/2) n`
up to an explicit constant. Mathlib **already proves** the Chebyshev orthogonality integrals
(`integral_eval_T_real_mul_eval_T_real_measureT_of_ne`,
`integral_eval_T_real_mul_self_measureT_zero` giving `π`, and
`integral_T_real_mul_self_measureT_of_ne_zero` giving `π/2`). So this milestone is **not a new
result — it is a test of D3 against a value the library already knows**, and it is the reason the
`n = 0`, `α + β = -1` case in D3 must be stated correctly: `α = β = -1/2` is exactly that case, and
`π` versus `π/2` is exactly where a wrong constant shows up.

Target: `Polynomial.jacobi_neg_half_neg_half_eq_T`, relating the two families, and from it a proof
that D3's constants reproduce Mathlib's three Chebyshev integrals. A contributor who lands D3
without F3 has shipped an unchecked formula; **F3 is the anti-vacuity milestone of this roadmap**,
in the same spirit as the `coe_*` pins.

## Anti-vacuity

Two failure modes are specific to this area and each has a milestone that catches it.

1. **A degenerate family.** If `degree_jacobi` is stated without the parameter hypotheses it is
   false, and if it is stated with hypotheses that are never checked downstream the basis milestones
   are vacuous. C2 pins the hypotheses and Part D carries them.
2. **A wrong normalizing constant.** The orthogonality constants are the whole content of B3 and D3,
   and nothing in the Hilbert-basis layer would detect an error in them: the bridge takes `cₙ > 0` as
   a hypothesis and normalizes by it, so a wrong-but-positive `cₙ` still yields a perfectly good
   `HilbertBasis` of the wrong functions. **F3 is the check**, and for Laguerre the corresponding
   check is `Polynomial.laguerre_eval_zero` against `Real.Gamma_nat_eq_factorial` at `α = 0`.

## Dependency ordering

Part A, then B, is the shorter of the two families and establishes the proof shape
(Rodrigues → repeated integration by parts → Gamma constant → instantiate the bridge). Part C then
follows that shape on the harder family, with **C1** (the real Beta function) landing first since D1
needs it. **D3 and F3 belong to the same milestone in practice** — the check is not a follow-up, it
is how the constant is known to be right. Part E is independent of C/D once B4 exists and can land
in parallel. Part F1's Legendre export is the highest-value single item for existing Mathlib users
and should not be deferred to the end.

## Coordination and what is already in motion

Checked before writing: a search of every pull request ever opened against `mathlib4` finds **no
Laguerre, Jacobi-polynomial, or Gegenbauer development**, open or closed. (The single PR whose text
mentions Laguerre does so only in a bibliography entry.) This area is greenfield.

Two nearby efforts should be cited and coordinated with rather than collided into:

- **mathlib4 #41840** (`SofiaSL`, `Alan Li`) generalizes `Polynomial.hermite` to an arbitrary
  commutative ring and states that it is "the first in a sequence of PRs … proving that the Hermite
  polynomials are orthogonal and form a basis of the associated Hilbert space." That is the Hermite
  analogue of `OrthogonalL2Bases` Part A, upstream and independently developed. This roadmap does not
  touch Hermite, but its base-ring decision above should stay compatible with whatever generality
  that PR settles on, and the two efforts should be introduced to each other on Zulip before either
  family's orthogonality lands in Mathlib proper.
- **Tau Ceti #1474** (`eohjelle`, "identify the Chebyshev basis with cosines", merged 2026-07-30) is
  the closest existing work to Part F3's change-of-variable argument, and its author is the natural
  reviewer for that milestone.

## References

- G. Szegő, *Orthogonal Polynomials*, AMS Colloquium Publications 23 — Ch. IV (Jacobi) and Ch. V
  (Laguerre and Hermite). §4.3 is the Jacobi orthogonality relation with the constant used in D3,
  including the `α + β + 1 = 0` remark.
- M. Abramowitz, I. Stegun, *Handbook of Mathematical Functions*, Ch. 22 (orthogonal polynomials:
  the standard normalizations, recurrences, and Rodrigues formulae adopted here).
- R. Askey, *Orthogonal Polynomials and Special Functions*, CBMS-NSF 21.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Ch. 6.
- S. Thangavelu, *Lectures on Hermite and Laguerre Expansions*, Princeton Mathematical Notes 42 —
  the L² expansion theory this roadmap's bases make available.
