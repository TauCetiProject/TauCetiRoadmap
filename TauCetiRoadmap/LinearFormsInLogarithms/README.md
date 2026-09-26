# Roadmap: linear forms in logarithms, Baker's theorem over `ℂ` and `ℂ_p`

This roadmap is about the transcendence of values of the exponential function. Its main results
are Baker's theorem on linear forms in logarithms, over `ℂ` and over `ℂ_p`, and the classical
theorems that come before it.

Over `ℂ`, **Baker's theorem** says: if `α₁, …, αₙ` are nonzero algebraic numbers whose logarithms
are linearly independent over `ℚ`, then `1, log α₁, …, log αₙ` are linearly independent over the
algebraic numbers. We prove it as Waldschmidt does in Chapter 4 of *Diophantine Approximation on
Linear Algebraic Groups*, through the Schneider–Lang criterion for `ℂ^{d₀} × (ℂˣ)^{d₁}` (his
Corollary 4.2, with the direct proof of Section 4.6). Hermite–Lindemann and Gelfond–Schneider come
out of the same criterion on the way. The two analytic ingredients are a Schwarz lemma for Cartesian
products (Proposition 4.7) and an auxiliary function built by the Thue–Siegel method
(Proposition 4.10). Both need power series in several variables at the level of multi-indices,
which Mathlib does not have, so we build that too. The book is cited so that it is clear which
proof is meant; where a target below differs from it, the target says so.

Over `ℂ_p` the corresponding statement is **Baker's theorem over `ℂ_p`** (Layer 8): if
`ℓ₁, …, ℓₙ ∈ ℂ_[p]` lie in the disc `‖z‖ < p ^ (-1 / (p - 1))` where the exponential converges, have
algebraic exponentials, and are linearly independent over `ℚ`, then `1, ℓ₁, …, ℓₙ` are linearly
independent over the algebraic numbers. Brumer carried Baker's method over to `ℂ_p` (1967), to study
the `p`-adic rank of units. The criterion is of no use here, since it needs functions defined on all
of `ℂⁿ` and the `p`-adic exponential only converges on that disc. We follow Baker's own argument
instead, as in Chapter 2 of Baker's *Transcendental Number Theory*: it works with series in one
variable along a diagonal and needs no multiplicity estimate. Layer 8 uses the arithmetic of Layer 3
and nothing else from the complex part.

Mathlib has Liouville numbers, the house of an algebraic number, Siegel's lemma over number fields,
and the analytic half of Hermite's method for Lindemann–Weierstrass. It does not prove that `e` or
`π` is transcendental, and it has no Gelfond–Schneider theorem. Two Mathlib pull requests cover
part of this: [#28013](https://github.com/leanprover-community/mathlib4/pull/28013), by Yuyang
Zhao, proves Lindemann–Weierstrass, and `e` and `π` with it, and
[#42911](https://github.com/leanprover-community/mathlib4/pull/42911), by M. Karatarakis, proves
Gelfond–Schneider by the one-variable method. *Coordination with Mathlib* below says how the
roadmap treats them. The roadmap depends on no other roadmap; it consumes Mathlib and the Tau Ceti
declarations listed below.

Suggested homes:
- `TauCeti/Analysis/Analytic/MultiIndex/`: multi-index power series and Taylor coefficients
  (Layer 0);
- `TauCeti/Analysis/Complex/Polydisc/`: estimates on polydiscs (1.1, 1.2, 1.4, 1.6), with the
  one-variable Schwarz lemma of 1.3 and the general-normed-space 1.5 in `TauCeti/Analysis/Complex/`;
- `TauCeti/Analysis/Complex/ExpPolynomial/`: exponential polynomials (Layer 2);
- `TauCeti/NumberTheory/NumberField/House/`: Liouville's inequality, sizes of algebraic numbers
  and Siegel's lemma with a constant (3.1, 3.2, 3.3, 3.5), and the ultrametric Liouville
  inequality of 8.2;
- `TauCeti/NumberTheory/GeometryOfNumbers/`: the Thue–Siegel lemma (3.4), next to the packing
  bound it resembles;
- `TauCeti/NumberTheory/Transcendental/`: the auxiliary function, the criterion, its consequences
  and Baker's theorem (Layers 4–7);
- `TauCeti/Analysis/Analytic/`: the order lemma of 1.3, over any nontrivially normed field, and
  the ultrametric Schwarz lemma of 8.2; `TauCeti/Analysis/Normed/Field/`: integral elements in an
  ultrametric field (8.2);
- `TauCeti/NumberTheory/Padics/`: norms of integers and the exponential on its disc in a normed
  field over `ℚ_p` (8.1 and the integer bound of 8.2), and the coefficient bound and the value of
  an exponential polynomial there (8.4);
- `TauCeti/RingTheory/PowerSeries/`: power series with many zeros (8.3), next to `GaussNorm.lean`,
  and the derivatives of an exponential polynomial (8.4), next to `Exp.lean`;
  `TauCeti/RingTheory/Polynomial/`: `expDerivFactor` (8.4) and Hermite interpolation (8.5);
- `TauCeti/NumberTheory/Transcendental/Padic/`: Baker's auxiliary function over `ℂ_[p]` and
  Baker's theorem over `ℂ_[p]` (8.6–8.10).

## Scope

In scope:
- multi-index coefficients and Taylor coefficients of analytic functions on `ι → 𝕜`, over any
  nontrivially normed field, with their basic API (Layer 0);
- Cauchy, maximum-modulus and Schwarz estimates on polydiscs in `ι → ℂ` (Layer 1);
- exponential polynomials in several variables: their Taylor coefficients, growth and linear
  independence (Layer 2);
- Liouville's inequality, bounds for the sizes of sums and products of algebraic numbers, the
  number field generated by finitely many algebraic numbers, the Thue–Siegel lemma, and Siegel's
  lemma over a number field with a constant depending only on the field (Layer 3);
- the auxiliary function of Proposition 4.10 (Layer 4);
- the Schneider–Lang criterion for `ℂ^{d₀} × (ℂˣ)^{d₁}` (Corollary 4.2), with the steps of one
  proof as milestones (Layer 5); its consequences Corollaries 4.3 and 4.4, Hermite–Lindemann and
  Gelfond–Schneider (Layer 6); and Baker's theorem with Baker's corollaries (Layer 7);
- the exponential on its disc of convergence in every complete normed field over `ℚ_p`,
  Liouville's inequality at an ultrametric place, bounds for power series with many zeros in the
  closed unit disc, Hermite interpolation with ultrametric bounds, Baker's auxiliary function on
  the diagonal over `ℂ_[p]`, and Baker's theorem over `ℂ_[p]` (Layer 8).

The [Local fields and ramification](../LocalFieldsRamification/README.md) roadmap owns
`localExponential` and `localLogarithm` on a finite extension `K` of `ℚ_p`: their construction,
their convergence and continuity on the deep units, and the isomorphism `U(K,i) ≃ 𝓂[K]^i` (its
"Deep units in mixed characteristic"). This roadmap owns only the facts of 8.1 about Mathlib's
`NormedSpace.exp` in a normed field over `ℚ_p`, that is, with a norm making it a normed
`ℚ_[p]`-algebra, which Layer 8 needs for `ℂ_[p]`. That roadmap normalises the absolute value of
`K`, which in general is not such a norm, so 8.1 states nothing about `localExponential`, and
neither roadmap depends on the other.

Not in this roadmap, and not owned by any other roadmap unless stated:
- the Schneider–Lang criterion for algebraically independent entire functions of finite order
  whose partial derivatives are polynomials in them (Waldschmidt, Theorem 4.1), and its extension
  to meromorphic functions; both need the growth theory of entire functions of finite order in
  several variables;
- effective lower bounds for linear forms in logarithms (Baker–Wüstholz, Matveev); Baker's
  theorem here is qualitative;
- Siegel's theorem on integral points, whose proofs need Roth's theorem or effective lower bounds
  for linear forms in logarithms; the [Elliptic curves](../EllipticCurves/README.md) roadmap
  excludes it for the same reason. The Thue–Siegel lemma of 3.4 is Siegel's box-principle lemma,
  not the Thue–Siegel–Roth theorem;
- the Lindemann–Weierstrass theorem, which is proved by Hermite's method rather than by the
  criterion. Mathlib has the analytic part of that method
  (`Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean`), and Mathlib PR #28013
  proves the theorem; see *Coordination with Mathlib*;
- algebraic independence (Schanuel's conjecture, Nesterenko's theorem) and the six exponentials
  theorem;
- the `p`-adic Schneider–Lang criterion, and elliptic analogues;
- a `p`-adic logarithm function on `ℂ_[p]`: Layer 8 is stated through the exponential;
- Weierstrass preparation, and the theory of Tate algebras, which the
  [Foundations of adic spaces](../AdicSpaces/README.md) roadmap owns (its §0.5). Tau Ceti already
  has Weierstrass division with Gauss-norm bounds, which 8.3 consumes.

## Conventions

These are fixed for every target below.

- **Namespaces.** The targets carry the names in `Suggested.lean`. Lemmas about a Mathlib type
  whose first explicit argument or hypothesis has that type sit in its namespace
  (`FormalMultilinearSeries.mvCoeff`, `HasFPowerSeriesOnBall.norm_mvCoeff_mul_pow_le`,
  `AnalyticAt.mvTaylorCoeff_smul`, `PowerSeries.…`, `Polynomial.…`, `NumberField.…`). The
  criterion's statements are in `SchneiderLang`, Baker's theorem and its corollaries in `Baker`,
  Baker's theorem over `ℂ_[p]` in `PadicBaker`, the facts about the `p`-adic exponential in
  `PadicExp`, and the norms of integers in a normed field over `ℚ_[p]` in `Padic`. The steps of the
  proofs of 5.7 and 8.10 are in `SchneiderLangProof` and `PadicBakerProof`, namespaces of their own
  because they serve only those proofs. The names taken from Mathlib PRs keep those PRs'
  namespaces.
- **Several complex variables.** The ambient space is `ι → ℂ` for `[Fintype ι]`, with Mathlib's sup
  norm, and `n = Fintype.card ι` where a dimension is needed; Layers 5 and 6 index by `Fin n`, as
  Waldschmidt does. A polydisc about `0` is `Metric.closedBall (0 : ι → ℂ) R` or `Metric.ball 0 R`,
  and "the closed disc of radius `r`" is `‖ζ‖ ≤ r`. Tau Ceti's `TauCeti.GeometryOfNumbers.box r c`
  is the closed polydisc of polyradius `c • r`; every polydisc here has equal radii, where
  `box (fun _ => 1) R` is `Metric.closedBall 0 R`, and the targets use the Mathlib form. Layer 0 is
  stated over an arbitrary nontrivially normed field `𝕜`, on `ι → 𝕜`; Layers 1 and 2 are over
  `ℂ`. Values lie in a normed space `F`, complete where sums are formed. Nonemptiness of an index
  type is `[Nonempty ι]`.
- **Multi-indices** are functions `α : ι → ℕ`; the monomial is `∏ i, z i ^ α i`; the total degree
  is `∑ i, α i`; the multi-indices of total degree `k` are `Finset.univ.piAntidiag k`. "Order `< m`
  in each coordinate" is `∀ i, κ i < m`; "total degree `< M`" is `∑ i, κ i < M`. Functions are used
  rather than `ι →₀ ℕ` because every multi-index here is indexed by a finite type, where the two
  are equivalent (`Finsupp.equivFunOnFinite`), and because the targets are about functions on
  `ι → 𝕜` rather than about Mathlib's `MvPowerSeries`; where a target meets `MvPolynomial` (2.3),
  that equivalence identifies the exponents. Waldschmidt writes `|σ|` for `maxᵢ σᵢ` and `‖σ‖` for
  `∑ᵢ σᵢ`; the roadmap never uses his notation.
- **Coefficients.** `FormalMultilinearSeries.mvCoeff p α : F` is the multi-index coefficient of
  `p : FormalMultilinearSeries 𝕜 (ι → 𝕜) F` (0.3). It is not called `coeff`, because
  `FormalMultilinearSeries.coeff` is Mathlib's one-variable coefficient. `mvTaylorCoeff f x α : F`
  is the coefficient of `(z - x) ^ α` in the expansion of `f` about `x`, defined from any
  `FormalMultilinearSeries` of `f` at `x` (0.4), and `0` where `f` is not analytic at `x`
  (`mvTaylorCoeff_of_not_analyticAt`). Waldschmidt's `D^σ f (ξ)` is `σ! • mvTaylorCoeff f ξ σ`
  with `σ! = ∏ i, (σ i)!`; every statement is made in terms of `mvTaylorCoeff`, not of iterated
  derivatives, and 0.4 proves the two agree. Mathlib's `taylorCoeffWithin` is the one-variable
  real notion, with the factorial inverted.
- **Analyticity and bounds on a polydisc** are Mathlib's `AnalyticOnNhd ℂ f (Metric.closedBall 0 R)`
  and the hypothesis `∀ y ∈ Metric.closedBall 0 R, ‖f y‖ ≤ M` (with `Metric.ball` for open
  polydiscs), never a new predicate. Power series on a polydisc are Mathlib's
  `HasFPowerSeriesOnBall f p 0 R`.
- **Algebraic and transcendental numbers** are `IsAlgebraic ℚ z` and `Transcendental ℚ z`.
  Mathlib also states transcendence over `ℤ` (`Liouville.transcendental`, and Mathlib PR #28013);
  for complex numbers the two agree, by `Algebra.IsAlgebraic.isAlgebraic_iff ℤ ℚ` and
  `Algebra.IsAlgebraic.transcendental_iff ℤ ℚ`, with `Algebra.IsAlgebraic ℤ ℚ` from
  `IsLocalization.isAlgebraic`. A target that takes the name of a Mathlib PR also takes its
  statement, over `ℤ` where the PR is over `ℤ`. The field generated by finitely many algebraic
  numbers is `IntermediateField.adjoin ℚ S`, finite-dimensional by
  `IntermediateField.finiteDimensional_adjoin` and a number field by
  `NumberField.of_module_finite`; its embedding is `IntermediateField.val`, and embeddings in
  general are `K →+* ℂ` or `K →+* ℂ_[p]`. The size of an algebraic integer is `NumberField.house`.
- **Logarithms of algebraic numbers carry no branch.** "`x` is a logarithm of an algebraic number"
  is `IsAlgebraic ℚ (Complex.exp x)`; nonvanishing of `exp x` is automatic. No definition of the
  `ℚ`-vector space of such logarithms is introduced. Complex powers `a ^ b` appear only in the
  corollaries phrased with Mathlib's principal branch `Complex.cpow`, and each such corollary is
  derived from its branch-free form.
- **Exponential polynomials** are written out,
  `fun z => (∏ v, z v ^ τ v) * Complex.exp (∑ v, w v * z v)`, with no named definition; the
  pairing `w · z` is `∑ v, w v * z v`.
- **`p`-adic numbers.** `ℂ_[p]` is Mathlib's `PadicComplex p`, with its norm
  (`‖(p : ℂ_[p])‖ = p⁻¹`), which is ultrametric, and `PadicComplex.isAlgClosed`. The facts of 8.1
  are stated for any complete nontrivially normed field `L` over `ℚ_[p]`
  (`[NormedAlgebra ℚ_[p] L]`), which is ultrametric by `IsUltrametricDist.of_normedAlgebra`. The
  radius of the exponential is the real power `(p : ℝ) ^ (-((p : ℝ) - 1)⁻¹)`, never a quotient of
  natural numbers, and the exponential is Mathlib's `NormedSpace.exp`. "`ℓ` is a `p`-adic
  logarithm of an algebraic number" is `‖ℓ‖ < p ^ (-1 / (p - 1))` together with
  `IsAlgebraic ℚ (NormedSpace.exp ℓ)`. ⚠ The norm condition cannot be dropped: `NormedSpace.exp`
  is the sum of a series and takes the value `0` where the series diverges, so off the disc
  `IsAlgebraic ℚ (NormedSpace.exp ℓ)` holds for every `ℓ` (`PadicComplex.exp_one_eq_zero`).
  Series in one variable are Mathlib's `PowerSeries K`, with the formal derivative
  `PowerSeries.derivative` and the value `FormalMultilinearSeries.ofScalarsSum` of the
  coefficient sequence (`ofScalars_sum_eq`: the sum `∑' n, c n • x ^ n`).
- **Sizes of algebraic numbers** are the pair of hypotheses `IsIntegral ℤ ((δ : K) ^ a * α)` and
  `house ((δ : K) ^ a * α) ≤ H` for a denominator `δ : ℕ`, an exponent `a` and a bound `H`, carried
  explicitly; there is no predicate bundling them. Mathlib's absolute heights (`Height.logHeight₁`,
  `Mathlib/NumberTheory/Height/`) are not used: Liouville's inequality in the form 3.1 needs only
  the house, and the size bounds of 3.2 combine houses directly.

## What Mathlib already has (consume)

All references are to the Mathlib commit pinned by Tau Ceti.

- **Power series and analyticity:** `FormalMultilinearSeries`, `HasFPowerSeriesOnBall`,
  `AnalyticAt`, `AnalyticOnNhd` (`Mathlib/Analysis/Analytic/`), uniqueness of the homogeneous terms
  (`HasFPowerSeriesAt.apply_eq_zero`, `Analysis/Analytic/Uniqueness.lean`), composition with
  continuous linear maps (`HasFPowerSeriesOnBall.compContinuousLinearMap`), change of origin, and
  the iterated derivative of an analytic function, on the diagonal
  (`HasFPowerSeriesOnBall.factorial_smul`, `Analysis/Calculus/FDeriv/Analytic.lean`) and in general
  as a sum over permutations (`HasFPowerSeriesOnBall.iteratedFDeriv_eq_sum_of_completeSpace`,
  `Analysis/Analytic/IteratedFDeriv.lean`, which needs only a power series at the point).
- **One complex variable:** Cauchy's estimate for derivatives
  (`Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`, `Analysis/Complex/Liouville.lean`),
  the maximum modulus principle on an arbitrary complex normed domain
  (`Complex.norm_le_of_forall_mem_frontier_norm_le`, `Analysis/Complex/AbsMax.lean`), removable
  singularities of divided differences (`Complex.differentiableOn_dslope`,
  `Analysis/Complex/RemovableSingularity.lean`), iterated divided differences
  (`pow_sub_smul_iterate_dslope_of_zero`, `Analysis/Calculus/DSlope.lean`;
  `HasFPowerSeriesAt.has_fpower_series_iterate_dslope_fslope`,
  `Analysis/Analytic/IsolatedZeros.lean`), and Schwarz's lemma for a zero of any order between
  complex normed spaces (`Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO`,
  `Analysis/Complex/Schwarz.lean`), which 1.3 consumes.
- **Series:** Cauchy products of absolutely summable series
  (`hasSum_sum_range_mul_of_summable_norm`, `summable_mul_of_summable_norm`), the exponential series
  (`NormedSpace.expSeries_div_hasSum_exp`, `Complex.exp_eq_exp_ℂ`,
  `NormedSpace.exp_add_of_mem_ball`).
- **Polynomials:** `Polynomial.taylor`, root multiplicities (`Polynomial.le_rootMultiplicity_iff`,
  `Polynomial.rootMultiplicity_eq_natTrailingDegree`), `MvPolynomial.funext`,
  `Finsupp.equivFunOnFinite`, and `SeparatingDual.eq_zero_of_forall_dual_eq_zero` for passing from
  scalar to vector coefficients.
- **Algebraic numbers:** `IsAlgebraic`, `Transcendental`, common denominators
  (`exists_integral_multiples`), `IntermediateField.finiteDimensional_adjoin`,
  `NumberField.of_module_finite`, `NumberField.house` with `house_add_le`, `house_mul_le`,
  `house_pow_le`, `house_sum_le_sum_house`, `house_prod_le`, `house_intCast`, `house_nat_mul`,
  `norm_embedding_le_house`, `one_le_house_of_isIntegral`, and the bound of the field norm by one
  embedding (`NumberField.norm_norm_le_norm_mul_house_pow`), in
  `NumberTheory/NumberField/House.lean`.
- **Discriminants:** the matrix of embeddings of a basis is invertible, from
  `Algebra.discr_not_zero_of_basis` and `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`
  (`RingTheory/Discriminant.lean`); used in 7.1.
- **Siegel's lemma:** `Int.Matrix.exists_ne_zero_int_vec_norm_le` (`NumberTheory/SiegelsLemma.lean`)
  and its number-field form `NumberField.house.exists_ne_zero_int_vec_house_le`, whose constant
  `c₁` is private at the pin; 3.5 states a form with a constant (see *Coordination with
  Mathlib*). These solve linear *equations*; the transcendence
  argument over `ℂ` needs small values of linear *forms* (3.4), which they do not give.
- **`p`-adic numbers and ultrametric fields:** `ℂ_[p]` (`PadicComplex`,
  `NumberTheory/Padics/Complex.lean`) with `PadicComplex.isAlgClosed`;
  `IsUltrametricDist.of_normedAlgebra`; norms in `ℚ_[p]` and in normed algebras over it
  (`Padic.norm_eq_zpow_neg_valuation`, `norm_algebraMap'`); Legendre's formula for the valuation of
  `n!` (`sub_one_mul_padicValNat_factorial`); ultrametric sums
  (`IsUltrametricDist.norm_tsum_le_of_forall_le_of_nonneg`,
  `NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero`); integral elements and the valuation
  ring (`Valuation.Integers.mem_of_integral`, `NormedField.valuation`); the field norm as a product
  over embeddings (`Algebra.norm_eq_prod_embeddings`, for 8.2).
- **Power series in one variable:** `PowerSeries` with `PowerSeries.derivative`
  (`PowerSeries.coeff_derivative`), `PowerSeries.exp`, `PowerSeries.rescale`, the Gauss norm
  (`PowerSeries.gaussNorm`, `RingTheory/PowerSeries/GaussNorm.lean`; `Polynomial.gaussNorm_mul`,
  `RingTheory/Polynomial/GaussNorm.lean`), and evaluation of a coefficient sequence
  (`FormalMultilinearSeries.ofScalarsSum`, `Analysis/Analytic/OfScalars.lean`, with
  `NormedSpace.exp_eq_ofScalarsSum`); Hasse derivatives and polynomials of bounded degree
  (`Polynomial.factorial_smul_hasseDeriv`, `Polynomial.degreeLTEquiv`), for 8.5.
- **Orders of zeros in one variable:** `analyticOrderAt`, with `natCast_le_analyticOrderAt` (a
  zero of order at least `n` is a factor `(z - z₀) ^ n`) and
  `natCast_le_analyticOrderAt_iff_iteratedDeriv_eq_zero` (`Analysis/Analytic/Order.lean`).

## What Tau Ceti already has

- `TauCeti.GeometryOfNumbers.box` (`TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean`), the
  closed polydisc of a given polyradius in `ι → ℂ`; see the conventions.
- `TauCeti.GeometryOfNumbers.finite_and_ncard_le_of_subset_box_of_separated`, the same file: a
  subset of `box r c` whose points are `ε`-separated has at most `(4 c / ε) ^ (2 · card ι)`
  elements. It uses Waldschmidt's grid but counts its cells loosely; applied to the values of the
  linear forms it gives 3.4 with `4` in place of `√2`. 3.4 keeps Waldschmidt's `√2`, because the
  numerical conditions of 4.1 are the ones his Lemma 4.12 yields; sharpening the count in that
  lemma is the way to prove 3.4 from it.
- `TauCeti.PowerSeries.gaussNorm_mul_of_isRestricted`
  (`TauCeti/RingTheory/PowerSeries/GaussNorm.lean`), multiplicativity of the Gauss norm on
  restricted power series over a nonarchimedean field, and Weierstrass division
  `TauCeti.PowerSeries.IsDistinguished.exists_mul_add_eq`
  (`TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean`). 8.3 divides by the distinguished
  polynomial `∏ (X - a) ^ S` with these.
- `TauCeti/Analysis/Analytic/OfScalars.lean`, which extends Mathlib's `ofScalars` API.

## Coordination with Mathlib

Mathlib PR [#42911](https://github.com/leanprover-community/mathlib4/pull/42911), by
M. Karatarakis, proves Gelfond–Schneider directly, by Gelfond's one-variable method (Hua,
*Introduction to Number Theory*, §17.9), as
`GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational`. Target 6.4 takes that name and
statement; if the PR is merged, the Tau Ceti theorem is deleted in favour of Mathlib's. Here it is
derived from the criterion, which this roadmap builds regardless. The same PR makes Siegel's
constant `NumberField.house.c₁` public, with `one_le_c₁`, and adds house lemmas (`house_natCast`,
`house_intCast_mul`, `house_zsmul`, `house_pow_le_pow`); once it is merged, 3.5 is stated with the
constant `c₁ K ^ 2`, since Mathlib's bound `c₁ K (c₁ K q A) ^ (p / (q - p))` is at most
`c₁ K ^ 2 q A` when `q ≥ 2p`, and 3.2 uses those lemmas.

Mathlib PR [#28013](https://github.com/leanprover-community/mathlib4/pull/28013), by Yuyang Zhao,
proves the Lindemann–Weierstrass theorem by Hermite's method, and from it `transcendental_exp`
(`exp a` is transcendental for algebraic `a ≠ 0`), `transcendental_e`, `transcendental_pi` and
`transcendental_log`, stated with `IsAlgebraic ℤ` and `Transcendental ℤ`. Target 6.3 and the
worked examples for `e` and `π` take those names and statements; if the PR is merged, the Tau Ceti
theorems are deleted in favour of Mathlib's. Here they are derived from the criterion.

---

## The build, in layers

Every statement below is expressible against Mathlib alone once `FormalMultilinearSeries.mvCoeff`
and `mvTaylorCoeff` are defined. `Suggested.lean` gives both definitions, the auxiliary functions
of Layers 5 and 8 with the quantities their conditions are stated in, and a Lean form, under the
name given here in parentheses, for every milestone that has one.

### Layer 0: multi-index power series

Over a nontrivially normed field `𝕜`, values in a normed space `F`, complete where sums are formed.
*Prerequisites:* Mathlib only.

- **0.1 Products of absolutely convergent series.** For finitely many absolutely summable families
  `f i : ℕ → R` in a complete normed commutative ring, `σ ↦ ∏ i, f i (σ i)` over `σ : ι → ℕ` is
  absolutely summable with sum `∏ i, ∑' k, f i k`.
- **0.2 Sums of power series.** If each `g n` (over an arbitrary index type) has the power series
  `p n` on the ball of radius `r > 0` about `x`, and `(k, n) ↦ ‖p n k‖ r ^ k` is summable, then
  `∑' n, g n` has the power series `k ↦ ∑' n, p n k` on that ball, and so is analytic at `x`.
- **0.3 Multi-index coefficients of a formal series.** `mvCoeff p α` is the sum of
  `p (∑ i, α i)` over the tuples of basis vectors whose coordinate counts are `α`; it is additive
  and commutes with scalars in `p` (`FormalMultilinearSeries.mvCoeff_add`,
  `FormalMultilinearSeries.mvCoeff_smul`). Milestones: the degree-`k` term is
  `p k (fun _ => z) = ∑ α ∈ univ.piAntidiag k, (∏ i, z i ^ α i) • mvCoeff p α`
  (`FormalMultilinearSeries.apply_eq_sum_mvCoeff`); the coefficients are normally summable on
  every polydisc where `∑ (card ι) ^ k ‖p k‖ ρ ^ k` converges; **an analytic function is the sum
  of its multi-index series** there (`HasFPowerSeriesOnBall.hasSum_mvCoeff`); conversely **a
  normally convergent multi-index series `z ↦ ∑' α, (∏ i, z i ^ α i) • c α` has a power series on
  the polydisc, with multi-index coefficients `c`** (`exists_hasFPowerSeriesOnBall_tsum`); and the
  identity theorem in coefficient form: a function vanishing near a point has all coefficients
  zero there (`HasFPowerSeriesAt.mvCoeff_eq_zero_of_eventuallyEq_zero`), and a normally convergent
  series vanishing on a polydisc has all coefficients zero. The identity theorem comes from
  `HasFPowerSeriesAt.apply_eq_zero` and the fact that a polynomial map `ι → 𝕜` to `F` vanishing
  everywhere has zero coefficients (take coordinates in a basis of the span of the coefficients
  and apply `MvPolynomial.funext`; `𝕜` is infinite). *Prerequisites:* 0.1, 0.2.
- **0.4 Taylor coefficients at a point.** `mvTaylorCoeff f x α` as in the conventions, with:
  independence of the chosen series (`HasFPowerSeriesAt.mvTaylorCoeff_eq`); the coefficient of order
  `0` is `f x` (`AnalyticAt.mvTaylorCoeff_zero`); agreement with iterated derivatives,
  `(∏ i, (α i)!) • mvTaylorCoeff f x α = iteratedFDeriv 𝕜 (∑ i, α i) f x v` for `v` any tuple of
  basis vectors with counts `α` (`AnalyticAt.prod_factorial_smul_mvTaylorCoeff`, from
  `HasFPowerSeriesOnBall.iteratedFDeriv_eq_sum_of_completeSpace`), and in one variable
  `k! • mvTaylorCoeff = iteratedDeriv k` (`AnalyticAt.factorial_smul_mvTaylorCoeff_of_unique`);
  additivity (`AnalyticAt.mvTaylorCoeff_add`), subtraction and finite sums for functions analytic at
  `x`; **the product rule**
  `mvTaylorCoeff (f • g) x α = ∑ β ∈ Iic α, mvTaylorCoeff f x β • mvTaylorCoeff g x (α - β)` for `f`
  scalar and `g` vector-valued, both analytic at `x` (`AnalyticAt.mvTaylorCoeff_smul`); translation,
  `mvTaylorCoeff f (x + y) α = mvTaylorCoeff (f (· + y)) x α` (`mvTaylorCoeff_comp_add_right`);
  locality (functions equal near `x` have the same coefficients); a monomial `∏ i, z i ^ τ i` has
  coefficient `1` at `τ` and `0` at every other multi-index, at the origin
  (`mvTaylorCoeff_prod_pow`); **the local expansion**: an analytic `f` satisfies
  `f (x + y) = ∑' α, (∏ i, y i ^ α i) • mvTaylorCoeff f x α` on some polydisc, normally convergently
  (`AnalyticAt.exists_hasSum_mvTaylorCoeff`); **coefficients from an expansion**: any normally
  convergent expansion of `f (x + ·)` on a polydisc has the Taylor coefficients as coefficients
  (`mvTaylorCoeff_eq_of_hasSum`); and **linear change of variables**: if the Taylor coefficients of
  `G` at `A x` of total degree `k` all vanish, then so do those of `G ∘ A` at `x`, for `A` a
  continuous linear map (`mvTaylorCoeff_comp_eq_zero`). ⚠ The factorial multiplies the Taylor
  coefficient and is never inverted: in positive characteristic `α!` can vanish, and
  `mvTaylorCoeff f x α = D^α f (x) / α!` is then false. ⚠ Vanishing of the coefficients with
  `α i < m` in each coordinate is not preserved by a linear change of variables: with `m = 2`,
  `z₁ ^ 2` has no coefficient of order `< 2` in both coordinates, while its image `(z₁ + z₂) ^ 2`
  has the coefficient `2` at `(1, 1)`; only vanishing in each total degree is. *Prerequisites:* 0.3.
- **0.5 Division by a coordinate.** If the coefficients of `f` at `x` vanish whenever `α i < m`,
  then `f (x + z) = z i ^ m • g z` with `g` analytic, on every polydisc about `0` on which the
  expansion of `f` about `x` converges normally. The divided difference
  `z ↦ dslope (fun w => f (Function.update z i w)) ζ (z i)`, which is
  `(f z - f (update z i ζ)) / (z i - ζ)` off the hyperplane `z i = ζ`, is analytic at every `x`
  at which `f` is analytic and `f` is analytic at `update x i ζ` (`analyticAt_dslope_update`);
  **on the hyperplane** (`x i = ζ`) analyticity of `f` at `x` suffices. *Prerequisites:* 0.4.

### Layer 1: estimates on polydiscs

Over `ℂ`, values in a complex normed space (Banach where sums are formed). *Prerequisites:*
Layer 0.

- **1.1 Maximum modulus along a coordinate.** If `f` is analytic on the closed polydisc of radius
  `R` and `‖f‖ ≤ C` wherever the `i`-th coordinate has modulus `R`, then `‖f‖ ≤ C` on the polydisc.
- **1.2 Dividing by one-coordinate polynomials.** Let `g` be analytic on the closed polydisc of
  radius `R` and `f = (∏ ζ ∈ S, (z i - ζ) ^ m) • g` there, with `‖f‖ ≤ M` and the points of the
  finite set `S` in the closed disc of radius `r`, `0 ≤ r < R`. Then
  `‖g‖ ≤ M / (R - r) ^ (m · card S)` on the polydisc of radius `R` and
  `‖f‖ ≤ M (2r / (R - r)) ^ (m · card S)` on the polydisc of radius `r`. For a single power,
  `f = z i ^ m • g`, the sharper bounds are `‖g‖ ≤ M / R ^ m` and `‖f‖ ≤ M (r / R) ^ m` on the
  polydisc of radius `r ≤ R`. *Prerequisites:* 1.1.
- **1.3 Schwarz's lemma for a zero of order `T`** (one variable). If `g` is holomorphic and bounded
  by `M` on the open disc of radius `ρ` about `0` and `(T : ℕ∞) ≤ analyticOrderAt g 0`, then
  `‖g w‖ ≤ M (‖w‖ / ρ) ^ T` there (`norm_le_mul_div_pow_of_le_analyticOrderAt`). For `T ≥ 1` this
  is Mathlib's `Complex.dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO` with `n = T - 1`, once
  `g w - g 0 = o (‖w‖ ^ (T - 1))` is derived from the order (`natCast_le_analyticOrderAt`;
  `isLittleO_sub_pow_sub_one_of_le_analyticOrderAt`, which holds over any nontrivially normed
  field). *Prerequisites:* Mathlib only.
- **1.4 Cauchy's inequalities.** For `HasFPowerSeriesOnBall F p 0 R` on any complex normed space,
  with values in a complex Banach space and `‖F‖ ≤ M` on the ball: every homogeneous term
  satisfies `‖p n (fun _ => y)‖ ≤ M` for `‖y‖ < R`; and on `ι → ℂ`, **every multi-index
  coefficient satisfies `‖mvCoeff p α‖ ρ ^ (∑ i, α i) ≤ M` for `0 ≤ ρ < R`**
  (`HasFPowerSeriesOnBall.norm_mvCoeff_mul_pow_le`). The multi-index form is proved by averaging
  the degree-`k` term against a character over the points `(ρ ω ^ j i)ᵢ` of the torus, with `ω` a
  primitive `(k + 1)`-th root of unity: the average is exact on polynomials, so no integral in
  several variables is needed. *Prerequisites:* 0.3.
- **1.5 Truncated Taylor interpolation** (Waldschmidt, Lemma 4.13). For
  `HasFPowerSeriesOnBall F p 0 R` on any complex normed space, with values in any complex Banach
  space and `‖F‖ ≤ M` on the ball, `‖F z - p.partialSum T z‖ ≤ (1 + T) M (‖z‖ / R) ^ T` for
  `‖z‖ < R` (`HasFPowerSeriesOnBall.norm_sub_partialSum_le`); and on `ι → ℂ`,
  `‖F z‖ ≤ (1 + T) M (r / R) ^ T + ∑_{k < T} ∑_{α ∈ univ.piAntidiag k} ‖mvCoeff p α‖ r ^ k` for
  `‖z‖ ≤ r < R`. The constant is `1 + T`: Waldschmidt's `1 + √T` comes from Parseval's formula
  and needs values in a Hilbert space, while `1 + T` follows from 1.3 and 1.4 in any Banach space
  and is all Layer 4 uses. *Prerequisites:* 1.3, 1.4.
- **1.6 Schwarz's lemma for Cartesian products** (a variant of Waldschmidt, Proposition 4.7). Let
  `ι` be nonempty with `n = card ι`, let `f` be analytic on the closed polydisc of radius `R` in
  `ι → ℂ` with `‖f‖ ≤ M` there, and let `E i` (`i : ι`) be finite sets of exactly `S` points in
  the closed disc of radius `r < R`. If `mvTaylorCoeff f ξ κ = 0` for every `ξ` with `ξ i ∈ E i`
  for all `i` and every `κ` of order `< m` in each coordinate, then on the polydisc of radius `r`,
  `‖f‖ ≤ n (4r / (R - r)) ^ (mS) K ^ n M` with `K = 1 + ∑_{k < mS} (2 (R + r) / (R - r)) ^ k`, and
  for `5r ≤ R`, `‖f‖ ≤ n (5 · 3ⁿ r / R) ^ (mS) M` (`norm_le_of_mvTaylorCoeff_eq_zero`). The proof
  divides one coordinate at a time in Newton form by the points of `E i`, each repeated `m` times,
  writing `f` as a polynomial main term with constant coefficients plus one multiple of
  `∏_{ζ ∈ E i} (z i - ζ) ^ m` for each coordinate. The vanishing forces the main term to be zero,
  by root counting in one variable (a polynomial of degree `< m · card E` with a root of
  multiplicity `≥ m` at each point of `E` is zero) and the injectivity of a tensor product of
  injective maps; this adapts the argument of Waldschmidt's ideal-theoretic Lemma 4.8 to
  operations on functions. Waldschmidt's Proposition 4.7 assumes `f` entire and `R ≥ 18ⁿ r` and
  gives `|f|_r ≤ |f|_R (18ⁿ r / R) ^ (S₀ S₁)`; the constants here are the ones the Newton division
  gives. *Prerequisites:* 0.5, 1.1, 1.2, 1.3.

### Layer 2: exponential polynomials

*Prerequisites:* Layer 0.

- **2.1 Taylor coefficients** (Waldschmidt, Lemma 4.9, in coefficient form). For `τ : ι → ℕ` and
  `w ξ : ι → ℂ`, `z ↦ (∏ v, z v ^ τ v) * exp (w · z)` has, at `ξ`, the Taylor coefficient
  `exp (w · ξ) ∏ v, ∑_{j ≤ σ v} ((τ v).choose j) ξ v ^ (τ v - j) w v ^ (σ v - j) / (σ v - j)!`
  of order `σ` (`mvTaylorCoeff_prod_pow_mul_cexp`), and its expansion about `ξ` converges
  absolutely on every polydisc. The same holds for finite linear combinations, which have power
  series on every polydisc about every point. *Prerequisites:* 0.1, 0.4.
- **2.2 Growth.**
  `‖(∏ v, z v ^ τ v) * exp (w · z)‖ ≤ (1 + ‖z‖) ^ (∑ v, τ v) · exp ((∑ v, ‖w v‖) ‖z‖)`.
- **2.3 Linear independence.** In one variable: if `∑_{c ∈ T} Q c (ζ) exp (c ζ) = 0` for all
  `ζ ∈ ℂ`, with `Q c : ℂ[X]` and distinct `c`, then every `Q c = 0`. In several variables: if
  `∑_{w ∈ T} MvPolynomial.eval z (P w) · exp (w · z) = 0` for all `z : ι → ℂ`, with distinct
  `w`, then every `P w = 0` (`eq_zero_of_sum_eval_mul_cexp`); and both statements with the
  frequencies given by a map injective on an arbitrary finite index set. The several-variable case
  restricts to a line on which the frequencies stay distinct and the polynomials stay nonzero,
  found as a nonvanishing point of a product of nonzero polynomials.

### Layer 3: arithmetic

Over a number field `K`. *Prerequisites:* Mathlib only.

- **3.1 Liouville's inequality.** A nonzero algebraic integer `α` satisfies
  `1 ≤ ‖σ α‖ · house α ^ ([K : ℚ] - 1)` at every embedding `σ`
  (`NumberField.one_le_norm_embedding_mul_house_pow`), since its field norm is a nonzero integer,
  by `NumberField.norm_norm_le_norm_mul_house_pow`. (`one_le_house_of_isIntegral` is the weaker
  `1 ≤ house α`.) ⚠ Integrality is needed: `α = 1 / 2` in `ℚ` has `‖α‖ = 1 / 2`.
- **3.2 Sizes.** If `δ ^ a * α` and `δ ^ b * β` are algebraic integers of house at most `H` and
  `H'`, then `δ ^ (a + b) * (α β)`, `δ ^ a * (α + β)` (for `a = b`), `δ ^ (a * k) * α ^ k` and
  `δ ^ c * α` for `c ≥ a` are algebraic integers with the houses `H H'`, `H + H'`, `H ^ k` and
  `δ ^ (c - a) H`; integers `x` have exponent `0` and house `|x|`; finite sums and products follow
  (`house_sum_le_sum_house`, `house_prod_le`). **Liouville's inequality for a number of known
  size:** if `δ ≠ 0` and `δ ^ a * α` is a nonzero algebraic integer of house at most `H`, then
  `1 ≤ δ ^ a ‖σ α‖ H ^ ([K : ℚ] - 1)` at every embedding
  (`NumberField.one_le_pow_mul_norm_embedding_mul_pow`). *Prerequisites:* 3.1.
- **3.3 The field of the data.** Finitely many algebraic numbers in a field `L` of characteristic
  `0` lie in `IntermediateField.adjoin ℚ S`, a number field, with a common denominator `δ` from
  `exists_integral_multiples` and a common bound for the houses of `δ` times each of them; Layer 5
  uses it with `L = ℂ` and Layer 8 with `L = ℂ_[p]`.
- **3.4 Thue–Siegel's lemma** (Waldschmidt, Lemmas 4.11 and 4.12). Let `X ≥ 1` be an integer. For
  real forms: if `∑ᵢ |u i j| ≤ U` for every `j` and `ℓ ^ (card κ) < (X + 1) ^ (card ι)` for a
  natural number `ℓ ≥ 1`, there is a nonzero `ξ : ι → ℤ` with `|ξ i| ≤ X` and
  `|∑ᵢ u i j ξ i| ≤ U X / ℓ` for all `j` (`ThueSiegel.exists_ne_zero_int_vec_abs_le_of_pow_lt`). For
  complex forms, with `ι` nonempty: if `∑ᵢ ‖u i j‖ ≤ exp U` for every `j` and
  `(√2 · X · exp (U + V) + 1) ^ (2 · card κ) ≤ (X + 1) ^ (card ι)`, there is a nonzero `ξ` with
  `|ξ i| ≤ X` and `‖∑ᵢ u i j ξ i‖ ≤ exp (-V)`
  (`ThueSiegel.exists_ne_zero_int_vec_norm_le_of_pow_le`). Both over arbitrary finite index types.
  See *What Tau Ceti already has* for the packing bound.
- **3.5 Siegel's lemma with a constant**
  (`NumberField.house.exists_const_ne_zero_int_vec_house_le`). There is `C ≥ 1`, depending only
  on `K`, such that every system `a` of linear equations over `𝓞 K` with at least one equation, at
  least twice as many unknowns as equations and entries of house at most `A ≥ 1` has a nonzero
  solution in `𝓞 K` of house at most `C · (number of unknowns) · A`. It follows from
  `NumberField.house.exists_ne_zero_int_vec_house_le`, whose exponent is at most `1` in this
  range; that lemma assumes `a ≠ 0`, and for `a = 0` a vector with one entry `1` is a solution.

### Layer 4: the auxiliary function

- **4.1 Proposition 4.10** (Waldschmidt, who takes the `φ_λ` entire;
  `exists_ne_zero_int_norm_sum_le`). Let `φ_λ` (`λ` in a finite type of cardinality `L`) have power
  series on the polydisc of radius `R` in `ι → ℂ`, with `ι` nonempty and `n = card ι`, with
  `‖φ_λ‖ ≤ M_λ` there and `∑ M_λ ≤ exp U`. Let `N, r > 0`, put `W = N + U + V` and assume
  `12 n² ≤ W`, `e ≤ R / r ≤ exp (W / 6)` and `(2W) ^ (n + 1) ≤ L N (log (R / r)) ^ n`. Then there
  are integers `p_λ`, not all zero, with `|p_λ| ≤ exp N` and `‖∑ p_λ φ_λ‖ ≤ exp (-V)` on the closed
  polydisc of radius `r`. The integers come from 3.4 applied to the Taylor coefficients of degree
  `< T` at the origin, scaled to the radius `r` with 1.4, and the conclusion from 1.5.
  *Prerequisites:* 1.4, 1.5, 3.4.

### Layer 5: the criterion of Schneider–Lang for `ℂ^{d₀} × (ℂˣ)^{d₁}`

The main target is 5.7 (`SchneiderLang.exists_transcendental_of_linearIndependent`), and 5.1–5.6
are the steps of its proof. Their Lean forms are in the namespace `SchneiderLangProof`, since they
serve only this proof.

Throughout, `d₀ ≤ n < d₀ + d₁`; `x : Fin d₁ → Fin n → ℂ` has algebraic coordinates and is linearly
independent over `ℚ`; `y : Fin n → Fin n → ℂ` is a basis of `ℂⁿ`, with the change of variables
`Yl z = ∑ⱼ zⱼ yⱼ` as a continuous linear equivalence; and `s · y = ∑ⱼ sⱼ yⱼ` for `s : Fin n → ℕ`.
Towards a contradiction, the numbers `y j h` (`h < d₀`) and `exp (xᵢ · yⱼ)` are algebraic; by 3.3
they and the coordinates of the `xᵢ` lie in a number field `K` of degree `D`, with an embedding
`ι₀ : K →+* ℂ`, a common denominator `δ ≥ 1` and a bound `G ≥ 1` for the houses of `δ` times each
of them. Write `A = ∑ᵢ ∑ᵥ ‖xᵢ v‖` and `A_y = ∑ⱼ ∑ᵥ ‖yⱼ v‖`.

- **5.1 The auxiliary function** (`auxiliaryFunction`). For `T : ℕ` and
  `p : (Fin d₀ → Fin (T + 1)) × (Fin d₁ → Fin (T + 1)) → ℂ`,
  `F_p (z) = ∑_{(τ, t)} p (τ, t) (∏_{h < d₀} z_h ^ τ_h) exp ((∑ᵢ tᵢ xᵢ) · z)`. It is entire
  (`analyticOnNhd_auxiliaryFunction`), and if `‖p‖ ≤ e ^ N` then
  `‖F_p z‖ ≤ (T + 1) ^ (d₀ + d₁) e ^ N (1 + ‖z‖) ^ (d₀ T) e ^ (T A ‖z‖)`, the right side being
  `growthBound` at `ρ = ‖z‖` (`norm_auxiliaryFunction_le`, from 2.2). *Prerequisites:* 2.1, 2.2.
- **5.2 The Taylor coefficients at `s · y` are algebraic, of explicit size** (Waldschmidt §4.6,
  step 2, with his Lemma 4.9; `exists_eq_mvTaylorCoeff_auxiliaryFunction`). For integers `p` with
  `|p| ≤ e ^ N`, for `sⱼ ≤ S₁` and for `σ` of total degree `M`, the number
  `σ! · mvTaylorCoeff F_p (s · y) σ` is `ι₀ θ` for some `θ ∈ K` such that `δ ^ a θ` is an algebraic
  integer of house at most `H`, where `a = d₀ T + M + d₁ n T S₁` (`denominatorExponent`) and
  `H = (T + 1) ^ (d₀ + d₁) δ ^ a e ^ N (δ² M + n S₁ G + 1) ^ (d₀ T) (d₁ T G + 1) ^ M ·
  G ^ (d₁ n T S₁)` (`houseBound`). *Prerequisites:* 2.1, 3.2, 3.3.
- **5.3 Liouville's inequality for these coefficients** (step 2, inequality (4.14);
  `one_le_liouvilleFactor_mul_norm`). A nonzero `c = mvTaylorCoeff F_p (s · y) σ` satisfies
  `1 ≤ M ^ M δ ^ a H ^ (D - 1) ‖c‖`, the factor being `liouvilleFactor`; the `M ^ M` bounds `σ!`.
  *Prerequisites:* 3.2, 5.2.
- **5.4 The auxiliary function is not zero** (`exists_mvTaylorCoeff_auxiliaryFunction_ne_zero`).
  If `p ≠ 0`, some Taylor coefficient of `F_p` at `0` is nonzero: the frequencies `∑ᵢ tᵢ xᵢ` are
  distinct because the `xᵢ` are `ℚ`-linearly independent, the monomials `z ^ τ` are distinct, and
  2.3 applies. ⚠ The independence is needed: if `x₂ = 2 x₁`, the terms for `t = (2, 0)` and
  `t = (0, 1)` are equal, and `p` with values `1` and `-1` there gives `F_p = 0`.
  *Prerequisites:* 2.3, 5.1.
- **5.5 The argument, with the parameters as hypotheses** (`false_of_admissible`, with the
  conditions bundled as `Admissible`; Waldschmidt §4.6, steps 3 to 6). Let `T, S₀`, `S₁ ≥ 1`,
  `N > 0`, `U`, `r`, `R` and `E : ℕ → ℝ` with `E ≥ 1` satisfy:
  1. the conditions of 4.1 for the `(T + 1) ^ (d₀ + d₁)` monomials of 5.1 on the polydisc of
     radius `R`, with `V = U` and `M_λ = (1 + R) ^ (d₀ T) e ^ (T A R)`;
  2. `S₁ A_y + 2 ≤ r`;
  3. **vanishing:** `liouvilleFactor (M) · e ^ (-U) < 1` for every `M ≤ n S₀`;
  4. **extrapolation:** `liouvilleFactor (M) · n E (M) ^ (-⌊M / n⌋ S₁) · growthBound (ρ_M) < 1`
     for every `M ≥ S₀`, where `ρ_M = A_y · 5 · 3ⁿ E (M) (S₁ + 2 ‖Yl⁻¹‖)`.

  Then the data cannot all be algebraic. The steps: 4.1 gives integers `p` with `‖F_p‖ ≤ e ^ (-U)`
  on the polydisc of radius `r`; by 1.4 on a polydisc about each point `s · y` with `sⱼ < S₁`,
  which lies inside that polydisc by (2), and by 5.3 with (3), every Taylor coefficient at these
  points of total degree at most `n S₀` vanishes; by 5.4 there is a least total degree `M₀`,
  necessarily `M₀ > n S₀ ≥ S₀`, at which some coefficient at some `s · y` is nonzero. Then
  `z ↦ F_p (Yl z)` vanishes at the points `s` in each total degree `< M₀` (0.4), hence to order
  `⌊M₀ / n⌋` in each coordinate, and 1.6 with 1.4 bounds that coefficient from above, which
  contradicts 5.3 by (4). The order is measured by **total degree** because the change of
  variables `Yl` preserves vanishing in each total degree but not in each coordinate (0.4);
  Waldschmidt's step 5 measures it in each coordinate. *Prerequisites:* 0.4, 1.4, 1.6, 4.1,
  5.1–5.4.
- **5.6 The choice of parameters** (`exists_admissible`; Waldschmidt §4.6, step 6). For fixed `n`,
  `d₀`, `d₁`, `D`, `δ`, `G`, `A`, `A_y` and `B = ‖Yl⁻¹‖` there are parameters satisfying
  (1)–(4) of 5.5. With `d = d₀ + d₁`, `c₃ = 1 / (4 D 6 ^ (n + 1))`,
  `K₁ = ⌈8 (n d + D n²) / c₃⌉ + 1`, `S₁ = ⌈2 n d (2 + D n / d + c₃ K₁ / d)⌉ + 1` and
  `r = S₁ A_y + 3`, every sufficiently large integer `q` gives admissible parameters `T = q ^ n`,
  `U = c₃ q ^ d log q`, `N = U / (4 D)`, `S₀ = ⌊q ^ d / K₁⌋`, `R = q r` and
  `E (M) = exp (log M / d)`, which is `M ^ (1 / d)` for `M ≥ 1` and `1` at `M = 0`. Each condition
  becomes a comparison of powers of `q` and `log q`, and it is here that `n < d` is used. These
  are not Waldschmidt's values, which are `T₀ = T₁ = T`, `S₀ = c₀ T ^ (d / n) / S₁` and
  `E = S₀ ^ ((d - n) / d)` (his step 6). *Prerequisites:* the definitions of 5.1–5.3.
- **5.7 Corollary 4.2** (`SchneiderLang.exists_transcendental_of_linearIndependent`). Let
  `d₀ ≤ n < d₀ + d₁`, let `x₁, …, x_{d₁} ∈ ℂⁿ` be linearly independent over `ℚ` with algebraic
  coordinates, and let `y₁, …, yₙ` be a basis of `ℂⁿ` over `ℂ`. Then one of the numbers `y j h`
  (`h < d₀`) and `exp (xᵢ · yⱼ)` is transcendental. *Prerequisites:* 3.3, 5.5, 5.6.

### Layer 6: consequences of the criterion

- **6.1 The case `d₀ = 0`** (Waldschmidt, Corollary 4.3, in the form with `ℚ`-linearly independent
  `xᵢ`; `SchneiderLang.exists_transcendental_exp_of_span_eq_top`). If `x₁, …, x_d ∈ ℂⁿ` have
  algebraic coordinates and are linearly independent over `ℚ` with `n + 1 ≤ d`, and
  `y₁, …, y_ℓ` span `ℂⁿ` over `ℂ`, then some `exp (xᵢ · yⱼ)` is transcendental. The `yⱼ` need not
  be a basis: extract one from them (`exists_linearIndependent'`) and apply 5.7 with `d₀ = 0`,
  `d₁ = d`. *Prerequisites:* 5.7.
- **6.2 The case `d₀ = 1`, `d₁ = n = d`** (Waldschmidt, Corollary 4.4;
  `SchneiderLang.exists_transcendental_exp_of_isAlgebraic_coord`). If `x₁, …, x_d ∈ ℂᵈ` have
  algebraic coordinates and are linearly independent over `ℚ`, and `y₁, …, y_d` is a basis of `ℂᵈ`
  with algebraic first coordinates, then some `exp (xᵢ · yⱼ)` is transcendental.
  *Prerequisites:* 5.7.
- **6.3 Hermite–Lindemann** (`transcendental_of_isAlgebraic_exp`). If `x ≠ 0` and `exp x` is
  algebraic, then `x` is transcendental. In the names and forms of Mathlib PR #28013, over `ℤ`:
  `exp a` is transcendental for algebraic `a ≠ 0` (`transcendental_exp`), and so is
  `Complex.log u` for algebraic `u` with `Complex.log u ≠ 0` (`transcendental_log`). Hence `e`
  and `π` are transcendental (`transcendental_e`, `transcendental_pi`). ⚠ `x ≠ 0` is needed:
  `exp 0 = 1`. *Prerequisites:* 6.2 with `d = 1`.
- **6.4 Gelfond–Schneider** (`transcendental_exp_mul`). If `x ≠ 0` and `exp x` is algebraic, and
  `b` is algebraic and not rational, then `exp (b x)` is transcendental. With Mathlib's principal
  branch, in the name and form of Mathlib PR #42911
  (`GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational`): `a ^ b` is transcendental
  for algebraic `a, b` with `a ≠ 0 ∧ a ≠ 1` and `∀ i j : ℤ, b ≠ i / j`. Hence a quotient `y / x`
  of logarithms of algebraic numbers, `x ≠ 0`, is rational or transcendental
  (`exists_rat_eq_div_or_transcendental`); in particular so is `Complex.log a / Complex.log b` for
  algebraic `a, b` with `Complex.log b ≠ 0`. ⚠ The exponent must be irrational:
  `4 ^ (1 / 2) = 2` (`Examples.four_cpow_half`); and the quotient can be rational:
  `log 4 / log 2 = 2` (`Examples.log_four_div_log_two`). *Prerequisites:* 6.1 with `n = 1`,
  `d = 2`.

### Layer 7: Baker's theorem

- **7.1 Theorem 4.5** (Waldschmidt; `Baker.eq_zero_of_isAlgebraic_sum_mul`). If `β₁, …, β_d` is a
  `ℚ`-basis of a number field `K ⊆ ℂ` of degree `d`, and `l₁, …, l_d` are logarithms of algebraic
  numbers with `∑ βᵢ lᵢ` algebraic, then every `lᵢ = 0`. The proof is Bertrand and Masser's: it
  applies 6.1 or 6.2 to the conjugates of the `βᵢ` and needs the invertibility of the matrix of
  embeddings of a basis (Waldschmidt's Lemma 4.6; see *Discriminants* above), twice: once to set
  up the criterion, and once to pass from its conclusion to `lᵢ = 0`, a step Waldschmidt's §4.2
  leaves implicit. *Prerequisites:* 6.1, 6.2.
- **7.2 Baker's theorem** (Waldschmidt, Theorem 1.6; Baker, Theorem 2.1;
  `Baker.eq_zero_of_add_sum_mul_eq_zero`). If `l₁, …, lₙ` are logarithms of algebraic numbers,
  linearly independent over `ℚ`, and `β₀ + ∑ βᵢ lᵢ = 0` with algebraic `β₀, βᵢ`, then `β₀ = 0`
  and every `βᵢ = 0`; and the same for a family indexed by a finite set
  (`Baker.eq_zero_of_add_sum_mul_eq_zero_of_linearIndepOn`). ⚠ The `ℚ`-linear independence is
  needed: `2 log 2 - log 4 = 0` (`Examples.two_mul_log_two_sub_log_four`). *Prerequisites:* 7.1.
- **7.3 Corollaries** (Baker, *Transcendental Number Theory*, Theorems 2.2–2.4; his Theorem 2.1 is
  7.2). For logarithms `lᵢ` of algebraic numbers and algebraic `βᵢ`: a nonzero `∑ βᵢ lᵢ` is
  transcendental (`Baker.transcendental_sum_mul`), equivalently `β₀ + ∑ βᵢ lᵢ ≠ 0` for algebraic
  `β₀ ≠ 0`, with no independence hypothesis (`Baker.add_sum_mul_ne_zero`; Theorem 2.2);
  `exp (β₀ + ∑ βᵢ lᵢ)` is transcendental for algebraic `β₀ ≠ 0`
  (`Baker.transcendental_exp_add_sum_mul`; Theorem 2.3, which Baker states with every `βᵢ`
  nonzero, although only `β₀ ≠ 0` is used); and for a nonempty family, `exp (∑ βᵢ lᵢ)` is
  transcendental when the `lᵢ` are nonzero and `1, β₁, …, βₙ` are linearly independent over `ℚ`.
  In Mathlib's principal branch, `α₁ ^ β₁ ⋯ αₙ ^ βₙ` is transcendental for algebraic
  `αᵢ ≠ 0, 1` under the same hypothesis on the `βᵢ` (`Baker.transcendental_prod_cpow`;
  Theorem 2.4). ⚠ Irrationality of each `βᵢ` is not enough: `2 ^ √2 · 2 ^ (-√2) = 1`.
  *Prerequisites:* 7.2.

### Layer 8: Baker's theorem over `ℂ_[p]`

The main target is 8.10 (`PadicBaker.eq_zero_of_add_sum_mul_eq_zero`). 8.1–8.5 hold in general
ultrametric settings, and 8.6–8.9 are the steps of the proof of 8.10, with their Lean forms in the
namespace `PadicBakerProof`, since they serve only this proof. Brumer carried Baker's method over
to `ℂ_p`; the statement here, with the constant term `β₀`, is proved by the argument of Chapter 2
of Baker's book, which handles `β₀`. That chapter is the route: Lemmas 1–7 and
§5, with the maximum modulus principle replaced by the ultrametric inequality and Liouville's
inequality taken at the embedding into `ℂ_[p]`. Write `ρ = p ^ (-1 / (p - 1))`.

- **8.1 The exponential on its disc.** In a normed field `L` over `ℚ_[p]`, a nonzero natural
  number has `‖n‖ = p ^ (-v_p (n))` (`Padic.norm_natCast_eq_zpow_neg_padicValNat`, from
  `Padic.norm_eq_zpow_neg_valuation` and `norm_algebraMap'`), so by Legendre's formula
  (`sub_one_mul_padicValNat_factorial`) `‖n!‖ ≥ p ^ (-n / (p - 1))`, and for nontrivially normed
  `L` the radius of `expSeries` is at least `ρ` (`PadicExp.le_radius_expSeries`). If `L` is also
  complete, then for `‖x‖, ‖y‖ < ρ`: `exp (x + y) = exp x · exp y`
  (`PadicExp.exp_add`, from Mathlib's `NormedSpace.exp_add_of_mem_ball` and the radius),
  `‖exp x - 1‖ = ‖x‖` (`PadicExp.norm_exp_sub_one`), hence `‖exp x‖ = 1`, and `exp` is injective
  on the disc (`PadicExp.injOn_exp`); `exp (n • x) = exp x ^ n`, and `exp` of a finite sum in the
  disc is the product. ⚠ At `p = 2` the point `2` has `‖2‖ = ρ` and the series diverges there.
  *Prerequisites:* Mathlib only.
- **8.2 Liouville's inequality at an ultrametric place.** An element integral over `ℤ` has norm at
  most `1` in an ultrametric normed field (`IsUltrametricDist.norm_le_one_of_isIntegral`, from
  `Valuation.Integers.mem_of_integral` and `NormedField.valuation`); in a normed field `L` over
  `ℚ_[p]` a nonzero integer has `1 ≤ |n| ‖n‖` (`Padic.one_le_abs_mul_norm_intCast`, with `p`
  explicit since it does not occur in the conclusion). In an ultrametric, algebraically closed
  normed field `L` with that property, if `δ ^ a * x` is a nonzero algebraic integer of house at
  most `H`, then `1 ≤ H ^ [K : ℚ] ‖σ x‖` at every embedding `σ : K →+* L`
  (`NumberField.one_le_pow_mul_norm_embedding_of_isUltrametricDist`): the field norm of `δ ^ a * x`
  is a nonzero integer of absolute value at most `H ^ [K : ℚ]` (`Algebra.norm_eq_prod_embeddings`),
  and all its conjugates in `L` have norm at most `1`. The ultrametric form of Schwarz's lemma: if
  `f` has the power series `q` about `0`, the terms of degree `< T` vanish and `‖q n‖ r ^ n ≤ M`,
  then `‖f z‖ ≤ M (‖z‖ / r) ^ T` for `‖z‖ ≤ r` in the ball of convergence
  (`HasFPowerSeriesOnBall.norm_le_mul_div_pow_of_isUltrametricDist`). ⚠ The exponent is `[K : ℚ]`,
  not `[K : ℚ] - 1` as at an archimedean place (3.1): `x = p` in `ℚ` has `‖p‖ = 1 / p`.
  *Prerequisites:* Mathlib only.
- **8.3 Many zeros in the unit disc force small coefficients**
  (`PowerSeries.norm_coeff_le_of_ofScalarsSum_iterate_derivative_eq_zero`). Over a complete
  ultrametric field `K` of characteristic `0`: if `f : PowerSeries K` has `‖coeff k f‖ r ^ k ≤ M`
  for all `k` with `r > 1`, and `f` vanishes to order `S` (the values of its formal derivatives of
  order `< S`, by `ofScalarsSum`, vanish) at every point of a finite set `A` with `‖a‖ ≤ 1`, then
  `‖coeff k f‖ ≤ M r ^ (-(card A · S))` for every `k`; and the same bound holds for the value of `f`
  at every `x` with `‖x‖ ≤ 1`
  (`PowerSeries.norm_ofScalarsSum_le_of_ofScalarsSum_iterate_derivative_eq_zero`). Take
  `1 < r' < r`: the bound makes `f` restricted at the radius `r'` (its coefficients times `r' ^ k`
  tend to `0`), which the bound at `r` itself need not give. Divide `f` at the radius `r'` by the
  distinguished polynomial `∏_{a ∈ A} (X - a) ^ S` (Tau Ceti's Weierstrass division). The remainder
  has degree `< card A · S` and vanishes to order `S` at each `a`, so it is zero, and Gauss-norm
  multiplicativity at the radii `1` and `r'` gives `‖coeff k f‖ ≤ M r' ^ (-(card A · S))`, since
  `‖X - a‖` is `1` at radius `1` and `r'` at radius `r'`; let `r'` tend to `r`. This takes the place
  of the maximum-modulus step in Baker's Lemmas 4 and 5: each zero gains a factor `r`, where Baker
  gains a factor growing with `h`. *Prerequisites:* Mathlib and the Tau Ceti files listed above.
- **8.4 Exponential polynomials as power series.** Over a commutative ring,
  `expDerivFactor c m P = (Q ↦ Q' + c Q)^[m] P` (`Polynomial.expDerivFactor`), with
  `expDerivFactor c 0 P = P` and the recursion (`Polynomial.expDerivFactor_zero`,
  `Polynomial.expDerivFactor_succ`, both proved), the binomial form
  `∑_{j ≤ m} (m choose j) c ^ (m - j) P⁽ʲ⁾` (`Polynomial.expDerivFactor_eq_sum`), and degree at most
  that of `P` (`Polynomial.natDegree_expDerivFactor_le`); in an ultrametric field its coefficients
  are at most `max 1 ‖c‖ ^ m` times a bound for those of `P`
  (`Polynomial.norm_coeff_expDerivFactor_le`). Over a field of characteristic `0`, `Q (X) exp (ψ X)`
  is `(Q : PowerSeries K) * rescale ψ (exp K)`, and its `m`-th formal derivative is
  `expDerivFactor ψ m Q · exp (ψ X)` (`Polynomial.iterate_derivative_mul_rescale_exp`). In a normed
  field `L` over `ℚ_[p]`: if `‖Q.coeff j‖ r ^ j ≤ M` for all `j` and `‖ψ‖ r ≤ ρ`, then the
  coefficients `c k` of `Q (X) exp (ψ X)` satisfy `‖c k‖ r ^ k ≤ M`, since `‖ψ ^ k / k!‖ r ^ k ≤ 1`
  by 8.1 (`Polynomial.norm_coeff_mul_rescale_exp_mul_pow_le`); and if `L` is complete, the series
  sums to `Q (x) exp (ψ x)` when `‖ψ x‖ < ρ` (`Polynomial.hasSum_coeff_mul_rescale_exp`).
  *Prerequisites:* 8.1.
- **8.5 Hermite interpolation with ultrametric bounds** (Baker, Lemma 7;
  `Polynomial.exists_hermite_of_isUltrametricDist`). For points `σ i` of norm at most `1` with
  `‖σ i - σ j‖ ≥ ϱ` for `i ≠ j`, `0 < ϱ ≤ 1`, and `s < S`, there is a polynomial `W` whose
  derivatives of order `< S` at the points vanish except the `s`-th at `σ r`, which is `1`, with
  every coefficient at most `‖1 / s!‖ ϱ ^ (-(card ι · S))`. ⚠ `‖1 / s!‖ = p ^ (v_p (s!))` is at
  least `1`, unlike at an archimedean place. *Prerequisites:* Mathlib only.
- **8.6 Baker's auxiliary function on the diagonal** (`frequency`, `gammaCoeff`, `zeroFrequency`,
  `derivativePoly`, `derivativeSeries`). Suppose, to be refuted,
  `ℓ none = β₀ + ∑ r, β r ℓ (some r)` for `ℓ : Option (Fin k) → ℂ_[p]` in the disc. For `P` indexed
  by `d ≤ L` and `e : Option (Fin k) → Fin (L + 1)`, the derivative `f_m` of order `m` of Baker's
  function `∑ P (d, e) z₀ ^ d exp (e_none β₀ z₀) ∏_r exp ((e_r + e_none β_r) ℓ_r z_r)`,
  restricted to the diagonal, is the power series `derivativeSeries ℓ β₀ β L P m`, a sum of the
  exponential polynomials of 8.4 at the frequencies `ψ_e = ∑_o e_o ℓ_o`. The relation gives
  `D f_m = ∑_o f_{m + e_o}` (`derivative_derivativeSeries`), and at a natural number `l`
  (`ofScalarsSum_derivativeSeries_natCast`)
  `f_m (l) = (∏_r ℓ_r ^ {m_r}) ∑_{(d, e)} P (d, e) (∏_r γ_r ^ {m_r})
  expDerivFactor (e_none β₀) m_none (X ^ d) (l) ∏_o exp (ℓ_o) ^ (e_o l)` with
  `γ_r = e_r + e_none β_r`. *Prerequisites:* 8.1, 8.4.
- **8.7 The arithmetic** (Baker, Lemmas 2, 3 and 6). In the number field `K` of the data (3.3),
  with embedding `ι₀ : K →+* ℂ_[p]`, `ι₀ (αK o) = exp ℓ_o`, and `δ` times each of `αK o`, `βK r`,
  `βK₀` an algebraic integer of house at most `G`:
  (a) **Lemma 3:** for `P` with `δ ^ 0 · P (d, e)` of house at most `H_P`, the sum in 8.6 at `l ≥ 1`
  is `ι₀` of an element of `K` whose size in the sense of 3.2 has exponent `∑ m + (k + 1) L l` and
  house at most `(L + 1) ^ (k + 2) H_P (L + 1) l ^ L (2 L G) ^ (∑ m) G ^ ((k + 1) L l)`;
  (b) **Lemma 2:** 3.5 gives algebraic integers `P`, not all zero, of house at most
  `C (L + 1) ^ (k + 2) entryBound k L h G` (`entryBound`), with `f_m (l) = 0` for all `m o ≤ h ^ 2`
  and `1 ≤ l ≤ h`, provided `2 ((h ^ 2 + 1) ^ (k + 1) h) ≤ (L + 1) ^ (k + 2)`; Baker's Lemma 2 asks
  only `∑ m ≤ h ^ 2`, and solves over `ℤ` rather than over `K`;
  (c) **Lemma 6:** distinct frequencies are far apart:
  `((2 G ^ ((k + 1) L)) ^ [K : ℚ])⁻¹ ≤ ‖ψ_e - ψ_e'‖` for `e ≠ e'` with entries at most `L`
  (`inv_pow_le_norm_frequency_sub`), by 8.1 and 8.2 applied to `∏ α_o ^ {e_o} - ∏ α_o ^ {e'_o}`.
  *Prerequisites:* 3.2, 3.3, 3.5, 8.1, 8.2, 8.6.
- **8.8 The argument, with the parameters as hypotheses** (Baker, Lemmas 4 and 5 and §5;
  `false_of_admissible`, with the conditions bundled as `Admissible`). Let `r₀ > 1` with
  `‖ℓ_o‖ r₀ ≤ ρ`, `B ≥ 1` a bound for the `β`'s, `0 < lmin ≤ ‖ℓ_o‖`, `C` the constant of 3.5 and
  `D = [K : ℚ]`, and write `E = entryBound k L h G` and `Π = C (L + 1) ^ (k + 2) E`. The
  conditions on `L, h ≥ 1`, `Kmax` and the sequences `S J`, `R J` are:
  1. `2 ((h ^ 2 + 1) ^ (k + 1) h) ≤ (L + 1) ^ (k + 2)` (the count of 8.7(b));
  2. `S 0 ≤ h ^ 2`, `R 0 ≤ h`, and `2 S (J + 1) ≤ S J` for `J < Kmax`;
  3. **extrapolation**, for `J < Kmax`, with `S' = S (J + 1)` and `R' = R (J + 1)`:
     `B ^ S' r₀ ^ L ((L + 1) ^ (k + 2) Π (L + 1) R' ^ L (2 L G) ^ S' G ^ ((k + 1) L R')) ^ D <
     lmin ^ S' r₀ ^ (R J S')`;
  4. **final:** `Π ^ D p ^ L (2 G ^ ((k + 1) L)) ^ (D (L + 1) ^ (k + 2)) r₀ ^ L <
     r₀ ^ (R Kmax S Kmax)`.

  They are incompatible with the relation of 8.6. The steps: Lemma 2 gives `P`; by induction on
  `J ≤ Kmax`, `f_m (l) = 0` for `∑ m ≤ S J` and `1 ≤ l ≤ R J` (for `J + 1`: by `D f_m` in 8.6 the
  series `f_m` with `∑ m ≤ S (J + 1)` vanish to order `S (J + 1)` at `1, …, R J`, so 8.3 makes
  `f_m (l)` small for `l ≤ R (J + 1)`, and 8.2 with 8.7(a) and (3) makes it zero); at the end
  `f_0` has all coefficients at most `r₀ ^ L r₀ ^ (-(R Kmax · S Kmax))` (8.3), and 8.5 at the
  points `ψ_e`, separated by Lemma 6, writes some `P t ≠ 0` as a combination of these
  coefficients, which contradicts 8.2 by (4). *Prerequisites:* 8.2, 8.3, 8.5, 8.7.
- **8.9 The choice of parameters** (`exists_admissible`). For `k + 1` logarithms put
  `Kmax = (2k + 3)(3k + 7)` and, for an integer `t`, `X = 2 ^ t`, `h = X ^ (3k + 7)`,
  `L = X ^ (6k + 11)`, `R J = X ^ (3k + 7 + J)` and `S J = 2 ^ (Kmax - J) X ^ (6k + 13)`. For all
  large `t` these satisfy (1)–(4) of 8.8: each constant is at most a power of `r₀`, and each
  inequality compares `r₀ ^ (c Y)` with `r₀ ^ (X Y)` for a `c` independent of `t`. These are not
  Baker's values (`L = [h ^ (2 - 1/(4n))]`, `R J = [h ^ (1 + J/(8n))]`, `S J = [h² / 2 ^ J]`,
  `J ≤ (8n)²`): the `p`-adic gain per zero is the fixed factor `r₀` of 8.3, not a power of `h`.
  *Prerequisites:* the definition `entryBound` of 8.7.
- **8.10 Baker's theorem over `ℂ_[p]`** (`PadicBaker.eq_zero_of_add_sum_mul_eq_zero`). If
  `ℓ i ∈ ℂ_[p]` have `‖ℓ i‖ < ρ`, algebraic `exp (ℓ i)`, and are linearly independent over `ℚ`, and
  `β₀ + ∑ β i ℓ i = 0` with algebraic `β₀, β i`, then `β₀ = 0` and every `β i = 0`. Hence a linear
  form in such `ℓ i` with algebraic coefficients and some `β i ≠ 0` is transcendental
  (`PadicBaker.transcendental_add_sum_mul`). The proof divides the relation by a nonzero coefficient
  inside the number field of the data (3.3), takes `r₀ = ρ / max ‖ℓ i‖`, `B` a bound for the
  coefficients, `lmin = min ‖ℓ i‖` and `C` from 3.5, and applies 8.8 with 8.9. ⚠ The norm condition
  is needed (`PadicComplex.exp_one_eq_zero`: with `ℓ = 1`, `-1 + 1 · 1 = 0`). The restriction to the
  disc loses nothing: every `p`-adic logarithm of an algebraic number has a multiple by a power of
  `p` in the disc. *Prerequisites:* 3.3, 3.5, 8.8, 8.9.

## Worked examples (acceptance criteria, keeping the theory honest)

- `Complex.exp 1` and `Real.pi` are transcendental over `ℤ` (6.3; `transcendental_e`,
  `transcendental_pi`, in the form of Mathlib PR #28013).
- `Real.exp Real.pi` is transcendental: it is `(-1) ^ (-I)` in the principal branch (6.4;
  `transcendental_exp_pi`).
- `(2 : ℂ) ^ (Real.sqrt 2 : ℂ)` is transcendental (6.4; `transcendental_two_cpow_sqrt_two`).
- `Real.log 2` is transcendental (6.3; `transcendental_log_two`), and `Real.log 2 / Real.log 3` is
  transcendental (6.4, with its irrationality from `2 ^ q ≠ 3 ^ p`;
  `transcendental_log_two_div_log_three`).
- `Real.pi + Real.log 2` is transcendental (7.3; `transcendental_pi_add_log_two`): it is
  `(-I) · (π I) + 1 · log 2`, a nonzero linear form in the logarithms `π I` of `-1` and `log 2`
  of `2`.
- `exp p` is transcendental in `ℂ_[p]` for odd `p` (8.10 with `ℓ = p`, since `‖p‖ = 1 / p < ρ`;
  `PadicBaker.transcendental_exp_prime`). For `p = 2` the point `2` lies on the boundary of the
  disc (8.1).

Normalisation checks, which catch a wrong factorial or a wrong placeholder value early:
- the Taylor coefficient of `z ^ 2` at `0` is `1` (`Examples.mvTaylorCoeff_sq`), while its second
  derivative is `2` (`Examples.iteratedFDeriv_sq`);
- a monomial `∏ i, z i ^ τ i` has Taylor coefficient `1` at `τ` and `0` at every other
  multi-index, at the origin (`mvTaylorCoeff_prod_pow`);
- `mvTaylorCoeff f x α = 0` when `f` is not analytic at `x` (`mvTaylorCoeff_of_not_analyticAt`,
  proved); every target either assumes analyticity or concerns an entire function, so none holds
  only through this value.

Rejection tests, each showing that a hypothesis cannot be dropped: `4 ^ (1 / 2) = 2` for 6.4,
`log 4 / log 2 = 2` for the quotient in 6.4, and `2 log 2 - log 4 = 0` for 7.2 (all three proved
in `Suggested.lean`), and `NormedSpace.exp (1 : ℂ_[p]) = 0` for the norm condition of Layer 8
(`PadicComplex.exp_one_eq_zero`).

## Ordering

```
Layer 0 ──┬── Layer 1 ──┬── Layer 4 ──┐
          │             │             │
          └── Layer 2 ──┼─────────────┼── Layer 5 ── Layer 6 ── Layer 7
                        │             │
Layer 3 ────────────────┴─────────────┘
   │
   └── Layer 8
```

Layer 0 first; within it 0.1–0.3 before 0.4, and 0.5 last. Layers 1 and 2 need only Layer 0 and
can proceed in parallel; within Layer 1, 1.3 and 1.4 before 1.5, and 1.1–1.3 before 1.6. Layer 3 is
independent of Layers 0–2. Layer 4 needs 1.4, 1.5 and 3.4. Within Layer 5, 5.1–5.4 can proceed in
parallel once their prerequisites are in; 5.5 needs them and 4.1, and 5.7 needs 5.5 and 5.6.
Layer 6 needs 5.7, and Layer 7 needs Layer 6. Layer 8 needs only 3.2, 3.3 and 3.5 and can proceed
in parallel with Layers 0–7; within it, 8.1–8.5 are independent of one another, then 8.6, 8.7,
8.8 and 8.9, and 8.10 last.

## References

- M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Grundlehren 326,
  Springer, 2000: Chapter 1 (statements), Chapter 4 (the proof followed here), Proposition 3.14
  (Liouville's inequality).
- A. Baker, *Transcendental Number Theory*, Cambridge University Press, 1975; reissued in the
  Cambridge Mathematical Library, 2022, with an introduction by D. Masser. Chapter 2: Theorems
  2.1–2.4, and the proof followed in Layer 8.
- D. Bertrand and D. W. Masser, *Linear forms in elliptic integrals*, Invent. Math. 58 (1980),
  283–288 (the argument of 7.1).
- A. Brumer, *On the units of algebraic number fields*, Mathematika 14 (1967), 121–124 (Baker's
  method over `ℂ_p`, for the `p`-adic rank of units; Layer 8).
- L. K. Hua, *Introduction to Number Theory*, Springer, 1982, §17.9 (Gelfond's one-variable proof
  of Gelfond–Schneider, used by Mathlib PR #42911).
- S. Lang, *Introduction to Transcendental Numbers*, Addison-Wesley, 1966 (the criterion).
- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge University Press, 2006
  (Siegel's lemma).

## Provenance

Most of the development exists, sorry-free and using only the axioms `propext`,
`Classical.choice` and `Quot.sound`, on the `baker` branch of
[mkaratarakis/mathlib4](https://github.com/mkaratarakis/mathlib4) at commit
[`1d51891b5b`](https://github.com/mkaratarakis/mathlib4/tree/1d51891b5be7ceeca95b4583cad39e0681c5e453/Mathlib/NumberTheory/Transcendental/Baker),
under `Mathlib/NumberTheory/Transcendental/Baker/`. It is released under the Apache 2.0 licence,
like Mathlib, and its author, M. Karatarakis, is the author of this roadmap, so porting it needs no
further agreement; credit that source in each ported file. It is a cited source, not the
specification: the targets above state the mathematics, and these are not in it: 0.4 over an
arbitrary nontrivially normed field (the source states it over `RCLike` fields); in 0.4 the
coefficient of order `0`, translation, the comparison with iterated derivatives, the one-variable
form, the product rule and the general-valued form of `mvTaylorCoeff_comp_eq_zero` (the source has
it for `ℂ`-valued series); 1.3 in the form consuming Mathlib's Schwarz lemma, with its order lemma
over any nontrivially normed field; the branch-free forms in 6.3 and 6.4, `transcendental_exp` and
`transcendental_log` in the forms of Mathlib PR #28013, and `exists_rat_eq_div_or_transcendental`;
the principal-branch form of 7.3 (the source has the exponential form); the worked examples other
than `π`; and the normalisation checks and rejection tests. The names there differ throughout
(`coeff`, `taylorCoeff`, `auxF`, `growth`, `core`, `main`, `theorem45`, `baker`,
`gelfond_schneider`, …); the table gives the source names. File map, with the main declarations
of each file:

| file | targets | declarations |
|---|---|---|
| `AnalyticTsum.lean` | 0.2 | `hasFPowerSeriesOnBall_tsum`, `analyticAt_tsum` |
| `MultiIndex.lean` | 0.3 | `coeff`, `hasFPowerSeriesOnBall_tsum_monomial` |
| `TaylorCoeff.lean` | 0.4 | `taylorCoeff`, `taylorCoeff_eq`, `taylorCoeff_eq_of_hasSum`, `exists_hasSum_of_analyticAt` |
| `CoordinateDivision.lean` | 0.5 | `exists_analyticAt_eq_pow_smul`, `analyticAt_dslope_slice` |
| `Polydisc.lean` | 1.1, 1.2 | `norm_le_of_forall_norm_coord_eq`, `norm_le_of_eq_prod_smul` |
| `Interpolation.lean` | 1.3, 1.4, 1.5 | `norm_le_mul_div_pow_of_iterate_dslope_eq_zero`, `norm_coeff_mul_pow_le`, `norm_sub_partialSum_le` |
| `SchwarzProduct.lean` | 1.6 | `norm_le_of_taylorCoeff_eq_zero`, `norm_le_of_taylorCoeff_eq_zero_of_five_mul_le` |
| `ExpPoly.lean` | 0.1, 2.1, 2.2 | `hasSum_prod_pi`, `taylorCoeff_expMonomial`, `norm_expMonomial_le` |
| `ExpIndep.lean` | 2.3 | `eq_zero_of_sum_eval_mul_cexp`, `eq_zero_of_sum_eval_mul_cexp_pi` |
| `Liouville.lean`, `AlgSize.lean` | 3.1, 3.2 | `one_le_norm_embedding_mul_house_pow`; `AlgSize` bundles the two size hypotheses |
| `ThueSiegel.lean` | 3.4 | `exists_int_vec_abs_le_of_pow_lt`, `exists_int_vec_norm_le_of_pow_le` |
| `AuxiliaryFunction.lean` | 4.1 | `exists_auxiliary_function` |
| `Criterion.lean` | 5.1–5.5 | `auxF`, `norm_auxF_le`, `map_thetaK`, `algSize_thetaK`, `one_le_taylorCoeff`, `exists_taylorCoeff_ne_zero`, `core` |
| `CriterionMain.lean` | 3.3, 5.6, 5.7 | `exists_parameters`, `main` |
| `SchneiderLang.lean` | 5.7, 6.1, 6.2 | `schneiderLang`, `schneiderLang_zero`, `schneiderLang_one` |
| `Setup.lean` | 7.2 | `BakerData`, `exists_bakerData_of_baker_counterexample` (the normalised counterexample) |
| `Reduction.lean` | 7.1 | `theorem45`, `baker_of_theorem45` |
| `Basic.lean` | 6.3, 6.4, 7.2, 7.3 | `transcendental_pi`, `gelfond_schneider`, `baker`, `baker_linearIndepOn`, `baker_add_sum_ne_zero` |

Layer 8 exists in the same way on the `baker-padic` branch of the same repository, at commit
[`65cdef5722`](https://github.com/mkaratarakis/mathlib4/tree/65cdef5722194f07709ab40ff46eede531f52f5d/Mathlib/NumberTheory/Transcendental/Baker/Padic),
under `Mathlib/NumberTheory/Transcendental/Baker/Padic/`, with the same licence and author. It
states 8.1 and the integer bound of 8.2 for `ℂ_[p]` only, with the norm of `n!` rather than of every
natural number, and 8.3 for natural-number points and for coefficient sequences (`seqEval`,
`seqDeriv`) rather than Mathlib's `ofScalarsSum` and `PowerSeries`, and proves 8.3 by a direct
argument rather than by Weierstrass division; it lacks the binomial form of 8.4, the worked example
and the rejection test, and bundles the size hypotheses with `AlgSize` as the complex part does.
Siegel's lemma with a constant (3.5) is its `exists_siegel`. File map:

| file | targets | declarations |
|---|---|---|
| `Exp.lean` | 8.1 | `PadicComplex.norm_natCast_factorial`, `le_radius_expSeries`, `exp_add`, `norm_exp_sub_one`, `exp_injOn` |
| `Liouville.lean` | 8.2 | `IsUltrametricDist.norm_le_one_of_isIntegral`, `PadicComplex.one_le_abs_mul_norm_intCast`, `NumberField.one_le_pow_mul_norm_embedding` |
| `Series.lean` | 8.3 | `seqEval`, `seqDeriv`, `norm_le_of_iterate_seqDeriv_eq_zero` |
| `ExpSeries.lean` | 8.4 | `derivAdd`, `derivAdd_succ`, `natDegree_derivAdd_le`, `norm_coeff_derivAdd_le`, `expPolySeq`, `norm_expPolySeq_mul_pow_le`, `hasSum_expPolySeq` |
| `Hermite.lean` | 8.5 | `exists_hermite` |
| `Auxiliary.lean` | 8.6 | `aux`, `seqDeriv_aux`, `seqEval_aux_natCast` |
| `Arithmetic.lean` | 3.5, 8.7 | `exists_siegel`, `algSize_Aval`, `exists_aux_vanishing`, `inv_pow_le_norm_psi_sub` |
| `Core.lean` | 8.8 | `core` |
| `Parameters.lean` | 8.9 | `exists_parameters` |
| `Main.lean` | 8.10 | `eq_zero_of_add_sum_mul_eq_zero`, `transcendental_add_sum_mul` |
