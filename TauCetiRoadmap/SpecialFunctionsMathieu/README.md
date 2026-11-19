# Roadmap: Mathieu functions and Hill's equation

**Summary.** This roadmap builds the theory of linear differential equations with a periodic
coefficient as a library: Hill's equation `w″ + (λ + Q(x)) w = 0` with a continuous real
`π`-periodic `Q`, Mathieu's equation

```text
w″ + (a − 2q cos 2z) w = 0,
```

its modified form `w″ − (a − 2q cosh 2z) w = 0`, and the three-term equations of Whittaker–Hill
and Ince. Its organization follows the structure of the subject rather than any one text. The
equations and their basic solutions come first, with the separation of the Helmholtz equation in
elliptic coordinates that produces them. Floquet theory, Hill's infinite determinant and stability
follow, for Hill's and Mathieu's equations together. The spectral theory on one period (the
discriminant, the periodic and antiperiodic eigenvalues, the characteristic values `a_n(q)`,
`b_n(q)` and the band functions `λ_ν(q)`) precedes the eigenfunctions, so that the
Mathieu functions of integer and of noninteger order are built from one spectral picture. The
integral operators and the expansion theorems, the dependence on `q`, the Whittaker–Hill and Ince
equations and the modified functions close the roadmap. The content is drawn from
Whittaker–Watson (Ch. XIX), Levitan–Sargsjan (*Sturm–Liouville and Dirac Operators*, Chs. 1–2),
Kato (*Perturbation Theory for Linear Operators*, §§II.1, VII.3), Hale–Koçak (*Dynamics and
Bifurcations*, §8.6), Arnold (*Geometrical Methods in the Theory of Ordinary Differential
Equations*, §26), Courant–Hilbert (Vol. I, Ch. V), Temme (*Special Functions*, §10.2),
Kristensson (*Second Order Differential Equations*, §8.6) and the NIST *Digital Library of
Mathematical Functions* (DLMF), and each headline cites its sources; see
[References](#references).

Neither Mathlib nor Tau Ceti has any of this theory. Mathlib has the real-variable existence and
uniqueness theorems for ODEs, Fourier series on `AddCircle`, `Complex.besselJ`, the Laplacian
`Laplacian.laplacian`, and determinants. Tau Ceti has global solutions of linear systems with
continuous coefficients (`TauCeti.dysonSeries`), a real Wronskian lemma, decay of Fourier
coefficients of functions holomorphic in a strip, the spectral theorem for compact self-adjoint
operators (`ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`), Hadamard's bound for
determinants, Rouché's theorem and Puiseux factorization of monic polynomial families.

The roadmap covers:
- the equations and their basic solutions: Hill's equation on `ℝ`, Mathieu's equation in the
  complex domain with solutions entire in `(z, a, q)`, their symmetries, the elliptic coordinates
  that separate the Helmholtz equation into Mathieu's and the modified equation, and the
  algebraic forms (Layer 1);
- Floquet theory: the monodromy matrix, Floquet's theorem, the characteristic exponent `ν`,
  Hill's infinite determinant, the coexistence theorem of Ince, and stability (Layer 2);
- the spectral theory on one period: separated Sturm–Liouville problems, the growth and
  variation of the discriminant, the periodic and antiperiodic eigenvalues with their interlacing,
  the gap and zero theorems, the characteristic values `a_n(q)`, `b_n(q)` and the band functions
  `λ_ν(q)` (Layer 3);
- the eigenfunctions: `ce_n(z, q)`, `se_n(z, q)` with their normalization, orthogonality, zeros
  and Fourier series, the second solutions `fe_n(z, q)`, `ge_n(z, q)`, and the Floquet
  eigenfunctions `me_ν(z, q)`, `ce_ν(z, q)`, `se_ν(z, q)` with their Fourier series (Layer 4);
- the equations of Whittaker–Hill and Ince, the Ince polynomials and the paraboloidal wave
  functions (Layer 5);
- integral operators and expansions: the expansion theorem for Hill's equation, the integral
  equations satisfied by `ce_n(z, q)`, `se_n(z, q)`, and the expansions in Mathieu functions of
  integer and of noninteger order (Layer 6);
- the dependence on `q`: holomorphy near `q = 0` and the Taylor coefficients, the strict ordering
  and the band edges, the continued fractions, the continuation to complex `q` with its
  exceptional values, and the sum rules (Layer 7);
- the modified Mathieu functions `Ce, Se, Me, Fe, Ge`, `M^{(j)}_ν`, the radial functions
  `Mc^{(j)}_n, Ms^{(j)}_n` and `Ie_n, Io_n, Ke_n, Ko_n`: behaviour at infinity, Wronskians,
  connection formulas, expansions in Bessel functions and in cross-products of Bessel functions,
  and integral representations (Layer 8).

The roadmap rests on Mathlib, Tau Ceti and two roadmaps:
[AsymptoticExpansions](../AsymptoticExpansions/README.md) for linear equations in the complex
domain, and [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md) for `Y_ν`, the Hankel
functions, `I_ν`, `K_ν`, their behaviour for large argument, and Sturm comparison.

Suggested home: `TauCeti/Analysis/SpecialFunctions/Mathieu/` for the Mathieu functions and
`TauCeti/Analysis/ODE/Hill.lean` for Hill's equation.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Periodic equations and their basic solutions** (1.1–1.4).
2. **Floquet theory, Hill's determinant and stability** (2.1–2.5).
3. **Spectral theory on one period** (3.1–3.5).
4. **Eigenfunctions and their Fourier series** (4.1–4.5).
5. **Hill equations with two cosine terms** (5.1–5.2).
6. **Integral operators and eigenfunction expansions** (6.1–6.4).
7. **Dependence on `q`** (7.1–7.5).
8. **Modified Mathieu functions** (8.1–8.5).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose. The `**Checks.**` and `### Examples` of each layer
are statements to prove; they test the conventions on explicit values.

**Inputs.** Cases of the targets that Mathlib or Tau Ceti already proves are inputs, not targets:
- existence and uniqueness for linear systems with continuous coefficients on `ℝ`: Tau Ceti's
  `TauCeti.dysonSeriesLeft` and Mathlib's `ODE_solution_unique`, consumed in 1.1;
- the constancy of the real Wronskian: Tau Ceti's `TauCeti.wronskian_eq_of_hasDerivAt`, whose
  complex-valued version is a target (1.1);
- the Hilbert basis of eigenvectors of a compact symmetric operator: Tau Ceti's
  `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`, consumed in 6.1;
- Hadamard's bound `|det A| ≤ ∏ᵢ ∑ⱼ |Aᵢⱼ|`: Tau Ceti's `Matrix.abv_det_le_prod_sum_abv`, consumed
  for the infinite determinants of 2.3.

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
provides in this form:
- linear second-order equations on `ℝ` with complex-valued continuous coefficients: complex
  Wronskians and the variation formula for the discriminant (1.1, 3.2);
- holomorphic dependence on parameters of the entire solutions of a linear equation with entire
  coefficients, and joint analyticity in `(z, a, q)` (1.2);
- the Laplacian of `f ∘ φ` for holomorphic `φ`, `Δ(f ∘ φ) = |φ′|² (Δf) ∘ φ` (1.4);
- infinite determinants `det(1 + B)` with `∑ |Bᵢⱼ| < ∞`, as limits of the symmetric
  truncations (2.3);
- separated Sturm–Liouville problems on a compact interval with a continuous potential: real
  simple eigenvalues, their ordering and Sturm's oscillation count (3.1), resting on the Sturm
  comparison theorem of SpecialFunctionsBessel;
- compactness of an integral operator with continuous kernel on `L²` of a compact interval (6.1);
- the limit of finite continued fractions with complex entries for the tails of a three-term
  recurrence with a minimal solution (7.3);
- the Bessel functions continued along a logarithm of their argument, `𝒞_μ⟨L⟩` of
  [Conventions](#conventions), and their agreement with the principal values (8.4).
  SpecialFunctionsBessel works on the principal sheet and leaves the other sheets outside its
  scope; this roadmap owns only these continued series and the facts 8.4 uses.

**What it does not own:**
- *The ordinary-point theorem and the irregular singularity of rank one.* These are
  AsymptoticExpansions §10.2 and §10.4; this roadmap applies them (1.2, 8.1, 8.2).
- *Bessel functions.* `J_ν` is Mathlib's `Complex.besselJ`; `Y_ν`, `H^{(1,2)}_ν`, `I_ν`, `K_ν` and
  their large-argument behaviour are SpecialFunctionsBessel's. This roadmap consumes them in
  Layer 8 and in 6.2.
- *Sturm comparison.* SpecialFunctionsBessel owns the Sturm comparison theorem on an open interval
  (an auxiliary result of its 10.1); 3.1 and 3.3 apply it with `p = 1`.
- *Self-adjoint realizations of Sturm–Liouville operators.* OperatorTheory/UnboundedOperators
  §4.8 owns the general Sturm–Liouville expression with endpoint classification and Weyl's
  alternative. This roadmap proves only what Hill's and Mathieu's equations need on compact
  intervals and the circle, by elementary means, and consumes nothing from there.
- *Separation of variables as a theory of coordinate systems.* 1.4 owns only the elliptic
  coordinates of the plane and the product solutions they give; the general theory of separable
  coordinates and the spheroidal and ellipsoidal systems are outside.
- *The Mathieu groups.* `M₁₁, …, M₂₄` (Rank24LatticeConstructions, CFSGBasicProperties) are
  unrelated to this roadmap despite the name.

**The boundary in one sentence:** this roadmap owns Hill's equation with a continuous periodic
coefficient on `ℝ`, Mathieu's equation and its modified form, the Whittaker–Hill and Ince
equations, the functions and characteristic values named in [Conventions](#conventions), Hill's
determinant, the elliptic-coordinate separation, and the results stated through them, Bessel
functions and elementary functions, as listed in the layers; it consumes the Bessel functions and
Sturm comparison of SpecialFunctionsBessel and the local theory of linear equations of
AsymptoticExpansions.

## Conventions

- **Names.** Everything lives in the namespace TauCeti. Functions take their parameters first
  and their variable last, so that `mathieuCe n q` is the function `z ↦ ce_n(z, q)`:

```text
hillWI Q λ x, hillWII Q λ x          : (ℝ → ℝ) → ℂ → ℝ → ℂ       w_I, w_II of Hill's equation
hillDiscriminant Q λ                 : (ℝ → ℝ) → ℂ → ℂ           Δ(λ)
hillPeriodicEigenvalue Q n           : (ℝ → ℝ) → ℕ → ℝ           λ_n
hillAntiperiodicEigenvalue Q n       : (ℝ → ℝ) → ℕ → ℝ           μ_{n+1}
mathieuWI a q z, mathieuWII a q z    : ℂ → ℂ → ℂ → ℂ             w_I(z; a, q), w_II(z; a, q)
mathieuHillDet a q N                 : ℂ → ℂ → ℕ → ℂ             Hill's determinant, truncated
mathieuA n q, mathieuB n q           : ℕ → ℝ → ℝ                 a_n(q), b_n(q)
mathieuCe n q z, mathieuSe n q z     : ℕ → ℝ → ℂ → ℂ             ce_n(z, q), se_n(z, q)
mathieuFourierA n k q, mathieuFourierB n k q : ℕ → ℕ → ℝ → ℝ     A^n_k(q), B^n_k(q)
mathieuFe n q z, mathieuGe n q z     : ℕ → ℝ → ℂ → ℂ             fe_n, ge_n
mathieuFeC n q, mathieuGeS n q       : ℕ → ℝ → ℝ                 C_n(q), S_n(q)
mathieuLambda ν q                    : ℝ → ℝ → ℝ                 λ_ν(q)
mathieuMe ν q z                      : ℝ → ℝ → ℂ → ℂ             me_ν(z, q)
mathieuCeNu ν q z, mathieuSeNu ν q z : ℝ → ℝ → ℂ → ℂ             ce_ν, se_ν, ν ∉ ℤ
mathieuCoeff ν m q                   : ℝ → ℤ → ℝ → ℝ             c^ν_{2m}(q)
modifiedMathieuM j ν h z             : ℕ → ℝ → ℝ → ℂ → ℂ         M^{(j)}_ν(z, h), j = 1, …, 4
```

  and the derived names `modifiedMathieuCe`, `modifiedMathieuSe`, `modifiedMathieuMe`,
  `modifiedMathieuFe`, `modifiedMathieuGe`, `radialMathieuMc`, `radialMathieuMs`; the functions
  `Ie_n, Io_n, Ke_n, Ko_n` and the Ince polynomials take names of the same pattern. Derivatives
  are Mathlib's `deriv`; no derivative functions are introduced.
- **The parameters.** `a`, `q` and `z` are complex in Layers 1–2. From Layer 3 on, the
  characteristic values and the eigenfunctions are functions of **real** `q`; the continuation to
  complex `q` is the content of 7.4. In Layer 8, `h > 0` and `q = h²` except where stated. DLMF's
  `ν̂` is the principal solution of `cos πν = w_I(π; a, q)` and is used only in statements.
- **Other normalizations of the equation.** Whittaker–Watson (§19.1, p. 406) write
  `u″ + (a + 16q cos 2z) u = 0`, so their `q` is `−q/8` here; Kato (Example VII-3.4, p. 389)
  writes `u″ + (λ + 2κ cos 2x) u = 0`, so `κ = −q`; Hale–Koçak (Example 8.24, p. 259) use the
  period `1`; Levitan–Sargsjan (§1.4, p. 17) write `y″ + (λ − q(x)) y = 0` with period `a`, so
  their `q` is `−Q` here, their `ϑ`, `φ` are `w_I, w_II` and their `F(λ)` is `Δ(λ)`. Kristensson
  (§8.6.3, p. 161) lists these forms side by side.
- **The basic solutions.** `hillWI Q λ`, `hillWII Q λ` are the `C²` solutions on `ℝ` with initial
  values `(1, 0)` and `(0, 1)` at `0`. `mathieuWI a q` is the unique entire `w` with
  `w″ + (a − 2q cos 2z) w = 0`, `w(0) = 1`, `w′(0) = 0`; `mathieuWII a q` the one with
  `w(0) = 0`, `w′(0) = 1` (DLMF 28.2.5). In Lean either may be defined by choice from the
  existence and uniqueness theorem of 1.2, or as the sum of the Taylor series whose coefficients
  are fixed by the recursion; 1.2 proves the two agree.
- **The `m`-th smallest element.** For `S : Set ℝ`, `nthLeast S 0 = sInf S` and
  `nthLeast S (m + 1) = sInf (S ∩ Ioi (nthLeast S m))`. It is used only for sets that 3.1 and 3.4
  prove closed, discrete, bounded below and infinite, where it is the `m`-th element in increasing
  order, counted from `0`.
- **Hill's eigenvalues.** `λ_n` is the `n`-th root of `Δ − 2` and `μ_{n+1}` the `n`-th root of
  `Δ + 2`, both counted from `0` with multiplicity (DLMF 28.29.16–28.29.17). Levitan–Sargsjan
  (p. 20) count the antiperiodic ones from `μ₀`; their `μ_k` is `μ_{k+1}` here.
- **Characteristic values.** For real `q`:

```text
a_{2m}(q)   = nthLeast {a : ℝ | w_I′(π/2; a, q) = 0} m
a_{2m+1}(q) = nthLeast {a : ℝ | w_I(π/2; a, q) = 0} m
b_{2m+1}(q) = nthLeast {a : ℝ | w_II′(π/2; a, q) = 0} m
b_{2m+2}(q) = nthLeast {a : ℝ | w_II(π/2; a, q) = 0} m
```

  (DLMF Table 28.2.1, 28.2.21–28.2.22). `mathieuB 0 q = 0`; no theorem concerns it.
- **Eigenfunctions and signs.** For real `q`,

```text
ce_n(z, q)  = ce_n(0, q) · w_I(z; a_n(q), q),
ce_n(0, q)  = (π / ∫₀^{2π} w_I(x; a_n(q), q)² dx)^{1/2} > 0,
se_n(z, q)  = se_n′(0, q) · w_II(z; b_n(q), q),
se_n′(0, q) = (π / ∫₀^{2π} w_II(x; b_n(q), q)² dx)^{1/2} > 0,
```

  and `se_0 = 0`. This is the normalization of DLMF 28.2.30; DLMF fixes the sign by continuity
  in `q` from the values at `q = 0`. Since `ce_n(0, q)` and `se_n′(0, q)` never vanish (an even
  solution with `w(0) = 0` is `0`), the two conventions agree; 4.1 proves it. Whittaker–Watson
  (§19.3, p. 410) normalize instead by the coefficient of `cos nz` or `sin nz` being `1`.
- **Second solutions.** For real `q ≠ 0` put
  `t_n(q) = (−1)ⁿ w_II(π; a_n(q), q) / (π ce_n(0, q))`, nonzero by Ince's theorem,
  `f_n = w_II(·; a_n(q), q)/t_n − z ce_n`, and
  `C_n(q) = sign(t_n(q)) (π / ∫₀^{2π} f_n(x, q)² dx)^{1/2}`, `fe_n = C_n (z ce_n + f_n)`.
  Symmetrically `t′_n(q) = (−1)ⁿ w_I′(π; b_n(q), q) / (π se_n′(0, q))`,
  `g_n = w_I(·; b_n(q), q)/t′_n − z se_n`, `S_n = sign(t′_n) (π/∫₀^{2π} g_n²)^{1/2}`,
  `ge_n = S_n (z se_n + g_n)`. So `fe_n′(0, q) > 0` and `ge_n(0, q) > 0`. At `q = 0` the values are
  those of DLMF 28.5.7: `fe_0 = z`, `fe_n = sin nz`, `ge_n = cos nz`, with `C_0(0) = √2`,
  `C_n(0) = S_n(0) = 0` (`n ≥ 1`) and `f_n(·, 0) = g_n(·, 0) = 0`: for `n = 0` the formula gives
  `f₀(·, 0) = 0`, and for `n ≥ 1`, where it would divide by `t_n(0) = 0`, `f_n` and `g_n` are
  defined to be `0` at `q = 0`. For `n ≥ 1` this is DLMF's sign rule ("`C_n f_n → sin nz`");
  for `n = 0` DLMF fixes no sign, and the roadmap takes `C_0 > 0`.
- **Noninteger order.** For real `ν ∉ ℤ` and real `q`, with `k = ⌊|ν|⌋`,
  `λ_ν(q) = nthLeast {a : ℝ | w_I(π; a, q) = cos πν} k`, and for `ν = m ∈ ℤ`, `λ_m = a_m`
  (`m ≥ 0`), `λ_m = b_{−m}` (`m < 0`) (DLMF 28.12.3). With `a = λ_ν(q)`,

```text
me_ν(z, q) = me_ν(0, q) · (w_I(z; a, q) + i sin(πν)/w_II(π; a, q) · w_II(z; a, q)),
me_ν(0, q) = (π / ∫₀^π |w_I(x) + i sin(πν)/w_II(π) · w_II(x)|² dx)^{1/2} > 0,
```

  `ce_ν = ½(me_ν(z) + me_ν(−z))`, `se_ν = −½ i (me_ν(z) − me_ν(−z))` (DLMF 28.12.12–28.12.13),
  and `me_n = √2 ce_n`, `me_{−n} = −√2 i se_n` (DLMF 28.12.11). 4.4 proves
  `w_II(π; λ_ν(q), q) ≠ 0` and that this is the normalization DLMF 28.12.5 with DLMF's continuity
  sign. `c^ν_{2m}(q) = (1/π) ∫₀^π me_ν(x, q) e^{−i(ν+2m)x} dx`.
- **Modified functions.** For real `ν` and `h > 0`, `M^{(3)}_ν(·, h)` is the unique solution
  of `w″ − (λ_ν(h²) − 2h² cosh 2z) w = 0` with `M^{(3)}_ν(x, h) / H^{(1)}_ν(2h cosh x) → 1` as
  `x → +∞` through reals, `M^{(4)}_ν` the one with `H^{(2)}_ν`, and
  `M^{(1)} = ½(M^{(3)} + M^{(4)})`, `M^{(2)} = (M^{(3)} − M^{(4)})/(2i)` (DLMF 28.20.13–28.20.14).
  The radial functions are `Mc^{(j)}_n = M^{(j)}_n` and `Ms^{(j)}_n = (−1)ⁿ M^{(j)}_{−n}`
  (DLMF 28.20.15–28.20.16). `Ie_n(·, h)`, `Io_n(·, h)` are the multiples of `Ce_n(·, −h²)`,
  `Se_n(·, −h²)` with `Ie_n(x, h)/I_n(2h cosh x) → 1`, and `Ke_n(·, h)`, `Ko_n(·, h)` the solutions
  of `w″ − (a + 2h² cosh 2z) w = 0` (with `a = a_n(−h²)`, resp. `b_n(−h²)`) with
  `Ke_n(x, h)/K_n(2h cosh x) → 1`, as `x → +∞`. These are the normalizations that DLMF's
  definitions 28.20.17–28.20.20 imply (see 8.1).
- **Continued fractions.** `K(b₀; a_k/b_k)_{k≥1}` denotes `lim_{N→∞}` of the finite fraction
  `a₁/(b₁ + a₂/(b₂ + ⋯ + a_N/b_N))`, written out as a `Finset`-recursion; Mathlib's
  `GenContFract` carries the algebra of convergents but no analytic convergence theory. Division
  is Lean's, with `x/0 = 0`, so every statement about a finite fraction carries the hypothesis that
  its partial denominators are nonzero (7.3).
- **Branches.** Powers, square roots and logarithms are principal. `J₀(2√X)` means the entire
  function `∑ (−X)^k/(k!)²` of `X`, so DLMF 28.10.9 needs no branch, and `cos π√a` is the entire
  function `∑ (−π²a)^k/(2k)!` of `a`.
- **Continued Bessel evaluations.** The expansions of 8.4 hold on regions where the argument
  `h e^{±z}`, `2h cosh z` or `2h sinh z` winds around `0`, and there the Bessel factors are
  continued along `z`, not evaluated on the principal branch. For `L ∈ ℂ` (a logarithm of the
  argument) put
  `J_μ⟨L⟩ = ∑_{k≥0} (−1)^k e^{(μ+2k)L} / (2^{μ+2k} k! Γ(μ + k + 1))`, entire in `(μ, L)`;
  `Y_μ⟨L⟩`, `H^{(1,2)}_μ⟨L⟩` from `J_{±μ}⟨L⟩` by DLMF 10.2.3 and 10.4.3 for `μ ∉ ℤ` and by
  continuity in `μ` at the integers; `I_μ⟨L⟩`, `K_μ⟨L⟩` likewise from DLMF 10.25.2 and 10.27.4.
  Then `𝒞_μ⟨L⟩ = 𝒞_μ(e^L)` whenever `|Im L| < π`, and `𝒞_μ⟨L⟩` is entire in `L` (for `Y`, `H`,
  `K`: holomorphic in `L` for each `μ`). Write `𝒞_μ(h e^{±z})` for `𝒞_μ⟨log h ± z⟩`, and for
  `Re z > 0`, `𝒞_μ(2h cosh z)` for `𝒞_μ⟨log h + z + log(1 + e^{−2z})⟩` and `𝒞_μ(2h sinh z)` for
  `𝒞_μ⟨log h + z + log(1 − e^{−2z})⟩` (since `2h cosh z = h e^z (1 + e^{−2z})`), the logarithms
  principal since `|e^{−2z}| < 1`. At integer order `J_n⟨L⟩ = J_n(e^L)` and `I_n⟨L⟩ = I_n(e^L)`
  for all `L`, so the distinction matters only for `Y`, `H`, `K` and for noninteger order. The
  local definition `besselJLog` of `Suggested.lean` is `J_μ⟨L⟩`.

  **Checks.**
  - `J_μ⟨L + 2πi⟩ = e^{2πiμ} J_μ⟨L⟩` for all `μ`, `L`, from the series.
  - At `μ = ½`, `L = 0`: `J_{1/2}⟨2πi⟩ = −J_{1/2}(1) = −0.67139 67071`, whereas the principal
    value `J_{1/2}(e^{2πi}) = J_{1/2}(1) = 0.67139 67071`; principal values lose the sheet.
  - At integer order, `J_n⟨L⟩ = J_n(e^L)` for every `L` (no winding).

- **Corrections to DLMF.** Several printed statements are false, and the roadmap states corrected
  forms; each is checked numerically in the Checks or Examples of its layer:
  - §28.20(iii): the solutions of 28.20.2 are asymptotic to `ζ^{−1/2} e^{±2ihζ}`, not
    `ζ^{1/2}` (8.2);
  - 28.5.6: `C_{2m+1}(−q) = −S_{2m+1}(q)` (4.3);
  - 28.5.5 at `n = 0`, `q = 0`: impossible, and `fe₀(·, q) ↛ fe₀(·, 0)` (4.3);
  - 28.6.16 at `n = 0`: the right side needs a factor `2` (7.3);
  - 28.23.2–28.23.5 with `j = 1`, `ν ∉ ℤ`: valid only where `|cosh z| > 1` (resp. `|sinh z| > 1`);
    checked for 28.23.2, the others following by the same term estimate (8.4);
  - 28.28.11: the factor is `e^{iνπ/2}`, not `e^{iνπ}` (8.5);
  - 28.28.16: the overall sign, and the lower sign belongs to `−π ≤ y ≤ 0` (8.5).

## Exact supplier contracts

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- **Ordinary points**
  ([§10.2](../AsymptoticExpansions/README.md#102-ordinary-points)): for coefficients holomorphic on
  a disc, the initial-value problem has a unique solution holomorphic on the disc, with Taylor
  coefficients given by the recursion. 1.2 applies it on every disc to get entire solutions, and
  8.1 to the modified equation.
- **Irregular singularity of rank one**
  ([§10.4](../AsymptoticExpansions/README.md#104-irregular-singularity-of-rank-one-at-infinity)):
  existence and uniqueness of the solutions with prescribed exponential behaviour, stated there in
  logarithmic coordinates for coefficients that are convergent series in `ζ^{−1}` and for unequal
  roots `λ₁ ≠ λ₂`. 8.2 applies it to the algebraic form 28.20.2 at `ζ = ∞`, whose coefficients
  `ζ/(ζ² − 1)` and `(4qζ² − 2q − a)/(ζ² − 1)` converge for `|ζ| > 1`, with `λ₁,₂ = ±2ih` (unequal
  since `h > 0`) and `μ₁ = μ₂ = −½`, and reads off 28.25.1–28.25.3.

### From [SpecialFunctionsBessel](../SpecialFunctionsBessel/README.md)

- `Y_ν`, `H⁽¹⁾_ν`, `H⁽²⁾_ν`, `I_ν`, `K_ν` with the definitions of its Conventions, their
  equations, recurrences and Wronskians (its Layer 1, with `I_ν`, `K_ν` in its 1.3), used in
  Layer 8 and 6.2.
- The Hankel expansions and the large-argument expansion of `K_ν` (its §6.1) and the
  large-argument forms of `J`, `Y`, `I` (its §6.2), used for the normalizations of 8.1 (`K` for
  `Ke_n, Ko_n`) and for 8.2.
- Holomorphy in the order and the continuation formulas 10.11 (its §§1.2, 1.6), used to show
  that the continued evaluations `𝒞_μ⟨L⟩` of [Conventions](#conventions) agree with the principal
  values on `|Im L| < π` and to read off their values on the other sheets.
- The Jacobi–Anger expansions and Graf's addition theorem (its §§4.1–4.2), used for 8.4 and 8.5.
- Sturm comparison (an auxiliary result of its 10.1): for `p > 0` of class `C¹` and continuous
  `q₁ ≤ q₂` on an open interval, between consecutive zeros of a nontrivial real solution of
  `(p u′)′ + q₁ u = 0` every real solution of `(p v′)′ + q₂ v = 0` vanishes, unless `q₁ = q₂` there
  and `v` is a multiple of `u`. Used with `p = 1` in 3.1 and 3.3.

`Suggested.lean` declares local copies of the Bessel definitions it needs, each with a docstring
naming SpecialFunctionsBessel and its section, with the bodies of that roadmap.

### From Tau Ceti

- `TauCeti.dysonSeries`, `TauCeti.dysonSeriesLeft`, `TauCeti.hasDerivAt_dysonSeriesLeft`
  (`TauCeti/Analysis/ODE/DysonSeries.lean`): global solutions on `ℝ` of `Γ′ = p Γ` for continuous
  `p` with values in a real Banach algebra. 1.1 takes `p(x) = [[0, 1], [−(λ + Q(x)), 0]]` in
  `Matrix (Fin 2) (Fin 2) ℂ`.
- `TauCeti.wronskian_eq_of_hasDerivAt` (`TauCeti/Analysis/ODE/Wronskian.lean`), the real-valued
  constancy of the Wronskian; 1.1 proves the complex-valued version beside it.
- `TauCeti.norm_fourierCoeff_le_of_differentiableOn_strip` (`TauCeti/Analysis/Fourier/Decay.lean`)
  and the uniqueness theorems of `TauCeti/Analysis/Fourier/Uniqueness.lean`: Fourier coefficients
  of a function holomorphic and bounded on a strip decay exponentially; a function with vanishing
  Fourier coefficients vanishes almost everywhere. Used in 2.2, 4.2, 4.5, 6.3.
- `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`
  (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean`): a compact symmetric operator has a Hilbert
  basis of eigenvectors. Used in 6.1.
- `Matrix.abv_det_le_prod_sum_abv` (`TauCeti/LinearAlgebra/Matrix/AbsoluteValue.lean`), Hadamard's
  bound by row sums, and `Matrix.principalMinor` (`TauCeti/LinearAlgebra/Matrix/Minor.lean`). Used
  for the infinite determinants of 2.3.
- `AnalyticAt.exists_analyticAt_eventually_eq_zero_iff` (`TauCeti/Analysis/Analytic/Inverse.lean`),
  the analytic implicit root theorem, and `TauCeti.rouche`
  (`TauCeti/Analysis/Complex/Conformal/Rouche.lean`). Used in 3.2, 3.4, 7.1 and 7.4.
- `TauCeti.Polynomial.exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball`
  (`TauCeti/Analysis/Polynomial/Puiseux/Monic.lean`): a monic degree-`d` family, analytic and
  separable off a hyperplane, splits into analytic linear factors after the substitution `t ↦ tⁿ`
  for any nonzero multiple `n` of `d!`. Used for the Puiseux expansions in 7.4.

### From Mathlib

- `ODE_solution_unique`, `ODE_solution_unique_of_mem_Icc`, `gronwallBound` and
  `norm_le_gronwallBound_of_norm_deriv_right_le`, for uniqueness and the estimates in 1.1, 3.2.
- `HasFPowerSeriesOnBall`, Cauchy's estimates, `AnalyticOnNhd`,
  `TendstoLocallyUniformlyOn.differentiableOn`, for 1.2.
- `Laplacian.laplacian` and `laplacian_eq_iteratedFDeriv_complexPlane`, for 1.4.
- `Matrix.det` and `Matrix.of`, for 2.3.
- `fourierCoeff`, `fourierBasis`, `hasSum_fourier_series_of_summable`, `tsum_sq_fourierCoeff`,
  for 4.2, 6.1, 6.3.
- `IsCompactOperator`, `LinearMap.IsSymmetric`, `MeasureTheory.Lp`, for 6.1.
- `Complex.besselJ` and `Complex.besselJ_neg_int`, for 6.2, 8.4 and 8.5.
- `intervalIntegral` and its change-of-variables lemmas, `Real.cos`, `Complex.cosh`, throughout.

## How to read the build

Layer 1 sets up the equations. Hill's equation is real-variable, with a continuous real
`π`-periodic coefficient; Mathieu's equation is complex, with solutions entire in all three
variables, and restricted to real `x` and real `(a, q)` it is Hill's equation with
`Q(x) = −2q cos 2x`. Layer 1 also derives both Mathieu equations from the Helmholtz equation in
elliptic coordinates, which is where they come from (Whittaker–Watson §19.1). Layer 2 is Floquet
theory: the monodromy matrix and its trace, the characteristic exponent, Hill's determinant as an
explicit formula for the trace, Ince's coexistence theorem and stability. Layer 3 turns the trace
into a spectral picture: the four separated problems on `[0, π/2]` give `a_n`, `b_n` for real `q`,
the bands of Hill's discriminant give the band functions `λ_ν`, and both are read from one
interlacing theorem. Layer 4 builds the eigenfunctions of integer and noninteger order and their
Fourier coefficients from Layer 3. Layer 5 widens the class of equations to the Hill equations
with two cosine terms, of Whittaker–Hill and Ince, whose finite three-term recurrences give
polynomial eigenfunctions and reduce to the Fourier coefficients of Layer 4 in a limit. Layer 6
is the analysis of integral operators: the expansion theorem for Hill's equation, the integral
equations of Mathieu functions, and the expansions in Mathieu functions. Layer 7 studies the
dependence on `q`; it comes after Layer 6 because the continued fraction at `n = 0` uses the
nonvanishing of `A^0_0` proved there. Layer 8 is the modified equation and consumes
SpecialFunctionsBessel.

The harder material is in 3.3 (the interlacing theorem), 7.4–7.5 (the exceptional values and the
sum rules), 8.4 (the cross-product expansions) and 8.5 (the integrals of products).

## Layer 1: periodic equations and their basic solutions

### 1.1 Hill's equation on the real line

Sources: Whittaker–Watson §19.12, p. 406; Levitan–Sargsjan §2.6, p. 66; DLMF 28.29.1,
28.29.4–28.29.5.

Throughout Layers 1–3, `Q : ℝ → ℝ` is continuous with `Q(x + π) = Q(x)`. DLMF 28.29.3 normalizes
`∫₀^π Q = 0` and asks `π` to be the least period; no theorem below needs either, and they are not
hypotheses. For every `λ ∈ ℂ` there are unique `C²` functions `hillWI Q λ`, `hillWII Q λ : ℝ → ℂ`
solving `w″ + (λ + Q(x)) w = 0` with initial values `(1, 0)` and `(0, 1)` at `0`. Prove:
- every solution is `w(0) w_I + w′(0) w_II`;
- the complex Wronskian `w_I w_II′ − w_I′ w_II` is `1` (`hillWI_mul_deriv_hillWII_sub`);
- `w_I(x + π) = w_I(π) w_I(x) + w_I′(π) w_II(x)` and the same for `w_II(x + π)`
  (DLMF 28.29.4–28.29.5);
- for fixed `x`, `λ ↦ w_I(x, λ)`, `w_II(x, λ)` and their `x`-derivatives are entire, with
  `|w(x, λ)| ≤ C e^{|x| |Im √λ|}` uniformly for `|x| ≤ X` and `|λ| ≥ 1`;
- for real `λ` they are real.

The proof takes the `2 × 2` matrix solution `TauCeti.dysonSeriesLeft p` of `Γ′ = p Γ`; its Dyson
terms are polynomials in `λ` bounded on compacts, so the sum is entire in `λ`.

**Checks.**
- For `Q = 0`: `w_I(x, λ) = cos(√λ x)` and `w_II(x, λ) = sin(√λ x)/√λ` (entire in `λ`), and
  `w_II(x, 0) = x`.
- For `Q = 0`, `λ = −1`: `w_I(π, −1) = cosh π = 11.59195 32755`. The sign convention
  `w″ − (λ + Q) w = 0` would give `cos π = −1` here.
- For `Q(x) = −2 cos 2x` and `λ = 1.5`, `w_I(π, 1.5) = −1.56374 29712`, the value of Mathieu's
  `w_I(π; 1.5, 1)` in 1.2.

*Needs:* Tau Ceti `dysonSeriesLeft`, `wronskian_eq_of_hasDerivAt`; Mathlib `ODE_solution_unique`.

### 1.2 Mathieu's equation in the complex domain

Sources: Whittaker–Watson §19.1, p. 406 (every finite point is ordinary); DLMF 28.2.1,
28.2.4–28.2.6 and §28.2(ii).

Prove:
- for all `a, q, w₀, w₁ ∈ ℂ` and `z₀ ∈ ℂ` there is a unique entire solution with `w(z₀) = w₀`,
  `w′(z₀) = w₁`, and it is entire as a function of `(z, a, q) ∈ ℂ³`;
- the basic solutions `w_I, w_II` are entire as functions of `(z, a, q) ∈ ℂ³` (`AnalyticOnNhd ℂ`
  on `ℂ × ℂ × ℂ`; `analyticOnNhd_mathieuWI`);
- `mathieuWI a q` is even, `mathieuWII a q` is odd, and their Wronskian is `1` (DLMF 28.2.6).

Joint analyticity: the Taylor coefficients of `w_I(·; a, q)` at `0` are polynomials in `(a, q)`
determined by the recursion from AsymptoticExpansions §10.2, and a majorant series bounds them
uniformly on polydiscs, so the triple series converges absolutely there.

**Checks.**
- At `q = 0`: `w_I = cos √a z`, `w_II = sin(√a z)/√a` (entire in `a`), `w_I(π; a, 0) = cos π√a`.
- `w_I(π; 1.5, 1) = −1.56374 29712` and `w_I(π; 3, 1) = 0.51331 05431`.
- `w_I(π/2; 1.5, 1) = 0.25122 98342` and `w_I(π/2; 1.5, −1) = −1.12196 66108`: the identity
  `w_I(π; a, q) = w_I(π; a, −q)` of 1.3 holds at `z = π`, not pointwise.

*Needs:* AsymptoticExpansions §10.2; Mathlib `HasFPowerSeriesOnBall`.

### 1.3 Symmetries, translations and the half-period identities

Sources: Whittaker–Watson §19.3, Example 3, p. 411; DLMF 28.2.7–28.2.13, 28.2.16 (second
equality).

Prove:
- the substitutions `z ↦ −z`, `z ↦ z ± π` and `(z, q) ↦ (z ± π/2, −q)` map solutions to solutions;
- the translation and half-period formulas DLMF 28.2.7–28.2.13 for complex `a, q`; in particular
  `w_I(π) − 1 = 2 w_I′(π/2) w_II(π/2)`, `w_I(π) + 1 = 2 w_I(π/2) w_II′(π/2)`,
  `w_I′(π) = 2 w_I(π/2) w_I′(π/2)`, `w_II(π) = 2 w_II(π/2) w_II′(π/2)`;
- `w_I(π; a, q) = w_I(π; a, −q)` (`mathieuWI_pi_neg`);
- `w_I(π; a, q)` is an entire function of `(a, q²)`.

The half-period formulas come from the Wronskian and parity: `w(z + π)` is a solution, expanded
in `w_I, w_II` by its values at `z = −π/2`.

*Needs:* 1.2.

### 1.4 Elliptic coordinates and the algebraic forms

Sources: Whittaker–Watson §19.1, pp. 404–406, and §19.5, p. 417; Courant–Hilbert Vol. I,
Ch. V §16.3, pp. 391–392; Temme §10.2.3, pp. 263–264; Kristensson §8.6.3, p. 161; DLMF
28.2.2–28.2.3, 28.20.1–28.20.2.

The elliptic coordinates of the plane are `x + iy = c cosh(ξ + iη)` with `c > 0`, so that
`x = c cosh ξ cos η`, `y = c sinh ξ sin η`. Prove:
- **the conformal Laplacian**: for `φ : ℂ → ℂ` holomorphic at `w` and `f : ℂ → ℂ` of class `C²`
  near `φ(w)`, `Δ(f ∘ φ)(w) = |φ′(w)|² (Δf)(φ(w))`, with Mathlib's `Laplacian.laplacian` on `ℂ`
  as a real inner product space (`laplacian_comp_of_analyticAt`);
- **separation**: if `X` solves the modified equation `X″ − (a − 2q cosh 2ξ) X = 0` and `Θ` solves
  Mathieu's equation `Θ″ + (a − 2q cos 2η) Θ = 0`, both entire, then `F(ξ + iη) = X(ξ) Θ(η)`
  satisfies `ΔF + 4q |sinh(ξ + iη)|² F = 0` (`laplacian_mul_mathieu`);
- **the Helmholtz equation**: if moreover `c > 0`, `k` is real, `q = c²k²/4`, and
  `f(c cosh w) = F(w)` for `w` near a point `w₀` with `sinh w₀ ≠ 0`, with `f` of class `C²` near
  `c cosh w₀`, then `Δf + k² f = 0` at `c cosh w₀` (`laplacian_add_sq_mul_of_mathieu`);
- `w` solves Mathieu's equation iff `z ↦ w(iz)` solves the modified equation;
- **the algebraic forms**: if `w` solves Mathieu's equation on `ℂ` and `g` is holomorphic on an
  open `U` with `sin² g(ζ) = ζ` there, then `u = w ∘ g` solves DLMF 28.2.2,
  `ζ(1 − ζ) u″ + ½(1 − 2ζ) u′ + ¼(a − 2q(1 − 2ζ)) u = 0`, on `U` (`mathieu_sin_sq_form`); with
  `cos g(ζ) = ζ` instead, `u` solves DLMF 28.2.3, `(1 − ζ²) u″ − ζ u′ + (a + 2q − 4qζ²) u = 0`
  (`mathieu_cos_form`); and if `w` solves the modified equation and `cosh g(ζ) = ζ`, `u` solves
  DLMF 28.20.2, `(ζ² − 1) u″ + ζ u′ + (4qζ² − 2q − a) u = 0` (`modifiedMathieu_cosh_form`);
- DLMF 28.2.2 has regular singularities at `0` and `1` with exponents `0` and `½`
  (AsymptoticExpansions §10.3) and an irregular singularity of rank one at `∞`.

The separation is the identity `cosh 2ξ − cos 2η = 2(sinh² ξ + sin² η) = 2 |sinh(ξ + iη)|²`, and
`|d(c cosh w)/dw|² = c² |sinh w|²`. Whittaker–Watson and Courant–Hilbert reach Mathieu's equation
this way from the vibrating elliptic membrane, Temme from the Helmholtz equation in elliptic
cylinder coordinates; Whittaker–Watson §19.5 uses Lindemann's variable `ζ = cos² z`, which is
DLMF 28.2.2 after `z ↦ z + π/2`, and Kristensson obtains the form in `ζ = cos z` as a case of the
spheroidal equation.

**Checks.**
- `a = n²`, `q = 0`: `X = cosh nξ`, `Θ = cos nη`, and `F = Re cosh(n(ξ + iη))` is harmonic, as the
  separation identity says for `q = 0`.
- `|sinh(ξ + iη)|² = sinh² ξ + sin² η`; at `ξ = 0` it vanishes at `η = 0, π`, the foci `±c`, where
  the coordinates are singular and the Helmholtz conclusion needs `sinh w₀ ≠ 0`.
- With the modified equation written `X″ + (a − 2q cosh 2ξ) X = 0` instead, the product
  `X(ξ)Θ(η)` gives `ΔF = −2(a − q cosh 2ξ − q cos 2η) F`, which is not a multiple of
  `|sinh w|² F`: the sign in the modified equation is forced.

*Needs:* 1.2; AsymptoticExpansions §10.3 (for the classification of the singular points); Mathlib
`Laplacian.laplacian`, `laplacian_eq_iteratedFDeriv_complexPlane`.

### Examples

- `w_I(π; a, q)` for `q = 1` at `a = 1.5` and `a = 3` takes the values `−1.56374 29712` and
  `0.51331 05431`, both computed by integrating the equation; the first lies outside `[−1, 1]`.

### Dependencies

AsymptoticExpansions §§10.2–10.3; Tau Ceti ODE results; Mathlib ODE uniqueness and the Laplacian.

## Layer 2: Floquet theory, Hill's determinant and stability

### 2.1 Monodromy and Floquet's theorem for Hill's equation

Sources: Whittaker–Watson §19.4, pp. 412–413; Levitan–Sargsjan §2.6, pp. 66–68; Arnold §26.A,
p. 195; DLMF 28.29.6–28.29.15.

Let `M(λ)` be the monodromy matrix `[[w_I(π), w_II(π)], [w_I′(π), w_II′(π)]]` and
`Δ(λ) = w_I(π, λ) + w_II′(π, λ)` (`hillDiscriminant`). Prove:
- `det M = 1`, so the eigenvalues of `M` are the roots of `μ² − Δ μ + 1`;
- for `ν ∈ ℂ` there is a nontrivial solution with `w(x + π) = e^{iπν} w(x)` iff
  `2 cos πν = Δ(λ)` (`exists_hillFloquet_iff`);
- such a Floquet solution is `e^{iνx} P(x)` with `P` `π`-periodic;
- if `ν ∉ ℤ`, the Floquet solutions for `ν` and `−ν` form a fundamental pair;
- if `ν ∈ {0, 1}`, there is a nontrivial solution `P` of period `π` (`ν = 0`) or `2π` (`ν = 1`);
  every solution `w` independent of `P` has `w(x + π) = (−1)^ν w(x) + c P(x)`, and `c = 0` iff
  `M = (−1)^ν I` (DLMF 28.29.11–28.29.12);
- if some solution has least period `nπ` with `n ≥ 3`, every solution has period `nπ`;
- `w(x + π) + w(x − π) = Δ w(x)` for every solution (DLMF 28.29.13), and a nontrivial solution is a
  Floquet solution for `ν` or `w(x + π) − e^{iνπ} w(x)` is one for `−ν`;
- if `Q` is even, `w_I(x)` is even, `w_II(x)` is odd, `w_I(π) = w_II′(π)` so `cos πν = w_I(π, λ)`
  (DLMF 28.29.14), the half-period identities of 1.3 hold with `Q` in place of `−2q cos 2x`, and
  the `π`-periodic (antiperiodic) solutions are spanned by those of `w_I, w_II` that are.

**Checks.**
- For `Q = 0`, `Δ(λ) = 2 cos π√λ`.
- For `Q(x) = −2 cos 2x`: `Δ(1.5) = −3.12748 59424` and `Δ(3) = 1.02662 10863`.
- The trace of `M²`, the monodromy over `2π`, is `Δ² − 2`, which is `7.78116 83198` at `λ = 1.5`.
  The trace uses `w_II′(π)`, not `w_II(π)`: at `λ = 1.5`, `w_I(π) + w_II(π) = −3.23072 80152`.

*Needs:* 1.1, 1.3.

### 2.2 Characteristic exponents and Floquet solutions of Mathieu's equation

Sources: Whittaker–Watson §§19.4, 19.41, pp. 412–414; DLMF 28.2.14–28.2.20.

Prove:
- for `ν ∈ ℂ` there is a nontrivial solution with `w(z + π) = e^{iπν} w(z)` iff
  `cos πν = w_I(π; a, q)` (`exists_mathieuFloquet_iff`);
- both conditions are equivalent to `e^{iπν}` being an eigenvalue of the matrix DLMF 28.2.15;
- the roots of `cos πν = w_I(π; a, q)` are `±ν̂ + 2n` with `ν̂ = π⁻¹ arccos w_I(π; a, q)`
  (principal), `0 ≤ Re ν̂ ≤ 1`, and a root `ν` is double iff `ν ∈ ℤ`;
- DLMF 28.2.17 and the dichotomy following it;
- the Fourier series `w = ∑_n c_{2n} e^{i(ν+2n)z}` of a Floquet solution converges absolutely and
  locally uniformly on `ℂ`, its coefficients satisfy the three-term recurrence
  `(a − (ν + 2n)²) c_{2n} − q (c_{2n−2} + c_{2n+2}) = 0` (DLMF 28.2.19), and conversely a nontrivial
  solution of the recurrence with `∑ |c_{2n}| < ∞` (DLMF 28.2.20) gives a Floquet solution.

*Needs:* 1.2–1.3, 2.1; Tau Ceti `norm_fourierCoeff_le_of_differentiableOn_strip`.

### 2.3 Hill's infinite determinant

Sources: Whittaker–Watson §§19.41–19.42, pp. 413–417, and §19.61, pp. 422–424 (convergence of
determinants of von Koch's type).

For `a ∉ {4m² : m ∈ ℤ}` let `B(a, q)` be the matrix indexed by `ℤ × ℤ` with
`B_{m,m±1} = −q/(a − 4m²)` and all other entries `0`, and `mathieuHillDet a q N` the determinant of
`1 + B` restricted to `|m|, |n| ≤ N`. Prove:
- **infinite determinants** (auxiliary): for a matrix `B` on `ℤ × ℤ` with `∑ |B_{mn}| < ∞`, the
  determinants of `1 + B` on `[−N, N]²` converge as `N → ∞`, and the limit is the sum of all
  principal minors of `B`, the empty minor counting `1` (`tendsto_det_one_add_of_summable`);
- the limit is holomorphic in parameters on which `B` depends holomorphically with locally
  uniform summability;
- **Hill's formula**: the limit `D(a, q) = lim_N mathieuHillDet a q N` exists for
  `a ∉ {4m² : m ∈ ℤ}`, is holomorphic in `a` there and meromorphic at each `4m²`,
  `w_I(π; a, q) = 1 − D(a, q) (1 − cos π√a)`, and `sin²(πν/2) = D(a, q) sin²(π√a/2)` for every
  characteristic exponent `ν` (`tendsto_mathieuHillDet`).

Whittaker–Watson's proof: the determinant `Δ₁(ν)` of the recurrence of 2.2 divided by
`a − (ν + 2n)²` is even and `2`-periodic in `ν`, tends to `1` as `Im ν → ±∞`, and has at most simple
poles at `ν ≡ ±√a (mod 2)`; subtracting the matching multiple of
`cot(π(ν + √a)/2) − cot(π(ν − √a)/2)` leaves a bounded entire periodic function, which is `1` by
Liouville; the zeros of `Δ₁(ν)` are the characteristic exponents, and evaluating at `ν = 0` gives
the formula. The summability `∑ |q/(a − 4m²)| < ∞` gives the convergence, by Hadamard's bound.

**Checks.**
- At `q = 0`, `D = 1` and the formula is `w_I(π; a, 0) = cos π√a`.
- `D(1.5, 1) = 1.45590 59222` and `D(3, 1) = 1.45772 54716`; with them the formula gives
  `w_I(π; 1.5, 1) = −1.56374 29712` and `w_I(π; 3, 1) = 0.51331 05431`, the values of 1.2. The
  truncation `mathieuHillDet 1.5 1 N` is off by about `6·10⁻⁸` at `N = 100`.
- The factor is `sin²(π√a/2)`, not `sin²(π√a)`: at `q = 0`, `a = 1.5` the latter would give
  `1 − 2 sin²(π√1.5) = 0.15801 75479` instead of `cos π√1.5 = −0.76092 62605`.

*Needs:* 2.2; Tau Ceti `Matrix.abv_det_le_prod_sum_abv`, `Matrix.principalMinor`; Mathlib
`Matrix.det`.

### 2.4 Coexistence of periodic solutions: Ince's theorem

Sources: Whittaker–Watson §19.2, p. 407 (with the attribution to Ince and Hille); DLMF §28.5(i).

Prove **Ince's theorem**: if `q ≠ 0` and a nontrivial solution has period `π` or `2π`, no
independent solution has either period (`ince_theorem`). Prove also its consequence: for `q ≠ 0`
the Floquet solution for a given `ν` is unique up to a factor.

Coexistence of an even and an odd solution of period `π` (or `2π`) with the same `a` makes their
Fourier coefficients two solutions of the same three-term recurrence that both satisfy the
summability of 2.2; such solutions are proportional, and the first equations of DLMF 28.4.5 and
28.4.8 (resp. 28.4.6 and 28.4.7) then force `q = 0`. Two even (or two odd) periodic solutions are
dependent because they agree with a multiple of `w_I(z)` (or `w_II(z)`) by their initial values
at `0`.

*Needs:* 2.2.

### 2.5 Bounded and unbounded solutions

Sources: Hale–Koçak §8.6, Lemma 8.22, p. 258, and Theorem 8.25, p. 259; Levitan–Sargsjan §2.6,
p. 68; DLMF §28.17, 28.29.15.

`(a, q)` is stable if every solution is bounded on `ℝ`. Prove:
- for Hill's equation with real `λ`: if `|Δ(λ)| < 2` every solution is bounded on `ℝ`; if
  `|Δ(λ)| > 2` every nontrivial solution is unbounded;
- if some characteristic exponent `ν` of Mathieu's equation is real and `ν ∉ ℤ`, `(a, q)` is
  stable;
- if `Im ν ≠ 0`, `(a, q)` is unstable and every nontrivial solution is unbounded on `ℝ`; of the
  Floquet solutions for `ν` and `−ν` (2.2), one tends to `0` and the other is unbounded as
  `x → +∞`;
- for real `a`, `q`: `(a, q)` is stable iff `|w_I(π; a, q)| < 1`, or `q = 0` and `a > 0`.

The description of the boundary of the real stable set by the curves `a = a_n(q)`, `b_n(q)` is in
3.4, after the characteristic values are defined.

**Checks.**
- `(1.5, 1)` is unstable (`|w_I(π)| = 1.56 > 1`; it lies between `b₁(1)` and `a₁(1)`), and `(3, 1)`
  is stable (`|w_I(π)| = 0.51`; between `a₁(1)` and `b₂(1)`).
- `q = 0`, `a = 1`: `|w_I(π)| = 1` and every solution is bounded, so the case `q = 0` of the last
  bullet is needed; `q = 0`, `a = 0` is unstable (`w = z`).

*Needs:* 2.1–2.4.

### Examples

- At `q = 0`: `ν̂ = √a` for `0 ≤ a ≤ 1`.
- `D(a, q)` has a pole at `a = 0` for `q ≠ 0` (the entry `B_{0,±1} = −q/a`), but
  `D(a, q)(1 − cos π√a)` is entire in `a`, as the formula requires.

### Dependencies

Layer 1; Tau Ceti Fourier decay and Hadamard's bound.

## Layer 3: spectral theory on one period

### 3.1 Separated Sturm–Liouville problems

Sources: Levitan–Sargsjan §1.3, Theorems 1.3.2–1.3.3, pp. 14–15.

Auxiliary. For a continuous real `V` on `[0, L]` and the four boundary conditions
`w′(0) = w′(L) = 0`, `w′(0) = w(L) = 0`, `w(0) = w′(L) = 0`, `w(0) = w(L) = 0`, prove that the
eigenvalues of `−w″ + V w = a w` are real and simple, form an increasing sequence tending to `∞`,
and that the eigenfunction of the `m`-th eigenvalue has exactly `m` zeros in `(0, L)` (Sturm). The
proof uses the Prüfer angle and SpecialFunctionsBessel's Sturm comparison theorem with `p = 1`;
existence follows from the angle being continuous and strictly increasing in `a`, with limits at
`±∞`.

**Checks.**
- `nthLeast {n² | n : ℕ} 2 = 4`: the count starts at `0`.
- `nthLeast` counts elements of a set, not roots with multiplicity: `nthLeast {0, 4, 16, …} 1 = 4`,
  whereas the multiset `0, 4, 4, 16, 16, …` of 3.3 has `4` at both places `1` and `2`.
- `nthLeast ∅ 0 = sInf ∅ = 0`, a junk value no theorem uses.

*Needs:* 1.1; SpecialFunctionsBessel's Sturm comparison (its 10.1).

### 3.2 Growth and variation of the discriminant

Sources: Levitan–Sargsjan Lemma 1.2.2, p. 6, and §1.4, formulas (4.13)–(4.17) and the proof of
Theorem 1.4.1, pp. 18–21; DLMF 28.29.15.

Prove:
- **growth**: `Δ` is entire, and there is `C` with `|Δ(λ) − 2 cos π√λ| ≤ C e^{π|Im √λ|}/|√λ|` for
  `|λ| ≥ 1` (`hillDiscriminant_growth`);
- `Δ` has order exactly `½`;
- **the variation formula** (`deriv_hillDiscriminant`):

```text
Δ′(λ) = −∫₀^π (w_II(π) w_I(x)² + (w_II′(π) − w_I(π)) w_I(x) w_II(x) − w_I′(π) w_II(x)²) dx;
```

- **monotonicity on the bands**: for real `λ` with `|Δ(λ)| < 2`, `Δ′(λ) ≠ 0`; at a real `λ` with
  `Δ(λ) = ±2` and `Δ′(λ) = 0`, `±Δ″(λ) < 0`; `Δ(λ) → +∞` as `λ → −∞`
  (`hillDiscriminant_band`).

The growth bound comes from Levitan–Sargsjan's estimates of `w_I, w_II` (Lemma 1.2.2, p. 6),
with `C` depending only on `∫₀^π |Q|`; the order follows from it and `Δ(λ) ∼ 2 cosh(π√−λ)` as
`λ → −∞`. The variation formula comes from differentiating the equation in `λ` and variation of
constants (Levitan–Sargsjan (4.13)–(4.16)); on `|Δ| < 2` the quadratic form under the integral is
definite because `w_II(π) w_I′(π) < 0` there (Levitan–Sargsjan, p. 20), and the same form gives
the sign of `Δ″` at a critical point on `|Δ| = 2`.

**Checks.**
- For `Q = 0`: `Δ(λ) = 2 cos π√λ`, `Δ′(λ) = −π sin(π√λ)/√λ`, and the formula gives this with
  `w_I = cos √λx`, `w_II = sin(√λx)/√λ`.
- For `Q = 0`, `Δ(−1) = 2 cosh π = 23.18390 65510`, consistent with `Δ → +∞` as `λ → −∞`.
- At the double root `λ = 4` of `Δ − 2` for `Q = 0`, `Δ′(4) = 0` and `Δ″(4) = −π²/8 < 0`; an
  isolated root with `Δ′ = 0` and `Δ″ > 0` cannot occur on `Δ = 2`.

*Needs:* 1.1, 2.1; Tau Ceti `rouche`.

### 3.3 Periodic and antiperiodic eigenvalues

Sources: Levitan–Sargsjan §1.4, Lemma 1.4.1, p. 18, Theorem 1.4.1, pp. 18–21, Theorem 1.4.2, p. 22,
and Theorem 1.4.3, p. 23; DLMF 28.29.16–28.29.18.

Prove:
- **the eigenvalues**: all roots of `Δ − 2` and `Δ + 2` are real and at most double; a root is
  double iff all solutions are periodic (antiperiodic). With roots counted with multiplicity,
  `hillPeriodicEigenvalue Q n` is the `n`-th root of `Δ − 2` and `hillAntiperiodicEigenvalue Q n`
  the `n`-th root of `Δ + 2`, counted from `0` (DLMF's `λ_n` and `μ_{n+1}`); Hill's equation has a
  nontrivial solution of period `π` iff `λ = λ_n` for some `n`, and of antiperiod `π` iff
  `λ = μ_n`; `λ_n, μ_n → ∞` (`hill_eigenvalues`);
- **interlacing** (DLMF 28.29.18): `λ₀ < μ₁ ≤ μ₂ < λ₁ ≤ λ₂ < μ₃ ≤ μ₄ < λ₃ ≤ λ₄ < ⋯`
  (`hill_interlacing`);
- **the gaps**: let `ν₁ < ν₂ < ⋯` be the eigenvalues of `w(0) = w(π) = 0` (the real roots of
  `w_II(π, ·)`; `hillDirichletEigenvalue Q k` is `ν_{k+1}`) and `τ₀ < τ₁ < ⋯` those of
  `w′(0) = w′(π) = 0` (the real roots of `w_I′(π, ·)`; `hillNeumannEigenvalue Q k` is `τ_k`);
  then `τ₀ ≤ λ₀`, and for `k ≥ 1` the `k`-th closed gap (`[μ₁, μ₂]`, `[λ₁, λ₂]`, `[μ₃, μ₄]`, …)
  contains `ν_k` and `τ_k` (`hill_gaps`); since the gaps are disjoint and increasing, it contains
  no other Dirichlet or Neumann eigenvalue;
- **zeros**: an eigenfunction for `λ₀` has no zeros on `[0, π]`; real-valued eigenfunctions for
  `λ_{2m+1}` and `λ_{2m+2}` have exactly `2m + 2` zeros in `[0, π)`, and real-valued ones for
  `μ_{2m+1}` and `μ_{2m+2}` exactly `2m + 1` (`hill_zeros`).

The counting comes from the growth estimate of 3.2, by comparing with `2 cos π√λ` on large circles
(Rouché); the interlacing from the monotonicity of 3.2. The gaps: `w_II(π, λ) w_I′(π, λ) ≥ 0`
outside the open bands, by the Wronskian and `|Δ| ≥ 2` there, and Sturm's count of 3.1 places one
Dirichlet and one Neumann value in each gap. The zeros: Sturm comparison with the Dirichlet
eigenfunctions, and the parity of the number of zeros of a periodic function. Levitan–Sargsjan
state the gap theorem with the antiperiodic gaps `[μ₀, μ₁], [μ₂, μ₃], …` (their labels) closed
and the periodic gaps `(λ₁, λ₂), (λ₃, λ₄), …` open; for even `Q` the Dirichlet and Neumann values
can sit at the ends of a gap (see the Checks), so the gaps are taken here as closed intervals.
Their zero theorem counts the zeros of real eigenfunctions; a complex combination such as
`e^{2ix}` (for `Q = 0`, `λ = 4`) has none.

**Checks.**
- For `Q = 0`, `λ_n` is `0, 4, 4, 16, 16, …` and `μ_n` is `1, 1, 9, 9, …`, all inequalities in the
  interlacing between equal values being equalities; counting without multiplicity would give
  `λ_1 = 4`, `λ_2 = 16`, which breaks the interlacing.
- For `Q(x) = −2 cos 2x`: `λ₀ = a₀(1) = −0.45513 86041`, `μ₁ = b₁(1) = −0.11024 88170`,
  `μ₂ = a₁(1) = 1.85910 80725`, `λ₁ = b₂(1) = 3.91702 47730`, `λ₂ = a₂(1) = 4.37130 09827`; all
  inequalities are strict.
- For the same `Q` the Dirichlet values on `[0, π]` are the `b_n(1)` and the Neumann values the
  `a_n(1)`: `ν₁ = μ₁` and `τ₁ = μ₂` sit at the two ends of the first gap.
- For the same `Q`, `ν₂ = b₂(1) = λ₁` is the left end of the second gap, so the open periodic gap
  `(λ₁, λ₂)` would miss it.
- For `Q = 0`, `hillDirichletEigenvalue 0 k = (k + 1)²` and `hillNeumannEigenvalue 0 k = k²`: the
  roots of `sin(π√λ)/√λ` start at `1` (the value at `λ = 0` is `π`), those of `−√λ sin(π√λ)` at `0`.
- Indexing the Dirichlet values from `ν₀` would pair the first gap `[μ₁, μ₂] = {1}` with the second
  Dirichlet value `4`; with the indexing here it contains `ν₁ = 1`, and `[λ₁, λ₂] = {4}` contains
  `ν₂ = 4`.
- For `Q = 0` the real eigenfunction `cos(2x − φ)` for `λ₁ = λ₂ = 4` has the two zeros
  `(φ + π/2)/2`, `(φ + 3π/2)/2` modulo `π` in `[0, π)`, while `e^{2ix}` has none.

*Needs:* 3.1–3.2; SpecialFunctionsBessel's Sturm comparison (its 10.1); Tau Ceti `rouche`.

### 3.4 The characteristic values `a_n(q)`, `b_n(q)`

Sources: Kato Example VII-3.4, pp. 389–390 (the four symmetry classes); Whittaker–Watson §19.2,
p. 407; DLMF Table 28.2.1, 28.2.21–28.2.24, 28.2.26–28.2.28.

Throughout Layers 3–7, `q` is real except in 7.4. Prove:
- the four sets in [Conventions](#conventions) are closed, discrete, bounded below and infinite,
  every complex root of the four boundary functions of `a` is real and simple, and `a_n(q)`,
  `b_n(q)` are the eigenvalues of the four problems on `[0, π/2]` of DLMF Table 28.2.1;
- `a_n(0) = n²` (`n ≥ 0`), `b_n(0) = n²` (`n ≥ 1`) (DLMF 28.2.23–28.2.24);
- `a_{2n+1}(−q) = b_{2n+1}(q)` (DLMF 28.2.27; `mathieuA_odd_neg`);
- `a_{2n}(−q) = a_{2n}(q)` and `b_{2n+2}(−q) = b_{2n+2}(q)` (DLMF 28.2.26, 28.2.28);
- **weak ordering**: for `Q = −2q cos 2x`, `λ₀ = a₀(q)`, `λ_{2m+1}` and `λ_{2m+2}` are the smaller
  and the larger of `a_{2m+2}(q)`, `b_{2m+2}(q)`, and `μ_{2m+1}`, `μ_{2m+2}` the smaller and the
  larger of `a_{2m+1}(q)`, `b_{2m+1}(q)`, so the `a_n(q)`, `b_n(q)` satisfy the non-strict
  interlacing of 3.3; and `a_n(q) ≠ b_n(q)` for `q ≠ 0`, `n ≥ 1` (`hillEigenvalue_mathieu`);
- `a_n` and `b_n` are real-analytic on `ℝ`;
- for real `a`, `q`, the boundary in `ℝ²` of the stable set of 2.5 is the union of the curves
  `a = a_n(q)` and `a = b_n(q)`.

The strict ordering is proved in 7.2, where the expansions in `q` fix its signs.

The four sets are the spectra of the problems of 3.1 for `V = 2q cos 2x` on `[0, π/2]`, by the
half-period identities of 1.3 and parity; Kato's decomposition of the periodic problem into the
functions even or odd about `0` and about `π/2` is the same splitting. Weak ordering: 3.3 applied
to `Q = −2q cos 2x`; Ince's theorem makes `a_n(q) ≠ b_n(q)` for `q ≠ 0`. Real-analyticity: the
roots are simple, so the analytic implicit root theorem applies to the entire boundary function.
The stability boundary: by 2.5 and the half-period identities, `|w_I(π; a, q)| = 1` exactly on the
four sets.

**Checks.**
- At `q = 1`: `a₀ = −0.45513 86041`, `b₁ = −0.11024 88170`, `a₁ = 1.85910 80725`,
  `b₂ = 3.91702 47730`, `a₂ = 4.37130 09827`, `b₃ = 9.04773 92598`, `a₃ = 9.07836 88472`.
- At `q = −1` the same numbers with `a₁ ↔ b₁` and `a₃ ↔ b₃`.
- `a₁(1)` is a root of `w_I(π/2; ·, 1)`, not of `w_I′(π/2; ·, 1)`:
  `w_I′(π/2; a₁(1), 1) = −1.68085 64766`. Assigning the odd index to the Neumann condition
  would make `a₁(1)` the second root of `w_I′(π/2)`, which is `a₂(1)`.

*Needs:* 1.3, 2.2–2.5, 3.1, 3.3; Tau Ceti `AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`.

### 3.5 Band functions `λ_ν(q)`

Sources: Levitan–Sargsjan §2.6, p. 68 (the bands `|Δ| ≤ 2`); DLMF 28.12.1–28.12.3 and §28.12(i).

Throughout, `ν` and `q` are real and `ν ∉ ℤ` unless stated. Prove:
- the roots `a` of `w_I(π; a, q) = cos πν` are real and simple, the set of them is
  `{λ_{ν+2n}(q) : n ∈ ℤ}`, and `n ↦ λ_{ν+2n}(q)` is injective;
- `λ_ν(0) = ν²` (DLMF 28.12.1) and `λ_ν(−q) = λ_ν(q) = λ_{−ν}(q)` (DLMF 28.12.2);
- `λ_ν(q)` is real-analytic in `(ν, q)` on `(ℝ ∖ ℤ) × ℝ`, and strictly increasing in `|ν|` on each
  interval between consecutive integers.

On the band `|Δ| < 2` the discriminant `Δ = 2 w_I(π; ·, q)` is strictly monotone (3.2), so each
value `2 cos πν` is taken once per band; the band index is `⌊|ν|⌋`, and the interlacing of 3.3
places the bands between the characteristic values. The limits at integer `ν` are 7.2.

**Checks.**
- At `q = 1`: `λ_{0.5}(1) = −0.30728 53506`, `λ_{1.5}(1) = 2.53718 00871`,
  `λ_{2.5}(1) = 6.34844 71759`.
- `λ_{−1.5}(1) = λ_{1.5}(1)`: the band index is `⌊|ν|⌋ = 1`, not `⌊ν⌋ = −2`.
- At `q = 0`, `λ_ν(0) = ν²`, and `w_I(π; ν², 0) = cos πν`.

*Needs:* 2.2, 3.2–3.4.

### Examples

- At `q = 1`, the bands of `a ↦ w_I(π; a, 1)` with `|w_I| < 1` are `(a₀, b₁)`, `(a₁, b₂)`,
  `(a₂, b₃)`, …, and `λ_{0.5}(1)`, `λ_{1.5}(1)`, `λ_{2.5}(1)` lie in the first three.

### Dependencies

Layers 1–2; SpecialFunctionsBessel's Sturm comparison; Tau Ceti Rouché and the implicit root
theorem.

## Layer 4: eigenfunctions and their Fourier series

### 4.1 Periodic eigenfunctions: normalization, orthogonality and zeros

Sources: Whittaker–Watson §19.2, p. 407, §19.3, p. 410, and §19.31, p. 411; Levitan–Sargsjan
Theorem 1.3.3, p. 15; DLMF Table 28.2.2, 28.2.29–28.2.39, §28.9.

Prove:
- `ce_{2n}` is `π`-periodic and even, `ce_{2n+1}` `π`-antiperiodic and even, `se_{2n+1}`
  antiperiodic and odd, `se_{2n+2}` periodic and odd (DLMF Table 28.2.2); they are real on `ℝ`;
- the normalizations DLMF 28.2.30 (`integral_mathieuCe_sq`) and orthogonality DLMF 28.2.31–28.2.33
  (`integral_mathieuCe_mul`);
- `ce_0(z, 0) = 1/√2`, `ce_n(z, 0) = cos nz`, `se_n(z, 0) = sin nz` (DLMF 28.2.29), and
  `(q, z) ↦ ce_n(z, q)`, `se_n(z, q)` are continuous, and real-analytic in `q`; so the sign
  convention of [Conventions](#conventions) is DLMF's;
- the change of sign of `q` for `ce_{2n}`, DLMF 28.2.34 (`mathieuCe_even_neg`);
- the changes of sign of `q` for the other three families, DLMF 28.2.35–28.2.37;
- DLMF 28.2.38–28.2.39;
- each of `ce_{2n}`, `se_{2n+1}`, `ce_{2n+1}`, `se_{2n+2}` has exactly `n` zeros in `(0, π/2)`
  (`ncard_zeros_mathieuCe_even`);
- these zeros depend continuously on `q`.

**Checks.**
- `ce₀(z, 0)² = ½` integrates to `π` over `[0, 2π]`; Whittaker–Watson's normalization would give
  `ce₀(z, 0) = 1` instead.
- `ce₀(0, 1) = 0.38482 78293`, positive.
- `ce₁(0, 1) = 0.85659 84656` and `se₁′(0, 1) = 0.68644 18975`, both positive.
- `se_0 = 0` is a junk value; DLMF 28.2.33 at `n = 0` holds as printed with it.

*Needs:* 3.1, 3.4.

### 4.2 Fourier coefficients of the periodic eigenfunctions

Sources: Whittaker–Watson §19.61, pp. 422–424; DLMF 28.4.1–28.4.20 and the leading ratio in
§28.4(vii).

With `A^n_k(q) = (1/π) ∫₀^{2π} ce_n(x, q) cos kx dx` for `k ≥ 1`, `A^n_0 = (1/2π) ∫₀^{2π} ce_n`, and
`B^n_k(q) = (1/π) ∫₀^{2π} se_n(x, q) sin kx dx`, prove:
- DLMF 28.4.1, `ce_{2n}(z, q) = ∑ₘ A^{2n}_{2m}(q) cos 2mz` for every complex `z`
  (`hasSum_mathieuCe_even`);
- DLMF 28.4.2–28.4.4, the series of `ce_{2n+1}`, `se_{2n+1}`, `se_{2n+2}`; all four series converge
  absolutely and uniformly on compact subsets of `ℂ`, and the coefficients of the other parity
  vanish;
- the recurrences DLMF 28.4.5–28.4.8, the normalizations 28.4.9–28.4.12, the values at `q = 0`
  28.4.13–28.4.16, and the changes of sign 28.4.17–28.4.20;
- `A^{2n}_{2m}/A^{2n}_{2m−2} = −q/(4m²) (1 + O(1/m))` as `m → ∞` for `q ≠ 0`, and the same for the
  other three families.

The ratio estimate is the recurrence, since the coefficients are the minimal solution.

**Checks.**
- `A^0_0(0) = 1/√2`, from `ce₀(z, 0) = 1/√2`; with `1/π` in place of `1/2π` for `k = 0` it would
  be `√2`, and the normalization DLMF 28.4.9 `2(A^0_0)² + ∑_{m≥1} (A^0_{2m})² = 1` would fail.
- The first recurrence `a A₀ − q A₂ = 0` at `n = 0`: `A^0_2(q)/A^0_0(q) = a₀(q)/q`, which is
  `−0.45513 86041` at `q = 1`.
- `A^{2n}_{2m}(0) = 0` for `m ≠ n` (DLMF 28.4.13).

*Needs:* 4.1; Mathlib `fourierCoeff`, `hasSum_fourier_series_of_summable`; Tau Ceti Fourier decay
on strips.

### 4.3 Second solutions at the characteristic values

Sources: Whittaker–Watson §19.4, p. 413 (the second solution when a periodic one exists);
DLMF 28.5.1–28.5.9.

With the definitions of [Conventions](#conventions), prove for real `q ≠ 0`:
- `fe_n, ge_n` solve Mathieu's equation with `a = a_n(q)`, `b_n(q)`; `f_{2m}` is `π`-periodic and
  odd, `f_{2m+1}` antiperiodic and odd, `g_{2m+1}` antiperiodic and even, `g_{2m+2}` periodic and
  even; `f_n`, `g_n` are the unique functions with these properties making DLMF 28.5.1–28.5.2
  solutions;
- the normalization DLMF 28.5.5;
- as `q → 0` with `n ≥ 1`: `C_n, S_n → 0`, `C_n f_n → sin nz`, `S_n g_n → cos nz`, and
  `fe_n(z, q) → sin nz`, `ge_n(z, q) → cos nz` locally uniformly;
- `C_{2m+1}(−q) = −S_{2m+1}(q)` (`mathieuFeC_odd_neg`);
- `C_{2m}(−q) = C_{2m}(q)` and `S_{2m+2}(−q) = S_{2m+2}(q)`;
- every solution independent of `ce_n(z, q)` (resp. `se_n(z, q)`) is unbounded on `ℝ`;
- the Wronskians DLMF 28.5.8–28.5.9.

At `n = 0`, DLMF 28.5.5 cannot hold at `q = 0` since `f₀(·, 0) = 0`; as `q → 0`, `C₀(q) → ∞` and
`fe₀(·, q)` does not tend to `fe₀(·, 0) = z`. The roadmap states DLMF 28.5.1 and 28.5.5 for
`q ≠ 0` and 28.5.7 as the values at `q = 0`.

**Checks.**
- `C₁(0.5) = 0.49414` and `S₁(0.5) = 0.49419`.
- `C₁(−0.5) = −0.49419 = −S₁(0.5)`, so DLMF's printed `C_{2m+1}(−q) = S_{2m+1}(q)` has the wrong
  sign.
- `C₁(−1.5) = −1.35802 = −S₁(1.5)`, with `C₁(1.5) = 1.33555 ≠ S₁(1.5)`.
- `C₂(−q) = C₂(q)` holds (`0.03082` at `q = ±0.5`).
- `C₀(q)` is `14.29`, `56.61`, `282.85` at `q = 0.2, 0.05, 0.01`, growing like `2.83/q`: the
  normalization DLMF 28.5.5 makes `fe₀` blow up as `q → 0`.

*Needs:* 2.4 (Ince), 4.1.

### 4.4 Floquet eigenfunctions of noninteger order

Sources: Whittaker–Watson §19.4, p. 413 (the fundamental system `e^{μz}φ(z)`, `e^{−μz}φ(−z)`);
DLMF 28.12.4–28.12.15.

Prove:
- `w_II(π; λ_ν(q), q) ≠ 0`, `me_ν(·, q)` is a Floquet solution for `ν` with `a = λ_ν(q)`, and
  `me_ν(−z, q)` one for `−ν`;
- the normalization DLMF 28.12.5, for every real `ν` (`integral_mathieuMe_mul_neg`);
- `me_ν(z, 0) = e^{iνz}`, pseudoperiodicity 28.12.6 and orthogonality 28.12.7;
- DLMF 28.12.8–28.12.10 (`conj (me_ν(z, q)) = me_ν(−z̄, q)` holds for all real `ν`, `q` here);
- the definitions DLMF 28.12.11–28.12.13, reality of `ce_ν`, `se_ν` on `ℝ`, and 28.12.14–28.12.15;
- when `ν = s/m` is rational and not an integer, every solution has period `2mπ`;
- `me_ν(0, q) > 0` is DLMF's continuity convention (the two sides of the normalization are
  continuous in `q` and `me_ν(0, q) ≠ 0`).

**Checks.**
- At `q = 0`, `w_II(π; ν², 0) = sin(πν)/ν` and `me_ν(z, 0) = e^{iνz}`.
- At `ν = n ∈ ℤ`, `me_n = √2 ce_n` and `me_{−n} = −√2 i se_n`: the factor `√2` matches the
  normalization over `[0, π]` against that of `ce_n(z, q)` over `[0, 2π]`.
- `me_ν(z, q) me_ν(−z, q)` is `π`-periodic for `ν ∉ ℤ`, while `me_ν(z, q)` itself is not.
- `ce_ν(z, 0) = cos νz` and `se_ν(z, 0) = sin νz`; without the factor `−i` in DLMF 28.12.13,
  `se_ν(z, 0)` would be `i sin νz`, not real on `ℝ`.

*Needs:* 2.2, 3.5, 4.1.

### 4.5 Fourier coefficients of the Floquet eigenfunctions

Sources: DLMF 28.14.1–28.14.10.

With `c^ν_{2m}(q)` as in [Conventions](#conventions), prove DLMF 28.14.1–28.14.10: the series
`me_ν(z, q) = ∑_m c^ν_{2m}(q) e^{i(ν+2m)z}` and its cosine and sine forms converge absolutely and
uniformly on compact sets, the coefficients are real, satisfy the recurrence of 2.2 with
`a = λ_ν(q)`, the normalization `∑_m (c^ν_{2m})² = 1`, the decay ratio, the symmetries
`c^{−ν}_{−2m} = c^ν_{2m}`, `c^ν_{2m}(−q) = (−1)^m c^ν_{2m}(q)`, and the leading behaviour as
`q → 0`.

**Checks.**
- `c^ν_0(0) = 1` and `c^ν_{2m}(0) = 0` for `m ≠ 0`.
- To first order in `q`, `c^ν_2(q) = −q/(4(ν + 1))` and `c^ν_{−2}(q) = −q/(4(1 − ν))` (times
  `c^ν_0`); at `ν = ½` these are `−q/6` and `−q/2`, so `c^ν_{−2m} ≠ c^ν_{2m}`.
- `∑_m (c^ν_{2m})² = 1` is the normalization DLMF 28.12.5 read through the Fourier series, since
  `∫₀^π e^{2i(m−n)x} dx = π δ_{mn}`.

*Needs:* 2.2, 4.4; Tau Ceti Fourier decay on strips.

### Examples

- At `q = 1`, `λ_{0.999}(1) = −0.11025 0 ≈ b₁(1)` and `λ_{1.001}(1) = 1.85911 1 ≈ a₁(1)`, so the
  Floquet eigenfunctions near `ν = 1` approach multiples of `se₁` from below and of `ce₁` from
  above.

### Dependencies

Layers 2–3; Tau Ceti Fourier decay; Mathlib `fourierCoeff`.

## Layer 5: Hill equations with two cosine terms

### 5.1 Ince's equation and Ince polynomials

Sources: DLMF 28.31.1–28.31.15.

Prove:
- for entire `w`, `w` solves Ince's equation 28.31.3, `w″ + ξ sin 2z w′ + (η − pξ cos 2z) w = 0`,
  iff `W = w e^{−ξ cos 2z/4}` (the substitution 28.31.2) solves the Whittaker–Hill equation
  `W″ + (η − ξ²/8 − (p + 1)ξ cos 2z + (ξ²/8) cos 4z) W = 0`, the form 28.31.1 with these
  coefficients (`whittakerHill_of_ince`);
- the formal Fourier solutions DLMF 28.31.4–28.31.5 with the recurrences 28.31.6–28.31.9, and
  their convergence;
- for `p ∈ ℕ` and real `ξ`, the Ince polynomials `C^m_p`, `S^m_p` (DLMF 28.31.10–28.31.11) exist:
  the recurrence truncates, and the finite tridiagonal matrix has real distinct eigenvalues
  `a^m_p(ξ)`, `b^m_p(ξ)`, ordered so that the polynomial has exactly `m` zeros in `[0, π)`, all
  simple; the normalization DLMF 28.31.12 with `C^m_p(0) > 0`, `S^m_p′(0) > 0`;
- the limits DLMF 28.31.13, and 28.31.14–28.31.15 as `p → ∞`, `ξ → 0`, `pξ → 2q`.

**Checks.**
- For `p = 0`, `C^0_0 = 1/√2` and `a^0_0(ξ) = 0` for all `ξ`: in
  `w″ + ξ sin 2z w′ + (η − pξ cos 2z) w = 0` a constant solves the equation exactly when `η = 0`.
- For `p = 1`, `C^1_1 = cos z` with `a^1_1(ξ) = 1 + ξ`, and `S^1_1 = sin z` with `b^1_1(ξ) = 1 − ξ`:
  substituting `cos z` into `w″ + ξ sin 2z w′ + (η − ξ cos 2z) w = 0` leaves `(η − 1 − ξ) cos z`,
  and `sin z` leaves `(η − 1 + ξ) sin z`.
- With the sign of the first-order term reversed, `w″ − ξ sin 2z w′ + (η − ξ cos 2z) w = 0`,
  `cos z` is not a solution for any `η` when `ξ ≠ 0`: the residual is
  `(η − 1 + ξ) cos z − 2ξ cos z cos 2z`.

*Needs:* 4.1–4.2.

### 5.2 Paraboloidal wave functions

Sources: DLMF 28.31.16–28.31.24.

Prove DLMF 28.31.18–28.31.21, and the double orthogonality relations 28.31.22–28.31.24 on the
stated contours, the inner integrals over `[0, 2π]` and the outer ones converging because `hc`, `hs`
decay like `exp(−¼ ξ cos 2u)` along them.

*Needs:* 5.1.

### Examples

- `C^1_1(z, ξ) = cos z` for every `ξ`, so its limit DLMF 28.31.14 is `ce₁(z, 0) = cos z`.

### Dependencies

Layer 4.

## Layer 6: integral operators and eigenfunction expansions

### 6.1 Compact integral operators and the expansion theorem for Hill's equation

Sources: Levitan–Sargsjan §1.5, pp. 24–28, and Theorem 1.6.1, p. 33; Whittaker–Watson §19.31,
p. 411; DLMF 28.30.1–28.30.4.

Let `λ̂₀ ≤ λ̂₁ ≤ ⋯` be the merged sequence of the `λ_n` and `μ_n`, and `w_m` real `2π`-periodic
solutions with `w_m″ + (λ̂_m + Q) w_m = 0` and `(1/2π) ∫₀^{2π} w_m w_n = δ_{mn}`. Prove:
- an integral operator on `L²(a, b)` with continuous kernel is compact (auxiliary; uniform
  approximation of the kernel by finite sums of products);
- such a family `w_m` exists, and the `w_m` form a Hilbert basis of `L²(0, 2π)` with the measure
  `dx/2π`;
- every `2π`-periodic `f : ℝ → ℂ` with `f`, `f′` absolutely continuous on `[0, 2π]` and
  `f″ ∈ L²(0, 2π)` satisfies `f = ∑ f_m w_m` with `f_m = (1/2π) ∫₀^{2π} f w_m`, the series
  converging absolutely and uniformly.

For `c` below `λ̂₀`, the Green operator of `−w″ − (Q + c) w` with periodic conditions on `[0, 2π]`
has a continuous symmetric kernel built from `w_I, w_II`; apply Tau Ceti's spectral theorem.
Uniform convergence for `f` as stated follows by writing `f` as the Green operator applied to an
`L²` function and using Bessel's inequality, as in Levitan–Sargsjan's proof of Theorem 1.5.1.

*Needs:* 3.3; Tau Ceti `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`; Mathlib
`IsCompactOperator`.

### 6.2 Integral equations and the lowest Fourier coefficients

Sources: Whittaker–Watson §§19.21–19.22, pp. 407–409; DLMF 28.10.1–28.10.10.

Prove DLMF 28.10.1–28.10.8 for real `h ≠ 0` and `q = h²`, and 28.10.9–28.10.10 for real `q`, with
`J₀(2√X)` as in [Conventions](#conventions). Each left side is a solution of Mathieu's equation in
`z` with the parity and period of the right side (differentiate under the integral and integrate
by parts), so it is a multiple of the eigenfunction; the multiple is read off at one point from the
Fourier series. Whittaker–Watson's kernel `e^{k cos η cos θ}` with `k = √(32 q_WW)` is the case
`q < 0` in the normalization here.

Then prove that for real `q ≠ 0` the coefficients `A^{2m}_0(q)`, `A^{2m+1}_1(q)`, `B^{2m+1}_1(q)`,
`B^{2m+2}_2(q)` are nonzero; the continued fraction at `n = 0` (7.3) and the joining factors of 8.3
divide by them. For `A^{2m}_0` and `q > 0`: if it vanished, the left side of DLMF 28.10.1 would
vanish for all `z`, so every moment `∫₀^{π/2} cos^{2k} t · ce_{2m}(t) dt` would vanish; the even
polynomials in `cos t` are dense in `C[0, π/2]`, so `ce_{2m} = 0` there, a contradiction. DLMF
28.10.3, 28.10.5 and 28.10.7 give the other three in the same way, with density in the continuous
functions vanishing at `π/2`, at `0`, and at both, respectively; `q < 0` follows by DLMF
28.4.17–28.4.20.

*Needs:* 4.1–4.2; Mathlib `Complex.besselJ`.

### 6.3 Expansions in the periodic eigenfunctions

Sources: Whittaker–Watson §19.31, Example 1, p. 412; DLMF 28.11.1–28.11.7.

For real `q` and `f` `2π`-periodic and holomorphic on a strip `S = {|Im z| < σ}`, prove DLMF
28.11.1–28.11.2 with absolute and uniform convergence on compact subsets of `S`, and the examples
28.11.3–28.11.7. On `ℝ` this is 6.1 for `Q = −2q cos 2x`; in the strip, the coefficients `α_n` decay
like `e^{−σ′n}` for every `σ′ < σ` (expand in the Fourier basis and use the decay of `A^n_k`,
`B^n_k` away from `k = n`), and `|ce_n(z)|, |se_n(z)| ≤ C e^{n|Im z|}`.

*Needs:* 4.2, 6.1; Tau Ceti Fourier decay on strips.

### 6.4 Expansions in the Floquet eigenfunctions

Sources: DLMF 28.19.1–28.19.4.

Prove DLMF 28.19.2–28.19.3 for `f` holomorphic on a strip `S ⊇ ℝ` with 28.19.1, absolutely and
uniformly on compact subsets of `S`, with the example 28.19.4.

*Needs:* 4.5, 6.3.

### Examples

- DLMF 28.11.3 at `z = 0`: `1 = 2 ∑ A^{2n}_0(q) ce_{2n}(0, q)`.

### Dependencies

Layers 3–4; Mathlib `Complex.besselJ`; Tau Ceti spectral theorem.

## Layer 7: dependence on `q`

### 7.1 Holomorphy near `q = 0` and the Taylor coefficients

Sources: Kato Example VII-3.4, pp. 389–390; Whittaker–Watson §19.3, Examples 1–2, pp. 410–411, and
§19.61, pp. 422–424; DLMF 28.4.21–28.4.23, 28.6.1–28.6.15, 28.6.21–28.6.26, 28.15.1, 28.15.3.

Prove:
- each `a_n`, `b_n`, and each `A^n_k`, `B^n_k`, `ce_n(z, ·)`, `se_n(z, ·)`, is the restriction to a
  real interval around `0` of a function holomorphic on a disc `|q| < r_n` with `r_n > 0`;
- their Taylor coefficients at `0` are those of DLMF 28.6.1–28.6.14, 28.6.21–28.6.26 and
  28.4.21–28.4.23, through the printed orders; in particular
  `a_m(q) − b_m(q) = 2q^m/(2^{m−1}(m − 1)!)² (1 + O(q²))` (DLMF 28.6.15);
- `a₀(q) = −q²/2 + 7q⁴/128 + O(q⁶)`, the holomorphic extension having Taylor coefficients
  `0, 0, −½, 0, 7/128` (`exists_analyticAt_mathieuA_zero`);
- for fixed `ν ∉ ℤ`, the same for `λ_ν(q)` and `c^ν_{2m}(q)`, with the Taylor coefficients of DLMF
  28.15.1 and 28.15.3.

At `q = 0` the roots `a = n²` of the four boundary functions are simple, so the analytic implicit
root theorem gives the holomorphic extension; Kato obtains the same from analytic perturbation of
the self-adjoint family `−d²/dx² − 2q cos 2x` on each of the four symmetry classes, and
Whittaker–Watson §19.61 by the contour argument in `p = (a − N²)/8`. The Taylor coefficients come
from equating powers of `q` in the recurrences DLMF 28.4.5–28.4.8.

**Checks.**
- At `q = 0.1`, `a₀ = −0.00499 45438`, and the three terms `−q²/2 + 7q⁴/128 − 29q⁶/2304` of DLMF
  28.6.1 give `−0.00499 45438`.
- Whittaker–Watson's series for `a₀` (§19.3, Example 2(i), p. 411), `−32q² + 224q⁴ + ⋯` in their
  `q`, is DLMF 28.6.1 after `q ↦ −q/8`: `−32 (q/8)² = −q²/2` and `224 (q/8)⁴ = 7q⁴/128`.
- `a₁(q) − b₁(q) = 2q + O(q³)`, so `a₁ > b₁` for small `q > 0`; the sign of `q` matters, and at
  `q = −1`, `a₁ − b₁ = −1.96935 68895`.

*Needs:* 3.4–3.5, 4.2, 4.5; Tau Ceti `AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`.

### 7.2 Strict ordering and the band edges

Sources: DLMF 28.2.25, §28.12(i).

Prove:
- **ordering** (DLMF 28.2.25): for `q > 0`, `a₀ < b₁ < a₁ < b₂ < a₂ < ⋯`
  (`mathieuA_lt_mathieuB_lt`);
- for `q < 0`, `a₀ < a₁ < b₁ < b₂ < a₂ < a₃ < ⋯`;
- for `q ≠ 0` and `m ∈ ℤ ∖ {0}`, the one-sided limits of `λ_ν(q)` as `ν → m` are `a_{|m|}(q)` and
  `b_{|m|}(q)`, the smaller one from the side of smaller `|ν|`; in particular `λ_ν` is
  discontinuous at `ν = m`;
- for `q > 0`, `λ_ν(q) → b₁(q)` as `ν → 1⁻` and `λ_ν(q) → a₁(q)` as `ν → 1⁺`
  (`tendsto_mathieuLambda_one`).

The ordering: by the weak ordering of 3.4 it remains to compare `a_n` with `b_n`; `a_n − b_n` is
continuous and nonzero on `q > 0` (3.4), so it has constant sign there, which DLMF 28.6.15 fixes
near `0`; `q < 0` follows by DLMF 28.2.26–28.2.28. The limits: the bands of 3.5 end at the
characteristic values in the order just proved.

**Checks.**
- At `q = 1`, `λ_{0.999}(1) = −0.11025 0 ≈ b₁(1)` and `λ_{1.001}(1) = 1.85911 1 ≈ a₁(1)`.
- At `q = −1`, the order of `a₁`, `b₁` is reversed:
  `a₁(−1) = −0.11024 88170 < b₁(−1) = 1.85910 80725`.
- At `q = 0` all limits agree (`λ_ν(0) = ν²`), so the hypothesis `q ≠ 0` is needed for the
  discontinuity.

*Needs:* 3.4–3.5, 7.1.

### 7.3 Continued fractions

Sources: Whittaker–Watson §19.61, pp. 422–424 (the coefficient ratios as quotients of determinants);
DLMF 28.6.16–28.6.19, 28.15.2.

Auxiliary first: for a three-term recurrence `x_{k+1} − β_k x_k + α_k x_{k−1} = 0` with
`|β_k| → ∞` and `α_k` bounded, there is `k₀` such that for `k ≥ k₀` the finite continued fractions
for `x_k/x_{k−1}` built from the tail have nonzero partial denominators and converge to the ratio
of the minimal solution (Pincherle), and that ratio is finite at every `k ≥ k₀` where the minimal
solution has `x_{k−1} ≠ 0`. Then prove:
- the tails: for each `n` and each index of the tail, the infinite fraction converges to the
  quotient of consecutive Fourier coefficients `A^n_{k+2}/A^n_k` (resp. `B`), whenever
  `A^n_k(q) ≠ 0`;
- DLMF 28.6.16–28.6.19 for `n ≥ 1`, under the hypothesis that the partial denominators of the
  finite head (in 28.6.16 the fraction descending from `(2n − 2)² − a` to `0² − a`, and its
  analogues in 28.6.17–28.6.19) are nonzero at the characteristic value, and that the coefficient
  (`A^{2n}_{2n}`, resp. its analogue) in the denominator of the quotient the tail represents is
  nonzero;
- for `n = 0`, `a = −2q²/(4 − a − q²/(16 − a − q²/(36 − a − ⋯)))` with `a = a₀(q)`, for all real `q`
  (`tendsto_mathieuTail_mathieuA_zero`); the right side of DLMF 28.6.16 at `n = 0` lacks the factor
  `2`. Here the head is empty and the tail starts at `A^0_2/A^0_0`, with `A^0_0(q) ≠ 0` by 6.2 (and
  at `q = 0` both sides are `0`);
- the continued-fraction equation DLMF 28.15.2 for `λ_ν(q)`, in the same sense.

The hypotheses on the head are not removable with Lean's division: if `a₄(q*) = 0`
(`q* = 69.42837 82910`, which exists since `a₄(0) = 16` and `a₄(q) → −∞`), the recurrence DLMF
28.4.5 gives `A^4_2(q*) = 0` and the head of 28.6.16 at `n = 2` ends in `2q²/(0² − a) = 2q²/0`.

**Checks.**
- `mathieuTail a q k 0 = 0`, and at `q = 0` every truncation is `0`, so both sides of the `n = 0`
  identity vanish.
- At `q = 0.5`: `a₀ = −0.12176 55449`; the corrected right side is `−0.12176 55449` and the printed
  one `−0.06088 27725`.
- At `q = 2`: `a₀ = −1.51395 68851` against `−0.75697 84425` printed.

*Needs:* 4.2, 4.5, 6.2 (for `A^0_0 ≠ 0`).

### 7.4 Continuation to complex `q` and the exceptional values

Sources: Kato Theorem II-1.8, p. 70, and the remark on the order of the branch points, p. 71;
DLMF §28.7.

Let `F^{(1)}(a, q) = w_I′(π/2; a, q)`, `F^{(2)} = w_II(π/2; ·)`, `F^{(3)} = w_I(π/2; ·)` and
`F^{(3′)} = w_II′(π/2; ·)`, entire on `ℂ²`. Call `q ∈ ℂ` exceptional for `F` if `F(·, q)` has a
multiple root. Prove:
- the exceptional set of each `F` is a closed discrete subset of `ℂ` disjoint from `ℝ`;
- `a_n`, `b_n` extend holomorphically to an open neighbourhood of `ℝ` in `ℂ`, and continue
  analytically along every path in `ℂ` that starts on `ℝ` and avoids the exceptional set, the
  continued value remaining a root of the same `F`;
- at an exceptional `q₀` and a root `a₀` of multiplicity `k`, the roots near `a₀` of `F(·, q)` for
  `q` near `q₀` are the values of `k` functions, each given by a convergent series in
  `(q − q₀)^{1/p}` with `p = k!` (any nonzero multiple of `k!` serves), finite at `q₀`.

DLMF says only that the branch points are algebraic; the exponent `1/k` would need a theorem on
the local monodromy at Mathieu collisions, which the roadmap does not claim. That the branches of
each family form one complete analytic function is beyond this roadmap.

The discreteness: for `|q| ≤ R`, all roots of `F(·, q)` with `Re a` large lie close to the squares
and are simple (Rouché against the `q = 0` function); the finitely many others, near a given `q₀`,
are the roots of a monic polynomial `P(a, q)` of degree `k` in `a` whose coefficients, obtained
from the power sums `∮ aʲ ∂_a F/F da`, are holomorphic in `q`; its discriminant is holomorphic and
nonzero on `ℝ`, so `P(·, q)` is separable for `q` near `q₀`, `q ≠ q₀`, and Tau Ceti's
`exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball` with exponent `k!` gives the Puiseux
series. Kato's Theorem II-1.8 is the same local structure for the eigenvalues of a holomorphic
matrix family, with cycles of period at most `k`.

**Checks.**
- The first exceptional values of `a₀` are `q₀ = ±1.4688 i`, where `a₀(q₀) = a₂(q₀) = 2.0886`
  (DLMF §28.7): a numerical check that `F^{(1)}(·, q₀)` has a double root there.
- On `ℝ` there are no exceptional values, since every real root is simple (3.4).
- For `q = 0` the four functions have simple roots `n²`, so `0` is not exceptional although
  `a_n(0) = b_n(0)`: the families are separated by `F`, not by the value.

*Needs:* 3.4, 4.2, 7.1; Tau Ceti `rouche` and
`exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball`.

### 7.5 Sum rules

Sources: DLMF 28.7.1–28.7.4.

Prove the **sum rules** DLMF 28.7.1–28.7.4 for real `q`, the series converging absolutely:
`∑_{n≥0} (a_{2n}(q) − (2n)²) = 0`, `∑_{n≥0} (a_{2n+1}(q) − (2n + 1)²) = q`,
`∑_{n≥0} (b_{2n+1}(q) − (2n + 1)²) = −q` and `∑_{n≥1} (b_{2n}(q) − (2n)²) = 0`
(`hasSum_mathieuA_even_sub_sq`, `hasSum_mathieuA_odd_sub_sq`, `hasSum_mathieuB_odd_sub_sq`,
`hasSum_mathieuB_even_sub_sq`).

The proof, for 28.7.1 (the others are the same with the diagonal entry `1 + q`, `1 − q`, or the
index set shifted). Let `H_N` be the `N × N` truncation of the recurrence matrix DLMF 28.4.5, made
symmetric by the scaling `A₀ ↦ √2 A₀`, with diagonal `(2m)²` and off-diagonal entries
`√2 q, q, q, …`, and `λ^{(N)}_0 ≤ ⋯ ≤ λ^{(N)}_{N−1}` its eigenvalues. Prove:
- for fixed `n`, `λ^{(N)}_n → a_{2n}(q)` as `N → ∞`;
- for `M` large (depending on `q`) and every `N > M`,
  `−C q²/M ≤ ∑_{n<M} (λ^{(N)}_n − (2n)²) ≤ 0`.

The upper bound is Ky Fan's inequality: the sum of the `M` smallest eigenvalues is at most the trace
of the compression of `H_N` to the first `M` coordinates, which is `∑_{n<M} (2n)²`. For the lower
bound, split `H_N` at the cut between coordinates `M − 1` and `M`, where the only coupling is the
entry `q`, and use `2q x_{M−1} x_M ≥ −t x_{M−1}² − (q²/t) x_M²`: then `H_N ≥ A_t ⊕ B_t` with
`A_t` the top block minus `t` in its last diagonal entry and `B_t` the bottom block minus `q²/t` in
its first. Gershgorin puts the spectrum of `A_t` below `4(M − 1)² + 3|q|` and that of `B_t`
above `4M² − 2|q| − q²/t`; with `t = q²/(2M)` and `6M > 4 + 5|q|`, every eigenvalue of `B_t`
exceeds every eigenvalue of `A_t`, so the `M` smallest eigenvalues of `A_t ⊕ B_t` are those of
`A_t`, whose sum is `∑_{n<M} (2n)² − q²/(2M)`, and Weyl monotonicity gives the bound with
`C = ½`. Letting `N → ∞`, `|∑_{n<M} (a_{2n}(q) − (2n)²)| ≤ q²/(2M)`, which is 28.7.1. A uniform
bound on single eigenvalues cannot replace this: the largest eigenvalue of `H_N` lies `≍ q²/N`
above `4(N − 1)²`, because the truncation removes its upper neighbour.

**Checks.**
- The truncated sum `∑_{n<60} (a_{2n}(1) − 4n²) = −0.0021` differs from `0` by the tail
  `≈ q²/(8·60) = 0.0021`.
- `∑_{n<60} (a_{2n+1}(1) − (2n + 1)²) = 0.9979` and `∑_{n<60} (b_{2n+1}(1) − (2n + 1)²) = −1.0021`,
  near `q` and `−q`.
- At `q = 0` every sum is `0`.
- A single eigenvalue bound `|a_{2n}(q) − 4n²| ≤ C q²/n²` alone does not give convergence to the
  right value; the trace argument is needed for the exact sum `0`.

*Needs:* 3.4, 4.2, 7.1.

### Examples

- `a₀(q)` on `[−2, 2]` is even (DLMF 28.2.26), with `a₀(0.5) = −0.12176 55449` and
  `a₀(2) = −1.51395 68851`.

### Dependencies

Layers 3–4 and 6; Tau Ceti Rouché, implicit roots and Puiseux factorization; Mathlib `fourierCoeff`.

## Layer 8: modified Mathieu functions

Throughout, `h > 0`, `q = h²`, and `ν` is real, unless stated.

### 8.1 The modified equation and its solutions

Sources: DLMF 28.20.3–28.20.8, 28.20.13–28.20.20.

Prove:
- DLMF 28.20.3–28.20.7: `Ce_ν(z, q) = ce_ν(iz, q)`, `Se_ν(z, q) = −i se_ν(iz, q)`,
  `Me_ν = me_ν(−iz)`, `Fe_n = −i fe_n(iz)`, `Ge_n = ge_n(iz)` solve the modified equation, with both
  sign choices in 28.20.3–28.20.4 and 28.20.6–28.20.7 giving the same function; 28.20.5 has no sign
  choice (at `q = 0`, `me_ν(−iz) = e^{νz}` and `me_ν(iz) = e^{−νz}` differ);
- the four `M^{(j)}_ν` of [Conventions](#conventions) exist and are unique; `M^{(1)}`, `M^{(2)}`
  are real on `ℝ`; DLMF 28.20.13–28.20.16;
- `Ie_n, Io_n, Ke_n, Ko_n` exist and are unique. DLMF defines them by 28.20.17–28.20.20, through
  `Mc^{(j)}_n(z, ih)`, a continuation in `h` that the roadmap does not construct; the
  characterizations of [Conventions](#conventions) are the normalizations at `+∞` that
  28.20.17–28.20.20 imply, and 8.4 proves the expansions 28.24.6–28.24.13 for them.

Existence of `M^{(3)}`, `M^{(4)}` is 8.2; their uniqueness along the real axis: two solutions both
`∼ H^{(1)}_ν(2h cosh x)` differ by a solution that is `o((cosh x)^{−1/2})`, and a nonzero
combination of `M^{(3)}`, `M^{(4)}` is not.

**Checks.**
- At `q = 0`: `Ce_n(z, 0) = cosh nz` for `n ≥ 1` and `Me_ν(z, 0) = e^{νz}`.
- For `ν = 0`, `h = √2`: `|M^{(3)}_0(x, h)| (cosh x)^{1/2}` is `0.47682, 0.47475, 0.47447, 0.47443`
  at `x = 2, 3, 4, 5`, tending to `(πh)^{−1/2} = 0.47442`.
- `|M^{(3)}_0(x, h)| (cosh x)^{−1/2}` tends to `0`, so a normalization against `ζ^{1/2}` cannot be
  met.

*Needs:* 1.4, 4.1, 4.3, 4.4; SpecialFunctionsBessel Layer 1 and §§6.1–6.2.

### 8.2 Behaviour at infinity: asymptotics, Wronskians and translations

Sources: DLMF 28.20.8–28.20.12, 28.20.21, 28.20.25, 28.25.1–28.25.5.

Prove:
- the algebraic form DLMF 28.20.2 has independent solutions asymptotic to `ζ^{−1/2} e^{±2ihζ}` as
  `ζ → ∞` in the sectors `|ph(∓iζ)| ≤ 3π/2 − δ` (DLMF prints `ζ^{1/2}`);
- along the real axis, `|M^{(3)}_ν(x, h)| (cosh x)^{1/2} → (πh)^{−1/2}` as `x → +∞`
  (`tendsto_norm_modifiedMathieuM_three`);
- DLMF 28.20.9–28.20.10 in the stated strips, and 28.20.11–28.20.12 for `|Im z| ≤ π − δ`;
- the Wronskians DLMF 28.20.21;
- the translation formulas DLMF 28.20.25 for `s ∈ ℤ`;
- the asymptotic expansions DLMF 28.25.1 with the coefficients 28.25.2–28.25.3, valid in
  28.25.4–28.25.5, for fixed `h > 0` and fixed real `ν`.

*Needs:* 8.1; AsymptoticExpansions §10.4; SpecialFunctionsBessel §6.1.

### 8.3 Joining factors

Sources: DLMF 28.22.1–28.22.14.

Define the joining factors by DLMF 28.22.5–28.22.10 (well defined by the nonvanishing in 6.2), and
prove 28.22.1–28.22.4, 28.22.11–28.22.12, 28.22.13 (with `me_ν(0, h²) ≠ 0`, by 4.4) and 28.22.14
for `ν ∉ ℤ`.

*Needs:* 8.1–8.2, 4.2–4.3, 4.4, 6.2.

### 8.4 Bessel series and cross-product series

Sources: DLMF 28.23.1–28.23.13, 28.24.1–28.24.13.

The Bessel factors are the continued evaluations of [Conventions](#conventions); first prove their
agreement with the principal values on `|Im L| < π` (`differentiable_besselJLog` for the
entireness of `J_μ⟨L⟩`). Then prove:
- DLMF 28.23.2–28.23.5 for `|cosh z| > 1` (resp. `|sinh z| > 1`) and `Re z > 0` for all `j`; for
  `ν ∈ ℤ` and `j = 1`, for all `z`;
- for `j = 1` and `ν ∉ ℤ` the series diverge where `0 < |cosh z| < 1` (resp. `0 < |sinh z| < 1`),
  contrary to DLMF's "valid for all `z` when `j = 1`": the terms with `n → −∞` grow like
  `|cosh z|^{−2|n|}` (resp. `|sinh z|^{−2|n|}`);
- for `ν ∉ ℤ`, `h > 0` and `0 < |cosh z| < 1`, the series
  `∑ₙ (−1)ⁿ c^ν_{2n}(h²) J_{ν+2n}(2h cosh z)` of 28.23.2 is not summable
  (`not_summable_besselJ_series`);
- DLMF 28.23.6–28.23.13 in the regions stated after 28.23.13;
- DLMF 28.24.1 for every `n ∈ ℤ` and all `z ∈ ℂ`, in its multiplied form (both sides `0` when
  `c^ν_{2n}(h²) = 0`);
- DLMF 28.24.2–28.24.13 for every index `s` in the form multiplied through by the coefficient in the
  denominator (`ε_s A^{2m}_{2s}(h²)` in 28.24.2, and its analogues), and in DLMF's quotient form
  under the hypothesis that this coefficient is nonzero; for 28.24.2–28.24.9 for all `z ∈ ℂ`, for
  28.24.10–28.24.13 on `|Im z| < π`; absolutely and uniformly on compact sets. At the lowest index
  (`s = 0` in 28.24.2, and the coefficients `A^{2m}_0`, `A^{2m+1}_1`, `B^{2m+1}_1`, `B^{2m+2}_2` at
  `q = h²` or `−h²` in general) the coefficient is nonzero by 6.2, so the quotient forms hold
  there unconditionally.

Principal values do not suffice for the global identities: with principal `Y_ℓ(h e^z)`, the right
side of DLMF 28.24.2 at `m = s = 0`, `j = 2`, would be `2πi`-periodic in `z`, making
`Mc^{(1)}_0(it)` and `Mc^{(2)}_0(it)` two independent `2π`-periodic solutions of Mathieu's
equation, against Ince's theorem. With principal values the identities hold on `|Im z| < π`
only. The nonvanishing hypotheses are not removable either: at `q* = 69.42837 82910`, where
`a₄(q*) = 0`, the coefficient `A^4_2(q*)` vanishes, and with Lean's division 28.24.2 at `m = 2`,
`s = 1` would make `Mc^{(j)}_4(·, √q*)` zero.

The cross-product theorem: a series `∑_ℓ c_ℓ u_{ℓ−n}(he^{−z}) v_{ℓ+n}(he^z)` whose coefficients
satisfy the recurrence DLMF 28.14.4 and decay like `K^{|ℓ|}/(|ℓ|!)²`, with `u`, `v` solutions of the
Bessel recurrence growing at most like `A^{|k|} |k|!`, converges, is independent of `n` up to the
factor `c_{2n}`, and solves the modified equation; its normalization at `Re z → ∞` is read off from
the term `ℓ = n`.

**Checks.**
- DLMF 28.23.2 with `j = 1`, `ν = ½`, `q = 1`, `z = i` (`|cosh z| = 0.540`): the terms
  `|c_{2n} J_{ν+2n}(2 cos 1)|` are `3.6·10³` at `n = −12`, `1.4·10²` at `n = −9`, `6.6` at `n = −6`.
- At `ν ∈ ℤ` the `j = 1` series converges for all `z`, since `J_{ν+2n}` with `ν + 2n < 0` is
  `(−1)^{ν+2n} J_{|ν+2n|}`.
- At `m = s = 0`, `j = 2`, the principal-value right side of DLMF 28.24.2 is `2πi`-periodic in `z`,
  which no nonzero multiple of `Mc^{(2)}_0` is.

*Needs:* 8.1–8.3, 4.5, 6.2, 4.2; SpecialFunctionsBessel Layer 1 (with §§1.2, 1.6) and §4.1.

### 8.5 Integral identities for the modified functions

Sources: DLMF 28.28.1–28.28.49.

Prove:
- DLMF 28.28.2–28.28.5;
- DLMF 28.28.7–28.28.9 for paths `L_j` along whose ends `Im w(t) → +∞`, so that the integrands
  decay;
- DLMF 28.28.11–28.28.14 under 28.28.10, with `e^{iνπ/2}` in place of DLMF's `e^{iνπ}` in 28.28.11;
- at integer order `n`, under 28.28.10,
  `∫₀^∞ e^{2ih cosh z cosh t} ce_n(it, h²) dt = ½πi iⁿ ce_n(0, h²) Mc^{(3)}_n(z, h)`
  (`integral_exp_mul_mathieuCe`);
- DLMF 28.28.15, and 28.28.16 in the corrected form

```text
∫₀^∞ sin(2h cos y cosh t) Ce_{2n}(t, h²) dt
    = (π A^{2n}_0(h²) / (2 ce_{2n}(π/2, h²))) (ce_{2n}(y, h²) ∓ 2 fe_{2n}(y, h²)/(π C_{2n}(h²))),
```

  the upper sign for `0 ≤ y ≤ π` and the lower for `−π ≤ y ≤ 0`; DLMF prints an extra overall
  minus sign and assigns the lower sign to `π ≤ y ≤ 2π`, where neither sign holds (`fe_{2n}` is not
  periodic);
- DLMF 28.28.17–28.28.23;
- DLMF 28.28.24–28.28.49, each with the hypothesis that the `D`-, `Ds`-, `Dc`- or `Dsc`-value in
  its denominator is nonzero.

*Needs:* 8.1–8.4, 4.3, 4.4; SpecialFunctionsBessel §4.2.

### Examples

- DLMF 28.28.11 with `ν = n ∈ {0, 1, 2, 3}`, `h = 1`, `z = 1 + 0.5i`: the ratio of the left side to
  `½πi ce_n(0, 1) Mc^{(3)}_n(z, 1)` is `1, i, −1, −i` (to the quadrature accuracy), that is
  `e^{inπ/2}`, not `e^{inπ}`.
- DLMF 28.28.16 with `n = 0`, `h = 1`: the left side is `0.17414` at `y = 0.7` and `y = −0.7`, and
  `−0.17414` at `y = π ± 0.7`. The corrected right side gives these values on `[−π, π]`. DLMF's sign
  gives `−0.17414` at `y = 0.7`, and neither sign gives `−0.17414` at `y = π + 0.7` (the two
  choices give `−1.10403` and `2.38220`).

### Dependencies

Layers 1, 4, 6–7; AsymptoticExpansions §10.4; SpecialFunctionsBessel.

## Downstream consumers

- Spheroidal wave functions, whose equation contains Mathieu's as a special case (Kristensson
  §8.6.3, p. 161).
- Separation of variables for the Helmholtz equation in elliptic and parabolic cylinder
  coordinates (1.4 here; Temme §10.2).
- Spectral theory of one-dimensional periodic Schrödinger operators, for which Hill's
  discriminant and the bands of 3.3 describe the spectrum.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **Graphics, tables and computation** of the characteristic values and functions (DLMF §§28.3,
  28.13, 28.21, 28.34–28.35).
- **Large `q`**: the eigenvalue expansions and the exponentially small splitting, Sips' and
  Goldstein's expansions and the uniform approximations (DLMF §§28.8, 28.16, 28.26), and the
  large-`q` behaviour of the zeros and the imaginary zeros (DLMF §28.9). Their proofs need
  turning-point theory with a large parameter.
- **The constants in the decay of the Fourier coefficients**, which tie it to `w_II(π/2)` and
  `w_I(π/2)` (DLMF 28.4.24–28.4.27).
- **Radii of convergence** of the expansions in `q`: the numerical radii and their asymptotics
  (DLMF Table 28.6.1, 28.6.20), and Kato's explicit lower bounds (Kato Example VII-3.4, p. 390).
- **Global structure of the branches**: that the `a_{2n}(q)` (and likewise each of the other three
  families) are branches of one complete analytic function, equivalently that each of the four
  eigenvalue equations is irreducible (DLMF §28.7). The local continuation of 7.4 does not show
  that the monodromy acts transitively on the branches.
- **Sharper Puiseux exponents**: that the ramification at an exceptional value of multiplicity `k`
  needs only `(q − q₀)^{1/k}` (7.4 proves `1/k!`).
- **Hill eigenvalue asymptotics** for large index (DLMF 28.29.19–28.29.22) and the motion of the
  Dirichlet values through the gaps under translation of `Q` (Levitan–Sargsjan Theorem 1.4.4,
  pp. 23–24).
- **Complex-variable Hill equations** with `Q` analytic in a strip (DLMF §28.30(ii)), and the
  expansions in Mathieu functions at complex normal and exceptional values of `q`.
- **Lindemann–Stieltjes theory** of the product of the two Floquet solutions as an entire function
  (Whittaker–Watson §19.5).
- **Addition theorems** for Mathieu functions, which DLMF §28.27 describes without formulas.
- **Imaginary `h`**: DLMF 28.20.22–28.20.24 and DLMF's route to `Ie_n, Io_n, Ke_n, Ko_n` through
  `M^{(j)}_ν(z, ih)`, which need the continuation of `M^{(j)}_ν` in `h` off the positive axis, past
  the exceptional values of `λ_ν(h²)`.
- The asymptotic behaviour of the paraboloidal wave functions as `z → ±i∞` (DLMF §28.31(iii)).
- **Physical applications** (DLMF §§28.32–28.33; Hale–Koçak §8.6).

## Prior formalization

[`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes these functions in
`DLMF/Mathieu/` (about 35,000 lines, with the ODE support in `DLMFMathlib/Analysis/ODE/`). It is the
same author's work, and this roadmap reuses its design where that fits: the basic solutions by
majorant series, the characteristic values as ordered roots of the four boundary functions with no
operator theory, the sign conventions `ce_n(0) > 0`, `se_n′(0) > 0`, `fe_n′(0) > 0`,
`ge_n(0) > 0`, Ince's theorem through the Fourier recurrences, and the Pincherle argument for the
continued fractions. This roadmap differs in defining `λ_ν` and `me_ν` for real `ν` and `q` by the
band structure rather than by continuation along segments, in defining `M^{(j)}_ν` by their Hankel
asymptotics rather than by a cross-product series at a chosen index, and in proving the small-`q`
expansions as Taylor coefficients of holomorphic functions rather than as `O`-estimates. Its
`DLMFMathlib/Analysis/Matrix/InfiniteDeterminant.lean` proves the convergence of infinite
determinants with absolutely summable entries that 2.3 needs.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| lean-DLMF | Here | Status there |
|---|---|---|
| `Mathieu/Basic/`, `Mathieu/Properties/` | 1.2–1.3, 2.2, 2.4, 3.4, 4.1 | proved |
| `Mathieu/SturmBridge.lean`, `Mathieu/SpectralContinuity.lean`; `DLMFMathlib/Analysis/ODE/Sturm*` | 3.1, 3.4, 4.1 | proved (separated Sturm–Liouville problems, comparison, oscillation count, continuity of the spectrum) |
| `Mathieu/FourierSeries.lean`, `Mathieu/SmallQ*`, `Mathieu/ContinuedFractionTails.lean`, `Mathieu/EigenvalueInterlacing.lean` | 4.2, 7.1–7.3 | proved, except DLMF 28.4.24–27, 28.6.20 and the radii; the interlacing file proves the ordering after the small-`q` work, the order of 7.2 here |
| `Mathieu/Continuation.lean` | 7.4–7.5 | admitted, including the sum rules and the irreducibility (beyond this roadmap) |
| `Mathieu/SecondSolutions.lean` | 4.3 | proved, except the `q → 0` limits |
| `Mathieu/IntegralEquations.lean`, `Mathieu/Expansions.lean` | 6.2–6.3 | DLMF 28.10.1–8 proved; 28.10.9–10, 28.11 admitted |
| `Mathieu/Noninteger/` | 3.5, 4.4–4.5, 6.4, 7.1–7.3 | the normalization, Floquet property and symmetries of DLMF 28.12, real-root continuation, 28.14.1–9, 28.15.2, 28.17 proved; the enumeration of all roots by `λ_{ν+2n}` and the discontinuity at integer `ν`, 28.14.10, 28.15.1, 28.15.3, 28.19 admitted |
| `Mathieu/Modified/` | Layer 8 | DLMF 28.22, 28.24, 28.20.21 proved, with the continued Bessel evaluations and the nonvanishing hypotheses of 8.4; 28.20.9–12, 28.23, 28.25, most of 28.28 admitted |
| `Mathieu/Hill/` | 1.1, 2.1, 3.2–3.3, 6.1, Layer 5 | Floquet theory proved; DLMF 28.29.16–18, 28.30, most of 28.31 admitted |

The admitted statements there are proof work here. 3.5's band labelling of `λ_ν` by `nthLeast` has
no counterpart there; the bridge from lean-DLMF's continuation along segments to it is part of 3.5.
A theorem with a proof there may still rest on admitted prerequisites; the table does not certify
the transitive closure. lean-DLMF's counterexample to DLMF 28.2.33 at `n = 0` concerns its junk
value for `se_0(z, q)`; with `se_0 = 0` here, 28.2.33 holds as printed.

## References

- V. I. Arnold, *Geometrical Methods in the Theory of Ordinary Differential Equations*, 2nd ed.,
  Grundlehren 250, Springer, 1988, §26.A (Floquet's theorem).
- R. Courant and D. Hilbert, *Methods of Mathematical Physics*, Vol. I, Interscience, 1953,
  Ch. V §16.3 (the elliptic membrane).
- J. K. Hale and H. Koçak, *Dynamics and Bifurcations*, Texts in Applied Mathematics 3, Springer,
  1991, §8.6 (linear systems with periodic coefficients; Mathieu's equation).
- T. Kato, *Perturbation Theory for Linear Operators*, Classics in Mathematics, Springer, 1995,
  §II.1 (analytic perturbation of eigenvalues) and §VII.3, Example 3.4 (the Mathieu equation).
- G. Kristensson, *Second Order Differential Equations: Special Functions and Their
  Classification*, Springer, 2010, §8.6.3 (Mathieu's equation from the spheroidal equation).
- B. M. Levitan and I. S. Sargsjan, *Sturm–Liouville and Dirac Operators*, Mathematics and its
  Applications (Soviet Series) 59, Kluwer, 1991, §§1.3–1.6 (Sturm theory, the periodic and
  semi-periodic problems, expansion theorems), §2.6 (Floquet solutions).
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 (2026-09-15), Chapter 28,
  <https://dlmf.nist.gov/28>, and from Chapter 10 the equations 10.2.3, 10.4.3, 10.25.2, 10.27.4
  and §10.11. Equation numbers refer to this release.
- N. M. Temme, *Special Functions: An Introduction to the Classical Functions of Mathematical
  Physics*, Wiley, 1996, §10.2.3 (elliptic cylinder coordinates).
- E. T. Whittaker and G. N. Watson, *A Course of Modern Analysis*, 4th ed., Cambridge University
  Press, 1927, Chapter XIX (§§19.1–19.61).
