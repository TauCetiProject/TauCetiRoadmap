# Bounded Laplace and ordered Dirichlet boundary convergence

Construct the bounded-complex Newman Tauberian theorem, its ordered Dirichlet endpoint corollary,
and the nontrivial native Dirichlet-character Euler-product comparison at1. Use the existing
`TauCeti.LSeries` namespace and Mathlib `LSeriesHasSum`, Bochner integrals, analytic functions,
filters and finite sums/products. Introduce no competing Dirichlet-series or character carrier.

ArithmeticDirichletSeries is completed: its [archived specification](../../Completed/ArithmeticDirichletSeries/README.md)
and native `TauCeti.NumberTheory.ArithmeticDirichletSeries` modules retain all ideal/norm/convolution,
Euler-log, density, Abel/Perron, Landau, Wiener–Ikehara and PNT programmes and interfaces.
In particular native `TauCeti.LSeries.wienerIkehara`, `wienerIkehara_zero` and their natural-cutoff,
eventual-nonnegative and rescaled variants are consumed existing theorems, not targets reopened here.
Their nonnegative mean-value conclusion differs from the bounded-complex ordinary boundary sum below.
This successor adds only the missing N1–N3 construction and comparison API. It owns no quadratic-field,
order-class/genus, new nonvanishing, zero-free region, completed L-function or mass theorem.

Suggested home: `TauCeti/NumberTheory/LSeries/Newman.lean`, followed by `BoundaryConvergence.lean` and
a Dirichlet-character specialization alongside the existing Euler-product modules. Reuse upstream
interfaces when available while constructing these targets now; do not wait or assign work upstream.

## N1. Bounded Laplace endpoint

Construct the reusable complex Newman Tauberian theorem.
For `f : ℝ → ℂ`, assume local Bochner integrability on `[0,∞)` and an actual bound
`‖f(t)‖ ≤ M` there, with `0 ≤ M`. Let `Ω ⊆ ℂ` be open and contain the whole closed
right half-plane. Supply a holomorphic `G` on `Ω` agreeing, for `Re z > 0`, with
`∫ t in [0,∞), f(t) exp(-zt) dt`; boundedness proves integrability on that open
half-plane. Export `newmanLaplace_tendsto_integral`:
`Tendsto (fun T : ℝ ↦ ∫ t in 0..T, f(t)) atTop (𝓝 (G 0))`.
The open-neighborhood continuation, not merely a continuous boundary value, is
mandatory. No sign, arithmetic, PNT rate or uniform zero-free strip is assumed.

For `T≥0`, construct finite transforms `G_T(z)=∫_0^T f(t)exp(-zt)dt` and prove them entire by
parameter-integral differentiation with explicit compact-time dominating functions.
Prove the infinite transform holomorphic for `Re z>0` by exponential domination.
For every `R>0`, apply Cauchy's formula with kernel
`exp(Tz)(1+z²/R²)/z`. Compare the full radius-R circle for `G_T` with the right
semicircle and a left detour for `G`, chosen inside `Ω` by compactness of the
imaginary segment `[-iR,iR]`. On the right arc the tail bound is
`|G-G_T| ≤ M exp(-T Re z)/(Re z)`; on the left arc use
`|G_T| ≤ M exp(-T Re z)/|Re z|`. Since
`|1+z²/R²|=2|Re z|/R` on the circle, the normalized contributions are each at most
`M/R`. Treat the imaginary endpoints by limits, not division by zero. The detour
integral tends to zero by dominated convergence: its interior is strictly left
of the axis and avoids zero, and its endpoints have measure zero. Supply the
piecewise contour/Cauchy-deformation, orientation, finite-length and domination
lemmas explicitly from the native complex/Bochner integration APIs. This proves
`limsup |G_T(0)-G(0)| ≤ 2M/R`; let `R→∞`. No radius-independent continuation width
is used. These contour and comparison lemmas are construction targets here.

## N2. Bounded Dirichlet ordinary endpoint

Export `boundedDirichlet_tendsto_ordered_at_one` for `a : ℕ → ℂ` with `a 0=0` and
`‖a n‖≤M` for `n≥1`, and a holomorphic `F` on an open neighborhood of `Re s≥1`
with native `LSeriesHasSum a s (F s)` for `Re s>1`. Its conclusion is exactly
`Tendsto (fun N : ℕ ↦ ∑ n ∈ Finset.Icc 1 N, a n / (n:ℂ)) atTop (𝓝 (F 1))`.
It is not `LSeriesHasSum a 1 (F 1)`, an unconditional `HasSum`, or an equality
with totalized `LSeries a 1`. Construct `f(t)=a ⌊exp t⌋₊` for `t≥0`, proving its
local integrability from the finite step partition on each compact interval.
On `Re z>0` its Laplace transform is `F(z+1)+H(z)`, where
`H(z)=Σ_(n≥1) a n (∫_n^(n+1) x^(-z-1) dx - n^(-z-1))`.
Prove `H` holomorphic on `Re z>−1`: on each compact subset use the x-derivative
bound `C_K n^(-Re z-2)` and locally uniform summability, including the compact
parameter derivatives/holomorphic uniform-limit comparison. At `z=0` the same
absolutely convergent correction is
`Σ a n (log(1+1/n)-1/n)`. Apply the Laplace theorem at `T=log(N+1)`, where the
finite integral is `Σ_(1≤n≤N) a n log(1+1/n)`, and subtract the correction.
Export real-to-natural cutoff equivalence, finite coefficient changes with the
explicit finite correction, linearity and uniqueness, and the interval/step
identities used in this proof. Keep all these lower comparison lemmas before
the endpoint export; no new Dirichlet-series or unordered summation carrier is
introduced.

The alternating `a n=(-1)^(n-1)` for `n≥1` is an ordered-versus-unconditional
rejection test: its boundary harmonic sum converges, while absolute summability
fails. The trivial coefficient `a n=1` has a pole at1 and fails the continuation
hypothesis; continuous boundary data from Wiener–Ikehara alone cannot replace the analytic
neighborhood for arbitrary signed coefficients. The completed Landau, Wiener–Ikehara, ideal-density and PNT programmes remain separate and unchanged.

## N3. Native Dirichlet logarithms and ordered prime products

Construct the following specialization in the existing `TauCeti.LSeries` namespace. For any native
nontrivial complex Dirichlet character `χ` of positive level define only the
coefficient abbreviation
`aχ(n)=χ(n) * ArithmeticFunction.vonMangoldt(n) / Real.log(n)`.
Prove its0/1 values, `‖aχ(n)‖≤1`, and `aχ(p^k)=χ(p)^k/k` for prime `p`, `k≥1`;
it is zero off prime powers. Use native `norm_le_one`, `vonMangoldt_nonneg`,
`vonMangoldt_le_log` and the prime-power formulas. Native
`eulerProduct_log_eq_LSeries` and `LSeries_eq_exp_LSeries`, together with the
actual absolute-summability bound for `Re s>1`, supply a holomorphic Euler-log
function `F` there and `exp(F(s))=LFunction χ s`. Use
`differentiable_LFunction (χ≠1)` and
`LFunction_ne_zero_of_one_le_re (Or.inl hχ)` on the ENTIRE closed half-plane,
with `[NeZero N]`. The theorem only at `s=1` is insufficient for this route.

On the nonzero balls centered on `Re s=1`, reuse the native
`TauCeti.exists_differentiableOn_eqOn_exp_comp`: each ball is open and simply
connected, and native continuation/nonvanishing supplies its actual hypotheses.
No new generic holomorphic-log theorem is commissioned. Normalize
each branch to agree with `F` on its connected right cap. Two overlapping such
balls have connected intersection meeting `Re s>1`; the identity theorem makes
the normalized branches agree. Glue them with `F` to obtain a holomorphic
extension on an open neighborhood of `Re s≥1`. No principal-log identity for
the whole product and no uniform zero-free strip are asserted.

### Ordered endpoint and finite deletions Apply N2’s
`boundedDirichlet_tendsto_ordered_at_one` to obtain the limit of
`Σ_(1≤n≤N) aχ(n)/n`. The higher prime powers converge absolutely, since
`Σ_(p prime,k≥2) |χ(p)^k/(k p^k)| ≤ Σ_(m≥2) 1/(m(m−1))=1`.
Prove the finite cutoff identity with `p^k≤N`, remove this convergent tail,
and compare each finite prime factor using the absolutely convergent Taylor
series for `−log(1−χ(p)/p)`. The discrepancy between summing its higher powers
for `p≤N` and `p^k≤N` tends to zero by the same absolute bound. Exponentiation
then gives exactly
`Tendsto (fun N : ℕ ↦ ∏ p ∈ (Finset.range (N+1)).filter Nat.Prime,
 (1−χ(p)/(p:ℂ))⁻¹) atTop (𝓝 (LFunction χ 1))`,
whose value is nonzero by the native theorem. Export the analogous cutoff with
`p∉S` for any finite set of primes: its limit is
`LFunction χ 1 * ∏ p∈S, (1−χ(p)/p)`.
These are ORDERED cutoff limits. Do not export unordered `HasProd`/`tprod`,
`HasSum`/`tsum`, or a value of totalized `LSeries aχ 1` at this conditional boundary.
Real cutoffs and arbitrary cofinal increasing prime bounds have explicit
comparison lemmas. Supply finite-set change, conjugation and character-level
transport laws with their actual finite factors.

## Basic API, order and boundaries

N1's finite-transform/contour lemmas precede its improper-integral limit. N2's step partition,
parameter-integral and locally uniform correction lemmas precede the ordered sum limit and consume N1.
N3's coefficient, local-log patching and finite prime-power comparisons consume N2 plus actual native
Dirichlet Euler/continuation/nonvanishing; no arithmetic class-number theorem is a premise.
Export restriction of an analytic continuation neighborhood, uniqueness of the endpoint, linearity,
finite coefficient corrections, natural/real cutoff comparison and finite-prime deletion/change-level
laws. Actual contour directions and endpoint exclusions are part of the interface. Coefficients
remain arbitrary bounded complex values; a real/quadratic specialization cannot replace N1/N2.

Only `Re s>1` uses native absolute `LSeriesHasSum`. Boundary outputs are `Tendsto` of finite ordered
cutoffs. The alternating harmonic sequence rejects unconditional `HasSum`/totalized `LSeries` at1;
the trivial character rejects nontrivial-character hypotheses and has the divergent prime product.
The neighborhood covers the entire closed boundary half-plane; pointwise nonzero at1 or an Abel limit
alone does not supply it. No uniform strip, PNT rate, general L-function engine or principal logarithm
of an arbitrary infinite product is assumed.

OrthogonalTamagawaAndLatticeMass1.4 consumes N2/N3 for the signed quadratic-character endpoint and
constructs its separate primitive-conductor, Dedekind residue, order/unit and genus dictionary.
IntegralLattices7C consumes that actual arithmetic comparison. The direct algebraic binary genus mass
and the rank≥3 absolute Euler/gauge route remain independent. The illustrative Suggested declarations
state N1/N2 on actual existing carriers; their admitted proofs do not implement these constructions.

## References

- D. J. Newman, the bounded-Laplace contour argument in the original short analytic PNT proof, [DOI](https://doi.org/10.1080/00029890.1980.11995126).
- D. Zagier, *Newman’s short proof of the prime number theorem*, American Mathematical Monthly104(1997),705–708; [official bibliography](https://people.mpim-bonn.mpg.de/zagier/).
- The completed arithmetic Dirichlet-series specification and the native Mathlib Dirichlet Euler-product, continuation and nonvanishing modules, plus Tau Ceti’s holomorphic-log and Wiener–Ikehara modules.
