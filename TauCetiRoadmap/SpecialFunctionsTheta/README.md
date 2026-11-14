# Roadmap: Theta functions

**Summary.** This roadmap builds the theory of the Jacobi theta functions of Chapter 20 of the
NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. Mathlib has the two-variable theta function
[`jacobiTheta₂`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.html),
`jacobiTheta₂ z τ = ∑_{n∈ℤ} e^{2πinz + πin²τ}`, with its periodicity, its derivative in `z` and
its transformation under `τ ↦ −1/τ`, and Dedekind's `η` as
[`ModularForm.eta`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/ModularForms/DedekindEta.html).
It has none of the four functions `θ₁, …, θ₄` in DLMF's normalization, their products, zeros and
identities, the modular function `λ`, or their relations to the elliptic integrals. This roadmap
defines

```text
θ₁(z|τ) = 2 ∑_{n≥0} (−1)ⁿ q^{(n+½)²} sin((2n + 1)z)          (DLMF 20.2.1)
θ₂(z|τ) = 2 ∑_{n≥0} q^{(n+½)²} cos((2n + 1)z)                (DLMF 20.2.2)
θ₃(z|τ) = 1 + 2 ∑_{n≥1} q^{n²} cos(2nz)                     (DLMF 20.2.3)
θ₄(z|τ) = 1 + 2 ∑_{n≥1} (−1)ⁿ q^{n²} cos(2nz)               (DLMF 20.2.4)
```

for complex `z` and `Im τ > 0`, with the nome `q = e^{iπτ}` and `q^α = e^{iαπτ}`, through
Mathlib's `jacobiTheta₂`.

The roadmap covers:
- the definitions, their Fourier series, holomorphy in both variables, parity, conjugation,
  quasi-periodicity under the lattice `π(ℤ + τℤ)` and the half-period translations, the
  translation `τ ↦ τ + 1`, and the heat equation;
- Jacobi's triple product, the infinite products, the zeros, the theta constants, Jacobi's
  derivative formula `θ₁′(0) = θ₂(0) θ₃(0) θ₄(0)` and `θ₁′(0|τ) = 2η(τ)³`;
- the logarithmic derivatives, the double products and the power series in `z`;
- the identities of §20.7: sums of squares, addition formulas, the changes of nome (Watson and
  Landen), the transformation `τ ↦ −1/τ`, and Watson's expansion;
- the modulus `k`, the modular function `λ = k²`, Jacobi's inversion, the nome
  `q = e^{−πK′/K}`, and the relations to the complete elliptic integral `K` and to Carlson's
  `R_F`;
- the Mellin and Laplace transforms of §20.10;
- the Gauss sums and Landsberg–Schaar reciprocity, Ramanujan's `f(a, b)`, the hypergeometric
  form 20.11.5 of `K`, and the combined theta functions of §20.11(v).

**This roadmap is most of DLMF Chapter 20, not all of it.** The formula ranges are in the table
under [Scope and ownership](#scope-and-ownership). The rest of the chapter is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement): the
graphics of §20.3, the applications of §§20.12–20.13 other than the heat equation 20.13.1, and
the computation sections §§20.14–20.16.

The roadmap rests on Mathlib, Tau Ceti and one roadmap: it consumes the principal branch of the
Gauss function `F` of [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)
for the complex-`τ` form of `K` in 5.3.

Suggested home: `TauCeti/Analysis/SpecialFunctions/JacobiTheta/`, beside the elliptic integrals
in `TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definitions and basic properties** (DLMF §20.2, 20.4.1, 20.4.7, 20.7.26–20.7.29, 20.13.1).
2. **Products, zeros and values at `z = 0`** (DLMF §20.2(iv), 20.4.2–20.4.6, 20.5.1–20.5.9).
3. **Logarithmic derivatives, double products and power series** (DLMF 20.4.8–20.4.12,
   20.5.10–20.5.17, §20.6).
4. **Identities and Watson's expansion** (DLMF 20.7.1–20.7.25, 20.7.30–20.7.34, §20.8).
5. **The modular function and the elliptic integrals** (DLMF §20.9, 20.11.5).
6. **Integrals** (DLMF §20.10).
7. **Generalizations** (DLMF §20.11 except 20.11.5).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 20.2.1–20.2.5, 20.2.10, the statements of §20.2(i)–(ii) | Definitions, Fourier series, holomorphy, parity, conjugation (1.1–1.2). |
| 20.2.6–20.2.9, 20.2.11–20.2.14, 20.7.26–20.7.29 | Lattice and half-period translations, `τ ↦ τ + 1` (1.3). |
| 20.4.1, 20.4.7 | Vanishing derivatives at `0` (1.2). |
| 20.13.1 | The heat equation (1.4). |
| — | Theta functions of order `N` with characteristics (1.5). |
| 20.5.9 | Jacobi's triple product in theta form (2.1). |
| 20.5.1–20.5.8, the statements of §20.2(iv), 20.4.2–20.4.6 | Products, zeros, theta constants, Jacobi's derivative formula (2.2–2.3). |
| 20.5.10–20.5.13, the statement of §20.5(ii) | Logarithmic derivatives (3.1). |
| 20.5.14–20.5.17, the statement of §20.5(iii) | Double products (3.2). |
| 20.6.1–20.6.10 | Power series in `z` (3.3). |
| 20.4.8–20.4.12 | Higher derivatives at `0` (3.4). |
| 20.7.1–20.7.10, 20.7.25 | Sums of squares, addition and duplication formulas (4.1). |
| 20.7.11–20.7.24 | Changes of nome: Watson's and Landen's identities (4.2). |
| 20.7.30–20.7.34 | `τ ↦ −1/τ` and the `iq` reduction (4.3). |
| 20.8.1 | Watson's expansion (4.4). |
| 20.9.1, the statements of §20.9(ii) | Modulus, `λ`, Jacobi's inversion (5.1). |
| 20.9.2, 20.11.5 | `K` and `K′` through `θ₃` (5.2–5.3). |
| 20.9.3–20.9.5 | Carlson's `R_F` (5.4). |
| 20.10.1–20.10.5 | Mellin and Laplace transforms (Layer 6). |
| 20.11.1–20.11.4, 20.11.6–20.11.9 | Gauss sums, Ramanujan's `f`, combined theta functions (Layer 7). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- 20.2.8 at `(m, n) = (1, 0)` and `(0, 1)`: Mathlib's `jacobiTheta₂_add_left` and
  `jacobiTheta₂_add_left'`; and `θ₃(z|τ + 2) = θ₃(z|τ)`: Mathlib's `jacobiTheta₂_add_right`;
- 20.7.32 for `θ₃`: Mathlib's `jacobiTheta₂_functional_equation`, after the change of variables
  `z ↦ z/π` in Conventions;
- Euler's identity `∏_{n≥1}(1 + qⁿ) ∏_{n≥0}(1 − q^{2n+1}) = 1`: Tau Ceti's
  `tprod_one_add_pow_mul_tprod_one_sub_pow_odd`, consumed in 2.3;
- the derivative of `θ₃` in `z`: Mathlib's `hasDerivAt_jacobiTheta₂_fst` and `jacobiTheta₂'`.

It also owns the following auxiliary results, which the layers need and which neither Mathlib
nor Tau Ceti provides:

| Result | Target |
|---|---|
| Theta functions of order `N` with characteristic `(a, b) ∈ {0, 1}²`: for `N ≥ 1` and `Im τ > 0`, the entire functions `f` with `f(z + π) = (−1)^a f(z)` and `f(z + πτ) = (−1)^b q^{−N} e^{−2iNz} f(z)` form the `N`-dimensional space with basis `Θ^{a,b}_{N,r}(z|τ) = ∑_{n∈ℤ} (−1)^{bn} q^{(nN+r+a/2)²/N} e^{2i(nN+r+a/2)z}`, `0 ≤ r < N` | 1.5 |
| Weierstrass's `M`-test form of locally uniform convergence for the products and series of Layers 2–3, as `HasProdLocallyUniformlyOn` and `TendstoLocallyUniformlyOn` on compact subsets of the strip or plane | 2.2, 3.1 |
| `λ(it)` is real, in `(0, 1)`, continuous in `t > 0`, with `λ(it) → 0` as `t → ∞` and `λ(it) → 1` as `t → 0+` | 5.1 |
| `λ` maps `F` bijectively onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))`; in particular `λ(τ)` and `1 − λ(τ)` avoid `[1, ∞)` on `F` | 5.3 |

**What it does not own:**
- The principal branch of `F` (SpecialFunctionsHypergeometric).
- Jacobi's triple product in other forms. The formal identity in `R⟦x⟧` is
  [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) 4.40, and that
  section assigns the analytic identity
  `J(w; q) = (w; q)_∞ (q/w; q)_∞ (q; q)_∞ = ∑_{k∈ℤ} (−1)^k q^{k(k−1)/2} w^k` to the
  GeometryOfNumbersAndQuadraticArithmetic roadmap (§4.3). 20.5.9 is the same identity in theta
  form (`q ↦ q²`, `w = −q p²`), and 2.1 proves it here from 1.5, so that neither roadmap
  consumes the other.
- The real complete elliptic integrals, the AGM and Carlson's integrals: Tau Ceti
  (`TauCeti.Real.legendreK`, `Complex.carlsonRF`); the real-variable theory of
  [EllipticIntegrals](../EllipticIntegrals/README.md).
- The transformation of `η` under `SL₂(ℤ)` ([ModularForms](../ModularForms/README.md)); this
  roadmap uses `η` only through its product, which Mathlib defines.
- Theta series of lattices of higher rank and their modularity
  ([ThetaSeries](../ThetaSeries/README.md)). The rank-one Landsberg–Schaar identity, which
  ThetaSeries does not target, is 7.1 here.
- The Jacobi elliptic functions of a complex variable, the Weierstrass functions `℘`, `ζ`, `σ`,
  multidimensional theta functions, and the applications of §§20.12–20.13 beyond 20.13.1. See
  the last section for these.

**The boundary in one sentence:** this roadmap owns `θ₁, …, θ₄` in DLMF's normalization, the
modulus `k`, the modular function `λ` and Carlson's combined theta functions, and everything in
DLMF Chapter 20 stated through them, `η`, `K`, `R_F`, `F`, `ζ`, `Γ` and elementary functions,
except the graphics, applications and computation sections; it consumes `F` from
SpecialFunctionsHypergeometric.

## Conventions

- **Names.** The functions live in `TauCeti`, beside `TauCeti.qTheta`:
  - `TauCeti.jacobiThetaOne z τ` for `θ₁(z|τ)`;
  - `TauCeti.jacobiThetaTwo z τ` for `θ₂(z|τ)`;
  - `TauCeti.jacobiThetaThree z τ` for `θ₃(z|τ)`;
  - `TauCeti.jacobiThetaFour z τ` for `θ₄(z|τ)`;
  - `TauCeti.thetaModulus τ` for `k`, `TauCeti.thetaComplModulus τ` for `k′`, and
    `TauCeti.modularLambda τ` for `λ = k²` (5.1);
  - `TauCeti.combinedTheta m n z τ` for Carlson's `φ_{m,n}` (7.3).

  The subscripted spellings `θ₂`, `jacobiTheta₂` are not used for the functions of this roadmap:
  Mathlib's `jacobiTheta₂` is the two-variable function, which is `θ₃` up to the scaling below.
  The theta constants `θⱼ(0|τ)` are the functions at `z = 0`, not new definitions, and
  `θ₁′(0|τ)` is `deriv (jacobiThetaOne · τ) 0`. Primes are derivatives in `z`. DLMF's nome
  notation `θⱼ(z, q)` is not defined: every statement is in `τ`. `Suggested.lean` also uses the
  local names `thetaMultiplier` for `M(z|τ)`, `thetaBasis N r a b` for `Θ^{a,b}_{N,r}` (1.5) and
  `thetaGaussSum` for `G(m, n)` (7.1).
- **The definitions.** With `M(z|τ) = e^{iz + iπτ/4}` (20.2.10):

```text
jacobiThetaThree z τ = jacobiTheta₂ (z/π) τ
jacobiThetaFour z τ  = jacobiTheta₂ (z/π + 1/2) τ
jacobiThetaTwo z τ   = M(z|τ) · jacobiTheta₂ (z/π + τ/2) τ
jacobiThetaOne z τ   = −i M(z|τ) · jacobiTheta₂ (z/π + 1/2 + τ/2) τ
```

  These are 20.2.11–20.2.14 read from right to left, with `θ₃(z|τ) = jacobiTheta₂ (z/π) τ`. The
  Fourier series 20.2.1–20.2.4 are theorems (1.1). For `Im τ ≤ 0` all four are the junk value
  `0`, inherited from `jacobiTheta₂`; the identities that hold there trivially are stated for all
  `τ`, the rest under `0 < τ.im`.
- **Powers of the nome.** `q^α` is `e^{iαπτ}`, as in DLMF §20.1, never a principal power of `q`.
  In particular `q^{1/4}` in 20.2.1–20.2.2, 20.4.2–20.4.3 and 20.5.1–20.5.2 is `e^{iπτ/4}`, and
  formulas in `q²` or `iq` are the formulas at `2τ` or `τ + ½`. Square roots of `τ`-dependent
  quantities, as in 20.7.30–20.7.34, are principal (`Complex.cpow · (1/2)`), and a formula that
  holds only for one branch is stated with that branch made explicit (4.3).
- **Domains.** `τ` is a complex number with `0 < τ.im`, not a point of `UpperHalfPlane`, as for
  Mathlib's `jacobiTheta₂`. The fundamental region of `Γ(2)` is
  `F = {τ | |Re τ| < 1, |τ − ½| > ½, |τ + ½| > ½}`, written out, not named; `F + 2n` is its
  translate by `2n`, `n : ℤ`.
- **Division.** Where DLMF divides by a theta function, the statement carries the hypothesis
  that the denominator does not vanish, since with `x / 0 = 0` the printed quotient is false at
  the zeros (20.7.11–20.7.12, 20.7.25, 20.7.34, 20.8.1, 20.11.9). Theta constants and `θ₁′(0|τ)`
  never vanish for `Im τ > 0` (2.2), so quotients by them need no hypothesis.
- **Equations are not predicates.** The heat equation 20.13.1 is stated with `HasDerivAt` in
  `τ` and `deriv^[2]` in `z`. The derivative formula 20.7.25 is a `HasDerivAt` statement.
- **Series and products.** Infinite sums are `HasSum` statements over `ℕ` or `ℤ`, infinite
  products `HasProd` (with `Multipliable` where the product is not otherwise named), so that the
  totalized `∑'` and `∏'` hide no divergence. The double products 20.5.14–20.5.17 and the
  lattice sums 20.6.6–20.6.9 converge only in Eisenstein's order, inner over `m`, and are
  stated as iterated limits. The lattice sums use `∑'` over `ℤ` inside and out (3.3). The
  double products use finite cutoffs that pair the factors around the half-integer shifts; the
  cutoffs are part of the statement, because the symmetric cutoff changes the limit (3.2).
- **Integrals.** The integrals of Layer 6 are Lebesgue integrals over `Set.Ioi 0`, with
  integrability part of the conclusion; the Mellin transforms are Mathlib's `mellin`.

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.gaussHypergeometric a b c z`, the principal branch of `F` on `1 − z ∈ slitPlane`.
- 1.3: agreement with Mathlib's `ordinaryHypergeometric` on `‖z‖ < 1`; 1.4: holomorphy in `z`
  on the cut plane and the identity principle there. For 5.3.

### From Tau Ceti

- **Products.** `TauCeti.qTheta`, `TauCeti.multipliable_one_sub_pow_mul`,
  `TauCeti.tprod_one_sub_pow_mul_ne_zero`, `TauCeti.tprod_one_sub_pow_ne_zero`,
  `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` and
  `TauCeti.hasProdLocallyUniformlyOn_one_sub_pow_mul`
  (`TauCeti/Analysis/SpecialFunctions/QPochhammer.lean`), for Layer 2.
- **Elliptic integrals.** `TauCeti.Real.legendreK`, `TauCeti.Real.legendreK_pos`,
  `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm` (`K(k) = π/(2M(1, k′))`),
  `TauCeti.Real.legendreK_eq_ordinaryHypergeometric` and
  `TauCeti.Real.ofReal_legendreK_eq_carlsonRF` (`K(k) = R_F(0, 1 − k², 1)`)
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`), for 5.2–5.4; and
  `TauCeti.Real.legendreK_one_div_sqrt_two` (`K(2^{−1/2}) = Γ(¼)²/(4√π)`, `Lemniscate.lean`), for
  the exact values at `τ = i` in 5.2.
- **One-variable theta.** `TauCeti.tendsto_jacobiTheta_comap_im_atTop` (`θ(τ) → 1` as
  `Im τ → ∞`, `TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`), for 2.1 and 5.2.
- **Carlson's integral.** `Complex.carlsonRF`, its symmetry lemmas and `Complex.carlsonRF_self`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Carlson/Basic.lean`), for 5.4.
- **Gauss sums.** `TauCeti.sum_range_cexp_two_pi_I_sq_div`, Gauss's evaluation of
  `∑_{r<N} e^{2πir²/N}` (`TauCeti/NumberTheory/ModularForms/JacobiTheta/GaussSum.lean`), and the
  method of its proof (the transformation of `jacobiTheta₂` at a rational point approached
  vertically), for 7.1.

### From Mathlib

- **The two-variable theta function.** `jacobiTheta₂`, `jacobiTheta₂_term`,
  `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_undef`, `jacobiTheta₂_add_left`,
  `jacobiTheta₂_add_left'`, `jacobiTheta₂_add_right`, `jacobiTheta₂_neg_left`,
  `jacobiTheta₂_conj`, `jacobiTheta₂_functional_equation`, `jacobiTheta₂'`,
  `hasDerivAt_jacobiTheta₂_fst`, `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_fderiv`,
  `differentiableAt_jacobiTheta₂_snd`, and the one-variable `jacobiTheta`.
- **Dedekind's `η`.** `ModularForm.eta` (`η(τ) = e^{iπτ/12} ∏_{n≥1}(1 − e^{2πinτ})`) and
  `ModularForm.eta_ne_zero`, for 2.3 and 4.3.
- **Zeta and Gamma.** `riemannZeta`, `Complex.Gamma`, `mellin`, and the Mellin-transform
  construction of `completedRiemannZeta`, for Layer 6.
- **AGM.** `NNReal.agm` and `NNReal.agm_mul_distrib`, for 5.2.
- **Complex analysis.** `Differentiable.apply_eq_apply_of_bounded` (Liouville),
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `HasProd`, `Multipliable`,
  `HasProdLocallyUniformlyOn`, `TendstoLocallyUniformlyOn`, `logDeriv`, `Complex.slitPlane`,
  `Complex.cpow`.
- **Open pull request.** Mathlib PR #42118 adds `hasDerivAt_jacobiTheta₂_snd`, the derivative of
  `jacobiTheta₂` in `τ`. 1.4 states the heat equation in that shape.

## How to read the build

Layer 1 transports Mathlib's `jacobiTheta₂` to the four functions and proves everything that
follows from the series alone. It ends with 1.5, the finite-dimensional spaces of theta functions
of order `N` with characteristics. Each `θⱼ` lies in such a space of order 1, and a product of
`N` of them at shifted arguments lies in one of order `N`. Two entire functions in the same space
are equal once `N` Fourier coefficients agree. Layer 2 is the analytic core: the triple product
2.1, proved from 1.5, turns each `θⱼ` into a product, which locates the zeros and gives the
theta constants and Jacobi's derivative formula. Layer 3 differentiates the products
logarithmically. Layer 4 proves the identities from 1.5 and from Watson's product formula
20.7.13–20.7.14. The transformation `τ ↦ −1/τ` comes from Mathlib's
`jacobiTheta₂_functional_equation` through the half-period translations. Layer 5 turns the
identities into the theory of `λ` and, through Gauss's AGM, into `K = (π/2)θ₃²`; Layers 6–7
apply Layers 1–5. The `**Checks.**` and `### Examples` of each layer are statements to prove;
they test the conventions on explicit values. Every decimal value in them was computed
independently of the formula it checks, by summing the series of Mathlib's `jacobiTheta₂` and by
mpmath's `jtheta`.

## Layer 1: definitions and basic properties

### 1.1 Definitions and Fourier series

- The definitions of [Conventions](#conventions), and the lattice points
  `z_{m,n} = (m + nτ)π` of 20.2.5.
- 20.2.1–20.2.4 as `HasSum` statements over `n : ℕ` for `0 < τ.im` and every complex `z`, and
  the bilateral forms `θ₃(z|τ) = ∑_{n∈ℤ} q^{n²} e^{2inz}`,
  `θ₄(z|τ) = ∑_{n∈ℤ} (−1)ⁿ q^{n²} e^{2inz}`, `θ₂(z|τ) = ∑_{n∈ℤ} q^{(n+½)²} e^{(2n+1)iz}` and
  `θ₁(z|τ) = −i ∑_{n∈ℤ} (−1)ⁿ q^{(n+½)²} e^{(2n+1)iz}`.

**Checks.**
- At `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)`:
  - `θ₁ = 0.22763 57285 74… + 0.27263 21850 08… i`;
  - `θ₂ = 0.93043 84122 38… + 0.24364 61252 64… i`;
  - `θ₃ = 1.05871 06558 16… + 0.09191 32090 46… i`;
  - `θ₄ = 0.94125 80999 34… − 0.09194 83361 20… i`.
- `θ₁(1|i) = 0.76707 70950 99…`, real (1.2).
- For `τ = −1 + i`, `q^{1/4} = e^{iπτ/4} = e^{−π/4} e^{−iπ/4}`, which is not the principal
  fourth root of `q = −e^{−π}`; the series 20.2.1 with this `q^{1/4}` is `θ₁`.

*Needs:* Mathlib `jacobiTheta₂`, `hasSum_jacobiTheta₂_term`.

### 1.2 Analytic properties, parity and conjugation

- **Holomorphy** (§20.2(ii)): each `θⱼ(·|τ)` is entire for `0 < τ.im`, and each `θⱼ` is
  holomorphic in `(z, τ)` on `ℂ × {Im τ > 0}` (`DifferentiableOn ℂ` of the uncurried function).
- **Derivatives** (§20.2(i), second paragraph): the series of 20.2.1–20.2.4 may be
  differentiated termwise in `z` any number of times, as `HasSum` of the differentiated terms.
- **Parity and periodicity** (§20.2(ii)): `θ₁` is odd and `θ₂, θ₃, θ₄` are even in `z`;
  `θ₁(z + π) = −θ₁(z)`, `θ₂(z + π) = −θ₂(z)`, `θ₃(z + π) = θ₃(z)`, `θ₄(z + π) = θ₄(z)`, so all
  four are `2π`-periodic (20.2.6–20.2.9 at `n = 0`).
- **Conjugation:** `θⱼ(z̄ | −τ̄) = conj θⱼ(z|τ)` for all `z`, `τ`, from `jacobiTheta₂_conj`; so
  `θⱼ(x|it)` is real for real `x` and `t > 0`.
- 20.4.1 and 20.4.7: `θ₁^{(2n)}(0|τ) = θ₂^{(2n+1)}(0|τ) = θ₃^{(2n+1)}(0|τ) =
  θ₄^{(2n+1)}(0|τ) = 0` for all `n : ℕ`, with `iteratedDeriv`, from parity.

*Needs:* 1.1; Mathlib `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_neg_left`, `jacobiTheta₂_conj`.

### 1.3 Translations

- 20.2.6–20.2.9 for all `m, n : ℤ` and all `τ`:

```text
θ₁(z + (m + nτ)π | τ) = (−1)^{m+n} q^{−n²} e^{−2inz} θ₁(z|τ)
θ₂(z + (m + nτ)π | τ) = (−1)^m     q^{−n²} e^{−2inz} θ₂(z|τ)
θ₃(z + (m + nτ)π | τ) =            q^{−n²} e^{−2inz} θ₃(z|τ)
θ₄(z + (m + nτ)π | τ) = (−1)^n     q^{−n²} e^{−2inz} θ₄(z|τ)
```

- 20.2.11–20.2.14: each `θⱼ(z|τ)` expressed through the other three at `z + π/2`, `z + πτ/2` and
  `z + π/2 + πτ/2`, with the multiplier `M(z|τ)`, for all `τ`.
- 20.7.26–20.7.29, for all `τ`: `θ₁(z|τ + 1) = e^{iπ/4} θ₁(z|τ)`,
  `θ₂(z|τ + 1) = e^{iπ/4} θ₂(z|τ)`, `θ₃(z|τ + 1) = θ₄(z|τ)`, `θ₄(z|τ + 1) = θ₃(z|τ)`.

**Checks.**
- 20.2.6 at `(m, n) = (2, −1)`, `(z, τ) = (0.2 + 0.1i, 0.3 + 0.7i)`: both sides agree to
  working precision.
- 20.7.26–20.7.29 at `(z, τ) = (0.3 + 0.2i, 0.7 + 0.5i)` hold to working precision with the
  definitions of Conventions. Between `τ` and `τ + 1 = 1.7 + 0.5i` the principal fourth root of
  the nome jumps by a factor `−i`, at `Re τ = 1`, and `e^{iπτ/4}` does not.

*Needs:* 1.1; Mathlib `jacobiTheta₂_add_left`, `jacobiTheta₂_add_left'`,
`jacobiTheta₂_add_right`.

### 1.4 The heat equation

20.13.1: for `0 < τ.im`, each `θⱼ` satisfies
`∂θⱼ/∂τ (z|τ) = −(iπ/4) ∂²θⱼ/∂z² (z|τ)`, stated as `HasDerivAt (θⱼ z ·) (−(iπ/4) ·
deriv^[2] (θⱼ · τ) z) τ`. For `θ₃` this is the termwise identity
`∂_τ e^{2inz + iπn²τ} = −(iπ/4) ∂_z² e^{2inz + iπn²τ}`, with the derivative of `jacobiTheta₂` in
`τ` (`hasFDerivAt_jacobiTheta₂`, or `hasDerivAt_jacobiTheta₂_snd` of Mathlib PR #42118); the
other three follow from the definitions.

**Checks.**
- The residual `∂_τ θⱼ + (iπ/4) ∂_z² θⱼ` at `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)` is `0` to working
  precision for `j = 1, …, 4`.

*Needs:* 1.1–1.2; Mathlib `hasFDerivAt_jacobiTheta₂`, `jacobiTheta₂_fderiv`.

### 1.5 Theta functions of order `N` with characteristics

- The auxiliary spaces of [Scope and ownership](#scope-and-ownership). For `N ≥ 1`, `0 < τ.im`
  and `a, b ∈ {0, 1}`, let `V^{a,b}_N(τ)` be the entire `f` with `f(z + π) = (−1)^a f(z)` and
  `f(z + πτ) = (−1)^b q^{−N} e^{−2iNz} f(z)`. Every such `f` is `∑_{r<N} c_r Θ^{a,b}_{N,r}(z|τ)`,
  and the `Θ^{a,b}_{N,r}` are linearly independent. Proof: by the first relation `f` is a
  Fourier series `∑ c_k e^{i(2k+a)z}`, and the second is the recurrence
  `c_{k+N} = (−1)^b q^{2k+a+N} c_k`; distinct `r` have disjoint Fourier supports. Written through
  Mathlib, `Θ^{a,b}_{N,r}(z|τ) = e^{iπτ s²/N + 2isz} jacobiTheta₂ (Nz/π + sτ + b/2) (Nτ)` with
  `s = r + a/2`.
- The characteristics of the four functions: `θ₃ ∈ V^{0,0}_1`, `θ₄ ∈ V^{0,1}_1`, `θ₂ ∈ V^{1,0}_1`
  and `θ₁ ∈ V^{1,1}_1`. In fact `θ₃ = Θ^{0,0}_{1,0}`, `θ₄ = Θ^{0,1}_{1,0}`, `θ₂ = Θ^{1,0}_{1,0}` and
  `θ₁ = −i Θ^{1,1}_{1,0}`, by 1.1.
- The product rule: if `fᵢ ∈ V^{aᵢ,bᵢ}_{Nᵢ}` and `c₁, …, c_k` satisfy `∑ Nᵢ cᵢ = 0`, then
  `z ↦ ∏ᵢ fᵢ(z + cᵢ)` lies in `V^{a,b}_N` with `N = ∑ Nᵢ`, `a ≡ ∑ aᵢ` and `b ≡ ∑ bᵢ (mod 2)`.
  Every identity of Layer 4 that 1.5 proves is stated between two elements of one `V^{a,b}_N`,
  named in the proof.

**Checks.**
- `θ₂ = Θ^{1,0}_{1,0}` and `iθ₁ = Θ^{1,1}_{1,0}` at `(z, τ) = (0.2 + 0.1i, 0.3 + 0.8i)` to working
  precision.
- `θ₂` is not a multiple of `e^{icz}θ₃` for any `c`: `θ₂(π/2|τ) = 0 ≠ θ₃(π/2|τ) = θ₄(0|τ)`. The
  two lie in different spaces `V^{1,0}_1` and `V^{0,0}_1`.
- `z ↦ θ₁(z + w|τ)θ₁(z − w|τ)` lies in `V^{0,0}_2`. At `(z, w, τ) = (0.2 + 0.1i, 0.4 − 0.2i,
  0.3 + 0.8i)` both of its relations hold to working precision.

*Needs:* 1.1–1.3; Mathlib Fourier series of periodic entire functions (`fourierCoeff`,
`hasSum_fourier_series_of_summable`), or directly the Laurent series of `f(z)` in `e^{2iz}`.

### Examples

- `θ₃(z|τ + 2) = θ₃(z|τ)` and `θ₁(z|τ + 8) = θ₁(z|τ)`, from 20.7.26–20.7.29.
- `θ₁(mπ|τ) = 0` for `m : ℤ`, from parity and 20.2.6.

### Dependencies

Mathlib `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean`.

## Layer 2: products, zeros and values at `z = 0`

### 2.1 Jacobi's triple product

- 20.5.9: for `0 < τ.im` and complex `z`, with `p = e^{iπz}`,
  `θ₃(πz|τ) = ∑_{n∈ℤ} p^{2n} q^{n²} = ∏_{n≥1}(1 − q^{2n})(1 + q^{2n−1}p²)(1 + q^{2n−1}p^{−2})`,
  with multipliability. The analytic triple product for complex `a ≠ 0` and `‖x‖ < 1`,
  `∑_{n∈ℤ} aⁿ x^{n²} = ∏_{n≥1}(1 − x^{2n})(1 + a x^{2n−1})(1 + a⁻¹x^{2n−1})`, is a corollary
  (choose `τ` with `q = x` and `z` with `p² = a` when `x ≠ 0`; the case `x = 0` is immediate).
- Proof, following Whittaker–Watson §21.3. Write `P(z|τ)` for the product at `p = e^{iz}`; the
  product is then for `θ₃(z|τ)`.
  - `P(·|τ)` is entire and `π`-periodic. Shifting `z` by `πτ` changes only one factor at each
    end, so `P(z + πτ|τ) = q^{−1} e^{−2iz} P(z|τ)`. Hence `P ∈ V^{0,0}_1(τ)`, and
    `P = G(τ) θ₃(·|τ)` by 1.5.
  - At `z = π/4`, `P(π/4|τ) = ∏(1 − q^{2n})(1 + q^{4n−2})`, while `θ₃(π/4|τ) = θ₄(0|4τ)` from
    the series.
  - At `z = π/2` with `4τ` in place of `τ`, `P(π/2|4τ) = ∏(1 − q^{8n})(1 − q^{8n−4})²`, while
    `θ₃(π/2|4τ) = θ₄(0|4τ)`.
  - The two products are equal, by splitting `1 − q^{2n}` over even and odd `n`. They are
    nonzero (`TauCeti.tprod_one_sub_pow_mul_ne_zero`), so `θ₄(0|4τ) ≠ 0` and `G(τ) = G(4τ)`.
  - Finally `G(4^kτ) → 1`, because the product tends to `1` and `θ₃(0|4^kτ) → 1`
    (`TauCeti.tendsto_jacobiTheta_comap_im_atTop`). Hence `G = 1`.

**Checks.**
- At `z = ½`, `p² = −1`: `θ₄(0|τ) = ∏_{n≥1}(1 − q^{2n})(1 − q^{2n−1})²`, which is 20.4.5.

*Needs:* 1.1–1.3, 1.5; Tau Ceti `TauCeti/Analysis/SpecialFunctions/QPochhammer.lean`,
`TauCeti.tendsto_jacobiTheta_comap_im_atTop`.

### 2.2 Products and zeros

- 20.5.1–20.5.4: each `θⱼ(z|τ)`, for `0 < τ.im` and all `z`, as `HasProd` of the printed
  factors times the printed prefactor (`2q^{1/4} sin z`, `2q^{1/4} cos z`, `1`, `1`), from 2.1 and
  1.3. The products converge locally uniformly in `z`.
- **Zeros** (§20.2(iv)): for `0 < τ.im`, `θ₁(z|τ) = 0` iff `z = (m + nτ)π`,
  `θ₂(z|τ) = 0` iff `z = (m + ½ + nτ)π`, `θ₃(z|τ) = 0` iff `z = (m + ½ + (n + ½)τ)π`,
  `θ₄(z|τ) = 0` iff `z = (m + (n + ½)τ)π`, for some `m, n : ℤ`; every zero is simple
  (`deriv` nonzero there).
- **Theta constants:** 20.4.2–20.4.5, the products for `θ₁′(0|τ)`, `θ₂(0|τ)`, `θ₃(0|τ)`,
  `θ₄(0|τ)`; in particular these four never vanish for `0 < τ.im`.

**Checks.**
- `θ₃(0|i) = 1.08643 48112 13…` and `θ₂(0|i) = θ₄(0|i) = 0.91357 91381 56…`, from the products;
  the closed forms are in 5.2.
- `θ₂(π/2 + πτ|τ) = 0` and `θ₃(π/2 + πτ/2|τ) = 0` at `τ = 0.4 + 0.9i`.

*Needs:* 1.1–1.3, 2.1; Tau Ceti `TauCeti.tprod_one_sub_pow_mul_ne_zero`,
`TauCeti.hasProdLocallyUniformlyOn_one_sub_pow_mul`.

### 2.3 Jacobi's derivative formula and the sine products

- 20.4.6: `θ₁′(0|τ) = θ₂(0|τ) θ₃(0|τ) θ₄(0|τ)` for `0 < τ.im`, from 20.4.2–20.4.5 and Euler's
  identity `TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd` at `q`, which gives
  `∏_{n≥1}(1 + q^{2n})(1 + q^{2n−1})(1 − q^{2n−1}) = 1`.
- `θ₁′(0|τ) = 2η(τ)³` with Mathlib's `ModularForm.eta`, for `0 < τ.im`, from 20.4.2.
- 20.5.5–20.5.8: the products over `sin(nπτ ± z)`, `cos(nπτ ± z)`, `cos((n − ½)πτ ± z)`,
  `sin((n − ½)πτ ± z)`, as `HasProd` for `0 < τ.im`, with the theta constants as prefactors; the
  denominators `sin²(nπτ)`, `cos²(nπτ)`, … do not vanish for `0 < τ.im`.

**Checks.**
- At `τ = i`: `θ₁′(0|i) = 2η(i)³ = 0.90676 76551 67…`, with `η(i) = 0.76822 54223 26…`; the
  closed form `η(i) = Γ(¼)/(2π^{3/4})` follows in 5.2.
- 20.5.5 at `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)`: the product equals `θ₁` to working precision.

*Needs:* 2.1–2.2; Mathlib `ModularForm.eta`; Tau Ceti
`TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd`.

### Examples

- `θ₂(0|τ)/θ₃(0|τ) → 0` as `Im τ → ∞`, from 20.4.3–20.4.4.
- `θ₁(z|τ)/θ₄(z|τ)` is meromorphic with simple poles exactly at `(m + (n + ½)τ)π`.

### Dependencies

Layer 1; Tau Ceti `QPochhammer.lean`, `JacobiTheta/OneVariable.lean`; Mathlib
`DedekindEta.lean`.

## Layer 3: logarithmic derivatives, double products and power series

### 3.1 Logarithmic derivatives

- 20.5.10–20.5.13, both printed series in each, as `HasSum`: for `θ₁` and `θ₂` in the strip
  `|Im z| < π Im τ`, for `θ₃` and `θ₄` in `|Im z| < π Im τ/2`. The left sides are
  `logDeriv (θⱼ · τ) z − cot z` for `θ₁`, `logDeriv (θⱼ · τ) z + tan z` for `θ₂`, and
  `logDeriv (θⱼ · τ) z` for `θ₃`, `θ₄`. In the strip the only zeros of `θ₁`, `θ₂` are the real
  points `mπ`, respectively `(m + ½)π`, where the left side has a removable singularity; the
  statement for `θ₁`, `θ₂` is for `z` other than these points.
- §20.5(ii), third paragraph: the series converge absolutely and locally uniformly in the strips.

### 3.2 Double products

- 20.5.14–20.5.17, for `0 < τ.im` and all `z`, as iterated limits. Let `wⱼ(m, n)` be the
  lattice point of 20.5.14–20.5.17: `(m + nτ)π`, `(m − ½ + nτ)π`, `(m − ½ + (n − ½)τ)π` and
  `(m + (n − ½)τ)π` for `j = 1, 2, 3, 4`. For each `n : ℤ` the limit
  `Lⱼ(n) = lim_{M→∞} ∏_{m∈Iⱼ(M)} (1 + z/wⱼ(m, n))` exists, omitting `(m, n) = (0, 0)` for
  `j = 1`. Then `cⱼ ∏_{n∈Jⱼ(N)} Lⱼ(n) → θⱼ(z|τ)` as `N → ∞`, with `c₁ = z θ₁′(0|τ)` and
  `cⱼ = θⱼ(0|τ)` for `j = 2, 3, 4`. The ranges are:

| `j` | inner range `Iⱼ(M)` | outer range `Jⱼ(N)` |
|---|---|---|
| 1 | `−M ≤ m ≤ M` | `−N ≤ n ≤ N` |
| 2 | `1 − M ≤ m ≤ M` | `−N ≤ n ≤ N` |
| 3 | `1 − M ≤ m ≤ M` | `1 − N ≤ n ≤ N` |
| 4 | `−M ≤ m ≤ M` | `1 − N ≤ n ≤ N` |

  The pairing matters: for `j = 4` the inner limit is
  `L₄(n) = sin(z + (n − ½)πτ)/sin((n − ½)πτ)`, and `L₄(−N) → e^{iz}` as `N → ∞`, so the
  symmetric outer range `−N ≤ n ≤ N` gives `e^{iz} θ₄(z|τ)` instead of `θ₄(z|τ)`.
- §20.5(iii): the double products do not converge absolutely; the family
  `(m, n) ↦ z/((m + nτ)π)` is not summable for `z ≠ 0`.

**Checks.**
- 20.5.17 at `(z, τ) = (π/2, i)`: the paired products tend to `θ₄(π/2|i) = θ₃(0|i) =
  1.08643 48112 13…`; with the symmetric outer range they tend to `i θ₃(0|i)`.

### 3.3 Power series

- 20.6.1 and 20.6.6–20.6.9: `δ_{2j}(τ) = ∑_n ∑_m (m + nτ)^{−2j}` over `(m, n) ≠ (0, 0)`,
  `α_{2j}(τ) = ∑_n ∑_m (m − ½ + nτ)^{−2j}`, `β_{2j}(τ) = ∑_n ∑_m (m − ½ + (n − ½)τ)^{−2j}`,
  `γ_{2j}(τ) = ∑_n ∑_m (m + (n − ½)τ)^{−2j}`, `j ≥ 1`, as iterated sums inner over `m`; for
  `j ≥ 2` they converge absolutely, for `j = 1` only in this order.
- 20.6.2–20.6.5: `θ₁(πz|τ) = πz θ₁′(0|τ) exp(−∑_{j≥1} δ_{2j}(τ) z^{2j}/(2j))` for
  `|z| < min_{(m,n)≠0} |m + nτ|`, and the analogues for `θ₂, θ₃, θ₄` with `α, β, γ` in the disc
  reaching the nearest zero of `θⱼ(π·|τ)`; the series is part of the conclusion.
- 20.6.10: `α_{2j}(τ) = 2^{2j} δ_{2j}(2τ) − δ_{2j}(τ)` and
  `β_{2j}(τ) = 2^{2j} γ_{2j}(2τ) − γ_{2j}(τ)` for `j ≥ 1`.

**Checks.**
- 20.6.2 at `(z, τ) = (0.25 + 0.1i, 0.2 + 0.9i)`, with `δ_{2j}` computed from the Lambert series
  `2ζ(2j) + 2(2πi)^{2j}/(2j − 1)! ∑_{n≥1} n^{2j−1} e^{2πinτ}/(1 − e^{2πinτ})`: both sides of the
  logarithmic form agree to working precision.

### 3.4 Higher derivatives at `z = 0`

- 20.4.8–20.4.11: `θ₁‴(0)/θ₁′(0) = −1 + 24 ∑_{n≥1} q^{2n}/(1 − q^{2n})²`,
  `θ₂″(0)/θ₂(0) = −1 − 8 ∑_{n≥1} q^{2n}/(1 + q^{2n})²`,
  `θ₃″(0)/θ₃(0) = −8 ∑_{n≥1} q^{2n−1}/(1 + q^{2n−1})²`,
  `θ₄″(0)/θ₄(0) = 8 ∑_{n≥1} q^{2n−1}/(1 − q^{2n−1})²`, as `HasSum`, for `0 < τ.im`.
- 20.4.12: `θ₁‴(0)/θ₁′(0) = θ₂″(0)/θ₂(0) + θ₃″(0)/θ₃(0) + θ₄″(0)/θ₄(0)`.

**Checks.**
- `θ₁‴(0|i)/θ₁′(0|i) = −3/π = −0.95492 96585 51…`, equal to `−E₂(i)` with Mathlib's
  `logDeriv_eta_eq_E2`.

*Needs:* Layers 1–2.

### Examples

- By the heat equation 1.4 differentiated in `z` at `0`,
  `θ₁‴(0|τ)/θ₁′(0|τ) = (4i/π) ∂_τ log θ₁′(0|τ)`; with `θ₁′(0|τ) = 2η(τ)³` and
  `logDeriv_eta_eq_E2` this is `−E₂(τ)`, which is 20.4.8 written through Eisenstein's `E₂`.

### Dependencies

Layers 1–2; Mathlib `logDeriv`, `TendstoLocallyUniformlyOn`.

## Layer 4: identities and Watson's expansion

### 4.1 Sums of squares, addition and duplication

- 20.7.1–20.7.4, the quadratic relations among `θⱼ²(z|τ)` with theta-constant coefficients, and
  20.7.5, Jacobi's quartic identity `θ₃⁴(0|τ) = θ₂⁴(0|τ) + θ₄⁴(0|τ)`, for `0 < τ.im`. Each
  square `θⱼ²` lies in `V^{0,0}_2` by the product rule of 1.5. Evaluation at `z = 0` and
  `z = π/2` is injective on `V^{0,0}_2`: on the basis `Θ^{0,0}_{2,0}`, `Θ^{0,0}_{2,1}` its
  determinant is `−2θ₃(0|2τ)θ₂(0|2τ) ≠ 0`. So the relations hold once both sides agree at
  these two points.
- 20.7.6–20.7.9, the addition formulas for `θⱼ(z + w) θⱼ(z − w)`, as identities in `z` in
  `V^{0,0}_2` for fixed `w`, and 20.7.10, the duplication formula for `θ₁(2z|τ)`, for all
  `z, w`.
- 20.7.25: `d/dz (θ₂(z|τ)/θ₄(z|τ)) = −θ₃²(0|τ) θ₁(z|τ) θ₃(z|τ)/θ₄²(z|τ)` as `HasDerivAt` at
  every `z` with `θ₄(z|τ) ≠ 0`.

**Checks.**
- 20.7.5 at `τ = i`: `θ₃⁴(0|i) = 1.39320 39296 85… = 2θ₂⁴(0|i)`.

### 4.2 Changes of nome

- 20.7.11–20.7.12 (`q² ↔ 2τ`): `θ₁(z|τ)θ₂(z|τ)/θ₁(2z|2τ) = θ₃(z|τ)θ₄(z|τ)/θ₄(2z|2τ) =
  θ₄(0|2τ)` and `θ₁(z|2τ)θ₄(z|2τ)/θ₁(z|τ) = θ₂(z|2τ)θ₃(z|2τ)/θ₂(z|τ) = θ₂(0|τ)/2`, each
  quotient where its denominator does not vanish.
- 20.7.13–20.7.14, Watson's identities, for all `z, w`:
  `θ₁(z|τ)θ₁(w|τ) = θ₃(z + w|2τ)θ₂(z − w|2τ) − θ₂(z + w|2τ)θ₃(z − w|2τ)` and
  `θ₃(z|τ)θ₃(w|τ) = θ₃(z + w|2τ)θ₃(z − w|2τ) + θ₂(z + w|2τ)θ₂(z − w|2τ)`. Proof: the left side
  of 20.7.14 is the absolutely convergent double sum `∑_{j,k} q^{j²+k²} e^{2i(jz+kw)}`.
  Reindexing by `(j + k, j − k)`, split by the parity of `j + k`, gives the right side, and
  20.7.13 follows by 1.3.
- 20.7.11–20.7.12 from 20.7.13–20.7.14 with the half-period translations of 1.3; for example
  20.7.13 at `w = z + π/2` is `θ₁(z|τ)θ₂(z|τ) = θ₄(0|2τ)θ₁(2z|2τ)`.
- 20.7.15–20.7.24, Landen's transformations of order 2 and 4, with `A(τ) = 1/θ₄(0|2τ)` (20.7.15)
  and `B(τ) = 1/(θ₃(0|τ)θ₄(0|τ)θ₃(π/4|τ))` (20.7.20) as written-out factors; `θ₃(π/4|τ) ≠ 0` is
  part of the target.

### 4.3 The transformation `τ ↦ −1/τ`

- 20.7.30–20.7.33 for `0 < τ.im`, `τ′ = −1/τ`, principal `(−iτ)^{1/2}`:
  `(−iτ)^{1/2} θ₁(z|τ) = −i e^{iτ′z²/π} θ₁(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₂(z|τ) = e^{iτ′z²/π} θ₄(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₃(z|τ) = e^{iτ′z²/π} θ₃(zτ′|τ′)`,
  `(−iτ)^{1/2} θ₄(z|τ) = e^{iτ′z²/π} θ₂(zτ′|τ′)`.
  The third is Mathlib's `jacobiTheta₂_functional_equation`; the others follow by 1.3.
- 20.7.34 (`q² ↔ 2τ`, `iq ↔ τ + ½`), in the corrected form
  `θ₁(z|2τ)θ₃(z|2τ)/θ₁(z|τ + ½) = θ₂(z|2τ)θ₄(z|2τ)/θ₂(z|τ + ½) =
  e^{−iπ/8} η(τ)η(4τ)/η(2τ)` for `0 < τ.im`, each quotient where its denominator does not
  vanish, with Mathlib's `ModularForm.eta`; its square,
  `e^{−iπ/4} θ₂(0|2τ)θ₄(0|2τ)/2`; and the printed form
  `e^{−iπ/8}(θ₂(0|2τ)θ₄(0|2τ)/2)^{1/2}` with the principal root for `τ = it`, `t > 0`. The
  printed form with the principal root is false in general: the eta quotient is the holomorphic
  square root, and it differs from the principal one by a sign on part of the half-plane.

**Checks.**
- 20.7.34 at `(z, τ) = (0.3 + 0.1i, −2.19 + 1.29i)`: the quotients and the eta form are
  `−0.18715 75018 − 0.31106 51823 i`, the printed principal form is
  `+0.18715 75018 + 0.31106 51823 i`; at `τ = 0.7i` all three agree.
- 20.7.30–20.7.33 at `(z, τ) = (0.3 + 0.2i, 1.7 + 0.6i)` hold to working precision.

### 4.4 Watson's expansion

- 20.8.1: `θ₂(0|τ)θ₃(z|τ)θ₄(z|τ)/θ₂(z|τ) =
  2 ∑_{n∈ℤ} (−1)ⁿ q^{n²} e^{2inz}/(q^{−n} e^{−iz} + qⁿ e^{iz})` as `HasSum`, for `0 < τ.im` and
  `θ₂(z|τ) ≠ 0`; the denominators `q^{−n}e^{−iz} + qⁿe^{iz}` vanish exactly at the zeros of
  `θ₂(z|τ)`.

**Checks.**
- At `(z, τ) = (0.3 + 0.2i, 0.4 + 0.9i)` both sides are `1.02653 87728 08… + 0.05068 33609 77… i`.

*Needs:* Layers 1–2 (with 1.5); Mathlib `jacobiTheta₂_functional_equation`,
`ModularForm.eta`.

### Examples

- 20.7.14 at `w = z = 0` and at `w = z = π/2` gives `θ₃²(0|τ) = θ₃²(0|2τ) + θ₂²(0|2τ)` and
  `θ₄²(0|τ) = θ₃²(0|2τ) − θ₂²(0|2τ)`, so `(θ₃²(0|τ) + θ₄²(0|τ))/2 = θ₃²(0|2τ)`.
- 20.7.11 at `z = 0` gives `θ₃(0|τ)θ₄(0|τ) = θ₄²(0|2τ)`; with the previous example this is the
  AGM step of 5.2.

### Dependencies

Layers 1–2; Mathlib `jacobiTheta₂_functional_equation`, `DedekindEta.lean`.

## Layer 5: the modular function and the elliptic integrals

### 5.1 Modulus, `λ` and Jacobi's inversion

- 20.9.1: `thetaModulus τ = θ₂²(0|τ)/θ₃²(0|τ)`, `thetaComplModulus τ = θ₄²(0|τ)/θ₃²(0|τ)`,
  `modularLambda τ = thetaModulus τ ^ 2`; `k² + k′² = 1` by 20.7.5.
- §20.9(ii), the elliptic modular function: `λ` is holomorphic on `{Im τ > 0}`, never `0` or `1`
  there, `λ(τ + 2) = λ(τ)`, `λ(τ + 1) = λ(τ)/(λ(τ) − 1)` and `λ(−1/τ) = 1 − λ(τ)`, by 1.3 and
  4.3.
- The auxiliary results on the imaginary axis (Scope and ownership), and Jacobi's inversion
  (§20.9(ii)): for `0 < k < 1` there is exactly one `t > 0` with `thetaModulus (it) = k`.
  Existence is the intermediate value theorem; uniqueness is 5.2, which gives
  `t = K′(k)/K(k)`.

**Checks.**
- `λ(i) = ½`, from `λ(−1/i) = 1 − λ(i)`.
- `λ(0.3 + 0.8i) = 0.76600 28750 45… + 0.40978 63252 79… i`, and
  `λ(1.3 + 0.8i) = −0.05082 47896 57… − 1.84025 17943 33… i`, which is `λ/(λ − 1)` of it.

### 5.2 `K` in the rectangular case

- 20.9.2 for `τ = it`, `t > 0`, with `k = thetaModulus (it)` (real, in `(0, 1)`) and Tau Ceti's
  `K(k) = TauCeti.Real.legendreK k`: `K(k) = (π/2) θ₃²(0|it)` and `K′(k) = K(k′) = t K(k)`.
  Proof:
  - By the two Examples of Layer 4, the AGM step maps `(θ₃²(0|it), θ₄²(0|it))` to
    `(θ₃²(0|2it), θ₄²(0|2it))`.
  - The AGM is invariant under the step, and the iterates tend to `(1, 1)` by
    `TauCeti.tendsto_jacobiTheta_comap_im_atTop` and 1.3. Hence `M(θ₃²(0|it), θ₄²(0|it)) = 1`.
  - `NNReal.agm_mul_distrib` then gives `M(1, k′) = θ₃⁻²(0|it)` with `k′ = θ₄²/θ₃²`, and
    `legendreK_eq_pi_div_two_mul_agm` gives `K = (π/2)θ₃²`.
  - `K′ = tK` follows from `λ(i/t) = 1 − λ(it)` and 20.7.32 at `z = 0`.
- The nome: `q = e^{−πt} = exp(−π K′(k)/K(k))` (§20.9(ii)).

**Checks.**
- At `τ = i`: `k = 2^{−1/2}`, `K(2^{−1/2}) = (π/2) θ₃²(0|i) = 1.85407 46773 01…`, `K′ = K`.

### Examples

- The closed forms at `τ = i`, from 5.2 and `TauCeti.Real.legendreK_one_div_sqrt_two`:
  - `θ₃(0|i) = Γ(¼)/(2^{1/2} π^{3/4}) = π^{1/4}/Γ(¾)`;
  - `θ₂(0|i) = θ₄(0|i) = 2^{−1/4} θ₃(0|i)`, by `λ(i) = ½`;
  - `η(i) = Γ(¼)/(2π^{3/4})`, by 2.3 and 20.4.6.

### 5.3 `K` for complex `τ` and the hypergeometric form

- 20.11.5 and 20.9.2 on `F + 2n`, `n : ℤ`: for such `τ`, `λ(τ) ∉ [1, ∞)` and
  `F(½, ½; 1; λ(τ)) = θ₃²(0|τ)` with the principal `Complex.gaussHypergeometric` of
  SpecialFunctionsHypergeometric, so `K(k) = (π/2)θ₃²(0|τ)` for the principal complex `K`; on
  `F`, also `K′(k) = −iτ K(k)`, with `K′(k) = (π/2) F(½, ½; 1; 1 − λ(τ))`.
- The auxiliary mapping theorem, and with it the cut avoidance that the principal branches
  need: `λ` maps `F` bijectively onto `ℂ ∖ ((−∞, 0] ∪ [1, ∞))`. Proof: the boundary
  correspondence and the argument principle on truncations of `F`.
  - By 5.1 and 1.3, `λ` is real and negative on the lines `Re τ = ±1`, and real and greater
    than `1` on the semicircles `|τ ± ½| = ½`.
  - At the cusps, `λ → 0` at `i∞`, `λ → 1` at `0` and `λ → ∞` at `±1`.
- Proof of the identities: on the imaginary axis they are 5.2 with
  `legendreK_eq_ordinaryHypergeometric`. Both sides are holomorphic on the connected open set
  `F`, by the mapping theorem, and `λ(τ + 2) = λ(τ)`, `θ₃(0|τ + 2) = θ₃(0|τ)` carry them to
  `F + 2n`.
- 20.11.5 in the rectangular case, with Mathlib's `ordinaryHypergeometric`.

**Checks.**
- `F(½, ½; 1; ½) = θ₃²(0|i) = 1.18034 05990 16…`.
- At `τ = 0.3 + 0.8i ∈ F` and at `τ = 2.3 + 0.8i ∈ F + 2` both sides are
  `1.18219 88370… + 0.28696 19062… i`.
- At `τ = 0.5 + 0.3i`, outside every `F + 2n`, `θ₃²(0|τ) = 0.48635 46173… + 1.63137 83624… i` and
  the principal `F(½, ½; 1; λ(τ)) = 0.97882 70174… − 0.29181 27704… i`: the identity fails there.

### 5.4 Carlson's forms

- 20.9.3 in two corrected forms, with Tau Ceti's `Complex.carlsonRF`:
  `R_F(θ₂²(z|τ)/θ₂²(0|τ), θ₃²(z|τ)/θ₃²(0|τ), θ₄²(z|τ)/θ₄²(0|τ)) = z θ₁′(0|τ)/θ₁(z|τ)`
  - for `τ = it`, `t > 0`, and complex `z ≠ 0` with `|Re z| < π/2`, `|Im z| < πt/2`;
  - for every `τ` with `0 < τ.im`, for all `z ≠ 0` in a neighbourhood of `0` (as
    `∀ᶠ z in 𝓝[≠] 0`).

  Part of the target is that the three arguments lie in `slitPlane` there. The printed identity,
  with no condition on `z`, is false: the left side is `π`-periodic and even in real `z`, the
  right side is not.
- 20.9.4 for `τ = it`: `R_F(0, θ₃⁴(0|it), θ₄⁴(0|it)) = π/2`.
- 20.9.5 for `τ = it`: `exp(−π R_F(0, k², 1)/R_F(0, k′², 1)) = e^{−πt}`, from 5.2 and
  `ofReal_legendreK_eq_carlsonRF`.

**Checks.**
- 20.9.3 at `τ = 0.8i`: at `z = 1` both sides are `1.16628 78551…`; at `z = 1.6`, outside the
  rectangle, the left side is `1.50207 18560…` and the right side `1.55898 18517…`.

*Needs:* Layers 1–4; SpecialFunctionsHypergeometric Conventions, 1.3, 1.4; Tau Ceti
`legendreK`, `legendreK_eq_pi_div_two_mul_agm`, `legendreK_eq_ordinaryHypergeometric`,
`legendreK_one_div_sqrt_two`, `ofReal_legendreK_eq_carlsonRF`, `Complex.carlsonRF`,
`tendsto_jacobiTheta_comap_im_atTop`; Mathlib `NNReal.agm`.

### Examples

- `thetaModulus (it) → 0` as `t → ∞` and `K(k) → π/2`, `θ₃(0|it) → 1`, consistently with
  `TauCeti.Real.legendreK_zero`.

### Dependencies

Layers 1–4; SpecialFunctionsHypergeometric Layer 1; Tau Ceti
`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/`.

## Layer 6: integrals

### 6.1 Mellin transforms

- 20.10.1–20.10.3, with integrability part of the conclusion:
  - `∫₀^∞ x^{s−1} θ₂(0|ix²) dx = (2^s − 1) π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`;
  - `∫₀^∞ x^{s−1} (θ₃(0|ix²) − 1) dx = π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`;
  - `∫₀^∞ x^{s−1} (1 − θ₄(0|ix²)) dx = (1 − 2^{1−s}) π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 0`,
    `s ≠ 1`, and `= ln 2` at `s = 1`, where the right side has a removable singularity and
    Mathlib's `riemannZeta 1` is not its limit.

**Checks.**
- 20.10.2 at `s = 2`: `π/6`. 20.10.1 at `s = 3`: `7π^{−3/2}Γ(3/2)ζ(3) = 1.33919 30861 0…`.

### 6.2 Laplace transforms

- 20.10.4–20.10.5 for `Re s > 0`, `ℓ > 0`, `|Re β| + |Im β| ≤ ℓ`, principal `√s`:
  - `∫₀^∞ e^{−st} θ₁(βπ/(2ℓ)|iπt/ℓ²) dt = −∫₀^∞ e^{−st} θ₂((ℓ + β)π/(2ℓ)|iπt/ℓ²) dt
    = (ℓ/√s) sinh(β√s) sech(ℓ√s)`;
  - `∫₀^∞ e^{−st} θ₃((ℓ + β)π/(2ℓ)|iπt/ℓ²) dt = ∫₀^∞ e^{−st} θ₄(βπ/(2ℓ)|iπt/ℓ²) dt
    = (ℓ/√s) cosh(β√s) csch(ℓ√s)`.

**Checks.**
- At `(s, ℓ, β) = (2, 1.4, 0.3)`, by termwise integration of the Fourier series: 20.10.4 is
  `0.11726 51329 79…` and 20.10.5 is `0.30416 67622 68…`.

*Needs:* Layers 1, 4 (20.7.32–20.7.33 for the behaviour at `x → 0+` and `t → 0+`); Mathlib
`mellin`, `riemannZeta`, `Complex.Gamma`.

### Dependencies

Layers 1, 4; Mathlib `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`.

## Layer 7: generalizations

### 7.1 Gauss sums and Landsberg–Schaar reciprocity

- 20.11.1: `G(m, n) = ∑_{k<n} e^{−πik²m/n}` for `m : ℤ`, `n : ℕ`, written out.
- 20.11.2: for positive integers `m, n` with `mn` even,
  `n^{−1/2} G(m, n) = e^{−πi/4} m^{−1/2} ∑_{j<m} e^{πij²n/m}`, the second sum being
  `G(−n, m)`. No coprimality is needed. Proof: apply 20.7.32 at `z = 0` (Mathlib's
  `jacobiTheta₂_functional_equation`) to `τ = −m/n + iε`, and let `ε → 0+`, as in the proof of
  `TauCeti.sum_range_cexp_two_pi_I_sq_div`.
  - On the left, `e^{πik²τ}` has the phase `e^{−πik²m/n}` of `G(m, n)`. Because `mn` is even,
    this phase has period `n` in `k`, so `θ₃(0|τ) ∼ G(m, n)/(n ε^{1/2})`.
  - On the right, `−1/τ` approaches `n/m` from above. With the principal `(−iτ)^{1/2}` and the
    same periodicity modulo `m`, this gives the sum `∑_{j<m} e^{πij²n/m}` and the factor
    `e^{−πi/4}`.

**Checks.**
- `(m, n) = (1, 2)`: both sides are `e^{−πi/4}`. `(m, n) = (2, 4)`: both sides are `1 − i`.
- 20.11.2 at `(m, n) = (2, N)` reads `G(2, N) = √N e^{−πi/4}(1 + i^N)/√2`, the complex
  conjugate of `TauCeti.sum_range_cexp_two_pi_I_sq_div`.

### 7.2 Ramanujan's theta function

- 20.11.3: `f(a, b) = ∑_{n∈ℤ} a^{n(n+1)/2} b^{n(n−1)/2}`, with natural-number exponents, summable
  for `‖ab‖ < 1`.
- 20.11.4: `θ₃(z|τ) = f(q e^{2iz}, q e^{−2iz})` for all `z` and `0 < τ.im`, and Jacobi's triple
  product for `f` from 2.1.

### 7.3 Carlson's combined theta functions

- 20.11.6–20.11.8: `combinedTheta m n z τ = cₙ θₘ(z|τ)/(cₘ θₙ(z|τ))` for `m ≠ n` in
  `{1, 2, 3, 4}`, with `c₁ = θ₁′(0|τ)` and `cⱼ = θⱼ(0|τ)` for `j = 2, 3, 4`; one definition
  covers the twelve functions.
- 20.11.9: `φ_{m,n} = φ_{m,1} φ_{1,n} = 1/φ_{n,m} = φ_{m,1}/φ_{n,1} = φ_{1,n}/φ_{1,m}` at every
  `z` where `θ₁(z|τ)`, `θₘ(z|τ)` and `θₙ(z|τ)` do not vanish, with the cases `m = 1` or `n = 1`
  read with `φ_{1,1} = 1`.

*Needs:* Layers 1–2, 4; Tau Ceti `TauCeti/NumberTheory/ModularForms/JacobiTheta/GaussSum.lean`.

### Dependencies

Layers 1–2, 4.

## Downstream consumers

- A roadmap for the Jacobi elliptic functions of a complex variable (DLMF Chapter 22) consumes
  Layers 1–5: `sn`, `cn`, `dn` as theta quotients (DLMF §22.2), with `k` and `K` from 5.1–5.3.
- A roadmap for the Weierstrass functions (DLMF Chapter 23) consumes Layers 1–4 for the theta
  expressions of `σ`, `ζ`, `℘` (DLMF §23.6(i)), alongside the lattice functions of
  ModularCurves.
- A roadmap for multidimensional theta functions (DLMF Chapter 21) consumes Layer 1 for its
  one-dimensional case and 1.5 as the model of its finite-dimensionality theorem.
- A roadmap for Lamé functions (DLMF Chapter 29) consumes Layer 5 through Chapter 22.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of DLMF Chapter 20, and the formulas
of other chapters that relate this chapter's functions to theirs. It is recorded only to fix the
boundary. Contributors should not attempt it under this roadmap.

- **Graphics** (DLMF §20.3).
- **Mathematical applications** (DLMF §20.12): sums of squares through `θ₃(0|τ)^k` (DLMF
  §27.13(iv)), Euler's pentagonal number theorem from the triple product, and the embedding of
  the torus `ℂ/(ℤ + τℤ)` in `ℙ³` by `(θ₁(2z) : θ₂(2z) : θ₃(2z) : θ₄(2z))`.
- **Physical applications** (DLMF §20.13) other than 20.13.1: the real-time form 20.13.2 for
  `τ = it`, the Gaussian solution 20.13.3, and the periodized Gaussians 20.13.4–20.13.5, which
  are 20.7.32–20.7.33 after a change of variables.
- **Computation, tables and software** (DLMF §§20.14–20.16), including the modular angle of
  20.15.1, which is `arcsin k` of 5.1.
- **The further identities DLMF only cites**: the remaining permutation identities of
  §20.7(vii), Watson's further expansions of §20.8, and the analogous changes of base for
  `F(⅓, ⅔; 1; k²)`, `F(¼, ¾; 1; k²)`, `F(⅙, ⅚; 1; k²)` of §20.11(iii).
- **Theta functions with characteristics** (DLMF §20.11(iv)), which are DLMF Chapter 21.
- **`q`-series beyond the triple product**: the quintuple product, the Rogers–Ramanujan
  identities and Ramanujan's other theta-function identities, which are `q`-series theory.
- **The modular transformation of `η`** and the general `SL₂(ℤ)` transformation of the theta
  functions (DLMF §23.15 and Rademacher's theory cited in §20.7(viii)).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/Theta/`, with `DLMF/Elliptic/Theta.lean` and `DLMF/Elliptic/ThetaAGM.lean`, provides source
material for every layer, including the corrected statements of 20.7.34, 20.9.2, 20.9.3 and
20.10.3. It defines the four functions through `jacobiTheta₂` as this roadmap does. It proves the
products from its formalization of the triple product DLMF 17.8.1, and the identities of §20.7
from Watson's product formula, by the parity reindexing of 4.2. Several of its statements are
still admitted, and they remain proof work here:
- the power series 20.6.2–20.6.5;
- Watson's expansion 20.8.1;
- the complex forms of 20.9.2 on `F` and of 20.9.3;
- the Laplace transforms 20.10.4–20.10.5;
- the Gauss-sum reciprocity 20.11.2, which it also states only for coprime `m, n`.

It has no counterpart of 1.5, or of the mapping theorem of 5.3.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Theta/Basic/Definitions`, `Basic/Series`, `Basic/Analytic`, `Basic/Periodicity`, `Theta/Identities` (20.7.26–20.7.29) |
| 2 | `Theta/Products/InfiniteProducts`, `Theta/SeriesAndZeros`, `Theta/ZeroValues`, `Products/LogDerivativesAndDoubleProducts` (20.4.2–20.4.6) |
| 3 | `Theta/Products/LogDerivativesAndDoubleProducts`, `Theta/Basic/PowerSeries`, `Theta/PowerSeries`, `Theta/ZeroValues` |
| 4 | `Theta/Identities` |
| 5 | `Theta/Relations`, `Theta/ImaginaryAxisMonotonicity`, `Elliptic/ThetaAGM`, `Theta/Generalizations` (20.11.5) |
| 6 | `Theta/Integrals` |
| 7 | `Theta/Generalizations` |

Other formalizations of this material: the Lean development of Jacobi's triple product and the
Rogers–Ramanujan identities in arXiv:2607.01544 ("Formalized q-series: The Rogers-Ramanujan
Identities and Beyond"), and the Isabelle/HOL library of Jacobi theta functions of Eberl, Li and
Paulson (ITP 2026, LIPIcs vol. 382, paper 23).

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 20
  (W. P. Reinhardt and P. L. Walker), <https://dlmf.nist.gov/20>. Every equation number refers to
  this release.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XXI.
- D. F. Lawden, *Elliptic Functions and Applications*, Springer, 1989, Chapter 1.
- D. Mumford, *Tata Lectures on Theta I*, Birkhäuser, 1983, Chapter I.
- J. M. Borwein and P. B. Borwein, *Pi and the AGM*, Wiley, 1987, Chapters 2–3.
- B. C. Berndt, *Ramanujan's Notebooks, Part III*, Springer, 1991, Chapter 16.
