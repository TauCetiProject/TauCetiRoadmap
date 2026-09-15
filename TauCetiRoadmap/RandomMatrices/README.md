# Random matrices

This roadmap builds the reusable core of random matrix theory in Anderson–Guionnet–Zeitouni
(**AGZ**), Tao (**T**), and Potters–Bouchaud (**PB**): probability tools, spectral measures,
concentration, global spectral laws, invariant ensembles, free probability, Gaussian local
statistics, logarithmic gases, Dyson Brownian motion, and covariance applications.
The selection emphasizes definitions, estimates, and limit theorems that can be used in
other books and research papers. It includes the analytic and combinatorial tools behind
the named laws, with public interfaces that work independently of a particular proof.

The first deliverables are sample-space extension lemmas, empirical spectral measures,
concentration inequalities, the moment/resolvent toolkit, and the semicircle and
Marchenko–Pastur laws. The later milestones are equally part of the specification.
[Suggested.lean](Suggested.lean) prototypes selected interfaces; this document is definitive.
[Sources and existing work](SOURCES.md) records the source audit and acknowledgments.

## Scope and boundaries

The general ensembles are real symmetric or complex Hermitian Wigner matrices, rectangular
i.i.d. matrices and their sample covariances, non-Hermitian i.i.d. matrices, and independent
Haar conjugates of bounded deterministic Hermitian matrices. Exact densities cover Gaussian,
Laguerre, Jacobi, circular unitary, and real-line beta ensembles. Local bulk and soft-edge
limits cover GOE and GUE; the free-probability development covers bounded self-adjoint
variables and their compactly supported laws. Covariance applications cover deterministic
population covariance, finite-rank spikes, and the spectral oracle for squared Frobenius loss.

The scope does not include general Wigner bulk/edge universality, hard-edge scaling limits,
strong operator-norm asymptotic freeness of arbitrary matrix polynomials, unbounded affiliated
operators and Brown measures, infinite-volume stochastic dynamics, replica analytic continuation,
or the book-specific finance, Bayesian inference, spin-glass, and matrix Kesten models.
These are boundaries, not implementation targets. PB's cavity and saddle-point calculations
supply useful formulas; every formula included below has a specified rigorous limiting statement.

Dependencies and ownership:

- [Standard distributions](../StandardDistributions/README.md), Layers 0, 3–6, owns scalar
  Gaussian/gamma/chi-squared laws, multivariate Gaussian laws, real symmetric coordinate
  Lebesgue measure, Cholesky/Bartlett theory, and real Wishart distributions, including
  singular Gaussian-Gram laws. Here we build the complex Gaussian-Gram counterpart, their
  spectral pushforwards, and large-dimension limits. Prove the real Gram-law identification
  with that roadmap's `wishartGramMeasure`; do not introduce another real Wishart measure.
- [Weighted orthogonal L² bases](../../Completed/OrthogonalL2Bases/README.md), Parts A–B,
  supplies Hermite polynomials/functions and moment determinacy. Import its implemented
  `TauCeti.Probability.Moments.*` and `TauCeti.Analysis.SpecialFunctions.Hermite.*` modules.
  Here we add convergence from moments, polynomial-ensemble kernels, Laguerre/Jacobi
  orthogonality and normalizations, and Hermite asymptotics.
- [Compact-group representations](../RepresentationTheory/CompactGroups/README.md),
  Layer 0 and its Weyl integration targets, owns normalized Haar averaging and general
  compact-group Weyl integration. Here we prove the matrix-coordinate Jacobians,
  explicit unitary-group specializations, eigenvalue/eigenprojector disintegrations, and
  Haar entry integrals used by random matrices. Supply the bridges from those abstractions.
- [Optimal transport](../OptimalTransport/README.md), Layers 0–3, owns couplings and
  Wasserstein distances. Here we prove spectral perturbation estimates and their `W₁`/`W₂`
  corollaries by exhibiting the eigenvalue coupling. The primary perturbation estimates
  remain finite sums and do not depend on transport theory.
- [Exchangeability](../Exchangeability/README.md) owns exchangeability and conditional-i.i.d.
  representation theory. Here sample-space extensions preserve a specified existing joint
  law and add independent randomness; no exchangeability or de Finetti theory is repeated.

Missing prerequisites explicitly assigned below are built in Tau Ceti. Follow Mathlib's
existing and proposed APIs; an open PR determines interface direction, not timing. Implement
needed results here and replace them by imports when Mathlib supplies them. Opening a Mathlib
PR is not a deliverable. Before integrating external code, coordinate with its authors and
obtain agreement; if that is impossible, verify the licence and discuss the integration on
Lean Zulip as required by the repository's [porting policy](../../README.md#porting-existing-work).
Independent development still acknowledges the sources and coordinates where possible.

## Conventions

1. **Probability and dimensions.** Use `Measure`, `IsProbabilityMeasure`, `HasLaw`,
   `IdentDistrib`, `iIndepFun`, and `MeasurePreserving`. Public random matrices are measurable
   maps `Ω → Matrix (Fin p) (Fin n) 𝕜`, with `𝕜 = ℝ` or `ℂ`; require almost-everywhere
   measurability when that suffices. Hermitian deterministic APIs take `Matrix.IsHermitian`
   or Mathlib's self-adjoint subtype. Use the inherited finite-dimensional Borel structures,
   with measurable coordinate equivalences proved explicitly. Spectral probability measures
   require positive dimension. An empty empirical *finite measure* is zero, never a probability.
2. **Order and norms.** Use Mathlib's decreasing `Matrix.IsHermitian.eigenvalues₀`, counting
   multiplicities: `λ₁ ≥ ⋯ ≥ λₙ`. Smallest eigenvalues and singular values are identified
   explicitly. Matrix norms in estimates are Euclidean operator norms, using Mathlib's
   `Matrix.Norms.L2Operator` scope or `toEuclideanLin`; Frobenius norm means
   `sqrt (∑ i, ∑ j, ‖A i j‖²)`. Never silently use the default entrywise/sup matrix norm.
3. **Trace and spectra.** `trₙ A = n⁻¹ trace A` and
   `L_A = n⁻¹ ∑ᵢ δ_{λᵢ(A)}`. The spectrum of a general complex matrix is the multiset of
   characteristic-polynomial roots, with algebraic multiplicity, not a chosen eigenbasis.
   Distinguish the random measure `L_A`, its expectation `E L_A`, and its distribution as
   a random element of `ProbabilityMeasure ℝ` or `ProbabilityMeasure ℂ`.
4. **Resolvent sign.** For `Im z > 0`, use `R_A(z) = (A - zI)⁻¹` and
   `m_μ(z) = ∫ (x-z)⁻¹ dμ(x)`. Thus `Im m_μ(z) > 0` for a probability measure and
   `iy m_μ(iy) → -1`. This scalar transform is Mathlib's
   [`MeasureTheory.resolventTransform`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Measure/ResolventTransform.html#MeasureTheory.resolventTransform)
   at `A = ℂ`, base field `ℝ`. PB's `g(z) = ∫ (z-x)⁻¹ dμ(x)` is `-m(z)`.
   Give translation lemmas before using its R/S-transform or covariance formulas.
5. **Normalization.** Wigner matrices are `Hₙ = Wₙ/√n`, with centered independent
   upper-triangular entries and `E|Wᵢⱼ|² = 1` off the diagonal. For GOE, off-diagonal
   variance is 1 and diagonal variance 2 before division by `√n`. For GUE, diagonal
   variance is 1 and off-diagonal real and imaginary parts are independent `N(0,1/2)`.
   Standard complex Gaussian means exactly this circular scalar Gaussian of variance 1.
   A sample covariance is `S = XX*/n`, with `X` of size `p × n` and aspect ratio `y = p/n`.
6. **Convergence.** Weak convergence uses the existing topology on `ProbabilityMeasure`.
   In-probability statements allow spaces `(Ωₙ,Pₙ)` to vary and mean convergence of each
   bounded-continuous test integral in probability to its deterministic limit. Prove the
   equivalent probability-metric formulation. Almost-sure statements place all matrices on
   one space; the basic Wigner/covariance/circular theorems include the construction from
   a fixed infinite i.i.d. array. No independence across matrix sizes is presumed unless stated.
   All `O`, `o`, and tail estimates quantify constants and their parameter dependence.

## Existing foundations to consume

Mathlib supplies finite-dimensional spectral theory, singular values, continuous functional
calculus, product measures and independence, characteristic functions, the real classical CLT,
Prokhorov compactness, weak convergence, conditional expectations and martingales, Gaussian
laws, sub-Gaussian MGFs, and Brownian motion. Relevant entry points include:

| Interface | Source |
| --- | --- |
| Ordered Hermitian eigenvalues, trace/determinant spectral formulas | `Mathlib.Analysis.Matrix.Spectrum` |
| Euclidean operator norm; singular values | `Mathlib.Analysis.CStarAlgebra.Matrix`, `Mathlib.Analysis.InnerProductSpace.SingularValues` |
| Laws and independent realization | `Mathlib.Probability.HasLaw`, `HasLawExists`, `IdentDistribIndep` |
| Concentration primitives | `Mathlib.Probability.Moments.SubGaussian`, `MGFAnalytic` |
| CLT and convergence of laws | `Mathlib.Probability.CentralLimitTheorem`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution` |
| Tightness and weak compactness | `Mathlib.MeasureTheory.Measure.Prokhorov` |
| Resolvent transform and analyticity | `Mathlib.MeasureTheory.Measure.ResolventTransform` |
| Brownian motion | `Mathlib.Probability.BrownianMotion.Basic` |

Brownian motion alone does not provide the Itô and SDE toolkit required by Milestone 10;
that toolkit is an explicit target there. Existing moment determinacy alone does not prove
convergence from moments; Milestone 3 builds that bridge.

## Milestone 0 — Probability arguments invariant under extension

**Sources:** T §1.1; the [probabilistic-arguments discussion](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Formalizing.20Probabilistic.20Arguments/with/522877620).

- For a probability space `(Ω,P)` and a probability law `ν` on a standard Borel value space
  `E`, construct `Ω × E` with `P.prod ν`. Prove the first projection measure-preserving,
  the second coordinate has law `ν`, and it is independent of the *whole old random object*
  `X ∘ Prod.fst`, for any measurable `X`. Include finite and countable families of new
  coordinates, repeated extensions, and reordering/association of products. Use
  `exists_hasLaw_indepFun` and `exists_iid` where only a realization is needed.
- Transport joint laws, independence of subfamilies, integrability, moments, expectations,
  event probabilities, and almost-sure predicates through a measure-preserving map.
  Transport conditional expectations for the pulled-back sigma-algebra, with an explicit
  almost-everywhere equality. Include vector/matrix-valued versions through their coordinate API.
- For equal *joint* laws, transport measurable functionals and probability bounds. State
  separately the single-variable `IdentDistrib` corollaries. Equality of marginal laws is
  insufficient for assertions involving several variables.
- Supply reusable independent-copy, symmetrization, and coordinate-replacement lemmas.
  For centered independent real `Xᵢ`, an independent copy `X'`, independent Rademachers
  `εᵢ`, and convex `Φ` with the needed integrability, include
  `E Φ(∑ Xᵢ) ≤ E Φ(∑ (Xᵢ-X'ᵢ)) = E Φ(∑ εᵢ(Xᵢ-X'ᵢ))`.
  The extension must preserve existing joint relationships, including dependence between
  old variables. Demonstrate this with a pair `(X,Z)` and a new copy independent of both.

**Completion:** a matrix quadratic-form symmetrization proof can move to an extension and
return an inequality on the original space using these lemmas. A tactic is not required;
the library must expose explicit, composable theorems.

## Milestone 1 — Spectral measures and deterministic estimates

**Sources:** T §1.3; AGZ Appendix A, §2.3.1; PB ch. 1.

- Define empirical finite measures for any finite family in a measurable space. Prove total
  mass, probability normalization in nonempty dimension, integration, pushforward, reindexing,
  concatenation, and measurability into measures. Specialize to Hermitian eigenvalues,
  singular values, squared singular values, and complex characteristic roots. Prove
  measurability of the latter multiset/measure without requiring continuous ordered complex roots.
- Prove continuity and measurability of ordered Hermitian eigenvalues; prove min–max and
  max–min formulas, Weyl inequalities, Cauchy interlacing, and the rank perturbation bound
  `sup_t |L_A(-∞,t] - L_B(-∞,t]| ≤ rank(A-B)/n`.
  Give principal-minor and rectangular Gram corollaries.
- Prove Hoffman–Wielandt:
  `∑ᵢ |λᵢ(A)-λᵢ(B)|² ≤ ‖A-B‖_F²`, the operator-norm eigenvalue bound, and
  the singular-value analogues. Deduce the Lipschitz estimate
  `|∫ f dL_A - ∫ f dL_B| ≤ Lip(f) ‖A-B‖_F/√n` and spectral Wasserstein bounds.
- Develop the resolvent identity, Schur complements, determinant lemma, Sherman–Morrison–Woodbury,
  and Hermitian dilation for rectangular matrices. In the upper half-plane prove invertibility,
  `‖R_A(z)‖ ≤ 1/Im z`, `m_{L_A}(z) = trₙ R_A(z)`, and the Ward identity
  `∑ⱼ |Rᵢⱼ|² = Im Rᵢᵢ / Im z`. Give rank-one update and leave-one-row/column formulas.
- Prove `∫ x^k dL_A = trₙ(A^k)`, positivity/support statements, the equality of the
  nonzero spectra of `XX*` and `X*X`, and the exact zero-mass correction between their
  empirical probability measures. Include uniform-integrability estimates from trace powers.

## Milestone 2 — Concentration, replacement, and norm bounds

**Sources:** T §§2.1–2.3, §3.2; AGZ §§2.3, 4.4. Dependencies: 0–1.

- Complete the scalar Hoeffding, Bernstein, Azuma–Hoeffding, McDiarmid, and Efron–Stein
  interfaces. Specify independent bounded centered summands by `|Xᵢ| ≤ b` almost surely
  and `v = ∑ E Xᵢ²`; Bernstein's two-sided bound is
  `2 exp(-t²/(2(v+bt/3)))` for `t>0`. For bounded differences `cᵢ`, McDiarmid's bound is
  `2 exp(-2t²/∑cᵢ²)`; handle zero denominators by the almost-sure constant conclusion.
  Mirror the sub-exponential MGF direction of [Mathlib PR #39165](https://github.com/leanprover-community/mathlib4/pull/39165),
  retaining explicit exponential integrability wherever the adopted interface requires it.
- Define logarithmic Sobolev and Poincaré inequalities for probability measures on finite
  Euclidean spaces, with convention `Ent_μ(f²) ≤ 2C ∫ ‖∇f‖² dμ`, where
  `Ent_μ(g)=∫g log g dμ-(∫g dμ)log(∫g dμ)` for nonnegative integrable `g` with
  integrable `g log g`, using `0 log 0=0`.
  Prove tensorization, the Gaussian inequalities (`C=1` for standard Gaussian), Herbst's
  argument, and extension from smooth functions to all Euclidean-Lipschitz functions.
  Deduce `P(|F-EF|≥t) ≤ 2 exp(-t²/(2CL²))` for `L`-Lipschitz `F` under LSI.
  Include Talagrand's convex-Lipschitz concentration on independent coordinates supported
  in intervals of length at most 1, about a median and about the mean, with absolute constants.
- Transfer these inequalities to eigenvalues and linear spectral statistics using Milestone 1.
  For Wigner coordinates with a uniform LSI constant, obtain the `n²t²/Lip(f)²` exponent
  for fluctuations of `∫f dL_H`, with its explicit normalization-dependent constant.
- Prove Hanson–Wright for independent centered real coordinates with sub-Gaussian proxy
  `K²`: for a real symmetric `A`, the two-sided tail of `XᵀAX-E(XᵀAX)` is at most
  `2 exp(-c min(t²/(K⁴‖A‖_F²), t/(K²‖A‖op)))`. Supply the complex circular-coordinate
  version, decoupling of off-diagonal terms, and conditional versions for a matrix independent
  of the vector. Deal separately with the zero matrix.
- Prove epsilon-net cardinality estimates for Euclidean spheres and the bilinear/quadratic
  net reductions. For a `p × n` matrix with independent centered sub-Gaussian coordinates,
  prove `P(‖X‖op > CK(√p+√n+t)) ≤ 2exp(-ct²)` for `t≥0`.
  For independent centered isotropic rows whose every real linear form in direction `u`
  has sub-Gaussian proxy at most `K²‖u‖²`, prove the corresponding two-sided singular
  value estimate `√p-CK²(√n+t) ≤ s_min(X) ≤ s_max(X) ≤ √p+CK²(√n+t)` with
  probability at least `1-2exp(-ct²)`; a negative lower bound makes no invertibility claim.
- Prove Gaussian integration by parts, real and complex Wick/Isserlis formulas, and a
  finite-dimensional Lindeberg replacement inequality: replacing independent coordinates
  whose moments match through degree `r` changes the expectation of a `C^(r+1)` test by
  a sum of derivative bounds times `(r+1)`st absolute moments. Include localization and
  truncation versions, and resolvent differentiation formulas to apply the inequality.
- Develop the trace exponential inequalities used by matrix concentration: Golden–Thompson,
  Lieb concavity of `A ↦ tr exp(B+log A)` for positive-definite `A`, and the independent
  matrix Laplace-transform bound. Deduce Hermitian matrix Bernstein
  `P(‖∑ Xᵢ‖op ≥ t) ≤ 2d exp(-t²/(2(v+Lt/3)))`, where `EXᵢ=0`,
  `‖Xᵢ‖op≤L` a.s., and `v=‖∑EXᵢ²‖op`. For independent `0≤Yᵢ≤LI`, `L>0`,
  set `μ_max=λ_max(∑EYᵢ)`, `μ_min=λ_min(∑EYᵢ)` and prove matrix Chernoff:
  the probability of `λ_max(∑Yᵢ)≥(1+δ)μ_max` is at most
  `d[e^δ/(1+δ)^(1+δ)]^(μ_max/L)` for `δ≥0`; the probability of
  `λ_min(∑Yᵢ)≤(1-δ)μ_min` is at most
  `d[e^(-δ)/(1-δ)^(1-δ)]^(μ_min/L)` for `0<δ<1`. Handle `L=0` directly,
  and give rectangular Bernstein via dilation. These are theorems under entry/summand hypotheses,
  not merely consequences of an assumed matrix-MGF estimate.

## Milestone 3 — Transforms, moments, and named spectral laws

**Sources:** AGZ §§2.1.1, 2.4; T §§2.2, 2.4; PB §§2.3, 4.2. Dependencies: 0–1.

- Extend `resolventTransform` with imaginary-part positivity, conjugation, affine scaling,
  total-mass asymptotics, uniqueness and Stieltjes inversion. At endpoints of an interval
  include the half-atom terms. Prove `μ{a} = lim_{η↓0} η Im m_μ(a+iη)` and the density
  formula wherever the boundary limit is continuous. Use the finite expansion/remainder
  direction of [Mathlib PR #43642](https://github.com/leanprover-community/mathlib4/pull/43642).
- Prove equivalence of weak convergence of probability measures on `ℝ` and transform
  convergence on the upper half-plane to the transform of a specified probability measure;
  include a countable determining set, the normal-family/compactness argument, and random
  in-probability/almost-sure versions. Prove moment convergence implies weak convergence
  when the limiting moments determine a probability measure, using tightness and higher
  moments to justify passage through unbounded monomials. Give compact-support and finite
  exponential-moment sufficient conditions via the existing determinacy APIs.
- Define the location/variance semicircle family following the Stanford interface:
  `semicircleReal a v`, `v : ℝ≥0`, density
  `(2πv)⁻¹ sqrt(4v-(x-a)²)` for `v>0`, and `δ_a` for `v=0`.
  Prove normalization, support, parameter measurability, affine transformations, all moments,
  expectation/variance, and the transform. For the standard law, odd moments vanish and
  moment `2k` is the Catalan number; `m²+zm+1=0`, with the upper-half-plane branch and
  `zm(z)→-1` fixing the root. Define square roots analytically off the support rather than
  choosing a pointwise quadratic root without a branch specification.
- Define `MP_y`, `y>0`, with edges `a=(1-√y)²`, `b=(1+√y)²`, atom `(1-1/y)₊ δ₀`,
  and density `sqrt((b-x)(x-a))/(2πyx)` on `(a,b)`; set `MP_0=δ₁`.
  Prove normalization, support including the atom, mean 1, moments
  `∑_{π∈NC(k)} y^(k-|π|)` for `k≥1`, transform equation
  `yz m²+(z+y-1)m+1=0`, and weak continuity for `y≥0`.
  Build noncrossing partitions and their counting identity here as specified in Milestone 6's
  combinatorial prerequisite; this finite combinatorics has no free-probability dependency.
- Define the circular probability law `π⁻¹ 1_{|z|≤1} d(area)` and the quarter-circle
  singular-value law. Prove support, moments/mixed moments, rotational invariance, and that
  the square of the quarter-circle variable has law `MP_1`. Record semicircle/MP affine
  and dilation conventions in testable low-degree examples.

## Milestone 4 — Wigner and sample-covariance global laws

**Sources:** AGZ §§2.1–2.4; T §§2.3–2.4; PB chs. 2–4. Dependencies: 0–3 and the
finite combinatorics below.

- Provide constructors and law characterizations for Wigner matrices with independent
  upper-triangular entries, including the separate diagonal law, real-to-complex embedding,
  and i.i.d. rectangular ensembles. Prove independence of a minor and the removed row's
  off-diagonal entries. Centering and Hermitian symmetry are hypotheses, not consequences
  of identically distributed entries.
- Develop trace-word expansions, equivalence under vertex relabeling, walks allowing loops,
  the vanishing of singleton-edge contributions, leading tree/double-traversal terms,
  Catalan enumeration, and connected two-trace bounds. Prove convergence of expected
  normalized moments and `O_k(n⁻²)` normalized-trace variance bounds under uniformly
  bounded moments of every order, with constants depending only on `k` and those bounds.
  Build both closed-walk and noncrossing-pairing descriptions and their leading-term bridge;
  respect the Stanford project's existing loop-walk work without prescribing its data structure.
- Prove the semicircle law in probability under the following triangular-array hypotheses:
  centered independent upper-triangular entries, off-diagonal second absolute moments 1,
  `n⁻²∑ᵢ E|Wᵢᵢ|²→0`, and for every `ε>0`,
  `n⁻² ∑ᵢⱼ E[|Wᵢⱼ|² 1_{|Wᵢⱼ|>ε√n}]→0`.
  Prove truncation, recentering, and variance renormalization estimates, not just the
  bounded-moment special case. For a fixed infinite i.i.d. upper-triangular array and an
  independent i.i.d. real diagonal of finite second moment, prove almost-sure weak convergence.
  No fourth moment is required for this global empirical law.
- Provide the resolvent proof's reusable self-consistency estimate, fluctuation bound,
  stability/uniqueness argument in the upper half-plane, and identification with Milestone 3.
  These lemmas are targets in addition to the moment-method infrastructure; two duplicate
  public names for the semicircle theorem are unnecessary.
- Prove Marchenko–Pastur convergence in probability and almost surely for restrictions of
  a fixed infinite real or complex i.i.d. array with mean zero and second absolute moment 1,
  `p,n→∞` and `p/n→y∈(0,∞)`. Include rectangular trace-word counting and a resolvent
  self-consistency proof, with the exact atom at zero and the companion transform identity.
  Identify the Gaussian case with the real/complex Wishart constructions.
- Prove Bai–Yin edge convergence with finite fourth moments: for real/complex i.i.d.
  Wigner off-diagonal entries of variance 1 and a real i.i.d. diagonal of finite second moment,
  `λ_max(Hₙ)→2`, `λ_min(Hₙ)→-2` almost surely. For i.i.d. sample covariances,
  `λ_max(S)→(1+√y)²`; the least eigenvalue tends to `(1-√y)²` for `0<y<1`.
  For `y>1` the least eigenvalue is zero and the least positive eigenvalue has limit
  `(√y-1)²`; at `y=1` the least eigenvalue tends to zero. Supply growing-moment enumeration,
  truncation, and summable exceptional-probability estimates appropriate to these statements.

## Milestone 5 — Invariant ensembles and exact integration

**Sources:** AGZ §§2.5, 4.1, 4.5.1; T §2.6; PB chs. 3, 5–7 and §10.5.
Dependencies: 0–3, StandardDistributions Layer 6, and compact-group Haar integration.

- Construct GOE/GUE from independent Gaussian coordinates with the fixed normalization.
  Prove their density on the real self-adjoint vector space, orthogonal/unitary conjugation
  invariance, and equivalence of the entry and invariant-density characterizations.
  Construct real and complex Ginibre and Gaussian Gram laws. For the complex Hermitian
  space use product Lebesgue measure in diagonal real and upper off-diagonal real/imaginary
  coordinates; prove its relation to the trace-inner-product volume.
- Prove spectral change of variables, including the repeated-eigenvalue null set, the
  eigenvector phase/sign stabilizer, multiplicity `n!`, and normalized Haar factor.
  For GOE/GUE derive the unordered eigenvalue density on `ℝⁿ`
  `Z⁻¹ exp(-βn∑xᵢ²/4) ∏_{i<j}|xᵢ-xⱼ|^β`, `β=1,2`, with its explicit Gaussian
  Selberg normalization; on the decreasing chamber multiply by `n!`.
  Eigenprojectors/eigenflags have invariant law independent of eigenvalues. Do not assert
  that a deterministically phased eigenvector matrix is itself Haar distributed.
- Construct Laguerre and Jacobi eigenvalue laws for `β=1,2` as pushforwards of Gaussian
  Gram matrices and ratios of two independent full-rank Gram matrices. For Jacobi use
  `(A+B)^(-1/2) A (A+B)^(-1/2)` with both sample sizes at least the dimension.
  Prove densities, support, and exact Gamma-product normalizations. In the singular
  Wishart cases give the deterministic zero eigenvalues and the nonzero companion law.
- Define the normalized real-line Hermite/Laguerre beta densities for every `β>0`,
  construct their independent chi/Gaussian tridiagonal or bidiagonal matrix models,
  and prove the Dumitriu–Edelman spectral identities (AGZ §4.5.1). Include the tridiagonal
  spectral-weight variables and their Dirichlet distribution; beta ensembles need not be
  modeled by matrices over a fictitious field of dimension `β`.
- Specialize Haar integration to the circular unitary ensemble: eigenangles in `[0,2π)`,
  density `((2π)^n n!)⁻¹ ∏_{i<j}|e^{iθᵢ}-e^{iθⱼ}|²`, and independent Haar eigenflags.
  Prove finite-dimensional complex Schur triangularization and the complex Ginibre joint
  eigenvalue density by Schur change of variables, with the triangular-coordinate Jacobian.
- Prove the HCIZ integral for Hermitian `A,B` and real `t`, including the continuous
  extensions at repeated eigenvalues and `t=0`:
  `∫ exp(t tr(AUBU*)) dU = (∏_{j=1}^{n-1}j!) t^(-n(n-1)/2)
  det[e^{taᵢbⱼ}]/(Δ(a)Δ(b))` when `t≠0` and both spectra are simple.
  Set `Δ(a)=∏_{i<j}(aⱼ-aᵢ)`; prove a separate, nonsingular rank-one formula.

## Finite combinatorial prerequisite for Milestones 3, 4, and 6

Use finite set partitions of `Fin k` with the cyclic order inherited from its usual order.
Noncrossing means there are no `a<b<c<d` with `a,c` in one block and `b,d` in a distinct
block. Prove restriction/interval decomposition, refinement as a finite lattice, Kreweras
complement, Möbius inversion, Catalan counts for noncrossing partitions and pairings, and
Narayana counts by number of blocks. For pairings, prove the equivalence with planar
closed-walk leading terms and with maximal cycle count of a pairing composed with the long
cycle, counting fixed points as cycles. This prerequisite is independent of analytic limits.

## Milestone 6 — Free probability and asymptotic freeness

**Sources:** AGZ §§5.2–5.4; T §2.5; PB chs. 10–12, 15. Dependencies: 1, 3, the finite
combinatorics, and 5 for Haar/Gaussian matrix realizations.

- Develop unital linear functionals on unital algebras and noncommutative laws as evaluation
  of words, with real/complex scalar extension. In the analytic layer use unital complex
  C*-algebras with a positive normalized linear functional, adding traciality as a hypothesis
  when needed. Reuse positive-linear-map and star-algebra APIs. Prove positivity,
  Cauchy–Schwarz, norm bounds, and the probability measure representing a bounded
  self-adjoint variable via continuous functional calculus and Riesz representation.
  Prove its support and moment identities and uniqueness. A word functional without
  positivity is not a probability measure.
- Define free unital subalgebras by vanishing alternating products of centered elements
  from successively distinct subalgebras; define freeness of families by generated
  subalgebras. Prove permutation/regrouping, adjoining scalars, polynomial substitution,
  mixed-moment uniqueness, and the contrast with tensor-product classical independence.
- Construct free cumulants by noncrossing Möbius inversion, prove multilinearity,
  moment–cumulant inversion, and freeness iff mixed cumulants vanish. Construct free products
  with positive state using the reduced-word Hilbert-space construction: define the vacuum,
  inner product, bounded representations, and prove positivity and freeness. This supplies
  actual realizations rather than assuming existence of free variables with prescribed laws.
- Define free additive convolution on compactly supported real probability measures, and
  multiplicative convolution on compactly supported nonnegative laws via `a^(1/2) b a^(1/2)`.
  Prove well-definedness, associativity, commutativity at the level of laws, identities,
  scaling, support bounds, and weak continuity on uniformly bounded supports.
- For `G=-m`, construct the local inverse near infinity and the R-transform by
  `G^(-1)(w)=1/w+R(w)`. Define the moment series `ψ(z)=∫zx/(1-zx)dμ` and
  `S(w)=(1+w)ψ^(-1)(w)/w` when the first moment is nonzero. Prove the formal-series and
  analytic-germ bridges, addition of R-transforms and multiplication of S-transforms.
  Identify `R_SC_v(w)=vw`, `R_MP_y(w)=1/(1-yw)`, `S_MP_y(w)=1/(1+yw)`.
- Prove the free CLT for freely independent identically distributed bounded centered
  self-adjoint variables of variance 1: laws of normalized sums converge weakly to
  `semicircleReal 0 1`. Prove the free Poisson limit for free projections of trace `λ/n`:
  their sums tend to the law with cumulants all `λ` (for `λ>0`, the dilation by `λ` of
  `MP_(1/λ)`; for `λ=0`, Dirac at zero). Include moment convergence and the support/tightness
  argument; projection arrays exist only once `n≥λ`.
- Prove asymptotic freeness in normalized trace moments, in expectation and almost surely,
  for finitely many independent normalized GUE matrices, and jointly with a deterministic
  uniformly operator-bounded family having a joint limiting star-moment law. Prove the
  Haar-conjugation version for independent Haar unitaries and deterministic bounded
  Hermitian matrices with limiting individual laws. Build Haar entry moment/Weingarten
  formulas, their large-dimension estimates, mixed-word counting, variance and higher
  centered-moment bounds. Include the GOE/orthogonal analogue at this first-order level.
  Convert matrix moment limits into spectral weak limits for self-adjoint polynomials.

## Milestone 7 — Deformations, covariance spectra, and spikes

**Sources:** PB chs. 10, 14, 15, 17, §§19.1–19.3; AGZ §5.4.
Dependencies: 1–6. The regularity conditions here are part of the theorems.

- For deterministic Hermitian `Dₙ` with uniformly bounded norm and limiting empirical law
  `ν`, and independent GUE `Hₙ`, prove `L_{Dₙ+√t Hₙ} → ν ⊞ SC_t` almost surely.
  Prove the Pastur equation
  `m(z)=∫(x-z-tm(z))⁻¹ dν(x)`, with existence/uniqueness in the Stieltjes class.
  Prove the resolvent deterministic equivalent against deterministic unit vectors for
  fixed `Im z>0`, and its extension uniformly on compact real intervals separated from
  the limiting and finite-dimensional spectra when that separation is established.
- For `T_p≥0` deterministic, `sup‖T_p‖<∞`, `L_T→ν`, and real or complex i.i.d. `X`
  with mean zero, variance 1 and finite fourth moment, prove the almost-sure limiting
  law of `T_p^(1/2) XX*/n T_p^(1/2)`, with `p/n→y>0`.
  Its companion transform solves
  `z=-1/underline_m+y∫ t/(1+t underline_m)dν(t)`, with
  `underline_m=-(1-y)/z+ym` and upper-half-plane/normalization conditions.
  Prove existence, uniqueness, zero-atom formula, and the identification `ν ⊠ MP_y`.
  Give the deterministic matrix equivalent
  `Q(z) = [-z(I+underline_m(z)T_p)]⁻¹` for fixed positive imaginary part, in normalized
  trace against deterministic bounded matrices. These include isotropic and finite-atomic
  population laws and permit singular `T_p`.
- Prove finite-rank perturbation invariance of global empirical limits and the secular
  equation for outliers. For `Hₙ+θuu*` with normalized GOE/GUE `Hₙ`, deterministic unit
  `u`, and fixed `θ>0`, prove almost surely: the largest eigenvalue tends to 2 for
  `θ≤1`, and to `θ+1/θ` for `θ>1`; in the latter case the squared overlap with `u`
  tends to `1-1/θ²`, while it tends to zero for `θ≤1`. Include negative spikes by symmetry.
  Supply isotropic resolvent estimates, eigenvalue exclusion, and the derivative-residue
  argument; weak convergence alone does not prove any of these claims.
- For Gaussian sample covariance with `0<y<1` and population
  `T_p=diag(ℓ,1,…,1)`, `ℓ>1`, prove the analogous upper-spike theorem:
  the threshold is `1+√y`; above it, the outlier tends to
  `ℓ(1+y/(ℓ-1))` and its squared population-eigenvector overlap to
  `(1-y/(ℓ-1)²)/(1+y/(ℓ-1))`. At and below threshold, the largest eigenvalue tends
  to `(1+√y)²` and the overlap tends to zero. Extend these statements to finitely many
  distinct supercritical spikes via spectral projectors.
- Prove the exact finite-dimensional oracle identity: among estimators diagonal in an
  observed orthonormal eigenbasis `uᵢ`, the unique minimizer of squared Frobenius loss to
  `T` has eigenvalues `uᵢ*Tuᵢ`. For a repeated observed eigenvalue, distinguish this
  basis-dependent class from spectral estimators constant on that eigenspace; the latter
  use the averaged trace on the spectral projector.
- Prove the bulk nonlinear-shrinkage formula in an integrated form. For Gaussian `X`,
  `0<y<1`, `cI≤T_p≤CI` with fixed `c>0`, and limiting law `ν`, let `μ=ν⊠MP_y`.
  On a compact interval `J⊂(0,∞)` where `μ` has continuous positive density and `m`
  continuous boundary values with `|1-y-yx m(x+i0)|` bounded away from zero, show for
  every continuous `f` supported in the interior of `J` that
  `p⁻¹∑ᵢ f(λᵢ) uᵢ* T_p uᵢ → ∫ f(x) x/|1-y-yx m(x+i0)|² dμ(x)` almost surely.
  Build the weighted spectral measure and boundary-inversion argument from the deterministic
  equivalent. This target does not assert convergence of individual eigenvector weights.

## Milestone 8 — Point processes and Gaussian local statistics

**Sources:** AGZ ch. 3, §4.2; T §2.6, §§3.3–3.4; PB ch. 6, §14.1.
Dependencies: 1, 3, 5 and the Hermite-function development.

- Build locally finite counting measures on `ℝ` and `ℂ`, their measurable structure,
  factorial moment measures, correlation functions relative to a reference measure,
  restriction, pushforward, and convergence in law for the vague topology.
  Distinguish the unnormalized eigenvalue point process from its empirical probability measure.
- Prove Andréief's integration identity and the determinantal structure of orthogonal
  polynomial ensembles. Construct the GUE, Laguerre/Jacobi unitary, CUE, and complex Ginibre
  kernels with their reference measures. Prove Christoffel–Darboux, reproducing/projection
  identities, correlation functions, mean/variance of counts and linear statistics.
  Reuse Hermite orthogonality; build the Laguerre/Jacobi Rodrigues, norm, and recurrence API.
- For locally trace-class positive contraction kernels, construct determinantal point
  processes and prove uniqueness from their Laplace functionals. Build the needed trace-class
  integral-operator and Fredholm-determinant theory: summability, determinant series,
  continuity in trace norm, restriction, and `P(N(B)=0)=det(I-K_B)`.
  Prove Bernoulli-sum representation of bounded-set counts and their CLT when variance
  diverges. The trace-class and positivity hypotheses must be verified for each kernel.
- Prove Hermite bulk/turning-point asymptotics with uniform bounds strong enough to pass
  to correlation functions and gap probabilities. For GUE and `E∈(-2,2)`, scale points
  by `nρ_SC(E)(λ-E)`; the limiting kernel is
  `sin(π(x-y))/(π(x-y))`, with diagonal value 1. At the upper edge use
  `n^(2/3)(λ-2)` and the Airy kernel
  `K_Ai(x,y)=∫₀∞ Ai(x+t)Ai(y+t)dt`.
  Build the Airy function, its ODE, decay, integral representations, and uniform asymptotic
  estimates needed by this argument, including the tail control on unbounded intervals.
- Define `F₂(s)=det(I-K_Ai)` on `L²(s,∞)`; prove it is a continuous probability cdf
  and `P(n^(2/3)(λ_max(GUE)-2)≤s)→F₂(s)`. Prove the limiting Airy point process and
  the bulk sine-process gap distributions, not only the one-point density.
- Develop Pfaffians, de Bruijn integration, skew-orthogonal Hermite kernels, and Fredholm
  Pfaffians to prove the GOE bulk and soft-edge limits and the GOE largest-eigenvalue cdf
  `F₁` with the same scaling. Pin the matrix kernels and cdf to AGZ Theorems 3.1.6–3.1.7
  (translate their matrix normalization explicitly). Prove the relation to the
  Hastings–McLeod solution `q''=sq+2q³`, `q(s)~Ai(s)` at `+∞`:
  `F₂(s)=exp(-∫_s^∞(x-s)q(x)²dx)` and
  `F₁(s)²=F₂(s) exp(-∫_s^∞q(x)dx)`.
  Existence, uniqueness with the Hastings–McLeod boundary conditions, absence of real
  poles, and the Fredholm differential identities are targets, not assumed inputs.
- Prove joint CLTs for finitely many centered polynomial linear statistics of normalized
  GOE/GUE. If `f(2cos θ)=a₀+∑_{k≥1}a_k cos(kθ)` and similarly `g` with coefficients
  `b_k`, the limiting covariance of `tr f(H)-E tr f(H)` and `tr g(H)-E tr g(H)` is
  `(1/(2β))∑_{k≥1} k a_k b_k`, `β=1,2`. Include Wick connected-diagram/cumulant estimates
  and the multivariate convergence-of-laws bridge. Center by the exact expectation.

## Milestone 9 — Logarithmic energy and large deviations

**Sources:** AGZ §2.6; PB §§5.2–5.5. Dependencies: 1, 3, 5.

- Define an LDP for measures on a topological space by the open-set lower and closed-set
  upper bounds, with a specified speed and lower-semicontinuous rate; define goodness,
  exponential tightness, exponential equivalence, and prove the contraction principle.
  Use extended-real logarithms with `log 0=-∞`, not `Real.log 0=0`.
- For continuous `V:ℝ→ℝ` with `V(x)/log(1+|x|)→∞`, construct the normalized beta gas
  of density `Z_(n,β,V)^(-1) exp(-βn∑V(xᵢ)/2) ∏_{i<j}|xᵢ-xⱼ|^β`, `β>0`.
  Prove finiteness/positivity of the partition function and the limiting free energy.
  For `E_V(μ)=∫V dμ-∬log|x-y|dμdμ`, define the energy through lower-bounded kernel
  truncations so that no `∞-∞` subtraction occurs. Prove lower semicontinuity, compact
  sublevels, existence and uniqueness of the minimizer, and compactness of its support.
- Prove the empirical-measure LDP at speed `n²`, with rate
  `(β/2)(E_V(μ)-min E_V)`, and deduce convergence to the equilibrium measure.
  Prove logarithmic-kernel truncation bounds, exponential tightness, and recovery
  configurations; the singular diagonal must not be treated as an ordinary continuous kernel.
- Develop the variational characterization: the effective potential
  `V(x)-2∫log|x-y|dμ(y)` is at least the equilibrium constant outside a set of logarithmic
  capacity zero and equals it on the support except for such a set. Define logarithmic
  capacity and justify the exceptional-set statement. For `V=x²/2`, identify the minimizer
  as the standard semicircle and evaluate its energy/normalization constants.
- For the Gaussian beta gas prove the largest-eigenvalue LDP at speed `n` with rate
  `J_β(x)=(β/2)∫₂ˣ sqrt(t²-4)dt` for `x≥2`, and `+∞` for `x<2`.
  Prove exponential tightness, the upper/lower outlier bounds, and the different `n²`
  scale of fixed left-tail events via the constrained equilibrium problem. Do not derive
  the largest-eigenvalue LDP by an invalid weak-topology contraction of empirical measures.

## Milestone 10 — Itô calculus and Dyson Brownian motion

**Sources:** AGZ §4.3.1–4.3.2; T §3.1; PB chs. 8–9. Dependencies: 0–3, 5–6.

- Starting with Mathlib Brownian motion and filtrations, construct finite-dimensional
  Itô integrals for predictable square-integrable integrands, isometry, martingale and
  continuous-version properties, localization, quadratic covariation, and Itô's formula
  for `C²` functions. Construct finite-dimensional vector Brownian motion with independent
  coordinates. Prove local strong existence/pathwise uniqueness for locally Lipschitz SDE
  coefficients up to exit times, stopping/pasting, and the nonexplosion criterion from a
  coercive Lyapunov bound. These targets cover the coefficients below and OU processes.
- Construct Hermitian matrix Brownian motion with entry variances matching Milestone 5.
  For distinct starting eigenvalues, derive the eigenvalue SDE up to the first collision,
  including derivatives of eigenvalues/projectors and the quadratic-variation computation.
  With decreasing order and normalized matrix noise it is
  `dλᵢ=√(2/(βn)) dBᵢ + n⁻¹∑_{j≠i}(λᵢ-λⱼ)⁻¹dt`, for `β=1,2`.
- Construct the same ordered-particle SDE for every real `β≥1`, prove global strong
  existence, uniqueness, no collisions from strictly ordered starts, and continuous
  entrance from coincident deterministic starts by approximation. Prove noncollision
  from a logarithmic-gap argument and nonexplosion from the quadratic Lyapunov estimate.
  For OU drift `-λᵢ/2`, prove the Gaussian beta density invariant, including the boundary
  terms needed to pass from formal generator symmetry to an invariant probability law.
- Prove the empirical-measure evolution against `C_c²` test functions, its martingale
  quadratic-variation estimate, tightness on finite time intervals, and the limiting weak
  equation. For initial empirical laws converging to compactly supported `ν` with uniformly
  bounded initial spectra, identify the Brownian limit at time `t` as `ν⊞SC_t` and prove
  uniqueness via its Stieltjes equation. Include convergence in probability uniformly in
  time on compact intervals in a metric for weak convergence. The OU limit follows by
  deterministic time change and scaling.

## Milestone 11 — Small singular values and the circular law

**Sources:** T §§2.7–2.8; PB §3.1. Dependencies: 0–5.

- Develop the negative-second-moment identity relating singular values to distances of
  rows from the spans of the other rows, distance-to-subspace concentration, compressible
  and incompressible unit-vector decompositions, and small-ball estimates for independent
  sums. Include Littlewood–Offord anti-concentration and the inverse structural estimates
  needed by the polynomial least-singular-value theorem in T §2.8.3; build the finite
  additive-combinatorial covering lemmas used in that argument.
- Prove sharp-scale invertibility for real i.i.d. centered variance-one sub-Gaussian square
  matrices: `P(s_min(X)≤ε/√n) ≤ Cε+exp(-cn)` with constants depending only on the
  sub-Gaussian bound. Include rectangular lower bounds from Milestone 2 and the complex
  circular Gaussian specialization. Keep `X` and `X/√n` thresholds distinct.
- For a fixed nondegenerate centered variance-one complex entry law with finite second
  moment, prove for every `A,C>0` that some `B>0` gives
  `P(s_min(Xₙ+Dₙ)≤n^(-B))≤n^(-A)` for all sufficiently large `n`, uniformly over
  deterministic `‖Dₙ‖op≤n^C`. Constants may depend on the entry law, `A`, and `C`.
  Include the truncation/anti-concentration reduction under finite second moment and the
  intermediate-small-singular-value estimates needed for logarithmic integrability.
- Define the logarithmic potential `U_μ(z)=∫log|z-w|dμ(w)` wherever integrable, and as
  a locally integrable function for finite empirical spectra. Prove Girko hermitization:
  `U_{L_A}(z)=n⁻¹log|det(A-zI)|=n⁻¹∑log sᵢ(A-zI)` almost everywhere in `z`, and
  `ΔU_{L_A}=2πL_A` in distributions. Build the test-function/distributional Laplacian
  interface, local integrability of the logarithmic kernel, and potential convergence theorem.
- Prove convergence of the singular-value laws of `Xₙ/√n-zI` for almost every `z`,
  using Hermitian block linearization, a self-consistent resolvent equation and its
  uniqueness, with Gaussian identification and a finite-variance replacement argument.
  Prove uniform integrability of `log` at zero and infinity, in the forms required for
  probability and almost-sure potential convergence. Weak convergence of singular-value
  laws by itself is not enough.
- Prove the circular law for real or complex i.i.d. entries of fixed law, mean zero and
  second absolute moment 1: `L_{Xₙ/√n}` converges in probability to the uniform unit-disk
  law, and almost surely for the fixed infinite-array realization. Prove the general
  replacement principle ([Tao–Vu–Krishnapur, Theorem 2.1](https://arxiv.org/abs/0807.4898))
  under its explicit normalized Frobenius tightness and
  almost-everywhere log-determinant hypotheses, separately from their verification for i.i.d.
  matrices. Give complex Ginibre as a check against Milestone 5's exact density.

## Dependency order and acceptance

```text
existing Mathlib/Tau Ceti probability and spectral theory
  → 0 (extensions) → 1 (spectral API)
  → 2 (concentration) and 3 (transforms/laws)
finite noncrossing combinatorics → 3, 4, 6
0–3 → 4 (global laws)
0–3 + distribution/Haar dependencies → 5 (exact ensembles)
1,3,5 + combinatorics → 6 (free probability)
1–6 → 7 (covariance and spikes)
1,3,5 + Hermite theory → 8 (Gaussian local statistics)
1,3,5 → 9 (large deviations)
0–3,5–6 → 10 (stochastic dynamics)
0–5 → 11 (circular law)
```

Claim individual APIs or numbered mathematical components, not the entire roadmap.
For each new object supply construction/existence, equality/extensionality, measurability or
continuity, invariances, integration/evaluation, and the basic operations used in its milestone.
For each limit theorem record dimension sequence, entry law and moment assumptions, coupling
across sizes, normalization, topology, and convergence mode in the public statement.
Prove all integrability requirements before evaluating moments, MGFs, or log determinants.

Completion includes all stated milestones and the bridges to dependent roadmaps. Low-degree
checks must recover `E trₙ H²→1`, semicircle fourth moment 2, MP first moment 1 and second
moment `1+y`, MP's zero atom for `y>1`, the `n²` spectral-statistic concentration scale,
and `m=-g` in the Pastur and shrinkage formulas. An empirical-measure theorem cannot stand
in for an extreme-eigenvalue, eigenvector, or local-statistics theorem.
