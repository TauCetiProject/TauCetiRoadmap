# Roadmap: confluent hypergeometric functions

**Summary.** This roadmap builds the theory of the confluent hypergeometric functions of Chapter 13
of the NIST *Digital Library of Mathematical Functions* (DLMF; see [References](#references)) as a
library. The Kummer functions `M(a, b, z)` and `U(a, b, z)` are the standard solutions of Kummer's
equation

```text
z w″ + (b − z) w′ − a w = 0                                         (DLMF 13.2.1)
```

and the Whittaker functions `M_{κ,μ}(z)`, `W_{κ,μ}(z)` are the standard solutions of Whittaker's
equation `W″ + (−¼ + κ/z + (¼ − μ²)/z²) W = 0` (DLMF 13.14.1). Olver's regularized function
`𝐌(a, b, z) = M(a, b, z)/Γ(b)` is Mathlib's `Complex.regularizedHGFun {a} {b} z`.

The roadmap covers:
- the definitions of Kummer's `U` and of the Whittaker functions beside Mathlib's `𝐌`, as
  holomorphic functions of `z` on the slit plane and on the logarithmic plane and entire functions
  of the parameters, with Kummer's and Whittaker's equations, the special cases, the analytic
  continuation, the limiting forms at `0`, the Wronskians and the connection formulas;
- the recurrences and the derivatives;
- the integral representations on the real line, on loop contours and of Mellin–Barnes type;
- the continued fractions and the relations to elementary, incomplete Gamma, error, Bessel, Airy,
  parabolic cylinder and Hermite functions;
- the expansions for large argument, and the large-`b` and large-`μ` forms that follow from the
  series;
- the real zeros of `M` and `U` and the zero-free regions;
- the Laplace, Mellin, Fourier and Hankel integrals;
- the expansions in Bessel functions, the product formulas and the addition theorems;
- the formulas of DLMF Chapters 6–10 and 12 that other roadmaps leave to a confluent roadmap.

**This roadmap is a substantial part of DLMF Chapter 13, not all of it.** It owns the
definitions, the equations and the classical theory, the large-argument expansions, the real
zeros, the integrals and the series; the formula ranges are in the table under
[Scope and ownership](#scope-and-ownership). The rest of the chapter is listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement), in two
groups:
- material planned for follow-up roadmaps: chiefly the large-parameter and uniform expansions of
  §§13.8, 13.20 and 13.21 and what rests on them, and the formulas through the Gauss function off
  its disk of convergence, the Laguerre and Charlier polynomials and the Coulomb functions, which
  belong with roadmaps for DLMF Chapters 15, 18 and 33;
- material deferred without a planned roadmap: the error bounds and exponentially improved
  expansions of §13.7(ii)–(iii), the asymptotics of the complex zeros, the Whittaker transform and
  the applications and computation sections.

The notation section §13.1 has nothing to formalize.

The general asymptotic and contour tools are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md) (DLMF Chapter 2): the expansion API,
Watson's lemma and the rotation of the path, the Mellin tools and the regular and rank-one
irregular singularities. Other functions are consumed as follows:
- Mathlib's `𝐌`, with Kummer's equation, its derivative, Kummer's transformation and its
  holomorphy in the parameters from
  [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md), which also
  supplies Weber's `U(a, z)`;
- the incomplete Gamma, exponential integral and error functions and Pincherle's theorem from
  [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md);
- the Airy functions from [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md);
- the Bessel functions `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` from
  [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md).

This roadmap builds the removable singularity in `b` behind the definition of `U` at integer `b`,
the logarithmic coordinate on which `U` and `W_{κ,μ}` are entire, the loop contours of §13.4(ii),
the coefficients of the Bessel-series expansions 13.11.3 and 13.24.2, and the zero-counting tools
of Layer 7: Sturm comparison, continuity of zeros in the parameters and the positive zeros of the
polynomials `M(−n, b, ·)`.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Confluent/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definitions, equations and continuation** (DLMF §13.2(i)–(ii), §13.14(i)–(ii)): the
   definitions of `U`, `M_{κ,μ}`, `W_{κ,μ}`, holomorphy in `z` and in the parameters, the
   equations, the special and polynomial cases and the analytic continuation.
2. **Limiting forms at `0`, Wronskians and connection formulas** (DLMF §13.2(iii), (v)–(vii),
   §13.14(iii), (v)–(vii)).
3. **Recurrences and derivatives** (DLMF §§13.3, 13.15).
4. **Integral representations** (DLMF §§13.4, 13.16).
5. **Continued fractions and relations to other functions** (DLMF §§13.5, 13.6, 13.17, 13.18).
6. **Large argument and simple large-parameter forms** (DLMF §§13.2(iv), 13.7(i), 13.14(iv),
   13.19, and 13.8.1 and 13.20.1).
7. **Zeros** (DLMF §§13.9, 13.22 without the large-parameter asymptotics).
8. **Integrals** (DLMF §§13.10, 13.23).
9. **Series, products and addition theorems** (DLMF §§13.11–13.13, 13.24–13.26).
10. **Relations owed to other roadmaps**: the formulas of DLMF Chapters 6–10 and 12 through `U` and
    the Whittaker functions that their roadmaps exclude.

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 13.2.1 (for `U` and its branches), 13.2.5, 13.2.7–13.2.12, 13.2.42 | `U`: definition, equation, special cases, continuation (1.1–1.4). |
| 13.14.1–13.14.13 | Whittaker functions: definitions, equation, series, special cases, continuation (1.5). |
| 13.2.13–13.2.22, 13.2.24–13.2.38, 13.2.40–13.2.41, 13.2.43–13.2.44 | Kummer: limiting forms at `0`, solution pairs, Wronskians, connection formulas (2.1–2.3). |
| 13.14.14–13.14.19, 13.14.22–13.14.35 | Whittaker: the same (2.4). |
| 13.3.1–13.3.29, 13.15.1–13.15.26 | Recurrences and derivatives (Layer 3). |
| 13.4.1–13.4.7, 13.4.9–13.4.11, 13.4.13–13.4.14, 13.4.16–13.4.18 | Kummer integral representations (4.1–4.3). |
| 13.16.1–13.16.8, 13.16.10–13.16.12 | Whittaker integral representations (4.4). |
| 13.5.1–13.5.4, 13.17.1–13.17.4 | Continued fractions (5.1). |
| 13.6.1–13.6.11, 13.6.11_1, 13.6.11_2, 13.6.12–13.6.18, 13.6.21 (terminating cases) | Kummer: relations to other functions (5.2). |
| 13.18.1–13.18.16 | Whittaker: relations to other functions (5.3). |
| 13.2.6, 13.2.23, 13.7.1–13.7.3, 13.14.20–13.14.21, 13.19.1–13.19.3, 13.8.1, 13.20.1 | Large argument; large `b`, large `μ` (Layer 6). |
| 13.9.1–13.9.7, 13.9.11–13.9.15 | Real zeros, zero counts and zero-free regions (Layer 7). |
| 13.10.1–13.10.2, 13.10.4–13.10.6, 13.10.8–13.10.16 | Kummer integrals (8.1–8.2). |
| 13.23.1–13.23.3, 13.23.5–13.23.12 | Whittaker integrals (8.3). |
| 13.11.1–13.11.4, 13.12.1, 13.13.1–13.13.12 | Kummer series, products, addition theorems (9.1–9.3). |
| 13.24.1–13.24.3, 13.25.1, 13.26.1–13.26.12 | Whittaker series, products, addition theorems (9.4). |
| 6.11.2–6.11.3, 7.11.5, 7.18.10, 8.5.3–8.5.5, 8.19.16 | Relations to the functions of Chapters 6–8 (10.1). |
| 9.6.21–9.6.24, 10.16.6–10.16.8, 10.39.6–10.39.8, 12.7.14 | Relations to the Airy, Bessel and parabolic cylinder functions (10.2). |

Cases of these formulas that Mathlib, Tau Ceti or a consumed roadmap already proves are inputs,
not targets; the targets are the remaining cases. The inputs are:
- the series 13.2.2–13.2.4 of `𝐌` (Tau Ceti `Complex.hasSum_regularizedHGFun` and
  SpecialFunctionsParabolicCylinder §§1.1, 1.6) and the value `𝐌(a, b, 0) = Γ(b)⁻¹` (Mathlib
  `Complex.regularizedHGFun_zero`);
- 13.2.1 for `𝐌`, Kummer's transformation 13.2.39 and 13.3.15 divided by `Γ(b)`
  (SpecialFunctionsParabolicCylinder §§1.2–1.4);
- `𝐌(a, b, z)` entire in `a` and in `b` (SpecialFunctionsParabolicCylinder §1.5);
- `₀F₀ = exp` (Mathlib `Complex.regularizedHGFun_zero_zero`, in which both parameter multisets are
  empty), with its consequences `𝐌(a, a, z) = Γ(a)⁻¹ e^z` for every `a` and `𝐌(0, b, z) = Γ(b)⁻¹`
  (the examples of [SpecialFunctionsParabolicCylinder Layer 1](../SpecialFunctionsParabolicCylinder/README.md#layer-1-the-regularized-kummer-function)):
  these are 13.6.1 and the `M` half of 13.6.3, since `M = Γ(b) 𝐌` where `M` exists;
- 13.6.5: its first equality is 13.2.39 at `b = a + 1`, and its second is DLMF 8.5.1,
  `γ(a, z) = a⁻¹ z^a Γ(a + 1) 𝐌(a, a + 1, −z)` for `a ∉ −ℕ`
  ([SpecialFunctionsEiLiErfIncompleteGamma §2.2](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#22-kummer-representations));
- 13.6.7, which is DLMF 7.11.4
  ([SpecialFunctionsEiLiErfIncompleteGamma §11.4](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#114-series-derivatives-and-hypergeometric-forms))
  with `M(½, 3/2, ·) = Γ(3/2) 𝐌(½, 3/2, ·)`.

13.6.9 and 13.6.10 are DLMF 10.39.5 and 10.39.6 rearranged; 10.39.5 is a target of
SpecialFunctionsBessel (its 4.3) and is consumed for 13.6.9, and 10.39.6 is a target here (10.2).

It also owns the following auxiliary results, which the layers need and which neither Mathlib, Tau
Ceti nor a consumed roadmap provides:

| Result | Target |
|---|---|
| The bracket `F(a, b, z) = 𝐌(a, b, z)/Γ(a − b + 1) − z^{1−b} 𝐌(a − b + 1, 2 − b, z)/Γ(a)` vanishes at integer `b`, so that `π F / sin(πb)` has removable singularities there with value `(−1)ⁿ ∂_b F` | 1.1 |
| Uniqueness for Kummer's equation on the slit plane given value and derivative at one point | 1.2 |
| The loop contours of §13.4(ii) as explicit concatenations of segments, rays and circles, with the branch of each power fixed on each piece, and the deformation lemma that moves them | 4.2 |
| Sturm comparison on an open interval `I ⊆ ℝ`: for `p > 0` of class `C¹` and continuous `q₁ ≤ q₂`, between two consecutive zeros of a nontrivial real solution of `(p u′)′ + q₁ u = 0` every real solution of `(p v′)′ + q₂ v = 0` has a zero, unless `q₁ = q₂` and `v` is a multiple of `u`; and the zeros of a nontrivial real solution are simple and isolated | 7.1 |
| Continuity of zeros in the parameters: for real solutions `w(λ, x)` jointly `C¹` in `(λ, x)`, with simple zeros, the number of zeros in `(0, X)` is locally constant in `λ` as long as no zero reaches `0` or `X`; and the counting form used for 13.9.1–13.9.7, in which the number of zeros in `(0, ∞)` changes only through a zero leaving at `0` or arriving from `∞` | 7.1 |
| For `b > 0` and `n ≥ 1`, `M(−n, b, ·)` (and `U(−n, b, ·) = (−1)ⁿ (b)ₙ M(−n, b, ·)`) has exactly `n` positive zeros, all simple: the polynomials `M(−n, b, ·)` are orthogonal for the weight `x^{b−1} e^{−x}` on `(0, ∞)`, by the self-adjoint form of Kummer's equation | 7.1 |
| The coefficients `A_n` of 13.11.4 and the polynomials `p_s^{(μ)}(z)` of 13.24.3 | 9.1, 9.4 |

**What it does not own:**
- The general asymptotic and contour tools: asymptotic expansions, Watson's lemma, the rotation of
  Laplace integrals, the Mellin tools and the regular and rank-one irregular singularities. They
  are consumed from AsymptoticExpansions; see [Exact supplier contracts](#exact-supplier-contracts).
- The regularized Kummer function `𝐌` and the facts listed above as inputs.
- Weber's parabolic cylinder function `U(a, z)`, consumed from SpecialFunctionsParabolicCylinder.
- The incomplete Gamma functions, `E_p`, `E₁`, the auxiliary functions `f`, `g` of the sine and
  cosine integrals, `erf`, `erfc`, the repeated integrals `iⁿ erfc` and Pincherle's theorem,
  consumed from SpecialFunctionsEiLiErfIncompleteGamma.
- `Ai` and `Bi`, consumed from SpecialFunctionsAiry.
- `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` and their own formulas, among them 10.16.5 and 10.39.5,
  consumed from SpecialFunctionsBessel.
- The formulas through the Gauss function `₂F₁` at arguments outside its disk of convergence
  (DLMF 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9, 13.23.4), through the Laguerre and
  Charlier polynomials (13.6.19–13.6.20, 13.18.17), through the Coulomb functions (§13.6(vii),
  §13.18(vi)), and the non-terminating meaning of `₂F₀` in 13.6.21.
- The large-parameter and uniform expansions (DLMF 13.8.2–13.8.18, §13.20 beyond 13.20.1, §13.21)
  and what rests on them (13.9.8, 13.9.10, 13.9.16, 13.22.1).
- The error bounds and exponentially improved expansions (DLMF 13.7.4–13.7.13), the asymptotics of
  the large complex zeros (13.9.9 and the `b`-zeros of `U`), the Whittaker transform pair
  13.23.13–13.23.14, and the applications and computation sections (§§13.27–13.32).

See the last section for these.

**Coordination with other roadmaps.** No open roadmap pull request specifies Kummer's `U` or the
Whittaker functions of DLMF Chapter 13; the automorphic roadmaps that mention Whittaker models mean
the representation-theoretic notion. The roadmaps of DLMF Chapters 2, 6–10 and 12 leave the
formulas listed in Layer 10 to this roadmap, and this roadmap consumes their functions without
restating them.

**The boundary in one sentence:** this roadmap owns `U`, `M_{κ,μ}`, `W_{κ,μ}` and everything in
DLMF Chapter 13 stated through them, `𝐌` and functions that Mathlib, Tau Ceti or a consumed roadmap
defines, on the principal sheet and on the logarithmic plane, together with the formulas that the
roadmaps of Chapters 6–10 and 12 leave to it; it consumes the general methods of
AsymptoticExpansions and the basic `𝐌` theory of SpecialFunctionsParabolicCylinder, and excludes
the large-parameter and uniform asymptotics, the Gauss function off its disk, the Laguerre,
Charlier and Coulomb functions, error bounds, transforms and numerics.

## Conventions

- **Names.** The functions live in `Complex`, beside Mathlib's `Complex.regularizedHGFun`:
  `Complex.kummerU`, `Complex.kummerULog`, `Complex.regularizedWhittakerM`,
  `Complex.regularizedWhittakerMLog`, `Complex.whittakerM`, `Complex.whittakerW` and
  `Complex.whittakerWLog : ℂ → ℂ → ℂ → ℂ`, parameters first. Derivatives are Mathlib's `deriv`;
  no derivative functions are introduced.
- **Deference to Mathlib.** `𝐌(a, b, z)` is Mathlib's
  [`Complex.regularizedHGFun`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.html)
  `{a} {b} z = ∑ₙ (a)ₙ zⁿ/(n! Γ(b + n))`, entire in `a`, `b`, `z`. `M(a, b, z)` means
  `Γ(b) 𝐌(a, b, z)` and is used only where `b ∉ {0, −1, −2, …}`; no unregularized function is
  defined. When Mathlib provides one of the functions pinned here with the same values, Tau Ceti
  uses Mathlib's and restates the affected theorems against it.
- **Kummer's `U`.** With the bracket

```text
F(a, b, w) = 𝐌(a, b, e^w)/Γ(a − b + 1) − e^{(1−b)w} 𝐌(a − b + 1, 2 − b, e^w)/Γ(a)
```

  the logarithmic-plane function is

```text
U(a, b, e^w) = (π / sin πb) F(a, b, w)                     b ∉ ℤ     (DLMF 13.2.42)
U(a, n, e^w) = (−1)ⁿ ∂_b F(a, b, w)|_{b=n}                 n ∈ ℤ
```

  This is `Complex.kummerULog a b w`. `Γ⁻¹` is Mathlib's `(Complex.Gamma ·)⁻¹`, which is `0` at
  the poles, so `F` is entire in `(a, b, w)`. The integer case is selected by
  `∃ n : ℤ, (n : ℂ) = b`, and `∂_b` is `deriv` in `b` at fixed `a`, `w`. DLMF takes the limit at
  integer `b`; 1.1 proves that `F` vanishes there and that the two cases glue to an entire
  function, so the derivative form is that limit. The principal branch is
  `Complex.kummerU a b z = Complex.kummerULog a b (Complex.log z)`.
- **Whittaker functions.** With principal powers on the slit plane and `e^{(½+μ)w}` on the
  logarithmic plane:

```text
𝐌_{κ,μ}(z) = e^{−z/2} z^{½+μ} 𝐌(½ + μ − κ, 1 + 2μ, z)       (DLMF 13.14.2 divided by Γ(1 + 2μ))
M_{κ,μ}(z) = Γ(1 + 2μ) 𝐌_{κ,μ}(z)                           (DLMF 13.14.2)
W_{κ,μ}(z) = e^{−z/2} z^{½+μ} U(½ + μ − κ, 1 + 2μ, z)        (DLMF 13.14.3)
```

  These are `Complex.regularizedWhittakerM`, `Complex.whittakerM` and `Complex.whittakerW`; the
  logarithmic-plane versions `regularizedWhittakerMLog κ μ w` and `whittakerWLog κ μ w` replace
  `z` by `e^w`, `z^{½+μ}` by `e^{(½+μ)w}` and `U` by `kummerULog`. `M_{κ,μ}` takes Mathlib's junk
  value `0` where `2μ ∈ {−1, −2, …}`; statements through `M_{κ,μ}` carry DLMF's hypothesis
  `2μ ∉ {−1, −2, …}`, and the limiting forms of DLMF are stated through `𝐌_{κ,μ}`.
- **Branches and sheets.** All powers, logarithms and square roots are principal. The functions of
  `z` are holomorphic on `Complex.slitPlane`; their values on `(−∞, 0)` are those of the principal
  branch (Lean's `arg x = π` for `x < 0`). DLMF's `U(a, b, z e^{±πi})`, `U(a, b, z e^{2mπi})` and
  `W_{κ,μ}(z e^{±πi})` are `kummerULog a b (log z ± πi)`, `kummerULog a b (log z + 2mπi)` and
  `whittakerWLog κ μ (log z ± πi)`, for every `z ≠ 0`. A formula of DLMF with `e^{±πi}` is
  stated on all of `z ≠ 0` in this form. `kummerU a b 0` and `whittakerW κ μ 0` are junk values
  and are not used.
- **Kummer's equation is not a predicate.** A solution is stated with `DifferentiableOn ℂ w U` and
  the equation at each point of `U`. The Wronskian `𝒲{f, g}` is written out as
  `f z * deriv g z − deriv f z * g z`.
- **Sectors at infinity.** "As `z → ∞` in `|ph z| ≤ θ`" is the filter
  `Bornology.cobounded ℂ ⊓ 𝓟 {z | |Complex.arg z| ≤ θ}` for `θ < π`. For sectors reaching beyond
  `|ph z| = π`, the statement is in logarithmic coordinates `z = e^w` along
  `Filter.comap Complex.re atTop ⊓ 𝓟 S` for the strip `S` of `Im w` named in the statement, as in
  SpecialFunctionsEiLiErfIncompleteGamma.
- **Asymptotic expansions** are AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion`, which
  unfolds to "for every `N`, the remainder after `N` terms is `O(φ N)`". The two-sum expansions
  13.7.2 and 13.19.2 are generalized expansions with independent truncation orders for the two
  sums. Divergent series are never summed.
- **Improper integrals.** "`∫₀^∞ f = L` as an improper integral" means
  `Tendsto (fun R ↦ ∫ t in (0)..R, f t) atTop (𝓝 L)`. Where an integrand is absolutely
  integrable, the statement uses the Bochner integral with an `IntegrableOn` hypothesis or
  conclusion.
- **Contours.** Each contour integral is written as a sum of integrals over explicit segments, rays
  and circular arcs, with the branch of every power fixed on each piece by its phase. DLMF's loop
  `∫_{−∞}^{(0+)}` is the path from `−∞` along `Im t = −ε` to `−iε`, round the right half
  `t = ε e^{iθ}`, `−π/2 ≤ θ ≤ π/2`, of the circle `|t| = ε`, and from `iε` back along
  `Im t = +ε`, with principal powers; it does not cross the negative real axis. 4.2 fixes the
  other loops and proves independence of `ε`. Mellin–Barnes integrals are along vertical lines
  `Re t = c`, with the separating contours of DLMF written as the line integral minus finitely
  many residues, as in SpecialFunctionsParabolicCylinder §6.7.
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`.
- **Zeros.** For real `a`, `b`, the number of positive zeros of `M(a, b, ·)` is
  `{x : ℝ | 0 < x ∧ 𝐌(a, b, x) = 0}.ncard`; zeros of `𝐌` and of `M` agree for
  `b ∉ {0, −1, −2, …}`. Zeros are simple (Layer 7), so counts without multiplicity are DLMF's.
- **Hermite polynomials.** DLMF's `H_n(x)` is written as `2^{n/2} He_n(√2 x)`, with Mathlib's
  probabilists' `Polynomial.hermite n` for `He_n`.

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

The following are consumed with the hypotheses and conventions stated there.
- The expansion notion `Asymptotics.HasAsymptoticExpansion` along a filter and an asymptotic scale
  ([its Conventions](../AsymptoticExpansions/README.md#conventions)), for Layer 6.
- Watson's lemma in a sector and the rotation of the path
  ([§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector),
  [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path)), applied in 6.1 to the
  Laplace form 13.4.4 of `U`, for 13.7.3 in `|ph z| ≤ 3π/2 − δ`.
- The Mellin tools: Parseval and the line shift with simple poles
  ([§8.1](../AsymptoticExpansions/README.md#81-parseval),
  [§8.2](../AsymptoticExpansions/README.md#82-shifting-the-line)) and the Gamma function on
  vertical strips
  ([§8.6](../AsymptoticExpansions/README.md#86-the-gamma-function-on-vertical-strips)), for the
  Mellin–Barnes integrals 13.4.16–13.4.18 and 13.16.10–13.16.12 and the Mellin transforms
  13.10.10–13.10.11, 13.23.3 and 13.23.5.
- Ordinary points, regular singularities and the irregular singularity of rank one
  ([§10.2](../AsymptoticExpansions/README.md#102-ordinary-points),
  [§10.3](../AsymptoticExpansions/README.md#103-regular-singularities),
  [§10.4](../AsymptoticExpansions/README.md#104-irregular-singularity-of-rank-one-at-infinity)):
  uniqueness of solutions of Kummer's equation on the slit plane from initial data (1.2), the
  Frobenius solutions at `0` behind the logarithmic cases 13.2.9 and 13.2.27–13.2.32, and the
  recessive solution at `∞` that identifies `U` by 13.2.6 (6.1).

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- Layer 1 for `𝐌`: `TauCeti.hasDerivAt_regularizedHGFun_singleton` (13.3.15 regularized),
  `TauCeti.regularizedHGFun_kummer_equation` (13.2.1),
  `TauCeti.regularizedHGFun_singleton_eq_exp_mul` (13.2.39), the holomorphy in `a` and `b`
  (`TauCeti.differentiable_regularizedHGFun_singleton_left` and its `b` analogue) and the polynomial
  cases ([§§1.1–1.6](../SpecialFunctionsParabolicCylinder/README.md#layer-1-the-regularized-kummer-function)),
  for Layers 1–3.
- `TauCeti.parabolicCylinderU (a z : ℂ)` with Weber's equation and its values at `0`
  ([its Conventions](../SpecialFunctionsParabolicCylinder/README.md#conventions)), for
  13.6.12–13.6.15, 13.18.11–13.18.13 and 12.7.14.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- Pincherle's theorem and the continued-fraction conventions `contFrac`, `IsMinimalSolution`,
  `pincherle`
  ([§4.1](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#41-pincherles-theorem)), for 5.1.
- `TauCeti.Complex.lowerIncompleteGamma`, `TauCeti.Complex.upperIncompleteGamma`,
  `TauCeti.Complex.upperIncompleteGammaLog`, `TauCeti.expIntegralE`, `TauCeti.Complex.erf`,
  `TauCeti.Complex.erfc`, `TauCeti.iteratedErfc`, `TauCeti.sinIntegralAuxF` and
  `TauCeti.sinIntegralAuxG`
  ([its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions)), for
  13.6.5–13.6.8, 13.18.4–13.18.7 and 10.1.

### From [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md)

- `TauCeti.airyAi` and `TauCeti.airyBi` with Airy's equation and their values at `0`, for 13.6.11,
  13.18.10 and 9.6.21–9.6.24.

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- `Complex.besselY`, `Complex.hankelH1`, `Complex.hankelH2`, `Complex.besselI` and
  `Complex.besselK` ([its Conventions](../SpecialFunctionsBessel/README.md#conventions)), with
  their equations, holomorphy in `z` and `ν`, connection formulas and recurrences
  ([its Layer 1](../SpecialFunctionsBessel/README.md#layer-1-definitions-the-equations-connection-formulas-and-wronskians)),
  the Kummer form 10.39.5 of `I_ν` (its 4.3) and the integral 10.32.9 of `K_ν` (its 3.1), for
  13.4.3, 13.4.7, 13.6.9–13.6.11_2, 13.10.8–13.10.9, 13.10.13–13.10.16, 13.11.1–13.11.3,
  13.16.3–13.16.4, 13.16.8, 13.18.8–13.18.9, 13.23.6–13.23.12, 13.24.1–13.24.2 and 10.2.

### From Tau Ceti

- **Regularized hypergeometric series.**
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean),
  the `HasSum` form of `𝐌`, and `Complex.regularizedHGFunCoeff_zero_singleton`.
- **Real error function and lower incomplete Gamma function.** `TauCeti.Real.erf`,
  `TauCeti.Real.erfc` (`TauCeti/Analysis/SpecialFunctions/Erf.lean`) and
  `TauCeti.lowerIncompleteGamma` (`TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`), the
  real restrictions of the functions of SpecialFunctionsEiLiErfIncompleteGamma, for the real forms
  of 13.6.6 and 13.6.8 in 5.2.
- **Residues.** `TauCeti.Contour.residue` and the residue theorem
  (`TauCeti/Analysis/Contour/Residue/`, from ContourIntegration), for the separating contours of
  4.3 and 4.4.

### From Mathlib

- **Regularized hypergeometric series.** `Complex.regularizedHGFun`,
  `Complex.regularizedHGFunCoeff`, `Complex.regularizedHGFun_zero`,
  `Complex.regularizedHGFun_zero_zero`, `Complex.regularizedHGFunCoeff_add_one`,
  `Complex.regularizedHGFunCoeff_eq_zero_right`, `Complex.radius_regularizedHGFunSeries_eq_top`
  and `Complex.analyticOnNhd_regularizedHGFun_of_card_le`
  (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`); the regularized Gauss
  function `Complex.regularizedGaussHGFun` with
  `Complex.radius_regularizedGaussHGFunSeries_eq_top_of_left` and
  `Complex.radius_regularizedGaussHGFunSeries_ge_one`, for the terminating and in-disk Gauss
  values of 13.14.6, 13.23.1 and 13.23.9–13.23.12.
- **Bessel function.** `Complex.besselJ` and `Complex.besselJ_def`.
- **Gamma.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_mul_Gamma_one_sub`,
  `Complex.Gamma_eq_integral`, `Complex.Gamma_neg_nat_eq_zero`, `Complex.betaIntegral`,
  `Complex.digamma` and `Real.eulerMascheroniConstant`.
- **Polynomials.** `ascPochhammer` and `Polynomial.hermite`.
- **Holomorphic functions and contour integrals.** `AnalyticOnNhd`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, the removable-singularity theorem
  `Complex.differentiableOn_update_limUnder_of_bddAbove`, the Cauchy integral formula and
  `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.
- **Integration and transforms.** `MeasureTheory.integral` on `Set.Ioi`, `intervalIntegral`,
  Fubini, parametric differentiation, `mellin` and `GenContFract`.
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, `Bornology.cobounded`,
  `Complex.arg`, `Complex.log` and `Complex.cpow`.

## How to read the build

Layer 1 rests on two facts: `𝐌` is entire in all three variables (consumed), and the bracket `F`
vanishes at integer `b` by 13.2.5, so that `U` is entire in `a`, `b` and in the logarithmic
coordinate `w`. Kummer's equation for `U` follows from that of `𝐌` and of `z^{1−b} 𝐌(a − b + 1,
2 − b, z)`, which is the change of variables 13.2.40 applied to 13.2.1, and from continuity in `b`
at the integers. Every identity between solutions in Layers 1–5 is then checked on series
coefficients at `0`, by comparing Wronskians, or for non-integer `b` and extended to integer `b` by
continuity in `b`. Layer 4 proves each integral representation by showing that the integral solves
Kummer's equation with the right behaviour at `0` or `∞`, or by termwise integration of the series.
Layer 6 expands the Laplace form 13.4.4 of `U` by Watson's lemma, rotates the path, and transfers
the result to `𝐌` by the connection formula 13.2.41. Layer 7 counts real zeros by Sturm's
comparison on the self-adjoint form of Kummer's equation and continuity in the parameters. Layers
8–9 apply Layers 1–6. Layer 10 proves the relations owed to other roadmaps. The `### Examples` of
each layer are statements to prove, and they test the conventions on explicit values.

## Layer 1: definitions, the equations and analytic continuation

### 1.1 Kummer's `U`

`kummerULog` and `kummerU` as pinned. The targets:
- the bracket `F(a, b, w)` vanishes at `b = n ∈ ℤ` for all `a`, `w`: for `n ≥ 2` by 13.2.5 for
  `𝐌(a − n + 1, 2 − n, ·)`, with `e^{(1−n)w} e^{(n−1)w} = 1`; for `n ≤ 0` by 13.2.5 for
  `𝐌(a, n, ·)`; and at `n = 1` the two terms coincide;
- `(a, b, w) ↦ kummerULog a b w` is holomorphic on `ℂ × ℂ × ℂ` (`differentiable_kummerULog`),
  and the integer case is the limit of the non-integer case (`tendsto_kummerULog_intCast`);
- `kummerU a b` is holomorphic on the slit plane (`analyticOnNhd_kummerU`);
- `U` solves Kummer's equation 13.2.1 on the slit plane (`kummerU_kummer_equation`), and
  `w ↦ kummerULog a b w` solves the same equation transported to `z = e^w`, which is
  `u″ − (1 − b + e^w) u′ − a e^w u = 0` for `u(w) = U(a, b, e^w)`;
- for real `a`, `b` and `x > 0`, `U(a, b, x)` is real, and `U(ā, b̄, z̄) = conj U(a, b, z)` on the
  slit plane.

The proof of the equation for non-integer `b` is the equation for the two terms of `F`; at integer
`b` it follows by continuity in `b`, since the `z`-derivatives of a function holomorphic in
`(b, z)` are continuous in `b`.

**Checks.**
- `U(1, 1, 1) = e E₁(1) = 0.59634 73623…` (13.6.6 at `a = 1`).
- `U(½, ½, 1) = √π e erfc(1) = 0.75787 21561…` (13.6.8).
- `U(0.3, 2, 1.7) = 0.94985 30204…`, `U(1.2, 0, 0.8) = 0.35740 93372…` and
  `U(0.7, −1, 2.5) = 0.33229 69198…` from the derivative form; without the factor `(−1)ⁿ` the
  values at `b = −1` would have the opposite sign, which is not the limit of 13.2.42.

*Needs:* SpecialFunctionsParabolicCylinder §§1.3, 1.5; Mathlib `Complex.Gamma_neg_nat_eq_zero`
and `Complex.differentiableOn_update_limUnder_of_bddAbove`.

### 1.2 The solution space

Two solutions of 13.2.1 on the slit plane with the same value and derivative at one point are
equal, and every solution is `c₁ 𝐌(a, b, ·) + c₂ U(a, b, ·)` when `a ∉ {0, −1, −2, …}` and
`c₁ 𝐌(a, b, ·) + c₂ z^{1−b} 𝐌(a − b + 1, 2 − b, ·)` when `b ∉ ℤ`. The bases are those whose
Wronskians 13.2.33–13.2.34 (2.2) do not vanish.

*Needs:* 1.1; AsymptoticExpansions §10.2.

### 1.3 Special cases

DLMF 13.2.5 and 13.2.7–13.2.11, with DLMF's hypotheses:
- 13.2.5: `𝐌(a, −n, z) = ((a)_{n+1}/(n + 1)!) z^{n+1} M(a + n + 1, n + 2, z)` for every `a`
  (`regularizedHGFun_neg_nat`); the limit form on the left is the continuity of `𝐌` in `b`;
- 13.2.7: `U(−m, b, z) = (−1)^m (b)_m M(−m, b, z) = (−1)^m ∑_{s≤m} C(m, s) (b + s)_{m−s} (−z)^s`,
  the middle form for `b ∉ {0, −1, …}` and the sum for every `b` (`kummerU_neg_nat`);
- 13.2.8 for `a − b + 1 = −n`: the sum `z^{−a} ∑_{s≤n} C(n, s) (a)_s z^{−s}` for every `a`, and
  the middle form where `1 − a − n ∉ {0, −1, …}`;
- 13.2.9 for `b = n + 1` and `a ∉ {0, −1, …}`, the logarithmic series; 13.2.10 for `b = n + 1`
  and `a = −m`;
- 13.2.11: `U(a, −n, z) = z^{n+1} U(a + n + 1, n + 2, z)`, the case `b = −n` of 13.2.40.

The logarithmic series 13.2.9 is `(−1)^{n+1} ∂_b F` evaluated termwise: the derivative of
`e^{(1−b)w}` gives the `ln z` and the derivatives of `Γ⁻¹` and `(b)_k⁻¹` give the digamma terms.

*Needs:* 1.1; Mathlib `Complex.digamma` and `Complex.regularizedHGFunCoeff_eq_zero_right`.

### 1.4 Analytic continuation

DLMF 13.2.12 in logarithmic coordinates: for `m ∈ ℤ` and every `w`,

```text
U(a, b, e^{w + 2mπi}) = (2πi e^{−πibm} sin(πbm) / (Γ(1 + a − b) sin πb)) 𝐌(a, b, e^w)
                         + e^{−2πibm} U(a, b, e^w)
```

for `b ∉ ℤ` (`kummerULog_add_two_pi_mul_I`). At `b = n ∈ ℤ` the coefficient of `𝐌` is its limit
`2πi m (−1)ⁿ/Γ(1 + a − n)`, since `sin(πbm)/sin(πb) → m (−1)^{n(m−1)}`, and `e^{−2πinm} = 1`. On
the slit plane `kummerU` is the branch `m = 0`. The proof: `𝐌(a, b, e^w)` is `2πi`-periodic in `w`
and `e^{(1−b)w}` gains `e^{−2πibm}`; the integer case follows by continuity in `b`.

**Checks.**
- At `a = 0.3`, `b = 0.45`, `z = 1.1 + 0.7i` and `m = 1`, both sides of 13.2.12 equal
  `3.93639 68583… + 4.03737 00133… i`.
- At `a = 0.3`, `b = 2`, `z = 1.1 + 0.7i` and `m = 1`, both sides of the integer form equal
  `1.26581 13703… − 1.98384 14489… i`; with `(−1)ⁿ` omitted they would differ at `b = −1`.

*Needs:* 1.1.

### 1.5 Whittaker functions

`regularizedWhittakerM`, `whittakerM`, `whittakerW` and their logarithmic versions as pinned.
DLMF 13.14.1–13.14.13:
- 13.14.1: `M_{κ,μ}` (for `2μ ∉ {−1, −2, …}`), `𝐌_{κ,μ}` and `W_{κ,μ}` solve Whittaker's equation
  on the slit plane (`whittakerW_equation`); 13.14.2–13.14.3 are the definitions and
  13.14.4–13.14.5 the inverse relations, with `κ = ½b − a`, `μ = ½b − ½`;
- 13.14.6: the series, including the terminating Gauss form with Mathlib's
  `regularizedGaussHGFun (−n) (½ + μ − κ) (1 + 2μ) 2` times `Γ(1 + 2μ)`;
- 13.14.7: `𝐌_{κ,μ}` at `2μ = −n − 1` equals `((−½n − κ)_{n+1}/(n + 1)!) M_{κ,(n+1)/2}`, the
  limit of `M_{κ,μ}/Γ(2μ + 1)` being the value of the entire function `𝐌_{κ,μ}`;
- 13.14.8–13.14.9: `W_{κ,±n/2}` by the logarithmic series and in the polynomial case;
- 13.14.10–13.14.13, the continuation in logarithmic coordinates; 13.14.10 and 13.14.11 for
  `𝐌_{κ,μ}` follow from `e^{(½+μ)(w ± πi)}` and 13.2.39;
- `(κ, μ, w) ↦ regularizedWhittakerMLog κ μ w` and `whittakerWLog κ μ w` are entire, as DLMF
  states after 13.14.13.

**Checks.**
- `W_{0,1/2}(1) = e^{−1/2} = 0.60653 06597…` (13.18.2 at `κ = ½`, through `U(0, 2, z) = 1`).
- 13.14.10 at `κ = 0`, `μ = ½`, upper sign: `M_{0,1/2}(z e^{πi}) = i e^{πi/2} M_{0,1/2}(z) =
  −M_{0,1/2}(z)`, consistent with `M_{0,1/2}(2z) = 2 sinh z` (13.18.1) and `sinh(−z) = −sinh z`.

*Needs:* 1.1–1.4; SpecialFunctionsParabolicCylinder §1.4.

### Examples

- `U(a, a + 1, z) = z^{−a}` is 13.2.8 at `n = 0` (13.6.4).
- 13.2.11 at `n = 0`: `U(a, 0, z) = z U(a + 1, 2, z)`.
- `F(a, 1, w) = 0`: `𝐌(a, 1, e^w)/Γ(a) − 𝐌(a, 1, e^w)/Γ(a)`.

### Dependencies

SpecialFunctionsParabolicCylinder Layer 1; AsymptoticExpansions §10.2.

## Layer 2: limiting forms at `0`, Wronskians and connection formulas

### 2.1 Limiting forms as `z → 0`

DLMF 13.2.13–13.2.22 along `𝓝[slitPlane] 0`, each with DLMF's case distinction: 13.2.14–13.2.15
when `a = −n` or `a = −n + b − 1`, and 13.2.16–13.2.22 in all other cases, split by `Re b`. The
`O`-terms are `Asymptotics.IsBigO` along `𝓝[≠] 0 ⊓ 𝓟 slitPlane`; 13.2.17, 13.2.19 and 13.2.21
contain `ln z`. The proof is the definition 13.2.42 for `b ∉ ℤ` and the logarithmic series 13.2.9
at integer `b`.

**Checks.**
- 13.2.19 at `a = 1`: `U(1, 1, z) = e^z E₁(z) = −ln z − γ + O(z ln z)`, since `ψ(1) = −γ`.

*Needs:* 1.1–1.3.

### 2.2 Numerically satisfactory solutions and Wronskians

DLMF 13.2.24–13.2.38. The content of 13.2.24–13.2.32 formalized here is that each listed function
solves 13.2.1 and that each listed pair has non-vanishing Wronskian on the stated sector, with the
logarithmic series 13.2.27–13.2.32 at integer `b` stated as functions on the slit plane. 13.2.24
and 13.2.25 are stated in logarithmic coordinates. The Wronskians 13.2.33–13.2.38 hold on the
slit plane, with `e^{±πi} z` as in the Conventions; for example
`𝒲{𝐌(a, b, z), U(a, b, z)} = −z^{−b} e^z/Γ(a)` (13.2.34; `wronskian_regularizedHGFun_kummerU`).
They are computed from the leading terms at `0` or at `∞`, since `z^b e^{−z} 𝒲` is constant by
13.2.1.

*Needs:* 1.1–1.4, 2.1.

### 2.3 Connection formulas

DLMF 13.2.40–13.2.41 and 13.2.43–13.2.44:
- 13.2.40: `U(a, b, z) = z^{1−b} U(a − b + 1, 2 − b, z)` on the slit plane
  (`kummerU_eq_cpow_mul_kummerU`), and its logarithmic form for every `w`;
- 13.2.41 for every `z ≠ 0` and both signs, with `U(b − a, b, e^{±πi} z)` as
  `kummerULog (b − a) b (log z ± πi)` (`regularizedHGFun_eq_kummerU_add`);
- 13.2.43–13.2.44 for every `z ≠ 0` in the same form.

13.2.42 is the definition (1.1).

**Checks.**
- At `a = 0.3`, `b = 0.45`, `z = 1.1 + 0.7i`, the upper sign of 13.2.41 gives
  `𝐌(a, b, z) = 0.94558 25545… + 0.60235 84360… i` on both sides.

*Needs:* 1.1–1.4, 2.2.

### 2.4 Whittaker functions

DLMF 13.14.14–13.14.19 and 13.14.22–13.14.35, translated from 2.1–2.3 by 13.14.2–13.14.5:
- the limiting forms at `0` with DLMF's cases;
- the numerically satisfactory pairs 13.14.22–13.14.24 (13.14.22–13.14.23 in logarithmic
  coordinates);
- the Wronskians 13.14.25–13.14.30, each under the condition that every Whittaker `M` it contains
  is defined: 13.14.25 for `2μ ∉ ℤ ∖ {0}`, 13.14.26–13.14.27 for `2μ ∉ {−1, −2, …}` and
  13.14.28–13.14.29 for `2μ ∉ {1, 2, …}`. Under the pinned definition `M_{κ,−½}` is identically
  `0`, because its factor is `Γ(0) = 0`, so 13.14.25 at `μ = ½` would be false. The regularized
  forms hold for every `μ`: `𝒲{𝐌_{κ,μ}, 𝐌_{κ,−μ}} = −sin(2πμ)/π`, and 13.14.26–13.14.29 divided
  by `Γ(1 ± 2μ)`, for example `𝒲{𝐌_{κ,μ}, W_{κ,μ}} = −1/Γ(½ + μ − κ)`;
- the symmetry `W_{κ,μ} = W_{κ,−μ}` (13.14.31; `whittakerW_neg`) and the connection formulas
  13.14.32–13.14.35.

*Needs:* 1.5, 2.1–2.3.

### Examples

- 13.2.34 at `a = b = 1`: `𝐌(1, 1, z) = e^z`, `U(1, 1, z) = e^z E₁(z)`, and
  `𝒲 = e^z (e^z E₁)′ − e^z e^z E₁ = −e^z z^{−1}`, using `E₁′ = −e^{−z}/z`.
- 13.14.31 at `μ = ½`: `W_{κ,1/2} = W_{κ,−1/2}`, which is 13.2.40 at `a = −κ`, `b = 0`:
  `U(−κ, 0, z) = z U(1 − κ, 2, z)`.

### Dependencies

Layer 1.

## Layer 3: recurrences and derivatives

### 3.1 Kummer functions

DLMF 13.3.1–13.3.29 on the slit plane:
- the contiguous relations 13.3.1–13.3.6 and 13.3.13 for `M` and 13.3.7–13.3.12 and 13.3.14 for
  `U`; those for `M` are stated as identities of `Γ(b)𝐌` with each occurring denominator parameter
  outside `{0, −1, …}`, and in regularized form, with `Γ(b)` divided out, for all `b`;
- the derivatives 13.3.15–13.3.28 for `n : ℕ`, through `iteratedDeriv` and the operator
  `(z d/dz z)ⁿ` of 3.2, and the operator identity 13.3.29; 13.3.22,
  `U′(a, b, z) = −a U(a + 1, b + 1, z)`, is `hasDerivAt_kummerU`.

The proofs for `𝐌` are coefficient identities; for `U` they follow from 13.2.42 for `b ∉ ℤ` and
continuity in `b`.

*Needs:* Layer 1; SpecialFunctionsParabolicCylinder §1.2.

### 3.2 Whittaker functions

DLMF 13.15.1–13.15.26 on the slit plane, with `√z` principal: the recurrences 13.15.1–13.15.14
and the differentiation formulas 13.15.15–13.15.26 for `n : ℕ`, where `(z d/dz z)ⁿ` is the
iterate of `f ↦ (fun z ↦ z * deriv (fun t ↦ t * f t) z)`. DLMF notes that 13.15.2 and 13.15.10
correct errors in earlier tables; the forms here are DLMF's.

*Needs:* 1.5, 3.1.

### Examples

- 13.3.22 at `a = b = 1`: `(e^z E₁(z))′ = −U(2, 2, z) = e^z E₁(z) − z⁻¹`, by 13.6.6,
  `U(2, 2, z) = e^z Γ(−1, z)`, and `Γ(−1, z) = e^{−z}/z − E₁(z)`.
- 13.15.24 at `n = 1`, `κ = ½`, `μ = 0`: with `W_{1/2,0}(z) = e^{−z/2} z^{1/2}` (13.18.2),
  `d/dz(e^{−z/2} z^{−1/2} W_{1/2,0}(z)) = −e^{−z} = −e^{−z/2} z^{−1} W_{1,1/2}(z)`, since
  `W_{1,1/2}(z) = e^{−z/2} z` (13.18.2).

### Dependencies

Layers 1–2.

## Layer 4: integral representations

### 4.1 Integrals along the real line

DLMF 13.4.1–13.4.7 with DLMF's hypotheses:
- 13.4.1 (Euler's integral, `Re b > Re a > 0`) and 13.4.2 (`Re b > Re c > 0`), for every `z`;
- 13.4.3 for `Re a > 0` and `z ≠ 0`, through `Complex.besselJ (b − 1) (2√(zt))`;
- 13.4.4, `U(a, b, z) = Γ(a)⁻¹ ∫₀^∞ e^{−zt} t^{a−1} (1 + t)^{b−a−1} dt` for `Re a > 0` and
  `|ph z| < π/2` (`kummerU_eq_integral`);
- 13.4.5 for `|ph z| < π` and `Re a > max(Re b − 1, 0)`; 13.4.6 for `n : ℕ` with
  `−Re b < n < 1 + Re(a − b)`;
- 13.4.7 through SpecialFunctionsBessel's `K_{b−1}`, for `Re a > max(Re b − 1, 0)` and
  `z ∈ slitPlane`.

13.4.1 is proved by expanding `e^{zt}` and Mathlib's `Complex.betaIntegral`; 13.4.4 by showing that
the integral solves 13.2.1, is `O(z^{−a})` at `+∞` and has the right value of the recessive
coefficient, or by the Mellin–Barnes form 4.3.

*Needs:* Layers 1–2; Mathlib `Complex.betaIntegral`; SpecialFunctionsBessel.

### 4.2 Contour integrals

DLMF 13.4.9–13.4.11 and 13.4.13–13.4.14, with the contours fixed as follows (`0 < ε < ½`):
- 13.4.9, `∫₀^{(1+)}` for `Re a > 0` and `b − a ∉ {1, 2, …}`: the segment `[0, 1 − ε]` with
  `ph(t − 1) = −π`, the circle `|t − 1| = ε` positively from `ph(t − 1) = −π` to `π`, and the
  segment back with `ph(t − 1) = π`;
- 13.4.10, `∫₁^{(0+)}` for `Re(b − a) > 0` and `a ∉ {1, 2, …}`: the segment `[ε, 1]` from `1` to
  `ε` with `ph t = 0`, the circle `|t| = ε` positively from `ph t = 0` to `2π`, and the segment
  back with `ph t = 2π`, with `ph(1 − t) = 0` throughout; the loop then contributes
  `(e^{2πia} − 1) ∫₀¹` for `Re a > 0`, and DLMF's prefactor `e^{−aπi} Γ(1 − a)/(2πi Γ(b − a))`
  returns 13.4.1;
- 13.4.11, the Pochhammer loop `∫_α^{(0+, 1+, 0−, 1−)}` for `a, b − a ∉ {1, 2, …}`, from `α = ½`:
  four circles about `0` and `1` joined by the segment `[ε, 1 − ε]`, with the phases of `t` and
  `1 − t` continued along the path from their principal values at `α`, as in DLMF Figure 13.4.1;
- 13.4.13, `∫_{−∞}^{(0+, 1+)}` for `|ph z| < π/2`: the lines `Im t = −ε` from `−∞` to `1`, the
  right half of the circle `|t − 1| = ε`, and the line `Im t = ε` back, with `t^{−b}` and
  `(1 − 1/t)^{−a}` principal;
- 13.4.14, `∫_∞^{(0+)}` for `a ∉ {1, 2, …}` and `|ph z| < π/2`: the lines `Im t = ±ε` from `+∞`,
  joined by the left half of the circle `|t| = ε`, with `ph t ∈ (0, 2π)` and `ph(1 + t) = 0` where
  the path crosses `(−1, 0)`.

Each value is independent of `ε` by Cauchy's theorem, and each formula reduces to 4.1 when the
real-line integral converges, by shrinking the circles; the general case follows by holomorphy in
the parameters.

*Needs:* 4.1; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

### 4.3 Mellin–Barnes integrals

DLMF 13.4.16–13.4.18: 13.4.16 for `|ph z| < π/2` and `a ∉ {0, −1, …}`, 13.4.17 for
`|ph z| < 3π/2` in logarithmic coordinates and `a, a − b + 1 ∉ {0, −1, …}`, and 13.4.18 for
`|ph z| < π/2`. Each is stated on a vertical line `Re t = c` that separates the poles when such a
line exists, and in general as the line integral minus finitely many residues.

*Needs:* 4.1; AsymptoticExpansions §§8.1–8.2, 8.6; Tau Ceti `TauCeti.Contour.residue`.

### 4.4 Whittaker functions

DLMF 13.16.1–13.16.8 and 13.16.10–13.16.12 with DLMF's hypotheses: the real-line integrals
13.16.1–13.16.8, including the Bessel kernels `J_{2μ}`, `I_{2μ}`, `K_{2μ}` of 13.16.3–13.16.4 and
13.16.8 and the Stieltjes forms 13.16.6–13.16.7, and the Mellin–Barnes integrals
13.16.10–13.16.12, 13.16.11 for `|ph z| < 3π/2` in logarithmic coordinates. They follow from 4.1
and 4.3 by 13.14.2–13.14.3.

*Needs:* 1.5, 4.1–4.3.

### Examples

- 13.4.4 at `a = 1`, `b = 1`: `U(1, 1, z) = ∫₀^∞ e^{−zt} (1 + t)^{−1} dt = e^z E₁(z)` for
  `Re z > 0`.
- 13.4.1 at `a = 1`, `b = 2`: `𝐌(1, 2, z) = ∫₀^1 e^{zt} dt = (e^z − 1)/z`.
- 13.16.5 at `κ = 0`, `μ = ν`, with 13.18.9, is DLMF 10.32.8:
  `K_ν(z) = √π (z/2)^ν Γ(ν + ½)⁻¹ ∫₁^∞ e^{−zt} (t² − 1)^{ν−½} dt` for `Re ν > −½`, `|ph z| < π/2`.

### Dependencies

Layers 1–3; SpecialFunctionsBessel; AsymptoticExpansions Layer 8.

## Layer 5: continued fractions and relations to other functions

### 5.1 Continued fractions

DLMF 13.5.1–13.5.4 and 13.17.1–13.17.4. The fraction 13.5.1 for
`M(a, b, z)/M(a + 1, b + 1, z) = 𝐌(a, b, z)/(b 𝐌(a + 1, b + 1, z))` converges at every `z` with
`𝐌(a + 1, b + 1, z) ≠ 0`, for `b ∉ {0, −1, …}`; 13.5.3 for `U(a, b, z)/U(a, b − 1, z)` converges
for `|ph z| < π` where `U(a, b − 1, z) ≠ 0`; 13.17.1–13.17.4 likewise, with DLMF's parameter
hypotheses, such as `μ + ½ ± (κ + 1) ∉ {−1, −2, …}` for 13.17.3. The partial numerators divide
by the shifted denominators `(b + 2n)(b + 2n + 1)` and `(2μ + 2n)(2μ + 2n + 1)`, so the parameter
exclusions are needed even where the left side is defined. "Converges to the meromorphic function"
is stated as convergence of the convergents at each point where the left side is defined and finite.
The proof is Pincherle's theorem for the contiguous relations of 3.1, with the minimal solutions
identified by bounding the ratios of consecutive terms through the integrals 13.4.1 and 13.4.4
(Gautschi 1967), and holomorphy in the parameters for the remaining parameters.

*Needs:* 3.1, 4.1; SpecialFunctionsEiLiErfIncompleteGamma §4.1.

### 5.2 Kummer functions

DLMF 13.6.1–13.6.18 with 13.6.11_1–13.6.11_2, and 13.6.21 in the terminating cases:
- elementary functions: 13.6.2 for every `z`, and 13.6.4 and the `U` half `U(0, b, z) = 1` of
  13.6.3 for `z ∈ slitPlane`; 13.6.1 and the `M` half of 13.6.3 are inputs;
- incomplete Gamma and error functions: 13.6.6 for `z ∈ slitPlane` and 13.6.8 for `Re z > 0`,
  through SpecialFunctionsEiLiErfIncompleteGamma; 13.6.5 and 13.6.7 are inputs. At real argument,
  through Tau Ceti's `TauCeti.lowerIncompleteGamma` and `TauCeti.Real.erfc`:
  `U(1 − s, 1 − s, x) = e^x (Γ(s) − γ(s, x))` for `s, x > 0` (`kummerU_one_sub_one_sub`) and
  `U(½, ½, x²) = √π e^{x²} erfc x` for `x > 0` (`kummerU_half_half_sq`). 13.6.6 and 13.6.8 are
  DLMF 8.5.3, 8.19.16 and 7.11.5 rearranged; they are proved here, and 10.1 restates them in the
  notation of Chapters 7 and 8;
- modified Bessel functions 13.6.9–13.6.10 and 13.6.11_1–13.6.11_2 for `z ∈ slitPlane`, with the
  products `Γ(ν)(2ν)_k(ν + k)` and `Γ(ν − n)(2ν − 2n)_k(ν − n + k)` read as their holomorphic
  extensions as in 9.1
  (so `ν = 0`, respectively `ν = n`, is covered), and Airy's
  function 13.6.11 for `z ≠ 0`, `|ph z| < 2π/3` (`kummerU_airyAi`);
- Weber's function 13.6.12–13.6.15 for `Re z > 0` (`kummerU_parabolicCylinderU`);
- Hermite polynomials 13.6.16–13.6.18, with `H_n(x) = 2^{n/2} He_n(√2 x)`;
- 13.6.21 when `a` or `a − b + 1` is a nonpositive integer, with `₂F₀` the finite sum
  `∑_k (a)_k (a − b + 1)_k (−z)^{−k}/k!`.

DLMF notes that its source tables contain errors in the equations corresponding to 13.6.7 and
13.6.8; the forms here are DLMF's.

*Needs:* Layers 1–4; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsBessel;
SpecialFunctionsAiry; SpecialFunctionsParabolicCylinder.

### 5.3 Whittaker functions

DLMF 13.18.1–13.18.16: elementary functions 13.18.1–13.18.3, incomplete Gamma and error functions
13.18.4–13.18.7, modified Bessel and Airy functions 13.18.8–13.18.10
(`whittakerW_zero_eq_besselK` for 13.18.9), Weber's function 13.18.11–13.18.13 and Hermite
polynomials 13.18.14–13.18.16, with the domains of 5.2 transported by 13.14.2–13.14.3. 13.18.4
and 13.18.6 come from the inputs 13.6.5 and 13.6.7 by 13.14.2, and 13.18.5 and 13.18.7 from 13.6.6
and 13.6.8 by 13.14.3; they are targets here because the Whittaker functions are.

*Needs:* 1.5, 5.2.

### Examples

- 13.6.2 is 13.4.1 at `a = 1`, `b = 2` with `z` replaced by `2z`.
- 13.18.9 at `ν = 0.3`, `z = 0.8 + 0.4i`: both sides equal `0.39325 70521… − 0.15612 45294… i`.
- 13.6.16 at `n = 1`: `M(−1, ½, z²) = 1 − 2z² = −(1/2) H₂(z)` with `H₂(z) = 4z² − 2`.

### Dependencies

Layers 1–4, 6; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsBessel;
SpecialFunctionsAiry; SpecialFunctionsParabolicCylinder.

## Layer 6: large argument

### 6.1 `U` and `W_{κ,μ}`

DLMF 13.2.6, 13.7.3, 13.14.21 and 13.19.3: for every `δ > 0` and `N`, in logarithmic coordinates
`z = e^w` with `|Im w| ≤ 3π/2 − δ`,

```text
U(a, b, z) = z^{−a} ∑_{s<N} (a)_s (a − b + 1)_s/s! (−z)^{−s} + O(|z|^{−Re a − N})
```

(`isBigO_kummerULog_sub_sum`), with `z^{−a} = e^{−aw}`; 13.2.6 is the case `N = 1` together with
the uniqueness statement of DLMF: `U` is the only solution of 13.2.1 with `U(a, b, z) ∼ z^{−a}`
along the positive axis, when `a ∉ {0, −1, …}`. 13.14.21 and 13.19.3 follow by 13.14.3. The
proof: Watson's lemma applied to 13.4.4 for `Re a > 0` in `|ph z| ≤ π/2 − δ`, rotation of the ray
through `|ph t| < π`, and 13.3.7 (the recurrence lowering `a`) for the remaining `a`.

*Needs:* 4.1, 3.1; AsymptoticExpansions §§4.2–4.3, §10.4.

### 6.2 `M` and `M_{κ,μ}`

DLMF 13.2.23, 13.7.1–13.7.2, 13.14.20 and 13.19.1–13.19.2: 13.7.1 along the positive real axis
for `a ∉ {0, −1, …}`; 13.7.2 in logarithmic coordinates for `−π/2 + δ ≤ ±Im w ≤ 3π/2 − δ`, as a
two-sum expansion, unless `a` and `b − a` are both nonpositive integers; 13.2.23 and 13.14.20 for
`|ph z| ≤ π/2 − δ`. 13.7.2 is 13.2.41 with 6.1 applied to both terms.

*Needs:* 2.3, 6.1.

### 6.3 Large `b` and large `μ`

- DLMF 13.8.1: for fixed `a`, `z` and `δ > 0`, as `b → ∞` in `{b | ∀ n : ℕ, δ ≤ |b + n|}`,
  `M(a, b, z) = ∑_{s<n} (a)_s z^s/((b)_s s!) + O(|b|^{−n})`.
- DLMF 13.20.1: for fixed `κ` and `R > 0`, as `μ → ∞` in `|ph μ| ≤ π/2 − δ`,
  `M_{κ,μ}(z) = z^{μ+½}(1 + O(μ^{−1}))` uniformly for `0 < |z| ≤ R` in the slit plane.

Both are tail estimates of the series: under `|b + n| ≥ δ` for all `n`, the tail
`∑_{s≥n} (a)_s z^s/((b)_s s!)` is `O(|b|^{−n})`, and likewise for `𝐌(½ + μ − κ, 1 + 2μ, z)`.

*Needs:* 1.5; Tau Ceti `Complex.hasSum_regularizedHGFun`.

### Examples

- 13.7.3 at `a = b = 1`: `e^z E₁(z) ∼ ∑ (−1)^s s! z^{−s−1}`, DLMF 6.12.1.
- 13.2.23 at `a = b`: `𝐌(a, a, z) = e^z/Γ(a)`, exactly.

### Dependencies

Layers 1–4; AsymptoticExpansions Layers 1, 4 and 10.

## Layer 7: zeros

### 7.1 Real zeros of `M`

DLMF §13.9(i) without 13.9.8–13.9.10:
- for `a, b − a ∉ {0, −1, …}`, `M(a, b, ·)` has infinitely many complex zeros; for real `a`, `b`
  the number of real zeros is finite; all zeros away from `0` are simple;
- the counts 13.9.1–13.9.6 of positive zeros `p(a, b)` for real `a`, `b`, with the corrected
  hypotheses below, and 13.9.7 for the negative zeros, `n(a, b) = p(b − a, b)`, by 13.2.39;
- the zero-free parabolic regions `P_α = {x + iy | y² ≤ 4α(x + α)}` of the paragraph after 13.9.9,
  for the three parameter ranges stated there; for the partial sums of 13.2.2, the interior of
  `P_α`. The closed region fails for partial sums: in the first range the degree-one sum
  `1 + (a/b) z` vanishes at the vertex `−b/a` of `P_{b/a}` (at `a = b = 1`, `1 + z` vanishes at
  `−1 ∈ P₁`);
- for fixed `a`, `z` and `δ > 0`, `M(a, b, z)` has finitely many `b`-zeros with `|b + n| ≥ δ` for
  every `n ∈ ℕ`: 13.8.1 (6.3) excludes large ones there, and the bounded part is compact. DLMF's
  unrestricted statement is false: `𝐌(1, −n, 1) = e` by 13.2.5, so `M(1, b, 1)` has the residue
  `(−1)ⁿ e/n!` at `−n` and tends to `−∞` as `b ↑ −n` for even `n`, while `M(1, −n − ½, 1) → 1`; so
  there is a zero in each `(−n − ½, −n)` for large even `n`, such as `b = −10.00000 08232 66…`.

The counts 13.9.1 and 13.9.2 are stated for `b > 0` (`ncard_pos_zeros_regularizedHGFun_of_neg`,
`regularizedHGFun_ne_zero_of_nonneg`); DLMF prints `b ≥ 0`. At
`b = 0`, where `M(a, 0, x)` is undefined, `𝐌(a, 0, x) = a x 𝐌(a + 1, 2, x)` has one positive zero
fewer than 13.9.1 gives when `a < 0`: as `b ↓ 0` the smallest positive zero of `M(a, b, ·)` tends
to `0`. 13.9.4–13.9.6 have `b < 0` and are stated for `b ∉ ℤ`.

DLMF (Release 1.2.8) prints 13.9.3 and 13.9.4 for `a ≥ 0` and 13.9.6 for every `a` with
`⌈−b⌉ > ⌈−a⌉ > 0`. Each fails on part of that region, so the targets are:
- 13.9.3 and 13.9.4 for `a > 0`. At `a = 0`, `M(0, b, x) = 1` has no zeros, while 13.9.3 at
  `b = −1/2` and 13.9.4 at `b = −5/2` give `1`;
- 13.9.6 for `a ∉ {−1, −2, …}`. At `a = −1`, `b = −3/2` it gives `1`, but
  `M(−1, −3/2, x) = 1 + 2x/3` has no positive zero. The NIST draft of §13.9 dated 2026-11-06 adds
  this hypothesis; it keeps `a ≥ 0` in 13.9.3 and 13.9.4;
- 13.9.7 with the same exclusions on the pair `(b − a, b)`. At `a = b = −1/2` and at `a = −1/2`,
  `b = −3/2` the printed value is `1`, and there are no negative zeros.

The proof counts sign changes through Sturm comparison on the self-adjoint form
`(x^b e^{−x} w′)′ = a x^{b−1} e^{−x} w` and continuity of the zeros in the parameters, with the
polynomial cases `a = −n` as base cases; both are auxiliary targets of this layer (see the table
of auxiliary results).

**Checks.**
- `M(−0.5, 0.01, ·)` has one positive zero, at `x = 0.01990 14758…`, and `𝐌(−0.5, 0, ·)` has
  none.
- On the grid `a ∈ {−5.5, −5.25, …, 3}`, `b < 0` non-integer with `b ≥ −5.5`, the corrected counts
  13.9.3–13.9.6 agree with a sign-change count of `M(a, b, ·)` on `(0, 80]`; the printed ones
  fail only at `a = 0` (13.9.3, 13.9.4) and at negative integer `a` (13.9.6).

*Needs:* Layers 1–2, 6.

### 7.2 Zeros of `U`

DLMF §13.9(ii) without 13.9.16 and the `b`-zero strings: for fixed `a`, `b` and `r > 0`,
`U(a, b, ·)` has finitely many zeros in each truncated sector `|Im w| ≤ 3π/2 − δ`, `Re w ≥ log r`
of the logarithmic plane, and for real `a`, `b` in the whole sector `|Im w| ≤ 3π/2 − δ`, by the
limiting forms 13.2.16–13.2.22 at `0`. Without the truncation the statement fails for complex
parameters: by 13.6.10, `U(½ + i, 1 + 2i, 2x) = π^{−1/2} e^x (2x)^{−i} K_i(x)`, and `K_i(x)` has
infinitely many zeros accumulating at `0⁺` (DLMF 10.45.7). The layer also owns the counts
13.9.11–13.9.15 of zeros `T(a, b)` in `|ph z| < π` and `P(a, b)` on `(0, ∞)` for real noninteger
`a`, `b`, `a − b + 1`, with `T(a, b) = T(a − b + 1, 2 − b)` and `P(a, b) = P(a − b + 1, 2 − b)`
for `b ≥ 1` by 13.2.40, and Wimp's theorem: for real `a`, `b` with `2a − b > −1`, `U(a, b, z) ≠ 0`
for `|ph z| ≤ π/2`, `z ≠ 0`.

*Needs:* Layers 1–2, 6.

### 7.3 Whittaker functions

DLMF §13.22 without 13.22.1: the zeros of `M_{κ,μ}` away from `0` are those of
`M(½ + μ − κ, 1 + 2μ, ·)` and the zeros of `W_{κ,μ}` are those of `U(½ + μ − κ, 1 + 2μ, ·)`.

*Needs:* 1.5, 7.1–7.2.

### Examples

- 13.9.1 at `a = −1`, `b = 1`: `M(−1, 1, x) = 1 − x` has the single positive zero `x = 1`.
- 13.9.2 at `a = 1`, `b = 2`: `M(1, 2, x) = (e^x − 1)/x > 0` for `x > 0`.

### Dependencies

Layers 1–2, 5–6.

## Layer 8: integrals

### 8.1 Indefinite integrals, Laplace and Mellin transforms

DLMF 13.10.1–13.10.2 (as derivatives, for `a ≠ 1`), 13.10.4–13.10.6 and 13.10.8–13.10.11 with
DLMF's hypotheses. The loop integrals 13.10.8–13.10.9 use the loop `∫_{−∞}^{(0+)}` of the
Conventions, for `y > 0` and `Re z > 0`, through SpecialFunctionsBessel's `I_{b−1}` and
`K_{b−1}`; on the loop `y/t` stays in the slit plane, so `U(a, b, y/t)` is principal.

*Needs:* Layers 1–4; AsymptoticExpansions §8.1; SpecialFunctionsBessel.

### 8.2 Fourier and Hankel transforms

DLMF 13.10.12–13.10.16 for `x > 0` with DLMF's hypotheses, through Mathlib's `Complex.besselJ`
for 13.10.13–13.10.16.

*Needs:* 4.1, 8.1.

### 8.3 Whittaker functions

DLMF 13.23.1–13.23.3 and 13.23.5–13.23.12: the Laplace and Mellin transforms 13.23.1–13.23.5
without 13.23.4 (13.23.1 with Mathlib's `regularizedGaussHGFun` at `1/(z + ½)`, inside the unit
disk since `Re z > ½`), the loop integrals 13.23.6–13.23.7, the Fourier transform 13.23.8 and the
Hankel transforms 13.23.9–13.23.12.

*Needs:* 1.5, 8.1–8.2.

### Examples

- 13.10.4 at `a = 0`: `∫₀^∞ e^{−zt} t^{b−1}/Γ(b) dt = z^{−b}`, which is Mathlib's
  `Complex.Gamma_eq_integral` after scaling.
- 13.10.11 at `a = b = 1`: `∫₀^∞ t^{λ−1} e^t E₁(t) dt = Γ(λ) Γ(1 − λ)` for `0 < Re λ < 1`.

### Dependencies

Layers 1–6; SpecialFunctionsBessel.

## Layer 9: series, products and addition theorems

### 9.1 Kummer series

DLMF 13.11.1–13.11.4:
- the expansions 13.11.1–13.11.2 in `I_{a−½+s}(z/2)` and `I_{b−a−½+s}(z/2)`, for `z ∈ slitPlane`
  with DLMF's parameter exclusions. The products `Γ(a − ½)(2a − 1)_s (a − ½ + s)` of 13.11.1 and
  `Γ(b − a − ½)(2b − 2a − 1)_s (b − a − ½ + s)` of 13.11.2 are read as their holomorphic
  extensions: by `(2a − 1)_s = (2a − 1)(2a)_{s−1}` and `Γ(a − ½)(2a − 1) = 2Γ(a + ½)`, the first is
  `Γ(a + ½)` at `s = 0` and `2Γ(a + ½)(2a)_{s−1}(a − ½ + s)` for `s ≥ 1`, and the second is the
  same with `b − a` in place of `a`. This covers `a = ½` in 13.11.1 and `b − a = ½` in 13.11.2,
  where the printed `Γ(0)` would be Mathlib's junk value `0`. Check: at `a = ½`, `b = z = 1` both
  sides equal `1.75338 76543 7709…`;
- Buchholz's expansion 13.11.3 in the entire form
  `𝐌(a, b, z) = e^{z/2} ∑_s A_s (z/2)^s 𝐅(b + s, −(b − 2a) z/2)` for all `a`, `b`, `z`
  (`hasSum_regularizedHGFun_buchholz`), with `𝐅(c, w) = ∑_k w^k/(k! Γ(c + k))` the regularized
  `₀F₁`, and the printed `J_{b−1+s}` form for `z ≠ 0`, `b ≠ 2a` and
  `−π < ph z + ph(b − 2a) ≤ π`, with principal powers and square root. Outside that range the
  printed form with principal branches is false: at `a = 0.2 − 0.5i`, `b = 1.4 + 0.4i`,
  `z = −1.2 + 0.3i` the left side is `1.18529 22839… + 0.46781 21627… i` and the printed right
  side `2.83359 66305… − 3.38992 70140… i`;
- the coefficients `A_n` of 13.11.4: `A₀ = 1`, `A₁ = 0`, `A₂ = b/2`, and
  `(n + 1) A_{n+1} = (n + b − 1) A_{n−1} + (2a − b) A_{n−2}` for `n ≥ 2` (`buchholzCoeff`).

*Needs:* Layers 1–3; SpecialFunctionsBessel.

### 9.2 Products

DLMF 13.12.1, for `b ∉ ℤ`. The left side is bounded at infinity by 13.2.39–13.2.41 and 6.1, and
equals `1` at `0`.

*Needs:* 2.3, 6.1.

### 9.3 Addition theorems

DLMF 13.13.1–13.13.12, the expansions of `M(a, b, x + y)` and `U(a, b, x + y)` for complex `x`,
`y` with DLMF's convergence conditions (`|y| < |x|` or `Re(y/x) > −½`), and with `x`, `x + y` in
the slit plane for the `U` expansions. The multiplication theorems of §13.13(iii) are these with
`y` replaced by `(y − 1)x` and are not separate targets.

*Needs:* Layers 1–3, 6.

### 9.4 Whittaker functions

DLMF 13.24.1–13.24.3, 13.25.1 and 13.26.1–13.26.12. In 13.24.1 the product
`Γ(κ + μ)(2κ + 2μ)_s (κ + μ + s)` is read as its holomorphic extension, as in 9.1, so that
`κ + μ = 0` is covered. The polynomials `p_s^{(μ)}(z)` of 13.24.2
are `(−z)^s` times the `s`-th Taylor coefficient at `t = 0` of the function 13.24.3, holomorphic
near `0` after filling its removable singularity. DLMF notes errors in its sources for 13.26.3 and
13.26.6; the forms here are DLMF's.

*Needs:* 1.5, 9.1–9.3.

### Examples

- 13.11.1 at `a = ½ + ν`, `b = 1 + 2ν` reduces to 13.6.9.
- 13.12.1 at `a = 0`: `M(0, b, z) M(0, −b, −z) = 1`.
- 13.13.1 at `y = −x`: `M(a, b, 0) = 1 = ∑_n (a)_n (−x)^n/((b)_n n!) M(a + n, b + n, x)`.

### Dependencies

Layers 1–6; SpecialFunctionsBessel.

## Layer 10: relations owed to other roadmaps

### 10.1 Exponential, error and incomplete Gamma functions

- DLMF 6.11.2 for `z ∈ slitPlane` and 6.11.3 for `−π/2 < ph z < π`, `z ≠ 0`, the region where
  both sides are holomorphic, through `TauCeti.sinIntegralAuxF` and `TauCeti.sinIntegralAuxG`.
- DLMF 7.11.5 and 7.18.10 for `Re z > 0`; at `z = −1` the principal branch of
  `U(½, ½, z²)` gives `erfc(1)` and not `erfc(−1)`.
- DLMF 8.5.3 and 8.5.5 for `z ∈ slitPlane`, and 8.5.4 for `z ∈ slitPlane`, `a ∉ {0, −1, −2, …}`.
- DLMF 8.19.16 for `z ∈ slitPlane`.

*Needs:* Layers 1, 5; SpecialFunctionsEiLiErfIncompleteGamma.

### 10.2 Airy, Bessel and parabolic cylinder functions

- DLMF 9.6.21–9.6.24 with `ζ = (2/3) z^{3/2}`, for `z ≠ 0`, `|ph z| < 2π/3`.
- DLMF 10.16.6–10.16.8 for `Re z > 0`, where all powers are principal (DLMF states that principal
  branches correspond at least when `|ph z| ≤ π/2`; on the ray `ph z = −π/2` the argument `−2iz`
  of 10.16.6 lies on the cut with DLMF phase `−π`), with `2ν ∉ {−1, −2, …}` for 10.16.7.
- DLMF 10.39.6 and 10.39.8 for `z ∈ slitPlane`, and 10.39.7 for `z ∈ slitPlane`,
  `2ν ∉ {−1, −2, …}`.
- DLMF 12.7.14 for `Re z > 0`.

*Needs:* Layers 1, 5; SpecialFunctionsAiry; SpecialFunctionsBessel;
SpecialFunctionsParabolicCylinder.

### Examples

- 8.19.16 at `p = 1` is 6.11.2.
- 10.39.8 at `ν = ½`: `K_{1/2}(z) = (π/(2z))^{1/2} e^{−z}`, with `W_{0,1/2}(2z) = e^{−z}`.

### Dependencies

Layers 1–9; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsAiry; SpecialFunctionsBessel;
SpecialFunctionsParabolicCylinder.

## Downstream consumers

- **SpecialFunctionsEiLiErfIncompleteGamma**, **SpecialFunctionsAiry**, **SpecialFunctionsBessel**
  and **SpecialFunctionsParabolicCylinder** rely on this roadmap for the formulas through `U` and
  the Whittaker functions that they exclude (Layer 10).
- A roadmap for the large-parameter and uniform expansions of DLMF §§13.8, 13.20–13.21 consumes
  Layers 1–6 with the Bessel, Airy and parabolic cylinder roadmaps.
- Roadmaps for the Gauss function (DLMF Chapter 15), the orthogonal polynomials (Chapter 18) and
  the Coulomb functions (Chapter 33) consume Layers 1–5 for the formulas listed below.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material completes DLMF Chapter 13. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

**Planned for follow-up roadmaps.**
- **Large-parameter and uniform asymptotics**: DLMF 13.8.2–13.8.18, §13.20 beyond 13.20.1 and
  §13.21, and what rests on them: the zeros for large parameters 13.9.8, 13.9.10, 13.9.16 and
  13.22.1. They need Watson's lemma for loop integrals, the uniform approximations through
  parabolic cylinder, Bessel and Airy functions (DLMF §§2.4(v)–(vi) and 2.8(iii)–(vi)) and
  Temme's expansions in Bessel functions, which AsymptoticExpansions excludes.
- **Formulas through the Gauss function off its disk of convergence**: DLMF 13.4.8, 13.4.12,
  13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4. They need `₂F₁` continued to `ℂ \ [1, ∞)` and
  belong to a roadmap for DLMF Chapter 15.
- **Laguerre and Charlier polynomials**: DLMF 13.6.19–13.6.20 and 13.18.17, which belong to an
  orthogonal-polynomial roadmap (DLMF Chapter 18). The positive zeros of the polynomials
  `M(−n, b, ·)`, which Layer 7 needs, are an auxiliary target here and are stated without
  `L_n^{(α)}`.
- **Coulomb functions**: DLMF §13.6(vii) and §13.18(vi), which belong to a roadmap for DLMF
  Chapter 33.
- **The generalized hypergeometric `₂F₀`** in 13.6.21 when neither `a` nor `a − b + 1` is a
  nonpositive integer (DLMF §16.5), which belongs to a roadmap for DLMF Chapter 16.

**Deferred, with no planned roadmap.**
- **Error bounds and exponentially improved expansions**: DLMF 13.7.4–13.7.13 and their Whittaker
  analogues mentioned in §13.19. The error bounds use the regions of DLMF Figure 13.7.1 from Olver
  (1991b), and the exponentially improved expansions rest on the remainder theory of DLMF §2.11.
- **Asymptotics of complex zeros**: the large `z`-zeros 13.9.9 of `M` and the two strings of
  `b`-zeros of `U`.
- **Integral transforms**: the Whittaker transform pair 13.23.13–13.23.14 and the transforms cited
  in §§13.10(vi) and 13.23(v).
- **Applications and computation** (DLMF §§13.27–13.32).
- **Sections with nothing to formalize**: the notation of §13.1.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/Confluent/` provides source material for most layers, with a coverage table in
`DLMF/Confluent/DLMFCoverage.md`. That development defines `U` at integer `b` by `limUnder` and
the branches off the principal sheet by `kummerUOnLog`; this roadmap defines the integer case
through `deriv` in `b` and the branches through `kummerULog`, with the limit forms as theorems.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source contains both proved theorems and admitted statements, and serves as a
reference, not as a specification. The following secondary provenance map records source
counterparts; the mathematical targets and dependencies are specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Confluent/Basic/KummerM`, `Confluent/Basic/Tricomi`, `Confluent/Basic/Whittaker`, `Confluent/Continuation`, `Confluent/LogSeries`, `Confluent/Regularized` |
| 2 | `Confluent/BasicProperties/*`, `Confluent/ConnectionWronskians` |
| 3 | `Confluent/Recurrence/*`, `Confluent/Basic/KummerContiguous` |
| 4 | `Confluent/IntegralRepresentations/*`, `Confluent/TricomiLaplace`, `Confluent/TricomiRotated` |
| 5 | `Confluent/ContinuedFractions`, `Confluent/Relations`, `Confluent/ParabolicCylinder/*` |
| 6 | `Confluent/Asymptotics/LargeArgument`, `Confluent/AsymptoticConsequences`, `Confluent/KummerDecay` |
| 7 | `Confluent/Zeros/RealZeros`, `Confluent/ZeroTools` |
| 8 | `Confluent/Integrals/*` |
| 9 | `Confluent/Series`, `Confluent/ProductsAddition`, `Confluent/WhittakerBuchholz` |
| 10 | `Confluent/ExpIntegral`, `Confluent/ErrorFunctions`, `Confluent/IncompleteGamma` |

## References

- NIST *Digital Library of Mathematical Functions*, Chapter 13 (A. B. Olde Daalhuis),
  <https://dlmf.nist.gov/13>.
- F. G. Tricomi, *Funzioni ipergeometriche confluenti*, Edizioni Cremonese, Rome, 1954.
- L. J. Slater, *Confluent Hypergeometric Functions*, Cambridge University Press, 1960.
- H. Buchholz, *The Confluent Hypergeometric Function*, Springer, 1969.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapter 7.
- W. Gautschi, Computational aspects of three-term recurrence relations, *SIAM Rev.* 9 (1967),
  24–82.
- J. Wimp, On the zeros of a confluent hypergeometric function, *Proc. Amer. Math. Soc.* 16
  (1965), 281–283.
- N. M. Temme, *Asymptotic Methods for Integrals*, World Scientific, 2015, Chapters 10 and 27.
