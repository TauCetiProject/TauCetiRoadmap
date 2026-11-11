# Roadmap: the generalized hypergeometric functions

**Summary.** This roadmap builds the theory of the generalized hypergeometric functions `ₚF_q`
of Chapter 16 of the NIST *Digital Library of Mathematical Functions* (DLMF; see
[References](#references)) as a library. Mathlib has the regularized series

```text
𝐅(𝐚; 𝐛; z) = ∑ₙ (a₁)ₙ ⋯ (a_p)ₙ / (Γ(b₁ + n) ⋯ Γ(b_q + n) n!) zⁿ                       (DLMF 16.2.5)
```

as `Complex.regularizedHGFun a b z`, with multisets `a`, `b` of complex parameters, and its
radius of convergence: infinite for `p ≤ q`, `1` for `p = q + 1`. This roadmap defines the
principal branch of `𝐅` on the cut plane `ℂ \ [1, ∞)` for `p = q + 1` and all complex
parameters, as the continuation of Mathlib's series, and `F = Γ(b₁) ⋯ Γ(b_q) 𝐅`, and proves the
classical theory of DLMF §§16.2–16.12 for them.

The roadmap covers:
- the principal branch, its existence by Euler's integral and contiguous shifts, its joint
  holomorphy in the parameters and the argument, the terminating cases, and the series on its
  circle of convergence;
- the derivatives and the contiguous relations;
- the generalized hypergeometric equation, Abel's identity for linear equations of any order,
  and the fundamental solutions at `0` and, for `p = q + 1`, at `∞`;
- the values at `z = 1`: the sums of Pfaff–Saalschütz, Dixon, Watson, Whipple, Džrbasjan,
  Rogers–Dougall and Dougall, the transformations of Kummer–Thomae and Whipple, the three-term
  relations, and Dougall's bilateral sum;
- the Euler, Laplace, inverse Laplace and Mellin–Barnes integrals, the connection formula at `∞`
  for `p = q + 1` and its expansion about an arbitrary centre;
- the quadratic and cubic transformations, the expansions in series of `ₚF_q` functions, and the
  product formulas, including Clausen's formula;
- the confluence limits and the large-parameter expansions.

**This roadmap is DLMF §§16.1–16.12, not all of it.** The formula ranges are in the table under
[Scope and ownership](#scope-and-ownership). The Appell functions (§§16.13–16.16), the Meijer
`G`-function (§§16.17–16.22) and the non-terminating `ₚF_q` with `p > q + 1`, which DLMF defines
through the Mellin–Barnes integral 16.5.1 and which is a Meijer `G`-function, are listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement), with the
large-variable asymptotics of §16.11(ii), the zeros of §16.9, and the applications and
computation sections.

The roadmap rests on Mathlib and Tau Ceti and on three roadmaps on main. It consumes the Gauss
function, Gauss's sum, the Chu–Vandermonde sum, Dougall's bilateral sum, the periodic Carlson lemma,
Gauss's second theorem and Bailey's sum at `½`, the Euler transformation and the Mellin–Barnes
integral of `(1 + u)^{−a}` from
[SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md); the Gamma function on
sectors and vertical strips from [ZerosOfLFunctions](../ZerosOfLFunctions/README.md); and the
line-shift identity, the Gamma bound on strips and the Cahen–Mellin integral from
[AsymptoticExpansions](../AsymptoticExpansions/README.md).

Suggested home: `TauCeti/Analysis/SpecialFunctions/GeneralizedHypergeometric/`, beside Tau Ceti's
`TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`, which this roadmap extends.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Definition and analytic properties** (DLMF §16.2, 16.5.2).
2. **Derivatives and contiguous relations** (DLMF §16.3).
3. **The differential equation** (DLMF §16.8(i)–(ii) without 16.8.8–16.8.9 and the logarithmic
   cases).
4. **Argument unity** (DLMF §16.4(i)–(iii), (v)).
5. **Integral representations and the connection at infinity** (DLMF 16.5.1, 16.5.3–16.5.4 for
   `p ≤ q + 1`, 16.8.8–16.8.9, 16.11.2, 16.11.6).
6. **Transformations, expansions and products** (DLMF §§16.6, 16.10, 16.12).
7. **Limits and asymptotics in the parameters** (DLMF §16.8(iii), §16.11(iii)).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas, with the hypotheses and conventions
specified in the layers:

| Formulas | Targets |
|---|---|
| 16.2.1–16.2.5, the analytic properties of §16.2(ii)–(iii) and (v) | Definition, existence, holomorphy, terminating cases, circle of convergence (Layer 1). |
| 16.5.2 | Euler's integral, by which the continuation is constructed (1.2). |
| 16.3.1–16.3.7 | Derivatives and contiguous relations (Layer 2). |
| 16.8.1–16.8.7 | The equation, its singularities, Wronskians and the fundamental solutions at `0` and `∞` (Layer 3). |
| 16.4.1–16.4.2, 16.4.2_5, 16.4.3–16.4.15, 16.4.16–16.4.17 | Classification, summations, transformations, three-term relations and the bilateral sum at `z = 1` (Layer 4). |
| 16.5.1, 16.5.3, 16.5.4 for `p ≤ q + 1`; 16.8.8, 16.8.9, 16.11.2, 16.11.6 | Integral representations, the connection formula at `∞` and its expansions (Layer 5). |
| 16.6.1–16.6.2, 16.10.1–16.10.2, 16.12.1–16.12.3 | Quadratic and cubic transformations, expansions in series of `ₚF_q`, products (Layer 6). |
| 16.8.10–16.8.11, 16.11.10–16.11.11 | Confluence and large-parameter limits (Layer 7). |

Cases of these formulas that Mathlib or Tau Ceti already proves are inputs, not targets; the
targets are the remaining cases. The inputs are:
- the series: Mathlib's `Complex.regularizedHGFunCoeff`, `Complex.regularizedHGFunSeries` and
  `Complex.regularizedHGFun`, the radius of convergence (`radius_regularizedHGFunSeries_eq_top`,
  `radius_regularizedHGFunSeries_eq_one`, `radius_regularizedHGFunSeries_eq_top_of_finite`), the
  analyticity of the sum on its disk (`analyticOnNhd_regularizedHGFun_of_card_le`,
  `analyticOnNhd_regularizedHGFun_of_card_eq_add_one`), and Tau Ceti's
  `hasSum_regularizedHGFun` for `p ≤ q`;
- `₀F₀ = exp` (Mathlib's `regularizedHGFun_zero_zero`) and the contiguous relation 16.3.6 of
  `₀F₁` (Mathlib's `regularizedHGFun_zero_singleton_eq_mul_add_mul`);
- the case `p = 2`, `q = 1`: SpecialFunctionsHypergeometric's principal branch of the Gauss
  function, and its Layers 1–9 for every formula of DLMF Chapter 15. A formula of this roadmap
  that specializes to one of Chapter 15 is stated here for general `p` and `q`, and its case
  `p = 2`, `q = 1` follows from the agreement theorem of 1.2; this roadmap does not restate
  Chapter 15.

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti nor the consumed roadmaps provide:

| Result | Target |
|---|---|
| The shift relations in a top and a bottom parameter, for the series and for the principal branch | 1.2 |
| Euler's integral in one pair of parameters, holomorphic on the cut plane, and the existence of the continuation by induction on `q` | 1.2 |
| The fixed-count shift construction, its region of holomorphy and the compatibility of different counts | 1.2 |
| The growth bound `|ₚF_p(𝐚; 𝐛; w)| ≤ C (1 + |w|)^K e^{max(Re w, 0)}` | 1.5 |
| Linear equations of order `n` on a connected open set: Abel's identity for the Wronskian, and the criterion that `n` solutions with nonvanishing Wronskian span all solutions | 3.1 |
| The Wronskians of the fundamental sets 16.8.6 and 16.8.7 in closed form | 3.3–3.4 |
| The terminating Rogers–Dougall sum as the limit `f → ∞` of Dougall's sum 16.4.10 | 4.2 |
| First-order recurrences in `c` for Watson's and Whipple's sums (WZ pairs), and the passage to the non-terminating sums by periodicity and the limit `c → ∞` | 4.3 |
| Hankel's integral `1/Γ(b) = (2πi)⁻¹ ∫_{(c)} eᵗ t^{−b} dt` on a vertical line, as an improper integral for `Re b > 0` | 5.1 |
| The Mellin–Barnes integrals for `p ∈ {q, q + 1}` by induction on `q`, and the separating contour as a line plus finitely many residues | 5.2 |
| The loop contour around the nonnegative integers, written as two rays and a segment, and its residue evaluation | 5.2 |

**What it does not own:**
- The Gauss function and DLMF Chapter 15 (SpecialFunctionsHypergeometric), whose results 1.2–1.4,
  4.2, 5.1, 6.3 and 7.3 it consumes.
- Stirling's formula on sectors and the Gamma function on vertical strips (ZerosOfLFunctions
  1.2–1.3), and the line-shift identity, the Gamma bound on strips and the Cahen–Mellin integral
  (AsymptoticExpansions 8.2, 8.6 and 8.7).
- The Appell functions, the Meijer `G`-function, the non-terminating `ₚF_q` with `p > q + 1`,
  the large-variable expansions 16.11.1, 16.11.3–16.11.5 and 16.11.7–16.11.9, the zeros of §16.9,
  the logarithmic fundamental solutions of §16.8(ii), the fundamental solutions at `z = 1`, the
  existence of contiguous relations between any `q + 2` contiguous functions, the continued
  fractions of §16.4(iv), and the applications and computation sections.

See the last section for these.

**The boundary in one sentence:** this roadmap owns the principal branch of `F` and `𝐅` for
`p ≤ q + 1` on its domain, the terminating functions for all `p` and `q`, and everything in DLMF
§§16.2–16.12 stated through them, elementary functions and `Γ`, except the non-terminating
`p > q + 1` case, the large-variable asymptotics, the zeros and the logarithmic and `z = 1`
fundamental solutions; it consumes the Gauss function from SpecialFunctionsHypergeometric and the
Gamma-function estimates and Mellin tools from ZerosOfLFunctions and AsymptoticExpansions.

## Conventions

- **Parameters** are Mathlib's: multisets `a b : Multiset ℂ` with `p = Multiset.card a` and
  `q = Multiset.card b`. DLMF's vectors `𝐚 = (a₁, …, a_p)` and `𝐛 = (b₁, …, b_q)` are multisets
  because `ₚF_q` is symmetric in its top and in its bottom parameters. A formula that singles out
  a parameter writes the multiset as `a₀ ::ₘ a`, or lists it, as in `{a, b, c}`. Shifted
  parameters `𝐚 + n` and `1 − m − 𝐚` are `a.map (· + n)` and `a.map (1 − m − ·)`.
- **Pochhammer symbols.** `(a)ₙ` is `(ascPochhammer ℂ n).eval a`, and `(𝐚)ₙ` is the product
  `(a.map fun x ↦ (ascPochhammer ℂ n).eval x).prod`.
- **Names.** The functions live in `Complex`, beside Mathlib's `Complex.regularizedHGFun`:
  `Complex.regularizedGeneralizedHypergeometric a b z` for `𝐅(𝐚; 𝐛; z)` and
  `Complex.generalizedHypergeometric a b z` for `F(𝐚; 𝐛; z)`, parameters first. Mathlib's
  `Complex.regularizedHGFun a b` is the sum of the series, which outside its disk of convergence
  is Lean's value of a divergent `tsum`; this roadmap uses it only inside that disk, at `z = 1`
  where the series converges, and in the terminating cases, where it is a polynomial.
  Derivatives are Mathlib's `deriv` and `iteratedDeriv`; no derivative functions are introduced.
- **The domain.** The domain of `𝐅(𝐚; 𝐛; ·)` is `ℂ` for `p ≤ q`, and the cut plane
  `{z | 1 − z ∈ slitPlane}` for `p = q + 1`. DLMF's `|ph(1 − z)| < π` is `1 − z ∈ slitPlane`;
  likewise `|ph z| < π` is `z ∈ slitPlane` and `|ph(−z)| < π` is `−z ∈ slitPlane`.
- **The definition.** `regularizedGeneralizedHypergeometric a b z` is
  - Mathlib's `regularizedHGFun a b z` when `p ≠ q + 1`;
  - when `p = q + 1` and `1 − z ∈ slitPlane`, the value at `z` of a function that is holomorphic
    on the cut plane and equals Mathlib's series on the unit disk
    (`IsPrincipalContinuation`); it is `Classical.choose` of the existence of such a
    function, and 1.2 proves that it exists and that its values on the cut plane do not depend on
    the choice;
  - `0` when `p = q + 1` and `1 − z ∉ slitPlane`, a junk value that no theorem uses.

  For `p > q + 1` the definition is DLMF's only in the terminating case, where Mathlib's series
  is a polynomial; the non-terminating case is outside this roadmap, and no theorem here uses it.
  When `p = q + 1` and the series terminates, the principal branch is the polynomial on the cut
  plane; the polynomial's values at `z = 1` and on the cut are Mathlib's series there, and `𝐅`
  itself is the junk `0` there. The construction
  by Euler's integral and contiguous shifts is a theorem (1.2), not the definition.
- **`F` and `𝐅`.** `generalizedHypergeometric a b z = (b.map Gamma).prod * 𝐅(𝐚; 𝐛; z)`. When some
  `b_k ∈ {0, −1, −2, …}` this is `0`, Mathlib's junk value of `Γ` at its poles; DLMF's `F` does
  not exist there. A formula that DLMF prints with `F` is stated with the hypothesis that the
  bottom parameters of every `F` in it lie outside `{0, −1, −2, …}`; it is also stated in its
  regularized form where that form holds for all parameters, and the layers say which form is
  the target.
- **Reciprocal Gamma factors** are `(Gamma ·)⁻¹`, which vanish at the poles, so a formula with
  `Γ` only in denominators holds for all parameters. A `Γ` in a numerator carries the hypothesis
  that its argument is not a pole.
- **Powers** are principal (`Complex.cpow`), with the branch of each factor as DLMF prints it, for
  instance `z^{1−b_j}` on `slitPlane` and `(−z)^{−a_j}` on `−z ∈ slitPlane`. A product of
  principal powers is not combined into one power.
- **Values at `z = 1`.** DLMF's `ₚF_q(𝐚; 𝐛; 1)` is Mathlib's series at `1`,
  `regularizedHGFun a b 1` (regularized), where the series converges absolutely, which for
  `p = q + 1` is `Re(Σ𝐛 − Σ𝐚) > 0` (1.6). The principal branch is not evaluated at `z = 1`, where
  its value is the junk `0`. Every non-terminating sum of Layer 4 is stated in regularized form,
  with `Γ` in a numerator only where DLMF prints it there. A terminating sum is stated with
  Pochhammer symbols, as a finite sum over `Finset.range (n + 1)`, under the hypothesis that the
  bottom Pochhammer symbols do not vanish.
- **Helpers.** `Suggested.lean` uses three abbreviations, which are not targets: `hgDomain`
  (`hgDomain a b` is the domain above); `terminatingSum` (`terminatingSum a b n` is the finite sum
  `∑_{k ≤ n} (𝐚)ₖ/((𝐛)ₖ k!)` over lists of parameters); and `thetaShift` (`thetaShift c g` is the
  function `z ↦ z g′(z) + c g(z)`).
- **Equations are not predicates.** A solution of 16.8.3 on an open set `U` is stated with
  `DifferentiableOn ℂ w U` and the equation at each point of `U`, written with `iteratedDeriv`.
  The Euler operator `ϑ = z d/dz` is written out: `ϑ` applied `k` times is `z ↦ z * deriv f z`
  iterated, and `ϑ + c` is `z ↦ z * deriv f z + c * f z`.
- **Wronskians.** For functions `w₀, …, w_{n−1}` the Wronskian is
  `(Matrix.of fun i j : Fin n ↦ iteratedDeriv i (w j) z).det`.
- **Limits.** DLMF's `z → 1−` is the limit along `𝓝[<] (1 : ℝ)`; Abel's theorem is also stated
  on Stolz sets (Mathlib's `Complex.stolzSet`). A limit "as `|α| → ∞`" is along
  `Bornology.cobounded ℂ`, restricted to the stated sector.
- **Contours.** Each contour integral is a sum of integrals over explicit segments and rays, with
  the branch of every power fixed on each piece by its phase. Mellin–Barnes integrals are along a
  vertical line `Re s = σ`, written `∫ y : ℝ, f (σ + y * I)` with the factor `1/(2π)` for
  `(2πi)⁻¹ ∫ ds`; DLMF's separating contour is the line integral plus finitely many residues
  (5.2).

## Exact supplier contracts

### From [SpecialFunctionsHypergeometric](../SpecialFunctionsHypergeometric/README.md)

- [Its Conventions](../SpecialFunctionsHypergeometric/README.md#conventions):
  `Complex.regularizedGaussHypergeometric a b c z` (`𝐅(a, b; c; z)`) and
  `Complex.gaussHypergeometric a b c z`, the principal branches on the cut plane.
- Its 1.2–1.4: the definition, the agreement with Mathlib's series on the unit disk
  (`regularizedGaussHypergeometric_eq_regularizedGaussHGFun`), holomorphy on the cut plane, and
  the identity principle on the cut plane. 1.2 here identifies `𝐅({a, b}; {c}; ·)` with it.
- Its 4.2: Gauss's sum 15.4.20 (`ordinaryHypergeometric_one`), the Chu–Vandermonde sum 15.4.24
  (`ordinaryHypergeometric_neg_nat_one`), Dougall's bilateral sum 15.4.25 (`hasSum_dougall`) and
  the periodic Carlson lemma. Layer 4 uses all four.
- Its 5.1: the Euler transformation 15.8.1 (`regularizedGaussHypergeometric_euler`), for the
  Kummer–Thomae transformation 16.4.11.
- Its 6.3: the Mellin–Barnes integral of `(1 + u)^{−a}`,
  `Γ(a) (1 + u)^{−a} = (1/2π) ∫ Γ(σ′ + iy) Γ(a − σ′ − iy) u^{−σ′−iy} dy` for `0 < σ′ < Re a` and
  `u > 0`, the base case of the induction in 5.2.
- Its 7.3: Gauss's second theorem 15.4.28 (`gaussHypergeometric_half`) and Bailey's sum 15.4.30,
  `F(a, 1 − a; c; ½)`, the limits of Watson's and Whipple's sums as `c → ∞` (4.3).

### From [ZerosOfLFunctions](../ZerosOfLFunctions/README.md)

- [§1.2 Stirling on the sector](../ZerosOfLFunctions/README.md#12-stirling-on-the-sector):
  `log Γ(s) = (s − ½) log s − s + ½ log 2π + O(1/|s|)` uniformly on `|ph s| ≤ π − δ`. With the
  reflection formula it bounds the integrand of 16.5.1 on the lines `Re s = −N − τ` uniformly in
  `N`, where `τ` keeps the lines a fixed distance from the poles (5.3). It also gives
  `Γ(x + α)/Γ(x + β) ~ x^{α−β}` as `x → ∞`, for the limits `c → ∞` of the right sides of
  Watson's and Whipple's sums (4.3).
- [§1.3 Vertical strips](../ZerosOfLFunctions/README.md#13-vertical-strips): the bounds for `|Γ|`
  and `|1/Γ|` on vertical strips of bounded width, for the growth estimates of Layer 4.

### From [AsymptoticExpansions](../AsymptoticExpansions/README.md)

- Its 8.2, the line-shift identity for Mellin–Barnes integrals
  (`integral_vertical_sub_eq_two_pi_mul_sum_residue`) with its iteration over a sequence of
  lines, for 16.11.6 and the separating contour (5.2–5.3).
- Its 8.6, `exists_norm_Gamma_le`: `|Γ(x + iy)| ≤ C (1 + |y|)^K e^{−π|y|/2}` on a strip, away
  from the poles, for the integrability of the Mellin–Barnes integrands (5.2).
- Its 8.7, the Cahen–Mellin integral `∫_ℝ Γ(c + iy) w^{−c−iy} dy = 2π e^{−w}` for `c > 0` and
  `Re w > 0` (`integral_Gamma_mul_cpow_neg`), the base case `₀F₀(−w) = e^{−w}` of the induction
  in 5.2.

### From Tau Ceti

- **The series.** `hasSum_regularizedHGFun` (`p ≤ q`, every `z`;
  `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`).
- **The binomial series.** `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one`
  (`TauCeti/Analysis/Analytic/Binomial.lean`), for `₁F₀` on the disk.
- **Residues.** `TauCeti.Contour.residue` and the residue theorem
  (`TauCeti/Analysis/Contour/Residue/`), for the loop contour of 5.2.

### From Mathlib

- **The series.** `Complex.regularizedHGFunCoeff`, `Complex.regularizedHGFunSeries`,
  `Complex.regularizedHGFun`, `Complex.regularizedHGFunCoeff_add_one`,
  `Complex.regularizedHGFunCoeff_eq_zero_iff`, `Complex.regularizedHGFun_zero`,
  `Complex.radius_regularizedHGFunSeries_eq_top`, `Complex.radius_regularizedHGFunSeries_eq_one`,
  `Complex.radius_regularizedHGFunSeries_eq_top_of_finite`,
  `Complex.analyticOnNhd_regularizedHGFun_of_card_le`,
  `Complex.analyticOnNhd_regularizedHGFun_of_card_eq_add_one`,
  `Complex.regularizedHGFun_zero_zero` and `Complex.regularizedHGFun_zero_singleton_eq_mul_add_mul`
  (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`).
- **Binomial series.** `Complex.one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero`
  (`Mathlib/Analysis/Analytic/Binomial.lean`).
- **Gamma and Beta.** `Complex.Gamma`, `Complex.Gamma_add_one`, `Complex.Gamma_ne_zero`,
  `Complex.Gamma_conj`, `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_mul_Gamma_one_sub`
  (reflection), `Complex.Gamma_mul_Gamma_add_half` (duplication),
  `Complex.Gamma_add_nat_div_Gamma_eq`, `Complex.GammaSeq_tendsto_Gamma`, `Complex.betaIntegral`,
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.GammaIntegral_eq_mellin` and
  `Complex.digamma`.
- **Polynomials and combinatorics.** `ascPochhammer`, `Nat.stirlingSecond` (for 16.8.4–16.8.5).
- **Holomorphic functions.** `Complex.slitPlane`, `Complex.starConvex_one_slitPlane`,
  `DifferentiableOn.analyticOnNhd`, the identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `IsOpen.is_const_of_deriv_eq_zero`,
  Liouville's theorem `Differentiable.apply_eq_apply_of_bounded`, and Abel's theorem
  `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`.
- **Integration.** `intervalIntegral`, `MeasureTheory.integral` on `Set.Ioi` and on `ℝ`, Fubini,
  dominated convergence, parametric differentiation
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`), Fourier inversion
  (`MeasureTheory.Integrable.fourierInv_fourier_eq`) and Mellin inversion
  (`mellinInv_mellin_eq`).
- **Matrices.** `Matrix.det`, `Matrix.det_vandermonde`.

## How to read the build

Layer 1 defines the principal branch as the continuation of Mathlib's series to the cut plane and
constructs it by induction on `q`. The base case is `₁F₀(a; ; z) = (1 − z)^{−a}`. Euler's integral
16.5.2 in a pair `(a₀, b₀)` with `Re b₀ > Re a₀ > 0` carries a principal branch with `q − 1`
bottom parameters to one with `q`, because `zt` lies in the cut plane for `t ∈ [0, 1]` when `z`
does; two shift relations of the coefficients, one raising `b₀` and one raising `a₀`, reach every
`(a₀, b₀)` from that region, as in SpecialFunctionsHypergeometric 1.2. Every identity proved on a
piece of the unit disk then extends to the cut plane by the identity theorem, and to all
parameters by holomorphy in the parameters. Layer 2 proves the derivatives and contiguous
relations this way from the series, and Layer 3 the equation. Layer 3 also proves Abel's identity
for linear equations of order `n` and the spanning criterion, which replace the general theory of
linear differential equations.

Layer 4 works at `z = 1` with Mathlib's series. Its terminating sums are finite identities, its
non-terminating sums follow from a first-order recurrence in one parameter, with either the
terminating values and the periodic Carlson lemma (Rogers–Dougall) or a limit of the parameter at
infinity (Watson, Whipple), and its transformations come from Euler's integral and the Euler
transformation of the Gauss function. Layer 5 proves the Mellin–Barnes integral by induction on
`q` through Euler's integral and Fubini, from the Cahen–Mellin integral and the Mellin–Barnes
integral of `(1 + u)^{−a}`; shifting its line to the left across the poles gives the convergent
expansion at `∞` for `p = q + 1`, 16.11.6, and from it the connection formula 16.8.8 and its
expansion 16.8.9 about any centre. Layers 6–7 apply Layers 1–5. The `**Checks.**` and
`### Examples` of each layer are statements to prove; they test the conventions on explicit
values.

## Layer 1: definition and analytic properties

### 1.1 The series

For every `a`, `b` and `n`, with `(𝐚)ₙ` as pinned:
- the coefficients: `regularizedHGFunCoeff a b n = (𝐚)ₙ/(n! ∏_k Γ(b_k + n))`, and, when no `b_k`
  lies in `{0, −1, −2, …}`, `(∏_k Γ(b_k)) · regularizedHGFunCoeff a b n = (𝐚)ₙ/((𝐛)ₙ n!)`
  (16.2.1 and 16.2.5);
- the series converges:
  `HasSum (fun n ↦ regularizedHGFunCoeff a b n * z ^ n) (regularizedHGFun a b z)` for `p ≤ q + 1`
  and `‖z‖ < 1`, and for every `z` when `p ≤ q` (Tau
  Ceti) or when some `a_j ∈ {0, −1, −2, …}`;
- terminating series (§16.2(iii)–(iv)): if `−m ∈ a` with `m : ℕ`, then
  `regularizedHGFun a b z = ∑_{n ≤ m} regularizedHGFunCoeff a b n zⁿ` for every `z`, for every `p`
  and `q`.

*Needs:* Mathlib's series, `Complex.radius_regularizedHGFunSeries_eq_top_of_finite`.

### 1.2 The principal branch for `p = q + 1`

`regularizedGeneralizedHypergeometric` and `generalizedHypergeometric` as pinned. The targets, for
`p = q + 1`:
- **uniqueness**: two functions holomorphic on the cut plane that equal Mathlib's series on the
  unit disk agree on the cut plane (the cut plane is open, connected and contains the disk)
  (`IsPrincipalContinuation.eqOn`);
- **the base case** `q = 0`: `𝐅({a}; ∅; z) = (1 − z)^{−a}` for `1 − z ∈ slitPlane`
  from the binomial series on the disk;
- **the shift relations**: for all parameters and `‖z‖ < 1`, as identities of Mathlib's series,
  and then for the principal branch on the cut plane,

```text
𝐅(a₀, a₁, 𝐚; b₀, 𝐛; z) = (b₀ − a₁) 𝐅(a₀, a₁, 𝐚; b₀ + 1, 𝐛; z) + a₁ 𝐅(a₀, a₁ + 1, 𝐚; b₀ + 1, 𝐛; z)
𝐅(a₀, 𝐚; b₀, 𝐛; z) = 𝐅(a₀ + 1, 𝐚; b₀, 𝐛; z) − z (𝐚)₁ 𝐅(a₀ + 1, 𝐚 + 1; b₀ + 1, 𝐛 + 1; z)
```

  where `(𝐚)₁` is the product of the parameters in `𝐚`; both follow from
  `1/Γ(b + n) = (b + n)/Γ(b + n + 1)` and `(a + 1)ₙ − (a)ₙ = n (a + 1)_{n−1}`, coefficient by
  coefficient (`regularizedGeneralizedHypergeometric_shift_bottom`,
  `regularizedGeneralizedHypergeometric_shift_top`);
- **Euler's integral** 16.5.2 in regularized form: for `Re b₀ > Re a₀ > 0`,

```text
𝐅(a₀ ::ₘ a; b₀ ::ₘ b; z) = (Γ(a₀) Γ(b₀ − a₀))⁻¹ ∫₀¹ t^{a₀−1} (1 − t)^{b₀−a₀−1} 𝐅(a; b; zt) dt
```

  for every `z` when `p ≤ q`, and for `1 − z ∈ slitPlane` when `p = q + 1`
  (`regularizedGeneralizedHypergeometric_eq_eulerIntegral`): on the disk by termwise integration
  and `Complex.Gamma_mul_Gamma_eq_betaIntegral`, then by the identity theorem; the right side is
  holomorphic in `z` on the cut plane, since the cut plane is star-shaped about `0`;
- **existence** (`exists_isPrincipalContinuation`), by induction on `q`: given the principal
  branches with `q − 1` bottom parameters, jointly holomorphic in all parameters and the argument
  (the induction carries this joint holomorphy, which 1.4 states), the right side of Euler's
  integral is a continuation for `Re b₀ > Re a₀ > 0`. The shift construction with fixed counts
  `S_{m,n}` applies the second shift relation `m` times and then the first `n` times, ending in
  Euler's integral, as in SpecialFunctionsHypergeometric 1.2: `S_{m,n}` is holomorphic on the open
  region where its last step lies in `Re b₀ > Re a₀ > 0`, it equals Mathlib's series on the disk,
  and two of them agree where both are defined. The regions cover all parameters, and the
  continuation at given parameters is the value of any `S_{m,n}` defined there;
- **agreement with the Gauss function**:
  `𝐅({a, b}; {c}; z) = regularizedGaussHypergeometric a b c z` and
  `F({a, b}; {c}; z) = gaussHypergeometric a b c z` for every `a`, `b`, `c` and `1 − z ∈ slitPlane`
  by uniqueness and SpecialFunctionsHypergeometric 1.3–1.4.

**Checks.**
- `𝐅({0.3, 0.5, 0.7}; {−1, 1.9}; 0.4) = 0.01009 18376 69…`, the series of 16.2.5 with its first two
  terms `0`, while `generalizedHypergeometric {0.3, 0.5, 0.7} {−1, 1.9} 0.4 = 0`. This excludes
  defining `𝐅` as `F/∏Γ(b_k)` with Lean's junk values at the poles of `Γ`.
- `F({0.3, 0.5, 0.7}; {1.2, 1.9}; 2 − i)` is the conjugate of the value at `2 + i` (Layer 1
  Examples). This excludes a branch continued across the cut `[1, ∞)` from the upper half-plane.
- Mathlib's `regularizedHGFun {1} 0` equals `1/(1 − z)` on the unit disk but is the value `0` of
  a divergent `tsum` at `z = −2`, so it is not a principal continuation (`IsPrincipalContinuation`),
  while `z ↦ 1/(1 − z)` is one; `𝐅({1}; ∅; −2) = 1/3`. This excludes taking Mathlib's series
  as the principal branch.

*Needs:* 1.1; SpecialFunctionsHypergeometric 1.2–1.4; Mathlib
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`,
`Complex.one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero`.

### 1.3 Agreement with the series

- `𝐅(a; b; z) = regularizedHGFun a b z` for `p ≤ q` and every `z`, and for `p = q + 1` and
  `‖z‖ < 1`;
- `F(a; b; z) = (∏_k Γ(b_k)) · regularizedHGFun a b z = ∑ₙ (𝐚)ₙ/((𝐛)ₙ n!) zⁿ` (16.2.1) on the same
  sets, when no `b_k ∈ {0, −1, −2, …}`;
- `𝐅(a; b; 0) = ∏_k Γ(b_k)⁻¹`; for `p = q + 1` and `−m ∈ a`, `𝐅(a; b; ·)` is Mathlib's terminating
  series on the cut plane.

*Needs:* 1.1–1.2.

### 1.4 Holomorphy in the parameters

DLMF §16.2(v), jointly: for `p ≤ q + 1`, the map
`(α, β, z) ↦ 𝐅(Multiset.map α univ.val; Multiset.map β univ.val; z)` on
`(Fin p → ℂ) × (Fin q → ℂ) × ℂ` is holomorphic on `univ × univ × D`, with `D` the domain
(`differentiableOn_regularizedGeneralizedHypergeometric`). For `p ≤ q`, and for `p = q + 1` on the
disk, this is locally uniform convergence of the series; for `p = q + 1` on the cut plane it is
the shift construction of 1.2, which near every point is one `S_{m,n}` with fixed counts. Also:
- `F` is holomorphic in `(α, β, z)` where no `β_k ∈ {0, −1, −2, …}`;
- `𝐅(ā; b̄; z̄) = conj 𝐅(a; b; z)` on the domain (`regularizedGeneralizedHypergeometric_conj`), so
  that `𝐅` is real for real parameters and real `z` in the domain.

*Needs:* 1.2–1.3; Mathlib `Complex.Gamma_conj`.

### 1.5 Terminating cases and a growth bound

- 16.2.3 and 16.2.4 for every `p` and `q`, as identities of finite sums. For 16.2.3: if `m : ℕ`,
  `(𝐛)ₘ ≠ 0` and `(1 − m − 𝐚)ₘ ≠ 0`, then for `z ≠ 0`

```text
∑_{k ≤ m} (−m)ₖ (𝐚)ₖ/((𝐛)ₖ k!) zᵏ
    = ((𝐚)ₘ (−z)ᵐ/(𝐛)ₘ) ∑_{k ≤ m} (−m)ₖ (1 − m − 𝐛)ₖ/((1 − m − 𝐚)ₖ k!) ((−1)^{p+q}/z)ᵏ;
```

  the left side is Mathlib's series of `{−m} + a`, `b` times `∏ Γ(b_k)`, and the hypothesis on `−m`
  being the largest nonpositive integer parameter of DLMF makes the bottom symbols nonzero
  (`terminatingSum_reverse_16_2_3`). 16.2.4 likewise, for every partial sum: the right side is the
  one printed, `(𝐚)ₘ zᵐ/((𝐛)ₘ m!)` times the terminating
  `_{q+2}F_p(−m, 1, 1 − m − 𝐛; 1 − m − 𝐚; (−1)^{p+q+1}/z)`, as a finite sum
  The proof reverses the order of summation, `k ↦ m − k`.
- **The growth bound** for `p = q`: there are `C` and `K` such that
  `|𝐅(a; b; w)| ≤ C (1 + |w|)^K e^{max(Re w, 0)}` for every `w`
  (`norm_regularizedGeneralizedHypergeometric_le`), for fixed parameters. Where
  `Re b_k > Re a_k > 0` for every pairing of the top and bottom parameters, iterating Euler's
  integral from `₀F₀ = exp` gives it with `K = 0`; the shift relations of 1.2 express the general
  case as a finite combination of `zᵐ` times such functions.

**Checks.**
- 16.2.3 at `p = 1`, `q = 0`: `₂F₀(−m, a; ; z) = (a)ₘ (−z)ᵐ ₁F₁(−m; 1 − m − a; −1/z)`.

*Needs:* 1.1–1.3; Mathlib `regularizedHGFun_zero_zero`.

### 1.6 The circle of convergence

DLMF §16.2(iii), for `p = q + 1`, no `a_j ∈ {0, −1, −2, …}`, no `b_k ∈ {0, −1, −2, …}` and
`|z| = 1`, with `γ_q = Σ𝐛 − Σ𝐚` (16.2.2): the series converges absolutely if `Re γ_q > 0`,
converges for `z ≠ 1` but not absolutely if `−1 < Re γ_q ≤ 0`, and diverges if `Re γ_q ≤ −1`.
Where it converges, its sum is the limit of `F(a; b; w)` as `w → z` within a Stolz set at `z`
(Abel's theorem), and at `z = 1`, for `Re γ_q > 0`, as `x → 1−`
(`tendsto_regularizedGeneralizedHypergeometric_one`). The three cases are
`summable_norm_regularizedHGFunCoeff_of_re_pos`, `tendsto_partialSum_of_re_nonpos` and
`not_tendsto_partialSum_of_re_le_neg_one`.

The proof uses `|(𝐚)ₙ/((𝐛)ₙ n!)| ∼ C n^{−Re γ_q − 1}`, from `Complex.GammaSeq_tendsto_Gamma` and
`Complex.Gamma_add_nat_div_Gamma_eq`, and summation by parts. For `q = 1` this is
SpecialFunctionsHypergeometric 4.3.

*Needs:* 1.1–1.3; Mathlib `Complex.tendsto_tsum_powerSeries_nhdsWithin_stolzSet`.

### Examples

- `F({0.3, 0.5, 0.7}; {1.2, 1.9}; 2 + i) = 1.05549 48230 0… + 0.12038 05941 81… i` and
  `F({0.3, 0.5, 0.7}; {1.2, 1.9}; −3) = 0.91394 71808 65…`, outside the disk of the series.
- `𝐅({1}; ∅; z) = 1/(1 − z)` on the cut plane, and `𝐅(a; b; z) = 0` at `z = 1` and `z = 3` for
  `p = q + 1`, the junk value off the cut plane.

### Dependencies

Mathlib, Tau Ceti and SpecialFunctionsHypergeometric 1.2–1.4.

## Layer 2: derivatives and contiguous relations

### 2.1 Differentiation formulas

DLMF 16.3.1–16.3.5 on the domain, intersected with `slitPlane` where a power `z^γ` appears:
- 16.3.1 in regularized form, for all parameters:
  `iteratedDeriv n (𝐅(a; b; ·)) z = (𝐚)ₙ 𝐅(a + n; b + n; z)`
  (`iteratedDeriv_regularizedGeneralizedHypergeometric`);
- 16.3.2–16.3.4 for `F` with the bottom parameters of each `F` outside `{0, −1, −2, …}`, and in
  regularized form: 16.3.2 as
  `dⁿ/dzⁿ (z^γ 𝐅(a; b; z)) = Γ(γ + 1) z^{γ−n} 𝐅((γ + 1) ::ₘ a; (γ + 1 − n) ::ₘ b; z)` for
  `γ + 1 ∉ {0, −1, −2, …}` (`iteratedDeriv_cpow_mul_16_3_2`), 16.3.3 as
  `(z d/dz z)ⁿ (z^{γ−1} 𝐅(γ ::ₘ a; b; z)) = (γ)ₙ z^{γ+n−1} 𝐅((γ + n) ::ₘ a; b; z)`
  (`iterate_cpow_mul_16_3_3`) and 16.3.4 as
  `dⁿ/dzⁿ (z^{γ−1} 𝐅(a; γ ::ₘ b; z)) = z^{γ−n−1} 𝐅(a; (γ − n) ::ₘ b; z)`
  (`iteratedDeriv_cpow_mul_16_3_4`), the last two for all parameters;
- 16.3.5: `(z d/dz z)ⁿ f = zⁿ dⁿ/dzⁿ (zⁿ f)` for `f` holomorphic on an open set, `n ≥ 1`.

*Needs:* Layer 1.

### 2.2 Contiguous relations

- The first-order relations, on the domain for all parameters:
  `(ϑ + a₀) 𝐅(a₀ ::ₘ a; b; z) = a₀ 𝐅((a₀ + 1) ::ₘ a; b; z)` and
  `(ϑ + b₀ − 1) 𝐅(a; b₀ ::ₘ b; z) = 𝐅(a; (b₀ − 1) ::ₘ b; z)` (16.3.3 and 16.3.4 at `n = 1`), and
  the shift relations of 1.2 (`thetaShift_regularizedGeneralizedHypergeometric_top`,
  `thetaShift_regularizedGeneralizedHypergeometric_bottom`);
- 16.3.6 for `₀F₁`, `z F(; b + 1; z) + b(b − 1) F(; b; z) − b(b − 1) F(; b − 1; z) = 0` for
  `b, b − 1 ∉ {0, −1, −2, …}`, from Mathlib's regularized form
  `𝐅(; u; z) = u 𝐅(; u + 1; z) + z 𝐅(; u + 2; z)`, an input, at `u = b − 1`;
- 16.3.7 for `₃F₂` on the cut plane, with `b₁, b₂ ∉ {0, −1, −2, …}`
  (`generalizedHypergeometric_contiguous_16_3_7`).

16.3.6 follows from Mathlib's form by `F(; u; z) = Γ(u) 𝐅(; u; z)`. 16.3.7 is proved on the unit
disk by comparing the coefficients of `zⁿ`, which after the factors `(a₁)ₙ` are cancelled is an
identity of rational functions of `n`, and extends to the cut plane by the identity theorem.

**Checks.**
- 16.3.7 at `(a₁, a₂, a₃, b₁, b₂, z) = (0.3, 0.4, 0.5, 1.6, 1.2, 0.37)`, and at `z = 2 + i`, off the
  disk.

*Needs:* 2.1; Layer 1.

### Examples

- `d/dz 𝐅({a}; ∅; z) = a 𝐅({a + 1}; ∅; z)` is `d/dz (1 − z)^{−a} = a (1 − z)^{−a−1}`.

### Dependencies

Layer 1.

## Layer 3: the differential equation

### 3.1 Linear equations of order `n`

For an open connected `U ⊆ ℂ`, holomorphic `f₀, …, f_{n−1}` on `U`, and the equation
`w⁽ⁿ⁾ + f_{n−1} w⁽ⁿ⁻¹⁾ + ⋯ + f₀ w = 0` (16.8.1):
- **Abel's identity**: for solutions `w₀, …, w_{n−1}` on `U`, the Wronskian `W` satisfies
  `W′ = −f_{n−1} W` on `U`; so `W` vanishes identically or nowhere on `U`;
- **the spanning criterion**: if `W` has no zero on `U`, every solution on `U` is a linear
  combination of `w₀, …, w_{n−1}` with constant coefficients.
  Proof: solve `∑ⱼ cⱼ wⱼ⁽ⁱ⁾ = w⁽ⁱ⁾`, `i < n`, by Cramer's rule; differentiating the system and using
  the equation gives `∑ⱼ cⱼ′ wⱼ⁽ⁱ⁾ = 0`, so `cⱼ′ = 0`, and `U` is connected;
- **the Wronskian of powers**: `W(z^{ρ₀}, …, z^{ρ_{n−1}}) = ∏_{i<j} (ρⱼ − ρᵢ) z^{Σρ − n(n−1)/2}` on
  `slitPlane`, from `Matrix.det_vandermonde`; and if `wⱼ = z^{ρⱼ} hⱼ` with `hⱼ` holomorphic at `0`
  and `hⱼ(0) = 1`, then `W(w) z^{−Σρ + n(n−1)/2} → ∏_{i<j} (ρⱼ − ρᵢ)` as `z → 0` in `slitPlane`.

*Needs:* Mathlib `Matrix.det`, `Matrix.det_vandermonde`, `IsOpen.is_const_of_deriv_eq_zero`.

### 3.2 The generalized hypergeometric equation

- 16.8.3 (`regularizedGeneralizedHypergeometric_equation`): for `p ≤ q + 1`, `w = 𝐅(a; b; ·)`
  satisfies `ϑ (ϑ + b₁ − 1) ⋯ (ϑ + b_q − 1) w − z (ϑ + a₁) ⋯ (ϑ + a_p) w = 0` on the domain, for
  all parameters, and so does `F` where it is defined; for `p > q + 1` it holds for the
  terminating series on `ℂ`;
- 16.8.4 and 16.8.5: the equation is
  `z^q D^{q+1} w + ∑_{j=1}^{q} z^{j−1} (αⱼ z + βⱼ) Dʲ w + α₀ w = 0` for `p ≤ q`, and the same with
  leading coefficient `z^q (1 − z)` for `p = q + 1`, with `αⱼ`, `βⱼ` defined by expanding the
  products with `ϑᵏ = ∑ⱼ S(k, j) zʲ Dʲ`, `S` Mathlib's `Nat.stirlingSecond`; in particular
  `β_q = q(q − 1)/2 + Σ𝐛`, and `α_q = −1` for `p = q`, `α_q = 0` for `p < q`, and
  `α_q = −(q(q + 1)/2 + Σ𝐚)` for `p = q + 1`
  (`regularizedGeneralizedHypergeometric_equation_16_8_4`); at `q = 1`, `p = 2` this is the Gauss
  equation `z(1 − z) w″ + (c − (a + b + 1) z) w′ − ab w = 0`, with `α₁ = −(a + b + 1)` and `β₁ = c`;
- 16.8.1 for this equation: dividing by the leading coefficient, `z^{q+1−j} fⱼ` is holomorphic at
  `0` for each `j`, so `0` is a regular singularity; for `p = q + 1`, `(z − 1)^{q+1−j} fⱼ` is
  holomorphic at `1`, and the equation in `t = 1/z` has a regular singularity at `t = 0`. There are
  no other finite singularities. The equation has order `max(p, q + 1)`.

*Needs:* Layers 1–2; Mathlib `Nat.stirlingSecond`.

### 3.3 Fundamental solutions at `0`

16.8.6 for `p ≤ q + 1`, with no `b_j` an integer and no two `b_j` differing by an integer: on
`U = slitPlane ∩ D`, with `D` the domain,
- `w₀ = F(a; b; ·)` and `wⱼ(z) = z^{1−bⱼ} F(1 + 𝐚 − bⱼ; 2 − bⱼ, 1 + 𝐛 − bⱼ (omitting `j`); z)`
  solve 16.8.3 (`solution_16_8_6`);
- their Wronskian is
  `∏_{0≤i<j≤q} (ρⱼ − ρᵢ) · z^{−Σ𝐛 − q(q−1)/2} · E(z)` with `ρ₀ = 0`, `ρⱼ = 1 − bⱼ`, and
  `E(z) = 1` for `p < q`, `E(z) = e^z` for `p = q`, `E(z) = (1 − z)^{Σ𝐛 − Σ𝐚 − q}` for `p = q + 1`
  (`wronskian_solution_16_8_6`), by Abel's identity with the coefficients of 3.2 and the limit at
  `0` of 3.1;
- so they form a fundamental set on `U`: every solution on a connected open subset of `U` is a
  linear combination of them (3.1).

**Checks.**
- At `a = {0.3, 0.55, 0.8}`, `b = {0.4, 0.75}`, `z = 0.37`, the Wronskian is
  `−1.41310 43165 88…`; at `a = {0.3, 0.55}` it is `−0.64448 75837 67…`, and at `a = {0.3}` it is
  `−0.44516 96997 77…`.

*Needs:* 3.1–3.2.

### 3.4 Fundamental solutions at `∞`

16.8.7 for `p = q + 1`, with no two `a_j` differing by an integer: on `ℂ \ [0, ∞)`, where `−z` and
`1 − 1/z` lie in `slitPlane`,
`w̃ⱼ(z) = (−z)^{−aⱼ} F(aⱼ, 1 − 𝐛 + aⱼ; 1 − 𝐚 + aⱼ (omitting `j`); 1/z)` solve 16.8.3, with the
bottom parameters outside `{0, −1, −2, …}` by hypothesis; their Wronskian is a nonzero constant
times `(−z)^{−Σ𝐚 − q(q+1)/2} (1 − 1/z)^{Σ𝐛 − Σ𝐚 − q}` (`wronskian_solution_16_8_7`), and they
form a fundamental set there.
The proof transforms the equation by `t = 1/z`, which exchanges the roles of the top and bottom
parameters, and applies 3.3 in `t`.

*Needs:* 3.1–3.3.

### Examples

- `q = 0`, `p = 1`: the equation is `(1 − z) w′ − a w = 0`, solved by `(1 − z)^{−a}`, and
  `w̃₁(z) = (−z)^{−a} (1 − 1/z)^{−a}`, which equals `(1 − z)^{−a}` on `ℂ \ [0, ∞)`.

### Dependencies

Layers 1–2.

## Layer 4: argument unity

All sums at `z = 1` are Mathlib's series at `1`, as pinned.

### 4.1 Classification and Lerch's sum

- 16.4.1–16.4.2 as definitions on lists of parameters, of the well-poised, very well-poised and
  `k`-balanced series: `[a₁, …, a_{q+1}]`, `[b₁, …, b_q]` is well-poised if
  `a₁ + b₁ = ⋯ = a_q + b_q = a_{q+1} + 1`, very well-poised if moreover `a₁ = b₁ + 1`, and
  `k`-balanced if `a_{q+1} ∈ {0, −1, −2, …}` and `a₁ + ⋯ + a_{q+1} + k = b₁ + ⋯ + b_q`. Each sum
  below states its parameters explicitly; the definitions name the classes;
- 16.4.2_5 (Lerch): `∑_{k≤n} (a)ₖ/(c)ₖ = (c − 1)/(c − a − 1) · (1 − (a)_{n+1}/(c − 1)_{n+1})` for
  `c − a − 1 ≠ 0` and `(c − 1)_{n+1} ≠ 0`, and the limiting form
  `∑_{k≤n} (a)ₖ/(a + 1)ₖ = a ∑_{k≤n} 1/(a + k)` for `a ∉ {0, −1, …, −n}`, which is
  `a (ψ(a + n + 1) − ψ(a))` for `a ∉ {0, −1, −2, …}`, by telescoping. (At a pole of `ψ` Mathlib's
  `Complex.digamma` has the junk value `0`, so the digamma form needs every `a + k` off the poles.)

**Checks.**
- The `₇F₆` of 16.4.10 is very well-poised and, with its balance condition, `2`-balanced; the
  `₃F₂` of Dixon's sum 16.4.4 is well-poised and, for generic parameters, not very well-poised.
  This excludes a definition of the classes that ignores the order of the parameters.

*Needs:* Layer 1; Mathlib `Complex.digamma`.

### 4.2 Terminating summations

For `n : ℕ`, as finite sums with the bottom Pochhammer symbols nonzero:
- 16.4.3 (Pfaff–Saalschütz) for `c + d = a + b + 1 − n`
  (`terminatingSum_saalschutz`): compare the coefficients of `zⁿ` in
  `(1 − z)^{a+b−c} F(a, b; c; z) = F(c − a, c − b; c; z)` (SpecialFunctionsHypergeometric 5.1) and
  apply the Chu–Vandermonde sum;
- 16.4.10 (Dougall's `₇F₆`) for `2a + 1 = b + c + d + f − n` (`terminatingSum_dougall_7F6`), by
  induction on `n` with a contiguous relation in `f` that preserves the balance condition, or by a
  WZ pair in `n`;
- 16.4.9 for `d = −n` (terminating Rogers–Dougall): the limit `f → ∞` in 16.4.10, with `d`
  determined by the balance condition, termwise in a finite sum;
- 16.4.5 (terminating Dixon), for `(b)ₙ (c)ₙ (1 − b − n)ₙ (1 − c − n)ₙ ≠ 0`: the sum is `0` for
  odd `n`, and for `n = 2k` it is `(2k)! (b + c + k)ₖ/(k! (b + k)ₖ (c + k)ₖ)`, DLMF's Gamma ratio
  rewritten by `Γ(x + m)/Γ(x) = (x)ₘ`. For odd `n` the term of index `j` is `(−1)ʲ` times a
  function symmetric under `j ↦ n − j`, so the terms cancel in pairs; for even `n` a WZ pair in
  `k` proves it (`terminatingSum_dixon_even`);
- 16.4.6 at `a = −n` (terminating Watson) and 16.4.8 (Džrbasjan), by WZ pairs in `n`.

**Checks.**
- 16.4.3 at `(n, a, b, c) = (1, ½, ½, 3/2)`, `d = −½`: both sides are `4/3`.
- 16.4.5 at `n = 2`, `b = c = −2` is `∑ⱼ (−1)ʲ C(2, j)³ = −6`, Dixon's identity
  `∑ⱼ (−1)ʲ C(2k, j)³ = (−1)ᵏ (3k)!/(k!)³` at `k = 1`, read through the Pochhammer form (the Gamma
  form has poles there).

*Needs:* 4.1; Layer 1; SpecialFunctionsHypergeometric 4.2 (Chu–Vandermonde) and 5.1.

### 4.3 Non-terminating summations

In regularized form, with the hypotheses printed, each of which makes the series converge
absolutely (1.6):
- 16.4.4 (Dixon) for `Re(a − 2b − 2c) > −2` (`regularizedHGFun_dixon`):

```text
𝐅({a, b, c}; {a − b + 1, a − c + 1}; 1)
    = Γ(½a + 1) Γ(½a − b − c + 1)/(Γ(a + 1) Γ(½a − b + 1) Γ(½a − c + 1) Γ(a − b − c + 1)),
```

  with `a/2 + 1` and `a/2 − b − c + 1` off the poles; it is 16.4.9 at `d = a/2`;
- 16.4.9 (Rogers–Dougall) for `Re(b + c + d − a) < 1` (`regularizedHGFun_rogersDougall`), in `d`:
  both sides satisfy the same first-order recurrence under `d ↦ d − 1` (by telescoping of the
  terms), agree at `d = −n` (4.2), and the normalized difference is `1`-periodic and of exponential
  type below `π` on vertical strips (ZerosOfLFunctions 1.3), so it vanishes by the periodic Carlson
  lemma (SpecialFunctionsHypergeometric 4.2);
- 16.4.6 (Watson) for `Re(2c − a − b) > −1` (`regularizedHGFun_watson`) and 16.4.7 (Whipple) for
  `Re c > 0` (`regularizedHGFun_whipple`), in `c`, by
  periodicity and a limit instead of terminating values. The finite sums at `c = −n` cannot
  serve, because the continuation in `c` of the series is not the finite sum there: for Watson
  the bottom parameter `2c` is then a nonpositive integer as well, and the quotients
  `(c)ₖ/(2c)ₖ` with `k > 2n` have nonzero limits; for Whipple at `a = d = ½`, `c = 0` the
  terminating sum 16.4.8 is `1/π` regularized while the right side of 16.4.7 is `2/π`. The
  scheme, for each of the two sums:
  - a WZ pair for the shift `c ↦ c + 1`: with `t_k(c)` the `k`-th term and `ρ(c)` the ratio of the
    right sides at `c + 1` and `c`, `t_k(c + 1)/ρ(c) − t_k(c) = G_{k+1}(c) − G_k(c)` with
    `G_k(c) = R(c, k) t_k(c)`, `R` rational. The boundary
    term `G_k(c)` is `O(k · |t_k(c)|)`, which tends to `0` as `k → ∞` exactly under the stated
    convergence condition, so the sum `S(c)` satisfies `S(c + 1) = ρ(c) S(c)`, as the right side
    does;
  - for real parameters with both sides positive (for Watson `a, b > 0`; for Whipple `0 < a < 1`,
    `d > 0`) and `c` real and large, the quotient `S(c)/(right side)` is therefore `1`-periodic, and
    it tends to `1` along `c + n`, `n → ∞`: termwise `(c + n)ₖ/(2c + 2n)ₖ → 2^{−k}`, respectively
    `(c + n)ₖ/(2c + 2n − d + 1)ₖ → 2^{−k}`, and each factor `(x + j)/(2x + j)` decreases in `x > 0`,
    so the terms are dominated by those at `n = 0`; the limits of the sums are Gauss's second
    theorem 15.4.28 for `F(a, b; (a + b + 1)/2; ½)` and Bailey's sum 15.4.30 for `F(a, 1 − a; d; ½)`
    (SpecialFunctionsHypergeometric 7.3), and the right sides tend to the same values by Stirling's
    formula on the sector (ZerosOfLFunctions 1.2). A periodic function with limit `1` along `c + ℕ`
    is `1`;
  - the identity extends from that real set to the stated region by holomorphy in all parameters
    (the series at `1` converges locally uniformly there, 1.6).

  16.4.7 also holds when `a` is an integer, where the series terminates; that case is a finite
  identity, and 16.4.6 at `a = −n` is the terminating sum of 4.2.

**Checks.**
- 16.4.4 at `(a, b, c) = (0.4, −0.3, 0.2)`: both sides are `0.98653 81349 21…` (unregularized).
- 16.4.6 at `(a, b, c) = (0.3, 0.5, 0.9)`: `1.17101 76700 70…`.
- 16.4.7 at `(a, c, d) = (0.3, 0.8, 1.4)`: `1.23350 87895 88…`.
- 16.4.9 at `(a, b, c, d) = (1.3, 0.4, 0.5, 0.3)`: `1.03962 16744 95…`.

*Needs:* 4.1–4.2; Layer 1; ZerosOfLFunctions 1.2–1.3; SpecialFunctionsHypergeometric 4.2, 7.3.

### 4.4 Transformations and three-term relations

- 16.4.11 (Kummer–Thomae) for `Re(d + e − a − b − c) > 0` and `Re(e − a) > 0`, regularized
  (`regularizedHGFun_thomae`):

```text
𝐅({a, b, c}; {d, e}; 1)
    = Γ(d + e − a − b − c)/Γ(e − a) · 𝐅({a, d − b, d − c}; {d, d + e − b − c}; 1);
```

  DLMF's factors `Γ(e)` and `Γ(d + e − b − c)` are absorbed by the regularization. For
  `Re e > Re c > 0` write the left side as Euler's integral in `(c, e)` over the Gauss function
  `F(a, b; d; t)`, apply the Euler transformation, and integrate termwise; extend to the stated
  region by holomorphy in the parameters (the series at `1` converges locally uniformly there);
- 16.4.12 and 16.4.13 for `Re(d + e − a − b − c) > 1`, respectively `> 0`, so that every series
  converges absolutely: the difference of the two sides, truncated at `N`, is a single boundary
  term that tends to `0` (`regularizedHGFun_three_term_16_4_12`,
  `regularizedHGFun_three_term_16_4_13`);
- 16.4.14 (Whipple's transformation of a balanced `₄F₃`) for `n : ℕ` and
  `a + b + c − n + 1 = d + e + f`, as finite sums (`terminatingSum_whipple_4F3`): expand with 16.4.3
  and interchange the finite sums;
- 16.4.15 (Whipple's `₇F₆ → ₄F₃`) whenever the right side terminates and the left side
  converges:
  - when `f = −n` (`terminatingSum_whipple_7F6`), and so by symmetry when `d` or `e` is `−n`: both
    sides are finite sums, and a recurrence in `n` satisfied by both sides (Zeilberger's
    algorithm) proves it;
  - when `a − b − c + 1 = −m` (`regularizedHGFun_whipple_7F6_16_4_15`), for
    `Re(b + c + d + e + f − 2a) < 2`, where the `₇F₆` is an infinite series. Then
    `c = a − b + 1 + m`, and the quotients `(c)ₖ/(a − b + 1)ₖ` and `(b)ₖ/(a − c + 1)ₖ` of top by
    bottom Pochhammer symbols multiply to a polynomial of degree `m` in `u = k(a + k)`. Expand it in
    the basis `(−k)ⱼ (a + k)ⱼ`, `j ≤ m`; after `k ↦ k + j`, the `j`-th sum is a constant times the
    Rogers–Dougall sum 16.4.9 at `(a + 2j, d + j, e + j, f + j)` (4.3). Every term then carries
    the factor `Γ(a − f + 1) Γ(a − d − e − f + 1)/(Γ(a − d − f + 1) Γ(a − e − f + 1))` of the right
    side, and after dividing by it both sides are rational functions of `f`. They agree at
    `f = −n` for all large `n` by the case `f = −n`, so they agree identically.

**Checks.**
- 16.4.11 at `(a, b, c, d, e) = (0.3, 0.4, 0.5, 1.6, 1.2)`: both sides are `1.04664 23221 10…`
  (unregularized).
- 16.4.14 at `n = 3`, `(a, b, c, d, e) = (0.3, 0.4, 0.5, 1.6, 1.2)`: `1.03201 50616 93…`.
- 16.4.13 fails at `z = 0.6` in place of `1`: it is not a contiguous relation of the functions.
- 16.4.15 at `(a, b, c, d, e, f) = (1.3, 1.5, 1.8, 0.2, 0.3, 0.25)`, where `a − b − c + 1 = −1`
  and the `₇F₆` does not terminate: both sides are `1.07545 73418 14…`.

*Needs:* 4.1–4.3; Layer 1; SpecialFunctionsHypergeometric 5.1.

### 4.5 Bilateral series

- 16.4.16 as a definition: the bilateral series `ₚH_q(𝐚; 𝐛; z) = ∑_{k ∈ ℤ} (𝐚)ₖ/(𝐛)ₖ zᵏ`, with the
  Pochhammer symbol at negative `k` given by `(x)ₖ = Γ(x + k)/Γ(x)`, as a `tsum` over `ℤ`;
- 16.4.17 (Dougall's bilateral sum) for `Re(c + d − a − b) > 1` and `a, b, c, d` with every
  `Γ` in the formula finite and nonzero: the series is summable and the sum is as printed, from
  SpecialFunctionsHypergeometric 4.2 (15.4.25) by `(x)ₖ = Γ(x + k)/Γ(x)` and the reflection formula.

**Checks.**
- 16.4.17 at `b = d`: `₁H₁(a; c; 1) = 0` for `Re(c − a) > 1`, while the sum over `k ≥ 0` alone is
  `(c − 1)/(c − a − 1)`; at `(a, c) = (0.3, 2.9)` that is `1.1875`. This excludes a one-sided
  definition.

*Needs:* Layer 1; SpecialFunctionsHypergeometric 4.2.

### Examples

- 16.4.10 at `n = 3`, `(a, b, c, d) = (1.3, 0.4, 0.5, 0.3)`: `1.03611 58443 20…`.
- 16.4.15 at `n = 2`, `(a, b, c, d, e) = (1.3, 0.4, 0.25, 0.3, 0.2)`: `0.99944 35606 20…`.

### Dependencies

Layer 1; SpecialFunctionsHypergeometric 4.2, 5.1 and 7.3; ZerosOfLFunctions 1.2–1.3.

## Layer 5: integral representations and the connection at infinity

### 5.1 Laplace and inverse Laplace transforms

- 16.5.3: `𝐅(a₀ ::ₘ a; b; z) = Γ(a₀)⁻¹ ∫₀^∞ e^{−t} t^{a₀−1} 𝐅(a; b; zt) dt` for `Re a₀ > 0` and
  `p ≤ q` (so that the left side has `p + 1 ≤ q + 1` top parameters), for every `z` when `p < q`
  and for `Re z < 1` when `p = q` (`regularizedGeneralizedHypergeometric_eq_laplace`). Termwise for
  `‖z‖ < 1`, then by the identity theorem on `{Re z < 1}`, which lies in the cut plane; the
  growth bound of 1.5 gives the domination;
- **Hankel's integral on a line**: for `c > 0` and `Re b > 0`,
  `(2π)⁻¹ ∫_{−T}^{T} e^{c+iy} (c + iy)^{−b} dy → 1/Γ(b)` as `T → ∞`, and the integral converges
  absolutely for `Re b > 1`. For `Re b > 1`, the right side
  of `∫₀^∞ e^{−(c+iy)u} u^{b−1} du = Γ(b) (c + iy)^{−b}` is integrable in `y`, and Fourier
  inversion at `u = 1` gives the value; for `0 < Re b ≤ 1` integrate by parts once in `t`;
- 16.5.4: `𝐅(a; b₀ ::ₘ b; z) = (2π)⁻¹ lim_{T→∞} ∫_{−T}^{T} eᵗ t^{−b₀} 𝐅(a; b; z/t) dy`,
  `t = c + iy`, for `c > 0` and `Re b₀ > 0`, when `p ≤ q`, and for `max(0, Re z) < c` when
  `p = q + 1` (then `z/t` lies in the cut plane); for `p ≤ q`,
  `𝐅(a; b; z/t) = 𝐅(a; b; 0) + O(1/|t|)` on the line, so the integrand is Hankel's plus an
  absolutely integrable remainder, integrated termwise; for `p = q + 1` first for `c > |z|`, then
  in `z` by the identity theorem (`tendsto_integral_inverseLaplace_16_5_4`).

*Needs:* Layer 1; Mathlib Fourier inversion.

### 5.2 Mellin–Barnes integrals

16.5.1 for `p ≤ q + 1` and `a_k ∉ {0, −1, −2, …}`:
- **vertical lines**, `p ∈ {q, q + 1}`: for `−min_k Re a_k < σ < 0` (so `Re a_k > 0` for all `k`),
  `(∏ Γ(a_k)) 𝐅(a; b; z) = (2π)⁻¹ ∫ (∏ₖ Γ(a_k + s)/∏ₖ Γ(b_k + s)) Γ(−s) (−z)^s dy`, `s = σ + iy`,
  with reciprocal Gamma factors, for `−z ∈ slitPlane` when `p = q + 1` and for
  `|ph(−z)| < π/2` when `p = q` (`regularizedGeneralizedHypergeometric_eq_mellinBarnes`). Proof by
  induction on `q`: the base cases are the Cahen–Mellin integral for `e^{−w}` (`p = q = 0`,
  AsymptoticExpansions 8.7) and the Mellin–Barnes integral of `(1 + u)^{−a}` (`p = 1`, `q = 0`,
  SpecialFunctionsHypergeometric 6.3); the step inserts the integral into Euler's integral 16.5.2
  for `z = −x`, `x > 0`, `Re b₀ > Re a₀ > 0`, exchanges the integrals by Fubini, evaluates the
  Beta integral, and extends to the stated sector by the identity theorem in `z` (the integrand
  decays like `e^{−(π − |ph(−z)|)|y|}` for `p = q + 1` and `e^{−(π/2 − |ph(−z)|)|y|}` for `p = q`)
  and to all `b` by holomorphy;
- **the separating contour**: for other `a_k ∉ {0, −1, −2, …}`, the line `Re s = σ` with
  `σ < 0` and `σ ≠ −Re a_k − m` for every `k` and `m : ℕ`, so that the line meets no pole, plus the
  residues at the finitely many poles `s = −a_k − m` with real
  part above `σ`, all simple when no two `a_k` differ by an integer; the sum does not depend on
  `σ` (AsymptoticExpansions 8.2) and continues the first case analytically in the `a_k`;
- **the loop contour**, `p ≤ q + 1`: for `η > 0` and `σ < 0` such that no pole of any `Γ(a_k + s)`
  lies on it, the loop `L` from `+∞ − iη` to `σ − iη`, then to `σ + iη`, then to `+∞ + iη` (which
  encircles the nonnegative integers in the negative sense). The poles `s = −a_k − m` inside `L` are
  finitely many, because `Re(−a_k − m) ≤ −Re a_k`, and none is a nonnegative integer, because
  `a_k ∉ {0, −1, −2, …}`. The integral `(2πi)⁻¹ ∫_L` converges and equals the left side of 16.5.1
  minus the sum of the residues of the integrand at those poles, for every `z ≠ 0` when `p < q + 1`,
  and for `0 < |z| < 1` when `p = q + 1`. When no such pole lies inside `L` this is 16.5.1 with
  DLMF's loop (`regularizedGeneralizedHypergeometric_eq_loopIntegral`, with `L` written as two rays
  and a segment); otherwise indenting `L` around those poles gives DLMF's contour, which separates
  the two families of poles, and removes the correction. Proof: the residue theorem on the
  rectangles cut off at `Re s = N + ½`, and `Γ(−s) (−z)^s ∏ Γ(a_k + s)/∏ Γ(b_k + s) → 0` on their
  right sides as `N → ∞`.

**Checks.**
- 16.5.1 at `a = {0.6, 0.8, 0.5}`, `b = {1.7, 1.1}`, `z = −2`, `σ = −0.3`: both sides give
  `F = 0.84332 92288 00…`; at `a = {0.6, 0.8}`, `b = {1.7, 1.1}`, `z = −3`: `F = 0.57854 07043 45…`.

*Needs:* 5.1; Layer 1; SpecialFunctionsHypergeometric 6.3; AsymptoticExpansions 8.2, 8.6, 8.7;
Tau Ceti residues.

### 5.3 The connection at infinity

For `p = q + 1`, `a_k ∉ {0, −1, −2, …}`, and no two `a_k` differing by an integer:
- 16.11.2 for `p = q + 1` as a function,

```text
H(z) = ∑_{m=1}^{p} ∑_{k≥0} ((−1)ᵏ/k!) Γ(a_m + k) (∏_{ℓ≠m} Γ(a_ℓ − a_m − k)/∏_ℓ Γ(b_ℓ − a_m − k))
         · z^{−a_m−k},
```

  with principal powers; for each `m` the series in `k` converges absolutely for `|z| > 1`;
- 16.11.6: `(∏ Γ(a_ℓ)/∏ Γ(b_ℓ)) F(a; b; z) = H(−z)` for `|z| > 1` and `−z ∈ slitPlane`, in
  regularized form with reciprocal Gamma factors
  (`regularizedGeneralizedHypergeometric_eq_balancedH`). Fix `τ ∈ (0, 1)` at distance at least
  `ε = 1/(2p)` modulo `1` from every `Re a_m` (the `p` points leave a gap of length at least `1/p`
  on the circle `ℝ/ℤ`). Shift the separating contour of 5.2 to `Re s = −N − τ`, `N ∈ ℕ`, across the
  poles at `s = −a_m − k` (AsymptoticExpansions 8.2 and its iteration); each such line stays at
  distance at least `ε` from every pole. On it the reflection formula, with `|sin π(a_m + s)|`
  bounded below in terms of `ε`, and Stirling's formula on the sector (ZerosOfLFunctions 1.2) bound
  the integrand by `C N^K |z|^{−N}` times an integrable function of `y`, with `C`, `K` depending on
  `a`, `b` and `ε` but not on `N`, so the integral tends to `0`;
- 16.8.8 (`regularizedGeneralizedHypergeometric_connection_infty`) on `−z ∈ slitPlane`: for
  `|z| > 1` it is 16.11.6 with the inner series summed as `w̃ⱼ` of 3.4 (`1/z` in the unit disk), and
  both sides are holomorphic on `−z ∈ slitPlane`; DLMF's boundary values at `|ph(−z)| = π` are the
  limits from `Im z < 0` and `Im z > 0` at `z = x > 0`, `x ≠ 1`;
- the domain of 16.8.9 as a definition (`centeredDomain`): with `R = max(|z₀|, |z₀ − 1|)`, the
  connected component containing `z₀ − R − 1` of the open set of `z` with `|z − z₀| > R`,
  `1 − z ∈ slitPlane` (where the principal branch on the left is defined) and
  `z₀ − z ∈ slitPlane` (where the principal powers on the right are holomorphic). It contains the
  ray `z₀ − t`, `t > R`;
- 16.8.9 for `z₀ ∈ ℂ` and `z ∈ centeredDomain z₀`
  (`regularizedGeneralizedHypergeometric_eq_centered_expansion`): the inner polynomials are
  Mathlib's terminating series, and the double series converges for `|z − z₀| > R`. At `z₀ = 0` it
  is 16.11.6. DLMF's conditions `|z − z₀| > R` and `|ph(z₀ − z)| < π` alone do not suffice: the
  right side is then a branch of the left side, not always the principal one (Checks). The
  derivative in the centre of the right side vanishes term by term: by 16.3.1, the derivative of
  the polynomial in the `n`-th term is a multiple of the polynomial of the `(n − 1)`-th term, and
  it cancels the derivative of the power `(z₀ − z)^{−aⱼ−n+1}` in the `(n − 1)`-th term. Fix
  `z = z₀ − t` with `t > 2|z₀| + 1` and move the centre `w` along the segment from `0` to `z₀`: then
  `|z − w| ≥ t − |z₀| > max(|w|, |w − 1|)` and `Re(w − z) > 0`, so the right side is constant in
  `w`, and at `w = 0` it equals the left side by 16.11.6. So the identity holds on that part of the
  ray, and both sides are holomorphic on the connected open set `centeredDomain z₀`, so it holds
  there by the identity theorem.

**Checks.**
- 16.8.8 at `a = {0.3, 0.55 + 0.2i, 0.8}`, `b = {1.4, 1.9}` and `z = −3 + i`, `0.5 + 0.4i`,
  `2.5 − 0.7i`, `−0.3 − 0.2i`: the two sides agree to working precision.
- 16.8.9 at the same parameters, `(z, z₀) = (−4 + i, 0.5 + 0.3i)` and `(5 + 2i, 1 + i)`.
- 16.8.9 fails off `centeredDomain z₀` although DLMF's conditions hold: at `q = 0`, `a = ½`,
  `(z, z₀) = (3 + i, 2i)` (between the cut `[1, ∞)` and the ray `z₀ + [0, ∞)`, cut off by the
  disk `|z − z₀| ≤ √5`), the right side is minus the left side `Γ(½) (1 − z)^{−1/2}`,
  `0.27232 87395 52… + 1.15360 30529 70… i`.

*Needs:* 5.2, 3.4; Layers 1–2; ZerosOfLFunctions 1.2; AsymptoticExpansions 8.2.

### Examples

- 16.5.3 at `p = q = 0`: `𝐅({a₀}; ∅; z) = Γ(a₀)⁻¹ ∫₀^∞ e^{−t} t^{a₀−1} e^{zt} dt = (1 − z)^{−a₀}`
  for `Re z < 1`.
- 16.8.8 at `q = 0` is the identity `(1 − z)^{−a} = (−z)^{−a} (1 − 1/z)^{−a}` on `−z ∈ slitPlane`.

### Dependencies

Layers 1–3; SpecialFunctionsHypergeometric 6.3; ZerosOfLFunctions 1.2; AsymptoticExpansions 8.2,
8.6, 8.7.

## Layer 6: transformations, expansions and products

### 6.1 Quadratic and cubic transformations

- 16.6.1 for `‖z‖ < 1`, with `a − b + 1, a − c + 1 ∉ {0, −1, −2, …}`
  (`generalizedHypergeometric_quadratic_16_6_1`); the map `z ↦ −4z/(1 − z)²` sends the unit disk
  onto the cut plane;
- 16.6.2 for `‖z‖ < ½`, with `b, a − b + 3/2 ∉ {0, −1, −2, …}`
  (`generalizedHypergeometric_cubic_16_6_2`); on that disk `−27z/(4(1 − z)³)` stays in the cut
  plane, and it reaches `1` only at `z = −½` and `z = 4`.

Both are proved by comparing Taylor coefficients at `0`. Expanding the right side, the coefficient
of `z^N` is `((a)_N/N!) ₃F₂(−N, a + N, a − b − c + 1; a − b + 1, a − c + 1; 1)` for 16.6.1 and
`((a)_N/N!) ₃F₂(−N, (a + N)/2, (a + N + 1)/2; b, a − b + 3/2; 1)` for 16.6.2, both balanced, and
16.4.3 sums them; then the identity theorem.

**Checks.**
- 16.6.1 fails at `z = −2.5`, outside the disk, for `(a, b, c) = (0.3, 0.45 + 0.2i, 0.7)`.

*Needs:* Layers 1, 4.

### 6.2 Expansions in series of `ₚF_q`

- 16.10.1 (Fields–Wimp): as an identity of coefficients for every `p`, `q`, `r`, `s` (the
  coefficient of `zᴺ` on the right is a finite sum over `k ≤ N`), for `α, β ∉ {0, −1, −2, …}` and
  `γ + k + j ≠ 0`; and as a convergent expansion, `HasSum`, for `p < q`, `r ≤ s` and all `z`, `ζ`
  (`hasSum_fieldsWimp`). The coefficient identity is a terminating `₂F₁` sum at `1`, by
  Chu–Vandermonde.
- 16.10.2 (Nørlund): for `|ζ − 1| < 1` and `Re z < ½`, the series converges and equals
  `F(a; b; zζ)` with `p = q + 1`, the principal branch; `zζ` lies in the cut plane on that set.
  Expand `(1 − (1 − ζ) w)^{…}` in Euler's integral, or prove it for small `|z|` and `|ζ − 1|` by
  rearranging the double series, and extend by the identity theorem in `(z, ζ)`
  (`hasSum_norlund`, with the inner terminating functions as Mathlib's series).

**Checks.**
- 16.10.1 at `p = 0`, `q = 1`, `r = s = 0`: `₀F₁(; 1.6; zζ)` at `(z, ζ) = (2, 3)`, `(−5, 1.5)` and
  `(3 + 2i, −4 + i)`.

*Needs:* Layers 1, 4; SpecialFunctionsHypergeometric 4.2.

### 6.3 Products

- 16.12.1: `₀F₁(; a; z) ₀F₁(; b; z) = ₂F₃(½(a + b), ½(a + b − 1); a, b, a + b − 1; 4z)` for all `z`,
  in the regularized form `𝐅(; a; z) 𝐅(; b; z) = Γ(a + b − 1) 𝐅(…; 4z)` for all `a`, `b` with
  `a + b − 1 ∉ {0, −1, −2, …}` (`regularizedGeneralizedHypergeometric_zero_one_mul`): compare
  coefficients, which reduces to Chu–Vandermonde;
- 16.12.2 (Clausen) on the cut plane, for `a + b + ½`, `2a + 2b ∉ {0, −1, −2, …}`
  (`gaussHypergeometric_sq_clausen`): on the disk the coefficients of the square satisfy the
  first-order recurrence of the `₃F₂` coefficients, because the square of a solution of the Gauss
  equation with `c = a + b + ½` solves the `₃F₂` equation 16.8.3; then the identity theorem;
- 16.12.3 for `‖z‖ < 1`, with `c`, `2c − 1`, `a + ½`, `b + ½ ∉ {0, −1, −2, …}`
  (`hasSum_gaussHypergeometric_sq`); these keep every denominator of the printed coefficients
  nonzero, also at `c = 3/2, 5/2, …`, where `(3/2 − k − c)ⱼ ≠ 0` for `j ≤ k`. The coefficient of
  `zᵏ` of the square is the Cauchy product
  `∑_{j≤k} (a)ⱼ (b)ⱼ (a)_{k−j} (b)_{k−j}/((c)ⱼ (c)_{k−j} j! (k − j)!)`, a finite sum with nonzero
  denominators. Prove that it equals the printed coefficient by a recurrence in `k` satisfied by
  both sides (Zeilberger). The Cauchy product is used as it stands: rewriting it as
  `(a)ₖ (b)ₖ/((c)ₖ k!)` times a terminating `₄F₃` with bottom parameters `1 − a − k`, `1 − b − k`
  divides by Pochhammer symbols that vanish when `a` or `b` is a nonpositive integer, for example at
  `a = −1`, `b = c = 1`.

**Checks.**
- 16.12.1 at `(a, b, z) = (0.7, 1.3, 2 − i)`: both sides are
  `9.69461 76254 79… − 20.11750 81382 00… i`. 16.12.2 at `(a, b, z) = (0.3, 0.45, 3 + 2i)`, off the
  disk: both sides are `0.72386 83851 68… + 0.56286 64437 69… i`.

*Needs:* Layers 1–4; SpecialFunctionsHypergeometric 1.2–1.4, 4.2.

### Examples

- 16.6.1 at `(a, b, c, z) = (0.3, 0.45, 0.7, 0.9i)`: `0.94124 19778 46… + 0.13260 29277 53… i`.
- 16.12.1 at `(a, b, z) = (0.7, 1.3, 2)`: `20.20354 02187 98…`.

### Dependencies

Layers 1–4; SpecialFunctionsHypergeometric 1.2–1.4 and 4.2.

## Layer 7: limits and asymptotics in the parameters

### 7.1 Confluence

- 16.8.10: for `p ≤ q`, `F(a, α; b; z/α) → F(a; b; z)` as `|α| → ∞`, locally uniformly in `z`,
  with `b_k ∉ {0, −1, −2, …}` (`tendsto_generalizedHypergeometric_confluence_top`); the
  coefficients `(α)ₙ/αⁿ → 1` with `|(α)ₙ/αⁿ| ≤ (1 + n/|α|)ⁿ`, and dominated convergence;
- 16.8.11: for `p ≤ q + 1`, `F(a; b, β; βz) → F(a; b; z)` as `|β| → ∞` in the sector
  `|ph β| ≤ π − δ`, with `b_k ∉ {0, −1, −2, …}`; when `p = q + 1`, for `|z| < 1`, and moreover
  `|z| < sin δ` when `δ < π/2` (`tendsto_generalizedHypergeometric_confluence_bottom`). The
  condition on `z` is uniform on the sector: `|β + k| ≥ |β|` for `|ph β| ≤ π/2`, and
  `|β + k| ≥ |Im β| ≥ |β| sin δ` for `π/2 ≤ |ph β| ≤ π − δ`, so `|βⁿ/(β)ₙ| ≤ max(1, 1/sin δ)ⁿ`
  gives the domination.

*Needs:* Layer 1.

### 7.2 Large parameters

- 16.11.10: for `p = q + 1`, fixed `z` with `1 − z ∈ slitPlane`, `k ∈ {1, …, q}` and every `m`, `F`
  with `a₁, …, a_{k−1}` and `b₁, …, b_k` shifted by `r` is its partial sum of `m` terms plus
  `O(r^{−m})` as `r → +∞`. For `‖z‖ < 1` the tail is bounded termwise; on the rest of the cut plane
  use Euler's integral in a pair `(a_k, b_k)` with the unshifted `a_k` and shifted `b_k` (more
  bottom than top parameters are shifted), and the bound for `‖z‖ < 1` inside
  (`isBigO_generalizedHypergeometric_shift_16_11_10`);
- 16.11.11: for `p < q`, all parameters shifted by `r`, the remainder after `m` terms is
  `O(r^{−(q−p)m})`, termwise (`isBigO_generalizedHypergeometric_shift`).

*Needs:* Layer 1; 1.2 (Euler's integral).

### Examples

- 16.8.10 at `p = q = 0`: `₁F₀(α; ; z/α) = (1 − z/α)^{−α} → e^z`.

### Dependencies

Layer 1.

## Downstream consumers

- [SpecialFunctionsStruve](../SpecialFunctionsStruve/README.md) and the other special-function
  roadmaps use Mathlib's `regularizedHGFun` with `p ≤ q`, which is this roadmap's `𝐅` on all of
  `ℂ` (1.3); their identifications of the Struve, Anger–Weber and Lommel functions with `₁F₂`
  need nothing beyond Layer 1.
- A roadmap for the Meijer `G`-function and the non-terminating `ₚF_q` with `p > q + 1` consumes
  Layers 1–5; SpecialFunctionsConfluent's `₂F₀` of DLMF 13.6.21 belongs there.
- A roadmap for the Appell functions (DLMF §§16.13–16.16) rests on SpecialFunctionsHypergeometric,
  not on this roadmap.
- A roadmap for the hypergeometric orthogonal polynomials of DLMF Chapter 18 (Hahn, Racah,
  Wilson) consumes 1.5 and Layer 4.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of DLMF Chapter 16. It is recorded
only to fix the boundary. Contributors should not attempt it under this roadmap.

- **Appell functions** (DLMF §§16.13–16.16): `F₁`–`F₄`, their partial differential equations,
  integral representations and reduction formulas.
- **The Meijer `G`-function** (DLMF §§16.17–16.22) and, with it, **the non-terminating `ₚF_q`
  for `p > q + 1`** (§16.2(iv)), which DLMF defines through 16.5.1 with a vertical line and whose
  formal power series is its asymptotic expansion as `z → 0` in `|ph(−z)| ≤ (p + 1 − q − δ)π/2`.
- **Large-variable asymptotics** (DLMF §16.11(i)–(ii)): the formal series `E_{p,q}` with its
  coefficients 16.11.1, 16.11.3–16.11.5, and the expansions 16.11.7–16.11.9 for `p ≤ q`. They
  rest on the asymptotics of Barnes-type integrals of the Meijer `G`-function.
- **Zeros** (DLMF §16.9): the results of Ki and Kim on the zeros of `ₚF_p`, which use the
  expansion 16.11.7.
- **Logarithmic and `z = 1` fundamental solutions** (DLMF §16.8(ii)): the solutions at `0` for
  integer or integer-differing `b_j`, at `∞` for integer-differing `a_j`, and the solutions near
  `z = 1` and the continuation formulas there.
- **Existence of contiguous relations** (DLMF §16.3(ii), first paragraph): that any `q + 2`
  contiguous functions are linearly related; the continued fractions of §16.4(iv); the second
  term of 16.4.15 in the non-terminating case.
- **Relations to other functions** (DLMF §16.7), which is a list of references, and the
  `3j`, `6j` and `9j` symbols (DLMF Chapter 34).
- **Applications and computation** (DLMF §§16.23–16.27), including the Askey–Gasper inequality
  16.23.1.
- **Sections with nothing to formalize**: the notation of §16.1.

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/GeneralizedHypergeometric/` provides source material for Layers 1–7: the principal
continuation for `p = q + 1` by iterated Euler integrals, the derivatives and contiguous relations,
the equation, the terminating sums and transformations at `z = 1`, Euler's integral, Fields–Wimp,
the `₀F₁` product and Clausen's formula, and the large-parameter expansion 16.11.11. Its
`DLMF/Hypergeometric/` has Pfaff–Saalschütz, Dixon's sum by a WZ pair and Carlson's theorem, and
Whipple's `₇F₆` transformation.

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 1 | `GeneralizedHypergeometric/Basic/ParametersAndSeries`, `Basic/SeriesProperties`, `Basic/PrincipalContinuation`, `Basic/PrincipalContinuationExistence`, `AnalyticProperties` |
| 2 | `GeneralizedHypergeometric/Derivatives` |
| 3 | `GeneralizedHypergeometric/DifferentialEquations` |
| 4 | `GeneralizedHypergeometric/UnitArgument`, `UnitArgumentDougall`, `WhippleTerminating`, `ClearedTerminating`; `Hypergeometric/Saalschutz`, `Identities/Dixon`, `Identities/Whipple` |
| 5 | `GeneralizedHypergeometric/Integrals`, `DifferentialEquations` |
| 6 | `GeneralizedHypergeometric/Transformations`; `Hypergeometric/Clausen` |
| 7 | `GeneralizedHypergeometric/DifferentialEquations`, `Asymptotics` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 16
  (R. A. Askey and A. B. Olde Daalhuis), <https://dlmf.nist.gov/16>. Every equation number refers
  to this release.
- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapters 2 and 3.
- W. N. Bailey, *Generalized Hypergeometric Series*, Cambridge University Press, 1935.
- Y. L. Luke, *The Special Functions and Their Approximations*, Vol. I, Academic Press, 1969.
- M. Petkovšek, H. S. Wilf and D. Zeilberger, *A = B*, A K Peters, 1996.
