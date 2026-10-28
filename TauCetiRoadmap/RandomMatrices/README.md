# Roadmap: random matrices

**Summary.** This roadmap builds the reusable core of random matrix theory in
Anderson–Guionnet–Zeitouni (**AGZ**), Tao (**T**) and Potters–Bouchaud (**PB**), on Mathlib's
finite-dimensional spectral theory, probability, sub-Gaussian moment-generating functions and
resolvent transform. It builds sample-space extensions, empirical spectral measures and
deterministic spectral estimates, concentration inequalities, the moment and resolvent toolkit,
the named limiting laws, invariant ensembles and exact integration, free probability, deformed and
spiked models, determinantal point processes and Gaussian local statistics, logarithmic gases and
their large deviations, Dyson Brownian motion, and small singular values. Its end theorems are the
almost-sure semicircle, Marchenko–Pastur and circular laws, the Bai–Yin edge limits, the
Hanson–Wright and matrix Bernstein inequalities, the GOE/GUE eigenvalue densities, asymptotic
freeness of Wigner and Haar-conjugated families, the spiked-model phase transition, the sine and
Airy limits with the Tracy–Widom laws `F₁` and `F₂`, the speed-`n²` large deviation principle of
the beta gas, the hydrodynamic limit of Dyson Brownian motion, and the least-singular-value bound.
[Suggested.lean](Suggested.lean) states the headline theorems that are statable against the pinned
libraries; this README is the roadmap.

## Scope and ownership

The general ensembles are real symmetric or complex Hermitian Wigner matrices, rectangular
i.i.d. matrices and their sample covariances, non-Hermitian i.i.d. matrices, and independent
Haar conjugates of bounded deterministic Hermitian matrices. Exact densities cover Gaussian,
Laguerre, Jacobi, circular unitary and real-line beta ensembles. Local bulk and soft-edge limits
cover GOE and GUE; the free-probability development covers bounded self-adjoint variables and
their compactly supported laws. Covariance applications cover deterministic population
covariance, finite-rank spikes and the spectral oracle for squared Frobenius loss.

Outside the roadmap: general Wigner bulk/edge universality, hard-edge scaling limits, strong
operator-norm asymptotic freeness of arbitrary matrix polynomials, unbounded affiliated operators
and Brown measures, infinite-volume stochastic dynamics, replica analytic continuation, and the
finance, Bayesian-inference, spin-glass and matrix-Kesten models of PB. PB's cavity and
saddle-point calculations supply formulas; every formula included below has a rigorous limiting
statement.

Owned elsewhere and consumed here:

- [StandardDistributions](../StandardDistributions/README.md), Layers 0 and 3–6, owns scalar
  Gaussian, gamma and chi-squared laws, multivariate Gaussian laws, real symmetric coordinate
  Lebesgue measure, Cholesky/Bartlett theory and real Wishart distributions, including singular
  Gaussian-Gram laws (`wishartGramMeasure`). Its target 10.20 owns the unit-radius semicircle
  `(betaMeasure (3/2) (3/2)).map (2*·-1)` and its Layer 7 the affine images of a law; its target
  12.1 owns the uniform ball law `cond volume (ball c r)`. Here: the complex Gaussian-Gram
  counterpart, spectral pushforwards, the centre/variance semicircle family `semicircleReal`
  as an affine image of target 10.20, the circular law as the transport of target 12.1 to `ℂ`,
  and large-dimension limits. No second real Wishart measure and no second semicircle density
  are introduced.
- [OrthogonalL2Bases](../../Completed/OrthogonalL2Bases/README.md), Parts A–B, supplies Hermite
  polynomials and functions and moment determinacy, implemented in
  `TauCeti.Probability.Moments.*` and `TauCeti.Analysis.SpecialFunctions.Hermite.*`.
  Here: convergence from moments, polynomial-ensemble kernels and Hermite asymptotics.
- LaguerreJacobi, Parts A–D, owns the Laguerre and Jacobi polynomials over a `ℚ`-algebra, their
  recurrences and Rodrigues formulas (A3, C4), the measures `laguerreMeasure` and `jacobiMeasure`
  and their orthogonality relations with exact norms (B3, D3). Here: the Christoffel–Darboux
  kernels of the Laguerre and Jacobi unitary ensembles built from them, and their asymptotics.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md),
  Layer 0 and `weyl_integration_formula`, owns normalized Haar averaging and general compact-group
  Weyl integration. Here: matrix-coordinate Jacobians, explicit unitary-group specializations,
  eigenvalue/eigenprojector disintegrations and Haar entry integrals.
- [OptimalTransport](../OptimalTransport/README.md), Layers 0–3, owns couplings and Wasserstein
  distances. Here: the eigenvalue coupling and the spectral `W₁`/`W₂` corollaries.
- [Exchangeability](../Exchangeability/README.md) owns exchangeability and conditional-i.i.d.
  representation theory. Here: sample-space extensions that preserve an existing joint law.
- PointProcesses, Layers 0–6, owns configuration spaces `LocallyFiniteMeasure S` and
  `PointMeasure S` on locally compact Polish `S` with the vague topology, laws of random measures
  and their determination by Laplace functionals, factorial moment measures and correlation
  functions relative to a named reference measure, restriction and pushforward, and weak
  convergence of laws on configuration spaces. Here: determinantal point processes, their
  trace-class and Fredholm analysis, the Pfaffian formulas for GOE and the determinantal
  convergence criterion.
- [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md), PD-A51–PD-A53,
  owns the Courant–Fischer min–max formula, Loewner monotonicity of sorted eigenvalues and Weyl's
  operator-norm bound for symmetric endomorphisms of finite-dimensional inner-product spaces.
- [OperatorTheory/PrincipalAngles](../OperatorTheory/PrincipalAngles/README.md), PA-B40, owns the
  Hoffman–Wielandt inequality for symmetric endomorphisms against an orthonormal basis. Here: its
  matrix form through `Matrix.toEuclideanLin` and the singular-value analogue.
- [OperatorTheory/SpectralSubspacePerturbation](../OperatorTheory/SpectralSubspacePerturbation/README.md),
  SSP-D06, SSP-D13 and SSP-D14, owns the Hermitian dilation `[[0,A†],[A,0]]` of a rectangular
  map, its operator-norm perturbation identity and its spectral transfer to singular values.
- [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), OI-B01–OI-B19,
  OI-B23, OI-B29, OI-B30 and Part C, owns the operator-ideal carriers, the nuclear gauge, the
  trace-class family and its completeness, and the Hilbert–Schmidt column model. No second
  trace-class carrier is introduced.
- [SuccessiveMinima](../SuccessiveMinima/README.md), Layer 0, target 0.1.2,
  `hermitian_gram_hadamard`, owns Hadamard's bound for Hermitian Gram matrices.
- StochasticCalculus owns finite-dimensional Brownian motion (S1), predictable `L²` Brownian
  integration, continuous integral processes and localization (S3.2–S3.4), brackets
  (S4.1–S4.3), the `C²` Itô formula on open domains (S5.1), Lévy's characterization (S5.5), and
  strong, local and maximal solutions with Lyapunov nonexplosion (S9.1–S9.2).

## Conventions

1. **Probability and dimensions.** Use `Measure`, `IsProbabilityMeasure`, `HasLaw`,
   `IdentDistrib`, `iIndepFun` and `MeasurePreserving`. Public random matrices are measurable
   maps `Ω → Matrix (Fin p) (Fin n) 𝕜`, `𝕜 = ℝ` or `ℂ`, for Mathlib's entrywise measurable
   structure on matrices; almost-everywhere measurability is required where it suffices.
   Hermitian deterministic APIs take `Matrix.IsHermitian`. Spectral probability measures require
   positive dimension; an empty empirical finite measure is zero, never a probability.
2. **Order and norms.** Eigenvalues are Mathlib's decreasing `Matrix.IsHermitian.eigenvalues₀`,
   with multiplicity, `λ₁ ≥ ⋯ ≥ λₙ`; `λ_max` and `λ_min` are the largest and smallest.
   Singular values are Mathlib's decreasing `LinearMap.singularValues` of
   `Matrix.toEuclideanLin A`, and `s_min` of an `N × N` matrix is the one at index `N - 1`.
   Matrix norms in estimates are Euclidean operator norms (the `Matrix.Norms.L2Operator` scope);
   the Frobenius norm is `‖A‖_F = (∑ᵢⱼ |Aᵢⱼ|²)^(1/2)`. The default entrywise sup norm is never
   used silently.
3. **Trace and spectra.** `trₙ A = n⁻¹ trace A` and `L_A = n⁻¹ ∑ᵢ δ_{λᵢ(A)}`. The spectrum of
   a general complex matrix is the multiset of roots of its characteristic polynomial with
   algebraic multiplicity. The random measure `L_A`, its expectation `E L_A` and its law as a
   random element of `ProbabilityMeasure ℝ` or `ProbabilityMeasure ℂ` are distinct objects.
4. **Resolvent sign.** For `Im z > 0`, `R_A(z) = (A - zI)⁻¹` and `m_μ(z) = ∫ (x-z)⁻¹ dμ(x)`.
   Thus `Im m_μ(z) > 0` for a probability measure and `iy m_μ(iy) → -1`. This is Mathlib's
   `MeasureTheory.resolventTransform` with base field `ℝ` at `A = ℂ`, whose kernel is
   `resolvent z x = Ring.inverse (↑x - z)`. PB's `g(z) = ∫ (z-x)⁻¹ dμ(x)` equals `-m(z)`; the
   translation is proved before any R/S-transform or covariance formula of PB is used.
5. **Normalization.** Wigner matrices are `Hₙ = Wₙ/√n` with centred independent
   upper-triangular entries and `E|Wᵢⱼ|² = 1` off the diagonal. GOE has off-diagonal variance 1
   and diagonal variance 2 before division by `√n`; GUE has diagonal variance 1 and off-diagonal
   real and imaginary parts independent `N(0,1/2)`. A standard complex Gaussian is this circular
   scalar Gaussian of variance 1. A sample covariance is `S = XX*/n`, `X` of size `p × n`, with
   aspect ratio `y = p/n`.
6. **Convergence.** Weak convergence is the topology of `ProbabilityMeasure`, equivalently
   convergence of every bounded continuous test integral. In-probability statements allow the
   spaces `(Ωₙ,Pₙ)` to vary and mean convergence in probability of each bounded continuous test
   integral to its deterministic limit. Almost-sure statements place all matrices on one space;
   the Wigner, covariance and circular theorems are stated for the corners of one infinite i.i.d.
   array. No independence across matrix sizes is presumed unless stated. Every `O`, `o` and tail
   estimate quantifies its constants and their parameter dependence.

## Exact supplier contracts

### From Mathlib

- Spectra and norms: `Matrix.IsHermitian.eigenvalues`, `Matrix.IsHermitian.eigenvalues₀`,
  `Matrix.IsHermitian.eigenvalues₀_antitone` (`Mathlib/Analysis/Matrix/Spectrum.lean`);
  `Matrix.toEuclideanLin`, `Matrix.toEuclideanCLM` and the `Matrix.Norms.L2Operator` scope
  (`Mathlib/Analysis/CStarAlgebra/Matrix.lean`); `LinearMap.singularValues` and
  `LinearMap.singularValues_antitone` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`);
  `Matrix.charpoly`, `Polynomial.roots`; `Matrix.posSemidef_vecMulVec_star_self`.
- Measurable structure on matrices: the instance, `Matrix.measurable_iff` and the `BorelSpace`
  instance for countable index types (`Mathlib/Analysis/Matrix/MeasurableSpace.lean`).
- Laws and independence: `HasLaw`, `IdentDistrib`, `iIndepFun`, `MeasurePreserving`,
  `exists_hasLaw_indepFun` and `exists_iid` (`Mathlib/Probability/HasLawExists.lean`),
  `Mathlib/Probability/IdentDistribIndep.lean`.
- Concentration primitives: `HasSubgaussianMGF` (`Mathlib/Probability/Moments/SubGaussian.lean`,
  a structure recording integrability of `exp (t X)` for every `t` and `mgf X μ t ≤ exp (c t²/2)`;
  it implies mean zero), `Mathlib/Probability/Moments/MGFAnalytic.lean`.
- Laws: `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.betaMeasure`,
  `ProbabilityTheory.cond`, `Complex.volume_ball` (the unit disc has area `π`).
- Convergence: the topology of `ProbabilityMeasure`, `TendstoInDistribution`
  (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`), Prokhorov compactness
  (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`), the classical central limit theorem
  (`Mathlib/Probability/CentralLimitTheorem.lean`).
- `MeasureTheory.resolventTransform` and its analyticity
  (`Mathlib/MeasureTheory/Measure/ResolventTransform.lean`).
- Brownian motion (`Mathlib/Probability/BrownianMotion/Basic.lean`); it does not supply the Itô
  and stochastic-differential-equation toolkit, which comes from StochasticCalculus.

### From Tau Ceti

- `TauCeti.Probability.empiricalMeasureOfFintype` and `empiricalMeasureOfFintype_toMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`): the empirical probability measure of a
  nonempty finite family, with evaluation, integration, pushforward and measurability API.
- `TauCeti.Probability.Moments.*` (moment determinacy) and
  `TauCeti.Analysis.SpecialFunctions.Hermite.*` (Hermite polynomials and functions).

### From TauCetiRoadmap roadmaps

- StandardDistributions: Layers 0 and 3–6, `wishartGramMeasure`, target 10.20 (unit-radius
  semicircle), Layer 7 (affine images), target 12.1 (uniform ball law).
- OrthogonalL2Bases: Parts A–B.
- LaguerreJacobi: Parts A–D, with `laguerreMeasure`, `jacobiMeasure` and the orthogonality
  relations B3 and D3.
- RepresentationTheory/CompactGroups: Layer 0 and `weyl_integration_formula`.
- OptimalTransport: Layers 0–3. Exchangeability: the joint-law transport interface.
- PointProcesses: Layers 0–6.
- OperatorTheory/PolarDecomposition: PD-A51–PD-A53. OperatorTheory/PrincipalAngles: PA-B40.
  OperatorTheory/SpectralSubspacePerturbation: SSP-D06, SSP-D13, SSP-D14.
  OperatorTheory/OperatorIdeals: OI-B01–OI-B19, OI-B23, OI-B29, OI-B30 and Part C.
- SuccessiveMinima: target 0.1.2, `hermitian_gram_hadamard`.
- StochasticCalculus: S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2, with
  `timeMeasure`, `IsFilteredBrownian` and `IsStrongSolution`.

## How to read the build

Layer 0 makes probabilistic arguments invariant under enlarging the sample space. Layer 1 builds
spectral measures and the deterministic eigenvalue and resolvent estimates. Layers 2 and 3 rest
on Layers 0–1 and are independent of each other: Layer 2 proves concentration and norm bounds,
Layer 3 the transform toolkit and the named limiting laws. The finite combinatorial prerequisite
(noncrossing partitions) is independent of analysis and feeds Layers 3, 4 and 6. Layer 4 proves
the global laws of Wigner and sample-covariance matrices; Layer 5 the exact invariant ensembles.
Layer 6 builds free probability and asymptotic freeness on Layers 1, 3, 5 and the combinatorics;
Layer 7 deformed and spiked models on Layers 1–6. Layer 8 (point processes and Gaussian local
statistics) and Layer 9 (logarithmic gases and large deviations) rest on Layers 1, 3 and 5;
Layer 10 (Dyson Brownian motion) on Layers 0–3, 5–6 and StochasticCalculus; Layer 11 (small
singular values and the circular law) on Layers 0–5.

```text
Mathlib / Tau Ceti probability and spectral theory
  → 0 (extensions) → 1 (spectral API)
  → 2 (concentration) and 3 (transforms, laws)
finite noncrossing combinatorics → 3, 4, 6
0–3 → 4 (global laws)
0–3 + StandardDistributions + CompactGroups → 5 (exact ensembles)
1, 3, 5 + combinatorics → 6 (free probability)
1–6 → 7 (deformations, covariance, spikes)
1, 3, 5 + Hermite + LaguerreJacobi + PointProcesses + OperatorIdeals → 8 (local statistics)
1, 3, 5 → 9 (large deviations)
0–3, 5–6 + StochasticCalculus → 10 (Dyson Brownian motion)
0–5 → 11 (circular law)
```

For each new object the build supplies construction or existence, extensionality, measurability
or continuity, invariances, integration and evaluation, and the operations its layer uses. Each
limit theorem records the dimension sequence, the entry law and its moment assumptions, the
coupling across sizes, the normalization, the topology and the mode of convergence in its
statement, and every integrability requirement is proved before a moment, moment-generating
function or log-determinant is evaluated.

## Layer 0: probability arguments invariant under extension

**Sources:** T §1.1.

### 0.1 Product extensions

For a probability space `(Ω,P)` and a probability law `ν` on a standard Borel space `E`, construct
`Ω × E` with `P.prod ν`. Prove that the first projection is measure-preserving, that the second
coordinate has law `ν`, and that it is independent of the whole old random object `X ∘ Prod.fst`
for every measurable `X`. Include finite and countable families of new coordinates, repeated
extensions and reordering and association of products. Use `exists_hasLaw_indepFun` and
`exists_iid` where only a realization is needed. *Needs:* Mathlib `Measure.prod`, `HasLaw`,
`exists_hasLaw_indepFun`, `exists_iid`.

**Checks.**

- For dependent old variables `(X, Z) = (U, U)` with `U` uniform on `[0,1]` and a new coordinate
  `V`, the extension keeps `P(X∘fst = Z∘fst) = 1`; an extension preserving only the marginals
  of `X` and `Z` could give probability `0`.
- For `E` a point the extension is the identity up to the isomorphism `Ω × E ≃ Ω`.
- The second coordinate is independent of `X ∘ fst` but not of itself unless `ν` is a Dirac mass:
  for `ν = (δ₀+δ₁)/2`, `P(snd = 0, snd = 0) = 1/2 ≠ 1/4`.

### 0.2 Transport along measure-preserving maps

Transport joint laws, independence of subfamilies, integrability, moments, expectations, event
probabilities and almost-sure predicates through a measure-preserving map. Transport
conditional expectations for the pulled-back σ-algebra, with an explicit almost-everywhere
equality; include vector- and matrix-valued versions through their coordinates. For equal joint
laws, transport measurable functionals and probability bounds; state the single-variable
`IdentDistrib` corollaries separately. Equality of marginal laws is insufficient for assertions
involving several variables. *Needs:* §0.1; Mathlib `MeasurePreserving`, conditional expectation.

### 0.3 Independent copies and symmetrization

Supply independent-copy, symmetrization and coordinate-replacement lemmas. For centred
independent real `Xᵢ`, an independent copy `X'`, independent Rademacher signs `εᵢ` and convex `Φ`
with the needed integrability, prove `E Φ(∑ Xᵢ) ≤ E Φ(∑ (Xᵢ-X'ᵢ)) = E Φ(∑ εᵢ(Xᵢ-X'ᵢ))`.
Demonstrate preservation of joint relationships on a pair `(X,Z)` and a new copy independent of
both. A matrix quadratic-form symmetrization proof moves to an extension and returns an
inequality on the original space by these lemmas. *Needs:* §§0.1–0.2.

### Examples

For one Rademacher `X₁` and `Φ(x) = x²`: `E Φ(X₁) = 1`, `E Φ(X₁ - X'₁) = 2`, and
`E Φ(ε₁(X₁ - X'₁)) = 2`, so the symmetrization inequality holds with the constant lost.

### Dependencies

Mathlib only.

## Layer 1: spectral measures and deterministic estimates

**Sources:** T §1.3; AGZ Appendix A, §2.3.1; PB ch. 1.

### 1.1 Empirical and spectral measures

Define the empirical finite measure `|ι|⁻¹ ∑ᵢ δ_{xᵢ}` of a finite family indexed by an
arbitrary finite type; it is the zero measure for the empty family. For a nonempty index type it
is the measure underlying `TauCeti.Probability.empiricalMeasureOfFintype`, whose normalization,
evaluation, integration, pushforward from the uniform index law and measurability are reused; no
second empirical probability measure is built. Define `spectralMeasure A hA`, the empirical
spectral measure `L_A` of a Hermitian matrix of positive size, through that API, and
`eigenvalueMeasure A`, the empirical measure `n⁻¹ ∑ δ_z` over the roots of the characteristic
polynomial with algebraic multiplicity, for a general complex square matrix. *Needs:* Tau Ceti
`empiricalMeasureOfFintype`; Mathlib `Matrix.IsHermitian.eigenvalues`, `Matrix.charpoly`,
`Polynomial.roots`.

- The empirical finite measure has total mass one for a nonempty family and zero for the empty
  one, is invariant under reindexing by an equivalence, and behaves under concatenation as the
  mass-weighted average.
- It is measurable as a map into finite measures; `Fin n` families are a specialization.
- Specialize to Hermitian eigenvalues, singular values, squared singular values and complex
  characteristic roots; prove measurability of the root measure without choosing continuous
  ordered complex roots.
- For Hermitian `A`, `eigenvalueMeasure A` is the pushforward of `spectralMeasure A hA` along
  `ℝ → ℂ`.

**Checks.**

- For the family `(0, 0, 1)` the empirical measure gives `{0}` mass `2/3`; a definition counting
  distinct values would give `1/2`.
- `spectralMeasure` of `diag(1,-1)` and of `[[0,1],[1,0]]` are both `(δ₁+δ₋₁)/2`: the measure
  depends only on the spectrum, not on the basis.
- `eigenvalueMeasure [[0,1],[0,0]] = δ₀` with mass `1` at `0` (algebraic multiplicity `2`); a
  geometric-multiplicity count would give mass `1/2`.
- `eigenvalueMeasure [[0,-1],[1,0]] = (δ_i+δ_{-i})/2`, which is not supported on `ℝ`.
- For the empty family the empirical finite measure is `0`, not a probability measure.

### 1.2 Ordered eigenvalues and perturbation

Prove continuity and measurability of ordered Hermitian eigenvalues. Take the min–max formula,
eigenvalue monotonicity and the operator-norm eigenvalue bound from PD-A51–PD-A53 through the
comparison of their sorted eigenvalues with `Matrix.IsHermitian.eigenvalues₀` under
`Matrix.toEuclideanLin`. Prove the max–min formula, the additive Weyl inequalities
`λ_{i+j-1}(A+B) ≤ λᵢ(A)+λⱼ(B)`, Cauchy interlacing, and the rank perturbation bound
`sup_t |L_A(-∞,t] - L_B(-∞,t]| ≤ rank(A-B)/n`, with principal-minor and rectangular Gram
corollaries (AGZ Appendix A; T §1.3). *Needs:* PD-A51–PD-A53; Mathlib `eigenvalues₀`,
`Matrix.toEuclideanLin`.

Take the Hoffman–Wielandt inequality from PA-B40 through the same comparison and state its
matrix form `∑ᵢ |λᵢ(A)-λᵢ(B)|² ≤ ‖A-B‖_F²` for Hermitian `A, B` (with the standard basis as the
orthonormal basis). Prove its singular-value analogue and the singular-value form of the
operator-norm bound by applying PA-B40 and PD-A53 to Hermitian dilations, using SSP-D14 for the
spectral transfer and SSP-D13 for the norm identity. Deduce the Lipschitz estimate
`|∫ f dL_A - ∫ f dL_B| ≤ Lip(f) ‖A-B‖_F/√n` and the spectral Wasserstein bounds by exhibiting the
sorted eigenvalue coupling (AGZ Lemma 2.1.19, Lemma 2.3.3). *Needs:* PA-B40, PD-A53, SSP-D13,
SSP-D14; OptimalTransport Layers 0–3 for the Wasserstein corollaries.

**Checks.**

- `A = diag(1,0)`, `B = diag(0,1)`: sorted eigenvalues agree, so the Hoffman–Wielandt left side is
  `0 ≤ 2 = ‖A-B‖_F²`; pairing eigenvalues in the original diagonal order would give `2`.
- `A = diag(1,-1)`, `B = 0`: Hoffman–Wielandt is the equality `2 ≤ 2`.
- `A = diag(1,0,0,0)`, `B = 0`: the rank bound is the equality `1/4 = rank(A)/4`.
- Weyl with `i = j = 1`, `A = B = diag(1,0)`: `λ₁(A+B) = 2 ≤ 1 + 1`; with `A = diag(1,0)`,
  `B = diag(0,1)` it reads `1 ≤ 2`, strict.

### 1.3 Resolvents and moments

Develop the resolvent identity, Schur complements, the matrix determinant lemma and
Sherman–Morrison–Woodbury; take the Hermitian dilation of a rectangular matrix from SSP-D06. In
the upper half-plane prove invertibility of `A - zI`, `‖R_A(z)‖ ≤ 1/Im z`,
`m_{L_A}(z) = trₙ R_A(z)` and the Ward identity `∑ⱼ |Rᵢⱼ|² = Im Rᵢᵢ / Im z`, with rank-one update
and leave-one-row/column formulas. Prove `∫ x^k dL_A = trₙ(A^k)`, positivity and support
statements, equality of the nonzero spectra of `XX*` and `X*X`, the exact zero-mass correction
between their empirical probability measures, and uniform-integrability estimates from trace
powers. *Needs:* §1.1; SSP-D06; Mathlib `resolventTransform`.

**Checks.**

- `A = diag(1,-1)`, `z = i`: `m_{L_A}(i) = ½(1/(1-i) + 1/(-1-i)) = i/2 = tr₂ (A - iI)⁻¹`, with
  positive imaginary part; the opposite sign convention `(z-A)⁻¹` gives `-i/2`.
- Ward identity for `A = diag(1,-1)`, `z = i`, `i = 1`: `|R₁₁|² = 1/2 = Im R₁₁ / Im z`.
- `X = (1, i)` (`p = 1`, `n = 2`): `XX* = 2`, while `X*X` has eigenvalues `2, 0`; the empirical
  probability measures differ by the zero-mass correction `L_{X*X} = ½ L_{XX*} + ½ δ₀`.

### Examples

For `A = [[0,1],[1,0]]`: `trₙ A² = 1 = ∫ x² dL_A`, `‖R_A(i)‖ = 1/√2 ≤ 1`.

### Dependencies

Layer 0 for random versions; PD-A51–PD-A53, PA-B40, SSP-D06, SSP-D13, SSP-D14; OptimalTransport
Layers 0–3 for the transport corollaries; Tau Ceti `empiricalMeasureOfFintype`.

## Layer 2: concentration, replacement and norm bounds

**Sources:** T §§2.1–2.3, §3.2; AGZ §§2.3, 4.4.

### 2.1 Scalar inequalities and sub-exponential variables

Complete the scalar Hoeffding, Bernstein, Azuma–Hoeffding, McDiarmid and Efron–Stein
interfaces. For independent centred summands with `|Xᵢ| ≤ b` almost surely and `v = ∑ E Xᵢ²`,
Bernstein's two-sided bound is `2 exp(-t²/(2(v+bt/3)))` for `t > 0`. For bounded differences
`cᵢ`, McDiarmid's bound is `2 exp(-2t²/∑cᵢ²)`; a zero denominator is handled by the almost-sure
constant conclusion. Define a real random variable to be sub-exponential with parameter `K > 0`
when `exp(λ(X - EX))` is integrable and `E exp(λ(X - EX)) ≤ exp(K²λ²)` for every `|λ| ≤ 1/K`,
and prove the Bernstein inequality for independent sums of such variables. *Needs:* Mathlib
`HasSubgaussianMGF`, `mgf`.

**Checks.**

- `X ~ N(0,1)`: `E exp(λX) = exp(λ²/2) ≤ exp(K²λ²)` for all `λ` once `K² ≥ 1/2`, so Gaussians are
  sub-exponential.
- `X ~ Exp(1)`: `E exp(λ(X-1)) = e^{-λ}/(1-λ)` for `λ < 1` and `+∞` at `λ = 1`, so `X` is
  sub-exponential for `K` large enough but not sub-Gaussian.
- A Cauchy variable has no mean and is not sub-exponential for any `K`.

### 2.2 Logarithmic Sobolev and Poincaré inequalities

Define logarithmic Sobolev and Poincaré inequalities for probability measures on finite
Euclidean spaces, with `Ent_μ(f²) ≤ 2C ∫ ‖∇f‖² dμ`, where `Ent_μ(g) = ∫ g log g dμ - (∫ g dμ)
log(∫ g dμ)` for nonnegative integrable `g` with integrable `g log g` and `0 log 0 = 0`, and
`Var_μ(f) ≤ C ∫ ‖∇f‖² dμ`. Prove tensorization, the Gaussian inequalities (`C = 1` for the
standard Gaussian), Herbst's argument and extension from smooth to all Euclidean-Lipschitz
functions. Deduce `P(|F-EF| ≥ t) ≤ 2 exp(-t²/(2CL²))` for `L`-Lipschitz `F` under the
logarithmic Sobolev inequality. Prove Talagrand's convex-Lipschitz concentration for independent
coordinates supported in intervals of length at most 1, about a median and about the mean, with
absolute constants (AGZ §2.3, §4.4; T §2.1). *Needs:* Mathlib Gaussian measures and Bochner
integration.

**Checks.**

- Standard Gaussian on `ℝ`, `f(x) = e^{ax/2}`: `Ent(f²) = (a²/2) e^{a²/2}` and
  `2 ∫ f'² = (a²/2) e^{a²/2}`, so `C = 1` is attained and every `C < 1` fails.
- Standard Gaussian Poincaré with `f(x) = x`: `Var f = 1 = ∫ f'²`, equality at `C = 1`.
- `μ = (δ₀+δ₁)/2` on `ℝ` satisfies no Poincaré inequality: a smooth `f` equal to `0` near `0` and
  `1` near `1` has `Var_μ f = 1/4` and `∫ f'² dμ = 0`.

### 2.3 Spectral concentration and quadratic forms

Transfer these inequalities to eigenvalues and linear spectral statistics with Layer 1: for
Wigner coordinates with a uniform logarithmic Sobolev constant, obtain the `n²t²/Lip(f)²` exponent
for fluctuations of `∫ f dL_H` with its explicit normalization-dependent constant (AGZ Theorem
2.3.5).

Prove the Hanson–Wright inequality `hanson_wright`: there is an absolute `c > 0` such that for
independent real coordinates `Xᵢ`, each satisfying `HasSubgaussianMGF` with variance proxy `K`,
and every real square matrix `A`, `P(|XᵀAX - E XᵀAX| > t) ≤ 2 exp(-c min(t²/(K²‖A‖_F²),
t/(K‖A‖)))` for `t ≥ 0` (Rudelson–Vershynin 2013, Theorem 1.1, whose `ψ₂`-parameter is
comparable to `√K`). Supply the complex circular-coordinate version, decoupling of off-diagonal
terms, and conditional versions for a matrix independent of the vector. *Needs:* §§2.1, 0.3;
Mathlib `HasSubgaussianMGF`.

**Checks.**

- `A = E₁₂ + E₂₁`, Rademacher `X` (proxy `K = 1`): `XᵀAX = 2X₁X₂ = ±2`, so `P(|XᵀAX| > 1) = 1`,
  which forces `c ≤ 2 log 2` through `‖A‖_F² = 2`, `‖A‖ = 1`.
- `A = I`, Rademacher `X`: `XᵀX = n` is constant and the left side is `0`.
- `A = 0`: the left side is `0` for every `t ≥ 0`.

### 2.4 Nets and norms of rectangular matrices

Prove epsilon-net cardinality estimates for Euclidean spheres and the bilinear and quadratic net
reductions. For a `p × n` matrix with independent centred sub-Gaussian coordinates prove
`P(‖X‖ > CK(√p+√n+t)) ≤ 2exp(-ct²)` for `t ≥ 0`. For independent centred isotropic rows whose
every real linear form in direction `u` has sub-Gaussian proxy at most `K²‖u‖²`, prove
`√p - CK²(√n+t) ≤ s_min(X) ≤ s_max(X) ≤ √p + CK²(√n+t)` with probability at least
`1 - 2exp(-ct²)`; a negative lower bound makes no invertibility claim. *Needs:* §2.1; Mathlib
`LinearMap.singularValues`.

### 2.5 Gaussian integration by parts and replacement

Prove Gaussian integration by parts, real and complex Wick/Isserlis formulas, and a
finite-dimensional Lindeberg replacement inequality: replacing independent coordinates whose
moments match through degree `r` changes the expectation of a `C^(r+1)` test by a sum of
derivative bounds times `(r+1)`st absolute moments. Include localization and truncation versions
and resolvent differentiation formulas. *Needs:* Layer 0; Mathlib `gaussianReal`.

### 2.6 Trace inequalities and matrix concentration

Develop Golden–Thompson, Lieb concavity of `A ↦ tr exp(B + log A)` for positive-definite `A`, and
the independent matrix Laplace-transform bound. Deduce the Hermitian matrix Bernstein inequality
`matrix_bernstein`: for independent measurable random Hermitian `d × d` matrices `Xₖ` with
`E Xₖ = 0`, `‖Xₖ‖ ≤ L` and `v = ‖∑ E Xₖ²‖`, `P(‖∑ Xₖ‖ ≥ t) ≤ 2d exp(-(t²/2)/(v + Lt/3))` for
`t > 0` (Tropp 2012, Theorem 1.4, applied to `±Xₖ`). For independent `0 ≤ Yᵢ ≤ LI`, `L > 0`, set
`μ_max = λ_max(∑ E Yᵢ)`, `μ_min = λ_min(∑ E Yᵢ)` and prove matrix Chernoff: the probability of
`λ_max(∑ Yᵢ) ≥ (1+δ)μ_max` is at most `d[e^δ/(1+δ)^(1+δ)]^(μ_max/L)` for `δ ≥ 0`, and the
probability of `λ_min(∑ Yᵢ) ≤ (1-δ)μ_min` is at most `d[e^(-δ)/(1-δ)^(1-δ)]^(μ_min/L)` for
`0 < δ < 1`; `L = 0` is handled directly. Give rectangular Bernstein through the Hermitian
dilation of SSP-D06. These are theorems under summand hypotheses, not consequences of an assumed
matrix moment-generating-function estimate. *Needs:* §2.1; SSP-D06, SSP-D13; Mathlib matrix
exponential and continuous functional calculus.

**Checks.**

- `d = 1` recovers the scalar two-sided Bernstein bound of §2.1.
- `Xₖ = εₖ Eₖₖ`, `d = m`, Rademacher `εₖ`: `‖∑ Xₖ‖ = 1`, `v = 1`, `L = 1`; at `t = 1` the bound
  `2m e^{-3/8} ≥ 1` is consistent with probability `1`.
- `L = 0` forces `Xₖ = 0`; the left side is `0` for `t > 0`, and `d = 0` gives `0` for `t > 0`,
  which is why `t > 0` is required.

### Examples

For `n` independent Rademacher signs, Hoeffding gives `P(|∑ εᵢ| ≥ t) ≤ 2exp(-t²/(2n))`; at
`n = 1`, `t = 1` the probability is `1 ≤ 2e^{-1/2} ≈ 1.21`.

### Dependencies

Layers 0–1; SSP-D06, SSP-D13; Mathlib `HasSubgaussianMGF`.

## Layer 3: transforms, moments and named spectral laws

**Sources:** AGZ §§2.1.1, 2.4; T §§2.2, 2.4; PB §§2.3, 4.2.

### 3.1 The resolvent transform

Extend `resolventTransform` with imaginary-part positivity, conjugation, affine scaling,
total-mass asymptotics, uniqueness and Stieltjes inversion, including the half-atom terms at
interval endpoints. Prove `μ{a} = lim_{η↓0} η Im m_μ(a+iη)` and the density formula wherever the
boundary limit is continuous. For a probability measure with finite moment `m_k = ∫ x^k dμ`
for `k ≤ r`, prove the finite expansion at infinity
`m_μ(z) = -∑_{k<r} m_k z^(-k-1) + R_r(z)` with `|R_r(z)| ≤ ∫|x|^r dμ / (|z|^r Im z)` for
`Im z > 0`. *Needs:* Mathlib `resolventTransform`.

**Checks.**

- `μ = δ₀`: `m(z) = -1/z`, the expansion has `R_1 = 0`, and `η Im m(iη) = 1 = μ{0}`.
- `μ = (δ₋₁+δ₁)/2`: `m(z) = z/(1-z²)`, and Stieltjes inversion recovers mass `1/2` at `±1`.
- The remainder bound at `r = 1`, `μ = δ₁`, `z = i`: `|m(i) + 1/i| = |1/(1-i) - i| = 1/√2 ≤ 1`.

### 3.2 Weak convergence from transforms and moments

Prove that weak convergence of probability measures on `ℝ` is equivalent to convergence of the
transforms on the upper half-plane to the transform of a probability measure, with a countable
determining set, the normal-family argument, and random in-probability and almost-sure versions.
Prove that moment convergence implies weak convergence when the limiting moments determine a
probability measure, using tightness and higher moments to pass through unbounded monomials, with
compact-support and exponential-moment sufficient conditions from the determinacy API (AGZ
Theorem 2.4.4, Lemma 2.1.19 setting). *Needs:* §3.1; Tau Ceti moment determinacy; Mathlib
Prokhorov compactness.

### 3.3 Semicircle laws

Define `semicircleReal a v`, `v : ℝ≥0`, as the image of the unit-radius semicircle of
StandardDistributions target 10.20 under `y ↦ a + 2√v y`. *Needs:* StandardDistributions
target 10.20 and Layer 7; Mathlib `betaMeasure`.

- For `v > 0` its density is `(2πv)⁻¹ √(4v-(x-a)²)` on `[a-2√v, a+2√v]`; for `v = 0` it is `δ_a`.
- It is a probability measure, measurable in `(a, v)`, with mean `a` and variance `v`, and
  `semicircleReal a v` maps to `semicircleReal (c a + b) (c² v)` under `x ↦ c x + b`.
- For the standard law odd moments vanish and moment `2k` is the Catalan number `C_k`.
- The transform `m` of `semicircleReal 0 1` satisfies `m² + zm + 1 = 0`, the branch fixed by
  `Im m > 0` and `zm(z) → -1`; square roots are defined analytically off the support, not as a
  pointwise choice of quadratic root.

**Checks.**

- Total mass at `a = 0`, `v = 1`: `(2π)⁻¹ · (area of a half disc of radius 2) = (2π)⁻¹ · 2π = 1`.
- The fourth moment of `semicircleReal 0 1` is `2 = C₂`; a radius-1 normalization would give
  variance `1/4` instead of `1`.
- `z = i`: `m = i(√5-1)/2 ≈ 0.618 i` solves `m² + im + 1 = 0` with `Im m > 0`; the other root
  `-i(√5+1)/2` has negative imaginary part.
- `v = 0` gives `δ_a`, the pushforward under a constant map.

### 3.4 Marchenko–Pastur laws

Define `marchenkoPastur y`, `MP_y`, for `y > 0` with edges `a = (1-√y)²`, `b = (1+√y)²`, atom
`(1-1/y)₊ δ₀` and density `√((b-x)(x-a))/(2πyx)` on `(a,b)`; set `MP_0 = δ₁`. *Needs:* the
finite combinatorial prerequisite for the moments; §3.1.

- It is a probability measure with support `[a,b]`, together with `{0}` when `y > 1`, and mean 1.
- Its moments are `∑_{π ∈ NC(k)} y^(k-|π|)` for `k ≥ 1`, through the noncrossing partitions of
  the combinatorial prerequisite.
- Its transform satisfies `yz m² + (z+y-1)m + 1 = 0` with the upper-half-plane branch.
- `y ↦ MP_y` is weakly continuous on `y ≥ 0`.

**Checks.**

- `y = 1`: `a = 0`, `b = 4`, no atom, and `(2π)⁻¹ ∫₀⁴ √((4-x)/x) dx = (2π)⁻¹ · 2π = 1`.
- Second moment `1 + y`, from `NC(2) = {{1},{2}}, {{1,2}}`; at `y = 1` it is `2`.
- `y = 2`: atom `1/2` at `0` and continuous mass `1/2 = 1/y`.
- `y = 1`, `z = 2`: `2m² + 2m + 1 = 0` has root `m = -1/2 + i/2` with positive imaginary part.

### 3.5 Circular and quarter-circle laws

Define `circularLaw`, the uniform probability measure `π⁻¹ 1_{|z|<1} d(area)` on the unit disc of
`ℂ`, as `cond volume (ball 0 1)`, the transport of the uniform ball law of StandardDistributions
target 12.1 to `ℂ`, and the quarter-circle law `π⁻¹ √(4-s²) ds` on `[0,2]`. Prove support,
moments and mixed moments, rotational invariance, and that the square of a quarter-circle
variable has law `MP_1`. *Needs:* StandardDistributions target 12.1; Mathlib `ProbabilityTheory.cond`,
`Complex.volume_ball`.

**Checks.**

- `circularLaw` has total mass `π · 1²/π = 1`, `∫ |z|² = 1/2`, and `∫ |z|^(2k) = 1/(k+1)`.
- `∫ z^k d circularLaw = 0` for `k ≥ 1` by rotation invariance, while `∫ |z|² ≠ 0`.
- The quarter-circle law has mass `π⁻¹ · π = 1` and second moment `1 = ∫ x dMP_1`.

### Examples

The low-degree identities used downstream: `E trₙ H² → 1`, semicircle fourth moment `2`, `MP_y`
first moment `1` and second moment `1 + y`, and `MP_y`'s atom `1 - 1/y` at zero for `y > 1`.

### Dependencies

Layers 0–1; the finite combinatorial prerequisite; StandardDistributions target 10.20, Layer 7
and target 12.1; Tau Ceti moment determinacy.

## Layer 4: Wigner and sample-covariance global laws

**Sources:** AGZ §§2.1–2.4; T §§2.3–2.4; PB chs. 2–4; Bai 1999 §§2.1–2.2.

### 4.1 Constructors

Define `wignerMatrix ξ η n ω`, the normalised Wigner matrix `Wₙ/√n` of the top-left `n × n`
corner of an infinite array, with complex entries `ξ` indexed by the strictly upper positions
`StrictUpper`, their conjugates below the diagonal and real diagonal entries `η`; prove
`wignerMatrix_isHermitian`. Define `sampleCovariance X = XX*/n` and prove
`sampleCovariance_isHermitian`. Provide law characterizations for independent upper-triangular
entries with a separate diagonal law, the real-to-complex embedding, i.i.d. rectangular
ensembles, and independence of a minor and the removed row's off-diagonal entries. Centring and
Hermitian symmetry are hypotheses, not consequences of identically distributed entries.
*Needs:* Layer 0; Mathlib `HasLaw`, `iIndepFun`.

**Checks.**

- `n = 2`: `wignerMatrix ξ η 2 ω = 2^(-1/2) [[η₀, ξ₀₁],[conj ξ₀₁, η₁]]`, Hermitian.
- With `E|ξ|² = 1` and diagonal second moment `E η² = σ²`: `E trₙ H² = (nσ² + n(n-1))/n² → 1`;
  the normalization `Wₙ/n` would give `0`.
- `sampleCovariance` of `X = (1, i)` is `(1+1)/2 = 1`, and `E tr_p S = 1` for unit-variance
  entries.

### 4.2 Moment method

Develop trace-word expansions, equivalence under vertex relabelling, walks allowing loops, the
vanishing of singleton-edge contributions, leading tree/double-traversal terms, Catalan
enumeration and connected two-trace bounds. Prove convergence of expected normalized moments and
`O_k(n⁻²)` normalized-trace variance bounds under uniformly bounded moments of every order, with
constants depending only on `k` and those bounds. Build both the closed-walk and the
noncrossing-pairing descriptions and their leading-term bridge (AGZ §2.1, Lemma 2.1.6). *Needs:*
§4.1; the finite combinatorial prerequisite.

### 4.3 Semicircle law

Prove the semicircle law in probability under triangular-array hypotheses: centred independent
upper-triangular entries, off-diagonal second absolute moments 1, `n⁻² ∑ᵢ E|Wᵢᵢ|² → 0`, and for
every `ε > 0`, `n⁻² ∑ᵢⱼ E[|Wᵢⱼ|² 1_{|Wᵢⱼ|>ε√n}] → 0`, with the truncation, recentring and variance
renormalization estimates (AGZ Theorem 2.1.21). Prove `wigner_semicircle_ae`: for i.i.d. complex
upper entries of mean zero and `E|ξ|² = 1`, an independent i.i.d. real diagonal of finite second
moment, and the corners of one infinite array, almost surely the empirical spectral measures
converge weakly to `semicircleReal 0 1` (T Theorem 2.4.2; Bai 1999, Theorem 2.1). No fourth
moment is required for the global law. Provide the resolvent proof's self-consistency estimate,
fluctuation bound, stability and uniqueness argument in the upper half-plane, and the
identification with §3.3. *Needs:* §§4.1–4.2, 1.2, 3.2, 3.3.

### 4.4 Marchenko–Pastur law

Prove Marchenko–Pastur convergence in probability, and `marchenkoPastur_ae`: for the top-left
`p(n) × n` corners `Xₙ` of an infinite real or complex i.i.d. array with mean zero and second
absolute moment 1, `p(n) ≥ 1` and `p(n)/n → y ∈ (0,∞)`, almost surely the empirical spectral
measures of `XₙXₙ*/n` converge weakly to `MP_y` (Bai 1999, Theorem 2.5). Include rectangular
trace-word counting and a resolvent self-consistency proof with the exact atom at zero and the
companion transform identity, and identify the Gaussian case with the real and complex Wishart
constructions. *Needs:* §§4.1–4.2, 1.3, 3.4; StandardDistributions `wishartGramMeasure`.

### 4.5 Edge limits

Prove `wigner_extreme_eigenvalues_ae`: for i.i.d. complex upper entries of mean zero, variance 1
and finite fourth moment, and an independent i.i.d. real diagonal of finite second moment,
`λ_max(Hₙ) → 2` and `λ_min(Hₙ) → -2` almost surely (Bai 1999, Theorem 2.12, and its reflection
`W ↦ -W`; T Theorem 2.3.24 for the real upper bound). Prove
`sampleCovariance_extreme_eigenvalues_ae`: under the hypotheses of §4.4 and a finite fourth
moment, `λ_max(S) → (1+√y)²` almost surely, and for `0 < y < 1` the least eigenvalue tends to
`(1-√y)²` (Bai 1999, Theorems 2.15–2.16). For `y > 1` the least eigenvalue is zero and the least
positive eigenvalue tends to `(√y-1)²`; at `y = 1` the least eigenvalue tends to zero. Supply the
growing-moment enumeration, truncation and summable exceptional-probability estimates.
*Needs:* §§4.2–4.4.

### Examples

At `y = 1/4`: `MP_y` lives on `[1/4, 9/4]` and the covariance edges are `1/4` and `9/4`; the
Wigner edges `±2` are the endpoints of the support of `semicircleReal 0 1`.

### Dependencies

Layers 0–3; the finite combinatorial prerequisite; StandardDistributions `wishartGramMeasure`.

## Layer 5: invariant ensembles and exact integration

**Sources:** AGZ §§2.5, 4.1, 4.5.1; T §2.6; PB chs. 3, 5–7 and §10.5.

### 5.1 GOE and GUE

Define `gaussianEnsemble β n g`: for `β = 1` the real symmetric matrix with entries `g(i,j)` off
the diagonal and `√2 g(i,i)` on it, otherwise the Hermitian matrix with `(g(i,j) + i g(j,i))/√2`
above the diagonal and `g(i,i)` on it, all divided by `√n`; prove `gaussianEnsemble_isHermitian`.
With standard Gaussian coordinates it is GOE (`β = 1`) or GUE (`β = 2`) in the normalization of
the Conventions. Prove the density of these laws on the real self-adjoint space, orthogonal and
unitary conjugation invariance, and equivalence of the entry and invariant-density
characterizations. For the complex Hermitian space use product Lebesgue measure in diagonal real
and upper off-diagonal real and imaginary coordinates and prove its relation to the
trace-inner-product volume. Construct real and complex Ginibre and Gaussian Gram laws.
*Needs:* StandardDistributions Layers 3 and 6 (real symmetric coordinate Lebesgue measure);
Mathlib `gaussianReal`, `Measure.pi`.

**Checks.**

- `n = 1`, `β = 2`: the matrix is `g(0,0) ~ N(0,1)`; `β = 1`: `√2 g(0,0) ~ N(0,2)`.
- `E trₙ H² = 1` for GUE and `1 + 1/n` for GOE (diagonal variance `2/n`).
- The `β = 1` matrix is real; the `β = 2` matrix at `n = 2` has `Im H₀₁ = g(1,0)/2 ≠ 0` in general.

### 5.2 Spectral change of variables and eigenvalue densities

Prove the spectral change of variables, with the repeated-eigenvalue null set, the eigenvector
phase/sign stabilizer, multiplicity `n!` and the normalized Haar factor. Prove
`gaussianEnsemble_eigenvalue_density`: for `β ∈ {1, 2}` the decreasing eigenvalue vector of
`gaussianEnsemble β n` has density `n! Z⁻¹ exp(-βn∑xᵢ²/4) ∏_{i<j}|xᵢ-xⱼ|^β` on the decreasing
chamber, with the Gaussian Selberg integral
`Z = (βn/2)^(-n/2-βn(n-1)/4) (2π)^(n/2) ∏_{j=1}^{n} Γ(1+jβ/2)/Γ(1+β/2)`
(AGZ Theorem 2.5.2 and (2.5.4), rescaled by `√n`); the unordered density on `ℝⁿ` is `Z⁻¹` times
the same expression. Eigenprojectors and eigenflags have an invariant law independent of the
eigenvalues; a deterministically phased eigenvector matrix is not itself Haar distributed.
*Needs:* §5.1; RepresentationTheory/CompactGroups Layer 0 and `weyl_integration_formula`.

**Checks.**

- `n = 1`, `β = 2`: `Z = √(2π)` and the density is `e^{-x²/2}/√(2π)`; `β = 1`: `Z = 2√π` and the
  density is that of `N(0,2)`.
- `n = 2`, `β = 2`: `Z = 2⁻² · 2π · (1!·2!) = π`, matching `∫∫ e^{-(x²+y²)}(x-y)² dx dy = π`.
- `n = 2`, `β = 1`: `Z = 2π/Γ(3/2) = 4√π`, matching `∫∫ e^{-(x²+y²)/2}|x-y| dx dy = 2π · 2/√π`.
- Dropping the factor `n!` on the chamber gives total mass `1/n!`.

### 5.3 Laguerre, Jacobi and beta ensembles

Construct Laguerre and Jacobi eigenvalue laws for `β = 1, 2` as pushforwards of Gaussian Gram
matrices and of ratios `(A+B)^(-1/2) A (A+B)^(-1/2)` of two independent full-rank Gram matrices,
with both sample sizes at least the dimension. Prove densities, support and exact Gamma-product
normalizations; in the singular Wishart cases give the deterministic zero eigenvalues and the
nonzero companion law. Define the normalized real-line Hermite and Laguerre beta densities for
every `β > 0`, construct their independent chi/Gaussian tridiagonal and bidiagonal models, and
prove the Dumitriu–Edelman spectral identities with the spectral-weight variables and their
Dirichlet law (AGZ §4.5.1). *Needs:* §5.2; StandardDistributions Layers 3–6.

**Checks.**

- Laguerre, `β = 2`, `p = n = 1`: the eigenvalue is `|x|²` for a standard complex Gaussian `x`,
  with law `Exp(1)`.
- Jacobi, `β = 2`, dimension 1, sample sizes `m₁, m₂`: the eigenvalue `a/(a+b)` with
  `a ~ Gamma(m₁)`, `b ~ Gamma(m₂)` independent has law `Beta(m₁, m₂)`.
- The Hermite beta density at `β = 2` coincides with the GUE density of §5.2.

### 5.4 Circular unitary ensemble, Ginibre and HCIZ

Specialize Haar integration to the circular unitary ensemble: eigenangles in `[0,2π)` with
density `((2π)^n n!)⁻¹ ∏_{i<j}|e^{iθᵢ}-e^{iθⱼ}|²` and independent Haar eigenflags. Prove complex
Schur triangularization and the complex Ginibre joint eigenvalue density by the Schur change of
variables with its triangular-coordinate Jacobian. Prove the HCIZ integral for Hermitian `A, B`
and real `t`, with continuous extensions at repeated eigenvalues and `t = 0`:
`∫ exp(t tr(AUBU*)) dU = c_n t^(-n(n-1)/2) det[exp(t aᵢ bⱼ)] / (Δ(a)Δ(b))`,
`c_n = 1!·2!⋯(n-1)!`, `Δ(a) = ∏_{i<j}(aⱼ-aᵢ)`, when `t ≠ 0` and both spectra are simple, and a
separate nonsingular rank-one formula. *Needs:* §5.2; RepresentationTheory/CompactGroups.

**Checks.**

- CUE, `n = 2`: `∫∫ |e^{iθ₁}-e^{iθ₂}|² = 2(2π)²`, so the density has mass `1`.
- HCIZ, `n = 2`: as `t → 0`, `det ≈ t(a₂-a₁)(b₂-b₁)` and the right side tends to `c_2 = 1 = ∫ 1`;
  the opposite Vandermonde sign would give `-1`.
- Complex Ginibre, `n = 1`: density `π⁻¹ e^{-|z|²}`.

### Examples

GUE at `n = 2`: the eigenvalue gap `λ₁ - λ₂` has density proportional to `s² e^{-s²/2}` on
`s > 0`, which vanishes quadratically at `0` (level repulsion with `β = 2`).

### Dependencies

Layers 0–3; StandardDistributions Layers 3–6; RepresentationTheory/CompactGroups Layer 0 and
`weyl_integration_formula`.

## Finite combinatorial prerequisite for Layers 3, 4 and 6

Use finite set partitions of `Fin k` with the cyclic order inherited from the usual order. A
partition is noncrossing when there are no `a < b < c < d` with `a, c` in one block and `b, d` in
a different block. Prove restriction and interval decomposition, refinement as a finite lattice,
the Kreweras complement, Möbius inversion, Catalan counts for noncrossing partitions and
pairings, and Narayana counts by number of blocks. For pairings prove the equivalence with planar
closed-walk leading terms and with maximal cycle count of a pairing composed with the long cycle,
counting fixed points as cycles. *Needs:* Mathlib `Finpartition`.

**Checks.**

- `|NC(3)| = 5 = C₃` and `|NC(4)| = 14`: all 15 partitions of `Fin 4` except `{{0,2},{1,3}}`.
- The Narayana count of `NC(4)` with two blocks is `6`; noncrossing pairings of `Fin 4` number
  `2` of the `3` pairings.
- The Kreweras complement of the partition into singletons is the one-block partition.

## Layer 6: free probability and asymptotic freeness

**Sources:** AGZ §§5.2–5.4; T §2.5; PB chs. 10–12, 15.

### 6.1 Noncommutative probability spaces

Develop unital linear functionals on unital algebras and noncommutative laws as evaluation of
words, with real and complex scalar extension. In the analytic layer use unital complex
C*-algebras with a positive normalized linear functional, adding traciality where needed, reusing
Mathlib's positive-linear-map and star-algebra APIs. Prove positivity, Cauchy–Schwarz, norm
bounds, and the probability measure representing a bounded self-adjoint variable through
continuous functional calculus and Riesz representation, with its support, moment identities and
uniqueness. A word functional without positivity is not a probability measure. *Needs:* Mathlib
C*-algebras, `cfc`, Riesz–Markov.

**Checks.**

- `(Mat_n(ℂ), trₙ)` is a tracial noncommutative probability space and the law of a Hermitian `A`
  is `L_A`.
- The functional `φ(p) = p(1) - p(0)` on `ℂ[x]` has `φ(1) = 0`, so it is not unital.
- The unital functional on `ℂ[x]` with `φ(x) = 0`, `φ(x²) = -1` has `φ(x*x) = -1 < 0`, so no
  probability measure represents it.

### 6.2 Freeness and free cumulants

Define free unital subalgebras by vanishing of alternating products of centred elements from
successively distinct subalgebras, and freeness of families through generated subalgebras. Prove
permutation and regrouping, adjoining scalars, polynomial substitution, mixed-moment uniqueness,
and the contrast with tensor-product independence. Construct free cumulants by noncrossing
Möbius inversion and prove multilinearity, moment–cumulant inversion, and freeness iff mixed
cumulants vanish. Construct free products with positive state through the reduced-word
Hilbert-space construction (vacuum, inner product, bounded representations, positivity,
freeness). *Needs:* §6.1; the finite combinatorial prerequisite.

**Checks.**

- For free centred `a, b`: `φ(abab) = 0`, while commuting independent variables give
  `φ(a²)φ(b²)`.
- Free cumulants: `κ₄ = m₄ - 2m₂²` for a centred variable, so the semicircle has `κ₄ = 2 - 2 = 0`
  and the standard Gaussian has free `κ₄ = 1` (classical `κ₄ = 0`).
- Scalars are free from every subalgebra.

### 6.3 Free convolution and transforms

Define free additive convolution on compactly supported real probability measures, and free
multiplicative convolution on compactly supported nonnegative laws via `a^(1/2) b a^(1/2)`.
Prove well-definedness, associativity, commutativity at the level of laws, identities, scaling,
support bounds and weak continuity on uniformly bounded supports. For `G = -m` construct the
local inverse near infinity and the R-transform by `G^(-1)(w) = 1/w + R(w)`; define
`ψ(z) = ∫ zx/(1-zx) dμ` and `S(w) = (1+w)ψ^(-1)(w)/w` when the first moment is nonzero. Prove the
formal-series and analytic-germ bridges, additivity of R-transforms and multiplicativity of
S-transforms, and identify `R_{SC_v}(w) = vw`, `R_{MP_y}(w) = 1/(1-yw)`, `S_{MP_y}(w) = 1/(1+yw)`.
*Needs:* §§6.2, 3.1, 3.3, 3.4.

**Checks.**

- `semicircleReal 0 s ⊞ semicircleReal 0 t = semicircleReal 0 (s+t)` by `R = sw + tw`.
- `(δ₋₁+δ₁)/2 ⊞ (δ₋₁+δ₁)/2` is the arcsine law `π⁻¹(4-x²)^(-1/2)` on `(-2,2)`, while classical
  convolution gives `¼δ₋₂ + ½δ₀ + ¼δ₂`.
- `δ_a ⊞ μ` is the translate of `μ` by `a`, and `S_{δ_a} = 1/a`.
- `MP_y` has free cumulants `y^(n-1)`, so `R = 1/(1-yw)`.

### 6.4 Free limit theorems

Prove the free central limit theorem for freely independent identically distributed bounded
centred self-adjoint variables of variance 1: laws of normalized sums converge weakly to
`semicircleReal 0 1`. Prove the free Poisson limit for free projections of trace `λ/n`: their
sums tend to the law with all free cumulants `λ` (for `λ > 0` the dilation by `λ` of `MP_(1/λ)`;
for `λ = 0` the Dirac mass at zero), with moment convergence and the support/tightness argument;
projection arrays exist only once `n ≥ λ`. *Needs:* §§6.2–6.3.

### 6.5 Asymptotic freeness

Prove asymptotic freeness in normalized trace moments, in expectation and almost surely, for
finitely many independent Wigner matrices `Xⁱ/√n` (real symmetric or complex Hermitian) whose
entries are centred with `E|X(m,ℓ)|² = 1` and have moments of every order bounded uniformly in
the size, the index `i` and the position, jointly with a deterministic family of uniformly
bounded operator norm having a joint limiting star-moment law (AGZ Theorems 5.4.2 and 5.4.5); GUE
and GOE are the Gaussian cases. Prove the Haar-conjugation version for independent Haar unitaries
and deterministic bounded Hermitian matrices with limiting individual laws. Build Haar entry
moment and Weingarten formulas, their large-dimension estimates, mixed-word counting, and
variance and higher centred-moment bounds; convert matrix moment limits into spectral weak limits
for self-adjoint polynomials. *Needs:* §§6.2–6.3, 4.2, 5.1, 5.4.

### Examples

For independent GUE `H₁, H₂`: `E trₙ(H₁H₂H₁H₂) → 0` and `E trₙ(H₁²H₂²) → 1`, the values of two
free semicircular variables.

### Dependencies

Layers 1, 3, 4 (moment method), 5; the finite combinatorial prerequisite.

## Layer 7: deformations, covariance spectra and spikes

**Sources:** PB chs. 10, 14, 15, 17, §§19.1–19.3; AGZ §5.4; Benaych-Georges–Nadakuditi 2011.

### 7.1 Deformed Wigner matrices

For deterministic Hermitian `Dₙ` of uniformly bounded norm with limiting empirical law `ν` and
independent GUE `Hₙ`, prove `L_{Dₙ+√t Hₙ} → ν ⊞ SC_t` almost surely and the Pastur equation
`m(z) = ∫ (x-z-tm(z))⁻¹ dν(x)`, with existence and uniqueness in the Stieltjes class. Prove the
resolvent deterministic equivalent against deterministic unit vectors for fixed `Im z > 0` and
its extension uniformly on compact real intervals separated from the limiting and
finite-dimensional spectra when that separation is established. *Needs:* §§6.3, 6.5, 5.1, 3.2.

**Checks.**

- `ν = δ₀`: the Pastur equation becomes `tm² + zm + 1 = 0`, the transform equation of
  `semicircleReal 0 t`.
- `t = 0`: `m = m_ν`.

### 7.2 Population covariance

For deterministic `T_p ≥ 0` with `sup‖T_p‖ < ∞` and `L_{T_p} → ν`, and real or complex i.i.d. `X`
with mean zero, variance 1 and finite fourth moment, prove the almost-sure limiting law of
`T_p^(1/2) XX*/n T_p^(1/2)` with `p/n → y > 0`. Its companion transform solves
`z = -1/m̲ + y ∫ t/(1+t m̲) dν(t)`, `m̲ = -(1-y)/z + ym`, with the upper-half-plane and
normalization conditions; prove existence, uniqueness, the zero-atom formula and the
identification with `ν ⊠ MP_y`. Give the deterministic matrix equivalent
`Q(z) = [-z(I + m̲(z)T_p)]⁻¹` for fixed positive imaginary part, in normalized trace against
deterministic bounded matrices, including isotropic and finite-atomic population laws and
singular `T_p`. *Needs:* §§4.4, 6.3, 1.3.

**Checks.**

- `y = 1`: `m̲ = m`.
- `ν = δ₁` recovers `MP_y` and its transform equation of §3.4.

### 7.3 Spiked models

Prove finite-rank perturbation invariance of global limits and the secular equation for
outliers. Prove `gaussianEnsemble_spike_ae`: for `β ∈ {1,2}`, Gaussian coordinates with any
coupling across `n`, deterministic unit vectors `uₙ` (real when `β = 1`) and fixed `θ > 0`,
almost surely `λ_max(Hₙ + θuₙuₙ*)` tends to `θ + 1/θ` for `θ > 1` and to `2` for `θ ≤ 1`
(Benaych-Georges–Nadakuditi 2011, Theorem 2.1 and §3.1, with `isHermitian_smul_vecMulVec_star`
for the perturbation). Prove that the squared overlap of the top eigenvector with `uₙ` tends to
`1 - 1/θ²` for `θ > 1` and to `0` for `θ ≤ 1`, and the negative spikes by symmetry, with
isotropic resolvent estimates, eigenvalue exclusion and the derivative-residue argument. For
Gaussian sample covariance with `0 < y < 1` and `T_p = diag(ℓ,1,…,1)`, `ℓ > 1`, prove the upper
spike theorem: threshold `1+√y`; above it the outlier tends to `ℓ(1 + y/(ℓ-1))` and its squared
population-eigenvector overlap to `(1 - y/(ℓ-1)²)/(1 + y/(ℓ-1))`; at and below threshold the
largest eigenvalue tends to `(1+√y)²` and the overlap to zero. Extend to finitely many distinct
supercritical spikes through spectral projectors. Weak convergence alone proves none of these.
*Needs:* §§4.5, 5.1, 7.1, 7.2, 1.3.

**Checks.**

- `θ = 1`: `θ + 1/θ = 2` and `1 - 1/θ² = 0`: the limits are continuous at the threshold.
- `θ = 2`: outlier `5/2 > 2`, overlap `3/4`.
- Covariance `ℓ = 1 + √y`: `ℓ(1 + y/(ℓ-1)) = (1+√y)²` and the overlap numerator `1 - y/y = 0`.

### 7.4 Oracle and nonlinear shrinkage

Prove the finite-dimensional oracle identity: among estimators diagonal in an observed
orthonormal eigenbasis `uᵢ`, the unique minimizer of squared Frobenius loss to `T` has
eigenvalues `uᵢ*Tuᵢ`; for a repeated observed eigenvalue distinguish this basis-dependent class
from spectral estimators constant on the eigenspace, which use the averaged trace on the
spectral projector. Prove the integrated bulk nonlinear-shrinkage formula: for Gaussian `X`,
`0 < y < 1`, `cI ≤ T_p ≤ CI` with fixed `c > 0` and limiting law `ν`, let `μ = ν ⊠ MP_y`; on a
compact interval `J ⊂ (0,∞)` where `μ` has continuous positive density and `m` continuous
boundary values with `|1-y-yx m(x+i0)|` bounded away from zero, for every continuous `f`
supported in the interior of `J`, `p⁻¹ ∑ᵢ f(λᵢ) uᵢ*T_puᵢ → ∫ f(x) x/|1-y-yx m(x+i0)|² dμ(x)`
almost surely. Build the weighted spectral measure and boundary-inversion argument from the
deterministic equivalent; this does not assert convergence of individual eigenvector weights.
*Needs:* §7.2.

**Checks.**

- `ν = δ₁`: `w = 1-y-yzm` solves `w² - (1-y+z)w + z = 0`, so on the support `|w|² = x` and the
  weight `x/|w|²` is `1 = uᵢ*Iuᵢ`.
- For `T = I` the oracle eigenvalues are all `1` in every basis.

### Examples

PB's `g = -m` turns the Pastur equation into `g(z) = ∫ (z - x - t g(z))⁻¹ dν(x)`.

### Dependencies

Layers 1–6.

## Layer 8: point processes and Gaussian local statistics

**Sources:** AGZ ch. 3, §4.2; T §2.6, §§3.3–3.4; PB ch. 6, §14.1; Soshnikov 2000.

### 8.1 Eigenvalue point processes

Take configuration spaces, their vague topology and measurable structure, factorial moment
measures, correlation functions relative to a reference measure, restriction, pushforward,
Laplace-functional uniqueness and weak convergence of laws from PointProcesses Layers 0–6 at
`S = ℝ` and `S = ℂ`. Define the eigenvalue point process `∑ᵢ δ_{λᵢ}` of a random Hermitian or
complex matrix as a random element of `PointMeasure ℝ` or `PointMeasure ℂ`, prove its
measurability, and relate it to `L_A` by the factor `n⁻¹`. Prove that `λ ↦ nρ_SC(E)(λ-E)` and
`λ ↦ n^(2/3)(λ-2)` are proper, and that under `x ↦ c(x-a)`, `c > 0`, the `k`-point correlation
function relative to Lebesgue measure becomes `ρ'_k(y) = c^(-k) ρ_k(a+y₁/c, …, a+y_k/c)`.
*Needs:* PointProcesses Layers 0–6; §1.1.

**Checks.**

- The eigenvalue point process has total mass `n`, `L_A` has mass `1`.
- Scaling `x ↦ 2x` sends a unit-intensity `ρ₁ = 1` to `ρ'₁ = 1/2`.

### 8.2 Orthogonal polynomial ensembles

Prove Andréief's identity and the determinantal structure of orthogonal polynomial ensembles.
Construct the GUE kernel from the Hermite functions, the Laguerre and Jacobi unitary-ensemble
kernels from LaguerreJacobi's polynomials and orthogonality relations (B3, D3), and the CUE and
complex Ginibre kernels, each with its reference measure. Prove Christoffel–Darboux, the
reproducing and projection identities, correlation functions, and mean and variance of counts and
linear statistics. *Needs:* §5.2, §5.4; OrthogonalL2Bases Parts A–B; LaguerreJacobi Parts A–D.

**Checks.**

- `n = 1` Laguerre unitary kernel with weight `w`: `K(x,y) = w(x)^(1/2) w(y)^(1/2)/c₀`, with
  `c₀ = ∫ w` the zeroth norm of LaguerreJacobi B3.
- The GUE kernel satisfies `∫ K(x,x) dx = n`.

### 8.3 Determinantal point processes from continuous kernels

The constructor takes a locally compact Polish space `S` with a locally finite reference measure
`μ` and a continuous Hermitian kernel `K : S → S → ℂ` that is positive semidefinite (every finite
matrix `[K(xᵢ,xⱼ)]` is positive semidefinite) and whose integral operator on `L²(μ)` is a
contraction. Build on the operator-ideal carriers the trace-class integral-operator and
Fredholm-determinant theory: summability, the trace functional, exterior powers, determinant
series, continuity in trace norm and restriction to windows. For each relatively compact Borel
window `W`, apply Mercer's theorem on the compact support of `μ|_W` to prove that `K_W` is a
positive trace-class contraction with `tr K_W = ∫_W K(x,x) dμ(x)` and
`tr Λ^k K_W = (k!)⁻¹ ∫_{W^k} det[K(xᵢ,xⱼ)] dμ^k(x)`, hence
`det(I-K_W) = ∑_k ((-1)^k/k!) ∫_{W^k} det[K(xᵢ,xⱼ)] dμ^k(x)`. These identities come before
`det[K(xᵢ,xⱼ)]` is used as the `k`-point correlation function relative to `μ`. Kernels defined
only up to null sets, which need the trace-compatible representative of Soshnikov 2000 (§1,
Lemmas 1–2 and (1.14)) and AGZ §4.2.2, are outside this constructor.

For `f ≥ 0` continuous with compact support prove the Laplace functional
`E exp(-∫ f dN) = det(I-(1-e^{-f})K)` on `L²(supp f)` from PointProcesses' factorial expansion,
applying the identities above to `√φ(x)K(x,y)√φ(y)`, `φ = 1-e^{-f}`, and deduce uniqueness of the
law from PointProcesses' Laplace-functional determination. The exponential count moments that
expansion needs on a bounded window `W` come from Hadamard's bound `det[K(xᵢ,xⱼ)] ≤ ∏ᵢ K(xᵢ,xᵢ)`,
taken from `hermitian_gram_hadamard` by realizing each finite kernel matrix as a Gram matrix,
which with the trace identity gives `α_k(W^k) ≤ (tr K_W)^k`. Prove `P(N(B)=0) = det(I-K_B)` for
relatively compact Borel `B`, the Bernoulli-sum representation of bounded-set counts and their
CLT when the variance diverges.

Prove the convergence criterion: if kernels `Kₙ` accepted by the constructor on `ℝ` with Lebesgue
reference measure converge uniformly on compact sets to a continuous `K`, then `K` is accepted
(positive semidefiniteness passes to the pointwise limit; the contraction bound follows from
Hilbert–Schmidt convergence on each bounded window), the correlation functions converge locally
uniformly, and, with Hadamard's bound dominating the Fredholm expansions, the processes converge
in law in PointProcesses' weak topology on `PointMeasure ℝ`. *Needs:* OperatorIdeals OI-B01–OI-B19,
OI-B23, OI-B29, OI-B30 and Part C; PointProcesses Layers 0–6; SuccessiveMinima target 0.1.2.

**Checks.**

- For Lebesgue measure on `ℝ`, the measurable kernel `1_{x=y}` has positive semidefinite finite
  matrices and zero integral operator, yet `∫_{[0,1]} K(x,x) dx = 1`; its `det[K(xᵢ,xⱼ)]` are the
  correlation functions of the unit-rate Poisson process, whose void probability on `[0,1]` is
  `e^{-1} ≠ det(I-0) = 1`. Continuity of the kernel excludes it.
- `K = λ φ⊗φ` with `‖φ‖ = 1`: for `0 ≤ λ ≤ 1` the process has at most one point,
  `P(N(B)=0) = 1 - λ∫_B φ² = det(I-K_B)`; for `λ > 1` the contraction bound fails and
  `det(I-K) = 1-λ < 0`.
- The sine kernel has `K(x,x) = 1` and `ρ₂(x,y) = 1 - (sin π(x-y)/(π(x-y)))² → 0` as `y → x`.

### 8.4 Bulk and edge limits

Prove Hermite bulk and turning-point asymptotics with uniform bounds strong enough to pass to
correlation functions and gap probabilities. For GUE and `E ∈ (-2,2)`, scale by
`nρ_SC(E)(λ-E)`; the limiting kernel is `sin(π(x-y))/(π(x-y))` with diagonal value 1. At the upper
edge use `n^(2/3)(λ-2)` and the Airy kernel `K_Ai(x,y) = ∫₀^∞ Ai(x+t)Ai(y+t) dt`. Build the Airy
function, its equation `Ai'' = s Ai`, decay, integral representations and the uniform asymptotic
estimates needed, with tail control on unbounded intervals. Define `F₂(s) = det(I-K_Ai)` on
`L²(s,∞)`, prove it is a continuous distribution function and
`P(n^(2/3)(λ_max(GUE)-2) ≤ s) → F₂(s)`, and prove the limiting Airy point process and the bulk
sine-process gap distributions. *Needs:* §§8.2–8.3; OrthogonalL2Bases Parts A–B.

**Checks.**

- `Ai(0) = 3^(-2/3)/Γ(2/3)`; `Bi` solves the same equation but grows, so decay pins `Ai`.
- `F₂(s) → 1` as `s → ∞` and `F₂` is nondecreasing.

### 8.5 GOE: Pfaffians and Painlevé II

Develop Pfaffians, de Bruijn integration, skew-orthogonal Hermite kernels and Fredholm
Pfaffians to prove the GOE bulk and soft-edge limits of the matrix kernels and correlation
functions, and the GOE largest-eigenvalue distribution `F₁` with the same scaling, pinned to AGZ
Theorems 3.1.6–3.1.7 with their matrix normalization translated explicitly. Prove the relation to
the Hastings–McLeod solution of `q'' = sq + 2q³`, `q(s) ~ Ai(s)` at `+∞`:
`F₂(s) = exp(-∫_s^∞ (x-s)q(x)² dx)` and `F₁(s)² = F₂(s) exp(-∫_s^∞ q(x) dx)`. Existence,
uniqueness with the Hastings–McLeod boundary condition, absence of real poles, and the Fredholm
differential identities are targets. *Needs:* §8.4.

**Checks.**

- `Pf [[0,a],[-a,0]] = a`, and for a `4 × 4` skew matrix `Pf = a₁₂a₃₄ - a₁₃a₂₄ + a₁₄a₂₃` with
  `Pf² = det`.
- Solutions `q ~ k Ai` with `k < 1` (Ablowitz–Segur) are not Hastings–McLeod.

### 8.6 Linear statistics

Prove `gaussianEnsemble_linear_statistic_clt`: for `β ∈ {1,2}` and a real polynomial `f` with
`f(2cos θ) = a₀ + ∑_{k≥1} aₖ cos kθ`, `tr f(Hₙ) - E tr f(Hₙ)` converges in distribution to the
centred Gaussian of variance `(2β)⁻¹ ∑_{k≥1} k aₖ²`; by Cramér–Wold this gives the joint CLT for
finitely many polynomials with covariance `(2β)⁻¹ ∑_{k≥1} k aₖ bₖ` (AGZ Theorem 4.3.20 with
zero initial data, and Theorem 2.1.31 for monomials of Wigner matrices; Johansson 1998,
Theorem 2.4). Include Wick connected-diagram and cumulant estimates and the
multivariate convergence-of-laws bridge; centre by the exact expectation. *Needs:* §§5.1, 2.5,
4.2; Mathlib `TendstoInDistribution`.

**Checks.**

- `f(x) = x`: `a₁ = 2` and variance `2/β`, which is `Var tr H = n · (diagonal variance)/n`
  (`1` for GUE, `2` for GOE).
- `f(x) = x²`: `4cos²θ = 2 + 2cos 2θ`, `a₂ = 2`, variance `4/β`; directly
  `Var tr H² = (2n + 2n(n-1))/n² → 2` for GUE.
- A constant `f` has variance `0` and the statistic is identically `0`.

### Examples

At `n = 2` the GUE kernel `K₂(x,x)` integrates to `2`, and `P(N(ℝ) = 2) = 1`.

### Dependencies

Layers 1, 3, 5; OrthogonalL2Bases Parts A–B; LaguerreJacobi Parts A–D; PointProcesses Layers 0–6;
OperatorIdeals; SuccessiveMinima target 0.1.2.

## Layer 9: logarithmic energy and large deviations

**Sources:** AGZ §2.6; PB §§5.2–5.5.

### 9.1 Large deviation principles

Define a large deviation principle for measures on a topological space by the open-set lower and
closed-set upper bounds, with a specified speed and a lower-semicontinuous rate; define goodness,
exponential tightness and exponential equivalence, and prove the contraction principle. Use
extended-real logarithms with `log 0 = -∞`, not `Real.log 0 = 0`. *Needs:* Mathlib `EReal`,
`ProbabilityMeasure`.

**Checks.**

- The sample mean of i.i.d. standard Gaussians satisfies the principle at speed `n` with rate
  `x²/2`.
- A constant sequence `δ₀` has rate `0` at `0` and `+∞` elsewhere.
- With `Real.log 0 = 0` the upper bound would be violated by sets of probability `0`.

### 9.2 Beta gases and the logarithmic energy

For continuous `V : ℝ → ℝ` such that, for some `β' > 1` with `β' ≥ β`,
`liminf_{|x|→∞} V(x)/log|x| > 2β'/β`, construct the beta gas of density
`Z_(n,β,V)⁻¹ exp(-βn∑V(xᵢ)/2) ∏_{i<j}|xᵢ-xⱼ|^β`, `β > 0` (AGZ (2.6.1)–(2.6.2) with AGZ's potential
equal to `βV/2`). Prove finiteness and positivity of the partition function and the limiting free
energy. For `E_V(μ) = ∫ V dμ - ∬ log|x-y| dμ dμ` define the energy through lower-bounded kernel
truncations so that no `∞-∞` occurs; prove lower semicontinuity, compact sublevel sets,
existence and uniqueness of the minimizer, and compactness of its support. *Needs:* §9.1, §3.2.

**Checks.**

- `V(x) = x²/2` satisfies the growth condition for every `β`.
- `β = 2`, `V(x) = c log(1+|x|)`: admitted exactly when `c > 2β'/2` for some `β' ≥ 2`, that is
  `c > 2`; a condition `V(x)/log(1+|x|) → ∞` would exclude every such `V`.
- `E_V(semicircleReal 0 1) = 1/2 + 1/4 = 3/4` for `V = x²/2`, using
  `∬ log|x-y| = -1/4` for the standard semicircle.

### 9.3 Empirical-measure large deviations

Prove the empirical-measure principle at speed `n²` with good rate `(β/2)(E_V(μ) - min E_V)` (AGZ
Theorem 2.6.1, whose rate is this one in the present normalization) and deduce convergence to the
equilibrium measure. Prove logarithmic-kernel truncation bounds, exponential tightness and
recovery configurations; the singular diagonal is not treated as a continuous kernel. *Needs:*
§§9.1–9.2.

### 9.4 Equilibrium measures and capacity

Develop the variational characterization: the effective potential `V(x) - 2∫ log|x-y| dμ(y)` is at
least the equilibrium constant outside a set of logarithmic capacity zero and equals it on the
support except on such a set. Define logarithmic capacity and justify the exceptional-set
statement. For `V = x²/2` identify the minimizer as `semicircleReal 0 1` and evaluate its energy
and normalization constants. *Needs:* §9.2, §3.3.

**Checks.**

- `∫ log|x-y| d semicircleReal 0 1 (y) = x²/4 - 1/2` on `[-2,2]`, so the effective potential of
  `V = x²/2` is the constant `1` there.
- The interval `[-2,2]` has capacity `1` (length over `4`); a point has capacity `0`.

### 9.5 Largest-eigenvalue large deviations

For the Gaussian beta gas prove the largest-eigenvalue principle at speed `n` with rate
`J_β(x) = (β/2) ∫₂ˣ √(t²-4) dt` for `x ≥ 2` and `+∞` for `x < 2`, with exponential tightness, the
outlier bounds and the `n²` scale of fixed left-tail events via the constrained equilibrium
problem. It is not derived from a weak-topology contraction of empirical measures. *Needs:*
§§9.1–9.4.

**Checks.**

- `J_β(2) = 0`, and `J_β(x) ~ (2β/3)(x-2)^(3/2)` as `x ↓ 2`, since `√(t²-4) ≈ 2√(t-2)` near `2`.
- `J_β(x) = +∞` for `x < 2`: the largest eigenvalue cannot sit inside the bulk at speed `n`.

### Examples

At `n = 1` the beta gas is the law with density proportional to `e^{-βV/2}`.

### Dependencies

Layers 1, 3, 5.

## Layer 10: Itô calculus and Dyson Brownian motion

**Sources:** AGZ §§4.3.1–4.3.2; T §3.1; PB chs. 8–9.

### 10.1 Adapters to stochastic calculus

Consume from StochasticCalculus: vector Brownian motion on a finite-dimensional real
inner-product space with independent orthonormal coordinates and linear-isometry transport
(S1.2–S1.3); the predictable `L²` Brownian integral with its isometry, continuous integral
process and localization (S3.2–S3.4); quadratic and mutual variation with
`[∫H dM, ∫K dN] = ∫ HK d[M,N]` (S4.1–S4.3); the `C²` Itô formula on an open domain stopped before
its boundary, in coordinate form (S5.1); the vector Lévy characterization (S5.5); and strong
solutions, pathwise uniqueness, local and maximal solutions with compatible truncations, and
coercive `C²` Lyapunov nonexplosion (S9.1–S9.2). State and prove the adapters to that interface.
Time is `ℝ≥0` with finite horizons measured by its `timeMeasure T`; collision and exit times are
stopping times valued in `WithTop ℝ≥0`. The Brownian hypotheses are its filtration-relative
predicates of S1.3, `IsFilteredBrownian` in the scalar case, for a filtration on which the matrix
noise is Brownian; usual conditions are assumed only where that roadmap's theorems require them,
and conclusions are transported back through its raw-filtration adapters. Integrands are its
predictable or progressive classes, localized at collision and exit times, with Hilbert–Schmidt
norms for matrix noise. Brackets follow `[⟨u,W⟩,⟨v,W⟩]_t = ⟨u,v⟩t`. Solutions use its
strong-solution notion, whose scalar carrier is `IsStrongSolution`, with state space `ℝⁿ`;
singular Dyson coefficients are handled by globally Lipschitz truncations agreeing with them on
`{x₁ > ⋯ > xₙ, min_{i<j}(xᵢ-xⱼ) ≥ 1/k, ‖x‖ ≤ k}`, pasted by S9.2 up to the exit times.
*Needs:* StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2.

### 10.2 Matrix Brownian motion and the eigenvalue equation

Construct real symmetric (`β = 1`) and complex Hermitian (`β = 2`) matrix Brownian motion as
standard Brownian motion on that real space with inner product `(β/2) Re tr(AB)`, so
`[tr(AH), tr(BH)]_t = (2/β) Re tr(AB) t` and the time-one entry variances are those of §5.1. For
distinct starting eigenvalues derive the eigenvalue equation up to the first collision, with
derivatives of eigenvalues and projectors, the quadratic-variation computation, and the
identification of the martingale parts as independent Brownian motions by Lévy's
characterization; with decreasing order and normalized noise it is
`dλᵢ = √(2/(βn)) dBᵢ + n⁻¹ ∑_{j≠i} (λᵢ-λⱼ)⁻¹ dt`, `β = 1, 2` (AGZ Theorem 4.3.2). *Needs:* §10.1,
§5.1, §1.2.

**Checks.**

- `β = 1`, `A = B = E₁₁`: `[tr(AH)]_t = 2t`, the GOE diagonal variance; `β = 2`: `t`.
- `n = 1`: `dλ = √(2/β) dB`.
- `β = 2`, off-diagonal `A = B = E₁₂ + E₂₁`: `[tr(AH)]_t = 2t`, so `Re H₁₂` has variance `t/2`.

### 10.3 Dyson Brownian motion for `β ≥ 1`

Construct the ordered-particle equation for every real `β ≥ 1`; prove global strong existence,
uniqueness, no collisions from strictly ordered starts, and continuous entrance from coincident
deterministic starts by approximation. Prove noncollision from a logarithmic-gap argument and
nonexplosion from the quadratic Lyapunov estimate. For the Ornstein–Uhlenbeck drift `-λᵢ/2`,
prove the Gaussian beta density invariant, with the boundary terms needed to pass from formal
generator symmetry to an invariant probability law. *Needs:* §10.2, §5.3.

**Checks.**

- `n = 1` with drift `-λ/2`: the stationary variance is `(2/β)/(2 · 1/2) = 2/β`, the variance
  of `exp(-βx²/4)`.
- `β < 1` is excluded: collisions occur there.

### 10.4 Hydrodynamic limit

Prove the empirical-measure evolution against `C_c²` test functions, its martingale
quadratic-variation estimate, tightness on finite time intervals, and the limiting weak equation.
For initial empirical laws converging to compactly supported `ν` with uniformly bounded initial
spectra, identify the Brownian limit at time `t` as `ν ⊞ SC_t` and prove uniqueness through its
Stieltjes equation, with convergence in probability uniformly in time on compact intervals for a
metric of weak convergence. The Ornstein–Uhlenbeck limit follows by deterministic time change and
scaling. *Needs:* §§10.2–10.3, 6.3, 7.1.

### Examples

From `ν = δ₀` the Brownian limit at time `t` is `semicircleReal 0 t`.

### Dependencies

Layers 0–3, 5–6; StochasticCalculus.

## Layer 11: small singular values and the circular law

**Sources:** T §§2.7–2.8; PB §3.1; Tao–Vu 2008; Tao–Vu–Krishnapur 2010; Rudelson–Vershynin 2008.

### 11.1 Anti-concentration and least singular values

Develop the negative-second-moment identity relating singular values to distances of rows from
the spans of the other rows, distance-to-subspace concentration, compressible and incompressible
unit-vector decompositions, and small-ball estimates for independent sums. Include
Littlewood–Offord anti-concentration and the inverse structural estimates of the polynomial
least-singular-value theorem (T §2.7.3, Remark 2.7.6; Tao–Vu 2008, Theorems 2.1 and 3.2) with the
finite additive-combinatorial covering lemmas of that argument. Prove `least_singular_value`:
for each sub-Gaussian proxy `K` there are `C > 0` and `0 < c < 1` such that every `N × N` matrix
with i.i.d. real entries of variance one, each satisfying `HasSubgaussianMGF` with proxy `K`, has
`P(s_min(X) ≤ ε/√N) ≤ Cε + c^N` for `ε ≥ 0` (Rudelson–Vershynin 2008, Theorem 1.2). Include
rectangular lower bounds from §2.4 and the complex circular Gaussian specialization; keep the
`X` and `X/√n` thresholds distinct. For a fixed nondegenerate centred variance-one complex entry
law with finite second moment, prove for every `A, C > 0` some `B > 0` with
`P(s_min(Xₙ+Dₙ) ≤ n^(-B)) ≤ n^(-A)` for all large `n`, uniformly over deterministic
`‖Dₙ‖ ≤ n^C`, with constants depending on the law, `A` and `C`, including the truncation and
anti-concentration reduction and the intermediate-singular-value estimates for logarithmic
integrability. *Needs:* §§2.1, 2.4, 0.3; Mathlib `LinearMap.singularValues`.

**Checks.**

- `N = 1`: `s_min = |ξ|` and for a standard Gaussian `P(|ξ| ≤ ε) ≈ ε√(2/π)`, linear in `ε`.
- Rademacher entries: the `2 × 2` matrix is singular with probability `1/2` (the rows are equal
  or opposite), consistent with the term `c^N` at `ε = 0`.
- Replacing `ε/√N` by `ε` changes the scale: `s_min(X/√N) = s_min(X)/√N`.

### 11.2 Logarithmic potentials and Girko hermitization

Define the logarithmic potential `U_μ(z) = ∫ log|z-w| dμ(w)` wherever integrable, and as a
locally integrable function for finite empirical spectra. Prove Girko hermitization:
`U_{L_A}(z) = n⁻¹ log|det(A-zI)| = n⁻¹ ∑ log sᵢ(A-zI)` almost everywhere in `z`, and
`ΔU_{L_A} = 2πL_A` in distributions. Build the distributional Laplacian interface, local
integrability of the logarithmic kernel, and the potential convergence theorem. *Needs:* §1.1,
§1.3.

**Checks.**

- `U_{δ₀}(z) = log|z|`.
- For `circularLaw`, `U(z) = (|z|²-1)/2` for `|z| < 1` and `log|z|` for `|z| ≥ 1`; inside,
  `ΔU = 2 = 2π · π⁻¹`.
- `A = diag(a, b)`: `½(log|a-z| + log|b-z|) = ½ log|det(A-zI)|`.

### 11.3 The circular law

Prove convergence of the singular-value laws of `Xₙ/√n - zI` for almost every `z`, by Hermitian
block linearization, a self-consistent resolvent equation and its uniqueness, with Gaussian
identification and a finite-variance replacement argument. Prove uniform integrability of `log`
at zero and infinity in the forms required for probability and almost-sure potential
convergence; weak convergence of singular-value laws alone is not enough. Prove the replacement
principle (Tao–Vu–Krishnapur 2010, Theorem 2.1) under its normalized Frobenius tightness and
almost-everywhere log-determinant hypotheses, separately from their verification for i.i.d.
matrices. Prove `circular_law_ae`: for the top-left `n × n` corners of an infinite array of i.i.d.
complex entries of mean zero and `E|ξ|² = 1`, almost surely `eigenvalueMeasure (Xₙ/√n)` converges
weakly to `circularLaw` (T Theorem 2.8.1; Tao–Vu–Krishnapur 2010, Theorem 1.13), and in
probability. Give complex Ginibre as a check against §5.4. *Needs:* §§11.1–11.2, 3.5, 5.4.

### Examples

For complex Ginibre with `n = 1`, `eigenvalueMeasure` is `δ_ξ` and the expected measure has
density `π⁻¹ e^{-|z|²}`, not yet the uniform disc.

### Dependencies

Layers 0–5.

## Downstream consumers

- [FreeProbability](../FreeProbability/README.md) consumes Layers 1, 3, 5 and 6 (cited there as
  Milestones 1, 3, 5 and 6) and the finite combinatorial prerequisite: `spectralMeasure` and the
  decreasing Hermitian eigenvalues, the moment-to-weak convergence and resolvent inversion of
  §§3.1–3.2, `semicircleReal` and `marchenkoPastur`, the GUE, Ginibre and Haar carriers of
  Layer 5, and the scalar free probability, Weingarten and expected-moment interface of Layer 6.

## References

- [AGZ] G. W. Anderson, A. Guionnet, O. Zeitouni, *An Introduction to Random Matrices*,
  Cambridge University Press, 2010.
- [T] T. Tao, *Topics in Random Matrix Theory*, Graduate Studies in Mathematics 132, AMS, 2012.
- [PB] M. Potters, J.-P. Bouchaud, *A First Course in Random Matrix Theory*, Cambridge University
  Press, 2020.
- Z. D. Bai, *Methodologies in spectral analysis of large dimensional random matrices, a review*,
  Statistica Sinica 9 (1999), 611–677.
- M. Rudelson, R. Vershynin, *Hanson–Wright inequality and sub-gaussian concentration*, Electron.
  Commun. Probab. 18 (2013), [arXiv:1306.2872](https://arxiv.org/abs/1306.2872).
- J. A. Tropp, *User-friendly tail bounds for sums of random matrices*, Found. Comput. Math. 12
  (2012), [arXiv:1004.4389](https://arxiv.org/abs/1004.4389).
- M. Rudelson, R. Vershynin, *The Littlewood–Offord problem and invertibility of random
  matrices*, Adv. Math. 218 (2008), [arXiv:math/0703503](https://arxiv.org/abs/math/0703503).
- F. Benaych-Georges, R. R. Nadakuditi, *The eigenvalues and eigenvectors of finite, low rank
  perturbations of large random matrices*, Adv. Math. 227 (2011),
  [arXiv:0910.2120](https://arxiv.org/abs/0910.2120).
- T. Tao, V. Vu, *Random matrices: the circular law*, Commun. Contemp. Math. 10 (2008),
  [arXiv:0708.2895](https://arxiv.org/abs/0708.2895).
- T. Tao, V. Vu (appendix by M. Krishnapur), *Random matrices: universality of ESDs and the
  circular law*, Ann. Probab. 38 (2010), [arXiv:0807.4898](https://arxiv.org/abs/0807.4898).
- A. Soshnikov, *Determinantal random point fields*, Russian Math. Surveys 55 (2000),
  [arXiv:math/0002099](https://arxiv.org/abs/math/0002099).
- K. Johansson, *On fluctuations of eigenvalues of random Hermitian matrices*, Duke Math. J. 91
  (1998).
- [Provenance and acknowledgments](SOURCES.md).
