# Roadmap: confluent hypergeometric functions

**Summary.** This roadmap builds the theory of the confluent hypergeometric functions as a
library: Kummer's functions `M(a, b, z)` and `U(a, b, z)`, the standard solutions of Kummer's
equation

```text
z w″ + (b − z) w′ − a w = 0
```

and Whittaker's functions `M_{κ,μ}(z)` and `W_{κ,μ}(z)`, the standard solutions of Whittaker's
equation `W″ + (−¼ + κ/z + (¼ − μ²)/z²) W = 0`. Olver's regularized function
`𝐌(a, b, z) = M(a, b, z)/Γ(b)` is Mathlib's `Complex.regularizedHGFun {a} {b} z`.

Its organization follows the structure of the subject rather than any one text. Kummer's
equation arises from Gauss's when two regular singular points merge into an irregular singular
point at infinity, and the roadmap is built around its two singular points: the solution regular
at the origin, the solution recessive at infinity, and the connection between them. The Kummer
and Whittaker forms are developed side by side, each layer treating a topic in both. The
integral representations come early, because the Laplace integral identifies `U` with the
function other roadmaps construct; the local theory at the origin and the connection formulas
follow, then the three-term recurrences and their continued fractions, the behaviour at
infinity, the classical functions as special cases, grouped by family, the product and addition
formulas, the integral transforms, and the real zeros. The content is drawn from
Whittaker–Watson (Ch. XVI), Buchholz (*The Confluent Hypergeometric Function*), Olver
(*Asymptotics and Special Functions*, Ch. 7), Temme (*Special Functions*, Ch. 7), Lebedev
(*Special Functions and Their Applications*, Ch. 9), Andrews–Askey–Roy (*Special Functions*,
Ch. 4), Beals–Wong (*Special Functions*, Ch. 6), Kristensson (*Second Order Differential
Equations*, Ch. 7), Magnus–Oberhettinger–Soni (*Formulas and Theorems*, Ch. VI) and the NIST
*Digital Library of Mathematical Functions* (DLMF), and each headline cites its sources; see
[References](#references).

The roadmap covers:
- `𝐌` as a function of `(a, b, z)` jointly, the confluence of Gauss's function into `𝐌`, the
  singularities and the solution space of Kummer's equation, Kummer's `U` and the Whittaker
  functions, as holomorphic functions of `z` on the slit plane and on the logarithmic plane and
  entire functions of the parameters, with their polynomial cases and their continuation across
  the sheets (Layer 1);
- the integral representations on the real line, of Mellin–Barnes type and on loop contours, for
  the Kummer and the Whittaker functions (Layer 2);
- the limiting forms at `0`, the fundamental pairs, the Wronskians and the connection formulas
  (Layer 3);
- the contiguous relations, the derivatives and the continued fractions (Layer 4);
- the expansions for large argument, and the large-`b` and large-`μ` forms that follow from the
  series (Layer 5);
- the elementary, exponential-integral, incomplete Gamma, error, Bessel, Airy and parabolic
  cylinder functions and the Hermite and Laguerre polynomials as confluent functions, with the
  expansions in Bessel functions (Layer 6);
- the quadratic relations and the addition and multiplication theorems (Layer 7);
- the indefinite integrals and the Laplace, Mellin, Fourier and Hankel transforms (Layer 8);
- the real zeros of `M` and `U`, the zero counts and the zero-free regions (Layer 9).

The general asymptotic and contour tools are consumed from
[AsymptoticExpansions](../AsymptoticExpansions/README.md): the expansion API, Watson's lemma
and the rotation of the path, the Mellin tools and the regular and rank-one irregular
singularities. Other functions are consumed as follows:
- Tricomi's `U` from
  [QuantumFoundations §9.4](../QuantumFoundations/README.md#94-kummer-and-tricomi-functions),
  with its Laplace integral, its recurrence in `a`, its Wronskian with `𝐌`, the connection formula
  with `𝐌`, its integer-`b` forms and its leading behaviour at infinity; 2.1 identifies this
  roadmap's `U` with it;
- the Whittaker functions `M_{κ,μ}(y)` and `W_{κ,μ}(y)` for `y > 0`, with their Euler integrals,
  Whittaker's equation, the symmetry in `μ`, the Bessel comparisons and the leading behaviour at
  `0` and `∞`, from [AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md)
  §§0.26–0.28; 2.4 identifies this roadmap's Whittaker functions with them;
- the Laguerre polynomials and their orthogonality from
  [LaguerreJacobi](../LaguerreJacobi/README.md);
- Mathlib's `𝐌`, with Kummer's equation, its derivative, Kummer's transformation and its
  holomorphy in the parameters from
  [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md), which also
  supplies Weber's `U(a, z)`;
- the incomplete Gamma, exponential integral and error functions and Pincherle's theorem from
  [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md);
- the Airy functions from [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md);
- the Bessel functions `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` and Sturm comparison from
  [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md).

This roadmap builds the joint holomorphy of `𝐌` in `(a, b, z)`, the bracket form of `U`, with the
removable singularity in `b` at integer `b`, and its agreement with the `U` of
QuantumFoundations; the agreement of its Whittaker functions with those of
AutomorphicSpectralTheory; the logarithmic coordinate on which `U` and `W_{κ,μ}` are entire; the
loop contours of 2.3; the coefficients of the Bessel-series expansions of 6.3; and the
zero-counting tools of Layer 9: continuity of zeros in the parameters and the positive zeros of
the polynomials `M(−n, b, ·)`.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Confluent/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Kummer's equation and its standard solutions** (1.1–1.6).
2. **The functions as integrals** (2.1–2.4).
3. **Local theory at the origin and its connection to infinity** (3.1–3.4).
4. **Contiguity, differentiation and continued fractions** (4.1–4.3).
5. **Large argument and simple large-parameter forms** (5.1–5.3).
6. **Classical functions as confluent functions** (6.1–6.4).
7. **Quadratic relations and addition theorems** (7.1–7.3).
8. **Integrals and transforms** (8.1–8.3).
9. **Real zeros** (9.1–9.3).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`. Each
subsection lists the formulas it owns, with their DLMF equation numbers and their places in the
other sources, and the hypotheses and conventions it states them under. `Suggested.lean` states
the headlines that carry a Lean name, each with every conclusion the README attaches to it; it is
not an exhaustive acceptance test, and the other headlines are targets of the same standing,
stated in prose.

The roadmaps of the exponential integral, the error and incomplete Gamma functions, the Airy,
Bessel and parabolic cylinder functions leave to this roadmap their formulas through `U` and the
Whittaker functions: DLMF 6.11.2–6.11.3, 7.11.5, 7.18.10, 8.5.3–8.5.5 and 8.19.16 (6.1),
9.6.21–9.6.24, 10.16.6–10.16.8 and 10.39.6–10.39.8 (6.2), and 12.7.14 (6.4). They are targets
here, and this roadmap consumes those roadmaps' functions without restating them.

**Inputs.** Cases of the targets that Mathlib, Tau Ceti or a consumed roadmap already proves are
inputs, not targets:
- the series of `𝐌` (DLMF 13.2.2–13.2.4; Tau Ceti `Complex.hasSum_regularizedHGFun` and
  SpecialFunctionsParabolicCylinder §§1.1, 1.6) and the value `𝐌(a, b, 0) = Γ(b)⁻¹` (Mathlib
  `Complex.regularizedHGFun_zero`);
- Kummer's equation for `𝐌` (DLMF 13.2.1), Kummer's transformation
  `𝐌(a, b, z) = e^z 𝐌(b − a, b, −z)` (DLMF 13.2.39) and the derivative 13.3.15 divided by `Γ(b)`
  (SpecialFunctionsParabolicCylinder §§1.2–1.4);
- `𝐌(a, b, z)` entire in `a` and in `b` separately (SpecialFunctionsParabolicCylinder §1.5); joint
  holomorphy in `(a, b, z)` is a target (1.1);
- `₀F₀ = exp` (Mathlib `Complex.regularizedHGFun_zero_zero`, in which both parameter multisets are
  empty), with its consequences `𝐌(a, a, z) = Γ(a)⁻¹ e^z` for every `a` and `𝐌(0, b, z) = Γ(b)⁻¹`
  (the examples of [SpecialFunctionsParabolicCylinder Layer 1](../SpecialFunctionsParabolicCylinder/README.md#layer-1-the-regularized-kummer-function)):
  these are DLMF 13.6.1 and the `M` half of 13.6.3, since `M = Γ(b) 𝐌` where `M` exists;
- DLMF 13.6.5: its first equality is 13.2.39 at `b = a + 1`, and its second is DLMF 8.5.1,
  `γ(a, z) = a⁻¹ z^a Γ(a + 1) 𝐌(a, a + 1, −z)` for `a ∉ −ℕ`
  ([SpecialFunctionsEiLiErfIncompleteGamma §2.2](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#22-kummer-representations));
- DLMF 13.6.7, which is DLMF 7.11.4
  ([SpecialFunctionsEiLiErfIncompleteGamma §11.4](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#114-series-derivatives-and-hypergeometric-forms))
  with `M(½, 3/2, ·) = Γ(3/2) 𝐌(½, 3/2, ·)`;
- from [QuantumFoundations §9.4](../QuantumFoundations/README.md#94-kummer-and-tricomi-functions):
  Tricomi's `U(a, b, z)`, defined there by the Laplace integral (DLMF 13.4.4) for `Re a > 0`,
  `Re z > 0` and continued to the logarithmic plane, entire in `a` and `b`; the recurrence 13.3.7;
  the Wronskian 13.2.34; the connection formula 13.2.41 with the upper signs for `−π < ph z < 0`
  and the lower signs for `0 < ph z < π`; the integer-`b` forms 13.2.9–13.2.11; and
  `U(a, b, z) ∼ z^{−a}` in `|ph z| ≤ 3π/2 − δ` with its derivatives, which is 13.2.6 without its
  uniqueness statement. They hold for `kummerULog` through the agreement of 2.1;
- DLMF 13.6.19, `L_n^{(α)}(z) = ((α + 1)_n/n!) M(−n, α + 1, z)` for `α + 1 ∉ {0, −1, …}`
  (QuantumFoundations §9.4, with LaguerreJacobi's Laguerre polynomials); its first equality is
  13.2.7;
- from AutomorphicSpectralTheory
  [§§0.26–0.28](../AutomorphicSpectralTheory/README.md#026-whittaker-m-and-w-functions), for
  `y > 0`: `M_{κ,μ}(y)` by DLMF 13.14.2; `W_{κ,μ}(y)`, defined there by the Euler integral
  13.16.5 for `Re(½ + μ − κ) > 0` and continued in the parameters; the Euler integrals 13.16.1 and
  13.16.5; Whittaker's equation 13.14.1; the symmetry 13.14.31; the Bessel comparisons
  13.18.8–13.18.9; and the leading behaviour 13.14.14 at `0` and 13.14.20–13.14.21 at `∞`, in the
  ranges stated there. AutomorphicSpectralTheory writes `(μ, ν)` for DLMF's `(κ, μ)`. They hold
  for `whittakerM` and `whittakerW` at `y > 0` through the agreement of 2.4.

DLMF 13.6.9 and 13.6.10 are DLMF 10.39.5 and 10.39.6 rearranged; 10.39.5 is a target of
SpecialFunctionsBessel (its 8.1) and is consumed for 13.6.9, and 10.39.6 is a target here (6.2).

**Auxiliary results owned here**, which the layers need and which neither Mathlib, Tau Ceti nor a
consumed roadmap provides:
- `(a, b, z) ↦ 𝐌(a, b, z)` is holomorphic on `ℂ × ℂ × ℂ`: each term `(a)ₙ zⁿ/(n! Γ(b + n))` is
  jointly entire, and the series converges locally uniformly in `(a, b, z)` (the route
  SpecialFunctionsParabolicCylinder §1.5 names for separate holomorphy) (1.1);
- the bracket `F(a, b, z) = 𝐌(a, b, z)/Γ(a − b + 1) − z^{1−b} 𝐌(a − b + 1, 2 − b, z)/Γ(a)`
  vanishes at integer `b`, so that `π F / sin(πb)` has removable singularities there with value
  `(−1)ⁿ ∂_b F` (1.4);
- uniqueness for Kummer's equation on the slit plane given value and derivative at one point
  (1.3);
- agreement with QuantumFoundations §9.4: for `Re a > 0` and `Re z > 0`, `kummerU a b z` is the
  Laplace integral (`kummerU_eq_integral`), which defines §9.4's `U(a, b, z)` there; hence
  `kummerULog a b w` is §9.4's `U(a, b, e^w)` for all `a`, `b`, `w`, by the identity theorem in
  `w` and then in `a` (2.1);
- agreement with AutomorphicSpectralTheory §0.26: for `y > 0`, `whittakerM κ μ y` is its
  `M_{κ,μ}(y)`, the same series term for term; for `Re(½ + μ − κ) > 0` and `Re z > 0`,
  `whittakerW κ μ z` is the Laplace integral of 2.4 (`whittakerW_eq_integral`), which defines its
  `W_{κ,μ}(y)` at `z = y > 0`; hence the two `W` agree at every parameter to which §0.26 continues
  its `W`, by the identity theorem in `(κ, μ)` (2.4);
- the loop contours of 2.3 as explicit concatenations of segments, rays and circles, with the
  branch of each power fixed on each piece, and the deformation lemma that moves them (2.3);
- continuity of zeros in the parameters: for real solutions `w(λ, x)` jointly `C¹` in `(λ, x)`,
  with simple zeros, the number of zeros in `(0, X)` is locally constant in `λ` as long as no zero
  reaches `0` or `X`; and the counting form used for the zero counts of 9.1, in which the number
  of zeros in `(0, ∞)` changes only through a zero leaving at `0` or arriving from `∞` (9.1);
- for `b > 0` and `n ≥ 1`, `M(−n, b, ·)` (and `U(−n, b, ·) = (−1)ⁿ (b)ₙ M(−n, b, ·)`) has exactly
  `n` positive zeros, all simple: by DLMF 13.6.19 it is a nonzero multiple of `L_n^{(b−1)}`,
  which is orthogonal to every polynomial of lower degree for the weight `x^{b−1} e^{−x}` on
  `(0, ∞)` (LaguerreJacobi §2.3), so it changes sign at `n` points of `(0, ∞)` (9.1);
- the coefficients `A_n` of Buchholz's expansion and the polynomials `p_s^{(μ)}(z)` of the
  Whittaker analogue (6.3).

**What it does not own:**
- The general asymptotic and contour tools: asymptotic expansions, Watson's lemma, the rotation of
  Laplace integrals, the Mellin tools and the regular and rank-one irregular singularities. They
  are consumed from AsymptoticExpansions; see [Exact supplier contracts](#exact-supplier-contracts).
- The regularized Kummer function `𝐌` and the facts listed above as inputs.
- Tricomi's `U` as QuantumFoundations §9.4 constructs it, with the results of §9.4 listed above
  as inputs. This roadmap's `kummerULog` is identified with it in 2.1.
- The Whittaker functions on the positive axis as AutomorphicSpectralTheory §§0.26–0.28 construct
  them, with the results of §§0.26–0.28 listed above as inputs. This roadmap's `whittakerM` and
  `whittakerW` are identified with them in 2.4.
- The Laguerre polynomials `L_n^{(α)}` and their orthogonality, consumed from LaguerreJacobi, and
  DLMF 13.6.19, consumed from QuantumFoundations §9.4.
- Sturm comparison, consumed from SpecialFunctionsBessel.
- Weber's parabolic cylinder function `U(a, z)`, consumed from SpecialFunctionsParabolicCylinder.
- The incomplete Gamma functions, `E_p`, `E₁`, the auxiliary functions `f`, `g` of the sine and
  cosine integrals, `erf`, `erfc`, the repeated integrals `iⁿ erfc` and Pincherle's theorem,
  consumed from SpecialFunctionsEiLiErfIncompleteGamma.
- `Ai` and `Bi`, consumed from SpecialFunctionsAiry.
- `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` and their own formulas, among them 10.16.5 and 10.39.5,
  consumed from SpecialFunctionsBessel.
- The formulas through the Gauss function `₂F₁` at arguments outside its disk of convergence
  (DLMF 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9, 13.23.4), through the Charlier
  polynomials (13.6.20), and the non-terminating meaning of `₂F₀` in 13.6.21.
- The Coulomb functions and their relations to `M` and `U` (DLMF §13.6(vii), §13.18(vi), which
  consist of pointers to DLMF 33.2.3–33.2.8 and 33.14.4–33.14.7), owned by
  [QuantumFoundations §9.5](../QuantumFoundations/README.md#95-coulomb-wave-functions-and-the-hydrogen-atom).
- The large-parameter and uniform expansions (DLMF 13.8.2–13.8.18, §13.20 beyond 13.20.1, §13.21)
  and what rests on them (13.9.8, 13.9.10, 13.9.16, 13.22.1).
- The error bounds and exponentially improved expansions (DLMF 13.7.4–13.7.13), the asymptotics of
  the large complex zeros (13.9.9 and the `b`-zeros of `U`), the Whittaker transform pair
  13.23.13–13.23.14, applications and numerical computation.

See the last section for these.

**Ownership of `U`.** QuantumFoundations §9.4 owns Tricomi's `U` and the results listed above as
inputs. This roadmap owns the bracket form of `U`, its agreement with §9.4's `U` (2.1), and the
rest of the theory stated through `U`, among them the connection formula 13.2.41 on the rest of
`z ≠ 0` and the large-argument expansion 13.7.3 to every order.

**Ownership of the Whittaker functions.** AutomorphicSpectralTheory §§0.26–0.28 own `M_{κ,μ}(y)`
and `W_{κ,μ}(y)` for `y > 0` and the results listed above as inputs. This roadmap owns their
extension to the slit plane and the logarithmic plane, their agreement with
AutomorphicSpectralTheory (2.4), and the rest of the theory stated through them.

**The boundary in one sentence:** this roadmap owns the bracket form of `U` and its agreement with
the `U` of QuantumFoundations, `M_{κ,μ}` and `W_{κ,μ}` off the positive axis and their agreement
with those of AutomorphicSpectralTheory, and the theory of the confluent hypergeometric functions
stated through them, `𝐌` and functions that Mathlib, Tau Ceti or a consumed roadmap defines, on
the principal sheet and on the logarithmic plane, as listed in the layers, together with the
formulas that the roadmaps of the exponential-integral, error, incomplete Gamma, Airy, Bessel and
parabolic cylinder functions leave to it; it consumes the general methods of
AsymptoticExpansions, the basic `𝐌` theory of SpecialFunctionsParabolicCylinder, the basic `U`
theory of QuantumFoundations and the positive-axis Whittaker theory of AutomorphicSpectralTheory,
and excludes the large-parameter and uniform asymptotics, the Gauss function off its disk, the
Charlier and Coulomb functions, error bounds, transforms of Whittaker type and numerics.
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

  This is `Complex.kummerULog a b w`. `Γ⁻¹` is Mathlib's `(Complex.Gamma ·)⁻¹`, which is `0` at the
  poles, so `F` is entire in `(a, b, w)`. The integer case is selected by `∃ n : ℤ, (n : ℂ) = b`,
  `(−1)ⁿ` is written `cos(πb)`, and `∂_b` is `deriv` in `b` at fixed `a`, `w`. DLMF takes the limit
  at integer `b`; 1.4 proves that `F` vanishes there and that the two cases glue to an entire
  function, so the derivative form is that limit. The bracket form is Beals–Wong (6.3.2), p. 197,
  written with `N = Γ(a) 𝐌`, where the integer case is the limit by l'Hôpital's rule. The
  principal branch is
  `Complex.kummerU a b z = Complex.kummerULog a b (Complex.log z)`. QuantumFoundations §9.4
  constructs the same function from the Laplace integral 13.4.4 and continuation, and 2.1 proves
  that the two agree. When §9.4's `U` is in Tau Ceti under a Lean name, Tau Ceti uses it, and the
  bracket form becomes a theorem.
- **Whittaker functions.** With principal powers on the slit plane and `e^{(½+μ)w}` on the
  logarithmic plane:

```text
𝐌_{κ,μ}(z) = e^{−z/2} z^{½+μ} 𝐌(½ + μ − κ, 1 + 2μ, z)       (DLMF 13.14.2 divided by Γ(1 + 2μ))
M_{κ,μ}(z) = Γ(1 + 2μ) 𝐌_{κ,μ}(z)                           (DLMF 13.14.2)
W_{κ,μ}(z) = e^{−z/2} z^{½+μ} U(½ + μ − κ, 1 + 2μ, z)        (DLMF 13.14.3)
```

  The definitions are Lebedev (9.13.16), p. 274, and Andrews–Askey–Roy (4.3.2)–(4.3.3), p. 195,
  for `M_{κ,μ}`. These are `Complex.regularizedWhittakerM`, `Complex.whittakerM` and
  `Complex.whittakerW`; the
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
- **Asymptotic expansions** are those of AsymptoticExpansions (its Conventions), which
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
  `Im t = +ε`, with principal powers; it does not cross the negative real axis. 2.3 fixes the
  other loops and proves independence of `ε`. Mellin–Barnes integrals are along vertical lines
  `Re t = c`, with the separating contours of DLMF written as the line integral minus finitely
  many residues, as in SpecialFunctionsParabolicCylinder §6.7.
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`.
- **Zeros.** For real `a`, `b`, the number of positive zeros of `M(a, b, ·)` is
  `{x : ℝ | 0 < x ∧ 𝐌(a, b, x) = 0}.ncard`; zeros of `𝐌` and of `M` agree for
  `b ∉ {0, −1, −2, …}`. Zeros are simple (Layer 9), so counts without multiplicity are DLMF's.
- **Hermite polynomials.** DLMF's `H_n(x)` is written as `2^{n/2} He_n(√2 x)`, with Mathlib's
  probabilists' `Polynomial.hermite n` for `Heₙ`.
- **Other notations.** Temme, Olver and Beals–Wong write `c` for `b`, and Beals–Wong's
  `N(a, c; x)` is `Γ(a) 𝐌(a, c, x)`. Lebedev writes `Φ(α, γ; z)` for `M` and `Ψ(α, γ; z)` for `U`,
  and Magnus–Oberhettinger–Soni and Andrews–Askey–Roy write `₁F₁(a; c; z)` for `M`.
  Whittaker–Watson write `k, m` for `κ, μ`; their `Erfc x = ∫_x^∞ e^{−t²} dt` is `(√π/2) erfc x`,
  and their `K_n` of §17.71 carries an extra factor `cos nπ`. Buchholz writes the second Whittaker
  index as `μ/2` and works with `ℳ_{κ,μ/2} = M_{κ,μ/2}/Γ(1 + μ)` (Buchholz (2.7), p. 12), which is
  `𝐌_{κ,μ/2}` here.

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

The following are consumed with the hypotheses and conventions stated there.
- The expansion notion along a filter and an asymptotic scale
  ([its Conventions](../AsymptoticExpansions/README.md#conventions)), for Layer 5.
- Watson's lemma in a sector and the rotation of the path
  ([§4.2](../AsymptoticExpansions/README.md#42-watsons-lemma-in-a-sector),
  [§4.3](../AsymptoticExpansions/README.md#43-rotation-of-the-path)), applied in 5.1 to the
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
  uniqueness of solutions of Kummer's equation on the slit plane from initial data (1.3), the
  Frobenius solutions at `0` behind the logarithmic cases 13.2.9 and 13.2.27–13.2.32, and the
  recessive solution at `∞` that identifies `U` by 13.2.6 (6.1).

### From [SpecialFunctionsParabolicCylinder](../SpecialFunctionsParabolicCylinder/README.md)

- Layer 1 for `𝐌`: the derivative (13.3.15 regularized), Kummer's equation (13.2.1), Kummer's
  transformation (13.2.39), the holomorphy in `a` and in `b` and the polynomial
  cases ([§§1.1–1.6](../SpecialFunctionsParabolicCylinder/README.md#layer-1-the-regularized-kummer-function)),
  for Layers 1, 3 and 4.
- `TauCeti.parabolicCylinderU (a z : ℂ)` with Weber's equation and its values at `0`
  ([its Conventions](../SpecialFunctionsParabolicCylinder/README.md#conventions)), for
  13.6.12–13.6.15, 13.18.11–13.18.13 and 12.7.14.

### From [QuantumFoundations](../QuantumFoundations/README.md)

- Tricomi's `U(a, b, z)` of
  [§9.4](../QuantumFoundations/README.md#94-kummer-and-tricomi-functions) with the results listed
  as inputs under [Scope and ownership](#scope-and-ownership): the Laplace integral 13.4.4 that
  defines it for `Re a > 0`, `Re z > 0`, its continuation to the logarithmic plane, entire in `a`
  and `b`, 13.3.7, 13.2.34, 13.2.41, 13.2.9–13.2.11 and `U ∼ z^{−a}` in `|ph z| ≤ 3π/2 − δ` with
  its derivatives, for 2.1 (the agreement) and, through it, 1.5, 3.1–3.3, 4.1 and 5.1. §9.4 gives
  `U` no Lean name, so the agreement is stated through 13.4.4, its defining formula.
- The Laguerre comparison 13.6.19 for `α + 1 ∉ {0, −1, …}`, for 6.4 and 9.1.

### From [AutomorphicSpectralTheory](../AutomorphicSpectralTheory/README.md)

- `M_{μ,ν}(y)` and `W_{μ,ν}(y)` for `y > 0`, in its notation `(μ, ν)` for DLMF's `(κ, μ)`
  ([its §0.26](../AutomorphicSpectralTheory/README.md#026-whittaker-m-and-w-functions)): `M` by
  the series 13.14.2 and its Euler integral 13.16.1, `W` defined by the Euler integral 13.16.5 for
  `Re(½ + μ − κ) > 0` and continued, Whittaker's equation 13.14.1 and the symmetry 13.14.31; the
  Bessel comparisons 13.18.8–13.18.9
  ([its §0.27](../AutomorphicSpectralTheory/README.md#027-whittakerbessel-comparison)); and the
  leading behaviour 13.14.14 at `0` and 13.14.20–13.14.21 at `∞`
  ([its §0.28](../AutomorphicSpectralTheory/README.md#028-whittaker-differential-and-asymptotic-api)),
  for 2.4 (the agreement) and, through it, the positive-axis cases of 1.6, 3.4, 6.2 and 5.1–5.2.
  §0.26 gives the functions no Lean name, so the agreement for `W` is stated through 13.16.5, its
  defining formula.

### From [LaguerreJacobi](../LaguerreJacobi/README.md)

- The Laguerre polynomials `L_n^{(α)}` (§1.1) and their orthogonality for `−1 < α` (§2.3), for
  13.18.17 in 6.4 and the zeros of the polynomials `M(−n, b, ·)` in 9.1.

### From [SpecialFunctionsEiLiErfIncompleteGamma](../SpecialFunctionsEiLiErfIncompleteGamma/README.md)

- Pincherle's theorem and its continued-fraction and minimal-solution conventions
  ([§4.1](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#41-pincherles-theorem)), for 4.3.
- The complex incomplete Gamma functions `γ(a, z)` and `Γ(a, z)`, with the logarithmic-plane form
  of `Γ(a, z)`, the generalized exponential integral `E_p`, `erf`, `erfc`, the repeated integrals
  `iⁿ erfc` and the auxiliary functions `f`, `g` of the sine and cosine integrals
  ([its Conventions](../SpecialFunctionsEiLiErfIncompleteGamma/README.md#conventions)), for
  13.6.5–13.6.8, 13.18.4–13.18.7 and the formulas of Chapters 6–8 in 6.1.

### From [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md)

- `Ai` and `Bi` with Airy's equation and their values at `0`, for 13.6.11,
  13.18.10 and 9.6.21–9.6.24.

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν` and `K_ν`
  ([its Conventions](../SpecialFunctionsBessel/README.md#conventions)), with
  their equations, holomorphy in `z` and `ν`, connection formulas and recurrences
  ([its Layer 1](../SpecialFunctionsBessel/README.md#layer-1-the-equations-and-their-standard-solutions)),
  the Kummer form 10.39.5 of `I_ν` (its 8.1) and the integral 10.32.9 of `K_ν` (its 5.1), for
  13.4.3, 13.4.7, 13.6.9–13.6.11_2, 13.10.8–13.10.9, 13.10.13–13.10.16, 13.11.1–13.11.3,
  13.16.3–13.16.4, 13.16.8, 13.18.8–13.18.9, 13.23.6–13.23.12, 13.24.1–13.24.2 and the Bessel
  relations of 6.2.
- Sturm comparison, an auxiliary target of
  [its 10.1](../SpecialFunctionsBessel/README.md#101-existence-reality-and-simplicity-of-the-zeros),
  for the zero counts of 9.1.

### From Tau Ceti

- **Regularized hypergeometric series.**
  [`Complex.hasSum_regularizedHGFun`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean),
  the `HasSum` form of `𝐌`, and `Complex.regularizedHGFunCoeff_zero_singleton`.
- **Real error function and lower incomplete Gamma function.** `TauCeti.Real.erf`,
  `TauCeti.Real.erfc` (`TauCeti/Analysis/SpecialFunctions/Erf.lean`) and
  `TauCeti.lowerIncompleteGamma` (`TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`), the
  real restrictions of the functions of SpecialFunctionsEiLiErfIncompleteGamma, for the real forms
  of 13.6.6 and 13.6.8 in 6.1.
- **Residues.** The residue and the residue theorem
  (`TauCeti/Analysis/Contour/Residue/`, from ContourIntegration), for the separating contours of
  2.2 and 2.4.

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
  values of 13.14.6 and 13.23.1.
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
  Fubini, parametric differentiation and `mellin`.
- **Continued fractions.** `GenContFract`, `GenContFract.convs` and `Stream'.Seq.ofStream`.
- **Asymptotics.** `Asymptotics.IsBigO`, `Asymptotics.IsEquivalent`, `Bornology.cobounded`,
  `Complex.arg`, `Complex.log` and `Complex.cpow`.

## How to read the build

Layer 1 rests on two facts: `𝐌` is entire in all three variables jointly (1.1), and the bracket
`F` vanishes at integer `b` by DLMF 13.2.5, so that `U` is entire in `a`, `b` and in the
logarithmic coordinate `w` (1.4). The confluence of Gauss's function (1.2) places `𝐌` as a limit
of the hypergeometric function, and the singularity structure of Kummer's equation (1.3) fixes
what the two standard solutions are: the solution regular at `0` and the solution recessive at
`+∞`. Kummer's equation for `U` follows from that of `𝐌` and of
`z^{1−b} 𝐌(a − b + 1, 2 − b, z)` and from continuity in `b` at the integers; Whittaker's equation
is Kummer's after removing the first-derivative term (1.6). Layer 2 proves each integral
representation by showing that the integral solves Kummer's equation with the right behaviour at
`0` or `∞`, or by termwise integration of the series; its first result, the Laplace integral
of `U`, identifies this `U` with that of QuantumFoundations §9.4, so that §9.4's results hold for
it, and 2.4 identifies the Whittaker functions with those of AutomorphicSpectralTheory. Every
identity between solutions in Layers 1–4 and 6 is then checked on series coefficients at `0`, by
comparing Wronskians, or for non-integer `b` and extended to integer `b` by continuity in `b`.
Layer 3 is the local theory at the origin and the connection problem between `0` and `∞`.
Layer 4 is the three-term recurrences, and Pincherle's theorem turns them into continued
fractions. Layer 5 expands the Laplace form of `U` by Watson's lemma, rotates the path, and
transfers the result to `𝐌` by the connection formula of 3.3. Layer 6 reads off the classical
functions, family by family, including the formulas other roadmaps leave here, and the
expansions in Bessel functions. Layers 7 and 8 apply Layers 1–6: the quadratic relations and the
addition theorems, then the integral transforms. Layer 9 counts real zeros by Sturm comparison
(from SpecialFunctionsBessel) on the self-adjoint form of Kummer's equation and continuity in
the parameters, with the asymptotics of Layer 5 controlling the ends. The `**Checks.**` and
`### Examples` of each layer are statements to prove; they test the conventions on explicit
values.

## Layer 1: Kummer's equation and its standard solutions

### 1.1 The regularized solution as a function of three variables

- `(a, b, z) ↦ 𝐌(a, b, z)` is holomorphic on `ℂ × ℂ × ℂ` (`differentiable_regularizedHGFun_prod`):
  each term `(a)ₙ zⁿ/(n! Γ(b + n))` of the series is jointly entire, by Mathlib's
  `Complex.differentiable_one_div_Gamma`, and the series converges locally uniformly in
  `(a, b, z)`. Olver (§9.2, p. 255) and Lebedev (§9.9, p. 261) state holomorphy in each parameter
  separately.
- At a nonpositive integer denominator parameter,
  `𝐌(a, −n, z) = (a)_{n+1} z^{n+1} 𝐌(a + n + 1, n + 2, z)` for every `a`
  (`regularizedHGFun_neg_nat`; DLMF 13.2.5; Beals–Wong (6.3.1), p. 196, in the normalization
  `Γ(a) 𝐌`); the limit form of DLMF on the left is the continuity of `𝐌` in `b`.

**Checks.**
- At `n = 0`: `𝐌(a, 0, z) = a z 𝐌(a + 1, 2, z)`; at `a = 1` both sides are `z e^z`, since
  `𝐌(2, 2, z) = e^z` and `𝐌(1, 0, z) = ∑_{k≥1} zᵏ/(k − 1)!`.
- At `a = 0`: both sides vanish, since `(0)_{n+1} = 0` and `𝐌(0, −n, z) = Γ(−n)⁻¹ = 0`.
- Without the factor `z^{n+1}`, the case `n = 0`, `a = 1` would read `z e^z = e^z`, which fails
  at `z = 2`.

*Needs:* Mathlib `Complex.differentiable_one_div_Gamma`,
`Complex.regularizedHGFunCoeff_eq_zero_right`; SpecialFunctionsParabolicCylinder §1.5.

### 1.2 Confluence of Gauss's function

For every `a`, `c`, `z`, as the real parameter `t → ∞`,
`𝐅(a, t; c; z/t) → 𝐌(a, c, z)`, where `𝐅 = ₂F₁/Γ(c)` is Mathlib's `regularizedGaussHGFun`
(`tendsto_regularizedGaussHGFun_div_atTop`); the convergence is locally uniform in `z`. For
`t > |z|` the argument lies in the unit disk, where the Gauss series converges, and the termwise
limit `(t)_n/tⁿ → 1` passes through the sum by dominated convergence (Kristensson §7.1, p. 124;
Temme (7.2), p. 172; Lebedev (9.9.3), p. 261). The confluence of the equations is the same limit:
Gauss's equation in `z/t` tends to Kummer's equation, and the regular singular points at `t` and
`∞` merge into an irregular singular point at `∞` (Kristensson §7.1, p. 124; Andrews–Askey–Roy
§4.1, p. 188).

**Checks.**
- At `a = c`, `𝐅(a, t; a; z/t) = Γ(a)⁻¹ (1 − z/t)^{−t} → Γ(a)⁻¹ e^z = 𝐌(a, a, z)`.
- At `(a, c, z) = (0.3 + 0.2i, 1.4 − 0.5i, 1.1 + 0.7i)` the left side is
  `1.15645 25707… + 0.46921 31558… i` at `t = 10⁴`, and the limit is
  `1.15647 92043… + 0.46921 15004… i`.
- With the argument scaled as `z/t²` instead of `z/t`, the limit is the constant `Γ(c)⁻¹`, not
  `𝐌(a, c, z)`.

*Needs:* 1.1; Mathlib `Complex.regularizedGaussHGFun`,
`Complex.radius_regularizedGaussHGFunSeries_ge_one`.

### 1.3 The solution space

Kummer's equation has a regular singular point at `0`, with exponents `0` and `1 − b`, and an
irregular singular point of rank one at `∞` (Kristensson §7.1, p. 124; Olver §9.1, p. 254;
DLMF 13.2.1). Two solutions of 13.2.1 on the slit plane with the same value and derivative at one
point are equal, and every solution is `c₁ 𝐌(a, b, ·) + c₂ U(a, b, ·)` when
`a ∉ {0, −1, −2, …}` and `c₁ 𝐌(a, b, ·) + c₂ z^{1−b} 𝐌(a − b + 1, 2 − b, ·)` when `b ∉ ℤ`
(Temme (7.6) and (7.10), pp. 173–174; Kristensson (7.2), p. 125; Beals–Wong (6.1.6), p. 191;
Lebedev (9.10.2) and (9.10.11), pp. 263 and 265). The bases are those whose Wronskians (3.2) do
not vanish.

*Needs:* 1.1, 1.4; AsymptoticExpansions §10.2.

### 1.4 Tricomi's function

`kummerULog` and `kummerU` as pinned in Conventions (DLMF 13.2.42; Lebedev (9.10.3)–(9.10.4),
p. 263; Beals–Wong (6.2.6), p. 195, and (6.3.2), p. 197; Temme (7.14), p. 176, in the form with
`Γ(1 − b)` and `Γ(b − 1)`; Andrews–Askey–Roy, Thm. 4.2.4, p. 194). The targets:
- the bracket `F(a, b, w)` (`kummerUBracket`) vanishes at `b = n ∈ ℤ` for all `a`, `w`
  (`kummerUBracket_intCast`): for `n ≥ 2` by 13.2.5 (1.1) for `𝐌(a − n + 1, 2 − n, ·)`, with
  `e^{(1−n)w} e^{(n−1)w} = 1`; for `n ≤ 0` by 13.2.5 for `𝐌(a, n, ·)`; and at `n = 1` the two
  terms coincide;
- `(a, b, w) ↦ kummerULog a b w` is holomorphic on `ℂ × ℂ × ℂ` (`differentiable_kummerULog`),
  and the integer case is the limit of the non-integer case (`tendsto_kummerULog_intCast`;
  Lebedev (9.10.5), p. 264; Beals–Wong, p. 197);
- `kummerU a b` is holomorphic on the slit plane (`analyticOnNhd_kummerU`);
- `U` solves Kummer's equation 13.2.1 on the slit plane (`kummerU_kummer_equation`), and
  `w ↦ kummerULog a b w` solves the same equation transported to `z = e^w`, which is
  `u″ − (1 − b + e^w) u′ − a e^w u = 0` for `u(w) = U(a, b, e^w)`;
- for real `a`, `b` and `x > 0`, `U(a, b, x)` is real, and `U(ā, b̄, z̄) = conj U(a, b, z)` on the
  slit plane.

The proof of the equation for non-integer `b` is the equation for the two terms of `F`; at integer
`b` it follows by continuity in `b`, since the `z`-derivatives of a function holomorphic in
`(b, z)` are continuous in `b`; the joint holomorphy of `𝐌` (1.1) is what makes `F` holomorphic in
`(b, z)`. The agreement with the `U` of QuantumFoundations §9.4 is in 2.1.

**Checks of the bracket.**
- `F(a, 1, w) = 𝐌(a, 1, e^w)/Γ(a) − 𝐌(a, 1, e^w)/Γ(a) = 0`.
- `F(a, 3, w) = 0`: by 13.2.5 at `n = 1`, `𝐌(a − 2, −1, z) = (a − 2)(a − 1) z² 𝐌(a, 3, z)`, and
  `(a − 2)(a − 1)/Γ(a) = 1/Γ(a − 2)`.
- `(π/sin πb) F(0, b, w) = 1` for `b ∉ ℤ`, which is `U(0, b, z) = 1` (13.6.3): the second term of
  `F` has the factor `1/Γ(0) = 0`, and `𝐌(0, b, z) = 1/Γ(b)`. At `b = 0.37`, `w = 0.4 + 1.1i` and
  at `b = 1.6 − 0.3i`, `w = −0.7 + 3i` the value is `1.00000 00000`. Swapping the factors
  `1/Γ(a − b + 1)` and `1/Γ(a)` breaks it.

**Checks of `U`.**
- `U(1, 1, 1) = e E₁(1) = 0.59634 73623…` (13.6.6 at `a = 1`).
- `U(½, ½, 1) = √π e erfc(1) = 0.75787 21561…` (13.6.8).
- `U(0.3, 2, 1.7) = 0.94985 30204…`, `U(1.2, 0, 0.8) = 0.35740 93372…` and
  `U(0.7, −1, 2.5) = 0.33229 69198…` from the derivative form; without the factor `(−1)ⁿ` the
  values at `b = −1` would have the opposite sign, which is not the limit of 13.2.42.

*Needs:* 1.1; SpecialFunctionsParabolicCylinder §§1.3, 1.5; Mathlib
`Complex.Gamma_neg_nat_eq_zero`, `Complex.differentiable_one_div_Gamma` and
`Complex.differentiableOn_update_limUnder_of_bddAbove`.

### 1.5 Polynomial cases and continuation across the sheets

With DLMF's hypotheses:
- `U(−m, b, z) = (−1)^m (b)_m M(−m, b, z) = (−1)^m ∑_{s≤m} C(m, s) (b + s)_{m−s} (−z)^s`, the
  middle form for `b ∉ {0, −1, …}` and the sum for every `b` (`kummerU_neg_nat`; DLMF 13.2.7;
  Lebedev (9.10.7), p. 264, for `b ∈ {1, 2, …}`);
- for `a − b + 1 = −n`, the sum `U(a, b, z) = z^{−a} ∑_{s≤n} C(n, s) (a)_s z^{−s}` for every `a`,
  and the middle form of DLMF 13.2.8 where `1 − a − n ∉ {0, −1, …}`;
- the continuation in logarithmic coordinates (DLMF 13.2.12): for `m ∈ ℤ` and every `w`,

```text
U(a, b, e^{w + 2mπi}) = (2πi e^{−πibm} sin(πbm) / (Γ(1 + a − b) sin πb)) 𝐌(a, b, e^w)
                         + e^{−2πibm} U(a, b, e^w)
```

  for `b ∉ ℤ` (`kummerULog_add_two_pi_mul_I`). At `b = n ∈ ℤ` the coefficient of `𝐌` is its limit
  `2πi m (−1)ⁿ/Γ(1 + a − n)` (`kummerULog_intCast_add_two_pi_mul_I`), since
  `sin(πbm)/sin(πb) → m (−1)^{n(m−1)}`, and `e^{−2πinm} = 1`. On the slit plane `kummerU` is the
  branch `m = 0`. The proof: `𝐌(a, b, e^w)` is `2πi`-periodic in `w` and `e^{(1−b)w}` gains
  `e^{−2πibm}`; the integer case follows by continuity in `b`.

The integer-`b` forms DLMF 13.2.9–13.2.11 (the logarithmic series for `b = n + 1`, its polynomial
case `a = −m`, and `U(a, −n, z) = z^{n+1} U(a + n + 1, n + 2, z)`; Lebedev (9.10.6) and (9.10.9),
pp. 264–265; Beals–Wong (6.3.3), p. 197) are inputs from QuantumFoundations §9.4, through 2.1.

**Checks.**
- At `a = 0.3`, `b = 0.45`, `z = 1.1 + 0.7i` and `m = 1`, both sides of 13.2.12 equal
  `3.93639 68583… + 4.03737 00133… i`.
- At `a = 0.3`, `b = 2`, `z = 1.1 + 0.7i` and `m = 1`, both sides of the integer form equal
  `1.26581 13703… − 1.98384 14489… i`; with `(−1)ⁿ` omitted they would differ at `b = −1`.
- `U(−1, b, z) = z − b` by 13.2.7; reading the sum with `(b)_{m−s}` in place of `(b + s)_{m−s}`
  gives the same at `m = 1` but `z² − 2bz + b(b + 1)` instead of
  `z² − 2(b + 1)z + b(b + 1)` at `m = 2`.

*Needs:* 1.4.

### 1.6 Whittaker's normal form

`regularizedWhittakerM`, `whittakerM`, `whittakerW` and their logarithmic versions as pinned.
Removing the first-derivative term of Kummer's equation by `W = e^{−z/2} z^{½+μ} w`, with
`κ = ½b − a`, `μ = ½b − ½`, gives Whittaker's equation (Olver §11.1, p. 260; Temme (7.18),
p. 178; Beals–Wong (6.7.1), p. 206; Andrews–Askey–Roy (4.3.1), p. 195; Kristensson, Problem 7.4,
p. 138). The targets (DLMF 13.14.1–13.14.13):
- `M_{κ,μ}` (for `2μ ∉ {−1, −2, …}`), `𝐌_{κ,μ}` and `W_{κ,μ}` solve Whittaker's equation
  on the slit plane (`whittakerW_equation`; DLMF 13.14.1); the definitions (DLMF 13.14.2–13.14.3;
  Olver (11.02)–(11.03), p. 260; Temme (7.17), p. 178; Beals–Wong (6.7.2) and (6.7.5),
  pp. 206–207; Lebedev (9.13.16), p. 274) and the inverse relations DLMF 13.14.4–13.14.5;
- the series DLMF 13.14.6, including the terminating Gauss form with Mathlib's
  `regularizedGaussHGFun (−n) (½ + μ − κ) (1 + 2μ) 2` times `Γ(1 + 2μ)`;
- `𝐌_{κ,μ}` at `2μ = −n − 1` equals `((−½n − κ)_{n+1}/(n + 1)!) M_{κ,(n+1)/2}` (DLMF 13.14.7),
  the limit of `M_{κ,μ}/Γ(2μ + 1)` being the value of the entire function `𝐌_{κ,μ}`;
- `W_{κ,±n/2}` by the logarithmic series and in the polynomial case (DLMF 13.14.8–13.14.9);
- the continuation in logarithmic coordinates (DLMF 13.14.10–13.14.13; for `M_{κ,μ}`,
  Andrews–Askey–Roy (4.3.4), p. 195); 13.14.10 and 13.14.11 for `𝐌_{κ,μ}` follow from
  `e^{(½+μ)(w ± πi)}` and Kummer's transformation;
- `(κ, μ, w) ↦ regularizedWhittakerMLog κ μ w` and `whittakerWLog κ μ w` are entire, as DLMF
  states after 13.14.13 (`differentiable_regularizedWhittakerMLog`).

**Checks.**
- `W_{0,1/2}(2) = e^{−1} = 0.36787 94412…` (6.1, through `U(1, 2, z) = z^{−1}`), while the
  swapped `W_{1/2,0}(2) = √2 e^{−1} = 0.52026 00950…`.
- At `z = 0.6 + 0.3i`, both `M_{0,1/2}(2z)` and `2 sinh z` equal
  `1.21643 67959… + 0.70065 78526… i` (6.1).
- 13.14.10 at `κ = 0`, `μ = ½`, upper sign:
  `M_{0,1/2}(z e^{πi}) = i e^{πi/2} M_{0,1/2}(z) = −M_{0,1/2}(z)`, consistent with
  `M_{0,1/2}(2z) = 2 sinh z` and `sinh(−z) = −sinh z`.

*Needs:* 1.1, 1.4, 1.5; SpecialFunctionsParabolicCylinder §1.4; AutomorphicSpectralTheory §0.26
(Whittaker's equation at `y > 0`).

### Examples

- `U(a, a + 1, z) = z^{−a}` is the second polynomial case at `n = 0` (DLMF 13.6.4).
- DLMF 13.2.11 at `n = 0`: `U(a, 0, z) = z U(a + 1, 2, z)`.
- 1.2 at `a = −1`: `𝐅(−1, t; c; z/t) = Γ(c)⁻¹ − z/Γ(c + 1)` for every `t ≠ 0`, which is
  `𝐌(−1, c, z)` already before the limit.

### Dependencies

SpecialFunctionsParabolicCylinder Layer 1; AsymptoticExpansions §10.2;
AutomorphicSpectralTheory §0.26.

## Layer 2: the functions as integrals

### 2.1 Euler and Laplace integrals on the real line

With DLMF's hypotheses:
- Euler's integral `𝐌(a, b, z) = Γ(a)⁻¹ Γ(b − a)⁻¹ ∫₀¹ e^{zt} t^{a−1} (1 − t)^{b−a−1} dt` for
  `Re b > Re a > 0` and every `z` (`regularizedHGFun_eq_integral`; DLMF 13.4.1; Temme (7.7),
  p. 173; Olver (9.07), p. 255; Beals–Wong (6.1.3), p. 190; Lebedev (9.11.1), p. 266;
  Kristensson, Thm. 7.1, p. 126), and its companion DLMF 13.4.2 for `Re b > Re c > 0`
  (Lebedev, Ch. 9, Problem 14, p. 278);
- DLMF 13.4.3 for `Re a > 0` and `z ≠ 0`, through `Complex.besselJ (b − 1) (2√(zt))`
  (Lebedev, Ch. 9, Problem 12, p. 278, after Kummer's transformation);
- the Laplace integral `U(a, b, z) = Γ(a)⁻¹ ∫₀^∞ e^{−zt} t^{a−1} (1 + t)^{b−a−1} dt` for
  `Re a > 0` and `|ph z| < π/2` (`kummerU_eq_integral`; DLMF 13.4.4; Olver (10.04), p. 257;
  Temme (7.12), p. 175; Beals–Wong (6.2.1), p. 194; Lebedev (9.11.6), p. 268;
  Andrews–Askey–Roy (4.1.6), p. 189). This is the defining formula of the `U` of
  QuantumFoundations §9.4, so it is the agreement of the two functions there; both are
  holomorphic in `w = log z` on the logarithmic plane and entire in `a`, so the identity theorem
  in `w` and then in `a` makes `kummerULog` equal to §9.4's `U` everywhere (auxiliary);
- DLMF 13.4.5 for `|ph z| < π` and `Re a > max(Re b − 1, 0)`; 13.4.6 for `n : ℕ` with
  `−Re b < n < 1 + Re(a − b)`;
- DLMF 13.4.7 through SpecialFunctionsBessel's `K_{b−1}`, for `Re a > max(Re b − 1, 0)` and
  `z ∈ slitPlane` (Lebedev, Ch. 9, Problem 13, p. 278).

Euler's integral is proved by expanding `e^{zt}` and Mathlib's `Complex.betaIntegral`, or as the
confluent limit (1.2) of Euler's integral for `₂F₁` (Kristensson, p. 126). The Laplace integral is
proved for `b ∉ ℤ` with `Re b < 1` and extended by holomorphy in `b`. The integral solves 13.2.1, so
by 1.3 it is `c₁ 𝐌(a, b, z) + c₂ z^{1−b} 𝐌(a − b + 1, 2 − b, z)`. Its value
`Γ(1 − b)/Γ(a − b + 1)` at `0⁺` fixes `c₁`. It is `O(x^{−Re a})` as `x → +∞`, while
`𝐌(a, b, x) ∼ e^x x^{a−b}/Γ(a)` by Euler's integral and Watson's lemma, which fixes `c₂`. The two
coefficients are those of the bracket (Lebedev §9.11, pp. 266–268, follows this route).

**Checks.**
- At `a = 1`, `b = 1`: `U(1, 1, z) = ∫₀^∞ e^{−zt} (1 + t)^{−1} dt = e^z E₁(z)` for `Re z > 0`.
- At `a = 1`, `b = 2`: `𝐌(1, 2, z) = ∫₀^1 e^{zt} dt = (e^z − 1)/z`.
- At `(a, b, z) = (1.8 + 0.3i, 1.7 − 0.4i, 0.9 + 0.6i)` the bracket and the Laplace integral both
  give `U = 0.07665 72537… − 0.37313 40518… i`; with `(1 + t)^{b−a−1}` replaced by
  `(1 − t)^{b−a−1}` the integral diverges at `t = 1` for `Re(b − a) < 0`.

*Needs:* 1.1–1.4; Mathlib `Complex.betaIntegral`; AsymptoticExpansions §4.2; SpecialFunctionsBessel;
QuantumFoundations §9.4.

### 2.2 Barnes's integrals along vertical lines

DLMF 13.4.16–13.4.18: 13.4.16 for `|ph z| < π/2` and `a ∉ {0, −1, …}`
(`regularizedHGFun_neg_eq_barnes_integral`; Kristensson, Thm. 7.2, p. 127; Andrews–Askey–Roy,
Thm. 4.2.1, p. 193; Lebedev, Ch. 9, Problem 11, p. 278; Olver, Ch. 8, Ex. 6.1, p. 302), 13.4.17 for
`|ph z| < 3π/2` in logarithmic coordinates and `a, a − b + 1 ∉ {0, −1, …}` (Temme, Ex. 7.8,
pp. 189–190; Andrews–Askey–Roy (4.2.3) and Thm. 4.2.4, pp. 193–194), and 13.4.18 for
`|ph z| < π/2`. Each is stated on a vertical line `Re t = c` that separates the poles when such a
line exists, and in general as the line integral minus finitely many residues. The integral of
13.4.16 is the Mellin inversion of the Mellin transform of 8.1 (Andrews–Askey–Roy, p. 192).

*Needs:* 2.1; AsymptoticExpansions §§8.1–8.2, 8.6; the residue theorem of Tau Ceti.

### 2.3 Loop integrals

DLMF 13.4.9–13.4.11 and 13.4.13–13.4.14, with the contours fixed as follows (`0 < ε < ½`):
- 13.4.9, `∫₀^{(1+)}` for `Re a > 0` and `b − a ∉ {1, 2, …}`: the segment `[0, 1 − ε]` with
  `ph(t − 1) = −π`, the circle `|t − 1| = ε` positively from `ph(t − 1) = −π` to `π`, and the
  segment back with `ph(t − 1) = π` (Temme, Ex. 4.7, pp. 105–106);
- 13.4.10, `∫₁^{(0+)}` for `Re(b − a) > 0` and `a ∉ {1, 2, …}`: the segment `[ε, 1]` from `1` to
  `ε` with `ph t = 0`, the circle `|t| = ε` positively from `ph t = 0` to `2π`, and the segment
  back with `ph t = 2π`, with `ph(1 − t) = 0` throughout; the loop then contributes
  `(e^{2πia} − 1) ∫₀¹` for `Re a > 0`, and DLMF's prefactor `e^{−aπi} Γ(1 − a)/(2πi Γ(b − a))`
  returns Euler's integral;
- 13.4.11, the Pochhammer loop `∫_α^{(0+, 1+, 0−, 1−)}` for `a, b − a ∉ {1, 2, …}`, from `α = ½`:
  four circles about `0` and `1` joined by the segment `[ε, 1 − ε]`, with the phases of `t` and
  `1 − t` continued along the path from their principal values at `α`, as in DLMF Figure 13.4.1
  (Olver, Ex. 9.4, p. 256);
- 13.4.13, `∫_{−∞}^{(0+, 1+)}` for `|ph z| < π/2`: the lines `Im t = −ε` from `−∞` to `1`, the
  right half of the circle `|t − 1| = ε`, and the line `Im t = ε` back, with `t^{−b}` and
  `(1 − 1/t)^{−a}` principal (Beals–Wong, Ex. 6.3, p. 209);
- 13.4.14, `∫_∞^{(0+)}` for `a ∉ {1, 2, …}` and `|ph z| < π/2`: the lines `Im t = ±ε` from `+∞`,
  joined by the left half of the circle `|t| = ε`, with `ph t ∈ (0, 2π)` and `ph(1 + t) = 0` where
  the path crosses `(−1, 0)` (Andrews–Askey–Roy (4.1.10), p. 191).

Each value is independent of `ε` by Cauchy's theorem, and each formula reduces to 2.1 when the
real-line integral converges, by shrinking the circles; the general case follows by holomorphy in
the parameters.

*Needs:* 2.1; Mathlib `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`.

### 2.4 Whittaker functions

DLMF 13.16.1–13.16.8 and 13.16.10–13.16.12 with DLMF's hypotheses: the real-line integrals
13.16.1–13.16.8, including the Bessel kernels `J_{2μ}`, `I_{2μ}`, `K_{2μ}` of 13.16.3–13.16.4 and
13.16.8 and the Stieltjes forms 13.16.6–13.16.7, and the Mellin–Barnes integrals
13.16.10–13.16.12, 13.16.11 for `|ph z| < 3π/2` in logarithmic coordinates. They follow from 2.1
and 2.2 by the definitions of 1.6. Their cases at `z = y > 0` that AutomorphicSpectralTheory
§0.26 proves are inputs.

The agreement with AutomorphicSpectralTheory (auxiliary): for `Re(½ + μ − κ) > 0` and `Re z > 0`,

```text
W_{κ,μ}(z) = e^{−z/2} z^{½+μ} Γ(½ + μ − κ)⁻¹ ∫₀^∞ e^{−zt} t^{μ−κ−½} (1 + t)^{μ+κ−½} dt
```

(`whittakerW_eq_integral`; DLMF 13.16.5; Andrews–Askey–Roy (4.4.3), p. 197, and Lebedev, Ch. 9,
Problem 17, p. 279, in the form after `t ↦ t/z`), which is the Laplace integral of 2.1
(`kummerU_eq_integral`) at `a = ½ + μ − κ`, `b = 1 + 2μ`. At `z = y > 0`, after `t ↦ t − 1`, the
right side is the integral by which §0.26 defines its `W_{κ,μ}(y)`, so `whittakerW κ μ y` is
§0.26's `W_{κ,μ}(y)` there, and at every parameter to which §0.26 continues it, by the identity
theorem in `(κ, μ)`. §0.26's `M_{κ,μ}(y)` is `whittakerM κ μ y` term for term.

**Checks.**
- At `κ = 0`, `μ = ½`: `W_{0,1/2}(z) = e^{−z/2} z Γ(1)⁻¹ ∫₀^∞ e^{−zt} dt = e^{−z/2}`, and
  §0.26's Check `W_{0,1/2}(y) = e^{−y/2}`.
- At `κ = 0`, `μ = ½`, `z = 2`: `W_{0,1/2}(2) = e^{−1} = 0.36787 94412…`, the Check of 1.6.
- At `(κ, μ, z) = (−1.4, 0.35, 1.1 + 0.7i)` the definition and the integral both give
  `0.08867 32829… − 0.07859 81842… i`.
- AutomorphicSpectralTheory's `M_{μ,ν}` with `(μ, ν) = (0, ½)` is `M_{0,1/2}(y) = 2 sinh(y/2)`,
  which is `whittakerM 0 (1/2)` (6.1); reading its `(μ, ν)` as DLMF's `(μ, κ)` instead gives
  `M_{1/2,0}`, which is not `2 sinh(y/2)`.

*Needs:* 1.6, 2.1–2.2; AutomorphicSpectralTheory §0.26.

### Examples

- The Laplace integral of 2.4 at `κ = 0`, `μ = ν`, with `K_ν(z) = (π/(2z))^{1/2} W_{0,ν}(2z)`
  (6.2), is DLMF 10.32.8:
  `K_ν(z) = √π (z/2)^ν Γ(ν + ½)⁻¹ ∫₁^∞ e^{−zt} (t² − 1)^{ν−½} dt` for `Re ν > −½`, `|ph z| < π/2`.
- Euler's integral at `a = 1`, `b = 2` with `z` replaced by `2z` is
  `𝐌(1, 2, 2z) = e^z sinh(z)/z` (DLMF 13.6.2).

### Dependencies

Layer 1; SpecialFunctionsBessel; AsymptoticExpansions Layers 4 and 8; QuantumFoundations §9.4;
AutomorphicSpectralTheory §0.26.

## Layer 3: local theory at the origin and its connection to infinity

### 3.1 Behaviour at the origin

DLMF 13.2.13–13.2.22 along `𝓝[slitPlane] 0`, each with DLMF's case distinction: 13.2.14–13.2.15
when `a = −n` or `a = −n + b − 1`, and 13.2.16–13.2.22 in all other cases, split by `Re b`
(Magnus–Oberhettinger–Soni §6.8.1, p. 288). The `O`-terms are `Asymptotics.IsBigO` along
`𝓝[≠] 0 ⊓ 𝓟 slitPlane`; 13.2.17, 13.2.19 and 13.2.21 contain `ln z`. For example,
`U(a, b, z) → Γ(1 − b)/Γ(a − b + 1)` for `Re b < 1` (`tendsto_kummerU_nhdsWithin_zero`;
DLMF 13.2.20–13.2.22; Olver §10.4, p. 258, and Beals–Wong, pp. 194–195, for `Re a > 0`); at
`b = 0` the limit is `1/Γ(a + 1)` (13.2.21). The proof is the bracket of 1.4 for `b ∉ ℤ` and the
logarithmic series 13.2.9 (an input, through 2.1) at integer `b`.

**Checks.**
- 13.2.19 at `a = 1`: `U(1, 1, z) = e^z E₁(z) = −ln z − γ + O(z ln z)`, since `ψ(1) = −γ`.
- At `a = 0` the limit is `Γ(1 − b)/Γ(1 − b) = 1`, which is `U(0, b, z) = 1`.
- With the two Gamma factors exchanged, the limit at `a = 1`, `b = ½` would be
  `Γ(3/2)/Γ(½) = ½` instead of `Γ(½)/Γ(3/2) = 2`; the bracket gives `U(1, ½, z) → 2`.

*Needs:* 1.4, 1.5, 2.1; QuantumFoundations §9.4.

### 3.2 Fundamental pairs and Wronskians

DLMF 13.2.24–13.2.33 and 13.2.35–13.2.38. The content of 13.2.24–13.2.32 formalized here is that
each listed function solves 13.2.1 and that each listed pair has non-vanishing Wronskian on the
stated sector, with the logarithmic series 13.2.27–13.2.32 at integer `b` stated as functions on
the slit plane (Magnus–Oberhettinger–Soni §6.3.2, pp. 270–271; Olver §10.5, p. 259, on the
numerically satisfactory pairs). 13.2.24 and 13.2.25 are stated in logarithmic coordinates. The
Wronskians 13.2.33–13.2.38 hold on the slit plane, with `e^{±πi} z` as in the Conventions
(13.2.33: Beals–Wong (6.1.7), p. 191, for `M`; Olver §9.2, p. 255, for `𝐌`). They are computed
from the leading terms at `0` or at `∞`, since `z^b e^{−z} 𝒲` is constant by 13.2.1. The Wronskian
13.2.34, `𝒲{𝐌(a, b, z), U(a, b, z)} = −z^{−b} e^z/Γ(a)` (Olver §10.5, p. 259; Beals–Wong (6.2.8),
p. 195, for `M`), is an input from QuantumFoundations §9.4, through 2.1.

**Checks.**
- 13.2.34 at `a = b = 1`: `𝐌(1, 1, z) = e^z`, `U(1, 1, z) = e^z E₁(z)`, and
  `𝒲 = e^z (e^z E₁)′ − e^z e^z E₁ = −e^z z^{−1}`, using `E₁′ = −e^{−z}/z`.
- 13.2.33: `𝒲{𝐌(a, b, z), z^{1−b} 𝐌(a − b + 1, 2 − b, z)} = sin(πb) z^{−b} e^z/π`; at `a = 0`,
  `b = ½` the first function is the constant `Γ(½)⁻¹`, and at `z = ½` both sides equal
  `0.74218 53304…`.
- At integer `b` the regularized Wronskian of the pair vanishes, so the pair is not a basis there;
  dropping `sin(πb)/π` would claim one.

*Needs:* 1.3–1.5, 3.1, 2.1; QuantumFoundations §9.4.

### 3.3 Linking the solutions at the origin and at infinity

- Kummer's second transformation `U(a, b, z) = z^{1−b} U(a − b + 1, 2 − b, z)` on the slit plane
  (`kummerU_eq_cpow_mul_kummerU`; DLMF 13.2.40; Olver (10.06), p. 257; Temme (7.15), p. 176;
  Beals–Wong (6.2.7), p. 195; Lebedev (9.10.8), p. 265; Magnus–Oberhettinger–Soni §6.1.2, p. 267),
  and its logarithmic form for every `w`.
- The connection formula DLMF 13.2.41, `𝐌` through `U(a, b, z)` and `U(b − a, b, e^{±πi} z)`, for
  every `z ≠ 0` and both signs, with `U(b − a, b, e^{±πi} z)` as `kummerULog (b − a) b (log z ± πi)`
  (`regularizedHGFun_eq_kummerU_add`; Olver §10.3, pp. 257–258; Lebedev (9.12.4), p. 270;
  Magnus–Oberhettinger–Soni §6.1.1, pp. 263–264). QuantumFoundations §9.4 gives the upper signs for
  `−π < ph z < 0` and the lower for `0 < ph z < π`; with `w = log z` both sides are entire in `w`,
  so each sign extends to every `w` and in particular to every `z ≠ 0`.
- DLMF 13.2.43–13.2.44 for every `z ≠ 0` in the same form.

The bracket of 1.4 is the inverse connection, `U` through the two solutions at `0`.

**Checks.**
- At `a = 0.3`, `b = 0.45`, `z = 1.1 + 0.7i`, the upper sign of 13.2.41 gives
  `𝐌(a, b, z) = 0.94558 25545… + 0.60235 84360… i` on both sides.
- Kummer's second transformation at `a = 1`, `b = 0`: `U(1, 0, z) = z U(2, 2, z)`, and with
  `U(2, 2, z) = z⁻¹ − e^z E₁(z)` (4.1, Examples) both sides are `1 − z e^z E₁(z)`.
- Without the factor `z^{1−b}`, the case `a = 0`, `b = 0` would read `1 = U(1, 2, z) = z⁻¹`,
  which fails at `z = 2`.

*Needs:* 1.4, 1.5, 3.2, 2.1; QuantumFoundations §9.4.

### 3.4 Whittaker functions at the origin and their links to infinity

DLMF 13.14.14–13.14.19 and 13.14.22–13.14.35, translated from 3.1–3.3 by the definitions of 1.6:
- the limiting forms at `0` with DLMF's cases (`M_{κ,μ}(z) ∼ z^{½+μ}`: Olver (11.04), p. 260);
- the numerically satisfactory pairs 13.14.22–13.14.24 (13.14.22–13.14.23 in logarithmic
  coordinates; Whittaker–Watson §16.31, p. 343; Buchholz, p. 23);
- the Wronskians 13.14.25–13.14.30, each under the condition that every Whittaker `M` it contains
  is defined: 13.14.25 for `2μ ∉ ℤ ∖ {0}`, 13.14.26–13.14.27 for `2μ ∉ {−1, −2, …}` and
  13.14.28–13.14.29 for `2μ ∉ {1, 2, …}` (Beals–Wong (6.7.4) and (6.7.7), pp. 206–207;
  Magnus–Oberhettinger–Soni §7.1.2, pp. 299–300). Under the pinned definition `M_{κ,−½}` is
  identically `0`, because its factor is `Γ(0) = 0`, so 13.14.25 at `μ = ½` would be false. The
  regularized forms hold for every `μ`: `𝒲{𝐌_{κ,μ}, 𝐌_{κ,−μ}} = −sin(2πμ)/π` (Buchholz (2.32),
  p. 25, with Buchholz's second index `μ/2`), and 13.14.26–13.14.29 divided by `Γ(1 ± 2μ)`, for
  example `𝒲{𝐌_{κ,μ}, W_{κ,μ}} = −1/Γ(½ + μ − κ)`;
- the symmetry `W_{κ,μ} = W_{κ,−μ}` (`whittakerW_neg`; DLMF 13.14.31; Beals–Wong (6.7.5), p. 207;
  Buchholz (2.19), p. 19; Magnus–Oberhettinger–Soni §7.1.1, p. 299) and the connection formulas
  13.14.32–13.14.35, with 13.14.33, `W_{κ,μ}` through `M_{κ,±μ}`, for `2μ ∉ ℤ`
  (`whittakerW_eq_whittakerM_add`; Whittaker–Watson §16.41, p. 346; Beals–Wong (6.7.5), p. 207;
  Buchholz (2.18a), p. 19).

**Checks.**
- 13.14.31 at `μ = ½`: `W_{κ,1/2} = W_{κ,−1/2}`, which is Kummer's second transformation at
  `a = −κ`, `b = 0`: `U(−κ, 0, z) = z U(1 − κ, 2, z)`.
- 13.14.33 at `κ = 0`, `μ = 0.3`, `z = 1.2`: both sides equal `W_{0,0.3}(1.2) = 0.50424 00729…`.
- 13.14.25 at `κ = 0`, `μ = ¼`: `𝒲{M_{0,1/4}, M_{0,−1/4}} = −½`; with the regularized functions
  it is `−sin(π/2)/π = −1/π`, and `Γ(3/2) Γ(½) = π/2` converts one into the other.

*Needs:* 1.6, 3.1–3.3; AutomorphicSpectralTheory §§0.26, 0.28 (13.14.14 and 13.14.31 at `y > 0`).

### Examples

- 13.2.34 and the connection formula 13.2.41 give the Wronskian of the two solutions at `∞`:
  `𝒲{U(a, b, z), e^z U(b − a, b, e^{±πi} z)} = e^{±(a−b)πi} z^{−b} e^z` (DLMF 13.2.38).
- At `a = −1`, `b = 1` the bracket's coefficient `1/Γ(a)` vanishes, `U(−1, 1, z) = z − 1` and
  `M(−1, 1, z) = 1 − z` are proportional, and 13.2.34 gives `𝒲 = 0`.

### Dependencies

Layers 1–2; QuantumFoundations §9.4; AutomorphicSpectralTheory §§0.26, 0.28.

## Layer 4: contiguity, differentiation and continued fractions

### 4.1 Kummer functions

DLMF 13.3.1–13.3.29 on the slit plane:
- the contiguous relations 13.3.1–13.3.6 and 13.3.13 for `M` and 13.3.8–13.3.12 and 13.3.14 for
  `U` (Beals–Wong (6.5.2)–(6.5.7) and (6.5.10)–(6.5.15), pp. 200–202; Temme, Ex. 7.5, p. 188;
  Andrews–Askey–Roy, Ex. 4.2, p. 234; Magnus–Oberhettinger–Soni §6.2, pp. 267–268); 13.3.7, the
  relation in `a` for `U`, is an input from QuantumFoundations §9.4, through 2.1. Those for `M`
  are stated as identities of `Γ(b)𝐌` with each occurring denominator parameter outside
  `{0, −1, …}`, and in regularized form, with `Γ(b)` divided out, for all `b`;
- the derivatives 13.3.15–13.3.28 for `n : ℕ`, through `iteratedDeriv` and the operator
  `(z d/dz z)ⁿ` of 4.2, and the operator identity 13.3.29 (Lebedev (9.9.4)–(9.9.5) and (9.10.12),
  pp. 261 and 265; Temme, Ex. 7.5, p. 188; Buchholz (1.10), p. 5;
  Magnus–Oberhettinger–Soni §6.1.2, pp. 264–265); 13.3.22, `U′(a, b, z) = −a U(a + 1, b + 1, z)`,
  is `hasDerivAt_kummerU` (Beals–Wong (6.5.8), p. 201).

The proofs for `𝐌` are coefficient identities; for `U` they follow from the bracket for `b ∉ ℤ` and
continuity in `b`.

**Checks.**
- 13.3.22 at `a = b = 1`: `(e^z E₁(z))′ = −U(2, 2, z) = e^z E₁(z) − z⁻¹`, by 13.6.6,
  `U(2, 2, z) = e^z Γ(−1, z)`, and `Γ(−1, z) = e^{−z}/z − E₁(z)`.
- 13.3.22 at `a = −1`: `U′(−1, b, z) = U(0, b + 1, z) = 1`, which is `(z − b)′` (1.5).
- With the sign of 13.3.22 reversed, the case `a = −1` would give `−1`.

*Needs:* Layer 1, 2.1; SpecialFunctionsParabolicCylinder §1.2; QuantumFoundations §9.4.

### 4.2 Whittaker functions

DLMF 13.15.1–13.15.26 on the slit plane, with `√z` principal: the recurrences 13.15.1–13.15.14
and the differentiation formulas 13.15.15–13.15.26 for `n : ℕ`, where `(z d/dz z)ⁿ` is the
iterate of `f ↦ (fun z ↦ z * deriv (fun t ↦ t * f t) z)` (Buchholz §5.6, pp. 80–82, and §3.6,
pp. 46–47; Magnus–Oberhettinger–Soni §§7.2.1–7.2.2, pp. 301–304). DLMF notes that 13.15.2 and
13.15.10 correct errors in earlier tables; the forms here are DLMF's.

**Checks.**
- 13.15.24 at `n = 1`, `κ = ½`, `μ = 0`: with `W_{1/2,0}(z) = e^{−z/2} z^{1/2}` (6.1),
  `d/dz(e^{−z/2} z^{−1/2} W_{1/2,0}(z)) = −e^{−z} = −e^{−z/2} z^{−1} W_{1,1/2}(z)`, since
  `W_{1,1/2}(z) = e^{−z/2} z` (6.1).
- `d/dz(z^κ e^{−z/2} W_{κ,μ}(z)) = −z^{κ−1} e^{−z/2} W_{κ+1,μ}(z)` (Buchholz (5.43), p. 82) at
  `κ = 0`, `μ = ½`: the left side is `(e^{−z})′ = −e^{−z}`, and the right side is
  `−z^{−1} e^{−z/2} W_{1,1/2}(z) = −e^{−z}`.
- With the factor `z^{κ−1}` replaced by `z^κ`, the right side would be `−z e^{−z}`.

*Needs:* 1.6, 4.1.

### 4.3 Ratios as continued fractions

DLMF 13.5.1–13.5.4 and 13.17.1–13.17.4. The fraction 13.5.1 for
`M(a, b, z)/M(a + 1, b + 1, z) = 𝐌(a, b, z)/(b 𝐌(a + 1, b + 1, z))` converges at every `z` with
`𝐌(a + 1, b + 1, z) ≠ 0`, for `b ∉ {0, −1, …}`, as the convergents of Mathlib's `GenContFract` with
partial numerators `u_{k+1} z` of 13.5.2 (`tendsto_convs_regularizedHGFun_div`); 13.5.3 for
`U(a, b, z)/U(a, b − 1, z)` converges for `|ph z| < π` where `U(a, b − 1, z) ≠ 0`; 13.17.1–13.17.4
likewise, with DLMF's parameter hypotheses, such as `μ + ½ ± (κ + 1) ∉ {−1, −2, …}` for 13.17.3. The
partial numerators divide by the shifted denominators `(b + 2n)(b + 2n + 1)` and
`(2μ + 2n)(2μ + 2n + 1)`, so the parameter exclusions are needed even where the left side is
defined. "Converges to the meromorphic function" is stated as convergence of the convergents at each
point where the left side is defined and finite. The proof is Pincherle's theorem for the contiguous
relations of 4.1, with the minimal solutions identified by bounding the ratios of consecutive terms
through the integrals of 2.1 (Gautschi 1967; Temme, Ch. 13 §13.3, Examples 7–8, pp. 341–342, on
which solution of each recurrence is minimal), and holomorphy in the parameters for the remaining
parameters. 13.5.1 is the confluent limit of Gauss's continued fraction for `₂F₁`
(Andrews–Askey–Roy §2.5, pp. 97–98).

**Checks.**
- At `a = −2`, `b = ½`, `z = 1` the fraction terminates, and both sides equal
  `M(−2, ½, 1)/M(−1, 3/2, 1) = −5`.
- At `a = 0`, `b = 1`, `z = 1` the left side is `1/M(1, 2, 1) = 1/(e − 1) = 0.58197 67068…`, and
  the 40th convergent agrees to all printed digits.
- At `a = −1`, `b = 1`, `z = 1` the left side is `M(−1, 1, 1)/M(0, 2, 1) = 0`, and the fraction,
  whose first partial numerator `(a − b) z/(b(b + 1)) = −1` gives `1 + (−1)/1 = 0`, terminates at
  `0` too; the sign `a + b` instead of `a − b` would give `1`.

*Needs:* 4.1, 2.1; SpecialFunctionsEiLiErfIncompleteGamma §4.1.

### Examples

- 13.3.15 regularized: `𝐌′(a, b, z) = a 𝐌(a + 1, b + 1, z)`; at `a = b` both sides are `e^z/Γ(a)`.
- The three-term relation 13.3.7 for `U` at `a = 0`: `U(−1, b, z) + (b − z) U(0, b, z) = 0`, which
  is `(z − b) + (b − z) = 0`.

### Dependencies

Layers 1–2; QuantumFoundations §9.4; SpecialFunctionsEiLiErfIncompleteGamma §4.1.

## Layer 5: large argument and simple large-parameter forms

### 5.1 `U` and `W_{κ,μ}`

DLMF 13.2.6, 13.7.3, 13.14.21 and 13.19.3: for every `δ > 0` and `N`, in logarithmic coordinates
`z = e^w` with `|Im w| ≤ 3π/2 − δ`,

```text
U(a, b, z) = z^{−a} ∑_{s<N} (a)_s (a − b + 1)_s/s! (−z)^{−s} + O(|z|^{−Re a − N})
```

(`isBigO_kummerULog_sub_sum`; Olver (10.01), p. 256; Temme (7.13), p. 175;
Magnus–Oberhettinger–Soni §6.8.2, p. 289; Lebedev (9.12.3), p. 270, for `|ph z| < π − δ`), with
`z^{−a} = e^{−aw}`. Its leading behaviour `U(a, b, z) ∼ z^{−a}` is the input 13.2.6 from
QuantumFoundations §9.4, through 2.1; the expansion with remainder `O(|z|^{−Re a − N})` is a target
for every `N`. The uniqueness statement of 13.2.6 is a target: `U` is the only solution of 13.2.1
with `U(a, b, z) ∼ z^{−a}` along the positive axis (Olver §10.1, p. 256). With
`e^z U(b − a, b, e^{πi} z)` it forms a pair with nonzero Wronskian (13.2.38), and the second
solution dominates on the positive axis. 13.14.21 and 13.19.3 follow by the definition of `W`
(Whittaker–Watson §16.3, pp. 342–343, for `|ph z| ≤ π − δ`; Buchholz (7.1a), p. 90;
Magnus–Oberhettinger–Soni §7.6.1, p. 317). The proof: Watson's lemma applied to the Laplace
integral of 2.1 for `Re a > 0` in `|ph z| ≤ π/2 − δ`, rotation of the ray through `|ph t| < π`,
and 13.3.7 (the recurrence lowering `a`) for the remaining `a` (Lebedev (9.12.2), p. 270).

**Checks.**
- At `a = b = 1`: `e^z E₁(z) ∼ ∑ (−1)^s s! z^{−s−1}` (DLMF 6.12.1); at `z = 10`,
  `e^{10} E₁(10) = 0.09156 33339…`, and the sum to `s = 4` is `0.09164`.
- At `a = −1` the sum terminates at `N = 2` and is exact: `z (1 − b/z) = z − b = U(−1, b, z)`
  (1.5); with `z^{−s}` in place of `(−z)^{−s}` it would be `z + b`.
- 13.19.3 at `κ = 0`, `μ = ½`: `W_{0,1/2}(z) = e^{−z/2}` exactly, and the series terminates, since
  `(½ + μ − κ)_s (½ − μ − κ)_s = (1)_s (0)_s = 0` for `s ≥ 1`.

*Needs:* 2.1, 4.1, 3.2; AsymptoticExpansions §§4.2–4.3, §10.4; QuantumFoundations §9.4;
AutomorphicSpectralTheory §0.28 (13.14.21 at `y > 0`).

### 5.2 `M` and `M_{κ,μ}`

DLMF 13.2.23, 13.7.1–13.7.2, 13.14.20 and 13.19.1–13.19.2: 13.7.1 along the positive real axis
for `a ∉ {0, −1, …}` (Temme (7.9), p. 174; Beals–Wong (6.1.8)–(6.1.9), p. 192;
Andrews–Askey–Roy, Cor. 4.2.3, p. 193); 13.7.2 in logarithmic coordinates for
`−π/2 + δ ≤ ±Im w ≤ 3π/2 − δ`, as a two-sum expansion, unless `a` and `b − a` are both nonpositive
integers (Buchholz (7.6), p. 93; Temme, Ex. 7.7, p. 189; Lebedev (9.12.7), p. 271;
Magnus–Oberhettinger–Soni §6.8.2, p. 289); 13.2.23 for `a ∉ {0, −1, …}` and 13.14.20 for
`2μ ∉ {−1, −2, …}` and `½ + μ − κ ∉ {0, −1, …}` (Beals–Wong (6.7.3), p. 206), each for
`|ph z| ≤ π/2 − δ`; 13.19.2 in the same form (Buchholz (7.3), p. 91; Magnus–Oberhettinger–Soni
§7.6.1, p. 317). 13.7.2 is 13.2.41 with 5.1 applied to both terms. In the excluded polynomial
cases the right sides of 13.2.23 and 13.14.20 vanish, through `1/Γ(a)` and `1/Γ(½ + μ − κ)`, while
the left sides do not.

**Checks.**
- 13.2.23 at `a = 0.3`, `b = 0.45`: the ratio `𝐌(a, b, z) Γ(a) e^{−z} z^{b−a}` is
  `1.00362 22…` at `z = 30` and `1.00177 95…` at `z = 60`, in agreement with
  `1 + (1 − a)(b − a)/z + O(z^{−2})`.
- 13.2.23 at `a = −1`, `b = 1`, a negative control: `𝐌(−1, 1, z) = 1 − z`, which is `−4` at
  `z = 5` and `−29` at `z = 30`, while `e^z z^{a−b}/Γ(a) = 0`.
- 13.14.20 at `κ = 1`, `μ = ½`, a negative control: `M_{1,1/2}(z) = z e^{−z/2}`, which is
  `0.41042 49931…` at `z = 5`, while the right side is `0`.
- 13.2.23 at `a = b`: `𝐌(a, a, z) = e^z/Γ(a)`, exactly.

*Needs:* 3.3, 5.1; AutomorphicSpectralTheory §0.28 (13.14.20 at `y > 0`).

### 5.3 Large `b` and large `μ`

- DLMF 13.8.1: for fixed `a`, `z` and `δ > 0`, as `b → ∞` in `{b | ∀ n : ℕ, δ ≤ |b + n|}`,
  `M(a, b, z) = ∑_{s<n} (a)_s z^s/((b)_s s!) + O(|b|^{−n})`
  (`isBigO_regularizedHGFun_sub_sum_cobounded`; Magnus–Oberhettinger–Soni §6.8.3, p. 289).
- DLMF 13.20.1: for fixed `κ` and `R > 0`, as `μ → ∞` in `|ph μ| ≤ π/2 − δ`,
  `M_{κ,μ}(z) = z^{μ+½}(1 + O(μ^{−1}))` uniformly for `0 < |z| ≤ R` in the slit plane
  (Buchholz (7.10), p. 94; Magnus–Oberhettinger–Soni §7.6.2, p. 318).

Both are tail estimates of the series: under `|b + n| ≥ δ` for all `n`, the tail
`∑_{s≥n} (a)_s z^s/((b)_s s!)` is `O(|b|^{−n})`, and likewise for `𝐌(½ + μ − κ, 1 + 2μ, z)`.

**Checks.**
- At `a = 1`, `z = 1`, `n = 1`: `M(1, b, 1) − 1 = 1/b + O(b^{−2})`; at `b = 100` the left side is
  `0.01009 99010…`.
- At `a = 0` the left side `M(0, b, z) = 1` and the sum is `1` for every `n ≥ 1`: the error is `0`.
- Without the restriction `|b + n| ≥ δ`, the statement fails along `b = −n + 1/n²` at `a = 1`,
  `z = 1`, where `M(1, b, 1)` is unbounded by 13.2.5 (1.1).

*Needs:* 1.6; Tau Ceti `Complex.hasSum_regularizedHGFun`.

### Examples

- 5.2 at `a = ½`, `b = 3/2`, `z = x² > 0`: `M(½, 3/2, x²) ∼ e^{x²}/(2x²)`, which is
  `∫₀^x e^{t²} dt ∼ e^{x²}/(2x)`, since `∫₀^x e^{t²} dt = x M(½, 3/2, x²)`.
- 5.1 at `a = ½`, `b = ½`: `U(½, ½, z²) ∼ z^{−1}`, which is `√π e^{z²} erfc z ∼ 1/z` (6.1).

### Dependencies

Layers 1–4; AsymptoticExpansions Layers 1, 4 and 10; QuantumFoundations §9.4;
AutomorphicSpectralTheory §0.28.

## Layer 6: classical functions as confluent functions

Each subsection gathers one family: the Kummer forms, the Whittaker forms, and the formulas that
the family's own roadmap leaves to this one. The Whittaker forms follow from the Kummer forms by
the definitions of 1.6, with the domains transported.

### 6.1 Elementary, exponential-integral, incomplete Gamma and error functions

- Elementary functions: DLMF 13.6.2 for every `z`, and 13.6.4 and the `U` half `U(0, b, z) = 1` of
  13.6.3 for `z ∈ slitPlane` (Lebedev §9.13, p. 271); 13.6.1 and the
  `M` half of 13.6.3 are inputs. In Whittaker form, DLMF 13.18.1–13.18.3, for example
  `M_{0,1/2}(2z) = 2 sinh z` and `W_{κ,κ−½}(z) = e^{−z/2} z^κ`
  (Magnus–Oberhettinger–Soni §7.2.4, pp. 304–305; Buchholz, App. I, A.1–A.2a, pp. 207–208).
- Incomplete Gamma and error functions: DLMF 13.6.6, `U(a, a, z) = e^z Γ(1 − a, z)`, for
  `z ∈ slitPlane` (Olver, Ex. 10.2, p. 259; Temme §7.3.7, p. 186), and DLMF 13.6.8,
  `U(½, ½, z²) = √π e^{z²} erfc z`, for `Re z > 0` (Lebedev (9.13.2), p. 272), through
  SpecialFunctionsEiLiErfIncompleteGamma; 13.6.5 and 13.6.7 are inputs. At real argument, through
  Tau Ceti's `TauCeti.lowerIncompleteGamma` and `TauCeti.Real.erfc`:
  `U(1 − s, 1 − s, x) = e^x (Γ(s) − γ(s, x))` for `s, x > 0` (`kummerU_one_sub_one_sub`) and
  `U(½, ½, x²) = √π e^{x²} erfc x` for `x > 0` (`kummerU_half_half_sq`). In Whittaker form,
  DLMF 13.18.4–13.18.7 (Whittaker–Watson §16.2, pp. 341–342; Andrews–Askey–Roy (4.4.4) and
  (4.4.7), p. 197; Buchholz, App. I, A.4 and A.6, pp. 209–211): 13.18.4 and 13.18.6 come from the
  inputs 13.6.5 and 13.6.7, and 13.18.5 and 13.18.7 from 13.6.6 and 13.6.8; they are targets here
  because the Whittaker functions are.
- The formulas the roadmap of these functions leaves here, which are 13.6.6 and 13.6.8
  rearranged and are proved from them:
  - DLMF 6.11.2 for `z ∈ slitPlane` and 6.11.3 for `−π/2 < ph z < π`, `z ≠ 0`, the region where
    both sides are holomorphic, through the auxiliary functions `f` and `g`;
  - DLMF 7.11.5 and 7.18.10 for `Re z > 0`; at `z = −1` the principal branch of `U(½, ½, z²)`
    gives `erfc(1)` and not `erfc(−1)`;
  - DLMF 8.5.3 and 8.5.5 for `z ∈ slitPlane`, and 8.5.4 for `z ∈ slitPlane`,
    `a ∉ {0, −1, −2, …}` (8.5.3: Olver, Ex. 10.2, p. 259);
  - DLMF 8.19.16 for `z ∈ slitPlane` (at `p = 1`, Lebedev (9.13.5), p. 273, and Beals–Wong
    (6.4.10), p. 199, for `Ei`).

DLMF notes that its source tables contain errors in the equations corresponding to 13.6.7 and
13.6.8; the forms here are DLMF's.

**Checks.**
- `kummerU_one_sub_one_sub` at `s = 2`, `x = 1.3`: `U(−1, −1, x) = x + 1 = 2.3` (1.5), and
  `e^x (Γ(2) − γ(2, x)) = e^x Γ(2, x) = 1 + x`. With `U(s, s, x)` in place of `U(1 − s, 1 − s, x)`
  the left side would be `U(2, 2, 1.3) = 0.27222 10209…`.
- `U(½, ½, 1) = √π e erfc(1) = 0.75787 21561…`, and at `x = −1` the principal `U(½, ½, 1)` is the
  same number, while `√π e erfc(−1) = 8.87818 60332…`, so `kummerU_half_half_sq` needs `x > 0`.
- DLMF 8.19.16 at `p = 1` is 6.11.2.

*Needs:* Layers 1–4; SpecialFunctionsEiLiErfIncompleteGamma; QuantumFoundations §9.4.

### 6.2 Bessel and Airy functions

- Modified Bessel functions, DLMF 13.6.9–13.6.10 and 13.6.11_1–13.6.11_2 for `z ∈ slitPlane`,
  with the products `Γ(ν)(2ν)_k(ν + k)` and `Γ(ν − n)(2ν − 2n)_k(ν − n + k)` read as their
  holomorphic extensions as in 6.3 (so `ν = 0`, respectively `ν = n`, is covered). 13.6.9 is
  Kummer's second transformation `M(a, 2a, 2z) = e^z ₀F₁(; a + ½; z²/4)` (Olver, Ex. 9.3, p. 256;
  Beals–Wong (6.1.11), p. 192; Whittaker–Watson §16.11, pp. 338–339; Buchholz (1.12b), p. 7);
  13.6.10 is `K_ν` through `U` (Olver, Ex. 10.1, p. 259; Temme (9.45), p. 236; Lebedev (9.13.15),
  p. 274; Magnus–Oberhettinger–Soni §6.7.1, p. 283).
- Airy's function, DLMF 13.6.11, for `z ≠ 0`, `|ph z| < 2π/3` (`kummerU_airyAi`).
- In Whittaker form, DLMF 13.18.8–13.18.10, with `W_{0,ν}(2z) = (2z/π)^{1/2} K_ν(z)`
  (`whittakerW_zero_eq_besselK`; DLMF 13.18.9; Buchholz (2.29a), p. 24, with Buchholz's second
  index `μ/2`).
- The formulas the Airy and Bessel roadmaps leave here:
  - DLMF 9.6.21–9.6.24 with `ζ = (2/3) z^{3/2}`, for `z ≠ 0`, `|ph z| < 2π/3` (9.6.21:
    `airyAi_eq_whittakerW`);
  - DLMF 10.16.6–10.16.8 for `Re z > 0`, where all powers are principal (DLMF states that
    principal branches correspond at least when `|ph z| ≤ π/2`; on the ray `ph z = −π/2` the
    argument `−2iz` of 10.16.6 lies on the cut with DLMF phase `−π`), with `2ν ∉ {−1, −2, …}` for
    10.16.7;
  - DLMF 10.39.6 and 10.39.8 for `z ∈ slitPlane` (10.39.6: `besselK_eq_kummerU`), and 10.39.7 for
    `z ∈ slitPlane`, `2ν ∉ {−1, −2, …}`.

**Checks.**
- 13.18.9 at `ν = 0.3`, `z = 0.8 + 0.4i`: both sides equal `0.39325 70521… − 0.15612 45294… i`.
- 10.39.8 at `ν = ½`: `K_{1/2}(z) = (π/(2z))^{1/2} e^{−z}`, with `W_{0,1/2}(2z) = e^{−z}`.
- Whittaker–Watson's `K_ν` (§17.71, p. 373) carries an extra factor `cos νπ`: it vanishes at
  `ν = ½`, while the pinned `K_{1/2}(1) = (π/2)^{1/2} e^{−1} = 0.46106 85044…` does not, so
  13.18.9 is not Whittaker–Watson's formula at non-integer `ν`.

*Needs:* Layers 1–4, 5.1; SpecialFunctionsBessel; SpecialFunctionsAiry.

### 6.3 Expansions in Bessel functions

DLMF 13.11.1–13.11.4 and 13.24.1–13.24.3:
- the expansions 13.11.1–13.11.2 in `I_{a−½+s}(z/2)` and `I_{b−a−½+s}(z/2)`, for `z ∈ slitPlane`
  with DLMF's parameter exclusions (Magnus–Oberhettinger–Soni §6.7.1, pp. 284–285). The products
  `Γ(a − ½)(2a − 1)_s (a − ½ + s)` of 13.11.1 and `Γ(b − a − ½)(2b − 2a − 1)_s (b − a − ½ + s)` of
  13.11.2 are read as their holomorphic extensions: by `(2a − 1)_s = (2a − 1)(2a)_{s−1}` and
  `Γ(a − ½)(2a − 1) = 2Γ(a + ½)`, the first is `Γ(a + ½)` at `s = 0` and
  `2Γ(a + ½)(2a)_{s−1}(a − ½ + s)` for `s ≥ 1`, and the second is the same with `b − a` in place
  of `a`. This covers `a = ½` in 13.11.1 and `b − a = ½` in 13.11.2, where the printed `Γ(0)`
  would be Mathlib's junk value `0`. Check: at `a = ½`, `b = z = 1` both sides equal
  `1.75338 76543 7709…`;
- Buchholz's expansion 13.11.3 in the entire form
  `𝐌(a, b, z) = e^{z/2} ∑_s A_s (z/2)^s 𝐅(b + s, −(b − 2a) z/2)` for all `a`, `b`, `z`
  (`hasSum_regularizedHGFun_buchholz`; Magnus–Oberhettinger–Soni §6.7.1, pp. 284–285), with
  `𝐅(c, w) = ∑_k w^k/(k! Γ(c + k))` the regularized `₀F₁`, and the printed `J_{b−1+s}` form for
  `z ≠ 0`, `b ≠ 2a` and `−π < ph z + ph(b − 2a) ≤ π`, with principal powers and square root.
  Outside that range the printed form with principal branches is false: at `a = 0.2 − 0.5i`,
  `b = 1.4 + 0.4i`, `z = −1.2 + 0.3i` the left side is `1.18529 22839… + 0.46781 21627… i` and the
  printed right side `2.83359 66305… − 3.38992 70140… i`;
- the coefficients `A_n` of 13.11.4: `A₀ = 1`, `A₁ = 0`, `A₂ = b/2`, and
  `(n + 1) A_{n+1} = (n + b − 1) A_{n−1} + (2a − b) A_{n−2}` for `n ≥ 2` (`buchholzCoeff`;
  Magnus–Oberhettinger–Soni §6.7.1, pp. 284–285);
- 13.24.1 for `z ∈ slitPlane` with the principal `z^{½−κ}`, and `2μ, κ + μ ∉ {−1, −2, …}`
  (Magnus–Oberhettinger–Soni §7.2.4, p. 306). The product `Γ(κ + μ)(2κ + 2μ)_s (κ + μ + s)` is
  read as its holomorphic extension, as above, so that `κ + μ = 0` is covered;
- 13.24.2 for `z ∈ slitPlane` (Buchholz (7.16), p. 97, with Buchholz's second index `μ/2`), with
  `(2√(κz))^{−2μ−s} J_{2μ+s}(2√(κz))` read as the entire function `2^{−2μ−s} 𝐅(2μ + s + 1)(−κz)`
  of `κz`, and with `𝐌_{κ,μ}` for `M_{κ,μ}/Γ(1 + 2μ)` on the left, so that every `μ` is covered.
  The polynomials `p_s^{(μ)}(z)` are `(−z)^s` times the `s`-th Taylor coefficient at `t = 0` of
  the function 13.24.3, holomorphic near `0` after filling its removable singularity
  (Buchholz (7.14), p. 96).

**Checks of `A_n`.**
- `A₃ = (2a − b)/3` and `A₄ = b(b + 2)/8`; at `a = 0.3 + 0.1i`, `b = 1.7` these are
  `−0.36666 66667… + 0.06666 66667… i` and `0.78625`.
- At `b = 2a`, `𝐅(b + s)(0) = 1/Γ(2a + s)`, so 13.11.3 reads
  `𝐌(a, 2a, z) = e^{z/2} ∑_s A_s (z/2)^s/Γ(2a + s)`; at `a = 0.65 + 0.2i`, `z = 1.3 − 0.4i`
  both sides equal `2.44794 44299… − 0.52494 27441… i`.
- With the coefficients of `A_{n−1}` and `A_{n−2}` swapped in the recursion, `A₃ = (b + 1)/3`,
  which is not `0` at `b = 2a`.

**Checks of `p_s^{(μ)}`.**
- `p₀^{(μ)}(z) = 1` and `p₁^{(μ)}(z) = z²/6` for every `μ`, as DLMF states after 13.24.2. Reading
  the factor `(−t/z)^s` of 13.24.3 as `(t/z)^s` gives `p₁ = −z²/6`.
- `p₂^{(μ)}(z) = z⁴/72 − (1 − 2μ) z²/6`, the first that depends on `μ`.
- `p₃^{(μ)}(z) = z⁶/1296 + (μ − 7/10) z⁴/18`.

*Needs:* Layers 1–4, 6.2; SpecialFunctionsBessel.

### 6.4 Parabolic cylinder functions and the Hermite and Laguerre polynomials

- Weber's function: DLMF 13.6.12–13.6.13 for `Re z > 0` (`kummerU_parabolicCylinderU`; Olver,
  Ex. 10.4, p. 259; Temme (7.21), p. 179; Beals–Wong (6.6.6) and (6.6.11), pp. 203–204, for
  `D_ν`), and 13.6.14 for every `z` and 13.6.15 for `z ≠ 0`, whose two sides are entire in `z`,
  respectively holomorphic on `z ≠ 0`.
- Hermite polynomials, with `H_n(x) = 2^{n/2} He_n(√2 x)`: DLMF 13.6.16 for every `z` and 13.6.17
  for `z ≠ 0` (Beals–Wong (6.4.3)–(6.4.4), p. 198; Lebedev (9.13.8)–(9.13.9), p. 273); 13.6.18
  for `z ≠ 0` when `n` is odd, where both sides are polynomials in `z²` (1.5), and for `z ≠ 0` with
  `−π/2 < ph z ≤ π/2` when `n` is even (Olver, Ex. 10.3, p. 259). The principal
  `U(½ − ½n, 3/2, z²)` is even in `z`, while `z^{−1} H_n(z)` is odd for even `n`.
- DLMF 13.6.21 when `a` or `a − b + 1` is a nonpositive integer, with `₂F₀` the finite sum
  `∑_k (a)_k (a − b + 1)_k (−z)^{−k}/k!`.
- In Whittaker form, DLMF 13.18.11–13.18.17: Weber's function 13.18.11–13.18.13
  (Whittaker–Watson §16.5, p. 347, for `D_n`; Buchholz (3.22a,b), p. 39), Hermite polynomials
  13.18.14–13.18.16 and Laguerre polynomials 13.18.17 (Buchholz (2.28a,b), pp. 23–24), with the
  domains above transported. 13.18.11–13.18.16 compare the principal `√z` with a principal power
  of `z²`, which agree exactly when `−π/2 < ph z ≤ π/2`, so they are stated for `z ≠ 0` in that
  range. 13.18.17 is for `z ∈ slitPlane` and `α + 1 ∉ {0, −1, …}`, with LaguerreJacobi's
  Laguerre polynomials; it comes from the polynomial case of 1.5 and the input 13.6.19
  (Lebedev (9.13.10), p. 273; Kristensson (7.8), p. 130).
- The formula the parabolic cylinder roadmap leaves here: DLMF 12.7.14 for `Re z > 0` (its last
  form: `parabolicCylinderU_eq_whittakerW`).

**Checks.**
- 13.6.18 at `n = 2`, `z = 1`: both sides equal `½`. At `z = −1` the left side is
  `U(−½, 3/2, 1) = ½` and the right side `2^{−2} z^{−1} H₂(z) = −½`, so 13.6.18 fails for even `n`
  and `Re z < 0`.
- 13.6.18 at `n = 3`, `z = −1`: both sides equal `−½`.
- 13.6.14 at `a = 0.7`, `z = −1.1 + 0.3i`: both sides equal `1.79461 52197… − 0.70269 20297… i`.
- 13.18.17 at `α = 0.4`, `n = 2`, `z = 0.7 + 0.2i`: all three members equal
  `0.28910 98319… − 0.35794 75478… i`.
- 13.18.16 at `n = 2`, `z = 0.8 + 0.3i`: both sides equal `0.05545 57467… + 0.33426 30921… i`. At
  `z = −0.8 + 0.3i` the left side is `0.05545 57467… − 0.33426 30921… i` and the right side
  `0.33426 30921… + 0.05545 57467… i`.

*Needs:* Layers 1–4, 5.1; SpecialFunctionsParabolicCylinder; QuantumFoundations §9.4;
LaguerreJacobi §1.1; AutomorphicSpectralTheory §0.27 (13.18.8–13.18.9 at `y > 0`).

### Examples

- 13.6.16 at `n = 1`: `M(−1, ½, z²) = 1 − 2z² = −(1/2) H₂(z)` with `H₂(z) = 4z² − 2`.
- 13.11.1 at `a = ½ + ν`, `b = 1 + 2ν` reduces to 13.6.9.
- 13.6.21 at `a = −1`: `U(−1, b, z) = (−z)(1 + (−1)(−b)(−z)^{−1}) = z − b`, the polynomial case
  of 1.5.

### Dependencies

Layers 1–5; SpecialFunctionsEiLiErfIncompleteGamma; SpecialFunctionsBessel;
SpecialFunctionsAiry; SpecialFunctionsParabolicCylinder; QuantumFoundations §9.4; LaguerreJacobi;
AutomorphicSpectralTheory §0.27.

## Layer 7: quadratic relations and addition theorems

### 7.1 The quadratic relation

DLMF 13.12.1, for `b ∉ ℤ` (`kummer_quadratic_relation`): the combination of the products
`M(a, b, z) M(−a, −b, −z)` and `M(1 + a, 2 + b, z) M(1 − a, 2 − b, −z)` that equals `1`, with each
`M` written as `Γ(b) 𝐌`. Proof route: the
left side is entire in `z`, bounded at infinity by the connection formulas 13.2.39–13.2.41 (3.3)
and the large-argument behaviour (5.1), hence constant, and equals `1` at `0`. In Whittaker form,
DLMF 13.25.1 for `z ∈ slitPlane` and `2μ ∉ ℤ`, so that the four Whittaker `M` are defined and the
denominator `4μ(1 + μ)(1 + 2μ)²` is nonzero; it is 13.12.1 transported by 13.14.2.

**Checks.**
- 13.12.1 at `a = 0.3`, `b = 0.45`, `z = 0.8 + 0.5i`: the left side equals `1`.
- 13.12.1 at `a = 0`: `M(0, b, z) M(0, −b, −z) = 1`, the coefficient `a(a − b)` of the other
  product vanishing.
- With `M(1 − a, 2 − b, z)` in place of `M(1 − a, 2 − b, −z)` the left side at `a = 0.3`,
  `b = 0.45`, `z = 0.8 + 0.5i` is `1.15220 49281… − 0.30266 27490… i`.

*Needs:* 1.6, 3.3, 5.1.

### 7.2 Shifted and scaled argument: Kummer's functions

DLMF 13.13.1–13.13.12, the expansions of `M(a, b, x + y)` and `U(a, b, x + y)` for complex `x`,
`y` with DLMF's convergence conditions (`|y| < |x|` or `Re(y/x) > −½`), and with `x`, `x + y` in
the slit plane for the `U` expansions (Buchholz (1.11), p. 5, for 13.13.1;
Magnus–Oberhettinger–Soni §§6.4.1–6.4.2, pp. 271–272). The multiplication theorems of
§13.13(iii) (Magnus–Oberhettinger–Soni §§6.4.3–6.4.4, pp. 273–274) are these with `y` replaced
by `(y − 1)x` and are not separate targets. Proof route: 13.13.1 is the Taylor series of
`M(a, b, ·)` at `x`, with the derivatives 13.3.16 (4.1); the others follow by Kummer's
transformation and from the derivatives of `U`.

**Checks.**
- 13.13.1 at `y = −x`: `M(a, b, 0) = 1 = ∑_n (a)_n (−x)^n/((b)_n n!) M(a + n, b + n, x)`.
- 13.13.1 at `a = b`: `e^{x+y} = ∑_n y^n/n! · e^x`.

*Needs:* Layers 1, 3–5.

### 7.3 Shifted and scaled argument: Whittaker functions

DLMF 13.26.1–13.26.12 for real `x > 0` and `y` with `x + y > 0` (DLMF takes `x`, `y` real), and
the convergence conditions DLMF attaches: `|y| < |x|` for 13.26.1, 13.26.4, 13.26.7, 13.26.8,
13.26.10 and 13.26.11; `Re(y/x) > −½` for 13.26.3, 13.26.9 and 13.26.12; `Re((x + y)/x) > ½` for
13.26.6; none for 13.26.2 and 13.26.5 (Buchholz (3.44)–(3.45), p. 48, with Buchholz's second
index `μ/2`; Magnus–Oberhettinger–Soni §§7.3.1–7.3.4, pp. 306–310). The expansions of `M_{κ,μ}`
also need every `M` in them defined: `2μ ∉ ℤ` for 13.26.1 and 13.26.4, whose terms contain
`M_{·,μ−n/2}`, and `2μ ∉ {−1, −2, …}` for the others. The multiplication theorems of
§13.26(iii) are these with `y` replaced by `(y − 1)x` and are not separate targets.

DLMF notes errors in its sources for 13.26.3 and 13.26.6; the forms here are DLMF's.

**Checks.**
- 13.26.1 at `κ = 0.3`, `μ = 0.35`, `x = 1`, `y = 0.6`: both sides equal `1.25806 69306…`. At
  `y = 1.5` the terms of the series grow (moduli about `2.9`, `3.0×10³` and `5.0×10⁶` at `n = 20`,
  `40`, `60`), so the condition `|y| < |x|` cannot be dropped.

*Needs:* 1.6, 7.2.

### Examples

- 13.13.1 at `a = 0`: both sides are `1`, since `(0)_n = 0` for `n ≥ 1`.

### Dependencies

Layers 1, 3–5.

## Layer 8: integrals and transforms

### 8.1 Primitives and the Laplace and Mellin transforms

DLMF 13.10.1–13.10.2 (as derivatives, for `a ≠ 1`), 13.10.4–13.10.6 and 13.10.8–13.10.11 with
DLMF's hypotheses (Magnus–Oberhettinger–Soni §6.1.2, pp. 266–267, and §6.6.1, pp. 278–282). The
Laplace transform 13.10.4 is Temme, Ex. 7.12, p. 191. The Mellin transform 13.10.10 is
`integral_cpow_mul_regularizedHGFun_neg` (Andrews–Askey–Roy §4.2, p. 192, where it is the step
before the Barnes integral of 2.2). The loop integrals 13.10.8–13.10.9 use the loop
`∫_{−∞}^{(0+)}` of the Conventions, for `y > 0` and `Re z > 0`, through SpecialFunctionsBessel's
`I_{b−1}` and `K_{b−1}`; on the loop `y/t` stays in the slit plane, so `U(a, b, y/t)` is
principal.

**Checks.**
- 13.10.4 at `a = 0`: `∫₀^∞ e^{−zt} t^{b−1}/Γ(b) dt = z^{−b}`, which is Mathlib's
  `Complex.Gamma_eq_integral` after scaling.
- 13.10.11 at `a = b = 1`: `∫₀^∞ t^{λ−1} e^t E₁(t) dt = Γ(λ)² Γ(1 − λ) = π Γ(λ)/sin(πλ)` for
  `0 < Re λ < 1`; at `λ = ½` both sides equal `π^{3/2} = 5.56832 79968…`.
- 13.10.10 at `a = 1`, `b = 2`, `λ = ½`: `𝐌(1, 2, −t) = (1 − e^{−t})/t`, and
  `∫₀^∞ t^{−1/2} (1 − e^{−t})/t dt = 2√π = 3.54490 77018…`, which is
  `Γ(½)Γ(½)/(Γ(1)Γ(3/2))`. With `Γ(b)` in the denominator in place of `Γ(b − λ)` the right side
  would be `π`.

*Needs:* Layers 1–4; AsymptoticExpansions §8.1; SpecialFunctionsBessel.

### 8.2 Oscillatory kernels

DLMF 13.10.12–13.10.16 for `x > 0` with DLMF's hypotheses, through Mathlib's `Complex.besselJ`
for 13.10.13–13.10.16 (Magnus–Oberhettinger–Soni §6.1.2, p. 266, for the Fourier cosine
transform, and §6.6.2, p. 282, for the Hankel transforms).

*Needs:* 2.1, 8.1.

### 8.3 Whittaker functions

DLMF 13.23.1–13.23.3 and 13.23.5–13.23.12: the Laplace and Mellin transforms 13.23.1–13.23.5
without 13.23.4 (13.23.1 with Mathlib's `regularizedGaussHGFun` at `1/(z + ½)`, inside the unit
disk since `Re z > ½`), the loop integrals 13.23.6–13.23.7, the Fourier transform 13.23.8 and the
Hankel transforms 13.23.9–13.23.12 (Buchholz §§10.1–10.2, pp. 118–123, and the examples after
(11.11), p. 128; Magnus–Oberhettinger–Soni §§7.5.1–7.5.2, pp. 314–317).

*Needs:* 1.6, 8.1–8.2.

### Examples

- 13.23.1 at `κ = μ + ½`: `M_{μ+½,μ}(t) = t^{μ+½} e^{−t/2}`, the Gauss factor of 13.23.1 is `1`,
  and both sides are `Γ(ν + μ + ½)(z + ½)^{−ν−μ−½}`.

### Dependencies

Layers 1–6; AsymptoticExpansions §8.1; SpecialFunctionsBessel.

## Layer 9: real zeros

### 9.1 Counting the real zeros of `M`

DLMF §13.9(i) without 13.9.8–13.9.10:
- for `a, b − a ∉ {0, −1, …}`, `M(a, b, ·)` has infinitely many complex zeros; for real `a`, `b`
  the number of real zeros is finite; all zeros away from `0` are simple (Buchholz §17, p. 179);
- the counts 13.9.1–13.9.6 of positive zeros `p(a, b)` for real `a`, `b`, with the corrected
  hypotheses below, and 13.9.7 for the negative zeros, `n(a, b) = p(b − a, b)`, by 13.2.39
  (Kienast's counts in Whittaker parameters: Buchholz (17.8β)–(17.8ε′), pp. 182–183);
- the zero-free parabolic regions `P_α = {x + iy | y² ≤ 4α(x + α)}` of the paragraph after 13.9.9,
  for the three parameter ranges stated there; for the partial sums of 13.2.2, the interior of
  `P_α` (Saff and Varga: Andrews–Askey–Roy, Cor. 4.16.4, p. 234, with AAR's `(c; d)` for DLMF's
  `(a; b)`). The closed region fails for partial sums: in the first range the degree-one sum
  `1 + (a/b) z` vanishes at the vertex `−b/a` of `P_{b/a}` (at `a = b = 1`, `1 + z` vanishes at
  `−1 ∈ P₁`);
- for fixed `a`, `z` and `δ > 0`, `M(a, b, z)` has finitely many `b`-zeros with `|b + n| ≥ δ` for
  every `n ∈ ℕ`: 13.8.1 (5.3) excludes large ones there, and the bounded part is compact. DLMF's
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
- 13.9.3 and 13.9.4 for `a > 0` (`ncard_pos_zeros_regularizedHGFun_of_pos_of_neg` for 13.9.3,
  `ncard_pos_zeros_regularizedHGFun_of_pos_of_lt_neg_one` for 13.9.4). At `a = 0`,
  `M(0, b, x) = 1` has no zeros, while 13.9.3 at `b = −1/2` and 13.9.4 at `b = −5/2` give `1`;
- 13.9.6 for `a ∉ {−1, −2, …}` (`ncard_pos_zeros_regularizedHGFun_of_ceil_lt`). At `a = −1`,
  `b = −3/2` it gives `1`, but `M(−1, −3/2, x) = 1 + 2x/3` has no positive zero;
- 13.9.7 with the same exclusions on the pair `(b − a, b)`. At `a = b = −1/2` and at `a = −1/2`,
  `b = −3/2` the printed value is `1`, and there are no negative zeros.

The proof counts sign changes through Sturm comparison (SpecialFunctionsBessel 10.1, auxiliary) on
the self-adjoint form `(x^b e^{−x} w′)′ = a x^{b−1} e^{−x} w` and continuity of the zeros in the
parameters, with the polynomial cases `a = −n` as base cases. The continuity of the zeros and the
polynomial cases are auxiliary targets of this layer (see the list of auxiliary results).

**Checks.**
- `M(−0.5, 0.01, ·)` has one positive zero, at `x = 0.01990 14758…`, and `𝐌(−0.5, 0, ·)` has
  none.
- Sign changes of `𝐌(a, b, ·)` on `(0, 60]`: one at `(a, b) = (0.5, −0.5)` and none at `(0, −0.5)`
  (13.9.3 corrected and printed); one at `(−1.5, −2.5)` and none at `(−1.5, −3.5)` and
  `(−2, −4.5)` (13.9.6 corrected; the printed form gives `1` at `(−2, −4.5)`).
- On the grid `a ∈ {−5.5, −5.25, …, 3}`, `b < 0` non-integer with `b ≥ −5.5`, the corrected counts
  13.9.3–13.9.6 agree with a sign-change count of `M(a, b, ·)` on `(0, 80]`; the printed ones
  fail only at `a = 0` (13.9.3, 13.9.4) and at negative integer `a` (13.9.6).

*Needs:* Layers 1, 3, 5; SpecialFunctionsBessel 10.1 (auxiliary: Sturm comparison);
QuantumFoundations §9.4 (13.6.19); LaguerreJacobi §2.3.

### 9.2 Finiteness, counts and a zero-free half-plane for `U`

DLMF §13.9(ii) without 13.9.16 and the `b`-zero strings: for fixed `a`, `b` and `r > 0`,
`U(a, b, ·)` has finitely many zeros in each truncated sector `|Im w| ≤ 3π/2 − δ`, `Re w ≥ log r`
of the logarithmic plane, and for real `a`, `b` in the whole sector `|Im w| ≤ 3π/2 − δ`, by the
limiting forms 13.2.16–13.2.22 at `0`. Without the truncation the statement fails for complex
parameters: by 13.6.10, `U(½ + i, 1 + 2i, 2x) = π^{−1/2} e^x (2x)^{−i} K_i(x)`, and `K_i(x)` has
infinitely many zeros accumulating at `0⁺` (DLMF 10.45.7). The layer also owns the counts
13.9.11–13.9.15 of zeros `T(a, b)` in `|ph z| < π` and `P(a, b)` on `(0, ∞)` for real noninteger
`a`, `b`, `a − b + 1`, with `T(a, b) = T(a − b + 1, 2 − b)` and `P(a, b) = P(a − b + 1, 2 − b)`
for `b ≥ 1` by 13.2.40 (Tricomi's count in Whittaker parameters: Buchholz (17.15), §17.3,
p. 189), and Wimp's theorem (Wimp 1965): for real `a`, `b` with `2a − b > −1`,
`U(a, b, z) ≠ 0` for `|ph z| ≤ π/2`, `z ≠ 0` (`kummerU_ne_zero`).

*Needs:* Layers 1, 3, 5; 6.2 (13.6.10, for the counterexample).

### 9.3 Whittaker functions

DLMF §13.22 without 13.22.1: the zeros of `M_{κ,μ}` away from `0` are those of
`M(½ + μ − κ, 1 + 2μ, ·)` and the zeros of `W_{κ,μ}` are those of `U(½ + μ − κ, 1 + 2μ, ·)`
(Buchholz §17, pp. 179–189, works in these parameters throughout).

*Needs:* 1.6, 9.1–9.2.

### Examples

- 13.9.1 at `a = −1`, `b = 1`: `M(−1, 1, x) = 1 − x` has the single positive zero `x = 1`.
- 13.9.2 at `a = 1`, `b = 2`: `M(1, 2, x) = (e^x − 1)/x > 0` for `x > 0`.

### Dependencies

Layers 1, 3–6; SpecialFunctionsBessel 10.1; QuantumFoundations §9.4; LaguerreJacobi.

## Downstream consumers

- A roadmap for the large-parameter and uniform expansions of the confluent functions (DLMF
  §§13.8, 13.20–13.21) consumes Layers 1–5 with the Bessel, Airy and parabolic cylinder roadmaps.
- The formulas through the Gauss function off its disk of convergence (DLMF 13.4.8, 13.4.12,
  13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4) belong to a roadmap that consumes both this
  roadmap and [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md), as
  that roadmap also says.
- A roadmap for the Charlier polynomials consumes Layers 1–4 and 6.4 for DLMF 13.6.20.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material on the confluent functions is outside this roadmap. It is recorded only
to fix the boundary. Contributors should not attempt it under this roadmap.
- **Large-parameter and uniform asymptotics**: DLMF 13.8.2–13.8.18, §13.20 beyond 13.20.1 and
  §13.21, and what rests on them: the zeros for large parameters 13.9.8, 13.9.10, 13.9.16 and
  13.22.1. They need Watson's lemma for loop integrals, the uniform approximations through
  parabolic cylinder, Bessel and Airy functions (DLMF §§2.4(v)–(vi) and 2.8(iii)–(vi)) and
  Temme's expansions in Bessel functions, which AsymptoticExpansions excludes. Olver (Ch. 12
  §7.3, p. 452) treats the large-`κ` zeros of `M_{κ,μ}`.
- **Formulas through the Gauss function off its disk of convergence**: DLMF 13.4.8, 13.4.12,
  13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4. They need `₂F₁` continued to `ℂ \ [1, ∞)`,
  which SpecialFunctionsHypergeometric provides, and belong to a roadmap that consumes both.
- **Charlier polynomials**: DLMF 13.6.20, which belongs to an orthogonal-polynomial roadmap. The
  Laguerre relation 13.6.19 is an input from QuantumFoundations §9.4, with the polynomials of
  LaguerreJacobi, and 13.18.17 is a target here (6.4).
- **Coulomb functions**: DLMF §13.6(vii) and §13.18(vi) contain no formulas, only pointers to
  DLMF 33.2.3–33.2.8 and 33.14.4–33.14.7.
  [QuantumFoundations §9.5](../QuantumFoundations/README.md#95-coulomb-wave-functions-and-the-hydrogen-atom)
  defines `F_ℓ` and `H_ℓ^±` through `M` and `U` (DLMF 33.2.4 and 33.2.7) and owns these relations.
- **The generalized hypergeometric `₂F₀`** in 13.6.21 when neither `a` nor `a − b + 1` is a
  nonpositive integer (DLMF §16.5), which belongs to a roadmap for the generalized hypergeometric
  functions.
- **Error bounds and exponentially improved expansions**: DLMF 13.7.4–13.7.13 and their Whittaker
  analogues mentioned in §13.19. The error bounds use the regions of DLMF Figure 13.7.1 from Olver
  (1991b), and the exponentially improved expansions rest on the remainder theory of DLMF §2.11.
- **Asymptotics of complex zeros**: the large `z`-zeros 13.9.9 of `M` and the two strings of
  `b`-zeros of `U`.
- **Integral transforms**: the Whittaker transform pair 13.23.13–13.23.14 and the transforms cited
  in §§13.10(vi) and 13.23(v).
- **Physical applications and numerical computation** (DLMF §§13.27–13.32).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/Confluent/` provides source material for most layers, with a coverage table in
`DLMF/Confluent/DLMFCoverage.md`. That development defines `U` at integer `b` by `limUnder` and
the branches off the principal sheet by a separate function on the logarithmic plane; this
roadmap defines the integer case through `deriv` in `b` and the branches through `kummerULog`,
with the limit forms as theorems.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source contains both proved theorems and admitted statements, and serves as a
reference, not as a specification. The following secondary provenance map records source
counterparts; the mathematical targets and dependencies are specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `Confluent/Basic/KummerM`, `Confluent/Basic/Tricomi`, `Confluent/Basic/Whittaker`, `Confluent/Confluence`, `Confluent/Singularities`, `Confluent/JointRegularizedParameters`, `Confluent/Continuation`, `Confluent/LogSeries`, `Confluent/Regularized` |
| 2 | `Confluent/IntegralRepresentations/*`, `Confluent/TricomiLaplace`, `Confluent/TricomiRotated`, `Confluent/BarnesContours` |
| 3 | `Confluent/BasicProperties/*`, `Confluent/ConnectionWronskians` |
| 4 | `Confluent/Recurrence/*`, `Confluent/Basic/KummerContiguous`, `Confluent/ContinuedFractions` |
| 5 | `Confluent/Asymptotics/LargeArgument`, `Confluent/AsymptoticConsequences`, `Confluent/KummerDecay` |
| 6 | `Confluent/Relations`, `Confluent/ParabolicCylinder/*`, `Confluent/ExpIntegral`, `Confluent/ErrorFunctions`, `Confluent/IncompleteGamma`, `Confluent/Series`, `Confluent/WhittakerBuchholz` |
| 7 | `Confluent/ProductsAddition` |
| 8 | `Confluent/Integrals/*` |
| 9 | `Confluent/Zeros/RealZeros`, `Confluent/ZeroTools` |

## References

- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapter 4.
- R. Beals and R. Wong, *Special Functions: A Graduate Text*, Cambridge University Press, 2010,
  Chapter 6.
- H. Buchholz, *The Confluent Hypergeometric Function*, Springer, 1969, Sections 1–3, 5, 7,
  10–11 and 17 and Appendix I.
- W. Gautschi, Computational aspects of three-term recurrence relations, *SIAM Rev.* 9 (1967),
  24–82.
- G. Kristensson, *Second Order Differential Equations: Special Functions and Their
  Classification*, Springer, 2010, Chapter 7.
- N. N. Lebedev, *Special Functions and Their Applications*, Dover, 1972, Chapter 9.
- W. Magnus, F. Oberhettinger and R. P. Soni, *Formulas and Theorems for the Special Functions
  of Mathematical Physics*, 3rd ed., Springer, 1966, Chapters VI and VII.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 13
  (A. B. Olde Daalhuis), <https://dlmf.nist.gov/13>. Every DLMF equation number refers to this
  release.
- F. W. J. Olver, *Asymptotics and Special Functions*, Academic Press, 1974; reprinted A K
  Peters, 1997, Chapter 7, Chapter 8 §6 and Chapter 12 §7.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, Chapters 4, 7, 9 and 13.
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, reprinted 1996, Chapter XVI and §17.71.
- J. Wimp, On the zeros of a confluent hypergeometric function, *Proc. Amer. Math. Soc.* 16
  (1965), 281–283.
