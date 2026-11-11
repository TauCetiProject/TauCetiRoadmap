# Roadmap: general orthogonal polynomials

**Summary.** This roadmap builds the general theory of orthogonal polynomials on the real line of
§§18.1–18.2 of the NIST *Digital Library of Mathematical Functions* (DLMF; see
[References](#references)) as a library. Mathlib has the classical families as algebraic objects
(`Polynomial.hermite`, `Polynomial.Chebyshev.T` and `U`, `Polynomial.shiftedLegendre`), the
orthogonality and Gauss quadrature of the Chebyshev polynomials, forward differences, continued
fractions, Prokhorov's theorem and the resolvent (Stieltjes) transform of a measure. Tau Ceti has
moment determinacy under one exponential moment and the completeness of an orthogonal polynomial
system in `L²` that follows from it. Neither has orthogonal polynomials of a general measure.

The roadmap covers:
- the forward, backward and imaginary central difference operators of §18.1(i);
- orthogonality measures, weights and point masses, the monic orthogonal polynomials of a measure
  by Gram–Schmidt, standardizations and the constants `h_n`, `h̃_n`, `k_n`, `k̃_n`, `k̃̃_n`;
- the three-term recurrence in its first, second, monic and orthonormal forms, and the Jacobi
  matrix;
- the Christoffel–Darboux formula, the kernel property, kernel polynomials and the Poisson kernel;
- the zeros: reality, simplicity, location, interlacing, the Jacobi-matrix eigenvalues and the
  discriminant; Gauss quadrature and the Christoffel numbers;
- the parity and quadratic transformations of §18.2(vii);
- moments, Hankel determinants and the determinant formulas for the polynomials and the recurrence
  coefficients;
- Favard's theorem, Hamburger's theorem, uniqueness of the orthogonality measure for bounded
  recurrence coefficients and on bounded intervals, and completeness with the `L²` expansion;
- associated and corecursive polynomials, the J-fraction and Markov's theorem;
- semi-classical weights and their structure relations, Sheffer polynomials, and Szegő's theorem
  on monotonic weights.

**This roadmap is DLMF §§18.1–18.2, not all of it.** The Szegő and Nevai classes of §18.2(xi),
M. Riesz's completeness theorem for determinate measures, Meixner's classification of the Sheffer
orthogonal polynomials and the `q`-Pochhammer notation of §18.1(i) are listed in
[Beyond this roadmap](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement). The classical
families (§§18.3–18.18), the Askey scheme (§§18.19–18.26) and the other families (§§18.30–18.37)
build on this roadmap.

The roadmap rests only on Mathlib and Tau Ceti. It consumes no other roadmap.

Suggested home: `TauCeti/Analysis/OrthogonalPolynomials/` for the measure-dependent theory, and
`TauCeti/RingTheory/Polynomial/ThreeTermRecurrence.lean`,
`TauCeti/RingTheory/Polynomial/Sheffer.lean` and `TauCeti/Algebra/Group/BackwardDiff.lean` for
the algebraic parts.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Difference operators** (DLMF §18.1(i)).
2. **Orthogonality measures and orthogonal polynomials** (DLMF §18.2(i), §18.2(iii)).
3. **Recurrence relations** (DLMF §18.2(iv)).
4. **The Christoffel–Darboux formula and kernels** (DLMF 18.2.12–18.2.13, 18.2.41).
5. **Zeros, Gauss quadrature and kernel polynomials** (DLMF §18.2(vi), 18.2.14–18.2.17, 18.2.37).
6. **Symmetry and quadratic transformations** (DLMF §18.2(vii)).
7. **Moments and Hankel determinants** (DLMF §18.2(ix)).
8. **Favard's theorem, uniqueness and completeness** (DLMF §18.2(viii)).
9. **Associated polynomials, continued fractions and Markov's theorem** (DLMF §18.2(x)).
10. **Structure relations, Sheffer polynomials and monotonic weights** (DLMF §18.2(xii)).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.

**What this roadmap owns:** the following DLMF formulas and statements, with the hypotheses and
conventions specified in the layers:

| Formulas | Targets |
|---|---|
| §18.1(i): `Δ_x`, `∇_x`, `δ_x` and their powers | Difference operators (Layer 1). |
| 18.2.1–18.2.4_5 | Orthogonality on intervals, on countable sets and for measures (2.1–2.2). |
| 18.2.5–18.2.7, the standardizations of §18.2(iii) | Constants and normalizations (2.3). |
| 18.2.8–18.2.11_8 | The recurrence in all four forms (3.2–3.4). |
| 18.2.11_9, 18.2.18 | The Jacobi matrix (3.5, 5.4). |
| 18.2.12–18.2.13, 18.2.12_5 | Christoffel–Darboux and the kernel property (4.1–4.2). |
| 18.2.14–18.2.17 | Kernel polynomials (5.6). |
| 18.2.41 | The Poisson kernel (4.3). |
| The zero statements of §18.2(vi), 18.2.19–18.2.20 | Zeros, interlacing, discriminant (5.1–5.5). |
| 18.2.37, Gauss quadrature | Christoffel numbers and quadrature (5.2). |
| 18.2.21–18.2.23 | Parity and quadratic transformations (Layer 6). |
| 18.2.26–18.2.30 | Moments and Hankel determinants (Layer 7). |
| Favard's theorem, uniqueness and completeness of §18.2(viii), 18.2.24–18.2.25 | Layer 8. |
| 18.2.31–18.2.36, 18.2.38 | Associated polynomials, J-fraction, Markov's theorem (Layer 9). |
| 18.2.42–18.2.46, the monotonic-weight statement of §18.2(xii) | Layer 10. |

DLMF 18.2.11_1 is printed with the wrong sign; 3.2 states the correct identity.

Cases of these statements that Mathlib already proves are inputs, not targets: the forward
difference and its Newton formula (`fwdDiff`, `fwdDiff_iter_eq_sum_shift`,
`Polynomial.fwdDiff_iter_degree_eq_factorial`), and the Chebyshev case of Gauss quadrature
(`Polynomial.Chebyshev.integral_eq_sumZeroes`), which is a check on 5.2.

It also owns the following auxiliary results, which the layers need and which neither Mathlib nor
Tau Ceti provides:

| Result | Target |
|---|---|
| The discriminant of a split polynomial: `disc(c ∏ (X − x_i)) = c^{2n−2} ∏_{i<j} (x_i − x_j)²` | 5.5 |
| Moment convergence under weak convergence with uniformly bounded higher moments | 8.2 |
| Hamburger's theorem: positive Hankel determinants characterize the moment sequences of measures with infinite support | 8.3 |
| A finite measure with `∫ x^{2k} dν ≤ C M^{2k}` for all `k` is supported in `[−M, M]` | 8.4 |

**What it does not own:**
- The orthogonal polynomial ensembles of random matrix theory: Andréief's identity, the
  determinantal structure and the Hermite, Laguerre and Jacobi kernels
  ([RandomMatrices](../RandomMatrices/README.md) §8.2). RandomMatrices §8.2 owns these statements
  for the orthonormal polynomials of a weight with all moments finite: Gram–Schmidt of the
  monomials, the three-term recurrence, Christoffel–Darboux and the reproducing and projection
  identities. 3.4, 4.1 and 4.2 here are the statements for every orthogonality measure and every
  standardization, and 3.4 identifies the two constructions.
- The definitions and family-specific theory of the classical, Askey-scheme and other named
  families of DLMF §§18.3–18.37.
- The Szegő class and Szegő asymptotics, the Nevai class and the Blumenthal–Nevai theorem (DLMF
  18.2.39–18.2.40), M. Riesz's theorem that a determinate measure gives a complete system, the
  indeterminate moment problem, Meixner's classification of the orthogonal Sheffer polynomials,
  the nonnegativity of Poisson kernels, the converse of the structure relation, the Euler
  polynomials as a Sheffer system that is not orthogonal (§18.2(xii)), and the `q`-Pochhammer
  symbols of §18.1(i).

See the last section for these.

**The boundary in one sentence:** this roadmap owns every statement of DLMF §§18.1–18.2 about
general orthogonal polynomials, except 18.2.39–18.2.40 and the theorems quoted with them, M. Riesz's
completeness theorem, Meixner's classification, the Euler polynomials and the `q`-notation.

## Conventions

- **Measures.** All measures are `μ : Measure ℝ`. An *orthogonality measure* is
  `IsOrthogonalityMeasure μ`: every `x ↦ xⁿ` is `μ`-integrable and `μ.support` is infinite. This is
  DLMF's Lebesgue–Stieltjes measure `dμ_α` of a bounded nondecreasing `α` with infinitely many
  points of increase (18.2.4_5); a weight `w` on `(a, b)` is the measure
  `(volume.restrict (Ioo a b)).withDensity (ENNReal.ofReal ∘ w)`, and weights `w_x` on a countable
  set `X` are `Measure.sum fun x : X => w x • dirac x`. A finite set of `N + 1` points (18.2.3) is a
  measure with `μ.support.encard = N + 1`; statements about `p_n` on such a measure carry
  `(n : ℕ∞) < μ.support.encard`, and the finite system stops at `n = N`.
- **Polynomials** are `ℝ[X]`, evaluated with `Polynomial.eval`; at a complex point `z` they are
  evaluated with `aeval z`. The pairing is `pairing μ p q = ∫ p(x) q(x) dμ(x)`.
- **The monic orthogonal polynomials** are `monic μ n`, defined by Gram–Schmidt on the monomials:
  `monic μ n = Xⁿ − Σ_{k<n} (⟨Xⁿ, monic μ k⟩/⟨monic μ k, monic μ k⟩) monic μ k`. The definition is
  total; the layers prove it is the monic orthogonal polynomial of degree `n` whenever
  `(n : ℕ∞) < μ.support.encard`. A general system is `IsOrthogonal μ p`: exact degrees, nonzero,
  pairwise orthogonal. `orthonormal μ n` is `monic μ n / √h_n`, with positive leading coefficient.
- **The constants** of DLMF 18.2.5–18.2.7 for a system `p` are `normSq μ p n = h_n`,
  `normSqX μ p n = h̃_n`, `(p n).leadingCoeff = k_n`, `(p n).nextCoeff = k̃_n` (Mathlib's
  `nextCoeff` is `0` in degree `0`, as DLMF's `k̃₀ = 0`), and `subNextCoeff (p n) = k̃̃_n`, the
  coefficient two below the leading one, `0` in degree `< 2`.
- **`p_{−1} = 0`.** No statement uses a polynomial of index `−1` or a truncated subtraction in an
  index that could produce one: every recurrence is stated separately at `n = 0` and at `n + 1`.
  The second-form coefficient `c_n` is `recC μ p n` with `recC μ p 0 = 0`, and the monic `β_n` is
  `beta μ n` with `beta μ 0 = 0`.
- **The recurrence polynomials.** `Polynomial.monicThreeTerm α β` over any commutative ring is
  `p₀ = 1`, `p₁ = X − α₀`, `p_{n+2} = (X − α_{n+1}) p_{n+1} − β_{n+1} p_n` (DLMF 18.2.11_5). The
  first associated polynomials `p_n^{(1)}` are `monicThreeTerm (α ∘ succ) (β ∘ succ)`, and the
  corecursive polynomials `p_n^{(0)}` are `Polynomial.corecursive α β` (`p₀ = 0`, `p₁ = 1`, same
  recurrence).
- **The Jacobi matrix** `J_n = jacobiMatrix a b c n` has `b_i` on the diagonal, `a_i` at
  `(i, i + 1)` and `c_i` at `(i, i − 1)` (DLMF 18.2.18).
- **Zeros** are indexed from `0` in increasing order: `zeros μ n : Fin n → ℝ`, so DLMF's `x_k` is
  `zeros μ n (k − 1)`. The Christoffel numbers are `christoffelNumber μ n i`, the `n`-point Gauss
  measure is `gaussMeasure μ n = Σ_i w_i δ_{x_i}`.
- **Hankel determinants** are defined for any sequence `m : ℕ → ℝ`: `hankelDet m n` is
  `det (m (i + j))_{i,j<n}` with `Δ₀ = 1`, and `hankelDet' m n` is DLMF's `Δ′_n` with `Δ′₀ = 0`.
  For a measure they are applied to `moment μ`.
- **Continued fractions.** The J-fraction 18.2.34 is the Mathlib generalized continued fraction
  `jFraction α β z` with head `0` and partial pairs `(1, z − α₀)`, `(−β_k, z − α_k)`; its `n`-th
  approximant `F_n` of 18.2.35 is `(jFraction α β z).convs' n`, so `F₀ = 0` and `F₁ = 1/(z − α₀)`.
- **Complex arguments.** DLMF's `z ∈ ℂ \ [a, b]` is
  `∀ t ∈ Set.Icc a b, (t : ℂ) ≠ z`, used together with `∀ᵐ x ∂μ, x ∈ Set.Icc a b`. Uniform
  convergence on compact subsets is `TendstoLocallyUniformlyOn`. The Stieltjes transform
  `∫ dμ(x)/(z − x)` is `−MeasureTheory.resolventTransform μ z`.
- **Formal power series.** Sheffer generating functions are identities in `PowerSeries R[X]` over a
  `ℚ`-algebra `R`: `exp(x u(t))` is `(PowerSeries.exp R[X]).subst (C X * u.map C)`. In 18.2.46 the
  operator `D_x` is `d/dx`, `v(D_x)` is `derivativeAction v`, which sends `p` to
  `Σ_{k ≤ deg p} v_k p⁽ᵏ⁾`, and `v` is the compositional inverse `PowerSeries.substInvOfIsUnit u`.
  DLMF's `c_n` are taken equal to `1`; a system with other nonzero `c_n` is the rescaled system
  `c_n p_n`.
- **Semi-classical measures.** `IsSemiclassical μ π τ` is the Pearson-equation definition of
  10.1. It implies DLMF's definition, which is the structure relation 18.2.44 with `s`, `t`
  independent of `n`: 10.1 gives it with `t = d − 1` and `s = max(deg τ, d − 1)`, `d = deg π`. The
  converse is listed in the last section.
- **Names.** Measure-dependent definitions and theorems live in the namespace
  `OrthogonalPolynomials`; `monicThreeTerm`, `corecursive`, `jacobiMatrix`, `imCentralDiff`,
  `derivativeAction` and `IsSheffer` live in `Polynomial`, and `bwdDiff` beside Mathlib's
  `fwdDiff`. Names in the layers are suggestions.

## Exact supplier contracts

### From Tau Ceti

At the pinned Tau Ceti:
- `TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean`:
  `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot` (a polynomial family of exact degrees is
  complete in `L²(w·μ)` when `w·μ` has one finite exponential moment) and
  `TauCeti.memLp_two_algebraMap_eval` (8.5).
- `TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean`:
  `TauCeti.hilbertBasisOfOrthogonalSystem` and `TauCeti.coeFn_hilbertBasisOfOrthogonalSystem`
  (8.5).
- `TauCeti/Probability/Moments/Determinacy.lean`:
  `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` (two finite measures
  with one exponential moment each and equal moments are equal) (8.4).
- `TauCeti/RingTheory/Polynomial/Hermite/GeneratingFunction.lean`:
  `Polynomial.hasSum_hermite_generating_function` (10.2).
- `TauCeti/MeasureTheory/Measure/ResolventTransform/`: the API of Mathlib's `resolventTransform`
  on `ℝ` (9.3).

### From Mathlib

- `fwdDiff`, `fwdDiff_iter_eq_sum_shift`, `shift_eq_sum_fwdDiff_iter`, `fwdDiff_choose`,
  `Polynomial.fwdDiff_iter_degree_eq_factorial`, `ascPochhammer`, `descPochhammer`.
- `MeasureTheory.Measure.support`, `MeasureTheory.Measure.withDensity`,
  `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.sum`, `StieltjesFunction.measure`,
  `MeasureTheory.Lp`, `HilbertBasis`.
- `Polynomial.Sequence`, `Polynomial.nextCoeff`, `Polynomial.divByMonic`, `Lagrange.basis`,
  `Polynomial.discr`, `Polynomial.discr_of_degree_eq_two`, `Polynomial.resultant_eq_prod_roots_sub`,
  `Polynomial.roots`, `Multiset.sort`.
- `Matrix.charpoly`, `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.charpoly_eq`,
  `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues`, `Matrix.det_succ_row`, `eigenvalue_mem_ball`
  (Gershgorin), `InnerProductSpace.gramSchmidtNormed`.
- `polynomialFunctions_closure_eq_top` (Weierstrass on `[a, b]`).
- `isCompact_closure_of_isTightMeasureSet` (Prokhorov), `MeasureTheory.IsTightMeasureSet`,
  `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.resolventTransform`.
- `GenContFract`, `GenContFract.convs'`, `GenContFract.conts`.
- `PowerSeries.subst`, `PowerSeries.exp`, `PowerSeries.substInvOfIsUnit`,
  `PowerSeries.subst_substInvOfIsUnit_right`, `Polynomial.bernoulli`,
  `Polynomial.bernoulli_generating_function`, `bernoulli`, `Polynomial.hermite`.
- `Polynomial.Chebyshev.measureT`, `Polynomial.Chebyshev.integral_eq_sumZeroes`.

## How to read the build

Layer 1 needs only Mathlib and is independent of the rest. Layer 2 needs only Mathlib. Layer 3
needs Layer 2, and Layer 4 needs Layers 2 and 3. Layer 5 needs Layers 3 and 4. Layers 6 and 7
need Layer 2 and the recurrence of Layer 3. Layer 8 needs Layers 3 and 7. Layer 9 needs Layers 3
and 5. Layer 10 needs Layers 2 and 3, and 10.3 also needs Layer 5; the Sheffer part 10.2 needs
only Mathlib and 3.4.

```text
Layer 1

Layer 2 ──► Layer 3 ──► Layer 4 ──► Layer 5 ──► Layer 9
               │                       │
               ├──► Layer 6            └──► 10.3
               ├──► Layer 7 ──► Layer 8
               └──► Layer 10
```

## Layer 1: difference operators

### 1.1 Forward and backward differences

DLMF §18.1(i): `Δ_x f(x) = f(x + 1) − f(x)` is Mathlib's `fwdDiff 1 f`, and `Δ_x^{n+1} = Δ_x Δ_x^n`
is the iterate `(fwdDiff 1)^[n + 1]`. Define `bwdDiff h f x = f x − f (x − h)` over an additive
group, so `∇_x = bwdDiff 1`. Targets:
- `bwdDiff h f x = fwdDiff h f (x − h)`;
- Newton's formula `∇ⁿ f(x) = Σ_{k=0}^{n} (−1)^k C(n, k) f(x − kh)` (`bwdDiff_iter_eq_sum`), and
  its inverse `f(x − nh) = Σ_k (−1)^k C(n, k) ∇^k f(x)`;
- on polynomials: `∇ⁿ` of a polynomial of degree `n` is the constant `n!` times the leading
  coefficient, and `∇^{n+1}` of it is `0`, the analogues of
  `Polynomial.fwdDiff_iter_degree_eq_factorial` and
  `Polynomial.fwdDiff_iter_degree_add_one_eq_zero`;
- `Δ [x]_{k+1} = (k + 1) [x]_k` for the falling factorial `[x]_k = (descPochhammer R k).eval x`
  and `∇ (x)_{k+1} = (k + 1) (x)_k` for the rising factorial `(x)_k = (ascPochhammer R k).eval x`
  (`fwdDiff_descPochhammer`, `bwdDiff_ascPochhammer`);
- summation by parts on `{0, …, N}`:
  `Σ_{x=0}^{N} f(x) Δg(x) = f(N + 1) g(N + 1) − f(0) g(0) − Σ_{x=0}^{N} g(x + 1) Δf(x)`
  (`sum_range_mul_fwdDiff`), and its `∇` form.

Route: induction, using Mathlib's `fwdDiff` API.

*Needs:* Mathlib `fwdDiff`.

**Checks.**
- `∇² f(x) = f(x) − 2f(x − 1) + f(x − 2)`.
- `Δ [x]_2 = Δ (x² − x) = 2x = 2 [x]_1` and `∇ (x)_2 = ∇ (x² + x) = 2x = 2 (x)_1`.

### 1.2 The central difference in the imaginary direction

DLMF §18.1(i): `δ_x f(z) = (f(z + i/2) − f(z − i/2))/i` for `f : ℂ → ℂ` (`imCentralDiffFun`), and on
complex polynomials `imCentralDiff p = i⁻¹ (p(X + i/2) − p(X − i/2))`. Targets:
- `(imCentralDiff p).eval z = imCentralDiffFun (eval · p) z`;
- for `deg p = n ≥ 1`, `deg δ_x p = n − 1` with leading coefficient `n` times that of `p`, and
  `δ_x` kills constants; hence `δ_xⁿ p` is the constant `n!` times the leading coefficient
  (`imCentralDiff_natDegree_leadingCoeff`);
- `δ_x` maps real polynomials to real polynomials (`imCentralDiff_map_real`).

Route: binomial expansion of `(X ± i/2)^k`; the even powers of `i/2` cancel.

*Needs:* Mathlib `Polynomial.comp`, `Polynomial.map`.

**Checks.**
- `δ_x x = 1`, `δ_x x² = 2x`, `δ_x x³ = 3x² − 1/4`.
- `δ_x 1 = 0`, and `δ_x x² = 2x` differs from the forward difference `Δ x² = 2x + 1`.
- Without the factor `i⁻¹`, `p(X + i/2) − p(X − i/2)` at `p = X` is `i`, which is not real: the
  factor is what makes `imCentralDiff_map_real` hold.

### Examples

- `Δ³ x³ = 3! = 6`, and `∇ x³ = 3x² − 3x + 1`.

### Dependencies

Mathlib only.

## Layer 2: orthogonality measures and orthogonal polynomials

### 2.1 Orthogonality measures

Define `IsOrthogonalityMeasure μ` (all moments finite, `μ.support` infinite), the moments
`moment μ n = ∫ xⁿ dμ` and the pairing `pairing μ p q = ∫ p q dμ`. Targets:
- an orthogonality measure is finite, every polynomial is in `L²(μ)`, and `pairing μ q q > 0` for
  every nonzero `q` (`pairing_self_pos`); more generally, for any `μ` with finite moments,
  `pairing μ q q > 0` when `q ≠ 0` and `(deg q : ℕ∞) < μ.support.encard`;
- **weights** (DLMF 18.2.1, 18.2.1_5): for a measurable set `s`, a measurable `w ≥ 0` on `s` with
  `0 < ∫_s w` and `∫_s |x|ⁿ w < ∞` for all `n`, the measure `(volume.restrict s).withDensity w` is
  an orthogonality measure (`isOrthogonalityMeasure_withDensity`); this covers finite and infinite
  intervals `(a, b)`;
- **countable sets** (DLMF 18.2.2, 18.2.4): for an infinite set `X ⊆ ℝ` and weights `w_x > 0` with
  `Σ_x |x|ⁿ w_x < ∞` for all `n`, the measure `Σ_{x∈X} w_x δ_x` is an orthogonality measure
  (`isOrthogonalityMeasure_sum_dirac`), and its pairing is `Σ_x p(x) q(x) w_x`; for a finite `X`
  of `N + 1` points the support has `N + 1` points (DLMF 18.2.3);
- **Lebesgue–Stieltjes measures** (DLMF 18.2.4_5): for a bounded `StieltjesFunction` `α`, the
  support of `α.measure` is the set of points of increase of `α`, so `α.measure` is an
  orthogonality measure exactly when `α` has infinitely many points of increase and finite moments.

*Needs:* Mathlib `Measure.support`, `withDensity`, `Measure.sum`, `StieltjesFunction.measure`.

**Checks.**
- `volume.restrict (Icc (−1) 1)` (Legendre) and the Gaussian measure (Hermite) are orthogonality
  measures; `Σ_{k≥0} e^{−1}/k! δ_k` (Charlier with `a = 1`) is one.
- `δ₀ + δ₁` has a support of 2 points: `pairing μ q q > 0` for `deg q ≤ 1`, `q ≠ 0`, but
  `q = X(X − 1)` has `pairing μ q q = 0`.

### 2.2 The monic orthogonal polynomials

Define `monic μ n` by Gram–Schmidt (see [Conventions](#conventions)). For every `μ` and `n`,
`monic μ n` is monic of degree `n` (`monic_monic`), by strong induction on `n`. For `μ` with finite
moments and `(n : ℕ∞) < μ.support.encard`:
- it is orthogonal to every polynomial of lower degree (`pairing_monic_eq_zero`);
- it is the only monic polynomial of degree `n` with this property (`eq_monic`), which is the
  uniqueness statement of DLMF §18.2(iii);
- if `μ.support` has exactly `N + 1` points, `monic μ (N + 1)` is `∏_{x ∈ supp μ} (X − x)` and so
  vanishes on the support (`eval_monic_eq_zero_of_mem_support`; DLMF §18.2(iv), Remarks).

*Needs:* 2.1.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `monic μ 2 = X² − 1/3`, `monic μ 3 = X³ − 3X/5`.
- `δ₀ + δ₁`: `monic μ 1 = X − 1/2`, `monic μ 2 = X² − X`.

### 2.3 Systems, constants and standardizations

Define `IsOrthogonal μ p` and, for a system `p`, `normSq μ p n = h_n`, `normSqX μ p n = h̃_n`,
`subNextCoeff`, and `orthonormal μ n`. For an orthogonality measure `μ`:
- `IsOrthogonal μ p ↔ ∀ n, ∃ c ≠ 0, p n = c · monic μ n` (`isOrthogonal_iff`);
- DLMF 18.2.5–18.2.5_5: `pairing μ (p m) (p n) = h_n δ_{mn}` with `h_n > 0`, and the same with
  sums for point masses;
- DLMF 18.2.6–18.2.7: `h̃_n = ∫ x p_n² dμ` and the expansion
  `p_n = k_n xⁿ + k̃_n x^{n−1} + k̃̃_n x^{n−2} + ⋯`, with `k̃₀ = 0` and `k̃̃₀ = k̃̃₁ = 0`;
- the monic standardization (`k_n = 1`) is `monic μ`, and the orthonormal standardization
  (`h_n = 1`, `k_n > 0`) is `orthonormal μ` (`orthonormal_spec`);
- the finite expansion `q = Σ_{k ≤ deg q} (⟨q, p_k⟩/h_k) p_k` of every polynomial
  (`eq_sum_pairing`), and the orthogonality of `p_n` to every polynomial of degree `< n`.

*Needs:* 2.2.

**Checks.**
- Lebesgue measure on `[−1, 1]` with Legendre's `P_n` (`P₂ = (3X² − 1)/2`): `h₂ = 2/5`,
  `k₂ = 3/2`, `k̃₂ = 0`, `k̃̃₂ = −1/2`.
- Lebesgue measure on `[−1, 1]`: `orthonormal μ 0 = 1/√2` and `orthonormal μ 1 = √(3/2) X`.
- The monomials `p n = Xⁿ` are not `IsOrthogonal` for Lebesgue measure on `[−1, 1]`:
  `pairing μ 1 X² = 2/3 ≠ 0`.

### Examples

- Charlier with `a = 1` (`Σ_k e^{−1}/k! δ_k`): `monic μ 1 = X − 1`, since the mean is `1`.

### Dependencies

Mathlib only.

## Layer 3: recurrence relations

### 3.1 The recurrence polynomials

Define `Polynomial.monicThreeTerm α β` over a commutative ring. Targets: it is monic of degree `n`
over a nontrivial ring (`monicThreeTerm_monic`); it commutes with ring homomorphisms applied to
`α`, `β`; and `(monicThreeTerm α β n).eval x` satisfies the scalar recurrence.

*Needs:* Mathlib.

**Checks.**
- `α = 0`, `β = 1/4`: `monicThreeTerm α β n = 2^{−n} U_n` for Mathlib's `Polynomial.Chebyshev.U`.
- `n = 2`: `(X − α₁)(X − α₀) − β₁`.
- `α = 0`, `β_k = k`: `monicThreeTerm α β 2 = X² − 1 = He₂`; indexing `β` from `β₀ = 0` in the
  step to `p₂` would give `X²`.

### 3.2 The second form

Define `a_n = recA p n = k_n/k_{n+1}`, `b_n = recB μ p n = h̃_n/h_n` and `c_n = recC μ p n`
(`c₀ = 0`, `c_n = a_{n−1} h_n/h_{n−1}`). For an orthogonal system `p`:
- DLMF 18.2.10: `x p₀ = a₀ p₁ + b₀ p₀` and
  `x p_{n+1} = a_{n+1} p_{n+2} + b_{n+1} p_{n+1} + c_{n+1} p_n`
  (`X_mul_eq_recurrence`);
- DLMF 18.2.11: the coefficient forms `b_n = k̃_n/k_n − k̃_{n+1}/k_{n+1}` (`recB_eq_coeff`) and
  `c_n = (k̃̃_n − a_n k̃̃_{n+1} − b_n k̃_n)/k_{n−1}` for `n ≥ 1`;
- DLMF 18.2.11_1, **with the sign corrected**: `Σ_{j=0}^{n} b_j = −k̃_{n+1}/k_{n+1}` (`sum_recB`).
  The printed identity has `+`; telescoping `b_j = k̃_j/k_j − k̃_{j+1}/k_{j+1}` with `k̃₀ = 0`
  gives the minus sign;
- DLMF 18.2.11_2: `a_{n−1} c_n > 0` for `n ≥ 1` (`recA_mul_recC_pos`);
- the system is orthonormal iff `h₀ = 1` and `c_n = a_{n−1}` for `n ≥ 1`, and monic iff `k₀ = 1` and
  `a_n = 1` for all `n`.

Route: expand `x p_n` in the finite expansion of 2.3; orthogonality kills all but three terms;
compare the top two coefficients and pair with `p_n`, `p_{n−1}`.

*Needs:* 2.3.

**Checks.**
- The Hermite weight `e^{−x²/2}` with Mathlib's `He_n`: `a_n = 1`, `b_n = 0`, `c_n = n`.
- The weight `eˣ` on `[0, 1]` (monic): `b₀ = 0.58197670…` and `k̃₁/k₁ = −0.58197670…`, which
  confirms the corrected sign of 18.2.11_1.
- At `n = 0` the second form has no `p_{−1}` term: for Hermite, `x · 1 = He₁`.

### 3.3 The first form

With `A_n = a_n⁻¹`, `B_n = −a_n⁻¹ b_n`, `C_n = a_n⁻¹ c_n` (DLMF 18.2.11_3), and conversely:
- DLMF 18.2.8: `p₁ = (A₀ x + B₀) p₀` and `p_{n+2} = (A_{n+1} x + B_{n+1}) p_{n+1} − C_{n+1} p_n`;
- DLMF 18.2.9: `A_n = k_{n+1}/k_n`, `B_n = (k̃_{n+1}/k_{n+1} − k̃_n/k_n) A_n = −(h̃_n/h_n) A_n`,
  `C_n = (A_n k̃̃_n + B_n k̃_n − k̃̃_{n+1})/k_{n−1} = (A_n/A_{n−1}) h_n/h_{n−1}` for `n ≥ 1`;
- DLMF 18.2.9_5: `A_{n−1} A_n C_n > 0` for `n ≥ 1`;
- the orthonormal and monic criteria of DLMF §18.2(iv) in this form.

*Needs:* 3.2.

**Checks.**
- Legendre: `A_n = (2n + 1)/(n + 1)`, `B_n = 0`, `C_n = n/(n + 1)`.
- Hermite `He_n`: `A_n = 1`, `B_n = 0`, `C_n = n`.

### 3.4 The monic and orthonormal forms

Define `alpha μ n = b_n` and `beta μ n = h_n/h_{n−1}` (`beta μ 0 = 0`) for `p = monic μ`
(DLMF 18.2.11_4). For an orthogonality measure:
- DLMF 18.2.11_5–18.2.11_6: `monic μ = monicThreeTerm (alpha μ) (beta μ)` and `β_n > 0` for
  `n ≥ 1` (`monic_eq_monicThreeTerm`);
- DLMF 18.2.11_7–18.2.11_8: `q_n = p_n/√h_n` is `orthonormal μ n`, with
  `x q_{n+1} = √β_{n+2} q_{n+2} + α_{n+1} q_{n+1} + √β_{n+1} q_n`, `q₁ = (x − α₀)/√(h₀ β₁)` and
  `q₀ = 1/√h₀` (`X_mul_orthonormal`);
- comparison with RandomMatrices §8.2: the class of `orthonormal μ n` in `L²(μ)` is
  `InnerProductSpace.gramSchmidtNormed ℝ (fun k ↦ xᵏ) n`, the `n`-th Gram–Schmidt orthonormalization
  of the monomials (`orthonormal_eq_gramSchmidtNormed`); for `μ = w(x) dx` this is the `n`-th
  orthonormal polynomial of RandomMatrices §8.2.

*Needs:* 3.2; Mathlib `InnerProductSpace.gramSchmidtNormed`.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `α_n = 0`, `β_n = n²/(4n² − 1)`, `h₀ = 2`.
- The standard Gaussian measure: `α_n = 0`, `β_n = n`, `h₀ = 1`.
- `beta μ 0 = 0` is never used as `h₀/h_{−1}`: `q₁` uses `h₀ β₁`, which for Lebesgue measure on
  `[−1, 1]` is `2 · 1/3 = 2/3 = h₁`.

### 3.5 The Jacobi matrix

Define `jacobiMatrix a b c n` (DLMF 18.2.18). Targets:
- over any commutative ring, `charpoly (J_n) = monicThreeTerm b (k ↦ a_{k−1} c_k) n`
  (`charpoly_jacobiMatrix`);
- for an orthogonal system with the coefficients of 3.2, `p_n = k_n · charpoly (J_n)`;
- DLMF 18.2.11_9, truncated: with `v(x) = (p₀(x), …, p_{n−1}(x))`,
  `J_n v(x) = x v(x) − a_{n−1} p_n(x) e_{n−1}`, so each zero of `p_n` gives an eigenvector;
- `J_n` is symmetric iff `c_k = a_{k−1}` for `1 ≤ k < n`; for the orthonormal system it is the
  symmetric matrix with diagonal `α_k` and off-diagonal `√β_k`.

Route: expansion of the determinant along the last row (`Matrix.det_succ_row`).

*Needs:* 3.1–3.4.

**Checks.**
- `n = 2`: `charpoly = (X − b₀)(X − b₁) − a₀ c₁`.
- `n = 2`: `J₂ (p₀, p₁)ᵀ = x (p₀, p₁)ᵀ − a₁ p₂ e₁`. For the transpose (`a_i` at `(i + 1, i)`, `c_i`
  at `(i − 1, i)`) the first row reads `b₀ p₀ + c₁ p₁`, which equals `x p₀` only if `c₁ = a₀`.
- `n = 1`: `charpoly = X − b₀`, which is `p₁/k₁`.

### Examples

- The standard Gaussian measure: `monic μ = He`, and `X He₂ = He₃ + 2 He₁`.

### Dependencies

Layer 2.

## Layer 4: the Christoffel–Darboux formula and kernels

### 4.1 The Christoffel–Darboux formula

Define `cdKernel μ p n x y = K_n(x, y) = Σ_{ℓ ≤ n} p_ℓ(x) p_ℓ(y)/h_ℓ` (independent of the
standardization of `p`). For an orthogonal system:
- DLMF 18.2.12: for `x ≠ y`,
  `K_n(x, y) = (k_n/(h_n k_{n+1})) (p_{n+1}(x) p_n(y) − p_n(x) p_{n+1}(y))/(x − y)` (`cdKernel_eq`);
- DLMF 18.2.13: `K_n(x, x) = (k_n/(h_n k_{n+1})) (p′_{n+1}(x) p_n(x) − p′_n(x) p_{n+1}(x))`
  (`cdKernel_self`), and hence `p′_{n+1} p_n − p′_n p_{n+1} > 0` on `ℝ` when `k_n/k_{n+1} > 0`.

Route: multiply the recurrence of 3.2 at `x` by `p_n(y)` and at `y` by `p_n(x)`, subtract and
telescope; the confluent form by letting `y → x`.

*Needs:* 3.2.

**Checks.**
- Lebesgue measure on `[−1, 1]`, monic, `n = 3`, `x = 0.3`, `y = −0.7`: both sides of 18.2.12 are
  `−0.287146875`.
- `n = 0`: `K₀ = k₀²/h₀`, and the right side is `(k₀/(h₀k₁)) · k₁ k₀`.
- Legendre `P_n`, `n = 1`: `K₁(x, y) = (1 + 3xy)/2` on both sides, with `k₁/(h₁k₂) = 1`; the
  inverted ratio `k₂/(h₁k₁) = 9/4` would give `9/4` times that.

### 4.2 The kernel property

DLMF 18.2.12_5: for a polynomial `q` of degree `≤ n`, `∫ q(y) K_n(x, y) dμ(y) = q(x)`
(`integral_mul_cdKernel_of_natDegree_le`); for `f ∈ L²(μ)` with `∫ f p_ℓ dμ = 0` for `ℓ ≤ n`,
`∫ f(y) K_n(x, y) dμ(y) = 0` (`integral_mul_cdKernel_of_orthogonal`). So
`f ↦ ∫ f(y) K_n(·, y) dμ(y)` is the orthogonal projection of `L²(μ)` onto the polynomials of
degree `≤ n`.

*Needs:* 2.3.

**Checks.**
- `n = 0`: `K₀ = 1/μ(ℝ)`, and the projection of `f` is its mean.

### 4.3 The Poisson kernel

Define `poissonKernel μ p z x y = Σ_n (p_n(x) p_n(y)/h_n) zⁿ` for `z ∈ ℂ` (DLMF 18.2.41). Target:
when `Σ_n |z|ⁿ ∫ |p_n(x) p_n(y) p_m(y)|/h_n dμ(y) < ∞`,
`∫ P_z(x, y) p_m(y) dμ(y) = z^m p_m(x)` (`integral_poissonKernel_mul`); and when the series
converges in `L²(μ)` in `y`, its sum is the function whose `n`-th expansion coefficient (2.3) is
`zⁿ p_n(x)/h_n`.

*Needs:* 2.3.

**Checks.**
- Lebesgue measure on `[−1, 1]` with Legendre `P_n`: `|P_n| ≤ 1` and `h_n = 2/(2n + 1)` give the
  hypothesis for every `|z| < 1`.
- `z = 0`: `P₀(x, y) = k₀²/h₀` and `∫ P₀(x, y) p_m(y) dμ(y) = k₀ δ_{m0} = 0^m p_m(x)`, with
  `0⁰ = 1`.
- The standard Gaussian measure with `He_n`: `P_z(x, y)` is Mehler's kernel
  `(1 − z²)^{−1/2} exp((2xyz − (x² + y²)z²)/(2(1 − z²)))`; at `(x, y, z) = (0.3, −0.7, 0.4)` both
  are `0.9342031102`.

### Examples

- The standard Gaussian measure, `n = 1`: `K₁(x, y) = 1 + xy`, and
  `(He₂(x) He₁(y) − He₁(x) He₂(y))/(x − y) = 1 + xy`.

### Dependencies

Layers 2–3.

## Layer 5: zeros, Gauss quadrature and kernel polynomials

### 5.1 Reality, simplicity and location

Define `zeros μ n i`, the `i`-th smallest root of `monic μ n`. For an orthogonality measure:
- the zeros are real and simple: `zeros μ n` is strictly increasing, each is a root, and
  `monic μ n = ∏_i (X − x_i)` (DLMF 18.2.19; `zeros_spec`);
- if `μ` is concentrated on `[a, b]` then every zero lies in `(a, b)` (`zeros_mem_Ioo`); in
  general the zeros lie in the interior of the convex hull of `supp μ`.

Route: if `p_n` changed sign at fewer than `n` points of the hull, the product of `p_n` with the
polynomial vanishing at those points would have constant sign and zero integral. DLMF §18.2(vi)
cites Andrews, Askey and Roy (1999), Theorems 5.4.2 and 5.4.3.

*Needs:* 2.3.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `zeros μ 2 = (−1/√3, 1/√3)`.
- The weight `eˣ` on `[0, 1]`: `zeros μ 1 = (1/(e − 1)) = (0.58197670…)`, the mean of `μ/μ(ℝ)`.
- `δ₀ + δ₁` is not an orthogonality measure: `monic μ 2 = X² − X` has the zeros `0, 1`, on the
  support and not in `(0, 1)`.

### 5.2 Gauss quadrature and the Christoffel numbers

Define `christoffelNumber μ n i = w_i = ∫ p_n(x)/((x − x_i) p′_n(x_i)) dμ(x)` (DLMF 18.2.37, the
integrand being the polynomial `p_n /ₘ (X − x_i)` divided by `p′_n(x_i)`), and
`gaussMeasure μ n = Σ_i w_i δ_{x_i}`. For an orthogonality measure:
- `w_i > 0`, and `∫ q dμ = Σ_i w_i q(x_i)` for every `q` of degree `≤ 2n − 1`
  (`gauss_quadrature`); the formula fails for `q = p_n²`;
- `w_i = 1/K_{n−1}(x_i, x_i)` for the monic kernel (`christoffelNumber_eq`), and `Σ_i w_i = μ(ℝ)`;
- if `μ` is concentrated on `[a, b]`, so is `gaussMeasure μ n`.

Route: Lagrange interpolation at the zeros (`Lagrange.basis`) and division of `q` by `p_n`; see
Szegő (1975), §3.4, and DLMF §3.5(v) (the Christoffel numbers are DLMF 3.5.18).

*Needs:* 4.1, 5.1.

**Checks.**
- Lebesgue on `[−1, 1]`, `n = 2`: nodes `±1/√3`, weights `1, 1`.
- The weight `eˣ` on `[0, 1]`, `n = 4`: the weights `0.20695352, 0.48117108, 0.6261768, 0.40398043`
  equal `1/K₃(x_i, x_i)`; `∫ x⁷ eˣ dx = 0.30549003693` is reproduced, `∫ x⁸ eˣ dx` is not.
- Mathlib's Chebyshev–Gauss formula (`Polynomial.Chebyshev.integral_eq_sumZeroes`) is the case
  `μ = measureT`, with all weights `π/n`.

### 5.3 Interlacing

- The zeros of `p_n` and `p_{n+1}` strictly interlace:
  `x_i^{(n+1)} < x_i^{(n)} < x_{i+1}^{(n+1)}` (`zeros_interlace`).
- For `m < n`, between two zeros of `p_m` there is a zero of `p_n` (`exists_zero_between`).

Route: the sign of `p′_{n+1} p_n − p′_n p_{n+1}` (4.1) at consecutive zeros; for `m < n`, the
classical argument from orthogonality and Gauss quadrature (Szegő, §3.3).

*Needs:* 4.1, 5.1, 5.2.

**Checks.**
- Lebesgue measure on `[−1, 1]`: zeros of `P₂` are `±0.5773…`, of `P₃` are `0, ±0.7745…`.

### 5.4 The Jacobi matrix and the zeros

DLMF 18.2.18: the zeros of `p_n` are the eigenvalues of `J_n`. With the symmetric (orthonormal)
Jacobi matrix, `hA.charpoly_eq` and 3.5 give the multiset of eigenvalues of `J_n` equal to the
roots of `monic μ n`, and `zeros μ n` is the increasing enumeration of `hA.eigenvalues`.

*Needs:* 3.5, 5.1, Mathlib `Matrix.IsHermitian.charpoly_eq`.

**Checks.**
- `n = 2`, Lebesgue on `[−1, 1]`: `J₂ = ((0, 1/√3), (1/√3, 0))` has eigenvalues `±1/√3`.

### 5.5 The discriminant

Auxiliary: for a field `K`, `c ≠ 0` and `x : Fin n → K`,
`disc(c ∏ (X − x_i)) = c^{2n−2} ∏_{i<j} (x_i − x_j)²` for Mathlib's `Polynomial.discr`
(`discr_eq_prod`), from `Polynomial.resultant_eq_prod_roots_sub`. Then DLMF 18.2.20:
`disc(p_n) = k_n^{2n−2} ∏_{i<j} (x_i − x_j)² > 0` (`discr_pos`).

*Needs:* 5.1, Mathlib `Polynomial.discr`.

**Checks.**
- `disc(He_n) = ∏_{j=1}^{n} j^j` for Mathlib's `He_n`: `4, 108, 27648, 86400000` for
  `n = 2, 3, 4, 5`; `n = 2` agrees with `Polynomial.discr_of_degree_eq_two`.

### 5.6 Kernel polynomials

Define `kernelPolynomial μ p y n = q_n(·; y) = Σ_{ℓ ≤ n} (p_ℓ(y)/h_ℓ) p_ℓ` (DLMF 18.2.14). For an
orthogonality measure, an orthogonal system and `y` with `x ≤ y` for `μ`-a.e. `x` (or `y ≤ x` for
`μ`-a.e. `x`):
- `|y − x| dμ(x)` is an orthogonality measure and `q_n(·; y)` is an orthogonal system for it
  (DLMF 18.2.15; `isOrthogonal_kernelPolynomial`);
- DLMF 18.2.16: `q_n − q_{n−1} = (p_n(y)/h_n) p_n` for `n ≥ 1`;
- DLMF 18.2.17: `p_n(y) p_{n+1}(x) − p_{n+1}(y) p_n(x) = (h_n k_{n+1}/k_n)(x − y) q_n(x)`, for
  every `y` (`kernelPolynomial_mul_sub`).

*Needs:* 4.1, 5.1 (for `p_n(y) ≠ 0`).

**Checks.**
- Lebesgue measure on `[−1, 1]`, `y = 1`:
  `∫ q_m q_n (1 − x) dx = 0` for `(m, n) = (1, 2), (0, 3), (2, 4)`;
  the `q_n(·; 1)` are multiples of the Jacobi polynomials `P_n^{(1,0)}`.
- `n = 0`: `q₀(·; y) = p₀(y) p₀/h₀ = k₀²/h₀`.
- The side condition on `y` is needed: for Lebesgue measure on `[−1, 1]` and `y = 0`,
  `q₁(·; 0) = P₀/h₀ + P₁(0) P₁/h₁ = ½` has degree `0`, not `1`.

### Examples

- The standard Gaussian measure, `n = 2`: nodes `±1`, weights `½, ½`; `∫ x² dμ = 1 = ½ + ½`, while
  `∫ x⁴ dμ = 3 ≠ 1` (degree `2n`).

### Dependencies

Layers 2–4.

## Layer 6: symmetry and quadratic transformations

### 6.1 Parity and the quadratic transformations

Let `μ` be an orthogonality measure invariant under `x ↦ −x` (an even weight in DLMF):
- DLMF 18.2.21: `p_n(−x) = (−1)ⁿ p_n(x)` for `p_n = monic μ n` (`monic_comp_neg`), and for every
  orthogonal system.
- DLMF 18.2.22, measure form: `monic μ (2n) = r_n(X²)` and `monic μ (2n + 1) = X s_n(X²)`, where
  `r_n = monic (μ.map (x ↦ x²)) n` and `s_n = monic ((x² μ).map (x ↦ x²)) n` (`monic_even_odd`).
  For `μ = w(x) dx` on `ℝ` with `v(x²) = w(x)`, `μ.map (x ↦ x²) = x^{−1/2} v(x) dx` and
  `(x² μ).map (x ↦ x²) = x^{1/2} v(x) dx` on `(0, ∞)`, which is DLMF's statement.
- DLMF 18.2.23, measure form: for every even orthogonality measure `μ`,
  `monic μ (2n) = r_n(2X² − 1)` and `monic μ (2n + 1) = X s_n(2X² − 1)` with
  `r_n = 2^{−n} monic (μ.map (x ↦ 2x² − 1)) n` and
  `s_n = 2^{−n} monic ((x² μ).map (x ↦ 2x² − 1)) n` (`monic_even_odd_two_sq_sub_one`). For
  `μ = w(x) dx` on `(−1, 1)` with `v(2x² − 1) = w(x)`, the two image measures are constant
  multiples of `(1 + x)^{−1/2} v(x) dx` and `(1 + x)^{1/2} v(x) dx`, which is DLMF's statement. No
  support condition is needed: `2t − 1` is affine in `t = x²`, so the statement is 18.2.22
  composed with an affine change of variable.

Route: parity from uniqueness (2.2); the even and odd parts are orthogonal by the change of
variables `t = x²` (or `t = 2x² − 1`) in the pairing.

*Needs:* 2.2–2.3, 3.4 (`α_n = 0` for even `μ`).

**Checks.**
- The weight `e^{−x⁴}` on `ℝ`: `α_n = 0`, and `r₁, r₂` are orthogonal for `t^{−1/2} e^{−t²}` on
  `(0, ∞)`, `s₀, s₂` for `t^{1/2} e^{−t²}`.
- The weight `(1 − x²)^{0.3}(1 + x²)` on `(−1, 1)`: `r₁, r₂` orthogonal for `(1 + t)^{−1/2} v(t)`.
- `He_{2n}(x) = (−2)ⁿ n! L_n^{(−1/2)}(x²/2)`: the Laguerre case of 18.2.22.

### Examples

- Lebesgue measure on `[−1, 1]`: `μ.map (x ↦ x²)` is `t^{−1/2} dt` on `(0, 1)`, with mean `1/3`,
  so `r₁ = X − 1/3` and `monic μ 2 = X² − 1/3 = r₁(X²)`.

### Dependencies

Layers 2–3.

## Layer 7: moments and Hankel determinants

### 7.1 Hankel determinants

Define `hankelDet m n = Δ_n` and `hankelDet' m n = Δ′_n` for a sequence `m` (DLMF 18.2.27–18.2.28).
For an orthogonality measure `μ` and its moments `μ_n = moment μ n` (DLMF 18.2.26):
- `Δ_n > 0` for all `n` (`hankelDet_pos`); more generally `Δ_n > 0` iff `n ≤ |supp μ|`;
- `Δ_n = ∏_{k<n} h_k` for the monic system, so `h_n = Δ_{n+1}/Δ_n` (`normSq_monic_eq`);
- DLMF 18.2.29: `p_n(x) = Δ_n⁻¹ det(…)`, the determinant with rows `(μ_i, …, μ_{i+n})` for
  `i < n` and last row `(1, x, …, xⁿ)` (`eval_monic_eq_det`);
- DLMF 18.2.30: `α_n = Δ′_{n+1}/Δ_{n+1} − Δ′_n/Δ_n` and `β_n = Δ_{n+1} Δ_{n−1}/Δ_n²`
  (`alpha_beta_eq_hankel`);
- `k̃_n = −Δ′_n/Δ_n` for the monic system, linking 18.2.30 to 18.2.11_1.

Route: the Gram matrix of `1, x, …, x^{n−1}` is the Hankel matrix; Gram–Schmidt is `LDLᵀ`
factorization; for 18.2.29, the determinant is monic up to `Δ_n` and orthogonal to `x^k` for `k < n`
because two rows coincide.

*Needs:* 2.2–2.3, 3.4.

**Checks.**
- The Gaussian moments `1, 0, 1, 0, 3, …`: `Δ₃ = 0!·1!·2! = 2`.
- `hankelDet m 0 = 1` and `hankelDet' m 1 = m₁` for every `m`.
- `δ₀ + δ₁` (moments `2, 1, 1, 1, …`): `Δ₁ = 2`, `Δ₂ = 1`, and `Δ₃ = 0` because two rows agree; a
  support of two points stops the positivity at `n = 2`.
- The weight `eˣ` on `[0, 1]`: `h_n = Δ_{n+1}/Δ_n` (`1.718281828, 0.1363051216, 0.009148349372`),
  `α_n` and `β_n` from 18.2.30 agree with the recurrence (`α₁ = 0.4848434409`,
  `β₁ = 0.079326406`), and 18.2.29 at `x = 0.37`, `n = 3` gives `0.0212364801576`.

### Examples

- Lebesgue measure on `[−1, 1]`: moments `2, 0, 2/3`, `Δ₁ = 2`, `Δ₂ = 4/3`, and
  `h₁ = Δ₂/Δ₁ = 2/3`.

### Dependencies

Layers 2–3.

## Layer 8: Favard's theorem, uniqueness and completeness

### 8.1 The functional of a recurrence and its Gauss measures

Given `α : ℕ → ℝ` and `β` with `β_{n+1} > 0`, let `p_n = monicThreeTerm α β n`. Targets:
- the linear functional `L : ℝ[X] → ℝ` that sends `q` to its coefficient on `p₀` in the basis
  `(p_n)` (`Polynomial.Sequence.basis`) satisfies `L(p_m p_n) = δ_{mn} β₁ ⋯ β_n`, and `L(q²) > 0`
  for `q ≠ 0`;
- the zeros of `p_n` are real and simple (they are the eigenvalues of the symmetric matrix with
  diagonal `α_k` and off-diagonal `√β_k`, 3.5);
- there are positive weights `w_i^{(n)}` with `Σ_i w_i^{(n)} q(x_i^{(n)}) = L(q)` for
  `deg q ≤ 2n − 1`
  (the weight is the squared first component of the normalized eigenvector).

*Needs:* 3.1, 3.5, Mathlib `Matrix.IsHermitian.eigenvalues`.

**Checks.**
- `α = 0`, `β = 1/4`: `L(q) = (2/π) ∫_{−1}^{1} q(x) √(1 − x²) dx`.
- `α = 0`, `β = 1/4`: `L(p₂²) = β₁β₂ = 1/16`.
- `n = 1`: the single node is `α₀` with weight `L(1) = 1`; `L` is normalized by `L(p₀) = 1`, so a
  measure with `μ(ℝ) ≠ 1` represents `μ(ℝ) L`.

### 8.2 Favard's theorem

DLMF §18.2(viii): for every `α` and every `β` with `β_{n+1} > 0` there is a probability
orthogonality measure `μ` with `monic μ = monicThreeTerm α β` (`favard`). The same holds for each
of the other formula pairs of DLMF §18.2(viii): a system satisfying 18.2.8 with 18.2.9_5, or
18.2.10 with 18.2.11_2, or 18.2.11_8 with 18.2.11_6, is orthogonal for some orthogonality measure.

Route: the Gauss measures `ν_n` of 8.1 have `∫ x² dν_n = L(x²)` for `n ≥ 2`, so they are tight;
Prokhorov's theorem (`isCompact_closure_of_isTightMeasureSet`) gives a weakly convergent
subsequence; since `∫ x^{2k} dν_n = L(x^{2k})` is bounded in `n`, the moments converge (auxiliary:
weak convergence plus uniformly bounded higher moments gives convergence of lower moments), so the
limit `μ` has `∫ q dμ = L(q)` for all `q`; `L(q²) > 0` gives an infinite support. This is the
representation of the functional by a measure; DLMF §18.2(iv) cites Favard's theorem from
Chihara (1978), p. 21, and Szegő (1975), §3.2.

*Needs:* 8.1, 2.2, Mathlib Prokhorov.

**Checks.**
- `α = 0`, `β = 1/4`: `μ = (2/π) √(1 − x²) dx`, `∫ p₂ p₃ dμ = 0`, `∫ p₂² dμ = 1/16 = β₁β₂`.

### 8.3 Hamburger's theorem

For `m : ℕ → ℝ`: `Δ_n(m) > 0` for every `n` iff `m` is the moment sequence of an orthogonality
measure (`exists_measure_iff_hankelDet_pos`).

Route: `⇐` is 7; `⇒` defines `β_n`, `α_n` by 18.2.30, checks that `monicThreeTerm α β` is
orthogonal for the functional with moments `m`, and applies 8.2.

*Needs:* Layer 7, 8.2.

**Checks.**
- `m = (1, 0, 1, 0, 3, 0, 15, …)` (the Gaussian moments) has `Δ_n = ∏_{k<n} k!`.
- The moments `2, 1, 1, 1, …` of `δ₀ + δ₁` have `Δ₃ = 0`, matching its finite support.

### 8.4 Uniqueness

- Auxiliary: a finite measure `ν` with `∫ x^{2k} dν ≤ C M^{2k}` for all `k` is concentrated on
  `[−M, M]`.
- Bounded coefficients: if `|α_n| ≤ A` and `0 < β_{n+1} ≤ B²`, the Favard measure is concentrated on
  `[−(A + 2B), A + 2B]` (Gershgorin for the symmetric Jacobi matrices, Mathlib
  `eigenvalue_mem_ball`, then 8.2) and is the only probability orthogonality measure with
  `monic μ = monicThreeTerm α β` (`favard_bounded`).
- DLMF §18.2(viii): if `μ` is concentrated on a bounded interval and `ν` is an orthogonality measure
  with `monic ν = monic μ`, then `ν = (ν(ℝ)/μ(ℝ)) μ` (`eq_smul_of_monic_eq`).

Route: equal monic polynomials give proportional moments (7); the moments of `ν` then grow at most
like `M^{2k}`, so `ν` is concentrated on `[−M, M]`; two compactly supported measures with equal
moments are equal (`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`).

*Needs:* Layer 7, 8.2, Tau Ceti `Determinacy`, Mathlib `eigenvalue_mem_ball`.

**Checks.**
- `α = 0`, `β = 1/4`: `A + 2B = 1`, and the support is `[−1, 1]`.

### 8.5 Completeness and the orthogonal expansion

DLMF 18.2.24–18.2.25: let `μ` be an orthogonality measure with one finite exponential moment
`∫ e^{a|x|} dμ < ∞`, `a > 0` (in particular, `μ` concentrated on a bounded interval). Then the
orthonormal polynomials form a Hilbert basis of `L²(μ; 𝕜)` for `𝕜 = ℝ, ℂ`, whose `n`-th vector is
`orthonormal μ n` almost everywhere; for every `f ∈ L²(μ)`,
`f = Σ_n λ_n p_n` in `L²(μ)` with `λ_n = h_n⁻¹ ∫ f p_n dμ` for any orthogonal system `p`, and
`Σ_n h_n |λ_n|² = ‖f‖²` (`hasSum_orthonormal_expansion`).

Route: `TauCeti.hilbertBasisOfOrthogonalSystem` with weight `1` and the completeness input
`TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`.

*Needs:* 2.3, Tau Ceti `PolynomialCompleteness`, `WeightedOrthogonalBasis`.

**Checks.**
- The Gaussian measure: the basis is the normalized `He_n/√(n!)`, Tau Ceti's
  `gaussianHermiteHilbertBasis`.
- Lebesgue measure on `[−1, 1]`: the basis is `√((2n + 1)/2) P_n`.

### Examples

- `α = 0`, `β_n = n`: the Favard measure is the standard Gaussian; `β` is unbounded, so
  `favard_bounded` does not apply, while 8.5 does, by the exponential moment.

### Dependencies

Layers 2, 3, 7; Tau Ceti `Determinacy`, `PolynomialCompleteness`, `WeightedOrthogonalBasis`;
Mathlib Prokhorov.

## Layer 9: associated polynomials, continued fractions and Markov's theorem

### 9.1 Associated and corecursive polynomials

For `α`, `β` (here the monic coefficients `alpha μ`, `beta μ`):
- DLMF 18.2.31: the first associated polynomials
  `p_n^{(1)} = monicThreeTerm (α ∘ succ) (β ∘ succ) n`;
- DLMF 18.2.32: `corecursive α β (n + 1) = p_n^{(1)}`;
- DLMF 18.2.33: for `z ∈ ℂ` with `x ≠ z` for `μ`-a.e. `x`,
  `p_n^{(1)}(z) = μ₀⁻¹ ∫ (p_{n+1}(z) − p_{n+1}(x))/(z − x) dμ(x)` (`aeval_associated`);
- the Casoratian: `p_n p_n^{(1)} − p_{n+1} p_{n−1}^{(1)} = β₁ ⋯ β_n` for `n ≥ 1`, and the `n` zeros
  of `p_n^{(1)}` are real, simple and interlace with the `n + 1` zeros of `p_{n+1}`; the Casoratian
  by induction on `n` from the two recurrences;
- for `μ` concentrated on `[a, b]` and `k + j ≤ N`, the zeros of
  `q_j^{(k)} = monicThreeTerm (α ∘ (· + k)) (β ∘ (· + k)) j` are real and lie in `(a, b)`
  (`associated_roots_mem_Ioo`): they are the eigenvalues of the principal submatrix of the
  symmetric `J_N` (3.5) on the rows and columns `k, …, k + j − 1`, hence lie between the extreme
  eigenvalues of `J_N` (Rayleigh quotient), which are zeros of `p_N` (5.4) and lie in `(a, b)`
  (5.1).

*Needs:* 3.1, 3.4, 3.5, 5.1, 5.4.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: both sides of 18.2.33 agree for `n = 0, …, 3`
  (`n = 2`: `1.959431816 + 1.508836788 i`; `n = 3`: `2.088826217 + 3.212018515 i`).
- `corecursive α β 1 = 1` and `corecursive α β 2 = X − α₁ = p₁^{(1)}`.
- Casoratian at `n = 1`: `(X − α₀)(X − α₁) − ((X − α₁)(X − α₀) − β₁) · 1 = β₁`.

### 9.2 The J-fraction

Define `jFraction α β z` (DLMF 18.2.34). For an orthogonality measure concentrated on `[a, b]` and
`z ∈ ℂ \ [a, b]`, DLMF 18.2.35–18.2.36:
`F_{n+1}(z) = p_{n+1}^{(0)}(z)/p_{n+1}(z) = p_n^{(1)}(z)/p_{n+1}(z) = μ₀⁻¹ Σ_i w_i/(z − x_i)`, with
the Christoffel numbers and zeros of `p_{n+1}` (`convs'_jFraction`). Evaluating `convs'` from
the tail divides by `q_{j+1}^{(k)}(z)/q_j^{(k+1)}(z)`, where
`q_j^{(k)} = monicThreeTerm (α ∘ (· + k)) (β ∘ (· + k)) j`; these are nonzero off `[a, b]` by
the location of the zeros of the `q_j^{(k)}`, `k + j ≤ n + 1`, in 9.1 (with `N = n + 1`).

Route: Mathlib's continuant recurrence (`GenContFract.conts`) is the recurrence of 3.1 for the
numerators and denominators; the partial fraction is Gauss quadrature (5.2) applied to 18.2.33.
DLMF cites Chihara (1978), Chapter III, Theorem 4.3 for 18.2.35–18.2.36.

*Needs:* 5.2, 9.1.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: `F₄ = 0.6389990416 − 0.2410064077 i` by both the
  continued fraction and `p₃^{(1)}/p₄`.
- `F₀ = 0` and `F₁ = 1/(z − α₀)`.
- `F₂ = (z − α₁)/((z − α₀)(z − α₁) − β₁) = p₁^{(1)}/p₂`; with `β₁` entering with `+` instead of
  `−` (partial numerator `β₁`), the denominator would be `(z − α₀)(z − α₁) + β₁`, not `p₂(z)`.

### 9.3 Markov's theorem

DLMF 18.2.38: for an orthogonality measure concentrated on a bounded interval `[a, b]`,
`F_n(z) → μ₀⁻¹ ∫ dμ(x)/(z − x)` uniformly on compact subsets of `ℂ \ [a, b]` (`markov`). The
limit is `−μ₀⁻¹ · resolventTransform μ z`.

Route: by 9.2, `F_n(z) = μ₀⁻¹ ∫ (z − x)⁻¹ d(gaussMeasure μ n)(x)`; the Gauss measures are
concentrated on `[a, b]` and agree with `μ` on polynomials of degree `≤ 2n − 1`, so they converge
weakly to `μ` (Weierstrass, Mathlib `polynomialFunctions_closure_eq_top`), and `(z − x)⁻¹` is
continuous on `[a, b]` uniformly for `z` in a compact set off `[a, b]`.

*Needs:* 5.2, 9.2, Mathlib `polynomialFunctions_closure_eq_top`.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: `F₄ = 0.6389990416 − 0.2410064077 i` against the limit
  `0.6389985876 − 0.2410064428 i`.
- Lebesgue measure on `[−1, 1]`, `z = 2`: the limit is `½ log 3`.

### Examples

- Lebesgue measure on `[−1, 1]`, `z = 2`: `F₁ = ½`, `F₂ = 2/(11/3) = 6/11 = 0.5454…`, and the
  limit is `½ log 3 = 0.5493…`.

### Dependencies

Layers 3, 5.

## Layer 10: structure relations, Sheffer polynomials and monotonic weights

### 10.1 Semi-classical measures and structure relations

Define `IsSemiclassical μ π τ`: `π ≠ 0` and `∫ π q′ dμ = −∫ τ q dμ` for every polynomial `q` (the
Pearson equation `(π μ)′ = τ μ` in the sense of distributions). Let `d = deg π` and
`s = max(deg τ, d − 1)`. For an orthogonality measure:
- DLMF 18.2.44, the structure relation: `π p′_n = Σ_{j=n−s}^{n+d−1} a_{n,j} p_j`
  (`structure_relation`);
- the fixed-`π` form of DLMF 18.2.42–18.2.43, with polynomial coefficients on `p_n` and `p_{n±1}`
  (DLMF normalizes the second coefficient to a constant by letting `π_n` depend on `n`): there
  are polynomials `R_n`, `S_n`, `R̃_n`, `S̃_n` of degree `≤ max(d, deg τ)` with
  `π p′_{n+1} = R_n p_{n+1} + S_n p_n` and `π p′_n = R̃_n p_n + S̃_n p_{n+1}` (`lowering_raising`);
- weights: if `w ≥ 0` is differentiable on an open interval `(a, b)` (`−∞ ≤ a < b ≤ ∞`), with
  `(π w)′ = τ w` there, `x^k π(x) w(x) → 0` at both ends for every `k`, and `w` gives an
  orthogonality measure, then that measure is semi-classical for `(π, τ)`.

Route: `⟨π p′_n, p_j⟩ = −⟨p_n, τ p_j + π p′_j⟩` vanishes when `j + s < n`; for 18.2.42–18.2.43,
rewrite each `p_j` through the recurrence (3.4) as a polynomial combination of `p_n`, `p_{n+1}`
(or `p_n`, `p_{n−1}`).

*Needs:* 2.3, 3.4.

**Checks.**
- Hermite (`π = 1`, `τ = −x`): `He′_n = n He_{n−1}`.
- Laguerre weight `x^{1/2} e^{−x}` (`π = x`, `τ = 3/2 − x`): `x p′₄` has components only on
  `p₃` and `p₄` (`18` and `4` for the monic system).
- Freud weight `e^{−x⁴}` (`π = 1`, `τ = −4x³`, `s = 3`): `p′₅` has components only on `p₄` (`5`)
  and `p₂` (`0.755372`).

### 10.2 Sheffer polynomials

Define `derivativeAction v` and `IsSheffer p f u` (DLMF 18.2.45 with `c_n = 1`; see
[Conventions](#conventions)). Over a `ℚ`-algebra:
- DLMF 18.2.45 ⟺ 18.2.46: for `u` with `u(0) = 0`, `u′(0) = 1` and `v` its compositional inverse,
  `p` is Sheffer for some `f` with `f(0) = 1` iff `p₀ = 1`, `deg p_n = n` and
  `v(D) p_{n+1} = (n + 1) p_n` for all `n` (`isSheffer_iff`); and `v(D)` is a delta operator: it
  commutes with translations and `v(D) x` is a nonzero constant;
- Mathlib's Bernoulli polynomials are Sheffer with `u(t) = t` and `f(t) = Σ B_n tⁿ/n!`
  (`isSheffer_bernoulli`, from `Polynomial.bernoulli_generating_function`), and they are not
  orthogonal for any orthogonality measure (`not_isOrthogonal_bernoulli`);
- Mathlib's `He_n`, mapped to `ℚ[X]`, are Sheffer with `u(t) = t` and `f(t) = exp(−t²/2)`; the
  coefficients agree with Tau Ceti's analytic generating function
  `Polynomial.hasSum_hermite_generating_function`.

Route: `D` acts on `exp(x u(t))` as multiplication by `u(t)`, so `v(D)` acts as `v(u(t)) = t`.
Conversely, given `p`, put `f(t) = Σ_n p_n(0) tⁿ/n!` and let `s_n` be the polynomials generated by
`f(t) exp(x u(t))`; both `p` and `s` satisfy `v(D) q_{n+1} = (n + 1) q_n` and have the same values
at `0`, and `v(D)` lowers the degree by exactly one (`v₀ = 0`, `v₁ = 1`), so its kernel is the
constants and induction on `n` gives `p = s`. See Rota, Kahaner and Odlyzko (1973) for the
operator calculus.

*Needs:* Mathlib `PowerSeries.subst`, `PowerSeries.substInvOfIsUnit`; for the non-orthogonality,
3.4.

**Checks.**
- Bernoulli: a monic three-term recurrence through `B₀, …, B₃` forces `α_n = 1/2`, `β₁ = 1/12`,
  `β₂ = 1/6`, `β₃ = 1/4`, and then the constant term of `(x − ½) B₃ − ¼ B₂` is `−1/24`, while
  `B₄(0) = −1/30`.
- Hermite: `v(t) = t`, `v(D) = D`, and `He′_{n+1} = (n + 1) He_n`.
- Bernoulli: `v(D) = D`, and 18.2.46 is `B′_{n+1} = (n + 1) B_n`.

### 10.3 Monotonic weights

DLMF §18.2(xii), Szegő's Theorem 7.2: let `a < b` be finite and `w ≥ 0` nondecreasing on `[a, b]`,
giving an orthogonality measure `w(x) dx` on `[a, b]`. For every orthogonal system,
`√w(x) |p_n(x)| ≤ √w(b) |p_n(b)|` for `x ∈ [a, b]` (`sqrt_weight_mul_abs_le`). The mirror statement
holds for nonincreasing `w`, with the maximum at `a`.

Route: Szegő, §7.2.

*Needs:* 2.3, 5.2.

**Checks.**
- `w = eˣ` on `[0, 1]`, `w = (1 + x)²` on `[−1, 1]`, `w = √(x + 0.1)` on `[0, 2]`, `n = 1, …, 5`:
  the maximum over `[a, b]` is attained at `b`.
- `w = (1 + x)^β` on `[−1, 1]`, `β ≥ 0`: the Jacobi polynomials `P_n^{(0,β)}` attain
  `max |P_n^{(0,β)}| (1 + x)^{β/2} = 2^{β/2}` at `x = 1` (DLMF 18.14.3_5 at `α = 0`).

### Examples

- The Jacobi weight `(1 − x)^a (1 + x)^b`, `a, b > −1`, is semi-classical with `π = 1 − x²` and
  `τ = b − a − (a + b + 2)x`.

### Dependencies

Layers 2–3, 5.

## Downstream consumers

- The roadmaps for the classical orthogonal polynomials (DLMF §§18.3–18.18), the Askey scheme
  (§§18.19–18.26) and the other families (§§18.30–18.37) use every layer: the difference
  operators (Layer 1) for the Hahn and Wilson classes, the recurrence and Jacobi matrix (Layer 3)
  for the recurrence tables, the zeros and quadrature (Layer 5) for §18.16, the associated
  polynomials (Layer 9) for §18.30, and the Sheffer theory (10.2) for Meixner's classification.
- LaguerreJacobi defines the Laguerre, Jacobi and Gegenbauer polynomials and
  proves their orthogonality and `L²` bases; Layers 3–5 then give their recurrences, kernels, zeros
  and quadrature as instances.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap: the rest of DLMF §§18.1–18.2. It is recorded
only to fix the boundary. Contributors should not attempt it under this roadmap.

- **The Szegő class and the Nevai class** (DLMF 18.2.39–18.2.40), with Szegő's asymptotic formulas
  and equiconvergence theorem and the Blumenthal–Nevai theorem on the essential support. These need
  Szegő's theory on the unit circle (DLMF §18.33) and Weyl's theorem on compact perturbations,
  and belong with a roadmap for polynomials orthogonal on the unit circle.
- **M. Riesz's theorem** that an orthogonality measure that is the only one with its moments gives
  a complete system, and the indeterminate moment problem (Nevanlinna parametrization, extremal
  measures). These rest on the spectral theory of unbounded Jacobi operators.
- **Meixner's classification** of the orthogonal Sheffer polynomials (DLMF §18.2(xii)): it needs
  the Hahn-class families of §18.19, and belongs with the Askey scheme.
- **The nonnegativity of Poisson kernels** (Ismail, Theorem 4.7.12) and the **converse of the
  structure relation** (a system with a structure relation is semi-classical in the Pearson sense
  of 10.1).
- **The Euler polynomials** `E_n` as a Sheffer system that is not orthogonal (§18.2(xii)), which
  needs the Euler polynomials of DLMF §24.2; neither Mathlib nor Tau Ceti has them.
- **The `q`-Pochhammer symbols and infinite `q`-products** of §18.1(i), which belong with the
  basic hypergeometric functions of DLMF Chapter 17.
- **Sections with nothing to formalize**: the notation lists of §18.1(ii)–(iii) and the remarks
  of §18.2(ii).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes DLMF on top
of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes). Its directory
`DLMF/OrthogonalPolynomials/` provides source material for Layers 2–5, 7, 9 and 10: the predicate
`IsOrthogonalPolynomials` for a measure, the three-term recurrence and Christoffel–Darboux formula,
Gauss quadrature, the zeros and interlacing, the kernel property and kernel polynomials, the
moments, Hankel determinants and the determinant formulas 18.2.29–18.2.30, the corrected 18.2.11_1,
the discriminant, and the continued fractions of the classical families. Favard's theorem is
stated there without proof; the quadratic transformations, Markov's theorem and the Sheffer
equivalence are not stated there.

Closed, unmerged Mathlib pull requests are prior art: #38496 (an algebraic Favard theorem for a
linear functional), #38485 (Hankel determinants through J-fractions), and #39498 (umbral operators
and delta operators on `R[X]`).

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` |
|---|---|
| 2 | `OrthogonalPolynomials/Basic/General`, `Basic/Definitions` |
| 3 | `Basic/General` (`three_term_recurrence`), `GeneralIdentities` (`sum_recurrenceDiagonal`) |
| 4 | `Basic/General` (`christoffel_darboux`), `Basic/NormsAndKernels` |
| 5 | `General` (`gauss_quadrature`), `GeneralIdentities` (`zeros_interlace`), `BoundsZeros/Discriminants` |
| 6 | `GeneralIdentities` (`symmetric_measure_parity`) |
| 7 | `Basic/NormsAndKernels`, `GeneralIdentities` |
| 8 | `General` (`favard`, stated), `GeneralIdentities` (`compact_support_L2_expansion`) |
| 9 | `Associated`, `Basic/Associated`, `ContinuedFractions` |

## References

- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, Chapter 18
  (T. H. Koornwinder, R. Wong, R. Koekoek and R. F. Swarttouw), <https://dlmf.nist.gov/18>.
  Every equation number refers to this release.
- G. Szegő, *Orthogonal Polynomials*, 4th ed., AMS Colloquium Publications 23, 1975.
- T. S. Chihara, *An Introduction to Orthogonal Polynomials*, Gordon and Breach, 1978.
- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Cambridge University Press, 1999,
  Chapter 5.
- M. E. H. Ismail, *Classical and Quantum Orthogonal Polynomials in One Variable*, Cambridge
  University Press, 2009.
- W. Gautschi, *Orthogonal Polynomials: Computation and Approximation*, Oxford University Press,
  2004.
- G.-C. Rota, D. Kahaner and A. Odlyzko, On the foundations of combinatorial theory VIII: finite
  operator calculus, *J. Math. Anal. Appl.* 42 (1973), 684–760.
