# Roadmap: random matrices

**Summary.** This roadmap builds the reusable core of random matrix theory in
Anderson–Guionnet–Zeitouni (**AGZ**), Tao (**T**) and Potters–Bouchaud (**PB**), on Mathlib's
finite-dimensional spectral theory, probability, sub-Gaussian moment-generating functions and
resolvent transform. It builds sample-space extensions, empirical spectral measures and
deterministic spectral estimates, concentration inequalities, the moment and resolvent toolkit,
the named limiting laws, invariant ensembles and exact integration, free probability, deformed and
spiked models, determinantal point processes and Gaussian local statistics, logarithmic gases and
their large deviations, and small singular values. Its end theorems are the
almost-sure semicircle, Marchenko–Pastur and circular laws, the Bai–Yin edge limits, the
Hanson–Wright and matrix Bernstein inequalities, the GOE/GUE eigenvalue densities, asymptotic
freeness of Wigner and Haar-conjugated families, the spiked-model phase transition, the sine and
Airy limits with the Tracy–Widom laws `F₁` and `F₂`, the large deviation principles of the beta
gas and of the Gaussian largest eigenvalue, and the least-singular-value bound.
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

Point processes appear here only through their joint count laws on bounded Borel sets, gap
probabilities and correlation functions; random elements of a configuration space of locally
finite integer-valued measures with the vague topology (AGZ Definition 4.2.1), and weak
convergence of their laws, are outside the roadmap. Dyson Brownian motion (matrix Brownian
motion, the eigenvalue stochastic differential equation, the `β ≥ 1` particle system and its
hydrodynamic limit, AGZ §4.3) is the subject of the DysonBrownianMotion roadmap, which builds on
this one and on StochasticCalculus; no stochastic integral is used here.

Owned elsewhere and consumed here:

- [StandardDistributions](../StandardDistributions/README.md), Layers 0 and 3–6, owns scalar
  Gaussian, gamma and chi-squared laws, multivariate Gaussian laws, real symmetric coordinate
  Lebesgue measure, Cholesky/Bartlett theory and real Wishart distributions, including singular
  Gaussian-Gram laws (`wishartGramMeasure`). Its target 12.1 owns the uniform ball law
  `cond volume (ball c r)`. Here: the complex Gaussian-Gram counterpart, spectral pushforwards,
  the circular law as the transport of target 12.1 to `ℂ`, and large-dimension limits. No second
  real Wishart measure is introduced.
- Tau Ceti already has the empirical spectral and eigenvalue measures of a matrix, the Wigner matrix
  constructor, the semicircle family `semicircleReal` with its moments and transform, the
  Marchenko–Pastur law, the sample second-moment matrix, the Courant–Fischer formula, the
  Hoffman–Wielandt, Weyl, singular-value and rank-perturbation bounds with the Gram form of the rank
  bound, the covering numbers and nets of spheres in finite-dimensional normed spaces, the resolvent
  identities and the trace and moment formulas of spectral measures, the scalar Bernstein and
  McDiarmid inequalities, the method of moments for a compactly supported limit, product extensions
  of a law, the noncrossing partitions with their counts, Kreweras complement and Möbius function,
  and the scalar free probability of freeness, free cumulants, semicircular elements and the free
  central limit theorem; they are consumed by name (see [From Tau Ceti](#from-tau-ceti)). No second
  copy of any of them is introduced.
- [OrthogonalL2Bases](../../Completed/OrthogonalL2Bases/README.md), Parts A–B, supplies Hermite
  polynomials and functions and moment determinacy, implemented in
  `TauCeti.Probability.Moments.*` and `TauCeti.Analysis.SpecialFunctions.Hermite.*`.
  Here: convergence from moments, polynomial-ensemble kernels and Hermite asymptotics.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md),
  Layer 0, owns normalized Haar measure and averaging; its `weyl_integration_formula` is the
  `SU(2)` case. Here: matrix-coordinate Jacobians, Weyl's integration formula on `U(n)` (§5.4),
  eigenvalue/eigenprojector disintegrations and Haar entry integrals.
- [OptimalTransport](../OptimalTransport/README.md), Layers 0–3, owns couplings and Wasserstein
  distances. Here: the eigenvalue coupling and the spectral `W₁`/`W₂` corollaries.
- [OperatorTheory/SpectralSubspacePerturbation](../OperatorTheory/SpectralSubspacePerturbation/README.md),
  SSP-D06 and SSP-D13, owns the Hermitian dilation `[[0,A†],[A,0]]` of a rectangular map and its
  operator-norm perturbation identity.
- [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), OI-B01–OI-B19,
  OI-B23, OI-B29, OI-B30 and Part C, owns the operator-ideal carriers, the nuclear gauge, the
  trace-class family and its completeness, and the Hilbert–Schmidt column model. No second
  trace-class carrier is introduced.
- [FreeProbability](../FreeProbability/README.md), F1–F6, extends Layer 6 rather than supplying
  it: on the same scalar expectations, cumulants and laws it adds the C*-completions, the
  operator-valued and amalgamated theory, formal-series transforms and free Poisson laws of every
  jump. Layer 6, with the scalar free probability that Tau Ceti already has, is the bounded
  scalar core that those sections consume.

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
- Block and low-rank identities: the Schur-complement inverse `Matrix.invOf_fromBlocks₁₁_eq`, the
  block determinant `Matrix.det_fromBlocks₁₁` and the determinant lemma
  `Matrix.det_one_add_mul_comm` (`Mathlib/LinearAlgebra/Matrix/SchurComplement.lean`); the
  Woodbury identity `Matrix.add_mul_mul_inv_eq_sub`
  (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`).

### From Tau Ceti

- `TauCeti.Probability.empiricalMeasureOfFintype` and `empiricalMeasureOfFintype_toMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`): the empirical probability measure of a
  nonempty finite family, with evaluation, integration, pushforward and measurability API.
- `TauCeti.Probability.Moments.*` (moment determinacy) and
  `TauCeti.Analysis.SpecialFunctions.Hermite.*` (Hermite polynomials and functions); the method
  of moments for a compactly supported limit,
  `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`
  (`TauCeti/Probability/Moments/WeakConvergence.lean`).
- Product extensions: `ProbabilityTheory.HasLaw.prod_extension`
  (`TauCeti/Probability/HasLaw.lean`), the law `μ.prod ν` of `(X ∘ Prod.fst, Prod.snd)` under
  `P.prod ν`.
- Scalar concentration: Bernstein's two-sided inequality
  `ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le`
  (`TauCeti/Probability/Moments/Bernstein.lean`) and McDiarmid's inequality for a product of
  identical coordinate laws, `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences`, with
  variance proxy `∑ cᵢ²/4` (`TauCeti/Probability/McDiarmid.lean`).
- Spectral measures (`TauCeti/Analysis/Matrix/SpectralMeasure.lean`): `Matrix.spectralMeasure A hA`,
  the probability measure `L_A` of a Hermitian matrix with nonempty index type, with
  `measurable_spectralMeasure`, `integral_spectralMeasure_eq_sum_eigenvalues₀`, the moments
  `Matrix.integral_pow_spectralMeasure`, the resolvent transform
  `Matrix.resolventTransform_spectralMeasure`, the zero-mass correction
  `Matrix.spectralMeasure_conjTranspose_mul_self` and the pushforward
  `Matrix.map_spectralMeasure_ofReal` onto the eigenvalue measure; the equal nonzero spectra
  `Matrix.filter_map_eigenvalues_conjTranspose_mul_self` (`TauCeti/Analysis/Matrix/Spectrum.lean`);
  and `Matrix.eigenvalueMeasure A`, the probability measure `n⁻¹ ∑ δ_z` over the roots of the
  characteristic polynomial with algebraic multiplicity, with `eigenvalueMeasure_apply` and
  `integral_eigenvalueMeasure`. Both require a nonempty index type.
- Courant–Fischer (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`), the completed
  PolarDecomposition PD-A51–PD-A52: the max–min formula
  `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` and Loewner monotonicity
  `LinearMap.IsSymmetric.eigenvalue_mono`.
- Eigenvalue perturbation: `Matrix.lipschitzWith_eigenvalues₀`, `Matrix.continuous_eigenvalues₀`
  and `Matrix.measurable_eigenvalues₀` (`TauCeti/Analysis/Matrix/Eigenvalues/Continuous.lean`);
  Weyl's additive inequalities `Matrix.IsHermitian.eigenvalues₀_add_le` and
  `Matrix.IsHermitian.le_eigenvalues₀_add` and the operator-norm bound
  `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm` (`…/Eigenvalues/Basic.lean`); the
  Hoffman–Wielandt inequalities `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq`
  and `Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq`
  (`TauCeti/Analysis/Matrix/HoffmanWielandt.lean`); the singular-value bound
  `LinearMap.abs_singularValues_sub_singularValues_le`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`); and the rank bound
  `Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card` with its Gram form
  `Matrix.abs_spectralMeasure_mul_conjTranspose_self_Iic_sub_le_two_mul_rank_div_card`, the bound
  `2 rank(X − Y)/m` for `XXᴴ` and `YYᴴ` with `m` rows
  (`TauCeti/Analysis/Matrix/SpectralMeasure/RankPerturbation.lean`).
- The sample second-moment matrix (`TauCeti/Analysis/Matrix/SampleSecondMoment.lean`):
  `TauCeti.sampleSecondMoment v = r⁻¹ ∑ᵢ vᵢvᵢᴴ` of a finite sample `v : ι → n → 𝕜` with
  `r = card ι`, with `TauCeti.isHermitian_sampleSecondMoment` and
  `TauCeti.posSemidef_sampleSecondMoment`.
- Covering numbers (`TauCeti/Analysis/Normed/Module/CoveringNumber.lean`): the packing bound
  `TauCeti.card_le_of_isSeparated_of_subset_closedBall`, the covering bound
  `TauCeti.coveringNumber_le_of_subset_closedBall` and the net of the unit sphere
  `TauCeti.exists_finset_isCover_sphere`, with at most `(1 + 2/η)^dim` points for `η > 0`.
- Resolvents of Hermitian matrices (`TauCeti/Analysis/Matrix/Resolvent/`): the norm bound
  `Matrix.IsHermitian.l2_opNorm_inv_sub_smul_one_le`, the trace formula `trace_inv_sub_smul_one`,
  the Ward identity `sum_norm_inv_sub_smul_one_apply_sq`, the rank-one update
  `inv_add_smul_vecMulVec_sub_smul_one` and the leave-one-out formula
  `inv_sub_smul_one_apply_self_eq`.
- The resolvent transform (`TauCeti/MeasureTheory/Measure/ResolventTransform/`):
  `MeasureTheory.im_resolventTransform_pos`, `MeasureTheory.Measure.resolventTransform_conj` and
  `MeasureTheory.resolventTransform_map_affine` (`Basic.lean`); the finite moment expansion
  `MeasureTheory.resolventTransform_add_sum_eq` with the remainder bound
  `MeasureTheory.norm_resolventTransform_add_sum_le` and the total-mass asymptotic
  `MeasureTheory.tendsto_mul_I_mul_resolventTransform` (`Expansion.lean`); Stieltjes inversion
  `MeasureTheory.tendsto_intervalIntegral_im_resolventTransform`, with the half-atom endpoint
  terms, and uniqueness `MeasureTheory.Measure.ext_of_resolventTransform` (`Inversion.lean`); and
  the atom formula `MeasureTheory.tendsto_mul_im_resolventTransform` (`Atoms.lean`).
- Named laws: `TauCeti.Probability.semicircleReal a v`
  (`TauCeti/Probability/Distributions/Semicircle/LocationScale.lean`), with
  `measurable_semicircleReal`, `variance_id_semicircleReal`, `map_affine_semicircleReal` and
  `semicircleReal_eq_withDensity`, the moments `integral_pow_two_mul_semicircleReal_zero`
  (`v^k C_k`) and `integral_pow_two_mul_add_one_semicircleReal_zero` (`Moments.lean`), and the
  transform `resolventTransform_semicircleReal_quadratic_eq_zero` and
  `eq_resolventTransform_semicircleReal_iff` (`ResolventTransform.lean`);
  `TauCeti.Probability.marchenkoPastur y`
  (`TauCeti/Probability/Distributions/MarchenkoPastur/Basic.lean`), with
  `marchenkoPastur_eq_withDensity`, `marchenkoPastur_singleton_zero`,
  `ae_eq_zero_or_mem_Icc_marchenkoPastur`, `integral_pow_succ_marchenkoPastur`,
  `integral_id_marchenkoPastur` and `integral_sq_marchenkoPastur`.
- Wigner matrices (`TauCeti/Probability/RandomMatrix/Wigner.lean`): `TauCeti.StrictUpper`,
  `TauCeti.wignerMatrix` and `TauCeti.wignerMatrix_isHermitian`, with `measurable_wignerMatrix`,
  `submatrix_castLE_wignerMatrix`, `indepFun_wignerMatrix_column` and
  `identDistrib_wignerMatrix`.
- Hadamard's bound for Gram matrices (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`):
  `Matrix.det_gram_le_prod_norm_sq` and `Matrix.re_det_gram_le_prod_norm_sq`, the completed
  SuccessiveMinima target 0.1.2.
- Noncrossing partitions (`TauCeti/Combinatorics/NoncrossingPartition/`):
  `Finpartition.IsNoncrossing` and `TauCeti.NoncrossingPartition s` with its order
  (`Basic.lean`), `card_fin_eq_catalan` and `card_isPairing_fin_eq_catalan` (`Catalan.lean`), the
  Narayana count `card_parts_eq_div` (`Narayana.lean`), the Kreweras complement
  `Finpartition.kreweras` with `isNoncrossing_kreweras` (`Kreweras.lean`), the lower intervals
  `iicOrderIso` (`Interval.lean`), the Möbius function `mu_bot_eq_prod` (`Mobius.lean`), and the
  cycle count `orbitCount_formPerm_add_orbitCount_inv_mul_finRotate` (`FormPerm.lean`).
- Scalar free probability (`TauCeti/Probability/FreeProbability/`): `TauCeti.IsFreelyIndependent`
  (`Independence.lean`) and `TauCeti.IsFreelyIndependentElements` (`Variables.lean`);
  `TauCeti.freeCumulant` (`Cumulant/Basic.lean`) and
  `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero` (`Cumulant/Free.lean`); the R-series
  `TauCeti.rSeries` and `IsFreelyIndependentElements.rSeries_sum` (`Cumulant/Series.lean`);
  `PositiveLinearMap.law` (`Law/Basic.lean`); `TauCeti.IsSemicircular`
  (`Semicircular/Basic.lean`); convergence in moments `TauCeti.TendstoInMoments`
  (`Distribution/Convergence.lean`) and
  `TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`
  (`Distribution/Free.lean`); and the free central limit theorem
  `IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal`
  (`CentralLimit.lean`) and `IsFreelyIndependentElements.tendsto_law_inv_sqrt_smul_sum_semicircleReal`
  (`Law/CentralLimit.lean`).

### From TauCetiRoadmap roadmaps

- StandardDistributions: Layers 0 and 3–6, `wishartGramMeasure`, target 12.1 (uniform ball law).
- OrthogonalL2Bases: Parts A–B.
- RepresentationTheory/CompactGroups: Layer 0.
- OptimalTransport: Layers 0–3.
- [SpecialFunctionsAiry](../SpecialFunctionsAiry/README.md): the Airy function `TauCeti.airyAi`
  and its real restriction `TauCeti.Real.airyAi`, with the value at `0` (1.1), Airy's equation
  and uniqueness (1.2), the integral representations (Layer 2), the expansions on the real line
  (3.2, 3.4), the recessive characterization and the tail bound
  `0 < Ai(x) ≤ Ai(0) e^{−(2/3)x^{3/2}}` for `x ≥ 0` (3.6), and the Airy kernel
  `TauCeti.airyKernel` with its closed forms and the bound `|K_Ai(x,y)| ≤ C² e^{−x−y}` on
  `[s,∞)²` (8.5).
- OperatorTheory/SpectralSubspacePerturbation: SSP-D06, SSP-D13.
  OperatorTheory/OperatorIdeals: OI-B01–OI-B19, OI-B23, OI-B29, OI-B30 and Part C.

## How to read the build

Layer 0 makes probabilistic arguments invariant under enlarging the sample space. Layer 1 builds
spectral measures and the deterministic eigenvalue and resolvent estimates. Layers 2 and 3 rest on
Layers 0–1 and are independent of each other: Layer 2 proves concentration and norm bounds, Layer 3
the transform toolkit and the named limiting laws. The finite combinatorial prerequisite
(noncrossing partitions) is independent of analysis and feeds Layers 3, 4 and 6. Layer 4 proves the
global laws of Wigner and sample-covariance matrices; Layer 5 the exact invariant ensembles. Layer 6
builds free probability and asymptotic freeness on Layers 1, 3, 4, 5 and the combinatorics; Layer 7
deformed and spiked models on Layers 1–6. Layer 8 (point processes and Gaussian local statistics)
and Layer 9 (logarithmic gases and large deviations) rest on Layers 1, 3 and 5; Layer 10 (small
singular values and the circular law) on Layers 0–5.

```text
Mathlib / Tau Ceti probability and spectral theory
  → 0 (extensions) → 1 (spectral API)
  → 2 (concentration) and 3 (transforms, laws)
finite noncrossing combinatorics → 3, 4, 6
0–3 → 4 (global laws)
0–3 + StandardDistributions + CompactGroups → 5 (exact ensembles)
1, 3, 4, 5 + combinatorics → 6 (free probability)
1–6 → 7 (deformations, covariance, spikes)
1, 3, 5 + Hermite + OperatorIdeals + Airy → 8 (local statistics)
1, 3, 5 → 9 (large deviations)
0–5 → 10 (circular law)
```

For each new object the build supplies construction or existence, extensionality, measurability
or continuity, invariances, integration and evaluation, and the operations its layer uses. Each
limit theorem records the dimension sequence, the entry law and its moment assumptions, the
coupling across sizes, the normalization, the topology and the mode of convergence in its
statement, and every integrability requirement is proved before a moment, moment-generating
function or log-determinant is evaluated.

## Layer 0: probability arguments invariant under extension

**Sources:** T §1.1, §2.3.2.

### 0.1 Product extensions

For a probability space `(Ω,P)` and a probability law `ν` on a standard Borel space `E`, extend to
`Ω × E` with `P.prod ν`. For `X` with law `μ`, the pair `(X ∘ Prod.fst, Prod.snd)` has law
`μ.prod ν` (Tau Ceti `HasLaw.prod_extension`), so the second coordinate has law `ν` and is
independent of the old random object `X ∘ Prod.fst`. Prove the extension by countable families of
new coordinates, repeated extensions, and the reordering and reassociation of products. Use
`exists_hasLaw_indepFun` and `exists_iid` where only a realization is needed. *Needs:* Mathlib
`Measure.prod`, `HasLaw`, `exists_hasLaw_indepFun`, `exists_iid`; Tau Ceti `HasLaw.prod_extension`.

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
with the needed integrability, prove `E Φ(∑ Xᵢ) ≤ E Φ(∑ (Xᵢ-X'ᵢ)) = E Φ(∑ εᵢ(Xᵢ-X'ᵢ))` (T §2.3.2,
(2.59)–(2.60), for the operator norm; the conditional Jensen step is the same for every convex
`Φ`).
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

Define the empirical finite measure `|ι|⁻¹ ∑ᵢ δ_{xᵢ}` of a finite family indexed by an arbitrary
finite type; it is the zero measure for the empty family. For a nonempty index type it is the
measure underlying `TauCeti.Probability.empiricalMeasureOfFintype`, whose normalization, evaluation,
integration, pushforward from the uniform index law and measurability are reused; no second
empirical probability measure is built. The empirical spectral measure `L_A` of a Hermitian matrix
is Tau Ceti's `Matrix.spectralMeasure A hA`, and the eigenvalue measure of a general complex square
matrix is `Matrix.eigenvalueMeasure A`, both for a nonempty index type, and for Hermitian `A` the
second is the pushforward of the first along `ℝ → ℂ` (`Matrix.map_spectralMeasure_ofReal`; see [From
Tau Ceti](#from-tau-ceti)); `L_A` written below is `Matrix.spectralMeasure A hA`. *Needs:* Tau Ceti
`empiricalMeasureOfFintype`, `Matrix.spectralMeasure`, `Matrix.eigenvalueMeasure`; Mathlib
`Matrix.charpoly`, `Polynomial.roots`.

- The empirical finite measure has total mass one for a nonempty family and zero for the empty
  one, is invariant under reindexing by an equivalence, and behaves under concatenation as the
  mass-weighted average.
- It is measurable as a map into finite measures; `Fin n` families are a specialization.
- Specialize to singular values and squared singular values; prove measurability of
  `A ↦ Matrix.eigenvalueMeasure A` without choosing continuous ordered complex roots.

**Checks.**

- For the family `(0, 0, 1)` the empirical measure gives `{0}` mass `2/3`; a definition counting
  distinct values would give `1/2`.
- `Matrix.spectralMeasure` of `diag(1,-1)` and of `[[0,1],[1,0]]` are both `(δ₁+δ₋₁)/2`: the
  measure depends only on the spectrum, not on the basis.
- `eigenvalueMeasure [[0,1],[0,0]] = δ₀` with mass `1` at `0` (algebraic multiplicity `2`); a
  geometric-multiplicity count would give mass `1/2`.
- `eigenvalueMeasure [[0,-1],[1,0]] = (δ_i+δ_{-i})/2`, which is not supported on `ℝ`.
- For the empty family the empirical finite measure is `0`, not a probability measure.

### 1.2 Ordered eigenvalues and perturbation

Continuity and measurability of the ordered Hermitian eigenvalues, Weyl's additive inequalities
`λ_{i+j-1}(A+B) ≤ λᵢ(A)+λⱼ(B)`, the operator-norm eigenvalue bound and the rank perturbation bound
`sup_t |L_A(-∞,t] - L_B(-∞,t]| ≤ rank(A-B)/n` are Tau Ceti's (`Matrix.continuous_eigenvalues₀`,
`Matrix.measurable_eigenvalues₀`, `Matrix.IsHermitian.eigenvalues₀_add_le`,
`Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`,
`Matrix.IsHermitian.abs_spectralMeasure_Iic_sub_le_rank_div_card`). The max–min formula and Loewner
monotonicity are Tau Ceti's (`LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`,
`LinearMap.IsSymmetric.eigenvalue_mono`, the completed PD-A51–PD-A52); transfer them to
`Matrix.IsHermitian.eigenvalues₀` under `Matrix.toEuclideanLin`. Prove the min–max form and Cauchy
interlacing, with its principal-minor corollaries (AGZ Appendix A; T §1.3). The Gram form of the
rank bound, `sup_t |L_{XX*}(-∞,t] - L_{YY*}(-∞,t]| ≤ 2 rank(X-Y)/p` for `p × n` matrices, is Tau
Ceti's `Matrix.abs_spectralMeasure_mul_conjTranspose_self_Iic_sub_le_two_mul_rank_div_card`.
*Needs:* Tau Ceti Courant–Fischer and eigenvalue perturbation (see [From Tau Ceti](#from-tau-ceti));
Mathlib `eigenvalues₀`, `Matrix.toEuclideanLin`.

The Hoffman–Wielandt inequality `∑ᵢ |λᵢ(A)-λᵢ(B)|² ≤ ‖A-B‖_F²` for Hermitian `A, B` and its
singular-value analogue are Tau Ceti's
`Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` and
`Matrix.sum_sq_singularValues_toEuclideanLin_sub_le_frobenius_norm_sub_sq`, and the singular-value
operator-norm bound is `LinearMap.abs_singularValues_sub_singularValues_le`. Deduce the Lipschitz
estimate `|∫ f dL_A - ∫ f dL_B| ≤ Lip(f) ‖A-B‖_F/√n` and the spectral Wasserstein bounds by
exhibiting the sorted eigenvalue coupling (AGZ Lemma 2.1.19, p. 21; Lemma 2.3.1, pp. 38–39).
*Needs:* Tau Ceti Hoffman–Wielandt and the singular-value bound; OptimalTransport Layers 0–3 for the
Wasserstein corollaries.

**Checks.**

- `A = diag(1,0)`, `B = diag(0,1)`: sorted eigenvalues agree, so the Hoffman–Wielandt left side is
  `0 ≤ 2 = ‖A-B‖_F²`; pairing eigenvalues in the original diagonal order would give `2`.
- `A = diag(1,-1)`, `B = 0`: Hoffman–Wielandt is the equality `2 ≤ 2`.
- `A = diag(1,0,0,0)`, `B = 0`: the rank bound is the equality `1/4 = rank(A)/4`.
- Weyl with `i = j = 1`, `A = B = diag(1,0)`: `λ₁(A+B) = 2 ≤ 1 + 1`; with `A = diag(1,0)`,
  `B = diag(0,1)` it reads `1 ≤ 2`, strict.

### 1.3 Resolvents and moments

The bound `‖R_A(z)‖ ≤ 1/|Im z|`, the trace formula, the Ward identity `∑ⱼ |Rᵢⱼ|² = Im Rᵢᵢ / Im z`,
the rank-one update and the leave-one-out formula for Hermitian `A` and non-real `z` are Tau Ceti's,
and so are `m_{L_A}(z) = trₙ R_A(z)`, `∫ x^k dL_A = trₙ(A^k)`, the equality of the nonzero spectra
of `XX*` and `X*X` and the exact zero-mass correction between their empirical probability measures
(see [From Tau Ceti](#from-tau-ceti)). Schur complements in block form, the matrix determinant lemma
and Sherman–Morrison–Woodbury are Mathlib's (`Matrix.invOf_fromBlocks₁₁_eq`,
`Matrix.det_fromBlocks₁₁`, `Matrix.det_one_add_mul_comm`, `Matrix.add_mul_mul_inv_eq_sub`). Prove
the resolvent identity, positivity and support statements, and uniform-integrability estimates from
trace powers; take the Hermitian dilation of a rectangular matrix from SSP-D06. *Needs:* §1.1;
SSP-D06; Tau Ceti resolvents and spectral measures; Mathlib `resolventTransform` and the block
identities.

**Checks.**

- `A = diag(1,-1)`, `z = i`: `m_{L_A}(i) = ½(1/(1-i) + 1/(-1-i)) = i/2 = tr₂ (A - iI)⁻¹`, with
  positive imaginary part; the opposite sign convention `(z-A)⁻¹` gives `-i/2`.
- Ward identity for `A = diag(1,-1)`, `z = i`, `i = 1`: `|R₁₁|² = 1/2 = Im R₁₁ / Im z`.
- `X = (1, i)` (`p = 1`, `n = 2`): `XX* = 2`, while `X*X` has eigenvalues `2, 0`; the empirical
  probability measures differ by the zero-mass correction `L_{X*X} = ½ L_{XX*} + ½ δ₀`.

### Examples

For `A = [[0,1],[1,0]]`: `trₙ A² = 1 = ∫ x² dL_A`, `‖R_A(i)‖ = 1/√2 ≤ 1`.

### Dependencies

Layer 0 for random versions; SSP-D06; OptimalTransport
Layers 0–3 for the transport corollaries; Tau Ceti `empiricalMeasureOfFintype`, spectral measures,
Courant–Fischer, eigenvalue perturbation and resolvents.

## Layer 2: concentration, replacement and norm bounds

**Sources:** T §§2.1–2.3, §3.2; AGZ §§2.3, 2.4, 4.4; BLM chs. 2, 3, 6; V §§2.7–2.8, 4.4, 4.6; Tropp
2012.

### 2.1 Scalar inequalities and sub-exponential variables

Complete the scalar Hoeffding, Azuma–Hoeffding, McDiarmid and Efron–Stein interfaces. For
independent centred summands with `|Xᵢ| ≤ b` almost surely and `v = ∑ E Xᵢ²`, Bernstein's two-sided
bound `2 exp(-t²/(2(v+bt/3)))` is Tau Ceti's
`ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le` (BLM Theorem 2.10 and Corollary
2.11 with `c = b/3`, pp. 37–38, applied to `±Xᵢ`). For bounded differences `cᵢ`, McDiarmid's bound
is `2 exp(-2t²/∑cᵢ²)` (BLM Theorem 6.2, p. 171, with `v = ∑cᵢ²/4`, and its lower-tail form). Tau
Ceti's `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences` gives the sub-Gaussian bound
behind it for a product of identical coordinate laws; prove it for independent coordinates with
different laws, with a zero denominator handled by the almost-sure constant conclusion. The
Efron–Stein inequality is `Var f(X) ≤ ∑ᵢ E(f(X) - E⁽ⁱ⁾f(X))²` (BLM Theorem 3.1, p. 54). Define a
real random variable to be sub-exponential with parameter `K > 0` when `exp(λ(X - EX))` is
integrable and `E exp(λ(X - EX)) ≤ exp(K²λ²)` for every `|λ| ≤ 1/K` (V Proposition 2.7.1(v), p. 29,
for the centred variable), and prove the Bernstein inequality for independent sums of such variables
(V Theorem 2.8.1). *Needs:* Mathlib `HasSubgaussianMGF`, `mgf`; Tau Ceti Bernstein and McDiarmid.

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
2.3.5). *Needs:* §2.2 (the logarithmic Sobolev inequality and Herbst's argument), §1.2 (the
Lipschitz estimate).

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

The cardinality bound `(1 + 2/η)^n` for an `η`-net of the unit sphere is Tau Ceti's
`TauCeti.exists_finset_isCover_sphere`. Prove the bilinear and quadratic net reductions. For a
`p × n` matrix with independent centred coordinates, each sub-Gaussian with variance proxy at most
`K²`, prove `P(‖X‖ > CK(√p+√n+t)) ≤ 2exp(-ct²)` for `t ≥ 0` (V Theorem 4.4.5). For independent
centred isotropic rows whose every real linear form in direction `u` has sub-Gaussian proxy at most
`K²‖u‖²`, prove `√p - CK²(√n+t) ≤ s_min(X) ≤ s_max(X) ≤ √p + CK²(√n+t)` with probability at least
`1 - 2exp(-ct²)` (V Theorem 4.6.1); a negative lower bound makes no invertibility claim. *Needs:*
§2.1; Mathlib `LinearMap.singularValues`.

### 2.5 Gaussian integration by parts and replacement

Prove Gaussian integration by parts (AGZ Lemma 2.4.5), real and complex Wick/Isserlis formulas, and
a finite-dimensional Lindeberg replacement inequality (T §2.2.4): replacing independent coordinates
whose moments match through degree `r` changes the expectation of a `C^(r+1)` test by a sum of
derivative bounds times `(r+1)`st absolute moments. Include localization and truncation versions and
resolvent differentiation formulas. *Needs:* Layer 0; Mathlib `gaussianReal`.

### 2.6 Trace inequalities and matrix concentration

Develop Golden–Thompson, Lieb concavity of `A ↦ tr exp(B + log A)` for positive-definite `A` (Tropp
2012, Theorem 3.2), and the independent matrix Laplace-transform bound. Deduce the Hermitian matrix
Bernstein inequality `matrix_bernstein`: for independent measurable random Hermitian `d × d`
matrices `Xₖ` with `E Xₖ = 0`, `‖Xₖ‖ ≤ L` and `v = ‖∑ E Xₖ²‖`, `P(‖∑ Xₖ‖ ≥ t) ≤ 2d exp(-(t²/2)/(v +
Lt/3))` for `t > 0` (Tropp 2012, Theorem 1.4, applied to `±Xₖ`). For independent `0 ≤ Yᵢ ≤ LI`, `L >
0`, set `μ_max = λ_max(∑ E Yᵢ)`, `μ_min = λ_min(∑ E Yᵢ)` and prove matrix Chernoff: the probability
of `λ_max(∑ Yᵢ) ≥ (1+δ)μ_max` is at most `d[e^δ/(1+δ)^(1+δ)]^(μ_max/L)` for `δ ≥ 0`, and the
probability of `λ_min(∑ Yᵢ) ≤ (1-δ)μ_min` is at most `d[e^(-δ)/(1-δ)^(1-δ)]^(μ_min/L)` for `0 < δ <
1` (Tropp 2012, Theorem 1.1); `L = 0` is handled directly. Give rectangular Bernstein through the
Hermitian dilation of SSP-D06. These are theorems under summand hypotheses, not consequences of an
assumed matrix moment-generating-function estimate. *Needs:* §2.1; SSP-D06, SSP-D13; Mathlib matrix
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

Imaginary-part positivity, conjugation, affine scaling, total-mass asymptotics, uniqueness,
Stieltjes inversion with the half-atom terms at interval endpoints, the atom formula
`μ{a} = lim_{η↓0} η Im m_μ(a+iη)`, and the finite expansion at infinity
`m_μ(z) = -∑_{k<r} m_k z^(-k-1) + R_r(z)` with `|R_r(z)| ≤ ∫|x|^r dμ / (|z|^r |Im z|)` for a
measure with finite `r`th absolute moment are Tau Ceti's (see [From Tau Ceti](#from-tau-ceti));
for endpoints that are not atoms the inversion is AGZ Theorem 2.4.3. Prove the density formula
`dμ/dx = π⁻¹ lim_{η↓0} Im m_μ(x+iη)` on every open interval where the boundary limit exists and is
continuous. *Needs:* Tau Ceti resolvent transform; Mathlib `resolventTransform`.

**Checks.**

- `μ = δ₀`: `m(z) = -1/z`, the expansion has `R_1 = 0`, and `η Im m(iη) = 1 = μ{0}`.
- `μ = (δ₋₁+δ₁)/2`: `m(z) = z/(1-z²)`, and Stieltjes inversion recovers mass `1/2` at `±1`.
- The remainder bound at `r = 1`, `μ = δ₁`, `z = i`: `|m(i) + 1/i| = |1/(1-i) - i| = 1/√2 ≤ 1`.

### 3.2 Weak convergence from transforms and moments

Prove that weak convergence of probability measures on `ℝ` is equivalent to convergence of the
transforms on the upper half-plane to the transform of a probability measure, with a countable
determining set, the normal-family argument, and random in-probability and almost-sure versions.
Moment convergence implies weak convergence when the limit is compactly supported (Tau Ceti
`MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow`). Prove it when the limiting
moments determine a probability measure, using tightness and higher moments to pass through
unbounded monomials, with the exponential-moment and Carleman sufficient conditions from the
determinacy API (AGZ Theorem 2.4.4; Bai 1999, §2, moment convergence theorem with Carleman's
condition, p. 613). *Needs:* §3.1; Tau Ceti moment determinacy and method of moments; Mathlib
Prokhorov compactness.

### 3.3 Semicircle laws

The semicircle law with centre `a` and variance `v : ℝ≥0` is Tau Ceti's
`TauCeti.Probability.semicircleReal a v`, the image of the unit-radius semicircle under
`y ↦ a + 2√v y`, written `semicircleReal a v` below. Its API at the pin covers everything this
roadmap uses, so no target remains here (see [From Tau Ceti](#from-tau-ceti)):
- for `v > 0` the density `(2πv)⁻¹ √(4v-(x-a)²)` on `[a-2√v, a+2√v]`, and `δ_a` for `v = 0`;
- measurability in `(a, v)`, mean `a`, variance `v`, and the affine image
  `semicircleReal (c a + b) (c² v)` under `x ↦ c x + b`;
- the odd moments `0` and the moment `v^k C_k` of order `2k` for `a = 0`;
- the transform equation `v m² + (z-a)m + 1 = 0` off the support, and its characterization in the
  upper half-plane as the root with `Im m > 0`.

*Needs:* Tau Ceti `semicircleReal`.

**Checks.**

- Total mass at `a = 0`, `v = 1`: `(2π)⁻¹ · (area of a half disc of radius 2) = (2π)⁻¹ · 2π = 1`.
- The fourth moment of `semicircleReal 0 1` is `2 = C₂`; a radius-1 normalization would give
  variance `1/4` instead of `1`.
- `z = i`: `m = i(√5-1)/2 ≈ 0.618 i` solves `m² + im + 1 = 0` with `Im m > 0`; the other root
  `-i(√5+1)/2` has negative imaginary part.
- `v = 0` gives `δ_a`, the pushforward under a constant map.

### 3.4 Marchenko–Pastur laws

The Marchenko–Pastur law `MP_y` is Tau Ceti's `TauCeti.Probability.marchenkoPastur y`,
written `marchenkoPastur y` below: for `y > 0` it has edges `a = (1-√y)²`, `b = (1+√y)²`, atom
`(1-1/y)₊ δ₀` and density `√((b-x)(x-a))/(2πyx)` on `(a,b)`, and `MP_0 = δ₁`. The pin proves the
density, the atom, that it is concentrated on `{0} ∪ [a,b]`, mean `1`, second moment `1 + y`,
variance `y`, and `∫ x^(k+1) dMP_y = ∫ x^k d semicircleReal (1+y) y` (see
[From Tau Ceti](#from-tau-ceti)). *Needs:* Tau Ceti `marchenkoPastur` and the Narayana count;
§3.1.

- Its support is exactly `[a,b]`, together with `{0}` when `y > 1`.
- Its moments are `∑_{π ∈ NC(k)} y^(k-|π|)` for `k ≥ 1`, by the Narayana count of the noncrossing
  partitions of `Fin k` by number of parts.
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
moments and mixed moments, rotational invariance, and that the square of a quarter-circle variable
has law `MP_1`. *Needs:* StandardDistributions target 12.1; Mathlib `ProbabilityTheory.cond`,
`Complex.volume_ball`.

**Checks.**

- `circularLaw` has total mass `π · 1²/π = 1`, `∫ |z|² = 1/2`, and `∫ |z|^(2k) = 1/(k+1)`.
- `∫ z^k d circularLaw = 0` for `k ≥ 1` by rotation invariance, while `∫ |z|² ≠ 0`.
- The quarter-circle law has mass `π⁻¹ · π = 1` and second moment `1 = ∫ x dMP_1`.

### Examples

The low-degree identities used downstream: `E trₙ H² → 1`, semicircle fourth moment `2`, `MP_y`
first moment `1` and second moment `1 + y`, and `MP_y`'s atom `1 - 1/y` at zero for `y > 1`.

### Dependencies

Layers 0–1; StandardDistributions target 12.1; Tau Ceti moment determinacy, resolvent transform,
`semicircleReal`, `marchenkoPastur` and noncrossing partitions.

## Layer 4: Wigner and sample-covariance global laws

**Sources:** AGZ §§2.1–2.4; T §§2.3–2.4; PB chs. 2–4; Bai 1999 §§2.1–2.2.

### 4.1 Constructors

The normalised Wigner matrix `Wₙ/√n` of the top-left `n × n` corner of an infinite array, with
complex entries `ξ` indexed by the strictly upper positions `StrictUpper`, their conjugates below
the diagonal and real diagonal entries `η`, is Tau Ceti's `TauCeti.wignerMatrix ξ η n ω`, with
`TauCeti.wignerMatrix_isHermitian`, measurability, the corner relation
`submatrix_castLE_wignerMatrix`, the independence of a minor and the removed row's off-diagonal
entries `indepFun_wignerMatrix_column`, and `identDistrib_wignerMatrix`; it is written
`wignerMatrix` below. The sample covariance `sampleCovariance X = XX*/n` of a `p × n` matrix `X` is
Tau Ceti's `TauCeti.sampleSecondMoment` of the columns of `X`, and `sampleCovariance_isHermitian` is
`TauCeti.isHermitian_sampleSecondMoment`. Provide law characterizations for independent
upper-triangular entries with a separate diagonal law, the real-to-complex embedding and i.i.d.
rectangular ensembles. Centring and Hermitian symmetry are hypotheses, not consequences of
identically distributed entries. *Needs:* Layer 0; Tau Ceti `wignerMatrix`, `sampleSecondMoment`;
Mathlib `HasLaw`, `iIndepFun`.

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
renormalization estimates (Bai 1999, Theorem 2.4; AGZ Theorem 2.1.21 is the i.i.d. case). Prove
`wigner_semicircle_ae`: for i.i.d. complex upper entries of finite second moment with
`E|ξ - Eξ|² = 1`, an independent i.i.d. real diagonal with no moment condition, and the corners
of one infinite array, almost surely the empirical spectral measures converge weakly to
`semicircleReal 0 1` (Bai 1999, Theorem 2.1). The real part of the mean is removed by the rank bound
of §1.2. The imaginary part `ic S/√n`, where `S` has `+1` above the diagonal and `-1` below it, has
full rank and eigenvalues `c cot((2k-1)π/2n)/√n`; the fewer than `4|c| n^{3/4}` of them that exceed
`n^{-1/4}` in absolute value are removed by the rank bound, and the rest by the Lévy-distance form
of Hoffman–Wielandt (Bai 1999, proof of Theorem 2.1, with Lemmas 2.2–2.3). The diagonal is removed
by truncation at `ε√n`, the rank bound for the few large entries and the operator-norm bound for the
rest. The centred case with a diagonal of finite second moment is T Theorem 2.4.2. No fourth moment
is required for the global law. Provide the resolvent proof's self-consistency estimate, fluctuation
bound, stability and uniqueness argument in the upper half-plane, and the identification with §3.3.
*Needs:* §§4.1–4.2, 1.2, 3.2, 3.3.

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

Define `gaussianEnsemble β n g`: for `β = 1` the real symmetric matrix with entries `g(i,j)` off the
diagonal and `√2 g(i,i)` on it, otherwise the Hermitian matrix with `(g(i,j) + i g(j,i))/√2` above
the diagonal and `g(i,i)` on it, all divided by `√n`; prove `gaussianEnsemble_isHermitian`. With
standard Gaussian coordinates it is GOE (`β = 1`) or GUE (`β = 2`) in the normalization of the
Conventions. Prove the density of these laws on the real self-adjoint space, orthogonal and unitary
conjugation invariance, and equivalence of the entry and invariant-density characterizations (AGZ
(2.5.1) and the paragraph after it, p. 52). For the complex Hermitian space use product Lebesgue
measure in diagonal real and upper off-diagonal real and imaginary coordinates and prove its
relation to the trace-inner-product volume. Construct real and complex Ginibre and Gaussian Gram
laws. *Needs:* StandardDistributions Layers 3 and 6 (real symmetric coordinate Lebesgue measure);
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
*Needs:* §5.1; RepresentationTheory/CompactGroups Layer 0.

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

Prove Weyl's integration formula on `U(n)`: for nonnegative measurable central `φ`,
`∫ φ dHaar = (n!)⁻¹ ∫_{[0,2π]^n} φ(e^{i diag θ}) ∏_{i<j}|e^{iθᵢ}-e^{iθⱼ}|² ∏ dθᵢ/(2π)` (AGZ
Proposition 4.1.6, (4.1.6)), from the spectral change of variables of §5.2 for normal matrices.
Specialize it to the circular unitary ensemble: eigenangles in `[0,2π)` with density
`((2π)^n n!)⁻¹ ∏_{i<j}|e^{iθᵢ}-e^{iθⱼ}|²` and independent Haar eigenflags. Prove complex Schur
triangularization and the complex Ginibre joint eigenvalue density by the Schur change of variables
with its triangular-coordinate Jacobian. Prove the HCIZ integral for Hermitian `A, B` and real `t`,
with continuous extensions at repeated eigenvalues and `t = 0`:
`∫ exp(t tr(AUBU*)) dU = c_n t^(-n(n-1)/2) det[exp(t aᵢ bⱼ)] / (Δ(a)Δ(b))`, `c_n = 1!·2!⋯(n-1)!`,
`Δ(a) = ∏_{i<j}(aⱼ-aᵢ)`, when `t ≠ 0` and both spectra are simple, and a separate nonsingular
rank-one formula. *Needs:* §5.2; RepresentationTheory/CompactGroups.

**Checks.**

- CUE, `n = 2`: `∫∫ |e^{iθ₁}-e^{iθ₂}|² = 2(2π)²`, so the density has mass `1`.
- HCIZ, `n = 2`: as `t → 0`, `det ≈ t(a₂-a₁)(b₂-b₁)` and the right side tends to `c_2 = 1 = ∫ 1`;
  the opposite Vandermonde sign would give `-1`.
- Complex Ginibre, `n = 1`: density `π⁻¹ e^{-|z|²}`.

### Examples

GUE at `n = 2`: the eigenvalue gap `λ₁ - λ₂` has density proportional to `s² e^{-s²/2}` on
`s > 0`, which vanishes quadratically at `0` (level repulsion with `β = 2`).

### Dependencies

Layers 0–3; StandardDistributions Layers 3–6; RepresentationTheory/CompactGroups Layer 0.

## Finite combinatorial prerequisite for Layers 3, 4 and 6

Noncrossing partitions are Tau Ceti's: a finite partition is noncrossing
(`Finpartition.IsNoncrossing`) when there are no `a < b < c < d` with `a, c` in one block and
`b, d` in a different block, and `TauCeti.NoncrossingPartition s` is their lattice under
refinement. The pin proves the decomposition of lower intervals, the Kreweras complement, the
Möbius function, the Catalan counts of noncrossing partitions and pairings, the Narayana counts by
number of blocks, and the geodesic condition that a noncrossing partition of `Fin n` and its
Kreweras complement have `n + 1` cycles in total (see [From Tau Ceti](#from-tau-ceti)). Prove the
converse for pairings, that a pairing of `Fin 2k` whose permutation composed with the long cycle
has the maximal number `k + 1` of cycles, fixed points included, is noncrossing, and the
equivalence of noncrossing pairings with the planar closed-walk leading terms of §4.2.
*Needs:* Tau Ceti noncrossing partitions; Mathlib `Finpartition`.

**Checks.**

- `|NC(3)| = 5 = C₃` and `|NC(4)| = 14`: all 15 partitions of `Fin 4` except `{{0,2},{1,3}}`.
- The Narayana count of `NC(4)` with two blocks is `6`; noncrossing pairings of `Fin 4` number
  `2` of the `3` pairings.
- The Kreweras complement of the partition into singletons is the one-block partition.

## Layer 6: free probability and asymptotic freeness

**Sources:** AGZ §§5.2–5.4; T §2.5; PB chs. 10–12, 15.

### 6.1 Noncommutative probability spaces

The law of a self-adjoint element `a` of a unital C*-algebra under a positive linear functional
is Tau Ceti's `PositiveLinearMap.law φ a`, with its moment identities, its concentration on the
spectrum, its characterization by integration of the continuous functional calculus, and its
total mass `1` when `φ 1 = 1` (see [From Tau Ceti](#from-tau-ceti)); joint algebraic
distributions as evaluation of noncommutative polynomials are Tau Ceti's as well
(`TauCeti/Probability/FreeProbability/Distribution/Basic.lean`). Develop the real and complex
scalar extension of word laws, and Cauchy–Schwarz and norm bounds for positive normalized
functionals, adding traciality where needed. A word functional without positivity is not a
probability measure. *Needs:* Tau Ceti free probability; Mathlib C*-algebras, `cfc`.

**Checks.**

- `(Mat_n(ℂ), trₙ)` is a tracial noncommutative probability space and the law of a Hermitian `A`
  is `L_A`.
- The functional `φ(p) = p(1) - p(0)` on `ℂ[x]` has `φ(1) = 0`, so it is not unital.
- The unital functional on `ℂ[x]` with `φ(x) = 0`, `φ(x²) = -1` has `φ(x*x) = -1 < 0`, so no
  probability measure represents it.

### 6.2 Freeness and free cumulants

Freeness of unital subalgebras and of families of elements, its stability under subfamilies and
homomorphisms, the contrast with commuting independence, the dependence of mixed moments on the
individual distributions only, free cumulants with their multilinearity and the moment–cumulant
formula, and freeness iff mixed cumulants vanish (AGZ Definition 5.3.1, Theorem 5.3.15) are Tau
Ceti's (`TauCeti.IsFreelyIndependent`, `TauCeti.IsFreelyIndependentElements`,
`TauCeti.freeCumulant`, `TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`). Construct free
products with positive state through the reduced-word Hilbert-space construction (vacuum, inner
product, bounded representations, positivity, freeness). *Needs:* §6.1; Tau Ceti free
probability and noncrossing partitions.

**Checks.**

- For free centred `a, b`: `φ(abab) = 0`, while commuting independent variables give
  `φ(a²)φ(b²)`.
- Free cumulants: `κ₄ = m₄ - 2m₂²` for a centred variable, so the semicircle has `κ₄ = 2 - 2 = 0`
  and the standard Gaussian has free `κ₄ = 1` (classical `κ₄ = 0`).
- Scalars are free from every subalgebra.

### 6.3 Free convolution and transforms

Define free additive convolution on compactly supported real probability measures, and free
multiplicative convolution on compactly supported nonnegative laws via `a^(1/2) b a^(1/2)`. Prove
well-definedness, associativity, commutativity at the level of laws, identities, scaling, support
bounds and weak continuity on uniformly bounded supports. For `G = -m` construct the local inverse
near infinity and the R-transform by `G^(-1)(w) = 1/w + R(w)`; define `ψ(z) = ∫ zx/(1-zx) dμ` and
`S(w) = (1+w)ψ^(-1)(w)/w` when the first moment is nonzero. The formal R-series and its additivity
over free families are Tau Ceti's (`TauCeti.rSeries`, `IsFreelyIndependentElements.rSeries_sum`).
Prove the analytic-germ bridge to the formal R-series, additivity of R-transforms of measures and
multiplicativity of S-transforms, and identify `R_{SC_v}(w) = vw`, `R_{MP_y}(w) = 1/(1-yw)`,
`S_{MP_y}(w) = 1/(1+yw)`. *Needs:* §§6.2, 3.1, 3.3, 3.4; Tau Ceti free probability.

**Checks.**

- `semicircleReal 0 s ⊞ semicircleReal 0 t = semicircleReal 0 (s+t)` by `R = sw + tw`.
- `(δ₋₁+δ₁)/2 ⊞ (δ₋₁+δ₁)/2` is the arcsine law `π⁻¹(4-x²)^(-1/2)` on `(-2,2)`, while classical
  convolution gives `¼δ₋₂ + ½δ₀ + ¼δ₂`.
- `δ_a ⊞ μ` is the translate of `μ` by `a`, and `S_{δ_a} = 1/a`.
- `MP_y` has free cumulants `y^(n-1)`, so `R = 1/(1-yw)`.

### 6.4 Free limit theorems

The free central limit theorem is Tau Ceti's
`IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal` (moments) and
`IsFreelyIndependentElements.tendsto_law_inv_sqrt_smul_sum_semicircleReal` (laws): for freely
independent self-adjoint variables `aᵢ` with `φ(aᵢ) = 0`, `sup_i |φ(aᵢ^k)| < ∞` for every `k`
and `N⁻¹ ∑_{i<N} φ(aᵢ²) → v`, the moments of `N^(-1/2) ∑_{i<N} aᵢ` converge to those of
`semicircleReal 0 v`, and the laws converge weakly (AGZ Lemma 5.3.32 is the case
`φ(aᵢ²) = 1`). Prove the free Poisson limit for free projections of
trace `λ/n`: their sums tend to the law with all free cumulants `λ` (for `λ > 0` the dilation by
`λ` of `MP_(1/λ)`; for `λ = 0` the Dirac mass at zero), with moment convergence and the
support/tightness argument; projection arrays exist only once `n ≥ λ` (AGZ §5.3.3, the exercise on
the free Poisson law). *Needs:* §§6.2–6.3; Tau Ceti free central limit theorem.

**Checks.**

- Freely independent identically distributed bounded centred variables of variance `1` satisfy
  the hypotheses, so the identically distributed free central limit theorem is a special case.
- Free variables alternating between a standard semicircular and a variable of law
  `(δ₋₁+δ₁)/2` are centred of variance `1` with bounded moments but not identically
  distributed; the limit is still `semicircleReal 0 1`.
- Variances alternating between `1` and `3` average to `2` and give the limit
  `semicircleReal 0 2`, not `semicircleReal 0 1`.

### 6.5 Asymptotic freeness

Prove asymptotic freeness in normalized trace moments, in expectation and almost surely, for
finitely many independent Wigner matrices `Xⁱ/√n` (real symmetric or complex Hermitian) whose
entries are centred with `E|X(m,ℓ)|² = 1` and have moments of every order bounded uniformly in the
size, the index `i` and the position, jointly with a deterministic family of uniformly bounded
operator norm having a joint limiting star-moment law (AGZ Theorems 5.4.2 and 5.4.5); GUE and GOE
are the Gaussian cases. The entries need not be identically distributed: AGZ's Wigner matrices have
i.i.d. entries, but the proof of Theorem 5.4.2 uses only independence, centring, unit second moments
and (5.4.1). The almost-sure statement for independent Wigner matrices is
`wigner_asymptotically_free`, with per-entry hypotheses: almost surely `(Xⁱ/√n)ᵢ` converges in
moments (`TauCeti.TendstoInMoments` for the normalized traces) to any freely independent family of
standard semicircular elements. Every such family has the same joint distribution
(`TauCeti.IsFreelyIndependentElements.jointDistribution_eq_of_forall_pow`), so the null set does not
depend on the choice. Prove the Haar-conjugation version for independent Haar unitaries and
deterministic bounded Hermitian matrices with limiting individual laws (AGZ Theorem 5.4.10,
Corollary 5.4.11(i)); its almost-sure two-matrix case is `haar_conj_asymptotically_free`: for
Hermitian `Aₙ, Bₙ` of uniformly bounded operator norm whose normalized-trace moments converge to
those of a free pair `(s 0, s 1)`, and `Uₙ` Haar distributed on `U(n)`, almost surely
`(Aₙ, UₙBₙUₙ*)` converges in moments to `(s 0, s 1)`. Build Haar entry moment and Weingarten
formulas, their large-dimension estimates, mixed-word counting, and variance and higher
centred-moment bounds; convert matrix moment limits into spectral weak limits for self-adjoint
polynomials. *Needs:* §§6.2–6.3, 4.1–4.2, 5.1, 5.4; Tau Ceti `TendstoInMoments` and
`IsSemicircular`.

### Examples

For independent GUE `H₁, H₂`: `E trₙ(H₁H₂H₁H₂) → 0` and `E trₙ(H₁²H₂²) → 1`, the values of two
free semicircular variables.

### Dependencies

Layers 1, 3, 4 (moment method), 5; the finite combinatorial prerequisite.

## Layer 7: deformations, covariance spectra and spikes

**Sources:** PB chs. 10, 14, 15, 17, §§19.1–19.3; AGZ §5.4; Benaych-Georges–Nadakuditi 2011;
Ledoit–Péché 2011.

### 7.1 Deformed Wigner matrices

For deterministic Hermitian `Dₙ` of uniformly bounded norm with limiting empirical law `ν` and
independent GUE `Hₙ`, prove `L_{Dₙ+√t Hₙ} → ν ⊞ SC_t` almost surely (AGZ Theorem 5.4.5) and the
Pastur equation
`m(z) = ∫ (x-z-tm(z))⁻¹ dν(x)`, with existence and uniqueness in the Stieltjes class. Prove the
resolvent deterministic equivalent against deterministic unit vectors for fixed `Im z > 0` and
its extension uniformly on compact real intervals separated from the limiting and
finite-dimensional spectra when that separation is established. *Needs:* §§6.3, 6.5, 5.1, 3.2.

**Checks.**

- `ν = δ₀`: the Pastur equation becomes `tm² + zm + 1 = 0`, the transform equation of
  `semicircleReal 0 t`.
- `t = 0`: `m = m_ν`.

### 7.2 Population covariance

For deterministic `T_p ≥ 0` with `L_{T_p} → ν`, and real or complex i.i.d. `X` with mean zero and
variance 1, prove the almost-sure limiting law of `T_p^(1/2) XX*/n T_p^(1/2)` with `p/n → y > 0`
(Bai 1999, Theorem 3.4 and (3.9) for diagonal `T_p`; Remark 3.2 for general `T_p ≥ 0`, p. 643). Its
companion transform solves `z = -1/m̲ + y ∫ t/(1+t m̲) dν(t)`, `m̲ = -(1-y)/z + ym`, with the
upper-half-plane and normalization conditions; prove existence, uniqueness, the zero-atom formula
and the identification with `ν ⊠ MP_y`. Under the additional assumptions `sup‖T_p‖ < ∞` and a finite
fourth moment, give the deterministic matrix equivalent `Q(z) = [-z(I + m̲(z)T_p)]⁻¹` for fixed
positive imaginary part, in normalized trace against deterministic bounded matrices, including
isotropic and finite-atomic population laws and singular `T_p`. *Needs:* §§4.4, 6.3, 1.3.

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
spectral projector. Prove the nonlinear-shrinkage limit (Ledoit–Péché 2011, Theorem 1.4
and (13), arXiv:0911.3010 numbering). Let `X` be `p × n` with i.i.d. real or complex entries of
mean zero, variance 1 and twelfth absolute central moment bounded uniformly in `p` and `n`; let
`T_p` be Hermitian positive definite and independent of `X`, with spectral distribution converging
almost surely to a law `ν` supported in a compact interval of `(0,∞)`; let `p/n → y > 0`, and let
`λᵢ`, `uᵢ` be the eigenvalues and orthonormal eigenvectors of `S = T_p^{1/2}XX*T_p^{1/2}/n`, whose
limiting spectral law `μ` has Stieltjes transform `m`. Then for every `x ≠ 0` the weighted
distribution function `p⁻¹ ∑_{λᵢ ≤ x} uᵢ*T_puᵢ` converges almost surely to a nonrandom `Δ(x)`.
For `y ≠ 1`, `Δ(x) = ∫_{(-∞,x]} δ dμ` with `δ(λ) = λ/|1-y-yλ m(λ+i0)|²` for `λ > 0`, the value
of (13) at `λ = 0` when `y > 1`, and `δ = 0` otherwise. The route is the limit of
`p⁻¹ tr g(T_p)(S - z)⁻¹` (their Theorem 1.2) and Stieltjes inversion (their (12)); this does not
assert convergence of individual eigenvector weights.
*Needs:* §7.2.

**Checks.**

- Gaussian entries satisfy the moment hypothesis, and in Ledoit–Péché's notation `γ = n/p = 1/y`
  turns their weight `λ/|1 - γ⁻¹ - γ⁻¹λ m̆(λ)|²` into `δ(λ)`.
- `ν = δ₁`: `w = 1-y-yzm` solves `w² - (1-y+z)w + z = 0`, so on the support `|w|² = x` and the
  weight `x/|w|²` is `1 = uᵢ*Iuᵢ`.
- For `T = I` the oracle eigenvalues are all `1` in every basis.

### Examples

PB's `g = -m` turns the Pastur equation into `g(z) = ∫ (z - x - t g(z))⁻¹ dν(x)`.

### Dependencies

Layers 1–6.

## Layer 8: point processes and Gaussian local statistics

**Sources:** AGZ ch. 3, §4.2; T §2.6, §§3.3–3.4; PB ch. 6, §14.1; Soshnikov 2000.

### 8.1 Eigenvalue counts and correlation functions

Point processes are handled through counts, not as random elements of a configuration space. For
a random Hermitian `n × n` matrix `A` and a Borel set `B ⊆ ℝ` (Borel `B ⊆ ℂ` and the characteristic
roots for a general complex matrix) define the eigenvalue count `N_A(B) = #{i : λᵢ(A) ∈ B}` with
multiplicity, so `N_A = n L_A` is a finite measure of mass `n`. Prove that `ω ↦ N_A(B)(ω)` is
measurable, so for bounded Borel `B₁, …, B_m` the joint count law, the law of
`(N(B₁), …, N(B_m))` on `ℕ^m`, is defined, and that it determines the gap probabilities
`P(N(B) = 0)`. Define the `k`-point correlation function relative to a reference measure `μ` by
the factorial-moment identity
`E ∏ⱼ N(Bⱼ)(N(Bⱼ)-1)⋯(N(Bⱼ)-kⱼ+1) = ∫_{B₁^{k₁}×⋯×B_m^{k_m}} ρ_k dμ^k` for pairwise disjoint
`Bⱼ` and `k = ∑ kⱼ` (AGZ Definition 4.2.3 and Lemma 4.2.5(b)). Prove that when the counts have
exponential moments the correlation functions determine the joint count law, since the
generating function `E ∏ⱼ zⱼ^{N(Bⱼ)} = ∑_k ∏ⱼ (zⱼ-1)^{kⱼ}/kⱼ! · E ∏ⱼ N(Bⱼ)(N(Bⱼ)-1)⋯(N(Bⱼ)-kⱼ+1)`
is then entire. Under `x ↦ c(x-a)`, `c > 0`, the counts
become `N'(B) = N(a + c⁻¹B)` and the correlation functions relative to Lebesgue measure become
`ρ'_k(y) = c^(-k) ρ_k(a+y₁/c, …, a+y_k/c)`. Convergence of point processes in this roadmap means
convergence of joint count laws on bounded Borel sets whose boundaries are Lebesgue-null, and of
gap probabilities, the form of AGZ Theorems 3.1.1 and 3.1.4. *Needs:* §1.1.

**Checks.**

- The eigenvalue count has total mass `N_A(ℝ) = n`, `L_A` has mass `1`.
- Scaling `x ↦ 2x` sends a unit-intensity `ρ₁ = 1` to `ρ'₁ = 1/2`.
- `A = diag(1,1)`: `N_A = 2δ₁`, of mass `2`, and `N_A({1}) = 2`; a definition through distinct
  eigenvalues gives `δ₁`.

### 8.2 Orthogonal polynomial ensembles

Prove Andréief's identity (AGZ Lemma 3.2.3) and the determinantal structure of orthogonal polynomial
ensembles (AGZ Lemma 3.2.2 for GUE). For a weight `w` with all moments finite, obtain the
orthonormal polynomials of `L²(w)` by Gram–Schmidt of the monomials (Mathlib
`InnerProductSpace.gramSchmidt` and `InnerProductSpace.gramSchmidtNormed`) and prove their
three-term recurrence. Construct the GUE kernel from the Hermite functions, the Laguerre and Jacobi
unitary-ensemble kernels from the orthonormal polynomials of the weights `x^a e^{-x}` on `(0,∞)` (`a
> -1`) and `(1-x)^a (1+x)^b` on `(-1,1)` (`a, b > -1`), and the CUE and complex Ginibre kernels,
each with its reference measure. Prove Christoffel–Darboux from the three-term recurrence, the
reproducing and projection identities, correlation functions, and mean and variance of counts and
linear statistics. *Needs:* §5.2, §5.4; OrthogonalL2Bases Parts A–B; Mathlib
`InnerProductSpace.gramSchmidt`.

**Checks.**

- `n = 1` Laguerre unitary kernel with weight `w(x) = x^a e^{-x}`:
  `K(x,y) = w(x)^(1/2) w(y)^(1/2)/c₀`, with `c₀ = ∫₀^∞ x^a e^{-x} dx = Γ(a+1)`.
- The GUE kernel satisfies `∫ K(x,x) dx = n`.
- The CUE kernel `K(θ,φ) = (2π)⁻¹ ∑_{k<n} e^{ik(θ-φ)}` relative to Lebesgue measure on
  `[0,2π)` has `K(θ,θ) = n/(2π)` and `∫₀^{2π} K(θ,θ) dθ = n`; at `n = 2` these are `1/π` and
  `2`.

### 8.3 Determinantal point processes from continuous kernels

An accepted kernel is a continuous Hermitian kernel `K : S → S → ℂ` on a locally compact Polish
space `S` with a locally finite reference measure `μ`, positive semidefinite (every finite matrix
`[K(xᵢ,xⱼ)]` is positive semidefinite), whose integral operator on `L²(μ)` is a contraction.
Prove Mercer's theorem: for a continuous positive semidefinite Hermitian kernel on a compact metric
space with a finite Borel measure, the eigen-expansion converges uniformly on the support of the
measure, the integral operator is trace class, and its trace is `∫ K(x,x) dμ(x)` (AGZ Lemma 4.2.13,
quoting Simon 2005, Theorem 2.12). Build on the operator-ideal carriers the trace-class
integral-operator and Fredholm-determinant theory: summability, the trace functional, exterior
powers, determinant series, continuity in trace norm and restriction to windows. For each
relatively compact Borel window `W`, apply Mercer's theorem on the compact support of `μ|_W` to
prove that `K_W` is a positive trace-class contraction with `tr K_W = ∫_W K(x,x) dμ(x)` and
`tr Λ^k K_W = (k!)⁻¹ ∫_{W^k} det[K(xᵢ,xⱼ)] dμ^k(x)`, hence
`det(I-K_W) = ∑_k ((-1)^k/k!) ∫_{W^k} det[K(xᵢ,xⱼ)] dμ^k(x)`. These identities come before
`det[K(xᵢ,xⱼ)]` is used as the `k`-point correlation function relative to `μ`. Kernels defined
only up to null sets, which need the trace-compatible representative of Soshnikov 2000 (§1,
Lemmas 1–2 and (1.14)) and AGZ §4.2.2, are outside this definition.

For an accepted kernel `K` and pairwise disjoint relatively compact Borel `B₁, …, B_m`, a joint
count law of `K` on `(B₁, …, B_m)` is a probability measure `P` on `ℕ^m` whose generating function
is the Fredholm determinant: `∑_{k ∈ ℕ^m} P{k} ∏ⱼ zⱼ^{kⱼ} = det(I - ∑ⱼ (1-zⱼ) 1_{Bⱼ} K 1_{Bⱼ})`
for `z ∈ ℂ^m` with every `|zⱼ| ≤ 1`. Prove that it is unique when it exists, since a probability
measure on `ℕ^m` is determined by its generating function on the closed unit polydisc, that its
factorial moments are `∫_{B₁^{k₁}×⋯×B_m^{k_m}} det[K(xᵢ,xⱼ)] dμ^k` (so `det[K(xᵢ,xⱼ)]` are its
correlation functions in the sense of §8.1), and that its void probability is
`P(N(B)=0) = det(I-K_B)`. Existence for an arbitrary accepted kernel goes through random
configurations (AGZ Propositions 4.2.19–4.2.20 and Corollaries 4.2.21–4.2.22), excluded under [Scope
and ownership](#scope-and-ownership); prove existence in the following three cases, which cover
every kernel used below.

- **Finite ensembles.** For the kernel of an orthogonal polynomial ensemble of §8.2, the joint law
  of the eigenvalue counts `(N_A(B₁), …, N_A(B_m))` of §8.1 is a joint count law: prove the
  generating-function identity from the factorial-moment expansion of §8.1, applying the identities
  above to the restriction of the kernel to `B₁ ∪ ⋯ ∪ B_m`. The exponential count moments that
  expansion needs on a bounded window `W` come from Hadamard's bound `det[K(xᵢ,xⱼ)] ≤ ∏ᵢ K(xᵢ,xᵢ)`,
  taken from Tau Ceti's `Matrix.det_gram_le_prod_norm_sq` by realizing each finite kernel matrix as
  a Gram matrix, which with the trace identity gives `α_k(W^k) ≤ (tr K_W)^k`.
- **One set.** For every accepted `K` and one set `B`, `det(I-(1-z)K_B) = ∏ₖ (1 - λₖ + λₖ z)` over
  the eigenvalues `λₖ ∈ [0,1]` of `K_B`, so the law of a sum of independent Bernoulli(`λₖ`)
  variables is the count law (AGZ Corollary 4.2.24). Prove the central limit theorem for these
  counts when the variance diverges (AGZ Theorem 4.2.25).
- **Limits.** For locally uniform limits of finite-ensemble kernels, by the convergence criterion
  below; the sine and Airy kernels of §8.4 are of this kind.

Prove the convergence criterion: if kernels `Kₙ` accepted on `ℝ` with Lebesgue reference measure
have joint count laws on every finite family of pairwise disjoint bounded Borel sets and converge
uniformly on compact sets to a continuous `K`, then `K` is accepted (positive semidefiniteness
passes to the pointwise limit; the contraction bound follows from Hilbert–Schmidt convergence on
each bounded window), the correlation functions converge locally uniformly, and on every such
family the joint count laws of `Kₙ` converge to a joint count law of `K`, together with the gap
probabilities. The generating functions converge on the closed polydisc, with Hadamard's bound
dominating the Fredholm expansions, and the laws are tight since `E N(B) = ∫_B Kₙ(x,x) dx` is
bounded in `n`. *Needs:* §§8.1–8.2; OperatorIdeals OI-B01–OI-B19, OI-B23, OI-B29, OI-B30 and
Part C; Tau Ceti `Matrix.det_gram_le_prod_norm_sq`.

**Checks.**

- For Lebesgue measure on `ℝ`, the measurable kernel `1_{x=y}` has positive semidefinite finite
  matrices and zero integral operator, yet `∫_{[0,1]} K(x,x) dx = 1`; its `det[K(xᵢ,xⱼ)]` are the
  correlation functions of the unit-rate Poisson process, whose void probability on `[0,1]` is
  `e^{-1} ≠ det(I-0) = 1`. Continuity of the kernel excludes it.
- `K = λ φ⊗φ` with `‖φ‖ = 1`: for `0 ≤ λ ≤ 1` the count law on `B` is Bernoulli(`λ∫_B φ²`),
  with `P(N(B)=0) = 1 - λ∫_B φ² = det(I-K_B)`; for `λ > 1` the contraction bound fails and
  `det(I-K) = 1-λ < 0` is the value at `z = 0` of no generating function.
- At `z = (1, …, 1)` the defining determinant is `det I = 1`, the total mass; for the GUE kernel
  of size `n` and `B = [-R, R]`, `det(I-(1-z)K_B) = ∏ₖ (1 - λₖ(R) + λₖ(R) z)`, which tends to
  `zⁿ`, the law `δₙ`, as `R → ∞`, since each of the `n` eigenvalues of `K_{[-R,R]}` tends to `1`.
- The sine kernel has `K(x,x) = 1` and `ρ₂(x,y) = 1 - (sin π(x-y)/(π(x-y)))² → 0` as `y → x`.

### 8.4 Bulk and edge limits

Prove Hermite bulk and turning-point asymptotics with uniform bounds strong enough to pass to
correlation functions and gap probabilities. For GUE and `E ∈ (-2,2)`, scale by
`nρ_SC(E)(λ-E)`; the limiting kernel is `sin(π(x-y))/(π(x-y))` with diagonal value 1. At the upper
edge use `n^(2/3)(λ-2)` and the Airy kernel `K_Ai(x,y) = ∫₀^∞ Ai(x+t)Ai(y+t) dt`. The Airy
function, its equation `Ai''(x) = x Ai(x)`, its integral representations, its expansions on the
real line, its decay and the Airy kernel with its closed forms and exponential bounds are consumed
from SpecialFunctionsAiry (see [Exact supplier contracts](#from-taucetiroadmap-roadmaps)); this
section proves the matching of the scaled Hermite kernel with `K_Ai` at the edge and the tail
control of the scaled kernels on unbounded intervals. Define `F₂(s) = det(I-K_Ai)` on
`L²(s,∞)`, prove it is a continuous distribution function and
`P(n^(2/3)(λ_max(GUE)-2) ≤ s) → F₂(s)`, and prove convergence of the joint count laws of the
scaled eigenvalues on bounded Borel sets to the joint count laws of the Airy and sine kernels
(§8.3), with the bulk gap distributions. *Needs:* §§8.2–8.3; OrthogonalL2Bases Parts A–B;
SpecialFunctionsAiry 1.1–1.2, Layer 2, 3.2, 3.4, 3.6 and 8.5.

`Suggested.lean` writes the Fredholm determinant as its series, AGZ (3.1.6):
`fredholmDet K A = ∑ₖ ((-1)^k/k!) ∫_{A^k} det[K(xᵢ,xⱼ)] dx`. It defines `airyAi` and
`airyKernel` as local copies of SpecialFunctionsAiry 1.1 and 8.5, and `sineKernel`, equal to `1` on
the diagonal. It states the edge limit `gue_largest_eigenvalue_tracyWidom`,
`P(n^(2/3)(λ_max - 2) ≤ s) → fredholmDet airyKernel (s,∞)` (AGZ Theorems 3.1.4–3.1.5), and the
bulk gap `gue_bulk_gap`: for `|E| < 2` and compact `A`, the probability that no eigenvalue scaled
by `nρ_SC(E)(λ-E)` lies in `A` tends to `fredholmDet sineKernel A` (AGZ Theorem 3.1.1 at
`E = 0`; for `0 < |E| < 2`, the remark following it and Exercise 3.7.5, with the argument of
AGZ §3.5).

**Checks.**

- `K_Ai(x,x) = Ai'(x)² - x Ai(x)²` is positive, and `∫_s^∞ K_Ai(x,x) dx < ∞` for every `s` by
  the bound of SpecialFunctionsAiry 8.5, so `tr K_Ai` on `L²(s,∞)` is finite.
- `F₂(s) → 1` as `s → ∞` and `F₂` is nondecreasing.
- `F₂(s) → 0` as `s → −∞` (AGZ Theorem 3.1.5), and `1 − F₂(s) ≤ ∫_s^∞ K_Ai(x,x) dx`, since
  `P(λ_max > s) ≤ E N(s,∞)`. On `L²(−∞,s)` the series diverges, since `K_Ai(x,x) ~ √(−x)/π` as
  `x → −∞`; as a gap probability it is `0` for every `s`, which fails the bound and the limit `1`
  at `+∞`.
- `sineKernel x x = 1` and `sineKernel 1 0 = 0`; without the diagonal clause the formula gives
  `0/0`, which Lean evaluates to `0`, and every gap probability would see `K(x,x) = 0`.
- The sine kernel is the Fourier projection onto frequencies in `[-π, π]`, a contraction, so it is
  accepted by §8.3; `2 · sineKernel` has operator norm `2` and is not.
- `∫₀^L sineKernel x x dx = L`: the scaling `nρ_SC(E)` gives the limit process unit density.

### 8.5 GOE: Pfaffians and Painlevé II

Develop Pfaffians, de Bruijn integration, skew-orthogonal Hermite kernels and Fredholm Pfaffians to
prove the GOE bulk and soft-edge limits of the matrix kernels and correlation functions, and the GOE
largest-eigenvalue distribution `F₁` with the same scaling, pinned to AGZ Theorems 3.1.6–3.1.7 with
their matrix normalization translated explicitly. Prove the relation to the Hastings–McLeod solution
of `q'' = sq + 2q³`, `q(s) ~ Ai(s)` at `+∞`: `F₂(s) = exp(-∫_s^∞ (x-s)q(x)² dx)` and
`F₁(s)² = F₂(s) exp(-∫_s^∞ q(x) dx)`. Existence, uniqueness with the Hastings–McLeod boundary
condition, absence of real poles, and the Fredholm differential identities are targets.
`Suggested.lean` states the GOE limit as `goe_largest_eigenvalue_tracyWidom`, with the
Hastings–McLeod solution as a hypothesis: `C²`, `q'' = xq + 2q³` and `q/Ai → 1` at `+∞`; uniqueness
makes it exact and existence makes it non-vacuous. *Needs:* §8.4.

**Checks.**

- `Pf [[0,a],[-a,0]] = a`, and for a `4 × 4` skew matrix `Pf = a₁₂a₃₄ - a₁₃a₂₄ + a₁₄a₂₃` with
  `Pf² = det`.
- `Pf(BABᵀ) = det B · Pf A`: for `A = [[0,1],[-1,0]]` and `B = diag(2,1)`,
  `Pf [[0,2],[-2,0]] = 2 = 2 · 1`; a rule with `(det B)²` would give `4`.
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

Layers 1, 3, 5; OrthogonalL2Bases Parts A–B; OperatorIdeals;
Tau Ceti Hadamard bound; SpecialFunctionsAiry 1.1–1.2, Layer 2, 3.2, 3.4, 3.6 and 8.5.

## Layer 9: logarithmic energy and large deviations

**Sources:** AGZ §2.6; PB §§5.2–5.5.

### 9.1 Large deviation principles

Define `LargeDeviationPrinciple μ a I` for a sequence of measures `μ n` on a topological space,
a speed `a` and a lower-semicontinuous rate `I` with values in `[0,∞]`, by the closed-set upper
bound `limsup a(n)⁻¹ log μ n(F) ≤ -inf_F I` and the open-set lower bound
`-inf_U I ≤ liminf a(n)⁻¹ log μ n(U)` (AGZ Definition D.1); define goodness, the weak principle
and exponential tightness (AGZ Definitions D.2–D.3) and exponential equivalence, and prove the
contraction principle (AGZ Theorem D.7). Use extended-real logarithms, `ENNReal.log 0 = ⊥`, not
`Real.log 0 = 0`. *Needs:* Mathlib `EReal`, `ENNReal.log`, `ProbabilityMeasure`.

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
equilibrium measure. `Suggested.lean` states the cases `β = 1, 2` for `V = x²/2` as
`gaussianEnsemble_spectralMeasure_ldp`, for the spectral measures of `gaussianEnsemble β (n+1)` on
`ProbabilityMeasure ℝ`, speed `(n+1)²` and rate `(β/2)(E_V(μ) - 3/4)`, with `E_V + 1` written as the
double lower integral `gaussianLogEnergy` whose integrand is `+∞` on the diagonal. Prove
logarithmic-kernel truncation bounds, exponential tightness and recovery configurations; the
singular diagonal is not treated as a continuous kernel. *Needs:* §§9.1–9.2.

### 9.4 Equilibrium measures and capacity

Develop the variational characterization: the effective potential `V(x) - 2∫ log|x-y| dμ(y)` of the
minimizer `μ` equals the equilibrium constant `C` for `μ`-almost every `x` and exceeds `C` at every
`x` outside the support (AGZ Lemma 2.6.2(e), (2.6.9)–(2.6.10), printed p. 73). Define logarithmic
capacity (AGZ, just before Lemma 2.6.2). For `V = x²/2` identify the minimizer as
`semicircleReal 0 1` and evaluate its energy and normalization constants. *Needs:* §9.2, §3.3.

**Checks.**

- `∫ log|x-y| d semicircleReal 0 1 (y) = x²/4 - 1/2` on `[-2,2]`, so the effective potential of
  `V = x²/2` is the constant `1` there.
- At `x = 3`, outside the support, the effective potential is
  `1 + 3√5/2 - 2 log((3+√5)/2) ≈ 2.429 > 1`, the strict inequality of (2.6.10).
- The interval `[-2,2]` has capacity `1` (length over `4`); a point has capacity `0`.
- `cap(cE) = c · cap(E)` for `c > 0`, so `cap [0,1] = 1/4`, and a finite set has capacity `0`;
  a capacity defined as the energy minimum itself, not its exponential, would not scale
  linearly.

### 9.5 Largest-eigenvalue large deviations

For the Gaussian beta gas prove the largest-eigenvalue principle at speed `n` with rate
`J_β(x) = (β/2) ∫₂ˣ √(t²-4) dt` for `x ≥ 2` and `+∞` for `x < 2` (AGZ Theorem 2.6.6), with
exponential tightness, the outlier bounds and the `n²` scale of fixed left-tail events via the
constrained equilibrium problem. `Suggested.lean` states the cases `β = 1, 2` as
`gaussianEnsemble_largest_eigenvalue_ldp`, for the matrices `gaussianEnsemble β (n+1)` of §5.1 and
speed `n + 1`. It is not derived from a weak-topology contraction of empirical measures. *Needs:*
§§9.1–9.4.

**Checks.**

- `J_β(2) = 0`, and `J_β(x) ~ (2β/3)(x-2)^(3/2)` as `x ↓ 2`, since `√(t²-4) ≈ 2√(t-2)` near `2`.
- `J_β(x) = +∞` for `x < 2`: the largest eigenvalue cannot sit inside the bulk at speed `n`.

### Examples

At `n = 1` the beta gas is the law with density proportional to `e^{-βV/2}`.

### Dependencies

Layers 1, 3, 5.

## Layer 10: small singular values and the circular law

**Sources:** T §§2.7–2.8; PB §3.1; Tao–Vu 2008; Tao–Vu–Krishnapur 2010; Rudelson–Vershynin 2008.

### 10.1 Anti-concentration and least singular values

Develop the negative-second-moment identity relating singular values to distances of rows from
the spans of the other rows, distance-to-subspace concentration, compressible and incompressible
unit-vector decompositions, and small-ball estimates for independent sums. Include
Littlewood–Offord anti-concentration and the inverse structural estimates of the polynomial
least-singular-value theorem (T §2.7.3, Remark 2.7.6; Tao–Vu 2008, Theorems 2.1 and 3.2) with the
finite additive-combinatorial covering lemmas of that argument. Prove `least_singular_value`:
for each sub-Gaussian proxy `K` there are `C > 0` and `0 < c < 1` such that every `N × N` matrix
with independent real entries, each satisfying `HasSubgaussianMGF` with proxy `K`, whose rows are
identically distributed with column `j` of law `νⱼ` and `∫ x² dνⱼ ≥ 1`, has
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
- I.i.d. entries of variance `1` are the case `νⱼ = ν` for all `j`; column `j` of law
  `N(0, 1 + (j mod 2))` is covered by the theorem but not by the i.i.d. case.

### 10.2 Logarithmic potentials and Girko hermitization

Define the logarithmic potential `U_μ(z) = ∫ log|z-w| dμ(w)` wherever integrable, and as a
locally integrable function for finite empirical spectra. Prove Girko hermitization:
`U_{L_A}(z) = n⁻¹ log|det(A-zI)| = n⁻¹ ∑ log sᵢ(A-zI)` almost everywhere in `z` (T (2.179)), and
`ΔU_{L_A} = 2πL_A` in distributions. Build the distributional Laplacian interface, local
integrability of the logarithmic kernel, and the potential convergence theorem (T Theorem 2.8.3).
*Needs:* §1.1, §1.3.

**Checks.**

- `U_{δ₀}(z) = log|z|`.
- For `circularLaw`, `U(z) = (|z|²-1)/2` for `|z| < 1` and `log|z|` for `|z| ≥ 1`; inside,
  `ΔU = 2 = 2π · π⁻¹`.
- `A = diag(a, b)`: `½(log|a-z| + log|b-z|) = ½ log|det(A-zI)|`.

### 10.3 The circular law

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
probability. Give complex Ginibre as a check against §5.4. *Needs:* §§10.1–10.2, 3.5, 5.4.

### Examples

For complex Ginibre with `n = 1`, `eigenvalueMeasure` is `δ_ξ` and the expected measure has
density `π⁻¹ e^{-|z|²}`, not yet the uniform disc.

### Dependencies

Layers 0–5.

## Downstream consumers

- [FreeProbability](../FreeProbability/README.md) consumes Layers 1, 3, 5 and 6 (cited there as
  Milestones 1, 3, 5 and 6) and the finite combinatorial prerequisite: the spectral API of
  Layer 1 on Tau Ceti's `Matrix.spectralMeasure` and the decreasing Hermitian eigenvalues, the
  moment-to-weak convergence of §3.2 and the density formula of §3.1, the laws of §§3.3–3.5 on
  Tau Ceti's `semicircleReal` and `marchenkoPastur`, the GUE, Ginibre and Haar carriers of
  Layer 5, and the free products, transforms of measures, Weingarten and expected-moment
  interface of Layer 6.

## References

- [AGZ] G. W. Anderson, A. Guionnet, O. Zeitouni, *An Introduction to Random Matrices*,
  Cambridge University Press, 2010.
- [T] T. Tao, *Topics in Random Matrix Theory*, Graduate Studies in Mathematics 132, AMS, 2012.
- [PB] M. Potters, J.-P. Bouchaud, *A First Course in Random Matrix Theory*, Cambridge University
  Press, 2020.
- [BLM] S. Boucheron, G. Lugosi, P. Massart, *Concentration Inequalities: A Nonasymptotic Theory
  of Independence*, Oxford University Press, 2013.
- [V] R. Vershynin, *High-Dimensional Probability*, Cambridge Series in Statistical and
  Probabilistic Mathematics 47, Cambridge University Press, 2018.
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
- O. Ledoit, S. Péché, *Eigenvectors of some large sample covariance matrix ensembles*, Probab.
  Theory Related Fields 151 (2011), 233–264, [arXiv:0911.3010](https://arxiv.org/abs/0911.3010).
- T. Tao, V. Vu, *Random matrices: the circular law*, Commun. Contemp. Math. 10 (2008),
  [arXiv:0708.2895](https://arxiv.org/abs/0708.2895).
- T. Tao, V. Vu (appendix by M. Krishnapur), *Random matrices: universality of ESDs and the
  circular law*, Ann. Probab. 38 (2010), [arXiv:0807.4898](https://arxiv.org/abs/0807.4898).
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., Mathematical Surveys and Monographs
  120, AMS, 2005.
- A. Soshnikov, *Determinantal random point fields*, Russian Math. Surveys 55 (2000),
  [arXiv:math/0002099](https://arxiv.org/abs/math/0002099).
- K. Johansson, *On fluctuations of eigenvalues of random Hermitian matrices*, Duke Math. J. 91
  (1998).
