# Roadmap: Theta functions

**Summary.** This roadmap builds the classical theory of theta functions as a library: Jacobi's
four functions `θ₁, …, θ₄` of one complex variable, their relations, transformations, products
and expansions, the modular function `λ` and the complete elliptic integral `K`, and the Riemann
theta function of `g` variables with characteristics. Its organization follows the structure of
the subject rather than any one text. Riemann's theta formula comes first and yields the algebraic
identities, as in Mumford's *Tata Lectures*. The inversion `τ ↦ −1/τ` and its consequences
(Gauss sums, the Mellin transform and `ζ`, the Laplace transforms) form one layer, and the
product formula, the expansions and `λ` follow. The content is drawn from
Whittaker–Watson (Ch. XXI), Mumford (*Tata Lectures on Theta I*, Chs. I–II), Igusa (*Theta
Functions*), Chandrasekharan (*Elliptic Functions*, Chs. V, VII–IX), Lawden (*Elliptic Functions
and Applications*, Chs. 1–2), Armitage–Eberlein (*Elliptic Functions*, Chs. 4–6),
Stein–Shakarchi (*Complex Analysis*, Ch. 10), Freitag (*Complex Analysis 2*, Chs. VI–VII),
Andrews–Berndt (*Ramanujan's Lost Notebook I*) and the NIST *Digital Library of Mathematical
Functions* (DLMF), and each headline cites its sources; see [References](#references).

Mathlib has the two-variable theta function
[`jacobiTheta₂`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.html),
`jacobiTheta₂ z τ = ∑_{n∈ℤ} e^{2πinz + πin²τ}`, with its periodicity, its derivative in `z` and
its transformation under `τ ↦ −1/τ`, and Dedekind's `η` as
[`ModularForm.eta`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/DedekindEta.html).
It has none of the four functions `θ₁, …, θ₄`, their products, zeros and identities, the modular
function `λ`, their relations to the elliptic integrals, or the theta functions of several
variables. This roadmap defines

```text
θ₁(z|τ) = 2 ∑_{n≥0} (−1)ⁿ q^{(n+½)²} sin((2n + 1)z)
θ₂(z|τ) = 2 ∑_{n≥0} q^{(n+½)²} cos((2n + 1)z)
θ₃(z|τ) = 1 + 2 ∑_{n≥1} q^{n²} cos(2nz)
θ₄(z|τ) = 1 + 2 ∑_{n≥1} (−1)ⁿ q^{n²} cos(2nz)
```

for complex `z` and `Im τ > 0`, with the nome `q = e^{iπτ}` and `q^α = e^{iαπτ}`, through
Mathlib's `jacobiTheta₂`; this is the normalization of Whittaker–Watson §21.11, p. 464, Lawden
§1.2, pp. 3–5, and DLMF 20.2.1–20.2.4. Mumford, Stein–Shakarchi and Koecher–Krieg write
`ϑ(z, τ) = θ₃(πz|τ)`, and Chandrasekharan numbers the functions differently; Conventions gives the
translations.

The roadmap covers:
- the four functions, their Fourier series, holomorphy, parity, conjugation, quasi-periodicity,
  the half-period translations, `τ ↦ τ + 1`, the heat equation, and the spaces of theta functions
  of order `N` with characteristics (Layer 1);
- Riemann's theta formula in Jacobi's four-variable form, and the identities it implies: the
  quadratic relations, Jacobi's quartic identity, the addition and duplication formulas, and
  Watson's identities between `τ` and `2τ` (Layer 2);
- the inversion `τ ↦ −1/τ`, Landsberg–Schaar reciprocity of Gauss sums, the Mellin transforms
  and `ζ`, and the Laplace transforms (Layer 3);
- Jacobi's triple product in theta form, the infinite products, the zeros, the theta constants,
  Jacobi's derivative formula, `θ₁′(0|τ) = 2η(τ)³`, Landen's transformations, and Ramanujan's
  `f(a, b)` (Layer 4);
- the logarithmic derivatives, the double products, the power series in `z`, the derivatives at
  `0` and Watson's expansion (Layer 5);
- the modulus `k`, the modular function `λ = k²`, Jacobi's inversion, the mapping theorem for `λ`
  on the fundamental region of `Γ(2)`, `K = (π/2)θ₃²` with its hypergeometric and Carlson forms,
  the nome `q = e^{−πK′/K}`, and Carlson's combined theta functions (Layer 6);
- the Riemann theta function on `ℂ^g × 𝔥_g`, its quasi-periodicity, the half-integer
  characteristics and their parity, the spaces of order `N` and their dimension `N^g`,
  Riemann's theta formula in genus `g`, and the modular transformation under the theta group
  (Layer 7).

The roadmap rests on Mathlib, Tau Ceti and three roadmaps: it consumes the principal branch of
the Gauss function `F` of
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md) for the complex-`τ`
form of `K` in 6.4, Jacobi's triple product of
[ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) 4.40 in 4.1, and
Poisson summation for a lattice of [ThetaSeries](../ThetaSeries/README.md) Layer 1 in 7.6.

Suggested home: `TauCeti/Analysis/SpecialFunctions/JacobiTheta/`, beside the elliptic integrals
in `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The four theta functions and their characteristics** (1.1–1.5).
2. **Riemann's theta formula and the identities it implies** (2.1–2.4).
3. **The inversion `τ ↦ −1/τ` and its applications** (3.1–3.4).
4. **The product formula, zeros, theta constants and Landen's transformations** (4.1–4.5).
5. **Logarithmic derivatives, double products and expansions** (5.1–5.5).
6. **The modular function `λ` and the elliptic integrals** (6.1–6.6).
7. **The Riemann theta function in genus `g`** (7.1–7.6).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose. One headline is not statable at the pins: the
hypergeometric form `F(½, ½; 1; λ(τ)) = θ₃²(0|τ)` of 6.4, which needs the principal Gauss
function of SpecialFunctionsHypergeometric; the pinned Tau Ceti does not have it.

**Inputs.** Cases of the targets that Mathlib or Tau Ceti already proves are inputs, not targets:
- quasi-periodicity of `θ₃` under `z ↦ z + π`, `z ↦ z + πτ` and `τ ↦ τ + 2`: Mathlib's
  `jacobiTheta₂_add_left`, `jacobiTheta₂_add_left'` and `jacobiTheta₂_add_right`;
- the inversion of `θ₃`: Mathlib's `jacobiTheta₂_functional_equation`, after the change of
  variables `z ↦ z/π` of Conventions;
- Euler's identity `∏_{n≥1}(1 + qⁿ) ∏_{n≥0}(1 − q^{2n+1}) = 1`: Tau Ceti's
  `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd`, consumed in 4.3;
- the derivative of `θ₃` in `z`: Mathlib's `hasDerivAt_jacobiTheta₂_fst` and `jacobiTheta₂'`;
- Weierstrass's `M`-test for products and series: Mathlib's
  `Summable.hasProdLocallyUniformlyOn_one_add` and `tendstoUniformlyOn_tsum`, whose instances for
  the products and series of Layers 4–5 are targets (4.2, 5.1).

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
provides:
- the spaces of theta functions of order `N` with characteristic (1.5 and 7.4);
- on the imaginary axis, `λ(it)` is real, in `(0, 1)`, continuous in `t > 0`, with `λ(it) → 0` as
  `t → ∞` and `λ(it) → 1` as `t → 0+` (6.1);
- `λ` maps the fundamental region of `Γ(2)` bijectively onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))` (6.2).

**What it does not own:**
- The principal branch of `F` (SpecialFunctionsHypergeometric).
- Jacobi's triple product, formal and analytic: ClassicalArithmeticCompletion 4.40, whose
  analytic specialization is `(w; q)_∞ (q/w; q)_∞ (q; q)_∞ = ∑_{k∈ℤ} (−1)^k q^{k(k−1)/2} w^k` for
  `0 < |q| < 1`, `w ≠ 0`. 4.1 reads it in theta form.
- The real complete elliptic integrals, the AGM and Carlson's integrals: Tau Ceti
  (`TauCeti.Real.legendreK`, `Complex.carlsonRF`); the real-variable theory of
  [EllipticIntegrals](../EllipticIntegrals/README.md).
- The transformation of `η` under `SL₂(ℤ)` ([ModularForms](../ModularForms/README.md)); this
  roadmap uses `η` only through its product, which Mathlib defines.
- Theta series of lattices of higher rank and their modularity
  ([ThetaSeries](../ThetaSeries/README.md)). The rank-one Landsberg–Schaar identity, which
  ThetaSeries does not target, is 3.2 here.
- The Jacobi elliptic functions of a complex variable and the Weierstrass functions `℘`, `ζ`, `σ`;
  see the last section.

**Neighbouring statements.** QSeriesPartitionsAndMockModularForms §5.1 states the zeros of `θ₁`,
`θ₁′(0) = 2η³` and the laws under `τ ↦ τ + 1`, `τ ↦ −1/τ` for `ϑ(z; τ) = −θ₁(πz|τ)`, which are
1.3, 3.1, 4.2 and 4.3 here; ThetaInvariantsOfEuclideanLattices 1.7–1.8 states
`K(k) = (π/2)θ₃²(0|it)` and the value of `θ₃(0|i)`, which are 6.3 here. SiegelModularForms 0.3
builds the subtype `ℍ[g]` over `Fin g` with its manifold structure, and
MetaplecticAutomorphicForms 8.10 the degree-two subtype; `siegelUpperHalfSpace ι` is the
underlying set of matrices, kept as a `Set` over a finite type `ι` because Layer 7 needs no
manifold structure. SiegelModularForms 5.4 states the count of even characteristics, the vanishing
of the odd theta constants and the law of `{θ_ε²}` for `θ_ε(τ) = θ[ε′/2, ε″/2](0|τ)`; these are
7.3 and 7.6 at `z = 0`. This roadmap consumes none of the four.

**The boundary in one sentence:** this roadmap owns `θ₁, …, θ₄`, the theta functions of order `N`
with characteristics, the modulus `k`, the modular function `λ`, Carlson's combined theta
functions, the Riemann theta function of genus `g` with half-integer characteristics, and the
results stated through them, `η`, `K`, `R_F`, `F`, `ζ`, `Γ` and elementary functions, as listed in
the layers; it consumes `F` from SpecialFunctionsHypergeometric and the triple product from
ClassicalArithmeticCompletion.

## Conventions

- **Names.** The functions live in the Tau Ceti namespace, beside `TauCeti.qTheta`:
  `jacobiThetaOne z τ`, `jacobiThetaTwo z τ`, `jacobiThetaThree z τ`, `jacobiThetaFour z τ` for
  `θ₁(z|τ), …, θ₄(z|τ)`; `thetaModulus τ` for `k`, `thetaComplModulus τ` for `k′`, and
  `modularLambda τ` for `λ = k²` (6.1); `siegelUpperHalfSpace ι`, `riemannTheta z Ω` and
  `riemannThetaChar a b z Ω` (7.1).

  The subscripted spellings `θ₂`, `jacobiTheta₂` are not used for the functions of this roadmap:
  Mathlib's `jacobiTheta₂` is the two-variable function, which is `θ₃` up to the scaling below.
  The theta constants `θⱼ(0|τ)` are the functions at `z = 0`, not new definitions, and
  `θ₁′(0|τ)` is `deriv (jacobiThetaOne · τ) 0`. Primes are derivatives in `z`. The nome notation
  `θⱼ(z, q)` is not defined: every statement is in `τ`. `Suggested.lean` also uses the local names
  `thetaMultiplier` for `M(z|τ)`, `thetaBasis N r a b` for `Θ^{a,b}_{N,r}` (1.5), `thetaGaussSum`
  for `G(m, n)` (3.2) and `intVec` for the inclusion `ℤ^g → ℂ^g`.
- **The definitions.** With `M(z|τ) = e^{iz + iπτ/4}`:

```text
jacobiThetaThree z τ = jacobiTheta₂ (z/π) τ
jacobiThetaFour z τ  = jacobiTheta₂ (z/π + 1/2) τ
jacobiThetaTwo z τ   = M(z|τ) · jacobiTheta₂ (z/π + τ/2) τ
jacobiThetaOne z τ   = −i M(z|τ) · jacobiTheta₂ (z/π + 1/2 + τ/2) τ
```

  These are the half-period translations of `θ₃` (Whittaker–Watson §21.11, p. 464; DLMF
  20.2.11–20.2.14). The Fourier series are theorems (1.1). For `Im τ ≤ 0` all four are the junk
  value `0`, inherited from `jacobiTheta₂`; the identities that hold there trivially are stated
  for all `τ`, the rest under `0 < τ.im`.
- **Other normalizations.** Mumford's `ϑ₀₀, ϑ₀₁, ϑ₁₀, ϑ₁₁` at `z` are `θ₃, θ₄, θ₂, −θ₁` at `πz`
  (Mumford, Ch. I §5, p. 17). Chandrasekharan's `θ(v, τ)`, `θ₁`, `θ₂`, `θ₃` are `θ₁`, `θ₂`, `θ₄`,
  `θ₃` at `πv` (Chandrasekharan, Ch. V (1.1), p. 58, and (3.1)–(3.3), p. 63). Stein–Shakarchi's
  `Θ(z|τ)` is `θ₃(πz|τ)` (Ch. 10 §1, p. 284).
- **Powers of the nome.** `q^α` is `e^{iαπτ}`, never a principal power of `q`. In particular
  `q^{1/4}` in the series and products of `θ₁`, `θ₂` is `e^{iπτ/4}`, and formulas in `q²` or `iq`
  are the formulas at `2τ` or `τ + ½`. Square roots of `τ`-dependent quantities, as in 3.1, are
  principal (`Complex.cpow · (1/2)`), and a formula that holds only for one branch is stated with
  that branch made explicit (4.4).
- **Domains.** `τ` is a complex number with `0 < τ.im`, not a point of `UpperHalfPlane`, as for
  Mathlib's `jacobiTheta₂`. The fundamental region of `Γ(2)` is
  `F = {τ | 0 < τ.im, |Re τ| < 1, |τ − ½| > ½, |τ + ½| > ½}`, written out, not named; `F + 2n` is
  its translate by `2n`, `n : ℤ`. In genus `g`, `Ω` ranges over the Siegel upper half-space
  `𝔥_g` of complex symmetric `g × g` matrices with positive definite imaginary part, indexed by a
  finite type `ι`; off `𝔥_g` the series is not summable and the totalized sum is the junk value,
  so every genus-`g` statement that needs convergence carries `Ω ∈ siegelUpperHalfSpace ι`.
- **Division.** Where a formula divides by a theta function, the statement carries the hypothesis
  that the denominator does not vanish, since with `x / 0 = 0` the printed quotient is false at
  the zeros (2.3, 4.4, 5.5, 6.6). Theta constants and `θ₁′(0|τ)` never vanish for `Im τ > 0`
  (4.2), so quotients by them need no hypothesis.
- **Equations are not predicates.** The heat equation is stated with `HasDerivAt` in `τ` and
  `deriv^[2]` in `z`; the derivative formula of 2.3 is a `HasDerivAt` statement.
- **Series and products.** Infinite sums are `HasSum` statements over `ℕ`, `ℤ` or `ℤ^g`, infinite
  products `HasProd` (with `Multipliable` where the product is not otherwise named), so that the
  totalized `∑'` and `∏'` hide no divergence. The double products and lattice sums of 5.2–5.3
  converge only in Eisenstein's order, inner over `m`, and are stated as iterated limits; the
  double products use finite cutoffs that pair the factors around the half-integer shifts, and the
  cutoffs are part of the statement, because the symmetric cutoff changes the limit (5.2).
- **Integrals.** The integrals of Layer 3 are Lebesgue integrals over `Set.Ioi 0`, with
  integrability part of the conclusion; the Mellin transforms are Mathlib's `mellin`.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  the principal branch of `F(a, b; c; z)` on `1 − z ∈ slitPlane`.
- 1.3: agreement with Mathlib's `ordinaryHypergeometric` on `‖z‖ < 1`; 1.4: holomorphy in `z`
  on the cut plane and the identity principle there. For 6.4.

### From [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md)

- 4.40: Jacobi's triple product, in its analytic specialization
  `(w; q)_∞ (q/w; q)_∞ (q; q)_∞ = ∑_{k∈ℤ} (−1)^k q^{k(k−1)/2} w^k` for complex `q`, `w` with
  `0 < |q| < 1`, `w ≠ 0`, both sides converging absolutely. For 4.1.

### From [ThetaSeries](../ThetaSeries/README.md)

- Layer 1, 1A–1B: Poisson summation `∑_{ℓ∈L} f(v + ℓ) = covol(L)⁻¹ ∑_{m∈L^∨} 𝓕f(m) e(⟨v, m⟩)`
  for a full-rank lattice `L`, a Schwartz function `f` and `v ∈ E`, both sums summable, with the
  standard lattice `ℤ^n` as 1B; 1C, the Fourier transform under a linear change of variables; 1F,
  the Gaussian `x ↦ exp(πiτ‖x‖²)` is Schwartz with its Fourier transform. For 7.6, at the
  Gaussian `x ↦ exp(πi x·Ωx + 2πi x·z)` with `Ω = iY`, reduced to 1F by `x ↦ Y^{1/2}x`.

### From Tau Ceti

- **Products.** `TauCeti.qTheta`, `TauCeti.multipliable_one_sub_pow_mul`,
  `TauCeti.tprod_one_sub_pow_mul_ne_zero`, `TauCeti.tprod_one_sub_pow_ne_zero`,
  `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` and
  `TauCeti.hasProdLocallyUniformlyOn_one_sub_pow_mul`
  (`TauCeti/Analysis/SpecialFunctions/QPochhammer.lean`), for Layer 4.
- **Elliptic integrals.** `TauCeti.Real.legendreK`, `TauCeti.Real.legendreK_pos`,
  `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm` (`K(k) = π/(2M(1, k′))`),
  `TauCeti.Real.legendreK_eq_ordinaryHypergeometric` and
  `TauCeti.Real.ofReal_legendreK_eq_carlsonRF` (`K(k) = R_F(0, 1 − k², 1)`)
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`), for 6.3–6.5; and
  `TauCeti.Real.legendreK_one_div_sqrt_two` (`K(2^{−1/2}) = Γ(¼)²/(4√π)`, `Lemniscate.lean`), for
  the exact values at `τ = i` in 6.3.
- **One-variable theta.** `TauCeti.tendsto_jacobiTheta_comap_im_atTop` (`θ(τ) → 1` as
  `Im τ → ∞`, `TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`), for 6.3.
- **Carlson's integral.** `Complex.carlsonRF`, its symmetry lemmas and `Complex.carlsonRF_self`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Basic.lean`), for 6.4–6.5.
- **Gauss sums.** `TauCeti.sum_range_cexp_two_pi_I_sq_div`, Gauss's evaluation of
  `∑_{r<N} e^{2πir²/N}` (`TauCeti/NumberTheory/ModularForms/JacobiTheta/GaussSum.lean`), and the
  method of its proof (the transformation of `jacobiTheta₂` at a rational point approached
  vertically), for 3.2.
- **Argument principle.** `TauCeti.argumentPrinciple_windingNumber_of_analyticOnNhd`
  (`TauCeti/Analysis/Complex/Conformal/ArgumentPrinciple.lean`), for 6.2.

### From Mathlib

- **The two-variable theta function.** `jacobiTheta₂`, `jacobiTheta₂_term`,
  `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_undef`, `jacobiTheta₂_add_left`,
  `jacobiTheta₂_add_left'`, `jacobiTheta₂_add_right`, `jacobiTheta₂_neg_left`,
  `jacobiTheta₂_conj`, `jacobiTheta₂_functional_equation`, `jacobiTheta₂'`,
  `hasDerivAt_jacobiTheta₂_fst`, `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_fderiv`,
  `differentiableAt_jacobiTheta₂_snd`, and the one-variable `jacobiTheta`.
- **Derivative in `τ`.** 1.4 derives the derivative of `jacobiTheta₂` in `τ` from
  `hasFDerivAt_jacobiTheta₂` and `jacobiTheta₂_fderiv`.
- **Dedekind's `η`.** `ModularForm.eta` (`η(τ) = e^{iπτ/12} ∏_{n≥1}(1 − e^{2πinτ})`) and
  `ModularForm.eta_ne_zero`, for 4.3 and 4.4.
- **Zeta and Gamma.** `riemannZeta`, `Complex.Gamma`, `mellin`, and the Mellin-transform
  construction of `completedRiemannZeta`, for 3.3.
- **AGM.** `NNReal.agm` and `NNReal.agm_mul_distrib`, for 6.3.
- **Uniform convergence.** `Summable.hasProdLocallyUniformlyOn_one_add` and
  `tendstoUniformlyOn_tsum`, for 4.2 and 5.1.
- **Matrices.** `Matrix.PosDef`, `Matrix.mulVec`, `dotProduct`, for Layer 7.
- **Complex analysis.** `Differentiable.apply_eq_apply_of_bounded` (Liouville),
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `HasProd`, `Multipliable`,
  `HasProdLocallyUniformlyOn`, `TendstoLocallyUniformlyOn`, `logDeriv`, `Complex.slitPlane`,
  `Complex.cpow`.

## How to read the build

Layer 1 transports Mathlib's `jacobiTheta₂` to the four functions and proves everything that
follows from the series alone: parity, quasi-periodicity, `τ ↦ τ + 1`, the heat equation, and
the finite-dimensional spaces of theta functions of order `N`. Layer 2 starts from Riemann's
theta formula, proved by an orthogonal change of the summation variables, and reads off the
quadratic relations, the quartic identity and the addition formulas by specialization, as Mumford
does in Ch. I §5; Watson's identities at `2τ` are the same reindexing in two variables. Layer 3
collects the consequences of Poisson summation: the inversion `τ ↦ −1/τ`, the reciprocity of
Gauss sums obtained by approaching a rational point, the Mellin transforms, which give `ζ`, and
the Laplace transforms. Layer 4 is the product formula: the triple product turns each `θⱼ` into a
product, which locates the zeros and gives the theta constants, Jacobi's derivative formula and
Landen's transformations. Layer 5 differentiates the products logarithmically. Layer 6 turns the
identities into the theory of `λ` and, through Gauss's AGM, into `K = (π/2)θ₃²`. Layer 7 is the
theory in `g` variables, where the genus-one case is `θ₃`; it uses Layer 1 as its model and
nothing later. The `**Checks.**` and `### Examples` of each layer are statements to prove; they
test the conventions on explicit values.

## Layer 1: the four theta functions and their characteristics

### 1.1 Definitions and Fourier series

- The definitions of [Conventions](#conventions), and the lattice points `(m + nτ)π`.
- The series of the Summary as `HasSum` statements over `n : ℕ` for `0 < τ.im` and every complex
  `z`, and the bilateral forms `θ₃(z|τ) = ∑_{n∈ℤ} q^{n²} e^{2inz}`,
  `θ₄(z|τ) = ∑_{n∈ℤ} (−1)ⁿ q^{n²} e^{2inz}`, `θ₂(z|τ) = ∑_{n∈ℤ} q^{(n+½)²} e^{(2n+1)iz}` and
  `θ₁(z|τ) = −i ∑_{n∈ℤ} (−1)ⁿ q^{(n+½)²} e^{(2n+1)iz}` (`hasSum_jacobiThetaOne`,
  `hasSum_jacobiThetaThree`; Whittaker–Watson §§21.1–21.11, pp. 462–464; Armitage–Eberlein §4.9,
  pp. 103–104; DLMF 20.2.1–20.2.4).

**Checks.**
- At `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)`:
  - `θ₁ = 0.22763 57285 74… + 0.27263 21850 08… i`;
  - `θ₂ = 0.93043 84122 38… + 0.24364 61252 64… i`;
  - `θ₃ = 1.05871 06558 16… + 0.09191 32090 46… i`;
  - `θ₄ = 0.94125 80999 34… − 0.09194 83361 20… i`.
- `θ₁(1|i) = 0.76707 70950 99…`, real (1.2).
- For `τ = −1 + i`, `q^{1/4} = e^{iπτ/4} = e^{−π/4} e^{−iπ/4}`, which is not the principal
  fourth root of `q = −e^{−π}`; the series of `θ₁` with this `q^{1/4}` is `θ₁`.

*Needs:* Mathlib `jacobiTheta₂`, `hasSum_jacobiTheta₂_term`.

### 1.2 Holomorphy, parity and conjugation

- **Holomorphy:** each `θⱼ(·|τ)` is entire for `0 < τ.im`, and each `θⱼ` is holomorphic in
  `(z, τ)` on `ℂ × {Im τ > 0}` (`DifferentiableOn ℂ` of the uncurried function)
  (Stein–Shakarchi, Prop. 10.1.1(i), p. 284; Koecher–Krieg, Lemma I.6.19, p. 85).
- **Derivatives:** the series of 1.1 may be differentiated termwise in `z` any number of times,
  as `HasSum` of the differentiated terms.
- **Parity:** `θ₁` is odd and `θ₂, θ₃, θ₄` are even in `z` (Whittaker–Watson §21.11, p. 464);
  hence `θ₁^{(2n)}(0|τ) = 0` and `θⱼ^{(2n+1)}(0|τ) = 0` for `j = 2, 3, 4` and all `n : ℕ`, with
  `iteratedDeriv`.
- **Conjugation** (`jacobiThetaOne_conj`): `θⱼ(z̄ | −τ̄) = conj θⱼ(z|τ)` for all `z`, `τ`, from
  `jacobiTheta₂_conj`; so `θⱼ(x|it)` is real for real `x` and `t > 0`.

**Checks.**
- `θ₁(0.3|i)` and `θ₃(0.3|i)` are real; `θ₁(0.3 + 0.2i|i) + θ₁(−0.3 − 0.2i|i) = 0`.

*Needs:* 1.1; Mathlib `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_neg_left`, `jacobiTheta₂_conj`.

### 1.3 Quasi-periodicity, half periods and `τ ↦ τ + 1`

- **Lattice translations** (`jacobiThetaOne_add_lattice`), for all `m, n : ℤ` and all `τ`
  (Whittaker–Watson §21.11, Ex. 3, p. 465; Lawden (1.3.2)–(1.3.5), p. 6; Mumford, Ch. I §1,
  p. 2; DLMF 20.2.6–20.2.9):

```text
θ₁(z + (m + nτ)π | τ) = (−1)^{m+n} q^{−n²} e^{−2inz} θ₁(z|τ)
θ₂(z + (m + nτ)π | τ) = (−1)^m     q^{−n²} e^{−2inz} θ₂(z|τ)
θ₃(z + (m + nτ)π | τ) =            q^{−n²} e^{−2inz} θ₃(z|τ)
θ₄(z + (m + nτ)π | τ) = (−1)^n     q^{−n²} e^{−2inz} θ₄(z|τ)
```

- **Half periods:** each `θⱼ(z|τ)` expressed through the other three at `z + π/2`, `z + πτ/2` and
  `z + π/2 + πτ/2`, with the multiplier `M(z|τ)`, for all `τ` (Whittaker–Watson §21.11, Ex. 2,
  p. 464; Lawden (1.3.6)–(1.3.9), p. 6; Mumford, Ch. I, Table 0, p. 19).
- **`τ ↦ τ + 1`** (`jacobiThetaOne_add_one`, `jacobiThetaThree_add_one`), for all `τ`:
  `θ₁(z|τ + 1) = e^{iπ/4} θ₁(z|τ)`, `θ₂(z|τ + 1) = e^{iπ/4} θ₂(z|τ)`, `θ₃(z|τ + 1) = θ₄(z|τ)`,
  `θ₄(z|τ + 1) = θ₃(z|τ)` (Mumford, Ch. I §9, Table V, p. 36; DLMF 20.7.26–20.7.29).

**Checks.**
- The first line at `(m, n) = (2, −1)`, `(z, τ) = (0.2 + 0.1i, 0.3 + 0.7i)`: both sides are
  `−1.90124 59… − 0.22183 38… i`.
- The law under `τ ↦ τ + 1` at `(z, τ) = (0.3 + 0.2i, 0.7 + 0.5i)` holds with the definitions of
  Conventions. Between `τ` and `τ + 1 = 1.7 + 0.5i` the principal fourth root of the nome jumps
  by a factor `−i`, at `Re τ = 1`, and `e^{iπτ/4}` does not.

*Needs:* 1.1; Mathlib `jacobiTheta₂_add_left`, `jacobiTheta₂_add_left'`,
`jacobiTheta₂_add_right`.

### 1.4 The heat equation

For `0 < τ.im`, each `θⱼ` satisfies `∂θⱼ/∂τ (z|τ) = −(iπ/4) ∂²θⱼ/∂z² (z|τ)`, stated as
`HasDerivAt (θⱼ z ·) (−(iπ/4) · deriv^[2] (θⱼ · τ) z) τ` (`hasDerivAt_jacobiThetaOne_snd`;
Whittaker–Watson §21.4, p. 470; Chandrasekharan, Ch. V (4.1), pp. 66–67; Mumford, Ch. I §2,
p. 4; DLMF 20.13.1). For `θ₃` this is the termwise identity
`∂_τ e^{2inz + iπn²τ} = −(iπ/4) ∂_z² e^{2inz + iπn²τ}`, with the derivative of `jacobiTheta₂` in
`τ` (`hasFDerivAt_jacobiTheta₂`); the other three follow from the definitions.

**Checks.**
- The residual `∂_τ θⱼ + (iπ/4) ∂_z² θⱼ` at `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)` is `0` to working
  precision for `j = 1, …, 4`; with the sign of the factor reversed it is
  `2∂_τθ₁ = −0.43213 2… + 0.40119 5… i` for `j = 1`.

*Needs:* 1.1–1.2; Mathlib `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_fderiv`.

### 1.5 Theta functions of order `N` with characteristics

- For `N ≥ 1`, `0 < τ.im` and `a, b ∈ {0, 1}`, let `V^{a,b}_N(τ)` be the entire `f` with
  `f(z + π) = (−1)^a f(z)` and `f(z + πτ) = (−1)^b q^{−N} e^{−2iNz} f(z)`. Every such `f` is
  `∑_{r<N} c_r Θ^{a,b}_{N,r}(z|τ)`, and the `Θ^{a,b}_{N,r}` are linearly independent, where
  `Θ^{a,b}_{N,r}(z|τ) = ∑_{n∈ℤ} (−1)^{bn} q^{(nN+r+a/2)²/N} e^{2i(nN+r+a/2)z}`
  (`existsUnique_eq_sum_thetaBasis`; Mumford, Ch. II, Def. 1.2, p. 122, and Prop. 1.3, p. 124, at
  `g = 1`; Mumford, Ch. I §1, pp. 3–4; Igusa, Ch. II, Thm. 4, p. 72). Proof: by the first relation
  `f` is a Fourier series `∑ c_k e^{i(2k+a)z}`, and the second is the recurrence
  `c_{k+N} = (−1)^b q^{2k+a+N} c_k`; distinct `r` have disjoint Fourier supports. Written through
  Mathlib, `Θ^{a,b}_{N,r}(z|τ) = e^{iπτ s²/N + 2isz} jacobiTheta₂ (Nz/π + sτ + b/2) (Nτ)` with
  `s = r + a/2`.
- The characteristics of the four functions: `θ₃ = Θ^{0,0}_{1,0}`, `θ₄ = Θ^{0,1}_{1,0}`,
  `θ₂ = Θ^{1,0}_{1,0}` and `θ₁ = −i Θ^{1,1}_{1,0}`, by 1.1.
- The product rule: if `fᵢ ∈ V^{aᵢ,bᵢ}_{Nᵢ}` and `c₁, …, c_k` satisfy `∑ Nᵢ cᵢ = 0`, then
  `z ↦ ∏ᵢ fᵢ(z + cᵢ)` lies in `V^{a,b}_N` with `N = ∑ Nᵢ`, `a ≡ ∑ aᵢ` and `b ≡ ∑ bᵢ (mod 2)`.

**Checks.**
- `θ₂ = Θ^{1,0}_{1,0}` and `iθ₁ = Θ^{1,1}_{1,0}` at `(z, τ) = (0.2 + 0.1i, 0.3 + 0.8i)`: `iθ₁` is
  `−0.14897 94… + 0.18635 74… i` on both sides.
- `θ₂` is not a multiple of `e^{icz}θ₃` for any `c`: `θ₂(π/2|τ) = 0 ≠ θ₃(π/2|τ) = θ₄(0|τ)`. The
  two lie in different spaces `V^{1,0}_1` and `V^{0,0}_1`.
- `z ↦ θ₁(z + w|τ)θ₁(z − w|τ)` lies in `V^{0,0}_2`. At
  `(z, w, τ) = (0.2 + 0.1i, 0.4 − 0.2i, 0.3 + 0.8i)` its second relation reads
  `53.63163 9… − 11.33961 3… i` on both sides.

*Needs:* 1.1–1.3; Mathlib Fourier series of periodic entire functions (`fourierCoeff`,
`hasSum_fourier_series_of_summable`), or directly the Laurent series of `f(z)` in `e^{2iz}`.

### Examples

- `θ₃(z|τ + 2) = θ₃(z|τ)` and `θ₁(z|τ + 8) = θ₁(z|τ)`, from 1.3.
- `θ₁(mπ|τ) = 0` for `m : ℤ`, from parity and 1.3.

### Dependencies

Mathlib `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`.

## Layer 2: Riemann's theta formula and the identities it implies

### 2.1 Riemann's theta formula

- For all `w, x, y, z` and all `τ`, with `w′ = (w + x + y + z)/2`, `x′ = (w + x − y − z)/2`,
  `y′ = (w − x + y − z)/2` and `z′ = (w − x − y + z)/2`,
  `2θ₃(w)θ₃(x)θ₃(y)θ₃(z) = ∑_{j=1}^{4} θⱼ(w′)θⱼ(x′)θⱼ(y′)θⱼ(z′)`, all at `τ`
  (`two_mul_jacobiThetaThree_mul_eq_sum`; Whittaker–Watson §21.22, pp. 467–468, Jacobi's
  fundamental formulae; Mumford, Ch. I §5 (R₁), p. 16, and (R₂)–(R₅), pp. 17–18; Igusa, Ch. IV
  §1, Thm. 1, p. 137, in genus `g`).
- Proof (Mumford, p. 15): the matrix `A = ½[[1,1,1,1],[1,1,−1,−1],[1,−1,1,−1],[1,−1,−1,1]]`
  satisfies `AᵗA = I` and maps `ℤ⁴` onto the vectors of `(½ℤ)⁴` whose coordinates are all in `ℤ`
  or all in `½ + ℤ`. The product of four series of `θ₃` is a sum over `ℤ⁴` that the change of
  variables `n ↦ An` turns into the four sums over the two cosets with the signs of the
  characteristics; the absolute convergence of 1.1 justifies the regrouping. The other fifteen
  formulas of the same table follow by the half-period translations of 1.3.

**Checks.**
- At `τ = 0.3 + 0.9i`, `(w, x, y, z) = (0.3 + 0.2i, −0.5 + 0.1i, 0.7 − 0.3i, 0.1 + 0.4i)`: both
  sides are `2.26762 36566… + 0.68799 32510… i`.
- With the sign of the `θ₁` term reversed the right side differs from the left by
  `0.10122 6…` in absolute value, and with the sign of the `θ₄` term reversed by `1.69589 9…`.
- At `w = x = y = z = 0` the formula reads `2θ₃(0)⁴ = θ₂(0)⁴ + θ₃(0)⁴ + θ₄(0)⁴`, which is the
  quartic identity of 2.2.

*Needs:* 1.1, 1.3.

### 2.2 Quadratic relations and Jacobi's quartic identity

- The four quadratic relations among `θⱼ²(z|τ)` with theta-constant coefficients, such as
  `θ₄²(z)θ₄²(0) = θ₃²(z)θ₃²(0) − θ₂²(z)θ₂²(0)`, and Jacobi's quartic identity
  `θ₃⁴(0|τ) = θ₂⁴(0|τ) + θ₄⁴(0|τ)`, for `0 < τ.im` (`jacobiThetaThree_zero_pow_four`;
  Whittaker–Watson §21.2, pp. 466–467, and its Corollary, p. 467; Mumford, Ch. I §5 (A₁)–(A₃),
  p. 21, and (J), p. 23; Armitage–Eberlein (4.26)–(4.30), p. 84; DLMF 20.7.1–20.7.5). They are
  2.1 at `x = w`, `y = z`, combined with the half-period translations.

**Checks.**
- At `τ = i`: `θ₃⁴(0|i) = 1.39320 39296 85… = 2θ₂⁴(0|i)`.
- At `τ = 0.3 + 0.8i` both sides of the quartic identity agree, while `θ₃² − θ₂² − θ₄²` has
  absolute value `0.62288 1…` there: the quartic is not the square of a quadratic identity.

*Needs:* 2.1.

### 2.3 Addition and duplication

- The addition formulas for `θⱼ(z + w|τ)θⱼ(z − w|τ)` with theta-constant coefficients, and the
  duplication formula `θ₁(2z|τ)θ₂(0)θ₃(0)θ₄(0) = 2θ₁(z)θ₂(z)θ₃(z)θ₄(z)`, for all `z, w`
  (Whittaker–Watson §21.21, p. 467, and Misc. Ex. 1–5, pp. 487–488; Mumford, Ch. I §5, Table III,
  p. 22; Lawden (1.4.22)–(1.4.53), pp. 9–11; DLMF 20.7.6–20.7.10). They are 2.1 at `y = w`,
  `z = −x`, with the half-period translations; equivalently, each is an identity in `z` in
  `V^{0,0}_2` for fixed `w` (1.5).
- The derivative `d/dz (θ₂(z|τ)/θ₄(z|τ)) = −θ₃²(0|τ) θ₁(z|τ) θ₃(z|τ)/θ₄²(z|τ)` as `HasDerivAt`
  at every `z` with `θ₄(z|τ) ≠ 0` (Whittaker–Watson §21.6, p. 478, for `θ₁/θ₄`, and the
  half-period translations; DLMF 20.7.25), from the addition formula as `w → 0`.

**Checks.**
- `θ₁(z + w)θ₁(z − w)θ₄²(0) = θ₃²(z)θ₂²(w) − θ₂²(z)θ₃²(w)` and the duplication formula hold at
  `(z, w, τ) = (0.3 + 0.2i, −0.5 + 0.1i, 0.3 + 0.9i)` to working precision.
- The duplication formula without the factor `2` fails at every `z` with `θ₁(2z|τ) ≠ 0`.

*Needs:* 1.3, 1.5, 2.1–2.2.

### 2.4 Watson's identities between `τ` and `2τ`

- For all `z, w`: `θ₁(z|τ)θ₁(w|τ) = θ₃(z + w|2τ)θ₂(z − w|2τ) − θ₂(z + w|2τ)θ₃(z − w|2τ)` and
  `θ₃(z|τ)θ₃(w|τ) = θ₃(z + w|2τ)θ₃(z − w|2τ) + θ₂(z + w|2τ)θ₂(z − w|2τ)` (DLMF 20.7.13–20.7.14).
  Proof: the left side of the second is the absolutely convergent double sum
  `∑_{j,k} q^{j²+k²} e^{2i(jz+kw)}`; reindexing by `(j + k, j − k)`, split by the parity of
  `j + k`, gives the right side, and the first follows by 1.3.

**Checks.**
- At `z = w = 0` and at `z = w = π/2` the second identity gives
  `θ₃²(0|τ) = θ₃²(0|2τ) + θ₂²(0|2τ)` and `θ₄²(0|τ) = θ₃²(0|2τ) − θ₂²(0|2τ)` (Lawden
  (1.8.5)–(1.8.6), p. 18).

*Needs:* 1.1, 1.3.

### Examples

- From 2.4, `(θ₃²(0|τ) + θ₄²(0|τ))/2 = θ₃²(0|2τ)`; with `θ₃(0|τ)θ₄(0|τ) = θ₄²(0|2τ)` (4.4) this is
  the AGM step of 6.3 (Lawden (1.8.6)–(1.8.7), p. 18).

### Dependencies

Layer 1.

## Layer 3: the inversion `τ ↦ −1/τ` and its applications

### 3.1 The inversion

- For `0 < τ.im`, `τ′ = −1/τ` and the principal `(−iτ)^{1/2}`:
  `(−iτ)^{1/2} θ₁(z|τ) = −i e^{iτ′z²/π} θ₁(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₂(z|τ) = e^{iτ′z²/π} θ₄(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₃(z|τ) = e^{iτ′z²/π} θ₃(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₄(z|τ) = e^{iτ′z²/π} θ₂(zτ′|τ′)` (`jacobiThetaOne_neg_inv`;
  Whittaker–Watson §21.51, pp. 474–476; Stein–Shakarchi, Thm. 10.1.6, p. 290; Chandrasekharan,
  Ch. V, Thm. 9, p. 73, and Cor. 1, p. 75; DLMF 20.7.30–20.7.33). The third is Mathlib's
  `jacobiTheta₂_functional_equation`; the others follow by 1.3.

**Checks.**
- The four laws at `(z, τ) = (0.3 + 0.2i, 1.7 + 0.6i)` hold to working precision; for `θ₁` both
  sides are `0.13943 09… + 0.60247 70… i`.
- At `z = 0`, `τ = i` the third law reads `θ₃(0|i) = θ₃(0|i)`, and the second reads
  `θ₂(0|i) = θ₄(0|i)`.

*Needs:* 1.3; Mathlib `jacobiTheta₂_functional_equation`.

### 3.2 Gauss sums and Landsberg–Schaar reciprocity

- `G(m, n) = ∑_{k<n} e^{−πik²m/n}` for `m : ℤ`, `n : ℕ`, written out.
- For positive integers `m, n` with `mn` even,
  `n^{−1/2} G(m, n) = e^{−πi/4} m^{−1/2} ∑_{j<m} e^{πij²n/m}`, the second sum being `G(−n, m)`
  (`thetaGaussSum_reciprocity`; Chandrasekharan, Ch. IX §1, Thm. 1, p. 141, and Cor. 2, p. 144;
  Mumford, Ch. I §7, p. 31; DLMF 20.11.2). No coprimality is needed. Proof: apply 3.1 at `z = 0`
  (Mathlib's `jacobiTheta₂_functional_equation`) to `τ = −m/n + iε`, and let `ε → 0+`, as in the
  proof of `TauCeti.sum_range_cexp_two_pi_I_sq_div` and of Chandrasekharan's Theorem 1.
  - On the left, `e^{πik²τ}` has the phase `e^{−πik²m/n}` of `G(m, n)`. Because `mn` is even,
    this phase has period `n` in `k`, so `θ₃(0|τ) ∼ G(m, n)/(n ε^{1/2})`.
  - On the right, `−1/τ` approaches `n/m` from above. With the principal `(−iτ)^{1/2}` and the
    same periodicity modulo `m`, this gives the sum `∑_{j<m} e^{πij²n/m}` and the factor
    `e^{−πi/4}`.

**Checks.**
- `(m, n) = (1, 2)`: both sides are `e^{−πi/4}`. `(m, n) = (2, 4)`: both sides are `1 − i`.
- `G(1, 4) = 2e^{−πi/4} = 1.41421… − 1.41421… i`.
- `(m, n) = (1, 1)`, where `mn` is odd: the left side is `1` and the right side `e^{−πi/4}`, so
  the parity hypothesis is needed.
- At `(m, n) = (2, N)` the formula reads `G(2, N) = √N e^{−πi/4}(1 + i^N)/√2`, the complex
  conjugate of `TauCeti.sum_range_cexp_two_pi_I_sq_div`.

*Needs:* 3.1; Tau Ceti `TauCeti/NumberTheory/ModularForms/JacobiTheta/GaussSum.lean`.

### 3.3 Mellin transforms and `ζ`

- With integrability part of the conclusion (Mumford, Ch. I §16 (*), p. 85, and Prop. 16.1,
  p. 85; Stein–Shakarchi, Ch. 6, Thms. 2.2–2.3, p. 170; Koecher–Krieg, Ch. IV, Thm. 4.10, p. 261;
  DLMF 20.10.1–20.10.3):
  - `∫₀^∞ x^{s−1} θ₂(0|ix²) dx = (2^s − 1) π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`;
  - `∫₀^∞ x^{s−1} (θ₃(0|ix²) − 1) dx = π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`
    (`mellin_jacobiThetaThree_sub_one`);
  - `∫₀^∞ x^{s−1} (1 − θ₄(0|ix²)) dx = (1 − 2^{1−s}) π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 0`,
    `s ≠ 1`, and `= ln 2` at `s = 1`, where the right side has a removable singularity and
    Mathlib's `riemannZeta 1` is not its limit.

**Checks.**
- The second at `s = 2`: `π/6`. The first at `s = 3`: `7π^{−3/2}Γ(3/2)ζ(3) = 1.33919 30861 0…`.
- The third at `s = 1`: `ln 2 = 0.69314 71805 5…`; the formula evaluated with Mathlib's
  `riemannZeta 1` gives `0`, since `1 − 2^{1−s}` vanishes at `s = 1`.

*Needs:* 3.1 (for the behaviour at `x → 0+`); Mathlib `mellin`, `riemannZeta`, `Complex.Gamma`.

### 3.4 Laplace transforms

- For `Re s > 0`, `ℓ > 0`, `|Re β| + |Im β| ≤ ℓ` and the principal `√s` (DLMF 20.10.4–20.10.5):
  - `∫₀^∞ e^{−st} θ₁(βπ/(2ℓ)|iπt/ℓ²) dt = −∫₀^∞ e^{−st} θ₂((ℓ + β)π/(2ℓ)|iπt/ℓ²) dt`, and both
    equal `(ℓ/√s) sinh(β√s) sech(ℓ√s)`;
  - `∫₀^∞ e^{−st} θ₃((ℓ + β)π/(2ℓ)|iπt/ℓ²) dt = ∫₀^∞ e^{−st} θ₄(βπ/(2ℓ)|iπt/ℓ²) dt`, and both
    equal `(ℓ/√s) cosh(β√s) csch(ℓ√s)` (`integral_exp_mul_jacobiThetaFour`).

  Integrability is part of the conclusion. Route: termwise integration of the Fourier series
  for `t ≥ 1`, and 3.1 for the behaviour as `t → 0+`; the closed forms are the partial-fraction
  expansions of `sinh`, `cosh` over `sinh`, `cosh`.

**Checks.**
- At `(s, ℓ, β) = (2, 1.4, 0.3)`, by termwise integration of the Fourier series: the first is
  `0.11726 51329 79…` and the second is `0.30416 67622 68…`.

*Needs:* 1.1, 3.1; Mathlib `integral_exp_neg_Ioi`.

### Examples

- 3.3 at `s = 1` gives `∫₀^∞ (1 − θ₄(0|ix²)) dx = ln 2`.

### Dependencies

Layer 1; Mathlib `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`; Tau Ceti `GaussSum.lean`.

## Layer 4: the product formula, zeros, theta constants and Landen's transformations

### 4.1 Jacobi's triple product in theta form

- For `0 < τ.im` and complex `z`, with `p = e^{iπz}`,
  `θ₃(πz|τ) = ∑_{n∈ℤ} p^{2n} q^{n²} = ∏_{n≥1}(1 − q^{2n})(1 + q^{2n−1}p²)(1 + q^{2n−1}p^{−2})`,
  with multipliability (`hasProd_jacobiThetaThree`; Stein–Shakarchi, Thm. 10.1.3, p. 287;
  Mumford, Ch. I §14, Prop. 14.1, p. 68; Whittaker–Watson §21.3, pp. 469–470; DLMF 20.5.9). It is
  ClassicalArithmeticCompletion 4.40 at `q ↦ q²` and `w = −qp²`: then
  `(w; q²)_∞ = ∏_{n≥1}(1 + q^{2n−1}p²)`, `(q²/w; q²)_∞ = ∏_{n≥1}(1 + q^{2n−1}p^{−2})`, and the
  series becomes `∑_k q^{k²} p^{2k}` after `k ↦ −k`.

**Checks.**
- At `p² = −1`: `θ₄(0|τ) = ∏_{n≥1}(1 − q^{2n})(1 − q^{2n−1})²`.
- At `(z, τ) = (1.7 − 0.4i, −0.8 + 0.6i)` the product is `0.45566 54… + 1.69844 64… i`, equal to
  `θ₃(πz|τ)`.

*Needs:* 1.1; ClassicalArithmeticCompletion 4.40.

### 4.2 Products, zeros and theta constants

- Each `θⱼ(z|τ)`, for `0 < τ.im` and all `z`, as `HasProd` of its factors times its prefactor
  (`2q^{1/4} sin z`, `2q^{1/4} cos z`, `1`, `1`), from 4.1 and 1.3; the products converge locally
  uniformly in `z` (Whittaker–Watson §21.3, pp. 469–470; Chandrasekharan, Ch. V, Thm. 6, p. 69;
  Lawden (1.6.23)–(1.6.26), p. 15; DLMF 20.5.1–20.5.4).
- **Zeros** (`jacobiThetaOne_eq_zero_iff` for `θ₁`): for `0 < τ.im`, `θ₁(z|τ) = 0` iff
  `z = (m + nτ)π`, `θ₂(z|τ) = 0` iff `z = (m + ½ + nτ)π`, `θ₃(z|τ) = 0` iff
  `z = (m + ½ + (n + ½)τ)π`, `θ₄(z|τ) = 0` iff `z = (m + (n + ½)τ)π`, for some `m, n : ℤ`; every
  zero is simple (`deriv` nonzero there) (Whittaker–Watson §21.12, pp. 465–466; Chandrasekharan,
  Ch. V (3.13), p. 66).
- **Theta constants:** the products for `θ₁′(0|τ)`, `θ₂(0|τ)`, `θ₃(0|τ)`, `θ₄(0|τ)`; in
  particular these four never vanish for `0 < τ.im` (Chandrasekharan, Ch. V (6.6)–(6.9),
  pp. 70–71; Lawden (1.6.15)–(1.6.20), p. 14; DLMF 20.4.2–20.4.5).

**Checks.**
- `θ₃(0|i) = 1.08643 48112 13…` and `θ₂(0|i) = θ₄(0|i) = 0.91357 91381 56…`, from the products;
  the closed forms are in 6.3.
- `θ₂(π/2 + πτ|τ) = 0` and `θ₃(π/2 + πτ/2|τ) = 0` at `τ = 0.4 + 0.9i`, while
  `θ₃(π/2|τ) = θ₄(0|τ) ≠ 0`.

*Needs:* 1.3, 4.1; Mathlib `Summable.hasProdLocallyUniformlyOn_one_add`; Tau Ceti
`TauCeti.tprod_one_sub_pow_mul_ne_zero`, `TauCeti.hasProdLocallyUniformlyOn_one_sub_pow_mul`.

### 4.3 Jacobi's derivative formula and the sine products

- `θ₁′(0|τ) = θ₂(0|τ) θ₃(0|τ) θ₄(0|τ)` for `0 < τ.im` (`deriv_jacobiThetaOne_zero`;
  Whittaker–Watson §21.41, pp. 470–472; Mumford, Ch. I §13, Prop. 13.1, p. 64; Chandrasekharan,
  Ch. V, Thm. 5, p. 67; DLMF 20.4.6), from the products of 4.2 and Euler's identity
  `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` at `q`, which gives
  `∏_{n≥1}(1 + q^{2n})(1 + q^{2n−1})(1 − q^{2n−1}) = 1`.
- `θ₁′(0|τ) = 2η(τ)³` with Mathlib's `ModularForm.eta`, for `0 < τ.im`
  (`deriv_jacobiThetaOne_zero_eq_eta`; Chandrasekharan, Ch. VIII (1.3)–(1.5), p. 122;
  Whittaker–Watson §21.42, Ex. 1, p. 473; Mumford, Ch. I (P₅), p. 72; DLMF 23.15.9).
- The products over `sin(nπτ ± z)`, `cos(nπτ ± z)`, `cos((n − ½)πτ ± z)`, `sin((n − ½)πτ ± z)`,
  as `HasProd` for `0 < τ.im`, with the theta constants as prefactors (DLMF 20.5.5–20.5.8); the
  denominators `sin²(nπτ)`, `cos²(nπτ)`, … do not vanish for `0 < τ.im`.

**Checks.**
- At `τ = i`: `θ₁′(0|i) = 2η(i)³ = 0.90676 76551 67…`, with `η(i) = 0.76822 54223 26…`; the
  closed form `η(i) = Γ(¼)/(2π^{3/4})` follows in 6.3.
- At `τ = −1.3 + 0.2i`: `θ₁′(0|τ) = θ₂θ₃θ₄(0|τ) = 2η(τ)³ = 2.48806 89… − 1.19362 79… i`.

*Needs:* 4.1–4.2; Mathlib `ModularForm.eta`; Tau Ceti
`TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd`.

### 4.4 Landen's transformations and the eta form

- The changes of nome `τ ↦ 2τ` in quotient form:
  `θ₁(z|τ)θ₂(z|τ)/θ₁(2z|2τ) = θ₃(z|τ)θ₄(z|τ)/θ₄(2z|2τ) = θ₄(0|2τ)` and
  `θ₁(z|2τ)θ₄(z|2τ)/θ₁(z|τ) = θ₂(z|2τ)θ₃(z|2τ)/θ₂(z|τ) = θ₂(0|τ)/2`, each quotient where its
  denominator does not vanish (Whittaker–Watson §21.52, pp. 476–477; Lawden §1.8
  (1.8.1)–(1.8.15), pp. 17–18; Armitage–Eberlein §4.8 (4.56)–(4.57), pp. 99–100; DLMF
  20.7.11–20.7.12). They are 2.4 with the half-period translations; for example 2.4 at
  `w = z + π/2` is `θ₁(z|τ)θ₂(z|τ) = θ₄(0|2τ)θ₁(2z|2τ)`. The constants are the values at the
  zeros' complements, which 4.2 shows nonzero.
- Landen's transformations of order 2 and 4, with `A(τ) = 1/θ₄(0|2τ)` and
  `B(τ) = 1/(θ₃(0|τ)θ₄(0|τ)θ₃(π/4|τ))` as written-out factors (Lawden §1.8, pp. 17–18, and Ch. 1,
  Ex. 21, p. 23; DLMF 20.7.15–20.7.24); `θ₃(π/4|τ) ≠ 0` is part of the target, from 4.2.
- The eta form (`jacobiThetaOne_mul_jacobiThetaThree_div_eq_eta`):
  `θ₁(z|2τ)θ₃(z|2τ)/θ₁(z|τ + ½) = θ₂(z|2τ)θ₄(z|2τ)/θ₂(z|τ + ½) = e^{−iπ/8} η(τ)η(4τ)/η(2τ)`
  for `0 < τ.im`, each quotient where its denominator does not vanish, with Mathlib's
  `ModularForm.eta`; its square, `e^{−iπ/4} θ₂(0|2τ)θ₄(0|2τ)/2`; and DLMF's form
  `e^{−iπ/8}(θ₂(0|2τ)θ₄(0|2τ)/2)^{1/2}` with the principal root for `τ = it`, `t > 0` (DLMF
  20.7.34). DLMF's form with the principal root is false in general: the eta quotient is the
  holomorphic square root, and it differs from the principal one by a sign on part of the
  half-plane.

**Checks.**
- The eta form at `(z, τ) = (0.3 + 0.1i, −2.19 + 1.29i)`: the quotients and the eta form are
  `−0.18715 75018 − 0.31106 51823 i`, the principal-root form is `+0.18715 75018 + 0.31106 51823 i`;
  at `τ = 0.7i` all three agree.
- The first quotient at `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)` is `1.00566 38… − 0.00411 50… i`,
  which is `θ₄(0|2τ)`.

*Needs:* 2.4, 4.2–4.3; Mathlib `ModularForm.eta`.

### 4.5 Ramanujan's theta function

- `f(a, b) = ∑_{n∈ℤ} a^{n(n+1)/2} b^{n(n−1)/2}`, with natural-number exponents, summable for
  `‖ab‖ < 1` (Andrews–Berndt (1.1.5), p. 11; DLMF 20.11.3).
- `θ₃(z|τ) = f(q e^{2iz}, q e^{−2iz})` for all `z` and `0 < τ.im`, and
  `f(a, b) = (−a; ab)_∞ (−b; ab)_∞ (ab; ab)_∞` for `‖ab‖ < 1` from 4.1 (Andrews–Berndt
  (1.1.6)–(1.1.8), p. 11, and Lemma 1.2.2, p. 13; Mumford, Ch. I (P₁), p. 70; DLMF 20.11.4).

**Checks.**
- `f(a, 0) = 1 + a`.
- `f(q, q) = θ₃(0|τ)`, `1.08643 48112 13…` at `τ = i`.
- `f(−½, −¼) = ∏_{n≥1}(1 − 2^{−n}) = 0.28878 80950 86…`.

*Needs:* 1.1, 4.1.

### Examples

- `θ₂(0|τ)/θ₃(0|τ) → 0` as `Im τ → ∞`, from 4.2.
- `θ₁(z|τ)/θ₄(z|τ)` is meromorphic with simple poles exactly at `(m + (n + ½)τ)π`.

### Dependencies

Layers 1–2; ClassicalArithmeticCompletion 4.40; Tau Ceti `QPochhammer.lean`; Mathlib
`DedekindEta.lean`.

## Layer 5: logarithmic derivatives, double products and expansions

### 5.1 Logarithmic derivatives

- For each `θⱼ`, both of its series as `HasSum`: for `θ₁` and `θ₂` in the strip
  `|Im z| < π Im τ`, for `θ₃` and `θ₄` in `|Im z| < π Im τ/2` (Whittaker–Watson, Ch. XXI, Misc.
  Ex. 11–12 and 15, p. 489; Lawden, Ch. 1, Ex. 17, p. 23; DLMF 20.5.10–20.5.13). The left sides
  are `logDeriv (θⱼ · τ) z − cot z` for `θ₁`, `logDeriv (θⱼ · τ) z + tan z` for `θ₂`, and
  `logDeriv (θⱼ · τ) z` for `θ₃`, `θ₄`; for example `θ₄′/θ₄ = 4 ∑_{n≥1} qⁿ sin 2nz/(1 − q^{2n})`.
  In the strip the only zeros of `θ₁`, `θ₂` are the real points `mπ`, respectively `(m + ½)π`,
  where the left side has a removable singularity; the statement for `θ₁`, `θ₂` is for `z` other
  than these points.
- The series converge absolutely and locally uniformly in the strips.

**Checks.**
- At `z = 0.3 + 0.5i`, `τ = 0.4 + 0.9i`: `logDeriv θ₁ − cot z = −0.01767 87… − 0.00398 42… i`
  and `logDeriv θ₃ = 0.11117 24… − 0.24972 06… i`, both from the series.

*Needs:* 4.2; Mathlib `logDeriv`, `tendstoUniformlyOn_tsum`.

### 5.2 Double products

- For `0 < τ.im` and all `z`, as iterated limits (DLMF 20.5.14–20.5.17). Let `wⱼ(m, n)` be
  `(m + nτ)π`, `(m − ½ + nτ)π`, `(m − ½ + (n − ½)τ)π` and `(m + (n − ½)τ)π` for `j = 1, 2, 3, 4`.
  For each `n : ℤ` the limit `Lⱼ(n) = lim_{M→∞} ∏_{m∈Iⱼ(M)} (1 + z/wⱼ(m, n))` exists, omitting
  `(m, n) = (0, 0)` for `j = 1`. Then `cⱼ ∏_{n∈Jⱼ(N)} Lⱼ(n) → θⱼ(z|τ)` as `N → ∞`, with
  `c₁ = z θ₁′(0|τ)` and `cⱼ = θⱼ(0|τ)` for `j = 2, 3, 4` (`tendsto_jacobiThetaFour_doubleProd`
  for `j = 4`). The ranges are:

| `j` | inner range `Iⱼ(M)` | outer range `Jⱼ(N)` |
|---|---|---|
| 1 | `−M ≤ m ≤ M` | `−N ≤ n ≤ N` |
| 2 | `1 − M ≤ m ≤ M` | `−N ≤ n ≤ N` |
| 3 | `1 − M ≤ m ≤ M` | `1 − N ≤ n ≤ N` |
| 4 | `−M ≤ m ≤ M` | `1 − N ≤ n ≤ N` |

  The pairing matters: for `j = 4` the inner limit is
  `L₄(n) = sin(z + (n − ½)πτ)/sin((n − ½)πτ)`, and `L₄(−N) → e^{iz}` as `N → ∞`, so the
  symmetric outer range `−N ≤ n ≤ N` gives `e^{iz} θ₄(z|τ)` instead of `θ₄(z|τ)`.
- The double products do not converge absolutely; the family `(m, n) ↦ z/((m + nτ)π)` is not
  summable for `z ≠ 0`.

**Checks.**
- At `(z, τ) = (π/2, i)`: the paired products tend to `θ₄(π/2|i) = θ₃(0|i) = 1.08643 48112 13…`;
  with the symmetric outer range they tend to `i θ₃(0|i)`.

*Needs:* 4.2–4.3.

### 5.3 Power series

- `δ_{2j}(τ) = ∑_n ∑_m (m + nτ)^{−2j}` over `(m, n) ≠ (0, 0)`,
  `α_{2j}(τ) = ∑_n ∑_m (m − ½ + nτ)^{−2j}`,
  `β_{2j}(τ) = ∑_n ∑_m (m − ½ + (n − ½)τ)^{−2j}`, `γ_{2j}(τ) = ∑_n ∑_m (m + (n − ½)τ)^{−2j}`,
  `j ≥ 1`, as iterated sums inner over `m`; for `j ≥ 2` they converge absolutely, for `j = 1`
  only in this order (DLMF 20.6.6–20.6.9).
- `θ₁(πz|τ) = πz θ₁′(0|τ) exp(−∑_{j≥1} δ_{2j}(τ) z^{2j}/(2j))` for
  `|z| < min_{(m,n)≠0} |m + nτ|`, and the analogues for `θ₂, θ₃, θ₄` with `α, β, γ` in the disc
  reaching the nearest zero of `θⱼ(π·|τ)`; the series is part of the conclusion (DLMF
  20.6.2–20.6.5). DLMF 20.6.1 gives the disc of `θ₁` for all four; it is the right disc for `θ₁`
  only.
- `α_{2j}(τ) = 2^{2j} δ_{2j}(2τ) − δ_{2j}(τ)` and `β_{2j}(τ) = 2^{2j} γ_{2j}(2τ) − γ_{2j}(τ)` for
  `j ≥ 1` (DLMF 20.6.10).

**Checks.**
- At `(z, τ) = (0.25 + 0.1i, 0.2 + 0.9i)`, with `δ_{2j}` from the Lambert series
  `2ζ(2j) + 2(2πi)^{2j}/(2j − 1)! ∑_{n≥1} n^{2j−1} e^{2πinτ}/(1 − e^{2πinτ})`: both sides of the
  logarithmic form agree to working precision.
- `δ₆(i) = 0`, from `τ ↦ −1/τ`; `δ₄(i) = Γ(¼)⁸/(960π²) = 3.15121 20021…`.
- At `τ = i`, `α_{2j}(i)/(2·4^j) → 1`, so the series for `θ₂` diverges at `z = 0.7`, inside the
  disc of `θ₁`.

*Needs:* 4.2–4.3, 5.1.

### 5.4 Derivatives at `z = 0`

- `θ₁‴(0)/θ₁′(0) = −1 + 24 ∑_{n≥1} q^{2n}/(1 − q^{2n})²`,
  `θ₂″(0)/θ₂(0) = −1 − 8 ∑_{n≥1} q^{2n}/(1 + q^{2n})²`,
  `θ₃″(0)/θ₃(0) = −8 ∑_{n≥1} q^{2n−1}/(1 + q^{2n−1})²`,
  `θ₄″(0)/θ₄(0) = 8 ∑_{n≥1} q^{2n−1}/(1 − q^{2n−1})²`, as `HasSum`, for `0 < τ.im`
  (`hasSum_iteratedDeriv_three_jacobiThetaOne` for the first; Whittaker–Watson §21.41, p. 471;
  Lawden, Ch. 1, Ex. 13–14, pp. 22–23; DLMF 20.4.8–20.4.11).
- `θ₁‴(0)/θ₁′(0) = θ₂″(0)/θ₂(0) + θ₃″(0)/θ₃(0) + θ₄″(0)/θ₄(0)` (Whittaker–Watson §21.41,
  pp. 470–471; DLMF 20.4.12), which with the heat equation is the route of Whittaker–Watson to
  4.3.

**Checks.**
- `θ₁‴(0|i)/θ₁′(0|i) = −3/π = −0.95492 96585 51…`, equal to `−E₂(i)` with Mathlib's
  `ModularForm.logDeriv_eta_eq_E2`.

*Needs:* 5.1.

### 5.5 Watson's expansion

- `θ₂(0|τ)θ₃(z|τ)θ₄(z|τ)/θ₂(z|τ) = 2 ∑_{n∈ℤ} (−1)ⁿ q^{n²} e^{2inz}/(q^{−n} e^{−iz} + qⁿ e^{iz})`
  as `HasSum`, for `0 < τ.im` and `θ₂(z|τ) ≠ 0` (`hasSum_watson`; DLMF 20.8.1); the denominators
  `q^{−n}e^{−iz} + qⁿe^{iz}` vanish exactly at the zeros of `θ₂(z|τ)`.

**Checks.**
- At `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)` both sides are `1.02653 87728 08… + 0.05068 33609 77… i`.
- At `(z, τ) = (1.1 − 0.4i, −0.6 + 0.7i)` both sides are `1.23057 23… − 0.93736 41… i`.

*Needs:* 4.2.

### Examples

- By the heat equation 1.4 differentiated in `z` at `0`,
  `θ₁‴(0|τ)/θ₁′(0|τ) = (4i/π) ∂_τ log θ₁′(0|τ)`; with `θ₁′(0|τ) = 2η(τ)³` and
  `ModularForm.logDeriv_eta_eq_E2` this is `−E₂(τ)`, which is 5.4 written through Eisenstein's `E₂`.

### Dependencies

Layers 1, 4; Mathlib `logDeriv`, `TendstoLocallyUniformlyOn`.

## Layer 6: the modular function `λ` and the elliptic integrals

### 6.1 Modulus, `λ` and Jacobi's inversion

- `thetaModulus τ = θ₂²(0|τ)/θ₃²(0|τ)`, `thetaComplModulus τ = θ₄²(0|τ)/θ₃²(0|τ)`,
  `modularLambda τ = thetaModulus τ ^ 2`; `k² + k′² = 1` by 2.2 (Whittaker–Watson §21.61, p. 479;
  Lawden (2.1.7), p. 25; Chandrasekharan, Ch. VII §7 (7.1)–(7.4), p. 108).
- The elliptic modular function: `λ` is holomorphic on `{Im τ > 0}`, never `0` or `1` there,
  `λ(τ + 2) = λ(τ)`, `λ(τ + 1) = λ(τ)/(λ(τ) − 1)` and `λ(−1/τ) = 1 − λ(τ)`
  (`modularLambda_neg_inv`), by 1.3 and 3.1 (Whittaker–Watson §21.71, p. 481; Chandrasekharan,
  Ch. VII (7.7), p. 110, and the table on p. 111; Armitage–Eberlein, Def. 6.1, p. 136; DLMF
  23.15.6, 23.18.1, 23.18.3).
- The auxiliary results on the imaginary axis (Scope and ownership), and Jacobi's inversion
  (`existsUnique_thetaModulus_eq`): for `0 < k < 1` there is exactly one `t > 0` with
  `thetaModulus (it) = k` (Whittaker–Watson §21.7, pp. 480–481; Armitage–Eberlein §5.2, p. 109).
  Existence is the intermediate value theorem; uniqueness is the monotonicity of the product
  `k′ = ∏((1 − q^{2n−1})/(1 + q^{2n−1}))⁴` in `q ∈ (0, 1)`, or 6.3, which gives
  `t = K′(k)/K(k)`.

**Checks.**
- `λ(i) = ½`, from `λ(−1/i) = 1 − λ(i)`; the wrong model `λ = k` would give `λ(i) = 2^{−1/2}`.
- `k(2i) = 3 − 2√2 = 0.17157 28752 53…`.
- `λ(0.3 + 0.8i) = 0.76600 28750 45… + 0.40978 63252 79… i`, and
  `λ(1.3 + 0.8i) = −0.05082 47896 57… − 1.84025 17943 33… i`, which is `λ/(λ − 1)` of it.

*Needs:* 1.3, 2.2, 3.1, 4.2.

### 6.2 The mapping theorem

- `λ` maps `F` bijectively onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))` (`bijOn_modularLambda`;
  Chandrasekharan, Ch. VII, Thm. 3, p. 117, and Thm. 4, p. 118, for the closure of the region and
  `ℂ ∖ {0, 1}`; Whittaker–Watson §§21.711–21.712, pp. 482–484). In particular `λ(τ)` and
  `1 − λ(τ)` avoid `(−∞, 0]` on `F`, which the principal branches of 6.4 need. Proof: the boundary
  correspondence and the argument principle on truncations of `F`.
  - By 6.1 and 1.3, `λ` is real and negative on the lines `Re τ = ±1`, and real and greater than
    `1` on the semicircles `|τ ± ½| = ½`.
  - At the cusps, `λ → 0` at `i∞`, `λ → 1` at `0` and `λ → ∞` at `±1`.

**Checks.**
- `λ(1 + 0.5i) = −32.9706…`, on the boundary line `Re τ = 1`; `λ(0.3 − 0.8i) = 0`, the junk value,
  which is why `F` carries `0 < τ.im`.

*Needs:* 1.3, 3.1, 6.1; Tau Ceti `TauCeti.argumentPrinciple_windingNumber_of_analyticOnNhd`.

### 6.3 `K` in the rectangular case and the AGM

- For `τ = it`, `t > 0`, with `k = thetaModulus (it)` (real, in `(0, 1)`) and Tau Ceti's
  `K(k) = TauCeti.Real.legendreK k`: `K(k) = (π/2) θ₃²(0|it)` and `K′(k) = K(k′) = t K(k)`
  (`legendreK_thetaModulus`; Whittaker–Watson §21.61, Ex. 3, p. 479, and §21.8, p. 486; Lawden
  (2.2.3), p. 27; Armitage–Eberlein (4.36)–(4.38), p. 89; DLMF 20.9.2). Proof:
  - By the Example of Layer 2, the AGM step maps `(θ₃²(0|it), θ₄²(0|it))` to
    `(θ₃²(0|2it), θ₄²(0|2it))`.
  - The AGM is invariant under the step, and the iterates tend to `(1, 1)` by
    `TauCeti.tendsto_jacobiTheta_comap_im_atTop` and 1.3. Hence `M(θ₃²(0|it), θ₄²(0|it)) = 1`.
  - `NNReal.agm_mul_distrib` then gives `M(1, k′) = θ₃⁻²(0|it)` with `k′ = θ₄²/θ₃²`, and
    `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm` gives `K = (π/2)θ₃²`.
  - `K′ = tK` follows from `λ(i/t) = 1 − λ(it)` and 3.1 at `z = 0`.
- The nome: `q = e^{−πt} = exp(−π K′(k)/K(k))` (Whittaker–Watson §21.61, Ex. 3, p. 479; Lawden
  (2.2.3), p. 27; DLMF 23.15.1).

**Checks.**
- At `τ = i`: `k = 2^{−1/2}`, `K(2^{−1/2}) = (π/2) θ₃²(0|i) = 1.85407 46773 01…`, `K′ = K`.
- At `t = 0.7`: `K(k) = 2.34604 85103…` and `K(k′) = 1.64223 39572… = 0.7 K(k)`.

*Needs:* 1.3, 2.4, 3.1, 4.4, 6.1; Tau Ceti `TauCeti.Real.legendreK`,
`TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`, `TauCeti.Real.legendreK_one_div_sqrt_two`,
`TauCeti.tendsto_jacobiTheta_comap_im_atTop`; Mathlib `NNReal.agm`,
`NNReal.agm_mul_distrib`.

### 6.4 `K` for complex `τ`: the hypergeometric and Carlson forms

- On `F + 2n`, `n : ℤ`: `λ(τ) ∉ [1, ∞)` and `F(½, ½; 1; λ(τ)) = θ₃²(0|τ)` with the principal
  Gauss function of SpecialFunctionsHypergeometric (its Conventions), so `K(k) = (π/2)θ₃²(0|τ)` for
  the principal complex `K`; on `F`, also `K′(k) = −iτ K(k)`, with
  `K′(k) = (π/2) F(½, ½; 1; 1 − λ(τ))` (DLMF 20.9.2, 20.11.5).
- The Carlson form (`carlsonRF_modularLambda`): `R_F(0, 1 − λ(τ), 1) = (π/2)θ₃²(0|τ)` on
  `F + 2n`.
- Proof: on the imaginary axis these are 6.3 with
  `TauCeti.Real.legendreK_eq_ordinaryHypergeometric` and
  `TauCeti.Real.ofReal_legendreK_eq_carlsonRF`. Both sides are holomorphic on the connected open
  set `F`, by
  6.2, and `λ(τ + 2) = λ(τ)`, `θ₃(0|τ + 2) = θ₃(0|τ)` carry them to `F + 2n`.
- The rectangular case with Mathlib's `ordinaryHypergeometric`: `F(½, ½; 1; k²) = θ₃²(0|it)`.

**Checks.**
- `F(½, ½; 1; ½) = θ₃²(0|i) = 1.18034 05990 16…`.
- At `τ = 0.3 + 0.8i ∈ F` and at `τ = 2.3 + 0.8i ∈ F + 2` both sides of the hypergeometric form
  are `1.18219 88370… + 0.28696 19062… i`, and both sides of the Carlson form are
  `1.85699 36… + 0.45075 87… i`.
- At `τ = 0.5 + 0.3i`, outside every `F + 2n`, `θ₃²(0|τ) = 0.48635 46173… + 1.63137 83624… i` and
  the principal `F(½, ½; 1; λ(τ)) = 0.97882 70174… − 0.29181 27704… i`: the identity fails there.

*Needs:* 1.3, 6.2–6.3; SpecialFunctionsHypergeometric Conventions, 1.3, 1.4; Tau Ceti
`TauCeti.Real.legendreK_eq_ordinaryHypergeometric`, `TauCeti.Real.ofReal_legendreK_eq_carlsonRF`,
`Complex.carlsonRF`.

### 6.5 Carlson's forms in `z`

- In two corrected forms, with Tau Ceti's `Complex.carlsonRF` (DLMF 20.9.3):
  `R_F(θ₂²(z|τ)/θ₂²(0|τ), θ₃²(z|τ)/θ₃²(0|τ), θ₄²(z|τ)/θ₄²(0|τ)) = z θ₁′(0|τ)/θ₁(z|τ)`
  - for `τ = it`, `t > 0`, and complex `z ≠ 0` with `|Re z| < π/2`, `|Im z| < πt/2`
    (`carlsonRF_jacobiTheta`);
  - for every `τ` with `0 < τ.im`, for all `z ≠ 0` in a neighbourhood of `0` (as
    `∀ᶠ z in 𝓝[≠] 0`).

  Part of the target is that the three arguments lie in `slitPlane` there. DLMF's identity, with
  no condition on `z`, is false: the left side is `π`-periodic and even in real `z`, the right
  side is not.
- `R_F(0, θ₃⁴(0|it), θ₄⁴(0|it)) = π/2` and `exp(−π R_F(0, k², 1)/R_F(0, k′², 1)) = e^{−πt}` for
  `τ = it`, from 6.3 and `TauCeti.Real.ofReal_legendreK_eq_carlsonRF` (DLMF 20.9.4–20.9.5).

**Checks.**
- At `τ = 0.8i`: at `z = 1` both sides are `1.16628 78551…`; at `z = 1.6`, outside the
  rectangle, the left side is `1.50207 18560…` and the right side `1.55898 18517…`.

*Needs:* 4.2–4.3, 6.3; Tau Ceti `Complex.carlsonRF`, `TauCeti.Real.ofReal_legendreK_eq_carlsonRF`.

### 6.6 Theta quotients and Carlson's combined theta functions

- Carlson's combined theta function `φ_{m,n}(z|τ) = cₙ θₘ(z|τ)/(cₘ θₙ(z|τ))` for `m ≠ n` in
  `{1, 2, 3, 4}`, with `c₁ = θ₁′(0|τ)` and `cⱼ = θⱼ(0|τ)` for `j = 2, 3, 4`; one definition covers
  the twelve functions, which are the Jacobi elliptic functions of `u = zθ₃²(0|τ)` with modulus
  `k` (Whittaker–Watson §21.61, p. 479; Chandrasekharan, Ch. VII §2, Thm. 1, p. 105; Lawden
  (2.1.1)–(2.1.3), p. 24; DLMF 20.11.6–20.11.8).
- `φ_{m,n} = φ_{m,1} φ_{1,n} = 1/φ_{n,m} = φ_{m,1}/φ_{n,1} = φ_{1,n}/φ_{1,m}` at every `z` where
  `θ₁(z|τ)`, `θₘ(z|τ)` and `θₙ(z|τ)` do not vanish, with the cases `m = 1` or `n = 1` read with
  `φ_{1,1} = 1` (DLMF 20.11.9).

**Checks.**
- `φ_{m,n}(0|τ) = 1` for `m, n ∈ {2, 3, 4}`.
- `φ_{4,1}(π/2|i) = θ₃²(0|i) = 1.18034 05990 16…`, by 4.3.
- `φ_{3,4}(π/2|i) = k′(i) = 2^{−1/2}`.
- At `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)`: `φ_{2,3} = 0.95870 95… − 0.03701 45… i` in all five
  forms.

*Needs:* 4.2–4.3, 6.1.

### Examples

- The closed forms at `τ = i`, from 6.3 and `TauCeti.Real.legendreK_one_div_sqrt_two`:
  - `θ₃(0|i) = Γ(¼)/(2^{1/2} π^{3/4}) = π^{1/4}/Γ(¾)`;
  - `θ₂(0|i) = θ₄(0|i) = 2^{−1/4} θ₃(0|i)`, by `λ(i) = ½`;
  - `η(i) = Γ(¼)/(2π^{3/4})`, by 4.3.
- `thetaModulus (it) → 0` as `t → ∞` and `K(k) → π/2`, `θ₃(0|it) → 1`, consistently with
  `TauCeti.Real.legendreK_zero`.

### Dependencies

Layers 1–4; SpecialFunctionsHypergeometric Layer 1; Tau Ceti
`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`.

## Layer 7: the Riemann theta function in genus `g`

### 7.1 Definition and convergence

- `siegelUpperHalfSpace ι`: the complex symmetric `Ω : Matrix ι ι ℂ` with `(Ω.map im).PosDef`.
- For real characteristics `a, b : ι → ℝ`, `z : ι → ℂ` and `Ω`,
  `θ[a, b](z|Ω) = ∑_{n∈ℤ^g} exp(πi (n + a)·Ω(n + a) + 2πi (n + a)·(z + b))`, and
  `θ(z|Ω) = θ[0, 0](z|Ω)` (Mumford, Ch. II §1, pp. 118 and 123; Igusa, Ch. I §10, p. 49; Freitag,
  Ch. VII, Lemma 7.1, p. 454).
- On `ℂ^g × 𝔥_g` the series converges absolutely and locally uniformly, so `θ[a, b]` is
  holomorphic there (`summable_norm_riemannThetaCharTerm`; Mumford, Ch. II, Prop. 1.1, p. 118).
- In genus one, `θ(z|τ) = jacobiTheta₂ z τ = θ₃(πz|τ)` (`riemannTheta_unique_eq`), and the four
  half-integer characteristics give `θ₃`, `θ₄`, `θ₂`, `−θ₁` at `πz`.

**Checks.**
- `θ(0.1|i) = θ₃(0.1π|i) = 1.06992 37438 3…`.
- At `Ω = iI₂` the function factors: `θ((0.1, 0.2 + 0.1i)|iI₂)` is
  `θ₃(0.1π|i)θ₃((0.2 + 0.1i)π|i) = 1.10431 59… − 0.05897 30… i`; at `Ω = [[i, ½i], [½i, i]]`
  it does not, and the value is
  `1.18629 56… − 0.08954 16… i`.
- `Ω = [[i, 2i], [2i, i]]` is symmetric but its imaginary part is not positive definite, so it is
  not in `𝔥₂`; the series diverges there, and the totalized sum is the junk value.
- `θ[½, ½](z|τ) = −θ₁(πz|τ)`: at `(z, τ) = (0.2 + 0.1i, 0.3 + 0.9i)` both are
  `−0.53386 54… − 0.38513 84… i`.

*Needs:* Mathlib `Matrix.PosDef`, `Summable.of_norm_bounded`.

### 7.2 Quasi-periodicity

- For `m, m′ ∈ ℤ^g` and `Ω ∈ 𝔥_g`,
  `θ(z + m + Ωm′|Ω) = exp(−πi m′·Ωm′ − 2πi m′·z) θ(z|Ω)` (`riemannTheta_add_lattice`; Mumford,
  Ch. II §1, p. 120; Igusa, Ch. I §10 (0.3)–(0.5), p. 50), and the analogous law for
  `θ[a, b]`, with the factors `e^{2πi a·m}` and `e^{−2πi b·m′}` (Mumford, Ch. II §1, p. 123).

**Checks.**
- In genus one the law is the third line of the table of 1.3 at `z/π`.
- With `+` in place of `−` in the exponent the law fails at `g = 1`, `m′ = 1`, `τ = i`, `z = 0`:
  the factor would be `e^{−π}` instead of `e^{π} = 23.14069 26…`.

*Needs:* 7.1.

### 7.3 Half-integer characteristics and parity

- For `a, b ∈ {0, 1}^g`, `θ[a/2, b/2](−z|Ω) = (−1)^{a·b} θ[a/2, b/2](z|Ω)`
  (`riemannThetaChar_neg`; Igusa, Ch. I §10 (0.1), p. 49); so the odd characteristics, those with
  `a·b` odd, have `θ[a/2, b/2](0|Ω) = 0` (Freitag, Ch. VII, Lemma 7.1, p. 454; Igusa, Ch. V,
  Thm. 1, p. 174, for the converse).
- Of the `4^g` characteristics, `2^{g−1}(2^g + 1)` are even and `2^{g−1}(2^g − 1)` are odd
  (Mumford, Ch. II §3, p. 169). So for `g ≥ 1` exactly `2^{g−1}(2^g + 1)` of the functions
  `θ[a/2, b/2](·|Ω)` are even (`card_even_riemannThetaChar`): an odd characteristic gives an odd
  function, which is not even because it is not identically zero.

**Checks.**
- `g = 1`: three even characteristics (`θ₂`, `θ₃`, `θ₄`) and one odd (`θ₁`).
- `g = 2`: ten even and six odd; `g = 3`: 36 even.
- `θ[½, ½](0|i) = 0` to working precision.

*Needs:* 7.1.

### 7.4 Theta functions of order `N`

- For `N ≥ 1` and `Ω ∈ 𝔥_g`, the entire `f : ℂ^g → ℂ` with `f(z + m) = f(z)` and
  `f(z + Ωm) = exp(−πiN m·Ωm − 2πiN m·z) f(z)` for `m ∈ ℤ^g` are exactly the combinations, with
  unique coefficients, of the `N^g` functions `θ[a/N, 0](Nz|NΩ)`, `a ∈ (ℤ/N)^g`
  (`existsUnique_eq_sum_riemannThetaChar`; Mumford, Ch. II, Def. 1.2, p. 122, and Prop. 1.3,
  p. 124; Igusa, Ch. II, Thm. 4, p. 72; Freitag, Ch. VI, Thm. 8.6, p. 390). Proof: as in 1.5,
  by Fourier expansion in `z` and the recurrence on the coefficients. For `N = 1` the space is the
  line through `θ`.
- Products: the product of functions of orders `N₁` and `N₂` has order `N₁ + N₂`; in particular
  `θ(z|Ω)² = ∑_{a∈{0,1}^g} θ[a/2, 0](2z|2Ω) θ[a/2, 0](0|2Ω)`.

**Checks.**
- The square identity in genus two at
  `Ω = [[0.3 + 1.2i, 0.2 + 0.3i], [0.2 + 0.3i, −0.1 + 0.9i]]`, `z = (0.3 + 0.2i, 0.1)`: both sides
  are `1.25130 27… − 0.27476 75… i`; the term `a = 0` alone gives `1.00431 05… − 0.01023 74… i`.
- In genus one with `N = 1` the space is the line through `θ₃(π·|τ)`, which is 1.5 at
  `(a, b) = (0, 0)`.
- In genus one with `N = 2` the two basis functions are `θ₃(2πz|2τ)` and `θ₂(2πz|2τ)`, and the
  square identity is 2.4 at `w = z`: at `(z, τ) = (0.2 + 0.1i, 0.3 + 0.9i)` both sides are
  `1.18135 77… − 0.01889 96… i`, and the first term alone is `1.00751 25… − 0.00143 66… i`.

*Needs:* 7.1–7.2.

### 7.5 Riemann's theta formula in genus `g`

- For `Ω ∈ 𝔥_g` and `x, y, u, v ∈ ℂ^g`, with `x₁ = (x + y + u + v)/2`, `y₁ = (x + y − u − v)/2`,
  `u₁ = (x − y + u − v)/2` and `v₁ = (x − y − u + v)/2`,
  `θ(x)θ(y)θ(u)θ(v) = 2^{−g} ∑_{a,b∈{0,½}^g} θ[a, b](x₁)θ[a, b](y₁)θ[a, b](u₁)θ[a, b](v₁)`
  (`riemannTheta_mul_four`; Mumford, Ch. II §6, Thm. 6.1, p. 211, and (R_ch), p. 214; Igusa,
  Ch. IV §1, Thm. 1, p. 137). The proof is that of 2.1, with the orthogonal matrix acting on
  `(ℤ^g)⁴`.

**Checks.**
- In genus two at the `Ω` of 7.4 and `x = (0.3 + 0.2i, 0.1)`, `y = (−0.5 + 0.1i, 0.2 − 0.1i)`,
  `u = (0.7 − 0.3i, 0.05i)`, `v = (0.1 + 0.4i, −0.3)` both sides agree to working precision.
- In genus one it is 2.1 after the translation of characteristics, with `2^{−1}` in place of
  the factor `2` on the left.

*Needs:* 7.1–7.3.

### 7.6 The modular transformation

- For `M = [[A, B], [C, D]] ∈ Sp_{2g}(ℤ)` with `diag(ᵗA C)` and `diag(ᵗB D)` even,

```text
θ((CΩ + D)^{−ᵗ} z | (AΩ + B)(CΩ + D)^{−1}) = ζ_M det(CΩ + D)^{1/2} exp(πi z·(CΩ + D)^{−1}C z) θ(z|Ω)
```

  for an eighth root of unity `ζ_M` and a continuous branch of the square root on `𝔥_g`
  (`riemannTheta_symplectic`; Mumford, Ch. II §5 (5.1), p. 189; Igusa, Ch. II, Thm. 6, p. 84;
  Freitag, Ch. VII, Prop. 7.3, p. 455). For `g = 1` and `M = [[0, −1], [1, 0]]` it is 3.1 for
  `θ₃`. Proof, in Mumford's four steps (Ch. II §5, pp. 189–190): the set of `M` for which the
  formula holds is closed under products; the theta group is generated by
  `[[A, 0], [0, ᵗA⁻¹]]` with `A ∈ GL_g(ℤ)`, `[[I, B], [0, I]]` with `B` symmetric integral of even
  diagonal, and `[[0, −I], [I, 0]]` (Mumford, Ch. II, Prop. A4, p. 209, a target here); for the
  first the formula is the reindexing `n ↦ ᵗA n`, for the second the invariance of
  `exp(πi n·Bn)` under even diagonal, and for the third Poisson summation on `ℤ^g`, at `Ω = iY`
  and then for all `Ω` by the identity principle in `Ω`.

**Checks.**
- In genus two, `M = [[1, 1, 1, 1], [0, 1, 1, 0], [0, 0, 1, 0], [0, 0, −1, 1]]` satisfies the
  parity condition and the quotient of the two sides is an eighth root of unity at two choices of
  `(z, Ω)`. For `M = [[1, 1, 0, 1], [0, 1, 0, 1], [0, 0, 1, 0], [0, 0, −1, 1]]`, which is
  symplectic and fails the parity condition (`diag(ᵗB D) = (0, 1)`), the quotient is not: at the
  `Ω` of 7.4 and `z = (0.3 + 0.2i, 0.1)` its eighth power is `0.17812 84… + 0.19227 51… i`.
- `g = 1`, `M = [[1, 1], [0, 1]]` (`τ ↦ τ + 1`) fails the condition, and `θ₃(z|τ + 1)` is
  `θ₄(z|τ)`, not a multiple of `θ₃(z|τ)` (1.3).

*Needs:* 7.1–7.2; ThetaSeries Layer 1 (1A–1C, 1F: Poisson summation for a lattice); Mathlib
`Matrix.symplecticGroup`, `Matrix.fromBlocks`; 3.1 for `g = 1`.

### Examples

- At `Ω = diag(τ₁, …, τ_g)` the Riemann theta function is `∏ⱼ θ₃(πzⱼ|τⱼ)`, and 7.4 at `N = 1`
  and 7.5 reduce to their genus-one forms coordinatewise.

### Dependencies

Layer 1; Mathlib `Matrix.PosDef`.

## Downstream consumers

- A roadmap for the Jacobi elliptic functions of a complex variable consumes Layers 1–6: `sn`,
  `cn`, `dn` as the theta quotients of 6.6, with `k` and `K` from 6.1–6.4.
- A roadmap for the Weierstrass functions consumes Layers 1–4 for the theta expressions of `σ`,
  `ζ`, `℘`, alongside the lattice functions of ModularCurves.
- A roadmap for abelian functions and Jacobian varieties consumes Layer 7.
- A roadmap for Lamé functions consumes Layer 6 through the Jacobi elliptic functions.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Sums of squares** through powers of `θ₃(0|τ)`: the two- and four-square theorems
  (Stein–Shakarchi, Thms. 10.3.1 and 10.3.6, pp. 297 and 304; Mumford, Ch. I §15, Thm. 15.1,
  p. 74; Chandrasekharan, Ch. X, Thm. 1, p. 156), and Euler's pentagonal number theorem from the
  triple product.
- **Projective embeddings** of the torus `ℂ/(ℤ + τℤ)` by theta functions (Mumford, Ch. I §4,
  p. 11), and in genus `g` the Jacobian varieties, the Schottky problem and the hyperelliptic
  theory (Mumford, Ch. II §§2–3; *Tata Lectures on Theta II*).
- **Physical applications** beyond the heat equation of 1.4: the real-time form for `τ = it`,
  the Gaussian solution and the periodized Gaussians, which are 3.1 after a change of variables.
- **Numerical computation**, tables and software.
- **Further identities**: the remaining permutation identities, Watson's further expansions, the
  cubic and quartic analogues of the AGM for `F(⅓, ⅔; 1; k²)`, `F(¼, ¾; 1; k²)`,
  `F(⅙, ⅚; 1; k²)`, and Riemann's theta formula for general rational orthogonal matrices
  (Mumford, Ch. II, Thm. 6.1, p. 211, beyond the matrix of 7.5).
- **`q`-series beyond the triple product**: the quintuple product, the Rogers–Ramanujan
  identities and Ramanujan's other theta-function identities.
- **The modular transformation of `η`** and the full `SL₂(ℤ)` transformation of the four theta
  functions with its eighth roots of unity (Mumford, Ch. I §7, Thm. 7.1, p. 32; Chandrasekharan,
  Ch. V, Cor. 4, p. 77).
- **Theta functions with harmonic coefficients** and theta functions of general polarizations
  (Mumford, Ch. II §7; Igusa, Ch. II).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes special
functions on top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes),
drawing on DLMF and on the books listed under References. Its directories `DLMF/Theta/` and
`DLMF/RiemannTheta/`, with `DLMF/Elliptic/Theta.lean` and `DLMF/Elliptic/ThetaAGM.lean`, provide
source material for every layer, including the corrected forms in 4.4, 6.4 and 6.5 and the
Mellin transform of `θ₄` at `s = 1`. It defines the four functions through `jacobiTheta₂` as this
roadmap does, proves the products from its own formalization of the triple product, and proves
the identities of Layer 2 from Watson's product formula by the parity reindexing of 2.4. Its
`DLMF/RiemannTheta/` proves convergence, holomorphy, quasi-periodicity, the parity of
half-integer characteristics, the order-`N` spaces' basic properties and the genus-one bridge,
from Mumford, Igusa and Beals–Wong. Several of its statements are still admitted, and they remain
proof work here:
- the power series of 5.3;
- Watson's expansion 5.5;
- the complex forms of 6.4 and of 6.5;
- the Laplace transforms 3.4;
- the Gauss-sum reciprocity 3.2, which it also states only for coprime `m, n`;
- the dimension statement of 7.4, Riemann's theta formula 7.5 and the modular transformation 7.6.

It has no counterpart of 1.5 or of the mapping theorem 6.2.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Theta/Basic/Definitions`, `Basic/Series`, `Basic/Analytic`, `Basic/Periodicity`, `Theta/Identities` |
| 2 | `Theta/Identities` |
| 3 | `Theta/Identities`, `Theta/Integrals`, `Theta/Generalizations`, `Theta/GaussReciprocity` |
| 4 | `Theta/Products/InfiniteProducts`, `Theta/SeriesAndZeros`, `Theta/ZeroValues`, `Theta/Identities`, `Theta/Generalizations` |
| 5 | `Theta/Products/LogDerivativesAndDoubleProducts`, `Theta/Basic/PowerSeries`, `Theta/PowerSeries` |
| 6 | `Theta/Relations`, `Theta/ImaginaryAxisMonotonicity`, `Elliptic/ThetaAGM`, `Theta/Generalizations` |
| 7 | `RiemannTheta/Basic`, `RiemannTheta/CharacteristicParity`, `RiemannTheta/HigherOrderAddition`, `RiemannTheta/Products`, `RiemannTheta/Modular` |

Other formalizations of this material: the Lean development of Jacobi's triple product and the
Rogers–Ramanujan identities in arXiv:2607.01544 ("Formalized q-series: The Rogers-Ramanujan
Identities and Beyond"), and the Isabelle/HOL library of Jacobi theta functions of Eberl, Li and
Paulson (ITP 2026, LIPIcs vol. 382, paper 23).

## References

- G. E. Andrews and B. C. Berndt, *Ramanujan's Lost Notebook, Part I*, Springer, 2005, Ch. 1.
- J. V. Armitage and W. F. Eberlein, *Elliptic Functions*, London Mathematical Society Student
  Texts 67, Cambridge University Press, 2006, Chs. 4–6.
- K. Chandrasekharan, *Elliptic Functions*, Grundlehren 281, Springer, 1985, Chs. V, VII–X.
- E. Freitag, *Complex Analysis 2*, Universitext, Springer, 2011, Chs. VI–VII.
- J. Igusa, *Theta Functions*, Grundlehren 194, Springer, 1972, Chs. I, II, IV, V.
- M. Koecher and A. Krieg, *Elliptic Functions and Modular Forms*, Universitext, Springer, 2025,
  Chs. I, IV.
- D. F. Lawden, *Elliptic Functions and Applications*, Applied Mathematical Sciences 80,
  Springer, 1989, Chs. 1–2.
- D. Mumford, *Tata Lectures on Theta I*, Progress in Mathematics 28, Birkhäuser, 1983 (reprinted
  2007), Chs. I–II.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapters 20
  (W. P. Reinhardt and P. L. Walker) and 23, <https://dlmf.nist.gov/>. Equation numbers refer to
  this release.
- E. M. Stein and R. Shakarchi, *Complex Analysis*, Princeton Lectures in Analysis II, Princeton
  University Press, 2003, Chs. 6 and 10.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XXI.
