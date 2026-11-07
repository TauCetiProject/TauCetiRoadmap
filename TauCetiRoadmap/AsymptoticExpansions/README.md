# Roadmap: Asymptotic expansions

**Summary.** This roadmap builds the general theory of asymptotic approximation of Chapter 2 of
the NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. It is the shared toolkit that roadmaps for the special functions of the other DLMF
chapters consume: Watson's lemma, Laplace's method, stationary phase and the Euler–Maclaurin and
Abel–Plana formulas for their integral and series representations, Mellin transform techniques,
and the asymptotic theory of their differential and difference equations.

The roadmap covers:
- asymptotic scales, Poincaré and generalized asymptotic expansions, uniformity, and the algebra,
  integration, differentiation and existence theory of asymptotic power series (DLMF §2.1);
- asymptotic solution and reversion of transcendental equations (§2.2);
- Laplace and Fourier integrals: integration by parts, Watson's lemma on the real line and in
  sectors, Laplace's method, saddle points and stationary phase (§§2.3(i)–(iv), 2.4(i)–(iv));
- uniform methods for coalescing critical points: Bleistein's method for a peak coalescing with
  an endpoint, with an infinite transformed upper limit (§2.3(v)), and the local cubic normal
  form of Chester, Friedman and Ursell (§2.4(v) through 2.4.20);
- Mellin-transform methods and the method of distributions (§§2.5, 2.6);
- linear differential equations: ordinary and regular singular points, irregular singularities of
  rank one with their Stokes multipliers, the Liouville–Green approximation, and equations with a
  large parameter without transition points (§§2.7(i)–(iii), 2.8(i)–(ii));
- three-term linear recurrences (§§2.9(i)–(ii));
- sums and sequences: the Euler–Maclaurin and Abel–Plana formulas, summation by parts, entire
  functions defined by power series and Darboux's method (§§2.10(i)–(iv));
- the worked examples of these sections, as checks on the general theorems.

Nothing in this roadmap refers to a particular special function beyond the Gamma function, the
Riemann zeta function and the Bernoulli polynomials that Mathlib provides.

Suggested home: `TauCeti/Analysis/Asymptotics/`, beside Tau Ceti's existing
`TauCeti/Analysis/Asymptotics/Lemmas.lean`, with the differential equations of Layers 10–11 under
`TauCeti/Analysis/ODE/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Scales and expansions** (DLMF §2.1). The notions `IsAsymptoticScale` and
   `HasAsymptoticExpansion` with their API; Poincaré expansions at infinity and at a finite point;
   the characterization DLMF 2.1.15; uniform and generalized expansions; the algebra of asymptotic
   power series; integration (2.1.11–2.1.12) and Ritt's differentiation theorem; the Borel–Ritt
   existence theorem in sectors; the examples 2.1.4–2.1.9 and 2.1.17.
2. **Transcendental equations** (DLMF 2.2.1–2.2.8), including Lagrange's reversion formula.
3. **Laplace and Fourier integrals of a real variable** (DLMF 2.3.1–2.3.12, with the example
   2.11.1–2.11.3).
4. **Laplace transforms of a complex variable** (DLMF 2.4.1–2.4.9): Watson's lemma in sectors,
   its extension by rotation of the path, inverse Laplace transforms and Haar's method.
5. **Laplace's method and saddle points** (DLMF 2.3.13–2.3.18 and 2.4.10–2.4.16).
6. **Stationary phase** (DLMF 2.3.19–2.3.23).
7. **Coalescing critical points** (DLMF 2.3.24–2.3.33 and 2.4.17–2.4.20): Bleistein's change of
   variables, the uniform remainder bound and the uniform expansion 2.3.32 under the hypotheses
   of 7.2, and the local cubic normal form.
8. **Mellin-transform methods** (DLMF 2.5.1–2.5.7 and 2.5.17–2.5.48).
9. **Distributional methods** (DLMF 2.6.1–2.6.30, 2.6.33–2.6.47 and 2.6.54–2.6.62).
10. **Linear differential equations in the complex domain** (DLMF 2.7.1–2.7.19), with the
    Volterra integral equations they rest on.
11. **The Liouville–Green approximation and equations with a large parameter**
    (DLMF 2.7.20–2.7.34 and 2.8.1–2.8.13).
12. **Difference equations** (DLMF 2.9.1–2.9.13).
13. **Sums and sequences** (DLMF 2.10.1–2.10.32).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the general theory listed above, the DLMF formulas named there with
the hypotheses and conventions specified in the layers, and the following auxiliary results,
which the layers need and which neither Mathlib nor Tau Ceti provides:

| Result | Target |
|---|---|
| `∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}` for `Re s > 0`, `Re z > 0` | 4.1 |
| Watson's lemma in sectors and along rotated rays, with the gluing of the rotated integrals | 4.2, 4.3 |
| The formal complex power of a power series and the Laplace coefficients `b_s` | 5.1 |
| The continued Mellin transforms through an expansion at `0+` or at `+∞`, and the entire model integral `oscTail` for oscillatory tails | 8.3 |
| `∫₀^∞ t^{α−1}(x+t)^{−α−β} dt = Γ(α)Γ(β)Γ(α+β)⁻¹ x^{−β}` (DLMF 2.6.4) | 9.1 |
| Volterra integral equations with separable kernel bounds, and their discrete analogue | 10.1, 12 |
| The Laurent coefficients `f_n` of a function on a punctured disc | 13.6 |
| The line-shift identity with simple poles and vanishing horizontal connectors, and its iteration over infinitely many lines | 8.2 |
| The pole-separated bound `\|Γ(x + iy)\| ≤ C (1 + \|y\|)^K e^{−π\|y\|/2}` on vertical strips | 8.6 |
| The exponential Mellin inversion `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}` | 8.7 |

These are general tools, and this roadmap is their only owner: the special-function roadmaps
consume them (see [Downstream consumers](#downstream-consumers)).

**What it does not own:**
- Asymptotics of particular special functions. The examples used as checks here are the only
  exceptions, and each is stated by an explicit integral or series, never through a named
  special function.
- Complex Stirling and the Gamma function on vertical lines (DLMF 5.11.1, 5.11.7, 5.11.9). They
  are consumed from ZerosOfLFunctions (see
  [Exact supplier contracts](#exact-supplier-contracts)), and the pole-separated bound of 8.6 is
  derived from them here.
- Bounds for particular Barnes kernels, and Gamma-function identities such as the product formula
  DLMF 5.8.3.
- Uniform expansions in terms of special functions. This covers the Airy-function expansions
  that complete the cubic change of variables of §2.4(v), the turning-point and Bessel-type
  cases of §§2.8(iii)–(vi), and the transition-point theory of §2.9(iii).
- The remainder theory of §2.11(ii)–(vi): exponentially improved expansions, the Stokes
  phenomenon, hyperasymptotics and numerical acceleration.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the general asymptotic methods of the DLMF
subsections listed at the top (all within §§2.1–2.10), stated for arbitrary functions under
explicit hypotheses; it consumes the Gamma asymptotics of ZerosOfLFunctions and the residue
theory of ContourIntegration, and it excludes expansions of named special functions, uniform
expansions in special functions, and the remainder and Stokes-phenomenon theory of §2.11.

## Conventions

- **Namespace.** General targets live in the namespace `Asymptotics`, or in Mathlib's namespace
  of the object they extend (for example `Complex` for the Gamma integral of 4.1).
- **The two notions.** For a filter `l` on `α`, scale functions `φ : ℕ → α → 𝕜` with
  `[NormedField 𝕜]`, coefficients `a : ℕ → E` in a normed `𝕜`-space and `f : α → E`:

```lean
def Asymptotics.IsAsymptoticScale (l : Filter α) (φ : ℕ → α → 𝕜) : Prop :=
  ∀ n, φ (n + 1) =o[l] φ n

def Asymptotics.HasAsymptoticExpansion (l : Filter α) (φ : ℕ → α → 𝕜) (a : ℕ → E)
    (f : α → E) : Prop :=
  ∀ N, (fun x => f x - ∑ n ∈ range N, φ n x • a n) =O[l] φ N
```

  These are DLMF's asymptotic scale (2.1.19) and Poincaré expansion with respect to a scale
  (2.1.13, 2.1.20). They are not wrappers of a single bound: each carries the API of 1.1
  (uniqueness, linearity, congruence, rescaling and composition of scale, multiplication, inversion,
  integration and differentiation), and the other layers state their conclusions through
  `HasAsymptoticExpansion`. No other predicate is introduced. In particular:
  - an **asymptotic power series** `P : 𝕜⟦X⟧` in a small variable `w : α → 𝕜` with
    `w → 0` along `l` is
    `HasAsymptoticExpansion l (fun n x => w x ^ n) (fun n => PowerSeries.coeff n P) f`;
  - a **uniform** expansion (DLMF 2.1.18), whose coefficients `a s u` depend on a parameter `u`
    in a set `U`, is written out along the product filter `𝓟 U ×ˢ l`:
    `∀ N, (fun p => f p.1 p.2 − ∑ s ∈ range N, φ s p.2 • a s p.1) =O[𝓟 U ×ˢ l] fun p => φ N p.2`;
  - a **generalized** expansion `f ~ ∑ f_s; {ψ_s}` (DLMF 2.1.20–2.1.21) is written out:
    `∀ N, (fun x => f x − ∑ s ∈ range N, f_s x) =O[l] ψ N`.
- **Limits at infinity and sectors.** "`z → ∞` in `X ⊆ ℂ`" is `Bornology.cobounded ℂ ⊓ 𝓟 X`;
  "`x → +∞` in `ℝ`" is `atTop`; "`t → a+`" is `𝓝[>] a`. A closed sector `|ph z| ≤ θ` with
  `θ ≤ π` is `{z | |Complex.arg z| ≤ θ}`. Sectors that are not contained in a sheet of the slit
  plane are written in **logarithmic coordinates** `z = exp ζ`: the filter is
  `comap re atTop ⊓ 𝓟 {ζ | β₁ ≤ ζ.im ∧ ζ.im ≤ β₂}`, and powers are written `exp (c * ζ)`, never
  reduced to `Complex.arg`. Solutions of differential equations near an irregular singularity
  are functions of `ζ` on a half-plane `{ζ | log a < ζ.re}` (10.4), and the Laplace integrals
  along rotated rays are glued in the same coordinates (4.3).
- **Powers.** Series terms use the principal `Complex.cpow`; comparison functions use real
  `Real.rpow` of norms, or the complex scale `z ^ (−α s)` itself, which has the same norm up to a
  factor bounded in every sector of finite opening. Bounds near `0+` are
  `O(t ^ (Re α − 1))` along `𝓝[>] 0` with real powers.
- **Integrals.** Laplace integrals are `∫ t in Ioi 0, cexp (−(z * t)) • q t`, the shape of the
  `laplace` of Mathlib's open Laplace-transform pull request (see
  [Exact supplier contracts](#from-mathlib)). Absolute convergence is assumed throughout, as
  integrability of `t ↦ e^{−σt} q t` on `(0, ∞)` for some real `σ`, except for the oscillatory
  integrals of 3.2 and Layer 6. An oscillatory integral over an infinite range is the improper
  integral `lim_{T→∞} ∫_a^T`, stated with `Tendsto (fun T => ∫ t in a..T, _) atTop`.
- **Mellin transforms** are Mathlib's `mellin f s = ∫ t in Ioi 0, t ^ (s − 1) • f t`. The
  analytically continued transforms of DLMF 2.5.26 and 2.5.28 are the explicit functions
  `mellinContAtZero` and `mellinContAtTop` of 8.3.
- **Variation.** DLMF's variational operator `𝒱_{a,b}(F) = ∫_a^b |F′|` (2.3.6) is written as that
  integral. Mathlib's `eVariationOn` is not used.
- **Bernoulli numbers and functions.** `Bₙ` is Mathlib's `bernoulli n` (with `B₁ = −½`),
  `Bₙ(x)` is `bernoulliFun n x`, and the periodic function `B̃ₙ(x)` of DLMF §24.2 is
  `bernoulliFun n (Int.fract x)`.
- **Differential equations** are not predicates. A solution is a function with explicit
  differentiability hypotheses and the equation written with `deriv` (complex domain) or
  `iteratedDeriv` (real domain).
- **Termwise-differentiated expansions.** "The expansion `q(t) ∼ ∑ c_s t^{α_s − 1}` is
  infinitely differentiable" means: for every `k` and `N`,
  `q^{(k)}(t) − ∑_{s<N} c_s (α_s − 1)(α_s − 2)⋯(α_s − k) t^{α_s − 1 − k} = O(t^{Re α_N − 1 − k})`
  as `t → 0+`, with the falling factorial `(descPochhammer ℂ k).eval (α_s − 1)`.

## Exact supplier contracts

### From [ZerosOfLFunctions §1.2](../ZerosOfLFunctions/README.md#12-stirling-on-the-sector) and [§1.3](../ZerosOfLFunctions/README.md#13-vertical-strips)

- **Stirling's formula in the sector** `|ph s| ≤ π − δ`:
  `logGamma δ s = (s − ½) log s − s + ½ log 2π + O(1/|s|)` uniformly (DLMF 5.11.1). Consumed by
  13.5 for the example 2.10.19–2.10.24.
- **The Gamma function on vertical strips**, uniformly for real `x` in compact intervals as
  `|y| → ∞`: `log ‖Γ(x + iy)‖ = (x − ½) log |y| − π|y|/2 + ½ log 2π + O(1/|y|)` (DLMF 5.11.9).
  8.6 derives from it the pole-separated bound for `Γ` on vertical strips, which the rest of
  Layer 8 and the Mellin–Barnes integrals of the special-function roadmaps use.

No L-function theory is needed by this contract.

### From [ContourIntegration](../../Completed/ContourIntegration/README.md), implemented in Tau Ceti

Residues and the residue theorem, in `TauCeti/Analysis/Contour/Residue/`: `TauCeti.Contour.residue`
is the coefficient of `(z − z₀)⁻¹` of the Laurent expansion. 5.3 and Layer 8 compute these
residues and add the vertical-line shift with decay hypotheses; they define no new residue notion.

### From Tau Ceti

- `TauCeti/Analysis/Asymptotics/` has general `IsBigO` and summation lemmas in the namespace
  `Asymptotics`; this roadmap adds to that namespace.
- `TauCeti/Analysis/Complex/LaplaceTransform.lean` has, for `f : ℝ → ℂ` and the integrand
  `f t * cexp (-z * t)`: `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` (each
  truncated transform `z ↦ ∫ t in a..b, f t * cexp (-z * t)` is entire for interval-integrable
  `f`), `TauCeti.integrableOn_mul_cexp_neg_mul` (integrability on `[0, ∞)` for bounded measurable
  `f` and `0 < Re z`) and `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (holomorphy of the
  transform on `0 < Re z` for bounded measurable `f`). They cover bounded kernels; 4.4 extends them
  to kernels `q` with `e^{−ct} q(t)` integrable.
- `TauCeti/Analysis/ODE/` treats real and Banach-space equations (Carathéodory solutions, Dyson
  series, Wronskians of `f″ = q f` with `TauCeti.wronskian_eq_of_hasDerivAt`, the
  stable-manifold theorem, the local Frobenius integrability theorem
  `TauCeti.IsFrobeniusIntegrableAt`). None of it treats analytic equations in the complex domain.
  The regular singular points of 10.3 are unrelated to that Frobenius theorem, and their names
  avoid the word `frobenius`.

### From Mathlib

- The order symbols `IsBigO`, `IsLittleO` and `IsEquivalent`, and their algebra. Mathlib has no
  notion of asymptotic expansion, asymptotic scale or asymptotic power series, and no Watson's
  lemma, Laplace's method, stationary phase, Euler–Maclaurin formula, Frobenius method,
  Liouville–Green approximation or theory of irregular singularities.
- `mellin`, `MellinConvergent`, `mellinInv` and `mellinInv_mellin_eq`.
- `Complex.Gamma`, `Complex.digamma`, `riemannZeta`, `riemannZeta_one_sub` and
  `Real.eulerMascheroniConstant`. Mathlib's Stirling formula covers `n!` only
  (`Stirling.factorial_isEquivalent_stirling`), and
  `Complex.integral_cpow_mul_exp_neg_mul_Ioi` evaluates `∫₀^∞ t^{s−1} e^{−rt} dt` for real
  `r > 0` only.
- `bernoulli`, `bernoulliFun` and `periodizedBernoulli`.
- `PowerSeries.subst`, `PowerSeries.binomialSeries`, `PowerSeries.substInvOfIsUnit` and
  `descPochhammer`.
- The Riemann–Lebesgue lemma `tendsto_integral_exp_inner_smul_cocompact`.
- `circleIntegral`, the Cauchy integral formula and the unbounded-rectangle Cauchy theorems of
  `Mathlib/Analysis/Complex/CauchyIntegral.lean`.
- `Finset.sum_range_by_parts`.
- `ODE_solution_unique` and the Picard–Lindelöf theorem `IsPicardLindelof`.
- **Mathlib's open Laplace-transform pull request
  [#40582](https://github.com/leanprover-community/mathlib4/pull/40582)** defines
  `laplace f s = ∫ t, Complex.exp ((−s) * t) • f t ∂(volume.restrict (Ioi 0))` with
  `LaplaceConvergent` and `HasLaplace`. The layers write Laplace integrals out in exactly this
  shape, `∫ t in Ioi 0, cexp (−(z * t)) • q t`, so that adopting that API when it lands is a
  rewrite by definition.
- Mathlib's `Mathlib/Tactic/ComputeAsymptotics/Multiseries/` (with pull request
  [#28291](https://github.com/leanprover-community/mathlib4/pull/28291)) implements real
  multiseries at `+∞` for the `compute_asymptotics` tactic. It is a decision procedure for
  expressions built from elementary functions, not an expansion API, and the notions here neither
  replace nor duplicate it. Pull request
  [#39429](https://github.com/leanprover-community/mathlib4/pull/39429) (`IsOfAsymptoticClassAt`)
  classifies the growth of a single function for integrability arguments; it defines no expansion
  or scale and does not overlap the notions here. Pull requests
  [#40572](https://github.com/leanprover-community/mathlib4/pull/40572) (first-order
  Euler–Maclaurin through `periodizedBernoulli1`) and
  [#44746](https://github.com/leanprover-community/mathlib4/pull/44746) (complex Stirling) are
  prior art.

## How to read the build

Layer 1 is the foundation: the two notions, their API and the algebra of asymptotic power series.
Every later layer states its conclusions through `HasAsymptoticExpansion`. Layer 2 uses the
inversion of power series from 1.4. Layers 3–7 are the integral methods, in dependency order:
Watson's lemma on the line (3), in sectors and on rotated rays (4), Laplace's method with the
coefficients `b_s` (5), stationary phase on top of 3.2 and 5.1 (6), and the uniform methods (7).
Layers 8–9 are the Mellin and distributional methods; 8.3's continued transforms feed Layer 9,
and 8.2, 8.6 and 8.7 are the contour tools that Mellin–Barnes integrals elsewhere consume.
Layers 10–12 are the equations: the Volterra theorem 10.1 underlies the existence and error
bounds of 10.4 and Layer 11, and its discrete analogue underlies Layer 12. Layer 13 is
independent of Layers 6–12. The worked examples in each layer's `### Examples` are statements
to prove, and they test the general theorems on explicit functions.

## Layer 1: scales and expansions

### 1.1 The notions and their API

Define `IsAsymptoticScale` and `HasAsymptoticExpansion` as pinned. Prove:
- congruence along `=ᶠ[l]` of the function, equality of coefficients, and congruence of the
  scale (`φ n =ᶠ[l] ψ n` for all `n` gives the same expansions with the same coefficients);
- rescaling the scale: if `φ n =ᶠ[l] κ n • ψ n` for constants `κ n`, an expansion with
  coefficients `a n` in `φ` is one with coefficients `κ n • a n` in `ψ`. Mutual `IsBigO`
  comparability of the scales does not preserve expansions, since it changes every partial
  sum; a general change of scale needs explicit transition coefficients;
- linearity (`add`, `neg`, `sub`, `const_smul`) and multiplication of `f` and of the scale by
  a common scalar function;
- composition with `Tendsto g l' l`;
- `isLittleO`: for an asymptotic scale, the remainder after `N + 1` terms is `o(φ N)`;
- `HasAsymptoticExpansion.unique`: for an asymptotic scale with every `φ n` frequently nonzero
  along `l`, the coefficients are unique.

### 1.2 Order-symbol examples

DLMF 2.1.4–2.1.10, as checks: `tanh z ∼ z` as `z → 0` in `ℂ`; `e^{−x} = o(1)` as `x → +∞` in
`ℝ`, and also in the closed sector `|ph z| ≤ π/2 − δ`, while `e^{−z} = o(1)` fails along
`cobounded ℂ ⊓ 𝓟 {z | |arg z| < π/2}` (witness `z = 1 + it`); `sin(πx + x⁻¹) = O(x⁻¹)` as
`x → ±∞` in `ℤ`; `e^{ix} = O(1)` on `ℝ` (along `⊤`); the tail of a power series convergent
near `0` is `O(zⁿ)` (2.1.8); `e^z = 1 + z + O(z²)` (2.1.9).

### 1.3 Poincaré expansions

At infinity in a set `X ⊆ ℂ`, the scale is `z ↦ (zⁿ)⁻¹` along `cobounded ℂ ⊓ 𝓟 X`; on `ℝ` at
`+∞` it is `x ↦ (xⁿ)⁻¹` along `atTop`; at a finite point `c` it is `z ↦ (z − c)ⁿ` along the
punctured filter `𝓝[X \ {c}] c` (2.1.16). Prove:
- these are asymptotic scales (`isAsymptoticScale_inv_pow` at infinity); uniqueness holds at
  infinity when `cobounded ℂ ⊓ 𝓟 X` is not `⊥` (that is, `X` is unbounded), and at `c` when
  `𝓝[X \ {c}] c` is not `⊥` (that is, `c` is an accumulation point of `X`). Both are instances
  of the frequent-nonvanishing hypothesis of `HasAsymptoticExpansion.unique`; nonbottomness of
  the unpunctured `𝓝[X] c` does not suffice (for `X = {c}` every `(z − c)ⁿ` with `n ≥ 1`
  vanishes on the filter);
- the characterization **2.1.15** (`hasAsymptoticExpansion_inv_pow_iff`): the expansion holds
  if and only if `zⁿ (f z − ∑_{s<n} a_s z^{−s}) → a_n` for every `n`;
- a series `∑ a_s z^{−s}` convergent for `|z| > R` is the expansion of its sum along
  `cobounded ℂ` (`hasAsymptoticExpansion_of_hasSum`);
- **2.1.17**: in `|ph z| ≤ π/2 − δ`, the functions `0`, `e^{−z}` and `e^{−√z}` (principal
  root) all have the zero expansion.

### 1.4 Asymptotic power series

In a small variable `w → 0` (pinned form; the expansions at `∞` are the case `w = z⁻¹`), prove
closure under sums, products (coefficients of `P * Q`, `hasAsymptoticExpansion_pow_mul`),
reciprocals when `constantCoeff P ≠ 0` (coefficients of `P⁻¹`, `hasAsymptoticExpansion_pow_inv`),
composition and inversion. The last two involve two filters: `l` on `α` with small variable
`w : α → 𝕜`, `w → 0` along `l`, and `m` on `β` with small variable `σ : β → 𝕜`, and a map
`y : α → β` with `Tendsto y l m`.
- **Composition** (`hasAsymptoticExpansion_pow_subst`): if `H ∼ P` in `σ` along `m`,
  `constantCoeff Q = 0` and `σ ∘ y ∼ Q` in `w` along `l`, then `H ∘ y ∼ P.subst Q` in `w`
  along `l`.
- **Inversion** (`hasAsymptoticExpansion_pow_substInv`): if `σ → 0` along `m`, `H ∼ P` in `σ`
  along `m` with `constantCoeff P = 0` and `coeff 1 P ≠ 0`, and eventually along `l`
  `H (y x) = w x`, then `σ ∘ y ∼ P.substInvOfIsUnit _` in `w` along `l`. The hypothesis
  `Tendsto y l m` selects the branch of the inverse; the equation `H (y x) = w x` alone does not.

Prove the rules for complex powers and logarithms (DLMF §2.1(iii), "substitution, logarithms and
powers"): if `f ∼ P` with `constantCoeff P ∈ slitPlane` and `ℓ = Complex.log (constantCoeff P)`,
then the principal powers and logarithm satisfy `f ^ r ∼ formalCpow ℓ r P` (5.1) and
`log f ∼ C ℓ + (logSeries).subst (C (exp (−ℓ)) * P − 1)`, where
`logSeries = PowerSeries.mk fun k => if k = 0 then 0 else (−1) ^ (k + 1) / k`.

### 1.5 Integration and differentiation

DLMF §2.1(ii).
- **2.1.11–2.1.12**: for continuous `f` on `[x₀, ∞)` with `f(x) ∼ x^ν` (`ν ∈ ℂ`):
  `∫ₓ^∞ f ∼ −x^{ν+1}/(ν+1)` if `Re ν < −1`; and, for the primitive `F(x) = ∫_{x₀}^x f`,
  `F(x) → const` if `Re ν < −1`, `F ∼ log x` if `ν = −1`, `F ∼ x^{ν+1}/(ν+1)` if `Re ν > −1`.
- Termwise integration of a Poincaré expansion at `+∞` with `a₀ = a₁ = 0`:
  `∫ₓ^∞ f ∼ ∑_{s≥2} a_s x^{1−s}/(s − 1)`.
- **Ritt's theorem** (`isBigO_deriv_of_isBigO_sector`): if `f` is holomorphic on
  `{R < |z|, |ph z| < θ}` with `θ ≤ π` and `f = O(|z|^ν)` there, `ν` real, then
  `f′ = O(|z|^{ν−1})` in every closed subsector `|ph z| ≤ θ′ < θ`; the same with `o` in place of
  `O`. Consequently a Poincaré expansion of such an `f` may be differentiated termwise in closed
  subsectors.

### 1.6 Borel–Ritt existence and non-uniqueness

For every `a : ℕ → ℂ` and every `θ ∈ (0, π)` there is `f`, holomorphic on `{1 < |z|, |ph z| < θ}`,
whose Poincaré expansion along `cobounded ℂ ⊓ 𝓟 {|ph z| ≤ θ}` is `∑ a_s z^{−s}`
(`exists_hasAsymptoticExpansion_sector`); and the same on the positive real axis. Two such
functions differ by a function with the zero expansion, and nonzero such functions exist (2.1.17).

### Examples

- The order-symbol examples of 1.2 and the zero expansions of 2.1.17 in 1.3.
- `1/(z − 1) ∼ ∑_{s≥1} z^{−s}` along `cobounded ℂ`, by `hasAsymptoticExpansion_of_hasSum` with
  `R = 1`, `a₀ = 0` and `a_s = 1` for `s ≥ 1`.
- With `φ n = x⁻ⁿ` and `ψ n = 2x⁻ⁿ` along `atTop`, `f = 1` has the coefficients `(1, 0, 0, …)` in
  `φ` and `(½, 0, 0, …)` in `ψ`, as the rescaling rule of 1.1 gives; the coefficients
  `(1, 0, 0, …)` do not expand `f` in `ψ`.

### Dependencies

Mathlib `IsBigO`, `IsLittleO`, `IsEquivalent`, `PowerSeries.subst`, `PowerSeries.substInvOfIsUnit`,
`PowerSeries.binomialSeries`, `Complex.log`, the Cauchy estimates for Ritt's theorem, and the
convergent-power-series bound `HasFPowerSeriesAt.isBigO_sub_partialSum_pow`.

## Layer 2: transcendental equations

### 2.1 Inversion of `f(x) ∼ x`

DLMF 2.2.1–2.2.2. If `f` is continuous and strictly increasing on `[a, ∞)` and `f(x) ∼ x` as
`x → +∞`, then for every `y > f(a)` the equation `f(x) = y` has a unique root `x(y) ∈ (a, ∞)`,
and `x(y) ∼ y` as `y → +∞`.

### 2.2 Successive resubstitution

Example 2.2.3–2.2.6, as a check: for `y > ½ + ½ log 2`, the root `t > 1/√2` of `t² − log t = y`
(the branch tending to `∞`; DLMF's `x = t² > ½`) satisfies
`t = y^{1/2}(1 + ¼ y^{−1} log y + o(y^{−1}))`.

### 2.3 Lagrange's reversion

DLMF 2.2.7–2.2.8. Under the hypotheses of 2.1, if `f(x) − x ∼ f₀ + f₁x^{−1} + f₂x^{−2} + ⋯`,
then `y − x(y) ∼ F₀ + F₁y^{−1} + F₂y^{−2} + ⋯` (`hasAsymptoticExpansion_reversion`) with
`F_s = reversionCoeff f s`, where `F₀ = f₀` and, for `s ≥ 1`,

```text
s F_s = [X^{s+1}] (1 + f₀X + f₁X² + f₂X³ + ⋯)^s,
```

the coefficient of `x^{−1}` in the expansion of `f(x)^s`. The complex form needs no
monotonicity: for sets `S, S′ ⊆ ℂ`, if `f(x) − x` has the expansion along `cobounded ℂ ⊓ 𝓟 S`
and `x : ℂ → ℂ` satisfies, eventually along `cobounded ℂ ⊓ 𝓟 S′`, `x(y) ∈ S` and `f(x(y)) = y`,
with `x(y) ∼ y`, then `y − x(y)` has the expansion `∑ F_s y^{−s}` along `cobounded ℂ ⊓ 𝓟 S′`.

**Checks.**

- `reversionCoeff f 0 = f₀`, `reversionCoeff f 1 = f₁` and `reversionCoeff f 2 = f₂ + f₀f₁`.
- For `f(x) = x + f₀ + f₁/x`, direct resubstitution gives
  `x = y − f₀ − f₁/y − f₀f₁/y² + O(y^{−3})`, agreeing with `F₀`, `F₁`, `F₂`.
- For `f(x) = x + f₀`, every `F_s` with `s ≥ 1` vanishes and `x(y) = y − f₀` exactly.

### Examples

The resubstitution example 2.2 and the checks of 2.3.

### Dependencies

1.4 (inversion of asymptotic power series in `w = x⁻¹`); Mathlib's intermediate value theorem.

## Layer 3: Laplace and Fourier integrals of a real variable

### 3.1 Integration by parts

DLMF 2.3.1–2.3.3. If `t ↦ e^{−σt} q(t)` is integrable on `(0, ∞)` and `q` is `C^∞` on `[0, ε)`,
then `∫₀^∞ e^{−xt} q(t) dt ∼ ∑ q^{(s)}(0) x^{−s−1}` as `x → +∞`. If `q` is `C^∞` on `[0, ∞)` and
every `σ_n = sup_{t>0} t^{−1} log |q^{(n)}(t)/q^{(n)}(0)|` is finite (with `q^{(n)}(0) ≠ 0`), the
`n`th remainder is at most `|q^{(n)}(0)| / (xⁿ (x − σ_n))` for `x > max(0, σ_n)`.

### 3.2 Fourier integrals at the endpoints

DLMF 2.3.4–2.3.6. For `q` `C^∞` on `[a, b]`, `a < b` finite, `∫_a^b e^{ixt} q(t) dt` has the
endpoint expansion 2.3.4 as `x → +∞`. For `b = ∞`, let `q` be `C^∞` on `[a, ∞)` with
`q^{(s)}(t) → 0` as `t → ∞` and `q^{(s+1)}` integrable on `[a, ∞)` for every `s`; then the
improper integral exists for `x > 0` and has the expansion 2.3.5. In both cases the `n`th
remainder is bounded by `x^{−n} ∫_a^b |q^{(n)}|`.

### 3.3 Watson's lemma on the real line

DLMF 2.3.7–2.3.8, with a general exponent sequence. Let `α : ℕ → ℂ` have `Re α₀ > 0` and strictly
increasing real parts, `c : ℕ → ℂ`, and `q : ℝ → ℂ` with `t ↦ e^{−σt} q(t)` integrable on
`(0, ∞)` and, for every `N`, `q(t) − ∑_{s<N} c_s t^{α_s − 1} = O(t^{Re α_N − 1})` as `t → 0+`.
Then, as `x → +∞`, `∫₀^∞ e^{−xt} q(t) dt ∼ ∑ Γ(α_s) c_s x^{−α_s}`. DLMF's case is
`α_s = (s + λ)/μ`; the general sequence covers the extension of Bleistein and Handelsman (1975,
§4.1). Also prove that, given the bound at `N = 1`, the integrability hypothesis is equivalent to
`q` locally integrable on `(0, ∞)` together with `e^{−σt} q(t)` integrable on `(1, ∞)`: the bound
gives `q(t) = O(t^{Re α₀ − 1})` at `0+`, which is integrable since `Re α₀ > 0`. Either form may be
used as the hypothesis.

### 3.4 The logarithmic variant

DLMF 2.3.9. Under the hypotheses of 3.3, `∫₀^∞ e^{−xt} q(t) log t dt` has the generalized
expansion with terms `(Γ′(α_s) − Γ(α_s) log x) c_s x^{−α_s}` with respect to the scale
`x^{−Re α_s} log x`.

### 3.5 General kernels

DLMF 2.3.10–2.3.12. Let `f` and `q` be locally integrable on `(0, ∞)`, with
`|f(t)| ≤ A e^{−a t^κ}` on `(0, ∞)`, `q(t) = O(e^{b t^κ})` as `t → +∞` (`A, a, b, κ > 0`), and
`q` with the expansion of 3.3. Then `∫₀^∞ f(xt) q(t) dt ∼ ∑ 𝓜f(α_s) c_s x^{−α_s}` as `x → +∞`,
with `𝓜f = mellin f`.

### Examples

- DLMF 2.11.1–2.11.3, for 3.2: for integers `m → ∞`,
  `∫₀^π cos(mt)/(t² + 1) dt ∼ (−1)^m ∑_{s≥1} q_s(π) m^{−2s}`, with
  `q_s = d^{2s−1}/dt^{2s−1} (t² + 1)⁻¹`, whose first three are given by 2.11.3.
- For 3.3 with `q(t) = (1 + t)⁻¹` (`α_s = s + 1`, `c_s = (−1)^s`):
  `∫₀^∞ e^{−xt}/(1 + t) dt ∼ ∑ (−1)^s s! x^{−s−1}`.
- For 3.3 with `q(t) = t^{α−1}`, `Re α > 0`: the expansion has the single term `Γ(α) x^{−α}`,
  which is the exact value.

### Dependencies

Mathlib `Real.Gamma`, `Complex.Gamma`, `mellin`, `integral_rpow_mul_exp_neg_mul_Ioi`, dominated
convergence and integration by parts on intervals; 1.1.

## Layer 4: Laplace transforms of a complex variable

### 4.1 The complex Gamma integral

For `Re s > 0` and `Re z > 0`, `∫₀^∞ t^{s−1} e^{−zt} dt = Γ(s) z^{−s}` with the principal power,
by analytic continuation in `z` from Mathlib's real case
(`integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos`).

### 4.2 Watson's lemma in a sector

DLMF 2.4.1. Under the hypotheses of 3.3, for every `δ ∈ (0, π/2)`,
`∫₀^∞ e^{−zt} q(t) dt ∼ ∑ Γ(α_s) c_s z^{−α_s}` as `z → ∞` in `|ph z| ≤ π/2 − δ`, with the scale
`z ^ (−α_s)` (`hasAsymptoticExpansion_laplace_sector`). The Laplace integral converges absolutely
for `Re z > σ`, which holds eventually along the sector filter. The real case 3.3 is its
restriction to the positive axis.

### 4.3 Rotation of the path

DLMF §2.4(i), second paragraph. Let `−π < α₁ < 0 < α₂ < π`, let `q` be holomorphic in
`α₁ < ph t < α₂`, and suppose that in every closed subsector `α₁ + δ ≤ ph t ≤ α₂ − δ` the
expansion of 3.3 holds as `t → 0` and `q(t) = O(e^{σ|t|})` as `t → ∞`, with one `σ ≥ 0`. For
`θ ∈ (α₁, α₂)` let `I_θ(z) = e^{iθ} ∫₀^∞ exp(−z e^{iθ} r) q(r e^{iθ}) dr`.

The continuation is carried out in logarithmic coordinates `z = e^ζ`, not in `z`: two rays `θ`,
`θ′` with `|θ − θ′| > π` both converge at points of the negative axis, with different values
(for `q(t) = t^{−1/2}` and `θ = ±3π/4`, at `z = −R` the values are `±i√(π/R)`); they represent
different continuations around `0`. So let

```text
J_θ(ζ) = rayLaplace q θ ζ = e^{iθ} ∫₀^∞ exp(−e^{ζ+iθ} r) q(r e^{iθ}) dr
```

on the strip `S_θ = rayLaplaceDomain σ θ = {ζ | |Im ζ + θ| < π/2, Re e^{ζ+iθ} > σ}`, so that
`J_θ(ζ) = I_θ(e^ζ)`. Prove:
- each `J_θ` is holomorphic on `S_θ`, and `J₀(ζ)` is the Laplace integral at `z = e^ζ`;
- **gluing**: for all `θ, θ′ ∈ (α₁, α₂)`, `J_θ = J_θ′` on `S_θ ∩ S_θ′` (by Cauchy's theorem on
  the sector between the rays; with the holomorphy, `rayLaplace_differentiableOn_and_eqOn`), so
  the `J_θ` define one holomorphic function on `⋃_θ S_θ`, which contains, for every closed
  substrip of `−α₂ − π/2 < Im ζ < −α₁ + π/2`, its part with `Re ζ` sufficiently large;
- for every `δ > 0`, along `Re ζ → ∞` with `|Im ζ + θ| ≤ π/2 − δ`:
  `J_θ(ζ) ∼ ∑ Γ(α_s) c_s exp(−α_s ζ)` (`hasAsymptoticExpansion_rayLaplace`).

Together these give the expansion of the continued Laplace transform, as a function of `ζ`, in
every closed substrip of `−α₂ − π/2 < Im ζ < −α₁ + π/2`, including strips that cross
`Im ζ = ±π`. Its restriction to a strip of width less than `2π` is a function of `z` on the
corresponding sector.

**Checks.**

- `rayLaplace q 0 ζ = ∫ t in Ioi 0, cexp (−(exp ζ * t)) * q t`, the Laplace integral at
  `z = exp ζ`.
- For `q(t) = t^{α−1}` with `Re α > 0`, `rayLaplace q θ ζ = Γ(α) e^{−αζ}` on `S_θ` for every
  `θ ∈ (−π, π)`: the value does not depend on `θ`, and the expansion has a single term.
- For `q(t) = t^{−1/2}` the strips `S_{3π/4}` and `S_{−3π/4}` both meet `Im ζ = ±π`, but at
  different points of the `ζ`-plane (`Im ζ = −π` and `Im ζ = π`), and the values `±i√(π/R)` above
  are those of `J_{±3π/4}` at `ζ = log R ∓ iπ`.

### 4.4 Inverse Laplace transforms

DLMF 2.4.2–2.4.5.
- **2.4.2–2.4.3**: if `q` is differentiable on `(0, ∞)` and `e^{−ct} q(t)` is integrable, then
  `Q(z) = ∫₀^∞ e^{−zt} q(t) dt` is continuous on `Re z ≥ c` and holomorphic on `Re z > c`, and
  for every `t > 0` and `σ ≥ c`,
  `q(t) = lim_{η→∞} (2πi)⁻¹ ∫_{σ−iη}^{σ+iη} e^{tz} Q(z) dz`. The holomorphy extends Tau Ceti's
  `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` from bounded kernels to integrable
  `e^{−ct} q(t)`, through the truncations of `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`.
- **2.4.4–2.4.5** (`exists_inverseLaplace_hasExpansion`): if `c > 0` and `Q` is holomorphic on a
  neighbourhood of `Re z ≥ c` with `Q(z) ∼ ∑ Γ(α_s) c_s z^{−α_s}` and
  `Q′(z) ∼ −∑ α_s Γ(α_s) c_s z^{−α_s−1}` as `z → ∞` in `Re z ≥ c` (`α` as in 3.3), then the
  improper integral `q(t) = lim_{η→∞} (2πi)⁻¹ ∫_{σ−iη}^{σ+iη} e^{tz} Q(z) dz` exists for `t > 0`,
  is independent of `σ ∈ [c, ∞)`, and `q(t) − ∑_{s<N} c_s t^{α_s−1} = O(t^{Re α_N − 1})` as
  `t → 0+`.

### 4.5 Haar's method

DLMF 2.4.6–2.4.9. If `Q` and a comparison function `F` with inverse transform `f` (both given by
4.4's improper integrals on `Re z = c`) satisfy `τ ↦ Q(c + iτ) − F(c + iτ)` integrable on `ℝ`,
then `q(t) = f(t) + o(e^{ct})` as `t → +∞`; if also `Q^{(j)} − F^{(j)}` is integrable on the line
for `j ≤ m`, then `q(t) = f(t) + o(t^{−m} e^{ct})`.

### Examples

- 4.1 at `s = 1`, `z = 1 + i`: `∫₀^∞ e^{−(1+i)t} dt = (1 + i)⁻¹`.
- 4.2 with `q(t) = t^{−1/2}`: `∫₀^∞ e^{−zt} t^{−1/2} dt = √π z^{−1/2}` exactly, in every sector
  `|ph z| ≤ π/2 − δ`.
- 4.4 with `Q(z) = z^{−α}`, `Re α > 0`, `c = 1`: the inverse transform is
  `q(t) = t^{α−1}/Γ(α)`, and the expansion of 2.4.5 has the single term with `c₀ = 1/Γ(α)`.

### Dependencies

Layers 1 and 3; Mathlib `Complex.Gamma`, the identity theorem, the Riemann–Lebesgue lemma
`tendsto_integral_exp_inner_smul_cocompact`, and the unbounded-rectangle Cauchy theorems; Tau
Ceti's `TauCeti/Analysis/Complex/LaplaceTransform.lean` (for 4.4).

## Layer 5: Laplace's method and saddle points

### 5.1 The coefficients

For a power series `P` with constant coefficient `exp ℓ`, define

```text
formalCpow ℓ r P = C(exp(r ℓ)) · (binomialSeries ℂ r).subst (C(exp(−ℓ)) · P − 1),
```

the power `P^r` whose constant term is `exp(r ℓ)`. For `μ > 0`, `λ ∈ ℂ` and power series `P`,
`Q`, define the **Laplace coefficients**

```text
b_s = laplaceCoeff μ λ ℓ P Q s = μ⁻¹ · [X^s] ( Q · formalCpow ℓ (−(λ+s)/μ) P ).
```

With `P = ∑ p_s X^s`, `Q = ∑ q_s X^s` these are the `b_s` of DLMF 2.3.15–2.3.17.

**Checks.**

- `formalCpow ℓ 1 P = P`, `formalCpow ℓ (r + r′) P = formalCpow ℓ r P * formalCpow ℓ r′ P`,
  and `formalCpow ℓ n P = P ^ n` for natural `n`.
- 2.3.17 for `b₀`, `b₁`, `b₂`: for instance `b₀ = q₀ p₀^{−λ/μ}/μ` and
  `b₁ = p₀^{−(λ+1)/μ} (q₁/μ − (λ+1) p₁ q₀/(μ² p₀))`.
- For `P = 1` (`ℓ = 0`) and `Q = 1`, `b₀ = μ⁻¹` and `b_s = 0` for `s ≥ 1`.

### 5.2 Laplace's method on the real line

DLMF 2.3.13–2.3.16. Let `μ > 0`, `Re λ > 0` and let `p : ℝ → ℝ`, `q : ℝ → ℂ` satisfy, as
`t → a+` and for every `N`:
- `p(t) − p(a) − ∑_{s<N} p_s (t−a)^{s+μ} = O((t−a)^{N+μ})`, with `p₀ > 0`, and the
  differentiated expansion for `p′`;
- `q(t) − ∑_{s<N} q_s (t−a)^{s+λ−1} = O((t−a)^{N+Re λ−1})`;
- `p′` and `q` continuous on some `(a, a + ε)`; `p` measurable;
- for every `c > a` there is `η > 0` with `p(t) ≥ p(a) + η` for `t ≥ c`;
- `t ↦ e^{−x₀p(t)} q(t)` integrable on `(a, ∞)` for some `x₀`.

Then, as `x → +∞`, `e^{x p(a)} ∫_a^∞ e^{−x p(t)} q(t) dt ∼ ∑ Γ((s+λ)/μ) b_s x^{−(s+λ)/μ}` with
the `b_s` of 5.1 for `ℓ = log p₀` (`hasAsymptoticExpansion_laplace_method`). A finite upper limit
`b` is the case `q = 0` on `[b, ∞)`. Also prove **2.3.16**: with `T` the inverse of `p` on
`[a, a + ε)`, the function `v ↦ q(T(p(a) + v)) / p′(T(p(a) + v))` has the expansion
`∑ b_s v^{(s+λ−μ)/μ}` as `v → 0+`.

### 5.3 The residue form

DLMF 2.3.18. If `P`, `Q` are the Taylor series at `a` of functions `P̂`, `Q̂` holomorphic at `a`,
with `P̂(a) = exp ℓ`, let `L` be the holomorphic logarithm of `P̂` near `a` with `L(a) = ℓ`. Then
`b_s` is `μ⁻¹` times the `TauCeti.Contour.residue` at `a` of
`t ↦ (t − a)^{−s−1} Q̂(t) exp(−(λ+s) L(t)/μ)`. This is DLMF's
`μ⁻¹ res[q(t)/(p(t) − p(a))^{(λ+s)/μ}]` with the branch made explicit.

### 5.4 Laplace's method on a contour

DLMF 2.4.10–2.4.13. The path is a `C¹` map `γ : [0, ∞) → ℂ` with `γ(τ) = a + τ e^{iω}` on an
initial segment `[0, τ₀]`; the integral is `I(z) = ∫₀^∞ e^{−z p(γ τ)} q(γ τ) γ′(τ) dτ`. On that
segment the powers are `(t − a)^c = τ^c e^{icω}`. Assume `p` and `q` holomorphic on an open set
containing `γ((0, ∞))`; the expansions 2.4.11 along the initial segment with `Re λ > 0`, `μ > 0`,
`p₀ ≠ 0`, the first differentiable; and conditions (b), (c) of DLMF §2.4(iii) for `z` in the
closed sector `θ₁ ≤ ph z ≤ θ₂`, `θ₂ − θ₁ < π`, written in logarithmic coordinates. Then
`e^{z p(a)} I(z) ∼ ∑ Γ((s+λ)/μ) b_s z^{−(s+λ)/μ}` in that sector, with `ℓ = log |p₀| + i ω₀` for
the branch `ω₀` of `ph p₀` satisfying `|θ + μω + ω₀| ≤ π/2` for all `θ ∈ [θ₁, θ₂]` (2.4.13).

### 5.5 Saddle points

DLMF 2.4.14–2.4.16. If the path passes through an interior point `t₀` with `p′(t₀) = 0 ≠ p″(t₀)`,
splitting the path at `t₀` and applying 5.4 to both halves (`μ = 2`, `λ = 1`, directions `ω` and
`ω + π`, the branch of `ph p₀` on each half fixed by 2.4.13) gives
`I(z) ∼ 2 e^{−z p(t₀)} ∑ Γ(s + ½) b_{2s} z^{−s−½}` (2.4.15), the odd coefficients cancelling.
Prove the explicit `b₀` and `b₂` of 2.4.16, as checks, with `ω₀ = ph p″(t₀)` chosen so that
`|θ + 2ω + ω₀| ≤ π/2`.

### Examples

- 5.2 with `a = 0`, `p(t) = t²`, `q = 1` (`μ = 2`, `λ = 1`, `p₀ = 1`):
  `∫₀^∞ e^{−xt²} dt = ½ √(π/x)`, the single term `Γ(½) b₀ x^{−1/2}` with `b₀ = ½`.
- 5.2 with `p(t) = t`, `μ = 1`: the expansion is Watson's lemma 3.3 with `α_s = s + λ`.

### Dependencies

1.4, Layers 3 and 4; the residue API of ContourIntegration; Mathlib `PowerSeries.binomialSeries`
and `PowerSeries.subst`.

## Layer 6: stationary phase

### 6.1 The Fourier analogue of Watson's lemma

DLMF 2.3.20. Let `α`, `c` be as in 3.3 and let `q` be `C^∞` on `(0, ∞)`, with the expansion of
3.3 as `t → 0+`, infinitely differentiable (see [Conventions](#conventions)), and such that for
every `s` the derivative `q^{(s+1)}` is integrable on `[1, ∞)` and `q^{(s)}(t) → 0` as `t → ∞`.
Then the improper integral `∫₀^∞ e^{ixt} q(t) dt` exists for `x > 0` and has the expansion
`∑ e^{iπα_s/2} Γ(α_s) c_s x^{−α_s}` as `x → +∞` (`hasAsymptoticExpansion_fourier`).

### 6.2 Stationary phase at an endpoint

DLMF 2.3.21–2.3.23. Let `a < b ≤ ∞`, `μ > 0` and `λ > 0` (real), and let `p : ℝ → ℝ` and
`q : ℝ → ℂ` satisfy, as in DLMF §2.3(iv):
- (a) `p` and `q` are `C^∞` on `(a, b)` and `p′ > 0` there;
- (b) the expansions `p(t) − p(a) ∼ ∑ p_s (t − a)^{s+μ}` with `p₀ > 0` and
  `q(t) ∼ ∑ q_s (t − a)^{s+λ−1}` hold as `t → a+` and are infinitely differentiable.

Put `P₀ = q/p′` and `P_{s+1} = P_s′/p′` on `(a, b)`, that is `P_s = (p′⁻¹ d/dt)^s (q/p′)`
(2.3.21), and let `b_s` be the coefficients of 5.1 for `ℓ = log p₀`.
- (c) If `p(b) = lim_{t→b−} p(t)` is finite and each `P_s(t)` tends to a finite limit `P_s(b)`
  as `t → b−`, then for every `N`, as `x → +∞`,

```text
∫_a^b e^{ixp(t)} q(t) dt − e^{ixp(a)} ∑_{s<N} e^{(s+λ)πi/(2μ)} Γ((s+λ)/μ) b_s x^{−(s+λ)/μ}
    + e^{ixp(b)} ∑_{s<N} P_s(b) (i/x)^{s+1}  =  O(x^{−(N+λ)/μ}) + O(x^{−N−1}),
```

  the generalized expansion 2.3.23 (`isBigO_stationaryPhase_remainder`, for finite `b`).
- (d) If `p(t) → ∞` as `t → b−`, `P₀(t) → 0` as `t → b−`, and each integral
  `∫ e^{ixp(t)} P_s(t) p′(t) dt` (2.3.22) converges at `b` uniformly for all sufficiently large
  `x`, then the improper integral `lim_{T→b−} ∫_a^T` exists for large `x` and the same holds
  without the sum at `b`.

The `b`-terms come from repeated integration by parts,
`∫ e^{ixp} P_s p′ = [e^{ixp} P_s/(ix)] − (ix)⁻¹ ∫ e^{ixp} P_{s+1} p′`, and
`(−1)^s (ix)^{−s−1} = −(i/x)^{s+1}`.

### Examples

- 6.1 with `q(t) = e^{−t}` (`α_s = s + 1`, `c_s = (−1)^s/s!`):
  `∫₀^∞ e^{ixt} e^{−t} dt = (1 − ix)⁻¹`, whose expansion `−∑ (ix)^{−s−1}` is
  `∑ i^{s+1} (−1)^s x^{−s−1}`, as 6.1 gives.
- 6.1 with `q(t) = t^{α−1}e^{−t}`, `0 < Re α`: the leading term is
  `e^{iπα/2} Γ(α) x^{−α}`, and the exact value is `Γ(α)(1 − ix)^{−α}`.
- 6.2(d) with `a = 0`, `b = ∞`, `p(t) = t²`, `q = 1` (`μ = 2`, `λ = 1`): the Fresnel integral
  `∫₀^∞ e^{ixt²} dt = ½ √(π/x) e^{iπ/4}`, the single term with `b₀ = ½`.
- 6.2(c) with `p(t) = t` on `[0, 1]` and `q = 1`: `∫₀¹ e^{ixt} dt = (e^{ix} − 1)/(ix)`; the
  stationary-endpoint sum is `i/x` (`μ = λ = 1`, `b₀ = 1`, `b_s = 0` for `s ≥ 1`), and the
  `b`-sum is `−e^{ix} (i/x)` (`P₀ = 1`, `P_s = 0` for `s ≥ 1`).

### Dependencies

3.2, 5.1 and 5.2; Mathlib `descPochhammer`, integration by parts and change of variables on
intervals.

## Layer 7: coalescing critical points

### 7.1 Bleistein's change of variables

DLMF 2.3.24–2.3.30. Let `k ∈ (0, ∞]`, `λ > 0`, and let `p(α, t)` and `q(α, t)` be defined for
`α ∈ [α₁, α₂]` (`α₁ ≤ 0 < α₂ ≤ k`) and `t` in an interval containing `[α₁, k)`, with `∂²p/∂t²`
and `q` continuous, `∂p/∂t (α, α) = 0`, `∂²p/∂t² (α, α) > 0` and `q(α, α) ≠ 0`, and with
`p(α, ·)` strictly decreasing to the left of `α` and strictly increasing to its right. Put
`a(α) = sgn(α) · (2p(α, 0) − 2p(α, α))^{1/2}` (with `sgn 0 = 0`) and
`w(α, t) = a(α) + sgn(t − α) (2p(α, t) − 2p(α, α))^{1/2}`. Prove that `w(α, ·)` is a strictly
increasing `C¹` function with `w(α, 0) = 0` and `w(α, α) = a(α)`, that its derivative is given by
2.3.28 away from `t = α` and is positive at `t = α`, and that `p(α, t) = ½w² − a w + p(α, 0)`.
The integral `I(α, x) = ∫₀^k e^{−x p(α, t)} q(α, t) t^{λ−1} dt` (2.3.24), where it converges,
equals the transformed integral 2.3.29 with `f` as in 2.3.30 and upper limit
`κ(α) = lim_{t→k} w(α, t)`. If `p(α, t) → ∞` as `t → k`, then `κ(α) = ∞`; `k = ∞` alone does
not give this. The sign of `a` is fixed by `w(α, 0) = 0`; DLMF 2.3.26 records its absolute
value.

### 7.2 The uniform remainder bound and expansion

DLMF 2.3.31–2.3.33, `κ = ∞`. For `λ > 0`, `s, N ∈ ℕ` and real `y`, let

```text
F_s(y) = bleisteinF λ s y = ∫₀^∞ exp(−τ²/2 + yτ) (τ − y)^s τ^{λ−1} dτ     (2.3.33),
G_N(y) = bleisteinG λ N y = ∫₀^∞ exp(−τ²/2 + yτ) |τ − y|^N τ^{λ−1} dτ.
```

- **API**: for `λ > 0` both integrands are integrable on `(0, ∞)` for every real `y`; `G_N ≥ 0`
  and `|F_s| ≤ G_s`; `F_s` and `G_N` are continuous in `y`.
- **Bound** (`norm_bleistein_remainder_le`): if `f` is measurable on `(0, ∞)` and
  `|f(w) − ∑_{s<N} φ_s (w − a)^s| ≤ C_N |w − a|^N` for all `w > 0`, then for every `x > 0`

```text
| ∫₀^∞ exp(−x(w²/2 − a w)) f(w) w^{λ−1} dw − x^{−λ/2} ∑_{s<N} φ_s F_s(a√x) x^{−s/2} |
    ≤ C_N x^{−(N+λ)/2} G_N(a√x).
```

- **Uniform expansion 2.3.32**: assume the hypotheses of 7.1, that `p(α, t) → ∞` as `t → k` for
  every `α ∈ [α₁, α₂]` (so `κ = ∞`), and that the transformed amplitude `f(α, w)` of 2.3.30
  satisfies, for coefficients `φ_s(α)` and for every `N`, the bound
  `|f(α, w) − ∑_{s<N} φ_s(α)(w − a(α))^s| ≤ C_N |w − a(α)|^N` for all `w > 0` and all
  `α ∈ [α₁, α₂]`, with `C_N` independent of `α`. Then `I(α, x)` converges absolutely for
  `x > 0`, and for every `N`, `α ∈ [α₁, α₂]` and `x > 0`, with `a = a(α)`,

```text
| e^{x p(α,0)} I(α, x) − x^{−λ/2} ∑_{s<N} φ_s(α) F_s(a√x) x^{−s/2} | ≤ C_N x^{−(N+λ)/2} G_N(a√x).
```

  This is 2.3.32 with an explicit uniform remainder. Its hypothesis is on the transformed
  amplitude `f`; conditions on `p` and `q` that imply it are outside this roadmap (see the last
  section).

**Checks.**

- `F₀(0) = G₀(0) = 2^{λ/2−1} Γ(λ/2)`, by `u = τ²/2`; and `G₀ = F₀` for every `y`.
- `F₁(y) = 1` for `λ = 1` and every `y`, since `(τ − y) e^{−τ²/2 + yτ}` is minus the derivative
  of `e^{−τ²/2 + yτ}`.
- `G_{2m} = F_{2m}` for every `m`, and `G_N(y) > 0` for every `y`.

### 7.3 The cubic normal form

DLMF 2.4.17–2.4.20; Chester, Friedman and Ursell. Let `p(α, t)` be holomorphic in `(α, t)` near
`(α̂, t̂)` with `∂p/∂t = ∂²p/∂t² = 0` and `∂³p/∂t³ ≠ 0` at `(α̂, t̂)`, and
`∂²p/∂α∂t (α̂, t̂) ≠ 0`. First prove the local description of the coalescing critical points:
there are `τ` holomorphic near `α̂` with `τ(α̂) = t̂` and `∂²p/∂t² (α, τ(α)) = 0`, and `c`, `U`
holomorphic near `α̂`, respectively `(α̂, 0)`, with `∂p/∂t (α, τ(α) + s) = c(α) + s² U(α, s)`,
`c(α̂) = 0`, `c′(α̂) = ∂²p/∂α∂t (α̂, t̂) ≠ 0` and `U(α̂, 0) = ½ ∂³p/∂t³ (α̂, t̂) ≠ 0`
(holomorphic implicit function theorem and Taylor's formula with holomorphic remainder). Then
there are `ζ`, `η` holomorphic near `α̂` with `ζ(α̂) = 0`, and `w(α, t)` holomorphic near
`(α̂, t̂)` with `w(α̂, t̂) = 0` and `∂w/∂t (α̂, t̂) ≠ 0`, such that `p(α, t) = w³/3 − ζ(α) w + η(α)`
(`exists_cubic_normal_form`). The two zeros of `∂p/∂t` near `t̂` are mapped to the two square
roots of `ζ(α)`, and `f(α, w) = q(α, t) dt/dw` (2.4.20) is holomorphic near `(α̂, 0)`. DLMF's
form `w³/3 + a w² + b w + c` (2.4.18) is the translate `w ↦ w + a`. "Holomorphic" in two
variables is `DifferentiableOn ℂ` on an open subset of `ℂ × ℂ`.

### Examples

- 7.3 for `p(α, t) = t³/3 − αt` at `(0, 0)`: `w = t`, `ζ(α) = α`, `η = 0`, and the critical
  points `t = ±√α` are the square roots of `ζ`.
- For `p(α, t) = t³/3 + α²t` the mixed derivative `∂²p/∂α∂t` vanishes at `(0, 0)`, so 7.3 does
  not apply: the critical points `t = ±iα` coalesce at the rate `α`, not `√α`.
- The checks of 7.2.

### Dependencies

Layer 1 and 5.1; Mathlib's implicit and inverse function theorems
(`HasStrictFDerivAt.implicitFunction`, `HasStrictDerivAt.to_localInverse`), Gaussian integrals.

## Layer 8: Mellin-transform methods

### 8.1 Parseval

DLMF 2.5.3–2.5.5. For `I(x) = ∫₀^∞ f(t) h(xt) dt`, `x > 0`: on a common strip of absolute
convergence of `𝓜f(1 − z)` and `𝓜h(z)`, `𝓜I(z) = 𝓜f(1 − z)𝓜h(z)`; and if
`y ↦ 𝓜f(1 − c − iy)𝓜h(c + iy)` is integrable for `c` in that strip, then
`I(x) = (2πi)⁻¹ ∫_{c−i∞}^{c+i∞} x^{−z} 𝓜f(1 − z)𝓜h(z) dz` (in Mathlib's form, `mellinInv`) at
every `x > 0` at which `I` is continuous. Mathlib's `mellinInv_mellin_eq` takes
`MellinConvergent`, `VerticalIntegrable` and `ContinuousAt`: the first follows from the strip
hypothesis by Tonelli, the second is the integrability hypothesis, and the third is the stated
restriction on `x` (it holds at every `x > 0` when, for example, `h` is bounded and continuous
and `f` is integrable on `(0, ∞)`).

### 8.2 Shifting the line

DLMF 2.5.6–2.5.7. Let `G` be holomorphic on a neighbourhood of the closed strip `d ≤ Re z ≤ c`
except at finitely many poles in `d < Re z < c`, with `sup_{d ≤ Re z ≤ c} |G(z)| → 0` as
`|Im z| → ∞` and `G` integrable on both lines. Then
`(2πi)⁻¹ ∫_{(c)} x^{−z} G = ∑ residue(x^{−z} G) + (2πi)⁻¹ ∫_{(d)} x^{−z} G` (residues by
`TauCeti.Contour.residue`), and the last term is `o(x^{−d})` as `x → 0+` by the Riemann–Lebesgue
lemma; symmetrically for a shift to the right as `x → +∞`.

Also prove the line-shift identity in the form used for Mellin–Barnes integrals
(`integral_vertical_sub_eq_two_pi_mul_sum_residue`). Let `F` be holomorphic on a neighbourhood of
`d ≤ Re t ≤ c` except at a finite set `P` of simple poles in `d < Re t < c`, with
`y ↦ F(d + iy)` and `y ↦ F(c + iy)` integrable, and with `∫_d^c F(x + iT) dx → 0` as `T → +∞`
and as `T → −∞`. Then `∫_ℝ F(c + iy) dy − ∫_ℝ F(d + iy) dy = 2π ∑_{p ∈ P} Res(F, p)`. Prove:
- **the residues:** near each `p`, `F(t) = φ(t)/(t − p)` with `φ` holomorphic, and
  `φ(p) = TauCeti.Contour.residue F p`. This covers removable singularities, where `φ(p) = 0`;
- **the iteration:** for decreasing lines `c₀ > c₁ > ⋯` with exactly one simple pole `p_n` in
  each strip `c_{n+1} < Re t < c_n`, each strip satisfying the hypotheses above, prove the
  partial-sum identity `∫_ℝ F(c₀ + iy) dy − ∫_ℝ F(c_N + iy) dy = 2π ∑_{n<N} Res(F, p_n)`. If the
  integrals on `c_N` tend to `0`, the partial residue sums tend to `(2π)⁻¹ ∫_ℝ F(c₀ + iy) dy`;
  when the residue series is summable, this is a `HasSum` statement.

The proof subtracts the finite principal parts and applies the rectangle Cauchy theorem to the
holomorphic remainder. Line integrals use `dy`; the contour integrals use `dt = i dy`, which
gives the factor `2πi`.

### 8.3 Continued Mellin transforms

DLMF 2.5.17–2.5.28. Let `f` be locally integrable on `(0, ∞)`. For an expansion
`f(t) ∼ ∑ a_k t^{α_k}` at `0+` (strictly increasing `Re α_k`), define for `n ∈ ℕ`

```text
mellinContAtZero f a α n z = ∫₀¹ t^{z−1} (f(t) − ∑_{k<n} a_k t^{α_k}) dt + ∑_{k<n} a_k/(z + α_k)
                             + ∫₁^∞ t^{z−1} f(t) dt,
```

and for an expansion `f(t) ∼ ∑ b_k t^{−β_k}` at `+∞`,

```text
mellinContAtTop f b β n z = ∫₀¹ t^{z−1} f(t) dt + ∫₁^∞ t^{z−1} (f(t) − ∑_{k<n} b_k t^{−β_k}) dt
                            − ∑_{k<n} b_k/(z − β_k).
```

Prove (for `mellinContAtZero`, `mellinContAtZero_spec`): each is holomorphic on its domain
(`−Re α_n < Re z` with `Re z < b` for `f = O(t^{−b})` at `∞`, respectively `Re z < Re β_n` with
`Re z > −c` for `f = O(t^c)` at `0+`) away from the points `−α_k`, respectively `β_k`; it is
independent of `n` where two domains overlap; it equals `mellin f z` where that converges; and
`mellinContAtZero f a α n z − ∑_{k<n} a_k/(z + α_k)` is holomorphic on the whole domain, so the
principal parts are `a_k/(z + α_k)` (2.5.25) and `−b_k/(z − β_k)` (2.5.27) when the exponents are
distinct. When moreover `Re α_k → ∞` (respectively `Re β_k → ∞`), as in DLMF 2.5.17–2.5.18,
these functions define a single meromorphic continuation of `mellin f` to the half-plane
`Re z < b` (respectively `Re z > −c`); strict increase alone allows a bounded sequence of real
parts and a bounded domain of continuation.

**Checks.**

- `mellinContAtZero f a α 0 z = mellin f z` and `mellinContAtTop f b β 0 z = mellin f z` wherever
  the integral defining `mellin f z` converges absolutely.
- For `f(t) = e^{−t}`, `a_k = (−1)^k/k!`, `α_k = k`: `mellinContAtZero f a α n` is `Γ` on
  `−n < Re z` away from `0, −1, …, −(n − 1)`, with residue `(−1)^k/k!` at `−k`.
- For `f(t) = (1 + t)⁻¹`, `b_k = (−1)^k`, `β_k = k + 1`: `mellin f z = π/sin(πz)` on
  `0 < Re z < 1`, and `mellinContAtTop f b β n` continues it to `0 < Re z < n + 1` with
  principal part `−(−1)^k/(z − k − 1)` at `k + 1`, the residue `(−1)^{k+1}` of `π/sin(πz)`.

**Oscillatory tails** (DLMF 2.5.18 with `κ ≠ 0`). For real `κ ≠ 0` define the model integral
`oscTail κ w = i sgn(κ) e^{iκ} ∫₀^∞ (1 + i sgn(κ) y)^{w−1} e^{−|κ| y} dy` (the ray from `1`
rotated to the vertical). Prove that `oscTail κ` is entire and equals the improper integral
`lim_{T→∞} ∫₁^T u^{w−1} e^{iκu} du` for `Re w < 1` (`oscTail_spec`). Let `f` be locally
integrable on `[1, ∞)` with `f(t) − e^{iκt^p} ∑_{k<n} b_k t^{−β_k} = O(t^{−Re β_n})` as `t → ∞`
for every `n`, where `p > 0`, `Re β_k` is strictly increasing and `Re β_k → ∞`. Define

```text
mellinContOscTop f κ p b β n z = ∫₁^∞ t^{z−1} (f(t) − e^{iκt^p} ∑_{k<n} b_k t^{−β_k}) dt
                                 + p⁻¹ ∑_{k<n} b_k oscTail κ ((z − β_k)/p).
```

Prove that it is holomorphic on `Re z < Re β_n`, independent of `n` where two domains overlap,
and equal to `∫₁^∞ t^{z−1} f(t) dt` for `Re z < Re β₀`; hence this tail transform (DLMF's `𝓜h₂`
of 2.5.24, for `h = f`) continues to an entire function (`exists_entire_mellinContOscTop`). That
is a statement about the tail only: the full transform `∫₀¹ + ∫₁^∞` (2.5.28) is thereby continued
to the half-plane where `∫₀¹ t^{z−1} f(t) dt` converges, `Re z > −c` for `f = O(t^c)` at `0+`,
and its continuation further left depends on the behaviour of `f` at `0+` (`mellinContAtZero`).

**Checks.**

- `oscTail κ 1 = i e^{iκ}/κ = −e^{iκ}/(iκ)`, while the improper integral `∫₁^T e^{iκu} du` has no
  limit: the hypothesis `Re w < 1` of `oscTail_spec` is needed.
- `oscTail (−κ) (conj w) = conj (oscTail κ w)`: the sign of `κ` reflects the rotation.
- For `f(t) = e^{iκt}` (`p = 1`, `β_k = k`, `b₀ = 1` and `b_k = 0` for `k ≥ 1`):
  `mellinContOscTop f κ 1 b β n z = oscTail κ z` for every `n ≥ 1`.

### 8.4 Handelsman–Lew

DLMF 2.5.29–2.5.36. Under 2.5.17–2.5.20 (with `f`, `h` locally integrable on `(0, ∞)` and
`Re α_s, Re β_s → ∞`), with the truncations 2.5.21–2.5.24 and the continuations of 8.3:
`I = ∑ I_{jk}`, `I₂₁(x) = 0` for `x ≥ 1`, and each pair `𝓜f_j(1 − z)`, `𝓜h_k(z)` converges
absolutely in the domain `D_{jk}` of DLMF Table 2.5.2. If `I_{jk}` has the Parseval
representation 2.5.33 at `p_{jk} ∈ D_{jk}` and 2.5.34 holds for some `q_{jk} > p_{jk}`, then
2.5.35 holds with `E_{jk}(x) = o(x^{−q_{jk}})` as `x → +∞`.

### 8.5 Laplace transforms with a small parameter

DLMF 2.5.37–2.5.44. Let `h` be locally integrable on `(0, ∞)` and satisfy 2.5.18 with `κ = 0`
(including `Re β_n → ∞`, so that the first sum below is finite) and 2.5.20 with `c > −1`, and
`𝓛h(ζ) = ∫₀^∞ h(t) e^{−ζt} dt`. Prove the exact identity 2.5.43 for every integer `l ≥ 2` and
`δ ∈ (0, 1)`, with the residues computed by `TauCeti.Contour.residue`, the continued transforms
of 8.3, and the remainder `O(ζ^{l−δ−1})` as `ζ → 0+`. If no `β_n` is a positive integer, deduce
2.5.44 in the form: for every real `L`,

```text
𝓛h(ζ) − ∑_{n : Re β_n < L + 1} b_n Γ(1 − β_n) ζ^{β_n − 1} − ∑_{n < L} (−ζ)ⁿ/n! · 𝓜h(n + 1)
    = O(ζ^L)    as ζ → 0+,
```

with `𝓜h(n + 1)` the continued transform.

### 8.6 The Gamma function on vertical strips

For every real `u ≤ v` and `η > 0` there are `C > 0` and `K : ℕ` such that
`|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` whenever `u ≤ x ≤ v` and `|x + iy + n| ≥ η` for every
`n : ℕ` (`exists_norm_Gamma_le`). Deduce the cases used elsewhere:
- all heights on a closed strip in `Re z > 0`;
- all heights on a fixed line `Re z = x` with `x ∉ {0, −1, −2, …}`;
- `|y| ≥ 1` on any bounded strip;
- `Complex.VerticalIntegrable` for `Γ` and for `Γ` times `e^{θ|y|}` with `θ < π/2`, on every
  line `Re z = x` with `x ∉ {0, −1, −2, …}`.

Route: ZerosOfLFunctions §1.3 (DLMF 5.11.9) for large `|y|`, after exponentiating its bounded
error; continuity of `Γ` off its poles and compactness for bounded `|y|`.

### 8.7 Exponential Mellin inversion

The Cahen–Mellin integral. For real `c > 0` and `Re w > 0`, `y ↦ Γ(c + iy) w^{−c−iy}` is
integrable and `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}`, with the principal power
(`integral_Gamma_mul_cpow_neg`). Route: Mathlib's `mellinInv_mellin_eq` for `x ↦ e^{−x}` (with
`Complex.GammaIntegral_eq_mellin`) at real `w > 0`, then the identity theorem in `w`, with locally
uniform domination from 8.6 (`|w^{−iy}| = e^{y arg w}` and `|arg w| < π/2`).

### Examples

- DLMF 2.5.45–2.5.48, for 8.5: for `h(t) = 1/(1 + t)`, the residues 2.5.46–2.5.47 and, for every
  `n`, `∫₀^∞ e^{−ζt}/(1 + t) dt − ∑_{k<n} (−log ζ + ψ(k + 1)) ζ^k/k! = O(ζⁿ log(1/ζ))` as
  `ζ → 0+`.
- 8.2 for `F(t) = 1/(t(1 − t))`, `c = ½`, `d = −½`: the only pole is `0`, with residue `1`; the
  integral on `Re t = ½` is `∫ dy/(¼ + y²) = 2π`, and the integral on `Re t = −½` is `0`
  (shift it to `−∞`, where `F = O(|t|^{−2})`, past no further poles).
- 8.6 on the line `x = ½`: `|Γ(½ + iy)|² = π/cosh(πy)`, so the bound holds with `K = 0` and
  `C = √(2π)`.
- 8.7 at `w = 1`: `∫_ℝ Γ(c + iy) dy = 2π/e` for every `c > 0`.
- The checks of 8.3.

### Dependencies

Layer 1 and 4.1; Mathlib `mellin`, `mellinInv`, `mellinInv_mellin_eq`,
`mellin_differentiableAt_of_isBigO_rpow`, `Complex.digamma`, the rectangle Cauchy theorem; the
residue API of ContourIntegration; ZerosOfLFunctions §1.3 (through 8.6) for the decay of `Γ` on
vertical lines.

## Layer 9: distributional methods

The results are stated intrinsically, as identities and bounds between integrals. The
distributions of DLMF §2.6 (the space of rapidly decreasing test functions and the distributions
2.6.11–2.6.16) are a proof route, not part of the statements.

### 9.1 The Beta-type integral

DLMF 2.6.4. For `Re α > 0`, `Re β > 0` and `x > 0`,
`∫₀^∞ t^{α−1}(x + t)^{−α−β} dt = Γ(α)Γ(β)/Γ(α+β) · x^{−β}`.

### 9.2 Stieltjes transforms

DLMF 2.6.8–2.6.30. Let `f` be locally integrable on `[0, ∞)` with
`f(t) = ∑_{s<n} a_s t^{−s−α} + f_n(t)`, `f_n(t) = O(t^{−n−α})` as `t → ∞`, for every `n`, where
`0 < α ≤ 1`. For `z` in the slit plane:
- if `0 < α < 1`, the exact identity 2.6.27 holds (`stieltjes_eq`), with `R_n` as in 2.6.30 and
  `(s − 1)! c_s = (−1)^s 𝓜f(s)`, where `𝓜f(s) = mellinContAtTop f a (k ↦ k + α) n s`;
- if `α = 1`, the exact identity 2.6.28 holds, with
  `d̃_s = lim_{z→s+1} (𝓜f(z) + a_s/(z − s − 1))` (2.6.29), the continued transform of 8.3;
- `R_n(z) = O(|z|^{−n−α})` for `0 < α < 1`, and `O(|z|^{−n−1} log |z|)` for `α = 1`, as
  `z → ∞` in `|ph z| ≤ π − δ`.

### 9.3 Fractional integrals

DLMF 2.6.33–2.6.47. With `I^μ f(x) = Γ(μ)⁻¹ ∫₀^x (x − t)^{μ−1} f(t) dt` (`μ > 0`), `f` as in 9.2
and moreover continuous on `(0, ∞)`, and the repeated integrals `f_{n,0} = f_n`,
`f_{n,j}(t) = (−1)^j/(j − 1)! · ∫_t^∞ (τ − t)^{j−1} f_n(τ) dτ` for `1 ≤ j ≤ n` (compare 2.6.15;
the decay `f_n = O(t^{−n−α})` guarantees convergence in this range and not beyond it, and this
is the range used by 2.6.47). Local integrability alone does not suffice: for `0 < μ < 1` a
locally integrable `f` with a singularity `|t − 1|^{−3/4}` makes `I^{1/4} f(1)` diverge. Under
these hypotheses the integrals `I^μ f(x)` and `I^μ(t^{n−j} f_{n,j})(x)` converge absolutely for
every `x > 0`, and the exact identities 2.6.45 (`0 < α < 1`) and 2.6.46 (`α = 1`) hold for every
`x > 0`, with `δ_n` as in 2.6.47 and `c_s`, `d_s` as in 9.2 and 2.6.21. Reciprocal Gamma factors
are `(Gamma _)⁻¹`, which vanish at the poles; with this reading the identities hold for every
`μ > 0`, integers included.

### 9.4 Regularization

DLMF 2.6.54–2.6.62. Let `f` be locally integrable and `h` continuous on `(0, ∞)` (so that
`t ↦ f(t) h(xt)` is integrable on compact subsets of `(0, ∞)` for every `x > 0`; two locally
integrable functions need not have this property), with, for every `n`,
`f = ∑_{s<n} a_s t^{s+α−1} + f_n`, `f_n(t) = O(t^{n+α−1})` as `t → 0+`, and
`h = ∑_{s<n} b_s t^{−s−β} + h_n`, `h_n(t) = O(t^{−n−β})` as `t → ∞`, where `0 < α, β ≤ 1` and
`α ≠ β`; and with `h(t) = O(t^{−c})` as `t → 0+` for some `c < α`, and `f(t) = O(t^{−ρ})` as
`t → ∞` for some `ρ > 1 − β`. Then for every `x > 0` and `n` both integrals below converge
absolutely and

```text
∫₀^∞ f(t) h(xt) dt = ∑_{j<n} a_j 𝓜h(j + α) x^{−j−α} + ∑_{k<n} b_k 𝓜f(1 − k − β) x^{−k−β}
                     + ∫₀^∞ f_n(t) h_n(xt) dt,
```

with the continued transforms `𝓜h = mellinContAtTop h b (k ↦ k + β) n` and
`𝓜f = mellinContAtZero f a (k ↦ k + α − 1) n`; and the last integral is `O(x^{−n−min(α,β)})` as
`x → +∞`.

### Examples

- DLMF 2.6.1–2.6.7, for 9.2: for `f(t) = (1 + t)^{−1/3}` the expansion 2.6.7, including its
  second series, and the failure of the formal expansion 2.6.6.
- 9.1 at `α = β = 1`: `∫₀^∞ (x + t)^{−2} dt = x⁻¹`.

### Dependencies

Layer 1 and 8.3; Mathlib `Complex.betaIntegral`, `Complex.Gamma`, Fubini and integration by
parts.

## Layer 10: linear differential equations in the complex domain

The equation is `w″ + f(z) w′ + g(z) w = 0` (DLMF 2.7.1).

### 10.1 Volterra integral equations

Olver (1997), Chapter 6, §10. The existence and error-bound theorems of 10.4, 11.1 and 11.4 are
reductions to this result, which is stated for complex-valued functions of a real variable (in
the complex domain it is applied along paths parametrized by a real variable). Let
`−∞ ≤ a < b ≤ ∞`, let `K(x, v)` be continuous on `{a < x ≤ v < b}` with
`|K(x, v)| ≤ P(x) Q(v)` for continuous `P, Q ≥ 0`, and let `J`, `ψ` be continuous on `(a, b)`
with `Φ(x) = ∫_x^b Q|J|` and `Ψ(x) = ∫_x^b P Q |ψ|` finite for every `x ∈ (a, b)`. Then the
equation `h(x) = ∫_x^b K(x, v) (J(v) + ψ(v) h(v)) dv` has a continuous solution on `(a, b)` with
`|h(x)| ≤ P(x) Φ(x) e^{Ψ(x)}` (`exists_volterra_solution`, for `b = ∞`); it is the unique
continuous solution with `h = O(P)` on `[x, b)` for every `x`. If also `K(x, x) = 0` and
`∂K/∂x` is continuous with `|∂K/∂x (x, v)| ≤ P₁(x) Q(v)`, then `h` is `C¹` and
`|h′(x)| ≤ P₁(x) Φ(x) e^{Ψ(x)}`. When `J = ψ` and `P` is a constant `P₀`, the sharper bound
`|h(x)| ≤ e^{P₀ Φ(x)} − 1` holds. The proof is the Picard iteration, with `n`th difference
bounded by `P Φ Ψⁿ/n!`.

### 10.2 Ordinary points

If `f` and `g` are holomorphic on the disc `|z − z₀| < r`, then for all `w₀`, `w₁` there is a
unique solution holomorphic on the disc with `w(z₀) = w₀`, `w′(z₀) = w₁`; its Taylor
coefficients satisfy the recursion obtained by equating coefficients, and the Taylor series
converges on the whole disc.

### 10.3 Regular singularities

DLMF 2.7.2–2.7.6. Let `(z − z₀) f(z) = ∑ f_s (z − z₀)^s` and `(z − z₀)² g(z) = ∑ g_s (z − z₀)^s`
on `0 < |z − z₀| < r`, with indicial polynomial `Q(α) = α(α − 1) + f₀α + g₀` and roots `α₁`,
`α₂`, `Re α₁ ≥ Re α₂`. On the slit punctured disc (`z − z₀ ∈ slitPlane`, `|z − z₀| < r`,
principal powers and logarithm):
- for each root `ρ` with `Q(ρ + s) ≠ 0` for all `s ≥ 1` (always `ρ = α₁`, and `ρ = α₂` when
  `α₁ − α₂ ∉ ℕ`), the coefficients of 2.7.5 with `a₀ = 1` give a series convergent on
  `|z − z₀| < r` and the solution `(z − z₀)^ρ ∑ a_s (z − z₀)^s` (2.7.4;
  `regularSingular_solution`);
- if `α₁ − α₂ = N ∈ ℕ`, there is a solution of the form 2.7.6,
  `(z − z₀)^{α₂} ∑_{s≠N} b_s (z − z₀)^s + c w₁(z) log(z − z₀)`, with the series convergent on
  the disc, normalized by `c = 1` when `N = 0` and by `b₀ = 1` when `N ≥ 1` (the coefficient
  `b_N` is omitted); its coefficients are determined by the equation;
- the two solutions have nonvanishing Wronskian.

### 10.4 Irregular singularity of rank one at infinity

DLMF 2.7.7–2.7.18. Let `f(z) = ∑ f_s z^{−s}`, `g(z) = ∑ g_s z^{−s}` converge for `|z| > a`, and
let the roots `λ₁ ≠ λ₂` of `λ² + f₀λ + g₀` (2.7.9), `μ_j` (2.7.10) and `a_{s,j}` (2.7.11,
`a_{0,j} = 1`) define the formal solutions 2.7.8. Work in logarithmic coordinates: a solution is
a function `W` on `{ζ | log a < Re ζ}` solving `W″ + (e^ζ f(e^ζ) − 1) W′ + e^{2ζ} g(e^ζ) W = 0`,
the equation of `w(e^ζ) = W(ζ)`. Fix `ℓ = Complex.log (λ₂ − λ₁)` and write
`((λ₂ − λ₁) z)^{μ_j} = exp(μ_j (ζ + ℓ))`. Prove:
- **existence and uniqueness** (2.7.14–2.7.16; `exists_rankOne_solution` for `j = 1`): there are
  unique solutions `W₁`, `W₂` with
  `W_j(ζ) ∼ exp(λ_j e^ζ) exp(μ_j(ζ + ℓ)) ∑ a_{s,j} e^{−sζ}`, the remainder after `N` terms being
  `O(|exp(λ_j e^ζ + μ_j(ζ + ℓ))| e^{−N Re ζ})`, as `Re ζ → ∞` with
  `−3π/2 + δ ≤ Im(ζ + ℓ) ≤ 3π/2 − δ` (`j = 1`), respectively `−π/2 + δ ≤ Im(ζ + ℓ) ≤ 5π/2 − δ`
  (`j = 2`), for every `δ > 0`; and they are linearly independent;
- **Stokes multipliers** (2.7.17): there are constants `C₁`, `C₂` with
  `W₁(ζ) = e^{2πiμ₁} W₁(ζ − 2πi) + C₁ W₂(ζ)` and `W₂(ζ) = e^{−2πiμ₂} W₂(ζ + 2πi) + C₂ W₁(ζ)`;
- **late coefficients** (2.7.12–2.7.13, 2.7.18): with `Λ₁ = −i e^{(μ₂−μ₁)πi} C₁/(2π)` and
  `Λ₂ = i C₂/(2π)`, for every `J`, as `s → ∞`,

```text
a_{s,1} − Λ₁ (λ₁ − λ₂)^{−s} ∑_{j<J} a_{j,2} (λ₁ − λ₂)^j Γ(s + μ₂ − μ₁ − j)
    = O(|λ₁ − λ₂|^{−s} |Γ(s + μ₂ − μ₁ − J)|),
```

  and symmetrically for `a_{s,2}`. Consequently, if `Λ₁ ≠ 0` then `a_{s,1}` grows factorially
  and `∑ a_{s,1} z^{−s}` diverges for every `z`, and if that series terminates then `Λ₁ = 0`;
  symmetrically for `j = 2`. When `Λ_j = 0` the estimate says only that `a_{s,j}` is smaller
  than every term of the factorial scale: the series may then converge without terminating, and
  nothing about termination follows.

### 10.5 Fabry's transformation

DLMF 2.7.19. If `f₀² = 4g₀`, then `W(t) = e^{f₀t²/2} w(t²)` solves `W″ + F(t) W′ + G(t) W = 0`
on `|t| > √a`, with `F(t) = 2t (f(t²) − f₀) − 1/t` and
`G(t) = 4t² (g(t²) − ½ f₀ f(t²) + ¼ f₀²)`, both convergent series in `t^{−1}`; the constant terms
are `F₀ = 0`, `G₀ = 4g₁ − 2f₀f₁`, and `G₁ = 0`. Hence either `G₀ ≠ 0`, and the characteristic
equation `λ² + G₀ = 0` of the new equation has unequal roots, or `G₀ = 0`, and `t = ∞` is a
regular singularity of the new equation.

### Examples

- 10.3 for `f = 0`, `g(z) = −2z^{−2}` at `z₀ = 0`: the indicial roots are `2` and `−1`
  (`N = 3`); the solution for `ρ = 2` is `z²` (all `a_s = 0` for `s ≥ 1`), and the second
  solution `z^{−1}` has `c = 0`.
- 10.4 for `f(z) = −1 + 2z^{−2}` and `g(z) = −z^{−2} − 2z^{−3} + z^{−4}`: the characteristic
  roots are `0` and `1`, `μ₁ = μ₂ = 0`, the solutions are `exp(1/z)` and `exp(z + 1/z)`, both
  normalized formal series are the convergent nonterminating series `∑ z^{−s}/s!`, and
  `C₁ = C₂ = 0`.
- 10.1 with `K = 0`: the solution is `h = 0`, and the bound is `0 ≤ P Φ e^Ψ`.

### Dependencies

Mathlib power series (`HasFPowerSeriesOnBall`), Cauchy estimates, `ODE_solution_unique` and
`IsPicardLindelof` (for 10.2, through the real parametrization of segments), `Complex.log`,
`Complex.Gamma`. The rank-one theory applies 10.1 to the Volterra equations of Olver (1997,
Chapter 7, §2) along progressive paths, and uses the Cauchy integral formula; the
late-coefficient theorem uses Olver (1994).

## Layer 11: the Liouville–Green approximation and equations with a large parameter

### 11.1 The Liouville–Green theorem

DLMF 2.7.20–2.7.25. On an open interval `(a₁, a₂)` with `−∞ ≤ a₁ < a₂ ≤ ∞`, let `f` be positive
and `C²`, `g` continuous, `c ∈ (a₁, a₂)`, and `ξ(x) = ∫_c^x f^{1/2}`. Put
`Φ = f^{−1/4} (f^{−1/4})″ − g f^{−1/2}` and `V_j(x) = |∫_{a_j}^x |Φ||` (2.7.25). If `Φ` is
integrable on `(a₁, x]` for every `x` (respectively on `[x, a₂)` for every `x`), there is a `C²`
solution `w₁` (respectively `w₂`) of `w″ = (f + g) w` of the form 2.7.21–2.7.22,
`w_{1,2}(x) = f^{−1/4}(x) exp(±ξ(x)) (1 + ε_{1,2}(x))`, with
`|ε_j(x)|, ½ f^{−1/2}(x) |ε_j′(x)| ≤ exp(½ V_j(x)) − 1` (2.7.23; `liouvilleGreen_recessive` for
`w₂` with `a₂ = ∞`).

### 11.2 Recessive and dominant solutions

DLMF 2.7.26–2.7.30. If `∫_{a₁}^{a₂} |Φ| < ∞`, then `w₁ ∼ f^{−1/4} e^{ξ}` as `x → a₁+` and
`w₂ ∼ f^{−1/4} e^{−ξ}` as `x → a₂−`. If `ξ → −∞` as `x → a₁+`, then `w₁` is the unique solution
with its property; if `ξ → +∞` as `x → a₂−`, then `w₂` is the unique solution with its property.
Without unboundedness there is no uniqueness: on `(0, 1)` with `f = 1`, `g = 0`, every
`e^{x−c} + C sinh x` is `∼ e^{x−c}` as `x → 0+`. If `ξ` is unbounded at both ends, there are
moreover solutions `w₃ ∼ f^{−1/4} e^{ξ}` as `x → a₂−` and `w₄ ∼ f^{−1/4} e^{−ξ}` as `x → a₁+`,
not unique, with `w₁/w₄ → 0` as `x → a₁+` (2.7.30) and `w₂/w₃ → 0` as `x → a₂−`.

### 11.3 The Liouville transformation

DLMF 2.8.1–2.8.5. If `z = z(ξ)` is `C³` on an interval with `ż > 0` and `w` solves
`d²w/dz² = (u² f(z) + g(z)) w`, then `W = ż^{−1/2} w` solves 2.8.3 with `ψ` given by 2.8.4.
With `ż² f(z) = 1`, `ξ = ∫ f^{1/2}` (Case I, 2.8.5), the transformed equation is
`d²W/dξ² = (u² + ψ(ξ)) W` (2.8.10).

### 11.4 Case I: no transition points

DLMF 2.8.10–2.8.13, on a real interval `Δ = (b₁, b₂)` with `ψ` `C^∞` on `Δ` and `u → +∞`. Let
`A₀ = 1` and let `A_{s+1}` be any `C^∞` functions with `A_{s+1}′ = −½ A_s″ + ½ ψ A_s` (2.8.13,
the constants of integration being arbitrary). Fix `α₁, α₂ ∈ Δ`, and let `Δ₁ = [α₁, b₂)` and
`Δ₂ = (b₁, α₂]` (the regions `Δ_j(α_j)` of DLMF for real `ξ`). If `∫_{Δ_j} |A₁′|` and
`∫_{Δ_j} |A_n′|` are finite, there are solutions `W_{n,1}(u, ξ)` and `W_{n,2}(u, ξ)` with
`e^{−uξ} W_{n,1} − ∑_{s<n} A_s(ξ) u^{−s} = O(u^{−n})` uniformly for `ξ ∈ Δ₁`
(`exists_caseI_solution`), and `e^{uξ} W_{n,2} − ∑_{s<n} (−1)^s A_s(ξ) u^{−s} = O(u^{−n})`
uniformly for `ξ ∈ Δ₂`. The expansions differentiate:
`e^{−uξ} ∂_ξW_{n,1} − ∑_{s<n} (u A_s + A_s′) u^{−s} = O(u^{1−n})` uniformly on `Δ₁`, and
`e^{uξ} ∂_ξW_{n,2} − ∑_{s<n} (−1)^s (−u A_s + A_s′) u^{−s} = O(u^{1−n})` uniformly on `Δ₂`.
Uniformity is along `𝓟 Δ_j ×ˢ atTop`, as pinned.

### Examples

- DLMF 2.7.31–2.7.34, for 11.2: on `(1, ∞)`, `w″ = (x + log x) w` has a recessive solution
  `w₂(x) ∼ x^{−1/4−√x} exp(2x^{1/2} − (2/3)x^{3/2})` and a dominant solution
  `w₃(x) ∼ x^{−1/4+√x} exp((2/3)x^{3/2} − 2x^{1/2})` as `x → +∞`.
- 11.1 for `f = 1`, `g = 0`: `Φ = 0`, `ε = 0`, and `w₂ = e^{−(x−c)}` exactly.
- 11.4 for `ψ = 0`: `A_s = 0` for `s ≥ 1` is admissible, and `W_{n,1} = e^{uξ}` exactly.

### Dependencies

Layer 1 and 10.1; Mathlib `ODE_solution_unique`, `IsPicardLindelof`, Grönwall's inequality
`norm_le_gronwallBound_of_norm_deriv_right_le`, and the fundamental theorem of calculus; Tau
Ceti's Wronskian lemmas `TauCeti.wronskian_eq_of_hasDerivAt`.

## Layer 12: difference equations

The equation is `w(n + 2) + f(n) w(n + 1) + g(n) w(n) = 0` for `n ∈ ℕ` (DLMF 2.9.1), with
`f(n) ∼ ∑ f_s n^{−s}` and `g(n) ∼ ∑ g_s n^{−s}` as `n → ∞` (Poincaré expansions along `atTop`
on `ℕ`) and `g₀ ≠ 0`. Solutions are sequences `ℕ → ℂ`; they form a two-dimensional space,
parametrized by `(w(0), w(1))`.

The asymptotic statements below assume in addition `g(n) ≠ 0` for every `n`, so that the
recurrence can also be run backwards and every solution on a tail `n ≥ n₀` extends uniquely to a
solution on `ℕ`. Without it they fail: for `f(0) = g(0) = 0` and `f(n) = −3`, `g(n) = 2` for
`n ≥ 1` (roots `1`, `2`), every solution has `w(2) = 0`, so no solution has a nonzero constant
tail, and `w = (1, 0, 0, …)` is a nonzero solution. The general case is the **tail form**: since
`g₀ ≠ 0` there is `n₀` with `g(n) ≠ 0` for `n ≥ n₀`, and every statement below holds for the
solutions of the equation for `n ≥ n₀` (sequences on `ℕ` satisfying it for `n ≥ n₀`, two of them
identified when they agree for `n ≥ n₀`); prove this form too, as the case of the shifted
equation `n ↦ n + n₀`, whose coefficients again have Poincaré expansions in `n^{−1}`.

The summation estimates are built here (Wong and Li 1992), as the discrete analogue of 10.1: for
`h(n) = ∑_{m>n} K(n, m) (J(m) + ψ(m) h(m))` with `|K(n, m)| ≤ P(n) Q(m)`,
`Φ(n) = ∑_{m>n} Q|J|` and `Ψ(n) = ∑_{m>n} P Q |ψ|` finite, there is a solution with
`|h(n)| ≤ P(n) Φ(n) e^{Ψ(n)}`, unique among solutions with `h = O(P)`.

### 12.1 Distinct characteristic roots

DLMF 2.9.3–2.9.8. If `f₀² ≠ 4g₀`, with `ρ_j` the roots of 2.9.5, `α_j` as in 2.9.6 and `a_{s,j}`
as in 2.9.7 (`a_{0,j} = 1`), there are solutions with
`w_j(n) − ρ_jⁿ n^{α_j} ∑_{s<N} a_{s,j} n^{−s} = O(|ρ_j|ⁿ n^{Re α_j − N})` for every `N`
(`exists_difference_solution`), and they are linearly independent. If `|ρ₂| > |ρ₁|`, or
`|ρ₂| = |ρ₁|` and `Re α₂ > Re α₁`, then `w₁` is recessive (`w₁/w → 0` for every solution `w`
independent of `w₁`) and is unique up to a constant factor; when `|ρ₁| = |ρ₂|` and
`Re α₁ = Re α₂`, both solutions are unique.

### 12.2 Coincident characteristic roots

DLMF 2.9.9–2.9.13. If `f₀² = 4g₀` with common root `ρ`: when `2g₁ ≠ f₀f₁`, there are solutions
2.9.9 with `κ` and `α` as in 2.9.10, `c₀ = 1` and the higher `c_s` determined by formal
substitution (the expansion is in powers of `n^{−1/2}`); when `2g₁ = f₀f₁`, with `α₁`, `α₂` the
roots of 2.9.11 labelled so that `Re α₁ ≤ Re α₂`, there are solutions 2.9.12 if `α₂ − α₁ ∉ ℤ`,
and solutions 2.9.12 (`j = 1`) and 2.9.13 if `α₂ − α₁ ∈ ℕ`, with the normalizations stated
there. With this labelling the two alternatives exhaust the case.

### Examples

- 12.1 for `w(n + 2) − 3w(n + 1) + 2w(n) = 0`: `ρ₁ = 1`, `ρ₂ = 2`, `α₁ = α₂ = 0` by 2.9.6, every
  `a_{s,j}` with `s ≥ 1` vanishes, and the solutions are `1` and `2ⁿ`; `w₁ = 1` is recessive.
- The counterexample above, for the hypothesis `g(n) ≠ 0`.

### Dependencies

Layer 1; Mathlib `Finset` sums, `Real.rpow`.

## Layer 13: sums and sequences

### 13.1 Euler–Maclaurin

DLMF 2.10.1. For integers `a < n`, `m ≥ 1` and `f` `C^{2m}` on `[a, n]`, with derivatives taken
within `[a, n]` (`sum_Icc_eq_eulerMaclaurin`):

```text
∑_{j=a}^n f(j) = ∫_a^n f + ½f(a) + ½f(n) + ∑_{s=1}^{m−1} B_{2s}/(2s)! (f^{(2s−1)}(n) − f^{(2s−1)}(a))
                 + ∫_a^n (B_{2m} − B̃_{2m}(x))/(2m)! f^{(2m)}(x) dx.
```

### 13.2 Abel–Plana

DLMF 2.10.2. Let `a < n` be integers and let `f` be holomorphic on the open strip
`a < Re z < n` and continuous on its closure, with `f(z) = o(e^{2π|Im z|})` as `Im z → ±∞`
uniformly in the strip, `f` real on `[a, n]`, and `y ↦ Im f(a + iy)/(e^{2πy} − 1)` and
`y ↦ Im f(n + iy)/(e^{2πy} − 1)` integrable on `(0, ∞)`. Prove:
- the exact formula (`sum_Icc_eq_abelPlana`)

```text
∑_{j=a}^n f(j) = ∫_a^n f + ½f(a) + ½f(n) − 2 ∫₀^∞ Im f(a + iy)/(e^{2πy} − 1) dy
                 + 2 ∫₀^∞ Im f(n + iy)/(e^{2πy} − 1) dy;
```

- if moreover `f^{(2m)}` is continuous on the closed strip, the expansion of the last integral
  as `∑_{s=1}^m B_{2s}/(2s)! f^{(2s−1)}(n)` with remainder
  `2(−1)^m/(2m)! ∫₀^∞ Im f^{(2m)}(n + iϑ y) y^{2m}/(e^{2πy} − 1) dy`, where `ϑ = ϑ(y) ∈ (0, 1)`
  is the Lagrange intermediate point of Taylor's theorem in `y`; in particular the remainder is
  bounded by `2/(2m)! ∫₀^∞ sup_{0≤ϑ≤1} |Im f^{(2m)}(n + iϑy)| y^{2m}/(e^{2πy} − 1) dy`. Together
  these give DLMF 2.10.2.

### 13.3 Examples of Euler–Maclaurin

DLMF 2.10.3–2.10.8.
- **2.10.3–2.10.6**: for `S(n) = ∑_{j=1}^n j log j` and every `m ≥ 2`, the expansion 2.10.4 with
  `R_m` as in 2.10.5; `R_m(n)` has the sign of the `s = m` term of 2.10.4 and is bounded by it in
  absolute value; and `C = (γ + log 2π)/12 − ζ′(2)/(2π²) = 1/12 − ζ′(−1)`, with Mathlib's
  `riemannZeta` and `Real.eulerMascheroniConstant` (the limit form is `tendsto_sum_mul_log_sub`).
- **2.10.7**: for real `α ≠ −1`,
  `∑_{j=1}^{n−1} j^α ∼ ζ(−α) + n^{α+1}/(α+1) ∑ C(α+1, s) B_s n^{−s}`, a generalized expansion
  with respect to `n^{α+1−s}` and the constant term, with `C(α+1, s)` the binomial coefficient
  `Ring.choose`; when truncated at `s = 2m − 1` with `m ≥ (α + 1)/2`, the remainder is bounded by
  the first neglected term and has its sign.
- **2.10.8**: `∑_{j=1}^{n−1} 1/j ∼ log n + γ − 1/(2n) − ∑_{s≥1} B_{2s}/(2s) n^{−2s}`, with the
  same remainder property.

### 13.4 Summation by parts

DLMF 2.10.9–2.10.18. The identity 2.10.9–2.10.10 is Mathlib's `Finset.sum_range_by_parts`.
**Example**: for real `α` and `β` with `e^{iβ} ≠ 1`, prove 2.10.12–2.10.17 and the approximation
`∑_{j=1}^{n−1} e^{ijβ} j^α = e^{inβ}/(e^{iβ} − 1) · n^α + O(n^{α−1}) + O(1)` (2.10.18).

### 13.5 Entire functions defined by power series

DLMF 2.10.19–2.10.24. For the series `∑_j x^j/(j!)³`, prove the contour identities
2.10.20–2.10.23 and `∑_j x^j/(j!)³ ∼ exp(3x^{1/3}) / (2π √3 x^{1/3})` as `x → +∞`
(`IsEquivalent`). The series is written out; no hypergeometric function is introduced.

### 13.6 Darboux's method

DLMF 2.10.25–2.10.32. For `f` holomorphic on `0 < |z| < r`, the Laurent coefficient is
`f_n = laurentCoeff f ρ n = (2πi)⁻¹ ∮_{|z|=ρ} f(z) z^{−n−1} dz` for any `ρ ∈ (0, r)`, independent
of `ρ`. Let `g` be holomorphic on `0 < |z| < r` (the comparison function).
- **2.10.29** (`tendsto_laurentCoeff_sub`): if `f − g` extends continuously to `0 < |z| ≤ r`,
  then `f_n = g_n + o(r^{−n})` as `n → ±∞` (along `cofinite` on `ℤ`).
- **(b′), 2.10.30**: the same holds if `f − g` extends continuously to the circle `|z| = r`
  except at finitely many points `z_j`, near each of which `f − g = O(|z − z_j|^{σ_j − 1})` with
  `σ_j > 0`.
- **2.10.31–2.10.32**: if the extension of `f − g` is `m` times continuously differentiable on
  `|z| = r`, or if `f^{(m)} − g^{(m)} = O(|z − z_j|^{σ_j−1})` near finitely many exceptional
  points `z_j` (`σ_j > 0`) with the `m`-th derivative continuous elsewhere on the circle, then
  `f_n = g_n + o(r^{−n} |n|^{−m})`.

**Checks.**

- `laurentCoeff (fun z => z ^ k) ρ n = if n = k then 1 else 0` for `k : ℤ` and every `ρ > 0`.
- For `f(z) = 1/(1 − z)` on `0 < |z| < 1`: `laurentCoeff f ρ n = 1` for `n ≥ 0` and `0` for
  `n < 0`, for every `ρ ∈ (0, 1)`.
- `laurentCoeff` is linear in `f`, and `laurentCoeff (fun z => z * f z) ρ n = laurentCoeff f ρ (n − 1)`.

### Examples

- 13.1 for `f(x) = x²`, `a = 0`, `n = 1`, `m = 1`: both sides are `1`
  (`1/3 + 1/2 + ∫₀¹ (B₂ − B₂(x)) dx = 1/3 + 1/2 + 1/6`).
- 13.2 for `f(z) = z²`: `Im f(n + iy) = 2ny` and `∫₀^∞ y/(e^{2πy} − 1) dy = 1/24`, so the formula
  reads `∑_{j=a}^n j² = (n³ − a³)/3 + (a² + n²)/2 + (n − a)/6`.
- 13.2 for constant `f`: both integrals vanish and the formula is `n − a + 1 = (n − a) + 1`.
- The examples 13.3–13.5.

### Dependencies

Layers 1, 3 and 5; Mathlib `bernoulli`, `bernoulliFun` and its derivative and integral lemmas
(`hasDerivAt_bernoulliFun`, `bernoulliFun_eq_integral`), `riemannZeta`, `riemannZeta_one_sub`,
`Real.tendsto_harmonic_sub_log`, `circleIntegral`, the Riemann–Lebesgue lemma; ZerosOfLFunctions
§§1.2–1.3 for 13.5.

## Downstream consumers

- **SpecialFunctionsParabolicCylinder** (DLMF Chapter 12) consumes Watson's lemma in sectors and
  along rotated rays with the gluing of the rotated integrals (3.3, 4.2, 4.3), the line shift with
  simple poles and its iteration (8.2), the pole-separated Gamma bound on vertical strips (8.6)
  and the exponential Mellin inversion (8.7), together with the expansion API of Layer 1. It keeps
  its particular Barnes kernels and the Gamma product identities.
- **SpecialFunctionsEiLiErfIncompleteGamma** (DLMF Chapters 6–8) consumes Layers 1–5, the Mellin
  tools of 8.1, 8.2, 8.6 and 8.7, and the difference equations of 12.1, and owns the identity
  2.5.49 and the generalized exponential integral of §2.11(ii).
- Any special-function roadmap states its expansions through `HasAsymptoticExpansion` and takes
  its general methods from the layers here rather than restating them.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is the natural continuation. It is recorded only to fix the boundary.
- **Asymptotics of named special functions.** Each special-function roadmap owns the expansions of
  its functions and consumes this roadmap's methods. This includes the examples of DLMF Chapter 2
  that are stated through named functions: the Bessel example 2.5.8–2.5.16, the identity 2.5.49
  with the exponential integral `E₁`, the hypergeometric remarks 2.6.31–2.6.32 and 2.6.48–2.6.53,
  the Legendre example 2.10.33–2.10.36, and the generalized exponential integral of §2.11(ii)
  (2.11.5–2.11.7). The identity 2.5.49 and §2.11(ii) belong to the roadmap for DLMF Chapters 6–8
  (exponential, logarithmic, error and incomplete Gamma functions).
- **Complex Stirling and the Gamma function on vertical lines** (DLMF 5.11): ZerosOfLFunctions
  §§1.2–1.3.
- **Uniform expansions in terms of special functions**: the Airy-function expansions completing
  the Chester–Friedman–Ursell method (DLMF 2.4.21 and §9.12 Scorer functions), the turning-point
  and simple-pole cases and their error bounds (DLMF §§2.8(iii)–(vi)), transition points of
  difference equations (§2.9(iii)), and the coalescences of §2.4(vi) and DLMF Chapter 36.
- **Finite upper limits in Bleistein's method** (`κ < ∞` in DLMF 2.3.29), conditions on `p` and
  `q` (smoothness and growth) implying the uniform Taylor bounds on the transformed amplitude
  assumed in 7.2, and the asymptotics of Mellin transforms for large argument (§2.3(vi)).
- **Remainder theory** (DLMF §2.11): exponentially improved expansions, the Stokes phenomenon and
  Berry's error-function smoothing, hyperasymptotics, and the numerical acceleration and
  resummation of §2.11(vi).
- **Numerically satisfactory solutions** (DLMF §2.7(iv)), which is terminology rather than theorem.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on
top of Mathlib and Tau Ceti. Its directory `DLMF/AsymptoticApproximations/` states the Chapter 2
formulas, with some proofs open, and its sorry-free library `DLMFMathlib/Analysis/Asymptotics/`
provides the asymptotic-expansion API, Watson's lemma in sectors and on rotated rays, the algebra
and inversion of asymptotic power series, a Laplace saddle-point theorem, a cubic stationary point,
the Stieltjes remainder and power-sum asymptotics. This roadmap specifies the mathematics
intrinsically. It keeps that library's names `Asymptotics.IsAsymptoticScale` and
`Asymptotics.HasAsymptoticExpansion` and their argument order, so that the developments stay
interoperable. The following secondary provenance map records source counterparts.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1. Expansions | `DLMFMathlib/Analysis/Asymptotics/AsymptoticExpansion`, `AsymptoticInversion`; `DLMF/AsymptoticApproximations/Basics/Basic`, `Basics/OrderSymbols` |
| 2. Transcendental equations | `AsymptoticInversion`; `Basics/Transcendental` |
| 3–4. Laplace integrals | `Watson`, `WatsonSector`, `WatsonRotated`, `WatsonKernel`, `WatsonLog`; `Integrals/Basic`, `Integrals/Parts`, `Integrals/Watson` |
| 5. Laplace's method | `LaplaceSaddle`; `Integrals/Laplace` |
| 6. Stationary phase | `StationaryPhase`; `Integrals/StationaryPhase` |
| 7. Coalescing points | `Integrals/Coalescing` |
| 8. Mellin methods | `Mellin/Basic`, `Mellin/Transforms`, `Mellin/Residues`, `Mellin/SmallParameter` |
| 9. Distributions | `StieltjesRemainder`; `Distributional/Basic`, `Distributional/Stieltjes`, `Distributional/FractionalIntegrals` |
| 10–11. ODEs | `ODE/Basic`, `ODE/Singularities`, `ODE/LiouvilleGreen`, `ODE/Parameter` |
| 12. Difference equations | `ODE/Difference` |
| 13. Sums | `PowerSums`, `IntegralComparison`; `Sums/Basic`, `Sums/EulerMaclaurin`, `Sums/PowerSums`, `Sums/Darboux` |

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 2 (F. W. J. Olver and R. Wong),
  <https://dlmf.nist.gov/2>.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K Peters,
  1997. Chapters 1–4 (expansions and integrals), 5–7 (differential equations), 8 (sums), 9
  (uniform methods) and 10 (equations with a large parameter).
- F. W. J. Olver, Asymptotic expansions of the coefficients in asymptotic series solutions of
  linear differential equations, *Methods Appl. Anal.* 1 (1994), 1–13.
- R. Wong, *Asymptotic Approximations of Integrals*, Academic Press, 1989; reprinted SIAM, 2001.
  Chapters 1–3 and 5–7.
- R. Wong and H. Li, Asymptotic expansions for second-order linear difference equations,
  *J. Comput. Appl. Math.* 41 (1992), 65–94; and II, *Stud. Appl. Math.* 87 (1992), 289–324.
- N. Bleistein and R. A. Handelsman, *Asymptotic Expansions of Integrals*, Holt, Rinehart and
  Winston, 1975; reprinted Dover, 1986.
- C. Chester, B. Friedman and F. Ursell, An extension of the method of steepest descents,
  *Proc. Cambridge Philos. Soc.* 53 (1957), 599–611.
- R. A. Handelsman and J. S. Lew, Asymptotic expansion of Laplace transforms near the origin,
  *SIAM J. Math. Anal.* 1 (1970), 118–130.
- N. M. Temme, *Asymptotic Methods for Integrals*, World Scientific, 2015.
