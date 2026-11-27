# Roadmap: moduli of smoothness, classical approximation and Besov spaces

**Summary.** The modulus of smoothness `ω_r(f, t)_p = sup_{|h| ≤ t} ‖Δ_h^r f‖_p` measures the
smoothness of a function in `L_p` by its differences of order `r`, for every `0 < p ≤ ∞`. This
roadmap builds the moduli on `ℝ^d`, on the torus `𝕋^d`, on intervals and on cubes, with Marchaud's
and Whitney's inequalities; it extends the Littlewood–Paley Besov spaces `B^s_{p,q}` to the whole
range `0 < p, q ≤ ∞`; and it develops four classical approximation theories: trigonometric
polynomials on `𝕋^d`, band-limited functions on `ℝ^d`, dyadic splines on `[0, 1]`, and dyadic step
functions and tensor splines on the cube `[0, 1]^d`. Each of these schemes satisfies Jackson's
inequality and an inverse inequality with respect to a modulus of smoothness, so that its
approximation spaces, in the sense of ApproximationSpaces, become explicit function spaces. Every
statement covers the whole range `0 < p, q ≤ ∞`. For `p < 1` the space `L_p` is only quasi-normed
and `L_p[0, 1]` carries no nonzero continuous linear functional, so near-best approximants take
the place of bounded projections throughout.

The headline theorems are these. On `𝕋^d` and `ℝ^d`, for `0 < s < r` and all `0 < p, q ≤ ∞`, the
approximation spaces of trigonometric polynomials and of band-limited functions in `L_p` are the
spaces of the `f ∈ L_p` with `‖(2^{ks} ω_r(f, 2^{−k})_p)_k‖_{ℓ_q} < ∞`, and for `s > d(1/p − 1)_+`
they are the Littlewood–Paley Besov spaces `B^s_{p,q}`. These Besov spaces, given by
`‖(2^{js} ‖Δ_j u‖_p)_j‖_{ℓ_q} < ∞` for every `0 < p, q ≤ ∞`, do not depend on the bump and satisfy
`(B^{s₀}_{p,q₀}, B^{s₁}_{p,q₁})_{η,q} = B^{(1−η)s₀ + ηs₁}_{p,q}` for `s₀ ≠ s₁`. On `[0, 1]` the
dyadic splines of order `r` describe the space of `ω_r` for `0 < s < r − 1 + 1/p`, through Whitney's
inequality `inf_{deg P < r} ‖f − P‖_{L_p[a, b]} ≤ C ω_r(f, (b − a)/r)_p`, which holds for every
`0 < p ≤ ∞`. On `[0, 1]^d` with `0 < p ≤ 1`, the dyadic step functions describe the space of the
first modulus for `0 ≤ s < 1/p`, and Haar coefficients describe it for `d(1/p − 1) < s < 1/p`.

[ApproximationSpaces](../ApproximationSpaces/README.md) supplies approximation schemes and their
spaces, the Besov spaces of a scheme of functions with Nikolskii's embeddings, the real
interpolation of quasi-normed couples, and the theorem on moduli compatible with a scheme, which
turns each pair of a Jackson and an inverse inequality here into a description of a Besov space. The
Littlewood–Paley partition, the Besov spaces for `p, q ≥ 1` with their real interpolation, and
Bernstein's and Nikolskii's inequalities for `p ≥ 1` come from Tau Ceti, in the area of the
[PDE](../PDE/README.md) and [PseudodifferentialOperators](../PseudodifferentialOperators/README.md)
roadmaps, and the Haar basis of `L_p[0, 1]` from
[BanachSpaceTheory](../BanachSpaceTheory/README.md).
[PolynomialInterpolationAndBestApproximation][piba] keeps uniform approximation by algebraic
polynomials and the modulus of continuity; this roadmap extends that modulus to `L_p` and to every
order.

[piba]: ../PolynomialInterpolationAndBestApproximation/README.md

Part A builds the moduli of smoothness with Marchaud's and Whitney's inequalities. Part B supplies
the Littlewood–Paley tools and the Besov formula for `p < 1` or `q < 1`. Parts C, D and E treat the
torus, `ℝ^d`, and the interval and the cube.

## How to read the build

The build has five parts, A to E. The labels `CA-A01`, …, `CA-E13` of their targets, one heading
`### CA-Xnn` each, are the complete obligation set of this roadmap: each label names one definition
or theorem, the worked examples cite them, and `Suggested.lean` cites the labels its declarations
represent. The labels `AS-…` name targets of ApproximationSpaces, which this roadmap consumes. Each
part groups its labels into numbered milestones, listed at the head of the part. Every target
states its exponent range in its own statement, and its *Needs:* line lists what the statement and
the route described need, so that a target proved another way does not wait for an unrelated one.

Part A rests on Mathlib, on Tau Ceti's Sobolev spaces and on AS-A01, AS-A02 and AS-B01. Part B
rests on Tau Ceti's Littlewood–Paley theory, Besov spaces and maximal functions, on AS-A15 for
Nikolskii's inequality below `1`, and on Part B of ApproximationSpaces for the quasi-Banach
interpolation. Parts C and D rest on Parts A and B and on ApproximationSpaces. Part E rests on
Part A, on ApproximationSpaces and on Tau Ceti's Haar basis.

## Conventions

1. **Exponents.** `p q : ℝ≥0∞` with `0 < p, q ≤ ∞`; `ρ := min(1, p)`; `σ_p := d (1/p − 1)_+` on a
   space of dimension `d`. Smoothness `s : ℝ`; orders `r : ℕ`, `r ≥ 1`. In Lean, `1/∞ = 0`.
2. **Quasi-norms and schemes as in ApproximationSpaces.** Quasi-norms take values in `ℝ≥0∞`,
   membership in a space means finiteness of its quasi-norm, and `‖·‖_p` is a `min(1, p)`-norm with
   quasi-triangle constant `LpAddConst p` (AS-A01). A scheme of functions on a finite measure space
   `(Ω, μ)` consists of classes in `L_∞(μ)` and measures errors in every `L_p(μ)`, `0 < p ≤ ∞`, with
   the Besov spaces `B^s_{p,q}(S)` of AS-A14. The measure of `E` is infinite, so band-limited
   functions form a scheme in each `L_p(E)` separately (CA-D01).
3. **Scalars.** Parts A, C, D, E: functions with values in `ℂ`. Part B: tempered distributions
   with values in a complex Banach space `F`, as Tau Ceti's Besov spaces.
4. **Settings.** `E` is a finite-dimensional real inner product space of dimension `d ≥ 1` with its
   Lebesgue measure `volume`. The torus is `𝕋^d := UnitAddTorus (Fin d)` with the product of the
   Haar probability measures of the circle factors, characters `e_k(x) = exp(2πi⟨k, x⟩)`,
   `k ∈ ℤ^d`, and the norm `‖h‖ = max_i ‖h_i‖` (so `‖h‖ ≤ 1/2`). `I := [0, 1]`, `J = [a, b]`, and
   `Q := [0, 1]^d`, with Lebesgue measure. The Fourier transform is Mathlib's,
   `𝓕f(ξ) = ∫ e^{−2πi⟨x, ξ⟩} f(x) dx`.
5. **One Littlewood–Paley partition.** For a bump `φ : ContDiffBump (0 : E)`, `ψ_0 = φ` and
   `ψ_j = φ(2^{−j} ·) − φ(2^{1−j} ·)` for `j ≥ 1`, Tau Ceti's
   `ContDiffBump.inhomogeneousLittlewoodPaley`; the blocks are `Δ_j u = 𝓕⁻¹(ψ_j 𝓕u)`, Tau Ceti's
   `TemperedDistribution.littlewoodPaleyBlock`, and on `𝕋^d` the trigonometric polynomials
   `∑_k ψ_j(k) c_k e_k`, Tau Ceti's `TauCeti.UnitAddTorus.littlewoodPaleyBlockLp`.
6. **One Besov formula.** On `E` and `𝕋^d`, `B^s_{p,q}` consists of the distributions whose blocks
   lie in `L_p` with `‖(2^{js} ‖Δ_j u‖_p)_j‖_{ℓ_q} < ∞`. Tau Ceti owns it for `p, q ≥ 1`
   (`TemperedDistribution.MemBesov`, `TauCeti.BesovSpace`, `TauCeti.UnitAddTorus.MemBesov`); this
   roadmap states the same formula for `p < 1` or `q < 1` (CA-B05, CA-B07) and proves that both
   agree where both are defined. Every description by approximation or by differences on `E` and
   `𝕋^d` is a theorem about this formula. On `I` and `Q` the Besov spaces are defined here by moduli
   of smoothness (CA-E01, CA-E10).
7. **Names.** The declarations of this roadmap live in
   `TauCetiRoadmap.ClassicalApproximationSpaces` in `Suggested.lean`, which imports the
   declarations of ApproximationSpaces: `modulusOfSmoothness`, `intervalModulus`; `lpSymbol`,
   `blockENorm`, `besovENorm`, `peetreMaximal`; `torusTrigPoly`, `torusTrigScheme`. As in
   ApproximationSpaces, Jackson's, Bernstein's and Nikolskii's inequalities are written out, never
   named as predicates.
8. **Constants.** "There is `C`" means a finite constant depending only on the parameters named in
   the statement (exponents, orders, dimension, the quasi-triangle constant, the bump `φ`), never
   on the function.

## Part A: moduli of smoothness

**Milestone A1: differences and moduli on `E` and `𝕋^d`.** CA-A01–CA-A07.

**Milestone A2: intervals, cubes and Whitney's inequality.** CA-A08–CA-A10.

Setting of Milestone A1: `G` is `E` or `𝕋^d`, `0 < p ≤ ∞`, `ρ = min(1, p)`.

### CA-A01 Translations and differences

Prove that `τ_h f = f(· + h)` preserves `eLpNorm`, define
`Δ_h^r = ∑_{k=0}^r (−1)^{r−k} C(r, k) τ_{kh}`, prove `Δ_{mh} = ∑_{i<m} τ_{ih} Δ_h` for `m ∈ ℕ`, and
for `p < ∞` the continuity of `h ↦ τ_h f` into `L_p(G)`. *Needs:* Mathlib
`MeasurePreserving`, `Lp.compMeasurePreserving`.

### CA-A02 Modulus of smoothness

Define `modulusOfSmoothness μ p r f t = ⨆ h, ‖h‖ ≤ t → eLpNorm (Δ_h^r f) p μ`, written
`ω_r(f, t)_p`, with values in `ℝ≥0∞`. *Needs:* CA-A01.

**Checks.**
- For continuous `f` on `E` and `p = ∞`, `ω_1(f, t)_∞ = sup_{‖x − y‖ ≤ t} |f(x) − f(y)|`, the
  modulus of continuity of PolynomialInterpolationAndBestApproximation §5.1 (`modulusOfContinuity`).

### CA-A03 Elementary properties

Prove: `ω_r(f, 0)_p = 0`; monotone in `t`; `ω_r(f + g, t)_p^ρ ≤ ω_r(f, t)_p^ρ + ω_r(g, t)_p^ρ`;
`ω_r(c f, t)_p = |c| ω_r(f, t)_p` for `c ∈ ℂ`; `ω_r(f, t)_p ≤ 2^{r/ρ} ‖f‖_p`;
`ω_{r+k}(f, t)_p ≤ 2^{k/ρ} ω_r(f, t)_p`; `ω_r(f, mt)_p^ρ ≤ m^r ω_r(f, t)_p^ρ` for `m ∈ ℕ`, and
`ω_r(f, λt)_p ≤ r^{(1/p − 1)_+} (1 + λ)^{r + (1/p − 1)_+} ω_r(f, t)_p` for `λ > 0`; for `p < ∞`,
`ω_r(f, t)_p → 0` as `t → 0`. On `𝕋^d` every step of length at most `mt` is `m` times a step of
length at most `t`, which the dilation bounds use. *Needs:* CA-A02, AS-A01.

**Checks.**
- `p = 1/2`, `r = 1` on `ℝ`, `f = 1_{[0,1]}`: `ω_1(f, t)_p = (2t)^2` for `t ≤ 1`, so
  `ω_1(f, 2t)_p = 4 ω_1(f, t)_p` for `t ≤ 1/2`, equality in `ω_r(f, mt)_p^ρ ≤ m^r ω_r(f, t)_p^ρ` at
  `m = 2`; for `p ≥ 1` the same `f` has `ω_1(f, 2t)_p = 2^{1/p} ω_1(f, t)_p ≤ 2 ω_1(f, t)_p`.

### CA-A04 Derivatives

Prove: for `1 ≤ p ≤ ∞` and `f ∈ W^r_p(E)` (Tau Ceti's `TauCeti.Wkp` on all of `E`),
`‖Δ_h^r f‖_p ≤ ‖h‖^r ‖∇^r f‖_p`, hence `ω_r(f, t)_p ≤ t^r ‖∇^r f‖_p`; the same on `𝕋^d` for periodic
`f` with weak derivatives of order `r` in `L_p`. *Needs:* CA-A02; Tau Ceti `TauCeti.Wkp`.

### CA-A05 Marchaud's inequality

Prove: for `1 ≤ k < r` and every `0 < p ≤ ∞`, on `E`:
`ω_k(f, t)_p ≤ C t^k (∫_t^∞ (u^{−k} ω_r(f, u)_p)^ρ du/u)^{1/ρ}`; on `𝕋^d` the same with the integral
over `[t, 1]` and an added `C t^k ‖f‖_p` (DeVore–Lorentz, Chapter 2, Theorem 8.1, for `p ≥ 1`;
Kolomoitsev–Tikhonov 2020, Property 7 and Remark 2, for every `p`). *Needs:* CA-A03, AS-A02.

### CA-A06 Equivalent orders and the integral form

Prove: for `0 < s < r ≤ r'` and every `0 < p, q ≤ ∞` the quasi-norms
`‖f‖_p + ‖(2^{ks} ω_r(f, 2^{−k})_p)_{k ≥ 0}‖_{ℓ_q}` for `r` and for `r'` are equivalent, and
equivalent to `‖f‖_p + (∫_0^1 (t^{−s} ω_r(f, t)_p)^q dt/t)^{1/q}`. *Needs:* CA-A03, CA-A05.

### CA-A07 The K-functional of `(L_p, W^r_p)`

Prove: for `1 ≤ p ≤ ∞` and `0 < t ≤ 1`, on `E` and `𝕋^d`:
`K(f, t^r; L_p, W^r_p) ≍ ω_r(f, t)_p + t^r ‖f‖_p` (Johnen–Scherer 1977). The range `p ≥ 1` is the
natural one: for `0 < p < 1` the K-functional with the seminorm `sup_{|ζ|=1} ‖D_ζ^r g‖_p` in place
of the norm of `W^r_p`, `inf_g (‖f − g‖_p + t^r sup_{|ζ|=1} ‖D_ζ^r g‖_p)`, vanishes identically
(Ditzian–Hristov–Ivanov 1995 for `d = 1`; Kolomoitsev–Tikhonov 2020, the remark after Property 16),
and the realisations of CA-C09 and CA-D04 take its place. *Needs:* CA-A04, AS-B01.

### CA-A08 Moduli on intervals and on the cube

Define, for `J = [a, b]`, `ω_r(f, t)_{p,J} = ⨆_{0 < h ≤ t} ‖Δ_h^r f‖_{L_p[a, b − rh]}`
(`intervalModulus`), and on `Q` the isotropic modulus `ω^iso_r(f, t)_p` with `Δ_h^r f` taken where
`x, x + rh ∈ Q`, `‖h‖_∞ ≤ t`, and the coordinate moduli `ω^{(i)}_r(f, t)_p` with steps `h e_i`.
Prove CA-A03 for `t ≤ (b − a)/r` (and on `Q`), CA-A05 with the added term `C t^k ‖f‖_p`, CA-A06, and
on `Q`: `ω^{(i)}_1 ≤ ω^iso_1` and `ω^iso_1(f, t)_p^ρ ≤ ∑_i ω^{(i)}_1(f, t)_p^ρ`, so both define the
same Besov spaces. *Needs:* CA-A03, CA-A05, CA-A06.

### CA-A09 Whitney's inequality

Prove: for every `0 < p ≤ ∞` and `r ≥ 1` there is `C` such that for `a < b` and `f ∈ L_p[a, b]`
some polynomial `P` of degree less than `r` satisfies
`‖f − P‖_{L_p[a,b]} ≤ C ω_r(f, (b − a)/r)_{p,[a,b]}` (DeVore–Lorentz, Chapter 6, Theorem 4.2, for
`p ≥ 1`; Storozhenko 1977, Theorem 2, for `0 < p < 1`, with the step `(b − a)/(2r + 1)`); on a
cube `x + [0, L]^d` the same with polynomials of degree less than `r` in each variable and the
isotropic modulus at `L/r`, with `C` independent of the cube (Storozhenko–Oswald 1978, Theorems 1
and 2, for `0 < p < 1`). *Needs:* CA-A08, CA-A10;
Mathlib `Polynomial`.

### CA-A10 Whitney's inequality in averaged form

Prove: for `0 < p ≤ 1`, `r ≥ 1`, `L = b − a` and `I_r(y) = ∫_a^{b − ry} |Δ_y^r f|^p`, some
polynomial `P` of degree less than `r` satisfies
`∫_a^b |f − P|^p ≤ W (L⁻¹ ∫_0^{L/(2r+1)} I_r(y) dy + I_r(L/(2r + 1)))`, `W` depending on `r` and `p`
(Storozhenko 1977, Theorem 1 and Lemmas 1–3 with the proof of Theorem 2). This form adds up over the
dyadic intervals of a partition, which CA-E04 uses. Route: approximation of the periodic extension
by constants through a doubling recursion of averaged differences, transfer from periodic to
non-periodic differences, induction on the degree; every step uses only `|a + b|^p ≤ |a|^p + |b|^p`,
so `p = 1` is included. *Needs:* CA-A08; Mathlib `Polynomial`, `lintegral_prod`.

### Examples

`1_{[0,1]}` for CA-A03; the jump and the line of the worked examples for CA-A08.

### Dependencies

CA-A01–CA-A06 rest on Mathlib, AS-A01 and AS-A02; CA-A07 on PDE Layer 1 and AS-B01; CA-A08–CA-A10
on CA-A01–CA-A06.

## Part B: Littlewood–Paley tools and Besov spaces in the full range

**Milestone B1: maximal functions, Nikolskii and Peetre.** CA-B01–CA-B04.

**Milestone B2: the Besov formula for every exponent.** CA-B05–CA-B09.

### CA-B01 Vector-valued maximal inequality

Prove the case `r = ∞`: for `1 < p < ∞`, `‖sup_j M f_j‖_p ≤ C ‖sup_j |f_j|‖_p`. With Tau Ceti's
`TauCeti.lintegral_tsum_maximalFunction_rpow_le`,
`TauCeti.lintegral_rpow_tsum_maximalFunction_rpow_le_of_exponent_lt` and
`TauCeti.lintegral_rpow_tsum_maximalFunction_rpow_le_of_lt_exponent` this gives
`‖(∑_j (M f_j)^r)^{1/r}‖_p ≤ C ‖(∑_j |f_j|^r)^{1/r}‖_p` for `1 < p < ∞`, `1 < r ≤ ∞`
(Fefferman–Stein 1971, Theorem 1), stated as one theorem. *Needs:* Tau Ceti
`TauCeti.maximalFunction`, `TauCeti.eLpNorm_maximalFunction_le` and the three theorems above.

### CA-B02 Nikolskii's inequality

Prove: for a tempered distribution `g` on `E` with values in `F` whose Fourier transform vanishes
outside the closed ball of radius `R` (so `g` is a smooth function of temperate growth) and
`0 < p ≤ r ≤ ∞`: `‖g‖_r ≤ C R^{d(1/p − 1/r)} ‖g‖_p`, `C` depending on `d` and `p` (Nikolskii 1951;
Triebel 1983, 1.3.2). For `p ≥ 1` this is Tau Ceti's
`TauCeti.exists_iteratedLineDerivOp_eq_and_norm_le_of_isVanishingOn_fourier`; for `p < 1` Peetre's
pointwise bound of CA-B03 with `r = p` shows that `g` is bounded, and the bound at `p₀ = 1` then
transfers as in AS-A15. *Needs:* AS-A15, CA-B03; Tau Ceti
`TauCeti.exists_iteratedLineDerivOp_eq_and_norm_le_of_isVanishingOn_fourier`.

### CA-B03 Peetre's maximal function

Define, for a tempered distribution `g` whose Fourier transform vanishes outside the closed ball of
radius `R` and `a > 0`, `g*_{R,a}(x) = sup_y |g(x − y)| / (1 + R|y|)^a` (`peetreMaximal`). Prove:
for `0 < r < ∞` and `a > d/r`, `g*_{R,a} ≤ C (M |g|^r)^{1/r}` pointwise, `C` independent of `R`
(Peetre 1975; Triebel 1983, 1.3.1); hence `‖g*_{R,a}‖_p ≤ C ‖g‖_p` for `a > d/p`, every `0 < p ≤ ∞`.
Vector-valued: for `0 < p < ∞`, `0 < q ≤ ∞`, `a > d/min(p, q)` and `g_j` with Fourier support in the
ball of radius `2^j`, `‖(∑_j |(g_j)*_{2^j,a}|^q)^{1/q}‖_p ≤ C ‖(∑_j |g_j|^q)^{1/q}‖_p` (CA-B01 with
`r < min(p, q)`). *Needs:* CA-B01; Tau Ceti `TauCeti.maximalFunction`,
`TauCeti.exists_iteratedLineDerivOp_eq_and_norm_le_of_isVanishingOn_fourier` at `p = ∞`.

### CA-B04 Multipliers on spectrally localised sequences

Prove: for functions `m_j` with `sup_j ‖m_j(2^j ·)‖_{C^N(B(0,2))} < ∞`, `N` large depending on
`d, p, q`, and sequences `g_j` with Fourier support in the ball of radius `2^{j+1}`:
`‖(𝓕⁻¹(m_j 𝓕g_j))_j‖ ≤ C ‖(g_j)_j‖` in `ℓ_q(L_p)` for `0 < p, q ≤ ∞` and in `L_p(ℓ_q)` for
`0 < p < ∞`, `0 < q ≤ ∞` (Triebel 1983, 1.5.2 and 1.6.3). *Needs:* CA-B03.

### CA-B05 The Besov formula in the full range

Define `blockENorm φ p j u`, the `L_p` quasi-norm of the `j`-th block of `u ∈ 𝓢'(E, F)` (the block
is the distribution of a smooth function of temperate growth; `∞` if that function is not in
`L_p`), and `besovENorm φ s p q u = ‖(2^{js} ‖Δ_j u‖_p)_j‖_{ℓ_q} ∈ ℝ≥0∞`. Prove: for `p, q ≥ 1`,
finiteness is Tau Ceti's `TemperedDistribution.MemBesov φ s p q u` and the value is the norm of
`TauCeti.BesovSpace`. For all `0 < p, q ≤ ∞`: the finite part is a quasi-normed submodule of
`𝓢'(E, F)`, complete for its quasi-norm and continuously embedded in `𝓢'(E, F)`; two bumps give
equivalent quasi-norms (CA-B03, CA-B04; Triebel 1983, 2.3.2); `B^s_{p,q} ⊆ B^t_{p,r}` for `t < s`,
and for `t = s`, `q ≤ r`; `B^s_{p₀,q} ⊆ B^{s − d(1/p₀ − 1/p₁)}_{p₁,q}` for `p₀ < p₁` (CA-B02).
*Needs:* CA-B02–CA-B04; Tau Ceti `TemperedDistribution.littlewoodPaleyBlock`,
`TemperedDistribution.MemBesov`, `TauCeti.BesovSpace`.

### CA-B06 Lifting, pointwise multipliers and diffeomorphisms

Prove: the Bessel potential `J^σ = 𝓕⁻¹(1 + |ξ|²)^{σ/2} 𝓕` maps `B^s_{p,q}` isomorphically onto
`B^{s−σ}_{p,q}` (CA-B04); multiplication by a function in `C^∞_b(E)` and composition with a
diffeomorphism of `E` whose derivatives of all orders and those of its inverse are bounded are
bounded on `B^s_{p,q}` for every `s` when `p < 1` or `q < 1` (Triebel 1992, Chapter 4).
*Needs:* CA-B04, CA-B05.

### CA-B07 The periodic formula

Prove for every `0 < p, q ≤ ∞`: for a formal Fourier series `c : ℤ^d → ℂ`, whose blocks
`Δ_j c = ∑_k ψ_j(k) c_k e_k` are trigonometric polynomials, the periodic Besov quasi-norm
`‖(2^{js} ‖Δ_j c‖_p)_j‖_{ℓ_q}`, with `‖·‖_p` the quasi-norm of `L_p(𝕋^d)`, agrees for `p ≥ 1` with
Tau Ceti's `TauCeti.UnitAddTorus.MemBesov`; its finiteness forces polynomial growth of `c`; and
CA-B02–CA-B06 hold for trigonometric polynomials and periodic distributions (Schmeisser–Triebel
1987, Chapter 3). *Needs:* CA-B02–CA-B06; Tau Ceti `TauCeti.UnitAddTorus.littlewoodPaleyBlockLp`,
`TauCeti.UnitAddTorus.MemBesov`.

### CA-B08 Interpolation of Besov spaces

Prove: for real `s₀ ≠ s₁`, `0 < η < 1` and all `0 < p, q₀, q₁, q ≤ ∞`, on `E` and on `𝕋^d`:
`(B^{s₀}_{p,q₀}, B^{s₁}_{p,q₁})_{η,q} = B^{(1−η)s₀ + ηs₁}_{p,q}` with equivalent quasi-norms.
Route: for a bump supported in `B(0, 2)` (enough by CA-B05), `B^s_{p,q}` is a retract of the space
of the sequences `(g_j)` in the weighted sequence space `ℓ^s_q(L_p)` with Fourier support of `g_j`
in the ball of radius `2^{j+1}`: analysis by the blocks, synthesis by enlarged blocks, bounded on
this space by CA-B04 for every `0 < p ≤ ∞`. The K-functional of two such weighted spaces is
computed by splitting a sequence by its index, which keeps the support condition, so they
interpolate as weighted sequence spaces do (Bergh–Löfström, Theorems 5.6.1, 6.4.3 and 6.4.5(1);
Triebel 1983, 2.4.2). For `p, q₀, q₁, q ≥ 1` this is Tau Ceti's
`TauCeti.CompatibleCouple.besovKMethodEquiv`; the other ranges use AS-B01. *Needs:* AS-B01,
AS-B02, CA-B04, CA-B05, CA-B07; Tau Ceti `TauCeti.CompatibleCouple.besovKMethodEquiv`,
`TauCeti.CompatibleCouple.weightedLpKMethodEquiv`,
`TauCeti.CompatibleCouple.kMethod_eq_map_of_leftInverse`.

### CA-B09 Positive smoothness gives functions

Prove: for `s > σ_p`, every `u ∈ B^s_{p,q}(E)` is the distribution of a locally integrable
`f ∈ L_p` with `‖f‖_p ≤ C ‖u‖_{B^s_{p,q}}`, and `f = ∑_j Δ_j u` in `L_p`; the same on `𝕋^d`
(Triebel 1983, 2.3.2 and 2.5.12; Nguyen–Sickel, arXiv:1703.03246, Proposition 2.4). *Needs:*
CA-B02, CA-B05, CA-B07.

**Checks.**
- The threshold `s > σ_p` is sharp: for `p < 1` and `ψ(ξ) = φ(ξ/2) − φ(ξ)` the Dirac mass `δ₀` has
  the blocks `Δ_j δ₀ = 2^{(j−1)d} (𝓕⁻¹ψ)(2^{j−1} ·)` for `j ≥ 1`, with
  `‖Δ_j δ₀‖_p = 2^{−(j−1)σ_p} ‖𝓕⁻¹ψ‖_p`, so `δ₀ ∈ B^{σ_p}_{p,∞}(E)`, and `δ₀` is not a locally
  integrable function.

### Examples

The Dirac mass of CA-B09; the single annular block of PDE §7.2, whose value
`2^{js} ‖Δ_j u‖_p` is the same formula for every `0 < p ≤ ∞`; the Fejér kernel of the worked
examples.

### Dependencies

CA-B01–CA-B04 rest on Tau Ceti's maximal functions, PDE §7.1 and AS-A15; CA-B05–CA-B09 on
CA-B01–CA-B04, Tau Ceti's Besov spaces and Part B of ApproximationSpaces.

## Part C: trigonometric approximation on `𝕋^d`

**Milestone C1: the scheme and its inequalities.** CA-C01–CA-C05.

**Milestone C2: descriptions of the Besov spaces.** CA-C06–CA-C10.

### CA-C01 The trigonometric scheme

Define `torusTrigPoly d n = span {e_k : ‖k‖_∞ < n}` and the scheme of functions `torusTrigScheme d`
in `L_∞(𝕋^d)` (AS-A14) with `T_0 = {0}` and, for `n ≥ 1`, `T_n` the classes of `torusTrigPoly d n`.
Prove that it is a linear scheme, in `L_∞(𝕋^d)` and in `L_p(𝕋^d)` for every `0 < p ≤ ∞`. *Needs:*
AS-A03, AS-A14; Mathlib `UnitAddTorus.mFourier`.

### CA-C02 de la Vallée Poussin operators

Prove: for `1 ≤ p ≤ ∞` there are linear `V_n` with `V_n (L_p) ⊆ T_{2n}`, `V_n T = T` for `T ∈ T_n`
and `‖V_n‖_{L_p → L_p} ≤ C(d)`; hence `‖f − V_n f‖_p ≤ (1 + C(d)) E_n(f)_p`. *Needs:* CA-C01.

### CA-C03 Bernstein's inequality

Prove: for `T ∈ T_{n+1}` and every `0 < p ≤ ∞`, `‖∂_j T‖_p ≤ 2πn ‖T‖_p` (M. Riesz for `p ≥ 1`,
Arestov 1981 for `p < 1`, each in one variable, then Fubini); and the inverse inequality for
differences `ω_r(T, t)_p ≤ C (n t)^r ‖T‖_p` for every `0 < p ≤ ∞`, from the derivative bound for
`p ≥ 1` and for `p < 1` from the difference form in one variable (Storozhenko–Krotov–Oswald 1975,
Theorem 3.2 and Lemma 3.1; Runovskii 1993, Theorem 3.4) and the coordinate reduction
`‖Δ_h f‖_p^ρ ≤ ∑_i ‖Δ_{h_i e_i} f‖_p^ρ`. For `p ≥ 1` Tau Ceti proves the derivative bound with a
constant `C(d)` (`TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_prod_smul`).
*Needs:* CA-C01, CA-A03; Tau Ceti
`TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_prod_smul`.

### CA-C04 Jackson's theorem

Prove: `E_n(f)_p ≤ C(d, r, p) ω_r(f, 1/n)_p` for `n ≥ 1` and every `0 < p ≤ ∞` (DeVore–Lorentz,
Chapter 7, Theorem 2.3, for `p ≥ 1`; Storozhenko–Krotov–Oswald 1975, Theorem 3.1, for `d = 1`,
`r = 1`, `p < 1`; Runovskii 1994, Theorem 3.3, for `d = 1`, every `r`, `p < 1`; Storozhenko–Oswald
1978, Theorem 3, for every `d` and `r`, `0 < p < 1`). *Needs:* CA-C01, CA-A03.

### CA-C05 Stechkin's inverse theorem

Prove: `ω_r(f, 1/n)_p ≤ C n^{−r} (∑_{k=1}^n (k^r E_{k−1}(f)_p)^ρ / k)^{1/ρ}` for every `0 < p ≤ ∞`
(DeVore–Lorentz, Chapter 7, Theorem 3.1, for `p ≥ 1`; Storozhenko–Krotov–Oswald 1975, Theorem 3.3,
for `d = 1`, `r = 1`, `p < 1`; Kolomoitsev–Tikhonov, arXiv:1711.08163, Proposition 4.2, with the
exponent `min(p, 2)`). *Needs:* CA-C03, AS-A02.

### CA-C06 Besov spaces of the torus

Prove: for `0 < s < r`, `0 < p, q ≤ ∞` and `f ∈ L_p(𝕋^d)`: `f ∈ A^s_q(L_p, T)` if and only if
`‖f‖_p + ‖(2^{ks} ω_r(f, 2^{−k})_p)_k‖_{ℓ_q} < ∞`, with equivalent quasi-norms (AS-B10 with CA-C03,
CA-C04, `θ = r`); for `s > σ_p` both are equivalent to `f ∈ B^s_{p,q}(𝕋^d)` of CA-B07 (CA-B09;
Schmeisser–Triebel 1987, Chapter 3). With AS-B10, `(L_p, B^t_{p,∞,ω_r})_{s/t,q} = B^s_{p,q,ω_r}` for
`0 < s < t ≤ r`. *Needs:* AS-B10, CA-C03, CA-C04, CA-B07, CA-B09.

### CA-C07 Hölder and Zygmund classes

Prove: for `0 < α < 1`, `E_n(f)_∞ = O(n^{−α})` if and only if `f` is `α`-Hölder;
`E_n(f)_∞ = O(n^{−1})` if and only if `f` lies in the Zygmund class
`sup_h ‖f(· + h) − 2f + f(· − h)‖_∞ / |h| < ∞` (Jackson, Bernstein, Zygmund 1945). *Needs:* CA-C06.

### CA-C08 The case `p = 2`

Prove: `E_n(f)_2² = ∑_{‖k‖_∞ ≥ n} |f̂(k)|²`; for `s > 0` and `0 < q ≤ ∞`, `f ∈ A^s_q(L_2, T)` if
and only if `(2^{js} (∑_{2^{j−1} ≤ ‖k‖_∞ < 2^j} |f̂(k)|²)^{1/2})_j ∈ ℓ_q`; and for `s > 0`,
`A^s_2 = {f : ∑_k (1 + |k|²)^s |f̂(k)|² < ∞}`, which for `d = 1` is Tau Ceti's
`TauCeti.CircleSobolev s`. *Needs:* CA-C01, AS-A02, AS-A05; Mathlib `UnitAddTorus.mFourierBasis`;
Tau Ceti `TauCeti.CircleSobolev`.

### CA-C09 Realisation

Prove: for every `0 < p ≤ ∞` and `n ≥ 1`,
`ω_r(f, 1/n)_p ≍ inf {‖f − T‖_p + n^{−r} ‖∇^r T‖_p : T ∈ T_n}` (Kolomoitsev–Tikhonov 2020, Property
17 and Remark 2; Ditzian–Hristov–Ivanov 1995 for `d = 1`). *Needs:* CA-C03, CA-C04.

### CA-C10 Nikolskii's inequality and the embeddings on the torus

Prove: for `0 < p ≤ r ≤ ∞` and `T ∈ T_n`, `n ≥ 1`, `‖T‖_r ≤ C n^{d(1/p − 1/r)} ‖T‖_p`, so the
trigonometric scheme in `L_∞(𝕋^d)` satisfies Nikolskii's inequality of dimension `d` at every
exponent (Tau Ceti's `TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_zero_of_lt_norm`
for `p ≥ 1`, AS-A15 below `1`); hence by AS-A16, for `α = d(1/p − 1/r) < s`, every
`0 < q ≤ ∞`: `A^s_q(L_p, T) ⊆ A^{s−α}_q(L_r, T)`, and for `s > d/p` every element has a continuous
representative. *Needs:* AS-A15, AS-A16, CA-C01; Tau Ceti
`TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_zero_of_lt_norm`.

### Examples

The lacunary series, the coordinate character and the Zygmund example of the worked examples.

### Dependencies

Part C rests on Parts A and B and on ApproximationSpaces.

## Part D: band-limited approximation and Besov spaces on `E`

**Milestone D1: band-limited functions and their inequalities.** CA-D01–CA-D04.

**Milestone D2: descriptions and embeddings.** CA-D05–CA-D08.

### CA-D01 Band-limited functions

Define `B_{σ,p} = {g ∈ L_p ∩ L_∞ : 𝓕g vanishes outside the closed ball of radius σ}` and prove:
closed in `L_p`; `L_∞` is automatic for `p ≥ 1` (CA-B02); `g ∈ B_{σ,p}` if and only if
`g(λ ·) ∈ B_{λσ,p}`; `A_0 = {0}`, `A_n = B_{n,p}` is a linear scheme in `L_p(E)` for every
`0 < p ≤ ∞` (`B_{0,∞}` holds the constants, hence the separate `A_0`). *Needs:* AS-A03, CA-B02;
Mathlib `Lp.toTemperedDistribution`.

### CA-D02 Bernstein's inequality for band-limited functions

Prove: for `g ∈ B_{σ,p}` and every `0 < p ≤ ∞`, `‖∂_v g‖_p ≤ C σ ‖v‖ ‖g‖_p` and
`ω_r(g, t)_p ≤ C (σ t)^r ‖g‖_p` (PDE §7.1 for `p ≥ 1`; for `p < 1` through CA-B03,
Kolomoitsev–Tikhonov 2020, Lemma 1 with Remark 3 (i) and Corollary 3). Hence the inverse theorem
`ω_r(f, 1/n)_p ≤ C n^{−r} (∑_{k=1}^n (k^r E(f, B_{k−1,p})_p)^ρ / k)^{1/ρ}`, with
`E(f, B_{0,p})_p := ‖f‖_p` (Kolomoitsev–Tikhonov 2020, Property 13). *Needs:* CA-B03, CA-A03,
AS-A02.

### CA-D03 Jackson's theorem for band-limited functions

Prove: `E(f, B_{σ,p})_p ≤ C ω_r(f, 1/σ)_p` for `σ ≥ 1` and every `0 < p ≤ ∞`; for `p ≥ 1` through
`f − ∑_{l=1}^r (−1)^{l+1} C(r, l) ∫ Φ_σ(y) f(· + l y) dy` with a Schwartz kernel `Φ`, `𝓕Φ` supported
in the unit ball, `𝓕Φ(0) = 1`, `Φ_σ = σ^d Φ(σ ·)`; for `p < 1` by generalised sampling operators
averaged over shifts (Kolomoitsev–Tikhonov 2020, Property 12, every order), or for `r = 1` by
smoothing a step function whose values on the cells of side `σ^{−1}` are chosen by Markov's
inequality. *Needs:* CA-D01, CA-A03.

### CA-D04 Realisation

Prove: for every `0 < p ≤ ∞` and `t > 0`,
`ω_r(f, t)_p ≍ inf {‖f − g‖_p + t^r ‖∇^r g‖_p : g ∈ B_{1/t,p}}` (Kolomoitsev–Tikhonov 2020,
Property 17). *Needs:* CA-D02, CA-D03.

### CA-D05 Three descriptions

Prove: for `0 < s < r`, `0 < p, q ≤ ∞` and `f ∈ L_p(E)`: `f ∈ A^s_q(L_p, (B_{n,p}))` if and only if
`‖f‖_p + ‖(2^{ks} ω_r(f, 2^{−k})_p)_k‖_{ℓ_q} < ∞` (AS-B10 with CA-D02, CA-D03); for `s > σ_p` both
are equivalent to `f ∈ B^s_{p,q}(E)` of CA-B05 (CA-B09), with equivalent quasi-norms (Triebel 1983,
2.5.3 and 2.5.12; Kolomoitsev–Tikhonov 2020, Properties 12 and 13). *Needs:* AS-B10, CA-D02, CA-D03,
CA-B05, CA-B09.

### CA-D06 Interpolation of `(L_p, W^r_p)` and of `(L_p, B)`

Prove: `(L_p, W^r_p)_{θ,q} = B^{θr}_{p,q}` for `1 ≤ p ≤ ∞`, `0 < θ < 1` (CA-A07, CA-D05);
`(L_p, B^{s₁}_{p,q₁})_{θ,q} = B^{θs₁}_{p,q}` for `θ s₁ > σ_p` and every `0 < p, q₁, q ≤ ∞` (AS-B08,
CA-D05). *Needs:* CA-A07, AS-B08, CA-D05.

### CA-D07 Sobolev–Slobodeckij spaces

Prove: for `0 < p < ∞` and `σ_p < s < 1`,
`‖f‖_p + (∫∫ |f(x) − f(y)|^p / |x − y|^{d + sp} dx dy)^{1/p}` is an equivalent quasi-norm on
`B^s_{p,p}(E)`; for `1 ≤ p < ∞` and `s = m + σ`, `m ∈ ℕ`, `0 < σ < 1`, the same with `∇^m f` in
place of `f` plus `‖f‖_{W^m_p}` (Gagliardo 1957; Triebel 1983, 2.5.12). *Needs:* CA-D05, CA-A06.

### CA-D08 Embeddings for band-limited approximation

Prove: for `0 < p ≤ r ≤ ∞`, `α = d(1/p − 1/r) < s` and `0 < q ≤ ∞` there is `K` such that every
`f ∈ A^s_q(L_p, (B_{n,p}))` lies in `L_r(E)` with
`‖f‖_r + ‖(2^{k(s−α)} E(f, B_{2^k,r})_r)_k‖_{ℓ_q} ≤
K (‖f‖_p + ‖(2^{ks} E(f, B_{2^k,p})_p)_k‖_{ℓ_q})`.
The measure of `E` is infinite, so AS-A14 does not apply; the route of AS-A16 does, with CA-B02 for
the blocks. *Needs:* AS-A02, CA-B02, CA-D01.

### Examples

The power singularity, the Fejér kernel and Slobodeckij at the threshold of the worked examples.

### Dependencies

Part D rests on Parts A and B, on ApproximationSpaces and on PDE §7.1.

## Part E: splines on the interval and steps on the cube

**Milestone E1: splines on the interval.** CA-E01–CA-E06, CA-E09.

**Milestone E2: Haar functions and `n`-term approximation on the interval.** CA-E07, CA-E08.

**Milestone E3: the cube.** CA-E10–CA-E13.

### CA-E01 Besov spaces of the interval

Define, for `r ≥ 1`, `s > 0` and `0 < p, q ≤ ∞`, the space `B^s_{p,q,r}(I)` of the `f ∈ L_p(I)` with
`‖f‖_p + ‖(2^{ks} ω_r(f, 2^{−k})_{p,I})_k‖_{ℓ_q} < ∞`, and `B^s_{p,q}(I) := B^s_{p,q,r}(I)` for any
`r > s`. Prove that for `s < r` the space does not depend on `r`, with equivalent quasi-norms
(CA-A08). *Needs:* CA-A08.

**Checks.**
- For `r ≤ s` the space `B^s_{p,q,r}(I)` is a different space: for `p < 1`, `r ≤ s < r − 1 + 1/p`
  and `q < ∞` it contains no function of `C^r(I)` other than the polynomials of degree less than `r`
  (Oswald 2018, end of §2).

### CA-E02 Dyadic splines

Define `S^r_k`, the functions on `I` that are polynomials of degree less than `r` on each
`[j 2^{−k}, (j + 1) 2^{−k})` and of class `C^{r−2}` on `I` (no condition for `r = 1`), and the
linear scheme `A_0 = {0}`, `A_n = S^r_{⌊log₂ n⌋}`, in `L_∞(I)`. *Needs:* AS-A03, AS-A14; Mathlib
`Polynomial`.

### CA-E03 B-splines

Prove: the B-spline basis `(N_{k,j})_j` of `S^r_k` with boundary knots of multiplicity `r` is
nonnegative, a partition of unity, each `N_{k,j}` is supported in at most `r` dyadic intervals, and
`‖∑_j c_j N_{k,j}‖_p ≍ 2^{−k/p} ‖c‖_{ℓ_p}` for `0 < p ≤ ∞`, constants depending on `r, p` (de Boor;
DeVore–Lorentz, Chapter 5; DeVore–Popov 1988, Lemma 4.1). *Needs:* CA-E02.

### CA-E04 Jackson's inequality for splines

Prove: `E(f, S^r_k)_p ≤ C(r, p) ω_r(f, 2^{−k})_{p,I}` for every `0 < p ≤ ∞` and `k ≥ 0`. Route:
local Whitney polynomials on the dyadic intervals and on windows of `r` neighbouring intervals
(CA-A09, and CA-A10 for `p ≤ 1`, whose averaged bounds add up over the windows), glued by the
quasi-interpolant `Q_k` applied to the piecewise polynomial; for `p < 1`, `Q_k` acts only on
piecewise polynomials, where its coefficients are bounded by Nikolskii's inequality for polynomials
below `1` (DeVore–Popov 1988, (4.18), (4.20) and Theorem 4.5). *Needs:* CA-A09, CA-A10, CA-E03.

### CA-E05 The inverse inequality for splines

Prove: `ω_r(S, t)_{p,I} ≤ C min(1, 2^k t)^{r − 1 + 1/p} ‖S‖_p` for `S ∈ S^r_k` and every
`0 < p ≤ ∞`. Across a knot a spline is a polynomial plus `c (x − ξ)_+^{r−1}`, and `Δ_h^r S` lives on
strips of width `rh` at the knots (DeVore–Popov 1988, (4.36), whose first term vanishes in one
variable; their Theorem 4.8 states the order `min(r, r − 1 + 1/p)` for every `d`). *Needs:* CA-E03,
CA-A08.

### CA-E06 Splines describe Besov spaces

Prove: for `0 < p, q ≤ ∞` and `0 < s < r − 1 + 1/p`, `A^s_q(L_p(I), (S^r_k)) = B^s_{p,q,r}(I)` with
equivalent quasi-norms (AS-B10 with CA-E04, CA-E05, `θ = r − 1 + 1/p`), hence
`A^s_q(L_p(I), (S^r_k)) = B^s_{p,q}(I)` for `0 < s < min(r, r − 1 + 1/p)` (DeVore–Popov 1988,
Theorem 5.1; Oswald 1980 and 1981 for `p < 1`). With AS-B10,
`(L_p, B^t_{p,∞,r}(I))_{s/t,q} = B^s_{p,q,r}(I)` for `0 < s < t ≤ r − 1 + 1/p`; with AS-A17, `f`
lies in `B^s_{p,q,r}(I)` if and only if `f = ∑_k g_k` with `g_k ∈ S^r_k` and
`(2^{ks} ‖g_k‖_p)_k ∈ ℓ_q` (DeVore–Popov 1988, Theorem 5.1 (iii) and Corollary 5.3). *Needs:*
AS-B10, AS-A17, CA-E01, CA-E04, CA-E05.

### CA-E07 Haar coefficients on the interval

With Tau Ceti's `±1`-valued Haar functions `h_{k,m}` (`TauCeti.unitInterval.haarFun`), coefficients
`c_{k,m} = 2^k ∫ f h_{k,m}` and `‖f‖_H = |∫ f| + ‖(2^{k(s − 1/p)} ‖(c_{k,m})_m‖_{ℓ_p})_k‖_{ℓ_q}`,
prove: for `0 < p < ∞`, `max(0, 1/p − 1) < s < 1/p` and `0 < q ≤ ∞`, `f ∈ B^s_{p,q,1}(I)` if and
only if `f ∈ L_1(I)` and `‖f‖_H < ∞`, with equivalent quasi-norms, and for `q < ∞` the Haar system
is a Schauder basis of `B^s_{p,q,1}(I)` (Ciesielski 1975 for `1 ≤ p < ∞`; Oswald 2018, Theorem 1;
Oswald 2021, Theorem 3.1 with `d = 1`). For `s < 1` the space is `B^s_{p,q}(I)` (CA-E01). *Needs:*
CA-E06, AS-A17; Tau Ceti `TauCeti.unitInterval.haarFun`, `TauCeti.unitInterval.haarBasis`.

### CA-E08 `n`-term Haar approximation

Prove: in `L_2(I)` with the `L_2`-normalised Haar basis, for `0 < α < 1` and `1/τ = α + 1/2`, the
approximation space `A^α_τ` of AS-A13 is `B^α_{τ,τ}(I)`, with equivalent quasi-norms
(DeVore–Jawerth–Popov 1992; DeVore 1998, §3.6). *Needs:* AS-A13, CA-E07.

### CA-E09 Nikolskii's inequality for splines and the embeddings

Prove: `‖S‖_∞ ≤ C 2^{k/p} ‖S‖_p` for `S ∈ S^r_k` and every `0 < p ≤ ∞` (CA-E03 for `p ≥ 1`, and the
case `p = 1` with AS-A15 below `1`), so the spline scheme satisfies Nikolskii's inequality of
dimension `1`; hence by AS-A16,
for `0 < p ≤ r' ≤ ∞` and `1/p − 1/r' < s < r − 1 + 1/p`, `B^s_{p,q,r}(I) ⊆ L_{r'}(I)` with a norm
bound. *Needs:* AS-A15, AS-A16, CA-E03, CA-E06.

### CA-E10 The cube

Define `B^s_{p,q}(Q)` by the isotropic moduli of CA-A08 for `0 < s < r`, and prove that tensor
dyadic splines of order `r` describe it for `0 < s < min(r, r − 1 + 1/p)` and every
`0 < p, q ≤ ∞`, as in CA-E04–CA-E06 with CA-A09 on dyadic cubes (DeVore–Popov 1988,
Theorem 5.1). *Needs:* CA-A08, CA-A09, AS-B10.

### CA-E11 Dyadic steps on the cube for `p ≤ 1`

Let `S_n` be the step functions of level `⌊log₂ n⌋` on the dyadic cells of `Q`, a scheme in
`L_∞(Q)`. Prove: Jackson's inequality `E_{2^j}(f)_p ≤ 2^{d/p} ω^iso_1(f, 2^{−j})_p` for every
`0 < p < ∞` (one value per cell by the first moment method); for `0 < p ≤ 1` the inverse inequality
`ω^iso_1(g, 2^{−k})_p ≤ C 2^{−(k−j)_+/p} ‖g‖_p` for steps `g` of level `j`; hence for `0 < p ≤ 1`,
`0 ≤ s < 1/p` and `0 < q ≤ ∞`, `B^s_{p,q}(S) = B^s_{p,q,1}(Q)`, the space of the first modulus, with
equivalent quasi-norms (AS-B10 with `θ = 1/p`; Oswald 2021, Lemma 2.1; DeVore–Popov 1988,
Theorem 5.1, for `s < 1`), and `(L_p, B^t_{p,∞,1}(Q))_{s/t,q} = B^s_{p,q,1}(Q)` for
`0 < s < t ≤ 1/p`. Nikolskii's inequality `‖g‖_∞ ≤ 2^{jd/p} ‖g‖_p` for steps of level `j` gives, by
AS-A16, `B^s_{p,q}(S) ⊆ B^{s − d(1/p − 1/r)}_{r,q}(S)` for `s > d(1/p − 1/r)` (Oswald 2021, (2.3),
and DeVore–Popov 1988, Theorem 7.1, for the limiting case). *Needs:* AS-B10, AS-A16, CA-A08.

### CA-E12 Martingale differences on the cube

Let `E_k` be the conditional expectation onto the dyadic cells of level `k`. Prove: `E_k f → f`
almost everywhere for integrable `f`; `‖E_k g‖_p^p ≤ 2^{(m−k)d(1−p)} ‖g‖_p^p` for steps `g` of level
`m ≥ k` and `0 < p ≤ 1`; and for `0 < p ≤ 1`, `s > d(1/p − 1)` and `0 < q ≤ ∞`, `f ∈ B^s_{p,q}(S)`
if and only if `f ∈ L_1(Q)` and `‖E_0 f‖_p + ‖(2^{ks} ‖E_{k+1} f − E_k f‖_p)_k‖_{ℓ_q} < ∞`, with
equivalent quasi-norms. *Needs:* AS-A17, CA-E11; Mathlib
`MeasureTheory.Integrable.tendsto_ae_condExp`.

### CA-E13 Haar functions on the cube

Define, for a dyadic cell `C_{k,n}` and `ε ∈ {0, 1}^d \ {0}`, the Haar function
`h_{k,n,ε} = 1_{C_{k,n}} ∏_{i : ε_i = 1} (−1)^{δ_i}`, `δ_i` the parity of `⌊2^{k+1} x_i⌋`, and
`λ_{k,n,ε}(f) = 2^{kd} ∫ f h_{k,n,ε}`. Prove `E_{k+1} f − E_k f = ∑_{n,ε} λ_{k,n,ε}(f) h_{k,n,ε}`
and, for `0 < p ≤ 1`, `d(1/p − 1) < s` and `0 < q ≤ ∞`: `f ∈ B^s_{p,q}(S)` if and only if
`f ∈ L_1(Q)` and `|∫ f| + ‖(2^{k(s − d/p)} (∑_{n,ε} |λ_{k,n,ε}(f)|^p)^{1/p})_k‖_{ℓ_q} < ∞`; with
CA-E11, for `d(1/p − 1) < s < 1/p` this describes `B^s_{p,q,1}(Q)`, and for `q < ∞` the Haar system
ordered by levels is a Schauder basis of it (Oswald 2021, Theorem 3.1, with (3.13) for `q < ∞` and
§5.4 for `q = ∞`; Theorem 1.1). The range is nonempty exactly when `p > (d − 1)/d`. *Needs:* CA-E11,
CA-E12.

### Examples

The jump and the line on `I`, the step on `Q` and the empty Haar range of the worked examples.

### Dependencies

CA-E01–CA-E06 and CA-E09 rest on Part A and on ApproximationSpaces; CA-E07, CA-E08 on CA-E06,
AS-A13 and Tau Ceti's Haar basis; CA-E10–CA-E13 on Part A and on ApproximationSpaces.

## Worked examples

- **A lacunary series.** On `𝕋`, `W_s = ∑_k 2^{−ks} cos(2π 2^k x)`, `0 < s < 1`, has
  `E_n(W_s)_∞ ≍ n^{−s}`, so `W_s ∈ A^s_∞ \ A^s_q` for `q < ∞` (CA-C04, CA-C05, CA-C06); for `s = 1`
  it lies in the Zygmund class and is not Lipschitz (CA-C07).
- **The coordinate character.** `e_1(x) = exp(2πi x_1)` on `𝕋^d` lies in `T_2`, hence in every
  `A^s_q(L_p, T)`, while `ω_r(e_1, t)_p = (2 sin(πt))^r ≥ (4t)^r` for `t ≤ 1/2`: the space of `ω_r`
  misses `e_1` for `s > r`, and for `s = r`, `q < ∞`, so the range `s < r` of CA-C06 is sharp for
  every `p`.
- **A jump.** `χ = 1_{[0,1/2)}` on `I`: `ω_1(χ, t)_{p,I} = t^{1/p}` for `t ≤ 1/2`, so
  `χ ∈ B^{1/p}_{p,∞,1}(I) \ B^{1/p}_{p,q,1}(I)` for `q < ∞` and every `p`. It lies in `S^1_k` for
  `k ≥ 1`, hence in every `A^s_q` of piecewise constants: the range `s < 1/p = r − 1 + 1/p` of
  CA-E06 at `r = 1` is sharp.
- **A line.** `x ↦ x` lies in every `B^s_{p,q}(I)` with `s < 2` (`ω_2 = 0`), while piecewise
  constants approximate it at the rate `2^{−k}` only, and `ω_1(x, t)_{p,I} ≍ t`: for `p < 1` the
  piecewise constants describe `B^s_{p,q}(I)` only for `s < 1 = min(r, r − 1 + 1/p)`, and
  `B^s_{p,q,1}(I)` up to `1/p` (CA-E06).
- **A step on the cube.** `χ = 1_{[0,1/2)^d}` has `ω^iso_1(χ, t)_p ≍ t^{1/p}` and is a step of level
  `1`: it lies in every `B^s_{p,q}(S)` of CA-E11 and in `B^s_{p,q,1}(Q)` exactly for `s < 1/p` (and
  `s = 1/p`, `q = ∞`), so the range `s < 1/p` of CA-E11 is sharp.
- **The empty Haar range.** For `d = 2`, `p = 1/2`: `d(1/p − 1) = 2 = 1/p`, and CA-E13 describes no
  space; for `d = 2`, `p = 2/3`: `1 < s < 3/2`.
- **The degenerate K-functional.** For `0 < p < 1` on `𝕋`, `inf_g (‖f − g‖_p + t ‖g'‖_p) = 0` for
  every `f` (Ditzian–Hristov–Ivanov 1995), while `ω_1(f, t)_p ≠ 0` for every non-constant `f`: the
  realisations CA-C09 and CA-D04 take the place of CA-A07.
- **A power singularity.** `|x|^α ψ(x)` on `ℝ`, `ψ` a smooth cutoff equal to `1` near `0` and
  `α > max(−1/p, −1)` not an even integer, lies in `B^{α + 1/p}_{p,∞}` and in no `B^{α + 1/p}_{p,q}`
  with `q < ∞` (CA-D05).
- **The Fejér kernel.** `(sin πx / (πx))²` has Fourier transform `(1 − |ξ|)_+` and decays like
  `|x|^{−2}`, so it lies in `B_{1,p}` exactly for `1/2 < p ≤ ∞`, and then `E(f, B_{σ,p}) = 0` for
  `σ ≥ 1` (CA-D01).
- **Slobodeckij at the threshold.** `1_{[0,∞)} ψ` has finite Gagliardo seminorm of order `s` exactly
  for `s < 1/p` (`1 ≤ p < ∞`), matching `B^{1/p}_{p,∞} \ B^{1/p}_{p,p}` (CA-D07).

## Provenance

An Apache-2.0 formalisation of a large part of this roadmap exists in
[Lean-FunctionSpaces](https://github.com/mario-ullrich/Lean-FunctionSpaces) (Mario Ullrich, Lean 4
with Mathlib `v4.36.0`, sorry-free, with a blueprint that names the Lean declaration of every
statement). It states its Besov spaces as approximation spaces of schemes, subsets of `L_p`; this
roadmap identifies them with the distributional formula of Convention 6. The roadmap specifies the
mathematics; the repository is a cited source, and its file map is not prescriptive. The Lean names
below are declarations of that repository.

- *Banach range.* Moduli of smoothness and the descriptions of Besov spaces on `ℝ^d` and `𝕋^d` by
  band-limited and trigonometric approximation and by differences for `1 ≤ p < ∞` (Parts A, C, D),
  splines, Haar and multiwavelet descriptions on the interval and the cube (Part E for `p ≥ 1`),
  `n`-term approximation by Haar functions (CA-E08).
- *Quasi-Banach range.* The embeddings of the trigonometric scheme for every `p` (CA-C10,
  `Torus.memBesov_exists_inclusion_eq`); and on `[0, 1)` for `0 < p ≤ 1` the dyadic steps: the space
  of the first modulus for `0 ≤ s < 1/p` (CA-E06 at `r = 1`,
  `Haar.memBesov_haarScheme_iff_modulus`), its interpolation
  (`Haar.memKMethod_intervalLpModulus_iff`), the embeddings (CA-E09 at `r = 1`,
  `Haar.exists_eLpNorm_le_eNormDyadic_stepCouple`), and Haar coefficients for `1/p − 1 < s < 1/p`
  (CA-E07, `Haar.lqNorm_modulus_lt_top_iff_haarCoeff_of_le_one`,
  `Haar.tendsto_eNormDyadic_sub_haarPartialSum`).
- *Not formalised there.* The Littlewood–Paley formula for `p < 1` or `q < 1` (CA-B02–CA-B09 in
  that range), Marchaud's inequality, the realisations, moduli of smoothness and Jackson's and the
  inverse inequalities on `𝕋^d`, `ℝ^d` and `Q` for `p < 1` (CA-C03–CA-C06, CA-D02–CA-D05, CA-D08,
  CA-E11–CA-E13), Whitney's inequality and splines of order `r ≥ 2` for `p < 1` (CA-A09, CA-A10,
  CA-E04–CA-E06, CA-E09, CA-E10).

## Scope and ownership

**This roadmap owns** moduli of smoothness of every order in `L_p`, `0 < p ≤ ∞`, on `E`, `𝕋^d`,
intervals and cubes, with Marchaud's and Whitney's inequalities (Part A); the Littlewood–Paley
tools and the Besov formula for `p < 1` or `q < 1`, and `(B, B)_{η,q} = B` outside the range
`p, q_i, q ≥ 1` (Part B); and trigonometric, band-limited, spline, step and Haar approximation with
their descriptions of Besov spaces (Parts C–E). Its suggested home in Tau Ceti is
`TauCeti/Analysis/FunctionalSpaces/`, beside `BesovSpace/`.

**Owned elsewhere and consumed here.**

- *Approximation spaces and real interpolation of quasi-normed couples.*
  [ApproximationSpaces](../ApproximationSpaces/README.md) owns quasi-normed groups, approximation
  schemes and their spaces, schemes of functions with their Besov spaces, Nikolskii's inequality
  for schemes and the embeddings, block decompositions, `n`-term approximation from a Hilbert
  basis, quasi-normed couples with the K- and E-functionals, the representation and reiteration
  theorems, and moduli compatible with a scheme. This roadmap owns the moduli, the schemes and the
  inequalities on concrete domains that feed them.
- *Besov spaces for `p, q ≥ 1`.* [PDE](../PDE/README.md) §7.1–7.2 owns the dyadic partition,
  Bernstein's inequality for spectrally supported functions, the square-function theorem and the
  Besov spaces for `1 ≤ p, q ≤ ∞` on `ℝ^d` and `𝕋^d`. This roadmap owns the same formula for `p < 1`
  or `q < 1` and every description of it by approximation and by differences.
- *Maximal functions.* PDE §2.1 owns the maximal function and the Fefferman–Stein inequality for
  `ℓ²`; this roadmap states it for every `1 < r ≤ ∞` (CA-B01) and owns Peetre's maximal function.
- *Real interpolation of Banach couples.*
  [NoncommutativeIntegration](../NoncommutativeIntegration/README.md) owns Banach couples, the
  K-functional and the K-method for `1 ≤ q ≤ ∞`; CA-B08 uses its Tau Ceti implementation for
  `p, q₀, q₁, q ≥ 1`.
- *Bessel potential spaces.* [PseudodifferentialOperators](../PseudodifferentialOperators/README.md)
  owns `(H^{s₀,p}, H^{s₁,p})_{θ,q} = B`, the Besov transition estimates for `p, q ≥ 1` and the
  bundle spaces; this roadmap owns `(L_p, W^r_p)_{θ,q} = B` and `(B, B)_{η,q} = B` outside the range
  `p, q_i, q ≥ 1`.
- *Uniform polynomial approximation.* [PolynomialInterpolationAndBestApproximation][piba]
  owns uniform approximation by algebraic polynomials on an interval, the modulus of continuity,
  Bernstein's inequality for real trigonometric polynomials in the uniform norm, Markov's inequality
  and Jackson's theorem in `C[a, b]`. This roadmap owns moduli of every order in `L_p`, Whitney's
  inequality, and trigonometric approximation in `L_p(𝕋^d)`; CA-A02 agrees with that modulus of
  continuity for continuous functions and `p = ∞`.
- *Band-limited functions in `L_2(ℝ)`.*
  [SamplingAndDiscreteFourierAnalysis](../SamplingAndDiscreteFourierAnalysis/README.md) owns the
  sampling theorem for band-limited functions in `L_2(ℝ)`; CA-D01 is the class in `L_p(E)`, every
  `0 < p ≤ ∞`, and at `p = 2`, `d = 1` it is that class.
- *Polynomials and splines elsewhere.*
  [SobolevPolynomialApproximation](../SobolevPolynomialApproximation/README.md) owns polynomial
  approximation of Sobolev functions (averaged Taylor polynomials, Bramble–Hilbert);
  [MathematicalStatisticsNonparametric](../MathematicalStatisticsNonparametric/README.md) owns
  smoothing splines. This roadmap owns Whitney's inequality, dyadic splines and B-splines.
- *The Haar basis of `L_p[0, 1]`, `1 ≤ p < ∞`.* [BanachSpaceTheory](../BanachSpaceTheory/README.md)
  B3 owns it; this roadmap owns its behaviour in Besov spaces and for `p < 1`.

Outside this roadmap: Besov spaces on domains as restrictions and their traces, wavelet
characterisations on `ℝ^d`, and the identification of the spaces of CA-E01, CA-E10 and CA-E11 with
restrictions of the spaces of CA-B05.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Lp`, `eLpNorm`, `eLpNormEssSup`, `MemLp`; `eLpNorm_add_le'` with
  `ENNReal.LpAddConst`;
  `ENNReal.rpow_add_le_add_rpow`; `lp`, `MeasureTheory.Measure.count`; `MeasurePreserving`,
  `Lp.compMeasurePreserving`; `TendstoInMeasure`; `lintegral_prod`;
  `MeasureTheory.Integrable.tendsto_ae_condExp` (Lévy's upward theorem).
- `Polynomial`.
- `UnitAddTorus`, `UnitAddTorus.mFourier`, `UnitAddTorus.mFourierCoeff`,
  `UnitAddTorus.mFourierBasis` (Parseval on `L²(𝕋^d)`).
- `TemperedDistribution` with the notation `𝓢'(E, F)`, `TemperedDistribution.fourierMultiplierCLM`,
  `Function.HasTemperateGrowth.toTemperedDistribution`, `MeasureTheory.Lp.toTemperedDistribution`,
  `ContDiffBump`.

### From Tau Ceti

Paths are under `TauCeti/`. Except `TauCeti.maximalFunction`, `TauCeti.eLpNorm_maximalFunction_le`,
`TauCeti.CircleSobolev` and `TauCeti.Wkp`, these declarations are on Tau Ceti `main` and newer than
the Tau Ceti pin of this repository; PDE §2.1 and §7.1–7.2, BanachSpaceTheory §3.5 and
NoncommutativeIntegration §2.4 specify them.

- *Littlewood–Paley and Besov spaces on `E`* (`Analysis/Calculus/BumpFunction/LittlewoodPaley.lean`,
  `Analysis/Distribution/TemperedDistribution/LittlewoodPaley.lean`,
  `Analysis/FunctionalSpaces/BesovSpace/Basic.lean`): `ContDiffBump.inhomogeneousLittlewoodPaley`;
  `TemperedDistribution.littlewoodPaleyBlock F φ j`; `TemperedDistribution.MemBesov φ s p q u`
  (`1 ≤ p`); `TauCeti.BesovSpace F φ s p q` with completeness, `bumpEquiv`, `inclusion`,
  `inclusionOfLT`, `inclusionOfExponentLE`.
- *Periodic Besov spaces* (`Analysis/FunctionalSpaces/BesovSpace/Torus.lean`):
  `TauCeti.UnitAddTorus.littlewoodPaleyBlockLp`, `TauCeti.UnitAddTorus.MemBesov φ s p q c` for
  formal Fourier series `c : (d → ℤ) → ℂ`, `TauCeti.UnitAddTorus.BesovSpace` (`1 ≤ p`).
- *Bernstein and Nikolskii inequalities for `p ≥ 1`*
  (`Analysis/Distribution/TemperedDistribution/Bernstein.lean`,
  `Analysis/Fourier/Torus/Bernstein.lean`):
  `TauCeti.exists_iteratedLineDerivOp_eq_and_norm_le_of_isVanishingOn_fourier`;
  `TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_prod_smul`,
  `TauCeti.UnitAddTorus.exists_eLpNorm_le_of_mFourierCoeff_eq_zero_of_lt_norm`.
- *Maximal functions* (`MeasureTheory/Integral/MaximalFunction.lean`,
  `MeasureTheory/Integral/MaximalFunction/VectorValued.lean`): `TauCeti.maximalFunction`,
  `TauCeti.eLpNorm_maximalFunction_le`, `TauCeti.lintegral_tsum_maximalFunction_rpow_le`,
  `TauCeti.lintegral_rpow_tsum_maximalFunction_rpow_le_of_exponent_lt`,
  `TauCeti.lintegral_rpow_tsum_maximalFunction_rpow_le_of_lt_exponent`.
- *Real interpolation of Besov spaces* (`Analysis/Normed/Interpolation/RealMethod/Basic.lean`,
  `Analysis/Normed/Interpolation/WeightedSequence.lean`,
  `Analysis/FunctionalSpaces/BesovSpace/RealInterpolation.lean`):
  `TauCeti.CompatibleCouple.kMethod_eq_map_of_leftInverse`,
  `TauCeti.CompatibleCouple.weightedLpKMethodEquiv`, `TauCeti.CompatibleCouple.besovKMethodEquiv`.
- *Sobolev spaces and the Haar basis*: `TauCeti.Wkp` (`Analysis/Sobolev/Wkp/Basic.lean`);
  `TauCeti.CircleSobolev` (`Analysis/Sobolev/Circle/Basic.lean`); `TauCeti.unitInterval.haarFun`,
  `TauCeti.unitInterval.haarBasis` (`MeasureTheory/Function/Lp/HaarBasis/Basic.lean`, a Schauder
  basis of `L_p[0, 1]` over `RCLike 𝕜`, `1 ≤ p < ∞`).

### From TauCetiRoadmap.ApproximationSpaces

- Part A: the quasi-norm of `L_p` and its `ρ`-triangle inequality (AS-A01), consumed in CA-A03;
  the discrete Hardy inequalities (AS-A02), consumed in CA-A05, CA-C05, CA-D02, CA-D08;
  approximation schemes and approximation quasi-norms (AS-A03, AS-A05), consumed in CA-C01, CA-C08,
  CA-D01, CA-E02; `n`-term approximation from a Hilbert basis (AS-A13), consumed in CA-E08; schemes
  of functions with their Besov spaces (AS-A14), consumed in CA-C01, CA-E02; Nikolskii's inequality
  below `1` and the embeddings (AS-A15, AS-A16), consumed in CA-B02, CA-C10, CA-E09, CA-E11, and
  the route of AS-A16 in CA-D08; block
  decompositions in `L_p` (AS-A17), consumed in CA-E06, CA-E07, CA-E12.
- Part B: quasi-normed couples and the K-method (AS-B01, AS-B02), consumed in CA-A07, CA-B08;
  reiteration for approximation spaces (AS-B08), consumed in CA-D06; moduli compatible with a scheme
  (AS-B10), consumed in CA-C06, CA-D05, CA-E06, CA-E10, CA-E11.

### From TauCetiRoadmap.PDE

- §1 (Layer 1): `W^{k,p}` on open sets, consumed in CA-A04, CA-A07.
- §2.1: the maximal function and the Fefferman–Stein inequality, consumed in CA-B01, CA-B03.
- §7.1–7.2: the partition, Bernstein's inequality for spectrally supported functions and the Besov
  spaces for `p, q ≥ 1`, consumed in Parts B–D through the Tau Ceti declarations above.

### From TauCetiRoadmap.NoncommutativeIntegration

- §2.2 and §2.4: Banach couples, the K-functional and the K-method for `1 ≤ q ≤ ∞`, consumed in
  CA-B08 through the Tau Ceti declarations above and through AS-B01.

### From TauCetiRoadmap.PseudodifferentialOperators

- §5.3: the weighted sequence formula and the retraction pattern of the Bessel potential spaces,
  consumed in CA-B08.

### From TauCetiRoadmap.BanachSpaceTheory

- B3: the Haar system as a Schauder basis of `L_p[0, 1]`, `1 ≤ p < ∞`, consumed in CA-E07.

### From TauCetiRoadmap.PolynomialInterpolationAndBestApproximation

- §5.1: `modulusOfContinuity`, compared with CA-A02 in its Check.

## References

- R. A. DeVore and G. G. Lorentz, *Constructive Approximation*, Grundlehren 303, Springer, 1993:
  Chapter 2 (moduli, Marchaud Theorem 8.1), Chapter 5 (splines), Chapter 6 (K-functionals, Whitney
  Theorem 4.2), Chapter 7 (Jackson Theorem 2.3, Stechkin Theorem 3.1, approximation spaces §9),
  Chapter 12 (splines and Besov spaces).
- R. A. DeVore and V. A. Popov, *Interpolation of Besov spaces*, Trans. Amer. Math. Soc. **305**
  (1988), 397–414: Lemma 4.1, (4.18), (4.20), Theorem 4.5, (4.36), Theorem 4.8, Theorem 5.1,
  Corollary 5.3, Theorem 7.1: CA-E03–CA-E06, CA-E10, CA-E11.
- R. A. DeVore, *Nonlinear approximation*, Acta Numer. **7** (1998), 51–150, §3.6: CA-E08.
- R. A. DeVore, B. Jawerth and V. Popov, *Compression of wavelet decompositions*, Amer. J. Math.
  **114** (1992), 737–785: CA-E08.
- M. M. Day, *The spaces `L^p` with `0 < p < 1`*, Bull. Amer. Math. Soc. **46** (1940), 816–823: the
  absence of continuous linear functionals behind the near-best approximants and quasi-interpolants
  of Parts C–E.
- J. Bergh and J. Löfström, *Interpolation Spaces*, Grundlehren 223, Springer, 1976, §§5.6, 6.4:
  CA-B08.
- H. Johnen and K. Scherer, *On the equivalence of the K-functional and moduli of continuity*,
  Lecture Notes in Math. **571** (1977), 119–140: CA-A07.
- Z. Ditzian, V. H. Hristov and K. G. Ivanov, *Moduli of smoothness and K-functionals in `L_p`,
  `0 < p < 1`*, Constr. Approx. **11** (1995), 67–83: CA-A07, CA-C09.
- Yu. Kolomoitsev and S. Tikhonov, *Properties of moduli of smoothness in `L_p(ℝ^d)`*, J. Approx.
  Theory **257** (2020), 105423, arXiv:1907.12788 (numbering of v3): Property 7 and Remark 2
  (CA-A05), Lemma 1, Remark 3 and Corollary 3 (CA-D02), Properties 12, 13, 17 (CA-D02–CA-D05,
  CA-C09); and *Hardy–Littlewood and Ulyanov inequalities*, arXiv:1711.08163, Proposition 4.2:
  CA-C05.
- E. A. Storozhenko, V. G. Krotov and P. Oswald, *Direct and converse theorems of Jackson type in
  `L^p` spaces, `0 < p < 1`*, Math. USSR-Sb. **27** (1975), 355–374: Theorems 3.1–3.3, Lemma 3.1
  (CA-C03–CA-C05).
- E. A. Storozhenko and P. Oswald, *Jackson's theorem in the spaces `L_p(ℝ^k)`, `0 < p < 1`*,
  Sibirsk. Mat. Zh. **19** (1978), 888–901; Siberian Math. J. **19** (1978), 630–640: Theorems 1
  and 2 (Whitney's inequality in several variables, CA-A09), Theorem 3 (Jackson on `𝕋^k` for every
  order, `0 < p < 1`, CA-C04).
- E. A. Storozhenko, *On the approximation by algebraic polynomials of functions of class `L^p`,
  `0 < p < 1`*, Izv. Akad. Nauk SSSR Ser. Mat. **41** (1977), 652–662; Math. USSR-Izv. **11**
  (1977), 613–623: Theorems 1 and 2, Lemmas 1–3 (CA-A09, CA-A10).
- K. V. Runovskii, *On families of linear polynomial operators in `L_p`-spaces, `0 < p < 1`*,
  Mat. Sb. **184** (1993), no. 2, 33–42; Russian Acad. Sci. Sb. Math. **78** (1994), 165–173:
  Theorem 3.4 (CA-C03); *On approximation by families of linear polynomial operators in
  `L_p`-spaces, `0 < p < 1`*, Mat. Sb. **185** (1994), no. 8, 81–102; Sb. Math. **82** (1995),
  441–459: Theorem 3.3 (CA-C04).
- V. V. Arestov, *On integral inequalities for trigonometric polynomials and their derivatives*,
  Math. USSR-Izv. **18** (1982), 1–17: CA-C03.
- P. Oswald, *Approximation by splines in the `L_p` metric, `0 < p < 1`*, Math. Nachr. **94**
  (1980), 69–96; *On inequalities for spline approximation and spline systems in the space `L_p`
  (`0 < p < 1`)*, in: Approximation and Function Spaces (Gdańsk, 1979), 1981, 531–552: CA-E06.
- P. Oswald, *Haar system as Schauder basis in Besov spaces: the limiting cases for `0 < p ≤ 1`*,
  arXiv:1808.08156: Theorem 1 and the end of §2 (CA-E01, CA-E07).
- P. Oswald, *Multivariate Haar systems in Besov function spaces*, Sb. Math. **212** (2021),
  810–842, translated from Mat. Sb. **212** (2021), no. 6, 73–108, arXiv:2002.12917: Lemma 2.1,
  (2.3), Theorem 1.1, Theorem 3.1 with (3.13), §5.4 (CA-E07, CA-E11, CA-E13), numbering of the
  journal version (arXiv v1: Lemma 1, (7), Theorem 1, Theorem 3 with (23), §5.4).
- H. Triebel, *Theory of Function Spaces*, Birkhäuser, 1983, 1.3.1, 1.3.2, 1.5.2, 1.6.3, 2.3.2,
  2.4.2, 2.5.3, 2.5.12: Part B, CA-D05, CA-D07; *Theory of Function Spaces II*, 1992, Chapter 4:
  CA-B06.
- H.-J. Schmeisser and H. Triebel, *Topics in Fourier Analysis and Function Spaces*, Wiley, 1987,
  Chapter 3: CA-B07, CA-C06.
- C. Fefferman and E. M. Stein, *Some maximal inequalities*, Amer. J. Math. **93** (1971), 107–115:
  CA-B01.
- J. Peetre, *On spaces of Triebel–Lizorkin type*, Ark. Mat. **13** (1975), 123–130: CA-B03.
- S. M. Nikolskii, *Approximation of Functions of Several Variables and Imbedding Theorems*,
  Springer, 1975: CA-B02, CA-D01–CA-D03.
- V. K. Nguyen and W. Sickel, *Pointwise multipliers for Sobolev and Besov spaces of dominating
  mixed smoothness*, arXiv:1703.03246, Proposition 2.4: CA-B09.
- Z. Ciesielski, *Constructive function theory and spline systems*, Studia Math. **53** (1975),
  277–302: CA-E07.
- E. Gagliardo, Rend. Sem. Mat. Univ. Padova **27** (1957), 284–305: CA-D07.
- C. de Boor, *A Practical Guide to Splines*, Springer, revised ed. 2001: CA-E03.
