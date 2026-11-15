# Roadmap: general orthogonal polynomials

**Summary.** This roadmap builds the general theory of polynomials orthogonal with respect to a
measure on the real line as a library: three-term recurrences and Jacobi matrices, orthogonality
measures and their moments, the recurrence of an orthogonal system, reproducing kernels, zeros
and Gauss quadrature, modifications of the measure, the moment problem, orthogonal expansions,
continued fractions, and the difference and differential operators that act on orthogonal
systems. Its organization follows the structure of the subject rather than any one text. The
algebra of a three-term recurrence comes first, over any commutative ring, because Favard's
theorem, the Jacobi matrix and the J-fraction all start from it; the measure enters next, and
each later layer is one way of reading the recurrence back into the measure. The content is drawn
from Andrews–Askey–Roy (*Special Functions*, Ch. 5), Chihara (*An Introduction to Orthogonal
Polynomials*, Chs. I–III), Ismail (*Classical and Quantum Orthogonal Polynomials in One
Variable*, Chs. 2, 3 and 10), Gautschi (*Orthogonal Polynomials: Computation and
Approximation*, Chs. 1 and 3), Schmüdgen (*The Moment Problem*, Chs. 3 and 5),
Koekoek–Lesky–Swarttouw (*Hypergeometric Orthogonal Polynomials and Their q-Analogues*, Ch. 1),
Simon's survey of the classical moment problem, Magnus's paper on semi-classical orthogonal
polynomials and the NIST *Digital Library of Mathematical Functions* (DLMF), and each headline
cites its sources; see [References](#references).

Mathlib has the classical families as algebraic objects (`Polynomial.hermite`,
`Polynomial.Chebyshev.T` and `U`, `Polynomial.shiftedLegendre`), the orthogonality and Gauss
quadrature of the Chebyshev polynomials, forward differences, continued fractions, Prokhorov's
theorem and the resolvent (Stieltjes) transform of a measure. Tau Ceti has moment determinacy
under one exponential moment and the completeness of an orthogonal polynomial system in `L²` that
follows from it. Neither has orthogonal polynomials of a general measure.

The roadmap covers:
- the monic polynomials of a three-term recurrence, the associated and corecursive polynomials,
  tridiagonal (Jacobi) matrices and their characteristic polynomials, and the continuants of the
  J-fraction, over any commutative ring (Layer 1);
- orthogonality measures, weights and point masses, the monic orthogonal polynomials of a measure
  by Gram–Schmidt, standardizations and the constants `h_n`, `h̃_n`, `k_n`, `k̃_n`, `k̃̃_n`, the
  Gram matrix of the moments and its Hankel determinants, and least-squares approximation
  (Layer 2);
- the three-term recurrence of an orthogonal system in its first, second, monic and orthonormal
  forms, the Jacobi matrix of a measure, and the recurrence coefficients from the moments
  (Layer 3);
- the Christoffel–Darboux formula, the reproducing kernel and the extremal property of the
  Christoffel function (Layer 4);
- the zeros: reality, simplicity, location, the Jacobi-matrix eigenvalues, interlacing and the
  discriminant; Gauss quadrature, the Christoffel numbers, the Markov–Stieltjes inequalities and
  the convergence of Gauss quadrature; the moments as entries of powers of the Jacobi matrix; and
  the bound for monotonic weights (Layer 5);
- kernel polynomials as the orthogonal polynomials of a Christoffel modification, and the parity
  and quadratic transformations of an even measure (Layer 6);
- Favard's theorem, Hamburger's theorem, and uniqueness of the orthogonality measure for bounded
  recurrence coefficients and on bounded intervals (Layer 7);
- completeness with the `L²` expansion, and the Poisson kernel (Layer 8);
- the associated polynomials as integrals, the J-fraction as a partial fraction over the Gauss
  nodes, and Markov's theorem (Layer 9);
- the forward, backward and imaginary central difference operators, Sheffer sequences, and
  semi-classical weights with their structure relations (Layer 10).

The roadmap rests on Mathlib and Tau Ceti, and consumes one other roadmap item:
[ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) §6.21, the Hankel
determinant of a sequence (2.4).

Suggested home: `TauCeti/Analysis/OrthogonalPolynomials/` for the measure-dependent theory, and
`TauCeti/RingTheory/Polynomial/ThreeTermRecurrence.lean`,
`TauCeti/RingTheory/Polynomial/Sheffer.lean` and `TauCeti/Algebra/Group/BackwardDiff.lean` for
the algebraic parts.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Three-term recurrences and Jacobi matrices over a commutative ring** (1.1–1.4).
2. **Orthogonality measures, moments and orthogonal polynomials** (2.1–2.5).
3. **The recurrence of an orthogonal system** (3.1–3.5).
4. **Reproducing kernels** (4.1–4.3).
5. **Zeros and Gauss quadrature** (5.1–5.7).
6. **Modifications of the measure** (6.1–6.3).
7. **The moment problem** (7.1–7.4).
8. **Orthogonal expansions** (8.1–8.2).
9. **Continued fractions and the Stieltjes transform** (9.1–9.3).
10. **Difference and differential operators** (10.1–10.4).

The numbers are those of the layers below, and `k.n` names subsection `n` of Layer `k`.
`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the
README attaches to it; it is not an exhaustive acceptance test, and the other headlines are
targets of the same standing, stated in prose.

**Inputs.** Cases of the targets that Mathlib already proves are inputs, not targets: the forward
difference and its Newton formula (`fwdDiff`, `fwdDiff_iter_eq_sum_shift`,
`Polynomial.fwdDiff_iter_degree_eq_factorial`), and the Chebyshev case of Gauss quadrature
(`Polynomial.Chebyshev.integral_eq_sumZeroes`), which is a check on 5.3.

**Auxiliary results owned here**, which the layers need and which neither Mathlib nor Tau Ceti
provides:
- the discriminant of a split polynomial,
  `disc(c ∏ (X − x_i)) = c^{2n−2} ∏_{i<j} (x_i − x_j)²` (5.6);
- moment convergence under weak convergence with uniformly bounded higher moments (7.2);
- Hamburger's theorem: positive Hankel determinants characterize the moment sequences of measures
  with infinite support (7.3);
- a finite measure with `∫ x^{2k} dν ≤ C M^{2k}` for all `k`, `M ≥ 0`, is supported in
  `[−M, M]` (7.4).

**What it does not own:**
- The orthogonal polynomial ensembles of random matrix theory: Andréief's identity, the
  determinantal structure and the Hermite, Laguerre and Jacobi kernels
  ([RandomMatrices](../RandomMatrices/README.md) §8.2). RandomMatrices §8.2 owns these statements
  for the orthonormal polynomials of a weight with all moments finite: Gram–Schmidt of the
  monomials, the three-term recurrence, Christoffel–Darboux and the reproducing and projection
  identities. 3.3, 4.1 and 4.2 here are the statements for every orthogonality measure and every
  standardization, and 3.3 identifies the two constructions.
- The Hankel determinant of a sequence over a commutative ring and its invariance under a monic
  change of basis ([ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md)
  §6.21's `D_n(a) = det (a_(i+j+1))_{i,j<n}`). Here `hankelDet m n` is that determinant for
  `a_(k+1) = m_k`; the shifted determinant `Δ′_n` is owned here.
- The definitions and family-specific theory of the named families: the classical families
  (Jacobi, Laguerre, Hermite and their special cases), the hypergeometric families of the Askey
  scheme and their `q`-analogues, and the other named families.
- The Szegő and Nevai classes, the indeterminate moment problem, M. Riesz's completeness theorem
  for determinate measures, Meixner's classification of the orthogonal Sheffer polynomials, the
  nonnegativity of Poisson kernels, the converse of the structure relation, the Euler polynomials
  as a Sheffer system that is not orthogonal, and the `q`-Pochhammer symbols. See the last
  section for these.

**The boundary in one sentence:** this roadmap owns the general theory of polynomials orthogonal
for a positive measure on `ℝ` with finite moments and infinite support (and its finite-support
truncations), the algebra of three-term recurrences, Jacobi matrices and J-fractions, the moment
problem for measures determined by bounded data, and the difference, Sheffer and structure
operators listed in Layer 10; it consumes the Hankel determinant of ClassicalArithmeticCompletion
and defines no named family.

## Conventions

- **Measures.** All measures are `μ : Measure ℝ`. An *orthogonality measure* is
  `IsOrthogonalityMeasure μ`: every `x ↦ xⁿ` is `μ`-integrable and `μ.support` is infinite. This is
  the positive-definite moment functional of Chihara (Ch. I, Definition 3.1, p. 13) represented by
  a measure, the distribution `dα` of Andrews–Askey–Roy (§5.2, p. 244) and DLMF's
  Lebesgue–Stieltjes measure `dμ_α` (18.2.4_5). A weight `w` on `(a, b)` is the measure
  `(volume.restrict (Ioo a b)).withDensity (ENNReal.ofReal ∘ w)`, and weights `w_x` on a countable
  set `X` are `Measure.sum fun x : X => w x • dirac x`. A finite set of `N + 1` points is a
  measure with `μ.support.encard = N + 1`; statements about `p_n` on such a measure carry
  `(n : ℕ∞) < μ.support.encard`, and the finite system stops at `n = N`.
- **Polynomials** are `ℝ[X]`, evaluated with `Polynomial.eval`; at a complex point `z` they are
  evaluated with `aeval z`. The pairing is `pairing μ p q = ∫ p(x) q(x) dμ(x)`.
- **The monic orthogonal polynomials** are `monic μ n`, defined by Gram–Schmidt on the monomials:
  `monic μ n = Xⁿ − Σ_{k<n} (⟨Xⁿ, monic μ k⟩/⟨monic μ k, monic μ k⟩) monic μ k`. The definition is
  total; the layers prove it is the monic orthogonal polynomial of degree `n` whenever
  `(n : ℕ∞) < μ.support.encard`. A general system is `IsOrthogonal μ p`: exact degrees, nonzero,
  pairwise orthogonal. `orthonormal μ n` is `monic μ n / √h_n`, with positive leading coefficient.
- **The constants** for a system `p` are `normSq μ p n = h_n`, `normSqX μ p n = h̃_n`,
  `(p n).leadingCoeff = k_n`, `(p n).nextCoeff = k̃_n` (Mathlib's `nextCoeff` is `0` in degree
  `0`, so `k̃₀ = 0`), and `subNextCoeff (p n) = k̃̃_n`, the coefficient two below the leading one,
  `0` in degree `< 2` (DLMF 18.2.5–18.2.7).
- **`p_{−1} = 0`.** No statement uses a polynomial of index `−1` or a truncated subtraction in an
  index that could produce one: every recurrence is stated separately at `n = 0` and at `n + 1`.
  The second-form coefficient `c_n` is `recC μ p n` with `recC μ p 0 = 0`, and the monic `β_n` is
  `beta μ n` with `beta μ 0 = 0`.
- **The recurrence polynomials.** `Polynomial.monicThreeTerm α β` over any commutative ring is
  `p₀ = 1`, `p₁ = X − α₀`, `p_{n+2} = (X − α_{n+1}) p_{n+1} − β_{n+1} p_n`. Chihara writes
  `c_n = α_{n−1}` and `λ_{n+1} = β_n` (Ch. I, (4.1), p. 18); Ismail and Gautschi use `α_n`,
  `β_n` as here. The first associated polynomials `p_n^{(1)}` are
  `monicThreeTerm (α ∘ succ) (β ∘ succ)`, and the corecursive polynomials `p_n^{(0)}` are
  `Polynomial.corecursive α β` (`p₀ = 0`, `p₁ = 1`, same recurrence).
- **The Jacobi matrix** `J_n = jacobiMatrix a b c n` has `b_i` on the diagonal, `a_i` at
  `(i, i + 1)` and `c_i` at `(i, i − 1)` (DLMF 18.2.18).
- **Zeros** are indexed from `0` in increasing order: `zeros μ n : Fin n → ℝ`, so the `k`-th
  smallest zero `x_k` of the sources is `zeros μ n (k − 1)`. The Christoffel numbers are
  `christoffelNumber μ n i`, the `n`-point Gauss measure is `gaussMeasure μ n = Σ_i w_i δ_{x_i}`.
- **Hankel determinants** are defined for any sequence `m : ℕ → ℝ`: `hankelDet m n` is
  `det (m (i + j))_{i,j<n}` with `Δ₀ = 1`, that is ClassicalArithmeticCompletion §6.21's
  `D_n(a) = det (a_(i+j+1))_{i,j<n}` for `a_(k+1) = m_k`, and `hankelDet' m n` is the determinant
  `Δ′_n` with the last column shifted by one, `Δ′₀ = 0` (DLMF 18.2.27–18.2.28). Chihara's and
  Ismail's `Δ_n`, `D_n` are `(n + 1) × (n + 1)`, so they are `hankelDet m (n + 1)` here. For a
  measure they are applied to the moments `ProbabilityTheory.moment id · μ`.
- **Moments** are Mathlib's `ProbabilityTheory.moment id n μ = ∫ xⁿ dμ`.
- **Continued fractions.** The J-fraction is the Mathlib generalized continued fraction
  `jFraction α β z` with head `0` and partial pairs `(1, z − α₀)`, `(−β_k, z − α_k)`; its `n`-th
  approximant `F_n` is `(jFraction α β z).convs' n`, so `F₀ = 0` and `F₁ = 1/(z − α₀)`
  (DLMF 18.2.34–18.2.35).
- **Complex arguments.** `z ∈ ℂ \ [a, b]` is `∀ t ∈ Set.Icc a b, (t : ℂ) ≠ z`, used together with
  `∀ᵐ x ∂μ, x ∈ Set.Icc a b`. Uniform convergence on compact subsets is
  `TendstoLocallyUniformlyOn`. The Stieltjes transform `∫ dμ(x)/(z − x)` is
  `−MeasureTheory.resolventTransform μ z`.
- **Difference operators.** `Δ_x f(x) = f(x + 1) − f(x)`, `∇_x f(x) = f(x) − f(x − 1)` and
  `δ_x f(x) = (f(x + i/2) − f(x − i/2))/i` (DLMF §18.1(i)). Koekoek–Lesky–Swarttouw write
  `δ f(x) = f(x + i/2) − f(x − i/2)` ((1.16.3), p. 26), which is `i δ_x` here.
- **Formal power series.** Sheffer generating functions are identities in `PowerSeries R[X]` over a
  `ℚ`-algebra `R`: `exp(x u(t))` is `(PowerSeries.exp R[X]).subst (C X * u.map C)`. The operator
  `v(D)`, with `D = d/dx`, is `derivativeAction v`, which sends `p` to `Σ_{k ≤ deg p} v_k p⁽ᵏ⁾`, and
  `v` is the compositional inverse `PowerSeries.substInvOfIsUnit u`. The generating function is
  normalized with `tⁿ/n!` and the factors `c_n` of DLMF 18.2.45 are taken equal to `1`; a system
  with other nonzero `c_n` is the rescaled system `c_n p_n`. Ismail (Ch. 10) uses `tⁿ` without
  `n!`, which is the rescaling `p_n/n!`.
- **Semi-classical measures.** `IsSemiclassical μ π τ` is the Pearson-equation definition of
  10.4. It implies DLMF's definition (18.2.44), which is the structure relation with `s`, `t`
  independent of `n`: 10.4 gives it with `t = d − 1` and `s = max(deg τ, d − 1)`, `d = deg π`. The
  converse is listed in the last section.
- **Names.** Measure-dependent definitions and theorems live in a namespace named
  OrthogonalPolynomials; `monicThreeTerm`, `corecursive`, `jacobiMatrix`, `imCentralDiff`,
  `derivativeAction` and `IsSheffer` live in `Polynomial`, and `bwdDiff` beside Mathlib's
  `fwdDiff`. Names in the layers are suggestions.

## Exact supplier contracts

### From Tau Ceti

At the pinned Tau Ceti:
- `TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean`:
  `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot` (a polynomial family of exact degrees is
  complete in `L²(w·μ)` when `w·μ` has one finite exponential moment) and
  `TauCeti.memLp_two_algebraMap_eval` (8.1).
- `TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean`:
  `TauCeti.hilbertBasisOfOrthogonalSystem` and `TauCeti.coeFn_hilbertBasisOfOrthogonalSystem`
  (8.1).
- `TauCeti/Probability/Moments/Determinacy.lean`:
  `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` (two finite measures
  with one exponential moment each and equal moments are equal) (7.4).
- `TauCeti/Probability/Moments/WeakConvergence.lean`:
  `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` (probability measures whose
  moments converge to those of a probability measure concentrated on a compact set converge weakly
  to it) (5.5, 9.3).
- `TauCeti/RingTheory/Polynomial/Hermite/GeneratingFunction.lean`:
  `Polynomial.hasSum_hermite_generating_function` (10.3).
- `TauCeti/MeasureTheory/Measure/ResolventTransform/Basic.lean`: the API of Mathlib's
  `MeasureTheory.resolventTransform` on `ℝ` (9.3).
- `TauCeti/Probability/Distributions/Gaussian/Hermite/Basis.lean`:
  `TauCeti.gaussianHermiteHilbertBasis` (a check on 8.1).

### From Mathlib

- `fwdDiff`, `fwdDiff_iter_eq_sum_shift`, `shift_eq_sum_fwdDiff_iter`, `fwdDiff_choose`,
  `Polynomial.fwdDiff_iter_degree_eq_factorial`, `ascPochhammer`, `descPochhammer`,
  `ascPochhammer_succ_eval`, `descPochhammer_succ_eval`, `Finset.sum_range_by_parts` (10.1).
- `MeasureTheory.Measure.support`, `MeasureTheory.Measure.withDensity`,
  `MeasureTheory.Measure.dirac`, `MeasureTheory.Measure.sum`, `StieltjesFunction.measure`,
  `MeasureTheory.Lp`, `HilbertBasis`, `ProbabilityTheory.moment`.
- `Polynomial.Sequence`, `Polynomial.nextCoeff`, `Polynomial.divByMonic`, `Lagrange.basis`,
  `Polynomial.discr`, `Polynomial.discr_of_degree_eq_two`, `Polynomial.resultant_eq_prod_roots_sub`,
  `Polynomial.roots`, `Multiset.sort`.
- `Matrix.charpoly`, `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.charpoly_eq`,
  `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues`, `Matrix.det_succ_row`, `eigenvalue_mem_ball`
  (Gershgorin), `InnerProductSpace.gramSchmidtNormed`.
- `isCompact_closure_of_isTightMeasureSet` (Prokhorov), `MeasureTheory.IsTightMeasureSet`,
  `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.resolventTransform`.
- `GenContFract`, `GenContFract.convs'`, `GenContFract.conts`.
- `PowerSeries.subst`, `PowerSeries.exp`, `PowerSeries.substInvOfIsUnit`,
  `PowerSeries.subst_substInvOfIsUnit_right`, `Polynomial.bernoulli`,
  `Polynomial.bernoulli_generating_function`, `bernoulli`, `Polynomial.hermite`.
- `Polynomial.Chebyshev.measureT`, `Polynomial.Chebyshev.integral_eq_sumZeroes`.

### From ClassicalArithmeticCompletion

[ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md) §6.21 (on main):
`D_n(a) = det (a_(i+j+1))_{i,j<n}` over a commutative ring, `D₀ = 1`, and the invariance of
`D_n` under a monic change of basis: the determinant of the moment matrix is unchanged when the
powers `Xⁱ` in rows and columns are replaced by monic polynomials of degree `i` (2.4). §6.21
states both in prose and names no declarations.

## How to read the build

Layer 1 is pure algebra over a commutative ring: the polynomials, matrices and continued fractions
that a sequence of recurrence coefficients determines, with no measure in sight. Layer 2
introduces the measure, builds the monic orthogonal polynomials by Gram–Schmidt, and reads their
norms off the Gram matrix of the moments. Layer 3 proves that an orthogonal system satisfies a
recurrence of Layer 1, which identifies `monic μ` with `monicThreeTerm` and the Jacobi matrix of
the measure with that of Layer 1. Layer 4 sums the recurrence into the Christoffel–Darboux formula.
Layer 5 uses the kernel and the Jacobi matrix for the zeros and builds Gauss quadrature on them.
Layer 6 changes the measure (by a linear factor, or by the substitution `x ↦ x²` for an even
measure) and identifies the new orthogonal polynomials. Layer 7 runs Layer 3 backwards: from the
recurrence coefficients alone it constructs the measure as a weak limit of the Gauss measures of
Layer 5, and proves it unique under bounded data. Layer 8 is the `L²` theory. Layer 9 reads the
Gauss measures of Layer 5 as the J-fraction of Layer 1 and passes to the limit. Layer 10 collects
the operators that act on orthogonal systems: the difference operators of the discrete families,
the delta operators of a Sheffer sequence, and the derivative in the structure relations.

```text
Layer 1 ──┐
          ├──► Layer 3 ──► Layer 4 ──► Layer 5 ──┬──► Layer 6
Layer 2 ──┘                                      ├──► Layer 7
   │                                             └──► Layer 9
   └──► Layer 8

Layer 10: 10.1–10.2 need Mathlib only; 10.3 and 10.4 need Layers 2–3.
```

Layer 7 uses 1.1 and 1.3 for the functional of a recurrence, 5.3 for the Gauss measures, and 2.4
and 3.5 for Hamburger's theorem and uniqueness; Layer 9 uses 1.2 and 1.4 with 5.3. The
`**Checks.**` and `### Examples` of each layer are statements to prove; they test the conventions
on explicit values.

## Layer 1: three-term recurrences and Jacobi matrices over a commutative ring

### 1.1 The monic recurrence polynomials

Define `Polynomial.monicThreeTerm α β` over a commutative ring. Targets: it is monic of degree `n`
over a nontrivial ring (`monicThreeTerm_monic`); it commutes with ring homomorphisms applied to
`α`, `β`; and `(monicThreeTerm α β n).eval x` satisfies the scalar recurrence (Chihara, Ch. I,
(4.6), p. 21; Gautschi, (1.3.2), p. 10; Schmüdgen, (5.15)–(5.16), p. 100; DLMF 18.2.11_5).

*Needs:* Mathlib.

**Checks.**
- `α = 0`, `β = 1/4`: `monicThreeTerm α β n = 2^{−n} U_n` for Mathlib's `Polynomial.Chebyshev.U`.
- `n = 2`: `(X − α₁)(X − α₀) − β₁`.
- `α = 0`, `β_k = k`: `monicThreeTerm α β 2 = X² − 1 = He₂`; indexing `β` from `β₀ = 0` in the
  step to `p₂` would give `X²`.

### 1.2 Associated and corecursive polynomials and the Casoratian

Define `Polynomial.corecursive α β`. Targets, over any commutative ring:
- the first associated polynomials `p_n^{(1)} = monicThreeTerm (α ∘ succ) (β ∘ succ) n` satisfy
  `corecursive α β (n + 1) = p_n^{(1)}` (Chihara, Ch. III, (4.3), p. 86; Gautschi,
  Theorem 1.36, p. 16; DLMF 18.2.31–18.2.32);
- the Casoratian: `p_n p_n^{(1)} − p_{n+1} p_{n−1}^{(1)} = β₁ ⋯ β_n` for `n ≥ 1`, by induction on
  `n` from the two recurrences (Chihara, Ch. III, (4.4), p. 86; Simon (1998), (2.8)–(2.11),
  pp. 20–21, in orthonormal form).

*Needs:* 1.1.

**Checks.**
- `corecursive α β 1 = 1` and `corecursive α β 2 = X − α₁ = p₁^{(1)}`.
- Casoratian at `n = 1`: `(X − α₀)(X − α₁) − ((X − α₁)(X − α₀) − β₁) · 1 = β₁`.
- Shifting the coefficients by one in the wrong direction, `monicThreeTerm (α ∘ pred) …`, gives
  `X − α₀` at `n = 1` instead of `p₁^{(1)} = X − α₁`.

### 1.3 Tridiagonal matrices and their characteristic polynomials

Define `jacobiMatrix a b c n`. Targets:
- over any commutative ring, `charpoly (J_n) = monicThreeTerm b (k ↦ a_{k−1} c_k) n`
  (`charpoly_jacobiMatrix`; Ismail, Theorem 2.2.4, p. 24, for the monic case; DLMF 18.2.18);
- `J_n` is symmetric iff `c_k = a_{k−1}` for `1 ≤ k < n`, and when `a_{k−1} c_k > 0` it is
  conjugate by a positive diagonal matrix to the symmetric matrix with off-diagonal entries
  `√(a_{k−1} c_k)` (Ismail, p. 24).

Route: expansion of the determinant along the last row (`Matrix.det_succ_row`).

*Needs:* 1.1.

**Checks.**
- `n = 2`: `charpoly = (X − b₀)(X − b₁) − a₀ c₁`.
- `n = 1`: `charpoly = X − b₀`.
- `n = 3`, `b = 0`, `a = (1, 2, 3)`, `c = (0, 5, 7)`: the matrix `((0, 1, 0), (5, 0, 2), (0, 7, 0))`
  has `charpoly = X³ − 19X`, from `a₀c₁ + a₁c₂ = 5 + 14`; the products `a_k c_k` would give
  `X³ − 31X`.

### 1.4 The continuants of the J-fraction

Define `jFraction α β z`. Target: Mathlib's continuants of the J-fraction are the corecursive and
the recurrence polynomials, `conts n = (p_n^{(0)}(z), p_n(z))` for every `n`
(`conts_jFraction`; Chihara, Ch. III, (4.2)–(4.3), pp. 85–86; Gautschi, Theorem 1.34, p. 16).

Route: Mathlib's continuant recurrence (`GenContFract.conts`) is the recurrence of 1.1 with the
initial values of 1.2.

*Needs:* 1.1, 1.2, Mathlib `GenContFract.conts`.

**Checks.**
- `conts 0 = (0, 1)` and `conts 1 = (1, z − α₀)`.
- `conts 2 = (z − α₁, (z − α₀)(z − α₁) − β₁)`; with partial numerator `β₁` instead of `−β₁` the
  denominator would be `(z − α₀)(z − α₁) + β₁`, not `p₂(z)`.
- The approximants are the quotients: `convs' 1 = 1/(z − α₀)`, the ratio of the two entries of
  `conts 1`, and `convs' 0 = 0`, from `conts 0 = (0, 1)`.

### Examples

- `α = 0`, `β = 1/4`, `n = 3`: `p₃ = X³ − X/2 = U₃/8`, and `J₃` with `a = c = 1/2`, `b = 0` has
  characteristic polynomial `X³ − X/2`.

### Dependencies

Mathlib only.

## Layer 2: orthogonality measures, moments and orthogonal polynomials

### 2.1 Orthogonality measures

Define `IsOrthogonalityMeasure μ` (all moments finite, `μ.support` infinite) and the pairing
`pairing μ p q = ∫ p q dμ`. Targets:
- an orthogonality measure is finite, every polynomial is in `L²(μ)`, and `pairing μ q q > 0` for
  every nonzero `q` (`pairing_self_pos`; Chihara, Ch. I, Definition 3.1, p. 13); more generally,
  for any `μ` with finite moments, `pairing μ q q > 0` when `q ≠ 0` and
  `(deg q : ℕ∞) < μ.support.encard`;
- **weights**: for a measurable set `s`, a measurable `w ≥ 0` on `s` with `0 < ∫_s w` and
  `∫_s |x|ⁿ w < ∞` for all `n`, the measure `(volume.restrict s).withDensity w` is an
  orthogonality measure (`isOrthogonalityMeasure_withDensity`); this covers finite and infinite
  intervals `(a, b)` (DLMF 18.2.1, 18.2.1_5);
- **countable sets**: for an infinite set `X ⊆ ℝ` and weights `w_x > 0` with
  `Σ_x |x|ⁿ w_x < ∞` for all `n`, the measure `Σ_{x∈X} w_x δ_x` is an orthogonality measure
  (`isOrthogonalityMeasure_sum_dirac`), and its pairing is `Σ_x p(x) q(x) w_x`; for a finite `X`
  of `N + 1` points the support has `N + 1` points (DLMF 18.2.2–18.2.4);
- **Lebesgue–Stieltjes measures**: for a bounded `StieltjesFunction` `α`, the support of
  `α.measure` is the set of points of increase of `α`, so `α.measure` is an orthogonality measure
  exactly when `α` has infinitely many points of increase and finite moments
  (Andrews–Askey–Roy, §5.2, p. 244; DLMF 18.2.4_5).

*Needs:* Mathlib `Measure.support`, `withDensity`, `Measure.sum`, `StieltjesFunction.measure`.

**Checks.**
- `volume.restrict (Icc (−1) 1)` (Legendre) and the Gaussian measure (Hermite) are orthogonality
  measures; `Σ_{k≥0} e^{−1}/k! δ_k` (Charlier with `a = 1`) is one.
- `δ₀ + δ₁` has a support of 2 points: `pairing μ q q > 0` for `deg q ≤ 1`, `q ≠ 0`, but
  `q = X(X − 1)` has `pairing μ q q = 0`.
- The Cauchy measure `dx/(π(1 + x²))` has infinite support, but `x²` is not integrable, so it is
  not an orthogonality measure.

### 2.2 The monic orthogonal polynomials

Define `monic μ n` by Gram–Schmidt (see [Conventions](#conventions)). For every `μ` and `n`,
`monic μ n` is monic of degree `n` (`monic_monic`), by strong induction on `n`. For `μ` with finite
moments and `(n : ℕ∞) < μ.support.encard`:
- it is orthogonal to every polynomial of lower degree (`pairing_monic_eq_zero`; Chihara, Ch. I,
  Theorem 2.1, p. 8);
- it is the only monic polynomial of degree `n` with this property (`eq_monic`; Ismail,
  Theorem 2.1.1, p. 17; Gautschi, Theorem 1.6, p. 3);
- if `μ.support` has exactly `N + 1` points, `monic μ (N + 1)` is `∏_{x ∈ supp μ} (X − x)` and so
  vanishes on the support (`eval_monic_eq_zero_of_mem_support`; Gautschi, Theorem 1.22, p. 8;
  DLMF §18.2(iv)).

*Needs:* 2.1.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `monic μ 2 = X² − 1/3`, `monic μ 3 = X³ − 3X/5`.
- `δ₀ + δ₁`: `monic μ 1 = X − 1/2`, `monic μ 2 = X² − X`.
- Gram–Schmidt without the division by `⟨monic μ k, monic μ k⟩` gives `X² − 2/3` for Lebesgue
  measure on `[−1, 1]`, with `∫ (x² − 2/3) dx = −2/3 ≠ 0`.

### 2.3 Systems, constants and standardizations

Define `IsOrthogonal μ p` and, for a system `p`, `normSq μ p n = h_n`, `normSqX μ p n = h̃_n`,
`subNextCoeff`, and `orthonormal μ n`. For an orthogonality measure `μ`:
- `IsOrthogonal μ p ↔ ∀ n, ∃ c ≠ 0, p n = c · monic μ n` (`isOrthogonal_iff`; Chihara, Ch. I,
  Definition 2.2, p. 7, and the corollary to Theorem 2.2, p. 9);
- `pairing μ (p m) (p n) = h_n δ_{mn}` with `h_n > 0`, and the same with sums for point masses
  (DLMF 18.2.5–18.2.5_5);
- `h̃_n = ∫ x p_n² dμ` and the expansion `p_n = k_n xⁿ + k̃_n x^{n−1} + k̃̃_n x^{n−2} + ⋯`, with
  `k̃₀ = 0` and `k̃̃₀ = k̃̃₁ = 0` (DLMF 18.2.6–18.2.7);
- the monic standardization (`k_n = 1`) is `monic μ`, and the orthonormal standardization
  (`h_n = 1`, `k_n > 0`) is `orthonormal μ` (`orthonormal_spec`);
- the finite expansion `q = Σ_{k ≤ deg q} (⟨q, p_k⟩/h_k) p_k` of every polynomial
  (`eq_sum_pairing`; Chihara, Ch. I, Theorem 2.2, p. 8), and the orthogonality of `p_n` to every
  polynomial of degree `< n`.

*Needs:* 2.2.

**Checks.**
- Lebesgue measure on `[−1, 1]` with Legendre's `P_n` (`P₂ = (3X² − 1)/2`): `h₂ = 2/5`,
  `k₂ = 3/2`, `k̃₂ = 0`, `k̃̃₂ = −1/2`.
- Lebesgue measure on `[−1, 1]`: `orthonormal μ 0 = 1/√2` and `orthonormal μ 1 = √(3/2) X`.
- The monomials `p n = Xⁿ` are not `IsOrthogonal` for Lebesgue measure on `[−1, 1]`:
  `pairing μ 1 X² = 2/3 ≠ 0`.

### 2.4 The Gram matrix of the moments and Hankel determinants

Define `hankelDet m n = Δ_n` and `hankelDet' m n = Δ′_n` for a sequence `m`. `hankelDet m n` is
ClassicalArithmeticCompletion §6.21's `D_n(a) = det (a_(i+j+1))_{i,j<n}` of the shifted sequence
(see [Conventions](#conventions)). For an orthogonality measure `μ` and its moments
`μ_n = ProbabilityTheory.moment id n μ`:
- `Δ_n > 0` for all `n` (`hankelDet_pos`; Chihara, Ch. I, Theorem 3.4, p. 15; Gautschi,
  Theorem 1.2, p. 2; Schmüdgen, Proposition 3.11, p. 65); more generally `Δ_n > 0` iff
  `n ≤ |supp μ|`;
- `Δ_n = ∏_{k<n} h_k` for the monic system, so `h_n = Δ_{n+1}/Δ_n` (`normSq_monic_eq`; Ismail,
  (2.1.6), p. 17; Chihara, Ch. I, (3.4), p. 12);
- `p_n(x) = Δ_n⁻¹ det(…)`, the determinant with rows `(μ_i, …, μ_{i+n})` for `i < n` and last row
  `(1, x, …, xⁿ)` (`eval_monic_eq_det`; Ismail, (2.1.6), p. 17; DLMF 18.2.29);
- `k̃_n = −Δ′_n/Δ_n` for the monic system, the link between 3.5 and the corrected 3.1.

Route: the Gram matrix of `1, x, …, x^{n−1}` is the Hankel matrix; replacing `xⁱ` by
`monic μ i` in rows and columns (the invariance of `D_n` under a monic change of basis,
ClassicalArithmeticCompletion §6.21) turns it into the diagonal matrix of the `h_k`, so
`Δ_n = ∏_{k<n} h_k`; for the determinant formula, the determinant is monic up to `Δ_n` and
orthogonal to `x^k` for `k < n` because two rows coincide.

*Needs:* 2.2–2.3; ClassicalArithmeticCompletion §6.21 (`D_n(a)` and its invariance under a monic
change of basis); Mathlib `ProbabilityTheory.moment`.

**Checks.**
- The Gaussian moments `1, 0, 1, 0, 3, …`: `Δ₃ = 0!·1!·2! = 2`.
- `hankelDet m 0 = 1` and `hankelDet' m 1 = m₁` for every `m`.
- `δ₀ + δ₁` (moments `2, 1, 1, 1, …`): `Δ₁ = 2`, `Δ₂ = 1`, and `Δ₃ = 0` because two rows agree; a
  support of two points stops the positivity at `n = 2`.
- The weight `eˣ` on `[0, 1]`: `h_n = Δ_{n+1}/Δ_n` (`1.718281828, 0.1363051216, 0.009148349372`),
  and the determinant formula at `x = 0.37`, `n = 3` gives `0.0212364801576`.

### 2.5 Least-squares approximation

For an orthogonality measure `μ` and an orthogonal system `p`:
- **the monic extremal property:** `monic μ n` minimizes `∫ q² dμ` among the monic polynomials of
  degree `n` (`pairing_monic_le`; Gautschi, Theorem 1.24, p. 8), with equality only at
  `q = monic μ n`;
- **least squares:** for `f ∈ L²(μ)` and the coefficients `λ_k = h_k⁻¹ ∫ f p_k dμ`, the partial
  sum `S_n f = Σ_{k≤n} λ_k p_k` satisfies `∫ (f − S_n f)² dμ ≤ ∫ (f − q)² dμ` for every
  polynomial `q` of degree `≤ n` (`integral_sq_sub_partialSum_le`; Andrews–Askey–Roy,
  Theorem 5.7.1, p. 263; Ismail, Theorem 2.1.5, p. 21), with equality only at `q = S_n f`
  `μ`-almost everywhere;
- **Bessel's inequality:** `Σ_{k≤n} h_k λ_k² ≤ ∫ f² dμ` (Andrews–Askey–Roy, Corollary 5.7.2,
  p. 264).

Route: Pythagoras in `L²(μ)`: `f − S_n f` is orthogonal to the polynomials of degree `≤ n`
(2.3), so `∫ (f − q)² = ∫ (f − S_n f)² + ∫ (S_n f − q)²`.

*Needs:* 2.3.

**Checks.**
- Lebesgue measure on `[−1, 1]`, `f = |x|`, `n = 2`: `S₂ f = 3/16 + (15/16) x²`, with
  `∫ (|x| − S₂ f)² dx = 1/96`, while `q = x²` gives `1/15`.
- Bessel for the same `f`: `2 · (1/2)² + (2/5)(5/8)² = 21/32 ≤ ∫ x² dx = 2/3`.
- Lebesgue measure on `[−1, 1]`, `n = 2`: `∫ (x² − 1/3)² dx = 8/45`, while the monic `X²` gives
  `2/5`.

### Examples

- Charlier with `a = 1` (`Σ_k e^{−1}/k! δ_k`): `monic μ 1 = X − 1`, since the mean is `1`.
- Lebesgue measure on `[−1, 1]`: moments `2, 0, 2/3`, `Δ₁ = 2`, `Δ₂ = 4/3`, and
  `h₁ = Δ₂/Δ₁ = 2/3`.

### Dependencies

Mathlib; ClassicalArithmeticCompletion §6.21 (2.4).

## Layer 3: the recurrence of an orthogonal system

### 3.1 The second form

Define `a_n = recA p n = k_n/k_{n+1}`, `b_n = recB μ p n = h̃_n/h_n` and `c_n = recC μ p n`
(`c₀ = 0`, `c_n = a_{n−1} h_n/h_{n−1}`). For an orthogonal system `p`:
- `x p₀ = a₀ p₁ + b₀ p₀` and `x p_{n+1} = a_{n+1} p_{n+2} + b_{n+1} p_{n+1} + c_{n+1} p_n`
  (`X_mul_eq_recurrence`; Schmüdgen, Proposition 5.6, p. 98, orthonormal case; DLMF 18.2.10);
- the coefficient forms `b_n = k̃_n/k_n − k̃_{n+1}/k_{n+1}` (`recB_eq_coeff`) and
  `c_n = (k̃̃_n − a_n k̃̃_{n+1} − b_n k̃_n)/k_{n−1}` for `n ≥ 1` (DLMF 18.2.11);
- **with the sign corrected:** `Σ_{j=0}^{n} b_j = −k̃_{n+1}/k_{n+1}` (`sum_recB`). DLMF 18.2.11_1
  prints `+`; telescoping `b_j = k̃_j/k_j − k̃_{j+1}/k_{j+1}` with `k̃₀ = 0` gives the minus sign;
- `a_{n−1} c_n > 0` for `n ≥ 1` (`recA_mul_recC_pos`; DLMF 18.2.11_2);
- the system is orthonormal iff `h₀ = 1` and `c_n = a_{n−1}` for `n ≥ 1`, and monic iff `k₀ = 1` and
  `a_n = 1` for all `n`.

Route: expand `x p_n` in the finite expansion of 2.3; orthogonality kills all but three terms;
compare the top two coefficients and pair with `p_n`, `p_{n−1}`.

*Needs:* 2.3.

**Checks.**
- The Hermite weight `e^{−x²/2}` with Mathlib's `Heₙ`: `a_n = 1`, `b_n = 0`, `c_n = n`.
- The weight `eˣ` on `[0, 1]` (monic): `b₀ = 0.58197670…` and `k̃₁/k₁ = −0.58197670…`, which
  confirms the corrected sign of `sum_recB`.
- At `n = 0` the second form has no `p_{−1}` term: for Hermite, `x · 1 = He₁`.

### 3.2 The first form

With `A_n = a_n⁻¹`, `B_n = −a_n⁻¹ b_n`, `C_n = a_n⁻¹ c_n`, and conversely:
- `p₁ = (A₀ x + B₀) p₀` and `p_{n+2} = (A_{n+1} x + B_{n+1}) p_{n+1} − C_{n+1} p_n`
  (Andrews–Askey–Roy, Theorem 5.2.2, p. 244; DLMF 18.2.8);
- `A_n = k_{n+1}/k_n`, `B_n = (k̃_{n+1}/k_{n+1} − k̃_n/k_n) A_n = −(h̃_n/h_n) A_n`,
  `C_n = (A_n k̃̃_n + B_n k̃_n − k̃̃_{n+1})/k_{n−1} = (A_n/A_{n−1}) h_n/h_{n−1}` for `n ≥ 1`
  (Andrews–Askey–Roy, Theorem 5.2.2 and Corollary 5.2.3, pp. 244–245; DLMF 18.2.9);
- `A_{n−1} A_n C_n > 0` for `n ≥ 1` (Andrews–Askey–Roy, Theorem 5.2.2, p. 244; DLMF 18.2.9_5);
- the orthonormal and monic criteria of 3.1 in this form.

*Needs:* 3.1.

**Checks.**
- Legendre: `A_n = (2n + 1)/(n + 1)`, `B_n = 0`, `C_n = n/(n + 1)`.
- Hermite `Heₙ`: `A_n = 1`, `B_n = 0`, `C_n = n`.
- Laguerre `L_n^{(α)}` (weight `x^α e^{−x}` on `(0, ∞)`): `A_n = −1/(n + 1)`,
  `B_n = (2n + α + 1)/(n + 1)`, `C_n = (n + α)/(n + 1)` (DLMF Table 18.9.1). At `α = ½`, `n = 1`
  this is `(−½, 7/4, ¾)`; the opposite sign in `B_n = −a_n⁻¹ b_n` would give `B₁ = −7/4`.

### 3.3 The monic and orthonormal forms

Define `alpha μ n = b_n` and `beta μ n = h_n/h_{n−1}` (`beta μ 0 = 0`) for `p = monic μ`.
For an orthogonality measure:
- `monic μ = monicThreeTerm (alpha μ) (beta μ)` and `β_n > 0` for `n ≥ 1`
  (`monic_eq_monicThreeTerm`; Chihara, Ch. I, Theorem 4.1, p. 18; Ismail, Theorem 2.2.1, p. 22;
  Gautschi, Theorem 1.27, p. 10; DLMF 18.2.11_4–18.2.11_6);
- `q_n = p_n/√h_n` is `orthonormal μ n`, with
  `x q_{n+1} = √β_{n+2} q_{n+2} + α_{n+1} q_{n+1} + √β_{n+1} q_n`, `q₁ = (x − α₀)/√(h₀ β₁)` and
  `q₀ = 1/√h₀` (`X_mul_orthonormal`; Gautschi, Theorem 1.29, p. 12; DLMF 18.2.11_7–18.2.11_8);
- `h_n = h₀ β₁ ⋯ β_n` (Chihara, Ch. I, Theorem 4.2(b), p. 19);
- comparison with RandomMatrices §8.2: the class of `orthonormal μ n` in `L²(μ)` is
  `InnerProductSpace.gramSchmidtNormed ℝ (fun k ↦ xᵏ) n`, the `n`-th Gram–Schmidt orthonormalization
  of the monomials (`orthonormal_eq_gramSchmidtNormed`); for `μ = w(x) dx` this is the `n`-th
  orthonormal polynomial of RandomMatrices §8.2.

*Needs:* 1.1, 3.1; Mathlib `InnerProductSpace.gramSchmidtNormed`.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `α_n = 0`, `β_n = n²/(4n² − 1)`, `h₀ = 2`.
- The standard Gaussian measure: `α_n = 0`, `β_n = n`, `h₀ = 1`.
- `beta μ 0 = 0` is never used as `h₀/h_{−1}`: `q₁` uses `h₀ β₁`, which for Lebesgue measure on
  `[−1, 1]` is `2 · 1/3 = 2/3 = h₁`.

### 3.4 The Jacobi matrix of a measure

For an orthogonal system with the coefficients of 3.1:
- `p_n = k_n · charpoly (J_n)` for `J_n = jacobiMatrix a b c n` (1.3);
- truncated eigenvector relation: with `v(x) = (p₀(x), …, p_{n−1}(x))`,
  `J_n v(x) = x v(x) − a_{n−1} p_n(x) e_{n−1}`, so each zero of `p_n` gives an eigenvector
  (Gautschi, (1.3.18), p. 13; DLMF 18.2.11_9);
- for the orthonormal system `J_n` is the symmetric matrix with diagonal `α_k` and off-diagonal
  `√β_k` (Gautschi, Definition 1.30, p. 13).

*Needs:* 1.3, 3.1–3.3.

**Checks.**
- `n = 2`: `J₂ (p₀, p₁)ᵀ = x (p₀, p₁)ᵀ − a₁ p₂ e₁`. For the transpose (`a_i` at `(i + 1, i)`, `c_i`
  at `(i − 1, i)`) the first row reads `b₀ p₀ + c₁ p₁`, which equals `x p₀` only if `c₁ = a₀`.
- `n = 1`: `charpoly = X − b₀`, which is `p₁/k₁`.
- Lebesgue measure on `[−1, 1]`, `n = 2`: the orthonormal `J₂` is `((0, 1/√3), (1/√3, 0))`.

### 3.5 The recurrence coefficients from the moments

For an orthogonality measure `μ`:
- `α_n = Δ′_{n+1}/Δ_{n+1} − Δ′_n/Δ_n` and `β_n = Δ_{n+1} Δ_{n−1}/Δ_n²` (`alpha_beta_eq_hankel`;
  Schmüdgen, Proposition 5.6, p. 98, for `β_n`; DLMF 18.2.30);
- if `μ` is concentrated on `[a, b]`, then `a < α_n < b` and `0 < β_{n+1} ≤ max(a², b²)`
  (`alpha_mem_Ioo_beta_le`; Gautschi, Theorem 1.28, p. 12).

Route: 2.4 for `h_n` and `k̃_n` and the formulas of 3.3; for the bounds,
`α_n = ∫ x p_n² dμ/∫ p_n² dμ` with an infinite support, and Gautschi's argument for `β`.

*Needs:* 2.4, 3.3.

**Checks.**
- The weight `eˣ` on `[0, 1]`: `α₁ = 0.4848434409` and `β₁ = 0.079326406` from the determinants
  agree with the recurrence, and `α₀, …, α₃ ∈ (0, 1)`, `β₁, …, β₅ ≤ 1`.
- The Gaussian moments: `β_n = Δ_{n+1}Δ_{n−1}/Δ_n² = n`, with `Δ_n = ∏_{k<n} k!`.
- `δ₀ + δ₁` is not an orthogonality measure: its `Δ₃ = 0`, and `β₂` would be `0`.

### Examples

- The standard Gaussian measure: `monic μ = He`, and `X He₂ = He₃ + 2 He₁`.

### Dependencies

Layers 1–2.

## Layer 4: reproducing kernels

### 4.1 The Christoffel–Darboux identity and its confluent form

Define `cdKernel μ p n x y = K_n(x, y) = Σ_{ℓ ≤ n} p_ℓ(x) p_ℓ(y)/h_ℓ` (independent of the
standardization of `p`). For an orthogonal system:
- for `x ≠ y`,
  `K_n(x, y) = (k_n/(h_n k_{n+1})) (p_{n+1}(x) p_n(y) − p_n(x) p_{n+1}(y))/(x − y)` (`cdKernel_eq`;
  Chihara, Ch. I, Theorem 4.5, p. 23; Andrews–Askey–Roy, Theorem 5.2.4 and Remark 5.2.2, p. 246;
  Ismail, Theorem 2.2.2, p. 23; Gautschi, Theorem 1.32, p. 14; DLMF 18.2.12);
- `K_n(x, x) = (k_n/(h_n k_{n+1})) (p′_{n+1}(x) p_n(x) − p′_n(x) p_{n+1}(x))` (`cdKernel_self`;
  Chihara, Ch. I, Theorem 4.6, p. 24; Andrews–Askey–Roy, Theorem 5.2.5, p. 247; DLMF 18.2.13),
  and hence `p′_{n+1} p_n − p′_n p_{n+1} > 0` on `ℝ` when `k_n/k_{n+1} > 0`
  (Andrews–Askey–Roy, Corollary 5.2.6, p. 247).

Route: multiply the recurrence of 3.1 at `x` by `p_n(y)` and at `y` by `p_n(x)`, subtract and
telescope; the confluent form by letting `y → x`.

*Needs:* 3.1.

**Checks.**
- Lebesgue measure on `[−1, 1]`, monic, `n = 3`, `x = 0.3`, `y = −0.7`: both sides of `cdKernel_eq`
  are `−0.287146875`.
- `n = 0`: `K₀ = k₀²/h₀`, and the right side is `(k₀/(h₀k₁)) · k₁ k₀`.
- Legendre `P_n`, `n = 1`: `K₁(x, y) = (1 + 3xy)/2` on both sides, with `k₁/(h₁k₂) = 1`; the
  inverted ratio `k₂/(h₁k₁) = 9/4` would give `9/4` times that.

### 4.2 The reproducing property

For a polynomial `q` of degree `≤ n`, `∫ q(y) K_n(x, y) dμ(y) = q(x)`
(`integral_mul_cdKernel_of_natDegree_le`); for `f ∈ L²(μ)` with `∫ f p_ℓ dμ = 0` for `ℓ ≤ n`,
`∫ f(y) K_n(x, y) dμ(y) = 0` (`integral_mul_cdKernel_of_orthogonal`). So
`f ↦ ∫ f(y) K_n(·, y) dμ(y)` is the orthogonal projection of `L²(μ)` onto the polynomials of
degree `≤ n`, that is `S_n f` of 2.5 (Andrews–Askey–Roy, Lemma 5.6.2, p. 260; DLMF 18.2.12_5).

*Needs:* 2.3.

**Checks.**
- `n = 0`: `K₀ = 1/μ(ℝ)`, and the projection of `f` is its mean.
- Legendre, `n = 1`, `q = X`: `∫ y (1 + 3xy)/2 dy = x` on `[−1, 1]`.

### 4.3 The kernel polynomial and the Christoffel function

Define `kernelPolynomial μ p y n = Σ_{ℓ ≤ n} (p_ℓ(y)/h_ℓ) p_ℓ`, the polynomial `K_n(·, y)`, whose
value at `x` is `cdKernel μ p n x y` (DLMF 18.2.14). For an orthogonality measure, an orthogonal
system and every real `y`:
- **the extremal property:** `1/K_n(y, y) ≤ ∫ q² dμ` for every polynomial `q` of degree `≤ n` with
  `q(y) = 1`, with equality at `q = K_n(·, y)/K_n(y, y)` (`inv_cdKernel_self_le`;
  Chihara, Ch. I, Theorem 7.3, p. 38; Andrews–Askey–Roy, Theorem 5.6.5, p. 262; Ismail,
  Theorem 2.2.6, p. 25);
- equivalently, `K_n(y, y)` is the maximum of `q(y)²` over the polynomials of degree `≤ n` with
  `∫ q² dμ = 1`.

Route: write `q = Σ_{ℓ≤n} c_ℓ p_ℓ`; the constraint is `Σ c_ℓ p_ℓ(y) = 1`, and Cauchy–Schwarz gives
`1 ≤ (Σ h_ℓ c_ℓ²)(Σ p_ℓ(y)²/h_ℓ)`.

*Needs:* 2.3, 4.2.

**Checks.**
- Lebesgue measure on `[−1, 1]`, `n = 1`, `y = 1`: `K₁(1, 1) = 2`, the minimizer is
  `q = (1 + 3x)/4` with `∫ q² dx = 1/2`, while `q = (1 + x)/2` gives `2/3`.
- `n = 0`: `1/K₀(y, y) = μ(ℝ)`, attained by `q = 1`.
- `kernelPolynomial μ p y 0 = p₀(y) p₀/h₀ = k₀²/h₀`, the constant `1/μ(ℝ)`.

### Examples

- The standard Gaussian measure, `n = 1`: `K₁(x, y) = 1 + xy`, and
  `(He₂(x) He₁(y) − He₁(x) He₂(y))/(x − y) = 1 + xy`.

### Dependencies

Layers 2–3.

## Layer 5: zeros and Gauss quadrature

### 5.1 Reality, simplicity and location

Define `zeros μ n i`, the `i`-th smallest root of `monic μ n`. For an orthogonality measure:
- the zeros are real and simple: `zeros μ n` is strictly increasing, each is a root, and
  `monic μ n = ∏_i (X − x_i)` (`zeros_spec`; Andrews–Askey–Roy, Theorem 5.4.1, p. 253; DLMF
  18.2.19);
- if `μ` is concentrated on `[a, b]` then every zero lies in `(a, b)` (`zeros_mem_Ioo`); in
  general the zeros lie in the interior of the convex hull of `supp μ` (Chihara, Ch. I,
  Theorem 5.2, p. 27; Gautschi, Theorem 1.19, p. 7).

Route: if `p_n` changed sign at fewer than `n` points of the hull, the product of `p_n` with the
polynomial vanishing at those points would have constant sign and zero integral.

*Needs:* 2.3.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `zeros μ 2 = (−1/√3, 1/√3)`.
- The weight `eˣ` on `[0, 1]`: `zeros μ 1 = (1/(e − 1)) = (0.58197670…)`, the mean of `μ/μ(ℝ)`.
- `δ₀ + δ₁` is not an orthogonality measure: `monic μ 2 = X² − X` has the zeros `0, 1`, on the
  support and not in `(0, 1)`.

### 5.2 The zeros as eigenvalues

The zeros of `p_n` are the eigenvalues of `J_n` (Gautschi, Theorem 1.31, p. 13; DLMF 18.2.18).
With the symmetric (orthonormal) Jacobi matrix of 3.4, `Matrix.IsHermitian.charpoly_eq` and 1.3
give the multiset of eigenvalues of `J_n` equal to the roots of `monic μ n`, and `zeros μ n` is the
increasing enumeration of `Matrix.IsHermitian.eigenvalues`.

*Needs:* 3.4, 5.1, Mathlib `Matrix.IsHermitian.charpoly_eq`.

**Checks.**
- `n = 2`, Lebesgue on `[−1, 1]`: `J₂ = ((0, 1/√3), (1/√3, 0))` has eigenvalues `±1/√3`.
- The standard Gaussian measure, `n = 3`: `J₃` has diagonal `0` and off-diagonal `1, √2`, with
  eigenvalues `0, ±√3`, the zeros of `He₃ = X³ − 3X`.

### 5.3 Gauss quadrature and the Christoffel numbers

Define `christoffelNumber μ n i = w_i = ∫ p_n(x)/((x − x_i) p′_n(x_i)) dμ(x)`, the integrand
being the polynomial `p_n /ₘ (X − x_i)` divided by `p′_n(x_i)`, and
`gaussMeasure μ n = Σ_i w_i δ_{x_i}`. For an orthogonality measure:
- `w_i > 0`, and `∫ q dμ = Σ_i w_i q(x_i)` for every `q` of degree `≤ 2n − 1`
  (`gauss_quadrature`; Andrews–Askey–Roy, Theorem 5.3.2, p. 250; Chihara, Ch. I, Theorem 6.1,
  p. 32; Ismail, Theorem 2.4.1, p. 28; Gautschi, Theorems 1.45–1.46, pp. 21–23; DLMF 18.2.37);
  the formula fails for `q = p_n²`;
- `w_i = 1/K_{n−1}(x_i, x_i)` for the monic kernel (`christoffelNumber_eq`; Andrews–Askey–Roy,
  Theorem 5.6.4, p. 261; Ismail, Theorem 2.4.2, p. 28), and `Σ_i w_i = μ(ℝ)`;
- `w_i = μ(ℝ) v_{i,0}²` for the first component of the normalized eigenvector of the orthonormal
  `J_n` at `x_i` (Gautschi, Theorem 3.1, p. 153);
- if `μ` is concentrated on `[a, b]`, so is `gaussMeasure μ n`;
- **moments from the Jacobi matrix:** `μ_k = μ₀ (J_N^k)₀₀` for the orthonormal `J_N` and every
  `k ≤ 2N − 1` (`moment_eq_jacobiMatrix_pow`; Andrews–Askey–Roy, Lemma 5.8.1, p. 268, for the
  matrix with `1` above the diagonal and `β_k` below it, which is diagonally similar to `J_N`).

Route: Lagrange interpolation at the zeros (`Lagrange.basis`) and division of `q` by `p_n`; the
moment formula from the spectral decomposition of `J_N` and the third bullet.

*Needs:* 4.1, 5.1, 5.2.

**Checks.**
- Lebesgue on `[−1, 1]`, `n = 2`: nodes `±1/√3`, weights `1, 1`.
- The weight `eˣ` on `[0, 1]`, `n = 4`: the weights `0.20695352, 0.48117108, 0.6261768, 0.40398043`
  equal `1/K₃(x_i, x_i)`; `∫ x⁷ eˣ dx = 0.30549003693` is reproduced, `∫ x⁸ eˣ dx` is not.
- Lebesgue on `[−1, 1]`, `N = 2`: `(J₂^k)₀₀ = 1, 0, 1/3, 0` for `k = 0, …, 3`, equal to `μ_k/μ₀`;
  at `k = 4 = 2N` it is `1/9`, while `μ₄/μ₀ = 1/5`.
- Mathlib's Chebyshev–Gauss formula (`Polynomial.Chebyshev.integral_eq_sumZeroes`) is the case
  `μ = measureT`, with all weights `π/n`.

### 5.4 Interlacing and separation

- The zeros of `p_n` and `p_{n+1}` strictly interlace:
  `x_i^{(n+1)} < x_i^{(n)} < x_{i+1}^{(n+1)}` (`zeros_interlace`; Chihara, Ch. I, Theorem 5.3,
  p. 28; Andrews–Askey–Roy, Theorem 5.4.2, p. 253; Gautschi, Theorem 1.20, p. 7; Schmüdgen,
  Proposition 5.32, p. 114).
- For `m < n`, between two zeros of `p_m` there is a zero of `p_n` (`exists_zero_between`;
  Andrews–Askey–Roy, Theorem 5.4.3, p. 253; Chihara, Ch. I, Theorem 6.2, p. 34).

Route: the sign of `p′_{n+1} p_n − p′_n p_{n+1}` (4.1) at consecutive zeros; for `m < n`, Gauss
quadrature (5.3) applied to `p_m` times a polynomial of degree `m − 2` that keeps its sign off the
gap.

*Needs:* 4.1, 5.1, 5.3.

**Checks.**
- Lebesgue measure on `[−1, 1]`: zeros of `P₂` are `±0.5773…`, of `P₃` are `0, ±0.7745…`.
- The standard Gaussian measure: the zeros `±1` of `He₂` lie between `−√3, 0, √3`, the zeros of
  `He₃`.

### 5.5 The Markov–Stieltjes inequalities and the convergence of Gauss quadrature

For an orthogonality measure, with the zeros `x_i` and the Christoffel numbers `w_i` of `p_n`:
- **Markov–Stieltjes:** `Σ_{i<j} w_i ≤ μ((−∞, x_j))` and `μ((−∞, x_j]) ≤ Σ_{i≤j} w_i` for every
  `j` (`markov_stieltjes`; Andrews–Askey–Roy, Theorem 5.4.4, p. 254, on a finite interval);
- **convergence:** if `μ` is concentrated on a bounded interval `[a, b]` and `f` is continuous on
  `[a, b]`, then `Σ_i w_i^{(n)} f(x_i^{(n)}) → ∫ f dμ` (`tendsto_gauss_quadrature`;
  Andrews–Askey–Roy, Theorem 5.3.3, p. 251).

Route: for the inequalities, Gauss quadrature (5.3) applied to the polynomials of degree
`2n − 2` that interpolate the indicator of `(−∞, x_j]` at the nodes with vanishing derivatives at
the nodes other than `x_j`; they lie above, or below, that indicator on all of `ℝ`, so no
bounded support is needed. For the convergence, Weierstrass approximation on `[a, b]` with
`Σ_i w_i = μ(ℝ)` and `w_i > 0`, or the weak convergence of `μ₀⁻¹ gaussMeasure μ n` (Tau Ceti
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`).

*Needs:* 5.3; Tau Ceti `WeakConvergence` (for the second route).

**Checks.**
- The weight `eˣ` on `[0, 1]`, `n = 4`, `j = 2` (third node, `x₂ = 0.6938376`):
  `0.6881246 ≤ μ([0, x₂]) = 1.0013814 ≤ 1.3143014`.
- The weight `eˣ` on `[0, 1]`, `f = √x` (continuous, not a polynomial): the Gauss sums for
  `n = 1, 2, 4, 6` are `1.3108325, 1.2646133, 1.2569626, 1.2560501`, tending to
  `∫ √x eˣ dx = 1.2556301`.
- The weights matter: with the nodes `0, ±√(3/5)` of `P₃` and equal weights `2/3`, the rule gives
  `4/5` for `∫ x² dx = 2/3`.

### 5.6 The discriminant

Auxiliary: for a field `K`, `c ≠ 0` and `x : Fin n → K`,
`disc(c ∏ (X − x_i)) = c^{2n−2} ∏_{i<j} (x_i − x_j)²` for Mathlib's `Polynomial.discr`
(`discr_eq_prod`), from `Polynomial.resultant_eq_prod_roots_sub`. Then
`disc(p_n) = k_n^{2n−2} ∏_{i<j} (x_i − x_j)² > 0` (`discr_pos`; Ismail, §3.4, p. 67; DLMF
18.2.20).

*Needs:* 5.1, Mathlib `Polynomial.discr`.

**Checks.**
- `disc(Heₙ) = ∏_{j=1}^{n} j^j` for Mathlib's `Heₙ`: `4, 108, 27648, 86400000` for
  `n = 2, 3, 4, 5`; `n = 2` agrees with `Polynomial.discr_of_degree_eq_two`.

### 5.7 A bound for monotonic weights

Let `b` be finite, `I` an interval with greatest point `b` (`I = [a, b]` or `I = (−∞, b]`) and
`w ≥ 0` nondecreasing on `I`, giving an orthogonality measure `w(x) dx` on `I`. For every
orthogonal system, `√w(x) |p_n(x)| ≤ √w(b) |p_n(b)|` for `x ∈ I` (`sqrt_weight_mul_abs_le`; DLMF
§18.2(xii), where it is credited to Szegő). The mirror statement holds for nonincreasing `w` on an
interval with least point `a` (`[a, b]` or `[a, ∞)`), with the maximum at `a`
(`sqrt_weight_mul_abs_le_of_antitoneOn`), by the reflection `x ↦ −x`.

*Needs:* 2.3, 5.3.

**Checks.**
- `w = eˣ` on `[0, 1]`, `w = (1 + x)²` on `[−1, 1]`, `w = √(x + 0.1)` on `[0, 2]`, `n = 1, …, 5`:
  the maximum over `[a, b]` is attained at `b`.
- `w = (1 + x)^β` on `[−1, 1]`, `β ≥ 0`: the Jacobi polynomials `P_n^{(0,β)}` attain
  `max |P_n^{(0,β)}| (1 + x)^{β/2} = 2^{β/2}` at `x = 1` (DLMF 18.14.3_5 at `α = 0`).
- `w = e^{−x}` on `[0, ∞)` (mirror): `e^{−x/2} |L_n(x)| ≤ L_n(0) = 1`, DLMF 18.14.8 at `α = 0`.

### Examples

- The standard Gaussian measure, `n = 2`: nodes `±1`, weights `½, ½`; `∫ x² dμ = 1 = ½ + ½`, while
  `∫ x⁴ dμ = 3 ≠ 1` (degree `2n`).

### Dependencies

Layers 1–4; Tau Ceti `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` (5.5).

## Layer 6: modifications of the measure

### 6.1 Kernel polynomials: multiplication by a linear factor

For an orthogonality measure, an orthogonal system and `y` with `x ≤ y` for `μ`-a.e. `x` (or
`y ≤ x` for `μ`-a.e. `x`):
- `|y − x| dμ(x)` is an orthogonality measure and `q_n = kernelPolynomial μ p y n` (4.3) is an
  orthogonal system for it (`isOrthogonal_kernelPolynomial`; Chihara, Ch. I, Theorem 7.1, p. 36;
  Andrews–Askey–Roy, Theorem 5.6.3 and Remark 5.6.1, p. 260; DLMF 18.2.15); Christoffel's
  theorem for a product of linear factors (Ismail, Theorem 2.7.1, p. 37) is the iterate;
- `q_n − q_{n−1} = (p_n(y)/h_n) p_n` for `n ≥ 1` (DLMF 18.2.16);
- `p_n(y) p_{n+1}(x) − p_{n+1}(y) p_n(x) = (h_n k_{n+1}/k_n)(x − y) q_n(x)`, for every `y`
  (`kernelPolynomial_mul_sub`; DLMF 18.2.17); this is 4.1 read as a polynomial identity.

*Needs:* 4.1, 4.3, 5.1 (for `p_n(y) ≠ 0`).

**Checks.**
- Lebesgue measure on `[−1, 1]`, `y = 1`:
  `∫ q_m q_n (1 − x) dx = 0` for `(m, n) = (1, 2), (0, 3), (2, 4)`;
  the `q_n(·; 1)` are multiples of the Jacobi polynomials `P_n^{(1,0)}`.
- `n = 0`: `q₀(·; y) = p₀(y) p₀/h₀ = k₀²/h₀`.
- The side condition on `y` is needed: for Lebesgue measure on `[−1, 1]` and `y = 0`,
  `q₁(·; 0) = P₀/h₀ + P₁(0) P₁/h₁ = ½` has degree `0`, not `1`.

### 6.2 Even measures and parity

Let `μ` be an orthogonality measure invariant under `x ↦ −x`. Then `p_n(−x) = (−1)ⁿ p_n(x)` for
`p_n = monic μ n` (`monic_comp_neg`), and for every orthogonal system, and `α_n = 0` (Chihara,
Ch. I, Theorem 4.3, p. 21; Gautschi, Theorem 1.17, p. 6; Schmüdgen, Proposition 5.38, p. 116;
DLMF 18.2.21).

Route: parity from uniqueness (2.2); `α_n = 0` from 3.3.

*Needs:* 2.2–2.3, 3.3.

**Checks.**
- Lebesgue measure on `[−1, 1]`: `monic μ 3 = X³ − 3X/5` is odd.
- The weight `eˣ` on `[−1, 1]` is not even, and `α₀ = coth 1 − 1 = 0.3130352855 ≠ 0`.

### 6.3 Reduction of an even measure by a quadratic substitution

For an even orthogonality measure `μ`:
- **`t = x²`:** `monic μ (2n) = r_n(X²)` and `monic μ (2n + 1) = X s_n(X²)`, where
  `r_n = monic (μ.map (x ↦ x²)) n` and `s_n = monic ((x² μ).map (x ↦ x²)) n` (`monic_even_odd`;
  Chihara, Ch. I, Theorem 8.1, p. 41; Gautschi, Theorem 1.18, p. 7). For `μ = w(x) dx` on `ℝ`
  with `v(x²) = w(x)`, `μ.map (x ↦ x²) = x^{−1/2} v(x) dx` and
  `(x² μ).map (x ↦ x²) = x^{1/2} v(x) dx` on `(0, ∞)` (DLMF 18.2.22).
- **`t = 2x² − 1`:** `monic μ (2n) = r_n(2X² − 1)` and `monic μ (2n + 1) = X s_n(2X² − 1)` with
  `r_n = 2^{−n} monic (μ.map (x ↦ 2x² − 1)) n` and
  `s_n = 2^{−n} monic ((x² μ).map (x ↦ 2x² − 1)) n` (`monic_even_odd_two_sq_sub_one`). For
  `μ = w(x) dx` on `(−1, 1)` with `v(2x² − 1) = w(x)`, the two image measures are constant
  multiples of `(1 + x)^{−1/2} v(x) dx` and `(1 + x)^{1/2} v(x) dx` (DLMF 18.2.23). No support
  condition is needed: `2t − 1` is affine in `t = x²`, so the statement is the first bullet
  composed with an affine change of variable.

Route: the even and odd parts are orthogonal by the change of variables `t = x²` (or
`t = 2x² − 1`) in the pairing; in the odd case the factor `x²` is the Christoffel modification of
6.1 at `y = 0`, which is how Chihara's Theorem 8.1 reads it.

*Needs:* 2.2–2.3, 6.2.

**Checks.**
- The weight `e^{−x⁴}` on `ℝ`: `α_n = 0`, and `r₁, r₂` are orthogonal for `t^{−1/2} e^{−t²}` on
  `(0, ∞)`, `s₀, s₂` for `t^{1/2} e^{−t²}`.
- The weight `(1 − x²)^{0.3}(1 + x²)` on `(−1, 1)`: `r₁, r₂` orthogonal for `(1 + t)^{−1/2} v(t)`.
- `He_{2n}(x) = (−2)ⁿ n! L_n^{(−1/2)}(x²/2)`: the Laguerre case of the first bullet.

### Examples

- Lebesgue measure on `[−1, 1]`: `μ.map (x ↦ x²)` is `t^{−1/2} dt` on `(0, 1)`, with mean `1/3`,
  so `r₁ = X − 1/3` and `monic μ 2 = X² − 1/3 = r₁(X²)`.

### Dependencies

Layers 2–5.

## Layer 7: the moment problem

### 7.1 The functional of a recurrence and its Gauss measures

Given `α : ℕ → ℝ` and `β` with `β_{n+1} > 0`, let `p_n = monicThreeTerm α β n`. Targets:
- the linear functional `L : ℝ[X] → ℝ` that sends `q` to its coefficient on `p₀` in the basis
  `(p_n)` (`Polynomial.Sequence.basis`) satisfies `L(p_m p_n) = δ_{mn} β₁ ⋯ β_n`, and `L(q²) > 0`
  for `q ≠ 0` (Chihara, Ch. I, Theorem 4.4, pp. 21–22; Schmüdgen, Theorem 5.10, p. 100);
- the zeros of `p_n` are real and simple (they are the eigenvalues of the symmetric matrix with
  diagonal `α_k` and off-diagonal `√β_k`, 1.3; Ismail, Theorem 2.2.3, p. 23; Simon (1998),
  Proposition 5.7, p. 52);
- there are positive weights `w_i^{(n)}` with `Σ_i w_i^{(n)} q(x_i^{(n)}) = L(q)` for
  `deg q ≤ 2n − 1`, the weight being the squared first component of the normalized eigenvector
  (Gautschi, Theorem 3.1, p. 153; Simon (1998), (5.37), p. 56, in spectral form: the truncated
  Jacobi matrix and the full one have the same moments `⟨δ₀, Aʲ δ₀⟩` for `j ≤ 2n − 1`).

Route for `L(p_m p_n)`: induction on `min(m, n)` through the recurrence.

*Needs:* 1.1, 1.3, Mathlib `Matrix.IsHermitian.eigenvalues`.

**Checks.**
- `α = 0`, `β = 1/4`: `L(q) = (2/π) ∫_{−1}^{1} q(x) √(1 − x²) dx`.
- `α = 0`, `β = 1/4`: `L(p₂²) = β₁β₂ = 1/16`.
- `n = 1`: the single node is `α₀` with weight `L(1) = 1`; `L` is normalized by `L(p₀) = 1`, so a
  measure with `μ(ℝ) ≠ 1` represents `μ(ℝ) L`.

### 7.2 Favard's theorem

- Auxiliary: if finite measures `ν_n` converge weakly to `μ` and `sup_n ∫ x^{2k} dν_n < ∞` for
  every `k`, then `∫ x^j dν_n → ∫ x^j dμ` for every `j`. Route: apply weak convergence to a
  continuous cutoff of `x^j` at `|x| = R`, and bound the tails uniformly in `n` by
  `R^{−j−2} ∫ x^{2j+2} dν_n`, since `|x|^j ≤ |x|^{2j+2}/R^{j+2}` for `|x| ≥ R`.

For every `α` and every `β` with `β_{n+1} > 0` there is a probability orthogonality measure `μ`
with `monic μ = monicThreeTerm α β` (`favard`; Chihara, Ch. II, Theorem 3.2, p. 58, with Ch. I,
Theorem 4.4, p. 21; Ismail, Theorem 2.5.2, p. 31; Schmüdgen, Theorem 5.10, p. 100; DLMF
§18.2(viii)). The same holds for the other forms of the recurrence: a system satisfying the first
form of 3.2 with `A_{n−1} A_n C_n > 0`, or the second form of 3.1 with `a_{n−1} c_n > 0`, or the
orthonormal form of 3.3 with `β_n > 0`, is orthogonal for some orthogonality measure.

Route: the Gauss measures `ν_n` of 7.1 have `∫ x² dν_n = L(x²)` for `n ≥ 2`, so they are tight;
Prokhorov's theorem (`isCompact_closure_of_isTightMeasureSet`) gives a weakly convergent
subsequence; since `∫ x^{2k} dν_n = L(x^{2k})` is bounded in `n`, the moments converge (the
auxiliary), so the limit `μ` has `∫ q dμ = L(q)` for all `q`; `L(q²) > 0` gives an infinite
support. Chihara and Ismail extract the limit by Helly's selection theorem instead.

*Needs:* 7.1, 2.2, Mathlib Prokhorov.

**Checks.**
- `α = 0`, `β = 1/4`: `μ = (2/π) √(1 − x²) dx`, `∫ p₂ p₃ dμ = 0`, `∫ p₂² dμ = 1/16 = β₁β₂`.
- `α_n = n`, `β_n = n + 1`: `L(p_m p_n) = δ_{mn} (n + 1)!`, the values `1, 2, 6, 24, 120`.

### 7.3 Hamburger's theorem

For `m : ℕ → ℝ`: `Δ_n(m) > 0` for every `n` iff `m` is the moment sequence of an orthogonality
measure (`exists_measure_iff_hankelDet_pos`; Chihara, Ch. II, Theorem 6.1, p. 72; Schmüdgen,
Theorem 3.8, p. 63, with Proposition 3.11, p. 65; Simon (1998), Theorem 1, p. 4).

Route: `⇐` is 2.4; `⇒` defines `β_n`, `α_n` by the formulas of 3.5, checks that
`monicThreeTerm α β` is orthogonal for the functional with moments `m`, and applies 7.2.

*Needs:* 2.4, 3.5, 7.2.

**Checks.**
- `m = (1, 0, 1, 0, 3, 0, 15, …)` (the Gaussian moments) has `Δ_n = ∏_{k<n} k!`.
- The moments `2, 1, 1, 1, …` of `δ₀ + δ₁` have `Δ₃ = 0`, matching its finite support.

### 7.4 Uniqueness

- Auxiliary: a finite measure `ν` and `M ≥ 0` with `∫ x^{2k} dν ≤ C M^{2k}` for all `k`: `ν` is
  concentrated on `[−M, M]`. Route: by Markov's inequality
  `ν(|x| ≥ M + ε) ≤ C (M/(M + ε))^{2k} → 0` for every `ε > 0`.
- Bounded coefficients: if `|α_n| ≤ A`, `B ≥ 0` and `0 < β_{n+1} ≤ B²`, the Favard measure is
  concentrated on `[−(A + 2B), A + 2B]` (Gershgorin for the symmetric Jacobi matrices, Mathlib
  `eigenvalue_mem_ball`, then 7.2) and is the only probability orthogonality measure with
  `monic μ = monicThreeTerm α β` (`favard_bounded`; Ismail, Theorems 2.5.4–2.5.5, p. 32). Route:
  Gershgorin and the auxiliary; uniqueness is also Simon (1998), Proposition 1.5, p. 6, since the
  moments are at most `(A + 2B)ᵏ`.
- If `μ` is concentrated on a bounded interval and `ν` is an orthogonality measure with
  `monic ν = monic μ`, then `ν = (ν(ℝ)/μ(ℝ)) μ` (`eq_smul_of_monic_eq`; Chihara, Ch. II,
  Theorem 5.6, p. 67; DLMF §18.2(viii)).

Route: equal monic polynomials give proportional moments (2.4, 3.5); the moments of `ν` then grow
at most like `M^{2k}`, so `ν` is concentrated on `[−M, M]`; two compactly supported measures with
equal moments are equal (`TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`).

*Needs:* 2.4, 3.5, 7.2, Tau Ceti `Determinacy`, Mathlib `eigenvalue_mem_ball`.

**Checks.**
- `α = 0`, `β = 1/4`: `A + 2B = 1`, and the support is `[−1, 1]`.
- `α_n = 1`, `β_n = 1` (`A = B = 1`): the moments `1, 1, 2, 4, 9, 21` are at most `3ᵏ`, and the
  support is `[−1, 3] ⊂ [−3, 3]`.

### Examples

- `α = 0`, `β_n = n`: the Favard measure is the standard Gaussian; `β` is unbounded, so
  `favard_bounded` does not apply, while 8.1 does, by the exponential moment.

### Dependencies

Layers 1–3, 5; Tau Ceti `Determinacy`; Mathlib Prokhorov.

## Layer 8: orthogonal expansions

### 8.1 Completeness and the orthogonal expansion

Let `μ` be an orthogonality measure with one finite exponential moment `∫ e^{a|x|} dμ < ∞`,
`a > 0` (in particular, `μ` concentrated on a bounded interval). Then the orthonormal polynomials
form a Hilbert basis of `L²(μ; 𝕜)` for `𝕜 = ℝ, ℂ`, whose `n`-th vector is `orthonormal μ n` almost
everywhere; for every `f ∈ L²(μ)`, `f = Σ_n λ_n p_n` in `L²(μ)` with `λ_n = h_n⁻¹ ∫ f p_n dμ` for
any orthogonal system `p`, and `Σ_n h_n |λ_n|² = ‖f‖²` (`hasSum_orthonormal_expansion`;
Andrews–Askey–Roy, Theorem 5.7.4, p. 264, on a finite interval; DLMF 18.2.24–18.2.25).

Route: `TauCeti.hilbertBasisOfOrthogonalSystem` with weight `1` and the completeness input
`TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot`.

*Needs:* 2.3, Tau Ceti `PolynomialCompleteness`, `WeightedOrthogonalBasis`.

**Checks.**
- The Gaussian measure: the basis is the normalized `Heₙ/√(n!)`, Tau Ceti's
  `TauCeti.gaussianHermiteHilbertBasis`.
- Lebesgue measure on `[−1, 1]`: the basis is `√((2n + 1)/2) P_n`.

### 8.2 The Poisson kernel

Define `poissonKernel μ p z x y = Σ_n (p_n(x) p_n(y)/h_n) zⁿ` for `z ∈ ℂ` (DLMF 18.2.41). Target:
when `Σ_n |z|ⁿ ∫ |p_n(x) p_n(y) p_m(y)|/h_n dμ(y) < ∞`,
`∫ P_z(x, y) p_m(y) dμ(y) = z^m p_m(x)` (`integral_poissonKernel_mul`); and when the series
converges in `L²(μ)` in `y`, its sum is the function whose `n`-th expansion coefficient (2.3) is
`zⁿ p_n(x)/h_n`.

Route: under the summability hypothesis the series may be integrated term by term (dominated
convergence), and orthogonality (2.3) leaves the term `n = m`.

*Needs:* 2.3.

**Checks.**
- Lebesgue measure on `[−1, 1]` with Legendre `P_n`: `|P_n| ≤ 1` on `[−1, 1]` and `h_n = 2/(2n + 1)`
  give the hypothesis for `x ∈ [−1, 1]` and every `|z| < 1`. For `|x| > 1` it holds when
  `|z| (|x| + √(x² − 1)) < 1`, and fails for some `|z| < 1`: at `x = 2`, `z = 0.9`, `m = 0` the
  terms are at least `0.9ⁿ |P_n(2)|`, and `|P_n(2)|^{1/n} → 2 + √3`.
- `z = 0`: `P₀(x, y) = k₀²/h₀` and `∫ P₀(x, y) p_m(y) dμ(y) = k₀ δ_{m0} = 0^m p_m(x)`, with
  `0⁰ = 1`.
- The standard Gaussian measure with `Heₙ`: `P_z(x, y)` is Mehler's kernel
  `(1 − z²)^{−1/2} exp((2xyz − (x² + y²)z²)/(2(1 − z²)))`; at `(x, y, z) = (0.3, −0.7, 0.4)` both
  are `0.9342031102`.

### Examples

- Lebesgue measure on `[−1, 1]`, `f = |x|`: the expansion coefficients `λ₀ = 1/2`, `λ₂ = 5/8`
  (on Legendre's `P_n`) give the partial sum `S₂ f` of 2.5, and `Σ_n h_n λ_n² = 2/3`.

### Dependencies

Layer 2; Tau Ceti `PolynomialCompleteness`, `WeightedOrthogonalBasis`.

## Layer 9: continued fractions and the Stieltjes transform

### 9.1 Associated polynomials as integrals, and their zeros

For an orthogonality measure, with the monic coefficients `alpha μ`, `beta μ`:
- for `z ∈ ℂ` with `x ≠ z` for `μ`-a.e. `x`,
  `p_n^{(1)}(z) = μ₀⁻¹ ∫ (p_{n+1}(z) − p_{n+1}(x))/(z − x) dμ(x)` (`aeval_associated`;
  Ismail, Theorem 2.3.2, p. 27, whose `P*_{n+1}` is `μ₀ p_n^{(1)}`; Andrews–Askey–Roy,
  Theorem 5.5.4, p. 258; Schmüdgen, Proposition 5.18, p. 106; DLMF 18.2.33);
- the `n` zeros of `p_n^{(1)}` are real, simple and interlace with the `n + 1` zeros of `p_{n+1}`
  (Chihara, Ch. III, Theorem 4.1, p. 86; Ismail, Theorem 2.3.1, p. 27; Simon (1998),
  Proposition 5.7, p. 52, whose `Q_N` is a multiple of `p_{N−1}^{(1)}`);
- for `μ` concentrated on `[a, b]` and all `k`, `j`, the zeros of
  `q_j^{(k)} = monicThreeTerm (α ∘ (· + k)) (β ∘ (· + k)) j` are real and lie in `(a, b)`
  (`associated_roots_mem_Ioo`; `k = 1` is Chihara, Ch. III, Theorem 4.2, p. 87, and general `k`
  follows by the same min–max argument): with `N = k + j`, they are the eigenvalues of the
  principal submatrix of the symmetric `J_N` (3.4) on the rows and columns `k, …, k + j − 1`,
  hence lie between the extreme eigenvalues of `J_N` (Rayleigh quotient), which are zeros of
  `p_N` (5.2) and lie in `(a, b)` (5.1).

*Needs:* 1.2, 3.3, 3.4, 5.1, 5.2.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: both sides of `aeval_associated` agree for
  `n = 0, …, 3` (`n = 2`: `1.959431816 + 1.508836788 i`; `n = 3`: `2.088826217 + 3.212018515 i`).
- `n = 0`: `p₀^{(1)} = 1`, and `(p₁(z) − p₁(x))/(z − x) = 1` for `p₁ = X − α₀`, so the right side
  is `μ₀⁻¹ μ₀ = 1`; without the factor `μ₀⁻¹` it would be `μ₀`.
- The Casoratian of 1.2 at a zero `x` of `p_{n+1}` gives `p_n(x) p_n^{(1)}(x) = β₁ ⋯ β_n > 0`,
  which is the sign alternation behind the interlacing.

### 9.2 The J-fraction as a partial fraction

For an orthogonality measure concentrated on `[a, b]` and `z ∈ ℂ \ [a, b]`:
`F_{n+1}(z) = p_{n+1}^{(0)}(z)/p_{n+1}(z) = p_n^{(1)}(z)/p_{n+1}(z) = μ₀⁻¹ Σ_i w_i/(z − x_i)`, with
the Christoffel numbers and zeros of `p_{n+1}` (`convs'_jFraction`; Chihara, Ch. III,
Theorem 4.3, p. 88; Andrews–Askey–Roy, Theorem 5.5.5, p. 258; Gautschi, Theorem 1.47, p. 23;
DLMF 18.2.35–18.2.36). Evaluating `convs'` from the tail divides by
`q_{j+1}^{(k)}(z)/q_j^{(k+1)}(z)`, where `q_j^{(k)}` is as in 9.1; these are nonzero off
`[a, b]` by the location of the zeros in 9.1.

Route: the continuants of 1.4 give the first equality; the partial fraction is Gauss quadrature
(5.3) applied to `aeval_associated`.

*Needs:* 1.4, 5.3, 9.1.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: `F₄ = 0.6389990416 − 0.2410064077 i` by both the
  continued fraction and `p₃^{(1)}/p₄`.
- `F₀ = 0` and `F₁ = 1/(z − α₀)`.
- `F₂ = (z − α₁)/((z − α₀)(z − α₁) − β₁) = p₁^{(1)}/p₂`.

### 9.3 Markov's theorem

For an orthogonality measure concentrated on a bounded interval `[a, b]`,
`F_n(z) → μ₀⁻¹ ∫ dμ(x)/(z − x)` uniformly on compact subsets of `ℂ \ [a, b]` (`markov`; Ismail,
Theorem 2.6.2, p. 36; Andrews–Askey–Roy, Theorem 5.5.6, p. 259, pointwise for real `x ∉ [a, b]`;
DLMF 18.2.38, pointwise). The limit is `−μ₀⁻¹ · resolventTransform μ z`.

Route: by 9.2, `F_n(z) = μ₀⁻¹ ∫ (z − x)⁻¹ d(gaussMeasure μ n)(x)`; the Gauss measures are
concentrated on `[a, b]` and agree with `μ` on polynomials of degree `≤ 2n − 1`, so they converge
weakly to `μ` (5.5), and `(z − x)⁻¹` is continuous on `[a, b]` uniformly for `z` in a compact set
off `[a, b]`.

*Needs:* 5.3, 5.5, 9.2, Tau Ceti `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`.

**Checks.**
- The weight `eˣ` on `[0, 1]`, `z = 2 + i/2`: `F₄ = 0.6389990416 − 0.2410064077 i` against the limit
  `0.6389985876 − 0.2410064428 i`.
- Lebesgue measure on `[−1, 1]`, `z = 2`: the limit is `½ log 3`.

### Examples

- Lebesgue measure on `[−1, 1]`, `z = 2`: `F₁ = ½`, `F₂ = 2/(11/3) = 6/11 = 0.5454…`, and the
  limit is `½ log 3 = 0.5493…`.

### Dependencies

Layers 1, 3, 5; Tau Ceti `WeakConvergence`.

## Layer 10: difference and differential operators

### 10.1 Forward and backward differences

`Δ_x f(x) = f(x + 1) − f(x)` is Mathlib's `fwdDiff 1 f`, and `Δ_x^{n+1} = Δ_x Δ_x^n` is the
iterate `(fwdDiff 1)^[n + 1]`. Define `bwdDiff h f x = f x − f (x − h)` over an additive group, so
`∇_x = bwdDiff 1` (Koekoek–Lesky–Swarttouw, (1.16.1)–(1.16.2), p. 26; DLMF §18.1(i)). Targets:
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

Route: induction, using Mathlib's `fwdDiff` API. The first three targets are the backward
counterparts of Mathlib's `fwdDiff_iter_eq_sum_shift`, `shift_eq_sum_fwdDiff_iter`,
`Polynomial.fwdDiff_iter_degree_eq_factorial` and `Polynomial.fwdDiff_iter_degree_add_one_eq_zero`,
proved through `bwdDiff h f x = fwdDiff h f (x − h)`. The Pochhammer differences follow from
Mathlib's `descPochhammer_succ_eval` and `ascPochhammer_succ_eval`
(`[x]_{k+1} = [x]_k (x − k)`, `(x)_{k+1} = (x)_k (x + k)`), and summation by parts is a
rearrangement of Mathlib's `Finset.sum_range_by_parts`.

*Needs:* Mathlib `fwdDiff`, `descPochhammer_succ_eval`, `ascPochhammer_succ_eval`,
`Finset.sum_range_by_parts`.

**Checks.**
- `∇² f(x) = f(x) − 2f(x − 1) + f(x − 2)`.
- `Δ [x]_2 = Δ (x² − x) = 2x = 2 [x]_1` and `∇ (x)_2 = ∇ (x² + x) = 2x = 2 (x)_1`.
- `∇ x² = 2x − 1`, while `Δ x² = 2x + 1`: the shift direction is fixed.

### 10.2 The central difference in the imaginary direction

`δ_x f(z) = (f(z + i/2) − f(z − i/2))/i` for `f : ℂ → ℂ` (`imCentralDiffFun`), and on complex
polynomials `imCentralDiff p = i⁻¹ (p(X + i/2) − p(X − i/2))` (DLMF §18.1(i); see Conventions for
the factor `i` against Koekoek–Lesky–Swarttouw (1.16.3)). Targets:
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

### 10.3 Sheffer sequences and delta operators

Define `derivativeAction v` and `IsSheffer p f u` (see [Conventions](#conventions)). Over a
`ℚ`-algebra:
- for `u` with `u(0) = 0`, `u′(0) = 1` and `v` its compositional inverse, `p` is Sheffer for some
  `f` with `f(0) = 1` iff `p₀ = 1`, `deg p_n = n` and `v(D) p_{n+1} = (n + 1) p_n` for all `n`
  (`isSheffer_iff`; Ismail, Theorem 10.1.4, p. 285, with `T = D` and `E(x; t) = e^{xt}`; DLMF
  18.2.45–18.2.46); and `v(D)` is a delta operator: it commutes with translations and `v(D) x` is
  a nonzero constant;
- Mathlib's Bernoulli polynomials are Sheffer with `u(t) = t` and `f(t) = Σ B_n tⁿ/n!`
  (`isSheffer_bernoulli`, from `Polynomial.bernoulli_generating_function`), and they are not
  orthogonal for any orthogonality measure (`not_isOrthogonal_bernoulli`; DLMF §18.2(xii));
- Mathlib's `Heₙ`, mapped to `ℚ[X]`, are Sheffer with `u(t) = t` and `f(t) = exp(−t²/2)`; the
  coefficients agree with Tau Ceti's analytic generating function
  `Polynomial.hasSum_hermite_generating_function`.

Route: `D` acts on `exp(x u(t))` as multiplication by `u(t)`, so `v(D)` acts as `v(u(t)) = t`.
Conversely, given `p`, put `f(t) = Σ_n p_n(0) tⁿ/n!` and let `s_n` be the polynomials generated by
`f(t) exp(x u(t))`; both `p` and `s` satisfy `v(D) q_{n+1} = (n + 1) q_n` and have the same values
at `0`, and `v(D)` lowers the degree by exactly one (`v₀ = 0`, `v₁ = 1`), so its kernel is the
constants and induction on `n` gives `p = s`. This is the uniqueness argument of Ismail,
Theorem 10.1.1, p. 283.

*Needs:* Mathlib `PowerSeries.subst`, `PowerSeries.substInvOfIsUnit`; for the non-orthogonality,
3.3.

**Checks.**
- Bernoulli: a monic three-term recurrence through `B₀, …, B₃` forces `α_n = 1/2`, `β₁ = 1/12`,
  `β₂ = 1/6`, `β₃ = 1/4`, and then the constant term of `(x − ½) B₃ − ¼ B₂` is `−1/24`, while
  `B₄(0) = −1/30`.
- Hermite: `v(t) = t`, `v(D) = D`, and `He′_{n+1} = (n + 1) Heₙ`.
- Bernoulli: `v(D) = D`, and the lowering relation is `B′_{n+1} = (n + 1) B_n`.

### 10.4 Semi-classical measures and structure relations

Define `IsSemiclassical μ π τ`: `π ≠ 0` and `∫ π q′ dμ = −∫ τ q dμ` for every polynomial `q` (the
Pearson equation `(π μ)′ = τ μ` in the sense of distributions). Let `d = deg π` and
`s = max(deg τ, d − 1)`. For an orthogonality measure:
- the structure relation `π p′_n = Σ_{j=n−s}^{n+d−1} a_{n,j} p_j` (`structure_relation`; DLMF
  18.2.44);
- lowering and raising forms with a fixed `π` and polynomial coefficients on `p_n` and `p_{n±1}`:
  there are polynomials `R_n`, `S_n`, `R̃_n`, `S̃_n` of degree `≤ max(d, deg τ)` with
  `π p′_{n+1} = R_n p_{n+1} + S_n p_n` and `π p′_n = R̃_n p_n + S̃_n p_{n+1}` (`lowering_raising`;
  Ismail, Theorem 3.2.1, (3.2.3), p. 54, and (3.2.10), p. 55, for `π = 1` and `w = e^{−v}`; DLMF
  18.2.42–18.2.43, which normalizes the second coefficient to a constant by letting `π_n` depend
  on `n`);
- weights: if `π ≠ 0` and `w ≥ 0` is differentiable on an open interval `(a, b)`
  (`−∞ ≤ a < b ≤ ∞`), with `(π w)′ = τ w` there, `x^k π(x) w(x) → 0` at both ends for every `k`,
  and `w` gives an orthogonality measure, then that measure is semi-classical for `(π, τ)`.

DLMF 18.2.44 records the structure relation as part of its definition of a semi-classical
measure. The derivation from the Pearson equation, with `W = π` and `2V = τ − π′`, is Magnus
(1995), §3, p. 8.

Route: `⟨π p′_n, p_j⟩ = −⟨p_n, τ p_j + π p′_j⟩` vanishes when `j + s < n`; for the lowering and
raising forms, rewrite each `p_j` through the recurrence (3.3) as a polynomial combination of
`p_n`, `p_{n+1}` (or `p_n`, `p_{n−1}`), as in Ismail's proof through the Christoffel–Darboux
formula.

*Needs:* 2.3, 3.3.

**Checks.**
- Hermite (`π = 1`, `τ = −x`): `He′_n = n He_{n−1}`.
- Laguerre weight `x^{1/2} e^{−x}` (`π = x`, `τ = 3/2 − x`): `x p′₄` has components only on
  `p₃` and `p₄` (`18` and `4` for the monic system).
- Freud weight `e^{−x⁴}` (`π = 1`, `τ = −4x³`, `s = 3`): `p′₅` has components only on `p₄` (`5`)
  and `p₂` (`0.755372`).
- `π = τ = 0` satisfies `(πw)′ = τw` for every `w`, and the hypothesis `π ≠ 0` of the weight
  criterion excludes it.

### Examples

- `Δ³ x³ = 3! = 6`, and `∇ x³ = 3x² − 3x + 1`.
- The Jacobi weight `(1 − x)^a (1 + x)^b`, `a, b > −1`, is semi-classical with `π = 1 − x²` and
  `τ = b − a − (a + b + 2)x`.

### Dependencies

Mathlib (10.1–10.3); Layers 2–3 (10.3 for the non-orthogonality, 10.4).

## Downstream consumers

- The roadmaps for the named families use every layer: the classical families (Jacobi, Laguerre,
  Hermite and their special cases) take their recurrence tables from Layers 1 and 3, their zeros
  and Gauss rules from Layer 5 and their quadratic transformations from 6.3; the hypergeometric
  families of the Askey scheme use the difference operators of 10.1–10.2 for the Hahn and Wilson
  classes and the Sheffer theory of 10.3 for Meixner's classification; the associated families
  use 1.2 and Layer 9.
- LaguerreJacobi defines the Laguerre, Jacobi and Gegenbauer polynomials and proves their
  orthogonality and `L²` bases; Layers 3–5 then give their recurrences, kernels, zeros and
  quadrature as instances.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material lies outside this roadmap. It is recorded only to fix the boundary.
Contributors should not attempt it under this roadmap.

- **The Szegő class and the Nevai class** (DLMF 18.2.39–18.2.40), with Szegő's asymptotic formulas
  and equiconvergence theorem and the Blumenthal–Nevai theorem on the essential support. These need
  Szegő's theory on the unit circle and Weyl's theorem on compact perturbations, and belong with a
  roadmap for polynomials orthogonal on the unit circle.
- **M. Riesz's theorem** that an orthogonality measure that is the only one with its moments gives
  a complete system, and the indeterminate moment problem (Nevanlinna parametrization, extremal
  measures; Schmüdgen, Chs. 6–7). These rest on the spectral theory of unbounded Jacobi operators.
- **Chain sequences** and the true interval of orthogonality (Chihara, Chs. III §§5–6 and IV).
- **Meixner's classification** of the orthogonal Sheffer polynomials (Ismail, Ch. 10): it needs the
  hypergeometric families, and belongs with the Askey scheme.
- **The nonnegativity of Poisson kernels** (Ismail, Theorem 4.7.12, p. 114) and the **converse of
  the structure relation** (a system with a structure relation is semi-classical in the Pearson
  sense of 10.4).
- **The Euler polynomials** `E_n` as a Sheffer system that is not orthogonal (DLMF §18.2(xii)),
  which needs the Euler polynomials; neither Mathlib nor Tau Ceti has them.
- **The `q`-Pochhammer symbols and infinite `q`-products** (DLMF §18.1(i)), which belong with the
  basic hypergeometric functions.
- **Modifications beyond a linear factor**: Uvarov's rational modifications and the Toda flow
  (Ismail, §§2.7–2.8), and Sobolev orthogonal polynomials (Gautschi, §1.7).

## Prior formalization

B. Braams' [`lean-DLMF`](https://github.com/bjbraams/lean-DLMF) (Apache-2.0) formalizes special
functions on top of Mathlib, Tau Ceti and [`lean-codes`](https://github.com/bjbraams/lean-codes),
drawing on DLMF and on the books listed under References. Its directory
`DLMF/OrthogonalPolynomials/` provides source material for Layers 1–7, 9 and 10: a predicate for an
orthogonal system of a measure, the three-term recurrence and Christoffel–Darboux formula, Gauss
quadrature, the zeros and interlacing, the reproducing kernel and kernel polynomials, the moments,
Hankel determinants and the determinant formulas, the corrected sign of 3.1, the discriminant, the
continued fractions of the classical families, and, from Andrews–Askey–Roy Ch. 5, the
Christoffel-number identities, the extremal property of 4.3, least squares (2.5), the
Markov–Stieltjes inequalities and the convergence of Gauss quadrature (5.5), the moments from the
Jacobi matrix (5.3), and Markov's theorem in locally uniform form. Several of these are still
admitted there, and they remain proof work here: Favard's theorem, the extremal property, least
squares, the Markov–Stieltjes inequalities, the convergence of Gauss quadrature, the moments from
the Jacobi matrix and Markov's theorem. The quadratic transformations and the Sheffer equivalence
are not stated there.

Mathlib pull requests that are prior art: #38496 (an algebraic Favard theorem for a
linear functional), #38485 (Hankel determinants through J-fractions), and #39498 (umbral operators
and delta operators on `R[X]`).

This roadmap specifies the mathematics intrinsically. `lean-DLMF` supplies prior proofs and
implementation references; reused code carries attribution under the repository's porting
guidance. The source serves as a reference, not as a specification. The following secondary
provenance map records source counterparts; the mathematical targets and dependencies are
specified by the layers.

| Layer | Counterpart in `lean-DLMF` (under `DLMF/OrthogonalPolynomials/`) |
|---|---|
| 1 | `Basic/Associated`, `OrthogonalPolynomials/SecondKindContinuedFraction` |
| 2 | `Basic/General`, `Basic/Definitions`, `Basic/NormsAndKernels`, `OrthogonalPolynomials/LeastSquaresProjection` |
| 3 | `Basic/General`, `OrthogonalPolynomials/GeneralIdentities`, `OrthogonalPolynomials/GeneralRecurrenceCoefficients` |
| 4 | `Basic/General`, `Basic/NormsAndKernels`, `OrthogonalPolynomials/QuadratureAndKernels` |
| 5 | `OrthogonalPolynomials/General`, `OrthogonalPolynomials/GeneralIdentities`, `OrthogonalPolynomials/QuadratureAndKernels`, `OrthogonalPolynomials/QuadratureError`, `OrthogonalPolynomials/SpectralMoments`, `BoundsZeros/Discriminants` |
| 6 | `OrthogonalPolynomials/GeneralIdentities`, `OrthogonalPolynomials/QuadratureAndKernels` |
| 7 | `OrthogonalPolynomials/General`, `OrthogonalPolynomials/MeasureConstruction` |
| 8 | `OrthogonalPolynomials/GeneralIdentities` |
| 9 | `OrthogonalPolynomials/Associated`, `OrthogonalPolynomials/ContinuedFractions`, `OrthogonalPolynomials/QuadratureAndKernels` |

## References

- G. E. Andrews, R. Askey and R. Roy, *Special Functions*, Encyclopedia of Mathematics and its
  Applications 71, Cambridge University Press, 1999, Chapter 5 (§§5.2–5.8).
- T. S. Chihara, *An Introduction to Orthogonal Polynomials*, Gordon and Breach, 1978,
  Chapters I–III.
- W. Gautschi, *Orthogonal Polynomials: Computation and Approximation*, Oxford University Press,
  2004, Chapter 1 (§§1.1–1.4) and §3.1.
- M. E. H. Ismail, *Classical and Quantum Orthogonal Polynomials in One Variable*, Encyclopedia of
  Mathematics and its Applications 98, Cambridge University Press, 2005, Chapters 2, 3 (§§3.2,
  3.4) and 10 (§10.1), and Theorem 4.7.12.
- R. Koekoek, P. A. Lesky and R. F. Swarttouw, *Hypergeometric Orthogonal Polynomials and Their
  q-Analogues*, Springer Monographs in Mathematics, Springer, 2010, §1.16.
- A. P. Magnus, Painlevé-type differential equations for the recurrence coefficients of
  semi-classical orthogonal polynomials, *J. Comput. Appl. Math.* 57 (1995), 215–237;
  arXiv:math/9307218, §3. Page numbers refer to the arXiv version.
- NIST *Digital Library of Mathematical Functions*, Release 1.2.8 of 2026-09-15, §§18.1–18.2
  (T. H. Koornwinder, R. Wong, R. Koekoek and R. F. Swarttouw), with Table 18.9.1 and 18.14.3_5,
  18.14.8 in the Checks, <https://dlmf.nist.gov/18>. Equation numbers refer to this release.
- K. Schmüdgen, *The Moment Problem*, Graduate Texts in Mathematics 277, Springer, 2017,
  Chapters 3 (§3.2) and 5 (§§5.1–5.6).
- B. Simon, The classical moment problem as a self-adjoint finite difference operator,
  *Adv. Math.* 137 (1998), 82–203; arXiv:math-ph/9906008, §§1, 2 and 5. Page numbers refer to the
  arXiv version.
