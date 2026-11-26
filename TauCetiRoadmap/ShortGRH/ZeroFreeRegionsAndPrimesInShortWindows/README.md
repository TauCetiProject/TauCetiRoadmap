# Zero-free regions and primes in short windows

This roadmap states the analytic number theory that the shorter route [ShortProof] to the Riemann hypothesis for
Dirichlet L-functions uses, in the forms in which it uses it. It is a background roadmap of the family `ShortGRH`. Its
results are classical in kind; several are stated for every Dirichlet character, primitive or not, with an explicit
uniformity in the modulus, and several are weaker than the published theorems and have shorter proofs.

The argument of the family has this shape. A one-sided upper bound for a weighted prime sum over a residue class gives a
half-plane free of zeros of Dirichlet L-functions; the bound comes from comparing an upper and a lower bound for the
covolume of a lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData §§0.2, 6.1, 6.2). The results stated
here enter that argument, as [ShortProof] proves it, at four places.

- The criterion that turns the one-sided bound into a zero-free half-plane needs an auxiliary prime `d ≡ 7 (mod 8)` in
  a residue class such that no quadratic twist `ξ·(·/d)` of a character `ξ` of the modulus has a zero in a given box to
  the right of `1/2` (3.5). The choice of `d` rests on a weak zero-density count for these twists, proved with the theta
  series of a character (3.1, 3.2), zero detection by a smoothed mollifier (3.3) and a mean value over real characters
  for which the Pólya–Vinogradov inequality suffices (3.4). The criterion also uses Landau's theorem in one-sided form,
  which is taken from PositivityOfDirichletSeriesWithKernels §6.4 (b).
- The one-sided bound at a point `x` is completed by the prime number theorem for the remainder at a second, much larger
  cut-off, with every power of the logarithm saved. [ShortProof] proves it by a Tauberian theorem with a rate (2.1),
  fed by a zero-free region with a bound for the logarithmic derivative (1.4), which rests on a growth bound near
  `Re s = 1` (1.3); OneSidedPrimeSumBoundsAndAdmissibleData §6.2 cites the Siegel–Walfisz theorem for it
  (AnalyticNumberTheoryPartI §0.32).
- The construction of the data needs primes `≡ 1` modulo the powers `m^k` of a fixed modulus `m`, with logarithm in a
  prescribed window, uniformly in `k`. [ShortProof] takes them from 2.2; OneSidedPrimeSumBoundsAndAdmissibleData §3.7
  cites AnalyticNumberTheoryPartI §0.32 for them.
- The passage from the half-plane to the critical line, and the trivial zeros of imprimitive characters, use the
  reflection of the zeros for every character (1.2).

Layer 1 treats the L-functions of all characters: the functions with the pole removed and the quadratic twists (1.1),
reflection (1.2), growth near `Re s = 1` (1.3) and the zero-free region (1.4). Layer 2 passes from zero-free regions to
primes: the Tauberian theorem (2.1) and primes in windows (2.2). Layer 3 gives the zero-density count for quadratic
twists and the choice of `d` (3.1–3.5).

## Conventions and notation

**Labels.** Every section that states something carries, under its heading, `*Origin:*` (one of `published:`,
`adapted from`, `particular to this proof:`, `this roadmap's own formulation:`, `definitions and conventions`) and
`*Method of the formal proof:*`, how [ShortProof] proves it. The last line of a section names where [ShortProof] proves
it, as `[ShortProof], path (declarations)`, with the path relative to its directory `src/`.

**Statements of the formal proof.** The hypotheses, ranges and constants of a target are those of [ShortProof]; where a
section states more, its last sentence says which case [ShortProof] proves. Numerals such as `10¹⁰`, `25`, `9δ` are those
of [ShortProof]; where a later section needs less, the section says so.

**Quantifiers.** "For all large `x`" means: there is `x₀` such that the property holds for every real `x ≥ x₀`. The
statement says on what `x₀` may depend.

**Characters.** A Dirichlet character `χ` modulo `q ≥ 1` takes complex values, with `χ(n) = 0` when `gcd(n, q) > 1`;
it may be imprimitive. `χ₀` is the principal character modulo `q`, and `χ̄` the conjugate character (Mathlib's `χ⁻¹`).
The parity of `χ` is the `j ∈ {0, 1}` with `χ(−1) = (−1)^j`. `L(s, χ)` is the L-function continued to `ℂ` (Mathlib
`DirichletCharacter.LFunction`): entire if `χ` is not principal, meromorphic with a single simple pole at `s = 1` if it
is. `Γ_ℝ(s) = π^{−s/2}Γ(s/2)`; the gamma factor of `χ` is `Γ_ℝ(s + j)`. The Gauss sum of `χ` is
`τ(χ) = Σ_{b mod q} χ(b)e^{2πib/q}`.

**Letters.** The letters `q`, `d`, `m` are general here. OneSidedPrimeSumBoundsAndAdmissibleData §0.2 applies 3.5 with
the modulus `q₀` of its parameters, and [ShortProof] applies 2.2 with `m = q₀d` in its proof of
OneSidedPrimeSumBoundsAndAdmissibleData §3.7.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `q, χ, χ₀, χ̄, j` | a modulus; a Dirichlet character modulo `q`, primitive or not; the principal character; the conjugate character; the parity | Conventions |
| `L(s, χ), Γ_ℝ` | the continued L-function; `π^{−s/2}Γ(s/2)` | Conventions |
| `τ(χ)` | the Gauss sum `Σ_{b mod q} χ(b)e^{2πib/q}` | Conventions |
| `Λ, μ, φ` | the von Mangoldt, Möbius and Euler functions | standard |
| `E_χ` | `L(s, χ)`, or the entire continuation of `(s − 1)L(s, χ)` when `χ` is principal | 1.1 |
| `f_χ` | `E_χ(s)`, or `E_χ(s)/s` when `χ` is principal; holomorphic on `Re s > 0` | 1.1 |
| `δ_χ` | `1` if `χ` is principal, `0` otherwise | 1.1 |
| `ξ·(·/d)` | for a character `ξ` modulo `q` and an odd prime `d`, the character `n ↦ ξ(n)(n/d)` modulo `qd` | 1.1 |
| `l` | a logarithmic scale: the regions are `Re s ≥ 1 − l^{−a}` with `s` of modulus at most `e^l`, and the moduli are at most `e^l` | 1.3, 1.4 |
| `(a/b), n°` | the Jacobi symbol (Legendre symbol when `b` is prime); the odd part of an integer `n ≥ 1` | 3.1 |
| `w_j, θ_c, Γ_j` | the weight `x^j e^{−πx²}`; the theta series of a sequence `c`; the Mellin transform of `w_j` | 3.1 |
| `cμ, J_j(c, T)` | the sequence `n ↦ c(n)μ(n)`; the theta tail integral of `c` at `T` | 3.1 |

## Layer 1: L-functions of all Dirichlet characters

The later sections apply their bounds to all characters of a modulus at once, and to moduli that grow with the scale;
most of these characters are imprimitive. So the functions are taken with the pole of the principal character removed,
and every statement of this layer holds for imprimitive characters, with its uniformity in the modulus stated.

### 1.1 L-functions with the pole removed, and quadratic twists

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions split on whether `χ` is principal; for `χ₀` they take Mathlib's entire
continuation of `(s − 1)L(s, χ₀)`. (a) and (b) come from Mathlib: the non-vanishing on `Re s ≥ 1`, the value of the
continuation at `1`, and the Dirichlet series of `−L′/L`, to which the logarithmic derivative of `s − 1` contributes the
term `δ_χ/(s − 1)`. (c) is the local factorisation of an analytic function at a point where it has finite order, which
holds everywhere for `E_χ` because `E_χ` is entire and `E_χ(1) ≠ 0`. (d) evaluates the twist at an integer chosen by the
Chinese remainder theorem to be `1` modulo `q` and a quadratic non-residue modulo `d`; the value there is `−1`.

Let `χ` be a Dirichlet character modulo `q ≥ 1`.

- `E_χ(s) = L(s, χ)` if `χ` is not principal. If `χ = χ₀`, `E_χ` is the entire function equal to `(s − 1)L(s, χ₀)` for
  `s ≠ 1`.
- `f_χ(s) = E_χ(s)` if `χ` is not principal, and `f_χ(s) = E_χ(s)/s` if it is. So `f_χ` is holomorphic on `Re s > 0`,
  and `f_χ(s) = L(s, χ₀)(s − 1)/s` for `s ≠ 1`.
- For a Dirichlet character `ξ` modulo `q` and an odd prime `d`, `ξ·(·/d)` is the Dirichlet character modulo `qd` with
  `(ξ·(·/d))(n) = ξ(n)·(n/d)` for every integer `n`, where `(n/d)` is the Legendre symbol.

These have the following properties.

- (a) `E_χ` is entire and has no zero in `Re s ≥ 1`.
- (b) For `Re s > 1`, `Σ_{n≥1} χ(n)Λ(n)n^{−s} = δ_χ/(s − 1) − E_χ′(s)/E_χ(s)`, where `δ_χ = 1` if `χ` is principal and
  `δ_χ = 0` otherwise.
- (c) For every `s ∈ ℂ`, `(z − s)·E_χ′(z)/E_χ(z)` tends to the order of vanishing of `E_χ` at `s` as `z → s`, `z ≠ s`;
  so `E_χ′/E_χ` has at most simple poles, with these residues.
- (d) If the odd prime `d` does not divide `q`, then `ξ·(·/d)` is not principal for any character `ξ` modulo `q`, and
  `E_{ξ·(·/d)}(s) = L(s, ξ·(·/d))`.

*Needs:* Mathlib `DirichletCharacter.LFunction`, `DirichletCharacter.LFunctionTrivChar₁`,
`DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `legendreSym`.

[ShortProof], `Lib/General/NumberTheory/ImaginaryQuadraticField` (`New.entireL`, `New.quadTwist`);
`Lib/Analytic/PrimeNumberTheorem/LFunctionGrowth` (`New.regularL`, `New.differentiableAt_regularL`);
`Lib/Analytic/EntireLFunction` (`New.quadTwist_apply`, `New.quadTwist_ne_one`, `New.analyticAt_entireL`,
`New.entireL_ne_zero`, `New.LSeriesHasSum_mul_vonMangoldt`, `New.tendsto_sub_mul_logDeriv_entireL_analyticOrderNatAt`)

### 1.2 Reflection of the zeros for every character

*Origin:* adapted from Montgomery and Vaughan, *Multiplicative Number Theory I* (2007), Corollaries 10.3 and 10.8, the
symmetry of the zeros that the functional equation gives: here for every Dirichlet character, primitive or not, at
every point off the line `Re s = 0`, for zeros without their multiplicities, and with the poles of the gamma factor as
the alternative.

*Method of the formal proof:* a reduction to the primitive character `ψ` inducing `χ`, for which Mathlib has the
functional equation of the completed L-function; `ψ̄` is primitive of the same conductor. Inducing does not change the
parity, so `χ` and `ψ` share the gamma factor, and off the line `Re s = 0` none of the deleted Euler factors at the
primes dividing `q` vanishes, since each would need `|p^s| = 1`. So a zero of `L(·, χ)` at `s` is one of `L(·, ψ)`;
away from the poles of `Γ_ℝ(s + j)` it is a zero of the completed function of `ψ`, the functional equation moves it to
a zero at `1 − s` of the completed function of `ψ̄`, and this is a zero of `L(·, ψ̄)` and then of `L(·, χ̄)`.

Let `χ` be a Dirichlet character modulo `q ≥ 1`, primitive or not, of parity `j`, and let `s ∈ ℂ` with `Re s ≠ 0` and
`s ≠ 1`. If `L(s, χ) = 0`, then `s + j ∈ {0, −2, −4, …}` (a pole of the gamma factor `Γ_ℝ(s + j)`) or `L(1 − s, χ̄) = 0`.

RiemannHypothesisStatementsAndConsequences §9.4 has the part with `0 < Re s < 1`: its clause *Reflection* is the
statement for primitive `χ`, with multiplicities, and its clause *Strip forms* records that an imprimitive character
has the zeros of its primitive character in the open strip, from which the statement for every `χ` there follows as in
the method above. It has nothing for `Re s < 0`, and that part is the one used at the negative integers
(IdelicReciprocityCountsAndCyclotomicClassGroups §10.2); so the statement stays a target here.

*Needs:* Mathlib `DirichletCharacter.primitiveCharacter`, `DirichletCharacter.LFunction_changeLevel`,
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `DirichletCharacter.LFunction_eq_completed_div_gammaFactor`.

[ShortProof], `Lib/Analytic/ZeroSymmetry` (`New.gammaFactor_eq_zero_or_LFunction_one_sub_eq_zero`,
`New.prod_euler_factor_ne_zero`)

### 1.3 Growth near the line `Re s = 1`

*Origin:* adapted from Montgomery and Vaughan, *Multiplicative Number Theory I* (2007), Lemma 10.15, which bounds
`L(s, χ)` by a multiple of `log(q|s|)` near the line `Re s = 1`, away from the pole: here for every character, primitive
or not, with the pole removed by the factor `(s − 1)/s`, with the square of the logarithmic scale `l` in place of its
first power, uniformly for moduli `q ≤ e^l`.

*Method of the formal proof:* (a) is partial summation against the partial sums of `χ`, which stay within `2q` of `t`
times the mean value of `χ` over the residue classes (a mean that is `0` unless `χ` is principal); the integral formula
it gives for `f_χ` on `Re s > 1` extends to `Re s > 0` by analytic continuation and bounds `|f_χ|` linearly in `q|s|`
on `Re s ≥ 1/2`. (b) interpolates by the three-lines theorem, on a vertical strip of width `1/3` with `s` at distance
`2/l` from its right edge (so that this edge lies in `Re z ≥ 1 + 1/l`), between (a) on the left edge, of size
`e^{O(l)}`, and the comparison of the Dirichlet series with `ζ(Re z) ≤ 1 + l` on the right edge; the left edge has
weight `O(1/l)` at `s`, which reduces `e^{O(l)}` to a constant, and a linear factor in the denominator keeps the
function bounded on the strip. (c) follows from (b) by Cauchy's estimate on circles of radius `1/(2l)`.

Let `χ` be a Dirichlet character modulo `q ≥ 1`, primitive or not.

- (a) `|f_χ(s)| ≤ 1 + 4q|s|` for every `s` with `Re s ≥ 1/2`.
- (b) If `l ≥ 10¹⁰` and `q ≤ e^l`, then `|f_χ(s)| ≤ l²` for every `s` with `Re s ≥ 1 − 1/l` and `|s| ≤ 3e^l`.
- (c) If `l ≥ 10¹⁰` and `q ≤ e^l`, then `|f_χ′(s)| ≤ 2l³` for every `s` with `Re s ≥ 1 − 1/(2l)` and `|s| ≤ 2e^l`.

Any fixed powers of `l` in place of `l²` and `2l³` serve 1.4, provided they hold uniformly for all characters of
modulus at most `e^l`. For `χ ≠ χ₀` the pinned Tau Ceti has
`DirichletCharacter.norm_LFunction_le_level_mul_norm_div_re`, `|L(s, χ)| ≤ q|s|/Re s` for `Re s > 0`, which gives (a)
for these characters. On Tau Ceti's main branch, later than the revision pinned here:
`DirichletCharacter.norm_LFunction_le`, `|L(s, χ)| ≤ q(|s − 1|^{−1} + 1 + |s|/Re s)` for `Re s > 0` and every `χ`
(`s ≠ 1` if `χ` is principal); for the principal character, multiplication by `(s − 1)/s` turns it into a bound of the
shape of (a) on `Re s ≥ 1/2`, with other constants. ExplicitZetaBounds §3.2 (Rademacher's convexity bound) gives a
bound of the order of `l` in the range of (b) for primitive characters; for imprimitive characters it needs in addition
a bound for the deleted Euler factors `∏_{p∣q}(1 + p^{−σ})` by a fixed power of `l`, for `q ≤ e^l` and `σ ≥ 1 − 1/l`.

*Needs:* 1.1; Mathlib `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` (the three-lines
theorem), `Complex.norm_deriv_le_of_forall_mem_sphere_norm_le` (Cauchy's estimate).

[ShortProof], `Lib/Analytic/PrimeNumberTheorem/LFunctionGrowth` (`New.norm_regularL_le_linear`,
`New.norm_regularL_le_sq`, `New.norm_deriv_regularL_le`)

### 1.4 A zero-free region with a bound for the logarithmic derivative

*Origin:* adapted from Montgomery and Vaughan, *Multiplicative Number Theory I* (2007), chapter 11, the classical
zero-free region of Dirichlet L-functions: here the crude region `Re s ≥ 1 − l^{−25}`, `|s| ≤ e^l`, that the inequality
`|L(σ, χ₀)³L(σ + it, χ)⁴L(σ + 2it, χ²)| ≥ 1` for `σ > 1` gives directly, with a bound for `E_χ′/E_χ` on it, for every
character, uniformly in the modulus once real characters are bounded below near `1`, and for one character at a time
otherwise.

*Method of the formal proof:* a lower bound for `|f_χ|` just to the right of `Re s = 1`, transported to the left by the
derivative bound, without a Hadamard product and without an exceptional zero. On `Re s ≥ 1 + η`, `0 < η ≤ 1`, the
inequality above, with `|L(Re s, χ₀)| ≤ 2/η`, with `|L(s, χ)| ≤ 2l|f_χ(s)|` and with 1.3 (b) applied to `χ²`, gives
`η³ ≤ 256l⁷|f_χ(s)|⁴` unless `χ²` is principal and `s` is within `1/l` of `1`, where the hypothesis of (b) gives
`|f_χ(s)| ≥ 1/l` instead. Taking `η = l^{−25}` gives `|f_χ| ≥ 12l^{−22}` on `Re s ≥ 1 + l^{−25}`; 1.3 (c) changes `f_χ`
by at most `4l^{−22}` over a horizontal step of `2l^{−25}`, so `|f_χ| ≥ 8l^{−22}` on the whole region, and 1.3 (c)
divided by this bounds `f_χ′/f_χ`; the factor `s` that separates `f_χ` from `E_χ` for `χ₀` adds at most `2`. For one
fixed `χ`, (a) is `f_χ(1) ≠ 0` and continuity, and (c) is (b) at every `l` large enough for `q ≤ e^l` and for the
radius `1/l` in (a).

Let `χ` be a Dirichlet character modulo `q ≥ 1`, primitive or not.

- (a) `f_χ(1) ≠ 0`. Hence there is `r₀ > 0` such that `|f_χ(z)| ≥ r` for every `r` with `0 < r < r₀` and every `z` with
  `|z − 1| ≤ r`.
- (b) Uniform form. Let `l ≥ 10¹⁰` and `q ≤ e^l`; if `χ²` is principal, suppose also that `|f_χ(z)| ≥ 1/l` for every
  `z` with `|z − 1| ≤ 1/l`. Then for every `s` with `Re s ≥ 1 − l^{−25}` and `|s| ≤ e^l`: `E_χ(s) ≠ 0` and
  `|E_χ′(s)/E_χ(s)| ≤ 2l^{25}`.
- (c) For all large `l`, depending on `χ`, the conclusion of (b) holds.

Any fixed exponent in place of `25` serves 2.1 and 2.2. The non-vanishing in (c) also follows from ZerosOfLFunctions
§6.4 (the region `Re s > 1 − c/log(q(|Im s| + 3))` for every Dirichlet character modulo `q`, with at most one real
exceptional zero) and `L(1, χ) ≠ 0`; the bound for the logarithmic derivative does not.

*Needs:* 1.1, 1.3; Mathlib `DirichletCharacter.norm_LSeries_product_ge_one`.

[ShortProof], `Lib/Analytic/PrimeNumberTheorem/ZeroFreeRegion` (`New.eventually_le_norm_regularL`,
`New.norm_logDeriv_entireL_le`, `New.eventually_norm_logDeriv_entireL_le`; steps `New.pow_three_le_mul_norm_regularL_pow`,
`New.div_pow_le_norm_regularL`, `New.norm_logDeriv_regularL_le`)

## Layer 2: from zero-free regions to primes

Both sections read primes off the holomorphy of a transform slightly to the left of `Re s = 1` through one Taylor
coefficient or one Cauchy estimate, without a contour integral over a long vertical segment. 2.1 is abstract; 2.2
applies the same idea to the Dirichlet series of `Λ` on the class of `1` modulo `m^k`, where restricting to powers of
one modulus keeps the real characters those of a fixed modulus.

### 2.1 A Tauberian theorem with a rate

*Origin:* adapted from Montgomery and Vaughan, *Multiplicative Number Theory I* (2007), Section 6.2, which derives the
prime number theorem with an error term from a zero-free region by a contour integral: here an abstract Tauberian
theorem for a function that is Lipschitz on `[0, ∞)`, whose Laplace transform continues with polylogarithmic growth to
the regions `Re s ≥ 1 − l^{−A}`, `|s| ≤ e^l`, with decay faster than every power as its conclusion and one Taylor
coefficient in place of the contour integral. No L-function occurs.

*Method of the formal proof:* for large `u` the proof takes `k = ⌊u^{2B+4}⌋` and `H = (k + 1)/u`, so that `H > 1` and
`H ≤ 2u^{2B+4}`, and writes `|R(u)| ≤ |c| + |c − R(u)|` with `c = (−H)^k H g^{(k)}(1 + H)/k!`, where
`g(s) = (F(s) − F(1))/(s − 1)`; both terms are `O(u^{−B−1})`. By the hypothesis on the transform, `c` is an average of
`R` over `(0, ∞)` against the Gamma distribution with density proportional to `v^k e^{−Hv}`, of mean `u` and variance
`u²/(k + 1)`, so the Lipschitz condition gives `|c − R(u)| = O(L·u^{−B−1})`. For `|c|`, let `l = (2B + 5)log u` and
`η = l^{−A}`. On the closed disc `|s − 1 − H| ≤ H + η` one has `Re s ≥ 1 − η` and, for large `u`, `|s| ≤ e^l`, so `F`
is holomorphic there with `|F| ≤ l^A`; where `|s − 1 − H| = H + η`, also `|s − 1| ≥ η`, so `|g(s)| ≤ 2l^A/η`. Cauchy's
estimate for `g^{(k)}` on that circle then gives `|c| ≤ 4l^{2A}H(1 + η/H)^{−k−1}`, and
`(1 + η/H)^{−k−1} ≤ e^{−u/(2l^A)} ≤ e^{−√u/2}` for large `u`, so this bound is `O(u^{−B−1})` too.

Let `R : ℝ → ℝ` be measurable, and let `L` be real with `|R(v) − R(u)| ≤ L(v − u)` whenever `0 ≤ u ≤ v ≤ u + 1`. Let
`F : ℂ → ℂ` satisfy

`(F(s) − F(1))/(s − 1) = ∫_0^∞ R(v)e^{(1−s)v} dv`   for every `s` with `Re s > 2`

(the integral converges absolutely, as `|R(v)| ≤ |R(0)| + Lv` for `v ≥ 0`). Suppose that for some natural number `A`
and all large `l`, `F` is complex differentiable at every `s` with `Re s ≥ 1 − l^{−A}` and `|s| ≤ e^l`, and
`|F(s)| ≤ l^A` there. Then for every natural number `B`, `|R(u)| ≤ u^{−B}` for all large `u`.

The library's Tauberian theorems of Newman and of Wiener–Ikehara (`TauCeti.LSeries.newmanLaplace_tendsto_integral`,
`TauCeti.LSeries.wienerIkehara_of_eventually_nonneg`) give limits without a rate and do not serve here; the prime number
theorem for the remainders `R_q` of OneSidedPrimeSumBoundsAndAdmissibleData §0.1, which [ShortProof] draws from 2.1 and
1.4 (c), also follows from AnalyticNumberTheoryPartI §0.32 by orthogonality and partial summation.

*Needs:* Mathlib `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Cauchy's estimates for iterated
derivatives), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (differentiation under the integral sign),
`Real.integral_rpow_mul_exp_neg_mul_Ioi` with `Real.Gamma_nat_eq_factorial` (`∫_0^∞ v^k e^{−Hv} dv = k!/H^{k+1}`).

[ShortProof], `Lib/Analytic/PrimeNumberTheorem/Tauberian` (`New.eventually_abs_le_inv_pow_of_transform`; steps
`New.norm_taylorCoeff_transform_sub_le_of_lipschitz`, `New.norm_taylorCoeff_dslope_le_inv_pow`)

### 2.2 Primes `≡ 1` modulo powers of a fixed modulus in logarithmic windows

*Origin:* adapted from the theory of primes in arithmetic progressions to moduli at most a power of the logarithm, the
range of the Siegel–Walfisz theorem (Montgomery and Vaughan, *Multiplicative Number Theory I* (2007), Corollary 11.19):
here one prime `p ≡ 1 (mod m^k)`, for the powers of one fixed `m` divisible by `4`, with `log p` in a window
`[U, U + W]`, uniformly for `m^k ≤ W^A` and `W ≤ U ≤ W^A`; there is no count, and no exceptional zero has to be
controlled.

*Method of the formal proof:* (a): for `4 ∣ m`, every unit `u` modulo `m^k` with `u ≡ 1 (mod m²)` is `(1 + 2c)²` for a
root `c` of `c² + c = (u − 1)/4`; the right side is divisible by `m`, hence nilpotent modulo `m^k`, and Newton's method
from `c = 0` finds the root. So a character whose square is principal is trivial on these units. (b): such a character
`χ` comes from a character `χ₁` modulo `m²` with `f_χ = f_{χ₁}`, as `m^k` and `m²` have the same prime factors; 1.4 (a)
for the finitely many characters modulo `m²` supplies the hypothesis of 1.4 (b) near `1`, and 1.4 (b) at
`l = (A + 1)log X` gives (b). (c): put `X = √W` and `n = m^k`. By orthogonality and 1.1 (b), the Dirichlet series of `Λ`
on the class of `1` modulo `n` at `1 + z` is expressed through the `E_χ′/E_χ(1 + z)` of the characters modulo `n`, and
(b), with `2A` for `A`, controls it on the disc `|z| ≤ 1/X`. If no prime `p ≡ 1 (mod n)` had `log p` in the window, `z`
times the part of that series beyond `e^U`, divided by a Gaussian factor in `z`, would be at most `3U` on the circle
`|z| = 1/X`, since the terms in the window would come only from prime powers that are not primes, whose series converges
absolutely at `3/4` (`ψ − θ = O(√x)`); at `z = 0` it equals `e^{X/4−2}/φ(n)`, larger than `3U` once `X` is large, as
`n, U ≤ X^{2A}`. The maximum principle excludes this.

Let `m ≥ 1` with `4 ∣ m`.

- (a) For every `k ≥ 2`, every Dirichlet character `χ` modulo `m^k` with `χ²` principal is induced from a character
  modulo `m²`.
- (b) Let `A` be a natural number. For all large `X` (depending on `m` and `A`): for every `k ≥ 2` with `m^k ≤ X^A`,
  every Dirichlet character `χ` modulo `m^k` and every `s` with `|s − 1| ≤ 1/X`, one has `E_χ(s) ≠ 0` and
  `|E_χ′(s)/E_χ(s)| ≤ X`.
- (c) Let `A` be a natural number. For all large real `W` (depending on `m` and `A`): for every integer `k ≥ 2` with
  `m^k ≤ W^A` and every real `U` with `W ≤ U ≤ W^A`, there is a prime `p ≡ 1 (mod m^k)` with `U ≤ log p ≤ U + W`.

The library's prime number theorem in progressions
(`NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`) is for one fixed modulus and does not
give the uniformity in `k`. AnalyticNumberTheoryPartI §0.32 (the Siegel–Walfisz theorem, in an effective form resting
on the exclusion of Landau–Siegel zeros) also implies (c), since `m^k ≤ W^A ≤ U^A ≤ (log p)^A` for the primes `p`
concerned; so does RieszSumsOverPrimesAndExceptionalZeros §1.7b (iii) (Linnik's theorem with its lower bound
`π(x; a, q) ≥ c′x/(q^{7/4} log x)` for `x ≥ q^L`, with `c′` and `L` absolute, where `π(x; a, q)` counts the primes
`p ≤ x` with `p ≡ a (mod q)`; it is applied with `q = m^k`, `a = 1` at `x = e^{U+W}` and compared with the trivial bound
`π(e^U; 1, m^k) ≤ e^U`).

*Needs:* 1.1, 1.4; Mathlib `ArithmeticFunction.vonMangoldt.residueClass`, `Chebyshev.isBigO_psi_sub_theta_sqrt`.

[ShortProof], `Lib/Analytic/Primes` (`New.factorsThrough_sq_of_sq_eq_one`,
`New.eventually_norm_logDeriv_entireL_le_near_one`, `New.exists_prime_modEq_one_log_mem`; steps
`New.exists_regularL_eq_of_sq_eq_one`, `New.hasSum_residueClass_one`, `New.norm_sub_mul_sum_term_le`)

## Layer 3: quadratic twists without zeros in a box

The layer works with a modulus `q` and a class `a` modulo `q` all of whose primes `d` satisfy `d ≡ 7 (mod 8)` and
`gcd(d, q) = 1`. For these `d`, quadratic reciprocity rewrites the coefficient `ξ(n)(n/d)` of a twist as `ξ(n)(−d/n°)`,
so that `d` enters through the numerator of a Jacobi symbol and can be averaged over. 3.3 shows that a zero of a twist
in a box to the right of `1/2` makes a tail integral of theta series large; 3.4 shows that these integrals are small on
average over all numerators `v ≤ T²`; 3.5 combines the two into a count of the bad `d`. At scale `u ≥ 1/T` the weight
`w_j(nu)` limits the theta series to `n` of order at most `T`, so the character sums that occur are short enough for the
Pólya–Vinogradov inequality, and no large sieve for real characters is used.

### 3.1 Theta series and the tail integral

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions below, with the sums over `n ≥ 1`.

- For `j ∈ {0, 1}` and real `x`, `w_j(x) = x^j e^{−πx²}`.
- For `c : ℕ → ℂ` with `|c(n)| ≤ 1` for all `n`, the theta series of `c` of parity `j` is
  `θ_c(u) = u^{1/2} Σ_{n≥1} c(n)w_j(nu)` for `u > 0`; the series converges absolutely, and
  `|θ_c(u)| ≤ 3u^{−1/2}e^{−u}`. For a Dirichlet character `χ`, `θ_χ` is the theta series of `n ↦ χ(n)`, of the parity
  of `χ` unless another parity is named.
- `Γ_j(s) = ∫_0^∞ w_j(x)x^{s−1} dx` for `Re s > 0`.
- `cμ` is the sequence `n ↦ c(n)μ(n)`; for `T > 0`, `J_j(c, T) = ∫_{1/T}^∞ (|θ_c(u)| + |θ_{cμ}(u)|) du/u`, both theta
  series of parity `j`.
- For an integer `n ≥ 1`, `n°` is its odd part, `n` divided by the largest power of `2` dividing it; `(a/b)` is the
  Jacobi symbol, for an integer `a` and an odd `b ≥ 1`.

*Needs:* Mathlib `jacobiSym`, `ArithmeticFunction.moebius`, `mellin`.

[ShortProof], `Lib/Analytic/DirichletTheta` (`New.gaussianMonomial`, `New.gaussianTheta`, `New.thetaSeries`,
`New.gaussianMellin`, `New.summable_and_norm_gaussianTheta_le`, `New.norm_thetaSeries_le`);
`Lib/Analytic/QuadraticTwist` (`New.thetaTailIntegral`)

### 3.2 The theta series of a character: transformation in absolute value and Mellin transform

*Origin:* adapted from Davenport, *Multiplicative Number Theory*, and Montgomery and Vaughan, *Multiplicative Number
Theory I* (2007), chapter 10, on the theta series of a Dirichlet character (Poisson summation, the transformation
formula and the representation of `L(s, χ)` as a Mellin transform): here the transformation formula in absolute value
only, so that only `|τ(χ)| = √q` and no root number enters; the Mellin representation on all of `Re s > 0` with
absolute convergence, for imprimitive characters too; and the folding identity it gives.

*Method of the formal proof:* everything rests on one consequence of Poisson summation. Mathlib's functional equations
for the even and odd theta kernels of a residue class, applied class by class modulo `q` and combined with the weights
`χ(b)`, compare `Σ_{n≥1}χ(n)w_j(nt)` with the sum at `1/(qt)` whose coefficients are the finite Fourier transform
`χ̂(n) = q^{−1}Σ_{b mod q} χ(b)e^{2πibn/q}`; in absolute value, `t·|Σ_{n≥1}χ(n)w_j(nt)| = |Σ_{n≥1}χ̂(n)w_j(n/(qt))|` for
`χ ≠ χ₀` of parity `j` and `t > 0`. For primitive `χ`, `χ̂` is `τ(χ)/q` times `χ̄`, and `|τ(χ)| = √q` turns the identity
into (a). For any `χ ≠ χ₀`, the bound `|χ̂| ≤ 1` turns it, for `t ≤ 1`, into `|Σ_{n≥1}χ(n)w_j(nt)| ≤ 3e·q·e^{−t}`,
which the bound of 3.1 gives for `t ≥ 1`; this makes the integral in (b) absolutely convergent and holomorphic on
`Re s > 0`, and (b) then follows from (d) by analytic continuation. (d) is integration term by term on `Re s > 1`; (c)
splits the integral at `q^{−1/2}`, the fixed point of `u ↦ 1/(qu)`, and maps one half onto the other with (a); (e) is a
change of variable in the integral defining `Γ_j`.

Let `j ∈ {0, 1}`.

- (a) Let `χ ≠ χ₀` be a primitive Dirichlet character modulo `q` of parity `j`. Then `|θ_χ(1/(qt))| = |θ_χ(t)|` for
  every `t > 0`.
- (b) Let `χ ≠ χ₀` be a Dirichlet character modulo `q ≥ 1` of parity `j`, primitive or not. For every `s` with
  `Re s > 0`, the integral `∫_0^∞ θ_χ(u)u^{s−1/2} du/u` converges absolutely and equals `Γ_j(s)L(s, χ)`.
- (c) For `χ` as in (a), `∫_0^∞ |θ_χ(u)| du/u = 2∫_{q^{−1/2}}^∞ |θ_χ(u)| du/u`.
- (d) For every `c : ℕ → ℂ` with `|c(n)| ≤ 1` and every `s` with `Re s > 1`, the theta series of `c` of parity `j`
  satisfies `∫_0^∞ θ_c(u)u^{s−1/2} du/u = Γ_j(s)Σ_{n≥1}c(n)n^{−s}`. In particular, for every Dirichlet character `χ`,
  the theta series of `χμ` of parity `j` has the transform `Γ_j(s)/L(s, χ)` on `Re s > 1`.
- (e) `Γ_j(s) = Γ_ℝ(s + j)/2` for `Re s > 0`; so `Γ_j` is holomorphic and without zeros on `Re s > 0`, and bounded on
  `1/2 ≤ Re s ≤ 2`.

HalfIntegralWeightModularForms §4.1 has the Fricke identity, with the Gauss sum, for primitive even characters, and
LFunctions §§5.4, 6.8 the Mellin representation on `Re s > 1`; they do not give (a) for odd characters or (b) on
`0 < Re s ≤ 1`.

*Needs:* 3.1; Mathlib `HurwitzZeta.evenKernel_functional_equation`, `HurwitzZeta.oddKernel_functional_equation`,
`hasSum_mellin_pi_mul_sq`, `DirichletCharacter.norm_gaussSum_stdAddChar`.

[ShortProof], `Lib/Analytic/DirichletTheta` (`New.norm_thetaSeries_inv`, `New.hasMellin_thetaSeries_char`,
`New.integral_norm_thetaSeries_div`, `New.mellin_thetaSeries`, `New.mellin_thetaSeries_moebius`, `New.gaussianMellin_eq`,
`New.gaussianMellin_differentiableOn_and_bdd`, `New.exists_pos_le_norm_gaussianMellin`; steps
`New.gaussianTheta_poisson_summation`, `New.norm_gaussianTheta_char_le`)

### 3.3 A zero in a box makes the theta tail large

*Origin:* particular to this proof: zero detection by a mollifier built from theta series; a zero of `L(s, χ)` with
`Re s ≥ 1/2 + 9δ` in a box of fixed height forces the tail integral `J_j(χ, T)` above `T^{2δ}`, for every primitive
`χ` of conductor at most `T²`.

*Method of the formal proof:* the three-lines theorem applied to a mollified product. The mollifier `𝓜` is the integral
of 3.2 (d) for `Γ_j(s)/L(s, χ)` with the range `u ≤ 1/T` left out, `𝓜(s) = ∫_{1/T}^∞ θ_{χμ}(u)u^{s−1/2} du/u`; it is
holomorphic on `Re s > 0` and bounded on `1/2 ≤ Re s ≤ 2`. The function `Γ_j·L(·, χ)·𝓜 − Γ_j²` takes the value
`−Γ_j(s)²` at a zero `s` of `L(·, χ)`. On the line `Re z = 2` it is `O(1/T)`, by 3.2 (d) and the bound of 3.1 on the
omitted range. On the line `Re z = 1/2`, where `|u^{z−1/2}| = 1`, both `|𝓜|` and, by 3.2 (b), (c) and `q^{−1/2} ≥ 1/T`,
`|Γ_j L(·, χ)|/2` are at most `J_j(χ, T)`, so the function is `O(T^{4δ})` when `J_j(χ, T) ≤ T^{2δ}`. As
`Re s ≥ 1/2 + 9δ` gives the line `Re z = 2` a weight of at least `6δ` at `s`, the three-lines theorem on
`1/2 ≤ Re z ≤ 2` then yields (a). (b) follows from (a), since `|Γ_j|` is bounded below by a positive constant on the
compact box `1/2 ≤ Re s ≤ 1`, `|Im s| ≤ H` (3.2 (e)), and `L(·, χ)` has no zero with `Re s > 1`.

Let `j ∈ {0, 1}`. In (a) and (b), `χ ≠ χ₀` runs over the primitive Dirichlet characters of parity `j` modulo `q ≥ 1`,
and `J_j(χ, T)` is the tail integral of `n ↦ χ(n)`.

- (a) There is `C`, depending only on `j`, with the following property. Let `δ > 0`, `T > 0`, `q ≤ T²`, and
  `J_j(χ, T) ≤ T^{2δ}`. Then every `s` with `L(s, χ) = 0` and `1/2 + 9δ ≤ Re s ≤ 1` satisfies
  `|Γ_j(s)|² ≤ C T^{−2δ}`.
- (b) Let `δ > 0` and let `H` be real. For all large `T` (depending on `j`, `δ` and `H`): for every `q ≤ T²` and every
  `χ` modulo `q` as above, if `L(s, χ) = 0` for some `s` with `Re s ≥ 1/2 + 9δ` and `|Im s| ≤ H`, then
  `J_j(χ, T) > T^{2δ}`.

*Needs:* 3.1, 3.2; Mathlib `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'` (the three-lines
theorem).

[ShortProof], `Lib/Analytic/QuadraticTwist` (`New.three_lines_bound_of_LFunction_eq_zero`,
`New.eventually_rpow_lt_thetaTailIntegral`; `New.mollifier`, `New.norm_mul_mollifier_sub_le`,
`New.norm_gaussianMellin_mul_LFunction_le`)

### 3.4 A mean square of theta series twisted by Jacobi symbols

*Origin:* adapted from the theory of mean values of real character sums, of Jutila, *On mean values of Dirichlet
polynomials with real characters* (1975), and Heath-Brown, *A mean value estimate for real character sums* (1995): here
a mean square, over the numerators `1 ≤ v ≤ T²`, of theta series whose coefficients are twisted by the Jacobi symbols
`(−v/n°)`, at every scale `u ≥ 1/T`, with the off-diagonal terms bounded by the Pólya–Vinogradov inequality.

*Method of the formal proof:* (a) multiplying out `|θ_{α_v}(u)|²` and summing over `v` first leaves, for each pair
`(n, n′)`, `α(n)·conj α(n′)` times the weight `u·w_j(nu)w_j(n′u)` times the character sum `Σ_{1≤v≤T²}(−v/(nn′)°)`, by
multiplicativity of the Jacobi symbol in its denominator. When `(nn′)°` is a perfect square, so that `nn′` is a square
or twice one, the character sum is at most `T²` and the weights of all such pairs add up to `O(u^{−2δ})`. Otherwise
`(nn′)°` is odd and not a square, `v ↦ (v/(nn′)°)` is a nonprincipal character modulo `(nn′)°`, and
ExplicitCharacterSumsAndSieves §3.2 bounds the character sum by `2√(nn′)(1 + log nn′)`; the decay of `w_j` together with
`u ≥ 1/T` again gives a total of `O(T²u^{−2δ})`. (b) applies (a) to `α` and to `αμ`, the Cauchy–Schwarz inequality over
`v`, and integration over `u > 1/T`.

Let `j ∈ {0, 1}` and `δ > 0`. There is `C`, depending only on `j` and `δ`, with the following property. Let `T > 0`,
and let `α : ℕ → ℂ` with `|α(n)| ≤ 1` for every `n`. For each integer `v ≥ 1` let `α_v(n) = α(n)·(−v/n°)` for `n ≥ 1`,
and take all theta series of parity `j`.

- (a) `Σ_{1≤v≤T²} |θ_{α_v}(u)|² ≤ C T² u^{−2δ}` for every `u ≥ 1/T`.
- (b) `Σ_{1≤v≤T²} J_j(α_v, T) ≤ C T^{2+δ}`.

*Needs:* 3.1; ExplicitCharacterSumsAndSieves §3.2 (Pólya–Vinogradov for every nonprincipal character); Mathlib
`jacobiSym`.

[ShortProof], `Lib/Analytic/QuadraticTwist` (`New.sum_sq_thetaSeries_jacobiSym_le`, `New.sum_thetaTailIntegral_le`;
steps `New.dirichletCharacter_jacobiSym_ne_one`, `New.norm_sum_jacobiSym_le`,
`New.exists_summable_mul_norm_sum_jacobiSym_le`); `Lib/Analytic/PolyaVinogradov` (`New.polya_vinogradov`)

### 3.5 Zero density for quadratic twists over the primes of a class, and the choice of `d`

*Origin:* adapted from the zero-density estimates for quadratic twists obtained from mean values over real characters,
of Jutila, *On mean values of Dirichlet polynomials with real characters* (1975), and Heath-Brown, *A mean value
estimate for real character sums* (1995): here, through a mean square of theta series twisted by Jacobi symbols and
bounded with the Pólya–Vinogradov inequality (3.4), a weak density count for the quadratic twists `ξ·(·/d)` of the
characters `ξ` of one modulus, over the primes `d ≡ 7 (mod 8)` of one class, in the box `Re s ≥ 1/2 + 9δ`, `|Im s| ≤ H`,
and from it the choice of one prime `d` whose twists have no zero in `Re s ≥ β`, `|Im s| ≤ H`, for a given `β > 1/2`.

*Method of the formal proof:* (a) combines 3.3 (b) and 3.4 (b) for one primitive `ψ` at a time. As `d ≡ 7 (mod 8)`,
`2` is a square modulo `d` and `d ≡ 3 (mod 4)`; so for `n ≥ 1` the powers of `2` drop out of `(n/d)`, and the
reciprocity law for Jacobi symbols turns `(n°/d)` into `(−d/n°)`. Hence, if `ψ` is primitive modulo `q′` and `d ∤ q′`,
the coefficients of `ψ·(·/d)` are the `α_d(n)` of 3.4 with `α = ψ`. This twist is primitive of conductor `q′d`
(ClassicalArithmeticCompletion §§1.5–1.6), and its parity is opposite to that of `ψ` because `(−1/d) = −1`, so one
parity `j` serves every `d`. By 3.3 (b) every `d` with `q′d ≤ T²` whose twist vanishes in the box contributes more than
`T^{2δ}` to the sum of 3.4 (b), which is `O(T^{2+δ})`; with `T² = qX` this leaves `O(X^{1−δ/2})` such `d ≤ X`. For a
character `ξ` modulo `q` induced by the primitive `ψ` modulo `q′ ∣ q`, the twist `ξ·(·/d)` is induced by `ψ·(·/d)`,
and Mathlib's `DirichletCharacter.LFunction_changeLevel` writes `L(s, ξ·(·/d))` as `L(s, ψ·(·/d))` times deleted
Euler factors, which have no zero on `Re s > 0`; there are finitely many `ξ`. (b): it suffices to treat
`1/2 < β < 1`, and then `β = 1/2 + 9δ` with `δ > 0`. By (a) and partial summation, the series `Σ (log d)/d` over the
`d` bad for `(β, H)` converges, whereas `Σ (log p)/p` over all primes `p ≡ a (mod q)` diverges for invertible `a`
(Mathlib's `ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div`); hence not every prime `d ≡ a (mod q)`
is bad for `(β, H)`.

Let `q ≥ 1`, and let `a` be a class modulo `q` such that every prime `d ≡ a (mod q)` satisfies `d ≡ 7 (mod 8)` and
`gcd(d, q) = 1` (for instance `8 ∣ q` and `a ≡ 7 (mod 8)` prime to `q`). For real `β` and `H`, call a prime
`d ≡ a (mod q)` *bad for `(β, H)`* if for some Dirichlet character `ξ` modulo `q` the function `L(s, ξ·(·/d))` has a
zero `s` with `Re s ≥ β` and `|Im s| ≤ H`.

- (a) For every `δ > 0` and real `H`, the number of primes `d ≤ X` that are bad for `(1/2 + 9δ, H)` is `O(X^{1−δ/2})`
  as `X → ∞`, the constant depending on `q`, `a`, `δ` and `H`.
- (b) If moreover `a` is invertible modulo `q`, then for every `β > 1/2` and real `H` there is a prime `d ≡ a (mod q)`
  that is not bad for `(β, H)`: no `L(s, ξ·(·/d))`, `ξ` modulo `q`, vanishes at a point with `Re s ≥ β` and
  `|Im s| ≤ H`. These twists are not principal (1.1 (d)), so `E_{ξ·(·/d)} = L(·, ξ·(·/d))`.

No existing section gives (b) for `β` near `1/2`, which is the range OneSidedPrimeSumBoundsAndAdmissibleData §0.2 uses
(every `β > 1/2`). AnalyticNumberTheoryPartI §1.7 bounds the number of zeros with `Re ρ ≥ σ`, `|Im ρ| ≤ T` of all
primitive characters of conductor at most `Q` by `C_ε(Q^{5+ε}T^{3+ε})^{1−σ}`, for `1/2 ≤ σ ≤ 1`. Applied to the primitive
characters `ψ·(·/d)` of the method above, of conductor at most `qX`, it bounds the number of bad primes `d ≤ X` by
`O(X^{(5+ε)(1−β)})`; this is `O(X^{1−η})` for some `η > 0`, as the argument for (b) needs, exactly when `β > 4/5`. So
this count gives (b) for `β > 4/5` only. QuadraticTwistSelectionOverPrimes §2.7c selects primes whose twists have a
zero-free box `Re s > 1 − δ₀` with `δ₀ < 1/12`, under hypotheses on the scales `Y`, `U`, `F`; it does not give (b) for
`β ≤ 11/12` either.

*Needs:* 1.1, 3.3, 3.4; ClassicalArithmeticCompletion §§1.5–1.6 (primitive Legendre characters, coprime products);
Mathlib `jacobiSym.quadratic_reciprocity`, `DirichletCharacter.LFunction_changeLevel`,
`ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div`.

[ShortProof], `Lib/Analytic/QuadraticTwist` (`New.zero_density_quadTwist`, `New.exists_entireL_quadTwist_ne_zero`;
steps `New.legendreSym_eq_jacobiSym_ordCompl`, `New.isPrimitive_quadTwist`, `New.exists_card_zero_quadTwist_le`,
`New.IsBadPrime`)

## Downstream consumers

These sections cite this roadmap:

- OneSidedPrimeSumBoundsAndAdmissibleData §0.2 (the one-sided criterion for a zero-free half-plane): 3.5 (b), for the
  prime `d` of a class whose twists have no zero in the box below a given zero.
- IdelicReciprocityCountsAndCyclotomicClassGroups §10.2 (b) (the trivial zeros, for Voronoi-type congruences): 1.2 at
  the negative integers, for the trivial zeros of imprimitive characters.

[ShortProof] uses three more results of this roadmap in proofs of sections that cite existing roadmap sections, Mathlib
or the library for them: 1.1 (b)–(d) in OneSidedPrimeSumBoundsAndAdmissibleData §0.2, for the transform of the remainder
of the prime sum and its residues; 1.2 in the open strip in OneSidedPrimeSumBoundsAndAdmissibleData §6.4 (b), the strip
form on the critical line; and 1.1 (d), for the twist by `(·/d)` of the character modulo `1`, in
ThetaFunctionsAndUnitsOfCMLattices §5.4.

## What the library already provides

- Non-vanishing of `L(s, χ)` on `Re s ≥ 1` for every character: Mathlib `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.
- The inequality `|L(σ, χ₀)³L(σ + it, χ)⁴L(σ + 2it, χ²)| ≥ 1` for `σ > 1`: Mathlib
  `DirichletCharacter.norm_LSeries_product_ge_one` and its L-function form `DirichletCharacter.norm_LFunction_product_ge_one`.
- The functional equation of a primitive character: Mathlib `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.
- For primitive `χ` and `Re s ≤ 0`, the zeros of `L(s, χ)` are the poles of the gamma factor (`s = 0` at modulus `1`
  excepted): Mathlib `DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`.
- `L(s, χ)` of an induced character as the primitive one times the deleted Euler factors: Mathlib
  `DirichletCharacter.LFunction_changeLevel`.
- `|τ(χ)| = √q` for a primitive character modulo `q`: Mathlib `DirichletCharacter.norm_gaussSum_stdAddChar`; Tau Ceti
  `DirichletCharacter.IsPrimitive.norm_gaussSum`.
- A bound for `L(s, χ)` linear in the modulus and the height on `Re s > 0`, for `χ ≠ χ₀`: Tau Ceti
  `DirichletCharacter.norm_LFunction_le_level_mul_norm_div_re`.
- Landau's theorem for Dirichlet series with nonnegative coefficients: Tau Ceti `TauCeti.LSeries.landau`.
- The theta kernels of one residue class and their inversion formulas, and the Mellin transform of a sum of Gaussians:
  Mathlib `HurwitzZeta.evenKernel_functional_equation`, `HurwitzZeta.oddKernel_functional_equation`,
  `hasSum_mellin_pi_mul_sq`.
- The divergence of `Σ_{p≡a (mod q)} (log p)/p` for an invertible class `a`: Mathlib
  `ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div`.

On Tau Ceti's main branch, later than the revision pinned here:

- The non-vanishing of the deleted Euler factors on `Re s > 0`:
  `DirichletCharacter.prod_one_sub_mul_prime_cpow_ne_zero`.
- The Pólya–Vinogradov inequality `√q(1 + log q)` for primitive `χ ≠ χ₀` on every interval:
  `DirichletCharacter.norm_sum_range_add_le`.
- The bound `|L(s, χ)| ≤ q(|s − 1|^{−1} + 1 + |s|/Re s)` on `Re s > 0`, for every `χ` (`s ≠ 1` if `χ` is principal):
  `DirichletCharacter.norm_LFunction_le`.

## Results taken from other roadmaps

- The Pólya–Vinogradov inequality for every nonprincipal character, in particular
  `|Σ_{1≤v≤X} χ(v)| ≤ 2√q(1 + log q)` for `χ ≠ χ₀` modulo `q`: ExplicitCharacterSumsAndSieves §3.2 (used in 3.4). The
  bound in this form also follows from the reduction to the primitive character, ExplicitCharacterSumsAndSieves §0.6,
  with the bound `√q*(1 + log q*)` for a primitive character of conductor `q*` and `2^{ω(r)} ≤ 2√r`, where `r` is the
  product of the primes that divide `q` but not `q*`, and `ω(r)` is the number of distinct primes dividing `r`. That
  bound for primitive characters is on Tau Ceti's main branch, later than the revision pinned here
  (`DirichletCharacter.norm_sum_range_add_le`).
- Landau's theorem in one-sided form: a measurable `g` with `g(u) ≤ e^{βu}` for large `u`, whose transform
  `∫_0^∞ g(u)e^{−su} du` continues meromorphically with positive leading coefficients at its real poles right of `β`,
  has no pole in `Re s > β`: PositivityOfDirichletSeriesWithKernels §6.4 (b). Used by OneSidedPrimeSumBoundsAndAdmissibleData
  §0.2 (the one-sided criterion), with `g(u) = R_q(e^u)e^u` for the remainder `R_q` of that roadmap, simple poles and
  residues of nonnegative real part at the real points.
- The primitivity of `ψ·(·/d)` for primitive `ψ` modulo `q′` and an odd prime `d ∤ q′`: ClassicalArithmeticCompletion
  §§1.5–1.6 (used in 3.5).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/Analytic` (whose files `Landau` and
  `PolyaVinogradov` prove results that it takes from other roadmaps) and the definitions `New.entireL` and
  `New.quadTwist` in `src/Lib/General/NumberTheory/ImaginaryQuadraticField`.
- Davenport, *Multiplicative Number Theory*.
- D. R. Heath-Brown, *A mean value estimate for real character sums*, Acta Arith. 72 (1995).
- M. Jutila, *On mean values of Dirichlet polynomials with real characters*, Acta Arith. 27 (1975).
- H. L. Montgomery, R. C. Vaughan, *Multiplicative Number Theory I. Classical Theory* (2007).
